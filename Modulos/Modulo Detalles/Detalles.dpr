program Detalles;

uses
  Forms,
  UnitEntregaDetalles in '..\..\units\UnitEntregaDetalles.pas' {frmEntregaDetalles},
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  unitMain in 'Units\unitMain.pas' {frmMain},
  Unit_DmComprobante in '..\..\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmColocacion in '..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  unitLogin in '..\..\units\unitLogin.pas' {frmLogin},
  UnitReLogin in '..\..\units\UnitReLogin.pas' {frmReLogin},
  UnitCambiarContrasena in '..\..\units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  UnitInformeDetalles in '..\..\units\UnitInformeDetalles.pas' {frmInformeDetalles},
  UnitVistaPreliminar in '..\..\units\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitBuscarTexto in '..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  Consts in '..\..\units\Consts.pas',
  UnitConsultaProductos in '..\..\units\UnitConsultaProductos.pas' {frmConsultaProductos},
  UnitBuscarPersona in '..\..\units\UnitBuscarPersona.pas' {frmBuscarPersona},
  UnitConsultaExtractoCaptacion in '..\..\units\UnitConsultaExtractoCaptacion.pas' {frmConsultaExtractoCaptacion},
  UnitRelacionChequesEnCanje in '..\..\units\UnitRelacionChequesEnCanje.pas' {frmRelacionChequesEnCanje},
  UnitExtractoColocacion in '..\..\units\UnitExtractoColocacion.pas' {FrmExtractoColocacion},
  UnitObservacionesCambioEstado in '..\..\units\UnitObservacionesCambioEstado.pas' {frmObservacionesCambioEstado},
  UnitControldeObservaciones in '..\..\units\UnitControldeObservaciones.pas' {frmControldeObservaciones},
  UnitRegistrarObservacion in '..\..\units\UnitRegistrarObservacion.pas' {frmRegistrarObservacion},
  UnitExtractoCredito in '..\..\units\UnitExtractoCredito.pas' {frmExtractoCredito},
  UnitExportar in '..\..\units\UnitExportar.pas' {FrmExportar},
  UnitGlobalesCol in '..\Modulo Cartera\Cambios globales liq por clasificacion\GLOBAL\UnitGlobalesCol.pas',
  UnitReportePrograma in 'Units\UnitReportePrograma.pas' {frmReportePrograma},
  UnitDatroGeneral in 'Units\UnitDatroGeneral.pas' {FrmDatoGeneral},
  UnitGuardaImagen in '..\..\Units\UnitGuardaImagen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
