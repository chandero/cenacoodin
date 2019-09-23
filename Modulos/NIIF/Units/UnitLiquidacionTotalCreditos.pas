unit UnitLiquidacionTotalCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, IBSQL, DB, IBCustomDataSet, IBQuery,
  ExtCtrls, DateUtils;

type
  TfrmLiquidacionTotalCreditos = class(TForm)
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label31: TLabel;
    Label8: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label19: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    EdNumeroColocacion: TMemo;
    EdNumeroIdentificacion: TStaticText;
    EdNombre: TStaticText;
    CmdBuscar: TBitBtn;
    EdAgencia: TDBLookupComboBox;
    EdSaldocolocacion: TStaticText;
    EdFechaCapital: TStaticText;
    EdFechaInteres: TStaticText;
    EdFecha: TStaticText;
    EdEstado: TStaticText;
    EdCostas: TStaticText;
    EdHonorarios: TStaticText;
    GroupBox1: TGroupBox;
    IBQuery: TIBQuery;
    IBSQL2: TIBSQL;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdInforme: TBitBtn;
    BtnCerrar: TBitBtn;
    CmdReversar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBSaldo: TIBSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLiquidacionTotalCreditos: TfrmLiquidacionTotalCreditos;
  Colocacion:string;
  Saldo:Currency;
  Costas:Currency;
  Honorarios:Currency;
  vTipoId : Integer;
  vNumeroId : String;
  vTotalLiquidacion:Currency;
  DescImpuesto : Currency;
  Clasificacion : Integer;
  Garantia : Integer;
  Categoria : String;
  TipoCuota : integer;
  Amortizacion : integer;
  AmortizaK : Integer;
  DescripcionEstado : string;
  vTipoCuota:Integer;
  vTipoInteres:string;
  FechaInteres : TDate;
  vTotalAhorros:Currency;
  NumeroCuenta:Integer;
  DigitoCuenta:Integer;
  SaldoAhorros:Currency;
  Movimiento:Currency;
  TotalCanje:Currency;
  
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitdmColocacion, UnitGlobales, UnitBuscarColocacion,
     UnitVistaPreliminar, UnitGlobalesCol;

procedure TfrmLiquidacionTotalCreditos.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmLiquidacionTotalCreditos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmLiquidacionTotalCreditos.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLiquidacionTotalCreditos.CmdBuscarClick(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;
end;

procedure TfrmLiquidacionTotalCreditos.FormShow(Sender: TObject);
begin
        if DmColocacion.IBDSagencias.Transaction.InTransaction then
         begin
           DmColocacion.IBDSagencias.Transaction.Commit;
           Dmcolocacion.IBDSagencias.Transaction.StartTransaction;
         end;
        DmColocacion.IBDSagencias.Open;
        DmColocacion.IBDSagencias.Last;
        DmColocacion.IBDSagencias.First;
        EdAgencia.KeyValue := Agencia;
        EdFecha.Caption := FormatDateTime('yyyy/mm/dd',Date);        
        Inicializar;
end;

procedure TfrmLiquidacionTotalCreditos.EdNumeroColocacionExit(Sender: TObject);
begin
         if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
           Colocacion := trim(EdNumeroColocacion.Text);
           EdNumeroColocacion.Text := Colocacion;

        If EdNumeroColocacion.Text = '' then Exit;

        with IBQuery do
        begin
               SQL.Clear;
                SQL.Add('SELECT ');
                SQL.Add('"col$colocacion".ID_AGENCIA,');
                SQL.Add('"col$colocacion".ID_COLOCACION,');
                SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
                SQL.Add('"col$colocacion".ID_PERSONA,');
                SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
                SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
                SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO_ACTUAL,');
                SQL.Add('"col$colocacion".ID_CLASIFICACION,');
                SQL.Add('"col$colocacion".ID_GARANTIA,');
                SQL.Add('"col$colocacion".ID_CATEGORIA,');
                SQL.Add('"col$colocacion".VALOR_CUOTA,');
                SQL.Add('"col$colocacion".FECHA_CAPITAL,');
                SQL.Add('"col$colocacion".FECHA_INTERES,');
                SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
                SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
                SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
                SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
                SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
                SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
                SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
                SQL.Add('"col$tiposcuota".INTERES,');
                SQL.Add('"gen$persona".NOMBRE,');
                SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION ');                SQL.Add(' FROM ');
                SQL.Add('"col$colocacion" ');
                SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION) ');
                SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION) ');
                SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA) ');
                SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
                SQL.Add('LEFT OUTER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) ');
                SQL.Add(' JOIN "gen$tiposidentificacion" ON ("col$colocacion".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION) ');
                SQL.Add(' WHERE ');
                SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
                SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');

                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := Colocacion;
                Open;


                Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
                Garantia := FieldByName('ID_GARANTIA').AsInteger;
                Categoria := FieldByName('ID_CATEGORIA').AsString;
                DescripcionEstado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                TipoCuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
                FechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                vTipoInteres := FieldByName('INTERES').AsString;

                if RecordCount > 0 then
                begin
                      vTipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
                      vNumeroId := FieldByName('ID_PERSONA').AsString ;
                      EdNumeroIdentificacion.Caption := FieldByName('ID_IDENTIFICACION').AsString + '-' + FieldByName('ID_PERSONA').AsString ;
                      EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
                      EdSaldoColocacion.Caption := FormatCurr('#,#0',vSaldoActual);
                      EdFechaCapital.Caption := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                      EdFechaInteres.Caption := DateToStr(FechaInteres);
                      EdEstado.Caption := DescripcionEstado;
                Close;
                with IBSQL2 do
                 begin
                   SQL.Clear;
                   SQL.Add('select sum("col$costas".VALOR_COSTAS) as COSTAS,');
                   SQL.Add('sum("col$costas".VALOR_HONORARIOS) as HONORARIOS');
                   SQL.Add('FROM "col$costas" WHERE');
                   SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND');
                   SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');
                   ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   ParamByName('ID_COLOCACION').AsString := vColocacion;
                   ExecQuery;
                   Costas := FieldByName('COSTAS').AsCurrency;
                   Honorarios := FieldByName('HONORARIOS').AsCurrency;
                   EdCostas.Caption := FormatCurr('#,#0',Costas);
                   EdHonorarios.Caption := FormatCurr('#,#0',Honorarios);
                   Close;
                 end;
                end
                else
                begin
                  MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                  EdNumeroColocacion.SetFocus;
                end;
        end;
end;

procedure TfrmLiquidacionTotalCreditos.Inicializar;
begin
end;

procedure TfrmLiquidacionTotalCreditos.CmdAceptarClick(Sender: TObject);
var
FechaCorte : TDate;
FechaA : TDate;
FechaB : TDate;
begin
//**
        vTasaDevCob := 0;
        vTasaCobradoCausado := 0;
        vTasaCobradoCorriente := 0;
        totaldebitos := 0;
        totalcreditos := 0;
        Empleado;

  with IBSaldo do
   begin
     Close;
     sql.Clear;
     Sql.Add('select distinct');
     Sql.Add('"cap$maestrotitular".NUMERO_CUENTA,');
     Sql.Add('"cap$maestrotitular".DIGITO_CUENTA,');
     SQL.Add('"cap$maestro".ID_ESTADO,');
     SQL.Add('"cap$tiposestado".SE_SUMA');
     Sql.Add('from "cap$maestrotitular"');
     SQL.Add('inner join "cap$maestro" on ');
     SQL.Add('("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and ');
     SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and ');
     SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and ');
     SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
     SQL.Add('inner join "cap$tiposestado" on ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
     Sql.Add('where');
     Sql.Add('"cap$maestrotitular".ID_IDENTIFICACION =:"ID_IDENTIFICACION" and');
     Sql.Add('"cap$maestrotitular".ID_PERSONA =:"ID_PERSONA" and ');
     Sql.Add('"cap$maestrotitular".ID_TIPO_CAPTACION =:"ID_TIPO_CAPTACION" and ');
     SQL.Add('"cap$maestrotitular".NUMERO_TITULAR =:"NUMERO_TITULAR" and ');
     SQL.Add('"cap$maestrotitular".TIPO_TITULAR = 1 and');
     SQL.Add('"cap$tiposestado".SE_SUMA = 1');
     ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
     ParamByName('ID_PERSONA').AsString := vNumeroId;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('NUMERO_TITULAR').AsInteger := 1;
     ExecQuery;
     NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     DigitoCuenta := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;

     SQL.Clear;
     SQL.Add('Select "cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestro"');
     SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestro".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND');
     SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
     SQL.Add('Where');
     SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
     SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
     SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
     SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
     SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
     ParamByName('ANO').AsString := IntToStr(YearOf(Date));
     try
      ExecQuery;
      if RecordCount < 1 then
        SaldoAhorros := 0
      else
        SaldoAhorros := FieldByName('SALDO_INICIAL').AsCurrency;
     except
      MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
      Exit;
     end;

     Close;
     SQL.Clear;
     SQL.Add('SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS MOVIMIENTO from "cap$maestro"');
     SQL.Add('LEFT JOIN "cap$extracto" ON ("cap$maestro".ID_AGENCIA = "cap$extracto".ID_AGENCIA) AND ');
     SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$extracto".ID_TIPO_CAPTACION) AND ');
     SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$extracto".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$extracto".DIGITO_CUENTA)');
     SQL.Add('Where');
     SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
     SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
     SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
     SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
     SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
     ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
     ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
      try
       ExecQuery;
       if RecordCount < 1 then
        Movimiento := 0
       else
        Movimiento := FieldByName('MOVIMIENTO').AsCurrency;
       except
        MessageDlg('Error Consultando Movimientos',mtError,[mbcancel],0);
        Movimiento := 0;
       end;
     Close;

     SQL.Clear;
     SQL.Add('SELECT SUM(VALOR_CHEQUE) as CHEQUES from "cap$canje"');
     SQL.Add('where ');
     SQL.Add('NUMERO_CUENTA =:"NUMERO_CUENTA" and');
     SQL.Add('DIGITO_CUENTA =:"DIGITO_CUENTA" and');
     SQL.Add('LIBERADO = 0 and DEVUELTO = 0');
     ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
     try
      ExecQuery;
      if RecordCount < 1 then
       TotalCanje := 0
      else
       TotalCanje := FieldByName('CHEQUES').AsCurrency;
      except
       MessageDlg('Error Consultando Canjes',mtError,[mbcancel],0);
       TotalCanje := 0;
      end;
      Close;

     vTotalAhorros := (SaldoAhorros + Movimiento) - TotalCanje;;
   end;
        with dmColocacion.IBSQL do
        begin
           SQL.Clear;
           SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 2');
           ExecQuery;
           CodigoAhorros := FieldByName('CODIGO_CONTABLE').AsString;
           Close;

           SQL.Clear;
           SQL.Add('Select first 1 * ');
           SQL.Add('from "col$tablaliquidacion"');
           SQL.Add('where');
           SQL.Add('"col$tablaliquidacion".PAGADA = 0 and "col$tablaliquidacion".ID_COLOCACION = :ID_COLOCACION');
           SQL.Add('order by "col$tablaliquidacion".CUOTA_NUMERO ASC');
           ParamByName('ID_COLOCACION').AsString := vColocacion;
           ExecQuery;
           CuotaTabla := FieldByName('CUOTA_NUMERO').AsInteger;
           FechaTabla := FieldByName('FECHA_A_PAGAR').AsDateTime;
           CapitalaPagar := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
           InteresaPagar := FieldByName('INTERES_A_PAGAR').AsCurrency;
           Close;

           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('"col$colocacion".FECHA_CAPITAL,');
           SQL.Add('"col$colocacion".FECHA_INTERES');
           SQL.Add(' FROM ');
           SQL.Add('"col$colocacion" ');
           SQL.Add(' WHERE ');
           SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
           SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := vColocacion;
           execQuery;
           FechaIntAnt := FieldByName('FECHA_INTERES').AsDateTime;
           FechaCapAnt := FieldByName('FECHA_CAPITAL').AsDateTime;
           Close;
        end;

        with dmColocacion.IBSQLcodigos do
        try
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$codigospuc" where ');
                SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
                SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
                SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
                ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
                ParamByName('ID_GARANTIA').AsInteger      := Garantia;
                ParamByName('ID_CATEGORIA').AsString     := Categoria;
                ExecQuery;
//**


        MyCuotasLiq.Lista := TList.Create;
        if Saldo <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
           AR^.FechaInicial := strtodate(EdFecha.Caption);
           AR^.FechaFinal   := strtodate(EdFecha.Caption);
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := saldo;
           AR^.EsCapital := True;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

         FechaA := RecodeDay(StrToDate(EdFecha.Caption),01);
         FechaB := RecodeDay(FechaInteres,01);

         if (FechaInteres <= StrToDate(EdFecha.Caption)) and (FechaA = FechaB) then
         

        if vInteresDevuelto <> 0 then
         begin
           New(AR);
           devolucion := True;
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
           AR^.FechaInicial := vFechaInicialDevuelto;
           AR^.FechaFinal   := vFechaFinalDevuelto;
           AR^.Dias := diasentre(vfechainicialdevuelto,vfechafinaldevuelto);
           AR^.Tasa := vTasaDevolucion;
           AR^.Debito := vInteresDevuelto;
           AR^.Credito := 0;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := True;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := FechaIntAnt; //AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
           vTasaDevCob := AR^.Tasa;
         end;

        if vInteresCobradoCausado <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString;
           AR^.FechaInicial := vFechaInicialCobradoCausado;
           AR^.FechaFinal   := vFechaFinalCobradoCausado;
           AR^.Dias := vDiasCobradoCausado; //DiasEntre(vFechaInicialCobradoCausado,vFechaFinalCobradoCausado);
           AR^.Tasa := vTasaCobradoCausado;
           AR^.Debito := 0;
           AR^.Credito := vInteresCobradoCausado;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := FechaIntAnt; //AR^.FechaFinal;
           AR^.EsCapital := False;
           AR^.EsCausado := True;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

        if vInteresCobradoCorriente <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;
           AR^.FechaInicial := vFechaInicialCobradoCorriente;
           AR^.FechaFinal   := vFechaFinalCobradoCorriente;
           AR^.Dias := vDiasCobradoCorriente; //DiasEntre(vFechaInicialCobradoCorriente,vFechaFinalCobradoCorriente);
           AR^.Tasa := vTasaCobradoCorriente;
           AR^.Debito := 0;
           AR^.Credito := vInteresCobradoCorriente;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := FechaIntAnt; //AR^.FechaFinal;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

         vInteresCobrado := vInteresCobradoCausado + vInteresCobradoCorriente;
         if vInteresCobrado > 0 then
            vTasaDevCob := (vTasaCobradoCausado + vTasaCobradoCorriente) / (vDiasCobradoCausado + vDiasCobradoCorriente);

        if vAbonoInteresCausado <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString;
           AR^.FechaInicial := vFechaInicialCausado;
           AR^.FechaFinal := vFechaFinalCausado;
//           vDiasCausado := DiasEntre(vFechaInicialCausado,vFechaFinalCausado);
           if vDiasCausado <= 0  then
            begin
              MessageDlg('Error en Fechas, Favor Verificar',mtInformation,[mbOK],0);
              IBQuery.Transaction.RollbackRetaining;
              Exit;
            end;
           AR^.Dias := vDiasCausado;
           AR^.Tasa := vTasaCausado;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresCausado;
           TasaLiquidacion := Tasa;
           AR^.EsCapital := False;
           AR^.EsCausado := True;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

        if vAbonoInteresContingente <> 0 then
        begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;
          AR^.FechaInicial := vFechaInicialContingente;
          AR^.FechaFinal := vFechaFinalContingente;
 //         vDiasContingente := DiasEntre(vFechaInicialContingente,vFechaFinalContingente);
          if vDiasContingente <= 0 then
           begin
             MessageDlg('Error en Fecha, Favor Verificar',mtInformation,[mbok],0);
             Exit;
           end;
          AR^.Dias := vDiasContingente;
          AR^.Tasa := vTasaContingente;
          AR^.Debito := 0;
          AR^.Credito := vAbonoInteresContingente;
          TasaLiquidacion := Tasa;
          AR^.EsCapital := False;
          AR^.EsCapital := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;


        if vAbonoInteresCorriente <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;
           AR^.FechaInicial := vFechaInicialCorriente;
           AR^.FechaFinal := vFechaFinalCorriente;
//           vDiasCorriente := DiasEntre(vFechaInicialCorriente,vFechaFinalCorriente);
           if vDiasCorriente <= 0  then
            begin
              MessageDlg('Error en Fechas, Favor Verificar',mtInformation,[mbOK],0);
              IBQuery.Transaction.RollbackRetaining;
              Exit;
            end;
           AR^.Dias := vDiasCorriente;
           AR^.Tasa := vTasaCorriente;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresCorriente;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := True;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           TasaLiquidacion := Tasa;
//           GrabarExtractoDet;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

        if vAbonoInteresAnticipado <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
           AR^.FechaInicial := vFechaInicialAnticipado;
           AR^.FechaFinal := vFechaFinalAnticipado;
//           vDiasAnticipado := DiasEntre(vFechaInicialAnticipado,vFechaFinalAnticipado);
           if vDiasAnticipado <= 0  then
            begin
              MessageDlg('Error en Fechas, Favor Verificar',mtInformation,[mbOK],0);
              IBQuery.Transaction.RollbackRetaining;
              Exit;
            end;
           AR^.Dias := vDiasAnticipado;
           AR^.Tasa := vTasaAnticipado;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresAnticipado;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := True;
           AR^.EsDevuelto := False;
           TasaLiquidacion := Tasa;
//           GrabarExtractoDet;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

        if vAbonoInteresMora <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;
           AR^.FechaInicial := vFechaInicialMora;
           AR^.FechaFinal := vFechaFinalMora;
           AR^.Dias := vDiasMora;
           AR^.Tasa := vTasaMora;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresMora;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := True;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           TasaLiquidacion := Tasa;
//           GrabarExtractoDet;
//           vFechaIInt := FechaInicial;
//           vFechaFInt := FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;



//          if (EsCapital.Checked = True) and (EsIntereses.Checked = False) then
//             vFechaFInt := FechaIntAnt;

        if vcostas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString;
           AR^.FechaInicial := StrToDate(EdFecha.Caption);
           AR^.FechaFinal := StrToDate(EdFecha.Caption);
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vcostas;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           TasaLiquidacion := 0;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;

{        if vhonorarios <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoCaja;
           AR^.FechaInicial := StrToDate(EdFecha.Caption);
           AR^.FechaFinal := StrToDate(EdFecha.Caption);
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vhonorarios;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           TasaLiquidacion := 0;
//           GrabarExtractoDet;
//           vFechaIInt := FechaInicial;
//           vFechaFInt := FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;    }

// Coloco Caja
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoAhorros;
          AR^.FechaInicial := Date;
          AR^.FechaFinal   := Date;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCreditos - TotalDebitos;
          AR^.Credito      := 0;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          vTotalLiquidacion := AR^.Debito;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
          TotalDebitos := 0;
          TotalCreditos := 0;

        if vTotalLiquidacion > vTotalAhorros then
         begin
           MessageDlg('No posee suficientes fondos para realizar el descuento',mtError,[mbOK],0);
           CmdReversar.Click;
           Exit;
         end;

         TGeneral := vTotalLiquidacion;
         
         if  MyCuotasLiq.Lista.Count > 0 then
          for I := 0 to MyCuotasLiq.Lista.Count -1 do
          begin
                AR := MyCuotasLiq.Lista.Items[i];
                if AR^.EsCausado or AR^.EsCorriente or AR^.EsAnticipado then
                 begin
                   SumTasa := SumTasa + (AR^.Tasa * AR^.Dias);
                   SumDias := SumDias + AR^.Dias;
                 end;
          end;
          try
            TasaLiquidacion := SumTasa / SumDias;
          except
            TasaLiquidacion := Tasa;
          end;

        vTotalInteres := vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente + vAbonointeresAnticipado;

        CmdInforme.Enabled := True;
        DmColocacion.IBSQLcodigos.Close;

        CmdInforme.Enabled := True;
        CmdReversar.Visible := True;
        CmdGrabar.Enabled := True;
        CmdGrabar.Visible := True;
        CmdGrabar.SetFocus;
        CmdAceptar.Visible := False;
        CmdAceptar.Enabled := False;

end;

end.
