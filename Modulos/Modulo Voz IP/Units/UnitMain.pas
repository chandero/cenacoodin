unit UnitMain;

interface

uses
  IniFiles, Windows, ShellApi, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, Sockets, StdCtrls, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustom3DButton,
  LMD3DEffectButton, JvComponent, JvFormAnimatedIcon, JvAnimTitle,
  JvPerforated, TrayComp, telefoon, Menus, ImgList, JvHtControls, JvLookOut,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDMessageHint,
  LMDCustomShapeButton, LMDShapeButton, Buttons, JvButtons,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomMemo, LMDMemo, LMDCustomImageListBox, LMDImageListBox,
  JvListComb, JvCalc, JvMemo, JvSpecialLabel, JvTrayIcon, IBSQL,
  IBDatabase, DB, IBCustomDataSet, ComCtrls, LMDCustomTrackBar, LMDTrackBar,
  LMDShapeHint, JvWavePlayer, JvSoundControl, JvEdit, JvTypedEdit, JvLabel,
  JvBlinkingLabel, IBEvents;

const
  WM_TRAY = WM_USER + 19;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    TcpClient: TTcpClient;
    Conexion: TTelefoon;
    Menu1: TPopupMenu;
    CerrarAplicacin1: TMenuItem;
    Iconos1: TImageList;
    Memo: TLMDMemo;
    cmdEnviar: TLMDShapeButton;
    ImagenList2: TImageList;
    Mensajes: TJvMemo;
    Label1: TJvSpecialLabel;
    Tray: TJvTrayIcon;
    DB: TIBDatabase;
    IBT: TIBTransaction;
    IBD: TIBDataSet;
    Play: TJvWavePlayer;
    Sound: TJvSoundControl;
    Panel5: TPanel;
    PageControl: TPageControl;
    Tab1: TTabSheet;
    Tab2: TTabSheet;
    MiNombre: TLabeledEdit;
    MiIP: TStaticText;
    Label6: TLabel;
    EdTiempo: TJvIntegerEdit;
    Label7: TLabel;
    EdTiempoRefresco: TJvIntegerEdit;
    Label8: TLabel;
    chkMuteIni: TCheckBox;
    chkRespuesta: TCheckBox;
    GroupBox1: TGroupBox;
    EdRespuesta: TEdit;
    ListaV: TListView;
    Panel4: TPanel;
    Label2: TLabel;
    Estado: TStaticText;
    ImageT: TImage;
    ImageS: TImage;
    Volumen: TLMDTrackBar;
    CmdEnviarMensaje: TBitBtn;
    EdAutoRespuesta: TJvBlinkingLabel;
    CmdContestar: TBitBtn;
    cmdColgar: TBitBtn;
    IBSQL1: TIBSQL;
    IBEvents1: TIBEvents;
    procedure FormCreate(Sender: TObject);
    procedure chkRespuestaClick(Sender: TObject);
    procedure ConexionTextMessage(Sender: TObject; text: String);
    procedure MemoKeyPress(Sender: TObject; var Key: Char);
    procedure cmdEnviarClick(Sender: TObject);
    procedure ConexionCalled(Sender: TObject; text: String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CerrarAplicacin1Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListaVDblClick(Sender: TObject);
    procedure ConexionCallAccepted(Sender: TObject; text: String);
    procedure ConexionConnectionEnded(Sender: TObject; text: String);
    procedure cmdColgarClick(Sender: TObject);
    procedure ImageTClick(Sender: TObject);
    procedure VolumenTrack(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure CmdContestarClick(Sender: TObject);
    procedure MiNombreKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CmdEnviarMensajeClick(Sender: TObject);
    procedure MiNombreExit(Sender: TObject);
    procedure EdTiempoKeyPress(Sender: TObject; var Key: Char);
    procedure EdTiempoExit(Sender: TObject);
    procedure TimerVerificarMensajesTimer(Sender: TObject);
    procedure MemoModified(Sender: TObject);
    procedure TrayBalloonClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure IBEvents1EventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
//    TrayIcon: TNotifyIconData;
    procedure ActualizarLista;
    procedure VerificarConexion;
    procedure llamar(ip: String);
    procedure PublicarMensaje(t:string;s: string);
    procedure VerificarMensajes;
{    procedure WMDisplayChange(var Msg: TWMDisplayChange);
      message WM_DISPLAYCHANGE;
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMTray(var Msg: TMessage); message WM_TRAY;
    procedure AppMessage(var Msg: TMsg; var Handled: boolean);

    procedure HideForm(Sender: TObject);
    procedure ShowForm(Sender: TObject);
}
    { Public declarations }
  end;

type
    PMiLista = ^ALista;
    Alista = record
      Nombre: string;
      Ip:string;
      EnLinea:Boolean;
    end;

var
  frmMain: TfrmMain;
  Lista :TList;
  ARecord:PMiLista;
  Path:string;

  DraggingWin: boolean;
  DragFrom: TPoint;
  UDestino:string;

  InicialShow:Boolean=True;
  EnSalida:Boolean=False;

  FWinfo: FLASHWINFO;
  Flashing:Boolean;
  

implementation

{$R *.dfm}

{procedure TfrmMain.WMDisplayChange(var Msg: TWMDisplayChange);
begin
  {try
    SendForm.close;
    OptForm.close;
  except

  end;}
{  if Left + Width > Msg.Width then Left := Msg.Width - Width;
  if Top + Height > Msg.Height then Top := Msg.Height - Height;
  //inherited;
end;

procedure TfrmMain.WMTray(var Msg: TMessage);
var
  CursorPos: TPoint;
begin
  GetCursorPos(CursorPos);
  case Msg.lParam of
    WM_LBUTTONUP: ShowForm(frmMain);
    WM_RBUTTONUP:
      begin
        SetForegroundWindow(Application.Handle);
        Application.ProcessMessages;
        Menu1.Popup(CursorPos.x, CursorPos.y);
      end;
    WM_MOUSEMOVE:
      begin
        TrayIcon.szTip := 'CREDISERVIR - Mensajes';
        Shell_NotifyIcon(NIM_MODIFY, @TrayIcon);
      end;
  end;
  SendMessage(Handle, WM_NULL, 0, 0); // Don't know what this is for...
end; // proc WMTray

procedure TfrmMain.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;
  // Trick Windows into thinking the caption is actually the form's client area
  if Msg.Result = HTCAPTION then Msg.Result := HTCLIENT;
end;

procedure TfrmMain.AppMessage(var Msg: TMsg; var Handled: boolean);
begin
  if Msg.message = WM_TRAY then ShowForm(frmMain);
  if Msg.message = WM_ENDSESSION then Self.Close;
end;

procedure TfrmMain.HideForm(Sender: TObject);
begin
  frmMain.Visible := false;
//  PlaySound('Minimize', 0, SND_ALIAS OR SND_NODEFAULT OR SND_NOSTOP OR
//    SND_NOWAIT OR SND_ASYNC);
end;

procedure TfrmMain.ShowForm(Sender: TObject);
begin
  frmMain.Visible := true;
  Application.ProcessMessages;
  SetForegroundWindow(frmMain.Handle);
  SetWindowPos(Application.Handle,
    HWND_TOPMOST,
    0, 0, 0, 0, // no need for size or position info
    SWP_NOMOVE OR SWP_NOSIZE);

//  PlaySound('RestoreUp', 0, SND_ALIAS OR SND_NODEFAULT OR SND_NOSTOP OR
//    SND_NOWAIT OR SND_ASYNC);
end;
}

procedure TfrmMain.FormCreate(Sender: TObject);
var MiIni:TIniFile;
    Archivo:string;
    DBServer:string;
    DBPath:string;
    DBName:string;
begin
        Archivo := ChangeFileExt(Application.ExeName,'.ini');
        MiIni := TIniFile.Create(Archivo);
        DBServer := MiIni.ReadString('SERVER','server','');
        DBPath := MiIni.ReadString('SERVER','path','');
        DBName := MiIni.ReadString('SERVER','name','');
        DB.DatabaseName := DBServer+':'+DBPath+DBName;
        Path := ExtractFilePath(Application.ExeName);
        Lista := TList.Create;
        MiNombre.Text := TcpClient.LocalHostName;
        MiIP.Caption := TcpClient.LocalHostAddr;
        try
          DB.Open;
          if IBT.InTransaction then IBT.Commit;
          IBT.StartTransaction;
          IBD.Open;
          IBD.First;
          if IBD.Locate('IP_USUARIO',VarArrayOf([MiIP.Caption]),[loCaseInSensitive]) then
           begin
             IBD.Edit;
             IBD.FieldByName('EN_LINEA').AsInteger := 1;
             IBD.FieldByName('MENSAJE_PARA_TODOS').AsString := '';
             IBD.Post;
           end
          else
           begin
             IBD.Append;
             IBD.FieldByName('ID_USUARIO').AsString := MiNombre.Text;
             IBD.FieldByName('IP_USUARIO').AsString := MiIP.Caption;
             IBD.FieldByName('EN_LINEA').AsInteger := 1;
             IBD.Post;
           end;
          IBD.Close;
          IBD.Transaction.Commit;
         except
          begin
           MessageDlg('No se pudo iniciar el servicio' + #13 +
                 'Intente mas tarde',mtError,[mbOk],0);
           Self.Close;
          end;
         end;

         Conexion.Auto_Answer := False;
         Volumen.Position := Sound.Wave.Volume;
         ImageT.Picture.LoadFromFile(Path+'\REC08A.ICO');
         VerificarConexion;
end;


procedure TfrmMain.chkRespuestaClick(Sender: TObject);
begin
        if chkRespuesta.Checked then
         begin
           GroupBox1.Enabled := True;
           Conexion.Auto_Answer := True;
           EdAutoRespuesta.Visible := True;
           Tray.Hint := 'CREDISERVIR - AutoRespuesta Activa';
         end
        else
         begin
          GroupBox1.Enabled := False;
          Conexion.Auto_Answer:= False;
          EdAutoRespuesta.Visible := False;
         end;
end;

procedure TfrmMain.ConexionTextMessage(Sender: TObject; text: String);
begin
  Mensajes.Lines.Add(text);
  if (GetForeGroundWindow()<>Self.Handle) then
    begin
      FWinfo.cbSize := 20;
      FWinfo.hwnd := Application.Handle;
      FWinfo.dwflags := FLASHW_ALL;
      FWinfo.ucount := 5;
      FWinfo.dwtimeout := 0;
      Flashing := True;
      FlashWindowEx(FWinfo);
    end

  else if (Flashing) then
    begin
      FWinfo.cbSize := 20;
      FWinfo.hwnd := Application.Handle;
      FWinfo.dwflags := FLASHW_STOP;
      FWinfo.ucount := 0;
      FWinfo.dwtimeout := 0;
      FlashWindowEx(FWinfo);
      Flashing := false;
    end;


end;

procedure TfrmMain.ActualizarLista;
var i :Integer;
    ListItem: TListItem;
begin
        ListaV.Items.Clear;
        for i := 0 to Lista.Count - 1 do
        begin
          Application.ProcessMessages;
          ARecord := Lista.Items[i];
          with ListaV do begin
               ListItem := Items.Add;
               ListItem.Caption := ARecord^.Nombre;
               ListItem.ImageIndex := 0;
          end;
        end;
end;

procedure TfrmMain.MemoKeyPress(Sender: TObject; var Key: Char);
begin
      if (Key = #13) and (Conexion.Calling) then begin
       Key := #0;
       cmdEnviarClick(Sender);
      end;
end;

procedure TfrmMain.cmdEnviarClick(Sender: TObject);
begin
        with IBSQL1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('insert into "GEN$REGISTRO" Values(');
          SQL.Add(':ID_USUARIO,:ID_DESTINO,:MENSAJE,:MOMENTO)');
          ParamByName('ID_USUARIO').AsString := MiNombre.Text;
          ParamByName('ID_DESTINO').AsString := UDestino;
          ParamByName('MENSAJE').AsString := Memo.Text;
          ParamByName('MOMENTO').AsDateTime := Now;
          try
            ExecQuery;
            Transaction.Commit;
          except
            Transaction.Rollback;
            raise;
          end;
        end;
        Mensajes.Lines.Add(MiNombre.Text + ':' + Memo.Text);
        Conexion.sendmessage(MiNombre.Text + ':' + Memo.Text);
        Memo.Clear;
end;

procedure TfrmMain.ConexionCalled(Sender: TObject; text: String);
var
    cadena:string;
begin
        if Conexion.Auto_Answer then
        begin
           Conexion.sendmessage(EdRespuesta.Text);
           Conexion.Calling := False;
        end
        else
        begin
           Estado.Caption := 'En Llamada';
           Tray.Animated := True;
           cadena := MidStr(Text,2,Pos('P',Text) - 2);
           if IBT.InTransaction Then
             IBT.Commit;
           IBD.Open;
           if IBD.Locate('IP_USUARIO',VarArrayOf([cadena]),[loCaseInsensitive]) then
              cadena := IBD.FieldByName('ID_USUARIO').AsString
           else
              cadena := MidStr(Text,2,Pos('P',Text) - 1);
           CmdContestar.Enabled := True;
           Tray.BalloonHint('Llamada Entrando','Esta recibiendo una llamada de:' + cadena, btInfo, 10000);
           Mensajes.Lines.Add('Esta Recibiendo Una LLamada de: ' + cadena);
           Play.Play;
        end;

end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:Integer;
begin
        EnSalida := True;
        if Conexion.Calling then
           cmdColgar.Click;

        for i := 0 to Lista.Count - 1 do
        begin
            ARecord := Lista.Items[i];
            Dispose(ARecord);
        end;

        Lista.Free;

        try
          if IBT.InTransaction then IBT.Commit;
          IBD.Open;
          IBD.First;
          if IBD.Locate('IP_USUARIO',VarArrayOf([MiIP.Caption]),[loCaseInSensitive]) then
           begin
             IBD.Edit;
             IBD.FieldByName('EN_LINEA').AsInteger := 0;
             IBD.Post;
           end
          else
           begin
             IBD.Append;
             IBD.FieldByName('ID_USUARIO').AsString := MiNombre.Text;
             IBD.FieldByName('IP_USUARIO').AsString := MiIP.Caption;
             IBD.FieldByName('EN_LINEA').AsInteger := 0;
             IBD.Post;
           end;
          IBD.Transaction.Commit;
          IBD.Close;
          DB.Close;
         except
         end;
        CanClose := True;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action := caFree;
end;

procedure TfrmMain.VerificarConexion;
begin
        Lista.Clear;
        if IBT.InTransaction then IBT.Commit;
        IBD.Transaction.StartTransaction;
        IBD.Open;
        IBD.Refresh;
        IBD.Last;
        IBD.First;
        with IBD do
        while not Eof do
        begin
                New(ARecord);
                ARecord^.Nombre := FieldByName('ID_USUARIO').AsString;
                ARecord^.Ip := FieldByName('IP_USUARIO').AsString;
                if ARecord^.Ip <> MiIP.Caption then
                begin
                 if FieldByName('EN_LINEA').AsInteger = 1 then
                 begin
                    ARecord^.EnLinea := True;
                    Lista.Add(ARecord);
                 end;
                end
                else
                begin
                  MiNombre.Text := ARecord^.Nombre;
                end;
                Next;
        end;

        IBD.Close;
        IBT.Commit;

        ActualizarLista;

end;

procedure TfrmMain.CerrarAplicacin1Click(Sender: TObject);
begin
        Self.Close;
end;

procedure TfrmMain.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbRight) and (Y <= 0) then
  begin
    Tray.HideApplication;
  end;

  if (Button = mbLeft) and (Y <= 0) then
  begin
    DraggingWin := true;
    DragFrom.x := X + GetSystemMetrics(SM_CXFRAME) - 1;
    DragFrom.y := Y + GetSystemMetrics(SM_CYSMCAPTION) +
      GetSystemMetrics(SM_CYFRAME) - 1;
  end;

end;

procedure TfrmMain.ListaVDblClick(Sender: TObject);
var i: Integer;
    ip:string;
begin
        i := ListaV.ItemIndex;
        ARecord := Lista.Items[i];
        ip := ARecord^.Ip;
        UDestino := Arecord^.Nombre;
        Llamar(ip);
end;

procedure TfrmMain.llamar(ip: String);
begin
        if not Conexion.Calling then Conexion.placecall(ip);
        Estado.Caption := 'Llamando...';
end;

procedure TfrmMain.ConexionCallAccepted(Sender: TObject; text: String);
begin
        Estado.Caption := 'En Llamada';
        cmdColgar.Enabled := True;
        cmdEnviar.Enabled := True;
        Memo.Enabled := True;
        Memo.SetFocus;
        ImageT.Enabled := True;
        Volumen.Enabled := True;
        ListaV.Enabled := False;
end;

procedure TfrmMain.ConexionConnectionEnded(Sender: TObject; text: String);
begin
        Conexion.Mute := True;
        ImageT.Picture.LoadFromFile(Path+'\REC08A.ICO');
        Estado.Caption := 'Desconectado';
        CmdContestar.Enabled := False;
        cmdColgar.Enabled := False;
        cmdEnviar.Enabled := False;
        ListaV.Enabled := True;
        ImageT.Enabled := false;
        Volumen.Enabled := false;
        Tray.Animated := False;
        Tray.IconIndex := 1;
end;

procedure TfrmMain.cmdColgarClick(Sender: TObject);
begin
        Conexion.sendmessage(MiNombre.Text + ': Desconectando');
        Conexion.Calling := False;
        cmdColgar.Enabled := false;
        CmdContestar.Enabled := false;
        cmdEnviar.Enabled := false;
        ImageT.Enabled := false;
        Volumen.Enabled := false;

end;

procedure TfrmMain.ImageTClick(Sender: TObject);
begin
        if Conexion.Mute then
        begin
           Conexion.Mute := False;
           ImageT.Picture.LoadFromFile(Path+'\REC08B.ICO');
        end
        else
        begin
           Conexion.Mute := True;
           ImageT.Picture.LoadFromFile(Path+'\REC08A.ICO');
        end;

end;

procedure TfrmMain.VolumenTrack(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
        if ScrollPos = 0 then
           ImageS.Picture.LoadFromFile(Path+'\SPEAK13F.ICO')
        else
           ImageS.Picture.LoadFromFile(Path+'\SPEAK13B.ICO');
        Conexion.Volume := ScrollPos;
end;

procedure TfrmMain.CmdContestarClick(Sender: TObject);
begin
        Conexion.answerincomming;
        cmdColgar.Enabled := True;
        CmdContestar.Enabled := False;
        Memo.Enabled := True;
        cmdEnviar.Enabled := True;
        ImageT.Enabled := True;
        Volumen.Enabled := True;
        Tray.Animated := False;
        Tray.IconIndex := 1;
end;

procedure TfrmMain.MiNombreKeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
      begin
        if VarIsEmpty(MiNombre.Text) then
           MiNombre.Text := TcpClient.LocalHostName;
        IBD.Open;
        IBD.Refresh;
        IBD.Locate('IP_USUARIO',VarArrayof([MiIP.Caption]),[locaseInsensitive]);
        IBD.Edit;
        IBD.FieldByName('ID_USUARIO').AsString := MiNombre.Text;
        IBD.Post;
        IBD.Transaction.Commit;
        IBD.Close;
      end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        PageControl.ActivePageIndex := 0;
        ListaV.SetFocus;
end;

procedure TfrmMain.PublicarMensaje(t:string;s: string);
begin
        Mensajes.Lines.Add('/*****************/');
        Mensajes.Lines.Add('Atención: Mensaje de '+t+#13+s);
        Mensajes.Lines.Add('/*****************/');
        Tray.BalloonHint('Atención: Mensaje de ' + t ,s,btWarning,15000);
        Play.Play;
end;

procedure TfrmMain.CmdEnviarMensajeClick(Sender: TObject);
begin
       if MessageDlg('Seguro de enviar este mensaje a todos',mtConfirmation,[mbYes,mbNo],0) = mrYes then
       begin
          if IBT.InTransaction then
             IBT.Commit;
          with IBD do
          begin
            Open;
            Last;
            First;
            while not Eof do
            begin
             Edit;
             FieldByName('MENSAJE_PARA_TODOS').AsString := MiNombre.Text+Chr(250)+DateTimeToStr(Date) + ':' + Memo.Text;
             Post;
             Next;
            end;
            Close;
          end;
          IBT.Commit;
          Memo.Clear;
       end;
end;

procedure TfrmMain.MiNombreExit(Sender: TObject);
begin
        if VarIsEmpty(MiNombre.Text) then
           MiNombre.Text := TcpClient.LocalHostName;
        IBD.Open;
        IBD.Refresh;
        IBD.Locate('IP_USUARIO',VarArrayof([MiIP.Caption]),[locaseInsensitive]);
        IBD.Edit;
        IBD.FieldByName('ID_USUARIO').AsString := MiNombre.Text;
        IBD.Post;
        IBD.Transaction.Commit;
        IBD.Close;

end;

procedure TfrmMain.EdTiempoKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
        begin
           Key := #0;
           Conexion.WaitForconnectionTime := EdTiempo.Value;
        end;
end;

procedure TfrmMain.EdTiempoExit(Sender: TObject);
begin
           Conexion.WaitForconnectionTime := EdTiempo.Value;
end;

procedure TfrmMain.VerificarMensajes;
var s:string;
    t:string;
begin

        if IBT.InTransaction Then
           IBD.Transaction.Commit;
        IBD.Open;
        IBD.Refresh;
        with IBD do
          if Locate('IP_USUARIO',VarArrayof([MiIP.Caption]),[loCaseInsensitive]) then begin
             s := FieldByName('MENSAJE_PARA_TODOS').AsString;
             t := LeftStr(s,Pos(chr(250),s)-1);
             s := MidStr(s,Pos(chr(250),s)+1,Length(s)-Pos(chr(250),s));
             if s <> '' then begin
               PublicarMensaje(t,s);
               Edit;
               FieldByName('MENSAJE_PARA_TODOS').AsString := '';
               Post;
               Close;
               IBT.Commit;
             end;
          end;
end;


procedure TfrmMain.TimerVerificarMensajesTimer(Sender: TObject);
begin
        VerificarMensajes;
end;

procedure TfrmMain.MemoModified(Sender: TObject);
begin
        if Conexion.Calling = False then
         if Length(Memo.Text) > 0 then
          CmdEnviarMensaje.Enabled := True
         else
          CmdEnviarMensaje.Enabled := False;
end;

procedure TfrmMain.TrayBalloonClick(Sender: TObject);
begin
        Tray.ShowApplication;
end;

procedure TfrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  NewPos: TPoint;
begin
  if Y < 0 then
     ShowHint := True
  else
     ShowHint := False;

  if DraggingWin then
  begin
    NewPos := ClientToScreen(point(X, Y));
    Left := NewPos.x - DragFrom.x;
    Top := NewPos.y -  DragFrom.y;
  end;

end;

procedure TfrmMain.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then DraggingWin := False;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 {esc} then Tray.HideApplication;
end;

procedure TfrmMain.IBEvents1EventAlert(Sender: TObject; EventName: String;
  EventCount: Integer; var CancelAlerts: Boolean);
begin
       if not EnSalida then
       begin
        if (EventName = 'entrada') or (EventName = 'salida') then
           Self.VerificarConexion
        else
        if EventName = 'mensaje' then
           Self.VerificarMensajes;
       end;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
if (Flashing) then
    begin
      FWinfo.cbSize := 20;
      FWinfo.hwnd := Application.Handle;
      FWinfo.dwflags := FLASHW_STOP;
      FWinfo.ucount := 0;
      FWinfo.dwtimeout := 0;
      FlashWindowEx(FWinfo);
    end;

end;

end.
