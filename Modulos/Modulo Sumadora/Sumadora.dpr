program Sumadora;

uses
  Forms,
  Windows,
  cCalc2 in 'units\CCALC2.PAS' {TheCalculator};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sumadora';
  Application.CreateForm(TTheCalculator, TheCalculator);
  Application.Run;
end.
