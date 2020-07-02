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
  UnitCancelacionCdats in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos\Units\UnitCancelacionCdats.pas' {frmCancelacionCdats},
  UnitReporteCdatFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos\Units\UnitReporteCdatFogacoop.pas' {frmReporteCdatFogacoop},
  UnitReportePersonasFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos\Units\UnitReportePersonasFogacoop.pas' {frmReportePersonasFogacoop},
  UnitReporteAportesFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos\Units\UnitReporteAportesFogacoop.pas' {frmReporteAportesFogacoop},
  UnitReporteCaptacionesFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos\Units\UnitReporteCaptacionesFogacoop.pas' {frmReporteCaptacionesFogacoop},
  UnitImpresion in '\\Winserver\Repositorio\Sistemas\units\UnitImpresion.pas' {FrmImpresion},
  UnitReporteColocacionesFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos\Units\UnitReporteColocacionesFogacoop.pas',
  UnitReporteBalance in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos\Units\UnitReporteBalance.pas' {frmReporteBalance},
  UnitCarteraFogacoop in '\\Winserver\Repositorio\Sistemas\Modulos\Modulo GeneraPlanos Coodin\Units\UnitCarteraFogacoop.pas' {frmCarteraFogacoop};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
