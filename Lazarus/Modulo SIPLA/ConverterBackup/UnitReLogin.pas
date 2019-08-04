unit UnitReLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmReLogin = class(TForm)
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label2: TLabel;
    EdPasabordo: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CreateParams(var Params: TCreateParams); override;

  public
    { Public declarations }
  end;

var
  frmReLogin: TfrmReLogin;

implementation

{$R *.dfm}

uses UnitGlobales, UnitMain;

procedure TfrmReLogin.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle or WS_EX_TOPMOST;
    WndParent := GetDesktopwindow;
  end;
end;

procedure TfrmReLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
