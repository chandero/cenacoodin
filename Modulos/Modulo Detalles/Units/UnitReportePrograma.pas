unit UnitReportePrograma;

interface

uses
  DateUtils,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pr_Common, pr_TxClasses, DB, DBClient, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmReportePrograma = class(TForm)
    Label7: TLabel;
    EdFechaInforme: TDateTimePicker;
    Total: TCheckBox;
    GroupBox5: TGroupBox;
    Todos: TRadioButton;
    Definido: TRadioButton;
    Label1: TLabel;
    EdEmpleado: TEdit;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    IBQuery2: TClientDataSet;
    IBQuery2ID_AGENCIA: TIntegerField;
    IBQuery2CUENTA: TIntegerField;
    IBQuery2DIGITO: TIntegerField;
    IBQuery2NOMBRE: TStringField;
    IBQuery2PRIMER_APELLIDO: TStringField;
    IBQuery2SEGUNDO_APELLIDO: TStringField;
    IBQuery2FECHA: TDateField;
    IBQuery2HORA: TTimeField;
    IBQuery2ANO: TStringField;
    IBQuery2ID_EMPLEADO: TStringField;
    InformeDiario: TprTxReport;
    procedure CmdAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportePrograma: TfrmReportePrograma;

implementation

{$R *.dfm}

uses UnitGlobales, UnitDmGeneral;

procedure TfrmReportePrograma.CmdAceptarClick(Sender: TObject);
var
  _fFecha1,_fFecha2:TDate;
begin
        CmdAceptar.Enabled := False;
        Empleado;
        If DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;

        with IBQuery1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select VALOR_MINIMO from "gen$minimos" WHERE ID_MINIMO = 45');
            Open;
            _fFecha1 := FieldByName('VALOR_MINIMO').AsFloat;

            Close;
            SQL.Clear;
            SQL.Add('select VALOR_MINIMO from "gen$minimos" WHERE ID_MINIMO = 46');
            Open;
            _fFecha2 := FieldByName('VALOR_MINIMO').AsFloat;
        end;

        with IBQuery1 do
        begin
          Close;
          sql.Clear;
          SQL.Add('Select ');
          SQL.Add('"gen$detallesprograma".NUMERO_CUENTA,');
          SQL.Add('"gen$detallesprograma".DIGITO_CUENTA,');
          SQL.Add('"gen$detallesprograma".FECHA_ENTREGA,');
          SQL.Add('"gen$detallesprograma".HORA_ENTREGA,');
          SQL.Add('"gen$detallesprograma".ANO,');
          SQL.Add('"gen$detallesprograma".ID_EMPLEADO,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE');
          SQL.Add('FROM');
          SQL.Add('"gen$detallesprograma"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("gen$detallesprograma".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
          SQL.Add('"gen$detallesprograma".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
          SQL.Add('"gen$detallesprograma".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
          if Todos.Checked then
           begin
             SQL.Add('WHERE');
             SQL.Add('"gen$detallesprograma".ID_AGENCIA = :"ID_AGENCIA" and "gen$detallesprograma".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
             SQL.Add('and "gen$detallesprograma".FECHA_ENTREGA = :FECHA_ENTREGA');
             SQL.Add('and "cap$maestrotitular".NUMERO_TITULAR =1');// and "cap$maestrotitular".NUMERO_TITULAR = 1');
             SQL.Add('order by "gen$detallesprograma".FECHA_ENTREGA, "gen$detallesprograma".HORA_ENTREGA');
             ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
             parambyname('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA_ENTREGA').AsDate := EdFechaInforme.Date;
           end
          else if Definido.Checked then
           begin
             SQL.Add('WHERE');
             SQL.Add('"gen$detallesprograma".ID_AGENCIA = :"ID_AGENCIA" and "gen$detallesprograma".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
             SQL.Add('and "gen$detallesprograma".FECHA_ENTREGA = :FECHA_ENTREGA and');
             SQL.Add('"gen$detallesprograma".ID_EMPLEADO = :ID_EMPLEADO');
             SQL.Add('and "cap$maestrotitular".NUMERO_TITULAR =1');// and "cap$maestrotitular".NUMERO_TITULAR = 2');
             SQL.Add('order by "gen$detallesprograma".FECHA_ENTREGA,"gen$detallesprograma".HORA_ENTREGA');
             ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
             parambyname('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA_ENTREGA').AsDate := EdFechaInforme.Date;
             ParamByName('ID_EMPLEADO').AsString := EdEmpleado.Text;
           end
          else if Total.Checked then
           begin
             SQL.Add('WHERE');
             SQL.Add('"gen$detallesprograma".ID_AGENCIA = :"ID_AGENCIA" and "gen$detallesprograma".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
             SQL.Add('and "cap$maestrotitular".NUMERO_TITULAR =1');// and "cap$maestrotitular".NUMERO_TITULAR = 2');
             SQL.Add('and "cap$detallesprograma".FECHA_ENTREGA BETWEEN :FECHA1 and :FECHA2');
             SQL.Add('order by "gen$detallesprograma".FECHA_ENTREGA, "gen$detallesprograma".HORA_ENTREGA');
             ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
             parambyname('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA1').AsDate := _fFecha1;
           end;
          Open;

        end;


        InformeDiario.Variables.ByName['Empresa'].AsString := Empresa;
        InformeDiario.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
        if Todos.Checked then
           InformeDiario.Variables.ByName['usuario'].AsString := 'Todos'
        else if Definido.Checked then
           InformeDiario.Variables.ByName['usuario'].AsString := EdEmpleado.Text
        else if Total.Checked then
           InformeDiario.Variables.ByName['usuario'].AsString := 'Total';
        InformeDiario.Variables.ByName['Hoy'].AsDateTime := fFechaActual;
        InformeDiario.Variables.ByName['Tipo'].AsString := 'NIÑOS AHORRADORES';

        If InformeDiario.PrepareReport then
         begin
           InformeDiario.PreviewPreparedReport(true);
         end;
         IBQuery1.Close;
//       ibquery2.EmptyDataSet;
         CmdNuevo.Visible := True;
end;

end.
