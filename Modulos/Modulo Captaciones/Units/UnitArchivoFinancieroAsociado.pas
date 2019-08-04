unit UnitArchivoFinancieroAsociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls, DataSetToExcel, UnitDmGeneral,
  ComCtrls;

type
  TfrmArchivoFinancieroAsociado = class(TForm)
    IBQdata: TIBQuery;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnExcel: TBitBtn;
    btnCerrar: TBitBtn;
    SD1: TSaveDialog;
    Label1: TLabel;
    edFechaCorte: TDateTimePicker;
    IBQdataID_PERSONA: TIBStringField;
    IBQdataINGRESOS_A_PRINCIPAL: TIBBCDField;
    IBQdataOTROS: TIBBCDField;
    IBQdataEGRESOS: TIBBCDField;
    IBQdataACTIVOS: TIBBCDField;
    IBQdataPASIVOS: TIBBCDField;
    IBQdataFECHA: TIBStringField;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArchivoFinancieroAsociado: TfrmArchivoFinancieroAsociado;

implementation

{$R *.dfm}

procedure TfrmArchivoFinancieroAsociado.btnProcesarClick(Sender: TObject);
begin
        with IBQdata do
        begin
            ParamByName('FECHA_CORTE').AsDate := edFechaCorte.Date;
            Open;
            btnExcel.Enabled := True;
            btnExcel.Click;
        end;
end;

procedure TfrmArchivoFinancieroAsociado.btnExcelClick(Sender: TObject);
var
  ExcelFile:TDataSetToExcel;
begin
        IBQdata.Last;
        IBQdata.First;
        SD1.Filter := 'Archivos Excel (*.xls)|*.XLS';
        if SD1.Execute then
        begin
          ExcelFile := TDataSetToExcel.Create(IBQdata,SD1.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TfrmArchivoFinancieroAsociado.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmArchivoFinancieroAsociado.FormShow(Sender: TObject);
begin
        if (dmGeneral.IBTransaction1.InTransaction) then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        IBQdata.Database := dmGeneral.IBDatabase1;
        IBQdata.Transaction := dmGeneral.IBTransaction1;
end;

end.
