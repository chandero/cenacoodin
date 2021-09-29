unit UnitOperacionesCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, IB, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JvComponent, JvTransBtn,
  JvSpeedButton, JvItemsPanel, JvLookOut, ComCtrls, JvEdit, DBCtrls, DB,
  IBCustomDataSet, IBQuery, Grids, CheckLst, JvTypedEdit, IBSQL, Mask,DateUtils,
  JvToolEdit, JvCurrEdit, UnitGlobales,
  pr_Common, pr_TxClasses, lmdstdcA, UnitValidarCaptacion,UnitValidarColocacion,
  JvLabel, JvBlinkingLabel, JvSpecialLabel, RxCalc, ToolEdit, CurrEdit,
  OleServer, DPSDKOPSLib_TLB, DpSdkEngLib_TLB, ComObj, AxCtrls, ActiveX, UnitPantallaHuella,
  JvStringGrid, StrUtils, DBClient,sdXmlDocuments, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, JclSysUtils, Math, IBDatabase, DateUtil;


type
    TDenominacion = Record
    IdDenominacion:Integer;
    vDenominacion:Currency;
    Denominacion: TLabel;
    Cantidad:TJvIntegerEdit;
    Total:TStaticText;
    Existencia:Integer;
end;

type TPersonaData = Record
        Documento:string;
        PrimerApellido:string;
        SegundoApellido:string;
        Nombre:string;
        Existe:Boolean;
end;

type
  TfrmOperacionesCaja = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdCaja: TStaticText;
    Label2: TLabel;
    EdUsuario: TStaticText;
    Label3: TLabel;
    EdFecha: TStaticText;
    Label4: TLabel;
    EdHora: TStaticText;
    Timer: TTimer;
    Panel3: TPanel;
    CmdCerrar: TBitBtn;
    Panel2: TPanel;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabProductos: TTabSheet;
    GBProductos: TGroupBox;
    CmdAportes: TSpeedButton;
    CmdOrdinario: TSpeedButton;
    CmdRindediario: TSpeedButton;
    CmdJuvenil: TSpeedButton;
    CmdContractual: TSpeedButton;
    CmdCdat: TSpeedButton;
    CmdCartera: TSpeedButton;
    CmdOtros: TSpeedButton;
    TabCaptaciones: TTabSheet;
    GBOperaciones: TGroupBox;
    CmdCapCon: TSpeedButton;
    CmdCapRet: TSpeedButton;
    CmdCapSalir: TSpeedButton;
    TabCdats: TTabSheet;
    GBCdats: TGroupBox;
    CmdIngresarCDAT: TSpeedButton;
    CmdSaldarCDAT: TSpeedButton;
    TabColocaciones: TTabSheet;
    GBColocaciones: TGroupBox;
    CmdColAbono: TSpeedButton;
    CmdColManual: TSpeedButton;
    CmdColCastigada: TSpeedButton;
    CmdColCostas: TSpeedButton;
    CmdColRetornar: TSpeedButton;
    TabOtros: TTabSheet;
    GBOtros: TGroupBox;
    CmdSerAgua: TSpeedButton;
    CmdSerMunicipal: TSpeedButton;
    CmdSerRetornar: TSpeedButton;
    TabGenerales: TTabSheet;
    GBGenerales: TGroupBox;
    CmdOtrosIngresar: TSpeedButton;
    CmdOtrosRetirar: TSpeedButton;
    CmdOtrosRetornar: TSpeedButton;
    DSTitulares: TDataSource;
    IBTitulares: TIBQuery;
    IBConsulta: TIBSQL;
    PageControl: TPageControl;
    TabOperacionCaptacion: TTabSheet;
    Label25: TLabel;
    Label26: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    EdNumeroCap: TJvEdit;
    EdDigitoCap: TStaticText;
    EdSaldoCap: TStaticText;
    EdCanjeCap: TStaticText;
    EdDisponibleCap: TStaticText;
    EdDocumentoCap: TJvEdit;
    EdEstadoCap: TStaticText;
    EdFirmas: TStaticText;
    EdSellos: TStaticText;
    EdProtectografos: TStaticText;
    Label21: TLabel;
    CmdRetornarCDAT: TSpeedButton;
    EdOpcion: TMaskEdit;
    CmdImagenesCap: TBitBtn;
    PanelValores: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    CmdVerCheques: TBitBtn;
    Label20: TLabel;
    EdTotalCap: TStaticText;
    Panel6: TPanel;
    CmdOKCaptacion: TBitBtn;
    CBTitulares: TComboBox;
    Label22: TLabel;
    CmdRetornar: TBitBtn;
    EdMonedasCap: TRxCalcEdit;
    EdChequesCap: TRxCalcEdit;
    IBPagar: TIBSQL;
    IBOtros: TIBSQL;
    IBOtros1: TIBSQL;
    CmdGenerales: TSpeedButton;
    TabOperacionCertificado: TTabSheet;
    Label23: TLabel;
    EdNumeroCer: TJvEdit;
    EdDigitoCer: TStaticText;
    Label24: TLabel;
    EdEstadoCer: TStaticText;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    CBTitularesCer: TComboBox;
    CmdImagenesCer: TBitBtn;
    Label30: TLabel;
    EdValorCer: TStaticText;
    Label31: TLabel;
    EdDocumentoCer: TJvEdit;
    PanelValoresCer: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    CmdVerChequesCer: TBitBtn;
    EdTotalCer: TStaticText;
    Panel7: TPanel;
    CmdOKCertificado: TBitBtn;
    EdMonedasCer: TRxCalcEdit;
    EdChequesCer: TRxCalcEdit;
    TabOperacionesColocaciones: TTabSheet;
    TabOperacionesOtros: TTabSheet;
    TabOperacionesGenerales: TTabSheet;
    Label39: TLabel;
    EdDocumentoGen: TJvEdit;
    PanelValoresGen: TPanel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    CmdVerChequesGen: TBitBtn;
    EdTotalGen: TStaticText;
    Panel8: TPanel;
    CmdOKGenerales: TBitBtn;
    EdMonedasGen: TRxCalcEdit;
    EdChequesGen: TRxCalcEdit;
    Label47: TLabel;
    EdDevolucionCap: TRxCalcEdit;
    CmdVerDevolucion: TBitBtn;
    Label48: TLabel;
    EdDevolucionCer: TRxCalcEdit;
    CmdVerDevolucionCer: TBitBtn;
    Label49: TLabel;
    EdDevolucionGen: TRxCalcEdit;
    CmdVerDevolucionGen: TBitBtn;
    PanelValoresOtr: TPanel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    CmdVerChequesOtr: TBitBtn;
    EdTotalOtr: TStaticText;
    Panel9: TPanel;
    CmdOkOtros: TBitBtn;
    EdMonedasOtr: TRxCalcEdit;
    EdChequesOtr: TRxCalcEdit;
    EdDevolucionOtr: TRxCalcEdit;
    CmdVerDevolucionOtr: TBitBtn;
    Label59: TLabel;
    EdRecaudo: TStaticText;
    TabVacio: TTabSheet;
    GBAsociadoCol: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    EdNumeroColocacion: TMemo;
    EdNumeroIdentificacion: TStaticText;
    EdNombre: TStaticText;
    CmdBuscar: TBitBtn;
    EdAgencia: TDBLookupComboBox;
    GBInfoCol: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label73: TLabel;
    Label75: TLabel;
    EdValorCuota: TStaticText;
    EdPlazo: TStaticText;
    EdAmortizaCapital: TStaticText;
    EdAmortizaInteres: TStaticText;
    EdSaldoColocacion: TStaticText;
    EdTasaNominal: TStaticText;
    EdFechaCapital: TStaticText;
    EdFechaInteres: TStaticText;
    EdCuotas: TLMDSpinEdit;
    EdTotalCuotas: TStaticText;
    EdTotal1: TStaticText;
    PageColocacion: TPageControl;
    TabCol1: TTabSheet;
    GroupBox3: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    EdNuevoSaldo: TStaticText;
    EdIntereses: TStaticText;
    EdDevuelto: TStaticText;
    EdVencido: TStaticText;
    EdDIntereses: TStaticText;
    EdDDevuelto: TStaticText;
    EdDVencido: TStaticText;
    EdCapital: TStaticText;
    EdTotal: TStaticText;
    TabCol2: TTabSheet;
    PanelRecCol: TPanel;
    Label85: TLabel;
    Label86: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    EdTotalCol: TStaticText;
    Panel10: TPanel;
    CmdOKColocacion: TBitBtn;
    EdMonedasCol: TRxCalcEdit;
    EdDevolucionCol: TRxCalcEdit;
    CmdVerDevolucionCol: TBitBtn;
    IBQuery: TIBQuery;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    Label74: TLabel;
    CmdLiquidar: TBitBtn;
    Mensaje: TStaticText;
    StaticText1: TStaticText;
    EdTotalBilletesCap: TRxCalcEdit;
    EdTotalBilletesCer: TRxCalcEdit;
    Label72: TLabel;
    STotalBilletes: TStaticText;
    EdTotalBilletesCol: TRxCalcEdit;
    EdTotalBilletesGen: TRxCalcEdit;
    Label50: TLabel;
    EdDocumentoOtr: TJvEdit;
    EdTotalBilletesOtr: TRxCalcEdit;
    Label93: TLabel;
    EdRangoIni: TStaticText;
    EdRangoFin: TStaticText;
    Label94: TLabel;
    EdEstadoActualCap: TJvBlinkingLabel;
    EdEstadoActualGen: TJvBlinkingLabel;
    Label95: TLabel;
    CmdBuscarCaptacion: TBitBtn;
    IBSQL1: TIBSQL;
    Label96: TLabel;
    EdValorColocacion: TStaticText;
    Label97: TLabel;
    SDiferencia: TStaticText;
    Label87: TLabel;
    STotalBilletesCer: TStaticText;
    Label98: TLabel;
    SDiferenciaCer: TStaticText;
    Label90: TLabel;
    STotalBilletesCol: TStaticText;
    Label99: TLabel;
    SDiferenciaCol: TStaticText;
    Label91: TLabel;
    STotalBilletesOtr: TStaticText;
    Label100: TLabel;
    SDiferenciaOtr: TStaticText;
    Label92: TLabel;
    STotalBilletesGen: TStaticText;
    Label101: TLabel;
    SDiferenciaGen: TStaticText;
    TabColocacionesManual: TTabSheet;
    Panel5: TPanel;
    CmdAceptar: TBitBtn;
    BitBtn2: TBitBtn;
    BtnCerrar: TBitBtn;
    CmdReversar: TBitBtn;
    CmdGrabar: TBitBtn;
    GroupBox2: TGroupBox;
    Label102: TLabel;
    Label103: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    EdNumeroColocacionManual: TMemo;
    EdTipoIdentificacionManual: TStaticText;
    EdNombreManual: TStaticText;
    BitBtn1: TBitBtn;
    EdAgenciaManual: TDBLookupComboBox;
    EdSaldoColocacionManual: TStaticText;
    EdFechaCapitalManual: TStaticText;
    EdFechaInteresManual: TStaticText;
    GroupBox1: TGroupBox;
    Label110: TLabel;
    EsCapital: TCheckBox;
    EsIntereses: TCheckBox;
    GroupBox4: TGroupBox;
    Label111: TLabel;
    EdAbonoCapital: TEdit;
    GroupBox5: TGroupBox;
    Devueltos: TRadioButton;
    Cobrados: TRadioButton;
    Panel11: TPanel;
    CmdGenerarInformeManual: TBitBtn;
    CmdRecaudarManual: TBitBtn;
    CmdAceptarManual: TBitBtn;
    CmdReversarManual: TBitBtn;
    Calculadora: TRxCalculator;
    CmdSumadora: TSpeedButton;
    IBSaldo: TIBSQL;
    ReportM: TprTxReport;
    Label130: TLabel;
    EdCostas: TStaticText;
    PageControl2: TPageControl;
    InfoIntereses: TTabSheet;
    GroupBox6: TGroupBox;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
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
    EdAbonoInteresAnticipado: TLabeledEdit;
    EdFechaInicialAnticipado: TDateTimePicker;
    EdFechaFinalAnticipado: TDateTimePicker;
    EdDiasAplicadosAnticipado: TLabeledEdit;
    EdTasaAplicadaAnticipado: TLabeledEdit;
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
    InfoDevueltos: TTabSheet;
    GroupBox7: TGroupBox;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
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
    InfoCobrados: TTabSheet;
    GroupBox8: TGroupBox;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    EdInteresCobradoCausado: TLabeledEdit;
    EdDiasCobradoCausado: TLabeledEdit;
    EdTasaCobradoCausado: TLabeledEdit;
    EdFechaInicialCobradoCausado: TDateTimePicker;
    EdFechaFinalCobradoCausado: TDateTimePicker;
    EdInteresCobradoCorriente: TLabeledEdit;
    EdFechaInicialCobradoCorriente: TDateTimePicker;
    EdFechaFinalCobradoCorriente: TDateTimePicker;
    EdDiasCobradoCorriente: TLabeledEdit;
    EdTasaCobradoCorriente: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    DateTimePicker8: TDateTimePicker;
    DateTimePicker7: TDateTimePicker;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit17: TLabeledEdit;
    Label124: TLabel;
    EdTotalColManual: TStaticText;
    EdNoComprobanteManual: TStaticText;
    EdNoComprobante: TStaticText;
    Ninguno: TRadioButton;
    ChkAutorizado: TCheckBox;
    LAutorizado: TLabel;
    EdEstadoManual: TStaticText;
    cmdConfrontarHuella: TBitBtn;
    FPGetTemplate1: TFPGetTemplate;
    IBQueryHuella: TIBQuery;
    TabColCastigada: TTabSheet;
    GroupBox9: TGroupBox;
    Label112: TLabel;
    Label113: TLabel;
    Label115: TLabel;
    Label129: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    EdCasNumeroColocacion: TMemo;
    EdCasTipoIdentificacion: TStaticText;
    EdCasNombre: TStaticText;
    cmdCasBuscar: TBitBtn;
    DBLCBCasAgencia: TDBLookupComboBox;
    EdCasSaldoActual: TStaticText;
    EdCasFechaCapital: TStaticText;
    EdCasFechaInteres: TStaticText;
    EdCasCostas: TStaticText;
    EdCasEstado: TStaticText;
    GroupBox10: TGroupBox;
    Label158: TLabel;
    Label159: TLabel;
    EdTotalCas: TStaticText;
    EdCasNoComprobante: TStaticText;
    PagoTotal: TCheckBox;
    GroupBox12: TGroupBox;
    GridCuentas: TJvStringGrid;
    GroupBox11: TGroupBox;
    Label114: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    Label166: TLabel;
    EdFechaInicialCas: TDateTimePicker;
    EdFechaFinalCas: TDateTimePicker;
    EdTasaAplicadaCas: TLabeledEdit;
    EdAbonoCapitalCas: TJvCurrencyEdit;
    EdAbonoInteresCas: TJvCurrencyEdit;
    EdAbonoCostasCas: TJvCurrencyEdit;
    EdAbonoHonorariosCas: TJvCurrencyEdit;
    EdDiasAplicadosCas: TJvIntegerEdit;
    IBSQL2: TIBSQL;
    Panel12: TPanel;
    SpeedButton1: TSpeedButton;
    CmdInformeCas: TBitBtn;
    CmdRecaudarCas: TBitBtn;
    CmdAceptarCas: TBitBtn;
    CmdReversarCas: TBitBtn;
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
    GroupBox13: TGroupBox;
    Label169: TLabel;
    EdCasCuentaAbogado: TStaticText;
    Label168: TLabel;
    EdCasAbogado: TStaticText;
    GroupBox14: TGroupBox;
    Label104: TLabel;
    Label131: TLabel;
    EdCuentaAbogadoM: TStaticText;
    EdAbogadoM: TStaticText;
    Panel13: TPanel;
    CmdAbonar: TBitBtn;
    CmdInforme: TBitBtn;
    Report: TprTxReport;
    ReporteCas: TprTxReport;
    EdNuevoSaldoCap: TStaticText;
    Label157: TLabel;
    Label167: TLabel;
    IBTabla: TIBSQL;
    IBVerificaTmp: TIBSQL;
    CmdAgencias: TSpeedButton;
    TabAgencias: TTabSheet;
    TabOpAgencias: TTabSheet;
    TabOperacionCapAgencias: TTabSheet;
    GBagencias: TGroupBox;
    CmdApotesAg: TSpeedButton;
    CmdOrdinarioAg: TSpeedButton;
    CmdRindediarioAg: TSpeedButton;
    CmdJuvenilAg: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    CmdRetornarAg: TSpeedButton;
    GBOperacionesConAg: TGroupBox;
    CmdAgenciaCon: TSpeedButton;
    CmdAgenciaRet: TSpeedButton;
    CmdAgenciaSalir: TSpeedButton;
    Label170: TLabel;
    EdEstadoActualCapAg: TJvBlinkingLabel;
    CmdConfrontarHuellaAg: TBitBtn;
    CmdImagenesCapAg: TBitBtn;
    Label191: TLabel;
    EdCapAgencia: TDBLookupComboBox;
    ChkAutorizadoAg: TCheckBox;
    LAutorizadoAg: TLabel;
    Label171: TLabel;
    EdNumeroCapAg: TJvEdit;
    EdDigitoCapAg: TStaticText;
    Label172: TLabel;
    EdEstadoCapAg: TStaticText;
    Label173: TLabel;
    EdFirmasAg: TStaticText;
    Label190: TLabel;
    EdsellosAg: TStaticText;
    Label192: TLabel;
    EdprotectografosAg: TStaticText;
    Label176: TLabel;
    CBTitularesAg: TComboBox;
    Label177: TLabel;
    EdSaldoCapAg: TStaticText;
    Label178: TLabel;
    EdCanjeCapAg: TStaticText;
    Label179: TLabel;
    EdDisponibleCapAg: TStaticText;
    Label174: TLabel;
    EdDocumentoCapAg: TJvEdit;
    Label175: TLabel;
    EdRangoIniAg: TStaticText;
    EdRangoFinAg: TStaticText;
    Label194: TLabel;
    Label193: TLabel;
    EdNuevoSaldoCapAg: TStaticText;
    Panel14: TPanel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    Label189: TLabel;
    CmdVerChequesAg: TBitBtn;
    EdTotalCapAg: TStaticText;
    Panel15: TPanel;
    CmdokCaptacionAg: TBitBtn;
    EdTotalMonedasCapAg: TRxCalcEdit;
    EdTotalChequesCapAg: TRxCalcEdit;
    EdDevolucionCapAg: TRxCalcEdit;
    CmdVerDevolucionAg: TBitBtn;
    EdTotalBilletesCapAg: TRxCalcEdit;
    STotalBilletesAg: TStaticText;
    SDiferenciaAg: TStaticText;
    ChkCreditos: TCheckBox;
    Panel16: TPanel;
    BtcerrarAg: TSpeedButton;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    IBagencias: TIBQuery;
    DSagencias: TDataSource;
    CDhuella: TClientDataSet;
    CDhuelladatos_huella: TBlobField;
    CDhuellatitular: TStringField;
    CDfirma: TClientDataSet;
    CDfirmafirma: TBlobField;
    CDfirmatitular: TStringField;
    IdTCPClient1: TIdTCPClient;
    BTbuscar: TBitBtn;
    ChkPapeleria: TCheckBox;
    ChkPapeleriaCas: TCheckBox;
    IBSQL3: TIBSQL;
    IBTRetiro: TIBTransaction;
    Label195: TLabel;
    EdAprovecha: TJvCurrencyEdit;
    EdFechaInicialA: TDateTimePicker;
    EdFechaFinalA: TDateTimePicker;
    EdDiasAplicadosA: TJvIntegerEdit;
    EdTasaAplicadaA: TLabeledEdit;
    ChVCredito: TCheckBox;
    GrDatosUsuario: TGroupBox;
    Label9: TLabel;
    edDocumentoUsuario: TEdit;
    Label10: TLabel;
    edPrimerApellidoUsuario: TEdit;
    Label11: TLabel;
    edSegundoApellidoUsuario: TEdit;
    Label32: TLabel;
    edNombreUsuario: TEdit;
    cmdUsuario: TBitBtn;
    GrDatosUsuarioAg: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edDocumentoUsuarioAg: TEdit;
    edPrimerApellidoUsuarioAg: TEdit;
    edSegundoApellidoUsuarioAg: TEdit;
    edNombreUsuarioAg: TEdit;
    CmdUsuarioAg: TBitBtn;
    GrpCertificadoAutoriza: TGroupBox;
    Label42: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    edDocumentoOpCertUsuario: TEdit;
    edPrimerApellidoOpCertUsuario: TEdit;
    edSegundoApellidoOpCertUsuario: TEdit;
    edNombreOpCertUsuario: TEdit;
    cmdOpCertUsuario: TBitBtn;
    GrpColocacionAutoriza: TGroupBox;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label180: TLabel;
    edDocumentoOpColUsuario: TEdit;
    edPrimerApellidoOpColUsuario: TEdit;
    edSegundoApellidoOpColUsuario: TEdit;
    edNombreOpColUsuario: TEdit;
    cmdOpColUsuario: TBitBtn;
    procedure TimerTimer(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdDocumentoCapKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCapKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAportesClick(Sender: TObject);
    procedure CmdOrdinarioClick(Sender: TObject);
    procedure CmdRindediarioClick(Sender: TObject);
    procedure CmdJuvenilClick(Sender: TObject);
    procedure CmdContractualClick(Sender: TObject);
    procedure CmdCapConClick(Sender: TObject);
    procedure CmdRetornarClick(Sender: TObject);
    procedure TabCaptacionesEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdOpcionKeyPress(Sender: TObject; var Key: Char);
    procedure EdOpcionEnter(Sender: TObject);
    procedure EdOpcionChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdNumeroCapExit(Sender: TObject);
    procedure CmdCapSalirClick(Sender: TObject);
    procedure CmdCapRetClick(Sender: TObject);
    procedure EdNumeroCapEnter(Sender: TObject);
    procedure EdDocumentoCapExit(Sender: TObject);
    procedure CmdVerChequesClick(Sender: TObject);
    procedure EdChequesCapExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdOKCaptacionClick(Sender: TObject);
    procedure EdMonedasCapChange(Sender: TObject);
    procedure EdChequesCapChange(Sender: TObject);
    procedure CmdCdatClick(Sender: TObject);
    procedure CmdIngresarCDATClick(Sender: TObject);
    procedure CmdSaldarCDATClick(Sender: TObject);
    procedure CmdCarteraClick(Sender: TObject);
    procedure CmdRetornarCDATClick(Sender: TObject);
    procedure EdNumeroCerKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCerExit(Sender: TObject);
    procedure EdDocumentoCerExit(Sender: TObject);
    procedure EdMonedasCerChange(Sender: TObject);
    procedure CmdOKCertificadoClick(Sender: TObject);
    procedure CmdColRetornarClick(Sender: TObject);
    procedure EdDocumentoGenKeyPress(Sender: TObject; var Key: Char);
    procedure EdDocumentoGenExit(Sender: TObject);
    procedure CmdOtrosIngresarClick(Sender: TObject);
    procedure CmdGeneralesClick(Sender: TObject);
    procedure CmdOtrosRetornarClick(Sender: TObject);
    procedure CmdOtrosRetirarClick(Sender: TObject);
    procedure CmdVerDevolucionClick(Sender: TObject);
    procedure EdDevolucionCapChange(Sender: TObject);
    procedure EdDevolucionCapExit(Sender: TObject);
    procedure EdDevolucionGenChange(Sender: TObject);
    procedure CmdVerDevolucionCerClick(Sender: TObject);
    procedure CmdVerDevolucionGenClick(Sender: TObject);
    procedure EdDevolucionCerChange(Sender: TObject);
    procedure EdDevolucionCerExit(Sender: TObject);
    procedure EdDevolucionGenExit(Sender: TObject);
    procedure CmdOtrosClick(Sender: TObject);
    procedure CmdSerAguaClick(Sender: TObject);
    procedure CmdSerMunicipalClick(Sender: TObject);
    procedure CmdVerDevolucionOtrClick(Sender: TObject);
    procedure EdDevolucionOtrExit(Sender: TObject);
    procedure CmdOkOtrosClick(Sender: TObject);
    procedure CmdOKGeneralesClick(Sender: TObject);
    procedure CmdColAbonoClick(Sender: TObject);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure EdNumeroColocacionEnter(Sender: TObject);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure CmdAbonarClick(Sender: TObject);
    procedure EdDevolucionColChange(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure CmdVerDevolucionColClick(Sender: TObject);
    procedure EdDevolucionColExit(Sender: TObject);
    procedure EdNoComprobanteKeyPress(Sender: TObject; var Key: Char);
    procedure EdMonedasColChange(Sender: TObject);
    procedure EdMonedasColExit(Sender: TObject);
    procedure EdDevolucionColEnter(Sender: TObject);
    procedure EdMonedasOtrChange(Sender: TObject);
    procedure EdMonedasOtrExit(Sender: TObject);
    procedure EdMonedasCerExit(Sender: TObject);
    procedure EdMonedasCapExit(Sender: TObject);
    procedure EdMonedasGenExit(Sender: TObject);
    procedure CmdImagenesCapClick(Sender: TObject);
    procedure CmdImagenesCerClick(Sender: TObject);
    procedure CmdOKColocacionClick(Sender: TObject);
    procedure EdTotalBilletesCapChange(Sender: TObject);
    procedure EdTotalBilletesCapExit(Sender: TObject);
    procedure EdDocumentoOtrExit(Sender: TObject);
    procedure EdTotalBilletesOtrChange(Sender: TObject);
    procedure EdTotalBilletesOtrExit(Sender: TObject);
    procedure EdTotalBilletesColChange(Sender: TObject);
    procedure EdTotalBilletesColExit(Sender: TObject);
    procedure CmdSerRetornarClick(Sender: TObject);
    procedure TabProductosShow(Sender: TObject);
    procedure EdTotalBilletesGenChange(Sender: TObject);
    procedure EdTotalBilletesGenExit(Sender: TObject);
    procedure CmdBuscarCaptacionClick(Sender: TObject);
    procedure EdTotalBilletesCerChange(Sender: TObject);
    procedure EdTotalBilletesCerExit(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure CmdColManualClick(Sender: TObject);
    procedure EdNumeroColocacionManualExit(Sender: TObject);
    procedure EsCapitalClick(Sender: TObject);
    procedure EsInteresesClick(Sender: TObject);
    procedure EdAbonoCapitalExit(Sender: TObject);
    procedure DevueltosClick(Sender: TObject);
    procedure CobradosClick(Sender: TObject);
    procedure EdInteresCobradoExit(Sender: TObject);
    procedure EdInteresDevueltoExit(Sender: TObject);
    procedure EdFechaInicialCobradoExit(Sender: TObject);
    procedure EdFechaFinalCobradoExit(Sender: TObject);
    procedure EdFechaInicialDevueltoExit(Sender: TObject);
    procedure EdFechaFinalDevueltoExit(Sender: TObject);
    procedure EdAbonoInteresCausadoExit(Sender: TObject);
    procedure EdFechaInicialCausadoExit(Sender: TObject);
    procedure EdFechaFinalCausadoExit(Sender: TObject);
    procedure EdDiasAplicadosCausadoExit(Sender: TObject);
    procedure EdAbonoInterescorrienteExit(Sender: TObject);
    procedure EdFechaInicialCorrienteExit(Sender: TObject);
    procedure EdFechaFinalCorrienteExit(Sender: TObject);
    procedure EdDiasAplicadosCorrienteExit(Sender: TObject);
    procedure EdAbonoInteresAnticipadoExit(Sender: TObject);
    procedure EdFechaInicialAnticipadoExit(Sender: TObject);
    procedure EdFechaFinalAnticipadoExit(Sender: TObject);
    procedure EdDiasAplicadosAnticipadoExit(Sender: TObject);
    procedure EdAbonoInteresMoraExit(Sender: TObject);
    procedure EdFechaInicialMoraExit(Sender: TObject);
    procedure EdFechaFinalMoraExit(Sender: TObject);
    procedure EdDiasAplicadosMoraExit(Sender: TObject);
    procedure CmdGenerarInformeManualClick(Sender: TObject);
    procedure CmdAceptarManualAntClick(Sender: TObject);
    procedure CmdSumadoraClick(Sender: TObject);
    procedure CmdReversarManualClick(Sender: TObject);
    procedure CmdRecaudarManualClick(Sender: TObject);
    procedure BtnCerrarClick(Sender: TObject);
    procedure EdDiasAplicadosCausadoChange(Sender: TObject);
    procedure EdDiasAplicadosCorrienteChange(Sender: TObject);
    procedure EdDiasAplicadosAnticipadoChange(Sender: TObject);
    procedure CmdVerChequesGenClick(Sender: TObject);
    procedure EdChequesGenChange(Sender: TObject);
    procedure EdChequesGenExit(Sender: TObject);
    procedure CmdAceptarManualClick(Sender: TObject);
    procedure EdTasaDevCobExit(Sender: TObject);
    procedure EdAbonoInteresContingenteExit(Sender: TObject);
    procedure EdAbonoCostasExit(Sender: TObject);
    procedure EdAbonoHonorariosExit(Sender: TObject);
    procedure EdDiasAplicadosContingenteChange(Sender: TObject);
    procedure EdDiasAplicadosContingenteExit(Sender: TObject);
    procedure EdDiasAplicadosMoraChange(Sender: TObject);
    procedure EdDiasDevueltoChange(Sender: TObject);
    procedure EdDiasDevueltoExit(Sender: TObject);
    procedure EdInteresCobradoCausadoExit(Sender: TObject);
    procedure EdInteresCobradoCorrienteExit(Sender: TObject);
    procedure EdDiasCobradoCausadoChange(Sender: TObject);
    procedure EdDiasCobradoCausadoExit(Sender: TObject);
    procedure EdDiasCobradoCorrienteExit(Sender: TObject);
    procedure EdDiasCobradoCorrienteChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure NingunoClick(Sender: TObject);
    procedure ChkAutorizadoEnter(Sender: TObject);
    procedure ChkAutorizadoExit(Sender: TObject);
    procedure EdTotalBilletesCapEnter(Sender: TObject);
    procedure cmdConfrontarHuellaClick(Sender: TObject);
    procedure FPGetTemplate1Done(Sender: TObject;
      var pTemplate: OleVariant);
    procedure FPGetTemplate1SampleReady(Sender: TObject;
      var pSample: OleVariant);
    procedure PagoTotalClick(Sender: TObject);
    procedure EdCasNumeroColocacionExit(Sender: TObject);
    procedure CmdColCastigadaClick(Sender: TObject);
    procedure EdAbonoCapitalCasExit(Sender: TObject);
    procedure EdAbonoInteresCasExit(Sender: TObject);
    procedure EdAbonoCostasCasExit(Sender: TObject);
    procedure EdDiasAplicadosCasExit(Sender: TObject);
    procedure EdAbonoCostasCasEnter(Sender: TObject);
    procedure EdAbonoInteresCasEnter(Sender: TObject);
    procedure EdAbonoCapitalCasEnter(Sender: TObject);
    procedure EdAbonoHonorariosCasEnter(Sender: TObject);
    procedure EdTasaAplicadaCasEnter(Sender: TObject);
    procedure EdDiasAplicadosCasEnter(Sender: TObject);
    procedure CmdAceptarCasClick(Sender: TObject);
    procedure EdAbonoHonorariosCasExit(Sender: TObject);
    procedure CmdReversarCasClick(Sender: TObject);
    procedure CmdRecaudarCasClick(Sender: TObject);
    procedure EdCasNumeroColocacionEnter(Sender: TObject);
    procedure CmdInformeCasClick(Sender: TObject);
    procedure CmdAgenciasClick(Sender: TObject);
    procedure CmdApotesAgClick(Sender: TObject);
    procedure CmdOrdinarioAgClick(Sender: TObject);
    procedure CmdRindediarioAgClick(Sender: TObject);
    procedure CmdJuvenilAgClick(Sender: TObject);
    procedure CmdRetornarAgClick(Sender: TObject);
    procedure CmdAgenciaConClick(Sender: TObject);
    procedure CmdAgenciaRetClick(Sender: TObject);
    procedure CmdAgenciaSalirClick(Sender: TObject);
    procedure EdCapAgenciaExit(Sender: TObject);
    procedure ChkAutorizadoAgEnter(Sender: TObject);
    procedure ChkAutorizadoAgExit(Sender: TObject);
    procedure EdNumeroCapAgEnter(Sender: TObject);
    procedure EdNumeroCapAgExit(Sender: TObject);
    procedure CmdConfrontarHuellaAgClick(Sender: TObject);
    procedure CmdImagenesCapAgClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure EdDocumentoCapAgExit(Sender: TObject);
    procedure EdTotalBilletesCapAgChange(Sender: TObject);
    procedure EdTotalBilletesCapAgEnter(Sender: TObject);
    procedure EdTotalBilletesCapAgExit(Sender: TObject);
    procedure EdTotalMonedasCapAgChange(Sender: TObject);
    procedure EdTotalMonedasCapAgExit(Sender: TObject);
    procedure EdTotalChequesCapAgChange(Sender: TObject);
    procedure CmdVerChequesAgClick(Sender: TObject);
    procedure EdTotalChequesCapAgExit(Sender: TObject);
    procedure EdDevolucionCapAgChange(Sender: TObject);
    procedure CmdokCaptacionAgClick(Sender: TObject);
    procedure BtcerrarAgClick(Sender: TObject);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure BTbuscarClick(Sender: TObject);
    procedure ChkPapeleriaClick(Sender: TObject);
    procedure ChkPapeleriaCasClick(Sender: TObject);
    procedure CmdVerChequesCerClick(Sender: TObject);
    procedure EdChequesCerChange(Sender: TObject);
    procedure EdChequesCerExit(Sender: TObject);
    procedure EdAprovechaEnter(Sender: TObject);
    procedure EdAprovechaExit(Sender: TObject);
    procedure EdDiasAplicadosAEnter(Sender: TObject);
    procedure EdDiasAplicadosAExit(Sender: TObject);
    procedure edDocumentoUsuarioExit(Sender: TObject);
    procedure cmdUsuarioClick(Sender: TObject);
    procedure edDocumentoOpCertUsuarioExit(Sender: TObject);
    procedure cmdOpCertUsuarioClick(Sender: TObject);
    procedure edDocumentoOpColUsuarioExit(Sender: TObject);
    procedure cmdOpColUsuarioClick(Sender: TObject);
    procedure edDocumentoUsuarioAgExit(Sender: TObject);
    procedure CmdUsuarioAgClick(Sender: TObject);
  private
    { Private declarations }
    LDenominacion:array of TDenominacion;
    LDenominacionCer:array of TDenominacion;
    LDenominacionCol:array of TDenominacion;
    LDenominacionOtr:array of TDenominacion;
    LDenominacionGen:array of TDenominacion;
    VGeneral:Currency;
    procedure SetVGeneral(Value:Currency);
    procedure VOopcion;
    procedure ValorDenominacion(Sender: TObject);
    procedure RealizarConsignacion;
    procedure RealizarRetiro;
    property TGeneral:Currency read VGeneral Write SetVGeneral;
    function GrabarConsignacion:Boolean;
    function GrabarRetiro:Boolean;
    procedure LimpiarCaptacion;
    function RecuperarArqueo:Boolean;
    function ValidarLibreta: Boolean;
    procedure ValorDenominacionCer(Sender:TObject);
    procedure RealizarIngreso;
    procedure RealizarSalida;
    function GrabarIngreso: Boolean;
    function GrabarSalida: boolean;
    procedure ValorDenominacionGen(Sender: TObject);
    procedure TabsNoVisibles;
    procedure CerosVariables;
    procedure RealizarGenEntrada;
    procedure RealizarGenSalida;
    function GrabarGenEntrada: Boolean;
    function GrabarGenSalida: Boolean;
    procedure ValorDenominacionOtr(Sender: TObject);
    procedure RealizarOtrEntrada;
    function GrabarOtrEntrada: Boolean;
    procedure InicializarCol;
    procedure InicializarCastigada;
    procedure ValorDenominacionCol(Sender: TObject);
    procedure MostrarFormulario;
    procedure RealizarAbono;
    function GrabarAbono: Boolean;
    procedure GrabarExtractoCol;
    procedure GrabarTablaLiquidacion;
    procedure GrabarExtractoDetM;
    procedure GrabarExtractoColM;
    procedure DiasAnticipados;
    procedure DiasMoras;
    procedure DiasCorrientes;
    procedure DiasCausados;
    procedure Excepciones(Sender: TObject; E: Exception);
    procedure DiasContingentes;
    procedure LimpiarManualIntereses;
    procedure DiasDevueltos;
    procedure DiasCobradoCausado;
    procedure DiasCobradoCorriente;
    procedure LimpiarDevueltos;
    procedure LimpiarCobrados;
    function SaldoEnCaja: Currency;
    procedure ValidarHuella;
    procedure ActualizarCaptaciones(TipoId: integer; NumeroId: String);
    procedure DiasInteres;
    procedure GrabarExtractoColCastigada;
    function GrabarConsignacionAg: Boolean;
    function GrabarRetiroAg: Boolean;
    procedure RealizarConsignacionAg;
    procedure RealizarRetiroAg;
    function ValidarDisponible(valor: Currency): boolean;
    function SaldoRemoto: currency;
    procedure DiasAprov;
    procedure ValidarEntregaDetalle;
    procedure BuscarMinimoSARLAFT;
    function ValidarPersona(DocumentoUsuario:string):TPersonaData;
    function GuardarPersona(PersonaData: TPersonaData):Boolean;    
  public
    { Public declarations }
    function ValidarCaja: Boolean;
  end;


type PLista = ^ALista;
     ALista = Record
      Codigo:Integer;
      Descripcion:string;
      Plaza:string;
      Numero:string;
      Valor:Currency;
end;

type PListaDev = ^AListaDev;
     AListaDev = Record
      IdDenominacion:Integer;
      vDenominacion:Currency;
      Cantidad:Integer;
      Existencias:Integer;
end;





var
  frmOperacionesCaja: TfrmOperacionesCaja;
  TipoCaptacion:Integer;
  Opcion:Integer;
  CapOperacion:Char;
  EstadoAct:Integer;
  ParaSaldar:Integer;
  Saldo:Currency;
  Movimiento:Currency;
  Canje:Currency;
  Disponible:Currency;
  Minimo:Currency;
  TSumaBilletes:Currency;
  TBilletes:Currency;
  TMonedas:Currency;
  TCheques:Currency;
  TDevolucion:Currency;
  ListaCheques:TList;
  ListaDevolucion:TList;
  MonedasDevolucion:Currency;
  THayMonedas:Currency;
  TTotalEnCaja:Currency;
  Libreta:Integer;
  LibGeneral:Boolean;
  OrigenM:Smallint;
  frmValidarCaptacion:TfrmValidarCaptacion;
  FValidar:TValidarCap;
  CValidar:TValidarCol;
  Colocacion : string;
  vNoComprobante : string;
  vTipoOperacion : integer;
  vseguro        : currency;
  vpagxcliente   : currency;
  vhonorarios    : currency;
  vcostas        : Currency;
  vPapeleria     : Currency;
  votrospagos    : currency;
  vCuotaNo       : Integer;
  Capital   :Currency;
  Causado   :Currency;
  DiasCausado:Integer;
  Corriente :Currency;
  DiasCorriente:Integer;
  Vencido   :Currency;
  DiasVencido:Integer;
  Anticipado:Currency;
  DiasAnticipado:Integer;
  Devuelto  :Currency;
  DiasDevuelto:Integer;
  Total:Currency;
  abono_capital : currency;
  abono_cxc : currency;
  abono_servicios : currency;
  abono_anticipado: currency;
  abono_mora : currency;
  Cuota_anterior : integer;
  cambio : boolean;
  DirInt : integer;
  debito : string;
  credito : string;
  honorarios : string;
  separadormiles : char;
  CodigoAnt:string;
  _bDocumentoUsuarioValido:Boolean;

  Lista:TList;
  Clasificacion:string;
  ClasificacionM:Integer;
  Garantia:string;
  GarantiaM:Integer;
  Estado:string;
  Cuenta:Integer;
  FechaCorte:TDate;
  Asociado:string;
  NuevoSaldo:Currency;
  InteresesHasta:TDate;
  CapitalHasta:TDate;
  ProximaCuota:TDate;
  Categoria:string;
  TipoCuota:Integer;
  Amortizacion:Integer;
  AmortizaK:Integer;
  FechaInteres:TDate;
  vFechaCapital:TDate;
  vValorCuota:Currency;
  vFechaInteres:TDate;
  vComprobante:string;
  vAbonoCapital:Currency;
  FechaIntAnt:TDate;
  FechaCapAnt:TDate;
  TipoDeInteres:string;
  TasaC:Double;
  vPuntosAdic:Double;
  TipoInteres:Integer;
  IdEstado:Integer;
  SaldoTabla:Currency;

  vDiasDevuelto:Integer;
  vTasaDevolucion:Single;

  vInteresCobradoCausado:Currency;
  vFechaInicialCobradoCausado:TDate;
  vFechaFinalCobradoCausado:TDate;
  vDiasCobradoCausado:Integer;
  vTasaCobradoCausado:Single;
  vInteresCobradoCorriente:Currency;
  vFechaInicialCobradoCorriente:TDate;
  vfechafinalcobradocorriente:TDate;
  vDiasCobradoCorriente:Integer;
  vTasaCobradoCorriente:Single;

  vInteresCobrado:Currency;
  vInteresDevuelto:Currency;
  vFechaInicialCobrado:TDate;
  vFechaFinalCobrado:TDate;
  vFechaInicialDevuelto:TDate;
  vFechaFinalDevuelto:TDate;
  vTasaDevCob:Single;

  vAbonoInteresContingente:Currency;
  vFechaInicialContingente:TDate;
  vFechaFinalContingente:TDate;
  vDiasContingente:Integer;
  vTasaContingente:Single;

  vAbonoInteresCausado:Currency;
  vFechaInicialCausado:TDate;
  vFechaFinalCausado:TDate;
  vDiasCausado:Integer;
  vTasaCausado:Single;

  vAbonoInteresCorriente:Currency;
  vFechaInicialCorriente:TDate;
  vFechaFinalCorriente:TDate;
  vDiasCorriente:Integer;
  vTasaCorriente:Single;

  vAbonoInteresAnticipado:Currency;
  vFechaInicialAnticipado:TDate;
  vFechaFinalAnticipado:TDate;
  vDiasAnticipado:Integer;
  vTasaAnticipado:Single;

  vAbonoInteresMora:Currency;
  vFechaInicialMora:TDate;
  vFechaFinalMora:TDate;
  vDiasMora:Integer;
  vTasaMora:Single;

  _vMinimoSARLAFT:Currency;

  vFechaIInt:TDate;
  vFechaFInt:TDate;
  CuotaTabla:Integer;
  FechaTabla:TDate;
  CapitalaPagar:Currency;
  InteresaPagar:Currency;
  CodigoPuc:string;
  FechaInicial:TDate;
  FechaFinal:TDate;
  Dias:Integer;
  Tasa:Single;
  DebitoM:Currency;
  CreditoM:Currency;
  TotalDebitosM:Currency;
  TotalCreditosM:Currency;
  Devolucion:Boolean;
  TasaLiquidacion:Single;
  Caja:Currency;
  vTotalInteres:Currency;

  Es_ServiCaja:Boolean;
  ValorCuotaCon:Currency;
  CredPagoTotal:Boolean;

  NuevaFechaCapital:TDate;
    
// Variables de Liquidacion Castigada
  NumeroCuentaAbogado:Integer;
  DigitoCuentaAbogado:Integer;
  vAbonoCapitalCas:Currency;
  vAbonoAprov:Currency;
  vAbonoInteresCas:Currency;
  vDiasAplicadosCas:Integer;
  vDiasA:Integer;
  vTasaAplicadaCas:Single;
  vTasaAplicadaCasA:Single;
  vAbonoCostasCas:Currency;
  vAbonoHonorariosCas:Currency;
  vFechaInicialInteresCas:TDate;
  vFechaFinalInteresCas:TDate;
  vFechaInicialInteresA:TDate;
  vFechaFinalInteresA:TDate;
  vFechaInteresCas:TDate;
  vFechaCapitalCas:TDate;
  TGeneralCas:Currency;
  TotalDebitosCas:Currency;
  TotalCreditosCas:Currency;



// Variables Huella

  pvData        : array[0..2048] of Byte;
  Tamano        : Integer;
  c_IVerify     : IFPVerify;
  pErr          : AIErrors;
  ctlHuella     : Boolean;
  Id            : Integer;
  Identificacion: string;
  frmPantallaHuella:TfrmPantallaHuella;
//  variables sucursales

  Sucursal : Integer;
  PuertoServidor:Integer;
  HostServidor:string;
  vTamano :Integer;
  vIdestadoAg :Integer;
  vPermitemoviAg :Boolean;
  vPermitemoventradaAg :Boolean;
  vNumeroInicialAg :Integer;
  VnumeroFinalAg :Integer;
  VparaSaldarAg :Boolean;
  Valida_Tcp :Boolean;
  NumeroPeticion :string;
  AstreamC :TStringStream;
  XmlPetC,XmlResC :TsdXmlDocument;
  tamanoC :Integer;
  nodo,nodo1 :TXmlNode;
  Verifica_Huella :Boolean;
  vHora_Sucursal :Ttime;
  vFecha_Sucursal :TDate;
  Asociado_Titular :string;
  VbilletesComision :Currency;
  VmonedasComision :Currency;
  VchequesComision :Currency;
  Vcomision :Currency;
  id_persona_titular :string;
  id_identificacion_titular :Integer;
  C_Aportes :Integer;
  D_Aportes :Integer;
  vCuotasC :Currency;
  vFechaDecuento :TDate;
  vDiasContractual :Integer;
  vNuevoPlazo :Integer;
  ListaC :TList;
  I :Integer;
  ARecordc:PTablaConLiq;


implementation

{$R *.dfm}

uses UnitRelacionCheques,UnitArqueoDevolucion, UnitGlobalesCol,
  UnitdmColocacion, UnitdmGeneral,UnitBuscarColocacion,
  UnitBuscarPersona,UnitImagenesPersona, UnitBuscarCaptacion,
  UnitVistaPreliminar, UnitPantallaProgreso, ZlibEx, UnitFirmas,
  UnitRemotaConsulta, UnitVisacionRetirosCaja;

var MyCuotasLiq:TCuotasLiq;

procedure TfrmOperacionesCaja.SetVGeneral(Value:Currency);
begin
        VGeneral := Value;
        if (CapOperacion = 'R') or (CapOperacion = 'S') or (CapOperacion = 'M') then
         if (VGeneral-TCheques) > SaldoEnCaja then
          begin
            MessageDlg('Está sobrepasando el efectivo disponible en caja',mtError,[mbcancel],0);
          end;

        if CapOperacion = 'R' then
         begin
           if (VGeneral > Disponible) and (VGeneral <> Saldo) and ( Disponible >= 0 ) then
           begin
             MessageDlg('Está sobrepasando el disponible de la cuenta',mtInformation,[mbok],0);
          end;
          if (VGeneral = Saldo) and ( EstadoAct = 1 ) then
          begin
            MessageDlg('Está digitando el saldo exacto de la cuenta y el Estado de la cuenta es Activa',mtInformation,[mbok],0);
          end;
        end;
        SDiferencia.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);
        SDiferenciaCer.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);
        SDiferenciaCol.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);
        SDiferenciaOtr.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);
        SDiferenciaGen.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);
        SDiferenciaAg.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);// direrecia de las agencias
        EdTotalCap.Caption := FormatCurr('$#,0.00',VGeneral);
        EdTotalCer.Caption := FormatCurr('$#,0.00',VGeneral);
        EdTotalGen.Caption := FormatCurr('$#,0.00',VGeneral);
        EdTotalCol.Caption := FormatCurr('$#,0.00',VGeneral);
        EdTotalOtr.Caption := FormatCurr('$#,0.00',VGeneral);
        EdTotalCapAg.Caption := FormatCurr('$#,0.00',VGeneral);
end;

procedure TfrmOperacionesCaja.TimerTimer(Sender: TObject);
begin
        EdFecha.Caption := FormatDateTime('yyyy/mm/dd',Date);
        EdHora.Caption := FormatDateTime('hh:nn:ss am/pm',Time);
end;

procedure TfrmOperacionesCaja.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmOperacionesCaja.FormShow(Sender: TObject);
var I:Integer;
    ARecord:TDenominacion;
begin
        Self.Top := -12;
        Self.Left := -16;
        dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        CerosVariables;
        EdFecha.Caption := FormatDateTime('yyyy/mm/dd',Date);
        EdHora.Caption := FormatDateTime('hh:nn:ss am/pm',Time);
{
        with IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$denominaciones" where ACTIVO <> 0 and MONEDAS = 0 order by VALOR DESC');
          try
            ExecQuery;
            while not Eof do
            begin
               I := Length(LDenominacion)+1;
               SetLength(LDenominacion,I);
               ARecord.IdDenominacion := FieldByName('ID_DENOMINACION').AsInteger;
               ARecord.vDenominacion := FieldByName('VALOR').AsCurrency;
               ARecord.Denominacion := TLabel.Create(Self);
               ARecord.Denominacion.Name := 'LbDenomCap'+IntToStr(I);
               ARecord.Denominacion.Caption := Trim(FormatCurr('#,0',FieldByName('VALOR').AsCurrency));
               ARecord.Denominacion.Parent := SBDenominacion;
               ARecord.Denominacion.Left := 5;
               ARecord.Denominacion.Top := 1 + (20 * (I - 1));
               ARecord.Denominacion.Alignment := taRightJustify;
               ARecord.Denominacion.Width := 60;
               ARecord.Denominacion.Font.Style := [fsBold];
               ARecord.Cantidad := TJvIntegerEdit.Create(Self);
               ARecord.Cantidad.Name := 'EdCantidadCap'+IntToStr(I);
               ARecord.Cantidad.OnExit := ValorDenominacion;
               ARecord.Cantidad.Value := 0;
               ARecord.Cantidad.Tag := I-1;
               ARecord.Cantidad.Alignment := taRightJustify;
               ARecord.Cantidad.Parent:= SBDenominacion;
               ARecord.Cantidad.Left := 85;
               ARecord.Cantidad.Top := 1 + (20*(I-1));
               ARecord.Cantidad.Width := 90;
               ARecord.Cantidad.Visible := True;
               ARecord.Cantidad.Font.Style := [fsBold];
               ARecord.Total := TStaticText.Create(self);
               ARecord.Total.Name := 'EdTotalCap'+IntToStr(I);
               ARecord.Total.Caption := '';
               ARecord.Total.Parent := SBDenominacion;
               ARecord.Total.Left := 200;
               ARecord.Total.Top := 1+(20*(I-1));
               ARecord.Total.AutoSize := False;
               ARecord.Total.Width := 126;
               ARecord.Total.Height := 19;
               ARecord.Total.Alignment :=  taRightJustify;
               ARecord.Total.Color := clCaptionText;
               ARecord.Total.BevelInner := bvLowered;
               ARecord.Total.BevelKind := bkSoft;
               ARecord.Total.BevelOuter := bvLowered;
               ARecord.Total.Font.Style := [fsBold];
               LDenominacion[I-1] := ARecord;

               SetLength(LDenominacionCer,I);
               ARecord.IdDenominacion := FieldByName('ID_DENOMINACION').AsInteger;
               ARecord.vDenominacion := FieldByName('VALOR').AsCurrency;
               ARecord.Denominacion := TLabel.Create(Self);
               ARecord.Denominacion.Name := 'LbDenomCer'+IntToStr(I);
               ARecord.Denominacion.Caption := Trim(FormatCurr('#,0',FieldByName('VALOR').AsCurrency));
               ARecord.Denominacion.Parent := SBDenominacionCer;
               ARecord.Denominacion.Left := 5;
               ARecord.Denominacion.Top := 1 + (20 * (I - 1));
               ARecord.Denominacion.Alignment := taRightJustify;
               ARecord.Denominacion.Width := 60;
               ARecord.Denominacion.Font.Style := [fsBold];
               ARecord.Cantidad := TJvIntegerEdit.Create(Self);
               ARecord.Cantidad.Name := 'EdCantidadCer'+IntToStr(I);
               ARecord.Cantidad.OnExit := ValorDenominacionCer;
               ARecord.Cantidad.Value := 0;
               ARecord.Cantidad.Tag := I-1;
               ARecord.Cantidad.Alignment := taRightJustify;
               ARecord.Cantidad.Parent:= SBDenominacionCer;
               ARecord.Cantidad.Left := 85;
               ARecord.Cantidad.Top := 1 + (20*(I-1));
               ARecord.Cantidad.Width := 90;
               ARecord.Cantidad.Visible := True;
               ARecord.Cantidad.Font.Style := [fsBold];
               ARecord.Total := TStaticText.Create(self);
               ARecord.Total.Name := 'EdTotalCer'+IntToStr(I);
               ARecord.Total.Caption := '';
               ARecord.Total.Parent := SBDenominacionCer;
               ARecord.Total.Left := 200;
               ARecord.Total.Top := 1+(20*(I-1));
               ARecord.Total.AutoSize := False;
               ARecord.Total.Width := 126;
               ARecord.Total.Height := 19;
               ARecord.Total.Alignment :=  taRightJustify;
               ARecord.Total.Color := clCaptionText;
               ARecord.Total.BevelInner := bvLowered;
               ARecord.Total.BevelKind := bkSoft;
               ARecord.Total.BevelOuter := bvLowered;
               ARecord.Total.Font.Style := [fsBold];
               LDenominacionCer[I-1] := ARecord;

               SetLength(LDenominacionOtr,I);
               ARecord.IdDenominacion := FieldByName('ID_DENOMINACION').AsInteger;
               ARecord.vDenominacion := FieldByName('VALOR').AsCurrency;
               ARecord.Denominacion := TLabel.Create(Self);
               ARecord.Denominacion.Name := 'LbDenomOtr'+IntToStr(I);
               ARecord.Denominacion.Caption := Trim(FormatCurr('#,0',FieldByName('VALOR').AsCurrency));
               ARecord.Denominacion.Parent := SBDenominacionOtr;
               ARecord.Denominacion.Left := 5;
               ARecord.Denominacion.Top := 1 + (20 * (I - 1));
               ARecord.Denominacion.Alignment := taRightJustify;
               ARecord.Denominacion.Width := 60;
               ARecord.Denominacion.Font.Style := [fsBold];
               ARecord.Cantidad := TJvIntegerEdit.Create(Self);
               ARecord.Cantidad.Name := 'EdCantidadOtr'+IntToStr(I);
               ARecord.Cantidad.OnExit := ValorDenominacionOtr;
               ARecord.Cantidad.Value := 0;
               ARecord.Cantidad.Tag := I-1;
               ARecord.Cantidad.Alignment := taRightJustify;
               ARecord.Cantidad.Parent:= SBDenominacionOtr;
               ARecord.Cantidad.Left := 85;
               ARecord.Cantidad.Top := 1 + (20*(I-1));
               ARecord.Cantidad.Width := 90;
               ARecord.Cantidad.Visible := True;
               ARecord.Cantidad.Font.Style := [fsBold];
               ARecord.Total := TStaticText.Create(self);
               ARecord.Total.Name := 'EdTotalOtr'+IntToStr(I);
               ARecord.Total.Caption := '';
               ARecord.Total.Parent := SBDenominacionOtr;
               ARecord.Total.Left := 200;
               ARecord.Total.Top := 1+(20*(I-1));
               ARecord.Total.AutoSize := False;
               ARecord.Total.Width := 126;
               ARecord.Total.Height := 19;
               ARecord.Total.Alignment :=  taRightJustify;
               ARecord.Total.Color := clCaptionText;
               ARecord.Total.BevelInner := bvLowered;
               ARecord.Total.BevelKind := bkSoft;
               ARecord.Total.BevelOuter := bvLowered;
               ARecord.Total.Font.Style := [fsBold];
               LDenominacionOtr[I-1] := ARecord;


               SetLength(LDenominacionGen,I);
               ARecord.IdDenominacion := FieldByName('ID_DENOMINACION').AsInteger;
               ARecord.vDenominacion := FieldByName('VALOR').AsCurrency;
               ARecord.Denominacion := TLabel.Create(Self);
               ARecord.Denominacion.Name := 'LbDenomGen'+IntToStr(I);
               ARecord.Denominacion.Caption := Trim(FormatCurr('#,0',FieldByName('VALOR').AsCurrency));
               ARecord.Denominacion.Parent := SBDenominacionGen;
               ARecord.Denominacion.Left := 5;
               ARecord.Denominacion.Top := 1 + (20 * (I - 1));
               ARecord.Denominacion.Alignment := taRightJustify;
               ARecord.Denominacion.Width := 60;
               ARecord.Denominacion.Font.Style := [fsBold];
               ARecord.Cantidad := TJvIntegerEdit.Create(Self);
               ARecord.Cantidad.Name := 'EdCantidadGen'+IntToStr(I);
               ARecord.Cantidad.OnExit := ValorDenominacionGen;
               ARecord.Cantidad.Value := 0;
               ARecord.Cantidad.Tag := I-1;
               ARecord.Cantidad.Alignment := taRightJustify;
               ARecord.Cantidad.Parent:= SBDenominacionGen;
               ARecord.Cantidad.Left := 85;
               ARecord.Cantidad.Top := 1 + (20*(I-1));
               ARecord.Cantidad.Width := 90;
               ARecord.Cantidad.Visible := True;
               ARecord.Cantidad.Font.Style := [fsBold];
               ARecord.Total := TStaticText.Create(self);
               ARecord.Total.Name := 'EdTotalGen'+IntToStr(I);
               ARecord.Total.Caption := '';
               ARecord.Total.Parent := SBDenominacionGen;
               ARecord.Total.Left := 200;
               ARecord.Total.Top := 1+(20*(I-1));
               ARecord.Total.AutoSize := False;
               ARecord.Total.Width := 126;
               ARecord.Total.Height := 19;
               ARecord.Total.Alignment :=  taRightJustify;
               ARecord.Total.Color := clCaptionText;
               ARecord.Total.BevelInner := bvLowered;
               ARecord.Total.BevelKind := bkSoft;
               ARecord.Total.BevelOuter := bvLowered;
               ARecord.Total.Font.Style := [fsBold];
               LDenominacionGen[I-1] := ARecord;

               SetLength(LDenominacionCol,I);
               ARecord.IdDenominacion := FieldByName('ID_DENOMINACION').AsInteger;
               ARecord.vDenominacion := FieldByName('VALOR').AsCurrency;
               ARecord.Denominacion := TLabel.Create(Self);
               ARecord.Denominacion.Name := 'LbDenomCol'+IntToStr(I);
               ARecord.Denominacion.Caption := Trim(FormatCurr('#,0',FieldByName('VALOR').AsCurrency));
               ARecord.Denominacion.Parent := SBDenominacionCol;
               ARecord.Denominacion.Left := 5;
               ARecord.Denominacion.Top := 1 + (20 * (I - 1));
               ARecord.Denominacion.Alignment := taRightJustify;
               ARecord.Denominacion.Width := 60;
               ARecord.Denominacion.Font.Style := [fsBold];
               ARecord.Cantidad := TJvIntegerEdit.Create(Self);
               ARecord.Cantidad.Name := 'EdCantidadCol'+IntToStr(I);
               ARecord.Cantidad.OnExit := ValorDenominacionCol;
               ARecord.Cantidad.Value := 0;
               ARecord.Cantidad.Tag := I-1;
               ARecord.Cantidad.Alignment := taRightJustify;
               ARecord.Cantidad.Parent:= SBDenominacionCol;
               ARecord.Cantidad.Left := 85;
               ARecord.Cantidad.Top := 1 + (20*(I-1));
               ARecord.Cantidad.Width := 80;
               ARecord.Cantidad.Visible := True;
               ARecord.Cantidad.Font.Style := [fsBold];
               ARecord.Total := TStaticText.Create(self);
               ARecord.Total.Name := 'EdTotalCol'+IntToStr(I);
               ARecord.Total.Caption := '';
               ARecord.Total.Parent := SBDenominacionCol;
               ARecord.Total.Left := 180;
               ARecord.Total.Top := 1+(20*(I-1));
               ARecord.Total.AutoSize := False;
               ARecord.Total.Width := 126;
               ARecord.Total.Height := 19;
               ARecord.Total.Alignment :=  taRightJustify;
               ARecord.Total.Color := clCaptionText;
               ARecord.Total.BevelInner := bvLowered;
               ARecord.Total.BevelKind := bkSoft;
               ARecord.Total.BevelOuter := bvLowered;
               ARecord.Total.Font.Style := [fsBold];
               LDenominacionCol[I-1] := ARecord;

               Next;
            end;
          except
          end;
        end;
        }


        PageControl1.ActivePage := TabProductos;
        EdOpcion.SetFocus;
        Opcion := 1;
        PanelValores.Enabled := False;
end;

procedure TfrmOperacionesCaja.EdDocumentoCapKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmOperacionesCaja.EdNumeroCapKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmOperacionesCaja.CmdAportesClick(Sender: TObject);
begin
        OrigenM := 1;
        TipoCaptacion := 1;
        Opcion := 2;
        GBOperaciones.Caption := 'Aportes';
        Caption := 'Operaciones de Caja - APORTES';
        PageControl1.ActivePage := TabCaptaciones;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdOrdinarioClick(Sender: TObject);
begin
        OrigenM := 2;
        TipoCaptacion := 2;
        Opcion := 2;
        GBOperaciones.Caption := 'Ordinario';
        Caption := 'Operaciones de Caja - AHORRO ORDINARIO';        
        PageControl1.ActivePage := TabCaptaciones;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdRindediarioClick(Sender: TObject);
begin
        OrigenM := 3;
        TipoCaptacion := 3;
        Opcion := 2;
        GBOperaciones.Caption := 'Diario';
        Caption := 'Operaciones de Caja - AHORRO RINDEDIARIO';        
        PageControl1.ActivePage := TabCaptaciones;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdJuvenilClick(Sender: TObject);
begin
        OrigenM := 4;
        TipoCaptacion := 4;
        Opcion := 2;
        GBOperaciones.Caption := 'Juvenil';
        Caption := 'Operaciones de Caja - AHORRO JUVENIL';
        PageControl1.ActivePage := TabCaptaciones;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdContractualClick(Sender: TObject);
begin
        OrigenM := 5;
        TipoCaptacion := 5;
        Opcion := 2;
        GBOperaciones.Caption := 'Contractual';
        Caption := 'Operaciones de Caja - AHORRO CONTRACTUAL';        
        PageControl1.ActivePage := TabCaptaciones;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdCapConClick(Sender: TObject);
begin
        CapOperacion := 'C';
        ChkAutorizado.Enabled := False;
        ChkAutorizado.Checked := False;
        LAutorizado.Enabled := False;
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBOperaciones.Enabled := False;
        CmdOKCaptacion.Caption := '&Consignar';
        CmdOKCaptacion.Enabled := True;
        EdEstadoActualCap.Caption := 'En Consignación';
        case OrigenM of
         2: EdEstadoActualCap.Color := clBlue;
         1: EdEstadoActualCap.Color := clPurple;
         4: EdEstadoActualCap.Color := clFuchsia;
         else
            EdEstadoActualCap.Color := clInactiveCaption;
        end;
        CmdVerCheques.Enabled := True;
        EdDevolucionCap.Enabled := True;
        CmdVerDevolucion.Enabled := True;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionCaptacion;
        PageControl.Visible := True;
        EdNumeroCap.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdRetornarClick(Sender: TObject);
begin
        if CapOperacion = 'B' then
         if dmGeneral.IBTransaction1.InTransaction then
          begin
             dmGeneral.IBTransaction1.Rollback;
             dmGeneral.IBTransaction1.StartTransaction;
          end;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        CerosVariables;
        LimpiarCaptacion;
        CmdRetornar.Enabled := False;
        PageControl.Visible := False;
        GBOperaciones.Enabled := True;
        GBCdats.Enabled := True;
        GBColocaciones.Enabled := True;
        GBOtros.Enabled := True;
        GBGenerales.Enabled := True;
        GBAsociadoCol.Enabled := True;
        VOopcion;
end;

procedure TfrmOperacionesCaja.TabCaptacionesEnter(Sender: TObject);
begin
        GBOperaciones.SetFocus;
        GBProductos.Enabled := False;
end;

procedure TfrmOperacionesCaja.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmOperacionesCaja.EdOpcionKeyPress(Sender: TObject;
  var Key: Char);

begin
        NumericoSinPunto(Sender,Key);

end;


procedure TfrmOperacionesCaja.EdOpcionEnter(Sender: TObject);
begin
        EdOpcion.SelectAll;
end;

procedure TfrmOperacionesCaja.EdOpcionChange(Sender: TObject);
begin
        if EdOpcion.Text <> '' then
        if StrToInt(EdOpcion.EditText) in [0..9] then
        case Opcion of  // Estando en Productos
        1: case StrToInt(EdOpcion.Text) of
           1: CmdAportes.Click;
           2: CmdOrdinario.Click;
           3: CmdRindediario.Click;
           4: CmdJuvenil.Click;
           5: CmdContractual.Click;
           6: CmdCdat.Click;
           7: CmdCartera.Click;
           8: CmdOtros.Click;
           9: CmdGenerales.Click;
           0: begin
                if ValidaHoraCaja.Estado then
                   CmdAgencias.Click
               else
               begin
                 if ValidaHoraCaja.Hora <> 0 then
                    MessageDlg('las Operaciones entre Sucursales los dias ' + FormatDateTime('dddd',fFechaActual) + #13 + '   Solo se Permiten Antes de las : ' + FormatDateTime('hh:mm:ss AM/PM',validahoracaja.Hora),mtInformation,[mbok],0)
                 else
                    MessageDlg('El Dia ' + FormatDateTime('dddd',fFechaActual) + ' No Hay Servicio Entre Sucursales',mtInformation,[mbok],0)
               end;
              end;
           end;
        2: case StrToInt(EdOpcion.Text) of // Estando en Captaciones
           1: CmdCapCon.Click;
           2: CmdCapRet.Click;
           3: CmdCapSalir.Click;
           end;
        3: case StrToInt(EdOpcion.Text) of // Estando en Certificados
           1: CmdIngresarCDAT.Click;
           2: CmdSaldarCDAT.Click;
           3: CmdRetornarCDAT.Click;
           end;
        4: case StrToInt(EdOpcion.Text) of // Estando en Colocaciones
           1: CmdColAbono.Click;
           2: CmdColManual.Click;
           3: CmdColCastigada.Click;
           4: CmdColCostas.Click;
           5: CmdColRetornar.Click;
           end;
        5: case StrToInt(EdOpcion.Text) of // Estando en Servicios
           1: CmdSerAgua.Click;
           2: CmdSerMunicipal.Click;
           3: CmdSerRetornar.Click;
           end;
        6: case StrToInt(EdOpcion.Text) of // Estando en Generales
           1: CmdOtrosIngresar.Click;
           2: CmdOtrosRetirar.Click;
           3: CmdOtrosRetornar.Click;
           end;
        7: case StrToInt(EdOpcion.Text) of // Estando en Agencias
           1: CmdApotesAg.Click;
           2: CmdOrdinarioAg.Click;
           3: CmdRindediarioAg.Click;
           4: CmdJuvenilAg.Click;
           5: CmdRetornarAg.Click;
           end;
        8: case StrToInt(EdOpcion.Text) of // Estando en operaciones de Agencias
           1: CmdAgenciaCon.Click;
           2: CmdAgenciaRet.Click;
           3: CmdAgenciaSalir.Click;
           end;
        end;
        EdOpcion.SelectAll;
end;

procedure TfrmOperacionesCaja.VOopcion;
begin
        dmGeneral.IBTransaction1.Commit;
        dmgeneral.IBTransaction1.StartTransaction;
        CerosVariables;
        CmdOKCaptacion.Enabled := True;
        CmdOKCertificado.Enabled := True;
        CmdOKGenerales.Enabled := True;
        CmdOKColocacion.Enabled := True;
        CmdAbonar.Enabled := True;
        CmdRecaudarManual.Enabled := True;
        CmdRecaudarManual.Visible := False;
        CmdReversarManual.Visible := False;
        CmdRecaudarCas.Visible := False;
        CmdReversarCas.Visible :=False;
        CmdAceptarCas.Visible := False;
        CmdRecaudarCas.Enabled := False;
        CmdInformeCas.Enabled := False;
        Label21.Visible := not Label21.Visible;
        EdOpcion.Visible := not EdOpcion.Visible;
        if EdOpcion.Visible then
        begin
         EdOpcion.SelectAll;
         EdOpcion.SetFocus;
        end;
end;

function TfrmOperacionesCaja.ValidarCaja: Boolean;
begin
         Result := False;
         if dmGeneral.IBTransaction1.InTransaction then
         begin
            dmGeneral.IBTransaction1.Commit;
         end;
         with IBConsulta do
         begin
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"caj$cajas".ID_CAJA,');
           SQL.Add('"caj$cajas".HORA_INICIO,');
           SQL.Add('"caj$cajas".HORA_FINAL,');
           SQL.Add('"caj$cajas".SERVICAJA,');
           SQL.Add('"caj$estados".PERMITE_MOVIMIENTO,');
           SQL.Add('"caj$cierres".ESTADO,');
           SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
           SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$empleado".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('"caj$cajas"');
           SQL.Add('INNER JOIN "caj$estados" ON ("caj$cajas".ID_ESTADO_CAJA = "caj$estados".ID_ESTADO)');
           SQL.Add('INNER JOIN "caj$cierres" ON ("caj$cierres".ID_CAJA = "caj$cajas".ID_CAJA)');
           SQL.Add('INNER JOIN "gen$empleado" ON ("caj$cajas".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('where "caj$cajas".ID_EMPLEADO = :ID_EMPLEADO and "caj$cierres".FECHA = :FECHA and "caj$cierres".ESTADO = 0');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ParamByName('FECHA').AsDate := Date;
           try
            ExecQuery;
            if RecordCount > 0 then
            begin
               if (FieldByName('PERMITE_MOVIMIENTO').AsInteger = 0)  then
               begin
                  Result := False;
                  Exit;
               end;
               if ( FieldByName('HORA_INICIO').AsTime > Time ) or
                  ( FieldByName('HORA_FINAL').AsTime < Time ) then
               begin
                  Result := False;
                  Exit;
               end;
               if (FieldByName('ESTADO').AsInteger = 0) then
               begin
                EdCaja.Caption := IntToStr(FieldByName('ID_CAJA').AsInteger);
                EdUsuario.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                    FieldByName('NOMBRE').AsString;
                Es_ServiCaja := InttoBoolean(FieldByName('SERVICAJA').asInteger);
               end;
            end
            else
            begin
              Result := False;
              Close;
              Exit;
            end;
           except
              Result := False;
              Exit;
           end;
         end;
         Result := True;
end;

procedure TfrmOperacionesCaja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        ListaDevolucion.Free;
        ListaCheques.Free;
        Action := caFree;
end;

procedure TfrmOperacionesCaja.EdNumeroCapExit(Sender: TObject);
var NumeroS:string;
    Numero:Integer;
    Digito:Integer;
    EsDeMovimiento:Boolean;
    Fecha1,Fecha2:TDate;
    Total:Integer;
    FechaFin :TDate;
begin

        Fecha1 := EncodeDate(YearOf(Date),MonthOf(Date),01);
        Fecha2 := EncodeDate(YearOf(Date),MonthOf(Date),DaysInMonth(Date));


        if EdNumeroCap.Text  <> '' then
        begin
         EdNumeroCap.Text := Format('%.7d',[StrToInt(EdNumeroCap.Text)]);
         NumeroS := Format('%.7d',[StrToInt(EdNumeroCap.Text)]);
         Numero := StrToInt(EdNumeroCap.Text);
         Digito := StrToInt(DigitoControl(TipoCaptacion,NumeroS));
         EdDigitoCap.Caption := IntToStr(Digito);
         with IBConsulta do
         begin
                Transaction.CommitRetaining;
                Close;
                SQL.Clear;
                SQL.Add('SELECT');
                SQL.Add('"cap$maestro".ID_ESTADO,');
                SQL.Add('"cap$tiposestado".DESCRIPCION,');
                SQL.Add('"cap$tiposestado".PERMITE_MOVIMIENTO,');
                SQL.Add('"cap$tiposestado".PERMITE_MOVIMIENTO_ENTRADA,');
                SQL.Add('"cap$tiposestado".PARA_SALDAR,');
                SQL.Add('"cap$maestro".CUOTA,');
                SQL.Add('"cap$maestro".FIRMAS,');
                SQL.Add('"cap$maestro".SELLOS,');
                SQL.Add('"cap$maestro".PROTECTOGRAFOS,');
                SQL.Add('"cap$libretas".NUMERO_INICIAL,');
                SQL.Add('"cap$libretas".NUMERO_FINAL');
                SQL.Add('FROM');
                SQL.Add('"cap$maestro"');
                SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                SQL.Add('LEFT JOIN "cap$libretas" ON ("cap$maestro".ID_AGENCIA = "cap$libretas".ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$libretas".ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$libretas".NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
                SQL.Add('WHERE');
                SQL.Add('("cap$maestro".ID_AGENCIA = :ID_AGENCIA) AND');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND');
                SQL.Add('("cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA)');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                  ExecQuery;
                  if RecordCount < 1 then
                  begin
                    MessageDlg('Captación No Exite',mtError,[mbcancel],0);
                    EdNumeroCap.SelectAll;
                    EdNumeroCap.SetFocus;
                    Exit;
                  end;
                  ParaSaldar := FieldByName('PARA_SALDAR').AsInteger;
                  EstadoAct := FieldByName('ID_ESTADO').AsInteger;
                  if CapOperacion = 'C' then
                    EsDeMovimiento := InttoBoolean(FieldByName('PERMITE_MOVIMIENTO_ENTRADA').AsInteger)
                  else
                    EsDeMovimiento := InttoBoolean(FieldByName('PERMITE_MOVIMIENTO').AsInteger);
                  EdEstadoCap.Caption := FieldByName('DESCRIPCION').AsString;
                  ValorCuotaCon := FieldByName('CUOTA').AsCurrency;
                  EdFirmas.Caption := IntToStr(FieldByName('FIRMAS').AsInteger);
                  EdSellos.Caption := IntToStr(FieldByName('SELLOS').AsInteger);
                  EdProtectografos.Caption := IntToStr(FieldByName('PROTECTOGRAFOS').AsInteger);
                  if not EsDeMovimiento then
                  begin
                     MessageDlg('Esta Captación No Se Puede Trabajar',mtError,[mbcancel],0);
                     EdNumeroCap.SelectAll;
                     EdNumeroCap.SetFocus;
                     Exit;
                  end;
                  EdRangoIni.Caption := Format('%.8d',[FieldByName('NUMERO_INICIAL').AsInteger]);
                  EdRangoFin.Caption := Format('%.8d',[FieldByName('NUMERO_FINAL').AsInteger]);
                except
                  MessageDlg('Error Buscando la Captación',mtError,[mbcancel],0);
                  EdNumeroCap.SelectAll;
                  EdNumeroCap.SetFocus;
                  Exit;
                end;

                IBTitulares.Close;
                IBTitulares.SQL.Clear;
                IBTitulares.SQL.Add('select "gen$persona".ID_IDENTIFICACION,"gen$persona".ID_PERSONA,');
                IBTitulares.SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE,"cap$maestrotitular".NUMERO_TITULAR');
                IBTitulares.SQL.Add('from "cap$maestro"');
                IBTitulares.SQL.Add('LEFT JOIN "cap$maestrotitular" ON ');
                IBTitulares.SQL.Add('("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ');
                IBTitulares.SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
                IBTitulares.SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ');
                IBTitulares.SQL.Add('("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
                IBTitulares.SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
                IBTitulares.SQL.Add('("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
                IBTitulares.SQL.Add('where');
                IBTitulares.SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                IBTitulares.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBTitulares.SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBTitulares.SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
                IBTitulares.SQL.Add('ORDER BY "cap$maestrotitular".NUMERO_TITULAR');
                IBTitulares.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBTitulares.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                IBTitulares.ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                IBTitulares.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                 IBTitulares.Open;
                 while not IBTitulares.Eof do
                 begin
                    if IBTitulares.FieldByName('NUMERO_TITULAR').AsInteger = 1 then begin
                      Id := IBTitulares.FieldByName('ID_IDENTIFICACION').AsInteger;
                      Identificacion := IBTitulares.FieldByName('ID_PERSONA').AsString;
                    end;
                    CBTitulares.Items.Add(IntToStr(IBTitulares.FieldByName('ID_IDENTIFICACION').AsInteger) + '-' +
                                                   IBTitulares.FieldByName('ID_PERSONA').AsString + '   ' +
                                                   IBTitulares.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                   IBTitulares.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                   IBTitulares.FieldByName('NOMBRE').AsString);
                    IBTitulares.Next;
                 end;
                 CBTitulares.ItemIndex := 0;
                except
                 MessageDlg('Error Localizando los Titulares',mtError,[mbcancel],0);
                 EdNumeroCap.SelectAll;
                 EdNumeroCap.SetFocus;
                 Exit;
                end;


                Close;

// Consultar saldo actual
                SQL.Clear;
                SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                ParamByName('AG').AsInteger := Agencia;
                ParamByName('TP').AsInteger := TipoCaptacion;
                ParamByName('CTA').AsInteger := Numero;
                ParamByName('DGT').AsInteger := Digito;
                ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
                ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
                try
                  ExecQuery;
                  if RecordCount < 1 then
                   Saldo := 0
                  else
                   Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
                except
                   MessageDlg('Error Consultando Saldo',mtError,[mbcancel],0);
                   EdNumeroCap.SetFocus;
                   Exit;
                end;

// Consultar saldo disponible
                Close;
                SQL.Clear;
                SQL.Add('select SALDO_DISPONIBLE from SALDO_DISPONIBLE(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                ParamByName('AG').AsInteger := Agencia;
                ParamByName('TP').AsInteger := TipoCaptacion;
                ParamByName('CTA').AsInteger := Numero;
                ParamByName('DGT').AsInteger := Digito;
                ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
                ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
                try
                  ExecQuery;
                  if RecordCount < 1 then
                   Disponible := 0
                  else
                   Disponible := FieldByName('SALDO_DISPONIBLE').AsCurrency;
                except
                   MessageDlg('Error Consultando Saldo',mtError,[mbcancel],0);
                   EdNumeroCap.SetFocus;
                   Exit;
                end;

// Consulta de Canje

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
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito;
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

                Close;
                SQL.Clear;
                SQL.Add('select SALDO_MINIMO from "cap$tipocaptacion"');
                SQL.Add('where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                try
                  ExecQuery;
                  Minimo := FieldByName('SALDO_MINIMO').AsCurrency;
                except
                  MessageDlg('Error Consultando Minimo',mtError,[mbcancel],0);
                  Minimo := 0;
                end;
                // Inicio de la validacion del Contractual
                if OrigenM = 5 then
                begin
                  vCuotasC := ValidaCon(Numero,5,Digito);
                  if vCuotasContractual >= 3 then
                  begin
                    MessageDlg('Posee Tres o Más Cuotas Vencidas, Favor Comunicar a la Sección de Ahorros',mtWarning,[mbok],0);
                     EdNumeroCap.SelectAll;
                     EdNumeroCap.SetFocus;
                     Exit;
                  end;
                  EdChequesCap.Enabled := False;
                  FechaFin := EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DaysInMonth(fFechaActual));
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT FIRST 1 FECHA_DESCUENTO,COUNT(FECHA_DESCUENTO) AS CONTADOR FROM "cap$tablaliquidacioncon" WHERE');
                  SQL.Add('"cap$tablaliquidacioncon".ID_AGENCIA = :ID_AGENCIA and');
                  SQL.Add('"cap$tablaliquidacioncon".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                  SQL.Add('"cap$tablaliquidacioncon".NUMERO_CUENTA = :NUMERO_CUENTA and');
                  SQL.Add('"cap$tablaliquidacioncon".DIGITO_CUENTA = :DIGITO_CUENTA and');
                  SQL.Add('"cap$tablaliquidacioncon".DESCONTADO = 0');
                  SQL.Add('GROUP BY FECHA_DESCUENTO ORDER BY FECHA_DESCUENTO');
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                  ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                  ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                  try
                    ExecQuery;
                  vFechaDecuento := FieldByName('FECHA_DESCUENTO').AsDate;
                  //ShowMessage(DateToStr(vFechaDecuento) + ' ' + DateToStr(FechaFin));
                  if FieldByName('CONTADOR').AsInteger = 0 then
                  begin
                     MessageDlg('Ya Cumplio el Total de las Cuotas. Favor Confirmar con la Sección de Ahorros',mtWarning,[mbok],0);
                     EdNumeroCap.SelectAll;
                     EdNumeroCap.SetFocus;
                     Exit;
                  end
                  else if vFechaDecuento > FechaFin then
                  begin
                     MessageDlg('La Cuota del Mes ya se Encuentra Cancelada. Favor Confirmar con la Sección de Ahorros',mtWarning,[mbok],0);
                     EdNumeroCap.SelectAll;
                     EdNumeroCap.SetFocus;
                     Exit;
                  end;
                  if vFechaDecuento <= fFechaActual  then
                     vDiasContractual  := DaysBetween(vFechaDecuento,fFechaActual)
                  else
                     vDiasContractual  := 0;
                  ShowMessage(IntToStr(vDiasContractual));
                  {Close;
                  SQL.Clear;
                  SQL.Add('    SELECT COUNT(*) AS TOTAL FROM "cap$extracto" WHERE');
                  SQL.Add('    "cap$extracto".ID_AGENCIA = :ID_AGENCIA and');
                  SQL.Add('    "cap$extracto".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                  SQL.Add('    "cap$extracto".NUMERO_CUENTA = :NUMERO_CUENTA and');
                  SQL.Add('    "cap$extracto".DIGITO_CUENTA = :DIGITO_CUENTA and');
                  SQL.Add('    "cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                  ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                  ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                  ParamByName('FECHA1').AsDate := Fecha1;
                  parambyname('FECHA2').AsDate := Fecha2;
                  try
                   ExecQuery;
                   Total := FieldByName('TOTAL').AsInteger;
                   if Total > 0 then
                   begin
                     MessageDlg('Cuota del Mes ya Descontada',mtError,[mbcancel],0);
                     EdNumeroCap.SelectAll;
                     EdNumeroCap.SetFocus;
                     Exit;
                   end; }
                  except
                     MessageDlg('Error consultando descuentos',mtError,[mbcancel],0);
                     EdNumeroCap.SelectAll;
                     EdNumeroCap.SetFocus;
                     Exit;
                  end;
                end;// fin validacion del contractual


         end;

         if (EstadoAct = 5) or (EstadoAct = 8) then
           Disponible := Disponible + Minimo;
         if Saldo < 0 then Saldo := 0;
         EdSaldoCap.Caption := FormatCurr('$#,0.00',Saldo);
         EdCanjeCap.Caption := FormatCurr('$#,0.00',Canje);
         EdDisponibleCap.Caption := FormatCurr('$#,0.00',Disponible);
        end;
end;

procedure TfrmOperacionesCaja.CmdCapSalirClick(Sender: TObject);
begin
        Opcion := 1;
        PageControl1.ActivePage := TabProductos;

end;

procedure TfrmOperacionesCaja.CmdCapRetClick(Sender: TObject);
begin
        CapOperacion := 'R';
        ChkAutorizado.Enabled := True;
        ChkAutorizado.Checked := False;
        LAutorizado.Enabled := True;
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBOperaciones.Enabled := False;
        CmdOKCaptacion.Caption := '&Retirar';
        CmdOKCaptacion.Enabled := True;
        EdEstadoActualCap.Caption := 'En Retiro';
        case OrigenM of
         2: EdEstadoActualCap.Color := clRed;
         1: EdEstadoActualCap.Color := clGreen;
         4: EdEstadoActualCap.Color := clTeal;
         else
            EdEstadoActualCap.Color := clBlack;
        end;
        CmdVerCheques.Enabled := False;
        EdDevolucionCap.Enabled := False;
        CmdVerDevolucion.Enabled := False;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionCaptacion;
        PageControl.Visible := True;
        EdNumeroCap.SetFocus;

end;

procedure TfrmOperacionesCaja.EdNumeroCapEnter(Sender: TObject);
begin
        EdNumeroCap.SelectAll;
end;

procedure TfrmOperacionesCaja.EdDocumentoCapExit(Sender: TObject);
begin
       if EdDocumentoCap.Text <> '' then
       begin
          EdDocumentoCap.Text := Format('%.8d',[StrToInt(EdDocumentoCap.Text)]);
          Libreta := StrToInt(EdDocumentoCap.Text);
          if ValidarLibreta then
          begin
            PanelValores.Enabled := True;
            EdTotalBilletesCap.SetFocus;
          end
          else
           EdDocumentoCap.SetFocus;
       end
       else
          Mensaje.Caption := 'Debe diligenciar el número de documento';
//          MessageDlg('Debe diligenciar el número de documento',mtError,[mbcancel],0);
end;

procedure TfrmOperacionesCaja.RealizarConsignacion;
begin
        if EdChequesCap.Value <> 0 then
          if ListaCheques.Count = 0 then
          begin
            MessageDlg('Debe diligenciar la relación de cheques',mtError,[mbcancel],0);
            CmdVerCheques.Click;
          end;

        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara la consignación',mtInformation,[mbok],0);
           EdChequesCap.SetFocus;
           Exit;
        end;

        Timer.Enabled := False;

        if GrabarConsignacion then
        begin
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := StrToDate(EdFecha.Caption);
               FValidar.Caja := StrToInt(EdCaja.Caption);
               FValidar.Origen := OrigenM;
               FValidar.Tipo := TipoCaptacion;
               FValidar.Operacion := 1;
               FValidar.Agencia := Agencia;
               FValidar.Cuenta := StrToInt(EdNumeroCap.Text);
               FValidar.Documento := StrToInt(EdDocumentoCap.Text);
               FValidar.Billetes := TBilletes;
               FValidar.Monedas := TMonedas;
               FValidar.Cheques := TCheques;
               Validar := FValidar;
               ShowModal;
               Free;
           end;

           MessageDlg('Consignación Realizada con Exito!',mtInformation,[mbok],0);
        end
        else
           MessageDlg('Error al Realizar la Consignación, consulte con sistemas',mtError,[mbcancel],0);


//      if es Juvenil, validar para entrega de detalle.
        if TipoCaptacion = 4 then ValidarEntregaDetalle;
//


        Timer.Enabled := True;

        CmdRetornar.Click;

end;

procedure TfrmOperacionesCaja.RealizarRetiro;
var TopeTotalOp:Integer;
    TopeValorOp:Currency;
    TotalOp:Integer;
    ValorOp:Currency;
    TopeTotalOpS:Integer;
    TopeValorOpS:Currency;
    TotalOpS:Integer;
    ValorOpS:Currency;
    ServiCaja:Boolean;
    Dia:Integer;
    Hora:TTime;
    MinVisado:Currency;
    frmVisacionRetirosCaja:TfrmVisacionRetirosCaja;
    Resultado:Integer;
begin
       if TGeneral > SaldoEnCaja then
         begin
            MessageDlg('No Tiene Disponibilidad para esta salida' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            CmdOKCaptacion.Enabled := True;
            EdChequesCap.SetFocus;
            Exit;
         end;

        if (TGeneral > Disponible) and (TGeneral <> Saldo) and (Disponible > 0) then
         begin
            MessageDlg('No Tiene Disponibilidad para este retiro' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            CmdOKCaptacion.Enabled := True;
            EdChequesCap.SetFocus;
            Exit;
         end;

        if (TGeneral > Disponible) and (TGeneral = Saldo) and (EstadoAct <> 5) and (EstadoAct <> 8) then
         begin
            MessageDlg('No Tiene Disponibilidad para este retiro' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            CmdOKCaptacion.Enabled := True;
            EdChequesCap.SetFocus;
            Exit;
         end;

        if (TGeneral <> Saldo) and ((EstadoAct = 5) or (EstadoAct = 8)) then
         begin
            MessageDlg('No Tiene Disponibilidad para este retiro' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            CmdOKCaptacion.Enabled := True;
            EdChequesCap.SetFocus;
            Exit;
         end;


        if TGeneral = 0 then
        begin
           MessageDlg('No se registrara ningún retiro',mtInformation,[mbok],0);
           CmdOKCaptacion.Enabled := True;           
           EdChequesCap.SetFocus;
           Exit;
        end;

        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('Select * from "cap$tipocaptacion"');
         SQL.Add('where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
         ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
         try
           ExecQuery;
           if RecordCount < 1 then
           begin
             MessageDlg('El tipo de captación no existe, Consulte con sistemas'+#13+
                        'Operación no registrada',mtError,[mbcancel],0);
             Exit;
           end;
         except
           MessageDlg('Error al Buscar Tipo de Captación',mtError,[mbcancel],0);
           Exit;
         end;
         if (FieldByName('RETIRO_PARCIAL').AsInteger = 0) and
            (TGeneral <> Saldo) then begin
            MessageDlg('Este tipo de captación, no permite retiros parciales'+#13+
                       'Por Favor verifique su operación',mtError,[mbcancel],0);
            EdChequesCap.SetFocus;
            CmdOKCaptacion.Enabled := True;
            Exit;
         end;
        end;

// Autorizados
       if ChkAutorizado.Checked then begin

         Dia := DayOfWeek(StrToDate(EdFecha.Caption));
         Hora := StrToTime(EdHora.Caption);

         IBSQL1.Close;
         IBSQL1.SQL.Clear;
         IBSQL1.SQL.Add('select * from "caj$horarioservicaja" where DIA = :DIA and');
         IBSQL1.SQL.Add(':HORA BETWEEN HORA_INICIAL and HORA_FINAL');
         IBSQL1.ParamByName('DIA').AsInteger := Dia;
         IBSQL1.ParamByName('HORA').AsTime := Hora;
         try
           IBSQL1.ExecQuery;
           if (Es_ServiCaja) and (IBSQL1.RecordCount > 0) then
                 ServiCaja := True
           else
                 ServiCaja := False;
         except
             IBSQL1.Transaction.RollbackRetaining;
             raise;
             Exit;
         end;

// Leer topes de Autorizados
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "caj$maxautorizado" where SERVICAJA = 0');
          try
            ExecQuery;
            if RecordCount > 0 then begin
               TopeTotalOp := FieldByName('CANTIDAD').AsInteger;
               TopeValorOp := FieldByName('VALOR').AsCurrency;
            end
            else
            begin
               TopeTotalOp := 2;
               TopeValorOp := 5340000;
            end;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "caj$maxautorizado" where SERVICAJA = 1');
          try
            ExecQuery;
            if RecordCount > 0 then begin
               TopeTotalOpS := FieldByName('CANTIDAD').AsInteger;
               TopeValorOpS := FieldByName('VALOR').AsCurrency;
            end
            else
            begin
               TopeTotalOpS := 2;
               TopeValorOpS := 2670000;
            end;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

// Validar Retiros Autorizados
  // Leer cantidad de retiros
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select COUNT(*) as TOTAL from "caj$retiroautorizado"');
         SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and FECHA_MOV = :FECHA_MOV');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
         ParamByName('FECHA_MOV').AsDateTime := StrToDate(EdFecha.Caption);
         try
           ExecQuery;
           if RecordCount > 0 then begin
              TotalOp := FieldByName('TOTAL').AsInteger;
              TotalOpS := FieldByName('TOTAL').AsInteger;
           end
           else
           begin
              TotalOp  := 0;
              TotalOpS := 0;
           end;
         except
           Transaction.Rollback;
           raise;
         end;
        end;

        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select SUM(EFECTIVO) AS VALOR from "caj$retiroautorizado"');
         SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and FECHA_MOV = :FECHA_MOV ');
         if Es_Servicaja then
           SQL.Add('and SERVICAJA <> 0')
         else
            SQL.Add('and SERVICAJA = 0');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
         ParamByName('FECHA_MOV').AsDateTime := StrToDate(EdFecha.Caption);
         try
           ExecQuery;
           if RecordCount > 0 then begin
              ValorOp := FieldByName('VALOR').AsCurrency;
              ValorOpS := FieldByName('VALOR').AsCurrency;
           end
           else
           begin
              ValorOp := 0;
              ValorOpS := 0;
           end;
         except
           Transaction.Rollback;
           raise;
         end;
        end;


// Validar Retiro Máximo Caja Normal
       if not Servicaja then begin
         if TGeneral > TopeValorOp then begin
            MessageDlg('Un autorizado no puede retirar esa cantidad',mtError,[mbcancel],0);
            Exit;
         end;

         if (TotalOp + 1) > TopeTotalOp then begin
            MessageDlg('Ya se realizaron el máximo de operaciones para autorizados, no puede retirar',mtError,[mbcancel],0);
            Exit;
         end;

         if ValorOp >= (TopeTotalOp * TopeValorOp) then begin
            MessageDlg('Ya se realizaron el máximo de operaciones para autorizados, no puede retirar',mtError,[mbcancel],0);
            Exit;
         end;

         if (ValorOp + TGeneral) > (TopeTotalOp * TopeValorOp) then begin
            MessageDlg('No puede retirar esa cantidad como autorizado',mtError,[mbcancel],0);
            Exit;
         end;
        end
       else
       begin
         if TGeneral > (TopeTotalOpS * TopeValorOpS) then begin
            MessageDlg('Un autorizado no puede retirar esa cantidad',mtError,[mbcancel],0);
            Exit;
         end;

         if (TotalOp + 1) > TopeTotalOpS then begin
            MessageDlg('Ya se realizaron el máximo de operaciones para autorizados, no puede retirar',mtError,[mbcancel],0);
            Exit;
         end;

         if ValorOpS >= (TopeTotalOpS * TopeValorOpS) then begin
            MessageDlg('Ya se realizaron el máximo de operaciones para autorizados, no puede retirar',mtError,[mbcancel],0);
            Exit;
         end;

         if (ValorOpS + TGeneral) > (TopeTotalOpS * TopeValorOpS) then begin
            MessageDlg('No puede retirar esa cantidad como autorizado',mtError,[mbcancel],0);
            Exit;
         end;
       end;
// Fin Validación Retiros Autorizados
       end;
// Fin Autorizados

// Validar Visación de Retiro
// Verificar si el monto necesita de visación
        with IBSQL3 do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select MIN_VISACION from "caj$minvisacion" where ID_MINVISACION = :ID_MINVISACION');
           if Es_ServiCaja then
              ParamByName('ID_MINVISACION').AsInteger := 2
           else
              ParamByName('ID_MINVISACION').AsInteger := 1;
           try
            ExecQuery;
            MinVisado := FieldByName('MIN_VISACION').AsCurrency;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

        if TGeneral >= MinVisado then
        begin
// Fin Verificación
{ TODO 5 -oAlex -cCajas - Tesoreria : Incluir aqui proceso de solicitud de visación de retiro }
         frmVisacionRetirosCaja := TfrmVisacionRetirosCaja.Create(Self);
         with frmVisacionRetirosCaja do
         begin
            IdCaja := StrToInt(EdCaja.Caption);
            IdAgencia := Agencia;
            IdTipoCaptacion := TipoCaptacion;
            NumeroCuenta := StrToInt(EdNumeroCap.Text);
            DigitoCuenta := StrToInt(EdDigitoCap.Caption);
            NumeroTalon  := StrToInt(EdDocumentoCap.Text);
            ValorRetiro  := TGeneral;
            Resultado := ShowModal;
            if Resultado = mrAbort then
            begin
              MessageDlg('El retiro fue anulado',mtInformation,[mbOk],0);
              Exit;
            end;
            if Resultado = mrCancel then Exit;
         end;
         frmVisacionRetirosCaja.Free;
        end;
// Fin Validación Visación de Retiro

        Timer.Enabled := False;

        if GrabarRetiro then
        begin
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := StrToDate(EdFecha.Caption);
               FValidar.Caja := StrToInt(EdCaja.Caption);
               FValidar.Origen := OrigenM;
               FValidar.Tipo := TipoCaptacion;
               FValidar.Operacion := 2;
               FValidar.Agencia := Agencia;
               FValidar.Cuenta := StrToInt(EdNumeroCap.Text);
               FValidar.Documento := StrToInt(EdDocumentoCap.Text);
               FValidar.Billetes := TBilletes;
               FValidar.Monedas := TMonedas;
               FValidar.Cheques := TCheques;
               Validar := FValidar;
               ShowModal;
               Free;
           end;
           MessageDlg('Retiro Realizado con Exito!',mtInformation,[mbok],0)
         end
        else
           MessageDlg('Error al Realizar el Retiro, consulte con sistemas',mtError,[mbcancel],0);

        Timer.Enabled := True;

        CmdRetornar.Click;

end;

procedure TfrmOperacionesCaja.ValorDenominacion(Sender: TObject);
var Valor:Currency;
    Pos:Integer;
    I:Integer;
begin
       Pos := TJvIntegerEdit(Sender).Tag;
{       if CapOperacion = 'R' then
        if LDenominacion[Pos].Existencia < TJvIntegerEdit(Sender).Value then
        begin
         MessageDlg('Esta caja no tiene esa cantidad de billetes de ' + LDenominacion[Pos].Denominacion.Caption ,mtInformation,[mbok],0);
         TJvIntegerEdit(Sender).Value := LDenominacion[Pos].Existencia;
        end;}
       Valor := LDenominacion[Pos].vDenominacion * TJvIntegerEdit(Sender).Value;
       LDenominacion[Pos].Total.Caption := FormatCurr('#,0.00',Valor);
       TSumaBilletes := 0;
       for I := 0 to Length(LDenominacion) - 1 do
       begin
           Valor := LDenominacion[I].vDenominacion * LDenominacion[I].Cantidad.Value;
           TSumaBilletes := TSumaBilletes + Valor;
       end;
       STotalBilletes.Caption := FormatCurr('$#,#00',TSumaBilletes);
       SDiferencia.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);

end;

procedure TfrmOperacionesCaja.CmdVerChequesClick(Sender: TObject);
var frmRelacionCheques:TfrmRelacionCheques;
begin
    frmRelacionCheques:=TfrmRelacionCheques.Create(Self);
    frmRelacionCheques.ListaCheques := ListaCheques;
    if frmRelacionCheques.ShowModal = mrok then
    begin
        ListaCheques := frmRelacionCheques.ListaCheques;
        EdChequesCap.Value := frmRelacionCheques.ValorCheques;
    end;
end;

procedure TfrmOperacionesCaja.EdChequesCapExit(Sender: TObject);
begin
//        if TipoCaptacion = 5 then EdChequesCap.Value := 0;
        if (EdChequesCap.Value > 0) and
           (CapOperacion = 'C') then
           CmdVerCheques.Click;
       if TipoCaptacion <> 5 then
        if CapOperacion = 'C' then
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo + TGeneral))
        else
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo - TGeneral));

end;

procedure TfrmOperacionesCaja.FormCreate(Sender: TObject);
begin
        Self.Left := 0;
        Self.Top := 17;
        Application.OnException := Excepciones;
        dmColocacion := TdmColocacion.Create(Self);
        ListaCheques := TList.Create;
        ListaDevolucion := TList.Create;
        vDiasContractual := 0;
        BuscarMinimoSARLAFT;
end;

procedure TfrmOperacionesCaja.CmdOKCaptacionClick(Sender: TObject);
begin
        if EdDocumentoCap.Text = '' then
        begin
           MessageDlg('Debe Diligenciar el Documento',mtInformation,[mbok],0);
           EdDocumentoCap.SetFocus;
        end;

        if MessageDlg('Seguro de Realizar la Operación',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

        if ((TBilletes + TMonedas) >= _vMinimoSARLAFT) then
        if (edDocumentoUsuario.Text = '') then
        begin
            MessageDlg('Por favor digite los datos del Usuario',mtInformation,[mbOk],0);
            edDocumentoUsuario.SetFocus;
            exit;
        end
        else
        if not _bDocumentoUsuarioValido then
        begin
            MessageDlg('El Usuario debe quedar bien registrado',mtInformation,[mbOk],0);
            edDocumentoUsuario.SetFocus;
            Exit;
        end;


        CmdOKCaptacion.Enabled := False;
        if CapOperacion = 'C' then RealizarConsignacion
        else RealizarRetiro;
end;

procedure TfrmOperacionesCaja.EdMonedasCapChange(Sender: TObject);
begin
{        if CapOperacion = 'R' then
          if EdMonedasCap.Value > THayMonedas then
          begin
            MessageDlg('No tiene tanta cantidad en Monedas',mtInformation,[mbok],0);
            EdMonedasCap.Value := THayMonedas;
          end;}
        TMonedas := EdMonedasCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
        if CapOperacion = 'C' then
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo + TGeneral))
        else
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo - TGeneral));

end;

procedure TfrmOperacionesCaja.EdChequesCapChange(Sender: TObject);
begin
        TCheques := EdChequesCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
        if CapOperacion = 'C' then
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo + TGeneral))
        else
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo - TGeneral));
end;

function TfrmOperacionesCaja.GrabarConsignacion:Boolean;
var Valor:Currency;
    I:Integer;
    ARecord:PLista;
    PRecord:PListaDev;
    Validar:TValidarCap;
    FechaTabla:TDate;
begin

              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('insert into "cap$extracto" values(');
              IBPagar.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
              IBPagar.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
              IBPagar.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
              IBPagar.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDateTime := StrToDate(EdFecha.Caption);
              IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime := fHoraActual; 

              Valor := TBilletes + TMonedas;
              if Valor > 0 then
              begin
               IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
               IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdDocumentoCap.Text;
               IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'CONSIGNACION EN EFECTIVO';
               IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := Valor;
               IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
                   IBPagar.Transaction.RollbackRetaining;
                   Result := False;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
                  IBPagar.Transaction.RollbackRetaining;
                  Result := False;
                  Exit;
                end; // del try
// Grabando Canje Monedas
               if TMonedas > 0 then
                begin
                IBOtros1.Close;
                IBOtros1.SQL.Clear;
                IBOtros1.SQL.Add('insert into "cap$canje" values(');
                IBOtros1.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
                IBOtros1.SQL.Add(':ID_BANCO,:NUMERO_CHEQUE,:PLAZA,:ID_CAJA,:FECHA_ENTRADA,:VALOR_CHEQUE,:VALOR_MONEDAS,');
                IBOtros1.SQL.Add(':LIBERADO,:DEVUELTO,:CONSIGNADO,:FECHA_LIBERADO,:FECHA_DEVUELTO,:FECHA_CONSIGNADO)');
                IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
                IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBOtros1.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                IBOtros1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                IBOtros1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                IBOtros1.ParamByName('FECHA_ENTRADA').AsDate := StrToDate(EdFecha.Caption);
                IBOtros1.ParamByName('LIBERADO').AsInteger := 0;
                IBOtros1.ParamByName('DEVUELTO').AsInteger := 0;
                IBOtros1.ParamByName('CONSIGNADO').AsInteger := 0;
                IBOtros1.ParamByName('FECHA_LIBERADO').Clear;
                IBOtros1.ParamByName('FECHA_DEVUELTO').Clear;
                IBOtros1.ParamByName('FECHA_CONSIGNADO').Clear;
                IBOtros1.ParamByName('NUMERO_CHEQUE').AsInteger := 0;
                IBOtros1.ParamByName('ID_BANCO').AsInteger := 0;
                IBOtros1.ParamByName('PLAZA').AsString := '';
                IBOtros1.ParamByName('VALOR_CHEQUE').AsCurrency := 0;
                IBOtros1.ParamByName('VALOR_MONEDAS').AsCurrency := TMonedas;
                try
                  IBOtros1.ExecQuery;
                  if IBOtros1.RowsAffected < 1 then
                  begin
                     MessageDlg('Error Grabando Monedas en cap$canje',mtError,[mbcancel],0);
                     Result := False;
                     IBOtros1.Transaction.RollbackRetaining;
                     Exit;
                  end
                 except
                     MessageDlg('Error Grabando Monedas en cap$canje',mtError,[mbcancel],0);
                     Result := False;
                     IBOtros1.Transaction.RollbackRetaining;
                     Exit;
                   end;

                end  // del if Canje Monedas
               end; // del if

              IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDateTime := StrToDate(EdFecha.Caption);
              IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime := Time;
              if TCheques > 0 then
              begin
               IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 3;
               IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdDocumentoCap.Text;
               IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'CONSIGNACION EN CHEQUE';
               IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := TCheques;
               IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
                   IBPagar.Transaction.RollbackRetaining;
                   Result := False;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
                  IBPagar.Transaction.RollbackRetaining;
                  Result := False;
                  Exit;
                end; // del try

                IBOtros.Close;
                IBOtros.SQL.Clear;
                IBOtros.SQL.Add('insert into "caj$cheques" values(');
                IBOtros.SQL.Add(':ID_CAJA,:ID_BANCO,:NUMERO_CHEQUE,:FECHA,:PLAZA,');
                IBOtros.SQL.Add(':VALOR,:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
                IBOtros.SQL.Add(':DIGITO_CUENTA,:DOCUMENTO,:ENVIADO,:FECHA_ENVIO)');
                IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
                IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                IBOtros.ParamByName('FECHA').AsDate := StrToDate(EdFecha.Caption);
                IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCap.Text;
                IBOtros.ParamByName('ENVIADO').AsInteger := 0;
                IBOtros.ParamByName('FECHA_ENVIO ').Clear;
                IBOtros1.Close;
                IBOtros1.SQL.Clear;
                IBOtros1.SQL.Add('insert into "cap$canje" values(');
                IBOtros1.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
                IBOtros1.SQL.Add(':ID_BANCO,:NUMERO_CHEQUE,:PLAZA,:ID_CAJA,:FECHA_ENTRADA,:VALOR_CHEQUE,:VALOR_MONEDAS,');
                IBOtros1.SQL.Add(':LIBERADO,:DEVUELTO,:CONSIGNADO,:FECHA_LIBERADO,:FECHA_DEVUELTO,:FECHA_CONSIGNADO)');
                IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
                IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBOtros1.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                IBOtros1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                IBOtros1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                IBOtros1.ParamByName('FECHA_ENTRADA').AsDate := StrToDate(EdFecha.Caption);
                IBOtros1.ParamByName('LIBERADO').AsInteger := 0;
                IBOtros1.ParamByName('DEVUELTO').AsInteger := 0;
                IBOtros1.ParamByName('CONSIGNADO').AsInteger := 0;
                IBOtros1.ParamByName('FECHA_LIBERADO').Clear;
                IBOtros1.ParamByName('FECHA_DEVUELTO').Clear;
                IBOtros1.ParamByName('FECHA_CONSIGNADO').Clear;
                for I := 0 to ListaCheques.Count - 1 do
                begin
                   ARecord := ListaCheques.Items[I];
                   IBOtros.ParamByName('ID_BANCO').AsInteger := ARecord^.Codigo;
                   IBOtros.ParamByName('NUMERO_CHEQUE').AsInteger := StrToInt(ARecord^.Numero);
                   IBOtros.ParamByName('PLAZA').AsString := ARecord^.Plaza;
                   IBOtros.ParamByName('VALOR').AsCurrency := ARecord^.Valor;
                   try
                    IBOtros.ExecQuery;
                    if IBOtros.RowsAffected < 1 then
                    begin
                       MessageDlg('Error Grabando Cheque en caj$cheques',mtError,[mbcancel],0);
                       Result := False;
                       IBOtros.Transaction.RollbackRetaining;
                       Exit;
                    end
                   except
                       MessageDlg('Error Grabando Cheque en caj$cheques',mtError,[mbcancel],0);
                       Result := False;
                       IBOtros.Transaction.RollbackRetaining;
                       Exit;
                   end;
                   IBOtros1.ParamByName('PLAZA').AsString := ARecord^.Plaza;
                   IBOtros1.ParamByName('ID_BANCO').AsInteger := ARecord^.Codigo;
                   IBOtros1.ParamByName('NUMERO_CHEQUE').AsString := ARecord^.Numero;
                   IBOtros1.ParamByName('VALOR_CHEQUE').AsCurrency := ARecord^.Valor;

                   try
                    IBOtros1.ExecQuery;
                    if IBOtros1.RowsAffected < 1 then
                    begin
                       MessageDlg('Error Grabando Cheque en cap$canje',mtError,[mbcancel],0);
                       Result := False;
                       IBOtros1.Transaction.RollbackRetaining;
                       Exit;
                    end
                   except
                       MessageDlg('Error Grabando Cheque en cap$canje',mtError,[mbcancel],0);
                       Result := False;
                       IBOtros1.Transaction.RollbackRetaining;
                       Exit;
                   end;

                end; // del for
               end; // del if

// Caso Contractual, Marcar Tabla
              if TipoCaptacion = 5 then begin
                if vDiasContractual > 5 then// valida el numero de dias de Atraso
                begin
                  IBOtros1.Close;
                  IBOtros1.SQL.Clear;
                  IBOtros1.SQL.Add('SELECT ');
                  IBOtros1.SQL.Add('COUNT(*) as TOTAL');
                  IBOtros1.SQL.Add('FROM');
                  IBOtros1.SQL.Add('"cap$tablaliquidacioncon"');
                  IBOtros1.SQL.Add('WHERE');
                  IBOtros1.SQL.Add('(DESCONTADO = 0) AND ');
                  IBOtros1.SQL.Add('(ID_TIPO_CAPTACION = 5) AND ');
                  IBOtros1.SQL.Add('(NUMERO_CUENTA = :NM) AND ');
                  IBOtros1.SQL.Add('(DIGITO_CUENTA = :DG)');
                  IBOtros1.ParamByName('NM').AsInteger := StrToInt(EdNumeroCap.Text);
                  IBOtros1.ParamByName('DG').AsInteger := StrToInt(EdDigitoCap.Caption);
                  IBOtros1.ExecQuery;
                  vNuevoPlazo := IBOtros1.FieldByName('TOTAL').AsInteger * 30;
                  Listac := TablaCon(ValorCuotaCon,fFechaActual,30,vNuevoPlazo,DayOf(fFechaActual),fFechaActual);
                  IBOtros1.Close;
                  IBOtros1.SQL.Clear;
                  IBOtros1.SQL.Add('DELETE FROM "cap$tablaliquidacioncon" WHERE DESCONTADO = 0 AND NUMERO_CUENTA = :NM AND DIGITO_CUENTA = :DG AND ID_TIPO_CAPTACION = 5');
                  IBOtros1.ParamByName('NM').AsInteger := StrToInt(EdNumeroCap.Text);
                  IBOtros1.ParamByName('DG').AsInteger := StrToInt(EdDigitoCap.Caption);
                  IBOtros1.ExecQuery;
                  IBOtros1.Transaction.Commit;
                  IBOtros1.Transaction.StartTransaction;
                  IBOtros1.SQL.Clear;
                  IBOtros1.SQL.Add('Insert into "cap$tablaliquidacioncon" values(');
                  IBOtros1.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                  IBOtros1.SQL.Add(':"FECHA_DESCUENTO",:"VALOR",:"DESCONTADO")');
                  IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  IBOtros1.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
                  IBOtros1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                  IBOtros1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                  for i := 0 to Listac.Count - 1 do
                  begin
                     ARecordc := Listac.Items[i];
                     IBOtros1.ParamByName('FECHA_DESCUENTO').AsDate := ARecordc^.FechaDescuento;
                     IBOtros1.ParamByName('VALOR').AsCurrency := ARecordc^.Valor;
                     IBOtros1.ParamByName('DESCONTADO').AsInteger := BooleanoToInt(ARecordc^.Descontado);
                     try
                        IBOtros1.ExecQuery;
                        IBOtros1.Close;
                        Dispose(ARecordc);
                     except
                        Abort;
                     end;
                  end;
                  Listac.Free;
                  IBOtros1.Close;
                  IBOtros1.SQL.Clear;
                  IBOtros1.SQL.Add('INSERT INTO "cap$controlcon" values(:ID_AGENCIA,:ID_TIPO_CAPTACION,');
                  IBOtros1.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:FECHA_ANTERIOR,:FECHA_ACTUAL,');
                  IBOtros1.SQL.Add(':C_VENCIDA,:PLAZO_ACTUAL,:ID_EMPLEADO,:HORA,:DIAS)');
                  IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  IBOtros1.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
                  IBOtros1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                  IBOtros1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                  IBOtros1.ParamByName('FECHA_ANTERIOR').AsDate := vFechaDecuento;
                  IBOtros1.ParamByName('FECHA_ACTUAL').AsDate := fFechaActual;
                  IBOtros1.ParamByName('C_VENCIDA').AsCurrency := vCuotasC;
                  IBOtros1.ParamByName('PLAZO_ACTUAL').AsInteger := vNuevoPlazo;
                  IBOtros1.ParamByName('ID_EMPLEADO').AsString := DBAlias;
                  IBOtros1.ParamByName('HORA').AsTime := Time;
                  IBOTROS1.ParamByName('DIAS').AsInteger := vDiasContractual;
                  IBOtros1.ExecQuery;
                  IBOtros1.Close;
                  IBOtros1.SQL.Clear;
                  IBOtros1.SQL.Add('UPDATE "cap$maestro" SET FECHA_VENCIMIENTO_PRORROGA = :FECHA WHERE ID_TIPO_CAPTACION = 5 AND NUMERO_CUENTA = :NM AND DIGITO_CUENTA = :DG');
                  IBOtros1.ParamByName('NM').AsInteger := StrToInt(EdNumeroCap.Text);
                  IBOtros1.ParamByName('DG').AsInteger := StrToInt(EdDigitoCap.Caption);
                  IBOtros1.ParamByName('FECHA').AsDate := CalculoFecha(fFechaActual,vNuevoPlazo);
                  IBOtros1.ExecQuery;
                end
                else
                begin
                  IBOtros1.Close;
                  IBOtros1.SQL.Clear;
                  IBOtros1.SQL.Add('update "cap$tablaliquidacioncon" set DESCONTADO = 1 where');
                  IBOtros1.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                  IBOtros1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
                  IBOtros1.SQL.Add('FECHA_DESCUENTO = :FECHA_DESCUENTO');
                  IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  IBOtros1.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
                  IBOtros1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                  IBOtros1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                  IBOtros1.ParamByName('FECHA_DESCUENTO').AsDate := vFechaDecuento;
                  try
                   IBOtros1.ExecQuery;
                   if IBOtros1.RowsAffected < 1 then
                    begin
                     MessageDlg('Error Marcando Cuenta:'+Format('%.7d',[StrToInt(EdNumeroCap.Text)]),mtError,[mbcancel],0);
                    end;
                  except
                    //IBPagar.Transaction.Rollback;
                    raise;
                  end;
                end;// FIN DEL VALIDA DIAS
              end;
//Fin Caso Contractual

              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimiento" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:HUELLA,:ID_PERSONA)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCap.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
              IBOtros.ParamByName('BILLETES').AsCurrency := TBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := TMonedas;
              IBOtros.ParamByName('CHEQUES').AsCurrency := TCheques;
              IBOtros.ParamByName('HUELLA').AsInteger := 0;
              IBOtros.ParamByName('ID_PERSONA').AsString := edDocumentoUsuario.Text;
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
                 end;
              except
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
              end;

// Grabar Arqueo
{
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientoarqueo" values (');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO,');
              IBOtros.SQL.Add(':ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)');

              IBOtros1.Close;
              IBOtros1.SQL.Clear;
              IBOtros1.SQL.Add('update "caj$arqueos"');
              IBOtros1.SQL.Add('set CANTIDAD_DENOMINACION = CANTIDAD_DENOMINACION + :CANTIDAD_DENOMINACION,');
              IBOtros1.SQL.Add('VALOR_DENOMINACION = VALOR_DENOMINACION + :VALOR_DENOMINACION ');
              IBOtros1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBOtros1.SQL.Add('ID_CAJA = :ID_CAJA and');
              IBOtros1.SQL.Add('FECHA_MOV = :FECHA_MOV and');
              IBOtros1.SQL.Add('ID_DENOMINACION = :ID_DENOMINACION');

              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCap.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to Length(LDenominacion) - 1 do
               begin
                    if LDenominacion[I].Cantidad.Value  > 0 then
                    begin
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := LDenominacion[I].IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacion[I].Cantidad.Value;
                     try
                        IBOtros.ExecQuery;
                        if IBOtros.RowsAffected < 1 then
                         begin
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := LDenominacion[I].IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacion[I].Cantidad.Value;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                    end;
               end;

               if TMonedas > 0 then
               begin
                  IBOtros.ParamByName('ID_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;
                  try
                      IBOtros.ExecQuery;
                      if IBOtros.RowsAffected < 1 then
                       begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                       end;
                   except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                   end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;


//Grabar Devolucion

              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$devolucionarqueo" values (');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO,');
              IBOtros.SQL.Add(':ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)');

              IBOtros1.Close;
              IBOtros1.SQL.Clear;
              IBOtros1.SQL.Add('update "caj$arqueos"');
              IBOtros1.SQL.Add('set CANTIDAD_DENOMINACION = CANTIDAD_DENOMINACION - :CANTIDAD_DENOMINACION,');
              IBOtros1.SQL.Add('VALOR_DENOMINACION = VALOR_DENOMINACION - :VALOR_DENOMINACION ');
              IBOtros1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBOtros1.SQL.Add('ID_CAJA = :ID_CAJA and');
              IBOtros1.SQL.Add('FECHA_MOV = :FECHA_MOV and');
              IBOtros1.SQL.Add('ID_DENOMINACION = :ID_DENOMINACION');

              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCap.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to ListaDevolucion.Count - 1 do
               begin
                   PRecord := ListaDevolucion.Items[I];
                   if PRecord^.Cantidad > 0 then
                    begin
                     IBOtros.Close;
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := PRecord^.IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := Precord^.Cantidad;
                     try
                        IBOtros.ExecQuery;
                        if IBOtros.RowsAffected < 1 then
                         begin
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(PRecord^.IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(PRecord^.IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := PRecord^.IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := Precord^.Cantidad;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
                    end;
               end;

               if MonedasDevolucion > 0 then
               begin
                  IBOtros.ParamByName('ID_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := MonedasDevolucion;
                  try
                      IBOtros.ExecQuery;
                      if IBOtros.RowsAffected < 1 then
                       begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo devolucion',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                       end;
                   except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo devolucion',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                   end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := MonedasDevolucion;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devolución',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devolución',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;

// Fin Devolucion Arqueo
}
//Grabar Libretas Usadas

               IBOtros.Close;
               IBOtros.SQL.Clear;
               IBOtros.SQL.Add('insert into "cap$libretasusada" values(');
               IBOtros.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:NUMERO_TALON,:FECHA_USADA)');
               if LibGeneral then
               begin
                 IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := 0;
                 IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := 0;
                 IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := 0;
               end
               else
               begin
                 IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                 IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                 IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
               end;
               IBOtros.ParamByName('FECHA_USADA').AsDate := StrToDate(EdFecha.Caption);
               IBOtros.ParamByName('NUMERO_TALON').AsInteger := StrToInt(EdDocumentoCap.Text);
               try
                 IBOtros.ExecQuery;
                 if IBOtros.RowsAffected < 1 then
                   begin
                     IBOtros.Transaction.RollbackRetaining;
                     MessageDlg('Error al Marcar Libreta Usada',mtError,[mbcancel],0);
                     Result := False;
                     Exit;
                   end;
               except
                     IBOtros.Transaction.RollbackRetaining;
                     MessageDlg('Error al Marcar Libreta Usada',mtError,[mbcancel],0);
                     Result := False;
                     Exit;
               end;

               dmGeneral.IBTransaction1.CommitRetaining;

Result := True;
end;

function TfrmOperacionesCaja.GrabarRetiro:Boolean;
var Valor:Currency;
    I:Integer;
    Dia:Integer;
    Hora:TTime;
    ServiCaja:Boolean;
begin
              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('insert into "cap$extracto" values(');
              IBPagar.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
              IBPagar.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
              IBPagar.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
              IBPagar.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDateTime := StrToDate(EdFecha.Caption);
              IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime := Time;
              Valor := TBilletes + TMonedas;
              if Valor > 0 then
              begin
               IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
               IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdDocumentoCap.Text;
               IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'RETIRO EN EFECTIVO';
               IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := 0;
               IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := Valor;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Retiro',mtError,[mbok],0);
                   IBPagar.Transaction.RollbackRetaining;
                   Result := False;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Retiro',mtError,[mbok],0);
                  IBPagar.Transaction.RollbackRetaining;
                  Result := False;
                  Exit;
                end; // del try
              end; // del if

              IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDateTime := StrToDate(EdFecha.Caption);
              IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime := Time;
              if TCheques > 0 then
              begin
               IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 13;
               IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdDocumentoCap.Text;
               IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'RETIRO EN CHEQUE';
               IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := 0;
               IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := TCheques;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Retiro',mtError,[mbok],0);
                   IBPagar.Transaction.RollbackRetaining;
                   Result := False;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Retiro',mtError,[mbok],0);
                  IBPagar.Transaction.RollbackRetaining;
                  Result := False;
                  Exit;
                end; // del try
               end;

// Validar Excenta



               if InttoBoolean(ParaSaldar) then begin
                 IBPagar.Close;
                 IBPagar.SQL.Clear;
                 IBPagar.SQL.Add('update "cap$maestro" set ID_ESTADO = 2');
                 IBPagar.SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                 IBPagar.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                 IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                 IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                 IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                      try
                        IBPagar.ExecQuery;
                        if IBPagar.RowsAffected < 1 then
                        begin
                        IBPagar.Transaction.RollbackRetaining;
                        MessageDlg('Error Actualizando Estado',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                        end
                      except
                        IBPagar.Transaction.RollbackRetaining;
                        MessageDlg('Error Actualizando Estado',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                      end;
                 IBPagar.Close;
               end;


              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimiento" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:HUELLA,:ID_PERSONA)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;              
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCap.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
              IBOtros.ParamByName('BILLETES').AsCurrency := TBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := TMonedas;
              IBOtros.ParamByName('CHEQUES').AsCurrency := TCheques;
              IBOtros.ParamByName('HUELLA').AsInteger := BooleanoToInt(ctlHuella);
              IBOtros.ParamByName('ID_PERSONA').AsString := edDocumentoUsuario.Text;
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
                 end;
              except
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
              end;

// Grabar Arqueo
{
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientoarqueo" values (');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO,');
              IBOtros.SQL.Add(':ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)');

              IBOtros1.Close;
              IBOtros1.SQL.Clear;
              IBOtros1.SQL.Add('update "caj$arqueos"');
              IBOtros1.SQL.Add('set CANTIDAD_DENOMINACION = CANTIDAD_DENOMINACION - :CANTIDAD_DENOMINACION,');
              IBOtros1.SQL.Add('VALOR_DENOMINACION = VALOR_DENOMINACION - :VALOR_DENOMINACION ');
              IBOtros1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBOtros1.SQL.Add('ID_CAJA = :ID_CAJA and');
              IBOtros1.SQL.Add('FECHA_MOV = :FECHA_MOV and');
              IBOtros1.SQL.Add('ID_DENOMINACION = :ID_DENOMINACION');

              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;              
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCap.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to Length(LDenominacion) - 1 do
               begin
                   if LDenominacion[I].Cantidad.Value  > 0 then
                    begin
                     IBOtros.Close;
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := LDenominacion[I].IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacion[I].Cantidad.Value;
                     try
                        IBOtros.ExecQuery;
                        if IBOtros.RowsAffected < 1 then
                         begin
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(LDenominacion[I].IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(LDenominacion[I].IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := LDenominacion[I].IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacion[I].Cantidad.Value;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
                    end;
               end;

               if TMonedas > 0 then
               begin
                  IBOtros.ParamByName('ID_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;
                  try
                      IBOtros.ExecQuery;
                      if IBOtros.RowsAffected < 1 then
                       begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                       end;
                   except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                   end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;

// Fin Arqueo
}
// Grabar Libretas Usadas
               IBOtros.Close;
               IBOtros.SQL.Clear;
               IBOtros.SQL.Add('insert into "cap$libretasusada" values(');
               IBOtros.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:NUMERO_TALON,:FECHA_USADA)');
               if LibGeneral then
               begin
               IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
               IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := 0;
               IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := 0;
               IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := 0;
               end
               else
               begin
               IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
               IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
               IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
               IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
               end;
               IBOtros.ParamByName('FECHA_USADA').AsDate := StrToDate(EdFecha.Caption);
               IBOtros.ParamByName('NUMERO_TALON').AsInteger := StrToInt(EdDocumentoCap.Text);
               try
                 IBOtros.ExecQuery;
                 if IBOtros.RowsAffected < 1 then
                   begin
                     IBOtros.Transaction.RollbackRetaining;
                     MessageDlg('Error al Marcar Libreta Usada',mtError,[mbcancel],0);
                     Result := False;
                     Exit;
                   end;
               except
                     IBOtros.Transaction.RollbackRetaining;
                     MessageDlg('Error al Marcar Libreta Usada',mtError,[mbcancel],0);
                     Result := False;
                     Exit;
               end;

// Grabar Autorizado
               if ChkAutorizado.Checked then begin

                 Dia := DayOfWeek(StrToDate(EdFecha.Caption));
                 Hora := StrToTime(EdHora.Caption);

                 IBSQL1.Close;
                 IBSQL1.SQL.Clear;
                 IBSQL1.SQL.Add('select * from "caj$horarioservicaja" where DIA = :DIA and');
                 IBSQL1.SQL.Add(':HORA BETWEEN HORA_INICIAL and HORA_FINAL');
                 IBSQL1.ParamByName('DIA').AsInteger := Dia;
                 IBSQL1.ParamByName('HORA').AsTime := Hora;
                 try
                  IBSQL1.ExecQuery;
                  if (Es_ServiCaja) and (IBSQL1.RecordCount > 0) then
                     ServiCaja := True
                  else
                     ServiCaja := False;
                 except
                  IBSQL1.Transaction.RollbackRetaining;
                  MessageDlg('Error al Buscar Servicaja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
                 end;

                 IBPagar.Close;
                 IBPagar.SQL.Clear;
                 IBPagar.SQL.Add('insert into "caj$retiroautorizado" values(');
                 IBPagar.SQL.Add(':ID_TIPO_CAPTACION,:ID_AGENCIA,:NUMERO_CUENTA,:DIGITO_CUENTA,');
                 IBPagar.SQL.Add(':FECHA_MOV,:DOCUMENTO,:EFECTIVO,:SERVICAJA)');
                 IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                 IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                 IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                 IBPagar.ParamByName('FECHA_MOV').AsDate := StrToDate(EdFecha.Caption);
                 IBPagar.ParamByName('DOCUMENTO').AsString := EdDocumentoCap.Text;
                 IBPagar.ParamByName('EFECTIVO').AsCurrency := TGeneral;
                 IBPagar.ParamByName('SERVICAJA').AsInteger := BooleanoToInt(ServiCaja);
                 try
                   IBPagar.ExecQuery;
                 except
                   IBPagar.Transaction.RollbackRetaining;
                   MessageDlg('Error al Grabar Autorizados',mtError,[mbcancel],0);
                   Result := False;
                   Exit;
                 end;
               end;

// Fin Autorizado

               dmGeneral.IBTransaction1.CommitRetaining;
Result := True;

end;

procedure TfrmOperacionesCaja.LimpiarCaptacion;
var I: Integer;
    ARecord:PLista;
    PRecord:PListaDev;
begin

// Limpiar Captaciones
       EdNumeroCap.Text := '';
       EdDigitoCap.Caption := '';
       EdEstadoCap.Caption := '';
       EdFirmas.Caption := '';
       EdSellos.Caption := '';
       EdProtectografos.Caption := '';
       CBTitulares.Items.Clear;
       CBTitulares.Text := '';
       EdSaldoCap.Caption := '';
       EdCanjeCap.Caption := '';
       EdDisponibleCap.Caption := '';
       EdNuevoSaldoCap.Caption := '';
       EdDocumentoCap.Text := '';
       EdNuevoSaldoCap.Caption := '';
       EdTotalBilletesCap.Value := 0;
       EdMonedasCap.Value := 0;
       EdChequesCap.Value := 0;
       EdTotalCap.Caption := '';
       STotalBilletes.Caption := '';

       for I := 0 to Length(LDenominacion) - 1 do
       begin
                LDenominacion[I].Cantidad.Value := 0;
                LDenominacion[I].Total.Caption := '';
                LDenominacion[I].Existencia := 0;
       end;

// Limpiar Certificados

       EdNumeroCer.Text := '';
       EdDigitoCer.Caption := '';
       EdEstadoCer.Caption := '';
       CBTitularesCer.Items.Clear;
       CBTitularesCer.Text := '';
       EdValorCer.Caption := '';
       EdDocumentoCer.Text := '';
       EdTotalBilletesCer.Value := 0;
       EdMonedasCer.Value := 0;
       EdTotalCer.Caption := '';

       for I := 0 to Length(LDenominacionCer) - 1 do
       begin
                LDenominacionCer[I].Cantidad.Value := 0;
                LDenominacionCer[I].Total.Caption := '';
                LDenominacionCer[I].Existencia := 0;
       end;

// Limpiar Colocacion

       EdNumeroColocacion.Text  := '';
       EdNumeroIdentificacion.Caption := '';
       EdNombre.Caption := '';
       EdSaldoColocacion.Caption := '';
       EdPlazo.Caption := '';
       EdAmortizaCapital.Caption := '';
       EdAmortizaInteres.Caption := '';
       EdTasaNominal.Caption := '';
       EdValorCuota.Caption := '';
       EdFechaCapital.Caption := '';
       EdFechaInteres.Caption := '';
       EdCuotas.Value := 1;
       EdTotal1.Caption := '';
       EdNoComprobante.Caption := '';
       GBInfoCol.Enabled := False;

       STotalBilletesCol.Caption := '';
       EdTotalBilletesCol.Value := 0;
       EdMonedasCol.Value := 0;
       EdDevolucionCol.Value := 0;
       EdTotalCol.Caption := '';

       Colocacion := '';
       vNoComprobante := '';
       vTipoOperacion := 0;
       vseguro        := 0;
       vpagxcliente   := 0;
       vhonorarios    := 0;
       votrospagos    := 0;
       vCuotaNo       := 0;
       Capital        := 0;
       Causado        := 0;
       DiasCausado    := 0;
       Corriente      := 0;
       DiasCorriente  := 0;
       Vencido        := 0;
       DiasVencido    := 0;
       Anticipado     := 0;
       DiasAnticipado := 0;
       Devuelto       := 0;
       DiasDevuelto   := 0;
       Total          := 0;
       abono_capital  := 0;
       abono_cxc      := 0;
       abono_servicios :=0;
       abono_anticipado:=0;
       abono_mora     := 0;
       Cuota_anterior := 0;
       DirInt         := 0;
       debito := '';
       credito := '';
       honorarios := '';

//  Lista:TList;
  Clasificacion:= '';
  ClasificacionM := 0;
  Garantia:='';
  GarantiaM := 0;
  Estado:='';
  Asociado:='';
  NuevoSaldo:=0;


       for I := 0 to Length(LDenominacionCol) - 1 do
       begin
                LDenominacionCol[I].Cantidad.Value := 0;
                LDenominacionCol[I].Total.Caption := '';
                LDenominacionCol[I].Existencia := 0;
       end;

// Limpiar Otros

       EdRecaudo.Caption := '';
       STotalBilletesOtr.Caption := '';
       EdTotalBilletesOtr.Value := 0;
       EdMonedasOtr.Value := 0;
       EdChequesOtr.Value := 0;
       EdDevolucionOtr.Value := 0;
       EdTotalOtr.Caption := '';

       for I := 0 to Length(LDenominacionOtr) - 1 do
       begin
                LDenominacionOtr[I].Cantidad.Value := 0;
                LDenominacionOtr[I].Total.Caption := '';
                LDenominacionOtr[I].Existencia := 0;
       end;


// Limpiar Generales

       EdDocumentoGen.Text := '';
       STotalBilletesGen.Caption := '';
       EdTotalBilletesGen.Value := 0;
       EdMonedasGen.Value := 0;
       EdTotalGen.Caption := '';


       for I := 0 to Length(LDenominacionGen) - 1 do
       begin
                LDenominacionGen[I].Cantidad.Value := 0;
                LDenominacionGen[I].Total.Caption := '';
                LDenominacionGen[I].Existencia := 0;
       end;

// Generales

       ListaCheques.Clear;
       ListaDevolucion.Clear;
       EdNumeroCapAg.Text := '';
       EdDigitoCapAg.Caption := '';
       EdEstadoCapAg.Caption := '';
       EdFirmasAg.Caption := '';
       EdsellosAg.Caption := '';
       EdprotectografosAg.Caption := '';
       CBTitularesAg.Items.Clear;
       CBTitularesAg.Text := '';
       EdSaldoCapAg.Caption := '';
       EdCanjeCapAg.Caption := '';
       EdDisponibleCapAg.Caption := '';
       EdDocumentoCapAg.Text := '';
       EdTotalBilletesCapAg.Value := 0;
       EdTotalMonedasCapAg.Value := 0;
       EdTotalChequesCapAg.Value := 0;
       EdTotalCapAg.Caption := '';
       STotalBilletesAg.Caption := '';
       EdRangoIniAg.Caption := '';
       EdRangoFinAg.Caption := '';
       EdNuevoSaldoCap.Caption := '';
       CDhuella.CancelUpdates;
       CDfirma.CancelUpdates;
       lautorizadoag.Enabled := False;
       ChkAutorizadoag.Enabled := False;
       CmdConfrontarHuellaAg.Enabled := True;
       CmdImagenesCapAg.Enabled := True;
       Asociado_Titular := '';
       ChkCreditos.Enabled := False;
       ChkCreditos.Checked := False;
       EdNuevoSaldoCapAg.Caption := '';

       GrDatosUsuario.Visible := False;
       edDocumentoUsuario.Text := '';
       edPrimerApellidoUsuario.Text := '';
       edSegundoApellidoUsuario.Text := '';
       edNombreUsuario.Text := '';

       GrDatosUsuarioAg.Visible := False;
       edDocumentoUsuarioAg.Text := '';
       edPrimerApellidoUsuarioAg.Text := '';
       edSegundoApellidoUsuarioAg.Text := '';
       edNombreUsuarioAg.Text := '';

end;

function TfrmOperacionesCaja.RecuperarArqueo:Boolean;
var I:Integer;
    PRecord :PListaDev;
begin

      TTotalEnCaja := 0;
      with IBOtros do
      begin
         Transaction.CommitRetaining;
         Close;
         SQL.Clear;
         SQL.Add('select ID_DENOMINACION,VALOR_DENOMINACION,CANTIDAD_DENOMINACION from "caj$arqueos" ');
         SQL.Add('where ID_CAJA = :ID_CAJA and FECHA_MOV = :FECHA_MOV and ID_DENOMINACION = :ID_DENOMINACION');
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
       for I := 0 to Length(LDenominacion) - 1 do
       begin
                Close;
                ParamByName('ID_DENOMINACION').AsInteger := LDenominacion[I].IdDenominacion;
                try
                  ExecQuery;
                  if IBOtros.RecordCount < 1 then
                  begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('No se pudo leer del arqueo',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                  end;
                except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('No se pudo leer del arqueo',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                end;
                New(PRecord);
                PRecord^.IdDenominacion := FieldByName('ID_DENOMINACION').AsInteger;
                PRecord^.vDenominacion := FieldByName('VALOR_DENOMINACION').AsCurrency;
                PRecord^.Cantidad := 0;
                PRecord^.Existencias := FieldByName('CANTIDAD_DENOMINACION').AsInteger;
                ListaDevolucion.Add(PRecord);

                LDenominacion[I].Existencia := FieldByName('CANTIDAD_DENOMINACION').AsInteger;
                LDenominacionCer[I].Existencia := FieldByName('CANTIDAD_DENOMINACION').AsInteger;
                LDenominacionOtr[I].Existencia := FieldByName('CANTIDAD_DENOMINACION').AsInteger;
                LDenominacionGen[I].Existencia := FieldByName('CANTIDAD_DENOMINACION').AsInteger;
                LDenominacionCol[I].Existencia := FieldByName('CANTIDAD_DENOMINACION').AsInteger;
//                LDenominacionCol[I].Existencia := FieldByName('CANTIDAD_DENOMINACION').AsInteger;

                TTotalEnCaja := TTotalEnCaja + LDenominacion[I].Existencia * LDenominacion[I].vDenominacion;
       end;
      end;

      with IBOtros do
      begin
         Close;
         SQL.Clear;
         SQL.Add('select VALOR_DENOMINACION from "caj$arqueos" ');
         SQL.Add('where ID_CAJA = :ID_CAJA and FECHA_MOV = :FECHA_MOV and ID_DENOMINACION = 0');
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
         try
            ExecQuery;
            if IBOtros.RecordCount < 1 then
            begin
               IBOtros.Transaction.RollbackRetaining;
               MessageDlg('No existen datos en el arqueo',mtError,[mbcancel],0);
               Result := False;
               Exit;
            end;
         except
               IBOtros.Transaction.RollbackRetaining;
               MessageDlg('No se pudo leer del arqueo',mtError,[mbcancel],0);
               Result := False;
               Exit;
         end;
         THayMonedas := FieldByName('VALOR_DENOMINACION').AsCurrency;
      end;
     TTotalEnCaja := TTotalEnCaja + THayMonedas;
     Result := True;
end;

procedure TfrmOperacionesCaja.CmdCdatClick(Sender: TObject);
begin
        OrigenM := 6;
        TipoCaptacion := 6;
        Opcion := 3;
        GBCdats.Caption := 'Cdat';
        Caption := 'Operaciones de Caja - CDATS';        
        PageControl1.ActivePage := TabCdats;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdIngresarCDATClick(Sender: TObject);
begin
        CapOperacion := 'I';
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBCdats.Enabled := False;
        CmdOKCertificado.Caption := '&Ingresar';
        EdChequesCer.Enabled := False;
        CmdVerChequesCer.Enabled := False;
        EdDevolucionCer.Enabled := True;
        CmdVerDevolucion.Enabled := True;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionCertificado;
        PageControl.Visible := True;
        EdNumeroCer.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdSaldarCDATClick(Sender: TObject);
begin
        CapOperacion := 'S';
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBCdats.Enabled := False;
        CmdOKCertificado.Caption := '&Saldar';
        CmdVerChequesCer.Enabled := True;
        TabOperacionCaptacion.TabVisible := False;
        TabOperacionCertificado.TabVisible := False;
        PageControl.ActivePage := TabOperacionCertificado;
        PageControl.Visible := True;
        EdNumeroCer.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdCarteraClick(Sender: TObject);
begin
        OrigenM := 7;
        Opcion := 4;
        GBColocaciones.Caption := 'Colocación';
        Caption := 'Operaciones de Caja - CARTERA DE CREDITOS';        
        PageControl1.ActivePage := TabColocaciones;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdRetornarCDATClick(Sender: TObject);
begin
        Opcion := 1;
        PageControl1.ActivePage := TabProductos;
end;

function TfrmOperacionesCaja.ValidarLibreta: Boolean;
var usado:Boolean;
begin
        Result := True;
        usado := False;
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             if CapOperacion = 'C' then begin
               SQL.Add('select * from "cap$libretas" where ');
               SQL.Add('(ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
               SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
               SQL.Add(':LIBRETA BETWEEN NUMERO_INICIAL and NUMERO_FINAL )');
               SQL.Add(' or ');
               SQL.Add('(ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = 0 and ');
               SQL.Add('NUMERO_CUENTA = 0 and DIGITO_CUENTA = 0 and');
               SQL.Add(':LIBRETA BETWEEN NUMERO_INICIAL and NUMERO_FINAL )');
             end
             else
             begin
               SQL.Add('select * from "cap$libretas" where ');
               SQL.Add('(ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
               SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
               SQL.Add(':LIBRETA BETWEEN NUMERO_INICIAL and NUMERO_FINAL )');
             end;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             ParamByName('LIBRETA').AsInteger := Libreta;
             try
              ExecQuery;
              if RecordCount < 1 then
              begin
                 Result := False;
                 MessageDlg('Talon Fuera de Rango',mtError,[mbcancel],0);
                 Exit;
              end;
             except
              Result :=False;
              MessageDlg('Error al Validar Rango',mtError,[mbcancel],0);
              Exit;
             end;

             while not Eof do
             begin
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('select * from "cap$libretasusada" where ');
              IBOtros.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
              IBOtros.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
              IBOtros.SQL.Add('NUMERO_TALON = :LIBRETA');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              IBOtros.ParamByName('LIBRETA').AsInteger := Libreta;
              try
                IBOtros.ExecQuery;
                if IBOtros.RecordCount > 0 then
                begin
                   usado := True;
                   if FieldByName('NUMERO_CUENTA').AsInteger = 0 then
                     LibGeneral := true
                   else
                     LibGeneral := False;
                end
                else
                begin
                   usado := False;
                   if FieldByName('NUMERO_CUENTA').AsInteger = 0 then
                     LibGeneral := true
                   else
                     LibGeneral := False;
                end
              except
                MessageDlg('Error consultando talon',mtError,[mbcancel],0);
              end;
              Next;
             end;
        end;

        if usado and LibGeneral then usado := False;

        if usado then
        begin
           MessageDlg('Talon ya Utilizado',mtError,[mbcancel],0);
           Result := False;
        end;

end;

procedure TfrmOperacionesCaja.EdNumeroCerKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmOperacionesCaja.EdNumeroCerExit(Sender: TObject);
var NumeroS:string;
    Numero:Integer;
    Digito:Integer;
    EsDeMovimiento:Boolean;
begin
        if EdNumeroCer.Text <> '' then
        begin
         EdNumeroCer.Text := Format('%.7d',[StrToInt(EdNumeroCer.Text)]);
         NumeroS := Format('%.7d',[StrToInt(EdNumeroCer.Text)]);
         Numero := StrToInt(EdNumeroCer.Text);
         Digito := StrToInt(DigitoControl(TipoCaptacion,NumeroS));
         EdDigitoCer.Caption := IntToStr(Digito);
         with IBConsulta do
         begin
                Transaction.CommitRetaining;
                Close;
                if CapOperacion = 'I' then
                begin
                SQL.Clear;
                SQL.Add('SELECT ');
                SQL.Add('  "cap$tiposestado".DESCRIPCION,');
                SQL.Add('  "cap$tiposestado".PARA_ACTIVAR,');
                SQL.Add('  "cap$tiposestado".PARA_SALDAR,');
                SQL.Add('  "cap$maestro".VALOR_INICIAL,');
                SQL.Add('  "cap$maestrosapertura".EFECTIVO,');
                SQL.Add('  "cap$maestrosapertura".CHEQUE');
                SQL.Add('FROM');
                SQL.Add(' "cap$maestro"');
                SQL.Add(' INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO="cap$tiposestado".ID_ESTADO)');
                SQL.Add(' INNER JOIN "cap$maestrosapertura" ON ("cap$maestro".ID_AGENCIA="cap$maestrosapertura".ID_AGENCIA)');
                SQL.Add('  AND ("cap$maestro".ID_TIPO_CAPTACION="cap$maestrosapertura".ID_TIPO_CAPTACION)');
                SQL.Add('  AND ("cap$maestro".NUMERO_CUENTA="cap$maestrosapertura".NUMERO_CUENTA)');
                SQL.Add('  AND ("cap$maestro".DIGITO_CUENTA="cap$maestrosapertura".DIGITO_CUENTA)');
                SQL.Add('WHERE');
                SQL.Add('  ("cap$maestro".ID_AGENCIA = :ID_AGENCIA) AND ');
                SQL.Add('  ("cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND ');
                SQL.Add('  ("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
                SQL.Add('  ("cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA)');
                end
                else
                begin
                SQL.Clear;
                SQL.Add('SELECT ');
                SQL.Add('  "cap$tiposestado".DESCRIPCION,');
                SQL.Add('  "cap$tiposestado".PARA_ACTIVAR,');
                SQL.Add('  "cap$tiposestado".PARA_SALDAR,');
                SQL.Add('  "cap$maestro".VALOR_INICIAL');
                SQL.Add('FROM');
                SQL.Add(' "cap$maestro"');
                SQL.Add(' INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO="cap$tiposestado".ID_ESTADO)');
                SQL.Add('WHERE');
                SQL.Add('  ("cap$maestro".ID_AGENCIA = :ID_AGENCIA) AND ');
                SQL.Add('  ("cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND ');
                SQL.Add('  ("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
                SQL.Add('  ("cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA)');
                end;
                
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                  ExecQuery;
                  if RecordCount < 1 then
                  begin
                    MessageDlg('Captación No Exite',mtError,[mbcancel],0);
                    EdNumeroCer.SelectAll;
                    EdNumeroCer.SetFocus;
                    Exit;
                  end;
                  if CapOperacion = 'I' then
                     EsDeMovimiento := InttoBoolean(FieldByName('PARA_ACTIVAR').AsInteger)
                  else
                     EsDeMovimiento := InttoBoolean(FieldByName('PARA_SALDAR').AsInteger);
                  EdEstadoCer.Caption := FieldByName('DESCRIPCION').AsString;
                  Saldo := FieldByName('VALOR_INICIAL').AsCurrency;
                  EdValorCer.Caption := FormatCurr('$ #,#0.00',FieldByName('VALOR_INICIAL').AsCurrency);
                  TGeneral := FieldByName('VALOR_INICIAL').AsCurrency;
                  if not EsDeMovimiento then
                  begin
                     MessageDlg('Esta Captación No Se Puede Trabajar',mtError,[mbcancel],0);
                     EdNumeroCer.SelectAll;
                     EdNumeroCer.SetFocus;
                     Exit;
                  end;

                except
                  MessageDlg('Error Buscando la Captación',mtError,[mbcancel],0);
                  EdNumeroCer.SelectAll;
                  EdNumeroCer.SetFocus;
                  Exit;
                end;

                if CapOperacion = 'I' then
                begin
                 if FieldByName('EFECTIVO').AsInteger = 1 then
                 begin
                    EdTotalBilletesCer.Enabled := True;
                    EdTotalBilletesCer.Value := FieldByName('VALOR_INICIAL').AsCurrency;
                    TBilletes := FieldByName('VALOR_INICIAL').AsCurrency;
                    TMonedas := 0;
                    TCheques := 0;
                    EdChequesCer.Enabled := False;
                    CmdVerChequesCer.Enabled := False;
                 end
                 else
                 begin
                    EdTotalBilletesCer.Enabled := False;
                    EdChequesCer.Enabled := True;
                    CmdVerChequesCer.Enabled := True;
                    EdChequesCer.Value := FieldByName('VALOR_INICIAL').AsCurrency;
                    TCheques := FieldByName('VALOR_INICIAL').AsCurrency;
                    TBilletes := 0;
                    TMonedas := 0;
                 end;
                end;

                IBTitulares.Close;
                IBTitulares.SQL.Clear;
                IBTitulares.SQL.Add('select "gen$persona".ID_IDENTIFICACION,"gen$persona".ID_PERSONA,');
                IBTitulares.SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE');
                IBTitulares.SQL.Add('from "cap$maestro"');
                IBTitulares.SQL.Add('LEFT JOIN "cap$maestrotitular" ON ');
                IBTitulares.SQL.Add('("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ');
                IBTitulares.SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
                IBTitulares.SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ');
                IBTitulares.SQL.Add('("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
                IBTitulares.SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
                IBTitulares.SQL.Add('("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
                IBTitulares.SQL.Add('where');
                IBTitulares.SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                IBTitulares.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBTitulares.SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBTitulares.SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
                IBTitulares.SQL.Add('ORDER BY "cap$maestrotitular".NUMERO_TITULAR');
                IBTitulares.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBTitulares.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                IBTitulares.ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                IBTitulares.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                 IBTitulares.Open;
                 while not IBTitulares.Eof do
                 begin
                    CBTitularesCer.Items.Add(IntToStr(IBTitulares.FieldByName('ID_IDENTIFICACION').AsInteger) + '-' +
                                                   IBTitulares.FieldByName('ID_PERSONA').AsString + '   ' +
                                                   IBTitulares.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                   IBTitulares.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                   IBTitulares.FieldByName('NOMBRE').AsString);
                    IBTitulares.Next;
                 end;
                 CBTitularesCer.ItemIndex := 0;
                except
                 MessageDlg('Error Localizando los Titulares',mtError,[mbcancel],0);
                 EdNumeroCer.SelectAll;
                 EdNumeroCer.SetFocus;
                 Exit;
                end;

             end;
         end;



end;

procedure TfrmOperacionesCaja.EdDocumentoCerExit(Sender: TObject);
begin
       if EdDocumentoCer.Text <> '' then
       begin
          EdDocumentoCer.Text := Format('%.8d',[StrToInt(EdDocumentoCer.Text)]);
          Libreta := StrToInt(EdDocumentoCer.Text);
          PanelValoresCer.Enabled := True;
          if EdTotalBilletesCer.Enabled then
             EdTotalBilletesCer.SetFocus
          else
             EdChequesCer.SetFocus;
       end
       else
          Mensaje.Caption := 'Debe diligenciar el número de documento';
//          MessageDlg('Debe diligenciar el número de documento',mtError,[mbcancel],0);
       end;

procedure TfrmOperacionesCaja.ValorDenominacionCer(Sender:TObject);
var Valor:Currency;
    Pos:Integer;
    I:Integer;
begin
       Pos := TJvIntegerEdit(Sender).Tag;
{       if CapOperacion = 'S' then
        if LDenominacionCer[Pos].Existencia < TJvIntegerEdit(Sender).Value then
        begin
         MessageDlg('Esta caja no tiene esa cantidad de billetes de ' + LDenominacionCer[Pos].Denominacion.Caption ,mtInformation,[mbok],0);
         TJvIntegerEdit(Sender).Value := LDenominacionCer[Pos].Existencia;
        end; }
       Valor := LDenominacionCer[Pos].vDenominacion * TJvIntegerEdit(Sender).Value;
       LDenominacionCer[Pos].Total.Caption := FormatCurr('#,0.00',Valor);
       TSumaBilletes :=0;
       for I := 0 to Length(LDenominacionCer) - 1 do
       begin
           Valor := LDenominacionCer[I].vDenominacion * LDenominacionCer[I].Cantidad.Value;
           TSumaBilletes := TSumaBilletes + Valor;
       end;
       STotalBilletesCer.Caption := FormatCurr('$#,0.00',TSumaBilletes);
       SDiferenciaCer.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);

end;

procedure TfrmOperacionesCaja.EdMonedasCerChange(Sender: TObject);
begin
        if CapOperacion = 'S' then
          if EdMonedasCer.Value > THayMonedas then
          begin
            MessageDlg('No tiene tanta cantidad en Monedas',mtInformation,[mbok],0);
            EdMonedasCer.Value := THayMonedas;
          end;
        TMonedas := EdMonedasCer.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.CmdOKCertificadoClick(Sender: TObject);
begin
        if EdDocumentoCer.Text = '' then
        begin
           MessageDlg('Debe Diligenciar el Documento',mtInformation,[mbok],0);
           EdDocumentoCer.SetFocus;
        end;

        if EdChequesCer.Value <> 0 then
          if ListaCheques.Count = 0 then
          begin
            MessageDlg('Debe diligenciar la relación de cheques',mtError,[mbcancel],0);
            CmdVerChequesCer.Click;
          end;

        if ((TBilletes + TMonedas) >= _vMinimoSARLAFT) then
        if (edDocumentoOpCertUsuario.Text = '') then
        begin
            MessageDlg('Por favor digite los datos del Usuario',mtInformation,[mbOk],0);
            edDocumentoOpCertUsuario.SetFocus;
            exit;
        end
        else
        if not _bDocumentoUsuarioValido then
        begin
            MessageDlg('El Usuario debe quedar bien registrado',mtInformation,[mbOk],0);
            edDocumentoOpCertUsuario.SetFocus;
            Exit;
        end;


        if MessageDlg('Seguro de Realizar la Operación',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

        CmdOKCertificado.Enabled := False;
        if CapOperacion = 'I' then RealizarIngreso
        else RealizarSalida;
end;

procedure TfrmOperacionesCaja.RealizarIngreso;
begin
        if TGeneral = 0 then
        begin
           MessageDlg('No se registrara el ingreso, no ha digitado valores',mtInformation,[mbok],0);
           EdMonedasCer.SetFocus;
           Exit;
        end;

        if TGeneral <> Saldo then
        begin
           MessageDlg('El Valor Distribuido no corresponde al valor de la Captación',mtError,[mbcancel],0);
           EdMonedasCer.SetFocus;
           Exit;
        end;

        Timer.Enabled := False;

        if GrabarIngreso then
        begin
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := StrToDate(EdFecha.Caption);
               FValidar.Caja := StrToInt(EdCaja.Caption);
               FValidar.Origen := OrigenM;               
               FValidar.Tipo := TipoCaptacion;
               FValidar.Operacion := 1;
               FValidar.Agencia := Agencia;
               FValidar.Cuenta := StrToInt(EdNumeroCer.Text);
               FValidar.Documento := StrToInt(EdDocumentoCer.Text);
               FValidar.Billetes := TBilletes;
               FValidar.Monedas := TMonedas;
               FValidar.Cheques := TCheques;
               Validar := FValidar;
               ShowModal;
               Free;
           end;
           MessageDlg('Ingreso Realizado con Exito!',mtInformation,[mbok],0)
         end

        else
           MessageDlg('Error al Realizar el Ingreso, consulte con sistemas',mtError,[mbcancel],0);

        Timer.Enabled := True;

        CmdRetornar.Click;
end;

procedure TfrmOperacionesCaja.RealizarSalida;
begin

       if TGeneral > SaldoEnCaja then
         begin
            MessageDlg('No Tiene Disponibilidad para esta salida' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            EdMonedasCer.SetFocus;
            CmdOKCertificado.Enabled := True;
            Exit;
         end;

        if TGeneral = 0 then
        begin
           MessageDlg('No se registrara la salida, no ha digitado valores',mtInformation,[mbok],0);
           EdMonedasCer.SetFocus;
           CmdOKCertificado.Enabled := True;
           Exit;
        end;

        if TGeneral <> Saldo then
        begin
           MessageDlg('El Valor Distribuido no corresponde al valor de la Captación',mtError,[mbcancel],0);
           EdMonedasCer.SetFocus;
           CmdOKCertificado.Enabled := True;
           Exit;
        end;

        Timer.Enabled := False;

        if GrabarSalida then
        begin
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := StrToDate(EdFecha.Caption);
               FValidar.Caja := StrToInt(EdCaja.Caption);
               FValidar.Origen := OrigenM;               
               FValidar.Tipo := TipoCaptacion;
               FValidar.Operacion := 2;
               FValidar.Agencia := Agencia;
               FValidar.Cuenta := StrToInt(EdNumeroCer.Text);
               FValidar.Documento := StrToInt(EdDocumentoCer.Text);
               FValidar.Billetes := TBilletes;
               FValidar.Monedas := TMonedas;
               FValidar.Cheques := TCheques;
               Validar := FValidar;
               ShowModal;
               Free;
           end;

           MessageDlg('Saldar Realizado con Exito!',mtInformation,[mbok],0);
         end
        else
           MessageDlg('Error al Realizar la Salida, consulte con sistemas',mtError,[mbcancel],0);

        Timer.Enabled := True;

        CmdRetornar.Click;

end;

function TfrmOperacionesCaja.GrabarIngreso: Boolean;
var I:Integer;
    PRecord:PListaDev;
    ARecord:PLista;
begin
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimiento" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:HUELLA,:ID_PERSONA)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCer.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := 0;
              IBOtros.ParamByName('BILLETES').AsCurrency := TBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := TMonedas;
              IBOtros.ParamByName('CHEQUES').AsCurrency := TCheques;
              IBOtros.ParamByName('HUELLA').AsInteger := 0;
              IBOtros.ParamByName('ID_PERSONA').AsString := edDocumentoOpCertUsuario.Text;

              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
                 end;
              except
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
              end;

// Grabar Cheque en Caja
              if TCheques > 0 then
              begin
                IBOtros.Close;
                IBOtros.SQL.Clear;
                IBOtros.SQL.Add('insert into "caj$cheques" values(');
                IBOtros.SQL.Add(':ID_CAJA,:ID_BANCO,:NUMERO_CHEQUE,:FECHA,:PLAZA,');
                IBOtros.SQL.Add(':VALOR,:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
                IBOtros.SQL.Add(':DIGITO_CUENTA,:DOCUMENTO,:ENVIADO,:FECHA_ENVIO)');
                IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
                IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
                IBOtros.ParamByName('FECHA').AsDate := StrToDate(EdFecha.Caption);
                IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCer.Text;
                IBOtros.ParamByName('ENVIADO').AsInteger := 0;
                IBOtros.ParamByName('FECHA_ENVIO ').Clear;
                for I := 0 to ListaCheques.Count - 1 do
                begin
                   ARecord := ListaCheques.Items[I];
                   IBOtros.ParamByName('ID_BANCO').AsInteger := ARecord^.Codigo;
                   IBOtros.ParamByName('NUMERO_CHEQUE').AsInteger := StrToInt(ARecord^.Numero);
                   IBOtros.ParamByName('PLAZA').AsString := ARecord^.Plaza;
                   IBOtros.ParamByName('VALOR').AsCurrency := ARecord^.Valor;
                   try
                    IBOtros.ExecQuery;
                    if IBOtros.RowsAffected < 1 then
                    begin
                       MessageDlg('Error Grabando Cheque en caj$cheques',mtError,[mbcancel],0);
                       Result := False;
                       IBOtros.Transaction.RollbackRetaining;
                       Exit;
                    end;
                   except
                       MessageDlg('Error Grabando Cheque en caj$cheques',mtError,[mbcancel],0);
                       Result := False;
                       IBOtros.Transaction.RollbackRetaining;
                       Exit;
                   end;

                end; // del for
               end; // del if

// Fin Grabar Cheque en Caja

//Actualizar Estado de la Captación

               with IBOtros do
               begin
                Close;
                SQL.Clear;
                SQL.Add('update "cap$maestro" ');
                SQL.Add('set ID_ESTADO = 1 ');
                SQL.Add('where');
                SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
                try
                  ExecQuery;
                  if RowsAffected < 1 then
                  begin
                    MessageDlg('No se pudo actualizar la Captación',mtError,[mbcancel],0);
                    Result:=False;
                    Exit;
                  end
                except
                    MessageDlg('No se pudo actualizar la Captación',mtError,[mbcancel],0);
                    Result:=False;
                    Exit;
                end;
               end;

               dmGeneral.IBTransaction1.CommitRetaining;

Result := True;

end;

function TfrmOperacionesCaja.GrabarSalida: boolean;
var I:Integer;
begin
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimiento" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:HUELLA,:ID_PERSONA)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCer.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := 0;
              IBOtros.ParamByName('BILLETES').AsCurrency := TBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := TMonedas;
              IBOtros.ParamByName('CHEQUES').AsCurrency := TCheques;
              IBOtros.ParamByName('HUELLA').AsInteger := 0;
              IBOtros.ParamByName('ID_PERSONA').AsString := '';              
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
                 end;
              except
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
              end;

// Grabar Arqueo
{
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientoarqueo" values (');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO,');
              IBOtros.SQL.Add(':ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)');

              IBOtros1.Close;
              IBOtros1.SQL.Clear;
              IBOtros1.SQL.Add('update "caj$arqueos"');
              IBOtros1.SQL.Add('set CANTIDAD_DENOMINACION = CANTIDAD_DENOMINACION - :CANTIDAD_DENOMINACION,');
              IBOtros1.SQL.Add('VALOR_DENOMINACION = VALOR_DENOMINACION - :VALOR_DENOMINACION ');
              IBOtros1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBOtros1.SQL.Add('ID_CAJA = :ID_CAJA and');
              IBOtros1.SQL.Add('FECHA_MOV = :FECHA_MOV and');
              IBOtros1.SQL.Add('ID_DENOMINACION = :ID_DENOMINACION');

              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;              
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCer.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to Length(LDenominacionCer) - 1 do
               begin
                   if LDenominacionCer[I].Cantidad.Value  > 0 then
                    begin
                     IBOtros.Close;
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionCer[I].IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionCer[I].Cantidad.Value;
                     try
                        IBOtros.ExecQuery;
                        if IBOtros.RowsAffected < 1 then
                         begin
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(LDenominacionCer[I].IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(LDenominacionCer[I].IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionCer[I].IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionCer[I].Cantidad.Value;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
                    end;
               end;

               if TMonedas > 0 then
               begin
                  IBOtros.ParamByName('ID_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;
                  try
                      IBOtros.ExecQuery;
                      if IBOtros.RowsAffected < 1 then
                       begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                       end;
                   except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                   end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;

// Fin Arqueo
}
//Actualizar Estado de la Captación

               with IBOtros do
               begin
                Close;
                SQL.Clear;
                SQL.Add('update "cap$maestro" ');
                SQL.Add('set ID_ESTADO = 2 ');
                SQL.Add('where');
                SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
                try
                  ExecQuery;
                  if RowsAffected < 1 then
                  begin
                    MessageDlg('No se pudo actualizar la Captación',mtError,[mbcancel],0);
                    Result:=False;
                    Exit;
                  end
                except
                    MessageDlg('No se pudo actualizar la Captación',mtError,[mbcancel],0);
                    Result:=False;
                    Exit;
                end;
               end;

               dmGeneral.IBTransaction1.CommitRetaining;

Result := True;

end;

procedure TfrmOperacionesCaja.CmdColRetornarClick(Sender: TObject);
begin
        Opcion := 1;
        PageControl1.ActivePage := TabProductos;
end;

procedure TfrmOperacionesCaja.EdDocumentoGenKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmOperacionesCaja.EdDocumentoGenExit(Sender: TObject);
begin
       if EdDocumentoGen.Text <> '' then
       begin
          EdDocumentoGen.Text := Format('%.8d',[StrToInt(EdDocumentoGen.Text)]);
          PanelValoresGen.Enabled := True;
          EdTotalBilletesGen.SetFocus;
       end
       else
          MessageDlg('Debe diligenciar el número de documento',mtError,[mbcancel],0);
end;

procedure TfrmOperacionesCaja.CmdOtrosIngresarClick(Sender: TObject);
begin
        CapOperacion := 'L';
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBGenerales.Enabled := False;
        CmdOKGenerales.Caption := '&Ingresar';
        EdEstadoActualGen.Caption := 'En Ingresos';
        CmdVerChequesGen.Enabled := True;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionesGenerales;
        PageControl.Visible := True;
        EdDocumentoGen.SetFocus;

end;

procedure TfrmOperacionesCaja.CmdGeneralesClick(Sender: TObject);
begin
        OrigenM := 9;
        TipoCaptacion := 0;
        Opcion := 6;
        GBGenerales.Caption := 'Generales';
        Caption := 'Operaciones de Caja - GENERALES';        
        PageControl1.ActivePage := TabGenerales;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;

end;

procedure TfrmOperacionesCaja.CmdOtrosRetornarClick(Sender: TObject);
begin
        Opcion := 1;
        PageControl1.ActivePage := TabProductos;
end;

procedure TfrmOperacionesCaja.ValorDenominacionGen(Sender: TObject);
var Valor:Currency;
    Pos:Integer;
    I:Integer;
begin
       Pos := TJvIntegerEdit(Sender).Tag;
       TSumaBilletes:=0;
       for I := 0 to Length(LDenominacionGen) - 1 do
       begin
           Valor := LDenominacionGen[I].vDenominacion * LDenominacionGen[I].Cantidad.Value;
           TSumaBilletes := TSumaBilletes + Valor;
       end;
       STotalBilletesGen.Caption := FormatCurr('$#,0.00',TSumaBilletes);
       SDiferenciaGen.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);

end;

procedure TfrmOperacionesCaja.CmdOtrosRetirarClick(Sender: TObject);
begin
        CapOperacion := 'M';
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBGenerales.Enabled := False;
        CmdOKGenerales.Caption := '&Retirar';
        EdEstadoActualGen.Caption := 'En Retiro';
        CmdVerChequesGen.Enabled := True;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionesGenerales;
        PageControl.Visible := True;
        EdDocumentoGen.SetFocus;

end;

procedure TfrmOperacionesCaja.TabsNoVisibles;
begin
        TabOperacionCaptacion.TabVisible := False;
        TabOperacionCertificado.TabVisible := False;
        TabOperacionesGenerales.TabVisible := False;
        TabOperacionesColocaciones.TabVisible := False;
        TabOperacionesOtros.TabVisible := False;
        TabVacio.TabVisible := False;
end;

procedure TfrmOperacionesCaja.CmdVerDevolucionClick(Sender: TObject);
var frmArqueoDevolucion:TfrmArqueoDevolucion;
begin
    frmArqueoDevolucion:=TfrmArqueoDevolucion.Create(Self);
    frmArqueoDevolucion.ListaDevolucion := ListaDevolucion;
    frmArqueoDevolucion.MonedasDevolucion := MonedasDevolucion;
    if frmArqueoDevolucion.ShowModal = mrok then
    begin
        ListaDevolucion := frmArqueoDevolucion.ListaDevolucion;
        MonedasDevolucion := frmArqueodevolucion.MonedasDevolucion;
        EdDevolucionCap.Value := frmArqueoDevolucion.ValorDevolucion;
    end;
end;

procedure TfrmOperacionesCaja.EdDevolucionCapChange(Sender: TObject);
begin
        TDevolucion := EdDevolucionCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdDevolucionCapExit(Sender: TObject);
begin
        if (EdDevolucionCapag.Value > 0) and
           (CapOperacion = 'C') then
           CmdVerDevolucionag.Click;
end;

procedure TfrmOperacionesCaja.CerosVariables;
begin
  TBilletes:=0;
  TDevolucion :=0;
  TMonedas := 0;
  TCheques := 0;
  MonedasDevolucion := 0;
  TGeneral:=0;
  TDevolucion := 0;

  vAbonoCapital := 0;
  EdAbonoCapital.Text := '';
//  EdInteresCobrado.Text := '';
//  EdInteresDevuelto.Text := '';

  vInteresCobrado:=0;
  vInteresDevuelto:=0;
  vTasaDevCob := 0;
  vPapeleria := 0;

  EdTotalColManual.Caption := '';


{  EdAbonoInteresContingente.Text := '';
  EdAbonoInteresCausado.Text := '';
  EdAbonoInterescorriente.Text := '';
  EdAbonoInteresAnticipado.Text := '';
  EdAbonoInteresMora.Text := '';
  EdAbonoCostas.Text := '';
  EdAbonoHonorarios.Text := '';

  EdDiasAplicadosContingente.Text := '';
  EdDiasAplicadosCausado.Text := '';
  EdDiasAplicadosCorriente.Text := '';
  EdDiasAplicadosAnticipado.Text := '';
  EdDiasAplicadosMora.Text := '';

  EdTasaAplicadaContingente.Text := '';
  EdTasaAplicadaCausado.Text := '';
  EdTasaAplicadaCorriente.Text := '';
  EdTasaAplicadaAnticipado.Text := '';
  EdTasaAplicadaMora.Text := '';

  vAbonoInteresContingente :=0;
  vDiasContingente:=0;
  vTasaContingente:=0;

  vAbonoInteresCausado:=0;
  vDiasCausado:=0;
  vTasaCausado:=0;

  vAbonoInteresCorriente:=0;
  vDiasCorriente:=0;
  vTasaCorriente:=0;

  vAbonoInteresAnticipado:=0;
  vDiasAnticipado:=0;
  vTasaAnticipado:=0;

  vAbonoInteresMora:=0;
  vDiasMora := 0;
  vTasaMora := 0;

  vhonorarios := 0;
  vcostas := 0;
}
  Limpiarmanualintereses;

  CapitalaPagar:=0;
  InteresaPagar:=0;
  DebitoM:=0;
  CreditoM:=0;
  TotalDebitosM:=0;
  TotalCreditosM:=0;
  Devolucion:=False;
  TasaLiquidacion:=0;
  Caja:=0;
  vTotalInteres:=0;
  PagoTotal.Checked := False;
  CredPagoTotal := False;
  TasaC:=0;

end;

procedure TfrmOperacionesCaja.EdDevolucionGenChange(Sender: TObject);
begin
        TDevolucion := EdDevolucionGen.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;

procedure TfrmOperacionesCaja.CmdVerDevolucionCerClick(Sender: TObject);
var frmArqueoDevolucion:TfrmArqueoDevolucion;
begin
    frmArqueoDevolucion:=TfrmArqueoDevolucion.Create(Self);
    frmArqueoDevolucion.ListaDevolucion := ListaDevolucion;
    frmArqueoDevolucion.MonedasDevolucion := MonedasDevolucion;
    if frmArqueoDevolucion.ShowModal = mrok then
    begin
        ListaDevolucion := frmArqueoDevolucion.ListaDevolucion;
        MonedasDevolucion := frmArqueodevolucion.MonedasDevolucion;
        EdDevolucionCer.Value := frmArqueoDevolucion.ValorDevolucion;
    end;
end;

procedure TfrmOperacionesCaja.CmdVerDevolucionGenClick(Sender: TObject);
var frmArqueoDevolucion:TfrmArqueoDevolucion;
begin
    frmArqueoDevolucion:=TfrmArqueoDevolucion.Create(Self);
    frmArqueoDevolucion.ListaDevolucion := ListaDevolucion;
    frmArqueoDevolucion.MonedasDevolucion := MonedasDevolucion;
    if frmArqueoDevolucion.ShowModal = mrok then
    begin
        ListaDevolucion := frmArqueoDevolucion.ListaDevolucion;
        MonedasDevolucion := frmArqueodevolucion.MonedasDevolucion;
        EdDevolucionGen.Value := frmArqueoDevolucion.ValorDevolucion;
    end;

end;

procedure TfrmOperacionesCaja.EdDevolucionCerChange(Sender: TObject);
begin
        TDevolucion := EdDevolucionCer.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;

procedure TfrmOperacionesCaja.EdDevolucionCerExit(Sender: TObject);
begin
        if (EdDevolucionCer.Value > 0) and
           (CapOperacion = 'I') then
           CmdVerDevolucionCer.Click;

end;

procedure TfrmOperacionesCaja.EdDevolucionGenExit(Sender: TObject);
begin
        if (EdDevolucionGen.Value > 0) and
           (CapOperacion = 'L') then
           CmdVerDevolucionGen.Click;

end;

procedure TfrmOperacionesCaja.RealizarGenEntrada;
begin
        if EdChequesGen.Value <> 0 then
          if ListaCheques.Count = 0 then
          begin
            MessageDlg('Debe diligenciar la relación de cheques',mtError,[mbcancel],0);
            CmdVerChequesGen.Click;
          end;

        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara la consignación',mtInformation,[mbok],0);
           EdChequesGen.SetFocus;
           Exit;
        end;

        Timer.Enabled := False;

        if GrabarGenEntrada then
        begin
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := StrToDate(EdFecha.Caption);
               FValidar.Caja := StrToInt(EdCaja.Caption);
               FValidar.Origen := OrigenM;
               FValidar.Tipo := 0;
               FValidar.Operacion := 1;
               FValidar.Agencia := Agencia;
               FValidar.Cuenta := 0;
               FValidar.Documento := StrToInt(EdDocumentoGen.Text);
               FValidar.Billetes := TBilletes;
               FValidar.Monedas := TMonedas;
               FValidar.Cheques := TCheques;
               Validar := FValidar;
               ShowModal;
               Free;
           end;
           MessageDlg('Ingreso Realizado con Exito!',mtInformation,[mbok],0);
        end
        else
           MessageDlg('Error al Realizar el Ingreso, consulte con sistemas',mtError,[mbcancel],0);

        Timer.Enabled := True;

        CmdRetornar.Click;


end;

procedure TfrmOperacionesCaja.RealizarGenSalida;
begin
       if TGeneral > SaldoEnCaja then
         begin
            MessageDlg('No Tiene Disponibilidad para esta salida' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            CmdOKGenerales.Enabled := True;
            Exit;
         end;

        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara ninguna salida',mtInformation,[mbok],0);
           CmdOKGenerales.Enabled := True;
           Exit;
        end;

        Timer.Enabled := False;

        if GrabarGenSalida then
        begin
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := StrToDate(EdFecha.Caption);
               FValidar.Caja := StrToInt(EdCaja.Caption);
               FValidar.Origen := OrigenM;
               FValidar.Tipo := 0;
               FValidar.Operacion := 2;
               FValidar.Agencia := Agencia;
               FValidar.Cuenta := 0;
               FValidar.Documento := StrToInt(EdDocumentoGen.Text);
               FValidar.Billetes := TBilletes;
               FValidar.Monedas := TMonedas;
               FValidar.Cheques := TCheques;
               Validar := FValidar;
               ShowModal;
               Free;
           end;
           MessageDlg('Salida Realizada con Exito!',mtInformation,[mbok],0);
        end
        else
           MessageDlg('Error al Realizar la Salida, consulte con sistemas',mtError,[mbcancel],0);

        Timer.Enabled := True;

        CmdRetornar.Click;


end;

function TfrmOperacionesCaja.GrabarGenEntrada: Boolean;
var I:Integer;
    PRecord:PListaDev;
    ARecord:PLista;
begin
//Grabar Movimiento

              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimiento" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:HUELLA,:ID_PERSONA)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := 0;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoGen.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
              IBOtros.ParamByName('BILLETES').AsCurrency := TBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := TMonedas;
              IBOtros.ParamByName('CHEQUES').AsCurrency := TCheques;
              IBOtros.ParamByName('HUELLA').AsInteger := 0;
              IBOtros.ParamByName('ID_PERSONA').AsString := '';                            
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
                 end;
              except
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
              end;

// Grabar Cheques
              if TCheques > 0 then begin
                IBOtros.Close;
                IBOtros.SQL.Clear;
                IBOtros.SQL.Add('insert into "caj$cheques" values(');
                IBOtros.SQL.Add(':ID_CAJA,:ID_BANCO,:NUMERO_CHEQUE,:FECHA,:PLAZA,');
                IBOtros.SQL.Add(':VALOR,:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
                IBOtros.SQL.Add(':DIGITO_CUENTA,:DOCUMENTO,:ENVIADO,:FECHA_ENVIO)');
                IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
                IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := 0;
                IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := 0;
                IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := 0;
                IBOtros.ParamByName('FECHA').AsDate := StrToDate(EdFecha.Caption);
                IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoGen.Text;
                IBOtros.ParamByName('ENVIADO').AsInteger := 0;
                IBOtros.ParamByName('FECHA_ENVIO ').Clear;
                for I := 0 to ListaCheques.Count - 1 do
                begin
                   ARecord := ListaCheques.Items[I];
                   IBOtros.ParamByName('ID_BANCO').AsInteger := ARecord^.Codigo;
                   IBOtros.ParamByName('NUMERO_CHEQUE').AsInteger := StrToInt(ARecord^.Numero);
                   IBOtros.ParamByName('PLAZA').AsString := ARecord^.Plaza;
                   IBOtros.ParamByName('VALOR').AsCurrency := ARecord^.Valor;
                   try
                    IBOtros.ExecQuery;
                    if IBOtros.RowsAffected < 1 then
                    begin
                       MessageDlg('Error Grabando Cheque en caj$cheques',mtError,[mbcancel],0);
                       Result := False;
                       IBOtros.Transaction.RollbackRetaining;
                       Exit;
                    end
                   except
                       MessageDlg('Error Grabando Cheque en caj$cheques',mtError,[mbcancel],0);
                       Result := False;
                       IBOtros.Transaction.RollbackRetaining;
                       Exit;
                   end;
                end; // del for
               end; // if


// Grabar Arqueo
{
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientoarqueo" values (');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO,');
              IBOtros.SQL.Add(':ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)');

              IBOtros1.Close;
              IBOtros1.SQL.Clear;
              IBOtros1.SQL.Add('update "caj$arqueos"');
              IBOtros1.SQL.Add('set CANTIDAD_DENOMINACION = CANTIDAD_DENOMINACION + :CANTIDAD_DENOMINACION,');
              IBOtros1.SQL.Add('VALOR_DENOMINACION = VALOR_DENOMINACION + :VALOR_DENOMINACION ');
              IBOtros1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBOtros1.SQL.Add('ID_CAJA = :ID_CAJA and');
              IBOtros1.SQL.Add('FECHA_MOV = :FECHA_MOV and');
              IBOtros1.SQL.Add('ID_DENOMINACION = :ID_DENOMINACION');

              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := 0;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;              
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoGen.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to Length(LDenominacionGen) - 1 do
               begin
                    if LDenominacionGen[I].Cantidad.Value  > 0 then
                    begin
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionGen[I].IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionGen[I].Cantidad.Value;
                     try
                        IBOtros.ExecQuery;
                        if IBOtros.RowsAffected < 1 then
                         begin
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionGen[I].IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionGen[I].Cantidad.Value;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                    end;
               end;

               if TMonedas > 0 then
               begin
                  IBOtros.ParamByName('ID_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;
                  try
                      IBOtros.ExecQuery;
                      if IBOtros.RowsAffected < 1 then
                       begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                       end;
                   except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                   end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;


//Grabar Devolucion

              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$devolucionarqueo" values (');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO,');
              IBOtros.SQL.Add(':ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)');

              IBOtros1.Close;
              IBOtros1.SQL.Clear;
              IBOtros1.SQL.Add('update "caj$arqueos"');
              IBOtros1.SQL.Add('set CANTIDAD_DENOMINACION = CANTIDAD_DENOMINACION - :CANTIDAD_DENOMINACION,');
              IBOtros1.SQL.Add('VALOR_DENOMINACION = VALOR_DENOMINACION - :VALOR_DENOMINACION ');
              IBOtros1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBOtros1.SQL.Add('ID_CAJA = :ID_CAJA and');
              IBOtros1.SQL.Add('FECHA_MOV = :FECHA_MOV and');
              IBOtros1.SQL.Add('ID_DENOMINACION = :ID_DENOMINACION');

              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := 0;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoGen.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to ListaDevolucion.Count - 1 do
               begin
                   PRecord := ListaDevolucion.Items[I];
                   if PRecord^.Cantidad > 0 then
                    begin
                     IBOtros.Close;
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := PRecord^.IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := Precord^.Cantidad;
                     try
                        IBOtros.ExecQuery;
                        if IBOtros.RowsAffected < 1 then
                         begin
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(PRecord^.IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(PRecord^.IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := PRecord^.IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := Precord^.Cantidad;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
                    end;
               end;

               if MonedasDevolucion > 0 then
               begin
                  IBOtros.ParamByName('ID_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := MonedasDevolucion;
                  try
                      IBOtros.ExecQuery;
                      if IBOtros.RowsAffected < 1 then
                       begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo devolucion',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                       end;
                   except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo devolucion',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                   end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := MonedasDevolucion;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devolución',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devolución',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;

// Fin Devolucion Arqueo
}
               dmGeneral.IBTransaction1.CommitRetaining;

Result := True;


end;

function TfrmOperacionesCaja.GrabarGenSalida: Boolean;
var I:Integer;
begin
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimiento" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:HUELLA,:ID_PERSONA)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := 0;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoGen.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
              IBOtros.ParamByName('BILLETES').AsCurrency := TBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := TMonedas;
              IBOtros.ParamByName('CHEQUES').AsCurrency := TCheques;
              IBOtros.ParamByName('HUELLA').AsInteger := 0;
              IBOtros.ParamByName('ID_PERSONA').AsString := '';                            
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
                 end;
              except
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
              end;

// Grabar Arqueo
{
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientoarqueo" values (');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,:DOCUMENTO,');
              IBOtros.SQL.Add(':ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)');

              IBOtros1.Close;
              IBOtros1.SQL.Clear;
              IBOtros1.SQL.Add('update "caj$arqueos"');
              IBOtros1.SQL.Add('set CANTIDAD_DENOMINACION = CANTIDAD_DENOMINACION - :CANTIDAD_DENOMINACION,');
              IBOtros1.SQL.Add('VALOR_DENOMINACION = VALOR_DENOMINACION - :VALOR_DENOMINACION ');
              IBOtros1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBOtros1.SQL.Add('ID_CAJA = :ID_CAJA and');
              IBOtros1.SQL.Add('FECHA_MOV = :FECHA_MOV and');
              IBOtros1.SQL.Add('ID_DENOMINACION = :ID_DENOMINACION');

              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := 0;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := 0;
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCap.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to Length(LDenominacionGen) - 1 do
               begin
                   if LDenominacionGen[I].Cantidad.Value  > 0 then
                    begin
                     IBOtros.Close;
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionGen[I].IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionGen[I].Cantidad.Value;
                     try
                        IBOtros.ExecQuery;
                        if IBOtros.RowsAffected < 1 then
                         begin
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(LDenominacionGen[I].IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(LDenominacionGen[I].IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionGen[I].IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionGen[I].Cantidad.Value;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
                    end;
               end;

               if TMonedas > 0 then
               begin
                  IBOtros.ParamByName('ID_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;
                  try
                      IBOtros.ExecQuery;
                      if IBOtros.RowsAffected < 1 then
                       begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                       end;
                   except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                   end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;

// Fin Arqueo
}
               dmGeneral.IBTransaction1.CommitRetaining;

Result := True;


end;

procedure TfrmOperacionesCaja.CmdOtrosClick(Sender: TObject);
begin
        OrigenM := 8;
        Opcion := 5;
        GBOtros.Caption := 'Servicios';
        Caption := 'Operaciones de Caja - OTROS SERVICIOS';        
        PageControl1.ActivePage := TabOtros;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;

end;

procedure TfrmOperacionesCaja.CmdSerAguaClick(Sender: TObject);
begin
        CapOperacion := 'O';
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBOtros.Enabled := False;
        CmdOKOtros.Caption := '&Grabar';
        EdRecaudo.Caption := 'Agua';        
        CmdVerChequesOtr.Enabled := False;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionesOtros;
        PageControl.Visible := True;
        EdDocumentoOtr.SetFocus;

end;

procedure TfrmOperacionesCaja.CmdSerMunicipalClick(Sender: TObject);
begin
        CapOperacion := 'P';
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBOtros.Enabled := False;
        CmdOKOtros.Caption := '&Grabar';
        EdRecaudo.Caption := 'Municipales';
        CmdVerChequesOtr.Enabled := False;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionesOtros;
        PageControl.Visible := True;
        EdDocumentoOtr.SetFocus;

end;

procedure TfrmOperacionesCaja.ValorDenominacionOtr(Sender: TObject);
var Valor:Currency;
    Pos:Integer;
    I:Integer;
begin
       Pos := TJvIntegerEdit(Sender).Tag;
       Valor := LDenominacionOtr[Pos].vDenominacion * TJvIntegerEdit(Sender).Value;
       LDenominacionOtr[Pos].Total.Caption := FormatCurr('#,0.00',Valor);
       TSumaBilletes :=0;
       for I := 0 to Length(LDenominacionOtr) - 1 do
       begin
           Valor := LDenominacionOtr[I].vDenominacion * LDenominacionOtr[I].Cantidad.Value;
           TSumaBilletes := TSumaBilletes + Valor;
       end;
       STotalBilletesOtr.Caption := FormatCurr('$#,0.00',TSumaBilletes);
       SDiferenciaOtr.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);

end;

procedure TfrmOperacionesCaja.CmdVerDevolucionOtrClick(Sender: TObject);
var frmArqueoDevolucion:TfrmArqueoDevolucion;
begin
    frmArqueoDevolucion:=TfrmArqueoDevolucion.Create(Self);
    frmArqueoDevolucion.ListaDevolucion := ListaDevolucion;
    frmArqueoDevolucion.MonedasDevolucion := MonedasDevolucion;
    if frmArqueoDevolucion.ShowModal = mrok then
    begin
        ListaDevolucion := frmArqueoDevolucion.ListaDevolucion;
        MonedasDevolucion := frmArqueodevolucion.MonedasDevolucion;
        EdDevolucionOtr.Value := frmArqueoDevolucion.ValorDevolucion;
    end;

end;

procedure TfrmOperacionesCaja.EdDevolucionOtrExit(Sender: TObject);
begin
        if (EdDevolucionOtr.Value > 0) then
           CmdVerDevolucionOtr.Click;

end;

procedure TfrmOperacionesCaja.RealizarOtrEntrada;
begin
        if EdChequesOtr.Value <> 0 then
          if ListaCheques.Count = 0 then
          begin
            MessageDlg('Debe diligenciar la relación de cheques',mtError,[mbcancel],0);
            CmdVerChequesOtr.Click;
          end;

        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara la consignación',mtInformation,[mbok],0);
           EdChequesOtr.SetFocus;
           Exit;
        end;

        Timer.Enabled := False;

        if GrabarOtrEntrada then
        begin
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := StrToDate(EdFecha.Caption);
               FValidar.Caja := StrToInt(EdCaja.Caption);
               FValidar.Origen := OrigenM;
               FValidar.Tipo := 0;
               FValidar.Operacion := 1;
               FValidar.Agencia := Agencia;
               FValidar.Cuenta := 0;
               FValidar.Documento := StrToInt(EdDocumentoOtr.Text);
               FValidar.Billetes := TBilletes;
               FValidar.Monedas := TMonedas;
               FValidar.Cheques := TCheques;
               Validar := FValidar;
               ShowModal;
               Free;
           end;
           MessageDlg('Ingreso Realizado con Exito!',mtInformation,[mbok],0);
         end
        else
           MessageDlg('Error al Realizar el Ingreso, consulte con sistemas',mtError,[mbcancel],0);

        Timer.Enabled := True;

        CmdRetornar.Click;


end;

function TfrmOperacionesCaja.GrabarOtrEntrada: Boolean;
var I:Integer;
    PRecord:PListaDev;
    Recaudo:Integer;
begin
        Recaudo := 0;
        if CapOperacion = 'O' then Recaudo := 1;
        if CapOperacion = 'P' then Recaudo := 2;
//Grabar Movimiento

              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$recaudos" values(');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,');
              IBOtros.SQL.Add(':ORIGEN_MOVIMIENTO,:ID_RECAUDO,');
              IBOtros.SQL.Add(':DOCUMENTO,:BILLETES,:MONEDAS)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;              
              IBOtros.ParamByName('ID_RECAUDO').AsInteger := Recaudo;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoOtr.Text;
              IBOtros.ParamByName('BILLETES').AsCurrency := TBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := TMonedas;
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
                 end;
              except
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
              end;

// Grabar Cheques



// Grabar Arqueo
{
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$recaudosarqueo" values (');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,');
              IBOtros.SQL.Add(':ORIGEN_MOVIMIENTO,:ID_RECAUDO,:DOCUMENTO,');
              IBOtros.SQL.Add(':ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)');

              IBOtros1.Close;
              IBOtros1.SQL.Clear;
              IBOtros1.SQL.Add('update "caj$arqueos"');
              IBOtros1.SQL.Add('set CANTIDAD_DENOMINACION = CANTIDAD_DENOMINACION + :CANTIDAD_DENOMINACION,');
              IBOtros1.SQL.Add('VALOR_DENOMINACION = VALOR_DENOMINACION + :VALOR_DENOMINACION ');
              IBOtros1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBOtros1.SQL.Add('ID_CAJA = :ID_CAJA and');
              IBOtros1.SQL.Add('FECHA_MOV = :FECHA_MOV and');
              IBOtros1.SQL.Add('ID_DENOMINACION = :ID_DENOMINACION');

              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_RECAUDO').AsInteger := Recaudo;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoOtr.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to Length(LDenominacionOtr) - 1 do
               begin
                    if LDenominacionOtr[I].Cantidad.Value  > 0 then
                    begin
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionOtr[I].IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionOtr[I].Cantidad.Value;
                     try
                        IBOtros.ExecQuery;
                        if IBOtros.RowsAffected < 1 then
                         begin
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionOtr[I].IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionOtr[I].Cantidad.Value;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                    end;
               end;

               if TMonedas > 0 then
               begin
                  IBOtros.ParamByName('ID_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;
                  try
                      IBOtros.ExecQuery;
                      if IBOtros.RowsAffected < 1 then
                       begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                       end;
                   except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando arqueo del movimiento',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                   end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := TMonedas;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;


//Grabar Devolucion

              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$devolucionrecaudosarqueo" values (');
              IBOtros.SQL.Add(':ID_AGENCIA,:ID_CAJA,:FECHA_MOV,');
              IBOtros.SQL.Add(':ORIGEN_MOVIMIENTO,:ID_RECAUDO,:DOCUMENTO,');
              IBOtros.SQL.Add(':ID_DENOMINACION,:CANTIDAD_DENOMINACION,:VALOR_DENOMINACION)');

              IBOtros1.Close;
              IBOtros1.SQL.Clear;
              IBOtros1.SQL.Add('update "caj$arqueos"');
              IBOtros1.SQL.Add('set CANTIDAD_DENOMINACION = CANTIDAD_DENOMINACION - :CANTIDAD_DENOMINACION,');
              IBOtros1.SQL.Add('VALOR_DENOMINACION = VALOR_DENOMINACION - :VALOR_DENOMINACION ');
              IBOtros1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBOtros1.SQL.Add('ID_CAJA = :ID_CAJA and');
              IBOtros1.SQL.Add('FECHA_MOV = :FECHA_MOV and');
              IBOtros1.SQL.Add('ID_DENOMINACION = :ID_DENOMINACION');

              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_RECAUDO').AsInteger := Recaudo;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoOtr.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to ListaDevolucion.Count - 1 do
               begin
                   PRecord := ListaDevolucion.Items[I];
                   if PRecord^.Cantidad > 0 then
                    begin
                     IBOtros.Close;
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := PRecord^.IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := Precord^.Cantidad;
                     try
                        IBOtros.ExecQuery;
                        if IBOtros.RowsAffected < 1 then
                         begin
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(PRecord^.IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error grabando arqueo del movimiento:'+IntToStr(PRecord^.IdDenominacion),mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := PRecord^.IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := Precord^.Cantidad;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
                    end;
               end;

               if MonedasDevolucion > 0 then
               begin
                  IBOtros.ParamByName('ID_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                  IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := MonedasDevolucion;
                  try
                      IBOtros.ExecQuery;
                      if IBOtros.RowsAffected < 1 then
                       begin
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo devolucion',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                       end;
                   except
                        IBOtros.Transaction.RollbackRetaining;
                        MessageDlg('Error grabando monedas del arqueo devolucion',mtError,[mbcancel],0);
                        Result := False;
                        Exit;
                   end;

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := 0;
                     IBOtros1.ParamByName('VALOR_DENOMINACION').AsCurrency := MonedasDevolucion;

                     try
                        IBOtros1.ExecQuery;
                        if IBOtros1.RowsAffected < 1 then
                         begin
                          IBOtros1.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devolución',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devolución',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;

// Fin Devolucion Arqueo
}
               dmGeneral.IBTransaction1.CommitRetaining;

Result := True;


end;

procedure TfrmOperacionesCaja.CmdOkOtrosClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Realizar la Operación',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

        CmdOkOtros.Enabled := False;
        RealizarOtrEntrada;

end;

procedure TfrmOperacionesCaja.CmdOKGeneralesClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Realizar la Operación',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

        CmdOKGenerales.Enabled := False;
        if CapOperacion = 'L' then
           RealizarGenEntrada
        else
           RealizarGenSalida;
end;

procedure TfrmOperacionesCaja.CmdColAbonoClick(Sender: TObject);
begin
        CapOperacion := 'A';
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBColocaciones.Enabled := False;
        EdDevolucionCol.Enabled := True;
        CmdVerDevolucionCol.Enabled := True;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionesColocaciones;
        PageControl.Visible := True;
        InicializarCol;
        EdNumeroColocacion.SetFocus;
        PageColocacion.ActivePage := TabCol1;
end;

procedure TfrmOperacionesCaja.EdNumeroColocacionExit(Sender: TObject);
var TasaEfectiva:Double;
TasaAplicada : Double;
Saldo : Currency;
Cuotas: Integer;
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;

           colocacion := trim(EdNumeroColocacion.Text);
           EdNumeroColocacion.Text := colocacion;

        If EdNumeroColocacion.Text = '' then Exit;

        with IBVerificaTmp do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$extractotmp" where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ExecQuery;
          if RecordCount > 0 then begin
            MessageDlg('Colocación con Liquidación Temporal para Desembolso',mtError,[mbOK],0);
            CmdRetornar.Click;
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
                SQL.Add('"col$colocacion".NUMERO_CUENTA,');
                SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
                SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
                SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO_ACTUAL,');
                SQL.Add('"col$colocacion".PLAZO_COLOCACION,');
                SQL.Add('"col$colocacion".TIPO_INTERES,');
                SQL.Add('"col$tasasvariables".DESCRIPCION_TASA,');
                SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
                SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
                SQL.Add('"col$colocacion".TASA_INTERES_MORA,');
                SQL.Add('"col$colocacion".PUNTOS_INTERES,');
                SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
                SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
                SQL.Add('"col$colocacion".PERIODO_GRACIA,');
                SQL.Add('"col$colocacion".DIAS_PRORROGADOS,');
                SQL.Add('"col$colocacion".VALOR_CUOTA,');
                SQL.Add('"col$tiposcuota".CAPITAL,');
                SQL.Add('"col$tiposcuota".INTERES,');
                SQL.Add('"col$tiposcuota".TIPO_CUOTA,');
                SQL.Add('"col$colocacion".FECHA_CAPITAL,');
                SQL.Add('"col$colocacion".FECHA_INTERES,');
                SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
                SQL.Add('"col$estado".ES_PREJURIDICO,');
                SQL.Add('"col$estado".ES_JURIDICO,');
                SQL.Add('"col$estado".ES_CASTIGADO,');
                SQL.Add('"col$estado".ES_NOVISADO,');
                SQL.Add('"col$estado".ES_ANULADO,');
                SQL.Add('"col$estado".ES_CANCELADO,');
                SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
                SQL.Add('"col$inversion".DESCRIPCION_INVERSION,');
                SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
                SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,');
                SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
                SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
                SQL.Add('"gen$persona".NOMBRE,');
                SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION ');
                SQL.Add(' FROM ');
                SQL.Add('"col$colocacion" ');
                SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION) ');
                SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION) ');
                SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO) ');
                SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION) ');
                SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA) ');
                SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA) ');
                SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
                SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
                SQL.Add('LEFT OUTER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) ');
                SQL.Add(' JOIN "gen$tiposidentificacion" ON ("col$colocacion".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION) ');
                SQL.Add(' WHERE ');
                SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
                SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');

                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := colocacion;
                Open;

                if RecordCount > 0 then
                begin
                      if (FieldByName('ES_NOVISADO').AsInteger <> 0) or
                         (FieldByName('ES_ANULADO').AsInteger <> 0)  or
                         (FieldByName('ES_CANCELADO').AsInteger <> 0 ) or
                         (FieldByName('ES_JURIDICO').AsInteger <> 0 ) or
                         (FieldByName('ES_CASTIGADO').AsInteger <> 0 ) then
                      begin
                          MessageDlg('Esta Colocación no se puede Liquidar',mtError,[mbOK],0);
                          EdNumeroColocacion.SetFocus;
                          Exit;
                      end;

                      Clasificacion := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
                      Garantia := FieldByName('DESCRIPCION_GARANTIA').AsString;
                      Estado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                      Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                      EdNumeroIdentificacion.Caption := FieldByName('ID_IDENTIFICACION').AsString + '-' + FieldByName('ID_PERSONA').AsString ;
                      EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
                      EdValorColocacion.Caption := FormatCurr('#,#0.00',FieldByName('VALOR_DESEMBOLSO').AsCurrency);
                      EdSaldoColocacion.Caption := FormatCurr('#,#0.00',Saldo);
                      EdPlazo.Caption := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
                      if FieldByName('TIPO_INTERES').AsString = 'F' then
                        TasaEfectiva :=FieldByName('TASA_INTERES_CORRIENTE').AsFloat
                      else
                        TasaEfectiva :=FieldByName('VALOR_ACTUAL_TASA').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat;
                      EdAmortizaCapital.Caption := IntToStr(FieldByName('AMORTIZA_CAPITAL').AsInteger);
                      EdAmortizaInteres.Caption := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
                      EdValorCuota.Caption := FormatCurr('#,#0',FieldByName('VALOR_CUOTA').AsCurrency);
                      FechaKant := FieldByname('FECHA_CAPITAL').AsDateTime;
                      EdFechaCapital.Caption := DateToStr(Fechakant);
                      EdFechaInteres.Caption := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                      Cuotas := FieldByName('PLAZO_COLOCACION').AsInteger div FieldByName('AMORTIZA_INTERES').AsInteger;
                      if FieldByName('INTERES').AsString = 'V' then
                      begin
                         TasaAplicada := TasaNominalVencida(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger);
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end
                      else
                      begin
                         TasaAplicada := TasaNominalAnticipada(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger);
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end;
                      vTasa := TasaAplicada;
                      Close;

                      if Saldo <= 0 then
                       begin
                         MessageDlg('Credito Cancelado',mtCustom,[mbOK],0);
                         CmdLiquidar.Enabled := False;
                         Exit;                         
                       end;

                      IBQuery1.SQL.Clear;
                      IBQuery1.SQL.Add('select count(*) as CUOTAS from "col$tablaliquidacion" where ');
                      IBQuery1.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and');
                      IBQuery1.SQL.Add('PAGADA = 0');
                      IBQuery1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      IBQuery1.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
                      IBQuery1.Open;

                      EdTotalCuotas.Caption := 'de ' + IntToStr(IBQuery1.FieldByName('CUOTAS').AsInteger) + ' de ' + IntToStr(Cuotas);
                      EdCuotas.MaxValue := IBQuery1.FieldByName('CUOTAS').AsInteger;
                      if IBQuery1.FieldByName('CUOTAS').AsInteger = 1 then
                        PagoTotal.Enabled := False;
                      IBQuery1.Close;
                      IBquery.Close;
                      CmdLiquidar.Enabled := True;
                      GBInfoCol.Enabled := True;
                      EdCuotas.SetFocus;
                end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                end;
        end;


end;

procedure TfrmOperacionesCaja.EdNumeroColocacionEnter(Sender: TObject);
begin
        EdNumeroColocacion.SelectAll;
end;

procedure TfrmOperacionesCaja.EdNumeroColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmOperacionesCaja.InicializarCol;
begin
            EdNumeroColocacion.Enabled := True;
            EdNumeroColocacionManual.Enabled := True;
            EdNumeroIdentificacion.Enabled := True;
            EdNombre.Enabled := True;
            EdNombreManual.Enabled := True;
            EdNoComprobante.Enabled := True;
            EdNoComprobanteManual.Enabled := True;
            EdNumeroColocacion.Text := '';
            EdNumeroColocacionManual.Text := '';
            EdNumeroIdentificacion.Caption := '';
            EdTipoIdentificacionManual.Caption := '';
            EdCostas.Caption := '';
            EdAbonoCostas.Text := '';
            EdAbonoHonorarios.Text := '';
            EdNombre.Caption := '';
            EdNombreManual.Caption := '';
            EdSaldoColocacion.Caption := '';
            EdSaldoColocacionManual.Caption := '';
            EdFechaCapitalManual.Caption := '';
            EdFechaInteresManual.Caption := '';
            EdPlazo.Caption := '';
            EdAmortizaCapital.Caption := '';
            EdAmortizaInteres.Caption := '';
            EdValorCuota.Caption := '';
            EdTasaNominal.Caption := '';
            EdFechaCapital.Caption := '';
            EdFechaInteres.Caption := '';
            EdCuotas.Value := 1;
            EdNocomprobante.Caption := '';
            EdNoComprobanteManual.Caption := '';
            dmColocacion.IBDSagencias.Open;
            dmColocacion.IBDSagencias.Last;
            dmColocacion.IBDSagencias.First;
            EdAgencia.KeyValue := Agencia;
            EdAgenciaManual.KeyValue := Agencia;
            CmdBuscar.Enabled := True;
            EdCapital.Caption:= '';
            EsCapital.Checked := False;
            EsIntereses.Checked := False;
            ChVCredito.Checked := False;
            EdIntereses.Caption := '';
            EdDIntereses.Caption := '';
            EdDevuelto.Caption := '';
            EdDDevuelto.Caption := '';
            EdNuevoSaldo.Caption := '';
            EdTotal.Caption := '';
            EdTotal1.Caption := '';
            EdEstadoManual.Caption := '';
//            EdFechaInicialCobrado.Date := StrToDate(EdFecha.Caption);
//            EdFechaFinalCobrado.Date := StrToDate(EdFecha.Caption);
//            EdFechaInicialDevuelto.Date := StrToDate(EdFecha.Caption);
//            EdFechaFinalDevuelto.Date := StrToDate(EdFecha.Caption);

            ChkPapeleria.Checked := False;
            GroupBox1.Enabled := True;
            GroupBox4.Enabled := True;
            PageControl2.Enabled := True;
            PageControl2.Visible := False;
            GroupBox1.Visible := False;
            if CapOperacion = 'A' then
               EdNumeroColocacion.SetFocus
            else
               EdNumeroColocacionManual.SetFocus;

            dmColocacion.IBDStipocuota.Active := true;
            dmColocacion.IBDStipocuota.Last;
            dmColocacion.IBDStipocuota.First;

            NumeroCuentaAbogado := 0;
            DigitoCuentaAbogado := 0;
            vPapeleria := 0;
            SaldoTabla := 0;
            PagoTotal.Enabled := True;

end;

procedure tfrmoperacionescaja.InicializarCastigada;
begin
  DBLCBCasAgencia.KeyValue := Agencia;
  EdCasNumeroColocacion.Text := '';
  EdCasTipoIdentificacion.Caption := '';
  EdCasEstado.Caption := '';
  EdCasNombre.Caption := '';
  EdCasCostas.Caption := '';
  EdCasFechaCapital.Caption := '';
  EdCasFechaInteres.Caption := '';
  EdCasCuentaAbogado.Caption := '';
  EdCasNoComprobante.Caption := '';
  EdCasSaldoActual.Caption := '';
  EdCasAbogado.Caption := '';
  EdTotalCas.Caption := '';
  EdAbonoCapitalCas.Value := 0;
  EdAbonoInteresCas.Value := 0;
  EdAprovecha.Value := 0;
  EdAbonoCostasCas.Value := 0;
  EdAbonoHonorarioscas.Value := 0;
  EdFechaInicialCas.Date := fFechaActual;
  EdFechaFinalCas.Date := fFechaActual;
  EdFechaInicialA.Date := fFechaActual;
  EdFechaFinalA.Date := fFechaActual;
  EdDiasAplicadosCas.Text := '';
  EdDiasAplicadosA.Text := '';
  EdTasaAplicadaCas.Text := '';
  EdTasaAplicadaA.Text := '';
  DBLCBCasAgencia.SetFocus;
  CmdInforme.Enabled := False;
  CmdGrabar.Visible := False;
  CmdReversar.Visible := False;
  EdFechaInicialCas.Visible := False;
  EdFechaFinalCas.Visible := False;
  EdFechaInicialA.Visible := False;
  EdFechaFinalA.Visible := False;
  EdDiasAplicadosCas.Visible := False;
  EdDiasAplicadosA.Visible := False;
  EdTasaAplicadaCas.Visible := False;
  EdTasaAplicadaA.Visible := False;
  Label163.Visible := False;
  Label164.Visible := False;
  Label165.Visible := False;
  Label166.Visible := False;
  CmdRecaudarCas.Visible := True;
  ChkPapeleriaCas.Checked := False;
//  cmdCasAbonar.Enabled := True;
  if DmColocacion.IBDSagencias.Transaction.InTransaction then
   begin
     DmColocacion.IBDSagencias.Transaction.Commit;
     Dmcolocacion.IBDSagencias.Transaction.StartTransaction;
   end;
  dmColocacion.IBDSagencias.Active := true;
  dmColocacion.IBDSagencias.Last;
  dmColocacion.IBDSagencias.First;

  GridCuentas.RowCount := 2;
  GridCuentas.ColCount := 2;
  GridCuentas.Cells[0,1] := '';
  GridCuentas.Cells[1,1] := '';
  GridCuentas.ColWidths[0] := 80;
  GridCuentas.ColWidths[1] := 120;
  GridCuentas.Cells[0,0] := 'Cuenta';
  GridCuentas.Cells[1,0] := 'Saldo a Descontar';

  EdCasNumeroColocacion.SetFocus;
  NumeroCuentaAbogado := 0;
  DigitoCuentaAbogado := 0;
  vpapeleria := 0;

end;

procedure TfrmOperacionesCaja.ValorDenominacionCol(Sender: TObject);
var Valor:Currency;
    Pos:Integer;
    I:Integer;
begin
       Pos := TJvIntegerEdit(Sender).Tag;
       Valor := LDenominacionCol[Pos].vDenominacion * TJvIntegerEdit(Sender).Value;
       LDenominacionCol[Pos].Total.Caption := FormatCurr('#,0.00',Valor);
       TSumaBilletes:=0;
       for I := 0 to Length(LDenominacionCol) - 1 do
       begin
           Valor := LDenominacionCol[I].vDenominacion * LDenominacionCol[I].Cantidad.Value;
           TSumaBilletes := TSumaBilletes + Valor;
       end;
       STotalBilletesCol.Caption := FormatCurr('$#,0.00',TSumaBilletes);
       SDiferenciaCol.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);

end;

procedure TfrmOperacionesCaja.CmdLiquidarClick(Sender: TObject);
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I:Integer;
    Clasificacion:Integer;
    Categoria:string;
    Garantia:Integer;
    SaldoActual:Currency;
    TipoCapital:string;
    TipoInteres:Integer;
    TipoCuota:Integer;
    FechaPagoK:TDate;
    FechaPagoI:TDate;
    Estado:Integer;
    ValorTasa:Double;
    ValorMora:Double;
    ValorCuota:Currency;
    PuntosAdic:Double;
    AmortizaK:Integer;
    AmortizaI:Integer;
    DiasProrroga:Integer;
    {Capital   :Currency;
    Causado   :Currency;
    Corriente :Currency;
    Vencido   :Currency;
    Anticipado:Currency;
    Devuelto  :Currency;}
begin

  CmdLiquidar.Enabled := False;
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;
  with IBQuery do
   begin
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colocacion".ID_CLASIFICACION,');
     SQL.Add('"col$colocacion".ID_CATEGORIA,');
     SQL.Add('"col$colocacion".ID_GARANTIA,');
     SQL.Add('("col$colocacion".VALOR_DESEMBOLSO -  "col$colocacion".ABONOS_CAPITAL ) as SALDO_ACTUAL,');
     SQL.Add('"col$tiposcuota".CAPITAL,');
     SQL.Add('"col$tiposcuota".INTERES,');
     SQL.Add('"col$tiposcuota".TIPO_CUOTA,');
     SQL.Add('"col$colocacion".TIPO_INTERES,');
     sql.Add('"col$colocacion".ID_INTERES,');
     SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
     SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
     SQL.Add('"col$colocacion".TASA_INTERES_MORA,');
     SQL.Add('"col$colocacion".PUNTOS_INTERES,');
     SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
     SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
     SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
     SQL.Add('"col$colocacion".DIAS_PRORROGADOS,');
     SQL.Add('"col$colocacion".FECHA_CAPITAL,');
     SQL.Add('"col$colocacion".FECHA_INTERES,');
     SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
     SQL.Add('"col$colocacion".VALOR_CUOTA');
     SQL.Add(' FROM ');
     SQL.Add('"col$colocacion" ');
     SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
     SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
     SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" ');
     ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
     ParamByName('ID_COLOCACION').AsString := Trim(EdNumeroColocacion.Text);
     Open;

     Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
     Categoria     := FieldByName('ID_CATEGORIA').AsString;
     Garantia      := FieldByName('ID_GARANTIA').AsInteger;
     SaldoActual   := FieldByName('SALDO_ACTUAL').AsCurrency;
     vSaldoActual  := SaldoActual;
//     TipoCapital   := FieldByName('CAPITAL').AsString;
     TipoInteres   := FieldByName('ID_INTERES').AsInteger;
     TipoCuota     := FieldByName('ID_TIPO_CUOTA').AsInteger;
     ValorCuota    := FieldByName('VALOR_CUOTA').AsCurrency;

     if FieldByName('TIPO_INTERES').AsString = 'F' then
      ValorTasa := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
     else
      ValorTasa := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
     ValorMora     := ValorTasa + FieldByName('TASA_INTERES_MORA').AsFloat;
     PuntosAdic := FieldByName('PUNTOS_INTERES').AsFloat;
     AmortizaK     := FieldByName('AMORTIZA_CAPITAL').AsInteger;
     AmortizaI     := FieldByName('AMORTIZA_INTERES').AsInteger;
     DiasProrroga  := FieldByName('DIAS_PRORROGADOS').AsInteger;
     FechaPagoK    := FieldByName('FECHA_CAPITAL').AsDateTime;
     FechaPagoI    := FieldByName('FECHA_INTERES').AsDateTime;
     Estado        := FieldByName('ID_ESTADO_COLOCACION').AsInteger;

     Close;
   end;

  if (TipoCuota = 1) and (CredPagoTotal) then
   LiquidarCuotasFijaPagoTotal(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),StrToDate(EdFecha.Caption),
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if (TipoCuota = 1) then
   LiquidarCuotasFija(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),StrToDate(EdFecha.Caption),
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);

  if (TipoCuota = 2) and (CredPagoTotal) then
   LiquidarCuotasVarAnticipadaPagoTotal(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),StrToDate(EdFecha.Caption),
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if (TipoCuota = 2) then
   LiquidarCuotasVarAnticipada(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),StrToDate(EdFecha.Caption),
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);
                     
  if (TipoCuota = 3) and (CredPagoTotal)  then
   LiquidarCuotasVarVencidaPagoTotal(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),StrToDate(EdFecha.Caption),
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if (TipoCuota = 3) then
   LiquidarCuotasVarVencida(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),StrToDate(EdFecha.Caption),
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);


  if CuotasLiq.Liquidado then
   begin
     Colocacion := EdNumeroColocacion.Text;
     Lista := CuotasLiq.Lista;
     Asociado := EdNombre.Caption;
     FechaCorte := StrToDate(EdFecha.Caption);
     ProximaCuota := CuotasLiq.FechaProx;
     NuevoSaldo := CuotasLiq.NuevoSaldo;
     InteresesHasta := CuotasLiq.InteresesHasta;
     CapitalHasta := CuotasLiq.CapitalHasta;
     MostrarFormulario;
     PageColocacion.Enabled := True;
     PageControl.Enabled := True;
     PanelRecCol.Enabled := True;
     GbAsociadoCol.Enabled := False;
     CmdAbonar.Enabled := True;
     CmdAbonar.SetFocus;
   end;

  Screen.Cursor := crDefault;
end;

procedure TfrmOperacionesCaja.CmdAbonarClick(Sender: TObject);
begin
        PageColocacion.ActivePage := TabCol2;
        EdTotalBilletesCol.Value := Total;
        TBilletes := EdTotalBilletesCol.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
        CmdOKColocacion.SetFocus;
end;

procedure TfrmOperacionesCaja.MostrarFormulario;
var AF:PCuotasLiq;
    I:Integer;
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;

        Capital    := 0;
        Causado    := 0;
        Corriente  := 0;
        Vencido    := 0;
        Anticipado := 0;
        Devuelto   := 0;
        DiasCausado:=0;
        DiasCorriente:=0;
        DiasVencido:=0;
        DiasAnticipado:=0;
        DiasDevuelto:=0;
        vTipoOperacion := 1;
              for I := 0 to (Lista.Count - 1) do
              begin
                Application.ProcessMessages;
                AF := Lista.Items[I];

                if AF^.EsCapital then
                 begin
                   abono_capital := AF^.Credito;
                   Capital := Capital + AF^.Credito;
                 end;

                if AF^.EsCausado then
                begin
                   abono_cxc := AF^.Credito;
                   Causado := Causado + AF^.Credito;
                   DiasCausado := DiasCausado + AF^.Dias;
                end;

                if AF^.EsCorriente then
                begin
                   abono_servicios := AF^.Credito;
                   Corriente := Corriente + AF^.Credito;
                   DiasCorriente := DiasCorriente + AF^.Dias;
                end;

                if AF^.EsVencido then
                begin
                   abono_mora := AF^.Credito;
                   Vencido := Vencido + AF^.Credito;
                   DiasVencido := DiasVencido + AF^.Dias;
                end;

                if AF^.EsAnticipado then
                begin
                   abono_anticipado := AF^.Credito;
                   Anticipado := Anticipado + AF^.Credito;
                   DiasAnticipado := DiasAnticipado + AF^.Dias;
                end;

                if AF^.EsDevuelto then
                 if AF^.Debito <> 0 then
                 begin
                   Devuelto := Devuelto + AF^.Debito;
                   DiasDevuelto := DiasDevuelto + AF^.Dias;
                 end;
              end;

           with IBQuery do
           begin
             sql.Clear;
             sql.Add('Select CUOTA_NUMERO from "col$tablaliquidacion"');
             sql.Add(' where "col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
             sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and ');
             Sql.Add('"col$tablaliquidacion"."PAGADA" = 0 ');
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_COLOCACION').AsString := Colocacion;
             Open;
             vCuotaNo := FieldByName('CUOTA_NUMERO').AsInteger;
             Close;
           end;

           EdCapital.Caption:= FormatCurr('#,#0',Capital);
           EdIntereses.Caption := FormatCurr('#,#0',Causado+Corriente+Anticipado+Vencido);
           EdDIntereses.Caption := IntToStr(DiasCausado+DiasCorriente+DiasAnticipado+DiasVencido);
           EdDevuelto.Caption := FormatCurr('#,#0',Devuelto);
           EdDDevuelto.Caption := IntToStr(DiasDevuelto);
           EdNuevoSaldo.Caption := FormatCurr('#,#0',Nuevosaldo);
           Total := Capital + Causado + Corriente + Vencido + Anticipado-Devuelto;
           EdTotal.Caption := FormatCurr('#,#0',Total);
           EdTotal1.Caption := FormatCurr('#,#0',Total);
           CmdInforme.Enabled := True;
end;

procedure TfrmOperacionesCaja.EdDevolucionColChange(Sender: TObject);
begin
        TDevolucion := EdDevolucionCol.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.CmdBuscarClick(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;
end;

procedure TfrmOperacionesCaja.CmdVerDevolucionColClick(Sender: TObject);
var frmArqueoDevolucion:TfrmArqueoDevolucion;
begin
    frmArqueoDevolucion:=TfrmArqueoDevolucion.Create(Self);
    frmArqueoDevolucion.ListaDevolucion := ListaDevolucion;
    frmArqueoDevolucion.MonedasDevolucion := MonedasDevolucion;
    if frmArqueoDevolucion.ShowModal = mrok then
    begin
        ListaDevolucion := frmArqueoDevolucion.ListaDevolucion;
        MonedasDevolucion := frmArqueodevolucion.MonedasDevolucion;
        EdDevolucionCer.Value := frmArqueoDevolucion.ValorDevolucion;
    end;
end;

procedure TfrmOperacionesCaja.EdDevolucionColExit(Sender: TObject);
begin
        TDevolucion := EdDevolucionCol.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
        if EdDevolucionCol.Value > 0 then
           CmdVerDevolucionCol.Click;

end;

procedure TfrmOperacionesCaja.RealizarAbono;
begin
        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara el abono',mtInformation,[mbok],0);
           EdMonedasCol.SetFocus;
           Exit;
        end;

        if TGeneral <> Total then
        begin
           MessageDlg('Los Valores No Concuerdan',mtInformation,[mbok],0);
           EdMonedasCol.SetFocus;
           Exit;
        end;

        Timer.Enabled := False;

        if GrabarAbono then
        begin
           frmValidarColocacion := TfrmValidarColocacion.Create(Self);
           with frmValidarColocacion do
           begin
               CValidar.Fecha := StrToDate(EdFecha.Caption);
               CValidar.Caja := StrToInt(EdCaja.Caption);
               CValidar.Cuenta := Cuenta;
               CValidar.Documento := StrToInt(EdNoComprobante.Caption);
               CValidar.Colocacion := EdNumeroColocacion.Text;
               CValidar.Nombre := EdNombre.Caption;
               CValidar.Clasificacion := Clasificacion;
               CValidar.Garantia := Garantia;
               CValidar.Estado := Estado;
               CValidar.FechaInt := InteresesHasta;
               CValidar.Capital := Capital;
               CValidar.Interes := Causado+Corriente+Anticipado+Vencido;
               CValidar.Devuelto := Devuelto;
               CValidar.Otras := 0;
               CValidar.NuevoSaldo := NuevoSaldo;
               CValidar.Efectivo := Total;
               Validar := CValidar;
               ShowModal;
               Free;
           end;

           MessageDlg('Abono Realizado con Exito!',mtInformation,[mbok],0);
        end
        else
           MessageDlg('Error al Realizar el Abono, consulte con sistemas',mtError,[mbcancel],0);

        Timer.Enabled := True;

        CmdRetornar.Click;


end;

function TfrmOperacionesCaja.GrabarAbono: Boolean;
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I,J : integer;
    AR:PCuotasLiq;
    PRecord:PListaDev;
    EnBilletes:Currency;
    EnMonedas:Currency;
    SumTasa:Single;
    SumDias:Integer;
    vTasatmp:Single;
begin
    abono_capital := 0;
    abono_cxc := 0;
    abono_servicios := 0;
    abono_mora := 0;
    abono_anticipado := 0;
    Cuota_anterior := 0;
    cambio := false;
    SumTasa := 0;
    SumDias := 0;
    vTasatmp := vTasa;

        if  Lista.Count > 0 then
          for I := 0 to Lista.Count -1 do
          begin
                AR := Lista.Items[i];
                if AR^.EsCausado or AR^.EsCorriente or AR^.EsAnticipado then begin
                   SumTasa := SumTasa + (ar^.Tasa * AR^.Dias);
                   SumDias := SumDias + ar^.Dias;
                end;
          end;
          try
            vTasa := SumTasa / SumDias;
          except
            vTasa := vTasatmp;
          end;

       vNoComprobante := Format('%.7d',[ObtenerConsecutivoCajaCartera]);
       EdNoComprobante.Caption := vNoComprobante;

      with IBQuery do
        try
         for J := 0 to Lista.Count - 1 do
          begin
            AR := Lista.Items[J];
            if AR^.CuotaNumero <> Cuota_anterior then
              if cambio = false then
                 cambio := true
              else
               begin
                 GrabarExtractoCol;
                 GrabarTablaLiquidacion;
               end;
            Cuota_anterior := AR^.CuotaNumero;
            if AR^.EsCapital then
               abono_capital := abono_capital + AR^.Credito;
            if AR^.EsCausado then
               abono_cxc := abono_cxc + AR^.Credito;
            if AR^.EsCorriente then
               abono_servicios := abono_servicios + AR^.Credito;
            if AR^.EsVencido then
               abono_mora := abono_mora + AR^.Credito;
            if AR^.EsAnticipado then
               abono_anticipado := abono_anticipado + AR^.Credito;


          end;

          GrabarExtractoCol;
          GrabarTablaLiquidacion;

          SQL.Clear;
          SQL.Add('insert into "col$extractodet" values (');
          SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
          SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
          SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
          if  Lista.Count > 0 then
          for I := 0 to Lista.Count -1 do
           begin
             Application.ProcessMessages;
             AR := Lista.Items[I];
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_CBTE_COLOCACION').AsInteger:= StrToInt(vNocomprobante);
             ParamByName('ID_COLOCACION').AsString := colocacion;
             ParamByName('FECHA_EXTRACTO').AsDate := StrToDate(EdFecha.Caption);
             ParamByName('HORA_EXTRACTO').AsDateTime := StrToTime(EdHora.Caption);
             ParamByName('CODIGO_PUC').AsString := AR^.CodigoPuc;
             ParamByName('FECHA_INICIAL').AsDate := AR^.FechaInicial;
             ParamByName('FECHA_FINAL').AsDate := AR^.FechaFinal;
             ParamByName('DIAS_APLICADOS').AsInteger := AR^.Dias;
             ParamByName('TASA_LIQUIDACION').AsFloat := AR^.Tasa;
             ParamByName('VALOR_DEBITO').AsCurrency := AR^.Debito;
             ParamByName('VALOR_CREDITO').AsCurrency := AR^.Credito;
             try
               ExecSql;
               Close;
             except
               Transaction.Rollback;
               MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
               Exit;
             end;
          end;

          SQL.Clear;
          SQL.Add('update "col$colocacion" set ');
          SQL.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
          SQL.Add('"col$colocacion"."FECHA_CAPITAL" =:"FECHA_CAPITAL",');
          SQL.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
          SQL.Add(' where ');
          SQL.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          SQL.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ParamByName('ABONOS_CAPITAL').AsCurrency := Capital;
          ParamByName('FECHA_CAPITAL').AsDate := CapitalHasta;
          ParamByName('FECHA_INTERES').AsDate := InteresesHasta;
          ExecSql;
          Close;
        except
          Result := False;
          Transaction.Rollback;
          MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
          Exit;
        end;

//Grabar Movimiento
              EnBilletes := TBilletes;
              EnMonedas := TMonedas;
              if EnBilletes < 0 then EnBilletes := 0;
              if EnMonedas < 0 then EnMonedas := 0;


              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientocol" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_COLOCACION,');
              IBOtros.SQL.Add(':DOCUMENTO,:CAPITAL,:INTERESES,:DEVOLUCION,:OTROS,:BILLETES,:MONEDAS,:ID_PERSONA)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdNoComprobante.Caption;
              IBOtros.ParamByName('CAPITAL').AsCurrency := Capital;
              IBOtros.ParamByName('INTERESES').AsCurrency := Causado+Corriente+Anticipado+Vencido;
              IBOtros.ParamByName('DEVOLUCION').AsCurrency := Devuelto;
              IBOtros.ParamByName('OTROS').AsCurrency := 0;
              IBOtros.ParamByName('BILLETES').AsCurrency := EnBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := EnMonedas;
              IBOtros.ParamByName('ID_PERSONA').AsString := edDocumentoOpColUsuario.Text;
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  dmGeneral.IBTransaction1.Rollback;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
                 end;
              except
                  dmGeneral.IBTransaction1.Rollback;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Result := False;
                  Exit;
              end;



        dmGeneral.IBTransaction1.Commit;

        VerificarCancelacionCredito(Agencia,Colocacion);
        Result := True;


end;

procedure TfrmOperacionesCaja.GrabarExtractoCol;
var
SaldoExtracto : Currency;
FechaCapital:TDate;
FechaInteres:TDate;
begin
        with IBQuery1 do
         begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;         
          sql.Clear;
          sql.Add('select SALDO_ANTERIOR_EXTRACTO, ABONO_CAPITAL,');
          SQL.Add('"col$extracto".INTERES_PAGO_HASTA, "col$extracto".CAPITAL_PAGO_HASTA,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL, "col$colocacion".AMORTIZA_INTERES');
          sql.Add('from "col$extracto" ');
          SQL.Add('inner join "col$colocacion" on ("col$extracto".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
          SQL.Add('"col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION) where');
          SQL.Add('"col$extracto".ID_AGENCIA = :"ID_AGENCIA" and');
          SQL.Add('"col$extracto".ID_COLOCACION = :"ID_COLOCACION"');
          Parambyname('ID_AGENCIA').AsInteger := agencia;
          parambyname('ID_COLOCACION').AsString := colocacion;
          open;
          First;
          Last;
          SaldoExtracto := FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency - FieldByName('ABONO_CAPITAL').AsCurrency;
          if abono_capital > 0 then
            FechaCapital := CalculoFecha(FieldByName('CAPITAL_PAGO_HASTA').AsDateTime,FieldByName('AMORTIZA_CAPITAL').AsInteger)
          else
            FechaCapital := FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;

           FechaInteres := CalculoFecha(FieldByName('INTERES_PAGO_HASTA').AsDateTime,FieldByName('AMORTIZA_INTERES').AsInteger);
          Close;
         end;

        with IBQuery1 do
         begin
          SQL.Clear;
          SQL.Add('insert into "col$extracto" (');
          SQL.Add('"col$extracto"."ID_AGENCIA", "col$extracto"."ID_CBTE_COLOCACION",');
          SQL.Add('"col$extracto"."ID_COLOCACION", "col$extracto"."FECHA_EXTRACTO",');
          SQL.Add('"col$extracto"."HORA_EXTRACTO", "col$extracto"."CUOTA_EXTRACTO",');
          SQL.Add('"col$extracto"."TIPO_OPERACION", "col$extracto"."SALDO_ANTERIOR_EXTRACTO",');
          SQL.Add('"col$extracto"."ABONO_CAPITAL", "col$extracto"."ABONO_CXC",');
          SQL.Add('"col$extracto"."ABONO_SERVICIOS", "col$extracto"."ABONO_ANTICIPADO",');
          SQL.Add('"col$extracto"."ABONO_MORA", "col$extracto"."ABONO_SEGURO",');
          SQL.Add('"col$extracto"."ABONO_PAGXCLI", "col$extracto"."ABONO_HONORARIOS",');
          SQL.Add('"col$extracto"."ABONO_OTROS", "col$extracto"."TASA_INTERES_LIQUIDACION",');
          SQL.Add('"col$extracto"."ID_EMPLEADO",');
          SQL.Add('"col$extracto"."INTERES_PAGO_HASTA",');
          SQL.Add('"col$extracto"."CAPITAL_PAGO_HASTA",');
          SQL.Add('"col$extracto"."TIPO_ABONO")');
          SQL.Add(' Values (');
          SQL.Add(':"ID_AGENCIA", :"ID_CBTE_COLOCACION", :"ID_COLOCACION",');
          SQL.Add(':"FECHA_EXTRACTO", :"HORA_EXTRACTO", :"CUOTA_EXTRACTO",');
          SQL.Add(':"TIPO_OPERACION", :"SALDO_ANTERIOR_EXTRACTO", :"ABONO_CAPITAL",');
          SQL.Add(':"ABONO_CXC", :"ABONO_SERVICIOS", :"ABONO_ANTICIPADO", :"ABONO_MORA",');
          SQL.Add(':"ABONO_SEGURO", :"ABONO_PAGXCLI", :"ABONO_HONORARIOS",');
          SQL.Add(':"ABONO_OTROS", :"TASA_INTERES_LIQUIDACION", :"ID_EMPLEADO",');
          SQL.Add(':"INTERES_PAGO_HASTA", :"CAPITAL_PAGO_HASTA", :"TIPO_ABONO")');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vNoComprobante);
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := StrToDate(EdFecha.Caption);
          ParamByName('HORA_EXTRACTO').AsDateTime := StrToTime(EdHora.Caption);
          ParamByName('CUOTA_EXTRACTO').AsInteger := Cuota_anterior;
          ParamByName('TIPO_OPERACION').AsInteger := vTipoOperacion;
          if SaldoExtracto > 0 then
            ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := SaldoExtracto
          else
            ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
          ParamByName('ABONO_CAPITAL').AsCurrency := abono_capital;
          ParamByName('ABONO_CXC').AsCurrency := abono_cxc;
          ParamByName('ABONO_SERVICIOS').AsCurrency := abono_servicios;
          ParamByName('ABONO_ANTICIPADO').AsCurrency := abono_anticipado;
          ParamByName('ABONO_MORA').AsCurrency := abono_mora;
          ParamByName('ABONO_SEGURO').AsCurrency := vseguro;
          ParamByName('ABONO_PAGXCLI').AsCurrency := vpagxcliente;
          ParamByName('ABONO_HONORARIOS').AsCurrency := vhonorarios;
          ParamByName('ABONO_OTROS').AsCurrency := votrospagos;
          ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasa;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          if FechaInteres = 0 then
            ParamByName('INTERES_PAGO_HASTA').AsDate := InteresesHasta
          else
            ParamByName('INTERES_PAGO_HASTA').AsDate := FechaInteres; //InteresesHasta;
          if fechacapital = 0 then
            ParamByName('CAPITAL_PAGO_HASTA').AsDate := CapitalHasta
          else
            ParamByName('CAPITAL_PAGO_HASTA').AsDate := fechacapital; //CapitalHasta;
          ParamByName('TIPO_ABONO').AsBoolean := False;
          try
             ExecSQL;
             Close;
          except
             Transaction.Rollback;
             MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
             raise;
          end;
          abono_capital := 0;
          abono_cxc := 0;
          abono_servicios := 0;
          abono_mora := 0;
          abono_anticipado := 0;
          vhonorarios := 0;
         end;
end;

procedure TfrmOperacionesCaja.GrabarTablaLiquidacion;
begin
        with IBQuery1 do
         begin
          SQL.Clear;
          SQL.Add('update "col$tablaliquidacion" set');
          SQL.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
          SQL.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
          SQL.Add(' where ');
          SQL.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          SQL.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
          SQL.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('CUOTA_NUMERO').AsInteger := Cuota_anterior;
          ParamByName('PAGADA').AsInteger := 1;
          ParamByName('FECHA_PAGADA').AsDate := StrToDate(EdFecha.Caption);
          try
            ExecSQL;
            Close;
          except
            Transaction.Rollback;
            MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
            raise;
          end;
         end;
end;

procedure TfrmOperacionesCaja.EdNoComprobanteKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmOperacionesCaja.EdMonedasColChange(Sender: TObject);
begin
        TMonedas := EdMonedasCol.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdMonedasColExit(Sender: TObject);
begin
        TMonedas := EdMonedasCol.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdDevolucionColEnter(Sender: TObject);
begin
        EdDevolucionCol.Value := TGeneral - Total;
        if EdDevolucionCol.Value < 0 then
          EdDevolucionCol.Value := 0;
end;

procedure TfrmOperacionesCaja.EdMonedasOtrChange(Sender: TObject);
begin
        TMonedas := EdMonedasOtr.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdMonedasOtrExit(Sender: TObject);
begin
        TMonedas := EdMonedasOtr.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdMonedasCerExit(Sender: TObject);
begin
        if CapOperacion = 'S' then
          if EdMonedasCer.Value > THayMonedas then
          begin
            MessageDlg('No tiene tanta cantidad en Monedas',mtInformation,[mbok],0);
            EdMonedasCer.Value := THayMonedas;
          end;
        TMonedas := EdMonedasCer.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdMonedasCapExit(Sender: TObject);
begin
{        if CapOperacion = 'R' then
          if EdMonedasCap.Value > THayMonedas then
          begin
            MessageDlg('No tiene tanta cantidad en Monedas',mtInformation,[mbok],0);
            EdMonedasCap.Value := THayMonedas;
          end;}
        if TipoCaptacion = 5 then EdMonedasCap.Value := 0;
        TMonedas := EdMonedasCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
        if CapOperacion = 'C' then
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo + TGeneral))
        else
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo - TGeneral));

end;

procedure TfrmOperacionesCaja.EdMonedasGenExit(Sender: TObject);
begin
        if CapOperacion = 'R' then
          if EdMonedasCap.Value > THayMonedas then
          begin
            MessageDlg('No tiene tanta cantidad en Monedas',mtInformation,[mbok],0);
            EdMonedasCap.Value := THayMonedas;
          end;
        TMonedas := EdMonedasCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.CmdImagenesCapClick(Sender: TObject);
var frmImagenesPersona: TfrmImagenesPersona;
    FCaptacion:TCaptacion;
begin
       frmImagenesPersona := TfrmImagenesPersona.Create(Self);
       with frmImagenesPersona do begin
         FCaptacion.IdAgencia := Agencia;
         FCaptacion.IdCaptacion :=  TipoCaptacion;
         FCaptacion.IdNumeroCuenta := StrToInt(EdNumeroCap.Text);
         FCaptacion.IdDigitoCuenta := StrToInt(EdDigitoCap.Caption);
         Captacion := FCaptacion;
         ShowModal;
       end;
end;

procedure TfrmOperacionesCaja.CmdImagenesCerClick(Sender: TObject);
var frmImagenesPersona: TfrmImagenesPersona;
    FCaptacion:TCaptacion;
begin
       frmImagenesPersona := TfrmImagenesPersona.Create(Self);
       with frmImagenesPersona do begin
         FCaptacion.IdAgencia := Agencia;
         FCaptacion.IdCaptacion :=  TipoCaptacion;
         FCaptacion.IdNumeroCuenta := StrToInt(EdNumeroCer.Text);
         FCaptacion.IdDigitoCuenta := StrToInt(EdDigitoCer.Caption);
         Captacion := FCaptacion;
         ShowModal;
       end;
end;

procedure TfrmOperacionesCaja.CmdOKColocacionClick(Sender: TObject);
begin
        if ((TBilletes + TMonedas) >= _vMinimoSARLAFT) then
        if (edDocumentoOpColUsuario.Text = '') then
        begin
            MessageDlg('Por favor digite los datos del Usuario',mtInformation,[mbOk],0);
            edDocumentoOpColUsuario.SetFocus;
            exit;
        end
        else
        if not _bDocumentoUsuarioValido then
        begin
            MessageDlg('El Usuario debe quedar bien registrado',mtInformation,[mbOk],0);
            edDocumentoOpColUsuario.SetFocus;
            Exit;
        end;

        if MessageDlg('Seguro de Realizar la Operación',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

        CmdOKColocacion.Enabled := False;
        RealizarAbono;
end;

procedure TfrmOperacionesCaja.EdTotalBilletesCapChange(Sender: TObject);
begin
        TBilletes := EdTotalBilletesCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
        if CapOperacion = 'C' then
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo + TGeneral))
        else
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo - TGeneral));


end;

procedure TfrmOperacionesCaja.EdTotalBilletesCapExit(Sender: TObject);
begin
        if TipoCaptacion = 5 then
          if EdTotalBilletesCap.Value <> ValorCuotaCon then
             EdTotalBilletesCap.Value := ValorCuotaCon;
        TBilletes := EdTotalBilletesCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
        if CapOperacion = 'C' then
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo + TGeneral))
        else
           EdNuevoSaldoCap.Caption := FormatCurr('#,#0.00',(Saldo - TGeneral));
        if (TBilletes + TMonedas) >= _vMinimoSARLAFT then
          GrDatosUsuario.Visible := True
        else
          GrDatosUsuario.Visible := False;

end;

procedure TfrmOperacionesCaja.EdDocumentoOtrExit(Sender: TObject);
begin
       if EdDocumentoOtr.Text <> '' then
       begin
          EdDocumentoOtr.Text := Format('%.8d',[StrToInt(EdDocumentoOtr.Text)]);
          PanelValoresOtr.Enabled := True;
          EdTotalBilletesOtr.SetFocus;
       end
       else
          MessageDlg('Debe diligenciar el número de documento',mtError,[mbcancel],0);

end;

procedure TfrmOperacionesCaja.EdTotalBilletesOtrChange(Sender: TObject);
begin
        TBilletes := EdTotalBilletesOtr.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdTotalBilletesOtrExit(Sender: TObject);
begin
        TBilletes := EdTotalBilletesOtr.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdTotalBilletesColChange(Sender: TObject);
begin
        TBilletes := EdTotalBilletesCol.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;

procedure TfrmOperacionesCaja.EdTotalBilletesColExit(Sender: TObject);
begin
        TBilletes := EdTotalBilletesCol.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;

procedure TfrmOperacionesCaja.CmdSerRetornarClick(Sender: TObject);
begin
        Opcion := 1;
        PageControl1.ActivePage := TabProductos;
end;

procedure TfrmOperacionesCaja.TabProductosShow(Sender: TObject);
begin
        Caption := 'Operaciones de Caja';
end;

procedure TfrmOperacionesCaja.EdTotalBilletesGenChange(Sender: TObject);
begin
        TBilletes := EdTotalBilletesGen.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdTotalBilletesGenExit(Sender: TObject);
begin
        TBilletes := EdTotalBilletesGen.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;

procedure TfrmOperacionesCaja.CmdBuscarCaptacionClick(Sender: TObject);
var frmBuscarCaptacion:TfrmBuscarCaptacion;
begin
    frmBuscarCaptacion := TfrmBuscarCaptacion.Create(Self);
    frmBuscarCaptacion.Captacion := TipoCaptacion;
    if frmBuscarCaptacion.ShowModal = mrOk then
    begin
       EdNumeroCap.Text := Format('%.7d',[frmBuscarCaptacion.Captacion]);
       EdNumeroCapExit(EdNumeroCap);
       EdDocumentoCap.SetFocus;
    end;
end;

procedure TfrmOperacionesCaja.EdTotalBilletesCerChange(Sender: TObject);
begin
        TBilletes := EdTotalBilletesCer.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdTotalBilletesCerExit(Sender: TObject);
begin
        TBilletes := EdTotalBilletesCer.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.CmdInformeClick(Sender: TObject);
var Tabla:string;
    I:Integer;
    AF:PCuotasLiq;
    frmVistaPreliminar:TfrmVistaPreliminar;
begin
        Empleado;
        Tabla := '"temp' + FloatToStr(Now)+ '"';
        with IBQuery do
        begin
           SQL.Clear;
           SQL.Add('create table ' + Tabla + ' (');
           SQL.Add('CUOTA               INTEGER,');
           SQL.Add('CODIGO              CHAR(18),');
           SQL.Add('ID_AGENCIA          TIPOS,');
           SQL.Add('FECHA_INICIAL       DATE,');
           SQL.Add('FECHA_FINAL         DATE,');
           SQL.Add('DIAS                INTEGER,');
           SQL.Add('TASA                DOUBLE PRECISION,');
           SQL.Add('DEBITO              NUMERICO,');
           SQL.Add('CREDITO             NUMERICO);');
           ExecSQL;
           Transaction.CommitRetaining;
           Close;

           SQL.Clear;
           SQL.Add('insert into ' + Tabla + 'values(');
           SQL.Add(':"CUOTA",');
           SQL.Add(':"CODIGO",');
           SQL.Add(':"ID_AGENCIA",');
           SQL.Add(':"FECHA_INICIAL",');
           SQL.Add(':"FECHA_FINAL",');
           SQL.Add(':"DIAS",');
           SQL.Add(':"TASA",');
           SQL.Add(':"DEBITO",');
           SQL.Add(':"CREDITO");');

           for I := 0 to (Lista.Count - 1) do
           begin
                AF := Lista.Items[I];
                ParamByName('CUOTA').AsInteger := AF^.CuotaNumero;
                ParamByName('CODIGO').AsString := AF^.CodigoPuc;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA_INICIAL').AsDate := AF^.FechaInicial;
                ParamByName('FECHA_FINAL').AsDate := AF^.FechaFinal;
                ParamByName('DIAS').AsInteger := AF^.Dias;
                ParamByName('TASA').AsFloat := AF^.Tasa;
                ParamByName('DEBITO').AsCurrency := AF^.Debito;
                ParamByName('CREDITO').AsCurrency := AF^.Credito;
                ExecSQL;
           end;
           Close;

           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('CUOTA,');
           SQL.Add(Tabla + '.CODIGO,');
           SQL.Add('NOMBRE,');
           SQL.Add('FECHA_INICIAL,');
           SQL.Add('FECHA_FINAL,');
           SQL.Add('DIAS,');
           SQL.Add('TASA,');
           SQL.Add('DEBITO,');
           SQL.Add('CREDITO ');
           SQL.Add('from ' + Tabla + ' ');

           SQL.Add('LEFT JOIN "con$puc" ON (' + Tabla + '.CODIGO = "con$puc".CODIGO and ');
           SQL.Add(Tabla + '.ID_AGENCIA = "con$puc".ID_AGENCIA )');
           Open;

           Report.Variables.ByName['Empresa'].AsString := Empresa;
           Report.Variables.ByName['Colocacion'].AsString := Colocacion;
           Report.Variables.ByName['Hoy'].AsDateTime := Now;
           if ProximaCuota = 0 then
            Report.Variables.ByName['ProximaCuota'].AsString := '0000/00/00'
           else
            Report.Variables.ByName['ProximaCuota'].AsString := DateToStr(ProximaCuota);
//           Report.Variables.ByName['ProximaCuota'].AsDateTime := ProximaCuota;
           Report.Variables.ByName['FechaCorte'].AsDateTime := FechaCorte;
           Report.Variables.ByName['Asociado'].AsString := Asociado;
           Report.Variables.ByName['NuevoSaldo'].AsDouble := NuevoSaldo;
           REport.Variables.ByName['InteresesHasta'].AsDateTime := InteresesHasta;
           Report.Variables.ByName['CapitalHasta'].AsDateTime := CapitalHasta;
           Report.Variables.ByName['comprobante'].AsString := VNoComprobante;
           Report.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;

           if Report.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Report;
              frmVistaPreliminar.ShowModal;
           end;
//              Report.PreviewPreparedReport(True);

           SQL.Clear;
           SQL.Add('drop table ' + Tabla);
           ExecSQL;
           Close;
           Transaction.CommitRetaining;
        end;
end;

procedure TfrmOperacionesCaja.CmdColManualClick(Sender: TObject);
begin
        CapOperacion := 'B';
        CmdRetornar.Enabled := True;
        VOopcion;
        GBColocaciones.Enabled := False;
        TabsNoVisibles;
        PageControl.ActivePage := TabColocacionesManual;
        PageControl.Visible := True;
        InicializarCol;
//        EdNumeroColocacionManual.SetFocus;
//        PageColocacion.ActivePage := TabColMan1;

end;

procedure TfrmOperacionesCaja.EdNumeroColocacionManualExit(
  Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
           vColocacion := trim(EdNumeroColocacionManual.Text);
           EdNumeroColocacionManual.Text := vColocacion;

        If EdNumeroColocacionManual.Text = '' then Exit;

        with IBVerificaTmp do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$extractotmp" where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ExecQuery;
          if RecordCount > 0 then begin
            MessageDlg('Colocación con Liquidación Temporal para Desembolso',mtError,[mbOK],0);
            CmdReversarManual.Click;
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
                SQL.Add('"col$colocacion".NUMERO_CUENTA,');
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
                SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION ');
                SQL.Add(' FROM ');
                SQL.Add('"col$colocacion" ');
                SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION) ');
                SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION) ');
                SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
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


                if RecordCount > 0 then
                begin
                      Clasificacion := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
                      Garantia := FieldByName('DESCRIPCION_GARANTIA').AsString;
                      IdEstado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                      Estado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                      ClasificacionM := FieldByName('ID_CLASIFICACION').AsInteger;
                      GarantiaM := FieldByName('ID_GARANTIA').AsInteger;
                      Categoria := FieldByName('ID_CATEGORIA').AsString;
                      TipoCuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
                      TipoDeInteres := FieldByName('INTERES').AsString;
                      Amortizacion := FieldByName('AMORTIZA_INTERES').AsInteger;
                      AmortizaK := FieldByName('AMORTIZA_CAPITAL').AsInteger;
                      FechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                      Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                      EdTipoIdentificacionManual.Caption := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger) + '-' +  FieldByName('ID_PERSONA').AsString;
                      EdNombreManual.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      EdEstadoManual.Caption := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                      vSaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
                      vPuntosAdic := FieldByName('PUNTOS_INTERES').asfloat;
                      TipoInteres   := FieldByName('ID_INTERES').AsInteger;

                      if FieldByName('TIPO_INTERES').AsString = 'F' then
                        TasaC := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
                      else
                        TasaC := FieldByName('VALOR_ACTUAL_TASA').AsFloat;

                      if (IdEstado > 2) or (vSaldoActual <= 0) then begin
                        MessageDlg('No se permite liquidar esta colocación',mtError,[mbcancel],0);
                        Exit;
                      end;

                      GroupBox1.Visible := True;

                      EdSaldoColocacionManual.Caption := FormatCurr('#,#0.00',vSaldoActual);
                      vFechaCapital := FieldByname('FECHA_CAPITAL').AsDateTime;
                      vValorCuota := FieldByName('VALOR_CUOTA').AsCurrency;
                      EdFechaCapitalManual.Caption := DateToStr(vFechaCapital);
                      vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                      EdFechaInteresManual.Caption := DateToStr(vFechaInteres);
                      EdNoComprobanteManual.Caption := '??????';
                      EsCapital.SetFocus;

                      Close;
                      SQL.Clear;
                      SQL.Add('select SUM(VALOR_COSTAS) AS COSTAS from "col$costas" where');
                      SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
                      ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      ParamByName('ID_COLOCACION').AsString := vColocacion;
                      try
                        Open;
                        if RecordCount > 0 then
                           EdCostas.Caption := FormatCurr('#,#0',FieldByName('COSTAS').AsCurrency);
                      except
                           EdCostas.Caption := '';
                      end;
                      Close;

                   SQL.Clear;
                   SQL.Add('select COD_INT_ANT from "col$codigospuc" where ');
                   SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
                   SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
                   SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
                   ParamByName('ID_CLASIFICACION').AsInteger := Clasificacionm;
                   ParamByName('ID_GARANTIA').AsInteger      := GarantiaM;
                   ParamByName('ID_CATEGORIA').AsString     := Categoria;
                   Open;
                   CodigoAnt := FieldByName('COD_INT_ANT').AsString;
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
                   Open;
                   NumeroCuentaAbogado := FieldByName('NUMERO_CUENTA').AsInteger;
                   DigitoCuentaAbogado := FieldByName('DIGITO_CUENTA').AsInteger;
                   if NumeroCuentaAbogado <> 0 then
                    begin
                      groupbox14.Visible := True;
                      EdCuentaAbogadoM.Caption := IntToStr(NumeroCuentaAbogado) + '-' + IntToStr(DigitoCuentaAbogado);
                      EdAbogadoM.Caption := FieldByName('NOMBRE').AsString + ' ' +
                                            FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                            FieldByName('SEGUNDO_APELLIDO').AsString;
                    end;
                   Close;
                end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                      EdNumeroColocacionManual.SetFocus;
                end;
        end;

end;

procedure TfrmOperacionesCaja.EsCapitalClick(Sender: TObject);
begin
        if EsCapital.Checked = True then
        begin
           GroupBox4.Visible := True;
           CmdAceptarManual.Visible := True;
           CmdAceptarManual.Enabled := True;
           EdAbonoCapital.SetFocus;
        end
        else
        begin
           vAbonoCapital := 0;
           GroupBox4.Visible := False;
           Devueltos.Checked := False;
           Cobrados.Checked := False;

           LimpiarDevueltos;
           LimpiarCobrados;

           esinteresesclick(Sender);
           if not EsIntereses.Checked then begin
              CmdAceptarManual.Visible := True;
              CmdAceptarManual.Enabled := True;
           end;
        end;


end;

procedure TfrmOperacionesCaja.EsInteresesClick(Sender: TObject);
var DiasMinimo,DiasTiene:Integer;
begin
        if EsIntereses.Checked = True then
        begin

           PageControl2.Visible := True;
           PageControl2.ActivePage := InfoIntereses;
           GroupBox6.TabStop := True;
           GroupBox7.TabStop := False;
           GroupBox8.TabStop := False;
           InfoIntereses.TabVisible := True;
           InfoDevueltos.TabVisible := False;
           InfoCobrados.TabVisible := False;
           Devueltos.Checked := False;
           Cobrados.Checked := False;
           LimpiarDevueltos;
           LimpiarCobrados;

           TGeneral := TGeneral - vInteresCobrado + vInteresDevuelto;

           vInteresCobrado := 0;
           vInteresDevuelto := 0;
           vTasaDevCob := 0;

           EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

           CmdAceptarManual.Visible := True;
           CmdAceptarManual.Enabled := True;

           EdAbonoInteresCausado.SetFocus;
           
           with IBSQL1 do begin
             Close;
             SQL.Clear;
             SQL.Add('select DIAS_INICIALES from "col$codigospuc" where');
             SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ID_GARANTIA = :ID_GARANTIA and');
             SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
             ParamByName('ID_CLASIFICACION').AsInteger := ClasificacionM;
             ParamByName('ID_GARANTIA').AsInteger := GarantiaM;
             ParamByName('ID_CATEGORIA').AsString := 'C';
             try
              ExecQuery;
              DiasMinimo := FieldByName('DIAS_INICIALES').AsInteger;
             except
              DiasMinimo := 9999;
              raise;
             end;

             DiasTiene := DiasEntre(vFechaInteres,StrToDate(EdFecha.Caption));
             if TipoDeInteres = 'V' then DiasTiene := DiasTiene - Amortizacion;
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
        end
        else
        begin
           PageControl2.Visible := False;
           LimpiarManualIntereses;
           if not EsCapital.Checked  then begin
              CmdAceptarManual.Visible := True;
              CmdAceptarManual.Enabled := True;
           end;
        end;
end;

procedure TfrmOperacionesCaja.EdAbonoCapitalExit(Sender: TObject);
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
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto+ vPapeleria + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.DevueltosClick(Sender: TObject);
begin
        if Devueltos.Checked then
         begin
           EsIntereses.Checked := False;
           EsInteresesClick(Sender);
           PageControl2.Visible := True;
           PageControl2.ActivePage := InfoDevueltos;
           InfoIntereses.TabVisible := False;
           InfoDevueltos.TabVisible := True;
           InfoCobrados.TabVisible := False;
           GroupBox6.TabStop := False;
           GroupBox7.TabStop := True;
           GroupBox8.TabStop := False;
           LimpiarCobrados;
           EdInteresDevuelto.SetFocus;
         end;

end;

procedure TfrmOperacionesCaja.CobradosClick(Sender: TObject);
begin
        if Cobrados.Checked = True then
         begin
           EsIntereses.Checked := False;
           EsInteresesClick(Sender);
           PageControl2.Visible := True;
           PageControl2.ActivePage := InfoCobrados;
           GroupBox6.TabStop  := False;
           GroupBox7.TabStop  := False;
           GroupBox8.TabStop  := True;
           InfoIntereses.TabVisible := False;
           InfoDevueltos.TabVisible := False;
           InfoCobrados.TabVisible := True;
           EsIntereses.Checked := False;
           LimpiarDevueltos;
           EdInteresCobradoCausado.SetFocus;
         end;



end;

procedure TfrmOperacionesCaja.EdInteresCobradoExit(Sender: TObject);
begin
{          if EdInteresCobrado.Text = '' then EdInteresCobrado.Text := '0';
          vInteresCobrado := StrToCurr(EdInteresCobrado.Text);
          EdInteresCobrado.Text := FormatCurr('#,##0',vInteresCobrado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
}
end;

procedure TfrmOperacionesCaja.EdInteresDevueltoExit(Sender: TObject);
begin
          if EdInteresDevuelto.Text = '' then EdInteresDevuelto.Text := '0';
          vInteresDevuelto := StrToCurr(EdInteresDevuelto.Text);
          EdInteresDevuelto.Text := FormatCurr('#,##0',vInteresDevuelto);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TfrmOperacionesCaja.EdFechaInicialCobradoExit(Sender: TObject);
begin
//        vFechaInicialCobrado := EdFechaInicialCobrado.Date;

end;

procedure TfrmOperacionesCaja.EdFechaFinalCobradoExit(Sender: TObject);
begin
//        vFechaFinalCobrado := EdFechaFinalCobrado.Date;

end;

procedure TfrmOperacionesCaja.EdFechaInicialDevueltoExit(Sender: TObject);
begin
//        vFechaInicialDevuelto := EdFechaInicialDevuelto.Date;

end;

procedure TfrmOperacionesCaja.EdFechaFinalDevueltoExit(Sender: TObject);
begin
//        vFechaFinalDevuelto := EdFechaFinalDevuelto.Date;

end;

procedure TfrmOperacionesCaja.EdAbonoInteresCausadoExit(Sender: TObject);
begin
          if EdAbonoInteresCausado.Text = '' then EdAbonoInteresCausado.Text := '0';
          vAbonoInteresCausado := StrToCurr(EdAbonoInteresCausado.Text);
          EdAbonoInteresCausado.Text := FormatCurr('#,##0',vAbonoInteresCausado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto+ vPapeleria + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdFechaInicialCausadoExit(Sender: TObject);
begin
        vFechaInicialCausado := EdFechaInicialCausado.Date;

end;

procedure TfrmOperacionesCaja.EdFechaFinalCausadoExit(Sender: TObject);
begin
        vFechaFinalCausado := EdFechaFinalCausado.Date;

end;

procedure TfrmOperacionesCaja.EdDiasAplicadosCausadoExit(Sender: TObject);
begin
        if EdDiasAplicadosCausado.Text = '' then EdDiasAplicadosCausado.Text := '0';
        vDiasCausado := StrToInt(EdDiasAplicadosCausado.Text);
        EdDiasAplicadosCausado.Text := FormatCurr('#0',vDiasCausado);
        DiasCausados;
        DiasContingentes;
        DiasCorrientes;
        DiasAnticipados;
        DiasMoras;
        if (idEstado = 2) or (idEstado = 3) then
          vTasaCausado := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora
        else
          vTasaCausado := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,vFechaFinalCausado,FechaInteres).TasaLiquidar;
        EdTasaAplicadaCausado.Text := FormatCurr('#0.00%',vTasaCausado);        
end;

procedure TfrmOperacionesCaja.EdAbonoInterescorrienteExit(Sender: TObject);
begin
          if EdAbonoInteresCorriente.Text = '' then EdAbonoInteresCorriente.Text := '0';
          vAbonoInteresCorriente := StrToCurr(EdAbonoInteresCorriente.Text);
          EdAbonoInteresCorriente.Text := FormatCurr('#,##0',vAbonoInteresCorriente);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto+ vPapeleria + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdFechaInicialCorrienteExit(Sender: TObject);
begin
        vFechaInicialCorriente := EdFechaInicialCorriente.Date;

end;

procedure TfrmOperacionesCaja.EdFechaFinalCorrienteExit(Sender: TObject);
begin
        vFechaFinalCorriente := EdFechaFinalCorriente.Date;

end;

procedure TfrmOperacionesCaja.EdDiasAplicadosCorrienteExit(
  Sender: TObject);
begin
        if EdDiasAplicadosCorriente.Text = '' then EdDiasAplicadosCorriente.Text := '0';
        vDiasCorriente := StrToInt(EdDiasAplicadosCorriente.Text);
        EdDiasAplicadosCorriente.Text := FormatCurr('#0',vDiasCorriente);
        DiasCorrientes;
        DiasAnticipados;
        DiasMoras;
        if (idEstado = 2) or (idEstado = 3) then
          vTasaCorriente := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora
        else
          vTasaCorriente := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,vFechaFinalCausado,FechaInteres).TasaLiquidar;
        EdTasaAplicadaCorriente.Text := FormatCurr('#0.00%',vTasaCorriente);
end;

procedure TfrmOperacionesCaja.EdAbonoInteresAnticipadoExit(
  Sender: TObject);
begin
          if EdAbonoInteresAnticipado.Text = '' then EdAbonoInteresAnticipado.Text := '0';
          vAbonoInteresAnticipado := StrToCurr(EdAbonoInteresAnticipado.Text);
          EdAbonoInteresAnticipado.Text := FormatCurr('#,##0',vAbonoInteresAnticipado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto+ vPapeleria + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdFechaInicialAnticipadoExit(
  Sender: TObject);
begin
        vFechaInicialAnticipado := EdFechaInicialAnticipado.Date;

end;

procedure TfrmOperacionesCaja.EdFechaFinalAnticipadoExit(Sender: TObject);
begin
        vFechaFinalAnticipado := EdFechaFinalAnticipado.Date;

end;

procedure TfrmOperacionesCaja.EdDiasAplicadosAnticipadoExit(
  Sender: TObject);
begin
        if EdDiasAplicadosAnticipado.Text = '' then EdDiasAplicadosAnticipado.Text := '0';
        vDiasAnticipado := StrToInt(EdDiasAplicadosAnticipado.Text);
        EdDiasAplicadosAnticipado.Text := FormatCurr('#0',vDiasAnticipado);
        DiasAnticipados;
        DiasMoras;
        if (IdEstado = 2) or (IdEstado = 3) then
          vTasaAnticipado := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora
        else
          vTasaAnticipado := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,vFechaFinalAnticipado,FechaInteres).TasaLiquidar;
        EdTasaAplicadaAnticipado.Text := FormatCurr('#0.00%',vTasaAnticipado);
end;

procedure TfrmOperacionesCaja.EdAbonoInteresMoraExit(Sender: TObject);
begin
          if EdAbonoInteresMora.Text = '' then EdAbonoInteresMora.Text := '0';
          vAbonoInteresMora := StrToCurr(EdAbonoInteresMora.Text);
          EdAbonoInteresMora.Text := FormatCurr('#,##0',vAbonoInteresMora);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto+ vPapeleria + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdFechaInicialMoraExit(Sender: TObject);
begin
        vFechaInicialMora := EdFechaInicialMora.Date;

end;

procedure TfrmOperacionesCaja.EdFechaFinalMoraExit(Sender: TObject);
begin
        vFechaFinalMora := EdFechaFinalMora.Date;

end;

procedure TfrmOperacionesCaja.EdDiasAplicadosMoraExit(Sender: TObject);
begin
        if EdDiasAplicadosMora.Text = '' then EdDiasAplicadosMora.Text := '0';
        vDiasMora := StrToInt(EdDiasAplicadosMora.Text);
        EdDiasAplicadosMora.Text := FormatCurr('#0',vDiasMora);
        DiasMoras;
        vTasaMora := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora;
        EdTasaAplicadaMora.Text := FormatCurr('#0.00%',vTasaMora);
end;

procedure TfrmOperacionesCaja.CmdGenerarInformeManualClick(
  Sender: TObject);
var Tabla:string;
    I:Integer;
    AF:PCuotasLiq;
    frmVistaPreliminar:TfrmVistaPreliminar;
    Asociado : string;
begin
        Empleado;
        Asociado := EdNombre.Caption;
        Tabla := '"temp' + FloatToStr(Now)+ '"';
        with IBQuery do
        begin
           SQL.Clear;
           SQL.Add('create table ' + Tabla + ' (');
           SQL.Add('CUOTA               INTEGER,');
           SQL.Add('CODIGO              CHAR(18),');
           SQL.Add('ID_AGENCIA          TIPOS,');
           SQL.Add('FECHA_INICIAL       DATE,');
           SQL.Add('FECHA_FINAL         DATE,');
           SQL.Add('DIAS                INTEGER,');
           SQL.Add('TASA                DOUBLE PRECISION,');
           SQL.Add('DEBITO              NUMERICO,');
           SQL.Add('CREDITO             NUMERICO);');
           ExecSQL;
           Transaction.CommitRetaining;
           Close;

           SQL.Clear;
           SQL.Add('insert into ' + Tabla + 'values(');
           SQL.Add(':"CUOTA",');
           SQL.Add(':"CODIGO",');
           SQL.Add(':"ID_AGENCIA",');
           SQL.Add(':"FECHA_INICIAL",');
           SQL.Add(':"FECHA_FINAL",');
           SQL.Add(':"DIAS",');
           SQL.Add(':"TASA",');
           SQL.Add(':"DEBITO",');
           SQL.Add(':"CREDITO");');

           for I := 0 to (MyCuotasLiq.Lista.Count - 1) do
           begin
                AF := MyCuotasLiq.Lista.Items[I];
                ParamByName('CUOTA').AsInteger := AF^.CuotaNumero;
                ParamByName('CODIGO').AsString := AF^.CodigoPuc;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA_INICIAL').AsDate := AF^.FechaInicial;
                ParamByName('FECHA_FINAL').AsDate := AF^.FechaFinal;
                ParamByName('DIAS').AsInteger := AF^.Dias;
                ParamByName('TASA').AsFloat := AF^.Tasa;
                ParamByName('DEBITO').AsCurrency := AF^.Debito;
                ParamByName('CREDITO').AsCurrency := AF^.Credito;
                ExecSQL;
           end;
           Close;

           SQL.Clear;
           SQL.Add('select ');
           SQL.Add(Tabla + '.ID_AGENCIA,');
           SQL.Add('CUOTA,');
           SQL.Add(Tabla + '.CODIGO,');
           SQL.Add('NOMBRE,');
           SQL.Add('FECHA_INICIAL,');
           SQL.Add('FECHA_FINAL,');
           SQL.Add('DIAS,');
           SQL.Add('TASA,');
           SQL.Add('DEBITO,');
           SQL.Add('CREDITO ');
           SQL.Add('from ' + Tabla + ' ');

           SQL.Add('LEFT JOIN "con$puc" ON (' + Tabla + '.CODIGO = "con$puc".CODIGO and ');
           SQL.Add(Tabla + '.ID_AGENCIA = "con$puc".ID_AGENCIA )');
           Open;

           ReportM.Variables.ByName['Empresa'].AsString := Empresa;
           ReportM.Variables.ByName['Colocacion'].AsString := vColocacion;
           Reportm.Variables.ByName['Hoy'].AsDateTime := Date;
           Reportm.Variables.ByName['FechaCorte'].AsDateTime := Date;
           Reportm.Variables.ByName['Asociado'].AsString := Asociado;
//           Reportm.Variables.ByName['Cuenta'].AsString := IntToStr(NumeroCuenta) + '-' + IntToStr(DigitoCuenta);
           Reportm.Variables.ByName['NuevoSaldo'].AsDouble := vSaldoActual - vAbonoCapital;
           Reportm.Variables.ByName['InteresesHasta'].AsDateTime := vFechaFInt;
           Reportm.Variables.ByName['CapitalHasta'].AsDateTime := FechaCapAnt;
           Reportm.Variables.ByName['comprobante'].AsString := VComprobante;
           Reportm.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;

           if Reportm.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := ReportM;
              frmVistaPreliminar.ShowModal;
           end;
           SQL.Clear;
           SQL.Add('drop table ' + Tabla);
           ExecSQL;
           Close;
           Transaction.CommitRetaining;
        end;

end;

procedure TfrmOperacionesCaja.CmdAceptarManualAntClick(Sender: TObject);
var
totaldebitos : currency;
totalcreditos : currency;
CodigoCaja  : String;
vCalFechaCausado : TDate;
vCalFechaCorriente : TDate;
vCalFechaAnticipado : TDate;
vCalFechaMora : TDate;
CapitalxDia : Currency;
DiasK : string;
DiasCapital : Integer;
comprobante : string;
begin

        CmdAceptarManual.Enabled := False;
        Application.ProcessMessages;


        totaldebitos := 0;
        totalcreditos := 0;

        with dmColocacion.IBSQL do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
           ExecQuery;
           CodigoCaja := FieldByName('CODIGO').AsString;
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
        end;

        with dmColocacion.IBSQLcodigos do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$codigospuc" where ');
          SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
          SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
          SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
          ParamByName('ID_CLASIFICACION').AsInteger := ClasificacionM;
          ParamByName('ID_GARANTIA').AsInteger      := GarantiaM;
          ParamByName('ID_CATEGORIA').AsString     := Categoria;
          try
            ExecQuery;
          except
            MessageDlg('Error al Consultar Codigos',mtError,[mbcancel],0);
            Transaction.RollbackRetaining;
            Exit;
          end;
        end;

        if vAbonoCapital <> 0 then
         begin
           CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
           if CapitalaPagar = 0 then CapitalaPagar := vValorCuota;
           CapitalxDia := CapitalaPagar/AmortizaK;
           DiasK := CurrToStr(int(vAbonocapital/CapitalxDia));
           DiasCapital := StrToInt(DiasK);
           FechaInicial := StrToDate(EdFecha.Caption);
           FechaFinal   := StrToDate(EdFecha.Caption);
           vFechaCapital := FechaFinal;
           Dias := 0;
           Tasa := 0;
           DebitoM := 0;
           CreditoM := vAbonoCapital;
           TotaldebitosM := TotaldebitosM + DebitoM ;
           TotalcreditosM := TotalcreditosM + CreditoM;
           GrabarExtractoDetM;
         end;

        if vInteresDevuelto <> 0 then
         begin
           devolucion := True;
           CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
           FechaInicial := vFechaInicialDevuelto;
           FechaFinal   := vFechaFinalDevuelto;
           Dias := 0;
           Tasa := 0;
           DebitoM := vInteresDevuelto;
           CreditoM := 0;
           TotaldebitosM := TotalDebitosM  + DebitoM;
           TotalcreditosM := TotalCreditosM  + CreditoM;
           GrabarExtractoDetM;
           vFechaIInt := FechaInicial;
           vFechaFInt := FechaFinal;
         end;

        if vInteresCobrado <> 0 then
         begin
           CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;
           FechaInicial := vFechaInicialCobrado;
           FechaFinal   := vFechaFinalCobrado;
           Dias := 0;
           Tasa := 0;
           DebitoM := 0;
           CreditoM := vInteresCobrado;
           TotaldebitosM := TotaldebitosM + debitoM;
           TotalcreditosM := TotalcreditosM + creditoM;
           GrabarExtractoDetM;
           vFechaIInt := FechaInicial;
           vFechaFInt := FechaFinal;
         end;

        if vAbonoInteresCausado <> 0 then
         begin
           CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString;
           FechaInicial := vFechaInicialCausado;
           FechaFinal := vFechaFinalCausado;
           vDiasCausado := DiasEntre(vFechaInicialCausado,vFechaFinalCausado);
           if vDiasCausado <= 0  then
            begin
              MessageDlg('Error en Fechas, Favor Verificar',mtInformation,[mbOK],0);
              IBQuery.Transaction.RollbackRetaining;
              Exit;
            end;
           Dias := vDiasCausado;
           Tasa := vTasaCausado;
           DebitoM := 0;
           CreditoM := vAbonoInteresCausado;
           TotaldebitosM := TotaldebitosM + debitoM;
           TotalcreditosM := TotalcreditosM + creditoM;
           TasaLiquidacion := Tasa;
           GrabarExtractoDetM;
           vFechaIInt := FechaInicial;
           vFechaFInt := FechaFinal;
         end;

        if vAbonoInteresCorriente <> 0 then
         begin
           CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;
           FechaInicial := vFechaInicialCorriente;
           FechaFinal := vFechaFinalCorriente;
           vDiasCorriente := DiasEntre(vFechaInicialCorriente,vFechaFinalCorriente);
           if vDiasCorriente <= 0  then
            begin
              MessageDlg('Error en Fechas, Favor Verificar',mtInformation,[mbOK],0);
              IBQuery.Transaction.RollbackRetaining;
              Exit;
            end;
           Dias := vDiasCorriente;
           Tasa := vTasaCorriente;
           DebitoM := 0;
           CreditoM := vAbonoInteresCorriente;
           TotaldebitosM := TotaldebitosM + debitoM;
           TotalcreditosM := TotalcreditosM + creditoM;
           TasaLiquidacion := Tasa;
           GrabarExtractoDetM;
           vFechaIInt := FechaInicial;
           vFechaFInt := FechaFinal;
         end;

        if vAbonoInteresAnticipado <> 0 then
         begin
           CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
           FechaInicial := vFechaInicialAnticipado;
           FechaFinal := vFechaFinalAnticipado;
           vDiasAnticipado := DiasEntre(vFechaInicialAnticipado,vFechaFinalAnticipado);
           if vDiasAnticipado <= 0  then
            begin
              MessageDlg('Error en Fechas, Favor Verificar',mtInformation,[mbOK],0);
              IBQuery.Transaction.RollbackRetaining;
              Exit;
            end;
           Dias := vDiasAnticipado;
           Tasa := vTasaAnticipado;
           DebitoM := 0;
           CreditoM := vAbonoInteresAnticipado;
           TotaldebitosM := TotaldebitosM + debitoM;
           TotalcreditosM := TotalcreditosM + creditoM;
           TasaLiquidacion := Tasa;
           GrabarExtractoDetM;
           vFechaIInt := FechaInicial;
           vFechaFInt := FechaFinal;
         end;

        if vAbonoInteresMora <> 0 then
         begin
           CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;
           FechaInicial := vFechaInicialMora;
           FechaFinal := vFechaFinalMora;
           Dias := vDiasMora;
           Tasa := vTasaMora;
           DebitoM := 0;
           CreditoM := vAbonoInteresMora;
           TotaldebitosM := TotaldebitosM + debitoM;
           TotalcreditosM := TotalcreditosM + creditoM;
           TasaLiquidacion := Tasa;
           GrabarExtractoDetM;
         end;


        Caja := TotalcreditosM - TotaldebitosM;
        vTotalInteres := vAbonoInteresCausado + vAbonoInteresCorriente + vAbonointeresAnticipado;
        CodigoPuc := CodigoCaja;
        FechaInicial := StrToDate(EdFecha.Caption);
        FechaFinal := StrToDate(EdFecha.Caption);
        Dias := 0;
        Tasa := 0;
        DebitoM := Caja;
        CreditoM := 0;
        GrabarExtractoDetM;
        Caja := 0;
        TotalDebitosM := 0;
        TotalCreditosM := 0;


        GrabarExtractoColM;
        VerificarCancelacionCredito(Agencia,vColocacion);
        DmColocacion.IBSQLcodigos.Close;

        CmdGenerarInformeManual.Enabled := True;
        CmdAceptar.Visible := False;
        CmdAceptar.Enabled := False;
        CmdRecaudarManual.Visible := True;
        CmdRecaudarManual.Enabled := True;
        CmdReversarManual.Visible := True;
        CmdReversarManual.Enabled := True;
        CmdRecaudarManual.SetFocus;

end;

procedure TfrmOperacionesCaja.GrabarExtractoDetM;
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
          ParamByName('FECHA_EXTRACTO').AsDate := StrToDate(EdFecha.Caption);
          ParamByName('HORA_EXTRACTO').AsDateTime := Time;
          ParamByName('CODIGO_PUC').AsString := CodigoPuc;
          ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
          ParamByName('FECHA_FINAL').AsDate := FechaFinal;
          ParamByName('DIAS_APLICADOS').AsInteger := Dias;
          ParamByName('TASA_LIQUIDACION').AsFloat := Tasa;
          ParamByName('VALOR_DEBITO').AsCurrency := DebitoM;
          ParamByName('VALOR_CREDITO').AsCurrency := CreditoM;
          ExecSql;
          Close;
        end;

end;

procedure TfrmOperacionesCaja.GrabarExtractoColM;
var
FechaIntAnt:TDate;
FechaCapAnt:TDate;
vCuotaTipo : String;
VDesembolso: Currency;
FechaDesembolso:TDate;
vDeudaTabla:Currency;
CapitalaPagarTabla:Currency;
FechaPagar:tdate;
CuotaN:Integer;
CapitalP,InteresP :Currency;
begin
//        if TipoCuota = 2 then TasaLiquidacion := TasaNominalAnticipada(TasaLiquidacion,Amortizacion);
//        if (TipoCuota = 1) or (TipoCuota = 3) then TasaLiquidacion := TasaNominalVencida(TasaLiquidacion,Amortizacion);

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

           SQL.Clear;
           SQL.Add('select CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGAR,INTERES_A_PAGAR');
           SQL.Add('from "col$tablaliquidacion" where ID_COLOCACION = :ID_COLOCACION AND PAGADA = 0');
           SQL.Add('ORDER BY CUOTA_NUMERO ASC');
           ParamByName('ID_COLOCACION').AsString := vColocacion;
           Open;
           CuotaN := FieldByName('CUOTA_NUMERO').AsInteger;
           FechaPagar := FieldByName('FECHA_A_PAGAR').AsDateTime;
           CapitalP := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
           InteresP := FieldByName('INTERES_A_PAGAR').AsCurrency;
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
          ParamByName('ID_AGENCIA').AsInteger := Agencia ;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := StrToDate(EdFecha.Caption);
          ParamByName('HORA_EXTRACTO').AsDateTime := Time;
          ParamByName('CUOTA_EXTRACTO').AsInteger := 0;
          ParamByName('TIPO_OPERACION').AsInteger := 1;
          ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
          ParamByName('ABONO_CAPITAL').AsCurrency := vAbonocapital;
          ParamByName('ABONO_CXC').AsCurrency := vAbonoInteresCausado;
          if vInteresCobrado <> 0 then
             ParamByName('ABONO_SERVICIOS').AsCurrency := vInteresCobrado
          else
             ParamByName('ABONO_SERVICIOS').AsCurrency := vAbonoInteresCorriente + vAbonoInteresContingente;

          if vInteresDevuelto <> 0 then
             ParamByName('ABONO_ANTICIPADO').AsCurrency := vInteresDevuelto
          else
             ParamByName('ABONO_ANTICIPADO').AsCurrency := vAbonoInteresAnticipado;
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
          begin
             ParamByName('INTERES_PAGO_HASTA').AsDate := FechaIntAnt;
             ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasaDevCob;
          end;

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
//     Verificacion de Credito
     if ChVCredito.Checked then
      begin
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
         if (EsCapital.Checked = True) and (EsIntereses.Checked = True) then
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
               if NuevaFechaCapital = 0 then NuevaFechaCapital := FechaCapAnt;
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
         if (InteresaPagar >= 0) and (InteresaPagar <= vTotalInteres) and (SaldoTabla <= (vSaldoActual - vAbonocapital)) then
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
      end // fin Verificacion de Credito
     else
      begin
          if ((EsCapital.Checked = True) and (CapitalP <= vAbonocapital) and (EsIntereses.Checked = True)) then
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
            ParamByName('FECHA_CAPITAL').AsDate := FechaPagar;
            ExecSql;
            Close;
            NuevaFechaCapital := FechaPagar;
           end
          else if ((EsCapital.Checked = True) and (EsIntereses.Checked = True)) then
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
            ParamByName('FECHA_CAPITAL').AsDate := vFechaCapital;
            ExecSql;
            Close;
            NuevaFechaCapital := vFechaCapital;
           end
          else if (EsCapital.Checked = True) then
           begin
            sql.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL"');
            sql.Add(' where ');
            sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('ABONOS_CAPITAL').AsCurrency := vAbonoCapital;
            ExecSql;
            Close;
            NuevaFechaCapital := vFechaCapital;
           end;

          if (EsIntereses.Checked = True)  and (vTotalInteres > 0) then
          begin
            sql.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
            sql.Add(' where ');
            sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('FECHA_INTERES').AsDate := vFechaFInt;
            ExecSql;
            Close;
           end;

         if (vCuotaTipo = 'F') and
            (EsCapital.Checked = True) and
            (EsIntereses.Checked = True) and
            (CapitalP <= vAbonocapital) and
            (vFechaFInt <= FechaPagar) then
          begin
            sql.Clear;
            sql.Add('update "col$tablaliquidacion" set ');
            sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
            sql.Add(' where ');
            sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
            sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
            ExecSql;
            Close;

            sql.Clear;
            sql.Add('update "col$extracto" set ');
            sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO",');
            SQL.Add('CAPITAL_PAGO_HASTA = :FECHAK, INTERES_PAGO_HASTA = :FECHAI');
            sql.Add(' where ');
            sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
            sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
            ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
            ParamByName('FECHAK').AsDate := FechaPagar;
            ParamByName('FECHAI').AsDate := vFechaFInt;
            ExecSql;
            Close;
          end;

         if vCuotaTipo = 'V' then
          if (CapitalP > 0) and (InteresP > 0) then
           begin
             if (EsCapital.Checked = True) and (EsIntereses.Checked = True) and (CapitalP <= vAbonocapital) and (vTotalInteres > 0) then
              begin
                sql.Clear;
                sql.Add('update "col$tablaliquidacion" set ');
                sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
                sql.Add(' where ');
                sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
                sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_COLOCACION').AsString := vColocacion;
                ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
                ExecSql;
                Close;

                sql.Clear;
                sql.Add('update "col$extracto" set ');
                sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO",');
                SQL.Add('CAPITAL_PAGO_HASTA = :FECHAK, INTERES_PAGO_HASTA = :FECHAI');
                sql.Add(' where ');
                sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
                sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
                sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_COLOCACION').AsString := vColocacion;
                ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
                ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
                ParamByName('FECHAK').AsDate := FechaPagar;
                ParamByName('FECHAI').AsDate := vFechaFInt;
                ExecSql;
                Close;
              end;
           end
          else
          if (EsCapital.Checked = True) and (EsIntereses.Checked = True) and (CapitalP > 0) and (CapitalP <= vAbonocapital) then
           begin
             sql.Clear;
             sql.Add('update "col$tablaliquidacion" set ');
             sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
             sql.Add(' where ');
             sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
             sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
             sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_COLOCACION').AsString := vColocacion;
             ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
             ExecSql;
             Close;

             sql.Clear;
             sql.Add('update "col$extracto" set ');
             sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO", CAPITAL_PAGO_HASTA = :FECHAK');
             sql.Add(' where ');
             sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
             sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
             sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_COLOCACION').AsString := vColocacion;
             ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
             ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
             ParamByName('FECHAK').AsDate := FechaPagar;
             ExecSql;
             Close;
           end
          else
         if (EsIntereses.Checked = True) and (InteresP > 0) and (vTotalInteres > 0) then
          begin
            sql.Clear;
            sql.Add('update "col$tablaliquidacion" set ');
            sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
            sql.Add(' where ');
            sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
            sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
            ExecSql;
            Close;

            sql.Clear;
            sql.Add('update "col$extracto" set ');
            sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO", INTERES_PAGO_HASTA = :FECHAI');
            sql.Add(' where ');
            sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
            sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
            ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
            ParamByName('FECHAI').AsDate := FechaPagar;
            ExecSql;
            Close;
          end;
         end;
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
       if NuevaFechaCapital = 0 then NuevaFechaCapital := FechaCapAnt;
end;

procedure TfrmOperacionesCaja.CmdSumadoraClick(Sender: TObject);
begin
        Calculadora.Execute;
end;

procedure TfrmOperacionesCaja.CmdReversarManualClick(Sender: TObject);
begin
          CmdReversarManual.Enabled := False;
          Application.ProcessMessages;
          DmGeneral.IBTransaction1.Rollback;
          CmdRetornar.Click;
end;

procedure TfrmOperacionesCaja.CmdRecaudarManualClick(Sender: TObject);
var frmValidarColocacion :TfrmValidarColocacion;
    I :Integer;
    AR:PCuotasLiq;
begin
    if MessageDlg('Seguro de Realizar el Abono?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
              CmdRecaudarManual.Enabled := False;
              CmdReversarManual.Enabled := False;
              CmdRecaudarManual.Visible := False;
              CmdReversarManual.Visible := False;
              CmdGenerarInformeManual.Enabled := False;
//              CmdGenerarInformeManual.Visible := False;
              Application.ProcessMessages;

              vComprobante := Format('%.7d',[ObtenerConsecutivoCajaCartera]);
              EdNoComprobanteManual.Caption := vComprobante;

              with IBQuery do begin
                grabarextractocolm;
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
                  try
                    ExecSql;
                    Close;
                  except
                    Transaction.Rollback;
                    MessageDlg('Error al Grabar el Detallado',mtError,[mbcancel],0);
                    Exit;
                  end;
                end;
                // LLevo al extracto de Ahorros
                if Agencia <> 2 then
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
                   ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdNoComprobanteManual.Caption;
                   ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'PAGO DE HONORARIOS COL. No.' + vColocacion;
                   ParamByName('VALOR_DEBITO').AsCurrency := vHonorarios;
                   ParamByName('VALOR_CREDITO').AsCurrency := 0;
                   try
                     ExecSQL;
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
              end;

              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientocol" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_COLOCACION,');
              IBOtros.SQL.Add(':DOCUMENTO,:CAPITAL,:INTERESES,:DEVOLUCION,:OTROS,:BILLETES,:MONEDAS,:ID_PERSONA)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacionManual.Text;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdNoComprobanteManual.Caption;
              IBOtros.ParamByName('CAPITAL').AsCurrency := vAbonoCapital;
              IBOtros.ParamByName('INTERESES').AsCurrency := vTotalInteres;
              IBOtros.ParamByName('DEVOLUCION').AsCurrency := Devuelto;
              IBOtros.ParamByName('OTROS').AsCurrency := vcostas+vhonorarios+vPapeleria;
              IBOtros.ParamByName('BILLETES').AsCurrency := TGeneral;
              IBOtros.ParamByName('MONEDAS').AsCurrency := 0;
              IBOtros.ParamByName('ID_PERSONA').AsString := '';
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.Rollback;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Exit;
                 end;
              except
                  IBOtros.Transaction.Rollback;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Exit;
              end;

// Grabar Cheques



//

        IBQuery.Transaction.Commit;
        IBQuery.Transaction.StartTransaction;
        VerificarCancelacionCredito(Agencia,vColocacion);
        Timer.Enabled := False;
           frmValidarColocacion := TfrmValidarColocacion.Create(Self);
           with frmValidarColocacion do
           begin
               CValidar.Fecha := StrToDate(EdFecha.Caption);
               CValidar.Caja := StrToInt(EdCaja.Caption);
               CValidar.Cuenta := Cuenta;
               CValidar.Documento := StrToInt(EdNoComprobanteManual.Caption);
               CValidar.Colocacion := EdNumeroColocacionManual.Text;
               CValidar.Nombre := EdNombreManual.Caption;
               CValidar.Clasificacion := Clasificacion;
               CValidar.Garantia := Garantia;
               CValidar.Estado := Estado;
               CValidar.FechaInt := vFechaFInt;
               CValidar.Capital := vAbonoCapital;
               CValidar.Interes := vTotalInteres;
               CValidar.Devuelto := vInteresDevuelto;
               CValidar.Otras := vcostas+vhonorarios+vPapeleria;
               CValidar.NuevoSaldo := vSaldoActual - vAbonoCapital;
               CValidar.Efectivo := TGeneral;
               Validar := CValidar;
               ShowModal;
               Free;
           end;

           MessageDlg('Abono Realizado con Exito!',mtInformation,[mbok],0);

     end
    else
     begin
       dmGeneral.IBTransaction1.Rollback;
       MessageDlg('Abono NO Realizado',mtInformation,[mbOK],0);
       Inicializarcol;
     end;

     Timer.Enabled := True;
     CmdRetornar.Click;




end;

procedure TfrmOperacionesCaja.BtnCerrarClick(Sender: TObject);
begin
        CmdRetornar.Click;
end;

procedure TfrmOperacionesCaja.DiasAnticipados;
begin
        if EdDiasAplicadosAnticipado.Text = '' then EdDiasAplicadosAnticipado.Text := '0';
        vDiasAnticipado := StrToInt(EdDiasAplicadosAnticipado.Text);
        EdDiasAplicadosAnticipado.Text := FormatCurr('#0',vDiasAnticipado);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaInteres,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresContingente <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaFinalContingente,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaFinalCorriente,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end;

{        if EdDiasAplicadosAnticipado.Text = '' then EdDiasAplicadosAnticipado.Text := '0';
        vDiasAnticipado := StrToInt(EdDiasAplicadosAnticipado.Text);
        EdDiasAplicadosAnticipado.Text := FormatCurr('#0',vDiasAnticipado);
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := IncDay(vFechaFinalCorriente);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := IncDay(vFechaFinalCorriente);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := IncDay(vFechaFinalCausado);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := IncDay(vFechaInteres);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end;
}
end;

procedure TfrmOperacionesCaja.DiasMoras;
begin
        if EdDiasAplicadosMora.Text = '' then EdDiasAplicadosMora.Text := '0';
        vDiasMora := StrToInt(EdDiasAplicadosMora.Text);
        EdDiasAplicadosMora.Text := FormatCurr('#0',vDiasMora);
        if (vAbonoInteresMora > 0) and (TipoDeInteres = 'V') then
         begin
           if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaInteres,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.DateTime := vFechaInicialMora;
              EdFechaFinalMora.DateTime := vFechaFinalMora;
            end
           else
           if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalCausado,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.DateTime := vFechaInicialMora;
              EdFechaFinalMora.DateTime := vFechaFinalMora;
            end
           else
           if (vAbonoInteresContingente <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalContingente,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.DateTime := vFechaInicialMora;
              EdFechaFinalMora.DateTime := vFechaFinalMora;
            end
           else
           if (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalCorriente,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.DateTime := vFechaInicialMora;
              EdFechaFinalMora.DateTime := vFechaFinalMora;
            end
           else
           if (vAbonointeresAnticipado <> 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalAnticipado,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.DateTime := vFechaInicialMora;
              EdFechaFinalMora.DateTime := vFechaFinalMora;
            end;
         end;
        if (vAbonoInteresMora > 0) and (TipoDeInteres = 'A') then
         begin
           vFechaInicialMora := CalculoFecha(vFechaInteres,1);
           vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
           EdFechaInicialMora.DateTime := vFechaInicialMora;
           EdFechaFinalMora.DateTime := vFechaFinalMora;
         end;

{        if EdDiasAplicadosMora.Text = '' then EdDiasAplicadosMora.Text := '0';
        vDiasMora := StrToInt(EdDiasAplicadosMora.Text);
        EdDiasAplicadosMora.Text := FormatCurr('#0',vDiasMora);
        if vAbonoInteresMora > 0 then
         if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
          begin
            vFechaInicialMora := IncDay(vFechaFinalAnticipado);
            vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado = 0) then
          begin
            vFechaInicialMora := IncDay(vFechaFinalCorriente);
            vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
          begin
            vFechaInicialMora := IncDay(vFechaFinalCausado);
            vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
         else
         if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
          begin
            vFechaInicialMora := IncDay(vFechaFinalAnticipado);
            vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
          begin
            vFechaInicialMora := IncDay(vFechaFinalCorriente);
            vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado = 0) then
          begin
            vFechaInicialMora := IncDay(vFechaFinalCorriente);
            vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
          begin
            vFechaInicialMora := IncDay(vFechaInteres);
            vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end;
}
end;

procedure TfrmOperacionesCaja.DiasCorrientes;
begin
        if EdDiasAplicadosCorriente.Text = '' then EdDiasAplicadosCorriente.Text := '0';
        vDiasCorriente := StrToInt(EdDiasAplicadosCorriente.Text);
        EdDiasAplicadosCorriente.Text := FormatCurr('#0',vDiasCorriente);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaInteres,1);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.DateTime := vFechaInicialCorriente;
           EdFechaFinalCorriente.DateTime := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.DateTime := vFechaInicialCorriente;
           EdFechaFinalCorriente.DateTime := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresContingente <> 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaFinalContingente,1);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.DateTime := vFechaInicialCorriente;
           EdFechaFinalCorriente.DateTime := vFechaFinalCorriente;
         end;

{        if EdDiasAplicadosCorriente.Text = '' then EdDiasAplicadosCorriente.Text := '0';
        vDiasCorriente := StrToInt(EdDiasAplicadosCorriente.Text);
        EdDiasAplicadosCorriente.Text := FormatCurr('#0',vDiasCorriente);
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente <> 0) then
         begin
           vFechaInicialCorriente := IncDay(vFechaFinalCausado);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.DateTime := vFechaInicialCorriente;
           EdFechaFinalCorriente.DateTime := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente <> 0) then
         begin
           vFechaInicialCorriente := IncDay(vFechaInteres);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInteres,vDiasCorriente);
           EdFechaInicialCorriente.DateTime := vFechaInicialCorriente;
           EdFechaFinalCorriente.DateTime := vFechaFinalCorriente;
         end;
}
end;

procedure TfrmOperacionesCaja.DiasCausados;
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
{
        if EdDiasAplicadosCausado.Text = '' then EdDiasAplicadosCausado.Text := '0';
        vDiasCausado := StrToInt(EdDiasAplicadosCausado.Text);
        EdDiasAplicadosCausado.Text := FormatCurr('#0',vDiasCausado);
        if (vAbonoInteresContingente <> 0 ) and (vAbonoInteresCausado <> 0) then
        begin
           vFechaInicialCausado := IncDay(vFechaFinalContingente);
           vFechaFinalCausado := CalculoFechaManual(vFechaFinalContingente,vDiasCausado);
           EdFechaInicialCausado.Date := vFechaInicialCausado;
           EdFechaFinalCausado.Date := vFechaFinalCausado;
        end
        else
        if (vAbonoInteresContingente = 0) and (vAbonoInteresCausado <> 0) then
         begin
           vFechaInicialCausado := IncDay(vFechaInteres);
           vFechaFinalCausado := CalculoFechaManual(vFechaInteres,vDiasCausado);
           EdFechaInicialCausado.DateTime := vFechaInicialCausado;
           EdFechaFinalcausado.DateTime := vFechaFinalCausado;
         end;
}
end;

procedure TfrmOperacionesCaja.EdDiasAplicadosCausadoChange(
  Sender: TObject);
begin
        DiasCausados;
        DiasContingentes;
        DiasCorrientes;
        DiasAnticipados;
        DiasMoras;

end;

procedure TfrmOperacionesCaja.EdDiasAplicadosCorrienteChange(
  Sender: TObject);
begin
        DiasCorrientes;
        DiasAnticipados;
        DiasMoras;

end;

procedure TfrmOperacionesCaja.EdDiasAplicadosAnticipadoChange(
  Sender: TObject);
begin
        DiasAnticipados;
        DiasMoras;
end;

procedure TfrmOperacionesCaja.CmdVerChequesGenClick(Sender: TObject);
var frmRelacionCheques:TfrmRelacionCheques;
begin
    frmRelacionCheques:=TfrmRelacionCheques.Create(Self);
    frmRelacionCheques.ListaCheques := ListaCheques;
    if frmRelacionCheques.ShowModal = mrok then
    begin
        ListaCheques := frmRelacionCheques.ListaCheques;
        EdChequesGen.Value := frmRelacionCheques.ValorCheques;
    end;

end;

procedure TfrmOperacionesCaja.EdChequesGenChange(Sender: TObject);
begin
        TCheques := EdChequesGen.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;

procedure TfrmOperacionesCaja.EdChequesGenExit(Sender: TObject);
begin
        if (EdChequesGen.Value > 0) and
           (CapOperacion = 'L') then
           CmdVerCheques.Click;

end;

procedure TfrmOperacionesCaja.Excepciones(Sender: TObject; E: Exception);
begin
  if E.ClassNameIs('EIBInterbaseError') then
    ShowMessage(Format('IBErrorCode: %d - SQLErrorCode: %d',
          [EIBInterbaseError(e).IBErrorCode,EIBInterbaseError(e).SQLCode])+#13+
           'Mensaje: '+e.Message)
  else
    ShowMessage(E.Message);
end;

procedure TfrmOperacionesCaja.CmdAceptarManualClick(Sender: TObject);
var
totaldebitos,totalcreditos:Currency;
I,J:Integer;
CodigoCaja  : String;
CodigoAhorros : string;
CodigoIvaGenerado : string;
CodigoPapeleria : string;
vCalFechaCausado : TDate;
vCalFechaCorriente : TDate;
vCalFechaAnticipado : TDate;
vCalFechaMora : TDate;
CapitalxDia : Currency;
DiasK : string;
DiasCapital : Integer;
SaldoAhorros:Currency;
Movimiento:Currency;
TotalCanje : Currency;
comprobante : string;
AR:PCuotasLiq;
SumTasa:Single;
SumDias:Integer;
begin

        CmdAceptarManual.Enabled := False;
        Application.ProcessMessages;

        TotalDebitosM := 0;
        TotalCreditosM := 0;
        Empleado;

        GroupBox1.Enabled := False;
        GroupBox4.Enabled := False;
        PageControl2.Enabled := False;

//**
        with dmColocacion.IBSQL do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
           ExecQuery;
           CodigoCaja := FieldByName('CODIGO').AsString;
           Close;

           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = :ID_CODIGO');
           if Agencia = 2 then
             ParamByName('ID_CODIGO').AsInteger := 16
           else
             ParamByName('ID_CODIGO').AsInteger := 8;
           ExecQuery;
           CodigoAhorros := FieldByName('CODIGO').AsString;
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
           SQL.Add('Select sum(CAPITAL_A_PAGAR) as CAPITAL from "col$tablaliquidacion"');
           SQL.Add('where ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION AND');
           SQL.Add('CUOTA_NUMERO <= :CUOTA');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := vColocacion;
           ParamByName('CUOTA').AsInteger := CuotaTabla;
           SaldoTabla := FieldByName('CAPITAL').AsCurrency;
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
           vFechaFInt := FechaIntAnt;
           Close;
        end;

        with dmColocacion.IBSQLcodigos do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$codigospuc" where ');
          SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
          SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
          SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
          ParamByName('ID_CLASIFICACION').AsInteger := ClasificacionM;
          ParamByName('ID_GARANTIA').AsInteger      := GarantiaM;
          ParamByName('ID_CATEGORIA').AsString     := Categoria;
          try
            ExecQuery;
          except
            MessageDlg('Error al Consultar Codigos',mtError,[mbcancel],0);
            Transaction.Rollback;
            Exit;
          end;
        end;

        MyCuotasLiq.Lista := TList.Create;
        if vAbonoCapital <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
           if CapitalaPagar = 0 then CapitalaPagar := vValorCuota;
           CapitalxDia := CapitalaPagar/AmortizaK;
           DiasK := CurrToStr(int(vAbonocapital/CapitalxDia));
           DiasCapital := StrToInt(DiasK);
           AR^.FechaInicial := StrToDate(EdFecha.Caption); //vFechaCapital;
           AR^.FechaFinal   := StrToDate(EdFecha.Caption); //CalculoFecha(vFechaCapital,DiasCapital);
           vFechaCapital := AR^.FechaFinal;
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
           TotalDebitosM  := TotalDebitosM  + AR^.Debito;
           TotalCreditosM  := TotalCreditosM  + AR^.Credito;
         end;

        if vInteresDevuelto <> 0 then
         begin
           New(AR);
           devolucion := True;
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
           AR^.FechaInicial := vFechaInicialDevuelto;
           AR^.FechaFinal   := vFechaFinalDevuelto;
           AR^.Dias := DiasEntre(vFechaInicialDevuelto,vFechaFinalDevuelto);
           AR^.Tasa := vTasaDevCob;
           AR^.Debito := vInteresDevuelto;
           AR^.Credito := 0;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := True;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := FechaIntAnt;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosM  := TotalDebitosM  + AR^.Debito;
           TotalCreditosM  := TotalCreditosM   + AR^.Credito;
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
           TotaldebitosM := TotaldebitosM + AR^.Debito;
           TotalcreditosM := TotalcreditosM + AR^.Credito;
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
           TotaldebitosM := TotaldebitosM + AR^.Debito;
           TotalcreditosM := TotalcreditosM + AR^.Credito;
         end;

         vInteresCobrado := vInteresCobradoCausado + vInteresCobradoCorriente;
         if vInteresCobrado > 0 then
            vTasaDevCob := ((vTasaCobradoCausado * vDiasCobradoCausado) + (vTasaCobradoCorriente * vDiasCobradoCorriente)) / (vDiasCobradoCausado + vDiasCobradoCorriente);

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
           TotalDebitosM := TotalDebitosM + AR^.Debito;
           TotalCreditosM := TotalCreditosM + AR^.Credito;
         end;

        if vAbonoInteresContingente <> 0 then
        begin
          New(AR);
          AR^.CuotaNumero := 0;          
          AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;
          AR^.FechaInicial := vFechaInicialContingente;
          AR^.FechaFinal := vFechaFinalContingente;
//          vDiasContingente := DiasEntre(vFechaInicialContingente,vFechaFinalContingente);
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
           TotalDebitosM := TotalDebitosM + AR^.Debito;
           TotalCreditosM := TotalCreditosM + AR^.Credito;
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
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosM := TotalDebitosM + AR^.Debito;
           TotalCreditosM := TotalCreditosM + AR^.Credito;
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
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosM := TotalDebitosM + AR^.Debito;
           TotalCreditosM := TotalCreditosM + AR^.Credito;
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
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosM := TotalDebitosM + AR^.Debito;
           TotalCreditosM := TotalCreditosM + AR^.Credito;
         end;

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
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosM := TotalDebitosM + AR^.Debito;
           TotalCreditosM := TotalCreditosM + AR^.Credito;
         end;

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
           TotalDebitosM := TotalDebitosM + AR^.Debito;
           TotalCreditosM := TotalCreditosM + AR^.Credito;

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
           TotalDebitosM := TotalDebitosM + AR^.Debito;
           TotalCreditosM := TotalCreditosM + AR^.Credito;
        end;

        if vhonorarios <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoAhorros;
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
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosM := TotalDebitosM + AR^.Debito;
           TotalCreditosM := TotalCreditosM + AR^.Credito;
         end;


// Coloco Caja
          Caja := TotalcreditosM - TotalDebitosM;
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoCaja;
          AR^.FechaInicial := StrToDate(EdFecha.Caption);
          AR^.FechaFinal   := StrToDate(EdFecha.Caption);
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCreditosM - TotalDebitosM;
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
          TotalDebitosM  := 0;
          TotalCreditosM  := 0;

         if  MyCuotasLiq.Lista.Count > 0 then
          for I := 0 to MyCuotasLiq.Lista.Count -1 do
          begin
                AR := MyCuotasLiq.Lista.Items[i];
                if AR^.EsCausado or AR^.EsCorriente or AR^.EsAnticipado then begin
                   SumTasa := SumTasa + (ar^.Tasa * AR^.Dias);
                   SumDias := SumDias + ar^.Dias;
                end;
          end;
          try
            TasaLiquidacion := SumTasa / SumDias;
          except
            TasaLiquidacion := Tasa;
          end;

        vTotalInteres := vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente + vAbonoInteresAnticipado + vInteresCobradoCausado + vInteresCobradoCorriente;

        DmColocacion.IBSQLcodigos.Close;

        CmdGenerarInformeManual.Enabled := True;
        CmdAceptar.Visible := False;
        CmdAceptar.Enabled := False;
        CmdRecaudarManual.Visible := True;
        CmdRecaudarManual.Enabled := True;
        CmdReversarManual.Visible := True;
        CmdReversarManual.Enabled := True;
        CmdRecaudarManual.SetFocus;

end;

procedure TfrmOperacionesCaja.EdTasaDevCobExit(Sender: TObject);
begin
{        if EdTasaDevCob.Text = '' then EdTasaDevCob.Text := '0.00';
        vTasaDevCob := StrToFloat(EdTasaDevCob.Text);
        EdTasaDevCob.Text := FormatCurr('#0.00%',vTasaDevCob);
}
end;

procedure TfrmOperacionesCaja.DiasContingentes;
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

{
        if EdDiasAplicadosContingente.Text = '' then EdDiasAplicadosContingente.Text := '0';
        vDiasContingente := StrToInt(EdDiasAplicadosContingente.Text);
        EdDiasAplicadosContingente.Text := FormatCurr('#0',vDiasContingente);
        if vAbonoInteresContingente > 0 then
         begin
           vFechaInicialContingente := IncDay(vFechaInteres);
           vFechaFinalContingente := CalculoFechaManual(vFechaInteres,vDiasContingente);
           EdFechaInicialContingente.Date := vFechaInicialContingente;
           EdFechaFinalContingente.Date := vFechaFinalContingente;
         end;
}
end;

procedure TfrmOperacionesCaja.EdAbonoInteresContingenteExit(
  Sender: TObject);
begin
          if EdAbonoInteresContingente.Text = '' then EdAbonoInteresContingente.Text := '0';
          vAbonoInteresContingente := StrToCurr(EdAbonoInteresContingente.Text);
          EdAbonoInteresContingente.Text := FormatCurr('#,##0',vAbonoInteresContingente);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto+ vPapeleria + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);   
end;

procedure TfrmOperacionesCaja.EdAbonoCostasExit(Sender: TObject);
begin
          if EdAbonoCostas.Text = '' then EdAbonoCostas.Text := '0';
          vcostas := StrToCurr(EdAbonoCostas.Text);
          EdAbonoCostas.Text := FormatCurr('#,##0',vcostas);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto+ vPapeleria + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdAbonoHonorariosExit(Sender: TObject);
begin
          if EdAbonoHonorarios.Text = '' then EdAbonoHonorarios.Text := '0';
          vhonorarios := StrToCurr(EdAbonoHonorarios.Text);
          EdAbonoHonorarios.Text := FormatCurr('#,##0',vhonorarios);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto+ vPapeleria + vcostas + vhonorarios;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
          CmdAceptarManual.SetFocus;
end;

procedure TfrmOperacionesCaja.LimpiarManualIntereses;
begin




  EdAbonoInteresContingente.Text := '';
  EdAbonoInteresCausado.Text := '';
  EdAbonoInterescorriente.Text := '';
  EdAbonoInteresAnticipado.Text := '';
  EdAbonoInteresMora.Text := '';
  EdAbonoCostas.Text := '';
  EdAbonoHonorarios.Text := '';

  EdDiasAplicadosContingente.Text := '';
  EdDiasAplicadosCausado.Text := '';
  EdDiasAplicadosCorriente.Text := '';
  EdDiasAplicadosAnticipado.Text := '';
  EdDiasAplicadosMora.Text := '';

  EdTasaAplicadaContingente.Text := '';
  EdTasaAplicadaCausado.Text := '';
  EdTasaAplicadaCorriente.Text := '';
  EdTasaAplicadaAnticipado.Text := '';
  EdTasaAplicadaMora.Text := '';

  TGeneral := TGeneral - vAbonoInteresContingente - vAbonoInteresCausado -
                         vAbonoInteresCorriente - vAbonoInteresAnticipado -
                         vAbonoInteresMora - vcostas - vhonorarios;

  vAbonoInteresContingente :=0;
  vDiasContingente:=0;
  vTasaContingente:=0;

  vAbonoInteresCausado:=0;
  vDiasCausado:=0;
  vTasaCausado:=0;

  vAbonoInteresCorriente:=0;
  vDiasCorriente:=0;
  vTasaCorriente:=0;

  vAbonoInteresAnticipado:=0;
  vDiasAnticipado:=0;
  vTasaAnticipado:=0;

  vAbonoInteresMora:=0;
  vDiasMora := 0;
  vTasaMora := 0;

  vhonorarios := 0;
  vcostas := 0;

  vPuntosAdic:=0;
  TipoInteres:=0;
  IdEstado:=0;

  EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);


end;

procedure TfrmOperacionesCaja.EdDiasAplicadosContingenteChange(
  Sender: TObject);
begin
        DiasContingentes;
        DiasCorrientes;
        DiasAnticipados;
        DiasMoras;

end;

procedure TfrmOperacionesCaja.EdDiasAplicadosContingenteExit(
  Sender: TObject);
begin
        if EdDiasAplicadosContingente.Text = '' then EdDiasAplicadosContingente.Text := '0';
        vDiasContingente := StrToInt(EdDiasAplicadosContingente.Text);
        EdDiasAplicadosContingente.Text := FormatCurr('#0',vDiasContingente);
        DiasContingentes;
        DiasCorrientes;
        DiasAnticipados;
        DiasMoras;
        if (idEstado = 2) or (idEstado = 3) then
          vTasaContingente := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora
        else
          vTasaContingente := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,vFechaFinalCausado,FechaInteres).TasaLiquidar;
        EdTasaAplicadaContingente.Text := FormatCurr('#0.00%',vTasaContingente);
end;

procedure TfrmOperacionesCaja.EdDiasAplicadosMoraChange(Sender: TObject);
begin
        DiasMoras;
end;

procedure TfrmOperacionesCaja.EdDiasDevueltoChange(Sender: TObject);
begin
        DiasDevueltos;

end;

procedure TfrmOperacionesCaja.EdDiasDevueltoExit(Sender: TObject);
begin
        DiasDevueltos;
        vTasaDevolucion := BuscoTasaDevManual(vColocacion,CodigoAnt,vFechaFinalDevuelto);
        EdTasaDevolucion.Text := FormatCurr('#0.00%',vTasaDevolucion);
        CmdAceptarManual.SetFocus;
end;

procedure TfrmOperacionesCaja.DiasDevueltos;
begin
        if EdDiasDevuelto.Text = '' then EdDiasDevuelto.Text := '0';
        vDiasDevuelto := StrToInt(EdDiasDevuelto.Text);
        EdDiasDevuelto.Text := FormatCurr('#0',vDiasDevuelto);
        if (vInteresDevuelto <> 0) then
        begin
           vFechaInicialDevuelto := CalculoFecha(vFechaInteres,1);
           if vFechaInicialDevuelto >= StrToDate(EdFecha.Caption) then
              vFechaInicialDevuelto := CalculoFecha(StrToDate(EdFecha.Caption),1);
           vFechaFinalDevuelto := CalculoFechaManual(vFechaInicialDevuelto,vDiasDevuelto);
           EdFechaInicialDevuelto.Date := vFechaInicialDevuelto;
           EdFechaFinalDevuelto.Date := vFechaFinalDevuelto;
        end;
end;

procedure TfrmOperacionesCaja.EdInteresCobradoCausadoExit(Sender: TObject);
begin
          if EdInteresCobradoCausado.Text = '' then EdInteresCobradoCausado.Text := '0';
          vInteresCobradoCausado := StrToCurr(EdInteresCobradoCausado.Text);
          EdInteresCobradoCausado.Text := FormatCurr('#,##0',vInteresCobradoCausado);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdInteresCobradoCorrienteExit(
  Sender: TObject);
begin
          if EdInteresCobradoCorriente.Text = '' then EdInteresCobradoCorriente.Text := '0';
          vInteresCobradoCorriente := StrToCurr(EdInteresCobradoCorriente.Text);
          EdInteresCobradoCorriente.Text := FormatCurr('#,##0',vInteresCobradoCorriente);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdDiasCobradoCausadoChange(Sender: TObject);
begin
        DiasCobradoCausado;
        DiasCobradoCorriente;

end;

procedure TfrmOperacionesCaja.EdDiasCobradoCausadoExit(Sender: TObject);
begin
        DiasCobradoCausado;
        DiasCobradoCorriente;
        if (IdEstado = 2) or (IdEstado = 3) then
          vTasaCobradoCausado := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora
        else
          vTasaCobradoCausado := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,vFechaFinalCobradoCausado,FechaInteres).TasaLiquidar;
        EdTasaCobradoCausado.Text := FormatCurr('#0.00%',vTasaCobradoCausado);
end;

procedure TfrmOperacionesCaja.DiasCobradoCausado;
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

procedure TfrmOperacionesCaja.EdDiasCobradoCorrienteExit(Sender: TObject);
begin
        DiasCobradoCorriente;
        if (IdEstado = 2) or (IdEstado = 3) then
          vTasaCobradoCorriente := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora
        else
          vTasaCobradoCorriente := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,vFechaFinalCobradoCorriente,FechaInteres).TasaLiquidar;
        EdTasaCobradoCorriente.Text := FormatCurr('#0.00%',vTasaCobradoCorriente);
        CmdAceptarManual.SetFocus;
end;

procedure TfrmOperacionesCaja.EdDiasCobradoCorrienteChange(
  Sender: TObject);
begin
        DiasCobradoCorriente;

end;

procedure TfrmOperacionesCaja.DiasCobradoCorriente;
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

procedure TfrmOperacionesCaja.LimpiarDevueltos;
begin
           EdInteresDevuelto.Text := '';
           vInteresDevuelto := 0;
           EdFechaInicialDevuelto.Date := Date;
           vFechaInicialDevuelto := Date;
           EdFechaFinalDevuelto.Date :=Date;
           vFechaFinalDevuelto := Date;
           EdDiasDevuelto.Text := '';
           vDiasDevuelto := 0;
           EdTasaDevolucion.Text := '';
           vTasaDevolucion := 0;
end;

procedure TfrmOperacionesCaja.LimpiarCobrados;
begin
           EdInteresCobradoCausado.Text := '';
           vInteresCobradoCausado := 0;
           EdFechaInicialCobradoCausado.Date := Date;
           vFechaInicialCobradoCausado := Date;
           EdFechaFinalCobradoCausado.Date :=Date;
           vFechaFinalCobradoCausado := Date;
           EdDiasCobradoCausado.Text := '';
           vDiasCobradoCausado := 0;
           EdTasaCobradoCausado.Text := '';
           vTasaCobradoCausado := 0;
           EdInteresCobradoCorriente.Text := '';
           vInteresCobradoCorriente := 0;
           EdFechaInicialCobradoCorriente.Date := Date;
           vFechaInicialCobradoCorriente := Date;
           EdFechaFinalCobradoCorriente.Date := Date;
           vFechaFinalCobradoCorriente := Date;
           EdDiasCobradoCorriente.Text := '';
           vDiasCobradoCorriente := 0;
           EdTasaCobradoCorriente.Text := '';
           vTasaCobradoCorriente := 0;        

end;

procedure TfrmOperacionesCaja.BitBtn1Click(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacionManual.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionManualExit(TObject(EdNumeroColocacionManual));
        end;
end;

procedure TfrmOperacionesCaja.NingunoClick(Sender: TObject);
begin
       if Ninguno.Checked then begin
        LimpiarCobrados;
        LimpiarDevueltos;
        Devueltos.Checked := False;
        Cobrados.Checked := False;
        InfoDevueltos.TabVisible := False;
        InfoCobrados.TabVisible := False;
       end;
end;

function TfrmOperacionesCaja.SaldoEnCaja: Currency;
var Saldo:Currency;
    Fecha:TDate;
begin
        Fecha := StrToDate(EdFecha.Caption);
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select SALDOACTUAL from CAJ_SALDOACTUAL(:ID_CAJA,:FECHA1,:FECHA2)');
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         ParamByName('FECHA1').AsDateTime := EncodeDateTime(YearOf(Fecha),MonthOf(Fecha),DayOf(Fecha),00,00,00,000);
         ParamByName('FECHA2').AsDateTime := EncodeDateTime(YearOf(Fecha),MonthOf(Fecha),DayOf(Fecha),23,59,59,999);
         try
          ExecQuery;
          if RecordCount > 0 then
            Saldo := FieldByName('SALDOACTUAL').AsCurrency
          else
            Saldo := 0;
         except
          Transaction.Rollback;
          Saldo := 0;
          MessageDlg('Error al Leer Saldo en Caja',mtError,[mbok],0);
          raise;
         end;
        end;
        Result := Saldo + saldoremoto;
end;

procedure TfrmOperacionesCaja.ChkAutorizadoEnter(Sender: TObject);
begin
        LAutorizado.Color := clSilver;
end;

procedure TfrmOperacionesCaja.ChkAutorizadoExit(Sender: TObject);
begin
                LAutorizado.Color := clBtnFace;
end;

procedure TfrmOperacionesCaja.EdTotalBilletesCapEnter(Sender: TObject);
begin
        if TipoCaptacion = 5 then
           EdTotalBilletesCap.Value := ValorCuotaCon;
end;

procedure TfrmOperacionesCaja.cmdConfrontarHuellaClick(Sender: TObject);
var
    BlobStream:TMemoryStream;
    BlobField:TBlobField;
    i:Integer;
begin
        with IBQueryHuella do begin
           Close;
           SQL.Clear;
           SQL.Add('select DATOS_HUELLA from "gen$persona" WHERE ');
           sql.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and');
           SQL.Add('ID_PERSONA = :ID_PERSONA');
           ParamByName('ID_IDENTIFICACION').AsInteger := 3;
           ParamByName('ID_PERSONA').AsString := Identificacion;
           Open;
           if RecordCount > 0 then
           begin
            try
                BlobStream := TMemoryStream.Create;
                (FieldByName('DATOS_HUELLA') as TBlobField).SaveToStream(BlobStream);
                vTamano := BlobStream.Size;
                if BlobStream.Size = 0 then begin
                   MessageDlg('No tiene información Registrada',mtError,[mbcancel],0);
                   Exit;
                end;
                BlobStream.Position := 0;
                BlobStream.read(pvData,vTamano);
            finally
                BlobStream.Free;
            end;
            ValidarHuella;
           end
           else
           begin
             MessageDlg('No Tiene Huella Registrada!',mtInformation,[mbOk],0);
             Exit;
           end;
        end;

end;

procedure TfrmOperacionesCaja.ValidarHuella;
var
  m_tUnknown : IUnknown;
begin
  frmPantallaHuella := TfrmPantallaHuella.Create(Self);
  frmPantallaHuella.Show;
  Application.ProcessMessages;
  try
    FPGetTemplate1.Connect;
    m_tUnknown := CreateComObject(CLASS_FPVerify);
    m_tUnknown.QueryInterface(IID_IFPVerify,c_IVerify);
    FPGetTemplate1.Run(1,pErr);
  except
    frmPantallaHuella.Free;
    MessageDlg('Error al iniciar el proceso de verificación por Huella',mterror,[mbcancel],0);
    raise;
    Exit;
  end;
end;

procedure TfrmOperacionesCaja.FPGetTemplate1Done(Sender: TObject;
  var pTemplate: OleVariant);
var
         m_byteBuf : PByteArray;
        m_verifyOk : WordBool;
           m_score : OleVariant;
        m_security : AISecureModeMask;
       m_threshold : OleVariant;
            m_data : OleVariant;
            m_loop : Integer;
        m_learning : WordBool;
        m_tUnknown : IUnknown;
     c_regTemplate : IFPTemplate;
begin
         frmPantallaHuella.Free;
         FPGetTemplate1.Cancel(pErr);
         FPGetTemplate1.Disconnect;
         m_learning := False;
         m_verifyOk := False;
        try
          //Creating Template Object
          m_tUnknown := CreateComObject(CLASS_FPTemplate);
          //Asking for IFPTemplate Interface
          m_tUnknown.QueryInterface(IID_IFPTemplate,c_RegTemplate);
//          m_data := VarArrayCreate([0,frmRegister.blobSize],varByte);
          m_data := VarArrayCreate([0,vTamano],varByte);

        except
               ShowMessage('Error al Confrontar, Favor Reingrese al Módulo!!');
               raise;
               Exit;
        end;

         m_byteBuf := VarArrayLock(m_data);
         m_verifyOk := False;

         for m_loop := 0 to vTamano do
                m_byteBuf[m_loop] := pvData[m_loop];

         VarArrayUnlock(m_data);

         c_RegTemplate.Import(m_data);

         VarClear(m_data);
         c_IVerify.Compare(c_RegTemplate,pTemplate,m_verifyOk,m_score,m_threshold,m_learning,m_security);
         c_RegTemplate._Release;
         c_regTemplate := nil;
         c_IVerify := nil;

//         FPGetTemplate1.Cancel(pErr);

         if m_verifyOk = False then begin
           MessageDlg('Huella No Concuerda',mtError,[mbcancel],0);
           ctlHuella := False;
         end
         else if m_verifyOk = True then begin
           MessageDlg('Huella Concuerda Correctamente',mtInformation,[mbOk],0);
           ctlHuella := True;
         end;

end;

procedure TfrmOperacionesCaja.FPGetTemplate1SampleReady(Sender: TObject;
  var pSample: OleVariant);
var
        smple : IFPSample;
        picDis : IDispatch;
        smDisp : IDispatch;
begin
   smDisp := IDispatch(pSample);
   smDisp.QueryInterface(IID_IFPSample,smple);
   smple.Set_PictureOrientation(1);
   smple.Set_PictureWidth (frmPantallaHuella.Image1.Width);
   smple.Set_PictureHeight(frmPantallaHuella.Image1.Height);
   picDis := smple.Get_Picture;
   SetOlePicture(frmPantallaHuella.Image1.Picture, IPictureDisp(picDis));
end;

procedure TfrmOperacionesCaja.PagoTotalClick(Sender: TObject);
begin
        if PagoTotal.Checked then
         CredPagoTotal := True
        else
         CredPagoTotal := False;
end;

procedure TfrmOperacionesCaja.EdCasNumeroColocacionExit(Sender: TObject);
var IdEstado:Integer;
begin
         if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
           vColocacion := trim(EdCasNumeroColocacion.Text);
           EdCasNumeroColocacion.Text := vColocacion;

        If EdCasNumeroColocacion.Text = '' then Exit;
        ChkPapeleriaCas.Enabled := True;

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
                SQL.Add('"col$colocacion".NUMERO_CUENTA,');
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
                SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
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
                   EdCasNumeroColocacion.SetFocus;
                   Exit;
                 end;
                ActualizarCaptaciones(FieldByName('ID_IDENTIFICACION').AsInteger,FieldByName('ID_PERSONA').AsString);
                TipoCuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
                Amortizacion := FieldByName('AMORTIZA_INTERES').AsInteger;
                AmortizaK := FieldByName('AMORTIZA_CAPITAL').AsInteger;
                TipoDeInteres := FieldByName('INTERES').AsString;

                if RecordCount > 0 then
                begin
                  Clasificacion := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
                  Garantia := FieldByName('DESCRIPCION_GARANTIA').AsString;
                  IdEstado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                  Estado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                  ClasificacionM := FieldByName('ID_CLASIFICACION').AsInteger;
                  GarantiaM := FieldByName('ID_GARANTIA').AsInteger;
                  Categoria := FieldByName('ID_CATEGORIA').AsString;
                  FechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                  Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;

                  TipoInteres   := FieldByName('ID_INTERES').AsInteger;
                  if FieldByName('TIPO_INTERES').AsString = 'F' then
                    TasaC := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
                  else
                    TasaC := FieldByName('VALOR_ACTUAL_TASA').AsFloat;

                  EdCasTipoIdentificacion.Caption := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger) + '-' +  FieldByName('ID_PERSONA').AsString;
                  EdCasNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                  vSaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
                  EdCasSaldoActual.Caption := FormatCurr('#,#0.00',vSaldoActual);
                  vFechaCapital := FieldByname('FECHA_CAPITAL').AsDateTime;
                  EdCasFechaCapital.Caption := DateToStr(vFechaCapital);
                  vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                  vFechaInteresCas := vFechaInteres;
                  EdCasFechaInteres.Caption := DateToStr(vFechaInteres);
                  EdCasEstado.Caption := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                  Close;

                with IBSQL2 do
                 begin
                   Close;
                   SQL.Clear;
                   SQL.Add('select sum("col$costas".VALOR_COSTAS) as COSTAS');
                   SQL.Add('FROM "col$costas" WHERE');
                   SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND');
                   SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');
                   ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   ParamByName('ID_COLOCACION').AsString := vColocacion;
                   ExecQuery;
                   EdCasCostas.Caption := FormatCurr('#,#0',FieldByName('COSTAS').AsCurrency);
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
                      groupbox13.Visible := true;
                      EdCasCuentaAbogado.Caption := IntToStr(NumeroCuentaAbogado) + '-' + IntToStr(DigitoCuentaAbogado);
                      EdCasAbogado.Caption := FieldByName('NOMBRE').AsString + ' ' +
                                              FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                              FieldByName('SEGUNDO_APELLIDO').AsString;
                    end;
                   Close;
                 end;
                 groupbox11.Enabled := True;
                 EdAbonoCapitalCas.SetFocus;

                end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                      EdCasNumeroColocacion.SetFocus;
                end;
        end;
end;

procedure TfrmOperacionesCaja.CmdColCastigadaClick(Sender: TObject);
begin
        CapOperacion := 'T';
        CmdRetornar.Enabled := True;
        VOopcion;
        GBColocaciones.Enabled := False;
        TabsNoVisibles;
        PageControl.ActivePage := TabColCastigada;
        PageControl.Visible := True;
        InicializarCastigada;
end;

procedure Tfrmoperacionescaja.ActualizarCaptaciones(
TipoId: integer; NumeroId: String);
var  Saldo :Currency;
     i:Integer;
begin
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
                IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL (:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
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
                    GridCuentas.Cells[1,i] := FormatCurr('$ #,#0.00',IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency);
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


procedure TfrmOperacionesCaja.EdAbonoCapitalCasExit(Sender: TObject);
begin
          if EdAbonoCapitalCas.Text = '' then EdAbonoCapitalCas.Text := '0';
          vAbonoCapitalCas := StrToCurr(EdAbonoCapitalCas.Text);
          if vAbonoCapitalCas = 0 then
          begin
            MessageDlg('El Valor del Abono no puede ser $0',mtError,[mbOK],0);
            EdAbonoCapitalCas.SetFocus;
          end;
          EdAbonoCapitalCas.Text := FormatCurr('#,##0',vAbonoCapitalCas);
          TGeneralCas := vAbonoCapitalCas + vAbonoInteresCas + vAbonoCostasCas + vAbonoHonorariosCas + vPapeleria + vAbonoAprov;
          EdTotalCas.Caption := FormatCurr('#,##0',TGeneralCas);
end;

procedure TfrmOperacionesCaja.EdAbonoInteresCasExit(Sender: TObject);
begin
          if EdAbonoInteresCas.Text = '' then EdAbonoInteresCas.Text := '0';
          vAbonoInteresCas := StrToCurr(EdAbonoInteresCas.Text);
          EdAbonoInteresCas.Text := FormatCurr('#,##0',vAbonoInteresCas);
          TGeneralCas := vAbonoCapitalCas + vAbonoInteresCas + vAbonoCostasCas + vAbonoHonorariosCas + vPapeleria + vAbonoAprov;
          EdTotalCas.Caption := FormatCurr('#,##0',TGeneralCas);
          if vAbonoInteresCas > 0 then
           begin
             EdFechaInicialCas.Visible := True;
             EdFechaFinalCas.Visible := True;
             EdDiasAplicadosCas.Visible := True;
             EdTasaAplicadaCas.Visible := True;
             Label163.Visible := True;
             Label164.Visible := True;
             Label165.Visible := True;
             Label166.Visible := True;
             EdDiasAplicadosCas.SetFocus;
           end;
end;

procedure TfrmOperacionesCaja.EdAbonoCostasCasExit(Sender: TObject);
begin
          if EdAbonoCostasCas.Text = '' then EdAbonoCostasCas.Value := 0;
          vAbonoCostasCas := StrToCurr(EdAbonoCostasCas.Text);
          EdAbonoCostasCas.Text := FormatCurr('#,##0',vAbonoCostasCas);
          TGeneralCas := vAbonoCapitalCas + vAbonoInteresCas + vAbonoCostasCas + vAbonoHonorariosCas + vPapeleria + vAbonoAprov;
          EdTotalCas.Caption := FormatCurr('#,##0',TGeneralCas);
end;

procedure TfrmOperacionesCaja.DiasInteres;
begin
        if EdDiasAplicadosCas.Text = '' then EdDiasAplicadosCas.Text := '0';
        vDiasAplicadosCas := StrToInt(EdDiasAplicadosCas.Text);
        EdDiasAplicadosCas.Text := FormatCurr('#0',vDiasAplicadosCas);
        if (vAbonoInteresCas <> 0) then
        begin
           vFechaInicialInteresCas := CalculoFecha(vFechaInteresCas,1);
           vFechaFinalInteresCas := CalculoFechaManual(vFechaInicialInteresCas,vDiasAplicadosCas);
           EdFechaInicialCas.Date := vFechaInicialInteresCas;
           EdFechaFinalCas.Date := vFechaFinalInteresCas;
        end;
end;

procedure TfrmOperacionesCaja.EdDiasAplicadosCasExit(Sender: TObject);
begin
        DiasInteres;
        vTasaAplicadaCas := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora;
        EdTasaAplicadaCas.Text := FormatCurr('#0.00%',vTasaAplicadaCas);
end;

procedure TfrmOperacionesCaja.EdAbonoCostasCasEnter(Sender: TObject);
begin
        EdAbonoCostasCas.SelectAll;
end;

procedure TfrmOperacionesCaja.EdAbonoInteresCasEnter(Sender: TObject);
begin
        EdAbonoInteresCas.SelectAll;
end;

procedure TfrmOperacionesCaja.EdAbonoCapitalCasEnter(Sender: TObject);
begin
        EdAbonoCapitalCas.SelectAll;
end;

procedure TfrmOperacionesCaja.EdAbonoHonorariosCasEnter(Sender: TObject);
begin
        EdAbonoHonorariosCas.SelectAll;
end;

procedure TfrmOperacionesCaja.EdTasaAplicadaCasEnter(Sender: TObject);
begin
        EdTasaAplicadaCas.SelectAll;
end;

procedure TfrmOperacionesCaja.EdDiasAplicadosCasEnter(Sender: TObject);
begin
        EdDiasAplicadosCas.SelectAll;
end;

procedure TfrmOperacionesCaja.CmdAceptarCasClick(Sender: TObject);
var
I,J:Integer;
AR:PCuotasLiq;
codigoAhorros:string;
CodigoIvaGenerado : string;
CodigoPapeleria : string;
CodigoK:string;
CodigoKDeudoras:string;
CodigoInt:string;
CodigoIntDeudoras:string;
CodigoCostas:string;
CodigoCostasDeudoras:string;
CodigoAprovechamientos:string;
CodigoDeudorasContra:string;
begin
    try
        TotalDebitosCas := 0;
        TotalCreditosCas := 0;
        Empleado;
        GroupBox11.Enabled := False;
        ChkPapeleriaCas.Enabled := False;

        with dmColocacion.IBSQL do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
           ExecQuery;
           CodigoCaja := FieldByName('CODIGO').AsString;
           Close;

           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 8');
           ExecQuery;
           CodigoAhorros := FieldByName('CODIGO').AsString;
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
        end;

        MyCuotasLiq.Lista := TList.Create;
        if vAbonoCapitalCas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoK;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           vFechaFInt := vFechaInteres;
           FechaCapAnt := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoCapitalCas;
           AR^.EsCapital := True;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;

           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoKDeudoras;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoCapitalCas;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;
         end;

        if vAbonoInteresCas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoInt;
           AR^.FechaInicial := vFechaInicialInteresCas;
           AR^.FechaFinal   := vFechaFinalInteresCas;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
           AR^.Dias := vDiasAplicadosCas;
           AR^.Tasa := vTasaAplicadaCas;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresCas;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;

           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoIntDeudoras;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresCas;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;
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
           AR^.Tasa := vTasaAplicadaCasA;
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
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;
         end;

        if vAbonoCostasCas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoCostas;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoCostasCas;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;

           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoCostasDeudoras;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoCostasCas;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;
         end;

        if vAbonoHonorariosCas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := codigoAhorros;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoHonorariosCas;
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
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;
         end;

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
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;

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
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;
        end;


          // Coloco Deudoras de Control
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoDeudorasContra;
          AR^.FechaInicial := ffechaactual;
          AR^.FechaFinal   := ffechaactual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := vAbonoCapitalCas + vAbonoInteresCas + vAbonoCostasCas;
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
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;


          // coloco caja
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoCaja;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCreditosCas - TotalDebitosCas;
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
           TotalDebitosCas := TotalDebitosCas + AR^.Debito;
           TotalCreditosCas := TotalCreditosCas + AR^.Credito;

        TotalDebitosCas := 0;
        TotalCreditosCas := 0;

        CmdInformeCas.Enabled := True;

        CmdReversarCas.Visible := True;
        CmdReversarCas.Enabled := True;
        CmdRecaudarCas.Visible := True;
        CmdRecaudarCas.Enabled := True;
        CmdRecaudarCas.SetFocus;
        CmdAceptarCas.Visible := False;
        CmdAceptarCas.Enabled := False;

    except
     dmColocacion.IBSQLcodigos.Transaction.RollbackRetaining;
     Exit;
    end;
end;

procedure TfrmOperacionesCaja.EdAbonoHonorariosCasExit(Sender: TObject);
begin
          if EdAbonoHonorariosCas.Text = '' then EdAbonoHonorariosCas.Text := '0';
          vAbonoHonorariosCas := StrToCurr(EdAbonoHonorariosCas.Text);
          EdAbonoHonorariosCas.Text := FormatCurr('#,##0',vAbonoHonorariosCas);
          TGeneralCas := vAbonoCapitalCas + vAbonoInteresCas + vAbonoCostasCas + vAbonoHonorariosCas +vPapeleria + vAbonoAprov;
          EdTotalCas.Caption := FormatCurr('#,##0',TGeneralCas);
          CmdAceptarCas.Visible := True;
          CmdAceptarCas.Enabled := True;
          CmdAceptarCas.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdReversarCasClick(Sender: TObject);
begin
          CmdReversarCas.Enabled := False;
          Application.ProcessMessages;
          DmGeneral.IBTransaction1.Rollback;
          CmdRetornar.Click;
end;

procedure TfrmOperacionesCaja.CmdRecaudarCasClick(Sender: TObject);
var frmValidarColocacion :TfrmValidarColocacion;
    I :Integer;
    AR:PCuotasLiq;
begin
    if MessageDlg('Seguro de Realizar el Abono?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
              CmdRecaudarCas.Enabled := False;
              CmdReversarCas.Enabled := False;
              CmdRecaudarCas.Visible := False;
              CmdReversarCas.Visible := False;
              CmdInformeCas.Enabled := False;
              Application.ProcessMessages;

              vComprobante := Format('%.7d',[ObtenerConsecutivoCajaCartera]);
              EdCasNoComprobante.Caption := vComprobante;

              with IBQuery do begin
                GrabarExtractoColCastigada;
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
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(vComprobante);
                  ParamByName('ID_COLOCACION').AsString := vColocacion;
                  ParamByName('FECHA_EXTRACTO').AsDate := StrToDate(EdFecha.Caption);
                  ParamByName('HORA_EXTRACTO').AsDateTime := Time;
                  ParamByName('CODIGO_PUC').AsString := AR^.CodigoPuc;
                  ParamByName('FECHA_INICIAL').AsDate := AR^.FechaInicial;
                  ParamByName('FECHA_FINAL').AsDate := AR^.FechaFinal;
                  ParamByName('DIAS_APLICADOS').AsInteger := AR^.Dias;
                  ParamByName('TASA_LIQUIDACION').AsFloat := AR^.Tasa;
                  ParamByName('VALOR_DEBITO').AsCurrency := AR^.Debito;
                  ParamByName('VALOR_CREDITO').AsCurrency := AR^.Credito;
                  try
                    ExecSql;
                    Close;
                  except
                    Transaction.Rollback;
                    MessageDlg('Error al Grabar el Detallado',mtError,[mbcancel],0);
                    Exit;
                  end;
                end;

                // LLevo al extracto de Ahorros
                if vAbonoHonorariosCas > 0 then begin
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
                   ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdCasNoComprobante.Caption;
                   ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'PAGO DE HONORARIOS COL. No.' + vColocacion;
                   ParamByName('VALOR_DEBITO').AsCurrency := vAbonoHonorariosCas;
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
              end;

              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientocol" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_COLOCACION,');
              IBOtros.SQL.Add(':DOCUMENTO,:CAPITAL,:INTERESES,:DEVOLUCION,:OTROS,:BILLETES,:MONEDAS,:ID_PERSONA)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_COLOCACION').AsString := EdCasNumeroColocacion.Text;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdCasNoComprobante.Caption;
              IBOtros.ParamByName('CAPITAL').AsCurrency := vAbonoCapitalCas;
              IBOtros.ParamByName('INTERESES').AsCurrency := vAbonoInteresCas;
              IBOtros.ParamByName('DEVOLUCION').AsCurrency := 0;
              IBOtros.ParamByName('OTROS').AsCurrency := vAbonoCostasCas + vAbonoHonorariosCas + vPapeleria + vAbonoAprov;
              IBOtros.ParamByName('BILLETES').AsCurrency := TGeneralCas;
              IBOtros.ParamByName('MONEDAS').AsCurrency := 0;
              IBOtros.ParamByName('ID_PERSONA').AsString := '';
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.Rollback;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Exit;
                 end;
              except
                  IBOtros.Transaction.Rollback;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Exit;
              end;


        IBQuery.Transaction.Commit;
        IBQuery.Transaction.StartTransaction;
        VerificarCancelacionCredito(Agencia,vColocacion);
        Timer.Enabled := False;
           frmValidarColocacion := TfrmValidarColocacion.Create(Self);
           with frmValidarColocacion do
           begin
               CValidar.Fecha := StrToDate(EdFecha.Caption);
               CValidar.Caja := StrToInt(EdCaja.Caption);
               CValidar.Cuenta := Cuenta;
               CValidar.Documento := StrToInt(EdCasNoComprobante.Caption);
               CValidar.Colocacion := EdCasNumeroColocacion.Text;
               CValidar.Nombre := EdCasNombre.Caption;
               CValidar.Clasificacion := Clasificacion;
               CValidar.Garantia := Garantia;
               CValidar.Estado := Estado;
               CValidar.FechaInt := vFechaFInt;
               CValidar.Capital := vAbonoCapitalCas;
               CValidar.Interes := vAbonoInteresCas;
               CValidar.Devuelto := 0;
               CValidar.Otras := vAbonoCostasCas + vAbonoHonorariosCas + vPapeleria + vAbonoAprov;
               CValidar.NuevoSaldo := vSaldoActual - vAbonoCapitalCas;
               CValidar.Efectivo := TGeneralCas;
               Validar := CValidar;
               ShowModal;
               Free;
           end;

           MessageDlg('Abono Realizado con Exito!',mtInformation,[mbok],0);
     end
    else
     begin
       dmGeneral.IBTransaction1.Rollback;
       MessageDlg('Abono NO Realizado',mtInformation,[mbOK],0);
       Inicializarcastigada;
     end;
        Timer.Enabled := True;

        CmdRetornar.Click;
end;

procedure TfrmOperacionesCaja.EdCasNumeroColocacionEnter(Sender: TObject);
begin
        EdCasNumeroColocacion.SelectAll;
end;

procedure TfrmOperacionesCaja.CmdInformeCasClick(Sender: TObject);
var Tabla:string;
    I:Integer;
    AF:PCuotasLiq;
    frmVistaPreliminar:TfrmVistaPreliminar;
    Asociado : string;
    FechaProx : string;
begin
        Empleado;
        Asociado := EdCasNombre.Caption;

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
          ParamByName('ID_AGENCIA').AsInteger := DBLCBCasAgencia.KeyValue;
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
           ReporteCas.Variables.ByName['Cuenta'].AsString := IntToStr(Cuenta) + '-' + DigitoControl(2,FormatCurr('0000000',Cuenta));
           ReporteCas.Variables.ByName['NuevoSaldo'].AsDouble := vSaldoActual - vAbonoCapitalCas;
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

procedure TfrmOperacionesCaja.GrabarExtractoColCastigada;
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
          ParamByName('ABONO_CAPITAL').AsCurrency := vAbonoCapitalCas;
          ParamByName('ABONO_CXC').AsCurrency := 0;
          ParamByName('ABONO_SERVICIOS').AsCurrency := vAbonoInteresCas;
          ParamByName('ABONO_ANTICIPADO').AsCurrency := 0;
          ParamByName('ABONO_MORA').AsCurrency := 0;
          ParamByName('ABONO_SEGURO').AsCurrency := 0;
          ParamByName('ABONO_PAGXCLI').AsCurrency := vAbonoCostasCas;
          ParamByName('ABONO_HONORARIOS').AsCurrency := vAbonoHonorariosCas;
          ParamByName('ABONO_OTROS').AsCurrency := 0;
          ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasaAplicadaCas;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          if vAbonoInteresCas > 0 then
             ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalInteresCas;
          if vAbonoAprov > 0 then
             ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalInteresA;
          if (vAbonoInteresCas = 0) and (vAbonoAprov = 0) then
             ParamByName('INTERES_PAGO_HASTA').AsDate := FechaIntAnt;

          ParamByName('CAPITAL_PAGO_HASTA').AsDate := FechaCapAnt;
          ParamByName('TIPO_ABONO').AsInteger := 0;
          ExecSQL;
          Close;

          if vAbonoCapitalCas > 0  then
          begin
            sql.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
            sql.Add('"col$colocacion"."FECHA_CAPITAL" = :"FECHA_CAPITAL"');
            sql.Add(' where ');
            sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('ABONOS_CAPITAL').AsCurrency := vAbonoCapitalCas;
            ParamByName('FECHA_CAPITAL').AsDate := fFechaActual;
            ExecSql;
            Close;
           end;

          if (vAbonoInteresCas > 0) and (vAbonoAprov = 0) then
          begin
            sql.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
            sql.Add(' where ');
            sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('FECHA_INTERES').AsDate := vFechaFinalInteresCas;
            ExecSql;
            Close;
           end
          else if (vAbonoInteresCas > 0) and (vAbonoAprov > 0) then
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

          if (vAbonoCostasCas <> 0) or (vAbonoHonorariosCas <> 0) then begin
            SQL.Clear;
            SQL.Add('insert into "col$costas" values (:ID_AGENCIA,:ID_COLOCACION,');
            SQL.Add(':FECHA,:ID_CBTE_COLOCACION,:VALOR_COSTAS,:VALOR_HONORARIOS,:VALOR_OTROS,:DESCRIPCION)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vComprobante);
            ParamByName('VALOR_COSTAS').AsCurrency := -vAbonoCostasCas;
            ParamByName('VALOR_HONORARIOS').AsCurrency := -vAbonoHonorariosCas;
            ParamByName('VALOR_OTROS').AsCurrency := 0;
            ParamByName('DESCRIPCION').AsString := 'VALOR COSTAS Y HONORARIOS RECIBIDOS EN LA FECHA';
            ExecSQL;
            Close;
          end;
         end;
end;


procedure TfrmOperacionesCaja.CmdAgenciasClick(Sender: TObject);
begin
       if ValidaHoraCaja.Estado then
       begin
         OrigenM := 10;
         TipoCaptacion := 0;
         Opcion := 7;
         GBGenerales.Caption := 'Agencias';
         Caption := 'Operaciones de Caja - AGENCIAS';
         PageControl1.ActivePage := TabOpAgencias;
         EdOpcion.Text := '0';
         EdOpcion.SetFocus;
       end
       else
       begin
         if ValidaHoraCaja.Hora <> 0 then
            MessageDlg('las Operaciones entre Sucursales los dias ' + FormatDateTime('dddd',fFechaActual) + #13 + '   Solo se Permiten Antes de las : ' + FormatDateTime('hh:mm:ss AM/PM',validahoracaja.Hora),mtInformation,[mbok],0)
         else
            MessageDlg('El Dia ' + FormatDateTime('dddd',fFechaActual) + ' No Hay Servicio Entre Sucursales',mtInformation,[mbok],0)
       end;
end;

procedure TfrmOperacionesCaja.CmdApotesAgClick(Sender: TObject);
begin
        OrigenM := 1;
        TipoCaptacion := 1;
        Opcion := 8;
        GBOperacionesConAg.Caption := 'Aportes A.';
        Caption := 'Operaciones de Caja - APORTES';
        PageControl1.ActivePage := TabAgencias;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;
end;

procedure TfrmOperacionesCaja.CmdOrdinarioAgClick(Sender: TObject);
begin
        OrigenM := 2;
        TipoCaptacion := 2;
        Opcion := 8;
        GBOperacionesConAg.Caption := 'Ordinario A.';
        Caption := 'Operaciones de Caja - AHORROS';
        PageControl1.ActivePage := TabAgencias;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;

end;

procedure TfrmOperacionesCaja.CmdRindediarioAgClick(Sender: TObject);
begin
        OrigenM := 3;
        TipoCaptacion := 3;
        Opcion := 8;
        GBOperacionesConAg.Caption := 'Diario A.';
        Caption := 'Operaciones de Caja - AHORRO RINDEDIARIO';
        PageControl1.ActivePage := TabAgencias;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;

end;

procedure TfrmOperacionesCaja.CmdJuvenilAgClick(Sender: TObject);
begin
        OrigenM := 4;
        TipoCaptacion := 4;
        Opcion := 8;
        GBOperacionesConAg.Caption := 'Juvenil A.';
        Caption := 'Operaciones de Caja - AHORRO JUVENIL';
        PageControl1.ActivePage := TabAgencias;
        EdOpcion.Text := '0';
        EdOpcion.SetFocus;

end;

procedure TfrmOperacionesCaja.CmdRetornarAgClick(Sender: TObject);
begin
        Opcion := 1;
        PageControl1.ActivePage := TabProductos;
end;

procedure TfrmOperacionesCaja.CmdAgenciaConClick(Sender: TObject);
begin
        CapOperacion := 'C';
        if (TipoCaptacion = 2) then
           ChkCreditos.Enabled := True;
//        ChkAutorizadoag.Enabled := False;
        ChkAutorizadoag.Checked := False;
        LAutorizadoag.Enabled := False;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBOperacionesConAg.Enabled := False;
        CmdOKCaptacionag.Caption := '&Consignar';
        CmdOKCaptacionag.Enabled := True;
        EdEstadoActualCapag.Caption := 'En Consignación';
        case OrigenM of
         2: EdEstadoActualCap.Color := clBlue;
         1: EdEstadoActualCap.Color := clPurple;
         4: EdEstadoActualCap.Color := clFuchsia;
         else
            EdEstadoActualCap.Color := clInactiveCaption;
        end;
        //CmdVerChequesag.Enabled := True;
        EdDevolucionCapag.Enabled := True;
        CmdVerDevolucionag.Enabled := True;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionCapAgencias;
        PageControl.Visible := True;
//        dmColocacion.IBDSagencias.Open;
//        dmColocacion.IBDSagencias.Last;
//      dmColocacion.IBDSagencias.First;
        IBagencias.Close;
        {if IBagencias.Transaction.InTransaction then
           IBagencias.Transaction.Rollback;
        IBagencias.Transaction.StartTransaction;}
        IBagencias.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBagencias.Open;
        IBagencias.Last;
        EdCapAgencia.KeyValue := IBagencias.FieldByName('ID_AGENCIA').AsInteger;
        EdCapAgencia.SetFocus;

end;

procedure TfrmOperacionesCaja.CmdAgenciaRetClick(Sender: TObject);
begin
        CapOperacion := 'R';
        ChkAutorizadoag.Enabled := True;
        ChkAutorizadoag.Checked := False;
        LAutorizadoag.Enabled := True;
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBOperacionesConAg.Enabled := False;
        CmdOKCaptacionag.Caption := '&Retirar';
        CmdOKCaptacionag.Enabled := True;
        EdEstadoActualCapag.Caption := 'En Retiro';
        case OrigenM of
         2: EdEstadoActualCapag.Color := clRed;
         1: EdEstadoActualCapag.Color := clGreen;
         4: EdEstadoActualCapag.Color := clTeal;
         else
            EdEstadoActualCapag.Color := clBlack;
        end;
        CmdVerChequesag.Enabled := False;
        EdDevolucionCapag.Enabled := False;
        CmdVerDevolucionag.Enabled := False;
        TabsNoVisibles;
        PageControl.ActivePage := TabOperacionCapAgencias;
        PageControl.Visible := True;
        IBagencias.ParamByName('ID_AGENCIA').AsInteger := Agencia;// OJO CAMBIAR AL VALOR REAL DE LA AGENCAI
        IBagencias.Open;
        IBagencias.Last;
        EdCapAgencia.KeyValue := IBagencias.FieldByName('ID_AGENCIA').AsInteger;
        EdCapAgencia.SetFocus;

end;

procedure TfrmOperacionesCaja.CmdAgenciaSalirClick(Sender: TObject);
begin
        Opcion := 7;
        PageControl1.ActivePage := TabOpAgencias;

end;

procedure TfrmOperacionesCaja.EdCapAgenciaExit(Sender: TObject);
begin
        Sucursal := EdCapAgencia.KeyValue;
        {if Sucursal = Agencia then begin
          MessageDlg('La Agencia Digitada corresponde a la misma Oficina',mtError,[mbok],0);
          EdCapAgencia.SetFocus;
        e1nd;}
          HostServidor := BuscaServicio(EdCapAgencia.KeyValue,3).vHost;
          PuertoServidor := BuscaServicio(EdCapAgencia.KeyValue,3).vPuerto;

        {if Sucursal = 1 then
        begin
          HostServidor := host_ocana;
          PuertoServidor := puerto_ocana;
        end;
        if Sucursal = 2 then
        begin
          HostServidor := host_abrego;
          PuertoServidor := puerto_abrego;
        end;
        if Sucursal = 3 then
        begin
          HostServidor := host_convencion;
          PuertoServidor := puerto_convencion;
        end;
        if Sucursal = 4 then
        begin
          HostServidor := host_aguachica;
          PuertoServidor := puerto_aguachica;
        end;}
end;

procedure TfrmOperacionesCaja.ChkAutorizadoAgEnter(Sender: TObject);
begin
        LAutorizadoag.Color := clSilver;
end;

procedure TfrmOperacionesCaja.ChkAutorizadoAgExit(Sender: TObject);
begin
        LAutorizadoag.Color := clBtnFace;
end;

procedure TfrmOperacionesCaja.EdNumeroCapAgEnter(Sender: TObject);
begin
        EdNumeroCapAg.SelectAll;
end;

procedure TfrmOperacionesCaja.EdNumeroCapAgExit(Sender: TObject);
var NumeroS:string;
    Numero:Integer;
    Digito:Integer;
    EsDeMovimiento:Boolean;
    i :Integer;
    Astream, Astream1 :TMemoryStream;
begin
        cbtitularesag.Clear;
        Verifica_Huella := True;
        CmdImagenesCapAg.Enabled := True;
        cmdConfrontarHuellaag.Enabled := True;
        if EdNumeroCapAg.Text  <> '' then
        begin
         EdNumeroCapAg.Text := Format('%.7d',[StrToInt(EdNumeroCapAg.Text)]);
         NumeroS := Format('%.7d',[StrToInt(EdNumeroCapAg.Text)]);
         Numero := StrToInt(EdNumeroCapAg.Text);
         Digito := StrToInt(DigitoControl(TipoCaptacion,NumeroS));
         EdDigitoCapAg.Caption := IntToStr(Digito);
         NumeroPeticion := IntToStr(EdCapAgencia.KeyValue) + IntToStr(TipoCaptacion) + NumeroS + IntToStr(Digito);
         XmlPetC := TsdXmlDocument.CreateName('datos');
         XmlPetC.EncodingString := 'ISO8859-1';
         XmlPetC.XmlFormat := xfReadable;
         XmlresC := TsdXmlDocument.Create;
         XmlresC.EncodingString := 'ISO8859-1';
         XmlresC.XmlFormat := xfReadable;
         XmlPetC.Root.WriteString('tipoconsulta','S');
         XmlPetC.Root.WriteString('tipooperacion',CapOperacion);
         XmlPetC.Root.WriteString('numerocuenta',Numeropeticion);
         XmlPetC.Root.WriteString('dbalias',UpperCase(DBAlias));
         if ChkAutorizadoAg.Checked then
         begin
            XmlPetC.Root.WriteBool('firma',True);
            CmdConfrontarHuellaAg.Enabled := False;
            cmdimagenescapag.Enabled := True;
         end
         else
         begin
            XmlPetC.Root.WriteBool('firma',False);
            CmdImagenesCapAg.Enabled := False;
            cmdconfrontarhuellaag.Enabled := True;
         end;
         if CapOperacion = 'C' then
         begin
            CmdImagenesCapAg.Enabled := False;
            cmdConfrontarHuellaag.Enabled := False;
         end;
         //XmlPetC.SaveToFile('c:\consulta_Cta.xml');
         AstreamC := TStringStream.Create('');
         XmlPetC.SaveToStream(AstreamC);
         frmProgreso := TfrmProgreso.Create(self);
         frmProgreso.Titulo := 'Recibiendo Información de ' + EdCapAgencia.Text;
         frmProgreso.Min := 0;
         frmProgreso.InfoLabel := 'Espere un Momento por Favor';
         frmProgreso.Position := 2; // carga de referencia
         frmProgreso.Ejecutar;
         with IdTCPClient1 do
         begin
           Port := PuertoServidor;
           Host := HostServidor;
           try
             Application.ProcessMessages;
             Connect;
           except
           on e: Exception do
           begin
              Application.ProcessMessages;
              MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
              EdNumeroCapAg.SetFocus;
              frmProgreso.Cerrar;
              Exit;
           end;
           end;
           if Connected then
           begin
             Valida_Tcp := False;
             WriteInteger(AstreamC.Size);
             OpenWriteBuffer;
             WriteStream(AstreamC);
             CloseWriteBuffer;
             Valida_Tcp := True;
             FreeAndNil(AstreamC);
             tamanoC := ReadInteger;
             Application.ProcessMessages;
             Astream := TMemoryStream.Create;
             ReadStream(Astream,tamanoC,False);
             if ChkAutorizadoAg.Checked then
             begin
               Astream1 := TMemoryStream.Create;
               Astream.Position := 0;
               Astream.Seek(0,0);
               ZDeCompressStream(Astream,Astream1);
               astream1.Position := 0;
               Astream1.Seek(0,0);
             end
             else
               Astream1 := Astream;
             XmlResC.LoadFromStream(Astream1);
             frmProgreso.Cerrar;
             //XmlResC.SaveToFile('c:\cajas.xml');
             Disconnect;
             if XmlResC.Root.ReadBool('ejecutado') = False then
             begin
                MessageDlg('No se Encontraron Datos Para Esa Cuenta con Mensaje: ' + XmlResC.Root.Readstring('mensaje'),mtInformation,[mbok],0);
                Disconnect;
                ednumerocapag.SetFocus;
                Exit;
             end;
             vIdestadoAg := XmlResC.Root.ReadInteger('id_estado');
             EstadoAct := vIdestadoAg;
             EdEstadoCapAg.Caption := XmlResC.Root.ReadString('descripcion_estado');
             EdFirmasAg.Caption := XmlResC.Root.ReadString('firmas');
             EdprotectografosAg.Caption := XmlResC.Root.ReadString('protectografos');
             EdsellosAg.Caption := XmlResC.Root.ReadString('sellos');
             VparaSaldarAg := IntToBool(XmlResC.Root.ReadInteger('parasaldar'));
             EdRangoIniAg.Caption := XmlResC.Root.ReadString('numero_inicial');
             EdRangoFinAg.Caption := XmlResC.Root.ReadString('numero_final');
             Asociado_Titular := XmlResC.Root.ReadString('asociado_titular');
             id_persona_titular := XmlResC.Root.ReadString('id_persona_titular');
             id_identificacion_titular := XmlResC.Root.ReadInteger('id_identificacion_titular');
             nodo := XmlResC.Root.NodeByName('titulares');// nodo carga titulares
             for i := 0 to nodo.NodeCount -1 do
             begin
               CBTitularesAg.Items.Add(trim(nodo.Nodes[i].ReadString('nombre')));
               if CapOperacion = 'R' then
               begin
                 if chkautorizadoag.Checked = False then
                 begin
                   nodo1 := nodo.Nodes[i].NodeByName('datos_huella');
                   CDhuella.Append;
                   CDhuella.FieldValues['datos_huella'] := nodo1.BinaryString;
                   CDhuella.FieldValues['titular'] := Trim(nodo.Nodes[i].ReadString('nombre'));
                   CDhuella.Post;
                 end
                 else
                 begin
                   nodo1 := nodo.Nodes[i].NodeByName('datos_firma');
                   CDfirma.Append;
                   CDfirma.FieldValues['firma'] := nodo1.BinaryString;
                   CDfirma.FieldValues['titular'] := Trim(nodo.Nodes[i].ReadString('nombre'));
                   CDfirma.Post;
                 end;
               end;
             end;
             CBTitularesAg.ItemIndex := 0;
             edSaldoCapAg.Caption := FormatCurr('$#,0.00',XmlResC.Root.ReadFloat('saldoactual'));
             Saldo := XmlResC.Root.ReadFloat('saldoactual');
             EdCanjeCapAg.Caption := FormatCurr('$#,0.00',XmlResC.Root.ReadFloat('canje'));
             EdDisponibleCapAg.Caption := FormatCurr('$#,0.00',XmlResC.Root.ReadFloat('saldodisponible'));
             Disponible := XmlResC.Root.ReadFloat('saldodisponible');
             if XmlResC.Root.Readinteger('permite_movimiento') = 0 then
             begin
                MessageDlg('Con esta Captación no se puede Trabajar',mtInformation,[mbok],0);
                EdCapAgencia.SetFocus;
                Exit;
             end;
{             if CapOperacion = 'R' then
             begin
               if chkautorizadoag.Checked = False then
               begin
                 nodo := XmlResC.Root.NodeByName('datos_huella');
                 CDhuella.Append;
                 CDhuella.FieldValues['datos_huella'] := nodo.BinaryString;
                 CDhuella.Post;
               end
               else
               begin
                 nodo := XmlResC.Root.NodeByName('datos_firma');
                 CDfirma.Append;
                 CDfirma.FieldValues['firma'] := nodo.BinaryString;
                 CDfirma.Post;
               end;
             end;}
             if CapOperacion = 'C' then
                EsDeMovimiento := XmlResC.Root.ReadBool('permite_movimiento')
             else
                EsDeMovimiento := XmlResC.Root.ReadBool('permite_movimiento_entrada');
           end;
{           if CapOperacion = 'R' then
           begin
             if chkautorizadoag.Checked then
             begin
                MessageDlg('Favor Verifique la Firma',mtInformation,[mbok],0);
                CmdImagenesCapAg.Click;
             end
             else
             begin
               MessageDlg('Favor Verificar la Huella',mtInformation,[mbok],0);
               cmdconfrontarhuellaag.Click;
             end;
           end;}
         end;
        end;



end;

procedure TfrmOperacionesCaja.CmdConfrontarHuellaAgClick(Sender: TObject);
var
    BlobStream:TMemoryStream;
    BlobField:TBlobField;
    i:Integer;
begin
        with CDhuella do
        begin
           Filtered := False;
           Filter := 'titular = ' + '''' + CBTitularesAg.Text + '''';
           Filtered := True;
           if RecordCount > 0 then
           begin
            try
                BlobStream := TMemoryStream.Create;
                (FieldByName('datos_huella') as TBlobField).SaveToStream(BlobStream);
                if BlobStream.Size = 0 then begin
                   MessageDlg('No Tiene Huella Registrada',mtError,[mbcancel],0);
                   EdDocumentoCapAg.SetFocus;
                   //CmdRetornar.Click;
                   Exit;
                end;
                BlobStream.Position := 0;
                BlobStream.read(pvData,vTamano);
            finally
                BlobStream.Free;
            end;
            ValidarHuella;
           end
           else
           begin
             MessageDlg('No Tiene Huella Registrada!',mtInformation,[mbOk],0);
             Exit;
           end;
        end;
end;

procedure TfrmOperacionesCaja.CmdImagenesCapAgClick(Sender: TObject);
var
    BlobStream:TMemoryStream;
    BlobField:TBlobField;
    i:Integer;
begin
        with CDfirma do
        begin
           Filtered := False;
           Filter := 'titular = ' + '''' + CBTitularesAg.Text + '''';
           Filtered := True;
           //ShowMessage(CDfirma.FieldByName('titular').AsString);
           if RecordCount > 0 then
           begin
            try
                BlobStream := TMemoryStream.Create;
                (FieldByName('firma') as TBlobField).SaveToStream(BlobStream);
                if BlobStream.Size = 0 then begin
                   MessageDlg('No tiene Firma Registrada',mtError,[mbcancel],0);
                   //CmdRetornar.Click;
                   EdDocumentoCapAg.SetFocus;
                   Exit;
                end;
                BlobStream.Position := 0;
                BlobStream.read(pvData,vTamano);
            finally
                BlobStream.Free;
            end;
           end
           else
           begin
             MessageDlg('No Tiene Firma Registrada!',mtInformation,[mbOk],0);
             Exit;
           end;
        end;
        FrmFirmas := TFrmFirmas.Create(self);
        FrmFirmas.Show;
        Application.ProcessMessages;
//        FrmFirmas.Free;
        //EdDocumentoCapAg.SetFocus;


end;

procedure TfrmOperacionesCaja.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          if AWorkMode = wmRead then
            frmProgreso.InfoLabel := 'Kbs Recibidos : ' + CurrToStr(AWorkCount/1000)
          else
            frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;

          Application.ProcessMessages;

end;

procedure TfrmOperacionesCaja.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          if Valida_Tcp then
             AWorkMode := wmRead
          else
             AWorkMode := wmWrite;
          if AWorkMode = wmRead then
             frmProgreso.Titulo := 'Recibiendo Información de ' + EdCapAgencia.Text + ' Tamaño: ' + CurrToStr(AWorkCountMax/1000) + ' Kbs'
          else
             frmProgreso.Titulo := 'Recibiendo Información de ' + EdCapAgencia.Text + ' Tamaño: ' + CurrToStr(AWorkCountMax/1000) + ' Kbs';
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;


end;

procedure TfrmOperacionesCaja.EdDocumentoCapAgExit(Sender: TObject);
begin
       if EdDocumentoCapAg.Text <> '' then
       begin
          EdDocumentoCapAg.Text := Format('%.8d',[StrToInt(EdDocumentoCapAg.Text)]);
          Libreta := StrToInt(EdDocumentoCapAg.Text);
       end
       else
       begin
          Mensaje.Caption := 'Debe diligenciar el número de documento';
       end;

end;

procedure TfrmOperacionesCaja.EdTotalBilletesCapAgChange(Sender: TObject);
begin
        TBilletes := EdTotalBilletesCapAg.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdTotalBilletesCapAgEnter(Sender: TObject);
begin
        if TipoCaptacion = 5 then
           EdTotalBilletesCapAg.Value := ValorCuotaCon;

end;

procedure TfrmOperacionesCaja.EdTotalBilletesCapAgExit(Sender: TObject);
begin
        if TipoCaptacion = 5 then
          if EdTotalBilletesCapAg.Value <> ValorCuotaCon then
             EdTotalBilletesCapAg.Value := ValorCuotaCon;
        TBilletes := EdTotalBilletesCapAg.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
        if (TBilletes + TMonedas) >= _vMinimoSARLAFT then
          GrDatosUsuarioAg.Visible := True
        else
          GrDatosUsuarioAg.Visible := False;

end;

procedure TfrmOperacionesCaja.EdTotalMonedasCapAgChange(Sender: TObject);
begin
        TMonedas := EdTotalMonedasCapAg.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdTotalMonedasCapAgExit(Sender: TObject);
begin
        if TipoCaptacion = 5 then EdTotalMonedasCapAg.Value := 0;
        TMonedas := EdTotalMonedasCapAg.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;                                                   

procedure TfrmOperacionesCaja.EdTotalChequesCapAgChange(Sender: TObject);
begin
        TCheques := EdTotalChequesCapAg.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;

procedure TfrmOperacionesCaja.CmdVerChequesAgClick(Sender: TObject);
begin
    frmRelacionCheques:=TfrmRelacionCheques.Create(Self);
    frmRelacionCheques.ListaCheques := ListaCheques;
    if frmRelacionCheques.ShowModal = mrok then
    begin
        ListaCheques := frmRelacionCheques.ListaCheques;
        EdTotalChequesCapAg.Value := frmRelacionCheques.ValorCheques;
    end;

end;

procedure TfrmOperacionesCaja.EdTotalChequesCapAgExit(Sender: TObject);
begin
        if TipoCaptacion = 5 then EdTotalChequesCapAg.Value := 0;
        if (EdTotalChequesCapAg.Value > 0) and
           (CapOperacion = 'C') then
           CmdVerChequesAg.Click;
end;

procedure TfrmOperacionesCaja.EdDevolucionCapAgChange(Sender: TObject);
begin
        TDevolucion := EdDevolucionCapAg.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.CmdokCaptacionAgClick(Sender: TObject);
begin
        if EdDocumentoCapAg.Text = '' then
        begin
           MessageDlg('Debe Diligenciar el Documento',mtInformation,[mbok],0);
           EdDocumentoCapAg.SetFocus;
           Exit;
        end;

        if MessageDlg('Seguro de Realizar la Operación',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

        if ((TBilletes + TMonedas) >= _vMinimoSARLAFT) then
        if (edDocumentoUsuarioAg.Text = '') then
        begin
            MessageDlg('Por favor digite los datos del Usuario',mtInformation,[mbOk],0);
            edDocumentoUsuarioAg.SetFocus;
            exit;
        end
        else
        if not _bDocumentoUsuarioValido then
        begin
            MessageDlg('El Usuario debe quedar bien registrado',mtInformation,[mbOk],0);
            edDocumentoUsuarioAg.SetFocus;
            Exit;
        end;


        CmdOKCaptacionag.Enabled := False;
        if CapOperacion = 'C' then RealizarConsignacionAg
        else RealizarRetiroAg;

end;

function TfrmOperacionesCaja.GrabarConsignacionAg: Boolean;
var     i :Integer;
        ARecord:PLista;
        numero_caja :Integer;
begin
        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 18');
          ExecQuery;
          numero_caja := FieldByName('VALOR_MINIMO').AsInteger;
        end;

        vHora_Sucursal := fHoraActual;
        vFecha_Sucursal := fFechaActual;
        VbilletesComision := 0;
        VmonedasComision := 0;
        VchequesComision := 0;
        Vcomision := 0;
        XmlPetC := TsdXmlDocument.CreateName('datos');
        XmlPetC.EncodingString := 'ISO8859-1';
        XmlPetC.XmlFormat := xfReadable;
        XmlresC := TsdXmlDocument.Create;
        XmlresC.EncodingString := 'ISO8859-1';
        XmlresC.XmlFormat := xfReadable;
        XmlPetC.Root.WriteString('tipoconsulta','S');
        XmlPetC.Root.WriteString('tipooperacion',CapOperacion);
        XmlPetC.Root.WriteString('numerocuenta',Numeropeticion);
        XmlPetC.Root.WriteString('dbalias',UpperCase(DBAlias));
        XmlPetC.Root.WriteString('tipoconsulta','I');
        XmlPetC.Root.WriteString('tipooperacion',CapOperacion);
        XmlPetC.Root.WriteInteger('origenm',OrigenM);
        XmlPetC.Root.WriteInteger('agencia_remota',Agencia);
        XmlPetC.Root.WriteString('numerocuenta',Numeropeticion);
        XmlPetC.Root.WriteString('dbalias',UpperCase(DBAlias));
        XmlPetC.Root.WriteDateTime('fecha_movimiento',vFecha_Sucursal);
        XmlPetC.Root.WriteString('hora_movimiento',FormatDateTime('hh:mm:ss',vHora_Sucursal));
        //ShowMessage(TimeToStr(fHoraActual));
        XmlPetC.Root.WriteInteger('documento_cap',Libreta);
        XmlPetC.Root.WriteString('desc_movimiento','CONSIGNACION EN EFECTIVO');
        XmlPetC.Root.WriteInteger('numero_caja',numero_caja);
        XmlPetC.Root.WriteFloat('billetes',TBilletes);
        XmlPetC.Root.WriteFloat('monedas',TMonedas);
        XmlPetC.Root.WriteFloat('cheques',TCheques);
        XmlPetC.Root.WriteBool('es_credito',ChkCreditos.Checked);
        XmlPetC.Root.WriteInteger('id_identificacion_titular',id_identificacion_titular);
        XmlPetC.Root.WriteString('id_persona_titular',id_persona_titular);
        with IBSQL1 DO
        begin
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          XmlPetC.Root.WriteString('des_agencia',FieldByName('DESCRIPCION_AGENCIA').AsString);
        end;

        if TCheques > 0 then
        begin
          nodo := XmlPetC.Root.NodeNew('rel_cheques');
          for i := 0 to ListaCheques.Count - 1 do
          begin
            nodo1 := nodo.NodeNew('cheque');
            ARecord := ListaCheques.Items[I];
            nodo1.WriteInteger('codigo',ARecord^.Codigo);
            nodo1.WriteInteger('numero_cheque',StrToInt(ARecord^.Numero));
            nodo1.WriteString('plaza',ARecord^.Plaza);
            nodo1.WriteFloat('valor',ARecord^.Valor);
          end;
        end;
        AstreamC := TStringStream.Create('');
        XmlPetC.SaveToStream(AstreamC);
//***
        with IdTCPClient1 do
        begin
          Port := PuertoServidor;
          Host := HostServidor;
          Valida_Tcp := False;
          try
            Application.ProcessMessages;
            Connect;
          except
          on e: Exception do
          begin
             Application.ProcessMessages;
             MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
             EdNumeroCapAg.SetFocus;
             //frmProgreso.Cerrar;
             Exit;
          end;
          end;
          if Connected then
          begin
            frmProgreso := TfrmProgreso.Create(self);
            frmProgreso.Min := 0;
            frmProgreso.InfoLabel := 'Espere un Momento Por Favor...';
            frmProgreso.Titulo := 'Enviando Informacion a ' + EdCapAgencia.Text;
            frmProgreso.Ejecutar;
            Application.ProcessMessages;
            WriteInteger(AstreamC.Size);
            OpenWriteBuffer;
            WriteStream(AstreamC);
            CloseWriteBuffer;
            //Valida_Tcp := False;
            FreeAndNil(AstreamC);
            tamanoC := ReadInteger;
            Application.ProcessMessages;
            AstreamC := TStringStream.Create('');
            ReadStream(AstreamC,tamanoC,False);
            frmProgreso.Cerrar;
            XmlResC.LoadFromStream(AstreamC);
            //XmlResC.SaveToFile('c:\cajas.xml');
            if XmlResC.Root.ReadBool('ejecutado') = False then
            begin
               MessageDlg('No se Encontraron Datos Para Esa Cuenta',mtInformation,[mbok],0);
               Result := False;
               Disconnect;
               Exit;
            end;
            if (XmlResC.Root.ReadBool('ejecutado')) and (XmlResC.Root.ReadBool('v_libreta') = False) then
            begin
               Result := False;
               MessageDlg(XmlResC.Root.ReadString('mensaje'),mtWarning,[mbok],0);
               Disconnect;
               Exit;
            end;
            EdNuevoSaldoCapAg.Caption := FormatCurr('$#,0.00',XmlResC.Root.ReadFloat('saldoactual'));
            VbilletesComision := XmlResC.Root.ReadFloat('billetes');
            VmonedasComision := XmlResC.Root.ReadFloat('monedas');
            VchequesComision := XmlResC.Root.ReadFloat('cheques');
            Vcomision := XmlResC.Root.ReadFloat('comision');
            C_Aportes := XmlResC.Root.ReadInteger('c_aportes');
            D_Aportes := XmlResC.Root.ReadInteger('d_aportes');
            Disconnect;
            Result := True;
          end;
        end;

end;

function TfrmOperacionesCaja.GrabarRetiroAg: Boolean;
var     i :Integer;
        ARecord:PLista;
        Dia:Integer;
        Hora:TTime;
        ServiCaja:Boolean;
        desc_agencia :string;
        numero_caja :Integer;
begin
       vHora_Sucursal := fHoraActual;
       vFecha_Sucursal := fFechaActual;
       Vcomision := 0;
       VbilletesComision := 0;
       VmonedasComision := 0;
       VchequesComision := 0;
       if ChkAutorizadoag.Checked then
       begin
           Dia := DayOfWeek(StrToDate(EdFecha.Caption));
           Hora := StrToTime(EdHora.Caption);
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select * from "caj$horarioservicaja" where DIA = :DIA and');
           IBSQL1.SQL.Add(':HORA BETWEEN HORA_INICIAL and HORA_FINAL');
           IBSQL1.ParamByName('DIA').AsInteger := Dia;
           IBSQL1.ParamByName('HORA').AsTime := Hora;
           IBSQL1.ExecQuery;
           if (Es_ServiCaja) and (IBSQL1.RecordCount > 0) then
                 ServiCaja := True
           else
                 ServiCaja := False;
       end;
        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 18');
        IBSQL1.ExecQuery;
        numero_caja := IBSQL1.FieldByName('VALOR_MINIMO').AsInteger;
        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA = :ID_AGENCIA');
        IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBSQL1.ExecQuery;
        desc_agencia := IBSQL1.FieldByName('DESCRIPCION_AGENCIA').AsString;
        vHora_Sucursal := fHoraActual;
        vFecha_Sucursal := fFechaActual;
        XmlPetC := TsdXmlDocument.CreateName('datos');
        XmlPetC.EncodingString := 'ISO8859-1';
        XmlPetC.XmlFormat := xfReadable;
        XmlresC := TsdXmlDocument.Create;
        XmlresC.EncodingString := 'ISO8859-1';
        XmlresC.XmlFormat := xfReadable;
        {XmlPetC.Root.WriteString('tipoconsulta','S');
        XmlPetC.Root.WriteString('tipooperacion',CapOperacion);
        XmlPetC.Root.WriteString('numerocuenta',Numeropeticion);
        XmlPetC.Root.WriteString('dbalias',UpperCase(DBAlias));}
        AstreamC := TStringStream.Create('');
        XmlPetC.SaveToStream(AstreamC);
        XmlPetC.Root.WriteString('tipoconsulta','I');
        XmlPetC.Root.WriteString('tipooperacion',CapOperacion);
        XmlPetC.Root.WriteInteger('origenm',OrigenM);
        XmlPetC.Root.WriteInteger('agencia_remota',Agencia);
        XmlPetC.Root.WriteString('numerocuenta',Numeropeticion);
        XmlPetC.Root.WriteString('dbalias',UpperCase(DBAlias));
        XmlPetC.Root.WriteDateTime('fecha_movimiento',vFecha_Sucursal);
        XmlPetC.Root.WriteString('hora_movimiento',FormatDateTime('hh:mm:ss',vHora_Sucursal));
        //ShowMessage(TimeToStr(fHoraActual));
        XmlPetC.Root.WriteInteger('documento_cap',Libreta);
        XmlPetC.Root.WriteString('desc_movimiento','RETIRO EN EFECTIVO DESDE ' + desc_agencia);
        XmlPetC.Root.WriteInteger('numero_caja',numero_caja);
        XmlPetC.Root.WriteFloat('billetes',TBilletes);
        XmlPetC.Root.WriteFloat('monedas',TMonedas);
        XmlPetC.Root.WriteFloat('cheques',TCheques);
        XmlPetC.Root.WriteBool('autorizado',ChkAutorizadoAg.Checked);
        XmlPetC.Root.WriteBool('parasaldar',VparaSaldarAg);
        XmlPetC.Root.WriteInteger('id_identificacion_titular',id_identificacion_titular);
        XmlPetC.Root.WriteString('id_persona_titular',id_persona_titular);
        if Agencia = 1 then
        begin
           XmlPetC.Root.WriteBool('servicaja',ServiCaja);
           XmlPetC.Root.WriteBool('es_servicaja',Es_ServiCaja);
        end
        else
        begin
           XmlPetC.Root.WriteBool('es_servicaja',False);
           XmlPetC.Root.WriteBool('servicaja',False);
        end;
        if TCheques > 0 then
        begin
          nodo := XmlPetC.Root.NodeNew('rel_cheques');
          for i := 0 to ListaCheques.Count - 1 do
          begin
            nodo1 := nodo.NodeNew('cheque');
            ARecord := ListaCheques.Items[I];
            nodo1.WriteInteger('codigo',ARecord^.Codigo);
            nodo1.WriteInteger('numero_cheque',StrToInt(ARecord^.Numero));
            nodo1.WriteString('plaza',ARecord^.Plaza);
            nodo1.WriteFloat('valor',ARecord^.Valor);
          end;
        end;
        //XmlPetC.SaveToFile('c:\datos_consignacion.xml');
        XmlPetC.SaveToStream(AstreamC);
//***
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'Espere un Momento Por Favor...';
        frmProgreso.Titulo := 'Enviando Informacion a ' + EdCapAgencia.Text;
        frmProgreso.Ejecutar;
        with IdTCPClient1 do
        begin
          Port := PuertoServidor;
          Host := HostServidor;
          Valida_Tcp := False;
          try
            Application.ProcessMessages;
            Connect;
          except
          on e: Exception do
          begin
             Application.ProcessMessages;
             MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
             EdNumeroCapAg.SetFocus;
             frmProgreso.Cerrar;
             Result := False;
             Exit;
          end;
          end;
          if Connected then
          begin
            WriteInteger(AstreamC.Size);
            OpenWriteBuffer;
            WriteStream(AstreamC);
            CloseWriteBuffer;
            Valida_Tcp := False;
            FreeAndNil(AstreamC);
            tamanoC := ReadInteger;
            Application.ProcessMessages;
            AstreamC := TStringStream.Create('');
            ReadStream(AstreamC,tamanoC,False);
            XmlResC.LoadFromStream(AstreamC);
            //XmlResC.SaveToFile('c:\cajas.xml');
            frmProgreso.Cerrar;
            if XmlResC.Root.ReadBool('ejecutado') = False then
            begin
               MessageDlg('No se Encontraron Datos Para Esa Cuenta',mtInformation,[mbok],0);
               Result := False;
               Disconnect;
               Exit;
            end;
            if (XmlResC.Root.ReadBool('ejecutado')) and (XmlResC.Root.ReadBool('v_libreta') = False) then
            begin
               Result := False;
               MessageDlg(XmlResC.Root.ReadString('mensaje'),mtWarning,[mbok],0);
               Disconnect;
               Exit;
            end;
            EdNuevoSaldoCapAg.Caption := FormatCurr('$#,0.00',XmlResC.Root.ReadFloat('saldoactual'));
            VbilletesComision := XmlResC.Root.ReadFloat('billetes');
            VmonedasComision := XmlResC.Root.ReadFloat('monedas');
            VchequesComision := XmlResC.Root.ReadFloat('cheques');
            Vcomision := XmlResC.Root.ReadFloat('comision');
            C_Aportes := XmlResC.Root.ReadInteger('c_aportes');
            D_Aportes := XmlResC.Root.ReadInteger('d_aportes');
            Disconnect;
            Result := True;
          end;
        end;

end;

procedure TfrmOperacionesCaja.RealizarConsignacionAg;
var     DigitoAportes,vTipo:Integer;
begin
        if EdTotalChequesCapAg.Value <> 0 then
          if ListaCheques.Count = 0 then
          begin
            MessageDlg('Debe diligenciar la relación de cheques',mtError,[mbcancel],0);
            CmdVerCheques.Click;
            Exit;
          end;

        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara la consignación',mtInformation,[mbok],0);
           EdTotalChequesCapAg.SetFocus;
           Exit;
        end;
        Timer.Enabled := False;
        if GrabarConsignacionAg then
        begin
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movremotosalida" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:ID_AGENCIA_REMOTA,:HUELLA,:ASOCIADO,:ES_CREDITO,0,:ID_PERSONA,:ID_IDENTIFICACION,:ID_PERSONA_OP)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(DateToStr(vFecha_Sucursal) + ' ' + TimeToStr(vHora_Sucursal));
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCapag.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCapag.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCapag.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
              IBOtros.ParamByName('BILLETES').AsCurrency := TBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := TMonedas;
              IBOtros.ParamByName('CHEQUES').AsCurrency := TCheques;
              IBOtros.ParamByName('ID_AGENCIA_REMOTA').AsInteger := EdCapAgencia.KeyValue;
              IBOtros.ParamByName('HUELLA').AsBoolean := ctlHuella;
              IBOtros.ParamByName('ASOCIADO').AsString := Asociado_Titular;
              IBOtros.ParamByName('ES_CREDITO').AsInteger := BoolToInt(ChkCreditos.Checked);
              IBOtros.ParamByName('ID_PERSONA').AsString := id_persona_titular;
              IBOtros.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_titular;
              IBOtros.ParamByName('ID_PERSONA_OP').AsString := edDocumentoUsuarioAg.Text;
              try
                IBOtros.ExecQuery;
              except
              on e: Exception do
              begin
                MessageDlg('Error al Registrar en Tabla Movimiento Remoto, Informe a Sistenas' + #13 + e.Message,mtError,[mbok],0);
                Exit;
              end;
              end;
//**** REGISTRO DEL VALOR DE LA COMISION
              vTipo := TipoCaptacion;
              if Vcomision > 0 then
              begin
                if TipoCaptacion = 1 then
                begin
                   DigitoAportes := StrToInt(DigitoControl(2,EdNumeroCapAg.Text));
                   vTipo := 2;
                end
                else
                   DigitoAportes := StrToInt(DigitoControl(TipoCaptacion,EdNumeroCapAg.Text));
                IBOtros.Close;
                IBOtros.SQL.Clear;
                IBOtros.SQL.Add('insert into "caj$movremotosalida" values(');
                IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
                IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
                IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:ID_AGENCIA_REMOTA,:HUELLA,:ASOCIADO,:ES_CREDITO,:COMISION,:ID_PERSONA,:ID_IDENTIFICACION,:ID_PERSONA_OP)');
                IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
                IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(DateToStr(vFecha_Sucursal) + ' ' + TimeToStr(vHora_Sucursal));
                IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCapag.Text);
                IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := digitoaportes;
                IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := vTipo;
                IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
                IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCapag.Text;
                IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
                IBOtros.ParamByName('BILLETES').AsCurrency := Vcomision;
                IBOtros.ParamByName('MONEDAS').AsCurrency := 0;//TMonedas;
                IBOtros.ParamByName('CHEQUES').AsCurrency := 0;//TCheques;
                IBOtros.ParamByName('ID_AGENCIA_REMOTA').AsInteger := EdCapAgencia.KeyValue;
                IBOtros.ParamByName('HUELLA').AsBoolean := ctlHuella;
                IBOtros.ParamByName('ASOCIADO').AsString := Asociado_Titular;
                IBOtros.ParamByName('ES_CREDITO').AsInteger := 0;
                IBOtros.ParamByName('COMISION').AsInteger := BoolToInt(not(ChkCreditos.Checked));
                IBOtros.ParamByName('ID_PERSONA').AsString := id_persona_titular;
                IBOtros.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_titular;
                IBOtros.ParamByName('ID_PERSONA_OP').AsString := edDocumentoUsuarioAg.Text;
                try
                  IBOtros.ExecQuery;
                except
                on e: Exception do
                begin
                  MessageDlg('Error al Registrar en Tabla Movimiento Remoto, Informe a Sistenas' + #13 + e.Message,mtError,[mbok],0);
                  Exit;
                end;
                end;
               end; {
//*** REGISTRO EL VALOR DE LA SALIDA DE LA COMISION
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movremotosalida" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:ID_AGENCIA_REMOTA,:HUELLA,:ASOCIADO,:ES_CREDITO,1)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(DateToStr(vFecha_Sucursal) + ' ' + TimeToStr(vHora_Sucursal));
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCapag.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCapag.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCapag.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
              IBOtros.ParamByName('BILLETES').AsCurrency := vbilletescomision;
              IBOtros.ParamByName('MONEDAS').AsCurrency := VmonedasComision;
              IBOtros.ParamByName('CHEQUES').AsCurrency := VchequesComision;
              IBOtros.ParamByName('ID_AGENCIA_REMOTA').AsInteger := EdCapAgencia.KeyValue;
              IBOtros.ParamByName('HUELLA').AsInteger := 0;
              IBOtros.ParamByName('ASOCIADO').AsString := Asociado_Titular;
              IBOtros.ParamByName('ES_CREDITO').AsInteger := BoolToInt(ChkCreditos.Checked);
              try
                IBOtros.ExecQuery;
              except
              on e: Exception do
              begin
                MessageDlg('Error al Registrar en Tabla Movimiento Remoto, Informe a Sistenas' + #13 + e.Message,mtError,[mbok],0);
                Exit;
              end;
              end;

              end;  }
//***** FIN DEL REGISTRO DE LA COMISUON

           IBOtros.Transaction.Commit;
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := vFecha_Sucursal;
               FValidar.Caja := StrToInt(EdCaja.Caption);
               FValidar.Origen := OrigenM;
               FValidar.Tipo := TipoCaptacion;
               FValidar.Operacion := 1;
               FValidar.Agencia := EdCapAgencia.KeyValue;
               FValidar.Cuenta := StrToInt(EdNumeroCapag.Text);
               FValidar.Documento := StrToInt(EdDocumentoCapag.Text);
               FValidar.Billetes := TBilletes;
               FValidar.Monedas := TMonedas;
               FValidar.Cheques := TCheques;
               Validar := FValidar;
               ShowModal;
               Free;
           end;

           MessageDlg('Consignación Realizada con Exito!',mtInformation,[mbok],0);
        end;
        Timer.Enabled := True;
        CmdRetornar.Click;
end;

procedure TfrmOperacionesCaja.RealizarRetiroAg;
var TopeTotalOp:Integer;
    TopeValorOp:Currency;
    TotalOp:Integer;
    ValorOp:Currency;
    TopeTotalOpS:Integer;
    TopeValorOpS:Currency;
    TotalOpS:Integer;
    ValorOpS:Currency;
    ServiCaja:Boolean;
    Dia:Integer;
    Hora:TTime;
    DigitoAportes,vTipo :Integer;
begin
       if TGeneral > SaldoEnCaja then
         begin
            MessageDlg('No Tiene Disponibilidad para esta salida' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            CmdokCaptacionAg.Enabled := True;
            EdTotalChequesCapAg.SetFocus;
            Exit;
         end;

        if (TGeneral > Disponible) and (TGeneral <> Saldo) then
         begin
            MessageDlg('No Tiene Disponibilidad para este retiro' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            CmdokCaptacionAg.Enabled := True;
            EdTotalChequesCapAg.SetFocus;
            Exit;
         end;

        if (TGeneral > Disponible) and (TGeneral = Saldo) and (EstadoAct <> 5) and (EstadoAct <> 8) then
         begin
            MessageDlg('No Tiene Disponibilidad para este retiro' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            CmdokCaptacionAg.Enabled := True;
            EdTotalChequesCapAg.SetFocus;
            Exit;
         end;

        if TGeneral = 0 then
        begin
           MessageDlg('No se registrara ningún retiro',mtInformation,[mbok],0);
            CmdokCaptacionAg.Enabled := True;
            EdTotalChequesCapAg.SetFocus;
           Exit;
        end;
        if not ValidarDisponible(TGeneral) then
        begin
            MessageDlg('No Tiene Disponibilidad para este retiro' + #13 +
                       'Verifique los valores O el Monto de la Comisión',mtError,[mbcancel],0);
            CmdokCaptacionAg.Enabled := True;
            //EdTotalChequesCapAg.SetFocus;
            Exit;
        end;
        if GrabarRetiroAg then
        begin
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movremotosalida" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:ID_AGENCIA_REMOTA,:HUELLA,:ASOCIADO,:ES_CREDITO,0,:ID_PERSONA,:ID_IDENTIFICACION,:ID_PERSONA_OP)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(DateToStr(vFecha_Sucursal) + ' ' + TimeToStr(vHora_Sucursal));
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCapag.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCapag.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCapag.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
              IBOtros.ParamByName('BILLETES').AsCurrency := TBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := TMonedas;
              IBOtros.ParamByName('CHEQUES').AsCurrency := TCheques;
              IBOtros.ParamByName('ID_AGENCIA_REMOTA').AsInteger := EdCapAgencia.KeyValue;
              IBOtros.ParamByName('HUELLA').AsInteger := BoolToInt(ctlHuella);
              IBOtros.ParamByName('ASOCIADO').AsString := Asociado_Titular;
              IBOtros.ParamByName('ES_CREDITO').AsInteger := 0;
              IBOtros.ParamByName('ID_PERSONA').AsString := id_persona_titular;
              IBOtros.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_titular;
              IBOtros.ParamByName('ID_PERSONA_OP').AsString := edDocumentoUsuarioAg.Text;

              try
                IBOtros.ExecQuery;
              except
              on e: Exception do
              begin
                MessageDlg('Error al Registrar en Tabla Movimiento Remoto, Informe a Sistenas' + #13 + e.Message,mtError,[mbok],0);
                Exit;
              end;
              end;
//**** REGISTRO DEL VALOR DE LA COMISION
              if Vcomision > 0 then
              begin
                vTipo := TipoCaptacion;
                if vTipo = 1 then
                begin
                    DigitoAportes := StrToInt(DigitoControl(2,EdNumeroCapAg.Text));
                    vTipo := 2;
                end
                else
                   DigitoAportes := StrToInt(DigitoControl(TipoCaptacion,EdNumeroCapAg.Text));
                IBOtros.Close;
                IBOtros.SQL.Clear;
                IBOtros.SQL.Add('insert into "caj$movremotosalida" values(');
                IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
                IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
                IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:ID_AGENCIA_REMOTA,:HUELLA,:ASOCIADO,:ES_CREDITO,:COMISION,:ID_PERSONA,:ID_IDENTIFICACION,:ID_PERSONA_OP)');
                IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
                IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(DateToStr(vFecha_Sucursal) + ' ' + TimeToStr(vHora_Sucursal));
                IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCapag.Text);
                IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := digitoaportes;
                IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := vTipo;
                IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
                IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCapag.Text;
                IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
                IBOtros.ParamByName('BILLETES').AsCurrency := Vcomision;
                IBOtros.ParamByName('MONEDAS').AsCurrency := 0;//TMonedas;
                IBOtros.ParamByName('CHEQUES').AsCurrency := 0;//TCheques;
                IBOtros.ParamByName('ID_AGENCIA_REMOTA').AsInteger := EdCapAgencia.KeyValue;
                IBOtros.ParamByName('HUELLA').AsBoolean := ctlHuella;
                IBOtros.ParamByName('ASOCIADO').AsString := Asociado_Titular;
                IBOtros.ParamByName('ES_CREDITO').AsInteger := 0;
                IBOtros.ParamByName('COMISION').AsInteger := 1;//BoolToInt(not(ChkCreditos.Checked));
                IBOtros.ParamByName('ID_PERSONA').AsString := id_persona_titular;
                IBOtros.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_titular;
                IBOtros.ParamByName('ID_PERSONA_OP').AsString := edDocumentoUsuarioAg.Text;
                try
                  IBOtros.ExecQuery;
                except
                on e: Exception do
                begin
                  MessageDlg('Error al Registrar en Tabla Movimiento Remoto, Informe a Sistenas' + #13 + e.Message,mtError,[mbok],0);
                  Exit;
                end;
                end;
              end;
//** REGISTRO DEL RETIRO DE LA COMISION
              {IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movremotosalida" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES,:ID_AGENCIA_REMOTA,:HUELLA,:ASOCIADO,:ES_CREDITO,1)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(DateToStr(vFecha_Sucursal) + ' ' + TimeToStr(vHora_Sucursal));
              IBOtros.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCapag.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCapag.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCapag.Text;
              IBOtros.ParamByName('CHEQUES_MOVIMIENTO').AsInteger := ListaCheques.Count;
              IBOtros.ParamByName('BILLETES').AsCurrency := vbilletescomision;
              IBOtros.ParamByName('MONEDAS').AsCurrency := VmonedasComision;
              IBOtros.ParamByName('CHEQUES').AsCurrency := VchequesComision;
              IBOtros.ParamByName('ID_AGENCIA_REMOTA').AsInteger := EdCapAgencia.KeyValue;
              IBOtros.ParamByName('HUELLA').AsInteger := 0;
              IBOtros.ParamByName('ASOCIADO').AsString := Asociado_Titular;
              IBOtros.ParamByName('ES_CREDITO').AsInteger := BoolToInt(ChkCreditos.Checked);
              try
                IBOtros.ExecQuery;
              except
              on e: Exception do
              begin
                MessageDlg('Error al Registrar en Tabla Movimiento Remoto, Informe a Sistenas' + #13 + e.Message,mtError,[mbok],0);
                Exit;
              end;
              end;

              end;  }
//***** FIN DEL REGISTRO DE LA COMISUON
              IBOtros.Transaction.Commit;
              frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
              with frmValidarCaptacion do
              begin
                FValidar.Fecha := vFecha_Sucursal;
                FValidar.Caja := StrToInt(EdCaja.Caption);
                FValidar.Origen := OrigenM;
                FValidar.Tipo := TipoCaptacion;
                FValidar.Operacion := 2;
                FValidar.Agencia := EdCapAgencia.KeyValue;
                FValidar.Cuenta := StrToInt(EdNumeroCapag.Text);
                FValidar.Documento := StrToInt(EdDocumentoCapag.Text);
                FValidar.Billetes := TBilletes;
                FValidar.Monedas := TMonedas;
                FValidar.Cheques := TCheques;
                Validar := FValidar;
                ShowModal;
                Free;
            end;
            MessageDlg('Retiro Realizado con Exito!',mtInformation,[mbok],0);
            Timer.Enabled := True;
            CmdRetornar.Click;
            end
            else
              CmdRetornar.SetFocus;
        //end;


end;

function TfrmOperacionesCaja.ValidarDisponible(valor: Currency): boolean;
var    Porcentaje,Maximo,Minimo,Comision,vTope :Currency;
begin
        with IBOtros do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "gen$minimos" where ID_MINIMO in (13,14,15,38)');
           ExecQuery;
           while not Eof do
           begin
              case FieldByName('ID_MINIMO').AsInteger of
                13: Porcentaje := FieldByName('VALOR_MINIMO').AsCurrency;
                14: Minimo := FieldByName('VALOR_MINIMO').AsCurrency;
                15: Maximo := FieldByName('VALOR_MINIMO').AsCurrency;
                38: vTope := FieldByName('VALOR_MINIMO').AsCurrency;
              end;
              Next;
           end;
        end;
        //if valor <= Maximo then
        if valor < vTope then
           Comision := 0
        else if (valor > vTope) and (valor < Maximo) then
           Comision := Minimo
        else
           comision := porcentaje * valor;
        //else
        //   Comision := valor * Porcentaje;
        if (valor + Comision) > Disponible then
           Result := false
        else
           Result := True;
end;

function TfrmOperacionesCaja.SaldoRemoto: currency;
var    SRemoto :Currency;
       fecha :TDate;
begin
        Fecha := StrToDate(EdFecha.Caption);
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select SALDOREMOTO from CAJ_SALDOREMOTO(:ID_CAJA,:FECHA1,:FECHA2)');
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         ParamByName('FECHA1').AsDateTime := EncodeDateTime(YearOf(Fecha),MonthOf(Fecha),DayOf(Fecha),00,00,00,000);
         ParamByName('FECHA2').AsDateTime := EncodeDateTime(YearOf(Fecha),MonthOf(Fecha),DayOf(Fecha),23,59,59,999);
         try
          ExecQuery;
            SRemoto  := FieldByName('SALDOREMOTO').AsCurrency
         except
          Transaction.Rollback;
          SRemoto := 0;
          MessageDlg('Error al Leer Saldo en Caja Remota',mtError,[mbok],0);
          raise;
         end;
        end;
        Result := SRemoto;
end;

procedure TfrmOperacionesCaja.BtcerrarAgClick(Sender: TObject);
begin
        CmdRetornar.Click;
end;

procedure TfrmOperacionesCaja.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;
procedure TfrmOperacionesCaja.BTbuscarClick(Sender: TObject);
begin
        FrmRemotaConsulta := TFrmRemotaConsulta.Create(self);
        FrmRemotaConsulta.Caption := 'Consulta Remota desde : ' + edcapagencia.Text;
        FrmRemotaConsulta.Host_remoto := buscaservicio(EdCapAgencia.KeyValue,1).vHost;
        {case EdCapAgencia.KeyValue of
          1 : FrmRemotaConsulta.Puerto_Remoto := PCOcana;
          2 : FrmRemotaConsulta.Puerto_Remoto := PCAbrego;
          3 : FrmRemotaConsulta.Puerto_Remoto := PCConvencion;
          4 : FrmRemotaConsulta.Puerto_Remoto := PCAguachica;
        end;}
        FrmRemotaConsulta.Puerto_Remoto := buscaservicio(EdCapAgencia.KeyValue,1).vPuerto;
        FrmRemotaConsulta.Ag_Remota := EdCapAgencia.KeyValue;
        if FrmRemotaConsulta.ShowModal = mrOk then
        begin
          if FrmRemotaConsulta.captacion <> 0 then
          begin
            EdNumeroCapag.Text := IntToStr(FrmRemotaConsulta.captacion);
            ednumerocapag.SetFocus;
          end;
        end;

end;

procedure TfrmOperacionesCaja.ChkPapeleriaClick(Sender: TObject);
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
        TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                    vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto + vhonorarios + vcostas + vpapeleria;
        EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TfrmOperacionesCaja.ChkPapeleriaCasClick(Sender: TObject);
begin
        if ChkPapeleriaCas.Checked then
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
        TGeneralCas := vAbonoCapitalCas + vAbonoInteresCas + vAbonoCostasCas + vAbonoHonorariosCas + vPapeleria + vAbonoAprov;
        EdTotalCas.Caption := FormatCurr('#,##0',TGeneralCas);
end;

procedure TfrmOperacionesCaja.CmdVerChequesCerClick(Sender: TObject);
var frmRelacionCheques:TfrmRelacionCheques;
begin
    frmRelacionCheques:=TfrmRelacionCheques.Create(Self);
    frmRelacionCheques.ListaCheques := ListaCheques;
    if frmRelacionCheques.ShowModal = mrok then
    begin
        ListaCheques := frmRelacionCheques.ListaCheques;
        EdChequesCer.Value := frmRelacionCheques.ValorCheques;
    end;
end;

procedure TfrmOperacionesCaja.EdChequesCerChange(Sender: TObject);
begin
        TCheques := EdChequesCer.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;

procedure TfrmOperacionesCaja.EdChequesCerExit(Sender: TObject);
begin
        if (EdChequesCer.Value > 0) and
           (CapOperacion = 'I') then
           CmdVerCheques.Click;

end;

procedure TfrmOperacionesCaja.EdAprovechaEnter(Sender: TObject);
begin
        EdAprovecha.SelectAll;
end;

procedure TfrmOperacionesCaja.EdAprovechaExit(Sender: TObject);
begin
          vAbonoAprov := EdAprovecha.Value; // (EdAbonoCapital.Text);
          TGeneralCas := vAbonoCapitalCas + vAbonoInteresCas + vAbonoCostasCas + vAbonoHonorariosCas + vPapeleria + vAbonoAprov;
          EdTotalCas.Caption := FormatCurr('#,0.00',TGeneralCas);
          if vAbonoAprov > 0 then
           begin
             EdFechaInicialA.Visible := True;
             EdFechaFinalA.Visible := True;
             EdDiasAplicadosA.Visible := True;
             EdTasaAplicadaA.Visible := True;
             Label163.Visible := True;
             Label164.Visible := True;
             Label165.Visible := True;
             Label166.Visible := True;
             EdDiasAplicadosA.SetFocus;
           end;
end;

procedure TfrmOperacionesCaja.EdDiasAplicadosAEnter(Sender: TObject);
begin
        EdDiasAplicadosA.SelectAll;
end;

procedure TfrmOperacionesCaja.EdDiasAplicadosAExit(Sender: TObject);
begin
        DiasAprov;
        vTasaAplicadaCasA := BuscoTasaManual(ClasificacionM,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,vFechaInicialInteresA).TasaMora;
        EdTasaAplicadaA.Text := FormatCurr('#0.00%',vTasaAplicadaCasA);
end;

procedure TfrmOperacionesCaja.DiasAprov;
begin
        if EdDiasAplicadosA.Text = '' then EdDiasAplicadosA.Text := '0';
        vDiasA := StrToInt(EdDiasAplicadosA.Text);
        EdDiasAplicadosA.Text := FormatCurr('#0',vDiasA);
        if (vAbonoAprov <> 0) and (vAbonoInteresCas <> 0) then
         begin
           vFechaInicialInteresA := CalculoFecha(vFechaFinalInteresCas,1);
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

procedure TfrmOperacionesCaja.ValidarEntregaDetalle;
var
  _qSQL :TIBQuery;
  _qTran : TIBTransaction;
  _fFecha1 : TDate;
  _fFecha2 : TDate;
  _cMonto, _cAcumulado : Currency;
begin
        _qTran := TIBTransaction.Create(nil);
        _qSQL := TIBQuery.Create(nil);
        _qTran.DefaultDatabase := dmGeneral.IBDatabase1;
        _qTran.StartTransaction;
        _qSQL.Transaction := _qTran;
// Buscar Fechas de Promoción
        _qSQL.SQL.Clear;
        _qSQL.SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = :ID_MINIMO');
        _qSQL.ParambyName('ID_MINIMO').AsInteger := 45;
        _qSQL.Open;
        _fFecha1 := _qSQL.FieldByName('VALOR_MINIMO').AsFloat;
        _qSQL.Close;
        _qSQL.ParambyName('ID_MINIMO').AsInteger := 46;
        _qSQL.Open;
        _fFecha2 := _qSQL.FieldByName('VALOR_MINIMO').AsFloat;
        _qSQL.Close;
        _qSQL.ParambyName('ID_MINIMO').AsInteger := 47;
        _qSQL.Open;
        _cMonto := _qSQL.FieldByName('VALOR_MINIMO').AsFloat;
        _qSQL.Close;
// Validar Fechas
        if ((fFechaActual < _fFecha1) or (fFechaActual > _fFecha2)) then
        begin
          _qSQL.Close;
          _qTran.Commit;
           exit;
        end;
// Validar si ya fue entregado el detalle
        _qSQL.SQL.Clear;
        _qSQL.SQL.Add('select * from "gen$detallesprograma" where');
        _qSQL.SQL.Add('"gen$detallesprograma".ID_AGENCIA = :ID_AGENCIA and');
        _qSQL.SQL.Add('"gen$detallesprograma".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
        _qSQL.SQL.Add('"gen$detallesprograma".NUMERO_CUENTA = :NUMERO_CUENTA and');
        _qSQL.SQL.Add('"gen$detallesprograma".DIGITO_CUENTA = :DIGITO_CUENTA and');
        _qSQL.SQL.Add('"gen$detallesprograma".FECHA_ENTREGA BETWEEN :FECHA1 and :FECHA2');
        _qSQL.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        _qSQL.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
        _qSQL.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(edNumeroCap.Text);
        _qSQL.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(edDigitoCap.Caption);
        _qSQL.ParamByName('FECHA1').AsDate := _fFecha1;
        _qSQL.ParamByName('FECHA2').AsDate := _fFecha2;
        _qSQL.Open;
        if _qSQL.RecordCount < 1 then
        begin
            _qSQL.Close;
            _qSQL.SQL.Clear;
            _qSQL.SQL.Add('select * from CAP$CONSIGNACIONES_PERIODO(');
            _qSQL.SQL.Add(':ID_TIPO_CAPTACION,');
            _qSQL.SQL.Add(':ID_AGENCIA,');
            _qSQL.SQL.Add(':NUMERO_CUENTA,');
            _qSQL.SQL.Add(':DIGITO_CUENTA,');
            _qSQL.SQL.Add(':FECHA1,');
            _qSQL.SQL.Add(':FECHA2');
            _qSQL.SQL.Add(')');
            _qSQL.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
            _qSQL.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            _qSQL.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(edNumeroCap.Text);
            _qSQL.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(edDigitoCap.Caption);
            _qSQL.ParamByName('FECHA1').AsDate := _fFecha1;
            _qSQL.ParamByName('FECHA2').AsDate := _fFecha2;
            _qSQL.Open;
            if _qSQL.RecordCount > 0 then
            begin
              _cAcumulado := _qSQL.FieldByName('ACUMULADO').AsCurrency;
              _qSQL.Close;
              if _cAcumulado >= _cMonto then
              begin
                  if MessageDlg('El Ahorrador tiene derecho al detalle,'+#13+
                                'Desea marcar como entregado',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                  begin
                      _qSQL.SQL.Clear;
                      _qSQL.SQL.Add('insert into "gen$detallesprograma" values (');
                      _qSQL.SQL.Add(':ID_AGENCIA,');
                      _qSQL.SQL.Add(':ID_TIPO_CAPTACION,');
                      _qSQL.SQL.Add(':NUMERO_CUENTA,');
                      _qSQL.SQL.Add(':DIGITO_CUENTA,');
                      _qSQL.SQL.Add(':FECHA_ENTREGA,');
                      _qSQL.SQL.Add(':HORA_ENTREGA,');
                      _qSQL.SQL.Add(':ID_EMPLEADO');
                      _qSQL.SQL.Add(')');
                      _qSQL.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                      _qSQL.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      _qSQL.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(edNumeroCap.Text);
                      _qSQL.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(edDigitoCap.Caption);
                      _qSQL.ParamByName('FECHA_ENTREGA').AsDate := fFechaActual;
                      _qSQL.ParamByName('HORA_ENTREGA').AsTime := fHoraActual;
                      _qSQL.ParamByName('ID_EMPLEADO').AsString := DBAlias;
                      try
                       _qSQL.ExecSQL;
                      except
                        MessageDlg('110: No se pudo marcar la cuenta juvenil',mtError,[mbOk],0);
                      end;
                  end; // fin messagedlg
              end; // fin del _cAcumulado >= _cMonto
            end; // fin del _qSQL.RecordCount
        end;
        _qSQL.Close;
        _qTran.Commit;
end;

procedure TfrmOperacionesCaja.BuscarMinimoSARLAFT;
var
 _qSQL :TIBQuery;
 _qTran:TIBTransaction;
begin
        _qTran := TIBTransaction.Create(nil);
        _qSQL := TIBQuery.Create(nil);
        _qTran.DefaultDatabase := dmGeneral.IBDatabase1;
        _qTran.StartTransaction;
        _qSQL.Transaction := _qTran;
// Buscar Minimo SARLAFT
        _qSQL.SQL.Clear;
        _qSQL.SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = :ID_MINIMO');
        _qSQL.ParambyName('ID_MINIMO').AsInteger := 49;
        try
           _qSQL.Open;
           _vMinimoSARLAFT := _qSQL.FieldByName('VALOR_MINIMO').AsCurrency;
           _qSQL.Close;
           _qTran.Commit;
        except
           _vMinimoSARLAFT := 10000000;
        end;

        _qSQL.Free;
        _qTran.Free;
end;

procedure TfrmOperacionesCaja.edDocumentoUsuarioExit(Sender: TObject);
var
 PersonaData:TPersonaData;
begin
        PersonaData := ValidarPersona(edDocumentoUsuario.Text);
        if (PersonaData.Existe) then
        begin
              edPrimerApellidoUsuario.Text := PersonaData.PrimerApellido;
              edSegundoApellidoUsuario.Text := PersonaData.SegundoApellido;
              edNombreUsuario.Text := PersonaData.Nombre;
              edPrimerApellidoUsuario.Enabled := false;
              edSegundoApellidoUsuario.Enabled := false;
              edNombreUsuario.Enabled := false;
              cmdUsuario.Enabled := False;
              _bDocumentoUsuarioValido := True;
              cmdOkCaptacion.SetFocus;
        end
        else
        begin
              edPrimerApellidoUsuario.Enabled := True;
              edSegundoApellidoUsuario.Enabled := True;
              edNombreUsuario.Enabled := True;
              cmdUsuario.Enabled := True;
              _bDocumentoUsuarioValido := False;
              edPrimerApellidoUsuario.SetFocus;
          end;
end;

procedure TfrmOperacionesCaja.cmdUsuarioClick(Sender: TObject);
var
  DataPersona : TPersonaData;
begin
        DataPersona.Documento := edDocumentoUsuario.Text;
        DataPersona.PrimerApellido := edPrimerApellidoUsuario.Text;
        DataPersona.SegundoApellido := edSegundoApellidoUsuario.Text;
        DataPersona.Nombre := edNombreUsuario.Text;
        try
          if GuardarPersona(DataPersona) then
          begin
                _bDocumentoUsuarioValido := True;
                cmdOkCaptacion.SetFocus;
          end
          else
          begin
               _bDocumentoUsuarioValido := False;
          end;
        except
         _bDocumentoUsuarioValido := False;
         raise;
        end;
end;

procedure TfrmOperacionesCaja.edDocumentoOpCertUsuarioExit(
  Sender: TObject);
var
 PersonaData:TPersonaData;
begin
        PersonaData := ValidarPersona(edDocumentoOpCertUsuario.Text);
        if (PersonaData.Existe) then
        begin
              edPrimerApellidoOpCertUsuario.Text := PersonaData.PrimerApellido;
              edSegundoApellidoOpCertUsuario.Text := PersonaData.SegundoApellido;
              edNombreOpCertUsuario.Text := PersonaData.Nombre;
              edPrimerApellidoOpCertUsuario.Enabled := false;
              edSegundoApellidoOpCertUsuario.Enabled := false;
              edNombreOpCertUsuario.Enabled := false;
              cmdOpCertUsuario.Enabled := False;
              _bDocumentoUsuarioValido := True;
              cmdOkCertificado.SetFocus;
        end
        else
        begin
              edPrimerApellidoOpCertUsuario.Enabled := True;
              edSegundoApellidoopCertUsuario.Enabled := True;
              edNombreOpCertUsuario.Enabled := True;
              cmdOpCertUsuario.Enabled := True;
              _bDocumentoUsuarioValido := False;
              edPrimerApellidoOpCertUsuario.SetFocus;
          end;
end;

function TfrmOperacionesCaja.ValidarPersona(DocumentoUsuario:string):TPersonaData;
var
 _qSQL:TIBQuery;
 _qTran:TIBTransaction;
begin
        _qSQL := TIBQuery.Create(nil);
        _qTran := TIBTransaction.Create(nil);
        _qTran.DefaultDatabase := dmGeneral.IBDatabase1;
        _qSQL.Transaction := _qTran;

        _qSQL.SQL.Clear;
        _qSQL.SQL.Add('select ID_PERSONA,PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona" p');
        _qSQL.SQL.Add('where p.ID_PERSONA = :ID_PERSONA');
        _qSQL.ParamByName('ID_PERSONA').AsString := DocumentoUsuario;
        try
          _qSQL.Open;
          if _qSQL.RecordCount > 0 then
          begin
              result.Documento := _qSQL.FieldByName('ID_PERSONA').AsString;
              result.PrimerApellido := _qSQL.FieldByName('PRIMER_APELLIDO').AsString;
              result.SegundoApellido := _qSQL.FieldByName('SEGUNDO_APELLIDO').AsString;
              result.Nombre := _qSQL.FieldByName('NOMBRE').AsString;
              result.Existe := true;
          end
          else
          begin
              edPrimerApellidoUsuario.Enabled := True;
              edSegundoApellidoUsuario.Enabled := True;
              edNombreUsuario.Enabled := True;
              cmdUsuario.Enabled := True;
              _bDocumentoUsuarioValido := False;
              edPrimerApellidoUsuario.SetFocus;
          end;
          _qSQL.Close;
          _qTran.Commit;
        except
          raise;
          exit;
        end;
end;

function TfrmOperacionesCaja.GuardarPersona(PersonaData: TPersonaData):Boolean;
var
 _qSQL:TIBQuery;
 _qTran:TIBTransaction;
begin
        _qSQL := TIBQuery.Create(nil);
        _qTran := TIBTransaction.Create(nil);
        _qTran.DefaultDatabase := dmGeneral.IBDatabase1;
        _qSQL.Transaction := _qTran;

        _qSQL.SQL.Clear;
        _qSQL.SQL.Add('INSERT INTO "gen$persona"');
        _qSQL.SQL.Add('(');
        _qSQL.SQL.Add('ID_IDENTIFICACION,');
        _qSQL.SQL.Add('ID_PERSONA,');
        _qSQL.SQL.Add('PRIMER_APELLIDO,');
        _qSQL.SQL.Add('SEGUNDO_APELLIDO,');
        _qSQL.SQL.Add('NOMBRE,');
        _qSQL.SQL.Add('ID_TIPO_ESTADO_CIVIL,');
        _qSQL.SQL.Add('ID_IDENTIFICACION_CONYUGE,');
        _qSQL.SQL.Add('ID_IDENTIFICACION_APODERADO,');
        _qSQL.SQL.Add('ID_ESTADO,');
        _qSQL.SQL.Add('ID_TIPO_RELACION,');
        _qSQL.SQL.Add('ID_TIPO_PERSONA,');
        _qSQL.SQL.Add('ID_CIIU');
        _qSQL.SQL.Add(')');
        _qSQL.SQL.Add('VALUES (');
        _qSQL.SQL.Add('3,');
        _qSQL.SQL.Add(':ID_PERSONA,');
        _qSQL.SQL.Add(':PRIMER_APELLIDO,');
        _qSQL.SQL.Add(':SEGUNDO_APELLIDO,');
        _qSQL.SQL.Add(':NOMBRE,');
        _qSQL.SQL.Add('0,');
        _qSQL.SQL.Add('0,');
        _qSQL.SQL.Add('0,');
        _qSQL.SQL.Add('0,');
        _qSQL.SQL.Add('0,');
        _qSQL.SQL.Add('0,');
        _qSQL.SQL.Add('0');
        _qSQL.SQL.Add(')');
        _qSQL.ParamByName('ID_PERSONA').AsString := PersonaData.Documento;
        _qSQL.ParamByName('PRIMER_APELLIDO').AsString := PersonaData.PrimerApellido;
        _qSQL.ParamByName('SEGUNDO_APELLIDO').AsString := PersonaData.SegundoApellido;
        _qSQL.ParamByName('NOMBRE').AsString := PersonaData.Nombre;
        try
         _qSQL.ExecSQL;
         _qTran.Commit;
         _qSQL.Close;
         _bDocumentoUsuarioValido := True;
         ShowMessage('Persona Almacenada con Exito');
         result := true;
        except
         _bDocumentoUsuarioValido := False;
         result := false;
         raise;
        end;

        FreeAndNil(_qSQL);
        FreeAndNil(_qTran);
end;

procedure TfrmOperacionesCaja.cmdOpCertUsuarioClick(Sender: TObject);
var
  DataPersona : TPersonaData;
begin
        DataPersona.Documento := edDocumentoOpCertUsuario.Text;
        DataPersona.PrimerApellido := edPrimerApellidoOpCertUsuario.Text;
        DataPersona.SegundoApellido := edSegundoApellidoOpCertUsuario.Text;
        DataPersona.Nombre := edNombreOpCertUsuario.Text;
        try
          if GuardarPersona(DataPersona) then
          begin
                _bDocumentoUsuarioValido := True;
                cmdOkCertificado.SetFocus;
          end
          else
          begin
               _bDocumentoUsuarioValido := False;
          end;
        except
         _bDocumentoUsuarioValido := False;
         raise;
        end;
end;

procedure TfrmOperacionesCaja.edDocumentoOpColUsuarioExit(Sender: TObject);
var
 PersonaData:TPersonaData;
begin
        PersonaData := ValidarPersona(edDocumentoOpColUsuario.Text);
        if (PersonaData.Existe) then
        begin
              edPrimerApellidoOpColUsuario.Text := PersonaData.PrimerApellido;
              edSegundoApellidoOpColUsuario.Text := PersonaData.SegundoApellido;
              edNombreOpColUsuario.Text := PersonaData.Nombre;
              edPrimerApellidoOpColUsuario.Enabled := false;
              edSegundoApellidoOpColUsuario.Enabled := false;
              edNombreOpColUsuario.Enabled := false;
              cmdOpColUsuario.Enabled := False;
              _bDocumentoUsuarioValido := True;
              cmdOkColocacion.SetFocus;
        end
        else
        begin
              edPrimerApellidoOpColUsuario.Enabled := True;
              edSegundoApellidoOpColUsuario.Enabled := True;
              edNombreOpColUsuario.Enabled := True;
              cmdOpColUsuario.Enabled := True;
              _bDocumentoUsuarioValido := False;
              edPrimerApellidoOpColUsuario.SetFocus;
          end;
end;

procedure TfrmOperacionesCaja.cmdOpColUsuarioClick(Sender: TObject);
var
  DataPersona : TPersonaData;
begin
        DataPersona.Documento := edDocumentoOpColUsuario.Text;
        DataPersona.PrimerApellido := edPrimerApellidoOpColUsuario.Text;
        DataPersona.SegundoApellido := edSegundoApellidoOpColUsuario.Text;
        DataPersona.Nombre := edNombreOpColUsuario.Text;
        try
          if GuardarPersona(DataPersona) then
          begin
                _bDocumentoUsuarioValido := True;
                cmdOkColocacion.SetFocus;
          end
          else
          begin
               _bDocumentoUsuarioValido := False;
          end;
        except
         _bDocumentoUsuarioValido := False;
         raise;
        end;end;

procedure TfrmOperacionesCaja.edDocumentoUsuarioAgExit(Sender: TObject);
var
 PersonaData:TPersonaData;
begin
        PersonaData := ValidarPersona(edDocumentoUsuarioAg.Text);
        if (PersonaData.Existe) then
        begin
              edPrimerApellidoUsuarioAg.Text := PersonaData.PrimerApellido;
              edSegundoApellidoUsuarioAg.Text := PersonaData.SegundoApellido;
              edNombreUsuarioAg.Text := PersonaData.Nombre;
              edPrimerApellidoUsuarioAg.Enabled := false;
              edSegundoApellidoUsuarioAg.Enabled := false;
              edNombreUsuarioAg.Enabled := false;
              cmdUsuarioAg.Enabled := False;
              _bDocumentoUsuarioValido := True;
              cmdOkCaptacionAg.SetFocus;
        end
        else
        begin
              edPrimerApellidoUsuarioAg.Enabled := True;
              edSegundoApellidoUsuarioAg.Enabled := True;
              edNombreUsuarioAg.Enabled := True;
              cmdUsuarioAg.Enabled := True;
              _bDocumentoUsuarioValido := False;
              edPrimerApellidoUsuarioAg.SetFocus;
          end;
end;

procedure TfrmOperacionesCaja.CmdUsuarioAgClick(Sender: TObject);
var
  DataPersona : TPersonaData;
begin
        DataPersona.Documento := edDocumentoUsuarioAg.Text;
        DataPersona.PrimerApellido := edPrimerApellidoUsuarioAg.Text;
        DataPersona.SegundoApellido := edSegundoApellidoUsuarioAg.Text;
        DataPersona.Nombre := edNombreUsuarioAg.Text;
        try
          if GuardarPersona(DataPersona) then
          begin
                _bDocumentoUsuarioValido := True;
                cmdOkCaptacionAg.SetFocus;
          end
          else
          begin
               _bDocumentoUsuarioValido := False;
          end;
        except
         _bDocumentoUsuarioValido := False;
         raise;
        end;
end;

end.
