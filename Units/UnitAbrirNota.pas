unit UnitAbrirNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Buttons, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, UnitClaseXml, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, DBClient;

type
  TFrmAbrirNota = class(TForm)
    GroupBox2: TGroupBox;
    DbOficina: TDBLookupComboBox;
    DtFecha: TDateTimePicker;
    GroupBox1: TGroupBox;
    EdNota: TEdit;
    Label1: TLabel;
    dtFechaCom: TDateTimePicker;
    Label2: TLabel;
    Button1: TButton;
    GroupBox3: TGroupBox;
    mDescripcion: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dSAgencia: TDataSource;
    IBAgencia: TIBQuery;
    IBQuery1: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    _cdLog: TClientDataSet;
    _cdLogIDEMPLEADO: TStringField;
    _cdLogFECHADIA: TDateTimeField;
    _cdLogTIPO: TIntegerField;
    _cdLogOPERACION: TMemoField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure BitBtn1Click(Sender: TObject);
    procedure DbOficinaKeyPress(Sender: TObject; var Key: Char);
  private
     _iPuerto :Integer;
     _sHost :string;
    _bConexion :Boolean;
  function EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string;AstreamEnv: TMemoryStream): TMemoryStream;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbrirNota: TFrmAbrirNota;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmAbrirNota.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmAbrirNota.BitBtn2Click(Sender: TObject);
begin
        mDescripcion.Text := '';
        EdNota.Text := '';
        DbOficina.SetFocus;
        BitBtn1.Enabled := False;
        Button1.Enabled := True;

end;

procedure TFrmAbrirNota.FormCreate(Sender: TObject);
begin
         DtFecha.Date := fFechaActual;
         dtFechaCom.DateTime := fFechaActual;
         with IBAgencia do
         begin
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
         end;
         IBAgencia.Close;
         IBAgencia.Open;
         IBAgencia.Last;
         DbOficina.KeyValue := 1;

end;

procedure TFrmAbrirNota.Button1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
        _sSql :string;
begin
        Button1.Enabled := False;
        BitBtn1.Enabled := False;
        _tXml := TXml.Create;
        IBQuery1.Close;
        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
        IBQuery1.Open;
        _iPuerto := IBQuery1.FieldByName('ID_PUERTO').AsInteger;
        _sHost := IBQuery1.FieldByName('ID_HOST').AsString;
        _tXml.CrearXml;
        Astream1 := TMemoryStream.Create;
        _tXml.Tipo := 'select';
        _tXml.Sentencia := 'select DESCRIPCION from CON$COMPROBANTE where ID_COMPROBANTE = ' + EdNota.Text + ' AND FECHADIA = ' + QuotedStr(DateToStr(dtFechaCom.DateTime));
        _tXml.CargarNodo;
        Astream1 := _tXml.CargarAstream;
        try
          _tXml.AstreamEnt := EnviarXml(_iPuerto,_sHost,DbOficina.Text,Astream1);
        except
          ShowMessage('Error de Comunicación');
        end;
        if _bConexion then
        begin
          _tXml.ListaConsulta := 'Consulta000';
          with _tXml.LeerXml do
          begin
            try
               if RecordCount > 0 then
               begin
                  BitBtn1.Enabled := True;
                  mDescripcion.Text := FieldByName('DESCRIPCION').AsString;
               end
               else
               begin
                  ShowMessage('Información no Encontrada');
                  Exit;
               end;
            except
               ShowMessage('Información no Encontrada');
            end;
          end;
        end;


end;

function TFrmAbrirNota.EnviarXml(_iIdPuerto: Integer; sIdHost,Desc: string; AstreamEnv: TMemoryStream): TMemoryStream;
var     Cadena :string;
        AStream : TMemoryStream;
        Tamano :Integer;
begin
        _bConexion := True;
        with IdTCPClient1 do
        begin
          Port :=_iIdPuerto;
          Host := sIdHost;
          try
            Application.ProcessMessages;
            Connect;
            if Connected then
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Enviando Informacion de ' + Desc;
              frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
              Application.ProcessMessages;
              frmProgreso.Position := 2;
              frmProgreso.Min := 0;
              frmProgreso.Ejecutar;
              Cadena := ReadLn();
              WriteInteger(AStreamEnv.Size);
              OpenWriteBuffer;
              WriteStream(AStreamEnv);
              CloseWriteBuffer;
              //FreeAndNil(AStreamEnv);
              tamano := ReadInteger;
              AStream := TMemoryStream.Create;
              ReadStream(Astream,tamano,False);
              Disconnect;
              frmProgreso.Cerrar;
              Application.ProcessMessages;
            end;
          except
          on e: Exception do
          begin
            _bConexion := False;
            Disconnect;
          end;
        end;
        end;
        Result := AStream;


end;


procedure TFrmAbrirNota.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmAbrirNota.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmAbrirNota.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmAbrirNota.BitBtn1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
        _sSql :string;
begin
        if MessageDlg('Esta Seguro(a) de realizar la Transacción',mtinformation,[mbyes,mbno],0) = mrno then
           Exit;
        BitBtn1.Enabled := False;
        _tXml := TXml.Create;
        IBQuery1.Close;
        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
        IBQuery1.Open;
        _iPuerto := IBQuery1.FieldByName('ID_PUERTO').AsInteger;
        _sHost := IBQuery1.FieldByName('ID_HOST').AsString;
        _tXml.CrearXml;
        Astream1 := TMemoryStream.Create;
        _tXml.Tipo := 'update';
        _tXml.Sentencia := 'UPDATE CON$COMPROBANTE set ESTADO = ' + QuotedStr('O') + ' where ID_COMPROBANTE = ' + EdNota.Text;
        _tXml.CargarNodo;
        _tXml.Tipo := 'update';
        _tXml.Sentencia := 'UPDATE CON$AUXILIAR set ESTADOAUX = ' + QuotedStr('O') + ' where ID_COMPROBANTE = ' + EdNota.Text;
        _tXml.CargarNodo;

        Astream1 := _tXml.CargarAstream;
        try
          _tXml.AstreamEnt := EnviarXml(_iPuerto,_sHost,DbOficina.Text,Astream1);
        except
          ShowMessage('Error de Comunicación');
        end;
        if _bConexion then
        begin
          _tXml.ListaConsulta := 'Consulta000';
          with _tXml.LeerXml do
          begin
            try
               if RecordCount > 0 then
               begin
                 ShowMessage('Registro Actualizado con Exito');
                 with _cdLog do
                 begin
                   Append;
                   FieldValues['IDEMPLEADO'] := DBAlias;
                   FieldValues['FECHADIA'] := Date + Time;
                   FieldValues['TIPO'] := 5;
                   FieldValues['OPERACION'] := 'Abrir Nota Contable, Nota: ' + EdNota.Text + ', Oficina: ' + DbOficina.Text;
                   Post;
                 end;
                 LogBase(_cdLog);
                _cdLog.CancelUpdates;
               end
               else
               begin
                  ShowMessage('Información no Encontrada');
                  Exit;
               end;
            except
               ShowMessage('Información no Encontrada');
            end;
          end;
        end;
end;

procedure TFrmAbrirNota.DbOficinaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
