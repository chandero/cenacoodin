unit UnitInformeTarjetasCanceladas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pr_Classes, pr_Common, pr_TxClasses, DB, IBCustomDataSet,
  IBQuery, ExtCtrls, ComCtrls, StdCtrls, Buttons, DataSetToExcel;

type
  TfrmTarjetasCanceladas = class(TForm)
    Panel1: TPanel;
    btnReporte: TBitBtn;
    btnCerrar: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDesde: TDateTimePicker;
    EdHasta: TDateTimePicker;
    IBQdata: TIBQuery;
    SD1: TSaveDialog;
    procedure btnReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarjetasCanceladas: TfrmTarjetasCanceladas;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmTarjetasCanceladas.btnReporteClick(Sender: TObject);
var
  ExcelFile:TDataSetToExcel;
begin
        if IBQdata.Transaction.InTransaction then
        begin
            IBQdata.Transaction.Commit;
        end;
        IBQdata.Transaction.StartTransaction;        
        IBQdata.Close;
        IBQdata.ParamByName('FECHA_INICIAL').AsDate := EdDesde.Date;
        IBQdata.ParamByName('FECHA_FINAL').AsDate := EdHasta.Date;
        IBQdata.Open;
        IBQdata.Last;
        IBQdata.First;
        SD1.Filter := 'Archivos Excel (*.xls)|*.XLS';
        if SD1.Execute then
        begin
          ExcelFile := TDataSetToExcel.Create(IBQdata,SD1.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
          ShowMessage('Archivo Guardado');
        end
        else
        begin
          ShowMessage('No se pudo guardar el archivo');
        end;
        IBQdata.Transaction.Commit;
end;

procedure TfrmTarjetasCanceladas.FormCreate(Sender: TObject);
begin
        EdDesde.Date := fFechaActual;
        EdHasta.Date := fFechaActual;
end;

procedure TfrmTarjetasCanceladas.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

end.
