unit UnitAutorizaSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTrayIcon, IBEvents, MSNPopUp, IBDatabase, DB,
  IBCustomDataSet, IBQuery, NLetra, JvStaticText, StdCtrls, ExtCtrls,
  Buttons,JclSysUtils, ImgList;

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
    rAprobar: TRadioButton;
    ImageList1: TImageList;
    Timer1: TTimer;
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
    procedure Timer1Timer(Sender: TObject);
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
          MSNPopUp1.Text := 'Existe un nuevo requerimiento Para Cambios en el Sistema';
          MSNPopUp1.TimeOut := 100;
          MSNPopUp1.ShowPopUp;
          //NoHay := False;
//          if not Self.Visible then
             ShowMessage('listo');
             frmTray.IconIndex := -1;

             frmTray.Animated := True;
        end;

end;

procedure TFrmAutorizacionSolicitud.FormCreate(Sender: TObject);
var     desc :string;
begin
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
             MSNPopUp1.TimeOut := 100;
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
           BitBtn3.Enabled := True;
       end
       else
       begin
           Self.Visible := False;
           MSNPopUp1.Title := 'Autorización';
           MSNPopUp1.Text := 'NO HAY requerimiento para Cambios en el Sistema';
           MSNPopUp1.TimeOut := 100;
           MSNPopUp1.ShowPopUp;
           frmTray.Animated := False;;
           frmTray.IconIndex := 5;
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
          if rAprobar.Checked then
          begin
            SQL.Clear;
            SQL.Add('UPDATE');
            SQL.Add('"per$solicitud"');
            SQL.Add('SET');
            SQL.Add('ID_AUDITORIA = :ID,');
            SQL.Add('OBSERVACIONA = :OBSERVACION,');
            SQL.Add('FECHAV = :FECHA,');
            SQL.Add('HORAV = :HORA,');
            SQL.Add('VISADO = 1,');
            SQL.Add('ESTADO = :ESTADO,');
            sql.Add('OBSERVACION = :OBSERVACION,');
            SQL.Add('ID_SISTEMAS = :ID_SISTEMAS,');
            SQL.Add('FECHAA = :FECHAA,');
            SQL.Add('HORAA = :HORAA,');
            SQL.Add('APLICADO = 1');
            SQL.Add('WHERE');
            SQL.Add('ID_AGENCIA = :ID_AGENCIA AND ');
            SQL.Add('CONSECUTIVO = :CONSECUTIVO');
            ParamByName('ID').AsString := DBAlias;
            ParamByName('OBSERVACION').AsString := observacion.Text;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('HORA').AsTime := Time;
            ParamByName('ESTADO').AsInteger := 1;;
            ParamByName('ID_AGENCIA').AsInteger := vIdAgencia;
            ParamByName('CONSECUTIVO').AsInteger := vIdConsecutivo;
            ParamByName('ID_SISTEMAS').AsString := DBAlias;
            ParamByName('FECHAA').AsDate := fFechaActual;
            ParamByName('HORAA').AsTime := Time;
            ParamByName('OBSERVACION').AsString := 'APROBADO POR AUDITORIA';
            ExecSQL;
          end
          else
          begin
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
          end;
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
        if NoHay = False then
        begin
           frmTray.Animated := False;
           frmTray.IconIndex := 5;
        end;
        Rautoriza.Checked := True;
end;

procedure TFrmAutorizacionSolicitud.BitBtn4Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmAutorizacionSolicitud.observacionExit(Sender: TObject);
begin
        observacion.Text := UpperCase(observacion.Text);
end;

procedure TFrmAutorizacionSolicitud.Timer1Timer(Sender: TObject);
begin
        Buscar;
        if NoHay then
        begin
          MSNPopUp1.Title := 'Autorización';
          MSNPopUp1.Text := 'Existe un nuevo requerimiento Para Cambios en el Sistema';
          MSNPopUp1.TimeOut := 100;
          MSNPopUp1.ShowPopUp;
          frmTray.IconIndex := -1;
          frmTray.Animated := True;
        end;

end;

end.
