program TarAutomatico;

uses
  Forms,
  Unitdescarga in 'Unitdescarga.pas' {FrmDescaraAutomatica},
  UnitGlobalTd in '..\Modulo Tarjeta Debito\Units\UnitGlobalTd.pas',
  UnitConexion in 'UnitConexion.pas',
  UnitClaseXml in 'UnitClaseXml.pas',
  UnitPantallaProgreso in '..\..\Units\UnitPantallaProgreso.pas' {frmProgreso};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmDescaraAutomatica, FrmDescaraAutomatica);
  Application.CreateForm(TfrmProgreso, frmProgreso);
  Application.Run;
end.
