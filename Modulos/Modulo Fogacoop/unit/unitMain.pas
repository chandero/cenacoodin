unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, ComCtrls,
  jpeg, ExtCtrls, pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTime, DateUtils,
  ToolWin, Grids, XStringGrid, IBSQL;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    PrinterSetupDialog: TPrinterSetupDialog;
    ActionList: TActionList;
    Mnu01: TMenuItem;
    ConfigurarImpresora1: TMenuItem;
    N1: TMenuItem;
    SalirdePSI1: TMenuItem;
    Configurar_Impresora: TAction;
    N2: TMenuItem;
    IdTime1: TIdTime;
    ImageList: TImageList;
    ToolBar1: TToolBar;
    BtnSalir: TToolButton;
    BtnCartera: TToolButton;
    ToolButton3: TToolButton;
    CArtera1: TMenuItem;
    Causacion1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Causacion1Click(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnCarteraClick(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses unitLogin, unitdmGeneral, Unitglobales,
     unitglobalescol, IniFiles, UnitDmcolocacion,
     UnitPantallaProgreso, UnitCarteraFogacoop;

procedure TfrmMain.Configurar_ImpresoraExecute(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var frmLogin:TfrmLogin;
    Veces :SmallInt;
    Mensaje :String;
    Ruta:string;
    AA,MM,DD,H,M,S,ms:Word;
    Role:string;
//    frmConectando:TfrmConectando;
begin
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','100.21.210.24');
    DBPath := ReadString('DBNAME','path','/base/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
  finally
    free;
  end;

//     DecodeDateTime(Now,AA,MM,DD,H,M,S,ms);
  //   H := 08;
    // M := 00;
//     S := 00;
  //   ms := 00;
     Veces := 0;
//     if IdTime1.DateTime >= EncodeDateTime(AA,MM,DD,H,M,S,ms)  then
  //    begin
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'CARTERA';
        dmGeneral.IBDatabase1.Connected := false;
        while Not dmGeneral.IBDatabase1.Connected do
          begin
           if Veces = 3 then
           begin
                SalirMal := True;
//                Self.Close;
                Exit;
           end;
          if frmLogin.ShowModal = mrOk then
           begin
             with frmLogin do
             begin
                DBAlias := EdUsuario.Text;
                DBPasabordo:= EdPasabordo.Text;
                Role := EdRole.Text;
                dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
                dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
                dmGeneral.IBDatabase1.Params.Values['User_Name'] := DBAlias;
                dmGeneral.IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
                dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := Role;
                Veces := Veces + 1;

                try
                    dmGeneral.IBDatabase1.Connected := True;
                    dmGeneral.IBTransaction1.Active := True;
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
         //    Self.Close;
             Exit;
          end;
         end; // fin del while

//      end  // fin de Verificacion de hora
//     else
  //    begin
    //    MessageDlg('No se puede Iniciar el Programa',mtError,[mbOK],0);
      //  SalirMal := True;
//        Exit;
  //    end;

  DecimalSeparator := '.';
  Ruta := ExtractFilePath(Application.ExeName);
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar SIFCOOPSERVIR',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
         with TIniFile.Create(MiINI) do
          try
            WriteString('DBNAME','server',DBserver);
            WriteString('DBNAME','path',DBpath);
            WriteString('DBNAME','name',DBname);
            WriteString('EMPRESA','name',Empresa);
            WriteString('EMPRESA','nit',Nit);
            WriteInteger('EMPRESA','Agencia',Agencia);
            WriteString('EMPRESA','city',Ciudad);
          finally
           begin
            dmGeneral.IBDatabase1.Connected := False;
            dmGeneral.IBTransaction1.Active  := False;
            dmGeneral.Free;
            Action:= caFree;
           end;
          end
        else
            Action := caNone
       else
         begin
            dmGeneral.Free;
            Action := caFree;
         end;
end;

procedure TfrmMain.ConfigurarImpresora1Click(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;


procedure TfrmMain.SalirdePSI1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        if salirmal then close;
{        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;}
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.Causacion1Click(Sender: TObject);
var frmCarteraFogacoop : TfrmCarteraFogacoop;
begin
        frmcarterafogacoop := tfrmcarterafogacoop.Create(Self);
        frmcarterafogacoop.ShowModal;
end;

procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMain.BtnCarteraClick(Sender: TObject);
var frmCarteraFogacoop : TfrmCarteraFogacoop;
begin
        frmcarterafogacoop := tfrmcarterafogacoop.Create(Self);
        frmcarterafogacoop.ShowModal;
end;

end.
