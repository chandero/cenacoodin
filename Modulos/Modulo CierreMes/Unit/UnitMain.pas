unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UnitDmGeneral;

type
  TFrmCierreMes = class(TForm)
    MainMenu1: TMainMenu;
    Manuales1: TMenuItem;
    LiquidacindeIntersdeCaptacin1: TMenuItem;
    mnuAuto: TMenuItem;
    procedure LiquidacindeIntersdeCaptacin1Click(Sender: TObject);
    procedure mnuAutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCierreMes: TFrmCierreMes;

implementation

{$R *.dfm}

uses IniFiles, UnitLiquidacionInteresesCaptacion, UnitLiquidacionYCausacionAuto, UnitGlobales;

procedure TFrmCierreMes.LiquidacindeIntersdeCaptacin1Click(
  Sender: TObject);
  var frmLiquidacionInteresesCaptacion: TfrmLiquidacionInteresesCaptacion;
begin
     frmLiquidacionInteresesCaptacion := TfrmLiquidacionInteresesCaptacion.Create(self);
     frmLiquidacionInteresesCaptacion.ShowModal;
end;

procedure TFrmCierreMes.mnuAutoClick(Sender: TObject);
var
  frmLiquidacionYCausacionAuto : TfrmLiquidacionYCausacionAuto;
begin
   frmLiquidacionYCausacionAuto := TfrmLiquidacionYCausacionAuto.Create(self);
   frmLiquidacionYCausacionAuto.ShowModal;
end;

procedure TFrmCierreMes.FormShow(Sender: TObject);
var
  MiINI: String;
begin

  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','100.21.210.24');
    DBPath := ReadString('DBNAME','path','/base/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    _sServerImagen := ReadString('DBNAME','serverimagen','');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCA�A N.S.');
  finally
    free;
  end;

                dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
                dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
                dmGeneral.IBDatabase1.Params.Values['User_Name'] := 'SYSDBA';
                dmGeneral.IBDatabase1.Params.Values['PassWord'] := 'masterkey';
                dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := 'CAPTACIONES';
                dmGeneral.IBDatabase1.Open;
end;

end.
