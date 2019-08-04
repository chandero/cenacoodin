program SisElecciones;

uses
  Forms,
  UnitElecciones in 'UnitElecciones.pas' {frmMain},
  UnitRegistrarAsociado in 'UnitRegistrarAsociado.pas' {frmRegistrarAsociado},
  UnitdmGeneral in 'UnitdmGeneral.pas' {DM: TDataModule},
  UnitGlobales in 'UnitGlobales.pas',
  UnitReporteVotantes in 'UnitReporteVotantes.pas' {frmReporte},
  unitLogin in '..\..\units\unitLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
