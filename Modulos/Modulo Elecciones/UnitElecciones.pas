unit UnitElecciones;

interface

uses
  IniFiles, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin;

type
  TfrmMain = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  SalirMal:Boolean;

implementation

{$R *.dfm}

uses Unitdmgeneral,UnitRegistrarAsociado, UnitReporteVotantes,
     UnitLogin, UnitGlobales;

procedure TfrmMain.FormShow(Sender: TObject);
var
  frmLogin:TfrmLogin;
  Veces :Integer;
  Mensaje:string;
  MiINI : string;
begin

  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.1.8');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
  finally
    free;
  end;

        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'ELECCION';
        DM.IBDatabase1.Connected := false;
        while not DM.IBDatabase1.Connected do
          begin
           if Veces = 3 then
           begin
                SalirMal := True;
                Exit;
           end;
          if frmLogin.ShowModal = mrOk then
           begin
             with frmLogin do
             begin
                DBAlias := EdUsuario.Text;
                DBPasabordo:= EdPasabordo.Text;
                Role := EdRole.Text;
                DM.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
                DM.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
                DM.IBDatabase1.Params.Values['User_Name'] := DBAlias;
                DM.IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
                DM.IBDatabase1.Params.Values['sql_role_name'] := Role;
                Veces := Veces + 1;

                try
                    DM.IBDatabase1.Connected := True;
                    DM.IBTransaction1.Active := True;
                except
                        on E: Exception do
                        begin
                          if StrLIComp(PChar(E.Message),PChar('Your user name'),14) = 0 then
                           begin
                            Mensaje :='Verifique su Nombre y su Contraseña' + #10 + #13 + 'Mensaje:' + E.Message;
                            MessageBox(0,PChar(Mensaje),PChar('Usuario Invalido'),MB_OK OR MB_ICONERROR);
                           end
                          else
                           begin
                            Mensaje := 'Verifique su Configuración o Informe al Administrador de la Red' + #10 + #13 + 'Mensaje:' + E.Message;
                            MessageBox(0,PChar(Mensaje),PChar('Configuración Erronea'),MB_OK OR MB_ICONERROR);
                           end;
                        end; //fin del begin de la excepción.
                end; // fin del try

             end; //fin del begin del with

            end // fin del begin del if superior
          else
          begin
             SalirMal := True;
             Exit;
          end;
         end; // fin del while
end;

procedure TfrmMain.ToolButton1Click(Sender: TObject);
var frmRegistrarAsociado:TfrmRegistrarAsociado;
begin
    frmRegistrarAsociado := TfrmRegistrarAsociado.Create(Self);
    frmRegistrarAsociado.ShowModal;
end;

procedure TfrmMain.ToolButton5Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmMain.ToolButton2Click(Sender: TObject);
 var frmReporte:TfrmReporte;
begin
   frmReporte := TfrmReporte.Create(Self);
   frmReporte.ShowModal;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #27 then ToolButton2.Visible :=  not ToolButton2.Visible;

end;

end.
