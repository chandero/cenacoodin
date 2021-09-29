unit UnitInformeContractualDescontadoUnaFecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses,
  ComCtrls, Buttons, DataSetToExcel;

type
  TfrmInformeContractualDescontadoUnaFecha = class(TForm)
    prTxReport1: TprTxReport;
    IBQuery1: TIBQuery;
    Label1: TLabel;
    edFecha: TDateTimePicker;
    BitBtn2: TBitBtn;
    SD1: TSaveDialog;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeContractualDescontadoUnaFecha: TfrmInformeContractualDescontadoUnaFecha;

implementation

{$R *.dfm}

uses unitDmGeneral;

procedure TfrmInformeContractualDescontadoUnaFecha.BitBtn2Click(
  Sender: TObject);
  var
    ExcelFile:TDataSetToExcel;
begin
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction.StartTransaction;
        IBQuery1.Close;
        IBQuery1.ParamByName('FECHA_MOVIMIENTO').AsDate := edFecha.Date;
        IBQuery1.Open;
        IBQuery1.Last;
        IBQuery1.First;
        if (IBQuery1.RecordCount > 0) then
        begin
          SD1.Filter := 'Archivos Excel (*.xls)|*.XLS';
          if SD1.Execute then
          begin
            ExcelFile := TDataSetToExcel.Create(IBQuery1,SD1.FileName);
            ExcelFile.WriteFile;
            ExcelFile.Free;
          end;
        end
        else
        begin
          ShowMessage('No se encontraron registros para ese día');
        end;
        IBQuery1.Transaction.Commit;
end;

end.
