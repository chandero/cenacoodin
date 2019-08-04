unit UnitInformeColocacionListadoGeneralGClasificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, pr_Common, pr_TxClasses, pr_Parser, DB,
  IBCustomDataSet, IBQuery, DBCtrls;

type
  TfrmColocacionesporClasificacion = class(TForm)
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBQuerycolocacion: TIBQuery;
    Grupo: TRadioGroup;
    Report00: TprTxReport;
    Report02: TprTxReport;
    Report03: TprTxReport;
    Report04: TprTxReport;
    Report01: TprTxReport;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel2: TPanel;
    Label4: TLabel;
    CBclasificacion: TDBLookupComboBox;
    procedure CmdGrabarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Ninguno;
    procedure Clasificacion;
    procedure Linea;
    procedure Inversion;
    procedure Garantia;
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmColocacionesporClasificacion: TfrmColocacionesporClasificacion;

  vClasificacion:Integer;
  vLinea : Integer;
  vInversion : Integer;
  vRespaldo :Integer;
  vGarantia :Integer;

implementation
{$R *.dfm}

uses UnitGlobales, UnitdmGeneral, unitdmcolocacion;

procedure TfrmColocacionesporClasificacion.CmdGrabarClick(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
        with IBQuerycolocacion do
        begin
             SQL.Clear;
             SQL.Add('SELECT "col$colocacion".ID_COLOCACION, "col$colocacion".ID_PERSONA,"col$colocacion".ID_CLASIFICACION, "col$colocacion".ID_LINEA,"col$colocacion".ID_INVERSION,"col$colocacion".ID_GARANTIA, "gen$persona".NOMBRE,');
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

        IBQuerycolocacion.Open;
        case Grupo.ItemIndex of
                0: Ninguno;
                1: Clasificacion;
                2: Linea;
                3: Inversion;
                4: Garantia;
        end;
end;

procedure TfrmColocacionesporClasificacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmColocacionesporClasificacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmColocacionesporClasificacion.Ninguno;
begin
        IBQuerycolocacion.SQL.Add(' ORDER BY "col$colocacion".ID_COLOCACION ');
        IBQuerycolocacion.Open;
        Report00.Variables.ByName['Empresa'].AsString := Empresa;
        Report00.Variables.ByName['Hoy'].AsDateTime := Date;
        Report00.Variables.ByName['Agencia'].AsString := Ciudad;
        if Report00.PrepareReport then
                Report00.PreviewPreparedReport(true);
        IBQuerycolocacion.Close;
end;

procedure TfrmColocacionesporClasificacion.Clasificacion;
begin
        IBQuerycolocacion.SQL.Add(' ORDER BY "col$colocacion".ID_CLASIFICACION,"col$colocacion".ID_COLOCACION ');
        IBQuerycolocacion.Open;
        Report01.Variables.ByName['Empresa'].AsString := Empresa;
        Report01.Variables.ByName['Hoy'].AsDateTime := Date;
        Report01.Variables.ByName['Agencia'].AsString := Ciudad;
        if Report01.PrepareReport then
                Report01.PreviewPreparedReport(true);
        IBQuerycolocacion.Close;
end;

procedure TfrmColocacionesporClasificacion.Linea;
begin
        IBQuerycolocacion.SQL.Add(' ORDER BY "col$colocacion".ID_LINEA,"col$colocacion".ID_COLOCACION ');
        IBQuerycolocacion.Open;
        Report02.Variables.ByName['Empresa'].AsString := Empresa;
        Report02.Variables.ByName['Hoy'].AsDateTime := Date;
        Report02.Variables.ByName['Agencia'].AsString := Ciudad;
        if Report02.PrepareReport then
                Report02.PreviewPreparedReport(true);
        IBQuerycolocacion.Close;

end;

procedure TfrmColocacionesporClasificacion.Inversion;
begin
        IBQuerycolocacion.SQL.Add(' ORDER BY "col$colocacion".ID_INVERSION,"col$colocacion".ID_COLOCACION ');
        IBQuerycolocacion.Open;
        Report03.Variables.ByName['Empresa'].AsString := Empresa;
        Report03.Variables.ByName['Hoy'].AsDateTime := Date;
        Report03.Variables.ByName['Agencia'].AsString := Ciudad;
        if Report03.PrepareReport then
                Report03.PreviewPreparedReport(true);
        IBQuerycolocacion.Close;

end;

procedure TfrmColocacionesporClasificacion.Garantia;
begin
        IBQuerycolocacion.SQL.Add(' ORDER BY "col$colocacion".ID_GARANTIA,"col$colocacion".ID_COLOCACION ');
        IBQuerycolocacion.Open;
        Report04.Variables.ByName['Empresa'].AsString := Empresa;
        Report04.Variables.ByName['Hoy'].AsDateTime := Date;
        Report04.Variables.ByName['Agencia'].AsString := Ciudad;
        if Report04.PrepareReport then
                Report04.PreviewPreparedReport(true);
        IBQuerycolocacion.Close;

end;

procedure TfrmColocacionesporClasificacion.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
        try
          Inicializar;
        finally
        end;         
end;

procedure TfrmColocacionesporClasificacion.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmColocacionesporClasificacion.Inicializar;
begin
    vClasificacion := 1;
    vLinea := 1;
    vInversion := 1;
    vRespaldo := 1;
    vGarantia := 1;

    with dmColocacion do
     begin
       IBDSclasificacion.Active := true;
       IBDSclasificacion.Last;
       IBDSclasificacion.First;
       IBDSlinea.Active := true;
       IBDSlinea.Last;
       IBDSlinea.First;
       IBDSinversion.Active := true;
       IBDSinversion.Last;
       IBDSinversion.First;
       IBDSrespaldo.Active := true;
       IBDSrespaldo.Last;
       IBDSrespaldo.First;
       IBDSgarantia.Active := true;
       IBDSgarantia.Last;
       IBDSgarantia.First;
       IBDStipocuota.Active := true;
       IBDStipocuota.Last;
       IBDStipocuota.First;
       IBDStasavariable.Active := true;
       IBDStasavariable.Last;
       IBDStasavariable.First;
       IBDSenteaprobador.Active := true;
       IBDSenteaprobador.Last;
       IBDSenteaprobador.First;
     end;
end;

end.
