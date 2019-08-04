unit UnitCambios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, JvDateTimePicker, ComCtrls,
  JvStaticText, Mask, Buttons, IBDatabase, DB, IniFiles, IBCustomDataSet,
  IBQuery;
const
  C1 = 52845;
  C2 = 11719;

type
  TFrmCambios = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    empleado: TDBLookupComboBox;
    Label2: TLabel;
    seccion: TDBLookupComboBox;
    Label3: TLabel;
    fechas: TDateTimePicker;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Explicacion: TMemo;
    GroupBox3: TGroupBox;
    Observacion: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fechar: TDateTimePicker;
    requerimiento: TMemo;
    Usuario: TDBLookupComboBox;
    Label7: TLabel;
    hora: TMaskEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IbDatabase: TIBDatabase;
    IbInventario: TIBDatabase;
    IBTInventario: TIBTransaction;
    IBTDatabase: TIBTransaction;
    IbEmpleado: TIBQuery;
    DataSource1: TDataSource;
    IbSeccion: TIBQuery;
    DataSource2: TDataSource;
    IBusuario: TIBQuery;
    DataSource3: TDataSource;
    IBQuery1: TIBQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure empleadoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure requerimientoExit(Sender: TObject);
    procedure ExplicacionExit(Sender: TObject);
    procedure ObservacionExit(Sender: TObject);
    procedure empleadoEnter(Sender: TObject);
    procedure seccionEnter(Sender: TObject);
    procedure UsuarioEnter(Sender: TObject);
    procedure horaExit(Sender: TObject);
  private
    { Private declarations }
  public
  published
    function Decrypt(const S: String; Key: Word): String;
    procedure Aplica;
    procedure EnterTabs(var Key: Char; oSelf: TForm);
    { Public declarations }
  end;

var
  FrmCambios: TFrmCambios;

implementation

{$R *.dfm}

procedure TFrmCambios.Aplica;
begin
        fechar.Date := Date;
        fechas.Date := Date;
        if IBTInventario.InTransaction then
           IBTInventario.Rollback;
        IBTInventario.StartTransaction;
        if IBTDatabase.InTransaction then
           IBTDatabase.Rollback;
        IBTDatabase.StartTransaction;
        IbEmpleado.Close;
        IbEmpleado.Open;
        IbEmpleado.Last;
        IbSeccion.Close;
        IbSeccion.Open;
        IbSeccion.Last;
        IBusuario.Close;
        IBusuario.Open;
        IBusuario.Last;
end;

procedure TFrmCambios.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

function TFrmCambios.Decrypt(const S: String; Key: Word): String;
 var
         I: byte;
       begin
         SetLength(Result,Length(S));
         for I := 1 to Length(S) do begin
           Result[I] := char(byte(S[I]) xor (Key shr 8));
           Key := (byte(S[I]) + Key) * C1 + C2;
         end;

end;

procedure TFrmCambios.FormCreate(Sender: TObject);
var
    DBserver :string;
    DBpath :string;
    DBname :string;
    ServerInventario :string;
    RutaInventario :string;
    NombreInventario :string;
    dbPassSysdba :string;
    MiINI :string;
//    frmConectando:TfrmConectando;
begin
  IbDatabase.Params.Clear;
  IbInventario.Params.Clear;
  IbInventario.Connected := False;
  IbDatabase.Connected := False;
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','192.168.1.8');
    DBPath := ReadString('DBNAME','path','/home/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    //** Base de Datos Inventario
    ServerInventario := ReadString('DBNAMEI','server','192.168.1.8');
    RutaInventario := ReadString('DBNAMEI','path','/home/');
    NombreInventario := ReadString('DBNAMEI','name','coopservir.gdb');
    //** Base de Datos Inventario
    //** Contraseña SYSDBA
    dbPassSysdba  := Decrypt(ReadString('ADICIONALES','key','0'),6474);
  finally
    free;
  end;
        IBDatabase.DataBaseName := DBserver + ':' + DBpath + DBname;
        IBDatabase.Params.Values['lc_ctype'] := 'ISO8859_1';
        IBDatabase.Params.Values['User_Name'] := 'sysdba';
        IBDatabase.Params.Values['PassWord'] := dbPassSysdba;
                //*** base de datos inventario
        IbInventario.DataBaseName := ServerInventario + ':' + RutaInventario + NombreInventario;
        IbInventario.Params.Values['lc_ctype'] := 'ISO8859_1';
        IbInventario.Params.Values['User_Name'] := 'sysdba';
        IbInventario.Params.Values['PassWord'] :=  dbPassSysdba;
        IbInventario.Connected := True;
        IbDatabase.Connected := True;
        IBTDatabase.Active := True;        
        IBTInventario.Active := True;
        aplica;
end;

procedure TFrmCambios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
           Action := caFree;
end;

procedure TFrmCambios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        IbInventario.Connected := False;
        IBTInventario.Active := False;
        IbDatabase.Connected := False;
        IBTDatabase.Active := False;
        CanClose := True;
end;

procedure TFrmCambios.EnterTabs(var Key: Char; oSelf: TForm);
begin
  if (Key=#13) and
      not (oSelf.ActiveControl is TButton)    and
      not (oSelf.ActiveControl is TDBMemo)    {and
      not (oSelf.ActiveControl is TJvStringGrid)}
                                 then begin
      oSelf.Perform( WM_NEXTDLGCTL, 0,0);

      Key := #0;
      end;

end;

procedure TFrmCambios.empleadoKeyPress(Sender: TObject; var Key: Char);
begin
        entertabs(Key,Self)
end;

procedure TFrmCambios.BitBtn2Click(Sender: TObject);
begin
        requerimiento.Text := '';
        Explicacion.Text := '';
        Observacion.Text := '';
        empleado.SetFocus;
        aplica;

end;

procedure TFrmCambios.BitBtn1Click(Sender: TObject);
var     vConsecutivo :Integer;
begin
        if MessageDlg('Seguro de Realizar el Registro',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        with IBQuery1 do
        begin
          try
          Close;
          SQL.Clear;
          SQL.Add('select max(CONSECUTIVO) + 1 as CONSECUTIVO FROM "registro"');
          Open;
          vConsecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('insert into "registro" values (:CONSECUTIVO,:AREA,:FECHA_S,:REQUERIMIENTO,:EXPLICACION,:USUARIO,:EMPLEADO,:FECHA_R,:HORA_R,:OBSERVACION)');
          ParamByName('CONSECUTIVO').AsInteger := vConsecutivo;
          ParamByName('AREA').AsString := seccion.Text;
          ParamByName('FECHA_S').AsDate := fechas.Date;
          ParamByName('REQUERIMIENTO').AsString := requerimiento.Text;
          ParamByName('EXPLICACION').AsString := Explicacion.Text;
          ParamByName('USUARIO').AsString := Usuario.Text;
          ParamByName('EMPLEADO').Text := empleado.Text;
          ParamByName('FECHA_R').AsDate := fechar.Date;
          ParamByName('HORA_R').AsTime := StrToTime(hora.Text);
          ParamByName('OBSERVACION').AsString := Observacion.Text;
          ExecSQL;
          except
            ShowMessage('No se Grabo el Registro');
            Exit;
          end;
          Transaction.Commit;
          MessageDlg('Registro Grabado, Consecutivo No. '+ IntToStr(vConsecutivo), mtInformation,[mbok],0);
          BitBtn2.Click;
        end;
end;

procedure TFrmCambios.requerimientoExit(Sender: TObject);
begin
        requerimiento.Text := UpperCase(requerimiento.Text);
end;

procedure TFrmCambios.ExplicacionExit(Sender: TObject);
begin
        Explicacion.Text := UpperCase(Explicacion.Text);
end;

procedure TFrmCambios.ObservacionExit(Sender: TObject);
begin
        Observacion.Text := UpperCase(Observacion.Text);
end;

procedure TFrmCambios.empleadoEnter(Sender: TObject);
begin
        empleado.DropDown;
end;

procedure TFrmCambios.seccionEnter(Sender: TObject);
begin
        seccion.DropDown
end;

procedure TFrmCambios.UsuarioEnter(Sender: TObject);
begin
        Usuario.DropDown
end;

procedure TFrmCambios.horaExit(Sender: TObject);
var     hora1 :TDateTime;
begin
        try
          hora1 := StrToTime(hora.Text);
        except
        begin
          ShowMessage('Hora no Valida');
          hora.SetFocus;
        end;
        end;
end;

end.

