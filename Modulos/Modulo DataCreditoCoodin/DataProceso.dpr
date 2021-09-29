program DataProceso;

uses
  Forms,
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  UnitdmGeneral in 'Units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitdmColocacion in 'Units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  unitLogin in 'Units\unitLogin.pas' {frmLogin},
  unitMain in 'Units\unitMain.pas' {frmMain},
  UnitCambiarContrasena in 'Units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  Unit_DmComprobante in 'Units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitCambioNumeracionCifin in 'Units\UnitCambioNumeracionCifin.pas' {frmCambioNumeracionCifin},
  UnitCambioPersona in 'Units\UnitCambioPersona.pas' {frmCambioPersona},
  UnitProcesarCifin in 'Units\UnitProcesarCifin.pas' {frmProcesarCifin},
  UnitMuestroArchivoData in 'Units\UnitMuestroArchivoData.pas' {frmMuestroArchivoData},
  UnitMuestroArchivoCifin in 'Units\UnitMuestroArchivoCifin.pas' {frmMuestroArchivoCifin},
  UnitConsolidarData in 'Units\UnitConsolidarData.pas' {frmConsolidarData},
  UnitPantallaProgreso in 'Units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitProcesarDatacredito in 'Units\UnitProcesarDatacredito.pas' {frmProcesarDatacredito};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmProcesarDatacredito, frmProcesarDatacredito);
  Application.Run;
end.
