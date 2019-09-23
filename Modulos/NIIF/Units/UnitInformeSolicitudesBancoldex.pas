unit UnitInformeSolicitudesBancoldex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, JvLabel, JvBlinkingLabel, DBClient;

type
  TfrmInformeSolicitudesBancoldex = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    Todos: TCheckBox;
    Fecha: TCheckBox;
    Label7: TLabel;
    EdFechaInicial: TDateTimePicker;
    EdFechaFinal: TDateTimePicker;
    Label1: TLabel;
    Activos: TCheckBox;
    IBQuery2: TClientDataSet;
    IBQuery2ID_AGENCIA: TIntegerField;
    IBQuery2ID_PERSONA: TStringField;
    IBQuery2ASOCIADO: TStringField;
    IBQuery2VALOR: TCurrencyField;
    IBQuery2DES_ESTADO: TStringField;
    IBQuery2LINEA: TStringField;
    IBQuery2OBLIGACION: TStringField;
    IBQuery2ID_SOLICITUD: TStringField;
    IBQuery2ANALISTA: TStringField;
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
  frmInformeSolicitudesBancoldex: TfrmInformeSolicitudesBancoldex;
  FechaInforme : TDate;
  Usuario : string;
  AliasUsuario : string;

implementation

{$R *.dfm}

uses  UnitDmGeneral, UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeSolicitudesBancoldex.EdFechaInformeExit(
  Sender: TObject);
begin
        FechaInforme := fFechaActual;
end;

procedure TfrmInformeSolicitudesBancoldex.CmdAceptarClick(Sender: TObject);
var
frmVistaPreliminar:TfrmVistaPreliminar;
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
          SQL.Add('"col$infbancoldex".ID_IDENTIFICACION,');
          SQL.Add('"col$infbancoldex".ID_PERSONA,');
          SQL.Add('"col$infbancoldex".LINEA_BANCOLDEX,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"col$infbancoldex".ID_SOLICITUD,');
          SQL.Add('"col$infbancoldex".NO_BANCOLDEX,');
          SQL.Add('"col$solicitud".VALOR_SOLICITADO,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$empleado".NOMBRE');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$infbancoldex" ON ("col$solicitud".ID_SOLICITUD="col$infbancoldex".ID_SOLICITUD)');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$solicitud".ID_ANALISIS="gen$empleado".ID_EMPLEADO)');
          if Fecha.Checked = True then begin
            SQL.Add('WHERE FECHA_RECEPCION BETWEEN :FECHA1 AND :FECHA2');
            ParamByName('FECHA1').AsDate := EdFechaInicial.Date;
            ParamByName('FECHA2').AsDate := EdFechaFinal.Date;
          end;
          if Activos.Checked = True then begin
            SQL.Add('WHERE ESTADO = 4');
          end;
          if Todos.Checked = True then begin
            SQL.Add('WHERE');
            SQL.Add('("col$solicitud".ESTADO IN (1,2,3,4,8,13,16))');
          end;
          SQL.Add('ORDER BY LINEA_BANCOLDEX,NO_BANCOLDEX ASC');
          Open;

          while not Eof do begin
            IBQuery2.Append;
            IBQuery2.FieldByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
            IBQuery2.FieldByName('ID_SOLICITUD').AsString := IBQuery1.FieldByName('ID_SOLICITUD').AsString;
            IBQuery2.FieldByName('ID_PERSONA').AsString := IBQuery1.fieldbyname('ID_PERSONA').AsString;
            IBQuery2.FieldByName('ASOCIADO').AsString := Trim(IBQuery1.FieldByName('NOMBRE').AsString) + ' '
                                                         + Trim(IBQuery1.FieldByName('PRIMER_APELLIDO').AsString) + ' '
                                                         + Trim(IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString);
            IBQuery2.FieldByName('VALOR').AsCurrency := IBQuery1.FieldByName('VALOR_SOLICITADO').AsCurrency;
            IBQuery2.FieldByName('DES_ESTADO').AsString := IBQuery1.FIELDBYNAME('DESCRIPCION_ESTADO').AsString;
            IBQuery2.FieldByName('LINEA').AsString := IBQuery1.FieldByName('LINEA_BANCOLDEX').AsString;
            IBQuery2.FieldByName('OBLIGACION').AsString := IBQuery1.FIELDBYNAME('NO_BANCOLDEX').AsString;
            IBQuery2.FieldByName('ANALISTA').AsString := Trim(IBQuery1.FieldByName('NOMBRE1').AsString) + ' '
                                                         + Trim(IBQuery1.FieldByName('PRIMER_APELLIDO1').AsString) + ' '
                                                         + Trim(IBQuery1.FieldByName('SEGUNDO_APELLIDO1').AsString);
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

procedure TfrmInformeSolicitudesBancoldex.Empleado;
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

procedure TfrmInformeSolicitudesBancoldex.EdFechaInformeKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeSolicitudesBancoldex.CmdAceptarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeSolicitudesBancoldex.CmdCerrarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeSolicitudesBancoldex.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmInformeSolicitudesBancoldex.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmInformeSolicitudesBancoldex.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeSolicitudesBancoldex.FechaClick(Sender: TObject);
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

procedure TfrmInformeSolicitudesBancoldex.Inicializar;
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

procedure TfrmInformeSolicitudesBancoldex.TodosClick(Sender: TObject);
begin
        if Todos.Checked = True then
         begin
           Fecha.Checked := False;
           EdFechaInicial.Enabled := False;
           EdFechaFinal.Enabled := False;
           Activos.Checked := False;
         end;
end;

procedure TfrmInformeSolicitudesBancoldex.ActivosClick(Sender: TObject);
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
