program EvaluacionCartera;

uses
  Forms,
  UnitEvaluacionCartera in '..\..\Units\UnitEvaluacionCartera.pas' {frmEvaluacionCartera};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEvaluacionCartera, frmEvaluacionCartera);
  Application.Run;
end.
