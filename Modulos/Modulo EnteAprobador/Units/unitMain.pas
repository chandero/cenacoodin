unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdActns, unitGlobales, ComCtrls,
  ToolWin,IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTime, ExtCtrls, DateUtils, DB, DBClient, IBSQL;

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
    ToolBar1: TToolBar;
    BtnExtracto: TToolButton;
    ToolButton3: TToolButton;
    BtnConsultaPersona: TToolButton;
    ToolButton5: TToolButton;
    BtnSalir: TToolButton;
    IdTime1: TIdTime;
    Consultas1: TMenuItem;
    ToolButton2: TToolButton;
    CambiarContrasea1: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;
    Solicitudes1: TMenuItem;
    Procesos1: TMenuItem;
    EstudioSolicitud1: TMenuItem;
    Informes1: TMenuItem;
    InformeDiario1: TMenuItem;
    CDinforme: TClientDataSet;
    CDinformeradicado: TStringField;
    CDinformeid_ente: TSmallintField;
    Reportes1: TMenuItem;
    SolicitudporEmpleado1: TMenuItem;
    SolicitudesFundacion1: TMenuItem;
    CDparticipantes: TClientDataSet;
    CDparticipantesnombre: TStringField;
    CDparticipantescargo: TStringField;
    EstudioSolicitudAgencias1: TMenuItem;
    CDinformevalor: TCurrencyField;
    CDinformeoficina: TStringField;
    CDinformenombres: TStringField;
    CDinformeid_oficina: TIntegerField;
    CDinformeestado: TIntegerField;
    CDinformedes_estado: TStringField;
    GeneralEmpleados1: TMenuItem;
    Analistas1: TMenuItem;
    RatificaciondeCrditos1: TMenuItem;
    Utilidades1: TMenuItem;
    InformacindeCrditos1: TMenuItem;
    CDinformegarantia: TIntegerField;
    AnuladeSolicitudes1: TMenuItem;
    SolicitudesEstudiadas1: TMenuItem;
    CDinvitados: TClientDataSet;
    CDinvitadosnombre: TStringField;
    CDinvitadoscargo: TStringField;
    ActadeSesion1: TMenuItem;
    CDinformeplazo: TIntegerField;
    CDinformecuenta: TStringField;
    PromedioCaptacin1: TMenuItem;
    CambiarFechaConcepto1: TMenuItem;
    IbLog: TIBSQL;
    Gestiones1: TMenuItem;
    RequerimientoSistemas1: TMenuItem;
    A1: TMenuItem;
    PlizaDepsitos1: TMenuItem;
    Recuperar1: TMenuItem;
    RecuperarEstudioSolicitud1: TMenuItem;
    procedure Configurar_ImpresoraExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigurarImpresora1Click(Sender: TObject);
    procedure SalirdePSI1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure BtnExtractoClick(Sender: TObject);
    procedure BtnConsultaPersonaClick(Sender: TObject);
    procedure Solicitudes1Click(Sender: TObject);
    procedure EstudioSolicitud1Click(Sender: TObject);
    procedure InformeDiario1Click(Sender: TObject);
    procedure SolicitudporEmpleado1Click(Sender: TObject);
    procedure SolicitudesFundacion1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure GeneralEmpleados1Click(Sender: TObject);
    procedure Analistas1Click(Sender: TObject);
    procedure RatificaciondeCrditos1Click(Sender: TObject);
    procedure InformacindeCrditos1Click(Sender: TObject);
    procedure AnuladeSolicitudes1Click(Sender: TObject);
    procedure SolicitudesEstudiadas1Click(Sender: TObject);
    procedure ActadeSesion1Click(Sender: TObject);
    procedure PromedioCaptacin1Click(Sender: TObject);
    procedure CambiarFechaConcepto1Click(Sender: TObject);
    procedure RequerimientoSistemas1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure PlizaDepsitos1Click(Sender: TObject);
    procedure Recuperar1Click(Sender: TObject);
    procedure RecuperarEstudioSolicitud1Click(Sender: TObject);
  private
    { Private declarations }
    SalirMal:Boolean;
    TheGraphic: TBitmap;
    FUltimaActividad:TDateTime;
    dbminutos :Real ;
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
    procedure registra_sesion;
    procedure DeleteDir(APath: string);
  public
  wpath :string;
  n_acta :string;
  ente_arpobador :string;
  archivo :TextFile;
  _sSession :string;
  hora_inicio: TTime;
  ruta1 :string;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  FechaHora: TDate;

implementation

{$R *.dfm}

uses unitLogin, IniFiles,UnitReLogin,UnitDmgeneral, UnitEnteAprobador, UnitConsultaSol,
  UnitInformeEnte, UnitConsultaSolicitud, UnitEntePerticipantes,
  UnitCambiarContrasena, UnitRatificacion,
  UnitLiquidacionGral, UnitAnulaSolicitud, UnitReporteEnte, UnitDmSolicitud,
  UnitActa, UnitPromedioCaptacion, UnitCambioFecha, UnitDmLog, UnitCambios,
  UnitAprobadas,UnitSeguroDepositos, UnitRecEstudio,UnitRecuperaEsturdio;

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
  Application.OnMessage := AtraparMensajes;
  Timer2.Enabled := False;

  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.1.8');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    _sServerImagen := ReadString('DBNAME','serverimagen','');    
    DBserver1 := ReadString('DBNAME','server1','192.168.1.2');
    DBPath1 := ReadString('DBNAME','path1','/var/db/fbird/');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','OCAÑA N.S.');
    DBMinutos := ReadFloat('ADICIONALES','timerrelogin',1);
    host_abrego := ReadString('ADICIONALES','host_abrego','0.0.0.0');
    host_ocana := ReadString('ADICIONALES','host_ocana','0.0.0.0');
    host_convencion := ReadString('ADICIONALES','host_convencion','0.0.0.0');
    host_aguachica := ReadString('ADICIONALES','host_aguachica','0.0.0.0');
    puerto_abrego := ReadInteger('ADICIONALES','puerto_abrego',0);
    puerto_aguachica := ReadInteger('ADICIONALES','puerto_aguachica',0);
    puerto_ocana := ReadInteger('ADICIONALES','puerto_ocana',0);
    puerto_convencion := ReadInteger('ADICIONALES','puerto_convencion',0);
    PCOcana := ReadInteger('CONSULTA','pocana',0);
    PCConvencion := ReadInteger('CONSULTA','pconvencion',0);
    PCAbrego := ReadInteger('CONSULTA','pabrego',0);
    _sDescuentos := ReadString('ADICIONALES','Aportes','50');
  finally
    free;
  end;
        {
        IdTime1.Host := DBserver;
        if IdTime1.Connected then
           FechaHoy := IdTime1.DateTime;
        if not IdTime1.SyncTime then
        begin
          SalirMal := True;
          Exit;
        end;
        }
        Veces := 0;
        frmLogin := TfrmLogin.Create(Self);
        frmLogin.EdRole.Text := 'ENTEAPROBADOR';
        dmgeneral.IBDatabase1.Connected := False;
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
                dmGeneral.IBDatabase1.Params.Values['User_Name'] := LowerCase(DBAlias);
                dmGeneral.IBDatabase1.Params.Values['PassWord'] := LowerCase(DBPasabordo);
                dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := 'ANALISTA';
                Veces := Veces + 1;
                try
                    dmGeneral.IBDatabase1.Connected := True;
                    dmGeneral.IBTransaction1.Active := True;
                    FrmEnteParticipantes := TFrmEnteParticipantes.Create(self);
                    FrmEnteParticipantes.ShowModal;
                    if Id_EnteAprobador <> 3 then
                       CambiarFechaConcepto1.Enabled := False;

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
        if not DirectoryExists('c:\RepEntefrp') then
        begin
           mkdir('c:\RepEntefrp');
        end;

        _sSession := 'c:\RepEntefrp\frfRec' + FormatDateTime('hhmmss',Time);
        if not DirectoryExists(_sSession) then
        begin
           mkdir(_sSession);
        end;
  Timer2.Enabled := False;
  FUltimaActividad := Now;
  ShortDateFormat := 'yyyy/mm/dd';
  Ruta := ExtractFilePath(Application.ExeName);
  wpath := Ruta;
  TheGraphic := TBitmap.Create; { Create the bitmap object }
  TheGraphic.LoadFromFile(Ruta+'\Coopservir.bmp');
  //INICIO BASE DE DATOS DE REGISTRO DE CAMBIOS
          vFechaEnte := fFechaActual;
   { with IbLog do
    begin
    try
      DmLog := TDmLog.Create(Self);
      Close;
      if Transaction.InTransaction then
         Transaction.Rollback;
      Transaction.StartTransaction;
      SQL.Clear;
      SQL.Add('select * from "gen$log"');
      ExecQuery;
      DmLog.IBDatabase1.DataBaseName := FieldByName('SERVIDOR').AsString + ':' + FieldByName('RUTA').AsString + FieldByName('NOMBRE').AsString;
      //ShowMessage(DmLog.IBDatabase1.DatabaseName);
      DmLog.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
      DmLog.IBDatabase1.Params.Values['User_Name'] := 'SYSDBA';
      DmLog.IBDatabase1.Params.Values['PassWord'] := 'masterkey';
      DmLog.IBDatabase1.Connected := True;
      DmLog.IBTransaction1.Active := True;
   except
   end;
  end;}

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

procedure TfrmMain.FormPaint(Sender: TObject);
begin
    frmMain.Canvas.Draw(0, 0, TheGraphic);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
       if Not SalirMal then
        if MessageDlg('Seguro que desea cerrar SIFCREDISERVIR',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
         {with TIniFile.Create(MiINI) do
          try
            WriteString('DBNAME','server',DBserver);
            WriteString('DBNAME','path',DBpath);
            WriteString('DBNAME','name',DBname);
            WriteString('EMPRESA','name',Empresa);
            WriteString('EMPRESA','nit',Nit);
            WriteInteger('EMPRESA','Agencia',Agencia);
            WriteString('EMPRESA','city',Ciudad);
            ;// registro historico de sesiones
          finally}
           begin
            DeleteDir(_sSession);
            registra_sesion;
            dmGeneral.IBDatabase1.Connected := False;
            dmGeneral.IBTransaction1.Active  := False;
            dmGeneral.Free;
            {try
              DmLog.IBDatabase1.Connected := True;
              DmLog.IBTransaction1.Active := True;
            except
            end;
            DmLog.Free;  }
            CanClose := True;
           end
        else
            CanClose := False
       else
           begin
            registra_sesion;// registro historico de sesiones
            CanClose := True;
           end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        Self.Caption := 'Módulo Ente Aprobador - ' + DBServer + ' Ente Aprobador: ' + Mensaje_EnteAprobador + ' Inicio Sesión : ' + TimeToStr(hora_inicio);
        if SalirMal then
           Self.Close;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
      {try
        IdTime1.Host := DBserver;
        IdTime1.SyncTime;
        IdTime1.DateTime;
      finally
        IdTime1.Disconnect;
      end;}
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
  Timer2.Enabled := False;

end;

procedure tfrmmain.AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of
    WM_KEYFIRST..WM_KEYLAST,
    WM_LBUTTONDOWN..WM_MOUSELAST: FUltimaActividad := Now;
  end;
end;
procedure TfrmMain.BtnSalirClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMain.BtnExtractoClick(Sender: TObject);
begin
        FrmEnteAprobador := TFrmEnteAprobador.Create(self);
        FrmEnteAprobador.ShowModal;
end;

procedure TfrmMain.BtnConsultaPersonaClick(Sender: TObject);
begin
        FrmConsultaSol := TFrmConsultaSol.Create(self);
        FrmConsultaSol.ShowModal;
end;

procedure TfrmMain.Solicitudes1Click(Sender: TObject);
begin
        BtnConsultaPersona.Click;
end;

procedure TfrmMain.EstudioSolicitud1Click(Sender: TObject);
begin
        BtnExtracto.Click;
end;

procedure TfrmMain.InformeDiario1Click(Sender: TObject);
begin
        FrmInformeEnte := TFrmInformeEnte.Create(self);
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        FrmInformeEnte.IBQuery1.Open;
        FrmInformeEnte.IBQuery1.Last;
        FrmInformeEnte.ente := Mensaje_EnteAprobador;
        FrmInformeEnte.BitBtn1.Click;
        //FrmInformeEnte.ShowModal;
end;

procedure TfrmMain.SolicitudporEmpleado1Click(Sender: TObject);
begin
        FrmConsultaSolicitud := TFrmConsultaSolicitud.Create(self);
        FrmConsultaSolicitud.opcion_consulta := 1;
        FrmConsultaSolicitud.Caption := 'Reporte por Empleado';
        FrmConsultaSolicitud.ShowModal
end;

procedure TfrmMain.SolicitudesFundacion1Click(Sender: TObject);
begin
        FrmConsultaSolicitud := TFrmConsultaSolicitud.Create(self);
        FrmConsultaSolicitud.opcion_consulta := 2;
        FrmConsultaSolicitud.Caption := 'Reportes por Sección';
        FrmConsultaSolicitud.Label1.Visible := False;
        FrmConsultaSolicitud.DBempleado.Visible := False;
        FrmConsultaSolicitud.Rfundacion.Visible := True;
        FrmConsultaSolicitud.Rcreditos.Visible := True;
        FrmConsultaSolicitud.RGeneral.Visible := True;
        FrmConsultaSolicitud.ShowModal

end;

procedure TfrmMain.CambiarContrasea1Click(Sender: TObject);
begin
        frmCambiarContrasena := TfrmCambiarContrasena.Create(self);
        frmCambiarContrasena.ShowModal;
end;

procedure TfrmMain.GeneralEmpleados1Click(Sender: TObject);
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

procedure TfrmMain.Analistas1Click(Sender: TObject);
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

procedure TfrmMain.RatificaciondeCrditos1Click(Sender: TObject);
begin
        if (Id_EnteAprobador = 110) then
           MessageDlg('Solo el Comite y el Consejo de Administracion Ratifican Créditos',mtInformation,[mbok],0)
        else
        begin
           if n_acta = '' then
           begin
              n_acta := InputBox('Ratificación de Créditos','Digite Número de Acta','');
              if n_acta = '' then
              begin
                ShowMessage('El Número de Acta no Puede ser Nulo');
                Exit;
              end;
              if MessageDlg('El Número de Acta Ingresado es: ' + n_acta + #13 + 'Desea Continuar?',mtInformation,[mbyes,mbno],0) = mrno then
              begin
                n_acta := '';
                Exit;
             end;
           end;
           FrmRatificacion := TFrmRatificacion.Create(self);
           FrmRatificacion.acta.Caption := n_acta;
           FrmRatificacion.ShowModal;
        end;
end;

procedure TfrmMain.InformacindeCrditos1Click(Sender: TObject);
begin
        frmLiquidacionGral := TfrmLiquidacionGral.Create(self);
        frmLiquidacionGral.ShowModal;
end;

procedure TfrmMain.AnuladeSolicitudes1Click(Sender: TObject);
begin
        FrmAnulaSolicitud := TFrmAnulaSolicitud.Create(self);
        FrmAnulaSolicitud.ShowModal;
end;

procedure TfrmMain.SolicitudesEstudiadas1Click(Sender: TObject);
begin
        FrmReporteEnte := TFrmReporteEnte.Create(self);
        FrmReporteEnte.ShowModal;
end;

procedure TfrmMain.registra_sesion;
var     hora_fin :TTime;
begin
        hora_fin := Time;
        DmSolicitud := TDmSolicitud.Create(self);
      try
        with DmSolicitud.IBSolicitud1 do
        begin
         try
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('insert into "col$registrosesion" values (');
          SQL.Add(':ID_SOLICITUD,:ESTADO,:DBALIAS,:ACTA,:FECHA,:HORA_INICIO,:HORA_FIN,:ID_ENTE_APROBADOR,:ID_AGENCIA,:CUENTA,:PLAZO)');
          CDinforme.First;
          while not CDinforme.Eof do
          begin
            ParamByName('ID_SOLICITUD').AsString := CDinforme.FieldByName('radicado').AsString;
            ParamByName('ESTADO').AsInteger := CDinforme.FieldByName('estado').AsInteger;
            ParamByName('DBALIAS').AsString := DBAlias;
            ParamByName('ACTA').AsString := n_acta;
            ParamByName('FECHA').AsDate := vFechaEnte;
            ParamByName('HORA_INICIO').AsTime := hora_inicio;
            ParamByName('HORA_FIN').AsTime := hora_fin;
            ParamByName('ID_ENTE_APROBADOR').AsInteger := Id_EnteAprobador;
            ParamByName('ID_AGENCIA').AsInteger := CDinforme.FieldByName('id_oficina').AsInteger;
            if CDinforme.FieldByName('id_oficina').AsInteger <> 1 then
               ParamByName('CUENTA').AsString := CDinforme.FieldByName('cuenta').AsString
            else
               ParamByName('CUENTA').Clear;
            ParamByName('PLAZO').AsInteger := CDinforme.FieldValues['plazo'];
            ExecSQL;
            CDinforme.Next;
          end;
          if Id_EnteAprobador <> 1 then
          begin
            SQL.Clear;
            SQL.Add('delete from "ent$asistente" where NUMERO_ACTA = :NUMERO_ACTA');
            ParamByName('NUMERO_ACTA').AsString := n_acta;
            ExecSQL;
            SQL.Clear;
            SQL.Add('insert into "ent$asistente" values (:NUMERO_ACTA,:NOMBRE,:CARGO,:ES_INVITADO)');
            CDparticipantes.First;
            while not CDparticipantes.Eof do
            begin
              ParamByName('NUMERO_ACTA').AsString := n_acta;
              ParamByName('NOMBRE').AsString := CDparticipantesnombre.Value;
              ParamByName('CARGO').AsString := CDparticipantescargo.Value;
              ParamByName('ES_INVITADO').AsInteger := 0;
              ExecSQL;
              CDparticipantes.Next;
            end;
            SQL.Clear;
            SQL.Add('insert into "ent$asistente" values (:NUMERO_ACTA,:NOMBRE,:CARGO,:ES_INVITADO)');
            CDinvitados.First;
            while not CDinvitados.Eof do
            begin
              ParamByName('NUMERO_ACTA').AsString := n_acta;
              ParamByName('NOMBRE').AsString := CDinvitadosnombre.Value;
              ParamByName('CARGO').AsString := CDinvitadoscargo.Value;
              ParamByName('ES_INVITADO').AsInteger := 1;
              ExecSQL;
              CDinvitados.Next;
            end;
          end;
           Transaction.Commit;
           except
            Transaction.Rollback;
           end;
        end;
      finally
      end;
end;

procedure TfrmMain.ActadeSesion1Click(Sender: TObject);
begin
        if Id_EnteAprobador = 2 then
        begin
          MessageDlg('Los Cambios y Registros de Actas no se Pueden' + #13 + '   Realizar en Sesiones de Comite de Créditos...',mtWarning,[mbok],0);
          Exit;
        end;
        FrmActa := TFrmActa.Create(self);
        FrmActa.ShowModal;
end;

procedure TfrmMain.PromedioCaptacin1Click(Sender: TObject);
begin
        frmPromedio := TfrmPromedio.Create(self);
        frmPromedio.ShowModal;
end;

procedure TfrmMain.CambiarFechaConcepto1Click(Sender: TObject);
begin
        FrmCambiarFecha := TFrmCambiarFecha.Create(Self);
        FrmCambiarFecha.ShowModal;
end;

procedure TfrmMain.RequerimientoSistemas1Click(Sender: TObject);
begin
        FrmCambios := TFrmCambios.Create(Self);
        FrmCambios.ShowModal;
end;

procedure TfrmMain.A1Click(Sender: TObject);
begin

        FrmAprobadas := TFrmAprobadas.Create(Self);
        FrmAprobadas.ShowModal;
end;

procedure TfrmMain.PlizaDepsitos1Click(Sender: TObject);
begin
        frmSeguroDepositos := TfrmSeguroDepositos.Create(Self);
        frmSeguroDepositos.ShowModal;
end;

procedure TfrmMain.DeleteDir(APath: string);
var
  sr: TSearchRec;
begin
   APath := IncludeTrailingBackslash(APath);
   if FindFirst(APath + '*.*', faAnyFile, sr) = 0 Then
     repeat
       if (sr.Name <> '..') and (sr.Name <> '.') then
       begin
         if (sr.Attr = faDirectory) then
           DeleteDir(APath + sr.Name)
         else
           Win32Check(SysUtils.DeleteFile(APath + sr.Name));
       end;
     until FindNext(sr) <> 0;

   SysUtils.FindClose(sr);
   APath := ExcludeTrailingBackslash(APath);
   Win32Check(RemoveDir(APath));
end;

procedure TfrmMain.Recuperar1Click(Sender: TObject);
begin
        FrmRecEstudio := TFrmRecEstudio.Create(Self);
        FrmRecEstudio.ShowModal;
end;

procedure TfrmMain.RecuperarEstudioSolicitud1Click(Sender: TObject);
var     frm :TFrmRecuperaEstudio;
begin
        if Agencia <> 2 then
        begin
          frm := TFrmRecuperaEstudio.Create(Self);
          frm.ShowModal;
        end;
end;

end.
