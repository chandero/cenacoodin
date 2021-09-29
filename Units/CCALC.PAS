//----------------------------------------------------------------------------
{
 FileName : cCalc.pas
 Project  : ExEntryC Visual Component
 Contents : Calculator with on screen tape and print utility and user definable
            precision.
 Compiler : Delphi 2.0
 (c) 1998 : Marc Georges
 History  : 30/10/98 Start
}
//----------------------------------------------------------------------------
unit cCalc;
//----------------------------------------------------------------------------
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cCalc2;
//----------------------------------------------------------------------------
type
  TCalculator = class(TComponent)
  public
    IsValue: double;
    function Execute: Boolean;
  end;
//----------------------------------------------------------------------------
var
  TheCalculator: TTheCalculator;
//----------------------------------------------------------------------------
procedure Register;
implementation
//----------------------------------------------------------------------------
function TCalculator.Execute: Boolean;
begin
TheCalculator := TTheCalculator.Create(Application);
try
  Result := (TheCalculator.ShowModal = IDOK);
  IsValue := TheCalculator.UseThis;
  finally
  TheCalculator.Free;
  end; // Try
end;
//----------------------------------------------------------------------------
procedure Register;
begin
  RegisterComponents('ExEntryC', [TCalculator]);
end;
//----------------------------------------------------------------------------
end.
