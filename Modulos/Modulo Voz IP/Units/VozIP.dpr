program VozIP;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Mensajeria Crediservir';
  Application.CreateForm(TfrmMain, frmMain);
  Application.ShowMainForm := False;
  Application.Run;
end.
