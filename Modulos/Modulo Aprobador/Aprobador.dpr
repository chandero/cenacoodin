program Aprobador;

uses
  Forms,
  UnitSistemas in 'Unit\UnitSistemas.pas' {FrmsSistemas},
  Consts in '\\Winserver\repositorio\sistemas\units\Consts.pas',
  UnitGlobales in '\\Winserver\repositorio\sistemas\Globales\UnitGlobales.pas',
  Unit_DmComprobante in '\\Winserver\repositorio\sistemas\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmGeneral in '\\Winserver\repositorio\sistemas\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitGlobalesCol in '\\Winserver\repositorio\sistemas\Globales\UnitGlobalesCol.pas',
  UnitdmColocacion in '\\Winserver\repositorio\sistemas\units\UnitdmColocacion.pas' {dmColocacion: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TFrmsSistemas, FrmsSistemas);
  Application.Run;
end.
