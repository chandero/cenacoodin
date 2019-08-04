program Fogacoop;

uses
  Forms,
  Consts in 'unit\Consts.pas',
  UnitCarteraFogacoop in 'unit\UnitCarteraFogacoop.pas' {frmCarteraFogacoop},
  UnitdmColocacion in 'unit\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitdmGeneral in 'unit\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitGlobales in 'unit\UnitGlobales.pas',
  UnitGlobalesCol in 'unit\UnitGlobalesCol.pas',
  unitLogin in 'unit\unitLogin.pas' {frmLogin},
  unitMain in 'unit\unitMain.pas' {frmMain},
  UnitPantallaProgreso in 'unit\UnitPantallaProgreso.pas' {frmProgreso},
  UnitVistaPreliminar in 'unit\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitBuscarTexto in 'unit\UnitBuscarTexto.pas' {frmBuscarTexto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
