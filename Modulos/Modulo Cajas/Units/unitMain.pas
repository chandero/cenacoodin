unit unitMain;

interface

uses
  Windows, ShellApi, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, DateUtils, IBSQL, DB, DBClient;

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
    MnuOperaciones: TMenuItem;
    CierredelDia1: TMenuItem;
    ProrrogaCaptaciones: TMenuItem;
    InformeDiario1: TMenuItem;
    Informes1: TMenuItem;
    ProcesosEspeciales1: TMenuItem;
    ToolBar1: TToolBar;
    BtnOperaciones: TToolButton;
    ToolButton1: TToolButton;
    BtnInformeDiario: TToolButton;
    BtnArqueo: TToolButton;
    ToolButton2: TToolButton;
    BtnExtracto: TToolButton;
    ToolButton3: TToolButton;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    ArqueoaunaFecha1: TMenuItem;
    BtnCierre: TToolButton;
    ToolButton4: TToolButton;
    IdTime1: TIdTime;
    ChequesEnCaja1: TMenuItem;
    EnviodeChequesaTesoreria1: TMenuItem;
    Comprobantedelda1: TMenuItem;
    Sep: TMenuItem;
    ConfigurarImpresora2: TMenuItem;
    ControldeCobro1: TMenuItem;
    ConsultaExtractoColocacin1: TMenuItem;
    RecuperarTablaLiquidacin1: TMenuItem;
    N4: TMenuItem;
    CambiarContrasea1: TMenuItem;
    Consultas1: TMenuItem;
    N5: TMenuItem;
    ConsultaColocacin1: TMenuItem;
    ResumenCartera1: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;
    Utilidades1: TMenuItem;
    Sumadora1: TMenuItem;
    SaldoenCajas1: TMenuItem;
    IBSQL1: TIBSQL;
    N3: TMenuItem;
    OperacionesIndividualesenEfectivo1: TMenuItem;
    ArqueoConsolidado1: TMenuItem;
    MantenimientodeCajas1: TMenuItem;
    N6: TMenuItem;
    Observaciones1: TMenuItem;
    CalculodeTasas1: TMenuItem;
    InformacindeCrdito1: TMenuItem;
    ConsultaSolicitudes1: TMenuItem;
    N7: TMenuItem;
    ComprobanteSucursal1: TMenuItem;
    InformeDiarioSucursales1: TMenuItem;
    ComprobanteFindeSemana1: TMenuItem;
    IBSQL2: TIBSQL;
    RequerimientosSistemas1: TMenuItem;
    ConsultaExtractoAgencia1: TMenuItem;
    CdFecha: TClientDataSet;
    CdFechaFECHA: TDateField;
    N8: TMenuItem;
    RecuperarUltimaValidacin1: TMenuItem;
    N9: TMenuItem;
    ComprobanteContable1: TMenuItem;
    N10: TMenuItem;
    InformacinTarjeta1: TMenuItem;
    VerTiraSumadora1: TMenuItem;
    InformedeRecaudos1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure ConsultadeGerencia1Click(Sender: TObject);
    procedure ConsultaExtracto1Click(Sender: TObject);
    procedure MnuOperacionesClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BtnExtractoClick(Sender: TObject);
    procedure BtnConsultaPersonaClick(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnOperacionesClick(Sender: TObject);
    procedure InformeDiario1Click(Sender: TObject);
    procedure BtnInformeDiarioClick(Sender: TObject);
    procedure ArqueoaunaFecha1Click(Sender: TObject);
    procedure ChequesEnCaja1Click(Sender: TObject);
    procedure CierredelDia1Click(Sender: TObject);
    procedure BtnCierreClick(Sender: TObject);
    procedure BtnArqueoClick(Sender: TObject);
    procedure EnviodeChequesaTesoreria1Click(Sender: TObject);
    procedure Comprobantedelda1Click(Sender: TObject);
    procedure RecuperarTablaLiquidacin1Click(Sender: TObject);
    procedure ConsultaExtractoColocacin1Click(Sender: TObject);
    procedure ControldeCobro1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure ConsultaColocacin1Click(Sender: TObject);
    procedure ResumenCartera1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure Sumadora1Click(Sender: TObject);
    procedure SaldoenCajas1Click(Sender: TObject);
    procedure OperacionesIndividualesenEfectivo1Click(Sender: TObject);
    procedure ArqueoConsolidado1Click(Sender: TObject);
    procedure MantenimientodeCajas1Click(Sender: TObject);
    procedure Observaciones1Click(Sender: TObject);
    procedure ConsultaSolicitudes1Click(Sender: TObject);
    procedure CalculodeTasas1Click(Sender: TObject);
    procedure InformacindeCrdito1Click(Sender: TObject);
    procedure ComprobanteSucursal1Click(Sender: TObject);
    procedure InformeDiarioSucursales1Click(Sender: TObject);
    procedure ComprobanteFindeSemana1Click(Sender: TObject);
    procedure RequerimientosSistemas1Click(Sender: TObject);
    procedure ConsultaExtractoAgencia1Click(Sender: TObject);
    procedure RecuperarUltimaValidacin1Click(Sender: TObject);
    procedure ComprobanteContable1Click(Sender: TObject);
    procedure InformacinTarjeta1Click(Sender: TObject);
    procedure VerTiraSumadora1Click(Sender: TObject);
    procedure InformedeRecaudos1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    UltimaFecha :TDate;
    PrimeraFecha :TDate;
    TheGraphic: TBitmap;
    FUltimaActividad:TDateTime;
    SiHayCierre :Boolean;
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
    procedure CierreSucursal;
  public
    ruta1 : string;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDateTime;

implementation

{$R *.dfm}

uses {unitdmGeneral,} unitLogin, unitdmColocacion, IniFiles,
     unitConsultaProductos,UnitOperacionesCaja,UnitInformeDiarioCaja,
     unitConsultaExtractoCaptacion, UnitLiquidacionInteresesCaptacion,
     unitInformeArqueoDiarioCaja,unitInformeChequesenCaja, unitCierreDiarioCaja,
     unitChequesenCaja,UnitComprobanteDiarioCaja,
     unitControlCobroCartera,unitrecuperarliquidacioncolocacion,
     unitExtractoColocacion, UnitSumatorias, UnitCambiarContrasena,
     unitConsultaColocacion,UnitResumenColocaciones,UnitRelogin, UnitTesoreria,
     UnitArqueoConsolidado, UnitMantenimientoCajas,
     UnitControldeObservaciones,UnitLiquidacionGral,UnitCalculoTasas,UnitConsultaSol,
     UnitComprobanteSucursal, UnitInformeCajaRemota,
  UnitCambios, UnitExtractoAgencia, UnitOperacionesEfectivo,
  UnitRecuperaValidacion, Unit_Comprobante,UnitConsultaTarjeta,UnitTiraSumadora, UnitInformeRecaudos;

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
//    Role:string;
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
    Agencia  := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    _sServerImagen := ReadString('DBNAME','serverimagen','');    
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',1);
    host_ocana := ReadString('ADICIONALES','host_ocana','0.0.0.0');
    host_abrego := ReadString('ADICIONALES','host_abrego','0.0.0.0');
    host_convencion := ReadString('ADICIONALES','host_convencion','0.0.0.0');
    host_aguachica := ReadString('ADICIONALES','host_aguachica','0.0.0.0');
    puerto_ocana := ReadInteger('ADICIONALES','puerto_ocana',0);
    puerto_abrego := ReadInteger('ADICIONALES','puerto_abrego',0);
    puerto_convencion := ReadInteger('ADICIONALES','puerto_convencion',0);
    puerto_aguachica := ReadInteger('ADICIONALES','puerto_aguachica',0);
//** puerto del consulta server
    PCConvencion := ReadInteger('CONSULTA','pconvencion',0);
    PCAbrego := ReadInteger('CONSULTA','pabrego',0);
    PCOcana := ReadInteger('CONSULTA','pocana',0);
    PCAguachica := ReadInteger('CONSULTA','paguachica',0);
  finally
    free;
  end;
//        IdTime1.Host := DBserver;
//        if IdTime1.Connected then
//           FechaHoy := IdTime1.DateTime;
//        if not IdTime1.SyncTime then
//        begin
  //        SalirMal := True;
    //      Exit;
      //  end;

        control_consulta := True;
        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'CAJAS';
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
          //case
         end; // fin del while
 {if Agencia <> 0 then
    FechaCierre(CdFecha);
 if CdFecha.RecordCount > 0 then
    MessageDlg('ADVERTENCIA!!!. La(s) Fecha(s): ' + vFechaSinCerrar + ' de Cierre de Sucursales se Encuentran Abiertos Favor verifique',mtWarning,[mBOk],0);}
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
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID_CAJA FROM CAJ$CAJAS WHERE ID_EMPLEADO = :ID_EMPLEADO');
    ParamByName('ID_EMPLEADO').AsString := DBAlias;
    try
     ExecQuery;
    except
     Transaction.Rollback;
     raise;
    end;
    _sIdCaja := FieldByName('ID_CAJA').AsInteger;
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
  if Agencia <> 0 then//** validacón de los reportes remotos
  begin
     ComprobanteSucursal1.Visible := True;
     InformeDiarioSucursales1.Visible := True;
     //ComprobanteFindeSemana1.Visible := True;
  end;

  unitglobales.Empleado;
  Timer2.Enabled := True;
  FUltimaActividad := Now;
  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
  ruta1 := Ruta;
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

procedure TfrmMain.MnuOperacionesClick(Sender: TObject);
var frmOperacionesCaja:TfrmOperacionesCaja;
begin
        frmOperacionesCaja:=TfrmOperacionesCaja.Create(Self);
        if not frmOperacionesCaja.ValidarCaja then
        begin
           MessageDlg('Usted no está habilitado para manejar caja',mtError,[mbcancel],0);
           frmOperacionesCaja.Free;
        end
        else
        frmOperacionesCaja.ShowModal;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
       if Not SalirMal then
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
            CanClose := True;
           end;
          end
}
            CanClose := True
        else
            CanClose := False
       else
           begin
            CanClose := True;
           end;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        Self.Caption := 'Módulo Cajas - ' + DBserver;
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

procedure TfrmMain.BtnOperacionesClick(Sender: TObject);
begin
        MnuOperaciones.Click;
end;

procedure TfrmMain.InformeDiario1Click(Sender: TObject);
var frmInformeDiarioCaja:TfrmInformeDiarioCaja;
begin
        frmInformeDiarioCaja := TfrmInformeDiarioCaja.Create(Self);
        with frmInformeDiarioCaja do
         if ValidarCaja then
            ShowModal
         else
            MessageDlg('No Se Puede Acceder a su Caja',mtError,[mbcancel],0);
end;

procedure TfrmMain.BtnInformeDiarioClick(Sender: TObject);
begin
        InformeDiario1.Click;
end;

procedure TfrmMain.ArqueoaunaFecha1Click(Sender: TObject);
var frmInformeArqueoDiarioCaja: TfrmInformeArqueoDiarioCaja;
begin
        frmInformeArqueoDiarioCaja := TfrmInformeArqueoDiarioCaja.Create(Self);
        frmInformeArqueoDiarioCaja.ShowModal;
end;

procedure TfrmMain.ChequesEnCaja1Click(Sender: TObject);
var frmInformeChequesEnCaja:TfrmInformeChequesenCaja;
begin
        frmInformeChequesenCaja := TfrmInformeChequesenCaja.Create(Self);
        frmInformeChequesenCaja.ShowModal;
end;

procedure TfrmMain.CierredelDia1Click(Sender: TObject);
var frmCierreDiarioCaja: TfrmCierreDiarioCaja;
begin
        frmCierreDiarioCaja := TfrmCierreDiarioCaja.Create(Self);
        frmCierreDiarioCaja.ShowModal;
end;

procedure TfrmMain.BtnCierreClick(Sender: TObject);
begin
        CierredelDia1.Click;
end;

procedure TfrmMain.BtnArqueoClick(Sender: TObject);
begin
        ArqueoaunaFecha1.Click;
end;

procedure TfrmMain.EnviodeChequesaTesoreria1Click(Sender: TObject);
var frmChequesenCaja:TfrmChequesenCaja;
begin
     frmChequesenCaja := TfrmChequesenCaja.Create(Self);
     if frmChequesenCaja.ValidarCaja then
        frmChequesenCaja.ShowModal
     else
        begin
           MessageDlg('Usted no está habilitado para Manejar caja',mtError,[mbcancel],0);
           frmChequesenCaja.Free;
        end;
end;

procedure TfrmMain.Comprobantedelda1Click(Sender: TObject);
var frmComprobanteDiario:TfrmComprobanteDiario;
begin
       frmComprobanteDiario:=TfrmComprobanteDiario.Create(Self);
       with frmComprobanteDiario do
         if ValidarCaja then
            ShowModal
         else
            MessageDlg('No Se Puede Acceder a su Caja',mtError,[mbcancel],0);
end;

procedure TfrmMain.RecuperarTablaLiquidacin1Click(Sender: TObject);
var frmRecuperarLiquidacionColocacion:TfrmRecuperarLiquidacionColocacion;
begin
    frmRecuperarLiquidacionColocacion := TfrmRecuperarLiquidacionColocacion.Create(Self);
    frmRecuperarLiquidacionColocacion.ShowModal;
end;

procedure TfrmMain.ConsultaExtractoColocacin1Click(Sender: TObject);
var FrmExtractoColocacion:TFrmExtractoColocacion;
begin
    FrmExtractoColocacion := TFrmExtractoColocacion.Create(Self);
    FrmExtractoColocacion.ShowModal;
end;

procedure TfrmMain.ControldeCobro1Click(Sender: TObject);
var frmControlCobroCartera: TfrmControlCobroCartera;
begin
         frmControlCobroCartera:= TfrmControlCobroCartera.Create(Self);
         frmControlCobroCartera.Show;
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena:TfrmCambiarContrasena;
begin
     frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
     frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.ConsultaColocacin1Click(Sender: TObject);
var frmConsultaColocacion:TfrmConsultaColocacion;
begin
        frmConsultaColocacion := TfrmConsultaColocacion.Create(Self);
        frmConsultaColocacion.ShowModal;
end;

procedure TfrmMain.ResumenCartera1Click(Sender: TObject);
var frmResumenColocaciones:TfrmResumenColocaciones;
begin
    frmResumenColocaciones := TfrmResumenColocaciones.Create(Self);
    frmResumenColocaciones.ShowModal;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
A,M,D,H,Min,S,MSeg:Word;
AA,MM,DD,HH,MMin,SS,MMSeg:Word;
begin
      try
        DecodeDateTime(FechaHora,A,M,D,H,Min,S,MSeg);
        DecodeDateTime(Date,AA,MM,DD,HH,MMin,SS,MMSeg);
        if (M-MM) > 5 then
         begin
           SalirMal := True;
           Close;
         end;
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

procedure tfrmmain.AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of
    WM_KEYFIRST..WM_KEYLAST,
    WM_LBUTTONDOWN..WM_MOUSELAST: FUltimaActividad := Now;
  end;
end;


procedure TfrmMain.Sumadora1Click(Sender: TObject);
var Sumadora:string;
    Parametros : string;
begin
//  Parametros :=  FormatCurr('00',_sIdCaja) + '_' + DBAlias;
//  ShellExecute(self.Handle, 'open', PChar(ruta1+'\sumadora.exe'),Pchar(Parametros), '' ,SW_NORMAL);
        Sumadora := ruta1 + 'sumadora.exe';
        ShellExecute(Handle,nil,PChar(Sumadora),nil,nil,SW_SHOWNORMAL);
end;

procedure TfrmMain.SaldoenCajas1Click(Sender: TObject);
var Frmtesoreria:TFrmtesoreria;
begin
        if ValidarOpcion(TMenu(Sender).Tag) then begin
           Frmtesoreria:=TFrmtesoreria.Create(Self);
           Frmtesoreria.ShowModal;
        end;
end;

procedure TfrmMain.OperacionesIndividualesenEfectivo1Click(
  Sender: TObject);
begin
        if ValidarOpcion(TMenuItem(Sender).Tag) then begin
           frmOperacionesEfectivo := TfrmOperacionesEfectivo.Create(Self);
           frmOperacionesEfectivo.ShowModal;
        end;
end;

procedure TfrmMain.ArqueoConsolidado1Click(Sender: TObject);
var frmArqueoConsolidado:TfrmArqueoConsolidado;
begin
       if ValidarOpcion(TMenuItem(Sender).Tag) then begin
            frmArqueoConsolidado := TfrmArqueoConsolidado.Create(Self);
            frmArqueoConsolidado.ShowModal;
       end;
end;

procedure TfrmMain.MantenimientodeCajas1Click(Sender: TObject);
var frmMantenimientoCajas:TfrmMantenimientoCajas;
begin
        if ValidarOpcion(TMenuItem(Sender).Tag) then begin
           frmMantenimientoCajas:=TfrmMantenimientoCajas.Create(Self);
           frmMantenimientoCajas.ShowModal;
        end;
end;

procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones:TfrmControldeObservaciones;
begin
    frmControldeObservaciones := TfrmControldeObservaciones.Create(Self);
    frmControldeObservaciones.ShowModal;
end;

procedure TfrmMain.ConsultaSolicitudes1Click(Sender: TObject);
var frmConsultasol:TFrmConsultaSol;
begin
   frmConsultaSol := TFrmConsultaSol.Create(Self);
   frmConsultaSol.ShowModal;
end;

procedure TfrmMain.CalculodeTasas1Click(Sender: TObject);
var frmCalculoTasas:TfrmCalculoTasas;
begin
   frmCalculoTasas := TfrmCalculoTasas.Create(Self);
   frmCalculoTasas.ShowModal;
end;

procedure TfrmMain.InformacindeCrdito1Click(Sender: TObject);
var frmLiquidacionGral:TfrmLiquidacionGral;
begin
  frmLiquidacionGral := TfrmLiquidacionGral.Create(Self);
  frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.ComprobanteSucursal1Click(Sender: TObject);
begin
        if (ValidaHoraCaja.Estado) or (ValidaHoraCaja.Hora = 0) then
        begin
           if ValidaHoraCaja.Hora <> 0 then
              MessageDlg('La Nota Referente a las Sucursales, los Dias ' + FormatDateTime('dddd',fFechaActual) + #13 + 'Solo se puede Generar despues de las ' + FormatDateTime('hh:mm:ss AM/PM',validahoracaja.Hora),mtInformation,[mbok],0)
           else
              MessageDlg('El Dia ' + FormatDateTime('dddd',fFechaActual) + ' No se Genera Nota de Sucursales',mtInformation,[mbok],0);
           Exit;
        end;
        CierreSucursal;        
        FrmComprobanteSucursal := TFrmComprobanteSucursal.Create(self);
        FrmComprobanteSucursal.EdFecha.DateTime := fFechaActual;
        FrmComprobanteSucursal.ShowModal;
end;
procedure TfrmMain.InformeDiarioSucursales1Click(Sender: TObject);
begin
        FrmInformeCajaRemota := TFrmInformeCajaRemota.Create(Self);
        FrmInformeCajaRemota.ShowModal
end;

procedure TfrmMain.CierreSucursal;
var     Id_Remoto :Integer;
begin
        SiHayCierre := True;
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 18');
          ExecQuery;
          Id_Remoto := IBSQL1.FieldByName('VALOR_MINIMO').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('select max(FECHA) as FECHA from "caj$cierresucursal" where CONTABILIZADO = 1');
          ExecQuery;
          if fFechaActual = FieldByName('FECHA').AsDate then
          begin
            SiHayCierre := False;
            Exit;
          end;
          UltimaFecha := FieldByName('FECHA').AsDate + 1;
          PrimeraFecha := UltimaFecha;
          if UltimaFecha = fFechaActual then
          begin
            SiHayCierre := False;
            Exit;
          end;

          while UltimaFecha < fFechaActual do
          begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"caj$movremotoentrada".NUMERO_CUENTA');
            SQL.Add('FROM');
            SQL.Add('"caj$movremotoentrada"');
            SQL.Add('WHERE');
            SQL.Add('("caj$movremotoentrada".FECHA_MOV BETWEEN :FECHA1 AND :FECHA2)');
            ParamByName('FECHA1').AsDateTime := UltimaFecha + StrToTime('00:00:00');
            ParamByName('FECHA2').AsDateTime := UltimaFecha + StrToTime('23:59:59');
            ExecQuery;
            if RecordCount <> 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add('select * from "caj$cierresucursal" where ID_CAJA = :ID_CAJA and FECHA = :FECHA');
              ParamByName('ID_CAJA').AsInteger := Id_Remoto;
              ParamByName('FECHA').AsDate := UltimaFecha;
              ExecQuery;
              if RecordCount = 0 then
              begin
                try
                  Close;
                  SQL.Clear;
                  SQL.Add('insert into "caj$cierresucursal" values (:ID_CAJA,:FECHA,:CONTABILIZADO,:ES_MOVIMIENTO)');
                  ParamByName('ID_CAJA').AsInteger := Id_Remoto;
                  ParamByName('FECHA').AsDate := UltimaFecha;
                  ParamByName('CONTABILIZADO').AsInteger := 0;
                  ParamByName('ES_MOVIMIENTO').AsInteger := 1;
                  ExecQuery;
                except
                  Close;
                end;
              end;
            end
            else
            begin
              Close;
              sql.Clear;
              SQL.Add('delete from "caj$cierresucursal" where ID_CAJA = :ID_CAJA and FECHA = :FECHA');
              ParamByName('ID_CAJA').AsInteger := Id_Remoto;
              ParamByName('FECHA').AsDate := UltimaFecha;
              ExecQuery;
              Transaction.CommitRetaining;
              Close;
              SQL.Clear;
              SQL.Add('insert into "caj$cierresucursal" values (:ID_CAJA,:FECHA,:CONTABILIZADO,:ES_MOVIMIENTO)');
              ParamByName('ID_CAJA').AsInteger := Id_Remoto;
              ParamByName('FECHA').AsDate := UltimaFecha;
              ParamByName('CONTABILIZADO').AsInteger := 0;
              ParamByName('ES_MOVIMIENTO').AsInteger := 0;
              ExecQuery;
            end;
            Transaction.Commit;
            UltimaFecha := UltimaFecha + 1;
          end;

        end;

end;

procedure TfrmMain.ComprobanteFindeSemana1Click(Sender: TObject);
begin
        if EvaluarFecha then
        begin
          FrmComprobanteSucursal := TFrmComprobanteSucursal.Create(self);
          FrmComprobanteSucursal.FechaCierre := PrimeraFecha;
          FrmComprobanteSucursal.EdFecha.MaxDate := fFechaActual-1;
          FrmComprobanteSucursal.EdFecha.MinDate := vFechaInicial;
          FrmComprobanteSucursal.ShowModal;
        end
        else
          MessageDlg('La Nota no puede ser Generada, Favor Comuniquese con Sitemas',mtWarning,[mbok],0);

end;

procedure TfrmMain.RequerimientosSistemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

procedure TfrmMain.ConsultaExtractoAgencia1Click(Sender: TObject);
begin
        FrmExtractoAgencia := TFrmExtractoAgencia.Create(Self);
        FrmExtractoAgencia.ShowModal
end;

procedure TfrmMain.RecuperarUltimaValidacin1Click(Sender: TObject);
begin
        FrmRecuperaValidacion := TFrmRecuperaValidacion.Create(Self);
        FrmRecuperaValidacion.ShowModal; 
end;

procedure TfrmMain.ComprobanteContable1Click(Sender: TObject);
begin
       frmcomprobante := tfrmcomprobante.Create(Self);
       frmcomprobante.ShowModal;

end;

procedure TfrmMain.InformacinTarjeta1Click(Sender: TObject);
var
        frm :TFrmConsultaTarjeta;
begin
        frm := TFrmConsultaTarjeta.Create(Self);
        frm.ShowModal;
end;

procedure TfrmMain.VerTiraSumadora1Click(Sender: TObject);
var
        frm :TFrmTiraSumadora;
begin
        frm := TFrmTiraSumadora.Create(Self);
        frm.ShowModal;
end;

procedure TfrmMain.InformedeRecaudos1Click(Sender: TObject);
var
  frmInformeRecaudo: TfrmInformeRecaudo;
begin
  frmInformeRecaudo := TfrmInformeRecaudo.Create(self);
  frmInformeRecaudo.ShowModal;
end;

end.
