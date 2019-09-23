unit UnitInformeColocacionListadoGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses;

type
  TfrmInformeColocacionesListadoGeneral = class(TForm)
    Grupo: TRadioGroup;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBQuerycolocacion: TIBQuery;
    Report: TprTxReport;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeColocacionesListadoGeneral: TfrmInformeColocacionesListadoGeneral;

implementation

{$R *.dfm}

uses UnitdmGeneral, UnitGlobales;

procedure TfrmInformeColocacionesListadoGeneral.CmdCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeColocacionesListadoGeneral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := caFree;
end;

procedure TfrmInformeColocacionesListadoGeneral.CmdGrabarClick(
  Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
        with IBQuerycolocacion do
        begin
             SQL.Clear;
             SQL.Add('SELECT "col$colocacion".ID_COLOCACION, "col$colocacion".ID_PERSONA, "gen$persona".NOMBRE,');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
             SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
             SQL.Add('"col$lineas".DESCRIPCION_LINEA,"col$inversion".DESCRIPCION_INVERSION,');
             SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,"col$garantia".DESCRIPCION_GARANTIA,');
             SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".VALOR_DESEMBOLSO,');
             SQL.Add('"col$colocacion".PLAZO_COLOCACION,"col$colocacion".FECHA_VENCIMIENTO,');
             SQL.Add('"col$colocacion".TIPO_INTERES,"col$tasavariables".DESCRIPCION_TASA,');
             SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,"col$colocacion".TASA_INTERES_MORA,');
             SQL.Add('"col$colocacion".PUNTOS_INTERES,"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
             SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".AMORTIZA_INTERES,');
             SQL.Add('"col$colocacion".PERIODO_GRACIA,"col$colocacion".VALOR_CUOTA, "col$colocacion".ABONOS_CAPITAL,');
             SQL.Add('"col$colocacion".FECHA_CAPITAL,"col$colocacion".FECHA_INTERES,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
             SQL.Add('"gen$empleado".NOMBRE AS NOMBRE1');
             SQL.Add('FROM ');
             SQL.Add('"col$colocacion" INNER JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "gen$tiposidentificacion" ON ("gen$persona".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
             SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
             SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION)');
             SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO)');
             SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
             SQL.Add('LEFT OUTER JOIN "col$tasavariables" ON ("col$colocacion".ID_INTERES = "col$tasavariables".ID_INTERES)');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("col$colocacion".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO) ');
        end;

        case Grupo.ItemIndex of
             0: IBQuerycolocacion.SQL.Add(' order by "col$colocacion".ID_COLOCACION');
             1: IBQuerycolocacion.SQL.Add(' order by "col$colocacion".ID_PERSONA');
             2: IBQuerycolocacion.SQL.Add(' order by "gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO');
             3: IBQuerycolocacion.SQL.Add(' order by "gen$persona".NOMBRE, "gen$persona".PRIMER_APELLIDO');
             4: IBQuerycolocacion.SQL.Add(' order by "col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".ID_COLOCACION');
             5: IBQuerycolocacion.SQL.Add(' order by "col$colocacion".FECHA_VENCIMIENTO,"col$colocacion".ID_COLOCACION');
        end;

        IBQuerycolocacion.Open;
        Report.Variables.ByName['Empresa'].AsString := Empresa;
        Report.Variables.ByName['Hoy'].AsDateTime := Date;
        Report.Variables.ByName['Agencia'].AsString := Ciudad;
        if Report.PrepareReport then
                Report.PreviewPreparedReport(true);
        IBQuerycolocacion.Close;
end;

end.
