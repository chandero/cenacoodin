unit UnitRangosColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons,
  pr_Common, pr_TxClasses;

type
  TFrmRangosColocacion = class(TForm)
    Panel1: TPanel;
    DBrangos: TDBGrid;
    CDrangos: TClientDataSet;
    CDrangosminimo: TCurrencyField;
    CDrangosmaximo: TCurrencyField;
    DSrangos: TDataSource;
    Panel2: TPanel;
    BTprocesar: TBitBtn;
    BTreporte: TBitBtn;
    BTcerrar: TBitBtn;
    CDrangosid_rango: TIntegerField;
    CDresultado: TClientDataSet;
    CDresultadoid_rango: TIntegerField;
    CDresultadorango_minimo: TCurrencyField;
    CDresultadorango_maximo: TCurrencyField;
    CDresultadovalor_desembolso: TCurrencyField;
    CDresultadovalor_actual: TCurrencyField;
    report3: TprTxReport;
    CDresultadonumero: TIntegerField;
    procedure DBrangosKeyPress(Sender: TObject; var Key: Char);
    procedure BTcerrarClick(Sender: TObject);
    procedure BTprocesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BTreporteClick(Sender: TObject);
  private
  descripcion_agencia :string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRangosColocacion: TFrmRangosColocacion;

implementation
uses unitglobales, UnitDmSolicitud, UnitVistaPreliminar;
{$R *.dfm}

procedure TFrmRangosColocacion.DBrangosKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRangosColocacion.BTcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmRangosColocacion.BTprocesarClick(Sender: TObject);
var     contador :Integer;
begin
        CDrangos.First;
        CDresultado.CancelUpdates;
        while not CDrangos.Eof do
        begin
          with DmSolicitud.IBSQL1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select sum("col$colocacion".valor_desembolso) as VALOR_DESEMBOLSO,');
            SQL.Add('sum("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO, count("col$colocacion".id_colocacion) as CONTADOR');
            SQL.Add('from "col$colocacion"');
            SQL.Add('where ID_ESTADO_COLOCACION IN (0,1,2) AND');
            SQL.Add('SALDO between :RANGO_MINIMO and :RANGO_MAXIMO AND');
            SQL.Add('ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('RANGO_MINIMO').AsCurrency := CDrangos.FieldByName('minimo').AsCurrency;
            ParamByName('RANGO_MAXIMO').AsCurrency := CDrangos.FieldByName('maximo').AsCurrency;
            ExecQuery;
            CDresultado.Append;
            CDresultado.FieldValues['id_rango'] := CDrangos.FieldByName('id_rango').AsInteger;
            CDresultado.FieldValues['rango_minimo'] := CDrangos.FieldByName('minimo').AsCurrency;
            CDresultado.FieldValues['rango_maximo'] := CDrangos.FieldByName('maximo').AsCurrency;
            CDresultado.FieldValues['valor_desembolso'] := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
            CDresultado.FieldValues['valor_actual'] := FieldByName('SALDO').AsCurrency;
            CDresultado.FieldValues['numero'] := FieldByName('CONTADOR').AsCurrency;

            CDresultado.Post;
            Close;
            SQL.Clear;
            SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia"');
            SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ExecQuery;
            descripcion_agencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
            Close;
          end;
          CDrangos.Next;
        end;
        BTreporte.Click;
end;

procedure TFrmRangosColocacion.FormCreate(Sender: TObject);
begin
        DmSolicitud := TDmSolicitud.Create(self);
        with DmSolicitud.IBSQL1 do
        begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('select * from "col$rangoscolocacion"');
           SQL.Add('order by ID_RANGO');
           ExecQuery;
           while not Eof do
           begin
             CDrangos.Append;
             CDrangos.FieldValues['id_rango'] := FieldByName('ID_RANGO').AsCurrency;
             CDrangos.FieldValues['minimo'] := FieldByName('RANGO_MINIMO').AsCurrency;
             CDrangos.FieldValues['maximo'] := FieldByName('RANGO_MAXIMO').AsCurrency;
             CDrangos.Post;
             Next;
           end;
        end;
end;

procedure TFrmRangosColocacion.BTreporteClick(Sender: TObject);
begin
           if CDresultado.RecordCount <> 0 then
           begin
              Empleado;
              report3.Variables.ByName['empresa'].AsString := Empresa;
              report3.Variables.ByName['hoy'].AsDateTime := Date;
              report3.Variables.ByName['Empleado'].AsString := Nombres +' ' + Apellidos;
              report3.Variables.ByName['Nit'].AsString := Nit;
              report3.Variables.ByName['oficina'].AsString := descripcion_agencia;
              frmVistaPreliminar := TfrmVistaPreliminar.Create(self);
              if report3.PrepareReport then
               begin
                 frmVistaPreliminar.Reporte := Report3;
                 frmVistaPreliminar.ShowModal;
               end;
           end;

end;

end.
