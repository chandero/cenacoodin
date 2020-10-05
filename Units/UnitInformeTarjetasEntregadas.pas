unit UnitInformeTarjetasEntregadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, pr_Classes, pr_Common,
  pr_TxClasses, DB, IBCustomDataSet, IBQuery, DataSetToExcel, DBClient;

type
  TfrmTarjetasEntregadas = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    EdDesde: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    EdHasta: TDateTimePicker;
    btnReporte: TBitBtn;
    btnCerrar: TBitBtn;
    IBQdata: TIBQuery;
    SD1: TSaveDialog;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarjetasEntregadas: TfrmTarjetasEntregadas;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmTarjetasEntregadas.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTarjetasEntregadas.btnReporteClick(Sender: TObject);
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

procedure TfrmTarjetasEntregadas.FormCreate(Sender: TObject);
begin
        EdDesde.Date := fFechaActual;
        EdHasta.Date := fFechaActual;
end;

end.
