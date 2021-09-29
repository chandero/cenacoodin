unit MyStrings;

interface

function FloatToEng(x:extended; decdigits,	    // engineering format
         totalspace:integer;short:boolean):string;
function B2Hex(b:byte):string;                      // byte to hex
function BStr2HexStr(s:shortString):String;         // byte string to hex ascii string
function BStr2HexStrNH(s:shortString):String;       // byte string to hex ascii string no header
function HexStr2BStr(s:shortString;var 
         ok:boolean):ShortString;                   // reverse

implementation
uses sysutils,math;

// byte to hex
function B2Hex(b:byte):string;
const Digits:array[0..$f]of char='0123456789ABCDEF';
begin
 result:=digits[b shr 4]+digits[b and $f];
end;

// byte string to hex ascii string
// BStr:=$03,$00,$55,$AA as bytes  -> HexStr:='03 00 55 AA '
function BStr2HexStr(s:shortString):String;    
var i:integer;
begin
 result:='';
 for i:=0 to length(s) do
  begin
   result:=result+B2Hex(ord(s[i]))+' ';
  end;
end;

// byte string to hex ascii string, no header
// BStr:=$03,$00,$55,$AA as bytes  -> HexStr:='00 55 AA '
function BStr2HexStrNH(s:shortString):String;    
var i:integer;
begin
 result:='';
 for i:=1 to length(s) do
  begin
   result:=result+B2Hex(ord(s[i]))+' ';
  end;
end;

// HexStr:='30 30 35 35 41 41 '  ->   BStr:=03,00,55,AA ?
function HexStr2BStr(s:shortString;var ok:boolean):ShortString;
var p:integer;
 abort:boolean;
 b,c:byte;
begin
 abort:=false;
 if s<>'' then
  begin
   result:='';
   p:=1;
   while (p<=length(s))and(not abort) do
    begin
     c:=0;
     if s[p]<'0' then abort:=true;
     if s[p]>'F' then abort:=true;
     if not abort then
      begin
       b:=ord(s[p]);
       if b<=$39 then b:=b and $0F else b:=b-$37;
       c:=16*b;
      end;
     p:=p+1;
     if s[p]<'0' then abort:=true;
     if s[p]>'F' then abort:=true;
     if not abort then
      begin
       b:=ord(s[p]);
       if b<=$39 then b:=b and $0F else b:=b-$37;
       c:=c+b;
      end;
     p:=p+1;
     if (p<=length(s))and(s[p]<>' ') then abort:=true;
     p:=p+1;
     if not abort then
      result:=result+chr(c);
    end; //while loop over text
  end;
 ok:=not abort;
end;

// 3.24e-8 ->  32.4e-9 (long) or  32.4n (short engineering form)
function FloatToEng(x:extended; decdigits,totalspace:integer;short:boolean):string;
var ex,t,a,b:extended;
 exi,exii,exd:integer;
 exs,ms:string;
 signminus:boolean;
begin
 signminus:=false;
 t:=x;
 if (abs(t)<1e-18) then begin result:='0';exit; end;
 if t<0 then begin t:=-t;signminus:=true; end;
 ex:=log10(t);
 if (ex>=3) then
  begin
   exi:=floor(ex);
   exd:=3*(exi div 3);
   if short and (exd<13) then
    begin
     case exd of
      3: exs:='k';
      6: exs:='M';
      9: exs:='G';
      12:exs:='T';
     end;
    end
   else exs:='e'+inttostr(exd);
   a:=exp(exd*ln(10));
   t:=t/a;
   ms:=Format('%'+inttostr(totalspace-length(exs))+'.'+inttostr(decdigits)+'f',[t]);
  end;
 if (ex<0) then
  begin
   exi:=floor(ex);
   if (exi mod 3)=0 then exd:=3*((exi div 3))else exd:=3*((exi div 3)-1);
   //if exd=0 then exd:=-3;
   if short and (exd>-19) then
    begin
     case exd of
      -3: exs:='m';
      -6: exs:='u';
      -9: exs:='n';
      -12:exs:='p';
      -15:exs:='f';
      -18:exs:='a';
     end;
    end
   else exs:='e'+inttostr(exd);
   a:=exp(exd*ln(10));
   t:=t/a;
   ms:=Format('%'+inttostr(totalspace-length(exs))+'.'+inttostr(decdigits)+'f',[t]);
  end;
 if (ex<3)and(ex>=0) then
  begin
   exs:='';
   ms:=Format('%'+inttostr(totalspace-length(exs))+'.'+inttostr(decdigits)+'f',[t]);
  end;
 if signminus then result:='-'+ms+exs
 else result:=ms+exs;
end;

end.

