unit UnitListadoGeneralCaptaciones;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, Buttons, pr_Common, pr_TxClasses, pr_Parser, IBSQL, IBStoredProc;

type
  TfrmListadoGeneralCaptaciones = class(TForm)
    Panel1: TPanel;
    Label24: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    EdFechaInicial: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    EdFechaFinal: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    IBQuery2: TIBQuery;
    IBSQL2: TIBSQL;
    IBQuery3: TIBQuery;
    IBQuery4: TIBQuery;
    IBSQL1: TIBSQL;
    IBQuery5: TIBQuery;
    IBSP1: TIBQuery;
    ReporteCap: TprTxReport;
    ReporteCer: TprTxReport;
    ReporteCon: TprTxReport;
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ReporteCapUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure ReporteConUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
  private
    procedure CasoAhorros;
    procedure CasoContractual;
    procedure CasoCertificado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListadoGeneralCaptaciones: TfrmListadoGeneralCaptaciones;
  SaldoFinal,SaldoAnt:Currency;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales,UnitVistaPreliminar,UnitPantallaProgreso;

procedure TfrmListadoGeneralCaptaciones.FormShow(Sender: TObject);
begin
        if IBQuery1.Transaction.InTransaction then
           IBQuery1.Transaction.Rollback;
        IBQuery1.Transaction.StartTransaction;
        IBQuery1.Open;
        IBQuery1.Last;
        DBLCBTipoCaptacion.KeyValue := 1;
        EdFechaInicial.Date := Date;
        EdFechaFinal.Date := Date;
end;

procedure TfrmListadoGeneralCaptaciones.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmListadoGeneralCaptaciones.CmdVerClick(Sender: TObject);
begin
     if DBLCBTipoCaptacion.KeyValue > 4 then
        with IBQuery5 do begin
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('FECHA1').AsDate := EdFechaInicial.Date;
          ParamByName('FECHA2').AsDate := EdFechaFinal.Date;
          Open;
        end;

        case DBLCBTipoCaptacion.KeyValue of
        1..4:CasoAhorros;
           5:CasoContractual;
           6:CasoCertificado;
        end;

end;

procedure TfrmListadoGeneralCaptaciones.CasoAhorros;
var frmVistaPreliminar:TfrmVistaPreliminar;
    frmPantallaProgreso:TfrmProgreso;
    frmProgreso:TfrmProgreso;
    TablaTmp:string;
    Total:Integer;
    Saldo:Currency;
    Id:string;
    Titular:string;
    STitular:string;
    Tipo:Integer;
begin
        TablaTmp := '"RptCap'+FloatToStr(Now)+'"';
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('CREATE TABLE ' + TablaTmp + ' (');
          SQL.Add('ID_AGENCIA         TIPOS,');
          SQL.Add('ID_TIPO_CAPTACION  TIPOS,');
          SQL.Add('NUMERO_CUENTA      INTEGER,');
          SQL.Add('DIGITO_CUENTA      SMALLINT,');
          SQL.Add('ID_PERSONA         VARCHAR(15),');
          SQL.Add('PRIMER_TITULAR     VARCHAR(255),');
          SQL.Add('SALDO              NUMERICO,');
          SQL.Add('SEGUNDO_TITULAR    VARCHAR(255))');
          try
           ExecQuery;
           Transaction.CommitRetaining;
          except
           MessageDlg('Imposible crear tabla temporal',mtError,[mbcancel],0);
           raise;
           Exit;
          end;
        end;

        Tipo := DBLCBTipoCaptacion.KeyValue;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) AS TOTAL from "cap$maestro"');
          SQL.Add('LEFT JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
          SQL.Add('WHERE "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('FECHA_APERTURA BETWEEN :FECHA1 and :FECHA2 and "cap$tiposestado".SE_SUMA <> 0');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaInicial.Date),MonthOf(EdFechaInicial.Date),DayOf(EdFechaInicial.Date));
          ParamByName('FECHA2').AsDate := EncodeDate(YearOf(EdFechaFinal.Date),MonthOf(EdFechaFinal.Date),DayOf(EdFechaFinal.Date));
          try
            ExecQuery;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error al Buscar Captaciones',mtError,[mbcancel],0);
            raise;
            Exit;
          end;
        end;


        with IBQuery4 do begin
          Close;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaInicial.Date),MonthOf(EdFechaInicial.Date),DayOf(EdFechaInicial.Date));
          ParamByName('FECHA2').AsDate := EncodeDate(YearOf(EdFechaFinal.Date),MonthOf(EdFechaFinal.Date),DayOf(EdFechaFinal.Date));
          try
            Open;
          except
            MessageDlg('Error al Buscar Captaciones',mtError,[mbcancel],0);
            raise;
            Exit;
          end;//try

          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Min := 0;
          frmProgreso.Max := Total;
          frmProgreso.Position := 0;
          frmProgreso.Ejecutar;

          while not Eof do begin
              frmProgreso.Position := RecNo;
{              frmProgreso.InfoLabel := 'Procesando Captación:' + Format('%d',[Tipo]) +
                                                                 Format('%.2d',[FieldByName('AG').AsInteger]) + '-' +
                                                                 Format('%.7d',[FieldByName('NUMERO').AsInteger]) + '-' +
                                                                 Format('%d',[FieldByName('DIGITO').AsInteger]);
}
              frmProgreso.InfoLabel := 'Procesando Captación:' + Format('%d',[FieldByName('ID_TIPO_CAPTACION').AsInteger]) +
                                                                 Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                                                 Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                                                 Format('%d',[FieldByName('DIGITO_CUENTA').AsInteger]);

              Application.ProcessMessages;
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('select "cap$maestrotitular".NUMERO_TITULAR,"cap$maestrotitular".ID_PERSONA, "gen$persona".PRIMER_APELLIDO,');
                IBSQL2.SQL.Add('"gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE from "cap$maestrotitular"');
                IBSQL2.SQL.Add('left join "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
                IBSQL2.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
                IBSQL2.SQL.Add('where "cap$maestrotitular".ID_AGENCIA = :AG and "cap$maestrotitular".ID_TIPO_CAPTACION = :TP and');
                IBSQL2.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :CTA and "cap$maestrotitular".DIGITO_CUENTA = :DG');
{
                IBSQL2.ParamByName('AG').AsInteger := FieldByName('AG').AsInteger;
                IBSQL2.ParamByName('TP').AsInteger := DBLCBTipoCaptacion.KeyValue;;
                IBSQL2.ParamByName('CTA').AsInteger := FieldByName('NUMERO').AsInteger;
                IBSQL2.ParamByName('DG').AsInteger  := FieldByName('DIGITO').AsInteger;
}
                IBSQL2.ParamByName('AG').AsInteger := Agencia;
                IBSQL2.ParamByName('TP').AsInteger := DBLCBTipoCaptacion.KeyValue;;
                IBSQL2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBSQL2.ParamByName('DG').AsInteger  := FieldByName('DIGITO_CUENTA').AsInteger;
                try
                 IBSQL2.ExecQuery;
                 if IBSQL2.RecordCount > 0 then
                   while not IBSQL2.Eof do begin
                      if IBSQL2.FieldByName('NUMERO_TITULAR').AsInteger = 1 then begin
                        Id := IBSQL2.FieldByName('ID_PERSONA').AsString;
                        Titular := IBSQL2.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                   IBSQL2.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                   IBSQL2.FieldByName('NOMBRE').AsString;
                       end;
                       if IBSQL2.FieldByName('NUMERO_TITULAR').AsInteger = 2 then begin
                        STitular := IBSQL2.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                   IBSQL2.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                   IBSQL2.FieldByName('NOMBRE').AsString;
                       end; // if
                      IBSQL2.Next;
                   end // while
                 else
                 begin
                   Id := '';
                   Titular := '';
                   STitular := '';
                 end; // if recordcount
                except
                 frmProgreso.Cerrar;
                 raise;
                end;// try

                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('insert into ' + TablaTmp + ' Values(');
                IBSQL2.SQL.Add(':AG,:TP,:CTA,:DG,:ID,:T,:S,:ST)');
{                IBSQL2.ParamByName('AG').AsInteger  := FieldByName('AG').AsInteger;
                IBSQL2.ParamByName('TP').AsInteger  := DBLCBTipoCaptacion.KeyValue;
                IBSQL2.ParamByName('CTA').AsInteger := FieldByName('NUMERO').AsInteger;
                IBSQL2.ParamByName('DG').AsInteger  := FieldByName('DIGITO').AsInteger;
}
                IBSQL2.ParamByName('AG').AsInteger  := FieldByName('ID_AGENCIA').AsInteger;
                IBSQL2.ParamByName('TP').AsInteger  := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBSQL2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBSQL2.ParamByName('DG').AsInteger  := FieldByName('DIGITO_CUENTA').AsInteger;
                IBSQL2.ParamByName('ID').AsString   := Id;
                IBSQL2.ParamByName('T').AsString    := Titular;
                IBSQL2.ParamByName('ST').AsString   := STitular;
//                IBSQL2.ParamByName('S').AsCurrency  := FieldByName('SALDO_ACTUAL').AsCurrency;
                try
                 IBSQL2.ExecQuery;
                 IBSQL2.Transaction.CommitRetaining;
                except
                 frmProgreso.Cerrar;
                 raise;
                end; // try
            Next;
           end; // while
          end; //with
          frmProgreso.Cerrar;


        IBQuery5.Close;
        IBQuery5.SQL.Clear;
        IBQuery5.SQL.Add('select * from '+ TablaTmp);
        IBQuery5.Open;

        ReporteCap.Variables.ByName['Empresa'].AsString := Empresa;
        ReporteCap.Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;
        ReporteCap.Variables.ByName['FechaInicial'].AsDateTime := EdFechaInicial.Date;
        ReporteCap.Variables.ByName['FechaFinal'].AsDateTime  := EdFechaFinal.Date;
        SaldoFinal := 0;
        frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
        frmVistaPreliminar.Reporte := ReporteCap;
        frmVistaPreliminar.ShowModal;
       

        IBSQL2.Close;
        IBSQL2.SQL.Clear;
        IBSQL2.SQL.Add('drop table ' + TablaTmp);
        IBSQL2.ExecQuery;
        IBSQL2.Transaction.Commit;
end;

procedure TfrmListadoGeneralCaptaciones.CasoContractual;
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
        ReporteCon.Variables.ByName['Empresa'].AsString := Empresa;
        ReporteCon.Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;
        ReporteCon.Variables.ByName['FechaInicial'].AsDateTime := EdFechaInicial.Date;
        ReporteCon.Variables.ByName['FechaFinal'].AsDateTime  := EdFechaFinal.Date;

        SaldoFinal := 0;
        frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
        frmVistaPreliminar.Reporte := ReporteCon;
        frmVistaPreliminar.ShowModal;
end;

procedure TfrmListadoGeneralCaptaciones.CasoCertificado;
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
        ReporteCer.Variables.ByName['Empresa'].AsString := Empresa;
        ReporteCer.Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;
        ReporteCer.Variables.ByName['FechaInicial'].AsDateTime := EdFechaInicial.Date;
        ReporteCer.Variables.ByName['FechaFinal'].AsDateTime  := EdFechaFinal.Date;

        SaldoFinal := 0;
        frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
        frmVistaPreliminar.Reporte := ReporteCer;
        frmVistaPreliminar.ShowModal;
end;

procedure TfrmListadoGeneralCaptaciones.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmListadoGeneralCaptaciones.ReporteCapUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var Ag,Tipo,Cuenta,Digito:Integer;
    Saldo,Movimiento:Currency;
begin
        Ag     := IBQuery5.FieldByName('ID_AGENCIA').AsInteger;
        Tipo   := IBQuery5.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        Cuenta := IBQuery5.FieldByName('NUMERO_CUENTA').AsInteger;
        Digito := IBQuery5.FieldByName('DIGITO_CUENTA').AsInteger;
        if VarName = 'SALDO_ACTUAL' then begin
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('SELECT * FROM SALDO_ACTUAL(:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                   Saldo := 0
                  else
                   Saldo := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                except
                   Saldo := 0;
                end;

                SaldoAnt := Saldo;
                SaldoFinal := SaldoFinal + Saldo;
                _vSetAsDouble(Value,Saldo);
                IsProcessed := True;
        end;
        if VarName = 'SALDO_ACTUAL_1' then begin
           _vSetAsDouble(Value,SaldoAnt);
           SaldoAnt := 0;
           IsProcessed := True;
        end;

        if VarName = 'NOMBRE' then begin
           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('select "cap$maestrotitular".ID_PERSONA,"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "cap$maestrotitular"');
           IBSQL2.SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
           IBSQL2.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
           IBSQL2.SQL.Add('where');
           IBSQL2.SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
           IBSQL2.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL2.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
           IBSQL2.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL2.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1');
           IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
           IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
           IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
           IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
           try
            IBSQL2.ExecQuery;
            if IBSQL2.RecordCount > 0 then
               _vSetAsString(Value,IBSQL2.FieldByName('ID_PERSONA').AsString + '     '+ IBSQL2.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                   IBSQL2.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                   IBSQL2.FieldByName('NOMBRE').AsString)
            else
               _vSetAsString(Value,'');
           except
               _vSetAsString(Value,'');
           end;
           IsProcessed := True;
        end;

        if VarName = 'SEGUNDO_TITULAR' then begin
           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "cap$maestrotitular"');
           IBSQL2.SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
           IBSQL2.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
           IBSQL2.SQL.Add('where');
           IBSQL2.SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
           IBSQL2.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL2.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
           IBSQL2.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL2.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2');
           IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
           IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
           IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
           IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
           try
            IBSQL2.ExecQuery;
            if IBSQL2.RecordCount > 0 then
               _vSetAsString(Value,IBSQL2.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                   IBSQL2.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                   IBSQL2.FieldByName('NOMBRE').AsString)
            else
               _vSetAsString(Value,'');
           except
               _vSetAsString(Value,'');
           end;
           IsProcessed := True;
        end;
        if VarName = 'TotalAperturas' then begin
           _vSetAsDouble(Value,SaldoFinal);
           IsProcessed := True;
        end;


end;

procedure TfrmListadoGeneralCaptaciones.ReporteConUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var Ag,Tipo,Cuenta,Digito:Integer;
    Saldo,Movimiento:Currency;
begin
        Ag     := IBQuery5.FieldByName('ID_AGENCIA').AsInteger;
        Tipo   := IBQuery5.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        Cuenta := IBQuery5.FieldByName('NUMERO_CUENTA').AsInteger;
        Digito := IBQuery5.FieldByName('DIGITO_CUENTA').AsInteger;
        Saldo := 0;


        if VarName = 'SALDO_ACTUAL' then begin
                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('Select "cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestrosaldoinicial"');
                IBSQL2.SQL.Add('Where');
                IBSQL2.SQL.Add('"cap$maestrosaldoinicial".ID_AGENCIA = :ID_AGENCIA and');
                IBSQL2.SQL.Add('"cap$maestrosaldoinicial".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL2.SQL.Add('"cap$maestrosaldoinicial".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestrosaldoinicial".DIGITO_CUENTA = :DIGITO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                   Saldo := 0
                  else
                   Saldo := IBSQL2.FieldByName('SALDO_INICIAL').AsCurrency;
                except
                   Saldo := 0;
                end;

                IBSQL2.Close;
                IBSQL2.SQL.Clear;
                IBSQL2.SQL.Add('SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS MOVIMIENTO from "cap$maestro"');
                IBSQL2.SQL.Add('LEFT JOIN "cap$extracto" ON ("cap$maestro".ID_AGENCIA = "cap$extracto".ID_AGENCIA) AND ');
                IBSQL2.SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$extracto".ID_TIPO_CAPTACION) AND ');
                IBSQL2.SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$extracto".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$extracto".DIGITO_CUENTA)');
                IBSQL2.SQL.Add('Where');
                IBSQL2.SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                IBSQL2.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL2.SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBSQL2.SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                IBSQL2.SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
//                SQL.Add('and "cap$extracto".ID_TIPO_MOVIMIENTO <> 7');
                IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
                IBSQL2.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
                try
                  IBSQL2.ExecQuery;
                  if IBSQL2.RecordCount < 1 then
                   Movimiento := 0
                  else
                   Movimiento := IBSQL2.FieldByName('MOVIMIENTO').AsCurrency;
                except
                   Movimiento := 0;
                end;

                Saldo := Saldo + Movimiento;
                SaldoFinal := SaldoFinal + Saldo;
                _vSetAsDouble(Value,Saldo);
                Saldo := 0;
                IsProcessed := True;
        end;
        if VarName = 'TotalAperturas' then begin
           _vSetAsDouble(Value,SaldoFinal);
           IsProcessed := True;
        end;

end;

end.
