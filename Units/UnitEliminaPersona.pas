unit UnitEliminaPersona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ComCtrls, Buttons, ExtCtrls, DB,
  IBCustomDataSet, IBQuery,UnitClaseXml, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, DBClient;

type
  TFrmEliminaDocumento = class(TForm)
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DbIdentificacion: TDBLookupComboBox;
    edNumero: TEdit;
    EdAsociado: TEdit;
    Button1: TButton;
    DbOficina: TDBLookupComboBox;
    DtFecha: TDateTimePicker;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IBAgencia: TIBQuery;
    IBDocumento: TIBQuery;
    dSAgencia: TDataSource;
    dsIdentificacion: TDataSource;
    IBQuery1: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    _cdLog: TClientDataSet;
    _cdLogIDEMPLEADO: TStringField;
    _cdLogFECHADIA: TDateTimeField;
    _cdLogTIPO: TIntegerField;
    _cdLogOPERACION: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DbOficinaKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
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
  FrmEliminaDocumento: TFrmEliminaDocumento;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmEliminaDocumento.FormCreate(Sender: TObject);
begin
         DtFecha.Date := fFechaActual;
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
         IBDocumento.Close;
         IBDocumento.Open;
         IBDocumento.Last;
         DbIdentificacion.KeyValue := 3;
end;

procedure TFrmEliminaDocumento.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmEliminaDocumento.BitBtn2Click(Sender: TObject);
begin
        edNumero.Text := '';
        BitBtn1.Enabled := False;
        EdAsociado.Text := '';
        DbOficina.DropDown;
end;

procedure TFrmEliminaDocumento.BitBtn1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
begin
        if MessageDlg('Esta seguro(a) de Realizar la Transacción',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        _tXml := TXml.Create;
        IBQuery1.Close;
        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
        IBQuery1.Open;
        _iPuerto := IBQuery1.FieldByName('ID_PUERTO').AsInteger;
        _sHost := IBQuery1.FieldByName('ID_HOST').AsString;
        _tXml.CrearXml;
        Astream1 := TMemoryStream.Create;
        _tXml.Tipo := 'select';
        _tXml.Sentencia := 'SELECT ASOCIADO FROM ELIMINAPERSONA(' + IntToStr(DbIdentificacion.KeyValue)+ ',' + QuotedStr(edNumero.Text) +')';
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
                 ShowMessage('Se elimino a: ' + FieldByName('ASOCIADO').AsString);
                 with _cdLog do
                 begin
                   Append;
                     FieldValues['IDEMPLEADO'] := DBAlias;
                     FieldValues['FECHADIA'] := Date + Time;
                     FieldValues['TIPO'] := 1;
                     FieldValues['OPERACION'] := 'Se elimino a: ' + FieldByName('ASOCIADO').AsString;
                   Post;
                 end;
                 LogBase(_cdLog);
                 _cdLog.CancelUpdates;
                 BitBtn1.Enabled := False;
               end
               else
                  ShowMessage('Documento no Encontrado');
            except
               ShowMessage('Error, Favor comunicarse con Sistemas');
            end;
          end;
        end;
        FreeAndNil(_tXml);

end;

procedure TFrmEliminaDocumento.DbOficinaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,self);
end;

procedure TFrmEliminaDocumento.Button1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
        I :Integer;
begin
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
        _tXml.Sentencia := 'select NOMBRE || ' + QuotedStr(' ') + ' || PRIMER_APELLIDO || ' + QuotedStr(' ') + ' || SEGUNDO_APELLIDO as NOMBRE from "gen$persona" where ID_IDENTIFICACION = ' + IntToStr(DbIdentificacion.KeyValue) + ' AND ID_PERSONA = ' + QuotedStr(edNumero.Text);
        //_tXml.Sentencia := 'select * from "gen$persona" where ID_IDENTIFICACION = ' + IntToStr(DbIdentificacion.KeyValue) + ' AND ID_PERSONA = ' + QuotedStr(edNumero.Text);
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
                  EdAsociado.Text := FieldByName('NOMBRE').AsString;
                 // for I := 0 TO _tXml.LeerXml.FieldCount -1 do
                 //     EdAsociado.Text := _tXml.LeerXml.Fields[I].Value;
                  BitBtn1.Enabled := True;
                  BitBtn1.SetFocus;
               end
               else
                  ShowMessage('Documento no Encontrado');
            except
               ShowMessage('Documento no Encontrado');
            end;
          end;
        end;
        FreeAndNil(_tXml);
end;

function TFrmEliminaDocumento.EnviarXml(_iIdPuerto: Integer; sIdHost,
  Desc: string; AstreamEnv: TMemoryStream): TMemoryStream;
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

procedure TFrmEliminaDocumento.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;
end;

procedure TFrmEliminaDocumento.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmEliminaDocumento.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

end.
