
program Enteaprobador;

uses
  Forms,
  unitMain in 'Units\unitMain.pas' {frmMain},
  Unit_DmComprobante in '..\..\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmColocacion in '..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  unitLogin in '..\..\units\unitLogin.pas' {frmLogin},
  UnitReLogin in '..\..\units\UnitReLogin.pas' {frmReLogin},
//  UnitEnteAgencias in '..\..\units\UnitEnteAgencias.pas' {FrmEnteAgencias},
  UnitInfGeneral in '..\Solicitud Creditos\Unit\UnitInfGeneral.pas' {FrmInfGeneral},
  UnitDmSolicitud in '..\Solicitud Creditos\Unit\UnitDmSolicitud.pas' {DmSolicitud: TDataModule},
  UnitAnalisisPago in '..\Solicitud Creditos\Unit\UnitAnalisisPago.pas' {FrmAnalisisPago},
  UnitDesreferencias in '..\Solicitud Creditos\Unit\UnitDesreferencias.pas' {FrmReferencias},
  UnitCreditosFianzas in '..\Solicitud Creditos\Unit\UnitCreditosFianzas.pas' {FrmCreditosFianzas},
  UnitDescObservacion in '..\Solicitud Creditos\Unit\UnitDescObservacion.pas' {FrmDescObsrevacion},
  UnitImpresion in '..\Modulo Solicitud\Unit\UnitImpresion.pas' {FrmImpresion},
  Consts in '..\..\units\Consts.pas',
  UnitInformeEnte in '..\Solicitud Creditos\Unit\UnitInformeEnte.pas' {FrmInformeEnte},
  FR_ChBox in '..\..\..\Archivos de programa\FastReports\FastReport\source\FR_ChBox.pas',
  UnitConsultaSolicitud in '..\..\units\UnitConsultaSolicitud.pas' {FrmConsultaSolicitud},
  UnitConsultaProductos in '..\..\units\UnitConsultaProductos.pas' {frmConsultaProductos},
  UnitBuscarPersona in '..\..\units\UnitBuscarPersona.pas' {frmBuscarPersona},
  UnitConsultaExtractoCaptacion in '..\..\units\UnitConsultaExtractoCaptacion.pas' {frmConsultaExtractoCaptacion},
  UnitObservacionesCambioEstado in '..\..\units\UnitObservacionesCambioEstado.pas' {frmObservacionesCambioEstado},
  UnitControldeObservaciones in '..\..\units\UnitControldeObservaciones.pas' {frmControldeObservaciones},
  UnitRegistrarObservacion in '..\..\units\UnitRegistrarObservacion.pas' {frmRegistrarObservacion},
  UnitEntePerticipantes in '..\..\units\UnitEntePerticipantes.pas' {FrmEnteParticipantes},
  UnitEnteAprobador in '..\..\units\UnitEnteAprobador.pas' {FrmEnteAprobador},
  UnitCambiarContrasena in '..\..\units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  UnitProgreso in '..\..\units\UnitProgreso.pas' {frmProgresoServer},
  UnitPantallaProgreso in '..\..\units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitExtractoColocacion in '..\..\units\UnitExtractoColocacion.pas' {FrmExtractoColocacion},
  UnitVistaPreliminar in '..\..\units\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitBuscarTexto in '..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  UnitRatificacion in '..\..\units\UnitRatificacion.pas' {FrmRatificacion},
  UnitConsultaSol in '..\..\units\UnitConsultaSol.pas' {FrmConsultaSol},
  UnitLiquidacionGral in '..\..\units\UnitLiquidacionGral.pas' {frmLiquidacionGral},
  UnitAnulaSolicitud in '..\..\units\UnitAnulaSolicitud.pas' {FrmAnulaSolicitud},
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  FR_Shape in '..\..\..\Archivos de programa\FastRepor ts\FastReport\source\FR_Shape.pas',
  UnitReporteEnte in '..\..\units\UnitReporteEnte.pas' {FrmReporteEnte},
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitActa in '..\..\units\UnitActa.pas' {FrmActa},
  UnitDatosActa in '..\..\units\UnitDatosActa.pas' {FrmDatosActa},
  UnitAdicionCreditos in '..\..\units\UnitAdicionCreditos.pas' {FrmAdicionCreditos},
  UnitPromedioCaptacion in '..\..\units\UnitPromedioCaptacion.pas' {frmPromedio},
  UnitRelacionChequesEnCanje in '..\..\units\UnitRelacionChequesEnCanje.pas' {frmRelacionChequesEnCanje},
  UnitExtractoCredito in '..\..\units\UnitExtractoCredito.pas' {frmExtractoCredito},
  UnitHabilitaFianza in '..\..\units\UnitHabilitaFianza.pas' {FrmHabilitaFianza},
  UnitFechaConcepto in '..\..\units\UnitFechaConcepto.pas' {FrmFechaConcepto},
  UnitCambioFecha in '..\..\units\UnitCambioFecha.pas' {FrmCambiarFecha},
  UnitDmLog in '..\..\units\UnitDmLog.pas' {DmLog: TDataModule},
  UnitCambios in '..\..\units\UnitCambios.pas' {FrmCambios},
  UnitAgregarObservacionSol in '..\..\units\UnitAgregarObservacionSol.pas' {frmAgregarObservacionSol},
  UnitDireccionesAsociados in '..\..\units\UnitDireccionesAsociados.pas' {frmDireccionesAsociado},
  ZLibEx in '..\..\ZlibEx\ZLIBEX.PAS',
  UnitAprobadas in '..\..\units\UnitAprobadas.pas' {FrmAprobadas},
  UnitSeguroDepositos in '..\..\units\UnitSeguroDepositos.pas' {frmSeguroDepositos},
  UnitInformacionBancoldexEnte in '..\..\units\UnitInformacionBancoldexEnte.pas' {frmInformacionBancoldexEnte},
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  UnitRecEstudio in '..\..\Units\UnitRecEstudio.pas' {FrmRecEstudio},
  UnitGuardaImagen in '..\..\Units\UnitGuardaImagen.pas',
  UnitRecuperaEsturdio in '..\..\Units\UnitRecuperaEsturdio.pas' {FrmRecuperaEstudio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
