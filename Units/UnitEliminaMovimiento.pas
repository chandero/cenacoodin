unit UnitEliminaMovimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, JvEdit, JvTypedEdit, JvFloatEdit,
  Mask, JvToolEdit, JvCurrEdit, Grids, DBGrids, Buttons, ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, DB,
  IBCustomDataSet, IBQuery, UnitClaseXml, DBClient;

type
  TFrmEliminaMovimiento = class(TForm)
    GroupBox2: TGroupBox;
    DbOficina: TDBLookupComboBox;
    DtFecha: TDateTimePicker;
    cbTipoMovimiento: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DbTipo: TDBLookupComboBox;
    Label2: TLabel;
    JvDg: TJvIntegerEdit;
    Label3: TLabel;
    Label4: TLabel;
    JvValor: TJvxCurrencyEdit;
    Label5: TLabel;
    EdDocumento: TEdit;
    Label6: TLabel;
    EdCaja: TEdit;
    Button1: TButton;
    GroupBox3: TGroupBox;
    DbExtracto: TDBGrid;
    GroupBox4: TGroupBox;
    DbCaja: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    EdCuenta: TEdit;
    IBAgencia: TIBQuery;
    dSAgencia: TDataSource;
    IBQuery1: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    IbTipoCaptacion: TIBQuery;
    DsTipo: TDataSource;
    CdCaja: TClientDataSet;
    DsCaja: TDataSource;
    DsExtracto: TDataSource;
    Memo1: TMemo;
    _cdLog: TClientDataSet;
    _cdLogIDEMPLEADO: TStringField;
    _cdLogFECHADIA: TDateTimeField;
    _cdLogTIPO: TIntegerField;
    _cdLogOPERACION: TMemoField;
    procedure BitBtn3Click(Sender: TObject);
    procedure DbOficinaKeyPress(Sender: TObject; var Key: Char);
    procedure EdCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdCuentaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure BitBtn1Click(Sender: TObject);
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
  FrmEliminaMovimiento: TFrmEliminaMovimiento;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmEliminaMovimiento.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmEliminaMovimiento.DbOficinaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEliminaMovimiento.EdCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEliminaMovimiento.BitBtn2Click(Sender: TObject);
begin
        JvValor.Value := 0;
        EdCuenta.Text := '';
        JvDg.Value := 0;
        EdDocumento.Text := '';
        EdCaja.Text := '';
        DbTipo.SetFocus;
        DsCaja.DataSet := CdCaja;
        DsExtracto.DataSet := CdCaja;
        Button1.Enabled := True;
        BitBtn1.Enabled := False;
end;

procedure TFrmEliminaMovimiento.EdCuentaExit(Sender: TObject);
begin
        try
          JvDg.Value := StrToInt(DigitoControl(DbTipo.KeyValue,format('%.7d',[StrToInt(EdCuenta.Text)])));
        except
          JvDg.Value := 0;
        end;
end;

procedure TFrmEliminaMovimiento.FormCreate(Sender: TObject);
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
         IbTipoCaptacion.Close;
         IbTipoCaptacion.Open;
         IbTipoCaptacion.Last;
         DbTipo.KeyValue := 2;
end;

procedure TFrmEliminaMovimiento.Button1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
        _sSql :string;
begin
        if cbTipoMovimiento.ItemIndex = 0 then
          _sSql := 'VALOR_DEBITO = ' + CurrToStr(JvValor.Value)
        else
          _sSql := 'VALOR_CREDITO = ' + CurrToStr(JvValor.Value);
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
        _tXml.Sentencia := 'SELECT * FROM "cap$extracto" ' +
                           'WHERE ' +
                           'NUMERO_CUENTA = ' + EdCuenta.Text + ' AND ' +
                           'ID_TIPO_CAPTACION = ' + IntToStr(DbTipo.KeyValue) + ' AND ' +
                           'FECHA_MOVIMIENTO = ' + QuotedStr(DateToStr(DtFecha.DateTime)) + ' AND ' +
                           'DOCUMENTO_MOVIMIENTO = ' + QuotedStr(EdDocumento.Text) + 'AND ' +
                           'DIGITO_CUENTA = ' + IntToStr(JvDg.Value) + 'AND ' +
                           'ID_AGENCIA = ' + IntToStr(DbOficina.KeyValue) + 'AND ' +
                           _sSql;
        _tXml.CargarNodo;
         if Trim(EdCaja.Text) <> '' then //validar movimiento de caja
         begin
          _tXml.Tipo := 'select';
          _tXml.Sentencia := 'SELECT * ' +
                             'FROM ' +
                             '"caj$movimiento" ' +
                             'WHERE ' +
                             'NUMERO_CUENTA = ' +  EdCuenta.Text + ' AND ' +
                             'ID_TIPO_CAPTACION = ' + IntToStr(DbTipo.KeyValue) + ' AND ' +
                             'FECHA_MOV >= ' + QuotedStr(DateToStr(DtFecha.DateTime)) + ' AND ' +
                             'ID_CAJA = ' + EdCaja.Text + ' AND ' +
                             'BILLETES = ' + CurrToStr(JvValor.Value) + ' AND ' +
                             'DOCUMENTO = ' + QuotedStr(EdDocumento.Text) + 'AND ' +
                             'ID_AGENCIA = ' + IntToStr(DbOficina.KeyValue) + 'AND ' +
                             'DIGITO_CUENTA = ' + IntToStr(JvDg.Value);
            _tXml.CargarNodo;
         end;
        Astream1 := _tXml.CargarAstream;
        try
          _tXml.AstreamEnt := EnviarXml(_iPuerto,_sHost,DbOficina.Text,Astream1);
        except
          ShowMessage('Error de Comunicación');
        end;
        if _bConexion then
        begin
          _tXml.ListaConsulta := 'Consulta000';
          DsExtracto.DataSet := _tXml.LeerXml;
          Memo1.Lines.Add(CrearInsert('Insert Into "cap$extracto" values (',_tXml.LeerXml));
          with _tXml.LeerXml do
          begin
            try
               if RecordCount > 0 then
               begin
                  BitBtn1.Enabled := True;
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
          // datos del extracto                   }
          if Trim(EdCaja.Text) <> '' then
          begin
            _tXml.ListaConsulta := 'Consulta001';
            DsCaja.DataSet := _tXml.LeerXml;
            Memo1.Lines.Add(CrearInsert('Insert Into "caj$movimiento" values (',_tXml.LeerXml));            
            with _tXml.LeerXml do
            begin
              try
                 if RecordCount > 0 then
                 begin
                    BitBtn1.Enabled := True;
                 end
                 else
                    ShowMessage('Información no Encontrada');
              except
                 ShowMessage('Información no Encontrada');
              end;
            end;
          end;
        end;
        FreeAndNil(_tXml);


end;

function TFrmEliminaMovimiento.EnviarXml(_iIdPuerto: Integer; sIdHost,
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

procedure TFrmEliminaMovimiento.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmEliminaMovimiento.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmEliminaMovimiento.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmEliminaMovimiento.BitBtn1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
        _sSql :string;
begin
        BitBtn1.Enabled := False;
        if cbTipoMovimiento.ItemIndex = 0 then
          _sSql := 'VALOR_DEBITO = ' + CurrToStr(JvValor.Value)
        else
          _sSql := 'VALOR_CREDITO = ' + CurrToStr(JvValor.Value);

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
        _tXml.Tipo := 'delete';
        _tXml.Sentencia := 'DELETE FROM "cap$extracto" ' +
                           'WHERE ' +
                           'NUMERO_CUENTA = ' + EdCuenta.Text + ' AND ' +
                           'ID_TIPO_CAPTACION = ' + IntToStr(DbTipo.KeyValue) + ' AND ' +
                           'FECHA_MOVIMIENTO = ' + QuotedStr(DateToStr(DtFecha.DateTime)) + ' AND ' +
                           'DOCUMENTO_MOVIMIENTO = ' + QuotedStr(EdDocumento.Text) + 'AND ' +
                           'DIGITO_CUENTA = ' + IntToStr(JvDg.Value) + 'AND ' +
                           'ID_AGENCIA = ' + IntToStr(DbOficina.KeyValue) + 'AND ' +
                           _sSql;
        _tXml.CargarNodo;
        if Trim(EdCaja.Text) <> '' then
        begin
          _tXml.Tipo := 'delete';
          _tXml.Sentencia := 'DELETE ' +
                             'FROM ' +
                             '"caj$movimiento" ' +
                             'WHERE ' +
                             'NUMERO_CUENTA = ' +  EdCuenta.Text + ' AND ' +
                             'ID_TIPO_CAPTACION = ' + IntToStr(DbTipo.KeyValue) + ' AND ' +
                             'FECHA_MOV >= ' + QuotedStr(DateToStr(DtFecha.DateTime)) + ' AND ' +
                             'ID_CAJA = ' + EdCaja.Text + ' AND ' +
                             'BILLETES = ' + CurrToStr(JvValor.Value) + ' AND ' +
                             'DOCUMENTO = ' + QuotedStr(EdDocumento.Text) + 'AND ' +
                             'ID_AGENCIA = ' + IntToStr(DbOficina.KeyValue) + 'AND ' +
                             'DIGITO_CUENTA = ' + IntToStr(JvDg.Value);
          _tXml.CargarNodo;
        end;
        if cbTipoMovimiento.ItemIndex <> 15 then //validacion para eliminar el rango de la libreta
        begin
          _tXml.Tipo := 'delete';
          _tXml.Sentencia := 'DELETE ' +
                             'FROM ' +
                             '"cap$libretasusada" ' +
                             'WHERE ' +
                             'NUMERO_CUENTA = ' +  EdCuenta.Text + ' AND ' +
                             'ID_TIPO_CAPTACION = ' + IntToStr(DbTipo.KeyValue) + ' AND ' +
                             'FECHA_USADA = ' + QuotedStr(DateToStr(DtFecha.DateTime)) + ' AND ' +
                             'NUMERO_TALON = ' + EdDocumento.Text + ' AND ' +
                             'ID_AGENCIA = ' + IntToStr(DbOficina.KeyValue) + 'AND ' +
                             'DIGITO_CUENTA = ' + IntToStr(JvDg.Value);
         _tXml.CargarNodo;
        end;
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
              FieldValues['TIPO'] := 2;
              FieldValues['OPERACION'] := 'El. Mov. Local de la cuenta: ' + IntToStr(DbTipo.KeyValue) + '0' + IntToStr(DbOficina.KeyValue) + '-' + CurrToStr(JvValor.Value) + ' sql:' + Memo1.Lines.Text;
              Post;
           end;
           LogBase(_cdLog);
           _cdLog.CancelUpdates;
        end
        else
           ShowMessage('No se actualizo el registro');
        FreeAndNil(_tXml);
end;

end.
