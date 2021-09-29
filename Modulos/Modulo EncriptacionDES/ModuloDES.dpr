program ModuloDES;

uses
  Forms,
  UnitEncrypDecryp in 'UnitEncrypDecryp.pas' {frmEncrypDecryp},
  UnitDesCiphers in 'UnitDesCiphers.pas',
  HexConvert in 'HexConvert.pas',
  UnitDES in 'UnitDES.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEncrypDecryp, frmEncrypDecryp);
  Application.Run;
end.
