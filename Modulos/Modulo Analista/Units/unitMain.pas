unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, DateUtils, IBSQL;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    ImageList: TImageList;
    PrinterSetupDialog: TPrinterSetupDialog;
    ActionList: TActionList;
    Mnu01: TMenuItem;
    ConfigurarImpresora1: TMenuItem;
    N1: TMenuItem;
    SalirdePSI1: TMenuItem;
    Configurar_Impresora: TAction;
    N2: TMenuItem;
    InformesGerenciales1: TMenuItem;
    ConsultadeGerencia1: TMenuItem;
    ConsultaExtracto1: TMenuItem;
    Informes1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    BtnExtracto: TToolButton;
    ToolButton3: TToolButton;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    IdTime1: TIdTime;
    ConsultaExtractoColocacin1: TMenuItem;
    ConsultaControlCobro1: TMenuItem;
    BtnExtractoCol: TToolButton;
    Procesos1: TMenuItem;
    ConsultaColocacin1: TMenuItem;
    CambiarContrasea1: TMenuItem;
    N3: TMenuItem;
    Gestiones1: TMenuItem;
    ConsultaDirecciones1: TMenuItem;
    Informes2: TMenuItem;
    AsociadosporMunicipio1: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;
    N4: TMenuItem;
    Observaciones1: TMenuItem;
    AnalisisdeSolicitudes1: TMenuItem;
    ConsultadeSolicitudes1: TMenuItem;
    InformeCrditos1: TMenuItem;
    N5: TMenuItem;
    EvaluacindeColocaciones1: TMenuItem;
    ObservacinAnalista1: TMenuItem;
    N6: TMenuItem;
    AnalisisOficinas1: TMenuItem;
    IBSQL1: TIBSQL;
    RegistroSolicitudes1: TMenuItem;
    Utilidades1: TMenuItem;
    InformacindeCrditos1: TMenuItem;
    RegistroSolicitudesOficinas1: TMenuItem;
    rasladoSolicitud1: TMenuItem;
    Pruebas1: TMenuItem;
    h1: TMenuItem;
    RequerimientosSistemas1: TMenuItem;
    C1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure ConsultadeGerencia1Click(Sender: TObject);
    procedure ConsultaExtracto1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BtnExtractoClick(Sender: TObject);
    procedure BtnConsultaPersonaClick(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure ConsultaControlCobro1Click(Sender: TObject);
    procedure ConsultaExtractoColocacin1Click(Sender: TObject);
    procedure BtnExtractoColClick(Sender: TObject);
    procedure ConsultaColocacin1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure ConsultaDirecciones1Click(Sender: TObject);
    procedure AsociadosporMunicipio1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Observaciones1Click(Sender: TObject);
    procedure AnalisisdeSolicitudes1Click(Sender: TObject);
    procedure ConsultadeSolicitudes1Click(Sender: TObject);
    procedure InformeCrditos1Click(Sender: TObject);
    procedure EvaluacindeColocaciones1Click(Sender: TObject);
    procedure ObservacinAnalista1Click(Sender: TObject);
    procedure AnalisisOficinas1Click(Sender: TObject);
    procedure RegistroSolicitudes1Click(Sender: TObject);
    procedure InformacindeCrditos1Click(Sender: TObject);
    procedure RegistroSolicitudesOficinas1Click(Sender: TObject);
    procedure rasladoSolicitud1Click(Sender: TObject);
    procedure h1Click(Sender: TObject);
    procedure RequerimientosSistemas1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
    FUltimaActividad:TDateTime;    
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
  public
  wpath :string;
  ruta1 :string;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDate;

implementation

{$R *.dfm}

uses unitLogin, IniFiles,
     unitConsultaProductos,unitConsultaExtractoCaptacion,
     unitControlCobroCartera, UnitExtractoColocacion,
     unitConsultaColocacion, unitCambiarContrasena,
     UnitBuscarDirecciones, UnitInformeAsociadosporMunicipio,
     UnitReLogin,UnitControldeObservaciones, UnitAnalisiscre,
     UnitConsultaSol, UnitComCreditos, UnitEvaluacion,
     UnitObservacionAnalisis, UnitAnalisisOficina, UnitRegistroSolicitudes,
     UnitLiquidacionGral, UnitRegistroSolAgencia, UnitTrasaldoSolicitud,
  UnitHabilitaFianza, UnitCambios, UnitConsultaProductosAg;

procedure TfrmMain.Configurar_ImpresoraExecute(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var frmLogin:TfrmLogin;
    frmCambiarContrasena:TfrmCambiarContrasena;
    Veces :SmallInt;
    Mensaje :String;
    Ruta:string;
    //Role:string;
    Dias:Integer;
    Ufecha,Hoy:TDate;

//    frmConectando:TfrmConectando;
begin
  Application.OnMessage := AtraparMensajes;
  Timer2.Enabled := False;

  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.1.8');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    _sServerImagen := ReadString('DBNAME','serverimagen','');    
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',1);
    host_abrego := ReadString('ADICIONALES','host_abrego','0.0.0.0');
    host_convencion := ReadString('ADICIONALES','host_convencion','0.0.0.0');
    puerto_abrego := ReadInteger('ADICIONALES','puerto_abrego',0);
    puerto_convencion := ReadInteger('ADICIONALES','puerto_convencion',0);
    puerto_aguachica := ReadInteger('ADICIONALES','puerto_aguachica',0);
    host_aguachica := ReadString('ADICIONALES','host_aguachica','0.0.0.0');    
  finally
    free;
  end;
        IdTime1.Host := DBserver;
        if IdTime1.Connected then
           FechaHoy := IdTime1.DateTime;
        if not IdTime1.SyncTime then
        begin
          SalirMal := True;
          Exit;
        end;

        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'ANALISTA';
        dmGeneral.IBDatabase1.Connected := false;
        while Not dmGeneral.IBDatabase1.Connected do
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
             Exit;
          end;
         end; // fin del while

  with IBSQL1 do begin
    if Transaction.InTransaction then
       Transaction.Rollback;
    Transaction.StartTransaction;
    Close;
    SQL.Clear;
    SQL.Add('select * from "gen$minimos" where ID_MINIMO = 11');
    try
     ExecQuery;
    except
     Transaction.Rollback;
     raise;
    end;
    Dias := FieldByName('VALOR_MINIMO').AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('select ULTIMO_CAMBIO_PASABORDO from "gen$empleado"');
    SQL.Add('where ID_EMPLEADO = :ID_EMPLEADO');
    ParamByName('ID_EMPLEADO').AsString := DBAlias;
    try
     ExecQuery;
    except
     Transaction.Rollback;   
     raise;
    end;

    Ufecha := FieldByName('ULTIMO_CAMBIO_PASABORDO').AsDate;
    Transaction.Commit;
  end;

  Ufecha := IncDay(Ufecha,Dias);
  Hoy:= fFechaActual;

  if Ufecha < Hoy then
  begin
   frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
   while not frmCambiarContrasena.Bien do
   begin
       frmCambiarContrasena.ShowModal;
   end;
  end;
         

  FUltimaActividad := Now;
  Timer2.Enabled := True;

  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
  wpath := Ruta;
  ruta1 := wpath;
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{       if Not SalirMal then
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
            dmGeneral.IBDatabase1.Connected := False;
            dmGeneral.IBTransaction1.Active  := False;
            dmGeneral.Free;
            Action:= caFree;
           end;}
           Action := caFree;
end;

procedure TfrmMain.ConfigurarImpresora1Click(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;



procedure TfrmMain.SalirdePSI1Click(Sender: TObject);
begin
        Close;
end;


procedure TfrmMain.ConsultadeGerencia1Click(Sender: TObject);
var frmConsultaProductos:TfrmConsultaProductos;
begin
       frmConsultaProductos := TfrmConsultaProductos.Create(Self);
       frmConsultaProductos.ShowModal;
end;


procedure TfrmMain.ConsultaExtracto1Click(Sender: TObject);
var frmConsultaExtractoCaptacion:TfrmConsultaExtractoCaptacion;
begin
        frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
        frmConsultaExtractoCaptacion.ShowModal;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar SIFCOOPSERVIR',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
        { with TIniFile.Create(MiINI) do
          try
            WriteString('DBNAME','server',DBserver);
            WriteString('DBNAME','path',DBpath);
            WriteString('DBNAME','name',DBname);
            WriteString('EMPRESA','name',Empresa);
            WriteString('EMPRESA','nit',Nit);
            WriteInteger('EMPRESA','Agencia',Agencia);
            WriteString('EMPRESA','city',Ciudad);
          finally   }
           begin
            dmGeneral.IBDatabase1.Connected := False;
            dmGeneral.IBTransaction1.Active  := False;
            dmGeneral.Free;
            CanClose := True;
          end
        else
            CanClose := False
       else
           begin
            CanClose := True;
           end;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        Self.Caption := 'Módulo Analista - ' + DBserver;
        if SalirMal then
           Self.Close;
end;


procedure TfrmMain.BtnExtractoClick(Sender: TObject);
begin
        ConsultaExtracto1.Click;
end;

procedure TfrmMain.BtnConsultaPersonaClick(Sender: TObject);
begin
        ConsultadeGerencia1.Click;
end;

procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        SalirdePSI1.Click;
end;

procedure TfrmMain.ConsultaControlCobro1Click(Sender: TObject);
var frmControlCobroCartera:TfrmControlCobroCartera;
begin
        frmControlCobroCartera := TfrmControlCobroCartera.Create(Self);
        frmControlCobroCartera.Show;
end;

procedure TfrmMain.ConsultaExtractoColocacin1Click(Sender: TObject);
var FrmExtractoColocacion:TFrmExtractoColocacion;
begin
      FrmExtractoColocacion := TFrmExtractoColocacion.Create(Self);
      FrmExtractoColocacion.ShowModal;
end;

procedure TfrmMain.BtnExtractoColClick(Sender: TObject);
begin
        ConsultaExtractoColocacin1.Click;
end;

procedure TfrmMain.ConsultaColocacin1Click(Sender: TObject);
var frmConsultaColocacion:tfrmconsultacolocacion;
begin
        frmConsultaColocacion := TfrmConsultaColocacion.Create(Self);
        frmConsultaColocacion.ShowModal;
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena:tfrmcambiarcontrasena;
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.ConsultaDirecciones1Click(Sender: TObject);
var frmBuscarDirecciones : tfrmBuscarDirecciones;
begin
        frmBuscarDirecciones := TfrmBuscarDirecciones.Create(Self);
        frmBuscarDirecciones.ShowModal;

end;

procedure TfrmMain.AsociadosporMunicipio1Click(Sender: TObject);
var frmInformeAsociadosporMunicipio : TfrmInformeAsociadosporMunicipio;
begin
        frmInformeAsociadosporMunicipio := TfrmInformeAsociadosporMunicipio.Create(Self);
        frmInformeAsociadosporMunicipio.ShowModal;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
      try
        IdTime1.Host := DBserver;
        IdTime1.SyncTime;
        IdTime1.DateTime;
      finally
        IdTime1.Disconnect;
      end;
end;

procedure TfrmMain.Timer2Timer(Sender: TObject);
var frmReLogin:TfrmReLogin;
    Pasabordo :string;
    ESPERA:Extended;
begin
  Timer2.Enabled := False;
  ESPERA := ((1 / 24 / 60) * DBMinutos);
  if (FUltimaActividad + ESPERA) < Now then begin
    frmReLogin := TfrmReLogin.Create(Self);
    if frmReLogin.ShowModal = mrOk then
    begin
     Pasabordo := frmReLogin.EdPasabordo.Text;
     if Pasabordo <> DBPasabordo then
      begin
        ShowMessage('Confirmación no valida!, Cerrando el Módulo');
        SalirMal := True;
        Close;
        Exit;
      end;
    end
    else
    begin
        SalirMal := True;
        Close;
        Exit;
    end;
  end;
  Timer2.Enabled := True;

end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
        FechaHora := Date;
end;

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
        FechaHora := Date;
end;

procedure tfrmmain.AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of
    WM_KEYFIRST..WM_KEYLAST,
    WM_LBUTTONDOWN..WM_MOUSELAST: FUltimaActividad := Now;
  end;
end;

procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones:TfrmControldeObservaciones;
begin
        frmControldeObservaciones := TfrmControldeObservaciones.Create(Self);
        frmControldeObservaciones.ShowModal;
end;

procedure TfrmMain.AnalisisdeSolicitudes1Click(Sender: TObject);
begin
        FrmAnalisiscre := TFrmAnalisiscre.Create(self);
        FrmAnalisiscre.Es_Analista := True;
        FrmAnalisiscre.ShowModal;
end;

procedure TfrmMain.ConsultadeSolicitudes1Click(Sender: TObject);
begin
        FrmConsultaSol := TFrmConsultaSol.Create(self);
        FrmConsultaSol.ShowModal;
end;

procedure TfrmMain.InformeCrditos1Click(Sender: TObject);
begin
        FrmComCreditos := TFrmComCreditos.Create(self);
        FrmComCreditos.ShowModal;
end;

procedure TfrmMain.EvaluacindeColocaciones1Click(Sender: TObject);
var frmEvaluacion : TfrmEvaluacion;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then begin
           frmEvaluacion := tfrmevaluacion.Create(Self);
           frmEvaluacion.ShowModal;
        end;

end;

procedure TfrmMain.ObservacinAnalista1Click(Sender: TObject);
begin
        FrmObservacionAnalisis := TFrmObservacionAnalisis.Create(self);
        FrmObservacionAnalisis.ShowModal;
end;

procedure TfrmMain.AnalisisOficinas1Click(Sender: TObject);
begin
        if Agencia = 1 then
        begin
          FrmAnalisisOficina := TFrmAnalisisOficina.Create(self);
          FrmAnalisisOficina.ShowModal;
        end
end;


procedure TfrmMain.RegistroSolicitudes1Click(Sender: TObject);
begin
        FrmRegistroSolicitud := TFrmRegistroSolicitud.Create(self);
        FrmRegistroSolicitud.ShowModal;
end;

procedure TfrmMain.InformacindeCrditos1Click(Sender: TObject);
var frmLiquidacionGral : TfrmLiquidacionGral;
begin
        frmLiquidacionGral := TfrmLiquidacionGral.Create(Self);
        frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.RegistroSolicitudesOficinas1Click(Sender: TObject);
begin
        FrmRegistroSolAgencia := TFrmRegistroSolAgencia.Create(self);
        FrmRegistroSolAgencia.ShowModal;
end;

procedure TfrmMain.rasladoSolicitud1Click(Sender: TObject);
begin
        FrmTrasladoSolicitud := TFrmTrasladoSolicitud.Create(self);
        Empleado;
        FrmTrasladoSolicitud.JVanalista.Caption := unitglobales.Nombres + ' ' + unitglobales.Apellidos;
        FrmTrasladoSolicitud.ShowModal;
end;

procedure TfrmMain.h1Click(Sender: TObject);
begin
        FrmHabilitaFianza := TFrmHabilitaFianza.Create(Self);
        FrmHabilitaFianza.ShowModal;
end;

procedure TfrmMain.RequerimientosSistemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

procedure TfrmMain.C1Click(Sender: TObject);
begin
        frmConsultaProductosAg := TfrmConsultaProductosAg.Create(Self);
        frmConsultaProductosAg.ShowModal;
end;

end.
