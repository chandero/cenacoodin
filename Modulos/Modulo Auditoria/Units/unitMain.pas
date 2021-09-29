unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, DateUtils, IBSQL, DB, IBCustomDataSet,
  IBQuery, DBClient, FR_Class, FR_DSet, FR_DBSet, ImgList, IBDatabase,sdXmlDocuments;

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
    ConsultaCaptaciones1: TMenuItem;
    N6: TMenuItem;
    N11: TMenuItem;
    ColocacionesParametrizado1: TMenuItem;
    ConsultaColocacin1: TMenuItem;
    Auditoria1: TMenuItem;
    ReportePorAnalista1: TMenuItem;
    ReporteporEmpleado1: TMenuItem;
    ReporteGeneralProEmpleados1: TMenuItem;
    ReporteMorosidadPorAnalista1: TMenuItem;
    IBQuery1: TIBQuery;
    CDanalista: TClientDataSet;
    CDanalistaanalista: TStringField;
    CDanalistacolocacion: TStringField;
    CDanalistadias: TIntegerField;
    CDanalistafecha: TDateField;
    IBSQL2: TIBSQL;
    CDanalistaclasificacion: TStringField;
    CDanalistaestado: TStringField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    CDanalistaasociado: TStringField;
    CDanalistasaldo: TCurrencyField;
    Prueba1: TMenuItem;
    InformeCarteraPrivilegiados1: TMenuItem;
    ReporteSolicitudesenAnalisis1: TMenuItem;
    IBanalisis: TIBQuery;
    frDBDataSet2: TfrDBDataSet;
    ReporteSolicitudAprobadas1: TMenuItem;
    CDreporte: TClientDataSet;
    CDreportesolicitud: TStringField;
    CDreportenombres: TStringField;
    CDreportefecha: TDateField;
    CDreportevalor: TCurrencyField;
    CDreporteempleado: TStringField;
    frDBReporte: TfrDBDataSet;
    Ocaa1: TMenuItem;
    General1: TMenuItem;
    IBQuery2: TIBQuery;
    CarteraporTasas1: TMenuItem;
    InformedeAsociadosHabilesInHabiles1: TMenuItem;
    SolicitudesenSecciondeCreditos1: TMenuItem;
    SolicitudesAnuladas1: TMenuItem;
    DesembolososporEmpleado1: TMenuItem;
    frDBDataSet3: TfrDBDataSet;
    LineasvsTotalCartera1: TMenuItem;
    ColocacionesenAbogados1: TMenuItem;
    CdCreditos: TClientDataSet;
    CdCreditosid_identificacion: TSmallintField;
    CdCreditosid_persona: TStringField;
    CdCreditosnombres: TStringField;
    CdCreditosid_colocacion: TStringField;
    CdCreditoscuota: TCurrencyField;
    CdCreditosdesembolso: TCurrencyField;
    CdCreditossaldo: TCurrencyField;
    IBInventario: TIBDatabase;
    IBTinventario: TIBTransaction;
    IBempleado: TIBQuery;
    InformacinCrditosEmpleado1: TMenuItem;
    IBColocacion: TIBQuery;
    CdCreditoscuenta: TIntegerField;
    CdCreditosfecha: TDateField;
    CdCreditosplazo: TSmallintField;
    frReport2: TfrReport;
    frDBDataSet4: TfrDBDataSet;
    SaldosenCaja1: TMenuItem;
    SumatoriaConsolidada1: TMenuItem;
    Contables1: TMenuItem;
    Captaciones1: TMenuItem;
    CrditoyCartera1: TMenuItem;
    Cajas1: TMenuItem;
    MovimientosdeCaja1: TMenuItem;
    Cambios1: TMenuItem;
    RequisitoSistemas1: TMenuItem;
    ConsultaCajas1: TMenuItem;
    CDsolicitud: TClientDataSet;
    CDsolicitudid_solicitud: TStringField;
    CDsolicitudempleado: TStringField;
    CDsolicitudvalor: TCurrencyField;
    CDsolicitudfecha: TDateField;
    CDsolicitudasociado: TStringField;
    CDsolicitudagencia: TStringField;
    IdTCPClient1: TIdTCPClient;
    CdAnalisis: TClientDataSet;
    CdAnalisisnombre: TStringField;
    CdAnalisisanalista: TStringField;
    CdAnalisissolicitud: TStringField;
    CdAnalisisfecha: TDateField;
    CdAnalisisvalor_solicitado: TCurrencyField;
    CdAnalisisvalor_pendiente: TCurrencyField;
    CdAnalisisv_pendiente: TStringField;
    CdAnalisisv_solicitado: TStringField;
    CdAnalisisid_empleado: TStringField;
    IbAgencias: TIBQuery;
    IBagencia: TIBQuery;
    CorregirColocacin1: TMenuItem;
    Sistemas1: TMenuItem;
    EliminarDocumento1: TMenuItem;
    CambiarEstadoSolicitud1: TMenuItem;
    EliminarMovimientoCaja1: TMenuItem;
    EliminarMovimientoRemoto1: TMenuItem;
    EliminarAyudadeSolidaridad1: TMenuItem;
    EliminarAbonoporCaja1: TMenuItem;
    Fundacin1: TMenuItem;
    AbrirNotaContable1: TMenuItem;
    AbrirNotaContable2: TMenuItem;
    EliminarDescuentoCrditoparaDesembolso1: TMenuItem;
    CambiosSolicitud1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BtnExtractoClick(Sender: TObject);
    procedure BtnConsultaPersonaClick(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnComprobanteClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure ConsultaExtracto1Click(Sender: TObject);
    procedure ConsultaExtractoColocaciones1Click(Sender: TObject);
    procedure RecuperarLiquidacindeColocacin1Click(Sender: TObject);
    procedure ConsultadeSolicitudes1Click(Sender: TObject);
    procedure ControldeCobro1Click(Sender: TObject);
    procedure ConsultadeGerencia1Click(Sender: TObject);
    procedure BalanceGeneralDetallado1Click(Sender: TObject);
    procedure LibrosAuxiliares1Click(Sender: TObject);
    procedure BalanceGeneralDetallado2Click(Sender: TObject);
    procedure BalanceConsolidado1Click(Sender: TObject);
    procedure ClculodeTasas1Click(Sender: TObject);
    procedure InformacindeCrditos1Click(Sender: TObject);
    procedure ConsultaCaptaciones1Click(Sender: TObject);
    procedure ColocacionesParametrizado1Click(Sender: TObject);
    procedure ConsultaColocacin1Click(Sender: TObject);
    procedure MantenimientodeTasas1Click(Sender: TObject);
    procedure ReportePorAnalista1Click(Sender: TObject);
    procedure ReporteporEmpleado1Click(Sender: TObject);
    procedure ReporteGeneralProEmpleados1Click(Sender: TObject);
    procedure ReporteMorosidadPorAnalista1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure InformeCarteraPrivilegiados1Click(Sender: TObject);
    procedure ReporteSolicitudAprobadas1Click(Sender: TObject);
    procedure Prueba1Click(Sender: TObject);
    procedure Ocaa1Click(Sender: TObject);
    procedure General1Click(Sender: TObject);
    procedure CarteraporTasas1Click(Sender: TObject);
    procedure InformedeAsociadosHabilesInHabiles1Click(Sender: TObject);
    procedure SolicitudesenSecciondeCreditos1Click(Sender: TObject);
    procedure SolicitudesAnuladas1Click(Sender: TObject);
    procedure DesembolososporEmpleado1Click(Sender: TObject);
    procedure LineasvsTotalCartera1Click(Sender: TObject);
    procedure ColocacionesenAbogados1Click(Sender: TObject);
    procedure InformacinCrditosEmpleado1Click(Sender: TObject);
    procedure SaldosenCaja1Click(Sender: TObject);
    procedure SumatoriaConsolidada1Click(Sender: TObject);
    procedure MovimientosdeCaja1Click(Sender: TObject);
    procedure Cambios1Click(Sender: TObject);
    procedure RequisitoSistemas1Click(Sender: TObject);
    procedure ConsultaCajas1Click(Sender: TObject);
    procedure CorregirColocacin1Click(Sender: TObject);
    procedure EliminarDocumento1Click(Sender: TObject);
    procedure CambiarEstadoSolicitud1Click(Sender: TObject);
    procedure EliminarMovimientoCaja1Click(Sender: TObject);
    procedure EliminarMovimientoRemoto1Click(Sender: TObject);
    procedure AbrirNotaContable2Click(Sender: TObject);
    procedure EliminarAyudadeSolidaridad1Click(Sender: TObject);
    procedure EliminarDescuentoCrditoparaDesembolso1Click(Sender: TObject);
    procedure EliminarAbonoporCaja1Click(Sender: TObject);
    procedure AbrirNotaContable1Click(Sender: TObject);
    procedure CambiosSolicitud1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
    FUltimaActividad:TDateTime;
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
    function clasificacion(codigo: integer): string;
    function estado(codigo: integer): string;
    procedure Analista;
    procedure SolicitudCreditos;
    procedure agencias(host_r, dagencia: string; puerto,
      vIdAgencia: integer);
    procedure AnaOficinas(puerto, id_agencia: integer; DesAgencia,
      hostp: string);
  public
  ruta1 :string;
  wpath :string;
  DbInventario :string;
  XmlPetC :TsdXmlDocument;
  XmlresC :TsdXmlDocument;
  nodo,nodo1 :TXmlNode;
  Valida_Tcp :Boolean;
  Astream :TMemoryStream;
  tamano :Integer;
  vMensaje :string;

  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDateTime;

implementation

{$R *.dfm}

uses unitLogin, IniFiles, UnitCambiarContrasena, UnitReLogin,
  UnitConsultaExtractoCaptacion, UnitExtractoColocacion,
  UnitRecuperarLiquidacionColocacion, UnitConsultaSol,
  UnitControlCobroCartera, UnitConsultaProductos, UnitBalanceGralDetallado,
  UnitInformeAuxiliar, UnitBalanceDetalladoConsolidado,
  UnitBalanceConsolidado, UnitCalculoTasas, UnitLiquidacionGral,
  UnitInformeGeneraldeCaptaciones, UnitInformeColocacionFiltrado,
  UnitConsultaColocacion, UnitActualizoTasasColocacion,
  UnitConsultaSolicitud,UnitGlobalesCol, UnitdmColocacion, UnitPantallaProgreso,
  UnitImpresion, UnitInformeCarteraPrivilegiados, UnitEstadoSolicitud, UnitExtractoCredito,
  UnitInformeTasasConsolidado,UnitInformeAsociadosHabilesInHabiles,UnitSolicitudAnulada,
  UnitInformeDesembolsosxempleado, unitLineasVsTotal, UnitRCarteraAbogados,
  UnitSaldosCaja, UnitPlanillaConsolidada, UnitInformeCajaAuditoria,
  UnitCambios, UnitAutorizaSolicitud, UnitConsultaCajas,
  UnitCorrigeColocacion, UnitEliminaPersona, UnitActualizaEstadoSolicitud,
  UnitEliminaMovimiento, UnitEliminaMovimientoRemoto, UnitAbrirNota,
  UnitEliminaAyuda, UnitEliminaDescuento, UnitEliminaAbonoCaja,
  UnitAbrirNotaFun, UnitActualizaSolicitudOf;

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
    DbInventario := ReadString('DBNAME','nameinv','inventario.gdb');
    DBnameF := ReadString('DBNAME','namef','fundacion.gdb');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',1);

    host_abrego := ReadString('ADICIONALES','host_abrego','0.0.0.0');
    host_convencion := ReadString('ADICIONALES','host_convencion','0.0.0.0');
    host_aguachica := ReadString('ADICIONALES','host_aguachica','0.0.0.0');
    puerto_abrego := ReadInteger('ADICIONALES','puerto_abrego',0);
    puerto_convencion := ReadInteger('ADICIONALES','puerto_convencion',0);
    puerto_aguachica := ReadInteger('ADICIONALES','puerto_aguachica',0);
    puerto_aguachica := 3052;
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
        Timer2.Enabled := False;

        control_consulta := True;
        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'AUDITORIA';
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
                //base de datos inventarios
                IBInventario.DatabaseName := DBserver + ':' + DBpath + DbInventario;
                IBInventario.Params.Values['lc_ctype'] := 'ISO8859_1';
                IBInventario.Params.Values['User_Name'] := DBAlias;
                IBInventario.Params.Values['PassWord'] := DBPasabordo;
                Veces := Veces + 1;
                try
                    dmGeneral.IBDatabase1.Connected := True;
                    dmGeneral.IBTransaction1.Active := True;
                    if Agencia = 1 then
                    begin
                      IBInventario.Connected := True;
                      IBTinventario.Active := True;
                    end;
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
  wpath := ExtractFilePath(Application.ExeName);
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');
  Self.Caption := 'Modulo de 8 - ';
  FrmAutorizacionSolicitud := TFrmAutorizacionSolicitud.Create(Self);
  FrmAutorizacionSolicitud.IBEvents1.Database := dmGeneral.IBDatabase1;
  FrmAutorizacionSolicitud.IBEvents1.Events.Clear;
  FrmAutorizacionSolicitud.IBEvents1.Events.Add('por_autorizar');
  FrmAutorizacionSolicitud.IBEvents1.Registered := True;


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


procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar SIFCREDISERVIR',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
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
        Self.Caption := 'Módulo Auditoria - ' + DBserver;
        if SalirMal then
           Self.Close;
end;


procedure TfrmMain.BtnExtractoClick(Sender: TObject);
begin
    frmInformeAuxiliares := TfrmInformeAuxiliares.Create(Self);
    frmInformeAuxiliares.ShowModal;

end;

procedure TfrmMain.BtnConsultaPersonaClick(Sender: TObject);
begin
        ConsultadeGerencia1.Click;
end;

procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        SalirdePSI1.Click;
end;

procedure TfrmMain.BtnComprobanteClick(Sender: TObject);
begin
        MnuComprobantes.Click;
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


procedure TfrmMain.Timer2Timer(Sender: TObject);
var    Pasabordo :string;
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

procedure TfrmMain.ConsultaExtracto1Click(Sender: TObject);
var frmConsultaExtractoCaptacion:TfrmConsultaExtractoCaptacion;
begin
        frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
        frmConsultaExtractoCaptacion.ShowModal;

end;

procedure TfrmMain.ConsultaExtractoColocaciones1Click(Sender: TObject);
begin
//        frmextractocolocacion := TFrmExtractoColocacion.Create(Self);
//        frmextractocolocacion.ShowModal;
        frmExtractoCredito := TfrmExtractoCredito.Create(Self);
        frmExtractoCredito.ShowModal;
end;

procedure TfrmMain.RecuperarLiquidacindeColocacin1Click(Sender: TObject);
begin
         frmRecuperarLiquidacionColocacion := TfrmRecuperarLiquidacionColocacion.Create(Self);
         frmRecuperarLiquidacionColocacion.ShowModal;

end;

procedure TfrmMain.ConsultadeSolicitudes1Click(Sender: TObject);
begin
        frmConsultaSol := TFrmConsultaSol.Create(Self);
        frmConsultaSol.ShowModal;

end;

procedure TfrmMain.ControldeCobro1Click(Sender: TObject);
begin
      frmControlCobroCartera := TfrmControlCobroCartera.Create(Self);
      frmControlCobroCartera.Show;

end;

procedure TfrmMain.ConsultadeGerencia1Click(Sender: TObject);
begin
       frmConsultaProductos := TfrmConsultaProductos.Create(Self);
       frmConsultaProductos.ShowModal;
end;

procedure TfrmMain.BalanceGeneralDetallado1Click(Sender: TObject);
begin
        frmBalanceGralDetallado := TfrmBalanceGralDetallado.Create(Self);
        frmBalanceGralDetallado.ShowModal;
end;

procedure TfrmMain.LibrosAuxiliares1Click(Sender: TObject);
begin
    frmInformeAuxiliares := TfrmInformeAuxiliares.Create(Self);
    frmInformeAuxiliares.ShowModal;

end;

procedure TfrmMain.BalanceGeneralDetallado2Click(Sender: TObject);
begin
       frmBalanceDetalladoConsolidado:=tfrmbalancedetalladoconsolidado.Create(Self);
       frmBalanceDetalladoConsolidado.ShowModal;

end;

procedure TfrmMain.BalanceConsolidado1Click(Sender: TObject);
begin
        frmBalanceConsolidado := TfrmBalanceConsolidado.Create(Self);
        frmBalanceConsolidado.ShowModal;

end;

procedure TfrmMain.ClculodeTasas1Click(Sender: TObject);
begin
  frmCalculoTasas := TfrmCalculoTasas.Create(Self);
  frmCalculoTasas.ShowModal;
end;

procedure TfrmMain.InformacindeCrditos1Click(Sender: TObject);
begin
  frmLiquidacionGral := TfrmLiquidacionGral.Create(Self);
  frmLiquidacionGral.ShowModal;

end;

procedure TfrmMain.ConsultaCaptaciones1Click(Sender: TObject);
begin
        frmInformeGeneraldeCaptaciones:=TfrmInformeGeneraldeCaptaciones.Create(Self);
        frmInformeGeneraldeCaptaciones.ShowModal;

end;

procedure TfrmMain.ColocacionesParametrizado1Click(Sender: TObject);
begin
        frmInformeColocacionesFiltrado := TfrmInformeColocacionesFiltrado.Create(Self);
        frmInformeColocacionesFiltrado.ShowModal;

end;

procedure TfrmMain.ConsultaColocacin1Click(Sender: TObject);
begin
        frmConsultaColocacion := TfrmConsultaColocacion.Create(Self);
        frmConsultaColocacion.ShowModal;
end;

procedure TfrmMain.MantenimientodeTasas1Click(Sender: TObject);
begin
        frmActualizoTasas := TfrmActualizoTasas.Create(Self);
        frmActualizoTasas.ShowModal;
end;

procedure TfrmMain.ReportePorAnalista1Click(Sender: TObject);
begin
        FrmConsultaSolicitud := TFrmConsultaSolicitud.Create(self);
        FrmConsultaSolicitud.opcion_consulta := 4;
        FrmConsultaSolicitud.Ctotal.Visible := False;
        FrmConsultaSolicitud.label3.Top := 30;
        FrmConsultaSolicitud.label2.Top := 30;
        FrmConsultaSolicitud.Fecha1.Top := 28;
        FrmConsultaSolicitud.Fecha2.Top := 28;
        FrmConsultaSolicitud.Fecha1.MinDate := StrToDate('2005/03/31');
        FrmConsultaSolicitud.Caption := 'Solicitudes por Analista';
        FrmConsultaSolicitud.Label1.Visible := False;
        FrmConsultaSolicitud.DBempleado.Visible := False;
        FrmConsultaSolicitud.ShowModal

end;

procedure TfrmMain.ReporteporEmpleado1Click(Sender: TObject);
begin
        FrmConsultaSolicitud := TFrmConsultaSolicitud.Create(self);
        FrmConsultaSolicitud.opcion_consulta := 1;
        FrmConsultaSolicitud.Caption := 'Reporte por Empleado';
        FrmConsultaSolicitud.ShowModal
end;

procedure TfrmMain.ReporteGeneralProEmpleados1Click(Sender: TObject);
begin
        FrmConsultaSolicitud := TFrmConsultaSolicitud.Create(self);
        FrmConsultaSolicitud.opcion_consulta := 3;
        FrmConsultaSolicitud.Ctotal.Visible := False;
        FrmConsultaSolicitud.label3.Top := 30;
        FrmConsultaSolicitud.label2.Top := 30;
        FrmConsultaSolicitud.Fecha1.Top := 28;
        FrmConsultaSolicitud.Fecha2.Top := 28;
        FrmConsultaSolicitud.Caption := 'Solicitudes por Empleado';
        FrmConsultaSolicitud.Label1.Visible := False;
        FrmConsultaSolicitud.DBempleado.Visible := False;
        FrmConsultaSolicitud.ShowModal
end;

procedure TfrmMain.ReporteMorosidadPorAnalista1Click(Sender: TObject);
var     vDias :Integer;
        nAnalista :string;
begin
        if CDanalista.RecordCount = 0 then
        begin
        dmColocacion := TdmColocacion.Create(Self);
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$solicitud".ID_ANALISIS,');
          SQL.Add('"col$desembolsoparcial".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"col$colocacion".ID_CLASIFICACION,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('RIGHT OUTER JOIN "col$desembolsoparcial" ON ("col$solicitud".ID_SOLICITUD="col$desembolsoparcial".ID_SOLICITUD)');
          SQL.Add('INNER JOIN "col$colocacion" ON ("col$desembolsoparcial".ID_COLOCACION="col$colocacion".ID_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_ANALISIS IS NOT NULL) AND ');
          SQL.Add('("col$desembolsoparcial".ID_COLOCACION IS NOT NULL) AND ');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION IN (0,1,2))');
          Open;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(self);
          frmProgreso.Titulo := 'Reporte de Colocaciones Morosos por Analista';
          frmProgreso.Max := RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
             frmProgreso.Position := RecNo;
             frmProgreso.InfoLabel := 'Registro No : ' + IntToStr(RecNo);
             Application.ProcessMessages;
             vDias := obtenerdeudahoy1(1,FieldByName('ID_COLOCACION').AsString,IBSQL1).Dias;
            if ((FieldByName('ID_CLASIFICACION').AsInteger = 3) and (vDias > 61)) or ((FieldByName('ID_CLASIFICACION').AsInteger <> 3) and (vDias > 31)) or (FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) then
            begin
               with IBSQL1 do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT ');
                  SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
                  SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
                  SQL.Add('"gen$empleado".NOMBRE');
                  SQL.Add('FROM');
                  SQL.Add('"gen$empleado"');
                  SQL.Add('WHERE');
                  SQL.Add('("gen$empleado".ID_EMPLEADO = :ID_EMPLEADO)');
                  ParamByName('ID_EMPLEADO').AsString := IBQuery1.FieldByName('ID_ANALISIS').AsString;
                  ExecQuery;
                  nAnalista := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString;
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT ');
                  SQL.Add('"gen$persona".NOMBRE,');
                  SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO');
                  SQL.Add('FROM');
                  SQL.Add('"gen$persona"');
                  SQL.Add('WHERE');
                  SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
                  SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA)');
                  ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                  ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                  ExecQuery;
                  CDanalista.Append;
                  CDanalista.FieldValues['analista'] := nAnalista;
                  CDanalista.FieldValues['colocacion'] := IBQuery1.fieldbyname('ID_COLOCACION').AsString;
                  CDanalista.FieldValues['clasificacion'] := clasificacion(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger);
                  CDanalista.FieldValues['dias'] := vDias;
                  CDanalista.FieldValues['fecha'] := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                  CDanalista.FieldValues['estado'] := estado(IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger);
                  CDanalista.FieldValues['asociado'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                  CDanalista.FieldValues['saldo'] := IBQuery1.FieldByName('SALDO').AsCurrency;
                  CDanalista.post;
               end;
            end;
            Next;
          end;
          frmProgreso.Cerrar;
        end;
        end;
        CDanalista.IndexFieldNames := 'analista';
        imprimir_reporte(ruta1 + '\Reporte\RepAnalistaMoroso.frf');
end;

function TfrmMain.clasificacion(codigo: integer): string;
begin
        with IBSQL2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION');
          SQL.Add('FROM');
          SQL.Add('"col$clasificacion"');
          SQL.Add('WHERE');
          SQL.Add('("col$clasificacion".ID_CLASIFICACION = :ID_CLASIFICACION)');
          ParamByName('ID_CLASIFICACION').AsInteger := codigo;
          ExecQuery;
          Result := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
        end;

end;

function TfrmMain.estado(codigo: integer): string;
begin
        with IBSQL2 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
           SQL.Add('FROM');
           SQL.Add('"col$estado"');
           SQL.Add('WHERE');
           SQL.Add('("col$estado".ID_ESTADO_COLOCACION = :ID_ESTADO)');
           ParamByName('ID_ESTADO').AsInteger := codigo;
           ExecQuery;
           Result := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
        end;
end;

procedure TfrmMain.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.InformeCarteraPrivilegiados1Click(Sender: TObject);
var frmInformeCarteraPrivilegiados : TfrmInformeCarteraPrivilegiados;
begin
        frmInformeCarteraPrivilegiados := TfrmInformeCarteraPrivilegiados.Create(Self);
        frmInformeCarteraPrivilegiados.ShowModal;
end;

procedure TfrmMain.ReporteSolicitudAprobadas1Click(Sender: TObject);
begin
        FrmEstadoSolicitud := TFrmEstadoSolicitud.Create(self);
        FrmEstadoSolicitud.solicitud_aprobada

end;

procedure TfrmMain.Analista;
begin
        CDreporte.CancelUpdates;
        with IBQuery2 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$solicitudanalista".ID_SOLICITUD,');
          SQL.Add('"gen$persona".NOMBRE || '' '' || "gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO AS NOMBRE,');
          SQL.Add('"col$solicitud".VALOR_SOLICITADO,');
          SQL.Add('"col$solicitudanalista".FECHAHORA,');
          SQL.Add('"col$solicitudanalista".ID_EMPLEADO,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"gen$empleado".NOMBRE || '' '' || "gen$empleado".PRIMER_APELLIDO || '' '' || "gen$empleado".SEGUNDO_APELLIDO  AS EMPLEADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitudanalista"');
          SQL.Add('INNER JOIN "col$solicitud" ON ("col$solicitudanalista".ID_SOLICITUD="col$solicitud".ID_SOLICITUD)');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('AND ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('INNER JOIN "gen$empleado" ON ("gen$empleado".ID_EMPLEADO="col$solicitudanalista".ID_EMPLEADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ESTADO IN (1,2,3,8,9,13)) AND');
          SQL.Add('("col$solicitudanalista".ES_VIGENTE = 1)');
          SQL.Add('order by "col$solicitudanalista".ID_EMPLEADO,"col$solicitudanalista".FECHAHORA');
          Close;
          Open;
          while not eof do
          begin
            CDreporte.Append;
            CDreporte.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString + '-1';
            CDreporte.FieldValues['nombres'] := FieldByName('NOMBRE').AsString;
            CDreporte.FieldValues['valor'] := FieldByName('VALOR_SOLICITADO').AsCurrency;
            CDreporte.FieldValues['empleado'] := FieldByName('EMPLEADO').AsString;
            CDreporte.FieldValues['fecha'] := FieldByName('FECHAHORA').AsDateTime;
            CDreporte.Post;
            Next;
          end;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$solicitudanalistaof".ID_AGENCIA,');
          SQL.Add('"col$solicitudanalistaof".ID_SOLICITUD,');
          SQL.Add('"col$solicitudanalistaof".FECHA_HORA,');
          SQL.Add('"col$solicitudanalistaof".NOMBRES,');
          SQL.Add('"col$solicitudanalistaof".VALOR,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$empleado".NOMBRE');
          SQL.Add('FROM');
          SQL.Add('"col$solicitudanalistaof"');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$solicitudanalistaof".ID_EMPLEADO="gen$empleado".ID_EMPLEADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudanalistaof".ES_VIGENTE = 1)');
          Open;
          while not Eof do
          begin
            CDreporte.Append;
            CDreporte.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString + '-' + FieldByName('ID_AGENCIA').AsString;
            CDreporte.FieldValues['nombres'] := FieldByName('NOMBRES').AsString;
            CDreporte.FieldValues['valor'] := FieldByName('VALOR').AsCurrency;
            CDreporte.FieldValues['empleado'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            CDreporte.FieldValues['fecha'] := FieldByName('FECHA_HORA').AsDateTime;
            CDreporte.Post;
            Next;
          end;
        end;

        imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitud1.frf');

end;

procedure TfrmMain.Prueba1Click(Sender: TObject);
begin
        analista
end;

procedure TfrmMain.Ocaa1Click(Sender: TObject);
begin
        with IBanalisis do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          Open;
        end;
        imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitud.frf');

end;

procedure TfrmMain.General1Click(Sender: TObject);
Begin
        vMensaje := '';
        if 1=1 then//ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
        CdAnalisis.CancelUpdates;
          with IBanalisis do
          begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            Close;
            Open;
            while not Eof do
            begin
              CdAnalisis.Append;
              CdAnalisis.FieldValues['nombre'] := FieldByName('NOMBRE').AsString;
              CdAnalisis.FieldValues['analista'] := FieldByName('EMPLEADO').AsString;
              CdAnalisis.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString + '-1';
              CdAnalisis.FieldValues['fecha'] := FieldByName('FECHAHORA').AsDateTime;
              if FieldByName('PENDIENTE').AsInteger = 0 then
              begin
                CdAnalisis.FieldValues['valor_solicitado'] := FieldByName('VALOR_SOLICITADO').AsCurrency;
                CdAnalisis.FieldValues['v_solicitado'] := currtostrf(FieldByName('VALOR_SOLICITADO').AsCurrency,ffnumber,2);
                CdAnalisis.FieldValues['valor_pendiente'] := 0;
              end
              else
              begin
                CdAnalisis.FieldValues['valor_solicitado'] := 0;
                CdAnalisis.FieldValues['v_pendiente'] := currtostrf(FieldByName('VALOR_SOLICITADO').AsCurrency,ffnumber,2);
                CdAnalisis.FieldValues['valor_pendiente'] := FieldByName('VALOR_SOLICITADO').AsCurrency;
              end;
              CdAnalisis.FieldValues['id_empleado'] := FieldByName('ID_EMPLEADO').AsString;
              CdAnalisis.Append;
              Next;
            end;
          end;
          with IbAgencias do
          begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          Open;
          while not Eof do
          begin
              CdAnalisis.Append;
              CdAnalisis.FieldValues['nombre'] := FieldByName('NOMBRES').AsString;
              CdAnalisis.FieldValues['analista'] := FieldByName('EMPLEADO').AsString;
              CdAnalisis.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString + '-' + FieldByName('ID_AGENCIA').AsString;
              CdAnalisis.FieldValues['fecha'] := FieldByName('FECHA_HORA').AsDateTime;
              CdAnalisis.FieldValues['valor_solicitado'] := 0;
              CdAnalisis.FieldValues['v_solicitado'] := currtostrf(FieldByName('VALOR').AsCurrency,ffnumber,2);
              CdAnalisis.FieldValues['valor_pendiente'] := 0;
              CdAnalisis.FieldValues['id_empleado'] := FieldByName('ID_EMPLEADO').AsString;
              CdAnalisis.Post;
              Next;
          end;
        end;
        //informacion de las oficinas
        with IBagencia do
        begin
          Close;
          Open;                         
          while not Eof DO
          begin
            AnaOficinas(buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vPuerto,FieldByName('ID_AGENCIA').AsInteger,FieldByName('DESCRIPCION_AGENCIA').AsString,buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vHost);
            Next;
          end;
       end;

          //imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitud.frf');
          
          {AnaOficinas(puerto_abrego,2,'ABREGO',host_abrego);
          AnaOficinas(puerto_convencion,3,'CONVENCION',host_convencion);
          AnaOficinas(puerto_aguachica,4,'AGUACHICA',host_aguachica);}
          if vMensaje <> '' then
             MessageDlg('No se Logro Comunicacion con las Agencia(s) ' + vMensaje,mtInformation,[mbok],0);
          imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitudPen.frf');
       end;
end;

procedure TfrmMain.CarteraporTasas1Click(Sender: TObject);
begin
        frmInformeTasasConsolidado := TfrmInformeTasasConsolidado.Create(Self);
        frmInformeTasasConsolidado.ShowModal;
end;

procedure TfrmMain.InformedeAsociadosHabilesInHabiles1Click(
  Sender: TObject);
var
  frmInformeAsociadosHabilesInHabiles:TfrmInformeAsociadosHabilesInHabiles;
begin
      frmInformeAsociadosHabilesInHabiles := TfrmInformeAsociadosHabilesInHabiles.Create(Self);
      frmInformeAsociadosHabilesInHabiles.ShowModal;
end;
procedure TfrmMain.SolicitudesenSecciondeCreditos1Click(Sender: TObject);
begin
          SolicitudCreditos;
end;

procedure TfrmMain.SolicitudCreditos;
begin
        CDsolicitud.CancelUpdates;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$solicitudempleado".ID_EMPLEADO,');
          SQL.Add('"col$solicitudempleado".ID_SOLICITUD,');
          SQL.Add('"gen$empleado".NOMBRE,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"col$solicitudempleado".ENTREGADO,');
          SQL.Add('"col$solicitud".VALOR_SOLICITADO,');
          SQL.Add('"col$solicitudempleado".FECHAHORA,');
          SQL.Add('"gen$persona".NOMBRE AS NOMBRE1,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1');
          SQL.Add('FROM');
          SQL.Add('"col$solicitudempleado"');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$solicitudempleado".ID_EMPLEADO="gen$empleado".ID_EMPLEADO)');
          SQL.Add('INNER JOIN "col$solicitud" ON ("col$solicitudempleado".ID_SOLICITUD="col$solicitud".ID_SOLICITUD)');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('AND ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudempleado".ENTREGADO = 0) and ("col$solicitud".ESTADO IN (1,2,3,13))');
          Open;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Max := RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Titulo := 'Solicitudes en Sección Creditos';
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Analizando Solicitud No: ' + FieldByName('ID_SOLICITUD').AsString;
            Application.ProcessMessages;
            IBSQL1.Close;
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('SELECT');
            IBSQL1.SQL.Add('COUNT(ID_SOLICITUD) AS CONTEO');
            IBSQL1.SQL.Add('FROM');
            IBSQL1.SQL.Add('"col$solicitudanalista"');
            IBSQL1.SQL.Add('WHERE ES_VIGENTE = 1 AND ID_SOLICITUD = :ID_SOLICITUD');
            IBSQL1.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
            IBSQL1.ExecQuery;
            if IBSQL1.FieldByName('CONTEO').AsInteger = 0 then
            begin
              CDsolicitud.Append;
              CDsolicitudid_solicitud.Value := FieldByName('ID_SOLICITUD').AsString;
              CDsolicitudempleado.Value := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
              CDsolicitudasociado.Value := FieldByName('NOMBRE1').AsString + ' ' + FieldByName('PRIMER_APELLIDO1').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO1').AsString;
              CDsolicitudvalor.Value := FieldByName('VALOR_SOLICITADO').AsCurrency;
              CDsolicitudfecha.Value := FieldByName('FECHAHORA').AsDateTime;
              CDsolicitudagencia.Value := 'Ocaña';
              CDsolicitud.Post
            end;
            Next;
          end;
          frmProgreso.Cerrar;
        end;
        agencias(host_abrego,'Abrego',puerto_abrego,2);
        agencias(host_convencion,'Convención',puerto_convencion,3);
        agencias(host_aguachica,'Aguachica',puerto_aguachica,4);
        if CDsolicitud.RecordCount = 0 then
        begin
          MessageDlg('No Existen Registros Para Mostrar',mtInformation,[mbok],0);
          Exit;
        end;
        imprimir_reporte(ruta1 + '\Reporte\RepCreditos.frf');
end;


procedure TfrmMain.SolicitudesAnuladas1Click(Sender: TObject);
begin
          FrmSolicitudAnulada := TFrmSolicitudAnulada.Create(self);
          FrmSolicitudAnulada.ShowModal;
end;

procedure TfrmMain.DesembolososporEmpleado1Click(Sender: TObject);
begin
          frmInformeDesembolsosxempleado := TfrmInformeDesembolsosxempleado.Create(Self);
          frmInformeDesembolsosxempleado.ShowModal;
end;

procedure TfrmMain.LineasvsTotalCartera1Click(Sender: TObject);
var
  frmLineasVsCartera:TfrmLineasVsCartera;
begin
        frmLineasVsCartera:=TfrmLineasVsCartera.Create(Self);
        frmLineasVsCartera.ShowModal;
end;

procedure TfrmMain.ColocacionesenAbogados1Click(Sender: TObject);
begin
        frmRCarteraAbogados := TfrmRCarteraAbogados.Create(Self);
        frmRCarteraAbogados.ShowModal;
end;

procedure TfrmMain.InformacinCrditosEmpleado1Click(Sender: TObject);
begin
        CdCreditos.CancelUpdates;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        with IBempleado do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          Open;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Max := RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Titulo := 'Espere un Momento ...';
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'registro No: ' + IntToStr(RecNo);
            Application.ProcessMessages;
            IBColocacion.Close;
            IBColocacion.ParamByName('ID_PERSONA').AsString := FieldByName('nit').AsString;
            IBColocacion.ParamByName('NUMERO_CUENTA').AsInteger := fieldbyname('numero_cuenta').AsInteger;
            IBColocacion.Open;
            while not IBColocacion.Eof do
            begin
              CdCreditos.Append;
              CdCreditos.FieldValues['id_identificacion'] := IBColocacion.FieldByName('ID_IDENTIFICACION').AsInteger;
              CdCreditos.FieldValues['id_persona']:= IBColocacion.FieldByName('ID_PERSONA').AsString;
              CdCreditos.FieldValues['nombres']:= FieldByName('nombre').AsString + ' ' + FieldByName('apellido').AsString;
              CdCreditos.FieldValues['id_colocacion'] := IBColocacion.FieldByName('ID_COLOCACION').AsString;
              CdCreditos.FieldValues['cuota'] := IBColocacion.FieldByName('VALOR_CUOTA').AsCurrency;
              CdCreditos.FieldValues['desembolso'] := IBColocacion.FIELDBYNAME('VALOR_DESEMBOLSO').AsCurrency;
              CdCreditos.FieldValues['saldo'] := IBColocacion.FieldByName('SALDO').AsCurrency;
              CdCreditos.FieldValues['cuenta'] := IBColocacion.FieldByName('NUMERO_CUENTA').AsCurrency;
              CdCreditos.FieldValues['fecha'] := IBColocacion.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
              CdCreditos.FieldValues['plazo'] := IBColocacion.FieldByName('PLAZO_COLOCACION').AsInteger;
              CdCreditos.Post;
              IBColocacion.Next;
            end;
            Next;
          end;// fin del while de empleado
          frmProgreso.Cerrar;
        end;// fin del ibempleado
        frReport2.ShowReport

end;

procedure TfrmMain.SaldosenCaja1Click(Sender: TObject);
begin
        FrmSaldosCaja := TFrmSaldosCaja.Create(Self);
        FrmSaldosCaja.ShowModal
end;

procedure TfrmMain.SumatoriaConsolidada1Click(Sender: TObject);
begin
        FrmPlanillaConsolidada := TFrmPlanillaConsolidada.Create(Self);
        FrmPlanillaConsolidada.ShowModal;
end;

procedure TfrmMain.MovimientosdeCaja1Click(Sender: TObject);
var frmInformeCajaAuditoria:TfrmInformeCajaAuditoria;
begin
    frmInformeCajaAuditoria := TfrmInformeCajaAuditoria.Create(Self);
    frmInformeCajaAuditoria.ShowModal;
end;

procedure TfrmMain.Cambios1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

procedure TfrmMain.RequisitoSistemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;

end;

procedure TfrmMain.ConsultaCajas1Click(Sender: TObject);
begin
        FrmConsultaCajas := TFrmConsultaCajas.Create(Self);
        FrmConsultaCajas.ShowModal;
end;

procedure TfrmMain.agencias(host_r, dagencia: string; puerto,
  vIdAgencia: integer);
var     sentencia :string;
        AList,AListCampos:TList;
        cadena :string;
        i :Integer;
    XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo,nodo1 :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;

begin
        sentencia :=  ' SELECT ' +
                      ' "col$solicitudempleado".ID_EMPLEADO,' +
                      ' "col$solicitudempleado".ID_SOLICITUD,' +
                      ' "gen$empleado".NOMBRE,' +
                      ' "gen$empleado".SEGUNDO_APELLIDO,' +
                      ' "gen$empleado".PRIMER_APELLIDO,' +
                      ' "col$solicitudempleado".ENTREGADO,' +
                      ' "col$solicitud".VALOR_SOLICITADO,' +
                      ' "col$solicitudempleado".FECHAHORA,' +
                      ' "gen$persona".NOMBRE AS NOMBRE1,' +
                      ' "gen$persona".PRIMER_APELLIDO AS PRIMER_APELLIDO1,' +
                      ' "gen$persona".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1' +
                      ' FROM' +
                      ' "col$solicitudempleado"' +
                      ' INNER JOIN "gen$empleado" ON ("col$solicitudempleado".ID_EMPLEADO="gen$empleado".ID_EMPLEADO)' +
                      ' INNER JOIN "col$solicitud" ON ("col$solicitudempleado".ID_SOLICITUD="col$solicitud".ID_SOLICITUD)' +
                      ' INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)' +
                      ' AND ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)' +
                      ' WHERE' +
                      ' ("col$solicitudempleado".ENTREGADO = 0) and ("col$solicitud".ESTADO IN (1,2,3,13))';
         XmlPetc := TsdXmlDocument.CreateName('query_info');
         XmlPetc.XmlFormat := xfReadable;
         Nodo := XmlPetc.Root.NodeNew('querys');
         Nodo1 := Nodo.NodeNew('query');
         Nodo1.WriteString('tipo','select');
         nodo1.WriteString('sentencia',sentencia);
         XmlresC := TsdXmlDocument.Create;
         XmlresC.EncodingString := 'ISO8859-1';
         XmlresC.XmlFormat := xfReadable;
         Astream := TMemoryStream.Create;
         XmlPetC.SaveToStream(Astream);
           with IdTCPClient1 do
           begin
             Port := Puerto;
             Host := Host_r;
             try
               Application.ProcessMessages;
               Connect;
             except
             on e: Exception do
             begin
                Application.ProcessMessages;
                MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
                frmProgreso.Cerrar;
                Disconnect;
                Exit;
             end;
           end;
           if Connected then
           begin
                frmProgreso := TfrmProgreso.Create(self);
                frmProgreso.Ejecutar;
                frmProgreso.Titulo := 'Recibiendo Informacion de ' + DAgencia;// + Desc_Agencia;
                frmProgreso.InfoLabel := 'Espere un Momento por Favor ...';
                frmProgreso.Min := 0;
                frmProgreso.Position := 50;
                Application.ProcessMessages;
                //Cadena := ReadLn();
                try
                Cadena := ReadLn();
                AStream := TMemoryStream.Create;
                XmlPetC.SaveToStream(AStream);
                WriteInteger(AStream.Size);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                FreeAndNil(AStream);
                tamano := ReadInteger;
                AStream := TMemoryStream.Create;
                ReadStream(Astream,tamano,False);
                XmlResc.LoadFromStream(AStream);
                Disconnect;
                frmProgreso.Cerrar;
                except
                begin
                  Disconnect;
                  frmProgreso.Cerrar;
                  Exit;
                end;
                //end;
                end;
           end;
           end;
           AList := TList.Create;
           Nodo := XmlResc.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
              AListCampos := TList.Create;
              TXmlNode(AList[i]).NodesByName('campo',AListCampos);
              with IBQuery2 do
              begin
                Close;
                SQL.Clear;
                SQL.Add('SELECT ');
                SQL.Add('COUNT(ID_SOLICITUD) AS CONTEO');
                SQL.Add('FROM');
                SQL.Add('"col$solicitudanalistaof"');
                SQL.Add('WHERE');
                SQL.Add('(ID_SOLICITUD = :ID_SOLICITUD AND ID_AGENCIA = :ID_AGENCIA)');
                ParamByName('ID_SOLICITUD').AsString := TXmlNode(AListCampos[1]).ValueAsString;
                ParamByName('ID_AGENCIA').AsInteger := vIdAgencia;
                Open;
                if FieldByName('CONTEO').AsInteger = 0 then
                begin
                  CDsolicitud.Append;
                  CDsolicitudid_solicitud.Value := TXmlNode(AListCampos[1]).ValueAsString;
                  CDsolicitudempleado.Value := TXmlNode(AListCampos[2]).ValueAsString + ' ' + TXmlNode(AListCampos[4]).ValueAsString + ' ' + TXmlNode(AListCampos[3]).ValueAsString;
                  CDsolicitudasociado.Value := TXmlNode(AListCampos[8]).ValueAsString + ' ' + TXmlNode(AListCampos[10]).ValueAsString + ' ' + TXmlNode(AListCampos[9]).ValueAsString;
                  CDsolicitudvalor.Value := TXmlNode(AListCampos[6]).ValueAsFloat;
                  CDsolicitudfecha.Value := TXmlNode(AListCampos[7]).ValueAsDateTime;
                  CDsolicitudagencia.Value := dagencia;
                  CDsolicitud.Post
                end;
              end;
              //TXmlNode(AListCampos[2]).ValueAsInteger,TXmlNode(AListCampos[0]).ValueAsFloat,agencia,TXmlNode(AListCampos[1]).ValueAsString);
           end;


end;

procedure TfrmMain.AnaOficinas(puerto, id_agencia: integer; DesAgencia,
  hostp: string);
var     sentencia :string;
        AList,AListCampos:TList;
        cadena :string;
        i :Integer;
begin
        sentencia := ' SELECT' +
                     '   "col$solicitudanalista".ID_SOLICITUD,' +
                     '   "gen$persona".NOMBRE || '' '' || "gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO AS NOMBRE,' +
                     '   "col$solicitud".VALOR_SOLICITADO,' +
                     '   "col$solicitudanalista".FECHAHORA,' +
                     '   "col$solicitudanalista".ID_EMPLEADO,' +
                     '   "gen$persona".ID_PERSONA,' +
                     '   "gen$empleado".NOMBRE || '' '' || "gen$empleado".PRIMER_APELLIDO || '' '' || "gen$empleado".SEGUNDO_APELLIDO  AS EMPLEADO,' +
                     '   "col$solicitudanalista".ID_EMPLEADO, "col$solicitudanalista".PENDIENTE' +
                     ' FROM' +
                     '  "col$solicitudanalista"' +
                     '  INNER JOIN "col$solicitud" ON ("col$solicitudanalista".ID_SOLICITUD="col$solicitud".ID_SOLICITUD)' +
                     '  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)' +
                     '   AND ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)' +
                     '  INNER JOIN "gen$empleado" ON ("gen$empleado".ID_EMPLEADO="col$solicitudanalista".ID_EMPLEADO)' +
                     ' WHERE' +
                     '   ("col$solicitud".ESTADO IN (1,2,3,8,9,13)) AND' +
                     '   ("col$solicitudanalista".ES_VIGENTE = 1)' +
                     '   order by "col$solicitudanalista".ID_EMPLEADO,"col$solicitudanalista".FECHAHORA';
         XmlPetc := TsdXmlDocument.CreateName('query_info');
         XmlPetc.XmlFormat := xfReadable;
         Nodo := XmlPetc.Root.NodeNew('querys');
         Nodo1 := Nodo.NodeNew('query');
         Nodo1.WriteString('tipo','select');
         nodo1.WriteString('sentencia',sentencia);
         XmlresC := TsdXmlDocument.Create;
         XmlresC.EncodingString := 'ISO8859-1';
         XmlresC.XmlFormat := xfReadable;
         Astream := TMemoryStream.Create;
         XmlPetC.SaveToStream(Astream);
           with IdTCPClient1 do
           begin
             Port := Puerto;
             Host := Hostp;
             try
               Application.ProcessMessages;
               Connect;
             except
             on e: Exception do
             begin
                Application.ProcessMessages;
                //MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
                frmProgreso.Cerrar;
                Disconnect;
                vMensaje := vMensaje + ' , ' + DesAgencia;

                Exit;
             end;
           end;
           if Connected then
           begin
                frmProgreso := TfrmProgreso.Create(self);
                frmProgreso.Ejecutar;
                frmProgreso.Titulo := 'Recibiendo Informacion de ' + desagencia;// + Desc_Agencia;
                frmProgreso.InfoLabel := 'Espere un Momento por Favor ...';
                frmProgreso.Min := 0;
                frmProgreso.Position := 50;
                Application.ProcessMessages;
                try
                  Cadena := ReadLn();
                  AStream := TMemoryStream.Create;
                  XmlPetC.SaveToStream(AStream);
                  WriteInteger(AStream.Size);
                  OpenWriteBuffer;
                  WriteStream(Astream);
                  CloseWriteBuffer;
                  FreeAndNil(AStream);
                  tamano := ReadInteger;
                  AStream := TMemoryStream.Create;
                  ReadStream(Astream,tamano,False);
                  XmlResc.LoadFromStream(AStream);
                  Disconnect;
                  frmProgreso.Cerrar;
                except
                begin
                  Disconnect;
                  frmProgreso.Cerrar;
                     vMensaje := vMensaje + ' , ' + DesAgencia;
                  Exit;
                end;
                end;
           end;
           end;
           AList := TList.Create;
           Nodo := XmlResc.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
              AListCampos := TList.Create;
              TXmlNode(AList[i]).NodesByName('campo',AListCampos);
              CdAnalisis.Append;
              CdAnalisis.FieldValues['nombre'] := TXmlNode(AListCampos[1]).ValueAsString;
              CdAnalisis.FieldValues['analista'] := TXmlNode(AListCampos[6]).ValueAsString;
              CdAnalisis.FieldValues['solicitud'] := TXmlNode(AListCampos[0]).ValueAsString + '-' + IntToStr(id_agencia);
              CdAnalisis.FieldValues['fecha'] := TXmlNode(AListCampos[3]).ValueAsString;
              CdAnalisis.FieldValues['id_empleado'] := TXmlNode(AListCampos[7]).ValueAsString;
              if TXmlNode(AListCampos[8]).ValueAsInteger = 0 then
              begin
                CdAnalisis.FieldValues['valor_solicitado'] := TXmlNode(AListCampos[2]).ValueAsFloat;
                CdAnalisis.FieldValues['v_solicitado'] := currtostrf(TXmlNode(AListCampos[2]).ValueAsFloat,ffnumber,2);
                CdAnalisis.FieldValues['valor_pendiente'] := 0;
              end
              else
              begin
                CdAnalisis.FieldValues['valor_solicitado'] := 0;
                CdAnalisis.FieldValues['v_pendiente'] := currtostrf(TXmlNode(AListCampos[2]).ValueAsFloat,ffnumber,2);
                CdAnalisis.FieldValues['valor_pendiente'] := TXmlNode(AListCampos[2]).ValueAsFloat;
              end;
              CdAnalisis.post;


              //insertar(id_agencia,TXmlNode(AListCampos[2]).ValueAsInteger,TXmlNode(AListCampos[0]).ValueAsFloat,agencia,TXmlNode(AListCampos[1]).ValueAsString);}
           end;



end;

procedure TfrmMain.CorregirColocacin1Click(Sender: TObject);
begin
        FrmCorregirColocacion := TFrmCorregirColocacion.Create(Self);
        FrmCorregirColocacion.ShowModal;
end;

procedure TfrmMain.EliminarDocumento1Click(Sender: TObject);
begin
        FrmEliminaDocumento := TFrmEliminaDocumento.Create(Self);
        FrmEliminaDocumento.ShowModal; 
end;

procedure TfrmMain.CambiarEstadoSolicitud1Click(Sender: TObject);
begin
        FrmActualizaSolicitud := TFrmActualizaSolicitud.Create(Self);
        FrmActualizaSolicitud.ShowModal;
end;

procedure TfrmMain.EliminarMovimientoCaja1Click(Sender: TObject);
begin
        FrmEliminaMovimiento := TFrmEliminaMovimiento.Create(Self);
        FrmEliminaMovimiento.ShowModal;
end;

procedure TfrmMain.EliminarMovimientoRemoto1Click(Sender: TObject);
begin
        FrmEliminaMovimientoRemoto := TFrmEliminaMovimientoRemoto.Create(self);
        FrmEliminaMovimientoRemoto.ShowModal;
end;

procedure TfrmMain.AbrirNotaContable2Click(Sender: TObject);
begin
        FrmAbrirNota := TFrmAbrirNota.Create(Self);
        FrmAbrirNota.ShowModal;
end;

procedure TfrmMain.EliminarAyudadeSolidaridad1Click(Sender: TObject);
begin
        FrmEliminaAyuda := TFrmEliminaAyuda.Create(Self);
        FrmEliminaAyuda.ShowModal;
end;

procedure TfrmMain.EliminarDescuentoCrditoparaDesembolso1Click(
  Sender: TObject);
begin
        FrmEliminaDescuento := TFrmEliminaDescuento.Create(Self);
        FrmEliminaDescuento.ShowModal;        
end;

procedure TfrmMain.EliminarAbonoporCaja1Click(Sender: TObject);
begin
        FrmEliminaAbonoCaja := TFrmEliminaAbonoCaja.Create(Self);
        FrmEliminaAbonoCaja.ShowModal;
end;

procedure TfrmMain.AbrirNotaContable1Click(Sender: TObject);
begin
        FrmAbrirNotaFun := TFrmAbrirNotaFun.Create(Self);
        FrmAbrirNotaFun.ShowModal;
end;

procedure TfrmMain.CambiosSolicitud1Click(Sender: TObject);
begin
        FrmActualizaSolicitudOf := TFrmActualizaSolicitudOf.Create(Self);
        FrmActualizaSolicitudOf.ShowModal;
end;

end.
