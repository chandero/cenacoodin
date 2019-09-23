unit UnitControldeObservaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, DBCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, IBSQL, IBDatabase, JvComponent, JvMagnet, UnitRegistrarObservacion;

type
  TfrmControldeObservaciones = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGDatos: TDBGrid;
    DBLCBPlantillas: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    DBLCBTipoIdentificacion: TDBLookupComboBox;
    EdNumeroIdentificacion: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdNombre: TStaticText;
    cmdBuscar: TBitBtn;
    RBVerde: TRadioButton;
    RBAmarilla: TRadioButton;
    RBRoja: TRadioButton;
    cmdCerrar: TBitBtn;
    DSTipoIdentificacion: TDataSource;
    IBQTipoIdentificacion: TIBQuery;
    Panel5: TPanel;
    Memo: TMemo;
    cmdAgregar: TBitBtn;
    cmdAceptar: TBitBtn;
    IBTransaction1: TIBTransaction;
    IBSQL1: TIBSQL;
    IBQObs: TIBQuery;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    DSObs: TDataSource;
    cmdCancelar: TBitBtn;
    IBQPlantillas: TIBQuery;
    DSPlantillas: TDataSource;
    IBTransaction0: TIBTransaction;
    IBQObsFECHA: TDateField;
    IBQObsOBSERVACION: TMemoField;
    IBQObsSEMAFORO: TIntegerField;
    IBQObsID_EMPLEADO: TIBStringField;
    procedure cmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure cmdBuscarClick(Sender: TObject);
    procedure IBQObsOBSERVACIONGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGDatosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure IBQObsAfterScroll(DataSet: TDataSet);
    procedure cmdAgregarClick(Sender: TObject);
    procedure cmdAceptarClick(Sender: TObject);
    procedure DBLCBPlantillasClick(Sender: TObject);
    procedure cmdCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure IBQObsID_EMPLEADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure IBQObsSEMAFOROGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    Fid:Integer;
    Fpersona:string;
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
    property Id:Integer Write Fid;
    property Persona:string Write FPersona;
  end;

var
  frmControldeObservaciones: TfrmControldeObservaciones;
  frmRegistrarObservacion: TfrmRegistrarObservacion;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmControldeObservaciones.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmControldeObservaciones.Inicializar;
begin
        with IBQTipoIdentificacion do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Open;
          Last;
        end;

        if (Fid >= 0) and (Fpersona <> '') then
        begin
          DBLCBTipoIdentificacion.KeyValue := Fid;
          EdNumeroIdentificacion.Text := Fpersona;
          cmdBuscar.Click;
        end;
end;

procedure TfrmControldeObservaciones.FormShow(Sender: TObject);
begin
        Image1.Picture.Bitmap.LoadFromResourceName(HInstance,'SEMVERDE');
        Image2.Picture.Bitmap.LoadFromResourceName(HInstance,'SEMAMARILLO');
        Image3.Picture.Bitmap.LoadFromResourceName(HInstance,'SEMROJO');
        Inicializar;
end;

procedure TfrmControldeObservaciones.EdNumeroIdentificacionExit(
  Sender: TObject);
begin
        if EdNumeroIdentificacion.Text <> '' then
           cmdBuscar.Click;
end;

procedure TfrmControldeObservaciones.cmdBuscarClick(Sender: TObject);
begin
        if (EdNumeroIdentificacion.Text = '') or (DBLCBTipoIdentificacion.KeyValue < 1) then begin
           MessageDlg('Debe registrar un tipo y número de identificación',mtError,[mbcancel],0);
           Exit;
        end;

        with IBSQL1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona"');
          SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := dblcbtipoidentificacion.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
          try
           ExecQuery;
           if RecordCount < 1 then
              begin
                 MessageDlg('Persona no existe!',mtError,[mbcancel],0);
                 Exit;
              end;
           EdNombre.Caption := trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                            FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                            FieldByName('NOMBRE').AsString);
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;
        end; // with

        with IBQObs do begin
           Close;
           SQL.Clear;
           SQL.Add('select FECHA, HORA, OBSERVACION, SEMAFORO, ID_EMPLEADO from "gen$observaciones"');
           SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
           SQL.Add('order by FECHA DESC, HORA DESC');
           try
            ParamByName('ID_IDENTIFICACION').AsInteger := dblcbtipoidentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

       cmdAgregar.Enabled := True;
       Panel4.Enabled := False;
end;

procedure TfrmControldeObservaciones.IBQObsOBSERVACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TfrmControldeObservaciones.DBGDatosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bmp: TBitmap;
  W: Integer;
  R: TRect;
begin
  R := Rect;
  if Column.Field = IBQObsSEMAFORO then begin
    bmp := TBitmap.Create;
    try
      if Column.Field.Value = 2 then
         bmp.LoadFromResourceName(HInstance,'SEMROJO')
      else
      if Column.Field.Value = 1 then
         bmp.LoadFromResourceName(HInstance,'SEMAMARILLO')
      else
      if Column.Field.Value = 0 then
         bmp.LoadFromResourceName(HInstance,'SEMVERDE');
      W := (Rect.Bottom - Rect.Top) * 1;
      R.Right := Rect.Left + W;
      DBGDatos.Canvas.StretchDraw(R, bmp);
    finally
      bmp.Free;
    end;
    R := Rect;
    R.Left := R.Left + W;
  end;
  DBGDatos.DefaultDrawDataCell(R, Column.Field, State);
end;

procedure TfrmControldeObservaciones.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmControldeObservaciones.IBQObsAfterScroll(DataSet: TDataSet);
begin
        Memo.Text := DataSet.FieldByName('OBSERVACION').AsString;
end;

procedure TfrmControldeObservaciones.cmdAgregarClick(Sender: TObject);
begin
        cmdAgregar.Enabled := False;
        Panel2.Enabled := True;
        Memo.Text := '';
        IBQPlantillas.Open;
        IBQPlantillas.Last;
        DBLCBPlantillas.DropDown;
        DBLCBPlantillas.SetFocus;
end;

procedure TfrmControldeObservaciones.cmdAceptarClick(Sender: TObject);
begin

        if Memo.Text = '' then begin
          MessageDlg('No Existe Observación ha Adicionar',mtInformation,[mbok],0);
          Exit;
        end;

        if MessageDlg('Seguro de Agregar la Observación',mtConfirmation,[mbyes,mbno],0) = mrNo then begin
             Panel2.Enabled := False;
             cmdAgregar.Enabled := True;
             Exit;
        end;

        Panel2.Enabled := False;
        cmdAgregar.Enabled := True;

         with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "gen$observaciones" (ID_IDENTIFICACION, ID_PERSONA,');
            SQL.Add('FECHA,HORA,OBSERVACION,SEMAFORO,ID_EMPLEADO) values (');
            SQL.Add(':ID_IDENTIFICACION,');
            SQL.Add(':ID_PERSONA,');
            SQL.Add(':FECHA,');
            SQL.Add(':HORA,');
            SQL.Add(':OBSERVACION,');
            SQL.Add(':SEMAFORO,');
            SQL.Add(':ID_EMPLEADO)');
            ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('HORA').AsTime := fHoraActual;
            ParamByName('OBSERVACION').AsString := Memo.Text;
            if RBVerde.Checked then
               ParamByName('SEMAFORO').AsInteger := 0
            else
            if RBAmarilla.Checked then
               ParamByName('SEMAFORO').AsInteger  := 1
            else
            if RBRoja.Checked then
               ParamByName('SEMAFORO').AsInteger := 2;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            try
             ExecQuery;
             Transaction.Commit;
             cmdBuscar.Click;
            except
             Transaction.Rollback;
             raise;
            end;
          end;

end;

procedure TfrmControldeObservaciones.DBLCBPlantillasClick(Sender: TObject);
begin
        if DBLCBPlantillas.KeyValue >= 0 then begin
           frmRegistrarObservacion := TfrmRegistrarObservacion.Create(Self);
           frmRegistrarObservacion.Left := Self.Left+Self.Width;
           frmRegistrarObservacion.Top  := Self.Top + 245;
           frmRegistrarObservacion.Cadena := DBLCBPlantillas.Text;
           frmRegistrarObservacion.Llave := DBLCBPlantillas.KeyValue;
           if frmRegistrarObservacion.ShowModal = mrok then begin
             Memo.Text := frmRegistrarObservacion.Memo;
             frmRegistrarObservacion.Close;
           end;
        end;
end;

procedure TfrmControldeObservaciones.cmdCancelarClick(Sender: TObject);
begin
        frmRegistrarObservacion.Close;
        Panel2.Enabled := False;
        cmdAgregar.Enabled := True;

end;

procedure TfrmControldeObservaciones.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        if frmRegistrarObservacion <> nil then
           frmRegistrarObservacion.Close;
end;

procedure TfrmControldeObservaciones.IBQObsID_EMPLEADOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$empleado" where ID_EMPLEADO = :ID_EMPLEADO');
          ParamByName('ID_EMPLEADO').AsString := Sender.AsString;
          try
           ExecQuery;
           if RecordCount > 0 then
              Text := Trim(FieldByName('NOMBRE').AsString + ' ' +
                           FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                           FieldByName('SEGUNDO_APELLIDO').AsString)
           else
              Text := 'NO REGISTRADO';
          except
            Transaction.Rollback;
            raise;
          end;
        end;


end;

procedure TfrmControldeObservaciones.IBQObsSEMAFOROGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := '';
end;

end.
