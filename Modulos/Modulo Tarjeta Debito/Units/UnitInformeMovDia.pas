unit UnitInformeMovDia;

interface

uses
  StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pr_Common, pr_TxClasses, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, IBCustomDataSet, IBQuery, IBSQL,UnitClaseXml,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, FR_DSet,
  FR_DBSet, FR_Class;

type
  TfrmInformeMovDia = class(TForm)
    reportemov: TprTxReport;
    CDS: TClientDataSet;
    CDSID_TARJETA: TStringField;
    CDSCUENTA: TStringField;
    CDSASOCIADO: TStringField;
    CDSTERMINAL: TStringField;
    CDSSECUENCIA: TStringField;
    CDSMONTO: TCurrencyField;
    CDSCOMISION: TCurrencyField;
    CDSAPROBADA: TBooleanField;
    Label1: TLabel;
    EdFecha: TDateTimePicker;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    CDSID_AGENCIA: TIntegerField;
    CDSAGENCIA: TStringField;
    Report1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    _tXml :TXml;
    _bConexion :Boolean;
    function EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string;
      AstreamEnv: TMemoryStream): TMemoryStream;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeMovDia: TfrmInformeMovDia;

implementation

{$R *.dfm}

uses UnitGlobalTD,UnitDmGeneral, UnitPantallaProgreso;

procedure TfrmInformeMovDia.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInformeMovDia.btnProcesarClick(Sender: TObject);
var
     Astream1 :TMemoryStream;
begin
        CDS.EmptyDataSet;
        
        _tXml.CrearXml;
        Astream1 := TMemoryStream.Create;
        _tXml.Tipo := 'select';
        _tXml.Sentencia := 'SELECT * FROM PRD$MOVIMIENTOTARJETA(' + QuotedStr(DateToStr(EdFecha.Date)) + ' ORDER BY ID_AGENCIA,APROBADA)';
        _tXml.CargarNodo;
        Astream1 := _tXml.CargarAstream;
        try
          _tXml.AstreamEnt := EnviarXml(3052,'192.168.200.8','CREDISERVIR',Astream1);
        except
          ShowMessage('No se logro Conexion con el Servidor');
        end;
        if _bConexion then
        begin
          _tXml.ListaConsulta := 'Consulta000';
          with _tXml.LeerXml do
          begin
            while not Eof do
            begin
             CDS.Open;
             CDS.Insert;
             CDS.FieldByName('ID_TARJETA').AsString := LeftStr(FieldByName('TARJETA').AsString,16);
             CDS.FieldByName('CUENTA').AsString := FieldByName('TP').AsString +
                                                   Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) +
                                                   Format('%.7d',[FieldByName('NM').AsInteger]) +
                                                   FieldByName('DG').AsString;
             CDS.FieldByName('ASOCIADO').AsString := FieldByName('NOMBRES').AsString;
             CDS.FieldByName('TERMINAL').AsString := FieldByName('TERMINAL').AsString;
             CDS.FieldByName('SECUENCIA').AsString := FieldByName('SECUENCIA').AsString;
             CDS.FieldByName('MONTO').AsCurrency := FieldByName('MONTO').AsCurrency;
             CDS.FieldByName('COMISION').AsCurrency := FieldByName('COMISION').AsCurrency;
             CDS.FieldByName('APROBADA').AsBoolean := InttoBoolean(FieldByName('COMISION').asinteger);
             CDS.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
             CDS.FieldByName('AGENCIA').AsString := FieldByName('AGENCIA').AsString;
             CDS.Post;
             CDS.Close;
             Next;
           end;
          end;
        end;
        {reportemov.Variables.ByName['EMPRESA'].AsString := Empresa;
        reportemov.Variables.ByName['NIT'].AsString := Nit;
        reportemov.Variables.ByName['FECHACORTE'].AsDateTime := EdFecha.Date;

        if reportemov.PrepareReport then
           reportemov.PreviewPreparedReport(True);}
      // Report1.LoadFromFile()



end;

function TfrmInformeMovDia.EnviarXml(_iIdPuerto: Integer; sIdHost,
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

procedure TfrmInformeMovDia.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeMovDia.FormCreate(Sender: TObject);
begin
        _tXml := TXml.Create;
        EdFecha.Date := fFechaActual -1;
        EdFecha.MaxDate := fFechaActual -1;
end;

end.
