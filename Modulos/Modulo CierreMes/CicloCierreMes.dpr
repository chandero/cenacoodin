program CicloCierreMes;

uses
  Forms,
  UnitMain in 'Unit\UnitMain.pas' {FrmCierreMes},
  UnitLiquidacionInteresesCaptacion in '\\VBOXSVR\cena\cenacoodin\Units\UnitLiquidacionInteresesCaptacion.pas' {frmLiquidacionInteresesCaptacion},
  UnitdmGeneral in '\\VBOXSVR\cena\cenacoodin\Units\UnitdmGeneral.pas' {dmGeneral: TDataModule},
  UnitPantallaProgreso in '\\VBOXSVR\cena\cenacoodin\Units\UnitPantallaProgreso.pas' {frmProgreso},
  UnitCaptaciones in '\\VBOXSVR\cena\cenacoodin\Units\UnitCaptaciones.pas',
  UnitdmLiquidacionCaptacion in '\\VBOXSVR\cena\cenacoodin\Units\UnitdmLiquidacionCaptacion.pas' {dmLiquidacionCaptacion: TDataModule},
  Unit_DmComprobante in '\\VBOXSVR\cena\cenacoodin\Units\Unit_DmComprobante.pas' {DmComprobante: TDataModule},
  UnitdmColocacion in '\\VBOXSVR\cena\cenacoodin\Units\UnitdmColocacion.pas' {dmColocacion: TDataModule},
  UnitGlobales in '\\VBOXSVR\cena\cenacoodin\Globales\UnitGlobales.pas',
  UnitGlobalesCol in '\\VBOXSVR\cena\cenacoodin\Globales\UnitGlobalesCol.pas',
  UnitLiquidacionYCausacionAuto in '\\VBOXSVR\cena\cenacoodin\Modulos\Modulo CierreMes\Unit\UnitLiquidacionYCausacionAuto.pas' {frmLiquidacionYCausacionAuto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TFrmCierreMes, FrmCierreMes);
  Application.CreateForm(TfrmLiquidacionYCausacionAuto, frmLiquidacionYCausacionAuto);
  Application.Run;
end.
