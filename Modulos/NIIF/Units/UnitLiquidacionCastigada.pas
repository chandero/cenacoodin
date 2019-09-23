unit UnitLiquidacionCastigada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, DB,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, IBSQL, DateUtils, Math,
  DBClient, JvEdit, JvTypedEdit, Grids, JvStringGrid, StrUtils;

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
  TfrmLiquidacionCastigada= class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    EdNocomprobante: TMaskEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdInforme: TBitBtn;
    IBQuery: TIBQuery;
    CmdReversar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBSaldo: TIBSQL;
    IBExtractoDet: TIBSQL;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    Label124: TLabel;
    EdTotalColManual: TStaticText;
    IBInforme: TClientDataSet;
    IBInformeCUOTA: TIntegerField;
    IBInformeCODIGO: TStringField;
    IBInformeID_AGENCIA: TIntegerField;
    IBInformeFECHA_INICIAL: TDateField;
    IBInformeFECHA_FINAL: TDateField;
    IBInformeDIAS: TIntegerField;
    IBInformeTASA: TFloatField;
    IBInformeDEBITO: TCurrencyField;
    IBInformeCREDITO: TCurrencyField;
    IBCodigo: TIBQuery;
    IBInformeNOMBRE: TStringField;
    Label121: TLabel;
    EdFechaInicial: TDateTimePicker;
    EdFechaFinal: TDateTimePicker;
    EdTasaAplicada: TLabeledEdit;
    Label127: TLabel;
    Label128: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    BtnCerrar: TBitBtn;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label4: TLabel;
    Label31: TLabel;
    Label8: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label2: TLabel;
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
    GroupBox4: TGroupBox;
    GridCuentas: TJvStringGrid;
    ChkPapeleria: TCheckBox;
    EdExasociados: TJvCurrencyEdit;
    EdAbonoCapital: TJvCurrencyEdit;
    EdAbonoInteres: TJvCurrencyEdit;
    EdAbonoCostas: TJvCurrencyEdit;
    EdAbonoHonorarios: TJvCurrencyEdit;
    EdDiasAplicados: TJvIntegerEdit;
    GroupBox13: TGroupBox;
    Label169: TLabel;
    Label168: TLabel;
    EdCuentaAbogado: TStaticText;
    EdAbogado: TStaticText;
    ReporteCas: TprTxReport;
    IBVerificaTmp: TIBSQL;
    Label5: TLabel;
    EdNacional: TJvCurrencyEdit;
    Label6: TLabel;
    DBLCBBancos: TDBLookupComboBox;
    Label7: TLabel;
    EdFechaConsignacion: TDateTimePicker;
    Fallecido: TCheckBox;
    Incapacitado: TCheckBox;
    Dacion: TCheckBox;
    IBCambioEstado: TIBSQL;
    IBNacional: TIBSQL;
    IBQuery3: TIBQuery;
    DataSource1: TDataSource;
    Label10: TLabel;
    EdAprovecha: TJvCurrencyEdit;
    EdFechaInicialA: TDateTimePicker;
    EdFechaFinalA: TDateTimePicker;
    EdDiasAplicadosA: TJvIntegerEdit;
    EdTasaAplicadaA: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure EdNocomprobanteExit(Sender: TObject);
    procedure EdAbonoCapitalExit(Sender: TObject);
    procedure EdAbonoInteresExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure BtnCerrarClick(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure CmdReversarClick(Sender: TObject);
    procedure EdDiasAplicadosExit(Sender: TObject);
    procedure EdDiasAplicadosChange(Sender: TObject);
    procedure EdAbonoCostasExit(Sender: TObject);
    procedure EdAbonoHonorariosExit(Sender: TObject);
    procedure ChkPapeleriaClick(Sender: TObject);
    procedure EdExasociadosEnter(Sender: TObject);
    procedure EdExasociadosExit(Sender: TObject);
    procedure EdAbonoCostasEnter(Sender: TObject);
    procedure EdAbonoInteresEnter(Sender: TObject);
    procedure EdAbonoCapitalEnter(Sender: TObject);
    procedure EdDiasAplicadosEnter(Sender: TObject);
    procedure EdFechaConsignacionExit(Sender: TObject);
    procedure DBLCBBancosExit(Sender: TObject);
    procedure EdNacionalEnter(Sender: TObject);
    procedure EdNacionalExit(Sender: TObject);
    procedure FallecidoClick(Sender: TObject);
    procedure IncapacitadoClick(Sender: TObject);
    procedure DacionClick(Sender: TObject);
    procedure EdAprovechaEnter(Sender: TObject);
    procedure EdAprovechaExit(Sender: TObject);
    procedure EdDiasAplicadosAEnter(Sender: TObject);
    procedure EdDiasAplicadosAExit(Sender: TObject);
  private
    procedure GrabarExtracto;
    procedure GrabarTablaliquidacion;
    procedure Empleado;
    procedure inicializar;
    procedure DiasInteres;
    procedure LimpiarManualIntereses;
    function BuscarAhorros(TipoId: integer; NumeroId: string): currency;
    procedure ActualizarCaptaciones(TipoId: integer; NumeroId: String);
    procedure VerificacionCambioEstado;
    procedure DiasAprov;
    { Private declarations }
  public
    { Public declarations }
  end;

type PCuentas = ^ACuentas;
   ACuentas = Record
   Agencia:Integer;
   Tipo:Integer;
   Cuenta:Integer;
   Digito:Integer;
   Saldo:Currency;
end;

var
  frmLiquidacionCastigada: TfrmLiquidacionCastigada;
  vColocacion : string;
  vComprobante : string;
  vAbonocapital : currency;
  vAbonoAprov   : Currency;
  vAbonoInteres : Currency;
  vFechaInteres           : TDate;
  vFechaCapital           : TDate;
  vFechaInicialInteres    : TDate;
  vFechaFinalInteres      : TDate;
  vFechaInicialInteresA   : TDate;
  vFechaFinalInteresA     : TDate;
  vDias                   : Integer;
  vTasa                   : Single;
  vDiasA                  : Integer;
  vTasaA                  : Single;
  vSaldoActual            : Currency;
  vTipoInteres            : string;
  TipoInteres             : Integer;
  vPuntosAdic             : Double;
  TasaC                   : Double;
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

  ListaCuentas:TList;

  SaldoAhorros:Currency;
  SaldoAportes:Currency;
  SaldoJuvenil:Currency;
  SaldoCuentas:Currency;
  vTotalAhorros:Currency;
  vTotalAportes:Currency;
  vTotalJuvenil:Currency;
  vTotalCuentas:Currency;
  vPapeleria:Currency;
  vExAsociados:Currency;
  vNacional:Currency;
  vComisionNal:Currency;
  vConsignaAhorros:Currency;
  Banco:Integer;
  Fila:Integer;
  NumeroCuentaAbogado:Integer;
  DigitoCuentaAbogado:Integer;
  FechaConsignacion:TDate;
  EsIncapacitado,EsFallecido:Integer;
  NuevoEstado:Integer;
  EstadoActual:Integer;
implementation

uses UnitDmGeneral, UnitdmColocacion, UnitGlobales, UnitBuscarColocacion,
     UnitVistaPreliminar, UnitGlobalesCol;

{$R *.dfm}

procedure TfrmLiquidacionCastigada.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmLiquidacionCastigada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmLiquidacionCastigada.EdNumeroColocacionExit(Sender: TObject);
begin
         if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
           vColocacion := trim(EdNumeroColocacion.Text);
           EdNumeroColocacion.Text := vColocacion;

        If EdNumeroColocacion.Text = '' then Exit;

        with IBVerificaTmp do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$extractotmp" where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ExecQuery;
          if RecordCount > 0 then begin
            MessageDlg('Colocación con Liquidación Temporal para Desembolso',mtError,[mbOK],0);
            CmdReversar.Click;
            Exit;
          end;
          Close;
        end;        

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
                SQL.Add('"col$colocacion".TIPO_INTERES,');
                SQL.Add('"col$colocacion".ID_INTERES,');
                SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
                SQL.Add('"col$colocacion".PUNTOS_INTERES,');
                SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
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
                SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');                
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
                EstadoActual := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                TipoInteres := FieldByName('ID_INTERES').AsInteger;

                if RecordCount > 0 then
                begin
                      vTipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
                      vNumeroId := FieldByName('ID_PERSONA').AsString ;
                      EdNumeroIdentificacion.Caption := FieldByName('ID_PERSONA').AsString ;
                      EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      vSaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
                      EdSaldoColocacion.Caption := FormatCurr('#,#0.00',vSaldoActual);
                      vFechaCapital := FieldByname('FECHA_CAPITAL').AsDateTime;
                      EdFechaCapital.Caption := DateToStr(vFechaCapital);
                      vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                      EdFechaInteres.Caption := DateToStr(vFechaInteres);
                      EdEstado.Caption := DescripcionEstado;
                      if FieldByName('TIPO_INTERES').AsString = 'F' then
                        TasaC := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
                      else
                        TasaC := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
                      ChkPapeleria.SetFocus;
                Close;

                with IBSQL2 do
                 begin
                   SQL.Clear;
                   SQL.Add('select sum("col$costas".VALOR_COSTAS) as COSTAS');
                   SQL.Add('FROM "col$costas" WHERE');
                   SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND');
                   SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');
                   ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   ParamByName('ID_COLOCACION').AsString := vColocacion;
                   ExecQuery;
                   EdCostas.Caption := FormatCurr('#,#0',FieldByName('COSTAS').AsCurrency);
                   Close;

                   SQL.Clear;
                   SQL.Add('Select ');
                   SQL.Add('"col$colocacionabogado".ID_IDENTIFICACION,');
                   SQL.Add('"col$colocacionabogado".ID_PERSONA,');
                   SQL.Add('"gen$abogados".NUMERO_CUENTA,');
                   SQL.Add('"gen$abogados".DIGITO_CUENTA,');
                   SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                   SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                   SQL.Add('"gen$persona".NOMBRE');
                   SQL.Add('from "col$colocacionabogado"');
                   SQL.Add('inner join "gen$abogados" on ("col$colocacionabogado".ID_IDENTIFICACION = "gen$abogados".ID_IDENTIFICACION and');
                   SQL.Add('"col$colocacionabogado".ID_PERSONA = "gen$abogados".ID_PERSONA)');
                   SQL.Add('inner join "gen$persona" on ("col$colocacionabogado".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
                   SQL.Add('"col$colocacionabogado".ID_PERSONA = "gen$persona".ID_PERSONA)');
                   SQL.Add('where');
                   SQL.Add('"col$colocacionabogado".ID_AGENCIA = :ID_AGENCIA and');
                   SQL.Add('"col$colocacionabogado".ID_COLOCACION = :ID_COLOCACION');
                   ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   ParamByName('ID_COLOCACION').AsString := vColocacion;
                   ExecQuery;
                   NumeroCuentaAbogado := FieldByName('NUMERO_CUENTA').AsInteger;
                   DigitoCuentaAbogado := FieldByName('DIGITO_CUENTA').AsInteger;
                   if NumeroCuentaAbogado <> 0 then
                    begin
                      groupbox13.Visible := True;
                      EdCuentaAbogado.Caption := IntToStr(NumeroCuentaAbogado) + '-' + IntToStr(DigitoCuentaAbogado);
                      EdAbogado.Caption := FieldByName('NOMBRE').AsString + ' ' +
                                           FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                           FieldByName('SEGUNDO_APELLIDO').AsString;
                    end;
                   Close;
                 end;

                ActualizarCaptaciones(vTipoId,vNumeroId);
                end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                      EdNumeroColocacion.SetFocus;
                end;
        end;
end;

procedure TfrmLiquidacionCastigada.FormShow(Sender: TObject);
begin
        EdAgencia.KeyValue := Agencia;
        EdFecha.Caption := FormatDateTime('yyyy/mm/dd',fFechaActual);
        Inicializar;
end;

procedure TfrmLiquidacionCastigada.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLiquidacionCastigada.EdNocomprobanteExit(
  Sender: TObject);
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

procedure TfrmLiquidacionCastigada.EdAbonoCapitalExit(
  Sender: TObject);
begin
          vAbonoCapital := EdAbonoCapital.Value; // (EdAbonoCapital.Text);
          if vAbonocapital > vSaldoActual then begin
            MessageDlg('Abono a Capital Superior al Saldo Actual',mtError,[mbok],0);
            EdAbonoCapital.Value := 0;
            EdAbonoCapital.SetFocus;
            Exit;
          end;
          TGeneral := vAbonoCapital + vAbonoInteres + vcostas + vhonorarios + vPapeleria + vExAsociados + vComisionNal + vAbonoAprov;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionCastigada.EdAbonoInteresExit(
  Sender: TObject);
begin
          vAbonoInteres := EdAbonoInteres.Value; // (EdAbonoCapital.Text);
          TGeneral := vAbonoCapital + vAbonoInteres + vcostas + vhonorarios + vPapeleria + vExAsociados + vComisionNal + vAbonoAprov;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
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

procedure TfrmLiquidacionCastigada.EdDiasAplicadosChange(
  Sender: TObject);
begin
        DiasInteres;
end;

procedure TfrmLiquidacionCastigada.EdDiasAplicadosExit(
  Sender: TObject);
begin
        DiasInteres;
        vTasa := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora;
        EdTasaAplicada.Text := FormatCurr('#0.00%',vTasa);
end;

procedure TfrmLiquidacionCastigada.CmdAceptarClick(Sender: TObject);
var
I,J:Integer;
CodigoAhorros : string;
CodigoAportes : string;
CodigoJuvenil : string;
CodigoExasociados : string;
CodigoIvaGenerado : string;
CodigoBanco:string;
CodigoPapeleria : string;
CodigoAseguradora:string;
CodigoDacion:string;
CodigoK:string;
CodigoKDeudoras:string;
CodigoInt:string;
CodigoIntDeudoras:string;
CodigoCostas:string;
CodigoCostasDeudoras:string;
CodigoAprovechamientos:string;
CodigoDeudorasContra:string;
SaldoAhorros:Currency;
vCuentasdeOrden:Currency;
begin
    try
        totaldebitos := 0;
        totalcreditos := 0;
        vCuentasdeOrden := 0;
        Empleado;
        GroupBox3.Enabled := False;

//        vTotalAhorros := BuscarAhorros(vTipoId,vNumeroId);

        with dmColocacion.IBSQL do
        begin
           SQL.Clear;
           SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 2');
           ExecQuery;
           CodigoAhorros := FieldByName('CODIGO_CONTABLE').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 1');
           ExecQuery;
           CodigoAportes := FieldByName('CODIGO_CONTABLE').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 4');
           ExecQuery;
           CodigoJuvenil := FieldByName('CODIGO_CONTABLE').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 10');
           ExecQuery;
           CodigoExasociados := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 11');
           ExecQuery;
           CodigoIvaGenerado := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 12');
           ExecQuery;
           CodigoPapeleria := FieldByName('CODIGO').AsString;
           Close;

           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 9');
           ExecQuery;
           codigoAseguradora := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 17');
           ExecQuery;
           CodigoDacion := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 21');
           ExecQuery;
           CodigoK := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 22');
           ExecQuery;
           CodigoKDeudoras := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 23');
           ExecQuery;
           CodigoInt := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 24');
           ExecQuery;
           CodigoIntDeudoras := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 25');
           ExecQuery;
           CodigoCostas := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 26');
           ExecQuery;
           CodigoCostasDeudoras := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 27');
           ExecQuery;
           CodigoAprovechamientos := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 28');
           ExecQuery;
           CodigoDeudorasContra := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('Select ID_ESTADO_COLOCACION from "col$estado"');
           SQL.Add('where "col$estado".ES_FALLECIDO = 1');
           ExecQuery;
           EsFallecido := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
           Close;

           SQL.Clear;
           SQL.Add('Select ID_ESTADO_COLOCACION from "col$estado"');
           SQL.Add('where "col$estado".ES_INCAPACITADO = 1');
           ExecQuery;
           EsIncapacitado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
           Close;
        end;

        if EdNacional.Value > 0 then begin
          IBNacional.Close;
          IBNacional.ParamByName('ID_BANCO').AsInteger := Banco;
          IBNacional.ExecQuery;
          CodigoBanco := IBNacional.FieldByName('CODIGO').AsString;
          IBNacional.Close;
        end;

        MyCuotasLiq.Lista := TList.Create;
        if vAbonoCapital <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoK;
           if CapitalaPagar = 0 then CapitalaPagar := vValorCuota;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           vFechaFInt := FechaIntAnt;
           FechaCapAnt := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoCapital;
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

           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoKDeudoras;
           if CapitalaPagar = 0 then CapitalaPagar := vValorCuota;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoCapital;
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
           vCuentasdeOrden := vCuentasdeOrden + vAbonocapital;
         end;

        if vAbonoInteres <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoInt;
           AR^.FechaInicial := vFechaInicialInteres;
           AR^.FechaFinal   := vFechaFinalInteres;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
           AR^.Dias := vDias;
           AR^.Tasa := vTasa;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteres;
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

           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoIntDeudoras;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteres;
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
           vCuentasdeOrden := vCuentasdeOrden + vAbonoInteres;
         end;

        if vAbonoAprov <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoAprovechamientos;
           AR^.FechaInicial := vFechaInicialInteresA;
           AR^.FechaFinal   := vFechaFinalInteresA;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
           AR^.Dias := vDiasA;
           AR^.Tasa := vTasaA;
           AR^.Debito := 0;
           AR^.Credito := vAbonoAprov;
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

        if vcostas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoCostas;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
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
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;

           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoCostasDeudoras;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
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
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
           vCuentasdeOrden := vCuentasdeOrden + vcostas;
         end;

        if vhonorarios <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoAhorros;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
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
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;    

          // Coloco Deudoras de Control
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoDeudorasContra;
          AR^.FechaInicial := ffechaactual;
          AR^.FechaFinal   := ffechaactual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := vCuentasdeOrden;
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
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;

// coloco papeleria
         if vPapeleria > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoPapeleria;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := SimpleRoundTo(vPapeleria/1.16,0);
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;

          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoIvaGenerado;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := vPapeleria - SimpleRoundTo(vPapeleria/1.16,0);
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
        end;

       //  fin Coloco Papeleria


          // coloco caja
         if vTotalAhorros > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoAhorros;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := vTotalAhorros;
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
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;
         // coloco Juvenil
         if vTotalJuvenil > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoJuvenil;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := vTotalJuvenil;
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
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;

         // coloco Aportes
         if vTotalAportes > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoAportes;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := vTotalAportes;
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
          TotalDebitos := TotalDebitos + AR^.Debito;
          TotalCreditos := TotalCreditos + AR^.Credito;
        end;

//Coloco Bancos
         if vNacional > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoBanco;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := vNacional;//TotalCreditos - TotalDebitos;
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
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;

         if vComisionNal > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoBanco;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;//TotalCreditos - TotalDebitos;
          AR^.Credito      := vComisionNal;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;

// coloco exasociados
         if vExAsociados > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoExasociados;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := vExAsociados;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;

// coloco aseguradora
         if (Fallecido.Checked = True) or (Incapacitado.Checked = True) then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoAseguradora;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TGeneral;
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
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
           vTotalCuentas := TGeneral;
         end;

// coloco Dacion en Pago
         if (Dacion.Checked = True) then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoDacion;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TGeneral;
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
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
           vTotalCuentas := TGeneral;
         end;

        vTotalLiquidacion := TGeneral;
        vConsignaAhorros := vNacional - vTotalLiquidacion;

        if vConsignaAhorros > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoAhorros;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := vConsignaAhorros;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;


        TotalDebitos := 0;
        TotalCreditos := 0;
        vCuentasdeOrden := 0;

        if vTotalLiquidacion <> vTotalCuentas then
         begin
           MessageDlg('El valor a descontar debe ser igual al valor en Captaciones',mtError,[mbOK],0);
           CmdReversar.Click;
           Exit;
         end;

         TGeneral := vTotalLiquidacion;
         
        if Fallecido.Checked then
          NuevoEstado := EsFallecido
        else if Incapacitado.Checked then
          NuevoEstado := EsIncapacitado
        else NuevoEstado := EstadoActual;

        CmdInforme.Enabled := True;

        CmdInforme.Enabled := True;
        CmdReversar.Visible := True;
        CmdGrabar.Enabled := True;
        CmdGrabar.Visible := True;
        CmdGrabar.SetFocus;
        CmdAceptar.Visible := False;
        CmdAceptar.Enabled := False;

    except
     dmColocacion.IBSQLcodigos.Transaction.RollbackRetaining;
     Exit;
    end;
end;


procedure TfrmLiquidacionCastigada.GrabarExtracto;
begin
        with IBQuery do
         begin
          sql.Clear;
          sql.Add('insert into "col$extracto" (');
          sql.Add('"col$extracto"."ID_AGENCIA", "col$extracto"."ID_CBTE_COLOCACION",');
          sql.Add('"col$extracto"."ID_COLOCACION", "col$extracto"."FECHA_EXTRACTO",');
          sql.Add('"col$extracto"."HORA_EXTRACTO", "col$extracto"."CUOTA_EXTRACTO",');
          sql.Add('"col$extracto"."TIPO_OPERACION", "col$extracto"."SALDO_ANTERIOR_EXTRACTO",');
          sql.Add('"col$extracto"."ABONO_CAPITAL", "col$extracto"."ABONO_CXC",');
          sql.Add('"col$extracto"."ABONO_SERVICIOS", "col$extracto"."ABONO_ANTICIPADO",');
          sql.Add('"col$extracto"."ABONO_MORA", "col$extracto"."ABONO_SEGURO",');
          sql.Add('"col$extracto"."ABONO_PAGXCLI", "col$extracto"."ABONO_HONORARIOS",');
          sql.Add('"col$extracto"."ABONO_OTROS", "col$extracto"."TASA_INTERES_LIQUIDACION",');
          sql.Add('"col$extracto"."ID_EMPLEADO",');
          sql.Add('"col$extracto"."INTERES_PAGO_HASTA",');
          sql.Add('"col$extracto"."CAPITAL_PAGO_HASTA",');
          sql.Add('"col$extracto"."TIPO_ABONO")');
          sql.Add(' Values (');
          sql.Add(':"ID_AGENCIA", :"ID_CBTE_COLOCACION", :"ID_COLOCACION",');
          sql.Add(':"FECHA_EXTRACTO", :"HORA_EXTRACTO", :"CUOTA_EXTRACTO",');
          sql.Add(':"TIPO_OPERACION", :"SALDO_ANTERIOR_EXTRACTO", :"ABONO_CAPITAL",');
          sql.Add(':"ABONO_CXC", :"ABONO_SERVICIOS", :"ABONO_ANTICIPADO", :"ABONO_MORA",');
          sql.Add(':"ABONO_SEGURO", :"ABONO_PAGXCLI", :"ABONO_HONORARIOS",');
          sql.Add(':"ABONO_OTROS", :"TASA_INTERES_LIQUIDACION", :"ID_EMPLEADO",');
          sql.Add(':"INTERES_PAGO_HASTA", :"CAPITAL_PAGO_HASTA", :"TIPO_ABONO")');
          ParamByName('ID_AGENCIA').AsInteger := Agencia ;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
          ParamByName('HORA_EXTRACTO').AsDateTime := fFechaHoraActual;
          ParamByName('CUOTA_EXTRACTO').AsInteger := 0;
          ParamByName('TIPO_OPERACION').AsInteger := 1;
          ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
          ParamByName('ABONO_CAPITAL').AsCurrency := vAbonocapital;
          ParamByName('ABONO_CXC').AsCurrency := 0;
          ParamByName('ABONO_SERVICIOS').AsCurrency := vAbonoInteres + vAbonoAprov;
          ParamByName('ABONO_ANTICIPADO').AsCurrency := 0;
          ParamByName('ABONO_MORA').AsCurrency := 0;
          ParamByName('ABONO_SEGURO').AsCurrency := 0;
          if vcostas <> 0 then
             ParamByName('ABONO_PAGXCLI').AsCurrency := vcostas
          else
             ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
          if vhonorarios <> 0 then
             ParamByName('ABONO_HONORARIOS').AsCurrency := vhonorarios
          else
             ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
          ParamByName('ABONO_OTROS').AsCurrency := 0;
          ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasa;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          if vAbonoInteres > 0 then
             ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalInteres;
          if vAbonoAprov > 0 then
             ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalInteresA;
          if (vAbonoInteres = 0) and (vAbonoAprov = 0) then
             ParamByName('INTERES_PAGO_HASTA').AsDate := FechaIntAnt;

          ParamByName('CAPITAL_PAGO_HASTA').AsDate := FechaCapAnt;
          ParamByName('TIPO_ABONO').AsInteger := 0;
          ExecSQL;
          Close;

          if vAbonocapital > 0 then
          begin
            sql.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
            sql.Add('"col$colocacion"."FECHA_CAPITAL" = :"FECHA_CAPITAL"');
            sql.Add(' where ');
            sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('ABONOS_CAPITAL').AsCurrency := vAbonoCapital;
            ParamByName('FECHA_CAPITAL').AsDate := FechaCapAnt;
            ExecSql;
            Close;
           end;

          if (vAbonoInteres > 0) and (vAbonoAprov = 0) then
          begin
            sql.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
            sql.Add(' where ');
            sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('FECHA_INTERES').AsDate := vFechaFinalInteres;
            ExecSql;
            Close;
           end
          else if (vAbonoInteres > 0) and (vAbonoAprov > 0) then
          begin
            sql.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
            sql.Add(' where ');
            sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('FECHA_INTERES').AsDate := vFechaFinalInteresA;
            ExecSql;
            Close;
          end
          else if (vAbonoAprov > 0) then
          begin
            sql.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
            sql.Add(' where ');
            sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('FECHA_INTERES').AsDate := vFechaFinalInteresA;
            ExecSql;
            Close;
          end;

          if (vcostas <> 0) or (vhonorarios <> 0) then begin
            SQL.Clear;
            SQL.Add('insert into "col$costas" values (:ID_AGENCIA,:ID_COLOCACION,');
            SQL.Add(':FECHA,:ID_CBTE_COLOCACION,:VALOR_COSTAS,:VALOR_HONORARIOS,:VALOR_OTROS,:DESCRIPCION)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vComprobante);
            ParamByName('VALOR_COSTAS').AsCurrency := -vcostas;
            ParamByName('VALOR_HONORARIOS').AsCurrency := -vhonorarios;
            ParamByName('VALOR_OTROS').AsCurrency := 0;
            ParamByName('DESCRIPCION').AsString := 'VALOR COSTAS Y HONORARIOS RECIBIDOS EN LA FECHA';
            ExecSQL;
            Close;
          end;
         end;
end;

procedure TfrmLiquidacionCastigada.GrabarTablaLiquidacion;
begin
        with IBQuery1 do
         begin
          sql.Clear;
          sql.Add('update "col$tablaliquidacion" set');
          sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
          sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
          sql.Add(' where ');
          sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
          sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ParamByName('CUOTA_NUMERO').AsInteger := Cuota_anterior;
          ParamByName('PAGADA').AsBoolean := true;
          ParamByName('FECHA_PAGADA').AsDate := fFechaActual;
          ExecSQL;
          Close;
         end;
end;

procedure TfrmLiquidacionCastigada.BtnCerrarClick(Sender: TObject);
begin
        if DmColocacion.IBDSagencias.Transaction.InTransaction then
           DmColocacion.IBDSagencias.Transaction.Rollback;
        Close;
end;

procedure TfrmLiquidacionCastigada.CmdBuscarClick(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;

end;

procedure TfrmLiquidacionCastigada.CmdInformeClick(Sender: TObject);
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

           ReporteCas.Variables.ByName['Empresa'].AsString := Empresa;
           ReporteCas.Variables.ByName['Colocacion'].AsString := vColocacion;
           ReporteCas.Variables.ByName['Hoy'].AsDateTime := fFechaActual;
           ReporteCas.Variables.ByName['FechaCorte'].AsDateTime := fFechaActual;
           ReporteCas.Variables.ByName['ProximaCuota'].AsString := FechaProx;
           ReporteCas.Variables.ByName['Asociado'].AsString := Asociado;
           ReporteCas.Variables.ByName['Cuenta'].AsString := IntToStr(NumeroCuenta) + '-' + IntToStr(DigitoCuenta);
           ReporteCas.Variables.ByName['NuevoSaldo'].AsDouble := vSaldoActual - vAbonoCapital;
           ReporteCas.Variables.ByName['InteresesHasta'].AsDateTime := vFechaFInt;
           ReporteCas.Variables.ByName['CapitalHasta'].AsDateTime := FechaCapAnt;
           ReporteCas.Variables.ByName['comprobante'].AsString := VComprobante;
           ReporteCas.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;


           if ReporteCas.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := ReporteCas;
              frmVistaPreliminar.ShowModal;
           end;

           IBInforme.EmptyDataSet;
end;

procedure TfrmLiquidacionCastigada.Empleado;
begin
        with dmColocacion.IBQuery do
         begin
           if Transaction.InTransaction then
             Transaction.Rollback;
           Transaction.StartTransaction;         
           sql.Clear;
           sql.Add('select ID_EMPLEADO, DOCUMENTO, PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           vComprobanteTmp := StrToInt(Trim(FieldByName('DOCUMENTO').AsString));
           Close;
         end;
end;

procedure TfrmLiquidacionCastigada.inicializar;
begin
  if dmGeneral.IBTransaction1.InTransaction then
    dmGeneral.IBTransaction1.Rollback;
  dmGeneral.IBTransaction1.StartTransaction;

  dmColocacion.IBDSagencias.Active := true;
  dmColocacion.IBDSagencias.Last;
  dmColocacion.IBDSagencias.First;

  vColocacion := '';
  vComprobante := '';
  vFechaInteres           := fFechaActual;
  vFechaCapital           := fFechaActual;
  TipoInteres             := 0;
  vPuntosAdic             := 0;
  TasaC                   := 0;
  EstadoActual            := 0;
  Clasificacion           := 0;
  Garantia                := 0;
  Categoria               := '';
  CodigoPuc               := '';
  FechaInicial            := fFechaActual;
  FechaFinal              := fFechaActual;
  vTasa                   := 0;
  vDias                   := 0;
  vTasaA                  := 0;
  vDiasA                  := 0;
  TipoInteres             := 0;
  vPuntosAdic             := 0;
  TasaC                   := 0;
  EstadoActual            := 0;
  Caja                    := 0;
  Debito                  := 0;
  Credito                 := 0;
  TipoCuota               := 0;
  Amortizacion            := 0;
  vFechaIInt              := fFechaActual;
  vFechaFInt              := fFechaActual;
  FechaInteres            := fFechaActual;

  vSaldoActual := 0;
  vAbonocapital := 0;
  vAbonoInteres := 0;
  vAbonoAprov := 0;
  vcostas := 0;
  vhonorarios := 0;
  DescripcionEstado       := '';
  vNacional               := 0;
  vComisionNal            := 0;
  vConsignaAhorros        := 0;
  Banco                   := -1;

  //**
  vValorCuota             := 0;
  CapitalaPagar           := 0;
  InteresaPagar           := 0;
  totaldebitos            := 0;
  totalcreditos           := 0;
  NumeroCuenta            := 0;
  DigitoCuenta            := 0;
  vTotalAhorros           := 0;
  vTotalLiquidacion       := 0;
  TGeneral                := 0;
  //**

  EdAgencia.KeyValue := Agencia;
  EdNumeroColocacion.Text := vColocacion;
  EdNumeroIdentificacion.Caption := '';
  EdNombre.Caption := '';
  EdSaldoColocacion.Caption := '';
  EdFechaCapital.Caption := '';
  EdFechaInteres.Caption := '';
  EdCuentaAbogado.Caption := '';
  EdAbogado.Caption := '';
  EdNoComprobante.Text := '';
  EdAbonoCapital.Text := '';
  EdAbonoInteres.Text := '';
  EdAprovecha.Text := '';
  EdAbonoCostas.Text := '';
  EdFechaInicial.Date := fFechaActual;
  EdFechaFinal.Date := fFechaActual;
  EdFechaInicialA.Date := fFechaActual;
  EdFechaFinalA.Date := fFechaActual;
  EdDiasAplicados.Text := '';
  EdTasaAplicada.Text := '';
  EdDiasAplicadosA.Text := '';
  EdTasaAplicadaA.Text := '';
  EdAgencia.SetFocus;
  CmdInforme.Enabled := False;
  CmdGrabar.Visible := False;
  CmdReversar.Visible := False;
  EdFechaInicial.Visible := False;
  EdFechaFinal.Visible := False;
  EdDiasAplicados.Visible := False;
  EdTasaAplicada.Visible := False;
  EdFechaInicialA.Visible := False;
  EdFechaFinalA.Visible := False;
  EdDiasAplicadosA.Visible := False;
  EdTasaAplicadaA.Visible := False;
  Label116.Visible := False;
  Label117.Visible := False;
  Label125.Visible := False;
  Label126.Visible := False;
  CmdAceptar.Visible := True;
  CmdAceptar.Enabled := True;
  EdTotalColManual.Caption := '';
  EdEstado.Caption := '';
  EdCostas.Caption := '';
  GroupBox3.Enabled := True;
  EdNacional.Value := 0;
  DBLCBBancos.Enabled := False;
  EdFechaConsignacion.Date := fFechaActual;

  try
    ListaCuentas := TList.Create;
  finally
    ListaCuentas.Clear;
  end;

  GridCuentas.RowCount := 2;
  GridCuentas.ColCount := 2;
  GridCuentas.Cells[0,1] := '';
  GridCuentas.Cells[1,1] := '';
  GridCuentas.ColWidths[0] := 80;
  GridCuentas.ColWidths[1] := 120;
  GridCuentas.Cells[0,0] := 'Cuenta';
  GridCuentas.Cells[1,0] := 'Saldo a Descontar';

  vPapeleria := 0;
  vExAsociados := 0;
  ChkPapeleria.Checked := False;
  Fallecido.Checked := False;
  Incapacitado.Checked := False;
  Dacion.Checked := False;
  EdExasociados.Value := 0;
  NumeroCuentaAbogado := 0;
  DigitoCuentaAbogado := 0;
end;


procedure TfrmLiquidacionCastigada.CmdGrabarClick(Sender: TObject);
var
I,J : integer;
TotalDebitoRecibo : Currency;
TotalCreditoRecibo : Currency;
Consec:string;
DescImpuesto : Currency;
DescImpuestoAhorros : Currency;
DescImpuestoaportes : Currency;
ValorGMF:Currency;
AC:PCuentas;
CodigoGMFAhorros:string;
CodigoGMFAportes:string;
CodigoGMF,CodigoGMFApo:string;
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
    Consec := FormatCurr('00000000',ObtenerConsecutivo(IBSaldo,1));
    vComprobante := Consec;
    EdNoComprobante.Text := Consec;
    dmGeneral.IBTransaction1.StartTransaction;

    with IBQuery do
     try
      grabarextracto;

      SQL.Clear;
      SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 19');
      Open;
      CodigoGMFAportes := FieldByName('CODIGO').AsString;
      Close;

      SQL.Clear;
      SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 29');
      Open;
      CodigoGMFAhorros := FieldByName('CODIGO').AsString;
      Close;

      SQL.Clear;
      SQL.Add('SELECT "gen$minimos".VALOR_MINIMO FROM "gen$minimos"');
      SQL.Add('WHERE "gen$minimos".ID_MINIMO = 12');
      Open;
      ValorGMF := FieldByName('VALOR_MINIMO').AsCurrency / 1000;
      Close;

      SQL.Clear;
      SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 20');
      Open;
      CodigoGMF := FieldByName('CODIGO').AsString;
      Close;

      SQL.Clear;
      SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 58');
      Open;
      CodigoGMFApo := FieldByName('CODIGO').AsString;
      Close;

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
        // LLevo al extracto de Ahorros
        if vhonorarios > 0 then begin
           SQL.Clear;
           SQL.Add('insert into "cap$extracto" values(');
           SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
           SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
           SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
           SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
           ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAbogado;
           ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAbogado;
           ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
           ParamByName('HORA_MOVIMIENTO').AsTime := fHoraActual;
           ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 19;
           ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdNocomprobante.Text;
           ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'PAGO DE HONORARIOS COL. No.' + vColocacion;
           ParamByName('VALOR_DEBITO').AsCurrency := vHonorarios;
           ParamByName('VALOR_CREDITO').AsCurrency := 0;
           try
             Open;
             if RowsAffected < 1 then
              begin
                MessageDlg('Error Grabando Extracto Captaciones',mtError,[mbok],0);
                Exit;
              end
           except
                MessageDlg('Error Grabando Extracto Captaciones',mtError,[mbok],0);
                Exit;
           end; // del try
        end;

      DescImpuestoAhorros := SimpleRoundTo((vTotalAhorros * ValorGMF),0);
      DescImpuestoAportes := SimpleRoundTo((vTotalAportes * ValorGMF),0);
//      DescImpuesto := SimpleRoundTo(DescImpuestoAhorros + DescImpuestoaportes,0);
      New(AR);
      AR^.CuotaNumero := 0;
      AR^.CodigoPuc   := CodigoGMF;
      AR^.FechaInicial := fFechaActual;
      AR^.FechaFinal   := fFechaActual;
      AR^.Dias         := 0;
      AR^.Tasa         := 0;
      AR^.Debito       := DescImpuestoAhorros;
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
      AR^.CodigoPuc   := CodigoGMFApo;
      AR^.FechaInicial := fFechaActual;
      AR^.FechaFinal   := fFechaActual;
      AR^.Dias         := 0;
      AR^.Tasa         := 0;
      AR^.Debito       := DescImpuestoAportes;
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
      AR^.CodigoPuc   := CodigoGMFAhorros;
      AR^.FechaInicial := fFechaActual;
      AR^.FechaFinal   := fFechaActual;
      AR^.Dias         := 0;
      AR^.Tasa         := 0;
      AR^.Debito       := 0;
      AR^.Credito      := DescImpuestoAhorros;
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
      AR^.CodigoPuc   := CodigoGMFAportes;
      AR^.FechaInicial := fFechaActual;
      AR^.FechaFinal   := fFechaActual;
      AR^.Dias         := 0;
      AR^.Tasa         := 0;
      AR^.Debito       := 0;
      AR^.Credito      := DescImpuestoAportes;
      AR^.EsCapital := False;
      AR^.EsCausado := False;
      AR^.EsCorriente := False;
      AR^.EsVencido := False;
      AR^.EsAnticipado := False;
      AR^.EsDevuelto := False;
      if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);

      TotalDebitoRecibo := TotalDebitoRecibo + DescImpuestoAhorros + DescImpuestoaportes;
      TotalCreditoRecibo := TotalCreditoRecibo + DescImpuestoAhorros + DescImpuestoaportes;

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



//**Actualizo extracto Aportes y Captaciones
    for I := 0 to ListaCuentas.Count - 1 do begin
      AC := ListaCuentas.Items[i];
      with IBQuery1 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('insert into "cap$extracto" values(');
         SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
         SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
         SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
         SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
         ParamByName('ID_AGENCIA').AsInteger := AC^.Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := AC^.Tipo;
         ParamByName('NUMERO_CUENTA').AsInteger := AC^.Cuenta;
         ParamByName('DIGITO_CUENTA').AsInteger := AC^.Digito;
         ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
         ParamByName('HORA_MOVIMIENTO').AsTime := Time;
         if AC^.Saldo > 0 then
          begin
            ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 17;
            ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vComprobante;
            ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'DESCUENTO DE CARTERA COLOCACION No.' + vcolocacion;
            ParamByName('VALOR_DEBITO').AsCurrency := 0;
            ParamByName('VALOR_CREDITO').AsCurrency := AC^.Saldo;
            try
              ExecSQL;
              if RowsAffected < 1 then
               begin
                 MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
                 Exit;
               end
            except
               MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
               Exit;
            end; // del try
          end; // del if
       end; // del with
    end; // del for

//***fin actualizo extracto
    if vConsignaAhorros > 0 then begin
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
         ParamByName('HORA_MOVIMIENTO').AsTime := Time;
         ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
         ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vComprobante;
         ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'CONSIG. NAL DTO CARTERA COL. No.' + vColocacion;
         ParamByName('VALOR_DEBITO').AsCurrency := vConsignaAhorros;
         ParamByName('VALOR_CREDITO').AsCurrency := 0;
         try
          ExecSQL;
         if RowsAffected < 1 then
           begin
             MessageDlg('Error Grabando Extracto Ahorros',mtError,[mbok],0);
             Exit;
           end
         except
           MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
           Exit;
         end; // del try
      end; // del with
    end; // Fin de if vConsignacionAhorros > 0

    if vNacional > 0 then begin
      with IBQuery1 do begin
        Close;
        SQL.Clear;
        SQL.Add('insert into "col$pagoconnal" VALUES(');
        SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:FECHA_EXTRACTO,:ID_CBTE_COLOCACION,');
        SQL.Add(':FECHA_CONSIGNACION)');
        ParamByName('ID_AGENCIA').AsInteger := Agencia;
        ParamByName('ID_COLOCACION').AsString := vColocacion;
        ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
        ParamByName('ID_CBTE_COLOCACION').AsString := vComprobante;
        ParamByName('FECHA_CONSIGNACION').AsDate := FechaConsignacion;
         try
          ExecSQL;
          if RowsAffected < 1 then
            begin
              MessageDlg('Error Grabando Tabla de Nacional',mtError,[mbok],0);
              Exit;
            end;
         except
            MessageDlg('Error Grabando Tabla de Nacional',mtError,[mbok],0);
            Exit;
         end; // del try
       end;
    end;


  DmGeneral.IBTransaction1.Commit;
  VerificarCancelacionCredito(Agencia,vColocacion);
  VerificacionCambioEstado;
  
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

procedure TfrmLiquidacionCastigada.CmdReversarClick(Sender: TObject);
begin
          DmGeneral.IBTransaction1.Rollback;
          MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
          Inicializar;
end;

procedure TfrmLiquidacionCastigada.DiasInteres;
begin
        if EdDiasAplicados.Text = '' then EdDiasAplicados.Text := '0';
        vDias := StrToInt(EdDiasAplicados.Text);
        EdDiasAplicados.Text := FormatCurr('#0',vDias);
        if (vAbonoInteres <> 0) then
        begin
           vFechaInicialInteres := CalculoFecha(vFechaInteres,1);
           vFechaFinalInteres := CalculoFechaManual(vFechaInicialInteres,vDias);
           EdFechaInicial.Date := vFechaInicialInteres;
           EdFechaFinal.Date := vFechaFinalInteres;
        end;
end;

procedure TfrmLiquidacionCastigada.LimpiarManualIntereses;
begin
  EdAbonoInteres.Text := '';
  EdAbonoCostas.Text := '';
  EdAbonoHonorarios.Text := '';
  EdDiasAplicados.Text := '';
  EdTasaAplicada.Text := '';
  TGeneral := TGeneral - vAbonocapital - vAbonoInteres - vcostas - vhonorarios;
  vAbonoInteres :=0;
  vDias:=0;
  vTasa:=0;
  vhonorarios := 0;
  vcostas := 0;
  EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TfrmLiquidacionCastigada.EdAbonoCostasExit(
  Sender: TObject);
begin
          vcostas := EdAbonoCostas.Value;
          TGeneral := vAbonoCapital + vAbonoInteres + vcostas + vhonorarios + vPapeleria + vExAsociados+ vComisionNal + vAbonoAprov;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionCastigada.EdAbonoHonorariosExit(
  Sender: TObject);
begin
          vhonorarios := EdAbonoHonorarios.Value;
          TGeneral := vAbonoCapital + vAbonoInteres + vcostas + vhonorarios + vPapeleria + vExAsociados + vComisionNal + vAbonoAprov;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

function TfrmLiquidacionCastigada.BuscarAhorros(TipoId: integer;
  NumeroId: string): currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo:Integer;
begin
           with IBSQL2 do begin
                Close;
                SQL.Clear;
                SQL.Add('Select First 1 "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA,"cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestrotitular"');
                SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND');
                SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 2 and');
                SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
                ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
                ParamByName('ID_PERSONA').AsString  := vNumeroId;
                ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                try
                  ExecQuery;
                  if RecordCount < 1 then
                  begin
                   Saldo := 0;
//                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
//                   EdNumeroCap.SetFocus;
//                   Exit;
                  end;
                  Saldo := FieldByName('SALDO_INICIAL').AsCurrency;
                  Ag := FieldByName('ID_AGENCIA').AsInteger;
                  Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                  DigitoCuenta := FieldByName('DIGITO_CUENTA').AsInteger;
                except
                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   Result := 0;
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
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
                ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(ffechaactual),01,01);
                ParamByName('FECHA2').AsDate := EncodeDate(YearOf(ffechaactual),12,01);
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
                SQL.Add('SELECT SUM("cap$canje".VALOR_CHEQUE + "cap$canje".VALOR_MONEDAS) AS CANJE');
                SQL.Add('FROM');
                SQL.Add('"cap$maestro"');
                SQL.Add('LEFT JOIN "cap$canje" ON ("cap$maestro".ID_AGENCIA = "cap$canje".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$canje".ID_TIPO_CAPTACION) AND ("cap$maestro".NUMERO_CUENTA = "cap$canje".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$canje".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$canje".LIBERADO = 0 and');
                SQL.Add('"cap$canje".DEVUELTO = 0');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
                ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
                try
                 ExecQuery;
                 if RecordCount < 1 then
                   Canje := 0
                 else
                   Canje := FieldByName('CANJE').AsCurrency;
                except
                   MessageDlg('Error Consultando Canje',mtError,[mbcancel],0);
                   Canje := 0;
                end;
         end;
         Saldo := Saldo + Movimiento;
         Disponible := Saldo - Canje;
         Result := Disponible;

end;

procedure TfrmLiquidacionCastigada.ActualizarCaptaciones(
TipoId: integer; NumeroId: String);
var  Saldo :Currency;
     AR:PCuentas;
     i:Integer;
begin
      vTotalCuentas := 0;
      vTotalAportes := 0;
      vTotalAhorros := 0;
      vTotalJuvenil := 0;

      with IBSQL1 do begin
        Close;
        SQL.Clear;
        SQL.Add('select "cap$maestrotitular".ID_AGENCIA, "cap$maestrotitular".ID_TIPO_CAPTACION, "cap$maestrotitular".NUMERO_CUENTA, "cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
        SQL.Add('inner join "cap$maestro" ON ( "cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
        SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION  and');
        SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
        SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA )');
        SQL.Add('inner join "cap$tiposestado" ON ( "cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO )');
        SQL.Add('where');
        SQL.Add('ID_IDENTIFICACION = :ID and ID_PERSONA = :ID_PERSONA and "cap$tiposestado".SE_SUMA <> 0 and "cap$maestrotitular".NUMERO_TITULAR = 1 and');
        SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 1 or "cap$maestrotitular".ID_TIPO_CAPTACION = 2 or "cap$maestrotitular".ID_TIPO_CAPTACION = 4)');
        SQL.Add('order by "cap$maestrotitular".ID_AGENCIA, "cap$maestrotitular".ID_TIPO_CAPTACION, "cap$maestrotitular".NUMERO_CUENTA, "cap$maestrotitular".DIGITO_CUENTA');
        ParamByName('ID').AsInteger := TipoId;
        ParamByName('ID_PERSONA').AsString := NumeroId;
        try
          ExecQuery;
          if RecordCount > 0 then begin
           i := 1;
           while not Eof do begin
            if i > 1 then
              GridCuentas.RowCount := GridCuentas.RowCount + 1;
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select SALDO_DISPONIBLE from SALDO_DISPONIBLE (:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                IBSQL2.ParamByName('TP').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBSQL2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBSQL2.ParamByName('DGT').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                IBSQL2.ParamByName('ANO').AsString := LeftStr(EdFecha.Caption,4);
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(ffechaactual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(ffechaactual),12,31);
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount > 0 then begin
                    GridCuentas.Cells[0,i] := IntToStr(FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                                              Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                              Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                              IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                    GridCuentas.Cells[1,i] := FormatCurr('$ #,#0.00',IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency);
                    if FieldByName('ID_TIPO_CAPTACION').AsInteger = 1 then begin
                      vTotalAportes := vTotalAportes + IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency;
                      if vTotalAportes > 0 then
                        MessageDlg('Crédito Castigado con Saldo en Aportes' + #13,mtWarning,[mbok],0);
                      SaldoAportes := vTotalAportes;
                    end
                    else
                    if FieldByName('ID_TIPO_CAPTACION').AsInteger = 2 then begin
                      vTotalAhorros := vTotalAhorros + IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency;
                      SaldoAhorros := vTotalAhorros;
                      NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                      DigitoCuenta := FieldByName('DIGITO_CUENTA').AsInteger
                    end
                    else
                    if FieldByName('ID_TIPO_CAPTACION').AsInteger = 4 then begin
                      vTotalJuvenil := vTotalJuvenil + IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency;
                      SaldoJuvenil := vTotalJuvenil;
                    end;

                    vTotalCuentas := vTotalCuentas + IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency;
                    SaldoCuentas := vTotalCuentas;
                    New(AR);
                    AR^.Agencia := FieldByName('ID_AGENCIA').AsInteger;
                    AR^.Tipo    := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                    AR^.Cuenta  := FieldByName('NUMERO_CUENTA').AsInteger;
                    AR^.Digito  := FieldByName('DIGITO_CUENTA').AsInteger;
                    AR^.Saldo   := IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency;
                    ListaCuentas.Add(AR);
                   end;
                 except
                   raise;
                 end;
                 i := i + 1;
                 Next;
             end;
           end;
        except
          Transaction.Rollback;
          raise;
        end;
      end;
end;

procedure TfrmLiquidacionCastigada.ChkPapeleriaClick(Sender: TObject);
begin
        if ChkPapeleria.Checked then begin
           with IBSQL1 do begin
             Close;
             SQL.Clear;
             SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 4');
             ExecQuery;
             vPapeleria := FieldByName('VALOR_MINIMO').AsCurrency;
             Close;
           end;
           EdExasociados.Enabled := True;
         end
        else begin
           vPapeleria := 0;
           EdExasociados.Enabled := False;
        end;
        
        TGeneral := vAbonoCapital + vAbonoInteres + vhonorarios + vcostas + vPapeleria + vExAsociados;
        EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionCastigada.EdExasociadosEnter(Sender: TObject);
begin
        EdExasociados.SelectAll;
end;

procedure TfrmLiquidacionCastigada.EdExasociadosExit(Sender: TObject);
begin
        vExAsociados := EdExasociados.Value;
        TGeneral := vAbonoCapital + vAbonoInteres + vPapeleria + vExAsociados + vcostas + vhonorarios;
        EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionCastigada.EdAbonoCostasEnter(Sender: TObject);
begin
        EdAbonoCostas.SelectAll;
end;

procedure TfrmLiquidacionCastigada.EdAbonoInteresEnter(Sender: TObject);
begin
        EdAbonoInteres.SelectAll;
end;

procedure TfrmLiquidacionCastigada.EdAbonoCapitalEnter(Sender: TObject);
begin
        EdAbonoCapital.SelectAll;
end;

procedure TfrmLiquidacionCastigada.EdDiasAplicadosEnter(Sender: TObject);
begin
        EdDiasAplicados.SelectAll;
end;

procedure TfrmLiquidacionCastigada.EdFechaConsignacionExit(
  Sender: TObject);
begin
        FechaConsignacion := EdFechaConsignacion.Date;
end;

procedure TfrmLiquidacionCastigada.DBLCBBancosExit(Sender: TObject);
begin
     if DBLCBBancos.KeyValue < 0 then
      begin
        MessageDlg('Debe Seleccionar un Banco',mtError,[mbok],0);
        DBLCBBancos.SetFocus;
      end
     else
      begin
        Banco := DBLCBBancos.KeyValue;
        IBNacional.Close;
        IBNacional.ParamByName('ID_BANCO').AsInteger := Banco;
        IBNacional.ExecQuery;
        vComisionNal := IBNacional.FieldByName('COMISION').AsCurrency;
        IBNacional.Close;
      end;
end;

procedure tfrmliquidacioncastigada.VerificacionCambioEstado;
begin
        if EstadoActual <> NuevoEstado then begin
          with IBCambioEstado do begin
            if Transaction.InTransaction then
              Transaction.Commit;
            Transaction.StartTransaction;

            Close;
            SQL.Clear;
            SQL.Add('insert into "col$cambioestado" values(:ID_AGENCIA,:ID_COLOCACION,:FECHA_CAMBIO,');
            SQL.Add(':ID_ESTADO_ACTUAL,:ID_ESTADO_NUEVO,:ID_EMPLEADO,:SALDO,:FECHA_CAPITAL,:FECHA_INTERES)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('FECHA_CAMBIO').AsDate := fFechaActual;
            ParamByName('ID_ESTADO_ACTUAL').AsInteger := EstadoActual;
            ParamByName('ID_ESTADO_NUEVO').AsInteger := NuevoEstado;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('SALDO').AsCurrency := vSaldoActual - vAbonocapital;
            ParamByName('FECHA_CAPITAL').AsDate := FechaCapAnt;
            ParamByName('FECHA_INTERES').AsDate := vFechaFInt;
            ExecQuery;
            Close;

            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := NuevoEstado;
            ExecQuery;
            Close;
            Transaction.Commit;
          end;
        end;
end;

procedure TfrmLiquidacionCastigada.EdNacionalEnter(Sender: TObject);
begin
        EdNacional.SelectAll;
end;

procedure TfrmLiquidacionCastigada.EdNacionalExit(Sender: TObject);
begin
       vNacional := EdNacional.Value;
       if EdNacional.Value > 0 then
       begin
        IBQuery3.Open;
        IBQuery3.Last;
        DBLCBBancos.Enabled := True;
        EdFechaConsignacion.Enabled := True;
       end
       else
       begin
        IBQuery3.Close;
        DBLCBBancos.Enabled := False;
        DBLCBBancos.KeyValue := -1;
        EdFechaConsignacion.Enabled := False;
       end;

      vTotalCuentas := vTotalAportes + vTotalAhorros + vTotalJuvenil + vNacional;
      DBLCBBancos.SetFocus;
end;

procedure TfrmLiquidacionCastigada.FallecidoClick(Sender: TObject);
begin
        if Fallecido.Checked = True then
         begin
           Incapacitado.Checked := False;
           Dacion.Checked := False;
         end;
end;

procedure TfrmLiquidacionCastigada.IncapacitadoClick(Sender: TObject);
begin
        if Incapacitado.Checked = True then
         begin
           Fallecido.Checked := False;
           Dacion.Checked := False;
         end;
end;

procedure TfrmLiquidacionCastigada.DacionClick(Sender: TObject);
begin
        if Dacion.Checked = True then
         begin
           Fallecido.Checked := False;
           Incapacitado.Checked := False;
         end;
end;

procedure TfrmLiquidacionCastigada.EdAprovechaEnter(Sender: TObject);
begin
        EdAprovecha.SelectAll;
end;

procedure TfrmLiquidacionCastigada.EdAprovechaExit(Sender: TObject);
begin
          vAbonoAprov := EdAprovecha.Value; // (EdAbonoCapital.Text);
          TGeneral := vAbonoCapital + vAbonoInteres + vcostas + vhonorarios + vPapeleria + vExAsociados + vComisionNal + vAbonoAprov;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
          if vAbonoAprov > 0 then
           begin
             EdFechaInicialA.Visible := True;
             EdFechaFinalA.Visible := True;
             EdDiasAplicadosA.Visible := True;
             EdTasaAplicadaA.Visible := True;
             Label116.Visible := True;
             Label117.Visible := True;
             Label125.Visible := True;
             Label126.Visible := True;
             EdDiasAplicadosA.SetFocus;
           end;
end;

procedure TfrmLiquidacionCastigada.EdDiasAplicadosAEnter(Sender: TObject);
begin
        EdDiasAplicadosA.SelectAll;
end;

procedure TfrmLiquidacionCastigada.EdDiasAplicadosAExit(Sender: TObject);
begin
        DiasAprov;
        vTasaA := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,vFechaInicialInteresA).TasaMora;
        EdTasaAplicadaA.Text := FormatCurr('#0.00%',vTasaA);
end;

procedure TfrmLiquidacionCastigada.DiasAprov;
begin
        if EdDiasAplicadosA.Text = '' then EdDiasAplicadosA.Text := '0';
        vDiasA := StrToInt(EdDiasAplicadosA.Text);
        EdDiasAplicadosA.Text := FormatCurr('#0',vDiasA);
        if (vAbonoAprov <> 0) and (vAbonoInteres <> 0) then
         begin
           vFechaInicialInteresA := CalculoFecha(vFechaFinalInteres,1);
           vFechaFinalInteresA := CalculoFechaManual(vFechaInicialInteresA,vDiasA);
           EdFechaInicialA.Date := vFechaInicialInteresA;
           EdFechaFinalA.Date := vFechaFinalInteresA;
         end
        else if (vAbonoAprov <> 0) then
         begin
           vFechaInicialInteresA := CalculoFecha(vFechaInteres,1);
           vFechaFinalInteresA := CalculoFechaManual(vFechaInicialInteresA,vDiasA);
           EdFechaInicialA.Date := vFechaInicialInteresA;
           EdFechaFinalA.Date := vFechaFinalInteresA;
         end;
end;

end.
