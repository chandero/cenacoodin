unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IniFiles;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    SARL1: TMenuItem;
    PlanoAsociados1: TMenuItem;
    Movimientos1: TMenuItem;
    Salir1: TMenuItem;
    procedure PlanoAsociados1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Movimientos1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;


implementation

{$R *.dfm}

uses UnitGlobal, UnitPlanoAsociados, UnitPlanoMovimientos;

procedure TfrmMain.PlanoAsociados1Click(Sender: TObject);
var
 _frmPlanoAsociados: TfrmPlanoAsociados;
begin
 _frmPlanoAsociados := TfrmPlanoAsociados.Create(self);
 _frmPlanoAsociados.ShowModal;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  MiINI: String;
begin
MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    anhos := ReadString('DATOS','ANHOS','2018,2019,2020,2021');
    bases := ReadString('DATOS','BASES','base2018/database2018.fdb,base2019/database2019.fdb,base2020/database2020.fdb,database.fdb');
    base_path := ReadString('DATOS','BASE_PATH','/var/db/fbird/');
    base_server := ReadString('DATOS','BASE_SERVER','10.0.2.2');
    base_user := ReadString('DATOS','BASE_USER','SYSDBA');
    base_pass := ReadString('DATOS','BASE_PASSWORD','masterkey');
    empresa := ReadString('EMPRESA','NOMBRE','COODIN LTDA');
    nit     := ReadString('EMPRESA','NIT','890.505.363-6');
    agencia := ReadInteger('EMPRESA','AGENCIA',1);
    ciudad  := ReadString('EMPRESA','CIUDAD','LA PLAYA DE BELEN');

    lista_anhos := TStringList.Create;
    lista_bases := TStringList.Create;

    Split(',', anhos, lista_anhos);
    Split(',', bases, lista_bases); 
    // ExtractStrings([','], [], PChar(anhos), lista_anhos);
    // ExtractStrings([','], [], PChar(bases), lista_bases);
    // lista_anhos.Text := ReplaceStr(anhos,',',#13#10);
  except
   on E: Exception do ShowMessage(E.Message);
  end;
end;

procedure TfrmMain.Movimientos1Click(Sender: TObject);
var
  frmPlanoMovimientos : TfrmPlanoMovimientos;
begin
  frmPlanoMovimientos := TfrmPlanoMovimientos.Create(self);
  frmPlanoMovimientos.ShowModal;
end;

procedure TfrmMain.Salir1Click(Sender: TObject);
begin
   Close;
end;

end.
