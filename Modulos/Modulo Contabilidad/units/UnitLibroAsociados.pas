unit UnitLibroAsociados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ComCtrls, DB, IBCustomDataSet, IBQuery,
  FR_Class, JvEdit, JvTypedEdit, DateUtils, DBClient, Provider, FR_DSet,
  FR_DBSet, pr_Common, pr_Classes;

type
  TfrmLibroAsociados = class(TForm)
    GroupBox1: TGroupBox;
    Periodo: TLabel;
    CBMeses: TComboBox;
    Label4: TLabel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    ProgressBar1: TProgressBar;
    frReport1: TfrReport;
    IBQproceso: TIBQuery;
    EdAno: TJvYearEdit;
    CDSdata: TClientDataSet;
    frDBDSdata: TfrDBDataSet;
    CDSdataDOCUMENTO: TStringField;
    CDSdataASOCIADO: TStringField;
    CDSdataFECHA_INGRESO: TDateField;
    CDSdataFECHA_RETIRO: TDateField;
    CDSdataDIRECCION: TStringField;
    CDSdataSALDO_ACTUAL: TCurrencyField;
    btnAExcel: TBitBtn;
    SD1: TSaveDialog;
    prReport1: TprReport;
    procedure CBMesesExit(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLibroAsociados: TfrmLibroAsociados;
  Mes : String;
  MesCorte : String;
  NomMes : String;
  AnoCorte : Integer;

  
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, DataSetToExcel;

procedure TfrmLibroAsociados.CBMesesExit(Sender: TObject);
begin
        With CBMeses do
         case ItemIndex of
           0: begin
                Mes := '01';
                MesCorte := '00';
                AnoCorte := AnoCorte - 1;
                NomMes := 'Enero';
              end;
           1: begin
                Mes := '02';
                MesCorte := '01';
                NomMes := 'Febrero';
              end;
           2: begin
                Mes := '03';
                MesCorte := '02';
                NomMes := 'Marzo';
              end;
           3: begin
                Mes := '04';
                MesCorte := '03';
                NomMes := 'Abril';
              end;
           4: begin
                Mes := '05';
                MesCorte := '04';
                NomMes := 'Mayo';
              end;
           5: begin
                Mes := '06';
                MesCorte := '05';
                NomMes := 'Junio';
              end;
           6: begin
                Mes := '07';
                MesCorte := '06';
                NomMes := 'Julio';
              end;
           7: begin
                Mes := '08';
                MesCorte := '07';
                NomMes := 'Agosto';
              end;
           8: begin
                Mes := '09';
                MesCorte := '08';
                NomMes := 'Septiembre';
              end;
           9: begin
                Mes := '10';
                MesCorte := '09';
                NomMes := 'Octubre';
              end;
          10: begin
                Mes := '11';
                MesCorte := '10';
                NomMes := 'Noviembre';
              end;
          11: begin
                Mes := '12';
                MesCorte := '11';
                NomMes := 'Diciembre';
              end;
         end;

end;

procedure TfrmLibroAsociados.CmdCerrarClick(Sender: TObject);
begin
        if (IBQproceso.Transaction.InTransaction) then
           IBQproceso.Transaction.Commit;
        Close;
end;

procedure TfrmLibroAsociados.CmdAceptarClick(Sender: TObject);
var
   FechaInicial, FechaFinal: TDateTime;
   Month : Integer;
   Year: Integer;
begin
        Year := EdAno.Value;
        Month := CBMeses.ItemIndex + 1;
        TryEncodeDate(EdAno.Value,01,01,FechaInicial);
        TryEncodeDate(EdAno.Value,Month,DaysInAMonth(Year,Month), FechaFinal);

        IBQproceso.Close;
        IBQproceso.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
        IBQproceso.ParamByName('FECHA_FINAL').AsDate := FechaFinal;
        IBQproceso.ParamByName('ANHO').AsInteger := Year;
        IBQproceso.Open;
        IBQProceso.Last;
        IBQproceso.First;
        CDSdata.Open;
        CDSdata.EmptyDataSet;

        ProgressBar1.Min := 0;
        Progressbar1.Max := IBQproceso.RecordCount;
        Progressbar1.Position := 0;


        while not IBQproceso.Eof do
        begin
               ProgressBar1.Position := IBQproceso.RecNo;
               Application.ProcessMessages;
               CDSdata.Insert;
               CDSdataDOCUMENTO.Value := IBQproceso.FieldByName('DOCUMENTO').AsString;
               CDSdataASOCIADO.Value := IBQproceso.FieldByName('ASOCIADO').AsString;
               CDSdataFECHA_INGRESO.Value := IBQproceso.FieldByName('FECHA_INGRESO').AsDateTime;
               CDSdataSALDO_ACTUAL.Value := IBQproceso.FieldByName('SALDO_ACTUAL').AsCurrency;
               if (IBQproceso.FieldByName('FECHA_RETIRO').AsDateTime > 0) then
               begin
                       CDSdataFECHA_RETIRO.Value := IBQproceso.FieldByName('FECHA_RETIRO').AsDateTime;
                       CDSdataSALDO_ACTUAL.Value := 0;
               end
               else
                       CDSdataFECHA_RETIRO.Clear;
               CDSdataDIRECCION.Value := IBQproceso.FieldByName('DIRECCION').AsString;

               if (IBQproceso.FieldByName('FECHA_RETIRO').AsDateTime > 0 ) and (IBQProceso.FieldByName('FECHA_RETIRO').AsDateTime < FechaInicial)
                  //or (IBQProceso.FieldByName('FECHA_RETIRO').AsDateTime > FechaFinal)
               then
                  CDSdata.Cancel
               else
                  CDSdata.Post;
               IBQproceso.Next;
        end;
        CDSdata.First;

//        frReport1.LoadFromFile(Application.GetNamePath+'\ReportesCon\frLibroAsociados.frf');
//        if frReport1.PrepareReport then
//           frReport1.ShowPreparedReport;

//        prReport1.LoadTemplateFromFile(Application.GetNamePath+'\ReportesCon\prLibroAsociados.prt', true);
        if prReport1.PrepareReport then
          prReport1.PreviewPreparedReport(true);

        btnAExcel.Enabled := True;
end;

procedure TfrmLibroAsociados.FormCreate(Sender: TObject);
begin
        if (IBQproceso.Transaction.InTransaction) then
           IBQproceso.Transaction.Commit;
        IBQproceso.Transaction.StartTransaction;
        EdAno.Value := YearOf(fFechaActual);
end;

procedure TfrmLibroAsociados.btnAExcelClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          if (SD1.Execute) then
          begin
           CDSdata.First;
           ExcelFile := TDataSetToExcel.Create(CDSdata,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

end.
