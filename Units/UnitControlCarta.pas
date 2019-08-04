unit UnitControlCarta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DB,
  DBClient, DBCtrls, FR_DSet, FR_DBSet, FR_Class;

type
  TFrmControlCarta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Fecha1: TDateTimePicker;
    Fecha2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel4: TPanel;
    BitBtn6: TBitBtn;
    DSnoentregadas: TDataSource;
    CDcartas: TClientDataSet;
    CDcartascolocacion: TStringField;
    CDcartasasociado: TStringField;
    CDcartasid_persona: TStringField;
    CDcartasid_identificacion: TIntegerField;
    CDcartasentregado: TBooleanField;
    CDcartasfecha: TDateField;
    CDcartastipo: TStringField;
    DBtipo: TDBCheckBox;
    CDreporte: TClientDataSet;
    CDreporteid_colocacion: TStringField;
    CDreporteasociado: TStringField;
    CDreportefecha: TDateField;
    CDreporteempleado: TStringField;
    CDreportetipo: TStringField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frCompositeReport1: TfrCompositeReport;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBtipoClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
    tipo: string;
    procedure llena_reporte(tipo_c :Integer);
  public
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  FrmControlCarta: TFrmControlCarta;

implementation

uses UnitDmSolicitud, UnitImpresion, unitMain, UnitGlobales;

{$R *.dfm}

procedure TFrmControlCarta.BitBtn6Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmControlCarta.FormCreate(Sender: TObject);
begin
        Fecha1.Date := Date;
        Fecha2.Date := Date;
        DmSolicitud := TDmSolicitud.Create(Self);
        DBtipo.DataSource := DSnoentregadas;
        DBtipo.DataField  := 'entregado';
        DBtipo.Visible    := False;
        DBtipo.Color      := DBGrid1.Color;
        DBtipo.Caption    := '';

end;

procedure TFrmControlCarta.BitBtn3Click(Sender: TObject);
begin
        CDcartas.CancelUpdates;
        CDcartas.Filtered := False;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
        end;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$controlcarta".ID_COLOCACION,');
          SQL.Add('"col$controlcarta".FECHA_REALIZACION,');
          SQL.Add('"col$controlcarta".ID_PERSONA,');
          SQL.Add('"col$controlcarta".ID_IDENTIFICACION,');
          SQL.Add('"col$controlcarta".TIPO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
          SQL.Add('FROM');
          SQL.Add('"col$controlcarta"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$controlcarta".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$controlcarta".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$controlcarta".FECHA_REALIZACION BETWEEN :FECHA1 AND :FECHA2) AND');
          SQL.Add('("col$controlcarta".ENTREGADO = 0)');
          ParamByName('FECHA1').AsDate := Fecha1.DateTime;
          ParamByName('FECHA2').AsDate := Fecha2.DateTime;
          ExecQuery;
          while not Eof do
          begin
            CDcartas.Append;
            CDcartas.FieldValues['colocacion'] := FieldByName('ID_COLOCACION').AsString;
            CDcartas.FieldValues['asociado'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            CDcartas.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
            CDcartas.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
            CDcartas.FieldValues['entregado'] := False;
            CDcartas.FieldValues['fecha'] := FieldByName('FECHA_REALIZACION').AsDate;
            if FieldByName('TIPO').AsString = 'D' then
               CDcartas.FieldValues['tipo'] := 'Deudor'
            else
               CDcartas.FieldValues['tipo'] := 'Codeudor';
               CDcartas.Post;
            Next;
          end;
        end;
end;

procedure TFrmControlCarta.BitBtn5Click(Sender: TObject);
begin
        DBtipo.Visible := False;
        CDcartas.CancelUpdates
end;

procedure TFrmControlCarta.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBtipo.DataField) then
    begin
     DBtipo.Left := Rect.Left + DBGrid1.Left + 4;
     DBtipo.Top := Rect.Top + DBGrid1.top + 2;
     DBtipo.Width := 15;//Rect.Right - Rect.Left;
     DBtipo.Height := 17;//Rect.Bottom - Rect.Top;
     DBtipo.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBtipo.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      DBGrid1.Canvas.FillRect(Rect);
      DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFrmControlCarta.DBGrid1ColExit(Sender: TObject);
begin
        if DBGrid1.SelectedField.FieldName = DBtipo.DataField then
            DBtipo.Visible := False
end;

procedure TFrmControlCarta.DBtipoClick(Sender: TObject);
begin
{ if dbtipo.Checked then
     DBCheckBox1.Caption := DBCheckBox1.ValueChecked
  else
     DBCheckBox1.Caption := DBCheckBox1.ValueUnChecked;}

end;

procedure TFrmControlCarta.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if (key = Chr(9)) then Exit;

  if (DBGrid1.SelectedField.FieldName = DBtipo.DataField) then
  begin
    DBtipo.SetFocus;
    SendMessage(DBtipo.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure TFrmControlCarta.BitBtn4Click(Sender: TObject);
begin
        DBtipo.Visible := False;
        if MessageDlg('Esta Seguro de Realizar la Transacción?',mtInformation,[mbyes,mbno],0) = mryes then
        begin
          with DmSolicitud.IBSolicitud1 do
          begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
          end;
          with CDcartas do
          begin
            Filtered := False;
            Filter := 'entregado = True';
            Filtered := True;
            while not Eof do
            begin
              with DmSolicitud.IBSolicitud1 do
              begin
                Close;
                SQL.Clear;
                SQL.Add('update "col$controlcarta" set ENTREGADO = 1');
                SQL.Add('where ID_COLOCACION = :ID_COLOCACION');
                SQL.Add('and ID_PERSONA = :ID_PERSONA');
                ParamByName('ID_PERSONA').AsString := CDcartas.FieldByName('id_persona').AsString;
                ParamByName('ID_COLOCACION').AsString := CDcartas.FieldByName('colocacion').AsString;
                ExecSQL;
                Close;
              end;
            Next;
            end;
          end;
          CDcartas.CancelUpdates;
          DmSolicitud.IBSolicitud1.Transaction.Commit;
        end;
end;

procedure TFrmControlCarta.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frCompositeReport1.DoublePass := True;
        frCompositeReport1.Reports.Clear;
        frCompositeReport1.Reports.Add(frReport1);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmControlCarta.BitBtn1Click(Sender: TObject);
begin
        tipo := 'No Entregadas';
        CDreporte.CancelUpdates;
        llena_reporte(0);
        imprimir_reporte(frmMain.ruta1 + '\reporte\RepControlCarta.frf');
end;

procedure TFrmControlCarta.BitBtn2Click(Sender: TObject);
begin
        tipo := 'Entregadas';
        CDreporte.CancelUpdates;
        llena_reporte(1);
        imprimir_reporte(frmMain.ruta1 + '\reporte\RepControlCarta.frf');

end;

procedure TFrmControlCarta.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        Empleado;
        if ParName = 'empleado' then
          ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'fecha' then
          ParValue := 'Desde ' + FormatDateTime('yyyy/mm/dd',Fecha1.DateTime) + ' Hasta ' + FormatDateTime('yyyy/mm/dd',Fecha2.DateTime);
        if ParName = 'tipo' then
          ParValue := tipo;
end;
procedure TFrmControlCarta.llena_reporte(tipo_c :Integer);
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
        end;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$controlcarta".ID_COLOCACION,');
          SQL.Add('"col$controlcarta".FECHA_REALIZACION,');
          SQL.Add('"col$controlcarta".ID_PERSONA,');
          SQL.Add('"col$controlcarta".ID_IDENTIFICACION,');
          SQL.Add('"col$controlcarta".TIPO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$empleado".NOMBRE as NOMBRE_EMP,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO as APELLIDO');
          SQL.Add('FROM');
          SQL.Add('"col$controlcarta"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$controlcarta".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$controlcarta".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$controlcarta".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$controlcarta".FECHA_REALIZACION BETWEEN :FECHA1 AND :FECHA2) AND');
          SQL.Add('("col$controlcarta".ENTREGADO = :TIPO)');
          ParamByName('FECHA1').AsDate := Fecha1.DateTime;
          ParamByName('FECHA2').AsDate := Fecha2.DateTime;
          ParamByName('TIPO').AsInteger := tipo_c;
          ExecQuery;
          while not Eof do
          begin
            CDreporte.Append;
            CDreporte.FieldValues['id_colocacion'] := FieldByName('ID_COLOCACION').AsString;
            CDreporte.FieldValues['asociado'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            CDreporte.FieldValues['fecha'] := FieldByName('FECHA_REALIZACION').AsDate;
            CDreporte.FieldValues['empleado'] := FieldByName('NOMBRE_EMP').AsString + ' ' + FieldByName('APELLIDO').AsString;
            if FieldByName('TIPO').AsString = 'D' then
               CDreporte.FieldValues['tipo'] := 'Deudor'
            else
               CDreporte.FieldValues['tipo'] := 'Codeudor';
               CDreporte.Post;
            Next;
          end;
        end;
end;

end.
