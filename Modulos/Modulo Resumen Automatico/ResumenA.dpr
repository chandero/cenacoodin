program ResumenA;

uses
  Forms,
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  Unit_DmComprobante in '..\..\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitPantallaProgreso in '..\..\units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitVistaPreliminar in '..\..\units\UnitVistaPreliminar.pas' {frmVistaPreliminar},
  UnitBuscarTexto in '..\..\units\UnitBuscarTexto.pas' {frmBuscarTexto},
  UnitdmColocacion in '..\..\Units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitResumenAutomatico in '..\..\Units\UnitResumenAutomatico.pas' {FrmResumenAutomatico};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TdmColocacion, dmColocacion);
  Application.CreateForm(TFrmResumenAutomatico, FrmResumenAutomatico);
  Application.Run;
end.
