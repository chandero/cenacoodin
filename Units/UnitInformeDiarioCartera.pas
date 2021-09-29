unit UnitInformeDiarioCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, JvLabel, JvBlinkingLabel, DBClient;

type
  TfrmInformeDiarioCartera = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label7: TLabel;
    EdFechaInforme: TDateTimePicker;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    GroupBox5: TGroupBox;
    Todos: TRadioButton;
    Definido: TRadioButton;
    EdEmpleado: TEdit;
    Label1: TLabel;
    IBQuery2: TClientDataSet;
    IBQuery2ID_AGENCIA: TIntegerField;
    IBQuery2ID_COLOCACION: TStringField;
    IBQuery2NO_COMPROBANTE: TIntegerField;
    IBQuery2CUOTA: TIntegerField;
    IBQuery2TIPO_ABONO: TStringField;
    IBQuery2CAPITAL: TIntegerField;
    IBQuery2SERVICIOS: TIntegerField;
    IBQuery2CAUSADO: TIntegerField;
    IBQuery2ANTICIPADOS: TIntegerField;
    IBQuery2MORA: TIntegerField;
    IBQuery2HONORARIOS: TIntegerField;
    IBQuery2PAGXCLI: TIntegerField;
    IBQuery2SEGURO: TIntegerField;
    IBQuery2OTROS: TIntegerField;
    IBQuery2FECHA_CAPITAL: TDateField;
    IBQuery2FECHA_INTERES: TDateField;
    IBQuery2DEVUELTOS: TStringField;
    IBQuery2SALDO: TCurrencyField;
    InformeDiario: TprTxReport;
    procedure EdFechaInformeExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure EdFechaInformeEnter(Sender: TObject);
    procedure EdFechaInformeKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAceptarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DefinidoClick(Sender: TObject);
    procedure EdEmpleadoEnter(Sender: TObject);
    procedure EdEmpleadoExit(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Empleado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeDiarioCartera: TfrmInformeDiarioCartera;
  FechaInforme : TDate;
  Usuario : string;
  AliasUsuario : string;

implementation

{$R *.dfm}

uses  UnitDmGeneral, UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeDiarioCartera.EdFechaInformeExit(
  Sender: TObject);
begin
        FechaInforme := EdFechaInforme.Date;
end;

procedure TfrmInformeDiarioCartera.CmdAceptarClick(Sender: TObject);
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
          sql.Add('select "col$extracto".ABONO_CAPITAL, "col$extracto".ABONO_ANTICIPADO,');
          sql.Add('"col$extracto".ABONO_CXC, "col$extracto".ABONO_HONORARIOS, "col$extracto".ABONO_MORA,');
          sql.Add('"col$extracto".ABONO_OTROS, "col$extracto".ABONO_PAGXCLI, "col$extracto".ABONO_SEGURO,');
          sql.Add('"col$extracto".ABONO_SERVICIOS, "col$extracto".CUOTA_EXTRACTO, "col$extracto".ID_AGENCIA,');
          sql.Add('"col$extracto".ID_COLOCACION, "col$extracto".ID_CBTE_COLOCACION, "col$extracto".ID_EMPLEADO,');
          sql.Add('"col$extracto".FECHA_EXTRACTO, "col$extracto".TIPO_ABONO, "col$extracto".CAPITAL_PAGO_HASTA,');
          sql.Add('"col$extracto".INTERES_PAGO_HASTA, "col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('("col$extracto".SALDO_ANTERIOR_EXTRACTO - "col$extracto".ABONO_CAPITAL) as SALDO');
          sql.Add('from "col$extracto"');
          sql.Add('inner join "col$colocacion" on ("col$extracto".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
          if Todos.Checked then
           begin
             sql.Add('where "col$extracto".FECHA_EXTRACTO = :"FECHA_EXTRACTO" and');
             sql.Add('(("col$colocacion".ID_ESTADO_COLOCACION < 3) or');
             sql.Add('("col$colocacion".ID_ESTADO_COLOCACION >= 6))');
             ParamByName('FECHA_EXTRACTO').AsDate := FechaInforme;
           end
          else
           begin
             sql.Add('where "col$extracto".FECHA_EXTRACTO = :"FECHA_EXTRACTO" and');
             sql.Add('(("col$colocacion".ID_ESTADO_COLOCACION < 3) or');
             sql.Add('("col$colocacion".ID_ESTADO_COLOCACION >= 6)) and');
             sql.Add('"col$extracto".ID_EMPLEADO =:"ID_EMPLEADO"');
             ParamByName('FECHA_EXTRACTO').AsDate := FechaInforme;
             ParamByName('ID_EMPLEADO').AsString := AliasUsuario;
           end;
          Open;

          while not Eof do begin
            IBQuery2.Append;
            IBQuery2.FieldByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
            IBQuery2.FieldByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
            IBQuery2.FieldByName('NO_COMPROBANTE').AsInteger := IBQuery1.FieldByName('ID_CBTE_COLOCACION').AsInteger;
            IBQuery2.FieldByName('CUOTA').AsInteger := IBQuery1.FieldByName('CUOTA_EXTRACTO').AsInteger;
            if IBQuery1.FieldByName('CUOTA_EXTRACTO').AsInteger = 0 then
              IBQuery2.FieldByName('TIPO_ABONO').AsString := '*'
            else
              IBQuery2.FieldByName('TIPO_ABONO').AsString := '';
            IBQuery2.FieldByName('CAPITAL').AsCurrency := IBQuery1.FieldByName('ABONO_CAPITAL').AsCurrency;
            IBQuery2.FieldByName('SERVICIOS').AsCurrency := IBQuery1.FieldByName('ABONO_SERVICIOS').AsCurrency;
            IBQuery2.FieldByName('CAUSADO').AsCurrency := IBQuery1.FieldByName('ABONO_CXC').AsCurrency;
            if IBQuery1.FieldByName('TIPO_ABONO').AsInteger <> 0 then
               IBQuery2.FieldByName('DEVUELTOS').AsString := '-(' + FormatCurr('#,##0',IBQuery1.FieldByName('ABONO_ANTICIPADO').AsCurrency) + ')'
            else
               IBQuery2.FieldByName('ANTICIPADOS').AsCurrency := IBQuery1.FieldByName('ABONO_ANTICIPADO').AsCurrency;
            IBQuery2.FieldByName('MORA').AsCurrency := IBQuery1.FieldByName('ABONO_MORA').AsCurrency;
            IBQuery2.FieldByName('HONORARIOS').AsCurrency := IBQuery1.FieldByNAme('ABONO_HONORARIOS').AsCurrency;
            IBQuery2.FieldByName('PAGXCLI').AsCurrency := IBQuery1.FieldByName('ABONO_PAGXCLI').AsCurrency;
            IBQuery2.FieldByName('SEGURO').AsCurrency := IBQuery1.FieldByName('ABONO_SEGURO').AsCurrency;
            IBQuery2.FieldByName('OTROS').AsCurrency := IBQuery1.FieldByName('ABONO_OTROS').AsCurrency;
            IBQuery2.FieldByName('FECHA_CAPITAL').AsDateTime := IBQuery1.FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;
            IBQuery2.FieldByName('FECHA_INTERES').AsDateTime := IBQuery1.FieldByName('INTERES_PAGO_HASTA').AsDateTime;
            ibquery2.FieldByName('SALDO').AsCurrency := IBQuery1.FieldByName('SALDO').AsCurrency;
            IBQuery2.Post;
            IBQuery1.Next;
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

procedure TfrmInformeDiarioCartera.Empleado;
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

procedure TfrmInformeDiarioCartera.EdFechaInformeEnter(Sender: TObject);
begin
        EdFechaInforme.Date := Date;
end;

procedure TfrmInformeDiarioCartera.EdFechaInformeKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDiarioCartera.CmdAceptarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDiarioCartera.CmdCerrarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDiarioCartera.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmInformeDiarioCartera.FormShow(Sender: TObject);
begin
        If DmGeneral.IBTransaction1.InTransaction then
          DmGeneral.IBTransaction1.Commit;
        DmGeneral.IBTransaction1.StartTransaction;
 end;

procedure TfrmInformeDiarioCartera.DefinidoClick(Sender: TObject);
begin
      if Definido.Checked then
       begin
         CmdAceptar.Enabled := True;
         Label1.Visible := True;
         EdEmpleado.Visible := True;
         EdEmpleado.SetFocus;
         todosclick(Sender);
       end;
end;

procedure TfrmInformeDiarioCartera.EdEmpleadoEnter(Sender: TObject);
begin
        EdEmpleado.SelectAll;
end;

procedure TfrmInformeDiarioCartera.EdEmpleadoExit(Sender: TObject);
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

procedure TfrmInformeDiarioCartera.TodosClick(Sender: TObject);
begin
        if Todos.Checked then
         begin
           CmdAceptar.Enabled := True;
           Label1.Visible := False;
           EdEmpleado.Visible := False;
           Usuario := '';
           AliasUsuario := '';
           definidoclick(Sender);
         end;
end;

procedure TfrmInformeDiarioCartera.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
