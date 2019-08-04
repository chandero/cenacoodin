unit unitCrearBaseDeDatos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls;

type

  { TfrmDatabase }

  TfrmDatabase = class(TForm)
    btnCrear: TButton;
    btnCerrar: TButton;
    edArchivo: TEdit;
    Label1: TLabel;
    lblStatus: TLabel;
    Panel1: TPanel;
    SQLite3Connection1: TSQLite3Connection;
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmDatabase: TfrmDatabase;

implementation

{$R *.lfm}

{ TfrmDatabase }

procedure TfrmDatabase.FormShow(Sender: TObject);
var
  _fileName : String;
  _filePath: String;
begin
  // Buscar Archivo de Base de Datos
  _fileName := 'database.db';
  _filePath := ExtractFilePath(Application.ExeName);

  edArchivo.Text:= _filePath + '\' + _fileName;

  if (FileExists(_filePath + '\' + _fileName)) then
  begin
       btnCrear.Enabled:= false;
  end;


end;

end.

