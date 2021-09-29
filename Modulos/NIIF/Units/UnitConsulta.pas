unit UnitConsulta;

interface

uses
  Windows, Messages,DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons,
  IBDatabase, DB, IBCustomDataSet, IBQuery,IBStoredProc,
  JvLabel, JvBlinkingLabel, JvFormWallpaper, JvComponent,
  JvBaseDlg, JvNagScreen, OleCtrls,  ComObj,
  AXCtrls, ActiveX, OleServer, GIFCtrl,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton,IBSQL,
  LMDBaseGraphicControl, LMDGraphicControl, LMDScrollText,
  HTTPApp, HTTPProd, JvFormAnimation, SHDocVw, JvTransBtn,
  Animate, RxGIF, JvStarfield, JvImageTransform, JvxAnimate, JvPicClip,
  JvScrollingLabel, ShellApi, ShockwaveFlashObjects_TLB, MPlayer,
  DPSDKOPSLib_TLB, DpSdkEngLib_TLB;

type
  TfrmConsulta = class(TForm)
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabInicial: TTabSheet;
    TabValidacion: TTabSheet;
    IBQuery1: TIBQuery;
    JvBlinkingLabel1: TJvBlinkingLabel;
    TabDatos: TTabSheet;
    Label1: TLabel;
    Panel1: TPanel;
    Shape2: TShape;
    ST: TStaticText;
    ErrorAsociado: TJvNagScreen;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    CmdRetornar: TJvTransparentButton;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    Animacion: TJvFormAnimation;
    WB: TWebBrowser;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    PanelN1: TPanel;
    Numero1: TRxGIFAnimator;
    PanelN2: TPanel;
    Numero2: TRxGIFAnimator;
    PanelN3: TPanel;
    Numero3: TRxGIFAnimator;
    PanelN4: TPanel;
    PanelN5: TPanel;
    PanelN6: TPanel;
    Numero4: TRxGIFAnimator;
    Numero5: TRxGIFAnimator;
    PanelN7: TPanel;
    Numero6: TRxGIFAnimator;
    PanelN8: TPanel;
    PanelN9: TPanel;
    PanelCancelar: TPanel;
    PanelN0: TPanel;
    PanelAceptar: TPanel;
    Numero7: TRxGIFAnimator;
    Numero8: TRxGIFAnimator;
    Numero9: TRxGIFAnimator;
    CmdCancelar: TRxGIFAnimator;
    Numero0: TRxGIFAnimator;
    CmdAceptar: TRxGIFAnimator;
    ErrorRegistro: TJvNagScreen;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    HGif: TRxGIFAnimator;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TabValidacionShow(Sender: TObject);
    procedure TabInicialShow(Sender: TObject);
    procedure Numero1Click(Sender: TObject);
    procedure Numero2Click(Sender: TObject);
    procedure Numero3Click(Sender: TObject);
    procedure Numero4Click(Sender: TObject);
    procedure Numero5Click(Sender: TObject);
    procedure Numero6Click(Sender: TObject);
    procedure Numero7Click(Sender: TObject);
    procedure Numero8Click(Sender: TObject);
    procedure Numero9Click(Sender: TObject);
    procedure Numero0Click(Sender: TObject);
    procedure CmdCancelarClick(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure TabInicialHide(Sender: TObject);
    procedure TabDatosShow(Sender: TObject);
    procedure CmdRetornarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FUltimaActividad: TDateTime;
    procedure ValidarHuella;
    procedure TotalAportaciones;
    procedure TotalCaptaciones;
    procedure TotalColocaciones;
    procedure TotalFianzas;
    function fFechaActual: TDate;
    procedure FPDone(Sender: TObject;
      var pTemplate: OleVariant);
    procedure FPError(Sender: TObject; errcode: TOleEnum);
    procedure FPDevDisconnected(Sender: TObject);
    procedure FPDevConnected(Sender: TObject);
    procedure AppendToWB(WB1: TWebBrowser; const html: WideString);
    procedure InsertToWB(WB1: TWebBrowser; const html:WideString);
    procedure NiTeMenees(var m: TWMWINDOWPOSCHANGED); message
    WM_WINDOWPOSCHANGING ;
    procedure mymax(var m: TWMGETMINMAXINFO); message wm_getminmaxinfo;
  public
    { Public declarations }
    procedure AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
  end;

var
  frmConsulta: TfrmConsulta;
  Id:Integer;
  Identificacion:string;
  Documento:string;
  SalirMal:Boolean;
  vTamano :Integer;
  Asociado:string;
//
  pTemp: OleVariant;
  EnEspera:Boolean;
  EnValidacion:Boolean;
  EnHuella:Boolean;
  EnProceso:Boolean;
  EstadoAct:Integer;
  GridCap:Boolean;
  GridCol:Boolean;
  GridFia:Boolean;

  FilaCap:Integer;
  FilaCol:Integer;
  FilaFia:Integer;

// Variables Huella

  pvData    : array[0..4096] of Byte;
  Tamano    : Integer;
  c_IVerify : IFPVerify;
  pErr      : AIErrors;
// Cadena de información a mostrar
  CadenaDatos :TStringList;
// Variables de Datos
  MiIni:string;
  DBServer,DBPath,DBName,DBAlias,DBPasabordo,Role,Empresa,Nit,Ciudad:string;
  Agencia:Integer;

implementation

{$R *.dfm}

uses IniFiles,MSHTML;

procedure TfrmConsulta.FormCreate(Sender: TObject);
var Veces:Integer;
    Role,Mensaje:string;
begin
  Application.OnMessage := AtraparMensajes;
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.200.141');
    DBPath := ReadString('DBNAME','path','/var/db/fbird/');
    DBname := ReadString('DBNAME','name','database.fdb');
    Empresa := ReadString('EMPRESA','name','ALEXANDER CRUZ');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
    Ciudad  := ReadString('EMPRESA','city','BUCARAMANGA.');
  finally
    free;
  end;

        Veces := 0;
        IBDatabase1.Connected := false;
        while not IBDatabase1.Connected do
          begin
           if Veces = 3 then
           begin
                SalirMal := True;
                Exit;
           end;
           DBAlias := 'CONSULTAS';
           DBPasabordo:= 'consultas';
           Role := 'GERENCIA';
           IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
           IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
           IBDatabase1.Params.Values['User_Name'] := DBAlias;
           IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
           IBDatabase1.Params.Values['sql_role_name'] := Role;
           Veces := Veces + 1;
               try
                    IBDatabase1.Connected := True;
                    IBTransaction1.Active := True;
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
                end // fin del try
         end; // fin del while

         ShortDateFormat := 'yyyy/mm/dd';
         DecimalSeparator := '.';
         ThousandSeparator := ',';
         Panel1.Left := 239;
         Panel1.Top := 76;
         Panel2.Left := 239;
         Panel2.Top := 76;
         PageControl1.ActivePage := TabInicial;
         // ocultar inicio
        ShowWindow (
        FindWindowEx(FindWindow(
                             'Shell_TrayWnd',
                              nil),
                             0,
                             'Button',
                             nil)
        ,SW_Hide);


end;

procedure TfrmConsulta.FormShow(Sender: TObject);
begin
        if SalirMal then
           Self.Close;

        TabInicial.Visible := True;
        PageControl1.ActivePage := TabInicial;
        EnValidacion:=False;
        EnHuella:=False;
        EnProceso:=False;
        EnEspera := True;
        Self.SetFocus;
end;

procedure TfrmConsulta.Timer1Timer(Sender: TObject);
const
  ESPERA15 = (1 / 24 / 60 / 2);  // 30 segundos
  ESPERA10 = (1 / 24 / 60 / 6);  // 10 segundos
  ESPERA05 = (1 / 24 / 60 / 12);  // 05 segundos
var
  i:Integer;
  ESPERA:Extended;
begin
  ESPERA := 0;
  if EnValidacion or EnHuella then ESPERA := ESPERA10;
//  if EnHuella then ESPERA := ESPERA10;
  if EnProceso then ESPERA := ESPERA15;
  if (FUltimaActividad + ESPERA) < Now Then
  begin
//    ShowMessage('Tiempo Cumplido');
    if EnHuella then
    begin
// TODO: Buscar el componente FP y cancelar su ejecución
       for i := 0 to Self.ComponentCount - 1 do
        if Self.Components[i].Name = 'FP' then
        begin
           (Self.Components[i] as TFPGetTemplate).Cancel(pErr);
           (Self.Components[i] as TFPGetTemplate).Free;
           Break;
        end;
    end;
    EnHuella := False;
    EnProceso := False;
    EnValidacion := False;
    EnEspera := True;
    Identificacion := '';
    ST.Caption := '';
    for i := 0 to 4096 do
      pvData[i] := 00;
    Timer1.Enabled := False;
    PageControl1.ActivePage := TabInicial;
  end;
end;

procedure TfrmConsulta.AtraparMensajes(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of

      WM_KEYUP: begin
                if Win32Platform = VER_PLATFORM_WIN32_NT then
                   ShellExecute(Handle,nil,PChar('shutdown.exe'),PChar('-s -t0'),nil,SW_HIDE)
                else
                   ShellExecute(Handle, nil, pChar('rundll32.exe'), PChar('user,ExitWindows'), nil, SW_HIDE);
                Application.Terminate;
                end;

      WM_LBUTTONDOWN,WM_LBUTTONUP:
      begin
       if EnProceso or EnHuella or EnValidacion then
          FUltimaActividad := Now
       else
       if EnEspera then
        begin
          PageControl1.ActivePage := TabValidacion;
          TabValidacion.SetFocus;
          Timer1.Enabled := True;
          FUltimaActividad := now;
          EnEspera := False;
          EnHuella := False;
          EnProceso := False;
          EnValidacion := True;
        end;
      end;
  end;
end;

procedure TfrmConsulta.TabValidacionShow(Sender: TObject);
begin
//        AGif.Animate := False;
//        ScrL.Scrolling := False;
        CmdCancelar.FrameIndex := 20;
        CmdAceptar.FrameIndex := 18;
        Panel1.Visible := True;
        Label1.Visible := True;
        Label2.Visible := True;
        Panel2.Visible := False;
        Panel2.Enabled := False;
        Identificacion := '';
        ST.Caption := '';
        Timer1.Enabled := True;
        EnHuella:=False;
        EnValidacion := True;
        EnProceso := False;
        EnEspera := False;
end;

procedure TfrmConsulta.TabInicialShow(Sender: TObject);
begin
        ST.Caption := '';
        Identificacion := '';
        Documento := '';
        Panel2.Visible := False;
        Timer1.Enabled := False;
        EnValidacion:=False;
        EnHuella:=False;
        EnProceso:=False;
        EnEspera := True;
//        AGif.Animate := True;
//        ScrL.Scrolling := True;
        HGif.Animate := False;
//        MensajePantalla.Execute;
end;

procedure TfrmConsulta.Numero1Click(Sender: TObject);
begin
        Identificacion := Identificacion + '1';
        ST.Caption := Identificacion;
        PanelN1.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN1.BevelOuter := bvRaised;
        Numero1.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.Numero2Click(Sender: TObject);
begin
        Identificacion := Identificacion + '2';
        ST.Caption := Identificacion;
        PanelN2.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN2.BevelOuter := bvRaised;
        Numero2.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.Numero3Click(Sender: TObject);
begin
        Identificacion := Identificacion + '3';
        ST.Caption := Identificacion;
        PanelN3.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN3.BevelOuter := bvRaised;
        Numero3.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.Numero4Click(Sender: TObject);
begin
        Identificacion := Identificacion + '4';
        ST.Caption := Identificacion;
        PanelN4.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN4.BevelOuter := bvRaised;
        Numero4.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.Numero5Click(Sender: TObject);
begin
        Identificacion := Identificacion + '5';
        ST.Caption := Identificacion;
        PanelN5.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN5.BevelOuter := bvRaised;
        Numero5.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.Numero6Click(Sender: TObject);
begin
        Identificacion := Identificacion + '6';
        ST.Caption := Identificacion;
        PanelN6.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN6.BevelOuter := bvRaised;
        Numero6.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.Numero7Click(Sender: TObject);
begin
        Identificacion := Identificacion + '7';
        ST.Caption := Identificacion;
        PanelN7.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN7.BevelOuter := bvRaised;
        Numero7.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.Numero8Click(Sender: TObject);
begin
        Identificacion := Identificacion + '8';
        ST.Caption := Identificacion;
        PanelN8.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN8.BevelOuter := bvRaised;
        Numero8.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.Numero9Click(Sender: TObject);
begin
        Identificacion := Identificacion + '9';
        ST.Caption := Identificacion;
        PanelN9.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN9.BevelOuter := bvRaised;
        Numero9.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.Numero0Click(Sender: TObject);
begin
        Identificacion := Identificacion + '0';
        ST.Caption := Identificacion;
        PanelN0.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelN0.BevelOuter := bvRaised;
        Numero0.Animate := False;
        Application.ProcessMessages;
end;

procedure TfrmConsulta.CmdCancelarClick(Sender: TObject);
begin
        Identificacion := '';
        ST.Caption := '';

//        CmdCancelar.Animate := True;
        PanelCancelar.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelCancelar.BevelOuter := bvRaised;
//        CmdCancelar.Animate := False;
//        CmdCancelar.FrameIndex := 20;
        Application.ProcessMessages;


end;

procedure TfrmConsulta.CmdAceptarClick(Sender: TObject);
var
    BlobStream:TStream;
    BlobField:TBlobField;
    i:Integer;
begin
        if Length(Identificacion) > 15 then begin
           ErrorAsociado.Execute;
           FUltimaActividad := Now;
           PageControl1.ActivePage := TabInicial;
           Exit;
        end;

//        CmdAceptar.Animate := True;
        PanelAceptar.BevelOuter := bvLowered;
        Application.ProcessMessages;
        PanelAceptar.BevelOuter := bvRaised;
//        CmdAceptar.Animate := False;
//        CmdAceptar.FrameIndex := 18;
        Application.ProcessMessages;


        Documento := Identificacion;
        if Identificacion = '' then begin
           FUltimaActividad := Now;
           PageControl1.ActivePage := TabInicial;
           Exit;
        end;

        with IBQuery1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('Select ID_IDENTIFICACION,PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,DATOS_HUELLA from "gen$persona" WHERE ');
           SQL.Add('ID_PERSONA = :ID_PERSONA');
//           ParamByName('ID_IDENTIFICACION').AsInteger := 3;
           ParamByName('ID_PERSONA').AsString := Identificacion;
           Open;
           if RecordCount > 0 then
           begin
            try
                Asociado := FieldByName('NOMBRE').AsString+' '+FieldByName('PRIMER_APELLIDO').AsString+' '+FieldByName('SEGUNDO_APELLIDO').AsString;
                Id := FieldByName('ID_IDENTIFICACION').AsInteger;
                BlobStream := TMemoryStream.Create;
                (FieldByName('DATOS_HUELLA') as TBlobField).SaveToStream(BlobStream);
                BlobStream.Seek(0,0);
                vTamano := BlobStream.Size;
                if BlobStream.Size = 0 then begin
                   ErrorRegistro.Execute;
                   FUltimaActividad := Now;
                   PageControl1.ActivePage := TabInicial;
                   Exit;
                end;
                BlobStream.Seek(0,0);
                BlobStream.read(pvData,BlobStream.Size);
                BlobStream.Seek(0,0);
                //35ShowMessage(intToStr(BlobStream.Size));
            finally
                BlobStream.Free;
            end;
//           PageControl1.ActivePage := TabHuella;
            FUltimaActividad := Now;
            EnValidacion:=False;
            EnProceso:=False;
            EnEspera := False;
            EnHuella := True;
            Panel1.Visible := False;
            Label1.Visible := False;
            Label2.Visible := False;
            Panel2.Visible := True;
            Application.ProcessMessages;

{
            EnHuella := False;
            EnProceso := True;
            PageControl1.ActivePage := TabDatos;
            FUltimaActividad := Now;
}
            ValidarHuella;
           end
           else
           begin
                ErrorAsociado.Execute;
                FUltimaActividad := Now;
                PageControl1.ActivePage := TabInicial;
                Exit;
           end;

        end;
end;

procedure TfrmConsulta.ValidarHuella;
var
  m_tUnknown : IUnknown;
begin
  HGif.Animate := True;
//  fpGetTemplate1.Connect;
  m_tUnknown := CreateComObject(CLASS_FPVerify);
  m_tUnknown.QueryInterface(IID_IFPVerify,c_IVerify);
  
  with TFPGetTemplate.Create(Self) do
  begin
      Name := 'FP';
      OnDone := FPDone;
      OnError := FPError;
      OnDevConnected := FPDevConnected;
      OnDevDisconnected := FPDevDisconnected;
      Run(1,pErr);
  end;

  Application.ProcessMessages;

end;

procedure TfrmConsulta.TotalAportaciones;
var SaldoF,Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
    Estado:string;
    TipoCaptacion:string;
begin
           EstadoAct := 0;
           SaldoF := 0;
           with IBSQL1 do begin
                Close;
                SQL.Clear;
                SQL.Add('Select "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA');
                SQL.Add('from "cap$maestrotitular"');
                SQL.Add('inner join "cap$maestro" on ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1 and "cap$maestro".ID_ESTADO = 1');
                SQL.Add('Order by "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA');
                ParamByName('ID_IDENTIFICACION').AsInteger := Id;
                ParamByName('ID_PERSONA').AsString  := Documento;
                try
                 ExecQuery;
                 if RecordCount < 1 then begin
                    Exit;
                 end; // if
                except
                   MessageDlg('Error Buscando Aportaciones',mtError,[mbok],0);
                   Exit;
                end; // try
               while not Eof do begin
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('Select "cap$tipocaptacion".DESCRIPCION as TIPO_CAPTACION,"cap$maestro".ID_ESTADO, "cap$tiposestado".DESCRIPCION from "cap$maestro"');
                IBSQL2.SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                IBSQL2.SQL.Add('inner join "cap$tipocaptacion" ON ("cap$tipocaptacion".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION)');
                IBSQL2.SQL.Add('Where');
                IBSQL2.SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                IBSQL2.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL2.SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                   exit
                  else
                  begin
                   TipoCaptacion := IBSQL2.FieldByName('TIPO_CAPTACION').AsString;
                   Estado := IBSQL2.FieldByName('DESCRIPCION').AsString;
                   EstadoAct := IBSQL2.FieldByName('ID_ESTADO').AsInteger;
                  end;
                except
                   MessageDlg('Error Consultando Saldo Aportes',mtError,[mbcancel],0);
                   Exit;
                end;
// Buscar Saldo
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select * from SALDO_ACTUAL(:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Ag;
                IBSQL2.ParamByName('TP').AsInteger := Tipo;
                IBSQL2.ParamByName('CTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DG').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(ffechaactual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(ffechaactual),12,31);
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                    Saldo := 0
                  else
                    Saldo := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                except
                end;
                CadenaDatos.Add('    <tr>');
                CadenaDatos.Add('    <td class="Datos1">'+TipoCaptacion+'</td>');
                CadenaDatos.Add('    <td class="Datos1" align="center">'+format('%d%.2d-%.7d',[Tipo,Agencia,Cuenta])+'</td>');
                CadenaDatos.Add('    <td class="Datos1" align="right">'+FormatCurr('$ #,#0.00',Saldo)+'</td>');
                CadenaDatos.Add('    <td Class="Datos1" align="center"></td>');
                CadenaDatos.Add('    </tr>');
             Next;
             end;

         end;

end;

procedure TfrmConsulta.TotalCaptaciones;
var SaldoD,Saldo,Movimiento,Canje,Disponible,ValorI:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
    Estado:string;
    Se_Suma,Firmas:Integer;
    TipoCaptacion:string;    
begin
           EstadoAct := 0;
           SaldoD := 0;
           with IBSQL1 do begin
                Close;
                SQL.Clear;
                SQL.Add('Select "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
                SQL.Add('inner join "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA AND "cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION AND ');
                SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA AND "cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
                SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                SQL.Add('Where');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION > 1 and "cap$tiposestado".SE_SUMA <> 0');
                SQL.Add('Order by "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA');
                ParamByName('ID_IDENTIFICACION').AsInteger := Id;
                ParamByName('ID_PERSONA').AsString  := Documento;
                try
                 ExecQuery;
                 if RecordCount < 1 then begin
                    Exit;
                 end; // if
                except
                   MessageDlg('Error al Buscar Ahorros',mtError,[mbok],0);
                   Exit;
                end; // try

               while not Eof do begin
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('Select "cap$tipocaptacion".DESCRIPCION as TIPO_CAPTACION,"cap$maestro".ID_ESTADO,"cap$maestro".VALOR_INICIAL, "cap$tiposestado".DESCRIPCION, "cap$tiposestado".SE_SUMA, "cap$maestro".FIRMAS from "cap$maestro"');
                IBSQL2.SQL.Add('left join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
                IBSQL2.SQL.Add('inner join "cap$tipocaptacion" ON ("cap$tipocaptacion".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION)');
                IBSQL2.SQL.Add('Where');
                IBSQL2.SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                IBSQL2.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL2.SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                   Saldo := 0
                  else
                  TipoCaptacion := IBSQL2.FieldByName('TIPO_CAPTACION').AsString;
                  ValorI := IBSQL2.FieldByName('VALOR_INICIAL').AsCurrency;
                  Estado := IBSQL2.FieldByName('DESCRIPCION').AsString;
                  Se_Suma := IBSQL2.FieldByName('SE_SUMA').AsInteger;
                  Firmas := IBSQL2.FieldByName('FIRMAS').AsInteger;
                  EstadoAct := IBSQL2.FieldByName('ID_ESTADO').AsInteger;
                except
                   MessageDlg('Error Consultando Datos Ahorros',mtError,[mbcancel],0);
                   Exit;
                end;

// Buscar Saldo
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select * from SALDO_ACTUAL(:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Ag;
                IBSQL2.ParamByName('TP').AsInteger := Tipo;
                IBSQL2.ParamByName('CTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DG').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(ffechaactual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(ffechaactual),12,31);
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                    Saldo := 0
                  else
                    Saldo := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                except
                end;

//Buscar Disponible
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select * from SALDO_DISPONIBLE(:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('AG').AsInteger := Ag;
                IBSQL2.ParamByName('TP').AsInteger := Tipo;
                IBSQL2.ParamByName('CTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DG').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(ffechaactual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(ffechaactual),12,31);
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                    SaldoD := 0
                  else
                    SaldoD := IBSQL2.FieldByName('SALDO_DISPONIBLE').AsCurrency;
                except
                end;


                if Tipo = 6 then
                begin
                   Saldo := ValorI;
                   SaldoD := ValorI;
                end;
                
                CadenaDatos.Add('    <tr>');
                CadenaDatos.Add('    <td class="Datos1">'+TipoCaptacion+'</td>');
                CadenaDatos.Add('    <td class="Datos1" align="center">'+format('%d%.2d-%.7d',[Tipo,Agencia,Cuenta])+'</td>');
                CadenaDatos.Add('    <td class="Datos1" align="right">'+FormatCurr('$ #,#0.00',Saldo)+'</td>');
                CadenaDatos.Add('    <td Class="Datos1" align="right">'+FormatCurr('$ #,#0.00',SaldoD)+'</td>');
                CadenaDatos.Add('    </tr>');
             Next;
             end;
         end;
end;

procedure TfrmConsulta.TotalColocaciones;
var Saldo:Currency;
    Fecha:string;
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select "col$colocacion".ID_AGENCIA,"col$colocacion".ID_COLOCACION,"col$colocacion".VALOR_DESEMBOLSO,("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION, "col$colocacion".VALOR_CUOTA, "col$estado".DESCRIPCION_ESTADO_COLOCACION from "col$colocacion"');
          SQL.Add('inner join "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('where "col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = :ID_PERSONA and');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION < 4');
          SQL.Add('Order by "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id;
          ParamByName('ID_PERSONA').AsString := Documento;
          try
            ExecQuery;
            if RecordCount > 0 then begin
             while not Eof do begin
               IBSQL2.Close;
               IBSQL2.SQL.Clear;
               IBSQL2.SQL.Add('select first 1 * from "col$tablaliquidacion"');
               IBSQL2.SQL.Add('where');
               IBSQL2.SQL.Add('"col$tablaliquidacion".ID_AGENCIA = :ID_AGENCIA ');
               IBSQL2.SQL.Add('and "col$tablaliquidacion".ID_COLOCACION = :ID_COLOCACION and PAGADA = 0');
               IBSQL2.SQL.Add('Order by "col$tablaliquidacion".FECHA_A_PAGAR');
               IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
               IBSQL2.ExecQuery;
               if ((IBSQL2.RecordCount < 1) or (FieldByName('ID_ESTADO_COLOCACION').AsInteger > 1)) then Fecha := 'Pago Inmediato'
               else Fecha := IBSQL2.FieldByName('FECHA_A_PAGAR').AsString;
               CadenaDatos.Add('   <tr>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+FieldByName('ID_COLOCACION').AsString+'</td>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+FormatCurr('$ #,#0.00',FieldByName('VALOR_DESEMBOLSO').AsCurrency)+'</td>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+FormatCurr('$ #,#0.00',FieldByName('SALDO').AsCurrency)+'</td>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+FormatCurr('$ #,#0.00',FieldByName('VALOR_CUOTA').AsCurrency)+'</td>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+Fecha+'</td>');
               CadenaDatos.Add('    </tr>');
               Next;
             end;
            end;
          except
            MessageDlg('Error Buscando Colocaciones Resumen',mtError,[mbcancel],0);
          end;
        end;

end;

procedure TfrmConsulta.TotalFianzas;
var Saldo:Currency;
    Fecha:string;
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select "col$colocacion".ID_AGENCIA,"col$colocacion".ID_COLOCACION,"col$colocacion".VALOR_DESEMBOLSO,("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,"col$colocacion".VALOR_CUOTA,"col$estado".DESCRIPCION_ESTADO_COLOCACION,"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "col$colgarantias"');
          SQL.Add('inner join "col$colocacion" ON ("col$colocacion".ID_AGENCIA = "col$colgarantias".ID_AGENCIA and ');
          SQL.Add('"col$colocacion".ID_COLOCACION = "col$colgarantias".ID_COLOCACION)');
          SQL.Add('inner join "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('left join "gen$persona" ON ( "col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA and "col$colocacion".ID_ESTADO_COLOCACION < 4');
          SQL.Add('Order by "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION');          
          ParamByName('ID_IDENTIFICACION').AsInteger := Id;
          ParamByName('ID_PERSONA').AsString := Documento;
          try
            ExecQuery;
            if RecordCount > 0 then
             while not Eof do begin
               IBSQL2.Close;
               IBSQL2.SQL.Clear;
               IBSQL2.SQL.Add('select first 1 * from "col$tablaliquidacion"');
               IBSQL2.SQL.Add('where');
               IBSQL2.SQL.Add('"col$tablaliquidacion".ID_AGENCIA = :ID_AGENCIA ');
               IBSQL2.SQL.Add('and "col$tablaliquidacion".ID_COLOCACION = :ID_COLOCACION and PAGADA = 0');
               IBSQL2.SQL.Add('Order by "col$tablaliquidacion".FECHA_A_PAGAR');
               IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
               IBSQL2.ExecQuery;
               if ((IBSQL2.RecordCount < 1) or (FieldByName('ID_ESTADO_COLOCACION').AsInteger > 1)) then Fecha := 'Pago Inmediato'
               else Fecha := IBSQL2.FieldByName('FECHA_A_PAGAR').AsString;
               CadenaDatos.Add('   <tr>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+FieldByName('ID_COLOCACION').AsString+'</td>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+FormatCurr('$ #,#0.00',FieldByName('VALOR_DESEMBOLSO').AsCurrency)+'</td>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+FormatCurr('$ #,#0.00',FieldByName('SALDO').AsCurrency)+'</td>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+FormatCurr('$ #,#0.00',FieldByName('VALOR_CUOTA').AsCurrency)+'</td>');
               CadenaDatos.Add('      <td class="Datos1" align="center">'+Fecha+'</td>');
               CadenaDatos.Add('      <td class="Datos1" align="left">'+FieldByName('NOMBRE').AsString+' '+FieldByName('PRIMER_APELLIDO').AsString+' '+FieldByName('SEGUNDO_APELLIDO').AsString+'</td>');
               CadenaDatos.Add('   </tr>');
               Next;
             end;
          except
            MessageDlg('Error Buscando Colocaciones Resumen',mtError,[mbcancel],0);
          end;
        end;


        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('Select SUM(VALOR_DESEMBOLSO - ABONOS_CAPITAL) AS SUMA from "col$colocacion"');
          SQL.Add('INNER JOIN "col$colgarantias" ON ("col$colocacion".ID_AGENCIA = "col$colgarantias".ID_AGENCIA and ');
          SQL.Add('"col$colocacion".ID_COLOCACION = "col$colgarantias".ID_COLOCACION)');
          SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id;
          ParamByName('ID_PERSONA').AsString := Documento;
          try
            ExecQuery;
            if RecordCount > 0 then
            Saldo := FieldByName('SUMA').AsCurrency
            else
            Saldo := 0;
          except
            MessageDlg('Error al Buscar Colocaciones',mtError,[mbok],0);
            Saldo := 0;
          end;
        end;
end;

procedure TfrmConsulta.TabInicialHide(Sender: TObject);
begin
//        MensajePantalla.Stop;
end;

procedure TfrmConsulta.TabDatosShow(Sender: TObject);
var I:Integer;
    Rango:IHTMLTxtRange;
begin
        HGif.Animate := False;

        CadenaDatos := TStringList.Create;

        CadenaDatos.Add('<html>');
        CadenaDatos.Add(' <head>');
        CadenaDatos.Add('  <meta http-equiv="Content-Style-Type" content="text/css">');
        CadenaDatos.Add('  <title>Información del Asociado</title>');
        CadenaDatos.Add('  <style type="text/css">');
        CadenaDatos.Add('    A:link {text-decoration: none;}');
        CadenaDatos.Add('    A:visited {text-decoration: none;}');
        CadenaDatos.Add('    .Titulo1{font-family: Arial Black, Arial; font-size: x-small; font-weight: 400; font-style: italic; text-decoration: none; text-transform: none; color: #000000; vertical-align: middle; text-align: center;}');
	CadenaDatos.Add('    .Datos1{font-family: Arial; font-size: smaller; font-weight: 400; font-style: normal;}');
        CadenaDatos.Add('  </style>');
        CadenaDatos.Add('  <style>');
        CadenaDatos.Add('  body{');
        CadenaDatos.Add('  scrollbar-arrow-color: #339966;');
        CadenaDatos.Add('  scrollbar-3dlight-color: #CCFFCC;');
        CadenaDatos.Add('  scrollbar-highlight-color: #000000;');
        CadenaDatos.Add('  scrollbar-face-color: #FFFFFF;');
        CadenaDatos.Add('  scrollbar-shadow-color: #000000;');
        CadenaDatos.Add('  scrollbar-darkshadow-color: #CCFFCC;');
        CadenaDatos.Add('  scrollbar-track-color: #CCFFCC;');
        CadenaDatos.Add('  }');
        CadenaDatos.Add('  </style>');
        CadenaDatos.Add('</head>');
        CadenaDatos.Add('<body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#FF00FF" background="Crediservir Agua 2.bmp">');
        CadenaDatos.Add('<p>ASOCIADO <font size="+1" color="#0000FF"><b>'+Asociado+'</b></font>');
        CadenaDatos.Add('<p>');
        CadenaDatos.Add('<p><b>INFORMACION DE CUENTAS</b>');
        CadenaDatos.Add('<p>');
        CadenaDatos.Add('<table border="1"  width="100%">');
        CadenaDatos.Add('  <tr>');
        CadenaDatos.Add('     <td class="Titulo1">TIPO DE CUENTA</td>');
        CadenaDatos.Add('     <td class="Titulo1">NUMERO DE CUENTA</td>');
        CadenaDatos.Add('     <td class="Titulo1">SALDO A LA FECHA</td>');
        CadenaDatos.Add('     <td class="Titulo1">SALDO DISPONIBLE</td>');
        CadenaDatos.Add('  </tr>');
        IBSQL1.Transaction.Commit;
        IBSQL1.Transaction.StartTransaction;

        TotalAportaciones;

        TotalCaptaciones;

        CadenaDatos.Add('</table>');
        CadenaDatos.Add('<p><font size="-2"><b>PARA MAYOR INFORMACION CONTACTE CON UNO DE NUESTROS AUXILIARES DE AHORRO<b></font>');
        CadenaDatos.Add('<p>');
        CadenaDatos.Add('<p><b>INFORMACION DE DEUDAS</b>');
        CadenaDatos.Add('<p>');
        CadenaDatos.Add('<table border="1" width="100%">');
        CadenaDatos.Add('  <tr>');
        CadenaDatos.Add('     <td class="Titulo1" width="16%">PAGARE No.</td>');
        CadenaDatos.Add('     <td class="Titulo1" width="23%">VALOR DESEMBOLSO</td>');
        CadenaDatos.Add('     <td class="Titulo1" width="23%">SALDO ACTUAL</td>');
        CadenaDatos.Add('     <td class="Titulo1" width="23%">VALOR CUOTA</td>');
        CadenaDatos.Add('     <td class="Titulo1" width="15%">FECHA PROXIMO PAGO</td>');
        CadenaDatos.Add('  </tr>');

        TotalColocaciones;

        CadenaDatos.Add('</table>');
        CadenaDatos.Add('<p>');
        CadenaDatos.Add('<p><b>INFORMACION DE FIANZAS</b>');
        CadenaDatos.Add('<p>');
        CadenaDatos.Add('<table border="1" width="100%">');
        CadenaDatos.Add('  <tr>');
        CadenaDatos.Add('     <td class="Titulo1" width="10%">PAGARE No.</td>');
        CadenaDatos.Add('     <td class="Titulo1" width="20%">VALOR DESEMBOLSO</td>');
        CadenaDatos.Add('     <td class="Titulo1" width="20%">SALDO ACTUAL</td>');
        CadenaDatos.Add('     <td class="Titulo1" width="20%">VALOR CUOTA</td>');
        CadenaDatos.Add('     <td class="Titulo1" width="10%">FECHA PROXIMO PAGO</td>');
        CadenaDatos.Add('     <td class="Titulo1" width="20%">ASOCIADO DEUDOR</td>');
        CadenaDatos.Add('  </tr>');

        TotalFianzas;

        IBSQL1.Transaction.Commit;

        CadenaDatos.Add('</table>');
        CadenaDatos.Add('<p><font size="-2"><b>PARA MAYOR INFORMACION CONTACTE CON UNO DE NUESTROS AUXILIARES DE CARTERA<b></font>');
        CadenaDatos.Add('</body>');
        CadenaDatos.Add('</html>');
        InsertToWB(WB,CadenaDatos.Text);
//        CadenaDatos.SaveToFile('C:\Datos.html');
end;

procedure TfrmConsulta.InsertToWB(WB1: TWebBrowser; const html:WideString);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WB.Navigate('about:blank');
  while WB.ReadyState < READYSTATE_INTERACTIVE do
   Application.ProcessMessages;

  if Assigned(WB.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := html;
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (WB.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

procedure TfrmConsulta.AppendToWB(WB1: TWebBrowser; const html: WideString);
var
   Range: IHTMLTxtRange;
   vBody: IHTMLElement;
   vBodyElem: IHTMLBodyElement;
begin
  if not WB.Busy then
   if Assigned(WB.Document) then
   begin
    vBody := (WB.Document as IHTMLDocument2).body;
    vBodyElem := (vBody as IHTMLBodyElement);
    Range := vBodyElem.createTextRange;
//   Range := IHTMLBodyElement(IHTMLDocument2(WB.Document).body).createTextRange;
//   Range := ((WB.Document AS IHTMLDocument2).body AS IHTMLBodyElement).createTextRange;
    Range.Collapse(False) ;
    Range.PasteHTML(html) ;
   end
   else
      ShowMessage('Cuerpo de la página, no creado');
end;

procedure TfrmConsulta.CmdRetornarClick(Sender: TObject);
begin
        PageControl1.ActivePage := TabInicial;
end;

function TfrmConsulta.fFechaActual: TDate;
var IBSP1:TIBStoredProc;
    IBT1:TIBTransaction;
begin
        IBT1 := TIBTransaction.Create(Application);
        IBSP1 := TIBStoredProc.Create(Application);
        IBT1.DefaultDatabase := IBDatabase1;
        IBSP1.Transaction := IBT1;
        IBSP1.StoredProcName := 'SP_FECHA_ACTUAL';
        with IBSP1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          try
           ExecProc;
          finally
           Result := parambyname('FECHA').AsDate;
          end;
          Close;
          Transaction.Commit;
        end;
        IBSP1.Destroy;
        IBT1.Destroy;
end;

procedure TfrmConsulta.FPDone(Sender: TObject;
  var pTemplate: OleVariant);
var
         m_byteBuf : PByteArray;
        m_verifyOk : WordBool;
           m_score : OleVariant;
        m_security : AISecureModeMask;
       m_threshold : OleVariant;
            m_data : OleVariant;
            m_loop : Integer;
        m_learning : WordBool;
        m_tUnknown : IUnknown;
     c_regTemplate : IFPTemplate;
begin
         (Sender as TFPGetTemplate).Cancel(pErr);
         (Sender as TFPGetTemplate).Disconnect;
         m_learning := False;
         m_verifyOk := False;
        try
          //Creating Template Object
          m_tUnknown := CreateComObject(CLASS_FPTemplate);
          //Asking for IFPTemplate Interface
          m_tUnknown.QueryInterface(IID_IFPTemplate,c_RegTemplate);
//          m_data := VarArrayCreate([0,frmRegister.blobSize],varByte);
          m_data := VarArrayCreate([0,vTamano],varByte);
//          m_tUnknown := CreateComObject(CLASS_FPVerify);
//          m_tUnknown.QueryInterface(IID_IFPVerify,c_IVerify);


        except
               ShowMessage('Ocurrio un Error!!');
               Sender.Free;
               raise;
        end;
         m_byteBuf := VarArrayLock(m_data);
         m_verifyOk := False;

         for m_loop := 0 to vTamano  do
                m_byteBuf[m_loop] := pvData[m_loop];

         VarArrayUnlock(m_data);

         c_RegTemplate.Import(m_data);

         VarClear(m_data);
         c_IVerify.Compare(c_RegTemplate,pTemplate,m_verifyOk,m_score,m_threshold,m_learning,m_security);
         c_RegTemplate._Release;
         c_regTemplate := nil;
         c_IVerify := nil;

         (Sender as TFPGetTemplate).Cancel(pErr);
         Sender.Free;

         if m_verifyOk = False then begin
           ErrorAsociado.Execute;
           FUltimaActividad := Now;
           PageControl1.ActivePage := TabInicial;
           Exit;
         end
         else if m_verifyOk = True then begin
            EnProceso := True;
            FUltimaActividad := Now;
            PageControl1.ActivePage := TabDatos;
          end;


end;

procedure TfrmConsulta.NiTeMenees(var m: TWMWINDOWPOSCHANGED);
begin
 	       m.windowpos.x := 0;  {Left/Posicion X}
 	       m.windowpos.y := 0;  {Left/Posicion X}
end;

procedure TfrmConsulta.mymax(var m: TWMGETMINMAXINFO);
begin
 	  m.minmaxinfo^.ptMinTrackSize.x := 800;     {Ancho Mínimo/Min Width}
 	  m.minmaxinfo^.ptMinTrackSize.y := 600;
end;

procedure TfrmConsulta.BitBtn1Click(Sender: TObject);
begin
        close
end;

procedure TfrmConsulta.FPError(Sender: TObject;
  errcode: TOleEnum);
begin
        MessageDlg('Error Tomando Muestra!...',mtError,[mbCancel],0);
end;

procedure TfrmConsulta.FPDevDisconnected(Sender: TObject);
begin
        ShowMessage('Device Disconnect');
end;

procedure TfrmConsulta.FPDevConnected(Sender: TObject);
begin
        ShowMessage('Device Connect');
end;

end.
