program SDKOps;

uses
  Forms,
  Register in 'Register.pas' {frmRegister},
  Verify in 'Verify.pas' {frmVerification};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmVerification, frmVerification);
  Application.Run;
end.
