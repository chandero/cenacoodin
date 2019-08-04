unit UnitConyuge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
  DBClient, Grids, DBGrids, DBCtrls;

type
  TFrmConyuge = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdRadicado: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    IBQuery1: TIBQuery;
    Label2: TLabel;
    EdAsociado: TEdit;
    Panel3: TPanel;
    CdConyuge: TClientDataSet;
    DsConyuge: TDataSource;
    CdConyugeid_persona: TStringField;
    CdConyugeid_identificacion: TIntegerField;
    CdConyugeestado: TBooleanField;
    DBGrid1: TDBGrid;
    CdConyugenombre: TStringField;
    DBCheckBox1: TDBCheckBox;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdRadicadoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConyuge: TFrmConyuge;

implementation
uses
UnitGlobales;

{$R *.dfm}

procedure TFrmConyuge.BitBtn1Click(Sender: TObject);
var     vId_persona :string;
        vId_Identificacion :Integer;
begin
        CdConyuge.Filtered := False;
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('ID_PERSONA,ID_IDENTIFICACION,FECHA_RECEPCION');
          SQL.Add('FROM');
          SQL.Add(' "col$solicitud"');
          SQL.Add('WHERE');
          SQL.Add('  ("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := EdRadicado.Text;
          Open;
          vId_Identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          vId_persona := FieldByName('ID_PERSONA').AsString;
          if FieldByName('FECHA_RECEPCION').AsDateTime <> fFechaActual then
          begin
            MessageDlg('Las Solicitudes solo pueden ser Actaulizadas el mismo dia',mtInformation,[mbok],0);
            EdRadicado.SetFocus;
            Exit;
          end;
          SQL.Clear;
          SQL.Add('SELECT *');
          SQL.Add('FROM');
          SQL.Add('"col$infconyuge"');
          SQL.Add('WHERE');
          SQL.Add('("col$infconyuge".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := EdRadicado.Text;
          Open;
          if RecordCount > 0 then
          begin
            MessageDlg('Ya se Encuentra un Codeudor Solidario Registrado...',mtInformation,[mbok],0);
            EdRadicado.SetFocus;
            Exit;
          end;
          SQL.Clear;
          SQL.Add('SELECT NOMBRE,PRIMER_APELLIDO FROM "gen$persona" WHERE ID_PERSONA = :ID_PERSONA AND ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := vId_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := vId_Identificacion;
          Open;
          EdAsociado.Text := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT *');
          SQL.Add('FROM');
          SQL.Add('"col$codeudor"');
          SQL.Add('WHERE');
          SQL.Add('("col$codeudor".ID_SOLICITUD = :ID_SOLICITUD) AND ');
          SQL.Add('("col$codeudor".ES_CONYUGUE IN (1,-1))');
          ParamByName('ID_SOLICITUD').AsString := EdRadicado.Text;
          Open;
          if RecordCount > 0 then
          begin
            MessageDlg('Ya se Encuentra un Conyuge...',mtInformation,[mbok],0);
            Exit;
            EdRadicado.SetFocus;
          end;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"col$codeudor".ID_PERSONA,');
          SQL.Add('"col$codeudor".ID_IDENTIFICACION');
          SQL.Add('FROM');
          SQL.Add('"col$codeudor"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$codeudor".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('AND ("col$codeudor".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$codeudor".ID_SOLICITUD = :ID_SOLICITUD) AND ');
          SQL.Add('("col$codeudor".ES_CONYUGUE = 0)');
          ParamByName('ID_SOLICITUD').AsString := EdRadicado.Text;
          Open;
          if RecordCount = 0 then
             MessageDlg('No Posee Codeudores Registrados...',mtInformation,[mbok],0)
          else
          begin
            while not Eof do
            begin
              CdConyuge.Append;
              CdConyuge.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
              CdConyuge.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsString;
              CdConyuge.FieldValues['estado'] := False;
              CdConyuge.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString;
              CdConyuge.Post;
              Next;
            end;
          end;


        end;


end;

procedure TFrmConyuge.DBGrid1ColExit(Sender: TObject);
begin
 if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False

end;

procedure TFrmConyuge.DBGrid1DrawColumnCell(Sender: TObject;
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
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
     DBCheckBox1.Left := Rect.Left + DBGrid1.Left + 2;
     DBCheckBox1.Top := Rect.Top + DBGrid1.top + 2;
     DBCheckBox1.Width := Rect.Right - Rect.Left;
     DBCheckBox1.Height := Rect.Bottom - Rect.Top;
     DBCheckBox1.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
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

procedure TFrmConyuge.DBGrid1DblClick(Sender: TObject);
var       id_persona :String;
begin
          id_persona := CdConyuge.FieldByName('id_persona').AsString;
          CdConyuge.Edit;
          CdConyuge.FieldValues['estado'] := True;
          cdconyuge.Post;
          with CdConyuge do
          begin
            First;
            Filtered := False;
            Filter := 'id_persona <> ' + id_persona;
            Filtered := True;
            while not Eof do
            begin
              Edit;
              CdConyuge.FieldValues['estado'] := False;
              Next;
            end;
            Filtered := False;
            //First;
          end;
end;

procedure TFrmConyuge.EdRadicadoKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
           BitBtn1.Click;
end;

procedure TFrmConyuge.BitBtn4Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmConyuge.BitBtn3Click(Sender: TObject);
begin
        CdConyuge.CancelUpdates;
        EdAsociado.Text := '';
        EdRadicado.Text := '';
        EdRadicado.SetFocus;
end;

procedure TFrmConyuge.BitBtn2Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
          CdConyuge.Filtered := False;
          CdConyuge.Filter := 'estado = true';
          CdConyuge.Filtered := True;
          if RecordCount = 0 then
          begin
             MessageDlg('Debe Seleccionar un Codeudor',mtInformation,[mbok],0);
             Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('insert into "col$infconyuge" values (:ID_SOLICITUD,:ID_PERSONA,:ID_IDENTIFICACION)');
          ParamByName('ID_SOLICITUD').AsString := EdRadicado.Text;
          ParamByName('ID_PERSONA').AsString := CdConyuge.FieldByName('id_persona').AsString;
          ParamByName('ID_IDENTIFICACION').AsInteger := CdConyuge.FieldByName('id_identificacion').AsInteger;
          ExecSQL;
          Transaction.Commit;
          MessageDlg('Registro Actualizado con Exito...',mtInformation,[mbok],0);
          BitBtn3.Click;
        end;
end;

end.
