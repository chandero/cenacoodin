unit UnitArchivoTransacciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, UnitDmGeneral,
  IBCustomDataSet, IBQuery, DB, DBClient, DateUtils, DataSetToExcel;

type
  TfrmArchivoTransacciones = class(TForm)
    Label1: TLabel;
    edFechaInicial: TDateTimePicker;
    Label2: TLabel;
    edFechaFinal: TDateTimePicker;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnExcel: TBitBtn;
    btnCerrar: TBitBtn;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1FECHA: TDateField;
    ClientDataSet1HORA: TTimeField;
    ClientDataSet1TIPO: TStringField;
    ClientDataSet1EFECTIVO: TCurrencyField;
    ClientDataSet1CHEQUE: TCurrencyField;
    ClientDataSet1NIT: TStringField;
    ClientDataSet1CODPROD: TStringField;
    ClientDataSet1NUMEROPROD: TStringField;
    ClientDataSet1CODCANAL: TStringField;
    ClientDataSet1CODJURISDICCION: TStringField;
    IBQdata: TIBQuery;
    SD1: TSaveDialog;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArchivoTransacciones: TfrmArchivoTransacciones;

implementation

{$R *.dfm}

procedure TfrmArchivoTransacciones.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmArchivoTransacciones.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        IBQdata.Database := dmGeneral.IBDatabase1;
        IBQdata.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmArchivoTransacciones.btnProcesarClick(Sender: TObject);
var
  _vFechaInicial: TDateTime;
  _vFechaFinal: TDateTime;
begin

        _vFechaInicial :=  EncodeDateTime(YearOf(edFechaInicial.Date), MonthOf(edFechaInicial.Date), DayOf(edFechaInicial.Date), 00, 00, 00, 00);
        _vFechaFinal := EncodeDateTime(YearOf(edFechaFinal.Date), MonthOf(edFechaFinal.Date), DayOf(edFechaFinal.Date), 23, 59, 59, 999);
        with IBQdata do
        begin
            ParamByName('FECHA_INICIAL').AsDateTime := _vFechaInicial;
            ParamByName('FECHA_FINAL').AsDateTime := _vFechaFinal;
            Open;
            btnExcel.Enabled := True;
            btnExcel.Click;
        end;
end;

procedure TfrmArchivoTransacciones.btnExcelClick(Sender: TObject);
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

end.
