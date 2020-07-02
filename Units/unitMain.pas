unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  UnitInformeArqueoDiarioCaja, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdTime, ExtCtrls, UnitValidacion;

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
    Modulos1: TMenuItem;
    Contabilidad1: TMenuItem;
    Colocaciones1: TMenuItem;
    MantenimientodePUC1: TMenuItem;
    DigitacindeComprobantes1: TMenuItem;
    NuevaColocacin1: TMenuItem;
    RecuperarReporteColocacion1: TMenuItem;
    ConfigurarImpresora2: TMenuItem;
    LiquidacindePrueba1: TMenuItem;
    CalculodeCuotas1: TMenuItem;
    Informes1: TMenuItem;
    Mnu030401: TMenuItem;
    Mnu030402: TMenuItem;
    Personas1: TMenuItem;
    CreacindeNuevaPersona1: TMenuItem;
    EliminacindePersona1: TMenuItem;
    ListadoGeneraldePersonas1: TMenuItem;
    Captaciones1: TMenuItem;
    AportacionesSociales1: TMenuItem;
    CrearCaptacin1: TMenuItem;
    InformesGerenciales1: TMenuItem;
    ConsultadeGerencia1: TMenuItem;
    ModificarCaptacin1: TMenuItem;
    RangosdeLibreta1: TMenuItem;
    ConsultaExtracto1: TMenuItem;
    LiquidacionInteresesCaptacion1: TMenuItem;
    RecuperarTablaLiquidacin1: TMenuItem;
    ProrrogaCaptaciones: TMenuItem;
    SaldarCaptacin1: TMenuItem;
    NuevaCaja1: TMenuItem;
    Operaciones1: TMenuItem;
    Arqueos1: TMenuItem;
    CierredelDa1: TMenuItem;
    ActualizarArqueo1: TMenuItem;
    InformeDiario1: TMenuItem;
    ImprimirCaptacion1: TMenuItem;
    ChequesenCaja1: TMenuItem;
    IdTime1: TIdTime;
    ControldeCobro1: TMenuItem;
    CostasJudiciales1: TMenuItem;
    N3: TMenuItem;
    Sumatorias1: TMenuItem;
    CambiarContrasea1: TMenuItem;
    ProcesosEspeciales1: TMenuItem;
    CaptacionesParaFogacoop1: TMenuItem;
    ResumendeCartera1: TMenuItem;
    RevalorizacindeAportes1: TMenuItem;
    ColocacionesparaFogacoop1: TMenuItem;
    LiquidacionJudicial: TMenuItem;
    EstimadoCancelacionCdats1: TMenuItem;
    Pagar1: TMenuItem;
    ActualizarListaClinton1: TMenuItem;
    Observaciones1: TMenuItem;
    N4: TMenuItem;
    Cartera1: TMenuItem;
    MantenimientoAbogados1: TMenuItem;
    AsignacinAbogado1: TMenuItem;
    InformeAbogadosconCartera1: TMenuItem;
    Timer2: TTimer;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure Colocaciones1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure NuevaColocacin1Click(Sender: TObject);
    procedure RecuperarReporteColocacion1Click(Sender: TObject);
    procedure LiquidacindePrueba1Click(Sender: TObject);
    procedure Mnu030401Click(Sender: TObject);
    procedure Mnu030402Click(Sender: TObject);
    procedure CreacindeNuevaPersona1Click(Sender: TObject);
    procedure MantenimientodePUC1Click(Sender: TObject);
    procedure DigitacindeComprobantes1Click(Sender: TObject);
    procedure ConsultadeGerencia1Click(Sender: TObject);
    procedure CrearCaptacin1Click(Sender: TObject);
    procedure ModificarCaptacin1Click(Sender: TObject);
    procedure RangosdeLibreta1Click(Sender: TObject);
    procedure ConsultaExtracto1Click(Sender: TObject);
    procedure LiquidacionInteresesCaptacion1Click(Sender: TObject);
    procedure RecuperarTablaLiquidacin1Click(Sender: TObject);
    procedure ProrrogaCaptacionesClick(Sender: TObject);
    procedure SaldarCaptacin1Click(Sender: TObject);
    procedure NuevaCaja1Click(Sender: TObject);
{    procedure Operaciones1Click(Sender: TObject);}
    procedure ActualizarArqueo1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure InformeDiario1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ImprimirCaptacion1Click(Sender: TObject);
    procedure Arqueos1Click(Sender: TObject);
    procedure CierredelDa1Click(Sender: TObject);
    procedure ChequesenCaja1Click(Sender: TObject);
    procedure ControldeCobro1Click(Sender: TObject);
    procedure CostasJudiciales1Click(Sender: TObject);
    procedure Sumatorias1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure CaptacionesParaFogacoop1Click(Sender: TObject);
    procedure ResumendeCartera1Click(Sender: TObject);
    procedure RevalorizacindeAportes1Click(Sender: TObject);
    procedure ColocacionesparaFogacoop1Click(Sender: TObject);
    procedure LiquidacionJudicialClick(Sender: TObject);
    procedure EstimadoCancelacionCdats1Click(Sender: TObject);
    procedure Pagar1Click(Sender: TObject);
    procedure ActualizarListaClinton1Click(Sender: TObject);
    procedure Observaciones1Click(Sender: TObject);
    procedure MantenimientoAbogados1Click(Sender: TObject);
    procedure AsignacinAbogado1Click(Sender: TObject);
    procedure InformeAbogadosconCartera1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
    tValidacion:Validacion;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FUltimaActividad:TDateTime;

implementation

{$R *.dfm}

uses unitLogin, unitdmGeneral, unitdmColocacion, IniFiles, UnitNuevaColocacion,
     Unit_RecInformeColocacion,UnitLiquidaciondePrueba,
     UnitInformeColocacionListadoGeneral, UnitInformeColocacionListadoGeneralGClasificacion,
     UnitCreaciondePersona,Unit_Mantenimientopuc,Unit_Comprobante,
     unitConsultaProductos, unitCreacionCaptacion, UnitMantenimientoCaptacion, UnitRangosdeLibreta,
     unitConsultaExtractoCaptacion, UnitLiquidacionInteresesCaptacion,UnitRecuperarTablaLiquidacionCaptacion,
     UnitProrrogaCaptaciones, unitSaldarCaptacion,UnitMantenimientoCajas,
     {UnitOperacionesCaja,} UnitActualizarArqueo, UnitInformeDiarioCaja, UnitImpresionCaptacion, UnitCierreDiarioCaja,
     UnitInformeChequesenCaja, UnitControlCobroCartera, UnitCargarCostasJudiciales,
     UnitSumatorias, UnitCambiarContrasena, UnitReporteCaptacionesFogacoop,
     UnitResumenColocaciones, UnitRevalorizacionAportes,
     UnitReporteColocacionesFogacoop, UnitLiquidacionCarteraJudicial,UnitCancelacionCdats,
     UnitFormatoPagare, UnitActualizacionSDN, UnitControldeObservaciones,
     UnitMantenimientoAbogados, UnitAsignacionAbogado, UnitRCarteraAbogados, UnitReLogin;

procedure TfrmMain.Configurar_ImpresoraExecute(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var frmLogin:TfrmLogin;
    Veces :SmallInt;
    Mensaje :String;
    Ruta:string;
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
    Ciudad  := ReadString('EMPRESA','city','OCAÑA');
    Departamento := ReadString('EMPRESA','Departamento','NORTE DE SANTANDER');
    DBMinutos := ReadInteger('ADICIONALES','timerelogin',1);
  finally
    free;
  end;
{        IdTime1.Host := DBserver;
        if not IdTime1.SyncTime then
        begin
          MessageDlg('No Se Pudo Sincronizar la Fecha del Sistema'+#13+
                     'El programa se cerrara',mtError,[mbcancel],0);
          SalirMal := True;
        end;
}
        FechaHoy := Date;
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
                dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
                dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
                dmGeneral.IBDatabase1.Params.Values['User_Name'] := DBAlias;
                dmGeneral.IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
                dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := edrole.Text;
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

  FUltimaActividad := Now;
  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
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



procedure TfrmMain.Colocaciones1Click(Sender: TObject);
var frmNuevaColocacion:TfrmNuevaColocacion;
begin
        frmNuevaColocacion := TfrmNuevaColocacion.Create(Self);
        frmNuevaColocacion.ShowModal;
end;

procedure TfrmMain.SalirdePSI1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmMain.NuevaColocacin1Click(Sender: TObject);
var frmNuevaColocacion:TfrmNuevaColocacion;
begin
        frmNuevaColocacion := TfrmNuevaColocacion.Create(Self);
        frmNuevaColocacion.ShowModal;
end;

procedure TfrmMain.RecuperarReporteColocacion1Click(Sender: TObject);
var frmRecuperarReporteColocacion :TfrmRecuperarInformeColocacion;
begin
        frmRecuperarReporteColocacion := TfrmRecuperarInformeColocacion.Create(Self);
        frmRecuperarReporteColocacion.ShowModal;
end;

procedure TfrmMain.LiquidacindePrueba1Click(Sender: TObject);
var frmLiquidaciondePrueba: TfrmLiquidaciondePrueba;
begin
         frmLiquidaciondePrueba := TfrmLiquidaciondePrueba.Create(Self);
         frmLiquidaciondePrueba.ShowModal;
end;

procedure TfrmMain.Mnu030401Click(Sender: TObject);
var frmInformeColocacionesListadoGeneral: TfrmInformeColocacionesListadoGeneral;
begin
        frmInformeColocacionesListadoGeneral := TfrmInformeColocacionesListadoGeneral.Create(Self);
        frmInformeColocacionesListadoGeneral.ShowModal;
end;

procedure TfrmMain.Mnu030402Click(
  Sender: TObject);
var frmColocacionesporClasificacion:TfrmColocacionesporClasificacion;
begin
        frmColocacionesporClasificacion := TfrmColocacionesporClasificacion.Create(Self);
        frmColocacionesporClasificacion.ShowModal; 
end;

procedure TfrmMain.CreacindeNuevaPersona1Click(Sender: TObject);
var frmCreacionPersona:TfrmCreacionPersona;
begin
        frmCreacionPersona := TfrmCreacionPersona.Create(Self);
        frmCreacionPersona.ShowModal;
end;

procedure TfrmMain.MantenimientodePUC1Click(Sender: TObject);
var frmMantenimientopuc:TfrmMantenimientopuc;
begin
        frmMantenimientopuc := TfrmMantenimientopuc.Create(Self);
        frmMantenimientopuc.ShowModal;
end;

procedure TfrmMain.DigitacindeComprobantes1Click(Sender: TObject);
var frmComprobante:TfrmComprobante;
begin
        frmComprobante := TfrmComprobante.Create(Self);
        frmComprobante.ShowModal;
end;

procedure TfrmMain.ConsultadeGerencia1Click(Sender: TObject);
var frmConsultaProductos:TfrmConsultaProductos;
begin
       frmConsultaProductos := TfrmConsultaProductos.Create(Self);
       frmConsultaProductos.ShowModal;
end;

procedure TfrmMain.CrearCaptacin1Click(Sender: TObject);
var frmCreacionCaptacion:TfrmCreacionCaptacion;
begin
        frmCreacionCaptacion := TfrmCreacionCaptacion.Create(self);
        frmCreacionCaptacion.ShowModal;
end;

procedure TfrmMain.ModificarCaptacin1Click(Sender: TObject);
var frmMantenimientoCaptacion:TfrmMantenimientoCaptacion;
begin
        frmMantenimientoCaptacion := TfrmMantenimientoCaptacion.Create(self);
        frmMantenimientoCaptacion.ShowModal;
end;

procedure TfrmMain.RangosdeLibreta1Click(Sender: TObject);
var frmRangosdeLibreta:TfrmRangosdeLibreta;
begin
        frmRangosdeLibreta := tfrmrangosdelibreta.Create(Self);
        frmrangosdelibreta.ShowModal;
end;

procedure TfrmMain.ConsultaExtracto1Click(Sender: TObject);
var frmConsultaExtractoCaptacion:TfrmConsultaExtractoCaptacion;
begin
        frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
        frmConsultaExtractoCaptacion.ShowModal;
end;

procedure TfrmMain.LiquidacionInteresesCaptacion1Click(Sender: TObject);
var frmLiquidacionInteresesCaptacion:TfrmLiquidacionInteresesCaptacion;
begin
        frmLiquidacionInteresesCaptacion := TfrmLiquidacionInteresesCaptacion.Create(self);
        frmLiquidacionInteresesCaptacion.ShowModal;
end;

procedure TfrmMain.RecuperarTablaLiquidacin1Click(Sender: TObject);
var frmRecuperarTablaLiquidacionCaptacion:TfrmRecuperarTablaLiquidacionCaptacion;
begin
        frmRecuperarTablaLiquidacionCaptacion := TfrmRecuperarTablaLiquidacionCaptacion.Create(Self);
        frmRecuperarTablaLiquidacionCaptacion.ShowModal;
end;

procedure TfrmMain.ProrrogaCaptacionesClick(Sender: TObject);
var frmProrrogaCaptacion:TfrmProrrogaCaptacion;
begin
        frmProrrogaCaptacion := TfrmProrrogaCaptacion.Create(self);
        frmProrrogaCaptacion.ShowModal;
end;

procedure TfrmMain.SaldarCaptacin1Click(Sender: TObject);
var frmSaldarCaptacion:TfrmSaldarCaptacion;
begin
        frmSaldarCaptacion := TfrmSaldarCaptacion.Create(self);
        frmSaldarCaptacion.ShowModal;
end;

procedure TfrmMain.NuevaCaja1Click(Sender: TObject);
var frmMantenimientoCajas: TfrmMantenimientoCajas;
begin
        frmMantenimientoCajas := TfrmMantenimientoCajas.Create(Self);
        frmMantenimientoCajas.ShowModal;
end;

{procedure TfrmMain.Operaciones1Click(Sender: TObject);
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
}
procedure TfrmMain.ActualizarArqueo1Click(Sender: TObject);
var frmActualizarArqueo:TfrmActualizarArqueo;
begin
        frmActualizarArqueo := TfrmActualizarArqueo.Create(Self);
        frmActualizarArqueo.ShowModal;
        frmActualizarArqueo.Free;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.InformeDiario1Click(Sender: TObject);
var frmInformeDiarioCaja:TfrmInformeDiarioCaja;
begin
    frmInformeDiarioCaja := TfrmInformeDiarioCaja.Create(Self);
    frmInformeDiarioCaja.ShowModal;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
            CanClose := True;
           end;
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
end;

procedure TfrmMain.ImprimirCaptacion1Click(Sender: TObject);
var frmImpresionCaptacion:TfrmImpresionCaptacion;
begin
      frmImpresionCaptacion := TfrmImpresionCaptacion.Create(Self);
      frmImpresionCaptacion.ShowModal;
end;

procedure TfrmMain.Arqueos1Click(Sender: TObject);
var frmArqueoDiarioCaja:TfrmInformeArqueoDiarioCaja;
begin
        frmArqueoDiarioCaja := TfrmInformeArqueoDiarioCaja.Create(Self);
        frmArqueoDiarioCaja.ShowModal;
end;

procedure TfrmMain.CierredelDa1Click(Sender: TObject);
var frmCierreDiarioCaja:TfrmCierreDiarioCaja;
begin
        frmCierreDiarioCaja:=TfrmCierreDiarioCaja.Create(Self);
        if not frmCierreDiarioCaja.ValidarCaja then
        begin
           MessageDlg('Usted no está habilitado para manejar caja',mtError,[mbcancel],0);
           frmCierreDiarioCaja.Free;
        end
        else
        frmCierreDiarioCaja.ShowModal;
end;

procedure TfrmMain.ChequesenCaja1Click(Sender: TObject);
var frmInformeChequesenCaja:TfrmInformeChequesenCaja;
begin
    frmInformeChequesenCaja := TfrmInformeChequesenCaja.Create(Self);
    frmInformeChequesenCaja.ShowModal;
end;

procedure TfrmMain.ControldeCobro1Click(Sender: TObject);
var FrmControlCobroCartera:TFrmControlCobroCartera;
begin                                              ;
    FrmControlCobroCartera:= TFrmControlCobroCartera.Create(Self);
    FrmControlCobroCartera.ShowModal;
end;

procedure TfrmMain.CostasJudiciales1Click(Sender: TObject);
var frmCargarCostasJudiciales:TfrmCargarCostasJudiciales;
begin
      frmCargarCostasJudiciales := TfrmCargarCostasJudiciales.Create(Self);
      frmCargarCostasJudiciales.ShowModal;
end;

procedure TfrmMain.Sumatorias1Click(Sender: TObject);
var frmSumatorias:TfrmSumatorias;
begin
        frmSumatorias := TfrmSumatorias.Create(Self);
        frmSumatorias.ShowModal;
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena:TfrmCambiarContrasena;
begin
       frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
       frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.CaptacionesParaFogacoop1Click(Sender: TObject);
var frmReporteCaptacionesFogacoop:TfrmReporteCaptacionesFogacoop;
begin
    frmReporteCaptacionesFogacoop:=TfrmReporteCaptacionesFogacoop.Create(Self);
    frmReporteCaptacionesFogacoop.ShowModal;
end;

procedure TfrmMain.ResumendeCartera1Click(Sender: TObject);
var frmResumenColocaciones:TfrmResumenColocaciones;
begin
        frmResumenColocaciones := TfrmResumenColocaciones.Create(Self);
        frmResumenColocaciones.ShowModal;
end;

procedure TfrmMain.RevalorizacindeAportes1Click(Sender: TObject);
var frmRevalorizacionAportes:TfrmRevalorizacionAportes;
begin
    frmRevalorizacionAportes := TfrmRevalorizacionAportes.Create(Self);
    frmRevalorizacionAportes.ShowModal;
end;

procedure TfrmMain.ColocacionesparaFogacoop1Click(Sender: TObject);
var frmReporteColocacionesFogacoop :TfrmReporteColocacionesFogacoop;
begin
        frmReporteColocacionesFogacoop := TfrmReporteColocacionesFogacoop.Create(Self);
        frmReporteColocacionesFogacoop.ShowModal;
end;

procedure TfrmMain.LiquidacionJudicialClick(Sender: TObject);
var frmLiquidacionCarteraJudicial:TfrmLiquidacionCarteraJudicial;
begin
        frmLiquidacionCarteraJudicial := TfrmLiquidacionCarteraJudicial.Create(Self);
        frmLiquidacionCarteraJudicial.ShowModal;
end;

procedure TfrmMain.EstimadoCancelacionCdats1Click(Sender: TObject);
var frmCancelacionCdats: TfrmCancelacionCdats;
begin
      frmCancelacionCdats := TfrmCancelacionCdats.Create(Self);
      frmCancelacionCdats.ShowModal;
end;

procedure TfrmMain.Pagar1Click(Sender: TObject);
var frmFormatoPagare: TfrmFormatoPagare;
begin
        frmFormatoPagare := TfrmFormatoPagare.Create(Self);
        frmFormatoPagare.ShowModal;
end;

procedure TfrmMain.ActualizarListaClinton1Click(Sender: TObject);
var frmActualizacionSDN:TfrmActualizacionSDN;
begin
        frmActualizacionSDN := TfrmActualizacionSDN.Create(Self);
        frmActualizacionSDN.ShowModal;
end;

procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones:TfrmControldeObservaciones;
begin
     frmControldeObservaciones := TfrmControldeObservaciones.Create(Self);
     frmcontroldeobservaciones.ShowModal;
end;

procedure TfrmMain.MantenimientoAbogados1Click(Sender: TObject);
var frmMantenimientoAbogados:TfrmMantenimientoAbogados;
begin
        frmMantenimientoAbogados := TfrmMantenimientoAbogados.Create(Self);
        frmMantenimientoAbogados.ShowModal;
end;

procedure TfrmMain.AsignacinAbogado1Click(Sender: TObject);
var frmAsignacionAbogado:TfrmAsignacionAbogado;
begin
      frmAsignacionAbogado := TfrmAsignacionAbogado.Create(Self);
      frmAsignacionAbogado.ShowModal;
end;

procedure TfrmMain.InformeAbogadosconCartera1Click(Sender: TObject);
var frmRCarteraAbogados:TfrmRCarteraAbogados;
begin
    frmRCarteraAbogados:=TfrmRCarteraAbogados.Create(Self);
    frmRCarteraAbogados.ShowModal;
end;

procedure TfrmMain.Timer2Timer(Sender: TObject);
var frmReLogin:TfrmReLogin;
    Pasabordo :string;
    ESPERA:Extended;
    Resultado:Integer;
begin
  Timer2.Enabled := False;
{  ESPERA := ((1 / 24 / 60) * 0.25);// DBMinutos);
  if (FUltimaActividad + ESPERA) < Now then begin
     tValidacion := Validacion.Create(False);
     Resultado := tValidacion.WaitFor;
     case Resultado of
     0: begin
          SalirMal := True;
          Close;
          Exit;
        end;
     end;
  end;
}
  Timer2.Enabled := True;

end;

end.
