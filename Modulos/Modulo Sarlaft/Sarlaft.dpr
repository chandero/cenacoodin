program Sarlaft;

uses
  Forms,
  UnitMain in 'Unit\UnitMain.pas' {frmMain},
  UnitPlanoAsociados in 'Unit\UnitPlanoAsociados.pas' {frmPlanoAsociados},
  UnitdmGeneral in '\\VBoxSvr\cena\cenacoodin\Units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  DataSetToExcel in '\\VBoxSvr\cena\cenacoodin\Units\DataSetToExcel.pas',
  UnitPlanoMovimientos in 'Unit\UnitPlanoMovimientos.pas' {frmPlanoMovimientos},
  UnitGlobal in 'Unit\UnitGlobal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
