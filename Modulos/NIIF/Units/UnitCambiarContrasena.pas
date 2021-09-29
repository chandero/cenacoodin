unit UnitCambiarContrasena;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBServices, StdCtrls, ExtCtrls, Buttons, IBSQL, UnitDmGeneral;

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
    Label7: TLabel;
    EdPasabordoAnt: TEdit;
    IBSQL1: TIBSQL;
    procedure CmdCambiarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FBien:Boolean;
    { Private declarations }
  public
    property Bien:Boolean read FBien Write FBien;
    { Public declarations }
  end;

var
  frmCambiarContrasena: TfrmCambiarContrasena;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses unitGlobales;

procedure TfrmCambiarContrasena.CmdCambiarClick(Sender: TObject);
begin

     FBien := False;
     if EdPasabordoAnt.Text <> DBPasabordo then begin
        MessageDlg('La contraseña actual no concuerda',mtError,[mbok],0);
        EdPasabordoAnt.SetFocus;
        Exit;
     end;

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
            with IBSQL1 do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('update "gen$empleado" set ULTIMO_CAMBIO_PASABORDO = :FECHA');
            SQL.Add('where ID_EMPLEADO = :ID_EMPLEADO');
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            try
             ExecQuery;
            except
             Transaction.Rollback;
             raise;
            end;

            Close;
            SQL.Clear;
            SQL.Add('insert into "gen$hpasabordo" values (:ID_EMPLEADO,:FECHA,:HORA)');
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('HORA').AsTime := fHoraActual;
            try
             ExecQuery;
            except
             Transaction.Rollback;
             raise;
            end;
            Transaction.Commit;
            end;//with
            FBien := True;
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

procedure TfrmCambiarContrasena.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCambiarContrasena.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        FBien := False;
end;

end.
