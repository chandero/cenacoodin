unit UnitSumatorias;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, IBCustomDataSet, IBQuery, ExtCtrls,
  Buttons, IBSQL, ComCtrls, XStringGrid;

type
  TfrmSumatorias = class(TForm)
    GBSumCap: TGroupBox;
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Label1: TLabel;
    EdSumaCaptacion: TStaticText;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    IBQuery2: TIBQuery;
    IBQuery2ID_ESTADO_COLOCACION: TSmallintField;
    IBQuery2DESCRIPCION: TIBStringField;
    IBQuery2SALDO: TIBBCDField;
    Panel3: TPanel;
    Label2: TLabel;
    EdSumaColocacion: TStaticText;
    IBQuery2TOTAL: TIntegerField;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    Panel4: TPanel;
    Label3: TLabel;
    EdFecha: TDateTimePicker;
    GridCaptaciones: TXStringGrid;
    CmdActualizar: TBitBtn;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    procedure FormShow(Sender: TObject);
    procedure CmdActualizarClick(Sender: TObject);
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
           EdFecha.DateTime := Date;
end;

procedure TfrmSumatorias.CmdActualizarClick(Sender: TObject);
var Saldo,SaldoFinal:Currency;
    I :Integer;
    Inicial,Movimiento:Currency;
    Conteo:Integer;
begin
        for I := 1 to 6 do begin
          GridCaptaciones.Cells[0,I] := '';
          GridCaptaciones.Cells[1,I] := '';
          GridCaptaciones.Cells[2,I] := '';
        end;

        Application.ProcessMessages;
        Screen.Cursor := crHourGlass;
        for I := 1 to 5 do begin
         SaldoFinal := 0;
         Conteo := 0;
         with IBSQL1 do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select * from P_CAP_0002 (:ID)');
           ParamByName('ID').AsInteger := I;
           ExecQuery;
           while not Eof do begin
                 Application.ProcessMessages;

                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select * from P_CAP_0012 (:AG,:ID,:CTA,:DG,:ANO)');
                 IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                 IBSQL2.ParamByName('ID').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL2.ParamByName('CTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                 IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                 IBSQL2.ParamByName('ANO').AsString := IntToStr(yearof(Date));
                 IBSQL2.ExecQuery;
                 if IBSQL2.RecordCount > 0 then
                    Inicial := IBSQL2.FieldByName('SALDOAHORROS').AsCurrency
                 else
                    Inicial := 0;

                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select * from P_CAP_0010 (:AG,:ID,:CTA,:DG,:FECHA1,:FECHA2)');
                 IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                 IBSQL2.ParamByName('ID').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL2.ParamByName('CTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                 IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').asInteger;
                 IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
                 IBSQL2.ParamByName('FECHA2').AsDate:= EdFecha.Date;
                 IBSQL2.ExecQuery;
                 if IBSQL2.RecordCount > 0 then
                    Movimiento := IBSQL2.FieldByName('MOVIMIENTO').AsCurrency
                 else
                    Movimiento := 0;

                 Saldo := Inicial + Movimiento;
                 if Saldo > 0 then
                   Conteo := Conteo + 1;
                 SaldoFinal := SaldoFinal  + Saldo ;
                 GridCaptaciones.Cells[0,I] := IntToStr(I);
                 GridCaptaciones.Cells[1,I] := Format('%.5d',[Conteo]);
                 GridCaptaciones.Cells[2,I] := FormatCurr('$#,#0.00',Saldofinal);
                 Application.ProcessMessages;
                 Next;
              end;
           end;
         end;

        Screen.Cursor := crDefault;

end;

end.
