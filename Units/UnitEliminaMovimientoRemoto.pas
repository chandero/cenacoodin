unit UnitEliminaMovimientoRemoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, JvToolEdit,
  JvCurrEdit, JvEdit, JvTypedEdit, ComCtrls, DBCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, DB, IBCustomDataSet, IBQuery,
  DBClient,UnitClaseXml;

type
  TFrmEliminaMovimientoRemoto = class(TForm)
    CdCaja: TClientDataSet;
    IbTipoCaptacion: TIBQuery;
    DsCaja: TDataSource;
    IBQuery1: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    dSAgencia: TDataSource;
    IBAgencia: TIBQuery;
    DsTipo: TDataSource;
    GroupBox2: TGroupBox;
    DbOficina: TDBLookupComboBox;
    DtFecha: TDateTimePicker;
    cbTipoMovimiento: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DbTipo: TDBLookupComboBox;
    JvDg: TJvIntegerEdit;
    JvValor: TJvxCurrencyEdit;
    EdDocumento: TEdit;
    EdCaja: TEdit;
    Button1: TButton;
    EdCuenta: TEdit;
    GroupBox3: TGroupBox;
    DbExtracto: TDBGrid;
    GroupBox4: TGroupBox;
    DbCaja: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    Label7: TLabel;
    DbOficinaDest: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EdCajaRem: TEdit;
    GroupBox5: TGroupBox;
    DbRemoto: TDBGrid;
    DsExtracto: TDataSource;
    DsCajaRemota: TDataSource;
    _cdLog: TClientDataSet;
    _cdLogIDEMPLEADO: TStringField;
    _cdLogFECHADIA: TDateTimeField;
    _cdLogTIPO: TIntegerField;
    _cdLogOPERACION: TMemoField;
    procedure BitBtn2Click(Sender: TObject);
    procedure DbOficinaKeyPress(Sender: TObject; var Key: Char);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EdCuentaExit(Sender: TObject);
    procedure EdDocumentoExit(Sender: TObject);
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
  FrmEliminaMovimientoRemoto: TFrmEliminaMovimientoRemoto;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmEliminaMovimientoRemoto.BitBtn2Click(Sender: TObject);
begin
        JvValor.Value := 0;
        EdCuenta.Text := '';
        JvDg.Value := 0;
        EdDocumento.Text := '';
        EdCaja.Text := '';
        DbTipo.SetFocus;
        DsCaja.DataSet := CdCaja;
        DsExtracto.DataSet := CdCaja;
        DsCajaRemota.DataSet := CdCaja;
        Button1.Enabled := True;
        BitBtn1.Enabled := False;

end;

function TFrmEliminaMovimientoRemoto.EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string;
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

procedure TFrmEliminaMovimientoRemoto.DbOficinaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,self);
end;

procedure TFrmEliminaMovimientoRemoto.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmEliminaMovimientoRemoto.IdTCPClient1WorkBegin(
  Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;
end;

procedure TFrmEliminaMovimientoRemoto.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmEliminaMovimientoRemoto.Button1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
        _sSql :string;
begin
        if DbOficina.KeyValue = DbOficinaDest.KeyValue then
        begin
          ShowMessage('La Oficina local no puede ser igual que la remota');
          DbOficina.SetFocus;
          Exit;
        end;
        if cbTipoMovimiento.ItemIndex = 0 then
          _sSql := 'VALOR_DEBITO = ' + CurrToStr(JvValor.Value)
        else
          _sSql := 'VALOR_CREDITO = ' + CurrToStr(JvValor.Value);
        //Buscar Valores de Extracto y movimiento en la oficina destino
        Button1.Enabled := False;
        BitBtn1.Enabled := False;
        _tXml := TXml.Create;
        IBQuery1.Close;
        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DbOficinaDest.KeyValue;
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
                           'ID_AGENCIA = ' + IntToStr(DbOficinaDest.KeyValue) + 'AND ' +
                           _sSql;
        _tXml.CargarNodo;
        if (Trim(EdCaja.Text) <> '') then
        begin
          _tXml.Tipo := 'select';
          _tXml.Sentencia := 'SELECT * ' +
                             'FROM ' +
                             '"caj$movremotoentrada" ' +
                             'WHERE ' +
                             'NUMERO_CUENTA = ' + EdCuenta.Text + ' AND ' +
                             'ID_TIPO_CAPTACION = ' + IntToStr(DbTipo.KeyValue) + ' AND ' +
                             'FECHA_MOV >= ' + QuotedStr(DateToStr(DtFecha.DateTime)) + ' AND ' +
                             'ID_CAJA = ' + EdCajaRem.Text + ' AND ' +
                             'BILLETES = ' + CurrToStr(JvValor.Value) + ' AND ' +
                             'DOCUMENTO = ' + QuotedStr(EdDocumento.Text) + 'AND ' +
                             'ID_AGENCIA_REMOTA = ' + IntToStr(DbOficina.KeyValue) + 'AND ' +
                             'DIGITO_CUENTA = ' + IntToStr(JvDg.Value);
           _tXml.CargarNodo;
           Astream1 := _tXml.CargarAstream;
        end;
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
                  DsExtracto.DataSet := _tXml.LeerXml;
                  Memo1.Lines.Add(CrearInsert('Insert Into "cap$extracto" values (',_tXml.LeerXml));
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
          // datos del extracto
          if Trim(EdCaja.Text) <> '' then
          begin
            _tXml.ListaConsulta := 'Consulta001';
            with _tXml.LeerXml do
            begin
              try
                 if RecordCount > 0 then
                 begin
                    BitBtn1.Enabled := True;
                    DsCajaRemota.DataSet := _tXml.LeerXml;
                    Memo1.Lines.Add(CrearInsert('Insert Into "caj$movimiento" values (',_tXml.LeerXml));
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
        //Leer Información remota
        if (Trim(EdCaja.Text) <> '') then
        begin
          _tXml := TXml.Create;
          IBQuery1.Close;
          IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
          IBQuery1.Open;
          _iPuerto := IBQuery1.FieldByName('ID_PUERTO').AsInteger;
          _sHost := IBQuery1.FieldByName('ID_HOST').AsString;
          _tXml.CrearXml;
          Astream1 := TMemoryStream.Create;
          _tXml.Tipo := 'select';
          _tXml.Sentencia := 'SELECT * ' +
                             'FROM ' +
                             '"caj$movremotosalida" ' +
                             'WHERE ' +
                             'NUMERO_CUENTA = ' +  EdCuenta.Text + ' AND ' +
                             'ID_TIPO_CAPTACION = ' + IntToStr(DbTipo.KeyValue) + ' AND ' +
                             'FECHA_MOV >= ' + QuotedStr(DateToStr(DtFecha.DateTime)) + ' AND ' +
                             'ID_CAJA = ' + EdCaja.Text + ' AND ' +
                             'BILLETES = ' + CurrToStr(JvValor.Value) + ' AND ' +
                             'DOCUMENTO LIKE ' + QuotedStr('%' + EdDocumento.Text) + 'AND ' +
                             'ID_AGENCIA_REMOTA = ' + IntToStr(DbOficinaDest.KeyValue) + 'AND ' +
                             'DIGITO_CUENTA = ' + IntToStr(JvDg.Value);
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
                   DsCaja.DataSet := _tXml.LeerXml;
                   Memo1.Lines.Add(CrearInsert('Insert Into "caj$movimiento" values (',_tXml.LeerXml));
                 end
                 else
                    ShowMessage('Información no Encontrada');
              except
                 ShowMessage('Información no Encontrada');
              end;
            end;
           end;
          FreeAndNil(_tXml);
        end;
end;

procedure TFrmEliminaMovimientoRemoto.FormCreate(Sender: TObject);
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

procedure TFrmEliminaMovimientoRemoto.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmEliminaMovimientoRemoto.EdCuentaExit(Sender: TObject);
begin
        try
          JvDg.Value := StrToInt(DigitoControl(DbTipo.KeyValue,format('%.7d',[StrToInt(EdCuenta.Text)])));
        except
          JvDg.Value := 0;
        end;
end;

procedure TFrmEliminaMovimientoRemoto.EdDocumentoExit(Sender: TObject);
begin
        try
          EdDocumento.Text := IntToStr(StrToInt(EdDocumento.Text));
        except
        end;
end;

procedure TFrmEliminaMovimientoRemoto.BitBtn1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
        _sSql :string;
begin
        if DbOficina.KeyValue = DbOficinaDest.KeyValue then
        begin
          ShowMessage('La Oficina local no puede ser igual que la remota');
          DbOficina.SetFocus;
          Exit;
        end;
        if cbTipoMovimiento.ItemIndex = 0 then
          _sSql := 'VALOR_DEBITO = ' + CurrToStr(JvValor.Value)
        else
          _sSql := 'VALOR_CREDITO = ' + CurrToStr(JvValor.Value);
        //Buscar Valores de Extracto y movimiento en la oficina destino
        Button1.Enabled := False;
        BitBtn1.Enabled := False;
        _tXml := TXml.Create;
        IBQuery1.Close;
        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DbOficinaDest.KeyValue;
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
                           'ID_AGENCIA = ' + IntToStr(DbOficinaDest.KeyValue) + 'AND ' +
                           _sSql;
        _tXml.CargarNodo;
        if cbTipoMovimiento.ItemIndex = 1 then
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
                           'ID_AGENCIA = ' + IntToStr(DbOficinaDest.KeyValue) + 'AND ' +
                           'DIGITO_CUENTA = ' + IntToStr(JvDg.Value);
        _tXml.CargarNodo;
        end;
        if (Trim(EdCaja.Text) <> '') then
        begin
          _tXml.Tipo := 'delete';
          _tXml.Sentencia := 'delete ' +
                             'FROM ' +
                             '"caj$movremotoentrada" ' +
                             'WHERE ' +
                             'NUMERO_CUENTA = ' +  EdCuenta.Text + ' AND ' +
                             'ID_TIPO_CAPTACION = ' + IntToStr(DbTipo.KeyValue) + ' AND ' +
                             'FECHA_MOV >= ' + QuotedStr(DateToStr(DtFecha.DateTime)) + ' AND ' +
                             'ID_CAJA = ' + EdCajaRem.Text + ' AND ' +
                             'BILLETES = ' + CurrToStr(JvValor.Value) + ' AND ' +
                             'DOCUMENTO = ' + QuotedStr(EdDocumento.Text) + 'AND ' +
                             'ID_AGENCIA_REMOTA = ' + IntToStr(DbOficina.KeyValue) + 'AND ' +
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
          with _tXml.LeerXml do
          begin
            try
               if RecordCount > 0 then
               begin
                  BitBtn1.Enabled := True;
                  with _cdLog do
                  begin
                    Append;
                    FieldValues['IDEMPLEADO'] := DBAlias;
                    FieldValues['FECHADIA'] := Date + Time;
                    FieldValues['TIPO'] := 3;
                    FieldValues['OPERACION'] := 'El. Mov. Remoto de la cuenta: ' + IntToStr(DbTipo.KeyValue) + '0' + IntToStr(DbOficina.KeyValue) + '-' + CurrToStr(JvValor.Value) + ' sql:' + Memo1.Text ;
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
        FreeAndNil(_tXml);
        //Leer Información remota
        _tXml := TXml.Create;
        IBQuery1.Close;
        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
        IBQuery1.Open;
        _iPuerto := IBQuery1.FieldByName('ID_PUERTO').AsInteger;
        _sHost := IBQuery1.FieldByName('ID_HOST').AsString;
        _tXml.CrearXml;
        Astream1 := TMemoryStream.Create;
        if (Trim(EdCaja.Text) <> '') then
        begin
          _tXml.Tipo := 'delete';
          _tXml.Sentencia := 'delete ' +
                             'FROM ' +
                             '"caj$movremotosalida" ' +
                             'WHERE ' +
                             'NUMERO_CUENTA = ' +  EdCuenta.Text + ' AND ' +
                             'ID_TIPO_CAPTACION = ' + IntToStr(DbTipo.KeyValue) + ' AND ' +
                             'FECHA_MOV >= ' + QuotedStr(DateToStr(DtFecha.DateTime)) + ' AND ' +
                             'ID_CAJA = ' + EdCaja.Text + ' AND ' +
                             'BILLETES = ' + CurrToStr(JvValor.Value) + ' AND ' +
                             'DOCUMENTO LIKE ' + QuotedStr('%' + EdDocumento.Text) + 'AND ' +
                             'ID_AGENCIA_REMOTA = ' + IntToStr(DbOficinaDest.KeyValue) + 'AND ' +
                             'DIGITO_CUENTA = ' + IntToStr(JvDg.Value);
           _tXml.CargarNodo;
          Astream1 := _tXml.CargarAstream;
          try
            _tXml.AstreamEnt := EnviarXml(_iPuerto,_sHost,DbOficina.Text,Astream1);
          except
            ShowMessage('Error de Comunicación');
          end;
          if not _bConexion then
          begin
            ShowMessage('Error de Comunicación');
          end
          else
            ShowMessage('Operación realizada con Exito');
          FreeAndNil(_tXml);
        end;


end;

end.
