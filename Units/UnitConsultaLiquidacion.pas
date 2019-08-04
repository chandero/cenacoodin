unit UnitConsultaLiquidacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, lmdstdcA, ComCtrls, DBCtrls, StdCtrls, Buttons,
  pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery;

type
  TfrmConsultaLiquidacion = class(TForm)
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
    EdAgencia: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label19: TLabel;
    Label5: TLabel;
    EdValorCuota: TStaticText;
    EdPlazo: TStaticText;
    EdAmortizaCapital: TStaticText;
    EdAmortizaInteres: TStaticText;
    EdSaldoColocacion: TStaticText;
    EdTasaNominal: TStaticText;
    EdFechaCapital: TStaticText;
    EdFechaInteres: TStaticText;
    EdFechaCorte: TDateTimePicker;
    EdCuotas: TLMDSpinEdit;
    EdTotalCuotas: TStaticText;
    EdTotal1: TStaticText;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label6: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label21: TLabel;
    Label7: TLabel;
    EdNuevoSaldo: TStaticText;
    EdIntereses: TStaticText;
    EdDevuelto: TStaticText;
    EdVencido: TStaticText;
    EdDIntereses: TStaticText;
    EdDDevuelto: TStaticText;
    EdDVencido: TStaticText;
    EdCapital: TStaticText;
    EdTotal: TStaticText;
    Panel4: TPanel;
    CmdLiquidar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery: TIBQuery;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    Report: TprTxReport;
    CmdInforme: TBitBtn;
    PagoTotal: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroColocacionEnter(Sender: TObject);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdCuotasExit(Sender: TObject);
    procedure PagoTotalClick(Sender: TObject);
  private
    { Private declarations }
    MyLista :TList;
    FAgencia:Integer;
    FColocacion:string;
    procedure Inicializar;
    procedure MostrarFormulario;
  public
    { Public declarations }
    property Lista:TList read MyLista Write MyLista;
    property Agencia:Integer read FAgencia Write FAgencia;
    property Colocacion:string read FColocacion Write FColocacion;
  end;

var
  frmConsultaLiquidacion: TfrmConsultaLiquidacion;
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
  ProximaCuota:TDate;
  FechaCorte:TDate;
  Asociado:string;
  NuevoSaldo:Currency;
  InteresesHasta:TDate;
  CapitalHasta:TDate;
  CredPagoTotal:Boolean;
implementation

uses UnitdmColocacion,UnitdmGeneral,UnitVistaPreliminar,
     UnitGlobalesCol, UnitBuscarColocacion, UnitGlobales;

{$R *.dfm}

procedure TfrmConsultaLiquidacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmConsultaLiquidacion.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmConsultaLiquidacion.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;
        Inicializar;
        if (FAgencia <> 0) and (FColocacion <> '') then
        begin
            EdAgencia.KeyValue := FAgencia;
            EdNumeroColocacion.Text := FColocacion;
            EdNumeroColocacionExit(Sender);
        end;
end;

procedure TfrmConsultaLiquidacion.EdNumeroColocacionEnter(Sender: TObject);
begin
        EdNumeroColocacion.SelectAll;
end;

procedure TfrmConsultaLiquidacion.EdNumeroColocacionExit(Sender: TObject);
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
                SQL.Add('"col$tasasvariables".DESCRIPCION_TASA,');
                SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
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
                SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
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
                          MessageDlg('Esta Colocaci?n no se puede Liquidar',mtError,[mbOK],0);
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
                        TasaEfectiva :=FieldByName('VALOR_ACTUAL_TASA').AsFloat;
                      EdAmortizaCapital.Caption := IntToStr(FieldByName('AMORTIZA_CAPITAL').AsInteger);
                      EdAmortizaInteres.Caption := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
                      EdValorCuota.Caption := FormatCurr('#,#0',FieldByName('VALOR_CUOTA').AsCurrency);
                      FechaKant := FieldByname('FECHA_CAPITAL').AsDateTime;
                      EdFechaCapital.Caption := DateToStr(Fechakant);
                      EdFechaInteres.Caption := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                      if FieldByName('INTERES').AsString = 'V' then
                      begin
                         TasaAplicada := TasaNominalVencida(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger) + + FieldByName('PUNTOS_INTERES').AsFloat;
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end
                      else
                      begin
                         TasaAplicada := TasaNominalAnticipada(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger)  + FieldByName('PUNTOS_INTERES').AsFloat;
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end;
                      vTasa := TasaAplicada;
                      Close;

                      if Saldo <= 0 then
                       begin
                         MessageDlg('Credito Cancelado',mtCustom,[mbOK],0);
                         CmdLiquidar.Enabled := False;
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
                      MessageDlg('N?mero de Colocaci?n No Existe',mtError,[mbOK],0);
                end;
        end;
end;

procedure TfrmConsultaLiquidacion.EdNumeroColocacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(sender,key);
end;

procedure TfrmConsultaLiquidacion.CmdLiquidarClick(Sender: TObject);
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I:Integer;
    Clasificacion:Integer;
    Categoria:string;
    Garantia:Integer;
    SaldoActual:Currency;
    TipoCapital:string;
    TipoInteres:integer;
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
     SQL.Add('"col$colocacion".ID_INTERES,');
     SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
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
     SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
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
     TipoInteres   := FieldByName('ID_INTERES').AsInteger;
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

  if (TipoCuota = 1) and (CredPagoTotal) then
   LiquidarCuotasFijaPagoTotal(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if (TipoCuota = 1) then
   LiquidarCuotasFija(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);

  if (TipoCuota = 2) and (CredPagoTotal) then
   LiquidarCuotasVarAnticipadaPagoTotal(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if (TipoCuota = 2) then
   LiquidarCuotasVarAnticipada(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);

  if (TipoCuota = 3) and (CredPagoTotal)  then
   LiquidarCuotasVarVencidaPagoTotal(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
  else if (TipoCuota = 3) then
   LiquidarCuotasVarVencida(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);



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
        end;
end;


procedure TfrmConsultaLiquidacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure tfrmconsultaliquidacion.Inicializar;
begin
            ControlLiquidacion.ActivePageIndex := 0;
            EdNumeroColocacion.Enabled := True;
            EdNumeroIdentificacion.Enabled := True;
            EdNombre.Enabled := True;
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
            dmColocacion.IBDSagencias.Open;
            dmColocacion.IBDSagencias.Last;
            dmColocacion.IBDSagencias.First;
            EdAgencia.KeyValue := Agencia;
            Panel4.Visible := True;
            EdCapital.Caption:= '';
            EdIntereses.Caption := '';
            EdDIntereses.Caption := '';
            EdDevuelto.Caption := '';
            EdDDevuelto.Caption := '';
            EdNuevoSaldo.Caption := '';
            EdTotal.Caption := '';
            EdTotal1.Caption := '';
            CredPagoTotal := False;
            EdNumeroColocacion.SetFocus;

end;

procedure tfrmconsultaliquidacion.MostrarFormulario;
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
           EdVencido.Caption := FormatCurr('#,#0',Vencido);
           EdDVencido.Caption := IntToStr(DiasVencido);
           EdNuevoSaldo.Caption := FormatCurr('#,#0',Nuevosaldo);
           Total := Capital + Causado + Corriente + Vencido + Anticipado-Devuelto;
           EdTotal.Caption := FormatCurr('#,#0',Total);
           EdTotal1.Caption := FormatCurr('#,#0',Total);
           CmdInforme.Enabled := True;
end;

procedure TfrmConsultaLiquidacion.CmdInformeClick(Sender: TObject);
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

           SQL.Add('LEFT JOIN CON$PUC ON (' + Tabla + '.CODIGO = CON$PUC.CODIGO and ');
           SQL.Add(Tabla + '.ID_AGENCIA = CON$PUC.ID_AGENCIA )');
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

procedure TfrmConsultaLiquidacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmConsultaLiquidacion.EdCuotasExit(Sender: TObject);
begin
        CmdLiquidar.SetFocus;
end;

procedure TfrmConsultaLiquidacion.PagoTotalClick(Sender: TObject);
begin
        if PagoTotal.Checked = True then
          CredPagoTotal := True
        else
          CredPagoTotal := False;
end;

end.
