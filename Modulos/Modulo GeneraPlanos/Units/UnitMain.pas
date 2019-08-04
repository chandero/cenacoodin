unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IniFiles;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Procesos1: TMenuItem;
    GeneracinPlanoCaptaciones1: TMenuItem;
    GeneracinPlanoColocaciones1: TMenuItem;
    ProyeccionCancelacinCdats1: TMenuItem;
    ProyeccinRecuperacinCartera1: TMenuItem;
    Salir1: TMenuItem;
    GeneracinPlanoCDAT1: TMenuItem;
    GeneracinPlanodePersonas1: TMenuItem;
    GeneracinPlanoAportes1: TMenuItem;
    BalanceGeneral1: TMenuItem;
    Productos1: TMenuItem;
    NiveldeIngresos1: TMenuItem;
    GeneracinFormatoAportesF211: TMenuItem;
    GeneracinPlanoPosicinNetaPrivilegiados1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure GeneracinPlanoCaptaciones1Click(Sender: TObject);
    procedure GeneracinPlanoColocaciones1Click(Sender: TObject);
    procedure ProyeccionCancelacinCdats1Click(Sender: TObject);
    procedure ProyeccinRecuperacinCartera1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GeneracinPlanoCDAT1Click(Sender: TObject);
    procedure GeneracinPlanodePersonas1Click(Sender: TObject);
    procedure GeneracinPlanoAportes1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BalanceGeneral1Click(Sender: TObject);
    procedure Productos1Click(Sender: TObject);
    procedure NiveldeIngresos1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GeneracinFormatoAportesF211Click(Sender: TObject);
  private
    { Private declarations }
  public
    ruta:string;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;


implementation

{$R *.dfm}

uses UnitGlobales,UnitReporteCaptacionesFogacoop,UnitReporteColocacionesFogacoop,UnitCancelacionCdats, UnitCarteraFogacoop,
  UnitdmGeneral, UnitReporteCdatFogacoop, UnitReportePersonasFogacoop,UnitReporteAportesFogacoop,
  UnitReporteBalance, UnitResumenProductos, UnitNivelIngresos, UnitAportesSociales_F21;

procedure TfrmMain.Salir1Click(Sender: TObject);
begin
        Application.Terminate;
end;

procedure TfrmMain.GeneracinPlanoCaptaciones1Click(Sender: TObject);
var frmReporteCaptacionesFogacoop:TfrmReporteCaptacionesFogacoop;
begin
        frmReporteCaptacionesFogacoop := TfrmReporteCaptacionesFogacoop.Create(Self);
        frmReporteCaptacionesFogacoop.ShowModal;
end;

procedure TfrmMain.GeneracinPlanoColocaciones1Click(Sender: TObject);
var frmReporteColocacionesFogacoop:TfrmReporteColocacionesFogacoop;
begin
        frmReporteColocacionesFogacoop := TfrmReporteColocacionesFogacoop.Create(Self);
        frmReporteColocacionesFogacoop.ShowModal;
end;

procedure TfrmMain.ProyeccionCancelacinCdats1Click(Sender: TObject);
var frmCancelacionCdats:TfrmCancelacionCdats;
begin
        frmCancelacionCdats := TfrmCancelacionCdats.Create(Self);
        frmCancelacionCdats.ShowModal;
end;

procedure TfrmMain.ProyeccinRecuperacinCartera1Click(Sender: TObject);
var frmCarteraFogacoop:TfrmCarteraFogacoop;
begin
        frmCarteraFogacoop := TfrmCarteraFogacoop.Create(Self);
        frmCarteraFogacoop.ShowModal;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var MiINI,Mensaje:string;
begin
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  ruta := ExtractFilePath(Application.ExeName);
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.1.2');
    DBPath := ReadString('DBNAME','path','/var/db/fbird/');
    DBserver1 := ReadString('DBNAME','server1','192.168.1.2');
    DBPath1 := ReadString('DBNAME','path1','/var/db/fbird/');
    DBname := ReadString('DBNAME','name','database.fdb');
    Empresa := ReadString('EMPRESA','name','CREDISERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    TipoProceso := ReadInteger('EMPRESA','local',0);    
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',5);
    RutaSalida := ReadString('ADICIONALES','rutasalida','C:\');
  finally
    free;
  end;

  dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
  dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
  dmGeneral.IBDatabase1.Params.Values['User_Name'] := 'SYSDBA';
  dmGeneral.IBDatabase1.Params.Values['PassWord'] := 'masterkey';
  try
    dmGeneral.IBDatabase1.Connected := True;
    dmGeneral.IBTransaction1.Active := True;
  except
    raise;
  end;
end;

procedure TfrmMain.GeneracinPlanoCDAT1Click(Sender: TObject);
var frmReporteCdatFogacoop:TfrmReporteCdatFogacoop;
begin
        frmReporteCdatFogacoop := TfrmReporteCdatFogacoop.Create(Self);
        frmReporteCdatFogacoop.ShowModal;
end;

procedure TfrmMain.GeneracinPlanodePersonas1Click(Sender: TObject);
var frmReportePersonasFogacoop:TfrmReportePersonasFogacoop;
begin
        frmReportePersonasFogacoop := TfrmReportePersonasFogacoop.Create(Self);
        frmReportePersonasFogacoop.ShowModal;
end;

procedure TfrmMain.GeneracinPlanoAportes1Click(Sender: TObject);
var frmReporteAportesFogacoop:TfrmReporteAportesFogacoop;
begin
        frmReporteAportesFogacoop := TfrmReporteAportesFogacoop.Create(Self);
        frmReporteAportesFogacoop.ShowModal;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
      Self.Caption := 'Generación de Planos y Reportes - ' + DBserver + ':' + DBpath + DBname;
end;

procedure TfrmMain.BalanceGeneral1Click(Sender: TObject);
begin
        frmReporteBalance := TfrmReporteBalance.Create(Self);
        frmReporteBalance.ShowModal;
end;

procedure TfrmMain.Productos1Click(Sender: TObject);
begin
        frmResumenProductos := TfrmResumenProductos.Create(Self);
        frmResumenProductos.ShowModal;
end;

procedure TfrmMain.NiveldeIngresos1Click(Sender: TObject);
begin
        frmNivelIngresos := TfrmNivelIngresos.Create(Self);
        frmNivelIngresos.ShowModal;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        dmGeneral.IBDatabase1.Close;
end;

procedure TfrmMain.GeneracinFormatoAportesF211Click(Sender: TObject);
var
   frmAportesSociales_F21: TfrmAportesSociales_F21;
begin
     frmAportesSociales_F21 := TfrmAportesSociales_F21.Create(self);
     frmAportesSociales_F21.ShowModal;
end;

end.
