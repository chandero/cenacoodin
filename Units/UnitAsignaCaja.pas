unit UnitAsignaCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, DB,
  DBClient, JvStaticText, IBCustomDataSet, IBQuery, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, UnitClaseXml;

type
  TFrmAsignaCaja = class(TForm)
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    bCrear: TBitBtn;
    bCancelar: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DbListaAgencia: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    CdCajas: TClientDataSet;
    DsCajas: TDataSource;
    CdCajasIDCAJA: TIntegerField;
    CdCajasCAJA: TStringField;
    CdCajasEMPLEADO: TStringField;
    CdCajasFECHA: TDateField;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    DbListaEmp: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label3: TLabel;
    CdCajasID_EMPLEADO: TStringField;
    DbAgencia: TDataSource;
    DbEmpleado: TDataSource;
    IbAgencia: TIBQuery;
    CdEmpleado: TClientDataSet;
    CdEmpleadoID_EMPLEADO: TStringField;
    CdEmpleadoEMPLEADO: TStringField;
    IdTCPClient1: TIdTCPClient;
    procedure BitBtn1Click(Sender: TObject);
  private
    _tXml :TXml;
    { Private declarations }
  public
  published
    function EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string;
      AstreamEnv: TMemoryStream): TMemoryStream;
    { Public declarations }
  end;

var
  FrmAsignaCaja: TFrmAsignaCaja;

implementation

uses UnitPantallaProgreso;

{$R *.dfm}

function TFrmAsignaCaja.EnviarXml(_iIdPuerto: Integer; sIdHost,
  Desc: string; AstreamEnv: TMemoryStream): TMemoryStream;
var     Cadena :string;
        AStream : TMemoryStream;
        Tamano :Integer;
begin
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
end;

procedure TFrmAsignaCaja.BitBtn1Click(Sender: TObject);
begin
        _tXml := TXml.Create;
        
end;

end.
