unit UnitEliminaAbonoCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, DB, IBCustomDataSet, IBQuery, DBClient,
  Buttons, ExtCtrls, Grids, DBGrids,UnitClaseXml;

type
  TFrmEliminaAbonoCaja = class(TForm)
    _cdLog: TClientDataSet;
    _cdLogIDEMPLEADO: TStringField;
    _cdLogFECHADIA: TDateTimeField;
    _cdLogTIPO: TIntegerField;
    _cdLogOPERACION: TMemoField;
    IBAgencia: TIBQuery;
    dSAgencia: TDataSource;
    IBQuery1: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    GroupBox2: TGroupBox;
    DbOficina: TDBLookupComboBox;
    DtFecha: TDateTimePicker;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdColocacion: TEdit;
    Label2: TLabel;
    EdComprobante: TEdit;
    Label3: TLabel;
    EdCuota: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    dtFechaK: TDateTimePicker;
    DtFechaI: TDateTimePicker;
    Button1: TButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    edCaja: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsExtracto: TDataSource;
    dsCaja: TDataSource;
    CdCaja: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DbOficinaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
     _iPuerto :Integer;
     _sHost :string;
    _bConexion :Boolean;
    _sIdPersona :string;
    _cAbonoCapital :Currency;
    _cAbonoCaja :Currency;
  function EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string;AstreamEnv: TMemoryStream): TMemoryStream;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEliminaAbonoCaja: TFrmEliminaAbonoCaja;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

function TFrmEliminaAbonoCaja.EnviarXml(_iIdPuerto: Integer; sIdHost,
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

procedure TFrmEliminaAbonoCaja.FormCreate(Sender: TObject);
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

procedure TFrmEliminaAbonoCaja.Button1Click(Sender: TObject);
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
        _tXml.Sentencia := 'select ID_COLOCACION,ID_CBTE_COLOCACION,FECHA_EXTRACTO,SALDO_ANTERIOR_EXTRACTO,ABONO_CAPITAL,ID_EMPLEADO from "col$extracto" ' +
                           ' where ID_COLOCACION = ' + QuotedStr(EdColocacion.Text) +
                           ' AND ID_CBTE_COLOCACION = ' + edComprobante.Text +
                           ' AND FECHA_EXTRACTO = ' + QuotedStr(DateToStr(DtFecha.DateTime));
        _tXml.CargarNodo;

        _tXml.Tipo := 'select';
        _tXml.Sentencia := 'select ID_COLOCACION, ID_CAJA, DOCUMENTO, CAPITAL, BILLETES from "caj$movimientocol" ' +
                           ' where ID_CAJA = ' + edCaja.Text +
                           ' AND FECHA_MOV >= ' + QuotedStr(DateToStr(DtFecha.DateTime)) +
                           ' AND ID_COLOCACION = ' + QuotedStr(EdColocacion.Text) +
                           ' AND DOCUMENTO = ' + edComprobante.Text;

        _tXml.CargarNodo;
        _tXml.Tipo := 'select';
        _tXml.Sentencia := 'select ABONOS_CAPITAL from "col$colocacion" ' +
                           ' where ID_COLOCACION = ' + QuotedStr(EdColocacion.Text);

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
          //Extracto de Colocacion
          dsExtracto.DataSet := _tXml.LeerXml;
          with _tXml.LeerXml do
          begin
            try
               if RecordCount > 0 then
               begin
                  BitBtn1.Enabled := True;
               end
               else
               begin
                  ShowMessage('Información de Extracto no Encontrada');
                  Exit;
               end;
            except
               ShowMessage('Información de Extracto no Encontrada');
            end;
          end;
          _tXml.ListaConsulta := 'Consulta001';
          dsCaja.DataSet := _tXml.LeerXml;
          with _tXml.LeerXml do
          begin
            try
               if RecordCount > 0 then
               begin
                  BitBtn1.Enabled := True;
                  _cAbonoCaja := FieldByName('CAPITAL').AsCurrency;
               end
               else
               begin
                  ShowMessage('Información De caja Encontrada');
                  Exit;
               end;
            except
               ShowMessage('Información De caja Encontrada');
            end;
          end;
          _tXml.ListaConsulta := 'Consulta002';
          with _tXml.LeerXml do
          begin
            try
               if RecordCount > 0 then
               begin
                  _cAbonoCapital := FieldByName('ABONOS_CAPITAL').AsCurrency;
               end
               else
               begin
                  ShowMessage('Información De caja Encontrada');
                  Exit;
               end;
            except
               ShowMessage('Información De caja Encontrada');
            end;
          end;
        end;

end;

procedure TFrmEliminaAbonoCaja.DbOficinaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmEliminaAbonoCaja.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmEliminaAbonoCaja.BitBtn2Click(Sender: TObject);
begin
        EdColocacion.Text := '';
        EdComprobante.Text := '';
        EdCuota.Text := '';
        edCaja.Text := '';
        dsExtracto.DataSet := CdCaja;
        dsCaja.DataSet := CdCaja;
        DbOficina.SetFocus;
end;

procedure TFrmEliminaAbonoCaja.BitBtn1Click(Sender: TObject);
var
        _tXml : TXml;
        Astream1 :TMemoryStream;
        _sSql :string;
begin
        if MessageDlg('Esta Seguro(a) de realizar la Transacción',mtinformation,[mbyes,mbno],0) = mrno then
           Exit;
        BitBtn1.Enabled := False;
        _cAbonoCapital := _cAbonoCapital - _cAbonoCaja;
        _tXml := TXml.Create;
        IBQuery1.Close;
        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
        IBQuery1.Open;
        _iPuerto := IBQuery1.FieldByName('ID_PUERTO').AsInteger;
        _sHost := IBQuery1.FieldByName('ID_HOST').AsString;
        _tXml.CrearXml;
        Astream1 := TMemoryStream.Create;
        //Eliminar Extracto detallado
        _tXml.Tipo := 'delete';
        _tXml.Sentencia := 'delete from "col$extractodet" ' +
                           ' where ID_COLOCACION = ' + QuotedStr(EdColocacion.Text) +
                           ' AND ID_CBTE_COLOCACION = ' + edComprobante.Text +
                           ' AND FECHA_EXTRACTO = ' + QuotedStr(DateToStr(DtFecha.DateTime));
        _tXml.CargarNodo;
        // Eliminar Extracto
        _tXml.Tipo := 'delete';
        _tXml.Sentencia := 'delete from "col$extracto" ' +
                           ' where ID_COLOCACION = ' + QuotedStr(EdColocacion.Text) +
                           ' AND ID_CBTE_COLOCACION = ' + edComprobante.Text +
                           ' AND FECHA_EXTRACTO = ' + QuotedStr(DateToStr(DtFecha.DateTime));
        _tXml.CargarNodo;
        //Eliminar Movimiento de caja
        _tXml.Tipo := 'delete';
        _tXml.Sentencia := 'delete from "caj$movimientocol" ' +
                           ' where ID_CAJA = ' + edCaja.Text +
                           ' AND FECHA_MOV >= ' + QuotedStr(DateToStr(DtFecha.DateTime)) +
                           ' AND ID_COLOCACION = ' + QuotedStr(EdColocacion.Text) +
                           ' AND DOCUMENTO = ' + edComprobante.Text;

        _tXml.CargarNodo;
        //Actualizar Abonos_capital, fechaI y FechaK
          _tXml.Tipo := 'update';
          _tXml.Sentencia := 'update "col$colocacion" set ABONOS_CAPITAL = ' + CurrToStr(_cAbonoCapital) +
                             ' ,FECHA_CAPITAL = ' + QuotedStr(DateToStr(dtFechaK.DateTime)) +
                             ' ,FECHA_INTERES = ' + QuotedStr(DateToStr(DtFechaI.DateTime)) +
                             ' where ID_COLOCACION = ' + QuotedStr(EdColocacion.Text);

          _tXml.CargarNodo;
        //Verificar y actualizar tabla de Liquidación
        if Trim(EdCuota.Text) <> '' then
        begin
          _tXml.Tipo := 'update';
          _tXml.Sentencia := 'update "col$tablaliquidacion" set PAGADA = 0, FECHA_PAGADA = NULL' +
                             ' where ID_COLOCACION = ' + QuotedStr(EdColocacion.Text) +
                             ' AND CUOTA_NUMERO = ' + EdCuota.Text;

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
              FieldValues['TIPO'] := 8;
              FieldValues['OPERACION'] := 'Elimino Abono de Caja: Oficina: ' + DbOficina.Text + ' Col: ' + EdColocacion.Text + ' FK: ' + DateToStr(dtFechaK.DateTime) + ' FI: ' + DateToStr(dtFechaI.DateTime);
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
