unit UnitCausacionCdatAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IBQuery, IBStoredProc, IB, DBClient, IBDatabase, IBCustomDataSet, IBSQL, DB,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmCausacionCdatAuto = class(TForm)
    progreso: TProgressBar;
    IBComprobante: TIBQuery;
    IBComprobanteID_COMPROBANTE: TIntegerField;
    IBComprobanteDESCRIPCION_AGENCIA: TIBStringField;
    IBComprobanteTIPO: TIBStringField;
    IBComprobanteFECHADIA: TDateField;
    IBComprobanteDESCRIPCION: TMemoField;
    IBComprobantePRIMER_APELLIDO: TIBStringField;
    IBComprobanteSEGUNDO_APELLIDO: TIBStringField;
    IBComprobanteNOMBRE: TIBStringField;
    IBComprobanteCODIGO: TIBStringField;
    IBComprobanteCUENTA: TIBStringField;
    IBComprobanteDEBITO: TIBBCDField;
    IBComprobanteCREDITO: TIBBCDField;
    edCaptacion: TEdit;
    edEstado: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ProcesarCausacion;
    procedure Aplicar;
  public
    { Public declarations }
  end;

type
  PList = ^AList;
  AList = record
    codigo   : string;
    nomcuenta: string;
    debito   : currency;
    credito  : currency;
    nocuenta : integer;
    nocredito: string;
    tipoide  : integer;
    idpersona: string;
    monto    : currency;
    tasa     : single;
    estado   : string;
  end;  

var
  frmCausacionCdatAuto: TfrmCausacionCdatAuto;
  _queryCaptacion, _queryRetefuente, _queryDiasLiquidados, _query : TIBQuery;
  _queryALiquidar: TIBQuery;
  _queryProcedure : TIBStoredProc;
  _transaction: TIBTransaction;
  _fechaProceso: TDate;
  _tipo: Integer;

  Tabla:string;
  Codigo_Captacion:string;
  Codigo_Captacion2:string;
  Codigo_Captacion3:string;
  Codigo_Captacion4:string;
  TotalCapta2:Currency;
  TotalCapta3:Currency;
  TotalCapta4:Currency;
  TotalCapta2R:Currency;
  TotalCapta3R:Currency;
  TotalCapta4R:Currency;
  TotalCapta2RMes:Currency;
  TotalCapta3RMes:Currency;
  TotalCapta4RMes:Currency;
  Comprobante :Integer;
  aporte,ahorro,certificado,programado:Boolean;
  interes, TasaN: Double;
  SaldoMinimo: Currency;

  DiarioR: Currency;
  TasaR: Extended;
  MinCaptacion,MaxCaptacion:Integer;
  Ag,Numero,Digito:Integer;

  cada: Integer;

  FechaCorte:TDate;
  vNocomprobanteCausacion : string;
  vNocomprobanteAjuste: string;
  TpMenos6m:Currency;
  Tp6y12m:Currency;
  Tp12y18m:Currency;
  Tp18m:Currency;
  Lista:TList;
  ValorRetencionAcum:Currency;
  RetefuenteAcum:Currency;
  DiarioRet:Currency;
  TasaRet:Double;
implementation

uses UnitdmGeneral, UnitGlobales, UnitGlobalesCol, Math, DateUtils;

{$R *.dfm}

procedure TfrmCausacionCdatAuto.FormCreate(Sender: TObject);
begin
        _query := TIBQuery.Create(self);
        _queryCaptacion := TIBQuery.Create(self);
        _queryRetefuente := TIBQuery.Create(self);
        _queryDiasLiquidados := TIBQuery.Create(self);
        _queryALiquidar := TIBQuery.Create(self);
        _queryProcedure := TIBStoredProc.Create(self);
        _transaction := TIBTransaction.Create(self);

        _transaction.DefaultDatabase := dmGeneral.IBDatabase1;

        _query.Database := dmGeneral.IBDatabase1;
        _queryCaptacion.Database := dmGeneral.IBDatabase1;
        _queryRetefuente.Database := dmGeneral.IBDatabase1;
        _queryDiasLiquidados.Database := dmGeneral.IBDatabase1;
        _queryALiquidar.Database := dmGeneral.IBDatabase1;
        _queryProcedure.Database := dmGeneral.IBDatabase1;

        _query.Transaction := _transaction;
        _queryCaptacion.Transaction := _transaction;
        _queryRetefuente.Transaction := _transaction;
        _queryALiquidar.Transaction := _transaction;
        _queryDiasLiquidados.Transaction := _transaction;
        _queryProcedure.Transaction := _transaction;

        IBComprobante.Transaction := _transaction;
        //IBDAuxiliar.Transaction := _transaction;
        //IBPagar.Transaction := _transaction;
        Lista := TList.Create;
end;

procedure TfrmCausacionCdatAuto.ProcesarCausacion;
var MinCaptacion,MaxCaptacion:Integer;
    Numero,Digito:Integer;
    Valor:Currency;
    TipoI:string;
    TasaN:Double;
    TasaE:Double;
    UltimoPago:TDate;
    Puntos:Double;
    Moda:string;
    Amor:Integer;
    Dias:Integer;
    ValorIntereses:Currency;
    PromedioDiarioI:Currency;
    PromedioMensualI:Currency;
    RetefuenteTotal:Currency;
    InteresMensual:Currency;
    Retefuente:Currency;
    NetoCausar:Currency;
begin

        _transaction.StartTransaction;

        FechaCorte := _fechaProceso;
        RetefuenteAcum := 0;
        progreso.Min := 0;
        progreso.Max := 100;
        progreso.Position := 0;
        Application.ProcessMessages;

        with _query do
         begin
          Close;
          SQL.Clear;
          SQL.Add('delete from "cap$causacioncdattmp"');
          ExecSQL;
          Close;

          SQL.Clear;
          SQL.Add('select DIARIO_RETEFUENTE, TASA_RETEFUENTE from "gen$valorretefuente"');
          SQL.Add('where ID_RETEFUENTE = 1');
          Open;
          DiarioRet := FieldByName('DIARIO_RETEFUENTE').AsCurrency;
          TasaRet := FieldByName('TASA_RETEFUENTE').AsFloat;
          TasaRet := TasaNominalVencida(TasaRet,30) / 100;
          Close;
         end;

        with _query do
         begin
           Close;
           sql.Clear;
           SQL.Add('SELECT *');
           SQL.Add('FROM P_CAP_0013 (:ID,:ID_ESTADO)');
           ParamByName('ID').AsInteger := 6;
           ParamByName('ID_ESTADO').AsInteger := 1;
           Open;

           while not _query.Eof do
            begin
              with _queryALiquidar do
               begin
                 Application.ProcessMessages;
                 Close;
                 sql.Clear;
                 sql.Add('insert into  "cap$causacioncdattmp"');
                 SQL.Add('(ID_AGENCIA, ID_TIPO_CAPTACION, NUMERO_CUENTA, DIGITO_CUENTA, VALOR_INICIAL,');
                 SQL.Add('FECHA_APERTURA, PLAZO_CUENTA, TIPO_INTERES, ID_INTERES, TASA_EFECTIVA, PUNTOS_ADICIONALES,');
                 SQL.Add('MODALIDAD, AMORTIZACION, ID_ESTADO, FECHA_VENCIMIENTO, FECHA_ULTIMO_PAGO, FECHA_PROXIMO_PAGO, FECHA_PRORROGA,');
                 SQL.Add('ID_TIPO_CAPTACION_ABONO, NUMERO_CUENTA_ABONO, ID_IDENTIFICACION, ID_PERSONA, PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE, DIAS,');
                 SQL.Add('TASA_E, CAUSACION_TOTAL, RETEFUENTE_TOTAL, NETO_TOTAL, CAUSACION_MENSUAL, RETEFUENTE_MENSUAL, NETO_MENSUAL, RETEFUENTE) values (');
                 sql.Add(':"ID_AGENCIA", :"ID_TIPO_CAPTACION", :"NUMERO_CUENTA", :"DIGITO_CUENTA",');
                 sql.Add(':"VALOR_INICIAL", :"FECHA_APERTURA", :"PLAZO_CUENTA", :"TIPO_INTERES",');
                 sql.Add(':"ID_INTERES", :"TASA_EFECTIVA", :"PUNTOS_ADICIONALES", :"MODALIDAD",');
                 sql.Add(':"AMORTIZACION", :"ID_ESTADO", :"FECHA_VENCIMIENTO", :"FECHA_ULTIMO_PAGO",');
                 sql.Add(':"FECHA_PROXIMO_PAGO", :"FECHA_PRORROGA", :"ID_TIPO_CAPTACION_ABONO",');
                 SQL.Add(':"NUMERO_CUENTA_ABONO", :"ID_IDENTIFICACION", :"ID_PERSONA", :"PRIMER_APELLIDO",');
                 SQL.Add(':"SEGUNDO_APELLIDO", :"NOMBRE", :"DIAS", :"TASA_E", :"CAUSACION_TOTAL", :"RETEFUENTE_TOTAL",');
                 SQL.Add(':"NETO_TOTAL", :"CAUSACION_MENSUAL", :"RETEFUENTE_MENSUAL", :"NETO_MENSUAL", :"RETEFUENTE")');
                 ParamByName('ID_AGENCIA').AsInteger := _query.FieldByName('ID_AGENCIA').AsInteger;
                 ParamByName('ID_TIPO_CAPTACION').AsInteger := _query.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 ParamByName('NUMERO_CUENTA').AsInteger := _query.FieldByName('NUMERO_CUENTA').AsInteger;
                 ParamByName('DIGITO_CUENTA').AsInteger := _query.FieldByName('DIGITO_CUENTA').AsInteger;
                 ParamByName('VALOR_INICIAL').AsCurrency := _query.FieldByName('VALOR_INICIAL').AsCurrency;
                 ParamByName('FECHA_APERTURA').AsDate := _query.FieldByName('FECHA_APERTURA').AsDateTime;
                 ParamByName('PLAZO_CUENTA').AsInteger := _query.FieldByName('PLAZO_CUENTA').AsInteger;
                 ParamByName('TIPO_INTERES').AsString := _query.FieldByName('TIPO_INTERES').AsString;
                 ParamByName('ID_INTERES').AsInteger := _query.FieldByName('ID_INTERES').AsInteger;
                 ParamByName('TASA_EFECTIVA').AsFloat := _query.FieldByName('TASA_EFECTIVA').AsFloat;
                 ParamByName('PUNTOS_ADICIONALES').AsFloat := _query.FieldByName('PUNTOS_ADICIONALES').AsFloat;
                 ParamByName('MODALIDAD').AsString := _query.FIELDBYNAME('MODALIDAD').AsString;
                 ParamByName('AMORTIZACION').AsInteger := _query.FieldByName('AMORTIZACION').AsInteger;
                 ParamByName('ID_ESTADO').AsInteger := 1;
                 ParamByName('FECHA_VENCIMIENTO').AsDate := _query.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                 ParamByName('FECHA_ULTIMO_PAGO').AsDate := _query.FieldByName('FECHA_ULTIMO_PAGO').AsDateTime;
                 ParamByName('FECHA_PROXIMO_PAGO').AsDate := _query.FieldByName('FECHA_PROXIMO_PAGO').AsDateTime;
                 ParamByName('FECHA_PRORROGA').AsDate := _query.FieldByName('FECHA_PRORROGA').AsDateTime;
                 ParamByName('ID_TIPO_CAPTACION_ABONO').AsInteger := _query.FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                 ParamByName('NUMERO_CUENTA_ABONO').AsInteger := _query.FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
                 ParamByName('ID_IDENTIFICACION').AsInteger := _query.FieldByName('ID_IDENTIFICACION').AsInteger;
                 ParamByName('ID_PERSONA').AsString := _query.FieldByName('ID_PERSONA').AsString;
                 ParamByName('PRIMER_APELLIDO').AsString := _query.FieldByName('PRIMER_APELLIDO').AsString;
                 ParamByName('SEGUNDO_APELLIDO').AsString := _query.FieldByName('SEGUNDO_APELLIDO').AsString;
                 ParamByName('NOMBRE').AsString := _query.FieldByName('NOMBRE').AsString;
                 ParamByName('DIAS').AsInteger := 0;
                 parambyname('TASA_E').AsCurrency := 0;
                 ParamByName('CAUSACION_TOTAL').AsCurrency := 0;
                 ParamByName('RETEFUENTE_TOTAL').AsCurrency := 0;
                 ParamByName('NETO_TOTAL').AsCurrency := 0;
                 ParamByName('CAUSACION_MENSUAL').AsCurrency := 0;
                 ParamByName('RETEFUENTE_MENSUAL').AsCurrency := 0;
                 ParamByName('NETO_MENSUAL').AsCurrency := 0;
                 ParamByName('RETEFUENTE').AsInteger := _query.FieldByName('RETEFUENTE').AsInteger;
                 ExecSQL;
               end;
              Next;
             end;
            _query.Close;
            _queryALiquidar.Close;
         end;


//**
          Application.ProcessMessages;


          with _queryProcedure do
          begin
              StoredProcName := 'P_CAP_0014';
              ParamByName('ID').AsInteger := 6;
              ParamByName('FECHA').AsDate := FechaCorte;
              try
                 Application.ProcessMessages;
                 Prepare;
                 ExecProc;
              except
                 _transaction.Commit;
                 PostMessage(Handle, WM_CLOSE, 0, 0);
                 modalresult := mrCancel;
              end;
              MaxCaptacion := ParamByName('TOTAL').AsInteger;
              progreso.Max := MaxCaptacion;
              if MaxCaptacion = 0 then
              begin
                _transaction.Rollback;
                PostMessage(Handle, WM_CLOSE, 0, 0);
                modalresult := mrCancel;
              end;
              Close;
          end;

          Application.ProcessMessages;

        with _query do
        begin
            SQL.Clear;
            SQL.Add('select * from P_CAP_0015');
              try
                 Application.ProcessMessages;
                 Open;
              except
                _transaction.Rollback;
                PostMessage(Handle, WM_CLOSE, 0, 0);
                modalresult := mrCancel;
              end;

              while not Eof do
              begin
                Application.ProcessMessages;
                edCaptacion.Text := 'Liquidando CDAT:' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                Numero := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                progreso.Position := RecNo;
                Valor := FieldByName('VALOR_INICIAL').AsCurrency;
                if FieldByName('FECHA_ULTIMO_PAGO').AsDateTime = 0 THEN
                   UltimoPago := FieldByName('FECHA_PRORROGA').AsDateTime
                else
                   UltimoPago := FieldByName('FECHA_ULTIMO_PAGO').AsDateTime;
                TipoI := FieldByName('TIPO_INTERES').AsString;
                TasaE := FieldByName('TASA_EFECTIVA').AsFloat;
                Puntos := FieldByName('PUNTOS_ADICIONALES').AsFloat;
                Moda := FieldByName('MODALIDAD').AsString;
                Amor := FieldByName('AMORTIZACION').AsInteger;
// Evaluar Fecha Ultimo Pago
                if UltimoPago < FieldByName('FECHA_APERTURA').AsDateTime then
                   UltimoPago := FieldByName('FECHA_APERTURA').AsDateTime;
                if UltimoPago < FieldByName('FECHA_PRORROGA').AsDateTime then
                   UltimoPago := FieldByName('FECHA_PRORROGA').AsDateTime;
                if DayOf(UltimoPago) > 30 then
                   UltimoPago := EncodeDate(YearOf(UltimoPago),MonthOf(UltimoPago),DayOf(EndOfAMonth(YearOf(UltimoPago),MonthOf(UltimoPago))));
                Dias := DiasEntre(UltimoPago,FechaCorte);


// Evaluar la tasa a liquidar
                if Moda = 'A' then
                   TasaN := TasaNominalAnticipada(TasaE,Amor)
                else
                   TasaN := TasaNominalVencida(TasaE,Amor);

                if Puntos < 0 then Puntos := 0;

                TasaN := TasaN + Puntos;

                try
                  ValorIntereses := SimpleRoundTo((Valor * TasaN / 100 * Dias ) / 360,0);
                  if ValorIntereses >= 1100 then
                    RetefuenteAcum := SimpleRoundTo(RetefuenteAcum + (ValorIntereses * TasaRet),0);
                  if Dias = 0 then
                     PromedioDiarioI := SimpleRoundTo((ValorIntereses / (Dias + 1)),0)
                  else
                     PromedioDiarioI := SimpleRoundTo((ValorIntereses / Dias),0);
                  if Dias > 30 then
                    InteresMensual := SimpleRoundTo((ValorIntereses / Dias) * 30,0)
                  else
                    InteresMensual := ValorIntereses;
                  if PromedioDiarioI >= DiarioRet then begin
                    Retefuente := SimpleRoundTo((InteresMensual * TasaRet),0);
                    RetefuenteTotal := SimpleRoundTo((ValorIntereses * TasaRet),0);
                  end
                  else begin
                    Retefuente := 0;
                    RetefuenteTotal := 0;
                  end;
                  with _queryALiquidar do
                   begin
                     Close;
                     SQL.Clear;
                     SQL.Add('update "cap$causacioncdattmp" set DIAS = :DIAS, CAUSACION_TOTAL =:"CAUSACION_TOTAL", RETEFUENTE_TOTAL =:"RETEFUENTE_TOTAL", NETO_TOTAL =:"NETO_TOTAL",');
                     SQL.Add('CAUSACION_MENSUAL =:"CAUSACION_MENSUAL", RETEFUENTE_MENSUAL =:"RETEFUENTE_MENSUAL", NETO_MENSUAL =:"NETO_MENSUAL",');
                     SQL.Add('FECHA_ULTIMO_PAGO = :FECHA_ULTIMO_PAGO, TASA_E = :TASA_E');
                     SQL.Add('where ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                     SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                     ParamByName('ID_TIPO_CAPTACION').AsInteger := 6;
                     ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                     parambyname('DIAS').AsInteger := Dias;
                     parambyname('CAUSACION_TOTAL').AsCurrency := ValorIntereses;
                     if _query.FieldByName('RETEFUENTE').AsInteger = 1 then begin
                       ParamByName('RETEFUENTE_TOTAL').AsCurrency := RetefuenteTotal;
                       ParamByName('NETO_TOTAL').AsCurrency := ValorIntereses - RetefuenteTotal;
                       ParamByName('CAUSACION_MENSUAL').AsCurrency := InteresMensual;
                       ParamByName('RETEFUENTE_MENSUAL').AsCurrency := Retefuente;
                       ParamByName('NETO_MENSUAL').AsCurrency := InteresMensual - Retefuente;
                     end
                     else begin
                       ParamByName('RETEFUENTE_TOTAL').AsCurrency := 0;
                       ParamByName('NETO_TOTAL').AsCurrency := ValorIntereses;
                       ParamByName('CAUSACION_MENSUAL').AsCurrency := InteresMensual;
                       ParamByName('RETEFUENTE_MENSUAL').AsCurrency := 0;
                       ParamByName('NETO_MENSUAL').AsCurrency := InteresMensual;
                     end;
                     ParamByName('FECHA_ULTIMO_PAGO').AsDate := UltimoPago;
                     ParamByName('TASA_E').AsCurrency := SimpleRoundTo(TasaE);
                     ExecSQL;
                     Close;
                   end;
                except
                   _transaction.Rollback;
                   PostMessage(Handle, WM_CLOSE, 0, 0);
                   modalresult := mrCancel;
                end;
                Next;
              end;
          Close;
        end;
          _queryALiquidar.Close;
          _query.Close;

        Aplicar;
        _transaction.Commit;
        PostMessage(Handle, WM_CLOSE, 0, 0);
        modalresult := mrCancel;
end;

procedure TfrmCausacionCdatAuto.Aplicar;
var vMenos6m,v6y12m,v12y18m,v18m:Currency;
    AR:PList;
MesCorte : string;
CodigoGasto : string;
CodigoInteres : string;
CodigoRetencion :string;
SaldoInicialInteres : Currency;
MovimientoInteres : Currency;
TotalInteres : Currency;
ValorNetoCausar : Currency;
ValorACausar : Currency;
ValorRetefuente: Currency;
ValorAjusteDeb,ValorAjusteCre : Currency;
I:Integer;
    _queryConsulta : TIBQuery;
    _ibsql1 : TIBSQL;
    _transactionConsulta, _transactionComprobante : TIBTransaction;
begin

        _queryConsulta := TIBQuery.Create(self);
        _ibsql1 := TIBSQL.Create(self);
        _transactionConsulta := TIBTransaction.Create(self);
        _transactionComprobante := TIBTransaction.Create(self);

        _queryConsulta.Database := dmGeneral.IBDatabase1;
        _transactionConsulta.DefaultDatabase := dmGeneral.IBDatabase1;
        _transactionComprobante.DefaultDatabase := dmGeneral.IBDatabase1;

        _queryConsulta.Transaction := _transactionConsulta;
        _ibsql1.Transaction := _transactionComprobante;

    with _query do
     begin
       Close;
       SQL.Clear;
       SQL.Add('select * from "cap$causacioncdattmp"');
       Open;
       while not Eof do
        begin
          with _queryALiquidar do
           begin
             Close;
             SQL.Clear;
             SQL.Add('insert into "cap$causacioncdat" values(');
             SQL.Add(':"ID_AGENCIA",');
             SQL.Add(':"ID_TIPO_CAPTACION",');
             SQL.Add(':"NUMERO_CUENTA",');
             SQL.Add(':"DIGITO_CUENTA",');
             SQL.Add(':"VALOR_INICIAL",');
             SQL.Add(':"FECHA_APERTURA",');
             SQL.Add(':"PLAZO_CUENTA",');
             SQL.Add(':"TIPO_INTERES",');
             SQL.Add(':"ID_INTERES",');
             SQL.Add(':"TASA_EFECTIVA",');
             SQL.Add(':"PUNTOS_ADICIONALES",');
             SQL.Add(':"MODALIDAD",');
             SQL.Add(':"AMORTIZACION",');
             SQL.Add(':"ID_ESTADO",');
             SQL.Add(':"FECHA_VENCIMIENTO",');
             SQL.Add(':"FECHA_ULTIMO_PAGO",');
             SQL.Add(':"FECHA_PROXIMO_PAGO",');
             SQL.Add(':"FECHA_PRORROGA",');
             SQL.Add(':"ID_TIPO_CAPTACION_ABONO",');
             SQL.Add(':"NUMERO_CUENTA_ABONO",');
             SQL.Add(':"ID_IDENTIFICACION",');
             SQL.Add(':"ID_PERSONA",');
             SQL.Add(':"PRIMER_APELLIDO",');
             SQL.Add(':"SEGUNDO_APELLIDO",');
             SQL.Add(':"NOMBRE",');
             SQL.Add(':"DIAS",');
             SQL.Add(':"ANO",');
             SQL.Add(':"MES",');
             SQL.Add(':"TASA_E",');
             SQL.Add(':"CAUSACION_TOTAL",');
             SQL.Add(':"RETEFUENTE_TOTAL",');
             SQL.Add(':"NETO_TOTAL",');
             SQL.Add(':"CAUSACION_MENSUAL",');
             SQL.Add(':"RETEFUENTE_MENSUAL",');
             SQL.Add(':"NETO_MENSUAL");');
             ParamByName('ID_AGENCIA').AsInteger := _query.FieldByName('ID_AGENCIA').AsInteger;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := _query.FieldByName('ID_TIPO_CAPTACION').AsInteger;
             ParamByName('NUMERO_CUENTA').AsInteger := _query.FieldByName('NUMERO_CUENTA').AsInteger;
             ParamByName('DIGITO_CUENTA').AsInteger := _query.FieldByName('DIGITO_CUENTA').AsInteger;
             ParamByName('VALOR_INICIAL').AsCurrency := _query.FieldByName('VALOR_INICIAL').AsCurrency;
             ParamByName('FECHA_APERTURA').AsDate := _query.FieldByName('FECHA_APERTURA').AsDateTime;
             ParamByName('PLAZO_CUENTA').AsInteger := _query.FieldByName('PLAZO_CUENTA').AsInteger;
             ParamByName('TIPO_INTERES').AsString := _query.FieldByName('TIPO_INTERES').AsString;
             ParamByName('ID_INTERES').AsInteger := _query.FieldByName('ID_INTERES').AsInteger;
             ParamByName('TASA_EFECTIVA').AsFloat := _query.FieldByName('TASA_EFECTIVA').AsFloat;
             ParamByName('PUNTOS_ADICIONALES').AsFloat := _query.FieldByName('PUNTOS_ADICIONALES').AsFloat;
             ParamByName('MODALIDAD').AsString := _query.FieldByName('MODALIDAD').AsString;
             ParamByName('AMORTIZACION').AsInteger := _query.FieldByName('AMORTIZACION').AsInteger;
             ParamByName('ID_ESTADO').AsInteger := _query.FieldByName('ID_ESTADO').AsInteger;
             ParamByName('FECHA_VENCIMIENTO').AsDate := _query.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
             ParamByName('FECHA_ULTIMO_PAGO').AsDate := _query.FieldByName('FECHA_ULTIMO_PAGO').AsDateTime;
             ParamByName('FECHA_PROXIMO_PAGO').AsDate := _query.FieldByName('FECHA_PROXIMO_PAGO').AsDateTime;
             ParamByName('FECHA_PRORROGA').AsDate := _query.FieldByName('FECHA_PRORROGA').AsDateTime;
             ParamByName('ID_TIPO_CAPTACION_ABONO').AsInteger := _query.FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
             ParamByName('NUMERO_CUENTA_ABONO').AsInteger := _query.FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
             ParamByName('ID_IDENTIFICACION').AsInteger := _query.FieldByName('ID_IDENTIFICACION').AsInteger;
             ParamByName('ID_PERSONA').AsString := _query.FieldByName('ID_PERSONA').AsString;
             ParamByName('PRIMER_APELLIDO').AsString := _query.FieldByName('PRIMER_APELLIDO').AsString;
             ParamByName('SEGUNDO_APELLIDO').AsString := _query.FieldByName('SEGUNDO_APELLIDO').AsString;
             ParamByName('NOMBRE').AsString := _query.FieldByName('NOMBRE').AsString;
             ParamByName('DIAS').AsInteger := _query.FieldByName('DIAS').AsInteger;
             ParamByName('ANO').AsInteger := YearOf(FechaCorte);
             ParamByName('MES').AsInteger := monthof(FechaCorte);
             ParamByName('TASA_E').AsCurrency := _query.FieldByName('TASA_E').AsCurrency;
             ParamByName('CAUSACION_TOTAL').AsCurrency := _query.FieldByName('CAUSACION_TOTAL').AsCurrency;
             ParamByName('RETEFUENTE_TOTAL').AsCurrency := _query.FieldByName('RETEFUENTE_TOTAL').AsCurrency;
             ParamByName('NETO_TOTAL').AsCurrency := _query.FieldByName('NETO_TOTAL').AsCurrency;
             ParamByName('CAUSACION_MENSUAL').AsCurrency := _query.FieldByName('CAUSACION_MENSUAL').AsCurrency;
             ParamByName('RETEFUENTE_MENSUAL').AsCurrency := _query.FieldByName('RETEFUENTE_MENSUAL').AsCurrency;
             ParamByName('NETO_MENSUAL').AsCurrency := _query.FieldByName('NETO_MENSUAL').AsCurrency;
             try
               ExecSQL;
             except
               edEstado.Text := 'Error Insertando en Tabla';
             end;
           end; //fin de with IBAplicar
           Next;
        end;  // fin de while
        Close;

    end; // fin de with IBSeleccionar

    MesCorte := FormatCurr('00',monthof(FechaCorte));
    with _query do
     begin
       Close;
       SQL.Clear;
       SQL.Add('select CODIGO_PUC from CAP$CODIGOSCAUSACION');
       SQL.Add('where ES_GASTO = 1');
       Open;
       CodigoGasto := FieldByName('CODIGO_PUC').AsString;
       Close;

       SQL.Clear;
       SQL.Add('select CODIGO_PUC from CAP$CODIGOSCAUSACION');
       SQL.Add('where ES_INTERESES = 1');
       Open;
       CodigoInteres := FieldByName('CODIGO_PUC').AsString;
       Close;

       SQL.Clear;
       SQL.Add('select CODIGO_PUC from CAP$CODIGOSCAUSACION');
       SQL.Add('where ES_RETEFUENTE = 1');
       Open;
       CodigoRetencion := FieldByName('CODIGO_PUC').AsString;
       Close;

       SQL.Clear;
       SQL.Add('select sum(CAUSACION_MENSUAL) as CAUSACION from "cap$causacioncdat"');
       SQL.Add('where ANO =:ANO and MES =:MES');
       ParamByName('ANO').AsInteger := YearOf(FechaCorte);
       ParamByName('MES').AsInteger := MonthOf(FechaCorte);
       Open;
       ValorACausar := FieldByName('CAUSACION').AsCurrency;
       Close;

       SQL.Clear;
       SQL.Add('select sum(NETO_MENSUAL) as CAUSACION from "cap$causacioncdat"');
       SQL.Add('where ANO =:ANO and MES =:MES');
       ParamByName('ANO').AsInteger := YearOf(FechaCorte);
       ParamByName('MES').AsInteger := MonthOf(FechaCorte);
       Open;
       ValorNetoCausar := FieldByName('CAUSACION').AsCurrency;
       Close;

       SQL.Clear;
       SQL.Add('select sum(RETEFUENTE_MENSUAL) as RETEFUENTE from "cap$causacioncdat"');
       SQL.Add('where ANO =:ANO and MES =:MES');
       ParamByName('ANO').AsInteger := YearOf(FechaCorte);
       ParamByName('MES').AsInteger := MonthOf(FechaCorte);
       Open;
       ValorRetefuente := FieldByName('RETEFUENTE').AsCurrency;
       Close;

       vNocomprobanteCausacion := IntToStr(ObtenerConsecutivo(_ibsql1));

     end;

     with _queryALiquidar do
      try
        Close;
        sql.Clear;
        sql.Add('insert into CON$COMPROBANTE (CON$COMPROBANTE."ID_COMPROBANTE",');
        sql.Add('CON$COMPROBANTE."FECHADIA", CON$COMPROBANTE."TIPO_COMPROBANTE",');
        sql.Add('CON$COMPROBANTE."ID_AGENCIA", CON$COMPROBANTE."DESCRIPCION",');
        sql.Add('CON$COMPROBANTE."TOTAL_DEBITO", CON$COMPROBANTE."TOTAL_CREDITO",');
        sql.Add('CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO",');
        sql.Add('CON$COMPROBANTE."ANULACION", CON$COMPROBANTE."ID_EMPLEADO") ');
        sql.Add('values (');
        sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
        sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
        sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
        ParamByName('ID_COMPROBANTE').AsString:= vNocomprobanteCausacion;
        ParamByname('FECHADIA').AsDate := fFechaActual;
        ParamByName('ID_AGENCIA').AsInteger := Agencia;
        ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
        ParamByName('DESCRIPCION').AsString := 'Causacion de CDAT Mes' + ' ' + MesCorte + ' ' + 'Ano' + ' ' + IntToStr(yearof(FechaCorte));
        ParamByName('TOTAL_DEBITO').AsCurrency  := ValorACausar;
        ParamByName('TOTAL_CREDITO').AsCurrency  := ValorACausar;
        ParamByName('ESTADO').AsString  := 'O';
        ParamByname('ANULACION').asstring := '';
        ParamByName('IMPRESO').AsInteger  := 1;
        ParamByName('ID_EMPLEADO').AsString := DBAlias;
        ExecSQL;
        Close;

        SQL.Clear;
        SQL.Add('insert into CON$AUXILIAR values (');
        SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
        SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
        SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX", :"TIPO_COMPROBANTE")');
        ParamByName('ID_COMPROBANTE').AsString := vNocomprobanteCausacion;
        ParamByName('ID_AGENCIA').AsInteger:= Agencia;
        ParamByName('FECHA').AsDate := fFechaActual;
        ParamByName('CODIGO').AsString := CodigoGasto;
        ParamByName('DEBITO').AsCurrency := ValorACausar;
        ParamByName('CREDITO').AsCurrency := 0;
        ParamByName('ID_CUENTA').AsInteger := 0;
        ParamByName('ID_COLOCACION').AsString := '';
        ParamByName('ID_IDENTIFICACION').AsInteger := 0;
        ParamByName('ID_PERSONA').AsString := '';
        ParamByName('MONTO_RETENCION').AsCurrency := 0;
        ParamByName('TASA_RETENCION').AsFloat := 0;
        ParamByName('ESTADOAUX').AsString := 'O';
        ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
        ExecSQL;
        Close;

        SQL.Clear;
        SQL.Add('insert into CON$AUXILIAR values (');
        SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
        SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
        SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX", :"TIPO_COMPROBANTE")');
        ParamByName('ID_COMPROBANTE').AsString := vNocomprobanteCausacion;
        ParamByName('ID_AGENCIA').AsInteger:= Agencia;
        ParamByName('FECHA').AsDate := fFechaActual;
        ParamByName('CODIGO').AsString := CodigoInteres;
        ParamByName('DEBITO').AsCurrency := 0;
        ParamByName('CREDITO').AsCurrency := ValorNetoCausar;
        ParamByName('ID_CUENTA').AsInteger := 0;
        ParamByName('ID_COLOCACION').AsString := '';
        ParamByName('ID_IDENTIFICACION').AsInteger := 0;
        ParamByName('ID_PERSONA').AsString := '';
        ParamByName('MONTO_RETENCION').AsCurrency := 0;
        ParamByName('TASA_RETENCION').AsFloat := 0;
        ParamByName('ESTADOAUX').AsString := 'O';
        ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
        ExecSQL;

        SQL.Clear;
        SQL.Add('insert into CON$AUXILIAR values (');
        SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
        SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
        SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX", :"TIPO_COMPROBANTE")');
        ParamByName('ID_COMPROBANTE').AsString := vNocomprobanteCausacion;
        ParamByName('ID_AGENCIA').AsInteger:= Agencia;
        ParamByName('FECHA').AsDate := fFechaActual;
        ParamByName('CODIGO').AsString := CodigoRetencion;
        ParamByName('DEBITO').AsCurrency := 0;
        ParamByName('CREDITO').AsCurrency := ValorRetefuente;
        ParamByName('ID_CUENTA').AsInteger := 0;
        ParamByName('ID_COLOCACION').AsString := '';
        ParamByName('ID_IDENTIFICACION').AsInteger := 0;
        ParamByName('ID_PERSONA').AsString := '';
        ParamByName('MONTO_RETENCION').AsCurrency := 0;
        ParamByName('TASA_RETENCION').AsFloat := 0;
        ParamByName('ESTADOAUX').AsString := 'O';
        ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
        ExecSQL;
      except
        _transaction.Rollback;
        PostMessage(Handle, WM_CLOSE, 0, 0);
        modalresult := mrCancel;
      end;

//Aplicar Ajuste CDATS
        ValorAjusteDeb := 0;
        ValorAjusteCre := 0;
        Lista.Clear;
        with _ibsql1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          if TpMenos6m > 0 then begin
            Close;
// Buscar Codigo Puc
            SQL.Clear;
//  Buscar en Puc Saldos Actuales
            Close;
            SQL.Clear;
            SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
            SQL.Add('from CON$PUC');
            SQL.Add('where CON$PUC.CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := '211005000000000000'{YA ES NIIF};
            try
               ExecQuery;
               vMenos6m := FieldByName('SALDO').AsCurrency;
            except
               Transaction.Rollback;
               PostMessage(self.Handle, WM_CLOSE, 0, 0);
               modalresult := mrCancel;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
            SQL.Add('from CON$PUC');
            SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
            SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
            SQL.Add('where CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
            SQL.Add('group by CON$PUC.SALDOINICIAL');
            ParamByName('CODIGO').AsString := '211005000000000000'{YA ES NIIF};
            ParamByName('MES').AsString := Format('%.2d',[Monthof(FechaCorte)]);
            try
              ExecQuery;
              vMenos6m := vMenos6m + FieldByName('SALDO').AsCurrency;
            except
               Transaction.Rollback;
               PostMessage(self.Handle, WM_CLOSE, 0, 0);
               modalresult := mrCancel;
            end;
            vMenos6m := TpMenos6m - (-vMenos6m);
//          Reporte.Variables.ByName['pMenos6m'].AsDouble := TpMenos6m + (-vMenos6m);
            if vMenos6m <> 0 then begin
              New(AR);
              AR^.codigo := '211005000000000000'{YA ES NIIF};
              if vMenos6m > 0 then begin
                 AR^.debito := 0;
                 AR^.credito := vMenos6m;
              end
              else
              begin
                 AR^.debito := -vMenos6m;
                 AR^.credito := 0;
              end;
              AR^.nocuenta := 0;
              AR^.nocredito := '';
              AR^.tipoide := 0;
              AR^.idpersona := '';
              AR^.monto := 0;
              AR^.tasa := 0;
              AR^.estado := 'O';
              if (AR^.debito <> 0) or (AR^.credito <> 0) then begin
                ValorAjusteDeb := ValorAjusteDeb + AR^.debito;
                ValorAjusteCre := ValorAjusteCre + AR^.credito;
                Lista.Add(AR);
              end;
            end;
          end;
          if Tp6y12m > 0 then begin
            Close;
// Buscar Codigo Puc
            SQL.Clear;
//  Buscar en Puc Saldos Actuales
            Close;
            SQL.Clear;
            SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
            SQL.Add('from CON$PUC');
            SQL.Add('where CON$PUC.CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := '211010000000000000'{YA ES NIIF};
            try
               ExecQuery;
               v6y12m := FieldByName('SALDO').AsCurrency;
            except
               Transaction.Rollback;
               PostMessage(self.Handle, WM_CLOSE, 0, 0);
               modalresult := mrCancel;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
            SQL.Add('from CON$PUC');
            SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
            SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
            SQL.Add('where CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
            SQL.Add('group by CON$PUC.SALDOINICIAL');
            ParamByName('CODIGO').AsString := '211010000000000000'{YA ES NIIF};
            ParamByName('MES').AsString := Format('%.2d',[Monthof(FechaCorte)]);
            try
              ExecQuery;
              v6y12m := v6y12m + FieldByName('SALDO').AsCurrency;
//              Reporte.Variables.ByName['p6y12m'].AsDouble := -v6y12m;
            except
               Transaction.Rollback;
               PostMessage(self.Handle, WM_CLOSE, 0, 0);
               modalresult := mrCancel;
            end;
            v6y12m := Tp6y12m - (-v6y12m);
//         Reporte.Variables.ByName['p6y12m'].AsDouble := Tp6y12m + (-v6y12m);
            if v6y12m <> 0 then begin
              New(AR);
              AR^.codigo := '211010000000000000'{YA ES NIIF};
              if v6y12m > 0 then begin
                 AR^.debito := 0;
                 AR^.credito := v6y12m;
              end
              else
              begin
                 AR^.debito := -v6y12m;
                 AR^.credito := 0;
              end;
              AR^.nocuenta := 0;
              AR^.nocredito := '';
              AR^.tipoide := 0;
              AR^.idpersona := '';
              AR^.monto := 0;
              AR^.tasa := 0;
              AR^.estado := 'O';
              if (AR^.debito <> 0) or (AR^.credito <> 0) then begin
                ValorAjusteDeb := ValorAjusteDeb + AR^.debito;
                ValorAjusteCre := ValorAjusteCre + AR^.credito;
                Lista.Add(AR);
              end;
            end;
          end;
          if Tp12y18m > 0 then begin
            Close;
// Buscar Codigo Puc
            SQL.Clear;
//  Buscar en Puc Saldos Actuales
            Close;
            SQL.Clear;
            SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
            SQL.Add('from CON$PUC');
            SQL.Add('where CON$PUC.CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := '211015000000000000'{YA ES NIIF};
            try
               ExecQuery;
               v12y18m := FieldByName('SALDO').AsCurrency;
            except
               Transaction.Rollback;
               PostMessage(self.Handle, WM_CLOSE, 0, 0);
               modalresult := mrCancel;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
            SQL.Add('from CON$PUC');
            SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
            SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
            SQL.Add('where CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
            SQL.Add('group by CON$PUC.SALDOINICIAL');
            ParamByName('CODIGO').AsString := '211015000000000000'{YA ES NIIF};
            ParamByName('MES').AsString := Format('%.2d',[Monthof(FechaCorte)]);
            try
              ExecQuery;
              v12y18m := v12y18m + FieldByName('SALDO').AsCurrency;
//              Reporte.Variables.ByName['p12y18m'].AsDouble := -v12y18m;
            except
               Transaction.Rollback;
               PostMessage(self.Handle, WM_CLOSE, 0, 0);
               modalresult := mrCancel;
            end;
            v12y18m := Tp12y18m - (-v12y18m);
//          Reporte.Variables.ByName['p12y18m'].AsDouble := Tp12y18m + (-v12y18m);
            if v12y18m <> 0 then begin
              New(AR);
              AR^.codigo := '211015000000000000'{YA ES NIIF};
              if v12y18m > 0 then begin
                 AR^.debito := 0;
                 AR^.credito := v12y18m;
              end
              else
              begin
                 AR^.debito := -v12y18m;
                 AR^.credito := 0;
              end;
              AR^.nocuenta := 0;
              AR^.nocredito := '';
              AR^.tipoide := 0;
              AR^.idpersona := '';
              AR^.monto := 0;
              AR^.tasa := 0;
              AR^.estado := 'O';
              if (AR^.debito <> 0) or (AR^.credito <> 0) then begin
                ValorAjusteDeb := ValorAjusteDeb + AR^.debito;
                ValorAjusteCre := ValorAjusteCre + AR^.credito;
                Lista.Add(AR);
              end;
            end;
          end;

// Realizo comprobante de Edades CDAT
    if Lista.Count > 0 then begin
      vNocomprobanteAjuste := IntToStr(ObtenerConsecutivo(_ibsql1));

       with _queryALiquidar do
        try
          Close;
          sql.Clear;
          sql.Add('insert into CON$COMPROBANTE (CON$COMPROBANTE."ID_COMPROBANTE",');
          sql.Add('CON$COMPROBANTE."FECHADIA", CON$COMPROBANTE."TIPO_COMPROBANTE",');
          sql.Add('CON$COMPROBANTE."ID_AGENCIA", CON$COMPROBANTE."DESCRIPCION",');
          sql.Add('CON$COMPROBANTE."TOTAL_DEBITO", CON$COMPROBANTE."TOTAL_CREDITO",');
          sql.Add('CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO",');
          sql.Add('CON$COMPROBANTE."ANULACION", CON$COMPROBANTE."ID_EMPLEADO") ');
          sql.Add('values (');
          sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
          sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
          sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
          ParamByName('ID_COMPROBANTE').AsString:= vNocomprobanteAjuste;
          ParamByname('FECHADIA').AsDate := fFechaActual;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
          ParamByName('DESCRIPCION').AsString := ' Reclasificacion Certificados de Deposito Ahorro a Termino Mes' + ' ' + MesCorte + ' ' + 'A?o' + ' ' + IntToStr(yearof(FechaCorte));
          ParamByName('TOTAL_DEBITO').AsCurrency  := ValorAjusteDeb;
          ParamByName('TOTAL_CREDITO').AsCurrency  := ValorAjusteCre;
          ParamByName('ESTADO').AsString  := 'O';
          ParamByname('ANULACION').asstring := '';
          ParamByName('IMPRESO').AsInteger  := 1;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          ExecSQL;
          Close;

          for I := 0 to Lista.Count -1 do
           begin
             Application.ProcessMessages;
             AR := Lista.Items[I];
             SQL.Clear;
             SQL.Add('insert into CON$AUXILIAR values (');
             SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
             SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
             SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
             ParamByName('ID_COMPROBANTE').AsString := vNocomprobanteAjuste;
             ParamByName('ID_AGENCIA').AsInteger:= Agencia;
             ParamByName('FECHA').AsDate := fFechaActual;
             ParamByName('CODIGO').AsString := AR^.codigo;
             ParamByName('DEBITO').AsCurrency := AR^.debito;
             ParamByName('CREDITO').AsCurrency := AR^.credito;
             ParamByName('ID_CUENTA').AsInteger := AR^.nocuenta;
             ParamByName('ID_COLOCACION').AsString := AR^.nocredito;
             ParamByName('ID_IDENTIFICACION').AsInteger := AR^.tipoide;
             ParamByName('ID_PERSONA').AsString := AR^.idpersona;
             ParamByName('MONTO_RETENCION').AsCurrency := AR^.monto;
             ParamByName('TASA_RETENCION').AsFloat := AR^.tasa;
             ParamByName('ESTADOAUX').AsString := AR^.estado;
             ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
             ExecSQL;
             Close;
           end;

        except
               Transaction.Rollback;
               PostMessage(self.Handle, WM_CLOSE, 0, 0);
               modalresult := mrCancel;
        end;
    end
    else begin
      vNocomprobanteAjuste := '0';
    end;
// Fin comprobante Edades CDAT
   end;

// fin Aplicar Ajuste
end;

procedure TfrmCausacionCdatAuto.FormShow(Sender: TObject);
begin
        ProcesarCausacion;
end;

end.
