unit UnitInteresesPagados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, ComCtrls, DateUtils,
  StdCtrls, Buttons, ExtCtrls, JvTypedEdit, JvEdit,JclDateTime;

type
  TfrmInteresesPagados = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
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
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInteresesPagados: TfrmInteresesPagados;

implementation
uses UnitGlobales;
{$R *.dfm}

procedure TfrmInteresesPagados.btnProcesarClick(Sender: TObject);
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
        //ShowMessage(DateToStr(_dFechaInicial));
        //ShowMessage(DateToStr(_dFechaCorteAhorros));
        //Exit;
        //Movimientos de Extractos
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('delete from "dian$interesespagos"');
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$interesespagos" ');
          SQL.Add('select');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('210505000000000000 AS CODIGO,');
          SQL.Add('SUM("cap$extracto".VALOR_DEBITO) AS VALOR');
          SQL.Add('from');
          SQL.Add('"cap$extracto"');
          SQL.Add('inner join');
          SQL.Add('"cap$maestrotitular" on ("cap$extracto".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
          SQL.Add('"cap$extracto".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
          SQL.Add('"cap$extracto".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
          SQL.Add('"cap$extracto".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('where');
          SQL.Add('("cap$extracto".ID_TIPO_CAPTACION IN (2,4)) and');
          SQL.Add('("cap$extracto".ID_TIPO_MOVIMIENTO IN (7,15)) and');
          SQL.Add('("cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2) and');
          SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1) ');
         // SQL.Add('("cap$extracto".VALOR_DEBITO >= :MONTO)');
          SQL.Add('group by');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA');
          SQL.Add('having SUM("cap$extracto".VALOR_DEBITO) >= :MONTO');
          SQL.Add('order by');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA');
          ParamByName('FECHA1').AsDate := _dFechaInicial;
          ParamByName('FECHA2').AsDate := _dFechaCorteAhorros;
          ParamByName('MONTO').AsCurrency := EdMonto.Value;
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;
        //Movimientos de Retenciones del Año reportado
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$interesespagos" ');
          SQL.Add('select');
          SQL.Add('"cap$causacioncdat".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncdat".ID_PERSONA,');
          SQL.Add('210510000000000000 AS CODIGO,');
          SQL.Add('"cap$causacioncdat".CAUSACION_TOTAL AS VALOR');
          SQL.Add('from');
          SQL.Add('"cap$causacioncdat"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncdat".ANO = :ANO AND');
          SQL.Add('"cap$causacioncdat".MES = :MES AND');
          SQL.Add('"cap$causacioncdat".CAUSACION_TOTAL > 0');
          ParamByName('ANO').AsInteger := EdPeriodo.Value;
          ParamByName('MES').AsInteger := 12;//MonthOfDate(_dFechaCorteCausacion);
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;
       //Movimientos de Retenciones del Año anterior
          Close;
          SQL.Clear;
          SQL.Add('insert into "dian$interesespagos" ');
          SQL.Add('select');
          SQL.Add('"cap$causacioncdat".ID_IDENTIFICACION,');
          SQL.Add('"cap$causacioncdat".ID_PERSONA,');
          SQL.Add('210510000000000000 AS CODIGO,');
          SQL.Add('-"cap$causacioncdat".CAUSACION_TOTAL AS VALOR');
          SQL.Add('from');
          SQL.Add('"cap$causacioncdat"');
          SQL.Add('where');
          SQL.Add('"cap$causacioncdat".ANO = :ANO AND');
          SQL.Add('"cap$causacioncdat".MES = :MES AND');
          SQL.Add('"cap$causacioncdat".CAUSACION_TOTAL > 0');
          ParamByName('ANO').AsInteger := EdPeriodo.Value - 1;
          ParamByName('MES').AsInteger := 12;//MonthOfDate(_dFechaCorteCausacion);
          try
           ExecSQL;
          except
           Transaction.Rollback;
           raise;
          end;
           Transaction.Commit;
        end;
        Screen.Cursor := Save_Cursor;
        Application.ProcessMessages;
        ShowMessage('Proceso Realizado con Exito');


end;

procedure TfrmInteresesPagados.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInteresesPagados.FormShow(Sender: TObject);
begin
        EdPeriodo.Value := YearOf(fFechaActual)-1;
end;

end.
