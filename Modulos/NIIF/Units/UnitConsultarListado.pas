unit UnitConsultarListado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, JvToolEdit, pr_Common, pr_TxClasses,
  FR_Shape, FR_Chart, FR_ChBox, FR_Class;

type
  TfrmVerListados = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OD1: TJvFilenameEdit;
    Reporte: TprTxReport;
    fPeporte: TfrReport;
    frCheckBoxObject1: TfrCheckBoxObject;
    frChartObject1: TfrChartObject;
    frShapeObject1: TfrShapeObject;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerListados: TfrmVerListados;

implementation

{$R *.dfm}

procedure TfrmVerListados.BitBtn1Click(Sender: TObject);
var
  ext:string;
begin

        if OD1.FileName <> '' then begin
          ext := ExtractFileExt(OD1.FileName);
          if ext = '.pr' then
          begin
            Reporte.LoadPreparedReportFromFile(OD1.FileName);
            Reporte.PreviewPreparedReport(True);
          end
          else
          begin
            fPeporte.LoadFromFile(OD1.FileName);
            fPeporte.ShowReport;
          end;
        end;
end;

procedure TfrmVerListados.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

end.
