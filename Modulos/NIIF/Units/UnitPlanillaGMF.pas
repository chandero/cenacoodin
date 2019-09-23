unit UnitPlanillaGMF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBClient, Provider,
  IBDatabase, DBLocal, DBLocalI, Grids, DBGrids, DateUtils, Math, StrUtils,
  Clipbrd, IBCustomDataSet, IBQuery, IB, ComObj;

type
  TfrmPlanillaGMF = class(TForm)
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    dtpFechaInicial: TDateTimePicker;
    Label2: TLabel;
    dtpFechaFinal: TDateTimePicker;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnInforme: TBitBtn;
    btnCerrar: TBitBtn;
    ProgressBar1: TProgressBar;
    IBTransaction1: TIBTransaction;
    Panel2: TPanel;
    chkDebitoContable: TCheckBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    IBQuery1ID_AGENCIA: TIntegerField;
    IBQuery1ID_TIPO_CAPTACION: TIntegerField;
    IBQuery1NUMERO_CUENTA: TIntegerField;
    IBQuery1DIGITO_CUENTA: TIntegerField;
    IBQuery1TIPO_MOVIMIENTO: TIntegerField;
    IBQuery1FECHA_MOVIMIENTO: TDateField;
    IBQuery1HORA_MOVIMIENTO: TTimeField;
    IBQuery1VALOR: TIBBCDField;
    IBQuery1GMF: TSmallintField;
    IBQuery1TOTAL: TSmallintField;
    btnExportar: TBitBtn;
    SaveDialog1: TSaveDialog;
    IBQuery1TOPE: TIBBCDField;
    IBQuery1VALOR_GMF: TIBBCDField;
    ClientDataSet1ID_AGENCIA: TIntegerField;
    ClientDataSet1ID_TIPO_CAPTACION: TIntegerField;
    ClientDataSet1NUMERO_CUENTA: TIntegerField;
    ClientDataSet1DIGITO_CUENTA: TIntegerField;
    ClientDataSet1TIPO_MOVIMIENTO: TIntegerField;
    ClientDataSet1FECHA_MOVIMIENTO: TDateField;
    ClientDataSet1HORA_MOVIMIENTO: TTimeField;
    ClientDataSet1VALOR: TBCDField;
    ClientDataSet1GMF: TSmallintField;
    ClientDataSet1TOTAL: TSmallintField;
    ClientDataSet1TOPE: TBCDField;
    ClientDataSet1VALOR_GMF: TBCDField;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnExportarClick(Sender: TObject);
    procedure dtpFechaInicialChange(Sender: TObject);
    procedure dtpFechaFinalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanillaGMF: TfrmPlanillaGMF;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, DataSetToExcel;

procedure TfrmPlanillaGMF.btnCerrarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPlanillaGMF.btnProcesarClick(Sender: TObject);
begin
        if MessageDlg('Continuar con el proceso?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
        begin
          Exit;
        end;
        grpPeriodo.Enabled := False;
        btnProcesar.Enabled := False;
        dtpFechaInicial.Time := StrToTime('00:00:00');
        dtpFechaFinal.Time := StrToTime('23:59:59');
        Application.ProcessMessages;
        if IBTransaction1.InTransaction then IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;

        IBQuery1.Close;
        IBQuery1.Params.ParamByName('FECHA_INICIAL').AsDate := dtpFechaInicial.Date;
        IBQuery1.Params.ParamByName('FECHA_FINAL').AsDate := dtpFechaFinal.Date;
        try
         IBQuery1.Open;
        except
         on x: EIBInterBaseError do
          ShowMessage(x.Message);
         on e: Exception do
          ShowMessage(e.Message);
        end;
        chkDebitoContable.Checked := True;
        ClientDataSet1.Open;
        ClientDataSet1.IndexName := 'Index1';
        ClientDataSet1.AggregatesActive := True;
        ClientDataSet1.Refresh;
        btnExportar.Enabled := True;
end;

procedure TfrmPlanillaGMF.FormCreate(Sender: TObject);
begin
   btnProcesar.Enabled := True;
   btnInforme.Enabled := False;
   btnExportar.Enabled := False;
   dtpFechaInicial.Date := fFechaActual - 6;
   dtpFechaFinal.Date := fFechaActual;
   
end;

procedure TfrmPlanillaGMF.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmPlanillaGMF.btnExportarClick(Sender: TObject);
const
  // SheetType
  xlChart = -4109;
  xlWorksheet = -4167;
  // WBATemplate
  xlWBATWorksheet = -4167;
  xlWBATChart = -4109;
  // Page Setup
  xlPortrait = 1;
  xlLandscape = 2;
  xlPaperA4 = 9;
  xlPaperLegal = 5;
  // Format Cells
  xlBottom = -4107;
  xlLeft = -4131;
  xlRight = -4152;
  xlTop = -4160;
  // Text Alignment
  xlHAlignCenter = -4108;
  xlVAlignCenter = -4108;
  // Cell Borders
  xlThick = 4;
  xlThin = 2;
type
  PMyList = ^AList;
  AList = record
    I: Integer;
  end;
var
  AR: PMyList;
  _fileName:string;
  Excel, WorkBook, WorkSheet: OleVariant;
  _totalxOperacion,_totalxExcentas:Currency;
  _totalExcentas:Currency;
  _totalGravadoE,_totalExentoE:Currency;
  _sCuentaAnt:String;
  _sCuentaAct:String;
  _iFilaInicio:Integer; //Controla la fila en la que inician los datos del grupo
  _iFila:Integer; // Controla la fila de la posición siguiente de datos
  _cRetiroCuenta:Currency;  // Total Retiros De La Cuenta
  _cAcumM1Cuenta:Currency; // Acumulado del Mes 1 de la Cuenta
  _cAcumM2Cuenta:Currency; // Acumulado del Mes 2 de la Cuenta
  _cSemM1Cuenta:Currency; // Semana Mes1 de la Cuenta
  _cSemM2Cuenta:Currency; // Semana Mes2 de la Cuenta
  _iPaso:Integer; // Controla la etapa del proceso para aplicación de filtros y titulos
  _iGmf : Integer; // Si la cuenta es excenta o no
  _bDosMeses:Boolean; //Controla si el proceso corresponde a la semana de dos meses.
  _sRange:OleVariant;
  _sFormula:OleVariant;
  _cTope:Currency;
  _cSaldo : Currency;
  _cConsumidoMes1:Currency;
  _cRemanenteMes1:Currency;
  _cConsumidoMes2:Currency;
  _cRemanenteMes2:Currency;
  _cGravado:Currency;
  _cGravadoE,
  _cGravadoC,
  _cGravadoT:Currency;
  _cExento,_cExento1,_cExento2:Currency;
  _cExentoE,
  _cExentoC,
  _cExentoT:Currency;
  _fntCalibriBold:TFont;
  _fntCalibri:TFont;
  _fBaseLiquidacion:Double;
  _lFilasDeTotales:TList;
  _iI:Integer;
  _sFormulaTexto:String;
// Variables de Control de Saldos
  _cAMes1, // Acumulado del Mes 1
  _cAMes2, // Acumulado del Mes 2
  _cESem1, // Efectivo Semana 1
  _cESem2, // Efectivo Semana 2
  _cCSem1, // Cheque Semana 1
  _cCSem2, // Cheque Semana 2
  _cTSem1, // Tarjeta Semana 1
  _cTSem2:Currency; // Tarjeta Semana 2

begin
  btnExportar.Enabled := False;

  if SaveDialog1.Execute then
  begin
     _fileName := SaveDialog1.FileName;
  end;

  _bDosMeses := False;

  _fntCalibri := TFont.Create;
  _fntCalibri.Name := 'Calibri';

  _fntCalibriBold := TFont.Create;
  _fntCalibriBold.Name := 'Calibri';
  _fntCalibriBold.Style := [fsBold];

  if MonthOf(dtpFechaInicial.Date) <> MonthOf(dtpFechaFinal.Date) then
    _bDosMeses := True;

  try
      // If no instance of Excel is running, try to Create a new Excel Object
    Excel := CreateOLEObject('Excel.Application');
  except
    ShowMessage('No pude iniciar Excel, no se encuentra instalado');
    Exit;
  end;

  _lFilasDeTotales := TList.Create;

  Excel.DisplayAlerts := false;
  Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
  WorkSheet := WorkBook.WorkSheets[1];
  WorkSheet.Name := 'Planilla_GMF';

  WorkSheet.PageSetup.Orientation := xlLandscape;
  WorkSheet.PageSetup.LeftMargin := 0.5;
  WorkSheet.PageSetup.RightMargin := 0.5;
  WorkSheet.PageSetup.TopMargin := 0.5;
  WorkSheet.PageSetup.BottomMargin := 0.5;
  WorkSheet.PageSetup.PaperSize := xlPaperLegal;

  WorkSheet.Cells[1,1] := 'AGENCIA ' + Ciudad + ' - PLANILLA RESUMEN GRAVAMEN A LOS MOVIMIENTOS FINANCIEROS - Generada el :'+ DateTimeToStr(fFechaHoraActual) ;
//  WorkSheet.Range['A1:H1'].MergeCells := True;
  WorkSheet.Cells[2,1] := 'SEMANA DEL:';
  WorkSheet.Cells[2,3] := DateToStr(dtpFechaInicial.Date);
  WorkSheet.Cells[2,4] := 'Hasta el';
  WorkSheet.Cells[2,5] := DateToStr(dtpFechaFinal.Date);

  WorkSheet.Cells[3,1] := 1;
  WorkSheet.Cells[3,2] := 2;
  WorkSheet.Cells[3,3] := 3;
  WorkSheet.Cells[3,4] := 4;
  WorkSheet.Cells[3,5] := 5;
  WorkSheet.Cells[3,6] := 6;
  WorkSheet.Cells[3,7] := 7;
  WorkSheet.Cells[3,8] := 8;
  WorkSheet.Cells[3,9] := 9;
  WorkSheet.Cells[3,10] := 10;
  WorkSheet.Cells[3,11] := 11;
  WorkSheet.Cells[3,12] := 12;
  WorkSheet.Cells[3,13] := 13;
  WorkSheet.Cells[3,14] := 14;
  WorkSheet.Cells[3,15] := 15;
  WorkSheet.Cells[3,16] := 16;
  WorkSheet.Cells[3,17] := 17;

  WorkSheet.Cells[4,1] := 'CUENTA';
  WorkSheet.Cells[4,1].ColumnWidth := 12;
  WorkSheet.Cells[4,2] := 'VR. RETIROS';
  WorkSheet.Cells[4,2].ColumnWidth := 12;
  WorkSheet.Cells[4,3] := 'ACUM. MES 1';
  WorkSheet.Cells[4,3].ColumnWidth := 12;
  WorkSheet.Cells[4,4] := 'SEM. MES 1';
  WorkSheet.Cells[4,4].ColumnWidth := 12;
  WorkSheet.Cells[4,5] := 'ACUM. MES 2';
  WorkSheet.Cells[4,5].ColumnWidth := 12;
  WorkSheet.Cells[4,6] := 'SEM. MES 2';
  WorkSheet.Cells[4,6].ColumnWidth := 12;
  WorkSheet.Cells[4,7] := 'TOPE EXC.';
  WorkSheet.Cells[4,7].ColumnWidth := 12;
  WorkSheet.Cells[4,8] := 'CHEQUE';
  WorkSheet.Cells[4,8].ColumnWidth := 12;
  WorkSheet.Cells[4,9] := 'EFECTIVO O DB';
  WorkSheet.Cells[4,9].ColumnWidth := 12;
  WorkSheet.Cells[4,10] := 'TARJETA DB';
  WorkSheet.Cells[4,10].ColumnWidth := 12;
  WorkSheet.Cells[4,11] := 'EXENTO';
  WorkSheet.Cells[4,11].ColumnWidth := 12;
  WorkSheet.Cells[4,12] := 'GRAVADO';
  WorkSheet.Cells[4,12].ColumnWidth := 12;
  WorkSheet.Cells[4,13] := 'BASE DEL BANCO';
  WorkSheet.Cells[4,13].ColumnWidth := 12;
  WorkSheet.Cells[4,14] := 'VALOR COBRADO POR EL BANCO';
  WorkSheet.Cells[4,14].ColumnWidth := 12;
  WorkSheet.Cells[4,15] := 'VALOR A PAGAR';
  WorkSheet.Cells[4,15].ColumnWidth := 12;
  WorkSheet.Cells[4,16] := 'VALOR A DESCONTAR';
  WorkSheet.Cells[4,16].ColumnWidth := 12;
  WorkSheet.Cells[4,17] := 'VALOR CARGADO AL COSTO O GASTO';
  WorkSheet.Cells[4,17].ColumnWidth := 12;

  _sRange := WorkSheet.Range['A4:Q4'];

  _sRange.HorizontalAlignment := xlHAlignCenter;
  _sRange.VerticalAlignment := xlVAlignCenter;
  _sRange.RowHeight := 41.25;
  _sRange.Font.Bold := True;
  _sRange.Font.Size := 6;
  _sRange.Borders.Weight := xlThick;
  _sRange.WrapText := True;

  WorkSheet.Cells[6,1] := 'CUENTAS NO MARCADAS';

  ClientDataSet1.Filtered := False;
  ClientDataSet1.Filter := 'GMF = 0';
  ClientDataSet1.Filtered := True;

  _iFilaInicio := 7;
  _iFila := 7;

  _iPaso := 1;


  _cAMes1 := 0;
  _cAMes2 := 0;
  _cESem1 := 0;
  _cESem2 := 0;
  _cCSem1 := 0;
  _cCSem2 := 0;
  _cTSem1 := 0;
  _cTSem2 := 0;
  _totalExentoE := 0;
  _totalGravadoE := 0;

  while True do
  begin
    _sCuentaAnt := Format('%d%.2d-%.7d-%d',[ClientDataSet1.FieldByName('ID_TIPO_CAPTACION').AsInteger,
                                             ClientDataSet1.FieldByName('ID_AGENCIA').AsInteger,
                                             ClientDataSet1.FieldByName('NUMERO_CUENTA').AsInteger,
                                             ClientDataSet1.FieldByName('DIGITO_CUENTA').AsInteger]);
    _cRetiroCuenta := 0;
    _cAcumM1Cuenta := 0;
    _cAcumM2Cuenta := 0;
    _cSemM1Cuenta := 0;
    _cSemM2Cuenta := 0;
    _cGravado := 0;
    _cExento := 0;
    _fBaseLiquidacion := 0;
    _iGmf := 0;
    while not ClientDataSet1.Eof do
    begin
        Application.ProcessMessages;
        _sCuentaAct := Format('%d%.2d-%.7d-%d',[ClientDataSet1.FieldByName('ID_TIPO_CAPTACION').AsInteger,
                                             ClientDataSet1.FieldByName('ID_AGENCIA').AsInteger,
                                             ClientDataSet1.FieldByName('NUMERO_CUENTA').AsInteger,
                                             ClientDataSet1.FieldByName('DIGITO_CUENTA').AsInteger]);
        if _sCuentaAct <> _sCuentaAnt then
        begin
            _cAcumM1Cuenta := _cAMes1;
            _cAcumM2Cuenta := _cAMes2;
            _cSemM1Cuenta  := _cESem1 + _cCSem1 + _cTSem1;
            _cSemM2Cuenta  := _cESem2 + _cCSem2 + _cTSem2;

            WorkSheet.Cells[_iFila,1] := _sCuentaAnt;
            WorkSheet.Cells[_iFila,2] := _cAcumM1Cuenta + _cAcumM2Cuenta + _cSemM1Cuenta + _cSemM2Cuenta;
            WorkSheet.Cells[_iFila,3] := _cAcumM1Cuenta ;
            WorkSheet.Cells[_iFila,4] := _cSemM1Cuenta;
            WorkSheet.Cells[_iFila,5] := _cAcumM2Cuenta;
            WorkSheet.Cells[_iFila,6] := _cSemM2Cuenta;
            WorkSheet.Cells[_iFila,7] := _cTope;
            // Evaluar Exento y Gravado
            if (_iGmf = 1) then
            begin
              if (_cAcumM1Cuenta - _cTope) < 0 then
                 _cConsumidoMes1 := _cAcumM1Cuenta
              else
                 _cConsumidoMes1 := _cTope;
              if (_cAcumM2Cuenta - _cTope) < 0 then
                 _cConsumidoMes2 := _cAcumM2Cuenta
              else
                 _cConsumidoMes2 := _cTope;

              _cRemanenteMes1 := _cTope - _cConsumidoMes1;
              _cRemanenteMes2 := _cTope - _cConsumidoMes2;


              if (_cSemM1Cuenta < _cRemanenteMes1) then
                _cExento1 := _cSemM1Cuenta
              else
                _cExento1 := _cRemanenteMes1;

              if (_cSemM2Cuenta < _cRemanenteMes2) then
                _cExento2 := _cSemM2Cuenta
              else
                _cExento2 := _cRemanenteMes2;

              // Evaluar Excento Semana 1
              // Descontar Retiro en Efectivo Semana 1 del RemanenteMes1
              _cSaldo := _cESem1;
              if (_cSaldo < _cRemanenteMes1) then
              begin
                _cExentoE := _cSaldo;
                _cRemanenteMes1 := _cRemanenteMes1 - _cSaldo;
              end
              else
              begin
                _cExentoE := _cRemanenteMes1;
                _cRemanenteMes1 := 0;
              end;
              // Descontar Retiro en Cheque Semana 1 del RemanenteMes1
              _cSaldo := _cCSem1;
              if (_cSaldo < _cRemanenteMes1) then
              begin
                _cExentoC := _cSaldo;
                _cRemanenteMes1 := _cRemanenteMes1 - _cSaldo;
              end
              else
              begin
                _cExentoC := _cRemanenteMes1;
                _cRemanenteMes1 := 0;
              end;

              // Descontar Retiro en Tarjeta Semana 1 del RemanenteMes1
              _cSaldo := _cTSem1;
              if (_cSaldo < _cRemanenteMes1) then
              begin
                _cExentoT := _cSaldo;
                _cRemanenteMes1 := _cRemanenteMes1 - _cSaldo;
              end
              else
              begin
                _cExentoT := _cRemanenteMes1;
                _cRemanenteMes1 := 0;
              end;
              // Fin Evaluación Exento Sem 1
              // Evaluar Excento Sem 2
              // Descontar Retiro en Efectivo Semana 2 del RemanenteMes1
              _cSaldo := _cESem2;
              if (_cSaldo < _cRemanenteMes2) then
              begin
                _cExentoE := _cExentoE + _cSaldo;
                _cRemanenteMes2 := _cRemanenteMes2 - _cSaldo;
              end
              else
              begin
                _cExentoE := _cExentoE + _cRemanenteMes2;
                _cRemanenteMes2 := 0;
              end;
              // Descontar Retiro en Cheque Semana 2 del RemanenteMes1
              _cSaldo := _cCSem2;
              if (_cSaldo < _cRemanenteMes2) then
              begin
                _cExentoC := _cExentoC + _cSaldo;
                _cRemanenteMes2 := _cRemanenteMes2 - _cSaldo;
              end
              else
              begin
                _cExentoC := _cRemanenteMes2;
                _cRemanenteMes2 := 0;
              end;

              // Descontar Retiro en Tarjeta Semana 2 del RemanenteMes1
              _cSaldo := _cTSem2;
              if (_cSaldo < _cRemanenteMes2) then
              begin
                _cExentoT := _cExentoT + _cSaldo;
                _cRemanenteMes2 := _cRemanenteMes2 - _cSaldo;
              end
              else
               begin
                 _cExentoT := _cExentoT + _cRemanenteMes2;
                 _cRemanenteMes2 := 0;
               end;
               // Fin Evaluacion Excento Sem 2
              _cExento := _cExento1 + _cExento2;
              _cGravado := (_cSemM1Cuenta + _cSemM2Cuenta) - _cExento;

              _cSaldo := _cESem1 + _cESem2;
              _cGravadoE := _cSaldo - _cExentoE;

              _cSaldo := _cCSem1 + _cCSem2;
              _cGravadoC := _cSaldo - _cExentoC;

              _cSaldo := _cTSem1 + _cTSem2;
              _cGravadoT := _cSaldo - _cExentoT;
            end
            else
            begin
              _cGravado := _cSemM1Cuenta + _cSemM2Cuenta;
              _cExento := 0;
              _cExentoE := 0;
              _cExentoC := 0;
              _cExentoT := 0;
              _cGravadoE := _cESem1 + _cESem2;
              _cGravadoC := _cCSem1 + _cCSem2;
              _cGravadoT := _cTSem1 + _cTSem2;
            end; // if (_iGmf = 1)

            _totalExentoE := _totalExentoE + _cExentoE;
            _totalGravadoE := _totalGravadoE + _cGravadoE;

            WorkSheet.Cells[_iFila,8] := _cCSem1 + _cCSem2;
            WorkSheet.Cells[_iFila,9] := _cESem1 + _cESem2;
            WorkSheet.Cells[_iFila,10] := _cTSem1 + _cTSem2;
            WorkSheet.Cells[_iFila,11] := _cExento;
            WorkSheet.Cells[_iFila,12] := _cGravado;
            WorkSheet.Cells[_iFila,13] := _cGravadoC + _cGravadoT;
            _cSaldo :=  _cCSem1 + _cCSem2 + _cTSem1 + _cTSem2;
{            WorkSheet.Cells[_iFila,14] := RoundTo((_cSaldo * _fBaseLiquidacion),0);
            WorkSheet.Cells[_iFila,15] := RoundTo((_cGravadoE * _fBaseLiquidacion),0);
            WorkSheet.Cells[_iFila,16] := RoundTo((_cSaldo * _fBaseLiquidacion),0)- RoundTo(((_cGravadoC + _cGravadoT) * _fBaseLiquidacion),0);
            WorkSheet.Cells[_iFila,17] := RoundTo((_cGravado * _fBaseLiquidacion),0);
}
            WorkSheet.Cells[_iFila,14] := (_cSaldo * _fBaseLiquidacion);
            WorkSheet.Cells[_iFila,15] := (_cGravadoE * _fBaseLiquidacion);
            WorkSheet.Cells[_iFila,16] := (_cSaldo * _fBaseLiquidacion)- ((_cGravadoC + _cGravadoT) * _fBaseLiquidacion);
            WorkSheet.Cells[_iFila,17] := (_cGravado * _fBaseLiquidacion);

            // Fin Evaluación

{            case (_iPaso) of
            1,4: begin
                   WorkSheet.Cells[_iFila,9] := _cSemM1Cuenta + _cSemM2Cuenta;
                   WorkSheet.Cells[_iFila,15] := RoundTo((_cGravado * _fBaseLiquidacion),0);
                   WorkSheet.Cells[_iFila,17] := RoundTo((_cGravado * _fBaseLiquidacion),0);
                 end;
            2,5: begin
                   WorkSheet.Cells[_iFila,8] := _cSemM1Cuenta + _cSemM2Cuenta;
                   WorkSheet.Cells[_iFila,14] := RoundTo((_cSemM1Cuenta + _cSemM2Cuenta) * _fBaseLiquidacion,0);
                   WorkSheet.Cells[_iFila,16] := RoundTo((_cSemM1Cuenta + _cSemM2Cuenta) * _fBaseLiquidacion,0)-RoundTo((_cGravado * _fBaseLiquidacion),0);
                   WorkSheet.Cells[_iFila,17] := RoundTo((_cGravado * _fBaseLiquidacion),0)
                 end;
            3,6: begin
                   WorkSheet.Cells[_iFila,10] := _cSemM1Cuenta + _cSemM2Cuenta;
                   WorkSheet.Cells[_iFila,14] := RoundTo((_cSemM1Cuenta + _cSemM2Cuenta) * _fBaseLiquidacion,0);
                   WorkSheet.Cells[_iFila,16] := RoundTo((_cSemM1Cuenta + _cSemM2Cuenta) * _fBaseLiquidacion,0)-RoundTo((_cGravado * _fBaseLiquidacion),0);
                   WorkSheet.Cells[_iFila,17] := RoundTo((_cGravado * _fBaseLiquidacion),0)
                 end;
            end; // case (_iPaso)
}
            // ZEROS
            _cRetiroCuenta := 0;

            _cAcumM1Cuenta := 0;
            _cAcumM2Cuenta := 0;
            _cSemM1Cuenta := 0;
            _cSemM2Cuenta := 0;


            _cAMes1 := 0;
            _cAMes2 := 0;
            _cESem1 := 0;
            _cESem2 := 0;
            _cCSem1 := 0;
            _cCSem2 := 0;
            _cTSem1 := 0;
            _cTSem2 := 0;

            _sCuentaAnt := _sCuentaAct;
            Inc(_iFila);
        end; // if _sCuentaAct <> _sCuentaAnt

        if ( _bDosMeses ) then
         begin
           // Valido y Separo Acumulado Semana y Acumulado Mes
           if (ClientDataSet1.FieldByName('FECHA_MOVIMIENTO').AsDateTime >= dtpFechaInicial.Date) and
              (ClientDataSet1.FieldByName('FECHA_MOVIMIENTO').AsDateTime <= dtpFechaFinal.Date) then
           begin
             if (MonthOf(ClientDataSet1.FieldByName('FECHA_MOVIMIENTO').AsDateTime) = MonthOf(dtpFechaInicial.Date)) then
               _cSemM1Cuenta := ClientDataSet1.FieldByName('VALOR').AsCurrency
             else
               _cSemM2Cuenta := ClientDataSet1.FieldByName('VALOR').AsCurrency;
           end
           else
           begin
           // Valido Acumulado Mes
           if ( MonthOf(ClientDataSet1.FieldByName('FECHA_MOVIMIENTO').AsDateTime) = MonthOf(dtpFechaInicial.Date) ) then
             _cAcumM1Cuenta := ClientDataSet1.FieldByName('VALOR').AsCurrency
           else
             _cAcumM2Cuenta := ClientDataSet1.FieldByName('VALOR').AsCurrency;
           end;
         end
        else
         begin
           if (ClientDataSet1.FieldByName('FECHA_MOVIMIENTO').AsDateTime >= dtpFechaInicial.Date) and
              (ClientDataSet1.FieldByName('FECHA_MOVIMIENTO').AsDateTime <= dtpFechaFinal.Date) then
           begin
               _cSemM1Cuenta := ClientDataSet1.FieldByName('VALOR').AsCurrency;
           end
           else
           begin
               _cAcumM1Cuenta := ClientDataSet1.FieldByName('VALOR').AsCurrency;
           end;
         end; //  if ( _bDosMeses )

         _cAMes1 := _cAMes1 + _cAcumM1Cuenta;
         _cAMes2 := _cAMes2 + _cAcumM2Cuenta;
         case ClientDataSet1.FieldByName('TIPO_MOVIMIENTO').AsInteger of
          2: begin
                _cESem1 := _cESem1 + _cSemM1Cuenta;
                _cESem2 := _cESem2 + _cSemM2Cuenta;
             end;
         13: begin
                _cCSem1 := _cCSem1 + _cSemM1Cuenta;
                _cCSem1 := _cCSem1 + _cSemM2Cuenta;
             end;
         20: begin
                _cTSem1 := _cTSem1 + _cSemM1Cuenta;
                _cTSem2 := _cTSem2 + _cSemM2Cuenta;
             end;
         end;

         _cAcumM1Cuenta := 0;
         _cAcumM2Cuenta := 0;
         _cSemM1Cuenta := 0;
         _cSemM2Cuenta := 0;

        _cRetiroCuenta := _cRetiroCuenta + ClientDataSet1.FieldByName('VALOR').AsCurrency;
        _cTope := ClientDataSet1.FieldByName('TOPE').AsCurrency;
        _fBaseLiquidacion := ClientDataSet1.FieldByName('VALOR_GMF').AsFloat;
        _iGmf := ClientDataSet1.FieldByName('GMF').AsInteger;
        ClientDataSet1.Next;
        
    end;
    Inc(_iFila);
    New(AR);
    AR^.I := _iFila;
    _lFilasDeTotales.Add(AR);
//
    _sFormulaTexto := '=SUMA(B'+IntToStr(_iFilaInicio)+':B'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,2], False);
//
    _sFormulaTexto := '=SUMA(C'+IntToStr(_iFilaInicio)+':C'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,3], False);
//
    _sFormulaTexto := '=SUMA(D'+IntToStr(_iFilaInicio)+':D'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,4], False);
//
    _sFormulaTexto := '=SUMA(E'+IntToStr(_iFilaInicio)+':E'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,5], False);
//
    _sFormulaTexto := '=SUMA(F'+IntToStr(_iFilaInicio)+':F'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,6], False);
//
    _sFormulaTexto := '=SUMA(H'+IntToStr(_iFilaInicio)+':H'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,8], False);
//
    _sFormulaTexto := '=SUMA(I'+IntToStr(_iFilaInicio)+':I'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,9], False);
//
    _sFormulaTexto := '=SUMA(J'+IntToStr(_iFilaInicio)+':J'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,10], False);
//
    _sFormulaTexto := '=SUMA(K'+IntToStr(_iFilaInicio)+':K'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,11], False);
//
    _sFormulaTexto := '=SUMA(L'+IntToStr(_iFilaInicio)+':L'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,12], False);
//
    _sFormulaTexto := '=SUMA(M'+IntToStr(_iFilaInicio)+':M'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,13], False);
//
    _sFormulaTexto := '=SUMA(N'+IntToStr(_iFilaInicio)+':N'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,14], False);
//
    _sFormulaTexto := '=SUMA(O'+IntToStr(_iFilaInicio)+':O'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,15], False);
//
    _sFormulaTexto := '=SUMA(P'+IntToStr(_iFilaInicio)+':P'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,16], False);
//
    _sFormulaTexto := '=SUMA(Q'+IntToStr(_iFilaInicio)+':Q'+IntToStr(_iFila-1)+')';
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(_sFormulaTexto));
    WorkSheet.Paste(WorkSheet.Cells[_iFila,17], False);
//
    Inc(_iPaso);
    case _iPaso of
{    2: begin
        Inc(_iFila,1);
        WorkSheet.Cells[_iFila,1] := 'RETIROS EN CHEQUE';
        _sRange := QuotedStr('A'+IntToStr(_iFila)+':E'+IntToStr(_iFila));
        ClientDataSet1.Filtered := False;
        ClientDataSet1.Filter := 'GMF = 0 AND TIPO_MOVIMIENTO = 13';
        ClientDataSet1.Filtered := True;
        Inc(_iFila,1);
        _iFilaInicio := _iFila;
       end;
    3: begin
        Inc(_iFila,1);
        WorkSheet.Cells[_iFila,1] := 'RETIROS EN TARJETA DEBITO';
        _sRange := QuotedStr('A'+IntToStr(_iFila)+':E'+IntToStr(_iFila));
        ClientDataSet1.Filtered := False;
        ClientDataSet1.Filter := 'GMF = 0 AND TIPO_MOVIMIENTO = 20';
        ClientDataSet1.Filtered := True;
        Inc(_iFila,1);
        _iFilaInicio := _iFila;
       end;
}
    2: begin
        Inc(_iFila,1);
        WorkSheet.Cells[_iFila,1] := 'CUENTAS MARCADAS';
        _sRange := QuotedStr('A'+IntToStr(_iFila)+':E'+IntToStr(_iFila));
        ClientDataSet1.Filtered := False;
        ClientDataSet1.Filter := 'GMF = 1';
        ClientDataSet1.Filtered := True;
        Inc(_iFila,1);
        _iFilaInicio := _iFila;
       end;
{
    5: begin
        Inc(_iFila,1);
        WorkSheet.Cells[_iFila,1] := 'RETIROS EN CHEQUE';
        _sRange := QuotedStr('A'+IntToStr(_iFila)+':E'+IntToStr(_iFila));
        ClientDataSet1.Filtered := False;
        ClientDataSet1.Filter := 'GMF = 1 AND TIPO_MOVIMIENTO = 13';
        ClientDataSet1.Filtered := True;
        Inc(_iFila,1);
        _iFilaInicio := _iFila;
       end;
    6: begin
        Inc(_iFila,1);
        WorkSheet.Cells[_iFila,1] := 'RETIROS EN TARJETA DEBITO';
        _sRange := QuotedStr('A'+IntToStr(_iFila)+':E'+IntToStr(_iFila));
        ClientDataSet1.Filtered := False;
        ClientDataSet1.Filter := 'GMF = 1 AND TIPO_MOVIMIENTO = 20';
        ClientDataSet1.Filtered := True;
        Inc(_iFila,1);
        _iFilaInicio := _iFila;
       end;
}
    3: begin
        break;
       end;
    end;
    // ZEROS
    _sCuentaAnt := Format('%d%.2d-%.7d-%d',[ClientDataSet1.FieldByName('ID_TIPO_CAPTACION').AsInteger,
                                             ClientDataSet1.FieldByName('ID_AGENCIA').AsInteger,
                                             ClientDataSet1.FieldByName('NUMERO_CUENTA').AsInteger,
                                             ClientDataSet1.FieldByName('DIGITO_CUENTA').AsInteger]);
    _cRetiroCuenta := 0;
 end;


  Inc(_iFila,1);

  _sRange := '';

  for _iI := 0 to _lFilasDeTotales.Count - 1 do
  begin
       AR := _lFilasDeTotales.Items[_iI];
       _sRange := _sRange + 'B' + IntToStr(AR^.I);
       if _iI < (_lFilasDeTotales.Count - 1) then
         _sRange := _sRange + '+';
       Dispose(AR);
  end;
  _lFilasDeTotales.Free;

//
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,2], False);
//
  _sRange := StringReplace(_sRange,'B','C', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,3], False);
//
  _sRange := StringReplace(_sRange,'C','D', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,4], False);
//
  _sRange := StringReplace(_sRange,'D','E', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,5], False);
//
  _sRange := StringReplace(_sRange,'E','F', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,6], False);
//
  _sRange := StringReplace(_sRange,'F','H', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,8], False);
//
  _sRange := StringReplace(_sRange,'H','I', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,9], False);
//
  _sRange := StringReplace(_sRange,'I','J', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,10], False);
//
  _sRange := StringReplace(_sRange,'J','K', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,11], False);
//
  _sRange := StringReplace(_sRange,'K','L', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,12], False);
//
  _sRange := StringReplace(_sRange,'L','M', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,13], False);
//
  _sRange := StringReplace(_sRange,'M','N', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,14], False);
//
  _sRange := StringReplace(_sRange,'N','O', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,15], False);
//
  _sRange := StringReplace(_sRange,'O','P', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,16], False);
//
  _sRange := StringReplace(_sRange,'P','Q', [rfReplaceAll, rfIgnoreCase]);
  _sFormulaTexto := '=REDONDEAR(SUMA('+_sRange+');0)';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(WorkSheet.Cells[_iFila,17], False);
//

  _iFilaInicio := _iFila;
  Inc(_iFila,2);

  _sRange := WorkSheet.Range['A1','Q'+IntToStr(_iFila)];
  _sRange.Font.Size := 6;

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'AGENCIA ' + Ciudad + ' - PLANILLA RESUMEN GRAVAMEN A LOS MOVIMIENTOS FINANCIEROS';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  Inc(_iFila,1);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'Generada el :'+ DateTimeToStr(fFechaHoraActual);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  Inc(_iFila,1);

  _sRange := WorkSheet.Cells[_iFila,1];
  Empleado;
  _sRange.Value := 'Generada por :'+ Nombres + ' ' + Apellidos;
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  Inc(_iFila,1);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'SEMANA DEL:'+ DateToStr(dtpFechaInicial.Date) + ' HASTA EL: ' + DateToStr(dtpFechaFinal.Date);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  Inc(_iFila,1);

  _sRange := WorkSheet.Cells[_iFila,4];
  _sRange.Value := 'TOTAL';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  _sRange.HorizontalAlignment := xlHAlignCenter;
  _sRange.VerticalAlignment := xlVAlignCenter;

  _sRange := WorkSheet.Cells[_iFila,5];
  _sRange.Value := 'EFECTIVO O DB';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  _sRange.HorizontalAlignment := xlHAlignCenter;
  _sRange.VerticalAlignment := xlVAlignCenter;

  Inc(_iFila,1);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'TOTAL RETIROS DE LA SEMANA';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;


  _sRange := WorkSheet.Cells[_iFila,4];
  _sFormulaTexto := '=SUMA(D'+IntToStr(_iFilaInicio)+'+F'+IntToStr(_iFilaInicio)+')';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;

  _sRange := WorkSheet.Cells[_iFila,5];
  _sFormulaTexto := '=E'+IntToStr(_iFila+1)+'+E'+IntToStr(_iFila+2);
//  _sFormulaTexto := '=I'+IntToStr(_iFilaInicio);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  Inc(_iFila);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'GRAVADOS';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  _sRange := WorkSheet.Cells[_iFila,4];
  _sFormulaTexto := '=L'+IntToStr(_iFilaInicio);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  _sRange := WorkSheet.Cells[_iFila,5];
  _sFormulaTexto := CurrToStr(RoundTo(_totalGravadoE,0));
//  _sFormulaTexto := '=L'+IntToStr(_iFilaInicio)+'-N'+IntToStr(_iFilaInicio);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  Inc(_iFila);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'NO GRAVADOS';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  _sRange := WorkSheet.Cells[_iFila,4];
  _sFormulaTexto := '=K'+IntToStr(_iFilaInicio);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  _sRange := WorkSheet.Cells[_iFila,5];
  _sFormulaTexto := CurrToStr(RoundTo(_totalExentoE,0));
//  _sFormulaTexto := '=E'+IntToStr(_iFila-2)+'-E'+IntToStr(_iFila-1);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;


  Inc(_iFila);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'YA COBRADOS POR EL BANCO';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  _sRange := WorkSheet.Cells[_iFila,4];
  _sFormulaTexto := '=M'+IntToStr(_iFilaInicio);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;
  Inc(_iFila);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'VALOR GRAVAMEN DE LA SEMANA';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  Inc(_iFila);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'PAGADO A LOS BANCOS';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;

  _sRange := WorkSheet.Cells[_iFila,4];
  _sFormulaTexto := '=N'+IntToStr(_iFilaInicio);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  Inc(_iFila,2);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'GRAVAMEN SEMANAL A PAGAR';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  _sRange := WorkSheet.Cells[_iFila,4];
  _sFormulaTexto := '=O'+IntToStr(_iFilaInicio);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  _sRange := WorkSheet.Cells[_iFila,5];
  _sFormulaTexto := 'Contabilizar Diferencia al Código 531520';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  Inc(_iFila);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'VALOR SEMANAL A DESCONTAR';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  _sRange := WorkSheet.Cells[_iFila,4];
  _sFormulaTexto := '=P'+IntToStr(_iFilaInicio);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  _sRange := WorkSheet.Cells[_iFila,5];
  _sFormulaTexto := 'Contabiliza Valor a Descontar al Código 6150';
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := False;

  Inc(_iFila);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'NETO GRAVAMEN A PAGAR';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;

  _sRange := WorkSheet.Cells[_iFila,4];
  _sFormulaTexto := '=D'+IntToStr(_iFila-2)+'-D'+IntToStr(_iFila-1);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;
  Inc(_iFila,2);

  _sRange := WorkSheet.Cells[_iFila,1];
  _sRange.Value := 'VALOR CONTABILIZADO EN EL GASTO';
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;

  _sRange := WorkSheet.Cells[_iFila,4];
  _sFormulaTexto := '=Q'+IntToStr(_iFilaInicio);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(_sFormulaTexto));
  WorkSheet.Paste(_sRange, False);
  _sRange.Font.Size := 8;
  _sRange.Font.Bold := True;

  _sRange := WorkSheet.Range['B5','Q'+IntToStr(_iFila)];
  _sRange.NumberFormat := '#,0.00';
  _sRange.EntireColumn.AutoFit;
  WorkSheet.Cells[1,1].EntireColumn.ColumnWidth := 11.11;

  Excel.ActiveWindow.DisplayZeros := False;
{  _sFormula := '$A$1:$Q$'+IntToStr(_iFila);
  Excel.ActiveSheet.PageSetup.PrintArea := _sFormula;
  _sFormula := '$1:$4';
  WorkSheet.PageSetup.PrintTitleRows := _sFormula;
  WorkSheet.PageSetup.PrintTitleColumns := '';
}
  WorkSheet.PageSetup.FitToPagesWide := 1;
//  WorkSheet.PageSetup.FitToPagesTall := 3; // Y

  WorkSheet.Protect('gmfcreo06',True,True,True,True,False,False,False,False,False,False,False,False,False,False,False);

  WorkBook.SaveAs(_filename);
  Excel.WorkBooks.Open(_filename);
  Excel.Visible := True;

  WorkSheet := Unassigned;
  WorkBook := Unassigned;
  Excel := Unassigned;

  ClientDataSet1.Filtered := False;

  IBQuery1.Transaction.Commit;
  IBQuery1.Close;


{  if not _toExcel.WriteFile then
    MessageDlg('Error al Exportar Datos',mtError,[mbCancel],0)
  else
    MessageDlg('Datos Exportados con Exito!',mtInformation,[mbOk],0);
}
end;

procedure TfrmPlanillaGMF.dtpFechaInicialChange(Sender: TObject);
begin
        dtpFechaFinal.Date := dtpFechaInicial.Date + 6;
end;

procedure TfrmPlanillaGMF.dtpFechaFinalChange(Sender: TObject);
begin
        dtpFechaInicial.Date := dtpFechaFinal.Date - 6;
end;

end.
