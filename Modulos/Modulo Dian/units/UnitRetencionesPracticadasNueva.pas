unit UnitRetencionesPracticadasNueva;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, StdCtrls, Grids,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, ComCtrls;

type
  TfrmRetencionesPracticadasNueva = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRetencionesPracticadasNueva: TfrmRetencionesPracticadasNueva;

implementation

{$R *.dfm}

uses unitGlobales, UnitDmGeneral;

procedure TfrmRetencionesPracticadasNueva.FormShow(Sender: TObject);
begin
        EdPeriodo.Value := yearof(ffechaactual) - 1;
        EdMonto.Value := 0;
end;

procedure TfrmRetencionesPracticadasNueva.btnProcesarClick(Sender: TObject);
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
          Transaction.StartTransaction;
          {Close;
          SQL.Clear;
          SQL.Add('delete from "dian$retefuente1" ');
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;}
          SQL.Add('insert into "dian$retefuente1" ');

          SQL.Add('SELECT');
          SQL.Add('  "cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('  "cap$maestrotitular".ID_PERSONA,');
          SQL.Add('  244535000000000000 AS CODIGO,');
          SQL.Add('  (SUM("cap$extracto".VALOR_CREDITO - "cap$extracto".VALOR_DEBITO) /.07) AS MONTO,');
          SQL.Add('  .07 AS TASA,');
          SQL.Add('  SUM("cap$extracto".VALOR_CREDITO - "cap$extracto".VALOR_DEBITO) AS RETENCION,');
          SQL.Add('  0 AS DEVOLUCION,');
          SQL.Add('  .07 AS TASAN');
          SQL.Add('FROM');
          SQL.Add('  "cap$extracto"');
          SQL.Add('  INNER JOIN "cap$maestrotitular" ON ("cap$extracto".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
          SQL.Add('  AND ("cap$extracto".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
          SQL.Add('  AND ("cap$extracto".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA)');
          SQL.Add('  AND ("cap$extracto".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('  INNER JOIN "cap$maestro" ON ("cap$extracto".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA)');
          SQL.Add('  AND ("cap$extracto".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
          SQL.Add('  AND ("cap$extracto".ID_AGENCIA = "cap$maestro".ID_AGENCIA)');
          SQL.Add('  AND ("cap$extracto".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('WHERE');
          SQL.Add('  "cap$extracto".ID_TIPO_CAPTACION IN (2,4) AND');
          SQL.Add('  "cap$extracto".ID_TIPO_MOVIMIENTO IN (8,16) AND');
          SQL.Add('  "cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 AND :FECHA2 AND');
          SQL.Add('  "cap$maestrotitular".NUMERO_TITULAR = 1 AND');
          SQL.Add('  "cap$maestro".ID_ESTADO <> 15');
          SQL.Add('GROUP BY');
          SQL.Add('  "cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('  "cap$maestrotitular".ID_PERSONA');
          SQL.Add('HAVING');
          SQL.Add('  SUM("cap$extracto".VALOR_CREDITO - "cap$extracto".VALOR_DEBITO) >= :MONTO');
          SQL.Add('ORDER BY');
          SQL.Add('  "cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('  "cap$maestrotitular".ID_PERSONA');
          ParamByName('FECHA1').AsDate := EncodeDate(EdPeriodo.Value,01,01);
          ParamByName('FECHA2').AsDate := EncodeDate(EdPeriodo.Value,12,31);
          ParamByName('MONTO').AsCurrency := EdMonto.Value;
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;

          //Causación Cdat 2007
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$retefuente1" ');
          SQL.Add('select');
          SQL.Add('"cap$causacioncdat".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncdat".ID_PERSONA,');
          SQL.Add('244535000000000000 AS CODIGO,');
          SQL.Add('"cap$causacioncdat".CAUSACION_TOTAL AS MONTO,');
          SQL.Add('0.07 as TASA,');
          SQL.Add('0,');
          SQL.Add('"cap$causacioncdat".RETEFUENTE_TOTAL as DEVOLUCION, 0.07 as TASAN');
          SQL.Add('from');
          SQL.Add('"cap$causacioncdat"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncdat".ANO = :ANO AND');
          SQL.Add('"cap$causacioncdat".MES = 12 AND');
          SQL.Add('"cap$causacioncdat".RETEFUENTE_TOTAL > 0');
          ParamByName('ANO').AsInteger := EdPeriodo.Value -1;
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;

          // Causacion CDAT 2008
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$retefuente1" ');
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

          //Causacíon Contractual 2007
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$retefuente1" ');
          SQL.Add('select');
          SQL.Add('"cap$causacioncon".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncon".ID_PERSONA,');
          SQL.Add('244535000000000000 AS CODIGO,');
          SQL.Add('"cap$causacioncon".CAUSACION_MENSUAL AS MONTO,');
          SQL.Add('0.07 as TASA,');
          SQL.Add('0 AS RETENCION,');
          SQL.Add('"cap$causacioncon".RETEFUENTE_MENSUAL as DEVOLUCION, 0.07 AS TASAN');
          SQL.Add('from');
          SQL.Add('"cap$causacioncon"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncon".ANO = :ANO AND');
          SQL.Add('"cap$causacioncon".MES = 12 AND');
          SQL.Add('"cap$causacioncon".RETEFUENTE_ACUMULADA > 0');
          ParamByName('ANO').AsInteger := EdPeriodo.Value - 1;
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;

          //Causación COntractual 2008
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$retefuente1" ');
          SQL.Add('select');
          SQL.Add('"cap$causacioncon".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncon".ID_PERSONA,');
          SQL.Add('244535000000000000 AS CODIGO,');
          SQL.Add('"cap$causacioncon".CAUSACION_MENSUAL AS MONTO,');
          SQL.Add('0.07 as TASA,');
          SQL.Add('"cap$causacioncon".RETEFUENTE_MENSUAL AS RETENCION,');
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
         { SQL.Clear;
          SQL.Add('insert into "dian$retefuente1" ');
          SQL.Add('select CON$AUXILIAR.ID_IDENTIFICACION,');
          SQL.Add('CON$AUXILIAR.ID_PERSONA,');
          SQL.Add('CON$AUXILIAR.CODIGO,');
          SQL.Add('CON$AUXILIAR.MONTO_RETENCION AS MONTO,');
          SQL.Add('CON$AUXILIAR.TASA_RETENCION AS TASA,');
          SQL.Add('CON$AUXILIAR.CREDITO AS RETENCION,');
          SQL.Add('CON$AUXILIAR.DEBITO AS DEVOLUCION,');
          SQL.Add('CON$AUXILIAR.TASA_RETENCION AS TASAN');
          SQL.Add('from CON$AUXILIAR');
          SQL.Add('inner join CON$PUC on (CON$AUXILIAR.CODIGO = CON$PUC.CODIGO)');
          SQL.Add('where CON$PUC.INFORME = ''01'' and CON$AUXILIAR.ESTADOAUX = ''C''');
          SQL.Add('and ((CON$AUXILIAR.ID_PERSONA is not Null ) and (CON$AUXILIAR.ID_PERSONA <> ''''))');
          SQL.Add('and (CON$AUXILIAR.CODIGO = 244535000000000000');
//          SQL.Add('and ((CON$AUXILIAR.TASA_RETENCION) <> 0 or (CON$AUXILIAR.MONTO_RETENCION <> 0))');
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;}

           Transaction.Commit;
        end;

        Screen.Cursor := Save_Cursor;

end;

procedure TfrmRetencionesPracticadasNueva.btnCerrarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmRetencionesPracticadasNueva.FormCreate(Sender: TObject);
begin
       EdPeriodo.Value := YearOf(fFechaActual) - 1;
end;

end.

