unit UnitDesembolso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery, Buttons, Grids,
  DBGrids, ExtCtrls, ComCtrls, IBDatabase, IBSQL, JvEdit, JvTypedEdit,
  JvStaticText, DBClient, CommCtrl, JvLabel, Mask, JclSysUtils, StrUtils,
  JvGroupBox, Menus, Math, FR_DSet, FR_DBSet, FR_Class, pr_Common,
  pr_TxClasses, DateUtils, JclDateTime, frRtfExp;

type
  TFrmDesembolso = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    CBtiposid: TDBLookupComboBox;
    EdNombre: TEdit;
    EdNumeroIdentificacion: TMemo;
    GroupBox2: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label5: TLabel;
    EdFechaDesembolso: TDateTimePicker;
    EdFechaPago: TDateTimePicker;
    EdNumeroColocacion: TEdit;
    EdFechaVencimiento: TDateTimePicker;
    EdFechaCapital: TDateTimePicker;
    EdFechaInteres: TDateTimePicker;
    Panel4: TPanel;
    CmdGrabar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdVerTabla: TBitBtn;
    CmdInforme: TBitBtn;
    IBsolicitud: TIBQuery;
    IBTSolicitud: TIBTransaction;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    DBsolicitud: TDBLookupComboBox;
    DataSource1: TDataSource;
    BitBuscar: TBitBtn;
    EDclasificacion: TJvEdit;
    EDlinea: TJvEdit;
    EDinversion: TJvEdit;
    EDrespaldo: TJvEdit;
    EDgarantia: TJvEdit;
    EDvalorcolocacion: TJvCurrencyEdit;
    EDplazo: TJvEdit;
    EDamortizacap: TJvEdit;
    EDamortizaint: TJvEdit;
    EDpuntos: TJvEdit;
    EDtasaefectiva: TJvEdit;
    EDtasanom: TJvEdit;
    EDtipocuota: TJvEdit;
    Edenteaprobador: TJvEdit;
    CDgarantias: TClientDataSet;
    CDgarantiasid_identificacion: TStringField;
    CDgarantiasid_persona: TStringField;
    CDgarantiasnombre: TStringField;
    CDgarantiasapellido1: TStringField;
    CDgarantiasapellido2: TStringField;
    CDgarantiascsc_garantia: TIntegerField;
    DSgarantias: TDataSource;
    IBtipoid: TIBQuery;
    IBTransaction2: TIBTransaction;
    DStipoid: TDataSource;
    CDgarantiareal: TClientDataSet;
    CDgarantiarealnumero_escritura: TStringField;
    CDgarantiarealfecha_escritura: TDateField;
    CDgarantiarealnombre_notaria: TStringField;
    CDgarantiarealciudad_notaria: TStringField;
    CDgarantiarealmatricula: TStringField;
    CDgarantiarealfecha_registro: TDateField;
    CDgarantiarealavaluo: TCurrencyField;
    CDgarantiarealcuentas_orden: TCurrencyField;
    CDgarantiarealpoliza_incendio: TStringField;
    CDgarantiarealvalor_asegurado: TCurrencyField;
    CDgarantiarealfecha_fin_poliza: TDateField;
    DSgarantiareal: TDataSource;
    CDgarantiarealfecha_avaluo: TDateField;
    IBSQL2: TIBSQL;
    CBtasavariable: TDBLookupComboBox;
    EDperiodogracia: TJvEdit;
    Label7: TLabel;
    Label17: TLabel;
    EdValorCuota: TStaticText;
    Edcuentaaportes: TJvStaticText;
    Label6: TLabel;
    Label28: TLabel;
    EdNotaContable: TMaskEdit;
    Edtipotasa: TComboBox;
    JvGroupBox1: TJvGroupBox;
    JvGroupBox2: TJvGroupBox;
    BTtotal: TBitBtn;
    BTparcial: TBitBtn;
    BTadmisible: TBitBtn;
    BTnoadmisible: TBitBtn;
    DBGridReal: TDBGrid;
    DBGridPersonal: TDBGrid;
    Grupoinformacion: TGroupBox;
    DBGridInicial: TDBGrid;
    DBGridDescParcial: TDBGrid;
    CDcolParcial: TClientDataSet;
    CDcolParcialid_agencia: TIntegerField;
    CDcolParcialid_colocacion: TStringField;
    CDcolParcialcuotas_liquidar: TIntegerField;
    CDcolParcialfechacorte: TDateField;
    CDcolParcialclasificacion: TIntegerField;
    CDcolParcialgarantia: TIntegerField;
    CDcolParcialcategoria: TStringField;
    CDcolParcialestado: TIntegerField;
    CDcolParcialvalorcuota: TCurrencyField;
    CDcolParcialfechapagok: TDateField;
    CDcolParcialfechapagoi: TDateField;
    CDcolParcialtipointeres: TIntegerField;
    CDcolParcialpuntosadic: TCurrencyField;
    CDcolParcialsaldo_actual: TCurrencyField;
    CDcolParcialamortizak: TIntegerField;
    CDcolParcialamortizai: TIntegerField;
    CDcolParcialdiasproroga: TIntegerField;
    DScolParcial: TDataSource;
    CDcuotas: TClientDataSet;
    DScuotas: TDataSource;
    CDcuotasid_agencia: TIntegerField;
    CDcuotasid_colocacion: TStringField;
    CDcuotascuotas: TIntegerField;
    CDcuotasfechacorte: TDateField;
    CDcuotasclasificacion: TIntegerField;
    CDcuotasgarantia: TIntegerField;
    CDcuotascategoria: TStringField;
    CDcuotasestado: TIntegerField;
    CDcuotasvalorcuota: TCurrencyField;
    CDcuotasfechapagok: TDateField;
    CDcuotasfechapagoi: TDateField;
    CDcuotastipointeres: TIntegerField;
    CDcuotasvalor_tasa: TCurrencyField;
    CDcuotasvalor_mora: TCurrencyField;
    CDcuotaspuntos: TCurrencyField;
    CDcuotassaldoactual: TCurrencyField;
    CDcuotasamortizak: TIntegerField;
    CDcuotasamortizaint: TIntegerField;
    CDcuotasdiasprorroga: TIntegerField;
    PopupMenu1: TPopupMenu;
    ConsultaColocacin1: TMenuItem;
    DBGridCuotas: TDBGrid;
    PopupMenu2: TPopupMenu;
    ConsultaColocacion1: TMenuItem;
    BTliquida: TBitBtn;
    IBConsecB: TIBSQL;
    IBExtracto: TIBSQL;
    CDcolParcialvalortasa: TFloatField;
    CDcolParcialvalormora: TFloatField;
    IBTransaction3: TIBTransaction;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    Report: TprTxReport;
    IBQueryGarPersonal: TIBQuery;
    IBQuerycolocacion: TIBQuery;
    IBQuerycontable: TIBQuery;
    IBQuerytabla: TIBQuery;
    IBQuerytablaID_COLOCACION: TIBStringField;
    IBQuerytablaCUOTA_NUMERO: TIntegerField;
    IBQuerytablaFECHA_A_PAGAR: TDateField;
    IBQuerytablaCAPITAL_A_PAGAR: TIBBCDField;
    IBQuerytablaINTERES_A_PAGAR: TIBBCDField;
    IBQuerytablaTOTALCUOTA: TIBBCDField;
    IBQueryGarReal: TIBQuery;
    IBtranreporte: TIBTransaction;
    frCompositeReport1: TfrCompositeReport;
    frDBDataSet2: TfrDBDataSet;
    IBQuery: TIBQuery;
    IBTransaction4: TIBTransaction;
    IBQuery1: TIBQuery;
    CDcolParcialtipo: TIntegerField;
    CDcuotastipo: TIntegerField;
    IBQuery2: TIBQuery;
    IBTransaction5: TIBTransaction;
    frDBDataSet3: TfrDBDataSet;
    frDBDataSet4: TfrDBDataSet;
    BTcuotas: TBitBtn;
    IBgrupo1: TIBQuery;
    IBgrupo2: TIBQuery;
    IBTgrupos: TIBTransaction;
    reporte: TprTxReport;
    AgregarCrdito1: TMenuItem;
    IBDescuentos: TIBQuery;
    IBSQL3: TIBSQL;
    IBConsecutivo: TIBSQL;
    IBTConsecutivo: TIBTransaction;
    cmdnuevo: TSpeedButton;
    frReport2: TfrReport;
    CDcuotastipo_c: TStringField;
    CDliquidacion: TClientDataSet;
    CDliquidacioncuota: TIntegerField;
    CDliquidacionfecha_pago: TDateField;
    CDliquidacioncapital: TCurrencyField;
    CDliquidacioninteres: TCurrencyField;
    CDliquidacionsaldo: TCurrencyField;
    CDliquidaciontotalcuota: TCurrencyField;
    frRtfAdvExport1: TfrRtfAdvExport;
    PopupReal: TPopupMenu;
    Eliminar1: TMenuItem;
    Modificar1: TMenuItem;
    Agregar1: TMenuItem;
    IBSQL4: TIBSQL;
    frDBDataSet5: TfrDBDataSet;
    IBhorario: TIBQuery;
    IBTransaction7: TIBTransaction;
    IBSQL5: TIBSQL;
    IBSQL6: TIBSQL;
    IBSQL7: TIBSQL;
    IBTransaction8: TIBTransaction;
    IBSQL8: TIBSQL;
    GroupBox4: TGroupBox;
    Chedad: TCheckBox;
    Chreestructurado: TCheckBox;
    Chvdeudor: TCheckBox;
    IBentidad: TIBQuery;
    CHcredivida: TCheckBox;
    BTJudCas: TBitBtn;
    DBGridJudicial: TDBGrid;
    Panel1: TPanel;
    Label8: TLabel;
    DSJudicial: TDataSource;
    CDJudicial: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    DateField1: TDateField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField2: TStringField;
    IntegerField5: TIntegerField;
    CurrencyField1: TCurrencyField;
    DateField2: TDateField;
    DateField3: TDateField;
    IntegerField6: TIntegerField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IntegerField10: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure CBtiposidEnter(Sender: TObject);
    procedure CBtiposidKeyPress(Sender: TObject; var Key: Char);
    procedure CBtiposidExit(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure EdNumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBsolicitudExit(Sender: TObject);
    procedure DBsolicitudKeyPress(Sender: TObject; var Key: Char);
    procedure BitBuscarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdTipoTasaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure EDperiodograciaKeyPress(Sender: TObject; var Key: Char);
    procedure EDperiodograciaEnter(Sender: TObject);
    procedure EDperiodograciaExit(Sender: TObject);
    procedure EdtipotasaExit(Sender: TObject);
    procedure CBtasavariableClick(Sender: TObject);
    procedure CBtasavariableKeyPress(Sender: TObject; var Key: Char);
    procedure CBtasavariableExit(Sender: TObject);
    procedure EdtipotasaKeyPress(Sender: TObject; var Key: Char);
    procedure EDtasaefectivaExit(Sender: TObject);
    procedure BTadmisibleClick(Sender: TObject);
    procedure BTnoadmisibleClick(Sender: TObject);
    procedure BTtotalClick(Sender: TObject);
    procedure BTparcialClick(Sender: TObject);
    procedure ConsultaColocacin1Click(Sender: TObject);
    procedure ConsultaColocacion1Click(Sender: TObject);
    procedure EDtasaefectivaKeyPress(Sender: TObject; var Key: Char);
    procedure EDvalorcolocacionKeyPress(Sender: TObject; var Key: Char);
    procedure EDtasanomKeyPress(Sender: TObject; var Key: Char);
    procedure BTmostrarClick(Sender: TObject);
    procedure BTliquidaClick(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure DBGridCuotasDblClick(Sender: TObject);
    procedure BTcuotasClick(Sender: TObject);
    procedure AgregarCrdito1Click(Sender: TObject);
    procedure EdFechaPagoExit(Sender: TObject);
    procedure EdFechaPagoKeyPress(Sender: TObject; var Key: Char);
    procedure EDvalorcolocacionExit(Sender: TObject);
    procedure EDpuntosKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaPagoChange(Sender: TObject);
    procedure DBGridRealKeyPress(Sender: TObject; var Key: Char);
    procedure Eliminar1Click(Sender: TObject);
    procedure Modificar1Click(Sender: TObject);
    procedure Agregar1Click(Sender: TObject);
    procedure ChedadClick(Sender: TObject);
    procedure CHcredividaClick(Sender: TObject);
    procedure BTJudCasClick(Sender: TObject);
  private
    vvalorpuntos: single;
    ho1,ho2,ho3,hs1,hs2,hs3,hs4 :string;// variables para el horario
    validacion_equivida :Boolean;//valida si el seguro equivida puede aplicarse.
    vvalortasaefectiva :Single;
    vId_vida :Boolean;
    vId_exequial :Boolean;
    Valida_colocaciones :Boolean;
    TasaNominal: Double;
    id_colocacion: string;
    vnocomprobante :string;
    valida_extracto: Boolean;
    Vididentificacion :Integer;
    VidPersona :string;
    interes_anticipado: boolean;
    valida_colocacion: boolean;
    contador: integer;
    es_liquidaciontotal: boolean;
    vfechahora: tdate;
    es_desembolsoparcial: boolean;
    es_liquidacion: boolean;
    reciprocidad :Single;
    mensaje: string;
    v_cuota: currency;
    des_cartera :Currency;
    des_equivida :Currency;
    des_exequial :Currency;
    valor_total: currency;
    aportes_r: currency;
    descripcion_agencia: string;
    lugar_identificacion: string;
    verifica_liquidacion: boolean;
    es_mayor: boolean;
    VvalorDesembolso: currency;

    function descripcion(opcion, tipo: integer): string;
    procedure inicializar;
    procedure LimpiaInformacion;
    procedure colocaciones(colocacion :string);
    procedure ColocacionesJudCas(Colocacion:string);
    procedure barrido_cuotas(id_persona,id_colocacion:string;id_identificacion:Integer);
    procedure activa_colocacion;
    procedure busca_fianzas(id_persona: string;
      id_identificacion: integer);
    function seguro(id_seguro: integer): currency;
    procedure liquidatotal;
    procedure imprimir_reporte(cadena: string);
    procedure liquidaparcial;
    procedure grabar_extracto;
    procedure tablaliquidacion;
    procedure grabar_garantias;
    procedure contabilizar;
    function BuscarAportes(TipoId: Integer; DocumentoId: string): Currency;
    function VerificarAportesCreditosAnt(TipoIdentificacion: Integer;
      NumeroIdentificacion: String): Currency;
    function CrearColocacion: Boolean;
    function GrabarColocacion: boolean;
    procedure interes_ant;
    procedure Actualiza_temp;
    procedure Elimina_temp;
    procedure cambia_estado;
    procedure grupos(valor: boolean);
    procedure contabilizar_descuentos;// REGISTRA EN CONTABLEMENTE LOS DESCUNTOS DE CARTERA
    function recupera_codigo(codigo: integer): string;// EXTRAE CODIGO PUC
    procedure actualiza_tabladesembolso(es_nuevo:Boolean);
    function extrae_valor: currency;
    procedure verifica_creditos;
    function es_juridico(id_persona:string;id_identificacion:integer): string;
    function busca_tipo(id_persona: string;
      id_identificacion: integer): string;
    procedure relacion_seguro;
    function recupera_saldo(codigo, estado: Integer;
      tipo: string): Currency;
    function verifica_fianza: boolean;
    procedure inserta_marcas;
    function Capitalizacion: Currency;
    { Private declarations }
  public
  published

    { Public declarations }
  end;

var
  FrmDesembolso: TFrmDesembolso;
  colocacion:string;
  vcolocacion : string;
  vDesembolso : Currency;
  vEstadoColocacion:Integer;
  vCuentaAportes:Integer;
  vIdIdentificacion:Integer;
  vIdPersona:String;
  consecutivo:integer;
  consec:string;
  vNotaContable:string;
  DigitoC:String;
  vCodigoPucAportes:String;
  vCodigoPucAhorros:String;
  ValorAportes:Currency;
  ValorAhorros:Currency;
  EsAnulado : Integer;
  EsVigente : Integer;
  Empleado1 : string;
  vFechaPago :TDate;
  vDctoCapitalizacion:Currency;  
implementation

uses UnitdmColocacion, unitGlobales, UnitdmGeneral, UnitDmSolicitud, unitGlobalesCol,
  UnitConsultaColocacion, UnitConsultaLiquidacion, UnitPantallaProgreso,
  UnitImpresion, unitMain, UnitVistaPreliminar, UnitAgregaGarantia;
var
    VidColocacion :string;
    Es_Fundacion :Boolean;
    vSeguro_vida :Currency;
    vSeguro_exequial :Currency;
    vagencia :Integer;
    vdesembolsoparcial :Boolean;
    vIdSolicitud :string;
    vTipoId:Integer;
    vNumeroId:String;
    vClasificacion:Integer;
    vLinea:Integer;
    vInversion:Integer;
    vRespaldo:Integer;
    vGarantia:Integer;
    vFechaDesembolso:TDate;
//    vDesembolso:Currency;
    vPlazo:Integer;
    vTipoTasa:String;
    vTasaVariable:Integer;
    vPuntosAdicionales:Single;
    vTasaEfectiva:Single;
    vTasaMora:Single;
    vTipoCuota:Integer;
    vAmortizaCapital:Integer;
    vAmortizaInteres:Integer;
    vPeriodoGracia:Integer;
    vValorCuota:Currency;
    vNumeroColocacion:String;
    vFechaVencimiento:TDate;
    vFechaCapital:TDate;
    vFechaInteres:TDate;
    vTasaNominal:Single;
    vEnteAprobador:Integer;
//    vNotaContable:string;
    vCtaAportes:Integer;
   // vcuentaAportes :Integer;
    vDigitoCta:Integer;
    //VnotaContable :string;
    saldo :Currency;

    vCapitalVencido:String;
    vInteresVencido:String;
    vCuotaTipo:String;

{ Variables de Descuentos que se aplican al desembolso}
//    vDctoAportes:Currency;
//    vDctoPapeleria:Currency;
//    vDctoSeguro:Currency;
//    vDctoCapitalizacion:Currency;
    DiasPago:Integer;
{fin Variables de Descuento}
{ Otras }
    vTotalDeudas:Currency;
    vCortoPlazo:Currency;
    vLargoPlazo:Currency;
    vInteresAnticipado:Currency;
{ fin Otras }

{ Variables de Dto Judicial }
PermiteEliJud:Boolean;
NoGrabaDes:Boolean;


{$R *.dfm}

procedure TFrmDesembolso.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
        DmSolicitud := TDmSolicitud.Create(Self);
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        IBtipoid.Open;
        IBtipoid.Last;
        with IBhorario do
        begin
          Close;
          Open;
          ho1 := FieldByName('HORARIO').AsString;
          Next;
          ho2 := FieldByName('HORARIO').AsString;
          Next;
          ho3 := FieldByName('HORARIO').AsString;
          Next;
          hs1 := FieldByName('HORARIO').AsString;
          Next;
          hs2 := FieldByName('HORARIO').AsString;
          Next;
          hs3 := FieldByName('HORARIO').AsString;
          Next;
          hs4 := FieldByName('HORARIO').AsString;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          SQL.Add('FROM');
          SQL.Add('"gen$agencia"');
          SQL.Add('WHERE');
          SQL.Add('("gen$agencia".ID_AGENCIA = :ID_AGENCIA)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          descripcion_agencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
          Close;
        end;

end;

procedure TFrmDesembolso.CBtiposidEnter(Sender: TObject);
begin
        CBtiposid.DropDown
end;

procedure TFrmDesembolso.CBtiposidKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.CBtiposidExit(Sender: TObject);
begin
        try
          vTipoId := CBtiposid.KeyValue;
        except
          CBtiposid.SetFocus;
        end;
end;

procedure TFrmDesembolso.EdNumeroIdentificacionExit(Sender: TObject);
begin
        if EdNumeroIdentificacion.Text = '' then
        begin
           CBtiposid.SetFocus;
           Exit;
        end;
        dmColocacion.IBDSpersona.Close;
        IBsolicitud.Close;
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
        with DmColocacion.IBDSpersona do
        begin
             ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
             Active := true;
             Last;
             First;
             if RecordCount = 1 then
               begin
                 vNumeroId := EdNumeroIdentificacion.Text;
                 EdNombre.Text  := FieldByName('PRIMER_APELLIDO').AsString + ' '+ FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString;
                 with IBSolicitud do
                 begin
                   if Transaction.InTransaction then
                      Transaction.Commit;
                   Transaction.StartTransaction;
                   Open;
                   Close;
                   ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
                   ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
                   Open;
                   if RecordCount < 1 then
                    begin
                      MessageDlg('No Posee Solicitudes de Crédito Aprobadas',mtError,[mbok],0);
                      EdNumeroIdentificacion.SetFocus;
                    //inicializar;
                      Exit;
                   end;
                   Vididentificacion := CBtiposid.KeyValue;
                   VidPersona := vNumeroId;
                  DBsolicitud.DropDown;
                 end;
               end
               else
               begin
                MessageDlg('Persona no Existe',mtError,[mbok],0);
                EdNumeroIdentificacion.SetFocus
                 //CmdCrearPersona.SetFocus;
                end;
             Close;
        end;

//Busco Numero de Cuenta
        With IBSQL1 do
         begin
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('SELECT *');
           SQL.Add('FROM P_CAP_0008_JUD (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
           ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
           ExecQuery;
           vCtaAportes := FieldByName('NUMERO_CUENTA').AsInteger;
           vDigitoCta  := FieldByName('DIGITO_CUENTA').AsInteger;
           EdCuentaAportes.Caption := IntToStr(vCtaAportes);
           Close;
           SQL.Clear;
           SQL.Add('select LUGAR_EXPEDICION, FECHA_NACIMIENTO from "gen$persona"');
           SQL.Add('where ID_PERSONA = :ID_PERSONA and');
           SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION');
           ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
           ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
           ExecQuery;
           lugar_identificacion := FieldByName('LUGAR_EXPEDICION').AsString;
           if (YearsBetween(Now,FieldByName('FECHA_NACIMIENTO').AsDate)) > 70 then
              es_mayor := True
           else
              es_mayor := False;
           Chedad.Hint := IntToStr(YearsBetween(Now,FieldByName('FECHA_NACIMIENTO').AsDate)) + ' Años';
           Chedad.Checked := es_mayor;
           Close;
         end;


end;

procedure TFrmDesembolso.EdNumeroIdentificacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.DBsolicitudExit(Sender: TObject);
begin
        try
          vIdSolicitud := DBsolicitud.KeyValue;
        except
          DBsolicitud.SetFocus;
        end;
end;

procedure TFrmDesembolso.DBsolicitudKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.BitBuscarClick(Sender: TObject);
var     nombre,apellido1,apellido2 :string;
        valor_desmbolso :Currency;
        desc_garantia :string;
begin
        mensaje := '';
        if DBsolicitud.Text = '' then
        begin
           DBsolicitud.SetFocus;
           Exit;
        end;
        if vIdSolicitud <> '' then
        begin
          verifica_creditos;// BUSCA CREDITOS CASTIGADOS Y JURIDICOS
          if mensaje <> '' then
          begin
            MessageDlg('No se Puede Desembolsar Porque la(s) Colocacion(es) No'+mensaje,mtWarning,[mbok],0);
            Exit;
          end;
          if verifica_fianza then
          begin
             MessageDlg('Uno o Varios de los Codeudores Posee Fianzas Atrasadas',mtWarning,[mbok],0);
             Exit;
          end;
          grupos(True);
          Elimina_temp;
          valida_colocacion := True;
          with IBSQL1 do
          begin
            Close;
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"col$solicitud".ID_SOLICITUD,');
            SQL.Add('"col$solicitud".ESTADO,');
            SQL.Add('"col$solicitud".VALOR_SOLICITADO,');
            SQL.Add('"col$solicitud".PLAZO,');
            SQL.Add('"col$solicitud".AMORTIZACION,');
            SQL.Add('"col$solicitud".GARANTIA,');
            SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
            SQL.Add('"col$solicitud".TIPO_CUOTA,');
            SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
            SQL.Add('"col$solicitud".LINEA,');
            SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
            SQL.Add('"col$solicitud".OFICINA,');
            SQL.Add('"col$solicitud".ENTE_APROBADOR,');
            SQL.Add('"col$enteaprobador".DESCRIPCION_ENTE_APROBADOR,');
            SQL.Add('"col$solicitud".PLAZO_APROBADO,');
            SQL.Add('"col$solicitud".RESPALDO,');
            SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,');
            SQL.Add('"col$solicitud".VALOR_APROBADO,');
            SQL.Add('"col$solicitud".S_VIDA,');
            SQL.Add('"col$solicitud".S_EXEQUIAL,');
            SQL.Add('"col$solicitud".PAGO_INTERES,');
            SQL.Add('"col$solicitud".INVERSION,');
            SQL.Add('"col$solicitud".ES_DESEMBOLSO_PARCIAL,');
            SQL.Add('"col$solicitud".CLASIFICACION,');
            SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
            SQL.Add('"col$inversion".DESCRIPCION_INVERSION,');
            SQL.Add('"col$solicitud".DESCRIPCION_GARANTIA AS DESC_GARANTIA,');
            SQL.Add('"col$solicitud".ES_FUNDACION');
            SQL.Add('FROM');
            SQL.Add('"col$solicitud"');
            SQL.Add('INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA = "col$garantia".ID_GARANTIA)');
            SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$solicitud".TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
            SQL.Add('INNER JOIN "col$lineas" ON ("col$solicitud".LINEA = "col$lineas".ID_LINEA)');
            SQL.Add('INNER JOIN "col$enteaprobador" ON ("col$solicitud".ENTE_APROBADOR = "col$enteaprobador".ID_ENTE_APROBADOR)');
            SQL.Add('INNER JOIN "col$respaldo" ON ("col$solicitud".RESPALDO = "col$respaldo".ID_RESPALDO)');
            SQL.Add('INNER JOIN "col$inversion" ON ("col$solicitud".INVERSION = "col$inversion".ID_INVERSION)');
            SQL.Add(' INNER JOIN "col$clasificacion" ON ("col$solicitud".CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
            SQL.Add('WHERE');
            SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ExecQuery;
            if FieldByName('ESTADO').AsInteger = 12 then
               MessageDlg('La Solicitud ha Sido Desembolsada Parcialmente',mtInformation,[mbok],0);
            vId_vida := IntToBool(FieldByName('S_VIDA').AsInteger);
            CHcredivida.Checked := vId_vida;
            vId_exequial := IntToBool(FieldByName('S_EXEQUIAL').AsInteger);
            vagencia := Agencia;
            Es_Fundacion := IntToBool(FieldByName('ES_FUNDACION').AsInteger);
            desc_garantia := FieldByName('DESC_GARANTIA').AsString;
            vdesembolsoparcial := IntToBool(FieldByName('ES_DESEMBOLSO_PARCIAL').AsInteger);
            EdCuentaAportes.Caption := IntToStr(vCtaAportes);
            vcuentaAportes := vCtaAportes;
            EDclasificacion.Text := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
            vClasificacion := FieldByName('CLASIFICACION').AsInteger;
            EDlinea.Text := FieldByName('DESCRIPCION_LINEA').AsString;
            vLinea := FieldByName('LINEA').AsInteger;
            EDinversion.Text := FieldByName('DESCRIPCION_INVERSION').AsString;
            vInversion := FieldByName('INVERSION').AsInteger;
            EDrespaldo.Text := FieldByName('DESCRIPCION_RESPALDO').AsString;
            vRespaldo := FieldByName('RESPALDO').AsInteger;
            EDgarantia.Text := FieldByName('DESCRIPCION_GARANTIA').AsString;
            vGarantia := FieldByName('GARANTIA').AsInteger;
            vDesembolso := FieldByName('VALOR_APROBADO').AsCurrency;
            EDvalorcolocacion.Value := vDesembolso;
            vPlazo := FieldByName('PLAZO_APROBADO').AsInteger;
            EDplazo.Text := IntToStr(vPlazo);
            vAmortizaCapital := FieldByName('AMORTIZACION').AsInteger;
            EDamortizacap.Text := IntToStr(vAmortizaCapital);
            vAmortizaInteres := FieldByName('PAGO_INTERES').AsInteger;
            EDamortizaint.Text := IntToStr(vAmortizaInteres);
            vTipoCuota := FieldByName('TIPO_CUOTA').AsInteger;
            EDtipocuota.Text := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
            vEnteAprobador := FieldByName('ENTE_APROBADOR').AsInteger;
            Edenteaprobador.Text := FieldByName('DESCRIPCION_ENTE_APROBADOR').AsString;
            // verifica si la linea es vivienda
            if vLinea = 7 then
            begin
              vInversion := 3;
              EDinversion.Text := descripcion(3,vInversion);
              vRespaldo := 1;
              EDrespaldo.Text := descripcion(5,vRespaldo);
              vGarantia := 1;
              EDgarantia.Text := descripcion(2,vGarantia);
              vPlazo := 2880;
              EdPlazo.Text := FormatCurr('#0',vPlazo);
            end;
            // IDENTIFICA LA LINEA
            Close;
            SQL.Clear;
            SQL.Add('select TASA,PUNTOS_ADICIONALES,VECES_APORTES from "col$lineas" where ID_LINEA = :ID');
            ParamByName('ID').AsInteger := vLinea;
            ExecQuery;
            vTasaEfectiva := FieldByName('TASA').AsDouble;
            vPuntosAdicionales := FieldByName('PUNTOS_ADICIONALES').AsFloat;
            reciprocidad := FieldByName('VECES_APORTES').AsFloat;
            Close;
            if vLinea = 6 then
            begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"cap$maestro".TASA_EFECTIVA,');
              SQL.Add('"cap$maestro".FECHA_VENCIMIENTO');
              SQL.Add('FROM');
              SQL.Add('"cap$maestro"');
              SQL.Add('WHERE');
              SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = 6) AND');
              SQL.Add('("cap$maestro".NUMERO_CUENTA = :NUMERO)');
              ParamByName('NUMERO').AsInteger := StrToInt(desc_garantia);
              ExecQuery;
              if RecordCount <> 0 then
                 vTasaEfectiva := FieldByName('TASA_EFECTIVA').AsFloat * seguro(7);
            end;
            vvalortasaefectiva := vTasaEfectiva;
            vvalorpuntos := vpuntosadicionales;
            EDpuntos.Text := FormatCurr('#0.00',vPuntosAdicionales);

            //CREDITOS TOTALES
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"gen$infcrediticia".ID_COLOCACION');
            SQL.Add('FROM');
            SQL.Add('"gen$infcrediticia"');
            SQL.Add('WHERE');
            SQL.Add('("gen$infcrediticia".ID_SOLICITUD = :ID_SOLICITUD) AND');
            SQL.Add('("gen$infcrediticia".ID_COLOCACION IS NOT NULL) AND');
            SQL.Add('"gen$infcrediticia".ES_DESCUENTO = 1');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ExecQuery;
            while not Eof do
            begin
              colocaciones(FieldByName('ID_COLOCACION').AsString);
              Next;
            end;
            Close;
            barrido_cuotas(vNumeroId,'',vTipoId);// BUSCA CUOTAS DEUDOR
            busca_fianzas(vNumeroId,vTipoId);

            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"col$codeudor".ID_PERSONA,');
            SQL.Add('"col$codeudor".ID_IDENTIFICACION,');
            SQL.Add('"col$codeudor".ID_ENTRADA');
            SQL.Add('FROM');
            SQL.Add('"col$codeudor"');
            SQL.Add('WHERE');
            SQL.Add('("col$codeudor".ID_SOLICITUD = :ID_SOLICITUD)');
            SQL.Add('and "col$codeudor".ES_CONYUGUE = 0');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ExecQuery;
            while not Eof do
            begin
              barrido_cuotas(FieldByName('ID_PERSONA').AsString,'',FieldByName('ID_IDENTIFICACION').AsInteger);// BUSCA CUOTAS ATRASADAS DE LOS CODEUDORES
              //busca_fianzas(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger);
              with DmColocacion.IBDSpersona do
              begin
                Close;
                ParamByName('ID_IDENTIFICACION').AsInteger := IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger;
                ParamByName('ID_PERSONA').AsString := IBSQL1.FieldByName('ID_PERSONA').AsString;
                Open;
                nombre := FieldByName('NOMBRE').AsString;
                apellido1 := FieldByName('PRIMER_APELLIDO').AsString;
                apellido2 := FieldByName('SEGUNDO_APELLIDO').AsString;
               end;
              CDgarantias.Append;
              CDgarantias.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
              CDgarantias.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
              CDgarantias.FieldValues['csc_garantia'] := FieldByName('ID_ENTRADA').AsInteger;
              CDgarantias.FieldValues['nombre'] := nombre;
              CDgarantias.FieldValues['apellido1'] := apellido1;
              CDgarantias.FieldValues['apellido2'] := apellido2;
              CDgarantias.Post;
              Next;
            end;

            //Busca Creditos Judiciales y Castigados para mostrar en Grid
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"gen$infcrediticia".ID_COLOCACION');
            SQL.Add('FROM');
            SQL.Add('"gen$infcrediticia"');
            SQL.Add('WHERE');
            SQL.Add('("gen$infcrediticia".ID_SOLICITUD = :ID_SOLICITUD) AND');
            SQL.Add('("gen$infcrediticia".ID_COLOCACION IS NOT NULL) AND');
            SQL.Add('"gen$infcrediticia".ES_DESCUENTO = 1 AND');
            SQL.Add('"gen$infcrediticia".ESTADO in (2,3)');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ExecQuery;
            while not Eof do
            begin
              colocacionesjudcas(FieldByName('ID_COLOCACION').AsString);
              if NoGrabaDes then
                begin
                  inicializar;
                  Exit;
                end
              else
                Next;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select *');
            SQL.Add('from "gen$bienesraices"');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD AND');
            SQL.Add('ES_GARANTIAREAL = 1');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ExecQuery;
            while not Eof do
            begin
               CDgarantiareal.Append;
               CDgarantiareal.FieldValues['ciudad_notaria'] := FieldByName('CIUDAD').AsString;
               CDgarantiareal.FieldValues['numero_escritura'] := FieldByName('ESCRITURA').AsString;
               CDgarantiareal.FieldValues['nombre_notaria'] := FieldByName('NOTARIA').AsString;
               CDgarantiareal.FieldValues['matricula'] := FieldByName('MATRICULA').AsString;
               CDgarantiareal.FieldValues['fecha_escritura'] := FieldByName('FECHA_ESCRITURA').AsDate;
               CDgarantiareal.Post;
               Next;
            end;
        if vdesembolsoparcial then
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('SUM("col$desembolsoparcial".VALOR_DESEMBOLSO) AS V_DESEMBOLSO');
           SQL.Add('FROM');
           SQL.Add('"col$desembolsoparcial"');
           SQL.Add('WHERE');
           SQL.Add('("col$desembolsoparcial".ID_SOLICITUD = :ID_SOLICITUD) AND');
           SQL.Add('("col$desembolsoparcial".DESEMBOLSADO = 1)');
           ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
           ExecQuery;
           if RecordCount <> 0 then
           begin
             valor_desmbolso := FieldByName('V_DESEMBOLSO').AsCurrency;
             vDesembolso := vDesembolso - valor_desmbolso;
             es_desembolsoparcial := True;
           end;
           VvalorDesembolso := vDesembolso;
           EDvalorcolocacion.Value := vDesembolso;
           EDvalorcolocacion.ReadOnly := False;
           EDvalorcolocacion.SetFocus;
        end
        else
        begin
          EDperiodogracia.Text := '0';
          EDperiodogracia.SetFocus;
        end;
          end;
        vPeriodoGracia := 0;
        CDcolParcial.Filtered := False;
        CDcuotas.Filtered := False;
        if CDcolParcial.RecordCount <> 0 then
           verifica_liquidacion := True;
            if vTipoCuota = 1 then
            begin
               Edtipotasa.ItemIndex := 0;
               Edtipotasaexit(Self);
               Edtipotasa.Enabled := False;
               EDperiodogracia.SetFocus;
            end
            else
               Edtipotasa.Enabled := True;
        if CDcuotas.RecordCount = 0 then
           BTparcial.Enabled := False
        else
           verifica_liquidacion := True;
        if CDJudicial.RecordCount = 0 then
           BTJudCas.Enabled := False;
        if CDgarantias.RecordCount = 0 then
           BTnoadmisible.Enabled := False;
        if CDgarantiareal.RecordCount = 0 then
           BTadmisible.Enabled := True;
        if (CDcolParcial.RecordCount > 0) or (CDcuotas.RecordCount > 0) or (CDJudicial.RecordCount > 0) then
        begin
           Valida_colocaciones := True;
           BTliquida.Enabled := True;
        end;
       end;//fin valida solicitud
       CmdGrabar.Enabled := True;

end;

function TFrmDesembolso.descripcion(opcion, tipo: integer): string;
begin
        with IBSQL2 do
        begin
          Close;
          if Transaction.InTransaction then
              Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          case opcion of
          1 :begin
               SQL.Add('SELECT');
               SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION AS DESCRIPCION');
               SQL.Add('FROM');
               SQL.Add('"col$clasificacion"');
               SQL.Add('WHERE');
               SQL.Add('("col$clasificacion".ID_CLASIFICACION = :ID)');
             end;
          2 :begin
               SQL.Add('SELECT');
               SQL.Add('"col$garantia".DESCRIPCION_GARANTIA AS DESCRIPCION');
               SQL.Add('FROM');
               SQL.Add('"col$garantia"');
               SQL.Add('WHERE');
               SQL.Add('("col$garantia".ID_GARANTIA = :ID)');
             end;
          3  :begin
               SQL.Add('SELECT');
               SQL.Add('"col$inversion".DESCRIPCION_INVERSION AS DESCRIPCION');
               SQL.Add('FROM');
               SQL.Add('"col$inversion"');
               SQL.Add('WHERE');
               SQL.Add('("col$inversion".ID_INVERSION = :ID)');
              end;
          4  :begin
               SQL.Add('SELECT');
               SQL.Add('"col$lineas".DESCRIPCION_LINEA AS DESCRIPCION');
               SQL.Add('FROM');
               SQL.Add('"col$lineas"');
               SQL.Add('WHERE');
               SQL.Add('("col$lineas".ID_LINEA = :ID)');
              end;
          5  :begin
               SQL.Add('SELECT');
               SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO AS DESCRIPCION');
               SQL.Add('FROM');
               SQL.Add('"col$respaldo"');
               SQL.Add('WHERE');
               SQL.Add('("col$respaldo".ID_RESPALDO = :ID)');
              end;
          6  :begin
               SQL.Add('SELECT');
               SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA AS DESCRIPCION');
               SQL.Add('FROM');
               SQL.Add('"col$tiposcuota"');
               SQL.Add('WHERE');
               SQL.Add('("col$tiposcuota".ID_TIPOS_CUOTA = :ID)');
              end;
          end;
          ParamByName('ID').AsInteger := tipo;
          ExecQuery;
          Result := FieldByName('DESCRIPCION').AsString;
        end;
end;

procedure TFrmDesembolso.CmdCerrarClick(Sender: TObject);
begin
        Close;
//        ShowMessage(IntToStr(DiasEntre(StrToDate('1899/12/31'),StrToDate('2005/03/31'))));
       //cambia_estado;
//        contabilizar_descuentos;
        //actualiza_tabladesembolso(es_desembolsoparcial);
//        Actualiza_temp;
//        valida_colocacion := False;

end;

procedure TFrmDesembolso.inicializar;
begin
    if dmGeneral.IBTransaction1.InTransaction then
       dmGeneral.IBTransaction1.Rollback;
    dmGeneral.IBTransaction1.StartTransaction;
    CmdGrabar.Enabled := False;
    EdValorCuota.Caption := '';
    Chedad.Checked := False;
    Chvdeudor.Checked := True;
    Chreestructurado.Checked := False;
    verifica_liquidacion := False;
    mensaje := '';
    DiasPago := 0;
    BTliquida.Caption := '&Liquidar Cuotas';
    BTliquida.Glyph.LoadFromFile(frmMain.ruta1+ '\reporte\dinero.bmp');
    es_liquidacion :=True;
    es_desembolsoparcial := False;
    grupos(False);
    valida_colocacion := False;
    interes_anticipado := False;
    CBtasavariable.Enabled := False;
    Valida_colocaciones  := True;
    BTliquida.Enabled := False;
    vId_vida := False;
    vId_exequial := False;
    vSeguro_vida := 0;
    vSeguro_exequial := 0;
//      DBsolicitud.KeyValue := -1;
    IBsolicitud.Close;
    CBtiposid.KeyValue := -1;
    EdNumeroIdentificacion.Text := '';
    EdNombre.Text := '';
    limpiainformacion;
    DBgridInicial.Visible := True;
    vvalorpuntos := 0;
    vvalortasaefectiva := 0;
    vTipoId := 1;
    vNumeroId := '';
    vClasificacion := 1;
    vLinea := 1;
    vInversion := 1;
    vRespaldo := 1;
    vGarantia := 1;
    vFechaDesembolso := Date;
    vDesembolso := 0;
    vPlazo := 0;
    vTipoTasa := 'F';
    vTasaVariable := 0;
    vNotaContable := '';
    vPuntosAdicionales := 0;
    vTasaEfectiva := 0;
    vTasaMora := 0;
    vTipoCuota := 1;
    vAmortizaCapital := 0;
    vAmortizaInteres := 0;
    vPeriodoGracia := 0;
    vValorCuota := 0;
    vNumeroColocacion := '';
    vFechaVencimiento := Date;
    vFechaCapital := Date;
    vFechaInteres := Date;
    vTasaNominal := 0;
    vEnteAprobador := 1;
    CHcredivida.Checked := False;
    vCapitalVencido := '';
    vInteresVencido := '';
    vCuotaTipo := '';
    vDctoCapitalizacion := 0;
    vTotalDeudas := 0;
    vCortoPlazo := 0;
    vLargoPlazo := 0;
    vInteresAnticipado := 0;
    Saldo := 0;

        EDclasificacion.Text := '';
        EDlinea.Text := '';
        EDinversion.Text := '';
        EDrespaldo.Text := '';
        EDgarantia.Text := '';
        EDvalorcolocacion.Value := 0;
        EDplazo.Text := '';
        EDamortizaint.Text := '';
        EDamortizacap.Text := '';
        EdTipoTasa.ItemIndex := -1;
//        EDtasavariable.Text := '';
        EDtasaefectiva.Text := '';
        EDpuntos.Text := '';
        EDtipocuota.Text := '';
        EDtasanom.Text := '';
        Edcuentaaportes.Caption := '';
        Edenteaprobador.Text := '';
        DateTime_SetFormat(EdFechaVencimiento.Handle,'''''');
        DateTime_SetFormat(EdFechaCapital.Handle,'''''');
        DateTime_SetFormat(EdFechaInteres.Handle,'''''');
        with dmColocacion do
        begin
          IBDStiposid.Active := true;
          IBDStiposid.Last;
          IBDStiposid.First;
          IBDSclasificacion.Active := true;
          IBDSclasificacion.Last;
          IBDSclasificacion.First;
          IBDSlinea.Active := true;
          IBDSlinea.Last;
          IBDSlinea.First;
          IBDSinversion.Active := true;
          IBDSinversion.Last;
          IBDSinversion.First;
          IBDSrespaldo.Active := true;
          IBDSrespaldo.Last;
          IBDSrespaldo.First;
          IBDSgarantia.Active := true;
          IBDSgarantia.Last;
          IBDSgarantia.First;
//        IBDStipocuota.Active := true;
//        IBDStipocuota.Last;
//        IBDStipocuota.First;
          IBDStasavariable.Active := true;
          IBDStasavariable.Last;
          IBDStasavariable.First;
          IBDSenteaprobador.Active := true;
          IBDSenteaprobador.Last;
          IBDSenteaprobador.First;
        end;
        EdFechaDesembolso.Date := Date;
        vFechaDesembolso := EdFechaDesembolso.Date;
        EdFechaPago.MinDate := Date;
        EdFechaPago.Date := vFechaDesembolso;
        vTipoTasa := 'F';
        CDgarantiareal.CancelUpdates;
        CDgarantias.CancelUpdates;
        CDcuotas.CancelUpdates;
        CDcolParcial.CancelUpdates;
        CDJudicial.CancelUpdates;
        CBtiposid.SetFocus;
        BTtotal.Enabled := True;
        BTparcial.Enabled := True;
        BTadmisible.Enabled := True;
        BTnoadmisible.Enabled := True;
        CmdInforme.Enabled := false;
        PermiteEliJud := False;
        NoGrabaDes := False;
end;

procedure TFrmDesembolso.CmdNuevoClick(Sender: TObject);
begin
        inicializar
end;

procedure TFrmDesembolso.CmdGrabarClick(Sender: TObject);
begin
        fechahoy := fFechaActual;
        if verifica_liquidacion then
        begin
          MessageDlg('Debe liquidar las Cuotas antes de Grabar el Crédito',mtWarning,[mbok],0);
          BTliquida.SetFocus;
          Exit;
        end;
        if extrae_valor > vDesembolso then
        begin
           MessageDlg('Las Cuotas de los Créditos Excede el Valor del Desembolso',mtWarning,[mbok],0);
           Exit;
        end;
        vTasaMora := 15;// valor por omision
        if MessageDlg('Seguro de Crear Esta Nueva Colocación?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        if CrearColocacion then
        begin
           Actualiza_temp;
           cambia_estado;
           actualiza_tabladesembolso(es_desembolsoparcial);
           if vId_vida then
           begin
              relacion_seguro;
           end;
           valida_colocacion := False;
           CmdVerTabla.Enabled := true;
           CmdInforme.Enabled := true;
           self.Caption := 'Nueva Colocación:' + EdNumeroColocacion.Text;
           // Control para registros de seguos equivida
           if dmGeneral.IBTransaction1.InTransaction then
              dmGeneral.IBTransaction1.Commit;
           dmGeneral.IBTransaction1.StartTransaction;
           if IBTransaction1.InTransaction then
              IBTransaction1.Commit;
           IBTransaction1.StartTransaction;
           if IBTransaction4.InTransaction then
              IBTransaction4.Commit;
           IBTransaction4.StartTransaction;
           if IBTransaction5.InTransaction then
              IBTransaction5.Commit;
           IBTransaction5.StartTransaction;
           inserta_marcas;
//           Visado;
           CmdInformeClick(Sender);
        end
        else
        begin
           elimina_temp;
           MessageDlg('No Se Pudo Crear la Nueva Colocación' + #13 + #10 +
                      'Por Favor Verifique',mtError,[mbOK],0);
        end;
end;

procedure TFrmDesembolso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if (vIdSolicitud <> '') and (valida_colocacion = True) then
        begin
          MessageDlg('Se Eliminarán Algunos Datos Temporales',mtInformation,[mbok],0);
          PermiteEliJud := True;
          Elimina_temp;
        end;
        dmColocacion.Free;
        DmSolicitud.Free;
end;

procedure TFrmDesembolso.EdTipoTasaEnter(Sender: TObject);
begin
        if vTipoTasa = 'F' then
         EdTipoTasa.ItemIndex := 0
        else
         EdTipoTasa.ItemIndex := 1;
end;

procedure TFrmDesembolso.FormShow(Sender: TObject);
begin
        try
          Inicializar;
        finally
        end;
end;

procedure TFrmDesembolso.BitBuscarKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmDesembolso.EDperiodograciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.EDperiodograciaEnter(Sender: TObject);
begin
        EdPeriodoGracia.Text := FormatCurr('#0',vPeriodoGracia);
end;

procedure TFrmDesembolso.EDperiodograciaExit(Sender: TObject);
begin
        try
          vPeriodoGracia := StrToInt(EDperiodogracia.Text);
        except
        begin
          EDperiodogracia.Text := '';
          EDperiodogracia.SetFocus;
        end;
        end;
end;

procedure TFrmDesembolso.EdtipotasaExit(Sender: TObject);
begin
        if LeftStr(EdTipoTasa.Text,1) = 'F' then
        begin
            CBtasavariable.Enabled := false;
            CBtasavariable.KeyValue := -1;
//            vTipocuota := 1;
            vTipoTasa := 'F';
            vPuntosAdicionales := 0;
            vTasaEfectiva := vvalortasaefectiva;
            EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);
            EDtasaefectiva.SetFocus;
        end
        else
        begin
            CBtasavariable.Enabled := true;
            CBtasavariable.KeyValue := 1;
            vTasaEfectiva := dmColocacion.IBDStasavariable.FieldValues['VALOR_ACTUAL_TASA'];
            EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);
            vTipoTasa := 'V';
            vPuntosAdicionales := vvalorpuntos;
            CBtasavariable.SetFocus;
        end;

        if vTipoTasa = 'F' then
         begin
           DmColocacion.IBDStipocuota.ParamByName('ES_VARIABLE').AsInteger := 0;
           DmColocacion.IBDStipocuota.ParamByName('ES_FIJA').AsInteger := 1;
         end;
        if vTipoTasa = 'V' then
         begin
           DmColocacion.IBDStipocuota.ParamByName('ES_VARIABLE').AsInteger := 1;
           DmColocacion.IBDStipocuota.ParamByName('ES_FIJA').AsInteger := 0;
           EdTasaEfectiva.Text := '0';
         end;

        if vLinea = 7 then
         begin
           vTasaEfectiva := 25.34;
           EdTasaEfectiva.Text := FormatCurr('#0.00',vTasaEfectiva);
           vTasaMora := 15;
         end;
        DmColocacion.IBDStipocuota.Active := False;
        DmColocacion.IBDStipocuota.Active := True;
        DmColocacion.IBDStipocuota.Last;
        DmColocacion.IBDStipocuota.First;
        EDpuntos.Text := FormatCurr('#0.00',vPuntosAdicionales);
end;

procedure TFrmDesembolso.CBtasavariableClick(Sender: TObject);
begin
        vTasaEfectiva := dmColocacion.IBDStasavariable.FieldValues['VALOR_ACTUAL_TASA'];
        EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);

end;

procedure TFrmDesembolso.CBtasavariableKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.CBtasavariableExit(Sender: TObject);
begin
        vTasaVariable := CBtasavariable.KeyValue;
        vTasaEfectiva := dmColocacion.IBDStasavariable.FieldValues['VALOR_ACTUAL_TASA'];
        EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);
        edtasaefectivaexit(Self);
//        EDtasaefectiva.SetFocus
end;

procedure TFrmDesembolso.EdtipotasaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.EDtasaefectivaExit(Sender: TObject);
begin
//***********inicio tipo de cuota
        if DmColocacion.IBDStipocuota.Locate('ID_TIPOS_CUOTA',VarArrayOf([vTipoCuota]),[loCaseInsensitive]) = True then
        begin
           vCapitalVencido := DmColocacion.IBDStipocuota.FieldByName('CAPITAL').AsString;
           vInteresVencido := DMColocacion.IBDStipocuota.FieldByName('INTERES').AsString;
           vCuotaTipo := DMColocacion.IBDStipocuota.FieldByName('TIPO_CUOTA').AsString;
        end
        else
        begin
           vCapitalVencido := 'V';
           vInteresVencido := 'V';
           vCuotaTipo      := 'F';
        end;

        if vLinea = 7 then
         begin
           EdAmortizaCap.Text := FormatCurr('#',vAmortizaCapital);
           vAmortizaInteres := 30;
           EdAmortizaInt.Text := FormatCurr('#',vAmortizaInteres);
         end;
///*****************fin tipo de cuota





        if vCuotaTipo = 'F' then
        begin
//vivienda******************************
          if vLinea = 7 then
           begin
             vAmortizaCapital := vAmortizaInteres;
             EdAmortizaCap.Text := FormatCurr('#0',vAmortizaCapital);
             vValorCuota := CuotaVivienda(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaInteres);
           end
//**************************************
           else
           begin
             vAmortizaCapital := vAmortizaInteres;
             EdAmortizaCap.Text := FormatCurr('#0',vAmortizaCapital);
             vValorCuota := CuotaFija(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaInteres);
           end;
        end
        else
        begin
           vValorCuota := CuotaVariable(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaCapital);
        end;

        if vCapitalVencido = 'V' then
           vTasaNominal := (TasaNominalVencida(vTasaEfectiva,vAmortizaInteres) + vPuntosAdicionales)
        else
           vTasaNominal := (TasaNominalAnticipada(vTasaEfectiva,vAmortizaInteres)+ vPuntosAdicionales);
        EDtasanom.Text  := FormatCurr('#0.00%',vTasaNominal);
        EdValorCuota.Caption := FormatCurr('$#,##0',vValorCuota);
        vFechaVencimiento := vFechaDesembolso;
        vFechaVencimiento := CalculoFecha(vFechaVencimiento,vPlazo+vPeriodoGracia);
        DateTime_SetFormat(EdFechaVencimiento.Handle,'yyyy/MM/dd');
        EdFechaVencimiento.Date := vFechaVencimiento;
        if vInteresVencido = 'V' then
        begin
                vFechaCapital := CalculoFecha(vFechaDesembolso,vPeriodoGracia);
                vFechaInteres := CalculoFecha(vFechaDesembolso,vPeriodoGracia);
        end
        else
        begin
                vFechaCapital := CalculoFecha(vFechaDesembolso,vAmortizaCapital+vPeriodoGracia);
                vFechaInteres := CalculoFecha(vFechaDesembolso,vAmortizaInteres+vPeriodoGracia);
        end;
        DateTime_SetFormat(EdFechaCapital.Handle,'yyyy/MM/dd');
        EdFechaCapital.Date := vFechaCapital;
        DateTime_SetFormat(EdFechaInteres.Handle,'yyyy/MM/dd');
        EdFechaInteres.Date := vFechaInteres;
        if vId_vida then
           vSeguro_vida := seguro(3);
        if vId_exequial then
           vSeguro_exequial := seguro(4);

end;

procedure TFrmDesembolso.BTadmisibleClick(Sender: TObject);
begin
        LimpiaInformacion;
        DBGridReal.Visible := True;
        GrupoInformacion.Caption := 'Información Garantias Real';
end;

procedure TFrmDesembolso.BTnoadmisibleClick(Sender: TObject);
begin
        LimpiaInformacion;
        DBGridPersonal.Visible := True;
        GrupoInformacion.Caption := 'Información Garantias Personales';
end;

procedure TFrmDesembolso.LimpiaInformacion;
begin
        DBgridInicial.Visible := False;
        DBGridReal.Visible := False;
        DBGridPersonal.Visible := False;
        DBGridDescParcial.Visible := False;
        DBGridCuotas.Visible := False;
        DBGridJudicial.Visible := False;
        Panel1.Visible := False;
        Grupoinformacion.Caption := '';
end;

procedure TFrmDesembolso.colocaciones(colocacion: string);
var    valor_tasa :Currency;
begin
  with IBSQL2 do
   begin
     Close;
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
     SQL.Add('"col$colocacion".ID_INTERES,');
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
     SQL.Add('AND "col$colocacion".ID_ESTADO_COLOCACION = 0');
     ParamByName('ID_AGENCIA').AsInteger := vagencia;
     ParamByName('ID_COLOCACION').AsString := Trim(colocacion);
     ExecQuery;
     if RecordCount <> 0 then
     begin
       with CDcolParcial do
       begin
          Append;
          FieldValues['id_agencia'] := vagencia;
          FieldValues['id_colocacion'] := colocacion;
          FieldValues['cuotas_liquidar'] := 1;
          FieldValues['fechacorte'] := Date;
          FieldValues['clasificacion'] := IBSQL2.FieldByName('ID_CLASIFICACION').AsInteger;
          FieldValues['garantia'] := IBSQL2.FieldByName('ID_GARANTIA').AsInteger;
          FieldValues['categoria'] := IBSQL2.FieldByName('ID_CATEGORIA').AsString;
          FieldValues['estado'] := IBSQL2.FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          FieldValues['valorcuota'] := IBSQL2.FieldByName('VALOR_CUOTA').AsCurrency;
          FieldValues['fechapagok'] := IBSQL2.FieldByName('FECHA_CAPITAL').AsDate;
          FieldValues['fechapagoi'] := IBSQL2.FieldByName('FECHA_INTERES').AsDate;
          FieldValues['tipointeres'] := IBSQL2.FieldByName('ID_INTERES').AsInteger;
          if IBSQL2.FieldByName('TIPO_INTERES').AsString = 'F' then
            valor_tasa := IBSQL2.FieldByName('TASA_INTERES_CORRIENTE').AsFloat
          else
            valor_tasa := IBSQL2.FieldByName('VALOR_ACTUAL_TASA').AsFloat;
          FieldValues['valortasa'] := valor_tasa;
          FieldValues['valormora'] := valor_tasa + IBSQL2.FieldByName('TASA_INTERES_MORA').AsFloat;
          FieldValues['puntosadic'] := IBSQL2.FieldByName('PUNTOS_INTERES').AsCurrency;
          FieldValues['saldo_actual'] := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
          FieldValues['amortizak'] := IBSQL2.FieldByName('AMORTIZA_CAPITAL').AsInteger;
          FieldValues['amortizai'] := IBSQL2.FieldByName('AMORTIZA_INTERES').AsInteger;
          FieldValues['diasproroga'] := IBSQL2.FieldByName('DIAS_PRORROGADOS').AsInteger;
          FieldValues['tipo'] := IBSQL2.FieldByName('ID_TIPO_CUOTA').AsInteger;
          Post;
       end;
     end;
   end;
end;

procedure TFrmDesembolso.ColocacionesJudCas(Colocacion:string);
var    valor_tasa :Currency;
begin
  with IBSQL2 do
   begin
     Close;
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
     SQL.Add('"col$colocacion".ID_INTERES,');
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
     SQL.Add('AND "col$colocacion".ID_ESTADO_COLOCACION in (2,3)');
     ParamByName('ID_AGENCIA').AsInteger := vagencia;
     ParamByName('ID_COLOCACION').AsString := Trim(colocacion);
     ExecQuery;
     if RecordCount <> 0 then
     begin
       with CDjudicial do
       begin
          Append;
          FieldValues['id_agencia'] := vagencia;
          FieldValues['id_colocacion'] := colocacion;
          FieldValues['cuotas_liquidar'] := 1;
          FieldValues['fechacorte'] := Date;
          FieldValues['clasificacion'] := IBSQL2.FieldByName('ID_CLASIFICACION').AsInteger;
          FieldValues['garantia'] := IBSQL2.FieldByName('ID_GARANTIA').AsInteger;
          FieldValues['categoria'] := IBSQL2.FieldByName('ID_CATEGORIA').AsString;
          FieldValues['estado'] := IBSQL2.FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          FieldValues['valorcuota'] := IBSQL2.FieldByName('VALOR_CUOTA').AsCurrency;
          FieldValues['fechapagok'] := IBSQL2.FieldByName('FECHA_CAPITAL').AsDate;
          FieldValues['fechapagoi'] := IBSQL2.FieldByName('FECHA_INTERES').AsDate;
          FieldValues['tipointeres'] := IBSQL2.FieldByName('ID_INTERES').AsInteger;
          if IBSQL2.FieldByName('TIPO_INTERES').AsString = 'F' then
            valor_tasa := IBSQL2.FieldByName('TASA_INTERES_CORRIENTE').AsFloat
          else
            valor_tasa := IBSQL2.FieldByName('VALOR_ACTUAL_TASA').AsFloat;
          FieldValues['valortasa'] := valor_tasa;
          FieldValues['valormora'] := valor_tasa + IBSQL2.FieldByName('TASA_INTERES_MORA').AsFloat;
          FieldValues['puntosadic'] := IBSQL2.FieldByName('PUNTOS_INTERES').AsCurrency;
          FieldValues['saldo_actual'] := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
          FieldValues['amortizak'] := IBSQL2.FieldByName('AMORTIZA_CAPITAL').AsInteger;
          FieldValues['amortizai'] := IBSQL2.FieldByName('AMORTIZA_INTERES').AsInteger;
          FieldValues['diasproroga'] := IBSQL2.FieldByName('DIAS_PRORROGADOS').AsInteger;
          FieldValues['tipo'] := IBSQL2.FieldByName('ID_TIPO_CUOTA').AsInteger;
          Post;
       end;
     end;

     // Valida la liquidacion de los Judiciales y Castigados en la Temporal
     Close;
     SQL.Clear;
     SQL.Add('select "col$infdesembolso".ID_COLOCACION, "col$extractotmp".ABONO_CAPITAL from "col$infdesembolso"');
     SQL.Add('inner join "col$extractotmp" on ("col$infdesembolso".ID_COLOCACION = "col$extractotmp".ID_COLOCACION)');
     SQL.Add('where "col$infdesembolso".ID_COLOCACION = :ID_COLOCACION');
     SQL.Add('and "col$infdesembolso".ID_SOLICITUD = :ID_SOLICITUD');
     ParamByName('ID_COLOCACION').AsString := Trim(colocacion);
     ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
     ExecQuery;
     if RecordCount <= 0 then begin
       MessageDlg('No se Puede Desembolsar Porque la Colocacion No'+  ' ' + colocacion + ' ' + 'No se ha Liquidado',mtWarning,[mbok],0);
       NoGrabaDes := True;
     end;
   end;
end;


procedure TFrmDesembolso.barrido_cuotas(id_persona,id_colocacion:string;id_identificacion:Integer);
var    numero_cuotas,amortiza :Integer;
       fecha,fechahoy :TDate;
       tipo :string;
       valor_tasa :Currency;
begin
        fechahoy := fFechaActual;
        with IBSQL2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"col$colocacion".ID_CLASIFICACION,');
          SQL.Add('"col$colocacion".ID_CATEGORIA,');
          SQL.Add('"col$colocacion".ID_GARANTIA,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
          SQL.Add('"col$colocacion".ID_INTERES,');
          SQL.Add('"col$colocacion".TIPO_INTERES,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
          SQL.Add('"col$colocacion".TASA_INTERES_MORA,');
          SQL.Add('"col$colocacion".PUNTOS_INTERES,');
          SQL.Add('"col$colocacion".DIAS_PRORROGADOS,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0) and ');
          if id_colocacion = '' then
          begin
            SQL.Add('("col$colocacion".ID_PERSONA = :ID_PERSONA) AND');
            SQL.Add('("col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION)');
            ParamByName('ID_PERSONA').AsString := id_persona;
            ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          end
          else
          begin
            SQL.Add('"col$colocacion".ID_COLOCACION = :ID_COLOCACION AND');
            SQL.Add('"col$colocacion".ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_COLOCACION').AsString := id_colocacion;
            ParamByName('ID_AGENCIA').AsInteger := vagencia;
          end;
          ExecQuery;
          while not Eof do
          begin
            CDcuotas.Filter := 'id_colocacion = ' + IBSQL2.FieldByName('ID_COLOCACION').AsString;
            CDcuotas.Filtered := True;
            CDcolParcial.Filter := 'id_colocacion = ' + IBSQL2.FieldByName('ID_COLOCACION').AsString;
            CDcolParcial.Filtered := True;
            if (CDcolParcial.FieldByName('id_colocacion').AsString = '') and (CDcuotas.FieldByName('id_colocacion').AsString = '') then
            begin
            numero_cuotas := 0;            Fecha := FieldByName('FECHA_INTERES').AsDateTime;
            Tipo := FieldByName('INTERES').AsString;
            Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
            if Tipo = 'V' then
               Fecha := CalculoFecha(Fecha,Amortiza);
            if (Int(Fecha) <= Int(FechaHoy)) and (FieldByName('SALDO').AsCurrency > 0) then
            begin
              with DmSolicitud.IBSolicitud1 do
              begin
                Close;
                SQL.Clear;
                SQL.Add('select CUOTA_NUMERO from "col$tablaliquidacion" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
                SQL.Add('PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
                ParamByName('ID_AGENCIA').AsInteger := vagencia;
                ParamByName('ID_COLOCACION').AsString := IBSQL2.FieldByName('ID_COLOCACION').AsString;
                ParamByName('FECHA_CORTE').AsDate := Date;
                Open;
                while not Eof do
                begin
                  numero_cuotas := numero_cuotas + 1;
                  Next;
                end;
                if numero_cuotas <> 0 then
                begin
                  with CDcuotas do
                  begin
                    Append;
                    FieldValues['id_agencia'] := vagencia;
                    FieldValues['id_colocacion'] := IBSQL2.FieldByName('ID_COLOCACION').AsString;
                    FieldValues['cuotas'] := numero_cuotas;
                    FieldValues['fechacorte'] := Date;
                    FieldValues['clasificacion'] := IBSQL2.FieldByName('ID_CLASIFICACION').AsInteger;
                    FieldValues['garantia'] := IBSQL2.FieldByName('ID_GARANTIA').AsInteger;
                    FieldValues['categoria'] := IBSQL2.FieldByName('ID_CATEGORIA').AsString;
                    FieldValues['estado'] := IBSQL2.FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                    FieldValues['valorcuota'] := IBSQL2.FieldByName('VALOR_CUOTA').AsCurrency;
                    FieldValues['fechapagok'] := IBSQL2.FieldByName('FECHA_CAPITAL').AsDate;
                    FieldValues['fechapagoi'] := IBSQL2.FieldByName('FECHA_INTERES').AsDate;
                    FieldValues['tipointeres'] := IBSQL2.FieldByName('ID_INTERES').AsInteger;
                      if IBSQL2.FieldByName('TIPO_INTERES').AsString = 'F' then
                         valor_tasa := IBSQL2.FieldByName('TASA_INTERES_CORRIENTE').AsCurrency
                      else
                         valor_tasa := IBSQL2.FieldByName('VALOR_ACTUAL_TASA').AsCurrency;
                    FieldValues['valor_tasa'] := valor_tasa;
                    FieldValues['valor_mora'] := valor_tasa + IBSQL2.FieldByName('TASA_INTERES_MORA').AsCurrency;
                    FieldValues['puntos'] := IBSQL2.FieldByName('PUNTOS_INTERES').AsCurrency;
                    FieldValues['saldoactual'] := IBSQL2.FieldByName('SALDO').AsCurrency;
                    FieldValues['amortizak'] := IBSQL2.FieldByName('AMORTIZA_CAPITAL').AsInteger;
                    FieldValues['amortizaint'] := IBSQL2.FieldByName('AMORTIZA_INTERES').AsInteger;
                    FieldValues['diasprorroga'] := IBSQL2.FieldByName('DIAS_PRORROGADOS').AsInteger;
                    FieldValues['tipo'] := IBSQL2.FieldByName('ID_TIPO_CUOTA').AsInteger;
                    if id_colocacion <> '' then
                      FieldValues['tipo_c'] := 'Fianza'
                    else
                      FieldValues['tipo_c'] := busca_tipo(IBSQL2.FieldByName('ID_PERSONA').AsString,IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger);
                    Post;
                  end;// fin cd cuotas
                end;// fin if numero_cuotas
                //despues de la cuotas
              end;//dmsolicitud
            end;//fin del if
            end; // fin colocacion
            Next;
          end;// fin del primer while
        end;// fin ibsql2
end;

procedure TFrmDesembolso.BTtotalClick(Sender: TObject);
begin
        limpiainformacion;
        DBGridDescParcial.Visible := True;
        Grupoinformacion.Caption := 'Información Descuentos';
end;

procedure TFrmDesembolso.BTparcialClick(Sender: TObject);
begin
        LimpiaInformacion;
        CDcuotas.IndexFieldNames := 'tipo';
        DBGridCuotas.Visible := True;
        GrupoInformacion.Caption := 'Información Créditos Atrasados';
end;


procedure TFrmDesembolso.ConsultaColocacin1Click(Sender: TObject);
begin
           control_consulta := False;
           frmConsultaColocacion := TfrmConsultaColocacion.Create(Self);
//           agencia := CDcuotasid_agencia.Value;
           frmConsultaColocacion.EdAgencia.KeyValue := Agencia;
           frmConsultaColocacion.EdNumeroColocacion.Text := CDcuotasid_colocacion.Value;
           frmConsultaColocacion.EdNumeroColocacionExit(self);
           frmConsultacolocacion.Show;
           activa_colocacion;
end;

procedure TFrmDesembolso.activa_colocacion;
begin
        with dmColocacion do
        begin
                IBDStiposid.Active := true;
                IBDStiposid.Last;
                IBDStiposid.First;
                IBDSclasificacion.Active := true;
                IBDSclasificacion.Last;
                IBDSclasificacion.First;
                IBDSlinea.Active := true;
                IBDSlinea.Last;
                IBDSlinea.First;
                IBDSinversion.Active := true;
                IBDSinversion.Last;
                IBDSinversion.First;
                IBDSrespaldo.Active := true;
                IBDSrespaldo.Last;
                IBDSrespaldo.First;
                IBDSgarantia.Active := true;
                IBDSgarantia.Last;
                IBDSgarantia.First;
//                IBDStipocuota.Active := true;
//                IBDStipocuota.Last;
//                IBDStipocuota.First;
                IBDStasavariable.Active := true;
                IBDStasavariable.Last;
                IBDStasavariable.First;
                IBDSenteaprobador.Active := true;
                IBDSenteaprobador.Last;
                IBDSenteaprobador.First;
                IBDSagencias.Active := True;
                IBDSagencias.Last;
        end;
end;

procedure TFrmDesembolso.ConsultaColocacion1Click(Sender: TObject);
begin
           control_consulta := False;
           frmConsultaColocacion := TfrmConsultaColocacion.Create(Self);
           //agencia := CDcolParcialid_agencia.Value ;
           frmConsultaColocacion.EdAgencia.KeyValue := Agencia;
           frmConsultaColocacion.EdNumeroColocacion.Text := CDcolParcialid_colocacion.Value;
           frmConsultaColocacion.EdNumeroColocacionExit(self);
           frmConsultacolocacion.Show;
           activa_colocacion;
end;

procedure TFrmDesembolso.busca_fianzas(id_persona: string;
  id_identificacion: integer);
begin
        with DmSolicitud.IBsolicitud2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select "col$colocacion".ID_COLOCACION');
          SQL.Add('from "col$colgarantias"');
          SQL.Add('inner join "col$colocacion" ON ("col$colocacion".ID_AGENCIA = "col$colgarantias".ID_AGENCIA and');
          SQL.Add('"col$colocacion".ID_COLOCACION = "col$colgarantias".ID_COLOCACION)');
          SQL.Add('inner join "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('left join "gen$persona" ON ( "col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('where "col$colgarantias".ID_PERSONA = :ID_PERSONA AND');
          SQL.Add('"col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN(7,8,5,4))');
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          Open;
          while not Eof do
          begin
            barrido_cuotas('',FieldByName('ID_COLOCACION').AsString,1);
            Next;
          end;
        end;
end;

procedure TFrmDesembolso.EDtasaefectivaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

function TFrmDesembolso.seguro(id_seguro: integer): currency;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$minimos".VALOR_MINIMO');
          SQL.Add('FROM');
          SQL.Add('"gen$minimos"');
          SQL.Add('WHERE');
          SQL.Add('("gen$minimos".ID_MINIMO = :ID_MINIMO)');
          ParamByName('ID_MINIMO').AsInteger := id_seguro;
          Open;
          Result := FieldByName('VALOR_MINIMO').AsCurrency;
        end;
end;

procedure TFrmDesembolso.EDvalorcolocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.EDtasanomKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.BTmostrarClick(Sender: TObject);
begin
        LimpiaInformacion;
        Panel1.Visible := True;
end;

procedure TFrmDesembolso.liquidatotal;
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    AR:PCuotasLiq;
    EnBilletes:Currency;
    EnMonedas:Currency;
    SumTasa:Single;
    SumDias:Integer;
    vTasatmp:Single;
    I,J,K,L:Integer;
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
    IdAgencia : Integer;
    CuotasPendientes : Integer;
    ConsecBarrido : String;
    vNoComprobanteBarrido : string;
    TotalDebitoRecibo : Currency;
    TotalCreditoRecibo : Currency;
    TotalDebito: Currency;
    TotalCredito : Currency;
    DescImpuesto : Currency;
    Conteo:Integer;
    Save_Cursor:TCursor;
    Total:Integer;
    ConteoConsec : Integer;
    Cuota : Integer;
    PrimerConsec:Boolean;
    ContadorLiq:Integer;
    IdIdentificacion:Integer;
    IdPersona:string;
    vtotalliquidacion :Currency;
    codigoahorros :string;
    vtotalahorros :Currency;
    total_liquidacion :Currency;
    codigo_caja :string;
begin
        codigo_caja := recupera_codigo(1);
        codigoahorros := recupera_codigo(8);
        es_liquidaciontotal := True;
        fechahoy := fFechaActual;
        with CDcolParcial do
        begin
          First;
          while not Eof do
          begin

            contador := contador + 1;
            frmProgreso.Position := contador;
            frmProgreso.InfoLabel := 'Colocacion No : ' + fieldValues['id_colocacion'];
            Application.ProcessMessages;
            Capital    := 0;
            IdAgencia := FieldValues['id_agencia'];
            id_colocacion := FieldValues['id_colocacion'];
            Clasificacion := FieldValues['clasificacion'];
            Categoria := FieldValues['categoria'];
            Garantia := FieldValues['garantia'];
            SaldoActual := FieldValues['saldo_actual'];
            vSaldoActual := SaldoActual;
            TipoInteres := FieldValues['tipointeres'];
            TipoCuota := FieldValues['tipo'];
            ValorCuota := FieldValues['valorcuota'];
            ValorTasa := FieldValues['valortasa'];
            PuntosAdic := FieldValues['puntosadic'];
            ValorMora := FieldValues['valormora'];
            AmortizaK := FieldValues['amortizak'];
            AmortizaI := FieldValues['amortizai'];
            DiasProrroga := FieldValues['diasproroga'];
            FechaPagoK := FieldValues['fechapagok'];
            FechaPagoI := FieldValues['fechapagoi'];
            Estado := FieldValues['estado'];
            CuotasPendientes := 1;//FieldValues['cuotas'];
            if (TipoCuota = 1)then
               LiquidarCuotasFijaPagoTotal(IdAgencia,id_colocacion,cuotaspendientes,FechaHoy,
               CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
               FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,0{DiasProrroga})
            else if (TipoCuota = 2)then
               LiquidarCuotasVarAnticipadaPagoTotal(IdAgencia,id_colocacion,cuotaspendientes,FechaHoy,
               CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
               FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,0{DiasProrroga})
            else if (TipoCuota = 3)then
               LiquidarCuotasVarVencidaPagoTotal(IdAgencia,id_colocacion,cuotaspendientes,FechaHoy,
               CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
               FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,0{DiasProrroga});
///////////////
        vTasa := ValorTasa;
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
        vTipoOperacion := 1;
            if CuotasLiq.Lista.Count <= 0 then Break;
               J := CuotasLiq.Lista.Count - 1;
               AF := CuotasLiq.Lista.Items[J];
               CapitalHasta := CuotasLiq.CapitalHasta;
               if CapitalHasta = 0 then
                  CapitalHasta := Date;
               InteresesHasta := CuotasLiq.InteresesHasta;
               vTotalLiquidacion := AF^.Debito;
               AF^.CodigoPuc := CodigoAhorros;
               Cuota := AF^.CuotaNumero;
               Cuota_anterior := Cuota;
               valida_extracto := True;

///inicio 4 * mil
                 DescImpuesto := SimpleRoundTo((vtotalliquidacion/1000) * 4,0);
                 New(AF);
                 AF^.CuotaNumero := cuota;
                 AF^.CodigoPuc   := '531520000000000000';
                 AF^.FechaInicial := FechaHoy;
                 AF^.FechaFinal   := FechaHoy;
                 AF^.Dias         := 0;
                 AF^.Tasa         := 0;
                 AF^.Debito       := DescImpuesto;
                 AF^.Credito      := 0;
                 AF^.EsCapital := False;
                 AF^.EsCausado := False;
                 AF^.EsCorriente := False;
                 AF^.EsVencido := False;
                 AF^.EsAnticipado := False;
                 AF^.EsDevuelto := False;
                 if (AF^.Debito <> 0) or
                    (AF^.Credito <> 0) then
                    CuotasLiq.Lista.Add(AF);
                 New(AF);
                 AF^.CuotaNumero := cuota;
                 AF^.CodigoPuc   := '244205000000000000';
                 AF^.FechaInicial := FechaHoy;
                 AF^.FechaFinal   := FechaHoy;
                 AF^.Dias         := 0;
                 AF^.Tasa         := 0;
                 AF^.Debito       := 0;
                 AF^.Credito      := DescImpuesto;
                 AF^.EsCapital := False;
                 AF^.EsCausado := False;
                 AF^.EsCorriente := False;
                 AF^.EsVencido := False;
                 AF^.EsAnticipado := False;
                 AF^.EsDevuelto := False;
                 if (AF^.Debito <> 0) or
                    (AF^.Credito <> 0) then
                    CuotasLiq.Lista.Add(AF);
///fin 4 * mil
            for I := 0 to (CuotasLiq.Lista.Count - 1) do
            begin
              Application.ProcessMessages;
              AF := CuotasLiq.Lista.Items[I];
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
           end; //FIN FOR
        total_liquidacion := capital + causado + corriente + vencido + anticipado - Devuelto;
////////////////////////
        if  CuotasLiq.Lista.Count > 0 then
          for I := 0 to CuotasLiq.Lista.Count -1 do
          begin
            AR := CuotasLiq.Lista.Items[i];
            if AR^.EsCausado or AR^.EsCorriente or AR^.EsAnticipado then begin
               SumTasa := SumTasa + (ar^.Tasa * AR^.Dias);
               SumDias := SumDias + ar^.Dias;
            end;
        end; // FIN 2 FOR
        try
           vTasa := SumTasa / SumDias;
        except
           vTasa := vTasatmp;
        end; /// fin TRY
        vNoComprobante := IntToStr(ObtenerConsecutivodesembolso(IBConsecutivo));
        Grabar_extracto;
        tablaliquidacion;
        with IBQuery do
        begin
          SQL.Clear;
          SQL.Add('insert into "col$extractodettmp" values (');
          SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
          SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
          SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO",:ID_SOLICITUD,:ID_COLOCACION_DES,:CUOTA_EXTRACTO)');
          if  CuotasLiq.Lista.Count > 0 then
            for I := 0 to CuotasLiq.Lista.Count -1 do
            begin
             Application.ProcessMessages;
             AR := CuotasLiq.Lista.Items[I];
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_CBTE_COLOCACION').AsInteger:= StrToInt(vNocomprobante);
             ParamByName('ID_COLOCACION').AsString := id_colocacion;
             ParamByName('FECHA_EXTRACTO').AsDate := Date;
             ParamByName('HORA_EXTRACTO').AsDateTime := Time;
             if AR^.CodigoPuc = codigo_caja then
                ParamByName('CODIGO_PUC').AsString := codigoahorros
             else
                ParamByName('CODIGO_PUC').AsString := AR^.CodigoPuc;
             ParamByName('FECHA_INICIAL').AsDate := AR^.FechaInicial;
             ParamByName('FECHA_FINAL').AsDate := AR^.FechaFinal;
             ParamByName('DIAS_APLICADOS').AsInteger := AR^.Dias;
             ParamByName('TASA_LIQUIDACION').AsFloat := AR^.Tasa;
             ParamByName('VALOR_DEBITO').AsCurrency := AR^.Debito;
             ParamByName('VALOR_CREDITO').AsCurrency := AR^.Credito;
             ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
             ParamByName('ID_COLOCACION_DES').AsString := '';
             ParamByName('CUOTA_EXTRACTO').AsInteger := 0;//AR^.CuotaNumero;
             ExecSql;
             Close;
           end;// FIN 4 FOR
          SQL.Clear;
          SQL.Add('insert into "col$infdesembolso" ("col$infdesembolso".ID_AGENCIA,"col$infdesembolso".ID_COLOCACION,');
          SQL.Add('"col$infdesembolso".CAPITAL,"col$infdesembolso".CAPITAL_HASTA, "col$infdesembolso".INTERES_HASTA,');
          SQL.Add('"col$infdesembolso".ES_COLOCACION,"col$infdesembolso".ID_SOLICITUD,"col$infdesembolso".ES_LIQUIDATOTAL)');
          SQL.Add('values(');
          SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:CAPITAL,:CAPITAL_HASTA,:INTERES_HASTA, :ES_COLOCACION,:ID_SOLICITUD,0)');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := id_colocacion;
          ParamByName('CAPITAL').AsCurrency := Capital;
          ParamByName('CAPITAL_HASTA').AsDate := CapitalHasta;
          ParamByName('INTERES_HASTA').AsDate := InteresesHasta;
          ParamByName('ES_COLOCACION').AsInteger := 1;
          ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
          ExecSql;
          Transaction.Commit;
          Close;
        end;
        Next;
       end; //fin del primer while
    end;//fin del with
end;

procedure TFrmDesembolso.BTliquidaClick(Sender: TObject);
begin
     if es_liquidacion then
     begin
       verifica_liquidacion := False;
       BTliquida.Enabled := False;
       contador := 0;
       frmProgreso := TfrmProgreso.Create(self);
       frmProgreso.Titulo := 'Proceso de Liquidación de Cuotas';
       frmProgreso.Min := 0;
       frmProgreso.Max := CDcolParcial.RecordCount + CDcuotas.RecordCount;
       frmProgreso.Ejecutar;
       liquidaparcial;// liquida cuotas
       liquidatotal;// liquida totalmente el credito
       frmProgreso.Cerrar;
       BTliquida.Glyph.LoadFromFile(frmMain.ruta1+ '\reporte\impresora.bmp');
       BTliquida.Caption := '&Informe Cuotas';
       BTliquida.Enabled := True;
       es_liquidacion := False;
       BTcuotas.Click;
     end
     else
     begin
         BTcuotas.Click;
     end;
end;

procedure TFrmDesembolso.CmdInformeClick(Sender: TObject);
var
PuntosAdic : Double;
valor_colocacion :Currency;
begin
//VidColocacion := '20050001278';
        //IBentidad.Close;
        //IBentidad.Open;
        CDliquidacion.CancelUpdates;
        valor_colocacion := EDvalorcolocacion.Value;
        Empleado;
        if IBtranreporte.InTransaction then
           IBtranreporte.Commit;
        IBtranreporte.StartTransaction;
        with IBQuerytabla do
        begin
             SQL.Clear;
             SQL.Add('select ID_COLOCACION, CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGAR, ');
             SQL.Add('INTERES_A_PAGAR,(CAPITAL_A_PAGAR + INTERES_A_PAGAR) as TOTALCUOTA ');
             SQL.Add('from "col$tablaliquidacion" where ');
             SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION") ORDER BY CUOTA_NUMERO');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COLOCACION').AsString := VidColocacion;
             Open;
             while not Eof do
             begin
               valor_colocacion := valor_colocacion - FieldByName('CAPITAL_A_PAGAR').AsCurrency;
               CDliquidacion.Append;
               CDliquidacion.FieldValues['cuota'] := FieldByName('CUOTA_NUMERO').AsInteger;
               CDliquidacion.FieldValues['fecha_pago'] := FieldByName('FECHA_A_PAGAR').AsDateTime;
               CDliquidacion.FieldValues['capital'] := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
               CDliquidacion.FieldValues['interes'] := FieldByName('INTERES_A_PAGAR').AsCurrency;
               CDliquidacion.FieldValues['saldo'] := valor_colocacion;
               CDliquidacion.FieldValues['totalcuota'] := FieldByName('TOTALCUOTA').AsCurrency;
               CDliquidacion.Post;
               Next;
             end;
        end;
        with IBQuerycontable do
        begin
             SQL.Clear;
             SQL.Add('select ID_COLOCACION,"col$concol"."CODIGO",NOMBRE,DEBITO,CREDITO');
             SQL.Add(' FROM "col$concol" left join "con$puc" ON ');
             SQL.Add('("col$concol"."CODIGO" = "con$puc"."CODIGO" and "col$concol"."ID_AGENCIA" = "con$puc"."ID_AGENCIA") ');
             SQL.Add('where ("col$concol".ID_AGENCIA = :"ID_AGENCIA") AND ("col$concol".ID_COLOCACION = :"ID_COLOCACION") ORDER BY CREDITO,"col$concol"."CODIGO"');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COLOCACION').AsString := vIdColocacion;
             Open;
        end;
        with IBQuerycolocacion do
        begin
             SQL.Clear;
             SQL.Add('SELECT "col$colocacion".VALOR_CUOTA,"col$colocacion".ID_COLOCACION, "col$colocacion".ID_PERSONA, "gen$persona".NOMBRE,');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
             SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
             SQL.Add('"col$lineas".DESCRIPCION_LINEA,"col$inversion".DESCRIPCION_INVERSION,');
             SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,"col$garantia".DESCRIPCION_GARANTIA,');
             SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".VALOR_DESEMBOLSO,');
             SQL.Add('"col$colocacion".PLAZO_COLOCACION,"col$colocacion".FECHA_VENCIMIENTO,');
             SQL.Add('"col$colocacion".TIPO_INTERES,"col$tasasvariables".DESCRIPCION_TASA,');
             SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,"col$colocacion".TASA_INTERES_MORA,');
             SQL.Add('"col$colocacion".PUNTOS_INTERES,"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
             SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".AMORTIZA_INTERES,');
             SQL.Add('"col$colocacion".PERIODO_GRACIA,"col$colocacion".VALOR_CUOTA,');
             SQL.Add('"col$colocacion".FECHA_CAPITAL,"col$colocacion".FECHA_INTERES,');
             SQL.Add('"col$colocacion".NUMERO_CUENTA,"col$colocacion".NOTA_CONTABLE,');
             SQL.Add('"col$tiposcuota".INTERES,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
             SQL.Add('"gen$empleado".NOMBRE AS NOMBRE1');
             SQL.Add('FROM ');
             SQL.Add('"col$colocacion" INNER JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "gen$tiposidentificacion" ON ("gen$persona".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
             SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
             SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION)');
             SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO)');
             SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES)');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("col$colocacion".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO) ');
             SQL.Add(' where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COLOCACION').AsString := vIdColocacion;
             Open;
             PuntosAdic := FieldByName('PUNTOS_INTERES').AsFloat;
             v_cuota := FieldByName('VALOR_CUOTA').AsCurrency;
             if FieldByName('INTERES').AsString = 'A' then
                TasaNominal := TasaNominalAnticipada(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger) + PuntosAdic
             else
                TasaNominal := TasaNominalVencida(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger) + PuntosAdic;
        end;
        with IBQueryGarPersonal do
        begin
           SQL.Clear;
           SQL.Add('select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$persona".NOMBRE,"col$colgarantias".ID_COLOCACION,');
           SQL.Add('"col$colgarantias".ID_PERSONA FROM "col$colgarantias" ');
           SQL.Add('inner join "gen$persona" on ');
           SQL.Add('("col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA) and ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) ');
           SQL.Add('where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := vIdColocacion;
           Open;
        end;
        with IBQueryGarReal do
        begin
           SQL.Clear;
           SQL.Add('select "col$colgarantiasreal".ID_COLOCACION,"col$colgarantiasreal".NUMERO_ESCRITURA,');
           SQL.Add('"col$colgarantiasreal".FECHA_ESCRITURA,"col$colgarantiasreal".NOMBRE_NOTARIA,');
           SQL.Add('"col$colgarantiasreal".CIUDAD_ESCRITURA,"col$colgarantiasreal".MATRICULA_INMOBILIARIA,');
           SQL.Add('"col$colgarantiasreal".FECHA_REGISTRO,"col$colgarantiasreal".AVALUO, "col$colgarantiasreal"."FECHA_AVALUO",');
           SQL.Add('"col$colgarantiasreal".CUENTAS_DE_ORDEN,"col$colgarantiasreal".POLIZA_INCENDIO,');
           SQL.Add('"col$colgarantiasreal".FECHA_INICIAL_POLIZA,"col$colgarantiasreal".FECHA_FINAL_POLIZA,');
           SQL.Add('"col$colgarantiasreal".VALOR_ASEGURADO ');
           SQL.Add('from "col$colgarantiasreal" where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := vIdColocacion;
           Open;
        end;
        valor_total := recupera_saldo(8,0,'C');
        aportes_r := recupera_saldo(3,0,'C');
        imprimir_reporte(frmMain.ruta1 + '\reporte\repdesembolso.frf');
        Saldo := vDesembolso;
        IBQuerytabla.Close;
        IBQuerycontable.Close;
        IBQuerycolocacion.Close;
        IBQueryGarPersonal.Close;
        IBQueryGarReal.Close;


end;

procedure TFrmDesembolso.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
var     valor_neto,total_descuento :Currency;
        valor_otros :Currency;
begin
        valor_neto := 0;
        total_descuento := 0;
        valor_otros := 0;
        valor_neto := valor_total - des_cartera;
        total_descuento := EDvalorcolocacion.Value - (aportes_r + des_cartera + des_equivida + des_exequial);
        valor_otros := total_descuento - valor_neto;
        if valor_otros < 0 then
           valor_otros := 0;
        if ParName = 'tasanominal' then
           ParValue := TasaNominal;
        if ParName = 'empresa' then
           ParValue := Empresa;
        if ParName = 'empleado' then
           ParValue := Nombres + '    ' + Apellidos;
          if ParName = 'ho1' then
             ParValue := ho1;
          if ParName = 'ho2' then
             ParValue := ho2;
          if ParName = 'ho3' then
             ParValue := ho3;
          if ParName = 'hs1' then
             ParValue := hs1;
          if ParName = 'hs2' then
             ParValue := hs2;
          if ParName = 'hs3' then
             ParValue := hs3;
          if ParName = 'hs4' then
             ParValue := hs4;
        if ParName = 'aportes' then
           ParValue := aportes_r;
        if ParName = 'cartera' then
           ParValue := des_cartera;//recupera_saldo(8,0,'D');
        if ParName = 'equivida' then
           ParValue := des_equivida;//recupera_saldo(14,0,'C');
        if ParName = 'exequial' then
           ParValue := des_exequial;//recupera_saldo(15,0,'C');
        if ParName = 'neto_recibido' then
           ParValue := valor_neto;//recupera_saldo(8,0,'D');
        if ParName = 'valor_cuota' then
           ParValue := v_cuota;
        if ParName = 'd_otro' then
           ParValue := valor_otros;
        if ParName = 'agencia' then
             ParValue := descripcion_agencia;
        if ParName = 'de' then
             ParValue := lugar_identificacion;
end;

procedure TFrmDesembolso.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frCompositeReport1.DoublePass := True;
        frCompositeReport1.Reports.Clear;
        frCompositeReport1.Reports.Add(frReport1);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmDesembolso.liquidaparcial;
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    AR:PCuotasLiq;
    EnBilletes:Currency;
    EnMonedas:Currency;
    SumTasa:Single;
    SumDias:Integer;
    vTasatmp:Single;
    I,J,K,L:Integer;
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
    IdAgencia : Integer;
    CuotasPendientes : Integer;
    ConsecBarrido : String;
    vNoComprobanteBarrido : string;
    TotalDebitoRecibo : Currency;
    TotalCreditoRecibo : Currency;
    TotalDebito: Currency;
    TotalCredito : Currency;
    DescImpuesto : Currency;
    Conteo:Integer;
    Save_Cursor:TCursor;
    Total:Integer;
    ConteoConsec : Integer;
    Cuota : Integer;
    PrimerConsec:Boolean;
    ContadorLiq:Integer;
    IdIdentificacion:Integer;
    IdPersona:string;
    vtotalliquidacion :Currency;
    codigoahorros :string;
    vtotalahorros :Currency;
    total_liquidacion :Currency;
    codigo_caja :string;
begin
        es_liquidaciontotal := False;
        codigoahorros := recupera_codigo(8);
        codigo_caja := recupera_codigo(1);;
        fechahoy := fFechaActual;
        with CDcuotas do
        begin
          First;
          while not Eof do
          begin
            //codigoahorros := recupera_codigo();// '210505010000000000';
            contador := contador + 1;
            frmProgreso.Position := contador;
            frmProgreso.InfoLabel := 'Colocacion No : ' + fieldValues['id_colocacion'];
            Application.ProcessMessages;
            Capital    := 0;
            IdAgencia := FieldValues['id_agencia'];
            id_colocacion := FieldValues['id_colocacion'];
            Clasificacion := FieldValues['clasificacion'];
            Categoria := FieldValues['categoria'];
            Garantia := FieldValues['garantia'];
            SaldoActual := FieldValues['saldoactual'];
            vSaldoActual := SaldoActual;
            TipoInteres := FieldValues['tipointeres'];
            TipoCuota := FieldValues['tipo'];
            ValorCuota := FieldValues['valorcuota'];
            ValorTasa := FieldValues['valor_tasa'];
            PuntosAdic := FieldValues['puntos'];
            ValorMora := FieldValues['valor_mora'];
            AmortizaK := FieldValues['amortizak'];
            AmortizaI := FieldValues['amortizaint'];
            DiasProrroga := FieldValues['diasprorroga'];
            FechaPagoK := FieldValues['fechapagok'];
            FechaPagoI := FieldValues['fechapagoi'];
            Estado := FieldValues['estado'];
            CuotasPendientes := FieldValues['cuotas'];
            if (TipoCuota = 1) then
               LiquidarCuotasFija(IdAgencia,id_Colocacion,CuotasPendientes,FechaHoy,
               CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
               FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,0{DiasProrroga})
            else if (TipoCuota = 2) then
               LiquidarCuotasVarAnticipada(IdAgencia,id_Colocacion,CuotasPendientes,FechaHoy,
               CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
               FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,0{DiasProrroga})
            else if (TipoCuota = 3) then
               LiquidarCuotasVarVencida(IdAgencia,id_Colocacion,CuotasPendientes,FechaHoy,
               CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
               FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,0{DiasProrroga});
///////////////
            if CuotasLiq.Lista.Count <= 0 then Break;
               J := CuotasLiq.Lista.Count - 1;
               AF := CuotasLiq.Lista.Items[J];
               CapitalHasta := CuotasLiq.CapitalHasta;
               InteresesHasta := CuotasLiq.InteresesHasta;
               vTotalLiquidacion := AF^.Debito;
               AF^.CodigoPuc := CodigoAhorros;
               Cuota := AF^.CuotaNumero;
               valida_extracto := True;
            for I := 0 to (CuotasLiq.Lista.Count - 1) do
            begin
              Application.ProcessMessages;
              AF := CuotasLiq.Lista.Items[I];
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
           end; //FIN FOR
                 total_liquidacion := capital + causado + corriente + vencido + anticipado - Devuelto;
                 DescImpuesto := SimpleRoundTo((total_liquidacion/1000) * 4,0);
                 New(AF);
                 AF^.CuotaNumero := cuota;
                 AF^.CodigoPuc   := '531520000000000000';
                 AF^.FechaInicial := FechaHoy;
                 AF^.FechaFinal   := FechaHoy;
                 AF^.Dias         := 0;
                 AF^.Tasa         := 0;
                 AF^.Debito       := DescImpuesto;
                 AF^.Credito      := 0;
                 AF^.EsCapital := False;
                 AF^.EsCausado := False;
                 AF^.EsCorriente := False;
                 AF^.EsVencido := False;
                 AF^.EsAnticipado := False;
                 AF^.EsDevuelto := False;
                 if (AF^.Debito <> 0) or
                    (AF^.Credito <> 0) then
                    CuotasLiq.Lista.Add(AF);
                 New(AF);
                 AF^.CuotaNumero := cuota;
                 AF^.CodigoPuc   := '244205000000000000';
                 AF^.FechaInicial := FechaHoy;
                 AF^.FechaFinal   := FechaHoy;
                 AF^.Dias         := 0;
                 AF^.Tasa         := 0;
                 AF^.Debito       := 0;
                 AF^.Credito      := DescImpuesto;
                 AF^.EsCapital := False;
                 AF^.EsCausado := False;
                 AF^.EsCorriente := False;
                 AF^.EsVencido := False;
                 AF^.EsAnticipado := False;
                 AF^.EsDevuelto := False;
                 if (AF^.Debito <> 0) or
                    (AF^.Credito <> 0) then
                    CuotasLiq.Lista.Add(AF);
           //* fin 4 x mil

////////////////////////

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
        abono_capital := 0;
        abono_cxc := 0;
        abono_servicios := 0;
        abono_mora := 0;
        abono_anticipado := 0;
        Cuota_anterior := 0;
        cambio := false;
        SumTasa := 0;
        SumDias := 0;
        vTipoOperacion := 1;
        vTasatmp := vTasa;
        if  CuotasLiq.Lista.Count > 0 then
          for I := 0 to CuotasLiq.Lista.Count -1 do
          begin
            AR := CuotasLiq.Lista.Items[i];
            if AR^.EsCausado or AR^.EsCorriente or AR^.EsAnticipado then begin
               SumTasa := SumTasa + (ar^.Tasa * AR^.Dias);
               SumDias := SumDias + ar^.Dias;
            end;
        end; // FIN 2 FOR
        try
           vTasa := SumTasa / SumDias;
        except
           vTasa := vTasatmp;
        end; /// fin TRY
        vNoComprobante := IntToStr(ObtenerConsecutivodesembolso(IBSQL2));
        for J := 0 to CuotasLiq.Lista.Count - 1 do
        begin
          AR := CuotasLiq.Lista.Items[J];
          if AR^.CuotaNumero <> Cuota_anterior then
             if cambio = false then
                cambio := true
             else
             begin
               Grabar_Extracto;
               TablaLiquidacion;
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
        //****** 4 * MIL

        end;// fin 3 for

        Grabar_extracto;
        tablaliquidacion;
        with IBQuery do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('insert into "col$extractodettmp" values (');
          SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
          SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
          SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO",:ID_SOLICITUD,:ID_COLOCACION_DES,:CUOTA_EXTRACTO)');
          if  CuotasLiq.Lista.Count > 0 then
            for I := 0 to CuotasLiq.Lista.Count -1 do
            begin
             Application.ProcessMessages;
             AR := CuotasLiq.Lista.Items[I];
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_CBTE_COLOCACION').AsInteger:= StrToInt(vNocomprobante);
             ParamByName('ID_COLOCACION').AsString := id_colocacion;
             ParamByName('FECHA_EXTRACTO').AsDate := Date;
             ParamByName('HORA_EXTRACTO').AsDateTime := Time;
             if AR^.CodigoPuc = codigo_caja then
                ParamByName('CODIGO_PUC').AsString := codigoahorros
             else
                ParamByName('CODIGO_PUC').AsString := AR^.CodigoPuc;
             ParamByName('FECHA_INICIAL').AsDate := AR^.FechaInicial;
             ParamByName('FECHA_FINAL').AsDate := AR^.FechaFinal;
             ParamByName('DIAS_APLICADOS').AsInteger := AR^.Dias;
             ParamByName('TASA_LIQUIDACION').AsFloat := AR^.Tasa;
             ParamByName('VALOR_DEBITO').AsCurrency := AR^.Debito;
             ParamByName('VALOR_CREDITO').AsCurrency := AR^.Credito;
             ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
             ParamByName('ID_COLOCACION_DES').AsString := '';
             ParamByName('CUOTA_EXTRACTO').AsInteger := AR^.CuotaNumero;
             Open;
             Close;
             Transaction.Commit;
           end;// FIN 4 FOR
          SQL.Clear;
          SQL.Add('insert into "col$infdesembolso" ("col$infdesembolso".ID_AGENCIA,"col$infdesembolso".ID_COLOCACION,');
          SQL.Add('"col$infdesembolso".CAPITAL,"col$infdesembolso".CAPITAL_HASTA, "col$infdesembolso".INTERES_HASTA,');
          SQL.Add('"col$infdesembolso".ES_COLOCACION,"col$infdesembolso".ID_SOLICITUD,"col$infdesembolso".ES_LIQUIDATOTAL)');
          SQL.Add('values(');
          SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:CAPITAL,:CAPITAL_HASTA,:INTERES_HASTA, :ES_COLOCACION,:ID_SOLICITUD,0)');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := id_colocacion;
          ParamByName('CAPITAL').AsCurrency := Capital;
          ParamByName('CAPITAL_HASTA').AsDate := CapitalHasta;
          ParamByName('INTERES_HASTA').AsDate := InteresesHasta;
          ParamByName('ES_COLOCACION').AsInteger := 1;
          ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
          ExecSql;
          Transaction.Commit;
          Close;
        end;
        Next;
       end; //fin del primer while
    end;//fin del with
end;

procedure TFrmDesembolso.grabar_extracto;
var
SaldoExtracto :Currency;
begin
        with IBQuery1 do
         begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          if valida_extracto then
          begin
            sql.Clear;
            sql.Add('select SALDO_ANTERIOR_EXTRACTO, ABONO_CAPITAL from');
            sql.Add('"col$extracto" where');
            sql.Add('ID_AGENCIA = :"ID_AGENCIA" and');
            sql.Add('ID_COLOCACION = :"ID_COLOCACION"');
          end
          else
          begin
            sql.Clear;
            sql.Add('select SALDO_ANTERIOR_EXTRACTO, ABONO_CAPITAL from');
            sql.Add('"col$extractotmp" where');
            sql.Add('ID_AGENCIA = :"ID_AGENCIA" and');
            sql.Add('ID_COLOCACION = :"ID_COLOCACION"');
          end;
          valida_extracto := False;
          Parambyname('ID_AGENCIA').AsInteger := agencia;
          parambyname('ID_COLOCACION').AsString := id_colocacion;
          open;
          First;
          Last;
          SaldoExtracto := FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency - FieldByName('ABONO_CAPITAL').AsCurrency;
          Close;
         end;
        with IBQuery1 do
         begin
          SQL.Clear;
          SQL.Add('insert into "col$extractotmp" (');
          SQL.Add('"col$extractotmp"."ID_AGENCIA", "col$extractotmp"."ID_CBTE_COLOCACION",');
          SQL.Add('"col$extractotmp"."ID_COLOCACION", "col$extractotmp"."FECHA_EXTRACTO",');
          SQL.Add('"col$extractotmp"."HORA_EXTRACTO", "col$extractotmp"."CUOTA_EXTRACTO",');
          SQL.Add('"col$extractotmp"."TIPO_OPERACION", "col$extractotmp"."SALDO_ANTERIOR_EXTRACTO",');
          SQL.Add('"col$extractotmp"."ABONO_CAPITAL", "col$extractotmp"."ABONO_CXC",');
          SQL.Add('"col$extractotmp"."ABONO_SERVICIOS", "col$extractotmp"."ABONO_ANTICIPADO",');
          SQL.Add('"col$extractotmp"."ABONO_MORA", "col$extractotmp"."ABONO_SEGURO",');
          SQL.Add('"col$extractotmp"."ABONO_PAGXCLI", "col$extractotmp"."ABONO_HONORARIOS",');
          SQL.Add('"col$extractotmp"."ABONO_OTROS", "col$extractotmp"."TASA_INTERES_LIQUIDACION",');
          SQL.Add('"col$extractotmp"."ID_EMPLEADO",');
          SQL.Add('"col$extractotmp"."INTERES_PAGO_HASTA",');
          SQL.Add('"col$extractotmp"."CAPITAL_PAGO_HASTA",');
          SQL.Add('"col$extractotmp"."TIPO_ABONO",');
          SQL.Add('"col$extractotmp"."ID_SOLICITUD",');
          SQL.Add('"col$extractotmp"."ID_COLOCACION_DES")');
          SQL.Add(' Values (');
          SQL.Add(':"ID_AGENCIA", :"ID_CBTE_COLOCACION", :"ID_COLOCACION",');
          SQL.Add(':"FECHA_EXTRACTO", :"HORA_EXTRACTO", :"CUOTA_EXTRACTO",');
          SQL.Add(':"TIPO_OPERACION", :"SALDO_ANTERIOR_EXTRACTO", :"ABONO_CAPITAL",');
          SQL.Add(':"ABONO_CXC", :"ABONO_SERVICIOS", :"ABONO_ANTICIPADO", :"ABONO_MORA",');
          SQL.Add(':"ABONO_SEGURO", :"ABONO_PAGXCLI", :"ABONO_HONORARIOS",');
          SQL.Add(':"ABONO_OTROS", :"TASA_INTERES_LIQUIDACION", :"ID_EMPLEADO",');
          SQL.Add(':"INTERES_PAGO_HASTA", :"CAPITAL_PAGO_HASTA", :"TIPO_ABONO", :ID_SOLICITUD, :ID_COLOCACION_DES)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vNoComprobante);
          ParamByName('ID_COLOCACION').AsString := id_Colocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := Date;
          ParamByName('HORA_EXTRACTO').AsDateTime := Time;
          ParamByName('CUOTA_EXTRACTO').AsInteger := Cuota_anterior;
          ParamByName('TIPO_OPERACION').AsInteger := vTipoOperacion;
          if SaldoExtracto > 0 then
            ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := SaldoExtracto
          else
            ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
          if es_liquidaciontotal then
            ParamByName('ABONO_CAPITAL').AsCurrency := capital
          else
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
          ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
          ParamByName('ID_COLOCACION_DES').AsString := '';
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
procedure TFrmDesembolso.tablaliquidacion;
begin
        with IBQuery1 do
         begin
          SQL.Clear;
          SQL.Add('insert into "col$infdesembolso" ("col$infdesembolso".ID_AGENCIA,"col$infdesembolso".ID_COLOCACION,');
          SQL.Add('"col$infdesembolso".CUOTA_NUMERO,"col$infdesembolso".FECHA_LIQUIDACION,"col$infdesembolso".ID_SOLICITUD,"col$infdesembolso".ES_COLOCACION,"col$infdesembolso".ES_LIQUIDATOTAL)');
          SQL.Add('values (');
          SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:CUOTA_NUMERO,:FECHA_LIQUIDACION,:ID_SOLICITUD,0,:ID_LIQUIDACION)');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := id_Colocacion;
          ParamByName('CUOTA_NUMERO').AsInteger := Cuota_anterior;
          ParamByName('FECHA_LIQUIDACION').AsDate := Date;
          ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
          if es_liquidaciontotal then
            ParamByName('ID_LIQUIDACION').AsInteger := 1
          else
            ParamByName('ID_LIQUIDACION').AsInteger := 0;
          try
            ExecSQL;
            Close;
          except
            Transaction.Rollback;
            MessageDlg('Error al al Realizar Transacción',mtInformation,[mbOK],0);
            raise;
          end;
         end;
end;

procedure TFrmDesembolso.DBGridCuotasDblClick(Sender: TObject);
begin
        CDcuotas.Delete
end;

procedure TFrmDesembolso.BTcuotasClick(Sender: TObject);
begin
         with IBGrupo1 do
          begin
          if Transaction.InTransaction then
            Transaction.Commit;
          Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('"col$extractotmp".ID_COLOCACION,');
           SQL.Add('"col$extractotmp".ID_CBTE_COLOCACION,');
           SQL.Add('"col$extractotmp".FECHA_EXTRACTO,');
           SQL.Add('"col$extractotmp".CAPITAL_PAGO_HASTA,');
           SQL.Add('"col$extractotmp".INTERES_PAGO_HASTA,');
           SQL.Add('"col$extractotmp".SALDO_ANTERIOR_EXTRACTO,');
           sql.Add('("col$extractotmp".SALDO_ANTERIOR_EXTRACTO - "col$extractotmp".ABONO_CAPITAL) as SALDO,');
           SQL.Add('"col$extractotmp".ID_EMPLEADO,');
           SQL.Add('"col$extractotmp".CUOTA_EXTRACTO,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".NUMERO_CUENTA,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
           SQL.Add('"col$extractodettmp".CODIGO_PUC,');
           SQL.Add('"col$extractodettmp".FECHA_INICIAL,');
           SQL.Add('"col$extractodettmp".FECHA_FINAL,');
           SQL.Add('"col$extractodettmp".DIAS_APLICADOS,');
           SQL.Add('"col$extractodettmp".TASA_LIQUIDACION,');
           SQL.Add('"col$extractodettmp".VALOR_DEBITO,');
           SQL.Add('"col$extractodettmp".VALOR_CREDITO,');
           SQL.Add('"con$puc".NOMBRE as CUENTA,');
           SQL.Add('"gen$empleado".PRIMER_APELLIDO as APE1EMPLEADO,');
           SQL.Add('"gen$empleado".SEGUNDO_APELLIDO as APE2EMPLEADO,');
           SQL.Add('"gen$empleado".NOMBRE as NOMEMPLEADO');
           SQL.Add('from "col$extractodettmp" ');
           SQL.Add('left join "col$colocacion" on ("col$extractodettmp".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$extractodettmp".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
           SQL.Add('LEFT JOIN "gen$persona" on ("gen$persona".ID_IDENTIFICACION = "col$colocacion".ID_IDENTIFICACION and ');
           SQL.Add('"gen$persona".ID_PERSONA = "col$colocacion".ID_PERSONA)');
           SQL.Add('LEFT JOIN "con$puc" ON ("col$extractodettmp".CODIGO_PUC = "con$puc".CODIGO and ');
           SQL.Add('"col$extractodettmp".ID_AGENCIA = "con$puc".ID_AGENCIA )');
           SQL.Add('inner join "col$extractotmp" on ("col$extractodettmp".ID_AGENCIA = "col$extractotmp".ID_AGENCIA and');
           SQL.Add('"col$extractodettmp".ID_COLOCACION = "col$extractotmp".ID_COLOCACION and ');
           SQL.Add('"col$extractodettmp".ID_CBTE_COLOCACION = "col$extractotmp".ID_CBTE_COLOCACION AND "col$extractodettmp".CUOTA_EXTRACTO = "col$extractotmp".CUOTA_EXTRACTO)');
           SQL.Add('inner join "gen$empleado" on ("col$extractotmp".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('where');
           SQL.Add('"col$extractodettmp".ID_SOLICITUD = :ID_SOLICITUD');
           SQL.Add('and "col$extractodettmp".FECHA_EXTRACTO = :"FECHA_EXTRACTO"');
           SQL.Add('order by "col$extractodettmp".ID_CBTE_COLOCACION, "col$extractotmp".CUOTA_EXTRACTO, "col$extractodettmp".VALOR_CREDITO');
           ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
           ParamByName('FECHA_EXTRACTO').AsDate := Date;
           Open;
           Last;
           First;

         with IBGrupo2 do
          begin
            SQL.Clear;
            SQL.Add('select ');
            SQL.Add('"col$extractotmp".ID_COLOCACION,');
            SQL.Add('"col$extractotmp".FECHA_EXTRACTO,');
            SQL.Add('("col$extractotmp".ABONO_CAPITAL + "col$extractotmp".ABONO_CXC');
            SQL.Add('+ "col$extractotmp".ABONO_ANTICIPADO + "col$extractotmp".ABONO_SERVICIOS');
            SQL.Add('+ "col$extractotmp".ABONO_MORA) AS LIQUIDACION,');
            SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
            SQL.Add('"col$colocacion".ID_PERSONA,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE');
            SQL.Add('from "col$extractotmp"');
            SQL.Add('left join "col$colocacion" on ("col$extractotmp".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$extractotmp".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
            SQL.Add('LEFT JOIN "gen$persona" on ("gen$persona".ID_IDENTIFICACION = "col$colocacion".ID_IDENTIFICACION and');
            SQL.Add('"gen$persona".ID_PERSONA = "col$colocacion".ID_PERSONA)');
            SQL.Add('where');
            SQL.Add('"col$extractotmp".ID_SOLICITUD = :ID_SOLICITUD');
            SQL.Add('and "col$extractotmp".FECHA_EXTRACTO = :"FECHA_EXTRACTO"');
            SQL.Add('order by "col$extractotmp".ID_COLOCACION');
            ParamByName('FECHA_EXTRACTO').AsDate := Date;
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            Open;
            Last;
            First;
          end;
          end;
          Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
          Reporte.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          Reporte.Variables.ByName['NIT'].AsString := Nit;
           if reporte.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := Reporte;
             frmVistaPreliminar.ShowModal;
           end;
        IBGrupo1.Close;
        IBGrupo2.Close;

end;

procedure TFrmDesembolso.AgregarCrdito1Click(Sender: TObject);
var       numero_colocacion :string;
begin
        numero_colocacion := InputBox('Colocación Numero','Digite Número de Colocacion','');
     if numero_colocacion <> '' then
     begin
          CDcolParcial.Filter := 'id_colocacion = ' +numero_colocacion;
          CDcolParcial.Filtered := True;
        if CDcolParcial.FieldByName('id_colocacion').AsString <> '' then
        begin
          MessageDlg('Colocacion ya se Encuentra en la Grid',mtWarning,[mbok],0);
          CDcolParcial.Filtered := False;
          Exit;
        end;
        BTliquida.Enabled := True;
        CDcolParcial.Filtered := False;
        verifica_liquidacion := True;
        with IBSQL2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$estado".ID_ESTADO_COLOCACION');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_COLOCACION = :ID_COLOCACION)');
          try
            ParamByName('ID_COLOCACION').AsString := numero_colocacion;
          except
            numero_colocacion := '';
          end;
          ExecQuery;
          if RecordCount = 0 then
             MessageDlg('Colocación no Encontrada',mtInformation,[mbok],0)
          else  if FieldByName('ID_ESTADO_COLOCACION').AsInteger <> 0 then
             MessageDlg('La colocación No :'+FieldByName('ID_COLOCACION').AsString+ ' ' +'No se Puede Descontar' + #13 + 'Por Estar en Estado '+FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString,mtWarning,[mbok],0)
          else
          begin
             colocaciones(numero_colocacion);
             CDcuotas.Filter := 'id_colocacion = '+ numero_colocacion;
             CDcuotas.Filtered := True;
             try
               CDcuotas.Delete;
             except
               numero_colocacion := '';
             end;
             CDcuotas.Filtered := False;
          end;
          Close;
        end;
     end;
end;

procedure TFrmDesembolso.grabar_garantias;
begin
//        Agencia := 1;
        with dmColocacion.IBQuery do
        begin
           Close;
           if CDgarantias.RecordCount > 0 then
           begin
             CDgarantias.First;
             while not CDgarantias.Eof do
             begin
               SQL.Clear;
               SQL.Add('insert into "col$colgarantias" VALUES (');
               SQL.Add(':"ID_AGENCIA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
               SQL.Add(':"ID_PERSONA",:"CSC_GARANTIA")');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_COLOCACION').AsString := vIdColocacion;
               ParamByName('ID_IDENTIFICACION').AsInteger := CDgarantias.FieldValues['id_identificacion'] ;
               ParamByName('ID_PERSONA').AsString := CDgarantias.FieldValues['id_persona'];
               ParamByName('CSC_GARANTIA').AsInteger := CDgarantias.FieldValues['csc_garantia'];
               Open;
               CDgarantias.Next;
             end;
           end;
           if CDgarantiareal.RecordCount > 0 then
           begin
             CDgarantiareal.First;
             while not CDgarantiareal.Eof do
             begin
                SQL.Clear;
                SQL.Add('insert into "col$colgarantiasreal" VALUES (');
                SQL.Add(':"ID_AGENCIA",:"ID_COLOCACION",:"NUMERO_ESCRITURA",:"FECHA_ESCRITURA",');
                SQL.Add(':"NOMBRE_NOTARIA",:"CIUDAD_ESCRITURA",:"MATRICULA_INMOBILIARIA",');
                SQL.Add(':"FECHA_REGISTRO",:"AVALUO", :"FECHA_AVALUO", :"CUENTAS_DE_ORDEN",:"POLIZA_INCENDIO",');
                SQL.Add(':"VALOR_ASEGURADO",:"FECHA_INICIAL_POLIZA",:"FECHA_FINAL_POLIZA",');
                SQL.Add(':"CODIGO_ASEGURADORA")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                ParamByName('NUMERO_ESCRITURA').AsString := CDgarantiareal.FieldValues['numero_escritura'];
                try
                  ParamByName('FECHA_ESCRITURA').AsDate := CDgarantiareal.FieldValues['fecha_escritura'];
                except
                  ParamByName('FECHA_ESCRITURA').Clear;
                end;
                ParamByName('NOMBRE_NOTARIA').AsString := CDgarantiareal.FieldValues['nombre_notaria'];
                ParamByName('CIUDAD_ESCRITURA').AsString := CDgarantiareal.FieldValues['ciudad_notaria'];
                ParamByName('MATRICULA_INMOBILIARIA').AsString := CDgarantiareal.FieldValues['matricula'];
                try
                  ParamByName('FECHA_REGISTRO').AsDate := CDgarantiareal.FieldValues['fecha_registro'];
                except
                  ParamByName('FECHA_REGISTRO').Clear;
                end;
                try
                  ParamByName('AVALUO').AsCurrency := CDgarantiareal.FieldValues['avaluo'];
                except
                  ParamByName('AVALUO').AsCurrency := 0;
                end;
                try
                  ParamByName('FECHA_AVALUO').AsDate := CDgarantiareal.FieldValues['fecha_avaluo'];
                except
                  ParamByName('FECHA_AVALUO').Clear;
                end;
                try
                  ParamByName('CUENTAS_DE_ORDEN').AsCurrency := CDgarantiareal.FieldValues['cuentas_orden'];
                except
                   PARAMBYNAME('CUENTAS_DE_ORDEN').AsCurrency := 0;
                end;
                ParamByName('POLIZA_INCENDIO').AsString := CDgarantiareal.FieldByName('poliza_incendio').AsString;
                try
                  ParamByName('VALOR_ASEGURADO').AsCurrency := CDgarantiareal.FieldValues['valor_asegurado'];
                except
                  ParamByName('VALOR_ASEGURADO').AsCurrency := 0;
                end;
                try
                  ParamByName('FECHA_INICIAL_POLIZA').AsDate := CDgarantiareal.FieldValues['fecha_ini_poliza'];
                except
                  ParamByName('FECHA_INICIAL_POLIZA').Clear;
                end;
                try
                  ParamByName('FECHA_FINAL_POLIZA').AsDate := CDgarantiareal.FieldValues['fecha_fin_poliza'];
                except
                  ParamByName('FECHA_FINAL_POLIZA').Clear;
                end;
                ParamByName('CODIGO_ASEGURADORA').AsString := '';
                Open;
                CDgarantiareal.Next;
             end;
           end;
        end;

end;
procedure TFrmDesembolso.contabilizar;
var i:Integer;
    vVecesAportes,
    vVecesAhorros,
    vPorcCredito,
    vPorcAportes,
    vPorcAhorros :Single;
    vMinimoCapitaliza:Currency;
    vCapitalizaAcumulada:Boolean;
    vCaja:Currency;
    vDescuento:Currency;
    vCodigoPuc:String;
    vCodigoCortoPlazo:String;
    vCodigoLargoPlazo:String;
    vCodigoInteresAnticipado:String;
    vInteresAnt:Currency;
    vCodigoIntereses:string;
    TipoCaptacion:Integer;
    NumeroCuenta:Integer;
    DigitoCuenta:Integer;
    Movimiento:Currency;
    vTotalAportes:Currency;
    vTAportesCreditosAnt:Currency;
    FechasLiq:TList;
    AF:PFechasLiq;
    J:Integer;
begin
  try
        vVecesAportes := 0;
        vVecesAhorros := 0;
        vPorcCredito  := 0;
        vPorcAhorros := 0;
        vInteresAnt := 0;
        vDctoCapitalizacion := 0;
        vTAportesCreditosAnt := 0;
        vCapitalizaAcumulada := False;
        vCaja := vDesembolso;
        vFechaHora := Date;
        TipoCaptacion := 1;
        // descuento por solicitudes realizadas en la seccion de creditos
        if not(Es_Fundacion) then
        begin
          with dmColocacion.IBQuery do
          begin
            SQL.Clear;
            SQL.Add('insert into "col$concol" ("ID_AGENCIA","ID_COLOCACION","CODIGO",');
            SQL.Add('"DEBITO","CREDITO","FECHA_Y_HORA") values (');
            SQL.Add(':"ID_AGENCIA", :"ID_COLOCACION",');
            SQL.Add(':"CODIGO", :"DEBITO", :"CREDITO",');
            SQL.Add(':"FECHA_Y_HORA")');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vIdColocacion;
            ParamByName('CODIGO').AsString := recupera_codigo(3);
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := seguro(8);
            ParamByName('FECHA_Y_HORA').AsDateTime := vfechahora;
            Open;
            Close;
            vCaja := vCaja - seguro(8);
          end;
        end;
        // descuentos de seguro de vida y exequial
        with dmColocacion.IBQuery do
        begin
          if vId_vida then
          begin
            SQL.Clear;
            SQL.Add('insert into "col$concol" ("ID_AGENCIA","ID_COLOCACION","CODIGO",');
            SQL.Add('"DEBITO","CREDITO","FECHA_Y_HORA") values (');
            SQL.Add(':"ID_AGENCIA", :"ID_COLOCACION",');
            SQL.Add(':"CODIGO", :"DEBITO", :"CREDITO",');
            SQL.Add(':"FECHA_Y_HORA")');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vIdColocacion;
            ParamByName('CODIGO').AsString := recupera_codigo(14);// ojo actualizar con los nuevos codigos
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := seguro(5);
            ParamByName('FECHA_Y_HORA').AsDateTime := vfechahora;
            Open;
            Close;
            vCaja := vCaja - seguro(5);
          end;
          if vId_exequial then
          begin
            SQL.Clear;
            SQL.Add('insert into "col$concol" ("ID_AGENCIA","ID_COLOCACION","CODIGO",');
            SQL.Add('"DEBITO","CREDITO","FECHA_Y_HORA") values (');
            SQL.Add(':"ID_AGENCIA", :"ID_COLOCACION",');
            SQL.Add(':"CODIGO", :"DEBITO", :"CREDITO",');
            SQL.Add(':"FECHA_Y_HORA")');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vIdColocacion;
            ParamByName('CODIGO').AsString := recupera_codigo(15);// actualizar con los nuevos codigos
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := seguro(6);
            ParamByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
            Open;
            Close;
            vCaja := vCaja - seguro(6);
          end;
        end;
        // Evaluar Corto y Largo Plazo
        with dmColocacion.IBQuery do
        begin
            SQL.Clear;
            SQL.Add('select * from "col$tablaliquidacion"');
            SQL.Add(' where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION") ORDER BY FECHA_A_PAGAR');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vIdColocacion;
            Open;
            Last;
            First;
            if RecordCount > 0 then
            for i := 1 to RecordCount do
            begin
              if DiasEntre(vFechaDesembolso,dmColocacion.IBQuery.FieldbyName('FECHA_A_PAGAR').AsDateTime) <= 360 then
                 vCortoPlazo := vCortoPlazo + dmColocacion.IBQuery.FieldByName('CAPITAL_A_PAGAR').AsCurrency
              else
                 vLargoPlazo := vLargoPlazo + dmColocacion.IBQuery.FieldByName('CAPITAL_A_PAGAR').AsCurrency;
            Next;
            end;
            Close;
        end;

        with dmColocacion.IBQuery do
        begin
          SQL.Clear;
          SQL.Add('select * from "col$lineas" ');
          SQL.Add(' where ID_LINEA = :"ID_LINEA"');
          ParamByName('ID_LINEA').AsInteger := vLinea;
          Open;

          if RecordCount > 0 then
           begin
             vVecesAportes := FieldByName('VECES_APORTES').AsFloat;
             vVecesAhorros := FieldByName('VECES_AHORROS').AsFloat;
             vPorcCredito  := FieldByName('PORCENTAJE_CREDITO').AsFloat;
             vPorcAportes  := FieldByName('PORCENTAJE_APORTES').AsFloat;
             vPorcAhorros  := FieldByName('PORCENTAJE_AHORROS').AsFloat;
             vMinimoCapitaliza := FieldByName('MINIMO_CAPITALIZAR').AsCurrency;
             vCapitalizaAcumulada := IntToBoolean(FieldByName('CAPITALIZACION_ACUMULADA').AsInteger);
           end;

          vTotalAportes := BuscarAportes(vTipoId,vNumeroId);

          if vCapitalizaAcumulada then
              vTAportesCreditosAnt := VerificarAportesCreditosAnt(CBtiposid.KeyValue,ednumeroidentificacion.Text);

{Contabilizo Descuentos}
        with IBDescuentos do begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_DESCUENTO from "col$lineadescuento" where ID_LINEA = :ID_LINEA');
          ParamByName('ID_LINEA').AsInteger := vLinea;
          Open;
          Last;
          First;
          while not Eof do begin
            IBSQL3.Close;
            IBSQL3.SQL.Clear;
            IBSQL3.SQL.Add('select CODIGO,DESCRIPCION_DESCUENTO,VALOR_DESCUENTO,PORCENTAJE_COLOCACION from "col$descuentos" where ID_DESCUENTO = :ID_DESCUENTO');
            IBSQL3.ParamByName('ID_DESCUENTO').AsInteger := IBDescuentos.FieldByName('ID_DESCUENTO').AsInteger;
            IBSQL3.ExecQuery;
            vDescuento := 0;
            if IBSQL3.FieldByName('VALOR_DESCUENTO').AsCurrency > 0 then
             begin
               vDescuento := IBSQL3.FieldByName('VALOR_DESCUENTO').AsCurrency;
             end
            else
             if IBSQL3.FieldByName('PORCENTAJE_COLOCACION').AsFloat > 0 then
                vDescuento := (IBSQL3.FieldByName('PORCENTAJE_COLOCACION').AsFloat / 100) * vDesembolso;

            if vDescuento > 0 then
             begin
               vCaja := vCaja - vDescuento;
               vFechaHora := fFechaHoraActual;
               with IBSQL2 do
                begin
                  SQL.Clear;
                  SQL.Add('insert into "col$concol" ("ID_AGENCIA","ID_COLOCACION","CODIGO",');
                  SQL.Add('"DEBITO","CREDITO","FECHA_Y_HORA") values (');
                  SQL.Add(':"ID_AGENCIA", :"ID_COLOCACION",');
                  SQL.Add(':"CODIGO", :"DEBITO", :"CREDITO",');
                  SQL.Add(':"FECHA_Y_HORA")');
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                  ParamByName('CODIGO').AsString := IBSQL3.FieldByName('CODIGO').AsString;
                  ParamByName('DEBITO').AsCurrency := 0;
                  ParamByName('CREDITO').AsCurrency := vDescuento;
                  ParamByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                  ExecQuery;
                end;
             end;
            vDescuento := 0;
            Next;
          end; // fin de while
          Close;
        end;

{fin contabilizo descuentos}

          if vCapitalizaAcumulada then
           begin
             if vVecesAportes > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso / vVecesAportes,0)
             else
             if vVecesAhorros > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso / vVecesAhorros,0);
//             else
             if vPorcCredito > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso * ( vPorcCredito / 100),0 )
             else
             if vPorcAportes > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso * ( vPorcAportes / 100),0 );
           end
          else
           begin
             if vVecesAportes > 0 then
               vDctoCapitalizacion := SimpleRoundTo(vDesembolso / vVecesAportes,0)
             else
             if vVecesAhorros > 0 then
               vDctoCapitalizacion := SimpleRoundTo(vDesembolso / vVecesAhorros,0);
//             else
             if vPorcCredito > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + (SimpleRoundTo(vDesembolso * ( vPorcCredito / 100),0 ))
             else
             if vPorcAportes > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + (SimpleRoundTo(vDesembolso * ( vPorcAportes / 100),0 ));
           end;
          vDctoCapitalizacion := vDctoCapitalizacion + vTAportesCreditosAnt;
          vDctoCapitalizacion := vTotalAportes - vDctoCapitalizacion;
          if vDctoCapitalizacion < 0 then
             vDctoCapitalizacion := Abs(vDctoCapitalizacion)
          else
             vDctoCapitalizacion := 0;

          vCaja := vCaja - vDctoCapitalizacion;

          with dmColocacion.IBQuery do
           begin
             SQL.Clear;
             SQL.Add('select * from "col$codigospuc" where ');
             SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
             SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
             SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA"');
             ParamByName('ID_CLASIFICACION').AsInteger := vClasificacion;
             ParamByName('ID_GARANTIA').AsInteger := vGarantia;
             ParamByName('ID_CATEGORIA').AsString := 'A';
             Open;
             vCodigoCortoPlazo := FieldByName('COD_CAPITAL_CP').AsString;
             vCodigoLargoPlazo := FieldByName('COD_CAPITAL_LP').AsString;
             vCodigoInteresAnticipado:= FieldByName('COD_INT_ANT').AsString;
             Close;
           end;
{Contabilizo Corto y Largo Plazo}
           with dmColocacion.IBDScontable do
            begin
              Open;
              if vCortoPlazo > 0 then
              begin
                 Append;
                 FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                 FieldByName('ID_AGENCIA').AsInteger := Agencia;
                 FieldByName('ID_COLOCACION').AsString := vIdColocacion;
                 FieldByName('CODIGO').AsString := vCodigoCortoPlazo;
                 FieldByName('DEBITO').AsCurrency := vCortoPlazo;
                 FieldByName('CREDITO').AsCurrency := 0;
                 Post;
              end;
              if vLargoPlazo > 0 then
              begin
                 Append;
                 FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                 FieldByName('ID_AGENCIA').AsInteger := Agencia;
                 FieldByName('ID_COLOCACION').AsString := vIdColocacion;
                 FieldByName('CODIGO').AsString := vCodigoLargoPlazo;
                 FieldByName('DEBITO').AsCurrency := vLargoPlazo;
                 FieldByName('CREDITO').AsCurrency := 0;
                 Post;
              end;
             end;
        end;
{fin contabilizo Corto y Largo Plazo}

{Contabilizo Interes Correr Fecha Pago}
        if interes_anticipado then begin
          with dmColocacion.IBSQLcodigos do
           begin
             SQL.Clear;
             SQL.Add('select * from "col$codigospuc" where ');
             SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
             SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
             SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
             ParamByName('ID_CLASIFICACION').AsInteger := vClasificacion;
             ParamByName('ID_GARANTIA').AsInteger := vGarantia;
             ParamByName('ID_CATEGORIA').AsString := 'A';
             ExecQuery;
             if RecordCount = 0 then
              begin
                MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
                Close;
                Exit;
              end;
          end;

          FechasLiq := TList.Create;
          if vTipoCuota = 1 then CalcularFechasLiquidarFija(vFechaDesembolso,FechaHoy,vFechaPago,FechasLiq)
          else if vTipoCuota = 2 then CalcularFechasLiquidarVarAnticipada(vFechaDesembolso,FechaHoy,vFechaPago,FechasLiq)
          else if vTipoCuota = 3 then CalcularFechasLiquidarVarVencida(vFechaDesembolso,FechaHoy,vFechaPago,FechasLiq);

          for J := 0 to 0 do//(FechasLiq.Count - 1) do
          begin
            AF := FechasLiq.Items[J];
            if (AF^.Anticipado) or (AF^.Devuelto) then
              vCodigoIntereses := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
            else
             if AF^.Causado then
              vCodigoIntereses := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
            else
             if AF^.Corrientes then
              vCodigoIntereses := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;

            vDescuento := SimpleRoundTo((vDesembolso * vTasaNominal / 100 * DiasPago ) / 360,0);
            vCaja := vCaja - vDescuento;
            vFechaHora := fFechaHoraActual;
            if vDescuento > 0 then begin
              with IBSQL2 do
               begin
                 Close;
                 SQL.Clear;
                 SQL.Add('insert into "col$concol" ("ID_AGENCIA","ID_COLOCACION","CODIGO",');
                 SQL.Add('"DEBITO","CREDITO","FECHA_Y_HORA") values (');
                 SQL.Add(':"ID_AGENCIA", :"ID_COLOCACION",');
                 SQL.Add(':"CODIGO", :"DEBITO", :"CREDITO",');
                 SQL.Add(':"FECHA_Y_HORA")');
                 ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                 ParamByName('CODIGO').AsString := vCodigoIntereses;
                 ParamByName('DEBITO').AsCurrency := 0;
                 ParamByName('CREDITO').AsCurrency := vDescuento;
                 ParamByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                 ExecQuery;
               end;
            end;  // Fin de if vDescuento > 0
          end;  // Fin de For
          // Limpiar tabla de Fechas
          for J := 0 to (FechasLiq.Count - 1) do
           begin
             AF := FechasLiq.Items[J];
             Dispose(AF);
           end;
          dmColocacion.IBSQLcodigos.Close;
          vDescuento := 0;
        end; // Fin interes_anticipado
{Fin Contabilizo Interes Correr Fecha Pago}
{Contabilizo Interes Anticipado}
             with dmColocacion.IBDScontable do
             begin
              Open;
              if vInteresVencido = 'A' then
              begin
                 Append;
                 vInteresAnt := SimpleRoundTo(vDesembolso*(vTasaNominal/100)*vAmortizaInteres/360,0);
                 FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                 FieldByName('ID_AGENCIA').AsInteger := Agencia;
                 FieldByName('ID_COLOCACION').AsString := vIdColocacion;
                 FieldByName('CODIGO').AsString := vCodigoInteresAnticipado;
                 FieldByName('DEBITO').AsCurrency := 0;
                 FieldByName('CREDITO').AsCurrency := vInteresAnt;
                 Post;
                 vCaja := vCaja - vInteresAnt;
              end;
             end;
{Fin Contabilizo Interes Anticipado}
{Agregar al extracto}
                if vInteresAnt <> 0 then
                begin
                  With Dmcolocacion.IBQuery1 do
                  begin
                    SQL.Clear;
                    SQL.Add('select CODIGO from "col$codigospucbasicos" ');
                    SQL.Add('where ID_CODIGOPUCBASICO = 8');
                    Open;
                    vCodigoPuc := FieldByName('CODIGO').AsString;
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
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vNotaContable);
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
                    ParamByName('HORA_EXTRACTO').AsDateTime := Time;
                    ParamByName('CUOTA_EXTRACTO').AsInteger := 0;
                    ParamByName('TIPO_OPERACION').AsInteger := 1;
                    ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vDesembolso;
                    ParamByName('ABONO_CAPITAL').AsCurrency := 0;
                    ParamByName('ABONO_CXC').AsCurrency := 0;
                    ParamByName('ABONO_SERVICIOS').AsCurrency := 0;
                    ParamByName('ABONO_ANTICIPADO').AsCurrency := vInteresAnt;
                    ParamByName('ABONO_MORA').AsCurrency := 0;
                    ParamByName('ABONO_SEGURO').AsCurrency := 0;
                    ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
                    ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
                    ParamByName('ABONO_OTROS').AsCurrency := 0;
                    ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasaNominal;
                    ParamByName('ID_EMPLEADO').AsString := DBAlias;
                    ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaInteres;
                    ParamByName('CAPITAL_PAGO_HASTA').AsDate := vFechaCapital;
                    ParamByName('TIPO_ABONO').AsInteger := BooleanoToInt(False);
                    ExecSQL;
                    Close;
                  end;
                  With Dmcolocacion.IBQuery1 do
                  begin
                    sql.Clear;
                    SQL.Add('insert into "col$extractodet" values (');
                    SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
                    SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
                    SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_CBTE_COLOCACION').AsInteger:= StrToInt(vNotaContable);
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
                    ParamByName('HORA_EXTRACTO').AsDateTime := Time;
                    ParamByName('CODIGO_PUC').AsString := vCodigoInteresAnticipado;
                    ParamByName('FECHA_INICIAL').AsDate := fFechaActual;
                    ParamByName('FECHA_FINAL').AsDate := vFechaInteres;
                    ParamByName('DIAS_APLICADOS').AsInteger := DiasEntre(FechaHoy,vFechaInteres);
                    ParamByName('TASA_LIQUIDACION').AsFloat := vTasaNominal;
                    ParamByName('VALOR_DEBITO').AsCurrency := vInteresAnt;
                    ParamByName('VALOR_CREDITO').AsCurrency := 0;
                    ExecSql;
                    Close;
                  end;
                  With Dmcolocacion.IBQuery1 do
                  begin
                    sql.Clear;
                    SQL.Add('insert into "col$extractodet" values (');
                    SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
                    SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
                    SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_CBTE_COLOCACION').AsInteger:= StrToInt(vNotaContable);
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
                    ParamByName('HORA_EXTRACTO').AsDateTime := Time;
                    ParamByName('CODIGO_PUC').AsString := vCodigoPuc;
                    ParamByName('FECHA_INICIAL').AsDate := fFechaActual;
                    ParamByName('FECHA_FINAL').AsDate := fFechaActual;
                    ParamByName('DIAS_APLICADOS').AsInteger := 0;
                    ParamByName('TASA_LIQUIDACION').AsFloat := 0;
                    ParamByName('VALOR_DEBITO').AsCurrency := 0;
                    ParamByName('VALOR_CREDITO').AsCurrency := vInteresAnt;
                    ExecSql;
                    Close;
                  end;
                 With DmColocacion.IBQuery1 do
                  begin
                    sql.Clear;
                    sql.Add('update "col$colocacion" set ');
                    sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
                    sql.Add(' where ');
                    sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                    sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_INTERES').AsDate := vFechaInteres;
                    ExecSql;
                    Close;
                  end;
                end;
{fin Agregar al Extracto}
        with dmColocacion.IBQuery do
        begin
{Busco Codigo Ahorros y Aplico Valor Ahorros}
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" ');
           SQL.Add('where ID_CODIGOPUCBASICO = 8');
           Open;
           vCodigoPuc := FieldByName('CODIGO').AsString;
           Close;
           dmColocacion.IBDScontable.Append;
           dmColocacion.IBDScontable.FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
           dmColocacion.IBDScontable.FieldByName('ID_AGENCIA').AsInteger := Agencia;
           dmColocacion.IBDScontable.FieldByName('ID_COLOCACION').AsString := vIdColocacion;
           dmColocacion.IBDScontable.FieldByName('CODIGO').AsString := vCodigoPuc;
           dmColocacion.IBDScontable.FieldByName('DEBITO').AsCurrency := 0;
           dmColocacion.IBDScontable.FieldByName('CREDITO').AsCurrency := vCaja;
           dmColocacion.IBDScontable.Post;
{fin Busco Codigo Caja y Aplico Valor Caja}
{Busco Codigo Capitalización y Aplico Valor Capitalizacion}
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" ');
           SQL.Add('where ID_CODIGOPUCBASICO = 3');
           Open;
           vCodigoPuc := FieldByName('CODIGO').AsString;
           Close;
           dmColocacion.IBDScontable.Append;
           if vDctoCapitalizacion > 0 then
            begin
              dmColocacion.IBDScontable.FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
              dmColocacion.IBDScontable.FieldByName('ID_AGENCIA').AsInteger := Agencia;
              dmColocacion.IBDScontable.FieldByName('ID_COLOCACION').AsString := vIdColocacion;
              dmColocacion.IBDScontable.FieldByName('CODIGO').AsString := vCodigoPuc;
              dmColocacion.IBDScontable.FieldByName('DEBITO').AsCurrency := 0;
              dmColocacion.IBDScontable.FieldByName('CREDITO').AsCurrency := vDctoCapitalizacion;
              dmColocacion.IBDScontable.Post;
            end;
{fin Busco Codigo Capitalización y Aplico Valor Capitalizacion}
        end;
    contabilizar_descuentos;// aplica a la nota contable el resumen de de las cuotas ;
    dmColocacion.IBDScolocacion.Transaction.Commit;
  Except
    dmColocacion.IBDScolocacion.Transaction.Rollback;
  end;

end;

function TFrmDesembolso.BuscarAportes(TipoId: Integer;
  DocumentoId: string): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
begin
   with IBSQL2 do begin
     Close;
     if Transaction.InTransaction then
        Transaction.Commit;
     Transaction.StartTransaction;
     SQL.Clear;
     Sql.Add('select * from P_CAP_0019 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
     ParamByName('ID_PERSONA').AsString := vNumeroId;
     ExecQuery;
     Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     Digito := StrToInt(DigitoControl(1,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;
     SQL.Clear;
     SQL.Add('Select * from P_CAP_0012 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
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
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
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
     SQL.Add('SELECT  * from P_CAP_0011 (:NUMERO_CUENTA,:DIGITO_CUENTA)');
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
     ExecQuery;
     Canje := FieldByName('CHEQUES').AsCurrency;
     Close;
   end;
     Saldo := Saldo + Movimiento;
     Result := Saldo - Canje;
end;

function TFrmDesembolso.VerificarAportesCreditosAnt(
  TipoIdentificacion: Integer; NumeroIdentificacion: String): Currency;
var
Saldo : Currency;
VecesAportes : Integer;
PorcentajeAportes : Single;
AportesRequeridos : Currency;
EsVigente : Integer;
I : Integer;
begin
        with dmColocacion.IBQuery1 do
        begin
          SQL.Clear;
          SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
          SQL.Add('where "col$estado".ES_VIGENTE = 1');
          Open;
          EsVigente := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          Close;

          SQL.Clear;
          SQL.Add('select');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO,');
          SQL.Add('"col$lineas".VECES_APORTES,');
          SQL.Add('"col$lineas".PORCENTAJE_APORTES');
          SQL.Add(' from "col$colocacion" ');
          SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
          SQL.Add(' where ');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION = :"ID_IDENTIFICACION" AND');
          SQL.Add('"col$colocacion".ID_PERSONA = :"ID_PERSONA" AND');
          SQL.Add('"col$colocacion".ID_ESTADO_COlOCACION = :"ID_ESTADO_COLOCACION"');
          ParamByName('ID_IDENTIFICACION').AsInteger := TipoIdentificacion;
          ParamByName('ID_PERSONA').AsString := NumeroIdentificacion;
          ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsVigente;
          Open;
          AportesRequeridos := 0;
          VecesAportes := 0;
          PorcentajeAportes := 0;
          RecordCount;
          while not dmColocacion.IBQuery1.Eof do
           begin
             Saldo := FieldByName('SALDO').AsCurrency;
             VecesAportes := FieldByName('VECES_APORTES').AsInteger;
             PorcentajeAportes := FieldByName('PORCENTAJE_APORTES').AsFloat;
             if VecesAportes > 0 then
               AportesRequeridos := AportesRequeridos + SimpleRoundTo(Saldo/VecesAportes,0);
             if PorcentajeAportes > 0 then
               AportesRequeridos := AportesRequeridos + SimpleRoundTo(((Saldo*PorcentajeAportes)/100),0);
             VecesAportes := 0;
             PorcentajeAportes := 0;
             Next;
           end;
        end;
        Close;
        Result := AportesRequeridos;
end;

function TFrmDesembolso.CrearColocacion: Boolean;
var Consec:String;
begin
{ Validaciones}
            if vValorCuota <= 0 then
            begin
               MessageDlg('El Valor de la Cuota no es Valido',mtError,[mbok],0);
               Edtipotasa.SetFocus;
               Result := False;
               Exit;
            end;
            if vTipoId < 1 Then
            begin
               messagedlg('El tipo de Identificación no es valido',mtError,[mbOk],0);
               CBtiposid.SetFocus;
               Result := false;
               exit;
            end;
            if vNumeroId = '' then
            begin
               messagedlg('El número de identificación no es valido',mtError,[mbOk],0);
               EdNumeroIdentificacion.SetFocus;
               Result := false;
               exit;
            end;
            if vClasificacion < 1 then
            begin
               messagedlg('El tipo de clasificación no es valido',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
            if vLinea < 1 then
            begin
               messagedlg('El tipo de linea no es valido',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
            if vInversion < 1 then
            begin
               messagedlg('El tipo de inversión no es valido',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
            if vRespaldo < 1 then
            begin
               Result := false;
               exit;
            end;
            if vGarantia < 1 then
            begin
               messagedlg('El tipo de garantia no es valido',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
            if vDesembolso < 1 then
            begin
               messagedlg('No diligencio el valor de la colocación',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
            if vPlazo < 1 then
            begin
               messagedlg('No diligencio el plazo de la colocación',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
            if vTasaEfectiva < 1 then
            begin
               messagedlg('La tasa efectiva no es valida',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
            if vTasaMora < 1 then
            begin
               messagedlg('La tasa de mora no es valida',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
            if vAmortizaCapital < 1 then
            begin
               messagedlg('El valor de la amortización a capital no es valido',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
            if vAmortizaInteres < 1 then
            begin
               messagedlg('El valor de la amortización a interes no es valido',mtError,[mbOk],0);
               Result := false;
               exit;
            end;
{fin Validaciones}
            CmdGrabar.Enabled := False;
///**Genero el consecutivo
            Consec := IntToStr(YearOf(Date)) + FormatCurr('0000000',ObtenerConsecutivoColocacion(IBConsecutivo));
//            Consec := IntToStr(YearOf(Date)) + FormatCurr('0000000',ObtenerConsecutivoTmp(IBConsecutivo));
            vIdColocacion := Consec;
            EdNumeroColocacion.Text := Consec;

            Consec := FormatCurr('00000000',ObtenerConsecutivo(IBConsecutivo));
//            Consec := FormatCurr('00000000',ObtenerConsecutivoTmp(IBConsecutivo));
            vNotaContable := consec;
            EdNotaContable.Text := vNotaContable;
{Crear La Tabla de Liquidación}
            try
              if GrabarColocacion then
               begin
                 if vLinea = 7 then
                    CrearTablaLiquidacionVivienda(vIDColocacion,vDesembolso,vValorCuota,
                           CalculoFecha(EdFechaPago.Date,vPeriodoGracia),vTasaEfectiva,vPuntosAdicionales,
                           vAmortizaCapital,vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido)
                 else
                    CrearTablaLiquidacion(vIDColocacion,vDesembolso,vValorCuota,
                           CalculoFecha(EdFechaPago.Date,vPeriodoGracia),vTasaEfectiva,vPuntosAdicionales,
                           vAmortizaCapital,vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido);

                 Grabar_Garantias;
                 Contabilizar;
               end;
            Except
             Result := False;
             Exit;
            end;
            Result := True;
end;

function TFrmDesembolso.GrabarColocacion: boolean;
begin
        vFechaDesembolso := fFechaActual;
           try
             with dmColocacion.IBQuery do
              begin
                SQL.Clear;
                SQL.Add('insert into "col$colocacion" (');
                SQL.Add('"col$colocacion"."ID_AGENCIA",');
                SQL.Add('"col$colocacion"."ID_COLOCACION", "col$colocacion"."ID_IDENTIFICACION",');
                SQL.Add('"col$colocacion"."ID_PERSONA", "col$colocacion"."ID_CLASIFICACION",');
                SQL.Add('"col$colocacion"."ID_LINEA", "col$colocacion"."ID_INVERSION", "col$colocacion"."ID_RESPALDO",');
                SQL.Add('"col$colocacion"."ID_GARANTIA", "col$colocacion"."ID_CATEGORIA", "col$colocacion"."ID_EVALUACION",');
                SQL.Add('"col$colocacion"."FECHA_DESEMBOLSO", "col$colocacion"."VALOR_DESEMBOLSO",');
                SQL.Add('"col$colocacion"."PLAZO_COLOCACION", "col$colocacion"."FECHA_VENCIMIENTO",');
                SQL.Add('"col$colocacion"."TIPO_INTERES", "col$colocacion"."ID_INTERES", "col$colocacion"."TASA_INTERES_CORRIENTE",');
                SQL.Add('"col$colocacion"."TASA_INTERES_MORA", "col$colocacion"."PUNTOS_INTERES",');
                SQL.Add('"col$colocacion"."ID_TIPO_CUOTA", "col$colocacion"."AMORTIZA_CAPITAL",');
                SQL.Add('"col$colocacion"."AMORTIZA_INTERES", "col$colocacion"."PERIODO_GRACIA",');
                SQL.Add('"col$colocacion"."DIAS_PRORROGADOS", "col$colocacion"."VALOR_CUOTA",');
                SQL.Add('"col$colocacion"."ABONOS_CAPITAL", "col$colocacion"."FECHA_CAPITAL",');
                SQL.Add('"col$colocacion"."FECHA_INTERES", "col$colocacion"."ID_ESTADO_COLOCACION",');
                SQL.Add('"col$colocacion"."ID_ENTE_APROBADOR", "col$colocacion"."ID_EMPLEADO",');
                SQL.Add('"col$colocacion"."NOTA_CONTABLE", "col$colocacion"."NUMERO_CUENTA",');
                SQL.Add('"col$colocacion"."ES_ANORMAL","col$colocacion"."DIAS_PAGO","col$colocacion"."RECIPROCIDAD")');
                SQL.Add(' VALUES (');
                SQL.Add(':"ID_AGENCIA",');
                SQL.Add(':"ID_COLOCACION",:"ID_IDENTIFICACION",:"ID_PERSONA",');
                SQL.Add(':"ID_CLASIFICACION",:"ID_LINEA",:"ID_INVERSION",');
                SQL.Add(':"ID_RESPALDO",:"ID_GARANTIA",:"ID_CATEGORIA",');
                SQL.Add(':"ID_EVALUACION",:"FECHA_DESEMBOLSO",:"VALOR_DESEMBOLSO",');
                SQL.Add(':"PLAZO_COLOCACION",:"FECHA_VENCIMIENTO",:"TIPO_INTERES",');
                SQL.Add(':"ID_INTERES",:"TASA_INTERES_CORRIENTE",:"TASA_INTERES_MORA",');
                SQL.Add(':"PUNTOS_INTERES",:"ID_TIPO_CUOTA",:"AMORTIZA_CAPITAL",');
                SQL.Add(':"AMORTIZA_INTERES",:"PERIODO_GRACIA",:"DIAS_PRORROGADOS",');
                SQL.Add(':"VALOR_CUOTA",:"ABONOS_CAPITAL",:"FECHA_CAPITAL",:"FECHA_INTERES",');
                SQL.Add(':"ID_ESTADO_COLOCACION",:"ID_ENTE_APROBADOR",:"ID_EMPLEADO",');
                SQL.Add(':"NOTA_CONTABLE",:"NUMERO_CUENTA",:"ES_ANORMAL",:"DIAS_PAGO",:"RECIPROCIDAD")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
                ParamByName('ID_PERSONA').AsString := vNumeroId;
                ParamByName('ID_CLASIFICACION').AsInteger := vClasificacion;
                ParamByName('ID_LINEA').AsInteger := vLinea;
                ParamByName('ID_INVERSION').AsInteger := vInversion;
                ParamByName('ID_RESPALDO').AsInteger := vRespaldo;
                ParamByName('ID_GARANTIA').AsInteger := vGarantia;
                ParamByName('ID_CATEGORIA').AsString := 'A';
                ParamByName('ID_EVALUACION').AsString := 'A';
                ParamByName('FECHA_DESEMBOLSO').AsDate := vFechaDesembolso;
                ParamByName('VALOR_DESEMBOLSO').AsCurrency := vDesembolso;
                ParamByName('PLAZO_COLOCACION').AsInteger := vPlazo;
                ParamByName('FECHA_VENCIMIENTO').AsDate := vFechaVencimiento;
                ParamByName('TIPO_INTERES').AsString := vTipoTasa;
                ParamByName('ID_INTERES').AsInteger:= vTasaVariable;
                ParamByName('TASA_INTERES_CORRIENTE').AsFloat := vTasaEfectiva;
                ParamByName('TASA_INTERES_MORA').AsFloat := vTasaMora;
                ParamByName('PUNTOS_INTERES').AsFloat := vPuntosAdicionales;
                ParamByName('ID_TIPO_CUOTA').AsInteger := vTipoCuota;
                ParamByName('AMORTIZA_CAPITAL').AsInteger := vAmortizaCapital;
                ParamByName('AMORTIZA_INTERES').AsInteger := vAmortizaInteres;
                ParamByName('PERIODO_GRACIA').AsInteger := vPeriodoGracia;
                ParamByName('DIAS_PRORROGADOS').AsInteger := 0;
                ParamByName('VALOR_CUOTA').AsCurrency := vValorCuota;
                ParamByName('ABONOS_CAPITAL').AsCurrency := 0;
                ParamByName('FECHA_CAPITAL').AsDate := vFechaCapital;
                ParamByName('FECHA_INTERES').AsDate := vFechaInteres;
//credito no visado por defecto
                ParamByName('ID_ESTADO_COLOCACION').AsInteger := 4;
                ParamByName('ID_ENTE_APROBADOR').AsInteger := vEnteAprobador;
                ParamByName('ID_EMPLEADO').AsString := DBAlias;
                ParamByName('NOTA_CONTABLE').AsString := vNotaContable;
                ParamByName('NUMERO_CUENTA').AsInteger := vCtaAportes;
                ParamByName('ES_ANORMAL').AsInteger := 0;
                ParamByName('DIAS_PAGO').AsInteger := DiasPago;
                ParamByName('RECIPROCIDAD').AsFloat := reciprocidad;
                ExecSQL;
                Close;
              end;
              Result:= true;
           except
              Result := false;
              dmGeneral.IBTransaction1.Rollback;
           end;
end;

procedure TFrmDesembolso.EdFechaPagoExit(Sender: TObject);
begin
        VfechaPago := EdFechaPago.Date;
        vFechaVencimiento := CalculoFecha(VfechaPago,vPlazo+vPeriodoGracia);
        DateTime_SetFormat(EdFechaVencimiento.Handle,'yyyy/MM/dd');
        EdFechaVencimiento.Date := vFechaVencimiento;
        DiasPago := DiasEntre(vFechaDesembolso,vFechaPago);
        if vInteresVencido = 'V' then
        begin
                vFechaCapital := CalculoFecha(VfechaPago,vPeriodoGracia);
                vFechaInteres := CalculoFecha(VfechaPago,vPeriodoGracia);
        end
        else
        begin
                vFechaCapital := CalculoFecha(VfechaPago,vAmortizaCapital+vPeriodoGracia);
                vFechaInteres := CalculoFecha(VfechaPago,vAmortizaInteres+vPeriodoGracia);
        end;
        DateTime_SetFormat(EdFechaCapital.Handle,'yyyy/MM/dd');
        EdFechaCapital.Date := vFechaCapital;
        DateTime_SetFormat(EdFechaInteres.Handle,'yyyy/MM/dd');
        EdFechaInteres.Date := vFechaInteres;
        if VfechaPago <> vFechaDesembolso then
           interes_anticipado := True
        else
           interes_anticipado := False;
end;

procedure TFrmDesembolso.EdFechaPagoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.interes_ant;
var   listafecha :TList;
begin
        {if vTipoCuota = 1 then
           calculofechafijo
        else if vTipoCuota = 2 then
        else }
end;

procedure TFrmDesembolso.Actualiza_temp;
begin

        with DmSolicitud.IBSolicitud1 do
        begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('update "col$extractotmp" set');
            SQL.Add('ID_COLOCACION_DES = :ID_COLOCACION');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ParamByName('ID_COLOCACION').AsString := VidColocacion;
            Open;
            SQL.Clear;
            SQL.Add('update "col$extractodettmp" set');
            SQL.Add('ID_COLOCACION_DES = :ID_COLOCACION');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ParamByName('ID_COLOCACION').AsString := VidColocacion;
            Open;
            SQL.Clear;
            SQL.Add('update "col$infdesembolso" set');
            SQL.Add('ID_COLOCACION_DES = :ID_COLOCACION');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ParamByName('ID_COLOCACION').AsString := VidColocacion;
            Open;
            Close;
            Transaction.Commit;
        end;
end;

procedure TFrmDesembolso.Elimina_temp;
begin
       if PermiteEliJud then
        begin
          with DmSolicitud.IBSolicitud1 do
          begin
            Close;
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;


            SQL.Clear;
            SQL.Add('delete from "col$extractotmp" where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            Open;
            SQL.Clear;
            SQL.Add('delete from "col$extractodettmp" where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            Open;
            SQL.Clear;
            SQL.Add('delete from "col$infdesembolso" where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            Open;
            Transaction.Commit;
          end;
        end;
end;

procedure TFrmDesembolso.cambia_estado;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit
           else
              Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('update "col$solicitud" set ');
           SQL.Add('ESTADO = 10');
           SQL.Add('WHERE ID_SOLICITUD = :ID_SOLICITUD');
           ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
           Open;
           Close;
           Transaction.Commit;
        end;
end;

procedure TFrmDesembolso.grupos(valor: boolean);
begin
        GroupBox2.Enabled := valor;
        JvGroupBox1.Enabled := valor;
        JvGroupBox2.Enabled := valor;
//        GroupBox3.Enabled := valor;
        Grupoinformacion.Enabled := valor;
        GroupBox1.Enabled := not(valor);
end;

procedure TFrmDesembolso.contabilizar_descuentos;
var    i :Integer;
begin
        for i := 0 to 1 do
        begin
        with DmSolicitud.IBSolicitud1 do
        begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('select "col$extractodettmp".codigo_puc, sum("col$extractodettmp".valor_credito) as credito, SUM("col$extractodettmp".valor_debito) AS debito from "col$extractodettmp"');
           SQL.Add('where "col$extractodettmp".id_solicitud = :ID_SOLICITUD and');
           if i = 0 then
              SQL.Add('VALOR_CREDITO = 0')
           else
              SQL.Add('VALOR_CREDITO > 0');
           SQL.Add('group by "col$extractodettmp".codigo_puc');
           ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
           Open;
           while not Eof do
           begin
               with dmColocacion.IBQuery do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('insert into "col$concol" ("ID_AGENCIA","ID_COLOCACION","CODIGO",');
                  SQL.Add('"DEBITO","CREDITO","FECHA_Y_HORA") values (');
                  SQL.Add(':"ID_AGENCIA", :"ID_COLOCACION",');
                  SQL.Add(':"CODIGO", :"DEBITO", :"CREDITO",');
                  SQL.Add(':"FECHA_Y_HORA")');
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                  ParamByName('CODIGO').AsString := DmSolicitud.IBSolicitud1.FieldByName('CODIGO_PUC').AsString;
                  ParamByName('DEBITO').AsCurrency := DmSolicitud.IBSolicitud1.FieldByName('debito').AsCurrency;
                  ParamByName('CREDITO').AsCurrency := DmSolicitud.IBSolicitud1.FieldByName('credito').AsCurrency;
                  ParamByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                  Open;
                end;
            Next;
           end;
        end;
        end;
end;

function TFrmDesembolso.recupera_codigo(codigo: integer): string;
begin
    with DmSolicitud.IBSolicitud1 do
    begin
      if Transaction.InTransaction then
         Transaction.Commit;
      Transaction.StartTransaction;
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = :codigo');
     ParamByName('codigo').AsInteger := codigo;
     Open;
     Result := FieldByName('CODIGO').AsString;
     Close;
   end;

end;

procedure TFrmDesembolso.actualiza_tabladesembolso(es_nuevo:Boolean);
var     numero_desembolso :Integer;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           if es_nuevo then
           begin
             SQL.Add('select max(ID_DESEMBOLSO) as NUMERO_DESEMBOLSO from "col$desembolsoparcial"');
             SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
             ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
             Open;
             numero_desembolso := FieldByName('NUMERO_DESEMBOLSO').AsInteger + 1;
             SQL.Clear;
             SQL.Add('insert into "col$desembolsoparcial"');
             SQL.Add('values (');
             SQL.Add(':ID_SOLICITUD, :ID_DESEMBOLSO, :VALOR_DESEMBOLSO, :FECHA_DESEMBOLSO, :DESEMBOLSADO, :ID_COLOCACION, :ID_AGENCIA)');
             ParamByName('ID_DESEMBOLSO').AsInteger := numero_desembolso;
             ParamByName('DESEMBOLSADO').AsInteger := 0;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
           end
           else
           begin
             SQL.Add('update "col$desembolsoparcial" set');
             SQL.Add('VALOR_DESEMBOLSO = :VALOR_DESEMBOLSO,');
             SQL.Add('FECHA_DESEMBOLSO = :FECHA_DESEMBOLSO,');
             SQL.Add('ID_COLOCACION = :ID_COLOCACION');
             SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
           end;
             ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
             ParamByName('VALOR_DESEMBOLSO').AsCurrency := vDesembolso;
             ParamByName('FECHA_DESEMBOLSO').AsDate := vfechahora;
             ParamByName('ID_COLOCACION').AsString := VidColocacion;
             Open;
             Close;
             Transaction.Commit;
        end;
end;

procedure TFrmDesembolso.EDvalorcolocacionExit(Sender: TObject);
begin
        if vdesembolsoparcial then
        begin
          if EDvalorcolocacion.Value > VvalorDesembolso then
          begin
            MessageDlg('El valor no Puede ser Mayor al Aprobado',mtWarning,[mbok],0);
            EDvalorcolocacion.Value := VvalorDesembolso;
            EDvalorcolocacion.SetFocus;
            Exit;
          end;
        end;
        vDesembolso := EDvalorcolocacion.Value
end;

function TFrmDesembolso.extrae_valor: currency;
var     valor :Currency;
begin
        valor := 0;
        if vId_vida then
        begin
           valor := valor + seguro(5);
           des_equivida := seguro(5);
        end;
        if vId_exequial then
        begin
           valor := valor + seguro(6);
           des_exequial := seguro(6);
        end;
        if Capitalizacion > 0 then
           valor := valor + vDctoCapitalizacion;
        with DmSolicitud.IBSolicitud2 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_DESCUENTO from "col$descuentos"');
          SQL.Add('where ID_DESCUENTO = 1');
          Open;
          valor := valor + FieldByName('VALOR_DESCUENTO').AsCurrency;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('SUM("col$extractodettmp".VALOR_DEBITO) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$extractodettmp"');
          SQL.Add('WHERE');
          SQL.Add('("col$extractodettmp".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("col$extractodettmp".CODIGO_PUC = :CODIGO_PUC)');
          ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
          ParamByName('CODIGO_PUC').AsString := recupera_codigo(8);
          Open;
          valor := valor + FieldByName('TOTAL').AsCurrency ;
          des_cartera := FieldByName('TOTAL').AsCurrency;
          if Es_Fundacion = False then
          begin
            SQL.Clear;
            SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 8');
            Open;
            valor := valor + FieldByName('VALOR_MINIMO').AsCurrency;
          end;
          Close;
          Transaction.Commit;
        end;
        Result := valor;
end;

procedure TFrmDesembolso.verifica_creditos;
var    resultado_mensaje :string;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"gen$persona".NOMBRE, "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"col$codeudor".ID_PERSONA,');
           SQL.Add('"col$codeudor".ID_IDENTIFICACION');
           SQL.Add('FROM');
           SQL.Add('"col$codeudor"');
           SQL.Add('INNER JOIN "gen$persona" ON ("col$codeudor".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$codeudor".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
           SQL.Add('WHERE');
           SQL.Add('("col$codeudor".ID_SOLICITUD = :ID_SOLICITUD) AND');
           SQL.Add('("col$codeudor".ES_CONYUGUE = 0)');
           ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
           Open;
           while not Eof do
           begin
             resultado_mensaje := es_juridico(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger);
             if  resultado_mensaje <> '' then
                mensaje := mensaje + #13 + resultado_mensaje + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' '+ FieldByName('SEGUNDO_APELLIDO').AsString + ' '+ FieldByName('NOMBRE').AsString;
             Next;
           end;
           resultado_mensaje := es_juridico(vidpersona ,vididentificacion);
           if  resultado_mensaje <> '' then
               mensaje := mensaje + #13 + resultado_mensaje + ' '+EdNombre.Text;

        end;
end;

function TFrmDesembolso.es_juridico(id_persona:string;id_identificacion:integer): string;
begin
        with DmSolicitud.IBsolicitud2 do
        begin
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$colocacion".ID_COLOCACION');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$infdesembolso" ON ("col$colocacion".ID_COLOCACION = "col$infdesembolso".id_colocacion)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("col$colocacion".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION BETWEEN 2 AND 3) AND');
          SQL.Add('("col$infdesembolso".ID_COLOCACION <> "col$colocacion".ID_COLOCACION)');
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          Open;
          if RecordCount = 0 then begin
             Result := '';
             PermiteEliJud := False;
          end
          else begin
             Result := FieldByName('ID_COLOCACION').AsString + ' Estado ' + FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
             PermiteEliJud := True;
          end;
        end;
end;

function TFrmDesembolso.busca_tipo(id_persona: string;
  id_identificacion: integer): string;
begin
        with DmSolicitud.IBsolicitud3 do
        begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('ID_ENTRADA');
           SQL.Add('FROM');
           SQL.Add('"col$codeudor"');
           SQL.Add('WHERE');
           SQL.Add('("col$codeudor".ID_PERSONA = :ID_PERSONA) AND');
           SQL.Add('("col$codeudor".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
           SQL.Add('("col$codeudor".ID_SOLICITUD = :ID_SOLICITUD)');
           ParamByName('ID_PERSONA').AsString := id_persona;
           ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
           ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
           Open;
           if RecordCount = 0 then
              Result := 'Deudor'
           else
              Result := 'Codeudor-'+FieldByName('ID_ENTRADA').AsString;
        end;
end;

procedure TFrmDesembolso.EDpuntosKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmDesembolso.EdFechaPagoChange(Sender: TObject);
begin
        edfechapagoexit(Self);
end;

procedure TFrmDesembolso.relacion_seguro;
begin
             with DmSolicitud.IBsolicitud3 do
             begin
               SQL.Clear;
               if Transaction.InTransaction then
                  Transaction.Commit;
               Transaction.StartTransaction;
               SQL.Add('insert into "col$relacionseguro"');
//               SQL.Add('("col$relacionseguro".ID_COLOCACION, "col$relacionseguro".VALOR_SEGURO, "col$relacionseguro".FECHA_COLOCACION, "col$relacionseguro".ID_AGENCIA)');
               SQL.Add('values (');
               SQL.Add(':ID_COLOCACION,:VALOR_SEGURO,:FECHA_COLOCACION,:ID_AGENCIA,:ID_PERSONA,:ID_IDENTIFICACION,:FECHA_AFILIACION,:FECHA_VENCIMIENTO,:ES_COLOCACION)');
               ParamByName('ID_COLOCACION').AsString := VidColocacion;
               ParamByName('FECHA_COLOCACION').AsDate := vfechahora;
               ParamByName('VALOR_SEGURO').AsCurrency := seguro(3);
               ParamByName('ID_AGENCIA').AsInteger := vagencia;
               ParamByName('ID_PERSONA').AsString := vidpersona;
               ParamByName('ID_IDENTIFICACION').AsInteger := VIDIDENTIFICACION;
               ParamByName('FECHA_AFILIACION').AsDate := vFechaDesembolso;
               ParamByName('FECHA_VENCIMIENTO').AsDate := StrToDate(FormatDateTime(IntToStr(YearOfDate(vFechaDesembolso)+1)+'/mm/dd',vFechaDesembolso));
               ParamByName('ES_COLOCACION').AsInteger := 1;
               Open;
               Transaction.Commit;
             end;
end;


procedure TFrmDesembolso.DBGridRealKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDesembolso.Eliminar1Click(Sender: TObject);
begin
        try
          if MessageDlg('Esta Seguro de Realizar la Transacción',mtinformation,[mbyes,mbno],0) = mryes then
             CDgarantiareal.Delete;
        except
           MessageDlg('No existen Datos para eliminar',mtWarning,[mbok],0);
        end;
end;

procedure TFrmDesembolso.Modificar1Click(Sender: TObject);
begin
        if CDgarantiarealnumero_escritura.Value <> '' then
        begin
        FrmAgregaGarantia := TFrmAgregaGarantia.Create(Self);
        with FrmAgregaGarantia do
        begin
          es_modificacion := True;
          EdEscritura.Text := CDgarantiarealnumero_escritura.Value;
          EdFechaEscritura.DateTime := CDgarantiarealfecha_escritura.Value;
          EDnotaria.Text := CDgarantiarealnombre_notaria.Value;
          EdCiudad.Text := CDgarantiarealciudad_notaria.Value;
          EdMatricula.Text := CDgarantiarealmatricula.Value;
          EdFechaRegistro.DateTime := Date;
          //EDAvaluo.Value := CDgarantiarealavaluo.CurValue;
          EdFechaAvaluo.DateTime := Date;
          EDcuentas.Value := CDgarantiarealcuentas_orden.CurValue;
          EdFechaIPoliza.Date := Date;
          EdFechaFPoliza.Date := Date;
          ShowModal;
        end;
        end;
end;

procedure TFrmDesembolso.Agregar1Click(Sender: TObject);
begin
        FrmAgregaGarantia := TFrmAgregaGarantia.Create(Self);
        with FrmAgregaGarantia do
        begin
          es_modificacion := False;
          EdFechaEscritura.Date := Date;
          EdFechaRegistro.Date := Date;
          EdFechaAvaluo.Date := Date;
          EdFechaIPoliza.Date := Date;
          EdFechaFPoliza.Date := Date;
          ShowModal;
        end;

end;

function TFrmDesembolso.recupera_saldo(codigo, estado: Integer;
  tipo: string): Currency;
begin
        with IBSQL5 do
        begin
          Close;
          SQL.Clear;
        try
          if tipo = 'D' then
             SQL.Add('select sum(DEBITO) as SALDO from "col$concol"')
          else
              SQL.Add('select sum(CREDITO) as SALDO from "col$concol"');
          SQL.Add('where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION") AND (CODIGO = :CODIGO)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := VidColocacion;
          ParamByName('CODIGO').AsString := recupera_codigo(codigo);
          ExecQuery;
          Result := FieldByName('SALDO').AsCurrency;
        except
          Result := 0;
        end;
      end;
end;

function TFrmDesembolso.verifica_fianza: boolean;
var     dias :Integer;
        id_persona :string;
begin
        Result := False;
        if IBTransaction8.InTransaction then
           IBTransaction8.Commit;
        IBTransaction8.StartTransaction;
        with IBSQL6 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$codeudor".ID_PERSONA,');
          SQL.Add('"col$codeudor".ID_IDENTIFICACION');
          SQL.Add('FROM');
          SQL.Add('"col$codeudor"');
          SQL.Add('WHERE');
          SQL.Add('("col$codeudor".ID_SOLICITUD = :ID_SOLICITUD) and ');
          SQL.Add('("col$codeudor".ES_CONYUGUE = 0)');
          ParamByName('ID_SOLICITUD').AsString := DBsolicitud.Text;
          ExecQuery;
          while not Eof do
          begin
            with IBSQL7 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select "col$colocacion".ID_COLOCACION, "col$colocacion".ID_PERSONA');
              SQL.Add('from "col$colgarantias"');
              SQL.Add('inner join "col$colocacion" ON ("col$colocacion".ID_AGENCIA = "col$colgarantias".ID_AGENCIA and');
              SQL.Add('"col$colocacion".ID_COLOCACION = "col$colgarantias".ID_COLOCACION)');
              SQL.Add('inner join "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
              SQL.Add('left join "gen$persona" ON ( "col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
              SQL.Add('where "col$colgarantias".ID_PERSONA = :ID_PERSONA AND');
              SQL.Add('"col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
              SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN(7,8,5,4))');
              ParamByName('ID_PERSONA').AsString := IBSQL6.FieldByName('ID_PERSONA').AsString;
              ParamByName('ID_IDENTIFICACION').AsInteger := IBSQL6.FieldByName('ID_IDENTIFICACION').AsInteger;
              ExecQuery;
              while not Eof do
              begin
                dias := obtenerdeudahoy1(Agencia,FieldByName('ID_COLOCACION').AsString,IBSQL8).Dias;
                if (dias > 0) and (EdNumeroIdentificacion.Text <> FieldByName('ID_PERSONA').AsString)  then
                begin
                  Result := True;
                  Break;
                end;
                Next;
              end;
            end;
            if Result = True then
               Break;
           Next;
          end;
        end;

end;

procedure TFrmDesembolso.ChedadClick(Sender: TObject);
begin
        Chedad.Checked := es_mayor;
end;

procedure TFrmDesembolso.inserta_marcas;
begin
             with DmSolicitud.IBsolicitud3 do
             begin
               SQL.Clear;
               if Transaction.InTransaction then
                  Transaction.Commit;
               Transaction.StartTransaction;
               SQL.Add('insert into "col$marcas"');
               SQL.Add('values (:ID_COLOCACION,:ID_AGENCIA,:ES_VIDA_DEUDOR,:ES_REESTRUCTURADO,:ES_MAYOR)');
               ParamByName('ID_COLOCACION').AsString := VidColocacion;
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ES_VIDA_DEUDOR').AsInteger := BoolToInt(Chvdeudor.Checked);
               ParamByName('ES_REESTRUCTURADO').AsInteger := BoolToInt(Chreestructurado.Checked);
               ParamByName('ES_MAYOR').AsInteger := BoolToInt(Chedad.Checked);
               Open;
               Close;
               Transaction.Commit;
             end;
end;

procedure TFrmDesembolso.CHcredividaClick(Sender: TObject);
begin
        CHcredivida.Checked := vId_vida;
end;

procedure TFrmDesembolso.BTJudCasClick(Sender: TObject);
begin
        LimpiaInformacion;
        DBGridJudicial.Visible := True;
        DBGridJudicial.Refresh;
        Grupoinformacion.Caption := 'Descuentos de Créditos Judicial y Castigado';
end;

function TFrmDesembolso.Capitalizacion: Currency;
var
    vVecesAportes,
    vVecesAhorros,
    vPorcCredito,
    vPorcAportes,
    vPorcAhorros :Single;
    vTotalAportes:Currency;
    vMinimoCapitaliza:Currency;
    vTAportesCreditosAnt:Currency;
    vCapitalizaAcumulada : Boolean;
begin
        vVecesAportes := 0;
        vVecesAhorros := 0;
        vPorcCredito  := 0;
        vPorcAhorros := 0;
        vTAportesCreditosAnt := 0;
        vCapitalizaAcumulada := False;

        with IBSQL7 do
        begin
          SQL.Clear;
          SQL.Add('select * from "col$lineas" ');
          SQL.Add(' where ID_LINEA = :"ID_LINEA"');
          ParamByName('ID_LINEA').AsInteger := vLinea;
          ExecQuery;

          if RecordCount > 0 then
           begin
             vVecesAportes := FieldByName('VECES_APORTES').AsFloat;
             vVecesAhorros := FieldByName('VECES_AHORROS').AsFloat;
             vPorcCredito  := FieldByName('PORCENTAJE_CREDITO').AsFloat;
             vPorcAportes  := FieldByName('PORCENTAJE_APORTES').AsFloat;
             vPorcAhorros  := FieldByName('PORCENTAJE_AHORROS').AsFloat;
             vMinimoCapitaliza := FieldByName('MINIMO_CAPITALIZAR').AsCurrency;
             vCapitalizaAcumulada := IntToBoolean(FieldByName('CAPITALIZACION_ACUMULADA').AsInteger);
           end;

          vTotalAportes := BuscarAportes(vTipoId,vNumeroId);

          if vCapitalizaAcumulada then
              vTAportesCreditosAnt := VerificarAportesCreditosAnt(vTipoId,vNumeroId);

          if vCapitalizaAcumulada then
           begin
             if vVecesAportes > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso / vVecesAportes,0)
             else
             if vVecesAhorros > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso / vVecesAhorros,0);

             if vPorcCredito > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso * ( vPorcCredito / 100),0 )
             else
             if vPorcAportes > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso * ( vPorcAportes / 100),0 );
           end
          else
           begin
             if vVecesAportes > 0 then
               vDctoCapitalizacion := SimpleRoundTo(vDesembolso / vVecesAportes,0)
             else
             if vVecesAhorros > 0 then
               vDctoCapitalizacion := SimpleRoundTo(vDesembolso / vVecesAhorros,0);

             if vPorcCredito > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + (SimpleRoundTo(vDesembolso * ( vPorcCredito / 100),0 ))
             else
             if vPorcAportes > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + (SimpleRoundTo(vDesembolso * ( vPorcAportes / 100),0 ));
           end;
          vDctoCapitalizacion := vDctoCapitalizacion + vTAportesCreditosAnt;
          vDctoCapitalizacion := vTotalAportes - vDctoCapitalizacion;

          if vDctoCapitalizacion < 0 then
             vDctoCapitalizacion := Abs(vDctoCapitalizacion);

          Result := vDctoCapitalizacion;
        end;
end;

end.
