unit UnitSumadora;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TFrame1 = class(TFrame)
    ExtraPanel: TPanel;
    Button_Percent: TButton;
    Button_C: TButton;
    Button_Opt: TButton;
    Button_Print: TBitBtn;
    MemoryPanel: TPanel;
    Button_MC: TButton;
    Button_MR: TButton;
    Button_MPlus: TButton;
    Button_MMinus: TButton;
    OperatorPanel: TPanel;
    Button_Div: TButton;
    Button_Times: TButton;
    Button_Minus: TButton;
    Button_Plus: TButton;
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
    ClosePanel: TPanel;
    Button_Quit: TButton;
    Button_Use: TButton;
    ScreenTicket: TMemo;
    DisplayPanel: TPanel;
    Display: TPanel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrame1.FrameEnter(Sender: TObject);
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
end;

end.
