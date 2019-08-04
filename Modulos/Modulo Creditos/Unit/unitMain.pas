unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  jpeg, ExtCtrls, pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery, DateUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTime,
  ToolWin, IBSQL, DBClient, FR_Class, sdXmlDocuments, FR_DSet, FR_DBSet;

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
    Modulos1: TMenuItem;
    Colocaciones1: TMenuItem;
    ModificarGarantaReal1: TMenuItem;
    Consultas1: TMenuItem;
    Colocacion1: TMenuItem;
    CrearPersona1: TMenuItem;
    IBQuery1: TIBQuery;
    RecuperarInformeColocacin1: TMenuItem;
    CalcularTasas1: TMenuItem;
    IBQuery2: TIBQuery;
    InformeDesembolsosDiarios1: TMenuItem;
    InformeGralColocaciones1: TMenuItem;
    RecuperarTablaLiquidacion1: TMenuItem;
    IdTime1: TIdTime;
    Informes1: TMenuItem;
    ExtractoColocacion1: TMenuItem;
    ConsultaGerencia1: TMenuItem;
    ExtractoCaptacion1: TMenuItem;
    V: TMenuItem;
    ImageList: TImageList;
    ControldeCobro1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    BtnExtractoCredito: TToolButton;
    ToolButton1: TToolButton;
    BtnExtracto: TToolButton;
    ToolButton3: TToolButton;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    BtnGrabarCredito: TToolButton;
    BtnControlCobro: TToolButton;
    ToolButton6: TToolButton;
    Visar1: TMenuItem;
    CambiarContrasea1: TMenuItem;
    Ocultas1: TMenuItem;
    Utilidades1: TMenuItem;
    ConsultasGerenciales1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Gestiones1: TMenuItem;
    GrabarComprobantes1: TMenuItem;
    N7: TMenuItem;
    Timer1: TTimer;
    N8: TMenuItem;
    LiquidacindePrueba1: TMenuItem;
    ReporteColocacionesFiltrado1: TMenuItem;
    ConsultaEscritura1: TMenuItem;
    Timer2: TTimer;
    HojaActualizacindeDatos1: TMenuItem;
    N9: TMenuItem;
    FormularioRequisitos1: TMenuItem;
    ImpresinPagar1: TMenuItem;
    N10: TMenuItem;
    Observaciones1: TMenuItem;
    FormularioSolicitudes1: TMenuItem;
    ActualizarSolictud1: TMenuItem;
    ConsultarSolicitud1: TMenuItem;
    ConsultaEstadoSolicitudes1: TMenuItem;
    N12: TMenuItem;
    VisarColocacin1: TMenuItem;
    GrabarSolicitudPrueba1: TMenuItem;
    VisacindePrueba1: TMenuItem;
    RecuperarDesembolso1: TMenuItem;
    N11: TMenuItem;
    ColocacionesporRangos1: TMenuItem;
    ActuallizarSolicitud1: TMenuItem;
    N13: TMenuItem;
    AnalisisdeCrditos1: TMenuItem;
    IBSQL1: TIBSQL;
    BarridoSolicitudes1: TMenuItem;
    Proceso1: TMenuItem;
    prueba1: TMenuItem;
    InformacindeCrditos1: TMenuItem;
    N15: TMenuItem;
    DesembolsodeCrditos1: TMenuItem;
    GrabarColocacin1: TMenuItem;
    Solicitudes1: TMenuItem;
    SolicitudesAprobadas1: TMenuItem;
    MantenimientoGarantiaReal1: TMenuItem;
    IncluirReal1: TMenuItem;
    N14: TMenuItem;
    BarridoCredivida1: TMenuItem;
    EnvioSolicitudesAnlisis1: TMenuItem;
    IBQuery3: TIBQuery;
    GarantiaREal1: TMenuItem;
    CancelacionCreditosReales1: TMenuItem;
    RegistrarSolicitud1: TMenuItem;
    ObservacinSeccionCreditos1: TMenuItem;
    Credivida1: TMenuItem;
    SolicitudAnalista1: TMenuItem;
    CambiosenelSistema1: TMenuItem;
    SolicitudesenAnlisis1: TMenuItem;
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
    frReport1: TfrReport;
    SolicitudesenCrditos1: TMenuItem;
    CDsolicitud: TClientDataSet;
    CDsolicitudid_solicitud: TStringField;
    CDsolicitudempleado: TStringField;
    CDsolicitudvalor: TCurrencyField;
    CDsolicitudfecha: TDateField;
    CDsolicitudasociado: TStringField;
    CDsolicitudagencia: TStringField;
    frDBDataSet2: TfrDBDataSet;
    frDBDataSet3: TfrDBDataSet;
    IBagencia: TIBQuery;
    N16: TMenuItem;
    EndosoPagares1: TMenuItem;
    CargarPagare1: TMenuItem;
    DescargarPagare1: TMenuItem;
    N17: TMenuItem;
    PagaresEndosados1: TMenuItem;
    ExencinGMF1: TMenuItem;
    ReporteCrditosBancoldex1: TMenuItem;
    ReporteSolicitudes1: TMenuItem;
    N18: TMenuItem;
    AgregarBancoldex1: TMenuItem;
    ReporteCrecimiento1: TMenuItem;
    HabilitarFIanzas1: TMenuItem;
    VerificarHuella1: TMenuItem;
    N19: TMenuItem;
    ConsultaAgencias1: TMenuItem;
    StatusBar1: TStatusBar;
    RestructurarColocacin1: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure Colocaciones1Click(Sender: TObject);
    procedure Colocacion1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure ModificarGarantaReal1Click(Sender: TObject);
    procedure CrearPersona1Click(Sender: TObject);
    procedure VerTablaLiquidacion1Click(Sender: TObject);
    procedure RecuperarInformeColocacin1Click(Sender: TObject);
    procedure CalcularTasas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InformeDesembolsosDiarios1Click(Sender: TObject);
    procedure InformeGralColocaciones1Click(Sender: TObject);
    procedure RecuperarTablaLiquidacion1Click(Sender: TObject);
    procedure recuperacionEspecial1Click(Sender: TObject);
    procedure RecuperacionEspecial2Click(Sender: TObject);
    procedure ExtractoColocacion1Click(Sender: TObject);
    procedure ConsultaGerencia1Click(Sender: TObject);
    procedure ExtractoCaptacion1Click(Sender: TObject);
    procedure VClick(Sender: TObject);
    procedure BtnExtractoCreditoClick(Sender: TObject);
    procedure ControldeCobro1Click(Sender: TObject);
    procedure BtnGrabarCreditoClick(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnExtractoClick(Sender: TObject);
    procedure BtnConsultaPersonaClick(Sender: TObject);
    procedure BtnControlCobroClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Visar1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure GrabarComprobantes1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LiquidacindePrueba1Click(Sender: TObject);
    procedure ReporteColocacionesFiltrado1Click(Sender: TObject);
    procedure ConsultaEscritura1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure HojaActualizacindeDatos1Click(Sender: TObject);
    procedure FormularioRequisitos1Click(Sender: TObject);
    procedure ImpresinPagar1Click(Sender: TObject);
    procedure Observaciones1Click(Sender: TObject);
    procedure FormularioSolicitudes1Click(Sender: TObject);
    procedure ActualizarSolictud1Click(Sender: TObject);
    procedure ConsultarSolicitud1Click(Sender: TObject);
    procedure ConsultaEstadoSolicitudes1Click(Sender: TObject);
    procedure VisarColocacin1Click(Sender: TObject);
    procedure GrabarSolicitudPrueba1Click(Sender: TObject);
    procedure VisacindePrueba1Click(Sender: TObject);
    procedure RecuperarDesembolso1Click(Sender: TObject);
    procedure ColocacionesporRangos1Click(Sender: TObject);
    procedure ActuallizarSolicitud1Click(Sender: TObject);
    procedure AnalisisdeCrditos1Click(Sender: TObject);
    procedure BarridoSolicitudes1Click(Sender: TObject);
    procedure Proceso1Click(Sender: TObject);
    procedure prueba1Click(Sender: TObject);
    procedure InformacindeCrditos1Click(Sender: TObject);
    procedure SolicitudesAprobadas1Click(Sender: TObject);
    procedure MantenimientoGarantiaReal1Click(Sender: TObject);
    procedure IncluirReal1Click(Sender: TObject);
    procedure BarridoCredivida1Click(Sender: TObject);
    procedure EnvioSolicitudesAnlisis1Click(Sender: TObject);
    procedure GarantiaREal1Click(Sender: TObject);
    procedure CancelacionCreditosReales1Click(Sender: TObject);
    procedure RegistrarSolicitud1Click(Sender: TObject);
    procedure ObservacinSeccionCreditos1Click(Sender: TObject);
    procedure Credivida1Click(Sender: TObject);
    procedure SolicitudAnalista1Click(Sender: TObject);
    procedure CambiosenelSistema1Click(Sender: TObject);
    procedure SolicitudesenAnlisis1Click(Sender: TObject);
    procedure SolicitudesenCrditos1Click(Sender: TObject);
    procedure CargarPagare1Click(Sender: TObject);
    procedure DescargarPagare1Click(Sender: TObject);
    procedure EndosoPagares1Click(Sender: TObject);
    procedure PagaresEndosados1Click(Sender: TObject);
    procedure ExencinGMF1Click(Sender: TObject);
    procedure ReporteCrditosBancoldex1Click(Sender: TObject);
    procedure ReporteSolicitudes1Click(Sender: TObject);
    procedure AgregarBancoldex1Click(Sender: TObject);
    procedure ReporteCrecimiento1Click(Sender: TObject);
    procedure HabilitarFIanzas1Click(Sender: TObject);
    procedure VerificarHuella1Click(Sender: TObject);
    procedure ConsultaAgencias1Click(Sender: TObject);
    procedure RestructurarColocacin1Click(Sender: TObject);
//    procedure visarcolocacion1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
    XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo,nodo1 :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;
    vMensaje :string;
    FUltimaActividad:TDateTime;
    procedure SolicitudCreditos;
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
    procedure agencias(host_r,dagencia: string; puerto,vIdAgencia: integer);
    procedure AnaOficinas(puerto,id_agencia: integer; DesAgencia, hostp: string);
  public
  ruta1,wpath :string;
  published
    procedure imprimir_reporte(cadena: string);
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDateTime;
implementation

{$R *.dfm}

uses unitLogin, unitdmGeneral, unitdmColocacion, IniFiles,
     UnitNuevaColocacion, Unit_RecInformeColocacion,
     UnitCreaciondePersona, UnitActualizaReal,
     UnitTablaLiquidacion, UnitConsultaColocacion,
     UnitVistaPreliminar, UnitCalculoTasas,
     UnitInformeDiarioDesembolsos, UnitInformeGralColocaciones,
     UnitRecuperarTablaLiq, unitExtractoColocacion,
     UnitConsultaProductos, UnitConsultaExtractoCaptacion,
     UnitControlCobroCartera, UnitAgregarObservacion, UnitConsultaLiquidacion,
     UnitCambiarContrasena, Unit_Comprobante, unitCausacionCdat,
     UnitLiquidaciondePrueba, UnitInformeColocacionFiltrado,
     UnitBuscarEscritura, UnitReLogin, UnitImpresionCaptacion,
     UnitSolicitudCre, UnitFormatoPagare, UnitControldeObservaciones,
     UnitInformacion, UnitBuscaSolicitud, UnitConsultaSol, UnitEstadoSolicitud, UnitVisarColocacion,
     UnitDesembolso, UnitVisarDesembolso, UnitRecuperadesembolso,
     UnitRangosColocacion, UnitActualizaSol, UnitAnalisiscre,
     UnitBarridoSolicitudes, UnitLiquidacionGral, UnitPagare, UnitPagarePrueba, UnitMantenimientoGarantiaReal,
     UnitIncluirGarReal, UnitBarridoCredivida, UnitNotificacionSolicitud, UnitPantallaProgreso,
     UnitReporteGarReal, UnitInformeCreditosCanceladosReales, UnitExtractoCredito,
     UnitRegistroSolicitudes, UnitObservacionCreditos, UnitPlanoCredivida,
     UnitSolicituRemota, UnitCambios, UnitImpresion, UnitEndosoPagare,
     UnitDescargaPagare, UnitReporteEndoso,UnitExencionGMF, UnitInformeCreditosBancoldex,
     UnitInformeSolicitudesBancoldex,UnitAgregarCreditosBancoldex,
  UnitDesembolsoTmp, UnitVisarDesembolsoTmp, UnitPlanillaConsolidada,
  UnitHabilitaFianza, UnitValidarHuellaAsociado,UnitConsultaProductosAg, UnitRestructurar;

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
    Dias:Integer;
    Ufecha,Hoy:TDate;
//    frmConectando:TfrmConectando;
begin
  Application.OnMessage := AtraparMensajes;
  Timer2.Enabled := False;
  control_consulta := True;
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
    host_equivida := ReadString('ADICIONALES','host','192.168.200.6');
    puerto_barrido := ReadInteger('ADICIONALES','puerto_barrido',0);
    vRuraCredivida := ReadString('ADICIONALES','ruta','\\Archivos\Publico\Reportes Credivida');
    host_abrego := ReadString('ADICIONALES','host_abrego','0.0.0.0');
    host_convencion := ReadString('ADICIONALES','host_convencion','0.0.0.0');
    host_aguachica := ReadString('ADICIONALES','host_aguachica','0.0.0.0');
    puerto_abrego := ReadInteger('ADICIONALES','puerto_abrego',0);
    puerto_convencion := ReadInteger('ADICIONALES','puerto_convencion',0);
    puerto_aguachica := ReadInteger('ADICIONALES','puerto_aguachica',0);    
  finally
    free;
  end;

     Timer1.OnTimer(Sender);
     DecodeDateTime(Now,AA,MM,DD,H,M,S,ms);
     H := 05;
     M := 40;
     S := 00;
     ms := 00;
     control_consulta := True;
     Veces := 0;
     if Now >= EncodeDateTime(AA,MM,DD,H,M,S,ms)  then
      begin
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'CREDITOS';
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

      end  // fin de Verificacion de hora
     else
      begin
        MessageDlg('No se puede Iniciar el Programa',mtError,[mbOK],0);
        SalirMal := True;
        Exit;
      end;

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
  wpath := ruta1;
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfrmMain.ModificarGarantaReal1Click(Sender: TObject);
var frmActualizaReal: TfrmActualizaReal;
begin
        frmActualizaReal := TfrmActualizaReal.Create(Self);
        frmActualizaReal.ShowModal;
end;

procedure TfrmMain.CrearPersona1Click(Sender: TObject);
var frmCreacionPersona : TfrmCreacionPersona;
begin
        frmCreacionPersona := TfrmCreacionPersona.Create(Self);
        frmCreacionPersona.ShowModal;
end;

procedure TfrmMain.VerTablaLiquidacion1Click(Sender: TObject);
var frmTablaLiquidacion :TfrmTablaLiquidacion;
begin
        frmTablaLiquidacion := TfrmTablaLiquidacion.Create(Self);
        frmTablaLiquidacion.ShowModal;
end;


procedure TfrmMain.RecuperarInformeColocacin1Click(Sender: TObject);
var frmRecuperarInformeColocacion : TfrmRecuperarInformeColocacion;
begin
        frmRecuperarInformeColocacion := TfrmRecuperarInformeColocacion.Create(Self);
        frmRecuperarInformeColocacion.ShowModal;
end;

procedure TfrmMain.CalcularTasas1Click(Sender: TObject);
var frmCalculoTasas : TfrmCalculoTasas;
begin
        frmCalculoTasas := TfrmCalculoTasas.Create(Self);
        frmCalculoTasas.ShowModal;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        Self.Caption := 'Módulo Créditos - ' + DBserver;
        if SalirMal Then Close;
end;


procedure TfrmMain.InformeDesembolsosDiarios1Click(Sender: TObject);
var frmInformeDiarioDesembolsos : TfrmInformeDiarioDesembolsos;
begin
        frmInformeDiarioDesembolsos := TfrmInformeDiarioDesembolsos.Create(Self);
        frmInformeDiarioDesembolsos.ShowModal;
end;

procedure TfrmMain.InformeGralColocaciones1Click(Sender: TObject);
var frmInformeGralColocaciones : TfrmInformeGralColocaciones;
begin
        frmInformeGralColocaciones := TfrmInformeGralColocaciones.Create(Self);
        frmInformeGralColocaciones.ShowModal;
end;

procedure TfrmMain.RecuperarTablaLiquidacion1Click(Sender: TObject);
var frmRecuperarTablaLiq : TfrmRecuperarTablaLiq;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then begin
          frmRecuperarTablaLiq := TfrmRecuperarTablaLiq.Create(Self);
          frmRecuperarTablaLiq.ShowModal;
        end;
end;

procedure TfrmMain.Colocacion1Click(Sender: TObject);
var frmConsultaColocacion: TfrmConsultaColocacion;
begin
        frmConsultaColocacion := TfrmConsultaColocacion.Create(Self);
        frmConsultaColocacion.ShowModal;
end;

procedure TfrmMain.Colocaciones1Click(Sender: TObject);
var frmNuevaColocacion : TfrmNuevaColocacion;
begin
        frmNuevaColocacion := TfrmNuevaColocacion.Create(Self);
        frmNuevaColocacion.ShowModal;
end;

procedure TfrmMain.recuperacionEspecial1Click(Sender: TObject);
//var frmRecuperacionespecial : TfrmRecuperacionEspecial;
begin
 //       frmRecuperacionespecial := TfrmRecuperacionEspecial.Create(Self);
 //       frmrecuperacionespecial.ShowModal;
end;

procedure TfrmMain.RecuperacionEspecial2Click(Sender: TObject);
//var frmRecuperarTablasLiqbisiesto : TfrmRecuperarTablaLiqBisiesto;
begin
 //       frmRecuperarTablaLiqBisiesto := TfrmRecuperarTablaLiqBisiesto.Create(Self);
  //      frmRecuperarTablaLiqBisiesto.ShowModal;
end;
procedure TfrmMain.ExtractoColocacion1Click(Sender: TObject);
//var frmExtractoColocacion : TFrmExtractoColocacion;
var frmExtractoCredito : TfrmExtractoCredito;
begin
//        frmExtractoColocacion := TFrmExtractoColocacion.Create(Self);
//        frmExtractoColocacion.ShowModal;
        frmExtractoCredito := TfrmExtractoCredito.Create(Self);
        frmExtractoCredito.ShowModal;
end;

procedure TfrmMain.ConsultaGerencia1Click(Sender: TObject);
var frmConsultaProductos : TfrmConsultaProductos;
begin
        frmConsultaProductos := TfrmConsultaProductos.Create(Self);
        frmConsultaProductos.ShowModal;
end;

//procedure TfrmMain.visarcolocacion1Click(Sender: TObject);
//var frmvisarColocacion : TfrmVisarColocacion;
//begin
//        frmvisarcolocacion := TfrmVisarColocacion.Create(self);
//        frmvisarcolocacion.ShowModal;
//end;

procedure TfrmMain.ExtractoCaptacion1Click(Sender: TObject);
var frmConsultaExtractoCaptacion : TfrmConsultaExtractoCaptacion;
begin
        frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
        frmConsultaExtractoCaptacion.Show;
end;

procedure TfrmMain.VClick(Sender: TObject);

begin
        frmVisarDesembolsoTmp := TfrmVisarDesembolsoTmp.Create(Self);
        frmVisarDesembolsoTmp.ShowModal;
end;

procedure TfrmMain.ControldeCobro1Click(Sender: TObject);
var frmControlCobroCartera : TfrmControlCobroCartera;
begin
        frmControlCobroCartera := tfrmcontrolcobrocartera.Create(nil);
        frmcontrolcobrocartera.Show;
end;

procedure TfrmMain.BtnExtractoCreditoClick(Sender: TObject);
begin
        ExtractoColocacion1.Click;
end;

procedure TfrmMain.BtnGrabarCreditoClick(Sender: TObject);
begin
        GrabarSolicitudPrueba1.Click;
end;

procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMain.BtnExtractoClick(Sender: TObject);
begin
        ExtractoCaptacion1.Click;
end;

procedure TfrmMain.BtnConsultaPersonaClick(Sender: TObject);
begin
        ConsultaGerencia1.Click;
end;

procedure TfrmMain.BtnControlCobroClick(Sender: TObject);
begin
        ControldeCobro1.Click;        
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
            frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.Visar1Click(Sender: TObject);
begin
        FrmDesembolsoTmp := TFrmDesembolsoTmp.Create(Self);
        FrmDesembolsoTmp.ShowModal;
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena : TfrmCambiarContrasena;
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.GrabarComprobantes1Click(Sender: TObject);
var frmComprobante:TfrmComprobante;
begin
       frmcomprobante := tfrmcomprobante.Create(Self);
       frmcomprobante.ShowModal;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
{
      try
        StatusBar1.Panels[0].Text := 'Servidor de Tiempo: ' + DBServer;
        IdTime1.Host := DBserver;
        IdTime1.SyncTime;
        IdTime1.DateTime;
      finally
        IdTime1.Disconnect;
      end;
}
end;

procedure TfrmMain.LiquidacindePrueba1Click(Sender: TObject);
var frmLiquidaciondePrueba : TfrmLiquidaciondePrueba;
begin
        frmLiquidaciondePrueba := TfrmLiquidaciondePrueba.Create(Self);
        frmLiquidaciondePrueba.ShowModal;
end;

procedure TfrmMain.ReporteColocacionesFiltrado1Click(Sender: TObject);
var frmInformeColocacionesFiltrado : TfrmInformeColocacionesFiltrado;
begin
        frmInformeColocacionesFiltrado := TfrmInformeColocacionesFiltrado.Create(Self);
        frmInformeColocacionesFiltrado.ShowModal;
end;

procedure TfrmMain.ConsultaEscritura1Click(Sender: TObject);
var frmBusquedadeEscritura : TfrmBusquedadeEscritura;
begin
        frmBusquedadeEscritura := TfrmBusquedadeEscritura.Create(Self);
        frmBusquedadeEscritura.ShowModal;
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

procedure TfrmMain.HojaActualizacindeDatos1Click(Sender: TObject);
var frmImpresionCaptacion:TfrmImpresionCaptacion;
begin
    frmImpresionCaptacion := TfrmImpresionCaptacion.Create(Self);
    frmImpresionCaptacion.ShowModal;
end;

procedure TfrmMain.FormularioRequisitos1Click(Sender: TObject);
begin
        FrmSolicitudCre := TFrmSolicitudCre.Create(self);
        FrmSolicitudCre.ShowModal
end;

procedure TfrmMain.ImpresinPagar1Click(Sender: TObject);
var frmFormatoPagare: TfrmFormatoPagare;
begin
{        frmPagare := TfrmPagare.Create(self);
        frmPagare.ShowModal;}
        frmPagarePrueba := TfrmPagarePrueba.Create(Self);
        frmPagarePrueba.ShowModal;
end;

procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones : TfrmControldeObservaciones;
begin
        frmControldeObservaciones := TfrmControldeObservaciones.Create(Self);
        frmControldeObservaciones.ShowModal;
end;

procedure TfrmMain.FormularioSolicitudes1Click(Sender: TObject);
begin
        FrmInformacion := TFrmInformacion.Create(self);
        FrmInformacion.es_adicion := False;
        FrmInformacion.ShowModal;
end;

procedure TfrmMain.ActualizarSolictud1Click(Sender: TObject);
begin
        FrmBuscaSolicitud := TFrmBuscaSolicitud.Create(self);
        FrmBuscaSolicitud.ShowModal;
end;

procedure TfrmMain.ConsultarSolicitud1Click(Sender: TObject);
begin
        FrmConsultaSol := TFrmConsultaSol.Create(Self);
        FrmConsultaSol.ShowModal;
end;

procedure TfrmMain.ConsultaEstadoSolicitudes1Click(Sender: TObject);
begin
        FrmEstadoSolicitud := TFrmEstadoSolicitud.Create(self);
        FrmEstadoSolicitud.ShowModal;
end;

procedure TfrmMain.VisarColocacin1Click(Sender: TObject);
var frmVisarColocacion:TfrmVisarColocacion;
begin
      frmVisarColocacion:= TfrmVisarColocacion.Create(Self);
      frmVisarColocacion.ShowModal;
end;

procedure TfrmMain.GrabarSolicitudPrueba1Click(Sender: TObject);
begin
        FrmDesembolso := TFrmDesembolso.Create(self);
        FrmDesembolso.ShowModal
end;

procedure TfrmMain.VisacindePrueba1Click(Sender: TObject);
begin
        frmVisarDesembolso := TfrmVisarDesembolso.Create(self);
//        frmVisarDesembolso.es_creditos := True;
        frmVisarDesembolso.es_creditos := False;
        frmVisarDesembolso.ShowModal;
end;

procedure TfrmMain.RecuperarDesembolso1Click(Sender: TObject);
begin
        FrmRecuperarInforme := TFrmRecuperarInforme.Create(Self);
        FrmRecuperarInforme.ShowModal;
end;

procedure TfrmMain.ColocacionesporRangos1Click(Sender: TObject);
begin
        FrmRangosColocacion := TFrmRangosColocacion.Create(self);
        FrmRangosColocacion.ShowModal;
end;

procedure TfrmMain.ActuallizarSolicitud1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then begin
          FrmActualizaSol := TFrmActualizaSol.Create(self);
          FrmActualizaSol.ShowModal;
        end;

end;

procedure TfrmMain.AnalisisdeCrditos1Click(Sender: TObject);
begin
//      if ValidarOpcion((Sender as TMenuItem).Tag) then begin
           FrmAnalisiscre := TFrmAnalisiscre.Create(self);
           FrmAnalisiscre.Es_Analista := True;
           FrmAnalisiscre.ShowModal;
//      end;
end;

procedure TfrmMain.BarridoSolicitudes1Click(Sender: TObject);
begin
        FrmBarridoSolicitudes := TFrmBarridoSolicitudes.Create(self);
        FrmBarridoSolicitudes.ShowModal;
end;

procedure TfrmMain.Proceso1Click(Sender: TObject);
begin
        frmLiquidacionGral := TfrmLiquidacionGral.Create(self);
        frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.prueba1Click(Sender: TObject);
begin
        frmPagarePrueba := TfrmPagarePrueba.Create(self);
        frmPagarePrueba.ShowModal;
end;

procedure TfrmMain.InformacindeCrditos1Click(Sender: TObject);
var frmLiquiadcionGral:TfrmLiquidacionGral;
begin
   frmLiquidacionGral := TfrmLiquidacionGral.Create(Self);
   frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.SolicitudesAprobadas1Click(Sender: TObject);
begin
        FrmEstadoSolicitud := TFrmEstadoSolicitud.Create(self);
        if agencia = 1 then
        begin
          if ValidarOpcion((Sender as TMenuItem).Tag) then
          begin
            FrmEstadoSolicitud.solicitud_aprobada
          end;
        end
        else
          FrmEstadoSolicitud.solicitudes;
end;

procedure TfrmMain.MantenimientoGarantiaReal1Click(Sender: TObject);
var frmMantenimientoGarantiaReal:TfrmMantenimientoGarantiaReal;
begin
        frmMantenimientoGarantiaReal := TfrmMantenimientoGarantiaReal.Create(Self);
        frmMantenimientoGarantiaReal.ShowModal;
end;

procedure TfrmMain.IncluirReal1Click(Sender: TObject);
var frmIncluirGarReal : TfrmIncluirGarReal;
begin
      if ValidarOpcion((Sender as TMenuItem).Tag) then begin
        frmIncluirGarReal := TfrmIncluirGarReal.Create(Self);
        frmIncluirGarReal.ShowModal;
      end;
end;

procedure TfrmMain.BarridoCredivida1Click(Sender: TObject);
begin
        FrmBarridoCredivida := TFrmBarridoCredivida.Create(Self);
        FrmBarridoCredivida.ShowModal
end;

procedure TfrmMain.EnvioSolicitudesAnlisis1Click(Sender: TObject);
begin
        FrmNotificacionSolicitud := TFrmNotificacionSolicitud.Create(self);
        FrmNotificacionSolicitud.Caption := 'Notificacion Solicitudes. Usuario: ' + DBAlias;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
              Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"col$solicitud".ID_SOLICITUD');
          SQL.Add('FROM');
          SQL.Add('"col$solicitudempleado"');
          SQL.Add('INNER JOIN "col$solicitud" ON ("col$solicitudempleado".ID_SOLICITUD="col$solicitud".ID_SOLICITUD)');
          SQL.Add('INNER JOIN "gen$persona" ON ("gen$persona".ID_IDENTIFICACION="col$solicitud".ID_IDENTIFICACION)');
          SQL.Add('AND ("gen$persona".ID_PERSONA="col$solicitud".ID_PERSONA)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudempleado".NOTIFICADO = 0 and "col$solicitud".ESTADO <> 15)');
          SQL.Add('AND("col$solicitudempleado".ID_EMPLEADO = :ID_EMPLEADO)');
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('No Existen Solicitudes Pendientes',mtInformation,[mbok],0);
            Exit;
          end;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(self);
          frmProgreso.Titulo := 'Notificacion de Solicitudes';
          frmProgreso.Min := 0;
          frmProgreso.Max := RecordCount;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Registro No : ' + IntToStr(RecNo);
            Application.ProcessMessages;
            with FrmNotificacionSolicitud.CDsolicitud do
            begin
               Append;
               FieldValues['id_solicitud'] := IBQuery1.FieldByName('ID_SOLICITUD').AsString;
               FieldValues['nombre'] := IBQuery1.FieldByName('NOMBRE').AsString + ' ' + IBQuery1.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString;
               FieldValues['notificar'] := False;
            end;
            Next;
          end;
          frmProgreso.Cerrar;
          FrmNotificacionSolicitud.ShowModal;
          end;
end;

procedure TfrmMain.GarantiaREal1Click(Sender: TObject);
var frmReporteGarReal : TfrmReporteGarReal;
begin
        frmReporteGarReal := TfrmReporteGarReal.Create(Self);
        frmReporteGarReal.ShowModal;
end;

procedure TfrmMain.CancelacionCreditosReales1Click(Sender: TObject);
var frmInformeCreditosCanceladosReales : TfrmInformeCreditosCanceladosReales;
begin
        frmInformeCreditosCanceladosReales := TfrmInformeCreditosCanceladosReales.Create(Self);
        frmInformeCreditosCanceladosReales.ShowModal;
end;

procedure TfrmMain.RegistrarSolicitud1Click(Sender: TObject);
begin

      if ValidarOpcion((Sender as TMenuItem).Tag) then
      begin
        FrmRegistroSolicitud := TFrmRegistroSolicitud.Create(Self);
        FrmRegistroSolicitud.ShowModal
      end;
end;


procedure TfrmMain.ObservacinSeccionCreditos1Click(Sender: TObject);
begin
        FrmObservacionCreditos := TFrmObservacionCreditos.Create(Self);
        FrmObservacionCreditos.ShowModal;
end;

procedure TfrmMain.Credivida1Click(Sender: TObject);
begin
      if ValidarOpcion((Sender as TMenuItem).Tag) then
      begin
        FrmPlanoCredivida := TFrmPlanoCredivida.Create(Self);
        FrmPlanoCredivida.ShowModal;
      end;
end;

procedure TfrmMain.SolicitudAnalista1Click(Sender: TObject);
begin
        if Agencia = 1 then
        begin
          MessageDlg('Esta Opción no es valida para la Oficina Ocaña',mtwarning,[mbok],0);
          Exit;
        end;
        FrmSolicitudRemota := TFrmSolicitudRemota.Create(Self);
        FrmSolicitudRemota.ShowModal;
end;

procedure TfrmMain.CambiosenelSistema1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

procedure TfrmMain.SolicitudesenAnlisis1Click(Sender: TObject);
begin
        vMensaje := '';
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
              CdAnalisis.FieldValues['valor_solicitado'] := FieldByName('VALOR').AsCurrency;
              CdAnalisis.FieldValues['v_solicitado'] := currtostrf(FieldByName('VALOR').AsCurrency,ffnumber,2);
              CdAnalisis.FieldValues['valor_pendiente'] := 0;
              CdAnalisis.FieldValues['id_empleado'] := FieldByName('ID_EMPLEADO').AsString;
              CdAnalisis.Post;
              Next;
          end;
        end;
        //informacion de las oficinas
        if Agencia = 1 then
        begin
          with IBagencia do
          begin
            Close;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            Open;
            while not Eof DO
            begin
              AnaOficinas(buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vPuerto,FieldByName('ID_AGENCIA').AsInteger,FieldByName('DESCRIPCION_AGENCIA').AsString,buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vHost);
              Next;
            end;
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

procedure TfrmMain.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Dictionary.Variables['empresa'] := QuotedStr(Empresa);
        frReport1.ModifyPrepared := False;
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TfrmMain.AnaOficinas(puerto,id_agencia: integer; DesAgencia, hostp: string);
var     sentencia :string;
        AList,AListCampos:TList;
        cadena :string;
        i :Integer;
begin
{
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
         {  end;      }


end;



procedure TfrmMain.SolicitudesenCrditos1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          SolicitudCreditos;
        end;
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
              CDsolicitudagencia.Value := Ciudad;
              CDsolicitud.Post
            end;
            Next;
          end;
          frmProgreso.Cerrar;
        end;
        if Agencia = 1 then
        begin
          with IBagencia do
          begin
            Close;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            Open;
            while not Eof DO
            begin
  //            AnaOficinas(buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vPuerto,FieldByName('ID_AGENCIA').AsInteger,FieldByName('DESCRIPCION_AGENCIA').AsString,buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vHost);
              agencias(buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vHost,FieldByName('DESCRIPCION_AGENCIA').AsString,buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vPuerto,FieldByName('ID_AGENCIA').AsInteger);
              Next;
            end;
         end;
        end;
//        agencias(host_abrego,'Abrego',puerto_abrego,2);
//        agencias(host_convencion,'Convención',puerto_convencion,3);
//        agencias(host_aguachica,'Aguachica',puerto_aguachica,4);
        if CDsolicitud.RecordCount = 0 then
        begin
          MessageDlg('No Existen Registros Para Mostrar',mtInformation,[mbok],0);
          Exit;
        end;
        imprimir_reporte(ruta1 + '\Reporte\RepCreditos.frf');
end;

procedure TfrmMain.agencias(host_r,dagencia: string; puerto,vIdAgencia: integer);
var     sentencia :string;
        AList,AListCampos:TList;
        cadena :string;
        i :Integer;
begin
{
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

           }
end;


procedure TfrmMain.CargarPagare1Click(Sender: TObject);
begin
        FrmEndosoPagare := TFrmEndosoPagare.Create(Self);
        FrmEndosoPagare.ShowModal;
end;

procedure TfrmMain.DescargarPagare1Click(Sender: TObject);
begin
        FrmDescargaPagare := TFrmDescargaPagare.Create(self);
        FrmDescargaPagare.ShowModal;

end;

procedure TfrmMain.EndosoPagares1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then begin
        end;
end;

procedure TfrmMain.PagaresEndosados1Click(Sender: TObject);
begin
        FrmReporteEndoso := TFrmReporteEndoso.Create(self);
        FrmReporteEndoso.ShowModal;

end;

procedure TfrmMain.ExencinGMF1Click(Sender: TObject);
var
  frmExencionGMF:TfrmExencionGMF;
begin
       frmExencionGMF  := TfrmExencionGMF.Create(Self);
       frmExencionGMF.ShowModal;
end;

procedure TfrmMain.ReporteCrditosBancoldex1Click(Sender: TObject);
var
  frmInformeCreditosBancoldex:TfrmInformeCreditosBancoldex;
begin
        frmInformeCreditosBancoldex := TfrmInformeCreditosBancoldex.Create(self);
        frmInformeCreditosBancoldex.ShowModal;
end;

procedure TfrmMain.ReporteSolicitudes1Click(Sender: TObject);
var
  frmInformeSolicitudesBancoldex:TfrmInformeSolicitudesBancoldex;
begin
        frmInformeSolicitudesBancoldex := TfrmInformeSolicitudesBancoldex.Create(Self);
        frmInformeSolicitudesBancoldex.ShowModal;
end;

procedure TfrmMain.AgregarBancoldex1Click(Sender: TObject);
var
  frmAgregarCreditosBancoldex:TfrmAgregarCreditosBancoldex;
begin
        frmAgregarCreditosBancoldex := TfrmAgregarCreditosBancoldex.Create(Self);
        frmAgregarCreditosBancoldex.ShowModal;
end;

procedure TfrmMain.ReporteCrecimiento1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          FrmPlanillaConsolidada := TFrmPlanillaConsolidada.Create(Self);
          FrmPlanillaConsolidada.ShowModal;
        end;

end;

procedure TfrmMain.HabilitarFIanzas1Click(Sender: TObject);
begin
      if ValidarOpcion((Sender as TMenuItem).Tag) then begin
        FrmHabilitaFianza := TFrmHabilitaFianza.Create(Self);
        FrmHabilitaFianza.ShowModal;
      end;

end;

procedure TfrmMain.VerificarHuella1Click(Sender: TObject);

begin
    frmValidarHuellaAsociado := TfrmValidarHuellaAsociado.Create(Self);
    frmValidarHuellaAsociado.ShowModal;
end;

procedure TfrmMain.ConsultaAgencias1Click(Sender: TObject);
begin
        frmConsultaProductosAg := TfrmConsultaProductosAg.Create(Self);
        frmConsultaProductosAg.ShowModal;

end;

procedure TfrmMain.RestructurarColocacin1Click(Sender: TObject);
var
   frmRestructurar: TfrmRestructurar;
begin
        frmRestructurar := TfrmRestructurar.Create(self);
        frmRestructurar.ShowModal;
end;

end.
