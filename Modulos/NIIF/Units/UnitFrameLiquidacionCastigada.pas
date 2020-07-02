unit UnitFrameLiquidacionCastigada;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBClient, IBSQL, pr_Common, pr_TxClasses, IBCustomDataSet, IBQuery,
  ExtCtrls, ComCtrls, StdCtrls, Mask, DBCtrls, Buttons;

type
     PCuotasLiq = ^ACuotasLiq;
     ACuotasLiq = record
         CuotaNumero:Integer;
         CodigoPuc:string;
         FechaInicial:TDate;
         FechaFinal:TDate;
         Dias:Integer;
         Tasa:Double;
         Debito:Currency;
         Credito:Currency;
         EsCapital   :Boolean;
         EsCausado   :Boolean;
         EsCorriente :Boolean;
         EsVencido   :Boolean;
         EsAnticipado:Boolean;
         EsDevuelto  :Boolean;
     end;

type TCuotasLiq = record
     Lista:TList;
     FechaProx:TDate;
     NuevoSaldo:Currency;
     InteresesHasta:TDate;
     CapitalHasta:TDate;
     Liquidado:Boolean;
end;

type
  TFrameLiquidacionCastigada = class(TFrame)
    Label7: TLabel;
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
    Label9: TLabel;
    Label124: TLabel;
    EdNocomprobante: TMaskEdit;
    EdTotalColManual: TStaticText;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label121: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    EdAbonoCapital: TEdit;
    EdAbonoInteres: TLabeledEdit;
    EdFechaInicial: TDateTimePicker;
    EdFechaFinal: TDateTimePicker;
    EdDiasAplicados: TLabeledEdit;
    EdTasaAplicada: TLabeledEdit;
    EdAbonoCostas: TLabeledEdit;
    EdAbonoHonorarios: TLabeledEdit;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdInforme: TBitBtn;
    CmdReversar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBQuery: TIBQuery;
    Report: TprTxReport;
    IBSaldo: TIBSQL;
    IBExtractoDet: TIBSQL;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBInforme: TClientDataSet;
    IBInformeCUOTA: TIntegerField;
    IBInformeCODIGO: TStringField;
    IBInformeNOMBRE: TStringField;
    IBInformeID_AGENCIA: TIntegerField;
    IBInformeFECHA_INICIAL: TDateField;
    IBInformeFECHA_FINAL: TDateField;
    IBInformeDIAS: TIntegerField;
    IBInformeTASA: TFloatField;
    IBInformeDEBITO: TCurrencyField;
    IBInformeCREDITO: TCurrencyField;
    IBCodigo: TIBQuery;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure EdNocomprobanteExit(Sender: TObject);
    procedure EdAbonoCapitalExit(Sender: TObject);
    procedure EdAbonoInteresExit(Sender: TObject);
    procedure EdAbonoCostasExit(Sender: TObject);
    procedure EdDiasAplicadosChange(Sender: TObject);
    procedure EdDiasAplicadosExit(Sender: TObject);
    procedure EdTasaAplicadaExit(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure CmdReversarClick(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vColocacion : string;
  vComprobante : string;
  vAbonocapital : currency;
  vAbonoInteres : Currency;
  vFechaInteres           : TDate;
  vFechaCapital           : TDate;
  vFechaInicialInteres    : TDate;
  vFechaFinalInteres      : TDate;
  vDias                   : Integer;
  vTasa                   : Single;
  vSaldoActual            : Currency;
  vTipoInteres            : string;
  Clasificacion           : Integer;
  Garantia                : Integer;
  Categoria               : String;
  TipoCuota               : integer;
  Amortizacion            : integer;
  AmortizaK               : Integer;
  CodigoPuc               : String;
  FechaInicial            : TDate;
  FechaFinal              : TDate;
  Caja                    : Currency;
  Debito                  : Currency;
  Credito                 : Currency;
  FechaInteres            : TDate;
  vValorCuota             : Currency;
  Estado                  : Integer;
  DescripcionEstado       : string;
  CuotaTabla              : Integer;
  FechaTabla              : TDate;
  CapitalaPagar           : Currency;
  InteresaPagar           : Currency;
  vTotalInteres           : Currency;
  vTipoId                 : Integer;
  vNumeroId               : string;
  Consecutivo             : Integer;
  totaldebitos            : currency;
  totalcreditos           : Currency;
  NumeroCuenta            : Integer;
  DigitoCuenta            : Integer;
  vTotalAhorros           : Currency;
  vTotalLiquidacion       : Currency;
  vComprobanteTmp         : Integer;
  FechaIntAnt             : TDate;
  FechaCapAnt             : TDate;
  vFechaIInt              : TDate;
  vFechaFInt              : TDate;
  ValorDesembolsoCol      : Currency;
  SaldoActualCol          : Currency;

  vhonorarios    : currency;
  vcostas        : Currency;

  TGeneral : Currency;
  abono_capital : currency;
  Cuota_anterior : integer;
  cambio : Boolean;
  MyCuotasLiq : TCuotasLiq;
  AR : PCuotasLiq;
  

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitBuscarColocacion;

procedure TFrameLiquidacionCastigada.EdNumeroColocacionExit(
  Sender: TObject);
begin
         if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
           vColocacion := trim(EdNumeroColocacion.Text);
           EdNumeroColocacion.Text := vColocacion;

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
                ParamByName('ID_COLOCACION').AsString := vColocacion;
                Open;

                if FieldByName('ID_ESTADO_COLOCACION').AsInteger <> 3 then
                 begin
                   MessageDlg('Esta Colocación no está Castigada',mtError,[mbOK],0);
                   EdNumeroColocacion.SetFocus;
                   Exit;
                 end;

                Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
                Garantia := FieldByName('ID_GARANTIA').AsInteger;
                Categoria := FieldByName('ID_CATEGORIA').AsString;
                DescripcionEstado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                TipoCuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
                Amortizacion := FieldByName('AMORTIZA_INTERES').AsInteger;
                AmortizaK := FieldByName('AMORTIZA_CAPITAL').AsInteger;
                FechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                vTipoInteres := FieldByName('INTERES').AsString;

                if RecordCount > 0 then
                begin
                      vTipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
                      vNumeroId := FieldByName('ID_PERSONA').AsString ;
                      SaldoActualCol := FieldByName('SALDO_ACTUAL').AsCurrency;
                      ValorDesembolsoCol := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
//                      EdTipoIdentificacion.Caption := FieldByName('DESCRIPCION_IDENTIFICACION').AsString ;
                      EdNumeroIdentificacion.Caption := FieldByName('ID_IDENTIFICACION').AsString + '-' + FieldByName('ID_PERSONA').AsString ;
                      EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      vSaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
                      EdSaldoColocacion.Caption := FormatCurr('#,#0',vSaldoActual);
                      vFechaCapital := FieldByname('FECHA_CAPITAL').AsDateTime;
                      vValorCuota := FieldByName('VALOR_CUOTA').AsCurrency;
                      EdFechaCapital.Caption := DateToStr(vFechaCapital);
                      vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                      EdFechaInteres.Caption := DateToStr(vFechaInteres);
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
                   EdCostas.Caption := FormatCurr('#,#0',FieldByName('COSTAS').AsCurrency);
                   EdHonorarios.Caption := FormatCurr('#,#0',FieldByName('HONORARIOS').AsCurrency);
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

procedure TFrameLiquidacionCastigada.CmdBuscarClick(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;
end;

procedure TFrameLiquidacionCastigada.EdNocomprobanteExit(Sender: TObject);
var
comprobante : string;
begin
        comprobante := trim(EdNoComprobante.Text);
        if comprobante = '' then
          begin
            MessageDlg('El Número del Comprobante no puede estar en blanco',mtError,[mbOK],0);
            EdNoComprobante.SetFocus;
          end
        else
          begin
            vComprobante := formatcurr('0000000',strtoint(comprobante));
            EdNoComprobante.Text := vComprobante;
          end;
end;

procedure TFrameLiquidacionCastigada.EdAbonoCapitalExit(Sender: TObject);
begin
          if EdAbonoCapital.Text = '' then EdAbonoCapital.Text := '0';
          vAbonoCapital := StrToCurr(EdAbonoCapital.Text);
          EdAbonoCapital.Text := FormatCurr('#,##0',vAbonoCapital);
          TGeneral := vAbonoCapital + vAbonoInteres + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TFrameLiquidacionCastigada.EdAbonoInteresExit(Sender: TObject);
begin
          if EdAbonoInteres.Text = '' then EdAbonoInteres.Text := '0';
          vAbonoInteres := StrToCurr(EdAbonoInteres.Text);
          EdAbonoInteres.Text := FormatCurr('#,##0',vAbonoInteres);
          TGeneral := vAbonoCapital + vAbonoInteres + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
          if vAbonoInteres > 0 then
           begin
             EdFechaInicial.Visible := True;
             EdFechaFinal.Visible := True;
             EdDiasAplicados.Visible := True;
             EdTasaAplicada.Visible := True;
             Label116.Visible := True;
             Label117.Visible := True;
             Label125.Visible := True;
             Label126.Visible := True;
             EdDiasAplicados.SetFocus;
           end;

end;

procedure TFrameLiquidacionCastigada.EdAbonoCostasExit(Sender: TObject);
begin
          if EdAbonoCostas.Text = '' then EdAbonoCostas.Text := '0';
          vcostas := StrToCurr(EdAbonoCostas.Text);
          EdAbonoCostas.Text := FormatCurr('#,##0',vcostas);
          TGeneral := vAbonoCapital + vAbonoInteres + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TFrameLiquidacionCastigada.EdDiasAplicadosChange(
  Sender: TObject);
begin
        DiasInteres;     
end;

procedure TFrameLiquidacionCastigada.EdDiasAplicadosExit(Sender: TObject);
begin
        DiasInteres;
end;

procedure TFrameLiquidacionCastigada.EdTasaAplicadaExit(Sender: TObject);
begin
        if EdTasaAplicada.Text = '' then EdTasaAplicada.Text := '0.00';
        vTasa := StrToFloat(EdTasaAplicada.Text);
        EdTasaAplicada.Text := FormatCurr('#0.00%',vTasa);

end;

procedure TFrameLiquidacionCastigada.CmdInformeClick(Sender: TObject);
var Tabla:string;
    I:Integer;
    AF:PCuotasLiq;
    frmVistaPreliminar:TfrmVistaPreliminar;
    Asociado : string;
    FechaProx : string;
begin
        Empleado;
        Asociado := EdNombre.Caption;

        for I := 0 to (MyCuotasLiq.Lista.Count - 1) do
         begin
              AF := MyCuotasLiq.Lista.Items[I];
              IBInforme.Append;
              IBInforme.FieldByName('CUOTA').AsInteger := AF^.CuotaNumero;
              IBInforme.FieldByName('CODIGO').AsString := AF^.CodigoPuc;
              IBCodigo.Close;
              IBCodigo.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBCodigo.ParamByName('CODIGO').AsString := AF^.CodigoPuc;
              IBCodigo.Open;
              IBInforme.FieldByName('NOMBRE').AsString := IBCodigo.FieldByName('NOMBRE').AsString;
              IBInforme.FieldByName('ID_AGENCIA').AsInteger := Agencia;
              IBInforme.FieldByName('FECHA_INICIAL').AsDateTime := AF^.FechaInicial;
              IBInforme.FieldByName('FECHA_FINAL').AsDateTime := AF^.FechaFinal;
              IBInforme.FieldByName('DIAS').AsInteger := AF^.Dias;
              IBInforme.FieldByName('TASA').AsFloat := AF^.Tasa;
              IBInforme.FieldByName('DEBITO').AsCurrency := AF^.Debito;
              IBInforme.FieldByName('CREDITO').AsCurrency := AF^.Credito;
              IBInforme.Post;
              IBCodigo.Close;
           end;

           with IBQuery do begin
           Close;
           SQL.Clear;
           SQL.Add('Select FECHA_A_PAGAR, CAPITAL_A_PAGAR');
           SQL.Add('from "col$tablaliquidacion"');
           SQL.Add('where ');
           SQL.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$tablaliquidacion".PAGADA = 0');
           SQL.Add('order by FECHA_A_PAGAR');
           ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
           ParamByName('ID_COLOCACION').AsString := vcolocacion;
           Open;
           Last;
           First;
           if FieldByName('FECHA_A_PAGAR').AsDateTime = 0 then
              FechaProx := '0000/00/00'
           else
              FechaProx :=  DateToStr(FieldByName('FECHA_A_PAGAR').AsDateTime);
           Close;
           end;

           Report.Variables.ByName['Empresa'].AsString := Empresa;
           Report.Variables.ByName['Colocacion'].AsString := vColocacion;
           Report.Variables.ByName['Hoy'].AsDateTime := fFechaActual;
           Report.Variables.ByName['FechaCorte'].AsDateTime := fFechaActual;
           Report.Variables.ByName['ProximaCuota'].AsString := FechaProx;
           Report.Variables.ByName['Asociado'].AsString := Asociado;
           Report.Variables.ByName['Cuenta'].AsString := IntToStr(NumeroCuenta) + '-' + IntToStr(DigitoCuenta);
           Report.Variables.ByName['NuevoSaldo'].AsDouble := vSaldoActual - vAbonoCapital;
           Report.Variables.ByName['InteresesHasta'].AsDateTime := vFechaFInt;
           Report.Variables.ByName['CapitalHasta'].AsDateTime := FechaCapAnt;
           Report.Variables.ByName['comprobante'].AsString := VComprobante;
           Report.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;


           if Report.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Report;
              frmVistaPreliminar.ShowModal;
           end;

           IBInforme.EmptyDataSet;
end;

procedure TFrameLiquidacionCastigada.CmdReversarClick(Sender: TObject);
begin
          DmGeneral.IBTransaction1.Rollback;
          MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
          Inicializar;

end;

procedure TFrameLiquidacionCastigada.CmdGrabarClick(Sender: TObject);
var
I,J : integer;
TotalDebitoRecibo : Currency;
TotalCreditoRecibo : Currency;
Consec:string;
DescImpuesto : Currency;
begin
if MessageDlg('Seguro de Realizar el Abono?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
  CmdGrabar.Enabled := False;
  Application.ProcessMessages;
  TotalDebitoRecibo := 0;
  TotalCreditoRecibo := 0;
  for I:=0 to MyCuotasLiq.Lista.Count - 1 do
   begin
     Application.ProcessMessages;
     AR := MyCuotasLiq.Lista.Items[I];
     TotalDebitoRecibo := TotalDebitoRecibo + AR^.Debito;
     TotalCreditoRecibo := TotalCreditoRecibo + AR^.Credito;
   end;
  if not (TotalDebitoRecibo = TotalCreditoRecibo) then
   begin
     MessageDlg('La Nota Contable está Descuadrada' + #10 + #13 +
                       'Revise los Valores',mtError,[mbOk],0);
     Exit;
   end
  else
   begin
///**Genero el consecutivo
    Consec := FormatCurr('00000000',ObtenerConsecutivo(IBSaldo));
    vComprobante := Consec;
    EdNoComprobante.Text := Consec;
    dmGeneral.IBTransaction1.StartTransaction;

    with IBQuery do
     try
      grabarextracto;
      SQL.Clear;
      SQL.Add('insert into "col$extractodet" values (');
      SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
      SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
      SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
      if  MyCuotasLiq.Lista.Count > 0 then
       for I := 0 to MyCuotasLiq.Lista.Count -1 do
        begin
          Application.ProcessMessages;
          AR := MyCuotasLiq.Lista.Items[I];
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(vcomprobante);
          ParamByName('ID_COLOCACION').AsString := vcolocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
          ParamByName('HORA_EXTRACTO').AsDateTime := fFechaHoraActual;
          ParamByName('CODIGO_PUC').AsString := AR^.CodigoPuc;
          ParamByName('FECHA_INICIAL').AsDate := AR^.FechaInicial;
          ParamByName('FECHA_FINAL').AsDate := AR^.FechaFinal;
          ParamByName('DIAS_APLICADOS').AsInteger := AR^.Dias;
          ParamByName('TASA_LIQUIDACION').AsFloat := AR^.Tasa;
          ParamByName('VALOR_DEBITO').AsCurrency := AR^.Debito;
          ParamByName('VALOR_CREDITO').AsCurrency := AR^.Credito;
          ExecSql;
          Close;
        end;

      DescImpuesto := SimpleRoundTo((vTotalLiquidacion/1000) * 4,0);
      New(AR);
      AR^.CuotaNumero := 0;
      AR^.CodigoPuc   := '531520000000000000';
      AR^.FechaInicial := fFechaActual;
      AR^.FechaFinal   := fFechaActual;
      AR^.Dias         := 0;
      AR^.Tasa         := 0;
      AR^.Debito       := DescImpuesto;
      AR^.Credito      := 0;
      AR^.EsCapital := False;
      AR^.EsCausado := False;
      AR^.EsCorriente := False;
      AR^.EsVencido := False;
      AR^.EsAnticipado := False;
      AR^.EsDevuelto := False;
      if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);

      New(AR);
      AR^.CuotaNumero := 0;
      AR^.CodigoPuc   := '244205000000000000';
      AR^.FechaInicial := fFechaActual;
      AR^.FechaFinal   := fFechaActual;
      AR^.Dias         := 0;
      AR^.Tasa         := 0;
      AR^.Debito       := 0;
      AR^.Credito      := DescImpuesto;
      AR^.EsCapital := False;
      AR^.EsCausado := False;
      AR^.EsCorriente := False;
      AR^.EsVencido := False;
      AR^.EsAnticipado := False;
      AR^.EsDevuelto := False;
      if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);

      TotalDebitoRecibo := TotalDebitoRecibo + DescImpuesto;
      TotalCreditoRecibo := TotalCreditoRecibo + DescImpuesto;

      //**Genero el comprobante
      with IBQuery1 do
       begin
         sql.Clear;
         sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
         sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
         sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
         sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
         sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
         sql.Add('"con$comprobante"."ANULACION", "con$comprobante"."ID_EMPLEADO") ');
         sql.Add('values (');
         sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
         sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
         sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
         ParamByName('ID_COMPROBANTE').AsString:= vComprobante;
         ParamByname('FECHADIA').AsDate := fFechaActual;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
         ParamByName('DESCRIPCION').AsString := 'Descuento de Cartera por Pagaré No.' + vColocacion;
         ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebitoRecibo;
         ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCreditoRecibo;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByname('ANULACION').asstring := '';
         ParamByName('IMPRESO').AsInteger  := 1;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ExecSQL;
         Close;

         for I := 0 to MyCuotasLiq.Lista.Count -1 do
          begin
            Application.ProcessMessages;
            AR := MycuotasLiq.Lista.Items[I];
            SQL.Clear;
            SQL.Add('insert into "con$auxiliar" values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
            ParamByName('ID_COMPROBANTE').AsString := vComprobante;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('CODIGO').AsString := AR^.CodigoPuc;
            ParamByName('DEBITO').AsCurrency := ar^.Debito;
            ParamByName('CREDITO').AsCurrency := ar^.Credito;
            ParamByName('ID_CUENTA').AsInteger := NumeroCuenta;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
            ParamByName('ID_PERSONA').AsString := vNumeroId;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            ExecSQL;
           end;
       end;
//**Actualizo extracto y saldos mes
      with IBQuery1 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('insert into "cap$extracto" values(');
         SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
         SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
         SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
         SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
         ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
         ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
         ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
         ParamByName('HORA_MOVIMIENTO').AsTime := fFechaHoraActual;
         if vTotalLiquidacion > 0 then
          begin
            ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 17;
            ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vComprobante;
            ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'DESCUENTO DE CARTERA COLOCACION No.' + vcolocacion;
            ParamByName('VALOR_DEBITO').AsCurrency := 0;
            ParamByName('VALOR_CREDITO').AsCurrency := vTotalLiquidacion;
            try
              Open;
              if RowsAffected < 1 then
               begin
                 MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
                 Exit;
               end
            except
               MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
               Exit;
            end; // del try
          end;
       end;
//***fin actualizo extracto
  VerificarCancelacionCredito(Agencia,vColocacion);
  DmGeneral.IBTransaction1.Commit;
  dmgeneral.IBTransaction1.StartTransaction;
  MessageDlg('Cuotas Abonadas',mtInformation,[mbOK],0);
  CmdGrabar.Enabled := False;
  CmdInforme.Click;
  inicializar;
     except
       Transaction.Rollback;
       MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
       Exit;
     end;
   end;
 end
else
   CmdReversar.Click;
end;

end.
