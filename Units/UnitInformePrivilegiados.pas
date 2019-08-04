unit UnitInformeCarteraPrivilegiados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, JvLabel, JvBlinkingLabel, DBClient,
  DBCtrls, IBSQL;

type
  TfrmInformeCarteraPrivilegiados = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    GroupBox5: TGroupBox;
    Todos: TRadioButton;
    Definido: TRadioButton;
    Label1: TLabel;
    IBQuery2: TClientDataSet;
    IBQuery2ID_AGENCIA: TIntegerField;
    IBQuery2ID_COLOCACION: TStringField;
    IBQuery2FECHA_CAPITAL: TDateField;
    IBQuery2FECHA_INTERES: TDateField;
    IBQuery2SALDO: TCurrencyField;
    InformeDiario: TprTxReport;
    IBQuery2ID_IDENTIFICACION: TIntegerField;
    DBLCBPrivilegiado: TDBLookupComboBox;
    DSPrivilegiado: TDataSource;
    IBPrivilegiado: TIBQuery;
    IBQuery2ID_PERSONA: TStringField;
    IBQuery2ID_IDENTIFICACION_PRIV: TIntegerField;
    IBQuery2ID_PERSONA_PRIV: TStringField;
    IBQuery2ASOCIADO: TStringField;
    IBQuery2PRIVILEGIADO: TStringField;
    IBQuery2ESTADO: TStringField;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    procedure EdFechaInformeExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure EdFechaInformeEnter(Sender: TObject);
    procedure EdFechaInformeKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAceptarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdEmpleadoEnter(Sender: TObject);
    procedure EdEmpleadoExit(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DefinidoClick(Sender: TObject);
  private
    procedure Empleado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeCarteraPrivilegiados: TfrmInformeCarteraPrivilegiados;
  FechaInforme : TDate;
  Usuario : string;
  AliasUsuario : string;

implementation

{$R *.dfm}

uses  UnitDmGeneral, UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeCarteraPrivilegiados.EdFechaInformeExit(
  Sender: TObject);
begin
        FechaInforme := EdFechaInforme.Date;
end;

procedure TfrmInformeCarteraPrivilegiados.CmdAceptarClick(Sender: TObject);
var
frmVistaPreliminar:TfrmVistaPreliminar;
IDPrivilegiado : String;
begin
        CmdAceptar.Enabled := False;
        Empleado;
        If DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        IDPrivilegiado := '';
        with IBQuery1 do
        begin
          Close;
          sql.Clear;
          SQL.Add('SELECT "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$colocacion".ID_CLASIFICACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
          SQL.Add('FROM "col$colocacion"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$colocacion".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "gen$privilegiados" ON ("col$colocacion".ID_IDENTIFICACION="gen$privilegiados".ID_IDENTIFICACION_PRIV)');
          SQL.Add('AND ("col$colocacion".ID_PERSONA="gen$privilegiados".ID_PERSONA_PRIV)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');

          if Todos.Checked then
           begin
             SQL.Add('WHERE ("col$colocacion".ID_ESTADO_COLOCACION <= 3) AND');
             SQL.Add('("col$colocacion".ID_IDENTIFICACION = "gen$privilegiados".ID_IDENTIFICACION_PRIV AND');
             SQL.Add('"col$colocacion".ID_PERSONA = "gen$privilegiados".ID_PERSONA_PRIV)');
           end
          else
           begin
             SQL.Add('WHERE ("col$colocacion".ID_ESTADO_COLOCACION <= 3) AND');
             SQL.Add('("col$colocacion".ID_IDENTIFICACION = "gen$privilegiados".ID_IDENTIFICACION_PRIV AND');
             SQL.Add('"col$colocacion".ID_PERSONA = "gen$privilegiados".ID_PERSONA_PRIV) AND');
             SQL.Add('"gen$privilegiados".ID_PERSONA_PRIV = :ID_PERSONA');
             ParamByName('ID_PERSONA').AsString := AliasUsuario;
           end;
          Open;

          while not Eof do begin
             IDPrivilegiado := FieldByName('ID_PERSONA').AsString;

             IBQuery2.Append;
             IBQuery2.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
             IBQuery2.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
             IBQuery2.FieldByName('ID_IDENTIFICACION_PRIV').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
             IBQuery2.FieldByName('ID_PERSONA_PRIV').AsString := FieldByName('ID_PERSONA').AsString;


             if Todos.Checked then begin
             if IDPrivilegiado <>
               IBSQL1.ExecQuery;
               IBQuery2.Append;
               IBQuery2.FieldByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
               IBQuery2.FieldByName('ID_COLOCACION').AsString := IBSQL1.FieldByName('ID_COLOCACION').AsString;
               IBQuery2.FieldByName('ID_IDENTIFICACION_PRIV').AsInteger := IBSQL1.FieldByName('ID_IDENTIFICACION_PRIV').AsInteger;
               IBQuery2.FieldByName('ID_PERSONA_PRIV').AsString := IBSQL1.FieldByName('ID_PERSONA_PRIV').AsString;
               IBQuery2.FieldByName('PRIVILEGIADO').AsString := IBSQL1.FieldByName('NOMBRE').AsString + ' ' +
                                                                IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                                IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString;
               IBQuery2.FieldByName(')
             end
             else begin

             end;
          end;
        end;


        InformeDiario.Variables.ByName['Empresa'].AsString := Empresa;
        InformeDiario.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
        if Todos.Checked then
           InformeDiario.Variables.ByName['usuario'].AsString := 'Todos'
        else
           InformeDiario.Variables.ByName['usuario'].AsString := Usuario;
        InformeDiario.Variables.ByName['Hoy'].AsDateTime := FechaInforme;

        If InformeDiario.PrepareReport then
         begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := InformeDiario;
           frmVistaPreliminar.ShowModal;
         end;
       ibquery2.EmptyDataSet;   
end;

procedure TfrmInformeCarteraPrivilegiados.Empleado;
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

procedure TfrmInformeCarteraPrivilegiados.EdFechaInformeEnter(Sender: TObject);
begin
        EdFechaInforme.Date := Date;
end;

procedure TfrmInformeCarteraPrivilegiados.EdFechaInformeKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCarteraPrivilegiados.CmdAceptarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCarteraPrivilegiados.CmdCerrarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCarteraPrivilegiados.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmInformeCarteraPrivilegiados.FormShow(Sender: TObject);
begin
        with IBQAbogados do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
        end;
end;

procedure TfrmInformeCarteraPrivilegiados.EdEmpleadoEnter(Sender: TObject);
begin
        EdEmpleado.SelectAll;
end;

procedure TfrmInformeCarteraPrivilegiados.EdEmpleadoExit(Sender: TObject);
begin
        AliasUsuario := Trim(EdEmpleado.Text);
        with  IBQuery do begin
         Close;
         SQL.Clear;
         SQL.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE');
         SQL.Add('from "gen$empleado" where ID_EMPLEADO = :"ID_EMPLEADO"');
         ParamByName('ID_EMPLEADO').AsString := AliasUsuario;
         Open;
         Usuario := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                    FieldByName('NOMBRE').AsString;
         Close;
        end;
end;

procedure TfrmInformeCarteraPrivilegiados.TodosClick(Sender: TObject);
begin
        if Todos.Checked then
         begin
           CmdAceptar.Enabled := True;
           Label1.Visible := False;
           DBLCBPrivilegiado.Visible := False;
           Usuario := '';
           AliasUsuario := '';
           definidoclick(Sender);
         end;
end;

procedure TfrmInformeCarteraPrivilegiados.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCarteraPrivilegiados.DefinidoClick(Sender: TObject);
begin
      if Definido.Checked then
       begin
         CmdAceptar.Enabled := True;
         Label1.Visible := True;
         DBLCBPrivilegiado.Visible := True;
         DBLCBPrivilegiado.SetFocus;
         todosclick(Sender);
       end;
end;

end.
