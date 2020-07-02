unit UnitConsultaProductos;

interface

uses
  Windows, Messages, Clipbrd, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  JvComponent,JvSplit, ExtCtrls, ComCtrls, JvComCtrls, StdCtrls,
  JvGroupBox, DBCtrls, JvStaticText, JvEdit, JvTypedEdit, JvFloatEdit,
  IBSQL, DB, IBCustomDataSet, Buttons, ImgList, Grids, DBGrids, JvDBCtrl,
  IBQuery, JvEnterTab,DateUtils, XStringGrid, JvLabel, JvBlinkingLabel,
  dbcgrids, Menus, IBDatabase, ADODB,sdXmlDocuments, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient;

type
  TfrmConsultaProductos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PanelTree: TPanel;
    splitter: TJvxSplitter;
    PanelDatos: TPanel;
    PageControl: TJvPageControl;
    Hoja1: TTabSheet;
    Hoja2: TTabSheet;
    Hoja3: TTabSheet;
    Hoja4: TTabSheet;
    Hoja5: TTabSheet;
    JvGroupBox1: TJvGroupBox;
    PageBuscar: TJvPageControl;
    Tab1: TTabSheet;
    EdNombre: TJvStaticText;
    Tab2: TTabSheet;
    Tab3: TTabSheet;
    Label1: TLabel;
    CBtiposid: TDBLookupComboBox;
    Label2: TLabel;
    EdNumeroIdentificacion: TMemo;
    Label18: TLabel;
    EdColocacion: TJvEdit;
    EdCaptacion: TJvEdit;
    Label3: TLabel;
    Label4: TLabel;
    CBTiposCaptacion: TDBLookupComboBox;
    DSTiposCaptacion: TDataSource;
    IBDSTiposCaptacion: TIBDataSet;
    IBDSTiposId: TIBDataSet;
    DSTiposId: TDataSource;
    Panel3: TPanel;
    EdTotalAportaciones: TJvStaticText;
    Label5: TLabel;
    Label6: TLabel;
    EdTotalCaptaciones: TJvStaticText;
    Label7: TLabel;
    EdTotalColocaciones: TJvStaticText;
    Label8: TLabel;
    EdTotalFianzas: TJvStaticText;
    Panel4: TPanel;
    CmdCerrar: TBitBtn;
    CmdOtro: TBitBtn;
    ImageTree: TImageList;
    IBSaldosMes: TIBQuery;
    DSSaldosMes: TDataSource;
    PageControlCaptacion: TJvPageControl;
    TabAlaVista: TTabSheet;
    Panel7: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdSaldoIAno: TJvStaticText;
    EdSaldoActual: TJvStaticText;
    EdEstadoCaptacion: TJvStaticText;
    Panel8: TPanel;
    TabContractual: TTabSheet;
    TabCertificados: TTabSheet;
    Label16: TLabel;
    PageControl1: TPageControl;
    TabAportes: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EdSaldoIAporte: TJvStaticText;
    EdSaldoAporte: TJvStaticText;
    EdEstadoAporte: TJvStaticText;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Label15: TLabel;
    EdPlanContractual: TJvStaticText;
    Label17: TLabel;
    EdProximoAbonoContractual: TJvStaticText;
    Label19: TLabel;
    EdCuotaContractual: TJvStaticText;
    Label20: TLabel;
    EdEstadoContractual: TJvStaticText;
    Panel13: TPanel;
    Panel14: TPanel;
    Label21: TLabel;
    EdFechaAperturaCaptacion: TJvStaticText;
    Label22: TLabel;
    EdFechaAperturaContractual: TJvStaticText;
    GridCertificados: TDBGrid;
    IBTablaLiquidacion: TIBQuery;
    DSTablaLiquidacion: TDataSource;
    Label23: TLabel;
    EdFechaAperturaCertificado: TJvStaticText;
    Label24: TLabel;
    EdPlazoCertificado: TJvStaticText;
    Label25: TLabel;
    EdTasaCertificado: TJvStaticText;
    Label26: TLabel;
    EdAmortizaCertificado: TJvStaticText;
    Label27: TLabel;
    EdTipoTasaCertificado: TJvStaticText;
    Label28: TLabel;
    EdFechaVencimientoCertificado: TJvStaticText;
    Label29: TLabel;
    EdFechaUltimoPagoCertificado: TJvStaticText;
    Label30: TLabel;
    EdEstadoCertificado: TJvStaticText;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    GridColocacion: TDBGrid;
    Label31: TLabel;
    EdClasificacion: TJvStaticText;
    Label32: TLabel;
    EdCategoria: TJvStaticText;
    Label33: TLabel;
    EdEvaluacion: TJvStaticText;
    Label34: TLabel;
    EdLinea: TJvStaticText;
    EdInversion: TJvStaticText;
    Label35: TLabel;
    Label36: TLabel;
    EdTipoInteres: TJvStaticText;
    Label37: TLabel;
    EdTasaE: TJvStaticText;
    EdInteresVariable: TJvStaticText;
    Label38: TLabel;
    EdPlazoColocacion: TJvStaticText;
    Label39: TLabel;
    EdAmortizaK: TJvStaticText;
    Label40: TLabel;
    EdAmortizaI: TJvStaticText;
    Label43: TLabel;
    EdProxPagoColocacion: TJvStaticText;
    Label44: TLabel;
    EdDiasMora: TJvStaticText;
    Label45: TLabel;
    EdValorDeuda: TJvStaticText;
    IBTablaLiquidacionColocacion: TIBQuery;
    DSTablaLiquidacionColocacion: TDataSource;
    Panel18: TPanel;
    Panel19: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    EdClasificacionF: TJvStaticText;
    EdCategoriaF: TJvStaticText;
    EdEvaluacionF: TJvStaticText;
    EdLineaF: TJvStaticText;
    EdInversionF: TJvStaticText;
    EdTipoInteresF: TJvStaticText;
    EdTasaEF: TJvStaticText;
    EdInteresVariableF: TJvStaticText;
    EdPlazoColocacionF: TJvStaticText;
    EdAmortizaKF: TJvStaticText;
    EdAmortizaIF: TJvStaticText;
    EdFechaCapitalF: TJvStaticText;
    EdFechaInteresF: TJvStaticText;
    EdProxPagoColocacionF: TJvStaticText;
    EdDiasMoraF: TJvStaticText;
    EdValorDeudaF: TJvStaticText;
    Panel20: TPanel;
    GridFianzas: TDBGrid;
    Label61: TLabel;
    EdDeudorF: TJvStaticText;
    DSObservaciones: TDataSource;
    EnterAsTab: TJvEnterAsTab;
    CmdActualizar1: TBitBtn;
    CmdActualizar2: TBitBtn;
    CmdActualizar3: TBitBtn;
    IBObservaciones: TIBQuery;
    IBFormas: TIBQuery;
    IBConsulta2: TIBQuery;
    IBColocaciones: TIBQuery;
    IBConsulta: TIBQuery;
    IBFianzas: TIBQuery;
    IBPersona: TIBQuery;
    IBCaptaciones: TIBQuery;
    IBConsulta1: TIBQuery;
    Hoja0: TTabSheet;
    HojaIni: TTabSheet;
    Panel21: TPanel;
    IBSQL: TIBSQL;
    GridSaldosMes: TXStringGrid;
    GridCaptaciones1: TXStringGrid;
    GridCaptaciones2: TXStringGrid;
    Label76: TLabel;
    EdSaldoIContractual: TJvStaticText;
    Label77: TLabel;
    EdSaldoAContractual: TJvStaticText;
    Label78: TLabel;
    EdValorInicial: TJvStaticText;
    IBSQL1: TIBSQL;
    IBTablaLiquidacionColocacionID_AGENCIA: TSmallintField;
    IBTablaLiquidacionColocacionID_COLOCACION: TIBStringField;
    IBTablaLiquidacionColocacionCUOTA_NUMERO: TIntegerField;
    IBTablaLiquidacionColocacionFECHA_A_PAGAR: TDateField;
    IBTablaLiquidacionColocacionCAPITAL_A_PAGAR: TIBBCDField;
    IBTablaLiquidacionColocacionINTERES_A_PAGAR: TIBBCDField;
    IBTablaLiquidacionColocacionPAGADA: TSmallintField;
    IBTablaLiquidacionColocacionFECHA_PAGADA: TDateField;
    cmdBuscar: TJvBlinkingLabel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    PanelPersona: TPanel;
    Label63: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label62: TLabel;
    Label64: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    EdEstudio: TCheckBox;
    EdTipoPersona: TJvStaticText;
    EdEstadoCivil: TJvStaticText;
    EdSexo: TJvStaticText;
    EdFechaNacimiento: TJvStaticText;
    EdLugarNacimiento: TJvStaticText;
    EdTipoAfiliacion: TJvStaticText;
    EdFechaAfiliacion: TJvStaticText;
    GroupBox4: TGroupBox;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    EdRetefuente: TCheckBox;
    EdProfesion: TJvStaticText;
    EdEmpresa: TJvStaticText;
    EdCargo: TJvStaticText;
    EdFechaIngreso: TJvStaticText;
    EdTotalActivos: TJvStaticText;
    EdTotalPasivos: TJvStaticText;
    TabSheet2: TTabSheet;
    DSPersona: TDataSource;
    DBImage1: TDBImage;
    DBImage3: TDBImage;
    IBSQL2: TIBSQL;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GridRColocaciones: TXStringGrid;
    GridRFianzas: TXStringGrid;
    Label79: TLabel;
    IBDeudaHoy: TIBSQL;
    CBOtrosTitulares: TComboBox;
    Label80: TLabel;
    EdFechaProrrogaCer: TJvStaticText;
    Label81: TLabel;
    EdFechaVProrrogaCer: TJvStaticText;
    PopMCaptaciones: TPopupMenu;
    Ir1: TMenuItem;
    N1: TMenuItem;
    ConsultadeExtracto1: TMenuItem;
    CambiosdeEstado1: TMenuItem;
    ImageCap: TImageList;
    GridRCaptaciones: TStringGrid;
    GridObservaciones: TDBGrid;
    Memo: TMemo;
    PMenu1: TPopupMenu;
    IraObservaciones1: TMenuItem;
    IBObservacionesFECHA: TDateField;
    IBObservacionesOBSERVACION: TMemoField;
    IBObservacionesSEMAFORO: TIntegerField;
    IBObservacionesID_EMPLEADO: TIBStringField;
    HojaSolicitud: TTabSheet;
    IBllenaSolicitud: TIBQuery;
    DSllenaSolicitud: TDataSource;
    IBtranSolicitud: TIBTransaction;
    Label82: TLabel;
    Label83: TLabel;
    EdFechaAperturaApo: TJvStaticText;
    PMenu2: TPopupMenu;
    IrA1: TMenuItem;
    N2: TMenuItem;
    ExtractodeColocacin1: TMenuItem;
    PMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    GroupBox5: TGroupBox;
    Label84: TLabel;
    Label85: TLabel;
    EDempleado_act: TJvStaticText;
    EDfecha_act: TJvStaticText;
    IdTCPClient1: TIdTCPClient;
    N3: TMenuItem;
    ExpandirTodo1: TMenuItem;
    ContraerTodo1: TMenuItem;
    HojaTarjetaDebito: TTabSheet;
    Label86: TLabel;
    EdTarjetaDebito: TStaticText;
    Label87: TLabel;
    EdFechaAsignacion: TStaticText;
    Label88: TLabel;
    EdFechaBloqueo: TStaticText;
    Label89: TLabel;
    EdFechaCancelacion: TStaticText;
    GroupBox6: TGroupBox;
    Label90: TLabel;
    EdCupoATM: TStaticText;
    Label91: TLabel;
    EdCupoPOS: TStaticText;
    Label92: TLabel;
    Label93: TLabel;
    EdTransaATM: TStaticText;
    EdTransaPOS: TStaticText;
    Label94: TLabel;
    EdEstado: TStaticText;
    Arbol: TJvTreeView;
    JVSolicitud: TJvStaticText;
    JvGroupBox2: TJvGroupBox;
    JVempleadoRec: TJvStaticText;
    JVfechaRec: TJvStaticText;
    JvGroupBox3: TJvGroupBox;
    JVempleadoCre: TJvStaticText;
    JVfechaCre: TJvStaticText;
    JvGroupBox4: TJvGroupBox;
    JVempleadoAna: TJvStaticText;
    JVfechaAna: TJvStaticText;
    JvGroupBox5: TJvGroupBox;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    JVestado: TJvStaticText;
    JVlinea: TJvStaticText;
    JVrespaldo: TJvStaticText;
    JVgarantia: TJvStaticText;
    JVcuota: TJvStaticText;
    JVvalor: TJvStaticText;
    JVplazo: TJvStaticText;
    JVcapital: TJvStaticText;
    Label95: TLabel;
    JVinteres: TJvStaticText;
    Mobservacion: TMemo;
    Label96: TLabel;
    JvGroupBox6: TJvGroupBox;
    JVempleadoInf: TJvStaticText;
    JVfechaInf: TJvStaticText;
    Label97: TLabel;
    EdValorCuotaF: TJvStaticText;
    Label98: TLabel;
    EdSaldoF: TJvStaticText;
    Label99: TLabel;
    EdReciprocidadF: TJvStaticText;
    Label41: TLabel;
    EdFechaCapital: TJvStaticText;
    Label42: TLabel;
    EdFechaInteres: TJvStaticText;
    Label100: TLabel;
    EdReciprocidad: TJvStaticText;
    Label101: TLabel;
    EdValorCuota: TJvStaticText;
    Label102: TLabel;
    EdSaldo: TJvStaticText;
    IBTransaction1: TIBTransaction;
    CkBancoldex: TCheckBox;
    CkBancoldexF: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure EdCaptacionKeyPress(Sender: TObject; var Key: Char);
    procedure EdColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure CmdOtroClick(Sender: TObject);
    procedure Tab1Show(Sender: TObject);
    procedure Tab2Show(Sender: TObject);
    procedure Tab3Show(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdActualizar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure CmdActualizar2Click(Sender: TObject);
    procedure EdCaptacionExit(Sender: TObject);
    procedure CmdActualizar3Click(Sender: TObject);
    procedure IBTablaLiquidacionColocacionPAGADAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure CmdCerrarClick(Sender: TObject);
    procedure ConsultadeExtracto1Click(Sender: TObject);
    procedure GridRCaptacionesSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure CambiosdeEstado1Click(Sender: TObject);
    procedure DBImage1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBImage3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridRCaptacionesDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure GridObservacionesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure IBObservacionesOBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IBObservacionesID_EMPLEADOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IBObservacionesAfterScroll(DataSet: TDataSet);
    procedure IraObservaciones1Click(Sender: TObject);
    procedure IBObservacionesSEMAFOROGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ExtractodeColocacin1Click(Sender: TObject);
    procedure GridRColocacionesSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure GridRFianzasSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure MenuItem3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ExpandirTodo1Click(Sender: TObject);
    procedure ContraerTodo1Click(Sender: TObject);
    procedure splitterMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GridRColocacionesDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure GridRFianzasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    vAno:string;
    vFechaInicial: Tdate;
    vFechaFinal: TDateTime;
    procedure AbrirIniciales;
    procedure BuscarProductos;
    procedure AgregarCaptaciones;
    procedure AgregarColocaciones;
    procedure AgregarFianzas;
    procedure AgregarObservaciones;
    procedure BuscarDatosAportes(tipo:Integer;agencia:Integer;cuenta:string);
    procedure BuscarDatosAhorro(tipo:Integer;agencia: integer; cuenta: string);
    procedure BuscarDatosAhorroC(tipo:Integer;agencia: integer; cuenta: string);
    procedure BuscarDatosColocacion(agencia: integer; cuenta: string);
    procedure BuscarDatosFianzas(agencia: integer; cuenta: string);
    procedure BuscarDatosCertificados(tipo:Integer;agencia: Integer;cuenta: string);
    procedure BuscarDatosObservaciones;
    function TotalAportaciones(Id: integer; Documento: string): Currency;
    function TotalCaptaciones(Id: integer; Documento: string): Currency;
    function TotalColocaciones(Id: Integer; Documento: String): Currency;
    function TotalFianzas(Id: Integer; Documento: String): Currency;
    procedure AgregarSolicitudes;
    procedure BuscarSolicitudes;
    procedure BuscaCredivida;
    procedure AgregarTarjetaDebito;
    procedure BuscarDatosTarjetaDebito(numero: string);
    procedure BuscarDatosSolicitud(vId_Solicitud: string;vPersona:Boolean);
    procedure AgregaCodeudor;
    { Private declarations }
  public
  id_identificacion_sol :integer;
  id_persona_sol :string;
    { Public declarations }
  end;

type
     TProductos = class
     private
     forma:Integer;
     nombre:string;
     tipo:Integer;
     numero:string;
     agencia:Integer;
     digito:Integer;
     estado:Integer;
     nivel:Integer;
end;

type
     TServicios = class
     private
     forma:Integer;
     nombre:string;
     tipo:Integer;
     numero:string;
     agencia:Integer;
     digito:Integer;
     estado:Integer;
     nivel:Integer;
end;


var
  frmConsultaProductos: TfrmConsultaProductos;

  vididentificacion:Integer;
  vidpersona:string;
  arbolinfo:TProductos;
  arbolsinfo:TServicios;
  Nodo : Array[0..10] of TTreeNode;
  NodoSe: Array[0..10] of TTreeNode;
  NodoOb: array[0..10] of TTreeNode;
  NodoSo: array[0..10] of TTreeNode;
  NodoOt: array[0..10] of TTreeNode;
  NodoAnt : Integer;
  vTotAportaciones:Currency;
  vTotCaptaciones:Currency;
  vTotColocaciones:Currency;
  vTotFianzas:Currency;

//  Hoja0
  vTipoPersona:string;
  vEstadoCivil:string;
  vSexo:string;
  vFechaNacimiento:TDate;
  vLugarNacimiento:string;
  vTipoAfiliacion:string;
  vFechaAfiliacion:TDate;
  vEducacion:Boolean;
  vProfesion:string;
  vEmpresa:string;
  vCargo:string;
  vFechaIngreso:TDate;
  vRetefuente:Boolean;
  vTotalActivos:Currency;
  vTotalPasivos:Currency;
// Hoja Aportes
  vSaldoIAporte:Currency;
  vSaldoAporte:Currency;
  vEstadoActual:string;
// Hoja Ahorro a la Vista
  vSaldoIAno:Currency;
  vSaldoActual:Currency;
  vEstadoCaptacion:string;
  vFechaApertura:TDate;
// Hoja Ahorro Contractual
  vPlanContractual:string;
  vProximoAbonoContractual:TDate;
  vCuotaContractual:Currency;
  vEstadoContractual:Currency;
  vFechaAperturaContractual:TDate;

// Hoja Certificados de Deposito

  vFechaAperturaCertificado:TDate;
  vPlazoCertificado:Integer;

  EstadoAct:Integer;
  EnLectura:Boolean;

  GridCap:Boolean;
  GridCol:Boolean;
  GridFia:Boolean;

  FilaCap:Integer;
  FilaCol:Integer;
  FilaFia:Integer;

implementation

{$R *.dfm}

uses unitdmGeneral,unitGlobales,
     unitBuscarPersona, unitGlobalesCol,
     unitDmColocacion,UnitConsultaExtractoCaptacion,UnitExtractoColocacion,
     unitObservacionesCambioEstado, UnitControlDeObservaciones, UnitExtractoCredito;

procedure TfrmConsultaProductos.FormShow(Sender: TObject);
begin
        AbrirIniciales;
end;

procedure TfrmConsultaProductos.AbrirIniciales;
var I :Integer;
begin
        if IBDSTiposId.Transaction.InTransaction then
           IBDSTiposId.Transaction.Rollback;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        IBDSTiposId.Transaction.StartTransaction;
        IBDSTiposId.Open;
        IBDSTiposCaptacion.Open;
        PageBuscar.Enabled := True;
        PageBuscar.ActivePage := Tab1;
        CmdBuscar.Enabled := True;
        PageControl.ActivePage := HojaIni;
        CBTiposCaptacion.KeyValue := -1;
        EdNombre.Caption := '';
        EdCaptacion.Text := '';
        EdColocacion.Text := '';
        EDfecha_act.Caption := '';
        EDempleado_act.Caption := '';
        Arbol.Items.Clear;
        Arbol.Enabled := False;
        Nodo[0] := Arbol.Items.Add(nil,'Productos');
        NodoSe[0] := Arbol.Items.Add(nil,'Servicios');
        NodoOb[0] := Arbol.Items.Add(nil,'Observaciones');
        NodoSo[0] := Arbol.Items.Add(nil,'Solicitudes');
        NodoOt[0] := Arbol.Items.Add(nil,'Otros');
        Nodo[0].ImageIndex := 6;
        NodoSe[0].ImageIndex := 7;
        NodoOb[0].ImageIndex := 8;
        NodoSo[0].ImageIndex := 9;
        NodoOt[0].ImageIndex := 10;
{        if id_persona_sol <> '' then
        begin
           EdNumeroIdentificacion.Text :=id_persona_sol;
           CBTiposid.KeyValue := id_identificacion_sol;
           vidpersona := id_persona_sol;
           vididentificacion := id_identificacion_sol;
           CmdActualizar1Click(Self);
        end
        else
        begin
           EdNumeroIdentificacion.Text := '';
           CBTiposid.KeyValue := -1;
           CBtiposid.SetFocus;
        end;}
        vTotAportaciones:=0;
        vTotCaptaciones:=0;
        vTotColocaciones:=0;
        vTotFianzas:=0;
        EdTotalAportaciones.Caption := '';
        EdTotalCaptaciones.Caption := '';
        EdTotalColocaciones.Caption := '';
        EdTotalFianzas.Caption := '';

//GridRCaptaciones
        with GridRCaptaciones do begin
             RowCount := 2;
             ColWidths[0] := 80;
             ColWidths[1] := 90;
             ColWidths[2] := 90;
             ColWidths[3] := 90;
             ColWidths[4] := 80;
             ColWidths[5] := 130;
             ColWidths[6] := 40;
             ColWidths[7] := 70;

             Cells[0,0] := 'Número';
             Cells[1,0] := 'Saldo Actual';
             Cells[2,0] := 'Canje';
             Cells[3,0] := 'Disponible';
             Cells[4,0] := 'Estado';
             Cells[5,0] := 'Segundo Titular';
             Cells[6,0] := 'Firmas';
             Cells[7,0] := 'Cuenta';
        end;

        GridRColocaciones.RowCount := 2;
        GridRFianzas.RowCount := 2;
//
        for I := 0 to 6 do
          GridRCaptaciones.Cells[I,1] := '';
        for I := 0 to 8 do
          GridRColocaciones.Cells[I,1] := '';
        for I := 0 to 9 do
          GridRFianzas.Cells[I,1] := '';
        if id_persona_sol <> '' then
        begin
           EdNumeroIdentificacion.Text :=id_persona_sol;
           CBTiposid.KeyValue := id_identificacion_sol;
//           vidpersona := id_persona_sol;
//           vididentificacion := id_identificacion_sol;
           CmdActualizar1Click(Self);
        end
        else
        begin
           EdNumeroIdentificacion.Text := '';
           CBTiposid.KeyValue := -1;
           CBtiposid.SetFocus;
        end;


end;

procedure TfrmConsultaProductos.EdCaptacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsultaProductos.EdColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsultaProductos.EdNumeroIdentificacionKeyPress(
  Sender: TObject; var Key: Char);
begin
//        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsultaProductos.CmdOtroClick(Sender: TObject);
begin
        AbrirIniciales;
end;

procedure TfrmConsultaProductos.Tab1Show(Sender: TObject);
begin
        CBtiposid.SetFocus;
end;

procedure TfrmConsultaProductos.Tab2Show(Sender: TObject);
begin
        CBTiposCaptacion.SetFocus;
end;

procedure TfrmConsultaProductos.Tab3Show(Sender: TObject);
begin
        EdColocacion.SetFocus;
end;

procedure TfrmConsultaProductos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Ord(Key) = VK_F2 then
                cmdBuscarClick(Sender)
        else
           EnterTabs(Key,Self);
end;

procedure TfrmConsultaProductos.CmdActualizar1Click(Sender: TObject);
begin
        PageBuscar.ActivePage := Tab1;
        vididentificacion := CBtiposid.KeyValue;
        vidpersona := EdNumeroIdentificacion.Text;
        Screen.Cursor := crHourGlass;
        buscarproductos;
        Screen.Cursor := crDefault;
end;

procedure TfrmConsultaProductos.BuscarProductos;
begin

        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;


        with IBPersona do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
            ParamByName('ID_PERSONA').AsString := vidpersona;
            Open;
            if RecordCount < 1 then
            begin
               MessageDlg('Esa Persona no Existe!',mtWarning,[mbOK],0);
               if PageBuscar.ActivePage = Tab1 then
                  EdNumeroIdentificacion.SetFocus
               else
               if PageBuscar.ActivePage = Tab2 then
                  EdCaptacion.SetFocus
               else
               if PageBuscar.ActivePage = Tab3 then
                  EdColocacion.SetFocus;
               exit;
            end;
            EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                FieldByName('NOMBRE').AsString;
        end;

        PageBuscar.Enabled := False;
        CmdBuscar.Enabled := False;
// Coloco datos de la persona
        with IBSQL do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_PERSONA from "gen$tipospersona" where ');
          SQL.Add('ID_TIPO_PERSONA = :"ID_TIPO_PERSONA"');
          ParamByName('ID_TIPO_PERSONA').AsInteger := IBPersona.FieldByName('ID_TIPO_PERSONA').AsInteger;
          ExecQuery;
          EdTipoPersona.Caption  := FieldByName('DESCRIPCION_PERSONA').AsString;
          Close;
        end;

        with IBSQL do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_ESTADO_CIVIL from "gen$tiposestadocivil" where ');
          SQL.Add('ID_TIPO_ESTADO_CIVIL = :"ID"');
          ParamByName('ID').AsInteger := IBPersona.FieldByName('ID_TIPO_ESTADO_CIVIL').AsInteger;
          ExecQuery;
          EdEstadoCivil.Caption := FieldByName('DESCRIPCION_ESTADO_CIVIL').AsString;
          Close;
        end;

        if IBPersona.FieldByName('SEXO').AsString = 'M' then
          EdSexo.Caption := 'MASCULINO'
        else
        if IBPersona.FieldByName('SEXO').AsString = 'F' Then
          EdSexo.Caption := 'FEMENINO'
        else
          EdSexo.Caption := '';

        EdFechaNacimiento.Caption := DateToStr(IBPersona.FieldByName('FECHA_NACIMIENTO').AsDateTime);
        EdLugarNacimiento.Caption := IBPersona.FieldByName('LUGAR_NACIMIENTO').AsString;
        if IBPersona.FieldByName('FECHA_ACTUALIZACION').IsNull = False then // fecha de actulizaciion
           EDfecha_act.Caption := FormatDateTime('yyyy/mm/dd',IBPersona.FieldByName('FECHA_ACTUALIZACION').AsDateTime);
        with IBSQL do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_RELACION from "gen$tiposrelacion" where ');
          SQL.Add('ID_TIPO_RELACION = :"ID"');
          ParamByName('ID').AsInteger := IBPersona.FieldByName('ID_TIPO_RELACION').AsInteger;
          ExecQuery;
          EdTipoAfiliacion.Caption := FieldByName('DESCRIPCION_RELACION').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$empleado".NOMBRE,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO');
          SQL.Add('FROM');
          SQL.Add('"gen$empleado"');
          SQL.Add('WHERE');
          SQL.Add('("gen$empleado".ID_EMPLEADO = :DBALIAS)');
          ParamByName('DBALIAS').AsString := IBPersona.FieldByName('ID_EMPLEADO').AsString;
          ExecQuery;
          EDempleado_act.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
        end;

//        EdFechaAfiliacion.Caption := DateToStr(IBPersona.FieldByName('FECHA_REGISTRO').AsDateTime);
        EdEstudio.Checked := InttoBoolean(IBPersona.FieldByName('EDUCACION').AsInteger);

        EdProfesion.Caption := IBPersona.FieldByName('PROFESION').AsString;
        EdEmpresa.Caption := IBPersona.FieldByName('EMPRESA_LABORA').AsString;
        EdCargo.Caption := IBPersona.FieldByName('CARGO_ACTUAL').AsString;
        EdFechaIngreso.Caption := DateToStr(IBPersona.FieldByName('FECHA_INGRESO_EMPRESA').AsDateTime);
        EdRetefuente.Checked := InttoBoolean(IBPersona.FieldByName('RETEFUENTE').AsInteger);
        EdTotalActivos.Caption := FormatCurr('$0,0.00',IBPersona.FieldByName('TOTAL_ACTIVOS').AsCurrency);
        EdTotalPasivos.Caption := FormatCurr('$0,0.00',IBPersona.FieldByName('TOTAL_PASIVOS').AsCurrency);

        Application.ProcessMessages;
        GridCap := False;
        GridCol := False;
        GridFia := False;

        EnLectura := True;
//Buscar Total Aportaciones
         vTotAportaciones := totalaportaciones(vididentificacion,vidpersona);
         EdTotalAportaciones.Caption := FormatCurr('$#,#0.00',vtotaportaciones);
//Buscar Total Captaciones
         vTotCaptaciones := totalcaptaciones(vididentificacion,vidpersona);
         EdTotalCaptaciones.Caption := FormatCurr('$#,#0.00',vTotCaptaciones);
//Buscar Captaciones
         vTotColocaciones := totalcolocaciones(vididentificacion,vidpersona);
         EdTotalColocaciones.Caption  := formatcurr('$#,#0',vTotColocaciones);
//Buscar Total Fianzas
         vTotFianzas := totalfianzas(vididentificacion,vidpersona);
         EdTotalFianzas.Caption  := formatcurr('$#,#0',vTotFianzas);
//
        EnLectura := False;
        
        with IBCaptaciones do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
            ParamByName('ID_PERSONA').AsString := vidpersona;
            Open;
            if RecordCount > 0 then
            begin
               AgregarCaptaciones;
               AgregarTarjetaDebito;
            end;
        end;
//Buscar Colocaciones
        Application.ProcessMessages;
        with IBColocaciones do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
            ParamByName('ID_PERSONA').AsString := vidpersona;
            Open;
            if RecordCount > 0 then
               AgregarColocaciones;
        end;
//Buscar Fianzas
        Application.ProcessMessages;
        with IBFianzas do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
            ParamByName('ID_PERSONA').AsString := vidpersona;
            Open;
            if RecordCount > 0 then
               AgregarFianzas;
        end;
//Buscar Observaciones
        Application.ProcessMessages;
        with IBObservaciones do
        begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
            ParamByName('ID_PERSONA').AsString := vidpersona;
            Open;
            if RecordCount > 0 then
               AgregarObservaciones;
        end;
        agregarsolicitudes;
        AgregaCodeudor;//agrega solicitudes posible codeudor
        if Role = 'CAPTACIONES' then // ojo cambiar la validacion de la oficina
           BuscaCredivida;
        Arbol.Enabled := True;
//        Arbol.Items[0].Selected := True;
        PageControl.ActivePage := Hoja0;
end;

procedure TfrmConsultaProductos.AgregarCaptaciones;
begin
// Cargar formas de captacion que tiene el asociado
        with IBConsulta do
        begin
           SQL.Clear;
           SQL.Add('select DISTINCT "cap$tiposforma".ID_FORMA,"cap$tiposforma".DESCRIPCION,"cap$tiposforma".APORTE,');
           SQL.Add('"cap$tiposforma".AHORRO,"cap$tiposforma".CERTIFICADO,"cap$tiposforma".PROGRAMADO ');
           SQL.Add('FROM "cap$maestrotitular" INNER JOIN "cap$tipocaptacion" ON ("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$tipocaptacion".ID_TIPO_CAPTACION) ');
           SQL.Add('INNER JOIN "cap$tiposforma" ON ("cap$tipocaptacion".ID_FORMA = "cap$tiposforma".ID_FORMA) ');
           SQL.Add('WHERE (ID_IDENTIFICACION = :"ID_IDENTIFICACION" AND ID_PERSONA = :"ID_PERSONA") ');
           ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
           ParamByName('ID_PERSONA').AsString := vidpersona;
           Open;
           Last;
           First;
           if RecordCount > 0 then
           while not IBConsulta.Eof do
           begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
                arbolinfo.nombre := FieldByName('DESCRIPCION').AsString;
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                Nodo[1] := Arbol.Items.AddChildObject(Nodo[0],FieldByName('DESCRIPCION').AsString,arbolinfo);
                Nodo[1].ImageIndex := 1;
// Cargo Tipo Captaciones x cada forma
                   IBConsulta1.Close;
                   IBConsulta1.ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
                   IBConsulta1.ParamByName('ID_PERSONA').AsString := vidpersona;
                   IBConsulta1.ParamByName('ID_FORMA').AsInteger := IBConsulta.FieldByName('ID_FORMA').AsInteger;
                   IBConsulta1.Open;
                   IBConsulta1.Last;
                   IBConsulta1.First;
                   while not IBConsulta1.Eof do
                   begin
                        arbolinfo := TProductos.Create;
                        arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
                        arbolinfo.nombre := FieldByName('DESCRIPCION').AsString;
                        arbolinfo.tipo := 0;
                        arbolinfo.numero := '';
                        arbolinfo.agencia := Agencia;
                        arbolinfo.digito := 0;
                        arbolinfo.nivel := 2;
                        Nodo[2] := Arbol.Items.AddChildObject(Nodo[1],IBConsulta1.FieldByName('DESCRIPCION').AsString,arbolinfo);
                        Nodo[2].ImageIndex := 2;
// Cargar Cada captacion según su tipo y su forma;
                        IBConsulta2.Close;
                        IBConsulta2.ParamByName('ID_FORMA').AsInteger := FieldByName('ID_FORMA').AsInteger;
                        IBConsulta2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBConsulta1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                        IBConsulta2.ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
                        IBConsulta2.ParamByName('ID_PERSONA').AsString := vidpersona;
                        IBConsulta2.Open;
                        IBConsulta2.Last;
                        IBConsulta2.First;
                        while not IBConsulta2.Eof do
                        begin
                                arbolinfo := TProductos.Create;
                                arbolinfo.forma := FieldByName('ID_FORMA').AsInteger;
                                arbolinfo.nombre := IBConsulta1.FieldByName('DESCRIPCION').AsString;
                                arbolinfo.tipo := IBConsulta1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                                arbolinfo.numero := Format('%.7d',[IBConsulta2.FieldByName('NUMERO_CUENTA').AsInteger]);
                                arbolinfo.agencia := IBConsulta2.FieldByName('ID_AGENCIA').AsInteger;
                                arbolinfo.digito := IBConsulta2.FieldByName('DIGITO_CUENTA').AsInteger;
                                arbolinfo.nivel := 3;
                                Nodo[3] := Arbol.Items.AddChildObject(Nodo[2],FormatCurr('00',arbolinfo.agencia)+ '-' + arbolinfo.numero + '-' + FormatCurr('0',arbolinfo.digito)+' '+IBConsulta2.FieldByName('ESTADO').AsString,arbolinfo);
                                Nodo[3].ImageIndex := 3;
                                IBConsulta2.Next;
                        end;
//fin Carga 2
                        IBConsulta1.Next;
                   end;
//fin Carga 1
                Next;
           end;
        end;
end;

procedure TfrmConsultaProductos.AgregarColocaciones;
var Descripcion:string;
begin
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select ID_AGENCIA,ID_COLOCACION,"col$colocacion".ID_ESTADO_COLOCACION,DESCRIPCION_ESTADO_COLOCACION from "col$colocacion" ');
             SQL.Add('LEFT JOIN "col$estado" ON "col$estado".ID_ESTADO_COLOCACION = "col$colocacion".ID_ESTADO_COLOCACION ');
             SQL.Add(' where ');
             SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA" and');
             SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION <> 4 and "col$colocacion".ID_ESTADO_COLOCACION <> 5');
             ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
             ParamByName('ID_PERSONA').AsString := vidpersona;
             Open;
             Last;
             First;
             if RecordCount > 0 then
             begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 0;
                arbolinfo.nombre := 'COLOCACIONES';
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                Nodo[1] := Arbol.Items.AddChildObject(Nodo[0],arbolinfo.nombre,arbolinfo);
                Nodo[1].ImageIndex := 1;
                while not Eof do
                begin
                        arbolinfo := TProductos.Create;
                        arbolinfo.forma := 5;
                        arbolinfo.nombre := 'COLOCACIONES';
                        arbolinfo.tipo := 0;
                        arbolinfo.numero := FieldByName('ID_COLOCACION').AsString;
                        arbolinfo.agencia := FieldByName('ID_AGENCIA').AsInteger;
                        Descripcion := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                        arbolinfo.estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                        arbolinfo.digito := 0;
                        arbolinfo.nivel := 2;
                        Nodo[2] := Arbol.Items.AddChildObject(Nodo[1],FormatCurr('00',arbolinfo.agencia) + '-' + arbolinfo.numero + ' ' + Descripcion,arbolinfo);
                        Nodo[2].ImageIndex := 4;
                        Next;
                end;
             end;
        end;
end;

procedure TfrmConsultaProductos.AgregarFianzas;
var Descripcion:string;
begin
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select "col$colgarantias".ID_AGENCIA,"col$colgarantias".ID_COLOCACION from "col$colgarantias"');
             SQL.Add('inner join "col$colocacion" on ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
             SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and "col$colgarantias".ID_PERSONA = :"ID_PERSONA" and');
             SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION <> 4 and "col$colocacion".ID_ESTADO_COLOCACION <> 5)');
             ParamByName('ID_PERSONA').Asstring := vidpersona;
             ParamByName('ID_IDENTIFICACION').Asinteger := vididentificacion;
             Open;
             Last;
             First;
             if RecordCount > 0 then
             begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 0;
                arbolinfo.nombre := 'FIANZAS';
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                Nodo[1] := Arbol.Items.AddChildObject(Nodo[0],arbolinfo.nombre,arbolinfo);
                Nodo[1].ImageIndex := 1;
                while not Eof do
                begin
                        arbolinfo := TProductos.Create;
                        arbolinfo.forma := 6;
                        arbolinfo.nombre := 'FIANZAS';
                        arbolinfo.tipo := 0;
                        arbolinfo.numero := FieldByName('ID_COLOCACION').AsString;
                        arbolinfo.agencia := FieldByName('ID_AGENCIA').AsInteger;
                        arbolinfo.digito := 0;
                        IBSQL1.Close;
                        IBSQL1.SQL.Clear;
                        IBSQL1.SQL.Add('select ID_AGENCIA,ID_COLOCACION,"col$colocacion".ID_ESTADO_COLOCACION,DESCRIPCION_ESTADO_COLOCACION from "col$colocacion" ');
                        IBSQL1.SQL.Add('LEFT JOIN "col$estado" ON "col$estado".ID_ESTADO_COLOCACION = "col$colocacion".ID_ESTADO_COLOCACION ');
                        IBSQL1.SQL.Add(' where ');
                        IBSQL1.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
                        IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                        IBSQL1.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                        IBSQL1.ExecQuery;
                        Descripcion := IBSQL1.FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                        IBSQL1.Close;
                        arbolinfo.nivel := 2;
                        Nodo[2] := Arbol.Items.AddChildObject(Nodo[1],FormatCurr('00',arbolinfo.agencia) + '-' + arbolinfo.numero + ' ' + Descripcion,arbolinfo);
                        Nodo[2].ImageIndex := 4;
                        Next;
                end;
             end;
        end;
end;

procedure TfrmConsultaProductos.AgregarObservaciones;
begin
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select FECHA,OBSERVACION,ID_EMPLEADO from "gen$observaciones" where ');
             SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA"');
             ParamByName('ID_PERSONA').Asstring := vidpersona;
             ParamByName('ID_IDENTIFICACION').Asinteger := vididentificacion;
             Open;
             Last;
             First;
             if RecordCount > 0 then
             begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 7;
                arbolinfo.nombre := 'GENERALES';
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                NodoOb[0] := Arbol.Items.AddChildObject(NodoOb[0],arbolinfo.nombre,arbolinfo);
                NodoOb[0].ImageIndex := 1;
             end;
             Close;
        end;
end;

procedure TfrmConsultaProductos.FormCreate(Sender: TObject);
begin
        vAno := IntToStr(YearOf(fFechaActual));
        vFechaInicial := EncodeDate(YearOf(Date),01,01);
        vFechaFinal := fFechaActual + StrToTime('23:59:59');
        Hoja0.TabVisible := False;
        Hoja1.TabVisible := False;
        Hoja2.TabVisible := False;
        Hoja3.TabVisible := False;
        Hoja4.TabVisible := False;
        Hoja5.TabVisible := False;
        HojaIni.TabVisible := False;
        HojaSolicitud.TabVisible := False;
        HojaTarjetaDebito.TabVisible := False;
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmConsultaProductos.CmdBuscarClick(Sender: TObject);
var frmBuscarPersona:TfrmBuscarPersona;
begin
                frmBuscarPersona := TfrmBuscarPersona.Create(self);
                if frmBuscarPersona.ShowModal = mrOk then
                begin
                   vididentificacion := frmBuscarPersona.id_identificacion;
                   vidpersona := frmBuscarPersona.id_persona;
                   EdNumeroIdentificacion.Text := vidpersona;
                   CBtiposid.KeyValue := vididentificacion;
                   PageBuscar.ActivePage := Tab1;
                   CmdActualizar1.Click;
                end;
                frmBuscarPersona.Free;
end;

procedure TfrmConsultaProductos.ArbolChange(Sender: TObject;
  Node: TTreeNode);
begin
        if Node.Data <> nil then
        begin
           case TProductos(Node.Data).forma of
               0: PageControl.ActivePage := Hoja0;
               1: begin
                     PageControl.ActivePage := Hoja1;
                     BuscarDatosAportes(TProductos(Node.Data).tipo,TProductos(Node.Data).agencia,TProductos(Node.Data).numero);
                  end;
               2..4:begin
                      PageControl.ActivePage := Hoja2;
                      TabAlaVista.TabVisible := False;
                      TabContractual.TabVisible := False;
                      TabCertificados.TabVisible := False;
                      case TProductos(Node.Data).tipo of
                        2..4: begin
                                BuscarDatosAhorro(TProductos(Node.Data).tipo,tproductos(Node.Data).agencia,TProductos(Node.Data).numero);
                                PageControlCaptacion.ActivePage := TabAlaVista;
                              end;
                        5: begin
                              BuscarDatosAhorroC(TProductos(Node.Data).tipo,tproductos(Node.Data).agencia,TProductos(Node.Data).numero);
                              PageControlCaptacion.ActivePage := TabContractual;
                           end;
                        6: begin
                             BuscarDatosCertificados(TProductos(Node.Data).tipo,tproductos(Node.Data).agencia,TProductos(Node.Data).numero);
                             PageControlCaptacion.ActivePage := TabCertificados;
                           end;
                      end;
                    end;
               5: begin
                    BuscarDatosColocacion(TProductos(Node.Data).agencia,TProductos(Node.Data).numero);
                    PageControl.ActivePage := Hoja3;
                  end;
               6: begin
                    BuscarDatosFianzas(TProductos(Node.Data).agencia,TProductos(Node.Data).numero);
                    PageControl.ActivePage := Hoja4;
                  end;
               7: begin
                    BuscarDatosObservaciones;
                    PageControl.ActivePage := Hoja5;
                  end;
               8: begin
                    BuscarDatosSolicitud(TProductos(Node.Data).numero,False);
                    PageControl.ActivePage := HojaSolicitud;
                  end;
              10: begin
                    BuscarDatosTarjetaDebito(TProductos(Node.Data).numero);
                    PageControl.ActivePage := HojaTarjetaDebito;
                  end;
              11: begin
                    BuscarDatosSolicitud(TProductos(Node.Data).numero,True);
                    PageControl.ActivePage := HojaSolicitud;
                  end;
               else
                  PageControl.ActivePage := Hoja0;
           end;
        end
        else
                  PageControl.ActivePage := Hoja0;
end;

procedure TfrmConsultaProductos.BuscarDatosAportes(tipo:Integer;agencia:Integer;cuenta:string);
var digito:string;
    tmp:Integer;
    Inicial:Currency;
    Actual:Currency;
    i:Integer;
begin
        Inicial := 0;
        Actual := 0;
        for i := 1 to 12 do
        begin
           GridSaldosMes.Cells[0,i] := Meses[i];
        end;
        digito := DigitoControl(tipo,cuenta);
        with IBSQL do
        begin
                Close;
                SQL.Clear;
                SQL.Add('select SALDO_INICIAL from "cap$maestrosaldoinicial" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                SQL.Add('and ANO = :"ANO" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ParamByName('ANO').AsString := floattostr(yearof(Date));
                ExecQuery;
                if RecordCount > 0 then
                begin
                   Inicial := FieldByName('SALDO_INICIAL').AsCurrency;
                   EdSaldoIAporte.Caption := FormatCurr('$0,0.00',FieldByName('SALDO_INICIAL').AsCurrency);
                end;
                Close;
                SQL.Clear;
                SQL.Add('select FECHA_APERTURA,ID_ESTADO from "cap$maestro" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ExecQuery;
                if RecordCount > 0 then
                   begin
                     EdFechaAperturaApo.Caption := DateToStr(FieldByName('FECHA_APERTURA').AsDate);
                     tmp := FieldByName('ID_ESTADO').AsInteger;
                     Close;
                     SQL.Clear;
                     SQL.Add('select DESCRIPCION from "cap$tiposestado" where ');
                     SQL.Add('ID_ESTADO = :"ID_ESTADO" ');
                     ParamByName('ID_ESTADO').AsInteger := tmp;
                     ExecQuery;
                     if RecordCount > 0 then
                     begin
                        EdEstadoAporte.Caption := FieldByName('DESCRIPCION').AsString;
                     end;
                     Close;
                   end;
                Close;
                SQL.Clear;
                SQL.Add('select SUM(VALOR_DEBITO - VALOR_CREDITO) AS SUMA from "cap$extracto" where ');
                SQL.Add('( ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" )');
                SQL.Add('and FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ParamByName('FECHA1').AsDate := vFechaInicial;//EncodeDate(YearOf(Date),01,01);
                ParamByName('FECHA2').AsDate := fFechaActual;//EncodeDate(YearOf(Date),12,31);
                ExecQuery;
                if RecordCount > 0 then
                   Actual := FieldByName('SUMA').AsCurrency;
                Close;
                Actual := Inicial + Actual;
                EdSaldoAporte.Caption := FormatCurr('$0,0.00',Actual);
        end;


        with IBSaldosMes do
        begin
             Close;
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
             ParamByName('ANO').AsString := IntToStr(YearOf(Date));
             Open;
             for i := 1 to 12 do
             begin
               GridSaldosMes.Cells[1,I] := FormatCurr('0,0.00',FieldByName('DEBITO').AsCurrency);
               GridSaldosMes.Cells[2,I] := FormatCurr('0,0.00',FieldByName('CREDITO').AsCurrency);
               Inicial := Inicial + FieldByName('DEBITO').AsCurrency - FieldByName('CREDITO').AsCurrency;
               GridSaldosMes.Cells[3,I] := FormatCurr('0,0.00',inicial);
               Next;
             end;
        end;



end;


procedure TfrmConsultaProductos.BuscarDatosAhorro(tipo:Integer;agencia: integer;
  cuenta: string);
var digito:string;
    tmp:Integer;
    Inicial:Currency;
    Actual:Currency;
    i:Integer;
begin
        Inicial := 0;
        Actual := 0;
        CBOtrosTitulares.Clear;        

        for i := 1 to 12 do
        begin
           GridCaptaciones1.Cells[0,i] := Meses[i];
        end;
        digito := DigitoControl(tipo,cuenta);
        with IBSQL do
        begin
                Close;
                SQL.Clear;
                SQL.Add('select SALDO_INICIAL from "cap$maestrosaldoinicial" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                SQL.Add('and ANO = :"ANO" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').Asinteger := StrToInt(digito);
                ParamByName('ANO').AsString := floattostr(yearof(Date));
                ExecQuery;
                if RecordCount > 0 then
                begin
                   Inicial := FieldByName('SALDO_INICIAL').AsCurrency;
                end
                else
                   Inicial := 0;
                EdSaldoIAno.Caption := FormatCurr('$#,#0.00',Inicial);
                Close;
                SQL.Clear;
                SQL.Add('select ID_ESTADO,FECHA_APERTURA from "cap$maestro" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ExecQuery;
                if RecordCount > 0 then
                   begin
                     tmp := FieldByName('ID_ESTADO').AsInteger;
                     EdFechaAperturaCaptacion.Caption := DateToStr(FieldByName('FECHA_APERTURA').AsDate);
                     Close;
                     SQL.Clear;
                     SQL.Add('select DESCRIPCION from "cap$tiposestado" where ');
                     SQL.Add('ID_ESTADO = :"ID_ESTADO" ');
                     ParamByName('ID_ESTADO').AsInteger := tmp;
                     ExecQuery;
                     if RecordCount > 0 then
                        EdEstadoCaptacion.Caption := FieldByName('DESCRIPCION').AsString;
                     Close;
                   end;
                Close;
                SQL.Clear;
                SQL.Add('select SUM(VALOR_DEBITO - VALOR_CREDITO) AS SUMA from "cap$extracto" where ');
                SQL.Add('( ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" )');
                SQL.Add('and FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ParamByName('FECHA1').AsDate := vFechaInicial;//EncodeDate(YearOf(Date),01,01);
                ParamByName('FECHA2').AsDate := vFechaFinal;//EncodeDate(YearOf(Date),12,31);
                ExecQuery;
                if RecordCount > 0 then
                   Actual := FieldByName('SUMA').AsCurrency;
                Close;
                Actual := Inicial + Actual;
                EdSaldoActual.Caption := FormatCurr('$0,0.00',Actual);

                Close;
                SQL.Clear;
                SQL.Add('select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "cap$maestrotitular"');
                SQL.Add('inner join "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and ');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
                SQL.Add('where "cap$maestrotitular".ID_AGENCIA = :"ID_AGENCIA" and "cap$maestrotitular".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and "cap$maestrotitular".NUMERO_CUENTA = :"NUMERO_CUENTA" and "cap$maestrotitular".DIGITO_CUENTA = :"DIGITO_CUENTA" and "cap$maestrotitular".NUMERO_TITULAR > 1');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ExecQuery;
                if RecordCount > 0 then begin
                 while not Eof do begin
                   CBOtrosTitulares.Items.Add(FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                              FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                              FieldByName('NOMBRE').AsString);
                   Next;
                 end;
                 CBOtrosTitulares.ItemIndex := 0;
                end;
        end;


        with IBSaldosMes do
        begin
             Close;
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
             parambyname('ANO').AsString := IntToStr(YearOf(Date));
             Open;
             for i := 1 to 12 do
             begin
               GridCaptaciones1.Cells[1,I] := FormatCurr('0,0.00',FieldByName('DEBITO').AsCurrency);
               GridCaptaciones1.Cells[2,I] := FormatCurr('0,0.00',FieldByName('CREDITO').AsCurrency);
               Inicial := Inicial + FieldByName('DEBITO').AsCurrency - FieldByName('CREDITO').AsCurrency;
               GridCaptaciones1.Cells[3,I] := FormatCurr('0,0.00',inicial);
               Next;
             end;
        end;
end;

procedure TfrmConsultaProductos.BuscarDatosAhorroC(tipo:Integer;agencia: integer;
  cuenta: string);
var digito:string;
    tmp,tmp1:Integer;
    Inicial:Currency;
    Actual:Currency;
    i:Integer;
begin
        Inicial := 0;
        Actual := 0;
        for i := 1 to 12 do
        begin
           GridCaptaciones2.Cells[0,i] := Meses[i];
        end;
        digito := DigitoControl(tipo,cuenta);
        with IBSQL do
        begin
                Close;
                SQL.Clear;
                SQL.Add('select SALDO_INICIAL from "cap$maestrosaldoinicial" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                SQL.Add('and ANO = :"ANO" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ParamByName('ANO').AsString := floattostr(yearof(Date));
                ExecQuery;
                if RecordCount > 0 then
                begin
                   Inicial := FieldByName('SALDO_INICIAL').AsCurrency;
                   EdSaldoIContractual.Caption := FormatCurr('$0,0.00',FieldByName('SALDO_INICIAL').AsCurrency);
                end;
                Close;
                SQL.Clear;
                SQL.Add('select CUOTA,ID_PLAN,ID_ESTADO,FECHA_APERTURA,FECHA_PROXIMO_PAGO from "cap$maestro" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ExecQuery;
                if RecordCount > 0 then
                   begin
                     tmp := FieldByName('ID_ESTADO').AsInteger;
                     tmp1 := FieldByName('ID_PLAN').AsInteger;
                     EdFechaAperturaContractual.Caption := DateToStr(FieldByname('FECHA_APERTURA').AsDate);
                     EdProximoAbonoContractual.Caption := DateToStr(FieldByName('FECHA_PROXIMO_PAGO').AsDate);
                     EdCuotaContractual.Caption := FormatCurr('$0,0.00',FieldByName('CUOTA').AsCurrency);
                     Close;
                     SQL.Clear;
                     SQL.Add('select DESCRIPCION from "cap$tiposestado" where ');
                     SQL.Add('ID_ESTADO = :"ID_ESTADO" ');
                     ParamByName('ID_ESTADO').AsInteger := tmp;
                     ExecQuery;
                     if RecordCount > 0 then
                        EdEstadoContractual.Caption := FieldByName('DESCRIPCION').AsString;
                     Close;
                     SQL.Clear;
                     SQL.Add('select DESCRIPCION from "cap$tiposplancontractual" where ');
                     SQL.Add('ID_PLAN = :"ID_PLAN" ');
                     ParamByName('ID_PLAN').AsInteger := tmp1;
                     ExecQuery;
                     if RecordCount > 0 then
                        EdPlanContractual.Caption := FieldByName('DESCRIPCION').AsString;
                     Close;
                   end;
                SQL.Clear;
                SQL.Add('select SUM(VALOR_DEBITO - VALOR_CREDITO) AS SUMA from "cap$extracto" where ');
                SQL.Add('( ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" )');
                SQL.Add('and FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ParamByName('FECHA1').AsDate := vFechaInicial;//EncodeDate(YearOf(Date),01,01);
                ParamByName('FECHA2').AsDate := vFechaFinal;//EncodeDate(YearOf(Date),12,31);
                ExecQuery;
                if RecordCount > 0 then
                   Actual := FieldByName('SUMA').AsCurrency;
                Close;
                Actual := Inicial + Actual;
                EdSaldoAContractual.Caption := FormatCurr('$0,0.00',Actual);
        end;


        with IBSaldosMes do
        begin
             Close;
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
             ParamByName('ANO').AsString := IntToStr(YearOf(Date));
             Open;
             for i := 1 to 12 do
             begin
               GridCaptaciones2.Cells[1,I] := FormatCurr('0,0.00',FieldByName('DEBITO').AsCurrency);
               GridCaptaciones2.Cells[2,I] := FormatCurr('0,0.00',FieldByName('CREDITO').AsCurrency);
               Inicial := Inicial + FieldByName('DEBITO').AsCurrency - FieldByName('CREDITO').AsCurrency;
               GridCaptaciones2.Cells[3,I] := FormatCurr('0,0.00',inicial);
               Next;
             end;
        end;
end;


procedure TfrmConsultaProductos.BuscarDatosCertificados(tipo:Integer;agencia: integer; cuenta: string);
var digito:string;
    tmp:Integer;
    Inicial:Currency;
    Actual:Currency;
    i:Integer;
begin
        digito := DigitoControl(tipo,cuenta);
        with IBSQL do
        begin
                Close;
                SQL.Clear;
                SQL.Add('select VALOR_INICIAL,PLAZO_CUENTA,TIPO_INTERES,TASA_EFECTIVA,MODALIDAD,AMORTIZACION,ID_ESTADO,FECHA_APERTURA,FECHA_ULTIMO_PAGO,FECHA_VENCIMIENTO,FECHA_PRORROGA,FECHA_VENCIMIENTO_PRORROGA from "cap$maestro" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
                ExecQuery;
                if RecordCount > 0 then
                   begin
                     Inicial := FieldByName('VALOR_INICIAL').AsCurrency;
                     EdValorInicial.Caption := FormatCurr('$0,0.00',Inicial);
                     tmp := FieldByName('ID_ESTADO').AsInteger;
                     EdFechaAperturaCertificado.Caption := DateToStr(FieldByname('FECHA_APERTURA').AsDate);
                     EdFechaVencimientoCertificado.Caption := DateToStr(FieldByName('FECHA_VENCIMIENTO').AsDate);
                     if FieldByname('FECHA_PRORROGA').AsDate > 0 Then
                        EdFechaProrrogaCer.Caption := DateToStr(FieldByname('FECHA_PRORROGA').AsDate)
                     else
                        EdFechaProrrogaCer.Caption := '';
                     if FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDate > 0 then
                        EdFechaVProrrogaCer.Caption := DateToStr(FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDate)
                     else
                        EdFechaVProrrogaCer.Caption := '';
                     if FieldByName('FECHA_ULTIMO_PAGO').AsDate > 0 then
                        EdFechaUltimoPagoCertificado.Caption := DateToStr(FieldByName('FECHA_ULTIMO_PAGO').AsDate)
                     else
                        EdFechaUltimoPagoCertificado.Caption := '';
                     EdPlazoCertificado.Caption := IntToStr(FieldByName('PLAZO_CUENTA').AsInteger);
                     EdTasaCertificado.Caption := FormatCurr('0.00%',FieldByName('TASA_EFECTIVA').AsFloat);
                     EdAmortizaCertificado.Caption := IntToStr(FieldByName('AMORTIZACION').AsInteger);
                     if FieldByName('TIPO_INTERES').AsString = 'F' then
                        EdTipoTasaCertificado.Caption := 'FIJA'
                     else
                        EdTipoTasaCertificado.Caption := 'VARIABLE';

                     Close;
                     SQL.Clear;
                     SQL.Add('select DESCRIPCION from "cap$tiposestado" where ');
                     SQL.Add('ID_ESTADO = :"ID_ESTADO" ');
                     ParamByName('ID_ESTADO').AsInteger := tmp;
                     ExecQuery;
                     if RecordCount > 0 then
                        EdEstadoCertificado.Caption := FieldByName('DESCRIPCION').AsString;
                     Close;
                   end;
        end;


        with IBTablaliquidacion do
        begin
             Close;
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(cuenta);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digito);
             Open;
        end;


end;

procedure TfrmConsultaProductos.BuscarDatosColocacion(agencia: integer;
  cuenta: string);
var tmp:Integer;
    tmp1:string;
    Fecha:TDate;
    Cuota:Integer;
    Cuotas:Integer;
    DeudaHoy:Currency;
    DiasMora:Integer;
begin
        with IBSQL do
        begin
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$colocacion" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_COLOCACION').AsString := cuenta;
                ExecQuery;
                if RecordCount > 0 then
                begin
                        if FieldByName('TIPO_INTERES').AsString = 'F' then
                        EdTipoInteres.Caption := 'FIJO'
                        else
                        begin
                          EdTipoInteres.Caption := 'VARIABLE';
                          tmp := FieldByName('ID_INTERES').AsInteger;
                          with IBSQL1 do
                          begin
                            Close;
                            SQL.Clear;
                            SQL.Add('select DESCRIPCION_TASA from "col$tasasvariables" where ');
                            SQL.Add('ID_INTERES = :"ID" ');
                            ParamByName('ID').AsInteger := tmp;
                            ExecQuery;
                            if RecordCount > 0 then
                              EdInteresVariable.Caption := FieldByName('DESCRIPCION_TASA').AsString;
                            Close;
                          end;
                        end;
                        tmp := FieldByName('ID_CLASIFICACION').AsInteger;
                        with IBSQL1 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('select DESCRIPCION_CLASIFICACION from "col$clasificacion" where ');
                          SQL.Add('ID_CLASIFICACION = :"ID"');
                          ParamByName('ID').AsInteger := tmp;
                          ExecQuery;
                          if RecordCount > 0 then
                             EdClasificacion.Caption := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
                          Close;

                          SQL.Clear;
                          SQL.Add('select * from "col$infbancoldex" where ID_COLOCACION = :ID_COLOCACION');
                          ParamByName('ID_COLOCACION').AsString := cuenta;
                          ExecQuery;
                          if RecordCount > 0 then
                            CkBancoldex.Checked := true
                          else
                            CkBancoldex.Checked := False;
                          Close;
                        end;
                        EdCategoria.Caption := FieldByName('ID_CATEGORIA').Asstring;
                        EdEvaluacion.Caption := FieldByName('ID_EVALUACION').Asstring;
                        tmp := FieldByName('ID_LINEA').AsInteger;
                        with IBSQL1 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('select DESCRIPCION_LINEA from "col$lineas" where ');
                          SQL.Add('ID_LINEA = :"ID"');
                          ParamByName('ID').AsInteger := tmp;
                          ExecQuery;
                          if RecordCount > 0 then
                             EdLinea.Caption := FieldByName('DESCRIPCION_LINEA').AsString;
                          Close;
                        end;
                        tmp := FieldByName('ID_INVERSION').AsInteger;
                        with IBSQL1 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('select DESCRIPCION_INVERSION from "col$inversion" where ');
                          SQL.Add('ID_INVERSION = :"ID"');
                          ParamByName('ID').AsInteger := tmp;
                          ExecQuery;
                          if RecordCount > 0 then
                             EdInversion.Caption := FieldByName('DESCRIPCION_INVERSION').AsString;
                          Close;
                        end;
                        EdTasaE.Caption := FormatCurr('0.00%',FieldByName('TASA_INTERES_CORRIENTE').AsFloat);
                        EdPlazoColocacion.Caption := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
                        EdAmortizaK.Caption := IntToStr(FieldByName('AMORTIZA_CAPITAL').AsInteger);
                        EdAmortizaI.Caption := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
                        EdFechaCapital.Caption := DateToStr(FieldByName('FECHA_CAPITAL').AsDate);
                        EdFechaInteres.Caption := DateToStr(FieldByName('FECHA_INTERES').AsDate);
                        EdReciprocidad.Caption := FloatToStr(FieldByName('RECIPROCIDAD').AsFloat);
                        EdValorCuota.Caption := FormatCurr('$0,0.00',FieldByName('VALOR_CUOTA').AsCurrency);
                        EdSaldo.Caption := FormatCurr('$0,0.00',FieldByName('VALOR_DESEMBOLSO').AsCurrency - FieldByName('ABONOS_CAPITAL').AsCurrency);
                        DiasMora := ObtenerDeudaHoy1(agencia,cuenta,IBDeudaHoy).Dias;
                        DeudaHoy := ObtenerDeudaHoy1(agencia,cuenta,IBDeudaHoy).Valor;
                        EdDiasMora.Caption := IntToStr(DiasMora);
                        if (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then
                           EdValorDeuda.Caption := EdSaldo.Caption
                        else
                           EdValorDeuda.Caption := FormatCurr('$0,0.00',DeudaHoy);
                end;
          Close;
        end;

        with IBSQL do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "col$tablaliquidacion" where ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and PAGADA = 0');
            SQL.Add('Order by FECHA_A_PAGAR');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := cuenta;
            ExecQuery;
            Cuotas := 0;
            if RecordCount > 0 then
            begin
             EdProxPagoColocacion.Caption := DateToStr(FieldByName('FECHA_A_PAGAR').AsDate);
             Fecha := FieldByName('FECHA_A_PAGAR').AsDate;
             while not Eof do
             begin
               if FieldByName('FECHA_A_PAGAR').AsDate < Date then
                begin
                  Cuota := FieldByName('CUOTA_NUMERO').AsInteger;
                  Cuotas := Cuotas + 1;
                end
               else
                begin
                  Break;
                end;
                Next;
             end;
            end;
            Close;
        end;

        with IBTablaLiquidacionColocacion do
        begin
           Close;
           ParamByName('ID_AGENCIA').AsInteger := agencia;
           ParamByName('ID_COLOCACION').AsString := cuenta;
           Open;
           IBTablaLiquidacionColocacionPAGADA.DisplayFormat := '#';
           IBTablaLiquidacionColocacionCAPITAL_A_PAGAR.DisplayFormat := '#,#0';
           IBTablaLiquidacionColocacionINTERES_A_PAGAR.DisplayFormat := '#,#0';
           IBTablaLiquidacionColocacionPAGADA.Alignment := taCenter;
           IBTablaLiquidacionColocacionCAPITAL_A_PAGAR.Alignment := taRightJustify;
           IBTablaLiquidacionColocacionINTERES_A_PAGAR.Alignment := taRightJustify;
           IBTablaLiquidacionColocacionCUOTA_NUMERO.Alignment := taCenter;
        end;

end;

procedure TfrmConsultaProductos.BuscarDatosFianzas(agencia: integer;
  cuenta: string);
var tmp:Integer;
    tmp1:string;
    Fecha:TDate;
    Cuota:Integer;
    Cuotas:Integer;
    vidid:Integer;
    vidpe:string;
    DeudaHoy:Currency;
    DiasMora:Integer;
begin
        with IBSQL do
        begin
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$colocacion" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_COLOCACION').AsString := cuenta;
                ExecQuery;
                if RecordCount > 0 then
                begin
                        if FieldByName('TIPO_INTERES').AsString = 'F' then
                        EdTipoInteresF.Caption := 'FIJO'
                        else
                        begin
                          EdTipoInteresF.Caption := 'VARIABLE';
                        tmp := FieldByName('ID_INTERES').AsInteger;
                        with IBSQL1 do
                        begin
                            Close;
                            SQL.Clear;
                            SQL.Add('select DESCRIPCION_TASA from "col$tasasvariables" where ');
                            SQL.Add('ID_INTERES = :"ID" ');
                            ParamByName('ID').AsInteger := tmp;
                            ExecQuery;
                            if RecordCount > 0 then
                              EdInteresVariableF.Caption := FieldByName('DESCRIPCION_TASA').AsString;
                            Close;
                          end;
                        end;
                        tmp := FieldByName('ID_CLASIFICACION').AsInteger;
                        with IBSQL1 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('select DESCRIPCION_CLASIFICACION from "col$clasificacion" where ');
                          SQL.Add('ID_CLASIFICACION = :"ID"');
                          ParamByName('ID').AsInteger := tmp;
                          ExecQuery;
                          if RecordCount > 0 then
                             EdClasificacionF.Caption := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
                          Close;
                        end;
                        EdCategoriaF.Caption := FieldByName('ID_CATEGORIA').Asstring;
                        EdEvaluacionF.Caption := FieldByName('ID_EVALUACION').Asstring;
                        tmp := FieldByName('ID_LINEA').AsInteger;
                        with IBSQL1 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('select DESCRIPCION_LINEA from "col$lineas" where ');
                          SQL.Add('ID_LINEA = :"ID"');
                          ParamByName('ID').AsInteger := tmp;
                          ExecQuery;
                          if RecordCount > 0 then
                             EdLineaF.Caption := FieldByName('DESCRIPCION_LINEA').AsString;
                          Close;
                        end;
                        tmp := FieldByName('ID_INVERSION').AsInteger;
                        with IBSQL1 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('select DESCRIPCION_INVERSION from "col$inversion" where ');
                          SQL.Add('ID_INVERSION = :"ID"');
                          ParamByName('ID').AsInteger := tmp;
                          ExecQuery;
                          if RecordCount > 0 then
                             EdInversionF.Caption := FieldByName('DESCRIPCION_INVERSION').AsString;
                          Close;

                          SQL.Clear;
                          SQL.Add('select * from "col$infbancoldex" where ID_COLOCACION = :ID_COLOCACION');
                          ParamByName('ID_COLOCACION').AsString := cuenta;
                          ExecQuery;
                          if RecordCount > 0 then
                            CkBancoldexF.Checked := true
                          else
                            CkBancoldexF.Checked := False;
                          Close;                          
                        end;
                        EdTasaEF.Caption := FormatCurr('0.00%',FieldByName('TASA_INTERES_CORRIENTE').AsFloat);
                        EdPlazoColocacionF.Caption := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
                        EdAmortizaKF.Caption := IntToStr(FieldByName('AMORTIZA_CAPITAL').AsInteger);
                        EdAmortizaIF.Caption := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
                        EdFechaCapitalF.Caption := DateToStr(FieldByName('FECHA_CAPITAL').AsDate);
                        EdFechaInteresF.Caption := DateToStr(FieldByName('FECHA_INTERES').AsDate);
                        EdReciprocidadF.Caption := FloatToStr(FieldByName('RECIPROCIDAD').AsFloat);
                        EdValorCuotaF.Caption := FormatCurr('$0,0.00',FieldByName('VALOR_CUOTA').AsCurrency);
                        EdSaldoF.Caption := FormatCurr('$0,0.00',FieldByName('VALOR_DESEMBOLSO').AsCurrency - FieldByName('ABONOS_CAPITAL').AsCurrency);
                        DiasMora := ObtenerDeudaHoy1(agencia,cuenta,IBDeudaHoy).Dias;
                        DeudaHoy := ObtenerDeudaHoy1(agencia,cuenta,IBDeudaHoy).Valor;
                        EdDiasMoraf.Caption := IntToStr(DiasMora);
                        if (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then
                           EdValorDeudaf.Caption := EdSaldof.Caption
                        else
                           EdValorDeudaf.Caption := FormatCurr('$0,0.00',DeudaHoy);

                        vidid := FieldByName('ID_IDENTIFICACION').AsInteger;
                        vidpe := FieldByName('ID_PERSONA').AsString;
                        with IBSQL1 do
                        begin
                           Close;
                           SQL.Clear;
                           SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona" ');
                           SQL.Add('where ID_IDENTIFICACION = :"ID_ID" and ID_PERSONA = :"ID_PE"');
                           ParamByName('ID_ID').AsInteger := vidid;
                           ParamByName('ID_PE').AsString := vidpe;
                           ExecQuery;
                           if RecordCount > 0 then
                           begin
                              EdDeudorF.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                   FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                   FieldByName('NOMBRE').AsString;
                           end;
                        end;
                end;
          Close;
        end;

        with IBSQL do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "col$tablaliquidacion" where ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and PAGADA = 0');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := cuenta;
            ExecQuery;
            Cuotas := 0;
            if RecordCount > 0 then
            begin
             EdProxPagoColocacionF.Caption := DateToStr(FieldByName('FECHA_A_PAGAR').AsDate);
             Fecha := FieldByName('FECHA_A_PAGAR').AsDate;
             while not Eof do
             begin
               if FieldByName('FECHA_A_PAGAR').AsDate < Date then
                begin
                  Cuota := FieldByName('CUOTA_NUMERO').AsInteger;
                  Cuotas := Cuotas + 1;
                end
               else
                begin
                  Break;
                end;
                Next;
             end;
            end;
            Close;
        end;

        with IBTablaLiquidacionColocacion do
        begin
           Close;
           ParamByName('ID_AGENCIA').AsInteger := agencia;
           ParamByName('ID_COLOCACION').AsString := cuenta;
           Open;
           IBTablaLiquidacionColocacionPAGADA.DisplayFormat := '#';
           IBTablaLiquidacionColocacionCAPITAL_A_PAGAR.DisplayFormat := '#,#0';
           IBTablaLiquidacionColocacionINTERES_A_PAGAR.DisplayFormat := '#,#0';
           IBTablaLiquidacionColocacionPAGADA.Alignment := taCenter;
           IBTablaLiquidacionColocacionCAPITAL_A_PAGAR.Alignment := taRightJustify;
           IBTablaLiquidacionColocacionINTERES_A_PAGAR.Alignment := taRightJustify;
           IBTablaLiquidacionColocacionCUOTA_NUMERO.Alignment := taCenter;
        end;

end;


procedure TfrmConsultaProductos.CmdActualizar2Click(Sender: TObject);
begin
        with IBSQL do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select ID_PERSONA,ID_IDENTIFICACION from "cap$maestrotitular" where (');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
            SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" )');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := CBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCaptacion.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(CBTiposCaptacion.KeyValue,FormatCurr('0000000',StrToFloat(EdCaptacion.Text))));
            ExecQuery;
            if RecordCount > 0 then
            begin
              CBtiposid.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdNumeroIdentificacion.Text  := FieldByName('ID_PERSONA').AsString;
              CmdActualizar1.Click;
            end
            else
            begin
              MessageDlg('Persona no encontrada',mtError,[mbOk],0);
            end;
        end;
end;

procedure TfrmConsultaProductos.EdCaptacionExit(Sender: TObject);
begin
        EdCaptacion.Text := FormatCurr('0000000',StrToFloat(EdCaptacion.Text));
end;

procedure TfrmConsultaProductos.CmdActualizar3Click(Sender: TObject);
begin
        with IBSQL do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "col$colocacion" where ');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" ');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
            ExecQuery;
            if RecordCount > 0 then
            begin
              CBtiposid.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdNumeroIdentificacion.Text  := FieldByName('ID_PERSONA').AsString;
              CmdActualizar1.Click;
            end
            else
            begin
              MessageDlg('Persona no encontrada',mtError,[mbOk],0);
            end;
        end;
end;

procedure TfrmConsultaProductos.BuscarDatosObservaciones;
begin
        with IBObservaciones do
        begin
                Close;
                ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
                ParamByName('ID_PERSONA').AsString := vidpersona;
                Open;
        end;
end;

function TfrmConsultaProductos.TotalAportaciones(Id: Integer;Documento: string): Currency;
var SaldoF,Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
    Estado:string;
begin
           EstadoAct := 0;
           SaldoF := 0;
           with IBSQL1 do begin
                Close;
                SQL.Clear;
                SQL.Add('Select "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
                SQL.Add('inner join "cap$maestro" on ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ');
                SQL.Add('("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
                SQL.Add('inner join "cap$tiposestado" on ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                SQL.Add('Where');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1');
                SQL.Add('Order by "cap$tiposestado".ORDEN,"cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestro".ID_ESTADO,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA');
                ParamByName('ID_IDENTIFICACION').AsInteger := Id;
                ParamByName('ID_PERSONA').AsString  := Documento;
                try
                 ExecQuery;
                 if RecordCount < 1 then begin
                    Result := 0;
                    Exit;
                 end; // if
                except
                   MessageDlg('Error al Buscar Total de Aportes',mtError,[mbok],0);
                   Exit;
                end; // try

               while not Eof do begin
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('Select "cap$maestro".ID_ESTADO, "cap$maestro".FECHA_APERTURA, "cap$tiposestado".DESCRIPCION, "cap$maestro".FECHA_SALDADA from "cap$maestro"');
                IBSQL2.SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                IBSQL2.SQL.Add('Where');
                IBSQL2.SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                IBSQL2.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL2.SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                   Saldo := 0
                  else
                  Estado := IBSQL2.FieldByName('DESCRIPCION').AsString + ' ' + IBSQL2.FieldByName('FECHA_SALDADA').AsString;
                  EstadoAct := IBSQL2.FieldByName('ID_ESTADO').AsInteger;
                  if EstadoAct = 1 then
                     EdFechaAfiliacion.Caption := DateToStr(IBSQL2.FieldByName('FECHA_APERTURA').AsDate);
                except
                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   Result := 0;
                   Exit;
                end;
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select * from SALDOS_VIGENTES(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Ag;
                IBSQL2.ParamByName('TP').AsInteger := Tipo;
                IBSQL2.ParamByName('CTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DGT').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := vAno;
                IBSQL2.ParamByName('FECHA1').AsDate := vFechaInicial;//EncodeDate(YearOf(fFechaActual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := vFechaFinal;//fFechaActual;
                try
                 IBSQL2.ExecQuery;
                 if IBSQL2.RecordCount > 0 then
                 begin
                   Saldo := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                   Disponible := IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency;
                   Canje := IBSQL2.FieldByName('SALDO_EN_CANJE').AsCurrency;
                 end
                 else
                 begin
                   Saldo      := 0;
                   Disponible := 0;
                   Canje      := 0;
                 end;
                except
                   MessageDlg('Error Consultando Saldo',mtError,[mbcancel],0);
                   Saldo := 0;
                end;
{
// Buscar Saldo
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select SALDO_ACTUAL as SALDO from SALDO_ACTUAL_MES(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)'); // cambio agencias
                //IBSQL2.SQL.Add('select SALDO_ACTUAL as SALDO from SALDO_ACTUAL(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Ag;
                IBSQL2.ParamByName('TP').AsInteger := Tipo;
                IBSQL2.ParamByName('CTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DGT').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := fFechaActual;
                try
                 IBSQL2.ExecQuery;
                 if IBSQL2.RecordCount > 0 then
                   Saldo := IBSQL2.FieldByName('SALDO').AsCurrency
                 else
                   Saldo := 0;
                except
                   MessageDlg('Error Consultando Saldo',mtError,[mbcancel],0);
                   Saldo := 0;
                end;

// Buscar Disponible
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                //IBSQL2.SQL.Add('select SALDO_DISPONIBLE as SALDO from SALDO_DISPONIBLE_MES(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)'); CAMBIO AGENCIAS
                IBSQL2.SQL.Add('select SALDO_DISPONIBLE as SALDO from SALDO_DISPONIBLE(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Ag;
                IBSQL2.ParamByName('TP').AsInteger := Tipo;
                IBSQL2.ParamByName('CTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DGT').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := fFechaActual;
                try
                 IBSQL2.ExecQuery;
                 if IBSQL2.RecordCount > 0 then
                   Disponible := IBSQL2.FieldByName('SALDO').AsCurrency
                 else
                   Disponible := 0;
                except
                   MessageDlg('Error Consultando Disponible',mtError,[mbcancel],0);
                   Disponible := 0;
                end;

// Buscar Canje

                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('SELECT SUM("cap$canje".VALOR_CHEQUE + "cap$canje".VALOR_MONEDAS) AS CANJE');
                IBSQL2.SQL.Add('FROM');
                IBSQL2.SQL.Add('"cap$maestro"');
                IBSQL2.SQL.Add('LEFT JOIN "cap$canje" ON ("cap$maestro".ID_AGENCIA = "cap$canje".ID_AGENCIA) AND ');
                IBSQL2.SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$canje".ID_TIPO_CAPTACION) AND ("cap$maestro".NUMERO_CUENTA = "cap$canje".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$canje".DIGITO_CUENTA)');
                IBSQL2.SQL.Add('Where');
                IBSQL2.SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                IBSQL2.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL2.SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                IBSQL2.SQL.Add('"cap$canje".LIBERADO = 0 and');
                IBSQL2.SQL.Add('"cap$canje".DEVUELTO = 0');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                 IBSQL2.ExecQuery;
                 if RecordCount < 1 then
                   Canje := 0
                 else
                   Canje := IBSQL2.FieldByName('CANJE').AsCurrency;
                except
                   MessageDlg('Error Consultando Canje',mtError,[mbcancel],0);
                   Canje := 0;
                end;
}
             SaldoF := SaldoF + Saldo;
             if not GridCap then
                GridCap := True
             else
                GridRCaptaciones.RowCount := GridRCaptaciones.RowCount + 1;

//             Disponible := Saldo - Canje;
             GridRCaptaciones.Cells[0,GridRCaptaciones.RowCount-1] := Format('%d%.2d-%.7d-%d',[Tipo,Ag,Cuenta,Digito]);
             GridRCaptaciones.Cells[1,GridRCaptaciones.RowCount-1] := FormatCurr('$#,0.00',Saldo);
             GridRCaptaciones.Cells[2,GridRCaptaciones.RowCount-1] := FormatCurr('$#,0.00',Canje);
             GridRCaptaciones.Cells[3,GridRCaptaciones.RowCount-1] := FormatCurr('$#,0.00',Disponible);
             GridRCaptaciones.Cells[4,GridRCaptaciones.RowCount-1] := Estado;
             Next;
             end;
         end;
         Application.ProcessMessages;
         Result := SaldoF;
end;

function TfrmConsultaProductos.TotalCaptaciones(Id: integer;
  Documento: string): Currency;
var SaldoF,Saldo,Movimiento,Canje,Disponible,ValorI:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
    Estado:string;
    Se_Suma,Firmas:Integer;
    TipoAb,CuentaAb:Integer;
begin
           EstadoAct := 0;
           SaldoF := 0;
           with IBSQL1 do begin
                Close;
                SQL.Clear;
                SQL.Add('Select "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
                SQL.Add('inner join "cap$maestro" on ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ');
                SQL.Add('("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
                SQL.Add('inner join "cap$tiposestado" on ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                SQL.Add('Where');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION > 1');
                SQL.Add('Order by "cap$tiposestado".ORDEN, "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestro".ID_ESTADO, "cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA');
                ParamByName('ID_IDENTIFICACION').AsInteger := Id;
                ParamByName('ID_PERSONA').AsString  := Documento;
                try
                 ExecQuery;
                 if RecordCount < 1 then begin
                    Result := 0;
                    Exit;
                 end; // if
                except
                   MessageDlg('Error al Buscar Total de Aportes',mtError,[mbok],0);
                   Exit;
                end; // try

               while not Eof do begin
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('Select "cap$maestro".ID_ESTADO,"cap$maestro".VALOR_INICIAL, "cap$tiposestado".DESCRIPCION, "cap$tiposestado".SE_SUMA, "cap$maestro".FIRMAS,');
                IBSQL2.SQL.Add('"cap$maestro".FECHA_SALDADA, "cap$maestro".ID_TIPO_CAPTACION_ABONO, "cap$maestro".NUMERO_CUENTA_ABONO');
                IBSQL2.SQL.Add('from "cap$maestro"');
                IBSQL2.SQL.Add('LEFT JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                IBSQL2.SQL.Add('Where');
                IBSQL2.SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                IBSQL2.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL2.SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                   Saldo := 0
                  else
                  ValorI := IBSQL2.FieldByName('VALOR_INICIAL').AsCurrency;
                  Estado := IBSQL2.FieldByName('DESCRIPCION').AsString + ' ' + IBSQL2.FieldByName('FECHA_SALDADA').AsString;
                  Se_Suma := IBSQL2.FieldByName('SE_SUMA').AsInteger;
                  Firmas := IBSQL2.FieldByName('FIRMAS').AsInteger;
                  EstadoAct := IBSQL2.FieldByName('ID_ESTADO').AsInteger;
                  TipoAb := IBSQL2.FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                  CuentaAb := IBSQL2.FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
                except
                   MessageDlg('Error Consultando Datos Basicos',mtError,[mbcancel],0);
                   Result := 0;
                   Exit;
                end;

                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select * from SALDOS_VIGENTES(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Ag;
                IBSQL2.ParamByName('TP').AsInteger := Tipo;
                IBSQL2.ParamByName('CTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DGT').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := vAno;
                IBSQL2.ParamByName('FECHA1').AsDate := vFechaInicial;//EncodeDate(YearOf(fFechaActual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := vFechaFinal;//fFechaActual;
                try
                 IBSQL2.ExecQuery;
                 if IBSQL2.RecordCount > 0 then
                 begin
                   Saldo := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                   Disponible := IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency;
                   Canje := IBSQL2.FieldByName('SALDO_EN_CANJE').AsCurrency;
                 end
                 else
                 begin
                   Saldo      := 0;
                   Disponible := 0;
                   Canje      := 0;
                 end;
                except
                   MessageDlg('Error Consultando Saldo',mtError,[mbcancel],0);
                   Saldo := 0;
                end;
{
// Buscar Saldo
              if Tipo <> 6 then
              begin
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select SALDO_ACTUAL as SALDO from SALDO_ACTUAL_MES(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)'); //cambio agencias
                //IBSQL2.SQL.Add('select SALDO_ACTUAL as SALDO from SALDO_ACTUAL(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Ag;
                IBSQL2.ParamByName('TP').AsInteger := Tipo;
                IBSQL2.ParamByName('CTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DGT').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := fFechaActual;
                try
                 IBSQL2.ExecQuery;
                 if IBSQL2.RecordCount > 0 then
                   Saldo := IBSQL2.FieldByName('SALDO').AsCurrency
                 else
                   Saldo := 0;
                except
                   MessageDlg('Error Consultando Saldo',mtError,[mbcancel],0);
                   Saldo := 0;
                end;

// Buscar Disponible
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                //IBSQL2.SQL.Add('select SALDO_DISPONIBLE as SALDO from SALDO_DISPONIBLE_MES(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)'); CAMBIO AGENCIAS
                IBSQL2.SQL.Add('select SALDO_DISPONIBLE as SALDO from SALDO_DISPONIBLE(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Ag;
                IBSQL2.ParamByName('TP').AsInteger := Tipo;
                IBSQL2.ParamByName('CTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DGT').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := fFechaActual;
                try
                 IBSQL2.ExecQuery;
                 if IBSQL2.RecordCount > 0 then
                   Disponible := IBSQL2.FieldByName('SALDO').AsCurrency
                 else
                   Disponible := 0;
                except
                   MessageDlg('Error Consultando Disponible',mtError,[mbcancel],0);
                   Disponible := 0;
                end;

//Buscar Canje
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('SELECT SUM("cap$canje".VALOR_CHEQUE + "cap$canje".VALOR_MONEDAS) AS CANJE');
                IBSQL2.SQL.Add('FROM');
                IBSQL2.SQL.Add('"cap$canje"');
                IBSQL2.SQL.Add('Where');
                IBSQL2.SQL.Add('"cap$canje".ID_AGENCIA = :ID_AGENCIA and');
                IBSQL2.SQL.Add('"cap$canje".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL2.SQL.Add('"cap$canje".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBSQL2.SQL.Add('"cap$canje".DIGITO_CUENTA = :DIGITO_CUENTA and');
                IBSQL2.SQL.Add('"cap$canje".LIBERADO = 0 and');
                IBSQL2.SQL.Add('"cap$canje".DEVUELTO = 0');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                 IBSQL2.ExecQuery;
                 if RecordCount < 1 then
                   Canje := 0
                 else
                   Canje := IBSQL2.FieldByName('CANJE').AsCurrency;
                except
                   MessageDlg('Error Consultando Canje',mtError,[mbcancel],0);
                   Canje := 0;
                end;
              end;
}
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('SELECT ');
                IBSQL2.SQL.Add('"gen$persona".NOMBRE,"gen$persona".PRIMER_APELLIDO,');
                IBSQL2.SQL.Add('"gen$persona".SEGUNDO_APELLIDO FROM "cap$maestrotitular"');
                IBSQL2.SQL.Add('INNER JOIN "gen$persona" ON ');
                IBSQL2.SQL.Add('("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
                IBSQL2.SQL.Add('AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
                IBSQL2.SQL.Add('where');
                IBSQL2.SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
                IBSQL2.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL2.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR > 1');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                 IBSQL2.ExecQuery;
                except
                   MessageDlg('Error Consultando Titulares',mtError,[mbcancel],0);
                end;

             if Tipo = 6 then Saldo := ValorI;
             if (Tipo <> 2) and (Tipo <> 4) then
             begin
                 Disponible := Saldo;
                 if (Tipo = 6) and ((EstadoAct <> 1) and (EstadoAct <> 6)) then
                  Disponible := 0;
             end;
             if Se_Suma <> 0 then
                SaldoF := SaldoF + Saldo;
             if not GridCap then
                GridCap := True
             else
                GridRCaptaciones.RowCount := GridRCaptaciones.RowCount + 1;
             GridRCaptaciones.Cells[0,GridRCaptaciones.RowCount-1] := Format('%d%.2d-%.7d-%d',[Tipo,Ag,Cuenta,Digito]);
             GridRCaptaciones.Cells[1,GridRCaptaciones.RowCount-1] := FormatCurr('$#,#0.00',Saldo);
             GridRCaptaciones.Cells[2,GridRCaptaciones.RowCount-1] := FormatCurr('$#,#0.00',Canje);
             GridRCaptaciones.Cells[3,GridRCaptaciones.RowCount-1] := FormatCurr('$#,#0.00',Disponible);
             GridRCaptaciones.Cells[4,GridRCaptaciones.RowCount-1] := Estado;
             GridRCaptaciones.Cells[5,GridRCaptaciones.RowCount-1] := IBSQL2.FieldByName('NOMBRE').AsString + ' ' + IBSQL2.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBSQL2.FieldByName('SEGUNDO_APELLIDO').AsString;
             GridRCaptaciones.Cells[6,GridRCaptaciones.RowCount-1] := InttoStr(Firmas);
             if Tipo in [5,6] then
                GridRCaptaciones.Cells[7,GridRCaptaciones.RowCount-1] := Format('%d%.2d-%.7d',[TipoAb,Ag,CuentaAb])
             else
                GridRCaptaciones.Cells[7,GridRCaptaciones.RowCount-1] := '';
           Application.ProcessMessages;
             Next;
             end;
         end;
         Application.ProcessMessages;
         Result := SaldoF;
end;


function TfrmConsultaProductos.TotalColocaciones(Id: Integer;
  Documento: String): Currency;
var Saldo:Currency;
    Deuda,Vcapital :Currency;
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select "col$colocacion".ID_COLOCACION,"col$colocacion".VALOR_DESEMBOLSO,("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION, "col$estado".DESCRIPCION_ESTADO_COLOCACION from "col$colocacion"');
          SQL.Add('inner join "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('where "col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = :ID_PERSONA and');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION <> 4 and "col$colocacion".ID_ESTADO_COLOCACION <> 5');
          SQL.Add('Order by "col$colocacion".ID_AGENCIA, "col$estado".ORDEN, "col$colocacion".ID_COLOCACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id;
          ParamByName('ID_PERSONA').AsString := Documento;
          try
            ExecQuery;
            if RecordCount > 0 then
             while not Eof do begin
               if not GridCol then
                 GridCol := True
               else
                 GridRColocaciones.RowCount := GridRColocaciones.RowCount + 1;

               EstadoAct := IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger;

               GridRColocaciones.Cells[0,GridRColocaciones.RowCount-1] := FieldByName('ID_COLOCACION').AsString;
               GridRColocaciones.Cells[1,GridRColocaciones.RowCount-1] := FormatCurr('$#,#0',FieldByName('VALOR_DESEMBOLSO').AsCurrency);
               GridRColocaciones.Cells[2,GridRColocaciones.RowCount-1] := FormatCurr('$#,#0',FieldByName('SALDO').AsCurrency);
               GridRColocaciones.Cells[3,GridRColocaciones.RowCount-1] := DateToStr(FieldByName('FECHA_INTERES').AsDate);
               GridRColocaciones.Cells[8,GridRColocaciones.RowCount-1] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
               if (obtenerdeudahoy1(Agencia,FieldByName('ID_COLOCACION').AsString,IBDeudaHoy).Dias > 0)  then
                if (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 0) then begin
                  Vcapital := 0;
                  Deuda := 0;
                  Deuda := obtenerdeudahoy1(Agencia,FieldByName('ID_COLOCACION').AsString,IBDeudaHoy).Valor;
                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('select');
                  IBSQL2.SQL.Add('"col$tablaliquidacion".CAPITAL_A_PAGAR');
                  IBSQL2.SQL.Add('from "col$tablaliquidacion"');
                  IBSQL2.SQL.Add('where');
                  IBSQL2.SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION" and');
                  IBSQL2.SQL.Add('"col$tablaliquidacion".PAGADA = 0 and');
                  IBSQL2.SQL.Add('"col$tablaliquidacion".FECHA_A_PAGAR <= :"FECHA"');
                  IBSQL2.ParamByName('FECHA').AsDate := fFechaActual;
                  IBSQL2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                  IBSQL2.ExecQuery;
                  while not IBSQL2.Eof do
                  begin
                     Vcapital :=IBSQL2.FieldByName('CAPITAL_A_PAGAR').AsCurrency;
                     IBSQL2.Next;
                  end;
                  GridRColocaciones.Cells[4,GridRColocaciones.RowCount-1] := FormatCurr('$#,#0',Vcapital);
                  GridRColocaciones.Cells[5,GridRColocaciones.RowCount-1] := FormatCurr('$#,#0',Deuda - Vcapital);
                  GridRColocaciones.Cells[7,GridRColocaciones.RowCount-1] := FormatCurr('$#,#0',Deuda);
                end
                else
                  GridRColocaciones.Cells[4,GridRColocaciones.RowCount-1] := FormatCurr('$#,#0',FieldByName('SALDO').AsCurrency);


               IBSQL2.Close;
               IBSQL2.SQL.Clear;
               IBSQL2.SQL.Add('SELECT SUM("col$costas".VALOR_COSTAS) AS VCOSTAS');
               IBSQL2.SQL.Add('FROM');
               IBSQL2.SQL.Add('"col$costas"');
               IBSQL2.SQL.Add('WHERE');
               IBSQL2.SQL.Add('("col$costas".ID_COLOCACION = :ID_COLOCACION)');
               IBSQL2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
               IBSQL2.ExecQuery;
               if IBSQL2.FieldByName('VCOSTAS').AsCurrency > 0 then
                  GridRColocaciones.Cells[6, GridRColocaciones.RowCount-1] := FormatCurr('$#,#0',IBSQL2.FieldByName('VCOSTAS').AsCurrency);
               Next;
             end;
          except
            MessageDlg('Error Buscando Colocaciones Resumen',mtError,[mbcancel],0);
            raise;
          end;
        end;
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('Select SUM(VALOR_DESEMBOLSO - ABONOS_CAPITAL) AS SUMA from "col$colocacion"');
          SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and');
          SQL.Add('ID_ESTADO_COLOCACION <> 4 and ID_ESTADO_COLOCACION <> 5');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id;
          ParamByName('ID_PERSONA').AsString := Documento;
          try
            ExecQuery;
            if RecordCount > 0 then
            Saldo := FieldByName('SUMA').AsCurrency
            else
            Saldo := 0;
          except
            MessageDlg('Error al Buscar Colocaciones',mtError,[mbok],0);
            Saldo := 0;
          end;
        end;
        Application.ProcessMessages;
        Result := Saldo;
end;

function TfrmConsultaProductos.TotalFianzas(Id: Integer;
  Documento: String): Currency;
var Saldo:Currency;
    Deuda,Vcapital :Currency;
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select "col$colocacion".ID_COLOCACION,"col$colocacion".VALOR_DESEMBOLSO,("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,"col$estado".DESCRIPCION_ESTADO_COLOCACION,"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "col$colgarantias"');
          SQL.Add('inner join "col$colocacion" ON ("col$colocacion".ID_AGENCIA = "col$colgarantias".ID_AGENCIA and ');
          SQL.Add('"col$colocacion".ID_COLOCACION = "col$colgarantias".ID_COLOCACION)');
          SQL.Add('inner join "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('left join "gen$persona" ON ( "col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA');
          SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION <> 4 and "col$colocacion".ID_ESTADO_COLOCACION <> 5');
          SQL.Add('Order by "col$colocacion".ID_AGENCIA, "col$estado".ORDEN, "col$colocacion".ID_COLOCACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id;
          ParamByName('ID_PERSONA').AsString := Documento;
          try
            ExecQuery;
            if RecordCount > 0 then
             while not Eof do begin
               if not GridFia then
                 GridFia := True
               else
                 GridRFianzas.RowCount := GridRFianzas.RowCount + 1;

               EstadoAct := IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger;

               GridRFianzas.Cells[0,GridRFianzas.RowCount-1] := FieldByName('ID_COLOCACION').AsString;
               GridRFianzas.Cells[1,GridRFianzas.RowCount-1] := FormatCurr('$#,#0',FieldByName('VALOR_DESEMBOLSO').AsCurrency);
               GridRFianzas.Cells[2,GridRFianzas.RowCount-1] := FormatCurr('$#,#0',FieldByName('SALDO').AsCurrency);
               GridRFianzas.Cells[3,GridRFianzas.RowCount-1] := DateToStr(FieldByName('FECHA_INTERES').AsDate);
               GridRFianzas.Cells[8,GridRFianzas.RowCount-1] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
               GridRFianzas.Cells[9,GridRFianzas.RowCount-1] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                                FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                                FieldByName('NOMBRE').AsString;

               if (obtenerdeudahoy1(Agencia,FieldByName('ID_COLOCACION').AsString,IBDeudaHoy).Dias > 0) then
                if (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 0) then begin
                  Vcapital := 0;
                  Deuda := 0;
                  Deuda := obtenerdeudahoy1(Agencia,FieldByName('ID_COLOCACION').AsString,IBDeudaHoy).Valor;
                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('select');
                  IBSQL2.SQL.Add('"col$tablaliquidacion".CAPITAL_A_PAGAR');
                  IBSQL2.SQL.Add('from "col$tablaliquidacion"');
                  IBSQL2.SQL.Add('where');
                  IBSQL2.SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION" and');
                  IBSQL2.SQL.Add('"col$tablaliquidacion".PAGADA = 0 and');
                  IBSQL2.SQL.Add('"col$tablaliquidacion".FECHA_A_PAGAR <= :"FECHA"');
                  IBSQL2.ParamByName('FECHA').AsDate := fFechaActual;
                  IBSQL2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                  IBSQL2.ExecQuery;
                  while not IBSQL2.Eof do
                  begin
                     Vcapital :=IBSQL2.FieldByName('CAPITAL_A_PAGAR').AsCurrency;
                     IBSQL2.Next;
                  end;
                  GridRFianzas.Cells[4,GridRFianzas.RowCount-1] := FormatCurr('$#,#0',Vcapital);
                  GridRFianzas.Cells[5,GridRFianzas.RowCount-1] := FormatCurr('$#,#0',Deuda - Vcapital);
                  GridRFianzas.Cells[7,GridRFianzas.RowCount-1] := FormatCurr('$#,#0',Deuda);
                end
                else
                  GridRFianzas.Cells[4,GridRFianzas.RowCount-1] := FormatCurr('$#,#0',FieldByName('SALDO').AsCurrency);


               IBSQL2.Close;
               IBSQL2.SQL.Clear;
               IBSQL2.SQL.Add('SELECT SUM("col$costas".VALOR_COSTAS) AS VCOSTAS');
               IBSQL2.SQL.Add('FROM');
               IBSQL2.SQL.Add('"col$costas"');
               IBSQL2.SQL.Add('WHERE');
               IBSQL2.SQL.Add('("col$costas".ID_COLOCACION = :ID_COLOCACION)');
               IBSQL2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
               IBSQL2.ExecQuery;
               if IBSQL2.FieldByName('VCOSTAS').AsCurrency > 0 then
                  GridRFianzas.Cells[6, GridRFianzas.RowCount-1] := FormatCurr('$#,#0',IBSQL2.FieldByName('VCOSTAS').AsCurrency);

               Next;
             end;
          except
            MessageDlg('Error Buscando Colocaciones Resumen',mtError,[mbcancel],0);
            raise;
          end;
        end;


        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('Select SUM(VALOR_DESEMBOLSO - ABONOS_CAPITAL) AS SUMA from "col$colocacion"');
          SQL.Add('INNER JOIN "col$colgarantias" ON ("col$colocacion".ID_AGENCIA = "col$colgarantias".ID_AGENCIA and ');
          SQL.Add('"col$colocacion".ID_COLOCACION = "col$colgarantias".ID_COLOCACION)');
          SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA');
          SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION <> 4 and "col$colocacion".ID_ESTADO_COLOCACION <> 5');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id;
          ParamByName('ID_PERSONA').AsString := Documento;
          try
            ExecQuery;
            if RecordCount > 0 then
            Saldo := FieldByName('SUMA').AsCurrency
            else
            Saldo := 0;
          except
            MessageDlg('Error al Buscar Colocaciones',mtError,[mbok],0);
            Saldo := 0;
          end;
        end;
        Result := Saldo;
end;

procedure TfrmConsultaProductos.IBTablaLiquidacionColocacionPAGADAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        if Sender.AsInteger = 0 then Text := 'N'
        else
        if (Sender.AsInteger = 1) or (Sender.AsInteger = -1) then Text := 'S';

end;

procedure TfrmConsultaProductos.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsultaProductos.ConsultadeExtracto1Click(Sender: TObject);
var frmConsultaExtractoCaptacion:TfrmConsultaExtractoCaptacion;
begin
      frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
      frmConsultaExtractoCaptacion.AgenciaA := StrToInt(MidStr(GridRCaptaciones.Cells[0,FilaCap],2,2));
      frmConsultaExtractoCaptacion.Tipo := StrToInt(MidStr(GridRCaptaciones.Cells[0,FilaCap],1,1));
      frmConsultaExtractoCaptacion.Cuenta := StrToInt(MidStr(GridRCaptaciones.Cells[0,FilaCap],5,7));
      frmConsultaExtractoCaptacion.Digito := StrToInt(MidStr(GridRCaptaciones.Cells[0,FilaCap],13,1));
      frmConsultaExtractoCaptacion.ShowModal;
end;

procedure TfrmConsultaProductos.GridRCaptacionesSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
        FilaCap := ARow;
end;

procedure TfrmConsultaProductos.CambiosdeEstado1Click(Sender: TObject);
var frmObservacionesCambioEstado:TfrmObservacionesCambioEstado;
begin
    frmObservacionesCambioEstado := TfrmObservacionesCambioEstado.Create(self);
    frmObservacionesCambioEstado.Tipo :=  StrToInt(MidStr(GridRCaptaciones.Cells[0,FilaCap],1,1));
    frmObservacionesCambioEstado.AgenciaA := StrToInt(MidStr(GridRCaptaciones.Cells[0,FilaCap],2,2));
    frmObservacionesCambioEstado.Cuenta := StrToInt(MidStr(GridRCaptaciones.Cells[0,FilaCap],5,7));
    frmObservacionesCambioEstado.Digito := StrToInt(MidStr(GridRCaptaciones.Cells[0,FilaCap],13,1));
    frmObservacionesCambioEstado.ShowModal;
end;

procedure TfrmConsultaProductos.DBImage1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;

end;

procedure TfrmConsultaProductos.DBImage3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;

end;

procedure TfrmConsultaProductos.GridRCaptacionesDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var Atributos:Smallint;
    Color :Longint;
    Recuadro:TRect;
    i:Integer;
begin

        Recuadro.Left := Rect.Left + 2;
        Recuadro.Top := Rect.Top + 2;
        Recuadro.Right := Rect.Right - 2;
        Recuadro.Bottom := Rect.Bottom - 2;
        Recuadro.TopLeft := Rect.TopLeft;
        Recuadro.BottomRight := Rect.BottomRight;

        Color := clBtnFace;

        if ARow=0 then
           Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE
        else
          begin
           case ACol of
           0: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           1: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           2: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           3: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           4: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           5: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           6: Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE;
           7: Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE;
           end;

        end;

        with GridRCaptaciones do begin

           if ARow = 0 then begin
              Canvas.Brush.Color := clBtnFace;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRCaptaciones.Cells[4,ARow] = 'ACTIVO' then
           begin
              Canvas.Brush.Color := clWhite;
              Canvas.Font.Color := clBlack;
           end
           else
           if Pos('SALDADO',GridRCaptaciones.Cells[4,ARow]) > 0 then
           begin
              Canvas.Brush.Color := clMedGray;
              Canvas.Font.Color := clWhite;
           end
           else
           if GridRCaptaciones.Cells[4,ARow] = 'CANCELADO' then
           begin
              Canvas.Brush.Color := clRed;
              Canvas.Font.Color := clYellow;
           end
           else
           if GridRCaptaciones.Cells[4,ARow] = 'CON CARTERA EN COBRO JURIDICO' then
           begin
              Canvas.Brush.Color := clSilver;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRCaptaciones.Cells[4,ARow] = 'PRORROGADO' then
           begin
              Canvas.Brush.Color := clMoneyGreen;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRCaptaciones.Cells[4,ARow] = 'INCAPACITADO' then
           begin
              Canvas.Brush.Color := clLime;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRCaptaciones.Cells[4,ARow] = 'ANULADO' then
           begin
              Canvas.Brush.Color := clNavy;
              Canvas.Font.Color := clWhite;
           end
           else
           begin
              Canvas.Brush.Color := clWhite;
              Canvas.Font.Color := clBlack;
           end;

{           if (gdFixed in State) then begin
             Canvas.Brush.Color := clBlack;
             for i:=1 to GridLineWidth do begin
              Canvas.FrameRect(Rect);
              InflateRect(Rect,1,1);
             end;
             Canvas.Brush.Color := clBtnFace;
             Canvas.Font.Color := clBlack;
           end;
}

           if (gdSelected in State) then begin
            Canvas.Brush.Color := clHighlight;
            Canvas.Font.Color := clHighlightText;
           end;

          Canvas.FillRect(Rect);
          DrawText(Canvas.Handle,PChar(Cells[Acol,ARow]),-1,Recuadro,
                  Atributos);
        end;



end;

procedure TfrmConsultaProductos.GridObservacionesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bmp: TBitmap;
  W: Integer;
  R: TRect;
begin
  R := Rect;
  if Column.Field = IBObservacionesSEMAFORO then begin
    bmp := TBitmap.Create;
    try
      if Column.Field.Value = 2 then
         bmp.LoadFromResourceName(HInstance,'SEMROJO')
      else
      if Column.Field.Value = 1 then
         bmp.LoadFromResourceName(HInstance,'SEMAMARILLO')
      else
      if Column.Field.Value = 0 then
         bmp.LoadFromResourceName(HInstance,'SEMVERDE');
      W := (Rect.Bottom - Rect.Top) * 1;
      R.Right := Rect.Left + W;
      GridObservaciones.Canvas.StretchDraw(R, bmp);
    finally
      bmp.Free;
    end;
    R := Rect;
    R.Left := R.Left + W;
  end;
  GridObservaciones.DefaultDrawDataCell(R, Column.Field, State);end;

procedure TfrmConsultaProductos.IBObservacionesOBSERVACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TfrmConsultaProductos.IBObservacionesID_EMPLEADOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$empleado" where ID_EMPLEADO = :ID_EMPLEADO');
          ParamByName('ID_EMPLEADO').AsString := Sender.AsString;
          try
           ExecQuery;
           if RecordCount > 0 then
              Text := Trim(FieldByName('NOMBRE').AsString + ' ' +
                           FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                           FieldByName('SEGUNDO_APELLIDO').AsString)
           else
              Text := 'NO REGISTRADO';
          except
            Transaction.Rollback;
            raise;
            Exit;
          end;
        end;
end;

procedure TfrmConsultaProductos.IBObservacionesAfterScroll(
  DataSet: TDataSet);
begin
        Memo.Text := DataSet.FieldByName('OBSERVACION').AsString;
end;

procedure TfrmConsultaProductos.IraObservaciones1Click(Sender: TObject);
var frmControldeObservaciones:TfrmControldeObservaciones;
begin
        frmControldeObservaciones := TfrmControldeObservaciones.Create(Self);
        frmControldeObservaciones.Id := vididentificacion;
        frmControldeObservaciones.Persona := vidpersona;
        frmControldeObservaciones.ShowModal;
end;

procedure TfrmConsultaProductos.IBObservacionesSEMAFOROGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := '';
end;

procedure TfrmConsultaProductos.AgregarSolicitudes;
begin
       with IBConsulta do
       begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"col$solicitud".ID_SOLICITUD,');
             SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
             SQL.Add('FROM');
             SQL.Add('"col$solicitud"');
             SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
             SQL.Add('WHERE');
             SQL.Add('("col$solicitud".ID_PERSONA = :ID_PERSONA) AND ');
             SQL.Add('("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
             SQL.Add('("col$solicitud".ESTADO IN (1,2,3,4,8,11,12,13,7))');
             ParamByName('ID_PERSONA').AsString := vidpersona;
             ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
             Open;
             //ShowMessage(FieldByName('ID_SOLICITUD').AsString);
             //if RecordCount <> 0 then
             //begin
             while not Eof do
             begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 8;
                arbolinfo.nombre := FieldByName('ID_SOLICITUD').AsString + ' ' + FieldByName('DESCRIPCION_ESTADO').AsString;
                arbolinfo.tipo := 0;
                arbolinfo.numero := FieldByName('ID_SOLICITUD').AsString;
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                NodoSo[1] := Arbol.Items.AddChildObject(NodoSo[0],arbolinfo.nombre,arbolinfo);
                NodoSo[1].ImageIndex := 1;
                Next;
             end;
        end;

end;

procedure TfrmConsultaProductos.BuscarSolicitudes;
begin
        with IBllenaSolicitud do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          ParamByName('ID_PERSONA').AsString := vidpersona;
          ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
          Open;
        end;
end;

procedure TfrmConsultaProductos.ExtractodeColocacin1Click(Sender: TObject);
var
//  FrmExtractoColocacion : TFrmExtractoColocacion;
frmExtractoCredito : TfrmExtractoCredito;
begin
//      FrmExtractoColocacion := TFrmExtractoColocacion.Create(Self);
//      FrmExtractoColocacion.Colocacion := GridRColocaciones.Cells[0,FilaCol];
//      FrmExtractoColocacion.AgenciaC := Agencia;
//      FrmExtractoColocacion.ShowModal;
        frmExtractoCredito := TfrmExtractoCredito.Create(Self);
        frmExtractoCredito.Colocacion := GridRColocaciones.Cells[0,FilaCol];
        frmExtractoCredito.AgenciaC := Agencia;
        frmExtractoCredito.ShowModal;
end;


procedure TfrmConsultaProductos.GridRColocacionesSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
        FilaCol := ARow;
end;

procedure TfrmConsultaProductos.GridRFianzasSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
        FilaFia := ARow;
end;

procedure TfrmConsultaProductos.MenuItem3Click(Sender: TObject);
var
//  FrmExtractoColocacion : TFrmExtractoColocacion;
frmExtractoCredito : TfrmExtractoCredito;
begin
//      FrmExtractoColocacion := TFrmExtractoColocacion.Create(Self);
//      FrmExtractoColocacion.Colocacion := GridRFianzas.Cells[0,FilaFia];
//      FrmExtractoColocacion.AgenciaC := Agencia;
//      FrmExtractoColocacion.ShowModal;
        frmExtractoCredito := TfrmExtractoCredito.Create(Self);
        frmExtractoCredito.Colocacion := GridRFianzas.Cells[0,FilaFia];
        frmExtractoCredito.AgenciaC := Agencia;
        frmExtractoCredito.ShowModal;
end;

procedure TfrmConsultaProductos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        try
          dmColocacion.Free;
        except
        end;
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Commit;
end;

procedure TfrmConsultaProductos.BuscaCredivida;
var     Astream :TStringStream;
        XmlDoc,Xmlres,RDoc :TsdXmlDocument;
        tamano :Integer;
        nodo1 :TXmlNode;
        i :Integer;
        sentencia :string;
begin
        XmlDoc := TsdXmlDocument.CreateName('equivida');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Nodo1 := XmlDoc.Root.NodeNew('registro');
        AStream := TStringStream.Create('');
        with Nodo1 do
        begin
          WriteString('cedula',vIdpersona);
          WriteString('consecutivo','0');
        end;// fin nodo1
        XmlDoc.SaveToStream(Astream);
        with IdTCPClient1 do
        begin
          Host := host_equivida;
          Port := 4500;
          try
          Connect;
          except
          begin
            Disconnect;
            Exit;
          end;// fin excetion
          end;//fin except
          if Connected then
          begin
            WriteInteger(AStream.Size);
            OpenWriteBuffer;
            WriteStream(AStream);
            CloseWriteBuffer;
            FreeAndNil(AStream);
            tamano := ReadInteger;
            AStream := TStringStream.Create('');
            ReadStream(AStream,tamano,False);
            RDoc := TsdXmlDocument.Create;
            RDoc.LoadFromStream(AStream);
          end;// fin connect
          Disconnect;
          if RDoc.Root.NodeCount > 0 then
          begin
            arbolinfo := TProductos.Create;
            arbolinfo.forma := 9;
            arbolinfo.nombre := 'CREDIVIDAS';
            arbolinfo.tipo := 0;
            arbolinfo.numero := '';
            arbolinfo.agencia := Agencia;
            arbolinfo.digito := 0;
            arbolinfo.nivel := 1;
            NodoSe[0] := Arbol.Items.AddChildObject(NodoSe[0],arbolinfo.nombre,arbolinfo);
            NodoSe[0].ImageIndex := 1;
            for i := 0 to RDoc.Root.NodeCount -1 do
            begin
                NodoSe[i+2] := Arbol.Items.AddChildObject(NodoSe[0],Rdoc.Root.Nodes[i].ValueAsString,arbolinfo);
                NodoSe[i+2].ImageIndex := 5;
              // := Rdoc.Root.Nodes[i].ValueAsString + #13 + respuesta;
            end;//fin for
        end; // fin de if
        end; // fin del coo
        end;
procedure TfrmConsultaProductos.AgregarTarjetaDebito;
begin
        with IBConsulta do
        begin
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('"cap$tarjetacuenta".ID_TARJETA,');
           SQL.Add('"cap$tarjetaestado".DESCRIPCION');
           SQL.Add('FROM');
           SQL.Add('"cap$tarjetacuenta"');
           SQL.Add('INNER JOIN "cap$tarjetaestado" ON ("cap$tarjetacuenta".ID_ESTADO="cap$tarjetaestado".ID_ESTADO)');
           SQL.Add(' INNER JOIN "cap$maestrotitular" ON ("cap$tarjetacuenta".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
           SQL.Add('  AND ("cap$tarjetacuenta".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
           SQL.Add('  AND ("cap$tarjetacuenta".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
           SQL.Add('  AND ("cap$tarjetacuenta".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
           SQL.Add('WHERE');
           SQL.Add('  ("cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
           SQL.Add('  ("cap$maestrotitular".ID_PERSONA = :ID_PERSONA) AND ');
           SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR = 1) AND ');
           SQL.Add('  ("cap$maestrotitular".TIPO_TITULAR = 1)');
           SQL.Add('ORDER BY');
           SQL.Add('  "cap$tarjetacuenta".ID_ESTADO');
           ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
           ParamByName('ID_PERSONA').AsString := vidpersona;
           try
            Open;
            if RecordCount > 0 then
            begin
                arbolinfo := TProductos.Create;
                arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
                arbolinfo.nombre := 'TARJETAS DEBITO';
                arbolinfo.tipo := 0;
                arbolinfo.numero := '';
                arbolinfo.agencia := Agencia;
                arbolinfo.digito := 0;
                arbolinfo.nivel := 1;
                NodoSe[1] := Arbol.Items.AddChildObject(NodoSe[0],arbolinfo.nombre,nil);//arbolinfo);
                NodoSe[1].ImageIndex := 11;
                while not Eof do begin
                 arbolinfo := TProductos.Create;
                 arbolinfo.forma := 10;
                 arbolinfo.nombre := FieldByName('ID_TARJETA').AsString + ' ' + FieldByName('DESCRIPCION').AsString;
                 arbolinfo.tipo := 0;
                 arbolinfo.numero := FieldByName('ID_TARJETA').AsString;
                 arbolinfo.agencia := Agencia;
                 arbolinfo.digito := 0;
                 arbolinfo.nivel := 3;
                 NodoSe[2] := Arbol.Items.AddChildObject(NodoSe[1],arbolinfo.nombre,arbolinfo);
                 NodoSe[2].ImageIndex := 11;
                 Next;
                end;
            end;
           except
             Transaction.Rollback;
             raise;
             Exit;
           end;
        end;

end;

procedure TfrmConsultaProductos.ExpandirTodo1Click(Sender: TObject);
begin
        Arbol.FullExpand;
end;

procedure TfrmConsultaProductos.ContraerTodo1Click(Sender: TObject);
begin
        Arbol.FullCollapse;
end;

procedure TfrmConsultaProductos.BuscarDatosTarjetaDebito(numero: string);
begin
        with IBConsulta do
        begin
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('  "cap$tarjetacuenta".ID_TARJETA,');
           SQL.Add('  "cap$tarjetaestado".DESCRIPCION,');
           SQL.Add('  "cap$tarjetacuenta".FECHA_ASIGNACION,');
           SQL.Add('  "cap$tarjetacuenta".FECHA_BLOQUEO,');
           SQL.Add('  "cap$tarjetacuenta".FECHA_CANCELADA,');
           SQL.Add('  "cap$tarjetacuenta".CUPO_ATM,');
           SQL.Add('  "cap$tarjetacuenta".CUPO_POS,');
           SQL.Add('  "cap$tarjetacuenta".TRANS_ATM,');
           SQL.Add('  "cap$tarjetacuenta".TRANS_POS');
           SQL.Add('FROM');
           SQL.Add(' "cap$tarjetacuenta"');
           SQL.Add(' INNER JOIN "cap$tarjetaestado" ON ("cap$tarjetacuenta".ID_ESTADO="cap$tarjetaestado".ID_ESTADO)');
           SQL.Add('WHERE');
           SQL.Add('  ("cap$tarjetacuenta".ID_TARJETA = :ID_TARJETA)');
           ParamByName('ID_TARJETA').AsString := numero;
           try
            Open;
            if RecordCount > 0 then
            begin
              EdTarjetaDebito.Caption := FieldByName('ID_TARJETA').AsString;
              EdFechaAsignacion.Caption := FieldByName('FECHA_ASIGNACION').AsString;
              if FieldByName('FECHA_BLOQUEO').AsFloat <> 0 then
                 EdFechaBloqueo.Caption := FieldByName('FECHA_BLOQUEO').AsString
              else
                 EdFechaBloqueo.Caption := '';
              if FieldByName('FECHA_CANCELADA').AsFloat <> 0 then
                 EdFechaCancelacion.Caption := FieldByName('FECHA_CANCELADA').AsString
              else
                 EdFechaCancelacion.Caption := '';

              EdCupoATM.Caption := FormatCurr('$#,#.00',FieldByName('CUPO_ATM').AsCurrency);
              EdCupoPOS.Caption := FormatCurr('$#,#.00',FieldByName('CUPO_POS').AsCurrency);
              EdTransaATM.Caption := FieldByName('TRANS_ATM').AsString;
              EdTransaPOS.Caption := FieldByName('TRANS_POS').AsString;
              EdEstado.Caption := FieldByName('DESCRIPCION').AsString;
            end;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

end;

procedure TfrmConsultaProductos.splitterMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
        if (ssleft in Shift) then
        begin

        end;
end;

procedure TfrmConsultaProductos.BuscarDatosSolicitud(
  vId_Solicitud: string;vPersona:Boolean);
var     vEnte :Integer;
        vIdEmpleado :string;
        vFecha :TDateTime;
        vEstado :Integer;
        vIdper :string;
        vIdid :Integer;
begin
        vEnte := -1;
        JVempleadoRec.Caption := '';
        JVfechaRec.Caption := '';
        JVempleadoCre.Caption := '';
        JVfechaCre.Caption := '';
        JVempleadoAna.Caption := '';
        JVfechaAna.Caption := '';
        JVestado.Caption := '';
        JVvalor.Caption := '';
        JVlinea.Caption := '';
        JVrespaldo.Caption := '';
        JVgarantia.Caption := '';
        JVplazo.Caption := '';
        JVcapital.Caption := '';
        JVcuota.Caption := '';
        Mobservacion.Text := '';
        JVempleadoInf.Caption := '';
        JVfechaInf.Caption := '';
        JVSolicitud.Caption := vId_Solicitud;
        with IBllenaSolicitud do
        begin
         try
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$empleado".NOMBRE,');
          SQL.Add('"col$solicitud".VALOR_SOLICITADO,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".PLAZO,');
          SQL.Add('"col$solicitud".AMORTIZACION,');
          SQL.Add('"col$solicitud".PAGO_INTERES,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$solicitud".FECHA_CONCEPTO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".ENTE_APROBADOR');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$respaldo" ON ("col$solicitud".RESPALDO="col$respaldo".ID_RESPALDO)');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
          SQL.Add('INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA="col$garantia".ID_GARANTIA)');
          SQL.Add('INNER JOIN "col$lineas" ON ("col$solicitud".LINEA="col$lineas".ID_LINEA)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$solicitud".TIPO_CUOTA="col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$solicitud".ID_EMPLEADO="gen$empleado".ID_EMPLEADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          SQL.Add('order by "col$estadosolicitud".ORDEN');
          ParamByName('ID_SOLICITUD').AsString := vId_Solicitud;
          Open;
          vIdid := FieldByName('ID_IDENTIFICACION').AsInteger;
          vIdper := FieldByName('ID_PERSONA').AsString;
          JVempleadoRec.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          JVfechaRec.Caption := FormatDateTime('yyyy/mm/dd hh:mm',FieldByName('FECHA_RECEPCION').AsDateTime);
          JVrespaldo.Caption := FieldByName('DESCRIPCION_RESPALDO').AsString;
          JVgarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString;
          JVlinea.Caption := FieldByName('DESCRIPCION_LINEA').AsString;
          JVcuota.Caption := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
          JVplazo.Caption := FieldByName('PLAZO').AsString + ' Dias.';
          JVcapital.Caption := FieldByName('AMORTIZACION').AsString + ' Dias.';
          vEstado := FieldByName('ESTADO').AsInteger;
          if  vEstado = 4 then
          begin
          vEnte := FieldByName('ENTE_APROBADOR').AsInteger;
          JvLabel7.Caption := 'Estado y Fecha de Aprobacion';
          JvLabel12.Caption := 'Valor Aprobado';
          JVvalor.Caption := '$' + FormatCurr('#,#',FieldByName('VALOR_APROBADO').AsCurrency) + ' ';
          JVestado.Caption := FieldByName('DESCRIPCION_ESTADO').AsString + ' - ' + FieldByName('FECHA_CONCEPTO').AsString;
          end
          else if vEstado = 7 then
          begin
            vEnte := FieldByName('ENTE_APROBADOR').AsInteger;
            JvLabel7.Caption := 'Estado y Fecha de Negación';
            JvLabel12.Caption := 'Valor Negado';
            JVvalor.Caption := '$' + FormatCurr('#,#',FieldByName('VALOR_APROBADO').AsCurrency) + ' ';
            JVestado.Caption := FieldByName('DESCRIPCION_ESTADO').AsString + ' - ' + FieldByName('FECHA_CONCEPTO').AsString;
          end
          else
          begin
          JvLabel7.Caption := 'Estado';
          JvLabel12.Caption := 'Valor Solicitado';
          JVvalor.Caption := '$' + FormatCurr('#,#',FieldByName('VALOR_SOLICITADO').AsCurrency) + ' ';
          JVestado.Caption := FieldByName('DESCRIPCION_ESTADO').AsString;
          end;
          JVinteres.Caption := FieldByName('PAGO_INTERES').AsString + ' Dias.';
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$solicitudempleado".FECHAHORA,');
          SQL.Add('"gen$empleado".NOMBRE,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO');
          SQL.Add('FROM');
          SQL.Add('"gen$empleado"');
          SQL.Add('INNER JOIN "col$solicitudempleado" ON ("gen$empleado".ID_EMPLEADO="col$solicitudempleado".ID_EMPLEADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudempleado".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := vId_Solicitud;
          Open;
          JVempleadoCre.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          if FieldByName('FECHAHORA').AsDateTime <> 0 then
          JVfechaCre.Caption := FormatDateTime('yyyy/mm/dd hh:mm',FieldByName('FECHAHORA').AsDateTime);
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$empleado".NOMBRE,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"col$solicitudanalista".FECHAHORA');
          SQL.Add('FROM');
          SQL.Add('"gen$empleado"');
          SQL.Add('INNER JOIN "col$solicitudanalista" ON ("gen$empleado".ID_EMPLEADO="col$solicitudanalista".ID_EMPLEADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudanalista".ID_SOLICITUD = :ID_SOLICITUD) AND ');
          SQL.Add('("col$solicitudanalista".ES_VIGENTE = 1)');
          ParamByName('ID_SOLICITUD').AsString := vId_Solicitud;
          Open;
          JVempleadoAna.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          if FieldByName('FECHAHORA').AsDateTime <> 0 then
          JVfechaAna.Caption := FormatDateTime('yyyy/mm/dd hh:mm',FieldByName('FECHAHORA').AsDateTime);
          if vEnte <> -1 then
          begin
            if vEstado = 4 then
            begin
              SQL.Clear;
              SQL.Add('SELECT * FROM "col$observacion" WHERE ID_OBSERVACION = 14 AND ID_SOLICITUD = :ID_SOLICITUD');
              ParamByName('ID_SOLICITUD').AsString := vId_Solicitud;
              Open;
              Mobservacion.Text := FieldByName('OBSERVACION').AsString;
            end;
            if vEstado = 7 then
            begin
              SQL.Clear;
              SQL.Add('SELECT * FROM "col$observacion" WHERE ID_OBSERVACION = 6 AND ID_SOLICITUD = :ID_SOLICITUD');
              ParamByName('ID_SOLICITUD').AsString := vId_Solicitud;
              Open;
              Mobservacion.Text := FieldByName('OBSERVACION').AsString;
            end;
          end;
          SQL.Clear;
          SQL.Add('select ID_EMPLEADO,FECHA from "col$registroinformacion" where');
          SQL.Add('ID_REGISTRO = (SELECT MAX(ID_REGISTRO) FROM');
          SQL.Add('"col$registroinformacion" WHERE');
          SQL.Add('(ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('(ID_IDENTIFICACION = :ID_IDENTIFICACION))');
          ParamByName('ID_PERSONA').AsString := vidpersona;
          ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
          Open;
          vIdEmpleado := FieldByName('ID_EMPLEADO').AsString;
          if FieldByName('FECHA').AsDateTime <> 0 then
             JVfechaInf.Caption := FormatDateTime('yyyy/mm/dd hh:mm',FieldByName('FECHA').AsDateTime);
          SQL.Clear;
          SQL.Add('select NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO from "gen$empleado"');
          SQL.Add('where ID_EMPLEADO = :ID_EMPLEADO');
          ParamByName('ID_EMPLEADO').AsString := vIdEmpleado;
          Open;
          JVempleadoInf.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
          if vPersona then
          begin
            JvGroupBox6.Caption := 'Nombres y Apellidos del Solicitante';
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"gen$persona".NOMBRE,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO,');
            SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
            SQL.Add('FROM');
            SQL.Add('"gen$persona"');
            SQL.Add('WHERE');
            SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
            SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA)');
            ParamByName('ID_PERSONA').AsString := vIdper;
            ParamByName('ID_IDENTIFICACION').AsInteger := vIdid;
            Open;
            JVempleadoInf.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            Close;
          end
          else
            JvGroupBox6.Caption := 'Datos Ultimo Empleado Información de Crédito';
         except
          Exit;
         end;
        end;
end;

procedure TfrmConsultaProductos.AgregaCodeudor;
begin
        with IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$codeudor"');
          SQL.Add('INNER JOIN "col$solicitud" ON ("col$codeudor".ID_SOLICITUD="col$solicitud".ID_SOLICITUD)');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ESTADO IN (1,2,3,4,8,9,10,13,14)) AND');
          SQL.Add('("col$codeudor".ID_PERSONA = :ID_PERSONA) AND ');
          SQL.Add('("col$codeudor".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
          SQL.Add('("col$codeudor".ES_CONYUGUE = 0)');
          ParamByName('ID_PERSONA').AsString := vidpersona;
          ParamByName('ID_IDENTIFICACION').AsInteger := vididentificacion;
          Open;
          //*
          if RecordCount > 0 then
          begin
            arbolinfo := TProductos.Create;
            arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
            arbolinfo.nombre := 'CODEUDOR';
            arbolinfo.tipo := 0;
            arbolinfo.numero := '';
            arbolinfo.agencia := Agencia;
            arbolinfo.digito := 0;
            arbolinfo.nivel := 2;
            NodoOt[1] := Arbol.Items.AddChildObject(NodoOT[0],arbolinfo.nombre,nil);//arbolinfo);
            NodoOt[1].ImageIndex := 1;
            arbolinfo := TProductos.Create;
            arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
            arbolinfo.nombre := 'SOLICITUDES';
            arbolinfo.tipo := 0;
            arbolinfo.numero := '';
            arbolinfo.agencia := Agencia;
            arbolinfo.digito := 0;
            arbolinfo.nivel := 2;
            NodoOt[2] := Arbol.Items.AddChildObject(NodoOT[1],arbolinfo.nombre,nil);//arbolinfo);
            NodoOt[2].ImageIndex := 1;

            while not Eof do
            begin
              arbolinfo := TProductos.Create;
              arbolinfo.forma := 11;
              arbolinfo.nombre := FieldByName('ID_SOLICITUD').AsString + ' ' + FieldByName('DESCRIPCION_ESTADO').AsString;
              arbolinfo.tipo := 0;
              Arbolinfo.numero := FieldByName('ID_SOLICITUD').AsString;
              arbolinfo.agencia := Agencia;
              arbolinfo.digito := 0;
              arbolinfo.nivel := 3;
              NodoOt[3] := Arbol.Items.AddChildObject(NodoOT[2],arbolinfo.nombre,arbolinfo);
              NodoOt[3].ImageIndex := 1;
              Next;
           end;
          end;
        end;
end;

procedure TfrmConsultaProductos.GridRColocacionesDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var Atributos:Smallint;
    Color :Longint;
    Recuadro:TRect;
    i:Integer;

begin

        Recuadro.Left := Rect.Left + 2;
        Recuadro.Top := Rect.Top + 2;
        Recuadro.Right := Rect.Right - 2;
        Recuadro.Bottom := Rect.Bottom - 2;
        Recuadro.TopLeft := Rect.TopLeft;
        Recuadro.BottomRight := Rect.BottomRight;

        Color := clBtnFace;

        if ARow=0 then
           Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE
        else
          begin
           case ACol of
           0: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           1: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           2: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           3: Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE;
           4: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           5: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           6: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           7: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           8: Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE;
           end;

        end;

        with GridRColocaciones do begin

           if ARow = 0 then begin
              Canvas.Brush.Color := clBtnFace;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRColocaciones.Cells[8,ARow] = 'POR VISAR' then
           begin
              Canvas.Brush.Color := clBlue;
              Canvas.Font.Color := clWhite;
           end
           else
           if GridRColocaciones.Cells[8,ARow] = 'VIGENTE' then
           begin
              Canvas.Brush.Color := clWhite;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRColocaciones.Cells[8,ARow] = 'SALDADO' then
           begin
              Canvas.Brush.Color := clMedGray;
              Canvas.Font.Color := clWhite;
           end
           else
           if GridRColocaciones.Cells[8,ARow] = 'CANCELADO' then
           begin
              Canvas.Brush.Color := clRed;
              Canvas.Font.Color := clYellow;
           end
           else
           if GridRColocaciones.Cells[8,ARow] = 'JURIDICO' then
           begin
              Canvas.Brush.Color := clSilver;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRColocaciones.Cells[8,ARow] = 'CASTIGADO' then
           begin
              Canvas.Brush.Color := clMoneyGreen;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRColocaciones.Cells[8,ARow] = 'INCAPACITADO' then
           begin
              Canvas.Brush.Color := clLime;
              Canvas.Font.Color := clBlack;
           end
           else
           begin
              Canvas.Brush.Color := clGray;
              Canvas.Font.Color := clWhite;
           end;

{           if (gdFixed in State) then begin
             Canvas.Brush.Color := clBlack;
             for i:=1 to GridLineWidth do begin
              Canvas.FrameRect(Rect);
              InflateRect(Rect,1,1);
             end;
             Canvas.Brush.Color := clBtnFace;
             Canvas.Font.Color := clBlack;
           end;
}

           if (gdSelected in State) then begin
            Canvas.Brush.Color := clHighlight;
            Canvas.Font.Color := clHighlightText;
           end;

          Canvas.FillRect(Rect);
          DrawText(Canvas.Handle,PChar(Cells[Acol,ARow]),-1,Recuadro,
                  Atributos);
        end;

end;

procedure TfrmConsultaProductos.GridRFianzasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Atributos:Smallint;
    Color :Longint;
    Recuadro:TRect;
    i:Integer;

begin

        Recuadro.Left := Rect.Left + 2;
        Recuadro.Top := Rect.Top + 2;
        Recuadro.Right := Rect.Right - 2;
        Recuadro.Bottom := Rect.Bottom - 2;
        Recuadro.TopLeft := Rect.TopLeft;
        Recuadro.BottomRight := Rect.BottomRight;

        Color := clBtnFace;

        if ARow=0 then
           Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE
        else
          begin
           case ACol of
           0: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           1: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           2: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           3: Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE;
           4: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           5: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           6: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           7: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           8: Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE;
           end;

        end;

        with GridRFianzas do begin

           if ARow = 0 then begin
              Canvas.Brush.Color := clBtnFace;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRFianzas.Cells[8,ARow] = 'POR VISAR' then
           begin
              Canvas.Brush.Color := clBlue;
              Canvas.Font.Color := clWhite;
           end
           else
           if GridRFianzas.Cells[8,ARow] = 'VIGENTE' then
           begin
              Canvas.Brush.Color := clWhite;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRFianzas.Cells[8,ARow] = 'SALDADO' then
           begin
              Canvas.Brush.Color := clMedGray;
              Canvas.Font.Color := clWhite;
           end
           else
           if GridRFianzas.Cells[8,ARow] = 'CANCELADO' then
           begin
              Canvas.Brush.Color := clRed;
              Canvas.Font.Color := clYellow;
           end
           else
           if GridRFianzas.Cells[8,ARow] = 'JURIDICO' then
           begin
              Canvas.Brush.Color := clSilver;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRFianzas.Cells[8,ARow] = 'CASTIGADO' then
           begin
              Canvas.Brush.Color := clMoneyGreen;
              Canvas.Font.Color := clBlack;
           end
           else
           if GridRFianzas.Cells[8,ARow] = 'INCAPACITADO' then
           begin
              Canvas.Brush.Color := clLime;
              Canvas.Font.Color := clBlack;
           end
           else
           begin
              Canvas.Brush.Color := clGray;
              Canvas.Font.Color := clWhite;
           end;

{           if (gdFixed in State) then begin
             Canvas.Brush.Color := clBlack;
             for i:=1 to GridLineWidth do begin
              Canvas.FrameRect(Rect);
              InflateRect(Rect,1,1);
             end;
             Canvas.Brush.Color := clBtnFace;
             Canvas.Font.Color := clBlack;
           end;
}

           if (gdSelected in State) then begin
            Canvas.Brush.Color := clHighlight;
            Canvas.Font.Color := clHighlightText;
           end;

          Canvas.FillRect(Rect);
          DrawText(Canvas.Handle,PChar(Cells[Acol,ARow]),-1,Recuadro,
                  Atributos);
        end;
end;

end.
