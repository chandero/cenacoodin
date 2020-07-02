unit UnitOperacionesAcumulada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pr_Common, pr_TxClasses, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, JvEdit, JvTypedEdit, IBSQL,
  IBDatabaseINI, pr_Classes, pr_Parser, DateUtils;

type
  TfrmOperacionesAcumuladas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdFechaI: TDateTimePicker;
    EdFechaF: TDateTimePicker;
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdReporte: TBitBtn;
    cmdCerrar: TBitBtn;
    GroupBox2: TGroupBox;
    chkConsol: TCheckBox;
    chkAgrupar: TCheckBox;
    chkReporte: TCheckBox;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBSQL1: TIBSQL;
    IBTabla: TIBQuery;
    Rg1: TRadioGroup;
    Label4: TLabel;
    EdMontoI: TJvCurrencyEdit;
    ReporteG: TprReport;
    Reporte: TprTxReport;
    procedure cmdProcesarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdReporteClick(Sender: TObject);
    procedure ReporteGUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOperacionesAcumuladas: TfrmOperacionesAcumuladas;
  OPE1,OPE2:Integer;
  TOT1,TOT2:Currency;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmOperacionesAcumuladas.cmdProcesarClick(Sender: TObject);
begin
        cmdProcesar.Enabled :=False;
        Application.ProcessMessages;


        with IBSQL1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('delete from "sipla$tempoae"');
          try
           ExecQuery;
           Close;
           Transaction.CommitRetaining;
          except
           Transaction.Rollback;
           raise;
          end;
        end;

        EdFechaI.Time := StrToTime('00:00:00');
        EdFechaF.Time := StrToTime('23:59:59');

        with IBQuery1 do begin
          Close;
          ParamByName('FECHA1').AsDateTime := EdFechaI.DateTime;
          ParamByName('FECHA2').AsDateTime := EdFechaF.DateTime;
          try
            Open;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

        with IBQuery2 do begin
          Close;
          ParamByName('FECHA1').AsDateTime := EdFechaI.DateTime;
          ParamByName('FECHA2').AsDateTime := EdFechaF.DateTime;
          try
            Open;
          except
            Transaction.Rollback;
            raise;
          end;
        end;


        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('insert into "sipla$tempoae" values(:NUMERO_CUENTA,'+
                                                ':ID_PERSONA,'+
                                                ':PRIMER_APELLIDO,'+
                                                ':SEGUNDO_APELLIDO,'+
                                                ':NOMBRE,'+
                                                ':ID_TIPO,'+
                                                ':VALOR)');



        with IBQuery1 do begin
           First;
           while not Eof do begin
             IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
             IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
             IBSQL1.ParamByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
             IBSQL1.ParamByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
             IBSQL1.ParamByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
             IBSQL1.ParamByName('ID_TIPO').AsInteger := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
             IBSQL1.ParamByName('VALOR').AsCurrency := FieldByName('BILLETES').AsCurrency;
             try
               if FieldByName('BILLETES').AsCurrency < EdMontoI.Value then
                  IBSQL1.ExecQuery;
             except
               Transaction.Rollback;
               raise;
             end;
             Next;
           end;
        end;

        with IBQuery2 do begin
           First;
           while not Eof do begin
             IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
             IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
             IBSQL1.ParamByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
             IBSQL1.ParamByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
             IBSQL1.ParamByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
             IBSQL1.ParamByName('ID_TIPO').AsInteger := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
             IBSQL1.ParamByName('VALOR').AsCurrency := FieldByName('BILLETES').AsCurrency;
             try
               if FieldByName('BILLETES').AsCurrency < EdMontoI.Value then
                  IBSQL1.ExecQuery;
             except
               Transaction.Rollback;
               raise;
             end;
             Next;
           end;
        end;

        chkConsol.Checked := True;

        with IBTabla do begin
            Close;
            SQL.Clear;
            SQL.Add('select MIN(NUMERO_CUENTA) AS NUMERO_CUENTA, ID_PERSONA,');
            SQL.Add('PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,ID_TIPO,');
            SQL.Add('SUM(VALOR) AS VALOR from "sipla$tempoae"');
            SQL.Add('group by ID_TIPO,ID_PERSONA, PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE');
            SQL.Add('having SUM(VALOR) >= :VALOR');
            ParamByName('VALOR').AsCurrency := EdMonto.Value;
            try
              Open;
            except
              Transaction.Rollback;
              raise;
            end;
        end;

        chkAgrupar.Checked := True;
        chkReporte.Checked := True;

        cmdReporte.Enabled := True;

        cmdReporte.Click;

end;

procedure TfrmOperacionesAcumuladas.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmOperacionesAcumuladas.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmOperacionesAcumuladas.cmdReporteClick(Sender: TObject);
begin
        OPE1 :=0;
        OPE2 :=0;
        TOT1 :=0;
        TOT2 :=0;

        case Rg1.ItemIndex of
        0: begin
                Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
                Reporte.Variables.ByName['AGENCIA'].AsString := Ciudad;
                Reporte.Variables.ByName['FECHA_INICIAL'].AsDateTime := EdFechaI.Date;
                Reporte.Variables.ByName['FECHA_FINAL'].AsDateTime := EdFechaF.Date;
                Reporte.Variables.ByName['MONTO'].AsDouble := EdMonto.Value;

                if Reporte.PrepareReport then
                   Reporte.PreviewPreparedReport(True);
           end;
        1:  begin
                ReporteG.Variables.ByName['EMPRESA'].AsString := Empresa;
                ReporteG.Variables.ByName['AGENCIA'].AsString := Ciudad;
                ReporteG.Variables.ByName['FECHA_INICIAL'].AsDateTime := EdFechaI.Date;
                ReporteG.Variables.ByName['FECHA_FINAL'].AsDateTime := EdFechaF.Date;
                ReporteG.Variables.ByName['MONTO'].AsDouble := EdMonto.Value;

                if ReporteG.PrepareReport then
                   ReporteG.PreviewPreparedReport(True);
           end;
        end;
end;

procedure TfrmOperacionesAcumuladas.ReporteGUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
begin
        if VarName = 'ID_TIPO' then begin
           _vSetAsInteger(Value,IBTabla.FieldByName('ID_TIPO').AsInteger);
           case IBTabla.FieldByName('ID_TIPO').AsInteger of
           1: begin
                OPE1 := OPE1 + 1;
                TOT1 := TOT1 + IBTabla.FieldByName('VALOR').AsCurrency;
              end;
           2: begin
                OPE2 := OPE2 + 1;
                TOT2 := TOT2 + IBTabla.FieldByName('VALOR').AsCurrency;                
              end;
           end;
        end;

        if VarName = 'OPE1' then
           _vSetAsInteger(Value,OPE1);
        if VarName = 'OPE2' then
           _vSetAsInteger(Value,OPE2);
        if VarName = 'TOT1' then
           _vSetAsDouble(Value,TOT1);
        if VarName = 'TOT2' then
           _vSetAsDouble(Value,TOT2);



        IsProcessed := True;
end;

procedure TfrmOperacionesAcumuladas.FormCreate(Sender: TObject);
var
  FechaHoy:TDate;
begin
        FechaHoy := fFechaActual;
        FechaHoy := FechaHoy - 30;
        EdFechaI.Date := encodedate(Yearof(FechaHoy),MonthOf(FechaHoy),01);
        EdFechaF.Date := encodedate(Yearof(FechaHoy),Monthof(FechaHoy),DaysInAMonth(Yearof(FechaHoy),Monthof(FechaHoy)));
end;

end.
