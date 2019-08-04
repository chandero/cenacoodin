unit UnitAgencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFrmAgencia = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Cb: TComboBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CbKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgencia: TFrmAgencia;

implementation

{$R *.dfm}

procedure TFrmAgencia.Button1Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmAgencia.CbKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
           Button1.SetFocus
end;

end.
