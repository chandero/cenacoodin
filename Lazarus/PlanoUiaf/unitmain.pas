unit UnitMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ActnList;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    ActionPlanoProducto: TAction;
    ActionPermanenciaCDAT: TAction;
    _uiafActionList: TActionList;
    MenuItem2: TMenuItem;
    UiafMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    procedure ActionPermanenciaCDATExecute(Sender: TObject);
    procedure ActionPlanoProductoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;
  Server: String;
  Path: String;
  Dbname: String;

implementation

{$R *.lfm}

{ TfrmMain }

uses IniFiles, unitPlanoProducto, unitPermanenciaCdat, unitGlobal;

procedure TfrmMain.MenuItem1Click(Sender: TObject);
begin

end;

procedure TfrmMain.MenuItem3Click(Sender: TObject);
begin
end;

procedure TfrmMain.MenuItem4Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  UiafIniFile: TIniFile;
  _propFileName : String;
begin
     _propFileName := ChangeFileExt(Application.ExeName, '.ini');
     UiafIniFile := TIniFile.Create(_propFileName);
     Server := UiafIniFile.ReadString('DBNAME','server','172.16.1.1');
     Path := UiafIniFile.ReadString('DBNAME','path','/var/db/fbird/');
     Dbname := UiafIniFile.ReadString('DBNAME','name','database.fdb');
end;

procedure TfrmMain.ActionPermanenciaCDATExecute(Sender: TObject);
var
  uiafPermaneciaCdat: TfrmPermanenciaCdat;
begin
  uiafPermaneciaCdat := TfrmPermanenciaCdat.Create(nil);
  uiafPermaneciaCdat.Server:= Server;
  uiafPermaneciaCdat.Path:= Path;
  uiafPermaneciaCdat.Dbname:=Dbname;
  uiafPermaneciaCdat.Show;
end;

procedure TfrmMain.ActionPlanoProductoExecute(Sender: TObject);
var
  uiafPlanoProducto: TfrmPlanoProducto;
begin
     uiafPlanoProducto := TfrmPlanoProducto.Create(nil);
     uiafPlanoProducto.Server:= Server;
     uiafPlanoProducto.Path:= Path;
     uiafPlanoProducto.Dbname:=Dbname;
     uiafPlanoProducto.ShowModal;
end;

end.

