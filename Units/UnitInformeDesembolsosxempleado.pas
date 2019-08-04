unit UnitInformeDesembolsosxempleado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, JvLabel, JvBlinkingLabel, DBClient,
  FR_DSet, FR_DBSet, FR_Class, DBCtrls;

type
  TfrmInformeDesembolsosxempleado = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    GroupBox5: TGroupBox;
    Todos: TRadioButton;
    Definido: TRadioButton;
    EdEmpleado: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    EdFechaInicial: TDateTimePicker;
    Label3: TLabel;
    EdFechaFinal: TDateTimePicker;
    TipoInforme: TRadioGroup;
    Reporte: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    DSEmpleado: TDataSource;
    IBEmpleado: TIBQuery;
    Label2: TLabel;
    DBEmpleado: TDBLookupComboBox;
    InformeDiario: TprTxReport;
    IBQuery1VALOR: TIBBCDField;
    IBQuery1TOTAL: TIntegerField;
    IBQuery1FECHA_DESEMBOLSO: TDateField;
    IBQuery1ID_EMPLEADO: TIBStringField;
    IBQuery1NOMBRE: TIBStringField;
    IBQuery1SEGUNDO_APELLIDO: TIBStringField;
    IBQuery1PRIMER_APELLIDO: TIBStringField;
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdAceptarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DefinidoClick(Sender: TObject);
    procedure EdEmpleadoEnter(Sender: TObject);
    procedure EdEmpleadoExit(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaInicialExit(Sender: TObject);
    procedure EdFechaFinalExit(Sender: TObject);
    procedure ReporteGetValue(const ParName: String;
      var ParValue: Variant);
    procedure GroupBox5Exit(Sender: TObject);
    procedure DBEmpleadoExit(Sender: TObject);
  private
    procedure Empleado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeDesembolsosxempleado: TfrmInformeDesembolsosxempleado;
  FechaInicial : TDate;
  FechaFinal : TDate;
  Usuario : string;
  AliasEmpleado : string;

implementation

{$R *.dfm}

uses  UnitDmGeneral, UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeDesembolsosxempleado.CmdAceptarClick(Sender: TObject);
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
          sql.Clear;
          sql.Add('SELECT sum("col$colocacion".VALOR_DESEMBOLSO) as VALOR, count("col$colocacion".ID_COLOCACION) as TOTAL, "col$colocacion".FECHA_DESEMBOLSO,');
          SQL.Add('"col$colocacion".ID_EMPLEADO, "gen$empleado".NOMBRE, "gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO FROM "col$colocacion" INNER JOIN "gen$empleado" ON ("col$colocacion".ID_EMPLEADO="gen$empleado".ID_EMPLEADO)');
          SQL.Add('WHERE ("col$colocacion".ID_ESTADO_COLOCACION not in (4,5)) and ("col$colocacion".FECHA_DESEMBOLSO BETWEEN :FECHA_INICIAL AND :FECHA_FINAL)');
          if Definido.Checked then
            SQL.Add('and ("col$colocacion".ID_EMPLEADO = :ID_EMPLEADO)');
          SQL.Add('GROUP BY "col$colocacion".FECHA_DESEMBOLSO, "col$colocacion".ID_EMPLEADO,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO, "gen$empleado".SEGUNDO_APELLIDO, "gen$empleado".NOMBRE');
          ParamByName('FECHA_INICIAL').AsDate := EdFechaInicial.Date;
          ParamByName('FECHA_FINAL').AsDate := EdFechaFinal.Date;
          if Definido.Checked then
            ParamByName('ID_EMPLEADO').AsString := AliasEmpleado;
          Open;
        end;

//        IBQuery2.Open;
//        if TipoInforme.ItemIndex = 0 then
//        begin
//          InformeDiario.Variables.ByName['Empresa'].AsString := Empresa;
//          InformeDiario.Variables.ByName['Nit'].AsString := Nit;
//          InformeDiario.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
//          InformeDiario.Variables.ByName['FechaInicial'].AsDateTime := EdFechaInicial.Date;
//          InformeDiario.Variables.ByName['FechaFinal'].AsDateTime := edFechaFinal.Date;
//          if Todos.Checked then
//             InformeDiario.Variables.ByName['usuario'].AsString := 'Todos'
//          else
//             InformeDiario.Variables.ByName['usuario'].AsString := Usuario;
//          InformeDiario.Variables.ByName['Hoy'].AsDateTime := fFechaActual;

//          If InformeDiario.PrepareReport then
//           begin
//             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
//             frmVistaPreliminar.Reporte := InformeDiario;
//             frmVistaPreliminar.ShowModal;
//           end;
//        end
//        else
          Reporte.ShowReport;

//       ibquery2.EmptyDataSet;
end;

procedure TfrmInformeDesembolsosxempleado.Empleado;
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
           Close;
         end;
end;

procedure TfrmInformeDesembolsosxempleado.CmdAceptarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDesembolsosxempleado.CmdCerrarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDesembolsosxempleado.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmInformeDesembolsosxempleado.FormShow(Sender: TObject);
begin
        with IBEmpleado do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
        end;

        EdFechaInicial.Date := fFechaActual;
        EdFechaFinal.Date := fFechaActual;
 end;

procedure TfrmInformeDesembolsosxempleado.DefinidoClick(Sender: TObject);
begin
      if Definido.Checked then
       begin
         CmdAceptar.Enabled := True;
         DBEmpleado.Enabled := True;
         IBEmpleado.Open;
         DBEmpleado.SetFocus;
         todosclick(Sender);
       end;
end;

procedure TfrmInformeDesembolsosxempleado.EdEmpleadoEnter(Sender: TObject);
begin
        EdEmpleado.SelectAll;
end;

procedure TfrmInformeDesembolsosxempleado.EdEmpleadoExit(Sender: TObject);
begin
        AliasEmpleado := Trim(EdEmpleado.Text);
        with  IBQuery do begin
         Close;
         SQL.Clear;
         SQL.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE');
         SQL.Add('from "gen$empleado" where ID_EMPLEADO = :"ID_EMPLEADO"');
         ParamByName('ID_EMPLEADO').AsString := AliasEmpleado;
         Open;
         Usuario := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                    FieldByName('NOMBRE').AsString;
         Close;
        end;
end;

procedure TfrmInformeDesembolsosxempleado.TodosClick(Sender: TObject);
begin
        if Todos.Checked then
         begin
           CmdAceptar.Enabled := True;
           DBEmpleado.Enabled := False;
           Usuario := '';
           AliasEmpleado := '';
           definidoclick(Sender);
         end;
end;

procedure TfrmInformeDesembolsosxempleado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDesembolsosxempleado.EdFechaInicialExit(
  Sender: TObject);
begin
        FechaInicial := EdFechaInicial.Date;
end;

procedure TfrmInformeDesembolsosxempleado.EdFechaFinalExit(
  Sender: TObject);
begin
        FechaFinal := EdFechaFinal.Date;
end;

procedure TfrmInformeDesembolsosxempleado.ReporteGetValue(
  const ParName: String; var ParValue: Variant);
begin
        if ParName = 'Empresa' then ParValue := Empresa;
        if ParName = 'Nit' then ParValue := Nit;
        if ParName = 'Empleado' then ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'FechaInicial' then ParValue := EdFechaInicial.Date;
        if ParName = 'FechaFinal' then ParValue := EdFechaFinal.Date;
        if ParName = 'Hoy' then ParValue := fFechaActual;
end;

procedure TfrmInformeDesembolsosxempleado.GroupBox5Exit(Sender: TObject);
begin
        if (Todos.Checked = True) or (Definido.Checked = True) then
          CmdAceptar.Enabled := True;
end;

procedure TfrmInformeDesembolsosxempleado.DBEmpleadoExit(Sender: TObject);
begin
        if Definido.Checked = True then
          AliasEmpleado := DBEmpleado.KeyValue;
end;

end.
