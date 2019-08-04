unit UnitRCarteraAbogados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses, DBCtrls;

type
  TfrmRCarteraAbogados = class(TForm)
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdCerrar: TBitBtn;
    IBQuery: TIBQuery;
    GroupBox1: TGroupBox;
    DBLCBAbogado: TDBLookupComboBox;
    chkTodos: TCheckBox;
    DSAbogados: TDataSource;
    IBQAbogados: TIBQuery;
    rg1: TRadioGroup;
    Reporte: TprTxReport;
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRCarteraAbogados: TfrmRCarteraAbogados;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales;

procedure TfrmRCarteraAbogados.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmRCarteraAbogados.cmdProcesarClick(Sender: TObject);
begin
        with IBQuery do begin

        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('  "col$colocacionabogado".ID_AGENCIA,');
        SQL.Add('  "col$colocacionabogado".ID_COLOCACION,');
        SQL.Add('  ("gen$persona1".NOMBRE || '' '' ||');
        SQL.Add('  "gen$persona1".PRIMER_APELLIDO || '' '' ||');
        SQL.Add('  "gen$persona1".SEGUNDO_APELLIDO ) AS NOMBRE1,');
        SQL.Add('  ("gen$persona".NOMBRE || '' '' ||');
        SQL.Add('  "gen$persona".PRIMER_APELLIDO || '' '' ||');
        SQL.Add('  "gen$persona".SEGUNDO_APELLIDO) AS NOMBRE,');
        SQL.Add('  "col$colocacionabogado".ID_IDENTIFICACION,');
        SQL.Add('  "col$colocacionabogado".ID_PERSONA,');
        SQL.Add('  "col$colocacion".VALOR_DESEMBOLSO,');
        SQL.Add('  "col$colocacion".ABONOS_CAPITAL,');
        SQL.Add('  "col$colocacionabogado".ID_ABOGADO,');
        SQL.Add('  SUM("col$costas".VALOR_COSTAS) AS COSTAS,');
        SQL.Add('  "col$colocacion".FECHA_INTERES,');
        SQL.Add('  "col$estado".DESCRIPCION_ESTADO_COLOCACION AS DESCRIPCION');
        SQL.Add('FROM');
        SQL.Add('  "col$colocacionabogado"');
        SQL.Add('  INNER JOIN "col$colocacion" ON ("col$colocacionabogado".ID_AGENCIA = "col$colocacion".ID_AGENCIA)');
        SQL.Add('  AND ("col$colocacionabogado".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
        SQL.Add('  INNER JOIN "gen$persona" "gen$persona1" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona1".ID_IDENTIFICACION)');
        SQL.Add('  AND ("col$colocacion".ID_PERSONA = "gen$persona1".ID_PERSONA)');
        SQL.Add('  INNER JOIN "gen$persona" ON ("col$colocacionabogado".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
        SQL.Add('  AND ("col$colocacionabogado".ID_PERSONA = "gen$persona".ID_PERSONA)');
        SQL.Add('  LEFT OUTER JOIN "col$costas" ON ("col$colocacion".ID_AGENCIA = "col$costas".ID_AGENCIA');
        SQL.Add('  AND "col$colocacion".ID_COLOCACION = "col$costas".ID_COLOCACION)');
        SQL.Add('  INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
        SQL.Add('where');
        SQL.Add('  "col$colocacionabogado".ID_ABOGADO BETWEEN :ID_ABOGADO1 and :ID_ABOGADO2');
        case rg1.ItemIndex of
         0: SQL.Add('  and "col$colocacion".ID_ESTADO_COLOCACION IN(0,1,2,3,8,9)');
         1: SQL.Add('  and "col$colocacion".ID_ESTADO_COLOCACION = 2');
         2: SQL.Add('  and "col$colocacion".ID_ESTADO_COLOCACION = 3');
        end;
        SQL.Add('  ');
        SQL.Add('group by');
        SQL.Add('  "col$colocacionabogado".ID_AGENCIA,');
        SQL.Add('  "col$colocacionabogado".ID_COLOCACION,');
        SQL.Add('  "gen$persona1".NOMBRE,');
        SQL.Add('  "gen$persona1".PRIMER_APELLIDO,');
        SQL.Add('  "gen$persona1".SEGUNDO_APELLIDO,');
        SQL.Add('  "gen$persona".NOMBRE,');
        SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
        SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
        SQL.Add('  "col$colocacionabogado".ID_IDENTIFICACION,');
        SQL.Add('  "col$colocacionabogado".ID_PERSONA,');
        SQL.Add('  "col$colocacion".VALOR_DESEMBOLSO,');
        SQL.Add('  "col$colocacion".ABONOS_CAPITAL,');
        SQL.Add('  "col$colocacionabogado".ID_ABOGADO,');
        SQL.Add('  "col$colocacion".FECHA_INTERES,');
        SQL.Add('  "col$estado".DESCRIPCION_ESTADO_COLOCACION');
        SQL.Add('order by');
        SQL.Add(' "col$colocacionabogado".ID_ABOGADO,"col$colocacionabogado".ID_AGENCIA, "col$colocacionabogado".ID_COLOCACION');
        if  chkTodos.Checked then
        begin
           ParamByName('ID_ABOGADO1').AsInteger := 0;
           ParamByName('ID_ABOGADO2').AsInteger := 99;
        end
        else
        begin
           ParamByName('ID_ABOGADO1').AsInteger := DBLCBAbogado.KeyValue;
           ParamByName('ID_ABOGADO2').AsInteger := DBLCBAbogado.KeyValue;
        end;

      end;

      Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
      Reporte.Variables.ByName['NIT'].AsString := Nit;
      case rg1.ItemIndex of
      0: Reporte.Variables.ByName['ESTADO'].AsString := 'TODOS';
      1: Reporte.Variables.ByName['ESTADO'].AsString := 'JUDICIAL';
      2: Reporte.Variables.ByName['ESTADO'].AsString := 'CASTIGADA';
      end;

        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);
end;

procedure TfrmRCarteraAbogados.FormCreate(Sender: TObject);
begin
        with IBQAbogados do
        begin
         if Transaction.InTransaction then
           Transaction.Rollback;
         Transaction.StartTransaction;
         Open;
         Last;
        end;

end;

end.
