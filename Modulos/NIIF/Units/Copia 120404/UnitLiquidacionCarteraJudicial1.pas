unit UnitLiquidacionJudicialDes;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, DB,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, IBSQL, DateUtils, Math,
  DBClient, JvEdit, JvTypedEdit, Grids, JvStringGrid;

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

type
     TCuotasLiq = record
     Lista:TList;
     FechaProx:TDate;
     NuevoSaldo:Currency;
     InteresesHasta:TDate;
     CapitalHasta:TDate;
     Liquidado:Boolean;
end;
  
type
  TfrmLiquidacionJudicialDes = class(TForm)
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdInforme: TBitBtn;
    BtnCerrar: TBitBtn;
    IBQuery: TIBQuery;
    CmdReversar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBSaldo: TIBSQL;
    IBExtractoDet: TIBSQL;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
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
    GroupBox1: TGroupBox;
    Label9: TLabel;
    EdNocomprobante: TMaskEdit;
    IBSQL2: TIBSQL;
    IBSQL1: TIBSQL;
    Label124: TLabel;
    EdTotalColManual: TStaticText;
    PageControl1: TPageControl;
    InfoJudicial: TTabSheet;
    InfoCastigada: TTabSheet;
    GroupBox7: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    EdInteresDevuelto: TLabeledEdit;
    EdDiasDevuelto: TLabeledEdit;
    EdTasaDevolucion: TLabeledEdit;
    EdFechaInicialDevuelto: TDateTimePicker;
    EdFechaFinalDevuelto: TDateTimePicker;
    LabeledEdit20: TLabeledEdit;
    DateTimePicker13: TDateTimePicker;
    DateTimePicker14: TDateTimePicker;
    LabeledEdit21: TLabeledEdit;
    LabeledEdit22: TLabeledEdit;
    LabeledEdit23: TLabeledEdit;
    LabeledEdit24: TLabeledEdit;
    DateTimePicker15: TDateTimePicker;
    DateTimePicker16: TDateTimePicker;
    LabeledEdit25: TLabeledEdit;
    LabeledEdit26: TLabeledEdit;
    LabeledEdit27: TLabeledEdit;
    GroupBox6: TGroupBox;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    EdAbonoInteresCausado: TLabeledEdit;
    EdDiasAplicadosCausado: TLabeledEdit;
    EdTasaAplicadaCausado: TLabeledEdit;
    EdFechaInicialCausado: TDateTimePicker;
    EdFechaFinalCausado: TDateTimePicker;
    EdAbonoInterescorriente: TLabeledEdit;
    EdFechaInicialCorriente: TDateTimePicker;
    EdFechaFinalCorriente: TDateTimePicker;
    EdDiasAplicadosCorriente: TLabeledEdit;
    EdTasaAplicadaCorriente: TLabeledEdit;
    EdAbonoInteresMora: TLabeledEdit;
    EdFechaInicialMora: TDateTimePicker;
    EdFechaFinalMora: TDateTimePicker;
    EdDiasAplicadosMora: TLabeledEdit;
    EdTasaAplicadaMora: TLabeledEdit;
    EdAbonoInteresContingente: TLabeledEdit;
    EdFechaInicialContingente: TDateTimePicker;
    EdFechaFinalContingente: TDateTimePicker;
    EdDiasAplicadosContingente: TLabeledEdit;
    EdTasaAplicadaContingente: TLabeledEdit;
    EdAbonoCostas: TLabeledEdit;
    EdAbonoHonorarios: TLabeledEdit;
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
    CmdNuevo: TBitBtn;
    GroupBox13: TGroupBox;
    Label169: TLabel;
    Label168: TLabel;
    EdCuentaAbogado: TStaticText;
    EdAbogado: TStaticText;
    Report: TprTxReport;
    IBTabla: TIBSQL;
    IBConsulta: TIBSQL;
    IBQuery3: TIBQuery;
    DataSource1: TDataSource;
    IBNacional: TIBSQL;
    EdAbonoCapital: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdAbonoCapitalExit(Sender: TObject);
    procedure EdAbonoInteresanticipadoExit(Sender: TObject);
    procedure EdAbonoInterescausadoExit(Sender: TObject);
    procedure EdAbonoInterescorrienteExit(Sender: TObject);
    procedure EdAbonoInteresmoraExit(Sender: TObject);
    procedure EdFechaInicialCausadoExit(Sender: TObject);
    procedure EdFechaFinalcausadoExit(Sender: TObject);
    procedure EdDiasAplicadosCausadoExit(Sender: TObject);
    procedure EdTasaAplicadaCausadoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdFechaInicialCorrienteExit(Sender: TObject);
    procedure EdFechaInicialAnticipadoExit(Sender: TObject);
    procedure EdFechaInicialMoraExit(Sender: TObject);
    procedure EdDiasAplicadosCorrienteExit(Sender: TObject);
    procedure EdDiasAplicadosAnticipadoExit(Sender: TObject);
    procedure EdTasaAplicadaAnticipadoExit(Sender: TObject);
    procedure EdTasaAplicadaCorrienteExit(Sender: TObject);
    procedure EdTasaAplicadaMoraExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure BtnCerrarClick(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure EdTasaAplicadaCausadoEnter(Sender: TObject);
    procedure EdTasaAplicadaCorrienteEnter(Sender: TObject);
    procedure EdTasaAplicadaAnticipadoEnter(Sender: TObject);
    procedure EdTasaAplicadaMoraEnter(Sender: TObject);
    procedure EdInteresDevueltoExit(Sender: TObject);
    procedure EdFechaInicialDevueltoExit(Sender: TObject);
    procedure EdFechaFinalDevueltoExit(Sender: TObject);
    procedure EdFechaFinalCorrienteExit(Sender: TObject);
    procedure EdFechaFinalAnticipadoExit(Sender: TObject);
    procedure EdFechaFinalMoraExit(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure CmdReversarClick(Sender: TObject);
    procedure EsCapitalClick(Sender: TObject);
    procedure EsInteresesClick(Sender: TObject);
    procedure DevueltosClick(Sender: TObject);
    procedure CobradosClick(Sender: TObject);
    procedure GroupBox5Exit(Sender: TObject);
    procedure EdDiasAplicadosCausadoChange(Sender: TObject);
    procedure EdDiasAplicadosCorrienteChange(Sender: TObject);
    procedure EdAbonoInteresContingenteExit(Sender: TObject);
    procedure EdAbonoCostasExit(Sender: TObject);
    procedure EdDiasAplicadosContingenteExit(Sender: TObject);
    procedure EdDiasAplicadosContingenteChange(Sender: TObject);
    procedure EdTasaAplicadaContingenteExit(Sender: TObject);
    procedure EdDiasAplicadosMoraChange(Sender: TObject);
    procedure EdDiasAplicadosMoraExit(Sender: TObject);
    procedure EdDiasDevueltoExit(Sender: TObject);
    procedure EdDiasDevueltoChange(Sender: TObject);
    procedure EdTasaDevolucionExit(Sender: TObject);
    procedure EdInteresCobradoCausadoExit(Sender: TObject);
    procedure EdInteresCobradoCorrienteExit(Sender: TObject);
    procedure EdDiasCobradoCausadoExit(Sender: TObject);
    procedure EdDiasCobradoCausadoChange(Sender: TObject);
    procedure EdDiasCobradoCorrienteExit(Sender: TObject);
    procedure EdDiasCobradoCorrienteChange(Sender: TObject);
    procedure EdTasaCobradoCausadoExit(Sender: TObject);
    procedure EdTasaCobradoCorrienteExit(Sender: TObject);
    procedure GridCuentasGetCellAlignment(Sender: TJvStringGrid; AColumn,
      ARow: Integer; State: TGridDrawState; var CellAlignment: TAlignment);
    procedure ChkPapeleriaClick(Sender: TObject);
    procedure EdExasociadosExit(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure EdExasociadosEnter(Sender: TObject);
    procedure GridCuentasGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure GridCuentasExitCell(Sender: TJvStringGrid; AColumn,
      ARow: Integer; const EditText: String);
    procedure EdAbonoHonorariosExit(Sender: TObject);
    procedure EdNacionalExit(Sender: TObject);
    procedure DBLCBBancosExit(Sender: TObject);
    procedure EdNacionalEnter(Sender: TObject);
    procedure GridCuentasExit(Sender: TObject);
  private
    procedure GrabarExtracto;
    procedure GrabarTablaLiquidacion;
    procedure GrabarExtractoDet;
    procedure Empleado;
    procedure DiasCausado;
    procedure DiasCorriente;
    procedure DiasMora;
    procedure inicializar;
    function BuscarAhorros(TipoId: Integer; NumeroId: String): Currency;
    function BuscarAportes(TipoId: Integer; NumeroId: String): Currency;
    procedure LimpiarManualIntereses;
    procedure DiasContingentes;
    procedure VerificarCuentaAportes(Cuenta, Digito: Integer);
    procedure DiasDevuelto;
    procedure DiasAnticipado;
    procedure DiasCobradoCausado;
    procedure DiasCobradoCorriente;
    function BuscarJuvenil(TipoId: integer; NumeroId: String): Currency;
    procedure ActualizarCaptaciones(TipoId: integer; NumeroId: String);
    procedure VerificarCancelacionCaptacion(Agencia:Integer;Colocacion:string);
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
   NumeroCuentaAbogado:Integer;
   DigitocuentaAbogado:Integer;
end;

var
  frmLiquidacionJudicialDes: TfrmLiquidacionJudicialDes;
  vColocacion : string;
  vComprobante : string;
  vAbonocapital : currency;
  vAbonoInteresContingente:Currency;
  vAbonointeresAnticipado : currency;
  vAbonoInteresCorriente  : Currency;
  vAbonoInteresCausado    : Currency;
  vAbonoInteresMora       : Currency;
  vFechaInteres           : TDate;
  vFechaCapital           : TDate;
  vFechaInicialAnticipado : TDate;
  vFechaFinalAnticipado   : TDate;
  vFechaInicialContingente:TDate;
  vFechaInicialCorriente  : TDate;
  vFechaFinalContingente  : TDate;
  vFechaFinalCorriente    : TDate;
  vFechaInicialCausado    : TDate;
  vFechaFinalCausado      : TDate;
  vFechaInicialMora       : TDate;
  vFechaFinalMora         : TDate;
  vFechaInicialDevuelto   : TDate;
  vFechaInicialCobradoCorriente : TDate;
  vFechaInicialCobradoCausado : TDate;
  vFechaFinalDevuelto     : TDate;
  vFechaFinalCobradoCorriente : TDate;
  vFechaFinalCobradoCausado : TDate;
  vDiasAnticipado         : Integer;
  vDiasContingente:Integer;
  vDiasCorriente          : Integer;
  vDiasCausado            : Integer;
  vDiasMora               : Integer;
  vDiasDevuelto           : Integer;
  vDiasCobradoCausado     : Integer;
  vDiasCobradoCorriente   : Integer;
  vTasaAnticipado         : Single;
  vTasaContingente        : Single;
  vTasaCorriente          : Single;
  vTasaCausado            : Single;
  vTasaMora               : Single;
  vTasaDevolucion         : Single;
  vTasaCobradoCausado     : Single;
  vTasaCobradoCorriente   : Single;
  vTasaDevCob             : Single;
  vSaldoActual            : Currency;
  vInteresDevuelto        : Currency;
  vInteresCobradoCausado  : Currency;
  vInteresCobradoCorriente: Currency;
  vInteresCobrado         : Currency;
  vTipoInteres            : string;
  Clasificacion           : Integer;
  Garantia                : Integer;
  Categoria               : String;
  TipoCuota               : integer;
  Amortizacion            : integer;
  AmortizaK               : Integer;
  TasaLiquidacion         : Single;
  CodigoPuc               : String;
  FechaInicial            : TDate;
  FechaFinal              : TDate;
  vFechaIInt              : TDate;
  vFechaFInt              : TDate;
  Tasa                    : Single;
  Dias                    : Integer;
  Caja                    : Currency;
  Debito                  : Currency;
  Credito                 : Currency;
  devolucion              : Boolean;
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
  NumeroCuentaAh          : Integer;
  DigitoCuentaAh          : Integer;
  NumeroCuentaAp          : Integer;
  DigitoCuentaAp          : Integer;
  vTotalLiquidacion       : Currency;
  vComprobanteTmp         : Integer;
  FechaIntAnt             : TDate;
  FechaCapAnt             : TDate;
  ValorDesembolsoCol      : Currency;
  SaldoActualCol          : Currency;

  vseguro        : currency;
  vpagxcliente   : currency;
  vhonorarios    : currency;
  vcostas        : Currency;
  votrospagos    : Currency;

  TGeneral : Currency;
  abono_capital : currency;
  abono_cxc : currency;
  abono_servicios : currency;
  abono_anticipado: currency;
  abono_mora : currency;
  Cuota_anterior : integer;
  cambio : Boolean;
  MyCuotasLiq : TCuotasLiq;
  AR : PCuotasLiq;

  ListaCuentas:TList;

  NuevaFechaCapital :TDate;

  Fila:Integer;
  NumeroCuentaAbogado:Integer;
  DigitoCuentaAbogado:Integer;
implementation

uses UnitDmGeneral, UnitdmColocacion, UnitGlobales, UnitBuscarColocacion,
     UnitVistaPreliminar, UnitGlobalesCol;

{$R *.dfm}

procedure TfrmLiquidacionJudicialDes.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmLiquidacionJudicialDes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmLiquidacionJudicialDes.EdNumeroColocacionExit(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

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

          Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
          Garantia := FieldByName('ID_GARANTIA').AsInteger;
          Categoria := FieldByName('ID_CATEGORIA').AsString;
          Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
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
             EdNumeroIdentificacion.Caption := FieldByName('ID_PERSONA').AsString ;
             EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
             vSaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
             EdSaldoColocacion.Caption := FormatCurr('#,#0.00',vSaldoActual);
             vFechaCapital := FieldByname('FECHA_CAPITAL').AsDateTime;
             EdFechaCapital.Caption := DateToStr(vFechaCapital);
             vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
             EdFechaInteres.Caption := DateToStr(vFechaInteres);
             EdEstado.Caption := DescripcionEstado;
             Close;

             if (Estado = 2) then
               PageControl1.ActivePage := InfoJudicial
             else if (Estado = 3) then
               PageControl1.ActivePage := InfoCastigada
             else begin
               MessageDlg('La Colocación NO está Judicial o Castigada',mtError,[mbOK],0);
               CmdNuevo.SetFocus;
               Exit;
             end;

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
                SQL.Clear;
                SQL.Add('select DIAS_INICIALES from "col$codigospuc" where');
                SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ID_GARANTIA = :ID_GARANTIA and');
                SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
                ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
                ParamByName('ID_GARANTIA').AsInteger := Garantia;
                ParamByName('ID_CATEGORIA').AsString := 'C';
                try
                 ExecQuery;
                 DiasMinimo := FieldByName('DIAS_INICIALES').AsInteger;
                 DiasMinimo := DiasMinimo - 30;
                except
                 DiasMinimo := 9999;
                raise;
                end;

                DiasTiene := DiasEntre(vFechaInteres,fFechaActual);
                if vTipoInteres = 'V' then DiasTiene := DiasTiene - Amortizacion;
                if DiasTiene < 0 then DiasTiene := 0;
                if DiasTiene < DiasMinimo then begin
                  Label123.Visible := False;
                  Label123.Enabled := False;
                  EdAbonoInteresContingente.Enabled := False;
                  EdAbonoInteresContingente.Visible := False;
                  EdFechaInicialContingente.Enabled := False;
                  EdFechaInicialContingente.Visible := False;
                  EdFechaFinalContingente.Enabled := False;
                  EdFechaFinalContingente.Visible := False;
                  EdDiasAplicadosContingente.Enabled := False;
                  EdDiasAplicadosContingente.Visible := False;
                  EdTasaAplicadaContingente.Enabled := False;
                  EdTasaAplicadaContingente.Visible := False;
                end
               else
                begin
                  Label123.Visible := True;
                  Label123.Enabled := True;
                  EdAbonoInteresContingente.Enabled := True;
                  EdAbonoInteresContingente.Visible := True;
                  EdFechaInicialContingente.Visible := True;
                  EdFechaFinalContingente.Visible := True;
                  EdDiasAplicadosContingente.Enabled := True;
                  EdDiasAplicadosContingente.Visible := True;
                  EdTasaAplicadaContingente.Enabled := True;
                  EdTasaAplicadaContingente.Visible := True;
                end;
              end;
              EdAbonoCapital.SetFocus;
           end
           else
            begin
              MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
              EdNumeroColocacion.SetFocus;
            end;
        end;
end;

procedure TfrmLiquidacionJudicialDes.FormShow(Sender: TObject);
begin
        EdAgencia.KeyValue := Agencia;
        EdFecha.Caption := FormatDateTime('yyyy/mm/dd',fFechaActual);
        Inicializar;
end;

procedure TfrmLiquidacionJudicialDes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoCapitalExit(
  Sender: TObject);
begin
          if EdAbonoCapital.Text = '' then EdAbonoCapital.Text := '0';
          vAbonoCapital := StrToCurr(EdAbonoCapital.Text);
          if vAbonoCapital = 0 then
          begin
            MessageDlg('El Valor del Abono no puede ser $0',mtError,[mbOK],0);
            EdAbonoCapital.SetFocus;
          end;
          EdAbonoCapital.Text := FormatCurr('#,##0',vAbonoCapital);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaCausadoEnter(
  Sender: TObject);
begin
        EdTasaAplicadaCausado.Text := FormatCurr('#0.00',vTasaCausado);
        EdTasaAplicadaCausado.SelectAll;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaCorrienteEnter(
  Sender: TObject);
begin
        EdTasaAplicadaCorriente.Text := FormatCurr('#0.00',vTasaCorriente);
        EdTasaAplicadaCorriente.SelectAll;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaAnticipadoEnter(
  Sender: TObject);
begin
//        EdTasaAplicadaAnticipado.Text := FormatCurr('#0.00',vTasaAnticipado);
//        EdTasaAplicadaAnticipado.SelectAll;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaMoraEnter(
  Sender: TObject);
begin
        EdTasaAplicadaMora.Text := FormatCurr('#0.00',vTasaMora);
        EdTasaAplicadaMora.SelectAll;
end;

//Inicio - **intereses causados**///
procedure TfrmLiquidacionJudicialDes.EdAbonoInteresCausadoExit(
  Sender: TObject);
begin
          if EdAbonoInteresCausado.Text = '' then EdAbonoInteresCausado.Text := '0';
          vAbonoInteresCausado := StrToCurr(EdAbonoInteresCausado.Text);
          EdAbonoInteresCausado.Text := FormatCurr('#,##0',vAbonoInteresCausado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdFechaInicialCausadoExit(
  Sender: TObject);
begin
//        vFechaInicialCausado := EdFechaInicialCausado.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdFechaFinalcausadoExit(Sender: TObject);
begin
//        vFechaFinalCausado := EdFechaFinalCausado.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosCausadoExit(
  Sender: TObject);
begin
        DiasCausado;
        DiasContingentes;
        DiasCorriente;
        DiasAnticipado;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaCausadoExit(
  Sender: TObject);
begin
        if EdTasaAplicadaCausado.Text = '' then EdTasaAplicadaCausado.Text := '0.00';
        vTasaCausado := StrToFloat(EdTasaAplicadaCausado.Text);
        EdTasaAplicadaCausado.Text := FormatCurr('#0.00%',vTasaCausado);
end;
//***Fin - Intereses Causados***////

//***Inicio - Interes corrientes**///
procedure TfrmLiquidacionJudicialDes.EdAbonoInterescorrienteExit(
  Sender: TObject);
begin
          if EdAbonoInteresCorriente.Text = '' then EdAbonoInteresCorriente.Text := '0';
          vAbonoInteresCorriente := StrToCurr(EdAbonoInteresCorriente.Text);
          EdAbonoInteresCorriente.Text := FormatCurr('#,##0',vAbonoInteresCorriente);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdFechaInicialCorrienteExit(
  Sender: TObject);
begin
//        vFechaInicialCorriente := EdFechaInicialCorriente.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdFechaFinalCorrienteExit(
  Sender: TObject);
begin
//        vFechaFinalCorriente := EdFechaFinalCorriente.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosCorrienteExit(
  Sender: TObject);
begin
        DiasCorriente;
        DiasAnticipado;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaCorrienteExit(
  Sender: TObject);
begin
        if EdTasaAplicadaCorriente.Text = '' then EdTasaAplicadaCorriente.Text := '0.00';
        vTasaCorriente := StrToFloat(EdTasaAplicadaCorriente.Text);
        EdTasaAplicadaCorriente.Text := FormatCurr('#0.00%',vTasaCorriente);
end;
///***Fin - Intereses Corrientes****////

//***Inicio - Intereses Anticipados***//
procedure TfrmLiquidacionJudicialDes.EdAbonoInteresAnticipadoExit(
  Sender: TObject);
begin
          if EdAbonoInteresAnticipado.Text = '' then EdAbonoInteresAnticipado.Text := '0';
          vAbonoInteresAnticipado := StrToCurr(EdAbonoInteresAnticipado.Text);
          EdAbonoInteresAnticipado.Text := FormatCurr('#,##0',vAbonoInteresAnticipado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdFechaInicialAnticipadoExit(
  Sender: TObject);
begin
        vFechaInicialAnticipado := EdFechaInicialAnticipado.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdFechaFinalAnticipadoExit(
  Sender: TObject);
begin
        vFechaFinalAnticipado := EdFechaFinalAnticipado.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosAnticipadoExit(
  Sender: TObject);
begin
        DiasAnticipado;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaAnticipadoExit(
  Sender: TObject);
begin
        if EdTasaAplicadaAnticipado.Text = '' then EdTasaAplicadaAnticipado.Text := '0.00';
        vTasaAnticipado := StrToFloat(EdTasaAplicadaAnticipado.Text);
        EdTasaAplicadaAnticipado.Text := FormatCurr('#0.00%',vTasaAnticipado);
end;
//***Fin - Intereses Anticipados***///

//***Inicio - Intereses Mora**///
procedure TfrmLiquidacionJudicialDes.EdAbonoInteresMoraExit(
  Sender: TObject);
begin
          if EdAbonoInteresMora.Text = '' then EdAbonoInteresMora.Text := '0';
          vAbonoInteresMora := StrToCurr(EdAbonoInteresMora.Text);
          EdAbonoInteresMora.Text := FormatCurr('#,##0',vAbonoInteresMora);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdFechaInicialMoraExit(
  Sender: TObject);
begin
        vFechaInicialMora := EdFechaInicialMora.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdFechaFinalMoraExit(
  Sender: TObject);
begin
        vFechaFinalMora := EdFechaFinalMora.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaMoraExit(
  Sender: TObject);
begin
        if EdTasaAplicadaMora.Text = '' then EdTasaAplicadaMora.Text := '0.00';
        vTasaMora := StrToFloat(EdTasaAplicadaMora.Text);
        EdTasaAplicadaMora.Text := FormatCurr('#0.00%',vTasaMora);
end;
///**Fin - Intereses Mora**///

//**Inicio Intereses devueltos***//
procedure TfrmLiquidacionJudicialDes.EdInteresDevueltoExit(
  Sender: TObject);
begin
          if EdInteresDevuelto.Text = '' then EdInteresDevuelto.Text := '0';
          vInteresDevuelto := StrToCurr(EdInteresDevuelto.Text);
          vTotalCuentas := vTotalCuentas + vInteresDevuelto;
          EdInteresDevuelto.Text := FormatCurr('#,##0',vInteresDevuelto);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdFechaInicialDevueltoExit(
  Sender: TObject);
begin
        vFechaInicialDevuelto := EdFechaInicialDevuelto.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdFechaFinalDevueltoExit(
  Sender: TObject);
begin
        vFechaFinalDevuelto := EdFechaFinalDevuelto.Date;
end;
///**Fin - Intereses devueltos**///

//**Inicio - Intereses Cobrados***//
//***Fin - Intereses Cobrados***///

procedure TfrmLiquidacionJudicialDes.CmdAceptarClick(Sender: TObject);
var
I,J:Integer;
vCalFechaCausado : TDate;
vCalFechaCorriente : TDate;
vCalFechaAnticipado : TDate;
vCalFechaMora : TDate;
begin
  totaldebitos := 0;
  totalcreditos := 0;
  empleado;
  GroupBox1.Enabled := False;
  PageControl1.Enabled := False;

  with dmColocacion.IBSQL do
   begin
     SQL.Clear;
     SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 2');
     ExecQuery;
     CodigoAhorros := FieldByName('CODIGO_CONTABLE').AsString;
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
     ExecQuery;
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

     MyCuotasLiq.Lista := TList.Create;

     if Estado = 2 then begin
        if vAbonoCapital <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
           if CapitalaPagar = 0 then CapitalaPagar := vValorCuota;
           AR^.FechaInicial := fFechaActual; //vFechaCapital;
           AR^.FechaFinal   := fFechaActual; //CalculoFecha(vFechaCapital,DiasCapital);
           vFechaFInt := FechaIntAnt; //AR^.FechaFinal;
           NuevaFechaCapital := FechaCapAnt;//AR^.FechaFinal;
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
         end;

        if vAbonoInteresCausado <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString;
           AR^.FechaInicial := vFechaInicialCausado;
           AR^.FechaFinal := vFechaFinalCausado;
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
          AR^.EsCorriente := True;
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
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString;
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
           TasaLiquidacion := 0;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
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
           TasaLiquidacion := 0;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;

        vTotalLiquidacion := TGeneral;

        TotalDebitos := 0;
        TotalCreditos := 0;

        if  MyCuotasLiq.Lista.Count > 0 then
         for I := 0 to MyCuotasLiq.Lista.Count -1 do
          begin
            AR := MyCuotasLiq.Lista.Items[i];
            if AR^.EsCausado or AR^.EsCorriente or AR^.EsAnticipado then
              begin
                SumTasa := SumTasa + (ar^.Tasa * AR^.Dias);
                SumDias := SumDias + ar^.Dias;
              end;
          end;
          try
            TasaLiquidacion := SumTasa / SumDias;
          except
            TasaLiquidacion := Tasa;
          end;

        vTotalInteres := vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente;
     end
    else if Estado = 3 then begin
        if vAbonoCapital <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := '425005010000000000';
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
           AR^.CodigoPuc := '831015000000000000';
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
           AR^.CodigoPuc := '425005020000000000';
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
           AR^.CodigoPuc := '831025010000000000';
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

        if vcostas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := '425005030000000000';
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
           AR^.CodigoPuc := '831025020000000000';
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
          AR^.CodigoPuc    := '880500000000000000';
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

          vTotalLiquidacion := TGeneral;

          // coloco caja
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoAhorros;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := vTotalLiquidacion;
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



        TotalDebitos := 0;
        TotalCreditos := 0;
        vCuentasdeOrden := 0;

       TGeneral := vTotalLiquidacion;
    end;

    CmdInforme.Enabled := True;
    DmColocacion.IBSQLcodigos.Close;

    CmdInforme.Enabled := True;
    CmdReversar.Visible := True;
    CmdGrabar.Enabled := True;
    CmdGrabar.Visible := True;
    CmdGrabar.SetFocus;
    CmdAceptar.Visible := False;
    CmdAceptar.Enabled := False;

    except
     dmColocacion.IBSQLcodigos.Transaction.RollBack;
     Exit;
    end;
end;


procedure TfrmLiquidacionJudicialDes.GrabarExtractoDet;
begin
      with IBQuery do
        begin
          SQL.Clear;
          SQL.Add('insert into "col$extractodet" values (');
          SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
          SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
          SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');

          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(vComprobante);
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := Now;
          ParamByName('HORA_EXTRACTO').AsDateTime := Time;
          ParamByName('CODIGO_PUC').AsString := CodigoPuc;
          ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
          ParamByName('FECHA_FINAL').AsDate := FechaFinal;
          ParamByName('DIAS_APLICADOS').AsInteger := Dias;
          ParamByName('TASA_LIQUIDACION').AsFloat := Tasa;
          ParamByName('VALOR_DEBITO').AsCurrency := Debito;
          ParamByName('VALOR_CREDITO').AsCurrency := Credito;
          ExecSql;
          Close;
        end;
end;

procedure TfrmLiquidacionJudicialDes.GrabarExtracto;
var
FechaIntAnt:TDate;
FechaCapAnt:TDate;
vCuotaTipo : string;
VDesembolso: Currency;
FechaDesembolso:TDate;
vDeudaTabla:Currency;
CapitalaPagarTabla:Currency;
begin
    with ibquery1 do
     begin
       sql.Clear;
       sql.Add('Select TIPO_CUOTA from "col$tiposcuota"');
       sql.Add('where');
       sql.Add('"col$tiposcuota".ID_TIPOS_CUOTA =:"ID_TIPOS_CUOTA"');
       parambyname('ID_TIPOS_CUOTA').AsInteger := Tipocuota;
       Open;
       vcuotatipo := FieldByName('TIPO_CUOTA').AsString;
       Close;

       SQL.Clear;
       SQL.Add('select FECHA_DESEMBOLSO, VALOR_DESEMBOLSO from "col$colocacion"');
       SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
       ParamByName('ID_AGENCIA').AsInteger := Agencia;
       ParamByName('ID_COLOCACION').AsString := vColocacion;
       Open;
       FechaDesembolso := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
       VDesembolso := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
       Close;
     end;


    with IBQuery do
     begin
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
       Open;
       FechaIntAnt := FieldByName('FECHA_INTERES').AsDateTime;
       FechaCapAnt := FieldByName('FECHA_CAPITAL').AsDateTime;
       Close;

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
       ParamByName('ID_AGENCIA').AsInteger := agencia;
       ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
       ParamByName('ID_COLOCACION').AsString := vColocacion;
       ParamByName('FECHA_EXTRACTO').AsDate := Now;
       ParamByName('HORA_EXTRACTO').AsDateTime := Time;
       ParamByName('CUOTA_EXTRACTO').AsInteger := 0;
       ParamByName('TIPO_OPERACION').AsInteger := 1;
       ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
       ParamByName('ABONO_CAPITAL').AsCurrency := vAbonocapital;
       ParamByName('ABONO_CXC').AsCurrency := vAbonoInteresCausado;
       if vInteresCobrado <> 0 then
          ParamByName('ABONO_SERVICIOS').AsCurrency := vInteresCobrado;
       if vInteresDevuelto <> 0 then
          ParamByName('ABONO_ANTICIPADO').AsCurrency := vInteresDevuelto
       else
          ParamByName('ABONO_ANTICIPADO').AsCurrency := 0;
       if (vInteresCobrado = 0) and (vAbonoInteresCorriente = 0)  then
          ParamByName('ABONO_SERVICIOS').AsCurrency := 0
       else
          ParamByName('ABONO_SERVICIOS').AsCurrency := vAbonoInteresCorriente;
       ParamByName('ABONO_MORA').AsCurrency := vAbonoInteresMora;
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
       ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := TasaLiquidacion;
       ParamByName('ID_EMPLEADO').AsString := DBAlias;
       if (vInteresCobrado > 0) or (vInteresDevuelto > 0) then
          ParamByName('INTERES_PAGO_HASTA').AsDate := FechaIntAnt;

       if vAbonoInteresCausado > 0 then
         ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalCausado;
       if vAbonoInteresContingente > 0 then
         ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalContingente;
       if vAbonoInteresCorriente > 0 then
         ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalCorriente;
       if vAbonointeresAnticipado > 0 then
         ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalAnticipado;       
       if (EsCapital.Checked = True) and (EsIntereses.Checked = False) then
        begin
          ParamByName('INTERES_PAGO_HASTA').AsDate := FechaIntAnt;
          vFechaFInt := FechaIntAnt;
        end;
       ParamByName('CAPITAL_PAGO_HASTA').AsDate := FechaCapAnt;
       ParamByName('TIPO_ABONO').AsInteger := BooleanoToInt(devolucion);
       ExecSQL;
       Close;

       if (EsCapital.Checked = True) and (EsIntereses.Checked = False) then
        begin
          IBConsulta.Close;
          IBConsulta.SQL.Clear;
          IBConsulta.sql.Add('update "col$colocacion" set ');
          IBConsulta.sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
          IBConsulta.sql.Add('"col$colocacion"."FECHA_CAPITAL" = :"FECHA_CAPITAL"');
          IBConsulta.sql.Add(' where ');
          IBConsulta.sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          IBConsulta.sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
          IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
          IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
          IBConsulta.ParamByName('ABONOS_CAPITAL').AsCurrency := vAbonoCapital;
          IBConsulta.ParamByName('FECHA_CAPITAL').AsDate := FechaCapAnt;
          IBConsulta.ExecQuery;
          IBConsulta.Close;
        end
       else
        begin
          FechaCapital := CalculoFecha(FechaDesembolso,Amortizacion);
          SQL.Clear;
          SQL.Add('select * from "col$tablaliquidacion" where');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          SQL.Add('order by FECHA_A_PAGAR');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          Open;
          vDeudaTabla := vDesembolso;
          while not Eof do begin
            CapitalaPagarTabla := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
            vDeudaTabla := vDeudaTabla - CapitalaPagarTabla;
            if vDeudaTabla >= (vSaldoActual - vAbonocapital) then begin
              if CapitalaPagarTabla > 0 then begin
                IBTabla.Close;
                IBTabla.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBTabla.ParamByName('ID_COLOCACION').AsString := vColocacion;
                IBTabla.ParamByName('CUOTA_NUMERO').AsInteger := FieldByName('CUOTA_NUMERO').AsInteger;
                IBTabla.ExecQuery;
                IBTabla.Close;
                if TipoCuota = 2 then
                  NuevaFechaCapital := CalculoFecha(FieldByName('FECHA_A_PAGAR').AsDateTime,AmortizaK)
                else NuevaFechaCapital := FieldByName('FECHA_A_PAGAR').AsDateTime;
             end
            else
             if FieldByName('FECHA_A_PAGAR').AsDateTime <= vFechaFInt then begin
                IBTabla.Close;
                IBTabla.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBTabla.ParamByName('ID_COLOCACION').AsString := vColocacion;
                IBTabla.ParamByName('CUOTA_NUMERO').AsInteger := FieldByName('CUOTA_NUMERO').AsInteger;
                IBTabla.ExecQuery;
                IBTabla.Close;
             end;
            end;
           Next;
          end;   // fin de while Tabla Liquidacion

          IBConsulta.Close;
          IBConsulta.SQL.Clear;
          IBConsulta.sql.Add('update "col$colocacion" set ');
          IBConsulta.sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
          IBConsulta.sql.Add('"col$colocacion"."FECHA_CAPITAL" = :"FECHA_CAPITAL"');
          IBConsulta.sql.Add(' where ');
          IBConsulta.sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          IBConsulta.sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
          IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
          IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
          IBConsulta.ParamByName('ABONOS_CAPITAL').AsCurrency := vAbonoCapital;
          IBConsulta.ParamByName('FECHA_CAPITAL').AsDate := NuevaFechaCapital;
          IBConsulta.ExecQuery;
          IBConsulta.Close;

          IBConsulta.sql.Clear;
          IBConsulta.sql.Add('update "col$extracto" set ');
          IBConsulta.sql.Add('"col$extracto"."CAPITAL_PAGO_HASTA" = :"CAPITAL_PAGO_HASTA"');
          IBConsulta.sql.Add(' where ');
          IBConsulta.sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
          IBConsulta.sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
          IBConsulta.sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION" and');
          IBConsulta.SQL.Add('"col$extracto"."FECHA_EXTRACTO" = :"FECHA_EXTRACTO"');
          IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
          IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
          IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
          IBConsulta.ParamByName('CAPITAL_PAGO_HASTA').AsDate := NuevaFechaCapital;
          IBConsulta.ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
          IBConsulta.ExecQuery;
          IBConsulta.Close;
        end; // fin de if Capital.Checked

       if (EsIntereses.Checked = True) and (vTotalInteres > 0) then
        begin
          IBConsulta.sql.Clear;
          IBConsulta.sql.Add('update "col$colocacion" set ');
          IBConsulta.sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
          IBConsulta.sql.Add(' where ');
          IBConsulta.sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          IBConsulta.sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
          IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
          IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
          IBConsulta.ParamByName('FECHA_INTERES').AsDate := vFechaFInt;
          IBConsulta.ExecQuery;
          IBConsulta.Close;
        end;

       if (vCuotaTipo = 'F') and
          (FechaTabla <= vFechaCapital) and
          (InteresaPagar <= vTotalInteres) then
       begin
         IBConsulta.sql.Clear;
         IBConsulta.sql.Add('update "col$tablaliquidacion" set ');
         IBConsulta.sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
         IBConsulta.sql.Add(' where ');
         IBConsulta.sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
         IBConsulta.sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
         IBConsulta.sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
         IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
         IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
         IBConsulta.ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
         IBConsulta.ExecQuery;
         IBConsulta.Close;
       end;

       if vCuotaTipo = 'V' then
        if (CapitalaPagar > 0) and (InteresaPagar > 0) then
         begin
           if (FechaTabla <= NuevaFechaCapital) and (InteresaPagar <= vTotalInteres) then
            begin
              IBConsulta.sql.Clear;
              IBConsulta.sql.Add('update "col$tablaliquidacion" set ');
              IBConsulta.sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
              IBConsulta.sql.Add(' where ');
              IBConsulta.sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
              IBConsulta.sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
              IBConsulta.sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
              IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
              IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
              IBConsulta.ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
              IBConsulta.ExecQuery;
              IBConsulta.Close;

              IBConsulta.sql.Clear;
              IBConsulta.sql.Add('update "col$extracto" set ');
              IBConsulta.sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
              IBConsulta.sql.Add(' where ');
              IBConsulta.sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
              IBConsulta.sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
              IBConsulta.sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
              IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
              IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
              IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
              IBConsulta.ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
              IBConsulta.ExecQuery;
              IBConsulta.Close;
            end;
         end
        else
         if (CapitalaPagar > 0) and (FechaTabla <= NuevaFechaCapital) then
          begin
            IBConsulta.sql.Clear;
            IBConsulta.sql.Add('update "col$tablaliquidacion" set ');
            IBConsulta.sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
            IBConsulta.sql.Add(' where ');
            IBConsulta.sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            IBConsulta.sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
            IBConsulta.sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
            IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
            IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
            IBConsulta.ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
            IBConsulta.ExecQuery;
            IBConsulta.Close;

            IBConsulta.sql.Clear;
            IBConsulta.sql.Add('update "col$extracto" set ');
            IBConsulta.sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
            IBConsulta.sql.Add(' where ');
            IBConsulta.sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
            IBConsulta.sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
            IBConsulta.sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
            IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
            IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
            IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
            IBConsulta.ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
            IBConsulta.ExecQuery;
            IBConsulta.Close;
          end
         else
        if (InteresaPagar >= 0) and (InteresaPagar <= vTotalInteres) then
         begin
           IBConsulta.sql.Clear;
           IBConsulta.sql.Add('update "col$tablaliquidacion" set ');
           IBConsulta.sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
           IBConsulta.sql.Add(' where ');
           IBConsulta.sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
           IBConsulta.sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
           IBConsulta.sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
           IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
           IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
           IBConsulta.ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
           IBConsulta.ExecQuery;
           IBConsulta.Close;

           IBConsulta.sql.Clear;
           IBConsulta.sql.Add('update "col$extracto" set ');
           IBConsulta.sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
           IBConsulta.sql.Add(' where ');
           IBConsulta.sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
           IBConsulta.sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
           IBConsulta.sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
           IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
           IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
           IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
           IBConsulta.ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
           IBConsulta.ExecQuery;
           IBConsulta.Close;
         end;

         if (vcostas <> 0) or (vhonorarios <> 0) then begin
           IBConsulta.SQL.Clear;
           IBConsulta.SQL.Add('insert into "col$costas" values (:ID_AGENCIA,:ID_COLOCACION,');
           IBConsulta.SQL.Add(':FECHA,:ID_CBTE_COLOCACION,:VALOR_COSTAS,:VALOR_HONORARIOS,:VALOR_OTROS,:DESCRIPCION)');
           IBConsulta.ParamByName('ID_AGENCIA').AsInteger := Agencia;
           IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
           IBConsulta.ParamByName('FECHA').AsDate := fFechaActual;
           IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vComprobante);
           IBConsulta.ParamByName('VALOR_COSTAS').AsCurrency := -vcostas;
           IBConsulta.ParamByName('VALOR_HONORARIOS').AsCurrency := -vhonorarios;
           IBConsulta.ParamByName('VALOR_OTROS').AsCurrency := 0;
           IBConsulta.ParamByName('DESCRIPCION').AsString := 'VALOR COSTAS Y HONORARIOS RECIBIDOS EN LA FECHA';
           IBConsulta.ExecQuery;
           IBConsulta.Close;
         end;
       end;
end;

procedure TfrmLiquidacionJudicialDes.BtnCerrarClick(Sender: TObject);
begin
        if DmColocacion.IBDSagencias.Transaction.InTransaction then
           DmColocacion.IBDSagencias.Transaction.Rollback;
        Close;
end;

procedure TfrmLiquidacionJudicialDes.CmdBuscarClick(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;

end;

procedure TfrmLiquidacionJudicialDes.CmdInformeClick(Sender: TObject);
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
           Report.Variables.ByName['Cuenta'].AsString := IntToStr(NumeroCuentaAh) + '-' + IntToStr(DigitoCuentaAh);
           Report.Variables.ByName['NuevoSaldo'].AsDouble := vSaldoActual - vAbonoCapital;
           Report.Variables.ByName['InteresesHasta'].AsDateTime := vFechaFInt;
           Report.Variables.ByName['CapitalHasta'].AsDateTime := NuevaFechaCapital;
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

procedure TfrmLiquidacionJudicialDes.Empleado;
begin
        with dmColocacion.IBQuery do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
         end;
end;

procedure TfrmLiquidacionJudicialDes.inicializar;
begin
  if dmGeneral.IBTransaction1.InTransaction then
    dmGeneral.IBTransaction1.Rollback;
  dmGeneral.IBTransaction1.StartTransaction;

  DmColocacion.IBDSagencias.Open;
  DmColocacion.IBDSagencias.Last;
  DmColocacion.IBDSagencias.First;
  vColocacion := '';
  vComprobante := '';
  vAbonocapital := 0;
  vAbonointeresAnticipado := 0;
  vAbonoInteresContingente := 0;
  vAbonoInteresCorriente  := 0;
  vAbonoInteresCausado    := 0;
  vAbonoInteresMora       := 0;
  vInteresDevuelto        := 0;
  vInteresCobradoCausado  := 0;
  vInteresCobradoCorriente:= 0;
  vInteresCobrado         := 0;
  vFechaInicialAnticipado := fFechaActual;
  vFechaFinalAnticipado   := fFechaActual;
  vFechaInicialContingente := fFechaActual;
  vFechaFinalContingente := fFechaActual;
  vFechaInicialCorriente  := fFechaActual;
  vFechaFinalCorriente    := fFechaActual;
  vFechaInicialCausado    := fFechaActual;
  vFechaFinalCausado      := fFechaActual;
  vFechaInicialMora       := fFechaActual;
  vFechaFinalMora         := fFechaActual;
  vFechaInicialCobradoCausado := fFechaActual;
  vFechaFinalCobradoCausado := fFechaActual;
  vFechaInicialCobradoCorriente := fFechaActual;
  vFechaFinalCobradoCorriente := fFechaActual;
  vFechaInicialDevuelto   := fFechaActual;
  vFechaFinalDevuelto     := fFechaActual;
  vFechaInteres           := fFechaActual;
  vFechaCapital           := fFechaActual;
  vDiasAnticipado         := 0;
  vDiasContingente        := 0;
  vDiasCorriente          := 0;
  vDiasCausado            := 0;
  vDiasMora               := 0;
  vTasaAnticipado         := 0;
  vTasaContingente        := 0;
  vTasaCorriente          := 0;
  vTasaCausado            := 0;
  vTasaMora               := 0;
  vSaldoActual            := 0;
  Clasificacion           := 0;
  Garantia                := 0;
  Categoria               := '';
  CodigoPuc               := '';
  FechaInicial            := fFechaActual;
  FechaFinal              := fFechaActual;
  Tasa                    := 0;
  Dias                    := 0;
  Caja                    := 0;
  Debito                  := 0;
  Credito                 := 0;
  devolucion              := False;
  TipoCuota               := 0;
  Amortizacion            := 0;
  TasaLiquidacion         := 0;
  vFechaIInt              := fFechaActual;
  vFechaFInt              := fFechaActual;
  FechaInteres            := fFechaActual;

  vcostas                 := 0;
  vhonorarios             := 0;
  DescripcionEstado       := '';
  vTotalAhorros           := 0;
  SaldoAhorros            := 0;
  vTotalAportes           := 0;
  SaldoAportes            := 0;
  vTotalCuentas           := 0;
  vNacional               := 0;
  vComisionNal            := 0;
  vConsignaAhorros        := 0;
  Banco                   := -1;


  //**
  vValorCuota             := 0;
  CapitalaPagar           := 0;
  InteresaPagar           := 0;
  vTotalInteres           := 0;
  totaldebitos            := 0;
  totalcreditos           := 0;
  NumeroCuentaAp          := 0;
  DigitoCuentaAp          := 0;
  NumeroCuentaAh          := 0;
  DigitoCuentaAh          := 0;
  vTotalAhorros           := 0;
  vTotalAportes           := 0;
  SaldoCuentas            := 0;
  vTotalLiquidacion       := 0;
  TGeneral                := 0;
  //**

  EdAgencia.KeyValue := Agencia;
  EdNumeroColocacion.Text := vColocacion;
//  EdTipoIdentificacion.Caption := '';
  EdNumeroIdentificacion.Caption := '';
  EdNombre.Caption := '';
  EdSaldoColocacion.Caption := '';
  EdFechaCapital.Caption := '';
  EdFechaInteres.Caption := '';
  EdCuentaAbogado.Caption := '';
  EdAbogado.Caption := '';
  EdNoComprobante.Text := '';
  EsIntereses.Checked := False;
  EsCapital.Checked := False;
  EdAbonoCapital.Text := '';
  EdInteresDevuelto.Text := '';
  EdFechaInicialDevuelto.Date := fFechaActual;
  EdFechaFinalDevuelto.Date := fFechaActual;
  EdAbonoInteresCausado.Text := '';
  EdFechaInicialCausado.Date := fFechaActual;
  EdFechaFinalCausado.Date := fFechaActual;
  EdDiasAplicadosCausado.Text := '';
  EdTasaAplicadaCausado.Text := '';
  EdAbonoInteresContingente.Text := '';
  EdFechaInicialContingente.Date := fFechaActual;
  EdFechaFinalContingente.Date := fFechaActual;
  EdDiasAplicadosContingente.Text := '';
  EdTasaAplicadaContingente.Text := '';
  EdAbonoInteresCorriente.Text := '';
  EdFechaInicialCorriente.Date := fFechaActual;
  EdFechaFinalCorriente.Date := fFechaActual;
  EdDiasAplicadosCorriente.Text := '';
  EdTasaAplicadaCorriente.Text := '';
  EdAbonoInteresAnticipado.Text := '';
  EdFechaInicialAnticipado.Date := fFechaActual;
  EdFechaFinalAnticipado.Date := fFechaActual;
  EdDiasAplicadosAnticipado.Text := '';
  EdTasaAplicadaAnticipado.Text := '';
  EdAbonoInteresMora.Text := '';
  EdFechaInicialMora.Date := fFechaActual;
  EdFechaFinalMora.Date := fFechaActual;
  EdDiasAplicadosMora.Text := '';
  EdTasaAplicadaMora.Text := '';
  GroupBox3.Visible := False;
  GroupBox3.Enabled := True;
  GroupBox1.Enabled := True;
  EdAgencia.SetFocus;
  CmdInforme.Enabled := False;
  CmdGrabar.Visible := False;
  CmdReversar.Visible := False;
  CmdAceptar.Visible := True;
  CmdAceptar.Enabled := True;
  EdTotalColManual.Caption := '';
  EdEstado.Caption := '';
  EdCostas.Caption := '';
  EdAbonoCostas.Text := '';
  EdAbonoHonorarios.Text := '';
  MarcarCaptacion.Checked := False;
  EdNacional.Value := 0;
  DBLCBBancos.Enabled := False;

  PageControl1.Visible := False;
  PageControl1.Enabled := True;

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
  EdExasociados.Value := 0;
  NumeroCuentaAbogado := 0;
  DigitoCuentaAbogado := 0;
end;


procedure TfrmLiquidacionJudicialDes.CmdGrabarClick(Sender: TObject);
var
I,J : integer;
TotalDebitoRecibo : Currency;
TotalCreditoRecibo : Currency;
Consec:string;
DescImpuesto : Currency;
DescImpuestoAhorros : Currency;
DescImpuestoaportes : Currency;
AC:PCuentas;
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
  if TotalDebitoRecibo <> vTotalCuentas then
   begin
     MessageDlg('El Total Liquidado no corresponde al Total Digitado' + #10 + #13 +
                       'Revise los Valores',mtError,[mbOk],0);
     Exit;
   end;
  if not (TotalDebitoRecibo = TotalCreditoRecibo) then
   begin
     MessageDlg('La Nota Contable está Descuadrada' + #10 + #13 +
                       'Revise los Valores',mtError,[mbOk],0);
     CmdReversar.Click;
     Exit;
   end
  else
   begin
    abono_capital := 0;
    abono_cxc := 0;
    abono_servicios := 0;
    abono_mora := 0;
    abono_anticipado := 0;
    Cuota_anterior := 0;
    cambio := false;

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
          ParamByName('FECHA_EXTRACTO').AsDate := Now;
          ParamByName('HORA_EXTRACTO').AsDateTime := Time;
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

      DescImpuestoAhorros := SimpleRoundTo((vTotalAhorros/1000) * 4,0);
      DescImpuestoAportes := SimpleRoundTo((vTotalAportes/1000) * 4,0);
      DescImpuesto := SimpleRoundTo(DescImpuestoAhorros + DescImpuestoaportes,0);
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
      AR^.CodigoPuc   := '244295000000000000';
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

      TotalDebitoRecibo := TotalDebitoRecibo + DescImpuesto;
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
         ParamByname('FECHADIA').AsDate := Now;
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
            ParamByName('FECHA').AsDate := Now;
            ParamByName('CODIGO').AsString := AR^.CodigoPuc;
            ParamByName('DEBITO').AsCurrency := ar^.Debito;
            ParamByName('CREDITO').AsCurrency := ar^.Credito;
            if LeftStr(AR^.CodigoPuc,8) = '21050501' then
              ParamByName('ID_CUENTA').AsInteger := NumeroCuentaap
            else
              ParamByName('ID_CUENTA').AsInteger := 0;
            if LeftStr(AR^.CodigoPuc,2) = '14' then
              ParamByName('ID_COLOCACION').AsString := vColocacion
            else
              ParamByName('ID_COLOCACION').AsString := '';
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
         ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAh;
         ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAh;
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
// ****Llevo a Extracto Consignacion de Ahorros





// ****Fin Extracto de Consignacion Ahorros
  VerificarCancelacionCredito(Agencia,vColocacion);
//  if MarcarCaptacion.Checked then
//    verificarCancelacionCaptacion(Agencia,vColocacion);
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


procedure TfrmLiquidacionJudicialDes.CmdReversarClick(Sender: TObject);
begin
          DmGeneral.IBTransaction1.Rollback;
          MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
          Inicializar;
end;


procedure TfrmLiquidacionJudicialDes.EsInteresesClick(Sender: TObject);
var DiasMinimo,DiasTiene:Integer;
begin
        if EsIntereses.Checked = True then
         begin
           PageControl1.Visible := True;
           PageControl1.ActivePage := InfoIntereses;
           InfoIntereses.TabVisible := True;
           InfoDevueltos.TabVisible := False;
           InfoCobrados.TabVisible := False;
           Devueltos.Checked := False;
           Cobrados.Checked := False;
           vInteresCobrado := 0;
           vInteresDevuelto := 0;
           vTasaDevCob := 0;

           EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);

           CmdAceptar.Visible := True;
           CmdAceptar.Enabled := True;

           end;
        end
        else
        begin
           PageControl1.Visible := False;
           LimpiarManualIntereses;
           if not EsCapital.Checked  then begin
              CmdAceptar.Visible := True;
              CmdAceptar.Enabled := True;
           end;
        end;

end;

procedure TfrmLiquidacionJudicialDes.DevueltosClick(Sender: TObject);
begin
        if Devueltos.Checked = True then
         begin
           EsIntereses.Checked := False;
           EsInteresesClick(Sender);
           PageControl1.Visible := True;
           PageControl1.ActivePage := InfoDevueltos;
           InfoIntereses.TabVisible := False;
           InfoDevueltos.TabVisible := True;
           InfoCobrados.TabVisible := False;
         end
        else
         begin
           PageControl1.Visible := False;
           InfoIntereses.TabVisible := False;
           InfoDevueltos.TabVisible := False;
           InfoCobrados.TabVisible := False;
           EdInteresDevuelto.Text := '';
           vInteresDevuelto := 0;
           EdFechaInicialDevuelto.Date := fFechaActual;
           vFechaInicialDevuelto := fFechaActual;
           EdFechaFinalDevuelto.Date :=Date;
           vFechaFinalDevuelto := fFechaActual;
           EdDiasDevuelto.Text := '';
           vDiasDevuelto := 0;
           EdTasaDevolucion.Text := '';
           vTasaDevolucion := 0;           
         end;
end;

procedure TfrmLiquidacionJudicialDes.CobradosClick(Sender: TObject);
begin
        if Cobrados.Checked = True then
         begin
           EsIntereses.Checked := False;
           EsInteresesClick(Sender);         
           PageControl1.Visible := True;
           PageControl1.ActivePage := InfoCobrados;
           InfoIntereses.TabVisible := False;
           InfoDevueltos.TabVisible := False;
           InfoCobrados.TabVisible := True;
           EsIntereses.Checked := False;
         end
        else
         begin
           PageControl1.Visible := False;
           InfoIntereses.TabVisible := False;
           InfoDevueltos.TabVisible := False;
           InfoCobrados.TabVisible := False;

           EdInteresCobradoCausado.Text := '';
           vInteresCobradoCausado := 0;
           EdFechaInicialCobradoCausado.Date := fFechaActual;
           vFechaInicialCobradoCausado := fFechaActual;
           EdFechaFinalCobradoCausado.Date :=Date;
           vFechaFinalCobradoCausado := fFechaActual;
           EdDiasCobradoCausado.Text := '';
           vDiasCobradoCausado := 0;
           EdTasaCobradoCausado.Text := '';
           vTasaCobradoCausado := 0;
           EdInteresCobradoCorriente.Text := '';
           vInteresCobradoCorriente := 0;
           EdFechaInicialCobradoCorriente.Date := fFechaActual;
           vFechaInicialCobradoCorriente := fFechaActual;
           EdFechaFinalCobradoCorriente.Date := fFechaActual;
           vFechaFinalCobradoCorriente := fFechaActual;
           EdDiasCobradoCorriente.Text := '';
           vDiasCobradoCorriente := 0;
           EdTasaCobradoCorriente.Text := '';
           vTasaCobradoCorriente := 0;
         end;
end;

procedure TfrmLiquidacionJudicialDes.GroupBox5Exit(Sender: TObject);
begin
        if (Devueltos.Checked = True) or (Cobrados.Checked = True) then
          EsIntereses.Checked := False;
end;

procedure TfrmLiquidacionJudicialDes.DiasCausado;
begin
        if EdDiasAplicadosCausado.Text = '' then EdDiasAplicadosCausado.Text := '0';
        vDiasCausado := StrToInt(EdDiasAplicadosCausado.Text);
        EdDiasAplicadosCausado.Text := FormatCurr('#0',vDiasCausado);
        if (vAbonoInteresCausado <> 0) then
        begin
           vFechaInicialCausado := CalculoFecha(vFechaInteres,1);
           vFechaFinalCausado := CalculoFechaManual(vFechaInicialCausado,vDiasCausado);
           EdFechaInicialCausado.Date := vFechaInicialCausado;
           EdFechaFinalCausado.Date := vFechaFinalCausado;
        end;
end;

procedure TfrmLiquidacionJudicialDes.DiasCorriente;
begin
        if EdDiasAplicadosCorriente.Text = '' then EdDiasAplicadosCorriente.Text := '0';
        vDiasCorriente := StrToInt(EdDiasAplicadosCorriente.Text);
        EdDiasAplicadosCorriente.Text := FormatCurr('#0',vDiasCorriente);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaInteres,1);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.Date := vFechaInicialCorriente;
           EdFechaFinalCorriente.Date := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.Date := vFechaInicialCorriente;
           EdFechaFinalCorriente.Date := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresContingente <> 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaFinalContingente,1);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.Date := vFechaInicialCorriente;
           EdFechaFinalCorriente.Date := vFechaFinalCorriente;
         end;
end;

procedure TfrmLiquidacionJudicialDes.DiasAnticipado;
begin
        if EdDiasAplicadosAnticipado.Text = '' then EdDiasAplicadosAnticipado.Text := '0';
        vDiasAnticipado := StrToInt(EdDiasAplicadosAnticipado.Text);
        EdDiasAplicadosAnticipado.Text := FormatCurr('#0',vDiasAnticipado);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaInteres,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.Date := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.Date := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.Date := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.Date := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresContingente <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaFinalContingente,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.Date := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.Date := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaFinalCorriente,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.Date := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.Date := vFechaFinalAnticipado;
         end;
end;

procedure TfrmLiquidacionJudicialDes.DiasMora;
begin
        if EdDiasAplicadosMora.Text = '' then EdDiasAplicadosMora.Text := '0';
        vDiasMora := StrToInt(EdDiasAplicadosMora.Text);
        EdDiasAplicadosMora.Text := FormatCurr('#0',vDiasMora);
        if (vAbonoInteresMora > 0) and (vTipoInteres = 'V') then
         begin
           if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaInteres,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalCausado,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonoInteresContingente <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalContingente,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalCorriente,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.DateTime := vFechaInicialMora;
              EdFechaFinalMora.DateTime := vFechaFinalMora;
            end
         end;
        if (vAbonoInteresMora > 0) and (vTipoInteres = 'A') then
         begin
           vFechaInicialMora := CalculoFecha(vFechaInteres,1);
           vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
           EdFechaInicialMora.DateTime := vFechaInicialMora;
           EdFechaFinalMora.DateTime := vFechaFinalMora;
         end;

end;


procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosCausadoChange(
  Sender: TObject);
begin
        DiasCausado;
        DiasContingentes;
        DiasCorriente;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosCorrienteChange(
  Sender: TObject);
begin
        DiasCorriente;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.GrabarTablaLiquidacion;
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
          ParamByName('FECHA_PAGADA').AsDate := Now;
          ExecSQL;
          Close;
         end;
end;
function TfrmLiquidacionJudicialDes.BuscarAhorros(TipoId: Integer;
  NumeroId: String): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo:Integer;
begin
   with IBSQL2 do begin
     Close;
     sql.Clear;
     Sql.Add('select * from P_CAP_0019 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
     ParamByName('ID_PERSONA').AsString := NumeroId;
     ExecQuery;
     NumeroCuentaAh := FieldByName('NUMERO_CUENTA').AsInteger;
     DigitoCuentaAh := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;

     SQL.Clear;
     SQL.Add('Select * from P_CAP_0012 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAh;
     ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAh;
     ParamByName('ANO').AsString := IntToStr(YearOf(Date));
     try
      ExecQuery;
      if RecordCount < 1 then
        Saldo := 0
      else
        Saldo := FieldByName('SALDOAHORROS').AsCurrency;
     except
      MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
      Exit;
     end;

     Close;
     SQL.Clear;
     SQL.Add('SELECT * from P_CAP_0010 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:FECHA1,:FECHA2)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAh;
     ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAh;
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
     SQL.Add('SELECT  * from P_CAP_0011 (:NUMERO_CUENTA,:DIGITO_CUENTA)');
     ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAh;
     ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAh;
     ExecQuery;
     Canje := FieldByName('CHEQUES').AsCurrency;
     Close;

     Saldo := Saldo + Movimiento;
     Result := Saldo - Canje;
   end;
end;

function TfrmLiquidacionJudicialDes.BuscarAportes(TipoId: Integer;
  NumeroId: String): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
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
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1 and');
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
                  NumeroCuentaAp := FieldByName('NUMERO_CUENTA').AsInteger;
                  DigitoCuentaAp := FieldByName('DIGITO_CUENTA').AsInteger;
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
//                SQL.Add('and "cap$extracto".ID_TIPO_MOVIMIENTO <> 7');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAp;
                ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAp;
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(ffechaactual),01,01);
                ParamByName('FECHA2').AsDate := EncodeDate(YearOf(ffechaactual),12,31);
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
                ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAp;
                ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAp;
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


procedure TfrmLiquidacionJudicialDes.LimpiarManualIntereses;
begin
  EdAbonoInteresContingente.Text := '';
  EdAbonoInteresCausado.Text := '';
  EdAbonoInterescorriente.Text := '';
//  EdAbonoInteresAnticipado.Text := '';
  EdAbonoInteresMora.Text := '';
  EdAbonoCostas.Text := '';
  EdAbonoHonorarios.Text := '';

  EdDiasAplicadosContingente.Text := '';
  EdDiasAplicadosCausado.Text := '';
  EdDiasAplicadosCorriente.Text := '';
//  EdDiasAplicadosAnticipado.Text := '';
  EdDiasAplicadosMora.Text := '';

  EdTasaAplicadaContingente.Text := '';
  EdTasaAplicadaCausado.Text := '';
  EdTasaAplicadaCorriente.Text := '';
//  EdTasaAplicadaAnticipado.Text := '';
  EdTasaAplicadaMora.Text := '';

          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto + vPapeleria + vExAsociados + vcostas + vComisionNal;

  vAbonoInteresContingente :=0;
  vDiasContingente:=0;
  vTasaContingente:=0;

  vAbonoInteresCausado:=0;
  vDiasCausado:=0;
  vTasaCausado:=0;

  vAbonoInteresCorriente:=0;
  vDiasCorriente:=0;
  vTasaCorriente:=0;

//  vAbonoInteresAnticipado:=0;
//  vDiasAnticipado:=0;
//  vTasaAnticipado:=0;

  vAbonoInteresMora:=0;
  vDiasMora := 0;
  vTasaMora := 0;

  vhonorarios := 0;
  vcostas := 0;

  EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoInteresContingenteExit(
  Sender: TObject);
begin
          if EdAbonoInteresContingente.Text = '' then EdAbonoInteresContingente.Text := '0';
          vAbonoInteresContingente := StrToCurr(EdAbonoInteresContingente.Text);
          EdAbonoInteresContingente.Text := FormatCurr('#,##0',vAbonoInteresContingente);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoCostasExit(Sender: TObject);
begin
          if EdAbonoCostas.Text = '' then EdAbonoCostas.Text := '0';
          vcostas := StrToCurr(EdAbonoCostas.Text);
          EdAbonoCostas.Text := FormatCurr('#,##0',vcostas);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosContingenteExit(
  Sender: TObject);
begin
        DiasContingentes;
        DiasCorriente;
        DiasAnticipado;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosContingenteChange(
  Sender: TObject);
begin
        DiasContingentes;
        DiasCausado;
        DiasCorriente;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaContingenteExit(
  Sender: TObject);
begin
        if EdTasaAplicadaContingente.Text = '' then EdTasaAplicadaContingente.Text := '0.00';
        vTasaContingente := StrToFloat(EdTasaAplicadaContingente.Text);
        EdTasaAplicadaContingente.Text := FormatCurr('#0.00%',vTasaContingente);
end;

procedure TfrmLiquidacionJudicialDes.DiasContingentes;
begin
        if EdDiasAplicadosContingente.Text = '' then EdDiasAplicadosContingente.Text := '0';
        vDiasContingente := StrToInt(EdDiasAplicadosContingente.Text);
        EdDiasAplicadosContingente.Text := FormatCurr('#0',vDiasContingente);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente > 0) then
         begin
           vFechaInicialContingente := CalculoFecha(vFechaInteres,1);
           vFechaFinalContingente := CalculoFechaManual(vFechaInicialContingente,vDiasContingente);
           EdFechaInicialContingente.Date := vFechaInicialContingente;
           EdFechaFinalContingente.Date := vFechaFinalContingente;
         end
        else
         begin
           vFechaInicialContingente := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalContingente := CalculoFechaManual(vFechaInicialContingente,vDiasContingente);
           EdFechaInicialContingente.Date := vFechaInicialContingente;
           EdFechaFinalContingente.Date := vFechaFinalContingente;
         end;
end;


procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosMoraChange(
  Sender: TObject);
begin
        diasmora;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosMoraExit(
  Sender: TObject);
begin
        diasmora;
end;

procedure TfrmLiquidacionJudicialDes.VerificarCuentaAportes(Cuenta,
  Digito: Integer);
begin
        
end;

procedure TfrmLiquidacionJudicialDes.EdDiasDevueltoExit(
  Sender: TObject);
begin
        DiasDevuelto;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasDevueltoChange(
  Sender: TObject);
begin
        DiasDevuelto;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaDevolucionExit(
  Sender: TObject);
begin
        if EdTasaDevolucion.Text = '' then EdTasaDevolucion.Text := '0.00';
        vTasaDevolucion := StrToFloat(EdTasaDevolucion.Text);
        EdTasaDevolucion.Text := FormatCurr('#0.00%',vTasaDevolucion);
        CmdAceptar.SetFocus;
end;

procedure TfrmLiquidacionJudicialDes.EdInteresCobradoCausadoExit(
  Sender: TObject);
begin
          if EdInteresCobradoCausado.Text = '' then EdInteresCobradoCausado.Text := '0';
          vInteresCobradoCausado := StrToCurr(EdInteresCobradoCausado.Text);
          EdInteresCobradoCausado.Text := FormatCurr('#,##0',vInteresCobradoCausado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdInteresCobradoCorrienteExit(
  Sender: TObject);
begin
          if EdInteresCobradoCorriente.Text = '' then EdInteresCobradoCorriente.Text := '0';
          vInteresCobradoCorriente := StrToCurr(EdInteresCobradoCorriente.Text);
          EdInteresCobradoCorriente.Text := FormatCurr('#,##0',vInteresCobradoCorriente);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdDiasCobradoCausadoExit(
  Sender: TObject);
begin
        DiasCobradoCausado;
        DiasCobradoCorriente;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasCobradoCausadoChange(
  Sender: TObject);
begin
        DiasCobradoCausado;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasCobradoCorrienteExit(
  Sender: TObject);
begin
        DiasCobradoCorriente;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasCobradoCorrienteChange(
  Sender: TObject);
begin
        DiasCobradoCausado;
        DiasCobradoCorriente;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaCobradoCausadoExit(
  Sender: TObject);
begin
        if EdTasaCobradoCausado.Text = '' then EdTasaCobradoCausado.Text := '0.00';
        vTasaCobradoCausado := StrToFloat(EdTasaCobradoCausado.Text);
        EdTasaCobradoCausado.Text := FormatCurr('#0.00%',vTasaCobradoCausado);
end;

procedure TfrmLiquidacionJudicialDes.EdTasaCobradoCorrienteExit(
  Sender: TObject);
begin
        if EdTasaCobradoCorriente.Text = '' then EdTasaCobradoCorriente.Text := '0.00';
        vTasaCobradoCorriente := StrToFloat(EdTasaCobradoCorriente.Text);
        EdTasaCobradoCorriente.Text := FormatCurr('#0.00%',vTasaCobradoCorriente);
        CmdAceptar.SetFocus;
end;

procedure TfrmLiquidacionJudicialDes.DiasDevuelto;
begin
        if EdDiasDevuelto.Text = '' then EdDiasDevuelto.Text := '0';
        vDiasDevuelto := StrToInt(EdDiasDevuelto.Text);
        EdDiasDevuelto.Text := FormatCurr('#0',vDiasDevuelto);
        if (vInteresDevuelto <> 0) then
        begin
           vFechaInicialDevuelto := CalculoFecha(vFechaInteres,1);
           if vFechaInicialDevuelto >= Date then
              vFechaInicialDevuelto := CalculoFecha(Date,1);
           vFechaFinalDevuelto := CalculoFechaManual(vFechaInicialDevuelto,vDiasDevuelto);
           EdFechaInicialDevuelto.Date := vFechaInicialDevuelto;
           EdFechaFinalDevuelto.Date := vFechaFinalDevuelto;
        end;
end;

procedure TfrmLiquidacionJudicialDes.DiasCobradoCausado;
begin
        if EdDiasCobradoCausado.Text = '' then EdDiasCobradoCausado.Text := '0';
        vDiasCobradoCausado := StrToInt(EdDiasCobradoCausado.Text);
        EdDiasCobradoCausado.Text := FormatCurr('#0',vDiasCobradoCausado);
        if (vInteresCobradoCausado <> 0) then
        begin
           vFechaInicialCobradoCausado := CalculoFecha(vFechaInteres,1);
           vFechaFinalCobradoCausado := CalculoFechaManual(vFechaInicialCobradoCausado,vDiasCobradoCausado);
           EdFechaInicialCobradoCausado.Date := vFechaInicialCobradoCausado;
           EdFechaFinalCobradoCausado.Date := vFechaFinalCobradoCausado;
        end;
end;

procedure TfrmLiquidacionJudicialDes.DiasCobradoCorriente;
begin
        if EdDiasCobradoCorriente.Text = '' then EdDiasCobradoCorriente.Text := '0';
        vDiasCobradoCorriente := StrToInt(EdDiasCobradoCorriente.Text);
        EdDiasCobradoCorriente.Text := FormatCurr('#0',vDiasCobradoCorriente);
        if (vInteresCobradoCausado <> 0) and (vInteresCobradoCorriente <> 0) then
         begin
           vFechaInicialCobradoCorriente := CalculoFecha(vFechaFinalCobradoCausado,1);
           vFechaFinalCobradoCorriente := CalculoFechaManual(vFechaInicialCobradoCorriente,vDiasCobradoCorriente);
           EdFechaInicialCobradoCorriente.Date := vFechaInicialCobradoCorriente;
           EdFechaFinalCobradoCorriente.Date := vFechaFinalCobradoCorriente;
         end;
        if (vInteresCobradoCausado = 0) and (vInteresCobradoCorriente <> 0) then
         begin
           vFechaInicialCobradoCorriente := CalculoFecha(vFechaInteres,1);
           vFechaFinalCobradoCorriente := CalculoFechaManual(vFechaInicialCobradoCorriente,vDiasCobradoCorriente);
           EdFechaInicialCobradoCorriente.Date := vFechaInicialCobradoCorriente;
           EdFechaFinalCobradoCorriente.Date := vFechaFinalCobradoCorriente;
        end;
end;

function TfrmLiquidacionJudicialDes.BuscarJuvenil(TipoId: integer;
  NumeroId: String): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo:Integer;
begin
           with IBSQL2 do begin
                Close;
                SQL.Clear;
                SQL.Add('Select First 1 "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
                SQL.Add('Where');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 4 and');
                SQL.Add('"cap$tiposestado".SE_SUMA');
                ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
                ParamByName('ID_PERSONA').AsString  := vNumeroId;
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
                  NumeroCuentaAh := FieldByName('NUMERO_CUENTA').AsInteger;
                  DigitoCuentaAh := FieldByName('DIGITO_CUENTA').AsInteger;
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
//                SQL.Add('and "cap$extracto".ID_TIPO_MOVIMIENTO <> 7');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAh;
                ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAh;
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(ffechaactual),01,01);
                ParamByName('FECHA2').AsDate := EncodeDate(YearOf(ffechaactual),12,31);
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
                ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAh;
                ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAh;
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

procedure TfrmLiquidacionJudicialDes.ActualizarCaptaciones(
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
                IBSQL2.SQL.Add('select SALDO_DISPONIBLE from SALDO_DISPONIBLE_JUD (:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
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
                      SaldoAportes := vTotalAportes;
                    end
                    else
                    if FieldByName('ID_TIPO_CAPTACION').AsInteger = 2 then begin
                      vTotalAhorros := vTotalAhorros + IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency;
                      SaldoAhorros := vTotalAhorros;
                      NumeroCuentaAh := FieldByName('NUMERO_CUENTA').AsInteger;
                      DigitoCuentaAh := FieldByName('DIGITO_CUENTA').AsInteger;
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

procedure TfrmLiquidacionJudicialDes.GridCuentasGetCellAlignment(
  Sender: TJvStringGrid; AColumn, ARow: Integer; State: TGridDrawState;
  var CellAlignment: TAlignment);
begin
        if (ARow > 0) and (AColumn = 1) then
          CellAlignment := taRightJustify;
end;

procedure TfrmLiquidacionJudicialDes.ChkPapeleriaClick(
  Sender: TObject);
begin
        if ChkPapeleria.Checked then
         begin
           with IBSQL1 do begin
             Close;
             SQL.Clear;
             SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 4');
             ExecQuery;
             vPapeleria := FieldByName('VALOR_MINIMO').AsCurrency;
             Close;
           end;
         end
        else
           vPapeleria := 0;
        TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                    vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto + vPapeleria + vExAsociados + vcostas + vComisionNal;
        EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdExasociadosExit(
  Sender: TObject);
begin
        vExAsociados := EdExasociados.Value;
        TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                    vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto + vPapeleria + vExAsociados + vhonorarios + vcostas + vComisionNal;
        EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.CmdNuevoClick(Sender: TObject);
begin
        inicializar;
end;

procedure TfrmLiquidacionJudicialDes.EdExasociadosEnter(
  Sender: TObject);
begin
        EdExasociados.SelectAll;
end;


procedure TfrmLiquidacionJudicialDes.VerificarCancelacionCaptacion(Agencia:Integer;Colocacion:string);
var  Saldo :Currency;
     AR:PCuentas;
     i:Integer;
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_DESEMBOLSO - ABONOS_CAPITAL as SALDO');
          SQL.Add('from "col$colocacion" where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION =:ID_COLOCACION');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          parambyname('ID_COLOCACION').AsString := colocacion;
          ExecQuery;
          Saldo := FieldByName('SALDO').AsCurrency;

          if Saldo = 0 then
           for i := 0 to ListaCuentas.Count - 1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('UPDATE "cap$maestro" SET ID_ESTADO = :ID');
              SQL.Add('WHERE ID_AGENCIA = :ID_AGENCIA and ');
              SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
              SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
              SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
              AR := ListaCuentas.Items[i];
              ParamByName('ID_AGENCIA').AsInteger := AR^.Agencia;
              ParamByName('ID_TIPO_CAPTACION').AsInteger := AR^.Tipo;
              ParamByName('NUMERO_CUENTA').AsInteger := AR^.Cuenta;
              ParamByName('DIGITO_CUENTA').AsInteger := AR^.Digito;
              ParamByName('ID').AsInteger := 9;
              try
               ExecQuery;
              except
               MessageDlg('Error al Marcar la Captación',mtError,[mbcancel],0);
               Exit;
              end;
            end;
          Close;
          Dispose(AR);
        end;
end;

procedure TfrmLiquidacionJudicialDes.GridCuentasGetEditText(
  Sender: TObject; ACol, ARow: Integer; var Value: String);
begin
        Fila := ARow;
end;

procedure TfrmLiquidacionJudicialDes.GridCuentasExitCell(
  Sender: TJvStringGrid; AColumn, ARow: Integer; const EditText: String);
var
AR:PCuentas;
I:Integer;
begin
          AR := ListaCuentas.Items[fila - 1];
          if StrToCurr(GridCuentas.Cells[1,fila]) > AR^.Saldo then begin
           MessageDlg('El Valor Digitado Supera el Disponible',mtError,[mbcancel],0);
           Exit;
          end;
          
          AR^.Saldo   := StrToCurr(GridCuentas.Cells[1,fila]);
          ListaCuentas.Items[Fila - 1] := AR;

          for I := 0 to ListaCuentas.Count - 1 do begin
           AR := ListaCuentas.Items[i];
           if AR^.Tipo = 1 then
            vTotalAportes := AR^.Saldo
           else
           if AR^.Tipo = 2 then
            vTotalAhorros := AR^.Saldo
           else
           if AR^.Tipo = 4 then
            vTotalJuvenil := AR^.Saldo;
          end;

          vTotalCuentas := vTotalAportes + vTotalAhorros + vTotalJuvenil + vNacional;
end;



procedure TfrmLiquidacionJudicialDes.EdAbonoHonorariosExit(
  Sender: TObject);
begin
          if EdAbonoHonorarios.Text = '' then EdAbonoHonorarios.Text := '0';
          vhonorarios := StrToCurr(EdAbonoHonorarios.Text);
          EdAbonoHonorarios.Text := FormatCurr('#,##0',vhonorarios);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vPapeleria + vExAsociados + + vhonorarios + vcostas + vComisionNal;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdNacionalExit(Sender: TObject);
begin
       vNacional := EdNacional.Value;
       if EdNacional.Value > 0 then
       begin
        IBQuery3.Open;
        IBQuery3.Last;
        DBLCBBancos.Enabled := True;
       end
       else
       begin
        IBQuery3.Close;
        DBLCBBancos.Enabled := False;
        DBLCBBancos.KeyValue := -1;
       end;

      vTotalCuentas := vTotalAportes + vTotalAhorros + vTotalJuvenil + vNacional;
      DBLCBBancos.SetFocus;

end;

procedure TfrmLiquidacionJudicialDes.DBLCBBancosExit(Sender: TObject);
begin
     if DBLCBBancos.KeyValue < 1 then
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
        GridCuentas.SetFocus;
      end;                   
end;

procedure TfrmLiquidacionJudicialDes.EdNacionalEnter(Sender: TObject);
begin
        EdNacional.SelectAll;
end;

procedure TfrmLiquidacionJudicialDes.GridCuentasExit(Sender: TObject);
begin
          vTotalCuentas := vTotalAportes + vTotalAhorros + vTotalJuvenil + vNacional;
end;

end.
