program DataProceso;

uses
  Forms,
  UnitdmGeneral in 'Units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitdmColocacion in 'Units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  unitLogin in 'Units\unitLogin.pas' {frmLogin},
  unitMain in 'Units\unitMain.pas' {frmMain},
  UnitCambiarContrasena in 'Units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  Unit_DmComprobante in 'Units\Unit_DmComprobante.pas' {DmComprobante: TDatoaModule},
  UnitProcesarDatacredito in 'Units\UnitProcesarDatacredito.pas' {frmProcesarDatacredito},
  UnitCambioNumeracionCifin in 'Units\UnitCambioNumeracionCifin.pas' {frmCambioNumeracionCifin},
  UnitCambioPersona in 'Units\UnitCambioPersona.pas' {frmCambioPersona},
  UnitProcesarCifin in 'Units\UnitProcesarCifin.pas' {frmProcesarCifin},
  UnitMuestroArchivoData in 'Units\UnitMuestroArchivoData.pas' {frmMuestroArchivoData},
  UnitMuestroArchivoCifin in 'Units\UnitMuestroArchivoCifin.pas' {frmMuestroArchivoCifin},
  UnitConsolidarData in 'Units\UnitConsolidarData.pas' {frmConsolidarData},
  UnitPantallaProgreso in 'Units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitNovedadData in 'Units\UnitNovedadData.pas' {frmNovedadData},
  UnitCambioOficina in 'Units\UnitCambioOficina.pas' {frmCambioOficina},
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  UnitProcesarCentrales in 'Units\UnitProcesarCentrales.pas' {frmProcesarCentrales};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Centrales de Riesgo';
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
