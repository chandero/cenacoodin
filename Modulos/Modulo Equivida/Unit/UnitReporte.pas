unit UnitReporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, IBDatabase, DB,
  IBCustomDataSet, IBQuery, FR_DSet, FR_DBSet, FR_Class;

type
  TFrmReporte = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    frReport1: TfrReport;
    frCompositeReport1: TfrCompositeReport;
    frDBDataSet1: TfrDBDataSet;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  FrmReporte: TFrmReporte;

implementation

uses UnitImpresion, UnitdmGeneral, unitMain;

{$R *.dfm}

procedure TFrmReporte.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frCompositeReport1.DoublePass := True;
        frCompositeReport1.Reports.Clear;
        frCompositeReport1.Reports.Add(frReport1);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmReporte.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'fecha1' then
           ParValue := fecha1.Date;
        if ParName = 'fecha2' then
           ParValue := fecha2.Date;
end;

procedure TFrmReporte.BitBtn1Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
           Close;
           ParamByName('fecha1').AsDate := fecha1.Date;
           ParamByName('fecha2').AsDate := fecha2.Date;
           Open;
        end;
        imprimir_reporte(frmMain.wpath+'reportes\repseguros.frf');
end;

procedure TFrmReporte.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmReporte.FormCreate(Sender: TObject);
begin
        fecha1.Date := Date;
        fecha2.Date := Date;
end;

end.
