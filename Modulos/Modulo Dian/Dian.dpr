program Dian;

uses
  Forms,
  unitMain in 'units\unitMain.pas' {frmMain},
  Unit_DmComprobante in '..\..\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitdmColocacion in '..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  unitLogin in '..\..\units\unitLogin.pas' {frmLogin},
  UnitCambiarContrasena in '..\..\units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  UnitInteresRetencionPagado in 'units\UnitInteresRetencionPagado.pas' {frmMnu020101},
  XLSfile in '..\..\units\XLSfile.pas',
  UnitInteresesRecibidos in 'units\UnitInteresesRecibidos.pas' {frmInteresesRecibidos},
  UnitAportesPeriodo in 'UnitAportesPeriodo.pas' {frmAportesPeriodo},
  UnitDeudasPeriodo in 'units\UnitDeudasPeriodo.pas' {frmDeudasPeriodo},
  UnitMovimientoCredito_F1019v9 in 'units\UnitMovimientoCredito_F1019v9.pas' {frmMovimientoCredito_F1019v9},
  UnitMovimientoCredito in 'units\UnitMovimientoCredito.pas' {frmMovimientoCredito},
  UnitPrestamosCorte in 'units\UnitPrestamosCorte.pas' {frmPrestamosCorte},
  UnitCdatPeriodo in 'units\UnitCdatPeriodo.pas' {frmCdatPeriodo},
  Consts in '..\..\units\Consts.pas',
  UnitRetencionesPracticadasVal in 'units\UnitRetencionesPracticadasVal.pas' {frmRetencionesPracticadasVal},
  UnitInteresesPagados in 'units\UnitInteresesPagados.pas' {frmInteresesPagados},
  UnitPrestamos in 'units\UnitPrestamos.pas' {frmPrestamos},
  UnitCodigos in 'units\UnitCodigos.pas' {FrmCodigo},
  DataSetToExcel in '..\..\units\DataSetToExcel.pas',
  UnitAgencia in 'units\UnitAgencia.pas' {FrmAgencia},
  UnitIntPagadoF in 'units\UnitIntPagadoF.pas' {FrmConInteresPago},
  UnitPantallaProgreso in '..\..\units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitInteresRete in 'units\UnitInteresRete.pas' {FrmInteresRete},
  UnitRetencionesPracticadasNueva in 'units\UnitRetencionesPracticadasNueva.pas' {frmRetencionesPracticadasNueva},
  UnitRetencion in '..\..\Units\UnitRetencion.pas' {FrmRetenciones},
  UnitProgreso in '..\..\Units\UnitProgreso.pas' {frmProgresoServer},
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  UnitDepositosPeriodo in 'units\UnitDepositosPeriodo.pas' {frmDepositosPeriodo},
  UnitRetencionesPracticadas in 'units\UnitRetencionesPracticadas.pas' {frmRetencionesPracticadas},
  UnitValidaEmitidos in 'units\UnitValidaEmitidos.pas' {FrmValidaEmitidos},
  UnitMovimientoTerceros in 'units\UnitMovimientoTerceros.pas' {frmMovimientoTercero};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
