unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin, unitdmGeneral, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, DateUtils, IBSQL, JclSysUtils, UnitVisacionRetiros,
  DB, IBCustomDataSet, IBQuery;

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
    ProrrogaCaptaciones: TMenuItem;
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
    EnviodeChequesaTesoreria1: TMenuItem;
    N3: TMenuItem;
    LiberacindeCanje1: TMenuItem;
    DevolucindeCheques1: TMenuItem;
    CajaCheques1: TMenuItem;
    CambiarContrasea1: TMenuItem;
    Gestiones1: TMenuItem;
    ControlCobro1: TMenuItem;
    C1: TMenuItem;
    LibrosAuxiliares1: TMenuItem;
    Timer1: TTimer;
    N4: TMenuItem;
    SaldosenCaja1: TMenuItem;
    ChequesenCanje1: TMenuItem;
    Timer2: TTimer;
    N5: TMenuItem;
    Observaciones1: TMenuItem;
    IBSQL1: TIBSQL;
    Utilidades1: TMenuItem;
    InformacindeCrditos1: TMenuItem;
    ConsultadeSolicitudes1: TMenuItem;
    N6: TMenuItem;
    ComprobanteSucursal1: TMenuItem;
    Ii1: TMenuItem;
    SaldosenCaja2: TMenuItem;
    N7: TMenuItem;
    C2: TMenuItem;
    CertificadosReteIvaProveedores1: TMenuItem;
    IBQuery1: TIBQuery;
    N8: TMenuItem;
    InformeCuentasExcentasGMF1: TMenuItem;
    RequerimientoSistemas1: TMenuItem;
    MantenimientodePersonas1: TMenuItem;
    N9: TMenuItem;
    C3: TMenuItem;
    N10: TMenuItem;
    ConsultaExtractoAgencias1: TMenuItem;
    PlanillaGMF1: TMenuItem;
    ConsultarListado1: TMenuItem;
    N11: TMenuItem;
    Canjes1: TMenuItem;
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
    procedure EnviodeChequesaTesoreria1Click(Sender: TObject);
    procedure LiberacindeCanje1Click(Sender: TObject);
    procedure CajaCheques1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure ControlCobro1Click(Sender: TObject);
    procedure LibrosAuxiliares1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SaldosenCaja1Click(Sender: TObject);
    procedure ChequesenCanje1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Observaciones1Click(Sender: TObject);
    procedure ConsultadeSolicitudes1Click(Sender: TObject);
    procedure InformacindeCrditos1Click(Sender: TObject);
    procedure ComprobanteSucursal1Click(Sender: TObject);
    procedure Ii1Click(Sender: TObject);
    procedure SaldosenCaja2Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure CertificadosReteIvaProveedores1Click(Sender: TObject);
    procedure InformeCuentasExcentasGMF1Click(Sender: TObject);
    procedure RequerimientoSistemas1Click(Sender: TObject);
    procedure MantenimientodePersonas1Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure ConsultaExtractoAgencias1Click(Sender: TObject);
    procedure PlanillaGMF1Click(Sender: TObject);
    procedure DevolucindeCheques1Click(Sender: TObject);
    procedure ConsultarListado1Click(Sender: TObject);
    procedure Canjes1Click(Sender: TObject);
  private
    { Private declarations }
    FEnPasabordo:Boolean;
    SalirMal:Boolean;
    TheGraphic: TBitmap;
    FUltimaActividad:TDateTime;    
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
    procedure CierreSucursal;
  public
    { Public declarations }
    ruta1:string;
    property EnPasabordo:Boolean read FEnPasabordo Write FEnPasabordo;
  end;

var
  frmMain: TfrmMain;
  frmVisacionRetiros:TfrmVisacionRetiros;
  FechaHora: TDateTime;

implementation

{$R *.dfm}

uses unitLogin, unitdmColocacion, IniFiles,
     unitConsultaProductos,unitConsultaExtractoCaptacion,
     unit_Comprobante,UnitChequesenTesoreria,UnitLiberacionCanje, UnitDevolucionCheques,
     UnitCambiarContrasena,UnitInformeAuxiliar,
     unitControlCobroCartera, unitTesoreria, UnitChequesSinLiberar,
     unitRelogin,UnitControldeObservaciones, UnitLiquidacionGral, UnitConsultaSol,
     UnitComprobanteSucursal, UnitInformeCajaRemota, UnitSaldosCaja,
     UnitCertificadoRetefuente, UnitCertificadoReteIva, UnitInformeTesoreriaExcentasGMF,
     UnitCambios, UnitCreaciondePersona, UnitFechaSucursal,
     UnitExtractoAgencia, UnitPlanillaGMF,UnitConsultarListado,UnitConsultaCanje;

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
    Role:string;
    Dias:Integer;
    Ufecha,Hoy:TDate;
//    frmConectando:TfrmConectando;
begin
  Application.OnMessage := AtraparMensajes;
  Timer2.Enabled := False;
  FEnPasabordo := False;

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
    DBserver1 := ReadString('DBALTER','server','192.168.200.8');
    DBpath1   := ReadString('DBALTER','path','/var/db/fbird/');
    DBname1   := ReadString('DBALTER','name','database.fdb');

    host_abrego := ReadString('ADICIONALES','host_abrego','0.0.0.0');
    host_convencion := ReadString('ADICIONALES','host_convencion','0.0.0.0');
    host_aguachica :=  ReadString('ADICIONALES','host_aguachica','0.0.0.0');
    puerto_abrego := ReadInteger('ADICIONALES','puerto_abrego',0);
    puerto_convencion := ReadInteger('ADICIONALES','puerto_convencion',0);
    puerto_aguachica :=  ReadInteger('ADICIONALES','puerto_aguachica',0);
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
        frmLogin.EdRole.Text := 'TESORERIA';
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
  Ruta1 := Ruta;
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');

  frmVisacionRetiros := TfrmVisacionRetiros.Create(Self);
  frmVisacionRetiros.IBEvents1.Database := dmGeneral.IBDatabase1;
  frmVisacionRetiros.IBEvents1.Events.Clear;
  frmVisacionRetiros.IBEvents1.Events.Add('por_visar');
  frmVisacionRetiros.IBEvents1.Registered := True;

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
        if MessageDlg('Seguro que desea cerrar el Módulo de Tesorería',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
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
        Self.Caption := 'Módulo Tesorería - '+ DBserver;

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

procedure TfrmMain.EnviodeChequesaTesoreria1Click(Sender: TObject);
var frmChequesenTesoreria:TfrmChequesenTesoreria;
begin
       frmChequesenTesoreria := TfrmChequesenTesoreria.Create(Self);
       frmChequesenTesoreria.ShowModal;
end;

procedure TfrmMain.LiberacindeCanje1Click(Sender: TObject);
var frmLiberacionCanje:TfrmLiberacionCanje;
begin
        frmLiberacionCanje := TfrmLiberacionCanje.Create(Self);
        frmLiberacionCanje.ShowModal;
        FreeAndNil(frmLiberacionCanje);
end;

procedure TfrmMain.CajaCheques1Click(Sender: TObject);
//var frmOperacionesCaja:TfrmOperacionesCaja;
begin
{        frmOperacionesCaja:=TfrmOperacionesCaja.Create(Self);
        if not frmOperacionesCaja.ValidarCaja then
        begin
           MessageDlg('Usted no está habilitado para manejar caja',mtError,[mbcancel],0);
           frmOperacionesCaja.Free;
        end
        else
        frmOperacionesCaja.ShowModal;}
end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
var frmCambiarContrasena:TfrmCambiarContrasena;
begin
    frmCambiarContrasena := TfrmCambiarContrasena.Create(Self);
    frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.ControlCobro1Click(Sender: TObject);
var frmControlCobroCartera : TfrmControlCobroCartera;
begin
        frmControlCobroCartera := TfrmControlCobroCartera.Create(Self);
        frmControlCobroCartera.ShowModal;
end;

procedure TfrmMain.LibrosAuxiliares1Click(Sender: TObject);
var frmInformeAuxiliares:TfrmInformeAuxiliares;
begin
    frmInformeAuxiliares := TfrmInformeAuxiliares.Create(Self);
    frmInformeAuxiliares.ShowModal;
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

procedure TfrmMain.SaldosenCaja1Click(Sender: TObject);
var frmtesoreria : TFrmtesoreria;
begin
        Frmtesoreria := TFrmtesoreria.Create(Self);
        frmtesoreria.ShowModal;
end;

procedure TfrmMain.ChequesenCanje1Click(Sender: TObject);
var frmChequesSinLiberar : TfrmChequesSinLiberar;
begin
        frmChequesSinLiberar := TfrmChequesSinLiberar.Create(Self);
        frmChequesSinLiberar.ShowModal;
end;

procedure TfrmMain.Timer2Timer(Sender: TObject);
var frmReLogin:TfrmReLogin;
    Pasabordo :string;
    ESPERA:Extended;
begin
  Timer2.Enabled := False;
  ESPERA := ((1 / 24 / 60) * DBMinutos);
  FEnPasabordo := True;
  if (FUltimaActividad + ESPERA) < Now then begin
    FEnPasabordo := True;
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
      end
      else
       FEnPasabordo := False;
    end
    else
    begin
        SalirMal := True;
        Close;
        Exit;
    end;
  end;
  EnPasabordo := False;
  Timer2.Enabled := True;
end;

procedure tfrmmain.AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of
    WM_KEYFIRST..WM_KEYLAST,
    WM_LBUTTONDOWN..WM_MOUSELAST: FUltimaActividad := Now;
  end;
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

procedure TfrmMain.Observaciones1Click(Sender: TObject);
var frmControldeObservaciones:TfrmControldeObservaciones;
begin
    frmControldeObservaciones := TfrmControldeObservaciones.Create(Self);
    frmControldeObservaciones.ShowModal;
end;

procedure TfrmMain.ConsultadeSolicitudes1Click(Sender: TObject);
var frmConsultaSol : TfrmConsultaSol;
begin
        frmConsultaSol := TfrmConsultaSol.Create(Self);
        frmConsultaSol.ShowModal;
end;

procedure TfrmMain.InformacindeCrditos1Click(Sender: TObject);
var frmLiquidacionGral : TfrmLiquidacionGral;
begin
        frmLiquidacionGral := TfrmLiquidacionGral.Create(Self);
        frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.ComprobanteSucursal1Click(Sender: TObject);
begin
        if (ValidaHoraCaja.Estado) or (ValidaHoraCaja.Hora = 0) then
        begin
           if ValidaHoraCaja.Hora <> 0 then
              MessageDlg('La Nota Referente a las Sucursales, los Dias ' + FormatDateTime('dddd',fFechaActual) + #13 + 'Solo se puede Generar despues de las ' + FormatDateTime('hh:mm:ss AM/PM',validahoracaja.Hora),mtInformation,[mbok],0)
           else
              MessageDlg('El Dia ' + FormatDateTime('dddd',fFechaActual) + ' No se Genera Nota de Sucursales',mtInformation,[mbok],0);
           Exit;
        end;
        CierreSucursal;
        FrmComprobanteSucursal := TFrmComprobanteSucursal.Create(self);
        FrmComprobanteSucursal.ShowModal;
end;

procedure TfrmMain.CierreSucursal;
var     Id_Remoto :Integer;
        Es_Sucursal :Boolean;
begin
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"caj$movremotoentrada".NUMERO_CUENTA');
          SQL.Add('FROM');
          SQL.Add('"caj$movremotoentrada"');
          SQL.Add('WHERE');
          SQL.Add('("caj$movremotoentrada".FECHA_MOV BETWEEN :FECHA1 AND :FECHA2)');
          ParamByName('FECHA1').AsDateTime := fFechaActual + StrToTime('00:00:00');
          ParamByName('FECHA2').AsDateTime := fFechaActual + StrToTime('23:59:59');
          Open;
          if RecordCount <> 0 then
          begin
            Close;
            SQL.Clear;
            SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 18');
            Open;
            Id_Remoto := FieldByName('VALOR_MINIMO').AsInteger;
            Close;
            SQL.Clear;
            SQL.Add('select * from "caj$cierresucursal" where ID_CAJA = :ID_CAJA and FECHA = :FECHA');
            ParamByName('ID_CAJA').AsInteger := Id_Remoto;
            ParamByName('FECHA').AsDate := fFechaActual;
            Open;
            if RecordCount < 1 then
            begin
              try
                Close;
                SQL.Clear;
                SQL.Add('insert into "caj$cierresucursal" values (:ID_CAJA,:FECHA,:CONTABILIZADO,:ES_MOVIMIENTO)');
                ParamByName('ID_CAJA').AsInteger := Id_Remoto;
                ParamByName('FECHA').AsDate := fFechaActual;
                ParamByName('CONTABILIZADO').AsInteger := 0;
                ParamByName('ES_MOVIMIENTO').AsInteger := 1;
                ExecSQL;
                Transaction.Commit;
              except
                Close;
              end;
            end;
          end;
        end;
end;

procedure TfrmMain.Ii1Click(Sender: TObject);
begin
        FrmInformeCajaRemota := TFrmInformeCajaRemota.Create(self);
        FrmInformeCajaRemota.ShowModal
end;

procedure TfrmMain.SaldosenCaja2Click(Sender: TObject);
begin
           FrmSaldosCaja := TFrmSaldosCaja.Create(Self);
           FrmSaldosCaja.ShowModal;

end;

procedure TfrmMain.C2Click(Sender: TObject);
var frmCertificadoRetefuente: TfrmCertificadoRetefuente;
begin
        frmCertificadoRetefuente := TfrmCertificadoRetefuente.Create(Self);
        frmCertificadoRetefuente.ShowModal;
end;

procedure TfrmMain.CertificadosReteIvaProveedores1Click(Sender: TObject);
var frmCertificadoReteIVa: TfrmCertificadoReteIva;
begin
        frmCertificadoReteIva := TfrmCertificadoReteIva.Create(Self);
        frmCertificadoReteIva.ShowModal;
end;

procedure TfrmMain.InformeCuentasExcentasGMF1Click(Sender: TObject);
var
  frmInformeTesoreriaExcentasGMF:TfrmInformeTesoreriaExcentasGMF;
begin
     frmInformeTesoreriaExcentasGMF := TfrmInformeTesoreriaExcentasGMF.Create(Self);
     frmInformeTesoreriaExcentasGMF.ShowModal;
end;

procedure TfrmMain.RequerimientoSistemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal
end;

procedure TfrmMain.MantenimientodePersonas1Click(Sender: TObject);
begin
        frmCreacionPersona := TfrmCreacionPersona.Create(Self);
        frmCreacionPersona.ShowModal;
end;

procedure TfrmMain.C3Click(Sender: TObject);
begin
        if Agencia = 1 then
        begin
          FrmFechaSucursal := TFrmFechaSucursal.Create(Self);
          FrmFechaSucursal.ShowModal;
        end
end;

procedure TfrmMain.ConsultaExtractoAgencias1Click(Sender: TObject);
begin
        FrmExtractoAgencia := TFrmExtractoAgencia.Create(Self);
        FrmExtractoAgencia.ShowModal;
end;

procedure TfrmMain.PlanillaGMF1Click(Sender: TObject);
var
  frmPlanillaGMF : TfrmPlanillaGMF;
begin
  frmPlanillaGMF := TfrmPlanillaGMF.Create(self);
  frmPlanillaGMF.ShowModal;
end;

procedure TfrmMain.DevolucindeCheques1Click(Sender: TObject);
var
  frmDevolucionCheques:TfrmDevolucionCheques;
begin
  frmDevolucionCheques := TfrmDevolucionCheques.Create(self);
  frmDevolucionCheques.ShowModal;
end;

procedure TfrmMain.ConsultarListado1Click(Sender: TObject);
var
 frmVerListados:TfrmVerListados;
begin
        frmVerListados := TfrmVerlistados.Create(Self);
        frmVerListados.ShowModal;
end;

procedure TfrmMain.Canjes1Click(Sender: TObject);
var
        frm :TFrmConsultaCanje;
begin
        frm := TFrmConsultaCanje.Create(self);
        frm.ShowModal;
        FreeAndNil(frm);
end;

end.
