unit HexConvert;

interface

uses SysUtils, StrUtils;

// Representa una cadena Hexadecimal en un Longword
function HexTo(Value: string): Longword;

// Representa un valor en Byte como Hexadecimal (string)
function ToHex(Value: Byte): string; overload;

// Representa un Word como Hexadecimal, separando el Lo y Hi byte con el
// caracter splitter
function ToHex(Value: Word; Splitter: Char): string; overload;

// Representa un Cardinal como Hexadecimal, separando el Lo y Hi byte con el
// caracter splitter

function ToHex(Value: Cardinal; Splitter: Char): string; overload;

// Representa un Buffer

function ToHex(const Value; NumBytes:Integer): string; overload;

// Representar un Texto en Hexadecimal

function ToHex(Value:string):string;overload;


function HexToString(Hex: string): string;



implementation

const 
  HexTbl: string = '0123456789ABCDEF';

function HexTo(Value: string): Longword;
var 
  intX, PosCnt: Byte;
  zwVal: Integer;
begin
  Result := 0;
  PosCnt := 0;
  for intX := Length(Value) - 1 downto 0 do
  begin
    zwVal := Pos(UpperCase(Value[intX + 1]), HexTbl) - 1;
    if zwVal >= 0 then
    begin
      Result := Result + (zwVal shl (4 * PosCnt));
      Inc(PosCnt);
    end;
  end;
end;

function ToHex(Value: Byte): string;
var 
  zwVal: Byte;
begin
  zwVal  := (Value and $0F);
  Result := HexTbl[zwVal + 1];
  zwVal  := (Value and $F0) shr 4;
  Result := HexTbl[zwVal + 1] + Result;
end;

function ToHex(Value: Word; Splitter: Char): string;
begin
  Result := ToHex(Byte(Lo(Value)));
  Result := ToHex(Byte(Hi(Value))) + Splitter + Result;
end;

function ToHex(Value: Cardinal; Splitter: Char): string;
var 
  zwVal: Word;
begin
  zwVal  := Value and $0000FFFF;
  Result := ToHex(Word(zwVal));
  zwVal  := (Value and $FFFF0000) shr 16;
  Result := ToHex(Word(zwVal)) + Splitter + Result;
end;


function ToHex(const Value; NumBytes:Integer): string;
var
  i:Integer;
  pValor:^Byte;
  Valor:Byte;
begin

  pValor := Addr(Value);
  Result := '';
  for i := 1 to NumBytes do
  begin
    Valor := pValor^;
    Result := Result + ToHex(Valor);
    Inc(pValor);
  end;
end;


function ToHex(Value:string):string;
var
   Retorno:string;
   i:Integer;
   car:Char;
   int:Byte;
begin
        for i := 1 to Length(Value) do
        begin
            int := Ord(Value[i]);
            Result := Result + ToHex(int);
        end;
end;

function HexToString(Hex: string): string;
var
  i:Integer;
  bloques:Integer;
  hCadena:string;
begin
        if (Length(Hex) mod 2) <> 0 then
          raise Exception.Create('La cadena no contiene un valor hexagesimal valido');

        bloques := Length(Hex) div 2;

        Result := '';
        
        for i := 0 to bloques - 1 do
        begin
           hCadena := '$'+MidStr(Hex,i*2+1,2);
           Result := Result + Chr(StrToInt(hCadena));
        end;

end;

end.
