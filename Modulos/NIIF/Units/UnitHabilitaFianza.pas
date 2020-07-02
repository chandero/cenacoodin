unit UnitHabilitaFianza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvStaticText, Buttons, Mask, JvLabel, ExtCtrls, DB,
  DBClient, Grids, DBGrids, DBCtrls, IBDatabase, IBCustomDataSet, IBQuery,
  IBSQL;

type
  TFrmHabilitaFianza = class(TForm)
    Panel1: TPanel;
    JvLabel1: TJvLabel;
    Label3: TLabel;
    MKsolicitud: TMaskEdit;
    BTbuscar: TBitBtn;
    JvStaticText2: TJvStaticText;
    Jvoficina: TJvStaticText;
    JVfecha: TJvStaticText;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    CdFianzas: TClientDataSet;
    CdFianzasid_colocacion: TStringField;
    CdFianzasid_agencia: TSmallintField;
    CdFianzasdias: TIntegerField;
    CdFianzasestado: TStringField;
    CdFianzasautoriza: TBooleanField;
    CdFianzassaldo_actual: TCurrencyField;
    CdFianzasid_persona: TStringField;
    CdFianzasid_identificacion: TSmallintField;
    DsFianzas: TDataSource;
    DbFianzas: TDBGrid;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    CdDeudor: TClientDataSet;
    CdDeudorID_PERSONA: TStringField;
    CdDeudorID_IDENTIFICACION: TSmallintField;
    CdDeudorNOMBRES: TStringField;
    DsDeudor: TDataSource;
    CdDeudorTIPO: TStringField;
    IBSQL1: TIBSQL;
    DBCheckBox2: TDBCheckBox;
    DbCopia: TClientDataSet;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    BooleanField1: TBooleanField;
    CurrencyField1: TCurrencyField;
    StringField3: TStringField;
    SmallintField2: TSmallintField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BTbuscarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MKsolicitudKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DbFianzasColExit(Sender: TObject);
    procedure DbFianzasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DbFianzasKeyPress(Sender: TObject; var Key: Char);
    procedure DbFianzasDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
   vMaxDias :Integer;

    { Private declarations }
  public
  vTipo : Integer;
  published
    procedure CARGAR;
    function vBuscar(vIdSolicitud, vIdColocacion: string): boolean;
    { Public declarations }
  end;

var
  FrmHabilitaFianza: TFrmHabilitaFianza;

implementation

uses UnitdmGeneral, UnitDmSolicitud,UnitGlobalesCol,UnitGlobales,
  UnitdmColocacion;

{$R *.dfm}

procedure TFrmHabilitaFianza.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmHabilitaFianza.BTbuscarClick(Sender: TObject);
begin
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          if vTipo <> 2 then
          begin
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"col$solicitudanalista".ID_EMPLEADO');
            SQL.Add('FROM');
            SQL.Add('"col$solicitudanalista"');
            SQL.Add('WHERE');
            SQL.Add('("col$solicitudanalista".ID_SOLICITUD = :ID_SOLICITUD) AND');
            SQL.Add('("col$solicitudanalista".ES_VIGENTE = 1)');
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            Open;
            if RecordCount > 0 then
            begin
              if FieldByName('ID_EMPLEADO').AsString <> DBAlias then
              begin
                 MessageDlg('Error, La Solcitud se Encuentra a Nombre de : ' + FieldByName('ID_EMPLEADO').AsString,mtWarning,[MBOK],0);
                 Exit;
              end;
           end;
          end;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"gen$persona".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('AND ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitud no Encontrada',mtWarning,[mbok],0);
            Exit;
          end;
          Jvoficina.Caption := Ciudad;
          JVfecha.Caption := FieldByName('FECHA_RECEPCION').AsString;
          CdDeudor.Append;
          CdDeudor.FieldValues['ID_IDENTIFICACION'] := FieldByName('ID_IDENTIFICACION').AsInteger;
          CdDeudor.FieldValues['ID_PERSONA'] := FieldByName('ID_PERSONA').AsString;
          CdDeudor.FieldValues['NOMBRES'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          CdDeudor.FieldValues['TIPO'] := 'DEUDOR';
          CdDeudor.Post;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"gen$persona".ID_IDENTIFICACION');
          SQL.Add('FROM');
          SQL.Add('"col$codeudor"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$codeudor".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$codeudor".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('WHERE');
          SQL.Add('("col$codeudor".ID_SOLICITUD = :ID_SOLICITUD) AND ');
          SQL.Add('("col$codeudor".ES_CONYUGUE = 0)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          while not Eof do
          begin
            CdDeudor.Append;
            CdDeudor.FieldValues['ID_IDENTIFICACION'] := FieldByName('ID_IDENTIFICACION').AsInteger;
            CdDeudor.FieldValues['ID_PERSONA'] := FieldByName('ID_PERSONA').AsString;
            CdDeudor.FieldValues['NOMBRES'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            CdDeudor.FieldValues['TIPO'] := 'CODEUDOR';
            CdDeudor.Post;
            Next;
          end;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 27');
          Open;
          vMaxDias := FieldByName('VALOR_MINIMO').AsInteger;
        end;
        cargar;
        if CdFianzas.RecordCount = 0 then
        begin
          MessageDlg('La Solicitud no Posee Fianzas Atrazadas',mtInformation,[mbok],0);
          Exit;
        end;
        Panel1.Enabled := False;
        
end;

procedure TFrmHabilitaFianza.BitBtn2Click(Sender: TObject);
begin
        Panel1.Enabled := True;
        Jvoficina.Caption := '';
        JVfecha.Caption := '';
        CdDeudor.CancelUpdates;
        CdFianzas.CancelUpdates;
        MKsolicitud.Text := '';
        DsFianzas.DataSet := DbCopia;
        MKsolicitud.SetFocus;
end;

procedure TFrmHabilitaFianza.CARGAR;
var     dias :Integer;
        saldo :Currency;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        CdDeudor.First;
        while not CdDeudor.Eof do
        begin
          with DmSolicitud.IBSolicitud1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_CAPITAL,');
            SQL.Add('"col$colocacion".FECHA_INTERES,"col$colocacion".ID_AGENCIA,"col$colocacion".ID_COLOCACION,"col$colocacion".ID_ESTADO_COLOCACION,');
            SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,"col$colocacion".ID_PERSONA,"col$colocacion".ID_IDENTIFICACION');
            SQL.Add('FROM');
            SQL.Add('"col$colgarantias"');
            SQL.Add('INNER JOIN "col$colocacion" ON ("col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION) AND ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA)');
            SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
            SQL.Add('WHERE');
            SQL.Add('("col$colgarantias".ID_PERSONA = :ID_PERSONA) AND');
            SQL.Add('("col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
            SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION IN (0))');
            ParamByName('ID_PERSONA').AsString := CdDeudorid_persona.Value;
            ParamByName('ID_IDENTIFICACION').AsInteger := CdDeudorid_identificacion.Value;
            Open;
            while not Eof do
            begin
               dias := obtenerdeudahoy1(Agencia,FieldByName('ID_COLOCACION').AsString,IBSQL1).Dias;
               if dias > 0 then
               begin
                 saldo := FieldByName('SALDO').AsCurrency;
                 CdFianzas.Append;
                 CdFianzas.FieldValues['id_colocacion'] := FieldByName('ID_COLOCACION').AsString;
                 if saldo = 0 then
                    CdFianzas.FieldValues['saldo_actual'] := '$0'
                 else
                    CdFianzas.FieldValues['saldo_actual'] := FormatCurr('$#,#',saldo);
                 CdFianzas.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                 CdFianzas.FieldValues['id_agencia'] := FieldByName('ID_AGENCIA').AsInteger;
                 CdFianzas.FieldValues['dias'] := dias;
                 CdFianzas.FieldValues['autoriza'] := vbuscar(MKsolicitud.Text,FieldByName('ID_COLOCACION').AsString);
                 CdFianzas.FieldValues['id_persona'] :=  CdDeudorid_persona.Value;
                 CdFianzas.FieldValues['id_identificacion'] := CdDeudorid_identificacion.Value;
                 CdFianzas.Post;
               end;
                 Next;
            end;
         end;
         CdDeudor.Next;
        end;
        CdDeudor.Filtered := False;

end;

function TFrmHabilitaFianza.vBuscar(vIdSolicitud,
  vIdColocacion: string): boolean;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "col$fianza" where ID_COLOCACION = :ID_COLOCACION and ID_SOLICITUD = :ID_SOLICITUD');
          ParamByName('ID_COLOCACION').AsString := vIdColocacion;
          ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
          ExecQuery;
          if RecordCount = 0 then
             Result := False
          else
             Result := True;
        end;
end;

procedure TFrmHabilitaFianza.FormCreate(Sender: TObject);
begin
        DmSolicitud := TDmSolicitud.Create(Self);
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TFrmHabilitaFianza.MKsolicitudKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BTbuscar.Click
end;

procedure TFrmHabilitaFianza.DBGrid1CellClick(Column: TColumn);
var
        filtro :string;
begin
        filtro := 'id_persona = ' + CdDeudorID_PERSONA.Value + ' and id_identificacion = ' + IntToStr(CdDeudorID_IDENTIFICACION.Value);
        with CdFianzas do
        begin
          CdFianzas.Filtered := False;
          CdFianzas.Filter := filtro;
          CdFianzas.Filtered := True;
        end;
        DsFianzas.DataSet := CdFianzas;
end;

procedure TFrmHabilitaFianza.DbFianzasColExit(Sender: TObject);
begin
if DbFianzas.SelectedField.FieldName = DBCheckBox2.DataField then
    DBCheckBox2.Visible := False;
//            DBcretditicia.Columns[10].Color :=  clWhite;

end;

procedure TFrmHabilitaFianza.DbFianzasDrawColumnCell(Sender: TObject;
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
    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
     DBCheckBox2.Left := Rect.Left + DbFianzas.Left + 5;    //15
     DBCheckBox2.Top := Rect.Top + DbFianzas.top + 2;        //2
     DBCheckBox2.Width := 27;//Rect.Right - Rect.Left;
     DBCheckBox2.Height := 17;//Rect.Bottom - Rect.Top;
     DBCheckBox2.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      DbFianzas.Canvas.FillRect(Rect);
      DrawFrameControl(DbFianzas.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFrmHabilitaFianza.DbFianzasKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = Chr(9)) then Exit;

  if (DbFianzas.SelectedField.FieldName = DBCheckBox2.DataField) then
  begin
    DBCheckBox2.SetFocus;
    SendMessage(DBCheckBox2.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TFrmHabilitaFianza.DbFianzasDblClick(Sender: TObject);
begin
        if (CdFianzasdias.Value >= vMaxDias)  and (CdFianzas.FieldValues['autoriza'] = False) then
           Exit;
        CdFianzas.Edit;
        CdFianzas.FieldValues['autoriza'] := not(CdFianzasautoriza.Value);
        CdFianzas.Post;

end;

procedure TFrmHabilitaFianza.BitBtn1Click(Sender: TObject);
begin
        if MessageDlg('Esta Seguro de Realizar la Operacion',mtInformation,[mbyes,mbno],0) = mrno then
            Exit;
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('delete from "col$fianza" where ID_SOLICITUD = :ID_SOLICITUD');
          SQL.Add('and ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ExecSQL;
          Transaction.CommitRetaining;
          SQL.Clear;
          Close;
          SQL.Clear;
          SQL.Add('insert into "col$fianza" values (:ID_AGENCIA,:ID_SOLICITUD,');
          SQL.Add(':ID_COLOCACION,:DIAS,:ID_EMPLEADO,:FECHA,:HORA)');
          CdFianzas.First;
          CdFianzas.Filtered := False;
          CdFianzas.Filter := 'autoriza = true';
          CdFianzas.Filtered := True;
          while not CdFianzas.Eof do
          begin
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            ParamByName('ID_COLOCACION').AsString := CdFianzas.FieldByName('ID_COLOCACION').AsString;
            ParamByName('DIAS').AsInteger := CdFianzas.FieldByName('DIAS').AsInteger;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('HORA').AsTime := Time;
            ExecSQL;
            Transaction.CommitRetaining;
            CdFianzas.Next;
          end;
          Transaction.Commit;
        end;
        MessageDlg('Cambios Realizados con Exito.',mtInformation,[mbok],0);
        if vTipo <> 2 then
          BitBtn2.Click
        else
        begin
           BitBtn1.Enabled := False;
        end;
end;

end.
