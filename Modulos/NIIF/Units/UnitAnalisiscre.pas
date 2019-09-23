unit UnitAnalisiscre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvLabel, ExtCtrls, ComCtrls, Buttons,
  JvStaticText, DB, DBClient, Grids, DBGrids, JvEdit, JvTypedEdit,
  JvCheckBox, JvRadioGroup, CheckLst, JvCheckListBox, JvHtControls,
  IBDatabase, IBCustomDataSet, IBQuery, DBCtrls, JclSysUtils, StrUtils, JvFloatEdit, JvGroupBox, DateUtils, Math,
  ImgList, FR_DSet, FR_DBSet, FR_Class, ActnList, Menus, IBSQL, UnitDmGeneral;

type
TMiGrid = class(TCustomDBGrid);
  TFrmAnalisiscre = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    JvLabel1: TJvLabel;
    MKsolicitud: TMaskEdit;
    BTbuscar: TBitBtn;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    CDcodeudores: TClientDataSet;
    DScodeudores: TDataSource;
    DBGrid1: TDBGrid;
    CDcodeudoresid_persona: TStringField;
    CDcodeudoresid_identificacion: TSmallintField;
    CDcodeudoresnombres: TStringField;
    CDcodeudoresdefinicion: TStringField;
    Panel2: TPanel;
    BTcredito: TBitBtn;
    BTfianzas: TBitBtn;
    BTdocumentos: TBitBtn;
    Ganalisis: TGroupBox;
    Label2: TLabel;
    JVingresos: TJvCurrencyEdit;
    JVdeducciones: TJvCurrencyEdit;
    JVdisponible: TJvCurrencyEdit;
    JVdispago: TJvCurrencyEdit;
    JVcuota: TJvCurrencyEdit;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvSolvencia: TJvCheckBox;
    RadioGroup1: TRadioGroup;
    Rbuena: TRadioButton;
    Rregular: TRadioButton;
    Rmala: TRadioButton;
    CDcredito: TClientDataSet;
    Resultado: TGroupBox;
    DBcolocacion: TDBGrid;
    CDcreditocolocacion: TStringField;
    CDcreditosaldo: TCurrencyField;
    CDcreditofecha: TDateField;
    CDcreditoestado: TStringField;
    DScredito: TDataSource;
    JVdocumentos: TJvHtListBox;
    Panel3: TPanel;
    BTnuevo: TBitBtn;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    JVsolicitante: TJvStaticText;
    Label3: TLabel;
    Label4: TLabel;
    numero_cuenta: TJvStaticText;
    JvStaticText2: TJvStaticText;
    IBoficina: TIBQuery;
    IBTransaction1: TIBTransaction;
    DSoficina: TDataSource;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    JVvalor: TJvCurrencyEdit;
    Label7: TLabel;
    Label6: TLabel;
    EDinversion: TEdit;
    DSgarantia: TDataSource;
    IBlinea: TIBQuery;
    IBgarantia: TIBQuery;
    IBamortiza: TIBQuery;
    Label8: TLabel;
    DSamortizacion: TDataSource;
    DSlinea: TDataSource;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    JVtasa: TJvFloatEdit;
    JvLabel6: TJvLabel;
    JVplazo: TJvIntegerEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    BitBtn4: TBitBtn;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Manalisis: TMemo;
    Mobservacion: TMemo;
    Mconcepto: TMemo;
    Mrecomendaciones: TMemo;
    BitBtn5: TBitBtn;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    Label18: TLabel;
    JVvaloraprobado: TJvCurrencyEdit;
    JVplazoaprobado: TJvIntegerEdit;
    Label19: TLabel;
    JVtasaaprobada: TJvFloatEdit2;
    BitBtn1: TBitBtn;
    Gingreso: TGroupBox;
    Gegreso: TGroupBox;
    Label20: TLabel;
    JVingreso: TJvCurrencyEdit;
    JVotroingreso: TJvCurrencyEdit;
    JVtotalingreso: TJvCurrencyEdit;
    JVarriendo: TJvCurrencyEdit;
    JVtransporte: TJvCurrencyEdit;
    JVservicios: TJvCurrencyEdit;
    JVdeudas: TJvCurrencyEdit;
    JValimentos: TJvCurrencyEdit;
    JVotrosegresos: TJvCurrencyEdit;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel15: TJvLabel;
    JVtotalegreso: TJvCurrencyEdit;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    JVcdat: TJvCurrencyEdit;
    JVjuvenil: TJvCurrencyEdit;
    JVaportes: TJvCurrencyEdit;
    Label14: TLabel;
    JVahorro: TJvCurrencyEdit;
    Label15: TLabel;
    JVcontractual: TJvCurrencyEdit;
    Label22: TLabel;
    Rsi: TRadioButton;
    Rno: TRadioButton;
    ImageList1: TImageList;
    CDcapacidad: TClientDataSet;
    CDcapacidadid_identificacion: TSmallintField;
    CDcapacidadingresos: TCurrencyField;
    CDcapacidaddeducciones: TCurrencyField;
    CDcapacidaddisponible: TCurrencyField;
    CDcapacidadvalor_cuota: TCurrencyField;
    CDcapacidaddisp_pago: TCurrencyField;
    CDcapacidadsolv_economica: TSmallintField;
    CDcapacidadid_persona: TStringField;
    BTaceptar: TBitBtn;
    BTcerrar: TBitBtn;
    BTreporte: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    CDsino: TClientDataSet;
    CDsinosi: TBooleanField;
    CDsinono: TBooleanField;
    CDcreditodeudor: TClientDataSet;
    CDfianzadeudor: TClientDataSet;
    CDcreditodeudornumero: TSmallintField;
    CDcreditodeudorcolocacion: TStringField;
    CDcreditodeudorvalor: TCurrencyField;
    CDcreditodeudorvalor_cuota: TCurrencyField;
    CDcreditodeudorsaldo: TCurrencyField;
    CDcreditodeudorid_persona: TStringField;
    CDcreditodeudorid_identificacion: TSmallintField;
    CDcreditodeudordefinicion: TStringField;
    CDcreditodeudorestado: TStringField;
    CDcodeudoresnumero: TSmallintField;
    CDfianzadeudornumero: TSmallintField;
    CDfianzadeudorcolocacion: TStringField;
    CDfianzadeudorvalor: TCurrencyField;
    CDfianzadeudorvalor_cuota: TCurrencyField;
    CDfianzadeudorsaldo: TCurrencyField;
    CDfianzadeudorid_persona: TStringField;
    CDfianzadeudorid_identificacion: TSmallintField;
    CDfianzadeudordefinicion: TStringField;
    CDfianzadeudorestado: TStringField;
    DScreditodeudor: TDataSource;
    frDBDataSet3: TfrDBDataSet;
    CDcreditodeudornombre: TStringField;
    CDfianzadeudornombre: TStringField;
    CDgeneral: TClientDataSet;
    CDgeneralnumero: TSmallintField;
    CDgeneraldefinicion: TStringField;
    frDBDataSet4: TfrDBDataSet;
    IBQuery1: TIBQuery;
    frDBDataSet5: TfrDBDataSet;
    CDrequisitos: TClientDataSet;
    CDrequisitosnumero: TSmallintField;
    CDrequisitosNo: TStringField;
    CDrequisitosDOCUMENTOS: TStringField;
    CDrequisitosEXIGIDOS: TStringField;
    CDcapacidaddefinicion: TStringField;
    frDBDataSet6: TfrDBDataSet;
    CDcapacidadexp_creditos: TStringField;
    frDBDataSet7: TfrDBDataSet;
    IBQuery2: TIBQuery;
    Panel7: TPanel;
    Label21: TLabel;
    DBente: TDBLookupComboBox;
    DSente: TDataSource;
    IBente: TIBQuery;
    Label23: TLabel;
    Label24: TLabel;
    DBinversion: TDBLookupComboBox;
    DBclasificacion: TDBLookupComboBox;
    DSinversion: TDataSource;
    DSclasificacion: TDataSource;
    IBinversion: TIBQuery;
    IBclasificacion: TIBQuery;
    CDcreditofecha_interes: TDateField;
    CDcreditocuota: TCurrencyField;
    CDcreditocriterio: TStringField;
    CDcreditoes_descuento: TBooleanField;
    CDdescuento: TClientDataSet;
    CDdescuentoid_solicitud: TStringField;
    CDdescuentoid_colocacion: TStringField;
    CDdescuentoes_descuento: TBooleanField;
    JVgarantia: TJvStaticText;
    JVpagointeres: TJvStaticText;
    JVamortizacion: TJvStaticText;
    JVlinea: TJvStaticText;
    Jvoficina: TJvStaticText;
    JVfecha: TJvStaticText;
    ActionList1: TActionList;
    PopupMenu1: TPopupMenu;
    VerInformacionGeneral1: TMenuItem;
    IBTransaction2: TIBTransaction;
    PopupMenu2: TPopupMenu;
    VerInformacinGeneral1: TMenuItem;
    CDcreditodesc_estado: TStringField;
    CDcreditodeudordesc_estado: TStringField;
    DBCheckBox1: TDBCheckBox;
    frReport1: TfrReport;
    BitBtn6: TBitBtn;
    DbFianzas: TDBGrid;
    DsFianzas: TDataSource;
    CdFianzas: TClientDataSet;
    CdFianzasid_colocacion: TStringField;
    CdFianzasid_agencia: TSmallintField;
    CdFianzasdias: TIntegerField;
    CdFianzasestado: TStringField;
    CdFianzasautoriza: TBooleanField;
    CdFianzassaldo_actual: TCurrencyField;
    IBSQL1: TIBSQL;
    IBTransaction3: TIBTransaction;
    DBCheckBox2: TDBCheckBox;
    CdFianzasid_persona: TStringField;
    CdFianzasid_identificacion: TSmallintField;
    Panel8: TPanel;
    BitBtn7: TBitBtn;
    Panel9: TPanel;
    BitBtn8: TBitBtn;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    IBTransaction4: TIBTransaction;
    IBSQL5: TIBSQL;
    CDsinobancoldex: TBooleanField;
    procedure BTbuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BTcreditoClick(Sender: TObject);
    procedure BTfianzasClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BTdocumentosClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ManalisisKeyPress(Sender: TObject; var Key: Char);
    procedure MobservacionKeyPress(Sender: TObject; var Key: Char);
    procedure MconceptoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure ManalisisExit(Sender: TObject);
    procedure MobservacionExit(Sender: TObject);
    procedure MconceptoExit(Sender: TObject);
    procedure MrecomendacionesExit(Sender: TObject);
    procedure BTnuevoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RbuenaClick(Sender: TObject);
    procedure RregularClick(Sender: TObject);
    procedure RmalaClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BTreporteClick(Sender: TObject);
    procedure BTaceptarClick(Sender: TObject);
    procedure JVdeduccionesExit(Sender: TObject);
    procedure JVdisponibleExit(Sender: TObject);
    procedure JVcuotaExit(Sender: TObject);
    procedure BTcerrarClick(Sender: TObject);
    procedure DBcolocacionDblClick(Sender: TObject);
    procedure MKsolicitudKeyPress(Sender: TObject; var Key: Char);
    procedure VerInformacionGeneral1Click(Sender: TObject);
    procedure VerInformacinGeneral1Click(Sender: TObject);
    procedure DBclasificacionExit(Sender: TObject);
    procedure JVingresosEnter(Sender: TObject);
    procedure JVdeduccionesEnter(Sender: TObject);
    procedure JVdisponibleEnter(Sender: TObject);
    procedure JVdispagoEnter(Sender: TObject);
    procedure JVcuotaEnter(Sender: TObject);
    procedure JVvaloraprobadoEnter(Sender: TObject);
    procedure JVplazoaprobadoEnter(Sender: TObject);
    procedure DBcolocacionDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBcolocacionColExit(Sender: TObject);
    procedure DBcolocacionCellClick(Column: TColumn);
    procedure DBcolocacionKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn6Click(Sender: TObject);
    procedure DbFianzasColExit(Sender: TObject);
    procedure DbFianzasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DbFianzasKeyPress(Sender: TObject; var Key: Char);
    procedure DbFianzasDblClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    id_persona :String;
    id_identificacion :Integer;
    no_cuenta :Integer;
    id_oficina :Integer;
    observacion :string;
    solv_economica: string;
    control_actualiza: boolean;
    estado_solicitud: integer;
    control_credito: boolean;
    id_linea :Integer;
    vMaxDias: integer;
    procedure cmChildKey(var msg: TWMKEY); message CM_CHILDKEY;
    procedure aportes;
    procedure limpia_campos;
    procedure limpia_general;
    procedure fianzas;
    procedure imprimir(cadena: string);
    procedure colocaciones;
    function numero_cod: integer;
    procedure llena_requisito;
    procedure datos_analisis;
    procedure actualizar;
    procedure reg_observacion(id_observacion: integer; concepto: string);
    function busca_observacion(id_observacion: integer): string;
    function extrae_credito(id_colocacion, id_solicitud: string): boolean;
    procedure CargaFianza;
    function vBuscar(vIdSolicitud, vIdColocacion: string): boolean;
    procedure GrabarFianza;
   { Private declarations }
  public
    Es_Analista :Boolean;
    SaldoBancoldex : Currency;    
  published
    procedure reporte;

    { Public declarations }
  end;

var
  FrmAnalisiscre: TFrmAnalisiscre;
  dmGeneral: TdmGeneral;
  LineaBancoldex : string;
  Bancoldex : Boolean;
  NoBancoldex :string;
  
implementation

uses UnitDmSolicitud, UnitDescObservacion, UnitDesreferencias,
  UnitImpresion, UnitMain, UnitComCreditos, UnitGlobales, UnitInformacionBancoldex,
  UnitConsultaProductos, UnitGlobalesCol, UnitdmColocacion;

{$R *.dfm}

procedure TFrmAnalisiscre.BTbuscarClick(Sender: TObject);
var     numero,estado,id_pagointeres :Integer;
        mensage :string;
begin
        control_actualiza := True;
        {Agencia := 2;
        if Agencia > 1 then
           DBente.KeyValue := 0;}
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$solicitudempleado".ID_EMPLEADO,');
          SQL.Add('"col$solicitudempleado".ENTREGADO,');
          SQL.Add('"col$solicitudempleado".NOTIFICADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitudempleado"');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudempleado".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          if RecordCount <> 0 then
          begin
            if Es_Analista then //validacion de las solcitudes
            begin
              if FieldByName('NOTIFICADO').AsInteger = 0 then
              begin
                MessageDlg('La Solicitud debe ser Notificada por el Auxiliar de Créditos',mtInformation,[mbok],0);
                Exit;
              end;
              if FieldByName('ENTREGADO').AsInteger = 0 then
              begin
                MessageDlg('La Solicitud se Encuentra en Poder de ' + FieldByName('ID_EMPLEADO').AsString, mtInformation,[mbok],0);
                Exit;
              end;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"col$solicitudanalista".ID_EMPLEADO');
              SQL.Add('FROM');
              SQL.Add('"col$solicitudanalista"');
              SQL.Add('WHERE');
              SQL.Add('("col$solicitudanalista".ID_SOLICITUD = :ID_SOLICITUD) AND');
              SQL.Add('("col$solicitudanalista".ES_VIGENTE = 1)');
              ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
              Open;
              if RecordCount > 0 then
              begin
                if FieldByName('ID_EMPLEADO').AsString <> DBAlias then
                begin
                   MessageDlg('Error, La Solicitud se Encuentra a Nombre de : ' + FieldByName('ID_EMPLEADO').AsString,mtWarning,[MBOK],0);
                   Exit;
                end;
              end;
            end
            else
            begin
              if FieldByName('NOTIFICADO').AsInteger = 0 then
              begin
                MessageDlg('La Solicitud debe ser Notificada por el Auxiliar de Créditos',mtInformation,[mbok],0);
                Exit;
              end;
              if FieldByName('ENTREGADO').AsInteger = 1 then
              begin
                MessageDlg('La Solicitud se Encuentra en la seccion de Análisis ó se Encuentra en Otro Estado', mtInformation,[mbok],0);
                Exit;
              end;
              {if FieldByName('ID_EMPLEADO').AsString <> DBAlias then
              begin
                MessageDlg('La Solicitud se Encuentra a Nombre de ' + FieldByName('ID_EMPLEADO').AsString,mtInformation,[mbok],0);
                Exit;
              end;}
            end;
          end;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"col$solicitud".ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = "col$estadosolicitud".ID_ESTADO)');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
            MKsolicitud.SetFocus;
            Exit;
          end;
          PageControl1.Enabled := True;
          estado := FieldByName('ESTADO').AsInteger;
          if estado = 13 then
             estado := 1;
          mensage := FieldByName('DESCRIPCION_ESTADO').AsString;
          Close;
        end;
        if (estado = 2) or (estado = 3) then
        begin
          control_actualiza := False;
          if MessageDlg('La solicitud ya fue Analizada, Desea Continuar',mtWarning,[mbyes,mbno],0) = mrno then
          begin
            MKsolicitud.SetFocus;
            PageControl1.Enabled := False;
            Exit;
          end;
        end;
        if estado = 9 then
        begin
          control_actualiza := False;
          if MessageDlg('La solicitud se Encuentra Aplazada, Desea Continuar',mtWarning,[mbyes,mbno],0) = mrno then
          begin
            MKsolicitud.SetFocus;
            PageControl1.Enabled := False;
            Exit;
          end;
        end;
        if (estado >= 4) and (estado <> 9) and (estado <> 14) then
        begin
         MessageDlg('La solicitud se Encuentra ' + mensage,mtInformation,[mbok],0);
         MKsolicitud.SetFocus;
         PageControl1.Enabled := False;
         Exit;
        end;
        BTaceptar.Enabled := True;
        numero := 2;
        PageControl1.ActivePageIndex := 0;
        CDcodeudores.CancelUpdates;
        JVjuvenil.Value := 0;
        JVaportes.Value := 0;
        JVahorro.Value := 0;
        JVcdat.Value := 0;
        Rno.Checked := True;
        JVcontractual.Value := 0;
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,');
          SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          //SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
          SQL.Add('"col$solicitud".OFICINA,');
          SQL.Add('"col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".VALOR_SOLICITADO,');
          SQL.Add('"col$solicitud".LINEA,');
          SQL.Add('"col$solicitud".PLAZO,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$solicitud".PAGO_INTERES,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION,');
          SQL.Add('"col$solicitud".OFICINA,');
          SQL.Add('"col$solicitud".DESTINO,');
          SQL.Add('"col$solicitud".ID_EMPLEADO,');
          SQL.Add('"col$solicitud".ENTE_APROBADOR,');
          SQL.Add('"col$solicitud".TASA_INTERES,');
          SQL.Add('"col$solicitud".PLAZO_APROBADO,');
          SQL.Add('"col$solicitud".DESCRIPCION_GARANTIA,');
          SQL.Add('"col$solicitud".NUMERO_CODEUDORES,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".ID_ANALISIS,');
          SQL.Add('"col$solicitud".EXP_CREDITOS,');
          SQL.Add('"col$solicitud".AMORTIZACION,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$respaldo" ON ("col$solicitud".RESPALDO = "col$respaldo".ID_RESPALDO)');
          SQL.Add('INNER JOIN "col$lineas" ON ("col$solicitud".LINEA = "col$lineas".ID_LINEA)');
          SQL.Add('INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA = "col$garantia".ID_GARANTIA)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$solicitud".TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = "col$estadosolicitud".ID_ESTADO)');
          SQL.Add('INNER JOIN "gen$agencia" ON ("col$solicitud".OFICINA = "gen$agencia".ID_AGENCIA),');
          SQL.Add('"col$inversion"');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          Panel1.Enabled := False;
          Jvoficina.Caption := FieldByName('DESCRIPCION_AGENCIA').AsString;
          JVfecha.Caption := FormatDateTime('yyyy/mm/dd',FieldByName('FECHA_RECEPCION').AsDateTime);
          id_oficina := FieldByName('OFICINA').AsInteger;
          id_persona := FieldByName('ID_PERSONA').AsString;
          id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          JVamortizacion.Caption := 'CADA ' + IntToStr(FieldByName('AMORTIZACION').AsInteger) + ' DIAS';
          JVgarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString;
          id_pagointeres :=  FieldByName('PAGO_INTERES').AsInteger;
          id_linea := FieldByName('LINEA').AsInteger;
          JVpagointeres.Caption := 'CADA ' + IntToStr(id_pagointeres)+ ' DIAS';
          //DBgarantia.KeyValue := FieldByName('GARANTIA').AsInteger;
          //DBamortiza.KeyValue := FieldByName('AMORTIZACION').AsInteger;
          //DBlinea.KeyValue := FieldByName('LINEA').AsInteger;
//          if id_linea = 7 then
//          begin
//            DBinversion.KeyValue := 3;
//            DBclasificacion.KeyValue := 3;
//            DBinversion.Enabled := False;
//            DBclasificacion.Enabled := False;
//          end;
          JVlinea.Caption := FieldByName('DESCRIPCION_LINEA').AsString;
          JVplazo.Value := FieldByName('PLAZO').AsInteger;
          EDinversion.Text := FieldByName('DESTINO').AsString;
          JVvalor.Value := FieldByName('VALOR_SOLICITADO').AsCurrency;
          JVvaloraprobado.Value := FieldByName('VALOR_SOLICITADO').AsCurrency;
          JVplazoaprobado.Value := FieldByName('PLAZO').AsInteger;
          {SQL.Clear;
          SQL.Add('select DESCRIPCION from "col$amortizacion"');
          SQL.Add('where ID_AMORTIZACION = :ID_AMORTIZACION');
          ParamByName('ID_AMORTIZACION').AsInteger := id_pagointeres;
          Open;}
          //JVpagointeres.Caption := FieldByName('DESCRIPCION').AsString;
          SQL.Clear;
          SQL.Add('SELECT * FROM "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          Open;
          JVsolicitante.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' '+ FieldByName('SEGUNDO_APELLIDO').AsString;
          CDcodeudores.Append;
          CDcodeudores.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
          CDcodeudores.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
          CDcodeudores.FieldValues['nombres'] := JVsolicitante.Caption;
          CDcodeudores.FieldValues['definicion'] := 'DEUDOR';
          CDcodeudores.FieldValues['numero'] := 0;
          CDcodeudores.Post;
          /// busca conyugue
          SQL.Clear;
          SQL.Add('select * from "col$codeudor"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
          //SQL.Add('and ES_CONYUGUE = 0');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          while not Eof do
          begin
            numero := FieldByName('ID_ENTRADA').AsInteger;
            with DmSolicitud.IBsolicitud2 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select PRIMER_APELLIDO,NOMBRE,SEGUNDO_APELLIDO FROM "gen$persona"');
              SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
              ParamByName('ID_PERSONA').AsString := DmSolicitud.IBSolicitud1.FieldByName('ID_PERSONA').AsString;
              ParamByName('ID_IDENTIFICACION').AsInteger := DmSolicitud.IBSolicitud1.FieldByName('ID_IDENTIFICACION').AsInteger;
              Open;
              CDcodeudores.Append;
              CDcodeudores.FieldValues['id_persona'] := DmSolicitud.IBSolicitud1.FieldByName('ID_PERSONA').AsString;
              CDcodeudores.FieldValues['id_identificacion'] := DmSolicitud.IBSolicitud1.FieldByName('ID_IDENTIFICACION').AsInteger;
              CDcodeudores.FieldValues['nombres'] := DmSolicitud.IBSolicitud2.FieldByName('NOMBRE').AsString + ' ' + DmSolicitud.IBSolicitud2.FieldByName('PRIMER_APELLIDO').AsString + ' '+ DmSolicitud.IBSolicitud2.FieldByName('SEGUNDO_APELLIDO').AsString;
              if DmSolicitud.IBSolicitud1.FieldByName('ES_CONYUGUE').AsInteger = 0 then
                 CDcodeudores.FieldValues['definicion'] := 'CODEUDOR('+IntToStr(numero) + ')'
              else
                 CDcodeudores.FieldValues['definicion'] := 'CONYUGE';
              CDcodeudores.FieldValues['numero'] := numero;
              CDcodeudores.Post;
            end;
            Next;
          end;
          CargaFianza;
          if CdFianzas.RecordCount > 0 then
             BitBtn6.Enabled := True
          else
             BitBtn6.Enabled := False;
          {/// BUSCA CONYUGUE
          SQL.Clear;
          SQL.Add('select * from "col$codeudor"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
          SQL.Add('and ES_CONYUGUE = 0');
          SQL.Add('order by ID_PERSONA');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          while not Eof do
          begin
            with DmSolicitud.IBsolicitud2 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select PRIMER_APELLIDO,NOMBRE,SEGUNDO_APELLIDO FROM "gen$persona"');
              SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
              ParamByName('ID_PERSONA').AsString := DmSolicitud.IBSolicitud1.FieldByName('ID_PERSONA').AsString;
              ParamByName('ID_IDENTIFICACION').AsInteger := DmSolicitud.IBSolicitud1.FieldByName('ID_IDENTIFICACION').AsInteger;
              Open;
              CDcodeudores.Append;
              CDcodeudores.FieldValues['id_persona'] := DmSolicitud.IBSolicitud1.FieldByName('ID_PERSONA').AsString;
              CDcodeudores.FieldValues['id_identificacion'] := DmSolicitud.IBSolicitud1.FieldByName('ID_IDENTIFICACION').AsInteger;
              CDcodeudores.FieldValues['nombres'] := DmSolicitud.IBSolicitud2.FieldByName('NOMBRE').AsString + ' ' + DmSolicitud.IBSolicitud2.FieldByName('PRIMER_APELLIDO').AsString + ' '+ DmSolicitud.IBSolicitud2.FieldByName('SEGUNDO_APELLIDO').AsString;
              if DmSolicitud.IBSolicitud1.FieldByName('ES_CONYUGUE').AsInteger = 0 then
                 CDcodeudores.FieldValues['definicion'] := 'CODEUDOR'
              else
                 CDcodeudores.FieldValues['definicion'] := 'CONYUGUE';
              CDcodeudores.FieldValues['numero'] := DmSolicitud.IBSolicitud1.FieldByName('ID_ENTRADA').AsInteger;
              CDcodeudores.Post;
            end;
            Next;
          end;}
          SQL.Clear;
          SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger := id_oficina;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          Open;
          no_cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
          numero_cuenta.Caption := '20'+IntToStr(id_oficina)+'-'+Format('%.6d',[no_cuenta]);
          SQL.Clear;
          SQL.Add('select * from "col$colocacion"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          Open;
          if RecordCount <> 0 then
             Rsi.Checked := True
          else
             Rno.Checked := True;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 2');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          observacion := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 1');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          Manalisis.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 3');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          Mobservacion.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 4');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          Mconcepto.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 5');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          Mrecomendaciones.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select TASA from "col$lineas"');
          SQL.Add('where ID_LINEA = :ID_LINEA');
          ParamByName('ID_LINEA').AsInteger := id_linea;
          Open;
          JVtasa.Value := SimpleRoundTo(FieldByName('TASA').AsFloat,-2);
          JVtasaaprobada.Value := SimpleRoundTo(FieldByName('TASA').AsFloat,-2);
          Close;
          aportes;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 27');
          Open;
          vMaxDias := FieldByName('VALOR_MINIMO').AsInteger;
          SQL.Clear;
          SQL.Add('select "col$infbancoldex".NO_BANCOLDEX,');
          SQL.Add('"col$infbancoldex".EMPLEOS_ACT,"col$infbancoldex".EMPLEOS_GENERAR,"col$infbancoldex".TIPO_SOCIEDAD,');
          SQL.Add('"col$infbancoldex".DESTINO1,"col$infbancoldex".DESTINO2,"col$infbancoldex".DESTINO3,');
          SQL.Add('"col$infbancoldex".MONTO1,"col$infbancoldex".MONTO2,"col$infbancoldex".MONTO3,');
          SQL.Add('"col$infbancoldex".GARANTIA1,"col$infbancoldex".GARANTIA2,"col$infbancoldex".GARANTIA3,');
          SQL.Add('"col$infbancoldex".VALORGAR1,"col$infbancoldex".VALORGAR2,"col$infbancoldex".VALORGAR3,');
          SQL.Add('"col$infbancoldex".TOTAL_ACTIVOS,"col$infbancoldex".FECHA_CORTE_ACTIVOS,');
          SQL.Add('"col$infbancoldex".LINEA_BANCOLDEX,"col$infbancoldex".VISITA,"col$infbancoldex".FECHA_VISITA,"col$creditosbancoldex".ID_LINEA');
          SQL.Add('from "col$infbancoldex"');
          SQL.Add('inner join "col$creditosbancoldex" on ("col$infbancoldex".LINEA_BANCOLDEX = "col$creditosbancoldex".LINEA)');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          LineaBancoldex := FieldByName('LINEA_BANCOLDEX').AsString;
          NoBancoldex := FieldByName('NO_BANCOLDEX').AsString;
          if LineaBancoldex <> '' then begin
            Bancoldex := True;
            frmInformacionBancoldex := TfrmInformacionBancoldex.Create(Self);
            frmInformacionBancoldex.CDBancoldex.CancelUpdates;
            frmInformacionBancoldex.CDDestinoB.CancelUpdates;
            frmInformacionBancoldex.CDGarantiaB.CancelUpdates;
            frmInformacionBancoldex.LineaB := FieldByName('ID_LINEA').AsInteger;
            frmInformacionBancoldex.CDBancoldex.Append;
            frmInformacionBancoldex.CDBancoldex.FieldValues['NO_BANCOLDEX'] := FieldByName('NO_BANCOLDEX').AsString;
            frmInformacionBancoldex.CDBancoldex.FieldValues['EMPLEOS_ACT'] := FieldByName('EMPLEOS_ACT').AsString;
            frmInformacionBancoldex.CDBancoldex.FieldValues['EMPLEOS_GENERAR'] := FieldByName('EMPLEOS_GENERAR').AsString;
            frmInformacionBancoldex.CDBancoldex.FieldValues['TOTAL_ACTIVOS'] := FieldByName('TOTAL_ACTIVOS').AsString;
            frmInformacionBancoldex.CDBancoldex.FieldValues['FECHA_ACTIVOS'] := FieldByName('FECHA_CORTE_ACTIVOS').AsString;
            if IBSQL3.Transaction.InTransaction then
              IBSQL3.Transaction.Rollback;
            IBSQL3.Transaction.StartTransaction;
            if FieldByName('DESTINO1').AsInteger > 0 then begin
              IBSQL3.Close;
              IBSQL3.ParamByName('CODIGO').AsInteger := FieldByName('DESTINO1').AsInteger;
              IBSQL3.ExecQuery;
              frmInformacionBancoldex.CDDestinoB.Append;
              frmInformacionBancoldex.CDDestinoB.FieldValues['NO'] := 1;
              frmInformacionBancoldex.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
              frmInformacionBancoldex.CDDestinoB.FieldValues['MONTO'] := FieldByName('MONTO1').AsCurrency;
              frmInformacionBancoldex.CDDestinoB.Post;
            end;
            if FieldByName('DESTINO2').AsInteger > 0 then begin
              IBSQL3.Close;
              IBSQL3.ParamByName('CODIGO').AsInteger := FieldByName('DESTINO2').AsInteger;
              IBSQL3.ExecQuery;
              frmInformacionBancoldex.CDDestinoB.Append;
              frmInformacionBancoldex.CDDestinoB.FieldValues['NO'] := 2;
              frmInformacionBancoldex.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
              frmInformacionBancoldex.CDDestinoB.FieldValues['MONTO'] := FieldByName('MONTO2').AsCurrency;
              frmInformacionBancoldex.CDDestinoB.Post;
            end;
            if FieldByName('DESTINO3').AsInteger > 0 then begin
              IBSQL3.Close;
              IBSQL3.ParamByName('CODIGO').AsInteger := FieldByName('DESTINO3').AsInteger;
              IBSQL3.ExecQuery;
              frmInformacionBancoldex.CDDestinoB.Append;
              frmInformacionBancoldex.CDDestinoB.FieldValues['NO'] := 3;
              frmInformacionBancoldex.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
              frmInformacionBancoldex.CDDestinoB.FieldValues['MONTO'] := FieldByName('MONTO3').AsCurrency;
              frmInformacionBancoldex.CDDestinoB.Post;
            end;
            if FieldByName('GARANTIA1').AsInteger > 0 then begin
              IBSQL4.Close;
              IBSQL4.ParamByName('CODIGO').AsInteger := FieldByName('GARANTIA1').AsInteger;
              IBSQL4.ExecQuery;
              frmInformacionBancoldex.CDGarantiaB.Append;
              frmInformacionBancoldex.CDGarantiaB.FieldValues['NO'] := 1;
              frmInformacionBancoldex.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
              frmInformacionBancoldex.CDGarantiaB.FieldValues['VALORG'] := FieldByName('VALORGAR1').AsCurrency;
              frmInformacionBancoldex.CDGarantiaB.Post;
            end;
            if FieldByName('GARANTIA2').AsInteger > 0 then begin
              IBSQL4.Close;
              IBSQL4.ParamByName('CODIGO').AsInteger := FieldByName('GARANTIA2').AsInteger;
              IBSQL4.ExecQuery;
              frmInformacionBancoldex.CDGarantiaB.Append;
              frmInformacionBancoldex.CDGarantiaB.FieldValues['NO'] := 2;
              frmInformacionBancoldex.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
              frmInformacionBancoldex.CDGarantiaB.FieldValues['VALORG'] := FieldByName('VALORGAR2').AsCurrency;
              frmInformacionBancoldex.CDGarantiaB.Post;
            end;
            if FieldByName('GARANTIA3').AsInteger > 0 then begin
              IBSQL4.Close;
              IBSQL4.ParamByName('CODIGO').AsInteger := FieldByName('GARANTIA3').AsInteger;
              IBSQL4.ExecQuery;
              frmInformacionBancoldex.CDGarantiaB.Append;
              frmInformacionBancoldex.CDGarantiaB.FieldValues['NO'] := 3;
              frmInformacionBancoldex.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
              frmInformacionBancoldex.CDGarantiaB.FieldValues['VALORG'] := FieldByName('VALORGAR3').AsCurrency;
              frmInformacionBancoldex.CDGarantiaB.Post;
            end;
            frmInformacionBancoldex.CDBancoldex.FieldValues['LINEA'] := FieldByName('LINEA_BANCOLDEX').AsString;
            frmInformacionBancoldex.CDBancoldex.FieldValues['VISITA'] := FieldByName('VISITA').AsInteger;
            frmInformacionBancoldex.CDBancoldex.FieldValues['FECHA_VISITA'] := FieldByName('FECHA_VISITA').AsDateTime;
            IBSQL5.Close;
            IBSQL5.ParamByName('TIPO').AsInteger := FieldByName('TIPO_SOCIEDAD').AsInteger;
            IBSQL5.ExecQuery;
            frmInformacionBancoldex.CDBancoldex.FieldValues['TIPO_SOCIEDAD'] := IBSQL5.FieldByName('DESCRIPCION').AsString;
            frmInformacionBancoldex.CDBancoldex.Post;

            // Saldo Bancoldex
            SQL.Clear;
            SQL.Add('select TASA_EA, MARGEN, SALDO from "col$creditosbancoldex" where linea = :Linea and id_obligacion = :obligacion');
            ParamByName('LINEA').AsString := LineaBancoldex;
            ParamByName('OBLIGACION').AsString := NoBancoldex;
            Open;
            SaldoBancoldex := FieldByName('SALDO').AsCurrency;
//            JVtasa.Value := SimpleRoundTo(BuscoTasaEfectivaMaximaDtf(fFechaActual) + FieldByName('MARGEN').AsFloat,-2);
//            JVtasaaprobada.Value := SimpleRoundTo(BuscoTasaEfectivaMaximaDtf(fFechaActual) + FieldByName('MARGEN').AsFloat,-2);
            if JVvaloraprobado.Value > SaldoBancoldex then
                MessageDlg('Verifique el Valor Aprobado Porque Supera el Saldo Bancoldex',mtWarning,[mbok],0);

            frmInformacionBancoldex.Saldo := SaldoBancoldex;
            frminformacionbancoldex.Analisis := True;
            frminformacionbancoldex.Solicitud := MKsolicitud.Text;
            frmInformacionBancoldex.NoBancoldex := NoBancoldex;
          end;

         end;
        if control_actualiza = False then
           actualizar;
        CDcodeudores.IndexFieldNames := 'numero';

end;

procedure TFrmAnalisiscre.cmChildKey(var msg: TWMKEY);
begin
if msg.CharCode = VK_RETURN then
    if not (Assigned(ActiveControl) and
           ((ActiveControl is TButton) or
            (ActiveControl is TCustomMemo)))
    then begin
      msg.Result := 1;
      keybd_event(VK_TAB, MapVirtualKey(VK_TAB,0), 0, 0);
      Keybd_event(VK_TAB, MapVirtualKey(VK_TAB,0), KEYEVENTF_KEYUP, 0);
    end;
end;

procedure TFrmAnalisiscre.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction2.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction3.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction4.DefaultDatabase := dmGeneral.IBDatabase1;
        IBente.Database := dmGeneral.IBDatabase1;
        IBoficina.Database := dmGeneral.IBDatabase1;
        IBoficina.Transaction := dmGeneral.IBTransaction1;
        IBlinea.Database := dmGeneral.IBDatabase1;
        IBlinea.Transaction := dmGeneral.IBTransaction1;
        IBgarantia.Database := dmGeneral.IBDatabase1;
        IBgarantia.Transaction := dmGeneral.IBTransaction1;
        IBente.Database := dmGeneral.IBDatabase1;
        IBinversion.Database := dmGeneral.IBDatabase1;
        IBclasificacion.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBSQL3.Database := dmGeneral.IBDatabase1;
        IBSQL4.Database := dmGeneral.IBDatabase1;
        IBSQL5.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Database := dmGeneral.IBDatabase1;



        IBoficina.Open;
        IBlinea.Open;
        IBlinea.Last;
        //IBamortiza.Open;
        //IBamortiza.Last;
        IBgarantia.Open;
        IBgarantia.Last;
        IBente.Open;
        IBente.Last;
        IBinversion.Open;
        IBinversion.Last;
        IBclasificacion.Open;
        IBclasificacion.Last;
        DmSolicitud := TDmSolicitud.Create(self);
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TFrmAnalisiscre.BTcreditoClick(Sender: TObject);
var     saldo :Currency;
begin
        control_credito := True;
        Ganalisis.Caption := 'Análisis Capacidad de Pago de '+ CDcodeudoresnombres.Value;
        CDcredito.CancelUpdates;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        DbFianzas.Visible := False;
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS "saldo",');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add(' ("col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN(7,8,5,4))');
          SQL.Add('ORDER BY');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION');
          ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('No Posee Créditos Vigentes',mtInformation,[mbok],0);
            JVingresos.SetFocus;
            Resultado.Caption := 'No se han Encontrado Datos';
            Exit;
          end;
          while not Eof do
          begin
              saldo := FieldByName('saldo').AsCurrency;
          if saldo  <> 0 then
          begin
             CDcredito.Append;
             CDcredito.FieldValues['colocacion'] := FieldByName('ID_COLOCACION').AsString;
             CDcredito.FieldValues['cuota'] := FieldByName('VALOR_CUOTA').AsCurrency;
             CDcredito.FieldValues['fecha_interes'] := FieldByName('FECHA_INTERES').AsCurrency;
             if saldo = 0 then
                CDcredito.FieldValues['saldo'] := '$0'
             else
                CDcredito.FieldValues['saldo'] := FormatCurr('$#,#',saldo);
             CDcredito.FieldValues['fecha'] := FieldByName('FECHA_CAPITAL').AsDateTime;
             CDcredito.FieldValues['estado'] := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
             CDcredito.FieldValues['desc_estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
             if CDcreditoes_descuento.ReadOnly = True then CDcreditoes_descuento.ReadOnly := False;
             if not ((CDcreditoestado.AsInteger = 2) or (CDcreditoestado.AsInteger = 3)) then
               begin
                 if extrae_credito(FieldByName('ID_COLOCACION').AsString,MKsolicitud.Text) then
                 begin
                   CDcredito.FieldValues['criterio'] := 'SI';
                   CDcredito.FieldValues['es_descuento'] := True;
                 end
                 else
                 begin
                   CDcredito.FieldValues['criterio'] := 'NO';
                   CDcredito.FieldValues['es_descuento'] := False;
                 end;
               end
             else begin
              CDcredito.FieldValues['es_descuento'] := True;
              CDcredito.FieldValues['criterio'] := 'SI';
             end;
             CDcredito.Post;
          end;
             Next;
          end;
          Resultado.Caption := 'Créditos';
          DBcolocacion.Columns[0].Width := 104;
          DBcolocacion.Columns[1].Width := 119;
          DBcolocacion.Columns[2].Width := 64;
          DBcolocacion.Columns[4].Width := 106;
          DBcolocacion.Columns[4].Visible := True;
          DBcolocacion.Columns[3].Visible := False;
          DBcolocacion.Columns[5].Visible := True;
          DBcolocacion.Columns[6].Visible := False;
          DBcolocacion.Columns[7].Visible := True;
          DBcolocacion.Columns[8].Visible := True;
          DBcolocacion.Visible := True;
          JVingresos.SetFocus;
        end;

end;

procedure TFrmAnalisiscre.BTfianzasClick(Sender: TObject);
var    saldo :Currency;
begin
        DbFianzas.Visible := False;
        control_credito := False;
        Ganalisis.Caption := 'Análisis Capacidad de Pago de '+ CDcodeudoresnombres.Value;
        CDcredito.CancelUpdates;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,"col$colocacion".ID_COLOCACION,"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
          SQL.Add('FROM');
          SQL.Add('"col$colgarantias"');
          SQL.Add('INNER JOIN "col$colocacion" ON ("col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION) AND ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$colgarantias".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN (7,8,5,4))');
          ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('No Posee Fianzas Vigentes',mtInformation,[mbok],0);
            JVingresos.SetFocus;
            Resultado.Caption := 'No se han Encontrado Datos';
            Exit;
          end;
          while not Eof do
          begin
             saldo := FieldByName('saldo').AsCurrency;
             CDcredito.Append;
             CDcredito.FieldValues['colocacion'] := FieldByName('ID_COLOCACION').AsString;
             if saldo = 0 then
                CDcredito.FieldValues['saldo'] := '$0'
             else
                CDcredito.FieldValues['saldo'] := FormatCurr('$#,#',saldo);
             CDcredito.FieldValues['fecha'] := FieldByName('FECHA_CAPITAL').AsDateTime;
             CDcredito.FieldValues['fecha_interes'] := FieldByName('FECHA_INTERES').AsDateTime;
             CDcredito.FieldValues['estado'] := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
             CDcredito.FieldValues['desc_estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
             CDcredito.Post;
             Next;
          end;
          Resultado.Caption := 'Fianzas';
          DBcolocacion.Columns[0].Width := 80;
          DBcolocacion.Columns[1].Width := 120;
          DBcolocacion.Columns[2].Width := 80;
          DBcolocacion.Columns[4].Width := 80;
          DBcolocacion.Columns[4].Visible := True;
          DBcolocacion.Columns[3].Visible := False;
          DBcolocacion.Columns[5].Visible := False;
          DBcolocacion.Columns[6].Visible := False;
          DBcolocacion.Columns[7].Visible := False;
          DBcolocacion.Visible := True;
          JVingresos.SetFocus;
          Close;
        end;

end;

procedure TFrmAnalisiscre.DBGrid1CellClick(Column: TColumn);
begin
        if CDcodeudoresdefinicion.Value <> 'CONYUGE' then
        begin
        if CDcodeudores.RecordCount <> 0 then
        begin
        Ganalisis.Caption := 'Análisis Capacidad de Pago de '+ CDcodeudoresnombres.Value;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        DbFianzas.Visible := False;
        limpia_campos;
        with CDcapacidad do
        begin
          Filter := 'id_persona ='+ CDcodeudoresid_persona.Value;
          Filtered := True;
          try
            if  not VarIsNull(FieldValues['ingresos'])  then
               JVingresos.Value := FieldValues['ingresos']
            else
               JVingresos.Value := 0;
            if not VarIsNull(FieldValues['solv_economica']) then
               JvSolvencia.Checked := IntToBool(FieldValues['solv_economica'])
            else
               JvSolvencia.Checked := false;
            if not VarIsNull(FieldValues['deducciones']) then
                JVdeducciones.Value := FieldValues['deducciones']
            else
                JVdeducciones.Value := 0;
            if not VarIsNull(FieldValues['valor_cuota']) then
               JVcuota.Value := FieldValues['valor_cuota']
            else
               JVcuota.Value := 0;
            if not VarIsNull(FieldValues['disp_pago']) then
                JVdispago.Value := FieldValues['disp_pago']
            else
                JVdispago.Value := 0;
            if not VarIsNull(FieldValues['disponible']) then
                 JVdisponible.Value := FieldValues['disponible']
            else
                 JVdisponible.Value := 0;
            if FieldValues['exp_creditos'] = 'M' then
               Rmala.Checked := true
            else if  FieldValues['exp_creditos'] = 'R' then
               Rregular.Checked := true
            else
               Rbuena.Checked := True;
          except
            Filtered := False;
          end;
          Filtered := False;
        end;
        BitBtn2.Enabled := True;
        JVingresos.SetFocus;
        end;
        end
        else
        MessageDlg('No se le Aplica Capacidad de Pago',mtInformation,[mbok],0);
end;

procedure TFrmAnalisiscre.BTdocumentosClick(Sender: TObject);
begin
        DbFianzas.Visible := False;
        Ganalisis.Caption := 'Análisis Capacidad de Pago de '+ CDcodeudoresnombres.Value;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        JVdocumentos.Clear;
        with dmsolicitud.IBSolicitud1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$requisitos".DESCRIPCION');
          SQL.Add('FROM');
          SQL.Add('"col$solicitudrequisito"');
          SQL.Add('INNER JOIN "col$requisitos" ON ("col$solicitudrequisito".ID_REQUISITO = "col$requisitos".ID_REQUISITO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudrequisito".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("col$solicitudrequisito".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("col$solicitudrequisito".ID_PERSONA = :ID_PERSONA)');
          ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('No Posee Requisitos',mtInformation,[mbok],0);
            Resultado.Caption := 'No se han Encontrado Datos';
            JVingresos.SetFocus;
            Exit;
          end;
          while not Eof do
          begin
            JVdocumentos.Items.Add('-- '+fieldByName('DESCRIPCION').AsString);
            Next;
          end;
          JVdocumentos.Visible := True;
          Resultado.Caption := 'Documentos Exigidos';
          JVingresos.SetFocus;
        end;

end;

procedure TFrmAnalisiscre.aportes;
var     saldo_inicial, saldo_actual, total_canje, total_movimiento, saldo_cdat :Currency;
        cuenta, agencia, tipo :Integer;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('Select "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
          SQL.Add('Where');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
          SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION >= 1');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id_identificacion;
          ParamByName('ID_PERSONA').AsString  := id_persona;
          ExecQuery;
          while not Eof do
          begin
            tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
//            digito_cuenta := FieldByName('DIGITO_CUENTA').AsInteger;
            agencia := FieldByName('ID_AGENCIA').AsInteger;
            total_movimiento := 0;
            saldo_inicial := 0;
            saldo_actual := 0;
            total_canje := 0;
            saldo_cdat := 0;
            with DmSolicitud.IBSQL2 do
            begin
              Close;
//              if Transaction.InTransaction then
//                 Transaction.Commit;
//              Transaction.StartTransaction;
              if tipo = 6 then
              begin
                SQL.Clear;
                SQL.Add('SELECT DISTINCT');
                SQL.Add('"cap$maestro".VALOR_INICIAL');
                SQL.Add('FROM');
                SQL.Add('"cap$maestro"');
                SQL.Add('WHERE');
                SQL.Add('("cap$maestro".ID_AGENCIA = :ID_AGENCIA) AND');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = :TIPO)AND');
                SQL.Add('("cap$maestro".ID_ESTADO IN (1,6))');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('TIPO').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
                ExecQuery;
                if RecordCount <> 0 then
                   Saldo_cdat := FieldByName('VALOR_INICIAL').AsCurrency;
                Close;
              end
              else
              begin
              SQL.Clear;
              SQL.Add('Select "cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestro"');
              SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestro".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND ');
              SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ');
              SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
              SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              SQL.Add('Where');
              SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
              SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
              SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
              SQL.Add('"cap$maestro".ID_ESTADO in (1,6) and');
              SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
              ParamByName('ID_AGENCIA').AsInteger := agencia;
              ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
              ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
              ParamByName('ANO').AsString := IntToStr(YearOf(Date));
              ExecQuery;
              if RecordCount > 0 then
                 Saldo_Inicial := FieldByName('SALDO_INICIAL').AsCurrency;
              Close;
              SQL.Clear;
              SQL.Add('SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS SUMA from "cap$maestro"');
              SQL.Add('LEFT JOIN "cap$extracto" ON ("cap$maestro".ID_AGENCIA = "cap$extracto".ID_AGENCIA) AND ');
              SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$extracto".ID_TIPO_CAPTACION) AND ');
              SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$extracto".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$extracto".DIGITO_CUENTA)');
              SQL.Add('Where');
              SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
              SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
              SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
              SQL.Add('"cap$maestro".ID_ESTADO in (1,6) and');
              SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
              ParamByName('ID_AGENCIA').AsInteger := agencia;
              ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
              ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
              ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
              ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
              ExecQuery;
              if RecordCount > 0 then
                 Saldo_Actual := FieldByName('SUMA').AsCurrency;
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
             SQL.Add('"cap$maestro".ID_ESTADO = 1 and');
             SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
             SQL.Add('"cap$canje".LIBERADO = 0 and');
             SQL.Add('"cap$canje".DEVUELTO = 0');
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
             ExecQuery;
             if RecordCount > 0 then
                total_canje := FieldByName('CANJE').AsCurrency;
             end;
             total_movimiento := Saldo_Actual + saldo_inicial + total_canje;
             end;
          if tipo = 1 then
             JVaportes.Value := JVaportes.Value + total_movimiento
          else if tipo = 2 then
             JVahorro.Value := JVahorro.Value + total_movimiento
          else if tipo = 5 then
            JVcontractual.Value := JVcontractual.Value + total_movimiento
          else if tipo = 4 then
            JVjuvenil.Value := JVjuvenil.Value + total_movimiento
          else if tipo = 6 then
            JVcdat.Value := JVcdat.Value + saldo_cdat;;
            Next;
          end;
        end;
end;

procedure TFrmAnalisiscre.BitBtn4Click(Sender: TObject);
begin
        FrmDescObsrevacion := TFrmDescObsrevacion.Create(self);
        FrmDescObsrevacion.Caption := 'Concepto Entrevista';
        if observacion = '' then
        begin
           MessageDlg('No Existe Ninguna Obsevacion Asociada a Esta Solicitud',mtInformation,[mbok],0);
           Exit;
        end;
        FrmDescObsrevacion.Mobservacion.Text := observacion;
        FrmDescObsrevacion.ShowModal;
end;

procedure TFrmAnalisiscre.ManalisisKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mobservacion.SetFocus
end;

procedure TFrmAnalisiscre.MobservacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mconcepto.SetFocus
end;

procedure TFrmAnalisiscre.MconceptoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mrecomendaciones.SetFocus
end;

procedure TFrmAnalisiscre.BitBtn5Click(Sender: TObject);
begin
        FrmReferencias := TFrmReferencias.Create(self);
        FrmReferencias.ClientDataSet1.CancelUpdates;
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('"gen$tiposreferencia".DESCRIPCION_REFERENCIA,');
          SQL.Add('"gen$tiposparentesco".DESCRIPCION_PARENTESCO,');
          SQL.Add('"col$referencias".PRIMER_APELLIDO_REFERENCIA,');
          SQL.Add('"col$referencias".SEGUNDO_APELLIDO_REFERENCIA,');
          SQL.Add('"col$referencias".NOMBRE_REFERENCIA,');
          SQL.Add('"col$referencias".DIRECCION_REFERENCIA,');
          SQL.Add('"col$referencias".TELEFONO_REFERENCIA');
          SQL.Add('FROM');
          SQL.Add('"col$referencias"');
          SQL.Add('INNER JOIN "col$referenciasolicitud" ON ("col$referencias".ID_ENTRADA = "col$referenciasolicitud".ID_ENTRADA)');
          SQL.Add('INNER JOIN "gen$tiposreferencia" ON ("col$referencias".TIPO_REFERENCIA = "gen$tiposreferencia".ID_REFERENCIA)');
          SQL.Add(' INNER JOIN "gen$tiposparentesco" ON ("col$referencias".PARENTESCO_REFERENCIA = "gen$tiposparentesco".ID_PARENTESCO)');
          SQL.Add('WHERE');
          SQL.Add('("col$referenciasolicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          while not Eof do
          begin
            FrmReferencias.ClientDataSet1.Append;
            FrmReferencias.ClientDataSet1.FieldValues['nombre'] := fieldbyname('NOMBRE_REFERENCIA').AsString + ' ' + fieldbyname('PRIMER_APELLIDO_REFERENCIA').AsString + ' ' +fieldbyname('SEGUNDO_APELLIDO_REFERENCIA').AsString;
            FrmReferencias.ClientDataSet1.FieldValues['telefono'] := fieldbyname('TELEFONO_REFERENCIA').AsString;
            FrmReferencias.ClientDataSet1.FieldValues['direccion'] := fieldbyname('DIRECCION_REFERENCIA').AsString;
            FrmReferencias.ClientDataSet1.FieldValues['parentesco'] := fieldbyname('DESCRIPCION_PARENTESCO').AsString;
            FrmReferencias.ClientDataSet1.FieldValues['tipo_referencia'] := fieldbyname('DESCRIPCION_REFERENCIA').AsString;
            FrmReferencias.ClientDataSet1.post;
            Next;
          end;
        end;
        FrmReferencias.ShowModal;
end;

procedure TFrmAnalisiscre.ManalisisExit(Sender: TObject);
begin
        Manalisis.Text := UpperCase(Manalisis.Text);
end;

procedure TFrmAnalisiscre.MobservacionExit(Sender: TObject);
begin
        Mobservacion.Text := UpperCase(Mobservacion.Text)
end;

procedure TFrmAnalisiscre.MconceptoExit(Sender: TObject);
begin
        Mconcepto.Text := UpperCase(Mconcepto.Text)
end;

procedure TFrmAnalisiscre.MrecomendacionesExit(Sender: TObject);
begin
        Mrecomendaciones.Text := UpperCase(Mrecomendaciones.Text)
end;

procedure TFrmAnalisiscre.limpia_campos;
begin
        JVingresos.Value := 0;
        JVdeducciones.Value := 0;
        JVdisponible.Value := 0;
        JVdispago.Value := 0;
        //JVcuota.Value := 0;
        JvSolvencia.Checked := False;
        solv_economica := 'BUENA';
        Rbuena.Checked := True;
end;

procedure TFrmAnalisiscre.limpia_general;
begin
        Manalisis.Text := '';
        Mconcepto.Text := '';
        Mrecomendaciones.Text := '';
        Mobservacion.Text := '';
        CDcodeudores.CancelUpdates;
        JVaportes.Value := 0;
        JVahorro.Value := 0;
        JVcdat.Value := 0;
        JVjuvenil.Value := 0;
        JVcontractual.Value := 0;
        Rno.Checked := True;
        observacion := '';
        Panel1.Enabled := True;
        MKsolicitud.Text := '';
        JVsolicitante.Caption := '';
        MKsolicitud.SetFocus;
        Ganalisis.Caption := 'Análisis Capacidad de Pago';
        numero_cuenta.Caption := '';
        JVvalor.Value := 0;
        EDinversion.Text := '';
        JVplazo.Value := 0;
        JVtasa.Value := 0;
        JVcuota.Value := 0;
        BTreporte.Enabled := False;
        BTaceptar.Enabled := False;
        PageControl1.ActivePageIndex := 0;
        DbFianzas.Visible := False;
        Bancoldex := False;
end;

procedure TFrmAnalisiscre.BTnuevoClick(Sender: TObject);
begin
        TabSheet1.Enabled := True;
        TabSheet2.Enabled := true;
        TabSheet3.Enabled := true;
        DBinversion.Enabled := True;
        DBclasificacion.Enabled := True;
        PageControl1.Enabled := False;
        CdFianzas.CancelUpdates;
        CDcapacidad.CancelUpdates;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        DBcolocacion.Visible := False;
        limpia_campos;
        limpia_general;
end;

procedure TFrmAnalisiscre.BitBtn1Click(Sender: TObject);
begin
        DbFianzas.Visible := False;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := True;
        Gegreso.Visible := True;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$persona".INGRESOS_A_PRINCIPAL,');
          SQL.Add('"gen$persona".INGRESOS_OTROS,');
          SQL.Add('"gen$persona".EGRESOS_ALQUILER,');
          SQL.Add('"gen$persona".EGRESOS_SERVICIOS,');
          SQL.Add('"gen$persona".EGRESOS_TRANSPORTE,');
          SQL.Add('"gen$persona".EGRESOS_ALIMENTACION,');
          SQL.Add('"gen$persona".EGRESOS_DEUDAS,');
          SQL.Add('"gen$persona".EGRESOS_OTROS');
          SQL.Add('FROM');
          SQL.Add('"gen$persona"');
          SQL.Add('WHERE');
          SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA)');
          ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          ExecQuery;
          JVingreso.Value := FieldByName('INGRESOS_A_PRINCIPAL').AsCurrency;
          JVotroingreso.Value := FieldByName('INGRESOS_OTROS').AsCurrency;
          JVtotalingreso.Value := JVingreso.Value + JVotroingreso.Value;
          JVarriendo.Value := FieldByName('EGRESOS_ALQUILER').AsCurrency;
          JVtransporte.Value := FieldByName('EGRESOS_TRANSPORTE').AsCurrency;
          JVservicios.Value := FieldByName('EGRESOS_SERVICIOS').AsCurrency;
          JValimentos.Value := FieldByName('EGRESOS_ALIMENTACION').AsCurrency;
          JVdeudas.Value := FieldByName('EGRESOS_DEUDAS').AsCurrency;
          JVotrosegresos.Value := FieldByName('EGRESOS_OTROS').AsCurrency;
          JVtotalegreso.Value := JVarriendo.Value + JVtransporte.Value + JVservicios.Value + JValimentos.Value + JVdeudas.Value + JVotrosegresos.Value;
          Close;
        end;
        JVingresos.SetFocus;
end;

procedure TFrmAnalisiscre.BitBtn2Click(Sender: TObject);
begin
        with CDcapacidad do
        begin
          Filter := 'id_persona ='+ CDcodeudoresid_persona.Value;
          Filtered := True;
          try
            if CDcapacidad.RecordCount > 0 then
            Delete;
          except
            Filtered := False;
          end;
          Filtered := False;
          Append;
          FieldValues['id_persona'] := CDcodeudoresid_persona.Value;
          FieldValues['id_identificacion'] := CDcodeudoresid_identificacion.Value;
          FieldValues['ingresos'] := JVingresos.Value;
          FieldValues['deducciones'] := JVdeducciones.Value;
          FieldValues['disponible'] := JVdisponible.Value;
          FieldValues['valor_cuota'] := JVcuota.Value;
          FieldValues['disp_pago'] := JVdispago.Value;
          FieldValues['solv_economica'] := BoolToInt(JvSolvencia.Checked);
          FieldValues['exp_creditos'] := solv_economica;
          //ShowMessage(CDcodeudoresdefinicion.Value);
          FieldValues['definicion'] := CDcodeudoresdefinicion.Value;
          Post;
        end;
        limpia_campos;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        BitBtn2.Enabled := False;
end;

procedure TFrmAnalisiscre.RbuenaClick(Sender: TObject);
begin
        solv_economica := 'BUENA';
end;

procedure TFrmAnalisiscre.RregularClick(Sender: TObject);
begin
        solv_economica := 'REGULAR';
end;

procedure TFrmAnalisiscre.RmalaClick(Sender: TObject);
begin
        solv_economica := 'MALA';
end;

procedure TFrmAnalisiscre.BitBtn3Click(Sender: TObject);
begin
        limpia_campos;
end;

procedure TFrmAnalisiscre.fianzas;
begin
        CDfianzadeudor.CancelUpdates;
        if DmSolicitud.IBSQL1.Transaction.InTransaction then
           DmSolicitud.IBSQL1.Transaction.Commit;
        DmSolicitud.IBSQL1.Transaction.StartTransaction;
        with CDcodeudores do
        begin
          First;
          while not Eof do
          begin
            with DmSolicitud.IBSQL1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_INTERES,');
              SQL.Add('"col$colocacion".ID_COLOCACION,');
              SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
              SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
              SQL.Add('"col$colocacion".VALOR_CUOTA');
              SQL.Add('FROM');
              SQL.Add('"col$colgarantias"');
              SQL.Add('INNER JOIN "col$colocacion" ON ("col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION) AND ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA)');
              SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
              SQL.Add('WHERE');
              SQL.Add('("col$colgarantias".ID_PERSONA = :ID_PERSONA) AND');
              SQL.Add('("col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
              SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN (7,8,5,4))');
              ParamByName('ID_PERSONA').AsString := CDcodeudores.FieldValues['id_persona'];
              ParamByName('ID_IDENTIFICACION').AsString := CDcodeudores.FieldValues['id_identificacion'];
              ExecQuery;
              while not Eof do
              begin
                  try
                    CDgeneral.Append;
                    CDgeneral.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                    if FieldValues['definicion'] = 'CODEUDOR' then
                       CDgeneral.FieldValues['definicion'] := 'CODEUDOR('+IntToStr(CDcodeudores.FieldValues['numero']) + ')'// + '( '+ IntToStr(FieldValues['numero'] - numero_cod)+' ) '
                    else
                       CDgeneral.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'];
                    CDgeneral.Post;
                  except
                    CDgeneral.Cancel;
                  end;
                  CDfianzadeudor.Append;
                  CDfianzadeudor.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                  CDfianzadeudor.FieldValues['colocacion'] := FieldByName('ID_COLOCACION').AsString;
                  CDfianzadeudor.FieldValues['valor'] := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                  CDfianzadeudor.FieldValues['valor_cuota'] := FieldByName('VALOR_CUOTA').AsCurrency;
                  CDfianzadeudor.FieldValues['saldo'] := FieldByName('saldo').AsCurrency;
                  CDfianzadeudor.FieldValues['id_persona'] := CDcodeudores.FieldValues['id_persona'];
                  CDfianzadeudor.FieldValues['id_identificacion'] := CDcodeudores.FieldValues['id_identificacion'];
                  CDfianzadeudor.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'];
                  CDfianzadeudor.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                  CDfianzadeudor.FieldValues['nombre'] := CDcodeudores.FieldValues['nombres'];
                  CDfianzadeudor.post;
               Next;
              end;
            end; // end ibsql1
            Next;
          end;
        end;

end;

procedure TFrmAnalisiscre.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'empresa' then
           ParValue := Empresa;
        if ParName = 'no_cuenta' then
           ParValue := numero_cuenta.Caption;
        if ParName = 'radicado' then
           ParValue := MKsolicitud.Text;
        if ParName = 'nombre' then
           ParValue := JVsolicitante.Caption;
        if ParName = 'fecha_rep' then
           ParValue := JVfecha.Caption;
        if ParName = 'garantia' then
           ParValue := JVgarantia.Caption;
        if ParName = 'v_solicitado' then
           ParValue := JVvalor.Value;
        if ParName = 'linea' then
           ParValue := JVlinea.Caption;
        if ParName = 'plazo' then
           ParValue := JVplazo.Value;
        if ParName = 'tasa' then
           ParValue := define_tasa(id_linea,JVtasa.Value);
        if ParName = 'ahorros' then
           ParValue := JVahorro.Value;
        if ParName = 'contractual' then
           ParValue := JVcontractual.Value;
        if ParName = 'juvenil' then
           ParValue := JVjuvenil.Value;
        if ParName = 'aportes' then
           ParValue := JVaportes.Value;
        if ParName = 'amortizacion' then
           ParValue := JVamortizacion.Caption;
        if ParName = 'p_interes' then
           ParValue := JVpagointeres.Caption;
        if ParName = 'cdat' then
           ParValue := JVcdat.Value;
        if ParName = 'inversion' then
           ParValue := DBinversion.Text;
        if ParName = 'empleado' then
           ParValue := extrae_empleado;
        if ParName = 'Bancoldex' then
           ParValue := Bancoldex;                {
        if ParName = '' then
           ParValue := ;
        if ParName = '' then
           ParValue := ; }
end;

procedure TFrmAnalisiscre.imprimir(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        //frCompositeReport1.DoublePass := True;
        //frCompositeReport1.Reports.Clear;
        //frCompositeReport1.Reports.Add(frReport1);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmAnalisiscre.BTreporteClick(Sender: TObject);
begin
//        CDcapacidad.IndexFieldNames := 'numero';
        reporte;
        imprimir(frmMain.wpath+ 'reporte\RepAnalisis.frf');
end;

procedure TFrmAnalisiscre.reporte;
begin
        if DmSolicitud.IBSQL2.Transaction.InTransaction then
           DmSolicitud.IBSQL2.Transaction.Commit;
        DmSolicitud.IBSQL2.Transaction.StartTransaction;
        CDgeneral.CancelUpdates;
        CDsino.CancelUpdates;
        CDsino.Append;
        CDsino.FieldValues['si'] := Rsi.Checked;
        CDsino.FieldValues['no'] := Rno.Checked;
        if LineaBancoldex <> '' then
          CDsino.FieldValues['bancoldex'] := True
        else
          CDsino.FieldValues['bancoldex'] := False;
        CDsino.Post;
        colocaciones;
        fianzas;
        llena_requisito;
        IBQuery2.Close;
        if IBQuery2.Transaction.InTransaction then
           IBQuery2.Transaction.Commit;
        IBQuery2.Transaction.StartTransaction;
        IBQuery2.ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
        IBQuery2.Open;

end;

procedure TFrmAnalisiscre.colocaciones;
var     numero_codeudor :Smallint;
begin
        CDcreditodeudor.CancelUpdates;
        if DmSolicitud.IBSQL1.Transaction.InTransaction then
           DmSolicitud.IBSQL1.Transaction.Commit;
        DmSolicitud.IBSQL1.Transaction.StartTransaction;
        with CDcodeudores do
        begin
          First;
          while not Eof do
          begin
            with DmSolicitud.IBSQL1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT DISTINCT');
              SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS "saldo",');
              SQL.Add('"col$colocacion".ID_COLOCACION,"col$colocacion".ID_ESTADO_COLOCACION,');
              SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
              SQL.Add('"col$colocacion".VALOR_CUOTA,');
              SQL.Add('"col$colocacion".VALOR_DESEMBOLSO');
              SQL.Add('FROM');
              SQL.Add('"col$colocacion"');
              SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
              SQL.Add('WHERE');
              SQL.Add('("col$colocacion".ID_PERSONA = :ID_PERSONA) AND');
              SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN (7,8,5,4)) AND');
              SQL.Add('("col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION)');
              SQL.Add('ORDER BY');
              SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION');
              ParamByName('ID_PERSONA').AsString := CDcodeudores.FieldValues['id_persona'];
              ParamByName('ID_IDENTIFICACION').AsString := CDcodeudores.FieldValues['id_identificacion'];
              ExecQuery;
              while not Eof do
              begin
                if FieldByName('saldo').AsCurrency <> 0 then
                begin
                  try
                    CDgeneral.Append;
                    CDgeneral.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                    if FieldValues['definicion'] = 'CODEUDOR' then
                       CDgeneral.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'] + '( '+ IntToStr(FieldValues['numero'] - numero_cod)+' ) '
                    else
                       CDgeneral.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'];
                    CDgeneral.Post;
                  except
                    CDgeneral.Cancel;
                    end;
                  CDcreditodeudor.Append;
                  CDcreditodeudor.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                  CDcreditodeudor.FieldValues['colocacion'] := FieldByName('ID_COLOCACION').AsString;
                  CDcreditodeudor.FieldValues['valor'] := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                  CDcreditodeudor.FieldValues['valor_cuota'] := FieldByName('VALOR_CUOTA').AsCurrency;
                  CDcreditodeudor.FieldValues['saldo'] := FieldByName('saldo').AsCurrency;
                  CDcreditodeudor.FieldValues['id_persona'] := CDcodeudores.FieldValues['id_persona'];
                  CDcreditodeudor.FieldValues['id_identificacion'] := CDcodeudores.FieldValues['id_identificacion'];
                  if FieldValues['definicion'] = 'CODEUDOR' then
                     CDcreditodeudor.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'] + '( '+ IntToStr(numero_codeudor)+' ) '
                  else
                     CDcreditodeudor.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'];
                  CDcreditodeudor.FieldValues['estado'] := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                  CDcreditodeudor.FieldValues['desc_estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                  CDcreditodeudor.FieldValues['nombre'] := CDcodeudores.FieldValues['nombres'];
                  CDcreditodeudor.post;
            end;
               Next;

              end;
            end; // end ibsql1

            Next;
          end;
        end;
end;

function TFrmAnalisiscre.numero_cod: integer;
begin
        with DmSolicitud.IBSQL2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('"col$codeudor".ES_CONYUGUE');
          SQL.Add('FROM');
          SQL.Add('"col$codeudor"');
          SQL.Add('WHERE');
          SQL.Add('("col$codeudor".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("col$codeudor".ES_CONYUGUE = -1)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ExecQuery;
          if FieldByName('ES_CONYUGUE').AsInteger = -1 then
             Result := 2
          else
             Result := 1;
        end;
end;

procedure TFrmAnalisiscre.llena_requisito;
begin
        CDrequisitos.CancelUpdates;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          while not Eof do
          begin
            CDcodeudores.Last;
            CDcodeudores.First;
            while not CDcodeudores.Eof do
            begin
              if CDcodeudores.FieldValues['id_persona'] = FieldByName('ID_PERSONA').AsString then
              begin
                 if CDcodeudores.FieldValues['definicion'] <> 'CONYUGUE' then
                 begin
                 CDrequisitos.Append;
                 CDrequisitos.FieldValues['EXIGIDOS'] := FieldByName('DESCRIPCION').AsString;
                 CDrequisitos.FieldValues['DOCUMENTOS'] := 'X';
                 if CDcodeudores.FieldValues['definicion'] <> 'DEUDOR' then
                 begin
                    CDrequisitos.FieldValues['No'] := 'Cod' +inttostr(CDcodeudores.FieldValues['numero']);// - numero_cod);//'COD' + '( '+ IntToStr(CDcodeudores.FieldValues['numero'] - numero_cod)+' ) '
                    CDrequisitos.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                 end
                 else if CDcodeudores.FieldValues['definicion'] = 'DEUDOR' then
                 begin
                    CDrequisitos.FieldValues['No'] := 'Deud';
                    CDrequisitos.FieldValues['numero'] := 0;
                 end;
                 CDrequisitos.Post;
              end;
              end;
              CDcodeudores.Next;
            end;
            Next;
          end;
        end;
        CDrequisitos.IndexFieldNames := 'numero';
end;

procedure TFrmAnalisiscre.datos_analisis;
var     tasa,ingresos,disponible,deducciones,valor_cuota,disponibilidad :Currency;
        exp_creditos, entrevisto :string;
        solv_economica :Smallint;
begin
        solv_economica := 0;
        entrevisto := extrae_empleado + ' Con Fecha: ' + FormatDateTime('yyyy/mm/dd hh:mm',fFechaActual + Time);
        if JVtasaaprobada.Value <> 0 then
           tasa := JVtasa.Value
        else
           tasa := JVtasaaprobada.Value;
        try
        with CDcapacidad do
        begin
          First;
          while not Eof do
          begin
            if FieldValues['definicion'] = 'DEUDOR' then
            begin
              ingresos := CDcapacidad.FieldValues['ingresos'];
              disponible := CDcapacidad.FieldValues['disponible'];
              deducciones := CDcapacidad.FieldValues['deducciones'];
              valor_cuota := CDcapacidad.FieldValues['valor_cuota'];
              disponibilidad := CDcapacidad.FieldValues['disp_pago'];
              exp_creditos := CDcapacidad.FieldValues['exp_creditos'];
              solv_economica := CDcapacidad.FieldValues['solv_economica'];
            end
            else //if LeftStr(FieldValues['definicion'],8) = 'CODEUDOR' then
            begin
              with DmSolicitud.IBsolicitud1 do
              begin
                Close;
                if Transaction.InTransaction then
                   Transaction.Commit;
                Transaction.StartTransaction;
                SQL.Clear;
                SQL.Add('update "col$codeudor"  set "col$codeudor".DISPONIBLE = :DISPONIBLE,"col$codeudor".DEDUCCIONES = :DEDUCCIONES,');
                SQL.Add('"col$codeudor".VALOR_CUOTA = :VALOR_CUOTA,"col$codeudor".DISP_PAGO = :DISP_PAGO,"col$codeudor".SOLV_ECONOMICA = :SOLV_ECONOMICA,');
                SQL.Add('"col$codeudor".EXP_CREDITOS = :EXP_CREDITOS,"col$codeudor".INGRESOS = :INGRESOS');
                SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
                ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
                ParamByName('ID_PERSONA').AsString := CDcapacidad.FieldValues['id_persona'];
                ParamByName('ID_IDENTIFICACION').AsSmallInt := CDcapacidad.FieldValues['id_identificacion'];
                ParamByName('DISPONIBLE').AsCurrency := CDcapacidad.FieldValues['disponible'];
                ParamByName('DEDUCCIONES').AsCurrency := CDcapacidad.FieldValues['deducciones'];
                ParamByName('VALOR_CUOTA').AsCurrency := CDcapacidad.FieldValues['valor_cuota'];
                ParamByName('INGRESOS').AsCurrency := CDcapacidad.FieldValues['ingresos'];
                ParamByName('DISP_PAGO').AsCurrency := CDcapacidad.FieldValues['disp_pago'];
                ParamByName('SOLV_ECONOMICA').AsSmallInt := CDcapacidad.FieldValues['solv_economica'];
                ParamByName('EXP_CREDITOS').AsString := CDcapacidad.FieldValues['exp_creditos'];
                ExecSQL;
                Close;
                Transaction.Commit;
              end;
            end;
            Next;
          end;
          GrabarFianza;
        end;
        except
        on E: Exception do
        begin
        MessageDlg('Error al Grabar los Datos' + #13 + E.Message,mtError,[mbok],0);
        Exit;
        end;
        end;
        if ingresos <> -1 then begin
          with DmSolicitud.IBSolicitud1 do
          begin
            Close;
            IF Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('update "col$solicitud" set "col$solicitud".TASA_INTERES = :TASA_INTERES,');
            SQL.Add('"col$solicitud".ID_ANALISIS = :ID_ANALISIS,"col$solicitud".INGRESOS = :INGRESOS,');
            SQL.Add('"col$solicitud".DISPONIBLE = :DISPONIBLE,"col$solicitud".DEDUCCIONES = :DEDUCCIONES,"col$solicitud".VALOR_CUOTA = :VALOR_CUOTA,');
            SQL.Add('"col$solicitud".DISPONIBILIDAD = :DISPONIBILIDAD,"col$solicitud".SOLV_ECONOMICA = :SOLV_ECONOMICA,"col$solicitud".EXP_CREDITOS = :EXP_CREDITOS,"col$solicitud".PLAZO_APROBADO = :PLAZO_APROBADO,"col$solicitud".ESTADO = :ESTADO,');
            SQL.Add('"col$solicitud".INVERSION = :INVERSION, "col$solicitud".CLASIFICACION = :CLASIFICACION, "col$solicitud".FECHA_ANALISIS = :FECHA_ANALISIS,"col$solicitud".VALOR_APROBADO = :VALOR_APROBADO');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            ParamByName('TASA_INTERES').AsFloat := tasa;
            ParamByName('VALOR_APROBADO').AsCurrency := JVvaloraprobado.Value;
            ParamByName('PLAZO_APROBADO').AsCurrency := JVplazoaprobado.Value;
            ParamByName('ID_ANALISIS').AsString := DBAlias;
            ParamByName('INGRESOS').AsCurrency := ingresos;
            ParamByName('DISPONIBLE').AsCurrency := disponible;
            ParamByName('DEDUCCIONES').AsCurrency := deducciones;
            ParamByName('VALOR_CUOTA').AsCurrency := valor_cuota;
            ParamByName('DISPONIBILIDAD').AsCurrency := disponibilidad;
            ParamByName('SOLV_ECONOMICA').AsSmallInt := solv_economica;
            ParamByName('EXP_CREDITOS').AsString := exp_creditos;
            ParamByName('ESTADO').AsInteger := estado_solicitud;
            ParamByName('INVERSION').AsInteger := DBinversion.KeyValue;
            ParamByName('CLASIFICACION').AsInteger := DBclasificacion.KeyValue;
            ParamByName('FECHA_ANALISIS').AsDate := Date;
            ExecSQL;
            Close;
            if Es_Analista then
            begin
              SQL.Clear;
              SQL.Add('update "col$solicitudanalista" set ESTUDIADA = 1,PENDIENTE = 0 where ID_SOLICITUD = :ID_SOLICITUD AND');
              SQL.Add('ES_VIGENTE = 1');
              ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            end
            else
            begin
              SQL.Clear;
              SQL.Add('delete from "col$solicitudanalista" where ID_SOLICITUD = :ID_SOLICITUD and ES_VIGENTE = 1');
              ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
              ExecSQL;
              Transaction.CommitRetaining;
              SQL.Clear;
              SQL.Add('insert into "col$solicitudanalista" values (1,:ID_SOLICITUD,:ID_EMPLEADO,:FECHAHORA,1,NULL,1,0)');
              ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
              ParamByName('ID_EMPLEADO').AsString := DBAlias;
              ParamByName('FECHAHORA').AsDateTime := fFechaActual + Time;
            end;
            try
              ExecSQL;
            except
              Transaction.RollbackRetaining;
            end;
            Transaction.Commit;
            end;
            reg_observacion(1,Manalisis.Text);
              if Mobservacion.Text  = '' then
                 Mobservacion.Text := 'NINGUNA';
              if not control_actualiza then
                 reg_observacion(3,Mobservacion.Text + '     ' + 'REALIZO ' + entrevisto)
              else
                 reg_observacion(3,Mobservacion.Text + '     ' + 'REALIZO ' + entrevisto);// OJO CAMBIAR EN EL MODULO
              if Mconcepto.Text = '' then
                 Mconcepto.Text := 'NINGUNA';
            reg_observacion(4,Mconcepto.Text);
              if Mrecomendaciones.Text = '' then
                 Mrecomendaciones.Text := 'NINGUNA';
            reg_observacion(5,Mrecomendaciones.Text);
        end;
end;

procedure TFrmAnalisiscre.BTaceptarClick(Sender: TObject);
begin
        if (DBinversion.KeyValue = Null) or (DBclasificacion.KeyValue = Null) then
        begin
          MessageDlg('Falta la Clasificacion o la Inversion...',mtInformation,[mbok],0);
          PageControl1.ActivePageIndex := 1;
          DBinversion.SetFocus;
          Exit;
        end;
        if DBente.Text = '' then
        begin
          MessageDlg('Debe Seleccionar un Ente Aprobador',mtInformation,[mbok],0);
          PageControl1.ActivePageIndex := 1;
          DBente.SetFocus;
          Exit;
        end;
        try
          estado_solicitud := DBente.KeyValue + 1;
        except
        begin
          MessageDlg('Debe Selecionar un Ente Aprobador',mtWarning,[mbok],0);
          PageControl1.ActivePageIndex := 1;
          DBente.SetFocus;
          Exit;
        end;
        end;
        if DBente.KeyValue = 0 then
           estado_solicitud := 14;
        if (LineaBancoldex <> '') and (JVvaloraprobado.Value > SaldoBancoldex) then
         begin
           MessageDlg('No se puede Aprobar porque Supera el Saldo Bancoldex',mtError,[mbok],0);
//           BTnuevo.Click;
         end;
        if JVvaloraprobado.Value = 0 then
        begin
           MessageDlg('Valor Aprobado debe Contener un Valor mayor a Cero',mtwarning,[mbok],0);
           PageControl1.ActivePageIndex := 1;
           JVvaloraprobado.SetFocus;
        end
        else if JVplazoaprobado.Value = 0 then
        begin
           MessageDlg('Plazo Aprobado debe Contener un Valor mayor a Cero',mtwarning,[mbok],0);
           PageControl1.ActivePageIndex := 1;
           JVplazoaprobado.SetFocus;
        end
        else
        begin
          if MessageDlg('Esta Seguro de Registrar el Analisis',mtInformation,[mbyes,mbno],0) = mryes then
             datos_analisis
          else
             Exit;
          if DBente.KeyValue = 2 then
          begin
            if MessageDlg('Desea Registrar el Informe Para Comite de Creditos',mtInformation,[mbyes,mbno],0) = mryes then
            begin

          FrmComCreditos := TFrmComCreditos.Create(self);
               //********
          with DmSolicitud.IBSolicitud1 do
          begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 12');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          FrmComCreditos.Mcodeudores.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 0');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          FrmComCreditos.Mactividad.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 7');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          FrmComCreditos.Mdesgarantia.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 8');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          FrmComCreditos.Mabogado.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 9');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          FrmComCreditos.Mavaluo.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 10');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          FrmComCreditos.Minmueble.Text := FieldByName('OBSERVACION').AsString;
          SQL.Clear;
          SQL.Add('select OBSERVACION from "col$observacion"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
          SQL.Add('ID_OBSERVACION = 11');
          parambyname('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          FrmComCreditos.Mconcepto.Text := FieldByName('OBSERVACION').AsString;
          Close;
          Transaction.Commit;
          end;
               //********
               FrmComCreditos.Msolicitud.Text := MKsolicitud.Text;
//               FrmComCreditos.BitBtn1.Click;
//               FrmComCreditos.Mdesgarantia.SetFocus;
               FrmComCreditos.ShowModal;
            end;
          end;
          MessageDlg('Solicitud Registrada Con Exito.',mtinformation,[mbok],0);
          BTreporte.Enabled := True;
          BTaceptar.Enabled := False;
          TabSheet1.Enabled := false;
          TabSheet2.Enabled := false;
          TabSheet3.Enabled := false;
          PageControl1.ActivePageIndex := 0;
          BTreporte.SetFocus;
        end;
end;

procedure TFrmAnalisiscre.JVdeduccionesExit(Sender: TObject);
begin
        JVdisponible.Value := JVingresos.Value - JVdeducciones.Value;
end;

procedure TFrmAnalisiscre.JVdisponibleExit(Sender: TObject);
begin
        JVdispago.Value := 0.3 * JVdisponible.Value;
end;

procedure TFrmAnalisiscre.JVcuotaExit(Sender: TObject);
begin
        if JVcuota.Value <= JVdispago.Value then
           JvSolvencia.Checked := true
        else
           JvSolvencia.Checked := False;
end;

procedure TFrmAnalisiscre.actualizar;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('"col$codeudor".ID_PERSONA,');
          SQL.Add('"col$codeudor".ID_IDENTIFICACION,');
          SQL.Add('"col$codeudor".INGRESOS,');
          SQL.Add('"col$codeudor".DISPONIBLE,');
          SQL.Add('"col$codeudor".DEDUCCIONES,');
          SQL.Add('"col$codeudor".VALOR_CUOTA,');
          SQL.Add('"col$codeudor".DISP_PAGO,');
          SQL.Add('"col$codeudor".SOLV_ECONOMICA,');
          SQL.Add('"col$codeudor".EXP_CREDITOS,');
          SQL.Add('"col$codeudor".ID_ENTRADA');
          SQL.Add('FROM');
          SQL.Add('"col$codeudor"');
          SQL.Add('WHERE');
          SQL.Add('("col$codeudor".ID_SOLICITUD = :ID_SOLICITUD)');
          SQL.Add('AND ("col$codeudor".ES_CONYUGUE = 0)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ExecQuery;
          while not Eof do
          begin
            CDcodeudores.Filter := 'id_persona ='+ FieldByName('ID_PERSONA').AsString;
            CDcodeudores.Filtered := True;
            CDcapacidad.Append;
            CDcapacidad.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
            CDcapacidad.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
            CDcapacidad.FieldValues['ingresos'] := FieldByName('INGRESOS').AsCurrency;
            CDcapacidad.FieldValues['deducciones'] := FieldByName('DEDUCCIONES').AsCurrency;
            CDcapacidad.FieldValues['disponible'] := FieldByName('DISPONIBLE').AsCurrency;
            CDcapacidad.FieldValues['valor_cuota'] := FieldByName('VALOR_CUOTA').AsCurrency;
            CDcapacidad.FieldValues['disp_pago'] := FieldByName('DISP_PAGO').AsCurrency;
            CDcapacidad.FieldValues['solv_economica'] := ABS(FieldByName('SOLV_ECONOMICA').AsInteger);
            CDcapacidad.FieldValues['exp_creditos'] := FieldByName('EXP_CREDITOS').AsString;
               CDcapacidad.FieldValues['definicion'] := 'CODEUDOR(' + IntToStr(FieldByName('ID_ENTRADA').AsInteger) + ')';
               //ShowMessage('CODEUDOR(' + IntToStr(FieldByName('ID_ENTRADA').AsInteger) + ')');
            CDcapacidad.Post;
            CDcodeudores.Filtered := False;
            Next;
          end;
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$solicitud"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ExecQuery;
//          DBente.KeyValue := FieldByName('ENTE_APROBADOR').AsInteger;
          DBclasificacion.KeyValue := FieldByName('CLASIFICACION').AsInteger;
          DBinversion.KeyValue := FieldByName('INVERSION').AsInteger;
          CDcapacidad.Append;
          CDcapacidad.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
          CDcapacidad.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
          CDcapacidad.FieldValues['ingresos'] := FieldByName('INGRESOS').AsCurrency;
          CDcapacidad.FieldValues['deducciones'] := FieldByName('DEDUCCIONES').AsCurrency;
          CDcapacidad.FieldValues['disponible'] := FieldByName('DISPONIBLE').AsCurrency;
          CDcapacidad.FieldValues['valor_cuota'] := FieldByName('VALOR_CUOTA').AsCurrency;
          CDcapacidad.FieldValues['disp_pago'] := FieldByName('DISPONIBILIDAD').AsCurrency;
          CDcapacidad.FieldValues['solv_economica'] := ABS(FieldByName('SOLV_ECONOMICA').AsInteger);
          CDcapacidad.FieldValues['exp_creditos'] := FieldByName('EXP_CREDITOS').AsString;
          CDcapacidad.FieldValues['definicion'] :='DEUDOR';
          CDcapacidad.Post;
          Close;
        end;
        Manalisis.Text := busca_observacion(1);
        Mobservacion.Text := busca_observacion(3);
        Mconcepto.Text := busca_observacion(4);
        Mrecomendaciones.Text := busca_observacion(5);
end;

procedure TFrmAnalisiscre.BTcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmAnalisiscre.reg_observacion(id_observacion: integer;
  concepto: string);
begin
        with DmSolicitud.IBsolicitud2 do
        begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('delete from "col$observacion"');
           SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
           SQL.Add('ID_OBSERVACION = :ID_OBSERVACION');
           ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
           ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
           ExecSQL;
           Transaction.CommitRetaining;
           SQL.Clear;
           SQL.Add('insert into "col$observacion"');
           SQL.Add('values(:ID_SOLICITUD,:ID_OBSERVACION,:OBSERVACION)');
           ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
           ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
           ParamByName('OBSERVACION').AsString := concepto;
           ExecSQL;
           Close;
           Transaction.Commit;
        end;

end;

function TFrmAnalisiscre.busca_observacion(
  id_observacion: integer): string;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$observacion".OBSERVACION');
          SQL.Add('FROM');
          SQL.Add('"col$observacion"');
          SQL.Add('WHERE');
          SQL.Add('("col$observacion".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("col$observacion".ID_OBSERVACION = :ID_OBSERVACION)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
          ExecQuery;
          Result := FieldByName('OBSERVACION').AsString;
          Close;
        end;
end;

procedure TFrmAnalisiscre.DBcolocacionDblClick(Sender: TObject);
begin
      if control_credito then
       begin
        CDcredito.Edit;
        with DmSolicitud.IBsolicitud3 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('update "gen$infcrediticia" set');
          SQL.Add('"gen$infcrediticia".ES_DESCUENTO = :ES_DESCUENTO');
          SQL.Add('where "gen$infcrediticia".ID_SOLICITUD = :ID_SOLICITUD');
          SQL.Add('and "gen$infcrediticia".ID_COLOCACION = :ID_COLOCACION');

          if not ((CDcreditoestado.AsInteger = 2) or (CDcreditoestado.AsInteger = 3)) then
           begin
             if CDcreditocriterio.Value  = 'NO' then
              begin
                CDcreditocriterio.Value :='SI';
                CDcreditoes_descuento.Value := True;
                ParamByName('ES_DESCUENTO').AsInteger := 1;
              end
             else
              begin
                CDcreditocriterio.Value :='NO';
                CDcreditoes_descuento.Value := False;
                ParamByName('ES_DESCUENTO').AsInteger := 0;
              end;
           end
          else
           begin
             CDcreditocriterio.Value := 'SI';
//             CDcreditoes_descuento.Value := True;
             ParamByName('ES_DESCUENTO').AsInteger := 1;
             CDcreditoes_descuento.FocusControl;
           end;
           ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
           ParamByName('ID_COLOCACION').AsString := CDcreditocolocacion.Value;
           ExecSQL;
           Close;
           Transaction.Commit;
           CDcredito.Post;
        end;
       end;
       DBcolocacionColExit(Sender);
end;

function TFrmAnalisiscre.extrae_credito(id_colocacion,
  id_solicitud: string): Boolean;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$infcrediticia".ES_DESCUENTO');
          SQL.Add('FROM');
          SQL.Add('"gen$infcrediticia"');
          SQL.Add('WHERE');
          SQL.Add('("gen$infcrediticia".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("gen$infcrediticia".ID_COLOCACION = :ID_COLOCACION)');
          ParamByName('ID_SOLICITUD').AsString := id_solicitud;
          ParamByName('ID_COLOCACION').AsString := id_colocacion;
          ExecQuery;
          Result := IntToBool(FieldByName('ES_DESCUENTO').AsInteger);
          Close;
        end;
end;

procedure TFrmAnalisiscre.MKsolicitudKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TFrmAnalisiscre.VerInformacionGeneral1Click(Sender: TObject);
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_COLOCACION = :id_colocacion)');
          ParamByName('ID_COLOCACION').AsString := CDcreditocolocacion.Value;
          ExecQuery;
          if RecordCount <> 0 then
          begin
            frmConsultaProductos := TfrmConsultaProductos.Create(self);
            frmConsultaProductos.id_identificacion_sol := FieldByName('ID_IDENTIFICACION').AsInteger;
            frmConsultaProductos.id_persona_sol := FieldByName('ID_PERSONA').AsString;
            frmConsultaProductos.ShowModal;
            if dmGeneral.IBTransaction1.InTransaction then
               dmGeneral.IBTransaction1.Rollback;
            dmGeneral.IBTransaction1.StartTransaction;
            
//            dmColocacion.Create(self);
          end;
        end;
end;

procedure TFrmAnalisiscre.VerInformacinGeneral1Click(Sender: TObject);
begin
            frmConsultaProductos := TfrmConsultaProductos.Create(self);
            frmConsultaProductos.id_identificacion_sol := CDcodeudoresid_identificacion.Value;
            frmConsultaProductos.id_persona_sol := CDcodeudoresid_persona.Value;
            frmConsultaProductos.ShowModal;
            if dmGeneral.IBTransaction1.InTransaction then
               dmGeneral.IBTransaction1.Rollback;
            dmGeneral.IBTransaction1.StartTransaction;
            //dmColocacion.Create(Self);

end;

procedure TFrmAnalisiscre.DBclasificacionExit(Sender: TObject);
var     valor_microcredito :Currency;
begin
        with DmSolicitud.IBSQL2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos"');
          SQL.Add('where ID_MINIMO = 10');
          ExecQuery;
          valor_microcredito := FieldByName('VALOR_MINIMO').AsCurrency;
        end;
        if (DBclasificacion.KeyValue = 4) and (JVvaloraprobado.Value > valor_microcredito) then
        begin
           MessageDlg('No puede ser Clasificación Micro Crédito.'+#13+ 'Excede el monto Establecido ',mtWarning,[mbok],0);
           DBclasificacion.SetFocus;
        end;
        if LineaBancoldex  <> '' then begin
          if (DBclasificacion.KeyValue <> 1) or (DBclasificacion.KeyValue <> 4) then begin
            if  JVvaloraprobado.Value  <= valor_microcredito then
              DBclasificacion.KeyValue := 4
            else
              DBclasificacion.KeyValue := 1;
          end
          else
          MessageDlg('Debe ser Clasificación Comercial o MicroCrédito',mtWarning,[mbok],0);
        end;
end;

procedure TFrmAnalisiscre.JVingresosEnter(Sender: TObject);
begin
        JVingresos.SelectAll
end;

procedure TFrmAnalisiscre.JVdeduccionesEnter(Sender: TObject);
begin
        JVdeducciones.SelectAll
end;

procedure TFrmAnalisiscre.JVdisponibleEnter(Sender: TObject);
begin
        JVdisponible.SelectAll
end;

procedure TFrmAnalisiscre.JVdispagoEnter(Sender: TObject);
begin
        JVdispago.SelectAll
end;

procedure TFrmAnalisiscre.JVcuotaEnter(Sender: TObject);
begin
        JVcuota.SelectAll
end;

procedure TFrmAnalisiscre.JVvaloraprobadoEnter(Sender: TObject);
begin
        JVvaloraprobado.SelectAll
end;

procedure TFrmAnalisiscre.JVplazoaprobadoEnter(Sender: TObject);
begin
        JVplazoaprobado.SelectAll
end;

procedure TFrmAnalisiscre.DBcolocacionDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
     DBCheckBox1.Left := Rect.Left + DBcolocacion.Left + 15;
     DBCheckBox1.Top := Rect.Top + DBcolocacion.top + 2;
     DBCheckBox1.Width := 27;//Rect.Right - Rect.Left;
     DBCheckBox1.Height := 17;//Rect.Bottom - Rect.Top;
     DBCheckBox1.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      DBcolocacion.Canvas.FillRect(Rect);
      DrawFrameControl(DBcolocacion.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFrmAnalisiscre.DBcolocacionColExit(Sender: TObject);
begin
if DBcolocacion.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False;
DBcolocacion.Columns[8].Color :=  clWhite;

end;

procedure TFrmAnalisiscre.DBcolocacionCellClick(Column: TColumn);
begin
        if (CDcreditoestado.AsInteger = 2) or (CDcreditoestado.AsInteger = 3) then
          CDcreditoes_descuento.ReadOnly := True;
end;

procedure TFrmAnalisiscre.DBcolocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = Chr(9)) then Exit;

  if (DBcolocacion.SelectedField.FieldName = DBCheckBox1.DataField) then
  begin
    DBCheckBox1.SetFocus;
    SendMessage(DBCheckBox1.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TFrmAnalisiscre.BitBtn6Click(Sender: TObject);
var     saldo :Currency;
        dias :Integer;
        filtro :string;
begin

        filtro := 'id_persona = ' + CDcodeudoresid_persona.Value + ' and id_identificacion = ' + IntToStr(CDcodeudoresid_identificacion.Value);
        with CdFianzas do
        begin
          CdFianzas.Filtered := False;
          CdFianzas.Filter := filtro;
          CdFianzas.Filtered := True;
        end;
        DbFianzas.Visible := True;
        control_credito := False;
        Resultado.Caption := 'Fianzas Atrazadas';
        Ganalisis.Caption := 'Análisis Capacidad de Pago de '+ CDcodeudoresnombres.Value;
        CDcredito.CancelUpdates;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        DbFianzas.Visible := True;
end;

procedure TFrmAnalisiscre.DbFianzasColExit(Sender: TObject);
begin
if DbFianzas.SelectedField.FieldName = DBCheckBox2.DataField then
    DBCheckBox2.Visible := False;
//            DBcretditicia.Columns[10].Color :=  clWhite;

end;

procedure TFrmAnalisiscre.DbFianzasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
     DBCheckBox2.Left := Rect.Left + DbFianzas.Left + 5;    //15
     DBCheckBox2.Top := Rect.Top + DbFianzas.top + 2;        //2
     DBCheckBox2.Width := 27;//Rect.Right - Rect.Left;
     DBCheckBox2.Height := 17;//Rect.Bottom - Rect.Top;
     DBCheckBox2.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      DbFianzas.Canvas.FillRect(Rect);
      DrawFrameControl(DbFianzas.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFrmAnalisiscre.DbFianzasKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = Chr(9)) then Exit;

  if (DbFianzas.SelectedField.FieldName = DBCheckBox2.DataField) then
  begin
    DBCheckBox2.SetFocus;
    SendMessage(DBCheckBox2.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure TFrmAnalisiscre.CargaFianza;
var     dias :Integer;
        saldo :Currency;
begin
        if IBTransaction3.InTransaction then
           IBTransaction3.Rollback;
        IBTransaction3.StartTransaction;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        CDcodeudores.Filtered := False;
        CDcodeudores.Filter := 'definicion <> ' + '''' + 'CONYUGE' + '''';
        CDcodeudores.Filtered := True;
        while not CDcodeudores.Eof do
        begin
          with DmSolicitud.IBSolicitud1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_CAPITAL,');
            SQL.Add('"col$colocacion".FECHA_INTERES,"col$colocacion".ID_AGENCIA,"col$colocacion".ID_COLOCACION,"col$colocacion".ID_ESTADO_COLOCACION,');
            SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,"col$colocacion".ID_PERSONA,"col$colocacion".ID_IDENTIFICACION');
            SQL.Add('FROM');
            SQL.Add('"col$colgarantias"');
            SQL.Add('INNER JOIN "col$colocacion" ON ("col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION) AND ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA)');
            SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
            SQL.Add('WHERE');
            SQL.Add('("col$colgarantias".ID_PERSONA = :ID_PERSONA) AND');
            SQL.Add('("col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
            SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION IN (0))');
            ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
            ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
            Open;
            while not Eof do
            begin
               dias := obtenerdeudahoy1(Agencia,FieldByName('ID_COLOCACION').AsString,IBSQL1).Dias;
               if dias > 0 then
               begin
                 saldo := FieldByName('SALDO').AsCurrency;
                 CdFianzas.Append;
                 CdFianzas.FieldValues['id_colocacion'] := FieldByName('ID_COLOCACION').AsString;
                 if saldo = 0 then
                    CdFianzas.FieldValues['saldo_actual'] := '$0'
                 else
                    CdFianzas.FieldValues['saldo_actual'] := FormatCurr('$#,#',saldo);
                 CdFianzas.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                 CdFianzas.FieldValues['id_agencia'] := FieldByName('ID_AGENCIA').AsInteger;
                 CdFianzas.FieldValues['dias'] := dias;
                 CdFianzas.FieldValues['autoriza'] := vbuscar(MKsolicitud.Text,FieldByName('ID_COLOCACION').AsString);
                 CdFianzas.FieldValues['id_persona'] :=  CDcodeudoresid_persona.Value;
                 CdFianzas.FieldValues['id_identificacion'] := CDcodeudoresid_identificacion.Value;
                 CdFianzas.Post;
               end;
                 Next;
            end;
         end;
         CDcodeudores.Next;
        end;
        CDcodeudores.Filtered := False;
end;

procedure TFrmAnalisiscre.DbFianzasDblClick(Sender: TObject);
begin
        if CdFianzasdias.Value >= vMaxDias then
           Exit;
        CdFianzas.Edit;
        CdFianzas.FieldValues['autoriza'] := not(CdFianzasautoriza.Value);
        CdFianzas.Post;
end;

function TFrmAnalisiscre.vBuscar(vIdSolicitud,vIdColocacion: string): boolean;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "col$fianza" where ID_COLOCACION = :ID_COLOCACION and ID_SOLICITUD = :ID_SOLICITUD');
          ParamByName('ID_COLOCACION').AsString := vIdColocacion;
          ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
          ExecQuery;
          if RecordCount = 0 then
             Result := False
          else
             Result := True;
        end;

end;

procedure TFrmAnalisiscre.GrabarFianza;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('delete from "col$fianza" where ID_SOLICITUD = :ID_SOLICITUD and ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ExecSQL;
          Transaction.CommitRetaining;
          Close;
          SQL.Clear;
          SQL.Add('insert into "col$fianza" values (:ID_AGENCIA,:ID_SOLICITUD,');
          SQL.Add(':ID_COLOCACION,:DIAS,:ID_EMPLEADO,:FECHA,:HORA)');
          CdFianzas.First;
          CdFianzas.Filtered := False;
          CdFianzas.Filter := 'autoriza = true';
          CdFianzas.Filtered := True;
          while not CdFianzas.Eof do
          begin
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            ParamByName('ID_COLOCACION').AsString := CdFianzas.FieldByName('ID_COLOCACION').AsString;
            ParamByName('DIAS').AsInteger := CdFianzas.FieldByName('DIAS').AsInteger;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('HORA').AsTime := Time;
            ExecSQL;
            Transaction.CommitRetaining;
            CdFianzas.Next;
          end;
          Transaction.Commit;
        end;
end;

procedure TFrmAnalisiscre.BitBtn7Click(Sender: TObject);
begin
        if LineaBancoldex <> '' then
          frmInformacionBancoldex.ShowModal
        else
          MessageDlg('Esta Solicitud No se Diligenció con Recursos Bancoldex',mtError,[mbok],0);

        
end;

procedure TFrmAnalisiscre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := caFree;
end;

end.
