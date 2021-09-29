unit UnitInformeDiarioDesembolsos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, pr_Common, pr_TxClasses, pr_Parser,
  DB, IBCustomDataSet, IBQuery, UnitDmGeneral;

type
  TfrmInformeDiarioDesembolsos = class(TForm)
    Panel1: TPanel;
    Label7: TLabel;
    EdFechaInforme: TDateTimePicker;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    InformeDiario: TprTxReport;
    procedure EdFechaInformeEnter(Sender: TObject);
    procedure EdFechaInformeKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAceptarKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaInformeExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InformeDiarioUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Empleado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeDiarioDesembolsos: TfrmInformeDiarioDesembolsos;
  dmGeneral: TdmGeneral;
  FechaCorte : TDate;
implementation

{$R *.dfm}

uses  UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeDiarioDesembolsos.EdFechaInformeEnter(
  Sender: TObject);
begin
        EdFechaInforme.Date := Date;
end;

procedure TfrmInformeDiarioDesembolsos.EdFechaInformeKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDiarioDesembolsos.CmdAceptarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDiarioDesembolsos.EdFechaInformeExit(Sender: TObject);
begin
        FechaCorte := EdFechaInforme.Date;
end;

procedure TfrmInformeDiarioDesembolsos.CmdAceptarClick(Sender: TObject);
var
frmVistaPreliminar:TfrmVistaPreliminar;
TipoCuota : string;
begin
        Empleado;
        with IBQuery1 do
         begin
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('"col$colocacion".ID_AGENCIA,');
           SQL.Add('"col$colocacion".ID_COLOCACION,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
           SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
           SQL.Add('"col$colocacion".PLAZO_COLOCACION,');
           SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
           SQL.Add('"col$tasasvariables".DESCRIPCION_TASA,');
           SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
           SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
           SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
           SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
           SQL.Add('"col$colocacion".NOTA_CONTABLE,');
           SQL.Add('"col$colocacion".NUMERO_CUENTA,');
           SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
           SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
           SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
           SQL.Add('"gen$persona".NOMBRE,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
           SQL.Add(' FROM ');
           SQL.Add('"col$colocacion" ');
           SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION) ');
           SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO) ');
           SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION) ');
           SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA) ');
           SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA) ');
           SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
           SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
           SQL.Add('LEFT OUTER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) ');
           SQL.Add(' WHERE ');
           SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
           SQL.Add('(FECHA_DESEMBOLSO = :"FECHA_DESEMBOLSO") AND');
           SQL.Add('(ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION")');
           SQL.Add('order by "col$colocacion".ID_COLOCACION');

           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('FECHA_DESEMBOLSO').AsDate := FechaCorte;
           ParamByName('ID_ESTADO_COLOCACION').AsInteger := 0; //VIGENTE
           Open;

           InformeDiario.Variables.ByName['Empresa'].AsString := Empresa;
           InformeDiario.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
           InformeDiario.Variables.ByName['Hoy'].AsDateTime := FechaCorte;

           If InformeDiario.PrepareReport then
            begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := InformeDiario;
              frmVistaPreliminar.ShowModal;
            end;
         Close;
         end;
end;

procedure TfrmInformeDiarioDesembolsos.Empleado;
begin
        with IBQuery2 do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
         end;
end;

procedure TfrmInformeDiarioDesembolsos.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeDiarioDesembolsos.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;
end;

procedure TfrmInformeDiarioDesembolsos.InformeDiarioUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var
TipoCuota : String;
begin
    if (VarName = 'TipoCuota') then
     begin
       if IBQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger = 1 then
        TipoCuota := 'FIJA'
       else if IBQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger = 2 then
        TipoCuota := 'V. ANT.'
       else if IBQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger = 3 then
        TipoCuota := 'V. VEN.';

       _vSetAsString(Value,TipoCuota);
       IsProcessed := True;
     end;
end;

procedure TfrmInformeDiarioDesembolsos.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;

end;

procedure TfrmInformeDiarioDesembolsos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.


