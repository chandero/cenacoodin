unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, ComCtrls,
  jpeg, ExtCtrls, pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery,
  IdBaseComponent, IdComponent, IdTCPConnection, sdXmlDocuments,IdTCPClient, IdTime, DateUtils,
  ToolWin, IBSQL, DBClient, FR_Class, FR_DSet, FR_DBSet;

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
    Consultas1: TMenuItem;
    Colocacion1: TMenuItem;
    VerTablaLiquidacion1: TMenuItem;
    Cartera1: TMenuItem;
    LiquidacindeCuotas1: TMenuItem;
    ConsolidadoDiario1: TMenuItem;
    IBQuery1: TIBQuery;
    LiquidacinManual1: TMenuItem;
    ExtractoColocacion2: TMenuItem;
    CalcularTasas1: TMenuItem;
    IBQuery2: TIBQuery;
    ReversarAbono1: TMenuItem;
    IdTime1: TIdTime;
    ControldeCobro1: TMenuItem;
    LiquidacionManual1: TMenuItem;
    EstadodeCobro1: TMenuItem;
    Informes1: TMenuItem;
    ColocacionesporEstado1: TMenuItem;
    Utilidades1: TMenuItem;
    Mantenimiento1: TMenuItem;
    Barrido1: TMenuItem;
    ExtractoCaptacion1: TMenuItem;
    RecuperarLiquidacin1: TMenuItem;
    ImageList: TImageList;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    BtnExtracto: TToolButton;
    ToolButton3: TToolButton;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    BtnExtractoCredito: TToolButton;
    BtnDescuentoCartera: TToolButton;
    ToolButton1: TToolButton;
    AgregarCostas1: TMenuItem;
    CambiarContrasea1: TMenuItem;
    ConsultasGerenciales1: TMenuItem;
    Ocultas1: TMenuItem;
    Liquidacin1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    CmdControlCobro: TToolButton;
    ToolButton6: TToolButton;
    Gestiones1: TMenuItem;
    ResumenCartera1: TMenuItem;
    ConsultaColocacionesAhorros1: TMenuItem;
    N8: TMenuItem;
    ReporteAsociadosporMunicipio1: TMenuItem;
    MarcarProrroga1: TMenuItem;
    Timer1: TTimer;
    LiquidaciondePrueba1: TMenuItem;
    Timer2: TTimer;
    ConsultaEscritura1: TMenuItem;
    ReporteGeneralColocaciones1: TMenuItem;
    N9: TMenuItem;
    ComprobantesContables1: TMenuItem;
    LiquidacionCastigada1: TMenuItem;
    Balance1: TMenuItem;
    CausacinyProvisindeCartera1: TMenuItem;
    ReporteCreditosCancelados1: TMenuItem;
    ConsultaDeduccionesAseguradora1: TMenuItem;
    Observaciones1: TMenuItem;
    ImpresindeBarrido1: TMenuItem;
    N11: TMenuItem;
    Abogados1: TMenuItem;
    MantenimientodeAbogados1: TMenuItem;
    AsignacindeAbogados1: TMenuItem;
    Cartera2: TMenuItem;
    ColocacionesenAbogados1: TMenuItem;
    Creditos1: TMenuItem;
    IBSQL1: TIBSQL;
    LiquidacindePrueba1: TMenuItem;
    ConsultadeSolicitud1: TMenuItem;
    ControlCarta1: TMenuItem;
    LiquidacionDesembolso1: TMenuItem;
    N7: TMenuItem;
    DiasEntreFechas1: TMenuItem;
    N10: TMenuItem;
    ListadosConsolidados1: TMenuItem;
    N12: TMenuItem;
    ReversionesdeCartera1: TMenuItem;
    EndosoPagares1: TMenuItem;
    ColocacionesEndosadas1: TMenuItem;
    CargarPagares1: TMenuItem;
    DecargarPagares1: TMenuItem;
    CambiosdeEstado1: TMenuItem;
    CarteradePrivilegiados1: TMenuItem;
    Lineas: TMenuItem;
    R1: TMenuItem;
    Reporte: TprTxReport;
    CausacionyProvisionDiaria1: TMenuItem;
    N13: TMenuItem;
    SolicitudesSeccionCrditos1: TMenuItem;
    SolicitudesenAnalisis1: TMenuItem;
    SolicitudesAprobadas1: TMenuItem;
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
    IBanalisis: TIBQuery;
    IbAgencias: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    frReport1: TfrReport;
    GeneracionPlanoBancoldex1: TMenuItem;
    CDsolicitud: TClientDataSet;
    CDsolicitudid_solicitud: TStringField;
    CDsolicitudempleado: TStringField;
    CDsolicitudvalor: TCurrencyField;
    CDsolicitudfecha: TDateField;
    CDsolicitudasociado: TStringField;
    CDsolicitudagencia: TStringField;
    frDBDataSet3: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    RecuperacionesdeCartera1: TMenuItem;
    InformeMer1: TMenuItem;
    RequerimientoSIstemas1: TMenuItem;
    DesembolsosDiarios1: TMenuItem;
    EvaluacindeCartera1: TMenuItem;
    CausacinyProvisin1: TMenuItem;
    InformeAseguradora1: TMenuItem;
    RecalculodeCuota1: TMenuItem;
    N14: TMenuItem;
    CarteraConCuotaRecalculada1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure LiquidacindeCuotas1Click(Sender: TObject);
    procedure VerTablaLiquidacion1Click(Sender: TObject);
    procedure LiquidacinManual1Click(Sender: TObject);
    procedure ExtractoColocacion1Click(Sender: TObject);
    procedure Colocacion1Click(Sender: TObject);
    procedure CalcularTasas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConsolidadoDiario1Click(Sender: TObject);
    procedure ReversarAbono1Click(Sender: TObject);
    procedure ConsultaGerencia1Click(Sender: TObject);
    procedure ControldeCobro1Click(Sender: TObject);
    procedure LiquidacionManual1Click(Sender: TObject);
    procedure EstadodeCobro1Click(Sender: TObject);
    procedure ColocacionesporEstado1Click(Sender: TObject);
    procedure BarridodeCartera1Click(Sender: TObject);
    procedure Mantenimiento1Click(Sender: TObject);
    procedure ExtractoCaptacion1Click(Sender: TObject);
    procedure RecuperarLiquidacin1Click(Sender: TObject);
    procedure BtnExtractoClick(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnDescuentoCarteraClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BtnExtractoCreditoClick(Sender: TObject);
    procedure AgregarCostas1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure CmdControlCobroClick(Sender: TObject);
    procedure ResumenCartera1Click(Sender: TObject);
    procedure ConsultaColocacionesAhorros1Click(Sender: TObject);
    procedure ReporteAsociadosporMunicipio1Click(Sender: TObject);
    procedure MarcarProrroga1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LiquidaciondePrueba1Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer2Timer(Sender: TObject);
    procedure ConsultaEscritura1Click(Sender: TObject);
    procedure ReporteGeneralColocaciones1Click(Sender: TObject);
    procedure ComprobantesContables1Click(Sender: TObject);
    procedure LiquidacionCastigada1Click(Sender: TObject);
    procedure CausacinyProvisindeCartera1Click(Sender: TObject);
    procedure ReporteCreditosCancelados1Click(Sender: TObject);
    procedure EstadodeCaptacin1Click(Sender: TObject);
    procedure ConsultaDeduccionesAseguradora1Click(Sender: TObject);
    procedure Observaciones1Click(Sender: TObject);
    procedure ImpresindeBarrido1Click(Sender: TObject);
    procedure MantenimientodeAbogados1Click(Sender: TObject);
    procedure AsignacindeAbogados1Click(Sender: TObject);
    procedure ColocacionesenAbogados1Click(Sender: TObject);
    procedure LiquidacindePrueba1Click(Sender: TObject);
    procedure ConsultadeSolicitud1Click(Sender: TObject);
    procedure ControlCarta1Click(Sender: TObject);
    procedure LiquidacionDesembolso1Click(Sender: TObject);
    procedure DiasEntreFechas1Click(Sender: TObject);
    procedure ListadosConsolidados1Click(Sender: TObject);
    procedure ReversionesdeCartera1Click(Sender: TObject);
    procedure ColocacionesEndosadas1Click(Sender: TObject);
    procedure CargarPagares1Click(Sender: TObject);
    procedure DecargarPagares1Click(Sender: TObject);
    procedure EndosoPagares1Click(Sender: TObject);
    procedure CambiosdeEstado1Click(Sender: TObject);
    procedure CarteradePrivilegiados1Click(Sender: TObject);
    procedure LineasClick(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure CausacionyProvisionDiaria1Click(Sender: TObject);
    procedure ProvisionyCausacion1Click(Sender: TObject);
    procedure SolicitudesenAnalisis1Click(Sender: TObject);
    procedure GeneracionPlanoBancoldex1Click(Sender: TObject);
    procedure SolicitudesSeccionCrditos1Click(Sender: TObject);
    procedure RecuperacionesdeCartera1Click(Sender: TObject);
    procedure InformeMer1Click(Sender: TObject);
    procedure RequerimientoSIstemas1Click(Sender: TObject);
    procedure DesembolsosDiarios1Click(Sender: TObject);
    procedure EvaluacindeCartera1Click(Sender: TObject);
    procedure InformeAseguradora1Click(Sender: TObject);
    procedure RecalculodeCuota1Click(Sender: TObject);
    procedure CarteraConCuotaRecalculada1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
    FUltimaActividad:TDateTime;
    XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo,nodo1 :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;

    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
    procedure AnaOficinas(puerto, id_agencia: integer; DesAgencia,
      hostp: string);
    procedure SolicitudCreditos;
    procedure agencias(host_r, dagencia: string; puerto,
      vIdAgencia: integer);
  public
  ruta1 :string;
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora:TDateTime;
implementation

{$R *.dfm}

uses unitLogin, unitdmGeneral, unitdmColocacion, IniFiles,
     UnitLiquidaciondePrueba, UnitCalculoCuotadePrueba,
     UnitTablaLiquidacion, UnitConsultaColocacion,
     UnitVistaPreliminar,
     UnitExtractoColocacion, UnitCalculoTasas,
     UnitInformeDiarioCartera, UnitReversionAbonoCartera,
     UnitConsultaProductos, UnitGlobales, UnitEnvioJudicialCastigada,
     UnitControlCobroCartera, UnitLiquidacionExtraordinaria1, UnitInformeColocacionesporestado,
     UnitBarridoCartera, UnitCreaciondePersona, UnitConsultaExtractoCaptacion,
     UnitRecuperarLiquidacionColocacion, UnitCargarCostasJudiciales,
     UnitCambiarContrasena, UnitResumenColocaciones, UnitInformeCobroConstante,
     UnitInformeAsociadosporMunicipio, UnitMarcarProrroga,
     UnitLiquidacionCarteraJudicial, UnitReLogin, UnitBuscarEscritura, UnitInformeColocacionFiltrado,
     Unit_Comprobante, UnitLiquidacionCastigada,UnitCausacionColocaciones,
     UnitInformeCreditosCancelados, UnitEstadoCaptacionporCartera,
     UnitInformeAseguradoraCartera, UnitControldeObservaciones, UnitRecuperarBarridoCartera,
     UnitMantenimientoAbogados, UnitAsignacionAbogado, UnitRCarteraAbogados,
     UnitConsultaSol, UnitLiquidacionGral, UnitControlCarta,UnitLiquidacionJudicialDes,
     UnitDiasEntreFechas, UnitColocaciones, UnitReporteReversionCartera,
     UnitEndosoPagare, UnitReporteEndoso, UnitDescargaPagare, UnitReporteCambioEstadoColocacion,
     UnitInformeCarteraPrivilegiados,UnitExtractoCredito, UnitMidificaLinea, UnitCausacionCarteraDiaria,
     UnitPantallaProgreso, UnitImpresion, UnitConsolidarPlanoBancoldex, UnitRecuperacionesCartera,
     UnitInformeAsociadosMercado, UnitCambios, UnitInformeDiarioDesembolsos, UnitEvaluacion, UnitReporteAseguradora,
     UnitGestionColocacion, UnitInformeCuotaRecalculada;

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
    AA,MM,DD,H,M,S,ms:Word;
//    Role:string;
    Dias:Integer;
    Ufecha,Hoy:TDate;
//    frmConectando:TfrmConectando;
begin
  Application.OnMessage := AtraparMensajes;
  ///OJO QUITAR COMENTARIOS
  Timer2.Enabled := False;

  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','100.21.210.24');
    DBPath := ReadString('DBNAME','path','/base/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    _sServerImagen := ReadString('DBNAME','serverimagen','');    
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',1);
    host_abrego := ReadString('CONSULTA','host_abrego','0.0.0.0');
    host_convencion := ReadString('CONSULTA','host_convencion','0.0.0.0');
    host_aguachica := ReadString('CONSULTA','host_aguachica','0.0.0.0');
    puerto_convencion := ReadInteger('CONSULTA','pconvencion',0);
    puerto_abrego := ReadInteger('CONSULTA','pabrego',0);
    puerto_aguachica := ReadInteger('CONSULTA','paguachica',0);
  finally
    free;
  end;
   /// OJO QUITAR COMENTARIOS
     {Timer1.OnTimer(Sender);
     DecodeDateTime(Now,AA,MM,DD,H,M,S,ms);
     H := 00;
     M := 00;
     S := 00;
     ms := 00;
     control_consulta := True;
     Veces := 0;
     /// OJO QUITAR COMENTARIOS
     if IdTime1.DateTime >= EncodeDateTime(AA,MM,DD,H,M,S,ms)  then
      begin }
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'CARTERA';
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

      //end  // QUITAR ; AL QUITAR COMENTARIOS ///fin de Verificacion de hora
     ///OJO QUITAR COMENTARIOS
     {else
       begin
        MessageDlg('No se puede Iniciar el Programa',mtError,[mbOK],0);
        SalirMal := True;
        Exit;
      end;}
    /// OJO QUITAR COMENTARIOS
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
  Ruta := ExtractFilePath(Application.ExeName);
  ruta1 := ruta;
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar SIF',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
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
           end;
          end
}
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

Procedure TfrmMain.LiquidacindeCuotas1Click(Sender: TObject);
var frmCalculoCuotadePrueba: TfrmCalculoCuotadePrueba;
begin
        frmCalculoCuotadePrueba := TfrmCalculoCuotadePrueba.Create(Self);
        frmCalculoCuotadePrueba.ShowModal;
end;

procedure TfrmMain.Colocacion1Click(Sender: TObject);
var frmConsultaColocacion: TfrmConsultaColocacion;
begin
        frmConsultaColocacion := TfrmConsultaColocacion.Create(Self);
        frmConsultaColocacion.ShowModal;
end;

procedure TfrmMain.VerTablaLiquidacion1Click(Sender: TObject);
var frmTablaLiquidacion :TfrmTablaLiquidacion;
begin
        frmTablaLiquidacion := TfrmTablaLiquidacion.Create(Self);
        frmTablaLiquidacion.ShowModal;
end;


procedure TfrmMain.LiquidacinManual1Click(Sender: TObject);
var frmLiquidacionCarteraJudicial : TfrmLiquidacionCarteraJudicial;
//var frmLiquidacionExtraordinaria : tfrmliquidacionextraordinaria;
begin
//        frmliquidacionextraordinaria := TFrmLiquidacionExtraordinaria.Create(Self);
//        frmliquidacionextraordinaria.ShowModal;
        frmLiquidacionCarteraJudicial := TfrmLiquidacionCarteraJudicial.Create(Self);
        frmLiquidacionCarteraJudicial.ShowModal;
end;

procedure TfrmMain.ExtractoColocacion1Click(Sender: TObject);
//var frmExtractoColocacion : TfrmExtractoColocacion;
var frmExtractoCredito : TFrmExtractoCredito;
begin
//        frmExtractoColocacion := TfrmExtractoColocacion.Create(Self);
//        frmExtractoColocacion.ShowModal;
        frmExtractoCredito := TfrmExtractoCredito.Create(Self);
        frmExtractoCredito.ShowModal;
end;

procedure TfrmMain.CalcularTasas1Click(Sender: TObject);
var frmCalculoTasas : TfrmCalculoTasas;
begin
        frmCalculoTasas := TfrmCalculoTasas.Create(Self);
        frmCalculoTasas.ShowModal;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        Self.Caption := 'Módulo de Cartera - ' + DBserver;

        if salirmal then close;
{        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;}
end;

procedure TfrmMain.ConsolidadoDiario1Click(Sender: TObject);
var frmInformeDiarioCartera : TfrmInformeDiarioCartera;
begin
        frmInformeDiarioCartera := TfrmInformeDiarioCartera.Create(Self);
        frmInformeDiarioCartera.ShowModal;
end;

procedure TfrmMain.ReversarAbono1Click(Sender: TObject);
var frmReversionAbonoCartera : TfrmReversionAbonoCartera;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then begin
          frmReversionAbonoCartera := TfrmReversionAbonoCartera.Create(Self);
          frmReversionAbonoCartera.ShowModal;
        end;
end;

procedure TfrmMain.ConsultaGerencia1Click(Sender: TObject);
var frmConsultaProductos : TfrmConsultaProductos;
begin
        frmConsultaProductos := TfrmConsultaProductos.Create(Self);
        frmConsultaProductos.ShowModal;
end;

procedure TfrmMain.ControldeCobro1Click(Sender: TObject);
var FrmControlCobroCartera: TFrmControlCobroCartera;
begin
        FrmControlCobroCartera := TfrmControlCobroCartera.Create(nil);
        FrmControlCobroCartera.Show;
end;

procedure TfrmMain.LiquidacionManual1Click(Sender: TObject);
var frmLiquidacionExtraordinaria1 : TfrmLiquidacionExtraordinaria1;
begin
        frmLiquidacionExtraordinaria1 := TfrmLiquidacionExtraordinaria1.Create(Self);
        frmLiquidacionExtraordinaria1.ShowModal;
end;

procedure TfrmMain.EstadodeCobro1Click(Sender: TObject);
var frmEnvioJudicialCastigada : TfrmEnvioJudicialCastigada;
begin
        frmEnvioJudicialCastigada := TfrmEnvioJudicialCastigada.Create(Self);
        frmEnvioJudicialCastigada.ShowModal;
end;

procedure TfrmMain.ColocacionesporEstado1Click(Sender: TObject);
var frmInformeColocacionesporEstado : TfrmInformeColocacionesporEstado;
begin
        frminformecolocacionesporestado := Tfrminformecolocacionesporestado.Create(Self);
        frminformecolocacionesporestado.ShowModal;
end;

procedure TfrmMain.BarridodeCartera1Click(Sender: TObject);
var frmBarridoCartera : TfrmBarridoCartera;
begin
        Timer2.Enabled := False;
        frmBarridoCartera := TfrmBarridoCartera.Create(Self);
        frmBarridoCartera.ShowModal;
        Timer2.Enabled := True;
end;

procedure TfrmMain.Mantenimiento1Click(Sender: TObject);
var frmCreacionPersona : TfrmCreacionPersona;
begin
        frmCreacionPersona := TfrmCreacionPersona.Create(Self);
        frmCreacionPersona.ShowModal;
end;

procedure TfrmMain.ExtractoCaptacion1Click(Sender: TObject);
var frmConsultaExtractoCaptacion : TfrmConsultaExtractoCaptacion;
begin
        frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
        frmConsultaExtractoCaptacion.Show;
end;

procedure TfrmMain.RecuperarLiquidacin1Click(Sender: TObject);
var frmRecuperarLiquidacionColocacion : TfrmRecuperarLiquidacionColocacion;
begin
        frmRecuperarLiquidacionColocacion := tfrmrecuperarliquidacioncolocacion.Create(Self);
        frmRecuperarLiquidacionColocacion.ShowModal;
end;

procedure TfrmMain.BtnExtractoClick(Sender: TObject);
begin
        ExtractoCaptacion1.Click;
end;

procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMain.BtnDescuentoCarteraClick(Sender: TObject);
begin
        LiquidacindeCuotas1.Click;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.BtnExtractoCreditoClick(Sender: TObject);
begin
        ExtractoColocacion2.Click;
end;

procedure TfrmMain.AgregarCostas1Click(Sender: TObject);
var frmCargarCostasJudiciales : TfrmCargarCostasJudiciales;
begin
        frmcargarcostasjudiciales := tfrmcargarcostasjudiciales.Create(Self);
        frmcargarcostasjudiciales.ShowModal;
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena : TfrmCambiarContrasena;
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.CmdControlCobroClick(Sender: TObject);
begin
        ControldeCobro1.Click;
end;

procedure TfrmMain.ResumenCartera1Click(Sender: TObject);
var frmResumenColocaciones : TfrmResumenColocaciones;
begin
        Timer2.Enabled := False;
        frmResumenColocaciones := TfrmResumenColocaciones.Create(Self);
        frmResumenColocaciones.ShowModal;
        Timer2.Enabled := True;        
end;

procedure TfrmMain.ConsultaColocacionesAhorros1Click(Sender: TObject);
var frmInformeCobroConstante : TfrmInformeCobroConstante;
begin
        frmInformeCobroConstante := TfrmInformeCobroConstante.Create(Self);
        frmInformeCobroConstante.ShowModal;
end;

procedure TfrmMain.ReporteAsociadosporMunicipio1Click(Sender: TObject);
var frmInformeAsociadosporMunicipio : TfrmInformeAsociadosporMunicipio;
begin
        frmInformeAsociadosporMunicipio := TfrmInformeAsociadosporMunicipio.Create(Self);
        frmInformeAsociadosporMunicipio.ShowModal;
end;

procedure TfrmMain.MarcarProrroga1Click(Sender: TObject);
var frmMarcarProrroga : TfrmMarcarProrroga;
begin
        frmMarcarProrroga := TfrmMarcarProrroga.Create(Self);
        frmMarcarProrroga.ShowModal;
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

procedure TfrmMain.LiquidaciondePrueba1Click(Sender: TObject);
var frmLiquidaciondePrueba : TfrmLiquidaciondePrueba;
begin
        frmLiquidaciondePrueba := TfrmLiquidaciondePrueba.Create(Self);
        frmLiquidaciondePrueba.ShowModal;
end;

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
        //FechaHora := fFechaHoraActual;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
        //FechaHora := Date;
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

procedure TfrmMain.ConsultaEscritura1Click(Sender: TObject);
var frmBusquedadeEscritura : TfrmBusquedadeEscritura;
begin
        frmBusquedadeEscritura := TfrmBusquedadeEscritura.Create(Self);
        frmBusquedadeEscritura.ShowModal;
end;

procedure TfrmMain.ReporteGeneralColocaciones1Click(Sender: TObject);
var frmInformeColocacionesFiltrado : TfrmInformeColocacionesFiltrado;
begin
        frmInformeColocacionesFiltrado := TfrmInformeColocacionesFiltrado.Create(Self);
        frmInformeColocacionesFiltrado.ShowModal;
end;

procedure TfrmMain.ComprobantesContables1Click(Sender: TObject);
var frmComprobante:TfrmComprobante;
begin
        frmComprobante := TfrmComprobante.Create(Self);
        frmComprobante.ShowModal;
end;

procedure TfrmMain.LiquidacionCastigada1Click(Sender: TObject);
var frmLiquidacionCastigada:TfrmLiquidacionCastigada;
begin
        frmLiquidacionCastigada := TfrmLiquidacionCastigada.Create(Self);
        frmLiquidacionCastigada.ShowModal;
end;

procedure TfrmMain.CausacinyProvisindeCartera1Click(Sender: TObject);
var frmCausacionColocaciones:TfrmCausacionColocaciones;
begin
        Timer2.Enabled := False;
        frmCausacionColocaciones := TfrmCausacionColocaciones.Create(Self);
        frmCausacionColocaciones.ShowModal;
        Timer2.Enabled := True;            
end;

procedure TfrmMain.ReporteCreditosCancelados1Click(Sender: TObject);
var frmInformeCreditosCancelados : TfrmInformeCreditosCancelados;
begin
        frmInformeCreditosCancelados := TfrmInformeCreditosCancelados.Create(Self);
        frmInformeCreditosCancelados.ShowModal;
end;

procedure TfrmMain.EstadodeCaptacin1Click(Sender: TObject);
var frmEstadoCaptacionporCartera : TfrmEstadoCaptacionporCartera;
begin
        frmEstadoCaptacionporCartera := TfrmEstadoCaptacionporCartera.Create(Self);
        frmEstadoCaptacionporCartera.ShowModal;
end;

procedure TfrmMain.ConsultaDeduccionesAseguradora1Click(Sender: TObject);
var frmInformeAseguradoraCartera : TfrmInformeAseguradoraCartera;
begin
        frmInformeAseguradoraCartera := TfrmInformeAseguradoraCartera.Create(Self);
        frmInformeAseguradoraCartera.ShowModal;
end;

procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones : TfrmControldeObservaciones;
begin
        frmControldeObservaciones := TfrmControldeObservaciones.Create(Self);
        frmControldeObservaciones.ShowModal;
end;

procedure TfrmMain.ImpresindeBarrido1Click(Sender: TObject);
var frmRecuperarBarridoCartera : TfrmRecuperarBarridoCartera;
begin
        frmRecuperarBarridoCartera := TfrmRecuperarBarridoCartera.Create(Self);
        frmRecuperarBarridoCartera.ShowModal;
end;

procedure TfrmMain.MantenimientodeAbogados1Click(Sender: TObject);
var frmMantenimientoAbogados : TfrmMantenimientoAbogados;
begin
        frmMantenimientoAbogados := TfrmMantenimientoAbogados.Create(Self);
        frmMantenimientoAbogados.ShowModal;
end;

procedure TfrmMain.AsignacindeAbogados1Click(Sender: TObject);
var frmAsignacionAbogado : TfrmAsignacionAbogado;
begin
        frmAsignacionAbogado := TfrmAsignacionAbogado.Create(Self);
        frmAsignacionAbogado.ShowModal;
end;

procedure TfrmMain.ColocacionesenAbogados1Click(Sender: TObject);
var frmRCarteraAbogados : TfrmRCarteraAbogados;
begin
        frmRCarteraAbogados := TfrmRCarteraAbogados.Create(Self);
        frmRCarteraAbogados.ShowModal;
end;

procedure TfrmMain.LiquidacindePrueba1Click(Sender: TObject);
var frmLiquidacionGral : TfrmLiquidacionGral;
begin
        frmLiquidacionGral := TfrmLiquidacionGral.Create(Self);
        frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.ConsultadeSolicitud1Click(Sender: TObject);
var frmConsultaSol : TFrmConsultaSol;
begin
        frmConsultaSol := TFrmConsultaSol.Create(Self);
        frmConsultaSol.ShowModal;
end;

procedure TfrmMain.ControlCarta1Click(Sender: TObject);
begin
        FrmControlCarta := TFrmControlCarta.Create(self);
        FrmControlCarta.ShowModal;
end;

procedure TfrmMain.LiquidacionDesembolso1Click(Sender: TObject);
var frmLiquidacionJudicialDes : TfrmLiquidacionJudicialDes;
begin
        frmLiquidacionJudicialDes := TfrmLiquidacionJudicialDes.Create(Self);
        frmLiquidacionJudicialDes.ShowModal;
end;

procedure TfrmMain.DiasEntreFechas1Click(Sender: TObject);
var frmDiasEntreFechas:TfrmDiasEntreFechas;
begin
    frmDiasEntreFechas  := TfrmDiasEntreFechas.Create(Self);
    frmDiasEntreFechas.ShowModal;
end;

procedure TfrmMain.ListadosConsolidados1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          FrmColocacion := TFrmColocacion.Create(self);
          FrmColocacion.ShowModal;
        end;
end;

procedure TfrmMain.ReversionesdeCartera1Click(Sender: TObject);
var frmReporteReversionCartera :TfrmReporteReversionCartera;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          frmReporteReversionCartera := TfrmReporteReversionCartera.Create(Self);
          frmReporteReversionCartera.ShowModal;
        end;
end;

procedure TfrmMain.ColocacionesEndosadas1Click(Sender: TObject);
begin
        FrmReporteEndoso := TFrmReporteEndoso.Create(self);
        FrmReporteEndoso.ShowModal;
end;

procedure TfrmMain.CargarPagares1Click(Sender: TObject);
begin
        FrmEndosoPagare := TFrmEndosoPagare.Create(Self);
        FrmEndosoPagare.ShowModal;

end;

procedure TfrmMain.DecargarPagares1Click(Sender: TObject);
begin
        FrmDescargaPagare := TFrmDescargaPagare.Create(self);
        FrmDescargaPagare.ShowModal;
end;

procedure TfrmMain.EndosoPagares1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then begin
        end;
end;

procedure TfrmMain.CambiosdeEstado1Click(Sender: TObject);
var frmReporteCambioEstadoColocacion : TfrmReporteCambioEstadoColocacion;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          frmReporteCambioEstadoColocacion := TfrmReporteCambioEstadoColocacion.Create(Self);
          frmReporteCambioEstadoColocacion.ShowModal;
        end;
end;
procedure TfrmMain.CarteradePrivilegiados1Click(Sender: TObject);
var frmInformeCarteraPrivilegiados : TfrmInformeCarteraPrivilegiados;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
         begin
           frmInformeCarteraPrivilegiados := TfrmInformeCarteraPrivilegiados.Create(Self);
           frmInformeCarteraPrivilegiados.ShowModal;
         end;
end;

procedure TfrmMain.LineasClick(Sender: TObject);
begin
        FrmModificaLinea := TFrmModificaLinea.Create(self);
        FrmModificaLinea.ShowModal;
end;

procedure TfrmMain.R1Click(Sender: TObject);
begin
           Reporte.LoadPreparedReportFromFile('\\Archivos\publico\RepResumen.pr');
           Reporte.PreviewPreparedReport(True);
end;

procedure TfrmMain.CausacionyProvisionDiaria1Click(Sender: TObject);
var frmCausacionCarteraDiaria : tfrmCausacionCarteraDiaria;
begin
        Timer2.Enabled := False;
        frmCausacionCarteraDiaria := TfrmCausacionCarteraDiaria.Create(Self);
        frmCausacionCarteraDiaria.ShowModal;
        Timer2.Enabled := True;
end;

procedure TfrmMain.ProvisionyCausacion1Click(Sender: TObject);
//var frmCausacionColocaciones1 : TfrmCausacionColocaciones1;
begin
//        frmCausacioncolocaciones1 := frmcausacioncolocaciones1.Create(Self);
//        frmcausacioncolocaciones1.ShowModal;
end;

procedure TfrmMain.SolicitudesenAnalisis1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
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

          //imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitud.frf');
          AnaOficinas(puerto_abrego,2,'ABREGO',host_abrego);
          AnaOficinas(puerto_convencion,3,'CONVENCION',host_convencion);
          imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitudPen.frf');
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
                     '   "col$solicitudanalista".ID_EMPLEADO' +
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
                frmProgreso.Titulo := 'Recibiendo Informacion de ' + desagencia;// + Desc_Agencia;
                frmProgreso.InfoLabel := 'Espere un Momento por Favor ...';
                frmProgreso.Min := 0;
                frmProgreso.Position := 50;
                Application.ProcessMessages;
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
              CdAnalisis.FieldValues['valor_solicitado'] := TXmlNode(AListCampos[2]).ValueAsFloat;
              CdAnalisis.FieldValues['v_solicitado'] := currtostrf(TXmlNode(AListCampos[2]).ValueAsFloat,ffnumber,2);
              CdAnalisis.FieldValues['valor_pendiente'] := 0;
              CdAnalisis.FieldValues['id_empleado'] := TXmlNode(AListCampos[7]).ValueAsString;
              CdAnalisis.post;
              //insertar(id_agencia,TXmlNode(AListCampos[2]).ValueAsInteger,TXmlNode(AListCampos[0]).ValueAsFloat,agencia,TXmlNode(AListCampos[1]).ValueAsString);}
           end;



end;

procedure TfrmMain.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.ModifyPrepared := False;
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TfrmMain.GeneracionPlanoBancoldex1Click(Sender: TObject);
var frmConsolidarPlanoBancoldex : TfrmConsolidarPlanoBancoldex;
begin
        frmConsolidarPlanoBancoldex := TfrmConsolidarPlanoBancoldex.Create(self);
        frmConsolidarPlanoBancoldex.ShowModal;
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
        if CDsolicitud.RecordCount = 0 then
        begin
          MessageDlg('No Existen Registros Para Mostrar',mtInformation,[mbok],0);
          Exit;
        end;
        imprimir_reporte(ruta1 + '\Reporte\RepCreditos.frf');

end;

procedure TfrmMain.agencias(host_r, dagencia: string; puerto,
  vIdAgencia: integer);
var     sentencia :string;
        AList,AListCampos:TList;
        cadena :string;
        i :Integer;
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

procedure TfrmMain.SolicitudesSeccionCrditos1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          SolicitudCreditos;
        end;
end;

procedure TfrmMain.RecuperacionesdeCartera1Click(Sender: TObject);
begin
        frmRecuperacionesCartera := TfrmRecuperacionesCartera.Create(Self);
        frmRecuperacionesCartera.ShowModal;
end;

procedure TfrmMain.InformeMer1Click(Sender: TObject);
begin
//        frmInformeAsociadosporMercado := tfrmInformeAsociadosporMercado.create(Self)
//        frmInformeAsociadosporMercado.ShowModal;
end;

procedure TfrmMain.RequerimientoSIstemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

procedure TfrmMain.DesembolsosDiarios1Click(Sender: TObject);
begin
        frmInformeDiarioDesembolsos := TfrmInformeDiarioDesembolsos.Create(self);
        frmInformeDiarioDesembolsos.ShowModal;
end;

procedure TfrmMain.EvaluacindeCartera1Click(Sender: TObject);
var
  frmEvaluacion : TfrmEvaluacion;
begin
     frmEvaluacion := TfrmEvaluacion.Create(self);
     frmEvaluacion.ShowModal;
end;

procedure TfrmMain.InformeAseguradora1Click(Sender: TObject);
var
  frmReporteAseguradora: TfrmReporteAseguradora;
begin
      frmReporteAseguradora := TfrmReporteAseguradora.Create(self);
      frmReporteAseguradora.ShowModal;
end;

procedure TfrmMain.RecalculodeCuota1Click(Sender: TObject);
var
  frmGestionColocacion: TfrmGestionColocacion;
begin
  frmGestionColocacion := TfrmGestionColocacion.Create(self);
  frmGestionColocacion.ShowModal;

end;

procedure TfrmMain.CarteraConCuotaRecalculada1Click(Sender: TObject);
var
  frmInformeCuotaRecalculada: TfrmInformeCuotaRecalculada;
begin
        frmInformeCuotaRecalculada := TfrmInformeCuotaRecalculada.Create(self);
        frmInformeCuotaRecalculada.ShowModal;
end;

end.
