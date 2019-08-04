unit UnitCambiarContrasena;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBServices, StdCtrls, ExtCtrls, Buttons;

type
  TfrmCambiarContrasena = class(TForm)
    IBSS1: TIBSecurityService;
    Label1: TLabel;
    EdPasabordo: TEdit;
    Label2: TLabel;
    EdRePasabordo: TEdit;
    Panel1: TPanel;
    CmdCambiar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label3: TLabel;
    EdNombre: TStaticText;
    EdApellidos: TStaticText;
    Label4: TLabel;
    Label5: TLabel;
    EdUID: TStaticText;
    Label6: TLabel;
    EdGID: TStaticText;
    procedure CmdCambiarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCambiarContrasena: TfrmCambiarContrasena;

implementation

{$R *.dfm}

uses unitGlobales;

procedure TfrmCambiarContrasena.CmdCambiarClick(Sender: TObject);
begin
     if EdPasabordo.Text <> EdRePasabordo.Text then begin
        MessageDlg('Las contraseñas digitadas no concuerdan',mtError,[mbcancel],0);
        EdPasabordo.SetFocus;
        Exit;
     end;

     if MessageDlg('Seguro de Cambiar la Contraseña?',mtConfirmation,[mbyes,mbno],0) = mrYes then begin
        CmdCambiar.Enabled := False;
        Application.ProcessMessages;
        with IBSS1 do begin
          Password := EdPasabordo.Text;
          SecurityAction := ActionModifyUser;
          Active := True;
          try
            ModifyUser;
            MessageDlg('Contraseña Actualizada Con Exito!',mtInformation,[mbok],0);
          finally
            Active := False;
          end;
        end;
     end;

end;

procedure TfrmCambiarContrasena.FormShow(Sender: TObject);
begin
  with IBSS1 do begin
    ServerName := DBserver;
    LoginPrompt := False;
    Params.Add('user_name=sysdba');
    Params.Add('password=masterkey');
    Active := True;
    try
     UserName := DBAlias;
     DisplayUser(UserName);
     EdNombre.Caption := UserInfo[0].FirstName;
     EdApellidos.Caption := UserInfo[0].MiddleName + ' ' + UserInfo[0].LastName;
     EdUID.Caption := IntToStr(UserInfo[0].UserID);
     EdGID.Caption := IntToStr(UserInfo[0].GroupID);
    finally
     Active := False;
    end;
  end;

end;

procedure TfrmCambiarContrasena.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

end.
