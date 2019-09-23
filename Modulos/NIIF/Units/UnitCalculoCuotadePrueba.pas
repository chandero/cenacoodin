unit UnitCalculoCuotadePrueba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery,
  Buttons, ExtCtrls, lmdstdcA, Grids, XStringGrid, IBSQL, DateUtils, Math,
  JvEdit, JvTypedEdit, UnitDmGeneral, UnitDmColocacion ;

type
  TfrmCalculoCuotadePrueba = class(TForm)
    GroupBox1: TGroupBox;
    Label18: TLabel;
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
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    EdValorCuota: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdNumeroColocacion: TMemo;
    EdTipoIdentificacion: TStaticText;
    EdNumeroIdentificacion: TStaticText;
    EdNombre: TStaticText;
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
    EdTasaMora: TStaticText;
    EdTipoCuota: TStaticText;
    EdAmortizaCapital: TStaticText;
    EdAmortizaInteres: TStaticText;
    EdPeriodoGracia: TStaticText;
    IBQuery: TIBQuery;
    Panel4: TPanel;
    CmdGrabar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    CmdBuscar: TBitBtn;
    Label20: TLabel;
    EdSaldoColocacion: TStaticText;
    EdTasaMaxima: TStaticText;
    Label21: TLabel;
    Label22: TLabel;
    EdTasaNominal: TStaticText;
    EdCuotas: TLMDSpinEdit;
    Label29: TLabel;
    EdFechaCorte: TDateTimePicker;
    Label30: TLabel;
    EdDiasProrroga: TStaticText;
    IBQuery1: TIBQuery;
    EdTotalCuotas: TStaticText;
    EdAgencia: TDBLookupComboBox;
    Label31: TLabel;
    EdTasaMaximaNominal: TStaticText;
    IBSaldo: TIBSQL;
    EdProrroga: TEdit;
    prorroga: TCheckBox;
    Label27: TLabel;
    EdFechaCapital: TStaticText;
    Label28: TLabel;
    EdFechaInteres: TStaticText;
    IBNacional: TIBSQL;
    DataSource1: TDataSource;
    IBQuery3: TIBQuery;
    IBVerificaTmp: TIBSQL;
    GrupoNal: TGroupBox;
    GrupoLib: TGroupBox;
    Label32: TLabel;
    EdNacional: TJvCurrencyEdit;
    Label33: TLabel;
    DBLCBBancos: TDBLookupComboBox;
    Label34: TLabel;
    EdFechaConsignacion: TDateTimePicker;
    EdLibranza: TJvCurrencyEdit;
    GrupoAbono: TRadioGroup;
    Label35: TLabel;
    GrupoOtros: TGroupBox;
    Fallecido: TCheckBox;
    Incapacitado: TCheckBox;
    PagoTotal: TCheckBox;
    IBQAgencia: TIBQuery;
    DSAgencia: TDataSource;
    IBQOtros: TIBQuery;
    GrupoEfectivo: TGroupBox;
    Label36: TLabel;
    EdEfectivo: TJvCurrencyEdit;
    Label37: TLabel;
    EdFechaNota: TDateTimePicker;
    procedure CmdBuscarClick(Sender: TObject);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGrabarClick(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdProrrogaEnter(Sender: TObject);
    procedure EdProrrogaExit(Sender: TObject);
    procedure FallecidoClick(Sender: TObject);
    procedure PagoTotalClick(Sender: TObject);
    procedure IncapacitadoClick(Sender: TObject);
    procedure EdNacionalExit(Sender: TObject);
    procedure EdNacionalEnter(Sender: TObject);
    procedure DBLCBBancosExit(Sender: TObject);
    procedure EdFechaConsignacionExit(Sender: TObject);
    procedure GrupoAbonoClick(Sender: TObject);
    procedure EdLibranzaEnter(Sender: TObject);
    procedure EdLibranzaExit(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculoCuotadePrueba: TfrmCalculoCuotadePrueba;
  dmGeneral : TdmGeneral;
  dmColocacion: TdmColocacion;
  TipoCuota:string;
  colocacion : string;
  vcolocacion : string;
  Estado : Integer;
  vTipoId : Integer;
  vNumeroId : String;
  vTotalLiquidacion:Currency;
  DescImpuesto : Currency;
  vDiasProrroga:Integer;
  CredFallecido:Boolean;
  CredPagoTotal:Boolean;
  CredIncapacitado:Boolean;
  CredLibranza:Boolean;
  vNacional:Currency;
  vLibranza:Currency;
  vComisionNal:Currency;
  vComisionLocal:Currency;
  vConsignaAhorros:Currency;
  Banco:Integer;
  FechaCosignacion : TDate;

implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, UnitBuscarColocacion,
     UnitMuestroLiquidacionColocacion;

procedure TfrmCalculoCuotadePrueba.CmdBuscarClick(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;
end;

procedure TfrmCalculoCuotadePrueba.EdNumeroColocacionExit(Sender: TObject);
var TasaEfectiva:Double;
TasaAplicada : Double;
Saldo : Currency;
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;

           colocacion := trim(EdNumeroColocacion.Text);
           EdNumeroColocacion.Text := colocacion;

        with IBVerificaTmp do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$extractotmp" where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ExecQuery;
          if RecordCount > 0 then begin
            MessageDlg('Colocación con Liquidación Temporal para Desembolso',mtError,[mbOK],0);
            CmdNuevo.Click;
            Exit;
          end;
          Close;
        end;

        If EdNumeroColocacion.Text = '' then Exit;

        with IBQuery do
        begin
                SQL.Clear;
                SQL.Add('SELECT ');
                SQL.Add('"col$colocacion".ID_AGENCIA,');
                SQL.Add('"col$colocacion".ID_COLOCACION,');
                SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
                SQL.Add('"col$colocacion".ID_PERSONA,');
                SQL.Add('"col$colocacion".ID_CLASIFICACION,');
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
                SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
                SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
                SQL.Add('"col$estado".ES_PREJURIDICO,');
                SQL.Add('"col$estado".ES_JURIDICO,');
                SQL.Add('"col$estado".ES_CASTIGADO,');
                SQL.Add('"col$estado".ES_NOVISADO,');
                SQL.Add('"col$estado".ES_ANULADO,');
                SQL.Add('"col$estado".ES_CANCELADO,');
                SQL.Add('"col$estado".ES_SALDADO,');
                SQL.Add('"col$estado".ES_VIGENTE,');
                SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
                SQL.Add('"col$inversion".DESCRIPCION_INVERSION,');
                SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
                SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,');
                SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
                SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
                SQL.Add('"gen$persona".NOMBRE,');
                SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
                SQL.Add('"col$tablaliquidacion".CAPITAL_A_PAGAR,');
                SQL.Add('"col$tablaliquidacion".INTERES_A_PAGAR');
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
                SQL.Add('JOIN "gen$tiposidentificacion" ON ("col$colocacion".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION) ');
                SQL.Add('INNER JOIN "col$tablaliquidacion" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
                SQL.Add(' WHERE ');
                SQL.Add('("col$colocacion".ID_AGENCIA = :"ID_AGENCIA") AND ');
                SQL.Add('("col$colocacion".ID_COLOCACION = :"ID_COLOCACION")');

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
                          CmdNuevo.SetFocus;
                          Exit;
                       end;

                      if FieldByName('ES_SALDADO').AsInteger <> 0 then
                       begin
                         MessageDlg('La Colocación Está Saldada',mtError,[mbOK],0);
                         CmdNuevo.SetFocus;
                         Exit;
                       end;

                      if not(FieldByName('ES_VIGENTE').AsInteger <> 0) then
                       begin
                         MessageDlg('La Colocación No está Vigente',mtError,[mbOK],0);
                         CmdNuevo.SetFocus;
                         Exit;
                       end;

                      vTipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
                      vNumeroId := FieldByName('ID_PERSONA').AsString;
                      EdTipoIdentificacion.Caption := FieldByName('DESCRIPCION_IDENTIFICACION').AsString ;
                      EdNumeroIdentificacion.Caption := FieldByName('ID_PERSONA').AsString ;
                      EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      EdClasificacion.Caption := FieldByName('DESCRIPCION_CLASIFICACION').AsString ;
                      EdLinea.Caption := FieldByName('DESCRIPCION_LINEA').AsString ;
                      EdInversion.Caption := FieldByName('DESCRIPCION_INVERSION').AsString ;
                      EdRespaldo.Caption := FieldByName('DESCRIPCION_RESPALDO').AsString;
                      EdGarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString ;
                      EdFechaColocacion.Caption := DateToStr(FieldByName('FECHA_DESEMBOLSO').AsFloat);
                      EdValorColocacion.Caption := FormatCurr('#,#0',FieldByName('VALOR_DESEMBOLSO').AsCurrency);
                      Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
                      EdSaldoColocacion.Caption := FormatCurr('#,#0.00',Saldo);
                      EdPlazo.Caption := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
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
                        EdTasaEfectiva.Caption := FormatCurr('#0.00%',FieldByName('VALOR_ACTUAL_TASA').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat);
                        TasaEfectiva :=FieldByName('VALOR_ACTUAL_TASA').AsFloat;
                      end;

{                      if FieldByName('TASA_INTERES_CORRIENTE').AsFloat < FieldByName('VALOR_ACTUAL_TASA').AsFloat then
                      begin
                        EdTasaEfectiva.Caption := FormatCurr('#0.00%',FieldByName('TASA_INTERES_CORRIENTE').AsFloat);
                        TasaEfectiva :=FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                      end
                      else
                      begin
                        EdTasaEfectiva.Caption := FormatCurr('#0.00%',FieldByName('VALOR_ACTUAL_TASA').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat);
                        TasaEfectiva :=FieldByName('VALOR_ACTUAL_TASA').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat;
                      end;}
                      EdTasaMora.Caption := FormatCurr('#0.00%',FieldByName('TASA_INTERES_MORA').AsFloat);
                      EdTipoCuota.Caption := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                      EdAmortizaCapital.Caption := IntToStr(FieldByName('AMORTIZA_CAPITAL').AsInteger);
                      EdAmortizaInteres.Caption := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
                      EdPeriodoGracia.Caption := IntToStr(FieldByName('PERIODO_GRACIA').AsInteger);
                      EdDiasProrroga.Caption := IntToStr(FieldByName('DIAS_PRORROGADOS').AsInteger);
                      EdValorCuota.Caption := FormatCurr('#,#0',FieldByName('VALOR_CUOTA').AsCurrency);
                      FechaKant := FieldByname('FECHA_CAPITAL').AsDateTime;
                      EdFechaCapital.Caption := DateToStr(Fechakant);
                      EdFechaInteres.Caption := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                      EdTasaMaxima.Caption := FormatCurr('#0.00%',BuscoTasaEfectivaMaxima(fFechaActual,FieldByName('ID_CLASIFICACION').AsInteger,'A'));
                      Self.Caption := 'Calculo de Cuotas - Estado: '+ FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                      if FieldByName('INTERES').AsString = 'V' then
                      begin
                         EdTasaMaximaNominal.Caption := FormatCurr('#0.00%',TasaNominalVencida(BuscoTasaEfectivaMaxima(fFechaActual,FieldByName('ID_CLASIFICACION').AsInteger,'A'),FieldByName('AMORTIZA_INTERES').AsInteger));
                         TasaAplicada := TasaNominalVencida(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger)  + FieldByName('PUNTOS_INTERES').AsFloat;
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end
                      else
                      begin
                         EdTasaMaximaNominal.Caption := FormatCurr('#0.00%',TasaNominalAnticipada(BuscoTasaEfectivaMaxima(fFechaActual,FieldByName('ID_CLASIFICACION').AsInteger,'A'),FieldByName('AMORTIZA_INTERES').AsInteger));
                         TasaAplicada := TasaNominalAnticipada(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat;
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end;
                      vTasa := TasaAplicada;
                      Close;

                      IBQuery1.SQL.Clear;
                      IBQuery1.SQL.Add('select count(*) as CUOTAS from "col$tablaliquidacion" where ');
                      IBQuery1.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and');
                      IBQuery1.SQL.Add('PAGADA = 0');
                      IBQuery1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      IBQuery1.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
                      IBQuery1.Open;

                      EdTotalCuotas.Caption := 'de ' + IntToStr(IBQuery1.FieldByName('CUOTAS').AsInteger) + ' posible(s)';
                      EdCuotas.MaxValue := IBQuery1.FieldByName('CUOTAS').AsInteger;
                      if IBQuery1.FieldByName('CUOTAS').AsInteger = 1 then
                        PagoTotal.Enabled := False;
                      IBQuery1.Close;
                      IBquery.Close;
                      CmdGrabar.Enabled := True;
                      EdCuotas.SetFocus;
                end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                      CmdNuevo.SetFocus;
                end;
        end;
end;

procedure TfrmCalculoCuotadePrueba.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoCuotadePrueba.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCalculoCuotadePrueba.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := caFree;
end;

procedure TfrmCalculoCuotadePrueba.Inicializar;
begin
            if dmGeneral.IBTransaction1.InTransaction then
              dmGeneral.IBTransaction1.Rollback;
            dmGeneral.IBTransaction1.StartTransaction;
            EdNumeroColocacion.Enabled := True;
            EdTipoIdentificacion.Enabled := True;
            EdNumeroIdentificacion.Enabled := True;
            EdNombre.Enabled := True;
            EdNumeroColocacion.Text := '';
            EdTipoIdentificacion.Caption := '';
            EdNumeroIdentificacion.Caption := '';
            EdNombre.Caption := '';
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
            EdTasaMora.Caption := '';
            EdTasaMaxima.Caption := '';
            EdTasaMaximaNominal.Caption := '';
            EdTipoCuota.Caption := '';
            EdAmortizaCapital.Caption := '';
            EdAmortizaInteres.Caption := '';
            EdPeriodoGracia.Caption := '';
            EdDiasProrroga.Caption := '';
            EdValorCuota.Caption := '';
            EdTasaNominal.Caption := '';
            EdFechaCapital.Caption := '';
            EdFechaInteres.Caption := '';
            EdCuotas.Value := 1;
            EdFechaCorte.Date := fFechaActual;
            EdFechaNota.Date := fFechaActual;
            EdFechaConsignacion.Date := fFechaActual;
            IBQAgencia.Open;
            EdAgencia.KeyValue := Agencia;
            vHonorarios := 0;
            CmdBuscar.Enabled := True;
            vTotalLiquidacion := 0;
            Fallecido.Checked := False;
            Incapacitado.Checked := False;
            PagoTotal.Checked := False;
            CredFallecido := False;
            CredIncapacitado := False;
            CredPagoTotal := False;
            EdEfectivo.Value := 0;
            EdNacional.Value := 0;
            vNacional := 0;
            vComisionNal := 0;
            EdLibranza.Value := 0;
            vConsignaAhorros := 0;
            Banco := -1;
            GrupoEfectivo.Visible := True;
            GrupoNal.Visible := False;
            GrupoLib.Visible := False;
            GrupoOtros.Visible := False;
            GrupoAbono.ItemIndex := 0;
            DBLCBBancos.Enabled := False;
            DBLCBBancos.KeyValue := Banco;
end;

procedure TfrmCalculoCuotadePrueba.CmdGrabarClick(Sender: TObject);
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    AR:PCuotasLiq;
    I:Integer;
    Clasificacion:Integer;
    Categoria:string;
    Garantia:Integer;
    SaldoActual:Currency;
    TipoCapital:string;
    TipoInteres:Integer;
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
    NumeroCuenta:Integer;
    DigitoCuenta:Integer;
    SaldoAhorros:Currency;
    Movimiento:Currency;
    TotalCanje:Currency;
    vTotalAhorros:Currency;
    vAprovechamiento:Currency;
    CodigoCaja:string;
    CodigoAhorros:string;
    CodigoAportes:string;
    codigoAseguradora:string;
    CodigoBanco:string;
    CodigoLibranza:string;
    CodigoAprovechamiento: String;
    CodigoAnticipo: String;
    AbonoExtracto,RetiroExtracto:Currency;
    EsFallecido,EsIncapacitado:Integer;
    BaseGMF : Currency;
    CuotaNumero:Integer;
    frmMuestroLiquidacionColocacion: TfrmMuestroLiquidacionColocacion;
    Codigo:string;
    vTotalAPagar: Currency;
    vTotalRecibido: Currency;
    vMenorValor: Currency;
begin

  if not dmGeneral.IBDatabase1.Connected then
  begin
   try
     dmGeneral.IBDatabase1.Open;
   except
     MessageDlg('La base de datos no responde, por favor reinicie el aplicativo', mtInformation, [mbOk], 0);
     exit;
   end;
  end;
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
     SQL.Add('where ID_AGENCIA =:"ID_AGENCIA" and ID_COLOCACION =:"ID_COLOCACION" ');
     ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
     ParamByName('ID_COLOCACION').AsString := Trim(EdNumeroColocacion.Text);
     Open;

     Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
     Categoria     := FieldByName('ID_CATEGORIA').AsString;
     Garantia      := FieldByName('ID_GARANTIA').AsInteger;
     SaldoActual   := FieldByName('SALDO_ACTUAL').AsCurrency;
     vSaldoActual  := SaldoActual;
//     TipoCapital   := FieldByName('CAPITAL').AsString;
     TipoInteres   := FieldByName('ID_INTERES').AsInteger;
     TipoCuota     := FieldByName('ID_TIPO_CUOTA').AsInteger;
     ValorCuota    := FieldByName('VALOR_CUOTA').AsCurrency;

     if FieldByName('TIPO_INTERES').AsString = 'F' then
      ValorTasa := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
     else
      ValorTasa := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
     PuntosAdic := FieldByName('PUNTOS_INTERES').AsFloat;
     ValorMora     := (ValorTasa + PuntosAdic) + FieldByName('TASA_INTERES_MORA').AsFloat;
     AmortizaK     := FieldByName('AMORTIZA_CAPITAL').AsInteger;
     AmortizaI     := FieldByName('AMORTIZA_INTERES').AsInteger;
     DiasProrroga  := FieldByName('DIAS_PRORROGADOS').AsInteger;
     FechaPagoK    := FieldByName('FECHA_CAPITAL').AsDateTime;
     FechaPagoI    := FieldByName('FECHA_INTERES').AsDateTime;
     Estado        := FieldByName('ID_ESTADO_COLOCACION').AsInteger;

     Close;
   end;

  vTotalRecibido := EdEfectivo.Value + EdNacional.Value + EdLibranza.Value;
  vTotalAPagar := 0;
  
  if (TipoCuota = 1) and (CredPagoTotal or CredFallecido or CredIncapacitado) then
   LiquidarCuotasFijaPagoTotal(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,vDiasProrroga)
  else if (TipoCuota = 1) then
   LiquidarCuotasFija(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,vDiasProrroga);

  if (TipoCuota = 2) and (CredPagoTotal or CredFallecido or CredIncapacitado) then
   LiquidarCuotasVarAnticipadaPagoTotal(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,vDiasProrroga)
  else if (TipoCuota = 2) then
   LiquidarCuotasVarAnticipada(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,vDiasProrroga);
  if (TipoCuota = 3) and (CredPagoTotal or CredFallecido or CredIncapacitado)  then
   LiquidarCuotasVarVencidaPagoTotal(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,vDiasProrroga)
  else if (TipoCuota = 3) then
   LiquidarCuotasVarVencida(EdAgencia.KeyValue,EdNumeroColocacion.Text,StrToInt(EdCuotas.Text),EdFechaCorte.Date,
                     CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                     FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,vDiasProrroga);


//**
 if EdNacional.Value > 0 then begin
   IBNacional.Close;
   IBNacional.ParamByName('ID_BANCO').AsInteger := Banco;
   IBNacional.ExecQuery;
   CodigoBanco := IBNacional.FieldByName('CODIGO').AsString;
   IBNacional.Close;
 end;

  with IBSaldo do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
     ExecQuery;
     CodigoCaja := FieldByName('CODIGO').AsString;

     Close;
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 9');
     ExecQuery;
     codigoAseguradora := FieldByName('CODIGO').AsString;

     Close;
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 62');
     ExecQuery;
     CodigoLibranza := FieldByName('CODIGO').AsString;

     Close;
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 60');
     ExecQuery;
     CodigoAnticipo := FieldByName('CODIGO').AsString;

     Close;
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 61');
     ExecQuery;
     CodigoAprovechamiento := FieldByName('CODIGO').AsString;

     Close;
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 8');
     ExecQuery;
     CodigoAhorros := FieldByName('CODIGO').AsString;

     Close;
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 3');
     ExecQuery;
     CodigoAportes := FieldByName('CODIGO').AsString;

     Close;
     SQL.Clear;
     SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
     SQL.Add('where "col$estado".ES_FALLECIDO = 1');
     ExecQuery;
     EsFallecido := FieldByName('ID_ESTADO_COLOCACION').AsInteger;

     Close;
     SQL.Clear;
     SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
     SQL.Add('where "col$estado".ES_INCAPACITADO = 1');
     ExecQuery;
     EsIncapacitado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;

     if Transaction.InTransaction then
       Transaction.Rollback;
     Transaction.StartTransaction;

     Close;
     {
     sql.Clear;
     Sql.Add('select * from P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
     ParamByName('ID_PERSONA').AsString := vNumeroId;
     ExecQuery;
     NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     DigitoCuenta := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;
     }
     {
     SQL.Clear;
     SQL.Add('Select SALDO_ACTUAL from SALDOS_VIGENTES(:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
     ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
     ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
     ParamByName('FECHA2').AsDateTime := fFechaActual + StrToTime('23:59:59');
     try
      ExecQuery;
      if RecordCount < 1 then
        Saldo := 0
      else
        Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
     except
      MessageDlg('Error Consultando Saldo Ahorros',mtError,[mbcancel],0);
      raise;
      Exit;
     end;

     vTotalAhorros := saldo;
     }
     vTotalAhorros := 0;
     AbonoExtracto := 0;
     RetiroExtracto := 0;
     BaseGMF := 0;
     for I := 0 to CuotasLiq.Lista.Count - 1 do
      begin
        AF := CuotasLiq.Lista.Items[I];
        if AF^.CodigoPuc = CodigoCaja then begin
          vTotalAPagar := vTotalAPagar + AF^.Debito;
          vTotalLiquidacion := vTotalLiquidacion + AF^.Debito;
          if (CredFallecido or CredIncapacitado) then Codigo := codigoAseguradora
          else if EdLibranza.Value > 0 then Codigo := CodigoLibranza
          else if EdEfectivo.Value > 0 then Codigo := CodigoCaja
          else if EdNacional.Value > 0 then Codigo := CodigoBanco;
          CuotaNumero := AF^.CuotaNumero;
          CuotasLiq.Lista.Delete(I);
          if I = CuotasLiq.Lista.Count then Break;
//          CuotasLiq.Lista.Pack;
        end;
      end;



     New(AR);
     AR^.CuotaNumero := CuotaNumero;
     AR^.CodigoPuc   := Codigo;
     AR^.FechaInicial := fFechaActual;
     AR^.FechaFinal   := fFechaActual;
     AR^.Dias         := 0;
     AR^.Tasa         := 0;
     if EdEfectivo.Value > 0 then
       AR^.Debito := EdEfectivo.Value
     else
     if EdNacional.Value > 0 then
       AR^.Debito := EdNacional.Value
     else if EdLibranza.Value > 0 then
       AR^.Debito := EdLibranza.Value
     else AR^.Debito := vTotalLiquidacion;
     AR^.Credito      := 0;
     AR^.EsCapital := False;
     AR^.EsCausado := False;
     AR^.EsCorriente := False;
     AR^.EsVencido := False;
     AR^.EsAnticipado := False;
     AR^.EsDevuelto := False;
     AR^.EsOtros := False;
     if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);
// Es pago en Efectivo
      if EdEfectivo.Value > 0 then
      begin
        if vTotalLiquidacion < EdEfectivo.Value then
         begin
           with IBQOtros do
           begin
           SQL.Clear;
           SQL.Add('select * from "col$codigospuc" where ');
           SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
           SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
           SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
           ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
           ParamByName('ID_GARANTIA').AsInteger      := Garantia;
           ParamByName('ID_CATEGORIA').AsString     := Categoria;
           IBQOtros.Open;
           if RecordCount = 0 then
            begin
             MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
             Close;
             Exit;
            end;
           end;
           vMenorValor := EdEfectivo.Value - vTotalLiquidacion;
           CodigoAhorros := IBQOtros.FieldByName('COD_CAPITAL_CP').AsString;
           New(AR);
           AR^.CuotaNumero := CuotaNumero;
           AR^.CodigoPuc   := CodigoAhorros;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           AR^.Dias         := 0;
           AR^.Tasa         := 0;
           AR^.Debito       := 0;
           AR^.Credito      := EdEfectivo.Value - vTotalLiquidacion;
           CuotasLiq.NuevoSaldo := CuotasLiq.NuevoSaldo - AR^.Credito;
           AR^.EsCapital := True;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           AR^.EsOtros := False;
           if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);
         end
         else
         if (vTotalLiquidacion > EdEfectivo.Value) then
          begin
           with IBQOtros do
           begin
           SQL.Clear;
           SQL.Add('select * from "col$codigospuc" where ');
           SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
           SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
           SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
           ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
           ParamByName('ID_GARANTIA').AsInteger      := Garantia;
           ParamByName('ID_CATEGORIA').AsString     := Categoria;
           IBQOtros.Open;
           if RecordCount = 0 then
            begin
             MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
             Close;
             Exit;
            end;
           end;
            vMenorValor := vTotalLiquidacion - EdEfectivo.Value;
            CodigoAhorros := IBQOtros.FieldByName('COD_CAPITAL_CP').AsString;
            New(AR);
            AR^.CuotaNumero := CuotaNumero;
            AR^.CodigoPuc   := CodigoAhorros;
            AR^.FechaInicial := fFechaActual;
            AR^.FechaFinal   := fFechaActual;
            AR^.Dias         := 0;
            AR^.Tasa         := 0;
            AR^.Debito       := (vTotalLiquidacion - EdEfectivo.Value);
            AR^.Credito      := 0;
            CuotasLiq.NuevoSaldo := CuotasLiq.NuevoSaldo + AR^.Debito;
            AR^.EsCapital := True;
            AR^.EsCausado := False;
            AR^.EsCorriente := False;
            AR^.EsVencido := False;
            AR^.EsAnticipado := False;
            AR^.EsDevuelto := False;
            AR^.EsOtros := False;
            if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);
          end; // Fin Efectivo
     end;

// Es pago por Bancos
      if EdNacional.Value > 0 then
      begin
        if vTotalLiquidacion = (EdNacional.Value - vComisionNal) then
         begin
           if vComisionNal > 0 then
            begin
              New(AR);
              AR^.CuotaNumero := CuotaNumero;
              AR^.CodigoPuc   := CodigoBanco;
              AR^.FechaInicial := fFechaActual;
              AR^.FechaFinal   := fFechaActual;
              AR^.Dias         := 0;
              AR^.Tasa         := 0;
              AR^.Debito       := 0;
              AR^.Credito      := vComisionNal;
              AR^.EsCapital := False;
              AR^.EsCausado := False;
              AR^.EsCorriente := False;
              AR^.EsVencido := False;
              AR^.EsAnticipado := False;
              AR^.EsDevuelto := False;
              AR^.EsOtros := False;
              if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);
            end;  // vComisionNal
        end // vTotalLiquidacion
        else
        if vTotalLiquidacion < (EdNacional.Value - vComisionNal) then
         begin
           with IBQOtros do
           begin
           SQL.Clear;
           SQL.Add('select * from "col$codigospuc" where ');
           SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
           SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
           SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
           ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
           ParamByName('ID_GARANTIA').AsInteger      := Garantia;
           ParamByName('ID_CATEGORIA').AsString     := Categoria;
           IBQOtros.Open;
           if RecordCount = 0 then
            begin
             MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
             Close;
             Exit;
            end;
           end;
           CodigoAhorros := IBQOtros.FieldByName('COD_CAPITAL_CP').AsString;
           New(AR);
           AR^.CuotaNumero := CuotaNumero;
           AR^.CodigoPuc   := CodigoAhorros;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           AR^.Dias         := 0;
           AR^.Tasa         := 0;
           AR^.Debito       := 0;
           AR^.Credito      := ((EdNacional.Value - vComisionNal) - vTotalLiquidacion);
           CuotasLiq.NuevoSaldo := CuotasLiq.NuevoSaldo - AR^.Credito;
           AR^.EsCapital := True;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           AR^.EsOtros := False;
           if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);

           if vComisionNal > 0 then
            begin
              New(AR);
              AR^.CuotaNumero := CuotaNumero;
              AR^.CodigoPuc   := CodigoBanco;
              AR^.FechaInicial := fFechaActual;
              AR^.FechaFinal   := fFechaActual;
              AR^.Dias         := 0;
              AR^.Tasa         := 0;
              AR^.Debito       := 0;
              AR^.Credito      := vComisionNal;
              AR^.EsCapital := False;
              AR^.EsCausado := False;
              AR^.EsCorriente := False;
              AR^.EsVencido := False;
              AR^.EsAnticipado := False;
              AR^.EsDevuelto := False;
              AR^.EsOtros := False;
              if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);
            end;
         end
         else
         if (vTotalLiquidacion > (EdNacional.Value - vComisionNal)) then
          begin
           with IBQOtros do
           begin
           SQL.Clear;
           SQL.Add('select * from "col$codigospuc" where ');
           SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
           SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
           SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
           ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
           ParamByName('ID_GARANTIA').AsInteger      := Garantia;
           ParamByName('ID_CATEGORIA').AsString     := Categoria;
           IBQOtros.Open;
           if RecordCount = 0 then
            begin
             MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
             Close;
             Exit;
            end;
           end;
            CodigoAhorros := IBQOtros.FieldByName('COD_CAPITAL_CP').AsString;
            New(AR);
            AR^.CuotaNumero := CuotaNumero;
            AR^.CodigoPuc   := CodigoAhorros;
            AR^.FechaInicial := fFechaActual;
            AR^.FechaFinal   := fFechaActual;
            AR^.Dias         := 0;
            AR^.Tasa         := 0;
            AR^.Debito       := (vTotalLiquidacion - (EdNacional.Value - vComisionNal));
            AR^.Credito      := 0;
            AR^.EsCapital := True;
            AR^.EsCausado := False;
            AR^.EsCorriente := False;
            AR^.EsVencido := False;
            AR^.EsAnticipado := False;
            AR^.EsDevuelto := False;
            AR^.EsOtros := False;
            if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);

            if vComisionNal > 0 then
             begin
               New(AR);
               AR^.CuotaNumero := CuotaNumero;
               AR^.CodigoPuc   := CodigoBanco;
               AR^.FechaInicial := fFechaActual;
               AR^.FechaFinal   := fFechaActual;
               AR^.Dias         := 0;
               AR^.Tasa         := 0;
               AR^.Debito       := 0;
               AR^.Credito      := vComisionNal;
               AR^.EsCapital := False;
               AR^.EsCausado := False;
               AR^.EsCorriente := False;
               AR^.EsVencido := False;
               AR^.EsAnticipado := False;
               AR^.EsDevuelto := False;
               AR^.EsOtros := False;
               if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);
             end;
            RetiroExtracto := (vTotalLiquidacion - (EdNacional.Value - vComisionNal));
            BaseGMF := BaseGMF + RetiroExtracto;
          end; // Fin vNacional
          
     end

     else if EdLibranza.Value > 0 then
      begin
        if vTotalLiquidacion < EdLibranza.Value then
         begin
           New(AR);
           AR^.CuotaNumero := CuotaNumero;
           AR^.CodigoPuc   := CodigoAhorros;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           AR^.Dias         := 0;
           AR^.Tasa         := 0;
           AR^.Debito       := 0;
           AR^.Credito      := (EdLibranza.Value - vTotalLiquidacion);
           CuotasLiq.NuevoSaldo := CuotasLiq.NuevoSaldo - AR^.Credito;
           AR^.EsCapital := True;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           AR^.EsOtros := False;
           if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);

           // AbonoExtracto := (EdLibranza.Value - vTotalLiquidacion);
         end
         else
        { if (vTotalLiquidacion > EdLibranza.Value) and (vTotalAhorros >= (vTotalLiquidacion - EdLibranza.Value)) then
          begin
            New(AR);
            AR^.CuotaNumero := CuotaNumero;
            AR^.CodigoPuc   := CodigoAhorros;
            AR^.FechaInicial := fFechaActual;
            AR^.FechaFinal   := fFechaActual;
            AR^.Dias         := 0;
            AR^.Tasa         := 0;
            AR^.Debito       := (vTotalLiquidacion - EdLibranza.Value);
            AR^.Credito      := 0;
            AR^.EsCapital := False;
            AR^.EsCausado := False;
            AR^.EsCorriente := False;
            AR^.EsVencido := False;
            AR^.EsAnticipado := False;
            AR^.EsDevuelto := False;
            AR^.EsOtros := False;
            if (AR^.Debito <> 0) or (AR^.Credito <> 0) then CuotasLiq.Lista.Add(AR);
            RetiroExtracto := (vTotalLiquidacion - EdLibranza.Value);
            BaseGMF := BaseGMF + RetiroExtracto;
          end; // Fin vNacional
          }
     end;


{
     if (not CredFallecido) and (not CredIncapacitado) then begin
      if vTotalLiquidacion > (vTotalAhorros + EdLibranza.Value + (vNacional - vComisionNal)) then
       begin
         MessageDlg('No posee suficientes fondos para realizar el descuento',mtError,[mbOK],0);
         CmdNuevo.SetFocus;
         CmdGrabar.Enabled := False;
         Exit;
       end;
     end;
}
   end;
//**
  if CuotasLiq.Liquidado then
   begin
     frmMuestroLiquidacionColocacion:= TfrmMuestroLiquidacionColocacion.Create(Self);
     frmMuestroLiquidacionColocacion.Colocacion := EdNumeroColocacion.Text;
     frmMuestroLiquidacionColocacion.Lista := CuotasLiq.Lista;
     frmMuestroLiquidacionColocacion.TotalLiquidacion := vTotalLiquidacion;
     frmMuestroLiquidacionColocacion.Asociado := EdNombre.Caption;
//     frmMuestroLiquidacionColocacion.FechaCorte := EdFechaCorte.Date;
     frmMuestroLiquidacionColocacion.FechaCorte := EdFechaNota.Date;
     frmMuestroLiquidacionColocacion.ProximaCuota := CuotasLiq.FechaProx;
     frmMuestroLiquidacionColocacion.NuevoSaldo := CuotasLiq.NuevoSaldo;
     frmMuestroLiquidacionColocacion.InteresesHasta := CuotasLiq.InteresesHasta;
     frmMuestroLiquidacionColocacion.CapitalHasta := CuotasLiq.CapitalHasta;
     frmMuestroLiquidacionColocacion.NumeroCuenta := NumeroCuenta;
     frmMuestroLiquidacionColocacion.DigitoCuenta := DigitoCuenta;
     frmMuestroLiquidacionColocacion.TipoId := vTipoId;
     frmMuestroLiquidacionColocacion.NumeroId := vNumeroId;
     frmMuestroLiquidacionColocacion.DiasProrrogados := vDiasProrroga;
     frmMuestroLiquidacionColocacion.BaseGMF := BaseGMF;
     frmMuestroLiquidacionColocacion.EstadoActual := Estado;
     if CredFallecido then frmMuestroLiquidacionColocacion.NuevoEstado := EsFallecido
     else if CredIncapacitado then frmMuestroLiquidacionColocacion.NuevoEstado := EsIncapacitado
     else frmMuestroLiquidacionColocacion.NuevoEstado := Estado;
     if CredFallecido or CredIncapacitado then frmMuestroLiquidacionColocacion.AplicaGravamen := True
     else frmMuestroLiquidacionColocacion.AplicaGravamen := False;
     frmMuestroLiquidacionColocacion.AbonoExtracto := AbonoExtracto;
     frmMuestroLiquidacionColocacion.RetiroExtracto := RetiroExtracto;
     if EdEfectivo.Value > 0 then begin
       frmMuestroLiquidacionColocacion.Nacional := False;
     end;

     if EdNacional.Value > 0 then begin
       frmMuestroLiquidacionColocacion.Nacional := True;
       frmMuestroLiquidacionColocacion.FechaConsignacion := FechaCosignacion;
     end;
     frmMuestroLiquidacionColocacion.ShowModal;
     for I := 0 to (CuotasLiq.Lista.Count - 1) do
      begin
        AF := CuotasLiq.Lista.Items[I];
        Dispose(AF);
      end;
     CuotasLiq.Lista.Destroy;
     CmdGrabar.Enabled := False;
     CmdBuscar.Enabled := False;
     EdNumeroColocacion.Enabled := False;
     EdTipoIdentificacion.Enabled := False;
     EdNumeroIdentificacion.Enabled := False;
     EdNombre.Enabled := False;
   end;


end;

procedure TfrmCalculoCuotadePrueba.CmdNuevoClick(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
        Inicializar;
        EdNumeroColocacion.SetFocus;
end;

procedure TfrmCalculoCuotadePrueba.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmCalculoCuotadePrueba.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQuery.Database := dmGeneral.IBDatabase1;
        IBQAgencia.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBSaldo.Database := dmGeneral.IBDatabase1;
        IBNacional.Database := dmGeneral.IBDatabase1;
        IBQuery3.Database := dmGeneral.IBDatabase1;
        IBVerificaTmp.Database := dmGeneral.IBDatabase1;
        IBQOtros.Database := dmGeneral.IBDatabase1;

        IBQuery.Transaction := dmGeneral.IBTransaction1;
        IBQAgencia.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBSaldo.Transaction := dmGeneral.IBTransaction1;
        IBNacional.Transaction := dmGeneral.IBTransaction1;
        IBQuery3.Transaction := dmGeneral.IBTransaction1;
        IBVerificaTmp.Transaction := dmGeneral.IBTransaction1;
        IBQOtros.Transaction := dmGeneral.IBTransaction1;


end;

procedure TfrmCalculoCuotadePrueba.EdProrrogaEnter(Sender: TObject);
begin
        EdProrroga.SelectAll;
end;

procedure TfrmCalculoCuotadePrueba.EdProrrogaExit(Sender: TObject);
begin
        if EdProrroga.Text = '' then
         vDiasProrroga := 0
        else
         vDiasProrroga := StrToInt(EdProrroga.Text);
end;

procedure TfrmCalculoCuotadePrueba.FallecidoClick(Sender: TObject);
begin
        if Fallecido.Checked = True then
         begin
          CredFallecido := True;
          CredIncapacitado := False;
          CredPagoTotal := False;
          CredLibranza := False;
          Incapacitado.Checked := False;
          PagoTotal.Checked := False;
         end
        else
          CredFallecido := False;
end;

procedure TfrmCalculoCuotadePrueba.PagoTotalClick(Sender: TObject);
begin
        if PagoTotal.Checked = True then
         begin
          CredPagoTotal := True;
          CredFallecido := False;
          CredIncapacitado := False;
          Fallecido.Checked := False;
          Incapacitado.Checked := False;
         end
        else
          CredPagoTotal := False;
end;

procedure TfrmCalculoCuotadePrueba.IncapacitadoClick(Sender: TObject);
begin
        if Incapacitado.Checked = True then
         begin
          CredIncapacitado := True;
          CredFallecido := False;
          CredPagoTotal := False;
          Fallecido.Checked := False;
          PagoTotal.Checked := False;
         end
        else
         CredIncapacitado := False;
end;

procedure TfrmCalculoCuotadePrueba.EdNacionalExit(Sender: TObject);
begin
       vNacional := EdNacional.Value;
       if EdNacional.Value > 0 then
       begin
        IBQuery3.Open;
        IBQuery3.Last;
        DBLCBBancos.Enabled := True;
        DBLCBBancos.SetFocus;
        DBLCBBancos.KeyValue := 7;
        EdFechaConsignacion.Enabled := True;
       end
       else
       begin
        IBQuery3.Close;
        DBLCBBancos.Enabled := False;
        DBLCBBancos.KeyValue := -1;
        EdFechaConsignacion.Enabled := False;
//        CmdGrabar.SetFocus;
       end;

end;

procedure TfrmCalculoCuotadePrueba.EdNacionalEnter(Sender: TObject);
begin
        EdNacional.SelectAll;
end;

procedure TfrmCalculoCuotadePrueba.DBLCBBancosExit(Sender: TObject);
begin
     if DBLCBBancos.KeyValue < 1 then
      begin
        MessageDlg('Debe Seleccionar un Banco',mtError,[mbok],0);
        DBLCBBancos.SetFocus;
      end
     else
      begin
        Banco := DBLCBBancos.KeyValue;
        IBNacional.Close;
        IBNacional.ParamByName('ID_BANCO').AsInteger := Banco;
        IBNacional.ExecQuery;
        if (GrupoAbono.ItemIndex = 1) then
         vComisionNal := IBNacional.FieldByName('COMISIONLOCAL').AsCurrency
        else
         vComisionNal := IBNacional.FieldByName('COMISION').AsCurrency;
        IBNacional.Close;
      end;
end;

procedure TfrmCalculoCuotadePrueba.EdFechaConsignacionExit(
  Sender: TObject);
begin
        FechaCosignacion := EdFechaConsignacion.Date;
end;



procedure TfrmCalculoCuotadePrueba.GrupoAbonoClick(Sender: TObject);
begin
        if GrupoAbono.ItemIndex = 0 then begin
          GrupoEfectivo.Visible := True;
          EdEfectivo.Value := 0;
          GrupoNal.Visible := False;
          GrupoLib.Visible := False;
          GrupoOtros.Visible := False;
          EdEfectivo.SetFocus;
        end
        else if ((GrupoAbono.ItemIndex = 1) or (GrupoAbono.ItemIndex = 2)) then begin
          GrupoNal.Visible := True;
          EdLibranza.Value := 0;
          GrupoEfectivo.Visible := False;
          GrupoLib.Visible := False;
          GrupoOtros.Visible := False;
          EdNacional.SetFocus;
        end
        else if GrupoAbono.ItemIndex = 3 then begin
          EdNacional.Value := 0;
          vNacional := 0;
          vComisionNal := 0;
          GrupoEfectivo.Visible := False;
          GrupoNal.Visible := False;
          GrupoOtros.Visible := False;
          GrupoLib.Visible := True;
          EdLibranza.SetFocus;
        end
        else if GrupoAbono.ItemIndex = 4 then begin
          EdNacional.Value := 0;
          vNacional := 0;
          vComisionNal := 0;
          EdLibranza.Value := 0;
          GrupoEfectivo.Visible := False;
          GrupoNal.Visible := False;
          GrupoOtros.Visible := True;
          GrupoLib.Visible := False;
        end;
end;

procedure TfrmCalculoCuotadePrueba.EdLibranzaEnter(Sender: TObject);
begin
        EdLibranza.SelectAll;
end;

procedure TfrmCalculoCuotadePrueba.EdLibranzaExit(Sender: TObject);
begin
        if EdLibranza.Value > 0 then
          CmdGrabar.SetFocus;

end;

end.
