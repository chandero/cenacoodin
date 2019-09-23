unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    CBMeses: TComboBox;
    CBNivel: TComboBox;
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdReporte: TBitBtn;
    cmdCerrar: TBitBtn;
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
