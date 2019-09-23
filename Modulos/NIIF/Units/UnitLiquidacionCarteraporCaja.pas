unit UnitLiquidacionCarteraporCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ComCtrls, pr_Common, pr_TxClasses,
  Mask, Grids, XStringGrid, DB, IBCustomDataSet, IBQuery, ExtCtrls,
  lmdstdcA, ImgList;

type
  TfrmLiquidacionporCaja = class(TForm)
    ControlLiquidacion: TPageControl;
    InfoColocacion: TTabSheet;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label31: TLabel;
    EdNumeroColocacion: TMemo;
    EdNumeroIdentificacion: TStaticText;
    EdNombre: TStaticText;
    CmdBuscar: TBitBtn;
    EdAgencia: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    EdValorCuota: TStaticText;
    EdPlazo: TStaticText;
    EdAmortizaCapital: TStaticText;
    EdAmortizaInteres: TStaticText;
    EdSaldoColocacion: TStaticText;
    EdTasaNominal: TStaticText;
    IBQuery: TIBQuery;
    IBQuery1: TIBQuery;
    Report: TprTxReport;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    ImageList1: TImageList;
    Label27: TLabel;
    EdFechaCapital: TStaticText;
    Label28: TLabel;
    EdFechaInteres: TStaticText;
    Label29: TLabel;
    EdFechaCorte: TDateTimePicker;
    Label19: TLabel;
    EdCuotas: TLMDSpinEdit;
    EdTotalCuotas: TStaticText;
    Panel4: TPanel;
    CmdLiquidar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    EdNuevoSaldo: TStaticText;
    Label6: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    EdIntereses: TStaticText;
    EdDevuelto: TStaticText;
    EdVencido: TStaticText;
    EdDIntereses: TStaticText;
    EdDDevuelto: TStaticText;
    EdDVencido: TStaticText;
    Label21: TLabel;
    Label7: TLabel;
    EdCapital: TStaticText;
    EdTotal: TStaticText;
    Label4: TLabel;
    EdNocomprobante: TMaskEdit;
    Panel1: TPanel;
    CmdInforme: TBitBtn;
    CmdGrabar: TBitBtn;
    CmdReversar: TBitBtn;
    Label5: TLabel;
    EdTotal1: TStaticText;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure EdNocomprobanteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure EdAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure EdCuotasKeyPress(Sender: TObject; var Key: Char);
    procedure EdCuotasExit(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdNocomprobanteKeyPress(Sender: TObject; var Key: Char);
    procedure CmdInformeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CmdCancelarClick(Sender: TObject);
    procedure EdNumeroColocacionEnter(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure CmdReversarClick(Sender: TObject);
  private
    MyLista :TList;
    MyColocacion:string;
    MyProximaCuota:TDate;
    MyFechaCorte:TDate;
    MyAsociado:string;
    MyNuevoSaldo:Currency;
    MyInteresesHasta:TDate;
    MyCapitalHasta:TDate;
    procedure Empleado;
    procedure Inicializar;
    function BuscarCodigoPuc(Codigo: String): string;
    procedure Grabarextracto;
    procedure GrabarTablaLiquidacion;
    procedure MostrarFormulario;
    procedure LimpiarLiquidacion;
    { Private declarations }
  public
    property Lista:TList read MyLista Write MyLista;
    property Colocacion:string read MyColocacion Write MyColocacion;
    property ProximaCuota:TDate read MyProximaCuota Write MyProximaCuota;
    property FechaCorte:TDate read MyFechaCorte Write MyFechaCorte;
    property Asociado:string read MyAsociado Write MyAsociado;
    property NuevoSaldo:Currency read MyNuevoSaldo Write MyNuevoSaldo;
    property InteresesHasta:TDate read MyInteresesHasta Write MyInteresesHasta;
    property CapitalHasta:TDate read MyCapitalHasta Write MyCapitalHasta;
    { Public declarations }
  end;


var
  frmLiquidacionporCaja: TfrmLiquidacionporCaja;
  Colocacion : String;
  vNoComprobante : string;
  vTipoOperacion : integer;
  vseguro        : currency;
  vpagxcliente   : currency;
  vhonorarios    : currency;
  votrospagos    : currency;
  vCuotaNo       : Integer;
  Capital   :Currency;
  Causado   :Currency;
  DiasCausado:Integer;
  Corriente :Currency;
  DiasCorriente:Integer;
  Vencido   :Currency;
  DiasVencido:Integer;
  Anticipado:Currency;
  DiasAnticipado:Integer;
  Devuelto  :Currency;
  DiasDevuelto:Integer;
  Total:Currency;
  abono_capital : currency;
  abono_cxc : currency;
  abono_servicios : currency;
  abono_anticipado: currency;
  abono_mora : currency;
  Cuota_anterior : integer;
  cambio : boolean;
  DirInt : integer;
  debito : string;
  credito : string;
  honorarios : string;
  separadormiles : char;

implementation

uses UnitdmColocacion,UnitdmGeneral,UnitVistaPreliminar,
     UnitGlobalesCol, UnitBuscarColocacion, UnitGlobales;


{$R *.dfm}

procedure TfrmLiquidacionporCaja.MostrarFormulario;
var AF:PCuotasLiq;
    I:Integer;
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;

        Capital    := 0;
        Causado    := 0;
        Corriente  := 0;
        Vencido    := 0;
        Anticipado := 0;
        Devuelto   := 0;
        DiasCausado:=0;
        DiasCorriente:=0;
        DiasVencido:=0;
        DiasAnticipado:=0;
        DiasDevuelto:=0;
        vTipoOperacion := 1;
              for I := 0 to (MyLista.Count - 1) do
              begin
                Application.ProcessMessages;
                AF := MyLista.Items[I];

                if AF^.EsCapital then
                 begin
                   abono_capital := AF^.Credito;
                   Capital := Capital + AF^.Credito;
                 end;

                if AF^.EsCausado then
                begin
                   abono_cxc := AF^.Credito;
                   Causado := Causado + AF^.Credito;
                   DiasCausado := DiasCausado + AF^.Dias;
                end;

                if AF^.EsCorriente then
                begin
                   abono_servicios := AF^.Credito;
                   Corriente := Corriente + AF^.Credito;
                   DiasCorriente := DiasCorriente + AF^.Dias;
                end;

                if AF^.EsVencido then
                begin
                   abono_mora := AF^.Credito;
                   Vencido := Vencido + AF^.Credito;
                   DiasVencido := DiasVencido + AF^.Dias;
                end;

                if AF^.EsAnticipado then
                begin
                   abono_anticipado := AF^.Credito;
                   Anticipado := Anticipado + AF^.Credito;
                   DiasAnticipado := DiasAnticipado + AF^.Dias;
                end;

                if AF^.EsDevuelto then
                 if AF^.Debito <> 0 then
                 begin
                   Devuelto := Devuelto + AF^.Debito;
                   DiasDevuelto := DiasDevuelto + AF^.Dias;
                 end;
              end;

           with IBQuery do
           begin
             sql.Clear;
             sql.Add('Select CUOTA_NUMERO from "col$tablaliquidacion"');
             sql.Add(' where "col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
             sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and ');
             Sql.Add('"col$tablaliquidacion"."PAGADA" = 0 ');
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_COLOCACION').AsString := Colocacion;
             Open;
             vCuotaNo := FieldByName('CUOTA_NUMERO').AsInteger;
             Close;
           end;

           EdCapital.Caption:= FormatCurr('#,#0',Capital);
           EdIntereses.Caption := FormatCurr('#,#0',Causado+Corriente+Anticipado+Vencido);
           EdDIntereses.Caption := IntToStr(DiasCausado+DiasCorriente+DiasAnticipado+DiasVencido);
           EdDevuelto.Caption := FormatCurr('#,#0',Devuelto);
           EdDDevuelto.Caption := IntToStr(DiasDevuelto);
           EdNuevoSaldo.Caption := FormatCurr('#,#0',Nuevosaldo);
           Total := Capital + Causado + Corriente + Vencido + Anticipado-Devuelto;
           EdTotal.Caption := FormatCurr('#,#0',Total);
           EdTotal1.Caption := FormatCurr('#,#0',Total);
           CmdInforme.Enabled := True;
end;

function TfrmLiquidacionporCaja.BuscarCodigoPuc(Codigo: String): String;
begin
        with dmColocacion.IBSQL do
        begin
            SQL.Clear;
            SQL.Add('select NOMBRE from "con$puc" where ');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and CODIGO = :"CODIGO" ');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('CODIGO').AsString := Codigo;
            ExecQuery;
            if RecordCount = 0 then
               Result := 'CODIGO NO EXISTE'
            else
               Result := FieldByName('NOMBRE').AsString;
            Close;
        end;
end;

procedure TfrmLiquidacionporCaja.Grabarextracto;
begin
        with IBQuery1 do
         begin
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
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vNoComprobante);
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := Now;
          ParamByName('HORA_EXTRACTO').AsDateTime := Time;
          ParamByName('CUOTA_EXTRACTO').AsInteger := Cuota_anterior;
          ParamByName('TIPO_OPERACION').AsInteger := vTipoOperacion;
          ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
          ParamByName('ABONO_CAPITAL').AsCurrency := abono_capital;
          ParamByName('ABONO_CXC').AsCurrency := abono_cxc;
          ParamByName('ABONO_SERVICIOS').AsCurrency := abono_servicios;
          ParamByName('ABONO_ANTICIPADO').AsCurrency := abono_anticipado;
          ParamByName('ABONO_MORA').AsCurrency := abono_mora;
          ParamByName('ABONO_SEGURO').AsCurrency := vseguro;
          ParamByName('ABONO_PAGXCLI').AsCurrency := vpagxcliente;
          ParamByName('ABONO_HONORARIOS').AsCurrency := vhonorarios;
          ParamByName('ABONO_OTROS').AsCurrency := votrospagos;
          ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasa;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          ParamByName('INTERES_PAGO_HASTA').AsDate := InteresesHasta;
          ParamByName('CAPITAL_PAGO_HASTA').AsDate := CapitalHasta;
          ParamByName('TIPO_ABONO').AsBoolean := False;
          ExecSQL;
          Close;
          abono_capital := 0;
          abono_cxc := 0;
          abono_servicios := 0;
          abono_mora := 0;
          abono_anticipado := 0;
          vhonorarios := 0;
         end;
end;


procedure TfrmLiquidacionporCaja.EdNumeroColocacionExit(Sender: TObject);
var TasaEfectiva:Double;
TasaAplicada : Double;
Saldo : Currency;
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;

           colocacion := trim(EdNumeroColocacion.Text);
           EdNumeroColocacion.Text := colocacion;

        If EdNumeroColocacion.Text = '' then Exit;

        with IBQuery do
        begin
                SQL.Clear;
                SQL.Add('SELECT ');
                SQL.Add('"col$colocacion".ID_AGENCIA,');
                SQL.Add('"col$colocacion".ID_COLOCACION,');
                SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
                SQL.Add('"col$colocacion".ID_PERSONA,');
                SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
                SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
                SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO_ACTUAL,');
                SQL.Add('"col$colocacion".PLAZO_COLOCACION,');
                SQL.Add('"col$colocacion".TIPO_INTERES,');
                SQL.Add('"col$tasavariables".DESCRIPCION_TASA,');
                SQL.Add('"col$tasavariables".VALOR_ACTUAL_TASA,');
                SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
                SQL.Add('"col$colocacion".TASA_INTERES_MORA,');
                SQL.Add('"col$colocacion".PUNTOS_INTERES,');
                SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
                SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
                SQL.Add('"col$colocacion".PERIODO_GRACIA,');
                SQL.Add('"col$colocacion".DIAS_PRORROGADOS,');
                SQL.Add('"col$colocacion".VALOR_CUOTA,');
                SQL.Add('"col$tiposcuota".CAPITAL,');
                SQL.Add('"col$tiposcuota".INTERES,');
                SQL.Add('"col$tiposcuota".TIPO_CUOTA,');
                SQL.Add('"col$colocacion".FECHA_CAPITAL,');
                SQL.Add('"col$colocacion".FECHA_INTERES,');
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
                SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO) ');
                SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION) ');
                SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA) ');
                SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA) ');
                SQL.Add('LEFT OUTER JOIN "col$tasavariables" ON ("col$colocacion".ID_INTERES = "col$tasavariables".ID_INTERES) ');
                SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
                SQL.Add('LEFT OUTER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) ');
                SQL.Add(' JOIN "gen$tiposidentificacion" ON ("col$colocacion".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION) ');
                SQL.Add(' WHERE ');
                SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
                SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');

                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := colocacion;
                Open;

                if RecordCount > 0 then
                begin
                      if (FieldByName('ES_NOVISADO').AsInteger <> 0) or
                         (FieldByName('ES_ANULADO').AsInteger <> 0)  or
                         (FieldByName('ES_CANCELADO').AsInteger <> 0 ) then
                      begin
                          MessageDlg('Esta Colocación no se puede Liquidar',mtError,[mbOK],0);
                          EdNumeroColocacion.SetFocus;
                          Exit;
                      end;

                      EdNumeroIdentificacion.Caption := FieldByName('ID_IDENTIFICACION').AsString + '-' + FieldByName('ID_PERSONA').AsString ;
                      EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
                      EdSaldoColocacion.Caption := FormatCurr('#,#0',Saldo);
                      EdPlazo.Caption := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
                      if FieldByName('TIPO_INTERES').AsString = 'F' then
                        TasaEfectiva :=FieldByName('TASA_INTERES_CORRIENTE').AsFloat
                      else
                        TasaEfectiva :=FieldByName('VALOR_ACTUAL_TASA').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat;
                      EdAmortizaCapital.Caption := IntToStr(FieldByName('AMORTIZA_CAPITAL').AsInteger);
                      EdAmortizaInteres.Caption := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
                      EdValorCuota.Caption := FormatCurr('#,#0',FieldByName('VALOR_CUOTA').AsCurrency);
                      FechaKant := FieldByname('FECHA_CAPITAL').AsDateTime;
                      EdFechaCapital.Caption := DateToStr(Fechakant);
                      EdFechaInteres.Caption := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                      if FieldByName('INTERES').AsString = 'V' then
                      begin
                         TasaAplicada := TasaNominalVencida(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger);
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end
                      else
                      begin
                         TasaAplicada := TasaNominalAnticipada(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger);
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end;
                      vTasa := TasaAplicada;
                      Close;

                      if Saldo <= 0 then
                       begin
                         MessageDlg('Credito Cancelado',mtCustom,[mbOK],0);
                         CmdLiquidar.Enabled := False;
                         CmdNuevo.Click;
                         Exit;                         
                       end;

                      IBQuery1.SQL.Clear;
                      IBQuery1.SQL.Add('select count(*) as CUOTAS from "col$tablaliquidacion" where ');
                      IBQuery1.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and');
                      IBQuery1.SQL.Add('PAGADA = 0');
                      IBQuery1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      IBQuery1.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
                      IBQuery1.Open;

                      EdTotalCuotas.Caption := 'de ' + IntToStr(IBQuery1.FieldByName('CUOTAS').AsInteger) + ' posible(s)';
                      EdCuotas.MaxValue := IBQuery1.FieldByName('CUOTAS').AsInteger;
                      IBQuery1.Close;
                      IBquery.Close;
                      CmdLiquidar.Enabled := True;
                      EdCuotas.SetFocus;
                end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                      CmdNuevo.SetFocus;
                end;
        end;
end;

procedure TfrmLiquidacionporCaja.CmdLiquidarClick(Sender: TObject);
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I:Integer;
    Clasificacion:Integer;
    Categoria:string;
    Garantia:Integer;
    SaldoActual:Currency;
    TipoCapital:string;
    TipoInteres:string;
    TipoCuota:Integer;
    FechaPagoK:TDate;
    FechaPagoI:TDate;
    Estado:Integer;
    ValorTasa:Double;
    ValorMora:Double;
    ValorCuota:Currency;
    PuntosAdic:Double;
    AmortizaK:Integer;
    AmortizaI:Integer;
    DiasProrroga:Integer;
    {Capital   :Currency;
    Causado   :Currency;
    Corriente :Currency;
    Vencido   :Currency;
    Anticipado:Currency;
    Devuelto  :Currency;}
begin
  with IBQuery do
   begin
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colocacion".ID_CLASIFICACION,');
     SQL.Add('"col$colocacion".ID_CATEGORIA,');
     SQL.Add('"col$colocacion".ID_GARANTIA,');
     SQL.Add('("col$colocacion".VALOR_DESEMBOLSO -  "col$colocacion".ABONOS_CAPITAL ) as SALDO_ACTUAL,');
     SQL.Add('"col$tiposcuota".CAPITAL,');
     SQL.Add('"col$tiposcuota".INTERES,');
     SQL.Add('"col$tiposcuota".TIPO_CUOTA,');
     SQL.Add('"col$colocacion".TIPO_INTERES,');
     SQL.Add('"col$tasavariables".VALOR_ACTUAL_TASA,');
     SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
     SQL.Add('"col$colocacion".TASA_INTERES_MORA,');
     SQL.Add('"col$colocacion".PUNTOS_INTERES,');
     SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
     SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
     SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
     SQL.Add('"col$colocacion".DIAS_PRORROGADOS,');
     SQL.Add('"col$colocacion".FECHA_CAPITAL,');
     SQL.Add('"col$colocacion".FECHA_INTERES,');
     SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
     SQL.Add('"col$colocacion".VALOR_CUOTA');
     SQL.Add(' FROM ');
     SQL.Add('"col$colocacion" ');
     SQL.Add('LEFT OUTER JOIN "col$tasavariables" ON ("col$colocacion".ID_INTERES = "col$tasavariables".ID_INTERES) ');
     SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
     SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" ');
     ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
     ParamByName('ID_COLOCACION').AsString := Trim(EdNumeroColocacion.Text);
     Open;

     Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
     Categoria     := FieldByName('ID_CATEGORIA').AsString;
     Garantia      := FieldByName('ID_GARANTIA').AsInteger;
     SaldoActual   := FieldByName('SALDO_ACTUAL').AsCurrency;
     vSaldoActual  := SaldoActual;
     TipoCuota     := FieldByName('ID_TIPO_CUOTA').AsInteger;
     ValorCuota    := FieldByName('VALOR_CUOTA').AsCurrency;
     if FieldByName('TIPO_INTERES').AsString = 'F' then
      ValorTasa := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
     else
      ValorTasa := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
     ValorMora     := ValorTasa + FieldByName('TASA_INTERES_MORA').AsFloat;
     PuntosAdic := FieldByName('PUNTOS_INTERES').AsFloat;
     AmortizaK     := FieldByName('AMORTIZA_CAPITAL').AsInteger;
     AmortizaI     := FieldByName('AMORTIZA_INTERES').AsInteger;
     DiasProrroga  := FieldByName('DIAS_PRORROGADOS').AsInteger;
     FechaPagoK    := FieldByName('FECHA_CAPITAL').AsDateTime;
     FechaPagoI    := FieldByName('FECHA_INTERES').AsDateTime;
     Estado        := FieldByName('ID_ESTADO_COLOCACION').AsInteger;

     Close;
   end;

  if TipoCuota = 1 then
   LiquidarCuotasFija(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,
                     FechaPagoK,FechaPagoI,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if TipoCuota = 2 then
   LiquidarCuotasVarAnticipada(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,
                     FechaPagoK,FechaPagoI,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if TipoCuota = 3 then
   LiquidarCuotasVarVencida(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,
                     FechaPagoK,FechaPagoI,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);


        if CuotasLiq.Liquidado then
        begin
         Colocacion := EdNumeroColocacion.Text;
         Lista := CuotasLiq.Lista;
         Asociado := EdNombre.Caption;
         FechaCorte := EdFechaCorte.Date;
         ProximaCuota := CuotasLiq.FechaProx;
         NuevoSaldo := CuotasLiq.NuevoSaldo;
         InteresesHasta := CuotasLiq.InteresesHasta;
         CapitalHasta := CuotasLiq.CapitalHasta;
         MostrarFormulario;
         Panel4.Visible := False;
         Panel1.Visible := True;
         CmdGrabar.Enabled := True;
         CmdGrabar.SetFocus;
        end;
end;


procedure TfrmLiquidacionporCaja.EdNocomprobanteExit(Sender: TObject);
var
comprobante : string;
begin
        if EdNoComprobante.Text = '' then
           vNoComprobante := ''
        else
         begin
           comprobante := trim(EdNoComprobante.Text);
           vNoComprobante := formatcurr('0000000',strtoint(comprobante));
           EdNoComprobante.Text := vNoComprobante;
           CmdLiquidar.SetFocus;
         end;
end;

procedure TfrmLiquidacionporCaja.Empleado;
begin
        with dmColocacion.IBQuery do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
         end;
end;

Procedure TfrmLiquidacionporCaja.GrabarTablaLiquidacion;
begin
        with IBQuery1 do
         begin
          sql.Clear;
          sql.Add('update "col$tablaliquidacion" set');
          sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
          sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
          sql.Add(' where ');
          sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
          sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('CUOTA_NUMERO').AsInteger := Cuota_anterior;
          ParamByName('PAGADA').AsBoolean := true;
          ParamByName('FECHA_PAGADA').AsDate := Now;
          ExecSQL;
          Close;
         end;
end;

procedure TfrmLiquidacionporCaja.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
        Inicializar;
end;

Procedure TfrmLiquidacionporCaja.Inicializar;
begin
            ControlLiquidacion.ActivePageIndex := 0;
            EdNumeroColocacion.Enabled := True;
            EdNumeroIdentificacion.Enabled := True;
            EdNombre.Enabled := True;
            EdNoComprobante.Enabled := True;
            EdNumeroColocacion.Text := '';
            EdNumeroIdentificacion.Caption := '';
            EdNombre.Caption := '';
            EdSaldoColocacion.Caption := '';
            EdPlazo.Caption := '';
            EdAmortizaCapital.Caption := '';
            EdAmortizaInteres.Caption := '';
            EdValorCuota.Caption := '';
            EdTasaNominal.Caption := '';
            EdFechaCapital.Caption := '';
            EdFechaInteres.Caption := '';
            EdCuotas.Value := 1;
            EdFechaCorte.Date := Date;
            EdNocomprobante.Text := '';
            dmColocacion.IBDSagencias.Open;
            dmColocacion.IBDSagencias.Last;
            dmColocacion.IBDSagencias.First;
            EdAgencia.KeyValue := Agencia;
            CmdBuscar.Enabled := True;
            Panel4.Visible := True;
            Panel1.Visible := False;
            EdCapital.Caption:= '';
            EdIntereses.Caption := '';
            EdDIntereses.Caption := '';
            EdDevuelto.Caption := '';
            EdDDevuelto.Caption := '';
            EdNuevoSaldo.Caption := '';
            EdTotal.Caption := '';
            EdTotal1.Caption := '';
            EdNumeroColocacion.SetFocus;

end;

procedure TfrmLiquidacionporCaja.CmdGrabarClick(Sender: TObject);
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I,J : integer;
    AR:PCuotasLiq;
begin
    abono_capital := 0;
    abono_cxc := 0;
    abono_servicios := 0;
    abono_mora := 0;
    abono_anticipado := 0;
    Cuota_anterior := 0;
    cambio := false;

      if vNoComprobante = '' then
       begin
        MessageDlg('El Número de Comprobante no puede estar en blanco',mtError,[mbOK],0);
        EdNoComprobante.SetFocus;
        Exit;
       end;

      with IBQuery do
        try
         for J := 0 to Lista.Count - 1 do
          begin
            AR := Lista.Items[J];
            if AR^.CuotaNumero <> Cuota_anterior then
              if cambio = false then
                 cambio := true
              else
               begin
                 grabarextracto;
                 grabartablaliquidacion;
               end;
            Cuota_anterior := AR^.CuotaNumero;
            if AR^.EsCapital then
               abono_capital := abono_capital + AR^.Credito;
            if AR^.EsCausado then
               abono_cxc := abono_cxc + AR^.Credito;
            if AR^.EsCorriente then
               abono_servicios := abono_servicios + AR^.Credito;
            if AR^.EsVencido then
               abono_mora := abono_mora + AR^.Credito;
            if AR^.EsAnticipado then
               abono_anticipado := abono_anticipado + AR^.Credito;
          end;

          grabarextracto;
          grabartablaliquidacion;

          SQL.Clear;
          SQL.Add('insert into "col$extractodet" values (');
          SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
          SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
          SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
          if  Lista.Count > 0 then
          for I := 0 to Lista.Count -1 do
           begin
             Application.ProcessMessages;
             AR := Lista.Items[I];
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(vNocomprobante);
             ParamByName('ID_COLOCACION').AsString := colocacion;
             ParamByName('FECHA_EXTRACTO').AsDate := Now;
             ParamByName('HORA_EXTRACTO').AsDateTime := Time;
             ParamByName('CODIGO_PUC').AsString := AR^.CodigoPuc;
             ParamByName('FECHA_INICIAL').AsDate := AR^.FechaInicial;
             ParamByName('FECHA_FINAL').AsDate := AR^.FechaFinal;
             ParamByName('DIAS_APLICADOS').AsInteger := AR^.Dias;
             ParamByName('TASA_LIQUIDACION').AsFloat := AR^.Tasa;
             ParamByName('VALOR_DEBITO').AsCurrency := AR^.Debito;
             ParamByName('VALOR_CREDITO').AsCurrency := AR^.Credito;
             ExecSql;
             Close;
          end;

          sql.Clear;
          sql.Add('update "col$colocacion" set ');
          sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
          sql.Add('"col$colocacion"."FECHA_CAPITAL" =:"FECHA_CAPITAL",');
          sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
          sql.Add(' where ');
          sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ParamByName('ABONOS_CAPITAL').AsCurrency := Capital;
          ParamByName('FECHA_CAPITAL').AsDate := CapitalHasta;
          ParamByName('FECHA_INTERES').AsDate := InteresesHasta;
          ExecSql;
          Close;

          if MessageDlg('Seguro de Realizar el Abono?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
           begin
             Transaction.CommitRetaining;
             MessageDlg('Cuotas Abonadas',mtInformation,[mbOK],0);
           end
          else
           begin
             Transaction.RollbackRetaining;
             MessageDlg('Cuotas NO Abonadas',mtInformation,[mbOK],0);
           end;
        except
          Transaction.RollbackRetaining;
          MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
        end;
    EdNocomprobante.Enabled := false;
    CmdGrabar.Enabled := False;
    Panel1.Visible := False;
    Panel4.Visible := True;
    CmdNuevo.Click;
end;

procedure TfrmLiquidacionporCaja.EdAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLiquidacionporCaja.EdNumeroColocacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLiquidacionporCaja.EdCuotasKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLiquidacionporCaja.EdCuotasExit(Sender: TObject);
begin
        EdNoComprobante.SetFocus;
end;

procedure TfrmLiquidacionporCaja.CmdNuevoClick(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
        Inicializar;
end;

procedure TfrmLiquidacionporCaja.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLiquidacionporCaja.EdNocomprobanteKeyPress(Sender: TObject;
  var Key: Char);
begin
    EnterTabs(Key,Self);
end;

procedure TfrmLiquidacionporCaja.CmdInformeClick(Sender: TObject);
var Tabla:string;
    I:Integer;
    AF:PCuotasLiq;
    frmVistaPreliminar:TfrmVistaPreliminar;
begin
        Empleado;
        Tabla := '"temp' + FloatToStr(Now)+ '"';
        with IBQuery do
        begin
           SQL.Clear;
           SQL.Add('create table ' + Tabla + ' (');
           SQL.Add('CUOTA               INTEGER,');
           SQL.Add('CODIGO              CHAR(18),');
           SQL.Add('ID_AGENCIA          TIPOS,');
           SQL.Add('FECHA_INICIAL       DATE,');
           SQL.Add('FECHA_FINAL         DATE,');
           SQL.Add('DIAS                INTEGER,');
           SQL.Add('TASA                DOUBLE PRECISION,');
           SQL.Add('DEBITO              NUMERICO,');
           SQL.Add('CREDITO             NUMERICO);');
           ExecSQL;
           Transaction.CommitRetaining;
           Close;

           SQL.Clear;
           SQL.Add('insert into ' + Tabla + 'values(');
           SQL.Add(':"CUOTA",');
           SQL.Add(':"CODIGO",');
           SQL.Add(':"ID_AGENCIA",');
           SQL.Add(':"FECHA_INICIAL",');
           SQL.Add(':"FECHA_FINAL",');
           SQL.Add(':"DIAS",');
           SQL.Add(':"TASA",');
           SQL.Add(':"DEBITO",');
           SQL.Add(':"CREDITO");');

           for I := 0 to (MyLista.Count - 1) do
           begin
                AF := MyLista.Items[I];
                ParamByName('CUOTA').AsInteger := AF^.CuotaNumero;
                ParamByName('CODIGO').AsString := AF^.CodigoPuc;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA_INICIAL').AsDate := AF^.FechaInicial;
                ParamByName('FECHA_FINAL').AsDate := AF^.FechaFinal;
                ParamByName('DIAS').AsInteger := AF^.Dias;
                ParamByName('TASA').AsFloat := AF^.Tasa;
                ParamByName('DEBITO').AsCurrency := AF^.Debito;
                ParamByName('CREDITO').AsCurrency := AF^.Credito;
                ExecSQL;
           end;
           Close;

           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('CUOTA,');
           SQL.Add(Tabla + '.CODIGO,');
           SQL.Add('NOMBRE,');
           SQL.Add('FECHA_INICIAL,');
           SQL.Add('FECHA_FINAL,');
           SQL.Add('DIAS,');
           SQL.Add('TASA,');
           SQL.Add('DEBITO,');
           SQL.Add('CREDITO ');
           SQL.Add('from ' + Tabla + ' ');

           SQL.Add('LEFT JOIN "con$puc" ON (' + Tabla + '.CODIGO = "con$puc".CODIGO and ');
           SQL.Add(Tabla + '.ID_AGENCIA = "con$puc".ID_AGENCIA )');
           Open;

           Report.Variables.ByName['Empresa'].AsString := Empresa;
           Report.Variables.ByName['Colocacion'].AsString := Colocacion;
           Report.Variables.ByName['Hoy'].AsDateTime := Now;
           Report.Variables.ByName['ProximaCuota'].AsDateTime := ProximaCuota;
           Report.Variables.ByName['FechaCorte'].AsDateTime := FechaCorte;
           Report.Variables.ByName['Asociado'].AsString := Asociado;
           Report.Variables.ByName['NuevoSaldo'].AsDouble := NuevoSaldo;
           REport.Variables.ByName['InteresesHasta'].AsDateTime := InteresesHasta;
           Report.Variables.ByName['CapitalHasta'].AsDateTime := CapitalHasta;
           Report.Variables.ByName['comprobante'].AsString := VNoComprobante;
           Report.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;

           if Report.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Report;
              frmVistaPreliminar.ShowModal;
           end;
//              Report.PreviewPreparedReport(True);

           SQL.Clear;
           SQL.Add('drop table ' + Tabla);
           ExecSQL;
           Close;
           Transaction.CommitRetaining;
        end;
end;

procedure TfrmLiquidacionporCaja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmLiquidacionporCaja.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmLiquidacionporCaja.CmdCancelarClick(Sender: TObject);
begin
         LimpiarLiquidacion;
         controlLiquidacion.ActivePageIndex := 0;
         Inicializar;
end;

procedure TfrmLiquidacionporCaja.EdNumeroColocacionEnter(Sender: TObject);
begin
        EdNumeroColocacion.SelectAll;
end;

procedure TfrmLiquidacionporCaja.LimpiarLiquidacion;
var I : Integer;
begin
         EdNocomprobante.Enabled := True;
         EdNoComprobante.Text := '';
         EdNuevoSaldo.Caption := '';
         EdIntereses.Caption := '';
         EdDIntereses.Caption := '';
         EdDevuelto.Caption := '';
         EdDDevuelto.Caption := '';
         EdVencido.Caption := '';
         EdDVencido.Caption := '';
         EdCapital.Caption := '';
         EdTotal.Caption := '';
end;

procedure TfrmLiquidacionporCaja.CmdBuscarClick(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;
end;

procedure TfrmLiquidacionporCaja.CmdReversarClick(Sender: TObject);
begin
          DmGeneral.IBTransaction1.RollbackRetaining;
          MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
          Panel4.Visible := True;
          CmdNuevo.Click
end;

end.
