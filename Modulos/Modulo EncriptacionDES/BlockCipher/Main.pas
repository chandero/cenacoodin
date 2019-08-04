unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, BlockCiphers, ExtCtrls;

type
  TfrmMain = class(TForm)
    OpenDialog: TOpenDialog;
    gbStrings: TGroupBox;
    lblPlaintext: TLabel;
    txtPlaintext: TEdit;
    cmdEncryptString: TButton;
    cmdVerifyString: TButton;
    txtCiphertext: TEdit;
    lblCiphertext: TLabel;
    lblVerification: TLabel;
    txtVerification: TEdit;
    gbFiles: TGroupBox;
    lblPlaintextFilename: TLabel;
    txtPlaintextFilename: TEdit;
    cmdBrowsePlaintext: TButton;
    cmdBrowseCiphertext: TButton;
    txtCiphertextFilename: TEdit;
    lblCiphertextFilename: TLabel;
    cmdEncryptPlaintext: TButton;
    cmdDecryptCiphertext: TButton;
    lblTransforming: TLabel;
    lblInputSizeCaption: TLabel;
    lblElapsedTimeCaption: TLabel;
    lblBytesPerSecond: TLabel;
    lblSeconds: TLabel;
    lblPerformanceCaption: TLabel;
    lblBytes: TLabel;
    lblInputSize: TLabel;
    lblElapsedTime: TLabel;
    lblPerformance: TLabel;
    chkUseMemoryStream: TCheckBox;
    rgBlockCipher: TRadioGroup;
    txtHexText: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cmdEncryptStringClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmdVerifyStringClick(Sender: TObject);
    procedure cmdEncryptDecryptClick(Sender: TObject);
    procedure cmdBrowsePlaintextClick(Sender: TObject);
    procedure cmdBrowseCiphertextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtPlaintextChange(Sender: TObject);
    procedure txtPlaintextExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FBlockCipher: TBlockCipher;
    FCipherText: string;
    procedure CreateBlockCipher;
    procedure FreeBlockCipher;
    procedure SetCipherText(const NewCipherText: string);
    property CipherText: string read FCipherText write SetCipherText;
    procedure ShowTransformingLabel(const S: string);
    procedure HideTransformingLabel;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  lblInputSize.Caption := '';
  lblElapsedTime.Caption := '';
  lblPerformance.Caption := '';
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeBlockCipher;
end;

(*$DEFINE UseTestVectors*)

procedure TfrmMain.cmdEncryptStringClick(Sender: TObject);
(*$IFDEF UseTestVectors*)
var
  Block: Int64;
(*$ENDIF*)
begin
  CreateBlockCipher;
  try
    (*$IFDEF UseTestVectors*)
      // These are test vectors from "Handbook of Applied Cryptography", p. 256.
      // They correspond to the plaintext "Now is the time for all "
      with TDoubleDWORD(Block) do begin
        //R := $4e6f7720;
        //L := $69732074;
        R := $31DCA2B1;
        L := $30E38141;
        //R := $666f7220;
        //L := $616c6c20;
      end;
      FBlockCipher.EncryptBlock(Block);
      txtVerification.Text := DataToHex(Block, SizeOf(Block));
    (*$ELSE*)
      CipherText :=
        (FBlockCipher as T64BitBlockCipher).EncryptedString(txtPlaintext.Text);
    (*$ENDIF*)
  finally
    FreeBlockCipher;
  end;
end;

procedure TfrmMain.cmdVerifyStringClick(Sender: TObject);
begin
  CreateBlockCipher;
  try
    txtVerification.Text :=
      (FBlockCipher as T64BitBlockCipher).DecryptedString(CipherText);
  finally
    FreeBlockCipher;
  end;
end;

procedure TfrmMain.CreateBlockCipher;
const
  BlockCiphers: array [0..1] of TBlockCipherClass = (
    TDESCipher, TBlowfishCipher
  );
var
  Key: Int64;
begin
  with TDoubleDWORD(Key) do begin
    R := $01234567;
    L := $89abcdef;
  end;
  FBlockCipher.Free;
  FBlockCipher := BlockCiphers[rgBlockCipher.ItemIndex].Create(Key,
                                                               SizeOf(Key));
end;

procedure TfrmMain.FreeBlockCipher;
begin
  FBlockCipher.Free;
  FBlockCipher := nil;
end;

procedure TfrmMain.SetCipherText(const NewCipherText: string);
begin
  FCipherText := NewCipherText;
  txtCiphertext.Text := FCipherText;
end;

procedure TfrmMain.ShowTransformingLabel(const S: string);
begin
  lblTransforming.Caption := S;
  lblTransforming.Left := gbStrings.Left +
                          (gbStrings.Width - lblTransforming.Width) div 2;
  lblTransforming.Visible := True;
  lblTransforming.Update;
end;

procedure TfrmMain.HideTransformingLabel;
begin
  lblTransforming.Visible := False;
  lblTransforming.Update;
end;

procedure TfrmMain.cmdEncryptDecryptClick(Sender: TObject);
var
  InputFileName, OutputFileName, TransformingCaption: string;
  Input, Output: TStream;
  InputFileStream, OutputFileStream: TFileStream;
  T1, T2: DWORD;
  InputSize: DWORD;
  ElapsedTime: Double;
begin
  if Sender = cmdEncryptPlaintext then begin
    InputFileName := txtPlaintextFileName.Text;
    OutputFileName := txtCiphertextFileName.Text;
    TransformingCaption := 'Encrypting...';
  end
  else if Sender = cmdDecryptCiphertext then begin
    InputFileName := txtCiphertextFileName.Text;
    OutputFileName := txtPlaintextFileName.Text;
    TransformingCaption := 'Decrypting...';
  end
  else begin
    raise Exception.Create('Unknown sender.');
  end;
  if CompareText(InputFileName, OutputFileName) = 0 then begin
    raise Exception.Create('Plaintext file name and ciphertext file name ' +
                           'can''t be identical.');
  end;
  Screen.Cursor := crHourglass;
  if chkUseMemoryStream.Checked then begin
    InputFileStream := TFileStream.Create(InputFileName, fmOpenRead);
    InputFileStream.Seek(0, soFromBeginning);
    Input := TMemoryStream.Create;
    Input.Seek(0, soFromBeginning);
    Input.CopyFrom(InputFileStream, InputFileStream.Size);
    InputFileStream.Free;
  end
  else begin
    Input := TFileStream.Create(InputFileName, fmOpenRead);
  end;
  Input.Seek(0, soFromBeginning);
  InputSize := Input.Size;
  CreateBlockCipher;
  if chkUseMemoryStream.Checked or (OutputFileName = '') then begin
    Output := TMemoryStream.Create;
    (Output as TMemoryStream).SetSize(FBlockCipher.CiphertextLength(InputSize));
  end
  else begin
    Output := TFileStream.Create(OutputFileName, fmCreate);
  end;
  Output.Seek(0, soFromBeginning);
  ShowTransformingLabel(TransformingCaption);
  if Sender = cmdEncryptPlaintext then begin
    T1 := GetTickCount;
    FBlockCipher.EncryptStream(Input, Output);
    T2 := GetTickCount;
  end
  else begin
    T1 := GetTickCount;
    FBlockCipher.DecryptStream(Input, Output);
    T2 := GetTickCount;
  end;
  FreeBlockCipher;
  HideTransformingLabel;
  if chkUseMemoryStream.Checked and (OutputFileName <> '') then begin
    OutputFileStream := TFileStream.Create(OutputFileName, fmCreate);
    OutputFileStream.Seek(0, soFromBeginning);
    Output.Seek(0, soFromBeginning);
    OutputFileStream.CopyFrom(Output, Output.Size);
    OutputFileStream.Free;
  end;
  ElapsedTime := (T2 - T1) / 1000;
  Output.Free;
  Input.Free;
  lblInputSize.Caption := IntToStr(InputSize);
  lblElapsedTime.Caption := FormatFloat(',0.00', ElapsedTime);
  if ElapsedTime > 0 then 
    lblPerformance.Caption := FormatFloat(',0.00', InputSize / ElapsedTime)
  else begin
    lblPerformance.Caption := '';
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.cmdBrowsePlaintextClick(Sender: TObject);
begin
  if OpenDialog.Execute then txtPlaintextFilename.Text := OpenDialog.FileName;
end;

procedure TfrmMain.cmdBrowseCiphertextClick(Sender: TObject);
begin
  if OpenDialog.Execute then txtCiphertextFilename.Text := OpenDialog.FileName;
end;

procedure TfrmMain.txtPlaintextChange(Sender: TObject);
var Cadena:String;
begin
    Cadena := txtPlainText.Text;
    txtHexText.Text := DataToHex(Cadena,Length(Cadena));

end;

procedure TfrmMain.txtPlaintextExit(Sender: TObject);
var Cadena:String;
begin
    Cadena := txtPlainText.Text;
    txtHexText.Text := DataToHex(Cadena,SizeOf(Cadena));

end;

procedure TfrmMain.Button1Click(Sender: TObject);
(*$IFDEF UseTestVectors*)
var
  Block: Int64;
(*$ENDIF*)
begin
  CreateBlockCipher;
  try
    (*$IFDEF UseTestVectors*)
      // These are test vectors from "Handbook of Applied Cryptography", p. 256.
      // They correspond to the plaintext "Now is the time for all "
       Block := 4720303682739166257;
{      with TDoubleDWORD(Block) do begin
        //R := $4e6f7720;
        //L := $69732074;
        R := $31DCA2B1;
        L := $30E38141;
        //R := $666f7220;
        //L := $616c6c20;
      end;
}      txtPlaintext.Text := IntToHex(Block, SizeOf(Block));
      FBlockCipher.DecryptBlock(Block);
      txtVerification.Text := DataToHex(Block, SizeOf(Block));
    (*$ELSE*)
      CipherText :=
        (FBlockCipher as T64BitBlockCipher).DecryptedString(txtPlaintext.Text);
    (*$ENDIF*)
  finally
    FreeBlockCipher;
  end;
end;

end.
