unit UnitInactivacionCaptaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, IBCustomDataSet,
  IBQuery, IBSQL, DBCtrls, DBClient, pr_Common, pr_TxClasses;

type
  TfrmInactivacionCaptaciones = class(TForm)
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdCerrar: TBitBtn;
    cmdAplicar: TBitBtn;
    Label1: TLabel;
    EdDias: TStaticText;
    ProgressBar1: TProgressBar;
    RgProceso: TRadioGroup;
    IBQuery1: TIBQuery;
    IBSQL1: TIBSQL;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Label2: TLabel;
    IBQuery2: TIBQuery;
    DataSource1: TDataSource;
    IBQTabla: TClientDataSet;
    IBQTablaID_AGENCIA: TIntegerField;
    IBQTablaID_TIPO_CAPTACION: TIntegerField;
    IBQTablaNUMERO_CUENTA: TIntegerField;
    IBQTablaDIGITO_CUENTA: TIntegerField;
    IBQTablaID_PERSONA: TStringField;
    IBQTablaPRIMER_APELLIDO: TStringField;
    IBQTablaSEGUNDO_APELLIDO: TStringField;
    IBQTablaNOMBRE: TStringField;
    cmdReporte: TBitBtn;
    Reporte: TprTxReport;
    procedure cmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdReporteClick(Sender: TObject);
    procedure cmdAplicarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInactivacionCaptaciones: TfrmInactivacionCaptaciones;

implementation

{$R *.dfm}

uses unitdmgeneral,unitGlobales;

procedure TfrmInactivacionCaptaciones.cmdProcesarClick(Sender: TObject);
var Total:Integer;
    Fecha:TDate;
    Dias :Integer;
begin
        cmdProcesar.Enabled := False;
        cmdCerrar.Enabled := False;
        DBLCBTipoCaptacion.Enabled := False;
        RgProceso.Enabled := False;
        Application.ProcessMessages;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select COUNT(NUMERO_CUENTA) AS TOTAL');
          SQL.Add('from "cap$maestro"');
          SQL.Add('where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ID_ESTADO = 1');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            Transaction.Rollback;
            raise;
            Exit;
          end;

          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"cap$maestro".ID_AGENCIA,');
          SQL.Add('"cap$maestro".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestro".NUMERO_CUENTA,');
          SQL.Add('"cap$maestro".DIGITO_CUENTA,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE');
          SQL.Add('FROM');
          SQL.Add('"cap$maestro"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
          SQL.Add('AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
          SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND');
          SQL.Add('("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('WHERE');
          SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1) AND');
          SQL.Add('("cap$maestro".ID_ESTADO = 1) AND');
          SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION)');
          SQL.Add('ORDER BY');
          SQL.Add('"cap$maestro".ID_AGENCIA,');
          SQL.Add('"cap$maestro".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestro".NUMERO_CUENTA,');
          SQL.Add('"cap$maestro".DIGITO_CUENTA');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          try
            Open;
          except
            Transaction.Rollback;
            raise;
            Exit;
          end;

          ProgressBar1.Min := 0;
          ProgressBar1.Max := Total;
          ProgressBar1.Position := 0;

          IBQTabla.EmptyDataSet;

          while not Eof do begin
                ProgressBar1.Position := RecNo;
                Application.ProcessMessages;
                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select first 1 FECHA_MOVIMIENTO from "cap$extracto"');
                IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
                IBSQL1.SQL.Add('ID_TIPO_MOVIMIENTO <> 6 and ID_TIPO_MOVIMIENTO <> 7 and ID_TIPO_MOVIMIENTO <> 8 and');
                IBSQL1.SQL.Add('ID_TIPO_MOVIMIENTO <> 15 and ID_TIPO_MOVIMIENTO <> 16');
                IBSQL1.SQL.Add('ORDER BY FECHA_MOVIMIENTO DESC');
                IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                try
                 IBSQL1.ExecQuery;
                 if RecordCount > 0 then begin
                    Fecha := IBSQL1.FieldByName('FECHA_MOVIMIENTO').AsDate;
                    if DiasEntre(Fecha,fFechaActual) >= StrToInt(EdDias.Caption) then begin
                       IBQTabla.Open;
                       IBQTabla.Insert;
                       IBQTabla.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                       IBQTabla.FieldByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                       IBQTabla.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                       IBQTabla.FieldByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                       IBQTabla.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                       IBQTabla.FieldByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
                       IBQTabla.FieldByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
                       IBQTabla.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
                       IBQTabla.Post;
                       IBQTabla.Close;
                    end;
                 end;
                except
                 Transaction.Rollback;
                 raise;
                 Exit;
                end;

                Next;
          end;

        end;

        IBQuery1.Transaction.Commit;
        cmdReporte.Enabled := True;
        cmdCerrar.Enabled := True;
        if RgProceso.ItemIndex = 1 then
           cmdAplicar.Enabled := True;

end;

procedure TfrmInactivacionCaptaciones.FormShow(Sender: TObject);
begin
        with IBQuery2 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Open;
                Last;
        end;
        with IBSQL1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 1');
           try
             ExecQuery;
             EdDias.Caption := FormatCurr('##0',FieldByName('VALOR_MINIMO').AsCurrency);
           except
             Transaction.Rollback;
             raise;
             Exit;
           end;
        end;


        DBLCBTipoCaptacion.KeyValue := 2;
end;

procedure TfrmInactivacionCaptaciones.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInactivacionCaptaciones.cmdReporteClick(Sender: TObject);
begin
        Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
        Reporte.Variables.ByName['EMPLEADO'].AsString := Trim(Nombres+' '+Apellidos);
        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);
end;

procedure TfrmInactivacionCaptaciones.cmdAplicarClick(Sender: TObject);
begin
        cmdAplicar.Enabled := False;
        cmdReporte.Enabled := False;
        cmdCerrar.Enabled := False;
        
        Application.ProcessMessages;

        if IBSQL1.Transaction.InTransaction then
           IBSQL1.Transaction.Commit;
        IBSQL1.Transaction.StartTransaction;

        with IBQTabla do begin
            Open;
            First;
            ProgressBar1.Min := 0;
            ProgressBar1.Max := IBQTabla.RecordCount;
            while not Eof do begin
               ProgressBar1.Position := RecNo;
               Application.ProcessMessages;
               IBSQL1.Close;
               IBSQL1.SQL.Clear;
               IBSQL1.SQL.Add('update "cap$maestro" set ID_ESTADO = 3 where');
               IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
               IBSQL1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
               IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
               IBSQL1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
               IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
               IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               try
                 IBSQL1.ExecQuery;
               except
                 IBSQL1.Transaction.Rollback;
                 raise;
                 Exit;
               end;

               IBSQL1.Close;
               IBSQL1.SQL.Clear;
               IBSQL1.SQL.Add('insert into "cap$obsestado" values (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
               IBSQL1.SQL.Add(':FECHA,:HORA,:ID_ESTADO_ANTERIOR,:ID_ESTADO_ACTUAL,:OBSERVACION,:ID_EMPLEADO)');
               IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
               IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               IBSQL1.ParamByName('FECHA').AsDate := fFechaActual;
               IBSQL1.ParamByName('HORA').AsTime := fHoraActual;
               IBSQL1.ParamByName('ID_ESTADO_ANTERIOR').AsInteger := 1;
               IBSQL1.ParamByName('ID_ESTADO_ACTUAL').AsInteger := 3;
               IBSQL1.ParamByName('OBSERVACION').AsString := 'Inactivación por Falta de Movimientos';
               IBSQL1.ParamByName('ID_EMPLEADO').AsString := DBAlias;
               try
                 IBSQL1.ExecQuery;
               except
                 IBSQL1.Transaction.Rollback;
                 raise;
                 Exit;
               end;
               Next;
            end;
          IBSQL1.Transaction.Commit;
        end;

        MessageDlg('Inactivación de Cuentas, Aplicada Correctamente',mtInformation,[mbok],0);

        cmdReporte.Enabled := True;
        cmdCerrar.Enabled := True;

end;

end.
