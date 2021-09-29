unit UnitRemotaConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, JvEdit, DB, DBClient, Grids,
  DBGrids, IBCustomDataSet, IBQuery, Buttons, sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP;

type
  TFrmRemotaConsulta = class(TForm)
    GroupBox1: TGroupBox;
    DBtipo: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    JVnumero: TJvEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PApellido: TEdit;
    SApellido: TEdit;
    Nombres: TEdit;
    GroupBox3: TGroupBox;
    CDrespuesta: TClientDataSet;
    DSrespuesta: TDataSource;
    DBGrid1: TDBGrid;
    CDrespuestacuenta: TIntegerField;
    IBagencia: TIBQuery;
    DSagencia: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    CDrespuestadescripcion: TStringField;
    CDrespuestatp: TIntegerField;
    CDrespuestaag: TIntegerField;
    IdFTP1: TIdFTP;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBtipoKeyPress(Sender: TObject; var Key: Char);
    procedure PApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure SApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure JVnumeroExit(Sender: TObject);
    procedure JVnumeroKeyPress(Sender: TObject; var Key: Char);
    procedure NombresKeyPress(Sender: TObject; var Key: Char);
    procedure NombresExit(Sender: TObject);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;
    sentencia: string;
    { Private declarations }
  public
    Host_remoto :string;
    Puerto_Remoto :Integer;
    captacion :Integer;
    Ag_Remota :Integer;
    { Public declarations }
  end;

var
  FrmRemotaConsulta: TFrmRemotaConsulta;

implementation
uses UnitGlobales, UnitPantallaProgreso, UnitOperacionesCaja, UnitdmGeneral;

{$R *.dfm}

procedure TFrmRemotaConsulta.FormCreate(Sender: TObject);
begin
        IBagencia.Open;
        IBagencia.Last;
end;

procedure TFrmRemotaConsulta.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRemotaConsulta.DBtipoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmRemotaConsulta.PApellidoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmRemotaConsulta.SApellidoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmRemotaConsulta.BitBtn1Click(Sender: TObject);
begin
        DBtipo.KeyValue := -1;
        JVnumero.Text := '';
        PApellido.Text := '';
        SApellido.Text := '';
        Nombres.Text := '';
        CDrespuesta.CancelUpdates;
        DBtipo.SetFocus;
end;

procedure TFrmRemotaConsulta.JVnumeroExit(Sender: TObject);
var      i :Integer;
         sentencia1 :string;
         cadena :string;
         AList,AListCampos:TList;
begin
      if (DBtipo.KeyValue <> -1) and (JVnumero.Text <> '') then
      begin
         sentencia := 'select "cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, ' +
        '"cap$maestro".NUMERO_CUENTA, "cap$maestro".DIGITO_CUENTA, ' +
        '"cap$tipocaptacion".DESCRIPCION from "cap$maestro" ' +
        'inner join "cap$tipocaptacion" ON ("cap$maestro".ID_TIPO_CAPTACION = "cap$tipocaptacion".ID_TIPO_CAPTACION) ' +
        'inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO) ' +
        'inner join "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and ' +
        '"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION ' +
        'and "cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA) ' +
        'where ' +
        '"cap$maestrotitular".ID_IDENTIFICACION = ' +  inttostr(dbtipo.keyvalue) + ' and "cap$maestrotitular".ID_PERSONA = ' + '''' + JVnumero.Text + '''' +
        'Order by "cap$maestro".ID_TIPO_CAPTACION,"cap$maestro".FECHA_APERTURA asc';
         sentencia1 := 'select NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO from "gen$persona"' +
         'where ID_PERSONA = '+ '''' + JVnumero.Text + '''' + 'and ID_IDENTIFICACION = 3';// + IntToStr(DBtipo.KeyValue);
         XmlPetc := TsdXmlDocument.CreateName('query_info');
         XmlPetc.XmlFormat := xfReadable;
         Nodo := XmlPetc.Root.NodeNew('querys');
         Nodo1 := Nodo.NodeNew('query');
         Nodo1.WriteString('tipo','select');
         nodo1.WriteString('sentencia',sentencia);
         Nodo1 := Nodo.NodeNew('query');
         Nodo1.WriteString('tipo','select');
         nodo1.WriteString('sentencia',sentencia1);
         XmlresC := TsdXmlDocument.Create;
         XmlresC.EncodingString := 'iso-8859-1';
         XmlresC.XmlFormat := xfReadable;

         Astream := TMemoryStream.Create;
         XmlPetC.SaveToStream(Astream);
         XmlPetC.SaveToFile('C:\AXL.XML');
           with IdTCPClient1 do
           begin
             Port := Puerto_Remoto;
             Host := Host_remoto;
             try
               Application.ProcessMessages;
               Connect;
             except
             on e: Exception do
             begin
                Application.ProcessMessages;
                MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
                frmProgreso.Cerrar;
                Disconnect;
                Exit;
             end;
           end;
           if Connected then
           begin
                frmProgreso := TfrmProgreso.Create(self);
                frmProgreso.Titulo := 'Recibiendo Informacion...';// + Desc_Agencia;
                frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
                Application.ProcessMessages;
                frmProgreso.Position := 2;
                frmProgreso.Min := 0;
                frmProgreso.Ejecutar;
                //Cadena := ReadLn();
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
                XMLRESC.SaveToFile('C:\AXL1.xml');
                Disconnect;
                frmProgreso.Cerrar;
           end;
           end;
           AList := TList.Create;
           Nodo := XmlResc.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           try
             for i := 0 to AList.Count -1 do
             begin
                AListCampos := TList.Create;
                TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                CDrespuesta.Append;
                CDrespuesta.FieldValues['cuenta'] := TXmlNode(AListCampos[2]).ValueAsInteger;
                CDrespuesta.FieldValues['descripcion'] := TXmlNode(AListCampos[4]).ValueAsString;
                CDrespuesta.FieldValues['tp'] := TXmlNode(AListCampos[1]).ValueAsInteger;
                CDrespuesta.FieldValues['ag'] := Ag_Remota;
                CDrespuesta.Post;
             end;
           except
           end;
           AList := TList.Create;
           Nodo := XmlResc.Root.NodeByName('consulta001');
           Nodo.NodesByName('Registro',AList);
           try
             for i := 0 to AList.Count -1 do
             begin
                AListCampos := TList.Create;
                TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                PApellido.Text := TXmlNode(AListCampos[1]).ValueAsString;;
                SApellido.Text := TXmlNode(AListCampos[2]).ValueAsString;
                nombres.Text := TXmlNode(AListCampos[0]).ValueAsString;
             end;
           except
           end;
           CDrespuesta.IndexFieldNames := 'tp';
         end;
end;

procedure TFrmRemotaConsulta.JVnumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BitBtn2.SetFocus;
end;

procedure TFrmRemotaConsulta.NombresKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
           BitBtn2.SetFocus;
end;

procedure TFrmRemotaConsulta.NombresExit(Sender: TObject);
var     AList,AListCampos:TList;
        i,tamano :Integer;
        cadena :string;
begin
         tamano := 0;
         CDrespuesta.CancelUpdates;
         if (PApellido.Text <> '') and (SApellido.Text <> '') and (Nombres.Text <> '') then
         begin
           sentencia := 'SELECT first 1 * FROM BUSCARPERSONA01(' + '''' + PApellido.Text + '''' + ',' + '''' + SApellido.Text + '''' + ',' + '''' +  Nombres.Text + '''' + ')';
           XmlPetc := TsdXmlDocument.CreateName('query_info');
           XmlPetc.XmlFormat := xfReadable;
           Nodo := XmlPetc.Root.NodeNew('querys');
           Nodo1 := Nodo.NodeNew('query');
           Nodo1.WriteString('tipo','select');
           nodo1.WriteString('sentencia',sentencia);
           xmlresc := TsdXmlDocument.Create;
           XmlresC.XmlFormat := xfReadable;
           Astream := TMemoryStream.Create;
           XmlPetC.SaveToStream(Astream);
           with IdTCPClient1 do
           begin
             Port := Puerto_Remoto;
             Host := Host_remoto;
             try
               Application.ProcessMessages;
               Connect;
             except
             on e: Exception do
             begin
                Application.ProcessMessages;
                MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
                frmProgreso.Cerrar;
                Disconnect;
                Exit;
             end;
           end;
           if Connected then
           begin
                frmProgreso := TfrmProgreso.Create(self);
                frmProgreso.Titulo := 'Recibiendo Informacion...';// + Desc_Agencia;
                frmProgreso.Min := 0;
                frmProgreso.InfoLabel := 'Kbs Recibidos';                frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
                Application.ProcessMessages;
                frmProgreso.Position := 2;
                frmProgreso.Ejecutar;
                //Cadena := ReadLn();
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
                XmlResc := TsdXmlDocument.Create;
                XmlResc.LoadFromStream(AStream);
                Disconnect;
                frmProgreso.Cerrar;
           end;
           end;
           XmlresC.LoadFromStream(Astream);
           XmlresC.SaveToFile('c:\wum1.xml');
           AList := TList.Create;
           Nodo := XmlResc.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
             AListCampos := TList.Create;
             TXmlNode(AList[i]).NodesByName('campo',AListCampos);
             CDrespuesta.Append;
             CDrespuesta.FieldValues['ag'] := Ag_Remota;
             CDrespuesta.FieldValues['tp'] := 1;
             CDrespuesta.FieldValues['cuenta'] := TXmlNode(AListCampos[5]).ValueAsInteger;
             captacion := TXmlNode(AListCampos[5]).ValueAsInteger;
             CDrespuesta.FieldValues['descripcion'] := 'APORTES ORDINARIOS';
             CDrespuesta.Post;
             DBtipo.KeyValue := TXmlNode(AListCampos[0]).ValueAsInteger;
             JVnumero.Text := TXmlNode(AListCampos[1]).ValueAsString;
             PApellido.Text := TXmlNode(AListCampos[2]).ValueAsString;
             SApellido.Text := TXmlNode(AListCampos[3]).ValueAsString;
             Nombres.Text := TXmlNode(AListCampos[4]).ValueAsString;
           end;
         end
         else
         begin
           MessageDlg('Todos los Campos deben estar Llenos',mtInformation,[mbok],0);
           Exit;
         end;
end;

procedure TFrmRemotaConsulta.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmRemotaConsulta.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmRemotaConsulta.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmRemotaConsulta.DBGrid1CellClick(Column: TColumn);
begin
        captacion := CDrespuestacuenta.Value;
end;

end.
