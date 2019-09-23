unit UnitInformeGralColocaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, pr_Common, pr_TxClasses, DBClient,
  UnitDmGeneral;

type
  TfrmInformeGralColocaciones = class(TForm)
    Panel1: TPanel;
    Label7: TLabel;
    EdFechaInicial: TDateTimePicker;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    Label1: TLabel;
    EdFechaFinal: TDateTimePicker;
    IBQuery3: TIBQuery;
    IBQuery4: TIBQuery;
    IBQTabla: TClientDataSet;
    IBQTablaDESCRIPCION_AGENCIA: TStringField;
    IBQTablaCOLOCACION: TStringField;
    IBQTablaCUENTA: TIntegerField;
    IBQTablaFECHA_APERT: TDateField;
    IBQTablaNIT: TStringField;
    IBQTablaNOMBRE: TStringField;
    IBQTablaPRIMER_APELLIDO: TStringField;
    IBQTablaSEGUNDO_APELLIDO: TStringField;
    IBQTablaVALOR: TCurrencyField;
    IBQTablaPLAZO: TIntegerField;
    IBQTablaTASA: TFloatField;
    IBQTablaPUNTOS: TFloatField;
    IBQTablaAMORTIZAK: TIntegerField;
    IBQTablaAMORTIZAI: TIntegerField;
    IBQTablaSALDO: TCurrencyField;
    IBQTablaCAPITAL_PAGO_HASTA: TDateField;
    IBQTablaINTERES_PAGO_HASTA: TDateField;
    IBQTablaESTADO: TStringField;
    InformeColocaciones: TprTxReport;
    Label2: TLabel;
    Label3: TLabel;
    procedure EdFechaInicialEnter(Sender: TObject);
    procedure EdFechaInicialKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdFechaFinalEnter(Sender: TObject);
    procedure EdFechaFinalKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Empleado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeGralColocaciones: TfrmInformeGralColocaciones;
  dmGeneral: TdmGeneral;
  TipoIdentificacion : Integer;
  Identificacion : Integer;
  colocacion : String;
  Cuenta : Integer;
  FechaInicial : TDate;
  FechaFinal : TDate;
implementation

{$R *.dfm}

uses  UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeGralColocaciones.EdFechaInicialEnter(Sender: TObject);
begin
        EdFechaInicial.Date := Date;
end;

procedure TfrmInformeGralColocaciones.EdFechaInicialKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeGralColocaciones.CmdAceptarClick(Sender: TObject);
var
frmVistaPreliminar : TfrmVistaPreliminar;
Tabla : String;
begin

        Empleado;

        with IBQuery4 do
         begin
           SQL.Clear;
           SQL.Add('SELECT *');
           SQL.Add('FROM P_COL_0002 (:FECHA1,:FECHA2)');
           ParamByName('FECHA1').AsDate := EdFechaInicial.Date;
           ParamByName('FECHA2').AsDate := EdFechaFinal.Date;
           Open;
           IBQuery4.RecordCount;           
           while not Eof do
           begin
             Label3.Caption := FieldByName('ID_COLOCACION').AsString;
             Application.ProcessMessages;
             IBQuery2.SQL.Clear;
             IBQuery2.Sql.Add('select distinct');
             IBQuery2.Sql.Add('"cap$maestrotitular".NUMERO_CUENTA,');
             IBQuery2.Sql.Add('"cap$maestrotitular".DIGITO_CUENTA,');
             IBQuery2.SQL.Add('"cap$maestro".ID_ESTADO,');
             IBQuery2.SQL.Add('"cap$tiposestado".SE_SUMA');
             IBQuery2.Sql.Add('from "cap$maestrotitular"');
             IBQuery2.SQL.Add('inner join "cap$maestro" on ');
             IBQuery2.SQL.Add('("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and ');
             IBQuery2.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and ');
             IBQuery2.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and ');
             IBQuery2.SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
             IBQuery2.SQL.Add('inner join "cap$tiposestado" on ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
             IBQuery2.Sql.Add('where');
             IBQuery2.Sql.Add('"cap$maestrotitular".ID_IDENTIFICACION =:"ID_IDENTIFICACION" and');
             IBQuery2.Sql.Add('"cap$maestrotitular".ID_PERSONA =:"ID_PERSONA" and ');
             IBQuery2.Sql.Add('"cap$maestrotitular".ID_TIPO_CAPTACION =:"ID_TIPO_CAPTACION" and ');
             IBQuery2.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR =:"NUMERO_TITULAR" and ');
             IBQuery2.SQL.Add('"cap$maestrotitular".TIPO_TITULAR = 1 and');
             IBQuery2.SQL.Add('"cap$tiposestado".SE_SUMA = 1');
             IBQuery2.Sql.Add('order by "cap$maestrotitular".NUMERO_TITULAR');
             IBQuery2.ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery4.Fieldbyname('ID_IDENTIFICACION').AsInteger;
             IBQuery2.ParamByName('ID_PERSONA').AsString := Trim(IBQuery4.FieldByName('ID_PERSONA').AsString);
             IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
             IBQuery2.ParamByName('NUMERO_TITULAR').AsInteger := 1;
             IBQuery2.Open;


             IBQuery3.SQL.Clear;
             IBQuery3.sql.Add('select');
             IBQuery3.Sql.Add('SUM("col$extracto".ABONO_CAPITAL) as ABONOS');
             IBQuery3.Sql.Add('from "col$extracto"');
             IBQuery3.Sql.Add('INNER JOIN "col$colocacion"');
             IBQuery3.Sql.Add('ON ("col$extracto".ID_AGENCIA = "col$colocacion".ID_AGENCIA) and');
             IBQuery3.Sql.Add('("col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
             IBQuery3.SQL.Add('Where ');
             IBQuery3.SQL.Add('("col$extracto".ID_COLOCACION = :ID_COLOCACION) and');
             IBQuery3.SQL.Add('("col$extracto".FECHA_EXTRACTO >= :FECHA_INICIAL and');
             IBQuery3.SQL.Add('"col$extracto".FECHA_EXTRACTO <= :FECHA_FINAL)');
             IBQuery3.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
             IBQuery3.ParamByName('FECHA_INICIAL').AsDate := EdFechaInicial.Date;
             IBQuery3.ParamByName('FECHA_FINAL').AsDate := EdFechaFinal.Date;
             IBQuery3.Open;
             IBQuery3.RecordCount;


             IBQTabla.Append;
             IBQTabla.FieldByName('DESCRIPCION_AGENCIA').AsString := FieldByName('DESCRIPCION_AGENCIA').AsString;
             IBQTabla.FieldByName('COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
             IBQTabla.FieldByName('CUENTA').AsInteger := IBQuery2.FieldByName('NUMERO_CUENTA').AsInteger;
             IBQTabla.FieldByName('FECHA_APERT').AsDateTime := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
             IBQTabla.FieldByName('NIT').AsString  := FieldByName('ID_PERSONA').AsString;
             IBQTabla.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
             IBQTabla.FieldByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
             IBQTabla.FieldByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
             IBQTabla.FieldByName('VALOR').AsInteger := FieldByName('VALOR_DESEMBOLSO').AsInteger;
             IBQTabla.FieldByName('PLAZO').AsInteger := FieldByName('PLAZO_COLOCACION').AsInteger;
             IBQTabla.FieldByName('TASA').AsFloat := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
             IBQTabla.FieldByName('PUNTOS').AsFloat := FieldByName('PUNTOS_INTERES').AsFloat;
             IBQTabla.FieldByName('AMORTIZAK').AsInteger := FieldByName('AMORTIZA_CAPITAL').AsInteger;
             IBQTabla.FieldByName('AMORTIZAI').AsInteger := FieldByName('AMORTIZA_INTERES').AsInteger;
             IBQTabla.FieldByName('ESTADO').AsString := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
             IBQTabla.FieldByName('SALDO').AsInteger := FieldByName('SALDO_ACTUAL').AsInteger;
             IBQTabla.FieldByName('CAPITAL_PAGO_HASTA').AsDateTime := FieldByName('FECHA_CAPITAL').AsDateTime;
             IBQTabla.FieldByName('INTERES_PAGO_HASTA').AsDateTime := FieldByName('FECHA_INTERES').AsDateTime;
             IBQTabla.Post;
           Next;
           end;
           IBQuery2.Close;
           Ibquery3.Close;
           Close;
         end;

           InformeColocaciones.Variables.ByName['Empresa'].AsString := Empresa;
           InformeColocaciones.Variables.ByName['Nit'].AsString := Nit;
           InformeColocaciones.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
           InformeColocaciones.Variables.ByName['Hoy'].AsDateTime := Date;

           If InformeColocaciones.PrepareReport then
            begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := InformeColocaciones;
              frmVistaPreliminar.ShowModal;
            end;


end;

procedure TfrmInformeGralColocaciones.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Commit;
        DmGeneral.IBTransaction1.StartTransaction;
        EdFechaInicial.Date := fFechaActual;
        EdFechaFinal.Date := fFechaActual;
        
end;

procedure TfrmInformeGralColocaciones.Empleado;
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

procedure TfrmInformeGralColocaciones.EdFechaFinalEnter(
  Sender: TObject);
begin
        EdFechaFinal.Date := Date;
end;

procedure TfrmInformeGralColocaciones.EdFechaFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeGralColocaciones.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeGralColocaciones.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;


        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBQuery3.Database := dmGeneral.IBDatabase1;
        IBQuery4.Database := dmGeneral.IBDatabase1;

        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBQuery3.Transaction := dmGeneral.IBTransaction1;
        IBQuery4.Transaction := dmGeneral.IBTransaction1;
end;

end.
