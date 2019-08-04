unit unitMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

uses unitLoadFile, unitCargarArticulo, unitModificarArticulo, unitConsultarArticulo;

procedure TfrmMain.MenuItem2Click(Sender: TObject);
var
   frmModificarArticulo : TfrmModificaArticulo;
begin
     frmModificarArticulo := TfrmModificaArticulo.Create(self);
     frmModificarArticulo.ShowModal;
end;

procedure TfrmMain.MenuItem3Click(Sender: TObject);
var
  frmLoadFile: TfrmLoadFile;
begin
      frmLoadFile := TfrmLoadFile.Create(self);
      frmLoadFile.ShowModal;
end;

procedure TfrmMain.MenuItem5Click(Sender: TObject);
var
  frmCargarArticulo: TfrmCargaArticulo;
begin
     frmCargarArticulo := TfrmCargaArticulo.Create(self);
     frmCargarArticulo.ShowModal;
end;

procedure TfrmMain.MenuItem6Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.MenuItem7Click(Sender: TObject);
var
  frmConsultarArticulo : TfrmConsultarArticulo;
begin
  frmConsultarArticulo := TfrmConsultarArticulo.Create(self);
  frmConsultarArticulo.ShowModal;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

end;

end.

