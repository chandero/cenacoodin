unit UnitNotificacionSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, DBClient, Menus,
  DBCtrls, IBCustomDataSet, IBQuery, FR_Class, FR_DSet, FR_DBSet, UnitDmGeneral;

  
type
  TFrmNotificacionSolicitud = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CDsolicitud: TClientDataSet;
    DSsolciitud: TDataSource;
    CDsolicitudid_solicitud: TStringField;
    CDsolicitudnombre: TStringField;
    CDsolicitudnotificar: TBooleanField;
    PopupMenu1: TPopupMenu;
    SelecionarTodo1: TMenuItem;
    DBCheckBox1: TDBCheckBox;
    InvertirSeleccion1: TMenuItem;
    IBQuery1: TIBQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    GroupBox1: TGroupBox;
    Ranalista: TCheckBox;
    DataSource1: TDataSource;
    DBempleado: TDBLookupComboBox;
    Label1: TLabel;
    IBQuery2: TIBQuery;
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SelecionarTodo1Click(Sender: TObject);
    procedure InvertirSeleccion1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure RanalistaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  FrmNotificacionSolicitud: TFrmNotificacionSolicitud;
  dmGeneral : TdmGeneral;

implementation
uses UnitGlobales, UnitImpresion, unitMain;

{$R *.dfm}

procedure TFrmNotificacionSolicitud.DBGrid1ColExit(Sender: TObject);
begin
 if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False

end;

procedure TFrmNotificacionSolicitud.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmNotificacionSolicitud.DBGrid1DblClick(Sender: TObject);
begin
          CDsolicitud.Edit;
          CDsolicitud.FieldValues['notificar'] := not(CDsolicitudnotificar.Value);
          CDsolicitud.Post;
end;

procedure TFrmNotificacionSolicitud.SelecionarTodo1Click(Sender: TObject);
begin
        with CDsolicitud do
        begin
           First;
           while not Eof do
           begin
             Edit;
             CDsolicitud.FieldValues['notificar'] := True;
             Post;
             Next;
           end;
        end;
        SelecionarTodo1.Visible := False;
        InvertirSeleccion1.Visible := True;

end;

procedure TFrmNotificacionSolicitud.InvertirSeleccion1Click(
  Sender: TObject);
begin
        with CDsolicitud do
        begin
           First;
           while not Eof do
           begin
             Edit;
             CDsolicitud.FieldValues['notificar'] := False;
             Post;
             Next;
           end;
        end;
        SelecionarTodo1.Visible := True;
        InvertirSeleccion1.Visible := False;

end;

procedure TFrmNotificacionSolicitud.BitBtn1Click(Sender: TObject);
begin
      if MessageDlg('Esta Seguro de Realizar la Transaccion',mtInformation,[mbyes,mbno],0) = mrno then
         Exit;
      if Ranalista.Checked then
      begin
        if IBQuery1.Transaction.InTransaction then
           IBQuery1.Transaction.Rollback;
        IBQuery1.Transaction.StartTransaction;
        with CDsolicitud do
        begin
          Filtered := False;
          Filter := 'notificar = true';
          Filtered := True;
          if RecordCount = 0 then
          begin
             Filtered := False;
             Exit;
          end;
          while not Eof do
          begin
            IBQuery1.Close;
            IBQuery1.SQL.Clear;
            IBQuery1.SQL.Add('update "col$solicitudempleado" set NOTIFICADO = 1');
            IBQuery1.SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and ID_EMPLEADO = :ID_EMPLEADO');
            IBQuery1.ParamByName('ID_EMPLEADO').AsString := DBAlias;
            IBQuery1.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
            IBQuery1.ExecSQL;
            Next;
          end;
          IBQuery1.Transaction.Commit;
          Filtered := False;
        end;
      end
      else
      begin
        if IBQuery1.Transaction.InTransaction then
           IBQuery1.Transaction.Rollback;
        IBQuery1.Transaction.StartTransaction;
        with CDsolicitud do
        begin
          Filtered := False;
          Filter := 'notificar = true';
          Filtered := True;
          if RecordCount = 0 then
          begin
             Filtered := False;
             Exit;
          end;
          while not Eof do
          begin
            IBQuery1.Close;
            IBQuery1.SQL.Clear;
            IBQuery1.SQL.Add('delete from "col$solicitudempleado"');
            IBQuery1.SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
            IBQuery1.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
            IBQuery1.ExecSQL;
            IBQuery1.Close;
            IBQuery1.SQL.Clear;
            IBQuery1.SQL.Add('insert into "col$solicitudempleado" values (');
            IBQuery1.SQL.Add(':ID_SOLICITUD,:ID_EMPLEADO,:FECHAHORA,0,0)');
            IBQuery1.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
//            if DBAlias = 'MDHOZ' then
               IBQuery1.ParamByName('ID_EMPLEADO').AsString := DBempleado.KeyValue;
//            else
//               IBQuery1.ParamByName('ID_EMPLEADO').AsString := 'MDHOZ';
            IBQuery1.ParamByName('FECHAHORA').AsDateTime := fFechaActual + time;
            IBQuery1.ExecSQL;
            Next;
          end;
          IBQuery1.Transaction.Commit;
          Filtered := False;
        end;
      end;
        DBGrid1.Enabled := False;
        BitBtn3.Enabled := True;
        BitBtn3.Click;
        BitBtn1.Enabled := False;

end;

procedure TFrmNotificacionSolicitud.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmNotificacionSolicitud.BitBtn3Click(Sender: TObject);
begin
        with CDsolicitud do
        begin
          Filtered := False;
          Filter := 'notificar = true';
          Filtered := True;
          Empleado;
          imprimir_reporte(frmMain.ruta1 + '\reporte\RepSolicitudEmp.frf');
          Filtered := False;
        end;
end;

procedure TFrmNotificacionSolicitud.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmNotificacionSolicitud.frReport1GetValue(
  const ParName: String; var ParValue: Variant);
begin
        if ParName = 'empleado' then
           ParValue := Nombres + ' ' + Apellidos;
end;

procedure TFrmNotificacionSolicitud.RanalistaClick(Sender: TObject);
begin
        if Ranalista.Checked then
           DBempleado.Enabled := False
        else
        begin
        if DBAlias = 'MDHOZ' then
           DBempleado.Enabled := True
        else
           DBempleado.Enabled := False;
        with IBQuery2 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          Open;
          Last;
        end;

        end;
end;

procedure TFrmNotificacionSolicitud.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
end;

end.
