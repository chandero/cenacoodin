unit UnitActualizaSolicitudOf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, Buttons, ExtCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, DB, IBCustomDataSet, IBQuery, UnitClaseXml,
  DBClient, JvEdit, JvTypedEdit;

type
  TFrmActualizaSolicitudOf = class(TForm)
    GroupBox2: TGroupBox;
    DbOficina: TDBLookupComboBox;
    DtFecha: TDateTimePicker;
    dSAgencia: TDataSource;
    IBAgencia: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdAsociado: TEdit;
    Label4: TLabel;
    EdSolicitud: TEdit;
    Button1: TButton;
    IdTCPClient2: TIdTCPClient;
    IBQuery1: TIBQuery;
    DsEstado: TDataSource;
    iBEstado: TIBQuery;
    IBEstadoActual: TIBQuery;
    DsActual: TDataSource;
    _cdLog: TClientDataSet;
    _cdLogIDEMPLEADO: TStringField;
    _cdLogFECHADIA: TDateTimeField;
    _cdLogTIPO: TIntegerField;
    _cdLogOPERACION: TMemoField;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    grDatos: TGroupBox;
    dbResant: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbResAct: TDBLookupComboBox;
    jvAmorAct: TJvIntegerEdit;
    jvIntAct: TJvIntegerEdit;
    jvAmorAnt: TJvIntegerEdit;
    jvIntAnt: TJvIntegerEdit;
    procedure IdTCPClient2Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient2WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient2WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DbOficinaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    _iPuerto :Integer;
    _sHost :string;
    _bConexion :Boolean;
    _sAmortizacion :string;
    _sInteres :string;
    _sRespaldo :string;
  function EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string;AstreamEnv: TMemoryStream): TMemoryStream;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmActualizaSolicitudOf: TFrmActualizaSolicitudOf;

implementation

uses UnitPantallaProgreso,UnitGlobales;

{$R *.dfm}

{ TForm1 }

function TFrmActualizaSolicitudOf.EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string;
  AstreamEnv: TMemoryStream): TMemoryStream;
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

procedure TFrmActualizaSolicitudOf.IdTCPClient2Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmActualizaSolicitudOf.IdTCPClient2WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmActualizaSolicitudOf.IdTCPClient2WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmActualizaSolicitudOf.Button1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
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
        _tXml.Sentencia := 'SELECT ' +
                           '"gen$persona".NOMBRE ||' + QuotedStr(' ') +
                           '|| "gen$persona".PRIMER_APELLIDO ||' + QuotedStr(' ') +
                           '|| "gen$persona".SEGUNDO_APELLIDO as NOMBRE, "col$solicitud".AMORTIZACION,"col$solicitud".RESPALDO,"col$solicitud".PAGO_INTERES ' +
                           'FROM ' +
                           '"gen$persona" ' +
                           'INNER JOIN "col$solicitud" ON ("gen$persona".ID_IDENTIFICACION = "col$solicitud".ID_IDENTIFICACION) ' +
                           'AND ("gen$persona".ID_PERSONA = "col$solicitud".ID_PERSONA) ' +
                           'WHERE ' +
                           '"col$solicitud".ID_SOLICITUD = ' + QuotedStr(EdSolicitud.Text);
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
                  grDatos.Enabled := True;
                  EdAsociado.Text := FieldByName('NOMBRE').AsString;
                  dbResant.KeyValue := FieldByName('RESPALDO').AsInteger;
                  dbResAct.KeyValue := FieldByName('RESPALDO').AsInteger;
                  jvAmorAct.Value := FieldByName('AMORTIZACION').AsInteger;
                  jvAmorAnt.Value := FieldByName('AMORTIZACION').AsInteger;
                  jvIntAct.Value := FieldByName('PAGO_INTERES').AsInteger;
                  jvIntAnt.Value := FieldByName('PAGO_INTERES').AsInteger;
                  BitBtn1.Enabled := True;
                  jvAmorAct.SetFocus;
               end
               else
                  ShowMessage('Solicitud no Encontrado');
            except
               ShowMessage('Solicitud no Encontrado');
            end;
          end;
        end;
        FreeAndNil(_tXml);
end;

procedure TFrmActualizaSolicitudOf.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmActualizaSolicitudOf.FormCreate(Sender: TObject);
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
         iBEstado.Close;
         iBEstado.Open;
         iBEstado.Last;
         IBEstadoActual.Close;
         IBEstadoActual.Open;
         IBEstadoActual.Last;
         DbOficina.KeyValue := 1;

end;

procedure TFrmActualizaSolicitudOf.DbOficinaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmActualizaSolicitudOf.BitBtn2Click(Sender: TObject);
begin
        EdAsociado.Text := '';
        EdSolicitud.Text := '';
        dbResant.KeyValue := -1;
        dbResAct.KeyValue := -1;
        jvAmorAct.Value := 0;
        jvAmorAnt.Value := 0;
        jvIntAct.Value := 0;
        jvIntAnt.Value := 0;
        grDatos.Enabled := False;        
        EdSolicitud.SetFocus;
        BitBtn1.Enabled := False;
end;

procedure TFrmActualizaSolicitudOf.BitBtn1Click(Sender: TObject);
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
        _tXml.Tipo := 'update';
        _tXml.Sentencia := 'update "col$solicitud" set AMORTIZACION = ' + IntToStr(jvAmorAct.Value) +
                           ', PAGO_INTERES = ' + IntToStr(jvIntAct.Value) +
                           ', RESPALDO = ' + IntToStr(dbResAct.KeyValue) +
                           'where  "col$solicitud".ID_SOLICITUD = ' + QuotedStr(EdSolicitud.Text);
        _tXml.CargarNodo;
        Astream1 := _tXml.CargarAstream;
        try
          _tXml.AstreamEnt := EnviarXml(_iPuerto,_sHost,DbOficina.Text,Astream1);
        except
          ShowMessage('Error de Comunicación');
        end;
        if _bConexion then
        begin
           ShowMessage('Actualización Realizada con Exito');
           with _cdLog do
           begin
             Append;
             FieldValues['IDEMPLEADO'] := DBAlias;
             FieldValues['FECHADIA'] := Date + Time;
             FieldValues['TIPO'] := 7;
             FieldValues['OPERACION'] := 'Actualiza Solicitud: ' + EdSolicitud.Text + ' Oficina: ' + DbOficina.Text;
             Post;
           end;
           LogBase(_cdLog);
           _cdLog.CancelUpdates;
           BitBtn1.Enabled := False;
        end
        else
           ShowMessage('No se actualizo el registro');
        FreeAndNil(_tXml);
end;

end.
