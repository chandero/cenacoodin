program UDPServerTD;

uses
  QForms,
  UDPServerMain in 'UDPServerMain.pas' {UDPMainForm},
  UnitDesCiphers in 'UnitDesCiphers.pas',
  HexConvert in 'HexConvert.pas',
  UnitDES in 'UnitDES.pas',
  UDPTDMain in 'UDPTDMain.pas' {frmUDPTDMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'UDPServerTDV3.2';
//  Application.CreateForm(TUDPMainForm, UDPMainForm);
  Application.CreateForm(TfrmUDPTDMain, frmUDPTDMain);
  Application.Run;
end.
