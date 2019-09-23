unit UnitConsultaProductosAg;

interface

uses
  Windows, Messages, Clipbrd, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  JvComponent,JvSplit, ExtCtrls, ComCtrls, JvComCtrls, StdCtrls,
  JvGroupBox, DBCtrls, JvStaticText, JvEdit, JvTypedEdit, JvFloatEdit,
  IBSQL, DB, IBCustomDataSet, Buttons, ImgList, Grids, DBGrids, JvDBCtrl,
  IBQuery, JvEnterTab,DateUtils, XStringGrid, JvLabel, JvBlinkingLabel,
  dbcgrids, Menus, IBDatabase, ADODB,sdXmlDocuments, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, DBClient,JclSysUtils;

type
  TfrmConsultaProductosAg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PanelTree: TPanel;
    splitter: TJvxSplitter;
    PanelDatos: TPanel;
    JvGroupBox1: TJvGroupBox;
    PageBuscar: TJvPageControl;
    Tab1: TTabSheet;
    EdNombre: TJvStaticText;
    Label1: TLabel;
    CBtiposid: TDBLookupComboBox;
    Label2: TLabel;
    EdNumeroIdentificacion: TMemo;
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
    EnterAsTab: TJvEnterAsTab;
    CmdActualizar1: TBitBtn;
    cmdBuscar: TJvBlinkingLabel;
    ImageCap: TImageList;
    IdTCPClient1: TIdTCPClient;
    Arbol: TJvTreeView;
    DSTiposId: TDataSource;
    IbTipoId: TIBQuery;
    IBTransaction1: TIBTransaction;
    Panel5: TPanel;
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
    GroupBox5: TGroupBox;
    Label84: TLabel;
    Label85: TLabel;
    EDempleado_act: TJvStaticText;
    EDfecha_act: TJvStaticText;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    IBAgencias: TIBQuery;
    cdPersona: TClientDataSet;
    cdPersonaTPERSONA: TStringField;
    cdPersonaECIVIL: TStringField;
    cdPersonaSEXO: TStringField;
    cdPersonaFECHAN: TDateField;
    cdPersonaTIPOA: TStringField;
    cdPersonaEDUCACION: TSmallintField;
    cdPersonaPROFESION: TStringField;
    cdPersonaEMPRESA: TStringField;
    cdPersonaFECHAE: TDateField;
    cdPersonaCARGO: TStringField;
    cdPersonaRETENCION: TSmallintField;
    cdPersonaACTIVO: TCurrencyField;
    cdPersonaPASIVO: TCurrencyField;
    cdPersonaFECHAACT: TDateField;
    cdPersonaNOMBRE: TStringField;
    cdPersonaAGENCIA: TSmallintField;
    IBQuery1: TIBQuery;
    cdPersonaLUGARN: TStringField;
    cdPersonaFECHAA: TStringField;
    cdCaptacion: TClientDataSet;
    cdCaptacionNUMERO: TStringField;
    cdCaptacionSALDOA: TCurrencyField;
    cdCaptacionCANJE: TCurrencyField;
    cdCaptacionDISPONIBLE: TCurrencyField;
    cdCaptacionESTADO: TStringField;
    DsCaptacion: TDataSource;
    cdCaptacionAGENCIA: TSmallintField;
    GroupBox1: TGroupBox;
    dbCaptacion: TDBGrid;
    GroupBox2: TGroupBox;
    GroupBox6: TGroupBox;
    CdCuenta: TClientDataSet;
    StringField1: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    StringField2: TStringField;
    cdCaptacionTIPO: TSmallintField;
    cdCaptacionVESTADO: TSmallintField;
    CdCuentaVESTADO: TSmallintField;
    cdColocacion: TClientDataSet;
    cdColocacionCOLOCACION: TStringField;
    cdColocacionVALOR: TCurrencyField;
    cdColocacionSALDO: TCurrencyField;
    cdColocacionFINTERES: TDateField;
    cdColocacionESTADO: TStringField;
    cdColocacionVESTADO: TStringField;
    cdColocacionFCAPITAL: TDateField;
    cdColocacionCUOTA: TStringField;
    cdPersonaEMPLEADO: TStringField;
    dbColocacion: TDBGrid;
    CdCol: TClientDataSet;
    StringField3: TStringField;
    CurrencyField4: TCurrencyField;
    CurrencyField5: TCurrencyField;
    DateField1: TDateField;
    StringField4: TStringField;
    StringField5: TStringField;
    DateField2: TDateField;
    StringField6: TStringField;
    cdColocacionAGENCIA: TSmallintField;
    DsColocacion: TDataSource;
    cdFianzas: TClientDataSet;
    StringField7: TStringField;
    CurrencyField6: TCurrencyField;
    CurrencyField7: TCurrencyField;
    DateField3: TDateField;
    StringField8: TStringField;
    StringField9: TStringField;
    DateField4: TDateField;
    StringField10: TStringField;
    cdFianzasNOMBRE: TStringField;
    cdF: TClientDataSet;
    StringField11: TStringField;
    CurrencyField8: TCurrencyField;
    CurrencyField9: TCurrencyField;
    DateField5: TDateField;
    StringField12: TStringField;
    StringField13: TStringField;
    DateField6: TDateField;
    StringField14: TStringField;
    StringField15: TStringField;
    dsFianzas: TDataSource;
    dbFinzas: TDBGrid;
    cdFianzasAGENCIA: TSmallintField;
    cdSolicitud: TClientDataSet;
    cdSolicitudSOLICITUD: TStringField;
    cdSolicitudVALOR: TCurrencyField;
    cdSolicitudESTADO: TStringField;
    cdSolicitudVESTADO: TSmallintField;
    cdSolicitudFECHA: TDateField;
    cdSol: TClientDataSet;
    StringField16: TStringField;
    CurrencyField10: TCurrencyField;
    StringField17: TStringField;
    SmallintField1: TSmallintField;
    DateField7: TDateField;
    DsSol: TDataSource;
    dbSolicitud: TDBGrid;
    cdSolicitudAGENCIA: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure CmdActualizar1Click(Sender: TObject);
    procedure ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure dbCaptacionDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CmdOtroClick(Sender: TObject);
    procedure dbColocacionDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbFinzasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure dbSolicitudDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    vContador :Integer;
    nodo,nodo1 :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;
    sentencia: string;
    function vTipo(IdTipo, Cod: integer): string;
    function bEmpleado(vAlias: string): string;
    function bEstado(estado,tipo: integer): string;
    procedure Limpiar;

    { Private declarations }
  public
  published
    procedure Inicio;
    procedure Remoto(vHost, Desc: string; vPuerto,vIdAgencia: integer);
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
end;


var
  frmConsultaProductosAg: TfrmConsultaProductosAg;
    vididentificacion:Integer;
  vidpersona:string;
  arbolinfo:TProductos;
  arbolsinfo:TServicios;
  NodoAg : Array[0..10] of TTreeNode;
  NodoSe: Array[0..10] of TTreeNode;
  NodoOb: array[0..10] of TTreeNode;
  NodoSo: array[0..10] of TTreeNode;
  NodoOt: array[0..10] of TTreeNode;
  NodoAnt : Integer;
  vTotAportaciones:Currency;
  vTotCaptaciones:Currency;
  vTotColocaciones:Currency;
  vTotFianzas:Currency;



implementation
uses
UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TfrmConsultaProductosAg.Inicio;
var I :Integer;
begin
        with IbTipoId do
        begin
          IbTipoId.Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          IbTipoId.Open;
          IbTipoId.Last;
        end;
        PageBuscar.Enabled := True;
        PageBuscar.ActivePage := Tab1;
        PageControl2.ActivePageIndex := 0;
        PageControl2.Enabled := False;
        //CBtiposid.SetFocus;
        EdNumeroIdentificacion.Text := '';
        CmdBuscar.Enabled := True;
        EdNombre.Caption := '';
        EDfecha_act.Caption := '';
        EDempleado_act.Caption := '';
        Arbol.Items.Clear;
        Arbol.Enabled := False;
        NodoAg[0] := Arbol.Items.Add(nil,'Agencias');
        vTotAportaciones:=0;
        vTotCaptaciones:=0;
        vTotColocaciones:=0;
        vTotFianzas:=0;
        EdTotalAportaciones.Caption := '';
        EdTotalCaptaciones.Caption := '';
        EdTotalColocaciones.Caption := '';
        EdTotalFianzas.Caption := '';
        CdCuenta.CancelUpdates;
        cdCaptacion.CancelUpdates;
        cdColocacion.CancelUpdates;
        cdFianzas.CancelUpdates;
        cdPersona.CancelUpdates;
        cdSolicitud.CancelUpdates;
end;

procedure TfrmConsultaProductosAg.FormCreate(Sender: TObject);
begin
        Inicio
end;

procedure TfrmConsultaProductosAg.Remoto(vHost, Desc: string;
  vPuerto,vIdAgencia: Integer);
var      cadena :string;
         AList,AListCampos:TList;
         i :Integer;
         vSexo :string;
         vEstado :Boolean;
begin
      try
        vEstado := True;
        XmlPetc := TsdXmlDocument.CreateName('query_info');
        XmlPetc.XmlFormat := xfReadable;
        Nodo := XmlPetc.Root.NodeNew('querys');
        sentencia := 'select * from CON_PERSONA(' + '''' + EdNumeroIdentificacion.Text + '''' + ',' + IntToStr(CBtiposid.KeyValue) + ',' + IntToStr(vIdAgencia) + ')';
        nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        sentencia := 'SELECT * FROM CON_CAPTACION(' + '''' + EdNumeroIdentificacion.Text + '''' + ',' + IntToStr(CBtiposid.KeyValue) + ',' + IntToStr(vIdAgencia) + ')';
        nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        sentencia := 'SELECT * FROM CON_COLOCACION(' + '''' + EdNumeroIdentificacion.Text + '''' + ',' + IntToStr(CBtiposid.KeyValue) + ',' + IntToStr(vIdAgencia) + ')';
        nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        sentencia := 'SELECT * FROM CON_FIANZAS(' + '''' + EdNumeroIdentificacion.Text + '''' + ',' + IntToStr(CBtiposid.KeyValue) + ',' + IntToStr(vIdAgencia) + ')';
        nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        sentencia := 'SELECT * FROM CON_SOLICITUD(' + '''' + EdNumeroIdentificacion.Text + '''' + ',' + IntToStr(CBtiposid.KeyValue) + ',' + IntToStr(vIdAgencia) + ')';
        nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        XmlresC := TsdXmlDocument.Create;
        XmlresC.EncodingString := 'ISO8859-1';
        XmlresC.XmlFormat := xfReadable;
        Astream := TMemoryStream.Create;
        XmlPetC.SaveToStream(Astream);
        with IdTCPClient1 do
        begin
          Port := vPuerto;
          Host := vHost;
          try
            Application.ProcessMessages;
            Connect;
          if Connected then
          begin
            frmProgreso := TfrmProgreso.Create(self);
            frmProgreso.Titulo := 'Recibiendo Informacion de ' + Desc;
            frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
            Application.ProcessMessages;
            frmProgreso.Position := 2;
            frmProgreso.Min := 0;
            frmProgreso.Ejecutar;
            Cadena := ReadLn();
            AStream := TMemoryStream.Create;
            XmlPetC.SaveToStream(AStream);
            WriteInteger(AStream.Size);
            OpenWriteBuffer;
            WriteStream(AStream);
            CloseWriteBuffer;
            FreeAndNil(AStream);
            tamano := ReadInteger;
            AStream := TMemoryStream.Create;
            ReadStream(Astream,tamano,False);
            XmlResc.LoadFromStream(AStream);
            XmlresC.SaveToFile('c:\Agencia' + IntToStr(vIdAgencia) + '.xml');
            Disconnect;
            frmProgreso.Cerrar;
          end;
          except
          on e: Exception do
          begin
            Application.ProcessMessages;
            //MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
            frmProgreso.Cerrar;
            vEstado := False;
            Disconnect;
            arbolinfo := TProductos.Create;
            arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
            arbolinfo.nombre := Desc;
            arbolinfo.tipo := 0;
            arbolinfo.numero := '';
            arbolinfo.agencia := vIdAgencia;
            arbolinfo.digito := 0;
            arbolinfo.nivel := 2;
            NodoAg[vContador] := Arbol.Items.AddChildObject(nodoag[0],Desc + '- No Hay Comunicación',arbolinfo);
            NodoAg[vContador].ImageIndex := 5;
            vContador := vContador + 1;
            Exit;
          end;
          end; // fin del try

        end;

           AList := TList.Create;//INFORMACION GENERAL
           Nodo := XmlResc.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           vEstado := False;
           try
             for i := 0 to AList.Count -1 do // ,SE CARGA EL EXTRACTO
             begin
                vEstado := True;
                AListCampos := TList.Create;
                TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                cdPersona.Append;
                cdPersona.FieldValues['TPERSONA'] := vTipo(1,(TXmlNode(AListCampos[0]).ValueAsInteger));
                cdPersona.FieldValues['ECIVIL'] := vTipo(2,(TXmlNode(AListCampos[1]).ValueAsInteger));
                vSexo := TXmlNode(AListCampos[2]).ValueAsString;
                if vSexo = 'M' then vSexo := 'MASCULINO'
                else if vSexo = 'F' then vSexo := 'FEMENINO'
                else vSexo := 'OTRO';
                cdPersona.FieldValues['SEXO'] := vSexo;
                cdPersona.FieldValues['FECHAN'] := TXmlNode(AListCampos[3]).ValueAsDateTime;
                cdPersona.FieldValues['LUGARN'] := TXmlNode(AListCampos[4]).ValueAsString;
                cdPersona.FieldValues['TIPOA'] := vTipo(3,(TXmlNode(AListCampos[5]).ValueAsInteger));
                cdPersona.FieldValues['FECHAA'] := TXmlNode(AListCampos[6]).ValueAsString;
                cdPersona.FieldValues['EDUCACION'] := TXmlNode(AListCampos[7]).ValueAsInteger;
                cdPersona.FieldValues['PROFESION'] := TXmlNode(AListCampos[8]).ValueAsString;
                cdPersona.FieldValues['EMPRESA'] := TXmlNode(AListCampos[9]).ValueAsString;
                try
                  cdPersona.FieldValues['FECHAE'] := TXmlNode(AListCampos[10]).ValueAsDateTime;
                except
                  cdPersonafechae.IsNull;
                end;
                cdPersona.FieldValues['CARGO'] := TXmlNode(AListCampos[11]).ValueAsString;
                cdPersona.FieldValues['RETENCION'] := TXmlNode(AListCampos[12]).ValueAsInteger;
                cdPersona.FieldValues['ACTIVO'] := TXmlNode(AListCampos[13]).ValueAsFloat;
                cdPersona.FieldValues['PASIVO'] := TXmlNode(AListCampos[14]).ValueAsFloat;
                cdPersona.FieldValues['EMPLEADO'] := TXmlNode(AListCampos[15]).ValueAsString;
                try
                  cdPersona.FieldValues['FECHAACT'] := TXmlNode(AListCampos[16]).ValueAsDateTime;
                except
                  cdPersonaFECHAACT.IsNull;
                end;
                cdPersona.FieldValues['NOMBRE'] := TXmlNode(AListCampos[17]).ValueAsString;
                cdPersona.FieldValues['AGENCIA'] := vIdAgencia;
                cdPersona.Post;
             end;
             try
               AList := TList.Create; // INFORMACION DE CAPTACIONES
               Nodo := XmlResc.Root.NodeByName('consulta001');
               Nodo.NodesByName('Registro',AList);
               for i := 0 to AList.Count -1 do
               begin
                  AListCampos := TList.Create;
                  TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                  cdCaptacion.Append;
                  cdCaptacion.FieldValues['NUMERO'] := TXmlNode(AListCampos[5]).ValueAsString + FormatCurr('000000',TXmlNode(AListCampos[0]).ValueAsFloat);
                  cdCaptacion.FieldValues['SALDOA'] := TXmlNode(AListCampos[1]).ValueAsFloat;
                  cdCaptacion.FieldValues['CANJE'] := TXmlNode(AListCampos[3]).ValueAsFloat;
                  cdCaptacion.FieldValues['DISPONIBLE'] := TXmlNode(AListCampos[2]).ValueAsFloat;
                  cdCaptacion.FieldValues['ESTADO'] := bEstado(TXmlNode(AListCampos[4]).ValueAsInteger,1);
                  cdCaptacion.FieldValues['AGENCIA'] := vIdAgencia;
                  cdCaptacion.FieldValues['TIPO'] := TXmlNode(AListCampos[6]).ValueAsInteger;
                  cdCaptacion.FieldValues['VESTADO'] := TXmlNode(AListCampos[4]).ValueAsInteger;
                  cdCaptacion.post;
               end;
             except
               cdCaptacion.CancelUpdates;
             end;
             try
               AList := TList.Create; // INFORMACION DE COLOCACIONES
               Nodo := XmlResc.Root.NodeByName('consulta002');
               Nodo.NodesByName('Registro',AList);
               for i := 0 to AList.Count -1 do
               begin
                  AListCampos := TList.Create;
                  TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                  cdColocacion.Append;
                  cdColocacion.FieldValues['COLOCACION'] := TXmlNode(AListCampos[0]).ValueAsString;
                  cdColocacion.FieldValues['VALOR'] := TXmlNode(AListCampos[1]).ValueAsFloat;
                  cdColocacion.FieldValues['SALDO'] := TXmlNode(AListCampos[2]).ValueAsFloat;
                  cdColocacion.FieldValues['FINTERES'] := TXmlNode(AListCampos[3]).ValueAsDateTime;
                  cdColocacion.FieldValues['ESTADO'] := bEstado(TXmlNode(AListCampos[4]).ValueAsInteger,2);
                  try
                    cdColocacion.FieldValues['FCAPITAL'] := TXmlNode(AListCampos[5]).ValueAsDateTime;
                  except
                    cdColocacionFCAPITAL.IsNull;
                  end;
                  cdColocacion.FieldValues['CUOTA'] := bEstado(TXmlNode(AListCampos[6]).ValueAsInteger,4);
                  cdColocacion.FieldValues['VESTADO'] := TXmlNode(AListCampos[4]).ValueAsInteger;
                  cdColocacion.FieldValues['AGENCIA'] := vIdAgencia;
                  cdColocacion.post;
               end;
             except
               cdColocacion.CancelUpdates;
             end;
             try
               AList := TList.Create; // INFORMACION DE FIANZAS
               Nodo := XmlResc.Root.NodeByName('consulta003');
               Nodo.NodesByName('Registro',AList);
               for i := 0 to AList.Count -1 do
               begin
                  AListCampos := TList.Create;
                  TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                  cdFianzas.Append;
                  cdFianzas.FieldValues['COLOCACION'] := TXmlNode(AListCampos[0]).ValueAsString;
                  cdFianzas.FieldValues['VALOR'] := TXmlNode(AListCampos[1]).ValueAsFloat;
                  cdFianzas.FieldValues['SALDO'] := TXmlNode(AListCampos[2]).ValueAsFloat;
                  cdFianzas.FieldValues['FINTERES'] := TXmlNode(AListCampos[3]).ValueAsDateTime;
                  cdFianzas.FieldValues['ESTADO'] := bEstado(TXmlNode(AListCampos[4]).ValueAsInteger,2);
                  cdFianzas.FieldValues['FCAPITAL'] := TXmlNode(AListCampos[5]).ValueAsDateTime;
                  cdFianzas.FieldValues['CUOTA'] := bEstado(TXmlNode(AListCampos[6]).ValueAsInteger,4);
                  cdFianzas.FieldValues['VESTADO'] := TXmlNode(AListCampos[4]).ValueAsInteger;
                  cdFianzas.FieldValues['AGENCIA'] := vIdAgencia;
                  cdFianzas.FieldValues['NOMBRE'] := TXmlNode(AListCampos[7]).ValueAsString;
                  cdFianzas.post;
               end;
             except
               cdFianzas.CancelUpdates;
             end;
             try
               AList := TList.Create; // INFORMACION DE SOLICITUDES
               Nodo := XmlResc.Root.NodeByName('consulta004');
               Nodo.NodesByName('Registro',AList);
               for i := 0 to AList.Count -1 do
               begin
                  AListCampos := TList.Create;
                  TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                  cdSolicitud.Append;
                  cdSolicitud.FieldValues['SOLICITUD'] := TXmlNode(AListCampos[0]).ValueAsString;
                  cdSolicitud.FieldValues['VALOR'] := TXmlNode(AListCampos[1]).ValueAsFloat;
                  cdSolicitud.FieldValues['ESTADO'] := bEstado(TXmlNode(AListCampos[2]).ValueAsInteger,3);
                  cdSolicitud.FieldValues['FECHA'] := TXmlNode(AListCampos[3]).ValueAsDateTime;
                  cdSolicitud.FieldValues['VESTADO'] := TXmlNode(AListCampos[2]).ValueAsInteger;
                  cdSolicitud.FieldValues['AGENCIA'] := vIdAgencia;
                  cdSolicitud.post;
               end;
             except
               cdSolicitud.CancelUpdates;
             end;
         //end;
         {if JvNombre.Caption = '' then
            MessageDlg('No se Encontraron Datos para Esta Cuenta',mtinformation,[mbok],0);}
           if vEstado then
           begin
             arbolinfo := TProductos.Create;
             arbolinfo.forma := 0; //FieldByName('ID_FORMA').AsInteger;
             arbolinfo.nombre := Desc;
             arbolinfo.tipo := 0;
             arbolinfo.numero := '';
             arbolinfo.agencia := vIdAgencia;
             arbolinfo.digito := 0;
             arbolinfo.nivel := 2;
             NodoAg[vContador] := Arbol.Items.AddChildObject(nodoag[0],Desc,arbolinfo);
             NodoAg[vContador].ImageIndex := 5;
             vContador := vContador + 1;
          end;
         except
         end;
        except
        on e: Exception do
        begin
          ShowMessage('Error Interno, con Mensaje: ' + e.Message );
        end;
        end;
end;

procedure TfrmConsultaProductosAg.CmdActualizar1Click(Sender: TObject);
begin
        PageBuscar.Enabled := False;
        PageControl2.Enabled := True;
        vContador := 1;
        with IBAgencias do
        begin
          Close;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          while not Eof do
          begin
             //if FieldByName('ID_AGENCIA').AsInteger = 1 then
             remoto(FieldByName('ID_HOST').AsString,FieldByName('DESCRIPCION_AGENCIA').AsString,FieldByName('ID_PUERTO').AsInteger,FieldByName('ID_AGENCIA').AsInteger);
             Next;
          end;
        end;
        if vContador > 1 then
          Arbol.Enabled := True;
end;

function TfrmConsultaProductosAg.vTipo(IdTipo, Cod: integer): string;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          case IdTipo of
          1: begin
               SQL.Add('SELECT ');
               SQL.Add('  DESCRIPCION_PERSONA AS DESCRIPCION');
               SQL.Add('FROM');
               SQL.Add(' "gen$tipospersona"');
               SQL.Add('WHERE');
               SQL.Add('  (ID_TIPO_PERSONA = :ID)');
             end;
          2: begin
               SQL.Add('SELECT ');
               SQL.Add('  DESCRIPCION_ESTADO_CIVIL AS DESCRIPCION');
               SQL.Add('FROM');
               SQL.Add(' "gen$tiposestadocivil"');
               SQL.Add('WHERE');
               SQL.Add('  (ID_TIPO_ESTADO_CIVIL = :ID)');
              end;
          3: begin
               SQL.Add('SELECT ');
               SQL.Add('  DESCRIPCION_RELACION AS DESCRIPCION');
               SQL.Add('FROM');
               SQL.Add(' "gen$tiposrelacion"');
               SQL.Add('WHERE');
               SQL.Add('  (ID_TIPO_RELACION = :ID)');
             end;
          end;
          ParamByName('ID').AsInteger := Cod;
          Open;
          Result := FieldByName('DESCRIPCION').AsString;
        end;
end;

procedure TfrmConsultaProductosAg.ArbolChange(Sender: TObject;
  Node: TTreeNode);
begin
        limpiar;
        try
          // INFORMACION GENERAL
          cdPersona.Filtered := False;
          cdPersona.Filter := 'AGENCIA = ' + IntToStr(TProductos(Node.Data).agencia);
          cdPersona.Filtered := True;
          EdNombre.Caption := cdPersonaNOMBRE.Value;
          EdTipoPersona.Caption := cdPersonaTPERSONA.Value;
          EdEstadoCivil.Caption := cdPersonaECIVIL.Value;
          EdSexo.Caption := cdPersonaSEXO.Value;
          EdFechaNacimiento.Caption := DateToStr(cdPersonaFECHAN.Value);
          EdLugarNacimiento.Caption := cdPersonaLUGARN.Value;
          EdTipoAfiliacion.Caption := cdPersonaTIPOA.Value;
          EdFechaAfiliacion.Caption := CDPERSONAFECHAA.Value;
          EdEstudio.Checked := IntToBool(cdPersonaEDUCACION.Value);
          EdProfesion.Caption := cdPersonaPROFESION.Value;
          EdEmpresa.Caption := cdPersonaEMPRESA.Value;
          EdCargo.Caption := cdPersonaCARGO.Value;
          EdFechaIngreso.Caption := DateToStr(cdpersonafechae.Value);
          EdTotalActivos.Caption := currtostrf(cdPersonaACTIVO.Value,ffcurrency,0);
          EdTotalPasivos.Caption := currtostrf(cdPersonaPASIVO.Value,ffcurrency,0);
          EDempleado_act.Caption := cdPersonaEMPLEADO.Value;
          EDfecha_act.Caption := DateToStr(cdpersonafechaact.Value);
          EdRetefuente.Checked := IntToBool(cdPersonaRETENCION.Value);
          vTotCaptaciones := 0;
          vTotAportaciones := 0;
          vTotColocaciones := 0;
          vTotFianzas := 0;
          with cdCaptacion do
          begin
            First; // INFORMACION DE CAPTACIONES
            Filtered := False;
            Filter := 'AGENCIA = ' + IntToStr(TProductos(Node.Data).agencia);
            Filtered := True;
            while not Eof do
            begin
              CdCuenta.Append;
              CdCuenta.FieldValues['NUMERO'] := FieldByName('NUMERO').AsString;
              CdCuenta.FieldValues['SALDOA'] := FieldByName('SALDOA').AsCurrency;
              CdCuenta.FieldValues['CANJE'] := FieldByName('CANJE').AsCurrency;
              CdCuenta.FieldValues['DISPONIBLE'] := FieldByName('DISPONIBLE').AsCurrency;
              CdCuenta.FieldValues['ESTADO'] := FieldByName('ESTADO').AsString;
              CdCuenta.FieldValues['VESTADO'] := FieldByName('VESTADO').AsInteger;
              if FieldByName('TIPO').AsInteger = 1 then
                 vTotAportaciones := vTotAportaciones + FieldByName('SALDOA').AsCurrency
              else
                 vTotCaptaciones := vTotCaptaciones + FieldByName('SALDOA').AsCurrency;
              Next;
            end;// FIN DEL WHILE
          end; // FIN DEL WITH
          EdTotalAportaciones.Caption := CurrToStrf(vTotAportaciones,ffcurrency,0);
          EdTotalCaptaciones.Caption := CurrToStrf(vTotCaptaciones,ffCurrency,0);
          with cdColocacion do
          begin
            First; // INFORMACION COLOCACIONES
            Filtered := False;
            Filter := 'AGENCIA = ' + IntToStr(TProductos(Node.Data).agencia);
            Filtered := True;
            while not Eof do
            begin
              CdCol.Append;
              CdCol.FieldValues['COLOCACION'] := FieldByName('COLOCACION').AsString;
              CdCol.FieldValues['VALOR'] := FieldByName('VALOR').AsCurrency;
              CdCol.FieldValues['SALDO'] := FieldByName('SALDO').AsCurrency;
              CdCol.FieldValues['FINTERES'] := FieldByName('FINTERES').AsDateTime;
              CdCol.FieldValues['ESTADO'] := FieldByName('ESTADO').AsString;
              CdCol.FieldValues['FCAPITAL'] := FieldByName('FCAPITAL').AsDateTime;
              CdCol.FieldValues['CUOTA'] := FieldByName('CUOTA').AsString;
              CdCol.FieldValues['VESTADO'] := FieldByName('VESTADO').AsInteger;
              CdCol.Post;
              if FieldByName('VESTADO').AsInteger <> 5 then
                  vTotColocaciones := vTotColocaciones + FieldByName('SALDO').AsCurrency;
              Next;
            end; // FIN DEL WHILE
          end;// FIN DEL WITH
          EdTotalColocaciones.Caption := CurrToStrF(vTotColocaciones,ffCurrency,0);
          with cdFianzas do
          begin
            First; // INFORMACION FIANZAS
            Filtered := False;
            Filter := 'AGENCIA = ' + IntToStr(TProductos(Node.Data).agencia);
            Filtered := True;
            while not Eof do
            begin
              cdF.Append;
              cdF.FieldValues['COLOCACION'] := FieldByName('COLOCACION').AsString;
              cdF.FieldValues['VALOR'] := FieldByName('VALOR').AsCurrency;
              cdF.FieldValues['SALDO'] := FieldByName('SALDO').AsCurrency;
              cdF.FieldValues['FINTERES'] := FieldByName('FINTERES').AsDateTime;
              cdF.FieldValues['ESTADO'] := FieldByName('ESTADO').AsString;
              cdF.FieldValues['FCAPITAL'] := FieldByName('FCAPITAL').AsDateTime;
              cdF.FieldValues['CUOTA'] := FieldByName('CUOTA').AsString;
              cdF.FieldValues['VESTADO'] := FieldByName('VESTADO').AsInteger;
              cdF.FieldValues['NOMBRE'] := FieldByName('NOMBRE').AsString;
              if FieldByName('VESTADO').AsInteger <> 5 then
                 vTotFianzas := vTotFianzas + FieldByName('SALDO').AsCurrency;
              cdF.Post;
              Next;
            end; // FIN DEL WHILE
            EdTotalFianzas.Caption := CurrToStrF(vTotFianzas,ffCurrency,0);
          end;// FIN DEL WITH
          with cdSolicitud do
          begin
            First; // INFORMACION SOLICITUDES
            Filtered := False;
            Filter := 'AGENCIA = ' + IntToStr(TProductos(Node.Data).agencia);
            Filtered := True;
            while not Eof do
            begin
              cdSol.Append;
              cdSol.FieldValues['SOLICITUD'] := FieldByName('SOLICITUD').AsString;
              cdSol.FieldValues['VALOR'] := FieldByName('VALOR').AsCurrency;
              cdSol.FieldValues['ESTADO'] := FieldByName('ESTADO').AsString;
              cdSol.FieldValues['FECHA'] := FieldByName('FECHA').AsDateTime;
              cdSol.FieldValues['VESTADO'] := FieldByName('VESTADO').AsInteger;
              cdSol.Post;
              Next;
            end; // FIN DEL WHILE
          end;// FIN DEL WITH

         except
        end;

end;

function TfrmConsultaProductosAg.bEmpleado(vAlias: string): string;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT NOMBRE, SEGUNDO_APELLIDO, PRIMER_APELLIDO');
          SQL.Add('FROM "gen$empleado" WHERE (ID_EMPLEADO = :ID)');
          ParamByName('ID').AsString := vAlias;
          Open;
          Result := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
        end;

end;

function TfrmConsultaProductosAg.bEstado(estado,tipo: integer): string;
begin
//1-Est Captacion, 2-Est. Creditos 3-Est .Solicitudes 4-Desc cuotas
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          case tipo of
            1: SQL.Add('SELECT DESCRIPCION as DESCRIPCION FROM "cap$tiposestado" WHERE (ID_ESTADO = :ID) ');
            2: SQL.Add('SELECT DESCRIPCION_ESTADO_COLOCACION as DESCRIPCION FROM "col$estado" WHERE  (ID_ESTADO_COLOCACION = :ID)');
            3:SQL.Add('SELECT DESCRIPCION_ESTADO AS DESCRIPCION FROM "col$estadosolicitud" WHERE (ID_ESTADO = :ID)');
            4:SQL.Add('SELECT DESCRIPCION_TIPO_CUOTA AS DESCRIPCION FROM "col$tiposcuota" WHERE (ID_TIPOS_CUOTA = :ID)');
          end;
          ParamByName('ID').AsInteger := estado;
          Open;
          Result := FieldByName('DESCRIPCION').AsString;
        end;
end;

procedure TfrmConsultaProductosAg.Limpiar;
begin
        CdCuenta.CancelUpdates;
        CdCol.CancelUpdates;
        cdF.CancelUpdates;
        cdSol.CancelUpdates;
        EdNombre.Caption := '';
        EdTipoPersona.Caption := '';
        EdEstadoCivil.Caption := '';
        EdSexo.Caption := '';
        EdFechaNacimiento.Caption := '';
        EdLugarNacimiento.Caption := '';
        EdTipoAfiliacion.Caption := '';
        EdFechaAfiliacion.Caption := '';
        EdEstudio.Checked := False;
        EdProfesion.Caption := '';
        EdEmpresa.Caption := '';
        EdCargo.Caption := '';
        EdFechaIngreso.Caption := '';
        EdTotalActivos.Caption := '';
        EdTotalPasivos.Caption := '';
        EDempleado_act.Caption := '';
        EDfecha_act.Caption := '';
        EdRetefuente.Checked := False;
        vTotCaptaciones := 0;
        vTotAportaciones := 0;
        vTotFianzas := 0;
        vTotColocaciones := 0;
end;

procedure TfrmConsultaProductosAg.dbCaptacionDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with (Sender as TDBGrid) do
    begin
      if DataSource.DataSet.FieldByName('VESTADO').Value  = 2 then
      begin
             dbCaptacion.Canvas.Brush.Color:=clSilver;
             dbCaptacion.Canvas.FillRect(Rect);
      end
      else if DataSource.DataSet.FieldByName('VESTADO').Value  = 9 then
      begin
             dbCaptacion.Canvas.Brush.Color:=clRed;
             dbCaptacion.Canvas.FillRect(Rect);
      end;
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TfrmConsultaProductosAg.CmdOtroClick(Sender: TObject);
begin
        limpiar;
        inicio;
        CBtiposid.SetFocus;
end;

procedure TfrmConsultaProductosAg.dbColocacionDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with (Sender as TDBGrid) do
    begin
      if DataSource.DataSet.FieldByName('VESTADO').Value  = 2 then
      begin
             dbColocacion.Canvas.Brush.Color:=clYellow;
             dbColocacion.Canvas.FillRect(Rect);
      end
      else if DataSource.DataSet.FieldByName('VESTADO').Value  = 3 then
      begin
             dbColocacion.Canvas.Brush.Color:=clRed;
             dbColocacion.Canvas.FillRect(Rect);
      end
      else if DataSource.DataSet.FieldByName('VESTADO').Value  = 7 then
      begin
             dbColocacion.Canvas.Brush.Color:=clSilver;
             dbColocacion.Canvas.FillRect(Rect);
      end
      else if DataSource.DataSet.FieldByName('VESTADO').Value  = 6 then
      begin
             dbColocacion.Canvas.Brush.Color:=clMaroon;
             dbColocacion.Canvas.FillRect(Rect);
      end;

      DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

end;

procedure TfrmConsultaProductosAg.dbFinzasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with (Sender as TDBGrid) do
    begin
      if DataSource.DataSet.FieldByName('VESTADO').Value  = 2 then
      begin
             dbFinzas.Canvas.Brush.Color:=clYellow;
             dbFinzas.Canvas.FillRect(Rect);
      end
      else if DataSource.DataSet.FieldByName('VESTADO').Value  = 3 then
      begin
             dbFinzas.Canvas.Brush.Color:=clRed;
             dbFinzas.Canvas.FillRect(Rect);
      end
      else if DataSource.DataSet.FieldByName('VESTADO').Value  = 7 then
      begin
             dbFinzas.Canvas.Brush.Color:=clSilver;
             dbFinzas.Canvas.FillRect(Rect);
      end
      else if DataSource.DataSet.FieldByName('VESTADO').Value  = 6 then
      begin
             dbFinzas.Canvas.Brush.Color:=clMaroon;
             dbFinzas.Canvas.FillRect(Rect);
      end;

      DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

end;

procedure TfrmConsultaProductosAg.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;
end;

procedure TfrmConsultaProductosAg.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TfrmConsultaProductosAg.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TfrmConsultaProductosAg.dbSolicitudDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with (Sender as TDBGrid) do
    begin
      if DataSource.DataSet.FieldByName('VESTADO').Value  = 7 then
      begin
             dbSolicitud.Canvas.Brush.Color:=clRed;
             dbSolicitud.Canvas.FillRect(Rect);
      end;
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

end;

end.
