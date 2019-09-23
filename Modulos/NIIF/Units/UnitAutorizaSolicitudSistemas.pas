unit UnitAutorizaSolicitudSistemas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTrayIcon, IBEvents, MSNPopUp, IBDatabase, DB,
  IBCustomDataSet, IBQuery, NLetra, JvStaticText, StdCtrls, ExtCtrls,
  Buttons,JclSysUtils;

type
  TFrmAutorizacionSolicitud = class(TForm)
    IBEvents1: TIBEvents;
    frmTray: TJvTrayIcon;
    MSNPopUp1: TMSNPopUp;
    IBBuscar: TIBQuery;
    IBTBuscar: TIBTransaction;
    NLetra1: TNLetra;
    GroupBox1: TGroupBox;
    JvStaticText1: TJvStaticText;
    agencia: TJvStaticText;
    area: TJvStaticText;
    JvStaticText4: TJvStaticText;
    fecha: TJvStaticText;
    JvStaticText7: TJvStaticText;
    login: TJvStaticText;
    JvStaticText9: TJvStaticText;
    empleado: TJvStaticText;
    JvStaticText11: TJvStaticText;
    GroupBox2: TGroupBox;
    requerimiento: TMemo;
    GroupBox3: TGroupBox;
    explicacion: TMemo;
    GroupBox4: TGroupBox;
    observacion: TMemo;
    Panel1: TPanel;
    Rautoriza: TRadioButton;
    Rniega: TRadioButton;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    IBQuery1: TIBQuery;
    procedure IBEvents1EventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure frmTrayDblClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure frmTrayBalloonShow(Sender: TObject);
    procedure frmTrayMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure observacionExit(Sender: TObject);
  private
  NoHay :Boolean;
  Numero :Integer;
  vIdAgencia :Integer;
  vIdConsecutivo :Integer;
    procedure MostrarDatos;
    { Private declarations }
  public
  published
    procedure Buscar;
    { Public declarations }
  end;

var
  FrmAutorizacionSolicitud: TFrmAutorizacionSolicitud;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmAutorizacionSolicitud.IBEvents1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
begin
        if EventName = 'por_autorizar' then
        begin
          MSNPopUp1.Title := 'Autorización';
          MSNPopUp1.Text := 'Existe un nuevo requerimiento Para Cambios en el Ssitema';
          MSNPopUp1.TimeOut := 10;
          MSNPopUp1.ShowPopUp;
          //NoHay := False;
          if not Self.Visible then
             frmTray.Animated := True;
        end;

end;

procedure TFrmAutorizacionSolicitud.FormCreate(Sender: TObject);
var     desc, MiINI :string;
begin
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.1.8');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
  finally
    free;
  end;
    dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
    dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
    dmGeneral.IBDatabase1.Params.Values['User_Name'] := DBAlias;
    dmGeneral.IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
    dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := Role;
    dmGeneral.IBDatabase1.Connected := True;
    dmGeneral.IBTransaction1.Active := True;
        frmTray.Active := True;
        Self.Hide;
        Buscar;
        if NoHay then
        begin
             desc := '';
             NLetra1.Numero := Numero;
             if Numero = 1 then
                desc := 'Existe un Requerimiento por Autorizar'
             else
                 desc := 'Existen ' + NLetra1.Letras + ' Requerimientos por Autorizar';
             MSNPopUp1.Title := 'Autorización';
             MSNPopUp1.Text := desc;
             MSNPopUp1.TimeOut := 10;
             MSNPopUp1.ShowPopUp;
             frmTray.Animated := True;
        end;

end;

procedure TFrmAutorizacionSolicitud.Buscar;
begin
        with IBBuscar do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Open;
          Last;
          First;
          Numero := RecordCount;
          if RecordCount > 0 then
             NoHay := True
          else
            NoHay := False;
        end;

end;

procedure TFrmAutorizacionSolicitud.frmTrayDblClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        Buscar;
        if NoHay then
        begin
           Self.Visible := True;
           MostrarDatos;
           BitBtn1.Enabled := True;
           BitBtn2.Enabled := False;
       end
       else
       begin
           Self.Visible := False;
           MSNPopUp1.Title := 'Autorización';
           MSNPopUp1.Text := 'NO HAY requerimiento para Cambios en el Sistema';
           MSNPopUp1.TimeOut := 10;
           MSNPopUp1.ShowPopUp;
           frmTray.Animated := False;;
           frmTray.IconIndex := 0;
        end;

end;

procedure TFrmAutorizacionSolicitud.frmTrayBalloonShow(Sender: TObject);
var     desc :string;
begin
end;

procedure TFrmAutorizacionSolicitud.frmTrayMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var desc :string;
begin
        Buscar;
        desc := '';
        NLetra1.Numero := Numero;
        if Numero = 0 then
           desc := 'No existe Requerimineto de Cambios al Sistema'
        else if Numero = 1 then
           desc := 'Existe un Requerimiento por Autorizar'
        else
           desc := 'Existen ' + NLetra1.Letras + ' Requerimientos por Autorizar';
        frmTray.Hint := desc;

end;

procedure TFrmAutorizacionSolicitud.MostrarDatos;
begin
        with IBBuscar do
        begin
          agencia.Caption := FieldByName('DESCRIPCION_AGENCIA').AsString;
          area.Caption := FieldByName('AREA').AsString;
          fecha.Caption := FieldByName('FECHAR').AsString + '-' + FieldByName('HORAR').AsString ;
          login.Caption := FieldByName('ID_EMPLEADO').AsString;
          empleado.Caption := FieldByName('NOMBRE').AsString;
          requerimiento.Text := FieldByName('REQUERIMIENTO').AsString;
          explicacion.Text := FieldByName('EXPLICACION').AsString;
          vIdAgencia := FieldByName('ID_AGENCIA').AsInteger;
          vIdConsecutivo := FieldByName('CONSECUTIVO').AsInteger;
        end;

end;

procedure TFrmAutorizacionSolicitud.BitBtn1Click(Sender: TObject);
begin
        IBBuscar.Next;
        Mostrardatos;
        observacion.Text := '';
        observacion.SetFocus;
        if IBBuscar.RecNo = Numero then
           BitBtn1.Enabled := False
        else
          BitBtn1.Enabled := True;
        if IBBuscar.RecNo = 1 then
           BitBtn2.Enabled := False
        else
          BitBtn2.Enabled := True;
          
end;

procedure TFrmAutorizacionSolicitud.BitBtn2Click(Sender: TObject);
begin
        IBBuscar.Prior;
        Mostrardatos;
        observacion.Text := '';
        observacion.SetFocus;        
        if IBBuscar.RecNo = 1 then
           BitBtn2.Enabled := False
        else
          BitBtn2.Enabled := True;
        if IBBuscar.RecNo = Numero then
           BitBtn1.Enabled := False
        else
          BitBtn1.Enabled := True;


end;

procedure TFrmAutorizacionSolicitud.BitBtn3Click(Sender: TObject);
begin
        if MessageDlg('Esta Seguro de Realizar la Operación',mtWarning,[mbyes,mbno],0) = mrNo then
           Exit;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('update "per$solicitud" set ID_AUDITORIA = :ID, OBSERVACIONA = :OBSERVACION,');
          SQL.Add('FECHAV = :FECHA , HORAV = :HORA , VISADO = 1 , ESTADO = :ESTADO');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA and CONSECUTIVO = :CONSECUTIVO');
          ParamByName('ID').AsString := DBAlias;
          ParamByName('OBSERVACION').AsString := observacion.Text;
          ParamByName('FECHA').AsDate := fFechaActual;
          ParamByName('HORA').AsTime := Time;
          ParamByName('ESTADO').AsInteger := BoolToInt(Rautoriza.Checked);
          ParamByName('ID_AGENCIA').AsInteger := vIdAgencia;
          ParamByName('CONSECUTIVO').AsInteger := vIdConsecutivo;
          ExecSQL;
          Transaction.Commit;
          MessageDlg('Solicitud Registrada con Exito',mtInformation,[mbok],0);
          Buscar;
          MostrarDatos;
          if IBBuscar.RecordCount = 0 then
             BitBtn3.Enabled := False;
          observacion.Text := '';
        end;
end;

procedure TFrmAutorizacionSolicitud.BitBtn4Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmAutorizacionSolicitud.observacionExit(Sender: TObject);
begin
        observacion.Text := UpperCase(observacion.Text);
end;

end.
