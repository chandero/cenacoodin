unit UnitPermisos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvStaticText, DBCtrls, StdCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, DBClient, IBServices, IBDatabase,sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, FR_Class;

type
  TFrmPermisos = class(TForm)
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dBAgencia: TDBLookupComboBox;
    DbEmpleado: TDBLookupComboBox;
    Panel2: TPanel;
    Label5: TLabel;
    jVempleado: TJvStaticText;
    Panel1: TPanel;
    LrPnAsignado: TListBox;
    BtQuita: TBitBtn;
    BtAgrega: TBitBtn;
    LrPAsignado: TListBox;
    Label8: TLabel;
    Label9: TLabel;
    Panel4: TPanel;
    bCrear: TBitBtn;
    bCancelar: TBitBtn;
    IBAgencia: TIBQuery;
    DsAgencia: TDataSource;
    CdLogin: TClientDataSet;
    CdLoginID_EMPLEADO: TStringField;
    DsLogin: TDataSource;
    IBTransaction1: TIBTransaction;
    IBseguro: TIBSecurityService;
    DsModulo: TDataSource;
    IBModulo: TIBQuery;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBTransaction2: TIBTransaction;
    CdUsuario: TClientDataSet;
    CdUsuarioNOMBRE: TStringField;
    CdUsuarioP_APELLIDO: TStringField;
    CdUsuarioS_APELLIDO: TStringField;
    CdUsuarioID_EMPLEADO: TStringField;
    IdTCPClient1: TIdTCPClient;
    CdUsuarioROLES: TStringField;
    SpeedButton1: TSpeedButton;
    Dbroles: TClientDataSet;
    Dbrolesrol: TStringField;
    IBroles: TIBQuery;
    IBnRoles: TIBQuery;
    BitBtn1: TBitBtn;
    frReport1: TfrReport;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dBAgenciaExit(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
    procedure dBAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure DbEmpleadoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtQuitaClick(Sender: TObject);
    procedure BtAgregaClick(Sender: TObject);
    procedure LrPnAsignadoClick(Sender: TObject);
    procedure LrPAsignadoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure bCrearClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
      antes,despues :string;
      vAlias :string;
      vPermiso :Integer;
    procedure CargarUsuario(vHost: string);
    procedure CargaEmpleado(vhost: string; Vpuerto: Integer);
    function vUsuario(vAlias: string): boolean;
    function BuscaPermiso(Id: String): string;
    procedure Local;
    function BuscaCodigo(Id: String): Integer;
    procedure Ejecuta(vHost: string; vPuerto: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPermisos: TFrmPermisos;

implementation

uses UnitPantallaProgreso,UnitGlobales,UnitGlobal;

{$R *.dfm}

procedure TFrmPermisos.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmPermisos.CargaEmpleado(vhost: string; Vpuerto: Integer);
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
          sentencia := 'select * from PER_BUSCARUSUARIO(2)';
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

procedure TFrmPermisos.CargarUsuario(vHost: string);
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

procedure TFrmPermisos.FormCreate(Sender: TObject);
begin
        IBAgencia.Close;
        IBAgencia.Open;
        IBAgencia.Last;
        dBAgencia.KeyValue := 1;
end;

function TFrmPermisos.vUsuario(vAlias: string): boolean;
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

procedure TFrmPermisos.dBAgenciaExit(Sender: TObject);
begin
           CargarUsuario(BuscaServicio(dBAgencia.KeyValue,1).vHost)
end;

procedure TFrmPermisos.bCancelarClick(Sender: TObject);
begin
        Panel5.Enabled := True;
        CdLogin.CancelUpdates;
        DbEmpleado.KeyValue := '';
        jVempleado.Caption := '';
        LrPnAsignado.Clear;
        LrPAsignado.Clear;
        dBAgencia.SetFocus;
end;

procedure TFrmPermisos.dBAgenciaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmPermisos.DbEmpleadoExit(Sender: TObject);
var     i :Integer;
        vRole :TStringList;
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
        case dBAgencia.KeyValue of
          1 : local;
          else
          begin
          with CdUsuario do
          begin
            CdUsuario.Filtered := False;
            CdUsuario.Filter := 'ID_EMPLEADO = ' + '''' + vAlias + '''';
            CdUsuario.Filtered := True;
            jVempleado.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('P_APELLIDO').AsString + ' ' + FieldByName('S_APELLIDO').AsString;
            vRole.Text := StringReplace(FieldByName('ROLES').AsString,',',#13,[rfreplaceall]);
            LrpAsignado.Clear;
            LrpnAsignado.Clear;
            Dbroles.CancelUpdates;
            for i := 0 to vRole.Count -1 do
            begin
              if vRole.Strings[i] <> '0' then
              begin
                LrpAsignado.Items.Add(Trim(buscapermiso(vRole.Strings[i])));
                Dbroles.Append;
                Dbroles.FieldValues['rol'] := Trim(buscapermiso(vRole.Strings[i]));
                Dbroles.Post;
              end;
            end; // fin for
         end; // fin cdusuario
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
             LrpnAsignado.Items.Add(Trim(IBnRoles.FieldByName('DESCRIPCION').AsString));
             IBnRoles.Next;
           end;
         end; // fin del while
           Panel5.Enabled := False;
           bCrear.Enabled := True;
         end;
            //**
      end;

end;

procedure TFrmPermisos.SpeedButton1Click(Sender: TObject);
begin
        Close;
end;

function TFrmPermisos.BuscaPermiso(Id: String): string;
begin
        with IBModulo do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('DESCRIPCION');
          SQL.Add('FROM');
          SQL.Add('"per$descripcion"');
          SQL.Add('WHERE');
          SQL.Add('(ID_PERMISO = :ID)');
          ParamByName('ID').AsString := Id;
          Open;
          Result := FieldByName('DESCRIPCION').AsString;
        end;
end;

procedure TFrmPermisos.Local;
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
          LrPAsignado.Clear;
          LrPasignado.Clear;
          Dbroles.CancelUpdates;
         IBroles.Close;
         IBroles.ParamByName('ID').AsString := vAlias;
         IBroles.Open;
         while not IBroles.Eof do
         begin
           LrPAsignado.Items.Add(Trim(IBroles.FieldByName('DESCRIPCION').AsString));
           Dbroles.Append;
           Dbroles.FieldValues['rol'] := Trim(IBroles.FieldByName('DESCRIPCION').AsString);
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
             LrpnAsignado.Items.Add(Trim(IBnRoles.FieldByName('DESCRIPCION').AsString));
             IBnRoles.Next;
           end;
         end;
         Panel5.Enabled := False;
         bCrear.Enabled := True;
        end;


end;

procedure TFrmPermisos.BtQuitaClick(Sender: TObject);
begin
        try
          LrpnAsignado.Items.Add(LrpAsignado.Items.Strings[LrpAsignado.ItemIndex]);
          LrpAsignado.Items.Delete(LrpAsignado.ItemIndex);
        except
          MessageDlg('Debe Seleccionar al Menos un Registro',mtError,[mbok],0);
        end;

end;

procedure TFrmPermisos.BtAgregaClick(Sender: TObject);
begin
        try
          LrpAsignado.Items.Add(LrpnAsignado.Items.Strings[LrpnAsignado.ItemIndex]);
          LrpnAsignado.Items.Delete(LrpnAsignado.ItemIndex);
        except
          MessageDlg('Debe Seleccionar al Menos un Registro',mtError,[mbok],0);
        end;

end;

procedure TFrmPermisos.LrPnAsignadoClick(Sender: TObject);
begin
        BTagrega.Enabled := True;
        BTquita.Enabled := False;

end;

procedure TFrmPermisos.LrPAsignadoClick(Sender: TObject);
begin
        BTagrega.Enabled := False;
        BTquita.Enabled := True;

end;

procedure TFrmPermisos.BitBtn1Click(Sender: TObject);
begin
        if frReport1.PrepareReport then
           frReport1.ShowReport
end;

procedure TFrmPermisos.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'EMPLEADO' THEN
           ParValue := jVempleado.Caption;
        if ParName = 'ASIGNADO' then
           ParValue := LrPAsignado.Items.Text;
        if ParName = 'NASIGNADO' then
           ParValue := LrPnAsignado.Items.Text;

end;

procedure TFrmPermisos.bCrearClick(Sender: TObject);
var     I :Integer;
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
              vPermiso := BuscaCodigo(FieldByName('rol').AsString);
              with IBQuery1 do
              begin
                SQL.Clear;
                SQL.Add('delete from "gen$permisos" where ID_PERMISO = :ID_PERMISO and ID_EMPLEADO = :ID_EMPLEADO');
                ParamByName('ID_PERMISO').AsInteger := vPermiso;
                ParamByName('ID_EMPLEADO').AsString := DbEmpleado.KeyValue;
                ExecSQL;
                Transaction.CommitRetaining;
              end; // fin del ibejecuta
              if RecNo = 1 then
                 antes := IntToStr(vPermiso)
              else
                antes := antes + ':' + IntToStr(vPermiso);
              Next;
            end; // fin del while
          end; // fin del dbroles
          for i := 0 to LrPAsignado.Count -1 do
          begin
            vPermiso := BuscaCodigo(LrPAsignado.Items.Strings[I]);
            with IBquery1 do
            begin
              if vPermiso <> -1 then
              begin
                SQL.Clear;
                SQL.Add('insert into "gen$permisos" values (:ID_EMPLEADO,:ID_PERMISO)');
                ParamByName('ID_PERMISO').AsInteger := vPermiso;
                ParamByName('ID_EMPLEADO').AsString := DbEmpleado.KeyValue;
                ExecSQL;
                Transaction.CommitRetaining;
                if i = 0 then
                   despues := IntToStr(vPermiso)
                else
                   despues := despues + ':' + IntToStr(vPermiso);
              end;// fin del vPermiso
            end;
          end;// fin del for
          if IBQuery1.Transaction.InTransaction then
             IBQuery1.Transaction.Commit;
          IBQuery1.Transaction.StartTransaction;
        end// fin del valida agencia
        else
          ejecuta(BuscaServicio(dBAgencia.KeyValue,1).vHost, BuscaServicio(dBAgencia.KeyValue,1).vPuerto);//AGENCIAS
        {if dBAgencia.KeyValue = 2 then
           ejecuta(host_abrego,puerto_abrego)
        else if dBAgencia.KeyValue = 3 then
           ejecuta(BuscaServicio(dBAgencia.KeyValue,1).vHost, BuscaServicio(dBAgencia.KeyValue,1).vPuerto);}
        with IBQuery1  do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('insert into "per$control" values (:ID_AGENCIA,:ID_EMPLEADO_RES,:FECHA,:ID_EMPLEADO,');
          SQL.Add(':ANTES,:DESPUES,3,NULL)');
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

function TFrmPermisos.BuscaCodigo(Id: String): Integer;
begin
        with IBModulo do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('ID_PERMISO');
          SQL.Add('FROM');
          SQL.Add('"per$descripcion"');
          SQL.Add('WHERE');
          SQL.Add('(DESCRIPCION = :ID)');
          ParamByName('ID').AsString := Id;
          Open;
          if RecordCount = 0 then
             Result := -1
          else
             Result := FieldByName('ID_PERMISO').AsInteger;
        end;
end;

procedure TFrmPermisos.Ejecuta(vHost: string; vPuerto: Integer);
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
            vPermiso := BuscaCodigo(FieldByName('rol').AsString);
            sentencia := 'delete from "gen$permisos" where ID_PERMISO = ' + IntToStr(vPermiso) + ' and ID_EMPLEADO = ' + '''' + DbEmpleado.KeyValue + '''';
            Nodo1 := Nodo.NodeNew('query');
            Nodo1.WriteString('tipo','DELETE');
            nodo1.WriteString('sentencia',sentencia);
            if RecNo = 1 then
               antes := IntToStr(vPermiso)
            else
               antes := antes + ':' + IntToStr(vPermiso);
            Next;
          end; // fin del while
        end; // fin del dbroles
        for i := 0 to LrpAsignado.Count -1 do
        begin
          vPermiso := BuscaCodigo(LrPAsignado.Items.Strings[I]);
          sentencia := 'insert into "gen$permisos" values (' + '''' + DbEmpleado.KeyValue + '''' + ',' + IntToStr(vPermiso) + ')';
          Nodo1 := Nodo.NodeNew('query');
          Nodo1.WriteString('tipo','INSERT');
          nodo1.WriteString('sentencia',sentencia);
          if i = 0 then
             despues := IntToStr(BuscaCodigo(LrPAsignado.Items.Strings[I]))
          else
             despues := despues + ':' + IntToStr(BuscaCodigo(LrPAsignado.Items.Strings[I]));
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
end;

procedure TFrmPermisos.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmPermisos.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmPermisos.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

end.
