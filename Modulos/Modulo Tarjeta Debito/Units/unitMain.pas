unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobalTd, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, DateUtils, IBSQL, UnitConexion;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    ImageList: TImageList;
    PrinterSetupDialog: TPrinterSetupDialog;
    ActionList: TActionList;
    Mnu01: TMenuItem;
    ConfigurarImpresora1: TMenuItem;
    N1: TMenuItem;
    SalirdePSI1: TMenuItem;
    Configurar_Impresora: TAction;
    N2: TMenuItem;
    ToolBar1: TToolBar;
    BtnExtracto: TToolButton;
    ToolButton3: TToolButton;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    IdTime1: TIdTime;
    ToolButton2: TToolButton;
    CambiarContrasea1: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;
    Procesos1: TMenuItem;
    Diarios1: TMenuItem;
    ArchivodeSaldos1: TMenuItem;
    N3: TMenuItem;
    DescargarMovimientos1: TMenuItem;
    IBSQL1: TIBSQL;
    Informes1: TMenuItem;
    MovimientosdeunDia1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure DescargarMovimientos1Click(Sender: TObject);
    procedure MovimientosdeunDia1Click(Sender: TObject);
    procedure ArchivodeSaldos1Click(Sender: TObject);
  private
    { Private declarations }
    _tConexion :TConexion;
    SalirMal:Boolean;
    TheGraphic: TBitmap;
    FUltimaActividad:TDateTime;    
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDate;
  

implementation

{$R *.dfm}

uses unitLogin, IniFiles,
     UnitCambiarContrasena,
     UnitReLogin,UnitDescarMOVTD, UnitInformeMovDia, UnitTarjetasNovedades;

procedure TfrmMain.Configurar_ImpresoraExecute(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var frmLogin:TfrmLogin;
    frmCambiarContrasena:TfrmCambiarContrasena;
    Veces :SmallInt;
    Mensaje :String;
    Ruta:string;
    Dias:Integer;
    Ufecha,Hoy:TDate;
    MiINI :string;
    _bConectado:Boolean;
    _dFecha1 :TDate;
//    frmConectando:TfrmConectando;
begin

  Application.OnMessage := AtraparMensajes;

  Timer2.Enabled := False;
  _tConexion := TConexion.Create;
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.200.7');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',1);
    Pop3ServerMail1 := ReadString('POPSERVER','POPName1','tdebito@crediservir.com');
    Pop3ServerName1 := ReadString('POPSERVER','POPServer1','correo.crediservir.com');
    Pop3ServerPort1 := ReadInteger('POPSERVER','POPPort1',110);
    Pop3ServerUser1 := ReadString('POPSERVER','POPUserId1','tdebito');
    Pop3ServerPassword1 := ReadString('POPSERVER','POPPassword1','tdebitocreo6');
    Pop3ServerMail2 := ReadString('POPSERVER','POPName2','tdebito@crediservir.com');
    Pop3ServerName2 := ReadString('POPSERVER','POPServer2','mail.telematika.com.co');
    Pop3ServerPort2 := ReadInteger('POPSERVER','POPPort2',110);
    Pop3ServerUser2 := ReadString('POPSERVER','POPUserId2','tdebito');
    Pop3ServerPassword2 := ReadString('POPSERVER','POPPassword2','tdebitocreo6');
    SmtpServerName := ReadString('SMTPSERVER','SMTPServer','192.168.200.8');
    SmtpServerPort := ReadInteger('SMTPSERVER','SMTPPort',25);
    SmtpServerUser := ReadString('SMTPSERVER','SMTPUserId','tdebito');
    SmtpServerPassword := ReadString('SMTPSERVER','SMTPPassword','tdebito');
    SmtpServerTo := ReadString('SMTPSERVER','SMTPTo','tarjetadebito@mail1.megabanco.com.co');
    SmtpServerFrom := ReadString('SMTPSERVER','SMTPFrom','tdebito@crediservir.com');
  finally
    free;
  end;
        {IdTime1.Host := DBserver;
        if IdTime1.Connected then
           FechaHoy := IdTime1.DateTime;
        if not IdTime1.SyncTime then
        begin
          SalirMal := True;
          Exit;
        end;}
        SmtpServerToCC :=   SmtpServerTo;
        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        DBrole := 'TDEBITO';
        frmLogin.EdRole.Text := DBrole;
        _bConectado := False;
        while Not _bConectado do
          begin
           if Veces = 3 then
           begin
                SalirMal := True;
                Exit;
           end;
          if frmLogin.ShowModal = mrOk then
           begin
             with frmLogin do
             begin
                DBAlias := EdUsuario.Text;
                DBPasabordo:= EdPasabordo.Text;
             end; //fin del begin del with
            _bConectado := _tConexion.Conectar;
            if not _bConectado then
            begin
              MessageDlg('Favor revise su Usuario o Contraseña',mtInformation,[mbOk],0);
            end;
            end // fin del begin del if superior
          else
          begin
             SalirMal := True;
             Exit;
          end;
         end; // fin del while
//     _dFecha1 := fFechaActual;
  _tConexion.Desconectar;
  Ufecha := IncDay(Ufecha,Dias);
  Hoy:= fFechaActual;
  ParametrosPGP;
  Timer2.Enabled := True;
  FUltimaActividad := Now;
  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar SIFCOOPSERVIR',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
         with TIniFile.Create(MiINI) do
          try
            WriteString('DBNAME','server',DBserver);
            WriteString('DBNAME','path',DBpath);
            WriteString('DBNAME','name',DBname);
            WriteString('EMPRESA','name',Empresa);
            WriteString('EMPRESA','nit',Nit);
            WriteInteger('EMPRESA','Agencia',Agencia);
            WriteString('EMPRESA','city',Ciudad);
          finally
           begin
            dmGeneral.IBDatabase1.Connected := False;
            dmGeneral.IBTransaction1.Active  := False;
            dmGeneral.Free;
            Action:= caFree;
           end;
          end
        else
            Action := caNone
       else
           begin
            dmGeneral.IBDatabase1.Connected := False;
            dmGeneral.IBTransaction1.Active  := False;
            dmGeneral.Free;
            Action:= caFree;
           end;}
           Action := caFree;
end;

procedure TfrmMain.ConfigurarImpresora1Click(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;



procedure TfrmMain.SalirdePSI1Click(Sender: TObject);
begin
        Close;
end;


procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;                                    

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar el Módulo',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
            CanClose := True
        else
            CanClose := False
       else
           begin
            CanClose := True;
           end;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        Self.Caption := 'Módulo Tarjeta Débito - ' + DBserver;
        if SalirMal then
           Self.Close;
end;


procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        SalirdePSI1.Click;
end;


procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena:TfrmCambiarContrasena;
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
      {try
        IdTime1.Host := DBserver;
        IdTime1.SyncTime;
        IdTime1.DateTime;
      finally
        IdTime1.Disconnect;
      end;}
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
        FechaHora := Date;
end;

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
        FechaHora := Date;
end;

procedure TfrmMain.Timer2Timer(Sender: TObject);
var frmReLogin:TfrmReLogin;
    Pasabordo :string;
    ESPERA:Extended;
begin
  Timer2.Enabled := False;
  ESPERA := ((1 / 24 / 60) * DBMinutos);
  if (FUltimaActividad + ESPERA) < Now then begin
    frmReLogin := TfrmReLogin.Create(Self);
    if frmReLogin.ShowModal = mrOk then
    begin
     Pasabordo := frmReLogin.EdPasabordo.Text;
     if Pasabordo <> DBPasabordo then
      begin
        ShowMessage('Confirmación no valida!, Cerrando el Módulo');
        SalirMal := True;
        Close;
        Exit;
      end;
    end
    else
    begin
        SalirMal := True;
        Close;
        Exit;
    end;
  end;
  Timer2.Enabled := True;

end;

procedure tfrmmain.AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of
    WM_KEYFIRST..WM_KEYLAST,
    WM_LBUTTONDOWN..WM_MOUSELAST: FUltimaActividad := Now;
  end;
end;


procedure TfrmMain.DescargarMovimientos1Click(Sender: TObject);
var frmDescarMOVTD:TfrmDescarMOVTD;
begin
     frmDescarMOVTD := TfrmDescarMOVTD.Create(Self);
     frmDescarMOVTD.ShowModal;
end;

procedure TfrmMain.MovimientosdeunDia1Click(Sender: TObject);
var
  frmInformeMovDia :TfrmInformeMovDia;
begin
  frmInformeMovDia := TfrmInformeMovDia.Create(Self);
  frmInformeMovDia.ShowModal;
end;

procedure TfrmMain.ArchivodeSaldos1Click(Sender: TObject);
begin
        frmTarjetasNovedades := TfrmTarjetasNovedades.Create(Self);
        frmTarjetasNovedades.ShowModal;
end;

end.
