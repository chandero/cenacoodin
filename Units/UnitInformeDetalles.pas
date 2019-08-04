unit UnitInformeDetalles;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, JvLabel, JvBlinkingLabel, DBClient;

type
  TfrmInformeDetalles = class(TForm)
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
    IBQuery2CUENTA: TIntegerField;
    IBQuery2DIGITO: TIntegerField;
    IBQuery2FECHA: TDateField;
    IBQuery2HORA: TTimeField;
    IBQuery2ANO: TStringField;
    IBQuery2ID_EMPLEADO: TStringField;
    IBQuery2NOMBRE: TStringField;
    IBQuery2PRIMER_APELLIDO: TStringField;
    IBQuery2SEGUNDO_APELLIDO: TStringField;
    Total: TCheckBox;
    CmdNuevo: TBitBtn;
    RGTipo: TRadioGroup;
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
    procedure TotalClick(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
  private
    procedure Empleado;
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeDetalles: TfrmInformeDetalles;
  FechaInforme : TDate;
  Usuario : string;
  AliasUsuario : string;

implementation

{$R *.dfm}

uses  UnitDmGeneral, UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeDetalles.EdFechaInformeExit(
  Sender: TObject);
begin
        FechaInforme := EdFechaInforme.Date;
end;

procedure tfrminformedetalles.Inicializar;
begin
        Usuario := '';
        AliasUsuario := '';
        EdFechaInforme.Date := fFechaActual;
        FechaInforme := fFechaActual;
        Total.Checked :=False;
        Label1.Visible := False;
        EdEmpleado.Text := '';
        EdEmpleado.Visible := False;
        CmdNuevo.Visible := False;
        Todos.Checked := False;
        Definido.Checked := False;
end;

procedure TfrmInformeDetalles.CmdAceptarClick(Sender: TObject);
var
frmVistaPreliminar:TfrmVistaPreliminar;
Tabla : String;
begin
        CmdAceptar.Enabled := False;
        Empleado;
        If DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;

        with IBQuery1 do
        begin
          Close;
          sql.Clear;
          SQL.Add('Select ');
          SQL.Add('"gen$detalles".NUMERO_CUENTA,');
          SQL.Add('"gen$detalles".DIGITO_CUENTA,');
          SQL.Add('"gen$detalles".FECHA_ENTREGA,');
          SQL.Add('"gen$detalles".HORA_ENTREGA,');
          SQL.Add('"gen$detalles".ANO,');
          SQL.Add('"gen$detalles".ID_EMPLEADO,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE');
          SQL.Add('FROM');
          SQL.Add('"gen$detalles"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("gen$detalles".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
          SQL.Add('"gen$detalles".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
          SQL.Add('"gen$detalles".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
          if Todos.Checked then
           begin
             SQL.Add('WHERE');
             SQL.Add('"gen$detalles".ID_AGENCIA = :"ID_AGENCIA" and "gen$detalles".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
             SQL.Add('and "gen$detalles".FECHA_ENTREGA = :FECHA_ENTREGA');
             SQL.Add('and "cap$maestrotitular".NUMERO_TITULAR =1 and "gen$detalles".TIPO = :TIPO');
             SQL.Add('order by "gen$detalles".FECHA_ENTREGA, "gen$detalles".HORA_ENTREGA');
             if RGTipo.ItemIndex = 0 then
               ParamByName('ID_TIPO_CAPTACION').AsInteger := 1
             else
               ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
             parambyname('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA_ENTREGA').AsDate := FechaInforme;
           end
          else if Definido.Checked then
           begin
             SQL.Add('WHERE');
             SQL.Add('"gen$detalles".ID_AGENCIA = :"ID_AGENCIA" and "gen$detalles".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
             SQL.Add('and "gen$detalles".FECHA_ENTREGA = :FECHA_ENTREGA and');
             SQL.Add('"gen$detalles".ID_EMPLEADO = :ID_EMPLEADO');
             SQL.Add('and "cap$maestrotitular".NUMERO_TITULAR =1 and "gen$detalles".TIPO = :TIPO');
             SQL.Add('order by "gen$detalles".FECHA_ENTREGA,"gen$detalles".HORA_ENTREGA');
             if RGTipo.ItemIndex = 0 then
               ParamByName('ID_TIPO_CAPTACION').AsInteger := 1
             else
               ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
             parambyname('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA_ENTREGA').AsDate := FechaInforme;
             ParamByName('ID_EMPLEADO').AsString := AliasUsuario;
           end
          else if Total.Checked then
           begin
             SQL.Add('WHERE');
             SQL.Add('"gen$detalles".ID_AGENCIA = :"ID_AGENCIA" and "gen$detalles".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
             SQL.Add('and "cap$maestrotitular".NUMERO_TITULAR =1');// and "cap$maestrotitular".NUMERO_TITULAR = 2');
             SQL.Add('and "gen$detalles".ANO = :ANO and "gen$detalles".TIPO = :TIPO');
             SQL.Add('order by "gen$detalles".FECHA_ENTREGA, "gen$detalles".HORA_ENTREGA ');
             if RGTipo.ItemIndex = 0 then
               ParamByName('ID_TIPO_CAPTACION').AsInteger := 1
             else
               ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
             parambyname('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ANO').AsInteger := YearOf(fFechaActual);
           end;
           ParamByName('TIPO').AsInteger := _iTipoDetalle;
          Open;

 {         while not Eof do begin
            IBQuery2.Append;
            IBQuery2.FieldByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
            IBQUERY2.FieldByName('CUENTA').AsInteger := IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger;
            IBQUERY2.FieldByName('DIGITO').AsInteger := IBQuery1.FieldByName('DIGITO_CUENTA').AsInteger;
            IBQUERY2.FieldByName('NOMBRE').AsString := IBQuery1.FieldByName('NOMBRE').AsString;
            IBQUERY2.FieldByName('PRIMER_APELLIDO').AsString := IBQuery1.FieldByName('PRIMER_APELLIDO').AsString;
            IBQUERY2.FieldByName('SEGUNDO_APELLIDO').AsString := IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString;
            IBQUERY2.FieldByName('FECHA').AsDateTime := IBQuery1.FieldByName('FECHA_ENTREGA').AsDateTime;
            IBQUERY2.FieldByName('').AS
            IBQuery2.Post;
            IBQuery1.Next;
          end;      }
        end;


        InformeDiario.Variables.ByName['Empresa'].AsString := Empresa;
        InformeDiario.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
        if Todos.Checked then
           InformeDiario.Variables.ByName['usuario'].AsString := 'Todos'
        else if Definido.Checked then
           InformeDiario.Variables.ByName['usuario'].AsString := Usuario
        else if Total.Checked then
           InformeDiario.Variables.ByName['usuario'].AsString := 'Total';
        InformeDiario.Variables.ByName['Hoy'].AsDateTime := FechaInforme;
        InformeDiario.Variables.ByName['Tipo'].AsString := _sDetalle;

        If InformeDiario.PrepareReport then
         begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := InformeDiario;
           frmVistaPreliminar.ShowModal;
         end;
         IBQuery1.Close;
//       ibquery2.EmptyDataSet;
         CmdNuevo.Visible := True;
end;

procedure TfrmInformeDetalles.Empleado;
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

procedure TfrmInformeDetalles.EdFechaInformeEnter(Sender: TObject);
begin
        EdFechaInforme.Date := fFechaActual;
end;

procedure TfrmInformeDetalles.EdFechaInformeKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDetalles.CmdAceptarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDetalles.CmdCerrarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDetalles.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmInformeDetalles.FormShow(Sender: TObject);
begin
        If DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
end;

procedure TfrmInformeDetalles.DefinidoClick(Sender: TObject);
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

procedure TfrmInformeDetalles.EdEmpleadoEnter(Sender: TObject);
begin
        EdEmpleado.SelectAll;
end;

procedure TfrmInformeDetalles.EdEmpleadoExit(Sender: TObject);
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

procedure TfrmInformeDetalles.TodosClick(Sender: TObject);
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

procedure TfrmInformeDetalles.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDetalles.TotalClick(Sender: TObject);
begin
        if Total.Checked = True then begin
          CmdAceptar.Enabled := True;
          Label1.Visible := False;
          EdEmpleado.Visible := False;
          Usuario := '';
          AliasUsuario := '';
          Todos.Checked := False;
          Definido.Checked := False;
          todosclick(Sender);
          definidoclick(Sender);
        end;
end;

procedure TfrmInformeDetalles.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

end.
