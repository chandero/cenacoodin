unit UnitExtractoAgencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, JvEdit, JvStaticText, Buttons,
  ComCtrls, IBDatabase, DB, IBCustomDataSet, IBQuery, DateUtils, DBClient,
  Grids, DBGrids,sdXmlDocuments, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient;

type
  TFrmExtractoAgencia = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DbAgencia: TDBLookupComboBox;
    DbTipo: TDBLookupComboBox;
    JvNumero: TJvEdit;
    JvAno: TJvEdit;
    JvDg: TJvStaticText;
    JvNombre: TJvStaticText;
    vFecha1: TDateTimePicker;
    vFecha2: TDateTimePicker;
    BtEjecutar: TBitBtn;
    Panel2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    JvSi: TJvEdit;
    jVsF: TJvEdit;
    IbAgencias: TIBQuery;
    IbTipo: TIBQuery;
    IBTransaction1: TIBTransaction;
    DsTipo: TDataSource;
    DsAgencias: TDataSource;
    CdExtracto: TClientDataSet;
    DsExtracto: TDataSource;
    DBGrid1: TDBGrid;
    CdExtractoFECHA: TDateField;
    CdExtractoDOCUMENTO: TStringField;
    CdExtractoCOD: TStringField;
    CdExtractoDESCRIPCION: TStringField;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    CdExtractoHORA: TStringField;
    CdExtractoDEBITO: TStringField;
    CdExtractoCREDITO: TStringField;
    CdExtractoSALDO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure JvNumeroExit(Sender: TObject);
    procedure DbAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure vFecha1Exit(Sender: TObject);
    procedure BtEjecutarClick(Sender: TObject);
    procedure DbAgenciaEnter(Sender: TObject);
    procedure DbTipoEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
  DbServer :string;
  DbPuerto :Integer;
  XmlPetC :TsdXmlDocument;
  XmlresC :TsdXmlDocument;
  nodo,nodo1 :TXmlNode;
  Valida_Tcp :Boolean;
  Astream :TMemoryStream;
  tamano :Integer;
  sentencia: string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExtractoAgencia: TFrmExtractoAgencia;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmExtractoAgencia.FormCreate(Sender: TObject);
begin
        IbTipo.Close;
        IbTipo.Open;
        IbTipo.Last;
        IbAgencias.Close;
        IbAgencias.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IbAgencias.Open;
        IbAgencias.Last;
        JvAno.Text := IntToStr(YearOf(fFechaActual));
        vFecha1.DateTime := fFechaActual;
        vFecha2.DateTime := fFechaActual;
        vFecha1.MaxDate := fFechaActual;
        vFecha2.MaxDate := fFechaActual;

end;

procedure TFrmExtractoAgencia.JvNumeroExit(Sender: TObject);
begin
        try
          JvDg.Caption := DigitoControl(DbTipo.KeyValue,format('%.7d',[StrToInt(JvNumero.Text)]));
        except
        begin
          JvNumero.Text := '0';
          JvDg.Caption := '0';
        end;
        end;
end;

procedure TFrmExtractoAgencia.DbAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmExtractoAgencia.vFecha1Exit(Sender: TObject);
begin
        vFecha2.DateTime := vFecha1.DateTime + 2;
end;

procedure TFrmExtractoAgencia.BtEjecutarClick(Sender: TObject);
var     cadena :string;
         AList,AListCampos:TList;
         i :Integer;
begin
        Panel1.Enabled := False;
        DbPuerto := buscaservicio(DbAgencia.KeyValue,1).vPuerto;
        dbserver := buscaservicio(DbAgencia.KeyValue,1).vHost;
        sentencia := 'SELECT * FROM P_CAP_EXTRACTO(' + IntToStr(DbAgencia.KeyValue) + ',' + IntToStr(DbTipo.KeyValue) + ',' + JvNumero.Text + ',' + JvDg.Caption + ',' + '''' + DateToStr(vfecha1.Date) + '''' +  ',' + '''' + DateToStr(vFecha2.date) + '''' + ', ' + jvano.Text + ')';
        //Memo1.Text := sentencia;
        XmlPetc := TsdXmlDocument.CreateName('query_info');
        XmlPetc.XmlFormat := xfReadable;
        Nodo := XmlPetc.Root.NodeNew('querys');
        nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        //BUSCA SALDO ACTUAL y NOMBRES DEL ASOCIADO
        sentencia := 'SELECT * FROM P_CAP_EXTRACTO_NOMBRE(' + IntToStr(DbAgencia.KeyValue) + ',' + IntToStr(DbTipo.KeyValue) + ',' + JvNumero.Text + ',' + JvDg.Caption + ','  + '''' + DateToStr(vFecha2.date) + '''' + ', ' + jvano.Text + ')';
        nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        XmlresC := TsdXmlDocument.Create;
        XmlresC.EncodingString := 'ISO8859-1';
        XmlresC.XmlFormat := xfReadable;
        Astream := TMemoryStream.Create;
        XmlPetC.SaveToStream(Astream);
        //XmlPetC.SaveToFile('c:\11\salida.xml');
        with IdTCPClient1 do
        begin
          Port := DbPuerto;
          Host := dbserver;
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
          end; // fin del try
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
            //XmlresC.SaveToFile('c:\11\extracto.xml');
            Disconnect;
            frmProgreso.Cerrar;
          end;

           AList := TList.Create;
           Nodo := XmlResc.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do // ,SE CARGA EL EXTRACTO
           begin
              AListCampos := TList.Create;
              TXmlNode(AList[i]).NodesByName('campo',AListCampos);
              CdExtracto.Append;
              CdExtracto.FieldValues['FECHA'] := TXmlNode(AListCampos[0]).ValueAsDateTime;
              CdExtracto.FieldValues['HORA'] := TXmlNode(AListCampos[1]).ValueAsString;
              CdExtracto.FieldValues['DOCUMENTO'] := TXmlNode(AListCampos[2]).ValueAsString;
              CdExtracto.FieldValues['COD'] := FormatCurr('000',TXmlNode(AListCampos[3]).ValueAsInteger);
              CdExtracto.FieldValues['DESCRIPCION'] := TXmlNode(AListCampos[4]).ValueAsString;
              CdExtracto.FieldValues['DEBITO'] := CurrToStrf(TXmlNode(AListCampos[6]).ValueAsFloat,ffNumber,0);
              CdExtracto.FieldValues['CREDITO'] := CurrToStrf(TXmlNode(AListCampos[5]).ValueAsFloat,ffNumber,0);
              CdExtracto.FieldValues['SALDO'] := CurrToStrf(TXmlNode(AListCampos[7]).ValueAsFloat,ffNumber,0);
              CdExtracto.Post;
           end;
           AList := TList.Create;
           Nodo := XmlResc.Root.NodeByName('consulta001');
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
              AListCampos := TList.Create;
              TXmlNode(AList[i]).NodesByName('campo',AListCampos);
              JvNombre.Caption := TXmlNode(AListCampos[0]).ValueAsString;
              JvSi.Text := CurrToStrf(TXmlNode(AListCampos[1]).ValueAsFloat,ffCurrency,0);
              jVsF.Text := CurrToStrf(TXmlNode(AListCampos[2]).ValueAsFloat,ffCurrency,0);
           end;
         end;
         if JvNombre.Caption = '' then
            MessageDlg('No se Encontraron Datos para Esta Cuenta',mtinformation,[mbok],0);

end;

procedure TFrmExtractoAgencia.DbAgenciaEnter(Sender: TObject);
begin
        DbAgencia.DropDown
end;

procedure TFrmExtractoAgencia.DbTipoEnter(Sender: TObject);
begin
        DbTipo.DropDown
end;

procedure TFrmExtractoAgencia.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmExtractoAgencia.BitBtn2Click(Sender: TObject);
begin
        JvNumero.Text := '';
        JvDg.Caption := '';
        JvSi.Text := '';
        jVsF.Text := '';
        CdExtracto.CancelUpdates;
        Panel1.Enabled := True;
        JvNombre.Caption := '';
        vFecha1.DateTime := fFechaActual;
        vFecha2.DateTime := fFechaActual;
        DbAgencia.SetFocus;
end;

procedure TFrmExtractoAgencia.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;
end;

procedure TFrmExtractoAgencia.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmExtractoAgencia.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

end.
