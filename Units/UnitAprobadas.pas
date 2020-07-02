unit UnitAprobadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery;

type
  TFrmAprobadas = class(TForm)
    Panel1: TPanel;
    vFecha1: TDateTimePicker;
    vFecha2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBQuery1: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAprobadas: TFrmAprobadas;

implementation
uses UnitGlobales, ComObj;

{$R *.dfm}

procedure TFrmAprobadas.FormCreate(Sender: TObject);
begin
        vFecha1.DateTime := fFechaActual;
        vFecha2.DateTime := fFechaActual;
end;

procedure TFrmAprobadas.BitBtn1Click(Sender: TObject);
var   G :Integer;
      Excel, WorkBook, WorkSheet: Variant;
      DesAgencia :string;
      Format: OleVariant;
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
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT DESCRIPCION_AGENCIA FROM "gen$agencia" WHERE ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          DesAgencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
          SQL.Clear;
          SQL.Add('SELECT * FROM P_SOL_APROBADA(:FECHA1,:FECHA2)');
          ParamByName('FECHA1').AsDate := vFecha1.DateTime;
          ParamByName('FECHA2').AsDate := vFecha2.DateTime;
          Open;
           WorkSheet.Cells[1,1] := 'Agencia: ' +  DesAgencia;
           WorkSheet.Cells[3,1] := 'SOLICITUD';
           WorkSheet.Cells[3,2] := 'NOMBRES Y APELLIDOS';
           WorkSheet.Cells[3,3] := 'FECHA APROBACION';
           WorkSheet.Cells[3,4] := 'ENTE APROBADOR';
           WorkSheet.Cells[3,5] := 'VALOR';
           WorkSheet.Cells[1,1].ColumnWidth := 12;
           WorkSheet.Cells[1,2].ColumnWidth := 45;
           WorkSheet.range['A3:E3'].Font.FontStyle := 'Bold';
          while not Eof do
          begin
           for G := 1 to 5 do
             WorkSheet.Cells[recno + 5, G] := Fields.Fields[G - 1].AsString;
            Next;
          end;
        end;
          workBook.SaveAs('c:\archivo.xls');
          Excel.WorkBooks.Open('c:\archivo.xls');
          Excel.visible:=True;
end;

procedure TFrmAprobadas.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

end.
