program UDPServerTD;

uses
  QForms,
  UDPServerMain in 'UDPServerMain.pas' {UDPMainForm},
  UnitDesCiphers in 'UnitDesCiphers.pas',
  HexConvert in 'HexConvert.pas',
  UnitDES in 'UnitDES.pas',
  UDPServerMainWin in 'UDPServerMainWin.pas' {UDPMainFormWin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TUDPMainFormWin, UDPMainFormWin);
  Application.Run;
end.
