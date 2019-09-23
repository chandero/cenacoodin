unit UnitMarcarProrroga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Buttons, Mask, DB, IBCustomDataSet,
  IBQuery;

type
  PCuotas = ^Cuotas;
  Cuotas = record
    Agencia : Integer;
    Colocacion : String;
    NoCuota  : Integer;
    Interes_a_Pagar : Currency;
    Capital_a_Pagar : Currency;
    Fecha_a_Pagar : TDate;
    FechaPago: TDate;
end;  
type
  TfrmMarcarProrroga = class(TForm)
    Panel1: TPanel;
    Label31: TLabel;
    EdAgencia: TDBLookupComboBox;
    Label1: TLabel;
    EdNumeroColocacion: TMaskEdit;
    Label2: TLabel;
    EdDias: TEdit;
    Panel2: TPanel;
    CmdNuevo: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQueryColocacion: TIBQuery;
    IBQueryTabla: TIBQuery;
    IBVarios: TIBQuery;
    IBQuery: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure EdAgenciaExit(Sender: TObject);
    procedure EdAgenciaEnter(Sender: TObject);
    procedure EdDiasEnter(Sender: TObject);
    procedure EdDiasExit(Sender: TObject);
    procedure EdNumeroColocacionEnter(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMarcarProrroga: TfrmMarcarProrroga;
  vIdColocacion : String;
  vIdAgencia : Integer;
  CuotasPagadas : TList;
  vDesembolso : Currency;
  vLinea : Integer;
  vValorCuota : Currency;
  vFechaDesembolso : TDate;
  vPeriodoGracia : Integer;
  vTasaEfectiva : Single;
  vPuntosAdicionales : Single;
  vAmortizaCapital : Integer;
  vAmortizaInteres : Integer;
  vPlazo : Integer;
  vCuotaTipo : String;
  vInteresVencido : String;
  vAbonosCapital : Currency;
  vFechaInteres : TDate;
  vFechaCapital : TDate;
  vDiasProrroga : Integer;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitGlobalesCol, UnitDmColocacion;

procedure TfrmMarcarProrroga.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmMarcarProrroga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmMarcarProrroga.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmMarcarProrroga.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;

        EdAgencia.KeyValue := Agencia;
        dmColocacion.IBDSagencias.Open;
        dmColocacion.IBDSagencias.Last;
        dmColocacion.IBDSagencias.First;
        dmColocacion.IBDStipocuota.Open;
        dmColocacion.IBDStipocuota.Last;
        dmColocacion.IBDStipocuota.First;
        CuotasPagadas := Tlist.Create;
        CuotasPagadas.Clear;

end;

procedure TfrmMarcarProrroga.EdNumeroColocacionExit(Sender: TObject);
begin
        vIdColocacion := Trim(EdNumeroColocacion.Text);
end;

procedure TfrmMarcarProrroga.EdAgenciaExit(Sender: TObject);
begin
        vIdAgencia := EdAgencia.KeyValue;
end;

procedure TfrmMarcarProrroga.EdAgenciaEnter(Sender: TObject);
begin
        EdAgencia.KeyValue := Agencia;
end;

procedure TfrmMarcarProrroga.EdDiasEnter(Sender: TObject);
begin
        EdDias.SelectAll;
end;

procedure TfrmMarcarProrroga.EdDiasExit(Sender: TObject);
begin
        vDiasProrroga := strtoint(EdDias.Text);
end;

procedure TfrmMarcarProrroga.EdNumeroColocacionEnter(Sender: TObject);
begin
        EdNumeroColocacion.SelectAll;
end;

procedure TfrmMarcarProrroga.CmdNuevoClick(Sender: TObject);
var
Arecord : PCuotas;
TipoCuota : Integer;
I,J : Integer;
FechaCapital : TDate;
FechaInteres : TDate;
AbonoK : Currency;
EsVivienda : Boolean;
vRedondeo: Boolean;
begin
  vAbonosCapital := 0;
  if DmColocacion.IBDScolocacion.Transaction.InTransaction Then
     DmColocacion.IBDScolocacion.Transaction.CommitRetaining;

  Try
   with IBQueryColocacion do
    begin
      SQL.Clear;
      SQL.Add('SELECT "col$colocacion".ID_COLOCACION,"col$colocacion".ID_LINEA,');
      SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".VALOR_DESEMBOLSO,');
      SQL.Add('"col$colocacion".PLAZO_COLOCACION,"col$colocacion".TIPO_INTERES,');
      SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,"col$colocacion".PUNTOS_INTERES,');
      SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".AMORTIZA_INTERES,');
      SQL.Add('"col$colocacion".PERIODO_GRACIA,"col$colocacion".VALOR_CUOTA,"col$colocacion".ID_TIPO_CUOTA,');
      SQL.Add('"col$colocacion".ABONOS_CAPITAL,"col$colocacion".FECHA_INTERES,"col$colocacion".FECHA_CAPITAL,');
      SQL.Add('"col$tiposcuota".INTERES,"col$tiposcuota".TIPO_CUOTA,"col$lineas".ES_VIVIENDA,');
      SQL.Add('"col$lineas".CF_REDONDEO');
      SQL.Add('FROM ');
      SQL.Add('"col$colocacion"');
      SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
      SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
      SQL.Add('where ID_COLOCACION = :"ID_COLOCACION" and');
      SQL.Add('ID_AGENCIA = :"ID_AGENCIA"');
      ParamByName('ID_COLOCACION').AsString := vIdColocacion;
      ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
      Open;
      vIdColocacion := FieldByName('ID_COLOCACION').AsString;
      vDesembolso := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
      vLinea := FieldByName('ID_LINEA').AsInteger;
      vValorCuota := FieldByName('VALOR_CUOTA').AsCurrency;
      vFechaDesembolso := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
      vPeriodoGracia := FieldByName('PERIODO_GRACIA').AsInteger;
      vTasaEfectiva := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
      vPuntosAdicionales := FieldByName('PUNTOS_INTERES').AsFloat;
      vAmortizaCapital := FieldByName('AMORTIZA_CAPITAL').AsInteger;
      vAmortizaInteres := FieldByNAme('AMORTIZA_INTERES').AsInteger;
      vPlazo := FieldByName('PLAZO_COLOCACION').AsInteger;
      vAbonosCapital := FieldByName('ABONOS_CAPITAL').AsCurrency;
      vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
      vFechaCapital := FieldByName('FECHA_CAPITAL').AsDateTime;
      TipoCuota := FieldByName('ID_TIPO_CUOTA').asInteger;
      vInteresVencido := FieldByName('INTERES').AsString;
      vCuotaTipo := FieldByName('TIPO_CUOTA').AsString;
      EsVivienda := InttoBoolean(FieldByName('ES_VIVIENDA').AsInteger);
      vRedondeo := InttoBoolean(FieldByName('CF_REDONDEO').AsInteger);

      if vInteresVencido = 'V' then
       begin
         FechaCapital := CalculoFecha(vFechaDesembolso,vPeriodoGracia);
         FechaInteres := CalculoFecha(vFechaDesembolso,vPeriodoGracia);
       end
      else
       begin
         FechaCapital := CalculoFecha(vFechaDesembolso,vAmortizaCapital+vPeriodoGracia);
         FechaInteres := CalculoFecha(vFechaDesembolso,vAmortizaInteres+vPeriodoGracia);
       end;

      with IBQueryTabla do
       begin
         sql.Clear;
         sql.Add('Select * ');
         sql.Add('from "col$tablaliquidacion" ');
         sql.Add('where ');
         sql.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
         sql.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION" and');
         sql.Add('"col$tablaliquidacion".PAGADA =:"PAGADA"');
         SQL.Add('order by "col$tablaliquidacion".FECHA_A_PAGAR');
         ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
         ParamByName('ID_COLOCACION').AsString := IBQueryColocacion.FieldByName('ID_COLOCACION').AsString;
         ParamByName('PAGADA').AsInteger := BooleanoToInt(True);
         open;
         While not IBQueryTabla.Eof do
          begin
            New(Arecord);
            Arecord^.Agencia := FieldByName('ID_AGENCIA').AsInteger;
            Arecord^.Colocacion := FieldByName('ID_COLOCACION').AsString;
            Arecord^.NoCuota := FieldByName('CUOTA_NUMERO').AsInteger;
            Arecord^.Interes_a_Pagar := FieldByName('INTERES_A_PAGAR').AsCurrency;
            Arecord^.Capital_a_Pagar := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
            Arecord^.Fecha_a_Pagar := FieldByName('FECHA_A_PAGAR').AsDateTime;
            Arecord^.FechaPago := FieldByName('FECHA_PAGADA').AsDateTime;
            CuotasPagadas.Add(Arecord);
            Next;
          end;
          Close;
       end;

       with IBVarios do
        begin
          sql.Clear;
          sql.Add('delete from "col$tablaliquidacion"');
          sql.Add('where ');
          sql.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
          sql.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION"');
          ParamByname('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
          ParamByname('ID_COLOCACION').AsString := IBQueryColocacion.FieldByName('ID_COLOCACION').AsString;
          Open;
          close;
        end;

       if EsVivienda then
        begin
          vValorCuota := CuotaVivienda(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaCapital);
          CrearTablaLiquidacionVivienda(vIDColocacion,vDesembolso,vValorCuota,
               CalculoFecha(vFechaDesembolso,vDiasProrroga),vTasaEfectiva,vPuntosAdicionales,
               vAmortizaCapital,vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido);
        end
       else
        begin
          if vCuotaTipo = 'V' then
           begin
             vTasaEfectiva := vTasaEfectiva + vPuntosAdicionales;
             vValorCuota := CuotaVariable(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaCapital, vAmortizaInteres, vCuotaTipo);
           end
          else
           begin
             vTasaEfectiva := vTasaEfectiva + vPuntosAdicionales;
             vValorCuota := CuotaFija(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaCapital, vRedondeo);
           end;

          CrearTablaLiquidacion(vIDColocacion,vDesembolso,vValorCuota,
                   CalculoFecha(vFechaDesembolso,vDiasProrroga),vTasaEfectiva,vPuntosAdicionales,
                   vAmortizaCapital,vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido, dmColocacion.IBQuery);
        end;

       with IBVarios do
        begin
          sql.Clear;
          sql.Add('update "col$colocacion" set');
          sql.Add('"col$colocacion"."VALOR_CUOTA" =:"VALOR_CUOTA",');
          SQL.Add('"col$colocacion".DIAS_PRORROGADOS = DIAS_PRORROGADOS + :"DIAS_PRORROGADOS"');
          sql.Add(' where ');
          sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
          ParamByName('ID_COLOCACION').AsString := vIdColocacion;
          ParamByName('VALOR_CUOTA').AsCurrency := vValorCuota;
          ParamByName('DIAS_PRORROGADOS').AsInteger := vDiasProrroga;
          Open;
          Close;
        end;

       For I:=0 to CuotasPagadas.Count - 1 do
        begin
          Arecord := CuotasPagadas.Items[I];
          with IBVarios do
           begin
             sql.Clear;
             sql.Add('update "col$tablaliquidacion" set');
             sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
             sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
             sql.Add(' where ');
             sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
             sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
             sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
             ParamByName('ID_AGENCIA').AsInteger := Arecord^.Agencia;
             ParamByName('ID_COLOCACION').AsString := Arecord^.Colocacion;
             ParamByName('CUOTA_NUMERO').AsInteger := Arecord^.NoCuota;
             ParamByName('PAGADA').AsInteger := BooleanoToInt(True);
             ParamByName('FECHA_PAGADA').AsDate := Arecord^.FechaPago;
             Open;
             Close;
           end;
        end;

       if (CuotasPagadas.Count = 0) and (vAbonosCapital <> 0) then
        begin
          AbonoK := 0;
          with IBQueryTabla do
           begin
             sql.Clear;
             sql.Add('Select * ');
             sql.Add('from "col$tablaliquidacion"');
             sql.Add('where ');
             sql.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
             sql.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION"');
             SQL.Add('order by "col$tablaliquidacion".FECHA_A_PAGAR');
             ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
             ParamByName('ID_COLOCACION').AsString := IBQueryColocacion.FieldByName('ID_COLOCACION').AsString;
             Open;
             Last;
             First;

             while not IBQueryTabla.Eof do
              begin
                AbonoK := AbonoK + FieldByName('CAPITAL_A_PAGAR').AsCurrency;
                if FieldByName('FECHA_A_PAGAR').AsDateTime <= vFechaInteres then
                 begin
                   New(Arecord);
                   Arecord^.Agencia := FieldByName('ID_AGENCIA').AsInteger;
                   Arecord^.Colocacion := FieldByName('ID_COLOCACION').AsString;
                   Arecord^.NoCuota := FieldByName('CUOTA_NUMERO').AsInteger;
                   Arecord^.Interes_a_Pagar := FieldByName('INTERES_A_PAGAR').AsCurrency;
                   Arecord^.Capital_a_Pagar := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
                   Arecord^.Fecha_a_Pagar := FieldByName('FECHA_A_PAGAR').AsDateTime;
                   CuotasPagadas.Add(Arecord);
                   Next;
                 end
                else
                 Close;
              end;
           end;


           For I:=0 to CuotasPagadas.Count - 1 do
            begin
              Arecord := CuotasPagadas.Items[I];
              with IBVarios do
               begin
                 sql.Clear;
                 sql.Add('update "col$tablaliquidacion" set');
                 sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
                 sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
                 sql.Add(' where ');
                 sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                 sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
                 sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
                 ParamByName('ID_AGENCIA').AsInteger := Arecord^.Agencia;
                 ParamByName('ID_COLOCACION').AsString := Arecord^.Colocacion;
                 ParamByName('CUOTA_NUMERO').AsInteger := Arecord^.NoCuota;
                 ParamByName('PAGADA').AsInteger := 1;
                 ParamByName('FECHA_PAGADA').Clear;
                 Open;
                 Close;
               end;
            end;  // fin de for
        end; // fin de Cuotas = 0 y AbonosCapital <> 0

        for J := 0 to (CuotasPagadas.Count - 1) do
         begin
           ARecord := CuotasPagadas.Items[J];
           Dispose(ARecord);
         end;
        CuotasPagadas.Clear;
      Close;
    end;  // Fin With QueryColocacion

   DmColocacion.IBDScolocacion.Transaction.CommitRetaining;
   MessageDlg('Operación Exitosa',mtCustom,[mbOK],0);
   CmdCerrar.SetFocus;
  Except
   DmColocacion.IBDScolocacion.Transaction.RollbackRetaining;
   MessageDlg('Error Al Recuperar Tablas de Liquidación',mtError,[mbOK],0);
  End;

end;
end.
