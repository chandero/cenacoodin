unit UnitCreaciondePersona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, DB, DBCtrls, Buttons, Grids, Mask,
  ImgList, StrUtils, CommCtrl, OleCtrls, tscap32_rt,
  Clipbrd, GIIEPADLib_TLB,DBTables, OleServer, DPSDKOPSLib_TLB, DpSdkEngLib_TLB,
  ActiveX, IBCustomDataSet, IBBlob, Provider, DBClient, DBLocal, DBLocalI;

type
  TfrmCreacionPersona = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    CmdGrabar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    CmdInforme: TBitBtn;
    Images: TImageList;
    PageControl: TPageControl;
    InfoConyuge: TTabSheet;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    CBtipoidentificacionconyuge: TDBLookupComboBox;
    EdNumeroIdentificacionConyuge: TMemo;
    EdPrimerApellidoConyuge: TLabeledEdit;
    EdSegundoApellidoConyuge: TLabeledEdit;
    EdNombreConyuge: TLabeledEdit;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    EdIngresosConyuge: TMemo;
    EdEgresosConyuge: TMemo;
    EdOtrosIngresosConyuge: TMemo;
    EdOtrosEgresosConyuge: TMemo;
    InfoLaboral: TTabSheet;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    EdProfesion: TLabeledEdit;
    EdEmpresa: TLabeledEdit;
    EdCargo: TLabeledEdit;
    EdRetefuente: TCheckBox;
    EdTotalActivos: TMemo;
    EdTotalPasivos: TMemo;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    EdEgresosArriendo: TMemo;
    EdEgresosServicios: TMemo;
    EdEgresosTransporte: TMemo;
    EdEgresosAlimentos: TMemo;
    EdEgresosDeudas: TMemo;
    EdEgresosOtros: TMemo;
    GroupBox7: TGroupBox;
    Label19: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label14: TLabel;
    EdDeclaracion: TEdit;
    Edingresos: TMemo;
    EdOtrosIngresos: TMemo;
    EdDescripcionIngresosConyuge: TMemo;
    InfoDirecciones: TTabSheet;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    GridDireccion: TStringGrid;
    Panel3: TPanel;
    CmdModificarDIR: TBitBtn;
    CmdAgregarDIR: TBitBtn;
    CmdEliminarDIR: TBitBtn;
    CmdLimpiarDIR: TBitBtn;
    CBtipodireccion: TDBLookupComboBox;
    EdDireccion: TEdit;
    EdBarrio: TEdit;
    EdMunicipio: TEdit;
    EdTelefono1: TMemo;
    EdTelefono2: TMemo;
    EdTelefono3: TMemo;
    EdTelefono4: TMemo;
    InfoReferencias: TTabSheet;
    Label43: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    GridReferencia: TStringGrid;
    Panel5: TPanel;
    CmdModificarREF: TBitBtn;
    CmdAgregarREF: TBitBtn;
    CmdEliminarREF: TBitBtn;
    CmdLimpiarREF: TBitBtn;
    CBtiporeferencia: TDBLookupComboBox;
    EdPrimerApellidoRef: TLabeledEdit;
    EdSegundoApellidoRef: TLabeledEdit;
    EdNombreRef: TLabeledEdit;
    EdDireccionRef: TEdit;
    EdTelefonoRef: TMemo;
    CBparentesco: TDBLookupComboBox;
    InfoApoderado: TTabSheet;
    InfoImagenes: TTabSheet;
    GroupBox9: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    CBTipoIdentificacionApoderado: TDBLookupComboBox;
    EdNumeroIdentificacionApoderado: TMemo;
    EdPrimerApellidoApoderado: TLabeledEdit;
    EdSegundoApellidoApoderado: TLabeledEdit;
    EdNombreApoderado: TLabeledEdit;
    PageControl1: TPageControl;
    InfoNatural: TTabSheet;
    Panel6: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    GroupBox8: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    CBTiposIdentificacion: TDBLookupComboBox;
    EdIdentificacion: TMemo;
    EdPrimerApellido: TLabeledEdit;
    EdSegundoApellido: TLabeledEdit;
    EdNombres: TLabeledEdit;
    CBTipoPersona: TDBLookupComboBox;
    CBSexo: TDBComboBox;
    CBEstadoCivil: TDBLookupComboBox;
    EdFechaNacimiento: TDateTimePicker;
    EdLugarNacimiento: TLabeledEdit;
    EdProvinciaNacimiento: TLabeledEdit;
    EdDepartamentoNacimiento: TLabeledEdit;
    EdPaisNacimiento: TLabeledEdit;
    CBTiposRelacion: TDBLookupComboBox;
    EdFechaAfiliacion: TDateTimePicker;
    CBciiu: TDBLookupComboBox;
    EdEstudio: TCheckBox;
    InfoJuridica: TTabSheet;
    EdFechaIngreso: TDateTimePicker;
    Label52: TLabel;
    Label53: TLabel;
    EdFechaExpedicion: TDateTimePicker;
    Label54: TLabel;
    EdLugarExpedicion: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    CBTipoIdentificacionJur: TDBLookupComboBox;
    EdNumeroIdentificacionJur: TMemo;
    EdRazonSocial: TLabeledEdit;
    EdLugarNacimientoJur: TLabeledEdit;
    EdProvinciaNacimientoJur: TLabeledEdit;
    EdDepartamentoNacimientoJur: TLabeledEdit;
    EdPaisNacimientoJur: TLabeledEdit;
    Label3: TLabel;
    CBTipoPersonaJur: TDBLookupComboBox;
    Label5: TLabel;
    CBciiuJur: TDBLookupComboBox;
    Label8: TLabel;
    EdNumeroEscritura: TEdit;
    Label51: TLabel;
    EdCapitalSocial: TEdit;
    Label4: TLabel;
    EdFechaNacimientoJur: TDateTimePicker;
    Label9: TLabel;
    EdDuracionSociedad: TEdit;
    Label34: TLabel;
    EdMatriculaMercantil: TEdit;
    Label6: TLabel;
    CBTiposRelacionJur: TDBLookupComboBox;
    Label7: TLabel;
    EdFechaAfiliacionJur: TDateTimePicker;
    CmdFirma: TBitBtn;
    Panel7: TPanel;
    Panel8: TPanel;
    CmdTomarFoto: TBitBtn;
    ImgFotoC: TImage;
    ImgHuellaC: TImage;
    CmdTomarHuella: TBitBtn;
    CmdReintentar: TBitBtn;
    GIIEPad1: TGIIEPad;
    ImgFirmaC: TImage;
    EdMensaje: TStaticText;
    IBDS1: TIBDataSet;
    IBDS1ID_IDENTIFICACION: TSmallintField;
    IBDS1ID_PERSONA: TIBStringField;
    IBDS1DATOS_HUELLA: TBlobField;
    procedure EdIdentificacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CBtiposidentificacionEnter(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBtipoidentificacionconyugeEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBtiposidentificacionExit(Sender: TObject);
    procedure EdIdentificacionEnter(Sender: TObject);
    procedure EdIdentificacionExit(Sender: TObject);
    procedure CBtipopersonaEnter(Sender: TObject);
    procedure CBsexoEnter(Sender: TObject);
    procedure CBsexoExit(Sender: TObject);
    procedure CBestadocivilEnter(Sender: TObject);
    procedure CBestadocivilExit(Sender: TObject);
    procedure EdFechaNacimientoExit(Sender: TObject);
    procedure EdLugarNacimientoEnter(Sender: TObject);
    procedure EdLugarNacimientoExit(Sender: TObject);
    procedure EdProvinciaNacimientoEnter(Sender: TObject);
    procedure EdProvinciaNacimientoExit(Sender: TObject);
    procedure EdDepartamentoNacimientoEnter(Sender: TObject);
    procedure EdDepartamentoNacimientoExit(Sender: TObject);
    procedure EdPaisNacimientoEnter(Sender: TObject);
    procedure EdPaisNacimientoExit(Sender: TObject);
    procedure CBciiuEnter(Sender: TObject);
    procedure CBciiuExit(Sender: TObject);
    procedure CBtiposrelacionEnter(Sender: TObject);
    procedure CBtiposrelacionExit(Sender: TObject);
    procedure CBtipoidentificacionconyugeExit(Sender: TObject);
    procedure EdNumeroIdentificacionConyugeEnter(Sender: TObject);
    procedure EdNumeroIdentificacionConyugeExit(Sender: TObject);
    procedure EdPrimerApellidoEnter(Sender: TObject);
    procedure EdPrimerApellidoExit(Sender: TObject);
    procedure EdSegundoApellidoEnter(Sender: TObject);
    procedure EdSegundoApellidoExit(Sender: TObject);
    procedure EdNombresEnter(Sender: TObject);
    procedure EdNombresExit(Sender: TObject);
    procedure CBtipopersonaExit(Sender: TObject);
    procedure EdPrimerApellidoConyugeEnter(Sender: TObject);
    procedure EdPrimerApellidoConyugeExit(Sender: TObject);
    procedure EdSegundoApellidoConyugeEnter(Sender: TObject);
    procedure EdSegundoApellidoConyugeExit(Sender: TObject);
    procedure EdNombreConyugeEnter(Sender: TObject);
    procedure EdNombreConyugeExit(Sender: TObject);
    procedure EdIngresosConyugeKeyPress(Sender: TObject; var Key: Char);
    procedure EdIngresosConyugeEnter(Sender: TObject);
    procedure EdIngresosConyugeExit(Sender: TObject);
    procedure EdOtrosIngresosConyugeKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdOtrosIngresosConyugeEnter(Sender: TObject);
    procedure EdOtrosIngresosConyugeExit(Sender: TObject);
    procedure EdEgresosConyugeKeyPress(Sender: TObject; var Key: Char);
    procedure EdEgresosConyugeEnter(Sender: TObject);
    procedure EdEgresosConyugeExit(Sender: TObject);
    procedure EdOtrosEgresosConyugeKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdOtrosEgresosConyugeEnter(Sender: TObject);
    procedure EdOtrosEgresosConyugeExit(Sender: TObject);
    procedure EdDescripcionIngresosConyugeEnter(Sender: TObject);
    procedure EdProfesionEnter(Sender: TObject);
    procedure EdProfesionExit(Sender: TObject);
    procedure EdEmpresaEnter(Sender: TObject);
    procedure EdEmpresaExit(Sender: TObject);
    procedure EdCargoEnter(Sender: TObject);
    procedure EdCargoExit(Sender: TObject);
    procedure EdFechaIngresoEnter(Sender: TObject);
    procedure EdFechaIngresoExit(Sender: TObject);
    procedure EdRetefuenteEnter(Sender: TObject);
    procedure EdRetefuenteExit(Sender: TObject);
    procedure EdDeclaracionEnter(Sender: TObject);
    procedure EdDeclaracionExit(Sender: TObject);
    procedure EdingresosKeyPress(Sender: TObject; var Key: Char);
    procedure EdingresosEnter(Sender: TObject);
    procedure EdingresosExit(Sender: TObject);
    procedure EdOtrosIngresosKeyPress(Sender: TObject; var Key: Char);
    procedure EdOtrosIngresosEnter(Sender: TObject);
    procedure EdOtrosIngresosExit(Sender: TObject);
    procedure EdEgresosArriendoKeyPress(Sender: TObject; var Key: Char);
    procedure EdEgresosArriendoEnter(Sender: TObject);
    procedure EdEgresosArriendoExit(Sender: TObject);
    procedure EdEgresosTransporteKeyPress(Sender: TObject; var Key: Char);
    procedure EdEgresosTransporteEnter(Sender: TObject);
    procedure EdEgresosTransporteExit(Sender: TObject);
    procedure EdEgresosServiciosKeyPress(Sender: TObject; var Key: Char);
    procedure EdEgresosServiciosEnter(Sender: TObject);
    procedure EdEgresosServiciosExit(Sender: TObject);
    procedure EdEgresosAlimentosKeyPress(Sender: TObject; var Key: Char);
    procedure EdEgresosAlimentosEnter(Sender: TObject);
    procedure EdEgresosAlimentosExit(Sender: TObject);
    procedure EdEgresosDeudasKeyPress(Sender: TObject; var Key: Char);
    procedure EdEgresosDeudasEnter(Sender: TObject);
    procedure EdEgresosDeudasExit(Sender: TObject);
    procedure EdEgresosOtrosKeyPress(Sender: TObject; var Key: Char);
    procedure EdEgresosOtrosEnter(Sender: TObject);
    procedure EdEgresosOtrosExit(Sender: TObject);
    procedure EdTelefono1KeyPress(Sender: TObject; var Key: Char);
    procedure EdTelefono2KeyPress(Sender: TObject; var Key: Char);
    procedure EdTelefono3KeyPress(Sender: TObject; var Key: Char);
    procedure EdTelefono4KeyPress(Sender: TObject; var Key: Char);
    procedure EdTelefonoRefKeyPress(Sender: TObject; var Key: Char);
    procedure CmdNuevoClick(Sender: TObject);
    procedure EdTelefono4Exit(Sender: TObject);
    procedure CmdAgregarDIRClick(Sender: TObject);
    procedure CmdAgregarREFClick(Sender: TObject);
    procedure CBtipodireccionEnter(Sender: TObject);
    procedure CmdLimpiarDIRClick(Sender: TObject);
    procedure GridDireccionSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridReferenciaSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure CmdModificarDIRClick(Sender: TObject);
    procedure CmdEliminarDIRClick(Sender: TObject);
    procedure CmdLimpiarREFClick(Sender: TObject);
    procedure CmdModificarREFClick(Sender: TObject);
    procedure EdTelefonoRefExit(Sender: TObject);
    procedure CmdEliminarREFClick(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure CBparentescoEnter(Sender: TObject);
    procedure EdEstudioEnter(Sender: TObject);
    procedure EdEstudioExit(Sender: TObject);
    procedure CBestadocivilKeyPress(Sender: TObject; var Key: Char);
    procedure EdTotalActivosEnter(Sender: TObject);
    procedure EdTotalPasivosEnter(Sender: TObject);
    procedure EdTotalActivosExit(Sender: TObject);
    procedure EdTotalPasivosExit(Sender: TObject);
    procedure CBTipoIdentificacionApoderado1Enter(Sender: TObject);
    procedure CBTipoIdentificacionApoderado1Exit(Sender: TObject);
    procedure EdNumeroIdentificacionApoderado1Enter(Sender: TObject);
    procedure EdNumeroIdentificacionApoderado1Exit(Sender: TObject);
    procedure EdNumeroIdentificacionApoderado1KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdPrimerApellidoApoderado1Enter(Sender: TObject);
    procedure EdPrimerApellidoApoderado1Exit(Sender: TObject);
    procedure EdNombreApoderado1Enter(Sender: TObject);
    procedure EdNombreApoderado1Exit(Sender: TObject);
    procedure InfoDireccionesEnter(Sender: TObject);
    procedure EdPrimerApellidoApoderadoEnter(Sender: TObject);
    procedure EdPrimerApellidoApoderadoExit(Sender: TObject);
    procedure EdSegundoApellidoApoderadoEnter(Sender: TObject);
    procedure EdSegundoApellidoApoderadoExit(Sender: TObject);
    procedure EdNombreApoderadoEnter(Sender: TObject);
    procedure EdNombreApoderadoExit(Sender: TObject);
    procedure EdNumeroIdentificacionApoderadoEnter(Sender: TObject);
    procedure EdNumeroIdentificacionApoderadoExit(Sender: TObject);
    procedure InfoConyugeExit(Sender: TObject);
    procedure InfoLaboralEnter(Sender: TObject);
    procedure InfoConyugeEnter(Sender: TObject);
    procedure InfoReferenciasEnter(Sender: TObject);
    procedure InfoApoderadoEnter(Sender: TObject);
    procedure InfoApoderadoExit(Sender: TObject);
    procedure InfoImagenesExit(Sender: TObject);
    procedure CBTipoIdentificacionApoderadoEnter(Sender: TObject);
    procedure CBTipoIdentificacionApoderadoExit(Sender: TObject);
    procedure CBTipoIdentificacionJurEnter(Sender: TObject);
    procedure CBTipoIdentificacionJurExit(Sender: TObject);
    procedure EdNumeroIdentificacionJurEnter(Sender: TObject);
    procedure EdNumeroIdentificacionJurExit(Sender: TObject);
    procedure EdRazonSocialEnter(Sender: TObject);
    procedure EdRazonSocialExit(Sender: TObject);
    procedure EdLugarNacimientoJurEnter(Sender: TObject);
    procedure EdLugarNacimientoJurExit(Sender: TObject);
    procedure EdProvinciaNacimientoJurEnter(Sender: TObject);
    procedure EdProvinciaNacimientoJurExit(Sender: TObject);
    procedure EdDepartamentoNacimientoJurEnter(Sender: TObject);
    procedure EdDepartamentoNacimientoJurExit(Sender: TObject);
    procedure EdPaisNacimientoJurEnter(Sender: TObject);
    procedure EdPaisNacimientoJurExit(Sender: TObject);
    procedure CBTiposRelacionJurEnter(Sender: TObject);
    procedure CBTiposRelacionJurExit(Sender: TObject);
    procedure EdFechaAfiliacionExit(Sender: TObject);
    procedure EdFechaAfiliacionJurExit(Sender: TObject);
    procedure CBTipoPersonaJurEnter(Sender: TObject);
    procedure CBTipoPersonaJurExit(Sender: TObject);
    procedure CBciiuJurEnter(Sender: TObject);
    procedure CBciiuJurExit(Sender: TObject);
    procedure EdNumeroEscrituraEnter(Sender: TObject);
    procedure EdNumeroEscrituraExit(Sender: TObject);
    procedure EdFechaNacimientoJurExit(Sender: TObject);
    procedure EdDuracionSociedadEnter(Sender: TObject);
    procedure EdDuracionSociedadExit(Sender: TObject);
    procedure EdMatriculaMercantilExit(Sender: TObject);
    procedure EdMatriculaMercantilEnter(Sender: TObject);
    procedure EdFechaNacimientoEnter(Sender: TObject);
    procedure EdCapitalSocialEnter(Sender: TObject);
    procedure EdCapitalSocialExit(Sender: TObject);
    procedure EdLugarExpedicionEnter(Sender: TObject);
    procedure EdLugarExpedicionExit(Sender: TObject);
    procedure EdFechaExpedicionEnter(Sender: TObject);
    procedure EdFechaExpedicionExit(Sender: TObject);
    procedure EdDuracionSociedadKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroEscrituraKeyPress(Sender: TObject; var Key: Char);
    procedure EdCapitalSocialKeyPress(Sender: TObject; var Key: Char);
    procedure CmdFirmaClick(Sender: TObject);
    procedure CmdTomarFotoClick(Sender: TObject);
    procedure CmdReintentarClick(Sender: TObject);
    procedure GIIEPad1PadData(Sender: TObject; abs_x, abs_y,
      abs_z: Integer; fTouch, fTap: WordBool; bmButtonState: Smallint;
      dwTimeStamp, dwSequenceNum: Integer);
    procedure InfoImagenesEnter(Sender: TObject);
    procedure EdEstudioClick(Sender: TObject);
    procedure EdDescripcionIngresosConyugeExit(Sender: TObject);
    procedure CmdTomarHuellaClick(Sender: TObject);
  private
    procedure Inicializar;
    procedure ActualizarGridDireccion;
    procedure ActualizarGridReferencia;
    function Grabar: Boolean;
    function Actualizar: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreacionPersona: TfrmCreacionPersona;

//variables Captura Firma
  g_fConnected :Boolean;
  g_fOpened: Boolean;
  g_xMin:Longint;
  g_xMax:Longint;
  g_yMin:Longint;
  g_yMax:Longint;
  g_fFirstTouch:Boolean;
  g_lastX:Longint;
  g_lastY:Longint;
  strClassID:widestring;
  strProviderDesc:widestring;
  firmaStatus:Integer;
  Firma:TBitmap;

//variables Captura de Huella
  FHuella : TBitmap;
  pvData: array[0..1023] of Byte;
  blobSize: Integer;
  hayHuella:Boolean;
implementation

{$R *.dfm}

uses UnitGlobales, UnitDmGeneral, UnitdmPersona, UnitTomarFoto, UnitTomaHuella, UnitVerificarHuella;

type
   PListaDireccion = ^AListaDireccion;
   AListaDireccion = record
      TipoDireccion:Integer;
      Direccion:String;
      Barrio:String;
      Municipio:String;
      Telefono1:String;
      Telefono2:String;
      Telefono3:String;
      Telefono4:String;
   end;

type
   PListaReferencia = ^AListaReferencia;
   AListaReferencia = record
      TipoReferencia:Integer;
      PrimerApellido:String;
      SegundoApellido:String;
      Nombre:String;
      Parentesco:Integer;
      Direccion:String;
      Telefono:String;
   end;

var
  dmPersona:TdmPersona;

  vModificar:Boolean;
// Generales
  DirAct :Integer;
  RefAct :Integer;

// Variables de Datos Afiliado
  vTipoIdentificacion:Integer;
  vIdentificacion:String;
  vLugarExpedicion:String;
  vFechaExpedicion:TDate;
  vPrimerApellido:String;
  vSegundoApellido:String;
  vNombres:String;
  vTipoPersona:Integer;
  vSexo:String;
  vEstadoCivil:Integer;
  vFechaNacimiento:TDate;
  vLugarNacimiento:String;
  vProvinciaNacimiento:String;
  vDepartamentoNacimiento:String;
  vPaisNacimiento:String;
  vCiiu:Integer;
  vTipoAfiliacion:Integer;
  vFechaAfiliacion:TDate;
  vEducacion :Integer;
  vNumeroEscritura:string;
  vDuracionSociedad:integer;
  vCapitalSocial:Currency;
  vMatriculaMercantil:string;

// Variables de Datos Conyuge
  vTipoIdentificacionConyuge:Integer;
  vNumeroIdentificacionConyuge:String;
  vPrimerApellidoConyuge:String;
  vSegundoApellidoConyuge:String;
  vNombreConyuge:String;
  vIngresosConyuge:Currency;
  vOtrosIngresosConyuge:Currency;
  vEgresosConyuge:Currency;
  vOtrosEgresosConyuge:Currency;

// Variables de Datos del Apoderado
  vTipoIdentificacionApoderado:Integer;
  vNumeroIdentificacionApoderado:String;
  vPrimerApellidoApoderado:String;
  vSegundoApellidoApoderado:String;
  vNombreApoderado:String;

// Variables Información Laboral
  vProfesion:String;
  vEmpresa:String;
  vCargo:String;
  vFechaIngreso:TDate;
  vRetefuente:Integer;
  vDeclaracion:String;
  vIngresos:Currency;
  vOtrosIngresos:Currency;
  vDescripcionIngresos:String;
  vEgresosArriendo:Currency;
  vEgresosTransporte:Currency;
  vEgresosServicios:Currency;
  vEgresosAlimentos:Currency;
  vEgresosDeudas:Currency;
  vEgresosOtros:Currency;
  vTotalActivos:Currency;
  vTotalPasivos:Currency;

// Variables Direcciones Persona
  vListaDirecciones:TList;
  vTipoDireccion:Integer;
  vDireccion:String;
  vBarrio:String;
  vMunicipio:String;
  vTelefono1:String;
  vTelefono2:String;
  vTelefono3:String;
  vTelefono4:String;

// Variables Referencias Persona
  vListaReferencia:TList;
  vTipoReferencia:Integer;
  vPrimerApellidoR:String;
  vSegundoApellidoR:String;
  vNombreR:String;
  vDireccionR:String;
  vTelefonoR:String;

procedure TfrmCreacionPersona.EdIdentificacionKeyPress(Sender: TObject;
  var Key: Char);
begin
//        NumericoSinPunto(Sender,Key);
end;

procedure TfrmCreacionPersona.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCreacionPersona.CBtiposidentificacionEnter(Sender: TObject);
begin
        CBtiposidentificacion.KeyValue := vTipoIdentificacion;
        CBtiposidentificacion.DropDown;
end;

procedure TfrmCreacionPersona.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCreacionPersona.FormClose(Sender: TObject;
  var Action: TCloseAction);
var ARecordD:PListaDireccion;
    ARecordR:PListaReferencia;
    I:Integer;
begin
      try

        for I := 0 to vListaDirecciones.Count - 1 do
        begin
            ARecordD := vListaDirecciones.Items[I];
            Dispose(ARecordD);
        end;

        for I := 0 to vListaReferencia.Count - 1 do
        begin
            ARecordR := vListaReferencia.Items[I];
            Dispose(ARecordR);
        end;

      finally
            vListaDirecciones.Free;
            vListaReferencia.Free;
      end;

      Action := caFree;
end;

procedure TfrmCreacionPersona.FormCreate(Sender: TObject);
var Bitmap :TBitmap;
begin
        Bitmap := nil;
        try
          Bitmap := TBitmap.Create;
          Bitmap.Height := 135;
          Bitmap.Width := 135;
          ImgFotoC.Picture.Graphic := Bitmap;
        finally
          Bitmap.Free;
        end;

        Bitmap := nil;
        try
          Bitmap := TBitmap.Create;
          Bitmap.Height := 135;
          Bitmap.Width := 135;
          ImgHuellaC.Picture.Graphic := Bitmap;
        finally
          Bitmap.Free;
        end;

        Bitmap := nil;
        try
          Bitmap := TBitmap.Create;
          Bitmap.Height := 142;
          Bitmap.Width := 320;
          ImgFirmaC.Picture.Graphic := Bitmap;
        finally
          Bitmap.Free;
        end;



        dmPersona := TdmPersona.Create(Self);

        vListaDirecciones := TList.Create;
        vListaReferencia  := TList.Create;

        GridDireccion.ColCount := 8;
        GridDireccion.FixedCols := 0;
        GridDireccion.FixedRows := 0;
        GridDireccion.ColWidths[0] := 30;
        GridDireccion.ColWidths[1] := 150;
        GridDireccion.ColWidths[2] := 150;
        GridDireccion.ColWidths[3] := 70;
        GridDireccion.ColWidths[4] := 50;
        GridDireccion.ColWidths[5] := 50;
        GridDireccion.ColWidths[6] := 50;
        GridDireccion.ColWidths[7] := 50;

        GridReferencia.ColCount := 6;
        GridReferencia.FixedCols := 0;
        GridReferencia.FixedRows := 0;
        GridReferencia.ColWidths[0] := 30;
        GridReferencia.ColWidths[1] := 150;
        GridReferencia.ColWidths[2] := 150;
        GridReferencia.ColWidths[3] := 100;
        GridReferencia.ColWidths[4] := 150;
        GridReferencia.ColWidths[5] := 50;

end;

procedure TfrmCreacionPersona.FormDestroy(Sender: TObject);
begin
        if g_fOpened then
           GIIEPad1.CloseConnection;
        if g_fConnected then
           GIIEPad1.CloseProvider;
        dmPersona.Free;
end;

procedure TfrmCreacionPersona.Inicializar;
var
I : integer;
begin
        if dmPersona.IBDStiposidentificacion.Transaction.InTransaction then
           dmPersona.IBDStiposidentificacion.Transaction.Commit;
        dmPersona.IBDStiposidentificacion.Transaction.StartTransaction;
        dmPersona.IBDStiposidentificacion.Open;
        dmPersona.IBDStiposidentificacion.Last;
        dmPersona.IBDStiposidentificacion.First;
        dmPersona.IBDStiposrelacion.Open;
        dmPersona.IBDStiposrelacion.Last;
        dmPersona.IBDStiposrelacion.First;
        dmPersona.IBDStiposciiu.Open;
        dmPersona.IBDStiposciiu.Last;
        dmPersona.IBDStiposciiu.First;
        dmPersona.IBDStipopersona.Open;
        dmPersona.IBDStipopersona.Last;
        dmPersona.IBDStipopersona.First;
        dmPersona.IBDSestadocivil.Open;
        dmPersona.IBDSestadocivil.Last;
        dmPersona.IBDSestadocivil.First;
        dmPersona.IBDStiposidentificacionconyuge.Open;
        dmPersona.IBDStiposidentificacionconyuge.Last;
        dmPersona.IBDStiposidentificacionconyuge.First;
        dmPersona.IBDStipodireccion.Open;
        dmPersona.IBDStipodireccion.Last;
        dmPersona.IBDStipodireccion.First;
        dmPersona.IBDStiporeferencia.Open;
        dmPersona.IBDStiporeferencia.Last;
        dmPersona.IBDStiporeferencia.First;
        dmPersona.IBDSparentesco.Open;
        dmPersona.IBDSparentesco.Last;
        dmPersona.IBDSparentesco.First;
// valores iniciales persona
//        vTipoIdentificacion := 3;
//        CBtiposidentificacion.KeyValue := -1;
        CBTiposIdentificacion.Enabled := True;
        EdIdentificacion.Enabled := True;
        vIdentificacion := '';
        vLugarExpedicion := '';
        vFechaExpedicion := Date;
        vEducacion := 0;
        vPrimerApellido := '';
        vSegundoApellido := '';
        vNombres := '';
        vTipoPersona := 1;
        vSexo := 'F';
        vEstadoCivil := 1;
        vFechaNacimiento := Date;
        vLugarNacimiento := '';
        vProvinciaNacimiento := '';
        vDepartamentoNacimiento := '';
        vPaisNacimiento := 'COLOMBIA';
        vCiiu := 0;
        vTipoAfiliacion := 1;
        vFechaAfiliacion := Date;
        vNumeroEscritura := '';
        vDuracionSociedad := 0;
        vCapitalSocial := 0;
        vMatriculaMercantil := '';
// Juridica
//          CBTipoIdentificacionJur.KeyValue := -1;
          EdNumeroIdentificacionJur.Text := '';
          EdRazonSocial.Text := '';
          EdLugarNacimientoJur.Text := '';
          EdFechaNacimientoJur.Date := Date;
          EdProvinciaNacimientoJur.Text := '';
          EdDepartamentoNacimientoJur.Text := '';
          EdPaisNacimiento.Text := '';
          CBTipoPersonaJur.KeyValue := -1;
          CBciiuJur.KeyValue := 0;
          CBtiposrelacionJur.KeyValue := -1;
          EdFechaAfiliacion.Date := Date;
          EdNumeroEscritura.Text := '';
          EdDuracionSociedad.Text := '';
          EdCapitalSocial.Text := '';
          EdMatriculaMercantil.Text := '';
//Natural
          EdIdentificacion.Text := '';
          EdLugarExpedicion.Text := '';
          EdFechaExpedicion.Date := Date;
          EdPrimerApellido.Text := '';
          EdSegundoApellido.Text := '';
          EdNombres.Text := '';
          CBtipopersona.KeyValue := -1;
          CBsexo.Text := '';
          CBestadocivil.KeyValue := -1;
          EdFechaNacimiento.Date := Date;
          EdLugarNacimiento.Text := '';
          EdProvinciaNacimiento.Text := '';
          EdDepartamentoNacimiento.Text := '';
          EdPaisNacimiento.Text := 'COLOMBIA';
          CBciiu.KeyValue := 0;
          CBtiposrelacion.KeyValue := -1;
          EdFechaAfiliacion.Date := Date;


// valores iniciales conyuge
        vTipoIdentificacionConyuge := 3;
        CBtipoidentificacionconyuge.KeyValue := -1;
        vNumeroIdentificacionConyuge := '';
        EdNumeroIdentificacionconyuge.Text := '';
        vPrimerApellidoConyuge := '';
        EdPrimerApellidoConyuge.Text  := '';
        vSegundoApellidoConyuge := '';
        EdSegundoApellidoConyuge.Text := '';
        vNombreConyuge := '';
        EdNombreConyuge.Text := '';
        vIngresosConyuge := 0.00;
        EdIngresosConyuge.Text := '0.00';
        vOtrosIngresosConyuge := 0.00;
        EdOtrosIngresosConyuge.Text := '0.00';
        vDescripcionIngresos := '';
        EdDescripcionIngresosConyuge.Text := '';
        vEgresosConyuge := 0.00;
        EdEgresosConyuge.Text := '0.00';
        vOtrosEgresosConyuge := 0.00;
        EdOtrosEgresosConyuge.Text := '0.00';

// valores iniciales información laboral
        vProfesion := '';
        EdProfesion.Text := '';
        vEmpresa := '';
        EdEmpresa.Text := '';
        vCargo := '';
        EdCargo.Text := '';
        vFechaIngreso := Date;
        EdFechaIngreso.Date := Date;
        vRetefuente := 1;
        EdRetefuente.Checked := true;
        vDeclaracion := '';
        EdDeclaracion.Text := '';
        vIngresos := 0.00;
        EdIngresos.Text := '0.00';
        vOtrosIngresos := 0.00;
        EdOtrosIngresos.Text := '0.00';
        vEgresosArriendo := 0.00;
        EdEgresosArriendo.Text := '0.00';
        vEgresosTransporte := 0.00;
        EdEgresosTransporte.Text := '0.00';
        vEgresosServicios := 0.00;
        EdEgresosServicios.Text := '0.00';
        vEgresosAlimentos := 0.00;
        EdEgresosAlimentos.Text := '0.00';
        vEgresosDeudas := 0.00;
        EdEgresosDeudas.Text := '0.00';
        vEgresosOtros := 0.00;
        EdEgresosOtros.Text := '0.00';
        vTotalActivos := 0;
        EdTotalActivos.Text := '';
        vTotalPasivos := 0;
        EdTotalPasivos.Text := '';


// valores iniciales informacion apoderado
        CBTipoIdentificacionApoderado.KeyValue := 0;
        vNumeroIdentificacionApoderado := '';
        EdNumeroIdentificacionApoderado.Text := '';
        vPrimerApellidoApoderado := '';
        EdPrimerApellidoApoderado.Text := '';
        vSegundoApellidoApoderado := '';
        EdsegundoApellidoApoderado.Text := '';
        vNombreApoderado := '';
        EdNombreApoderado.Text := '';
// valores iniciales informacion direcciones
        vListaDirecciones.Clear;
        CBtipodireccion.KeyValue := -1;
        EdDireccion.Text := '';
        EdBarrio.Text := '';
        EdMunicipio.Text := '';
        EdTelefono1.Text := '';
        EdTelefono2.Text := '';
        EdTelefono3.Text := '';
        EdTelefono4.Text := '';
        For I := 0 to GridDireccion.RowCount do
         begin
           GridDireccion.Cells[0,I] := '';
           GridDireccion.Cells[1,I] := '';
           GridDireccion.Cells[2,I] := '';
           GridDireccion.Cells[3,I] := '';
           GridDireccion.Cells[4,I] := '';
           GridDireccion.Cells[5,I] := '';
           GridDireccion.Cells[6,I] := '';
           GridDireccion.Cells[7,I] := '';
         end;

// valores iniciales información referencias
        vListaReferencia.Clear;
        CBtiporeferencia.KeyValue := -1;
        EdPrimerApellidoRef.Text := '';
        EdSegundoApellidoRef.Text := '';
        EdNombreRef.Text := '';
        EdDireccionRef.Text := '';
        EdTelefonoRef.Text := '';
        For I := 0 to GridReferencia.RowCount do
         begin
           GridReferencia.Cells[0,I] := '';
           GridReferencia.Cells[1,I] := '';
           GridReferencia.Cells[2,I] := '';
           GridReferencia.Cells[3,I] := '';
           GridReferencia.Cells[4,I] := '';
           GridReferencia.Cells[5,I] := '';
           GridReferencia.Cells[6,I] := '';
           GridReferencia.Cells[7,I] := '';
         end;

        InfoNatural.TabVisible := True;
        InfoJuridica.TabVisible := True;
        Pagecontrol1.ActivePage := InfoNatural;
        CBTiposIdentificacion.SetFocus;
        DirAct := -1;
        RefAct := -1;
        CBTiposIdentificacion.Enabled := True;
        EdIdentificacion.Enabled := True;

        g_fConnected := False;
        g_fOpened := False;
        g_fFirstTouch := True;
        firmaStatus := 0;

end;

procedure TfrmCreacionPersona.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmCreacionPersona.CBtipoidentificacionconyugeEnter(
  Sender: TObject);
begin
        CBtipoidentificacionconyuge.KeyValue := vTipoIdentificacionconyuge;
        CBtipoidentificacionconyuge.DropDown;
end;

procedure TfrmCreacionPersona.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key = VK_F1 then
           PageControl.ActivePageIndex := 0
        else
        if Key = VK_F2 then
           PageControl.ActivePageIndex := 1
        else
        if Key = VK_F3 then
           PageControl.ActivePageIndex := 2
        else
        if Key = VK_F4 then
           PageControl.ActivePageIndex := 3
        else
        if Key = VK_F5 then
           PageControl.ActivePageIndex := 4;

end;

procedure TfrmCreacionPersona.CBtiposidentificacionExit(Sender: TObject);
begin
        vTipoIdentificacion := CBtiposidentificacion.KeyValue;
        if (vTipoIdentificacion = 4) or (vTipoIdentificacion = 7) then
         begin
           PageControl1.ActivePage := InfoJuridica;
           CBTipoIdentificacionJur.SetFocus;
           CBTipoIdentificacionJur.KeyValue := vTipoIdentificacion;
           InfoNatural.TabVisible := False;
         end
        else
           InfoJuridica.TabVisible := False;
end;

procedure TfrmCreacionPersona.EdIdentificacionEnter(Sender: TObject);
begin
        EdIdentificacion.Text := '';
end;

procedure TfrmCreacionPersona.EdIdentificacionExit(Sender: TObject);
var
    ARecordD:PListaDireccion;
    ARecordR:PListaReferencia;
    Bitmap:TBitmap;
    BlobStream:TStream;
    BlobField:TBlobField;
    i:Integer;
begin


        vIdentificacion := EdIdentificacion.Text;
        vListaDirecciones.Clear;
        vListaReferencia.Clear;
        with IBDS1 do begin
           ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
           ParamByName('ID_PERSONA').AsString := vIdentificacion;
           Open;
           if RecordCount > 0 then
           try
              BlobStream := IBDS1.CreateBlobStream(FieldByName('DATOS_HUELLA'),bmRead);
//              BlobStream := TBlobStream.Create(IBDS1DATOS_HUELLA,bmRead);
              BlobStream.Read(pvData,BlobStream.Size);
              BlobStream.Free;
           except
              raise;
           end;
        end;

        with dmPersona.IBQuery do
        begin
            SQL.Clear;
            SQL.Add('select * from "gen$persona" where ');
            SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
            ParamByName('ID_PERSONA').AsString := vIdentificacion;
            Open;
            if RecordCount > 0 then
            begin
               vModificar := true;
               vLugarExpedicion := FieldByName('LUGAR_EXPEDICION').AsString;
               EdLugarExpedicion.Text := vLugarExpedicion;
               vFechaExpedicion := FieldByName('FECHA_EXPEDICION').AsDateTime;
               EdFechaExpedicion.Date := vFechaExpedicion;
               vPrimerApellido := FieldByName('PRIMER_APELLIDO').AsString;
               EdPrimerApellido.Text  := vPrimerApellido;
               vSegundoApellido := FieldByName('SEGUNDO_APELLIDO').AsString;
               EdSegundoApellido.Text := vSegundoApellido;
               vNombres := FieldByName('NOMBRE').AsString;
               EdNombres.Text := vNombres;
               vTipoPersona := FieldByName('ID_TIPO_PERSONA').AsInteger;
               CBtipopersona.KeyValue := vTipoPersona;
               vSexo := FieldByName('SEXO').AsString;
               if vSexo = 'M' then
                  CBsexo.Text := 'MASCULINO'
               else if vSexo = 'F' then
                  CBsexo.Text := 'FEMENINO'
               else
                  CBsexo.Text := '';
               vEstadoCivil := FieldByName('ID_TIPO_ESTADO_CIVIL').AsInteger;
               CBestadocivil.KeyValue := vEstadoCivil;
               if (vEstadoCivil = 2) or (vEstadoCivil = 3) then
                begin
                  InfoConyuge.TabVisible := True;
                  PageControl.ActivePageIndex := 0;
                end
               else
                begin
                  InfoConyuge.TabVisible := false;
                  PageControl.ActivePageIndex := 1;
                end;
               vFechaNacimiento := FieldByName('FECHA_NACIMIENTO').AsDateTime;
               DateTime_SetFormat(EdFechaNacimiento.Handle,'yyyy/MM/dd');
               EdFechaNacimiento.Date := vFechaNacimiento;
               vEducacion := FieldByName('EDUCACION').AsInteger;
               EdEstudio.Checked := IntToBoolean(vEducacion);
               vLugarNacimiento := FieldByName('LUGAR_NACIMIENTO').AsString;
               EdLugarNacimiento.Text := vLugarNacimiento;
               vProvinciaNacimiento := FieldByName('PROVINCIA_NACIMIENTO').AsString;
               EdProvinciaNacimiento.Text := vProvinciaNacimiento;
               vDepartamentoNacimiento := FieldByName('DEPTO_NACIMIENTO').AsString;
               EdDepartamentoNacimiento.Text := vDepartamentoNacimiento;
               vPaisNacimiento := FieldByName('PAIS_NACIMIENTO').AsString;
               EdPaisNacimiento.Text := vPaisNacimiento;
               vCiiu := FieldByName('ID_CIIU').AsInteger;
               CBciiu.KeyValue := vCiiu;
               vTipoAfiliacion := FieldByName('ID_TIPO_RELACION').AsInteger;
               CBtiposrelacion.KeyValue := vTipoAfiliacion;
               EdFechaAfiliacion.Date := FieldByName('FECHA_REGISTRO').AsDateTime;
               vTipoIdentificacionConyuge := FieldByName('ID_IDENTIFICACION_CONYUGE').AsInteger;
               CBtipoidentificacionconyuge.KeyValue := vTipoIdentificacionConyuge;
               vNumeroIdentificacionConyuge := FieldByName('ID_CONYUGE').AsString;
               EdNumeroIdentificacionConyuge.Text := vNumeroIdentificacionConyuge;
               vPrimerApellidoConyuge := FieldByName('PRIMER_APELLIDO_CONYUGE').AsString;
               EdPrimerApellidoConyuge.Text := vPrimerApellidoConyuge;
               vSegundoApellidoConyuge := FieldByName('SEGUNDO_APELLIDO_CONYUGE').AsString;
               EdSegundoApellidoConyuge.Text := vSegundoApellidoConyuge;
               vNombreConyuge := FieldByName('NOMBRE_CONYUGE').AsString;
               EdNombreConyuge.Text := vNombreConyuge;
               vIngresosConyuge := FieldByName('INGRESOS_CONYUGE').AsCurrency;
               EdIngresosConyuge.Text := FormatCurr('#,##0.00',vIngresosConyuge);
               vOtrosIngresosConyuge := FieldByName('INGRESOS_CONYUGE_OTROS').AsCurrency;
               EdOtrosIngresosConyuge.Text := FormatCurr('#,##0.00',vOtrosIngresosConyuge);
               vEgresosConyuge := FieldByName('EGRESOS_CONYUGE').AsCurrency;
               EdEgresosConyuge.Text := FormatCurr('#,#0.00',vEgresosConyuge);
               vOtrosEgresosConyuge := FieldByName('OTROS_EGRESOS_CONYUGE').AsCurrency;
               EdOtrosEgresosConyuge.Text := FormatCurr('#,#0.00',vOtrosEgresosConyuge);
               vProfesion := FieldByName('PROFESION').AsString;
               EdProfesion.Text := vProfesion;
               vTipoIdentificacionApoderado := FieldByName('ID_IDENTIFICACION_APODERADO').AsInteger;
               CBTipoIdentificacionApoderado.KeyValue := vTipoIdentificacionApoderado;
               vNumeroIdentificacionApoderado :=  FieldByName('ID_APODERADO').AsString;
               EdNumeroIdentificacionApoderado.Text := vNumeroIdentificacionApoderado;
               vPrimerApellidoApoderado := FieldByName('PRIMER_APELLIDO_APODERADO').AsString;
               EdPrimerApellidoApoderado.Text := vPrimerApellidoApoderado;
               vSegundoApellidoApoderado := FieldByName('SEGUNDO_APELLIDO_APODERADO').AsString;
               EdSegundoApellidoApoderado.Text := vSegundoApellidoApoderado;
               vNombreApoderado := FieldByName('NOMBRE_APODERADO').AsString;
               EdNombreApoderado.Text := vNombreApoderado;
               vEmpresa := FieldByName('EMPRESA_LABORA').AsString;
               EdEmpresa.Text := vEmpresa;
               vCargo := FieldByName('CARGO_ACTUAL').AsString;
               EdCargo.Text := vCargo;
               vFechaIngreso := FieldByName('FECHA_INGRESO_EMPRESA').AsDateTime;
               EdFechaIngreso.Date := vFechaIngreso;
               vReteFuente := FieldByName('RETEFUENTE').AsInteger;
               EdRetefuente.Checked := IntToBoolean(vReteFuente);
               vTotalActivos := FieldByName('TOTAL_ACTIVOS').AsCurrency;
               EdTotalActivos.Text := FormatCurr('#,#0.00',vTotalActivos);
               vTotalPasivos := FieldByName('TOTAL_PASIVOS').AsCurrency;
               EdTotalPasivos.Text := FormatCurr('#,#0.00',vTotalPasivos);
               vDeclaracion := FieldByName('DECLARACION').AsString;
               EdDeclaracion.Text := vDeclaracion;
               vIngresos := FieldByName('INGRESOS_A_PRINCIPAL').AsCurrency;
               EdIngresos.Text := FormatCurr('#,#0.00',vIngresos);
               vOtrosIngresos := FieldByName('INGRESOS_OTROS').AsCurrency;
               EdOtrosIngresos.Text := FormatCurr('#,#0.00',vOtrosIngresos);
               vDescripcionIngresos := FieldByName('DESC_INGR_OTROS').AsString;
               EdDescripcionIngresosConyuge.Text := vDescripcionIngresos;
               vEgresosArriendo := FieldByName('EGRESOS_ALQUILER').AsCurrency;
               EdEgresosArriendo.Text := FormatCurr('#,#0.00',vEgresosArriendo);
               vEgresosTransporte := FieldByName('EGRESOS_TRANSPORTE').AsCurrency;
               EdEgresosTransporte.Text := FormatCurr('#,#0.00',vEgresosTransporte);
               vEgresosServicios := FieldByName('EGRESOS_SERVICIOS').AsCurrency;
               EdEgresosServicios.Text := FormatCurr('#,#0.00',vEgresosServicios);
               vEgresosAlimentos := FieldByName('EGRESOS_ALIMENTACION').AsCurrency;
               EdEgresosAlimentos.Text := FormatCurr('#,#0.00',vEgresosAlimentos);
               vEgresosDeudas := FieldByName('EGRESOS_DEUDAS').AsCurrency;
               EdEgresosDeudas.Text := FormatCurr('#,#0.00',vEgresosDeudas);
               vEgresosOtros := FieldByName('EGRESOS_OTROS').AsCurrency;
               EdEgresosOtros.Text := FormatCurr('#,#0.00',vEgresosOtros);
               try
                 ImgFotoC.Picture.Bitmap.Assign(FieldByName('FOTO'));
                 ImgFotoC.Picture.Bitmap.Dormant;
                 ImgFotoC.Picture.Bitmap.FreeImage;
               except
                 Bitmap := nil;
                 try
                    Bitmap := TBitmap.Create;
                    Bitmap.Width := 135;
                    Bitmap.Height := 135;
                    ImgFotoC.Picture.Graphic := Bitmap;
                 finally
                    Bitmap.Free;
                 end;
               end;
               try
                 ImgHuellaC.Picture.Bitmap.Assign(FieldByName('FOTO_HUELLA'));
                 ImgHuellaC.Picture.Bitmap.Dormant;
                 ImgHuellaC.Picture.Bitmap.FreeImage;
               except
                 Bitmap := nil;
                 try
                    Bitmap := TBitmap.Create;
                    Bitmap.Width := 135;
                    Bitmap.Height := 135;
                    ImgHuellaC.Picture.Graphic := Bitmap;
                 finally
                    Bitmap.Free;
                 end;
               end;
               try
                 ImgFirmaC.Picture.Bitmap.Assign(FieldByName('FIRMA'));
                 ImgFirmaC.Picture.Bitmap.Dormant;
                 ImgFirmaC.Picture.Bitmap.FreeImage;
               except
                 Bitmap := nil;
                 try
                    Bitmap := TBitmap.Create;
                    Bitmap.Width := 320;
                    Bitmap.Height := 142;
                    ImgFirmaC.Picture.Graphic := Bitmap;
                   finally
                    Bitmap.Free;
                  end;
               end;
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$direccion" where ');
            SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ');
            SQL.Add('ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
            ParamByName('ID_PERSONA').AsString := vIdentificacion;
            Open;
            if RecordCount > 0 then
            begin
                Last;
                First;
                while not eof do
                begin
                   New(ARecordD);
                   ARecordD^.TipoDireccion := FieldByName('ID_DIRECCION').AsInteger;
                   ARecordD^.Direccion := FieldByName('DIRECCION').AsString;
                   ARecordD^.Barrio := FieldByName('BARRIO').AsString;
                   ARecordD^.Municipio := FieldByName('MUNICIPIO').AsString;
                   ARecordD^.Telefono1 := FieldByName('TELEFONO1').AsString;
                   ARecordD^.Telefono2 := FieldByName('TELEFONO2').AsString;
                   ARecordD^.Telefono3 := FieldByName('TELEFONO3').AsString;
                   ARecordD^.Telefono4 := FieldByName('TELEFONO4').AsString;
                   vListaDirecciones.Add(ARecordD);
                   Next;
                end;
            ActualizarGridDireccion;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$referencias" where ');
            SQL.Add('TIPO_ID_REFERENCIA = :"ID_TIPO_DOCUMENTO" and ');
            SQL.Add('ID_REFERENCIA = :"ID_PERSONA"');
            ParamByName('ID_TIPO_DOCUMENTO').AsInteger := vTipoIdentificacion;
            ParamByName('ID_PERSONA').AsString := vIdentificacion;
            Open;
            if RecordCount > 0 then
            begin
                Last;
                First;
                while not eof do
                begin
                    New(ARecordR);
                    ARecordR^.TipoReferencia := FieldByName('TIPO_REFERENCIA').AsInteger;
                    ARecordR^.PrimerApellido := FieldByName('PRIMER_APELLIDO_REFERENCIA').AsString;
                    ARecordR^.SegundoApellido := FieldByName('SEGUNDO_APELLIDO_REFERENCIA').AsString;
                    ARecordR^.Nombre := FieldByName('NOMBRE_REFERENCIA').AsString;
                    ARecordR^.Direccion := FieldByName('DIRECCION_REFERENCIA').AsString;
                    ARecordR^.Telefono := FieldByName('TELEFONO_REFERENCIA').AsString;
                    ARecordR^.Parentesco := FieldByName('PARENTESCO_REFERENCIA').AsInteger;
                    vListaReferencia.Add(ARecordR);
                    Next;
                end;
            ActualizarGridReferencia;
            end;
            vModificar := true;
            CBTiposIdentificacion.Enabled := False;
            EdIdentificacion.Enabled := False;
            end
            else
            begin
               vModificar := false;
            end;
        Close;
        end;
end;

procedure TfrmCreacionPersona.CBtipopersonaEnter(Sender: TObject);
begin
        CBtipopersona.KeyValue := vTipoPersona;
        CBtipopersona.DropDown;
end;

procedure TfrmCreacionPersona.CBsexoEnter(Sender: TObject);
begin
        if vSexo = 'F' then
           CBsexo.ItemIndex := 0
        else
           CBsexo.ItemIndex := 1;
end;

procedure TfrmCreacionPersona.CBsexoExit(Sender: TObject);
begin
        vSexo := LeftStr(CBsexo.Text,1);
end;

procedure TfrmCreacionPersona.CBestadocivilEnter(Sender: TObject);
begin
        CBestadocivil.KeyValue := vEstadoCivil;
        CBestadocivil.DropDown;
end;

procedure TfrmCreacionPersona.CBestadocivilExit(Sender: TObject);
begin
        vEstadoCivil := CBestadocivil.KeyValue;
{        with dmPersona.IBDSestadocivil do
        begin
           if Locate('ID_TIPO_ESTADO_CIVIL',VarArrayOf([vEstadoCivil]),[loCaseInsensitive]) then
              if FieldByName('CONYUGE_ESTADO_CIVIL').AsInteger = 1 then
              begin
                 InfoConyuge.TabVisible := true;
                 PageControl.ActivePageIndex := 0;
              end
              else
                 InfoConyuge.TabVisible := false;
        end;}
end;

procedure TfrmCreacionPersona.EdFechaNacimientoExit(Sender: TObject);
begin
        vFechaNacimiento := EdFechaNacimiento.Date;
end;

procedure TfrmCreacionPersona.EdLugarNacimientoEnter(Sender: TObject);
begin
        EdLugarNacimiento.Text := vLugarNacimiento;
        EdLugarNacimiento.SelectAll;
end;

procedure TfrmCreacionPersona.EdLugarNacimientoExit(Sender: TObject);
begin
        vLugarNacimiento := EdLugarNacimiento.Text;
end;

procedure TfrmCreacionPersona.EdProvinciaNacimientoEnter(Sender: TObject);
begin
        EdProvinciaNacimiento.Text := vProvinciaNacimiento;
        EdProvinciaNacimiento.SelectAll;
end;

procedure TfrmCreacionPersona.EdProvinciaNacimientoExit(Sender: TObject);
begin
        vProvinciaNacimiento:=EdProvinciaNacimiento.Text;
end;

procedure TfrmCreacionPersona.EdDepartamentoNacimientoEnter(
  Sender: TObject);
begin
        EdDepartamentoNacimiento.Text := vDepartamentoNacimiento;
        EdDepartamentoNacimiento.SelectAll;
end;

procedure TfrmCreacionPersona.EdDepartamentoNacimientoExit(
  Sender: TObject);
begin
        vDepartamentoNacimiento := EdDepartamentoNacimiento.Text;
end;

procedure TfrmCreacionPersona.EdPaisNacimientoEnter(Sender: TObject);
begin
        EdPaisNacimiento.Text := vPaisNacimiento;
end;

procedure TfrmCreacionPersona.EdPaisNacimientoExit(Sender: TObject);
begin
        vPaisNacimiento := EdPaisNacimiento.Text;
end;

procedure TfrmCreacionPersona.CBciiuEnter(Sender: TObject);
begin
        CBciiu.KeyValue := vCiiu;
        CBciiu.DropDown;
end;

procedure TfrmCreacionPersona.CBciiuExit(Sender: TObject);
begin
        vCiiu := CBciiu.KeyValue;
end;

procedure TfrmCreacionPersona.CBtiposrelacionEnter(Sender: TObject);
begin
        CBtiposrelacion.KeyValue := vTipoAfiliacion;
end;

procedure TfrmCreacionPersona.CBtiposrelacionExit(Sender: TObject);
begin
        vTipoAfiliacion := CBtiposrelacion.KeyValue;

        with dmPersona.IBDSestadocivil do
        begin
           if Locate('ID_TIPO_ESTADO_CIVIL',VarArrayOf([vEstadoCivil]),[loCaseInsensitive]) then
              if FieldByName('CONYUGE_ESTADO_CIVIL').AsInteger = 1 then
              begin
                 InfoConyuge.TabVisible := true;
                 PageControl.ActivePageIndex := 0;
                 CBtipoidentificacionconyuge.SetFocus;
              end
              else
              begin
                 InfoConyuge.TabVisible := false;
                 PageControl.ActivePageIndex := 1;
                 EdProfesion.SetFocus;
              end;
        end;
        Application.ProcessMessages;
//        PageControl.ActivePageIndex := 0;
//        CBtipoidentificacionconyuge.SetFocus;
end;

procedure TfrmCreacionPersona.CBtipoidentificacionconyugeExit(
  Sender: TObject);
begin
        vTipoIdentificacionConyuge := CBtipoidentificacionconyuge.KeyValue;
end;

procedure TfrmCreacionPersona.EdNumeroIdentificacionConyugeEnter(
  Sender: TObject);
begin
        EdNumeroIdentificacionConyuge.Text := vNumeroIdentificacionConyuge;
        EdNumeroIdentificacionConyuge.SelectAll;
end;

procedure TfrmCreacionPersona.EdNumeroIdentificacionConyugeExit(
  Sender: TObject);
begin
        vNumeroIdentificacionConyuge := EdNumeroIdentificacionConyuge.Text;
end;

procedure TfrmCreacionPersona.EdPrimerApellidoEnter(Sender: TObject);
begin
        EdPrimerApellido.Text := vPrimerApellido;
        EdPrimerApellido.SelectAll;
end;

procedure TfrmCreacionPersona.EdPrimerApellidoExit(Sender: TObject);
begin
        vPrimerApellido := EdPrimerApellido.Text;
end;

procedure TfrmCreacionPersona.EdSegundoApellidoEnter(Sender: TObject);
begin
        EdSegundoApellido.Text := vSegundoApellido;
        EdSegundoApellido.SelectAll;
end;

procedure TfrmCreacionPersona.EdSegundoApellidoExit(Sender: TObject);
begin
        vSegundoApellido := EdSegundoApellido.Text;
end;

procedure TfrmCreacionPersona.EdNombresEnter(Sender: TObject);
begin
        EdNombres.Text := vNombres;
        EdNombres.SelectAll;
end;

procedure TfrmCreacionPersona.EdNombresExit(Sender: TObject);
begin
        vNombres := EdNombres.Text;
end;

procedure TfrmCreacionPersona.CBtipopersonaExit(Sender: TObject);
begin
        vTipoPersona := CBtipopersona.KeyValue;
        with dmPersona.IBDStipopersona do
        begin
           if Locate('ID_TIPO_PERSONA',VarArrayOf([vTipoPersona]),[loCaseInsensitive]) then
              if FieldByName('SEXO').AsInteger <> 0 then
              begin
                CBsexo.Enabled := true;
                CBsexo.TabStop := true;
                CBestadocivil.Enabled := true;
                CBestadocivil.TabStop := true;
                CBsexo.SetFocus;
                InfoConyuge.TabVisible := true;
                InfoConyuge.Enabled := true;
                InfoConyuge.TabStop := true;
                PageControl.ActivePageIndex := 0;
              end
              else
              begin
                CBsexo.Enabled := false;
                CBsexo.TabStop := false;
                CBestadocivil.Enabled := false;
                CBestadocivil.TabStop := false;
                InfoConyuge.TabVisible := false;
                InfoConyuge.Enabled := false;
                InfoConyuge.TabStop := false;
                EdFechaNacimiento.SetFocus;
              end;
        end;
end;

procedure TfrmCreacionPersona.EdPrimerApellidoConyugeEnter(
  Sender: TObject);
begin
        EdPrimerApellidoConyuge.Text := vPrimerApellidoConyuge;
        EdPrimerApellidoConyuge.SelectAll;
end;
                         
procedure TfrmCreacionPersona.EdPrimerApellidoConyugeExit(Sender: TObject);
begin
        vPrimerApellidoConyuge := EdPrimerApellidoConyuge.Text;
end;

procedure TfrmCreacionPersona.EdSegundoApellidoConyugeEnter(
  Sender: TObject);
begin
        EdSegundoApellidoConyuge.Text := vSegundoApellidoConyuge;
        EdSegundoApellidoConyuge.SelectAll;
end;

procedure TfrmCreacionPersona.EdSegundoApellidoConyugeExit(
  Sender: TObject);
begin
        vSegundoApellidoConyuge := EdSegundoApellidoConyuge.Text;
end;

procedure TfrmCreacionPersona.EdNombreConyugeEnter(Sender: TObject);
begin
        EdNombreConyuge.Text := vNombreConyuge;
        EdNombreConyuge.SelectAll;
end;

procedure TfrmCreacionPersona.EdNombreConyugeExit(Sender: TObject);
begin
        vNombreConyuge := EdNombreConyuge.Text;
end;

procedure TfrmCreacionPersona.EdIngresosConyugeKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmCreacionPersona.EdIngresosConyugeEnter(Sender: TObject);
begin
        EdIngresosConyuge.Text := FormatCurr('0.00',vIngresosConyuge);
        EdIngresosConyuge.SelectAll;
end;

procedure TfrmCreacionPersona.EdIngresosConyugeExit(Sender: TObject);
begin
        if EdIngresosConyuge.Text = '' then EdIngresosConyuge.Text := '0.00';
        vIngresosConyuge := StrToFloat(EdIngresosConyuge.Text);
        EdIngresosConyuge.Text := FormatCurr('#,##0.00',vIngresosConyuge);
end;

procedure TfrmCreacionPersona.EdOtrosIngresosConyugeKeyPress(
  Sender: TObject; var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdOtrosIngresosConyugeEnter(Sender: TObject);
begin
        EdOtrosIngresosConyuge.Text := FormatCurr('0.00',vOtrosIngresosConyuge);
        EdOtrosIngresosConyuge.SelectAll;    
end;

procedure TfrmCreacionPersona.EdOtrosIngresosConyugeExit(Sender: TObject);
begin
        if EdOtrosIngresosConyuge.Text = '' then EdOtrosIngresosConyuge.Text := '0.00';
        vOtrosIngresosConyuge := StrToFloat(EdOtrosIngresosConyuge.Text);
        EdOtrosIngresosConyuge.Text := FormatCurr('#,##0.00',vOtrosIngresosConyuge);

end;

procedure TfrmCreacionPersona.EdEgresosConyugeKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdEgresosConyugeEnter(Sender: TObject);
begin
        EdEgresosConyuge.Text := FormatCurr('0.00',vEgresosConyuge);
        EdEgresosConyuge.SelectAll;
end;

procedure TfrmCreacionPersona.EdEgresosConyugeExit(Sender: TObject);
begin
        if EdEgresosConyuge.Text = '' then EdEgresosConyuge.Text := '0.00';
        vEgresosConyuge := StrToFloat(EdEgresosConyuge.Text);
        EdEgresosConyuge.Text := FormatCurr('#,##0.00',vEgresosConyuge);
end;

procedure TfrmCreacionPersona.EdOtrosEgresosConyugeKeyPress(
  Sender: TObject; var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdOtrosEgresosConyugeEnter(Sender: TObject);
begin
        EdOtrosEgresosConyuge.Text := FormatCurr('0.00',vOtrosEgresosConyuge);
        EdOtrosEgresosConyuge.SelectAll;
end;

procedure TfrmCreacionPersona.EdOtrosEgresosConyugeExit(Sender: TObject);
begin
        if EdOtrosEgresosConyuge.Text = '' then EdOtrosEgresosConyuge.Text := '0.00';
        vOtrosEgresosConyuge := StrToFloat(EdOtrosEgresosConyuge.Text);
        EdOtrosEgresosConyuge.Text := FormatCurr('#,##0.00',vOtrosEgresosConyuge);
        PageControl.ActivePageIndex := 1;
        EdProfesion.SetFocus;
end;

procedure TfrmCreacionPersona.EdDescripcionIngresosConyugeEnter(
  Sender: TObject);
begin
        EdDescripcionIngresosConyuge.Text := vDescripcionIngresos;
        EdDescripcionIngresosConyuge.SelectAll;
end;

procedure TfrmCreacionPersona.EdProfesionEnter(Sender: TObject);
begin
        EdProfesion.Text := vProfesion;
        EdProfesion.SelectAll;
end;

procedure TfrmCreacionPersona.EdProfesionExit(Sender: TObject);
begin
        vProfesion := EdProfesion.Text;
end;

procedure TfrmCreacionPersona.EdEmpresaEnter(Sender: TObject);
begin
        EdEmpresa.Text := vEmpresa;
        EdEmpresa.SelectAll;
end;

procedure TfrmCreacionPersona.EdEmpresaExit(Sender: TObject);
begin
        vEmpresa := EdEmpresa.Text;
end;

procedure TfrmCreacionPersona.EdCargoEnter(Sender: TObject);
begin
        EdCargo.Text := vCargo;
        EdCargo.SelectAll;
end;

procedure TfrmCreacionPersona.EdCargoExit(Sender: TObject);
begin
        vCargo := EdCargo.Text;
end;

procedure TfrmCreacionPersona.EdFechaIngresoEnter(Sender: TObject);
begin
        EdFechaIngreso.Date := vFechaIngreso;
end;

procedure TfrmCreacionPersona.EdFechaIngresoExit(Sender: TObject);
begin
        vFechaIngreso := EdFechaIngreso.Date;
end;

procedure TfrmCreacionPersona.EdRetefuenteEnter(Sender: TObject);
begin
        case vRetefuente of
        0: EdRetefuente.Checked := false;
        1: EdRetefuente.Checked := true;
        end;
end;

procedure TfrmCreacionPersona.EdRetefuenteExit(Sender: TObject);
begin
              if EdRetefuente.Checked then
                 vRetefuente := 1
              else
                 vRetefuente := 0;
end;

procedure TfrmCreacionPersona.EdDeclaracionEnter(Sender: TObject);
begin
        EdDeclaracion.Text := vDeclaracion;
        EdDeclaracion.SelectAll;
end;

procedure TfrmCreacionPersona.EdDeclaracionExit(Sender: TObject);
begin
        vDeclaracion := EdDeclaracion.Text;
end;

procedure TfrmCreacionPersona.EdingresosKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdingresosEnter(Sender: TObject);
begin
        Edingresos.Text := FormatCurr('0.00',vIngresos);
        EdIngresos.SelectAll;
end;

procedure TfrmCreacionPersona.EdingresosExit(Sender: TObject);
begin
        if EdIngresos.Text = '' then EdIngresos.Text := '0.00';
        vIngresos := StrToFloat(EdIngresos.Text);
        EdIngresos.Text := FormatCurr('#,0.00',vIngresos);
end;

procedure TfrmCreacionPersona.EdOtrosIngresosKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdOtrosIngresosEnter(Sender: TObject);
begin
        EdOtrosIngresos.Text := FormatCurr('0.00',vOtrosIngresos);
        EdOtrosIngresos.SelectAll;
end;

procedure TfrmCreacionPersona.EdOtrosIngresosExit(Sender: TObject);
begin
        if EdOtrosIngresos.Text = '' then EdOtrosIngresos.Text := '0.00';
        vOtrosIngresos := StrToFloat(EdOtrosIngresos.Text);
        EdOtrosIngresos.Text := FormatCurr('#,0.00',vOtrosIngresos);
end;

procedure TfrmCreacionPersona.EdEgresosArriendoKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdEgresosArriendoEnter(Sender: TObject);
begin
        EdEgresosArriendo.Text := FormatCurr('0.00',vEgresosArriendo);
        EdEgresosArriendo.SelectAll;
end;

procedure TfrmCreacionPersona.EdEgresosArriendoExit(Sender: TObject);
begin
        if EdEgresosArriendo.Text = '' then EdEgresosArriendo.Text := '0.00';
        vEgresosArriendo := StrToFloat(EdEgresosArriendo.Text);
        EdEgresosArriendo.Text := FormatCurr('#,0.00',vEgresosArriendo);
end;

procedure TfrmCreacionPersona.EdEgresosTransporteKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdEgresosTransporteEnter(Sender: TObject);
begin
        EdEgresosTransporte.Text := FormatCurr('0.00',vEgresosTransporte);
        EdEgresosTransporte.SelectAll;
end;

procedure TfrmCreacionPersona.EdEgresosTransporteExit(Sender: TObject);
begin
        if EdEgresosTransporte.Text = '' then EdEgresosTransporte.Text := '0.00';
        vEgresosTransporte := StrToFloat(EdEgresosTransporte.Text);
        EdEgresosTransporte.Text := FormatCurr('#,0.00',vEgresosTransporte);
end;

procedure TfrmCreacionPersona.EdEgresosServiciosKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdEgresosServiciosEnter(Sender: TObject);
begin
        EdEgresosServicios.Text := FormatCurr('0.00',vEgresosServicios);
        EdEgresosServicios.SelectAll;
end;

procedure TfrmCreacionPersona.EdEgresosServiciosExit(Sender: TObject);
begin
        if EdEgresosServicios.Text = '' then EdEgresosServicios.Text := '0.00';
        vEgresosServicios := StrToFloat(EdEgresosServicios.Text);
        EdEgresosServicios.Text := FormatCurr('#,0.00',vEgresosServicios);
end;

procedure TfrmCreacionPersona.EdEgresosAlimentosKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdEgresosAlimentosEnter(Sender: TObject);
begin
        EdEgresosAlimentos.Text := FormatCurr('0.00',vEgresosAlimentos);
        EdEgresosAlimentos.SelectAll;
end;

procedure TfrmCreacionPersona.EdEgresosAlimentosExit(Sender: TObject);
begin
        if EdEgresosAlimentos.Text = '' then EdEgresosAlimentos.Text := '0.00';
        vEgresosAlimentos := StrToFloat(EdEgresosAlimentos.Text);
        EdEgresosAlimentos.Text := FormatCurr('#,0.00',vEgresosAlimentos);
end;

procedure TfrmCreacionPersona.EdEgresosDeudasKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdEgresosDeudasEnter(Sender: TObject);
begin
        EdEgresosDeudas.Text := FormatCurr('0.00',vEgresosDeudas);
        EdEgresosDeudas.SelectAll;
end;

procedure TfrmCreacionPersona.EdEgresosDeudasExit(Sender: TObject);
begin
        if EdEgresosDeudas.Text = '' then EdEgresosDeudas.Text := '0.00';
        vEgresosDeudas := StrToFloat(EdEgresosDeudas.Text);
        EdEgresosDeudas.Text := FormatCurr('#,0.00',vEgresosDeudas);
end;

procedure TfrmCreacionPersona.EdEgresosOtrosKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Self,Key);
end;

procedure TfrmCreacionPersona.EdEgresosOtrosEnter(Sender: TObject);
begin
        EdEgresosOtros.Text := FormatCurr('0.00',vEgresosOtros);
        EdEgresosOtros.SelectAll;
end;

procedure TfrmCreacionPersona.EdEgresosOtrosExit(Sender: TObject);
begin
        if EdEgresosOtros.Text = '' then EdEgresosOtros.Text := '0.00';
        vEgresosOtros := StrToFloat(EdEgresosOtros.Text);
        EdEgresosOtros.Text := FormatCurr('#,0.00',vEgresosOtros);
        PageControl.ActivePageIndex := 2;
        CBtipodireccion.SetFocus;
end;

procedure TfrmCreacionPersona.EdTelefono1KeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
end;

procedure TfrmCreacionPersona.EdTelefono2KeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
end;

procedure TfrmCreacionPersona.EdTelefono3KeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
end;

procedure TfrmCreacionPersona.EdTelefono4KeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
end;

procedure TfrmCreacionPersona.EdTelefonoRefKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
end;

procedure TfrmCreacionPersona.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmCreacionPersona.EdTelefono4Exit(Sender: TObject);
begin
        CmdAgregarDir.SetFocus;
end;

procedure TfrmCreacionPersona.CmdAgregarDIRClick(Sender: TObject);
var ARecord:PListaDireccion;
begin
        if ( Not VarIsNull(CBtipodireccion.KeyValue) ) and
           ( EdDireccion.Text <> '' ) then
        begin
           New(ARecord);
           ARecord^.TipoDireccion := CBtipodireccion.KeyValue;
           ARecord^.Direccion := EdDireccion.Text;
           ARecord^.Barrio := EdBarrio.Text;
           ARecord^.Municipio := EdMunicipio.Text;
           ARecord^.Telefono1 := EdTelefono1.Text;
           ARecord^.Telefono2 := EdTelefono2.Text;
           ARecord^.Telefono3 := EdTelefono3.Text;
           ARecord^.Telefono4 := EdTelefono4.Text;
           vListaDirecciones.Add(ARecord);
           ActualizarGridDireccion;
           DirAct := -1;
           CmdLimpiarDirClick(Sender);
        end;

end;

procedure TfrmCreacionPersona.CmdAgregarREFClick(Sender: TObject);
var ARecord:PListaReferencia;
begin
        if ( Not VarIsNull(CBtiporeferencia.KeyValue)) and
           ( EdNombreRef.Text <> '' ) then
        begin
           New(ARecord);
           ARecord^.TipoReferencia := CBtiporeferencia.KeyValue;
           ARecord^.PrimerApellido := EdPrimerApellidoRef.Text;
           ARecord^.SegundoApellido := EdSegundoApellidoRef.Text;
           ARecord^.Nombre := EdNombreRef.Text;
           ARecord^.Parentesco := CBparentesco.KeyValue;
           ARecord^.Direccion := EdDireccionRef.Text;
           ARecord^.Telefono := EdTelefonoRef.Text;
           vListaReferencia.Add(ARecord);
           ActualizarGridReferencia;
           RefAct := -1;
           CmdLimpiarRefClick(Sender);
         end;

end;

procedure TfrmCreacionPersona.CBtipodireccionEnter(Sender: TObject);
begin
        CBtipodireccion.KeyValue := 1;
        CBtipodireccion.DropDown;
end;

procedure TfrmCreacionPersona.ActualizarGridDireccion;
var I:Integer;
    ARecord:PListaDireccion;
begin
           with vListaDirecciones do
           begin
            if Count > 0 then
              GridDireccion.RowCount := Count;
              for I := 0 to (Count - 1) do
              begin
                ARecord := Items[I];
                GridDireccion.Cells[0,I] := IntToStr(ARecord^.TipoDireccion);
                GridDireccion.Cells[1,I] := ARecord^.Direccion;
                GridDireccion.Cells[2,I] := ARecord^.Barrio ;
                GridDireccion.Cells[3,I] := ARecord^.Municipio;
                GridDireccion.Cells[4,I] := ARecord^.Telefono1;
                GridDireccion.Cells[5,I] := ARecord^.Telefono2;
                GridDireccion.Cells[6,I] := ARecord^.Telefono3;
                GridDireccion.Cells[7,I] := ARecord^.Telefono4;
              end;
            end;
end;

procedure TfrmCreacionPersona.CmdLimpiarDIRClick(Sender: TObject);
begin
        CBtipodireccion.KeyValue := -1;
        EdDireccion.Text := '';
        EdBarrio.Text := '';
        EdMunicipio.Text := '';
        EdTelefono1.Text := '';
        EdTelefono2.Text := '';
        EdTelefono3.Text := '';
        EdTelefono4.Text := '';
        CBtipodireccion.SetFocus;
end;

procedure TfrmCreacionPersona.GridDireccionSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var ARecord:PListaDireccion;
begin
        DirAct := ARow;
        CanSelect := true;
        ARecord := vListaDirecciones.Items[DirAct];
        CBtipodireccion.KeyValue := ARecord^.TipoDireccion;
        EdDireccion.Text := ARecord^.Direccion ;
        EdBarrio.Text := ARecord^.Barrio ;
        EdMunicipio.Text := ARecord^.Municipio;
        EdTelefono1.Text := ARecord^.Telefono1;
        EdTelefono2.Text := ARecord^.Telefono2;
        EdTelefono3.Text := ARecord^.Telefono3;
        EdTelefono4.Text := ARecord^.Telefono4;
        CmdEliminarDir.Enabled := true;
end;

procedure TfrmCreacionPersona.GridReferenciaSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var ARecord:PListaReferencia;
begin
        RefAct := ARow;
        CanSelect := true;
        ARecord := vListaReferencia.Items[RefAct];
        CBtiporeferencia.KeyValue := ARecord^.TipoReferencia ;
        EdPrimerApellidoRef.Text := ARecord^.PrimerApellido ;
        EdSegundoApellidoRef.Text := ARecord^.SegundoApellido ;
        EdNombreRef.Text := ARecord^.Nombre ;
        EdDireccionRef.Text := ARecord^.Direccion ;
        EdTelefonoRef.Text := ARecord^.Telefono ;
        CmdEliminarRef.Enabled := true;
end;

procedure TfrmCreacionPersona.CmdModificarDIRClick(Sender: TObject);
var ARecord:PListaDireccion;
begin
         if DirAct <> -1 then
         begin
           ARecord := vListaDirecciones.Items[DirAct];
           ARecord^.TipoDireccion := CBtipodireccion.KeyValue;
           ARecord^.Direccion := EdDireccion.Text;
           ARecord^.Barrio := EdBarrio.Text;
           ARecord^.Municipio := EdMunicipio.Text;
           ARecord^.Telefono1 := EdTelefono1.Text;
           ARecord^.Telefono2 := EdTelefono2.Text;
           ARecord^.Telefono3 := EdTelefono3.Text;
           ARecord^.Telefono4 := EdTelefono4.Text;
           vListaDirecciones.Items[DirAct] := ARecord;
           ActualizarGridDireccion;
           DirAct := -1;
           CmdLimpiarDirClick(Sender);
         end;

end;

procedure TfrmCreacionPersona.CmdEliminarDIRClick(Sender: TObject);
var ARecord:PListaDireccion;
begin
        if DirAct <> -1 then
        begin
                ARecord := vListaDirecciones.Items[DirAct];
                vListaDirecciones.Remove(ARecord);
                vListaDirecciones.Pack;
                ActualizarGridDireccion;
                DirAct := -1;
                CmdLimpiarDirClick(Sender);
                CmdEliminarDir.Enabled := false;
        end;
end;

procedure TfrmCreacionPersona.CmdLimpiarREFClick(Sender: TObject);
begin
        RefAct := -1;
        CBtiporeferencia.KeyValue := -1;
        EdPrimerApellidoRef.Text := '';
        EdSegundoApellidoRef.Text := '';
        EdNombreRef.Text := '';
        EdDireccionRef.Text := '';
        EdTelefonoRef.Text := '';
        CBtiporeferencia.SetFocus;
end;

procedure TfrmCreacionPersona.CmdModificarREFClick(Sender: TObject);
var ARecord:PListaReferencia;
begin
        if RefAct <> -1 then
        begin
           ARecord := vListaReferencia.Items[RefAct];
           ARecord^.TipoReferencia := CBtiporeferencia.KeyValue;
           ARecord^.PrimerApellido := EdPrimerApellidoRef.Text;
           ARecord^.SegundoApellido := EdSegundoApellidoRef.Text;
           ARecord^.Nombre := EdNombreRef.Text;
           ARecord^.Parentesco := CBparentesco.KeyValue;
           ARecord^.Direccion := EdDireccionRef.Text;
           ARecord^.Telefono := EdTelefonoRef.Text;
           ActualizarGridReferencia;
        end;
end;

procedure TfrmCreacionPersona.ActualizarGridReferencia;
var ARecord:PListaReferencia;
    I:integer;
begin
           with vListaReferencia do
           begin
            if Count > 0 then
              GridReferencia.RowCount := Count;
              for I := 0 to (Count - 1) do
              begin
                ARecord := Items[I];
                GridReferencia.Cells[0,I] := IntToStr(ARecord^.TipoReferencia);
                GridReferencia.Cells[1,I] := ARecord^.PrimerApellido;
                GridReferencia.Cells[2,I] := ARecord^.SegundoApellido;
                GridReferencia.Cells[3,I] := ARecord^.Nombre;
                GridReferencia.Cells[4,I] := ARecord^.Direccion;
                GridReferencia.Cells[5,I] := ARecord^.Telefono;
              end;
           end;
end;

procedure TfrmCreacionPersona.EdTelefonoRefExit(Sender: TObject);
begin
        CmdAgregarREF.SetFocus;
end;

procedure TfrmCreacionPersona.CmdEliminarREFClick(Sender: TObject);
var ARecord:PListaReferencia;
begin
        if RefAct <> -1 then
        begin
           ARecord := vListaReferencia.Items[RefAct];
           vListaReferencia.Remove(ARecord);
           vListaReferencia.Pack;
           RefAct := -1;
           ActualizarGridReferencia;
           CmdLimpiarRefClick(Sender);
           CmdEliminarRef.Enabled := false;
        end;
end;

procedure TfrmCreacionPersona.CmdGrabarClick(Sender: TObject);
begin
      if vModificar then
       begin
         if Actualizar then
            MessageDlg('Registro Actualizado Correctamente',mtInformation,[mbOK],0)
         else
            MessageDlg('Registro No Se Actualizo',mtError,[mbOK],0);
       end
      else
       begin
         if Grabar then
            MessageDlg('Registro Grabado Correctamente!',mtInformation,[mbOK],0)
         else
            MessageDlg('Registro No Se Grabó',mtError,[mbOK],0);
       end;
end;

procedure TfrmCreacionPersona.CBparentescoEnter(Sender: TObject);
begin
        CBparentesco.DropDown;
end;

function TfrmCreacionPersona.Grabar: Boolean;
var I:integer;
    ARecordD:PListaDireccion;
    ARecordR:PListaReferencia;
    BS1:TMemoryStream;
    BS2:TMemoryStream;
    BS3:TMemoryStream;
begin
      with dmPersona.IBQuery1 do
      try
           SQL.Clear;
           SQL.Add('insert into "gen$persona" ("gen$persona"."ID_IDENTIFICACION", "gen$persona"."ID_PERSONA",');
           SQL.Add('"gen$persona"."LUGAR_EXPEDICION", "gen$persona"."FECHA_EXPEDICION", "gen$persona"."NOMBRE",');
           SQL.Add('"gen$persona"."PRIMER_APELLIDO", "gen$persona"."SEGUNDO_APELLIDO", "gen$persona"."ID_TIPO_PERSONA",');
           SQL.Add('"gen$persona"."SEXO", "gen$persona"."FECHA_NACIMIENTO", "gen$persona"."LUGAR_NACIMIENTO",');
           SQL.Add('"gen$persona"."PROVINCIA_NACIMIENTO", "gen$persona"."DEPTO_NACIMIENTO",');
           SQL.Add('"gen$persona"."PAIS_NACIMIENTO", "gen$persona"."ID_TIPO_ESTADO_CIVIL",');
           SQL.Add('"gen$persona"."ID_CONYUGE", "gen$persona"."ID_IDENTIFICACION_CONYUGE",');
           SQL.Add('"gen$persona"."NOMBRE_CONYUGE", "gen$persona"."PRIMER_APELLIDO_CONYUGE",');
           SQL.Add('"gen$persona"."SEGUNDO_APELLIDO_CONYUGE", "gen$persona"."PROFESION",');
           SQL.Add('"gen$persona"."ID_APODERADO", "gen$persona"."ID_IDENTIFICACION_APODERADO", "gen$persona"."NOMBRE_APODERADO",');
           SQL.Add('"gen$persona"."PRIMER_APELLIDO_APODERADO", "gen$persona"."SEGUNDO_APELLIDO_APODERADO",');
           SQL.Add('"gen$persona"."ID_ESTADO", "gen$persona"."ID_TIPO_RELACION", "gen$persona"."ID_CIIU",');
           SQL.Add('"gen$persona"."EMPRESA_LABORA", "gen$persona"."FECHA_INGRESO_EMPRESA",');
           SQL.Add('"gen$persona"."CARGO_ACTUAL", "gen$persona"."DECLARACION", "gen$persona"."INGRESOS_A_PRINCIPAL",');
           SQL.Add('"gen$persona"."INGRESOS_OTROS", "gen$persona"."INGRESOS_CONYUGE", "gen$persona"."INGRESOS_CONYUGE_OTROS",');
           SQL.Add('"gen$persona"."DESC_INGR_OTROS", "gen$persona"."EGRESOS_ALQUILER", "gen$persona"."EGRESOS_SERVICIOS",');
           SQL.Add('"gen$persona"."EGRESOS_TRANSPORTE", "gen$persona"."EGRESOS_ALIMENTACION",');
           SQL.Add('"gen$persona"."EGRESOS_DEUDAS", "gen$persona"."EGRESOS_OTROS","gen$persona"."DESC_EGRE_OTROS",');
           SQL.Add('"gen$persona"."EGRESOS_CONYUGE","gen$persona"."OTROS_EGRESOS_CONYUGE",');
           SQL.Add('"gen$persona"."TOTAL_ACTIVOS","gen$persona"."TOTAL_PASIVOS",');
           SQL.Add('"gen$persona"."EDUCACION", "gen$persona"."RETEFUENTE", "gen$persona"."ACTA",');
           SQL.Add('"gen$persona"."FECHA_REGISTRO", "gen$persona"."ESCRITURA_CONSTITUCION",');
           SQL.Add('"gen$persona"."DURACION_SOCIEDAD", "gen$persona"."CAPITAL_SOCIAL",');
           SQL.Add('"gen$persona"."MATRICULA_MERCANTIL","gen$persona".FOTO,"gen$persona".FIRMA, "gen$persona".FOTO_HUELLA, "gen$persona".DATOS_HUELLA)');
           SQL.Add('values (');
           SQL.Add(':"ID_IDENTIFICACION", :"ID_PERSONA", :"LUGAR_EXPEDICION", :"FECHA_EXPEDICION", :"NOMBRE", :"PRIMER_APELLIDO",');
           SQL.Add(':"SEGUNDO_APELLIDO", :"ID_TIPO_PERSONA", :"SEXO", :"FECHA_NACIMIENTO",');
           SQL.Add(':"LUGAR_NACIMIENTO", :"PROVINCIA_NACIMIENTO", :"DEPTO_NACIMIENTO", :"PAIS_NACIMIENTO",');
           SQL.Add(':"ID_TIPO_ESTADO_CIVIL", :"ID_CONYUGE", :"ID_IDENTIFICACION_CONYUGE",');
           SQL.Add(':"NOMBRE_CONYUGE", :"PRIMER_APELLIDO_CONYUGE", :"SEGUNDO_APELLIDO_CONYUGE",');
           SQL.Add(':"PROFESION", :"ID_APODERADO", :"ID_IDENTIFICACION_APODERADO", :"NOMBRE_APODERADO",');
           SQL.Add(':"PRIMER_APELLIDO_APODERADO", :"SEGUNDO_APELLIDO_APODERADO",');
           SQL.Add(':"ID_ESTADO", :"ID_TIPO_RELACION", :"ID_CIIU", :"EMPRESA_LABORA",');
           SQL.Add(':"FECHA_INGRESO_EMPRESA", :"CARGO_ACTUAL", :"DECLARACION", :"INGRESOS_A_PRINCIPAL",');
           SQL.Add(':"INGRESOS_OTROS", :"INGRESOS_CONYUGE", :"INGRESOS_CONYUGE_OTROS", :"DESC_INGR_OTROS",');
           SQL.Add(':"EGRESOS_ALQUILER", :"EGRESOS_SERVICIOS", :"EGRESOS_TRANSPORTE", :"EGRESOS_ALIMENTACION",');
           SQL.Add(':"EGRESOS_DEUDAS", :"EGRESOS_OTROS", :"DESC_EGRE_OTROS",');
           SQL.Add(':"EGRESOS_CONYUGE",:"OTROS_EGRESOS_CONYUGE",');
           SQL.Add(':"TOTAL_ACTIVOS",:"TOTAL_PASIVOS",:"EDUCACION",');
           SQL.Add(':"RETEFUENTE", :"ACTA", :"FECHA_REGISTRO",');
           SQL.Add(':"ESCRITURA_CONSTITUCION", :"DURACION_SOCIEDAD",');
           SQL.Add(':"CAPITAL_SOCIAL", :"MATRICULA_MERCANTIL",:FOTO,:FIRMA,:FOTO_HUELLA,:DATOS_HUELLA)');

          if (vTipoIdentificacion = 4) or (vTipoIdentificacion = 7) then
           begin
             ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
             ParamByName('ID_PERSONA').AsString := vIdentificacion;
             ParamByName('LUGAR_EXPEDICION').AsString := '';
             ParamByName('FECHA_EXPEDICION').AsDate := 0;
             ParamByName('NOMBRE').AsString := vNombres;
             ParamByName('PRIMER_APELLIDO').AsString := '';
             ParamByName('SEGUNDO_APELLIDO').AsString := '';
             ParamByName('ID_TIPO_PERSONA').AsInteger := vTipoPersona;
             ParamByName('SEXO').AsString := '';
             ParamByName('FECHA_NACIMIENTO').AsDate := vFechaNacimiento;
             ParamByName('LUGAR_NACIMIENTO').AsString := vLugarNacimiento;
             ParamByName('PROVINCIA_NACIMIENTO').AsString := vProvinciaNacimiento;
             ParamByName('DEPTO_NACIMIENTO').AsString := vDepartamentoNacimiento;
             ParamByName('PAIS_NACIMIENTO').AsString := vPaisNacimiento;
             ParamByName('ID_TIPO_ESTADO_CIVIL').AsInteger := 0;
             ParamByName('ID_CONYUGE').AsString := '';
             ParamByName('ID_IDENTIFICACION_CONYUGE').AsInteger := 0;
             ParamByName('NOMBRE_CONYUGE').AsString := '';
             ParamByName('PRIMER_APELLIDO_CONYUGE').AsString := '';
             ParamByName('SEGUNDO_APELLIDO_CONYUGE').AsString := '';
             ParamByName('PROFESION').AsString := vProfesion;
             ParamByName('ID_APODERADO').AsString := vNumeroIdentificacionApoderado;
             ParamByName('ID_IDENTIFICACION_APODERADO').AsInteger := vTipoIdentificacionApoderado;
             ParamByName('NOMBRE_APODERADO').AsString := vNombreApoderado;
             ParamByName('PRIMER_APELLIDO_APODERADO').AsString := vPrimerApellidoApoderado;
             ParamByName('SEGUNDO_APELLIDO_APODERADO').AsString := vSegundoApellidoApoderado;
             ParamByName('ID_ESTADO').AsInteger := 1;
             ParamByName('ID_TIPO_RELACION').AsInteger := vTipoAfiliacion;
             ParamByName('ID_CIIU').AsInteger := vCiiu;
             ParamByName('EMPRESA_LABORA').AsString := '';
             ParamByName('FECHA_INGRESO_EMPRESA').AsDate := vFechaNacimiento;
             ParamByName('CARGO_ACTUAL').AsString := '';
             ParamByName('DECLARACION').AsString := vDeclaracion;
             ParamByName('INGRESOS_A_PRINCIPAL').AsCurrency := vIngresos;
             ParamByName('INGRESOS_OTROS').AsCurrency := vOtrosIngresos;
             ParamByName('INGRESOS_CONYUGE').AsCurrency := 0;
             ParamByName('INGRESOS_CONYUGE_OTROS').AsCurrency := 0;
             ParamByName('DESC_INGR_OTROS').AsString := vDescripcionIngresos;
             ParamByName('EGRESOS_ALQUILER').AsCurrency := vEgresosArriendo;
             ParamByName('EGRESOS_SERVICIOS').AsCurrency := vEgresosServicios;
             ParamByName('EGRESOS_TRANSPORTE').AsCurrency := vEgresosTransporte;
             ParamByName('EGRESOS_ALIMENTACION').AsCurrency := 0;
             ParamByName('EGRESOS_DEUDAS').AsCurrency := vEgresosDeudas;
             ParamByName('EGRESOS_OTROS').AsCurrency := vEgresosOtros;
             ParamByName('DESC_EGRE_OTROS').AsString := '';
             ParamByName('EGRESOS_CONYUGE').AsCurrency := 0;
             ParamByName('OTROS_EGRESOS_CONYUGE').AsCurrency := 0;
             ParamByName('TOTAL_ACTIVOS').AsCurrency := vTotalActivos;
             ParamByName('TOTAL_PASIVOS').AsCurrency := vTotalPasivos;
             ParamByName('EDUCACION').AsInteger := vEducacion;
             ParamByName('RETEFUENTE').AsInteger := vRetefuente;
             ParamByName('ACTA').AsString := '';
             ParamByName('FECHA_REGISTRO').AsDate := Date;
             ParamByName('ESCRITURA_CONSTITUCION').AsString := vNumeroEscritura;
             ParamByName('DURACION_SOCIEDAD').AsInteger := vDuracionSociedad;
             ParamByName('CAPITAL_SOCIAL').AsCurrency := vCapitalSocial;
             ParamByName('MATRICULA_MERCANTIL').AsString := vMatriculaMercantil;
             ParamByName('FOTO_HUELLA').Clear;
             ParamByName('DATOS_HUELLA').Clear;
             ParamByName('FOTO').Clear;
             ParamByName('FIRMA').Clear;
           end
           else
           begin
             ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
             ParamByName('ID_PERSONA').AsString := vIdentificacion;
             ParamByName('LUGAR_EXPEDICION').AsString := vLugarExpedicion;
             ParamByName('FECHA_EXPEDICION').AsDate := vFechaExpedicion;
             ParamByName('NOMBRE').AsString := vNombres;
             ParamByName('PRIMER_APELLIDO').AsString := vPrimerApellido;
             ParamByName('SEGUNDO_APELLIDO').AsString := vSegundoApellido;
             ParamByName('ID_TIPO_PERSONA').AsInteger := vTipoPersona;
             ParamByName('SEXO').AsString := vSexo;
             ParamByName('FECHA_NACIMIENTO').AsDate := vFechaNacimiento;
             ParamByName('LUGAR_NACIMIENTO').AsString := vLugarNacimiento;
             ParamByName('PROVINCIA_NACIMIENTO').AsString := vProvinciaNacimiento;
             ParamByName('DEPTO_NACIMIENTO').AsString := vDepartamentoNacimiento;
             ParamByName('PAIS_NACIMIENTO').AsString := vPaisNacimiento;
             ParamByName('ID_TIPO_ESTADO_CIVIL').AsInteger := vEstadoCivil;
             ParamByName('ID_CONYUGE').AsString := vNumeroIdentificacionConyuge;
             ParamByName('ID_IDENTIFICACION_CONYUGE').AsInteger := vTipoIdentificacionConyuge;
             ParamByName('NOMBRE_CONYUGE').AsString := vNombreConyuge;
             ParamByName('PRIMER_APELLIDO_CONYUGE').AsString := vPrimerApellidoConyuge;
             ParamByName('SEGUNDO_APELLIDO_CONYUGE').AsString := vSegundoApellidoConyuge;
             ParamByName('PROFESION').AsString := vProfesion;
             ParamByName('ID_APODERADO').AsString := vNumeroIdentificacionApoderado;
             ParamByName('ID_IDENTIFICACION_APODERADO').AsInteger := vTipoIdentificacionApoderado;
             ParamByName('NOMBRE_APODERADO').AsString := vNombreApoderado;
             ParamByName('PRIMER_APELLIDO_APODERADO').AsString := vPrimerApellidoApoderado;
             ParamByName('SEGUNDO_APELLIDO_APODERADO').AsString := vSegundoApellidoApoderado;
             ParamByName('ID_ESTADO').AsInteger := 1;
             ParamByName('ID_TIPO_RELACION').AsInteger := vTipoAfiliacion;
             ParamByName('ID_CIIU').AsInteger := vCiiu;
             ParamByName('EMPRESA_LABORA').AsString := vEmpresa;
             ParamByName('FECHA_INGRESO_EMPRESA').AsDate := vFechaIngreso;
             ParamByName('CARGO_ACTUAL').AsString := vCargo;
             ParamByName('DECLARACION').AsString := vDeclaracion;
             ParamByName('INGRESOS_A_PRINCIPAL').AsCurrency := vIngresos;
             ParamByName('INGRESOS_OTROS').AsCurrency := vOtrosIngresos;
             ParamByName('INGRESOS_CONYUGE').AsCurrency := vIngresosConyuge;
             ParamByName('INGRESOS_CONYUGE_OTROS').AsCurrency := vOtrosIngresosConyuge;
             ParamByName('DESC_INGR_OTROS').AsString := '';
             ParamByName('EGRESOS_ALQUILER').AsCurrency := vEgresosArriendo;
             ParamByName('EGRESOS_SERVICIOS').AsCurrency := vEgresosServicios;
             ParamByName('EGRESOS_TRANSPORTE').AsCurrency := vEgresosTransporte;
             ParamByName('EGRESOS_ALIMENTACION').AsCurrency := vEgresosAlimentos;
             ParamByName('EGRESOS_DEUDAS').AsCurrency := vEgresosDeudas;
             ParamByName('EGRESOS_OTROS').AsCurrency := vEgresosOtros;
             ParamByName('DESC_EGRE_OTROS').AsString := '';
             ParamByName('EGRESOS_CONYUGE').AsCurrency := vEgresosConyuge;
             ParamByName('OTROS_EGRESOS_CONYUGE').AsCurrency := vOtrosEgresosConyuge;
             ParamByName('TOTAL_ACTIVOS').AsCurrency := vTotalActivos;
             ParamByName('TOTAL_PASIVOS').AsCurrency := vTotalPasivos;
             ParamByName('EDUCACION').AsInteger := vEducacion;
             ParamByName('RETEFUENTE').AsInteger := vRetefuente;
             ParamByName('ACTA').AsString := '';
             ParamByName('FECHA_REGISTRO').AsDate := Date;
             ParamByName('ESCRITURA_CONSTITUCION').AsString := '';
             ParamByName('DURACION_SOCIEDAD').AsInteger := 0;
             ParamByName('CAPITAL_SOCIAL').AsCurrency := 0;
             ParamByName('MATRICULA_MERCANTIL').AsString := '';
             if hayHuella then begin
               ParamByName('DATOS_HUELLA').SetBlobData(addr(pvdata),blobSize - 1);
               BS1 := TMemoryStream.Create;
               ImgHuellaC.Picture.Bitmap.SaveToStream(BS1);
               ParamByName('FOTO_HUELLA').LoadFromStream(BS1,ftBlob);
               BS1.Free;
             end
             else
             begin
                ParamByName('DATOS_HUELLA').Clear;
                ParamByName('FOTO_HUELLA').Clear;
             end;
             BS2 := TMemoryStream.Create;
             ImgFotoC.Picture.Bitmap.SaveToStream(BS2);
             ParamByName('FOTO').LoadFromStream(BS2,ftBlob);
             BS2.Free;
             BS3 := TMemoryStream.Create;
             ImgFirmaC.Picture.Bitmap.SaveToStream(BS3);
             ParamByName('FIRMA').LoadFromStream(BS3,ftBlob);
             BS3.Free;
           end;

           ExecSQL;

      with dmPersona.IBQuery do
        begin
           SQL.Clear;
           SQL.Add('insert into "gen$direccion" values (');
           SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"ID_DIRECCION",');
           SQL.Add(':"DIRECCION",:"BARRIO",:"MUNICIPIO",:"TELEFONO1",');
           SQL.Add(':"TELEFONO2",:"TELEFONO3",:"TELEFONO4")');
           if vListaDirecciones.Count > 0 then
           for I := 0 to vListaDirecciones.Count -1 do
           begin
                 ARecordD := vListaDirecciones.Items[I];
                 ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
                 ParamByName('ID_PERSONA').AsString := vIdentificacion;
                 ParamByName('ID_DIRECCION').AsInteger := ARecordD^.TipoDireccion;
                 ParamByName('DIRECCION').AsString := ARecordD^.Direccion;
                 ParamByName('BARRIO').AsString := ARecordD^.Barrio;
                 ParamByName('MUNICIPIO').AsString := ARecordD^.Municipio;
                 ParamByName('TELEFONO1').AsString := ARecordD^.Telefono1;
                 ParamByName('TELEFONO2').AsString := ARecordD^.Telefono2;
                 ParamByName('TELEFONO3').AsString := ARecordD^.Telefono3;
                 ParamByName('TELEFONO4').AsString := ARecordD^.Telefono4;
                 ExecSQL;
             end;

             SQL.Clear;
             SQL.Add('insert into "gen$referencias" values (');
             SQL.Add(':"TIPO_ID_REFERENCIA",:"ID_REFERENCIA",:"PRIMER_APELLIDO_REFERENCIA",');
             SQL.Add(':"SEGUNDO_APELLIDO_REFERENCIA",:"NOMBRE_REFERENCIA",');
             SQL.Add(':"DIRECCION_REFERENCIA",:"TELEFONO_REFERENCIA",:"TIPO_REFERENCIA",:"PARENTESCO_REFERENCIA")');

             if vListaReferencia.Count > 0 then
             for I := 0 to vListaReferencia.Count - 1 do
             begin
                 ARecordR := vListaReferencia.Items[I];
                 ParamByName('TIPO_ID_REFERENCIA').AsInteger := vTipoIdentificacion;
                 ParamByName('ID_REFERENCIA').AsString := vIdentificacion;
                 ParamByName('PRIMER_APELLIDO_REFERENCIA').AsString := ARecordR^.PrimerApellido;
                 ParamByName('SEGUNDO_APELLIDO_REFERENCIA').AsString := ARecordR^.SegundoApellido;
                 ParamByName('NOMBRE_REFERENCIA').AsString := ARecordR^.Nombre;
                 ParamByName('DIRECCION_REFERENCIA').AsString := ARecordR^.Direccion;
                 ParamByName('TELEFONO_REFERENCIA').AsString := ARecordR^.Telefono;
                 ParamByName('TIPO_REFERENCIA').AsInteger := ARecordR^.TipoReferencia;
                 ParamByName('PARENTESCO_REFERENCIA').AsInteger := ARecordR^.Parentesco;
                 ExecSQL;
             end;
        end;
        Transaction.CommitRetaining;
        Result := true;
      except
        Transaction.RollbackRetaining;
        Result := false;
      end;
end;

function TfrmCreacionPersona.Actualizar: Boolean;
var I:integer;
    ARecordD:PListaDireccion;
    ARecordR:PListaReferencia;
    BS1:TMemoryStream;
    BS2:TMemoryStream;
    BS3:TMemoryStream;
begin
      with dmPersona.IBQuery do
      try
           SQL.Clear;
           SQL.Add('update "gen$persona" set ');
           SQL.Add('"gen$persona"."ID_IDENTIFICACION" = :"ID_IDENTIFICACION",');
           SQL.Add('"gen$persona"."ID_PERSONA" = :"ID_PERSONA",');
           SQL.Add('"gen$persona"."NOMBRE" = :"NOMBRE",');
           SQL.Add('"gen$persona"."LUGAR_EXPEDICION" = :"LUGAR_EXPEDICION",');
           SQL.Add('"gen$persona"."FECHA_EXPEDICION" = :"FECHA_EXPEDICION",');
           SQL.Add('"gen$persona"."PRIMER_APELLIDO" = :"PRIMER_APELLIDO",');
           SQL.Add('"gen$persona"."SEGUNDO_APELLIDO" = :"SEGUNDO_APELLIDO",');
           SQL.Add('"gen$persona"."ID_TIPO_PERSONA" = :"ID_TIPO_PERSONA",');
           SQL.Add('"gen$persona"."SEXO" = :"SEXO",');
           SQL.Add('"gen$persona"."FECHA_NACIMIENTO" = :"FECHA_NACIMIENTO",');
           SQL.Add('"gen$persona"."LUGAR_NACIMIENTO" = :"LUGAR_NACIMIENTO",');
           SQL.Add('"gen$persona"."PROVINCIA_NACIMIENTO" = :"PROVINCIA_NACIMIENTO",');
           SQL.Add('"gen$persona"."DEPTO_NACIMIENTO" = :"DEPTO_NACIMIENTO",');
           SQL.Add('"gen$persona"."PAIS_NACIMIENTO" = :"PAIS_NACIMIENTO",');
           SQL.Add('"gen$persona"."ID_TIPO_ESTADO_CIVIL" = :"ID_TIPO_ESTADO_CIVIL",');
           SQL.Add('"gen$persona"."ID_CONYUGE" = :"ID_CONYUGE",');
           SQL.Add('"gen$persona"."ID_IDENTIFICACION_CONYUGE" = :"ID_IDENTIFICACION_CONYUGE",');
           SQL.Add('"gen$persona"."NOMBRE_CONYUGE" = :"NOMBRE_CONYUGE",');
           SQL.Add('"gen$persona"."PRIMER_APELLIDO_CONYUGE" = :"PRIMER_APELLIDO_CONYUGE",');
           SQL.Add('"gen$persona"."SEGUNDO_APELLIDO_CONYUGE" = :"SEGUNDO_APELLIDO_CONYUGE",');
           SQL.Add('"gen$persona"."PROFESION" = :"PROFESION",');
           SQL.Add('"gen$persona"."ID_APODERADO" = :"ID_APODERADO",');
           SQL.Add('"gen$persona"."ID_IDENTIFICACION_APODERADO" = :"ID_IDENTIFICACION_APODERADO",');
           SQL.Add('"gen$persona"."NOMBRE_APODERADO" = :"NOMBRE_APODERADO",');
           SQL.Add('"gen$persona"."PRIMER_APELLIDO_APODERADO" = :"PRIMER_APELLIDO_APODERADO",');
           SQL.Add('"gen$persona"."SEGUNDO_APELLIDO_APODERADO" = :"SEGUNDO_APELLIDO_APODERADO",');
           SQL.Add('"gen$persona"."ID_ESTADO" = :"ID_ESTADO",');
           SQL.Add('"gen$persona"."ID_TIPO_RELACION" = :"ID_TIPO_RELACION",');
           SQL.Add('"gen$persona"."ID_CIIU" = :"ID_CIIU",');
           SQL.Add('"gen$persona"."EMPRESA_LABORA" = :"EMPRESA_LABORA",');
           SQL.Add('"gen$persona"."FECHA_INGRESO_EMPRESA" = :"FECHA_INGRESO_EMPRESA",');
           SQL.Add('"gen$persona"."CARGO_ACTUAL" = :"CARGO_ACTUAL",');
           SQL.Add('"gen$persona"."DECLARACION" = :"DECLARACION",');
           SQL.Add('"gen$persona"."INGRESOS_A_PRINCIPAL" = :"INGRESOS_A_PRINCIPAL",');
           SQL.Add('"gen$persona"."INGRESOS_OTROS" = :"INGRESOS_OTROS",');
           SQL.Add('"gen$persona"."INGRESOS_CONYUGE" = :"INGRESOS_CONYUGE",');
           SQL.Add('"gen$persona"."INGRESOS_CONYUGE_OTROS" = :"INGRESOS_CONYUGE_OTROS",');
           SQL.Add('"gen$persona"."DESC_INGR_OTROS" = :"DESC_INGR_OTROS",');
           SQL.Add('"gen$persona"."EGRESOS_ALQUILER" = :"EGRESOS_ALQUILER",');
           SQL.Add('"gen$persona"."EGRESOS_SERVICIOS" = :"EGRESOS_SERVICIOS",');
           SQL.Add('"gen$persona"."EGRESOS_TRANSPORTE" = :"EGRESOS_TRANSPORTE",');
           SQL.Add('"gen$persona"."EGRESOS_ALIMENTACION" = :"EGRESOS_ALIMENTACION",');
           SQL.Add('"gen$persona"."EGRESOS_DEUDAS" = :"EGRESOS_DEUDAS",');
           SQL.Add('"gen$persona"."EGRESOS_OTROS" = :"EGRESOS_OTROS",');
           SQL.Add('"gen$persona"."DESC_EGRE_OTROS" = :"DESC_EGRE_OTROS",');
           SQL.Add('"gen$persona"."EGRESOS_CONYUGE" = :"EGRESOS_CONYUGE",');
           SQL.Add('"gen$persona"."OTROS_EGRESOS_CONYUGE" = :"OTROS_EGRESOS_CONYUGE",');
           SQL.Add('"gen$persona"."TOTAL_ACTIVOS" = :"TOTAL_ACTIVOS",');
           SQL.Add('"gen$persona"."TOTAL_PASIVOS" = :"TOTAL_PASIVOS",');
           SQL.Add('"gen$persona"."EDUCACION" = :"EDUCACION",');
           SQL.Add('"gen$persona"."RETEFUENTE" = :"RETEFUENTE",');
           SQL.Add('"gen$persona"."ACTA" = :"ACTA",');
           SQL.Add('"gen$persona"."FECHA_REGISTRO" = :"FECHA_REGISTRO",');
           SQL.Add('"gen$persona"."FOTO" = :"FOTO",');
           SQL.Add('"gen$persona"."FIRMA" = :"FIRMA",');
//           SQL.Add('"gen$persona"."FOTO_DOCUMENTO" = :"FOTO_DOCUMENTO"');
           SQL.Add('"gen$persona"."ESCRITURA_CONSTITUCION" = :"ESCRITURA_CONSTITUCION",');
           SQL.Add('"gen$persona"."DURACION_SOCIEDAD" = :"DURACION_SOCIEDAD",');
           SQL.Add('"gen$persona"."CAPITAL_SOCIAL" = :"CAPITAL_SOCIAL",');
           SQL.Add('"gen$persona"."MATRICULA_MERCANTIL" = :"MATRICULA_MERCANTIL",');
           SQL.Add('"gen$persona".FOTO_HUELLA = :FOTO_HUELLA, "gen$persona".DATOS_HUELLA = :DATOS_HUELLA');

           SQL.Add(' where ');
           SQL.Add('"gen$persona"."ID_IDENTIFICACION" = :"OLD_ID_IDENTIFICACION" and ');
           SQL.Add('"gen$persona"."ID_PERSONA" = :"OLD_ID_PERSONA"');

           ParamByName('OLD_ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
           ParamByName('OLD_ID_PERSONA').AsString := vIdentificacion;

          if (vTipoIdentificacion = 4) or (vTipoIdentificacion = 7) then
           begin
             ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
             ParamByName('ID_PERSONA').AsString := vIdentificacion;
             ParamByName('LUGAR_EXPEDICION').AsString := '';
             ParamByName('FECHA_EXPEDICION').AsDate := 0;
             ParamByName('NOMBRE').AsString := vNombres;
             ParamByName('PRIMER_APELLIDO').AsString := '';
             ParamByName('SEGUNDO_APELLIDO').AsString := '';
             ParamByName('ID_TIPO_PERSONA').AsInteger := vTipoPersona;
             ParamByName('SEXO').AsString := '';
             ParamByName('FECHA_NACIMIENTO').AsDate := vFechaNacimiento;
             ParamByName('LUGAR_NACIMIENTO').AsString := vLugarNacimiento;
             ParamByName('PROVINCIA_NACIMIENTO').AsString := vProvinciaNacimiento;
             ParamByName('DEPTO_NACIMIENTO').AsString := vDepartamentoNacimiento;
             ParamByName('PAIS_NACIMIENTO').AsString := vPaisNacimiento;
             ParamByName('ID_TIPO_ESTADO_CIVIL').AsInteger := 0;
             ParamByName('ID_CONYUGE').AsString := '';
             ParamByName('ID_IDENTIFICACION_CONYUGE').AsInteger := 0;
             ParamByName('NOMBRE_CONYUGE').AsString := '';
             ParamByName('PRIMER_APELLIDO_CONYUGE').AsString := '';
             ParamByName('SEGUNDO_APELLIDO_CONYUGE').AsString := '';
             ParamByName('PROFESION').AsString := vProfesion;
             ParamByName('ID_APODERADO').AsString := vNumeroIdentificacionApoderado;
             ParamByName('ID_IDENTIFICACION_APODERADO').AsInteger := vTipoIdentificacionApoderado;
             ParamByName('NOMBRE_APODERADO').AsString := vNombreApoderado;
             ParamByName('PRIMER_APELLIDO_APODERADO').AsString := vPrimerApellidoApoderado;
             ParamByName('SEGUNDO_APELLIDO_APODERADO').AsString := vSegundoApellidoApoderado;
             ParamByName('ID_ESTADO').AsInteger := 1;
             ParamByName('ID_TIPO_RELACION').AsInteger := vTipoAfiliacion;
             ParamByName('ID_CIIU').AsInteger := vCiiu;
             ParamByName('EMPRESA_LABORA').AsString := '';
             ParamByName('FECHA_INGRESO_EMPRESA').AsDate := vFechaNacimiento;
             ParamByName('CARGO_ACTUAL').AsString := '';
             ParamByName('DECLARACION').AsString := vDeclaracion;
             ParamByName('INGRESOS_A_PRINCIPAL').AsCurrency := vIngresos;
             ParamByName('INGRESOS_OTROS').AsCurrency := vOtrosIngresos;
             ParamByName('INGRESOS_CONYUGE').AsCurrency := 0;
             ParamByName('INGRESOS_CONYUGE_OTROS').AsCurrency := 0;
             ParamByName('DESC_INGR_OTROS').AsString := vDescripcionIngresos;;
             ParamByName('EGRESOS_ALQUILER').AsCurrency := vEgresosArriendo;
             ParamByName('EGRESOS_SERVICIOS').AsCurrency := vEgresosServicios;
             ParamByName('EGRESOS_TRANSPORTE').AsCurrency := vEgresosTransporte;
             ParamByName('EGRESOS_ALIMENTACION').AsCurrency := 0;
             ParamByName('EGRESOS_DEUDAS').AsCurrency := vEgresosDeudas;
             ParamByName('EGRESOS_OTROS').AsCurrency := vEgresosOtros;
             ParamByName('DESC_EGRE_OTROS').AsString := '';
             ParamByName('EGRESOS_CONYUGE').AsCurrency := 0;
             ParamByName('OTROS_EGRESOS_CONYUGE').AsCurrency := 0;
             ParamByName('FECHA_REGISTRO').AsDate := EdFechaAfiliacion.Date;
             ParamByName('TOTAL_ACTIVOS').AsCurrency := vTotalActivos;
             ParamByName('TOTAL_PASIVOS').AsCurrency := vTotalPasivos;
             ParamByName('EDUCACION').AsInteger := vEducacion;
             ParamByName('RETEFUENTE').AsInteger := vRetefuente;
             ParamByName('ACTA').AsString := '';
             ParamByName('FECHA_REGISTRO').AsDate := Date;
             ParamByName('ESCRITURA_CONSTITUCION').AsString := vNumeroEscritura;
             ParamByName('DURACION_SOCIEDAD').AsInteger := vDuracionSociedad;
             ParamByName('CAPITAL_SOCIAL').AsCurrency := vCapitalSocial;
             ParamByName('MATRICULA_MERCANTIL').AsString := vMatriculaMercantil;
             ParamByName('FOTO_HUELLA').Clear;
             ParamByName('DATOS_HUELLA').Clear;
             ParamByName('FOTO').Clear;
             ParamByName('FIRMA').Clear;
           end
           else
           begin
             ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
             ParamByName('ID_PERSONA').AsString := vIdentificacion;
             ParamByName('LUGAR_EXPEDICION').AsString := vLugarExpedicion;
             ParamByName('FECHA_EXPEDICION').AsDate := vFechaExpedicion;
             ParamByName('NOMBRE').AsString := vNombres;
             ParamByName('PRIMER_APELLIDO').AsString := vPrimerApellido;
             ParamByName('SEGUNDO_APELLIDO').AsString := vSegundoApellido;
             ParamByName('ID_TIPO_PERSONA').AsInteger := vTipoPersona;
             ParamByName('SEXO').AsString := vSexo;
             ParamByName('FECHA_NACIMIENTO').AsDate := vFechaNacimiento;
             ParamByName('LUGAR_NACIMIENTO').AsString := vLugarNacimiento;
             ParamByName('PROVINCIA_NACIMIENTO').AsString := vProvinciaNacimiento;
             ParamByName('DEPTO_NACIMIENTO').AsString := vDepartamentoNacimiento;
             ParamByName('PAIS_NACIMIENTO').AsString := vPaisNacimiento;
             ParamByName('ID_TIPO_ESTADO_CIVIL').AsInteger := vEstadoCivil;
             ParamByName('ID_CONYUGE').AsString := vNumeroIdentificacionConyuge;
             ParamByName('ID_IDENTIFICACION_CONYUGE').AsInteger := vTipoIdentificacionConyuge;
             ParamByName('NOMBRE_CONYUGE').AsString := vNombreConyuge;
             ParamByName('PRIMER_APELLIDO_CONYUGE').AsString := vPrimerApellidoConyuge;
             ParamByName('SEGUNDO_APELLIDO_CONYUGE').AsString := vSegundoApellidoConyuge;
             ParamByName('PROFESION').AsString := vProfesion;
             ParamByName('ID_APODERADO').AsString := vNumeroIdentificacionApoderado;
             ParamByName('ID_IDENTIFICACION_APODERADO').AsInteger := vTipoIdentificacionApoderado;
             ParamByName('NOMBRE_APODERADO').AsString := vNombreApoderado;
             ParamByName('PRIMER_APELLIDO_APODERADO').AsString := vPrimerApellidoApoderado;
             ParamByName('SEGUNDO_APELLIDO_APODERADO').AsString := vSegundoApellidoApoderado;
             ParamByName('ID_ESTADO').AsInteger := 1;
             ParamByName('ID_TIPO_RELACION').AsInteger := vTipoAfiliacion;
             ParamByName('ID_CIIU').AsInteger := vCiiu;
             ParamByName('EMPRESA_LABORA').AsString := vEmpresa;
             ParamByName('FECHA_INGRESO_EMPRESA').AsDate := vFechaIngreso;
             ParamByName('CARGO_ACTUAL').AsString := vCargo;
             ParamByName('DECLARACION').AsString := vDeclaracion;
             ParamByName('INGRESOS_A_PRINCIPAL').AsCurrency := vIngresos;
             ParamByName('INGRESOS_OTROS').AsCurrency := vOtrosIngresos;
             ParamByName('INGRESOS_CONYUGE').AsCurrency := vIngresosConyuge;
             ParamByName('INGRESOS_CONYUGE_OTROS').AsCurrency := vOtrosIngresosConyuge;
             ParamByName('DESC_INGR_OTROS').AsString := '';
             ParamByName('EGRESOS_ALQUILER').AsCurrency := vEgresosArriendo;
             ParamByName('EGRESOS_SERVICIOS').AsCurrency := vEgresosServicios;
             ParamByName('EGRESOS_TRANSPORTE').AsCurrency := vEgresosTransporte;
             ParamByName('EGRESOS_ALIMENTACION').AsCurrency := vEgresosAlimentos;
             ParamByName('EGRESOS_DEUDAS').AsCurrency := vEgresosDeudas;
             ParamByName('EGRESOS_OTROS').AsCurrency := vEgresosOtros;
             ParamByName('DESC_EGRE_OTROS').AsString := '';
             ParamByName('EGRESOS_CONYUGE').AsCurrency := vEgresosConyuge;
             ParamByName('OTROS_EGRESOS_CONYUGE').AsCurrency := vOtrosEgresosConyuge;
             ParamByName('TOTAL_ACTIVOS').AsCurrency := vTotalActivos;
             ParamByName('TOTAL_PASIVOS').AsCurrency := vTotalPasivos;
             ParamByName('EDUCACION').AsInteger := vEducacion;
             ParamByName('RETEFUENTE').AsInteger := vRetefuente;
             ParamByName('ACTA').AsString := '';
             ParamByName('FECHA_REGISTRO').AsDate := Date;
             ParamByName('ESCRITURA_CONSTITUCION').AsString := '';
             ParamByName('DURACION_SOCIEDAD').AsInteger := 0;
             ParamByName('CAPITAL_SOCIAL').AsCurrency := 0;
             ParamByName('MATRICULA_MERCANTIL').AsString := '';
             ParamByName('FECHA_REGISTRO').AsDate := EdFechaAfiliacion.Date;
             if hayHuella then begin
               ParamByName('DATOS_HUELLA').SetBlobData(addr(pvdata),blobSize - 1);
               BS1 := TMemoryStream.Create;
               ImgHuellaC.Picture.Bitmap.SaveToStream(BS1);
               ParamByName('FOTO_HUELLA').LoadFromStream(BS1,ftBlob);
               BS1.Free;
             end
             else
             begin
                ParamByName('DATOS_HUELLA').Clear;
                ParamByName('FOTO_HUELLA').Clear;
             end;
             BS2 := TMemoryStream.Create;
             ImgFotoC.Picture.Bitmap.SaveToStream(BS2);
             ParamByName('FOTO').LoadFromStream(BS2,ftBlob);
             BS2.Free;
             BS3 := TMemoryStream.Create;
             ImgFirmaC.Picture.Bitmap.SaveToStream(BS3);
             ParamByName('FIRMA').LoadFromStream(BS3,ftBlob);
             BS3.Free;
           end;

           ExecSQL;

           SQL.Clear;
           SQL.Add('delete from "gen$direccion" where ');
           SQL.Add('"gen$direccion"."ID_IDENTIFICACION" = :"OLD_ID_IDENTIFICACION" and ');
           SQL.Add('"gen$direccion"."ID_PERSONA" = :"OLD_ID_PERSONA"');

           ParamByName('OLD_ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
           ParamByName('OLD_ID_PERSONA').AsString := vIdentificacion;

           ExecSQL;

           SQL.Clear;
           SQL.Add('insert into "gen$direccion" values (');
           SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"ID_DIRECCION",');
           SQL.Add(':"DIRECCION",:"BARRIO",:"MUNICIPIO",:"TELEFONO1",');
           SQL.Add(':"TELEFONO2",:"TELEFONO3",:"TELEFONO4")');
           if vListaDirecciones.Count > 0 then
           for I := 0 to vListaDirecciones.Count -1 do
           begin
                 ARecordD := vListaDirecciones.Items[I];
                 ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
                 ParamByName('ID_PERSONA').AsString := vIdentificacion;
                 ParamByName('ID_DIRECCION').AsInteger := ARecordD^.TipoDireccion;
                 ParamByName('DIRECCION').AsString := ARecordD^.Direccion;
                 ParamByName('BARRIO').AsString := ARecordD^.Barrio;
                 ParamByName('MUNICIPIO').AsString := ARecordD^.Municipio;
                 ParamByName('TELEFONO1').AsString := ARecordD^.Telefono1;
                 ParamByName('TELEFONO2').AsString := ARecordD^.Telefono2;
                 ParamByName('TELEFONO3').AsString := ARecordD^.Telefono3;
                 ParamByName('TELEFONO4').AsString := ARecordD^.Telefono4;
                 ExecSQL;
             end;

             SQL.Clear;
             SQL.Add('delete from "gen$referencias" where ');
             SQL.Add('"gen$referencias"."TIPO_ID_REFERENCIA" = :"OLD_ID_IDENTIFICACION" and ');
             SQL.Add('"gen$referencias"."ID_REFERENCIA" = :"OLD_ID_PERSONA"');

             ParamByName('OLD_ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
             ParamByName('OLD_ID_PERSONA').AsString := vIdentificacion;

             ExecSQL;

             SQL.Clear;
             SQL.Add('insert into "gen$referencias" values (');
             SQL.Add(':"TIPO_ID_REFERENCIA",:"ID_REFERENCIA",:"PRIMER_APELLIDO_REFERENCIA",');
             SQL.Add(':"SEGUNDO_APELLIDO_REFERENCIA",:"NOMBRE_REFERENCIA",');
             SQL.Add(':"DIRECCION_REFERENCIA",:"TELEFONO_REFERENCIA",:"TIPO_REFERENCIA",:"PARENTESCO_REFERENCIA")');

             if vListaReferencia.Count > 0 then
             for I := 0 to vListaReferencia.Count - 1 do
             begin
                 ARecordR := vListaReferencia.Items[I];
                 ParamByName('TIPO_ID_REFERENCIA').AsInteger := vTipoIdentificacion;
                 ParamByName('ID_REFERENCIA').AsString := vIdentificacion;
                 ParamByName('PRIMER_APELLIDO_REFERENCIA').AsString := ARecordR^.PrimerApellido;
                 ParamByName('SEGUNDO_APELLIDO_REFERENCIA').AsString := ARecordR^.SegundoApellido;
                 ParamByName('NOMBRE_REFERENCIA').AsString := ARecordR^.Nombre;
                 ParamByName('DIRECCION_REFERENCIA').AsString := ARecordR^.Direccion;
                 ParamByName('TELEFONO_REFERENCIA').AsString := ARecordR^.Telefono;
                 ParamByName('TIPO_REFERENCIA').AsInteger := ARecordR^.TipoReferencia;
                 ParamByName('PARENTESCO_REFERENCIA').AsInteger := ARecordR^.Parentesco;
                 ExecSQL;
             end;
         Transaction.CommitRetaining;
         Result := true;
        except
         Transaction.RollbackRetaining;
         Result := false;
         raise;
        end;

end;

procedure TfrmCreacionPersona.EdEstudioEnter(Sender: TObject);
begin
        EdEstudio.Color := clMaroon;
end;

procedure TfrmCreacionPersona.EdEstudioExit(Sender: TObject);
begin
        EdEstudio.Color := clBtnFace;
end;

procedure TfrmCreacionPersona.CBestadocivilKeyPress(Sender: TObject;
  var Key: Char);
begin
        EdFechaNacimiento.SetFocus;
end;

procedure TfrmCreacionPersona.EdTotalActivosEnter(Sender: TObject);
begin
        EdTotalActivos.Text := FormatCurr('0.00',vTotalActivos);
        EdTotalActivos.SelectAll;
end;

procedure TfrmCreacionPersona.EdTotalPasivosEnter(Sender: TObject);
begin
        EdTotalPasivos.Text := FormatCurr('0.00',vTotalPasivos);
        EdTotalPasivos.SelectAll;
end;

procedure TfrmCreacionPersona.EdTotalActivosExit(Sender: TObject);
begin
        if EdTotalActivos.Text = '' then EdTotalActivos.Text := '0.00';
        vTotalActivos:= StrToFloat(EdTotalActivos.Text);
        EdTotalActivos.Text := FormatCurr('#,0.00',vTotalActivos);
end;

procedure TfrmCreacionPersona.EdTotalPasivosExit(Sender: TObject);
begin
        if EdTotalPasivos.Text = '' then EdTotalPasivos.Text := '0.00';
        vTotalPasivos:= StrToFloat(EdTotalPasivos.Text);
        EdTotalPasivos.Text := FormatCurr('#,0.00',vTotalPasivos);
end;

procedure TfrmCreacionPersona.CBTipoIdentificacionApoderado1Enter(
  Sender: TObject);
begin
        CBTipoIdentificacionApoderado.KeyValue := vTipoIdentificacionApoderado;
        CBTipoIdentificacionConyuge.DropDown;
end;

procedure TfrmCreacionPersona.CBTipoIdentificacionApoderado1Exit(
  Sender: TObject);
begin
        vTipoIdentificacionApoderado := CBTipoIdentificacionApoderado.KeyValue;
end;

procedure TfrmCreacionPersona.EdNumeroIdentificacionApoderado1Enter(
  Sender: TObject);
begin
        EdNumeroIdentificacionApoderado.Text := vNumeroIdentificacionApoderado;
        EdNumeroIdentificacionApoderado.SelectAll;
end;

procedure TfrmCreacionPersona.EdNumeroIdentificacionApoderado1Exit(
  Sender: TObject);
begin
        vNumeroIdentificacionApoderado := EdNumeroIdentificacionApoderado.Text;
end;

procedure TfrmCreacionPersona.EdNumeroIdentificacionApoderado1KeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmCreacionPersona.EdPrimerApellidoApoderado1Enter(
  Sender: TObject);
begin
        EdPrimerApellidoApoderado.Text := vPrimerApellidoApoderado;
        EdPrimerApellidoApoderado.SelectAll;
end;

procedure TfrmCreacionPersona.EdPrimerApellidoApoderado1Exit(
  Sender: TObject);
begin
        vPrimerApellidoApoderado := EdPrimerApellidoApoderado.Text;
end;

procedure TfrmCreacionPersona.EdNombreApoderado1Enter(Sender: TObject);
begin
        EdNombreApoderado.Text := vNombreApoderado;
        EdNombreApoderado.SelectAll;
end;

procedure TfrmCreacionPersona.EdNombreApoderado1Exit(Sender: TObject);
begin
        vNombreApoderado := EdNombreApoderado.Text;
end;

procedure TfrmCreacionPersona.InfoDireccionesEnter(Sender: TObject);
begin
        CBTipodireccion.SetFocus;
        EdMensaje.Caption := 'Direcciones de Ubicación';
end;

Procedure TfrmCreacionPersona.EdPrimerApellidoApoderadoEnter(
  Sender: TObject);
begin
        EdPrimerApellidoApoderado.Text := vPrimerApellidoApoderado;
        EdPrimerApellidoApoderado.SelectAll;
end;

procedure TfrmCreacionPersona.EdPrimerApellidoApoderadoExit(
  Sender: TObject);
begin
        vPrimerApellidoApoderado := EdPrimerApellidoApoderado.Text;
end;

procedure TfrmCreacionPersona.EdSegundoApellidoApoderadoEnter(
  Sender: TObject);
begin
        EdSegundoApellidoApoderado.Text := vSegundoApellidoApoderado;
        EdSegundoApellidoApoderado.SelectAll;
end;

procedure TfrmCreacionPersona.EdSegundoApellidoApoderadoExit(
  Sender: TObject);
begin
        vSegundoApellidoApoderado := EdSegundoApellidoApoderado.Text;
end;

procedure TfrmCreacionPersona.EdNombreApoderadoEnter(Sender: TObject);
begin
        EdNombreApoderado.Text := vNombreApoderado;
        EdNombreApoderado.SelectAll;
end;

procedure TfrmCreacionPersona.EdNombreApoderadoExit(Sender: TObject);
begin
        vNombreApoderado := EdNombreApoderado.Text;
end;

procedure TfrmCreacionPersona.EdNumeroIdentificacionApoderadoEnter(
  Sender: TObject);
begin
        EdNumeroIdentificacionApoderado.Text := vNumeroIdentificacionApoderado;
        EdNumeroIdentificacionApoderado.SelectAll;
end;

procedure TfrmCreacionPersona.EdNumeroIdentificacionApoderadoExit(
  Sender: TObject);
begin
        vNumeroIdentificacionApoderado := EdNumeroIdentificacionApoderado.Text;
        with dmPersona.IBQuery do
        begin
            SQL.Clear;
            SQL.Add('select * from "gen$persona" where ');
            SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacionApoderado;
            ParamByName('ID_PERSONA').AsString := vNumeroIdentificacionApoderado;
            Open;
            if RecordCount > 0 then
            begin
               vPrimerApellidoApoderado := FieldByName('PRIMER_APELLIDO_APODERADO').AsString;
               EdPrimerApellidoApoderado.Text := vPrimerApellidoApoderado;
               vSegundoApellidoApoderado := FieldByName('SEGUNDO_APELLIDO_APODERADO').AsString;
               EdSegundoApellidoApoderado.Text := vSegundoApellidoApoderado;
               vNombreApoderado := FieldByName('NOMBRE').AsString;
               EdNombreApoderado.Text := vNombreApoderado;
            end;
        end;
end;

procedure TfrmCreacionPersona.InfoConyugeExit(Sender: TObject);
begin
        PageControl.ActivePageIndex := 1;
        InfoLaboral.TabVisible := True;
end;

procedure TfrmCreacionPersona.InfoLaboralEnter(Sender: TObject);
begin
        GroupBox4.SetFocus;
        EdMensaje.Caption := 'Información Laboral';
end;

procedure TfrmCreacionPersona.InfoConyugeEnter(Sender: TObject);
begin
        GroupBox2.SetFocus;
        EdMensaje.Caption := 'Información del Conyuge';
end;

procedure TfrmCreacionPersona.InfoReferenciasEnter(Sender: TObject);
begin
        CBTipoReferencia.SetFocus;
        EdMensaje.Caption := 'Informacion Referencias';
end;

procedure TfrmCreacionPersona.InfoApoderadoEnter(Sender: TObject);
begin
        CBtipoidentificacionapoderado.SetFocus;
        EdMensaje.Caption := 'Información de Apoderado';
end;

procedure TfrmCreacionPersona.InfoApoderadoExit(Sender: TObject);
begin
        PageControl.ActivePageIndex := 5;
        InfoImagenes.TabVisible := True;
end;

procedure TfrmCreacionPersona.InfoImagenesExit(Sender: TObject);
begin
        CmdGrabar.SetFocus;
end;

procedure TfrmCreacionPersona.CBTipoIdentificacionApoderadoEnter(
  Sender: TObject);
begin
        CBTipoIdentificacionApoderado.KeyValue := vTipoIdentificacionApoderado;
        CBTipoIdentificacionApoderado.DropDown;
end;

procedure TfrmCreacionPersona.CBTipoIdentificacionApoderadoExit(
  Sender: TObject);
begin
        vTipoIdentificacionApoderado := CBTipoIdentificacionApoderado.KeyValue;
end;

procedure TfrmCreacionPersona.CBTipoIdentificacionJurEnter(
  Sender: TObject);
begin
        CBtipoidentificacionJur.KeyValue := vTipoIdentificacion;
        CBtipoidentificacionJur.DropDown;
end;

procedure TfrmCreacionPersona.CBTipoIdentificacionJurExit(Sender: TObject);
begin
        vTipoIdentificacion := CBtipoidentificacionJur.KeyValue;
end;

procedure TfrmCreacionPersona.EdNumeroIdentificacionJurEnter(
  Sender: TObject);
begin
        EdNumeroIdentificacionJur.Text := '';
end;

procedure TfrmCreacionPersona.EdNumeroIdentificacionJurExit(
  Sender: TObject);
var
    ARecordD:PListaDireccion;
    ARecordR:PListaReferencia;
begin
        vIdentificacion := EdNumeroIdentificacionJur.Text;
        vListaDirecciones.Clear;
        vListaReferencia.Clear;
        InfoConyuge.TabVisible := false;
        PageControl.ActivePageIndex := 1;
        with dmPersona.IBQuery do
        begin
            SQL.Clear;
            SQL.Add('select * from "gen$persona" where ');
            SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
            ParamByName('ID_PERSONA').AsString := vIdentificacion;
            Open;
            if RecordCount > 0 then
            begin
               vModificar := true;
               vNombres := FieldByName('NOMBRE').AsString;
               EdRazonSocial.Text := vNombres;
               vTipoPersona := FieldByName('ID_TIPO_PERSONA').AsInteger;
               CBtipopersonaJur.KeyValue := vTipoPersona;
               vFechaNacimiento := FieldByName('FECHA_NACIMIENTO').AsDateTime;
               DateTime_SetFormat(EdFechaNacimientoJur.Handle,'yyyy/MM/dd');
               EdFechaNacimientoJur.Date := vFechaNacimiento;
               vLugarNacimiento := FieldByName('LUGAR_NACIMIENTO').AsString;
               EdLugarNacimientoJur.Text := vLugarNacimiento;
               vProvinciaNacimiento := FieldByName('PROVINCIA_NACIMIENTO').AsString;
               EdProvinciaNacimientoJur.Text := vProvinciaNacimiento;
               vDepartamentoNacimiento := FieldByName('DEPTO_NACIMIENTO').AsString;
               EdDepartamentoNacimientoJur.Text := vDepartamentoNacimiento;
               vPaisNacimiento := FieldByName('PAIS_NACIMIENTO').AsString;
               EdPaisNacimientoJur.Text := vPaisNacimiento;
               vCiiu := FieldByName('ID_CIIU').AsInteger;
               CBciiuJur.KeyValue := vCiiu;
               vTipoAfiliacion := FieldByName('ID_TIPO_RELACION').AsInteger;
               CBtiposrelacionJur.KeyValue := vTipoAfiliacion;
               vFechaAfiliacion := FieldByName('FECHA_REGISTRO').AsDateTime;
               DateTime_SetFormat(EdFechaAfiliacionJur.Handle,'yyyy/MM/dd');
               EdFechaAfiliacionJur.Date := vFechaAfiliacion;
               vProfesion := FieldByName('PROFESION').AsString;
               EdProfesion.Text := vProfesion;
               vNumeroEscritura := FieldByName('ESCRITURA_CONSTITUCION').AsString;
               EdNumeroEscritura.Text := vNumeroEscritura;
               vDuracionSociedad := FieldByname('DURACION_SOCIEDAD').AsInteger;
               EdDuracionSociedad.Text := IntToStr(vDuracionSociedad);
               vCapitalSocial := FieldByName('CAPITAL_SOCIAL').AsCurrency;
               EdCapitalSocial.Text := CurrToStr(vCapitalSocial);
               vMatriculaMercantil := FieldByName('MATRICULA_MERCANTIL').AsString;
               EdMatriculaMercantil.Text := vMatriculaMercantil;
               vTipoIdentificacionApoderado := FieldByName('ID_IDENTIFICACION_APODERADO').AsInteger;
               CBTipoIdentificacionApoderado.KeyValue := vTipoIdentificacionApoderado;
               vNumeroIdentificacionApoderado :=  FieldByName('ID_APODERADO').AsString;
               EdNumeroIdentificacionApoderado.Text := vNumeroIdentificacionApoderado;
               vPrimerApellidoApoderado := FieldByName('PRIMER_APELLIDO_APODERADO').AsString;
               EdPrimerApellidoApoderado.Text := vPrimerApellidoApoderado;
               vSegundoApellidoApoderado := FieldByName('SEGUNDO_APELLIDO_APODERADO').AsString;
               EdSegundoApellidoApoderado.Text :=vSegundoApellidoApoderado;
               vNombreApoderado := FieldByName('NOMBRE_APODERADO').AsString;
               EdNombreApoderado.Text := vNombreApoderado;
               vReteFuente := FieldByName('RETEFUENTE').AsInteger;
               EdRetefuente.Checked := IntToBoolean(vReteFuente);
               vTotalActivos := FieldByName('TOTAL_ACTIVOS').AsCurrency;
               EdTotalActivos.Text := FormatCurr('#,#0.00',vTotalActivos);
               vTotalPasivos := FieldByName('TOTAL_PASIVOS').AsCurrency;
               EdTotalPasivos.Text := FormatCurr('#,#0.00',vTotalPasivos);
               vDeclaracion := FieldByName('DECLARACION').AsString;
               EdDeclaracion.Text := vDeclaracion;
               vIngresos := FieldByName('INGRESOS_A_PRINCIPAL').AsCurrency;
               EdIngresos.Text := FormatCurr('#,#0.00',vIngresos);
               vOtrosIngresos := FieldByName('INGRESOS_OTROS').AsCurrency;
               EdOtrosIngresos.Text := FormatCurr('#,#0.00',vOtrosIngresos);
               vDescripcionIngresos := FieldByName('DESC_INGR_OTROS').AsString;
               EdDescripcionIngresosConyuge.Text := vDescripcionIngresos;
               vEgresosArriendo := FieldByName('EGRESOS_ALQUILER').AsCurrency;
               EdEgresosArriendo.Text := FormatCurr('#,#0.00',vEgresosArriendo);
               vEgresosTransporte := FieldByName('EGRESOS_TRANSPORTE').AsCurrency;
               EdEgresosTransporte.Text := FormatCurr('#,#0.00',vEgresosTransporte);
               vEgresosServicios := FieldByName('EGRESOS_SERVICIOS').AsCurrency;
               EdEgresosServicios.Text := FormatCurr('#,#0.00',vEgresosServicios);
               vEgresosDeudas := FieldByName('EGRESOS_DEUDAS').AsCurrency;
               EdEgresosDeudas.Text := FormatCurr('#,#0.00',vEgresosDeudas);
               vEgresosOtros := FieldByName('EGRESOS_OTROS').AsCurrency;
               EdEgresosOtros.Text := FormatCurr('#,#0.00',vEgresosOtros);

            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$direccion" where ');
            SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ');
            SQL.Add('ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_IDENTIFICACION').AsInteger := vTipoIdentificacion;
            ParamByName('ID_PERSONA').AsString := vIdentificacion;
            Open;
            if RecordCount > 0 then
            begin
                Last;
                First;
                while not eof do
                begin
                   New(ARecordD);
                   ARecordD^.TipoDireccion := FieldByName('ID_DIRECCION').AsInteger;
                   ARecordD^.Direccion := FieldByName('DIRECCION').AsString;
                   ARecordD^.Barrio := FieldByName('BARRIO').AsString;
                   ARecordD^.Municipio := FieldByName('MUNICIPIO').AsString;
                   ARecordD^.Telefono1 := FieldByName('TELEFONO1').AsString;
                   ARecordD^.Telefono2 := FieldByName('TELEFONO2').AsString;
                   ARecordD^.Telefono3 := FieldByName('TELEFONO3').AsString;
                   ARecordD^.Telefono4 := FieldByName('TELEFONO4').AsString;
                   vListaDirecciones.Add(ARecordD);
                   Next;
                end;
            ActualizarGridDireccion;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$referencias" where ');
            SQL.Add('TIPO_ID_REFERENCIA = :"ID_TIPO_DOCUMENTO" and ');
            SQL.Add('ID_REFERENCIA = :"ID_PERSONA"');
            ParamByName('ID_TIPO_DOCUMENTO').AsInteger := vTipoIdentificacion;
            ParamByName('ID_PERSONA').AsString := vIdentificacion;
            Open;
            if RecordCount > 0 then
            begin
                Last;
                First;
                while not eof do
                begin
                    New(ARecordR);
                    ARecordR^.TipoReferencia := FieldByName('TIPO_REFERENCIA').AsInteger;
                    ARecordR^.PrimerApellido := FieldByName('PRIMER_APELLIDO_REFERENCIA').AsString;
                    ARecordR^.SegundoApellido := FieldByName('SEGUNDO_APELLIDO_REFERENCIA').AsString;
                    ARecordR^.Nombre := FieldByName('NOMBRE_REFERENCIA').AsString;
                    ARecordR^.Direccion := FieldByName('DIRECCION_REFERENCIA').AsString;
                    ARecordR^.Telefono := FieldByName('TELEFONO_REFERENCIA').AsString;
                    ARecordR^.Parentesco := FieldByName('PARENTESCO_REFERENCIA').AsInteger;
                    vListaReferencia.Add(ARecordR);
                    Next;
                end;
            ActualizarGridReferencia;
            end;
            vModificar := true;
            end
            else
            begin
               vModificar := false;
               EdRazonSocial.SetFocus;
            end;
        Close;
        end;
end;

procedure TfrmCreacionPersona.EdRazonSocialEnter(Sender: TObject);
begin
        EdRazonSocial.Text := vNombres;
        EdRazonSocial.SelectAll;
end;

procedure TfrmCreacionPersona.EdRazonSocialExit(Sender: TObject);
begin
        vNombres := EdRazonsocial.Text;
end;

procedure TfrmCreacionPersona.EdLugarNacimientoJurEnter(Sender: TObject);
begin
        EdLugarNacimientoJur.Text := vLugarNacimiento;
        EdLugarNacimientoJur.SelectAll;
end;

procedure TfrmCreacionPersona.EdLugarNacimientoJurExit(Sender: TObject);
begin
        vLugarNacimiento := EdLugarNacimientoJur.Text;
end;

procedure TfrmCreacionPersona.EdProvinciaNacimientoJurEnter(
  Sender: TObject);
begin
        EdProvinciaNacimientoJur.Text := vProvinciaNacimiento;
        EdProvinciaNacimientoJur.SelectAll;
end;

procedure TfrmCreacionPersona.EdProvinciaNacimientoJurExit(
  Sender: TObject);
begin
        vProvinciaNacimiento:=EdProvinciaNacimientoJur.Text;
end;

procedure TfrmCreacionPersona.EdDepartamentoNacimientoJurEnter(
  Sender: TObject);
begin
        EdDepartamentoNacimientoJur.Text := vDepartamentoNacimiento;
        EdDepartamentoNacimientoJur.SelectAll;
end;

procedure TfrmCreacionPersona.EdDepartamentoNacimientoJurExit(
  Sender: TObject);
begin
        vDepartamentoNacimiento := EdDepartamentoNacimientoJur.Text;
end;

procedure TfrmCreacionPersona.EdPaisNacimientoJurEnter(Sender: TObject);
begin
        EdPaisNacimientoJur.Text := vPaisNacimiento;
end;

procedure TfrmCreacionPersona.EdPaisNacimientoJurExit(Sender: TObject);
begin
        vPaisNacimiento := EdPaisNacimientoJur.Text;
end;

procedure TfrmCreacionPersona.CBTiposRelacionJurEnter(Sender: TObject);
begin
        CBtiposrelacionJur.KeyValue := vTipoAfiliacion;
end;

procedure TfrmCreacionPersona.CBTiposRelacionJurExit(Sender: TObject);
begin
        vTipoAfiliacion := CBtiposrelacionJur.KeyValue;
        InfoConyuge.TabVisible := false;
        PageControl.ActivePageIndex := 1;
        EdProfesion.SetFocus;
end;

procedure TfrmCreacionPersona.EdFechaAfiliacionExit(Sender: TObject);
begin
        vFechaAfiliacion := EdFechaAfiliacion.Date;
end;

procedure TfrmCreacionPersona.EdFechaAfiliacionJurExit(Sender: TObject);
begin
        vFechaAfiliacion := EdFechaAfiliacionJur.Date;
end;

procedure TfrmCreacionPersona.CBTipoPersonaJurEnter(Sender: TObject);
begin
        CBtipopersonaJur.KeyValue := vTipoPersona;
        CBtipopersonaJur.DropDown;
end;

procedure TfrmCreacionPersona.CBTipoPersonaJurExit(Sender: TObject);
begin
        vTipoPersona := CBtipopersonaJur.KeyValue;
end;

procedure TfrmCreacionPersona.CBciiuJurEnter(Sender: TObject);
begin
        CBciiuJur.KeyValue := vCiiu;
        CBciiuJur.DropDown;
end;

procedure TfrmCreacionPersona.CBciiuJurExit(Sender: TObject);
begin
        vCiiu := CBciiuJur.KeyValue;
end;

procedure TfrmCreacionPersona.EdNumeroEscrituraEnter(Sender: TObject);
begin
        EdNumeroEscritura.Text := vNumeroEscritura;
        EdNumeroEscritura.SelectAll;
end;

procedure TfrmCreacionPersona.EdNumeroEscrituraExit(Sender: TObject);
begin
    vNumeroEscritura := EdNumeroEscritura.Text;
end;

procedure TfrmCreacionPersona.EdFechaNacimientoJurExit(Sender: TObject);
begin
        vFechaNacimiento := EdFechaNacimientoJur.Date;
end;

procedure TfrmCreacionPersona.EdDuracionSociedadEnter(Sender: TObject);
begin
        EdDuracionSociedad.Text := inttostr(vDuracionSociedad);
        EdDuracionSociedad.SelectAll;
end;

procedure TfrmCreacionPersona.EdDuracionSociedadExit(Sender: TObject);
begin
    vDuracionSociedad := strtoint(EdDuracionSociedad.Text);
end;

procedure TfrmCreacionPersona.EdMatriculaMercantilExit(Sender: TObject);
begin
    vMatriculaMercantil := EdMatriculaMercantil.Text;
end;

procedure TfrmCreacionPersona.EdMatriculaMercantilEnter(Sender: TObject);
begin
        EdMatriculaMercantil.Text := vMatriculaMercantil;
        EdMatriculaMercantil.SelectAll;
end;

procedure TfrmCreacionPersona.EdFechaNacimientoEnter(Sender: TObject);
begin
        EdFechaNacimiento.Date := vFechaNacimiento;
end;

procedure TfrmCreacionPersona.EdCapitalSocialEnter(Sender: TObject);
begin
        EdCapitalSocial.Text := FormatCurr('0.00',vCapitalSocial);
        EdCapitalSocial.SelectAll;
end;

procedure TfrmCreacionPersona.EdCapitalSocialExit(Sender: TObject);
begin
        if EdCapitalSocial.Text = '' then EdCapitalSocial.Text := '0.00';
        vCapitalSocial:= StrToFloat(EdCapitalSocial.Text);
        EdCapitalSocial.Text := FormatCurr('#,0.00',vCapitalSocial);
end;

procedure TfrmCreacionPersona.EdLugarExpedicionEnter(Sender: TObject);
begin
        EdLugarExpedicion.Text := vLugarExpedicion;
        EdLugarExpedicion.SelectAll;
end;

procedure TfrmCreacionPersona.EdLugarExpedicionExit(Sender: TObject);
begin
        vLugarExpedicion := EdLugarExpedicion.Text;
end;

procedure TfrmCreacionPersona.EdFechaExpedicionEnter(Sender: TObject);
begin
        EdFechaExpedicion.Date := vFechaExpedicion;
end;

procedure TfrmCreacionPersona.EdFechaExpedicionExit(Sender: TObject);
begin
        vFechaExpedicion := EdFechaExpedicion.Date;
end;

procedure TfrmCreacionPersona.EdDuracionSociedadKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
end;

procedure TfrmCreacionPersona.EdNumeroEscrituraKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
end;

procedure TfrmCreacionPersona.EdCapitalSocialKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
end;

procedure TfrmCreacionPersona.CmdFirmaClick(Sender: TObject);
var Bitmap:TBitmap;
begin
    case firmaStatus of
    0: begin
         strClassID := GIIEPad1.GetProviderClassID(0);
         strProviderDesc := GIIEPad1.GetProviderDescription(strClassID);
         if  (GIIEPad1.OpenProvider(strClassID)) Then
         begin
           g_fConnected := True;
           if (GIIEPad1.OpenConnection(0)) Then
           begin
            g_xMin := GIIEPad1.ConnGetDataRangeMinX;
            g_xMax := GIIEPad1.ConnGetDataRangeMaxX;
            g_yMin := GIIEPad1.ConnGetDataRangeMinY;
            g_yMax := GIIEPad1.ConnGetDataRangeMaxY;
            g_fOpened := True;
            Bitmap := nil;
            try
              Bitmap := TBitmap.Create;
              Bitmap.Width := 320;
              Bitmap.Height := 142;
              ImgFirmaC.Picture.Graphic := Bitmap;
            finally
              Bitmap.Free;
            end;
            with ImgFirmaC do begin
             Canvas.Pen.Color := clWhite;
             Canvas.Brush.Color := clWhite;
             Canvas.Polygon([Point(0, 0), Point(320, 0),
                            Point(320, 143), Point(0, 143)]);
             Canvas.Pen.Color := clBlack;
            end;
            firmaStatus := 1;
            CmdFirma.Caption := 'Finalizar Firma';
            CmdReintentar.Enabled := True;
            Application.ProcessMessages;
           end;
         end
         else
         begin
            MessageDlg('Error Conectando con el Periferico',mtError,[mbcancel],0);
            Exit;
         end;
       end;
    1: begin
        GIIEPad1.CloseConnection;
        GIIEPad1.CloseProvider;
        g_fConnected := False;
        g_fOpened := False;
        CmdFirma.Caption := 'Tomar Firma';
        CmdReintentar.Enabled := False;
        firmaStatus := 0;
       end;
    end;


end;

procedure TfrmCreacionPersona.CmdTomarFotoClick(Sender: TObject);
var frmTomarFoto:TfrmTomarFoto;
begin
        frmTomarFoto := TfrmTomarFoto.Create(Self);
        if frmTomarFoto.ShowModal = mrOk then
        begin
           ImgFotoC.Picture.LoadFromFile('C:\foto.bmp');
        end;

end;

procedure TfrmCreacionPersona.CmdReintentarClick(Sender: TObject);
begin
         with ImgFirmaC do begin
            Canvas.Pen.Color := clWhite;
            Canvas.Brush.Color := clWhite;
            Canvas.Polygon([Point(0, 0), Point(307, 0),
                           Point(307, 143), Point(0, 143)]);
            Canvas.Pen.Color := clBlack;
         end;
        if g_fOpened then
           GIIEPad1.CloseConnection;
        if g_fConnected then
           GIIEPad1.CloseProvider;
        firmaStatus := 0;
        CmdFirma.Click;


end;

procedure TfrmCreacionPersona.GIIEPad1PadData(Sender: TObject; abs_x,
  abs_y, abs_z: Integer; fTouch, fTap: WordBool; bmButtonState: Smallint;
  dwTimeStamp, dwSequenceNum: Integer);
var x,y:Integer;
begin
    x := (imgFirmaC.Width * (abs_x - g_xMin)) div (g_xMax - g_xMin);
    y := (imgFirmaC.Height * (abs_y - g_yMin)) div (g_yMax - g_yMin);
    if  (not  fTouch) Then
    begin
        ImgFirmaC.Canvas.MoveTo(x,y);
        g_fFirstTouch := True;
    end
    else
        if  (not  g_fFirstTouch) then
            imgFirmaC.Canvas.LineTo(x, y)
        else
        begin
            imgFirmaC.Canvas.MoveTo(x, y);
            g_fFirstTouch := False;
        end;

    g_lastX := x;
    g_lastY := y;

end;

procedure TfrmCreacionPersona.InfoImagenesEnter(Sender: TObject);
begin
        EdMensaje.Caption := 'Imagenes';
end;

procedure TfrmCreacionPersona.EdEstudioClick(Sender: TObject);
begin
        if EdEstudio.Checked then
           vEducacion := BooleanoToInt(True)
        else
           vEducacion := BooleanoToInt(False);
end;

procedure TfrmCreacionPersona.EdDescripcionIngresosConyugeExit(
  Sender: TObject);
begin
        vDescripcionIngresos := EdDescripcionIngresosConyuge.Text;
end;

procedure TfrmCreacionPersona.CmdTomarHuellaClick(Sender: TObject);
var frmRegister:TfrmRegister;
    m_loop:Integer;
begin
        frmRegister := TfrmRegister.Create(Self);
        frmRegister.ShowModal;
        hayHuella := False;
        if frmRegister.Valido then begin
         hayHuella := True;
         blobSize := frmRegister.Tamano;
         for m_loop := 0 to blobSize - 1 do
                pvData[m_loop] := frmRegister.Datos[m_loop];
         ImgHuellaC.Picture.Bitmap.Canvas.Draw(0,0,frmRegister.Image4.Picture.Graphic);
         end
        else
         blobSize := 0;

        frmRegister.Free;
end;

end.

