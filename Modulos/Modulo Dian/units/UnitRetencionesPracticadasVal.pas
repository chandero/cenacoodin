unit UnitRetencionesPracticadasVal;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, StdCtrls, Grids,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, ComCtrls, pr_TxClasses,
  pr_Common, pr_Classes;

type
  TfrmRetencionesPracticadasVal = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    btnAExcel: TBitBtn;
    lbs1: TStaticText;
    IBQuery1: TIBQuery;
    Cds1: TClientDataSet;
    Cds1Tipo: TIntegerField;
    Cds1Codigo: TIntegerField;
    Cds1SubCodigo: TIntegerField;
    Cds1NumeroIde: TStringField;
    Cds1DigitoIde: TStringField;
    Cds1TipoIde: TStringField;
    Cds1Nombre: TStringField;
    Cds1Primer: TCurrencyField;
    Cds1Segundo: TCurrencyField;
    Cds1TercerValor: TCurrencyField;
    Cds1Direccion: TStringField;
    Cds1DptoMun: TStringField;
    IBSQL1: TIBSQL;
    sd1: TSaveDialog;
    Bar: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    nit: TEdit;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    IBQuery2: TIBQuery;
    prReport1: TprReport;
    prTxReport1: TprTxReport;
    procedure FormShow(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRetencionesPracticadasVal: TfrmRetencionesPracticadasVal;

implementation

{$R *.dfm}

uses unitGlobales, UnitDmGeneral;

procedure TfrmRetencionesPracticadasVal.FormShow(Sender: TObject);
begin
        EdPeriodo.Value := yearof(ffechaactual) - 1;
        EdMonto.Value := 0;
end;

procedure TfrmRetencionesPracticadasVal.btnProcesarClick(Sender: TObject);
var
  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Pa:string;
  Sa:string;
  Rz:string;
  Dr:string;
  Dpto:string;
  Mn:string;
  Fila:Integer;
  Save_Cursor:TCursor;
Begin
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        Fila := 0;
        lbs1.Visible := True;
        Application.ProcessMessages;
        with IBQuery1 do begin
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('delete from "dian$retefuente"');
         ExecSQL;
         Transaction.Commit;
         Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$retefuente" ');
          SQL.Add('select');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('244535000000000000 AS CODIGO,');
          SQL.Add('(SUM("cap$extracto".VALOR_CREDITO - "cap$extracto".VALOR_DEBITO) / .07) AS MONTO,');
          SQL.Add('.07 AS TASA,');
          SQL.Add('SUM("cap$extracto".VALOR_CREDITO - "cap$extracto".VALOR_DEBITO) AS RETENCION,');
          SQL.Add('0 as DEVOLUCION,  .07 AS TASAN');
          SQL.Add('from');
          SQL.Add('"cap$extracto"');
          SQL.Add('inner join');
          SQL.Add('"cap$maestrotitular" on ("cap$extracto".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
          SQL.Add('"cap$extracto".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
          SQL.Add('"cap$extracto".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
          SQL.Add('"cap$extracto".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('where');
          SQL.Add('("cap$extracto".ID_TIPO_CAPTACION IN (2,4)) and');
          SQL.Add('("cap$extracto".ID_TIPO_MOVIMIENTO IN (8,16)) and');
          SQL.Add('("cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2) and');
          SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1)');
          SQL.Add('group by');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA');
          SQL.Add('having');
          SQL.Add('SUM("cap$extracto".VALOR_CREDITO - "cap$extracto".VALOR_DEBITO) >= :MONTO');
          SQL.Add('order by');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA');
          ParamByName('FECHA1').AsDate := EncodeDate(EdPeriodo.Value,01,01);
          ParamByName('FECHA2').AsDate := EncodeDate(EdPeriodo.Value,12,31);
          ParamByName('MONTO').AsCurrency := EdMonto.Value;
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$retefuente" ');
          SQL.Add('select');
          SQL.Add('"cap$causacioncdat".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncdat".ID_PERSONA,');
          SQL.Add('244535000000000000 AS CODIGO,');
          SQL.Add('"cap$causacioncdat".CAUSACION_TOTAL AS MONTO,');
          SQL.Add('0.07 as TASA,');
          SQL.Add('"cap$causacioncdat".RETEFUENTE_TOTAL AS RETENCION,');
          SQL.Add('0 as DEVOLUCION, 0.07 as TASAN');
          SQL.Add('from');
          SQL.Add('"cap$causacioncdat"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncdat".ANO = :ANO AND');
          SQL.Add('"cap$causacioncdat".MES = 12 AND');
          SQL.Add('"cap$causacioncdat".RETEFUENTE_TOTAL > 0');
          ParamByName('ANO').AsInteger := EdPeriodo.Value;
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$retefuente" ');
          SQL.Add('select');
          SQL.Add('"cap$causacioncon".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncon".ID_PERSONA,');
          SQL.Add('244535000000000000 AS CODIGO,');
          SQL.Add('"cap$causacioncon".CAUSACION_ACUMULADA AS MONTO,');
          SQL.Add('0.07 as TASA,');
          SQL.Add('"cap$causacioncon".RETEFUENTE_ACUMULADA AS RETENCION,');
          SQL.Add('0 as DEVOLUCION, 0.07 AS TASAN');
          SQL.Add('from');
          SQL.Add('"cap$causacioncon"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncon".ANO = :ANO AND');
          SQL.Add('"cap$causacioncon".MES = 12 AND');
          SQL.Add('"cap$causacioncon".RETEFUENTE_ACUMULADA > 0');
          ParamByName('ANO').AsInteger := EdPeriodo.Value;
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$retefuente" ');
          SQL.Add('SELECT ');
          SQL.Add('CON$AUXILIAR.ID_IDENTIFICACION,');
          SQL.Add('CON$AUXILIAR.ID_PERSONA,');
          SQL.Add('CON$AUXILIAR.CODIGO,');
          SQL.Add('CON$AUXILIAR.MONTO_RETENCION AS MONTO,');
          SQL.Add('CON$AUXILIAR.TASA_RETENCION AS TASA,');
          SQL.Add('CON$AUXILIAR.CREDITO AS RETENCION,');
          SQL.Add('CON$AUXILIAR.DEBITO AS DEVOLUCION,');
          SQL.Add('CON$AUXILIAR.TASA_RETENCION AS TASAN');
          SQL.Add('FROM');
          SQL.Add('CON$AUXILIAR');
          SQL.Add('INNER JOIN CON$PUC ON (CON$AUXILIAR.CODIGO=CON$PUC.CODIGO)');
          SQL.Add('INNER JOIN CON$COMPROBANTE ON (CON$AUXILIAR.ID_COMPROBANTE=CON$COMPROBANTE.ID_COMPROBANTE)');
          SQL.Add('WHERE');
          SQL.Add('(CON$PUC.INFORME = ''01'') AND ');
          SQL.Add('(CON$AUXILIAR.ID_PERSONA IS NOT NULL) AND ');
          SQL.Add('(CON$AUXILIAR.ID_PERSONA = :NIT) AND ');
          SQL.Add('(CON$COMPROBANTE.FECHADIA BETWEEN :FECHA2 AND :FECHA3)');
          ParamByName('NIT').AsString := NIT.Text;
          ParamByName('FECHA2').AsDateTime := fecha1.DateTime;
          ParamByName('FECHA3').AsDateTime := fecha2.DateTime;
//          SQL.Add('and ((CON$AUXILIAR.TASA_RETENCION) <> 0 or (CON$AUXILIAR.MONTO_RETENCION <> 0))');
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;

           Transaction.Commit;
          end;
         // with IBQuery1 do
         { begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('CON$RETEFUENTECSC.CSC,');
            SQL.Add('("gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE) AS NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"dian$retefuente".ID_PERSONA,');
            SQL.Add('CON$PUC.NOMBRE,');
            SQL.Add('SUM("dian$retefuente".MONTO) AS MONTO,');
            SQL.Add('"dian$retefuente".TASAN,');
            SQL.Add('SUM("dian$retefuente".RETENCION) AS RETENCION');
            SQL.Add('FROM');
            SQL.Add('"dian$retefuente"');
            SQL.Add('INNER JOIN "gen$persona" ON ("dian$retefuente".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND');
            SQL.Add('("dian$retefuente".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('LEFT JOIN CON$PUC ON ("dian$retefuente".CODIGO = CON$PUC.CODIGO)');
            SQL.Add('LEFT JOIN "gen$tiposidentificacion" ON ("dian$retefuente".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
            SQL.Add('LEFT JOIN CON$RETEFUENTECSC ON ("dian$retefuente".ID_PERSONA = CON$RETEFUENTECSC.ID_PERSONA)');
            SQL.Add('where "dian$retefuente".CODIGO <> :CODIGO and "dian$retefuente".DEVOLUCION = 0');
            SQL.Add('GROUP BY');
            SQL.Add('CON$RETEFUENTECSC.CSC,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
            SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
            SQL.Add('"dian$retefuente".ID_PERSONA,');
            SQL.Add('CON$PUC.NOMBRE, "dian$retefuente".TASAN');
//            SQL.Add('HAVING SUM(RETENCION) >= 100000');
            SQL.Add('ORDER BY "dian$retefuente".ID_PERSONA ASC');
            ParamByName('CODIGO').AsString := '243535000000000000'{YA ES NIIF};
            //Open;
        //end;
        with prTxReport1 do begin
         Variables.ByName['EMPRESA'].AsString := 'CREDISERVIR';
         Variables.ByName['NIT'].AsString := '00000000';
//         Variables.ByName['NUMERO'].AsInteger := StrToInt(Edit2.Text);
         Variables.ByName['ANOG'].AsInteger := 2007;
         Variables.ByName['FECHA'].AsDateTime := Date;
         Variables.ByName['CIUDAD'].AsString := 'OCA?A';
        end;
//        IBQuery1.Close;
//        IBQuery1.ParamByName('ID_PERSONA1').AsString := Edit1.Text;
//        IBQuery1.ParamByName('ID_PERSONA2').AsString := Edit1.Text;
        try
         IBQuery1.Open;
         if IBQuery1.RecordCount > 0 then
           if prTxReport1.PrepareReport then
              prTxReport1.PreviewPreparedReport(True);
        except
          raise;
        end;



        Screen.Cursor := Save_Cursor;     

end;

procedure TfrmRetencionesPracticadasVal.btnCerrarClick(Sender: TObject);
begin
Close;
end;

end.
