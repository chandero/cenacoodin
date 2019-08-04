program UnificarBalance;

uses
  Forms,
  UnitUnificarBalance in 'UnitUnificarBalance.pas' {frmUnificarBalance};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmUnificarBalance, frmUnificarBalance);
  Application.Run;
end.
