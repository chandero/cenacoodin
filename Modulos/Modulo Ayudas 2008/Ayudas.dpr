program Ayudas;

uses
  Forms,
  unitLogin in '..\..\units\unitLogin.pas' {frmLogin},
  unitMain in 'units\unitMain.pas' {frmMain},
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  Unit_DmComprobante in '..\..\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmColocacion in '..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitCambiarContrasena in '..\..\units\UnitCambiarContrasena.pas' {frmCambiarContrasena},
  Consts in '..\..\units\Consts.pas',
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  UnitReporte in 'units\UnitReporte.pas' {frmReporte},
  UnitCierreDia in 'units\UnitCierreDia.pas' {frmCierreDia},
  UnitEntregaAyudasSolidaridad in '..\Modulo Ayudas 2\units\UnitEntregaAyudasSolidaridad.pas' {frmEntregaAyudasSolidaridad},
  UnitGlobalesCol in '..\Modulo Cartera\Cambios globales liq por clasificacion\GLOBAL\UnitGlobalesCol.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ayudas de Solidaridad';
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TdmColocacion, dmColocacion);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmEntregaAyudasSolidaridad, frmEntregaAyudasSolidaridad);
  Application.Run;
end.
