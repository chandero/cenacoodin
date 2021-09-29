unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, ComCtrls,
  jpeg, ExtCtrls, pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTime, DateUtils,
  ToolWin;

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
    Cartera1: TMenuItem;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IdTime1: TIdTime;
    ImageList: TImageList;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    BtnReporteDatacredito: TToolButton;
    CambiarContrasea1: TMenuItem;
    BtnReporteCifin: TToolButton;
    ToolButton2: TToolButton;
    ProcesoDataCrdito1: TMenuItem;
    ProcesoCifin1: TMenuItem;
    CambioNumeracionCifin1: TMenuItem;
    Cedulas1: TMenuItem;
    ConsolidarDatacredito1: TMenuItem;
    NovedadesData1: TMenuItem;
    PlanoTraslados1: TMenuItem;
    ImportarDatosOficina1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnReporteDatacreditoClick(Sender: TObject);
    procedure BtnReporteCifinClick(Sender: TObject);
    procedure CambioNumeracionCifin1Click(Sender: TObject);
    procedure Cedulas1Click(Sender: TObject);
    procedure ConsolidarDatacredito1Click(Sender: TObject);
    procedure NovedadesData1Click(Sender: TObject);
    procedure PlanoTraslados1Click(Sender: TObject);
    procedure ImportarDatosOficina1Click(Sender: TObject);
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

uses UnitGlobales, unitLogin, unitdmGeneral, UnitProcesarDatacredito,
     INIFiles, UnitCambiarContrasena, UnitCambioNumeracionCifin,UnitProcesarCentrales,
     UnitCambioPersona, UnitProcesarCifin,UnitConsolidarData, UnitNovedadData,UnitCambioOficina, UnitImportarDatosOficina;

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
    DBserver1 := ReadString('DBNAME','server1','192.168.1.2');
    DBPath1 := ReadString('DBNAME','path1','/var/db/fbird/');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    TipoData  := ReadString('EMPRESA','tipoData','06');
    CodigoData:= ReadString('EMPRESA','codigodata','273919');
    CodigoCifin:=ReadString('EMPRESA','codigocifin','201012');
    TipoProceso := ReadInteger('EMPRESA','local',1);
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    host_abrego := ReadString('ADICIONALES','host_abrego','0.0.0.0');
    host_convencion := ReadString('ADICIONALES','host_convencion','0.0.0.0');
    host_aguachica := ReadString('ADICIONALES','host_aguachica','0.0.0.0');
    puerto_abrego := ReadInteger('ADICIONALES','puerto_abrego',0);
    puerto_convencion := ReadInteger('ADICIONALES','puerto_convencion',0);
    puerto_aguachica := ReadInteger('ADICIONALES','puerto_aguachica',0);
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
        while not dmGeneral.IBDatabase1.Connected do
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
  frmMain.Caption := frmMain.Caption + ' ' + DBServer;

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar DataProceso',mtConfirmation,[mbYes,mbNo],0) = mrYes Then

   {      with TIniFile.Create(MiINI) do
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
          end     }
        begin
            dmGeneral.IBDatabase1.Connected := False;
            dmGeneral.IBTransaction1.Active  := False;
            dmGeneral.Free;
            Action:= caFree;
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

procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena : TfrmCambiarContrasena;
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.BtnReporteDatacreditoClick(Sender: TObject);
var frmProcesarCentrales : TfrmProcesarCentrales;
begin
        frmProcesarCentrales := TfrmProcesarCentrales.Create(Self);
        frmProcesarCentrales.ShowModal;
end;

procedure TfrmMain.BtnReporteCifinClick(Sender: TObject);
var frmConsolidarData : TfrmConsolidarData;
begin
        if Agencia = 1 then
          begin
            frmConsolidarData := TfrmConsolidarData.Create(Self);
            frmConsolidarData.ShowModal;
          end
        else
          MessageDlg('Esta Agencia no tiene Permiso para Consolidar Informacion',mtInformation,[mbok],0);
end;

procedure TfrmMain.CambioNumeracionCifin1Click(Sender: TObject);
var frmCambioNumeracionCifin : TfrmCambioNumeracionCifin;
begin
        frmCambioNumeracionCifin := TfrmCambioNumeracionCifin.Create(Self);
        frmCambioNumeracionCifin.ShowModal;
end;

procedure TfrmMain.Cedulas1Click(Sender: TObject);
var frmCambioPersona : TfrmCambioPersona;
begin
        frmCambioPersona := TfrmCambioPersona.Create(Self);
        frmCambioPersona.ShowModal;
end;

procedure TfrmMain.ConsolidarDatacredito1Click(Sender: TObject);
var frmConsolidarData : TfrmConsolidarData;
begin
        if Agencia = 1 then
          begin
            frmConsolidarData := TfrmConsolidarData.Create(Self);
            frmConsolidarData.ShowModal;
          end
        else
          MessageDlg('Esta Agencia no tiene Permiso para Consolidar Informacion',mtInformation,[mbok],0);
end;

procedure TfrmMain.NovedadesData1Click(Sender: TObject);
begin
        frmNovedadData := TfrmNovedadData.Create(Self);
        frmNovedadData.ShowModal;
end;

procedure TfrmMain.PlanoTraslados1Click(Sender: TObject);
begin
        frmCambioOficina := TfrmCambioOficina.Create(Self);
        frmCambioOficina.ShowModal;
end;

procedure TfrmMain.ImportarDatosOficina1Click(Sender: TObject);
var
   frmImportarDatosOficina: TfrmImportarDatosOficina;
begin
        frmImportarDatosOficina := TfrmImportarDatosOficina.Create(self);
        frmImportarDatosOficina.ShowModal;
end;

end.
