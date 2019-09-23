unit UnitPromedioCaptacion;

interface

uses
  Math, DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, IBSQL;

type
  TfrmPromedio = class(TForm)
    Panel1: TPanel;
    Label24: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Label1: TLabel;
    EdDigito: TStaticText;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    EdFechaInicial: TDateTimePicker;
    Label3: TLabel;
    EdFechaFinal: TDateTimePicker;
    Label4: TLabel;
    EdPromedio: TStaticText;
    btnPromedio: TBitBtn;
    btnCerrar: TBitBtn;
    IBQTipoCaptacion: TIBQuery;
    DSTipoCaptacion: TDataSource;
    EdNumero: TMemo;
    EdNombre: TStaticText;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    btnOtra: TBitBtn;
    Label5: TLabel;
    EdDias: TStaticText;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroExit(Sender: TObject);
    procedure btnPromedioClick(Sender: TObject);
    procedure btnOtraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Inicializar;
    procedure CicloSaldos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPromedio: TfrmPromedio;
  Tipo,Digito:Integer;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmPromedio.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPromedio.Inicializar;
begin
       if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;

       dmGeneral.IBTransaction1.StartTransaction;

       IBQTipoCaptacion.Open;
       IBQTipoCaptacion.Last;

       EdFechaFinal.Date := fFechaActual;
       EdFechaInicial.Date := Incday(fFechaActual,-30);

       btnPromedio.Enabled := False;
       EdNumero.Enabled := True;
       EdPromedio.Caption := '';
       EdNumero.Text := '';
       EdNombre.Caption := '';
       EdDigito.Caption := '';
       EdDias.Caption := '';

       DBLCBTipoCaptacion.SetFocus;

end;

procedure TfrmPromedio.FormKeyPress(Sender: TObject; var Key: Char);
begin
  EnterTabs(Key,Self);
end;

procedure TfrmPromedio.EdNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  NumericoSinPunto(Sender,Key);
end;

procedure TfrmPromedio.EdNumeroExit(Sender: TObject);
begin
      EdNumero.Text := Format('%.7d',[StrtoInt(EdNumero.Text)]);
      Tipo := DBLCBTipoCaptacion.KeyValue;
      Digito := StrToInt(DigitoControl(Tipo,EdNumero.Text));
      EdDigito.Caption := IntToStr(Digito);

      with IBSQL1 do begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ');
        SQL.Add('  "gen$persona".PRIMER_APELLIDO || '' '' ||');
        SQL.Add('  "gen$persona".SEGUNDO_APELLIDO || '' '' ||');
        SQL.Add('  "gen$persona".NOMBRE AS NOMBRE');
        SQL.Add('FROM');
        SQL.Add('  "cap$maestrotitular"');
        SQL.Add('  INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
        SQL.Add('WHERE');
        SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR = 1) AND ');
        SQL.Add('  ("cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA) AND ');
        SQL.Add('  ("cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND ');
        SQL.Add('  ("cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
        SQL.Add('  ("cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA)');
        ParamByName('ID_AGENCIA').AsInteger := Agencia;
        ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
        ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumero.Text);
        ParamByName('DIGITO_CUENTA').AsInteger := Digito;
        try
         ExecQuery;
        except
         Transaction.Rollback;
         raise;
        end;

        EdNombre.Caption := FieldByName('NOMBRE').AsString;
        btnPromedio.Enabled := True;
        EdNumero.Enabled := False;
      end;

end;

procedure TfrmPromedio.CicloSaldos;
var
  Dia1:TDate;
  Dia2:TDate;
  DiasPromedio:Integer;
  Saldo, SaldoMenor, SaldoPromedio:Currency;
begin

         Dia1 := EdFechaInicial.Date;
         Dia2 := EdFechaFinal.Date;

         SaldoPromedio := 0;
         DiasPromedio := 0;
         Saldo := 0;

         while Dia1 <= Dia2 do
         begin

          Application.ProcessMessages;

          with IBSQL1 do begin
             Close;
             SQL.Clear;
             SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
             ParamByName('AG').AsInteger := Agencia;
             ParamByName('TP').AsInteger := Tipo;
             ParamByName('CTA').AsInteger := StrToInt(EdNumero.Text);
             ParamByName('DGT').AsInteger := Digito;
             ParamByName('ANO').AsString := IntToStr(YearOf(Dia1));
             ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Dia1),01,01);
             ParamByName('FECHA2').AsDate := IncDay(Dia1,-1);
             try
              ExecQuery;
              Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
             except
              Transaction.Rollback;
              raise;
             end;
          end;

          with IBSQL2 do begin
             Close;
             SQL.Clear;
             SQL.Add('select VALOR_DEBITO, VALOR_CREDITO from "cap$extracto" where ');
             SQL.Add('(ID_AGENCIA = :"ID_AGENCIA" ) and (ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) and ');
             SQL.Add('(NUMERO_CUENTA = :"NUMERO_CUENTA") and (DIGITO_CUENTA = :"DIGITO_CUENTA") and ');
             SQL.Add('(FECHA_MOVIMIENTO = :"FECHA_MOVIMIENTO") ORDER BY HORA_MOVIMIENTO');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumero.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := Digito;
             ParamByName('FECHA_MOVIMIENTO').AsDate := Dia1;
             try
               ExecQuery;
             except
               Close;
               EdPromedio.Caption := 'Error al Calcular el Promedio, Consulte con Sistemas';
               Exit;
             end;

             SaldoMenor := Saldo;

             while not Eof do
             begin
               Application.ProcessMessages;             
               Saldo := Saldo + FieldByName('VALOR_DEBITO').AsCurrency - FieldByName('VALOR_CREDITO').AsCurrency;
               if Saldo < SaldoMenor then
                  SaldoMenor := Saldo;
               Next;
             end;

             SaldoPromedio := SaldoPromedio + SaldoMenor;
             DiasPromedio := DiasPromedio + 1;
          end;
         Dia1 := IncDay(Dia1,1);
        end;

        SaldoPromedio := SimpleRoundTo((SaldoPromedio/DiasPromedio),0);

        EdPromedio.Caption := FormatCurr('$ #,0',SaldoPromedio);
        EdDias.Caption := IntToStr(DiasPromedio);

end;

procedure TfrmPromedio.btnPromedioClick(Sender: TObject);
begin
        if EdNumero.Text = '' then Exit;
        btnPromedio.Enabled := False;
        CicloSaldos;
        dmGeneral.IBTransaction1.Commit;
end;

procedure TfrmPromedio.btnOtraClick(Sender: TObject);
begin
    Inicializar;
end;

procedure TfrmPromedio.FormShow(Sender: TObject);
begin
   Inicializar;
end;

end.
