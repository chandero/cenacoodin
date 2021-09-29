program Registro;

uses
  Forms,
  UnitCambios in 'Units\UnitCambios.pas' {FrmCambios},
  Consts in '\\Winserver\repositorio\sistemas\units\Consts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCambios, FrmCambios);
  Application.Run;
end.
