unit unitCausacionCdat;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, IBSQL, Math,
  pr_TxClasses, UnitPantallaProgreso, DB, IBCustomDataSet, IBStoredProc,
  IBQuery, pr_Common, UnitDmGeneral;

type
  Tfrmcausacioncdat = class(TForm)
    GroupBox9: TGroupBox;
    Label3: TLabel;
    EdFecha: TDateTimePicker;
    Panel1: TPanel;
    CmdLiquidar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    CmdAplicar: TBitBtn;
    IBSeleccionar: TIBSQL;
    IBAplicar: TIBSQL;
    IBLiquidar: TIBSQL;
    IBTotalCaptaciones: TIBStoredProc;
    IBTotalCaptacionesTOTAL: TIntegerField;
    IBALiquidar: TIBQuery;
    RadioTipoLiquidacion: TRadioGroup;
    IBSQL1: TIBSQL;
    IBLiquidacion: TIBQuery;
    IBDataSet1: TIBDataSet;
    IBReporteTmp: TIBQuery;
    CmdComprobante: TBitBtn;
    Label4: TLabel;
    EdComprobanteCausacion: TStaticText;
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
    Reporte1: TprTxReport;
    Label1: TLabel;
    EdComprobanteAjuste: TStaticText;
    IBQuery1: TIBQuery;
    IBReporte: TIBQuery;
    IBComprobanteAjuste: TIBQuery;
    ReporteC: TprTxReport;
    IBReporteID_AGENCIA: TSmallintField;
    IBReporteID_TIPO_CAPTACION: TSmallintField;
    IBReporteNUMERO_CUENTA: TIntegerField;
    IBReporteDIGITO_CUENTA: TSmallintField;
    IBReporteVALOR_INICIAL: TIBBCDField;
    IBReporteFECHA_APERTURA: TDateField;
    IBReportePLAZO_CUENTA: TIntegerField;
    IBReporteTIPO_INTERES: TIBStringField;
    IBReporteTASA_EFECTIVA: TFloatField;
    IBReportePUNTOS_ADICIONALES: TFloatField;
    IBReporteVALOR_ACTUAL_TASA: TFloatField;
    IBReporteMODALIDAD: TIBStringField;
    IBReporteAMORTIZACION: TIntegerField;
    IBReporteFECHA_VENCIMIENTO: TDateField;
    IBReporteFECHA_ULTIMO_PAGO: TDateField;
    IBReporteFECHA_PRORROGA: TDateField;
    IBReporteFECHA_VENCIMIENTO_PRORROGA: TDateField;
    IBReporteNUMERO_CUENTA_ABONO: TIntegerField;
    IBReporteID_IDENTIFICACION: TSmallintField;
    IBReporteID_PERSONA: TIBStringField;
    IBReportePRIMER_APELLIDO: TIBStringField;
    IBReporteSEGUNDO_APELLIDO: TIBStringField;
    IBReporteNOMBRE: TIBStringField;
    IBReporteDIAS: TIntegerField;
    IBReporteCAUSACION_TOTAL: TIBBCDField;
    IBReporteRETEFUENTE_TOTAL: TIBBCDField;
    IBReporteNETO_TOTAL: TIBBCDField;
    IBReporteCAUSACION_MENSUAL: TIBBCDField;
    IBReporteRETEFUENTE_MENSUAL: TIBBCDField;
    IBReporteNETO_MENSUAL: TIBBCDField;
    IBReporteTmpID_AGENCIA: TSmallintField;
    IBReporteTmpID_TIPO_CAPTACION: TSmallintField;
    IBReporteTmpNUMERO_CUENTA: TIntegerField;
    IBReporteTmpDIGITO_CUENTA: TSmallintField;
    IBReporteTmpVALOR_INICIAL: TIBBCDField;
    IBReporteTmpFECHA_APERTURA: TDateField;
    IBReporteTmpPLAZO_CUENTA: TIntegerField;
    IBReporteTmpTIPO_INTERES: TIBStringField;
    IBReporteTmpID_INTERES: TSmallintField;
    IBReporteTmpTASA_EFECTIVA: TFloatField;
    IBReporteTmpPUNTOS_ADICIONALES: TFloatField;
    IBReporteTmpMODALIDAD: TIBStringField;
    IBReporteTmpAMORTIZACION: TIntegerField;
    IBReporteTmpID_ESTADO: TSmallintField;
    IBReporteTmpFECHA_VENCIMIENTO: TDateField;
    IBReporteTmpFECHA_ULTIMO_PAGO: TDateField;
    IBReporteTmpFECHA_PROXIMO_PAGO: TDateField;
    IBReporteTmpFECHA_PRORROGA: TDateField;
    IBReporteTmpID_TIPO_CAPTACION_ABONO: TSmallintField;
    IBReporteTmpNUMERO_CUENTA_ABONO: TIntegerField;
    IBReporteTmpID_IDENTIFICACION: TSmallintField;
    IBReporteTmpID_PERSONA: TIBStringField;
    IBReporteTmpPRIMER_APELLIDO: TIBStringField;
    IBReporteTmpSEGUNDO_APELLIDO: TIBStringField;
    IBReporteTmpNOMBRE: TIBStringField;
    IBReporteTmpDIAS: TIntegerField;
    IBReporteTmpTASA_E: TIBBCDField;
    IBReporteTmpCAUSACION_TOTAL: TIBBCDField;
    IBReporteTmpRETEFUENTE_TOTAL: TIBBCDField;
    IBReporteTmpNETO_TOTAL: TIBBCDField;
    IBReporteTmpCAUSACION_MENSUAL: TIBBCDField;
    IBReporteTmpRETEFUENTE_MENSUAL: TIBBCDField;
    IBReporteTmpNETO_MENSUAL: TIBBCDField;
    Reporte: TprTxReport;
    procedure CmdLiquidarClick(Sender: TObject);
    procedure RadioTipoLiquidacionClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure CmdComprobanteClick(Sender: TObject);
    procedure EdFechaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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
  frmcausacioncdat: Tfrmcausacioncdat;
  frmProgreso:TfrmProgreso;
  dmGeneral: TdmGeneral;
  Liquidado:Boolean;
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

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, UnitVistaPreliminar;

procedure Tfrmcausacioncdat.CmdLiquidarClick(Sender: TObject);
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
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Commit;

        dmGeneral.IBTransaction1.StartTransaction;
        
        FechaCorte := EdFecha.Date;
        RetefuenteAcum := 0;
        frmProgreso := TfrmProgreso.Create(Self);
        frmProgreso.Titulo := 'Buscando CDAT';
        frmProgreso.Min := 0;
        frmProgreso.Max := 100;
        frmProgreso.Position := 0;
        frmProgreso.InfoLabel := '';
        frmProgreso.Ejecutar;
        Application.ProcessMessages;

        with IBSeleccionar do
         begin
          Close;
          SQL.Clear;
          SQL.Add('delete from "cap$causacioncdattmp"');
          ExecQuery;
          Close;

          SQL.Clear;
          SQL.Add('select DIARIO_RETEFUENTE, TASA_RETEFUENTE from "gen$valorretefuente"');
          SQL.Add('where ID_RETEFUENTE = 1');
          ExecQuery;
          DiarioRet := FieldByName('DIARIO_RETEFUENTE').AsCurrency;
          TasaRet := FieldByName('TASA_RETEFUENTE').AsFloat;
          TasaRet := TasaNominalVencida(TasaRet,30) / 100;
          Close;
         end;

        with IBSeleccionar do
         begin
           IBSeleccionar.Close;
           sql.Clear;
           SQL.Add('SELECT *');
           SQL.Add('FROM P_CAP_0013 (:ID,:ID_ESTADO)');
           ParamByName('ID').AsInteger := 6;
           ParamByName('ID_ESTADO').AsInteger := 1;
           ExecQuery;

           while not IBSeleccionar.Eof do
            begin
              with IBLiquidar do
               begin
                 Application.ProcessMessages;
                 IBLiquidar.Close;
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
                 ParamByName('ID_AGENCIA').AsInteger := IBSeleccionar.FieldByName('ID_AGENCIA').AsInteger;
                 ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSeleccionar.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 ParamByName('NUMERO_CUENTA').AsInteger := IBSeleccionar.FieldByName('NUMERO_CUENTA').AsInteger;
                 ParamByName('DIGITO_CUENTA').AsInteger := IBSeleccionar.FieldByName('DIGITO_CUENTA').AsInteger;
                 ParamByName('VALOR_INICIAL').AsCurrency := IBSeleccionar.FieldByName('VALOR_INICIAL').AsCurrency;
                 ParamByName('FECHA_APERTURA').AsDate := IBSeleccionar.FieldByName('FECHA_APERTURA').AsDate;
                 ParamByName('PLAZO_CUENTA').AsInteger := IBSeleccionar.FieldByName('PLAZO_CUENTA').AsInteger;
                 ParamByName('TIPO_INTERES').AsString := IBSeleccionar.FieldByName('TIPO_INTERES').AsString;
                 ParamByName('ID_INTERES').AsInteger := IBSeleccionar.FieldByName('ID_INTERES').AsInteger;
                 ParamByName('TASA_EFECTIVA').AsFloat := IBSeleccionar.FieldByName('TASA_EFECTIVA').AsFloat;
                 ParamByName('PUNTOS_ADICIONALES').AsFloat := IBSeleccionar.FieldByName('PUNTOS_ADICIONALES').AsFloat;
                 ParamByName('MODALIDAD').AsString := IBSeleccionar.FIELDBYNAME('MODALIDAD').AsString;
                 ParamByName('AMORTIZACION').AsInteger := IBSeleccionar.FieldByName('AMORTIZACION').AsInteger;
                 ParamByName('ID_ESTADO').AsInteger := 1;
                 ParamByName('FECHA_VENCIMIENTO').AsDate := IBSeleccionar.FieldByName('FECHA_VENCIMIENTO').AsDate;
                 ParamByName('FECHA_ULTIMO_PAGO').AsDate := IBSeleccionar.FieldByName('FECHA_ULTIMO_PAGO').AsDate;
                 ParamByName('FECHA_PROXIMO_PAGO').AsDate := IBSeleccionar.FieldByName('FECHA_PROXIMO_PAGO').AsDate;
                 ParamByName('FECHA_PRORROGA').AsDate := IBSeleccionar.FieldByName('FECHA_PRORROGA').AsDate;
                 ParamByName('ID_TIPO_CAPTACION_ABONO').AsInteger := IBSeleccionar.FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                 ParamByName('NUMERO_CUENTA_ABONO').AsInteger := IBSeleccionar.FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
                 ParamByName('ID_IDENTIFICACION').AsInteger := IBSeleccionar.FieldByName('ID_IDENTIFICACION').AsInteger;
                 ParamByName('ID_PERSONA').AsString := IBSeleccionar.FieldByName('ID_PERSONA').AsString;
                 ParamByName('PRIMER_APELLIDO').AsString := IBSeleccionar.FieldByName('PRIMER_APELLIDO').AsString;
                 ParamByName('SEGUNDO_APELLIDO').AsString := IBSeleccionar.FieldByName('SEGUNDO_APELLIDO').AsString;
                 ParamByName('NOMBRE').AsString := IBSeleccionar.FieldByName('NOMBRE').AsString;
                 ParamByName('DIAS').AsInteger := 0;
                 parambyname('TASA_E').AsCurrency := 0;
                 ParamByName('CAUSACION_TOTAL').AsCurrency := 0;
                 ParamByName('RETEFUENTE_TOTAL').AsCurrency := 0;
                 ParamByName('NETO_TOTAL').AsCurrency := 0;
                 ParamByName('CAUSACION_MENSUAL').AsCurrency := 0;
                 ParamByName('RETEFUENTE_MENSUAL').AsCurrency := 0;
                 ParamByName('NETO_MENSUAL').AsCurrency := 0;
                 ParamByName('RETEFUENTE').AsInteger := IBSeleccionar.FieldByName('RETEFUENTE').AsInteger;
                 ExecQuery;
               end;
              Next;
             end;
            IBSeleccionar.Close;
            IBLiquidar.Close;
         end;


//**
          Application.ProcessMessages;
          frmProgreso.InfoLabel := 'Buscando CDAT a Causar';

          with IBTotalCaptaciones do
          begin
              StoredProcName := 'P_CAP_0014';
              ParamByName('ID').AsInteger := 6;
              ParamByName('FECHA').AsDate := EdFecha.Date;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Prepare;
                 ExecProc;
                 Screen.Cursor := crDefault;
              except
                 frmProgreso.Cerrar;
                 MessageDlg('Error Localizando CDATs a Causar',mtError,[mbcancel],0);
                 Exit;
              end;
              MaxCaptacion := ParamByName('TOTAL').AsInteger;
              frmProgreso.Max := MaxCaptacion;
              if MaxCaptacion = 0 then
              begin
                 frmProgreso.Cerrar;
                 MessageDlg('No existen CDATs a Causar',mtInformation,[mbok],0);
                 if dmGeneral.IBTransaction1.InTransaction then
                    dmGeneral.IBTransaction1.RollbackRetaining;
                 Exit;
              end;
              Close;
          end;

          Application.ProcessMessages;
          frmProgreso.InfoLabel := 'Iniciando Proceso de Causación';

        with IBALiquidar do
        begin
            SQL.Clear;
            SQL.Add('select * from P_CAP_0015');
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Open;
                 Screen.Cursor := crDefault;
              except
                 frmProgreso.Cerrar;
                 MessageDlg('Error Localizando CDAT a Causar',mtError,[mbcancel],0);
                 CmdCerrar.Enabled := True;
                 Exit;
              end;

              while not Eof do
              begin
                Application.ProcessMessages;
                frmProgreso.InfoLabel := 'Liquidando CDAT:' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                Numero := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                frmProgreso.Position := RecNo;
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
                  with IBLiquidar do
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
                     if IBALiquidar.FieldByName('RETEFUENTE').AsInteger = 1 then begin
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
                     execquery;
                     Close;
                   end;
                except
                  frmProgreso.Cerrar;
                  MessageDlg('No se pudo guardar en la tabla temporal',mterror,[mbcancel],0);
                  CmdCerrar.Enabled := True;
                  Exit;
                end;
                Next;
              end;
          Close;
          Transaction.CommitRetaining;
        end;
          IBLiquidacion.Close;
          IBLiquidacion.SQL.Clear;
          frmProgreso.Cerrar;
          MessageDlg('Proceso de Causación Culminado con Exito!',mtInformation,[mbok],0);
          Liquidado := True;
          CmdLiquidar.Enabled := False;
          CmdVer.Enabled := True;
          CmdCerrar.Enabled := True;
          RadioTipoLiquidacion.Enabled := False;


// Reporte por Edades
        with IBReporte do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           ParamByName('ANO').AsString := IntToStr(YearOf(EdFecha.Date));
           ParamByName('MES').AsString := IntToStr(MonthOf(EdFecha.Date));
        end;

        with IBSQL1 do begin
           Close;
           ParamByName('PLAZO1').AsInteger := 0;
           ParamByName('PLAZO2').AsInteger := 179;
           ExecQuery;
           TpMenos6m := FieldByName('VALOR').AsCurrency;
           Reporte.Variables.ByName['pMenos6m'].AsDouble := FieldByName('VALOR').AsCurrency;
           Close;
           ParamByName('PLAZO1').AsInteger := 180;
           ParamByName('PLAZO2').AsInteger := 360;
           ExecQuery;
           Tp6y12m := FieldByName('VALOR').AsCurrency;
           Reporte.Variables.ByName['p6y12m'].AsDouble := FieldByName('VALOR').AsCurrency;
           Close;
           ParamByName('PLAZO1').AsInteger := 361;
           ParamByName('PLAZO2').AsInteger := 539;
           ExecQuery;
           Tp12y18m := FieldByName('VALOR').AsCurrency;
           Reporte.Variables.ByName['p12y18m'].AsDouble := FieldByName('VALOR').AsCurrency;
           Close;
           ParamByName('PLAZO1').AsInteger := 540;
           ParamByName('PLAZO2').AsInteger := 999999;
           ExecQuery;
           Tp18m := FieldByName('VALOR').AsCurrency;
           Reporte.Variables.ByName['p18m'].AsDouble := FieldByName('VALOR').AsCurrency;
           Close;
        end;
// fin Reporte por Edades

          if RadioTipoLiquidacion.ItemIndex = 1 then
             CmdAplicar.Enabled := True;
end;


procedure Tfrmcausacioncdat.RadioTipoLiquidacionClick(Sender: TObject);
begin
        if ( RadioTipoLiquidacion.ItemIndex <> -1) and
           ( Liquidado = False) then
           CmdLiquidar.Enabled := True
        else
           CmdLiquidar.Enabled := False;
end;

procedure Tfrmcausacioncdat.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure Tfrmcausacioncdat.FormShow(Sender: TObject);
begin
        EdFecha.Date := fFechaActual;
        Liquidado := False;
end;

procedure Tfrmcausacioncdat.CmdVerClick(Sender: TObject);
begin
       if RadioTipoLiquidacion.ItemIndex = 1 then
        begin
          if IBReporte.Transaction.InTransaction then
            IBReporte.Transaction.Rollback;
          IBReporte.Transaction.StartTransaction;
          
          IBReporte.Close;
          IBReporte.SQL.Clear;
          IBReporte.SQL.Add('SELECT "cap$causacioncdat".ID_AGENCIA,');
          IBReporte.SQL.Add('"cap$causacioncdat".ID_TIPO_CAPTACION,');
          IBReporte.SQL.Add('"cap$causacioncdat".NUMERO_CUENTA,');
          IBReporte.SQL.Add('"cap$causacioncdat".DIGITO_CUENTA,');
          IBReporte.SQL.Add('"cap$causacioncdat".VALOR_INICIAL,');
          IBReporte.SQL.Add('"cap$causacioncdat".FECHA_APERTURA,');
          IBReporte.SQL.Add('"cap$causacioncdat".PLAZO_CUENTA,');
          IBReporte.SQL.Add('"cap$causacioncdat".TIPO_INTERES,');
          IBReporte.SQL.Add('"cap$causacioncdat".TASA_EFECTIVA,');
          IBReporte.SQL.Add('"cap$causacioncdat".PUNTOS_ADICIONALES,');
          IBReporte.SQL.Add('"col$tasavariables".VALOR_ACTUAL_TASA,');
          IBReporte.SQL.Add('"cap$causacioncdat".MODALIDAD,');
          IBReporte.SQL.Add('"cap$causacioncdat".AMORTIZACION,');
          IBReporte.SQL.Add('"cap$causacioncdat".FECHA_VENCIMIENTO,');
          IBReporte.SQL.Add('"cap$causacioncdat".FECHA_ULTIMO_PAGO,');
          IBReporte.SQL.Add('"cap$causacioncdat".FECHA_PRORROGA,');
          IBReporte.SQL.Add('"cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
          IBReporte.SQL.Add('"cap$maestro".NUMERO_CUENTA_ABONO,');
          IBReporte.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          IBReporte.SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          IBReporte.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBReporte.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBReporte.SQL.Add('"gen$persona".NOMBRE,');
          IBReporte.SQL.Add('"cap$causacioncdat".DIAS,');
          IBReporte.SQL.Add('"cap$causacioncdat".CAUSACION_TOTAL, "cap$causacioncdat".RETEFUENTE_TOTAL, "cap$causacioncdat".NETO_TOTAL, "cap$causacioncdat".CAUSACION_MENSUAL,');
          IBReporte.SQL.Add('"cap$causacioncdat".RETEFUENTE_MENSUAL, "cap$causacioncdat".NETO_MENSUAL');
          IBReporte.SQL.Add('FROM "cap$causacioncdat"');
          IBReporte.SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$causacioncdat".ID_AGENCIA AND');
          IBReporte.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$causacioncdat".ID_TIPO_CAPTACION AND "cap$maestro".NUMERO_CUENTA = "cap$causacioncdat".NUMERO_CUENTA AND "cap$maestro".DIGITO_CUENTA = "cap$causacioncdat".DIGITO_CUENTA)');
          IBReporte.SQL.Add('LEFT JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA AND "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION AND ');
          IBReporte.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA AND "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          IBReporte.SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION AND "cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBReporte.SQL.Add('LEFT JOIN "col$tasavariables" ON ("cap$maestro".ID_INTERES = "col$tasavariables".ID_INTERES)');
          IBReporte.SQL.Add('WHERE "cap$causacioncdat".ANO = :ANO and');
          IBReporte.SQL.Add('"cap$causacioncdat".MES = :MES');
          IBReporte.SQL.Add('ORDER BY "cap$maestro".PLAZO_CUENTA, "cap$maestro".NUMERO_CUENTA');
          IBReporte.ParamByName('ANO').AsInteger := YearOf(EdFecha.Date);
          IBReporte.ParamByName('MES').AsInteger := MonthOf(EdFecha.Date);
          IBReporte.Open;

          Reporte.Variables.ByName['Empresa'].AsString := Empresa;
          Reporte.Variables.ByName['FechaCorte'].AsDateTime := FechaCorte;
          Reporte.Variables.ByName['pRetefuenteAcumulada'].AsDouble := RetefuenteAcum;
    //      if Reporte.PrepareReport then
      //     Reporte.PreviewPreparedReport(True);
        //  IBReporte.Close;
        end
       else
        begin
          if IBReporte.Transaction.InTransaction then
            IBReporte.Transaction.Rollback;
          IBReporte.Transaction.StartTransaction;

          IBReporte.Close;
          IBReporte.SQL.Clear;
          IBReporte.SQL.Add('SELECT "cap$causacioncdattmp".ID_AGENCIA,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".ID_TIPO_CAPTACION,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".NUMERO_CUENTA,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".DIGITO_CUENTA,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".VALOR_INICIAL,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".FECHA_APERTURA,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".PLAZO_CUENTA,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".TIPO_INTERES,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".TASA_EFECTIVA,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".PUNTOS_ADICIONALES,');
          IBReporte.SQL.Add('"col$tasavariables".VALOR_ACTUAL_TASA,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".MODALIDAD,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".AMORTIZACION,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".FECHA_VENCIMIENTO,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".FECHA_ULTIMO_PAGO,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".FECHA_PRORROGA,');
          IBReporte.SQL.Add('"cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
          IBReporte.SQL.Add('"cap$maestro".NUMERO_CUENTA_ABONO,');
          IBReporte.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          IBReporte.SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          IBReporte.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBReporte.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBReporte.SQL.Add('"gen$persona".NOMBRE,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".DIAS,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".CAUSACION_TOTAL, "cap$causacioncdattmp".RETEFUENTE_TOTAL, "cap$causacioncdattmp".NETO_TOTAL, "cap$causacioncdattmp".CAUSACION_MENSUAL,');
          IBReporte.SQL.Add('"cap$causacioncdattmp".RETEFUENTE_MENSUAL, "cap$causacioncdattmp".NETO_MENSUAL');
          IBReporte.SQL.Add('FROM "cap$causacioncdattmp"');
          IBReporte.SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$causacioncdattmp".ID_AGENCIA AND "cap$maestro".ID_TIPO_CAPTACION = "cap$causacioncdattmp".ID_TIPO_CAPTACION');
          IBReporte.SQL.Add('AND "cap$maestro".NUMERO_CUENTA = "cap$causacioncdattmp".NUMERO_CUENTA AND "cap$maestro".DIGITO_CUENTA = "cap$causacioncdattmp".DIGITO_CUENTA)');
          IBReporte.SQL.Add('LEFT JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA AND "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION');
          IBReporte.SQL.Add('AND "cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA AND "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          IBReporte.SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION AND "cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBReporte.SQL.Add('LEFT JOIN "col$tasavariables" ON ("cap$maestro".ID_INTERES = "col$tasavariables".ID_INTERES)');
          IBReporte.SQL.Add('ORDER BY "cap$maestro".PLAZO_CUENTA, "cap$maestro".NUMERO_CUENTA');
          IBReporte.Open;
        end;

        Reporte.Variables.ByName['Empresa'].AsString := Empresa;
        Reporte.Variables.ByName['FechaCorte'].AsDateTime := FechaCorte;
        Reporte.Variables.ByName['pRetefuenteAcumulada'].AsDouble := RetefuenteAcum;

        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);

        IBReporte.Close;
end;

procedure Tfrmcausacioncdat.CmdAplicarClick(Sender: TObject);
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
begin
    CmdAplicar.Enabled := False;
    with IBSeleccionar do
     begin
       Close;
       SQL.Clear;
       SQL.Add('select * from "cap$causacioncdattmp"');
       ExecQuery;
       while not Eof do
        begin
          with IBAplicar do
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
             ParamByName('ID_AGENCIA').AsInteger := IBSeleccionar.FieldByName('ID_AGENCIA').AsInteger;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSeleccionar.FieldByName('ID_TIPO_CAPTACION').AsInteger;
             ParamByName('NUMERO_CUENTA').AsInteger := IBSeleccionar.FieldByName('NUMERO_CUENTA').AsInteger;
             ParamByName('DIGITO_CUENTA').AsInteger := IBSeleccionar.FieldByName('DIGITO_CUENTA').AsInteger;
             ParamByName('VALOR_INICIAL').AsCurrency := IBSeleccionar.FieldByName('VALOR_INICIAL').AsCurrency;
             ParamByName('FECHA_APERTURA').AsDate := IBSeleccionar.FieldByName('FECHA_APERTURA').AsDate;
             ParamByName('PLAZO_CUENTA').AsInteger := IBSeleccionar.FieldByName('PLAZO_CUENTA').AsInteger;
             ParamByName('TIPO_INTERES').AsString := IBSeleccionar.FieldByName('TIPO_INTERES').AsString;
             ParamByName('ID_INTERES').AsInteger := IBSeleccionar.FieldByName('ID_INTERES').AsInteger;
             ParamByName('TASA_EFECTIVA').AsFloat := IBSeleccionar.FieldByName('TASA_EFECTIVA').AsFloat;
             ParamByName('PUNTOS_ADICIONALES').AsFloat := IBSeleccionar.FieldByName('PUNTOS_ADICIONALES').AsFloat;
             ParamByName('MODALIDAD').AsString := IBSeleccionar.FieldByName('MODALIDAD').AsString;
             ParamByName('AMORTIZACION').AsInteger := IBSeleccionar.FieldByName('AMORTIZACION').AsInteger;
             ParamByName('ID_ESTADO').AsInteger := IBSeleccionar.FieldByName('ID_ESTADO').AsInteger;
             ParamByName('FECHA_VENCIMIENTO').AsDate := IBSeleccionar.FieldByName('FECHA_VENCIMIENTO').AsDate;
             ParamByName('FECHA_ULTIMO_PAGO').AsDate := IBSeleccionar.FieldByName('FECHA_ULTIMO_PAGO').AsDate;
             ParamByName('FECHA_PROXIMO_PAGO').AsDate := IBSeleccionar.FieldByName('FECHA_PROXIMO_PAGO').AsDate;
             ParamByName('FECHA_PRORROGA').AsDate := IBSeleccionar.FieldByName('FECHA_PRORROGA').AsDate;
             ParamByName('ID_TIPO_CAPTACION_ABONO').AsInteger := IBSeleccionar.FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
             ParamByName('NUMERO_CUENTA_ABONO').AsInteger := IBSeleccionar.FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
             ParamByName('ID_IDENTIFICACION').AsInteger := IBSeleccionar.FieldByName('ID_IDENTIFICACION').AsInteger;
             ParamByName('ID_PERSONA').AsString := IBSeleccionar.FieldByName('ID_PERSONA').AsString;
             ParamByName('PRIMER_APELLIDO').AsString := IBSeleccionar.FieldByName('PRIMER_APELLIDO').AsString;
             ParamByName('SEGUNDO_APELLIDO').AsString := IBSeleccionar.FieldByName('SEGUNDO_APELLIDO').AsString;
             ParamByName('NOMBRE').AsString := IBSeleccionar.FieldByName('NOMBRE').AsString;
             ParamByName('DIAS').AsInteger := IBSeleccionar.FieldByName('DIAS').AsInteger;
             ParamByName('ANO').AsInteger := YearOf(FechaCorte);
             ParamByName('MES').AsInteger := monthof(FechaCorte);
             ParamByName('TASA_E').AsCurrency := IBSeleccionar.FieldByName('TASA_E').AsCurrency;
             ParamByName('CAUSACION_TOTAL').AsCurrency := IBSeleccionar.FieldByName('CAUSACION_TOTAL').AsCurrency;
             ParamByName('RETEFUENTE_TOTAL').AsCurrency := IBSeleccionar.FieldByName('RETEFUENTE_TOTAL').AsCurrency;
             ParamByName('NETO_TOTAL').AsCurrency := IBSeleccionar.FieldByName('NETO_TOTAL').AsCurrency;
             ParamByName('CAUSACION_MENSUAL').AsCurrency := IBSeleccionar.FieldByName('CAUSACION_MENSUAL').AsCurrency;
             ParamByName('RETEFUENTE_MENSUAL').AsCurrency := IBSeleccionar.FieldByName('RETEFUENTE_MENSUAL').AsCurrency;
             ParamByName('NETO_MENSUAL').AsCurrency := IBSeleccionar.FieldByName('NETO_MENSUAL').AsCurrency;
             try
               ExecQuery;
               Transaction.CommitRetaining;
             except
               Messagedlg('Error Insertando en Tabla',mterror,[mbcancel],0);
             end;
           end; //fin de with IBAplicar
           Next;
        end;  // fin de while
        Close;

    end; // fin de with IBSeleccionar

    MesCorte := FormatCurr('00',monthof(FechaCorte));
    with IBSeleccionar do
     begin
       Close;
       SQL.Clear;
       SQL.Add('select CODIGO_PUC from "cap$codigoscausacion"');
       SQL.Add('where ES_GASTO = 1');
       ExecQuery;
       CodigoGasto := FieldByName('CODIGO_PUC').AsString;
       Close;

       SQL.Clear;
       SQL.Add('select CODIGO_PUC from "cap$codigoscausacion"');
       SQL.Add('where ES_INTERESES = 1');
       ExecQuery;
       CodigoInteres := FieldByName('CODIGO_PUC').AsString;
       Close;

       SQL.Clear;
       SQL.Add('select CODIGO_PUC from "cap$codigoscausacion"');
       SQL.Add('where ES_RETEFUENTE = 1');
       ExecQuery;
       CodigoRetencion := FieldByName('CODIGO_PUC').AsString;
       Close;

       SQL.Clear;
       SQL.Add('select sum(CAUSACION_MENSUAL) as CAUSACION from "cap$causacioncdat"');
       SQL.Add('where ANO =:ANO and MES =:MES');
       ParamByName('ANO').AsInteger := YearOf(FechaCorte);
       ParamByName('MES').AsInteger := MonthOf(FechaCorte);
       ExecQuery;
       ValorACausar := FieldByName('CAUSACION').AsCurrency;
       Close;

       SQL.Clear;
       SQL.Add('select sum(NETO_MENSUAL) as CAUSACION from "cap$causacioncdat"');
       SQL.Add('where ANO =:ANO and MES =:MES');
       ParamByName('ANO').AsInteger := YearOf(FechaCorte);
       ParamByName('MES').AsInteger := MonthOf(FechaCorte);
       ExecQuery;
       ValorNetoCausar := FieldByName('CAUSACION').AsCurrency;
       Close;

       SQL.Clear;
       SQL.Add('select sum(RETEFUENTE_MENSUAL) as RETEFUENTE from "cap$causacioncdat"');
       SQL.Add('where ANO =:ANO and MES =:MES');
       ParamByName('ANO').AsInteger := YearOf(FechaCorte);
       ParamByName('MES').AsInteger := MonthOf(FechaCorte);
       ExecQuery;
       ValorRetefuente := FieldByName('RETEFUENTE').AsCurrency;
       Close;

 {      SQL.Clear;
       SQL.Add('select SALDOINICIAL from "con$puc"');
       SQL.Add('where');
       SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
       SQL.Add('CODIGO = :"CODIGO"');
       ParamByName('ID_AGENCIA').AsInteger := Agencia;
       ParamByName('CODIGO').AsString := CodigoRetencion;
       ExecQuery;
       ValorRetencionAcum := FieldByName('SALDOINICIAL').AsCurrency;
       Close;

       SQL.Clear;
       sql.Add('Select ');
       sql.Add('sum("con$saldoscuenta"."DEBITO") as DEBITO,');
       sql.Add('sum("con$saldoscuenta"."CREDITO") as CREDITO');
       sql.Add('from "con$saldoscuenta" ');
       sql.Add('where ');
       sql.Add('"con$saldoscuenta".ID_AGENCIA =:"ID_AGENCIA" and');
       sql.Add('"con$saldoscuenta".CODIGO =:"CODIGO" and');
       sql.Add('"con$saldoscuenta".MES <=:"MES"');
       ParamByName('ID_AGENCIA').AsInteger := agencia;
       ParamByName('CODIGO').AsString := CodigoInteres;
       ParamByName('MES').AsString := MesCorte;
       ExecQuery;
       ValorRetencionAcum := ValorRetencionAcum + (FieldByName('DEBITO').AsCurrency - FieldByName('CREDITO').AsCurrency);
       Close;

       SQL.Clear;
       SQL.Add('select SALDOINICIAL from "con$puc"');
       SQL.Add('where');
       SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
       SQL.Add('CODIGO = :"CODIGO"');
       ParamByName('ID_AGENCIA').AsInteger := Agencia;
       ParamByName('CODIGO').AsString := CodigoInteres;
       ExecQuery;
       SaldoInicialInteres := FieldByName('SALDOINICIAL').AsCurrency;
       Close;

       SQL.Clear;
       sql.Add('Select ');
       sql.Add('sum("con$saldoscuenta"."DEBITO") as DEBITO,');
       sql.Add('sum("con$saldoscuenta"."CREDITO") as CREDITO');
       sql.Add('from "con$saldoscuenta" ');
       sql.Add('where ');
       sql.Add('"con$saldoscuenta".ID_AGENCIA =:"ID_AGENCIA" and');
       sql.Add('"con$saldoscuenta".CODIGO =:"CODIGO" and');
       sql.Add('"con$saldoscuenta".MES <=:"MES"');
       ParamByName('ID_AGENCIA').AsInteger := agencia;
       ParamByName('CODIGO').AsString := CodigoInteres;
       ParamByName('MES').AsString := MesCorte;
       ExecQuery;
       MovimientoInteres := FieldByName('DEBITO').AsCurrency - FieldByName('CREDITO').AsCurrency;
       Close;

       TotalInteres := SaldoInicialInteres + MovimientoInteres;

       SQL.Clear;
       SQL.Add('select sum(VALOR) as VALOR from "cap$causacioncdattmp"');
       ExecQuery;
       ValorACausar := FieldByName('VALOR').AsCurrency;
       Close;

       ValorACausar := ValorACausar - (-TotalInteres);     }

       vNocomprobanteCausacion := IntToStr(ObtenerConsecutivo(IBSQL1,4));
//       vNocomprobanteCausacion := IntToStr(ObtenerConsecutivoTmp(IBSQL1));

       EdComprobanteCausacion.Caption := Format('%.7d',[strtoint(vNocomprobanteCausacion)]);
       IBSQL1.Transaction.StartTransaction;
     end;

     with IBAplicar do
      try
        Close;
        sql.Clear;
        sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
        sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
        sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
        sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
        sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
        sql.Add('"con$comprobante"."ANULACION", "con$comprobante"."ID_EMPLEADO") ');
        sql.Add('values (');
        sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
        sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
        sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
        ParamByName('ID_COMPROBANTE').AsString:= vNocomprobanteCausacion;
        ParamByname('FECHADIA').AsDate := fFechaActual;
        ParamByName('ID_AGENCIA').AsInteger := Agencia;
        ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
        ParamByName('DESCRIPCION').AsString := 'Causacion de TITULOS EJECUTIVOS Mes' + ' ' + MesCorte + ' ' + 'Ano' + ' ' + IntToStr(yearof(FechaCorte));
        ParamByName('TOTAL_DEBITO').AsCurrency  := ValorACausar;
        ParamByName('TOTAL_CREDITO').AsCurrency  := ValorACausar;
        ParamByName('ESTADO').AsString  := 'O';
        ParamByname('ANULACION').asstring := '';
        ParamByName('IMPRESO').AsInteger  := 1;
        ParamByName('ID_EMPLEADO').AsString := DBAlias;
        ExecQuery;
        Close;

        SQL.Clear;
        SQL.Add('insert into "con$auxiliar" values (');
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
        ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
        ExecQuery;
        Close;

        SQL.Clear;
        SQL.Add('insert into "con$auxiliar" values (');
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
        ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
        ExecQuery;

        SQL.Clear;
        SQL.Add('insert into "con$auxiliar" values (');
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
        ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
        ExecQuery;
        IBAplicar.Transaction.Commit;
      except
        MessageDlg('Error Grabando Intereses de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbok],0);
        IBAplicar.Transaction.Rollback;
        Exit;
      end;

//Aplicar Ajuste CDATS
{
        ValorAjusteDeb := 0;
        ValorAjusteCre := 0;
        Lista.Clear;
        with IBSQL1 do begin
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
            SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('where "con$puc".CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := '211005000000000000';
            try
               ExecQuery;
               vMenos6m := FieldByName('SALDO').AsCurrency;
            except
               MessageDlg('Error al Obtener valor de Menor a 6 meses',mtError,[mbcancel],0);
               Transaction.Rollback;
               raise;
               Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
            SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
            SQL.Add('where "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
            SQL.Add('group by "con$puc".SALDOINICIAL');
            ParamByName('CODIGO').AsString := '211005000000000000';
            ParamByName('MES').AsString := Format('%.2d',[Monthof(EdFecha.Date)]);
            try
              ExecQuery;
              vMenos6m := vMenos6m + FieldByName('SALDO').AsCurrency;
            except
              MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
              Transaction.Rollback;
              raise;
              Exit;
            end;
            vMenos6m := TpMenos6m - (-vMenos6m);
//          Reporte.Variables.ByName['pMenos6m'].AsDouble := TpMenos6m + (-vMenos6m);
            if vMenos6m <> 0 then begin
              New(AR);
              AR^.codigo := '211005000000000000';
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
            SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('where "con$puc".CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := '211010000000000000';
            try
               ExecQuery;
               v6y12m := FieldByName('SALDO').AsCurrency;
            except
               MessageDlg('Error al Obtener valor de Mayor a 6 meses',mtError,[mbcancel],0);
               Transaction.Rollback;
               raise;
               Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
            SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
            SQL.Add('where "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
            SQL.Add('group by "con$puc".SALDOINICIAL');
            ParamByName('CODIGO').AsString := '211010000000000000';
            ParamByName('MES').AsString := Format('%.2d',[Monthof(EdFecha.Date)]);
            try
              ExecQuery;
              v6y12m := v6y12m + FieldByName('SALDO').AsCurrency;
//              Reporte.Variables.ByName['p6y12m'].AsDouble := -v6y12m;
            except
              MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
              Transaction.Rollback;
              raise;
              Exit;
            end;
            v6y12m := Tp6y12m - (-v6y12m);
//         Reporte.Variables.ByName['p6y12m'].AsDouble := Tp6y12m + (-v6y12m);
            if v6y12m <> 0 then begin
              New(AR);
              AR^.codigo := '211010000000000000';
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
            SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('where "con$puc".CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := '211015000000000000';
            try
               ExecQuery;
               v12y18m := FieldByName('SALDO').AsCurrency;
            except
               MessageDlg('Error al Obtener valor de Mayor a 6 meses',mtError,[mbcancel],0);
               Transaction.Rollback;
               raise;
               Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
            SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
            SQL.Add('where "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
            SQL.Add('group by "con$puc".SALDOINICIAL');
            ParamByName('CODIGO').AsString := '211015000000000000';
            ParamByName('MES').AsString := Format('%.2d',[Monthof(EdFecha.Date)]);
            try
              ExecQuery;
              v12y18m := v12y18m + FieldByName('SALDO').AsCurrency;
//              Reporte.Variables.ByName['p12y18m'].AsDouble := -v12y18m;
            except
              MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
              Transaction.Rollback;
              raise;
              Exit;
            end;
            v12y18m := Tp12y18m - (-v12y18m);
//          Reporte.Variables.ByName['p12y18m'].AsDouble := Tp12y18m + (-v12y18m);
            if v12y18m <> 0 then begin
              New(AR);
              AR^.codigo := '211015000000000000';
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
      vNocomprobanteAjuste := IntToStr(ObtenerConsecutivo(IBSQL1,4));
      // vNocomprobanteAjuste := IntToStr(ObtenerConsecutivoTmp(IBSQL1));
      EdComprobanteAjuste.Caption := Format('%.7d',[strtoint(vNocomprobanteAjuste)]);
      IBSQL1.Transaction.StartTransaction;
       with IBAplicar do
        try
          Close;
          sql.Clear;
          sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
          sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
          sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
          sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
          sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
          sql.Add('"con$comprobante"."ANULACION", "con$comprobante"."ID_EMPLEADO") ');
          sql.Add('values (');
          sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
          sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
          sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
          ParamByName('ID_COMPROBANTE').AsString:= vNocomprobanteAjuste;
          ParamByname('FECHADIA').AsDate := fFechaActual;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
          ParamByName('DESCRIPCION').AsString := ' Reclasificacion Certificados de Deposito Ahorro a Termino Mes' + ' ' + MesCorte + ' ' + 'Año' + ' ' + IntToStr(yearof(FechaCorte));
          ParamByName('TOTAL_DEBITO').AsCurrency  := ValorAjusteDeb;
          ParamByName('TOTAL_CREDITO').AsCurrency  := ValorAjusteCre;
          ParamByName('ESTADO').AsString  := 'O';
          ParamByname('ANULACION').asstring := '';
          ParamByName('IMPRESO').AsInteger  := 1;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          ExecQuery;
          Close;

          for I := 0 to Lista.Count -1 do
           begin
             Application.ProcessMessages;
             AR := Lista.Items[I];
             SQL.Clear;
             SQL.Add('insert into "con$auxiliar" values (');
             SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
             SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
             SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
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
             ExecQuery;
             Close;
           end;

          IBAplicar.Transaction.Commit;
        except
          MessageDlg('Error Grabando Ajuste de CDAT',mtError,[mbok],0);
          IBAplicar.Transaction.Rollback;
          Exit;
        end;
    end
    else begin
      vNocomprobanteAjuste := '0';
      EdComprobanteAjuste.Caption := '0';
    end;
// Fin comprobante Edades CDAT
   end;
   CmdComprobante.Enabled := True;
}

// fin Aplicar Ajuste
end;

procedure Tfrmcausacioncdat.CmdComprobanteClick(Sender: TObject);
begin
        with IBComprobante do
        begin
             if Transaction.InTransaction then
               Transaction.Rollback;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
             SQL.Add('"con$comprobante".FECHADIA,');
             SQL.Add('"con$comprobante".DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('"con$auxiliar".CODIGO,');
             SQL.Add('"con$puc".NOMBRE AS CUENTA,');
             SQL.Add('"con$auxiliar".DEBITO,');
             SQL.Add('"con$auxiliar".CREDITO');
             SQL.Add('from ');
             SQL.Add('"con$comprobante" ');
             SQL.Add('INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
             SQL.Add('INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('("con$comprobante".ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(vNocomprobanteCausacion);
             Open;
        end;

        with IBComprobanteAjuste do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
             SQL.Add('"con$comprobante".FECHADIA,');
             SQL.Add('"con$comprobante".DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('"con$auxiliar".CODIGO,');
             SQL.Add('"con$puc".NOMBRE AS CUENTA,');
             SQL.Add('"con$auxiliar".DEBITO,');
             SQL.Add('"con$auxiliar".CREDITO');
             SQL.Add('from ');
             SQL.Add('"con$comprobante" ');
             SQL.Add('INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_AGENCIA = "con$auxiliar".ID_AGENCIA and "con$comprobante".TIPO_COMPROBANTE = "con$auxiliar".TIPO_COMPROBANTE and "con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
             SQL.Add('INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('("con$comprobante".ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE") and');
             SQL.Add('("con$comprobante".TIPO_COMPROBANTE = :"TIPO_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(vNocomprobanteAjuste);
             ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
             try
              Open;

              if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
              Close;
             except
               MessageDlg('Error generando el comprobante',mtError,[mbcancel],0);
               Close;
             end;
        end;
        IBComprobante.Close;


end;

procedure Tfrmcausacioncdat.EdFechaExit(Sender: TObject);
begin
        FechaCorte := EdFecha.Date;
end;

procedure Tfrmcausacioncdat.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;

        IBSeleccionar.Database := dmGeneral.IBDatabase1;
        IBAplicar.Database := dmGeneral.IBDatabase1;
        IBLiquidar.Database := dmGeneral.IBDatabase1;
        IBTotalCaptaciones.Database := dmGeneral.IBDatabase1;
        IBALiquidar.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBDataSet1.Database := dmGeneral.IBDatabase1;
        IBReporteTmp.Database := dmGeneral.IBDatabase1;
        IBComprobante.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBReporte.Database := dmGeneral.IBDatabase1;
        IBComprobanteAjuste.Database := dmGeneral.IBDatabase1;


        IBSeleccionar.Transaction := dmGeneral.IBTransaction1;
        IBAplicar.Transaction := dmGeneral.IBTransaction1;
        IBLiquidar.Transaction := dmGeneral.IBTransaction1;
        IBTotalCaptaciones.Transaction := dmGeneral.IBTransaction1;
        IBALiquidar.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBDataSet1.Transaction := dmGeneral.IBTransaction1;
        IBReporteTmp.Transaction := dmGeneral.IBTransaction1;
        IBComprobante.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBReporte.Transaction := dmGeneral.IBTransaction1;
        IBComprobanteAjuste.Transaction := dmGeneral.IBTransaction1;


        Lista := TList.Create;
end;

end.
