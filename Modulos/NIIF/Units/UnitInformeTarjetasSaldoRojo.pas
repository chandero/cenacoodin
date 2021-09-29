unit UnitInformeTarjetasSaldoRojo;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBClient,
  IBCustomDataSet, IBQuery, IBDatabase, IBSQL;

type
  TfrmTarjetaSaldosRojo = class(TForm)
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    BitBtn2: TBitBtn;
    CDS: TClientDataSet;
    CDSID_TARJETA: TStringField;
    CDSCUENTA: TIntegerField;
    CDSASOCIADO: TStringField;
    CDSSALDO: TCurrencyField;
    IBTransaction1: TIBTransaction;
    IBQTarjetas: TIBQuery;
    IBSQL1: TIBSQL;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarjetaSaldosRojo: TfrmTarjetaSaldosRojo;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmTarjetaSaldosRojo.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmTarjetaSaldosRojo.btnProcesarClick(Sender: TObject);
var
   Ano:string;
   Fecha1,Fecha2:TDate;
begin

        Ano := IntToStr(YearOf(fFechaActual));
        Fecha1 := EncodeDate(StrToInt(Ano),01,01);
        Fecha2 := EncodeDate(StrToInt(Ano),MonthOf(fFechaActual),DayOf(fFechaActual));

        CDS.EmptyDataSet;

        with IBQTarjetas do
        begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('SELECT ');
         SQL.Add('  "cap$tarjetacuenta".ID_TARJETA,');
         SQL.Add('  "cap$tarjetacuenta".ID_AGENCIA,');
         SQL.Add('  "cap$tarjetacuenta".ID_TIPO_CAPTACION,');
         SQL.Add('  "cap$tarjetacuenta".NUMERO_CUENTA,');
         SQL.Add('  "cap$tarjetacuenta".DIGITO_CUENTA,');
         SQL.Add('  ("gen$persona".PRIMER_APELLIDO || '' '' ||');
         SQL.Add('  "gen$persona".SEGUNDO_APELLIDO || '' '' ||');
         SQL.Add('  "gen$persona".NOMBRE) AS NOMBRE');
         SQL.Add('FROM');
         SQL.Add(' "cap$tarjetacuenta"');
         SQL.Add(' INNER JOIN "cap$maestrotitular" ON ("cap$tarjetacuenta".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
         SQL.Add('  AND ("cap$tarjetacuenta".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
         SQL.Add('  AND ("cap$tarjetacuenta".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
         SQL.Add('  AND ("cap$tarjetacuenta".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
         SQL.Add(' INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
         SQL.Add('  AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
         SQL.Add('WHERE');
         SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR = 1) AND ');
         SQL.Add('  (("cap$tarjetacuenta".ID_ESTADO = 1) OR ');
         SQL.Add('  ("cap$tarjetacuenta".ID_ESTADO = 2))');
         try
           Open;
         except
           Transaction.Rollback;
           raise;
           Exit;
         end;

         IBSQL1.Close;
         IBSQL1.SQL.Clear;
         IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
         while not Eof do begin
          IBSQL1.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
          IBSQL1.ParamByName('TP').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
          IBSQL1.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
          IBSQL1.ParamByName('DGT').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
          IBSQL1.ParamByName('ANO').AsString  := Ano;
          IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;
          IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;
          try
           IBSQL1.ExecQuery;
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;

          if IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency < 0 then
          begin
           CDS.Open;
           CDS.Append;
           CDS.FieldByName('ID_TARJETA').AsString := FieldByName('ID_TARJETA').AsString;
           CDS.FieldByName('CUENTA').AsString :=  FieldByName('ID_TIPO_CAPTACION').AsString + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-'+ Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' + FieldByName('DIGITO_CUENTA').AsString;
           CDS.FieldByName('ASOCIADO').AsString := FieldByName('NOMBRE').AsString;
           CDS.FieldByName('SALDO').AsCurrency := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
           CDS.Post;
           CDS.Close;
          end;

          Next;
         end;
        end;


end;

end.
