unit UnitInformeCreditosCanceladosReales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, JvLabel, JvBlinkingLabel, DBClient;

type
  TfrmInformeCreditosCanceladosReales = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label7: TLabel;
    EdFechaInforme: TDateTimePicker;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    IBQuery2: TClientDataSet;
    IBQuery2ID_AGENCIA: TIntegerField;
    IBQuery2ID_COLOCACION: TStringField;
    IBQuery2CUENTA: TIntegerField;
    IBQuery2ID_PERSONA: TStringField;
    IBQuery2ASOCIADO: TStringField;
    InformeDiario: TprTxReport;
    procedure EdFechaInformeExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure EdFechaInformeEnter(Sender: TObject);
    procedure EdFechaInformeKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAceptarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Empleado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeCreditosCanceladosReales: TfrmInformeCreditosCanceladosReales;
  FechaInforme : TDate;
  Usuario : string;
  AliasUsuario : string;

implementation

{$R *.dfm}

uses  UnitDmGeneral, UnitGlobales, UnitVistaPreliminar;

procedure TfrmInformeCreditosCanceladosReales.EdFechaInformeExit(
  Sender: TObject);
begin
        FechaInforme := EdFechaInforme.Date;
end;

procedure TfrmInformeCreditosCanceladosReales.CmdAceptarClick(Sender: TObject);
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
          sql.Add('select "col$extracto".ID_AGENCIA,"col$extracto".ID_COLOCACION, "col$extracto".FECHA_EXTRACTO,');
          sql.Add('"col$colocacion".NUMERO_CUENTA,"col$colocacion".ID_IDENTIFICACION, "col$colocacion".ID_PERSONA,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE');
          sql.Add('from "col$extracto"');
          sql.Add('inner join "col$colocacion" on ("col$extracto".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
          SQL.Add('inner join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          sql.Add('where "col$extracto".FECHA_EXTRACTO = :"FECHA_EXTRACTO" and');
          SQL.Add('("col$extracto".SALDO_ANTERIOR_EXTRACTO - "col$extracto".ABONO_CAPITAL) = 0 and "col$colocacion".ID_GARANTIA = 1');
          ParamByName('FECHA_EXTRACTO').AsDate := FechaInforme;
          Open;

          while not Eof do begin
            IBQuery2.Append;
            IBQuery2.FieldByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
            IBQuery2.FieldByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
            ibquery2.FieldByName('CUENTA').AsInteger := IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger;
            ibquery2.FieldByName('ID_PERSONA').AsString := IBQuery1.fieldbyname('ID_PERSONA').AsString;
            ibquery2.FieldByName('ASOCIADO').AsString := Trim(IBQuery1.FieldByName('NOMBRE').AsString) + ' '
                                                         + Trim(IBQuery1.FieldByName('PRIMER_APELLIDO').AsString) + ' '
                                                         + Trim(IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString);
            IBQuery2.Post;
            IBQuery1.Next;
           end;
        end;

        InformeDiario.Variables.ByName['Empresa'].AsString := Empresa;
        InformeDiario.Variables.ByName['Nit'].AsString := Nit;
        InformeDiario.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
        InformeDiario.Variables.ByName['usuario'].AsString := 'Todos';
        InformeDiario.Variables.ByName['Hoy'].AsDateTime := fFechaActual;
        InformeDiario.Variables.ByName['fechainforme'].AsString := DateToStr(FechaInforme);

        If InformeDiario.PrepareReport then
         begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := InformeDiario;
           frmVistaPreliminar.ShowModal;
         end;
       ibquery2.EmptyDataSet;
end;

procedure TfrmInformeCreditosCanceladosReales.Empleado;
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

procedure TfrmInformeCreditosCanceladosReales.EdFechaInformeEnter(Sender: TObject);
begin
        EdFechaInforme.Date := Date;
end;

procedure TfrmInformeCreditosCanceladosReales.EdFechaInformeKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCreditosCanceladosReales.CmdAceptarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCreditosCanceladosReales.CmdCerrarKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCreditosCanceladosReales.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmInformeCreditosCanceladosReales.FormShow(Sender: TObject);
begin
        If DmGeneral.IBTransaction1.InTransaction then
          DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;
end;

procedure TfrmInformeCreditosCanceladosReales.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
