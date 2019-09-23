unit UnitSumatorias;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, IBCustomDataSet, IBQuery, ExtCtrls,
  Buttons, IBSQL, ComCtrls, XStringGrid, IBStoredProc, UnitDmGeneral;

type
  TfrmSumatorias = class(TForm)
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    DataSource2: TDataSource;
    IBQuery1: TIBQuery;
    Panel4: TPanel;
    Label3: TLabel;
    CmdActualizar: TBitBtn;
    EdFecha: TStaticText;
    DBGrid1: TDBGrid;
    IBQuery1TIPO_CAPTACION: TIBStringField;
    IBQuery1SALDO_ACTUAL: TIBBCDField;
    IBQuery1NUMERO: TIntegerField;
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
  dmGeneral:TdmGeneral;

implementation

{$R *.dfm}

uses unitGlobales;

procedure TfrmSumatorias.FormShow(Sender: TObject);
begin
        Application.ProcessMessages;
end;

procedure TfrmSumatorias.CmdActualizarClick(Sender: TObject);
var Saldo:Currency;
    I :Integer;
begin
        CmdActualizar.Enabled := False;
        Application.ProcessMessages;
        Screen.Cursor := crHourGlass;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from SUMATORIAS_DIARIA(:ANOP,:FECHA_INICIAL,:FECHADIA)');
          ParamByName('FECHADIA').AsDateTime := StrToDateTime(IntToStr(YearOf(fFechaActual)) + '/01/01 00:00:00');
          ParamByName('FECHA_INICIAL').AsDateTime := fFechaActual + Time;
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
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        
        EdFecha.Caption := DateTimeToStr(fFechaActual + Time);
end;

end.
