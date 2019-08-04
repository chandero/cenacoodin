program Project4;

uses
  Forms,
  Unit3 in 'Unit3.pas' {Form3},
  UnitEntregaCarne in 'EntregaSeguro\Units\UnitEntregaCarne.pas' {FrmEntregaCarne};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TFrmEntregaCarne, FrmEntregaCarne);
  Application.Run;
end.
