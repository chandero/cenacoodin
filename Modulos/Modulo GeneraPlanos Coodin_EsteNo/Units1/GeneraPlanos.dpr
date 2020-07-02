program GeneraPlanos;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {frmMain},
  Consts in '..\..\Modulo Fogacoop\unit\Consts.pas',
  UnitPantallaProgreso in '..\..\Modulo Fogacoop\unit\UnitPantallaProgreso.pas' {frmProgreso},
  UnitVistaPreliminar in '..\..\Modulo Fogacoop\unit\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitdmGeneral in '..\..\Modulo Fogacoop\unit\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitGlobales in '..\..\..\Globales\UnitGlobales.pas',
  Unit_DmComprobante in '..\..\..\Globales\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitGlobalesCol in '..\..\..\Globales\UnitGlobalesCol.pas',
  UnitdmColocacion in '..\..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitBuscarTexto in '..\..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  UnitImpresion in '..\..\..\units\UnitImpresion.pas' {FrmImpresion},
  UnitReportePersonasFogacoop in '..\Units\UnitReportePersonasFogacoop.pas' {frmReportePersonasFogacoop},
  UnitCancelacionCdats in '..\Units\UnitCancelacionCdats.pas' {frmCancelacionCdats},
  UnitReporteAportesFogacoop in '..\Units\UnitReporteAportesFogacoop.pas' {frmReporteAportesFogacoop},
  UnitReporteCaptacionesFogacoop in '..\Units\UnitReporteCaptacionesFogacoop.pas' {frmReporteCaptacionesFogacoop},
  UnitReporteCdatFogacoop in '..\Units\UnitReporteCdatFogacoop.pas' {frmReporteCdatFogacoop},
  UnitReporteColocacionesFogacoop in '..\Units\UnitReporteColocacionesFogacoop.pas' {frmReporteColocacionesFogacoop},
  UnitCarteraFogacoop in '..\Units\UnitCarteraFogacoop.pas' {frmCarteraFogacoop};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
