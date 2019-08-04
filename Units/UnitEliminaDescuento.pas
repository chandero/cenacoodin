unit UnitEliminaDescuento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB,
  IBCustomDataSet, IBQuery, Grids, DBGrids,UnitClaseXml, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, DBClient, JvEdit;

type
  TFrmEliminaDescuento = class(TForm)
    IBAgencia: TIBQuery;
    dSAgencia: TDataSource;
    GroupBox2: TGroupBox;
    DbOficina: TDBLookupComboBox;
    DtFecha: TDateTimePicker;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    EdSolicitud: TEdit;
    Button1: TButton;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
    IdTCPClient1: TIdTCPClient;
    IBQuery1: TIBQuery;
    dsDescuento: TDataSource;
    CdCaja: TClientDataSet;
    EdColocacion: TJvEdit;
    _cdLog: TClientDataSet;
    _cdLogIDEMPLEADO: TStringField;
    _cdLogFECHADIA: TDateTimeField;
    _cdLogTIPO: TIntegerField;
    _cdLogOPERACION: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DbOficinaKeyPress(Sender: TObject; var Key: Char);
  private
     _iPuerto :Integer;
     _sHost :string;
    _bConexion :Boolean;
    _sIdPersona :string;
  function EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string;AstreamEnv: TMemoryStream): TMemoryStream;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEliminaDescuento: TFrmEliminaDescuento;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

function TFrmEliminaDescuento.EnviarXml(_iIdPuerto: Integer; sIdHost,
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

procedure TFrmEliminaDescuento.FormCreate(Sender: TObject);
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

end;

procedure TFrmEliminaDescuento.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmEliminaDescuento.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmEliminaDescuento.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;
end;

procedure TFrmEliminaDescuento.Button1Click(Sender: TObject);
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
        _tXml.Sentencia := 'select ID_IDENTIFICACION,ID_PERSONA,ID_COLOCACION from "gen$infcrediticia" where ID_SOLICITUD = ' + QuotedStr(EdSolicitud.Text) +' AND ES_DESCUENTO = 1';
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
          dsDescuento.DataSet := _tXml.LeerXml;
          with _tXml.LeerXml do
          begin
            try
               if RecordCount > 0 then
               begin
                  //BitBtn1.Enabled := True;
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

procedure TFrmEliminaDescuento.DBGrid1DblClick(Sender: TObject);
begin
        EdColocacion.Text := dsDescuento.DataSet.FieldByName('ID_COLOCACION').AsString;
        _sIdPersona := dsDescuento.DataSet.FieldByName('ID_PERSONA').AsString;
        BitBtn1.Enabled := True;
end;

procedure TFrmEliminaDescuento.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmEliminaDescuento.BitBtn2Click(Sender: TObject);
begin
        dsDescuento.DataSet := CdCaja;
        EdColocacion.Text := '';
        EdSolicitud.Text := '';
        DbOficina.SetFocus;
        BitBtn1.Enabled := False;
        Button1.Enabled := True;
end;

procedure TFrmEliminaDescuento.BitBtn1Click(Sender: TObject);
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
        _tXml.Tipo := 'update';
        _tXml.Sentencia := 'UPDATE "gen$infcrediticia" SET ES_DESCUENTO = 0 where ID_SOLICITUD = ' + QuotedStr(EdSolicitud.Text) +' AND ES_DESCUENTO = 1' +
                           ' AND ID_PERSONA = ' + QuotedStr(_sIdPersona) + ' AND ID_COLOCACION = ' + QuotedStr(EdColocacion.Text);
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
                   FieldValues['TIPO'] := 4;
                   FieldValues['OPERACION'] := 'Eliminado Colocación para Desuento, Solicitud: ' + EdSolicitud.Text + ' Colocación: ' + EdColocacion.Text + ' Oficina: ' + DbOficina.Text;
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

procedure TFrmEliminaDescuento.DbOficinaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,self);
end;

end.
