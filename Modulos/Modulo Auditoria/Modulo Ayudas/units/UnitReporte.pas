unit UnitReporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, ComCtrls, Buttons,
  pr_Common, pr_TxClasses;

type
  TfrmReporte = class(TForm)
    IBQuery1: TIBQuery;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery2: TIBQuery;
    Reporte: TprTxReport;
    procedure FormShow(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReporte: TfrmReporte;

implementation

{$R *.dfm}

uses UnitGlobales, unitDmGeneral;

procedure TfrmReporte.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

procedure TfrmReporte.CmdProcesarClick(Sender: TObject);
begin

        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          ParamByName('FECHA').AsDate := EdFechaCorte.Date;
          IBQuery2.Close;
          IBQuery2.ParamByName('FECHA').AsDate := EdFechaCorte.Date;
          try
           Open;
           IBQuery2.Open;
           Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
           Reporte.Variables.ByName['FECHACORTE'].AsDateTime := EdFechaCorte.Date;
           if Reporte.PrepareReport then
              Reporte.PreviewPreparedReport(True);
           Transaction.Commit;
          except
           raise;
          end;
        end;
end;

procedure TfrmReporte.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

end.
