program CicloCierreMes;

uses
  Forms,
  UnitMain in 'Unit\UnitMain.pas' {FrmCierreMes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCierreMes, FrmCierreMes);
  Application.Run;
end.
