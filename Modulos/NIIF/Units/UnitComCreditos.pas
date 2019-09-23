unit UnitComCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvStaticText, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFrmComCreditos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Msolicitud: TMaskEdit;
    BitBtn1: TBitBtn;
    JVfecha: TJvStaticText;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    JVsolicitante: TJvStaticText;
    JVcuenta: TJvStaticText;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    Mdesgarantia: TMemo;
    Mabogado: TMemo;
    Mavaluo: TMemo;
    Minmueble: TMemo;
    GroupBox4: TGroupBox;
    Mconcepto: TMemo;
    Panel3: TPanel;
    Bregistra: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox6: TGroupBox;
    Mactividad: TMemo;
    GroupBox7: TGroupBox;
    Mcodeudores: TMemo;
    procedure MdesgarantiaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BregistraClick(Sender: TObject);
    procedure MdesgarantiaKeyPress(Sender: TObject; var Key: Char);
    procedure MabogadoKeyPress(Sender: TObject; var Key: Char);
    procedure MavaluoKeyPress(Sender: TObject; var Key: Char);
    procedure MinmuebleKeyPress(Sender: TObject; var Key: Char);
    procedure MabogadoExit(Sender: TObject);
    procedure MavaluoExit(Sender: TObject);
    procedure MinmuebleExit(Sender: TObject);
    procedure MconceptoExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MactividadExit(Sender: TObject);
    procedure McodeudoresExit(Sender: TObject);
    procedure MconceptoKeyPress(Sender: TObject; var Key: Char);
    procedure MactividadKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
  published
    procedure cmChildKey(var msg: TWMKEY); message CM_CHILDKEY;
    procedure reg_observacion(id_observacion: integer; concepto: string);
    { Public declarations }
  end;

var
  FrmComCreditos: TFrmComCreditos;

implementation

uses UnitDmSolicitud;

{$R *.dfm}

procedure TFrmComCreditos.MdesgarantiaExit(Sender: TObject);
begin
        Mdesgarantia.Text := UpperCase(Mdesgarantia.Text)
end;

procedure TFrmComCreditos.FormCreate(Sender: TObject);
begin
        DmSolicitud := TDmSolicitud.Create(Self );
end;

procedure TFrmComCreditos.BitBtn1Click(Sender: TObject);
var     oficina ,id_identificacion :Integer;
        id_persona :string;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT *');
          SQL.Add('FROM');
          SQL.Add('"col$observacion"');
          SQL.Add('WHERE');
          SQL.Add('("col$observacion".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("col$observacion".ID_OBSERVACION = 11)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          Open;
          if RecordCount <> 0 then
          begin
             MessageDlg('El Informe de Creditos ya Fue Generado',mtinformation,[mbok],0);
             Msolicitud.SetFocus;
             Exit;
          end;

          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION,');
          SQL.Add('"col$solicitud".OFICINA,');
          SQL.Add('"col$solicitud".ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("col$solicitud".ESTADO = 3)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          Open;
          if RecordCount = 0 then
          begin
             MessageDlg('Solicitud no Encontrada, o se Encuentra en un Estado Diferente',mtInformation,[mbok],0);
             Msolicitud.SetFocus;
             Exit;
          end;
          JVfecha.Caption := FormatDateTime('dd-mmm-yyyy',FieldByName('FECHA_RECEPCION').AsDateTime);
          oficina := FieldByName('OFICINA').AsInteger;
          id_persona := FieldByName('ID_PERSONA').AsString;
          id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE');
          SQL.Add('from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          Open;
          JVsolicitante.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          SQL.Clear;
          SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger := oficina;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          Open;
          JVcuenta.Caption := '20'+IntToStr(oficina)+'-'+Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
          SQL.Clear;
          SQL.Add('select * from "col$codeudor"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
          SQL.Add('and ES_CONYUGUE = 0');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          Open;
          while not Eof do
          begin
            with DmSolicitud.IBSQL1 do
            begin
              Close;
              if Transaction.InTransaction then
                 Transaction.Commit;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('select NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,PROFESION');
              SQL.Add('from');
              SQL.Add('"gen$persona"');
              SQL.Add('where');
              SQL.Add('(ID_IDENTIFICACION = :ID_IDENTIFICACION) and');
              SQL.Add('(ID_PERSONA = :ID_PERSONA)');
              ParamByName('ID_IDENTIFICACION').AsInteger := DmSolicitud.IBSolicitud1.FieldByName('ID_IDENTIFICACION').AsInteger;
              ParamByName('ID_PERSONA').AsString := DmSolicitud.IBSolicitud1.FieldByName('ID_PERSONA').AsString;
              ExecQuery;
              Mcodeudores.Text := Mcodeudores.Text + IntToStr(DmSolicitud.IBSolicitud1.RecNo)+ '. '+ FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString + '     ';
              Close;
            end;
            Next;
          end;
          Close;
          Panel1.Enabled := False;
          Mdesgarantia.SetFocus;
        end;
end;

procedure TFrmComCreditos.cmChildKey(var msg: TWMKEY);
begin
if msg.CharCode = VK_RETURN then
    if not (Assigned(ActiveControl) and
           ((ActiveControl is TButton) or
            (ActiveControl is TCustomMemo)))
    then begin
      msg.Result := 1;
      keybd_event(VK_TAB, MapVirtualKey(VK_TAB,0), 0, 0);
      Keybd_event(VK_TAB, MapVirtualKey(VK_TAB,0), KEYEVENTF_KEYUP, 0);
    end;
end;

procedure TFrmComCreditos.BitBtn3Click(Sender: TObject);
begin
        Msolicitud.Text := '';
        Panel1.Enabled := True;
        JVcuenta.Caption := '';
        JVsolicitante.Caption := '';
        Mdesgarantia.Text := '';
        Mabogado.Text := '';
        Mavaluo.Text;
        Minmueble.Text := '';
        Mconcepto.Text := '';
        Mactividad.Text := '';
        Mcodeudores.Text := '';
        Bregistra.Enabled := True;
        Msolicitud.SetFocus;
end;

procedure TFrmComCreditos.BregistraClick(Sender: TObject);
begin
          if Mdesgarantia.Text  <> '' then
          begin
//             Mdesgarantia.Text := 'NINGUNA';
             reg_observacion(7,Mdesgarantia.Text);
          end;
          if Mabogado.Text  <> '' then
             reg_observacion(8,Mabogado.Text);
          if Mavaluo.Text  <> '' then
             reg_observacion(9,Mavaluo.Text);
          if Minmueble.Text  <> '' then
             reg_observacion(10,Minmueble.Text);
          if Mconcepto.Text <> '' then
          begin
 //            Mconcepto.Text := 'NINGUNA';
             reg_observacion(11,Mconcepto.Text);
          end;
          if Mactividad.Text <> '' then
             reg_observacion(0,Mactividad.Text);
          if Mcodeudores.Text <> '' then
             reg_observacion(12,Mcodeudores.Text);
          Bregistra.Enabled := False;
end;

procedure TFrmComCreditos.MdesgarantiaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mabogado.SetFocus;
            
end;

procedure TFrmComCreditos.MabogadoKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
          Mavaluo.SetFocus
end;

procedure TFrmComCreditos.MavaluoKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
          Minmueble.SetFocus
end;

procedure TFrmComCreditos.MinmuebleKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
          Mconcepto.SetFocus;
end;

procedure TFrmComCreditos.MabogadoExit(Sender: TObject);
begin
        Mabogado.Text := UpperCase(Mabogado.Text)
end;

procedure TFrmComCreditos.MavaluoExit(Sender: TObject);
begin
        Mavaluo.Text := UpperCase(Mavaluo.Text)
end;

procedure TFrmComCreditos.MinmuebleExit(Sender: TObject);
begin
        Minmueble.Text := UpperCase(Minmueble.Text)
end;

procedure TFrmComCreditos.MconceptoExit(Sender: TObject);
begin
        Mconcepto.Text := UpperCase(Mconcepto.Text)
end;

procedure TFrmComCreditos.BitBtn4Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmComCreditos.MactividadExit(Sender: TObject);
begin
        Mactividad.Text := UpperCase(Mactividad.Text);
end;

procedure TFrmComCreditos.McodeudoresExit(Sender: TObject);
begin
        Mcodeudores.Text := UpperCase(Mcodeudores.Text)
end;

procedure TFrmComCreditos.MconceptoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mactividad.SetFocus
end;

procedure TFrmComCreditos.MactividadKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mcodeudores.SetFocus
end;

procedure TFrmComCreditos.reg_observacion(id_observacion: integer;
  concepto: string);
begin
        with DmSolicitud.IBsolicitud2 do
        begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('delete from "col$observacion"');
           SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
           SQL.Add('ID_OBSERVACION = :ID_OBSERVACION');
           ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
           ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
           Open;
           SQL.Clear;
           SQL.Add('insert into "col$observacion"');
           SQL.Add('values(:ID_SOLICITUD,:ID_OBSERVACION,:OBSERVACION)');
           ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
           ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
           ParamByName('OBSERVACION').AsString := concepto;
           Open;
           Close;
           Transaction.Commit;
        end;
end;

end.
