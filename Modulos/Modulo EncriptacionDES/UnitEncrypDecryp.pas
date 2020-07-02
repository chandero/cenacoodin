unit UnitEncrypDecryp;

interface

uses
  Windows, StrUtils, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvToolEdit, Buttons, Grids, HexConvert, UnitDES;

type
  TfrmEncrypDecryp = class(TForm)
    JvFileName: TJvFilenameEdit;
    Label1: TLabel;
    cmdDecode: TBitBtn;
    cmdCerrar: TBitBtn;
    Label2: TLabel;
    EditLlaveEnc: TMemo;
    Label3: TLabel;
    EditLlaveDes: TMemo;
    Memo1: TMemo;
    Memo2: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    Memo3: TMemo;
    Label4: TLabel;
    cmdEncode: TBitBtn;
    edEnBlock: TEdit;
    edHex: TEdit;
    edDeBlock: TEdit;
    BitBtn1: TBitBtn;
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdDecodeClick(Sender: TObject);
    procedure cmdEncodeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    function HexToString(Hex: string): string;      
    { Private declarations }
  public
    { Public declarations }
  end;

type TXMLHead=Record
    szHead : array[0..2] of Char; // Encabezado XML
    nSize:array[0..3] of Byte; // bytes de datos
    nCrc :array[0..3] of Byte; // Checksum
    vbKey: array[0..7] of Byte; // Llave Encriptada
end;

type TFXML = Record
    XmlHead:TXMLHead;
    XmlData:array of Byte;
end;

var
  frmEncrypDecryp: TfrmEncrypDecryp;




implementation

{$R *.dfm}

procedure TfrmEncrypDecryp.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmEncrypDecryp.cmdDecodeClick(Sender: TObject);
var
  InputFileName: string;
  Input: TMemoryStream;
  InputFileStream: TFileStream;
  Key, Llave, Block :Int64;
  Size, i :Integer;
  pLongitud:^Integer;
  Longitud:Integer;
  Encabezado:TXMLHead;
  Datos:array[0..65534] of Byte;
  DataString,KeyString,ResCadena:string;
  bloquestr:string;
  Bloques:Integer;
  LPart:Longword;
  RPart:Longword;
begin
    if JvFileName.FileName = '' then Exit;


    InputFileName := JvFileName.FileName;

    InputFileStream := TFileStream.Create(InputFileName, fmOpenRead);
    InputFileStream.Seek(0, soFromBeginning);
    Input := TMemoryStream.Create;
    Input.Seek(0, soFromBeginning);
    Input.CopyFrom(InputFileStream, InputFileStream.Size);
    InputFileStream.Free;

    Size := Input.Size;
    Longitud := Size-SizeOf(Encabezado);

//    SetLength(Datos,Longitud);

    Input.Seek(0,soFromBeginning);
    Input.Read(Encabezado,SizeOf(Encabezado));
    Input.Read(Datos,Longitud);

    pLongitud := Addr(Encabezado.nSize);
    Longitud := pLongitud^;

    KeyString := ToHex(Encabezado.vbkey,SizeOf(Encabezado.vbKey));
    DataString := ToHex(Datos,Longitud);

// Agregar proceso de descifrado de la llave

    EditLlaveEnc.Text := KeyString;

    KeyString := DESCipher(KeyString,'0123456789ABCDEF',False);

    EditLlaveDes.Text := KeyString;

// Agregar proceso de Descifrado de los datos

    Memo1.Text := DataString;

    DataString := DESCipher(DataString,KeyString,False);

    Memo2.Text := DataString;

    Bloques := Length(DataString) div 2;

    ResCadena := '';

    for i := 0 to Bloques -1 do
    begin
        ResCadena := ResCadena + HexToString(MidStr(DataString,i*2+1,2));
    end;

    Memo3.Text := ResCadena;
end;

function TfrmEncrypDecryp.HexToString(Hex: string): string;
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

procedure TfrmEncrypDecryp.cmdEncodeClick(Sender: TObject);
var
  Archivo:TextFile;
  Data:array[0..65534] of Byte;
  InputFileName: string;
  Input: TMemoryStream;
  InputFileStream: TFileStream;
  DataString,KeyString,ResCadena:string;
  Size,i:Integer;

begin
    if JvFileName.FileName = '' then Exit;

    
    InputFileName := JvFileName.FileName;

    AssignFile(Archivo,InputFileName);
    Reset(Archivo);
    read(Archivo,DataString);
    CloseFile(Archivo);

    DataString := UpperCase(DataString);

    if (Length(DataString) mod 8) <> 0 then
        for i := 1 to (8-Length(DataString) mod 8) do
         DataString := DataString + ' ';

    Memo3.Text := DataString;

    DataString := ToHex(DataString);

    Memo2.Text := DataString;

    DataString := DESCipher(DataString,EditLlaveDes.Text,True);

    Memo1.Text := DataString;

    EditLlaveEnc.Text := DESCipher(EditLlaveDes.Text,'0123456789ABCDEF',True);


end;

procedure TfrmEncrypDecryp.BitBtn1Click(Sender: TObject);
var
    DataString : string;
    KeyString: string;
begin
        DataString := edEnBlock.Text;
        KeyString := EditLlaveDes.Text;
        DataString := DESCipher(DataString,KeyString,False);
        edHex.Text := DataString;
        edDeBlock.Text := HexToString(DataString);
end;

end.
