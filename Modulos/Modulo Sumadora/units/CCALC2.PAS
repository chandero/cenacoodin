unit cCalc2;
//----------------------------------------------------------------------------
interface
uses
  Windows, Messages, DateUtils, Clipbrd, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Printers, ComCtrls, Math,ShellAPI, Menus,
  JvComponent, JvFormPlace;
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
    Button_Opt: TBitBtn;
    PopupMenu: TPopupMenu;
    PopLimpiar: TMenuItem;
    PopGuardar: TMenuItem;
    OD: TOpenDialog;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PopLimpiarClick(Sender: TObject);
    procedure PopGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Timer1Timer(Sender: TObject);
  private
    DispString, InputString : string;
    _sRutaLog :string;
    _sRutaLogL :string;
    _sCajaUser :string;
    PrevTeller, CurTeller, CurTotal, MemTotal : double;
    CalcAction, PrevCalcAction : char;
    MaxDigits, NumDigits : integer;
    procedure SetDispString(a: double);
    procedure AddTicket(a: string; b: Boolean;c:Boolean);
    procedure ClearCurrent;
    procedure ClearMemory;
    procedure TOTAL;
    procedure ADD;
    procedure MINUS;
    procedure MULTIPLY;
    procedure DIVI;
    procedure PERCENT;
  public
    UseThis : double;
  end;
//----------------------------------------------------------------------------
var
  TheCalculator: TTheCalculator;
  CloseType : Boolean;
  TheTicket : TextFile;
  LastKey, PrevKey : char;
  KeyPrev:Boolean;
  DrawLine, FormatString : string;
  OptionStatus : (os_DISPLAY, os_PRECISION, os_LOGO, os_HELP);
  DecimalStatus : (ds_YES, ds_NO);
  DecimalTyped : integer;
  Ancho,Alto:Integer;
//----------------------------------------------------------------------------
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



implementation
uses IniFiles;
{$R *.DFM}
//----------------------------------------------------------------------------
procedure TTheCalculator.FormCreate(Sender: TObject);
var     MiINI:string;
        _sPathPublico: string;
begin
_sPathPublico := FormatDateTime('yyyymmdd',Date);
Ancho := Self.Width;
Alto := Self.Height;
NumDigits := 2;
MaxDigits := 18;
DrawLine := '-';
ClearCurrent;
ClearMemory;
CloseType:= False;
//AddTicket(Caption, false);
//AddTicket(FormatString, true);
LastKey := ' ';
PrevKey := ' ';
UpDown1.Width := 45;
OptionStatus := os_DISPLAY;
Edit1.Visible := false;
Display.Visible := true;
UpDown1.Visible := false;
Label1.Visible := false;
ActiveControl := TWinControl(Display);
// Optional : only in desktop version
// Button_Use.Visible := false;
// Optional : only in desktop version
// Button_Quit.Width := Button_Use.Left + Button_Use.Width - Button_Quit.Left;
   _sCajaUser := ParamStr(1);
//   ShowMessage(_sCajaUser);
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  begin
     _sRutaLog := ReadString('DBNAME','pathp','\\archivos\');
     _sRutaLogL := ReadString('DBNAME','pathl','\\archivos\');     
  end;
  if DirectoryExists(_sRutaLog) = False then
     CreateDir(_sRutaLog);
  if DirectoryExists(_sRutaLogL) = False then
     CreateDir(_sRutaLogL);
  _sRutaLog := _sRutaLog + _sPathPublico + '\';
  _sRutaLogL := _sRutaLogL + _sPathPublico + '\';
//  ShowMessage(_sRutaLog);
//  ShowMessage(_sRutaLogL);
  try
    if DirectoryExists(_sRutaLog) = False then
       CreateDir(_sRutaLog);
  except
  end;
  try
    if DirectoryExists(_sRutaLogL) = False then
       CreateDir(_sRutaLogL);
  except
  end;
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
var   LineNr : Integer;
begin
IsError := False;
KeyPrev := False;
PrevKey := LastKey;
LastKey := UpCase(Key);
if LastKey = 'C' then LastKey := KeyCLEAR;
if LastKey = 'P' then LastKey := KeyPERCENT;
if LastKey = char(13) then LastKey := KeyTOTAL;
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
          if OD.Execute then begin
            ScreenTicket.Lines.Clear;
            ScreenTicket.Lines.LoadFromFile(OD.FileName);
          end;
        end; // case OptionStatus
     KeyQuit:
        begin
        CloseType := (LastKey = KeyUSE);
        Close;
        end; // KeyUSE
     KeyUSE :
        begin
        Clipboard.SetTextBuf(PChar(FloatToStr(UseThis)));
        end;
     KeyCLEAR :
        begin
        DecimalStatus := ds_NO;
        DecimalTyped := 0;
        if PrevKey = KeyCLEAR then
           begin
           ClearCurrent;
           AddTicket('C', True,False);
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
        AddTicket('MC', False,false);
        ClearMemory;
        end; // KeyMEMCLEAR
     KeyMEMSHOW :
        begin
        SetDispString(MemTotal);
        AddTicket(DispString + 'MR', False,False);
        end; // KeyMEMSHOW
     KeyMEMADD, KeyMEMMIN :
        begin
        case LastKey of
             KeyMEMADD :
                begin
                MemTotal := MemTotal + UseThis;
                AddTicket(DispString + 'M+', False,False);
                end; // KeyMEMADD
             KeyMEMMIN :
                begin
                MemTotal := MemTotal - UseThis;
                AddTicket(DispString + 'M-', False,False);
                end; // KeyMEMMIN
             end; // case CurrentKey
        CalcAction := ' ';
        InputString := ''; // if continued with an operation value of
                            // curteller is kept
                            // if digit typed, value of curteller is reset
        Button_MR.Visible := (MemTotal <> 0);
        Button_MC.Visible := (MemTotal <> 0);
        end; // KeyMEMADD, KeyMEMMIN
     KeyTOTAL: TOTAL;
     KeyADD: ADD;
     KeyMINUS : MINUS;
     KeyMULTIPLY : MULTIPLY;
     KeyDIV : DIVI;
     KeyPERCENT : PERCENT;
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
procedure TTheCalculator.AddTicket(a: string; b: Boolean;c:boolean);
begin
while Length(DrawLine) < MaxDigits do
   DrawLine := '-' + DrawLine;
if Pos('=',a) > 0 then c := True;
if b and not c then begin
    ScreenTicket.Lines.Add(FormatDateTime('yyyy/mm/dd hh:mm',Now));
    ScreenTicket.Lines.Add(DrawLine);
    end;
while Length(a) < MaxDigits do
   a := ' ' + a;
ScreenTicket.Lines.Add(a);
if b and c then
 begin
    ScreenTicket.Lines.Add(DrawLine);
    ScreenTicket.Lines.Add(FormatDateTime('yyyy/mm/dd hh:mm',Now));
 end;
 //ScreenTicket.Lines.SaveToFile('C:\Sum'+IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+'.sum');
 try
   ScreenTicket.Lines.SaveToFile(_sRutaLog + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' + _sCajaUser + '.sum');
 except
 end;
 try
   ScreenTicket.Lines.SaveToFile(_sRutaLogL + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' +  _sCajaUser + '.sum');
 except
 end;
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if CloseType then ModalResult := IDOK;
end;
//----------------------------------------------------------------------------
procedure TTheCalculator.PopLimpiarClick(Sender: TObject);
begin
        ScreenTicket.Lines.Clear;
end;

procedure TTheCalculator.PopGuardarClick(Sender: TObject);
begin
        //ScreenTicket.Lines.SaveToFile('C:\Sum'+IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+'.sum');
        try
          ScreenTicket.Lines.SaveToFile(_sRutaLog + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' + _sCajaUser + '.sum');
        except
        end;
        try
          ScreenTicket.Lines.SaveToFile(_sRutaLogL + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' + _sCajaUser + '.sum');
        except
        end;

end;

procedure TTheCalculator.FormShow(Sender: TObject);
var Archivo:string;
var Archivo1:string;
begin
        //Archivo := 'C:\Sum'+IntToStr(YearOf(Date))+Format('%.2d',[Monthof(date)])+Format('%.2d',[Dayof(Date)])+'.sum';
         Archivo := (_sRutaLog + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' + _sCajaUser + '.sum');
         Archivo1 :=(_sRutaLogL + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' + _sCajaUser + '.sum');
        if FileExists(Archivo) then
        begin
           ScreenTicket.Lines.LoadFromFile(Archivo1);
           ScreenTicket.Lines.Add('');
        end;
end;

procedure TTheCalculator.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        //ScreenTicket.Lines.SaveToFile('C:\Sum'+IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+'.sum');
          ScreenTicket.Lines.SaveToFile(_sRutaLog + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' + _sCajaUser + '.sum');
          ScreenTicket.Lines.SaveToFile(_sRutaLogL + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' + _sCajaUser + '.sum');
        

end;

procedure TTheCalculator.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
        Resize := False;
end;

procedure TTheCalculator.TOTAL;
var Cadena:string;
begin
        Cadena := ' =';
        case PrevKey of
              '0'..'9':
         case CalcAction of
           KeyADD      :
              begin
              AddTicket(DispString + ' +', False,False);
              CurTotal := CurTotal + CurTeller;
              end; // KeyAdd
           KeyMINUS    :
              begin
              AddTicket(DispString + ' -', False,False);
              CurTotal := CurTotal - CurTeller;
              end; // KeyMINUS
           KeyMULTIPLY :
              begin
              AddTicket(DispString + ' *', False,False);
              CurTotal := CurTotal * CurTeller;
              end; // KeyMULTIPLY
           KeyDIV      :
              begin
              AddTicket(DispString + ' /', False,False);
              if CurTeller = 0 then
                 begin
                 CurTotal := 0;
                 DispString := 'Error';
                 end // if CurTeller = 0
              else CurTotal := CurTotal / CurTeller;
              end; // KeyDIV
         end;
        end;
        case PrevCalcAction of
           KeyMULTIPLY :
              begin
              Cadena := '  ';
              KeyPrev := True;                            
              AddTicket(DispString + ' =', False,False);
              CurTotal := PrevTeller * CurTeller;
              end; // KeyMULTIPLY
           KeyDIV      :
              begin
               Cadena := '  ';
               KeyPrev := True;
               AddTicket(DispString + ' =', False,False);
               if CurTeller = 0 then
                  begin
                  CurTotal := 0;
                  DispString := 'Error';
                  end // if CurTeller = 0
               else CurTotal := PrevTeller / CurTeller;
              end; // KeyDIV
        end;
        SetDispString(CurTotal);
        AddTicket(DispString + Cadena, True,KeyPrev);
        CalcAction := ' ';
        PrevCalcAction:= ' ';
        PrevTeller := CurTotal;
        CurTeller := 0;

end;

procedure TTheCalculator.ADD;
begin
        CalcAction := LastKey;
        DecimalStatus := ds_NO;
        DecimalTyped := 0;
        case PrevKey of
              KeyADD, KeyMINUS:
               begin
//               if PrevKey <> LastKey then
               CalcAction := LastKey;
               CurTeller := PrevTeller;
               SetDispString(CurTeller);
               KeyPrev := True;
               end; // KeyADD, KeyMINUS
        end; // case PrevKey

        case PrevCalcAction of
              KeyMULTIPLY: begin
                            SetDispString(CurTeller);
                            AddTicket(DispString + ' =', False,False);
                            CurTeller := PrevTeller * CurTeller;
                            SetDispString(CurTeller);
                            PrevCalcAction := ' ';
                           end;
              KeyDIV     : begin
                            SetDispString(CurTeller);
                            AddTicket(DispString + ' =', False,False);
                            CurTeller := PrevTeller / CurTeller;
                            SetDispString(CurTeller);
                            PrevCalcAction := ' ';
                           end;
              KeyPERCENT      :
                           begin
                            CurTotal := CurTotal + PrevTeller;
                            SetDispString(CurTotal);
                            AddTicket(DispString + '%+', True,True);
                            PrevCalcAction := ' ';
                            CalcAction := ' ';
                            PrevTeller := 0;
                            CurTeller := 0;
                            CurTotal := 0;
                           end; // KeyADD
{           KeyMINUS    :
              begin
              AddTicket(DispString + '%-', False,False);
              CurTotal := CurTotal - (CurTotal * CurTeller / 100);
              end; // KeyMINUS
           KeyMULTIPLY :
              begin
              AddTicket(DispString + '%*', False,False);
              CurTotal := CurTotal * CurTeller / 100;
              end; // KeyMULTIPLY
           KeyDIV      :
              begin
              AddTicket(DispString + '%/', False,False);
              CurTotal := CurTotal / CurTeller / 100;
              end; // KeyDIV
}

        end;

        case CalcAction of
           KeyADD      :
              begin
              AddTicket(DispString + ' +', False,False);
              CurTotal := CurTotal + CurTeller;
              end; // KeyAdd
        end; // case CalcAction

        PrevTeller := CurTeller;
        CurTeller := 0;
        InputString := '';
        if LastKey = KeyTOTAL then
           begin
           CalcAction := ' ';
           end // if LastKey = KeyTOTAL
        else CalcAction := LastKey;

        SetDispString(CurTotal);
        if LastKey = KeyTOTAL then AddTicket(DispString + ' =', True,KeyPrev);


end;

procedure TTheCalculator.MINUS;
begin
        CalcAction := LastKey;
        DecimalStatus := ds_NO;
        DecimalTyped := 0;
        case PrevKey of
              KeyADD, KeyMINUS:
               begin
//               if PrevKey <> LastKey then
               CalcAction := LastKey;
               CurTeller := PrevTeller;
               SetDispString(CurTeller);
               KeyPrev := True;
               end; // KeyADD, KeyMINUS
        end; // case PrevKey

        case PrevCalcAction of
              KeyMULTIPLY: begin
                            SetDispString(CurTeller);
                            AddTicket(DispString + ' =', False,False);
                            CurTeller := PrevTeller * CurTeller;
                            SetDispString(CurTeller);
                            PrevCalcAction := ' ';
                           end;
              KeyDIV     : begin
                            SetDispString(CurTeller);
                            AddTicket(DispString + ' =', False,False);
                            CurTeller := PrevTeller / CurTeller;
                            SetDispString(CurTeller);
                            PrevCalcAction := ' ';
                           end;
              KeyPERCENT      :
                           begin
                            CurTotal := CurTotal + PrevTeller;
                            SetDispString(CurTotal);
                            AddTicket(DispString + '%+', True,True);
                            PrevCalcAction := ' ';
                            CalcAction := ' ';
                            PrevTeller := 0;
                            CurTeller := 0;
                            CurTotal := 0;
                           end; // KeyADD
{           KeyMINUS    :
              begin
              AddTicket(DispString + '%-', False,False);
              CurTotal := CurTotal - (CurTotal * CurTeller / 100);
              end; // KeyMINUS
           KeyMULTIPLY :
              begin
              AddTicket(DispString + '%*', False,False);
              CurTotal := CurTotal * CurTeller / 100;
              end; // KeyMULTIPLY
           KeyDIV      :
              begin
              AddTicket(DispString + '%/', False,False);
              CurTotal := CurTotal / CurTeller / 100;
              end; // KeyDIV
}

        end;


        case CalcAction of
           KeyMINUS    :
              begin
              AddTicket(DispString + ' -', False,False);
              CurTotal := CurTotal - CurTeller;
              end; // KeyMINUS
        end; // case CalcAction

        PrevTeller := CurTeller;
        CurTeller := 0;
        InputString := '';
        if LastKey = KeyTOTAL then
           begin
           CalcAction := ' ';
           end // if LastKey = KeyTOTAL
        else CalcAction := LastKey;

        SetDispString(CurTotal);
        if LastKey = KeyTOTAL then AddTicket(DispString + ' =', True,KeyPrev);
        
end;

procedure TTheCalculator.MULTIPLY;
begin
        DecimalStatus := ds_NO;
        DecimalTyped := 0;
        case PrevKey of
              KeyADD,KeyDIV:
               case LastKey of
                KeyMULTIPLY:
                 begin
                  SetDispString(CurTotal);
                  AddTicket(DispString + ' *', False,False);
                  CalcAction := ' ';
                 end;
                KeyDIV :
                 begin
                  SetDispString(CurTotal);
                  AddTicket(DispString + ' /', False,False);
                  CalcAction := ' ';
                 end;
                end;
              KeyPERCENT: begin
                            AddTicket(' ',False,False);
                            CurTeller := CurTotal;
                          end;
              KeyTOTAL:
                CurTeller := CurTotal;
        end; // case PrevKey
        case CalcAction of
           KeyMULTIPLY :
              begin
              AddTicket(DispString + ' *', False,False);
              CurTotal := CurTotal * CurTeller;
              end; // KeyMULTIPLY
           KeyDIV      :
              begin
               AddTicket(DispString + ' /', False,False);
               if CurTeller = 0 then
                  begin
                  CurTotal := 0;
                  DispString := 'Error';
                  end // if CurTeller = 0
               else CurTotal := CurTotal / CurTeller;
              end; // KeyDIV
        end;
        PrevTeller := CurTeller;
        CurTeller := 0;
        InputString := '';
        if LastKey = KeyTOTAL then
           begin
           CalcAction := ' ';
           end // if LastKey = KeyTOTAL
        else  PrevCalcAction := LastKey;
        SetDispString(PrevTeller);
        AddTicket(DispString + ' *', False,False);        
        if LastKey = KeyTOTAL then AddTicket(DispString + ' =', True,KeyPrev);
end;

procedure TTheCalculator.DIVI;
begin
        DecimalStatus := ds_NO;
        DecimalTyped := 0;
        case PrevKey of
              KeyADD,KeyDIV:
               case LastKey of
                KeyMULTIPLY:
                 begin
                  SetDispString(CurTotal);
                  AddTicket(DispString + ' *', False,False);
                  CalcAction := ' ';
                 end;
                KeyDIV :
                 begin
                  SetDispString(CurTotal);
                  AddTicket(DispString + ' /', False,False);
                  CalcAction := ' ';
                 end;
                end; // case LastKey
              end; // case PrevKey
        case CalcAction of
           KeyMULTIPLY :
              begin
              AddTicket(DispString + ' *', False,False);
              CurTotal := CurTotal * CurTeller;
              end; // KeyMULTIPLY
           KeyDIV      :
              begin
               AddTicket(DispString + ' /', False,False);
               if CurTeller = 0 then
                  begin
                  CurTotal := 0;
                  DispString := 'Error';
                  end // if CurTeller = 0
               else CurTotal := CurTotal / CurTeller;
              end; // KeyDIV
        end;
        PrevTeller := CurTeller;
        CurTeller := 0;
        InputString := '';
        if LastKey = KeyTOTAL then
           begin
           CalcAction := ' ';
           end // if LastKey = KeyTOTAL
        else PrevCalcAction := LastKey;
        SetDispString(CurTotal);
        if LastKey = KeyTOTAL then AddTicket(DispString + ' =', True,KeyPrev);
end;

procedure TTheCalculator.PERCENT;
begin
        DecimalStatus := ds_NO;
        DecimalTyped := 0;

              begin
              AddTicket(DispString + ' %', False,False);
              CurTotal := PrevTeller * (CurTeller / 100);
              SetDispString(CurTotal);
              AddTicket(DispString + ' +', False,False);
              PrevCalcAction := '%';
              end; // new entry
              
        CalcAction := ' ';
        InputString := ' '; // if continued with an operation value of
                            // curteller is kept
                            // if digit typed, value of curteller is reset
end;

procedure TTheCalculator.Timer1Timer(Sender: TObject);
begin
        //ScreenTicket.Lines.SaveToFile('C:\Sum'+IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+'.sum');
          ScreenTicket.Lines.SaveToFile(_sRutaLog + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' + _sCajaUser + '.sum');
          ScreenTicket.Lines.SaveToFile(_sRutaLogL + 'sum_' + IntToStr(Yearof(Date))+Format('%.2d',[Monthof(Date)])+Format('%.2d',[Dayof(Date)])+ '_' + _sCajaUser + '.sum');
        
end;

end.
