unit UnitCambioSistemas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery;

type
  TFrmCambioSistemas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dtFecha1: TDateTimePicker;
    Label2: TLabel;
    dtFecha2: TDateTimePicker;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    IBQuery1: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCambioSistemas: TFrmCambioSistemas;

implementation
uses Unitglobales, ComObj;

{$R *.dfm}

procedure TFrmCambioSistemas.BitBtn1Click(Sender: TObject);
var
      Excel, WorkBook, WorkSheet: Variant;
      G :Integer;
      Format: OleVariant;
      _sArchivo :string;
const
       xlWBATWorksheet = -4167;
begin
       Excel := CreateOleObject('Excel.Application');
       Excel.DisplayAlerts := false;
       Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
       WorkSheet := WorkBook.WorkSheets[1];
       WorkSheet.Name := 'Aprobadas';
       G := 0;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          ParamByName('FECHA1').AsDate := dtFecha1.DateTime;
          ParamByName('FECHA2').AsDate := dtFecha2.DateTime;
          WorkSheet.Cells[1,4] := 'Registro de Requerimientos Entre: ' + DateToStr(dtFecha1.Date) + ' y ' + DateToStr(dtFecha2.Date);
          WorkSheet.Cells[3,1] := 'CONSECUTIVO';
          WorkSheet.Cells[3,2] := 'AREA';
          WorkSheet.Cells[3,3] := 'FECHA';
          WorkSheet.Cells[3,4] := 'REQUERIMIENTO';
          WorkSheet.Cells[3,5] := 'EXPLICACION';
          WorkSheet.Cells[3,6] := 'ID EMPLEADO';
          WorkSheet.Cells[1,1].ColumnWidth := 10;
          WorkSheet.Cells[1,2].ColumnWidth := 8;
          WorkSheet.Cells[1,3].ColumnWidth := 10;
          WorkSheet.Cells[1,4].ColumnWidth := 50;
          WorkSheet.Cells[1,5].ColumnWidth := 50;
          WorkSheet.range['A3:F3'].Font.FontStyle := 'Bold';
          Open;
          while not Eof do
          begin
           for G := 1 to 6 do
             WorkSheet.Cells[recno + 4, G] := Fields.Fields[G - 1].AsString;
            Next;
          end;
        end;
          _sArchivo := 'Requerimiento' + FormatDateTime('yyymmdd',dtFecha1.DateTime) + '_' + FormatDateTime('yyymmdd',dtFecha1.DateTime);
          workBook.SaveAs(_sArchivo);
          Excel.WorkBooks.Open(_sArchivo);
          Excel.visible:=True;
end;

procedure TFrmCambioSistemas.FormCreate(Sender: TObject);
begin
        dtFecha1.Date := fFechaActual;
        dtFecha2.Date := fFechaActual;        
end;

end.
