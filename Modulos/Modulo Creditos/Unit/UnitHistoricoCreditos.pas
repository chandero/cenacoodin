unit UnitHistoricoCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, UnitDmGeneral, IBDatabase,
  DB, IBCustomDataSet, IBQuery, DBClient, Provider;

type
  TfrmHistoricoCreditos = class(TForm)
    GroupBox1: TGroupBox;
    edFechaInicial: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edFechaFinal: TDateTimePicker;
    Panel1: TPanel;
    btnCerrar: TBitBtn;
    btnExcel: TBitBtn;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    SD1: TSaveDialog;
    CDSdata: TClientDataSet;
    DPdata: TDataSetProvider;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoCreditos: TfrmHistoricoCreditos;

implementation

{$R *.dfm}

uses DataSetToExcel;

procedure TfrmHistoricoCreditos.btnCerrarClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmHistoricoCreditos.FormCreate(Sender: TObject);
begin
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction1.StartTransaction;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := IBTransaction1;
end;

procedure TfrmHistoricoCreditos.btnExcelClick(Sender: TObject);
var
  toExcel : TDataSetToExcel;
begin
        if (SD1.Execute) then
        begin
          btnExcel.Enabled := False;
          IBQuery1.Close;
          IBQuery1.ParamByName('FECHA_INICIAL').AsDate := edFechaInicial.Date;
          IBQuery1.ParamByName('FECHA_FINAL').AsDate := edFechaFinal.Date;
          IBQuery1.Open;
          IBQuery1.First;
          CDSdata.Open;
          toExcel := TDataSetToExcel.Create(CDSdata, SD1.FileName);
          toExcel.WriteFile;
          toExcel.Free;
          showMessage('Archivo Guardado...');
        end;
end;

end.
