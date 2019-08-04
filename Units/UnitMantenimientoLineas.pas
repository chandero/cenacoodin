unit UnitMantenimientoLineas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, JvEdit, JvFloatEdit, DB,
  IBCustomDataSet, IBQuery, Menus,ShellApi;

type
  TFrmMantenimientoLineas = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edDescripcion: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    JvTasa: TJvFloatEdit;
    JvPuntos: TJvFloatEdit;
    cbEstado: TComboBox;
    Panel2: TPanel;
    bActualizar: TButton;
    bCerrar: TButton;
    IBQuery1: TIBQuery;
    IBQuery1ID_LINEA: TSmallintField;
    IBQuery1DESCRIPCION_LINEA: TIBStringField;
    IBQuery1TASA: TFloatField;
    IBQuery1PUNTOS_ADICIONALES: TFloatField;
    IBQuery1ESTADO: TSmallintField;
    IBQuery1DESESTADO: TIBStringField;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    PopupMenu1: TPopupMenu;
    Logdecambios1: TMenuItem;
    Memo1: TMemo;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure bCerrarClick(Sender: TObject);
    procedure JvTasaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure bActualizarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IBQuery1AfterScroll(DataSet: TDataSet);
    procedure Logdecambios1Click(Sender: TObject);
  private
    _iIdLinea :Integer;
    _cTasa :Currency;
    _cPuntos :Currency;
    _iEstado :Integer;
    { Private declarations }
  public
  published
    procedure Actualizar;
    { Public declarations }
  end;

var
  FrmMantenimientoLineas: TFrmMantenimientoLineas;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmMantenimientoLineas.Actualizar;
begin
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Open;
        end;
end;

procedure TFrmMantenimientoLineas.DBGrid1CellClick(Column: TColumn);
begin
        bActualizar.Enabled := True;
        edDescripcion.Text := IBQuery1.FieldByName('DESCRIPCION_LINEA').AsString;
        JvTasa.Value := IBQuery1.FieldByName('TASA').AsCurrency;
        JvPuntos.Value := IBQuery1.FieldByName('PUNTOS_ADICIONALES').AsCurrency;
        cbEstado.ItemIndex := IBQuery1.FieldByName('ESTADO').AsInteger;
        _iIdLinea := IBQuery1.FieldByName('ID_LINEA').AsInteger;
        _cTasa := IBQuery1.FieldByName('TASA').AsCurrency;
        _cPuntos := IBQuery1.FieldByName('PUNTOS_ADICIONALES').AsCurrency;
        _iEstado := IBQuery1.FieldByName('ESTADO').AsInteger;
end;

procedure TFrmMantenimientoLineas.bCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmMantenimientoLineas.JvTasaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmMantenimientoLineas.FormCreate(Sender: TObject);
begin
        Actualizar;
end;

procedure TFrmMantenimientoLineas.bActualizarClick(Sender: TObject);
var
        _tHora :TTime;
begin
        _tHora := fHoraActual;
        if MessageDlg('Esta seguro(a) de Realizar el cambio',mtInformation,[mbYes,mbNo],0) = mrNo then
           Exit;
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE');
          SQL.Add('  "col$lineas"');
          SQL.Add('SET');
          SQL.Add('  TASA = :TASA,');
          SQL.Add('  PUNTOS_ADICIONALES = :PUNTOS_ADICIONALES,');
          SQL.Add('  ESTADO = :ESTADO');
          SQL.Add('WHERE');
          SQL.Add('  "col$lineas".ID_LINEA = :ID_LINEA');
          ParamByName('TASA').AsCurrency := JvTasa.Value;
          ParamByName('PUNTOS_ADICIONALES').AsCurrency := JvPuntos.Value;
          ParamByName('ESTADO').AsInteger := cbEstado.ItemIndex;
          ParamByName('ID_LINEA').AsInteger := _iIdLinea;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO');
          SQL.Add('"col$lineasAUD"');
          SQL.Add('VALUES(');
          SQL.Add(':TIPO,');
          SQL.Add(':ID_LINEA,');
          SQL.Add(':TASA,');
          SQL.Add(':PUNTOS_ADICIONALES,');
          SQL.Add(':ESTADO,');
          SQL.Add(':USUARIO,');
          SQL.Add(':FECHA,');
          SQL.Add(':HORA)');
          //Información antes de la Actualización
          ParamByName('TIPO').AsString := 'D';
          ParamByName('TASA').AsCurrency := JvTasa.Value;
          ParamByName('PUNTOS_ADICIONALES').AsCurrency := JvPuntos.Value;
          ParamByName('ESTADO').AsInteger := cbEstado.ItemIndex;
          ParamByName('ID_LINEA').AsInteger := _iIdLinea;
          ParamByName('USUARIO').AsString := DBAlias;
          ParamByName('FECHA').AsDate := fFechaActual;
          ParamByName('HORA').AsDateTime := _tHora;
          ExecSQL;
          //Información Actulizada
          ParamByName('TIPO').AsString := 'A';
          ParamByName('TASA').AsCurrency := _cTasa;
          ParamByName('PUNTOS_ADICIONALES').AsCurrency := _cPuntos;
          ParamByName('ESTADO').AsInteger := _iEstado;
          ParamByName('ID_LINEA').AsInteger := _iIdLinea;
          ParamByName('USUARIO').AsString := DBAlias;
          ParamByName('FECHA').AsDate := fFechaActual;
          ParamByName('HORA').AsDateTime := _tHora;
          ExecSQL;
          Transaction.Commit;
        end;
        Actualizar;
end;

procedure TFrmMantenimientoLineas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
        if DBGrid1.DataSource.DataSet.FieldByName('ESTADO').AsInteger = 0 then
          DBGrid1.Canvas.Brush.Color := clScrollBar;
        if (gdSelected in State) then
        Dbgrid1.Canvas.Font.Style:=[fsBold];
            //DBGrid1.Canvas.Brush.Color := clMoneyGreen;
      // Manda pintar la celda
      DBGrid1.DefaultDrawColumnCell(rect,DataCol,Column,State);
end;

procedure TFrmMantenimientoLineas.IBQuery1AfterScroll(DataSet: TDataSet);
begin
        bActualizar.Enabled := True;
        edDescripcion.Text := IBQuery1.FieldByName('DESCRIPCION_LINEA').AsString;
        JvTasa.Value := IBQuery1.FieldByName('TASA').AsCurrency;
        JvPuntos.Value := IBQuery1.FieldByName('PUNTOS_ADICIONALES').AsCurrency;
        cbEstado.ItemIndex := IBQuery1.FieldByName('ESTADO').AsInteger;
        _iIdLinea := IBQuery1.FieldByName('ID_LINEA').AsInteger;
        _cTasa := IBQuery1.FieldByName('TASA').AsCurrency;
        _cPuntos := IBQuery1.FieldByName('PUNTOS_ADICIONALES').AsCurrency;
        _iEstado := IBQuery1.FieldByName('ESTADO').AsInteger;
end;

procedure TFrmMantenimientoLineas.Logdecambios1Click(Sender: TObject);
begin
        Memo1.Lines.Clear;
        with IBQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$empleado".NOMBRE || '' '' || "gen$empleado".SEGUNDO_APELLIDO || '' '' ||  "gen$empleado".PRIMER_APELLIDO as EMPLEADO,');
          SQL.Add('CASE WHEN "col$lineasAUD".TIPO = ''A'' THEN ''Antes''ELSE ''Despues'' END as TIPO,');
          SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
          SQL.Add('"col$lineasAUD".FECHA,');
          SQL.Add('"col$lineasAUD".HORA,');
          SQL.Add('"col$lineasAUD".TASA,');
          SQL.Add('"col$lineasAUD".PUNTOS_ADICIONALES,');
          SQL.Add('CASE WHEN "col$lineasAUD".ESTADO = 1 THEN ''ACTIVO'' ELSE ''INACTIVO'' END AS ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$lineasAUD"');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$lineasAUD".USUARIO = "gen$empleado".ID_EMPLEADO)');
          SQL.Add('INNER JOIN "col$lineas" ON ("col$lineasAUD".ID_LINEA = "col$lineas".ID_LINEA)');
          SQL.Add('ORDER BY   "col$lineasAUD".FECHA,');
          SQL.Add('"col$lineasAUD".HORA,');
          SQL.Add('"col$lineasAUD".TIPO');
          Open;
          Memo1.Lines.Add('                     Historico de cambios realizados sobre la tabla, Lineas');
          while not Eof do
          begin
            Memo1.Lines.Add('');
            Memo1.Lines.Add('Fecha y Hora de Realización: ' + FieldByName('FECHA').AsString + ':' + FieldByName('HORA').AsString + ' Usuario: ' + FieldByName('EMPLEADO').AsString);
            Memo1.Lines.Add('*************************************************************************************************************');            
            Memo1.Lines.Add(FieldByName('TIPO').AsString);
            memo1.lines.add('   Tasa--> ' + FieldByName('TASA').AsString);
            memo1.lines.add('   Puntos Adicionales--> ' + FieldByName('PUNTOS_ADICIONALES').AsString);
            memo1.lines.add('   Etado-->' + FieldByName('ESTADO').AsString);
            Next;
            Memo1.Lines.Add(FieldByName('TIPO').AsString);
            memo1.lines.add('   Tasa--> ' + FieldByName('TASA').AsString);
            memo1.lines.add('   Puntos Adicionales--> ' + FieldByName('PUNTOS_ADICIONALES').AsString);
            memo1.lines.add('   Etado-->' + FieldByName('ESTADO').AsString);
            Memo1.Lines.Add('*************************************************************************************************************');
            Next;
          end;
            Memo1.Lines.Add('Fin del Log. Fecha de Realización: ' + DateToStr(fFechaActual));
            Memo1.Lines.SaveToFile('c:\log.txt');
            ShellExecute(Handle, 'open', 'notepad.exe', PChar('c:\log.txt'), nil, SW_SHOWNORMAL);
        end;
end;

end.
