unit UnitAdicionarGarReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, Buttons, ExtCtrls, ComCtrls, DB,
  IBCustomDataSet, IBQuery, DBGrids, DBCtrls, DBClient, IBSQL, JvLabel,
  JvBlinkingLabel;

type
  TMiDBGrid = class(TDBGrid);

type
  TfrmAdicionarGarReal = class(TForm)
    DSReal: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    EdNumeroColocacion: TMaskEdit;
    Panel3: TPanel;
    BtnAceptar: TBitBtn;
    BtnCerrar: TBitBtn;
    IBDSReal: TIBDataSet;
    IBDSRealID_AGENCIA: TSmallintField;
    IBDSRealID_COLOCACION: TIBStringField;
    IBDSRealNUMERO_ESCRITURA: TIBStringField;
    IBDSRealFECHA_ESCRITURA: TDateField;
    IBDSRealNOMBRE_NOTARIA: TIBStringField;
    IBDSRealCIUDAD_ESCRITURA: TIBStringField;
    IBDSRealMATRICULA_INMOBILIARIA: TIBStringField;
    IBDSRealFECHA_REGISTRO: TDateField;
    IBDSRealAVALUO: TIBBCDField;
    IBDSRealFECHA_AVALUO: TDateField;
    IBDSRealCUENTAS_DE_ORDEN: TIBBCDField;
    IBDSRealPOLIZA_INCENDIO: TIBStringField;
    IBDSRealVALOR_ASEGURADO: TIBBCDField;
    IBDSRealFECHA_INICIAL_POLIZA: TDateField;
    IBDSRealFECHA_FINAL_POLIZA: TDateField;
    IBDSRealCODIGO_ASEGURADORA: TIBStringField;
    IBDSRealES_DEUDA: TSmallintField;
    DBCheckBox1: TDBCheckBox;
    IBSQL1: TIBSQL;
    DBGrid1: TDBGrid;
    CDGarReal: TClientDataSet;
    CDGarRealID_AGENCIA: TIntegerField;
    CDGarRealID_COLOCACION: TStringField;
    CDGarRealNUMERO_ESCRITURA: TStringField;
    CDGarRealFECHA_ESCRITURA: TDateField;
    CDGarRealNOMBRE_NOTARIA: TStringField;
    CDGarRealCIUDAD_ESCRITURA: TStringField;
    CDGarRealMATRICULA_INMOBILIARIA: TStringField;
    CDGarRealFECHA_REGISTRO: TDateField;
    CDGarRealAVALUO: TCurrencyField;
    CDGarRealFECHA_AVALUO: TDateField;
    CDGarRealCUENTAS_DE_ORDEN: TCurrencyField;
    CDGarRealPOLIZA_INCENDIO: TStringField;
    CDGarRealVALOR_ASEGURADO: TCurrencyField;
    CDGarRealFECHA_INICIAL_POLIZA: TDateField;
    CDGarRealFECHA_FINAL_POLIZA: TDateField;
    CDGarRealCODIGO_ASEGURADORA: TStringField;
    CDGarRealES_DEUDA: TBooleanField;
    IBSQL2: TIBSQL;
    Label2: TLabel;
    EdEstado: TJvBlinkingLabel;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure BtnCerrarClick(Sender: TObject);
    procedure DBGridRealEditButtonClick(Sender: TObject);
    procedure DBGridRealDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridRealColExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridRealDblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdicionarGarReal: TfrmAdicionarGarReal;
  vcolocacion : string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, Unitcalendario;

procedure TfrmAdicionarGarReal.EdNumeroColocacionExit(Sender: TObject);
begin
{        vcolocacion := trim(EdNumeroColocacion.Text);
        IBDSReal.ParamByName('ID_AGENCIA').AsInteger := agencia;
        IBDSReal.ParamByName('ID_COLOCACION').AsString := vcolocacion;
        IBDSReal.Open;
        IBDSReal.Last;
        IBDSReal.First;
        if IBDSReal.RecordCount > 0 then
           BtnAceptar.Enabled := True
        else
         begin
           if not MessageDlg('No Exiten Registros para esta Colocación, Desea Agregarlos?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
             EdNumeroColocacion.Text := '';
             EdNumeroColocacion.SetFocus;
             IBDSReal.Close;
           end;
         end;                }

        vcolocacion := Trim(EdNumeroColocacion.Text);
        with IBSQL1 do Begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select "col$estado".DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
          SQL.Add('inner join "col$colocacion" on ("col$estado".ID_ESTADO_COLOCACION = "col$colocacion".ID_ESTADO_COLOCACION)');
          SQL.Add('where "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := vcolocacion;
          ExecQuery;
          EdEstado.Caption := Trim(FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString);
          Close;

          SQL.Clear;
          SQL.Add('select * from "col$colgarantiasreal" where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := vcolocacion;
          ExecQuery;
          if RecordCount = 0 then
           MessageDlg('No Existen Garantias Reales para esta Colocacion',mtInformation,[mbok],0)
          else
           BtnAceptar.Enabled := True;
           while not Eof do begin
            CDGarReal.Append;
            CDGarReal.FieldValues['ID_AGENCIA'] := FieldByName('ID_AGENCIA').AsInteger;
            CDGarReal.FieldValues['ID_COLOCACION'] := FieldByName('ID_COLOCACION').AsString;
            CDGarReal.FieldValues['NUMERO_ESCRITURA'] := FieldByName('NUMERO_ESCRITURA').AsString;
            CDGarReal.FieldValues['FECHA_ESCRITURA'] := FieldByName('FECHA_ESCRITURA').AsDate;
            CDGarReal.FieldValues['NOMBRE_NOTARIA'] := FieldByName('NOMBRE_NOTARIA').AsString;
            CDGarReal.FieldValues['CIUDAD_ESCRITURA'] := FieldByName('CIUDAD_ESCRITURA').AsString;
            CDGarReal.FieldValues['MATRICULA_INMOBILIARIA'] := FieldByName('MATRICULA_INMOBILIARIA').AsString;
            CDGarReal.FieldValues['FECHA_REGISTRO'] := FieldByName('FECHA_REGISTRO').AsDate;
            CDGarReal.FieldValues['AVALUO'] := FieldByName('AVALUO').AsCurrency;
            CDGarReal.FieldValues['FECHA_AVALUO'] := FieldByName('FECHA_AVALUO').AsDate;
            CDGarReal.FieldValues['CUENTAS_DE_ORDEN'] := FieldByName('CUENTAS_DE_ORDEN').AsCurrency;
            CDGarReal.FieldValues['POLIZA_INCENDIO'] := FieldByName('POLIZA_INCENDIO').AsString;
            CDGarReal.FieldValues['VALOR_ASEGURADO'] := FieldByName('VALOR_ASEGURADO').AsCurrency;
            CDGarReal.FieldValues['FECHA_INICIAL_POLIZA'] := FieldByName('FECHA_INICIAL_POLIZA').AsDate;
            CDGarReal.FieldValues['FECHA_FINAL_POLIZA'] := FieldByName('FECHA_FINAL_POLIZA').AsDate;
            CDGarReal.FieldValues['CODIGO_ASEGURADORA'] := FieldByName('CODIGO_ASEGURADORA').AsString;
            CDGarReal.FieldValues['ES_DEUDA'] := FieldByName('ES_DEUDA').AsInteger;
            CDGarReal.Post;
            Next;
           end;
          Close;
        end;
        EdNumeroColocacion.Enabled := False;

end;


procedure TfrmAdicionarGarReal.EdNumeroColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmAdicionarGarReal.FormShow(Sender: TObject);
begin
        if IBDSReal.Transaction.InTransaction then
           IBDSReal.Transaction.Rollback;
        IBDSReal.Transaction.StartTransaction;
        EdNumeroColocacion.Enabled := True;
        EdNumeroColocacion.SetFocus;
end;

procedure TfrmAdicionarGarReal.BtnAceptarClick(Sender: TObject);
begin
//        IBDSReal.DataBase.ApplyUpdates([IBDSReal]);
//        IBDSReal.Close;
//        EdNumeroColocacion.Text := '';
        BtnAceptar.Enabled := False;
        if MessageDlg('Esta Seguro de Realizar los Cambios?',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        with IBSQL2 do begin
          Close;
          SQL.Clear;
          SQL.Add('delete from "col$colgarantiasreal" where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := vcolocacion;
          ExecQuery;
          Close;

          SQL.Clear;
          SQL.Add('insert into "col$colgarantiasreal" VALUES(');
          SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:NUMERO_ESCRITURA,');
          SQL.Add(':FECHA_ESCRITURA,:NOMBRE_NOTARIA,:CIUDAD_ESCRITURA,');
          SQL.Add(':MATRICULA_INMOBILIARIA,:FECHA_REGISTRO,:AVALUO,:FECHA_AVALUO,');
          SQL.Add(':CUENTAS_DE_ORDEN,:POLIZA_INCENDIO,:VALOR_ASEGURADO,:FECHA_INICIAL_POLIZA,');
          SQL.Add(':FECHA_FINAL_POLIZA,:CODIGO_ASEGURADORA,:ES_DEUDA)');
          while not CDGarReal.Eof do begin
            ParamByName('ID_AGENCIA').AsInteger := CDGarRealID_AGENCIA.Value;
            ParamByName('ID_COLOCACION').AsString :=CDGarRealID_COLOCACION.Value;
            ParamByName('NUMERO_ESCRITURA').AsString := CDGarRealNUMERO_ESCRITURA.Value;
            ParamByName('FECHA_ESCRITURA').AsDate := CDGarRealFECHA_ESCRITURA.Value;
            ParamByName('NOMBRE_NOTARIA').AsString := CDGarRealNOMBRE_NOTARIA.Value;
            ParamByName('CIUDAD_ESCRITURA').AsString := CDGarRealCIUDAD_ESCRITURA.Value;
            ParamByName('MATRICULA_INMOBILIARIA').AsString := CDGarRealMATRICULA_INMOBILIARIA.Value;
            ParamByName('FECHA_REGISTRO').AsDate := CDGarRealFECHA_REGISTRO.Value;
            ParamByName('AVALUO').AsCurrency := CDGarRealAVALUO.Value;
            ParamByName('FECHA_AVALUO').AsDate := CDGarRealFECHA_AVALUO.Value;
            ParamByName('CUENTAS_DE_ORDEN').AsCurrency := CDGarRealCUENTAS_DE_ORDEN.Value;
            ParamByName('POLIZA_INCENDIO').AsString := CDGARREALPOLIZA_INCENDIO.Value;
            ParamByName('VALOR_ASEGURADO').AsCurrency := CDGarRealVALOR_ASEGURADO.Value;
            ParamByName('FECHA_INICIAL_POLIZA').AsDate := CDGarRealFECHA_INICIAL_POLIZA.Value;
            ParamByName('FECHA_FINAL_POLIZA').AsDate := CDGarRealFECHA_FINAL_POLIZA.Value;
            ParamByName('CODIGO_ASEGURADORA').AsString := CDGarRealCODIGO_ASEGURADORA.Value;
            ParamByName('ES_DEUDA').AsBoolean := CDGarRealES_DEUDA.Value;
            ExecQuery;
            CDGarReal.Next;
          end;
           Transaction.Commit;
        end;
        MessageDlg('Registro Grabado con Exito',mtInformation,[mbok],0);
end;

procedure TfrmAdicionarGarReal.BtnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAdicionarGarReal.DBGridRealEditButtonClick(Sender: TObject);
var frmCalendario:TfrmCalendario;
    Columna,Fila :Integer;
    Celda:TRect;
begin
        frmCalendario := TfrmCalendario.Create(self);
        Columna := TMiDBGrid(DBGrid1).Col;
        Fila := TMiDBGrid(DBGrid1).Row;
        Celda := TMiDBGrid(DBGrid1).CellRect(Columna,Fila);
        frmCalendario.Left := Self.Left + Celda.Left + 5;
        frmCalendario.Top := Self.Top + Celda.Top + TMiDBGrid(DBGrid1).RowHeights[Fila] * 3;
        frmCalendario.ShowModal;
        begin
//           IBDSReal.Edit;
//           DBGridReal.SelectedField.Value := frmCalendario.Fecha;
           frmCalendario.Free;
        end;
end;

procedure TfrmAdicionarGarReal.DBGridRealDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
{  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
     DBCheckBox1.Left := Rect.Left + DBGridReal.Left + 2;
     DBCheckBox1.Top := Rect.Top + DBGridREal.top + 2;
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

      DBGridReal.Canvas.FillRect(Rect);
      DrawFrameControl(DBGridReal.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;     }

end;


procedure TfrmAdicionarGarReal.DBGridRealColExit(Sender: TObject);
begin
if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False;
end;

procedure TfrmAdicionarGarReal.FormCreate(Sender: TObject);
begin
        DBCheckBox1.DataSource := DSReal;
        DBCheckBox1.DataField  := 'ES_DEUDA';
        DBCheckBox1.Visible    := False;
        DBCheckBox1.Color      := DBGrid1.Color;
        DBCheckBox1.Caption    := '';
        DBCheckBox1.ValueChecked := ' ';
        DBCheckBox1.ValueUnChecked := ' ';
end;

procedure TfrmAdicionarGarReal.DBGridRealDblClick(Sender: TObject);
begin
          CDGarReal.Edit;
          CDGarReal.FieldValues['ES_DEUDA'] := not(CDGarRealES_DEUDA.Value);
          cdgarreal.Post;
end;

procedure TfrmAdicionarGarReal.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmAdicionarGarReal.DBGrid1ColExit(Sender: TObject);
begin
 if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False
end;

procedure TfrmAdicionarGarReal.DBGrid1DblClick(Sender: TObject);
begin
          CDGarReal.Edit;
          CDGarReal.FieldValues['ES_DEUDA'] := not(CDGarRealES_DEUDA.Value);
          cdgarreal.Post;
end;

procedure TfrmAdicionarGarReal.DBGrid1EditButtonClick(Sender: TObject);
var frmCalendario:TfrmCalendario;
    Columna,Fila :Integer;
    Celda:TRect;
begin
        frmCalendario := TfrmCalendario.Create(self);
        Columna := TMiDBGrid(DBGrid1).Col;
        Fila := TMiDBGrid(DBGrid1).Row;
        Celda := TMiDBGrid(DBGrid1).CellRect(Columna,Fila);
        frmCalendario.Left := Self.Left + Celda.Left + 5;
        frmCalendario.Top := Self.Top + Celda.Top + TMiDBGrid(DBGrid1).RowHeights[Fila] * 3;
        frmCalendario.ShowModal;
        begin
//           IBDSReal.Edit;
           DBGrid1.SelectedField.Value := frmCalendario.Fecha;
           frmCalendario.Free;
        end;
end;

end.
