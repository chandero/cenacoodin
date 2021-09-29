unit UnitRole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvStaticText, DBCtrls, StdCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase, DBClient, IBServices,sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;
const
  WM_ThreadDoneMsg = WM_User + 8;

type
  TThread1 = class(TThread)
  private
    OwnerHandle: HWND;
  protected
    procedure Execute; override;
  published
    constructor Create(Owner: TForm);
    destructor Destroy; override;
  end;

type

  TFrmRole = class(TForm)
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dBAgencia: TDBLookupComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    LrnAsignado: TListBox;
    BTquitar: TBitBtn;
    BTagregar: TBitBtn;
    Label2: TLabel;
    LrAsignado: TListBox;
    Panel2: TPanel;
    Label5: TLabel;
    jVempleado: TJvStaticText;
    Panel4: TPanel;
    bCrear: TBitBtn;
    bCancelar: TBitBtn;
    DsAgencia: TDataSource;
    IBAgencia: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    IBroles: TIBQuery;
    IBnRoles: TIBQuery;
    Dbroles: TClientDataSet;
    Dbrolesrol: TStringField;
    DsLogin: TDataSource;
    DbEmpleado: TDBLookupComboBox;
    CdLogin: TClientDataSet;
    CdLoginID_EMPLEADO: TStringField;
    IBseguro: TIBSecurityService;
    IdTCPClient1: TIdTCPClient;
    CdUsuario: TClientDataSet;
    CdUsuarioNOMBRE: TStringField;
    CdUsuarioP_APELLIDO: TStringField;
    CdUsuarioS_APELLIDO: TStringField;
    CdUsuarioID_EMPLEADO: TStringField;
    CdUsuarioROLES: TStringField;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure dBAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure DbEmpleadoExit(Sender: TObject);
    procedure DbEmpleadoKeyPress(Sender: TObject; var Key: Char);
    procedure dBAgenciaExit(Sender: TObject);
    procedure BTquitarClick(Sender: TObject);
    procedure BTagregarClick(Sender: TObject);
    procedure LrnAsignadoClick(Sender: TObject);
    procedure LrAsignadoClick(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
    procedure bCrearClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure SpeedButton1Click(Sender: TObject);
  private
    vAlias :string;
    Thread1: TThread1;
    antes,despues :string;
    procedure Local;
    procedure CargarUsuario(vHost: string);
    function vUsuario(vAlias: string): boolean;
    procedure CargaEmpleado(vhost: string;vPuerto:integer);
    function BuscaRole(id_role: integer): string;
    procedure Ejecuta(vHost: string; vPuerto: Integer);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRole: TFrmRole;

implementation
uses UnitGlobales,UnitGlobal, UnitPantallaProgreso, UnitDmPermiso;

{$R *.dfm}

procedure TFrmRole.FormCreate(Sender: TObject);
begin
        if IBTransaction1.InTransaction then
           IBTransaction1.Commit;
        IBTransaction1.StartTransaction;
        if DmPermiso.IBTransaction1.InTransaction then
           DmPermiso.IBTransaction1.Commit;
        DmPermiso.IBTransaction1.StartTransaction;
       
        IBAgencia.Close;
        IBAgencia.Open;
        IBAgencia.Last;
        dBAgencia.KeyValue := 1;
end;

procedure TFrmRole.dBAgenciaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRole.Local;
begin
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,DOCUMENTO from "gen$empleado" where ID_EMPLEADO = :ID');
          ParamByName('ID').AsString := vAlias;
          Open;
          if RecordCount = 0 then
          begin
             MessageDlg('No se Encuentra Refistrado el Empleado',mtWarning,[mbok],0);
             bCancelar.Click;
             Exit;
          end;
          jVempleado.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
//**** BUSCAR ROLES ASIGNADOS1
          LrAsignado.Clear;
          LrnAsignado.Clear;
          Dbroles.CancelUpdates;
         IBroles.Close;
         IBroles.ParamByName('ID').AsString := vAlias;
         IBroles.Open;
         while not IBroles.Eof do
         begin
           LrAsignado.Items.Add(Trim(IBroles.FieldByName('RDB$RELATION_NAME').AsString));
           Dbroles.Append;
           Dbroles.FieldValues['rol'] := Trim(IBroles.FieldByName('RDB$RELATION_NAME').AsString);
           Dbroles.Post;
           IBroles.Next;
         end;
         IBnRoles.Close;
         IBnRoles.Open;
         while not IBnRoles.Eof do
         begin
           Dbroles.Filtered := False;
           Dbroles.Filter := 'rol = ' + '''' + Trim(IBnRoles.FieldByName('DESCRIPCION').AsString) + '''';
           Dbroles.Filtered := True;
           if Dbroles.RecordCount > 0 then
              IBnroles.Next
           else
           begin
             LrnAsignado.Items.Add(Trim(IBnRoles.FieldByName('DESCRIPCION').AsString));
             IBnRoles.Next;
           end;
         end;
         Panel5.Enabled := False;
         bCrear.Enabled := True;
        end;
end;

procedure TFrmRole.DbEmpleadoExit(Sender: TObject);
var     vRole :TStringList;
        i :Integer;
begin
        vRole := TStringList.Create;
        try
          vAlias := DbEmpleado.KeyValue;
        except
        begin
          MessageDlg('Debe Seleccionar un Login',mtError,[mbok],0);
          DbEmpleado.SetFocus;
          Exit;
        end;
        end;
        if dBAgencia.KeyValue = 1 then
           local
        else
        begin
          with CdUsuario do
          begin
            CdUsuario.Filtered := False;
            CdUsuario.Filter := 'ID_EMPLEADO = ' + '''' + vAlias + '''';
            CdUsuario.Filtered := True;
            jVempleado.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('P_APELLIDO').AsString + ' ' + FieldByName('S_APELLIDO').AsString;
            vRole.Text := StringReplace(FieldByName('ROLES').AsString,',',#13,[rfreplaceall]);
            //**
            LrAsignado.Clear;
            LrnAsignado.Clear;
            Dbroles.CancelUpdates;
            for i := 0 to vRole.Count -1 do
            begin
              if vRole.Strings[i] <> '0' then
              begin
                LrAsignado.Items.Add(Trim(buscarole(StrToInt(vRole.Strings[i]))));
                Dbroles.Append;
                Dbroles.FieldValues['rol'] := Trim(buscarole(StrToInt(vRole.Strings[i])));
                Dbroles.Post;
              end;
            end;
           end;
           IBnRoles.Close;
           IBnRoles.Open;
           while not IBnRoles.Eof do
           begin
             Dbroles.Filtered := False;
             Dbroles.Filter := 'rol = ' + '''' + Trim(IBnRoles.FieldByName('DESCRIPCION').AsString) + '''';
             Dbroles.Filtered := True;
             if Dbroles.RecordCount > 0 then
                IBnroles.Next
             else
             begin
               LrnAsignado.Items.Add(Trim(IBnRoles.FieldByName('DESCRIPCION').AsString));
               IBnRoles.Next;
             end;
           end;
           Panel5.Enabled := False;
           bCrear.Enabled := True;
         end;
            //**
       end;

function TFrmRole.BuscaRole(id_role: integer): string;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "per$roles" where CODIGO = :CODIGO');
          ParamByName('CODIGO').AsInteger := id_role;
          Open;
          Result := FieldByName('DESCRIPCION').AsString;
          Close;
        end;
end;

procedure TFrmRole.DbEmpleadoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRole.dBAgenciaExit(Sender: TObject);
begin
{        case dBAgencia.KeyValue of
          1 : cargarusuario(Host_BaseOcana);
          2 : cargarusuario(host_abrego);
          3 : cargarusuario(host_convencion);
        end;}
        cargarusuario(BuscaServicio(dBAgencia.KeyValue,1).vHost);
end;

procedure TFrmRole.CargarUsuario(vHost: string);
var
  I: Integer;
begin
 CdLogin.CancelUpdates;
 if dBAgencia.KeyValue = 1 then
 begin
 with IBseguro do
  begin
    ServerName := vhost;
    LoginPrompt := False;
    Params.Add('user_name=sysdba');
    Params.Add('password=' + dbPassSysdba);
    frmProgreso := TfrmProgreso.Create(Self);
    frmProgreso.Max := 100;
    frmProgreso.Min := 0;
    frmProgreso.Titulo := 'Espere un Momento por Favor...';
    frmProgreso.InfoLabel := 'Cargando Usuarios desde la Agencia ' + dBAgencia.Text;
    frmProgreso.Info.Font.Style := [fsbold];
    frmProgreso.Ejecutar;
    frmProgreso.Position := 33;
    Application.ProcessMessages;
    Active := True;
    frmProgreso.Position := 66;
    Application.ProcessMessages;
    try
      DisplayUsers;
      frmProgreso.Position := 100;
      Application.ProcessMessages;
      for I := 0 to UserInfoCount - 1 do
      begin
        with UserInfo[I] do
        begin
          if vusuario(UserName) then
          begin
            CdLogin.Append;
            CdLogin.FieldValues['ID_EMPLEADO'] := UserName;
            CdLogin.Append;
          end;
        end;
      end;
      frmProgreso.Cerrar;
    finally
      Active := False;
    end;
  end;
  end
  else
     cargaempleado(BuscaServicio(dBAgencia.KeyValue,1).vHost, BuscaServicio(dBAgencia.KeyValue,1).vPuerto);

end;

procedure TFrmRole.BTquitarClick(Sender: TObject);
begin
        try
          LrnAsignado.Items.Add(LrAsignado.Items.Strings[LrAsignado.ItemIndex]);
          LrAsignado.Items.Delete(LrAsignado.ItemIndex);
        except
          MessageDlg('Debe Seleccionar al Menos un Registro',mtError,[mbok],0);
        end;

end;

procedure TFrmRole.BTagregarClick(Sender: TObject);
begin
        try
          LrAsignado.Items.Add(LrnAsignado.Items.Strings[LrnAsignado.ItemIndex]);
          LrnAsignado.Items.Delete(LrnAsignado.ItemIndex);
        except
          MessageDlg('Debe Seleccionar al Menos un Registro',mtError,[mbok],0);
        end;
end;

procedure TFrmRole.LrnAsignadoClick(Sender: TObject);
begin
        BTagregar.Enabled := True;
        BTquitar.Enabled := False;

end;

procedure TFrmRole.LrAsignadoClick(Sender: TObject);
begin
        BTagregar.Enabled := False;
        BTquitar.Enabled := True;

end;

procedure TFrmRole.bCancelarClick(Sender: TObject);
begin
        Panel5.Enabled := True;
        jVempleado.Caption := '';
        LrnAsignado.Clear;
        LrAsignado.Clear;
        DbEmpleado.KeyValue := '';
        dBAgencia.SetFocus;
        bCrear.Enabled := False;
        if DmPermiso.IBTransaction1.InTransaction then
           DmPermiso.IBTransaction1.Commit;
        DmPermiso.IBTransaction1.StartTransaction;
        CdLogin.CancelUpdates;
end;

procedure TFrmRole.bCrearClick(Sender: TObject);
var
        sentencia :String;
        i :Integer;

begin
        antes := '';
        despues := '';
        if MessageDlg('Esta seguro de Realizar la Transacción',mtInformation,[mbyes,mbno],0) = mrno then
          Exit;
        if dBAgencia.KeyValue = 1 then
        begin
          with Dbroles do
          begin
            Filtered := False;
            First;
            while not Eof do
            begin
              with IBQuery1 do
              begin
                if Transaction.InTransaction then
                   Transaction.Commit;
                Transaction.StartTransaction;
                SQL.Clear;
                SQL.Add('REVOKE "' + Dbroles.FieldByName('rol').AsString + '" FROM ' + DbEmpleado.KeyValue);
                ExecSQL;
                Transaction.Commit;
              end; // fin del ibejecuta
              if RecNo = 1 then
                 antes := Dbroles.FieldByName('rol').AsString
              else
                antes := antes + ':' + Dbroles.FieldByName('rol').AsString;
              Next;
            end; // fin del while
          end; // fin del dbroles
          for i := 0 to LrAsignado.Count -1 do
          begin
            with IBquery1 do
            begin
              if Transaction.InTransaction then
                 Transaction.Commit;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('GRANT "' + LrAsignado.Items.Strings[I] + '" TO ' + DbEmpleado.KeyValue);
              ExecSQL;
              Transaction.Commit;
              if i = 0 then
                 despues := LrAsignado.Items.Strings[I]
              else
                 despues := despues + ':' + LrAsignado.Items.Strings[I];
            end;
          end;
        end
        else
            ejecuta(BuscaServicio(dBAgencia.KeyValue,1).vHost, BuscaServicio(dBAgencia.KeyValue,1).vPuerto);
        {if dBAgencia.KeyValue = 2 then
           ejecuta(host_abrego,puerto_abrego)
        else if dBAgencia.KeyValue = 3 then
           ejecuta(host_convencion,puerto_convencion);}
        with IBQuery1  do                             
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('insert into "per$control" values (:ID_AGENCIA,:ID_EMPLEADO_RES,:FECHA,:ID_EMPLEADO,');
          SQL.Add(':ANTES,:DESPUES,4,NULL)');
          ParamByName('ID_AGENCIA').AsInteger := dBAgencia.KeyValue;
          ParamByName('ID_EMPLEADO_RES').AsString := DBAlias;
          ParamByName('FECHA').AsDateTime := fFechaActual + Time;
          ParamByName('ID_EMPLEADO').AsString := Trim(DbEmpleado.KeyValue);
          ParamByName('ANTES').AsString := antes;
          ParamByName('DESPUES').AsString := despues;
          ExecSQL;
          Transaction.Commit;
        end;
        MessageDlg('Proceso Realizado con Exito',mtInformation,[mbok],0);
        bCancelar.Click;
end;

function TFrmRole.vUsuario(vAlias: string): boolean;
begin
        Result := True;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "per$usuario" where ID_EMPLEADO = :ID');
          ParamByName('ID').AsString := vAlias;
          Open;
          if RecordCount > 0 then
             Result := False;
          Close;
        end;
end;
procedure TThread1.Execute;
begin
        if FrmRole.dBAgencia.KeyValue = 2 then
           FrmRole.CargaEmpleado(host_abrego,puerto_abrego);
        if FrmRole.dBAgencia.KeyValue = 3 then
           FrmRole.CargaEmpleado(host_convencion,puerto_convencion);
end;
constructor TThread1.Create(Owner: TForm);
begin
        inherited Create(True);
        OwnerHandle := Owner.Handle;
        Priority := tpNormal;
        FreeOnTerminate := True;
        Suspended := False;
end;
destructor TThread1.Destroy;
begin
        PostMessage(FrmRole.Handle,
        WM_ThreadDoneMsg, Self.ThreadID, 0);
        inherited destroy;
end;
procedure TFrmRole.CargaEmpleado(vhost: string;Vpuerto:Integer);
var     sentencia :String;
        tamano,i :Integer;
        Astream:TMemoryStream;
        XmlDoc,Xmlres :TsdXmlDocument;
        Nodo,Nodo1 :TXmlNode;
        cadena :string;
        AList,AListCampos:TList;        
begin
        try
          CdUsuario.CancelUpdates;
          sentencia := 'select * from PER_BUSCARUSUARIO(1)';
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
             Xmlres.LoadFromStream(Astream);
             AList := TList.Create;
             Nodo := XmlRes.Root.NodeByName('consulta000');
             Nodo.NodesByName('Registro',AList);
             for i := 0 to AList.Count -1 do
             begin
               AListCampos := TList.Create;
               TXmlNode(AList[i]).NodesByName('campo',AListCampos);
               CdUsuario.Append;
               CdUsuario.FieldValues['NOMBRE'] := TXmlNode(AListCampos[0]).ValueAsString;
               CdUsuario.FieldValues['P_APELLIDO'] := TXmlNode(AListCampos[1]).ValueAsString;
               CdUsuario.FieldValues['S_APELLIDO'] := TXmlNode(AListCampos[2]).ValueAsString;
               CdUsuario.FieldValues['ID_EMPLEADO'] := TXmlNode(AListCampos[3]).ValueAsString;
               CdUsuario.FieldValues['ROLES'] := TXmlNode(AListCampos[4]).ValueAsString;
               CdUsuario.Post;
               if vusuario(TXmlNode(AListCampos[3]).ValueAsString) then
               begin
                CdLogin.Append;
                CdLogin.FieldValues['ID_EMPLEADO'] := TXmlNode(AListCampos[3]).ValueAsString;
                CdLogin.Append;
               end;
             end;
          except
          on e: Exception do
          begin
            MessageDlg('Error Cargando Datos. ' + #13 + e.Message,mtinformation,[mbok],0);
          end;
          end;

end;

procedure TFrmRole.IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmRole.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmRole.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmRole.Ejecuta(vHost: string; vPuerto: Integer);
var     sentencia :string;
        tamano,i :Integer;
        Astream:TMemoryStream;
        XmlDoc,Xmlres :TsdXmlDocument;
        Nodo,Nodo1 :TXmlNode;
        cadena :string;
begin
          Xmlres := TsdXmlDocument.CreateName('query_info');
          Xmlres.XmlFormat := xfReadable;
          XmlDoc := TsdXmlDocument.CreateName('query_info');
          XmlDoc.XmlFormat := xfReadable;
          Nodo := XmlDoc.Root.NodeNew('querys');
          with Dbroles do
          begin
            Filtered := False;
            First;
          while not Eof do
          begin
            sentencia := 'REVOKE "' + Dbroles.FieldByName('rol').AsString + '" FROM ' + DbEmpleado.KeyValue;
            Nodo1 := Nodo.NodeNew('query');
            Nodo1.WriteString('tipo','REVOKE');
            nodo1.WriteString('sentencia',sentencia);
            if RecNo = 1 then
               antes := Dbroles.FieldByName('rol').AsString
            else
               antes := antes + ':' + Dbroles.FieldByName('rol').AsString;
            Next;
          end; // fin del while
        end; // fin del dbroles
        for i := 0 to LrAsignado.Count -1 do
        begin
          sentencia := 'GRANT "' + LrAsignado.Items.Strings[I] + '" TO ' + DbEmpleado.KeyValue;
          Nodo1 := Nodo.NodeNew('query');
          Nodo1.WriteString('tipo','GRANT');
          nodo1.WriteString('sentencia',sentencia);
          if i = 0 then
             despues := LrAsignado.Items.Strings[I]
          else
             despues := despues + ':' + LrAsignado.Items.Strings[I];
        end;
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

        //XmlDoc.SaveToFile('C:\EJE\EJE.XML');
end;

procedure TFrmRole.SpeedButton1Click(Sender: TObject);
begin
        Close;
end;

end.
