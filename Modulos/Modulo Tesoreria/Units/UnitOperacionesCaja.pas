unit UnitOperacionesCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, IB, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JvComponent, JvTransBtn,
  JvSpeedButton, JvItemsPanel, JvLookOut, ComCtrls, JvEdit, DBCtrls, DB,
  IBCustomDataSet, IBQuery, Grids, CheckLst, JvTypedEdit, IBSQL, Mask,DateUtils,
  JvToolEdit, JvCurrEdit,ToolEdit, CurrEdit, UnitGlobales,
  pr_Common, pr_TxClasses, lmdstdcA, UnitValidarCaptacion,UnitValidarColocacion,
  JvLabel, JvBlinkingLabel, JvSpecialLabel, RxCalc;


type
    TDenominacion = Record
    IdDenominacion:Integer;
    vDenominacion:Currency;
    Denominacion: TLabel;
    Cantidad:TJvIntegerEdit;
    Total:TStaticText;
    Existencia:Integer;
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
    CmdColProrroga: TSpeedButton;
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
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SBDenominacion: TScrollBox;
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
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    SBDenominacionCer: TScrollBox;
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
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    SBDenominacionGen: TScrollBox;
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
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    SBDenominacionOtr: TScrollBox;
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
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    SBDenominacionCol: TScrollBox;
    EdTotalCol: TStaticText;
    Panel10: TPanel;
    CmdOKColocacion: TBitBtn;
    EdMonedasCol: TRxCalcEdit;
    EdDevolucionCol: TRxCalcEdit;
    CmdVerDevolucionCol: TBitBtn;
    IBQuery: TIBQuery;
    IBQuery1: TIBQuery;
    Report: TprTxReport;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    Label74: TLabel;
    CmdInforme: TBitBtn;
    CmdAbonar: TBitBtn;
    CmdLiquidar: TBitBtn;
    EdNoComprobante: TJvEdit;
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
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    EdNumeroColocacionManual: TMemo;
    EdTipoIdentificacionManual: TStaticText;
    EdNumeroIdentificacionManual: TStaticText;
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
    EdNoComprobanteManual: TMaskEdit;
    GroupBox4: TGroupBox;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    EdAbonoCapital: TEdit;
    GroupBox5: TGroupBox;
    Devueltos: TRadioButton;
    Cobrados: TRadioButton;
    EdInteresDevuelto: TEdit;
    EdInteresCobrado: TEdit;
    EdFechaInicialDevuelto: TDateTimePicker;
    EdFechaInicialCobrado: TDateTimePicker;
    EdFechaFinalDevuelto: TDateTimePicker;
    EdFechaFinalCobrado: TDateTimePicker;
    GroupBox6: TGroupBox;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    EdAbonoInteresCausado: TLabeledEdit;
    EdDiasAplicadosCausado: TLabeledEdit;
    EdTasaAplicadaCausado: TLabeledEdit;
    EdFechaInicialCausado: TDateTimePicker;
    EdFechaFinalcausado: TDateTimePicker;
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
    Panel11: TPanel;
    CmdGenerarInformeManual: TBitBtn;
    CmdRecaudarManual: TBitBtn;
    ReportM: TprTxReport;
    CmdAceptarManual: TBitBtn;
    CmdReversarManual: TBitBtn;
    Calculadora: TRxCalculator;
    CmdSumadora: TSpeedButton;
    Label124: TLabel;
    EdTotalColManual: TStaticText;
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
    procedure EdNoComprobanteExit(Sender: TObject);
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
    procedure EdNoComprobanteManualExit(Sender: TObject);
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
    procedure EdFechaFinalcausadoExit(Sender: TObject);
    procedure EdDiasAplicadosCausadoExit(Sender: TObject);
    procedure EdTasaAplicadaCausadoExit(Sender: TObject);
    procedure EdAbonoInterescorrienteExit(Sender: TObject);
    procedure EdFechaInicialCorrienteExit(Sender: TObject);
    procedure EdFechaFinalCorrienteExit(Sender: TObject);
    procedure EdDiasAplicadosCorrienteExit(Sender: TObject);
    procedure EdTasaAplicadaCorrienteExit(Sender: TObject);
    procedure EdAbonoInteresAnticipadoExit(Sender: TObject);
    procedure EdFechaInicialAnticipadoExit(Sender: TObject);
    procedure EdFechaFinalAnticipadoExit(Sender: TObject);
    procedure EdDiasAplicadosAnticipadoExit(Sender: TObject);
    procedure EdTasaAplicadaAnticipadoExit(Sender: TObject);
    procedure EdAbonoInteresMoraExit(Sender: TObject);
    procedure EdFechaInicialMoraExit(Sender: TObject);
    procedure EdFechaFinalMoraExit(Sender: TObject);
    procedure EdDiasAplicadosMoraExit(Sender: TObject);
    procedure EdTasaAplicadaMoraExit(Sender: TObject);
    procedure CmdGenerarInformeManualClick(Sender: TObject);
    procedure CmdAceptarManualClick(Sender: TObject);
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
  Saldo:Currency;
  Movimiento:Currency;
  Canje:Currency;
  Disponible:Currency;
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

  vInteresCobrado:Currency;
  vInteresDevuelto:Currency;
  vFechaInicialCobrado:TDate;
  vFechaFinalCobrado:TDate;
  vFechaInicialDevuelto:TDate;
  vFechaFinalDevuelto:TDate;

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



implementation

{$R *.dfm}

uses UnitRelacionCheques,UnitArqueoDevolucion, UnitGlobalesCol,
  UnitdmColocacion, UnitdmGeneral,UnitBuscarColocacion,
  UnitBuscarPersona,UnitImagenesPersona, UnitBuscarCaptacion,
  UnitVistaPreliminar;

procedure TfrmOperacionesCaja.SetVGeneral(Value:Currency);
begin
        VGeneral := Value;
{        if (CapOperacion = 'R') or (CapOperacion = 'S') or (CapOperacion = 'M') then
         if (VGeneral-TCheques) > TTotalEnCaja then
          begin
            MessageDlg('Est? sobrepasando las existencias de caja',mtError,[mbcancel],0);
          end;
}
        if CapOperacion = 'R' then
         if VGeneral > Disponible then
          begin
            MessageDlg('Est? sobrepasando el disponible de la cuenta',mtInformation,[mbok],0);
          end;

        SDiferencia.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);
        SDiferenciaCer.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);
        SDiferenciaCol.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);
        SDiferenciaOtr.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);
        SDiferenciaGen.Caption := FormatCurr('$#,0.00',TSumaBilletes - TGeneral);

        EdTotalCap.Caption := FormatCurr('$#,0.00',VGeneral);
        EdTotalCer.Caption := FormatCurr('$#,0.00',VGeneral);
        EdTotalGen.Caption := FormatCurr('$#,0.00',VGeneral);
        EdTotalCol.Caption := FormatCurr('$#,0.00',VGeneral);
        EdTotalOtr.Caption := FormatCurr('$#,0.00',VGeneral);

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
        dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        CerosVariables;
        EdFecha.Caption := FormatDateTime('yyyy/mm/dd',Date);
        EdHora.Caption := FormatDateTime('hh:nn:ss am/pm',Time);
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
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBOperaciones.Enabled := False;
        CmdOKCaptacion.Caption := '&Consignar';
        CmdOKCaptacion.Enabled := True;
        EdEstadoActualCap.Caption := 'En Consignaci?n';
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
        if StrToInt(EdOpcion.EditText) in [1..9] then
        case Opcion of  // Estando en Productos
        1: case StrToInt(EdOpcion.Text) of
           1: CmdAportes.Click;
           2: CmdOrdinario.Click;
           3: CmdRindediario.Click;
           4: CmdJuvenil.Click;
{           5: CmdContractual.Click;
           6: CmdCdat.Click;
           7: CmdCartera.Click;
           8: CmdOtros.Click;
           9: CmdGenerales.Click; }
           end;
        2: case StrToInt(EdOpcion.Text) of // Estando en Captaciones
           1: CmdCapCon.Click;
//           2: CmdCapRet.Click;
           3: CmdCapSalir.Click;
           end;
{        3: case StrToInt(EdOpcion.Text) of // Estando en Certificados
           1: CmdIngresarCDAT.Click;
           2: CmdSaldarCDAT.Click;
           3: CmdRetornarCDAT.Click;
           end;
        4: case StrToInt(EdOpcion.Text) of // Estando en Colocaciones
           1: CmdColAbono.Click;
           2: CmdColManual.Click;
           3: CmdColProrroga.Click;
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
           end;}
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
           SQL.Add('CAJ$CAJAS.ID_CAJA,');
           SQL.Add('CAJ$CAJAS.HORA_INICIO,');
           SQL.Add('CAJ$CAJAS.HORA_FINAL,');
           SQL.Add('"caj$estados".PERMITE_MOVIMIENTO,');
           SQL.Add('"caj$cierres".ESTADO,');
           SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
           SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$empleado".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('CAJ$CAJAS');
           SQL.Add('INNER JOIN "caj$estados" ON (CAJ$CAJAS.ID_ESTADO_CAJA = "caj$estados".ID_ESTADO)');
           SQL.Add('INNER JOIN "caj$cierres" ON ("caj$cierres".ID_CAJA = CAJ$CAJAS.ID_CAJA)');
           SQL.Add('INNER JOIN "gen$empleado" ON (CAJ$CAJAS.ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('where CAJ$CAJAS.ID_EMPLEADO = :ID_EMPLEADO and "caj$cierres".FECHA = :FECHA');
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
begin

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
                SQL.Add('"cap$tiposestado".DESCRIPCION,');
                SQL.Add('"cap$tiposestado".PERMITE_MOVIMIENTO,');
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
                    MessageDlg('Captaci?n No Exite',mtError,[mbcancel],0);
                    EdNumeroCap.SelectAll;
                    EdNumeroCap.SetFocus;
                    Exit;
                  end;
                  EsDeMovimiento := InttoBoolean(FieldByName('PERMITE_MOVIMIENTO').AsInteger);
                  EdEstadoCap.Caption := FieldByName('DESCRIPCION').AsString;
                  EdFirmas.Caption := IntToStr(FieldByName('FIRMAS').AsInteger);
                  EdSellos.Caption := IntToStr(FieldByName('SELLOS').AsInteger);
                  EdProtectografos.Caption := IntToStr(FieldByName('PROTECTOGRAFOS').AsInteger);
                  if not EsDeMovimiento then
                  begin
                     MessageDlg('Esta Captaci?n No Se Puede Trabajar',mtError,[mbcancel],0);
                     EdNumeroCap.SelectAll;
                     EdNumeroCap.SetFocus;
                     Exit;
                  end;
                  EdRangoIni.Caption := Format('%.8d',[FieldByName('NUMERO_INICIAL').AsInteger]);
                  EdRangoFin.Caption := Format('%.8d',[FieldByName('NUMERO_FINAL').AsInteger]);
                except
                  MessageDlg('Error Buscando la Captaci?n',mtError,[mbcancel],0);
                  EdNumeroCap.SelectAll;
                  EdNumeroCap.SetFocus;
                  Exit;
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
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                ParamByName('ANO').AsString := IntToStr(YearOf(Date));
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
                except
                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   EdNumeroCap.SetFocus;
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
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito;
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
         end;
         Saldo := Saldo + Movimiento;
         Disponible := Saldo - Canje;
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
//        if not Recuperararqueo then Exit;
        CmdRetornar.Enabled := True;
        VOopcion;
        GBOperaciones.Enabled := False;
        CmdOKCaptacion.Caption := '&Retirar';
        CmdOKCaptacion.Enabled := True;
        EdEstadoActualCap.Caption := 'En Retiro';        
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
            EdChequesCap.SetFocus;
          end
          else
           EdDocumentoCap.SetFocus;
       end
       else
          Mensaje.Caption := 'Debe diligenciar el n?mero de documento';
//          MessageDlg('Debe diligenciar el n?mero de documento',mtError,[mbcancel],0);
end;

procedure TfrmOperacionesCaja.RealizarConsignacion;
begin
        if EdChequesCap.Value <> 0 then
          if ListaCheques.Count = 0 then
          begin
            MessageDlg('Debe diligenciar la relaci?n de cheques',mtError,[mbcancel],0);
            CmdVerCheques.Click;
          end;

        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara la consignaci?n',mtInformation,[mbok],0);
           EdChequesCap.SetFocus;
           Exit;
        end;

        Timer.Enabled := False;

        if GrabarConsignacion then
        begin
{           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
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
           }
           MessageDlg('Consignaci?n Realizada con Exito!',mtInformation,[mbok],0);
        end
        else
           MessageDlg('Error al Realizar la Consignaci?n, consulte con sistemas',mtError,[mbcancel],0);

        Timer.Enabled := True;

        CmdRetornar.Click;

end;

procedure TfrmOperacionesCaja.RealizarRetiro;
begin
        if TGeneral > Disponible then
         begin
            MessageDlg('No Tiene Disponibilidad para este retiro' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            EdChequesCap.SetFocus;
            Exit;
         end;

        if TGeneral = 0 then
        begin
           MessageDlg('No se registrara ning?n retiro',mtInformation,[mbok],0);
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
             MessageDlg('El tipo de captaci?n no existe, Consulte con sistemas'+#13+
                        'Operaci?n no registrada',mtError,[mbcancel],0);
             Exit;
           end;
         except
           MessageDlg('Error al Buscar Tipo de Captaci?n',mtError,[mbcancel],0);
           Exit;
         end;
         if (FieldByName('RETIRO_PARCIAL').AsInteger = 0) and
            (TGeneral <> Saldo) then begin
            MessageDlg('Este tipo de captaci?n, no permite retiros parciales'+#13+
                       'Por Favor verifique su operaci?n',mtError,[mbcancel],0);
            Exit;
         end;
        end;
        
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
        if (EdChequesCap.Value > 0) and
           (CapOperacion = 'C') then
           CmdVerCheques.Click;
end;

procedure TfrmOperacionesCaja.FormCreate(Sender: TObject);
begin
        Application.OnException := Excepciones;
        dmColocacion := TdmColocacion.Create(Self);
        ListaCheques := TList.Create;
        ListaDevolucion := TList.Create;
end;

procedure TfrmOperacionesCaja.CmdOKCaptacionClick(Sender: TObject);
begin
        if EdDocumentoCap.Text = '' then
        begin
           MessageDlg('Debe Diligenciar el Documento',mtInformation,[mbok],0);
           EdDocumentoCap.SetFocus;
        end;

        if MessageDlg('Seguro de Realizar la Operaci?n',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

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
end;

procedure TfrmOperacionesCaja.EdChequesCapChange(Sender: TObject);
begin
        TCheques := EdChequesCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;
end;

function TfrmOperacionesCaja.GrabarConsignacion:Boolean;
var Valor:Currency;
    I:Integer;
    ARecord:PLista;
    PRecord:PListaDev;
    Validar:TValidarCap;
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
               IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
               IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdDocumentoCap.Text;
               IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'CONSIGNACION EN EFECTIVO';
               IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := Valor;
               IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Consignaci?n',mtError,[mbok],0);
                   IBPagar.Transaction.RollbackRetaining;
                   Result := False;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Consignaci?n',mtError,[mbok],0);
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
                   MessageDlg('Error Grabando Consignaci?n',mtError,[mbok],0);
                   IBPagar.Transaction.RollbackRetaining;
                   Result := False;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Consignaci?n',mtError,[mbok],0);
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

              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('update "cap$maestrosaldosmes" ');
              IBPagar.SQL.Add('set DEBITO = DEBITO + :"DEBITO", CREDITO = CREDITO + :"CREDITO" ');
              IBPagar.SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              IBPagar.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" and MES = :"MES"');
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBPagar.ParamByName('MES').AsString := Format('%.2d',[MonthOf(StrToDate(EdFecha.Caption))]);
              IBPagar.ParamByName('DEBITO').AsCurrency := TGeneral;
              IBPagar.ParamByName('CREDITO').AsCurrency := 0;
              try
                IBPagar.ExecQuery;
                if IBPagar.RowsAffected < 1 then
                begin
                IBPagar.Transaction.RollbackRetaining;
                MessageDlg('Error Actualizando Saldo Mes Captaci?n',mtError,[mbcancel],0);
                Result := False;
                Exit;
                end
              except
                IBPagar.Transaction.RollbackRetaining;
                MessageDlg('Error Actualizando Saldo Mes Captaci?n',mtError,[mbcancel],0);
                Result := False;
                Exit;
              end;
              IBPagar.Close;

              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimiento" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES)');
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
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
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


              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('update "cap$maestrosaldosmes" ');
              IBPagar.SQL.Add('set DEBITO = DEBITO + :"DEBITO", CREDITO = CREDITO + :"CREDITO" ');
              IBPagar.SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              IBPagar.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" and MES = :"MES"');
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
              IBPagar.ParamByName('MES').AsString := Format('%.2d',[MonthOf(StrToDate(EdFecha.Caption))]);
              IBPagar.ParamByName('DEBITO').AsCurrency := 0;
              IBPagar.ParamByName('CREDITO').AsCurrency := TGeneral;
              try
                IBPagar.ExecQuery;
                if IBPagar.RowsAffected < 1 then
                begin
                IBPagar.Transaction.RollbackRetaining;
                MessageDlg('Error Actualizando Saldo Mes Captaci?n',mtError,[mbcancel],0);
                Result := False;
                Exit;
                end
              except
                IBPagar.Transaction.RollbackRetaining;
                MessageDlg('Error Actualizando Saldo Mes Captaci?n',mtError,[mbcancel],0);
                Result := False;
                Exit;
              end;
              IBPagar.Close;


              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimiento" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES)');
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
       EdDocumentoCap.Text := '';
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
       EdNocomprobante.Text := '';
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
  Garantia:='';
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
        GBColocaciones.Caption := 'Colocaci?n';
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
               SQL.Add(':LIBRETA BETWEEN NUMERO_INICIAL and NUMERO_FINAL ) or ');
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
                SQL.Clear;
                SQL.Add('SELECT');
                SQL.Add('"cap$tiposestado".DESCRIPCION,');
                SQL.Add('"cap$tiposestado".PARA_ACTIVAR,');
                SQL.Add('"cap$tiposestado".PARA_SALDAR,');
                SQL.Add('"cap$maestro".VALOR_INICIAL');
                SQL.Add('FROM');
                SQL.Add('"cap$maestro"');
                SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                SQL.Add('WHERE');
                SQL.Add('(ID_AGENCIA = :ID_AGENCIA) AND');
                SQL.Add('(ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND');
                SQL.Add('(NUMERO_CUENTA = :NUMERO_CUENTA) AND');
                SQL.Add('(DIGITO_CUENTA = :DIGITO_CUENTA)');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                  ExecQuery;
                  if RecordCount < 1 then
                  begin
                    MessageDlg('Captaci?n No Exite',mtError,[mbcancel],0);
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
                  if not EsDeMovimiento then
                  begin
                     MessageDlg('Esta Captaci?n No Se Puede Trabajar',mtError,[mbcancel],0);
                     EdNumeroCer.SelectAll;
                     EdNumeroCer.SetFocus;
                     Exit;
                  end;

                except
                  MessageDlg('Error Buscando la Captaci?n',mtError,[mbcancel],0);
                  EdNumeroCer.SelectAll;
                  EdNumeroCer.SetFocus;
                  Exit;
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
          EdTotalBilletesCer.SetFocus;
       end
       else
          Mensaje.Caption := 'Debe diligenciar el n?mero de documento';
//          MessageDlg('Debe diligenciar el n?mero de documento',mtError,[mbcancel],0);
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

        if MessageDlg('Seguro de Realizar la Operaci?n',mtConfirmation,[mbyes,mbno],0) = mrno then
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
           MessageDlg('El Valor Distribuido no corresponde al valor de la Captaci?n',mtError,[mbcancel],0);
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
        if TGeneral = 0 then
        begin
           MessageDlg('No se registrara la salida, no ha digitado valores',mtInformation,[mbok],0);
           EdMonedasCer.SetFocus;
           Exit;
        end;

        if TGeneral <> Saldo then
        begin
           MessageDlg('El Valor Distribuido no corresponde al valor de la Captaci?n',mtError,[mbcancel],0);
           EdMonedasCer.SetFocus;
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
begin
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimiento" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_TIPO_CAPTACION,');
              IBOtros.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:ORIGEN_MOVIMIENTO,:ID_TIPO_MOVIMIENTO,');
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES)');
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
              IBOtros.ParamByName('CHEQUES').AsCurrency := 0;
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
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;              
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCer.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to Length(LDenominacionCer) - 1 do
               begin
                    if LDenominacionCer[I].Cantidad.Value  > 0 then
                    begin
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionCer[I].IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionCer[I].Cantidad.Value;
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

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionCer[I].IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionCer[I].Cantidad.Value;
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
              IBOtros.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
              IBOtros.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
              IBOtros.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := OrigenM;              
              IBOtros.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdDocumentoCer.Text;
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
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;

// Fin Devolucion Arqueo
}

//Actualizar Estado de la Captaci?n

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
                    MessageDlg('No se pudo actualizar la Captaci?n',mtError,[mbcancel],0);
                    Result:=False;
                    Exit;
                  end
                except
                    MessageDlg('No se pudo actualizar la Captaci?n',mtError,[mbcancel],0);
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
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES)');
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
//Actualizar Estado de la Captaci?n

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
                    MessageDlg('No se pudo actualizar la Captaci?n',mtError,[mbcancel],0);
                    Result:=False;
                    Exit;
                  end
                except
                    MessageDlg('No se pudo actualizar la Captaci?n',mtError,[mbcancel],0);
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
          MessageDlg('Debe diligenciar el n?mero de documento',mtError,[mbcancel],0);
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
        if (EdDevolucionCap.Value > 0) and
           (CapOperacion = 'C') then
           CmdVerDevolucion.Click;
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
  EdInteresCobrado.Text := '';
  EdInteresDevuelto.Text := '';
  EdAbonoInteresCausado.Text := '';
  EdAbonoInterescorriente.Text := '';
  EdAbonoInteresAnticipado.Text := '';
  EdAbonoInteresMora.Text := '';

  EdDiasAplicadosCausado.Text := '';
  EdDiasAplicadosCorriente.Text := '';
  EdDiasAplicadosAnticipado.Text := '';
  EdDiasAplicadosMora.Text := '';

  EdTasaAplicadaCausado.Text := '';
  EdTasaAplicadaCorriente.Text := '';
  EdTasaAplicadaAnticipado.Text := '';
  EdTasaAplicadaMora.Text := '';

  vInteresCobrado:=0;
  vInteresDevuelto:=0;
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
            MessageDlg('Debe diligenciar la relaci?n de cheques',mtError,[mbcancel],0);
            CmdVerChequesGen.Click;
          end;

        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara la consignaci?n',mtInformation,[mbok],0);
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
{       if TGeneral > TTotalEnCaja then
         begin
            MessageDlg('No Tiene Disponibilidad para esta salida' + #13 +
                       'Verifique los valores',mtError,[mbcancel],0);
            EdChequesGen.SetFocus;
            Exit;
         end;
}
        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara ninguna salida',mtInformation,[mbok],0);
           EdChequesGen.SetFocus;
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
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES)');
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
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
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
              IBOtros.SQL.Add(':DOCUMENTO,:CHEQUES_MOVIMIENTO,:BILLETES,:MONEDAS,:CHEQUES)');
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
            MessageDlg('Debe diligenciar la relaci?n de cheques',mtError,[mbcancel],0);
            CmdVerChequesOtr.Click;
          end;

        if TGeneral <= 0 then
        begin
           MessageDlg('No se registrara la consignaci?n',mtInformation,[mbok],0);
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
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
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
        if MessageDlg('Seguro de Realizar la Operaci?n',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

        CmdOkOtros.Enabled := False;
        RealizarOtrEntrada;

end;

procedure TfrmOperacionesCaja.CmdOKGeneralesClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Realizar la Operaci?n',mtConfirmation,[mbyes,mbno],0) = mrno then
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
                SQL.Add('"col$tasavariables".DESCRIPCION_TASA,');
                SQL.Add('"col$tasavariables".VALOR_ACTUAL_TASA,');
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
                SQL.Add('LEFT OUTER JOIN "col$tasavariables" ON ("col$colocacion".ID_INTERES = "col$tasavariables".ID_INTERES) ');
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
                         (FieldByName('ES_CANCELADO').AsInteger <> 0 ) then
                      begin
                          MessageDlg('Esta Colocaci?n no se puede Liquidar',mtError,[mbOK],0);
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
                      EdValorColocacion.Caption := FormatCurr('#,#0',FieldByName('VALOR_DESEMBOLSO').AsCurrency);
                      EdSaldoColocacion.Caption := FormatCurr('#,#0',Saldo);
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
                      IBQuery1.Close;
                      IBquery.Close;
                      CmdLiquidar.Enabled := True;
                      GBInfoCol.Enabled := True;
                      EdCuotas.SetFocus;
                end
                else
                begin
                      MessageDlg('N?mero de Colocaci?n No Existe',mtError,[mbOK],0);
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
            EdNumeroIdentificacionManual.Enabled := True;
            EdNombre.Enabled := True;
            EdNombreManual.Enabled := True;
            EdNoComprobante.Enabled := True;
            EdNoComprobanteManual.Enabled := True;
            EdNumeroColocacion.Text := '';
            EdNumeroColocacionManual.Text := '';
            EdNumeroIdentificacion.Caption := '';
            EdNumeroIdentificacionManual.Caption := '';
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
            EdNocomprobante.Text := '';
            EdNoComprobanteManual.Text := '';
            dmColocacion.IBDSagencias.Open;
            dmColocacion.IBDSagencias.Last;
            dmColocacion.IBDSagencias.First;
            EdAgencia.KeyValue := Agencia;
            EdAgenciaManual.KeyValue := Agencia;
            CmdBuscar.Enabled := True;
            EdCapital.Caption:= '';
            EsCapital.Checked := False;
            EsIntereses.Checked := False;
            EdIntereses.Caption := '';
            EdDIntereses.Caption := '';
            EdDevuelto.Caption := '';
            EdDDevuelto.Caption := '';
            EdNuevoSaldo.Caption := '';
            EdTotal.Caption := '';
            EdTotal1.Caption := '';
            if CapOperacion = 'A' then
               EdNumeroColocacion.SetFocus
            else
               EdNumeroColocacionManual.SetFocus;

            dmColocacion.IBDStipocuota.Active := true;
            dmColocacion.IBDStipocuota.Last;
            dmColocacion.IBDStipocuota.First;

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
     SQL.Add('"col$tasavariables".VALOR_ACTUAL_TASA,');
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
     SQL.Add('LEFT OUTER JOIN "col$tasavariables" ON ("col$colocacion".ID_INTERES = "col$tasavariables".ID_INTERES) ');
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

  if TipoCuota = 1 then
   LiquidarCuotasFija(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),StrToDate(EdFecha.Caption),
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if TipoCuota = 2 then
   LiquidarCuotasVarAnticipada(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),StrToDate(EdFecha.Caption),
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if TipoCuota = 3 then
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
        EdNoComprobante.SetFocus;
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

      if vNoComprobante = '' then
       begin
        MessageDlg('El N?mero de Comprobante no puede estar en blanco',mtError,[mbOK],0);
        EdNoComprobante.SetFocus;
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
               CValidar.Documento := StrToInt(EdNoComprobante.Text);
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
begin
    abono_capital := 0;
    abono_cxc := 0;
    abono_servicios := 0;
    abono_mora := 0;
    abono_anticipado := 0;
    Cuota_anterior := 0;
    cambio := false;


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
             ExecSql;
             Close;
          end;

          sql.Clear;
          sql.Add('update "col$colocacion" set ');
          sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
          sql.Add('"col$colocacion"."FECHA_CAPITAL" =:"FECHA_CAPITAL",');
          sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
          sql.Add(' where ');
          sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ParamByName('ABONOS_CAPITAL').AsCurrency := Capital;
          ParamByName('FECHA_CAPITAL').AsDate := CapitalHasta;
          ParamByName('FECHA_INTERES').AsDate := InteresesHasta;
          ExecSql;
          Close;
        except
          Result := False;
          Transaction.RollbackRetaining;
          MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
          Exit;
        end;

        VerificarCancelacionCredito(Agencia,Colocacion);
//Grabar Movimiento
              EnBilletes := TBilletes;
              EnMonedas := TMonedas;
              if EnBilletes < 0 then EnBilletes := 0;
              if EnMonedas < 0 then EnMonedas := 0;


              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientocol" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_COLOCACION,');
              IBOtros.SQL.Add(':DOCUMENTO,:CAPITAL,:INTERESES,:DEVOLUCION,:OTROS,:BILLETES,:MONEDAS)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdNoComprobante.Text;
              IBOtros.ParamByName('CAPITAL').AsCurrency := Capital;
              IBOtros.ParamByName('INTERESES').AsCurrency := Causado+Corriente+Anticipado+Vencido;
              IBOtros.ParamByName('DEVOLUCION').AsCurrency := Devuelto;
              IBOtros.ParamByName('OTROS').AsCurrency := 0;
              IBOtros.ParamByName('BILLETES').AsCurrency := EnBilletes;
              IBOtros.ParamByName('MONEDAS').AsCurrency := EnMonedas;
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
              IBOtros.SQL.Add('insert into "caj$movimientocolarqueo" values (');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_COLOCACION,');
              IBOtros.SQL.Add(':DOCUMENTO,');
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
              IBOtros.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdNoComprobante.Text;
              IBOtros.ParamByName('VALOR_DENOMINACION').AsCurrency := 0;

              IBOtros1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros1.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);


              for I := 0 to Length(LDenominacionCol) - 1 do
               begin
                    if LDenominacionCol[I].Cantidad.Value  > 0 then
                    begin
                     IBOtros.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionCol[I].IdDenominacion;
                     IBOtros.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionCol[I].Cantidad.Value;
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

                     IBOtros1.ParamByName('ID_DENOMINACION').AsInteger := LDenominacionCol[I].IdDenominacion;
                     IBOtros1.ParamByName('CANTIDAD_DENOMINACION').AsInteger := LDenominacionCol[I].Cantidad.Value;
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
              IBOtros.SQL.Add('insert into "caj$devolucioncolarqueo" values (');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_COLOCACION,');
              IBOtros.SQL.Add(':DOCUMENTO,');
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
              IBOtros.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdNoComprobante.Text;
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
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                         end;
                     except
                          IBOtros.Transaction.RollbackRetaining;
                          MessageDlg('Error actualizando arqueo de caja devoluci?n',mtError,[mbcancel],0);
                          Result := False;
                          Exit;
                     end;
               end;

// Fin Devolucion Arqueo
}        

        IBQuery.Transaction.CommitRetaining;
        Result := True;


end;

procedure TfrmOperacionesCaja.GrabarExtractoCol;
begin
        with IBQuery1 do
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
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vNoComprobante);
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := StrToDate(EdFecha.Caption);
          ParamByName('HORA_EXTRACTO').AsDateTime := StrToTime(EdHora.Caption);
          ParamByName('CUOTA_EXTRACTO').AsInteger := Cuota_anterior;
          ParamByName('TIPO_OPERACION').AsInteger := vTipoOperacion;
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
          ParamByName('INTERES_PAGO_HASTA').AsDate := InteresesHasta;
          ParamByName('CAPITAL_PAGO_HASTA').AsDate := CapitalHasta;
          ParamByName('TIPO_ABONO').AsBoolean := False;
          ExecSQL;
          Close;
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
          sql.Clear;
          sql.Add('update "col$tablaliquidacion" set');
          sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
          sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
          sql.Add(' where ');
          sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
          sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('CUOTA_NUMERO').AsInteger := Cuota_anterior;
          ParamByName('PAGADA').AsInteger := 1;
          ParamByName('FECHA_PAGADA').AsDate := StrToDate(EdFecha.Caption);
          ExecSQL;
          Close;
         end;
end;

procedure TfrmOperacionesCaja.EdNoComprobanteKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmOperacionesCaja.EdNoComprobanteExit(Sender: TObject);
var
comprobante : string;
begin
        if EdNoComprobante.Text = '' then
        begin
           vNoComprobante := '';
           MessageDlg('Debe digitar un n?mero de comprobante',mtInformation,[mbcancel],0);
        end
        else
         begin
           comprobante := trim(EdNoComprobante.Text);
           vNoComprobante := formatcurr('0000000',strtoint(comprobante));
           EdNoComprobante.Text := vNoComprobante;
         end;

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
        TMonedas := EdMonedasCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

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

        if MessageDlg('Seguro de Realizar la Operaci?n',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

        CmdOKColocacion.Enabled := False;
        RealizarAbono;
end;

procedure TfrmOperacionesCaja.EdTotalBilletesCapChange(Sender: TObject);
begin
        TBilletes := EdTotalBilletesCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

end;

procedure TfrmOperacionesCaja.EdTotalBilletesCapExit(Sender: TObject);
begin
        TBilletes := EdTotalBilletesCap.Value;
        TGeneral := TBilletes + TMonedas + TCheques;

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
          MessageDlg('Debe diligenciar el n?mero de documento',mtError,[mbcancel],0);

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

           SQL.Add('LEFT JOIN CON$PUC ON (' + Tabla + '.CODIGO = CON$PUC.CODIGO and ');
           SQL.Add(Tabla + '.ID_AGENCIA = CON$PUC.ID_AGENCIA )');
           Open;

           Report.Variables.ByName['Empresa'].AsString := Empresa;
           Report.Variables.ByName['Colocacion'].AsString := Colocacion;
           Report.Variables.ByName['Hoy'].AsDateTime := Now;
           Report.Variables.ByName['ProximaCuota'].AsDateTime := ProximaCuota;
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
                SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
                SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
                SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
                SQL.Add('"gen$persona".NOMBRE,');
                SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION ');
                SQL.Add(' FROM ');
                SQL.Add('"col$colocacion" ');
                SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION) ');
                SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION) ');
                SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA) ');
                SQL.Add('LEFT OUTER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) ');
                SQL.Add(' JOIN "gen$tiposidentificacion" ON ("col$colocacion".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION) ');
                SQL.Add(' WHERE ');
                SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
                SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');

                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := vColocacion;
                Open;

                Clasificacion := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
                Garantia := FieldByName('DESCRIPCION_GARANTIA').AsString;
                Estado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                ClasificacionM := FieldByName('ID_CLASIFICACION').AsInteger;
                GarantiaM := FieldByName('ID_GARANTIA').AsInteger;
                Categoria := FieldByName('ID_CATEGORIA').AsString;
                TipoCuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
                Amortizacion := FieldByName('AMORTIZA_INTERES').AsInteger;
                AmortizaK := FieldByName('AMORTIZA_CAPITAL').AsInteger;
                FechaInteres := FieldByName('FECHA_INTERES').AsDateTime;

                if RecordCount > 0 then
                begin
                      EdTipoIdentificacionManual.Caption := FieldByName('DESCRIPCION_IDENTIFICACION').AsString ;
                      EdNumeroIdentificacionManual.Caption := FieldByName('ID_PERSONA').AsString ;
                      EdNombreManual.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      vSaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
                      EdSaldoColocacionManual.Caption := FormatCurr('#,#0',vSaldoActual);
                      vFechaCapital := FieldByname('FECHA_CAPITAL').AsDateTime;
                      vValorCuota := FieldByName('VALOR_CUOTA').AsCurrency;
                      EdFechaCapitalManual.Caption := DateToStr(vFechaCapital);
                      vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                      EdFechaInteresManual.Caption := DateToStr(vFechaInteres);
                      EdNoComprobanteManual.SetFocus;
                Close;
                end
                else
                begin
                      MessageDlg('N?mero de Colocaci?n No Existe',mtError,[mbOK],0);
                      EdNumeroColocacionManual.SetFocus;
                end;
        end;

end;

procedure TfrmOperacionesCaja.EdNoComprobanteManualExit(Sender: TObject);
var
comprobante : string;
begin
        comprobante := trim(EdNoComprobanteManual.Text);
        if comprobante = '' then
          begin
            MessageDlg('El N?mero del Comprobante no puede estar en blanco',mtError,[mbOK],0);
          end
        else
          begin
            vComprobante := formatcurr('0000000',strtoint(comprobante));
            EdNoComprobanteManual.Text := vComprobante;
          end;

end;

procedure TfrmOperacionesCaja.EsCapitalClick(Sender: TObject);
begin
        if EsCapital.Checked = True then
        begin
           GroupBox4.Visible := True;
           CmdAceptarManual.Visible := True;
           CmdAceptarManual.Enabled := True;
        end
        else
        begin
           GroupBox4.Visible := False;
           if not EsIntereses.Checked then begin
              CmdAceptarManual.Visible := True;
              CmdAceptarManual.Enabled := True;
           end;
        end;


end;

procedure TfrmOperacionesCaja.EsInteresesClick(Sender: TObject);
begin
        if EsIntereses.Checked = True then
        begin
           GroupBox6.Visible := True;
           CmdAceptarManual.Visible := True;
           CmdAceptarManual.Enabled := True;
        end
        else
        begin
           GroupBox6.Visible := False;
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
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.DevueltosClick(Sender: TObject);
begin
        if Devueltos.Checked = True then
         begin
           Label112.Visible := True;
           Label113.Visible := False;
           EdInteresDevuelto.Visible := True;
           EdInteresCobrado.Visible := False;
           Label114.Visible := True;
           EdFechaInicialDevuelto.Visible := True;
           EdFechaInicialCobrado.Visible := False;
           Label115.Visible := True;
           EdFechaFinalDevuelto.Visible := True;
           EdFechaFinalCobrado.Visible := False;
           EdInteresDevuelto.SetFocus;
         end;

end;

procedure TfrmOperacionesCaja.CobradosClick(Sender: TObject);
begin
        if Cobrados.Checked = True Then
         begin
           Label113.Visible := True;
           Label112.Visible := False;
           EdInteresCobrado.Visible := True;
           EdInteresDevuelto.Visible := False;
           Label114.Visible := True;
           EdFechaInicialCobrado.Visible := True;
           EdFechaInicialDevuelto.Visible := False;
           Label115.Visible := True;
           EdFechaFinalCobrado.Visible := True;
           EdFechaFinalDevuelto.Visible := False;
           EdInteresCobrado.SetFocus;
         end;

end;

procedure TfrmOperacionesCaja.EdInteresCobradoExit(Sender: TObject);
begin
          if EdInteresCobrado.Text = '' then EdInteresCobrado.Text := '0';
          vInteresCobrado := StrToCurr(EdInteresCobrado.Text);
          EdInteresCobrado.Text := FormatCurr('#,##0',vInteresCobrado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdInteresDevueltoExit(Sender: TObject);
begin
          if EdInteresDevuelto.Text = '' then EdInteresDevuelto.Text := '0';
          vInteresDevuelto := StrToCurr(EdInteresDevuelto.Text);
          EdInteresDevuelto.Text := FormatCurr('#,##0',vInteresDevuelto);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdFechaInicialCobradoExit(Sender: TObject);
begin
        vFechaInicialCobrado := EdFechaInicialCobrado.Date;

end;

procedure TfrmOperacionesCaja.EdFechaFinalCobradoExit(Sender: TObject);
begin
        vFechaFinalCobrado := EdFechaFinalCobrado.Date;

end;

procedure TfrmOperacionesCaja.EdFechaInicialDevueltoExit(Sender: TObject);
begin
        vFechaInicialDevuelto := EdFechaInicialDevuelto.Date;

end;

procedure TfrmOperacionesCaja.EdFechaFinalDevueltoExit(Sender: TObject);
begin
        vFechaFinalDevuelto := EdFechaFinalDevuelto.Date;

end;

procedure TfrmOperacionesCaja.EdAbonoInteresCausadoExit(Sender: TObject);
begin
          if EdAbonoInteresCausado.Text = '' then EdAbonoInteresCausado.Text := '0';
          vAbonoInteresCausado := StrToCurr(EdAbonoInteresCausado.Text);
          EdAbonoInteresCausado.Text := FormatCurr('#,##0',vAbonoInteresCausado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

end;

procedure TfrmOperacionesCaja.EdFechaInicialCausadoExit(Sender: TObject);
begin
        vFechaInicialCausado := EdFechaInicialCausado.Date;

end;

procedure TfrmOperacionesCaja.EdFechaFinalcausadoExit(Sender: TObject);
begin
        vFechaFinalCausado := EdFechaFinalCausado.Date;

end;

procedure TfrmOperacionesCaja.EdDiasAplicadosCausadoExit(Sender: TObject);
begin
        if EdDiasAplicadosCausado.Text = '' then EdDiasAplicadosCausado.Text := '0';
        vDiasCausado := StrToInt(EdDiasAplicadosCausado.Text);
        EdDiasAplicadosCausado.Text := FormatCurr('#0',vDiasCausado);

end;

procedure TfrmOperacionesCaja.EdTasaAplicadaCausadoExit(Sender: TObject);
begin
        if EdTasaAplicadaCausado.Text = '' then EdTasaAplicadaCausado.Text := '0.00';
        vTasaCausado := StrToFloat(EdTasaAplicadaCausado.Text);
        EdTasaAplicadaCausado.Text := FormatCurr('#0.00%',vTasaCausado);
end;

procedure TfrmOperacionesCaja.EdAbonoInterescorrienteExit(Sender: TObject);
begin
          if EdAbonoInteresCorriente.Text = '' then EdAbonoInteresCorriente.Text := '0';
          vAbonoInteresCorriente := StrToCurr(EdAbonoInteresCorriente.Text);
          EdAbonoInteresCorriente.Text := FormatCurr('#,##0',vAbonoInteresCorriente);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto;
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

end;

procedure TfrmOperacionesCaja.EdTasaAplicadaCorrienteExit(Sender: TObject);
begin
        if EdTasaAplicadaCorriente.Text = '' then EdTasaAplicadaCorriente.Text := '0.00';
        vTasaCorriente := StrToFloat(EdTasaAplicadaCorriente.Text);
        EdTasaAplicadaCorriente.Text := FormatCurr('#0.00%',vTasaCorriente);

end;

procedure TfrmOperacionesCaja.EdAbonoInteresAnticipadoExit(
  Sender: TObject);
begin
          if EdAbonoInteresAnticipado.Text = '' then EdAbonoInteresAnticipado.Text := '0';
          vAbonoInteresAnticipado := StrToCurr(EdAbonoInteresAnticipado.Text);
          EdAbonoInteresAnticipado.Text := FormatCurr('#,##0',vAbonoInteresAnticipado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto;
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

end;

procedure TfrmOperacionesCaja.EdTasaAplicadaAnticipadoExit(
  Sender: TObject);
begin
        if EdTasaAplicadaAnticipado.Text = '' then EdTasaAplicadaAnticipado.Text := '0.00';
        vTasaAnticipado := StrToFloat(EdTasaAplicadaAnticipado.Text);
        EdTasaAplicadaAnticipado.Text := FormatCurr('#0.00%',vTasaAnticipado);

end;

procedure TfrmOperacionesCaja.EdAbonoInteresMoraExit(Sender: TObject);
begin
          if EdAbonoInteresMora.Text = '' then EdAbonoInteresMora.Text := '0';
          vAbonoInteresMora := StrToCurr(EdAbonoInteresMora.Text);
          EdAbonoInteresMora.Text := FormatCurr('#,##0',vAbonoInteresMora);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto;
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

end;

procedure TfrmOperacionesCaja.EdTasaAplicadaMoraExit(Sender: TObject);
begin
        if EdTasaAplicadaMora.Text = '' then EdTasaAplicadaMora.Text := '0.00';
        vTasaMora := StrToFloat(EdTasaAplicadaMora.Text);
        EdTasaAplicadaMora.Text := FormatCurr('#0.00%',vTasaMora);

end;

procedure TfrmOperacionesCaja.CmdGenerarInformeManualClick(
  Sender: TObject);
var Tabla:string;
    I:Integer;
    frmVistaPreliminar:TfrmVistaPreliminar;
    Asociado : String;
begin
        Empleado;
        Asociado := EdNombre.Caption;

        with IBQuery do
         begin
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('"col$extractodet".ID_AGENCIA,');
           SQL.Add('"col$extractodet".FECHA_EXTRACTO,');
           SQL.Add('"col$extractodet".HORA_EXTRACTO,');
           SQL.Add('"col$extractodet".CODIGO_PUC,');
           SQL.Add('CON$PUC.NOMBRE,');
           SQL.Add('"col$extractodet".FECHA_INICIAL,');
           SQL.Add('"col$extractodet".FECHA_FINAL,');
           SQL.Add('"col$extractodet".DIAS_APLICADOS,');
           SQL.Add('"col$extractodet".TASA_LIQUIDACION,');
           SQL.Add('"col$extractodet".VALOR_DEBITO,');
           SQL.Add('"col$extractodet".VALOR_CREDITO ');
           SQL.Add('from "col$extractodet"');

           SQL.Add('LEFT JOIN CON$PUC ON ("col$extractodet".CODIGO_PUC = CON$PUC.CODIGO and ');
           SQL.Add('"col$extractodet".ID_AGENCIA = CON$PUC.ID_AGENCIA )');
           SQL.Add(' where ');
           SQL.Add('"col$extractodet".ID_AGENCIA =:"ID_AGENCIA" and ');
           SQL.Add('"col$extractodet".ID_COLOCACION =:"ID_COLOCACION" and ');
           SQL.Add('"col$extractodet".ID_CBTE_COLOCACION =:"ID_CBTE_COLOCACION" ');


           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := vColocacion;
           ParamByName('ID_CBTE_COLOCACION').AsString := trim(vComprobante);

           Open;

           ReportM.Variables.ByName['Empresa'].AsString := Empresa;
           ReportM.Variables.ByName['Colocacion'].AsString := vColocacion;
           ReportM.Variables.ByName['Hoy'].AsDateTime := Now;
           ReportM.Variables.ByName['Asociado'].AsString := Asociado;
           ReportM.Variables.ByName['NuevoSaldo'].AsDouble := vSaldoActual - vAbonoCapital;
//          if EsCapital.Checked = True then
//             Report.Variables.ByName['InteresesHasta'].AsDateTime := vFechaFInt
//           else
              ReportM.Variables.ByName['InteresesHasta'].AsDateTime := vFechaFInt;
           ReportM.Variables.ByName['CapitalHasta'].AsDateTime := vFechaCapital;
           ReportM.Variables.ByName['comprobante'].AsString := vComprobante;
           ReportM.Variables.ByName['empleado'].AsString := Nombres + ' ' + Apellidos;

           if ReportM.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := ReportM;
              frmVistaPreliminar.ShowModal;
           end;
           Close;
        end;

end;

procedure TfrmOperacionesCaja.CmdAceptarManualClick(Sender: TObject);
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

        comprobante := trim(EdNoComprobanteManual.Text);
        if comprobante = '' then
          begin
            MessageDlg('El N?mero del Comprobante no puede estar en blanco',mtError,[mbOK],0);
            EdNoComprobanteManual.SetFocus;
          end
        else
          begin
            vComprobante := formatcurr('0000000',strtoint(comprobante));
            EdNoComprobanteManual.Text := vComprobante;
          end;

        CmdAceptarManual.Enabled := False;
        Application.ProcessMessages;


        totaldebitos := 0;
        totalcreditos := 0;

        with dmColocacion.IBSQL do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from COL$CODIGOSPUCBASICOS where ID_CODIGOPUCBASICO = 1');
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
          SQL.Add('select * from COL$CODIGOSPUC where ');
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
           FechaInicial := Date;
           FechaFinal   := Date;
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
        FechaInicial := Date;
        FechaFinal := Date;
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
        CmdInforme.Enabled := True;
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
          ParamByName('FECHA_EXTRACTO').AsDate := Date;
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
begin
//        if TipoCuota = 2 then TasaLiquidacion := TasaNominalAnticipada(TasaLiquidacion,Amortizacion);
//        if (TipoCuota = 1) or (TipoCuota = 3) then TasaLiquidacion := TasaNominalVencida(TasaLiquidacion,Amortizacion);

        if DmColocacion.IBDStipocuota.Locate('ID_TIPOS_CUOTA',VarArrayOf([TipoCuota]),[loCaseInsensitive]) = True then
           vCuotaTipo := DMColocacion.IBDStipocuota.FieldByName('TIPO_CUOTA').AsString;

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
             ParamByName('ABONO_ANTICIPADO').AsCurrency := vAbonoInteresAnticipado;
          if (vInteresCobrado = 0) and (vAbonoInteresCorriente = 0)  then
             ParamByName('ABONO_SERVICIOS').AsCurrency := 0
          else
             ParamByName('ABONO_SERVICIOS').AsCurrency := vAbonoInteresCorriente;
          ParamByName('ABONO_MORA').AsCurrency := vAbonoInteresMora;
          ParamByName('ABONO_SEGURO').AsCurrency := 0;
          ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
          ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
          ParamByName('ABONO_OTROS').AsCurrency := 0;
          ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := TasaLiquidacion;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;

          if (vInteresCobrado > 0) or (vInteresDevuelto > 0) then
             ParamByName('INTERES_PAGO_HASTA').AsDate := FechaIntAnt;

          if vAbonoInteresCausado > 0 then
             ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalCausado;
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

          if EsCapital.Checked = True then
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
           end;

          if EsIntereses.Checked = True then
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
            (FechaTabla <= vFechaCapital) and
            (InteresaPagar <= vTotalInteres) then
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
            sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
            sql.Add(' where ');
            sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
            sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
            ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
            ExecSql;
            Close;
          end;

         if vCuotaTipo = 'V' then
          if (CapitalaPagar > 0) and (InteresaPagar > 0) then
           begin
             if (FechaTabla <= vFechaCapital) and (InteresaPagar <= vTotalInteres) then
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
                sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
                sql.Add(' where ');
                sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
                sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
                sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_COLOCACION').AsString := vColocacion;
                ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
                ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
                ExecSql;
                Close;
              end;
           end
          else
          if (CapitalaPagar > 0) and (FechaTabla <= vFechaCapital) then
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
             sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
             sql.Add(' where ');
             sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
             sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
             sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_COLOCACION').AsString := vColocacion;
             ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
             ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
             ExecSql;
             Close;
           end
          else
         if (InteresaPagar >= 0) and (InteresaPagar <= vTotalInteres) then
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
            sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
            sql.Add(' where ');
            sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
            sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
            sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
            ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
            ExecSql;
            Close;
          end;
         end;
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
begin
              CmdRecaudarManual.Enabled := False;
              CmdReversarManual.Enabled := False;
              CmdRecaudarManual.Visible := False;
              CmdReversarManual.Visible := False;
              Application.ProcessMessages;
              IBOtros.Close;
              IBOtros.SQL.Clear;
              IBOtros.SQL.Add('insert into "caj$movimientocol" values(');
              IBOtros.SQL.Add(':ID_CAJA,:FECHA_MOV,:ID_AGENCIA,:ID_COLOCACION,');
              IBOtros.SQL.Add(':DOCUMENTO,:CAPITAL,:INTERESES,:DEVOLUCION,:OTROS,:BILLETES,:MONEDAS)');
              IBOtros.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBOtros.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
              IBOtros.ParamByName('FECHA_MOV').AsDateTime := StrToDateTime(EdFecha.Caption + ' ' + EdHora.Caption);
              IBOtros.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacionManual.Text;
              IBOtros.ParamByName('DOCUMENTO').AsString := EdNoComprobanteManual.Text;
              IBOtros.ParamByName('CAPITAL').AsCurrency := vAbonoCapital;
              IBOtros.ParamByName('INTERESES').AsCurrency := vTotalInteres;
              IBOtros.ParamByName('DEVOLUCION').AsCurrency := Devuelto;
              IBOtros.ParamByName('OTROS').AsCurrency := 0;
              IBOtros.ParamByName('BILLETES').AsCurrency := TGeneral;
              IBOtros.ParamByName('MONEDAS').AsCurrency := 0;
              try
                IBOtros.ExecQuery;
                if IBOtros.RowsAffected < 1 then
                 begin
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Exit;
                 end;
              except
                  IBOtros.Transaction.RollbackRetaining;
                  MessageDlg('Error Registrando Movimiento en Caja',mtError,[mbcancel],0);
                  Exit;
              end;

// Grabar Cheques



//

        IBQuery.Transaction.Commit;
        Timer.Enabled := False;
           frmValidarColocacion := TfrmValidarColocacion.Create(Self);
           with frmValidarColocacion do
           begin
               CValidar.Fecha := StrToDate(EdFecha.Caption);
               CValidar.Caja := StrToInt(EdCaja.Caption);
               CValidar.Cuenta := Cuenta;
               CValidar.Documento := StrToInt(EdNoComprobanteManual.Text);
               CValidar.Colocacion := EdNumeroColocacionManual.Text;
               CValidar.Nombre := EdNombreManual.Caption;
               CValidar.Clasificacion := Clasificacion;
               CValidar.Garantia := Garantia;
               CValidar.Estado := Estado;
               CValidar.FechaInt := vFechaFInt;
               CValidar.Capital := vAbonoCapital;
               CValidar.Interes := vTotalInteres;
               CValidar.Devuelto := vInteresDevuelto;
               CValidar.Otras := 0;
               CValidar.NuevoSaldo := vSaldoActual - vAbonoCapital;
               CValidar.Efectivo := TGeneral;
               Validar := CValidar;
               ShowModal;
               Free;
           end;

           MessageDlg('Abono Realizado con Exito!',mtInformation,[mbok],0);

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
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := vFechaFinalCorriente;
           vFechaFinalAnticipado := CalculoFecha(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := vFechaFinalCorriente;
           vFechaFinalAnticipado := CalculoFecha(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := vFechaFinalCausado;
           vFechaFinalAnticipado := CalculoFecha(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := vFechaInteres;
           vFechaFinalAnticipado := CalculoFecha(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.DateTime := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.DateTime := vFechaFinalAnticipado;
         end;
end;

procedure TfrmOperacionesCaja.DiasMoras;
begin
        if EdDiasAplicadosMora.Text = '' then EdDiasAplicadosMora.Text := '0';
        vDiasMora := StrToInt(EdDiasAplicadosMora.Text);
        EdDiasAplicadosMora.Text := FormatCurr('#0',vDiasMora);
        if vAbonoInteresMora > 0 then
         if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
          begin
            vFechaInicialMora := vFechaFinalAnticipado;
            vFechaFinalMora := CalculoFecha(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado = 0) then
          begin
            vFechaInicialMora := vFechaFinalCorriente;
            vFechaFinalMora := CalculoFecha(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
          begin
            vFechaInicialMora := vFechaFinalCausado;
            vFechaFinalMora := CalculoFecha(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
         else
         if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
          begin
            vFechaInicialMora := vFechaFinalAnticipado;
            vFechaFinalMora := CalculoFecha(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
          begin
            vFechaInicialMora := vFechaFinalCorriente;
            vFechaFinalMora := CalculoFecha(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado = 0) then
          begin
            vFechaInicialMora := vFechaFinalCorriente;
            vFechaFinalMora := CalculoFecha(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end
        else
         if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
          begin
            vFechaInicialMora := vFechaInteres;
            vFechaFinalMora := CalculoFecha(vFechaInicialMora,vDiasMora);
            EdFechaInicialMora.DateTime := vFechaInicialMora;
            EdFechaFinalMora.DateTime := vFechaFinalMora;
          end;

end;

procedure TfrmOperacionesCaja.DiasCorrientes;
begin
        if EdDiasAplicadosCorriente.Text = '' then EdDiasAplicadosCorriente.Text := '0';
        vDiasCorriente := StrToInt(EdDiasAplicadosCorriente.Text);
        EdDiasAplicadosCorriente.Text := FormatCurr('#0',vDiasCorriente);
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresCorriente <> 0) then
         begin
           vFechaInicialCorriente := vFechaFinalCausado;
           vFechaFinalCorriente := CalculoFecha(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.DateTime := vFechaInicialCorriente;
           EdFechaFinalCorriente.DateTime := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresCausado = 0) and (vAbonoInteresCorriente <> 0) then
         begin
           vFechaInicialCorriente := vFechaInteres;
           vFechaFinalCorriente := CalculoFecha(vFechaInteres,vDiasCorriente);
           EdFechaInicialCorriente.DateTime := vFechaInicialCorriente;
           EdFechaFinalCorriente.DateTime := vFechaFinalCorriente;
         end;

end;

procedure TfrmOperacionesCaja.DiasCausados;
begin
        if EdDiasAplicadosCausado.Text = '' then EdDiasAplicadosCausado.Text := '0';
        vDiasCausado := StrToInt(EdDiasAplicadosCausado.Text);
        EdDiasAplicadosCausado.Text := FormatCurr('#0',vDiasCausado);
        if vAbonoInteresCausado > 0 then
         begin
           vFechaInicialCausado := vFechaInteres;
           vFechaFinalCausado := CalculoFecha(vFechaInteres,vDiasCausado);
           EdFechaInicialCausado.DateTime := vFechaInicialCausado;
           EdFechaFinalcausado.DateTime := vFechaFinalCausado;
         end;

end;

procedure TfrmOperacionesCaja.EdDiasAplicadosCausadoChange(
  Sender: TObject);
begin
        DiasCausados;
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

end.

