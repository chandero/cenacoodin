unit UnitConsultaSol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, JvEdit, JvTypedEdit, DBCtrls, Mask,
  JvStaticText, ExtCtrls, Buttons, Grids, DBGrids, DB, DBClient,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TFrmConsultaSol = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBtipo: TDBLookupComboBox;
    Label3: TLabel;
    Mradicado: TMaskEdit;
    Label4: TLabel;
    fecha: TJvStaticText;
    JVnumero: TJvEdit;
    Panel1: TPanel;
    Label5: TLabel;
    JVnombres: TJvStaticText;
    Panel2: TPanel;
    Scuenta: TStaticText;
    StaticText2: TStaticText;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    CDsolicitud: TClientDataSet;
    DSsolicitud: TDataSource;
    CDsolicitudradicado: TStringField;
    CDsolicitudestado: TStringField;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DStipo: TDataSource;
    IBTransaction1: TIBTransaction;
    IBtipo: TIBQuery;
    BTbuscar: TBitBtn;
    CDsolicitudvalor_a: TStringField;
    CDsolicitudfecha: TDateField;
    BTbuscar1: TBitBtn;
    CDsolicitudcod_estado: TSmallintField;
    Label7: TLabel;
    CDsolicitudid_estado: TIntegerField;
    TabSheet3: TTabSheet;
    IBQuery1: TIBQuery;
    DBtipocuenta: TDBLookupComboBox;
    Label8: TLabel;
    BitBtn3: TBitBtn;
    Label9: TLabel;
    DataSource1: TDataSource;
    JVcuenta: TJvEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BTbuscarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BTbuscar1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
  published
    procedure cmChildKey(var msg: TWMKEY); message CM_CHILDKEY;
    { Public declarations }
  end;

var
  FrmConsultaSol: TFrmConsultaSol;

implementation

uses UnitDmSolicitud, UnitDescObservacion;

{$R *.dfm}

procedure TFrmConsultaSol.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmConsultaSol.cmChildKey(var msg: TWMKEY);
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

procedure TFrmConsultaSol.FormCreate(Sender: TObject);
begin
        IBtipo.Open;
        IBtipo.Last;
        IBQuery1.Open;
        IBQuery1.Last;
        DmSolicitud := TDmSolicitud.Create(Self);
        PageControl1.ActivePageIndex := 0;
end;

procedure TFrmConsultaSol.BTbuscarClick(Sender: TObject);
var     oficina :Integer;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"col$estadosolicitud".ID_ESTADO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".OFICINA,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = "col$estadosolicitud".ID_ESTADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('"col$solicitud".ESTADO <> 6');
          ParamByName('ID_IDENTIFICACION').AsInteger := DBtipo.KeyValue;
          ParamByName('ID_PERSONA').AsString := JVnumero.Text;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitudes no Encontradas',mtInformation,[mbok],0);
            JVnumero.SetFocus;
            Exit;
          end;
          oficina := FieldByName('OFICINA').AsInteger;
          while not Eof do
          begin
            CDsolicitud.Append;
            CDsolicitud.FieldValues['id_estado'] := FieldByName('ID_ESTADO').AsInteger;
            CDsolicitud.FieldValues['radicado'] := FieldByName('ID_SOLICITUD').AsString;
            CDsolicitud.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO').AsString;
            if (FieldByName('ID_ESTADO').AsInteger <> 4) then //or (FieldByName('ID_ESTADO').AsInteger = 9) then
               CDsolicitud.FieldValues['valor_a'] := '-'
            else
            begin
            if FieldByName('VALOR_APROBADO').AsCurrency <> 0 then
               CDsolicitud.FieldValues['valor_a'] := '$'+FormatCurr('#,##0.00',FieldByName('VALOR_APROBADO').AsCurrency)
            else
              CDsolicitud.FieldValues['valor_a'] := '-';
            end;
            CDsolicitud.FieldValues['fecha'] := FieldByName('FECHA_RECEPCION').AsDateTime;
            CDsolicitud.FieldValues['cod_estado'] := FieldByName('ID_ESTADO').AsInteger;
            CDsolicitud.Post;
            Next;
          end;
          Close;
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := DBtipo.KeyValue;
          ParamByName('ID_PERSONA').AsString := JVnumero.Text;
          ExecQuery;
          JVnombres.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger := oficina;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
          ParamByName('ID_IDENTIFICACION').AsInteger := DBtipo.KeyValue;
          ParamByName('ID_PERSONA').AsString := JVnumero.Text;
          ExecQuery;
          Scuenta.Caption := '20'+IntToStr(oficina)+'-'+Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
          PageControl1.Enabled := False;
        end;
end;
procedure TFrmConsultaSol.BitBtn1Click(Sender: TObject);
begin
        JVnombres.Caption := '';
        Scuenta.Caption := '';
        DBtipo.KeyValue := -1;
        JVnumero.Text := '';
        PageControl1.ActivePageIndex := 0;
        fecha.Caption := '';
        Mradicado.Text := '';
        CDsolicitud.CancelUpdates;
        PageControl1.Enabled := True;
        JVcuenta.Text := '';
        DBtipocuenta.KeyValue := -1;
        DBtipo.SetFocus;
end;

procedure TFrmConsultaSol.BTbuscar1Click(Sender: TObject);
var     id_persona :string;
        id_identificacion, oficina :Integer;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"col$estadosolicitud".ID_ESTADO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".OFICINA,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION,');
          SQL.Add('"col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".ID_PERSONA');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = "col$estadosolicitud".ID_ESTADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := Mradicado.Text;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
            Mradicado.SetFocus;
            Exit;
          end;
            oficina := FieldByName('OFICINA').AsInteger;
            id_persona := FieldByName('ID_PERSONA').AsString;
            id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
            fecha.Caption := FormatDateTime('yyyy/MM/dd',FieldByName('FECHA_RECEPCION').AsDateTime);
            CDsolicitud.Append;
            CDsolicitud.FieldValues['id_estado'] := FieldByName('ID_ESTADO').AsInteger;
            CDsolicitud.FieldValues['radicado'] := FieldByName('ID_SOLICITUD').AsString;
            CDsolicitud.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO').AsString;
            if (FieldByName('ID_ESTADO').AsInteger <> 4) then
               CDsolicitud.FieldValues['valor_a'] := '-'
            else
            begin
            if FieldByName('VALOR_APROBADO').AsCurrency <> 0 then
               CDsolicitud.FieldValues['valor_a'] := '$'+FormatCurr('#,##0.00',FieldByName('VALOR_APROBADO').AsCurrency)
            else
              CDsolicitud.FieldValues['valor_a'] := '-';
            end;
            CDsolicitud.FieldValues['fecha'] := FieldByName('FECHA_RECEPCION').AsDateTime;
            CDsolicitud.FieldValues['cod_estado'] := FieldByName('ID_ESTADO').AsInteger;
            CDsolicitud.Post;
            Close;
            SQL.Clear;
            SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona"');
            SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
            ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
            ParamByName('ID_PERSONA').AsString := id_persona;
            ExecQuery;
            JVnombres.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
            ParamByName('ID_AGENCIA').AsInteger := oficina;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
            ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
            ParamByName('ID_PERSONA').AsString := id_persona;
            ExecQuery;
            Scuenta.Caption := '20'+IntToStr(oficina)+'-'+Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
            PageControl1.Enabled := False;
        end;

end;

procedure TFrmConsultaSol.DBGrid1CellClick(Column: TColumn);
var     id_estado,id_observacion :Smallint;
begin
            id_estado := 0;
            id_observacion := 0;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          if CDsolicitudcod_estado.Value = 7 then
          begin
            id_estado := 7;
            id_observacion := 6;
          end;
          if CDsolicitudcod_estado.Value = 9 then
          begin
            id_estado := 9;
            id_observacion := 15;
          end;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$observacion".OBSERVACION');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$observacion" ON ("col$solicitud".ID_SOLICITUD = "col$observacion".ID_SOLICITUD)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("col$observacion".ID_OBSERVACION = :ID_OBSERVACION) AND');
          SQL.Add('("col$solicitud".ESTADO = :ID_ESTADO)');
          ParamByName('ID_SOLICITUD').AsString := CDsolicitudradicado.Text;
          ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
          ParamByName('ID_ESTADO').AsInteger := id_estado;
          ExecQuery;
          if RecordCount <> 0 then
          begin
             FrmDescObsrevacion := TFrmDescObsrevacion.Create(Self);
             FrmDescObsrevacion.Caption := 'Concepto por el cual Fue Negada la Solicitud No. ' + CDsolicitudradicado.Text ;
             FrmDescObsrevacion.Mobservacion.Text := FieldByName('OBSERVACION').AsString;
             FrmDescObsrevacion.ShowModal;
          end;
        end;
end;

procedure TFrmConsultaSol.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
        with CDsolicitud do
        begin
          case FieldByName('id_estado').AsInteger of
           2,3,8 : DBGrid1.Canvas.Brush.Color := $00D2FCFF;
           7 : DBGrid1.Canvas.Brush.Color := $008080FF;
           4 : DBGrid1.Canvas.Brush.Color := $00FFAEAE;
           9 : DBGrid1.Canvas.Brush.Color := $00B7FFB7;
          end;
        end;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol,Column,State);


end;

procedure TFrmConsultaSol.BitBtn3Click(Sender: TObject);
var     id_persona :string;
        id_identificacion, oficina :Integer;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
        Transaction.StartTransaction;
        SQL.Clear;
        SQL.Add('SELECT DISTINCT');
        SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
        SQL.Add('"cap$maestrotitular".ID_PERSONA');
        SQL.Add('FROM');
        SQL.Add('"cap$maestrotitular"');
        SQL.Add('WHERE');
        SQL.Add('("cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA) AND');
        SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO)');
        ParamByName('NUMERO_CUENTA').AsString := JVcuenta.Text;
        ParamByName('ID_TIPO').AsInteger := DBtipocuenta.KeyValue;
        ExecQuery;
        id_persona := FieldByName('ID_PERSONA').AsString;
        id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"col$estadosolicitud".ID_ESTADO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".OFICINA,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = "col$estadosolicitud".ID_ESTADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('"col$solicitud".ESTADO <> 6');
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitudes no Encontradas',mtInformation,[mbok],0);
            JVCUENTA.SetFocus;
            Exit;
          end;
          oficina := FieldByName('OFICINA').AsInteger;
          while not Eof do
          begin
            CDsolicitud.Append;
            CDsolicitud.FieldValues['id_estado'] := FieldByName('ID_ESTADO').AsInteger;
            CDsolicitud.FieldValues['radicado'] := FieldByName('ID_SOLICITUD').AsString;
            CDsolicitud.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO').AsString;
            if (FieldByName('ID_ESTADO').AsInteger <> 4) then //or (FieldByName('ID_ESTADO').AsInteger = 9) then
               CDsolicitud.FieldValues['valor_a'] := '-'
            else
            begin
            if FieldByName('VALOR_APROBADO').AsCurrency <> 0 then
               CDsolicitud.FieldValues['valor_a'] := '$'+FormatCurr('#,##0.00',FieldByName('VALOR_APROBADO').AsCurrency)
            else
              CDsolicitud.FieldValues['valor_a'] := '-';
            end;
            CDsolicitud.FieldValues['fecha'] := FieldByName('FECHA_RECEPCION').AsDateTime;
            CDsolicitud.FieldValues['cod_estado'] := FieldByName('ID_ESTADO').AsInteger;
            CDsolicitud.Post;
            Next;
          end;
          Close;
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          JVnombres.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger := oficina;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          Scuenta.Caption := '20'+IntToStr(oficina)+'-'+Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
          PageControl1.Enabled := False;
        end;

end;

end.
