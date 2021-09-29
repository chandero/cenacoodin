unit UnitRecuperarTablaLiq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DB, IBCustomDataSet, IBQuery,
  DBCtrls, IBSQL;

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
  TfrmRecuperarTablaLiq = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdNumeroColocacionInicial: TMaskEdit;
    Label2: TLabel;
    EdNumeroColocacionFinal: TMaskEdit;
    CmdNuevo: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQueryColocacion: TIBQuery;
    IBQueryTabla: TIBQuery;
    Label31: TLabel;
    IBVarios: TIBQuery;
    EdAgencia: TDBLookupComboBox;
    IBTabla: TIBSQL;
    procedure CmdNuevoClick(Sender: TObject);
    procedure EdNumeroColocacionInicialEnter(Sender: TObject);
    procedure EdNumeroColocacionInicialExit(Sender: TObject);
    procedure EdNumeroColocacionFinalEnter(Sender: TObject);
    procedure EdNumeroColocacionFinalExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroColocacionInicialKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdNumeroColocacionFinalKeyPress(Sender: TObject;
      var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecuperarTablaLiq: TfrmRecuperarTablaLiq;
  vIdColocacionInicial : String;
  vIDColocacionFinal   : String;
  CuotasPagadas : TList;
  vIdColocacion : String;
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


implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitGlobalesCol, UnitDmColocacion, UnitPantallaProgreso;

procedure TfrmRecuperarTablaLiq.CmdNuevoClick(Sender: TObject);
var
Arecord : PCuotas;
TipoCuota : Integer;
I,J : Integer;
FechaCapital : TDate;
FechaInteres : TDate;
AbonoK : Currency;
EsVivienda : Boolean;
Save_Cursor:TCursor;
frmProgreso:TfrmProgreso;
Total:Integer;
vDeudaActual, vDeudaTabla :Currency;
CapitalaPagar:Currency;
begin
  vAbonosCapital := 0;
  if DmColocacion.IBDScolocacion.Transaction.InTransaction Then
     DmColocacion.IBDScolocacion.Transaction.CommitRetaining;

  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  with IBVarios do
   begin
     SQL.Clear;
     SQL.Add('SELECT count(*) AS TOTAL');
     SQL.Add('FROM ');
     SQL.Add('"col$colocacion"');
     SQL.Add(' where (ID_COLOCACION >= :"ID_COLOCACION_INICIAL" and ID_COLOCACION <= :"ID_COLOCACION_FINAL") and');
//     SQL.Add('ID_TIPO_CUOTA = 2 and');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA"');
     ParamByName('ID_COLOCACION_INICIAL').AsString := vIdColocacionInicial;
     ParamByName('ID_COLOCACION_FINAL').AsString := vIdColocacionFinal;
     ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
     Open;
     Total := FieldByName('TOTAL').AsInteger;
     Close;
   end;

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
      SQL.Add('"col$tiposcuota".INTERES,"col$tiposcuota".TIPO_CUOTA,"col$lineas".ES_VIVIENDA');
      SQL.Add('FROM ');
      SQL.Add('"col$colocacion"');
      SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
      SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
      SQL.Add(' where');
      SQL.Add('(ID_COLOCACION >= :"ID_COLOCACION_INICIAL" and ID_COLOCACION <= :"ID_COLOCACION_FINAL") and');
//      SQL.Add('ID_TIPO_CUOTA = 2 and ID_AGENCIA = :ID_AGENCIA');
      SQL.Add('ID_AGENCIA = :ID_AGENCIA');
      ParamByName('ID_COLOCACION_INICIAL').AsString := vIdColocacionInicial;
      ParamByName('ID_COLOCACION_FINAL').AsString := vIdColocacionFinal;
      ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
      Open;

      while not IBQueryColocacion.Eof do
       begin
         frmProgreso := TfrmProgreso.Create(self);
         frmProgreso.Titulo := 'Buscando Colocaciones';
         frmProgreso.Min := 0;
         frmProgreso.Max := Total;
         frmProgreso.Position := 0;
         frmProgreso.Ejecutar;
         while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
            Application.ProcessMessages;
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
            vDeudaActual := vDesembolso - vAbonosCapital;


{            if vInteresVencido = 'V' then
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
               ParamByName('PAGADA').AsInteger := 1;
               open;
               IBQueryTabla.RecordCount;
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
             end; }

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
                           CalculoFecha(vFechaDesembolso,vPeriodoGracia),vTasaEfectiva,vPuntosAdicionales,
                           vAmortizaCapital,vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido);
             end
            else
             begin
               if vCuotaTipo = 'V' then
                begin
             //     vTasaEfectiva := vTasaEfectiva + vPuntosAdicionales;
                  vValorCuota := CuotaVariable(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaCapital)
                end
               else
                begin
         //         vTasaEfectiva := vTasaEfectiva + vPuntosAdicionales;
                  vValorCuota := CuotaFija(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaCapital);
                end;

               CrearTablaLiquidacion(vIDColocacion,vDesembolso,vValorCuota,
                        CalculoFecha(vFechaDesembolso,vPeriodoGracia),vTasaEfectiva,vPuntosAdicionales,
                        vAmortizaCapital,vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido);

//                    CrearTablaLiquidacionP_Mod(VidColocacion,vDesembolso,vValorCuota,
//                       vFechaDesembolso,vTasaEfectiva,vPuntosAdicionales,vAmortizaCapital,
//                       vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido,vPeriodoGracia);
             end;

             fechacapital := CalculoFecha(vFechaDesembolso,vAmortizaCapital);
             with IBVarios do begin
               Close;
               SQL.Clear;
               SQL.Add('select * from "col$tablaliquidacion" where');
               SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
               SQL.Add('order by FECHA_A_PAGAR');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_COLOCACION').AsString := vIdColocacion;
               Open;
               vDeudaTabla := vDesembolso;
               while not Eof do begin
                 CapitalaPagar := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
                 vDeudaTabla := vDeudaTabla - CapitalaPagar;
                 if vDeudaTabla >= vDeudaActual then begin
                   if CapitalaPagar > 0 then begin
                      IBTabla.Close;
                      IBTabla.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      IBTabla.ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                      IBTabla.ParamByName('CUOTA_NUMERO').AsInteger := FieldByName('CUOTA_NUMERO').AsInteger;
                      IBTabla.ExecQuery;
                      IBTabla.Close;
                      if TipoCuota = 2 then
                        fechacapital := CalculoFecha(FieldByName('FECHA_A_PAGAR').AsDateTime,vAmortizaCapital)
                      else fechacapital := FieldByName('FECHA_A_PAGAR').AsDateTime;
                   end
                   else
                   if FieldByName('FECHA_A_PAGAR').AsDateTime <= vFechaInteres then begin
                     IBTabla.Close;
                     IBTabla.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBTabla.ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                     IBTabla.ParamByName('CUOTA_NUMERO').AsInteger := FieldByName('CUOTA_NUMERO').AsInteger;
                     IBTabla.ExecQuery;
                     IBTabla.Close;
                   end;
                 end;
                 Next;
               end;   // fin de while Tabla Liquidacion
             end;

            with IBVarios do
             begin
               Close;
               sql.Clear;
               sql.Add('update "col$colocacion" set');
               sql.Add('"col$colocacion".FECHA_CAPITAL =:FECHA_CAPITAL');
               sql.Add(' where ');
               sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
               sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
               ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
               ParamByName('ID_COLOCACION').AsString := vIdColocacion;
               ParamByName('FECHA_CAPITAL').AsDate := fechacapital;
               Open;
               Close;
             end;
{            with IBVarios do
             begin
               sql.Clear;
               sql.Add('update "col$colocacion" set');
               sql.Add('"col$colocacion"."VALOR_CUOTA" =:"VALOR_CUOTA"');
               sql.Add(' where ');
               sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
               sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
               ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
               ParamByName('ID_COLOCACION').AsString := vIdColocacion;
               ParamByName('VALOR_CUOTA').AsCurrency := vValorCuota;
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
                  ParamByName('PAGADA').AsInteger := 1;
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
                  sql.Add('from "col$tablaliquidacion" ');
                  sql.Add('where ');
                  sql.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
                  sql.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION"');
                  ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
                  ParamByName('ID_COLOCACION').AsString := IBQueryColocacion.FieldByName('ID_COLOCACION').AsString;
                  Open;
                  Last;
                  First;

                  while not IBQueryTabla.Eof do
                   begin
                     AbonoK := AbonoK + FieldByName('CAPITAL_A_PAGAR').AsCurrency;
//                     if (AbonoK <= vAbonosCapital) and (FieldByName('FECHA_A_PAGAR').AsDateTime <= vFechaInteres) then
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
                     ParamByName('PAGADA').AsInteger := BooleanoToInt(True);
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
            CuotasPagadas.Clear;}
            next;
          end; // fin while progreso
         frmProgreso.Cerrar;
         Screen.Cursor := Save_Cursor;
       end; // Fin While QueryColocacion.eof
      Close;
    end;  // Fin With QueryColocacion

   DmColocacion.IBDScolocacion.Transaction.CommitRetaining;
   MessageDlg('Operación Exitosa',mtCustom,[mbOK],0);
   CmdCerrar.SetFocus;
  Except
   DmColocacion.IBDScolocacion.Transaction.RollbackRetaining;
   MessageDlg('Error Al Recuperar Tablas de Liquidación',mtError,[mbOK],0);
   EdNumeroColocacionInicial.SetFocus;
  End;

 Screen.Cursor := Save_Cursor;
end;

procedure TfrmRecuperarTablaLiq.EdNumeroColocacionInicialEnter(Sender: TObject);
begin
        EdNumeroColocacionInicial.Text := vIdColocacionInicial;
end;

procedure TfrmRecuperarTablaLiq.EdNumeroColocacionInicialExit(
  Sender: TObject);
begin
        vIdColocacionInicial := trim(EdNumeroColocacionInicial.Text);
end;

procedure TfrmRecuperarTablaLiq.EdNumeroColocacionFinalEnter(
  Sender: TObject);
begin
        EdNumeroColocacionFinal.Text := vIdColocacionFinal;
end;

procedure TfrmRecuperarTablaLiq.EdNumeroColocacionFinalExit(
  Sender: TObject);
begin
        vIdColocacionFinal := trim(EdNumeroColocacionFinal.Text);
end;

procedure TfrmRecuperarTablaLiq.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRecuperarTablaLiq.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmRecuperarTablaLiq.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Commit;
         DmGeneral.IBTransaction1.StartTransaction;
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

procedure TfrmRecuperarTablaLiq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmRecuperarTablaLiq.EdAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRecuperarTablaLiq.EdNumeroColocacionInicialKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRecuperarTablaLiq.EdNumeroColocacionFinalKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRecuperarTablaLiq.CmdCerrarClick(Sender: TObject);
begin
        Self.Close;
end;

end.
