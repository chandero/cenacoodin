program Financiero;

uses
  Forms,
  unitMain in 'Units\unitMain.pas' {frmMain},
  UnitSumatorias in '..\..\units\UnitSumatorias.pas' {frmSumatorias},
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  Unit_DmComprobante in '..\..\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitDireccionesAsociados in '..\..\units\UnitDireccionesAsociados.pas' {frmDireccionesAsociado},
  UnitdmCaptacion in '..\..\units\UnitdmCaptacion.pas' {dmCaptacion: TDataModule},
  UnitdmColocacion in '..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitdmPersona in '..\..\units\UnitdmPersona.pas' {dmPersona: TDataModule},
  UnitVistaPreliminar in '..\..\units\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  unitLogin in '..\..\units\unitLogin.pas' {frmLogin},
  UnitPantallaProgreso in '..\..\units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitConsultaProductos in '..\..\units\UnitConsultaProductos.pas' {frmConsultaProductos},
  UnitBuscarPersona in '..\..\units\UnitBuscarPersona.pas' {frmBuscarPersona},
  UnitConsultaExtractoCaptacion in '..\..\units\UnitConsultaExtractoCaptacion.pas' {frmConsultaExtractoCaptacion},
  UnitBuscarTexto in '..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  Consts in '..\..\units\Consts.pas',
  UnitBuscarColocacion in '..\..\units\UnitBuscarColocacion.pas' {frmBusquedadeColocacion},
  UnitTablaPagoColocacion in '..\..\units\UnitTablaPagoColocacion.pas' {frmTablaPagoColocacion},
  UnitConsultaGarantias in '..\..\units\UnitConsultaGarantias.pas' {frmConsultaGarantias},
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  UnitCalculoTasas in '..\..\units\UnitCalculoTasas.pas' {frmCalculoTasas},
  UnitExtractoColocacion in '..\..\units\UnitExtractoColocacion.pas' {FrmExtractoColocacion},
  UnitRecuperarLiquidacionColocacion in '..\..\units\UnitRecuperarLiquidacionColocacion.pas' {frmRecuperarLiquidacionColocacion},
  UnitConsultaColocacion in '..\..\units\UnitConsultaColocacion.pas' {frmConsultaColocacion},
  UnitTablaLiquidacion in '..\..\units\UnitTablaLiquidacion.pas' {frmTablaLiquidacion},
  UnitCambiarContrasena in '..\..\units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  UnitControlCobroCartera in '..\..\units\UnitControlCobroCartera.pas' {frmControlCobroCartera},
  UnitObservacionesCambioEstado in '..\..\units\UnitObservacionesCambioEstado.pas' {frmObservacionesCambioEstado},
  UnitAgregarObservacion in '..\..\units\UnitAgregarObservacion.pas' {frmAgregarObservacionCobro},
  UnitConsultaLiquidacion in '..\..\units\UnitConsultaLiquidacion.pas' {frmConsultaLiquidacion},
  UnitCreaciondePersona in '..\..\units\UnitCreaciondePersona.pas' {frmCreacionPersona},
  UnitBuscarControlCobro in '..\..\units\UnitBuscarControlCobro.pas' {frmBusquedaControlCobro},
  UnitReLogin in '..\..\units\UnitReLogin.pas' {frmReLogin},
  UnitControldeObservaciones in '..\..\units\UnitControldeObservaciones.pas' {frmControldeObservaciones},
  UnitRegistrarObservacion in '..\..\units\UnitRegistrarObservacion.pas' {frmRegistrarObservacion},
  UnitDmSolicitud in '..\Solicitud Creditos\Unit\UnitDmSolicitud.pas' {DmSolicitud: TDataModule},
  UnitAnalisisPago in '..\Solicitud Creditos\Unit\UnitAnalisisPago.pas' {FrmAnalisisPago},
  UnitDesreferencias in '..\Solicitud Creditos\Unit\UnitDesreferencias.pas' {FrmReferencias},
  UnitCreditosFianzas in '..\Solicitud Creditos\Unit\UnitCreditosFianzas.pas' {FrmCreditosFianzas},
  UnitDescObservacion in '..\Solicitud Creditos\Unit\UnitDescObservacion.pas' {FrmDescObsrevacion},
  UnitInfGeneral in '..\Solicitud Creditos\Unit\UnitInfGeneral.pas' {FrmInfGeneral},
  UnitImpresion in '..\Modulo Solicitud\Unit\UnitImpresion.pas' {FrmImpresion},
  Videocap in '..\..\units\Videocap.pas',
  UnitTomaHuella in '..\..\units\UnitTomaHuella.pas' {frmRegister},
  UnitTomarFoto in '..\..\units\UnitTomarFoto.pas' {frmTomarFoto},
  UnitVerificarHuella in '..\..\units\UnitVerificarHuella.pas' {frmVerify},
  VFW in '..\..\units\VfW.pas',
  UnitLiquidacionGral in '..\..\units\UnitLiquidacionGral.pas' {frmLiquidacionGral},
  UnitRelacionChequesEnCanje in '..\..\units\UnitRelacionChequesEnCanje.pas' {frmRelacionChequesEnCanje},
  UnitPromedioCaptacion in '..\..\units\UnitPromedioCaptacion.pas' {frmPromedio},
  UnitReporteReversionCartera in '..\..\units\UnitReporteReversionCartera.pas' {frmReporteReversionCartera},
  UnitInformeAsociadosHabilesInHabiles in 'UnitInformeAsociadosHabilesInHabiles.pas' {frmInformeAsociadosHabilesInHabiles},
  UnitInformeCarteraPrivilegiados in '..\..\units\UnitInformeCarteraPrivilegiados.pas' {frmInformeCarteraPrivilegiados},
  UnitEstadoSolicitud in '..\..\units\UnitEstadoSolicitud.pas' {FrmEstadoSolicitud},
  UnitConsultaSol in '..\..\units\UnitConsultaSol.pas' {FrmConsultaSol},
  UnitSolicitudAnulada in '..\..\units\UnitSolicitudAnulada.pas' {FrmSolicitudAnulada},
  UnitExtractoCredito in '..\..\units\UnitExtractoCredito.pas' {frmExtractoCredito},
  UnitInformeDesembolsosxempleado in '..\..\units\UnitInformeDesembolsosxempleado.pas' {frmInformeDesembolsosxempleado},
  UnitInformeTasasConsolidado in '..\..\units\UnitInformeTasasConsolidado.pas' {frmInformeTasasConsolidado},
  UnitLineasVsTotal in '..\..\units\UnitLineasVsTotal.pas' {frmLineasVsCartera},
  UnitSaldosCaja in '..\..\units\UnitSaldosCaja.pas' {FrmSaldosCaja},
  UnitInformeGeneraldeCaptaciones1 in 'reporte\UnitInformeGeneraldeCaptaciones1.pas' {frmInformeGeneraldeCaptaciones},
  UnitInfAsociados in '..\..\units\UnitInfAsociados.pas' {FrmInfAsociados},
  UnitCaptacionesRe in '..\..\units\UnitCaptacionesRe.pas' {FrmCaptacionesRe},
  DataSetToExcel in '..\..\units\DataSetToExcel.pas',
  UnitInformeAsociadosporMunicipio in '..\..\units\UnitInformeAsociadosporMunicipio.pas' {frmInformeAsociadosporMunicipio},
  UnitVencimientoCdat in '..\..\units\UnitVencimientoCdat.pas' {FrmVencimientoCdat},
  UnitPlanillaConsolidada in '..\..\units\UnitPlanillaConsolidada.pas' {FrmPlanillaConsolidada},
  UnitSolicitudAprobada in '..\..\units\UnitSolicitudAprobada.pas' {FrmSolicitudAprobada},
  UnitCambios in '..\..\units\UnitCambios.pas' {FrmCambios},
  UnitAgregarObservacionSol in '..\..\units\UnitAgregarObservacionSol.pas' {frmAgregarObservacionSol},
  UnitBuscarCiiu in '..\..\units\UnitBuscarCiiu.pas' {frmBuscarCIIU},
  UnitBalanceGeneral in '..\..\units\UnitBalanceGeneral.pas' {frmBalanceGeneral},
  UnitInformeAuxiliar in '..\..\units\UnitInformeAuxiliar.pas' {frmInformeAuxiliares},
  UnitInformeColocacionFiltrado in '..\..\units\UnitInformeColocacionFiltrado.pas' {frmInformeColocacionesFiltrado},
  UnitInformeDiarioCaja in '..\..\units\UnitInformeDiarioCaja.pas' {frmInformeDiarioCaja},
  UnitCreacionPersonaIndependiente in '..\..\units\UnitCreacionPersonaIndependiente.pas' {frmCreacionPersonaIndependiente},
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  UnitGeneraCartas in '..\..\Units\UnitGeneraCartas.pas' {FrmGeneraCarta},
  UnitGuardaImagen in '..\..\Units\UnitGuardaImagen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'M�dulo Financiero';
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TFrmGeneraCarta, FrmGeneraCarta);
  Application.Run;
end.                                        
