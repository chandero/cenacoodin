program Revisoria;

uses
  Forms,
  unitMain in 'units\unitMain.pas' {frmMain},
  UnitInformeAuxiliar in '..\..\units\UnitInformeAuxiliar.pas' {frmInformeAuxiliares},
  UnitLibroCajaDiario in '..\..\units\UnitLibroCajaDiario.pas' {frmLibroRCajaDiario},
  UnitLibroRMayorYBalance in '..\..\units\UnitLibroRMayorYBalance.pas' {frmLibroMayorYBalance},
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  Unit_DmComprobante in '..\..\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitdmColocacion in '..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  unitLogin in '..\..\units\unitLogin.pas' {frmLogin},
  UnitReLogin in '..\..\units\UnitReLogin.pas' {frmReLogin},
  UnitCambiarContrasena in '..\..\units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  UnitVistaPreliminar in '..\..\units\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitBuscarTexto in '..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  UnitPantallaProgreso in '..\..\units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitConsultaProductos in '..\..\units\UnitConsultaProductos.pas' {frmConsultaProductos},
  UnitBuscarPersona in '..\..\units\UnitBuscarPersona.pas' {frmBuscarPersona},
  UnitConsultaExtractoCaptacion in '..\..\units\UnitConsultaExtractoCaptacion.pas' {frmConsultaExtractoCaptacion},
  UnitExtractoColocacion in '..\..\units\UnitExtractoColocacion.pas' {FrmExtractoColocacion},
  UnitObservacionesCambioEstado in '..\..\units\UnitObservacionesCambioEstado.pas' {frmObservacionesCambioEstado},
  UnitControldeObservaciones in '..\..\units\UnitControldeObservaciones.pas' {frmControldeObservaciones},
  UnitRegistrarObservacion in '..\..\units\UnitRegistrarObservacion.pas' {frmRegistrarObservacion},
  UnitResumenColocaciones in '..\..\units\UnitResumenColocaciones.pas' {frmResumenColocaciones},
  UnitRCarteraAbogados in '..\..\units\UnitRCarteraAbogados.pas' {frmRCarteraAbogados},
  UnitInformeColocacionesporestado in '..\..\units\UnitInformeColocacionesporestado.pas' {frminformecolocacionesporestado},
  UnitInformeColocacionFiltrado in '..\..\units\UnitInformeColocacionFiltrado.pas' {frmInformeColocacionesFiltrado},
  UnitInformeGralColocaciones in '..\..\units\UnitInformeGralColocaciones.pas' {frmInformeGralColocaciones},
  UnitRangosColocacion in '..\..\units\UnitRangosColocacion.pas' {FrmRangosColocacion},
  UnitDmSolicitud in '..\..\units\UnitDmSolicitud.pas' {DmSolicitud: TDataModule},
  UnitConsultaColocacion in '..\..\units\UnitConsultaColocacion.pas' {frmConsultaColocacion},
  UnitBuscarColocacion in '..\..\units\UnitBuscarColocacion.pas' {frmBusquedadeColocacion},
  UnitTablaLiquidacion in '..\..\units\UnitTablaLiquidacion.pas' {frmTablaLiquidacion},
  UnitConsultaGarantias in '..\..\units\UnitConsultaGarantias.pas' {frmConsultaGarantias},
  UnitDireccionesAsociados in '..\..\units\UnitDireccionesAsociados.pas' {frmDireccionesAsociado},
  UnitImpresion in '..\..\units\UnitImpresion.pas' {FrmImpresion},
  UnitBuscarEscritura in '..\..\units\UnitBuscarEscritura.pas' {frmBusquedadeEscritura},
  Consts in '..\..\units\Consts.pas',
  UnitInformeGeneraldeCaptaciones in '..\..\units\UnitInformeGeneraldeCaptaciones.pas' {frmInformeGeneraldeCaptaciones},
  UnitListadoGeneralCaptaciones in '..\..\units\UnitListadoGeneralCaptaciones.pas' {frmListadoGeneralCaptaciones},
  UnitInformeTasaPromedio in '..\..\units\UnitInformeTasaPromedio.pas' {frmInformeTasaPromedio},
  UnitInformePorRangosCaptacion in '..\..\units\UnitInformePorRangosCaptacion.pas' {frmInformeCaptacionesporRango},
  UnitInformeCuentasporEstado in '..\..\units\UnitInformeCuentasporEstado.pas' {frmInformeCuentasporEstado},
  UnitListadoCaptacionesConsolidado in '..\..\units\UnitListadoCaptacionesConsolidado.pas' {frmListadoCaptacionesConsolidado},
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  UnitRelacionChequesEnCanje in '..\..\Units\UnitRelacionChequesEnCanje.pas' {frmRelacionChequesEnCanje},
  UnitExtractoCredito in '..\..\Units\UnitExtractoCredito.pas' {frmExtractoCredito},
  UnitMantenimientoGarantiaReal in '..\..\Units\UnitMantenimientoGarantiaReal.pas' {FrmMantenimientoGarantiaReal},
  UnitActualizaGarantiaReal in '..\..\Units\UnitActualizaGarantiaReal.pas' {FrmActualizaGarantiaReal},
  UnitGuardaImagen in '..\..\Units\UnitGuardaImagen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
