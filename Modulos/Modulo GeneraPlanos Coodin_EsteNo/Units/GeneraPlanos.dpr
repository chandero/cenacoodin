program GeneraPlanos;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {frmMain},
  UnitProyeccionPagoCDAT in '..\..\..\units\UnitProyeccionPagoCDAT.pas' {frmProyeccionPagoCDAT},
  Consts in '..\..\Modulo Fogacoop\unit\Consts.pas',
  UnitPantallaProgreso in '..\..\Modulo Fogacoop\unit\UnitPantallaProgreso.pas' {frmProgreso},
  UnitVistaPreliminar in '..\..\Modulo Fogacoop\unit\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitdmGeneral in '..\..\Modulo Fogacoop\unit\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitGlobales in '..\..\..\Globales\UnitGlobales.pas',
  Unit_DmComprobante in '..\..\..\Globales\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitGlobalesCol in '..\..\..\Globales\UnitGlobalesCol.pas',
  UnitdmColocacion in '..\..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitBuscarTexto in '..\..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  UnitCancelacionCdats in 'UnitCancelacionCdats.pas' {frmCancelacionCdats},
  UnitReporteCdatFogacoop in 'UnitReporteCdatFogacoop.pas' {frmReporteCdatFogacoop},
  UnitReportePersonasFogacoop in 'UnitReportePersonasFogacoop.pas' {frmReportePersonasFogacoop},
  UnitReporteAportesFogacoop in 'UnitReporteAportesFogacoop.pas' {frmReporteAportesFogacoop},
  UnitReporteCaptacionesFogacoop in 'UnitReporteCaptacionesFogacoop.pas' {frmReporteCaptacionesFogacoop},
  UnitImpresion in '..\..\..\units\UnitImpresion.pas' {FrmImpresion},
  UnitReporteColocacionesFogacoop in 'UnitReporteColocacionesFogacoop.pas',
  UnitReporteBalance in 'UnitReporteBalance.pas' {frmReporteBalance},
  UnitCarteraFogacoop in 'UnitCarteraFogacoop.pas' {frmCarteraFogacoop};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
