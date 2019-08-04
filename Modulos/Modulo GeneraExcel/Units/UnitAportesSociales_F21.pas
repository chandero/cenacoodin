unit UnitAportesSociales_F21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, DB, IBSQL, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, DBClient, DateUtils, Grids, DBGrids;

type
  TfrmAportesSociales_F21 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdFechaCorte: TDateTimePicker;
    dtFechaR: TDateTimePicker;
    Panel2: TPanel;
    CmdProceso: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQproceso: TIBQuery;
    SD1: TSaveDialog;
    btnAExcel: TBitBtn;
    ProgressBar1: TProgressBar;
    CDSaportes: TClientDataSet;
    CDSaportesTIPO: TStringField;
    CDSaportesIDENTIFICACION: TStringField;
    CDSaportesSALDO: TCurrencyField;
    CDSaportesAPORTE_MENSUAL: TCurrencyField;
    CDSaportesAPORTE_ORDINARIO: TCurrencyField;
    CDSaportesAPORTE_EXTRAORDINARIO: TCurrencyField;
    CDSaportesREVALORIZACION: TCurrencyField;
    CDSaportesPROMEDIO: TCurrencyField;
    CDSaportesULTIMA_FECHA: TDateField;
    DBGridAportes: TDBGrid;
    DSaportes: TDataSource;
    procedure CmdProcesoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAportesSociales_F21: TfrmAportesSociales_F21;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales, DataSetToExcel;

procedure TfrmAportesSociales_F21.CmdProcesoClick(Sender: TObject);
var
   Anho: Integer;
   Mes: Integer;
   FechaInicial: TDateTime;
   FechaMes: TDateTime;
   FechaFinal: TDateTime;
begin

       Anho := YearOf(EdFechaCorte.Date);
       Mes := MonthOf(EdFechaCorte.Date);

       TryEncodeDate(Anho,01,01,FechaInicial);
       TryEncodeDate(Anho, Mes, 01, FechaMes);
       TryEncodeDate(Anho, Mes, DaysInAMonth(Anho, Mes), FechaFinal);

       IBQproceso.Close;
       IBQproceso.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
       IBQproceso.ParamByName('FECHA_MES').AsDate := FechaMes;
       IBQproceso.ParamByName('FECHA_FINAL').AsDate := FechaFinal;
       IBQproceso.ParamByName('ANHO').AsInteger := Anho;

       IBQproceso.Open;
       IBQproceso.First;
       CDSaportes.Open;
       CDSaportes.EmptyDataSet;


       while not IBQproceso.Eof do
       begin
           Application.ProcessMessages;
           CDSaportes.Insert;
           case IBQproceso.FieldByName('ID_IDENTIFICACION').AsInteger of
             1: CDSaportesTIPO.Value := 'R';
             2: CDSaportesTIPO.Value := 'I';
             3: CDSaportesTIPO.Value := 'C';
             4: CDSaportesTIPO.Value := 'N';
             6: CDSaportesTIPO.Value := 'E';
             7: CDSaportesTIPO.Value := 'E';
             8: CDSaportesTIPO.Value := 'P';
             9: CDSaportesTIPO.Value := 'U';
             else
                 CDSaportesTIPO.Value := 'O';
           end;
           CDSaportesIDENTIFICACION.Value := IBQproceso.FieldByName('DOCUMENTO').AsString;
           CDSaportesSALDO.Value := IBQproceso.FieldByName('SALDO_ACTUAL').AsCurrency;
           CDSaportesAPORTE_MENSUAL.Value := IBQproceso.FieldByName('APORTE_MENSUAL').AsCurrency;
           CDSaportesAPORTE_ORDINARIO.Value := IBQproceso.FieldByName('APORTE_ORDINARIO').AsCurrency;
           CDSaportesAPORTE_EXTRAORDINARIO.Value := IBQproceso.FieldByName('APORTE_EXTRAORDINARIO').AsCurrency;
           CDSaportesREVALORIZACION.Value := IBQproceso.FieldByName('REVALORIZACION').AsCurrency;
           CDSaportesPROMEDIO.Value := IBQproceso.FieldByName('PROMEDIO').AsCurrency;
           if (IBQproceso.FieldByName('FECHA_PAGO').AsDateTime > 0) then
               CDSaportesULTIMA_FECHA.Value := IBQproceso.FieldByName('FECHA_PAGO').AsDateTime
           else
               CDSaportesULTIMA_FECHA.Clear;
           if (CDSaportesSALDO.Value <> 0) then
                   CDSaportes.Post
           else
               CDSaportes.Cancel;

           IBQproceso.Next;

       end;

       btnAExcel.Enabled := true;

end;

procedure TfrmAportesSociales_F21.FormCreate(Sender: TObject);
begin
        if IBQproceso.Transaction.InTransaction then
           IBQproceso.Transaction.Rollback;
        IBQproceso.Transaction.StartTransaction;
end;

procedure TfrmAportesSociales_F21.btnAExcelClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          if (SD1.Execute) then
          begin
           CDSaportes.First;
           ExcelFile := TDataSetToExcel.Create(CDSaportes,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;

end;

procedure TfrmAportesSociales_F21.CmdCerrarClick(Sender: TObject);
begin
        IBQproceso.Transaction.Commit;
        Close;
end;

procedure TfrmAportesSociales_F21.FormShow(Sender: TObject);
var
  Anho: Integer;
  Mes : Integer;
  FechaHoy: TDateTime;
begin
        FechaHoy := fFechaActual;
        Anho := YearOf(FechaHoy);
        Mes:= MonthOf(FechaHoy);
        TryEncodeDate(Anho, Mes, DaysInAMonth(Anho, Mes), FechaHoy);

        EdFechaCorte.Date := FechaHoy;
        dtFechaR.Date := FechaHoy;
end;

end.
