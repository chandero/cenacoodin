unit UnitInformeColocacionesporClasificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses;

type
  Tfrminformecolocacionesporclasificacion = class(TForm)
    Panel1: TPanel;
    Grupo: TGroupBox;
    Judicial: TRadioButton;
    Castigada: TRadioButton;
    Vigente: TRadioButton;
    Prejuridico: TRadioButton;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQueryColocacion: TIBQuery;
    RColocacionEstado: TprTxReport;
    procedure CmdAceptarClick(Sender: TObject);
    procedure VigenteClick(Sender: TObject);
    procedure PrejuridicoClick(Sender: TObject);
    procedure JudicialClick(Sender: TObject);
    procedure CastigadaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frminformecolocacionesporclasificacion: Tfrminformecolocacionesporclasificacion;
  Estado : Integer;
  EsVigente:Integer;
  EsPrejuridico:Integer;
  EsJuridico:Integer;
  EsCastigado:Integer;
implementation

{$R *.dfm}

uses UnitDmGeneral;

procedure Tfrminformecolocacionesporclasificacion.CmdAceptarClick(
  Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;

        with IBQuerycolocacion do
        begin
          SQL.Clear;
          SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
          SQL.Add('where "col$estado".ES_VIGENTE = 1');
          Open;
          EsVigente := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          Close;

          SQL.Clear;
          SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
          SQL.Add('where "col$estado".ES_PREJURIDICO = 1');
          Open;
          EsPrejuridico := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          Close;

          SQL.Clear;
          SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
          SQL.Add('where "col$estado".ES_JURIDICO = 1');
          Open;
          EsJuridico := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          Close;

          SQL.Clear;
          SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
          SQL.Add('where "col$estado".ES_CASTIGADO = 1');
          Open;
          EsCastigado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          Close;

          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".NUMERO_CUENTA,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".PLAZO_COLOCACION,');
          SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
          SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$costas".VALOR_COSTAS,');
          SQL.Add('"col$costas".VALOR_HONORARIOS,');
          SQL.Add('"col$costas".VALOR_OTROS');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('LEFT JOIN "col$costas" ON ("col$colocacion".ID_AGENCIA = "col$costas".ID_AGENCIA) AND ("col$colocacion".ID_COLOCACION = "col$costas".ID_COLOCACION)');
          SQL.Add('where');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COlOCACION"');
          SQL.Add('ORDER BY "col$colocacion".ID_COLOCACION');
          ParamByName('ID_ESTADO_COLOCACION').AsInteger := Estado;
          Open;


          
        end;
end;

procedure Tfrminformecolocacionesporclasificacion.VigenteClick(
  Sender: TObject);
begin
        if Vigente.Checked = True then
           Estado := EsVigente
        else if Prejuridico.Checked = True then
           Estado := EsPrejuridico
        else if Judicial.Checked = True then
           Estado := EsJuridico
        else if Castigada.Checked = True then
           Estado := EsCastigado;
end;


procedure Tfrminformecolocacionesporclasificacion.PrejuridicoClick(
  Sender: TObject);
begin
        if Vigente.Checked = True then
           Estado := EsVigente
        else if Prejuridico.Checked = True then
           Estado := EsPrejuridico
        else if Judicial.Checked = True then
           Estado := EsJuridico
        else if Castigada.Checked = True then
           Estado := EsCastigado;
end;

procedure Tfrminformecolocacionesporclasificacion.JudicialClick(
  Sender: TObject);
begin
        if Vigente.Checked = True then
           Estado := EsVigente
        else if Prejuridico.Checked = True then
           Estado := EsPrejuridico
        else if Judicial.Checked = True then
           Estado := EsJuridico
        else if Castigada.Checked = True then
           Estado := EsCastigado;
end;

procedure Tfrminformecolocacionesporclasificacion.CastigadaClick(
  Sender: TObject);
begin
        if Vigente.Checked = True then
           Estado := EsVigente
        else if Prejuridico.Checked = True then
           Estado := EsPrejuridico
        else if Judicial.Checked = True then
           Estado := EsJuridico
        else if Castigada.Checked = True then
           Estado := EsCastigado;
end;

end.
