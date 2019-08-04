unit UnitInformeCuentasporEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, IBCustomDataSet,
  IBQuery, IBSQL, pr_Common, pr_TxClasses, pr_Parser, ComCtrls;

type
  TfrmInformeCuentasporEstado = class(TForm)
    Panel1: TPanel;
    cmdCerrar: TBitBtn;
    cmdReporte: TBitBtn;
    Label1: TLabel;
    DBLCBEstados: TDBLookupComboBox;
    Label2: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    DSEstados: TDataSource;
    DSTipoCaptacion: TDataSource;
    IBQEstados: TIBQuery;
    IBQTipoCaptacion: TIBQuery;
    IBQuery1: TIBQuery;
    IBSQL1: TIBSQL;
    ProgressBar1: TProgressBar;
    Reporte: TprTxReport;
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdReporteClick(Sender: TObject);
    procedure ReporteUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeCuentasporEstado: TfrmInformeCuentasporEstado;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmInformeCuentasporEstado.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeCuentasporEstado.cmdReporteClick(Sender: TObject);
begin
        cmdReporte.Enabled := False;
        Application.ProcessMessages;

        ProgressBar1.Min := 0;
        ProgressBar1.Position := 0;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select count(NUMERO_CUENTA) as TOTAL from "cap$maestro" where ');
          SQL.Add('("cap$maestro".ID_ESTADO = :ID_ESTADO) AND');
          SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION)');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('ID_ESTADO').AsInteger := DBLCBEstados.KeyValue;
          try
            Open;
            ProgressBar1.Max := FieldByName('TOTAL').AsInteger;
          except
            Transaction.Rollback;
            raise;
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
          SQL.Add('("cap$maestro".ID_ESTADO = :ID_ESTADO) AND');
          SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION)');
          SQL.Add('ORDER BY');
          SQL.Add('"cap$maestro".ID_AGENCIA,');
          SQL.Add('"cap$maestro".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestro".NUMERO_CUENTA,');
          SQL.Add('"cap$maestro".DIGITO_CUENTA');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('ID_ESTADO').AsInteger := DBLCBEstados.KeyValue;
          try
            Open;
          except
            Transaction.Rollback;
            raise;
          end;
        end;


        Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
        Reporte.Variables.ByName['ESTADO'].AsString := DBLCBEstados.Text;
        Reporte.Variables.ByName['EMPLEADO'].AsString := Trim(Nombres+' '+Apellidos);
        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);

end;

procedure TfrmInformeCuentasporEstado.ReporteUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
begin
        if VarName = 'CAUSAL' then begin
           ProgressBar1.Position := IBQuery1.RecNo;
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select first 1 ID_ESTADO_ACTUAL,OBSERVACION from "cap$obsestado"');
           IBSQL1.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
           IBSQL1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
           IBSQL1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
           IBSQL1.SQL.Add('order by FECHA DESC');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
           IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBQuery1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
           IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger;
           IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := IBQuery1.FieldByName('DIGITO_CUENTA').AsInteger;
           try
             IBSQL1.ExecQuery;
             if IBSQL1.RecordCount > 0 then
                if IBSQL1.FieldByName('ID_ESTADO_ACTUAL').AsInteger = DBLCBEstados.KeyValue then
                   _vSetAsString(Value,IBSQL1.FieldByName('OBSERVACION').AsString)
                else
                   _vSetAsString(Value,'Causal No Establecida')
             else
                   _vSetAsString(Value,'Causal No Establecida');
             IsProcessed := True;
           except
             IBSQL1.Transaction.Rollback;
             IsProcessed := False;
             raise;
             Exit;
           end;
        end;
end;

procedure TfrmInformeCuentasporEstado.FormShow(Sender: TObject);
begin
        with IBQEstados do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Open;
           Last;
        end;
        IBQTipoCaptacion.Open;
        IBQTipoCaptacion.Last;

        DBLCBTipoCaptacion.KeyValue := 1;
        DBLCBEstados.KeyValue := 1;
end;

end.
