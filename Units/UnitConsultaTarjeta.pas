unit UnitConsultaTarjeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls, DB,
  IBCustomDataSet, IBQuery, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IBDatabase,Jpeg, DBClient;

type
  TFrmConsultaTarjeta = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    ImgFotoC: TImage;
    ImFirma: TImage;
    dbTipo: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    IbTipo: TIBQuery;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    GroupBox4: TGroupBox;
    mConexion: TMemo;
    IdTCPClient1: TIdTCPClient;
    CdData: TClientDataSet;
    CdDataTARJETA: TStringField;
    CdDataASOCIADO: TStringField;
    CdDataCUENTA: TStringField;
    DataSource2: TDataSource;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure dbTipoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EdNumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    function EnviarXml(_iIdPuerto: Integer; sIdHost,Desc: string; AstreamEnv: TMemoryStream): TMemoryStream;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaTarjeta: TFrmConsultaTarjeta;

implementation
uses UnitGlobales,UnitClaseXml, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmConsultaTarjeta.FormCreate(Sender: TObject);
begin
        with IbTipo do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
        end;
        IbTipo.Close;
        IbTipo.Open;
        IbTipo.Last;
        dbTipo.KeyValue := 3;

end;

procedure TFrmConsultaTarjeta.dbTipoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           EdNumeroIdentificacion.SetFocus;
end;

procedure TFrmConsultaTarjeta.BitBtn1Click(Sender: TObject);
var
     _tXml :TXml;
     Astream :TMemoryStream;
     _mFirma :TMemoryStream;
     _mFoto :TMemoryStream;
     IBDatabase1 :TIBDatabase;
     IBTransaction1: TIBTransaction;
     IBQuery2: TIBQuery;
     jpg :TJPEGImage;
     _bEncontrado :Boolean;
     _sIp :string;
     _bDato :Boolean;
     _sConexion :string;
     _sIpPing: string;
begin
        CdData.CancelUpdates;
        _sIp := '';
        Astream := TMemoryStream.Create;
        _tXml := TXml.Create;
        with IBQuery1 do
        begin
          Close;
          Open;
          while not Eof do
          begin
            _sConexion := 'Verificando ' + FieldByName('DESCRIPCION_AGENCIA').AsString + '.';
            //Validar Conexión
            _sIpPing := FieldByName('ID_HOST').AsString;
            if _sIpPing = '192.168.203.2' then
               _sIpPing := '192.168.203.1';
            if PingHost(_sIpPing) then
            begin
              _tXml.CrearXml;
              _tXml.Sentencia := 'select * from TDB_DATOTARJETA( ' + IntToStr(dbTipo.KeyValue) + ' , ' + QuotedStr(EdNumeroIdentificacion.Text) + ')';
              _tXml.Tipo := 'select';
              _tXml.CargarNodo;
              Astream := _tXml.CargarAstream;
              _tXml.AstreamEnt := EnviarXml(FieldByName('ID_PUERTO').AsInteger,FieldByName('ID_HOST').AsString,FieldByName('DESCRIPCION_AGENCIA').AsString,Astream);
              _tXml.ListaConsulta := 'Consulta000';
              _bDato := True;
              try
               _tXml.LeerXml;
              except
                _bDato := False;
              end;
              if _bDato then
              begin
                with _tXml.LeerXml do
                begin
                  if RecordCount > 0 then
                  begin
                    _sIp := IBQuery1.FieldByName('ID_HOST').AsString;
                    _sConexion := _sConexion + ' Registro Encontrado...';
                    while not Eof do
                    begin
                      CdData.Append;
                      CdData.FieldValues['TARJETA'] := FieldByName('TARJETA').AsString;
                      CdData.FieldValues['ASOCIADO'] := FieldByName('ASOCIADO').AsString;
                      CdData.FieldValues['CUENTA'] := FieldByName('CUENTA').AsString;
                      Next;
                    end;
                  end;
                end;
              end
              else
                _sConexion := _sConexion + ' No se encontraron datos...'; // Fin del bdato
            end // Fin del Valida Conexión
            else
              _sConexion := _sConexion + ' Error, No responde el Host...';
            mConexion.Lines.Add(_sConexion);              
            if _sIp <> '' then
               Break;
            Next;
          end;
        end;
        //Proceso Burcar Imagen
        if _sIp = '192.168.201.15' then
           _sIp := '192.168.201.2';
        if _sIp <> '' then
        begin
          mConexion.Lines.Add('Fin de la Busqueda.....');
          IBDatabase1 := TIBDatabase.Create(Self);
          IBTransaction1 := TIBTransaction.Create(Self);
          IBDatabase1.DataBaseName := _sIp + ':/var/db/fbird/dbimagen.fdb';
          IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
          IBDatabase1.Params.Values['User_Name'] := 'sysdba';
          IBDatabase1.Params.Values['PassWord'] := 'masterkey';
          IBDatabase1.LoginPrompt := False;
          IBDatabase1.DefaultTransaction := IBTransaction1;
          IBTransaction1.DefaultDatabase := IBDatabase1;
          IBDatabase1.Open;
          IBTransaction1.Active := True;
          IBQuery2 := TIBQuery.Create(Self);
          IBQuery2.Database := IBDatabase1;
          IBQuery2.Transaction := IBTransaction1;
          _mFirma := TMemoryStream.Create;
          _mFoto := TMemoryStream.Create;
          IBQuery2.Close;
          IBQuery2.SQL.Clear;
          IBQuery2.SQL.Add('SELECT IMAGEN.FOTO, IMAGEN.FIRMA');
          IBQuery2.SQL.Add('FROM IMAGEN');
          IBQuery2.SQL.Add('WHERE IMAGEN.ID_PERSONA = :ID_PERSONA AND');
          IBQuery2.SQL.Add('IMAGEN.ID_IDENTIFICACION = :ID_IDENTIFICACION');
          IBQuery2.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
          IBQuery2.ParamByName('ID_IDENTIFICACION').AsInteger := dbTipo.KeyValue;
          IBQuery2.Open;
          TBlobField(IBQuery2.FieldByName('FOTO')).SaveToStream(_mFoto);
          TBlobField(IBQuery2.FieldByName('FIRMA')).SaveToStream(_mFirma);
          _mFoto.Position := 0;
          _mFirma.Position := 0;
          if _mFoto.Size > 0 then
          begin
             jpg := TJpegImage.Create;
             jpg.LoadFromStream(_mFoto);
             ImgFotoC.Picture.Bitmap.Assign(jpg);
             ImgFotoC.Repaint;
             FreeAndNil(jpg);
          end;
          if _mFirma.Size > 0 then
          begin
             jpg := TJpegImage.Create;
             jpg.LoadFromStream(_mFirma);
             ImFirma.Picture.Bitmap.Assign(jpg);
             ImFirma.Repaint;
             FreeAndNil(jpg);
          end;
          IBTransaction1.Active := False;
          IBDatabase1.Close;
          FreeAndNil(IBQuery2);
          FreeAndNil(IBTransaction1);
          FreeAndNil(IBDatabase1);
          FreeAndNil(_mFirma);
          FreeAndNil(_mFoto);
          FreeAndNil(_tXml);
        end
        else
          mConexion.Lines.Add('No se Encontraron Registros....')
end;

function TFrmConsultaTarjeta.EnviarXml(_iIdPuerto: Integer; sIdHost,
  Desc: string; AstreamEnv: TMemoryStream): TMemoryStream;
var     Cadena :string;
        AStream : TMemoryStream;
        Tamano :Integer;
begin
{
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Enviando Informacion de ' + Desc;
        frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
        with IdTCPClient1 do
        begin
          Port :=_iIdPuerto;
          Host := sIdHost;
          Application.ProcessMessages;
          Connect;
          if Connected then
          begin
            Application.ProcessMessages;
            frmProgreso.Position := 2;
            frmProgreso.Min := 0;
            frmProgreso.Ejecutar;
            Cadena := ReadLn();
            WriteInteger(AStreamEnv.Size);
            OpenWriteBuffer;
            WriteStream(AStreamEnv);
            CloseWriteBuffer;
            FreeAndNil(AStreamEnv);
            tamano := ReadInteger;
            AStream := TMemoryStream.Create;
            ReadStream(Astream,tamano,False);
            Disconnect;
            frmProgreso.Cerrar;
          end;
        end;
        Result := AStream;
        }
end;

procedure TFrmConsultaTarjeta.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmConsultaTarjeta.EdNumeroIdentificacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        if Key = #13 then
           BitBtn1.SetFocus;

end;

procedure TFrmConsultaTarjeta.BitBtn2Click(Sender: TObject);
begin
        CdData.CancelUpdates;
        ImgFotoC.Picture := nil;
        ImFirma.Picture := nil;
        dbTipo.SetFocus;
        mConexion.Text := '';
        EdNumeroIdentificacion.Text := '';
end;

end.
