unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ImgList, ToolWin, jpeg, ExtCtrls,IniFiles,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTime,MAth,
  DB, IBCustomDataSet, IBQuery, IBSQL, IBFilterDialog, IBDatabaseInfo;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
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

uses UnitDatamodulo, UnitSolicitudCre;


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
        datageneral := tdatageneral.Create(self);
        DataGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
        DataGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
        DataGeneral.IBDatabase1.Params.Values['User_Name'] := 'sysdba';
        DataGeneral.IBDatabase1.Params.Values['PassWord'] := 'masterkey';
        DataGeneral.IBDatabase1.Connected := True;
        DataGeneral.IBTransaction1.Active := True;
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
            dataGeneral.IBDatabase1.Connected := False;
            dataGeneral.IBTransaction1.Active  := False;
            dataGeneral.Free;
            Action := caFree;
           end;
          end
        else
            Action := caNone
       else
         begin
            dataGeneral.Free;
            Action := caFree;
         end;
end;
procedure TFrMain.ToolButton9Click(Sender: TObject);
begin
        Close;
end;

procedure TFrMain.Creditos1Click(Sender: TObject);
begin
        FrmSolicitudCre := TFrmSolicitudCre.Create(self);
        FrmSolicitudCre.ShowModal;
end;

end.
