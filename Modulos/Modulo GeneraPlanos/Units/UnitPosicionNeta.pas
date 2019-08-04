unit UnitPosicionNeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvSpecialProgress, StdCtrls, Buttons, JvEdit, JvTypedEdit;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    CBMeses: TComboBox;
    Label2: TLabel;
    EdAno: TJvYearEdit;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label5: TLabel;
    LblEstado: TLabel;
    Barra: TJvSpecialProgress;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
