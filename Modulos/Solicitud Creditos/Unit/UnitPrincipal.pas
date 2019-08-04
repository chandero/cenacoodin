unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ImgList, ToolWin, jpeg, ExtCtrls,IniFiles,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTime,MAth,
  DB, IBCustomDataSet, IBQuery, IBSQL, IBFilterDialog, IBDatabaseInfo, StrUtils;

type
  TFrMain = class(TForm)
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    PrinterSetupDialog: TPrinterSetupDialog;
    Image1: TImage;
    MainMenu1: TMainMenu;
    ToolButton9: TToolButton;
    General1: TMenuItem;
    Creditos1: TMenuItem;
    ss1: TMenuItem;
    Actualizar1: TMenuItem;
    DatosCredito1: TMenuItem;
    Analisis1: TMenuItem;
    ConsultaSolicitud1: TMenuItem;
    EnteAprobador1: TMenuItem;
    InformeComite1: TMenuItem;
    ReporteSolicitudes1: TMenuItem;
    ToolButton1: TToolButton;
    ConsultaGerencia1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
    procedure ss1Click(Sender: TObject);
    procedure DatosCredito1Click(Sender: TObject);
    procedure Analisis1Click(Sender: TObject);
    procedure ConsultaSolicitud1Click(Sender: TObject);
    procedure EnteAprobador1Click(Sender: TObject);
    procedure InformeComite1Click(Sender: TObject);
    procedure ReporteSolicitudes1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ConsultaGerencia1Click(Sender: TObject);
    
  private

    { Private declarations }
  public
    salirmal: boolean;
    MiINI: string;
    DBserver,DBserver1: string;
    DBPath,DBPath1: string;
    DBname,DBname1: string;
    Empresa: string;
    Nit: string;
    Agencia: integer;
    Ciudad: string;
    Dbalias: string;
    DBPasabordo: string;
    wpath : string;

  published

    { Public declarations }
  end;
var
  FrMain: TFrMain;
implementation

uses UnitdmGeneral, UnitInformacion, UnitDmSolicitud, UnitReporte,
  UnitBuscaSolicitud, UnitAnalisiscre, UnitConsultaSol, UnitEnteAprobador,
  UnitComCreditos, UnitEstadoSolicitud, UnitConsultaProductos;

{$R *.dfm}

procedure TFrMain.FormCreate(Sender: TObject);
begin
  ShortDateFormat := 'yyyy/mm/dd';
  wpath := ExtractFilePath(ParamStr(0));
  DecimalSeparator := '.';
  ThousandSeparator := ',';
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.1.8');
    DBPath := ReadString('DBNAME','path','/base/');
    DBname := ReadString('DBNAME','name','inventario.gdb');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
  finally
    free;
  end;
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
        dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
        dmGeneral.IBDatabase1.Params.Values['User_Name'] := 'sysdba';
        dmGeneral.IBDatabase1.Params.Values['PassWord'] := 'masterkey';
        dmGeneral.IBDatabase1.Connected := True;
        dmGeneral.IBTransaction1.Active := True;
        Self.Caption := 'Solicitud de Creditos en: '+dbserver
end;

procedure TFrMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        if Not SalirMal then
        if MessageDlg('Cerrar Sistema de Nomina de COOPSERVIR LTDA.',mtInformation,[mbYes,mbNo],0) = mrYes Then
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
            Action := caFree;
           end;
          end
        else
            Action := caNone
       else
         begin
            dmGeneral.Free;
            Action := caFree;
         end;
end;
procedure TFrMain.ToolButton9Click(Sender: TObject);
begin
        Close;
end;

procedure TFrMain.Creditos1Click(Sender: TObject);
begin
        FrmInformacion := TFrmInformacion.Create(self);
        FrmInformacion.control_externo := False;
        FrmInformacion.ShowModal
end;

procedure TFrMain.ss1Click(Sender: TObject);
begin
         FrmReporte.ShowModal;
end;

procedure TFrMain.DatosCredito1Click(Sender: TObject);
begin
        FrmBuscaSolicitud := TFrmBuscaSolicitud.Create(self);
        FrmBuscaSolicitud.ShowModal;
end;

procedure TFrMain.Analisis1Click(Sender: TObject);
begin
        frmanalisiscre := TFrmAnalisiscre.Create(Self);
        FrmAnalisiscre.ShowModal;
end;

procedure TFrMain.ConsultaSolicitud1Click(Sender: TObject);
begin
        FrmConsultaSol := TFrmConsultaSol.Create(self);
        FrmConsultaSol.ShowModal;
end;

procedure TFrMain.EnteAprobador1Click(Sender: TObject);
begin
        FrmEnteAprobador := TFrmEnteAprobador.Create(self);
        FrmEnteAprobador.ShowModal;
end;

procedure TFrMain.InformeComite1Click(Sender: TObject);
begin
        FrmComCreditos := TFrmComCreditos.Create(self);
        FrmComCreditos.ShowModal;
end;

procedure TFrMain.ReporteSolicitudes1Click(Sender: TObject);
begin
        FrmEstadoSolicitud := TFrmEstadoSolicitud.Create(Self);
        FrmEstadoSolicitud.ShowModal
end;

procedure TFrMain.ToolButton1Click(Sender: TObject);
begin
//RegisterServiceProcess(GetCurrentProcessID,1);

end;

procedure TFrMain.ConsultaGerencia1Click(Sender: TObject);
begin
        frmConsultaProductos := TfrmConsultaProductos.Create(self);
        frmConsultaProductos.ShowModal;
end;

end.
