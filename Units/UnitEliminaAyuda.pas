unit UnitEliminaAyuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, DB, IBCustomDataSet, IBQuery,
  Buttons, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient,UnitClaseXml,DateUtils, DBClient;

type
  TFrmEliminaAyuda = class(TForm)
    IBAgencia: TIBQuery;
    dSAgencia: TDataSource;
    GroupBox2: TGroupBox;
    DbOficina: TDBLookupComboBox;
    DtFecha: TDateTimePicker;
    GroupBox1: TGroupBox;
    edCuenta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edConsecutivo: TEdit;
    dtFechaCom: TDateTimePicker;
    Label3: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IBQuery1: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    _cdLog: TClientDataSet;
    _cdLogIDEMPLEADO: TStringField;
    _cdLogFECHADIA: TDateTimeField;
    _cdLogTIPO: TIntegerField;
    _cdLogOPERACION: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure edCuentaKeyPress(Sender: TObject; var Key: Char);
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
  FrmEliminaAyuda: TFrmEliminaAyuda;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmEliminaAyuda.FormCreate(Sender: TObject);
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

procedure TFrmEliminaAyuda.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmEliminaAyuda.BitBtn1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
        _sSql :string;
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
        _tXml.Tipo := 'delete';
        _tXml.Sentencia := 'delete from "fun$consolayudas" where NUMERO_CUENTA = ' + edCuenta.Text + ' AND PERIODO  = ' + IntToStr(YearOf(dtFechaCom.DateTime));
        _tXml.CargarNodo;
        _tXml.Tipo := 'delete';
        _tXml.Sentencia := 'delete from "fun$movimiento" where NUMERO_CUENTA = ' + edCuenta.Text + ' AND CONSECUTIVO = ' + edConsecutivo.Text + ' AND FECHA = ' + QuotedStr(DateToStr(dtFechaCom.DateTime));
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
                   FieldValues['TIPO'] := 6;
                   FieldValues['OPERACION'] := 'Ayuda, : ' + edCuenta.Text + ', Oficina: ' + DbOficina.Text + ' Consecutivo: ' + edConsecutivo.Text;
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

function TFrmEliminaAyuda.EnviarXml(_iIdPuerto: Integer; sIdHost,
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

procedure TFrmEliminaAyuda.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmEliminaAyuda.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmEliminaAyuda.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmEliminaAyuda.edCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,self);
end;

end.
