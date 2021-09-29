unit UnitComprobanteDiarioCaja;

interface

uses
  Windows, Messages, DateUtils, StrUtils, Math, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, StdCtrls,
  Buttons, JvEdit, JvTypedEdit, ComCtrls, ExtCtrls, IBSQL, DBClient,
  IBTable, FR_DSet, FR_DBSet, FR_Class, IBDatabase, JclSysUtils;

type
  TfrmComprobanteDiario = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Caja: TLabel;
    EdFecha: TDateTimePicker;
    Panel2: TPanel;
    CmdGenera: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery: TIBQuery;
    IBSQL1: TIBSQL;
    EdCaja: TStaticText;
    Label2: TLabel;
    EdUsuario: TStaticText;
    EdStatus: TStaticText;
    IBSQLAux: TIBSQL;
    IBSQLDesc: TIBSQL;
    IBSQLColocacion: TIBSQL;
    Label3: TLabel;
    EdComprobante: TStaticText;
    cmdReporte: TBitBtn;
    IBSQL2: TIBSQL;
    Report: TprTxReport;
    IBAuxiliar: TIBQuery;
    prTxReport1: TprTxReport;
    CDconsecutivo: TClientDataSet;
    CDconsecutivoconsecutivo: TIntegerField;
    IBTransaction1: TIBTransaction;
    IBSQL3: TIBSQL;
    CDconsecutivoid_consecutivo: TIntegerField;
    CDcomision: TClientDataSet;
    CDcomisioncomision: TCurrencyField;
    CDcomisionagencia: TIntegerField;
    CDcomisionid_identificacion: TIntegerField;
    CDcomisionid_persona: TStringField;
    CDcomisionvalor: TAggregateField;
    Label4: TLabel;
    edSobrante: TJvCurrencyEdit;
    procedure CmdGeneraClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdFechaEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmdReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  NohaySucursal :Boolean;
    { Private declarations }
  public
    function ValidarCaja: Boolean;
    procedure Sucursal;
    { Public declarations }
  end;

var
  frmComprobanteDiario: TfrmComprobanteDiario;
  Tabla:string;
  Procesado:Boolean;
  CodigoCaja:string;
  Consecutivo:Integer;

implementation

uses UnitVistaPreliminar,UnitGlobales,UnitdmGeneral;

{$R *.dfm}

procedure TfrmComprobanteDiario.CmdGeneraClick(Sender: TObject);
var Fecha1,Fecha2:TDateTime;
    frmVistaPrelimar :TfrmVistaPreliminar;
    Entradas,Salidas,Descuento,Caja:Currency;
    Codigo:string;
    CodigoSobrante:String;
    ValorTasa,ValorVeces,ValorValor:Currency;
    TotalDebito,TotalCredito:Currency;
    NoHay:Boolean;
    vContinua :Boolean;
begin
        if MessageDlg('Seguro de Generar el Comprobante',mtConfirmation,[mbYes,MbNo],0) <> mryes then
           Exit;

        CmdGenera.Enabled := False;
        Application.ProcessMessages;

        Procesado := True;
        Empleado;
        Fecha1 := EdFecha.Date;
        Fecha1 := EncodeDate(YearOf(Fecha1),MonthOf(Fecha1),DayOf(Fecha1));
        Fecha2 := EdFecha.Date;
        Fecha2 := EncodeDate(YearOf(Fecha2),MonthOf(Fecha2),DayOf(Fecha2));
        Tabla := '"compcaj'+ EdCaja.Caption +'_'+FloatToStr(Time())+'"';
// Buscar Consecutivo
        Consecutivo := ObtenerConsecutivo(IBSQL1);
        CDconsecutivo.Append;
        CDconsecutivo.FieldValues['consecutivo'] := Consecutivo;
        CDconsecutivo.FieldValues['id_consecutivo'] := CDconsecutivo.RecNo + 1;
        CDconsecutivo.Post;
// Grabar Encabezado de Comprobante
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
                  with IBSQL1 do begin
                    Close;
                    SQL.Clear;
                    SQL.Add('INSERT INTO "con$comprobante" VALUES(');
                    SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,:FECHADIA,');
                    SQL.Add(':DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,:ESTADO,:IMPRESO,');
                    SQL.Add(':ANULACION,:ID_EMPLEADO)');
                    ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
                    ParamByName('FECHADIA').AsDate := EdFecha.Date;
                    ParamByName('DESCRIPCION').AsString := 'Contabilización de Movimientos de CAJA '+
                                                           EdCaja.Caption + ' '+ EdUsuario.Caption +
                                                           ' en la Fecha';
                    ParamByName('TOTAL_DEBITO').AsCurrency := 0;
                    ParamByName('TOTAL_CREDITO').AsCurrency := 0;
                    ParamByName('ESTADO').AsString := 'O';
                    ParamByName('IMPRESO').AsInteger := 0;
                    ParamByName('ANULACION').Clear;
                    ParamByName('ID_EMPLEADO').AsString := DBAlias;
                    try
                      ExecQuery;
                    except
                      MessageDlg('Error al Grabar Encabezado de Comprobante',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      Exit;
                    end;
                  end;
// Fin Grabar Encabezado

        with IBQuery do
        begin
            Close;
            SQL.Clear;
            SQL.Add('create table ' + Tabla + '(');
            SQL.Add('ID_AGENCIA SMALLINT,');
            SQL.Add('AGENCIA VARCHAR(50),');
            SQL.Add('ID_CAJA SMALLINT,');
            SQL.Add('FECHA_MOV TIMESTAMP,');
            SQL.Add('ORIGEN_MOVIMIENTO SMALLINT,');
            SQL.Add('ID_TIPO_CAPTACION SMALLINT,');
            SQL.Add('NUMERO_CUENTA INTEGER,');
            SQL.Add('NOMBRE VARCHAR(255),');
            SQL.Add('DOCUMENTO VARCHAR(15),');
            SQL.Add('ID_TIPO_MOVIMIENTO SMALLINT,');
            SQL.Add('EFECTIVO_DB NUMERICO,');
            SQL.Add('CHEQUE_DB NUMERICO,');
            SQL.Add('EFECTIVO_CR NUMERICO,');
            SQL.Add('CHEQUE_CR NUMERICO)');
            try
               ExecSQL;
            finally
               IBQuery.Transaction.CommitRetaining;
               IBQuery.Close;
            end;

            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"caj$movimiento".ID_CAJA,');
            SQL.Add('"caj$movimiento".ID_AGENCIA,');
            SQL.Add('"caj$movimiento".FECHA_MOV,');            
            SQL.Add('"caj$movimiento".ID_TIPO_CAPTACION,');
            SQL.Add('"caj$movimiento".NUMERO_CUENTA,');
            SQL.Add('"caj$movimiento".DIGITO_CUENTA,');
            SQL.Add('"caj$movimiento".ORIGEN_MOVIMIENTO,');
            SQL.Add('"caj$movimiento".ID_TIPO_MOVIMIENTO,');
            SQL.Add('"caj$movimiento".DOCUMENTO,');
            SQL.Add('"caj$movimiento".BILLETES,');
            SQL.Add('"caj$movimiento".MONEDAS,');
            SQL.Add('"caj$movimiento".CHEQUES,');
            SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
            SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
            SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
            SQL.Add('"gen$empleado".NOMBRE,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
            SQL.Add('"gen$persona".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
            SQL.Add('"gen$persona".NOMBRE AS NOMBRE1');
            SQL.Add('FROM');
            SQL.Add('"caj$movimiento"');
            SQL.Add('INNER JOIN "gen$agencia" ON ("caj$movimiento".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
            SQL.Add('INNER JOIN "caj$cajas" ON ("caj$movimiento".ID_CAJA = "caj$cajas".ID_CAJA)');
            SQL.Add('INNER JOIN "gen$empleado" ON ("caj$cajas".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
            SQL.Add('LEFT OUTER JOIN "cap$maestro" ON ("caj$movimiento".ID_AGENCIA = "cap$maestro".ID_AGENCIA) AND ("caj$movimiento".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION) AND ');
            SQL.Add('("caj$movimiento".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA) AND ("caj$movimiento".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
            SQL.Add('LEFT OUTER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
            SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
            SQL.Add('LEFT OUTER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('WHERE');
            SQL.Add('(FECHA_MOV BETWEEN :FECHA1 AND :FECHA2) AND');
            SQL.Add('("caj$movimiento".ID_CAJA = :ID_CAJA) AND');
            SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1) AND ');
            SQL.Add('("caj$movimiento".ORIGEN_MOVIMIENTO <> 10) ');
            SQL.Add('ORDER BY');
            SQL.Add('"caj$movimiento".ORIGEN_MOVIMIENTO,');
            SQL.Add('"caj$movimiento".ID_TIPO_MOVIMIENTO,');
            SQL.Add('"caj$movimiento".FECHA_MOV');
            ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
            ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
            ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
            try
             Open;
             IBQuery1.SQL.Clear;
             IBQuery1.SQL.Add('insert into '+Tabla+' values(');
             IBQuery1.SQL.Add(':ID_AGENCIA,:AGENCIA,:ID_CAJA,:FECHA_MOV,:ORIGEN_MOVIMIENTO,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
             IBQuery1.SQL.Add(':NOMBRE,:DOCUMENTO,:ID_TIPO_MOVIMIENTO,');
             IBQuery1.SQL.Add(':EFECTIVO_DB,:CHEQUE_DB,:EFECTIVO_CR,:CHEQUE_CR)');
             while not Eof do
             begin
               // Validacion para Contabilización de Contractuales
               vContinua := True;
               if FieldByName('ID_TIPO_CAPTACION').AsInteger = 5 then
                 if vContabilizaCon(FieldByName('NUMERO_CUENTA').AsInteger,FieldByName('ID_TIPO_CAPTACION').AsInteger,FieldByName('DIGITO_CUENTA').AsInteger) = False then
                    vContinua := False;
               // Fin Validacion Contabilizacion Contractuales
               if vContinua then
               begin
                 IBQuery1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                 IBQuery1.ParamByName('AGENCIA').AsString := FieldByName('DESCRIPCION_AGENCIA').AsString;
                 IBQuery1.ParamByName('ID_CAJA').AsInteger := FieldByName('ID_CAJA').AsInteger;
                 IBQuery1.ParamByName('FECHA_MOV').AsDateTime := FieldByName('FECHA_MOV').AsDateTime;
                 IBQuery1.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := FieldByName('ORIGEN_MOVIMIENTO').AsInteger;
                 IBQuery1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBQuery1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                 IBQuery1.ParamByName('NOMBRE').AsString := FieldByName('PRIMER_APELLIDO1').AsString + ' ' +FieldByName('SEGUNDO_APELLIDO1').AsString + ' ' + FieldByName('NOMBRE1').AsString;
                 IBQuery1.ParamByName('DOCUMENTO').AsString := FieldByName('DOCUMENTO').AsString;
                 IBQuery1.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
                 if FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1 then
                 begin
                    IBQuery1.ParamByName('EFECTIVO_DB').AsCurrency := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                    IBQuery1.ParamByName('CHEQUE_DB').AsCurrency := FieldByName('CHEQUES').AsCurrency;
                    IBQuery1.ParamByName('EFECTIVO_CR').AsCurrency := 0;
                    IBQuery1.ParamByName('CHEQUE_CR').AsCurrency := 0;
                 end
                 else
                 begin
                    IBQuery1.ParamByName('EFECTIVO_CR').AsCurrency := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                    IBQuery1.ParamByName('CHEQUE_CR').AsCurrency := FieldByName('CHEQUES').AsCurrency;
                    IBQuery1.ParamByName('EFECTIVO_DB').AsCurrency := 0;
                    IBQuery1.ParamByName('CHEQUE_DB').AsCurrency := 0;
                 end;
                 try
                   IBQuery1.ExecSQL;
                 except
                   MessageDlg('Error al actualizar temporal',mtError,[mbcancel],0);
                 end;
               end;
               Next;
             end
           except
              MessageDlg('Error al tratar de generar el informe',mtError,[mbcancel],0);
           end;
        end;

           IBQuery1.Close;
           IBQuery2.Close;
           IBQuery2.SQL.Clear;
           IBQuery2.SQL.Add('SELECT ');
           IBQuery2.SQL.Add('ID_ORIGEN,CODIGO,');
           IBQuery2.SQL.Add('SUM(EFECTIVO_DB+CHEQUE_DB) AS ENTRADA,');
           IBQuery2.SQL.Add('SUM(EFECTIVO_CR+CHEQUE_CR) AS SALIDA');
           IBQuery2.SQL.Add('FROM');
           IBQuery2.SQL.Add(Tabla);
           IBQuery2.SQL.Add('INNER JOIN "caj$origen" ON ( ORIGEN_MOVIMIENTO = "caj$origen".ID_ORIGEN)');
           IBQuery2.SQL.Add('where "caj$origen".GENERA_COMPROBANTE <> 0');
           IBQuery2.SQL.Add('GROUP BY');
           IBQuery2.SQL.Add('ID_ORIGEN,CODIGO');
           IBQuery2.SQL.Add('ORDER BY');
           IBQuery2.SQL.Add('ID_ORIGEN');
             try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then
                begin
                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('SELECT * FROM "caj$cajas" WHERE ID_CAJA = :ID_CAJA');
                  IBSQL1.ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
                  try
                    IBSQL1.ExecQuery;
                    if IBSQL1.RecordCount < 1 then begin
                     MessageDlg('No Se Encontró la Caja',mtError,[mbcancel],0);
                     Exit;
                    end;
                  except
                    MessageDlg('Error al Buscar Parametros de Caja',mtError,[mbcancel],0);
                    Exit;
                  end;
                  CodigoCaja := IBSQL1.FieldByName('CODIGO').AsString;
                  Caja := 0;
                  while not IBQuery2.Eof do
                   begin
                       Entradas := IBQuery2.FieldByName('ENTRADA').AsCurrency;
                       Salidas :=  IBQuery2.FieldByName('SALIDA').AsCurrency;
                       Codigo := IBQuery2.FieldByName('CODIGO').AsString;
                       Caja := Caja + (Entradas - Salidas);
// Registrar Entradas
                       if Entradas > 0 then
                       begin
                          IBSQLAux.Close;
                          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                          IBSQLAux.ParamByName('CODIGO').AsString := Codigo;
                          IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                          IBSQLAux.ParamByName('CREDITO').AsCurrency := Entradas;
                          IBSQLAux.ParamByName('ID_CUENTA').Clear;
                          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                          IBSQLAux.ParamByName('ID_PERSONA').Clear;
                          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                          try
                           IBSQLAux.ExecQuery;
                           NoHay := False;
                          except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                          end;
                       end;
//Registrar Salidas
                       if Salidas > 0 then
                       begin
                          IBSQLAux.Close;
                          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                          IBSQLAux.ParamByName('CODIGO').AsString := Codigo;
                          IBSQLAux.ParamByName('DEBITO').AsCurrency := Salidas;
                          IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                          IBSQLAux.ParamByName('ID_CUENTA').Clear;
                          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                          IBSQLAux.ParamByName('ID_PERSONA').Clear;
                          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                          try
                           IBSQLAux.ExecQuery;
                           NoHay := False;
                          except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                          end;
                       end;
// Registrar Otros Descuentos
                       IBSQLDesc.Close;
                       IBSQLDesc.ParamByName('CODIGO').AsString := Codigo;
                       try
                         IBSQLDesc.ExecQuery;
                       except
                       end;

                       if IBSQLDesc.RecordCount > 0 then
                       while not IBSQLDesc.Eof do begin
                         if IBSQLDesc.FieldByName('TOMAR_VALOR').AsString = 'E' then begin
                           ValorTasa:= SimpleRoundTo(IBSQLDesc.FieldByName('TASA').AsFloat*Entradas,0);
                           ValorValor := IBSQLDesc.FieldByName('VALOR').AsCurrency;
                           ValorVeces := IBSQLDesc.FieldByName('VECES').AsInteger * Entradas;
                         end
                         else
                         begin
                           ValorTasa:= SimpleRoundTo(IBSQLDesc.FieldByName('TASA').AsFloat*Salidas,0);
                           ValorValor := IBSQLDesc.FieldByName('VALOR').AsCurrency;
                           ValorVeces := IBSQLDesc.FieldByName('VECES').AsInteger * Salidas;
                         end;

                         if ValorTasa > 0 then begin
                          IBSQLAux.Close;
                          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                          IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_D').AsString;
                          IBSQLAux.ParamByName('DEBITO').AsCurrency := ValorTasa;
                          IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                          IBSQLAux.ParamByName('ID_CUENTA').Clear;
                          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                          IBSQLAux.ParamByName('ID_PERSONA').Clear;
                          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                          try
                           IBSQLAux.ExecQuery;
                           NoHay := False;
                          except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                          end;
                          IBSQLAux.Close;
                          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                          IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_C').AsString;
                          IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                          IBSQLAux.ParamByName('CREDITO').AsCurrency := ValorTasa;
                          IBSQLAux.ParamByName('ID_CUENTA').Clear;
                          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                          IBSQLAux.ParamByName('ID_PERSONA').Clear;
                          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                          try
                           IBSQLAux.ExecQuery;
                           NoHay := False;
                          except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                          end;
                         end;

                         if ValorVeces > 0 then begin
                          IBSQLAux.Close;
                          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                          IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_D').AsString;
                          IBSQLAux.ParamByName('DEBITO').AsCurrency := ValorVeces;
                          IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                          IBSQLAux.ParamByName('ID_CUENTA').Clear;
                          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                          IBSQLAux.ParamByName('ID_PERSONA').Clear;
                          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                          try
                           IBSQLAux.ExecQuery;
                           NoHay := False;
                          except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                          end;
                          IBSQLAux.Close;
                          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                          IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_C').AsString;
                          IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                          IBSQLAux.ParamByName('CREDITO').AsCurrency := ValorVeces;
                          IBSQLAux.ParamByName('ID_CUENTA').Clear;
                          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                          IBSQLAux.ParamByName('ID_PERSONA').Clear;
                          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                          try
                           IBSQLAux.ExecQuery;
                           NoHay := False;
                          except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                          end;
                         end;

                         if ValorValor > 0 then begin
                          IBSQLAux.Close;
                          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                          IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_D').AsString;
                          IBSQLAux.ParamByName('DEBITO').AsCurrency := ValorValor;
                          IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                          IBSQLAux.ParamByName('ID_CUENTA').Clear;
                          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                          IBSQLAux.ParamByName('ID_PERSONA').Clear;
                          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                          try
                           IBSQLAux.ExecQuery;
                           NoHay := False;
                          except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                          end;
                          IBSQLAux.Close;
                          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                          IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_C').AsString;
                          IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                          IBSQLAux.ParamByName('CREDITO').AsCurrency := ValorValor;
                          IBSQLAux.ParamByName('ID_CUENTA').Clear;
                          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                          IBSQLAux.ParamByName('ID_PERSONA').Clear;
                          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                          try
                           IBSQLAux.ExecQuery;
                           NoHay := False;
                          except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                          end;
                         end;
                        IBSQLDesc.Next;
                       end;
                    IBQuery2.Next;
                   end;

                 with IBQuery1 do begin
                   Close;
                   SQL.Clear;
                   SQL.Add('SELECT');
                   SQL.Add('"caj$codigospuc".CODIGO');
                   SQL.Add('FROM');
                   SQL.Add('"caj$codigospuc"');
                   SQL.Add('WHERE');
                   SQL.Add('"caj$codigospuc".ID_CODIGO = 3');
                   try
                    Open;
                    CodigoSobrante := FieldByName('CODIGO').AsString;
                   except
                    MessageDlg('Error al Leer código sobrantes',mtError,[mbOk],0);
                    raise;
                    exit;
                   end;
                 end;

                 if edSobrante.Value > 0 then
                 begin
                   Caja := Caja + edSobrante.Value;

                   IBSQLAux.Close;
                   IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                   IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                   IBSQLAux.ParamByName('CODIGO').AsString := CodigoSobrante;
                   IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                   IBSQLAux.ParamByName('CREDITO').AsCurrency := edSobrante.Value;
                   IBSQLAux.ParamByName('ID_CUENTA').Clear;
                   IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                   IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                   IBSQLAux.ParamByName('ID_PERSONA').Clear;
                   IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                   IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                   IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                   try
                    IBSQLAux.ExecQuery;
                    NoHay := False;
                   except
                    MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                    Exit;
                   end;
                  end;

                   if Caja <> 0 then begin
                       IBSQLAux.Close;
                       IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                       IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                       IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                       IBSQLAux.ParamByName('CODIGO').AsString := CodigoCaja;
                       if Caja > 0 then begin
                         IBSQLAux.ParamByName('DEBITO').AsCurrency := Caja;
                         IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                       end
                       else
                       begin
                         IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                         IBSQLAux.ParamByName('CREDITO').AsCurrency := -Caja;
                       end;
                       IBSQLAux.ParamByName('ID_CUENTA').Clear;
                       IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                       IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                       IBSQLAux.ParamByName('ID_PERSONA').Clear;
                       IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                       IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                       IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                       try
                         IBSQLAux.ExecQuery;
                         NoHay := False;
                       except
                         MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                         Exit;
                       end;
                    end;
                 end
               else
                 NoHay := True;
             finally
                IBQuery2.Close;
             end;

        with IBSQLColocacion do begin
           Close;
           ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
           ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
           ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
           try
             ExecQuery;
             if RecordCount > 0 then begin
             NoHay := False;
             while not eof do begin
              IBSQLAux.Close;
              IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
              IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
              IBSQLAux.ParamByName('CODIGO').AsString := FieldByName('CODIGO_PUC').AsString;
              IBSQLAux.ParamByName('DEBITO').AsCurrency := FieldByName('DEBITO').AsCurrency;
              IBSQLAux.ParamByName('CREDITO').AsCurrency := FieldByName('CREDITO').AsCurrency;
              IBSQLAux.ParamByName('ID_CUENTA').Clear;
              IBSQLAux.ParamByName('ID_COLOCACION').Clear;
              IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              IBSQLAux.ParamByName('ID_PERSONA').Clear;
              IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
              IBSQLAux.ParamByName('TASA_RETENCION').Clear;
              IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
              try
               IBSQLAux.ExecQuery;
               NoHay := False;
              except
               MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
               Exit;
              end;
              Next;
             end;
             end
             else
              if NoHay then
              begin
                MessageDlg('No Existe Información para el comprobante Local',mtInformation,[mbok],0);
              end;
           except
              MessageDlg('Error al buscar movimientos de colocaciones',mterror,[mbcancel],0);
              Transaction.Rollback;
              raise;
           end;
        end;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT SUM(DEBITO) AS DEBITO,SUM(CREDITO) AS  CREDITO FROM "con$auxiliar"');
          SQL.Add('WHERE ID_AGENCIA = :AGENCIA and ID_COMPROBANTE = :COMPROBANTE');
          ParamByName('AGENCIA').AsInteger := Agencia;
          ParamByName('COMPROBANTE').AsInteger := Consecutivo;
          try
            ExecQuery;
            TotalDebito := FieldByName('DEBITO').AsCurrency;
            TotalCredito := FieldByName('CREDITO').AsCurrency;
          finally
            Close;
          end;
          SQL.Clear;
          SQL.Add('UPDATE "con$comprobante" SET TOTAL_DEBITO = :DEBITO, TOTAL_CREDITO = :CREDITO,');
          SQL.Add('IMPRESO = 1 WHERE ID_AGENCIA = :ID_AGENCIA and ID_COMPROBANTE = :ID_COMPROBANTE');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
          ParamByName('DEBITO').AsCurrency := TotalDebito;
          ParamByName('CREDITO').AsCurrency := TotalCredito;
          try
             ExecQuery;
          except
          end;
        end;
//***comienzo generación nota contable de las agencias
        sucursal;       
//***fin nota contable de las agencias
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('Update "caj$cierres" set CONTABILIZADO = 1');
         SQL.Add('Where ID_CAJA = :ID_CAJA and FECHA = :FECHA');
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         ParamByName('FECHA').AsDate := EdFecha.Date;
         try
           ExecQuery;
           IBSQL1.Transaction.Commit;
         except
           IBSQL1.Transaction.Rollback;
         end;
        end;
        if (NoHay) and (NohaySucursal) then Exit;

        cmdReporte.Click;
        {with IBAuxiliar do begin
         if not Transaction.InTransaction then
            Transaction.StartTransaction;

         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
         try
          Open;
          Report.Variables.ByName['EMPRESA'].AsString := Empresa;
          Report.Variables.ByName['NIT'].AsString := Nit;
          if Report.PrepareReport then
             Report.PreviewPreparedReport(True);
         except
         end;
        end;}
end;

procedure TfrmComprobanteDiario.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmComprobanteDiario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

function TfrmComprobanteDiario.ValidarCaja: Boolean;
begin
         Result := False;
         if dmGeneral.IBTransaction1.InTransaction then
         begin
            dmGeneral.IBTransaction1.Commit;
         end;
         with IBsql1 do
         begin
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"caj$cajas".ID_CAJA,');
           SQL.Add('"caj$cajas".HORA_INICIO,');
           SQL.Add('"caj$cajas".HORA_FINAL,');
           SQL.Add('"caj$cajas".CODIGO,');
           SQL.Add('"caj$estados".PERMITE_MOVIMIENTO,');
           SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
           SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$empleado".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('"caj$cajas"');
           SQL.Add('INNER JOIN "caj$estados" ON ("caj$cajas".ID_ESTADO_CAJA = "caj$estados".ID_ESTADO)');
           SQL.Add('INNER JOIN "gen$empleado" ON ("caj$cajas".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('where "caj$cajas".ID_EMPLEADO = :ID_EMPLEADO');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           try
            ExecQuery;
            if RecordCount > 0 then
            begin
               if FieldByName('PERMITE_MOVIMIENTO').AsInteger = 0 then
               begin
                  Result := False;
                  Exit;
               end;
               if ( FieldByName('HORA_INICIO').AsTime > Time ) or
                  ( FieldByName('HORA_FINAL').AsTime < Time ) then
               begin
                  Result := False;
                  Exit;
               end;
               EdCaja.Caption := IntToStr(FieldByName('ID_CAJA').AsInteger);
               EdUsuario.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                    FieldByName('NOMBRE').AsString;
            end
            else
            begin
              Result := False;
              Close;
              Exit;
            end;
           except
              Result := False;
              Exit;
           end;
         end;
         Result := True;


end;

procedure TfrmComprobanteDiario.EdFechaChange(Sender: TObject);
begin
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('Select * from "caj$cierres" Where ID_CAJA = :ID_CAJA and FECHA = :FECHA');
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         ParamByName('FECHA').AsDate := EdFecha.Date;
         try
           Transaction.Commit;
         finally
           Transaction.StartTransaction;
         end;

         try
           ExecQuery;
         except
           MessageDlg('Error al verificar Cierre',mtError,[mbcancel],0);
           Exit;
         end;

         if FieldByName('ESTADO').AsInteger = 0 then
         begin
            EdStatus.Caption := 'No Cerrado';
            CmdGenera.Enabled := False;
            Exit;
         end;

         if FieldByName('CONTABILIZADO').AsInteger = 0 then
         begin
           EdStatus.Caption := 'Por Contabilizar';
           CmdGenera.Enabled := True;
         end
         else
         begin
           EdStatus.Caption := 'Ya Contabilizado';
           CmdGenera.Enabled := False;
         end;
         
        end;
end;

procedure TfrmComprobanteDiario.FormShow(Sender: TObject);
begin
        EdFecha.Date := Date;
end;

procedure TfrmComprobanteDiario.EdFechaEnter(Sender: TObject);
begin
        EdFechaChange(Sender);
end;

procedure TfrmComprobanteDiario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
       if Procesado then
        with IBQuery2 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          Sql.Clear;
          Sql.Add('drop table ' + Tabla);
          try
            ExecSQL;
          finally
            Close;
            Transaction.Commit;
          end;
        end;

        CanClose := True;

end;

procedure TfrmComprobanteDiario.cmdReporteClick(Sender: TObject);
var     Parametro :string;
        Sentencia : string;
begin
        Parametro := '';
        Sentencia := '';
        with IBAuxiliar do begin
         if not Transaction.InTransaction then
            Transaction.StartTransaction;
         Close;
         SQL.Clear;
         with CDconsecutivo do
         begin
           First;
           while not Eof do
           begin
             if (RecNo = RecordCount) and (RecNo = 1) then
                Parametro := '(' + FieldByName('consecutivo').AsString + ')'
             else  if RecNo = 1 then
                Parametro := '(' + FieldByName('consecutivo').AsString
                else if RecNo = RecordCount then
                   Parametro := Parametro + ',' + FieldByName('consecutivo').AsString + ')'
                   else
                      Parametro := Parametro + ',' +  FieldByName('consecutivo').AsString ;
             Next;
           end;
         end;
         Sentencia := 'select'+
                      '"con$auxiliar".ID_COMPROBANTE,' +
                      '"gen$agencia".DESCRIPCION_AGENCIA,' +
                      '"con$tipocomprobante".DESCRIPCION AS TIPO,' +
                      '"con$comprobante".FECHADIA,' +
                      '"con$comprobante".DESCRIPCION,' +
                      '"gen$empleado".PRIMER_APELLIDO,' +
                      '"gen$empleado".SEGUNDO_APELLIDO,' +
                      '"gen$empleado".NOMBRE,' +
                      '"con$auxiliar".CODIGO,' +
                      '"con$puc".NOMBRE AS CUENTA,' +
                      '"con$auxiliar".DEBITO,' +
                      '"con$auxiliar".CREDITO,' +
                      '"con$auxiliar".ID_PERSONA' +
                      ' from' +
                      '"con$comprobante"' +
                      'INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)' +
                      'INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE  = "con$tipocomprobante".ID ) ' +
                      'INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)' +
                      'LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)' +
                      'INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO) ' +
                      'where ("con$comprobante".ID_AGENCIA = ' + IntToStr(Agencia) + ') and' +
                      '           ("con$comprobante".ID_COMPROBANTE IN ' + Parametro + ' )' +
                      'Order By "con$comprobante".ID_COMPROBANTE,"con$auxiliar".CREDITO ASC, "con$auxiliar".CODIGO ASC';
          SQL.Add(Sentencia);
         {ParamByName('ID_AGENCIA').AsInteger := Agencia;
         CDconsecutivo.Filtered := False;
         ParamByName('ID1').AsInteger := CDconsecutivo.FieldByName('consecutivo').AsInteger;
         CDconsecutivo.Next;
         ParamByName('ID2').AsInteger := CDconsecutivo.FieldByName('consecutivo').AsInteger;
         CDconsecutivo.Next;
         ParamByName('ID3').AsInteger := CDconsecutivo.FieldByName('consecutivo').AsInteger;
         CDconsecutivo.Next;
         ParamByName('ID4').AsInteger := CDconsecutivo.FieldByName('consecutivo').AsInteger;}
         try
          Open;
          Report.Variables.ByName['EMPRESA'].AsString := Empresa;
          Report.Variables.ByName['NIT'].AsString := Nit;
          if Report.PrepareReport then
             Report.PreviewPreparedReport(True);
         except
         end;
        end;
end;

procedure TfrmComprobanteDiario.Sucursal;
var     Fecha_ini,Fecha_fin:TDateTime;
        vEntradas,vSalidas,Vcajas,vTotalDebito,vTotalCredito :Currency;
        vCodigo :string;
        Es_Sucursal :Boolean;
        id_cajaremota :Integer;
        vComision,vIva,vValorIva,vTotalIva,vTotalIngreso :Currency;
        vCodIngresos,vCodIva :string;
begin
        NohaySucursal := False;
        Es_Sucursal := False;
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('delete from ' + Tabla );
          Open;
        end;
        Fecha_ini := EdFecha.Date;
        Fecha_ini := EncodeDate(YearOf(Fecha_ini),MonthOf(Fecha_ini),DayOf(Fecha_ini));
        Fecha_fin := EdFecha.Date;
        Fecha_fin := EncodeDate(YearOf(Fecha_fin),MonthOf(Fecha_fin),DayOf(Fecha_fin));
        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$minimos".VALOR_MINIMO');
          SQL.Add('FROM');
          SQL.Add('"gen$minimos"');
          SQL.Add('WHERE');
          SQL.Add('("gen$minimos".ID_MINIMO = 22) ');
          ExecQuery;
          vIva := (FieldByName('VALOR_MINIMO').AsCurrency / 100) + 1;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('CODIGO,ID_CODIGO');
          SQL.Add('FROM');
          SQL.Add('"caj$codigospuc"');
          SQL.Add('WHERE');
          SQL.Add('("caj$codigospuc".ID_CODIGO < 3)');
          ExecQuery;
          while not Eof do
          begin
           if FieldByName('ID_CODIGO').AsInteger = 1 then
               vCodIva := FieldByName('CODIGO').AsString;
            if FieldByName('ID_CODIGO').AsInteger = 2 then
               vCodIngresos := FieldByName('CODIGO').AsString;
            Next;
          end;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM "caj$cajas" WHERE ID_CAJA = :ID_CAJA');
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ExecQuery;
          CodigoCaja := IBSQL1.FieldByName('CODIGO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
          SQL.Add('"caj$movremotosalida".ID_CAJA,');
          SQL.Add('"caj$movremotosalida".FECHA_MOV,');
          SQL.Add('"caj$movremotosalida".ID_TIPO_CAPTACION,');
          SQL.Add('"caj$movremotosalida".ORIGEN_MOVIMIENTO,');
          SQL.Add('"caj$movremotosalida".ID_TIPO_MOVIMIENTO,');
          SQL.Add('"caj$movremotosalida".BILLETES,');
          SQL.Add('"caj$movremotosalida".MONEDAS,');
          SQL.Add('"caj$movremotosalida".CHEQUES,');
          SQL.Add('"caj$movremotosalida".ID_AGENCIA_REMOTA,');
          SQL.Add('"caj$movremotosalida".ES_COMISION,');
          SQL.Add('"caj$movremotosalida".ID_PERSONA,');
          SQL.Add('"caj$movremotosalida".ID_IDENTIFICACION');
          SQL.Add('FROM');
          SQL.Add('"caj$movremotosalida"');
          SQL.Add('INNER JOIN "gen$agencia" ON ("caj$movremotosalida".ID_AGENCIA_REMOTA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('WHERE');
          SQL.Add('("caj$movremotosalida".ID_CAJA = :ID_CAJA) AND');
          SQL.Add('("caj$movremotosalida".FECHA_MOV BETWEEN :FECHA1 AND :FECHA2)');
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA1').AsDateTime := Fecha_ini + StrToTime('00:00:00');
          ParamByName('FECHA2').AsDateTime := Fecha_fin + StrToTime('23:59:59');
          ExecQuery;
          IBQuery1.SQL.Clear;
          IBQuery1.SQL.Add('insert into '+Tabla+' values(');
          IBQuery1.SQL.Add(':ID_AGENCIA,:AGENCIA,:ID_CAJA,:FECHA_MOV,:ORIGEN_MOVIMIENTO,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
          IBQuery1.SQL.Add(':NOMBRE,:DOCUMENTO,:ID_TIPO_MOVIMIENTO,');
          IBQuery1.SQL.Add(':EFECTIVO_DB,:CHEQUE_DB,:EFECTIVO_CR,:CHEQUE_CR)');
          while not Eof do
          begin
            if FieldByName('ES_COMISION').AsInteger = 0 then
            begin
              IBQuery1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA_REMOTA').AsInteger;
              IBQuery1.ParamByName('AGENCIA').AsString := FieldByName('DESCRIPCION_AGENCIA').AsString;
              IBQuery1.ParamByName('ID_CAJA').AsInteger := FieldByName('ID_CAJA').AsInteger;
              IBQuery1.ParamByName('FECHA_MOV').AsDateTime := FieldByName('FECHA_MOV').AsDateTime;
              IBQuery1.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := FieldByName('ORIGEN_MOVIMIENTO').AsInteger;
              IBQuery1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQuery1.ParamByName('NUMERO_CUENTA').Clear;
              IBQuery1.ParamByName('NOMBRE').Clear;
              IBQuery1.ParamByName('DOCUMENTO').Clear;
              IBQuery1.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
              if FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1 then
              begin
                 IBQuery1.ParamByName('EFECTIVO_DB').AsCurrency := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                 IBQuery1.ParamByName('CHEQUE_DB').AsCurrency := FieldByName('CHEQUES').AsCurrency;
                 IBQuery1.ParamByName('EFECTIVO_CR').AsCurrency := 0;
                 IBQuery1.ParamByName('CHEQUE_CR').AsCurrency := 0;
             end
             else
             begin
                 IBQuery1.ParamByName('EFECTIVO_CR').AsCurrency := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                 IBQuery1.ParamByName('CHEQUE_CR').AsCurrency := FieldByName('CHEQUES').AsCurrency;
                 IBQuery1.ParamByName('EFECTIVO_DB').AsCurrency := 0;
                 IBQuery1.ParamByName('CHEQUE_DB').AsCurrency := 0;
             end;
             IBQuery1.ExecSQL;
            end
            else
            begin
               CDcomision.Append;
               CDcomision.FieldValues['agencia'] := FieldByName('ID_AGENCIA_REMOTA').AsInteger;
               CDcomision.FieldValues['comision'] := FieldByName('BILLETES').AsCurrency;
               CDcomision.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
               CDcomision.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
               CDcomision.Post;
            end;
           Next;
          end;
        end;
        with IBSQL1 do
        begin
          IBQuery1.Close;
          Close;
          SQL.Clear;
          SQL.Add('select ID_AGENCIA,DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA <> :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          while not Eof do
          begin
            IBQuery2.Close;
            IBQuery2.SQL.Clear;
            IBQuery2.SQL.Add('SELECT');
            IBQuery2.SQL.Add('ID_ORIGEN,CODIGO,');
            IBQuery2.SQL.Add('SUM(EFECTIVO_DB+CHEQUE_DB) AS ENTRADA,');
            IBQuery2.SQL.Add('SUM(EFECTIVO_CR+CHEQUE_CR) AS SALIDA');
            IBQuery2.SQL.Add('FROM');
            IBQuery2.SQL.Add(Tabla);
            IBQuery2.SQL.Add('INNER JOIN "caj$origensucursal" ON ( ORIGEN_MOVIMIENTO = "caj$origensucursal".ID_ORIGEN and "caj$origensucursal".ID_AGENCIA = ' + '' + tabla + '' + '.'+ 'ID_AGENCIA' + ')');
            IBQuery2.SQL.Add('where ' + '' + tabla + '' + '.'+ 'ID_AGENCIA = :ID_AGENCIA');
            IBQuery2.SQL.Add('GROUP BY');
            IBQuery2.SQL.Add('ID_ORIGEN,CODIGO');
            IBQuery2.SQL.Add('ORDER BY');
            IBQuery2.SQL.Add('ID_ORIGEN');
            IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
            IBQuery2.Open;
            IBQuery2.Last;
            IBQuery2.First;
            vEntradas := 0;
            vSalidas :=  0;
            vCodigo := '';
            vCajas := 0;
            if IBQuery2.RecordCount <> 0 then// validacion para la generacion del comprobante
            begin
              Es_Sucursal := True;
              NohaySucursal := False;
              Consecutivo := ObtenerConsecutivo(IBSQL2);
              CDconsecutivo.Append;
              CDconsecutivo.FieldValues['consecutivo'] := Consecutivo;
              CDconsecutivo.FieldValues['id_consecutivo'] := CDconsecutivo.RecNo + 1;
              CDconsecutivo.Post;
              with IBSQL3 do
              begin
                Close;
                SQL.Clear;
                SQL.Add('INSERT INTO "con$comprobante" VALUES(');
                SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,:FECHADIA,');
                SQL.Add(':DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,:ESTADO,:IMPRESO,');
                SQL.Add(':ANULACION,:ID_EMPLEADO)');
                ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
                ParamByName('FECHADIA').AsDate := EdFecha.Date;
                ParamByName('DESCRIPCION').AsString := 'Contabilización de Movimientos de la Agencia  ' + IBSQL1.FieldByName('DESCRIPCION_AGENCIA').AsString + ', CAJA '+
                                                           EdCaja.Caption + ' '+ EdUsuario.Caption +
                                                           ' en la Fecha';
                ParamByName('TOTAL_DEBITO').AsCurrency := 0;
                ParamByName('TOTAL_CREDITO').AsCurrency := 0;
                ParamByName('ESTADO').AsString := 'O';
                ParamByName('IMPRESO').AsInteger := 0;
                ParamByName('ANULACION').Clear;
                ParamByName('ID_EMPLEADO').AsString := DBAlias;
                ExecQuery;
             end;

              while not IBQuery2.Eof do
              begin
                 vEntradas := IBQuery2.FieldByName('ENTRADA').AsCurrency;
                 vSalidas :=  IBQuery2.FieldByName('SALIDA').AsCurrency;
                 vCodigo := IBQuery2.FieldByName('CODIGO').AsString;
                 vCajas := vCajas + (vEntradas - vSalidas);
                 if vEntradas > 0 then
                 begin
                   IBSQLAux.Close;
                   IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                   IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                   IBSQLAux.ParamByName('CODIGO').AsString := vCodigo;
                   IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                   IBSQLAux.ParamByName('CREDITO').AsCurrency := vEntradas;
                   IBSQLAux.ParamByName('ID_CUENTA').Clear;
                   IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                   IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                   IBSQLAux.ParamByName('ID_PERSONA').Clear;
                   IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                   IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                   IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                   IBSQLAux.ExecQuery;
                 end;
                 if vSalidas > 0 then
                 begin
                   IBSQLAux.Close;
                   IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                   IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                   IBSQLAux.ParamByName('CODIGO').AsString := vCodigo;
                   IBSQLAux.ParamByName('DEBITO').AsCurrency := vsalidas;
                   IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                   IBSQLAux.ParamByName('ID_CUENTA').Clear;
                   IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                   IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                   IBSQLAux.ParamByName('ID_PERSONA').Clear;
                   IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                   IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                   IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                   IBSQLAux.ExecQuery;
                 end;
                 IBQuery2.Next;
            end;
            if vCajas <> 0 then begin
            IBSQLAux.Close;
            IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
            IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
            IBSQLAux.ParamByName('CODIGO').AsString := CodigoCaja;
            if vCajas > 0 then
            begin
               IBSQLAux.ParamByName('DEBITO').AsCurrency := vCajas;
               IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
            end
            else
            begin
               IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
               IBSQLAux.ParamByName('CREDITO').AsCurrency := -vCajas;
            end;
               IBSQLAux.ParamByName('ID_CUENTA').Clear;
               IBSQLAux.ParamByName('ID_COLOCACION').Clear;
               IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;                       IBSQLAux.ParamByName('ID_PERSONA').Clear;
               IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
               IBSQLAux.ParamByName('TASA_RETENCION').Clear;
               IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
               IBSQLAux.ExecQuery;
               IBSQLAux.Transaction.CommitRetaining;
          end;
        //** comienzo de la validacion del ingreso e iva
        //**calculo de la comision
        vTotalIva := 0;
        vTotalIngreso := 0;
        vComision := 0;
        vValorIva := 0;
        CDcomision.First;
        CDcomision.Filtered := False;
        CDcomision.Filter := 'agencia = ' + FieldByName('ID_AGENCIA').AsString;
        CDcomision.Filtered := True;
        if CDcomision.RecordCount > 0 then
        begin
          while not CDcomision.Eof do
          begin
            vComision := CDcomision.FieldByName('comision').AsCurrency;
            vValorIva := vComision  - SimpleRoundTo((vComision / vIva),0);
            vTotalIva := vTotalIva + vValorIva;
            vTotalIngreso := vTotalIngreso + vComision;
            //iva
            IBSQLAux.Close;
            IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
            IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
            IBSQLAux.ParamByName('CODIGO').AsString := vCodIva;
            IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
            IBSQLAux.ParamByName('CREDITO').AsCurrency := vValorIva;
            IBSQLAux.ParamByName('ID_CUENTA').Clear;
            IBSQLAux.ParamByName('ID_COLOCACION').Clear;
            IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := CDcomision.FieldByName('id_identificacion').AsInteger;
            IBSQLAux.ParamByName('ID_PERSONA').AsString := CDcomision.FieldByName('id_persona').AsString;
            IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := vComision - vValorIva;
            IBSQLAux.ParamByName('TASA_RETENCION').Clear;
            IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
            IBSQLAux.ExecQuery;
            CDcomision.Next;
          end;
          //ingresos
          IBSQLAux.Close;
          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
          IBSQLAux.ParamByName('CODIGO').AsString := vCodIngresos;
          IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
          IBSQLAux.ParamByName('CREDITO').AsCurrency := vTotalIngreso - vTotalIva;
          IBSQLAux.ParamByName('ID_CUENTA').Clear;
          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
          IBSQLAux.ParamByName('ID_PERSONA').Clear;
          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
          IBSQLAux.ExecQuery;
          //movimiento
          IBSQLAux.Close;
          IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
          IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
          IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
          IBSQLAux.ParamByName('CODIGO').AsString := vCodigo;
          IBSQLAux.ParamByName('DEBITO').AsCurrency := vTotalIngreso;
          IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
          IBSQLAux.ParamByName('ID_CUENTA').Clear;
          IBSQLAux.ParamByName('ID_COLOCACION').Clear;
          IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
          IBSQLAux.ParamByName('ID_PERSONA').Clear;
          IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
          IBSQLAux.ParamByName('TASA_RETENCION').Clear;
          IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
          IBSQLAux.ExecQuery;
       end;
        //** fin ingreso e iva

          //ACTUALIZACION DEL COMPROBANMTE
        with IBSQL3 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT SUM(DEBITO) AS DEBITO,SUM(CREDITO) AS  CREDITO FROM "con$auxiliar"');
          SQL.Add('WHERE ID_AGENCIA = :AGENCIA and ID_COMPROBANTE = :COMPROBANTE');
          ParamByName('AGENCIA').AsInteger := Agencia;
          ParamByName('COMPROBANTE').AsInteger := Consecutivo;
          ExecQuery;
          vTotalDebito := FieldByName('DEBITO').AsCurrency;
          vTotalCredito := FieldByName('CREDITO').AsCurrency;
          Close;
          SQL.Clear;
          SQL.Add('UPDATE "con$comprobante" SET TOTAL_DEBITO = :DEBITO, TOTAL_CREDITO = :CREDITO,');
          SQL.Add('IMPRESO = 1 WHERE ID_AGENCIA = :ID_AGENCIA and ID_COMPROBANTE = :ID_COMPROBANTE');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
          ParamByName('DEBITO').AsCurrency := vTotalDebito;
          ParamByName('CREDITO').AsCurrency := vTotalCredito;
          ExecQuery;
        end;
        end;// fin del valida si la agencia tiene movimientos
            Next;
          end;
        end;
//** inicio comprobante sucursal de las agencias
      if Agencia <> 25 then
      begin
        with IBSQL1 do
        begin
          if Es_Sucursal = False then
          begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT');
             SQL.Add('"caj$movremotoentrada".NUMERO_CUENTA');
             SQL.Add('FROM');
             SQL.Add('"caj$movremotoentrada"');
             SQL.Add('WHERE');
             SQL.Add('("caj$movremotoentrada".FECHA_MOV BETWEEN :FECHA1 AND :FECHA2)');
             ParamByName('FECHA1').AsDateTime := Fecha_ini + StrToTime('00:00:00');
             ParamByName('FECHA2').AsDateTime := Fecha_fin + StrToTime('23:59:59');
             ExecQuery;
             if RecordCount <> 0 then
                Es_Sucursal := True;
          end;
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 18');
          ExecQuery;
          id_cajaremota := FieldByName('VALOR_MINIMO').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('select * from "caj$cierresucursal" where ID_CAJA = :ID_CAJA and FECHA = :FECHA');
          ParamByName('ID_CAJA').AsInteger := id_cajaremota;
          ParamByName('FECHA').AsDate := EdFecha.DateTime;
          ExecQuery;
          if RecordCount = 0 then
          begin
            try
              Close;
              SQL.Clear;
              SQL.Add('insert into "caj$cierresucursal" values (:ID_CAJA,:FECHA,:CONTABILIZADO,:ES_MOVIMIENTO)');
              ParamByName('ID_CAJA').AsInteger := id_cajaremota;
              ParamByName('FECHA').AsDate := EdFecha.DateTime;
              ParamByName('CONTABILIZADO').AsInteger := 0;
              ParamByName('ES_MOVIMIENTO').AsInteger := BoolToInt(Es_Sucursal);
              ExecQuery;
            except
              Close;
            end;
          end;
        end;
      end;
//* fin validación de comprobante sucursal para las agencias


end;
procedure TfrmComprobanteDiario.FormCreate(Sender: TObject);
begin
        if IBSQL1.Transaction.InTransaction then
           IBSQL1.Transaction.Rollback;
        IBSQL1.Transaction.StartTransaction;
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT VALOR_MINIMO FROM "gen$minimos" WHERE ID_MINIMO = 51');
          try
           ExecQuery;
           edSobrante.MaxValue := FieldByName('VALOR_MINIMO').AsCurrency;
          except
           edSobrante.MaxValue := 5000;
          end;
        end;
        IBSQL1.Transaction.Commit;
end;

end.
