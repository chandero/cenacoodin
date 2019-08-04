program Equivida;

uses
  Forms,
  FrmEntrada in 'Unit\FrmEntrada.pas' {Entrada},
  unitLogin in 'Unit\unitLogin.pas' {frmLogin},
  UnitReLogin in '..\..\units\UnitReLogin.pas' {frmReLogin},
  unitMain in 'Unit\unitMain.pas' {frmMain},
  UnitGlobales in '..\..\Globales\UnitGlobales.pas',
  Unit_DmComprobante in '..\..\units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmGeneral in '..\..\units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitGlobalesCol in '..\..\Globales\UnitGlobalesCol.pas',
  UnitdmColocacion in '..\..\units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitReporte in 'Unit\UnitReporte.pas' {FrmReporte},
  UnitImpresion in '..\Modulo Solicitud\Unit\UnitImpresion.pas' {FrmImpresion},
  Consts in '..\..\units\Consts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TFrmImpresion, FrmImpresion);
  Application.Run;
end.
