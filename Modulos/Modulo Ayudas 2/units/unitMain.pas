unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, pr_Common, pr_TxClasses, DB,
  IBCustomDataSet, IBQuery, DateUtils,UnitGestionarMedicos,UnitGestionarAyuda;

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
    InformesGerenciales1: TMenuItem;
    ConsultadeGerencia1: TMenuItem;
    ProcesosEspeciales1: TMenuItem;
    ToolBar1: TToolBar;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    IdTime1: TIdTime;
    CambiarContrasea1: TMenuItem;
    N8: TMenuItem;
    Timer1: TTimer;
    BtnEntregaAyudas: TToolButton;
    EntregadeAyudas1: TMenuItem;
    N2: TMenuItem;
    UltimaEntregaImpresa1: TMenuItem;
    MenuInformeDiario: TMenuItem;
    Reporte: TprTxReport;
    OD1: TOpenDialog;
    CierredelDia1: TMenuItem;
    N3: TMenuItem;
    InformeDiario1: TMenuItem;
    Timer2: TTimer;
    N4: TMenuItem;
    Mdicos1: TMenuItem;
    Ayudas1: TMenuItem;
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure EntregadeAyudas1Click(Sender: TObject);
    procedure BtnEntregaAyudasClick(Sender: TObject);
    procedure UltimaEntregaImpresa1Click(Sender: TObject);
    procedure InformeDiario1Click(Sender: TObject);
    procedure CierredelDia1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Mdicos1Click(Sender: TObject);
    procedure Ayudas1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDateTime;

implementation

{$R *.dfm}

uses unitLogin, IniFiles,
     UnitCambiarContrasena,UnitEntregaAyudasSolidaridad,
     UnitReporte, unitCierreDia;

procedure TfrmMain.Configurar_ImpresoraExecute(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var frmLogin:TfrmLogin;
    Veces :SmallInt;
    Mensaje :String;
    Ruta:string;
    Role:string;
//    frmConectando:TfrmConectando;
begin
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','0.0.0.0');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    _sServerImagen := ReadString('DBNAME','serverimagen','');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    _iPeriodo := ReadInteger('PARAMETRO','Periodo',0000);
    _cValorAportes := StrToCurr(ReadString('PARAMETRO','Aportes','0000'));
  finally
    free;
  end;

        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'FUNDACION';
        dmGeneral.IBDatabase1.Connected := False;
        while Not dmGeneral.IBDatabase1.Connected do
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
                Role := EdRole.Text;
                dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
                dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
                dmGeneral.IBDatabase1.Params.Values['User_Name'] := DBAlias;
                dmGeneral.IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
                dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := Role;
                Veces := Veces + 1;

                try
                    dmGeneral.IBDatabase1.Connected := True;
                    dmGeneral.IBTransaction1.Active := True;
                except
                        on E: Exception do
                        begin
                          if StrLIComp(PChar(E.Message),PChar('Your user name'),14) = 0 then
                           begin
                            Mensaje :='Verifique su Nombre y su Contraseña' + #10 + #13 + 'Mensaje:' + E.Message;
                            MessageBox(0,PChar(Mensaje),PChar('Usuario Invalido'),MB_OK OR MB_ICONERROR);
                           end
                          else
                           begin
                            Mensaje := 'Verifique su Configuración o Informe al Administrador de la Red' + #10 + #13 + 'Mensaje:' + E.Message;
                            MessageBox(0,PChar(Mensaje),PChar('Configuración Erronea'),MB_OK OR MB_ICONERROR);
                           end;
                        end; //fin del begin de la excepción.
                end; // fin del try

             end; //fin del begin del with

            end // fin del begin del if superior
          else
          begin
             SalirMal := True;
             Exit;
          end;
         end; // fin del while

        IdTime1.Host := DBserver;
        if IdTime1.Connected then
           FechaHoy := IdTime1.DateTime;
        if not IdTime1.SyncTime then
        begin
          SalirMal := True;
          Exit;
        end;

  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
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
        if MessageDlg('Seguro que desea cerrar Ayudas',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
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
            CanClose := True;
           end;
          end
        else
            CanClose := False
       else
           begin
            CanClose := True;
           end;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
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
        frmCambiarContrasena := TfrmCambiarContrasena.Create(self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
        FechaHora := Date;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
      try
        IdTime1.Host := DBserver;
        IdTime1.SyncTime;
        IdTime1.DateTime;
      finally
        IdTime1.Disconnect;
      end;

end;

procedure TfrmMain.EntregadeAyudas1Click(Sender: TObject);
var frmEntregaAyudasSolidaridad:TfrmEntregaAyudasSolidaridad;
begin
        frmEntregaAyudasSolidaridad := TfrmEntregaAyudasSolidaridad.Create(Self);
        frmEntregaAyudasSolidaridad.ShowModal;
end;

procedure TfrmMain.BtnEntregaAyudasClick(Sender: TObject);
begin
        EntregadeAyudas1Click(Sender);
end;

procedure TfrmMain.UltimaEntregaImpresa1Click(Sender: TObject);
begin
        OD1.InitialDir := 'C:\Reportes\';
        OD1.DefaultExt := 'Archivos de Ayudas(*.pr)|*.pr';
        OD1.Filter := 'Archivos de Ayudas(*.pr)|*.pr';
        if OD1.Execute then begin
          Reporte.LoadPreparedReportFromFile(OD1.FileName);
          Reporte.PreviewPreparedReport(True);
        end;
end;

procedure TfrmMain.InformeDiario1Click(Sender: TObject);
var frmReporte:TfrmReporte;
begin
        frmReporte := TfrmReporte.Create(Self);
        frmReporte.ShowModal;
end;

procedure TfrmMain.CierredelDia1Click(Sender: TObject);
var frmCierreDia:TfrmCierreDia;
begin
        frmCierreDia := TfrmCierreDia.Create(Self);
        frmCierreDia.ShowModal;
end;

procedure TfrmMain.Timer2Timer(Sender: TObject);
var
A,M,D,H,Min,S,MSeg:Word;
AA,MM,DD,HH,MMin,SS,MMSeg:Word;
begin
      try
        DecodeDateTime(FechaHora,A,M,D,H,Min,S,MSeg);
        DecodeDateTime(Date,AA,MM,DD,HH,MMin,SS,MMSeg);
        if (M-MM) > 5 then
         begin
           SalirMal := True;
           Close;
         end;
      finally
        IdTime1.Disconnect;
      end;
end;

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
        FechaHora := Date;
end;

procedure TfrmMain.Mdicos1Click(Sender: TObject);
var
        frm :TfrmGestionarMedico;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          frm := TfrmGestionarMedico.Create(Self);
          frm.ShowModal;
        end;
end;

procedure TfrmMain.Ayudas1Click(Sender: TObject);
var     frm :TFrmGestionarAyuda;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          frm := TFrmGestionarAyuda.Create(Self);
          frm.ShowModal;
        end;
end;

end.
