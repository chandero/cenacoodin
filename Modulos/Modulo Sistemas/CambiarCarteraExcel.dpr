program CambiarCarteraExcel;

uses
  Forms,
  UnitCambioExcel in 'UnitCambioExcel.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
