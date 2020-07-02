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
    Mnu0101: TMenuItem;
    N1: TMenuItem;
    Mnu0103: TMenuItem;
    Configurar_Impresora: TAction;
    Mnu03: TMenuItem;
    Mnu0301: TMenuItem;
    Mnu02: TMenuItem;
    ToolBar1: TToolBar;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    IdTime1: TIdTime;
    Mnu0102: TMenuItem;
    N8: TMenuItem;
    Mnu0201: TMenuItem;
    Mnu0202: TMenuItem;
    Mnu020101: TMenuItem;
    Mnu020102: TMenuItem;
    Mnu020103: TMenuItem;
    Mnu010204: TMenuItem;
    Mnu020201: TMenuItem;
    Mnu020202: TMenuItem;
    Mnu020203: TMenuItem;
    Mnu020105: TMenuItem;
    SaldosPrestamos1: TMenuItem;
    otalRete1: TMenuItem;
    IntPagadosFInal1: TMenuItem;
    I1: TMenuItem;
    Otros1: TMenuItem;
    ChequesDevueltos1: TMenuItem;
    SaldosDepositos10101: TMenuItem;
    RndimientosFinancieros1: TMenuItem;
    Contabilidad1: TMenuItem;
    Retenciones1: TMenuItem;
    A1: TMenuItem;
    InteresRecibido10071: TMenuItem;
    SaldosPrestamos10081: TMenuItem;
    PrestamposEfectuados10261: TMenuItem;
    ValidarCDATs1: TMenuItem;
    Retencin1: TMenuItem;
    CertificadoDeposito10201: TMenuItem;
    Version71: TMenuItem;
    Versin91: TMenuItem;
    F10011: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Mnu0101Click(Sender: TObject);
    procedure Mnu0103Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure Mnu0102Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Mnu020101Click(Sender: TObject);
    procedure Mnu020102Click(Sender: TObject);
    procedure Mnu020103Click(Sender: TObject);
    procedure Mnu010204Click(Sender: TObject);
    procedure Mnu020202Click(Sender: TObject);
    procedure Mnu020203Click(Sender: TObject);
    procedure Mnu020105Click(Sender: TObject);
    procedure SaldosPrestamos1Click(Sender: TObject);
    procedure otalRete1Click(Sender: TObject);
    procedure IntPagadosFInal1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure BtnConsultaPersonaClick(Sender: TObject);
    procedure SaldosDepositos10101Click(Sender: TObject);
    procedure RndimientosFinancieros1Click(Sender: TObject);
    procedure Retenciones1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure InteresRecibido10071Click(Sender: TObject);
    procedure SaldosPrestamos10081Click(Sender: TObject);
    procedure PrestamposEfectuados10261Click(Sender: TObject);
    procedure ValidarCDATs1Click(Sender: TObject);
    procedure Version71Click(Sender: TObject);
    procedure Versin91Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
  public
      DescAgencia :string;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDateTime;

implementation

{$R *.dfm}

uses unitLogin, IniFiles,
     UnitCambiarContrasena, UnitInteresRetencionPagado,
     UnitInteresesRecibidos, UnitDepositosPeriodo,
     UnitDeudasPeriodo, UnitMovimientoCredito, UnitCdatPeriodo,
     UnitPrestamos, UnitRetencionesPracticadas, UnitInteresesPagados,
  UnitPrestamosCorte, UnitCodigos, UnitAgencia, UnitIntPagadoF,
  UnitInteresRete, UnitRetencionesPracticadasVal, UnitAportesPeriodo,UnitRetencionesPracticadasNueva,
  UnitRetencion, UnitValidaEmitidos, UnitMovimientoCredito_F1019v9;

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
    DescA :string;
//    frmConectando:TfrmConectando;
begin

  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  FrmAgencia := TFrmAgencia.Create(Self);
  with FrmAgencia do
  begin
    ShowModal;
    DescA := 'DBNAME' + IntToStr(Cb.ItemIndex + 1);
    DescAgencia := Cb.Text;
    Free;
  end;
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString(DescA,'server','0.0.0.0');
    DBPath := ReadString(DescA,'path','/home/');
    DBname := ReadString(DescA,'name','coopservir.gdb');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    _dFechaCorteAhorros := ReadInteger('ADICIONALES','fechaahorros',1);
    _dFechaCorteCausacion := ReadInteger('ADICIONALES','fechacausacion',1);
    _dFechaInicial := ReadInteger('ADICIONALES','fechainicial',1);
    _iAno := ReadInteger('ADICIONALES','ano',1);
    _Nit := ReadString('ADICIONALES','nit','0000000000');
  finally
    free;
  end;
        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'CONTABILIDAD_A';
        dmGeneral.IBDatabase1.Connected := False;
        {while Not dmGeneral.IBDatabase1.Connected do
          begin
           if Veces = 3 then
           begin
                SalirMal := True;
                Exit;
           end;
          if frmLogin.ShowModal = mrOk then
           begin
             with frmLogin do
             begin}
//                DBAlias := EdUsuario.Text;
//                DBPasabordo:= EdPasabordo.Text;
//                Role := EdRole.Text;
                dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
                dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
                dmGeneral.IBDatabase1.Params.Values['User_Name'] := 'sysdba';//DBAlias;
                dmGeneral.IBDatabase1.Params.Values['PassWord'] := 'masterkey';//DBPasabordo;
                dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := Role;
                Veces := Veces + 1;

                try
                    dmGeneral.IBDatabase1.Connected := True;
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

            { end; //fin del begin del with

            end // fin del begin del if superior
          else
          begin
             SalirMal := True;
             Exit;
          end;
         end;} // fin del while

        IdTime1.Host := DBserver;
        {
        if IdTime1.Connected then
           FechaHoy := IdTime1.DateTime;
        if not IdTime1.SyncTime then
        begin
          SalirMal := True;
          Exit;
        end;
        }
//  _dFechaCorteAhorros :=
//  _iUltimoDia := DaysInMonth(EncodeDate(_iAno,_iMes,01));
  Self.Caption := 'Modulo Dian - ' + DBserver + ':' + DBpath + DBname + '  -' + DescAgencia + '  FechaAhorros: ' + DateToStr(_dFechaCorteAhorros) + '  FechaCausaciones: ' + DateToStr(_dFechaCorteCausacion) + ' FechaInicial: ' + DateToStr(_dFechaInicial);
  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
           Action := caFree;
end;

procedure TfrmMain.Mnu0101Click(Sender: TObject);
begin
        PrinterSetupDialog.Execute;
end;



procedure TfrmMain.Mnu0103Click(Sender: TObject);
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
        if MessageDlg('Seguro que desea cerrar el Módulo',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
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
        if SalirMal then
           Self.Close;
end;


procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
     Mnu0103.Click;
end;


procedure TfrmMain.Mnu0102Click(Sender: TObject);
var frmCambiarContrasena:TfrmCambiarContrasena;
begin
     frmCambiarContrasena := TfrmCambiarContrasena.Create(self);
     frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
     EnterTabs(Key,Self);
end;


procedure TfrmMain.Mnu020101Click(Sender: TObject);
var
  frmInteresesPagados:TfrmInteresesPagados;
begin
  frmInteresesPagados := TfrmInteresesPagados.Create(Self);
  frmInteresesPagados.ShowModal;
end;

procedure TfrmMain.Mnu020102Click(Sender: TObject);
var frmInteresesRecibidos:TfrmInteresesRecibidos;
begin
     frmInteresesRecibidos := TfrmInteresesRecibidos.Create(Self);
     frmInteresesRecibidos.ShowModal;
end;

procedure TfrmMain.Mnu020103Click(Sender: TObject);
var
  frmDepositosPeriodo:TfrmDepositosPeriodo;
begin
  frmDepositosPeriodo := TfrmDepositosPeriodo.Create(Self);
  frmDepositosPeriodo.ShowModal;
end;

procedure TfrmMain.Mnu010204Click(Sender: TObject);
var
  frmDeudasPeriodo:TfrmDeudasPeriodo;
begin
  frmDeudasPeriodo := TfrmDeudasPeriodo.Create(Self);
  frmDeudasPeriodo.ShowModal;  
end;

procedure TfrmMain.Mnu020202Click(Sender: TObject);
begin
        frmCdatPeriodo := TfrmCdatPeriodo.Create(Self);
        frmCdatPeriodo.ShowModal;
end;

procedure TfrmMain.Mnu020203Click(Sender: TObject);
begin
        frmPrestamos := TfrmPrestamos.Create(self);
        frmPrestamos.ShowModal;
end;

procedure TfrmMain.Mnu020105Click(Sender: TObject);
var
  frmRetencionesPracticadas:TfrmRetencionesPracticadas;
begin
     frmRetencionesPracticadas := TfrmRetencionesPracticadas.Create(Self);
     frmRetencionesPracticadas.ShowModal;
end;

procedure TfrmMain.SaldosPrestamos1Click(Sender: TObject);
begin
        frmPrestamosCorte := TfrmPrestamosCorte.Create(Self);
        frmPrestamosCorte.ShowModal;
end;

procedure TfrmMain.otalRete1Click(Sender: TObject);
begin
        FrmCodigo := TFrmCodigo.Create(Self);
        FrmCodigo.ShowModal;
end;

procedure TfrmMain.IntPagadosFInal1Click(Sender: TObject);
begin
        FrmConInteresPago := TFrmConInteresPago.Create(Self);
        FrmConInteresPago.ShowModal;
end;

procedure TfrmMain.I1Click(Sender: TObject);
begin
        FrmInteresRete := TFrmInteresRete.Create(Self);
        FrmInteresRete.ShowModal
end;

procedure TfrmMain.BtnConsultaPersonaClick(Sender: TObject);
begin
        frmRetencionesPracticadasVal := tfrmRetencionesPracticadasVal.Create(Self);
        frmRetencionesPracticadasVal.ShowModal;
end;

procedure TfrmMain.SaldosDepositos10101Click(Sender: TObject);
begin
        frmAportesPeriodo := TfrmAportesPeriodo.Create(Self);
        frmAportesPeriodo.ShowModal
end;

procedure TfrmMain.RndimientosFinancieros1Click(Sender: TObject);
var
  frmRetencionesPracticadasNueva:TfrmRetencionesPracticadasNueva;
begin
     frmRetencionesPracticadasNueva := TfrmRetencionesPracticadasNueva.Create(Self);
     frmRetencionesPracticadasNueva.ShowModal;


end;

procedure TfrmMain.Retenciones1Click(Sender: TObject);
begin
        FrmRetenciones := TFrmRetenciones.Create(Self);
        FrmRetenciones.ShowModal;
end;

procedure TfrmMain.A1Click(Sender: TObject);
begin
        frmAportesPeriodo := TfrmAportesPeriodo.Create(Self);
        frmAportesPeriodo.ShowModal

end;

procedure TfrmMain.InteresRecibido10071Click(Sender: TObject);
begin
     frmInteresesRecibidos := TfrmInteresesRecibidos.Create(Self);
     frmInteresesRecibidos.ShowModal;

end;

procedure TfrmMain.SaldosPrestamos10081Click(Sender: TObject);
begin
        frmPrestamosCorte := TfrmPrestamosCorte.Create(Self);
        frmPrestamosCorte.ShowModal;
end;

procedure TfrmMain.PrestamposEfectuados10261Click(Sender: TObject);
begin
        frmPrestamos := TfrmPrestamos.Create(self);
        frmPrestamos.ShowModal;

end;

procedure TfrmMain.ValidarCDATs1Click(Sender: TObject);
begin
        FrmValidaEmitidos := TFrmValidaEmitidos.Create(Self);
        FrmValidaEmitidos.ShowModal;
end;

procedure TfrmMain.Version71Click(Sender: TObject);
var
  frmMovimientoCredito:TfrmMovimientoCredito;
begin
  frmMovimientoCredito := TfrmMovimientoCredito.Create(Self);
  frmMovimientoCredito.ShowModal;
end;

procedure TfrmMain.Versin91Click(Sender: TObject);
var
  frmMovimientoCredito_F1019v9:TfrmMovimientoCredito_F1019v9;
begin
  frmMovimientoCredito_F1019v9 := TfrmMovimientoCredito_F1019v9.Create(Self);
  frmMovimientoCredito_F1019v9.ShowModal;
end;

end.
