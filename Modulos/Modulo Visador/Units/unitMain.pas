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
    BtnExtracto: TToolButton;
    ToolButton3: TToolButton;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    IdTime1: TIdTime;
    Visados1: TMenuItem;
    VisadodeColocacin1: TMenuItem;
    ConsultaExtractoColocaciones1: TMenuItem;
    Consultas1: TMenuItem;
    Colocaciones1: TMenuItem;
    Procesis1: TMenuItem;
    CalculodeTasas1: TMenuItem;
    ConsultaLiquidacinColocacin1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    CambiarContrasea1: TMenuItem;
    Gestiones1: TMenuItem;
    ControldeCobro1: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;
    N3: TMenuItem;
    Observaciones1: TMenuItem;
    ConsultaAuxiliares1: TMenuItem;
    DeduccionesAseguradora1: TMenuItem;
    ColocacionesParametrizado1: TMenuItem;
    SaldosCajas1: TMenuItem;
    OperacionesAcumuladas1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    OperacionesEfectivo1: TMenuItem;
    VisadoDesembolsoNuevo1: TMenuItem;
    IBSQL1: TIBSQL;
    InformacindeCrditos1: TMenuItem;
    ConsultadeSolicitudes1: TMenuItem;
    RequerimientoSistemas1: TMenuItem;
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
    procedure odas1Click(Sender: TObject);
    procedure VisadodeColocacin1Click(Sender: TObject);
    procedure ConsultaExtractoColocaciones1Click(Sender: TObject);
    procedure ConsultaLiquidacinColocacin1Click(Sender: TObject);
    procedure Colocaciones1Click(Sender: TObject);
    procedure CalculodeTasas1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure ControldeCobro1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure Observaciones1Click(Sender: TObject);
    procedure ConsultaAuxiliares1Click(Sender: TObject);
    procedure DeduccionesAseguradora1Click(Sender: TObject);
    procedure ColocacionesParametrizado1Click(Sender: TObject);
    procedure SaldosCajas1Click(Sender: TObject);
    procedure OperacionesAcumuladas1Click(Sender: TObject);
    procedure OperacionesEfectivo1Click(Sender: TObject);
    procedure VisadoDesembolsoNuevo1Click(Sender: TObject);
    procedure InformacindeCrditos1Click(Sender: TObject);
    procedure ConsultadeSolicitudes1Click(Sender: TObject);
    procedure RequerimientoSistemas1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
    FUltimaActividad:TDateTime;
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
  public
  ruta1 :string;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDateTime;

implementation

{$R *.dfm}

uses unitLogin, unitdmColocacion, IniFiles,
     unitConsultaProductos,unitConsultaExtractoCaptacion,
     UnitSumatorias,UnitCalculoTasas,
     UnitExtractoColocacion, UnitRecuperarLiquidacionColocacion,
     UnitConsultaColocacion, UnitCambiarContrasena, UnitControlCobroCartera,
     UnitObservacionesCambioEstado, UnitAgregarObservacion, UnitRelogin,
     UnitControldeObservaciones, UnitInformeAuxiliar,
     UnitInformeAseguradoraCartera, UnitInformeColocacionFiltrado,
     Unittesoreria, UnitOperacionesAcumulada, UnitOperacionesEfectivo, UnitVisarDesembolso,
     UnitconsultaSol, UnitLiquidacionGral, UnitCambios;

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
    Role:string;
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
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',1);
    host_equivida := ReadString('ADICIONALES','host_equivida','192.168.200.6');
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

        control_consulta := True;
        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'VISADOR';
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
  DecimalSeparator := '.';
  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
  ruta1 := Ruta;
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar el Módulo',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
{
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
           end
        else
            Action := caNone
       else
           begin
            dmGeneral.IBDatabase1.Connected := False;
            dmGeneral.IBTransaction1.Active  := False;
            dmGeneral.Free;
            Action:= caFree;
           end;
           Action := caFree;      }
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
        if MessageDlg('Seguro que desea cerrar SIFCREDISERVIR',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
         {with TIniFile.Create(MiINI) do
          try
            WriteString('DBNAME','server',DBserver);
            WriteString('DBNAME','path',DBpath);
            WriteString('DBNAME','name',DBname);
            WriteString('EMPRESA','name',Empresa);
            WriteString('EMPRESA','nit',Nit);
            WriteInteger('EMPRESA','Agencia',Agencia);
            WriteString('EMPRESA','city',Ciudad);
          finally }
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
        if SalirMal then
           Self.Close;
        Empleado;
        Self.Caption := 'Módulo Visación - ' + DBserver;
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


procedure TfrmMain.odas1Click(Sender: TObject);
var frmSumatorias:TfrmSumatorias;
begin
    frmSumatorias := TfrmSumatorias.Create(Self);
    frmSumatorias.ShowModal;
end;

procedure TfrmMain.VisadodeColocacin1Click(Sender: TObject);
begin
//        frmVisarColocacion:=TfrmVisarColocacion.Create(Self);
//        frmVisarcolocacion.ShowModal;
        frmvisardesembolso := tfrmvisardesembolso.Create(Self);
        frmVisarDesembolso.es_creditos := False;
        frmvisardesembolso.ShowModal;
end;

procedure TfrmMain.ConsultaExtractoColocaciones1Click(Sender: TObject);
var frmExtractoColocacion:TFrmExtractoColocacion;
begin
        frmextractocolocacion := TFrmExtractoColocacion.Create(Self);
        frmextractocolocacion.ShowModal;
end;

procedure TfrmMain.ConsultaLiquidacinColocacin1Click(Sender: TObject);
var frmRecuperarLiquidacionColocacion:TfrmRecuperarLiquidacionColocacion;
begin
      frmRecuperarLiquidacionColocacion:=TfrmRecuperarLiquidacionColocacion.Create(Self);
      frmRecuperarLiquidacionColocacion.ShowModal;
end;

procedure TfrmMain.Colocaciones1Click(Sender: TObject);
var frmConsultaColocacion:TfrmConsultaColocacion;
begin
    frmConsultaColocacion := TfrmConsultaColocacion.Create(Self);
    frmConsultaColocacion.ShowModal;
end;

procedure TfrmMain.CalculodeTasas1Click(Sender: TObject);
var frmcalculotasas : TfrmCalculoTasas;
begin
        frmcalculotasas := TfrmCalculoTasas.Create(self);
        frmcalculotasas.ShowModal;
end;

procedure TfrmMain.ToolButton1Click(Sender: TObject);
begin
        VisadodeColocacin1.Click;
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena:TfrmCambiarContrasena;
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.ControldeCobro1Click(Sender: TObject);
var frmControlCobroCartera:TfrmControlCobroCartera;
begin
        frmControlCobroCartera := tfrmcontrolcobrocartera.Create(Self);
        frmcontrolcobrocartera.ShowModal;
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

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
        FechaHora := Date;
end;

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
        FechaHora := Date;
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

procedure TfrmMain.AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of
    WM_KEYFIRST..WM_KEYLAST,
    WM_LBUTTONDOWN..WM_MOUSELAST: FUltimaActividad := Now;
  end;
end;

procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones:TfrmControldeObservaciones;
begin
     frmControldeObservaciones :=TfrmControldeObservaciones.Create(Self);
     frmControldeObservaciones.ShowModal;
end;

procedure TfrmMain.ConsultaAuxiliares1Click(Sender: TObject);
var frmInformeAuxiliares : TfrmInformeAuxiliares;
begin
        frmInformeAuxiliares := TfrmInformeAuxiliares.Create(Self);
        frmInformeAuxiliares.ShowModal;
end;

procedure TfrmMain.DeduccionesAseguradora1Click(Sender: TObject);
var frmInformeAseguradoraCartera : TfrmInformeAseguradoraCartera;
begin
        frmInformeAseguradoraCartera := TfrmInformeAseguradoraCartera.Create(Self);
        frmInformeAseguradoraCartera.ShowModal;
end;

procedure TfrmMain.ColocacionesParametrizado1Click(Sender: TObject);
var  frmInformeColocacionesFiltrado : TfrmInformeColocacionesFiltrado;
begin
        frmInformeColocacionesFiltrado := TfrmInformeColocacionesFiltrado.Create(Self);
        frmInformeColocacionesFiltrado.ShowModal;
end;

procedure TfrmMain.SaldosCajas1Click(Sender: TObject);
var Frmtesoreria : TFrmtesoreria;
begin
        Frmtesoreria := TFrmtesoreria.Create(Self);
        Frmtesoreria.ShowModal;
end;

procedure TfrmMain.OperacionesAcumuladas1Click(Sender: TObject);
var frmOperacionesAcumuladas : TfrmOperacionesAcumuladas;
begin
        frmOperacionesAcumuladas := TfrmOperacionesAcumuladas.Create(Self);
        frmOperacionesAcumuladas.ShowModal;
end;

procedure TfrmMain.OperacionesEfectivo1Click(Sender: TObject);
var frmOperacionesEfectivo : TfrmOperacionesEfectivo;
begin
        frmOperacionesEfectivo := TfrmOperacionesEfectivo.Create(Self);
        frmOperacionesEfectivo.ShowModal;
end;

procedure TfrmMain.VisadoDesembolsoNuevo1Click(Sender: TObject);
var frmVisarDesembolso : TfrmVisarDesembolso;
begin
        frmvisardesembolso := tfrmvisardesembolso.Create(Self);
        frmVisarDesembolso.es_creditos := False;
        frmvisardesembolso.ShowModal;
end;

procedure TfrmMain.InformacindeCrditos1Click(Sender: TObject);
var frmLiquidacionGral : TfrmLiquidacionGral;
begin
        frmLiquidacionGral := TfrmLiquidacionGral.Create(Self);
        frmliquidaciongral.ShowModal;
end;

procedure TfrmMain.ConsultadeSolicitudes1Click(Sender: TObject);
var frmConsultaSol : TFrmConsultaSol;
begin
        frmConsultasol := TFrmConsultaSol.Create(Self);
        frmconsultasol.ShowModal;
end;

procedure TfrmMain.RequerimientoSistemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

end.
