unit UnitExencionGMF_MOD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JvEdit, DBCtrls, IBSQL, IBDatabase,
  DB, IBCustomDataSet, IBQuery, FR_Class, pr_Common, pr_Classes, DBClient,
  Grids, DBGrids;

type
  TfrmExencionGMFmod = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    DBLCBTipoDto: TDBLookupComboBox;
    EdNumeroCap: TJvEdit;
    EdDigitoCap: TStaticText;
    EdNombreCap: TStaticText;
    EdAgencia: TStaticText;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    IBQuery: TIBQuery;
    frReport1: TfrReport;
    Label2: TLabel;
    chkTotal: TCheckBox;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    DBGrid1: TDBGrid;
    CDCuentas: TClientDataSet;
    DsCuentas: TDataSource;
    CDCuentasID_AGENCIA: TSmallintField;
    CDCuentasID_TIPO_CAPTACION: TSmallintField;
    CDCuentasNUMERO_CUENTA: TIntegerField;
    CDCuentasDIGITO_CUENTA: TSmallintField;
    CDCuentasGMF: TSmallintField;
    CDCuentasTOTAL: TSmallintField;
    CDCuentasFECHA_CAMBIO: TDateField;
    CDCuentasHORA_CAMBIO: TTimeField;
    CDCuentasID_EMPLEADO: TStringField;
    Panel3: TPanel;
    btnReporte: TBitBtn;
    btnMarcar: TBitBtn;
    BtnDesmarcar: TBitBtn;
    btnCerrar: TBitBtn;
    BtnNuevo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure EdNumeroCapExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnReporteClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btnMarcarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnDesmarcarClick(Sender: TObject);
    procedure CDCuentasFECHA_CAMBIOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure CDCuentasHORA_CAMBIOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CDCuentasID_EMPLEADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure CDCuentasID_TIPO_CAPTACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure BtnNuevoClick(Sender: TObject);
  private
    { Private declarations }
    class procedure PintarRadioButton(oGrid: TObject; Rect: TRect; Column: TColumn; posColuma: Integer);
    class procedure ChequearRadioButton(Column: TColumn; posColuma: Integer);
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmExencionGMFmod: TfrmExencionGMFmod;
  Marca :Boolean;
  Asociado, TipoDocumento, Documento, Cuenta:string;
  FechaIExencion:TDate;

implementation

{$R *.dfm}

uses UnitdmGeneral, UnitGlobales;

procedure TfrmExencionGMFmod.FormCreate(Sender: TObject);
begin
        inicializar;
end;

procedure TfrmExencionGMFmod.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmExencionGMFmod.EdNumeroCapExit(Sender: TObject);
begin
        if EdNumeroCap.Text = '' then
        begin
           MessageDlg('Debe digitar un número de Documento',mtInformation,[mbok],0);
           Exit;
        end;

//        EdNumeroCap.Text := Format('%.15d',[StrToInt(Trim(EdNumeroCap.Text))]);

        if DBLCBTipoDto.KeyValue < 1 then
        begin
          MessageDlg('Debe seleccionar un Tipo de Documento',mtInformation,[mbok],0);
          Exit;
        end;

        FechaIExencion := 0;
        with IBQuery do
        begin
           if Transaction.InTransaction then
             Transaction.Commit;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT "cap$maestrotitular".ID_IDENTIFICACION,');
           SQL.Add('"cap$maestrotitular".ID_PERSONA,');
           SQL.Add('"cap$maestrotitular".ID_AGENCIA,');
           SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION,');
           SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,');
           SQL.Add('"cap$maestrotitular".DIGITO_CUENTA,');
           SQL.Add('"gen$persona".NOMBRE,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
           SQL.Add('FROM "cap$maestrotitular"');
           SQL.Add('LEFT JOIN "cap$maestroexcentas" ON ("cap$maestrotitular".NUMERO_CUENTA="cap$maestroexcentas".NUMERO_CUENTA)');
           SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestroexcentas".DIGITO_CUENTA)');
           SQL.Add('AND ("cap$maestrotitular".ID_TIPO_CAPTACION="cap$maestroexcentas".ID_TIPO_CAPTACION)');
           SQL.Add('AND ("cap$maestrotitular".ID_AGENCIA="cap$maestroexcentas".ID_AGENCIA)');
           SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
           SQL.Add('AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
           SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA)');
           SQL.Add('AND("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION)');
           SQL.Add('AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA)');
           SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
           SQL.Add('WHERE');
           SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION BETWEEN 2 AND 4) and');
           SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1) AND');
           SQL.Add('("cap$maestrotitular".ID_IDENTIFICACION = :TIPO) AND');
           SQL.Add('("cap$maestrotitular".ID_PERSONA = :NUMERO) AND');
           SQL.Add('("cap$maestro".ID_ESTADO = 1)');
           ParamByName('TIPO').AsInteger := DBLCBTipoDto.KeyValue;
           ParamByName('NUMERO').AsString := Trim(EdNumeroCap.Text);
           try
             Open;
             if RecordCount < 1 then
               begin
                 MessageDlg('No Encontre Registros con estos Datos'+#13+
                                    'Por Favor Verifique!',mtInformation,[mbok],0);
                 Exit;
               end;
           except
             MessageDlg('Error al Buscar Documento',mtError,[mbcancel],0);
             Exit;
           end;

           Asociado := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                  FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                  FieldByName('NOMBRE').AsString;

           TipoDocumento := DBLCBTipoDto.Text ; //('DESCRIPCION_IDENTIFICACION').AsString;
           Documento := FieldByName('ID_PERSONA').AsString;

           EdNombreCap.Caption := Asociado;
           while not Eof do
           begin
            IBSQL1.Close;
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('select * from "cap$maestroexcentas"');
            IBSQL1.SQL.Add('where');
            IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
            IBSQL1.ParamByName('ID_AGENCIA').AsInteger := IBQuery.fieldbyname('ID_AGENCIA').AsInteger;
            IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQuery.FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := IBQuery.FieldByName('NUMERO_CUENTA').AsInteger;
            IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := IBQuery.FieldByName('DIGITO_CUENTA').AsInteger;
            try
              IBSQL1.ExecQuery;
              if IBSQL1.RecordCount > 0 then
               begin
                 if IBSQL1.FieldByName('GMF').AsInteger = 1 then
                  begin
                   Marca := True;
                   BtnDesmarcar.Enabled := True;
                   if IBSQL1.FieldByName('FECHA_CAMBIO').AsDate <> 0 then
                     FechaIExencion := IBSQL1.FieldByName('FECHA_CAMBIO').AsDate
                   else
                     FechaIExencion := 0;
                  end
                 else
                   Marca := False;
                 chkTotal.Checked := InttoBoolean(IBSQL1.FieldByName('TOTAL').AsInteger);
               end
              else
                 Marca := False;
            except
              IBSQL1.Transaction.Rollback;
              raise;
              Exit;
            end; // del try

//            CDCuentas.Active := True;
            CDCuentas.Append;
            CDCuentas.FieldValues['ID_AGENCIA'] := IBQuery.fieldbyname('ID_AGENCIA').AsInteger;
            CDCuentas.FieldValues['ID_TIPO_CAPTACION'] := IBQuery.fieldbyname('ID_TIPO_CAPTACION').AsInteger;
            CDCuentas.FieldValues['NUMERO_CUENTA'] := IBQuery.fieldbyname('NUMERO_CUENTA').AsInteger;
            CDCuentas.FieldValues['DIGITO_CUENTA'] := IBQuery.fieldbyname('DIGITO_CUENTA').AsInteger;
            CDCuentas.FieldValues['GMF'] := IBSQL1.fieldbyname('GMF').AsInteger;
            CDCuentas.FieldValues['TOTAL'] := IBSQL1.FieldByName('TOTAL').AsInteger;
            CDCuentas.FieldValues['FECHA_CAMBIO'] := IBSQL1.FieldByName('FECHA_CAMBIO').AsDate;
            CDCuentas.FieldValues['HORA_CAMBIO'] := IBSQL1.FieldByName('HORA_CAMBIO').AsTime;
            CDCuentas.FieldValues['ID_EMPLEADO'] := IBSQL1.FieldByName('ID_EMPLEADO').AsString;
            CDCuentas.Post;

            Next;
           end;  // Fin de While
        end;

end;

procedure TfrmExencionGMFmod.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmExencionGMFmod.btnReporteClick(Sender: TObject);
begin
        if Marca then
          frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\ReportesCap\SolicitudMarcacionGMF.frf')
        else
          frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\ReportesCap\SolicitudDesMarcacionGMF.frf');

        if frReport1.PrepareReport then
           frReport1.ShowPreparedReport;

end;

procedure TfrmExencionGMFmod.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin

        if ParName = 'CIUDAD' then
           ParValue := Ciudad;
        if ParName = 'FECHA' then
           ParValue := fFechaActual;
        if ParName = 'ASOCIADO' then
           ParValue := Asociado;
        if ParName = 'TIPO_DOCUMENTO' then
           ParValue := TipoDocumento;
        if ParName = 'DOCUMENTO' then
           ParValue := Documento;
        if ParName = 'CUENTA' then
           ParValue := Cuenta;
        if ParName = 'EMPRESA' then
           ParValue := Empresa;
        if ParName = 'FUNCIONARIO' then
           ParValue := Nombres+' '+Apellidos;
        if ParName = 'FECHAI' then
           ParValue := FechaIExencion;
end;

procedure TfrmExencionGMFmod.btnMarcarClick(Sender: TObject);
begin

        if MessageDlg('Seguro de Realizar Esta Operación?',mtConfirmation,[mbYes,mbNo],0) <> mrYes
         then Exit;

        CDCuentas.First;
        while not CDCuentas.Eof do begin
          IBSQL1.Close;
          IBSQL1.SQL.Clear;
          IBSQL1.SQL.Add('delete from "cap$maestroexcentas"');
          IBSQL1.SQL.Add('where');
          IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA');
          IBSQL1.SQL.Add('and');
          IBSQL1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
          IBSQL1.SQL.Add('and');
          IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA');
          IBSQL1.SQL.Add('and');
          IBSQL1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
          IBSQL1.ParamByName('ID_AGENCIA').AsInteger := CDCuentasID_AGENCIA.Value;
          IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDCuentasID_TIPO_CAPTACION.Value;
          IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := CDCuentasNUMERO_CUENTA.Value;
          IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := CDCuentasDIGITO_CUENTA.Value;
          try
            IBSQL1.ExecQuery;
          except
           IBSQL1.Transaction.Rollback;
           raise;
           Exit;
          end;
          CDCuentas.Next;
        end; // Fin de While Eliminacion

        CDCuentas.First;
        while not CDCuentas.Eof do begin
          IBSQL1.Close;
          IBSQL1.SQL.Clear;
          IBSQL1.SQL.Add('insert into "cap$maestroexcentas" (ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,GMF,TOTAL,FECHA_CAMBIO,HORA_CAMBIO,ID_EMPLEADO) values (');
          IBSQL1.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:GMF,:TOTAL,:FECHA_CAMBIO,:HORA_CAMBIO,:ID_EMPLEADO)');
          IBSQL1.ParamByName('ID_AGENCIA').AsInteger := CDCuentasID_AGENCIA.Value;
          IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDCuentasID_TIPO_CAPTACION.Value;
          IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := CDCuentasNUMERO_CUENTA.Value;
          IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := CDCuentasDIGITO_CUENTA.Value;
          IBSQL1.ParamByName('GMF').AsInteger := CDCuentasGMF.Value;
          if chkTotal.Checked then
            IBSQL1.ParamByName('TOTAL').AsInteger := 1
          else
            IBSQL1.ParamByName('TOTAL').AsInteger := 0;
          IBSQL1.ParamByName('FECHA_CAMBIO').AsDate := fFechaActual;
          IBSQL1.ParamByName('HORA_CAMBIO').AsTime := fHoraActual;
          IBSQL1.ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
            IBSQL1.ExecQuery;
          except
            IBSQL1.Transaction.Rollback;
            raise;
            Exit;
          end;
          CDCuentas.Next;
        end;  // Fin de While Insertar

        IBSQL1.Transaction.Commit;

        CDCuentas.Filtered := False;
        CDCuentas.Filter := 'GMF = 1';
        CDCuentas.Filtered := True;

        Cuenta := IntToStr(CDCuentasID_TIPO_CAPTACION.Value)+Format('%.2d',[cdcuentasid_agencia.Value])+ '-'+
                  Format('%.7d',[cdcuentasnumero_cuenta.Value]) + '-' + IntToStr(CDCuentasDIGITO_CUENTA.Value);
        CDCuentas.Filtered := False;

        Marca := True;
        btnMarcar.Enabled := False;
        BtnDesmarcar.Enabled := False;
        btnReporte.Enabled := True;
end;


procedure TfrmExencionGMFmod.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  PintarRadioButton(Sender,Rect,Column,4);
end;

class procedure TfrmExencionGMFmod.PintarRadioButton(oGrid: TObject; Rect: TRect; Column: TColumn; posColuma: Integer);
var
  MyRect  : TRect;
  _iCentroX, _iCentroY, _iradio : Integer;
begin
  if Column.Index = posColuma then
  begin
    with (oGrid as TDBGrid) do
    begin
      Canvas.FillRect(Rect); //para tapar la celda del dbgrid

      _iCentroX := ((Rect.Right  - Rect.Left) div 2) + Rect.Left;
      _iCentroY := ((Rect.Bottom - Rect.Top) div 2) + Rect.Top;

      //dibuja el circulo gris
      _iradio := 5;
      MyRect.Top    := _iCentroY - _iradio;
      MyRect.Bottom := _iCentroY + _iradio;
      MyRect.Left   := _iCentroX - _iradio;
      MyRect.Right  := _iCentroX + _iradio;

      Canvas.Pen.Color := clMedGray;
      Canvas.Pen.Width := 1;
      Canvas.Ellipse(MyRect);

      //pinta el punto de chequeo
      if Column.Field.Value = 1 then
      begin
        _iradio := 2;
        MyRect.Top    := _iCentroY - _iradio;
        MyRect.Bottom := _iCentroY + _iradio;
        MyRect.Left   := _iCentroX - _iradio;
        MyRect.Right  := _iCentroX + _iradio;

        Canvas.Pen.Width := 1;
        Canvas.Pen.Color := clBlack;
        Canvas.Brush.Color := clBlack;
        Canvas.Ellipse(MyRect);
      end;
    end;
  end;
end;

class procedure TfrmExencionGMFmod.ChequearRadioButton(Column: TColumn; posColuma: Integer);
var
  _iPosActual : Integer;
  cds: TClientDataSet;
begin
  cds := TClientDataSet(Column.Grid.DataSource.DataSet);
  if Column.Index = posColuma then
  begin
    _iPosActual := cds.RecNo;
    cds.first;
    while not cds.Eof do
    begin
      cds.Edit;
      cds.FieldValues[Column.FieldName] := '0';
      cds.next;
    end;
    cds.RecNo := _iPosActual;
    cds.Edit;
    cds.FieldValues[Column.FieldName] := '1';
  end;
end;

procedure TfrmExencionGMFmod.DBGrid1CellClick(Column: TColumn);
begin
     ChequearRadioButton(Column, 4);
end;

procedure TfrmExencionGMFmod.BtnDesmarcarClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Realizar Esta Operación?',mtConfirmation,[mbYes,mbNo],0) <> mrYes
         then Exit;

        CDCuentas.First;

        CDCuentas.Filtered := False;
        CDCuentas.Filter := 'GMF = 1';
        CDCuentas.Filtered := True;

        Cuenta := IntToStr(CDCuentasID_TIPO_CAPTACION.Value)+Format('%.2d',[cdcuentasid_agencia.Value])+ '-'+
                  Format('%.7d',[cdcuentasnumero_cuenta.Value]) + '-' + IntToStr(CDCuentasDIGITO_CUENTA.Value);
        CDCuentas.Filtered := False;

        while not CDCuentas.Eof do begin
          IBSQL1.Close;
          IBSQL1.SQL.Clear;
          IBSQL1.SQL.Add('update "cap$maestroexcentas" SET GMF = 0,FECHA_CAMBIO = :FECHA_CAMBIO,HORA_CAMBIO = :HORA_CAMBIO,ID_EMPLEADO = :ID_EMPLEADO, TOTAL = 0');
          IBSQL1.SQL.Add('where');
          IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA');
          IBSQL1.SQL.Add('and');
          IBSQL1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
          IBSQL1.SQL.Add('and');
          IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA');
          IBSQL1.SQL.Add('and');
          IBSQL1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
          IBSQL1.ParamByName('ID_AGENCIA').AsInteger := CDCuentasID_AGENCIA.Value;
          IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDCuentasID_TIPO_CAPTACION.Value;
          IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := CDCuentasNUMERO_CUENTA.Value;
          IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := CDCuentasDIGITO_CUENTA.Value;
          IBSQL1.ParamByName('FECHA_CAMBIO').AsDate := fFechaActual;
          IBSQL1.ParamByName('HORA_CAMBIO').AsTime := fHoraActual;
          IBSQL1.ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
           IBSQL1.ExecQuery;
          except
           IBSQL1.Transaction.Rollback;
           raise;
           Exit;
          end;
          CDCuentas.Next;
        end;

        IBSQL1.Transaction.Commit;
        Marca := False;

        btnMarcar.Enabled := False;
        BtnDesmarcar.Enabled := False;
        btnReporte.Enabled := True;
end;

procedure TfrmExencionGMFmod.CDCuentasFECHA_CAMBIOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        if (CDCuentasFECHA_CAMBIO.Value = Null) or (CDCuentasFECHA_CAMBIO.VALUE = 0)  then
          Text := ''
        else
          Text := DateToStr(CDCuentasFECHA_CAMBIO.Value);
end;

procedure TfrmExencionGMFmod.CDCuentasHORA_CAMBIOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        if (CDCuentasHORA_CAMBIO.Value = Null) or (CDCuentasHORA_CAMBIO.VALUE = 0)  then
          Text := ''
        else
          Text := TimeToStr(CDCuentasHORA_CAMBIO.Value);
end;

procedure TfrmExencionGMFmod.CDCuentasID_EMPLEADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        if (CDCuentasID_EMPLEADO.Value = Null) or (CDCuentasID_EMPLEADO.Value =  '') then
          Text := ''
        else
          Text := Nombres + ' ' + Apellidos;
end;

procedure TfrmExencionGMFmod.DBGrid1ColExit(Sender: TObject);
begin
        btnMarcar.Enabled := True;
end;

procedure TfrmExencionGMFmod.CDCuentasID_TIPO_CAPTACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        case CDCuentasID_TIPO_CAPTACION.Value of 
          1 : Text := 'APORTES';
          2 : Text := 'AHORROS';
          4 : Text := 'JUVENIL';
          5 : Text := 'CONTRACTUAL';
          6 : Text := 'CDAT';
        end;

end;

procedure TfrmExencionGMFmod.Inicializar;
begin
       chkTotal.Checked := False;
       Marca := False;
       CDCuentas.EmptyDataSet;
       DBGrid1.Refresh;
       BtnDesmarcar.Enabled := False;
       btnMarcar.Enabled := False;
       btnReporte.Enabled := False;
       EdNumeroCap.Text := '';
       EdNombreCap.Caption := '';
       Cuenta := '';
       DBLCBTipoDto.KeyValue := -1;

        with IBQuery1 do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('  "gen$tiposidentificacion".ID_IDENTIFICACION,');
           SQL.Add('  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION');
           SQL.Add('FROM');
           SQL.Add(' "gen$tiposidentificacion"');
           Open;
           Last;
           First;
        end;

        with IBSQL1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "gen$agencia" where ID_AGENCIA = :AGENCIA');
           ParamByName('AGENCIA').AsInteger := Agencia;
           try
            ExecQuery;
            EdAgencia.Caption := FieldByName('DESCRIPCION_AGENCIA').AsString;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;
end;

procedure TfrmExencionGMFmod.BtnNuevoClick(Sender: TObject);
begin
        inicializar;
        DBLCBTipoDto.SetFocus;        
end;

end.
