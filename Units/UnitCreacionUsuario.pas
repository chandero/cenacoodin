unit UnitCreacionUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, JvEdit, JvStaticText, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase,StrUtils, IBServices,sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TFrmCreacionUsuarios = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DbTipo: TDBLookupComboBox;
    Label2: TLabel;
    JvNumero: TJvEdit;
    Panel2: TPanel;
    JvStaticText4: TJvStaticText;
    JvNombre: TJvStaticText;
    Panel3: TPanel;
    JvStaticText2: TJvStaticText;
    JvStaticText1: TJvStaticText;
    JvUsuario: TJvStaticText;
    JVPass: TJvStaticText;
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
    procedure BitBtn3Click(Sender: TObject);
    procedure JvNumeroExit(Sender: TObject);
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
    procedure local;
    function vAlias(n1, p1, p2: string): string;
    procedure remoto(vHost: string; vPuerto: integer);
    procedure InEmpleado(vHost:string;vPuerto:Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCreacionUsuarios: TFrmCreacionUsuarios;

implementation
uses unitGlobales,UnitGlobal, UnitPantallaProgreso, UnitCreacion;

{$R *.dfm}

procedure TFrmCreacionUsuarios.BitBtn3Click(Sender: TObject);
begin
                Close;
end;

procedure TFrmCreacionUsuarios.JvNumeroExit(Sender: TObject);
begin
        if JvNumero.Text = '' then
           Exit;
        if dBAgencia.KeyValue = 1 then
           local
        else
           remoto(BuscaServicio(dBAgencia.KeyValue,1).vHost,BuscaServicio(dBAgencia.KeyValue,1).vPuerto)

end;

procedure TFrmCreacionUsuarios.local;
var     vExiste :Boolean;
        vId :string;
begin
        vExiste := False;
        vId := '';
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT *');
          SQL.Add('FROM');
          SQL.Add('"gen$empleado"');
          SQL.Add('WHERE');
          SQL.Add('(DOCUMENTO = :DOCUMENTO)');
          ParamByName('DOCUMENTO').AsString := JvNumero.Text;
          Open;
          if RecordCount = 0 then
          begin
             if MessageDlg('Persona no Existe en la Base de Datos, desea crearla?',mtInformation,[mbyes,mbno],0) = mrNo then
             begin
               bCancelar.Click;
               Exit;
             end;
             FrmCreacion := TFrmCreacion.Create(Self);
             FrmCreacion.ShowModal;
             JvNombre.Caption := vNombre + ' ' + pApellido + ' ' + sApellido;
             vIdEmpleado := valias(vNombre,pApellido,sApellido);
             JvCuenta.Caption := formatcurr('00000000',0);
          end
          else
          begin
            vExiste := True;
            vId := FieldByName('ID_EMPLEADO').AsString;
            JvNombre.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            vIdEmpleado := valias(FieldByName('NOMBRE').AsString,FieldByName('PRIMER_APELLIDO').AsString,FieldByName('SEGUNDO_APELLIDO').AsString);
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM');
            SQL.Add(' P_CAP_0008(:ID_AGENCIA, :ID_TIPO_CAPTACION, :ID_IDENTIFICACION, :ID_PERSONA)');
            ParamByName('ID_AGENCIA').AsInteger := dBAgencia.KeyValue;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
            ParamByName('ID_IDENTIFICACION').AsInteger := DbTipo.KeyValue;
            ParamByName('ID_PERSONA').AsString := JvNumero.Text;
            Open;
            JvCuenta.Caption := '10' + IntToStr(dBAgencia.KeyValue) + formatcurr('000000',FieldByName('NUMERO_CUENTA').AsCurrency);
          end;
          if vExiste then
          begin
             JvUsuario.Caption := vid;
             JVPass.Caption := '12345';
             MessageDlg('Ya se Encuentra Registrado el Usuario',mtWarning,[mbok],0);
             Exit;
          end;
          JvUsuario.Caption := vIdEmpleado;
          //JVPass.Caption := vIdEmpleado;
          bCrear.Enabled := True;
          bCrear.SetFocus;
        end;
end;

procedure TFrmCreacionUsuarios.FormCreate(Sender: TObject);
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
        DbTipo.KeyValue := 3;
        dBAgencia.KeyValue := 1;
        JvFecha.Caption := DateToStr(fFechaActual);

end;

function TFrmCreacionUsuarios.vAlias(n1, p1, p2: string): string;
var     Alias :string;
        contador :Integer;
begin
        primero := n1;
        segundo := p1;
        tercero := p2;
        contador := -1;
        Alias := LeftStr(n1,1) + p1;
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('ID_EMPLEADO');
          SQL.Add('FROM');
          SQL.Add('"gen$empleado"');
          SQL.Add('WHERE');
          SQL.Add('(ID_EMPLEADO = :ID_EMPLEADO)');
          ParamByName('ID_EMPLEADO').AsString := Alias;
          Open;
          if RecordCount = 0 then
             contador := 0
          else
          begin
              Alias := LeftStr(n1,1) + p1 + LeftStr(p2,1);
          end;
        end;
        Result := Alias;
end;

procedure TFrmCreacionUsuarios.bCrearClick(Sender: TObject);
var     vServer,vH:string;
        vP :Integer;
begin
        if MessageDlg('Esta Seguro de Crear el Usuario?',mtInformation,[mbyes,mbno],0) = mrno then
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
        {if dBAgencia.KeyValue = 1 then
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
          FirstName := primero;
          MiddleName := segundo;
          LastName := tercero;
          Password := '12345';
          AddUser;
          Active := False;
        end;
        with IBQuery1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "gen$empleado" values (:ID_EMPLEADO,:DOCUMENTO,:P1,:P2,:NOMBRE,:CUENTA,:ULTIMO,:ID_AGENCIA)');
            ParamByName('ID_EMPLEADO').AsString := Trim(vIdEmpleado);
            ParamByName('DOCUMENTO').AsString := JvNumero.Text;
            ParamByName('P1').AsString := segundo;
            ParamByName('P2').AsString := tercero;
            ParamByName('NOMBRE').AsString := primero;
            ParamByName('CUENTA').AsString := JvCuenta.Caption;
            ParamByName('ULTIMO').AsDate := fFechaActual;
            ParamByName('ID_AGENCIA').AsInteger := dBAgencia.KeyValue;
            ExecSQL;
            SQL.Clear;
            SQL.Add('insert into "per$control" values (:ID_AGENCIA,:ID_EMPLEADO_RES,:FECHA,:ID_EMPLEADO,');
            SQL.Add('NULL,NULL,1,NULL)');
            ParamByName('ID_EMPLEADO_RES').AsString := DBAlias;
            ParamByName('FECHA').AsDateTime := fFechaActual + Time;
            ParamByName('ID_EMPLEADO').AsString := Trim(vIdEmpleado);
            ParamByName('ID_AGENCIA').AsInteger := dBAgencia.KeyValue;
            ExecSQL;
            Transaction.Commit;
          end;
          if dBAgencia.KeyValue <> 1 then
             inempleado(vH,vP);
            MessageDlg('Usuario "' + vIdEmpleado + '" Creado con Exito',mtInformation,[mbok],0);
            bCancelar.Click;
          except
        on e: Exception do
        begin
          MessageDlg('Error al Crear Usuario con Mensaje :' + e.Message,mtError,[mbok],0);
        end;
        end;

end;

procedure TFrmCreacionUsuarios.dBAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmCreacionUsuarios.JvNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmCreacionUsuarios.DbTipoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmCreacionUsuarios.bCancelarClick(Sender: TObject);
begin
        JvNumero.Text := '';
        JVPass.Caption := '';
        JvUsuario.Caption := '';
        JvCuenta.Caption := '';
        JvNombre.Caption := '';
        JvDestino.Caption := '';
        bCrear.Enabled := False;
        dBAgencia.SetFocus;
end;

procedure TFrmCreacionUsuarios.dBAgenciaExit(Sender: TObject);
begin
        if dBAgencia.KeyValue = 1 then
           JvDestino.Caption := 'LOCAL'
        else
           JvDestino.Caption := 'REMOTO';
end;

procedure TFrmCreacionUsuarios.remoto(vHost: string; vPuerto: integer);
var     sentencia :string;
        tamano,i :Integer;
        Astream:TMemoryStream;
        XmlDoc,Xmlres :TsdXmlDocument;
        Nodo,Nodo1 :TXmlNode;
        cadena :string;
        AList,AListCampos:TList;
        vCuenta :Currency;
begin
        sentencia := 'select * from PER_EMPLEADO(' + '''' + JvNumero.Text + '''' + ',' + IntToStr(DbTipo.KeyValue) + ',' + IntToStr(dBAgencia.KeyValue) + ')';
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
          Host := vhost;;
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
           //Xmlres.SaveToFile('C:\EJE\X.XML');
           AList := TList.Create;
           Nodo := XmlRes.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
               AListCampos := TList.Create;
               TXmlNode(AList[i]).NodesByName('campo',AListCampos);
               if TXmlNode(AListCampos[0]).ValueAsString = '' then
               begin
                if MessageDlg('Persona no Existe en la Base de Datos, desea crearla?',mtInformation,[mbyes,mbno],0) = mrNo then
                 begin
                   bCancelar.Click;
                   Exit;
                 end;
               FrmCreacion := TFrmCreacion.Create(Self);
               FrmCreacion.ShowModal;
               JvNombre.Caption := vNombre + ' ' + pApellido + ' ' + sApellido;
               vIdEmpleado := valias(vNombre,pApellido,sApellido);
               JvCuenta.Caption := formatcurr('00000000',0);
               JvUsuario.Caption := vIdEmpleado;
               JVPass.Caption := '123';
           end
           else
           begin
               primero := TXmlNode(AListCampos[0]).ValueAsString;
               segundo := TXmlNode(AListCampos[1]).ValueAsString;
               tercero := TXmlNode(AListCampos[2]).ValueAsString;
               vIdEmpleado := valias(primero,segundo,tercero);
               JvUsuario.Caption := vIdEmpleado;
               JVPass.Caption := vIdEmpleado;
               JvNombre.Caption := primero + ' ' + segundo + ' ' + tercero ;
           end;
               if TXmlNode(AListCampos[3]).ValueAsString = '' then
                  vCuenta := 0
               else
                 vCuenta := TXmlNode(AListCampos[3]).ValueAsFloat;
               JvCuenta.Caption := '10' + IntToStr(dBAgencia.KeyValue) + formatcurr('000000',vCuenta);
               if TXmlNode(AListCampos[4]).ValueAsInteger = 1 then
               begin
                JvUsuario.Caption := TXmlNode(AListCampos[5]).ValueAsString;;
                JVPass.Caption := '*******';
                MessageDlg('Ya se Encuentra Registrado el Usuario',mtWarning,[mbok],0);
                Exit;
               end;
           end;
           bCrear.Enabled := True;


end;
procedure TFrmCreacionUsuarios.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmCreacionUsuarios.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmCreacionUsuarios.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmCreacionUsuarios.InEmpleado(vHost:string;vPuerto:Integer);
var     sentencia :string;
        tamano,i :Integer;
        Astream:TMemoryStream;
        XmlDoc,Xmlres :TsdXmlDocument;
        Nodo,Nodo1 :TXmlNode;
        cadena :string;

begin
        sentencia := 'EXECUTE PROCEDURE PER_INGRESA(' + '''' + JvUsuario.Caption + '''' + ',' +
                      '''' + JvNumero.Text + '''' + ',' + '''' + segundo + '''' + ',' + '''' +
                      tercero + '''' + ',' + '''' + primero + '''' + ',' + '''' + JvCuenta.Caption +
                      '''' + ',' +  '''' + DateToStr(fFechaActual) + '''' + ',' + IntToStr(dBAgencia.KeyValue) + ')';
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
