unit UnitInformeCreditosBancoldex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, JvLabel, JvBlinkingLabel, DBClient;

type
  TfrmInformeCreditosBancoldex = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    IBQuery2: TClientDataSet;
    IBQuery2ID_AGENCIA: TIntegerField;
    IBQuery2ID_COLOCACION: TStringField;
    IBQuery2CUENTA: TIntegerField;
    IBQuery2ID_PERSONA: TStringField;
    IBQuery2ASOCIADO: TStringField;
    Todos: TCheckBox;
    Fecha: TCheckBox;
    Label7: TLabel;
    EdFechaInicial: TDateTimePicker;
    EdFechaFinal: TDateTimePicker;
    Label1: TLabel;
    IBQuery2CLASIFICACION: TStringField;
    IBQuery2CALIFICACION: TStringField;
    IBQuery2PLAZO: TIntegerField;
    IBQuery2GARANTIA: TStringField;
    IBQuery2VALOR: TCurrencyField;
    IBQuery2SALDO: TCurrencyField;
    IBQuery2ESTADO: TIntegerField;
    IBQuery2DES_ESTADO: TStringField;
    Activos: TCheckBox;
    IBQuery2LINEA: TStringField;
    IBQuery2OBLIGACION: TStringField;
    InformeDiario: TprTxReport;
    procedure EdFechaInformeExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure EdFechaInformeKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAceptarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FechaClick(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure ActivosClick(Sender: TObject);
  private
    procedure Empleado;
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeCreditosBancoldex: TfrmInformeCreditosBancoldex;
  FechaInforme : TDate;
  Usuario : string;
  AliasUsuario : string;

implementation

{$R *.dfm}

uses  UnitDmGeneral, UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeCreditosBancoldex.EdFechaInformeExit(
  Sender: TObject);
begin
        FechaInforme := fFechaActual;
end;

procedure TfrmInformeCreditosBancoldex.CmdAceptarClick(Sender: TObject);
var
frmVistaPreliminar:TfrmVistaPreliminar;
Tabla : String;
begin
        CmdAceptar.Enabled := False;
        Empleado;
        If DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$infbancoldex".ID_AGENCIA,');
          SQL.Add('"col$infbancoldex".ID_COLOCACION,');
          SQL.Add('"col$infbancoldex".ID_IDENTIFICACION,');
          SQL.Add('"col$infbancoldex".ID_PERSONA,');
          SQL.Add('"col$infbancoldex".LINEA_BANCOLDEX,');
          SQL.Add('"col$infbancoldex".NO_BANCOLDEX,');
          SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          SQL.Add('"col$colocacion".NUMERO_CUENTA,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"col$colocacion".ID_EVALUACION,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".PLAZO_COLOCACION,');
          SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
          SQL.Add('FROM "col$infbancoldex"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$infbancoldex".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$infbancoldex".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$colocacion" ON ("col$infbancoldex".ID_AGENCIA="col$colocacion".ID_AGENCIA)');
          SQL.Add('AND ("col$infbancoldex".ID_COLOCACION="col$colocacion".ID_COLOCACION)');
          SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA="col$garantia".ID_GARANTIA)');
          SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION="col$clasificacion".ID_CLASIFICACION)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION="col$estado".ID_ESTADO_COLOCACION)');
          if Fecha.Checked = True then begin
            SQL.Add('WHERE FECHA_DESEMBOLSO BETWEEN :FECHA1 AND :FECHA2');
            ParamByName('FECHA1').AsDate := EdFechaInicial.Date;
            ParamByName('FECHA2').AsDate := EdFechaFinal.Date;
          end;
          if Activos.Checked = True then begin
            SQL.Add('WHERE VALOR_DESEMBOLSO - ABONOS_CAPITAL > 0');
          end;
          SQL.Add('AND "col$colocacion".ID_ESTADO_COLOCACION NOT IN (5)');

          SQL.Add('ORDER BY LINEA_BANCOLDEX,NO_BANCOLDEX ASC');
          Open;

          while not Eof do begin
            IBQuery2.Append;
            IBQuery2.FieldByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
            IBQuery2.FieldByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
            IBQuery2.FieldByName('CUENTA').AsInteger := IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger;
            IBQuery2.FieldByName('ID_PERSONA').AsString := IBQuery1.fieldbyname('ID_PERSONA').AsString;
            IBQuery2.FieldByName('ASOCIADO').AsString := Trim(IBQuery1.FieldByName('NOMBRE').AsString) + ' '
                                                         + Trim(IBQuery1.FieldByName('PRIMER_APELLIDO').AsString) + ' '
                                                         + Trim(IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString);
            IBQuery2.FieldByName('CLASIFICACION').AsString := IBQuery1.FieldByName('DESCRIPCION_CLASIFICACION').AsString;
            IBQuery2.FieldByName('CALIFICACION').AsString := IBQuery1.FieldByName('ID_EVALUACION').AsString;
            IBQuery2.FieldByName('PLAZO').AsInteger := IBQuery1.FieldByName('PLAZO_COLOCACION').AsInteger;
            IBQuery2.FieldByName('GARANTIA').AsString := IBQuery1.FieldByName('DESCRIPCION_GARANTIA').AsString;
            IBQuery2.FieldByName('VALOR').AsCurrency := IBQuery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
            IBQuery2.FieldByName('SALDO').AsCurrency := IBQuery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency - IBQuery1.FieldByName('ABONOS_CAPITAL').AsCurrency;
            IBQuery2.FieldByName('ESTADO').AsInteger := IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger;
            IBQuery2.FieldByName('DES_ESTADO').AsString := IBQuery1.FIELDBYNAME('DESCRIPCION_ESTADO_COLOCACION').AsString;
            IBQuery2.FieldByName('LINEA').AsString := IBQuery1.FieldByName('LINEA_BANCOLDEX').AsString;
            IBQuery2.FieldByName('OBLIGACION').AsString := IBQuery1.FIELDBYNAME('NO_BANCOLDEX').AsString;
            IBQuery2.Post;
            IBQuery1.Next;
           end;
        end;

        InformeDiario.Variables.ByName['Empresa'].AsString := Empresa;
        InformeDiario.Variables.ByName['Nit'].AsString := Nit;
        InformeDiario.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
        InformeDiario.Variables.ByName['usuario'].AsString := 'Todos';
        InformeDiario.Variables.ByName['Hoy'].AsDateTime := fFechaActual;

        If InformeDiario.PrepareReport then
         begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := InformeDiario;
           frmVistaPreliminar.ShowModal;
         end;
       Inicializar;
end;

procedure TfrmInformeCreditosBancoldex.Empleado;
begin
        with IBQuery do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Usuario := Nombres + ' ' + Apellidos;
           Close;
         end;
end;

procedure TfrmInformeCreditosBancoldex.EdFechaInformeKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCreditosBancoldex.CmdAceptarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCreditosBancoldex.CmdCerrarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCreditosBancoldex.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmInformeCreditosBancoldex.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmInformeCreditosBancoldex.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCreditosBancoldex.FechaClick(Sender: TObject);
begin
        if Fecha.Checked then begin
          EdFechaInicial.Enabled := True;
          EdFechaFinal.Enabled := True;
          Activos.Checked := False;
          Todos.Checked := False;
        end
        else begin
          EdFechaInicial.Enabled := False;
          EdFechaFinal.Enabled := False;
        end;
end;

procedure TfrmInformeCreditosBancoldex.Inicializar;
begin
        Fecha.Checked := False;
        Todos.Checked := False;
        Activos.Checked := False;
        EdFechaInicial.Date := fFechaActual;
        EdFechaFinal.Date := fFechaActual;
        CmdAceptar.Enabled := True;
        IBQuery2.EmptyDataSet;

        If DmGeneral.IBTransaction1.InTransaction then
          DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;
end;

procedure TfrmInformeCreditosBancoldex.TodosClick(Sender: TObject);
begin
        if Todos.Checked = True then
         begin
           Fecha.Checked := False;
           EdFechaInicial.Enabled := False;
           EdFechaFinal.Enabled := False;
           Activos.Checked := False;
         end;
end;

procedure TfrmInformeCreditosBancoldex.ActivosClick(Sender: TObject);
begin
        if Activos.Checked = True then
         begin
           Fecha.Checked := False;
           EdFechaInicial.Enabled := False;
           EdFechaFinal.Enabled := False;
           Todos.Checked := False;
         end;
end;

end.
