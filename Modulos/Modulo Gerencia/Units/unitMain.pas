unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, DateUtils, IBSQL, DB, IBCustomDataSet,
  IBQuery, FR_Class, FR_DSet, FR_DBSet, DBClient, frexpimg,sdXmlDocuments;

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
    ConsultaExtractoColocaciones1: TMenuItem;
    Consultas1: TMenuItem;
    Colocaciones1: TMenuItem;
    Procesis1: TMenuItem;
    CalculodeTasas1: TMenuItem;
    ConsultaLiquidacinColocacin1: TMenuItem;
    ToolButton2: TToolButton;
    CambiarContrasea1: TMenuItem;
    N3: TMenuItem;
    ProcesosEspeciales1: TMenuItem;
    ControldeCobro1: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;
    N4: TMenuItem;
    Observaciones1: TMenuItem;
    N5: TMenuItem;
    EstudioSolicitud1: TMenuItem;
    N6: TMenuItem;
    IBSQL1: TIBSQL;
    ConsultadeSolicitudes1: TMenuItem;
    InformacindeCrdito1: TMenuItem;
    PromedioCaptaci1: TMenuItem;
    ReversionesdeCartera1: TMenuItem;
    InformedeAsociadosHabilesInhabiles1: TMenuItem;
    CarteradePrivilegiados1: TMenuItem;
    SolicitudesenAnalisis1: TMenuItem;
    SolicitudesAprobadas1: TMenuItem;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    frDBDataSet2: TfrDBDataSet;
    IBanalisis: TIBQuery;
    SolicitudesenSeccinCrditos1: TMenuItem;
    IBQuery1: TIBQuery;
    CDsolicitud: TClientDataSet;
    CDsolicitudid_solicitud: TStringField;
    CDsolicitudempleado: TStringField;
    CDsolicitudvalor: TCurrencyField;
    CDsolicitudfecha: TDateField;
    CDsolicitudasociado: TStringField;
    frDBDataSet3: TfrDBDataSet;
    frJPEGExport1: TfrJPEGExport;
    frJPEGExport2: TfrJPEGExport;
    frJPEGExport3: TfrJPEGExport;
    frJPEGExport4: TfrJPEGExport;
    frJPEGExport5: TfrJPEGExport;
    frJPEGExport6: TfrJPEGExport;
    frJPEGExport7: TfrJPEGExport;
    frJPEGExport8: TfrJPEGExport;
    frJPEGExport9: TfrJPEGExport;
    SolicitudesAnuladas1: TMenuItem;
    DesembolsosporEmpleado1: TMenuItem;
    CarteraporTasas1: TMenuItem;
    IBQTasas: TIBQuery;
    ReporteTasas: TfrReport;
    DBTasas: TfrDBDataSet;
    IBQTasasSALDO: TIBBCDField;
    IBQTasasTOTAL: TIntegerField;
    IBQTasasTASA_INTERES_CORRIENTE: TFloatField;
    Mnu0510: TMenuItem;
    CdAnalisis: TClientDataSet;
    CdAnalisisanalista: TStringField;
    CdAnalisissolicitud: TStringField;
    CdAnalisisnombre: TStringField;
    CdAnalisisfecha: TDateField;
    CdAnalisisvalor_solicitado: TCurrencyField;
    CdAnalisisvalor_pendiente: TCurrencyField;
    CdAnalisisv_pendiente: TStringField;
    CdAnalisisv_solicitado: TStringField;
    SaldosenCaja1: TMenuItem;
    CDreporte: TClientDataSet;
    CDreportesolicitud: TStringField;
    CDreportenombres: TStringField;
    CDreportefecha: TDateField;
    CDreportevalor: TCurrencyField;
    CDreporteempleado: TStringField;
    IBQuery2: TIBQuery;
    frDBReporte: TfrDBDataSet;
    IbAgencias: TIBQuery;
    CdAnalisisid_empleado: TStringField;
    IdTCPClient1: TIdTCPClient;
    CDsolicitudagencia: TStringField;
    Noentregados1: TMenuItem;
    InformeAsociadosDetalle1: TMenuItem;
    ConsolidadodeCaptaciones1: TMenuItem;
    AsociadosporMunicipio1: TMenuItem;
    VencimientoCdats1: TMenuItem;
    PlanillaConsolidada1: TMenuItem;
    SolicitudesAprobadasauncortedeFecha1: TMenuItem;
    Gestiones1: TMenuItem;
    RequerimientoSistemas1: TMenuItem;
    IBagencia: TIBQuery;
    N7: TMenuItem;
    HabilitarAsociado1: TMenuItem;
    RequerimientosaSistemas1: TMenuItem;
    cdTotalAgencia: TClientDataSet;
    cdTotalAgenciaAGENCIA: TStringField;
    cdTotalAgenciaTOTAL: TCurrencyField;
    frDbTotalAgencia: TfrDBDataSet;
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
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure ControldeCobro1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure Observaciones1Click(Sender: TObject);
    procedure EstudioSolicitud1Click(Sender: TObject);
    procedure ConsultadeSolicitudes1Click(Sender: TObject);
    procedure InformacindeCrdito1Click(Sender: TObject);
    procedure PromedioCaptaci1Click(Sender: TObject);
    procedure ReversionesdeCartera1Click(Sender: TObject);
    procedure InformedeAsociadosHabilesInhabiles1Click(Sender: TObject);
    procedure CarteradePrivilegiados1Click(Sender: TObject);
    procedure SolicitudesAprobadas1Click(Sender: TObject);
    procedure SolicitudesenSeccinCrditos1Click(Sender: TObject);
    procedure SolicitudesAnuladas1Click(Sender: TObject);
    procedure DesembolsosporEmpleado1Click(Sender: TObject);
    procedure CarteraporTasas1Click(Sender: TObject);
    procedure ReporteTasasGetValue(const ParName: String;
      var ParValue: Variant);
    procedure Mnu0510Click(Sender: TObject);
    procedure SaldosenCaja1Click(Sender: TObject);
    procedure General1Click(Sender: TObject);
    procedure SolicitudesenAnalisis1Click(Sender: TObject);
    procedure Noentregados1Click(Sender: TObject);
    procedure InformeAsociadosDetalle1Click(Sender: TObject);
    procedure ConsolidadodeCaptaciones1Click(Sender: TObject);
    procedure AsociadosporMunicipio1Click(Sender: TObject);
    procedure VencimientoCdats1Click(Sender: TObject);
    procedure PlanillaConsolidada1Click(Sender: TObject);
    procedure SolicitudesAprobadasauncortedeFecha1Click(Sender: TObject);
    procedure RequerimientoSistemas1Click(Sender: TObject);
    procedure HabilitarAsociado1Click(Sender: TObject);
    procedure RequerimientosaSistemas1Click(Sender: TObject);
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
    vMensaje :string;
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);

    procedure SolicitudCreditos;
    procedure analista;
    procedure analisis1;
    procedure agencias(host_r,dagencia: string; puerto,vIdAgencia: integer);
    procedure AnaOficinas(puerto,id_agencia: integer; DesAgencia, hostp: string);
  public
  
  wpath :string;
  ruta1:string;
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDate;

implementation

{$R *.dfm}

uses unitLogin, unitdmColocacion, IniFiles,
     unitConsultaProductos,unitConsultaExtractoCaptacion,
     UnitSumatorias,UnitCalculoTasas,
     UnitExtractoColocacion, UnitRecuperarLiquidacionColocacion,
     UnitConsultaColocacion, UnitCambiarContrasena,UnitControlCobroCartera,
     UnitReLogin, UnitControldeObservaciones,
     UnitConsultaSol,UnitLiquidacionGral, UnitPromedioCaptacion,UnitReporteReversionCartera,
     UnitInformeAsociadosHabilesInHabiles, UnitInformeCarteraPrivilegiados,
     UnitImpresion, UnitEstadoSolicitud, UnitPantallaProgreso,
     UnitSolicitudAnulada, UnitInformeDesembolsosxempleado, UnitInformeTasasConsolidado,
     UnitLineasVsTotal, UnitSaldosCaja, UnitInformeGeneraldeCaptaciones1,
     UnitInfAsociados, UnitCaptacionesRe, UnitInformeAsociadosporMunicipio,
     UnitVencimientoCdat, UnitPlanillaConsolidada, UnitSolicitudAprobada,
     UnitCambios, UnitHabilitarAsociado,UnitInformeAsociadosDetalle, UnitExtractoCredito,
  UnitCambioSistemas;

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
    _sServerImagen := ReadString('DBNAME','serverimagen','');    
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
  finally
    free;
  end;
        IdTime1.Host := DBserver;
  { RESTAURAR
        if IdTime1.Connected then
           FechaHoy := IdTime1.DateTime;
        if not IdTime1.SyncTime then
        begin
          SalirMal := True;
          Exit;
        end;
  }        
        control_consulta := True;
        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'GERENCIA';
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
  wpath := Ruta;
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar SIFCREDISERVIR',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
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
        Self.Caption := 'Módulo Gerencia - ' + DBserver;
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


procedure TfrmMain.odas1Click(Sender: TObject);
var frmSumatorias:TfrmSumatorias;
begin
    frmSumatorias := TfrmSumatorias.Create(Self);
    frmSumatorias.ShowModal;
end;

procedure TfrmMain.VisadodeColocacin1Click(Sender: TObject);
//var frmVisarColocacion:TfrmVisarColocacion;
begin
//        frmVisarColocacion:=TfrmVisarColocacion.Create(Self);
//        frmVisarcolocacion.ShowModal;
end;

procedure TfrmMain.ConsultaExtractoColocaciones1Click(Sender: TObject);
var frmExtractoCredito:TfrmExtractoCredito;
begin
        frmExtractoCredito := TfrmExtractoCredito.Create(Self);
        frmExtractoCredito.ShowModal;
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


procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena:TfrmCambiarContrasena;
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.ControldeCobro1Click(Sender: TObject);
var frmControlCobroCartera:TfrmControlCobroCartera;
begin
        frmControlCobroCartera := TfrmControlCobroCartera.Create(Self);
        frmControlCobroCartera.Show;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  { RESTAURAR
      try
        IdTime1.Host := DBserver;
        IdTime1.SyncTime;
        IdTime1.DateTime;
      finally
        IdTime1.Disconnect;
      end;
  }
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


procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones:TfrmControldeObservaciones;
begin
    frmControldeObservaciones:=TfrmControldeObservaciones.Create(Self);
    frmControldeObservaciones.ShowModal;
end;

procedure TfrmMain.EstudioSolicitud1Click(Sender: TObject);
begin
        {FrmEnteAprobador := TFrmEnteAprobador.Create(self);
        FrmEnteAprobador.ShowModal;}
end;

procedure TfrmMain.ConsultadeSolicitudes1Click(Sender: TObject);
var frmConsultaSol:TFrmConsultaSol;
begin
        FrmConsultaSol := TFrmConsultaSol.Create(self);
        FrmConsultaSol.ShowModal;

end;

procedure TfrmMain.InformacindeCrdito1Click(Sender: TObject);
var frmLiquidacionGral:TfrmLiquidacionGral;
begin
   frmLiquidacionGral:=TfrmLiquidacionGral.Create(Self);
   frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.PromedioCaptaci1Click(Sender: TObject);
var frmPromedio:TfrmPromedio;
begin
    frmPromedio := TfrmPromedio.Create(Self);
    frmPromedio.ShowModal;
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

procedure TfrmMain.InformedeAsociadosHabilesInhabiles1Click(
  Sender: TObject);
var
  frmInformeAsociadosHabilesInHabiles:TfrmInformeAsociadosHabilesInHabiles;
begin
      frmInformeAsociadosHabilesInHabiles := TfrmInformeAsociadosHabilesInHabiles.Create(Self);
      timer2.enabled := false;
      frmInformeAsociadosHabilesInHabiles.ShowModal;
      timer2.enabled := true;
end;

procedure TfrmMain.CarteradePrivilegiados1Click(Sender: TObject);
var frmInformeCarteraPrivilegiados : TfrmInformeCarteraPrivilegiados;
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          frmInformeCarteraPrivilegiados :=  TfrmInformeCarteraPrivilegiados.Create(Self);
          frmInformeCarteraPrivilegiados.ShowModal;
        end;
end;

procedure TfrmMain.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Dictionary.Variables['EMPRESA'] := QuotedStr(Empresa);
        frReport1.ModifyPrepared := False;
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TfrmMain.SolicitudesAprobadas1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          FrmEstadoSolicitud := TFrmEstadoSolicitud.Create(self);
          FrmEstadoSolicitud.solicitud_aprobada
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
              CDsolicitudagencia.Value := 'Ocaña';
              CDsolicitud.Post
            end;
            Next;
          end;
          frmProgreso.Cerrar;
        end;
        with IBagencia do
        begin
          Close;
          Open;
          while not Eof DO
          begin
//            solicitudagencia(buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vPuerto,FieldByName('ID_AGENCIA').AsInteger,buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vHost,FieldByName('DESCRIPCION_AGENCIA').AsString);
            agencias(buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vHost,FieldByName('DESCRIPCION_AGENCIA').AsString,buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vPuerto,FieldByName('ID_AGENCIA').AsInteger);
            Next;
          end;
        end;
        {agencias(host_abrego,'Abrego',puerto_abrego,2);
        agencias(host_convencion,'Convención',puerto_convencion,3);
        agencias(host_aguachica,'Aguachica',puerto_aguachica,4);}
        if CDsolicitud.RecordCount = 0 then
        begin
          MessageDlg('No Existen Registros Para Mostrar',mtInformation,[mbok],0);
          Exit;
        end;
        imprimir_reporte(ruta1 + '\Reporte\RepCreditos.frf');
end;

procedure TfrmMain.SolicitudesenSeccinCrditos1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          SolicitudCreditos;
        end;
end;



procedure TfrmMain.SolicitudesAnuladas1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          FrmSolicitudAnulada := TFrmSolicitudAnulada.Create(self);
          FrmSolicitudAnulada.ShowModal;
        end;
end;

procedure TfrmMain.DesembolsosporEmpleado1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          frmInformeDesembolsosxempleado := TfrmInformeDesembolsosxempleado.Create(Self);
          frmInformeDesembolsosxempleado.ShowModal;
        end;
end;

procedure TfrmMain.CarteraporTasas1Click(Sender: TObject);
begin
        frmInformeTasasConsolidado := TfrmInformeTasasConsolidado.Create(Self);
        frmInformeTasasConsolidado.ShowModal;
end;

procedure TfrmMain.ReporteTasasGetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'Empresa' then ParValue := Empresa;
        if ParName = 'Nit' then ParValue := Nit;
        if ParName = 'Empleado' then ParValue := Nombres + ' ' + Apellidos;
end;

procedure TfrmMain.Mnu0510Click(Sender: TObject);
var
  frmLineasVsCartera: TfrmLineasVsCartera;
begin
     frmLineasVsCartera := TfrmLineasVsCartera.Create(Self);
     frmLineasVsCartera.ShowModal;
end;

procedure TfrmMain.SaldosenCaja1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
           FrmSaldosCaja := TFrmSaldosCaja.Create(Self);
           FrmSaldosCaja.ShowModal;
        end;
end;

procedure TfrmMain.analista;
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

        imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitudPen.frf');
end;

procedure TfrmMain.General1Click(Sender: TObject);
begin
        analisTA
end;

procedure TfrmMain.analisis1;
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
              CdAnalisis.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString;
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
              CdAnalisis.Append;
              Next;
            end;
          end;
          //busqueda de solicitudes en las oficinas

          //imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitud.frf');
          imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitudPen.frf');
end;

procedure TfrmMain.agencias(host_r,dagencia: string; puerto,vIdAgencia: integer);
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
//                if TXmlNode(AListCampos[1]).ValueAsString = '2011020035' then
//                   ShowMessage('11');
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

procedure TfrmMain.SolicitudesenAnalisis1Click(Sender: TObject);
//var     mensaje
begin
        vMensaje := '';
//        if ValidarOpcion((Sender as TMenuItem).Tag) then
//        begin
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

          //imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitud.frf');
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
{          AnaOficinas(puerto_abrego,2,'ABREGO',host_abrego);
          AnaOficinas(puerto_convencion,3,'CONVENCION',host_convencion);
          AnaOficinas(puerto_aguachica,4,'AGUACHICA',host_aguachica);}
          if vMensaje <> '' then
             MessageDlg('No se Logro Comunicacion con las Agencia(s) ' + vMensaje,mtInformation,[mbok],0);
          imprimir_reporte(ruta1 + '\Reporte\RepAnalisSolicitudPen.frf');
//       end;


end;

procedure TfrmMain.AnaOficinas(puerto,id_agencia: integer; DesAgencia, hostp: string);
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

procedure TfrmMain.Noentregados1Click(Sender: TObject);
begin
        frmInformeGeneraldeCaptaciones1 := TfrmInformeGeneraldeCaptaciones1.Create(Self);
        frmInformeGeneraldeCaptaciones1.ShowModal
end;

procedure TfrmMain.InformeAsociadosDetalle1Click(Sender: TObject);
begin
        FrmInformeAsociadosDetalle := TFrmInformeAsociadosDetalle.Create(Self);
        timer2.enabled := False;
        FrmInformeAsociadosDetalle.ShowModal;
        timer2.enabled := True;
end;

procedure TfrmMain.ConsolidadodeCaptaciones1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
         frmcaptacionesre := tfrmcaptacionesre.Create(Self);
         frmcaptacionesre.ShowModal;
        end;
end;

procedure TfrmMain.AsociadosporMunicipio1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          frminformeasociadospormunicipio := tfrminformeasociadospormunicipio.Create(Self);
          frminformeasociadospormunicipio.ShowModal;
        end;
end;

procedure TfrmMain.VencimientoCdats1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          FrmVencimientoCdat := TFrmVencimientoCdat.Create(self);
          FrmVencimientoCdat.ShowModal;
        end;
end;

procedure TfrmMain.PlanillaConsolidada1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          FrmPlanillaConsolidada := TFrmPlanillaConsolidada.Create(Self);
          FrmPlanillaConsolidada.ShowModal;
        end;
end;

procedure TfrmMain.SolicitudesAprobadasauncortedeFecha1Click(
  Sender: TObject);
begin
        FrmSolicitudAprobada := TFrmSolicitudAprobada.Create(Self);
        FrmSolicitudAprobada.ShowModal;
end;

procedure TfrmMain.RequerimientoSistemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

procedure TfrmMain.HabilitarAsociado1Click(Sender: TObject);
begin
        FrmHabilitaAsociado := TFrmHabilitaAsociado.Create(Self);
        FrmHabilitaAsociado.ShowModal
end;

procedure TfrmMain.RequerimientosaSistemas1Click(Sender: TObject);
begin
        if ValidarOpcion((Sender as TMenuItem).Tag) then
        begin
          FrmCambioSistemas := TFrmCambioSistemas.Create(Self);
          FrmCambioSistemas.ShowModal;
        end;
end;

end.
