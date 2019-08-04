unit UnitPeticionTraslado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, JvStaticText, JvEdit, DB,
  IBCustomDataSet, IBQuery, IBDatabase, Buttons, IdBaseComponent,
  IdComponent, IdTCPConnection, sdXmlDocuments,IdTCPClient;

type
  TFrmPeticionTraslado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DbOficina: TDBLookupComboBox;
    Label2: TLabel;
    JvOficina: TJvStaticText;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DbTipo: TDBLookupComboBox;
    jvNumero: TJvEdit;
    IbTipo: TIBQuery;
    IbOficina: TIBQuery;
    DsOficina: TDataSource;
    DsTipo: TDataSource;
    IBTransaction1: TIBTransaction;
    IBconsulta: TIBQuery;
    Panel4: TPanel;
    Label5: TLabel;
    JvRadicado: TJvStaticText;
    Label6: TLabel;
    JvCuenta: TJvStaticText;
    Label7: TLabel;
    JvNombre: TJvStaticText;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DbOficinaEnter(Sender: TObject);
    procedure DbTipoEnter(Sender: TObject);
    procedure jvNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure DbOficinaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
      XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo,nodo1 :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPeticionTraslado: TFrmPeticionTraslado;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmPeticionTraslado.FormCreate(Sender: TObject);
begin
//Agencia := 2; //OJO
        if IBTransaction1.InTransaction then
           IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
        IbTipo.Close;
        IbTipo.Open;
        IbTipo.Last;
        IbOficina.Close;
        IbOficina.ParamByName('ID').AsInteger := Agencia;
        IbOficina.Open;
        IbOficina.Last;
        with IBconsulta do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT ID_AGENCIA, DESCRIPCION_AGENCIA FROM');
          SQL.Add('"gen$agencia"');
          SQL.Add('WHERE');
          SQL.Add('(ID_AGENCIA = :ID)');
          ParamByName('ID').AsInteger := Agencia;
          Open;
          JvOficina.Caption := FieldByName('DESCRIPCION_AGENCIA').AsString;
          Close;
        end;
end;

procedure TFrmPeticionTraslado.DbOficinaEnter(Sender: TObject);
begin
        DbOficina.DropDown
end;

procedure TFrmPeticionTraslado.DbTipoEnter(Sender: TObject);
begin
        DbTipo.DropDown;
end;

procedure TFrmPeticionTraslado.jvNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
        EnterTabs(Key,Self)
end;

procedure TFrmPeticionTraslado.DbOficinaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmPeticionTraslado.BitBtn1Click(Sender: TObject);
var     vConsecutivo :Integer;
        vPuerto :Integer;
        vHost,sentencia,cadena :string;
        vHora :string;
        vFecha :string;
        AList,AListCampos:TList;
        i :Integer;
begin
      try
        vHora := FormatDateTime('hh:mm:ss',Time);
        vfecha := DateToStr(fFechaActual);
        if MessageDlg('Esta Seguro de Realizar la Petición',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        with IBconsulta do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM "tras$registro" WHERE ID_PERSONA = :ID_PERSONA AND ID_IDENTIFICACION = :ID_IDENTIFICACION AND ESTADO IN (0,2)');
          ParamByName('ID_PERSONA').AsString := jvNumero.Text;
          ParamByName('ID_IDENTIFICACION').AsInteger := DbTipo.KeyValue;
          Open;
          IF RecordCount > 0 then
          begin
            MessageDlg('Ya se encuentra registrada una solicitud con este documento',mtInformation,[mbok],0);
            Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('select ID_PUERTO,ID_HOST from "gen$servidor" where ID_AGENCIA = :ID_AGENCIA and ID_SERVICIO = :ID_SERVICIO');
          ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
          ParamByName('ID_SERVICIO').AsInteger := 1;
          Open;
          vHost := FieldByName('ID_HOST').AsString;
          vPuerto := FieldByName('ID_PUERTO').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('select max(CONSECUTIVO) as CONSECUTIVO from "tras$registro" where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
          Open;
          vConsecutivo := FieldByName('CONSECUTIVO').AsInteger;
          vConsecutivo := vConsecutivo + 1;
          Close;
        end;
         sentencia := 'SELECT * FROM TRASLADO (' + IntToStr(Agencia)
         + ',' + IntToStr(vConsecutivo) + ',' + IntToStr(DbTipo.KeyValue)
         + ',' + jvNumero.Text + ',' + '''' + vHora + '''' + ',' + ''''
         + vFecha + '''' + ',' + '''' + DBAlias + '''' + ')';
         //ShowMessage(sentencia);
         //Exit;
         XmlPetc := TsdXmlDocument.CreateName('query_info');
         XmlPetc.XmlFormat := xfReadable;
         Nodo := XmlPetc.Root.NodeNew('querys');
         Nodo1 := Nodo.NodeNew('query');
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
           XmlresC.SaveToFile('C:\consulta000.xml');
           Disconnect;
           frmProgreso.Cerrar;
         end;
         AList := TList.Create;
         Nodo := XmlResc.Root.NodeByName('consulta000');
         Nodo.NodesByName('Registro',AList);
         for i := 0 to AList.Count -1 do
         begin
           AListCampos := TList.Create;
           TXmlNode(AList[i]).NodesByName('campo',AListCampos);
           if TXmlNode(AListCampos[0]).ValueAsString <> '' then
           begin
             with IBconsulta do
             begin
               Close;
               SQL.Clear;
               SQL.Add('INSERT INTO "tras$registro" VALUES(:ID_AGENCIA,:RADICADO,:ID_PERSONA,:ID_IDENTIFICACION,0,:DES,:FECHA,:DIA,:ID_EMPLEADO,NULL,NULL,:DIRECCION,:TELEFONO,:NOMBRE,NULL)');
               ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
               ParamByName('RADICADO').AsInteger := vConsecutivo;
               ParamByName('ID_PERSONA').AsString := jvNumero.Text;
               ParamByName('ID_IDENTIFICACION').AsInteger := DbTipo.KeyValue;
               ParamByName('DIA').AsString := vHora;
               ParamByName('FECHA').AsString := vFecha;
               ParamByName('ID_EMPLEADO').AsString := DBAlias;
               ParamByName('DES').AsString := '';
               ParamByName('DIRECCION').AsString := TXmlNode(AListCampos[4]).ValueAsString;
               ParamByName('TELEFONO').AsString := TXmlNode(AListCampos[3]).ValueAsString;
               ParamByName('NOMBRE').AsString := TXmlNode(AListCampos[0]).ValueAsString;               
               ExecSQL;
               Transaction.Commit;
               MessageDlg('Petición realizada con exito',mtInformation,[mbok],0);
               BitBtn1.Enabled := False;
               JvNombre.Caption := TXmlNode(AListCampos[0]).ValueAsString;
               JvRadicado.Caption := IntToStr(DbOficina.KeyValue) + '-' + FormatCurr('00000',vConsecutivo);
               JvCuenta.Caption := IntToStr(DbOficina.KeyValue) + '01-' + FormatCurr('000000',TXmlNode(AListCampos[1]).ValueAsInteger) + '-' + TXmlNode(AListCampos[2]).ValueAsString
             end;
           end
           else
           begin
             MessageDlg('Asociado no encontrado',mtInformation,[mbok],0);
             BitBtn1.Enabled := False;
             Exit;
           end;
         end;
       end;
       except
       on e: Exception do
       begin
         MessageDlg('Ha Ocurrido un error en el Proceso, con mensaje : '+ #13 + e.Message,mtError,[mbok],0);
         IBconsulta.Transaction.Rollback;
       end;
       end;


end;

procedure TFrmPeticionTraslado.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmPeticionTraslado.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmPeticionTraslado.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmPeticionTraslado.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmPeticionTraslado.BitBtn2Click(Sender: TObject);
begin
        JvRadicado.Caption := '';
        jvNumero.Text := '';
        JvCuenta.Caption := '';
        JvNombre.Caption := '';
        DbOficina.SetFocus;
        BitBtn1.Enabled := True;

end;

end.
