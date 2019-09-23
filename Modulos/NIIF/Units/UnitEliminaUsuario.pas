unit UnitEliminaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, JvEdit, JvStaticText, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase,StrUtils, IBServices,sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, DBClient;

type
  TFrmEliminaUsuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    JvStaticText4: TJvStaticText;
    JvNombre: TJvStaticText;
    JvStaticText3: TJvStaticText;
    JvCuenta: TJvStaticText;
    JvStaticText6: TJvStaticText;
    JvFecha: TJvStaticText;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    dBAgencia: TDBLookupComboBox;
    Label4: TLabel;
    JvDestino: TJvStaticText;
    bCrear: TBitBtn;
    bCancelar: TBitBtn;
    BitBtn3: TBitBtn;
    IBAgencia: TIBQuery;
    DsAgencia: TDataSource;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBTipo: TIBQuery;
    DsTipo: TDataSource;
    IBQuery2: TIBQuery;
    IBseguro: TIBSecurityService;
    IdTCPClient1: TIdTCPClient;
    CdLogin: TClientDataSet;
    CdLoginID_EMPLEADO: TStringField;
    DsLogin: TDataSource;
    Label2: TLabel;
    DbEmpleado: TDBLookupComboBox;
    Label1: TLabel;
    JvFechaa: TJvStaticText;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bCrearClick(Sender: TObject);
    procedure dBAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure JvNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure DbTipoKeyPress(Sender: TObject; var Key: Char);
    procedure bCancelarClick(Sender: TObject);
    procedure dBAgenciaExit(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
    vIdEmpleado :string;
    primero,segundo,tercero :string;
    vDocumento :string;
    procedure InEmpleado(vHost:string;vPuerto:Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEliminaUsuario: TFrmEliminaUsuario;

implementation
uses unitGlobales,UnitGlobal, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmEliminaUsuario.BitBtn3Click(Sender: TObject);
begin
                Close;
end;


procedure TFrmEliminaUsuario.FormCreate(Sender: TObject);
begin
        if IBTransaction1.InTransaction then
           IBTransaction1.Commit;
        IBTransaction1.StartTransaction;
        IBTipo.Close;
        IBTipo.Open;
        IBTipo.Last;
        IBAgencia.Close;
        IBAgencia.Open;
        IBAgencia.Last;
        dBAgencia.KeyValue := 1;
        JvFecha.Caption := DateToStr(fFechaActual);

end;


procedure TFrmEliminaUsuario.bCrearClick(Sender: TObject);
var     vServer,vH:string;
        vP :Integer;
begin
        if MessageDlg('Esta Seguro de Eliminar el Usuario?',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select SERVIDOR from "per$servidor" where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := dBAgencia.KeyValue;
          Open;
          vServer := FieldByName('SERVIDOR').AsString;
        end;
        vP := BuscaServicio(dBAgencia.KeyValue,1).vPuerto;
        vH := BuscaServicio(dBAgencia.KeyValue,1).vHost;
{        if dBAgencia.KeyValue = 1 then
           vServer := Host_BaseOcana
        else if dBAgencia.KeyValue = 2 then
        begin
           vServer := Host_BaseAbrego;
           vP := puerto_abrego;
           vH := host_abrego;
        end
        else if dBAgencia.KeyValue = 3 then
        begin
           vP := puerto_convencion;
           vH := host_convencion;
           vServer := Host_BaseConvencion;
        end;}
        try
        with IBseguro do
        begin
          ServerName := vServer;
          LoginPrompt := False;
          Params.Add('user_name=sysdba');
          Params.Add('password=' + dbPassSysdba);
          Active := True;
          UserName := trim(vIdEmpleado);
          DeleteUser;
          Active := False;
        end;
        with IBQuery1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "per$historico" values (:ID_EMPLEADO,:DOCUMENTO,:P1,:P2,:NOMBRE,:CUENTA,:ULTIMO,:ID_AGENCIA)');
            ParamByName('ID_EMPLEADO').AsString := Trim(vIdEmpleado);
            ParamByName('DOCUMENTO').AsString := vDocumento;
            ParamByName('P1').AsString := segundo;
            ParamByName('P2').AsString := tercero;
            ParamByName('NOMBRE').AsString := primero;
            ParamByName('CUENTA').AsString := JvCuenta.Caption;
            ParamByName('ULTIMO').AsDate := fFechaActual;
            ParamByName('ID_AGENCIA').AsInteger := dBAgencia.KeyValue;
            ExecSQL;
            SQL.Clear;
            SQL.Add('insert into "per$control" values (:AGENCIA,:ID_EMPLEADO_RES,:FECHA,:ID_EMPLEADO,');
            SQL.Add('NULL,NULL,2,NULL)');
            ParamByName('ID_EMPLEADO_RES').AsString := DBAlias;
            ParamByName('FECHA').AsDateTime := fFechaActual + Time;
            ParamByName('ID_EMPLEADO').AsString := Trim(vIdEmpleado);
            ParamByName('ID_AGENCIA').AsInteger := dBAgencia.KeyValue;
            ExecSQL;
            Transaction.Commit;
            MessageDlg('Usuario "' + vIdEmpleado + '" Eliminado con Exito',mtInformation,[mbok],0);
            bCancelar.Click;
          end;
          if dBAgencia.KeyValue <> 1 then
             inempleado(vH,vP);
          except
        on e: Exception do
        begin
          MessageDlg('Error al Crear Usuario con Mensaje :' + e.Message,mtError,[mbok],0);
        end;
        end;

end;

procedure TFrmEliminaUsuario.dBAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEliminaUsuario.JvNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEliminaUsuario.DbTipoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEliminaUsuario.bCancelarClick(Sender: TObject);
begin
        JvCuenta.Caption := '';
        JvNombre.Caption := '';
        JvDestino.Caption := '';
        bCrear.Enabled := False;
        dBAgencia.SetFocus;
end;

procedure TFrmEliminaUsuario.dBAgenciaExit(Sender: TObject);
begin
        if dBAgencia.KeyValue = 1 then
           JvDestino.Caption := 'LOCAL'
        else
           JvDestino.Caption := 'REMOTO';
end;

procedure TFrmEliminaUsuario.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmEliminaUsuario.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmEliminaUsuario.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmEliminaUsuario.InEmpleado(vHost:string;vPuerto:Integer);
var     sentencia :string;
        tamano,i :Integer;
        Astream:TMemoryStream;
        XmlDoc,Xmlres :TsdXmlDocument;
        Nodo,Nodo1 :TXmlNode;
        cadena :string;

begin
        sentencia := 'EXECUTE PROCEDURE PER_ELIMINA(' + '''' + Trim(vIdEmpleado) + '''' + ',' + IntToStr(dBAgencia.KeyValue) +')';
        XmlDoc := TsdXmlDocument.CreateName('query_info');
        XmlDoc.XmlFormat := xfReadable;
        Nodo := XmlDoc.Root.NodeNew('querys');
        Nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        xmlres := TsdXmlDocument.Create;
        Xmlres.XmlFormat := xfReadable;
        Astream := TMemoryStream.Create;
        XmlDoc.SaveToStream(Astream);
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Espere un Momento por Favor...';// + Desc_Agencia;
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'Kbs Recibidos';
        frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
        Application.ProcessMessages;
        frmProgreso.Position := 2;
        frmProgreso.Ejecutar;
        with IdTCPClient1 do
        begin
          Port := vPuerto;
          Host := vHost;
          try
             Application.ProcessMessages;
             Connect;
          except
          on e: Exception do
          begin
            Application.ProcessMessages;
            MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
            Disconnect;
            frmProgreso.Cerrar;
            Exit;
          end;
          end;
          if Connected then
          begin
            Cadena := ReadLn();
            AStream := TMemoryStream.Create;
            XmlDoc.SaveToStream(AStream);
            WriteInteger(AStream.Size);
            OpenWriteBuffer;
            WriteStream(AStream);
            CloseWriteBuffer;
            FreeAndNil(AStream);
            tamano := ReadInteger;
            AStream := TMemoryStream.Create;
            ReadStream(Astream,tamano,False);
            XmlRes := TsdXmlDocument.Create;
            XmlRes.LoadFromStream(AStream);
            Disconnect;
            frmProgreso.Cerrar;
          end;
          end;
end;

end.
