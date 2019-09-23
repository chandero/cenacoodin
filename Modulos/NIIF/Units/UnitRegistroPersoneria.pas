unit UnitRegistroPersoneria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBClient, Buttons, ExtCtrls,
  JvStaticText, IBSQL, DBCtrls;

type
  TFrmRegistroPersoneria = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    CDrepresentante: TClientDataSet;
    CDrepresentanteid_identificacion: TSmallintField;
    CDrepresentanteid_persona: TStringField;
    CDrepresentantenombre: TStringField;
    DSrepresentante: TDataSource;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Mpersoneria: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    JVnumero: TEdit;
    JVnombre: TEdit;
    IBSQL1: TIBSQL;
    CDrepresentanterepresentante: TBooleanField;
    DBCheckBox1: TDBCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MpersoneriaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
  vId_Persona :string;
  vId_Identificacion :Integer;
  es:Boolean;
    { Private declarations }
  public
  vId_Colocacion :string;
  vNit_Empresa :string;
  Texto_Per :string;
    { Public declarations }
  end;

var
  FrmRegistroPersoneria: TFrmRegistroPersoneria;

implementation

{$R *.dfm}

procedure TFrmRegistroPersoneria.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRegistroPersoneria.BitBtn1Click(Sender: TObject);
begin
        with CDrepresentante do
        begin
          Filtered := False;
          Filter := 'representante = 1';
          Filtered := True;
          if RecordCount = 0 then
          begin
             Filtered := False;
             Exit;
          end;
        end;
        CDrepresentante.Filtered := False;
        if MessageDlg('Esta Seguro de Registrar los Datos?',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        with IBSQL1 do
        begin
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           Close;
           SQL.Add('select * from "col$representantescol" where ID_COLOCACION = :ID_COLOCACION');
           ParamByName('ID_COLOCACION').AsString := vId_Colocacion;
           ExecQuery;
           if RecordCount > 0 then
           begin
             Close;
             SQL.Clear;
             SQL.Add('delete from "col$representantescol" where ID_COLOCACION = :ID_COLOCACION');
             ParamByName('ID_COLOCACION').AsString := vId_Colocacion;
             ExecQuery;
             Transaction.CommitRetaining;
           end;
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$personeriajur" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
           ParamByName('ID_PERSONA').AsString := vNit_Empresa;
           ParamByName('ID_IDENTIFICACION').AsInteger := 4;
           ExecQuery;
           if RecordCount > 0 then
           begin
             Close;
             SQL.Clear;
             SQL.Add('delete from "col$personeriajur" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
             ParamByName('ID_PERSONA').AsString := vNit_Empresa;
             ParamByName('ID_IDENTIFICACION').AsInteger := 4;
             ExecQuery;
             Transaction.CommitRetaining;
           end;
           Close;
           SQL.Clear;
           SQL.Add('insert into "col$personeriajur" values (');
           SQL.Add(':ID_PERSONA,:ID_IDENTIFICACION,:PERSONERIA)');
           ParamByName('ID_PERSONA').AsString := vNit_Empresa;
           ParamByName('ID_IDENTIFICACION').AsInteger := 4;
           ParamByName('PERSONERIA').AsString := Mpersoneria.Text;
           try
             ExecQuery;
           except
             on W: Exception do
             begin
                MessageDlg('Error al intentar Grabar los Datos con Mensaje: '+ #13 + W.Message,mtinformation,[mbok],0);
                Transaction.Rollback;
                Exit;
             end;
           end;
           Close;
           SQL.Clear;
           SQL.Add('insert into "col$representantescol" values (:ID_COLOCACION,:ID_PERSONA,:ID_IDENTIFICACION,0)');
           CDrepresentante.Filtered := False;
           CDrepresentante.Filter := 'representante = true';
           CDrepresentante.Filtered := True;
           while not CDrepresentante.Eof do
           begin
             ParamByName('ID_COLOCACION').AsString := vId_Colocacion;
             ParamByName('ID_PERSONA').AsString := CDrepresentanteid_persona.Value;
             ParamByName('ID_IDENTIFICACION').AsInteger := CDrepresentanteid_identificacion.Value;
             ExecQuery;
             CDrepresentante.Next;
           end;
           Transaction.Commit;
        end;
        MessageDlg('Registro Grabado con Exito',mtInformation,[mbok],0);
        Close;
end;

procedure TFrmRegistroPersoneria.MpersoneriaEnter(Sender: TObject);
begin
        Mpersoneria.SelStart := 20
end;

procedure TFrmRegistroPersoneria.FormShow(Sender: TObject);
begin
        Mpersoneria.Text := Texto_Per;
end;

procedure TFrmRegistroPersoneria.FormCreate(Sender: TObject);
begin
        es:=False;
end;

procedure TFrmRegistroPersoneria.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmRegistroPersoneria.DBGrid1ColExit(Sender: TObject);
begin
 if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then 
    DBCheckBox1.Visible := False

end;

procedure TFrmRegistroPersoneria.DBGrid1DblClick(Sender: TObject);
begin
          CDrepresentante.Edit;
          CDrepresentante.FieldValues['representante'] := not(CDrepresentanterepresentante.Value);
          CDrepresentante.Post;
end;

end.
