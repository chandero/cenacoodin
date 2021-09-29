unit unitLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmLogin = class(TForm)
    EdUsuario: TEdit;
    EdPasabordo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdRole: TEdit;
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure Ente(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses UnitGlobales;

{$R *.dfm}


procedure TfrmLogin.BtnCancelarClick(Sender: TObject);
begin
        Application.Terminate;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
        EdUsuario.SetFocus;
end;

procedure TfrmLogin.EdUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmLogin.Ente(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

end.
