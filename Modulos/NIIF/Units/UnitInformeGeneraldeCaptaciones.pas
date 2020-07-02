unit UnitInformeGeneraldeCaptaciones;

interface

uses
  Windows, Messages, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, DBCtrls, ComCtrls, ExtCtrls, Buttons,
  DB, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, pr_parser, IBSQL,
  UnitPantallaProgreso, UnitDmGeneral;

type
  TfrmInformeGeneraldeCaptaciones = class(TForm)
    Label24: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Label25: TLabel;
    EdNumeroI: TJvEdit;
    Label1: TLabel;
    EdNumeroF: TJvEdit;
    Label3: TLabel;
    EdFechaCorte: TDateTimePicker;
    Panel1: TPanel;
    RGTipoInforme: TRadioGroup;
    Panel2: TPanel;
    CmdGenerar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQTipoCaptacion: TIBQuery;
    DSTipoCaptacion: TDataSource;
    IBQuery5: TIBQuery;
    IBSQL1: TIBSQL;
    ReporteCap: TprTxReport;
    ReporteCon: TprTxReport;
    ReporteCer: TprTxReport;
    procedure ReporteCapUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroIKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroFKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdGenerarClick(Sender: TObject);
    procedure EdNumeroIExit(Sender: TObject);
    procedure EdNumeroFExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeGeneraldeCaptaciones: TfrmInformeGeneraldeCaptaciones;
  frmProgreso:TfrmProgreso;
  dmGeneral: TdmGeneral;
  SaldoTotal:Currency;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmInformeGeneraldeCaptaciones.ReporteCapUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var Ag,Tipo,Cuenta,Digito:Integer;
    Saldo:Currency;
begin


        Ag     := IBQuery5.FieldByName('ID_AGENCIA').AsInteger;
        Tipo   := IBQuery5.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        Cuenta := IBQuery5.FieldByName('NUMERO_CUENTA').AsInteger;
        Digito := IBQuery5.FieldByName('DIGITO_CUENTA').AsInteger;

        frmProgreso.Position := IBQuery5.RecNo;
        frmProgreso.InfoLabel := 'Captacion: ' + IntToStr(IBQuery5.FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                                 Format('%.2d',[IBQuery5.FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                 Format('%.7d',[IBQuery5.FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                 IntToStr(IBQuery5.FieldByName('DIGITO_CUENTA').AsInteger);
        Application.ProcessMessages;

        if VarName = 'SALDO_ACTUAL' then begin
          with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
            ParamByName('AG').AsInteger := Ag;
            ParamByName('TP').AsInteger := Tipo;
            ParamByName('CTA').AsInteger := Cuenta;
            ParamByName('DGT').AsInteger := Digito;
            ParamByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
            ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
            ParamByName('FECHA2').AsDate := EdFechaCorte.Date;
            try
             ExecQuery;
             Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
            except
             Transaction.Rollback;
             frmprogreso.cerrar;
            end;
          end;
           _vSetAsDouble(Value,Saldo);
           SaldoTotal := SaldoTotal + Saldo;
           IsProcessed := True;
        end;

        if VarName = 'SEGUNDO_TITULAR' then begin
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "cap$maestrotitular"');
           IBSQL1.SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
           IBSQL1.SQL.Add('where');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Ag;
           IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
           IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
           IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
           try
            IBSQL1.ExecQuery;
            if IBSQL1.RecordCount > 0 then
               _vSetAsString(Value,IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                   IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                   IBSQL1.FieldByName('NOMBRE').AsString)
            else
               _vSetAsString(Value,'');
           except
               _vSetAsString(Value,'');
           end;
           IsProcessed := True;
        end;

        if VarName = 'SaldoTotal' then begin
           SaldoTotal := SaldoTotal / 2;
           _vSetAsDouble(Value,SaldoTotal);
           IsProcessed := True;
        end;



end;

procedure TfrmInformeGeneraldeCaptaciones.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmInformeGeneraldeCaptaciones.Inicializar;
begin
        with IBQTipoCaptacion do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Open;
         Last;
        end;

        EdFechaCorte.Date := fFechaActual;

        frmProgreso := TfrmProgreso.Create(Self);
end;

procedure TfrmInformeGeneraldeCaptaciones.EdNumeroIKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmInformeGeneraldeCaptaciones.EdNumeroFKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmInformeGeneraldeCaptaciones.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeGeneraldeCaptaciones.CmdGenerarClick(Sender: TObject);
begin
        CmdGenerar.Enabled :=False;
        Application.ProcessMessages;


        with IBSQL1 do begin
          Close;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('NUMERO_CUENTA_1').AsInteger := StrToInt(EdNumeroI.Text);
          ParamByName('NUMERO_CUENTA_2').AsInteger := StrToInt(EdNumeroF.Text);
          ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
          try
            ExecQuery;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

        case DBLCBTipoCaptacion.KeyValue of
        1..4:begin

                with IBQuery5 do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT');
                  SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA, "cap$maestro".DIGITO_CUENTA,');
                  SQL.Add('"gen$persona".ID_PERSONA,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE, "cap$maestro".VALOR_INICIAL, "cap$maestro".PLAZO_CUENTA,');
                  SQL.Add('"cap$tiposplancontractual".DESCRIPCION,');
                  SQL.Add('"cap$maestro".CUOTA,');
                  SQL.Add('"cap$maestro".TASA_EFECTIVA,');
                  SQL.Add('"col$tasasvariables".DESCRIPCION_TASA,');
                  SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
                  SQL.Add('"cap$maestro".PUNTOS_ADICIONALES,');
                  SQL.Add('"cap$maestro".AMORTIZACION,');
                  SQL.Add('"cap$maestro".FECHA_APERTURA,');
                  SQL.Add('"cap$maestro".FECHA_VENCIMIENTO,');
                  SQL.Add('"cap$maestro".FECHA_PRORROGA,');
                  SQL.Add('"cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
                  SQL.Add('"cap$tiposestado".SE_SUMA');
                  SQL.Add(' FROM');
                  SQL.Add('"cap$maestro"');
                  SQL.Add('INNER JOIN "cap$tiposestado" on ("cap$tiposestado".ID_ESTADO = "cap$maestro".ID_ESTADO)');
                  SQL.Add('INNER JOIN "cap$maestrotitular" on (("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
                  SQL.Add('AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
                  SQL.Add('AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA))');
                  SQL.Add('INNER JOIN "gen$persona" on (("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA))');
                  SQL.Add('LEFT JOIN "cap$tiposplancontractual" on ("cap$tiposplancontractual".ID_PLAN = "cap$maestro".ID_PLAN)');
                  SQL.Add('LEFT JOIN "col$tasasvariables" on ("cap$maestro".ID_INTERES = "col$tasasvariables".ID_INTERES)');
                  SQL.Add('WHERE');
                  SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA BETWEEN :NUMERO_CUENTA_1 and :NUMERO_CUENTA_2');
                  SQL.Add('and "cap$maestro".FECHA_APERTURA <= :FECHACORTE and "cap$maestrotitular".NUMERO_TITULAR = 1 and "cap$tiposestado".SE_SUMA = 1');
                  SQL.Add('ORDER BY');
                  SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA');
                  ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('NUMERO_CUENTA_1').AsInteger := StrToInt(EdNumeroI.Text);
                  ParamByName('NUMERO_CUENTA_2').AsInteger := StrToInt(EdNumeroF.Text);
                  ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
                end;

              ReporteCap.Variables.ByName['Empresa'].AsString := Empresa;
              ReporteCap.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.DateTime;
              ReporteCap.Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;

              SaldoTotal := 0;

              frmProgreso.Min := 0;
              frmProgreso.Max := IBSQL1.FieldByName('TOTAL').AsInteger;

              frmProgreso.Ejecutar;
              if ReporteCap.PrepareReport then begin
                 frmProgreso.Cerrar;
                 ReporteCap.PreviewPreparedReport(True);
              end;
             end;
           5:begin

              with IBQuery5 do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT');
                  SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA, "cap$maestro".DIGITO_CUENTA,');
                  SQL.Add('"gen$persona".ID_PERSONA,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE, "cap$maestro".VALOR_INICIAL, "cap$maestro".PLAZO_CUENTA,');
                  SQL.Add('"cap$tiposplancontractual".DESCRIPCION,');
                  SQL.Add('"cap$maestro".CUOTA,');
                  SQL.Add('"cap$maestro".TASA_EFECTIVA,');
                  SQL.Add('"col$tasasvariables".DESCRIPCION_TASA,');
                  SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
                  SQL.Add('"cap$maestro".PUNTOS_ADICIONALES,');
                  SQL.Add('"cap$maestro".AMORTIZACION,');
                  SQL.Add('"cap$maestro".FECHA_APERTURA,');
                  SQL.Add('"cap$maestro".FECHA_VENCIMIENTO,');
                  SQL.Add('"cap$maestro".FECHA_PRORROGA,');
                  SQL.Add('"cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
                  SQL.Add('"cap$tiposestado".SE_SUMA');
                  SQL.Add(' FROM');
                  SQL.Add('"cap$maestro"');
                  SQL.Add('INNER JOIN "cap$tiposestado" on ("cap$tiposestado".ID_ESTADO = "cap$maestro".ID_ESTADO)');
                  SQL.Add('INNER JOIN "cap$maestrotitular" on (("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
                  SQL.Add('AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
                  SQL.Add('AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA))');
                  SQL.Add('INNER JOIN "gen$persona" on (("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA))');
                  SQL.Add('LEFT JOIN "cap$tiposplancontractual" on ("cap$tiposplancontractual".ID_PLAN = "cap$maestro".ID_PLAN)');
                  SQL.Add('LEFT JOIN "col$tasasvariables" on ("cap$maestro".ID_INTERES = "col$tasasvariables".ID_INTERES)');
                  SQL.Add('WHERE');
                  SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA BETWEEN :NUMERO_CUENTA_1 and :NUMERO_CUENTA_2');
                  SQL.Add('and "cap$maestro".FECHA_APERTURA <= :FECHACORTE and "cap$tiposestado".SE_SUMA <> 0 and "cap$maestrotitular".NUMERO_TITULAR = 1');
                  SQL.Add('ORDER BY');
                  SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA');
                  ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('NUMERO_CUENTA_1').AsInteger := StrToInt(EdNumeroI.Text);
                  ParamByName('NUMERO_CUENTA_2').AsInteger := StrToInt(EdNumeroF.Text);
                  ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
              end;

              ReporteCon.Variables.ByName['Empresa'].AsString := Empresa;
              ReporteCon.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.DateTime;
              ReporteCon.Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;

              SaldoTotal := 0;

              frmProgreso.Min := 0;
              frmProgreso.Max := IBSQL1.FieldByName('TOTAL').AsInteger;

              frmProgreso.Ejecutar;
              if ReporteCon.PrepareReport then begin
                 frmProgreso.Cerrar;
                 ReporteCon.PreviewPreparedReport(True);
              end;
             end;
           6:begin
              with IBQuery5 do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT');
                  SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA, "cap$maestro".DIGITO_CUENTA,');
                  SQL.Add('"gen$persona".ID_PERSONA,');
                  SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE, "cap$maestro".VALOR_INICIAL, "cap$maestro".PLAZO_CUENTA,');
                  SQL.Add('"cap$maestro".TASA_EFECTIVA,');
                  SQL.Add('"col$tasasvariables".DESCRIPCION_TASA,');
                  SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
                  SQL.Add('"cap$maestro".PUNTOS_ADICIONALES,');
                  SQL.Add('"cap$maestro".AMORTIZACION,');
                  SQL.Add('"cap$maestro".FECHA_APERTURA,');
                  SQL.Add('"cap$maestro".FECHA_VENCIMIENTO,');
                  SQL.Add('"cap$maestro".FECHA_PRORROGA,');
                  SQL.Add('"cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
                  SQL.Add('"cap$tiposestado".SE_SUMA');
                  SQL.Add(' FROM');
                  SQL.Add('"cap$maestro"');
                  SQL.Add('INNER JOIN "cap$tiposestado" on ("cap$tiposestado".ID_ESTADO = "cap$maestro".ID_ESTADO)');
                  SQL.Add('INNER JOIN "cap$maestrotitular" on (("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
                  SQL.Add('AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
                  SQL.Add('AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA))');
                  SQL.Add('INNER JOIN "gen$persona" on (("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA))');
                  SQL.Add('LEFT JOIN "col$tasasvariables" on ("cap$maestro".ID_INTERES = "col$tasasvariables".ID_INTERES)');
                  SQL.Add('WHERE');
                  SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA BETWEEN :NUMERO_CUENTA_1 and :NUMERO_CUENTA_2');
                  SQL.Add('and "cap$maestro".FECHA_APERTURA <= :FECHACORTE and "cap$tiposestado".SE_SUMA <> 0 and "cap$maestrotitular".NUMERO_TITULAR = 1');
                  SQL.Add('ORDER BY');
                  SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA');
                  ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('NUMERO_CUENTA_1').AsInteger := StrToInt(EdNumeroI.Text);
                  ParamByName('NUMERO_CUENTA_2').AsInteger := StrToInt(EdNumeroF.Text);
                  ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
              end;
              ReporteCer.Variables.ByName['Empresa'].AsString := Empresa;
              ReporteCer.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.DateTime;
              ReporteCer.Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;

              SaldoTotal := 0;

              frmProgreso.Min := 0;
              frmProgreso.Max := IBSQL1.FieldByName('TOTAL').AsInteger;

              frmProgreso.Ejecutar;
              if ReporteCer.PrepareReport then begin
                 frmProgreso.Cerrar;
                 ReporteCer.PreviewPreparedReport(True);
              end;
             end;
        end;
end;

procedure TfrmInformeGeneraldeCaptaciones.EdNumeroIExit(Sender: TObject);
begin
        EdNumeroI.Text := Format('%.7d',[StrtoInt(EdNumeroI.Text)]);
end;

procedure TfrmInformeGeneraldeCaptaciones.EdNumeroFExit(Sender: TObject);
begin
        EdNumeroF.Text := Format('%.7d',[StrtoInt(EdNumeroF.Text)]);
end;

procedure TfrmInformeGeneraldeCaptaciones.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;

        IBQTipoCaptacion.Database := dmGeneral.IBDatabase1;
        IBQuery5.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;

        IBQTipoCaptacion.Transaction := dmGeneral.IBTransaction1;
        IBQuery5.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;


end;

end.
