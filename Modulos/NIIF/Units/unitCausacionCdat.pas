unit unitCausacionCdat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, IBSQL, Math,
  pr_TxClasses, UnitPantallaProgreso, DB, IBCustomDataSet, IBStoredProc,
  IBQuery, pr_Common, DateUtils;

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
    IBReporte: TIBQuery;
    IBReporteID_AGENCIA: TSmallintField;
    IBReporteID_TIPO_CAPTACION: TSmallintField;
    IBReporteNUMERO_CUENTA: TIntegerField;
    IBReporteDIGITO_CUENTA: TSmallintField;
    IBReporteVALOR_INICIAL: TIBBCDField;
    IBReporteFECHA_APERTURA: TDateField;
    IBReportePLAZO_CUENTA: TIntegerField;
    IBReporteTIPO_INTERES: TIBStringField;
    IBReporteID_INTERES: TSmallintField;
    IBReporteTASA_EFECTIVA: TFloatField;
    IBReportePUNTOS_ADICIONALES: TFloatField;
    IBReporteMODALIDAD: TIBStringField;
    IBReporteAMORTIZACION: TIntegerField;
    IBReporteID_ESTADO: TSmallintField;
    IBReporteFECHA_VENCIMIENTO: TDateField;
    IBReporteFECHA_ULTIMO_PAGO: TDateField;
    IBReporteFECHA_PROXIMO_PAGO: TDateField;
    IBReporteFECHA_PRORROGA: TDateField;
    IBReporteID_TIPO_CAPTACION_ABONO: TSmallintField;
    IBReporteNUMERO_CUENTA_ABONO: TIntegerField;
    IBReporteID_IDENTIFICACION: TSmallintField;
    IBReporteID_PERSONA: TIBStringField;
    IBReportePRIMER_APELLIDO: TIBStringField;
    IBReporteSEGUNDO_APELLIDO: TIBStringField;
    IBReporteNOMBRE: TIBStringField;
    IBReporteDIAS: TIntegerField;
    IBReporteVALOR: TIBBCDField;
    CmdComprobante: TBitBtn;
    Label4: TLabel;
    EdComprobante: TStaticText;
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
    ReporteC: TprTxReport;
    Reporte: TprTxReport;
    procedure CmdLiquidarClick(Sender: TObject);
    procedure RadioTipoLiquidacionClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure CmdComprobanteClick(Sender: TObject);
    procedure EdFechaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcausacioncdat: Tfrmcausacioncdat;
  frmProgreso:TfrmProgreso;
  Liquidado:Boolean;
  FechaCorte:TDate;
  vNocomprobante : string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitGlobalesCol;

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
begin
        FechaCorte := EdFecha.Date;
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
                 SQL.Add('ID_TIPO_CAPTACION_ABONO, NUMERO_CUENTA_ABONO, ID_IDENTIFICACION, ID_PERSONA, PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE, DIAS, VALOR, TASA_E) values (');
                 sql.Add(':"ID_AGENCIA", :"ID_TIPO_CAPTACION", :"NUMERO_CUENTA", :"DIGITO_CUENTA",');
                 sql.Add(':"VALOR_INICIAL", :"FECHA_APERTURA", :"PLAZO_CUENTA", :"TIPO_INTERES",');
                 sql.Add(':"ID_INTERES", :"TASA_EFECTIVA", :"PUNTOS_ADICIONALES", :"MODALIDAD",');
                 sql.Add(':"AMORTIZACION", :"ID_ESTADO", :"FECHA_VENCIMIENTO", :"FECHA_ULTIMO_PAGO",');
                 sql.Add(':"FECHA_PROXIMO_PAGO", :"FECHA_PRORROGA", :"ID_TIPO_CAPTACION_ABONO",');
                 SQL.Add(':"NUMERO_CUENTA_ABONO", :"ID_IDENTIFICACION", :"ID_PERSONA", :"PRIMER_APELLIDO",');
                 SQL.Add(':"SEGUNDO_APELLIDO", :"NOMBRE", :"DIAS", :"VALOR", :"TASA_E")');
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
                 ParamByName('VALOR').AsCurrency := 0;
                 parambyname('TASA_E').AsCurrency := 0;
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
                  with IBLiquidar do
                   begin
                     Close;
                     SQL.Clear;
                     SQL.Add('update "cap$causacioncdattmp" set DIAS = :DIAS, VALOR =:VALOR, FECHA_ULTIMO_PAGO = :FECHA_ULTIMO_PAGO, TASA_E = :TASA_E');
                     SQL.Add('where ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                     SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                     ParamByName('ID_TIPO_CAPTACION').AsInteger := 6;
                     ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                     parambyname('DIAS').AsInteger := Dias;
                     parambyname('VALOR').AsCurrency := ValorIntereses;
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
        EdFecha.Date := Date;
        Liquidado := False;
end;

procedure Tfrmcausacioncdat.CmdVerClick(Sender: TObject);
begin
        with IBReporte do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "cap$causacioncdattmp"');
           SQL.Add('order by NUMERO_CUENTA');
           Open;

           Reporte.Variables.ByName['Empresa'].AsString := Empresa;
           Reporte.Variables.ByName['FechaCorte'].AsDateTime := FechaCorte;


           if Reporte.PrepareReport then
              Reporte.PreviewPreparedReport(True);

           Close;
         end;
end;

procedure Tfrmcausacioncdat.CmdAplicarClick(Sender: TObject);
var
MesCorte : string;
CodigoGasto : string;
CodigoInteres : string;
SaldoInicialInteres : Currency;
MovimientoInteres : Currency;
TotalInteres : Currency;
ValorACausar : Currency;
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
             SQL.Add(':"VALOR",');
             SQL.Add(':"ANO",');
             SQL.Add(':"MES",');
             SQL.Add(':"TASA_E");');

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
             ParamByName('VALOR').AsCurrency := IBSeleccionar.FieldByName('VALOR').AsCurrency;
             ParamByName('ANO').AsInteger := YearOf(FechaCorte);
             ParamByName('MES').AsInteger := monthof(FechaCorte);
             ParamByName('TASA_E').AsCurrency := IBSeleccionar.FieldByName('TASA_E').AsCurrency;
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
       ParamByName('MES').AsInteger := MonthOf(FechaCorte);
       ExecQuery;
       MovimientoInteres := FieldByName('DEBITO').AsCurrency - FieldByName('CREDITO').AsCurrency;
       Close;

       TotalInteres := SaldoInicialInteres + MovimientoInteres;

       SQL.Clear;
       SQL.Add('select sum(VALOR) as VALOR from "cap$causacioncdattmp"');
       ExecQuery;
       ValorACausar := FieldByName('VALOR').AsCurrency;
       Close;

       ValorACausar := ValorACausar - (-TotalInteres);



       vNocomprobante := IntToStr(ObtenerConsecutivo(IBSQL1,1));

       EdComprobante.Caption := Format('%.7d',[strtoint(vNocomprobante)]);
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
        ParamByName('ID_COMPROBANTE').AsString:= vNocomprobante;
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
        ExecQuery;
        Close;

        SQL.Clear;
        SQL.Add('insert into "con$auxiliar" values (');
        SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
        SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
        SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
        ParamByName('ID_COMPROBANTE').AsString := vNoComprobante;
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
        ExecQuery;
        Close;

        SQL.Clear;
        SQL.Add('insert into "con$auxiliar" values (');
        SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
        SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
        SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
        ParamByName('ID_COMPROBANTE').AsString := vNoComprobante;
        ParamByName('ID_AGENCIA').AsInteger:= Agencia;
        ParamByName('FECHA').AsDate := fFechaActual;
        ParamByName('CODIGO').AsString := CodigoInteres;
        ParamByName('DEBITO').AsCurrency := 0;
        ParamByName('CREDITO').AsCurrency := ValorACausar;
        ParamByName('ID_CUENTA').AsInteger := 0;
        ParamByName('ID_COLOCACION').AsString := '';
        ParamByName('ID_IDENTIFICACION').AsInteger := 0;
        ParamByName('ID_PERSONA').AsString := '';
        ParamByName('MONTO_RETENCION').AsCurrency := 0;
        ParamByName('TASA_RETENCION').AsFloat := 0;
        ParamByName('ESTADOAUX').AsString := 'O';
        ExecQuery;
        IBAplicar.Transaction.Commit;
        CmdComprobante.Enabled := True;
      except
        MessageDlg('Error Grabando Intereses de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbok],0);
        IBAplicar.Transaction.Rollback;
        Exit;
      end;
end;

procedure Tfrmcausacioncdat.CmdComprobanteClick(Sender: TObject);
begin
        with IBComprobante do
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
             SQL.Add('INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
             SQL.Add('INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('("con$comprobante".ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(vnoComprobante);
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

end;

procedure Tfrmcausacioncdat.EdFechaExit(Sender: TObject);
begin
        FechaCorte := EdFecha.Date;
end;

end.
