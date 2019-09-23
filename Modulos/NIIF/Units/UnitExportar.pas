unit UnitExportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Buttons, DB, IBCustomDataSet, IBQuery;

type
  TFrmExportar = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Fecha1: TMaskEdit;
    Fecha2: TMaskEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBQuery: TIBQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExportar: TFrmExportar;

implementation
uses ComObj;

{$R *.dfm}

procedure TFrmExportar.Button1Click(Sender: TObject);
const  xlWBATWorksheet = -4167;

var
  Excel, WorkBook, WorkSheet: Variant;
  j,i:Integer;
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.DisplayAlerts := false;
  Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
  WorkSheet := WorkBook.WorkSheets[1];
  WorkSheet.Name := 'libro1';
  for J := 0 to 10 do
  WorkSheet.Cells[1, J + 1] := j;
  Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
  WorkSheet := WorkBook.WorkSheets[1];
  WorkSheet.Name := 'libro2';
  for J := 0 to 10 do
  WorkSheet.Cells[j, 1] := j;
  WorkBook.SaveAs('c:\exogena\archivo.xls');
  Excel.Quit;
end;

procedure TFrmExportar.Button2Click(Sender: TObject);
var   j :Integer;
const
  xlWBATWorksheet = -4167;

var
  Excel, WorkBook, WorkSheet: Variant;

begin
  // crear instancia de la aplicación Excel (requieres la unidad ComObj)

  Excel := CreateOleObject('Excel.Application');

  // evitar que nos pregunte si deseamos sobreescribir el archivo

  Excel.DisplayAlerts := false;

  // agregar libro de trabajo

  Workbook := Excel.Workbooks.Add(xlWBATWorksheet);

  // tomar una referencia a la hoja creada

  WorkSheet := WorkBook.WorkSheets[1];

  WorkSheet.Name := 'nombre de la hoja';

  //Llenamos las Celdas
  //(Toma en cuenta que las columnas y filas empiezan en 1, y que en el
  // WorkSheet.Cells[I,J]. I es la Fila y J es la Columna.)

  // Tomando desde un StringGrid

  for J := 0 to 10 do
  WorkSheet.Cells[1, J + 1] := j;

  // guardar el archivo

  WorkBook.SaveAs('c:\archivo123.xls');

  Excel.Quit;

end;

procedure TFrmExportar.BitBtn1Click(Sender: TObject);
var   j :Integer;
const
  xlWBATWorksheet = -4167;

var
  Excel, WorkBook, WorkSheet: Variant;

begin
  Excel := CreateOleObject('Excel.Application');
  Excel.DisplayAlerts := false;
  Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
  WorkSheet := WorkBook.WorkSheets[1];
  WorkSheet.Name := 'Datos';
  with IBQuery do
  begin
    Close;
    if Transaction.InTransaction then
       Transaction.Commit;
    Transaction.StartTransaction;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('ID_AGENCIA,');
    SQL.Add('ID_TIPO_CAPTACION,');
    SQL.Add('NUMERO_CUENTA,');
    SQL.Add('DIGITO_CUENTA,');
    SQL.Add('FECHA_ENTREGA,');
    SQL.Add('HORA_ENTREGA,');
    SQL.Add('ANO,');
    SQL.Add('ID_EMPLEADO');
    SQL.Add('FROM');
    SQL.Add('"gen$detalles"');
    SQL.Add('WHERE');
    SQL.Add('(HORA_ENTREGA BETWEEN :HORA1 AND :HORA2) AND ');
    SQL.Add('(FECHA_ENTREGA = :FECHA)');
    ParamByName('HORA1').AsTime := StrToTime(Fecha1.Text);
  end;
  for J := 0 to 10 do
  WorkSheet.Cells[1, J + 1] := 25;
  WorkBook.SaveAs('c:\archivo123.xls');
  Excel.Quit;
end;

procedure TFrmExportar.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

end.
