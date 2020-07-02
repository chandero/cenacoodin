unit UnitReporteCambioEstadoColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses, DBCtrls, ComCtrls, IBSQL, pr_Parser;

type
  TfrmReporteCambioEstadoColocacion = class(TForm)
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdCerrar: TBitBtn;
    IBQuery: TIBQuery;
    GroupBox1: TGroupBox;
    EdFechaInicial: TDateTimePicker;
    EdFechaFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    IBSQL1: TIBSQL;
    Reporte: TprTxReport;
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ReporteUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReporteCambioEstadoColocacion: TfrmReporteCambioEstadoColocacion;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales;

procedure TfrmReporteCambioEstadoColocacion.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteCambioEstadoColocacion.cmdProcesarClick(Sender: TObject);
begin
      with IBQuery do begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('"col$cambioestado".ID_AGENCIA,');
        SQL.Add('"col$cambioestado".ID_COLOCACION,');
        SQL.Add('"col$cambioestado".FECHA_CAMBIO,');
        SQL.Add('"col$cambioestado".ID_ESTADO_ACTUAL,');
        SQL.Add('"col$cambioestado".ID_ESTADO_NUEVO,');
        SQL.Add('"col$cambioestado".SALDO,');
        SQL.Add('"col$cambioestado".FECHA_CAPITAL,');
        SQL.Add('"col$cambioestado".FECHA_INTERES,');
        SQL.Add('"gen$persona".NOMBRE,');
        SQL.Add('"gen$persona".PRIMER_APELLIDO,');
        SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
        SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
        SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
        SQL.Add('"gen$empleado".NOMBRE,');
        SQL.Add('"col$colocacion".ID_PERSONA,');
        SQL.Add('"col$colocacion".ID_IDENTIFICACION');
        SQL.Add('FROM "col$cambioestado"');
        SQL.Add('INNER JOIN "col$colocacion" ON ("col$cambioestado".ID_AGENCIA="col$colocacion".ID_AGENCIA)');
        SQL.Add('AND ("col$cambioestado".ID_COLOCACION="col$colocacion".ID_COLOCACION)');
        SQL.Add('INNER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
        SQL.Add('AND ("col$colocacion".ID_PERSONA="gen$persona".ID_PERSONA)');
        SQL.Add('INNER JOIN "gen$empleado" ON ("col$cambioestado".ID_EMPLEADO="gen$empleado".ID_EMPLEADO)');
        SQL.Add('INNER JOIN "col$estado" ON ("col$cambioestado".ID_ESTADO_ACTUAL="col$estado".ID_ESTADO_COLOCACION)');
        SQL.Add('INNER JOIN "col$estado" ON ("col$cambioestado".ID_ESTADO_NUEVO="col$estado".ID_ESTADO_COLOCACION)');
        SQL.Add('where');
        SQL.Add('("col$cambioestado".FECHA_CAMBIO BETWEEN :FECHA1 AND :FECHA2)');
        SQL.Add('order by "col$cambioestado".FECHA_CAMBIO, "col$cambioestado".ID_COLOCACION');
        ParamByName('FECHA1').AsDate := EdFechaInicial.Date;
        ParamByName('FECHA2').AsDate := EdFechaFinal.Date;
        Open;
      end;

      Reporte.Variables.ByName['FechaI'].AsDateTime  := EdFechaInicial.Date;
      Reporte.Variables.ByName['FechaF'].AsDateTime := EdFechaFinal.Date;
      if Reporte.PrepareReport then
        Reporte.PreviewPreparedReport(True);
end;

procedure TfrmReporteCambioEstadoColocacion.FormCreate(Sender: TObject);
begin
        with IBQuery do
        begin
         if Transaction.InTransaction then
           Transaction.Rollback;
         Transaction.StartTransaction;
        end;

end;

procedure TfrmReporteCambioEstadoColocacion.FormShow(Sender: TObject);
begin
        EdFechaInicial.Date := fFechaActual;
        EdFechaFinal.Date := fFechaActual;
end;

procedure TfrmReporteCambioEstadoColocacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmReporteCambioEstadoColocacion.ReporteUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
begin
        if VarName = 'ESTADOA' then begin
                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('SELECT DESCRIPCION_ESTADO_COLOCACION FROM "col$estado" where ID_ESTADO_COLOCACION = :ID');
                IBSQL1.ParamByName('ID').AsInteger := IBQuery.FieldByName('ID_ESTADO_ACTUAL').AsInteger;
                IBSQL1.ExecQuery;
                _vSetAsstring(Value,IBSQL1.FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString);
                IsProcessed := True;
        end;

        if VarName = 'ESTADON' then begin
                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('SELECT DESCRIPCION_ESTADO_COLOCACION FROM "col$estado" where ID_ESTADO_COLOCACION = :ID');
                IBSQL1.ParamByName('ID').AsInteger := IBQuery.FieldByName('ID_ESTADO_NUEVO').AsInteger;
                IBSQL1.ExecQuery;
                _vSetAsstring(Value,IBSQL1.FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString);
                IsProcessed := True;
        end;
end;

end.
