unit UnitGlobal;

interface

uses Forms,StdCtrls,DBCtrls,Messages;

procedure EnterTabs(var Key:Char;oSelf:TForm);

implementation

procedure EnterTabs(var Key:Char;oSelf:TForm);
begin
  if (Key=#13) and
      not (oSelf.ActiveControl is TButton)    and
      not (oSelf.ActiveControl is TDBMemo)
                                 then begin
      oSelf.Perform( WM_NEXTDLGCTL, 0,0);
      Key := #0;
      end;
end;

end.
 