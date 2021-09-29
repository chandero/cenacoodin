unit UnitExtractoCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, DBClient, IBDatabase, Math, Grids,
  XStringGrid, DBGrids, UnitDmGeneral;

type
  TfrmExtractoCredito = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    EdAgencia: TDBLookupComboBox;
    EdNumeroColocacion: TMaskEdit;
    IBQExtractoCol: TIBQuery;
    IBQuery: TIBQuery;
    IBQCol: TIBQuery;
    IBQTabla: TIBQuery;
    IBQuery1: TIBQuery;
    IBQuery1FECHA_A_PAGAR: TDateField;
    IBQuery1CAPITAL_A_PAGAR: TIBBCDField;
    CmdNuevo: TBitBtn;
    Extracto: TClientDataSet;
    ExtractoFECHA: TDateField;
    ExtractoNO_COMP: TIntegerField;
    ExtractoCUOTA: TIntegerField;
    ExtractoTASA: TFloatField;
    ExtractoINTERES: TStringField;
    ExtractoCAPITAL: TStringField;
    ExtractoSALDO: TStringField;
    ExtractoCAPITAL_VENC: TStringField;
    ExtractoINTERES_PAGO_HASTA: TDateField;
    ExtractoCAPITAL_PAGO_HASTA: TDateField;
    DSAgencia: TDataSource;
    IBAgencia: TIBQuery;
    IBTExtracto: TIBTransaction;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label30: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label19: TLabel;
    EdValorCuota: TStaticText;
    EdClasificacion: TStaticText;
    EdLinea: TStaticText;
    EdInversion: TStaticText;
    EdRespaldo: TStaticText;
    EdGarantia: TStaticText;
    EdFechaColocacion: TStaticText;
    EdValorColocacion: TStaticText;
    EdPlazo: TStaticText;
    EdTipoTasa: TStaticText;
    EdTasaVariable: TStaticText;
    EdPuntos: TStaticText;
    EdTasaEfectiva: TStaticText;
    EdTipoCuota: TStaticText;
    EdAmortizaCapital: TStaticText;
    EdAmortizaInteres: TStaticText;
    EdSaldoColocacion: TStaticText;
    EdTasaMaxima: TStaticText;
    EdTasaNominal: TStaticText;
    EdDiasProrroga: TStaticText;
    EdTasaMaximaNominal: TStaticText;
    EdFechaCapital: TStaticText;
    EdFechaInteres: TStaticText;
    EdTotalCuotas: TStaticText;
    EdAsociado: TStaticText;
    Asociado: TLabel;
    IBQuery2: TIBQuery;
    DSExtracto: TDataSource;
    DBGrid1: TDBGrid;
    ExtractoCONSNAL: TBooleanField;
    ExtractoFECHA_CONS: TDateField;
    IBQExtractoColID_AGENCIA: TSmallintField;
    IBQExtractoColID_CBTE_COLOCACION: TIntegerField;
    IBQExtractoColID_COLOCACION: TIBStringField;
    IBQExtractoColFECHA_EXTRACTO: TDateField;
    IBQExtractoColHORA_EXTRACTO: TTimeField;
    IBQExtractoColCUOTA_EXTRACTO: TIntegerField;
    IBQExtractoColTIPO_OPERACION: TSmallintField;
    IBQExtractoColSALDO_ANTERIOR_EXTRACTO: TIBBCDField;
    IBQExtractoColABONO_CAPITAL: TIBBCDField;
    IBQExtractoColABONO_CXC: TIBBCDField;
    IBQExtractoColABONO_ANTICIPADO: TIBBCDField;
    IBQExtractoColABONO_SERVICIOS: TIBBCDField;
    IBQExtractoColABONO_MORA: TIBBCDField;
    IBQExtractoColABONO_SEGURO: TIBBCDField;
    IBQExtractoColABONO_PAGXCLI: TIBBCDField;
    IBQExtractoColABONO_HONORARIOS: TIBBCDField;
    IBQExtractoColABONO_OTROS: TIBBCDField;
    IBQExtractoColTASA_INTERES_LIQUIDACION: TFloatField;
    IBQExtractoColID_EMPLEADO: TIBStringField;
    IBQExtractoColINTERES_PAGO_HASTA: TDateField;
    IBQExtractoColCAPITAL_PAGO_HASTA: TDateField;
    IBQExtractoColTIPO_ABONO: TSmallintField;
    IBQExtractoColFECHA_A_PAGAR: TDateField;
    IBQExtractoColCAPITAL_A_PAGAR: TIBBCDField;
    IBQExtractoColINTERES_A_PAGAR: TIBBCDField;
    IBQExtractoColFECHA_CONSIGNACION: TDateField;
    DBCheckBox1: TDBCheckBox;
    Report: TprTxReport;
    IBQuery3: TIBQuery;
    ReporExtractoCol: TprTxReport;
    ExtractoFECHA_VENC: TStringField;
    IBQColID_AGENCIA: TSmallintField;
    IBQColID_COLOCACION: TIBStringField;
    IBQColID_IDENTIFICACION: TSmallintField;
    IBQColID_PERSONA: TIBStringField;
    IBQColFECHA_DESEMBOLSO: TDateField;
    IBQColVALOR_DESEMBOLSO: TIBBCDField;
    IBQColID_CLASIFICACION: TSmallintField;
    IBQColABONOS_CAPITAL: TIBBCDField;
    IBQColSALDO_ACTUAL: TIBBCDField;
    IBQColPLAZO_COLOCACION: TIntegerField;
    IBQColFECHA_VENCIMIENTO: TDateField;
    IBQColTIPO_INTERES: TIBStringField;
    IBQColDESCRIPCION_TASA: TIBStringField;
    IBQColVALOR_ACTUAL_TASA: TFloatField;
    IBQColTASA_INTERES_CORRIENTE: TFloatField;
    IBQColTASA_INTERES_MORA: TFloatField;
    IBQColPUNTOS_INTERES: TFloatField;
    IBQColAMORTIZA_CAPITAL: TIntegerField;
    IBQColAMORTIZA_INTERES: TIntegerField;
    IBQColPERIODO_GRACIA: TIntegerField;
    IBQColDIAS_PRORROGADOS: TIntegerField;
    IBQColVALOR_CUOTA: TIBBCDField;
    IBQColNUMERO_CUENTA: TIntegerField;
    IBQColCAPITAL: TIBStringField;
    IBQColINTERES: TIBStringField;
    IBQColTIPO_CUOTA: TIBStringField;
    IBQColFECHA_CAPITAL: TDateField;
    IBQColFECHA_INTERES: TDateField;
    IBQColDESCRIPCION_ESTADO_COLOCACION: TIBStringField;
    IBQColES_PREJURIDICO: TSmallintField;
    IBQColES_JURIDICO: TSmallintField;
    IBQColES_CASTIGADO: TSmallintField;
    IBQColES_NOVISADO: TSmallintField;
    IBQColES_ANULADO: TSmallintField;
    IBQColES_CANCELADO: TSmallintField;
    IBQColDESCRIPCION_CLASIFICACION: TIBStringField;
    IBQColDESCRIPCION_INVERSION: TIBStringField;
    IBQColDESCRIPCION_LINEA: TIBStringField;
    IBQColDESCRIPCION_RESPALDO: TIBStringField;
    IBQColDESCRIPCION_GARANTIA: TIBStringField;
    IBQColDESCRIPCION_TIPO_CUOTA: TIBStringField;
    IBQColNOMBRE: TIBStringField;
    IBQColPRIMER_APELLIDO: TIBStringField;
    IBQColSEGUNDO_APELLIDO: TIBStringField;
    IBQColDESCRIPCION_IDENTIFICACION: TIBStringField;
    IBQAgencia: TIBQuery;
    DataSource1: TDataSource;
    procedure EdAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroColocacionEnter(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    AgC : Integer;
    Col : string;
    procedure MostrarExtracto;
    procedure Inicializar;
    { Private declarations }
  public
    property AgenciaC : Integer read agc Write agc;
    property Colocacion : string read col Write col;
    { Public declarations }
  end;

var
  frmExtractoCredito: TfrmExtractoCredito;
  dmGeneral: TdmGeneral;
  vcolocacion : string;
  vComprobante : string;
  Fecha : TDate;
  CapitalHasta : TDate;
  InteresHasta : TDate;
  SaldoAnterior : Currency;
  Alias : string;
  vTipoId : Integer;
  vNumeroId : string;
  Cuota : Integer;
  Nuevosaldo : Currency;
  FechaaPagar: TDate;
  Intereses:Currency;
  TotalAbonoCapital : Currency;
  TasaNominal       : Double;
  NumeroCuenta:Integer;
  Identificacion : string;
implementation

{$R *.dfm}

uses UnitVistaPreliminar, UnitGlobales, UnitGlobalesCol;

procedure TfrmExtractoCredito.EdAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmExtractoCredito.EdNumeroColocacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmExtractoCredito.EdNumeroColocacionExit(Sender: TObject);
begin
        vcolocacion := trim(EdNumeroColocacion.Text);
        MostrarExtracto;
end;

procedure TfrmExtractoCredito.CmdAceptarClick(Sender: TObject);
begin
             Empleado;
             ReporExtractocol.Variables.ByName['Empresa'].AsString := Empresa;
             ReporExtractoCol.Variables.ByName['Nit'].AsString := Nit;
             ReporExtractoCol.Variables.ByName['Hoy'].AsDateTime := fFechaActual;
             ReporExtractoCol.Variables.ByName['Intereses'].AsDouble := Intereses;
             ReporExtractoCol.Variables.ByName['TotalAbonoCapital'].AsDouble := TotalAbonoCapital;
             ReporExtractoCol.Variables.ByName['empleado'].AsString := Nombres + ' ' + Apellidos;
             ReporExtractoCol.Variables.ByName['TasaNominal'].AsDouble := TasaNominal;
             ReporExtractoCol.Variables.ByName['Cuenta'].AsInteger := NumeroCuenta;
             ReporExtractoCol.Variables.ByName['Identificacion'].AsString := Identificacion;

             if ReporExtractoCol.PrepareReport then
              begin
                frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
                frmVistaPreliminar.Reporte := ReporExtractoCol;
                frmVistaPreliminar.Vista.Font.Size := 8;
                frmVistaPreliminar.ShowModal;
              end;
        CmdNuevo.SetFocus;
end;

procedure TfrmExtractoCredito.MostrarExtracto;
var
Cuotas : string;
InteresAnticipado : Currency;
InteresCorriente  : Currency;
InteresServicios  : Currency;
InteresMora       : Currency;
SaldoActual       : Currency;
SaldoAnterior     : Currency;
TasaEfectiva      : Double;
TasaAplicada      : Double;
frmVistaPreliminar:TfrmVistaPreliminar;
Tabla : String;
Conteo : Integer;
begin
    GroupBox1.Enabled := False;
    Empleado;
    Intereses := 0;
    Conteo := 0;
    with IBQCol do begin
      SQL.Clear;
      SQL.Add('SELECT ');
      SQL.Add('"col$colocacion".ID_AGENCIA,');
      SQL.Add('"col$colocacion".ID_COLOCACION,');
      SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
      SQL.Add('"col$colocacion".ID_PERSONA,');
      SQL.Add('"col$colocacion".ID_CLASIFICACION,');
      SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
      SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
      SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
      SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO_ACTUAL,');
      SQL.Add('"col$colocacion".PLAZO_COLOCACION,');
      SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
      SQL.Add('"col$colocacion".TIPO_INTERES,');
      SQL.Add('"col$tasasvariables".DESCRIPCION_TASA,');
      SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
      SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
      SQL.Add('"col$colocacion".TASA_INTERES_MORA,');
      SQL.Add('"col$colocacion".PUNTOS_INTERES,');
      SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
      SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
      SQL.Add('"col$colocacion".PERIODO_GRACIA,');
      SQL.Add('"col$colocacion".DIAS_PRORROGADOS,') ;
      SQL.Add('"col$colocacion".VALOR_CUOTA,');
      SQL.Add('"col$colocacion".NUMERO_CUENTA,');
      SQL.Add('"col$tiposcuota".CAPITAL,');
      SQL.Add('"col$tiposcuota".INTERES,');
      SQL.Add('"col$tiposcuota".TIPO_CUOTA,');
      SQL.Add('"col$colocacion".FECHA_CAPITAL,');
      SQL.Add('"col$colocacion".FECHA_INTERES,');
      SQL.Add('"col$enteaprobador"."DESCRIPCION_ENTE_APROBADOR",');
      SQL.Add('"col$colocacion"."NOTA_CONTABLE",');
      SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
      SQL.Add('"col$estado".ES_PREJURIDICO,');
      SQL.Add('"col$estado".ES_JURIDICO,');
      SQL.Add('"col$estado".ES_CASTIGADO,');
      SQL.Add('"col$estado".ES_NOVISADO,');
      SQL.Add('"col$estado".ES_ANULADO,');
      SQL.Add('"col$estado".ES_CANCELADO,');
      SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
      SQL.Add('"col$inversion".DESCRIPCION_INVERSION,');
      SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
      SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,');
      SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
      SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
      SQL.Add('"gen$persona".NOMBRE,');
      SQL.Add('"gen$persona".PRIMER_APELLIDO,');
      SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
      SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION ');
      SQL.Add(' FROM ');
      SQL.Add('"col$colocacion" ');
      SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION) ');
      SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION) ');
      SQL.Add('INNER JOIN "col$enteaprobador" ON ("col$colocacion".ID_ENTE_APROBADOR = "col$enteaprobador".ID_ENTE_APROBADOR) ');
      SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO) ');
      SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION) ');
      SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA) ');
      SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA) ');
      SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
      SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
      SQL.Add('LEFT OUTER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) ');
      SQL.Add(' JOIN "gen$tiposidentificacion" ON ("col$colocacion".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION) ');
      SQL.Add(' WHERE ');
      SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
      SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');
      ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
      ParamByName('ID_COLOCACION').AsString := vcolocacion;
      Open;

      if RecordCount > 0 then begin
          TotalAbonoCapital := FieldByName('ABONOS_CAPITAL').AsCurrency;
          EdAsociado.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
          EdClasificacion.Caption := FieldByName('DESCRIPCION_CLASIFICACION').AsString ;
          EdLinea.Caption := FieldByName('DESCRIPCION_LINEA').AsString ;
          EdInversion.Caption := FieldByName('DESCRIPCION_INVERSION').AsString ;
          EdRespaldo.Caption := FieldByName('DESCRIPCION_RESPALDO').AsString;
          EdGarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString ;
          EdFechaColocacion.Caption := DateToStr(FieldByName('FECHA_DESEMBOLSO').AsFloat);
          EdValorColocacion.Caption := FormatCurr('#,#0.00',FieldByName('VALOR_DESEMBOLSO').AsCurrency);
          EdSaldoColocacion.Caption := FormatCurr('#,#0.00',FieldByName('SALDO_ACTUAL').AsCurrency);
          EdPlazo.Caption := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
          NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
          Identificacion := FieldByName('ID_PERSONA').AsString;
          //tipo tasa
          if FieldByName('TIPO_INTERES').AsString = 'F' then
             EdTipoTasa.Caption := 'FIJA'
          else
             EdTipoTasa.Caption := 'VARIABLE';
          EdTasaVariable.Caption := FieldByName('DESCRIPCION_TASA').AsString ;
          EdPuntos.Caption := FormatCurr('#0.00',FieldByName('PUNTOS_INTERES').AsFloat);
          if FieldByName('TIPO_INTERES').AsString = 'F' then
            begin
              EdTasaEfectiva.Caption := FormatCurr('#0.00%',FieldByName('TASA_INTERES_CORRIENTE').AsFloat);
              TasaEfectiva :=FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
            end
           else
            begin
              EdTasaEfectiva.Caption := ''; //FormatCurr('#0.00%',FieldByName('VALOR_ACTUAL_TASA').AsFloat); // + FieldByName('PUNTOS_INTERES').AsFloat);
              TasaAplicada := TasaNominalAnticipada(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat;
              TasaEfectiva := FieldByName('VALOR_ACTUAL_TASA').AsFloat; // + FieldByName('PUNTOS_INTERES').AsFloat;
            end;
          EdNumeroColocacion.Text := vcolocacion;
          EdTipoCuota.Caption := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
          EdAmortizaCapital.Caption := IntToStr(FieldByName('AMORTIZA_CAPITAL').AsInteger);
          EdAmortizaInteres.Caption := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
          EdDiasProrroga.Caption := IntToStr(FieldByName('DIAS_PRORROGADOS').AsInteger);
          EdValorCuota.Caption := FormatCurr('#,#0',FieldByName('VALOR_CUOTA').AsCurrency);
          FechaKant := FieldByname('FECHA_CAPITAL').AsDateTime;
          EdFechaCapital.Caption := DateToStr(Fechakant);
          EdFechaInteres.Caption := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
          EdTasaMaxima.Caption := FormatCurr('#0.00%',BuscoTasaEfectivaMaxima(Date,IBQCol.FieldByName('ID_CLASIFICACION').AsInteger,'A'));
          EdTasaVariable.Caption := FieldByName('DESCRIPCION_TASA').AsString ;
          Self.Caption := 'Extracto de Colocación - Estado:' + FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;

          if FieldByName('INTERES').AsString = 'V' then
            begin
              EdTasaMaximaNominal.Caption := FormatCurr('#0.00%',(TasaNominalVencida(BuscoTasaEfectivaMaxima(Date,FieldByName('ID_CLASIFICACION').AsInteger,'A'),FieldByName('AMORTIZA_INTERES').AsInteger)+FieldByName('PUNTOS_INTERES').AsFloat) );
              TasaAplicada := TasaNominalVencida(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat;
              EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
            end
          else
            begin
              EdTasaMaximaNominal.Caption := FormatCurr('#0.00%',TasaNominalAnticipada(BuscoTasaEfectivaMaxima(Date,FieldByName('ID_CLASIFICACION').AsInteger,'A'),FieldByName('AMORTIZA_INTERES').AsInteger));
              TasaAplicada := TasaNominalAnticipada(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat;
              EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
            end;
          vTasa := TasaAplicada;

//          Close;

          IBQuery2.SQL.Clear;
          IBQuery2.SQL.Add('select count(*) as CUOTAS from "col$tablaliquidacion" where ');
          IBQuery2.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and');
          IBQuery2.SQL.Add('PAGADA = 0');
          IBQuery2.ParamByName('ID_AGENCIA').AsInteger := Agencia;
          IBQuery2.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
          IBQuery2.Open;
          EdTotalCuotas.Caption := IntTostr(IBQuery2.FieldByName('CUOTAS').AsInteger);
          IBQuery2.Close;


          if FieldByName('INTERES').AsString = 'A' then
             TasaNominal := TasaNominalAnticipada(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger)
          else
             TasaNominal := TasaNominalVencida(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger);

//          if IBQCol.RecordCount > 0 then begin
           with IBQExtractoCol do begin
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"col$extracto".ID_AGENCIA,');
             SQL.Add('"col$extracto".ID_CBTE_COLOCACION,');
             SQL.Add('"col$extracto".ID_COLOCACION,');
             SQL.Add('"col$extracto".FECHA_EXTRACTO,');
             SQL.Add('"col$extracto".HORA_EXTRACTO,');
             SQL.Add('"col$extracto".CUOTA_EXTRACTO,');
             SQL.Add('"col$extracto".TIPO_OPERACION,');
             SQL.Add('"col$extracto".SALDO_ANTERIOR_EXTRACTO,');
             SQL.Add('"col$extracto".ABONO_CAPITAL,');
             SQL.Add('"col$extracto".ABONO_CXC,');
             SQL.Add('"col$extracto".ABONO_ANTICIPADO,');
             SQL.Add('"col$extracto".ABONO_SERVICIOS,');
             SQL.Add('"col$extracto".ABONO_MORA,');
             SQL.Add('"col$extracto".ABONO_SEGURO,');
             SQL.Add('"col$extracto".ABONO_PAGXCLI,');
             SQL.Add('"col$extracto".ABONO_HONORARIOS,');
             SQL.Add('"col$extracto".ABONO_OTROS,');
             SQL.Add('"col$extracto".TASA_INTERES_LIQUIDACION,');
             SQL.Add('"col$extracto".ID_EMPLEADO,');
             SQL.Add('"col$extracto".INTERES_PAGO_HASTA,');
             SQL.Add('"col$extracto".CAPITAL_PAGO_HASTA,');
             SQL.Add('"col$extracto".TIPO_ABONO,');
             SQL.Add('"col$tablaliquidacion".FECHA_A_PAGAR,');
             SQL.Add('"col$tablaliquidacion".CAPITAL_A_PAGAR,');
             SQL.Add('"col$tablaliquidacion".INTERES_A_PAGAR,');
             SQL.Add('"col$pagoconnal".FECHA_CONSIGNACION');
             SQL.Add('FROM ');
             SQL.Add('"col$extracto" LEFT JOIN "col$tablaliquidacion" ON ');
             SQL.Add('("col$extracto".ID_AGENCIA = "col$tablaliquidacion".ID_AGENCIA) AND');
             SQL.Add('("col$extracto".ID_COLOCACION = "col$tablaliquidacion".ID_COLOCACION) AND');
             SQL.Add('("col$tablaliquidacion".CUOTA_NUMERO = "col$extracto".CUOTA_EXTRACTO)');
             SQL.Add('LEFT JOIN "col$pagoconnal" on ("col$extracto".ID_AGENCIA = "col$pagoconnal".ID_AGENCIA and');
             SQL.Add('"col$extracto".ID_COLOCACION = "col$pagoconnal".ID_COLOCACION and');
             SQL.Add('"col$extracto".ID_CBTE_COLOCACION = "col$pagoconnal".ID_CBTE_COLOCACION and');
             SQL.Add('"col$extracto".FECHA_EXTRACTO = "col$pagoconnal".FECHA_EXTRACTO)');
             SQL.Add(' WHERE ');
             SQL.Add('("col$extracto".ID_AGENCIA =:"ID_AGENCIA") AND');
             SQL.Add('("col$extracto".ID_COLOCACION =:"ID_COLOCACION")');
             SQL.Add(' ORDER BY "col$extracto".FECHA_EXTRACTO,"col$extracto".HORA_EXTRACTO, "col$extracto".CUOTA_EXTRACTO,"col$extracto".SALDO_ANTERIOR_EXTRACTO');

             ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
             ParamByName('ID_COLOCACION').AsString := vcolocacion;
             Open;

             While not IBQExtractocol.Eof do begin
                Extracto.Append;
                Extracto.FieldByName('FECHA').AsDateTime  := IBQExtractocol.FieldByName('FECHA_EXTRACTO').AsDateTime;
                Extracto.FieldByName('NO_COMP').AsInteger := IBQExtractocol.FieldByName('ID_CBTE_COLOCACION').AsInteger;
                Extracto.FieldByName('CUOTA').AsInteger := IBQExtractocol.FieldByName('CUOTA_EXTRACTO').AsInteger;
                Extracto.FieldByName('CAPITAL').AsString := FormatCurr('#,##0.00',IBQExtractocol.FieldByName('ABONO_CAPITAL').AsCurrency);
                Extracto.FieldByName('TASA').AsFloat := SimpleRoundTo(IBQExtractocol.FieldByName('TASA_INTERES_LIQUIDACION').AsFloat);
                if IBQExtractoCol.FieldByName('TIPO_ABONO').AsInteger <> 0 then begin
                   Extracto.FieldByName('INTERES').AsString := '-(' + FormatCurr('#,##0.00',IBQExtractocol.FieldByName('ABONO_ANTICIPADO').AsCurrency) + ')';
                end
                else
                   begin
                     Extracto.FieldByName('INTERES').AsString := FormatCurr('#,##0.00',IBQExtractocol.FieldByName('ABONO_ANTICIPADO').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_SERVICIOS').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_CXC').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_MORA').AsCurrency);
                     Intereses := Intereses + (IBQExtractocol.FieldByName('ABONO_ANTICIPADO').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_SERVICIOS').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_CXC').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_MORA').AsCurrency);
                   end;
                Extracto.FieldByName('SALDO').AsString := FormatCurr('#,##0.00',IBQExtractocol.FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency - IBQExtractocol.FieldByName('ABONO_CAPITAL').AsCurrency);
                if IBQExtractocol.FieldByName('CUOTA_EXTRACTO').AsInteger = 0 then
                 begin
                   Extracto.FieldByName('FECHA_VENC').AsString := '0000/00/00';
                   Extracto.FieldByName('CAPITAL_VENC').AsString := FormatCurr('#,##0.00',0);
                 end
                else
                 begin
                   Extracto.FieldByName('FECHA_VENC').AsString := DateToStr(IBQExtractocol.FieldByName('FECHA_A_PAGAR').AsDateTime);
                   Extracto.FieldByName('CAPITAL_VENC').AsString := FormatCurr('#,##0.00',IBQExtractocol.FieldByName('CAPITAL_A_PAGAR').AsCurrency + IBQExtractocol.FieldByName('INTERES_A_PAGAR').AsCurrency);
                 end;
                IBQuery1.Close;
                Extracto.FieldByName('INTERES_PAGO_HASTA').AsDateTime := IBQExtractocol.FieldByName('INTERES_PAGO_HASTA').AsDateTime;
                Extracto.FieldByName('CAPITAL_PAGO_HASTA').AsDateTime := IBQExtractocol.FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;
                if IBQExtractoCol.FieldByName('FECHA_CONSIGNACION').AsDateTime <> 0 then begin
                   Extracto.FieldByName('CONSNAL').AsBoolean := True;
                   Extracto.FieldByName('FECHA_CONS').AsDateTime := IBQExtractoCol.FieldByName('FECHA_CONSIGNACION').AsDateTime;
                end
                else begin
                   Extracto.FieldByName('CONSNAL').AsBoolean := False;
                   Extracto.FieldByName('FECHA_CONS').Clear;
                end;
                Extracto.Post;
                IBQExtractoCol.Next;
             end; // While ExtractoCol
             Close;

            IBQExtractocol.Close;
           end; // with ExtractoCol
          IBQcol.Close;
      end // fin Recordcount IBQCol
     else
      begin
        MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
        Exit;
        EdNumeroColocacion.SetFocus;
      end;
   end;  // with IBQCol
   IBTExtracto.Commit;
end;

procedure TfrmExtractoCredito.Inicializar;
begin
        Extracto.CancelUpdates;
        if dmGeneral.IBTransaction1.InTransaction then begin
           dmGeneral.IBTransaction1.Rollback;
        end;

        if IBTExtracto.InTransaction then IBTExtracto.Rollback;

        dmGeneral.IBTransaction1.StartTransaction;
        IBTExtracto.StartTransaction;

        IBAgencia.Active := True;
        IBAgencia.Last;
        EdAgencia.KeyValue := Agencia;

        EdNumeroColocacion.Text := '';
        EdAsociado.Caption := '';
        EdClasificacion.Caption := '';
        EdLinea.Caption := '';
        EdInversion.Caption := '';
        EdRespaldo.Caption := '';
        EdGarantia.Caption := '';
        EdFechaColocacion.Caption := '';
        EdValorColocacion.Caption := '';
        EdSaldoColocacion.Caption := '';
        EdPlazo.Caption := '';
        EdTipoTasa.Caption := '';
        EdTasaVariable.Caption := '';
        EdPuntos.Caption := '';
        EdTasaEfectiva.Caption := '';
        EdTasaMaxima.Caption := '';
        EdTasaMaximaNominal.Caption := '';
        EdTipoCuota.Caption := '';
        EdAmortizaCapital.Caption := '';
        EdAmortizaInteres.Caption := '';
        EdDiasProrroga.Caption := '';
        EdValorCuota.Caption := '';
        EdTasaNominal.Caption := '';
        EdFechaCapital.Caption := '';
        EdFechaInteres.Caption := '';
        EdAgencia.KeyValue := Agencia;
        EdTotalCuotas.Caption := '';
        CmdAceptar.Enabled := True;

        GroupBox1.Enabled := True;

        if Colocacion <> '' then
         begin
           vcolocacion := Colocacion;
           MostrarExtracto;
//           CmdAceptar.Click;
//           Colocacion := '';
         end
        else
         begin
           EdNumeroColocacion.Text := '';
           EdNumeroColocacion.SetFocus;
         end;
         //Extracto.CancelUpdates;
end;

procedure TfrmExtractoCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        if Colocacion = '' then
          Action := caFree;
end;

procedure TfrmExtractoCredito.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmExtractoCredito.EdNumeroColocacionEnter(Sender: TObject);
begin
        EdNumeroColocacion.SelectAll;
end;

procedure TfrmExtractoCredito.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmExtractoCredito.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;

        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBQuery3.Database := dmGeneral.IBDatabase1;

        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBQuery3.Transaction := dmGeneral.IBTransaction1;

        IBQExtractoCol.Database := dmGeneral.IBDatabase1;
        IBQExtractoCol.Transaction := dmGeneral.IBTransaction1;

        IBQuery.Database := dmGeneral.IBDatabase1;
        IBQExtractoCol.Database := dmGeneral.IBDatabase1;

        IBQCol.Database := dmGeneral.IBDatabase1;
        IBQTabla.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBAgencia.Database := dmGeneral.IBDatabase1;

        IBTExtracto.DefaultDatabase := dmGeneral.IBDatabase1;


end;

procedure TfrmExtractoCredito.DBGrid1DblClick(Sender: TObject);
var I:Integer;
    AF:PCuotasLiq;
    frmVistaPreliminar:TfrmVistaPreliminar;
    Cuota1 : Integer;
    Cuenta:string;
    Funcionario:string;
    Asociado:string;
begin
        vComprobante := Extracto.FieldByName('NO_COMP').AsString;
        with IBQuery3 do
         begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('"col$extracto".FECHA_EXTRACTO,');
           SQL.Add('"col$extracto".CAPITAL_PAGO_HASTA,');
           SQL.Add('"col$extracto".INTERES_PAGO_HASTA,');
           SQL.Add('"col$extracto".SALDO_ANTERIOR_EXTRACTO,');
           SQL.Add('"col$extracto".ID_EMPLEADO,');
           SQL.Add('"col$extracto".CUOTA_EXTRACTO,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('("col$extracto".SALDO_ANTERIOR_EXTRACTO - "col$extracto".ABONO_CAPITAL) as SALDO,');
           SQL.Add('"gen$empleado".NOMBRE, "gen$empleado".PRIMER_APELLIDO, "gen$empleado".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$persona".NOMBRE, "gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO');
           SQL.Add('from "col$extracto" ');
           SQL.Add('left join "col$colocacion" on ("col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
           SQL.Add('left join "gen$empleado" on ("col$extracto".ID_EMPlEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('inner join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('where');
           SQL.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$extracto".ID_CBTE_COLOCACION =:"ID_CBTE_COLOCACION"');
           ParamByName('ID_COLOCACION').AsString := vColocacion;
           ParamByName('ID_CBTE_COLOCACION').AsString := vComprobante;
           Open;
           First;
           Last;
           if RecordCount > 0 then
            begin
              Fecha := IBQuery3.FieldByName('FECHA_EXTRACTO').AsDateTime;
              CapitalHasta := IBQuery3.FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;
              InteresHasta := IBQuery3.FieldByName('INTERES_PAGO_HASTA').AsDateTime;
              SaldoAnterior := IBQuery3.FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency;
              Alias := IBQuery3.FieldByName('ID_EMPLEADO').AsString;
              Cuota := IBQuery3.FieldByName('CUOTA_EXTRACTO').AsInteger;
              vTipoId := IBQuery3.FieldByName('ID_IDENTIFICACION').AsInteger;
              vNumeroId := IBQuery3.FieldByName('ID_PERSONA').AsString;
              Nuevosaldo := IBQuery3.FieldByName('SALDO').AsCurrency;
              Funcionario := IBQuery3.FieldByName('NOMBRE').AsString  + ' ' +
                             IBQuery3.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                             IBQuery3.FieldByName('SEGUNDO_APELLIDO').AsString;
              Asociado := IBQuery3.FieldByName('NOMBRE1').AsString  + ' ' +
                             IBQuery3.FieldByName('PRIMER_APELLIDO1').AsString + ' ' +
                             IBQuery3.FieldByName('SEGUNDO_APELLIDO1').AsString;
              Close;

              SQL.Clear;
              SQL.Add('select "cap$maestrotitular".ID_AGENCIA, "cap$maestrotitular".ID_TIPO_CAPTACION, "cap$maestrotitular".NUMERO_CUENTA, "cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
              SQL.Add('inner join "cap$maestro" ON ( "cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
              SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION  and');
              SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
              SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA )');
              SQL.Add('inner join "cap$tiposestado" ON ( "cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO )');
              SQL.Add('where');
              SQL.Add('ID_IDENTIFICACION = :ID and ID_PERSONA = :ID_PERSONA and "cap$tiposestado".SE_SUMA <> 0 and "cap$maestrotitular".NUMERO_TITULAR = 1 and');
              SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 2 or "cap$maestrotitular".ID_TIPO_CAPTACION = 2)');
              SQL.Add('order by "cap$maestrotitular".ID_AGENCIA, "cap$maestrotitular".ID_TIPO_CAPTACION, "cap$maestrotitular".NUMERO_CUENTA, "cap$maestrotitular".DIGITO_CUENTA');
              ParamByName('ID').AsInteger := vTipoId;
              ParamByName('ID_PERSONA').AsString := vNumeroId;
              Open;
              Cuenta := IntToStr(FieldByName('NUMERO_CUENTA').AsInteger) + '-' + IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
              Close;

              SQL.Clear;
              SQL.Add('select CUOTA_NUMERO from "col$tablaliquidacion"');
              SQL.Add('where');
              SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
              SQL.Add('ID_COLOCACION = :ID_COLOCACION and');
              SQL.Add('PAGADA <> 0');
              SQL.Add('order by FECHA_A_PAGAR');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := vColocacion;
              Open;
              First;
              Last;
              cuota1 := FieldByName('CUOTA_NUMERO').AsInteger;
              Close;

              if Cuota = 0 then
                 cuota := Cuota1;

              SQL.Clear;
              SQL.Add('select FECHA_A_PAGAR, CUOTA_NUMERO ');
              SQL.Add('from "col$tablaliquidacion"');
              SQL.Add('where ');
              SQL.Add('ID_AGENCIA =:"ID_AGENCIA" and');
              SQL.Add('ID_COLOCACION =:"ID_COLOCACION" and');
              SQL.Add('CUOTA_NUMERO = :"CUOTA_NUMERO"');
              SQL.Add('order by FECHA_A_PAGAR');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := vColocacion;
              ParamByName('CUOTA_NUMERO').AsInteger := Cuota + 1;
              Open;
              FechaaPagar := FieldByName('FECHA_A_PAGAR').AsDateTime;
              Close;

              with IBQuery do
               begin
                 SQL.Clear;
                 SQL.Add('Select ');
                 SQL.Add('"col$extractodet".CODIGO_PUC,');
                 SQL.Add('"col$extractodet".FECHA_INICIAL,');
                 SQL.Add('"col$extractodet".FECHA_FINAL,');
                 SQL.Add('"col$extractodet".DIAS_APLICADOS,');
                 SQL.Add('"col$extractodet".TASA_LIQUIDACION,');
                 SQL.Add('"col$extractodet".VALOR_DEBITO,');
                 SQL.Add('"col$extractodet".VALOR_CREDITO,');
                 SQL.Add('"con$puc".NOMBRE');
                 SQL.Add('from "col$extractodet"');
                 SQL.Add('LEFT JOIN "con$puc" ON ("col$extractodet".CODIGO_PUC = "con$puc".CODIGO and ');
                 SQL.Add('"col$extractodet".ID_AGENCIA = "con$puc".ID_AGENCIA )');
                 SQL.Add('where ID_COLOCACION = :"ID_COLOCACION" and');
                 SQL.Add('ID_CBTE_COLOCACION = :"ID_CBTE_COLOCACION"');
                 SQL.Add('ORDER BY CODIGO_PUC,VALOR_DEBITO');
                 ParamByName('ID_COLOCACION').AsString := vColocacion;
                 ParamByName('ID_CBTE_COLOCACION').AsString := vComprobante;
                 Open;

                 Report.Variables.ByName['Empresa'].AsString := Empresa;
                 Report.Variables.ByName['Colocacion'].AsString := vColocacion;
                 Report.Variables.ByName['Hoy'].AsDateTime := Fecha;
                 Report.Variables.ByName['FechaCorte'].AsDateTime := Fecha;
                 Report.Variables.ByName['Asociado'].AsString := Asociado;
                 Report.Variables.ByName['InteresesHasta'].AsDateTime := InteresHasta;
                 Report.Variables.ByName['CapitalHasta'].AsDateTime := CapitalHasta;
                 Report.Variables.ByName['comprobante'].AsString := VComprobante;
                 Report.Variables.ByName['empleado'].AsString := Funcionario;
                 Report.Variables.ByName['NuevoSaldo'].AsVariant := nuevosaldo;
                 Report.Variables.ByName['ProximaCuota'].AsDateTime := FechaaPagar;
                 Report.Variables.ByName['Cuota'].AsInteger := Cuota;
                 Report.Variables.ByName['Cuenta'].AsString := Cuenta;

                 if Report.PrepareReport then
                  begin
                    frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
                    frmVistaPreliminar.Reporte := Report;
                    frmVistaPreliminar.ShowModal;
                  end;
              end;
            end
           else
            begin
              MessageDlg('No se Encuentra Liquidacion para los datos Suministrados',mtError,[mbok],0);
              Exit;
            end;
         end;
         dmGeneral.IBTransaction1.Commit;
end;

procedure TfrmExtractoCredito.DBGrid1ColExit(Sender: TObject);
begin
 if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then 
    DBCheckBox1.Visible := False
end;

procedure TfrmExtractoCredito.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
     DBCheckBox1.Left := Rect.Left + DBGrid1.Left + 2;
     DBCheckBox1.Top := Rect.Top + DBGrid1.top + 2;
     DBCheckBox1.Width := Rect.Right - Rect.Left;
     DBCheckBox1.Height := Rect.Bottom - Rect.Top;
     DBCheckBox1.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      DBGrid1.Canvas.FillRect(Rect);
      DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;


end;

end.


