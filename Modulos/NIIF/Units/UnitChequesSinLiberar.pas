unit UnitChequesSinLiberar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, ExtCtrls,
  StdCtrls, Buttons;

type
  TfrmChequesSinLiberar = class(TForm)
    CDCheques: TIBQuery;
    Panel1: TPanel;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    PRcheques: TprTxReport;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
  private
    procedure cheques;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChequesSinLiberar: TfrmChequesSinLiberar;

implementation

uses unitDmGeneral, UnitVistaPreliminar, unitGlobales;

{$R *.dfm}

procedure TfrmChequesSinLiberar.cheques;
begin
        frmVistaPreliminar := TfrmVistaPreliminar.Create(self);
        with CDCheques do
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT DISTINCT');
           SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
           SQL.Add('"gen$agencia".ID_AGENCIA,');
           SQL.Add('"gen$bancos".DESCRIPCION ,');
           SQL.Add('"tes$cheques".NUMERO_CHEQUE,');
           SQL.Add('"tes$cheques".ID_TIPO_CAPTACION,');
           SQL.Add('"tes$cheques".NUMERO_CUENTA,');
           SQL.Add('"tes$cheques".DIGITO_CUENTA,');
           SQL.Add('"tes$cheques".VALOR,');
           SQL.Add('"tes$cheques".FECHA_CONSIGNADO,');
           SQL.Add('"tes$cheques".PLAZA');
           SQL.Add('FROM');
           SQL.Add('"tes$cheques"');
           SQL.Add('LEFT OUTER JOIN "gen$bancos" ON ("tes$cheques".ID_BANCO = "gen$bancos".ID_BANCO)');
           SQL.Add('LEFT OUTER JOIN "gen$agencia" ON ("tes$cheques".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
           SQL.Add('WHERE');
           SQL.Add('("tes$cheques".LIBERADO = 0)');
           SQL.Add('ORDER BY');
           SQL.Add('"tes$cheques".PLAZA');
           Open;
           Last;
           First;
              PRcheques.Variables.ByName['empresa'].AsString := Empresa;
              PRcheques.Variables.ByName['hoy'].AsDateTime := Date;
              PRcheques.Variables.ByName['Empleado'].AsString := DBAlias;
              PRcheques.Variables.ByName['Nit'].AsString := Nit;
              if prcheques.PrepareReport then
               begin
                 frmVistaPreliminar.Reporte := PRcheques;
                 frmVistaPreliminar.ShowModal;
               end;
           Close;
        end;
end;

procedure TfrmChequesSinLiberar.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmChequesSinLiberar.CmdProcesarClick(Sender: TObject);
begin
        cheques;
end;

end.
