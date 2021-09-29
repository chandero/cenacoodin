unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, pr_Common, pr_TxClasses, DB,
  IBCustomDataSet, IBQuery, DateUtils;

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
    InformesGerenciales1: TMenuItem;
    ConsultadeGerencia1: TMenuItem;
    ProcesosEspeciales1: TMenuItem;
    ToolBar1: TToolBar;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    IdTime1: TIdTime;
    CambiarContrasea1: TMenuItem;
    N8: TMenuItem;
    Timer1: TTimer;
    Reporte: TprTxReport;
    OD1: TOpenDialog;
    Timer2: TTimer;
    Contabilidad1: TMenuItem;
    CrditoyCartera1: TMenuItem;
    Captaciones1: TMenuItem;
    LibroAuxiliar1: TMenuItem;
    LibrosRegistrados1: TMenuItem;
    MediosMagnticos1: TMenuItem;
    CajaDiario1: TMenuItem;
    MayoryBalance1: TMenuItem;
    ExtractoColocacin1: TMenuItem;
    ResumendeCartera1: TMenuItem;
    ColocacionesenAbogados1: TMenuItem;
    ColocacionesporEstado1: TMenuItem;
    ConsultadeColocacin1: TMenuItem;
    Consultas1: TMenuItem;
    Informes1: TMenuItem;
    ConsultaEscritura1: TMenuItem;
    GeneraldeColocaciones1: TMenuItem;
    ColocacionesporRango1: TMenuItem;
    ColocacionesParametrizado1: TMenuItem;
    Extracto1: TMenuItem;
    ListadoGeneraldeCaptacion1: TMenuItem;
    CaptacionesporFechadeApertura1: TMenuItem;
    asaPromedioCaptacin1: TMenuItem;
    RangosdeCaptacin1: TMenuItem;
    InformedeCuentasporEstado1: TMenuItem;
    InformeAportesyAhorros1: TMenuItem;
    ConsultaGarantia1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LibroAuxiliar1Click(Sender: TObject);
    procedure ConsultadeGerencia1Click(Sender: TObject);
    procedure CajaDiario1Click(Sender: TObject);
    procedure MayoryBalance1Click(Sender: TObject);
    procedure ExtractoColocacin1Click(Sender: TObject);
    procedure ResumendeCartera1Click(Sender: TObject);
    procedure ColocacionesenAbogados1Click(Sender: TObject);
    procedure ColocacionesporEstado1Click(Sender: TObject);
    procedure ColocacionesParametrizado1Click(Sender: TObject);
    procedure GeneraldeColocaciones1Click(Sender: TObject);
    procedure ColocacionesporRango1Click(Sender: TObject);
    procedure ConsultadeColocacin1Click(Sender: TObject);
    procedure ConsultaEscritura1Click(Sender: TObject);
    procedure Extracto1Click(Sender: TObject);
    procedure ListadoGeneraldeCaptacion1Click(Sender: TObject);
    procedure CaptacionesporFechadeApertura1Click(Sender: TObject);
    procedure asaPromedioCaptacin1Click(Sender: TObject);
    procedure RangosdeCaptacin1Click(Sender: TObject);
    procedure InformedeCuentasporEstado1Click(Sender: TObject);
    procedure InformeAportesyAhorros1Click(Sender: TObject);
    procedure BtnConsultaPersonaClick(Sender: TObject);
    procedure ConsultaGarantia1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
  public
    { Public declarations }
    ruta1:string;
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDateTime;

implementation

{$R *.dfm}

uses unitLogin, IniFiles,
     UnitCambiarContrasena,UnitInformeAuxiliar, UnitLibroRMayoryBalance,
     UnitLibroCajaDiario, UnitConsultaProductos, UnitExtractoColocacion,
     UnitResumenColocaciones, UnitRCarteraAbogados, UnitInformeColocacionesPorEstado,
     UnitInformeColocacionFiltrado, UnitInformeGralColocaciones,
     UnitRangosColocacion, UnitConsultaColocacion, UnitBuscarEscritura,
     UnitConsultaExtractoCaptacion, UnitInformeGeneraldeCaptaciones,
     UnitListadoGeneralCaptaciones, UnitInformeTasaPromedio,
     UnitInformePorRangosCaptacion, UnitInformeCuentasporEstado,
     UnitListadoCaptacionesConsolidado, UnitMantenimientoGarantiaReal;

procedure TfrmMain.Configurar_ImpresoraExecute(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var frmLogin:TfrmLogin;
    Veces :SmallInt;
    Mensaje :String;
    Ruta:string;
    Role:string;
//    frmConectando:TfrmConectando;
begin
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','0.0.0.0');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    _sServerImagen := ReadString('DBNAME','serverimagen','');    
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
  finally
    free;
  end;

        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'REVISOR';
        dmGeneral.IBDatabase1.Connected := False;
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

        IdTime1.Host := DBserver;
        if IdTime1.Connected then
           FechaHoy := IdTime1.DateTime;
        if not IdTime1.SyncTime then
        begin
          SalirMal := True;
          Exit;
        end;

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


procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar SIFCOOPSERVIR',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
         with TIniFile.Create(MiINI) do
          try
            {WriteString('DBNAME','server',DBserver);
            WriteString('DBNAME','path',DBpath);
            WriteString('DBNAME','name',DBname);
            WriteString('EMPRESA','name',Empresa);
            WriteString('EMPRESA','nit',Nit);
            WriteInteger('EMPRESA','Agencia',Agencia);
            WriteString('EMPRESA','city',Ciudad);}
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


procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        SalirdePSI1.Click;
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

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
        FechaHora := Date;
end;

procedure TfrmMain.LibroAuxiliar1Click(Sender: TObject);
var
  frmInformeAuxiliares:TfrmInformeAuxiliares;
begin
        frmInformeAuxiliares := TfrmInformeAuxiliares.Create(Self);
        frmInformeAuxiliares.ShowModal;
end;

procedure TfrmMain.ConsultadeGerencia1Click(Sender: TObject);
var
  frmConsultaProductos:TfrmConsultaProductos;
begin
      frmConsultaProductos := TfrmConsultaProductos.Create(Self);
      frmConsultaProductos.ShowModal;
end;

procedure TfrmMain.CajaDiario1Click(Sender: TObject);
var
  frmLibroRCajaDiario :TfrmLibroRCajaDiario;
begin
  frmLibroRCajaDiario := TfrmLibroRCajaDiario.Create(Self);
  frmLibroRCajaDiario.ShowModal;
end;

procedure TfrmMain.MayoryBalance1Click(Sender: TObject);
var
  frmLibroMayorYBalance :TfrmLibroMayorYBalance;
begin
  frmLibroMayorYBalance := TfrmLibroMayorYBalance.Create(Self);
  frmLibroMayorYBalance.ShowModal;
end;

procedure TfrmMain.ExtractoColocacin1Click(Sender: TObject);
var
  FrmExtractoColocacion :TFrmExtractoColocacion;
begin
  FrmExtractoColocacion := TFrmExtractoColocacion.Create(Self);
  FrmExtractoColocacion.ShowModal;
end;

procedure TfrmMain.ResumendeCartera1Click(Sender: TObject);
var
  frmResumenColocaciones :TfrmResumenColocaciones;
begin
  frmResumenColocaciones := TfrmResumenColocaciones.Create(Self);
  frmResumenColocaciones.ShowModal;
end;

procedure TfrmMain.ColocacionesenAbogados1Click(Sender: TObject);
var
  frmRCarteraAbogados:TfrmRCarteraAbogados;
begin
   frmRCarteraAbogados := TfrmRCarteraAbogados.Create(Self);
   frmRCarteraAbogados.ShowModal;
end;

procedure TfrmMain.ColocacionesporEstado1Click(Sender: TObject);
var
  frminformecolocacionesporestado:Tfrminformecolocacionesporestado;
begin
  frminformecolocacionesporestado := Tfrminformecolocacionesporestado.Create(Self);
  frminformecolocacionesporestado.ShowModal;
end;

procedure TfrmMain.ColocacionesParametrizado1Click(Sender: TObject);
var
   frmInformeColocacionesFiltrado:TfrmInformeColocacionesFiltrado;
begin
   frmInformeColocacionesFiltrado := TfrmInformeColocacionesFiltrado.Create(Self);
   frmInformeColocacionesFiltrado.ShowModal;
end;

procedure TfrmMain.GeneraldeColocaciones1Click(Sender: TObject);
var
   frmInformeGralColocaciones:TfrmInformeGralColocaciones;
begin
   frmInformeGralColocaciones := TfrmInformeGralColocaciones.Create(Self);
   frmInformeGralColocaciones.ShowModal;
end;

procedure TfrmMain.ColocacionesporRango1Click(Sender: TObject);
var
  FrmRangosColocacion :TFrmRangosColocacion;
begin
  FrmRangosColocacion := TFrmRangosColocacion.Create(Self);
  FrmRangosColocacion.ShowModal;
end;

procedure TfrmMain.ConsultadeColocacin1Click(Sender: TObject);
var
   frmConsultaColocacion:TfrmConsultaColocacion;
begin
   frmConsultaColocacion := TfrmConsultaColocacion.Create(Self);
   frmConsultaColocacion.ShowModal;
end;

procedure TfrmMain.ConsultaEscritura1Click(Sender: TObject);
var
  frmBusquedadeEscritura:TfrmBusquedadeEscritura;
begin
  frmBusquedadeEscritura := TfrmBusquedadeEscritura.Create(Self);
  frmBusquedadeEscritura.ShowModal;
end;

procedure TfrmMain.Extracto1Click(Sender: TObject);
var
  frmConsultaExtractoCaptacion :TfrmConsultaExtractoCaptacion;
begin
  frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(Self);
  frmConsultaExtractoCaptacion.ShowModal;
end;

procedure TfrmMain.ListadoGeneraldeCaptacion1Click(Sender: TObject);
var
  frmInformeGeneraldeCaptaciones :TfrmInformeGeneraldeCaptaciones;
begin
  frmInformeGeneraldeCaptaciones := TfrmInformeGeneraldeCaptaciones.Create(Self);
  frmInformeGeneraldeCaptaciones.ShowModal;
end;

procedure TfrmMain.CaptacionesporFechadeApertura1Click(Sender: TObject);
var
  frmListadoGeneralCaptaciones:TfrmListadoGeneralCaptaciones;
begin
  frmListadoGeneralCaptaciones := TfrmListadoGeneralCaptaciones.Create(Self);
  frmListadoGeneralCaptaciones.ShowModal;
end;

procedure TfrmMain.asaPromedioCaptacin1Click(Sender: TObject);
var
   frmInformeTasaPromedio:TfrmInformeTasaPromedio;
begin
   frmInformeTasaPromedio := TfrmInformeTasaPromedio.Create(Self);
   frmInformeTasaPromedio.ShowModal;
end;

procedure TfrmMain.RangosdeCaptacin1Click(Sender: TObject);
var
  frmInformeCaptacionesporRango:TfrmInformeCaptacionesporRango;
begin
  frmInformeCaptacionesporRango := TfrmInformeCaptacionesporRango.Create(Self);
  frmInformeCaptacionesporRango.ShowModal;  
end;

procedure TfrmMain.InformedeCuentasporEstado1Click(Sender: TObject);
var
  frmInformeCuentasporEstado:TfrmInformeCuentasporEstado;
begin
  frmInformeCuentasporEstado := TfrmInformeCuentasporEstado.Create(Self);
  frmInformeCuentasporEstado.ShowModal;
end;

procedure TfrmMain.InformeAportesyAhorros1Click(Sender: TObject);
var
  frmListadoCaptacionesConsolidado :TfrmListadoCaptacionesConsolidado;
begin
  Timer2.Enabled := False;
  frmListadoCaptacionesConsolidado:=TfrmListadoCaptacionesConsolidado.Create(Self);
  frmListadoCaptacionesConsolidado.ShowModal;
  Timer2.Enabled := True;
end;

procedure TfrmMain.BtnConsultaPersonaClick(Sender: TObject);
begin
  ConsultadeGerencia1.Click;
end;

procedure TfrmMain.ConsultaGarantia1Click(Sender: TObject);
begin
        frmMantenimientoGarantiaReal := TfrmMantenimientoGarantiaReal.Create(Self);
        frmMantenimientoGarantiaReal.ShowModal;

end;

end.
