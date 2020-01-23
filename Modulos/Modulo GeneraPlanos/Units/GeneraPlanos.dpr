program GeneraPlanos;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {frmMain},
  UnitProyeccionPagoCDAT in '..\..\..\units\UnitProyeccionPagoCDAT.pas' {frmProyeccionPagoCDAT},
  UnitGlobales in '..\..\..\Globales\UnitGlobales.pas',
  UnitdmColocacion in '..\..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitBuscarTexto in '..\..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  UnitReporteBalance in 'UnitReporteBalance.pas' {frmReporteBalance},
  UnitCarteraFogacoop in 'UnitCarteraFogacoop.pas',
  UnitGlobalesCol in '..\..\..\Globales\UnitGlobalesCol.pas',
  UnitResumenProductos in 'UnitResumenProductos.pas' {frmResumenProductos},
  UnitCancelacionCdats in 'UnitCancelacionCdats.pas' {frmCancelacionCdats},
  UnitdmGeneral in '..\..\..\Units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  Unit_DmComprobante in '..\..\..\Globales\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitReporteCaptacionesFogacoop in 'UnitReporteCaptacionesFogacoop.pas' {frmReporteCaptacionesFogacoop},
  UnitImpresion in '..\..\..\Units\UnitImpresion.pas' {FrmImpresion},
  UnitReporteCdatFogacoop in 'UnitReporteCdatFogacoop.pas' {frmReporteCdatFogacoop},
  Consts in '..\..\..\Units\Consts.pas',
  UnitPantallaProgreso in '..\..\..\Units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitReporteAportesFogacoop in 'UnitReporteAportesFogacoop.pas' {frmReporteAportesFogacoop},
  UnitReporteColocacionesFogacoop in 'UnitReporteColocacionesFogacoop.pas' {frmReporteColocacionesFogacoop},
  UnitReportePersonasFogacoop in 'UnitReportePersonasFogacoop.pas' {frmReportePersonasFogacoop},
  UnitVistaPreliminar in '..\..\..\Units\UnitVistaPreliminar.pas',
  UnitAportesSociales_F21 in 'UnitAportesSociales_F21.pas' {frmAportesSociales_F21},
  DataSetToExcel in '..\..\..\Units\DataSetToExcel.pas',
  UnitReporteColocacionesFogacoopEvaluacion in '\\VBOXSVR\cena\cenacoodin\Modulos\Modulo GeneraPlanos\Units\UnitReporteColocacionesFogacoopEvaluacion.pas' {frmReporteColocacionesFogacoopEvaluacion};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmReporteColocacionesFogacoopEvaluacion, frmReporteColocacionesFogacoopEvaluacion);
  Application.Run;
end.
