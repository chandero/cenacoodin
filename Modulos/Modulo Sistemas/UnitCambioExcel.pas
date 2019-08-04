unit UnitCambioExcel;

interface

uses
  Windows, Messages, Math, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Mask, JvToolEdit, xmldom,
  DBClient, Provider, Xmlxform, ExtCtrls, ComCtrls, IBDatabase,
  IBCustomDataSet, IBQuery;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    EdColocacion: TStaticText;
    IBDataSet1: TIBDataSet;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
    function TasaNominalVencida(TasaE:Single;Amortiza:Integer): Single;
    function TasaNominalAnticipada(TasaE:Single;Amortiza:Integer): Single;
    function TasaEfectivaVencida(Tasa: Double;Amortiza:Integer): Double;
    function TasaEfectivaAnticipada(Tasa: Double;Amortiza:Integer): Double;
    function BuscoTasaEfectivaMaxima(Fecha:TDate):Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.TasaNominalVencida(TasaE:Single;Amortiza:Integer): Single;
var Potencia:Single;
    Factor:Double;
begin
        if Amortiza < 30 then Amortiza := 30;
        Factor := Amortiza / 30;
        Factor := 12 / Factor;
        Potencia := power(1+(TasaE/100),(1/Factor));
        Potencia := ((Potencia-1)*Factor*100);
        Result := SimpleRoundTo(Potencia,-2);
end;

function TForm1.TasaNominalAnticipada(TasaE:Single;Amortiza:Integer): Single;
var Potencia:Single;
    Factor:Double;
begin
        if Amortiza < 30 then Amortiza := 30;
        Factor := Amortiza / 30;
        Factor := 12 / Factor;
        Potencia := power(1+(TasaE/100),-(1/Factor));
        Potencia := Abs(((Potencia-1)* Factor*100));
        Result := RoundTo(Potencia,-2);
end;

function TForm1.TasaEfectivaVencida(Tasa: Double;Amortiza:Integer): Double;
 var n:single;
     potencia: Single;
     Factor:Double;
begin
       Factor := Amortiza;
       if Factor = 0 then
       begin
          Result := 0;
          Exit;
       end;
       n := (12/(Factor/30));
       potencia := power(1+(Tasa/100)/n,n);
       Result := SimpleRoundTo((potencia-1)*100,-2);
end;

function TForm1.TasaEfectivaAnticipada(Tasa: Double;Amortiza:Integer): Double;
 var n:single;
     potencia: Single;
     Factor:Double;
begin
       Factor := Amortiza;
       if Factor = 0 then
       begin
          Result := 0;
          Exit;
       end;
       n := (12/(Factor/30));
       potencia := power(1+(Tasa/100)/-n,-n);
       Result := SimpleRoundTo((potencia-1)*100,-2);
end;

function TForm1.BuscoTasaEfectivaMaxima(Fecha:TDate):Double;
begin
        with IBQuery1 do
        begin
                SQL.Clear;
                SQL.Add('select VALOR_TASA_EFECTIVA from ');
                SQL.Add(' "col$tasafijas" where (:"FECHA" between FECHA_INICIAL and FECHA_FINAL)');
                ParamByName('FECHA').AsDate := Fecha;
                Open;
                if RecordCount = 0 then
                begin
                        SQL.Clear;
                        SQL.Add('select VALOR_TASA_EFECTIVA from ');
                        SQL.Add('"col$tasafijas" order by FECHA_INICIAL ASC ');
                        try
                          Open;
                          Last;
                          Result := FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
                          Close;
                        except
                           Close;
                           Result := 99.999;
                           Exit;
                        end;
                end
                else
                begin
                 Result := FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
                 Close;
                end;
        end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var FechaDesembolso:TDate;
    Amortizacion,Modalidad:Integer;
    TasaE:Extended;
    TasaN:Extended;
    TasaM:Extended;
begin
        with IBDataSet1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Open;
          Last;
          First;
          ProgressBar1.Min := 0;
          ProgressBar1.Max := RecordCount;
          while not Eof do begin
              EdColocacion.Caption := FieldByName('ID_COLOCACION').AsString;
              Application.ProcessMessages;
              ProgressBar1.Position := IBDataSet1.RecNo;
              FechaDesembolso := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
              TasaN := FieldByName('TASA_NOMINAL').AsFloat;
              Amortizacion := FieldByName('AMORTIZACION').AsInteger;
              Modalidad := FieldByName('MODALIDAD').AsInteger;
              case Modalidad of
              1:TasaE := tasaefectivaanticipada(TasaN,Amortizacion);
              2:TasaE := tasaefectivavencida(TasaN,Amortizacion);
              end;
              TasaM := Buscotasaefectivamaxima(FechaDesembolso);
              if TasaM < TasaE then
                TasaE := TasaM;
              case Modalidad of
              1: TasaN := tasanominalanticipada(TasaE,Amortizacion);
              2: TasaN := tasanominalvencida(TasaE,Amortizacion);
              end;
              Edit;
              FieldByName('NTASA_NOMINAL').AsFloat := TasaN;
              FieldByName('NTASA_EFECTIVA').AsFloat := TasaE;
              Post;
              Next;
          end;
          Transaction.Commit;
        end;
end;

end.
