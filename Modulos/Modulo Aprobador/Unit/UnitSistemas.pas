unit UnitSistemas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTrayIcon, IBEvents, MSNPopUp, IBDatabase, DB,
  IBCustomDataSet, IBQuery, NLetra, JvStaticText, StdCtrls, ExtCtrls,
  Buttons,JclSysUtils, DBCtrls, ComCtrls,IniFiles, Menus;

type
  TFrmsSistemas = class(TForm)
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
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    IBQuery1: TIBQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    vFecha: TDateTimePicker;
    IBValida: TIBQuery;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Cerrar1: TMenuItem;
    CbEmpleado: TComboBox;
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Cerrar1Click(Sender: TObject);
    procedure Cerrar2Click(Sender: TObject);
  private
  NoHay :Boolean;
  Numero :Integer;
  vIdAgencia :Integer;
  vSalir :Boolean;
  vIdConsecutivo :Integer;
    procedure MostrarDatos;
    { Private declarations }
  public
  published
    procedure Buscar;
    { Public declarations }
  end;

var
  FrmsSistemas: TFrmsSistemas;

implementation
uses UnitGlobales, UnitdmGeneral;

{$R *.dfm}

procedure TFrmsSistemas.IBEvents1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
var     desc: string;
begin
        if EventName = 'por_aplicar' then
        begin
        Buscar;
        if NoHay then
        begin
             desc := '';
             NLetra1.Numero := Numero;
             if Numero = 1 then
                desc := 'Existe un Requerimiento por Aplicar'
             else
                 desc := 'Existen ' + NLetra1.Letras + ' Requerimientos por Aplicar';
             MSNPopUp1.Title := 'Aplicación';
             MSNPopUp1.Text := desc;
             MSNPopUp1.TimeOut := 10;
             MSNPopUp1.ShowPopUp;
        end;
        end;

end;

procedure TFrmsSistemas.FormCreate(Sender: TObject);
var     desc, MiINI :string;
begin
  vFecha.DateTime := date;
  DBAlias := 'sysdba';
  DBPasabordo := 'masterkey';
  vSalir :=False;
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
                desc := 'Existe un Requerimiento por Aplicar'
             else
                 desc := 'Existen ' + NLetra1.Letras + ' Requerimientos por Aplicar';
             MSNPopUp1.Title := 'Autorización';
             MSNPopUp1.Text := desc;
             MSNPopUp1.TimeOut := 10;
             MSNPopUp1.ShowPopUp;
             frmTray.Animated := True;
             MostrarDatos;
        end;
        Timer1.Enabled := True;
        Self.Visible := False;

end;

procedure TFrmsSistemas.Buscar;
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

procedure TFrmsSistemas.frmTrayDblClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        Buscar;
        if NoHay then
        begin
           Self.Visible := True;
           MostrarDatos;
           BitBtn1.Enabled := True;
           BitBtn2.Enabled := False;
           BitBtn3.Enabled := True;
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

procedure TFrmsSistemas.frmTrayBalloonShow(Sender: TObject);
var     desc :string;
begin
end;

procedure TFrmsSistemas.frmTrayMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var desc :string;
begin
        Buscar;
        desc := '';
        NLetra1.Numero := Numero;
        if Numero = 0 then
           desc := 'No existe Requerimineto de Cambios al Sistema'
        else if Numero = 1 then
           desc := 'Existe un Requerimiento por Aplicar'
        else
           desc := 'Existen ' + NLetra1.Letras + ' Requerimientos por Autorizar';
        frmTray.Hint := desc;

end;

procedure TFrmsSistemas.MostrarDatos;
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
          observacion.Text := FieldByName('OBSERVACIONA').AsString;
        end;

end;

procedure TFrmsSistemas.BitBtn1Click(Sender: TObject);
begin
        IBBuscar.Next;
        Mostrardatos;
        if IBBuscar.RecNo = Numero then
           BitBtn1.Enabled := False
        else
          BitBtn1.Enabled := True;
        if IBBuscar.RecNo = 1 then
           BitBtn2.Enabled := False
        else
          BitBtn2.Enabled := True;

end;

procedure TFrmsSistemas.BitBtn2Click(Sender: TObject);
begin
        IBBuscar.Prior;
        Mostrardatos;
        if IBBuscar.RecNo = 1 then
           BitBtn2.Enabled := False
        else
          BitBtn2.Enabled := True;
        if IBBuscar.RecNo = Numero then
           BitBtn1.Enabled := False
        else
          BitBtn1.Enabled := True;


end;

procedure TFrmsSistemas.BitBtn3Click(Sender: TObject);
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
          SQL.Add('update "per$solicitud" set ID_SISTEMAS = :ID,');
          SQL.Add('FECHAA = :FECHA , HORAA = :HORA , APLICADO = :ESTADO');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA and CONSECUTIVO = :CONSECUTIVO');
          ParamByName('ID').AsString := CbEmpleado.Text;
          ParamByName('FECHA').AsDate := vFecha.Date;
          ParamByName('HORA').AsTime := Time;
          ParamByName('ESTADO').AsInteger := 1;
          ParamByName('ID_AGENCIA').AsInteger := vIdAgencia;
          ParamByName('CONSECUTIVO').AsInteger := vIdConsecutivo;
          ExecSQL;
          Transaction.Commit;
          MessageDlg('Solicitud Registrada con Exito',mtInformation,[mbok],0);
          Buscar;
          MostrarDatos;
          if IBBuscar.RecordCount = 0 then
             BitBtn3.Enabled := False
          else
             BitBtn3.Enabled := True;
          observacion.Text := '';
        end;
end;

procedure TFrmsSistemas.BitBtn4Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmsSistemas.observacionExit(Sender: TObject);
begin
        observacion.Text := UpperCase(observacion.Text);
end;

procedure TFrmsSistemas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        if vSalir = False then
        begin
          CanClose := False;
          Self.Visible := False;
        end
        else
          CanClose := True;

end;

procedure TFrmsSistemas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//           Action := caFree;
end;

procedure TFrmsSistemas.Timer1Timer(Sender: TObject);
var     desc :string;
begin
        Buscar;
        if NoHay then
        begin
             desc := '';
             NLetra1.Numero := Numero;
             if Numero = 1 then
                desc := 'Existe un Requerimiento por Aplicar'
             else
                 desc := 'Existen ' + NLetra1.Letras + ' Requerimientos por Aplicar';
             MSNPopUp1.Title := 'Aplicación';
             MSNPopUp1.Text := desc;
             MSNPopUp1.TimeOut := 10;
             MSNPopUp1.ShowPopUp;
        end;

end;

procedure TFrmsSistemas.Cerrar1Click(Sender: TObject);
begin
        vSalir := True;
        Close;
end;

procedure TFrmsSistemas.Cerrar2Click(Sender: TObject);
begin
        vSalir := True;
        Close;

end;

end.

