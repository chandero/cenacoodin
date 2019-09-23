//----------------------------------------------------------------------------
{
 FileName : fcalc.pas
 Project  : Calculator.exe
 Contents : Calculator with on screen history tape,
            print utility and user definable precision.
 Compiler : Delphi 2.0
 (c) 1998 : Marc Georges
 History  : 30/10/98 Start
}
//----------------------------------------------------------------------------
unit cCalc2;
//----------------------------------------------------------------------------
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Printers, ComCtrls, Math, cButton, ShellAPI;
//----------------------------------------------------------------------------
type
  TTheCalculator = class(TForm)
    DisplayPanel: TPanel;
    NumericPanel: TPanel;
    Button_7: TButton;
    Button_8: TButton;
    Button_9: TButton;
    Button_4: TButton;
    Button_5: TButton;
    Button_6: TButton;
    Button_1: TButton;
    Button_2: TButton;
    Button_3: TButton;
    Button_0: TButton;
    Button_Dec: TButton;
    Button_Total: TButton;
    OperatorPanel: TPanel;
    Button_Div: TButton;
    Button_Times: TButton;
    Button_Minus: TButton;
    Button_Plus: TButton;
    ExtraPanel: TPanel;
    Button_Percent: TButton;
    ClosePanel: TPanel;
    Button_Quit: TButton;
    Button_Use: TButton;
    Button_C: TButton;
    Button_Opt: TButton;
    MemoryPanel: TPanel;
    Button_MC: TButton;
    Button_MR: TButton;
    Button_MPlus: TButton;
    Button_MMinus: TButton;
    Button_Print: TBitBtn;
    Display: TPanel;
    PrintDialog: TPrintDialog;
    ScreenTicket: TMemo;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    DispString, InputString : string;
    PrevTeller, CurTeller, CurTotal, MemTotal : double;
    CalcAction : char;
    MaxDigits, NumDigits : integer;
    procedure SetDispString(a: double);
    procedure AddTicket(a: string; b: boolean);
    procedure ClearCurrent;
    procedure ClearMemory;
  public
    UseThis : double;
  end;
//----------------------------------------------------------------------------
var
  TheCalculator: TTheCalculator;
  CloseType : Boolean;
  TheTicket : TextFile;
  LastKey, PrevKey : char;
  DrawLine, FormatString : string;
  OptionStatus : (os_DISPLAY, os_PRECISION, os_LOGO, os_HELP);
  DecimalStatus : (ds_YES, ds_NO);
  DecimalTyped : integer;
//----------------------------------------------------------------------------
implementation
{$R *.DFM}
//----------------------------------------------------------------------------
procedure TTheCalculator.FormCreate(Sender: TObject);
begin
NumDigits := 2;
MaxDigits := 14;
DrawLine := '-';
ClearCurrent;
ClearMemory;
CloseType:= False;
AddTicket(Caption, false);
AddTicket(FormatString, true);
LastKey := ' ';
PrevKey := ' ';
UpDown1.Width := 45;
OptionStatus := os_DISPLAY;
Button1.Visible := false;
Edit1.Visible := false;
Display.Visible := true;
UpDown1.Visible := false;
Label1.Visible := false;
Button2.Visible := false;
ActiveControl := nil;
// Optional : only in desktop version
// Button_Use.Visible := false;
// Optional : only in desktop version
// Button_Quit.Width := Button_Use.Left + Button_Use.Width - Button_Quit.Left;
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.ClearCurrent;
begin
DecimalStatus := ds_NO;
DecimalTyped := 0;
CalcAction := ' ';
UseThis := 0;
CurTotal := 0;
CurTeller := 0;
PrevTeller := 0;
SetDispString(CurTeller);
InputString := '';
Display.Caption := DispString;
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.ClearMemory;
begin
MemTotal := 0;
Button_MR.Visible := (MemTotal <> 0);
Button_MC.Visible := (MemTotal <> 0);
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.ButtonClick(Sender: TObject);
var
  LastButton : char;
begin
if (Sender is TButton) then
   begin
   LastButton := char(TButton(Sender).tag); // convert longint to char
   FormKeyPress(Sender, LastButton);
   end; // if (Sender is TButton)
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.SetDispString(a: double);
begin
UseThis := a;
DispString := FloatToStrF(a, ffNumber, MaxDigits, NumDigits) + ' ';  // change this
Button_MR.Visible := (MemTotal <> 0);
Button_MC.Visible := (MemTotal <> 0);
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.FormKeyPress(Sender: TObject; var Key: Char);
const
  KeyQUIT = char(27);
  KeyUSE = char(1);
  KeyMEMCLEAR = char(2);
  KeyMEMSHOW = char(3);
  KeyMEMADD = char(4);
  KeyMEMMIN = char(5);
  KeyPERCENT = char(37);
  KeyPRINT = char(7);
  KeyCLEAR = char(12);
  KeyOPTIONS = char(9);
  KeyADD = char(43);
  KeyMINUS = char(45);
  KeyMULTIPLY = char(42);
  KeyDIV = char(47);
  KeyTOTAL = char(61);
  KeyPOINT = char(46);
  KeyBACK = char(8);
var
  IsError : boolean;
  LineNr : integer;
begin
IsError := False;
PrevKey := LastKey;
LastKey := UpCase(Key);
if LastKey = char(13) then LastKey := KeyTOTAL;;
case LastKey of
     KeyPRINT :
        begin
        if PrintDialog.Execute then
           begin
           AssignPrn(TheTicket);
           Rewrite(TheTicket);
           Printer.Canvas.Font := ScreenTicket.Font;
           for LineNr := 0 to ScreenTicket.Lines.Count - 1 do
               WriteLn(TheTicket, ScreenTicket.Lines[LineNr]);
           CloseFile(TheTicket);
           end; // if PrintDialog1.Execute then
        end; // KeyPrint
     KeyOPTIONS :
        begin
          case OptionStatus of
               os_DISPLAY   :
                  begin
                  Edit1.Text := IntToStr(NumDigits);
                  OptionStatus := os_PRECISION;
                  end;
               os_PRECISION :
                  begin
                  NumDigits := StrToInt (Edit1.Text);
                  OptionStatus := os_LOGO;
                  end;
               os_LOGO :
                  OptionStatus := os_HELP;
               os_HELP :
                  OptionStatus := os_DISPLAY;
               end; // case OptionStatus
        Display.Visible := (OptionStatus = os_DISPLAY);
        Label1.Visible := (OptionStatus = os_PRECISION);
        Edit1.Visible := (OptionStatus = os_PRECISION);
        UpDown1.Visible := (OptionStatus = os_PRECISION);
        Button2.Visible := (OptionStatus = os_LOGO);
        Button1.Visible := (OptionStatus = os_HELP);
        end;
     KeyQuit, KeyUSE :
        begin
        CloseType := (LastKey = KeyUSE);
        Close;
        end; // KeyUSE
     KeyCLEAR :
        begin
        DecimalStatus := ds_NO;
        DecimalTyped := 0;
        if PrevKey = KeyCLEAR then
           begin
           ClearCurrent;
           AddTicket('C', true);
           end
        else
           begin
           CurTeller := 0;
           InputString := '';
           SetDispString(CurTeller);
           end;
        end; // KeyCLEAR
     KeyMEMCLEAR :
        begin
        AddTicket('MC', false);
        ClearMemory;
        end; // KeyMEMCLEAR
     KeyMEMSHOW :
        begin
        SetDispString(MemTotal);
        AddTicket(DispString + 'MR', false);
        end; // KeyMEMSHOW
     KeyMEMADD, KeyMEMMIN :
        begin
        case LastKey of
             KeyMEMADD :
                begin
                MemTotal := MemTotal + UseThis;
                AddTicket(DispString + 'M+', false);
                end; // KeyMEMADD
             KeyMEMMIN :
                begin
                MemTotal := MemTotal - UseThis;
                AddTicket(DispString + 'M-', false);
                end; // KeyMEMMIN
             end; // case CurrentKey
        CalcAction := ' ';
        InputString := ''; // if continued with an operation value of
                            // curteller is kept
                            // if digit typed, value of curteller is reset
        Button_MR.Visible := (MemTotal <> 0);
        Button_MC.Visible := (MemTotal <> 0);
        end; // KeyMEMADD, KeyMEMMIN
     KeyADD, KeyMINUS, KeyMULTIPLY, KeyDIV, KeyTOTAL :
        begin
        DecimalStatus := ds_NO;
        DecimalTyped := 0;
        case PrevKey of
              KeyADD, KeyMINUS, KeyMULTIPLY, KeyDIV, KeyTOTAL :
              begin
                  CurTeller := PrevTeller;
                  SetDispString(CurTeller);
              end; // KeyADD, KeyMINUS
              end; // case PrevKey
        case CalcAction of
           KeyADD      :
              begin
              AddTicket(DispString + ' +', false);
              CurTotal := CurTotal + CurTeller;
              end; // KeyAdd
           KeyMINUS    :
              begin
              AddTicket(DispString + ' -', false);
              CurTotal := CurTotal - CurTeller;
              end; // KeyMINUS
           KeyMULTIPLY :
              begin
              AddTicket(DispString + ' *', false);
              CurTotal := CurTotal * CurTeller;
              end; // KeyMULTIPLY
           KeyDIV      :
              begin
              AddTicket(DispString + ' /', false);
              if CurTeller = 0 then
                 begin
                 CurTotal := 0;
                 DispString := 'Error';
                 end // if CurTeller = 0
              else CurTotal := CurTotal / CurTeller;
              end; // KeyDIV
           else
              begin
              AddTicket(DispString + '  ', false);
              CurTotal := CurTeller;
              end; // new entry
           end; // Case CalcAction
        PrevTeller := CurTeller;
        CurTeller := 0;
        InputString := '';
        if LastKey = KeyTOTAL then
           begin
           CalcAction := ' ';
           end // if LastKey = KeyTOTAL
        else CalcAction := LastKey;
        SetDispString(CurTotal);
        if LastKey = KeyTOTAL then AddTicket(DispString + ' =', true);
        end; // KeyAdd, KeyMINUS, ...
     KeyPERCENT :
        begin
        DecimalStatus := ds_NO;
        DecimalTyped := 0;
        case CalcAction of
           KeyADD      :
              begin
              AddTicket(DispString + '%+', false);
              CurTotal := CurTotal + (CurTotal * CurTeller / 100);
              end; // KeyADD
           KeyMINUS    :
              begin
              AddTicket(DispString + '%-', false);
              CurTotal := CurTotal - (CurTotal * CurTeller / 100);
              end; // KeyMINUS
           KeyMULTIPLY :
              begin
              AddTicket(DispString + '%*', false);
              CurTotal := CurTotal * CurTeller / 100;
              end; // KeyMULTIPLY
           KeyDIV      :
              begin
              AddTicket(DispString + '%/', false);
              CurTotal := CurTotal / CurTeller / 100;
              end; // KeyDIV
           else
              begin
              AddTicket(DispString + '% ', false);
              CurTotal := CurTeller;
              end; // new entry
           end; // Case CalcAction
        CalcAction := ' ';
        InputString := ' '; // if continued with an operation value of
                            // curteller is kept
                            // if digit typed, value of curteller is reset
        SetDispString(CurTotal);
        PrevTeller := CurTeller;
        CurTeller := CurTotal;
        CurTotal := 0;
        AddTicket(DispString + '%=', true);
        end; // KeyAdd, KeyMINUS, ...
     KeyPOINT :
        begin
        if DecimalStatus = ds_NO then
           begin
           DecimalStatus := ds_YES;
           DecimalTyped := 0;
           InputString := InputString + DecimalSeparator;
           CurTeller := StrToFloat(InputString);
           SetDispString(CurTeller);
           end; // if DecimalStatus := ds_NO
        end;
     '0'..'9' :
        begin
        if DecimalStatus = ds_YES then Inc(DecimalTyped)
        else DecimalTyped := 0;
        if DecimalTyped <= NumDigits then
           begin
           if Length(InputString) <= MaxDigits then
              InputString := InputString + LastKey;
              CurTeller := StrToFloat(InputString);
              SetDispString(CurTeller);
           end;
        end; // '0'..'9'
     KeyBACK :
        begin
        if Length(InputString) > 0 then
           begin
           if InputString[Length(InputString)] = DecimalSeparator then
              begin
              SetLength(InputString, Length(InputString)- 2);
              DecimalStatus := ds_NO;
              end
           else
              begin
              SetLength(InputString, Length(InputString)- 1);
              if DecimalTyped > 0 then Dec(DecimalTyped);
              end;
           end; // if Length(Inputstring) > 0
        If Length(InputString) = 0 then CurTeller := 0
        else CurTeller := StrToFloat(InputString);
        SetDispString(CurTeller);
        end; // '0'..'9'
     end; // case CurrentKey of
if IsError then DispString := 'Err. ';
Display.Caption := DispString;
ActiveControl := nil;
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.AddTicket(a: string; b: boolean);
begin
while Length(a) < MaxDigits do
   a := ' ' + a;
ScreenTicket.Lines.Add(a);
while Length(DrawLine) < MaxDigits do
   DrawLine := '-' + DrawLine;
if b then ScreenTicket.Lines.Add(DrawLine);
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if CloseType then ModalResult := IDOK;
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.Button1Click(Sender: TObject);
begin
Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TTheCalculator.Button2Click(Sender: TObject);
begin
// Send an e-mail to ExEntryC
ShellExecute(GetDesktopWindow(), 'open', 'mailto:exentryc@ping.be', nil, nil, SW_SHOWNORMAL);
end;

end.
