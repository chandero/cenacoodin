unit UnitDES;

interface

uses Types, SysUtils,StrUtils,UnitDesCiphers,HexConvert;

type
    TDoubleDWORD = packed record
    L, R: DWORD;
  end;

function DESCipher(HexData:string;HexKey:string;cifrar:Boolean):string;
procedure CreateBlockCipher(Key:Int64);
function DataToHex(const X; const NumBytes: Integer): string;

var
    FBlockCipher: TBlockCipher;
    FCipherText: string;

implementation

function DESCipher(HexData:string;HexKey:string;cifrar:Boolean):string;
var
   i,bloques:Integer;
   Key:Int64;
   RPart,LPart:Longword;
   bloque:string;
   block:Int64;
begin

    if Length(HexKey) <> 16 then
        raise Exception.Create('La longitud de la llave es invalida');

    if (Length(HexData) mod 16) <> 0 then
       raise Exception.Create('La longitud de los datos es invalida');

    RPart := HexTo(LeftStr(HexKey,8));
    LPart := HexTo(RightStr(HexKey,8));

    with TDoubleDWORD(Key) do
    begin
        L := LPart;
        R := RPart;
    end;


    Result := '';

    CreateBlockCipher(Key);
    bloques := Length(HexData) div 16;
    for i := 0 to bloques - 1 do
    begin
        bloque := MidStr(HexData,i*16+1,16);
        RPart := HexTo(LeftStr(bloque,8));
        LPart := HexTo(RightStr(bloque,8));
        with TDoubleDWORD(block) do
        begin
            L := LPart;
            R := RPart;
        end;
        if cifrar then
          FBlockCipher.EncryptBlock(block)
        else
          FBlockCipher.DecryptBlock(block);

        Result := Result + DataToHex(Block,SizeOf(block));
    end;



end;

procedure CreateBlockCipher(Key:Int64);
begin
  FBlockCipher.Free;
  FBlockCipher := TDESCipher.Create(Key,SizeOf(Key));
end;

function DataToHex(const X; const NumBytes: Integer): string;
const
  DigitToHex: array [0..$0F] of Char = '0123456789ABCDEF';
var
  I, J: Integer;
  P: ^Byte;
  PR: ^Char;
begin
  J := NumBytes * 2;
  SetLength(Result, J);
  PR := Addr(Result[J]);
  P := Addr(X);
  for I := 1 to NumBytes do begin
    PR^ := DigitToHex[P^ and $0F];
    Dec(PR);
    PR^ := DigitToHex[P^ shr 4];
    Dec(PR);
    Inc(P);
  end;
end;


end.
