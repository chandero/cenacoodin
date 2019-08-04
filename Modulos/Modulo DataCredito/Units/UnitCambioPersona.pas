unit UnitCambioPersona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBSQL;

type
  TfrmCambioPersona = class(TForm)
    Label1: TLabel;
    BtnAceptar: TButton;
    OpenDialog1: TOpenDialog;
    Ed1: TEdit;
    Label2: TLabel;
    IBSQL1: TIBSQL;
    procedure BtnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCambioPersona: TfrmCambioPersona;

implementation

{$R *.dfm}

uses UnitDmGeneral;

procedure TfrmCambioPersona.BtnAceptarClick(Sender: TObject);
var
Cedulas : TStringList;
i : Integer;
begin
        OpenDialog1.DefaultExt := '.txt';
        OpenDialog1.InitialDir := 'C:\Datacredito\';
        OpenDialog1.Title := 'Seleccione el Archivo a Importar';
        OpenDialog1.Filter := 'Archivos Texto (*.txt)|*.TXT';
        OpenDialog1.Options := [ofFileMustExist];
        if OpenDialog1.Execute then
        begin
           Ed1.Text := OpenDialog1.FileName;
           Cedulas := TStringList.Create;
           Cedulas.LoadFromFile(Ed1.Text);
        end;

        for i := 0 to Cedulas.Count - 1 do
         begin
           Label2.Caption := Cedulas.Strings[i];
           Application.ProcessMessages;
           with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('update "gen$persona" set ID_IDENTIFICACION = 3');
            SQL.Add('where ID_IDENTIFICACION = 0 and ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_PERSONA').AsString := Cedulas.Strings[i];
            try
            ExecQuery;
            except
            end;
           end;
         end;

        dmGeneral.IBTransaction1.Commit;
        Cedulas.Free;
end;

end.
