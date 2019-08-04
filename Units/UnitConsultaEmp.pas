unit UnitConsultaEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, IBDatabase, IBCustomDataSet, IBQuery,
  DBCtrls, DBClient, ComCtrls, JvComCtrls, ImgList, JvComponent, sdXmlDocuments,JvClock,
  JvStaticText, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IBServices, Grids, DBGrids, Buttons;

type
  TFrmConsultaEmp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    IBAgencia: TIBQuery;
    IBTransaction1: TIBTransaction;
    DsAgencia: TDataSource;
    dBAgencia: TDBLookupComboBox;
    CdLogin: TClientDataSet;
    CdLoginID_EMPLEADO: TStringField;
    DsLogin: TDataSource;
    Label4: TLabel;
    DbEmpleado: TDBLookupComboBox;
    Jv: TJvTreeView;
    ImageList1: TImageList;
    JvClock1: TJvClock;
    pGeneral: TPanel;
    pRole: TPanel;
    pPermiso: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    JvNombre: TJvStaticText;
    JvCuenta: TJvStaticText;
    JvDocumento: TJvStaticText;
    JvLogin: TJvStaticText;
    JvSueldo: TJvStaticText;
    JvFecha: TJvStaticText;
    JvNomina: TJvStaticText;
    IdTCPClient1: TIdTCPClient;
    IBQuery1: TIBQuery;
    IBseguro: TIBSecurityService;
    CdUsuario: TClientDataSet;
    CdUsuarioNOMBRE: TStringField;
    CdUsuarioP_APELLIDO: TStringField;
    CdUsuarioS_APELLIDO: TStringField;
    CdUsuarioID_EMPLEADO: TStringField;
    CdUsuarioROLES: TStringField;
    CdUsuarioID_PERMISO: TStringField;
    CdUsuarioID_PERSONA: TStringField;
    IBQuery2: TIBQuery;
    CdUsuarioCUENTA: TStringField;
    DBGrid1: TDBGrid;
    CdPermiso: TClientDataSet;
    DsPermiso: TDataSource;
    CdPermisopermiso: TStringField;
    DsRol: TDataSource;
    CdRol: TClientDataSet;
    CdRolrole: TStringField;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Pnuevo: TPanel;
    IBQuery3: TIBQuery;
    procedure JvChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure dBAgenciaExit(Sender: TObject);
    procedure DbEmpleadoExit(Sender: TObject);
    procedure dBAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DbEmpleadoKeyPress(Sender: TObject; var Key: Char);
  private
   a :Integer;
    vAlias: string;
    procedure CargaEmpleado(vhost: string; Vpuerto: Integer);
    function vUsuario(vAlias: string): boolean;
    procedure CargarUsuario(vHost: string);
    procedure Local;
    function BuscaPermiso(id_permiso: integer): string;
    function BuscaRol(id_role: integer): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaEmp: TFrmConsultaEmp;

implementation

uses UnitPantallaProgreso,UnitGlobal,UnitGlobales, UnitDmInventario;

{$R *.dfm}

procedure TFrmConsultaEmp.JvChange(Sender: TObject; Node: TTreeNode);
begin
        case Node.Index of
        0 : begin
              pGeneral.Visible := True;
              pPermiso.Visible := False;
              pRole.Visible := False;
              Pnuevo.Visible := False;
            end;
        1 : begin
              pGeneral.Visible := False;
              pPermiso.Visible := False;
              pRole.Visible := True;
              Pnuevo.Visible := False;
            end;
        2 : begin
              pGeneral.Visible := False;
              pPermiso.Visible := True;
              pRole.Visible := False;
              Pnuevo.Visible := False;
            end;
        end;
end;

procedure TFrmConsultaEmp.FormCreate(Sender: TObject);
begin
        IBAgencia.Close;
        IBAgencia.Open;
        IBAgencia.Last;
        dBAgencia.KeyValue := 1;
end;

procedure TFrmConsultaEmp.CargaEmpleado(vhost: string; Vpuerto: Integer);
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
          sentencia := 'select * from PER_CONSULTA(' + IntToStr(dBAgencia.KeyValue) + ')' ;
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
             Xmlres.SaveToFile('c:\eje\ds.xml');
             AList := TList.Create;
             Nodo := XmlRes.Root.NodeByName('consulta000');
             Nodo.NodesByName('Registro',AList);
             for i := 0 to AList.Count -1 do
             begin
               AListCampos := TList.Create;
               TXmlNode(AList[i]).NodesByName('campo',AListCampos);
               if vusuario(TXmlNode(AListCampos[3]).ValueAsString) then
               begin
                 CdUsuario.Append;
                 CdUsuario.FieldValues['NOMBRE'] := TXmlNode(AListCampos[0]).ValueAsString;
                 CdUsuario.FieldValues['P_APELLIDO'] := TXmlNode(AListCampos[1]).ValueAsString;
                 CdUsuario.FieldValues['S_APELLIDO'] := TXmlNode(AListCampos[2]).ValueAsString;
                 CdUsuario.FieldValues['ID_EMPLEADO'] := TXmlNode(AListCampos[3]).ValueAsString;
                 CdUsuario.FieldValues['ROLES'] := TXmlNode(AListCampos[4]).ValueAsString;
                 CdUsuario.FieldValues['ID_PERMISO'] := TXmlNode(AListCampos[5]).ValueAsString;
                 CdUsuario.FieldValues['ID_PERSONA'] := TXmlNode(AListCampos[6]).ValueAsString;
                 CdUsuario.FieldValues['CUENTA'] := TXmlNode(AListCampos[7]).ValueAsString;
                 CdUsuario.Post;
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

function TFrmConsultaEmp.vUsuario(vAlias: string): boolean;
begin
        Result := True;
        with IBQuery2 do
        begin
          Close;
          //if Transaction.InTransaction then
          //   Transaction.Commit;
          //Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "per$usuario" where ID_EMPLEADO = :ID');
          ParamByName('ID').AsString := vAlias;
          Open;
          if RecordCount > 0 then
             Result := False;
          Close;
        end;


end;

procedure TFrmConsultaEmp.CargarUsuario(vHost: string);
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
  with IBQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from PER_CONSULTA(1)');
    Open;
    while not Eof do
    begin
      if vusuario(FieldByName('ID_EMPLEADO').AsString) then
      begin
        CdUsuario.Append;
        CdUsuario.FieldValues['NOMBRE'] := FieldByName('NOMBRE').AsString;
        CdUsuario.FieldValues['P_APELLIDO'] := FieldByName('P_APELLIDO').AsString;
        CdUsuario.FieldValues['S_APELLIDO'] := FieldByName('S_APELLIDO').AsString;
        CdUsuario.FieldValues['ID_EMPLEADO'] := FieldByName('ID_EMPLEADO').AsString;
        CdUsuario.FieldValues['ROLES'] := FieldByName('ID_ROLE').AsString;
        CdUsuario.FieldValues['ID_PERMISO'] := FieldByName('ID_PERMISO').AsString;
        CdUsuario.FieldValues['ID_PERSONA'] := FieldByName('ID_PERSONA').AsString;
        CdUsuario.FieldValues['CUENTA'] := FieldByName('CUENTA').AsString;
        CdUsuario.Post;
      end;
      Next;
    end;
  end;
  end
  else
    cargaempleado(BuscaServicio(dBAgencia.KeyValue,1).vHost, BuscaServicio(dBAgencia.KeyValue,1).vPuerto)


end;

procedure TFrmConsultaEmp.dBAgenciaExit(Sender: TObject);
var    vServer :string;
begin

        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select SERVIDOR from "per$servidor" where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := dBAgencia.KeyValue;
          Open;
          vServer := FieldByName('SERVIDOR').AsString;
        end;
          cargarusuario(vServer);
end;

procedure TFrmConsultaEmp.Local;
begin

end;

procedure TFrmConsultaEmp.DbEmpleadoExit(Sender: TObject);
var     id_persona,i :Integer;
        vRol, vPermiso :TStringList;
begin
        vRol := TStringList.Create;
        vPermiso := TStringList.Create;
        with CdUsuario do
        begin
          Filtered := False;
          try
            Filter := 'ID_EMPLEADO = ' + '''' + DbEmpleado.KeyValue + '''';
          except
            Exit;
          end;
          Filtered := True;
          JvNombre.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('P_APELLIDO').AsString + ' ' + FieldByName('S_APELLIDO').AsString;
          JvDocumento.Caption := FieldByName('ID_PERSONA').AsString;
          JvLogin.Caption := FieldByName('ID_EMPLEADO').AsString;
          vRol.Text := StringReplace(FieldByName('ROLES').AsString,',',#13,[RFREPLACEALL]);
          vPermiso.Text := StringReplace(FieldByName('ID_PERMISO').AsString,',',#13,[RFREPLACEALL]);
          JvCuenta.Caption := FieldByName('CUENTA').AsString;
          try
            id_persona := StrToInt(FieldByName('ID_PERSONA').AsString);
          except
            id_persona := 0;
          end;
          with DmInventario.IBQuery1 do
          begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"nom$empleado"."sueldobasico",');
            SQL.Add('"nom$tiponomina"."descripcion",');
            SQL.Add('"nom$empleado"."nitempleado",');
            SQL.Add('"nom$empleado"."fecha_registro"');
            SQL.Add('FROM');
            SQL.Add('"nom$empleado"');
            SQL.Add('INNER JOIN "nom$tiponomina" ON ("nom$empleado"."tipo_nomina"="nom$tiponomina"."codigo")');
            SQL.Add('WHERE');
            SQL.Add('("nom$empleado"."nitempleado" = :NIT)');
            ParamByName('NIT').AsInteger := id_persona;
            Open;
            JvNomina.Caption := FieldByName('descripcion').AsString;
            JvFecha.Caption := FieldByName('fecha_registro').AsString;
            JvSueldo.Caption := currtostrf(FieldByName('sueldobasico').AsCurrency,ffCurrency,2);
            Close;
          end;
          for i := 1 to vPermiso.Count -1 do
          begin
            CdPermiso.Append;
            CdPermiso.FieldValues['permiso'] := BuscaPermiso(StrToInt(vPermiso.Strings[i]));
            CdPermiso.Post;
           end;
           for i := 1 to vRol.Count -1 do
           begin
              CdRol.Append;
              CdRol.FieldValues['role'] := BuscaRol(StrToInt(vRol.Strings[i]));
              CdRol.Post;
           end;
              pGeneral.Visible := True;
              pPermiso.Visible := False;
              pRole.Visible := False;
              Pnuevo.Visible := False;

        end;
end;

procedure TFrmConsultaEmp.dBAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           EnterTabs(Key,Self)
end;

function TFrmConsultaEmp.BuscaPermiso(id_permiso: integer): string;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DESCRIPCION FROM');
          SQL.Add('"per$descripcion" WHERE (ID_PERMISO = :ID)');
          ParamByName('ID').AsInteger := id_permiso;
          Open;
          Result := FieldByName('DESCRIPCION').AsString;
        end;
end;
function TFrmConsultaEmp.BuscaRol(id_role: integer): string;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DESCRIPCION FROM');
          SQL.Add(' "per$roles" WHERE (CODIGO = :ID)');
          ParamByName('ID').AsInteger := id_role;
          Open;
          Result := FieldByName('DESCRIPCION').AsString;
        end;

end;

procedure TFrmConsultaEmp.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmConsultaEmp.BitBtn1Click(Sender: TObject);
begin
         pGeneral.Visible := False;
         pPermiso.Visible := false;
         pRole.Visible := False;
         Pnuevo.Visible := True;
         CdRol.CancelUpdates;
         CdPermiso.CancelUpdates;
         CdUsuario.CancelUpdates;
         CdLogin.CancelUpdates;
         DbEmpleado.KeyValue := '';
         dBAgencia.SetFocus;

end;

procedure TFrmConsultaEmp.DbEmpleadoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           EnterTabs(Key,Self);
end;

end.
