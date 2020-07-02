unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, pr_Common, pr_TxClasses, DB,
  IBCustomDataSet, IBQuery, DateUtils,JclSysUtils;

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
    ProcesosEspeciales1: TMenuItem;
    ToolBar1: TToolBar;
    BtnInformes: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    IdTime1: TIdTime;
    CambiarContrasea1: TMenuItem;
    N8: TMenuItem;
    Timer1: TTimer;
    BtnEntregaDetalles: TToolButton;
    EntregadeAyudas1: TMenuItem;
    Reporte: TprTxReport;
    OD1: TOpenDialog;
    Timer2: TTimer;
    Informes1: TMenuItem;
    ToolButton1: TToolButton;
    InformeDetallesEntregados1: TMenuItem;
    Consultas1: TMenuItem;
    ConsultadeGerencia1: TMenuItem;
    ExportarDatos1: TMenuItem;
    IBQuery1: TIBQuery;
    InformeProgramaJuvenil1: TMenuItem;
    DatoGeneral1: TMenuItem;
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
    procedure EntregadeDetalles1Click(Sender: TObject);
    procedure BtnEntregaDetallesClick(Sender: TObject);
    procedure UltimaEntregaImpresa1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure InformeDetallesEntregados1Click(Sender: TObject);
    procedure BtnInformesClick(Sender: TObject);
    procedure ConsultadeGerencia1Click(Sender: TObject);
    procedure ExportarDatos1Click(Sender: TObject);
    procedure InformeProgramaJuvenil1Click(Sender: TObject);
    procedure EntregadeAyudas1Click(Sender: TObject);
    procedure DatoGeneral1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;

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
     UnitCambiarContrasena,UnitEntregaDetalles,
     UnitInformeDetalles, UnitConsultaProductos, UnitExportar,
     UnitReportePrograma, UnitDatroGeneral;

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
    _iTipoDetalle := ReadInteger('EMPRESA','tipdetalle',1);
    DBAnho := ReadInteger('EMPRESA','dbanho',2017);
  finally
    free;
  end;

        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'GERENCIA';
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
         // ojo cambio realizado por el caso de aguachica
        IdTime1.Host := DBserver;
        if IdTime1.Connected then
           FechaHoy := IdTime1.DateTime;
        if not IdTime1.SyncTime then
        begin
          SalirMal := True;
          Exit;
        end;
        //FechaHoy := Date;
  with IBQuery1 do
  begin
    Close;
    if Transaction.InTransaction then
       Transaction.Rollback;
    Transaction.StartTransaction;
    ParamByName('TIPO').AsInteger := _iTipoDetalle;
    Open;
    vFechaLimite := FieldByName('FECHAAPERTURA').AsDateTime;
    _bAporte := IntToBool(FieldByName('APORTES').AsInteger);
    _bEducacion := IntToBool(FieldByName('EDUCACION').AsInteger);
    _bAhorro := IntToBool(FieldByName('AHORROS').AsInteger);
    _bColocacion := IntToBool(FieldByName('COLOCACION').AsInteger);
    _bFianzas := IntToBool(FieldByName('FIANZA').AsInteger);
    _bJuvenil := IntToBool(FieldByName('JUVENIL').AsInteger);
    _sDetalle := FieldByName('DESCRIPCION').AsString;
    Close;
  end;
  //ShowMessage(DateToStr(vFechaLimite));
  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  if _iTipoDetalle = 1 then
     TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp')
  else
     TheGraphic.LoadFromFile(Ruta+'\Coopservirjuv.bmp');
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
        if MessageDlg('Seguro que desea cerrar SIF',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
         with TIniFile.Create(MiINI) do
          try
         //   WriteString('DBNAME','server',DBserver);
         //   WriteString('DBNAME','path',DBpath);
         //   WriteString('DBNAME','name',DBname);
         //   WriteString('EMPRESA','name',Empresa);
         //   WriteString('EMPRESA','nit',Nit);
         //   WriteInteger('EMPRESA','Agencia',Agencia);
         //   WriteString('EMPRESA','city',Ciudad);
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
      Self.Caption := _sDetalle;
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

procedure TfrmMain.EntregadeDetalles1Click(Sender: TObject);
var frmEntregaDetalles:TfrmEntregaDetalles;
begin
        frmEntregaDetalles := TfrmEntregaDetalles.Create(Self);
        if _iTipoDetalle <> 2 then
        begin
           frmEntregaDetalles.TabJuvenil.TabVisible := False;
           frmEntregaDetalles.PageControl1.ActivePage := frmEntregaDetalles.TabAportes;
           end
        else
        begin
           frmEntregaDetalles.TabAportes.tABvisible := False;
           frmEntregaDetalles.PageControl1.ActivePage := frmEntregaDetalles.TabJuvenil;
           //frmEntregaDetalles.EdCuentaJuvenil.SetFocus;
        end;

        frmEntregaDetalles.ShowModal;
end;

procedure TfrmMain.BtnEntregaDetallesClick(Sender: TObject);
begin
        EntregadeDetalles1Click(Sender);
end;

procedure TfrmMain.UltimaEntregaImpresa1Click(Sender: TObject);
begin
        OD1.InitialDir := ExtractFilePath(Application.ExeName)+'Reportes\';
        OD1.DefaultExt := 'Archivos de Ayudas(*.pr)|*.pr';
        OD1.Filter := 'Archivos de Ayudas(*.pr)|*.pr';
        if OD1.Execute then begin
          Reporte.LoadPreparedReportFromFile(OD1.FileName);
          Reporte.PreviewPreparedReport(True);
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

procedure TfrmMain.InformeDetallesEntregados1Click(Sender: TObject);
var frmInformeDetalles : TfrmInformeDetalles;
begin
        frmInformeDetalles := TfrmInformeDetalles.Create(Self);
        frmInformeDetalles.Caption := _sDetalle;
        frmInformeDetalles.ShowModal;
end;

procedure TfrmMain.BtnInformesClick(Sender: TObject);
begin
        InformeDetallesEntregados1Click(Sender);
end;

procedure TfrmMain.ConsultadeGerencia1Click(Sender: TObject);
var
  frmConsultaProductos: TfrmConsultaProductos;
begin
   frmConsultaProductos := TfrmConsultaProductos.Create(Self);
   frmConsultaProductos.ShowModal;
end;

procedure TfrmMain.ExportarDatos1Click(Sender: TObject);
begin
        FrmExportar := TFrmExportar.Create(Self);
        FrmExportar.ShowModal;
end;

procedure TfrmMain.InformeProgramaJuvenil1Click(Sender: TObject);
var
frmReporteProgramaJuvenil: TfrmReportePrograma;
begin
    frmReporteProgramaJuvenil := TfrmReportePrograma.Create(self);
    frmReporteProgramaJuvenil.ShowModal;
end;

procedure TfrmMain.EntregadeAyudas1Click(Sender: TObject);
begin
        EntregadeDetalles1Click(Sender);
end;

procedure TfrmMain.DatoGeneral1Click(Sender: TObject);
begin
        FrmDatoGeneral := TFrmDatoGeneral.Create(Self);
        FrmDatoGeneral.ShowModal;
end;

end.
