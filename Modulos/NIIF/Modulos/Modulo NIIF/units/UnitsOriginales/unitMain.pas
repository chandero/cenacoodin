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
    MnuComprobantes: TMenuItem;
    Informes1: TMenuItem;
    ProcesosEspeciales1: TMenuItem;
    ToolBar1: TToolBar;
    BtnComprobante: TToolButton;
    ToolButton2: TToolButton;
    BtnExtracto: TToolButton;
    ToolButton3: TToolButton;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    IdTime1: TIdTime;
    MantenimientodelPUC1: TMenuItem;
    N3: TMenuItem;
    CierredelDa1: TMenuItem;
    MayoryBalance1: TMenuItem;
    BalanceGeneralDetallado1: TMenuItem;
    EstadodeIngresosyGastos1: TMenuItem;
    InformeCajaDiario1: TMenuItem;
    LibrosAuxiliares1: TMenuItem;
    EvaluacinPresupuestal1: TMenuItem;
    ListadodePrueba1: TMenuItem;
    N4: TMenuItem;
    PlanillaResumen1: TMenuItem;
    N5: TMenuItem;
    RecuperacindeSaldos1: TMenuItem;
    Agencias1: TMenuItem;
    MayoryBalance2: TMenuItem;
    BalanceGeneralDetallado2: TMenuItem;
    ProcesosAnuales1: TMenuItem;
    RevalorizacindeAportes1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    Sumatorias1: TMenuItem;
    N7: TMenuItem;
    ConsultaExtractoColocaciones1: TMenuItem;
    RecuperarLiquidacindeColocacin1: TMenuItem;
    CambiarContrasea1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Gestiones1: TMenuItem;
    ControldeCobro1: TMenuItem;
    Consultas1: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    ProcesosEspeciales2: TMenuItem;
    BarridodeAhorrosparaAportes1: TMenuItem;
    InformeCaptaciones1: TMenuItem;
    Timer1: TTimer;
    AplicarAyudasSolidaridadyEducacin1: TMenuItem;
    Timer2: TTimer;
    N16: TMenuItem;
    AjusteComprobantes1: TMenuItem;
    LibrosRegistrados1: TMenuItem;
    PaginacindePapel1: TMenuItem;
    CajaDiario1: TMenuItem;
    MayoryBalance3: TMenuItem;
    Agencias2: TMenuItem;
    ConsolidarBalances2: TMenuItem;
    ImportarSaldosIniciales1: TMenuItem;
    ConsolidarCajaDiario1: TMenuItem;
    N17: TMenuItem;
    Observaciones1: TMenuItem;
    BalanceConsolidado1: TMenuItem;
    EstadodeIngresosyGastosConsolidados1: TMenuItem;
    MantenimientodePrivilegiados1: TMenuItem;
    MantenimientodeTasas1: TMenuItem;
    SaldosIniciales1: TMenuItem;
    IBSQL1: TIBSQL;
    ConsultadeSolicitudes1: TMenuItem;
    Utilidades1: TMenuItem;
    ClculodeTasas1: TMenuItem;
    InformacindeCrditos1: TMenuItem;
    NotasFindeMes1: TMenuItem;
    CierredeAo1: TMenuItem;
    N6: TMenuItem;
    ComprobantedeCierre1: TMenuItem;
    MantenimientodePersonas1: TMenuItem;
    N11: TMenuItem;
    SumatoriaConsolidada1: TMenuItem;
    N14: TMenuItem;
    BalanceporOficinas1: TMenuItem;
    BalanceConsolidado2: TMenuItem;
    ExportarSaldosFinales1: TMenuItem;
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
    procedure MnuComprobantesClick(Sender: TObject);
    procedure BtnComprobanteClick(Sender: TObject);
    procedure CierredelDa1Click(Sender: TObject);
    procedure MayoryBalance1Click(Sender: TObject);
    procedure BalanceGeneralDetallado1Click(Sender: TObject);
    procedure LibrosAuxiliares1Click(Sender: TObject);
    procedure MantenimientodelPUC1Click(Sender: TObject);
    procedure ListadodePrueba1Click(Sender: TObject);
    procedure PlanillaResumen1Click(Sender: TObject);
    procedure RecuperacindeSaldos1Click(Sender: TObject);
    procedure BalanceGeneralDetallado2Click(Sender: TObject);
    procedure RevalorizacindeAportes1Click(Sender: TObject);
    procedure Sumatorias1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ConsultaExtractoColocaciones1Click(Sender: TObject);
    procedure RecuperarLiquidacindeColocacin1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ControldeCobro1Click(Sender: TObject);
    procedure CdatsPorEdades1Click(Sender: TObject);
    procedure CausacindeCaptaciones1Click(Sender: TObject);
    procedure BarridodeAhorrosparaAportes1Click(Sender: TObject);
    procedure InformeCaptaciones1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure InformeTasaPromedioCdats1Click(Sender: TObject);
    procedure AplicarAyudasSolidaridadyEducacin1Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImportarBalances1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure AjusteComprobantes1Click(Sender: TObject);
    procedure PaginacindePapel1Click(Sender: TObject);
    procedure ConsolidarBalances2Click(Sender: TObject);
    procedure ImportarSaldosIniciales1Click(Sender: TObject);
    procedure MayoryBalance3Click(Sender: TObject);
    procedure ConsolidarCajaDiario1Click(Sender: TObject);
    procedure CajaDiario1Click(Sender: TObject);
    procedure InformeCajaDiario1Click(Sender: TObject);
    procedure Observaciones1Click(Sender: TObject);
    procedure BalanceConsolidado1Click(Sender: TObject);
    procedure EstadodeIngresosyGastosConsolidados1Click(Sender: TObject);
    procedure MantenimientodePrivilegiados1Click(Sender: TObject);
    procedure MantenimientodeTasas1Click(Sender: TObject);
    procedure SaldosIniciales1Click(Sender: TObject);
    procedure ConsultadeSolicitudes1Click(Sender: TObject);
    procedure ClculodeTasas1Click(Sender: TObject);
    procedure InformacindeCrditos1Click(Sender: TObject);
    procedure NotasFindeMes1Click(Sender: TObject);
    procedure CierredeAo1Click(Sender: TObject);
    procedure ComprobantedeCierre1Click(Sender: TObject);
    procedure MantenimientodePersonas1Click(Sender: TObject);
    procedure SumatoriaConsolidada1Click(Sender: TObject);
    procedure BalanceporOficinas1Click(Sender: TObject);
    procedure BalanceConsolidado2Click(Sender: TObject);
    procedure ExportarSaldosFinales1Click(Sender: TObject);
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

uses unitLogin, IniFiles,
     unitConsultaProductos,unitConsultaExtractoCaptacion,
     unit_Comprobante,unit_ComprobanteC,unitCierreDia,UnitBalanceGeneral,
     UnitBalanceGralDetallado,UnitInformeAuxiliar,Unit_Mantenimientopuc,
     UnitListadodePrueba, UnitPlanillaResumen, UnitRecuperacionSaldos,
     UnitConsolidarBalance, UnitBalanceDetalladoConsolidado,
     UnitSumatorias, UnitExtractoColocacion,
     UnitRecuperarLiquidacioncolocacion, UnitCambiarContrasena,
     UnitControlCobroCartera,unitCdatporEdades,UnitCausacionCdat,UnitBarridoAhoApo,
     UnitListadoCaptacionesConsolidado, UnitRevalorizacionAportes,
     UnitInformeTasaPromedio,unitAyudasSolidaridad, UnitReLogin,
     UnitPaginarPapel,UnitConsolidarBalAgencia, UnitConsolidarSaldoIAgencia,
     UnitLibroRMayorYBalance, UnitConsolidarCajaDiario, UnitLibroCajaDiario,
     UnitCajaDiario,UnitControldeObservaciones,UnitBalanceConsolidado,
     UnitEstadoIyGConsolidado, UnitMantenimientoPrivilegiados, UnitActualizoTasasColocacion,
     UnitSaldosIniciales, UnitConsultaSol,UnitLiquidacionGral,UnitCalculoTasas,
     UnitNotas, UnitProcesoCierreAno, UnitCierreAnual,
     UnitCreaciondePersona, UnitPlanillaConsolidada, UnitBalanceporOficinas,
     UnitBalanceConsolidadoTxt, UnitExportarSaldos, UnitCambios, UnitExtractoCredito;

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
    DBserver := ReadString('DBNAME','server','localhost');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','database.fdb');
    BaseAlt := ReadString('ADICIONALES','basealt','');
    BaseAnoAnt := ReadString('ADICIONALES','BaseAnoAnt','');
    Procesado := ReadString('ADICIONALES','Procesado','');
    Empresa := ReadString('EMPRESA','name','PERSONAL');
    Nit     := ReadString('EMPRESA','nit','800.000.000-0');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','BUCARAMANGA');
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',1);
    host_abrego := ReadString('OFICINAS','AG02','0.0.0.0');
    host_ocana := ReadString('OFICINAS','AG03','0.0.0.0');
    host_convencion := ReadString('OFICINAS','AG04','0.0.0.0');

  finally
    free;
  end;
{        IdTime1.Host := DBserver;
        if IdTime1.Connected then
           FechaHoy := IdTime1.DateTime;
        if not IdTime1.SyncTime then
        begin
          SalirMal := True;
          Exit;
        end;
}
        Timer2.Enabled := False;

        control_consulta := True;
        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'CONTABILIDAD_A';
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
        if MessageDlg('Seguro que desea salir',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
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
}
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
        Self.Caption := 'Módulo Contable - ' + DBserver;
        if SalirMal then
           Self.Close;
end;


procedure TfrmMain.BtnExtractoClick(Sender: TObject);
begin
        LibrosAuxiliares1.Click;
end;

procedure TfrmMain.BtnConsultaPersonaClick(Sender: TObject);
begin
        ConsultadeGerencia1.Click;
end;

procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        SalirdePSI1.Click;
end;

procedure TfrmMain.MnuComprobantesClick(Sender: TObject);
var frmComprobante:TfrmComprobante;
begin
        frmComprobante := TfrmComprobante.Create(Self);
        frmComprobante.ShowModal;
end;

procedure TfrmMain.BtnComprobanteClick(Sender: TObject);
begin
        MnuComprobantes.Click;
end;

procedure TfrmMain.CierredelDa1Click(Sender: TObject);
var frmcierredia:Tfrmcierredia;
begin
    frmcierredia := Tfrmcierredia.Create(Self);
    frmcierredia.ShowModal;
end;

procedure TfrmMain.MayoryBalance1Click(Sender: TObject);
var frmBalanceGeneral:TfrmBalanceGeneral;
begin
          frmBalanceGeneral := TfrmBalanceGeneral.Create(Self);
          frmBalanceGeneral.ShowModal;
end;

procedure TfrmMain.BalanceGeneralDetallado1Click(Sender: TObject);
var frmBalanceGralDetallado:TfrmBalanceGralDetallado;
begin
        frmBalanceGralDetallado := TfrmBalanceGralDetallado.Create(Self);
        frmBalanceGralDetallado.ShowModal;
end;

procedure TfrmMain.LibrosAuxiliares1Click(Sender: TObject);
var frmInformeAuxiliares :TfrmInformeAuxiliares;
begin
    frmInformeAuxiliares := TfrmInformeAuxiliares.Create(Self);
    frmInformeAuxiliares.ShowModal;
end;

procedure TfrmMain.MantenimientodelPUC1Click(Sender: TObject);
var frmMantenimientopuc:TfrmMantenimientopuc;
begin
     frmMantenimientopuc := TfrmMantenimientopuc.Create(Self);
     frmMantenimientopuc.Agregar := True;
     frmMantenimientopuc.Modificar := True;
     frmMantenimientopuc.Eliminar := True;
     frmMantenimientopuc.ShowModal;
end;

procedure TfrmMain.ListadodePrueba1Click(Sender: TObject);
var frmListadodePrueba:TfrmListadodePrueba;
begin
      frmListadodePrueba := TfrmListadodePrueba.Create(Self);
      frmListadodePrueba.ShowModal;
end;

procedure TfrmMain.PlanillaResumen1Click(Sender: TObject);
var frmPlanillaResumen:TfrmPlanillaResumen;
begin
        frmPlanillaResumen := TfrmPlanillaResumen.Create(Self);
        frmPlanillaResumen.ShowModal;
end;

procedure TfrmMain.RecuperacindeSaldos1Click(Sender: TObject);
var frmRecuperacionSaldos:TfrmRecuperacionSaldos;
begin
        Timer2.Enabled := False;
        frmRecuperacionSaldos := Tfrmrecuperacionsaldos.Create(Self);
        frmRecuperacionSaldos.ShowModal;
        Timer2.Enabled := True;
end;

procedure TfrmMain.BalanceGeneralDetallado2Click(Sender: TObject);
var frmBalanceDetalladoConsolidado:tfrmbalancedetalladoconsolidado;
begin
       frmBalanceDetalladoConsolidado:=tfrmbalancedetalladoconsolidado.Create(Self);
       frmBalanceDetalladoConsolidado.ShowModal;
end;

procedure TfrmMain.RevalorizacindeAportes1Click(Sender: TObject);
var frmRevalorizacionAportes:TfrmRevalorizacionAportes;
begin
        Timer2.Enabled := False;
        frmRevalorizacionAportes := TfrmRevalorizacionAportes.Create(Self);
        frmRevalorizacionAportes.ShowModal;
        Timer2.Enabled := True;
end;

procedure TfrmMain.Sumatorias1Click(Sender: TObject);
var frmSumatorias:TfrmSumatorias;
begin
      Timer2.Enabled := False;
      frmSumatorias := TfrmSumatorias.Create(Self);
      frmSumatorias.ShowModal;
      Timer2.Enabled := True;
end;

procedure TfrmMain.ToolButton1Click(Sender: TObject);
begin
        Sumatorias1.Click;
end;

procedure TfrmMain.ConsultaExtractoColocaciones1Click(Sender: TObject);
var frmExtractoCredito:TFrmExtractoCredito;
begin
        frmExtractoCredito := TFrmExtractoCredito.Create(Self);
        frmExtractoCredito.ShowModal;
end;

procedure TfrmMain.RecuperarLiquidacindeColocacin1Click(Sender: TObject);
var frmRecuperarLiquidacionColocacion:TfrmRecuperarLiquidacionColocacion;
begin
         frmRecuperarLiquidacionColocacion := TfrmRecuperarLiquidacionColocacion.Create(Self);
         frmRecuperarLiquidacionColocacion.ShowModal;
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena:TfrmCambiarContrasena;
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
        FechaHora := Date;
end;

procedure TfrmMain.ControldeCobro1Click(Sender: TObject);
var frmControlCobroCartera:tfrmControlCobroCartera;
begin
      frmControlCobroCartera := TfrmControlCobroCartera.Create(Self);
      frmControlCobroCartera.Show;
end;

procedure TfrmMain.CdatsPorEdades1Click(Sender: TObject);
var frmCdatporEdades:TfrmCdatporEdades;
begin
        frmCdatporEdades := TfrmCdatporEdades.Create(Self);
        frmCdatporEdades.ShowModal;
end;

procedure TfrmMain.CausacindeCaptaciones1Click(Sender: TObject);
var frmcausacioncdat:Tfrmcausacioncdat;
begin
        frmcausacioncdat := Tfrmcausacioncdat.Create(self);
        frmcausacioncdat.ShowModal;
end;

procedure TfrmMain.BarridodeAhorrosparaAportes1Click(Sender: TObject);
var frmBarridoAhoApo:TfrmBarridoAhoApo;
begin
        frmBarridoAhoApo := TfrmBarridoAhoApo.Create(Self);
        frmBarridoAhoApo.ShowModal;
end;

procedure TfrmMain.InformeCaptaciones1Click(Sender: TObject);
var frmListadoCaptacionesConsolidado : TfrmListadoCaptacionesConsolidado;
begin
        Timer2.Enabled := False;
        frmListadoCaptacionesConsolidado := TfrmListadoCaptacionesConsolidado.Create(Self);
        frmListadoCaptacionesConsolidado.ShowModal;
        Timer2.Enabled := True;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
{      try
        IdTime1.Host := DBserver;
        IdTime1.SyncTime;
        IdTime1.DateTime;
      finally
        IdTime1.Disconnect;
      end;
    }
end;

procedure TfrmMain.InformeTasaPromedioCdats1Click(Sender: TObject);
var frmInformeTasaPromedio:TfrmInformeTasaPromedio;
begin
        frmInformeTasaPromedio := TfrmInformeTasaPromedio.Create(Self);
        frmInformeTasaPromedio.ShowModal;
end;

procedure TfrmMain.AplicarAyudasSolidaridadyEducacin1Click(
  Sender: TObject);
var frmAyudas:TfrmAyudas;
begin
      frmAyudas := TfrmAyudas.Create(Self);
      frmAyudas.ShowModal;
end;

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
        FechaHora := Date;
end;

procedure TfrmMain.ImportarBalances1Click(Sender: TObject);
//var frmImportarPuc:TfrmImportarPuc;
begin
//    frmImportarPuc := TfrmImportarPuc.Create(self);
//   frmImportarPuc.ShowModal;
end;

procedure tfrmmain.AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of
    WM_KEYFIRST..WM_KEYLAST,
    WM_LBUTTONDOWN..WM_MOUSELAST: FUltimaActividad := Now;
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

procedure TfrmMain.AjusteComprobantes1Click(Sender: TObject);
var frmComprobanteC:TfrmComprobanteC;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then begin
          frmComprobanteC := TfrmComprobanteC.Create(Self);
          frmComprobanteC.ShowModal;
        end;
end;

procedure TfrmMain.PaginacindePapel1Click(Sender: TObject);
var frmPaginarPapel:TfrmPaginarPapel;
begin
    frmPaginarPapel := TfrmPaginarPapel.Create(Self);
    frmPaginarPapel.ShowModal;
end;

procedure TfrmMain.ConsolidarBalances2Click(Sender: TObject);
var frmConsolidarBalAgencia:TfrmConsolidarBalAgencia;
begin
        frmConsolidarBalAgencia := TfrmConsolidarBalAgencia.Create(Self);
        frmConsolidarBalAgencia.ShowModal;
end;

procedure TfrmMain.ImportarSaldosIniciales1Click(Sender: TObject);
var frmConsolidarSaldoIAgencia:TfrmConsolidarSaldoIAgencia;
begin
        frmConsolidarSaldoIAgencia := TfrmConsolidarSaldoIAgencia.Create(Self);
        frmConsolidarSaldoIAgencia.ShowModal;
end;

procedure TfrmMain.MayoryBalance3Click(Sender: TObject);
var frmLibroMayorYBalance :TfrmLibroMayorYBalance;
begin
        frmLibroMayorYBalance := TfrmLibroMayorYBalance.Create(Self);
        frmLibroMayorYBalance.ShowModal;
end;

procedure TfrmMain.ConsolidarCajaDiario1Click(Sender: TObject);
var frmConsolidarCajaDiario:TfrmConsolidarCajaDiario;
begin
      frmConsolidarCajaDiario:= TfrmConsolidarCajaDiario.Create(Self);
      frmConsolidarCajaDiario.ShowModal;
end;

procedure TfrmMain.CajaDiario1Click(Sender: TObject);
var frmLibroRCajaDiario:TfrmLibroRCajaDiario;
begin
        frmLibroRCajaDiario:=TfrmLibroRCajaDiario.Create(Self);
        frmLibroRCajaDiario.ShowModal;
end;

procedure TfrmMain.InformeCajaDiario1Click(Sender: TObject);
var frmCajaDiario:TfrmCajaDiario;
begin
        timer2.Enabled := False;
        frmCajaDiario := TfrmCajaDiario.Create(Self);
        frmCajaDiario.ShowModal;
        timer2.Enabled := True;
end;

procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones:TfrmControldeObservaciones;
begin
        frmControldeObservaciones:=TfrmControldeObservaciones.Create(Self);
        frmControldeObservaciones.ShowModal;
end;

procedure TfrmMain.BalanceConsolidado1Click(Sender: TObject);
var frmBalanceConsolidado:TfrmBalanceConsolidado;
begin
        frmBalanceConsolidado := TfrmBalanceConsolidado.Create(Self);
        frmBalanceConsolidado.ShowModal;
end;

procedure TfrmMain.EstadodeIngresosyGastosConsolidados1Click(
  Sender: TObject);
var frmEstadoIyGConsolidado:TfrmEstadoIyGConsolidado;
begin
        frmEstadoIyGConsolidado := TfrmEstadoIyGConsolidado.Create(Self);
        frmEstadoIyGConsolidado.ShowModal;
end;

procedure TfrmMain.MantenimientodePrivilegiados1Click(Sender: TObject);
var frmMantenimientoPrivilegiados : TfrmMantenimientoPrivilegiados;
begin
        frmMantenimientoPrivilegiados := TfrmMantenimientoPrivilegiados.Create(Self);
        frmMantenimientoPrivilegiados.ShowModal;
end;

procedure TfrmMain.MantenimientodeTasas1Click(Sender: TObject);
var frmActualizoTasas : TfrmActualizoTasas;
begin
        frmActualizoTasas := TfrmActualizoTasas.Create(Self);
        frmActualizoTasas.ShowModal;
end;

procedure TfrmMain.SaldosIniciales1Click(Sender: TObject);
var frmSaldosIniciales : TfrmSaldosIniciales;
begin
        frmSaldosIniciales := TfrmSaldosIniciales.Create(Self);
        frmSaldosIniciales.ShowModal;
end;

procedure TfrmMain.ConsultadeSolicitudes1Click(Sender: TObject);
var frmConsultaSol:TFrmConsultaSol ;
begin
        frmConsultaSol := TFrmConsultaSol.Create(Self);
        frmConsultaSol.ShowModal;
end;

procedure TfrmMain.ClculodeTasas1Click(Sender: TObject);
var frmCalculoTasas:TfrmCalculoTasas;
begin
  frmCalculoTasas := TfrmCalculoTasas.Create(Self);
  frmCalculoTasas.ShowModal;
end;

procedure TfrmMain.InformacindeCrditos1Click(Sender: TObject);
var frmLiquidacionGral:TfrmLiquidacionGral;
begin
  frmLiquidacionGral := TfrmLiquidacionGral.Create(Self);
  frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.NotasFindeMes1Click(Sender: TObject);
begin
        FrmNotas := TFrmNotas.Create(Self);
        FrmNotas.ShowModal;
end;

procedure TfrmMain.CierredeAo1Click(Sender: TObject);
begin
        frmCierreAno := TfrmCierreAno.Create(Self);
        frmCierreAno.ShowModal;
end;

procedure TfrmMain.ComprobantedeCierre1Click(Sender: TObject);
var
  frmCierreAnual:TfrmCierreAnual;
begin
       frmCierreAnual := Tfrmcierreanual.Create(Self);
       frmCierreAnual.ShowModal;
end;

procedure TfrmMain.MantenimientodePersonas1Click(Sender: TObject);
begin
        frmCreacionPersona := TfrmCreacionPersona.Create(Self);
        frmCreacionPersona.ShowModal;
end;

procedure TfrmMain.SumatoriaConsolidada1Click(Sender: TObject);
begin
        FrmPlanillaConsolidada := TFrmPlanillaConsolidada.Create(Self);
        FrmPlanillaConsolidada.ShowModal;
end;

procedure TfrmMain.BalanceporOficinas1Click(Sender: TObject);
var
  frmBalanceporOficinas :TfrmBalanceporOficinas;
begin
        frmBalanceporoficinas := TfrmBalanceporOficinas.Create(Self);
        frmBalanceporOficinas.ShowModal;
end;

procedure TfrmMain.BalanceConsolidado2Click(Sender: TObject);
var
    frmBalanceConsolidadoTxt: TfrmBalanceConsolidadoTxt;
begin

    frmBalanceConsolidadoTxt := TfrmBalanceConsolidadoTxt.Create(self);
    frmBalanceConsolidadoTxt.ShowModal;

end;

procedure TfrmMain.ExportarSaldosFinales1Click(Sender: TObject);
var
   frmExportarSaldos: TfrmExportarSaldos;
begin
       frmExportarSaldos := TfrmExportarSaldos.Create(Self);
       frmExportarSaldos.ShowModal;
end;

procedure TfrmMain.RequerimientoSistemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

end.
