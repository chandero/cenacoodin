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
  UnitLiquidacionYCausacionAuto in '\\VBOXSVR\cena\cenacoodin\Modulos\Modulo CierreMes\Unit\UnitLiquidacionYCausacionAuto.pas' {frmLiquidacionYCausacionAuto},
  UnitCausacionCarteraDiaria in '\\VBOXSVR\cena\cenacoodin\Units\UnitCausacionCarteraDiaria.pas' {frmCausacionCarteraDiaria},
  UnitFechaAEvaluar in '\\VBOXSVR\cena\cenacoodin\Modulos\Modulo Cartera\Unit\UnitFechaAEvaluar.pas' {frmFechas},
  UnitCausacionCarteraDiariaAuto in '\\VBOXSVR\cena\cenacoodin\Modulos\Modulo CierreMes\Unit\UnitCausacionCarteraDiariaAuto.pas' {frmCausacionCarteraDiariaAuto},
  UnitCausacionContractual in '\\VBOXSVR\cena\cenacoodin\Units\UnitCausacionContractual.pas' {FrmCausacionContractual},
  UnitCausacionCdatAuto in 'Unit\UnitCausacionCdatAuto.pas' {frmCausacionCdatAuto},
  unitCausacionCdat in '\\VBOXSVR\cena\cenacoodin\Units\otraunit\unitCausacionCdat.pas' {frmcausacioncdat},
  UnitCausacionContractualAuto in 'Unit\UnitCausacionContractualAuto.pas' {frmCausacionContractualAuto},
  UnitLiquidacionCdatAuto in 'Unit\UnitLiquidacionCdatAuto.pas' {frmLiquidacionCdatAuto},
  UnitDescuentoContractualAuto in 'Unit\UnitDescuentoContractualAuto.pas' {frmDescuentoContractualAuto},
  UnitProrrogaCaptaciones in '\\VBOXSVR\cena\cenacoodin\Units\UnitProrrogaCaptaciones.pas' {frmProrrogaCaptacion};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TdmLiquidacionCaptacion, dmLiquidacionCaptacion);
  Application.CreateForm(TFrmCierreMes, FrmCierreMes);
  Application.Run;
end.
