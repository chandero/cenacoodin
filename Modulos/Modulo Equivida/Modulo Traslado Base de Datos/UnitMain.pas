unit UnitMain;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QComCtrls, QExtCtrls, QButtons, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, QTypes;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    sb: TStatusBar;
    ftp: TIdFTP;
    btnProcesar: TBitBtn;
    Label1: TLabel;
    EdServidor: TEdit;
    Label2: TLabel;
    EdPuerto: TEdit;
    Label3: TLabel;
    EdUsuario: TEdit;
    Label4: TLabel;
    EdPasabordo: TEdit;
    btnCambiar: TBitBtn;
    Label5: TLabel;
    Timer1: TTimer;
    EdHora: TEdit;
    bar: TProgressBar;
    Label6: TLabel;
    btnCerrar: TBitBtn;
    Label7: TLabel;
    EdDB: TEdit;
    procedure btnCerrarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnCambiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure ftpConnected(Sender: TObject);
    procedure ftpDisconnected(Sender: TObject);
    procedure ftpStatus(axSender: TObject; const axStatus: TIdStatus;
      const asStatusText: String);
    procedure ftpWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure ftpWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure ftpWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
    procedure Procesar;
    procedure Procesargbk;
    function DoFork(const Filename: String): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  modificar:Boolean;

implementation

{$R *.xfm}

procedure TfrmMain.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
        sb.Panels[1].Text := 'Hora Actual:' + TimeToStr(Time);
end;

procedure TfrmMain.btnCambiarClick(Sender: TObject);
begin
       if not modificar then
       begin
        EdServidor.Enabled := True;
        EdPuerto.Enabled := True;
        EdUsuario.Enabled := True;
        EdPasabordo.Enabled := True;
        EdHora.Enabled := True;
        EdDB.Enabled := True;
        modificar := True;
       end
       else
       begin
        EdServidor.Enabled := False;
        EdPuerto.Enabled := False;
        EdUsuario.Enabled := False;
        EdPasabordo.Enabled := False;
        EdHora.Enabled := False;
        EdDB.Enabled := False;
        modificar := False;
       end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
        modificar := False;
end;

procedure TfrmMain.btnProcesarClick(Sender: TObject);
begin
        Procesar;
end;

procedure TfrmMain.Procesar;
begin
        with ftp do try
         Host := EdServidor.Text;
         Port := StrToInt(EdPuerto.Text);
         User := EdUsuario.Text;
         Password := EdPasabordo.Text;
         sb.Panels[0].Text := 'Estado Actual: Conectando';
         Application.ProcessMessages;
         Connect;
         finally
           sb.Panels[0].Text := 'Estado Actual: Conectado';
           Application.ProcessMessages;
        end;
end;

procedure TfrmMain.ftpConnected(Sender: TObject);
begin
      sb.Panels[0].Text := 'Estado Actual: Conectado';
//      ftp.Get(EdDB.Text,'c:\prueba.gbk' {EdDB.Text},True);
end;

procedure TfrmMain.ftpDisconnected(Sender: TObject);
begin
      sb.Panels[0].Text := 'Estado Actual: Desconectado';
end;

procedure TfrmMain.ftpStatus(axSender: TObject; const axStatus: TIdStatus;
  const asStatusText: String);
begin
        if axStatus = hsResolving then
          sb.Panels[0].Text := 'Estado Actual: Resolviendo IP'
        else
        if axStatus = hsConnecting then
          sb.Panels[0].Text := 'Estado Actual: Conectando'
        else
        if axStatus = hsConnected then
          sb.Panels[0].Text := 'Estado Actual: Conectado'
        else
        if axStatus = hsDisconnecting then
          sb.Panels[0].Text := 'Estado Actual: Desconectando'
        else
        if axStatus = hsDisconnected then
          sb.Panels[0].Text := 'Estado Actual: Desconectado';
end;

procedure TfrmMain.ftpWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
          sb.Panels[0].Text := 'Estado Actual: Iniciando Transferencia ('+IntToStr(AWorkCountMax)+')';
          bar.Min := 0;
          bar.Max := AWorkCountMax;
          bar.Position := 0;
end;

procedure TfrmMain.ftpWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
        sb.Panels[0].Text := 'Estado Actual: Transfiriendo ('+IntToStr(AWorkCount)+')';
        bar.Position := AWorkCount;
end;

procedure TfrmMain.ftpWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
          sb.Panels[0].Text := 'Estado Actual: Transferencia Finalizada';
          Procesargbk;
end;

procedure TfrmMain.Procesargbk;
begin
       DoFork('/usr/bin/restaurar'); 
end;

function TfrmMain.DoFork(const Filename: String): Integer;
var
  open_max:Longint;
  i : Longint;
begin
{   Result := fork;
   case Result of
   -1 : begin
          raise Exception.Create('Falló Fork');
        end;
    0 : begin
          open_max := sysconf(_SC_OPEN_MAX);
          for i := Succ(STDERR_FILENO) to open_max do
          begin
           fcntl(i, F_SETFD,FD_CLOEXEC);
          end;

          execlp(PChar(FileName), PChar(Filename), nil);
        end;
    end; }
end;

end.
