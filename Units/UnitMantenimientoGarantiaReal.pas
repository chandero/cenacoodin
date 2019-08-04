unit UnitMantenimientoGarantiaReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, IBCustomDataSet, IBQuery,
  Menus;

type
  TFrmMantenimientoGarantiaReal = class(TForm)
    GroupBox1: TGroupBox;
    CbTipo: TComboBox;
    GroupBox3: TGroupBox;
    EdFiltro: TEdit;
    GroupBox4: TGroupBox;
    BitBuscar: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox5: TGroupBox;
    DBGrid1: TDBGrid;
    IBConsulta: TIBQuery;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    ActualizarGarantia1: TMenuItem;
    BitBtn3: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    IBQuery1: TIBQuery;
    procedure BitBuscarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ActualizarGarantia1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure IBConsultaAfterOpen(DataSet: TDataSet);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure IBQuery1AfterOpen(DataSet: TDataSet);
    procedure EdFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure CbTipoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMantenimientoGarantiaReal: TFrmMantenimientoGarantiaReal;

implementation

uses UnitActualizaGarantiaReal,UnitGlobales;

{$R *.dfm}

procedure TFrmMantenimientoGarantiaReal.BitBuscarClick(Sender: TObject);
var _sSentencia :string;
begin
      if CbTipo.ItemIndex = 1 then
      begin
        _sSentencia := 'SELECT  ' +
                       '  "col$datogarantia".MATRICULA, ' +
                       '  "col$datogarantia".FECHA_MATRICULA, ' +
                       '  "col$datogarantia".NUMERO_ESCRITURA, ' +
                       '  "col$datogarantia".FECHA_ESCRITURA, ' +
                       '  "col$datogarantia".NOMBRE_NOTARIA, ' +
                       '  "col$datogarantia".CIUDAD_ESCRITURA, ' +
                       '  "col$datogarantia".AVALUO, ' +
                       '  "col$datogarantia".FECHA_AVALUO, ' +
                       '  "col$datogarantia".CUENTAS_DE_ORDEN, ' +
                       '  "col$datogarantia".POLIZA_INCENDIO, ' +
                       '  "col$datogarantia".VALOR_ASEGURADO, ' +
                       '  "col$datogarantia".FECHA_INICIAL_POLIZA, ' +
                       '  "col$datogarantia".FECHA_FINAL_POLIZA, ' +
                       '  "col$datogarantia".CODIGO_ASEGURADORA, ' +
                       '  "col$datogarantia".ESTADO as ESTADOHIP, ' +
                       '  CASE ' +
                       '  WHEN "col$datogarantia".ESTADO = 0 THEN ' + QUOTEDSTR('HIPOTECADA') +
                       '  WHEN "col$datogarantia".ESTADO = 1 THEN ' + QUOTEDSTR('POR CANCELAR') +
                       '  ELSE ' + QuotedStr('CANCELADA') +
                       '  END AS ESTADO ' +
                       'FROM ' +
                       '  "col$datogarantia" ' +
                       'WHERE ' +
                       '  "col$datogarantia".MATRICULA = :MATRICULA AND ' +
                       '  "col$datogarantia".ID_AGENCIA = :AGENCIA  ';
      end
      else
      begin
        _sSentencia := 'SELECT  ' +
                       '  "col$datogarantia".MATRICULA, ' +
                       '  "col$datogarantia".FECHA_MATRICULA, ' +
                       '  "col$datogarantia".NUMERO_ESCRITURA, ' +
                       '  "col$datogarantia".FECHA_ESCRITURA, ' +
                       '  "col$datogarantia".NOMBRE_NOTARIA, ' +
                       '  "col$datogarantia".CIUDAD_ESCRITURA, ' +
                       '  "col$datogarantia".AVALUO, ' +
                       '  "col$datogarantia".FECHA_AVALUO, ' +
                       '  "col$datogarantia".CUENTAS_DE_ORDEN, ' +
                       '  "col$datogarantia".POLIZA_INCENDIO, ' +
                       '  "col$datogarantia".VALOR_ASEGURADO, ' +
                       '  "col$datogarantia".FECHA_INICIAL_POLIZA, ' +
                       '  "col$datogarantia".FECHA_FINAL_POLIZA, ' +
                       '  "col$datogarantia".CODIGO_ASEGURADORA, ' +
                       '  "col$datogarantia".ESTADO AS ESTADOHIP, ' +
                       '  CASE ' +
                       '  WHEN "col$datogarantia".ESTADO = 0 THEN ' + QUOTEDSTR('HIPOTECADA') +
                       '  WHEN "col$datogarantia".ESTADO = 1 THEN ' + QUOTEDSTR('POR CANCELAR') +
                       '  ELSE ' + QuotedStr('CANCELADA') +
                       '  END AS ESTADO ' +
                       'FROM ' +
                       '  "col$datogarantia" ' +
                       '  INNER JOIN "col$garantiacol" ON ("col$datogarantia".ID_AGENCIA = "col$garantiacol".ID_AGENCIA) ' +
                       '  AND ("col$datogarantia".MATRICULA = "col$garantiacol".MATRICULA) ' +
                       'WHERE ' +
                       '  "col$garantiacol".ID_COLOCACION = :MATRICULA AND ' +
                       '  "col$datogarantia".ID_AGENCIA = :AGENCIA ';

      end;
      with Ibconsulta do
      begin
        Close;
        if Transaction.InTransaction then
           Transaction.Rollback;
        Transaction.StartTransaction;
        SQL.Clear;
        SQL.Add(_sSentencia);
        ParamByName('MATRICULA').AsString := EdFiltro.Text;
        ParamByName('AGENCIA').AsInteger := Agencia;
        Open;
        if RecordCount = 0 then
        begin
          ShowMessage('No se Encontraron Registros');
          EdFiltro.SetFocus;
        end;
      end;
end;

procedure TFrmMantenimientoGarantiaReal.BitBtn2Click(Sender: TObject);
begin
        IBConsulta.Close;
        IBQuery1.Close;
        EdFiltro.Text := '';
        EdFiltro.SetFocus;
end;

procedure TFrmMantenimientoGarantiaReal.ActualizarGarantia1Click(
  Sender: TObject);
begin
          FrmActualizaGarantiaReal := TFrmActualizaGarantiaReal.Create(Self);
          with FrmActualizaGarantiaReal do
          begin
            JvAvaluo.Value := IBConsulta.FieldByName('AVALUO').AsCurrency;
            JvCuenta.Value := IBConsulta.FieldByName('CUENTAS_DE_ORDEN').AsCurrency;
            JvValorAsegurado.Value := IBConsulta.FieldByName('VALOR_ASEGURADO').AsCurrency;
            EdPoliza.Text := IBConsulta.FieldByName('POLIZA_INCENDIO').Text;
            EdFechaIPoliza.DateTime := IBConsulta.FieldByName('FECHA_INICIAL_POLIZA').AsDateTime;
            EdFechaFPoliza.DateTime := IBConsulta.FieldByName('FECHA_FINAL_POLIZA').AsDateTime;
            EdFechaAvaluo.DateTime := IBConsulta.FieldByName('FECHA_AVALUO').AsDateTime;
            EdCodAseguradora.Text := IBConsulta.FieldByName('CODIGO_ASEGURADORA').AsString;
            CbEstadoGar.ItemIndex := IBConsulta.FieldByName('ESTADOHIP').AsInteger;
            _sMatricula := IBConsulta.FieldByName('MATRICULA').AsString;
            ShowModal;
            if _bActualiza then
               BitBuscar.Click;
            Free;
          end;
end;

procedure TFrmMantenimientoGarantiaReal.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmMantenimientoGarantiaReal.IBConsultaAfterOpen(
  DataSet: TDataSet);
var
  f : TField;
begin
    f := DataSet.FindField('AVALUO');
    if (f is TNumericField) then
      (f as TNumericField).Displayformat := '$,0';
    f := DataSet.FindField('CUENTAS_DE_ORDEN');
    if (f is TNumericField) then
      (f as TNumericField).Displayformat := '$,0';
    f := DataSet.FindField('VALOR_ASEGURADO');
    if (f is TNumericField) then
      (f as TNumericField).Displayformat := '$,0';

end;

procedure TFrmMantenimientoGarantiaReal.DBGrid1CellClick(Column: TColumn);
begin
        with IBQuery1 do
        begin
          Close;
          ParamByName('MATRICULA').AsString := IBConsulta.FieldByName('MATRICULA').AsString;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
        end;
end;

procedure TFrmMantenimientoGarantiaReal.IBQuery1AfterOpen(
  DataSet: TDataSet);
var
  f : TField;
begin
    f := DataSet.FindField('SALDO');
    if (f is TNumericField) then
      (f as TNumericField).Displayformat := '$,0';
end;

procedure TFrmMantenimientoGarantiaReal.EdFiltroKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BitBuscar.Click;
end;

procedure TFrmMantenimientoGarantiaReal.CbTipoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           EdFiltro.SetFocus;
end;

end.
