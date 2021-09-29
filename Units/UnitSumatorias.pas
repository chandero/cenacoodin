unit UnitSumatorias;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, IBCustomDataSet, IBQuery, ExtCtrls,
  Buttons, IBSQL, ComCtrls, XStringGrid, IBStoredProc, JvDateTimePicker;

type
  TfrmSumatorias = class(TForm)
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    DataSource2: TDataSource;
    IBQuery1: TIBQuery;
    Panel4: TPanel;
    Label3: TLabel;
    CmdActualizar: TBitBtn;
    DBGrid1: TDBGrid;
    IBQuery1TIPO_CAPTACION: TIBStringField;
    IBQuery1SALDO_ACTUAL: TIBBCDField;
    IBQuery1NUMERO: TIntegerField;
    edFecha: TJvDateTimePicker;
    edHora: TJvDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure CmdActualizarClick(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSumatorias: TfrmSumatorias;

implementation

{$R *.dfm}

uses unitdmGeneral,unitGlobales;

procedure TfrmSumatorias.FormShow(Sender: TObject);
begin
        Application.ProcessMessages;
end;

procedure TfrmSumatorias.CmdActualizarClick(Sender: TObject);
var Saldo:Currency;
    I :Integer;
    _fecha: TDateTime;
begin
        CmdActualizar.Enabled := False;
        Application.ProcessMessages;
        Screen.Cursor := crHourGlass;

        TryEncodeDateTime(YearOf(edFecha.Date), MonthOf(edFecha.Date), DayOfTheMonth(edFecha.Date), HourOf(edHora.Date), MinuteOf(edHora.Date), SecondOf(edHora.Date), 999, _fecha);

        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from SUMATORIAS_DIARIA(:ANOP,:FECHA_INICIAL,:FECHADIA)');
          ParamByName('FECHADIA').AsDateTime := StrToDateTime(IntToStr(YearOf(edFecha.Date)) + '/01/01 00:00:00');
          ParamByName('FECHA_INICIAL').AsDateTime := _fecha;
          ParamByName('ANOP').AsString := FloatToStr(YearOf(Date));
          try
            Open;
          except
            MessageDlg('Error Al Buscar Sumatoria de Saldo Inicial',mtError,[mbcancel],0);
            IBQuery1.Transaction.Rollback;
            Exit;
          end;
        end;
        Screen.Cursor := crDefault;


end;

procedure TfrmSumatorias.BtnAceptarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmSumatorias.FormCreate(Sender: TObject);
begin
        EdFecha.DateTime := fFechaHoraActual;
end;

end.
