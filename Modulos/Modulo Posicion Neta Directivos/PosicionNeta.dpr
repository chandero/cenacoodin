program PosicionNeta;

uses
  Forms,
  UnitPosicionNeta in 'UnitPosicionNeta.pas' {frmPosicionNeta},
  UnitdmGeneral in '\\Vboxsvr\sgft\sgftcooperativo\Units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  Unit_DmComprobante in '\\Vboxsvr\sgft\sgftcooperativo\Units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmColocacion in '\\Vboxsvr\sgft\sgftcooperativo\Units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitGlobalesCol in '\\Vboxsvr\sgft\sgftcooperativo\Globales\UnitGlobalesCol.pas',
  UnitGlobales in '\\Vboxsvr\sgft\sgftcooperativo\Globales\UnitGlobales.pas',
  DataSetToExcel in '\\Vboxsvr\sgft\sgftcooperativo\Units\DataSetToExcel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmPosicionNeta, frmPosicionNeta);
  Application.Run;
end.
