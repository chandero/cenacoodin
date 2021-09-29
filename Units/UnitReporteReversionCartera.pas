unit UnitReporteReversionCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses, DBCtrls, ComCtrls;

type
  TfrmReporteReversionCartera = class(TForm)
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdCerrar: TBitBtn;
    IBQuery: TIBQuery;
    GroupBox1: TGroupBox;
    EdFechaInicial: TDateTimePicker;
    EdFechaFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Reporte: TprTxReport;
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReporteReversionCartera: TfrmReporteReversionCartera;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales;

procedure TfrmReporteReversionCartera.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteReversionCartera.cmdProcesarClick(Sender: TObject);
begin
      with IBQuery do begin
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('"col$colocacion".ID_PERSONA,');
        SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
        SQL.Add('"col$reversioncartera".ID_AGENCIA,');
        SQL.Add('"col$reversioncartera".ID_COLOCACION,');
        SQL.Add('"col$reversioncartera".FECHA_REVERSION,');
        SQL.Add('"col$reversioncartera".HORA_REVERSION,');
        SQL.Add('"col$reversioncartera".FECHA_EXTRACTO,');
        SQL.Add('"col$reversioncartera".CBTE_REVERSADO,');
        SQL.Add('"col$reversioncartera".ID_CBTE_COLOCACION,');
        SQL.Add('"col$reversioncartera".ID_EMPLEADO,');
        SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
        SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
        SQL.Add('"gen$empleado".NOMBRE,');
        SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
        SQL.Add('"gen$persona".PRIMER_APELLIDO,');
        SQL.Add('"gen$persona".NOMBRE');
        SQL.Add('FROM');
        SQL.Add('"col$reversioncartera"');
        SQL.Add('INNER JOIN "col$colocacion" ON ("col$reversioncartera".ID_COLOCACION="col$colocacion".ID_COLOCACION)');
        SQL.Add('INNER JOIN "gen$empleado" ON ("col$reversioncartera".ID_EMPLEADO="gen$empleado".ID_EMPLEADO)');
        SQL.Add('INNER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
        SQL.Add('AND ("col$colocacion".ID_PERSONA="gen$persona".ID_PERSONA)');
        SQL.Add('WHERE');
        SQL.Add('("col$reversioncartera".FECHA_REVERSION BETWEEN :FECHA1 AND :FECHA2)');
        SQL.Add('order by "col$reversioncartera".FECHA_REVERSION');
        ParamByName('FECHA1').AsDate := EdFechaInicial.Date;
        ParamByName('FECHA2').AsDate := EdFechaFinal.Date;
        Open;
      end;

      Reporte.Variables.ByName['FechaI'].AsDateTime  := EdFechaInicial.Date;
      Reporte.Variables.ByName['FechaF'].AsDateTime := EdFechaFinal.Date;
      if Reporte.PrepareReport then
        Reporte.PreviewPreparedReport(True);
end;

procedure TfrmReporteReversionCartera.FormCreate(Sender: TObject);
begin
        with IBQuery do
        begin
         if Transaction.InTransaction then
           Transaction.Rollback;
         Transaction.StartTransaction;
        end;

end;

procedure TfrmReporteReversionCartera.FormShow(Sender: TObject);
begin
        EdFechaInicial.Date := fFechaActual;
        EdFechaFinal.Date := fFechaActual;
end;

procedure TfrmReporteReversionCartera.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
