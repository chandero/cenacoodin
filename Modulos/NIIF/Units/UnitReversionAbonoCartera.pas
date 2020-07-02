unit UnitReversionAbonoCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, DBClient, IBSQL, DateUtils, pr_Common, pr_TxClasses, StrUtils, UnitDmGeneral, UnitDmColocacion;

type
  TfrmReversionAbonoCartera = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    GroupBox1: TGroupBox;
    Label31: TLabel;
    EdAgencia: TDBLookupComboBox;
    Label4: TLabel;
    EdNumeroColocacion: TMaskEdit;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    Extracto: TClientDataSet;
    ExtractoDet: TClientDataSet;
    ExtractoID_AGENCIA: TIntegerField;
    ExtractoID_CBTE_COLOCACION: TIntegerField;
    ExtractoID_COLOCACION: TStringField;
    ExtractoFECHA_EXTRACTO: TDateField;
    ExtractoHORA_EXTRACTO: TTimeField;
    ExtractoCUOTA_EXTRACTO: TIntegerField;
    ExtractoTIPO_OPERACION: TIntegerField;
    ExtractoSALDO_ANTERIOR_EXTRACTO: TCurrencyField;
    ExtractoABONO_CAPITAL: TCurrencyField;
    ExtractoABONO_CXC: TCurrencyField;
    ExtractoABONO_ANTICIPADO: TCurrencyField;
    ExtractoABONO_SERVICIOS: TCurrencyField;
    ExtractoABONO_MORA: TCurrencyField;
    ExtractoABONO_SEGURO: TCurrencyField;
    ExtractoABONO_PAGXCLI: TCurrencyField;
    ExtractoABONO_HONORARIOS: TCurrencyField;
    ExtractoABONO_OTROS: TCurrencyField;
    ExtractoTASA_INTERES_LIQUIDACION: TFloatField;
    ExtractoID_EMPLEADO: TStringField;
    ExtractoINTERES_PAGO_HASTA: TDateField;
    ExtractoCAPITAL_PAGO_HASTA: TDateField;
    ExtractoDetID_AGENCIA: TIntegerField;
    ExtractoDetID_CBTE_COLOCACION: TIntegerField;
    ExtractoDetID_COLOCACION: TStringField;
    ExtractoDetFECHA_EXTRACTO: TDateField;
    ExtractoDetHORA_EXTRACTO: TTimeField;
    ExtractoDetCODIGO_PUC: TStringField;
    ExtractoDetFECHA_INICIAL: TDateField;
    ExtractoDetFECHA_FINAL: TDateField;
    ExtractoDetDIAS_APLICADOS: TIntegerField;
    ExtractoDetTASA_LIQUIDACION: TFloatField;
    ExtractoDetVALOR_DEBITO: TCurrencyField;
    ExtractoDetVALOR_CREDITO: TCurrencyField;
    IBSQL1: TIBSQL;
    CmdInforme: TBitBtn;
    Report: TprTxReport;
    IBInforme: TClientDataSet;
    IBInformeCUOTA: TIntegerField;
    IBInformeCODIGO: TStringField;
    IBInformeNOMBRE: TStringField;
    IBInformeID_AGENCIA: TIntegerField;
    IBInformeFECHA_INICIAL: TDateField;
    IBInformeFECHA_FINAL: TDateField;
    IBInformeDIAS: TIntegerField;
    IBInformeTASA: TFloatField;
    IBInformeDEBITO: TCurrencyField;
    IBInformeCREDITO: TCurrencyField;
    IBCodigo: TIBQuery;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure EdAgenciaExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
  private
    { Private declarations }
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmReversionAbonoCartera: TfrmReversionAbonoCartera;
  dmGeneral: TdmGeneral;
  dmColocacion: TdmColocacion;
  IdAgencia:Integer;
  Consec:string;
  IdComprobante:string;
  IdColocacion:String;
  CuotaReversar:Integer;
  FechaCapitalAnt:TDate;
  FechaInteresAnt:TDate;
  CuotaAnterior:Integer;
  SaldoAnterior:Currency;
  NuevoEstado:Integer;
  CodigoAhorros, CodigoCaja, CodigoAseguradora, CodigoBienes:string;
  EsAhorros,EsCaja,EsAseguradora, EsBienes:Boolean;
  TotalDebito,TotalCredito, TotalAhorros:Currency;
  TipoId:Integer;
  NumeroId:string;
  NumeroCuenta:Integer;
  DigitoCuenta:Integer;
implementation

{$R *.dfm}

uses Unitglobales, UnitGlobalesCol, UnitvistaPreliminar;

procedure TfrmReversionAbonoCartera.EdNumeroColocacionExit(
  Sender: TObject);
var I : Integer;
begin
       EsAhorros := False;
       EsCaja := False;
       EsAseguradora := False;
       TotalDebito := 0;
       TotalCredito := 0;
       TotalAhorros := 0;

       IdColocacion := trim(EdNumeroColocacion.Text);
//**Seleccion de Datos Necesarios
       With IBQuery1 do
        begin
          sql.Clear;
          sql.Add('Select ');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA');
          sql.Add('from "col$colocacion"');
          sql.Add('where ');
          sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
          sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          Open;
          TipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
          NumeroId := FieldByName('ID_PERSONA').AsString;

          Close;
          sql.Clear;
          sql.Add('select * from "col$extracto"');
          sql.Add('where ');
          sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
          sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION"');
          sql.Add('order by "col$extracto".FECHA_EXTRACTO, "col$extracto".HORA_EXTRACTO');
          ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          Open;
          First;
          Last;

          Extracto.Append;
          Extracto.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
          Extracto.FieldByName('ID_CBTE_COLOCACION').AsInteger := FieldByName('ID_CBTE_COLOCACION').AsInteger;
          Extracto.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
          Extracto.FieldByName('FECHA_EXTRACTO').AsDateTime := FieldByName('FECHA_EXTRACTO').AsDateTime;
          Extracto.FieldByName('HORA_EXTRACTO').AsDateTime := FieldByName('HORA_EXTRACTO').AsDateTime;
          Extracto.FieldByName('CUOTA_EXTRACTO').AsInteger := FieldByName('CUOTA_EXTRACTO').AsInteger;
          Extracto.FieldByName('TIPO_OPERACION').AsInteger := FieldByName('TIPO_OPERACION').AsInteger;
          Extracto.FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency;
          Extracto.FieldByName('ABONO_CAPITAL').AsCurrency := FieldByName('ABONO_CAPITAL').AsCurrency;
          Extracto.FieldByName('ABONO_CXC').AsCurrency := FieldByName('ABONO_CXC').AsCurrency;
          Extracto.FieldByName('ABONO_ANTICIPADO').AsCurrency := FieldByName('ABONO_ANTICIPADO').AsCurrency;
          Extracto.FieldByName('ABONO_SERVICIOS').AsCurrency := FieldByName('ABONO_SERVICIOS').AsCurrency;
          Extracto.FieldByName('ABONO_MORA').AsCurrency := FieldByName('ABONO_MORA').AsCurrency;
          Extracto.FieldByName('ABONO_SEGURO').AsCurrency := FieldByName('ABONO_SEGURO').AsCurrency;
          Extracto.FieldByName('ABONO_PAGXCLI').AsCurrency := FieldByName('ABONO_PAGXCLI').AsCurrency;
          Extracto.FieldByName('ABONO_HONORARIOS').AsCurrency := FieldByName('ABONO_HONORARIOS').AsCurrency;
          Extracto.FieldByName('ABONO_OTROS').AsCurrency := FieldByName('ABONO_OTROS').AsCurrency;
          Extracto.FieldByName('TASA_INTERES_LIQUIDACION').AsFloat := FieldByName('TASA_INTERES_LIQUIDACION').AsFloat;
          Extracto.FieldByName('ID_EMPLEADO').AsString := FieldByName('ID_EMPLEADO').AsString;
          Extracto.FieldByName('INTERES_PAGO_HASTA').AsDateTime := FieldByName('INTERES_PAGO_HASTA').AsDateTime;
          Extracto.FieldByName('CAPITAL_PAGO_HASTA').AsDateTime := FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;
//          Extracto.FieldByName('TIPO_ABONO').AsInteger := 0; //FieldByName('TIPO_ABONO').AsInteger;
          Extracto.Post;

          SaldoAnterior := FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency - FieldByName('ABONO_CAPITAL').AsCurrency;
          CuotaReversar := FieldByName('CUOTA_EXTRACTO').AsInteger;
          IBQuery1.MoveBy(-1);
          CuotaAnterior := FieldByName('CUOTA_EXTRACTO').AsInteger;
          if not IBQuery1.Bof then
            begin
              FechaCapitalAnt := FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;
              FechaInteresAnt := FieldByName('INTERES_PAGO_HASTA').AsDateTime;
              IBQuery1.Last;
            end
          else
            begin
              sql.Clear;
              sql.Add('Select ');
              sql.Add('"col$colocacion".FECHA_CAPITAL,');
              sql.Add('"col$colocacion".FECHA_INTERES,');
              sql.Add('"col$colocacion".AMORTIZA_CAPITAL,');
              sql.Add('"col$colocacion".AMORTIZA_INTERES');
              sql.Add('from "col$colocacion"');
              sql.Add('where ');
              sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
              sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
              ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
              ParamByName('ID_COLOCACION').AsString := IdColocacion;
              Open;
              FechaCapitalAnt := CalculoFecha(FieldByName('FECHA_CAPITAL').AsDateTime,-FieldByName('AMORTIZA_CAPITAL').AsInteger);
              FechaInteresAnt := CalculoFecha(FieldByName('FECHA_INTERES').AsDateTime,-FieldByName('AMORTIZA_INTERES').AsInteger);
              Close;

              SQL.Clear;
              SQL.Add('select ID_ESTADO from "col$causaciones" where');
              SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION =:ID_COLOCACION and FECHA_CORTE =:FECHA_CORTE');
              ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
              ParamByName('ID_COLOCACION').AsString := IdColocacion;
              ParamByName('FECHA_CORTE').AsDate := RecodeDay(Date,Dayof(EndOfAMonth(YearOf(Date),MonthOf(Date - 1))));
              Open;
              NuevoEstado := FieldByName('ID_ESTADO').AsInteger;
              Close;
            end;

          Close;
          SQL.Clear;
          SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 8');
          Open;
          CodigoAhorros := FieldByName('CODIGO').AsString;
          Close;

          Close;
          SQL.Clear;
          SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 9');
          Open;
          CodigoAseguradora := FieldByName('CODIGO').AsString;
          Close;

          Close;
          SQL.Clear;
          SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 17');
          Open;
          CodigoBienes := FieldByName('CODIGO').AsString;
          Close;

          Close;
          SQL.Clear;
          SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
          Open;
          CodigoCaja := FieldByName('CODIGO').AsString;
          Close;

          sql.Clear;
          sql.Add('select * from "col$extractodet"');
          sql.Add('where ');
          sql.Add('"col$extractodet".ID_AGENCIA =:"ID_AGENCIA" and');
          sql.Add('"col$extractodet".ID_COLOCACION =:"ID_COLOCACION" and');
          sql.Add('"col$extractodet".ID_CBTE_COLOCACION =:"ID_CBTE_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          ParamByName('ID_COLOCACION').AsString := IdColocacion;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := Extracto.FieldByName('ID_CBTE_COLOCACION').AsInteger;
          Open;
          Last;
          First;

          while not Eof do begin
            if FieldByName('CODIGO_PUC').AsString = CodigoAhorros then
             begin
               EsAhorros := True;
               TotalAhorros := FieldByName('VALOR_DEBITO').AsCurrency;
             end
            else if FieldByName('CODIGO_PUC').AsString = CodigoCaja then
               EsCaja := True
            else if FieldByName('CODIGO_PUC').AsString = CodigoAseguradora then
               EsAseguradora := True
            else if FieldByName('CODIGO_PUC').AsString = CodigoBienes then
               EsBienes := True;

            ExtractoDet.Append;
            ExtractoDet.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
            ExtractoDet.FieldByName('ID_CBTE_COLOCACION').AsInteger := FieldByName('ID_CBTE_COLOCACION').AsInteger;
            ExtractoDet.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
            ExtractoDet.FieldByName('FECHA_EXTRACTO').AsDateTime := FieldByName('FECHA_EXTRACTO').AsDateTime;
            ExtractoDet.FieldByName('HORA_EXTRACTO').AsDateTime := FieldByName('HORA_EXTRACTO').AsDateTime;
            ExtractoDet.FieldByName('CODIGO_PUC').AsString := FieldByName('CODIGO_PUC').AsString;
            ExtractoDet.FieldByName('FECHA_INICIAL').AsDateTime := FieldByName('FECHA_INICIAL').AsDateTime;
            ExtractoDet.FieldByName('FECHA_FINAL').AsDateTime := FieldByName('FECHA_FINAL').AsDateTime;
            ExtractoDet.FieldByName('DIAS_APLICADOS').AsInteger := FieldByName('DIAS_APLICADOS').AsInteger;
            ExtractoDet.FieldByName('TASA_LIQUIDACION').AsFloat := FieldByName('TASA_LIQUIDACION').AsFloat;
            ExtractoDet.FieldByName('VALOR_DEBITO').AsCurrency := FieldByName('VALOR_DEBITO').AsCurrency;
            ExtractoDet.FieldByName('VALOR_CREDITO').AsCurrency := FieldByName('VALOR_CREDITO').AsCurrency;
            ExtractoDet.Post;
            TotalDebito := TotalDebito + FieldByName('VALOR_DEBITO').AsCurrency;
            TotalCredito := TotalCredito + FieldByName('VALOR_CREDITO').AsCurrency;
            Next;
          end;
          Close;

          sql.Clear;
          Sql.Add('select * from P_CAP_0008_JUD (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
          ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
          ParamByName('ID_PERSONA').AsString := NumeroId;
          Open;
          NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
          DigitoCuenta := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
          Close;

        end;
end;

procedure TfrmReversionAbonoCartera.EdAgenciaExit(Sender: TObject);
begin
        IdAgencia := EdAgencia.KeyValue;
end;

procedure TfrmReversionAbonoCartera.CmdAceptarClick(Sender: TObject);
var I:Integer;
Comprobante:Integer;
begin
    if MessageDlg('Seguro de Reversar el Abono?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
       //**Genero el consecutivo
       Consec := FormatCurr('00000000',ObtenerConsecutivo(IBSQL1,1));
       IdComprobante := Consec;
       Comprobante := StrToInt(IdComprobante);
//       dmGeneral.IBTransaction1.StartTransaction;
       With IBQuery1 do
        Try
         if Transaction.InTransaction then
           Transaction.Rollback;
         Transaction.StartTransaction;
         sql.Clear;
         sql.Add('insert into "col$extracto" (');
         sql.Add('"col$extracto"."ID_AGENCIA", "col$extracto"."ID_CBTE_COLOCACION",');
         sql.Add('"col$extracto"."ID_COLOCACION", "col$extracto"."FECHA_EXTRACTO",');
         sql.Add('"col$extracto"."HORA_EXTRACTO", "col$extracto"."CUOTA_EXTRACTO",');
         sql.Add('"col$extracto"."TIPO_OPERACION", "col$extracto"."SALDO_ANTERIOR_EXTRACTO",');
         sql.Add('"col$extracto"."ABONO_CAPITAL", "col$extracto"."ABONO_CXC",');
         sql.Add('"col$extracto"."ABONO_SERVICIOS", "col$extracto"."ABONO_ANTICIPADO",');
         sql.Add('"col$extracto"."ABONO_MORA", "col$extracto"."ABONO_SEGURO",');
         sql.Add('"col$extracto"."ABONO_PAGXCLI", "col$extracto"."ABONO_HONORARIOS",');
         sql.Add('"col$extracto"."ABONO_OTROS", "col$extracto"."TASA_INTERES_LIQUIDACION",');
         sql.Add('"col$extracto"."ID_EMPLEADO",');
         sql.Add('"col$extracto"."INTERES_PAGO_HASTA",');
         sql.Add('"col$extracto"."CAPITAL_PAGO_HASTA",');
         sql.Add('"col$extracto"."TIPO_ABONO")');
         sql.Add(' Values (');
         sql.Add(':"ID_AGENCIA", :"ID_CBTE_COLOCACION", :"ID_COLOCACION",');
         sql.Add(':"FECHA_EXTRACTO", :"HORA_EXTRACTO", :"CUOTA_EXTRACTO",');
         sql.Add(':"TIPO_OPERACION", :"SALDO_ANTERIOR_EXTRACTO", :"ABONO_CAPITAL",');
         sql.Add(':"ABONO_CXC", :"ABONO_SERVICIOS", :"ABONO_ANTICIPADO", :"ABONO_MORA",');
         sql.Add(':"ABONO_SEGURO", :"ABONO_PAGXCLI", :"ABONO_HONORARIOS",');
         sql.Add(':"ABONO_OTROS", :"TASA_INTERES_LIQUIDACION", :"ID_EMPLEADO",');
         sql.Add(':"INTERES_PAGO_HASTA", :"CAPITAL_PAGO_HASTA", :"TIPO_ABONO")');
         ParamByName('ID_AGENCIA').AsInteger := Extracto.FieldByName('ID_AGENCIA').AsInteger;
         ParamByName('ID_CBTE_COLOCACION').AsInteger := Comprobante;
         ParamByName('ID_COLOCACION').AsString := Extracto.FieldByName('ID_COLOCACION').AsString;
         ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
         ParamByName('HORA_EXTRACTO').AsDateTime := fFechaHoraActual;
         ParamByName('CUOTA_EXTRACTO').AsInteger := Extracto.FieldByName('CUOTA_EXTRACTO').AsInteger;
         ParamByName('TIPO_OPERACION').AsInteger := 2;
         ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := Extracto.FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency - Extracto.FieldByName('ABONO_CAPITAL').AsCurrency;
         if Extracto.FieldByName('ABONO_CAPITAL').AsCurrency > 0 then
           ParamByName('ABONO_CAPITAL').AsCurrency := -(Extracto.FieldByName('ABONO_CAPITAL').AsCurrency)
         else
           ParamByName('ABONO_CAPITAL').AsCurrency := 0;
         if Extracto.FieldByName('ABONO_CXC').AsCurrency > 0 then
           ParamByName('ABONO_CXC').AsCurrency := -(Extracto.FieldByName('ABONO_CXC').AsCurrency)
         else
           ParamByName('ABONO_CXC').AsCurrency := 0;
         if Extracto.FieldByName('ABONO_SERVICIOS').AsCurrency > 0 then
           ParamByName('ABONO_SERVICIOS').AsCurrency := -(Extracto.FieldByName('ABONO_SERVICIOS').AsCurrency)
         else
           ParamByName('ABONO_SERVICIOS').AsCurrency := 0;
         if Extracto.FieldByName('ABONO_ANTICIPADO').AsCurrency > 0 then
           ParamByName('ABONO_ANTICIPADO').AsCurrency := -(Extracto.FieldByName('ABONO_ANTICIPADO').AsCurrency)
         else
           ParamByName('ABONO_ANTICIPADO').AsCurrency := 0;
         if Extracto.FieldByName('ABONO_MORA').AsCurrency > 0 then
           ParamByName('ABONO_MORA').AsCurrency := -(Extracto.FieldByName('ABONO_MORA').AsCurrency)
         else
           ParamByName('ABONO_MORA').AsCurrency := 0;
         if Extracto.FieldByName('ABONO_SEGURO').AsCurrency > 0 then
           ParamByName('ABONO_SEGURO').AsCurrency := -(Extracto.FieldByName('ABONO_SEGURO').AsCurrency)
         else
           ParamByName('ABONO_SEGURO').AsCurrency := 0;
         if Extracto.FieldByName('ABONO_PAGXCLI').AsCurrency > 0 then
           ParamByName('ABONO_PAGXCLI').AsCurrency := -(Extracto.FieldByName('ABONO_PAGXCLI').AsCurrency)
         else
           ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
         if Extracto.FieldByName('ABONO_HONORARIOS').AsCurrency > 0 then
           ParamByName('ABONO_HONORARIOS').AsCurrency := -(Extracto.FieldByName('ABONO_HONORARIOS').AsCurrency)
         else
           ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
         if Extracto.FieldByName('ABONO_OTROS').AsCurrency > 0 then
           ParamByName('ABONO_OTROS').AsCurrency := -(Extracto.FieldByName('ABONO_OTROS').AsCurrency)
         else
           ParamByName('ABONO_OTROS').AsCurrency := 0;
         ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := Extracto.FieldByName('TASA_INTERES_LIQUIDACION').AsFloat;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ParamByName('INTERES_PAGO_HASTA').AsDate := FechaInteresAnt;
         ParamByName('CAPITAL_PAGO_HASTA').AsDate := FechaCapitalAnt;
         ParamByName('TIPO_ABONO').AsInteger := 0; //Extracto.FieldByName('TIPO_ABONO').AsBoolean;
         Open;
         Close;


         ExtractoDet.Last;
         ExtractoDet.First;
         while not ExtractoDet.Eof do begin
          sql.Clear;
          sql.Add('insert into "col$extractodet"');
          SQL.Add('(ID_AGENCIA, ID_CBTE_COLOCACION, ID_COLOCACION,');
          SQL.Add('FECHA_EXTRACTO,HORA_EXTRACTO,CODIGO_PUC,');
          SQL.Add('FECHA_INICIAL,FECHA_FINAL,DIAS_APLICADOS,');
          SQL.Add('TASA_LIQUIDACION,VALOR_DEBITO,VALOR_CREDITO)');
          SQL.Add('values(');
          SQL.Add(':ID_AGENCIA,:ID_CBTE_COLOCACION,:ID_COLOCACION,');
          SQL.Add(':FECHA_EXTRACTO,:HORA_EXTRACTO,:CODIGO_PUC,');
          SQL.Add(':FECHA_INICIAL,:FECHA_FINAL,:DIAS_APLICADOS,');
          SQL.Add(':TASA_LIQUIDACION,:VALOR_DEBITO,:VALOR_CREDITO)');

          ParamByName('ID_AGENCIA').AsInteger := ExtractoDet.FieldByName('ID_AGENCIA').AsInteger;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := Comprobante;
          ParamByName('ID_COLOCACION').AsString := ExtractoDet.FieldByName('ID_COLOCACION').AsString;
          ParamByName('FECHA_EXTRACTO').AsDateTime := fFechaActual;
          ParamByName('HORA_EXTRACTO').AsDateTime := fFechaHoraActual;
          ParamByName('CODIGO_PUC').AsString := ExtractoDet.FieldByName('CODIGO_PUC').AsString;
          ParamByName('FECHA_INICIAL').AsDateTime := ExtractoDet.FieldByName('FECHA_INICIAL').AsDateTime;
          ParamByName('FECHA_FINAL').AsDateTime := ExtractoDet.FieldByName('FECHA_FINAL').AsDateTime;
          ParamByName('DIAS_APLICADOS').AsInteger := ExtractoDet.FieldByName('DIAS_APLICADOS').AsInteger;
          ParamByName('TASA_LIQUIDACION').AsFloat := ExtractoDet.FieldByName('TASA_LIQUIDACION').AsFloat;
          if ExtractoDet.FieldByName('VALOR_DEBITO').AsCurrency > 0 then
           begin
             ParamByName('VALOR_DEBITO').AsCurrency := 0;
             ParamByName('VALOR_CREDITO').AsCurrency := ExtractoDet.FieldByName('VALOR_DEBITO').AsCurrency;
           end
          else
           begin
             ParamByName('VALOR_DEBITO').AsCurrency := ExtractoDet.FieldByName('VALOR_CREDITO').AsCurrency;
             ParamByName('VALOR_CREDITO').AsCurrency := 0;
           end;
          Open;
         ExtractoDet.Next;
         end;
         Close;

         sql.Clear;
         sql.Add('update "col$tablaliquidacion" set');
         sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
         sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
         sql.Add(' where ');
         sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
         sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
         sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" >=:"CUOTA_NUMERO"');
         ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ParamByName('CUOTA_NUMERO').AsInteger := CuotaReversar;
         ParamByName('PAGADA').AsInteger := 0;
         ParamByName('FECHA_PAGADA').Clear;
         Open;

         sql.Clear;
         sql.Add('update "col$colocacion" set ');
         sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" - :"ABONOS_CAPITAL",');
         sql.Add('"col$colocacion"."FECHA_CAPITAL" =:"FECHA_CAPITAL",');
         sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES",');
         SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');
         sql.Add(' where ');
         sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
         sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
         ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ParamByName('ABONOS_CAPITAL').AsCurrency := Extracto.FieldByName('ABONO_CAPITAL').AsCurrency; //SaldoAnterior; //AbonoCapital;
         ParamByName('FECHA_CAPITAL').AsDate := FechaCapitalAnt;
         ParamByName('FECHA_INTERES').AsDate := FechaInteresAnt;
         ParamByName('ID_ESTADO_COLOCACION').AsInteger := NuevoEstado;
         Open;
         Close;

         //  Inserto Registro a Tabla de Reversiones
         SQL.Clear;
         SQL.Add('insert into "col$reversioncartera" (ID_AGENCIA,ID_COLOCACION,FECHA_REVERSION,');
         SQL.Add('HORA_REVERSION,FECHA_EXTRACTO,CBTE_REVERSADO,ID_CBTE_COLOCACION,ID_EMPLEADO)');
         SQL.Add('values(:ID_AGENCIA,:ID_COLOCACION,:FECHA_REVERSION,');
         SQL.Add(':HORA_REVERSION,:FECHA_EXTRACTO,:CBTE_REVERSADO,:ID_CBTE_COLOCACION,:ID_EMPLEADO)');
         ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ParamByName('FECHA_REVERSION').AsDate := fFechaActual;
         ParamByName('HORA_REVERSION').AsDateTime := fFechaHoraActual;
         ParamByName('FECHA_EXTRACTO').AsDate := Extracto.FieldByName('FECHA_EXTRACTO').AsDateTime;
         ParamByName('CBTE_REVERSADO').AsInteger := Extracto.FieldByName('ID_CBTE_COLOCACION').AsInteger;
         ParamByName('ID_CBTE_COLOCACION').AsInteger := Comprobante;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         Open;
         Close;

         //Movimiento a contabilidad
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
         ParamByName('ID_COMPROBANTE').AsString:= IdComprobante;
         ParamByname('FECHADIA').AsDate := fFechaActual;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
         ParamByName('DESCRIPCION').AsString := 'Reversión de Abono a Cartera Pagaré No.' + Trim(EdNumeroColocacion.Text);
         ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebito;
         ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCredito;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByname('ANULACION').asstring := '';
         ParamByName('IMPRESO').AsInteger  := 1;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ExecSQL;
         Close;

         ExtractoDet.Last;
         ExtractoDet.First;
         while not ExtractoDet.Eof do begin
          sql.Clear;
          SQL.Add('insert into "con$auxiliar" values (');
          SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
          SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
          SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
          ParamByName('ID_COMPROBANTE').AsString := IdComprobante;
          ParamByName('ID_AGENCIA').AsInteger:= Agencia;
          ParamByName('FECHA').AsDate := fFechaActual;
          ParamByName('CODIGO').AsString := ExtractoDet.FieldByName('CODIGO_PUC').AsString;
          if ExtractoDet.FieldByName('VALOR_DEBITO').AsCurrency > 0 then
           begin
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := ExtractoDet.FieldByName('VALOR_DEBITO').AsCurrency;
           end
          else
           begin
             ParamByName('DEBITO').AsCurrency := ExtractoDet.FieldByName('VALOR_CREDITO').AsCurrency;
             ParamByName('CREDITO').AsCurrency := 0;
           end;
          if LeftStr(ExtractoDet.FieldByName('CODIGO_PUC').AsString,8) = '21050501' then
            ParamByName('ID_CUENTA').AsInteger := NumeroCuenta
          else
            ParamByName('ID_CUENTA').AsInteger := 0;
          if LeftStr(ExtractoDet.FieldByName('CODIGO_PUC').AsString,2) = '14' then
            ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text
          else
            ParamByName('ID_COLOCACION').AsString := '';
          ParamByName('ID_IDENTIFICACION').AsInteger := 0;
          ParamByName('ID_PERSONA').AsString := '';
          ParamByName('MONTO_RETENCION').AsCurrency := 0;
          ParamByName('TASA_RETENCION').AsFloat := 0;
          ParamByName('ESTADOAUX').AsString := 'O';
          Open;
         ExtractoDet.Next;
         end;
         Close;

       if EsAhorros then begin
         SQL.Clear;
         SQL.Add('insert into "cap$extracto" values(');
         SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
         SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
         SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
         SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
         ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
         ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
         ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
         ParamByName('HORA_MOVIMIENTO').AsTime := fHoraActual;
         if TotalAhorros > 0 then
          begin
            ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 18;
            ParamByName('DOCUMENTO_MOVIMIENTO').AsString := IdComprobante;
            ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'REVERSION ABONO A CARTERA COL. No.' + IdColocacion;
            ParamByName('VALOR_DEBITO').AsCurrency := TotalAhorros;
            ParamByName('VALOR_CREDITO').AsCurrency := 0;
            try
              Open;
              if RowsAffected < 1 then
               begin
                 MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
                 Exit;
               end
            except
               MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
               Exit;
            end; // del try
          end;
       end;

       except
          Transaction.Rollback;
          MessageDlg('Error al Reversar Abono',mtInformation,[mbOK],0);
          Exit;
       end;
       dmGeneral.IBTransaction1.Commit;
       MessageDlg('Abono Reversado',mtInformation,[mbOK],0);
       dmGeneral.IBTransaction1.StartTransaction;
       CmdAceptar.Enabled := False;
       CmdInforme.Click;
       Inicializar;
       CmdCerrar.SetFocus;
     end
    else
     begin
       dmGeneral.IBTransaction1.Rollback;
       MessageDlg('Abono NO Reversado',mtInformation,[mbOK],0);
       Inicializar;
       CmdAceptar.Enabled := False;
       CmdCerrar.SetFocus;
     end;
end;

procedure TfrmReversionAbonoCartera.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;

        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;

        dmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmReversionAbonoCartera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmReversionAbonoCartera.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;

        EdAgencia.KeyValue := Agencia;
        dmColocacion.IBDSagencias.Open;
        dmColocacion.IBDSagencias.Last;
        dmColocacion.IBDSagencias.First;
end;

procedure TfrmReversionAbonoCartera.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmReversionAbonoCartera.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmReversionAbonoCartera.Inicializar;
begin
        IdAgencia:=Agencia;
        IdColocacion:='';
        IdComprobante:='';
        CuotaReversar:=0;
//        AbonoCapital:=0;
        FechaCapitalAnt:=Date;
        FechaInteresAnt:=Date;

        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;

        EdAgencia.KeyValue := Agencia;
        EdNumeroColocacion.Text := IdColocacion;
        dmColocacion.IBDSagencias.Open;
        dmColocacion.IBDSagencias.Last;
        dmColocacion.IBDSagencias.First;
end;

procedure TfrmReversionAbonoCartera.CmdInformeClick(Sender: TObject);
var I:Integer;
    frmVistaPreliminar:TfrmVistaPreliminar;
begin
        Empleado;

        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from "col$extractodet" where');
         SQL.Add('ID_AGENCIA =:ID_AGENCIA and ID_COLOCACION =:ID_COLOCACION and ID_CBTE_COLOCACION =:ID_CBTE_COLOCACION');
         SQL.Add('and FECHA_EXTRACTO =:FECHA_EXTRACTO');
         ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(IdComprobante);
         ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
         ExecQuery;

         while not Eof do
          begin
              IBInforme.Append;
              IBInforme.FieldByName('CUOTA').AsInteger := 0; //FieldByName('CUOTA_NUMERO').AsInteger;
              IBInforme.FieldByName('CODIGO').AsString := FieldByName('CODIGO_PUC').AsString;
              IBCodigo.Close;
              IBCodigo.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
              IBCodigo.ParamByName('CODIGO').AsString := FieldByName('CODIGO_PUC').AsString;
              IBCodigo.Open;
              IBInforme.FieldByName('NOMBRE').AsString := IBCodigo.FieldByName('NOMBRE').AsString;
              IBInforme.FieldByName('ID_AGENCIA').AsInteger := IdAgencia;
              IBInforme.FieldByName('FECHA_INICIAL').AsDateTime := FieldByName('FECHA_INICIAL').AsDate;
              IBInforme.FieldByName('FECHA_FINAL').AsDateTime := FieldByName('FECHA_FINAL').AsDate;
              IBInforme.FieldByName('DIAS').AsInteger := FieldByName('DIAS_APLICADOS').AsInteger;
              IBInforme.FieldByName('TASA').AsFloat := FieldByName('TASA_LIQUIDACION').AsDouble;
              IBInforme.FieldByName('DEBITO').AsCurrency := FieldByName('VALOR_DEBITO').AsCurrency;
              IBInforme.FieldByName('CREDITO').AsCurrency := FieldByName('VALOR_CREDITO').AsCurrency;
              IBInforme.Post;
              IBCodigo.Close;
            Next;
           end;

           Close;
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('"col$colocacion".NUMERO_CUENTA,');
           SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL as SALDO,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$persona".NOMBRE');
           SQL.Add('from');
           SQL.Add('"col$colocacion"');
           SQL.Add('inner join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
           SQL.Add('"col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('where');
           SQL.Add('"col$colocacion".ID_AGENCIA =:ID_AGENCIA and');
           SQL.Add('"col$colocacion".ID_COLOCACION =:ID_COLOCACION');
           ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
           ParamByName('ID_COLOCACION').AsString := IdColocacion;
           ExecQuery;

           Report.Variables.ByName['Empresa'].AsString := Empresa;
           Report.Variables.ByName['Colocacion'].AsString := IdColocacion;
           Report.Variables.ByName['Hoy'].AsDateTime := fFechaActual;
           Report.Variables.ByName['ProximaCuota'].AsString := '0000/00/00';
           Report.Variables.ByName['FechaCorte'].AsDateTime := fFechaActual;
           Report.Variables.ByName['Asociado'].AsString := Trim(FieldByName('PRIMER_APELLIDO').AsString) + ' ' + Trim(FieldByName('SEGUNDO_APELLIDO').AsString) + ' ' + Trim(FieldByName('NOMBRE').AsString);
           Report.Variables.ByName['Cuenta'].AsString := IntToStr(FieldByName('NUMERO_CUENTA').AsInteger) +  '-' + DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)); //(NumeroCuenta) + '-' + IntToStr(DigitoCuenta);
           Report.Variables.ByName['NuevoSaldo'].AsDouble := FieldByName('SALDO').AsCurrency; //SaldoAnterior;
           Report.Variables.ByName['InteresesHasta'].AsDateTime := FechaInteresAnt;
           Report.Variables.ByName['CapitalHasta'].AsDateTime := FechaCapitalAnt;
           Report.Variables.ByName['comprobante'].AsString := IdComprobante;
           Report.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;

           if Report.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Report;
              frmVistaPreliminar.ShowModal;
           end;
          Close;
         end;
           IBInforme.EmptyDataSet;

end;

end.
