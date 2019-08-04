program SIPLA;

{$MODE Delphi}

uses
  Forms, Interfaces,
  unitMain in 'Units\unitMain.pas' {frmMain},
  Consts in '..\..\units\Consts.pas',
  Unit_BuscarClave in '..\..\units\Unit_BuscarClave.pas' {frmBuscarClave},
  Unit_BuscarCodigo in '..\..\units\Unit_BuscarCodigo.pas' {frmBuscarCodigo},
  Unit_DmComprobante in '..\..\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitdmColocacion in '..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitReLogin in '..\..\units\UnitReLogin.pas' {frmReLogin},
  unitLogin in '..\..\units\unitLogin.pas' {frmLogin},
  UnitConsultaExtractoCaptacion in '..\..\units\UnitConsultaExtractoCaptacion.pas' {frmConsultaExtractoCaptacion},
  UnitConsultaProductos in '..\..\units\UnitConsultaProductos.pas' {frmConsultaProductos},
  UnitBuscarPersona in '..\..\units\UnitBuscarPersona.pas' {frmBuscarPersona},
  UnitObservacionesCambioEstado in '..\..\units\UnitObservacionesCambioEstado.pas' {frmObservacionesCambioEstado},
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  UnitCambiarContrasena in '..\..\units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  UnitOperacionesEfectivo in '..\..\units\UnitOperacionesEfectivo.pas' {frmOperacionesEfectivo},
  UnitActualizacionSDN in '..\..\units\UnitActualizacionSDN.pas' {frmActualizacionSDN},
  UnitPantallaProgreso in '..\..\units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitOperacionesAcumulada in '..\..\units\UnitOperacionesAcumulada.pas' {frmOperacionesAcumuladas},
  UnitCompararPersonas in 'Units\UnitCompararPersonas.pas' {frmCompararPersonas},
  UnitRegistrarObservacion in '..\..\units\UnitRegistrarObservacion.pas' {frmRegistrarObservacion},
  UnitControldeObservaciones in '..\..\units\UnitControldeObservaciones.pas' {frmControldeObservaciones},
  UnitExtractoColocacion in '..\..\units\UnitExtractoColocacion.pas' {FrmExtractoColocacion},
  UnitVistaPreliminar in '..\..\units\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitBuscarTexto in '..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  UnitRelacionChequesEnCanje in '..\..\Units\UnitRelacionChequesEnCanje.pas' {frmRelacionChequesEnCanje},
  UnitExtractoCredito in '..\..\Units\UnitExtractoCredito.pas' {frmExtractoCredito},
  UnitGuardaImagen in '..\..\Units\UnitGuardaImagen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
