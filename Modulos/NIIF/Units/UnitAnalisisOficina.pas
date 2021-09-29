unit UnitAnalisisOficina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvLabel, ExtCtrls, ComCtrls, Buttons,
  JvStaticText, DB, DBClient, Grids, DBGrids, JvEdit, JvTypedEdit,
  JvCheckBox, JvRadioGroup, CheckLst, JvCheckListBox, JvHtControls,
  IBDatabase, IBCustomDataSet, IBQuery, DBCtrls, JclSysUtils, StrUtils, JvFloatEdit, JvGroupBox, DateUtils, Math,
  ImgList, FR_DSet, FR_DBSet, FR_Class, ActnList, Menus, sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IBSQL;

type
TMiGrid = class(TCustomDBGrid);
  TFrmAnalisisOficina = class(TForm)
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
    frReport1: TfrReport;
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
    JVfecha: TJvStaticText;
    ActionList1: TActionList;
    PopupMenu1: TPopupMenu;
    VerInformacionGeneral1: TMenuItem;
    IBTransaction2: TIBTransaction;
    PopupMenu2: TPopupMenu;
    VerInformacinGeneral1: TMenuItem;
    Label25: TLabel;
    DBoficina: TDBLookupComboBox;
    IBAgencias: TIBQuery;
    DSagencias: TDataSource;
    IdTCPClient1: TIdTCPClient;
    CDreferencias: TClientDataSet;
    CDreferenciasnombres: TStringField;
    CDreferenciastelefono: TStringField;
    CDreferenciasdireccion: TStringField;
    CDreferenciasreferencia: TStringField;
    CDreferenciasparentesco: TStringField;
    CDDocumentos: TClientDataSet;
    CDDocumentosid_persona: TStringField;
    CDDocumentosid_identificacion: TIntegerField;
    CDDocumentosdocumentos: TStringField;
    CDfianzas: TClientDataSet;
    CDcreditos: TClientDataSet;
    CDfianzasid_colocacion: TStringField;
    CDfianzasfecha_interes: TDateField;
    CDfianzassaldo: TCurrencyField;
    CDfianzasestado: TStringField;
    CDfianzasid_persona: TStringField;
    CDcreditosid_colocacion: TStringField;
    CDcreditosid_persona: TStringField;
    CDcreditosvalor_cuota: TCurrencyField;
    CDcreditosfecha_capital: TDateField;
    CDcreditosfecha_interes: TDateField;
    CDcreditossaldo: TCurrencyField;
    CDingresos: TClientDataSet;
    CDingresosingresos: TCurrencyField;
    CDingresosotros_ingresos: TCurrencyField;
    CDingresosalquiler: TCurrencyField;
    CDingresosservicios: TCurrencyField;
    CDingresostransporte: TCurrencyField;
    CDingresosalimentacion: TCurrencyField;
    CDingresosdeudas: TCurrencyField;
    CDingresosotros_egresos: TCurrencyField;
    CDingresosid_persona: TStringField;
    CDfianzasvalor_cuota: TCurrencyField;
    CDfianzasvalor_desembolso: TCurrencyField;
    CDcreditosestado: TStringField;
    CDcreditosvalor_desembolso: TCurrencyField;
    CDobservacion: TClientDataSet;
    CDobservacionid_observacion: TIntegerField;
    CDobservacionobservacion: TStringField;
    CDobservaciondescripcion: TStringField;
    CDvalidacol: TClientDataSet;
    CDvalidacolid_colocacion: TStringField;
    CDvalidacolvalida: TBooleanField;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    Panel8: TPanel;
    BitBtn7: TBitBtn;
    Panel9: TPanel;
    BitBtn8: TBitBtn;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    IBSQL5: TIBSQL;
    IBTransaction4: TIBTransaction;
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
    procedure DBinversionExit(Sender: TObject);
    procedure MKsolicitudExit(Sender: TObject);
    procedure JVingresosEnter(Sender: TObject);
    procedure JVdeduccionesEnter(Sender: TObject);
    procedure JVdisponibleEnter(Sender: TObject);
    procedure JVdispagoEnter(Sender: TObject);
    procedure JVcuotaEnter(Sender: TObject);
    procedure JVvaloraprobadoEnter(Sender: TObject);
    procedure JVplazoaprobadoEnter(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure BitBtn7Click(Sender: TObject);
  private
    fecha_concepto :string;
    solicitante :string;
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
    observacion_auxiliar: string;
    host_server: string;
    puerto_server: integer;
    Astream :TStringStream;
    XmlDoc,Xmlres :TsdXmlDocument;
    tamano :Integer;
    nodo :TXmlNode;
    nodo1 :TXmlNode;
    Alist :TList;
    ob_codeudor: string;
    ob_actividad: string;
    ob_garantia: string;
    ob_abogado: string;
    ob_inmueble: string;
    ob_concepto: string;
    ob_avaluo :string;
    valida_tcp: boolean;
    id_garantia: integer;
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
    procedure actualiza_solicitud;
    function Valida: boolean;
   { Private declarations }
  public
  published
    procedure reporte;
    { Public declarations }
  end;

var
  FrmAnalisisOficina: TFrmAnalisisOficina;
  LineaBancoldex : string;
  SaldoBancoldex : Currency;
  Bancoldex : Boolean;
  NoBancoldex :string;
  
implementation

uses UnitDmSolicitud, UnitDescObservacion, UnitDesreferencias,
  UnitImpresion, UnitMain, UnitComCreditos, UnitGlobales, UnitGlobalesCol,
  UnitConsultaProductos, UnitComCreditosOficina, UnitPantallaProgreso,
  UnitProgreso,ZLibex,UnitInformacionBancoldex;

{$R *.dfm}

procedure TFrmAnalisisOficina.BTbuscarClick(Sender: TObject);
var     estado,id_pagointeres :Integer;
        mensage :string;
        i :Integer;
        Astream2 :TMemoryStream;
begin

      if MKsolicitud.Text <> '          ' then
      begin
       // validacion de solicitudes
        with IBQuery3 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$solicitudanalistaof".ID_EMPLEADO,');
          SQL.Add('"col$solicitudanalistaof".ES_VIGENTE');
          SQL.Add('FROM');
          SQL.Add('"col$solicitudanalistaof"');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudanalistaof".ID_AGENCIA = :ID_AGENCIA) AND ');
          SQL.Add('("col$solicitudanalistaof".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
          Open;
          if RecordCount = 0 then
          begin
             MessageDlg('La Solicitud no se Encuentra Registrada',mtWarning,[mbok],0);
             Exit;
          end;
          if FieldByName('ID_EMPLEADO').AsString <> DBAlias then
          begin
             MessageDlg('La Solicitud se encuentra registrada a nombre de ' + FieldByName('ID_EMPLEADO').AsString,mtInformation,[mbok],0);
             Exit;
          end;
        end;    
        // fin validacion de solicitudes
        valida_tcp := false;
        XmlDoc := TsdXmlDocument.CreateName('solicitud');
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.InfoLabel := 'Kbs Recibidos : 0';
        frmProgreso.Position := 1;
        frmProgreso.Titulo := 'Recibiendo Informacion ' + DBoficina.Text;
        frmProgreso.Min := 0;
        frmProgreso.Ejecutar;
        Application.ProcessMessages;
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        XmlDoc.Root.WriteString('id_solicitud',MKsolicitud.Text);
        XmlDoc.Root.WriteString('id_tipo','0');// 0 PARA CONSULTA Y 1 PARA INSERCION Y ACTUALIZACION
        XmlDoc.Root.WriteString('id_modulo','A');
        //Exit;
        Astream := TStringStream.Create('');
        XmlDoc.SaveToStream(Astream);
        with IdTCPClient1 do
        begin
          Port := puerto_server;
          Host := host_server;
          try
            Application.ProcessMessages;
            Connect;
          except
          on e: Exception do
          begin
             Application.ProcessMessages;
             MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
             frmProgreso.Cerrar;
             exit
          end;
          end;
          if Connected then
          begin
            WriteInteger(Astream.Size);
            OpenWriteBuffer;
            WriteStream(Astream);
            CloseWriteBuffer;
            FreeAndNil(Astream);
            tamano := ReadInteger;
            Application.ProcessMessages;
            valida_tcp := True;
            Astream := TStringStream.Create('');
            ReadStream(Astream,tamano,False);
            // descopmression del archivo
            frmProgreso.Cerrar;
            Astream2 := TMemoryStream.Create;
            frmProgreso.Cerrar;
            Astream.Position := 0;
            ZDeCompressStream(Astream,Astream2);
            Astream2.Seek(0,0);
            Xmlres.LoadFromStream(Astream2);
            Xmlres.SaveToFile('c:\respuesta_analista.xml');
            nodo := Xmlres.Root.NodeByName('solicitud');
            if nodo.ReadString('encontrado') = 'error' then
            begin
              MessageDlg('Ha Ocurrido un Error En Momento de Ejecución con Mensaje;'+#13+nodo.ReadString('mensaje'),mtError,[mbok],0);
              MKsolicitud.SetFocus;
              Disconnect;
              Exit;
            end;
            if nodo.ReadString('encontrado') = 'false' then
            begin
               MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
               Disconnect;
               MKsolicitud.SetFocus;
               Exit;
            end;
            estado := nodo.ReadInteger('estado');
            //estado := 2;//ojo quitar
            with DmSolicitud.IBSQL1 do
            begin
              Close;
              if Transaction.InTransaction then
                 Transaction.Commit;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
              SQL.Add('FROM');
              SQL.Add('"col$estadosolicitud"');
              SQL.Add('WHERE');
              SQL.Add('("col$estadosolicitud".ID_ESTADO = :ID_ESTADO)');
              ParamByName('ID_ESTADO').AsInteger := estado;
              ExecQuery;
              mensage := FieldByName('DESCRIPCION_ESTADO').AsString;
              Close;
              if estado = 13 then
                 estado := 1;
             if (estado = 2) or (estado = 3) then
             begin
               control_actualiza := False;
               if MessageDlg('La solicitud ya fue Analizada, Desea Continuar',mtWarning,[mbyes,mbno],0) = mrno then
               begin
                 MKsolicitud.SetFocus;
                 PageControl1.Enabled := False;
                 IdTCPClient1.Disconnect;
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
          if (estado >= 4) and (estado <> 9) then
          begin
            MessageDlg('La solicitud se Encuentra ' + mensage,mtInformation,[mbok],0);
            MKsolicitud.SetFocus;
            PageControl1.Enabled := False;
            IdTCPClient1.Disconnect;
            Exit;
          end;
          Panel1.Enabled := False;
          PageControl1.Enabled := True;
          PageControl1.ActivePageIndex := 0;
          JVsolicitante.Caption := nodo.ReadString('nombre') + ' ' + nodo.ReadString('p_apellido') + ' ' + nodo.ReadString('s_apellido');
          JVfecha.Caption := nodo.ReadString('fecha_recepcion');
          id_oficina := DBoficina.KeyValue;
          id_persona := nodo.ReadString('id_persona');
          id_identificacion := nodo.ReadInteger('id_identificacion');
          JVamortizacion.Caption := 'CADA ' + nodo.ReadString('amortizacion') + ' DIAS';
          id_pagointeres :=  nodo.ReadInteger('pago_interes');
          id_linea := nodo.ReadInteger('Linea');
          DBinversion.KeyValue := nodo.ReadInteger('inversion');
          DBclasificacion.KeyValue := nodo.ReadInteger('clasificacion');
          JVpagointeres.Caption := 'CADA ' + nodo.ReadString('pago_interes') + ' DIAS';
          if id_linea = 7 then
          begin
            DBinversion.KeyValue := 3;
            DBclasificacion.KeyValue := 3;
            DBinversion.Enabled := False;
            DBclasificacion.Enabled := False;
          end;
          JVplazo.Value := nodo.ReadInteger('plazo');
          EDinversion.Text := nodo.ReadString('destino');
          JVvalor.Value := nodo.ReadFloat('valor_solicitado');
          JVvaloraprobado.Value :=JVvalor.Value;
          JVplazoaprobado.Value := JVplazo.Value;
          SQL.Clear;
          SQL.Add('select TASA, DESCRIPCION_LINEA from "col$lineas"');
          SQL.Add('where ID_LINEA = :ID_LINEA');
          ParamByName('ID_LINEA').AsInteger := id_linea;
          ExecQuery;
          JVtasa.Value := SimpleRoundTo(FieldByName('TASA').AsFloat,-2);
          JVlinea.Caption := FieldByName('DESCRIPCION_LINEA').AsString;
          JVtasaaprobada.Value := SimpleRoundTo(FieldByName('TASA').AsFloat,-2);
          Close;
          id_garantia := nodo.ReadInteger('garantia');
          SQL.Clear;
          SQL.Add('select DESCRIPCION_GARANTIA from "col$garantia"');
          SQL.Add('where ID_GARANTIA = :ID_GARANTIA');
          ParamByName('ID_GARANTIA').AsInteger := nodo.ReadInteger('garantia');
          ExecQuery;
          JVgarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString;
          Close;
          CDcodeudores.Append;// codeudores
          CDcodeudores.FieldValues['id_persona'] := id_persona;
          CDcodeudores.FieldValues['id_identificacion'] := id_identificacion;
          CDcodeudores.FieldValues['nombres'] := JVsolicitante.Caption;
          CDcodeudores.FieldValues['definicion'] := 'DEUDOR';
          CDcodeudores.FieldValues['numero'] := 0;
          CDcodeudores.Post;
          CDcapacidad.Append;// capacidad de pago
          CDcapacidad.FieldValues['id_persona'] := id_persona;
          CDcapacidad.FieldValues['id_identificacion'] := id_identificacion;
          CDcapacidad.FieldValues['ingresos'] := nodo.ReadFloat('ingresos');
          CDcapacidad.FieldValues['deducciones'] := nodo.ReadFloat('deducciones');
          CDcapacidad.FieldValues['disponible'] := nodo.ReadFloat('disponible');
          CDcapacidad.FieldValues['valor_cuota'] := nodo.ReadFloat('valor_cuota');
          CDcapacidad.FieldValues['disp_pago'] := nodo.ReadFloat('disponibilidad');
          CDcapacidad.FieldValues['solv_economica'] := ABS(nodo.ReadInteger('solv_economica'));
          CDcapacidad.FieldValues['exp_creditos'] := nodo.ReadString('exp_creditos');
          CDcapacidad.FieldValues['definicion'] :='DEUDOR';
          CDcapacidad.Post;
          CDingresos.Append;// ingresos y egresos
          CDingresos.FieldValues['ingresos'] := nodo.ReadFloat('ingresos_p');
          CDingresos.FieldValues['otros_ingresos'] := nodo.ReadFloat('otros_ingresos');
          CDingresos.FieldValues['alquiler'] := nodo.ReadFloat('alquiler');
          CDingresos.FieldValues['servicios'] := nodo.ReadFloat('servicios');
          CDingresos.FieldValues['transporte'] := nodo.ReadFloat('transporte');
          CDingresos.FieldValues['alimentacion'] := nodo.ReadFloat('alimentacion');
          CDingresos.FieldValues['deudas'] := nodo.ReadFloat('deudas');
          CDingresos.FieldValues['otros_egresos'] := nodo.ReadFloat('otros_egresos');
          CDingresos.FieldValues['id_persona'] := id_persona;
          CDingresos.Post;
          nodo := Xmlres.Root.NodeByName('codeudores');
          for i := 0 to nodo.NodeCount -1 do
          begin
             //ShowMessage(nodo.Nodes[i].ReadString('id_persona'));
           CDcodeudores.Append;
           CDcodeudores.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
           CDcodeudores.FieldValues['id_identificacion'] := nodo.Nodes[i].ReadInteger('id_identificacion');
           CDcodeudores.FieldValues['nombres'] := nodo.Nodes[i].ReadString('nombre');
           if Abs(nodo.Nodes[i].ReadInteger('es_conyuge')) = 0 then
              CDcodeudores.FieldValues['definicion'] := 'CODEUDOR(' +nodo.Nodes[i].ReadString('id_entrada') +')'
           else
              CDcodeudores.FieldValues['definicion'] := 'CONYUGE';
           CDcodeudores.FieldValues['numero'] := nodo.Nodes[i].ReadInteger('id_entrada');
           CDcodeudores.Post;
           CDcapacidad.Append;
           CDcapacidad.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
           CDcapacidad.FieldValues['id_identificacion'] := nodo.Nodes[i].ReadInteger('id_identificacion');
           CDcapacidad.FieldValues['ingresos'] := nodo.Nodes[i].ReadFloat('ingresos');
           CDcapacidad.FieldValues['deducciones'] := nodo.Nodes[i].ReadFloat('deducciones');
           CDcapacidad.FieldValues['disponible'] := nodo.Nodes[i].ReadFloat('disponible');
           CDcapacidad.FieldValues['valor_cuota'] := nodo.Nodes[i].ReadFloat('valor_cuota');
           CDcapacidad.FieldValues['disp_pago'] := nodo.Nodes[i].ReadFloat('disponibilidad');
           CDcapacidad.FieldValues['solv_economica'] := ABS(nodo.Nodes[i].ReadInteger('solv_economica'));
           CDcapacidad.FieldValues['exp_creditos'] := nodo.Nodes[i].ReadString('exp_creditos');
           CDcapacidad.FieldValues['definicion'] :='CODEUDOR(' +nodo.Nodes[i].ReadString('id_entrada') +')';
           CDcapacidad.Post;
           CDingresos.Append;// ingresos y egresos
           CDingresos.FieldValues['ingresos'] := nodo.Nodes[i].ReadFloat('ingresos_p');
           CDingresos.FieldValues['otros_ingresos'] := nodo.Nodes[i].ReadFloat('otros_ingresos');
           CDingresos.FieldValues['alquiler'] := nodo.Nodes[i].ReadFloat('alquiler');
           CDingresos.FieldValues['servicios'] := nodo.Nodes[i].ReadFloat('servicios');
           CDingresos.FieldValues['transporte'] := nodo.Nodes[i].ReadFloat('transporte');
           CDingresos.FieldValues['alimentacion'] := nodo.Nodes[i].ReadFloat('alimentacion');
           CDingresos.FieldValues['deudas'] := nodo.Nodes[i].ReadFloat('deudas');
           CDingresos.FieldValues['otros_egresos'] := nodo.Nodes[i].ReadFloat('otros_egresos');
           CDingresos.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
           CDingresos.Post;
         end;
        nodo := Xmlres.Root.NodeByName('observaciones');
        for i := 0 to nodo.NodeCount - 1 do
        begin
           case nodo.Nodes[i].ReadInteger('tipo') of
             0: ob_actividad := nodo.Nodes[i].ReadString('observacion');
             1: Manalisis.Text := nodo.Nodes[i].ReadString('observacion');
             2: observacion := nodo.Nodes[i].ReadString('observacion');
             3: Mobservacion.Text := nodo.Nodes[i].ReadString('observacion');
             4: Mconcepto.Text := nodo.Nodes[i].ReadString('observacion');
             5: Mrecomendaciones.Text := nodo.Nodes[i].ReadString('observacion');
             7: ob_garantia := nodo.Nodes[i].ReadString('observacion');
             8: ob_abogado := nodo.Nodes[i].ReadString('observacion');
             9: ob_avaluo := nodo.Nodes[i].ReadString('observacion');
            10: ob_inmueble := nodo.Nodes[i].ReadString('observacion');
            11: ob_concepto := nodo.Nodes[i].ReadString('observacion');
            12: ob_codeudor := nodo.Nodes[i].ReadString('observacion');
           end;
        end;
        nodo := Xmlres.Root.NodeByName('extracto');
        JVaportes.Value := nodo.ReadFloat('aportes');
        JVahorro.Value := nodo.ReadFloat('ahorros');
        JVcontractual.Value := nodo.ReadFloat('contractual');
        JVcdat.Value := nodo.ReadFloat('cdat');
        numero_cuenta.Caption := '20' + IntToStr(DBoficina.KeyValue) + '-' + nodo.ReadString('cuenta');
        JVjuvenil.Value := nodo.ReadFloat('juvenil');
        Rsi.Checked := nodo.ReadBool('creditos');
        Rno.Checked := not(nodo.ReadBool('creditos'));
        nodo := Xmlres.Root.NodeByName('referencias');
        FrmReferencias := TFrmReferencias.Create(self);
        FrmReferencias.ClientDataSet1.CancelUpdates;
        for i := 0 to nodo.NodeCount - 1 do
        begin
          FrmReferencias.ClientDataSet1.Append;
          FrmReferencias.ClientDataSet1.FieldValues['nombre'] := nodo.Nodes[i].ReadString('nombre_ref') + ' ' + nodo.Nodes[i].ReadString('p_apellido_ref') + ' '+nodo.Nodes[i].ReadString('s_apellido_ref');
          FrmReferencias.ClientDataSet1.FieldValues['telefono'] := nodo.Nodes[i].ReadString('telefono_ref');
          FrmReferencias.ClientDataSet1.FieldValues['direccion'] := nodo.Nodes[i].ReadString('direccion_ref');
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$tiposreferencia".DESCRIPCION_REFERENCIA');
          SQL.Add('FROM');
          SQL.Add('"gen$tiposreferencia"');
          SQL.Add('WHERE');
          SQL.Add('("gen$tiposreferencia".ID_REFERENCIA = :ID_REFERENCIA)');
          ParamByName('ID_REFERENCIA').AsInteger := nodo.NodeS[I].ReadInteger('tipo_ref');
          ExecQuery;
          FrmReferencias.ClientDataSet1.FieldValues['tipo_referencia'] := FieldByName('DESCRIPCION_REFERENCIA').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$tiposparentesco".DESCRIPCION_PARENTESCO');
          SQL.Add('FROM');
          SQL.Add('"gen$tiposparentesco"');
          SQL.Add('WHERE');
          SQL.Add('("gen$tiposparentesco".ID_PARENTESCO = :ID_PARENTESCO)');
          ParamByName('ID_PARENTESCO').AsInteger := nodo.NodeS[i].ReadInteger('parentesco_ref');
          ExecQuery;
          FrmReferencias.ClientDataSet1.FieldValues['parentesco'] := FieldByName('DESCRIPCION_PARENTESCO').AsString;
          Close;
          FrmReferencias.ClientDataSet1.post;
        end;

        //Informacion Bancoldex
        try
          nodo := Xmlres.Root.NodeByName('bancoldex');
          LineaBancoldex := nodo.ReadString('LINEA_BANCOLDEX');
          NoBancoldex := FieldByName('NO_BANCOLDEX').AsString;
        except
          LineaBancoldex := '';
        end;
        if LineaBancoldex <> '' then begin
          Bancoldex := True;
          frmInformacionBancoldex := TfrmInformacionBancoldex.Create(Self);
          frmInformacionBancoldex.CDBancoldex.CancelUpdates;
          frmInformacionBancoldex.CDDestinoB.CancelUpdates;
          frmInformacionBancoldex.CDGarantiaB.CancelUpdates;
          frmInformacionBancoldex.CDBancoldex.Append;
          frmInformacionBancoldex.CDBancoldex.FieldValues['LINEA'] := nodo.ReadString('LINEA_BANCOLDEX');
          frmInformacionBancoldex.CDBancoldex.FieldValues['NO_BANCOLDEX'] := nodo.ReadString('NO_BANCOLDEX');
          frmInformacionBancoldex.CDBancoldex.FieldValues['EMPLEOS_ACT'] := nodo.ReadString('EMPLEOS_ACT');
          frmInformacionBancoldex.CDBancoldex.FieldValues['EMPLEOS_GENERAR'] := nodo.ReadString('EMPLEOS_GENERAR');
          frmInformacionBancoldex.CDBancoldex.FieldValues['TOTAL_ACTIVOS'] := nodo.ReadString('TOTAL_ACTIVOS');
          frmInformacionBancoldex.CDBancoldex.FieldValues['FECHA_ACTIVOS'] := nodo.ReadString('FECHA_CORTE_ACTIVOS');
          if IBSQL3.Transaction.InTransaction then
            IBSQL3.Transaction.Rollback;
          IBSQL3.Transaction.StartTransaction;
          if nodo.ReadInteger('DESTINO1') > 0 then begin
            IBSQL3.Close;
            IBSQL3.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('DESTINO1');
            IBSQL3.ExecQuery;
            frmInformacionBancoldex.CDDestinoB.Append;
            frmInformacionBancoldex.CDDestinoB.FieldValues['NO'] := 1;
            frmInformacionBancoldex.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
            frmInformacionBancoldex.CDDestinoB.FieldValues['MONTO'] := nodo.ReadFloat('MONTO1');
            frmInformacionBancoldex.CDDestinoB.Post;
          end;
          if nodo.ReadInteger('DESTINO2') > 0 then begin
            IBSQL3.Close;
            IBSQL3.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('DESTINO2');
            IBSQL3.ExecQuery;
            frmInformacionBancoldex.CDDestinoB.Append;
            frmInformacionBancoldex.CDDestinoB.FieldValues['NO'] := 2;
            frmInformacionBancoldex.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
            frmInformacionBancoldex.CDDestinoB.FieldValues['MONTO'] := nodo.ReadFloat('MONTO2');
            frmInformacionBancoldex.CDDestinoB.Post;
          end;
          if nodo.ReadInteger('DESTINO3')> 0 then begin
            IBSQL3.Close;
            IBSQL3.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('DESTINO3');
            IBSQL3.ExecQuery;
            frmInformacionBancoldex.CDDestinoB.Append;
            frmInformacionBancoldex.CDDestinoB.FieldValues['NO'] := 3;
            frmInformacionBancoldex.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
            frmInformacionBancoldex.CDDestinoB.FieldValues['MONTO'] := nodo.ReadFloat('MONTO3');
            frmInformacionBancoldex.CDDestinoB.Post;
          end;
          if nodo.ReadInteger('GARANTIA1') > 0 then begin
            IBSQL4.Close;
            IBSQL4.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('GARANTIA1');
            IBSQL4.ExecQuery;
            frmInformacionBancoldex.CDGarantiaB.Append;
            frmInformacionBancoldex.CDGarantiaB.FieldValues['NO'] := 1;
            frmInformacionBancoldex.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
            frmInformacionBancoldex.CDGarantiaB.FieldValues['VALORG'] := nodo.ReadFloat('VALORGAR1');
            frmInformacionBancoldex.CDGarantiaB.Post;
          end;
          if nodo.ReadInteger('GARANTIA2') > 0 then begin
            IBSQL4.Close;
            IBSQL4.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('GARANTIA2');
            IBSQL4.ExecQuery;
            frmInformacionBancoldex.CDGarantiaB.Append;
            frmInformacionBancoldex.CDGarantiaB.FieldValues['NO'] := 2;
            frmInformacionBancoldex.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
            frmInformacionBancoldex.CDGarantiaB.FieldValues['VALORG'] := nodo.ReadFloat('VALORGAR2');
            frmInformacionBancoldex.CDGarantiaB.Post;
          end;
          if nodo.ReadInteger('GARANTIA3') > 0 then begin
            IBSQL4.Close;
            IBSQL4.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('GARANTIA3');
            IBSQL4.ExecQuery;
            frmInformacionBancoldex.CDGarantiaB.Append;
            frmInformacionBancoldex.CDGarantiaB.FieldValues['NO'] := 3;
            frmInformacionBancoldex.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
            frmInformacionBancoldex.CDGarantiaB.FieldValues['VALORG'] := nodo.ReadFloat('VALORGAR3');
            frmInformacionBancoldex.CDGarantiaB.Post;
          end;
          frmInformacionBancoldex.CDBancoldex.FieldValues['LINEA'] := nodo.ReadString('LINEA_BANCOLDEX');
          frmInformacionBancoldex.CDBancoldex.FieldValues['VISITA'] := nodo.ReadInteger('VISITA');
          frmInformacionBancoldex.CDBancoldex.FieldValues['FECHA_VISITA'] := nodo.ReadDateTime('FECHA_VISITA');
          IBSQL5.Close;
          IBSQL5.ParamByName('TIPO').AsInteger := nodo.ReadInteger('TIPO_SOCIEDAD');
          IBSQL5.ExecQuery;
          frmInformacionBancoldex.CDBancoldex.FieldValues['TIPO_SOCIEDAD'] := IBSQL5.FieldByName('DESCRIPCION').AsString;
          frmInformacionBancoldex.CDBancoldex.Post;
          IBSQL5.Close;
          // Saldo Bancoldex
          SQL.Clear;
          SQL.Add('select TASA_EA, MARGEN, SALDO from "col$creditosbancoldex" where linea = :Linea and id_obligacion = :obligacion');
          ParamByName('LINEA').AsString := LineaBancoldex;
          ParamByName('OBLIGACION').AsString := NoBancoldex;
          ExecQuery;
          SaldoBancoldex := FieldByName('SALDO').AsCurrency;
//          JVtasa.Value := SimpleRoundTo(BuscoTasaEfectivaMaximaDtf(fFechaActual) + FieldByName('MARGEN').AsFloat,-2);
//          JVtasaaprobada.Value := SimpleRoundTo(BuscoTasaEfectivaMaximaDtf(fFechaActual) + FieldByName('MARGEN').AsFloat,-2);
          if JVvaloraprobado.Value > SaldoBancoldex then
              MessageDlg('No se Puede Aprobar Porque El Valor Solicitado Supera el Saldo Bancoldex',mtWarning,[mbok],0);
          frmInformacionBancoldex.Saldo := SaldoBancoldex;
          frminformacionbancoldex.Analisis := True;
          frminformacionbancoldex.Solicitud := MKsolicitud.Text;
          frmInformacionBancoldex.NoBancoldex := NoBancoldex;
          Close;
        end;
        //fin Datos Bancoldex

        nodo := Xmlres.Root.NodeByName('requisitos');
        CDDocumentos.CancelUpdates;
        for i := 0 to nodo.NodeCount - 1 do
        begin
          CDDocumentos.Append;
          CDDocumentos.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$requisitos".DESCRIPCION');
          SQL.Add('FROM');
          SQL.Add('"col$requisitos"');
          SQL.Add('WHERE');
          SQL.Add('("col$requisitos".ID_REQUISITO = :ID_REQUISITO)');
          ParamByName('ID_REQUISITO').AsInteger :=nodo.Nodes[i].ReadInteger('id_requisito');
          ExecQuery;
          CDDocumentos.FieldValues['documentos'] := FieldByName('DESCRIPCION').AsString;
          Close;
          CDDocumentos.Post;
        end;
        nodo := Xmlres.Root.NodeByName('colocaciones');
        CDcreditos.CancelUpdates;
        for i := 0 to nodo.NodeCount - 1 do
        begin
          CDcreditos.Append;
          CDcreditos.FieldValues['id_colocacion'] := nodo.Nodes[i].ReadString('id_colocacion') ;
          CDcreditos.FieldValues['estado'] := nodo.Nodes[i].ReadString('estado') ;
          CDcreditos.FieldValues['valor_cuota'] := nodo.Nodes[i].ReadFloat('valor_cuota');
          CDcreditos.FieldValues['valor_desembolso'] := nodo.Nodes[i].ReadFloat('valor_desembolso');
          CDcreditos.FieldValues['fecha_capital'] := nodo.Nodes[i].ReadDateTime('fecha_capital');
          CDcreditos.FieldValues['fecha_interes'] := nodo.Nodes[i].ReadDateTime('fecha_interes');
          CDcreditos.FieldValues['saldo'] := nodo.Nodes[i].ReadFloat('saldo');
          CDcreditos.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
          CDcreditos.Post;
        end;
        nodo := Xmlres.Root.NodeByName('fianzas');
        CDfianzas.CancelUpdates;
        for i := 0 to nodo.NodeCount - 1 do
        begin
          CDfianzas.Append;
          CDfianzas.FieldValues['id_colocacion'] := nodo.Nodes[i].ReadString('id_colocacion');
          CDfianzas.FieldValues['fecha_interes'] := nodo.Nodes[i].ReadDateTime('fecha_interes');
          CDfianzas.FieldValues['saldo'] := nodo.Nodes[i].ReadFloat('saldo');
          CDfianzas.FieldValues['estado'] := nodo.Nodes[i].ReadString('estado');
          CDfianzas.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
          CDfianzas.FieldValues['valor_cuota'] := nodo.Nodes[i].ReadFloat('valor_cuota');
          CDfianzas.FieldValues['valor_desembolso'] := nodo.Nodes[i].ReadFloat('valor_desembolso');
          CDfianzas.Post;
        end;
        nodo := Xmlres.Root.NodeByName('descuentos');
        CDdescuento.CancelUpdates;
        for i := 0 to nodo.NodeCount - 1 do
        begin
           CDdescuento.Append;
           CDdescuento.FieldValues['id_solicitud'] := MKsolicitud.Text;
           CDdescuento.FieldValues['id_colocacion'] := nodo.Nodes[i].ReadString('colocacion');
           CDdescuento.FieldValues['es_descuento'] := True;
           CDdescuento.Post;
        end;
          end; // fin del with
          BTaceptar.Enabled :=True;
          CDcodeudores.IndexFieldNames := 'numero';
            Disconnect;
          end;//fin del connect
        end;// fin del with tcpclient
      end; // fin del valida solicitud
end;

procedure TFrmAnalisisOficina.cmChildKey(var msg: TWMKEY);
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

procedure TFrmAnalisisOficina.FormCreate(Sender: TObject);
begin
        DmSolicitud := TDmSolicitud.Create(self);
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
        IBoficina.Open;
        IBoficina.Last;
        DBoficina.KeyValue := 2;
end;

procedure TFrmAnalisisOficina.BTcreditoClick(Sender: TObject);
var     saldo :Currency;
begin
        control_credito := True;
        Ganalisis.Caption := 'Análisis Capacidad de Pago de '+ CDcodeudoresnombres.Value;
        CDcredito.CancelUpdates;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        CDcreditos.Filtered := False;
        CDcreditos.Filter := 'id_persona = ' + CDcodeudoresid_persona.Value;
        CDcreditos.Filtered := True;
        if CDcreditos.RecordCount = 0 then
          begin
            MessageDlg('No Posee Créditos Vigentes',mtInformation,[mbok],0);
            JVingresos.SetFocus;
            Resultado.Caption := 'No se han Encontrado Datos';
            Exit;
          end;
          while not CDcreditos.Eof do
          begin
              saldo := CDcreditos.FieldByName('saldo').AsCurrency;
          if saldo  <> 0 then
          begin
             CDcredito.Append;
             CDcredito.FieldValues['colocacion'] := CDcreditos.FieldByName('id_colocacion').AsString;
             CDcredito.FieldValues['cuota'] := CDcreditos.FieldByName('valor_cuota').AsCurrency;
             CDcredito.FieldValues['fecha_interes'] := CDcreditos.FieldByName('fecha_interes').AsCurrency;
             CDcredito.FieldValues['saldo'] := saldo;
             CDcredito.FieldValues['fecha'] := CDcreditos.FieldByName('fecha_capital').AsDateTime;
//             CDcredito.FieldValues['estado'] := CDcreditos.FieldByName('estado').AsString;
             CDvalidacol.Filtered := False;
             if CDvalidacol.RecordCount = 0 then
             begin
               CDdescuento.Filtered := False;
               CDdescuento.Filter := 'id_colocacion = ' + CDcreditos.fieldbyname('id_colocacion').AsString;
               CDdescuento.Filtered := True;
               if CDdescuento.FieldByName('id_colocacion').AsString <> '' then
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
             else
             begin
                CDvalidacol.Filtered := False;
                CDvalidacol.Filter := 'id_colocacion = ' + CDcreditos.fieldbyname('id_colocacion').AsString;
                CDvalidacol.Filtered := True;
                if CDvalidacolvalida.Value = True then
                begin
                  CDcredito.FieldValues['criterio'] := 'SI';
                  CDcredito.FieldValues['es_descuento'] := True;
                  end
                else
                begin
                  CDcredito.FieldValues['criterio'] := 'NO';
                  CDcredito.FieldValues['es_descuento'] := False;
                end;
             end;
             CDcredito.Post;
             CDcreditos.Next;
           end
           else
           CDcreditos.Next;
          end;
          Resultado.Caption := 'Créditos';
          DBcolocacion.Columns[0].Width := 104;
          DBcolocacion.Columns[1].Width := 119;
          DBcolocacion.Columns[2].Width := 64;
          DBcolocacion.Columns[4].Width := 106;
          DBcolocacion.Columns[4].Visible := false;
          DBcolocacion.Columns[3].Visible := true;
          DBcolocacion.Columns[5].Visible := true;
          DBcolocacion.Columns[6].Visible := true;
          DBcolocacion.Visible := True;
          JVingresos.SetFocus;
end;

procedure TFrmAnalisisOficina.BTfianzasClick(Sender: TObject);
var    saldo :Currency;
begin
        control_credito := False;
        Ganalisis.Caption := 'Análisis Capacidad de Pago de '+ CDcodeudoresnombres.Value;
        CDcredito.CancelUpdates;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        CDfianzas.Filtered := False;
        CDfianzas.Filter := 'id_persona = ' + CDcodeudoresid_persona.Value;
        CDfianzas.Filtered := True;
        if CDfianzas.RecordCount = 0 then
        begin
          MessageDlg('No Posee Fianzas Vigentes',mtInformation,[mbok],0);
          JVingresos.SetFocus;
          Resultado.Caption := 'No se han Encontrado Datos';
          Exit;
        end;
        while not CDfianzas.Eof do
        begin
           saldo := CDfianzas.FieldByName('saldo').AsCurrency;
           CDcredito.Append;
           CDcredito.FieldValues['colocacion'] := CDfianzas.FieldByName('id_colocacion').AsString;
           CDcredito.FieldValues['saldo'] := saldo;
           CDcredito.FieldValues['fecha'] := CDfianzas.FieldByName('fecha_interes').AsDateTime;
           CDcredito.FieldValues['estado'] := CDfianzas.FieldByName('estado').AsString;
           CDcredito.Post;
           CDfianzas.Next;
        end;
        Resultado.Caption := 'Fianzas';
        DBcolocacion.Columns[0].Width := 126;
        DBcolocacion.Columns[1].Width := 129;
        DBcolocacion.Columns[2].Width := 128;
        DBcolocacion.Columns[4].Width := 106;
        DBcolocacion.Columns[4].Visible := True;
        DBcolocacion.Columns[3].Visible := False;
        DBcolocacion.Columns[5].Visible := False;
        DBcolocacion.Columns[6].Visible := False;
        DBcolocacion.Columns[7].Visible := False;
        DBcolocacion.Visible := True;
        JVingresos.SetFocus;
end;

procedure TFrmAnalisisOficina.DBGrid1CellClick(Column: TColumn);
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
        limpia_campos;
        with CDcapacidad do
        begin
          Filter := 'id_persona ='+ CDcodeudoresid_persona.Value;
          Filtered := True;
          try
            JVingresos.Value := FieldValues['ingresos'];
            JvSolvencia.Checked := IntToBool(FieldValues['solv_economica']);
            JVdeducciones.Value := FieldValues['deducciones'];
            JVcuota.Value := FieldValues['valor_cuota'];
            JVdispago.Value := FieldValues['disp_pago'];
            JVdisponible.Value := FieldValues['disponible'];
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

procedure TFrmAnalisisOficina.BTdocumentosClick(Sender: TObject);
begin
        Ganalisis.Caption := 'Análisis Capacidad de Pago de '+ CDcodeudoresnombres.Value;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        JVdocumentos.Clear;
          CDDocumentos.Filtered := False;
          CDDocumentos.Filter := 'id_persona = ' + CDcodeudoresid_persona.Value;
          CDDocumentos.Filtered := True;
          if CDDocumentos.RecordCount = 0 then
          begin
             MessageDlg('No Posee Documentos',mtInformation,[mbok],0);
             Exit;
          end;
          while not CDDocumentos.Eof do
          begin
            JVdocumentos.Items.Add('-- '+CDDocumentos.fieldByName('documentos').AsString);
            CDDocumentos.Next;
          end;
          JVdocumentos.Visible := True;
          Resultado.Caption := 'Documentos Exigidos';
          JVingresos.SetFocus;
end;

procedure TFrmAnalisisOficina.aportes;
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

procedure TFrmAnalisisOficina.BitBtn4Click(Sender: TObject);
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

procedure TFrmAnalisisOficina.ManalisisKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mobservacion.SetFocus
end;

procedure TFrmAnalisisOficina.MobservacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mconcepto.SetFocus
end;

procedure TFrmAnalisisOficina.MconceptoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mrecomendaciones.SetFocus
end;

procedure TFrmAnalisisOficina.BitBtn5Click(Sender: TObject);
begin
        FrmReferencias.ShowModal;
end;

procedure TFrmAnalisisOficina.ManalisisExit(Sender: TObject);
begin
        Manalisis.Text := UpperCase(Manalisis.Text);
end;

procedure TFrmAnalisisOficina.MobservacionExit(Sender: TObject);
begin
        Mobservacion.Text := UpperCase(Mobservacion.Text)
end;

procedure TFrmAnalisisOficina.MconceptoExit(Sender: TObject);
begin
        Mconcepto.Text := UpperCase(Mconcepto.Text)
end;

procedure TFrmAnalisisOficina.MrecomendacionesExit(Sender: TObject);
begin
        Mrecomendaciones.Text := UpperCase(Mrecomendaciones.Text)
end;

procedure TFrmAnalisisOficina.limpia_campos;
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

procedure TFrmAnalisisOficina.limpia_general;
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
        Bancoldex := False;        
end;

procedure TFrmAnalisisOficina.BTnuevoClick(Sender: TObject);
begin
        TabSheet1.Enabled := True;
        DBente.KeyValue := -1;
        TabSheet2.Enabled := true;
        TabSheet3.Enabled := true;
        DBinversion.Enabled := True;
        DBclasificacion.Enabled := True;
        PageControl1.Enabled := False;
        CDcapacidad.CancelUpdates;
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := False;
        Gegreso.Visible := False;
        DBcolocacion.Visible := False;
        CDvalidacol.CancelUpdates;
        limpia_campos;
        limpia_general;
end;

procedure TFrmAnalisisOficina.BitBtn1Click(Sender: TObject);
begin
        DBcolocacion.Visible := False;
        JVdocumentos.Visible := False;
        Gingreso.Visible := True;
        Gegreso.Visible := True;
        with CDingresos do
        begin
          Filtered := False;
          Filter := 'id_persona = ' + CDcodeudoresid_persona.Value;
          Filtered := True;
          JVingreso.Value := FieldByName('ingresos').AsCurrency;
          JVotroingreso.Value := FieldByName('otros_ingresos').AsCurrency;
          JVtotalingreso.Value := JVingreso.Value + JVotroingreso.Value;
          JVarriendo.Value := FieldByName('alquiler').AsCurrency;
          JVtransporte.Value := FieldByName('transporte').AsCurrency;
          JVservicios.Value := FieldByName('servicios').AsCurrency;
          JValimentos.Value := FieldByName('alimentacion').AsCurrency;
          JVdeudas.Value := FieldByName('deudas').AsCurrency;
          JVotrosegresos.Value := FieldByName('otros_egresos').AsCurrency;
          JVtotalegreso.Value := JVarriendo.Value + JVtransporte.Value + JVservicios.Value + JValimentos.Value + JVdeudas.Value + JVotrosegresos.Value;
        end;
        JVingresos.SetFocus;
end;

procedure TFrmAnalisisOficina.BitBtn2Click(Sender: TObject);
begin
        with CDcapacidad do
        begin
          Filter := 'id_persona ='+ CDcodeudoresid_persona.Value;
          Filtered := True;
          try
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

procedure TFrmAnalisisOficina.RbuenaClick(Sender: TObject);
begin
        solv_economica := 'BUENA';
end;

procedure TFrmAnalisisOficina.RregularClick(Sender: TObject);
begin
        solv_economica := 'REGULAR';
end;

procedure TFrmAnalisisOficina.RmalaClick(Sender: TObject);
begin
        solv_economica := 'MALA';
end;

procedure TFrmAnalisisOficina.BitBtn3Click(Sender: TObject);
begin
        limpia_campos;
end;

procedure TFrmAnalisisOficina.fianzas;
begin
        CDfianzadeudor.CancelUpdates;
        with CDcodeudores do
        begin
          First;
          while not Eof do
          begin
            with CDfianzas do
            begin
              Filtered := False;
              Filter := 'id_persona = ' + CDcodeudores.FieldValues['id_persona'];
              Filtered := True;
              while not Eof do
              begin
                  try
                    CDgeneral.Append;
                    CDgeneral.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                    if CDcodeudores.FieldValues['definicion'] = 'CODEUDOR' then
                       CDgeneral.FieldValues['definicion'] := 'CODEUDOR('+IntToStr(CDcodeudores.FieldValues['numero']) + ')'// + '( '+ IntToStr(FieldValues['numero'] - numero_cod)+' ) '
                    else
                       CDgeneral.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'];
                    CDgeneral.Post;
                  except
                    CDgeneral.Cancel;
                  end;
                  CDfianzadeudor.Append;
                  CDfianzadeudor.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                  CDfianzadeudor.FieldValues['colocacion'] := FieldByName('id_colocacion').AsString;
                  CDfianzadeudor.FieldValues['valor'] := FieldByName('valor_desembolso').AsCurrency;
                  CDfianzadeudor.FieldValues['valor_cuota'] := FieldByName('valor_cuota').AsCurrency;
                  CDfianzadeudor.FieldValues['saldo'] := FieldByName('saldo').AsCurrency;
                  CDfianzadeudor.FieldValues['id_persona'] := CDcodeudores.FieldValues['id_persona'];
                  CDfianzadeudor.FieldValues['id_identificacion'] := CDcodeudores.FieldValues['id_identificacion'];
                  CDfianzadeudor.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'];
                  CDfianzadeudor.FieldValues['estado'] := FieldByName('estado').AsString;
                  CDfianzadeudor.FieldValues['nombre'] := CDcodeudores.FieldValues['nombres'];
                  CDfianzadeudor.post;
               Next;
              end;
            end; // end ibsql1
            Next;
          end;
        end;
        
end;

procedure TFrmAnalisisOficina.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
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
           ParValue := extrae_empleado; {
        if ParName = '' then
           ParValue := ;
        if ParName = '' then
           ParValue := ;
        if ParName = '' then
           ParValue := ; }
end;

procedure TFrmAnalisisOficina.imprimir(cadena: string);
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

procedure TFrmAnalisisOficina.BTreporteClick(Sender: TObject);
begin
        CDcodeudores.Filtered := False;
        CDcapacidad.Filtered := False;
//        CDcapacidad.IndeFieldNames := 'numero';
        reporte;
        imprimir(frmMain.wpath+ 'reporte\RepAnalisisOficina.frf');
end;

procedure TFrmAnalisisOficina.reporte;
begin
        CDgeneral.CancelUpdates;
        CDsino.CancelUpdates;
        CDsino.Append;
        CDsino.FieldValues['si'] := Rsi.Checked;
        CDsino.FieldValues['no'] := Rno.Checked;
        if Bancoldex then
          CDsino.FieldValues['bancoldex'] := True
        else
          CDsino.FieldValues['bancoldex'] := False;        
        CDsino.Post;
        colocaciones;
        fianzas;
        llena_requisito;
        //

end;

procedure TFrmAnalisisOficina.colocaciones;
var     numero_codeudor :Smallint;
begin
        CDcreditodeudor.CancelUpdates;
        with CDcodeudores do
        begin
          First;
          while not Eof do
          begin
            with CDcreditos do
            begin
              Filtered := False;
              Filter := 'id_persona = ' + CDcodeudores.FieldValues['id_persona'];
              Filtered := True;
              while not Eof do
              begin
                if FieldByName('saldo').AsCurrency <> 0 then
                begin
                  try
                    CDgeneral.Append;
                    CDgeneral.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                    if CDcodeudores.FieldValues['definicion'] = 'CODEUDOR' then
                       CDgeneral.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'] + '( '+ IntToStr(FieldValues['numero'] - numero_cod)+' ) '
                    else
                       CDgeneral.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'];
                    CDgeneral.Post;
                  except
                    CDgeneral.Cancel;
                    end;
                  CDcreditodeudor.Append;
                  CDcreditodeudor.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                  CDcreditodeudor.FieldValues['colocacion'] := FieldByName('id_colocacion').AsString;
                  CDcreditodeudor.FieldValues['valor'] := FieldByName('valor_desembolso').AsCurrency;
                  CDcreditodeudor.FieldValues['valor_cuota'] := FieldByName('valor_cuota').AsCurrency;
                  CDcreditodeudor.FieldValues['saldo'] := FieldByName('saldo').AsCurrency;
                  CDcreditodeudor.FieldValues['id_persona'] := CDcodeudores.FieldValues['id_persona'];
                  CDcreditodeudor.FieldValues['id_identificacion'] := CDcodeudores.FieldValues['id_identificacion'];
                  if CDcodeudores.FieldValues['definicion'] = 'CODEUDOR' then
                     CDcreditodeudor.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'] + '( '+ IntToStr(numero_codeudor)+' ) '
                  else
                     CDcreditodeudor.FieldValues['definicion'] := CDcodeudores.FieldValues['definicion'];
                  CDcreditodeudor.FieldValues['estado'] := FieldByName('estado').AsString;
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

function TFrmAnalisisOficina.numero_cod: integer;
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

procedure TFrmAnalisisOficina.llena_requisito;
var     definicion :string;
begin
        CDrequisitos.CancelUpdates;
        CDcodeudores.First;
        while not CDcodeudores.Eof do
        begin
          definicion := CDcodeudores.FieldByName('definicion').AsString;
             if definicion <> 'CONYUGE' then
             begin
             with CDDocumentos do
             begin
               Filtered := False;
               Filter := 'id_persona = ' + CDcodeudores.FieldByName('id_persona').AsString;
               Filtered := True;
               while not Eof do
               begin
                 CDrequisitos.Append;
                 CDrequisitos.FieldValues['EXIGIDOS'] := FieldByName('documentos').AsString;
                 CDrequisitos.FieldValues['DOCUMENTOS'] := 'X';
                 if definicion <> 'DEUDOR' then
                 begin
                   CDrequisitos.FieldValues['No'] := 'Cod' + IntToStr(CDcodeudores.FieldValues['numero']);// - numero_cod);//'COD' + '( '+ IntToStr(CDcodeudores.FieldValues['numero'] - numero_cod)+' ) '
                   CDrequisitos.FieldValues['numero'] := CDcodeudores.FieldValues['numero'];
                 end
                 else if definicion = 'DEUDOR' then
                 begin
                    CDrequisitos.FieldValues['No'] := 'Deud';
                    CDrequisitos.FieldValues['numero'] := 0;
                 end;
                 CDrequisitos.Post;
                 Next;
               end;//fin del while
           end;// fin del with
           end;
              CDcodeudores.Next;
        end;
        CDrequisitos.IndexFieldNames := 'numero';
end;

procedure TFrmAnalisisOficina.datos_analisis;
var     AstreamRes :TMemoryStream;
begin
        xmlDoc := TsdXmlDocument.CreateName('solicitud');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        XmlDoc.Root.WriteString('id_solicitud',MKsolicitud.Text);
        XmlDoc.Root.WriteString('id_tipo','1');// 0 PARA CONSULTA Y 1 PARA INSERCION Y ACTUALIZACION
        XmlDoc.Root.WriteString('id_modulo','A');
        nodo := XmlDoc.Root.NodeNew('datos_solicitud');// datos generales de la solicitud y el deudor
        nodo.WriteFloat('tasa',JVtasaaprobada.Value);
        nodo.WriteFloat('valor_aprobado',JVvaloraprobado.Value);
        nodo.WriteInteger('plazo_aprobado',JVplazoaprobado.Value);
        nodo.WriteString('id_analisis',DBAlias);
        nodo.WriteDateTime('fecha_analisis',Date);
        nodo.WriteInteger('estado',estado_solicitud);
        nodo.WriteInteger('inversion',DBinversion.KeyValue);
        nodo.WriteInteger('clasificacion',DBclasificacion.KeyValue);
        Nodo.WriteInteger('oficina',DBoficina.KeyValue);
        if Bancoldex then
        if frmInformacionBancoldex.Visita then begin
          nodo.WriteInteger('visita',1);
          nodo.WriteDateTime('fechavisita',frmInformacionBancoldex.FechaVisita);
        end;
        with CDcapacidad do
        begin
          Filtered := False;
          Filter := 'id_persona = ' + id_persona;
          Filtered := True;
          nodo.WriteFloat('ingresos',FieldByName('ingresos').AsCurrency);
          nodo.WriteFloat('disponible',FieldByName('disponible').AsCurrency);
          nodo.WriteFloat('deducciones',FieldByName('deducciones').AsCurrency);
          nodo.WriteFloat('valor_cuota',FieldByName('valor_cuota').AsCurrency);
          nodo.WriteFloat('disponibilidad',FieldByName('disp_pago').AsCurrency);
          nodo.WriteInteger('solv_economica',FieldByName('solv_economica').AsInteger);
          nodo.WriteString('exp_creditos',FieldByName('exp_creditos').AsString);
        end;
        nodo := XmlDoc.Root.NodeNew('datos_codeudor');
        with CDcapacidad do// datos generales de los codeudores
        begin
          Filtered := False;
          Filter := 'id_persona <> ' + id_persona;
          Filtered := True;
          while not Eof do
          begin
            nodo1 := nodo.NodeNew('codeudor');
            nodo1.WriteFloat('ingresos',FieldByName('ingresos').AsCurrency);
            nodo1.WriteFloat('disponible',FieldByName('disponible').AsCurrency);
            nodo1.WriteFloat('deducciones',FieldByName('deducciones').AsCurrency);
            nodo1.WriteFloat('valor_cuota',FieldByName('valor_cuota').AsCurrency);
            nodo1.WriteFloat('disponibilidad',FieldByName('disp_pago').AsCurrency);
            nodo1.WriteInteger('solv_economica',FieldByName('solv_economica').AsInteger);
            nodo1.WriteString('exp_creditos',FieldByName('exp_creditos').AsString);
            nodo1.WriteString('id_persona',FieldByName('id_persona').AsString);
            nodo1.WriteString('id_identificacion',FieldByName('id_identificacion').AsString);
            Next;
          end;
        end;
        nodo := XmlDoc.Root.NodeNew('datos_observacion');
        with CDobservacion do
        begin
          Filtered := False;
          Filter := 'id_observacion <> 2';
          Filtered := True;
          while not Eof do
          begin
            nodo1 := nodo.NodeNew('observacion');
            nodo1.WriteInteger('id_observacion',FieldByName('id_observacion').AsInteger);
            nodo1.WriteString('observacion',FieldByName('observacion').AsString);
            Next;
          end;
        end;
        with CDcredito do
        begin
          nodo := Xmldoc.Root.NodeNew('descuentos');
          Filtered := False;
          Filter := 'es_descuento = true';
          Filtered := True;
          while not Eof do
          begin
            nodo.WriteString('colocacion',FieldByName('colocacion').AsString);
            Next;
          end;
        end;
        XmlDoc.SaveToFile('c:\xml_analista.xml');
        CDobservacion.Filtered := False;
        Astream := TStringStream.Create('');
        XmlDoc.SaveToStream(Astream);
        XmlDoc.SaveToFile('c:\xml_actualiza.xml');
        with IdTCPClient1 do
        begin
          Port := puerto_server;
          Host := host_server;
          try
            Connect;
          except
          on e: Exception do
          begin
            MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
            frmProgresoServer.Cerrar;
            Exit;
          end;
          end;
          if Connected then
          begin
            WriteInteger(Astream.Size);
            OpenWriteBuffer;
            WriteStream(Astream);
            CloseWriteBuffer;
            FreeAndNil(Astream);
            tamano := ReadInteger;
            Application.ProcessMessages;
            Astream := TStringStream.Create('');
            ReadStream(Astream,tamano,False);
            // DESCOMPRIME ASTREAM
            AstreamRes := TMemoryStream.Create;
            Astream.Position := 0;
            ZDeCompressStream(Astream,AstreamRes);
            AstreamRes.Seek(0,0);
            Xmlres.LoadFromStream(AstreamRes);
            Disconnect;
          end;
          nodo := Xmlres.Root.NodeByName('solicitud');
          if nodo.ReadBool('actualizado') then
          begin
             frmProgresoServer.Cerrar;
             MessageDlg('Solicitud Actualzada con Exito',mtInformation,[mbok],0);
             with DmSolicitud.IBSolicitud1 do
             begin
               Close;
               if Transaction.InTransaction then
                  Transaction.Commit;
               Transaction.StartTransaction;
               SQL.Clear;
               SQL.Add('insert into "col$registroagencia" values (');
               SQL.Add(':ID_SOLICITUD,:ID_EMPLEADO,:ASOCIADO,:VALOR_SOLICITUD,:FECHA_ANALISIS,:TIPO,:ID_AGENCIA,:ENTE_APROBADOR,:GARANTIA,NULL)');
               ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
               ParamByName('ID_EMPLEADO').AsString := DBAlias;
               ParamByName('ASOCIADO').AsString := JVsolicitante.Caption;
               ParamByName('VALOR_SOLICITUD').AsCurrency := JVvaloraprobado.Value;
               ParamByName('FECHA_ANALISIS').AsDate := Date;
               ParamByName('TIPO').AsString := 'A';
               ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
               ParamByName('ENTE_APROBADOR').AsInteger := -1;
               ParamByName('GARANTIA').AsInteger := id_garantia;
               ExecSQL;
               Transaction.Commit;
              end;

             if DBente.KeyValue = 2 then
             begin
              if MessageDlg('Desea Registrar el Informe Para Comite de Creditos',mtInformation,[mbyes,mbno],0) = mryes then
              begin
                 FrmComCreditosOficina := TFrmComCreditosOficina.Create(self);
                 with FrmComCreditosOficina do
                 begin
                     ob_codeudor := '';
                     Msolicitud.Text := MKsolicitud.Text;
                     if ob_codeudor <> '' then
                       Mcodeudores.Text := ob_codeudor
                     else
                       begin
                         CDcodeudores.Filtered := False;
                         CDcodeudores.Filter := 'numero <> 1000 and numero <> 0';
                         CDcodeudores.Filtered := True;
                         while not CDcodeudores.Eof do
                         begin
                            Mcodeudores.Text := Mcodeudores.Text + CDcodeudores.FieldByName('numero').AsString + '. ' + CDcodeudores.FieldByName('Nombres').AsString + '  ';
                            CDcodeudores.Next;
                         end;
                     end;
                     Mactividad.Text := ob_actividad;
                     Mdesgarantia.Text := ob_garantia;
                     Mabogado.Text := ob_abogado;
                     Minmueble.Text := ob_inmueble;
                     Mconcepto.Text := ob_concepto;
                     Mavaluo.Text := ob_avaluo;
                     JVfecha.Caption := fecha_concepto;
                     JVsolicitante.Caption := solicitante;
                     JVcuenta.Caption := numero_cuenta.Caption;
                     JVoficina.Caption := DBoficina.Text;
                     puerto_agencia := puerto_server;
                     host_agencia_remota := host_server;
                     ShowModal;
                 end;
              end;
            end;
            BTaceptar.Enabled := False;            
            BTreporte.Enabled := True;
            BTreporte.Click;
            TabSheet1.Enabled := false;
            TabSheet2.Enabled := false;
            TabSheet3.Enabled := false;
            PageControl1.Enabled := False;
            BTreporte.SetFocus;
          end
          else
          begin
            MessageDlg('Ha Ocurrido un Error Mientras se Actualizaban los Datos',mtInformation,[mbok],0);
            Exit;
          end;
        end;
        //Exit;
        //Astream := TStringStream.Create('');
        //XmlDoc.SaveToStream(Astream);

end;

procedure TFrmAnalisisOficina.BTaceptarClick(Sender: TObject);
begin
        fecha_concepto := JVfecha.Caption;
        solicitante := JVsolicitante.Caption;
        if (LineaBancoldex <> '') and (JVvaloraprobado.Value > SaldoBancoldex) then
         begin
           MessageDlg('No se puede Aprobar porque Supera el Saldo Bancoldex',mtError,[mbok],0);
           BTnuevo.Click;
         end;
        with CDobservacion do
        begin
           CancelUpdates;
           if Manalisis.Text <> '' then
           begin
             Append;
             FieldValues['id_observacion'] := 2;
             FieldValues['observacion'] := observacion;
             FieldValues['descripcion'] := 'CONCEPTO ENTREVISTA';
             Post;
           end;
           if Manalisis.Text <> '' then
           begin
             Append;
             FieldValues['id_observacion'] := 1;
             FieldValues['observacion'] := Manalisis.Text;
             FieldValues['descripcion'] := 'OBSERVACIONES ANALISIS DE PAGO';
             Post;
           end;

           if Mobservacion.Text <> '' then
           begin
             Append;
             FieldValues['id_observacion'] :=  3;
             FieldValues['observacion'] := Mobservacion.Text;
             FieldValues['descripcion'] := 'OBSERVACIONES ANALISTA';
             Post;
           end;
           if Mconcepto.Text <> '' then
           begin
             Append;
             FieldValues['id_observacion'] :=   4;
             FieldValues['observacion'] := Mconcepto.Text;
             FieldValues['descripcion'] := 'CONCEPTO FINAL ANALISTA';
             Post;
           end;
           if Mrecomendaciones.Text <> '' then
           begin
             Append;
             FieldValues['id_observacion'] := 5;
             FieldValues['observacion'] := Mrecomendaciones.Text;
             FieldValues['descripcion'] := 'RECOMENDACIONES ESPECIALES';
             Post;
           end;
           CDobservacion.IndexFieldNames := 'id_observacion';
        end;

        if (DBinversion.KeyValue = 0) or (DBclasificacion.KeyValue = 0) then
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
          //if estado
          estado_solicitud := DBente.KeyValue + 1;
        except
        begin
          MessageDlg('Debe Selecionar un Ente Aprobador',mtWarning,[mbok],0);
          PageControl1.ActivePageIndex := 1;
          DBente.SetFocus;
          Exit;
        end;
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
          begin
            valida_tcp := False;
            frmProgresoServer := TfrmProgresoServer.Create(self);
            frmProgresoServer.Info.Caption := 'Enviando...';
            frmProgresoServer.Ejecutar;
            Application.ProcessMessages;
            datos_analisis;
            BTaceptar.Enabled := False;
          end
          else
             Exit;
          end;
end;

procedure TFrmAnalisisOficina.JVdeduccionesExit(Sender: TObject);
begin
        JVdisponible.Value := JVingresos.Value - JVdeducciones.Value;
end;

procedure TFrmAnalisisOficina.JVdisponibleExit(Sender: TObject);
begin
        JVdispago.Value := 0.3 * JVdisponible.Value;
end;

procedure TFrmAnalisisOficina.JVcuotaExit(Sender: TObject);
begin
        if JVcuota.Value <= JVdispago.Value then
           JvSolvencia.Checked := true
        else
           JvSolvencia.Checked := False;
end;

procedure TFrmAnalisisOficina.actualizar;
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
          DBente.KeyValue := FieldByName('ENTE_APROBADOR').AsInteger;
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

procedure TFrmAnalisisOficina.BTcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmAnalisisOficina.reg_observacion(id_observacion: integer;
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
           Open;
           SQL.Clear;
           SQL.Add('insert into "col$observacion"');
           SQL.Add('values(:ID_SOLICITUD,:ID_OBSERVACION,:OBSERVACION)');
           ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
           ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
           ParamByName('OBSERVACION').AsString := concepto;
           Open;
           Close;
           Transaction.Commit;
        end;

end;

function TFrmAnalisisOficina.busca_observacion(
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

procedure TFrmAnalisisOficina.DBcolocacionDblClick(Sender: TObject);
begin
        CDvalidacol.Filtered := False;
        CDvalidacol.Filter := 'id_colocacion = ' + CDcreditocolocacion.Value;
        CDvalidacol.Filtered := True;
        if CDvalidacol.FieldByName('id_colocacion').AsString <> '' then
           CDvalidacol.Delete;
        if control_credito then
        begin
        CDcredito.Edit;
        CDvalidacol.Append;
        CDvalidacol.FieldValues['id_colocacion'] := CDcreditocolocacion.Value;
        if CDcreditocriterio.Value  = 'NO' then
        begin
          CDcreditocriterio.Value :='SI';
          CDcreditoes_descuento.Value := True;
          CDvalidacol.FieldValues['valida'] := True;
        end
        else
        begin
          CDcreditocriterio.Value :='NO';
          CDcreditoes_descuento.Value := False;
          CDvalidacol.FieldValues['valida'] := False;
        end;
          CDcredito.Post;
          CDvalidacol.Post;
        end;
end;

function TFrmAnalisisOficina.extrae_credito(id_colocacion,
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

procedure TFrmAnalisisOficina.MKsolicitudKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,Self)
end;

procedure TFrmAnalisisOficina.VerInformacionGeneral1Click(Sender: TObject);
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
          end;
        end;
end;

procedure TFrmAnalisisOficina.VerInformacinGeneral1Click(Sender: TObject);
begin
            frmConsultaProductos := TfrmConsultaProductos.Create(self);
            frmConsultaProductos.id_identificacion_sol := CDcodeudoresid_identificacion.Value;
            frmConsultaProductos.id_persona_sol := CDcodeudoresid_persona.Value;
            frmConsultaProductos.ShowModal;

end;

procedure TFrmAnalisisOficina.DBclasificacionExit(Sender: TObject);
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

procedure TFrmAnalisisOficina.DBinversionExit(Sender: TObject);
begin
//        if DBclasificacion.KeyValue = 4 then
//           DBinversion.KeyValue := 1;
end;

procedure TFrmAnalisisOficina.MKsolicitudExit(Sender: TObject);
begin
{        if DBoficina.KeyValue = 2 then
        begin
          host_server := host_abrego;
          puerto_server := puerto_abrego;
        end;
        if DBoficina.KeyValue = 3 then
        begin
          host_server := host_convencion;
          puerto_server := puerto_convencion;
        end;
        if DBoficina.KeyValue = 4 then
        begin
          host_server := host_aguachica;
          puerto_server := puerto_convencion;
        end;  }
        host_server := BuscaServicio(DBoficina.KeyValue,4).vHost;
        puerto_server := BuscaServicio(DBoficina.KeyValue,4).vPuerto;


end;

procedure TFrmAnalisisOficina.actualiza_solicitud;
begin

end;

procedure TFrmAnalisisOficina.JVingresosEnter(Sender: TObject);
begin
        JVingresos.SelectAll
end;

procedure TFrmAnalisisOficina.JVdeduccionesEnter(Sender: TObject);
begin
        JVdeducciones.SelectAll
end;

procedure TFrmAnalisisOficina.JVdisponibleEnter(Sender: TObject);
begin
        JVdisponible.SelectAll
end;

procedure TFrmAnalisisOficina.JVdispagoEnter(Sender: TObject);
begin
        JVdispago.SelectAll
end;

procedure TFrmAnalisisOficina.JVcuotaEnter(Sender: TObject);
begin
        JVcuota.SelectAll
end;

procedure TFrmAnalisisOficina.JVvaloraprobadoEnter(Sender: TObject);
begin
        JVvaloraprobado.SelectAll
end;

procedure TFrmAnalisisOficina.JVplazoaprobadoEnter(Sender: TObject);
begin
        JVplazoaprobado.SelectAll
end;

procedure TFrmAnalisisOficina.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
        if valida_tcp then
        begin
          AWorkMode := wmRead;
          frmProgreso.Position := AWorkCount;
          frmProgreso.InfoLabel := 'Kbs Recibidos : ' + currToStr(AWorkCount/1000);
          Application.ProcessMessages;
        end;
end;

procedure TFrmAnalisisOficina.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
        if valida_tcp then
        begin
          AWorkMode := wmRead;
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Titulo := 'Recibiendo Informacion ' + DBoficina.Text + ' Tamaño: ' + CurrToStr(AWorkCountMax/1000) + ' Kbs' ;
          Application.ProcessMessages;
        end;
end;

function TFrmAnalisisOficina.Valida: boolean;
begin
end;

procedure TFrmAnalisisOficina.BitBtn7Click(Sender: TObject);
begin
        if LineaBancoldex <> '' then
          frmInformacionBancoldex.ShowModal
        else
          MessageDlg('Esta Solicitud No se Diligenció con Recursos Bancoldex',mtError,[mbok],0);
end;

end.

