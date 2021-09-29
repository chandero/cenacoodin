unit UnitGlobal;

interface

uses Forms, StdCtrls, DBCtrls, Messages, Classes, StrUtils, SysUtils;

procedure Split(const Delimeter: Char; Input: string; const Strings: TStrings);
procedure EnterTabs(var Key:Char;oSelf:TForm);

var
   anhos: String;
   bases: String;
   base_path: String;
   base_server: String;
   base_user: String;
   base_pass: String;
   empresa: String;
   nit: String;
   agencia: Integer;
   ciudad: String;
   lista_anhos: TStrings;
   lista_bases: TStrings;

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

procedure Split(const Delimeter: Char; Input: string; const Strings: TStrings);
begin
  Assert(Assigned(Strings));
  Strings.Clear;
  if Delimeter <> ',' then
    Input := StringReplace(Input, Delimeter, ',', [rfReplaceAll, rfIgnoreCase]);
  Strings.CommaText := Input;
end;

end.
