unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime;

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
    ProcesosBalance1: TMenuItem;
    CausacindeCaptaciones1: TMenuItem;
    CausacindeColocaciones1: TMenuItem;
    N6: TMenuItem;
    ConsolidarBalances1: TMenuItem;
    Agencias1: TMenuItem;
    MayoryBalance2: TMenuItem;
    BalanceGeneralDetallado2: TMenuItem;
    EstadodeIngresosyGastos2: TMenuItem;
    CausacindeCDATS1: TMenuItem;
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
    procedure CausacindeColocaciones1Click(Sender: TObject);
    procedure ConsolidarBalances1Click(Sender: TObject);
    procedure CausacindeCDATS1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;


implementation

{$R *.dfm}

uses unitLogin, IniFiles,
     unitConsultaProductos,unitConsultaExtractoCaptacion,
     unit_Comprobante,unitCierreDia,UnitBalanceGeneral,
     UnitBalanceGralDetallado,UnitInformeAuxiliar,Unit_Mantenimientopuc,
     UnitListadodePrueba, UnitPlanillaResumen, UnitRecuperacionSaldos,
     UnitCausacionColocaciones, UnitConsolidarBalance, unitCausacionCdat;

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
    DBserver := ReadString('DBNAME','server','192.168.1.8');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
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
        frmLogin.EdRole.Text := 'CONTABILIDAD_A';
        dmgeneral := tdmgeneral.Create(Self);
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
        frmRecuperacionSaldos := Tfrmrecuperacionsaldos.Create(Self);
        frmRecuperacionSaldos.ShowModal;
end;

procedure TfrmMain.CausacindeColocaciones1Click(Sender: TObject);
var frmCausacionColocaciones:TfrmCausacionColocaciones;
begin
     frmCausacionColocaciones := TfrmCausacionColocaciones.Create(self);
     frmCausacionColocaciones.ShowModal;
end;

procedure TfrmMain.ConsolidarBalances1Click(Sender: TObject);
var frmConsolidarBalance:TfrmConsolidarBalance;
begin
        frmConsolidarBalance := TfrmConsolidarBalance.Create(Self);
        frmConsolidarBalance.ShowModal;
end;

procedure TfrmMain.CausacindeCDATS1Click(Sender: TObject);
var frmCausacionCdat : Tfrmcausacioncdat;
begin
        frmcausacioncdat := Tfrmcausacioncdat.Create(Self);
        frmcausacioncdat.ShowModal;
end;

end.
