unit UnitInformeCuotaRecalculada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, FR_DSet, FR_DBSet, FR_Class, DataSetToExcel;

type
  TfrmInformeCuotaRecalculada = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edFechaFinal: TDateTimePicker;
    edFechaInicial: TDateTimePicker;
    Label2: TLabel;
    Panel1: TPanel;
    CmdImprimir: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdImprimirProvision: TBitBtn;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    IBQuery1: TIBQuery;
    IBQuery1FECHA: TDateField;
    IBQuery1ID_COLOCACION: TIBStringField;
    IBQuery1CUOTA_ANTERIOR: TIBBCDField;
    IBQuery1CUOTA_NUEVA: TIBBCDField;
    IBQuery1CUOTA_CAMBIO: TIntegerField;
    IBQuery1ASOCIADO: TStringField;
    SD1: TSaveDialog;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdImprimirClick(Sender: TObject);
    procedure CmdImprimirProvisionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeCuotaRecalculada: TfrmInformeCuotaRecalculada;

implementation

{$R *.dfm}

uses UnitGlobales, UnitDmGeneral;

procedure TfrmInformeCuotaRecalculada.CmdCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmInformeCuotaRecalculada.FormCreate(Sender: TObject);
var
  _vFecha: TDate;
begin
        _vFecha := fFechaActual;
        edFechaFinal.Date := _vFecha;
        edFechaFinal.Date := _vFecha;
end;

procedure TfrmInformeCuotaRecalculada.CmdImprimirClick(Sender: TObject);
begin
        with IBQuery1 do
        begin
                IBQuery1.Close;
                IBQuery1.ParamByName('FECHA_INICIAL').AsDate := edFechaInicial.Date;
                IBQuery1.ParamByName('FECHA_FINAL').AsDate := edFechaFinal.Date;
                IBQuery1.Open;
        end;

        frReport1.LoadFromFile('Reporte\RepCarteraCuotaRecalculada.frf');
        frReport1.Dictionary.Variables.Variable['EMPRESA'] := QuotedStr(Empresa);
        frReport1.Dictionary.Variables.Variable['NIT'] := QuotedStr(Nit);
        frReport1.Dictionary.Variables.Variable['FECHA_INICIAL'] := edFechaInicial.Date;
        frReport1.Dictionary.Variables.Variable['FECHA_FINAL'] := edFechaFinal.Date;
        frReport1.Dictionary.Variables.Variable['HOY'] := fFechaActual;
        if (frReport1.PrepareReport) then
           frReport1.ShowPreparedReport;
                
end;

procedure TfrmInformeCuotaRecalculada.CmdImprimirProvisionClick(
  Sender: TObject);
  var
    ExcelFile : TDataSetToExcel;
begin
        with IBQuery1 do
        begin
                IBQuery1.Close;
                IBQuery1.ParamByName('FECHA_INICIAL').AsDate := edFechaInicial.Date;
                IBQuery1.ParamByName('FECHA_FINAL').AsDate := edFechaFinal.Date;
                IBQuery1.Open;
        end;

          SD1.Title := 'Nombre Para El Archivo de Cartera';
          if (SD1.Execute) then
          begin
           //CDSProceso.Filtered := False;
           IBQuery1.First;
           ExcelFile := TDataSetToExcel.Create(IBQuery1,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
           ShowMessage('Archivo Guardado...!');
          end
          else
          begin
           ShowMessage('Archivo no generado...!');
          end;

end;

procedure TfrmInformeCuotaRecalculada.FormShow(Sender: TObject);
begin
        if (IBQuery1.Transaction.InTransaction) then
           IBQuery1.Transaction.Commit;
        IBQuery1.Transaction.StartTransaction;
end;

procedure TfrmInformeCuotaRecalculada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        IBQuery1.Transaction.Commit;
end;

end.
