unit UnitLiquidacionExtraordinaria1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, DB,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, IBSQL, DateUtils, Math,
  DBClient, StrUtils;

type
     PCuotasLiq = ^ACuotasLiq;
     ACuotasLiq = record
         CuotaNumero:Integer;
         CodigoPuc:string;
         FechaInicial:TDate;
         FechaFinal:TDate;
         Dias:Integer;
         Tasa:Double;
         Debito:Currency;
         Credito:Currency;
         EsCapital   :Boolean;
         EsCausado   :Boolean;
         EsCorriente :Boolean;
         EsVencido   :Boolean;
         EsAnticipado:Boolean;
         EsDevuelto  :Boolean;
     end;

type TCuotasLiq = record
     Lista:TList;
     FechaProx:TDate;
     NuevoSaldo:Currency;
     InteresesHasta:TDate;
     CapitalHasta:TDate;
     Liquidado:Boolean;
end;

type
  TFrmLiquidacionExtraordinaria1= class(TForm)
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label4: TLabel;
    Label31: TLabel;
    EdNumeroColocacion: TMemo;
    EdNumeroIdentificacion: TStaticText;
    EdNombre: TStaticText;
    CmdBuscar: TBitBtn;
    EdAgencia: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    EsIntereses: TCheckBox;
    Label9: TLabel;
    EdNocomprobante: TMaskEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    EdAbonoCapital: TEdit;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdInforme: TBitBtn;
    BtnCerrar: TBitBtn;
    IBQuery: TIBQuery;
    Label8: TLabel;
    EdSaldocolocacion: TStaticText;
    Label27: TLabel;
    EdFechaCapital: TStaticText;
    Label28: TLabel;
    EdFechaInteres: TStaticText;
    GroupBox5: TGroupBox;
    Devueltos: TRadioButton;
    Cobrados: TRadioButton;
    CmdReversar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBSaldo: TIBSQL;
    IBExtractoDet: TIBSQL;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBSQL1: TIBSQL;
    EdFecha: TStaticText;
    Label19: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    EdCostas: TStaticText;
    IBSQL2: TIBSQL;
    Label124: TLabel;
    EdTotalColManual: TStaticText;
    PageControl1: TPageControl;
    InfoIntereses: TTabSheet;
    InfoDevueltos: TTabSheet;
    InfoCobrados: TTabSheet;
    GroupBox6: TGroupBox;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    EdAbonoInteresCausado: TLabeledEdit;
    EdDiasAplicadosCausado: TLabeledEdit;
    EdTasaAplicadaCausado: TLabeledEdit;
    EdFechaInicialCausado: TDateTimePicker;
    EdFechaFinalCausado: TDateTimePicker;
    EdAbonoInterescorriente: TLabeledEdit;
    EdFechaInicialCorriente: TDateTimePicker;
    EdFechaFinalCorriente: TDateTimePicker;
    EdDiasAplicadosCorriente: TLabeledEdit;
    EdTasaAplicadaCorriente: TLabeledEdit;
    EdAbonoInteresAnticipado: TLabeledEdit;
    EdFechaInicialAnticipado: TDateTimePicker;
    EdFechaFinalAnticipado: TDateTimePicker;
    EdDiasAplicadosAnticipado: TLabeledEdit;
    EdTasaAplicadaAnticipado: TLabeledEdit;
    EdAbonoInteresMora: TLabeledEdit;
    EdFechaInicialMora: TDateTimePicker;
    EdFechaFinalMora: TDateTimePicker;
    EdDiasAplicadosMora: TLabeledEdit;
    EdTasaAplicadaMora: TLabeledEdit;
    EdAbonoInteresContingente: TLabeledEdit;
    EdFechaInicialContingente: TDateTimePicker;
    EdFechaFinalContingente: TDateTimePicker;
    EdDiasAplicadosContingente: TLabeledEdit;
    EdTasaAplicadaContingente: TLabeledEdit;
    EdAbonoCostas: TLabeledEdit;
    EdAbonoHonorarios: TLabeledEdit;
    GroupBox7: TGroupBox;
    Label23: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    EdInteresDevuelto: TLabeledEdit;
    EdDiasDevuelto: TLabeledEdit;
    EdTasaDevolucion: TLabeledEdit;
    EdFechaInicialDevuelto: TDateTimePicker;
    EdFechaFinalDevuelto: TDateTimePicker;
    LabeledEdit20: TLabeledEdit;
    DateTimePicker13: TDateTimePicker;
    DateTimePicker14: TDateTimePicker;
    LabeledEdit21: TLabeledEdit;
    LabeledEdit22: TLabeledEdit;
    LabeledEdit23: TLabeledEdit;
    LabeledEdit24: TLabeledEdit;
    DateTimePicker15: TDateTimePicker;
    DateTimePicker16: TDateTimePicker;
    LabeledEdit25: TLabeledEdit;
    LabeledEdit26: TLabeledEdit;
    LabeledEdit27: TLabeledEdit;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label14: TLabel;
    Label29: TLabel;
    Label26: TLabel;
    Label13: TLabel;
    EdInteresCobradoCausado: TLabeledEdit;
    EdDiasCobradoCausado: TLabeledEdit;
    EdTasaCobradoCausado: TLabeledEdit;
    EdFechaInicialCobradoCausado: TDateTimePicker;
    EdFechaFinalCobradoCausado: TDateTimePicker;
    EdInteresCobradoCorriente: TLabeledEdit;
    EdFechaInicialCobradoCorriente: TDateTimePicker;
    EdFechaFinalCobradoCorriente: TDateTimePicker;
    EdDiasCobradoCorriente: TLabeledEdit;
    EdTasaCobradoCorriente: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    DateTimePicker8: TDateTimePicker;
    DateTimePicker7: TDateTimePicker;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit17: TLabeledEdit;
    IBInforme: TClientDataSet;
    IBInformeCUOTA: TIntegerField;
    IBInformeCODIGO: TStringField;
    IBInformeID_AGENCIA: TIntegerField;
    IBInformeFECHA_INICIAL: TDateField;
    IBInformeFECHA_FINAL: TDateField;
    IBInformeDIAS: TIntegerField;
    IBInformeTASA: TFloatField;
    IBInformeDEBITO: TCurrencyField;
    IBInformeCREDITO: TCurrencyField;
    IBCodigo: TIBQuery;
    IBInformeNOMBRE: TStringField;
    Ninguno: TRadioButton;
    GroupBox14: TGroupBox;
    Label104: TLabel;
    Label131: TLabel;
    EdCuentaAbogado: TStaticText;
    EdAbogado: TStaticText;
    Report: TprTxReport;
    IBTabla: TIBSQL;
    IBConsulta: TIBSQL;
    EsCapital: TCheckBox;
    EsExtra: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdNocomprobanteExit(Sender: TObject);
    procedure EdAbonoCapitalExit(Sender: TObject);
    procedure EdAbonoInteresanticipadoExit(Sender: TObject);
    procedure EdAbonoInterescausadoExit(Sender: TObject);
    procedure EdAbonoInterescorrienteExit(Sender: TObject);
    procedure EdAbonoInteresmoraExit(Sender: TObject);
    procedure EdDiasAplicadosCausadoExit(Sender: TObject);
    procedure EdTasaAplicadaCausadoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdDiasAplicadosCorrienteExit(Sender: TObject);
    procedure EdDiasAplicadosAnticipadoExit(Sender: TObject);
    procedure EdDiasAplicadosMoraExit(Sender: TObject);
    procedure EdTasaAplicadaAnticipadoExit(Sender: TObject);
    procedure EdTasaAplicadaCorrienteExit(Sender: TObject);
    procedure EdTasaAplicadaMoraExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure BtnCerrarClick(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure EdTasaAplicadaCausadoEnter(Sender: TObject);
    procedure EdTasaAplicadaCorrienteEnter(Sender: TObject);
    procedure EdTasaAplicadaAnticipadoEnter(Sender: TObject);
    procedure EdTasaAplicadaMoraEnter(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure CmdReversarClick(Sender: TObject);
    procedure EsCapitalClick(Sender: TObject);
    procedure EsInteresesClick(Sender: TObject);
    procedure DevueltosClick(Sender: TObject);
    procedure CobradosClick(Sender: TObject);
    procedure GroupBox5Exit(Sender: TObject);
    procedure EdDiasAplicadosCausadoChange(Sender: TObject);
    procedure EdDiasAplicadosCorrienteChange(Sender: TObject);
    procedure EdDiasAplicadosAnticipadoChange(Sender: TObject);
    procedure EdAbonoInteresContingenteExit(Sender: TObject);
    procedure EdDiasAplicadosContingenteChange(Sender: TObject);
    procedure EdDiasAplicadosContingenteExit(Sender: TObject);
    procedure EdTasaAplicadaContingenteExit(Sender: TObject);
    procedure EdAbonoCostasExit(Sender: TObject);
    procedure EdAbonoHonorariosExit(Sender: TObject);
    procedure EdDiasAplicadosMoraChange(Sender: TObject);
    procedure EdInteresDevueltoExit(Sender: TObject);
    procedure EdDiasDevueltoExit(Sender: TObject);
    procedure EdDiasDevueltoChange(Sender: TObject);
    procedure EdTasaDevolucionExit(Sender: TObject);
    procedure EdInteresCobradoCausadoExit(Sender: TObject);
    procedure EdTasaCobradoCausadoExit(Sender: TObject);
    procedure EdTasaCobradoCorrienteExit(Sender: TObject);
    procedure EdDiasCobradoCausadoChange(Sender: TObject);
    procedure EdDiasCobradoCausadoExit(Sender: TObject);
    procedure EdDiasCobradoCorrienteExit(Sender: TObject);
    procedure EdDiasCobradoCorrienteChange(Sender: TObject);
    procedure EdInteresCobradoCorrienteExit(Sender: TObject);
    procedure NingunoClick(Sender: TObject);
  private
    procedure GrabarExtracto;
    procedure GrabarTablaliquidacion;
    procedure Empleado;
    procedure inicializar;
    procedure DiasCausado;
    procedure DiasCorriente;
    procedure DiasAnticipado;
    procedure DiasMora;
    procedure LimpiarManualIntereses;
    procedure DiasContingentes;
    procedure DiasDevuelto;
    procedure DiasCobradoCausado;
    procedure DiasCobradoCorriente;
    procedure LimpiarCobrados;
    procedure LimpiarDevueltos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLiquidacionExtraordinaria1: TFrmLiquidacionExtraordinaria1;
  vColocacion : string;
  vComprobante : string;
  vAbonocapital : currency;
  vAbonoInteresContingente:Currency;
  vAbonointeresAnticipado : currency;
  vAbonoInteresCorriente  : Currency;
  vAbonoInteresCausado    : Currency;
  vAbonoInteresMora       : Currency;
  vFechaInteres           : TDate;
  vFechaCapital           : TDate;
  vFechaInicialContingente:TDate;
  vFechaInicialAnticipado : TDate;
  vFechaFinalContingente  : TDate;
  vFechaFinalAnticipado   : TDate;
  vFechaInicialCorriente  : TDate;
  vFechaFinalCorriente    : TDate;
  vFechaInicialCausado    : TDate;
  vFechaFinalCausado      : TDate;
  vFechaInicialMora       : TDate;
  vFechaFinalMora         : TDate;
  vFechaInicialDevuelto   : TDate;
  vFechaInicialCobradoCorriente : TDate;
  vFechaInicialCobradoCausado : TDate;
  vFechaFinalDevuelto     : TDate;
  vFechaFinalCobradoCorriente : TDate;
  vFechaFinalCobradoCausado : TDate;
  vDiasContingente        : Integer;
  vDiasAnticipado         : Integer;
  vDiasCorriente          : Integer;
  vDiasCausado            : Integer;
  vDiasMora               : Integer;
  vDiasDevuelto           : Integer;
  vDiasCobradoCausado     : Integer;
  vDiasCobradoCorriente   : Integer;
  vTasaAnticipado         : Single;
  vTasaCorriente          : Single;
  vTasaCausado            : Single;
  vTasaMora               : Single;
  vTasaContingente        : Single;
  vTasaDevolucion         : Single;
  vTasaCobradoCausado     : Single;
  vTasaCobradoCorriente   : Single;
  vTasaDevCob             : Single;
  vSaldoActual            : Currency;
  vInteresDevuelto        : Currency;
  vInteresCobradoCausado  : Currency;
  vInteresCobradoCorriente: Currency;
  vInteresCobrado         : Currency;
  vTipoInteres            : string;
  Clasificacion           : Integer;
  Garantia                : Integer;
  Categoria               : String;
  TipoCuota               : integer;
  Amortizacion            : integer;
  AmortizaK               : Integer;
  TasaLiquidacion         : Single;
  CodigoPuc               : String;
  FechaInicial            : TDate;
  FechaFinal              : TDate;
  vFechaIInt              : TDate;
  vFechaFInt              : TDate;
  Tasa                    : Single;
  Dias                    : Integer;
  Caja                    : Currency;
  Debito                  : Currency;
  Credito                 : Currency;
  devolucion              : Boolean;
  FechaInteres            : TDate;
  vValorCuota             : Currency;
  Estado                  : Integer;
  DescripcionEstado       : string;
  CuotaTabla              : Integer;
  FechaTabla              : TDate;
  CapitalaPagar           : Currency;
  InteresaPagar           : Currency;
  vTotalInteres           : Currency;
  vTipoId                 : Integer;
  vNumeroId               : string;
  Consecutivo             : Integer;
  totaldebitos            : currency;
  totalcreditos           : Currency;
  NumeroCuenta            : Integer;
  DigitoCuenta            : Integer;
  vTotalAhorros           : Currency;
  vTotalLiquidacion       : Currency;
  vComprobanteTmp         : Integer;
  FechaIntAnt             : TDate;
  FechaCapAnt             : TDate;
  ValorDesembolsoCol      : Currency;
  SaldoActualCol          : Currency;

  vseguro        : currency;
  vpagxcliente   : currency;
  vhonorarios    : currency;
  vcostas        : Currency;
  votrospagos    : Currency;

  NuevaFechaCapital:TDate;

  TGeneral : Currency;
  abono_capital : currency;
  abono_cxc : currency;
  abono_servicios : currency;
  abono_anticipado: currency;
  abono_mora : currency;
  Cuota_anterior : integer;
  cambio : Boolean;
  MyCuotasLiq : TCuotasLiq;
  AR : PCuotasLiq;
  NumeroCuentaAbogado:Integer;
  DigitoCuentaAbogado:Integer;
implementation

uses UnitDmGeneral, UnitdmColocacion, UnitGlobales, UnitBuscarColocacion,
     UnitVistaPreliminar, UnitGlobalesCol;

{$R *.dfm}

procedure TFrmLiquidacionExtraordinaria1.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TFrmLiquidacionExtraordinaria1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TFrmLiquidacionExtraordinaria1.EdNumeroColocacionExit(Sender: TObject);
begin
         if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;

         dmGeneral.IBTransaction1.StartTransaction;
         
           vColocacion := trim(EdNumeroColocacion.Text);
           EdNumeroColocacion.Text := vColocacion;

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
                SQL.Add('"col$colocacion".ID_CLASIFICACION,');
                SQL.Add('"col$colocacion".ID_GARANTIA,');
                SQL.Add('"col$colocacion".ID_CATEGORIA,');
                SQL.Add('"col$colocacion".VALOR_CUOTA,');
                SQL.Add('"col$colocacion".FECHA_CAPITAL,');
                SQL.Add('"col$colocacion".FECHA_INTERES,');
                SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
                SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
                SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
                SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
                SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
                SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
                SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
                SQL.Add('"col$tiposcuota".INTERES,');
                SQL.Add('"gen$persona".NOMBRE,');
                SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION ');                SQL.Add(' FROM ');
                SQL.Add('"col$colocacion" ');
                SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION) ');
                SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION) ');
                SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA) ');
                SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
                SQL.Add('LEFT OUTER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) ');
                SQL.Add(' JOIN "gen$tiposidentificacion" ON ("col$colocacion".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION) ');
                SQL.Add(' WHERE ');
                SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
                SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');

                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := vColocacion;
                Open;


                Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
                Garantia := FieldByName('ID_GARANTIA').AsInteger;
                Categoria := FieldByName('ID_CATEGORIA').AsString;
                DescripcionEstado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                TipoCuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
                Amortizacion := FieldByName('AMORTIZA_INTERES').AsInteger;
                AmortizaK := FieldByName('AMORTIZA_CAPITAL').AsInteger;
                FechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                vTipoInteres := FieldByName('INTERES').AsString;

                if RecordCount > 0 then
                begin
                      vTipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
                      vNumeroId := FieldByName('ID_PERSONA').AsString ;
                      SaldoActualCol := FieldByName('SALDO_ACTUAL').AsCurrency;
                      ValorDesembolsoCol := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                      EdNumeroIdentificacion.Caption := FieldByName('ID_IDENTIFICACION').AsString + '-' + FieldByName('ID_PERSONA').AsString ;
                      EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      vSaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
                      EdSaldoColocacion.Caption := FormatCurr('#,#0.00',vSaldoActual);
                      vFechaCapital := FieldByname('FECHA_CAPITAL').AsDateTime;
                      vValorCuota := FieldByName('VALOR_CUOTA').AsCurrency;
                      EdFechaCapital.Caption := DateToStr(vFechaCapital);
                      vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                      EdFechaInteres.Caption := DateToStr(vFechaInteres);
                      EsCapital.SetFocus;
                      Self.Caption := 'Liquidación de Colocación - Estado:' + DescripcionEstado;
                Close;
                with IBSQL2 do
                 begin
                   SQL.Clear;
                   SQL.Add('select sum("col$costas".VALOR_COSTAS) as COSTAS');
                   SQL.Add('FROM "col$costas" WHERE');
                   SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND');
                   SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');
                   ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   ParamByName('ID_COLOCACION').AsString := vColocacion;
                   ExecQuery;
                   EdCostas.Caption := FormatCurr('#,#0',FieldByName('COSTAS').AsCurrency);
                   Close;

                   SQL.Clear;
                   SQL.Add('Select ');
                   SQL.Add('"col$colocacionabogado".ID_IDENTIFICACION,');
                   SQL.Add('"col$colocacionabogado".ID_PERSONA,');
                   SQL.Add('"gen$abogados".NUMERO_CUENTA,');
                   SQL.Add('"gen$abogados".DIGITO_CUENTA,');
                   SQL.Add('"gen$persona".PRIMER_APELLIDO,');
                   SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
                   SQL.Add('"gen$persona".NOMBRE');
                   SQL.Add('from "col$colocacionabogado"');
                   SQL.Add('inner join "gen$abogados" on ("col$colocacionabogado".ID_IDENTIFICACION = "gen$abogados".ID_IDENTIFICACION and');
                   SQL.Add('"col$colocacionabogado".ID_PERSONA = "gen$abogados".ID_PERSONA)');
                   SQL.Add('inner join "gen$persona" on ("col$colocacionabogado".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
                   SQL.Add('"col$colocacionabogado".ID_PERSONA = "gen$persona".ID_PERSONA)');
                   SQL.Add('where');
                   SQL.Add('"col$colocacionabogado".ID_AGENCIA = :ID_AGENCIA and');
                   SQL.Add('"col$colocacionabogado".ID_COLOCACION = :ID_COLOCACION');
                   ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   ParamByName('ID_COLOCACION').AsString := vColocacion;
                   ExecQuery;
                   NumeroCuentaAbogado := FieldByName('NUMERO_CUENTA').AsInteger;
                   DigitoCuentaAbogado := FieldByName('DIGITO_CUENTA').AsInteger;
                   if NumeroCuentaAbogado <> 0 then
                    begin
                      groupbox14.Visible := True;
                      EdCuentaAbogado.Caption := IntToStr(NumeroCuentaAbogado) + '-' + IntToStr(DigitoCuentaAbogado);
                      EdAbogado.Caption := FieldByName('NOMBRE').AsString + ' ' +
                                           FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                           FieldByName('SEGUNDO_APELLIDO').AsString;
                    end;
                   Close;
                 end;
                end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                      EdNumeroColocacion.SetFocus;
                end;
        end;
end;

procedure TFrmLiquidacionExtraordinaria1.FormShow(Sender: TObject);
begin
        if DmColocacion.IBDSagencias.Transaction.InTransaction then
         begin
           DmColocacion.IBDSagencias.Transaction.Commit;
           Dmcolocacion.IBDSagencias.Transaction.StartTransaction;
         end;
        DmColocacion.IBDSagencias.Open;
        DmColocacion.IBDSagencias.Last;
        DmColocacion.IBDSagencias.First;
        EdAgencia.KeyValue := Agencia;
        EdFecha.Caption := FormatDateTime('yyyy/mm/dd',ffechaactual);
        Inicializar;
end;

procedure TFrmLiquidacionExtraordinaria1.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmLiquidacionExtraordinaria1.EdNocomprobanteExit(
  Sender: TObject);
var
comprobante : string;
begin
        comprobante := trim(EdNoComprobante.Text);
        if comprobante = '' then
          begin
            MessageDlg('El Número del Comprobante no puede estar en blanco',mtError,[mbOK],0);
            EdNoComprobante.SetFocus;
          end
        else
          begin
            vComprobante := formatcurr('0000000',strtoint(comprobante));
            EdNoComprobante.Text := vComprobante;
          end;
end;

procedure TFrmLiquidacionExtraordinaria1.EdAbonoCapitalExit(
  Sender: TObject);
begin
          if EdAbonoCapital.Text = '' then EdAbonoCapital.Text := '0';
          vAbonoCapital := StrToCurr(EdAbonoCapital.Text);
          if vAbonocapital > vSaldoActual then begin
            MessageDlg('El Valor Digitado excede el Saldo Actual',mtError,[mbok],0);
            EdAbonoCapital.SetFocus;
            Exit;
          end;
          if vAbonoCapital = 0 then
          begin
            MessageDlg('El Valor del Abono no puede ser $0',mtError,[mbOK],0);
            EdAbonoCapital.SetFocus;
            Exit;
          end;
          EdAbonoCapital.Text := FormatCurr('#,##0',vAbonoCapital);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaAplicadaCausadoEnter(
  Sender: TObject);
begin
        EdTasaAplicadaCausado.Text := FormatCurr('#0.00',vTasaCausado);
        EdTasaAplicadaCausado.SelectAll;
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaAplicadaCorrienteEnter(
  Sender: TObject);
begin
        EdTasaAplicadaCorriente.Text := FormatCurr('#0.00',vTasaCorriente);
        EdTasaAplicadaCorriente.SelectAll;
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaAplicadaAnticipadoEnter(
  Sender: TObject);
begin
        EdTasaAplicadaAnticipado.Text := FormatCurr('#0.00',vTasaAnticipado);
        EdTasaAplicadaAnticipado.SelectAll;
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaAplicadaMoraEnter(
  Sender: TObject);
begin
        EdTasaAplicadaMora.Text := FormatCurr('#0.00',vTasaMora);
        EdTasaAplicadaMora.SelectAll;
end;

//Inicio - **intereses causados**///
procedure TFrmLiquidacionExtraordinaria1.EdAbonoInteresCausadoExit(
  Sender: TObject);
begin
          if EdAbonoInteresCausado.Text = '' then EdAbonoInteresCausado.Text := '0';
          vAbonoInteresCausado := StrToCurr(EdAbonoInteresCausado.Text);
          EdAbonoInteresCausado.Text := FormatCurr('#,##0',vAbonoInteresCausado);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente + vhonorarios + vcostas - vInteresDevuelto;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosCausadoExit(
  Sender: TObject);
begin
        DiasCausado;
        DiasContingentes;
        DiasCorriente;
        DiasAnticipado;
        DiasMora;
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaAplicadaCausadoExit(
  Sender: TObject);
begin
        if EdTasaAplicadaCausado.Text = '' then EdTasaAplicadaCausado.Text := '0.00';
        vTasaCausado := StrToFloat(EdTasaAplicadaCausado.Text);
        EdTasaAplicadaCausado.Text := FormatCurr('#0.00%',vTasaCausado);
end;
//***Fin - Intereses Causados***////

//***Inicio - Interes corrientes**///
procedure TFrmLiquidacionExtraordinaria1.EdAbonoInterescorrienteExit(
  Sender: TObject);
begin
          if EdAbonoInteresCorriente.Text = '' then EdAbonoInteresCorriente.Text := '0';
          vAbonoInteresCorriente := StrToCurr(EdAbonoInteresCorriente.Text);
          EdAbonoInteresCorriente.Text := FormatCurr('#,##0',vAbonoInteresCorriente);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobrado - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosCorrienteExit(
  Sender: TObject);
begin
        DiasCorriente;
        DiasAnticipado;
        DiasMora;
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaAplicadaCorrienteExit(
  Sender: TObject);
begin
        if EdTasaAplicadaCorriente.Text = '' then EdTasaAplicadaCorriente.Text := '0.00';
        vTasaCorriente := StrToFloat(EdTasaAplicadaCorriente.Text);
        EdTasaAplicadaCorriente.Text := FormatCurr('#0.00%',vTasaCorriente);
end;
///***Fin - Intereses Corrientes****////

//***Inicio - Intereses Anticipados***//
procedure TFrmLiquidacionExtraordinaria1.EdAbonoInteresAnticipadoExit(
  Sender: TObject);
begin
          if EdAbonoInteresAnticipado.Text = '' then EdAbonoInteresAnticipado.Text := '0';
          vAbonoInteresAnticipado := StrToCurr(EdAbonoInteresAnticipado.Text);
          EdAbonoInteresAnticipado.Text := FormatCurr('#,##0',vAbonoInteresAnticipado);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosAnticipadoExit(
  Sender: TObject);
begin
        DiasAnticipado;
        DiasMora;
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaAplicadaAnticipadoExit(
  Sender: TObject);
begin
        if EdTasaAplicadaAnticipado.Text = '' then EdTasaAplicadaAnticipado.Text := '0.00';
        vTasaAnticipado := StrToFloat(EdTasaAplicadaAnticipado.Text);
        EdTasaAplicadaAnticipado.Text := FormatCurr('#0.00%',vTasaAnticipado);
end;
//***Fin - Intereses Anticipados***///

//***Inicio - Intereses Mora**///
procedure TFrmLiquidacionExtraordinaria1.EdAbonoInteresMoraExit(
  Sender: TObject);
begin
          if EdAbonoInteresMora.Text = '' then EdAbonoInteresMora.Text := '0';
          vAbonoInteresMora := StrToCurr(EdAbonoInteresMora.Text);
          EdAbonoInteresMora.Text := FormatCurr('#,##0',vAbonoInteresMora);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosMoraExit(
  Sender: TObject);
begin
        diasmora;
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaAplicadaMoraExit(
  Sender: TObject);
begin
        if EdTasaAplicadaMora.Text = '' then EdTasaAplicadaMora.Text := '0.00';
        vTasaMora := StrToFloat(EdTasaAplicadaMora.Text);
        EdTasaAplicadaMora.Text := FormatCurr('#0.00%',vTasaMora);
end;
///**Fin - Intereses Mora**///

//**Inicio Intereses devueltos***//
procedure TFrmLiquidacionExtraordinaria1.EdInteresDevueltoExit(Sender: TObject);
begin
          if EdInteresDevuelto.Text = '' then EdInteresDevuelto.Text := '0';
          vInteresDevuelto := StrToCurr(EdInteresDevuelto.Text);
          EdInteresDevuelto.Text := FormatCurr('#,##0',vInteresDevuelto);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;
///**Fin - Intereses devueltos**///

//**Inicio - Intereses Cobrados***//
procedure TFrmLiquidacionExtraordinaria1.CmdAceptarClick(Sender: TObject);
var
I,J:Integer;
CodigoAhorros  : String;
vCalFechaCausado : TDate;
vCalFechaCorriente : TDate;
vCalFechaAnticipado : TDate;
vCalFechaMora : TDate;
SaldoAhorros:Currency;
Movimiento:Currency;
TotalCanje : Currency;
SumTasa:Single;
SumDias:Integer;
Saldo:Currency;
begin
  vTasaDevCob := 0;
  vTasaCobradoCausado := 0;
  vTasaCobradoCorriente := 0;
  totaldebitos := 0;
  totalcreditos := 0;
  Empleado;
  GroupBox1.Enabled := False;
  GroupBox3.Enabled := False;
  PageControl1.Enabled := False;

  with IBSaldo do
   begin
     if Transaction.InTransaction then
       Transaction.Rollback;
     Transaction.StartTransaction;

     Close;
     sql.Clear;
     Sql.Add('select * from P_CAP_0008_JUD (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
     ParamByName('ID_PERSONA').AsString := vNumeroId;
     ExecQuery;
     NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     DigitoCuenta := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;

     SQL.Clear;
     SQL.Add('Select * from SALDO_DISPONIBLE (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
     ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
     ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
     ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
     try
      ExecQuery;
      if RecordCount < 1 then
        Saldo := 0
      else
        Saldo := FieldByName('SALDO_DISPONIBLE').AsCurrency;
     except
      MessageDlg('Error Consultando Saldo Ahorros',mtError,[mbcancel],0);
      raise;
      Exit;
     end;

     vTotalAhorros := Saldo;
   end;

        with dmColocacion.IBSQL do
        begin
           SQL.Clear;
           SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 2');
           ExecQuery;
           CodigoAhorros := FieldByName('CODIGO_CONTABLE').AsString;
           Close;

           SQL.Clear;
           SQL.Add('Select first 1 * ');
           SQL.Add('from "col$tablaliquidacion"');
           SQL.Add('where');
           SQL.Add('"col$tablaliquidacion".PAGADA = 0 and "col$tablaliquidacion".ID_COLOCACION = :ID_COLOCACION');
           SQL.Add('order by "col$tablaliquidacion".CUOTA_NUMERO ASC');
           ParamByName('ID_COLOCACION').AsString := vColocacion;
           ExecQuery;
           CuotaTabla := FieldByName('CUOTA_NUMERO').AsInteger;
           FechaTabla := FieldByName('FECHA_A_PAGAR').AsDateTime;
           CapitalaPagar := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
           InteresaPagar := FieldByName('INTERES_A_PAGAR').AsCurrency;
           Close;

           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('"col$colocacion".FECHA_CAPITAL,');
           SQL.Add('"col$colocacion".FECHA_INTERES');
           SQL.Add(' FROM ');
           SQL.Add('"col$colocacion" ');
           SQL.Add(' WHERE ');
           SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
           SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := vColocacion;
           execQuery;
           FechaIntAnt := FieldByName('FECHA_INTERES').AsDateTime;
           FechaCapAnt := FieldByName('FECHA_CAPITAL').AsDateTime;
           Close;
        end;

        with dmColocacion.IBSQLcodigos do
        try
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$codigospuc" where ');
                SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
                SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
                SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
                ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
                ParamByName('ID_GARANTIA').AsInteger      := Garantia;
                ParamByName('ID_CATEGORIA').AsString     := Categoria;
                ExecQuery;

        MyCuotasLiq.Lista := TList.Create;
        if vAbonoCapital <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
           if CapitalaPagar = 0 then CapitalaPagar := vValorCuota;
           AR^.FechaInicial := fFechaActual; //vFechaCapital;
           AR^.FechaFinal   := fFechaActual; //CalculoFecha(vFechaCapital,DiasCapital);
           vFechaFInt := FechaIntAnt; //AR^.FechaFinal;
//           vFechaCapital := AR^.FechaFinal;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoCapital;
           AR^.EsCapital := True;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

        if vInteresDevuelto <> 0 then
         begin
           New(AR);
           devolucion := True;
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
           AR^.FechaInicial := vFechaInicialDevuelto;
           AR^.FechaFinal   := vFechaFinalDevuelto;
           AR^.Dias := diasentre(vfechainicialdevuelto,vfechafinaldevuelto);
           AR^.Tasa := vTasaDevolucion;
           AR^.Debito := vInteresDevuelto;
           AR^.Credito := 0;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := True;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := FechaIntAnt; //AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
           vTasaDevCob := AR^.Tasa;
         end;

        if vInteresCobradoCausado <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString;
           AR^.FechaInicial := vFechaInicialCobradoCausado;
           AR^.FechaFinal   := vFechaFinalCobradoCausado;
           AR^.Dias := vDiasCobradoCausado; //DiasEntre(vFechaInicialCobradoCausado,vFechaFinalCobradoCausado);
           AR^.Tasa := vTasaCobradoCausado;
           AR^.Debito := 0;
           AR^.Credito := vInteresCobradoCausado;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := FechaIntAnt; //AR^.FechaFinal;
           AR^.EsCapital := False;
           AR^.EsCausado := True;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

        if vInteresCobradoCorriente <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;
           AR^.FechaInicial := vFechaInicialCobradoCorriente;
           AR^.FechaFinal   := vFechaFinalCobradoCorriente;
           AR^.Dias := vDiasCobradoCorriente; //DiasEntre(vFechaInicialCobradoCorriente,vFechaFinalCobradoCorriente);
           AR^.Tasa := vTasaCobradoCorriente;
           AR^.Debito := 0;
           AR^.Credito := vInteresCobradoCorriente;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := FechaIntAnt; //AR^.FechaFinal;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

         vInteresCobrado := vInteresCobradoCausado + vInteresCobradoCorriente;
         if vInteresCobrado > 0 then
            vTasaDevCob := (vTasaCobradoCausado + vTasaCobradoCorriente) / (vDiasCobradoCausado + vDiasCobradoCorriente);

        if vAbonoInteresCausado <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString;
           AR^.FechaInicial := vFechaInicialCausado;
           AR^.FechaFinal := vFechaFinalCausado;
//           vDiasCausado := DiasEntre(vFechaInicialCausado,vFechaFinalCausado);
           if vDiasCausado <= 0  then
            begin
              MessageDlg('Error en Fechas, Favor Verificar',mtInformation,[mbOK],0);
              IBQuery.Transaction.RollbackRetaining;
              Exit;
            end;
           AR^.Dias := vDiasCausado;
           AR^.Tasa := vTasaCausado;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresCausado;
           TasaLiquidacion := Tasa;
           AR^.EsCapital := False;
           AR^.EsCausado := True;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

        if vAbonoInteresContingente <> 0 then
        begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;
          AR^.FechaInicial := vFechaInicialContingente;
          AR^.FechaFinal := vFechaFinalContingente;
 //         vDiasContingente := DiasEntre(vFechaInicialContingente,vFechaFinalContingente);
          if vDiasContingente <= 0 then
           begin
             MessageDlg('Error en Fecha, Favor Verificar',mtInformation,[mbok],0);
             Exit;
           end;
          AR^.Dias := vDiasContingente;
          AR^.Tasa := vTasaContingente;
          AR^.Debito := 0;
          AR^.Credito := vAbonoInteresContingente;
          TasaLiquidacion := Tasa;
          AR^.EsCapital := False;
          AR^.EsCapital := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;


        if vAbonoInteresCorriente <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString;
           AR^.FechaInicial := vFechaInicialCorriente;
           AR^.FechaFinal := vFechaFinalCorriente;
//           vDiasCorriente := DiasEntre(vFechaInicialCorriente,vFechaFinalCorriente);
           if vDiasCorriente <= 0  then
            begin
              MessageDlg('Error en Fechas, Favor Verificar',mtInformation,[mbOK],0);
              IBQuery.Transaction.RollbackRetaining;
              Exit;
            end;
           AR^.Dias := vDiasCorriente;
           AR^.Tasa := vTasaCorriente;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresCorriente;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := True;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           TasaLiquidacion := Tasa;
//           GrabarExtractoDet;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

        if vAbonoInteresAnticipado <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
           AR^.FechaInicial := vFechaInicialAnticipado;
           AR^.FechaFinal := vFechaFinalAnticipado;
//           vDiasAnticipado := DiasEntre(vFechaInicialAnticipado,vFechaFinalAnticipado);
           if vDiasAnticipado <= 0  then
            begin
              MessageDlg('Error en Fechas, Favor Verificar',mtInformation,[mbOK],0);
              IBQuery.Transaction.RollbackRetaining;
              Exit;
            end;
           AR^.Dias := vDiasAnticipado;
           AR^.Tasa := vTasaAnticipado;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresAnticipado;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := True;
           AR^.EsDevuelto := False;
           TasaLiquidacion := Tasa;
//           GrabarExtractoDet;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;

        if vAbonoInteresMora <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;
           AR^.FechaInicial := vFechaInicialMora;
           AR^.FechaFinal := vFechaFinalMora;
           AR^.Dias := vDiasMora;
           AR^.Tasa := vTasaMora;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresMora;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := True;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           TasaLiquidacion := Tasa;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           Totaldebitos := Totaldebitos + AR^.Debito;
           Totalcreditos := Totalcreditos + AR^.Credito;
         end;



//          if (EsCapital.Checked = True) and (EsIntereses.Checked = False) then
//             vFechaFInt := FechaIntAnt;

        if vcostas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vcostas;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           TasaLiquidacion := 0;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;

        if vhonorarios <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := CodigoAhorros;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vhonorarios;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
           TasaLiquidacion := 0;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;    

// Coloco Caja
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoAhorros;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCreditos - TotalDebitos;
          AR^.Credito      := 0;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          vTotalLiquidacion := AR^.Debito;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
          TotalDebitos := 0;
          TotalCreditos := 0;

        if vTotalLiquidacion > vTotalAhorros then
         begin
           MessageDlg('No posee suficientes fondos para realizar el descuento',mtError,[mbOK],0);
           CmdReversar.Click;
           Exit;
         end;

         TGeneral := vTotalLiquidacion;

         if  MyCuotasLiq.Lista.Count > 0 then
          for I := 0 to MyCuotasLiq.Lista.Count -1 do
          begin
                AR := MyCuotasLiq.Lista.Items[i];
                if AR^.EsCausado or AR^.EsCorriente or AR^.EsAnticipado then
                 begin
                   SumTasa := SumTasa + (AR^.Tasa * AR^.Dias);
                   SumDias := SumDias + AR^.Dias;
                 end;
          end;
          try
            TasaLiquidacion := SumTasa / SumDias;
          except
            TasaLiquidacion := Tasa;
          end;

        vTotalInteres := vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente + vAbonointeresAnticipado;

        CmdInforme.Enabled := True;
        DmColocacion.IBSQLcodigos.Close;

        CmdInforme.Enabled := True;
        CmdReversar.Visible := True;
        CmdGrabar.Enabled := True;
        CmdGrabar.Visible := True;
        CmdGrabar.SetFocus;
        CmdAceptar.Visible := False;
        CmdAceptar.Enabled := False;

        except
         dmColocacion.IBSQLcodigos.Transaction.RollbackRetaining;
         Exit;
        end;
end;


procedure TfrmLiquidacionExtraordinaria1.GrabarExtracto;
var
vCuotaTipo : String;
VDesembolso: Currency;
FechaDesembolso:TDate;
vDeudaTabla:Currency;
CapitalaPagarTabla:Currency;
begin
  with ibquery1 do
   begin
     sql.Clear;
     sql.Add('Select TIPO_CUOTA from "col$tiposcuota"');
     sql.Add('where');
     sql.Add('"col$tiposcuota".ID_TIPOS_CUOTA =:"ID_TIPOS_CUOTA"');
     parambyname('ID_TIPOS_CUOTA').AsInteger := Tipocuota;
     Open;
     vcuotatipo := FieldByName('TIPO_CUOTA').AsString;
     Close;

     SQL.Clear;
     SQL.Add('select FECHA_DESEMBOLSO, VALOR_DESEMBOLSO from "col$colocacion"');
     SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_COLOCACION').AsString := vColocacion;
     Open;
     FechaDesembolso := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
     VDesembolso := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
     Close;
   end;

   with IBQuery do
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
      ParamByName('ID_AGENCIA').AsInteger := Agencia ;
      ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
      ParamByName('ID_COLOCACION').AsString := vColocacion;
      ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
      ParamByName('HORA_EXTRACTO').AsDateTime := fFechaHoraActual;
      ParamByName('CUOTA_EXTRACTO').AsInteger := 0;
      ParamByName('TIPO_OPERACION').AsInteger := 1;
      ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
      ParamByName('ABONO_CAPITAL').AsCurrency := vAbonocapital;
      ParamByName('ABONO_CXC').AsCurrency := vAbonoInteresCausado;
      if vInteresCobrado <> 0 then
        ParamByName('ABONO_SERVICIOS').AsCurrency := vInteresCobrado
      else
        ParamByName('ABONO_SERVICIOS').AsCurrency := vAbonoInteresCorriente + vAbonoInteresContingente;
      if vInteresDevuelto <> 0 then
        ParamByName('ABONO_ANTICIPADO').AsCurrency := vInteresDevuelto
      else
        ParamByName('ABONO_ANTICIPADO').AsCurrency := vAbonoInteresAnticipado;
      ParamByName('ABONO_MORA').AsCurrency := vAbonoInteresMora;
      ParamByName('ABONO_SEGURO').AsCurrency := 0;
      if vcostas <> 0 then
        ParamByName('ABONO_PAGXCLI').AsCurrency := vcostas
      else
        ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
      if vhonorarios <> 0 then
        ParamByName('ABONO_HONORARIOS').AsCurrency := vhonorarios
      else
        ParamByName('ABONO_HONORARIOS').AsCurrency := 0;

      ParamByName('ABONO_OTROS').AsCurrency := 0;
      ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := TasaLiquidacion;
      ParamByName('ID_EMPLEADO').AsString := DBAlias;

      if (vInteresCobrado > 0) or (vInteresDevuelto > 0) then
       begin
         ParamByName('INTERES_PAGO_HASTA').AsDate := FechaIntAnt;
         ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasaDevCob;
       end;

      if vAbonoInteresCausado > 0 then
        ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalCausado;
      if vAbonoInteresCorriente > 0 then
        ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalCorriente;
      if vAbonointeresAnticipado > 0 then
        ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalAnticipado;
      if (EsCapital.Checked = True) and (EsIntereses.Checked = False) then
       begin
         ParamByName('INTERES_PAGO_HASTA').AsDate := FechaIntAnt;
         vFechaFInt := FechaIntAnt;
       end;

      ParamByName('CAPITAL_PAGO_HASTA').AsDate := FechaCapAnt;
      ParamByName('TIPO_ABONO').AsInteger := BooleanoToInt(devolucion);
      ExecSQL;
      Close;


         if EsCapital.Checked = True then
          begin
            FechaCapital := CalculoFecha(FechaDesembolso,Amortizacion);

            SQL.Clear;
            SQL.Add('select * from "col$tablaliquidacion" where');
            SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
            SQL.Add('order by FECHA_A_PAGAR');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vColocacion;
            Open;
            vDeudaTabla := vDesembolso;
            while not Eof do begin
               CapitalaPagarTabla := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
               vDeudaTabla := vDeudaTabla - CapitalaPagarTabla;
               if vDeudaTabla >= (vSaldoActual - vAbonocapital) then begin
                 if CapitalaPagarTabla > 0 then begin
                    IBTabla.Close;
                    IBTabla.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    IBTabla.ParamByName('ID_COLOCACION').AsString := vColocacion;
                    IBTabla.ParamByName('CUOTA_NUMERO').AsInteger := FieldByName('CUOTA_NUMERO').AsInteger;
                    IBTabla.ExecQuery;
                    IBTabla.Close;
                    if TipoCuota = 2 then
                      NuevaFechaCapital := CalculoFecha(FieldByName('FECHA_A_PAGAR').AsDateTime,AmortizaK)
                    else NuevaFechaCapital := FieldByName('FECHA_A_PAGAR').AsDateTime;
                 end
                 else
                 if FieldByName('FECHA_A_PAGAR').AsDateTime <= vFechaFInt then begin
                   IBTabla.Close;
                   IBTabla.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBTabla.ParamByName('ID_COLOCACION').AsString := vColocacion;
                   IBTabla.ParamByName('CUOTA_NUMERO').AsInteger := FieldByName('CUOTA_NUMERO').AsInteger;
                   IBTabla.ExecQuery;
                   IBTabla.Close;
                 end;
               end;
              Next;
            end;   // fin de while Tabla Liquidacion

            IBConsulta.Close;
            IBConsulta.SQL.Clear;
            IBConsulta.sql.Add('update "col$colocacion" set ');
            IBConsulta.sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
            IBConsulta.sql.Add('"col$colocacion"."FECHA_CAPITAL" = :"FECHA_CAPITAL"');
            IBConsulta.sql.Add(' where ');
            IBConsulta.sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            IBConsulta.sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
            IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
            IBConsulta.ParamByName('ABONOS_CAPITAL').AsCurrency := vAbonoCapital;
            IBConsulta.ParamByName('FECHA_CAPITAL').AsDate := NuevaFechaCapital;
            IBConsulta.ExecQuery;
            IBConsulta.Close;

            IBConsulta.sql.Clear;
            IBConsulta.sql.Add('update "col$extracto" set ');
            IBConsulta.sql.Add('"col$extracto"."CAPITAL_PAGO_HASTA" = :"CAPITAL_PAGO_HASTA"');
            IBConsulta.sql.Add(' where ');
            IBConsulta.sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
            IBConsulta.sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
            IBConsulta.sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION" and');
            IBConsulta.SQL.Add('"col$extracto"."FECHA_EXTRACTO" = :"FECHA_EXTRACTO"');
            IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
            IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
            IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
            IBConsulta.ParamByName('CAPITAL_PAGO_HASTA').AsDate := NuevaFechaCapital;
            IBConsulta.ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
            IBConsulta.ExecQuery;
            IBConsulta.Close;

          end; // fin de if Capital.Checked

          if (EsIntereses.Checked = True) and (vTotalInteres > 0) then
          begin
            IBConsulta.sql.Clear;
            IBConsulta.sql.Add('update "col$colocacion" set ');
            IBConsulta.sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
            IBConsulta.sql.Add(' where ');
            IBConsulta.sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            IBConsulta.sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
            IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
            IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
            IBConsulta.ParamByName('FECHA_INTERES').AsDate := vFechaFInt;
            IBConsulta.ExecQuery;
            IBConsulta.Close;
           end;

         if (vCuotaTipo = 'F') and
            (FechaTabla <= vFechaCapital) and
            (InteresaPagar <= vTotalInteres) then
          begin
            IBConsulta.sql.Clear;
            IBConsulta.sql.Add('update "col$tablaliquidacion" set ');
            IBConsulta.sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
            IBConsulta.sql.Add(' where ');
            IBConsulta.sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            IBConsulta.sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
            IBConsulta.sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
            IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
            IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
            IBConsulta.ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
            IBConsulta.ExecQuery;
            IBConsulta.Close;
          end;

         if vCuotaTipo = 'V' then
          if (CapitalaPagar > 0) and (InteresaPagar > 0) then
           begin
             if (FechaTabla <= NuevaFechaCapital) and (InteresaPagar <= vTotalInteres) then
              begin
                IBConsulta.sql.Clear;
                IBConsulta.sql.Add('update "col$tablaliquidacion" set ');
                IBConsulta.sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
                IBConsulta.sql.Add(' where ');
                IBConsulta.sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                IBConsulta.sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
                IBConsulta.sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
                IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
                IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
                IBConsulta.ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
                IBConsulta.ExecQuery;
                IBConsulta.Close;

                IBConsulta.sql.Clear;
                IBConsulta.sql.Add('update "col$extracto" set ');
                IBConsulta.sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
                IBConsulta.sql.Add(' where ');
                IBConsulta.sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
                IBConsulta.sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
                IBConsulta.sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
                IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
                IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
                IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
                IBConsulta.ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
                IBConsulta.ExecQuery;
                IBConsulta.Close;
              end;
           end
          else
          if (CapitalaPagar > 0) and (FechaTabla <= NuevaFechaCapital) then
           begin
             IBConsulta.sql.Clear;
             IBConsulta.sql.Add('update "col$tablaliquidacion" set ');
             IBConsulta.sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
             IBConsulta.sql.Add(' where ');
             IBConsulta.sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
             IBConsulta.sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
             IBConsulta.sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
             IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
             IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
             IBConsulta.ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
             IBConsulta.ExecQuery;
             IBConsulta.Close;

             IBConsulta.sql.Clear;
             IBConsulta.sql.Add('update "col$extracto" set ');
             IBConsulta.sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
             IBConsulta.sql.Add(' where ');
             IBConsulta.sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
             IBConsulta.sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
             IBConsulta.sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
             IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
             IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
             IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
             IBConsulta.ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
             IBConsulta.ExecQuery;
             IBConsulta.Close;
           end
          else
         if (InteresaPagar >= 0) and (InteresaPagar <= vTotalInteres) then
          begin
            IBConsulta.sql.Clear;
            IBConsulta.sql.Add('update "col$tablaliquidacion" set ');
            IBConsulta.sql.Add('"col$tablaliquidacion"."PAGADA" = 1');
            IBConsulta.sql.Add(' where ');
            IBConsulta.sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
            IBConsulta.sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
            IBConsulta.sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
            IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
            IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
            IBConsulta.ParamByName('CUOTA_NUMERO').AsInteger := CuotaTabla;
            IBConsulta.ExecQuery;
            IBConsulta.Close;

            IBConsulta.sql.Clear;
            IBConsulta.sql.Add('update "col$extracto" set ');
            IBConsulta.sql.Add('"col$extracto"."CUOTA_EXTRACTO" = :"CUOTA_EXTRACTO"');
            IBConsulta.sql.Add(' where ');
            IBConsulta.sql.Add('"col$extracto"."ID_AGENCIA" =:"ID_AGENCIA" and');
            IBConsulta.sql.Add('"col$extracto"."ID_COLOCACION" =:"ID_COLOCACION" and');
            IBConsulta.sql.Add('"col$extracto"."ID_CBTE_COLOCACION" =:"ID_CBTE_COLOCACION"');
            IBConsulta.ParamByName('ID_AGENCIA').AsInteger := agencia;
            IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
            IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
            IBConsulta.ParamByName('CUOTA_EXTRACTO').AsInteger := CuotaTabla;
            IBConsulta.ExecQuery;
            IBConsulta.Close;
          end;

          if (vcostas <> 0) or (vhonorarios <> 0) then begin
            IBConsulta.SQL.Clear;
            IBConsulta.SQL.Add('insert into "col$costas" values (:ID_AGENCIA,:ID_COLOCACION,');
            IBConsulta.SQL.Add(':FECHA,:ID_CBTE_COLOCACION,:VALOR_COSTAS,:VALOR_HONORARIOS,:VALOR_OTROS,:DESCRIPCION)');
            IBConsulta.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBConsulta.ParamByName('ID_COLOCACION').AsString := vColocacion;
            IBConsulta.ParamByName('FECHA').AsDate := fFechaActual;
            IBConsulta.ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vComprobante);
            IBConsulta.ParamByName('VALOR_COSTAS').AsCurrency := -vcostas;
            IBConsulta.ParamByName('VALOR_HONORARIOS').AsCurrency := -vhonorarios;
            IBConsulta.ParamByName('VALOR_OTROS').AsCurrency := 0;
            IBConsulta.ParamByName('DESCRIPCION').AsString := 'VALOR COSTAS Y HONORARIOS RECIBIDOS EN LA FECHA';
            IBConsulta.ExecQuery;
            IBConsulta.Close;
          end;
         end;
end;

procedure TFrmLiquidacionExtraordinaria1.GrabarTablaLiquidacion;
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
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ParamByName('CUOTA_NUMERO').AsInteger := Cuota_anterior;
          ParamByName('PAGADA').AsBoolean := true;
          ParamByName('FECHA_PAGADA').AsDate := fFechaActual;
          ExecSQL;
          Close;
         end;
end;

procedure TFrmLiquidacionExtraordinaria1.BtnCerrarClick(Sender: TObject);
begin
        if DmColocacion.IBDSagencias.Transaction.InTransaction then
           DmColocacion.IBDSagencias.Transaction.Rollback;
        Close;
end;

procedure TFrmLiquidacionExtraordinaria1.CmdBuscarClick(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;

end;

procedure TFrmLiquidacionExtraordinaria1.CmdInformeClick(Sender: TObject);
var Tabla:string;
    I:Integer;
    AF:PCuotasLiq;
    frmVistaPreliminar:TfrmVistaPreliminar;
    Asociado : string;
    FechaProx : string;
begin
        Empleado;
        Asociado := EdNombre.Caption;

        for I := 0 to (MyCuotasLiq.Lista.Count - 1) do
         begin
              AF := MyCuotasLiq.Lista.Items[I];
              IBInforme.Append;
              IBInforme.FieldByName('CUOTA').AsInteger := AF^.CuotaNumero;
              IBInforme.FieldByName('CODIGO').AsString := AF^.CodigoPuc;
              IBCodigo.Close;
              IBCodigo.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBCodigo.ParamByName('CODIGO').AsString := AF^.CodigoPuc;
              IBCodigo.Open;
              IBInforme.FieldByName('NOMBRE').AsString := IBCodigo.FieldByName('NOMBRE').AsString;
              IBInforme.FieldByName('ID_AGENCIA').AsInteger := Agencia;
              IBInforme.FieldByName('FECHA_INICIAL').AsDateTime := AF^.FechaInicial;
              IBInforme.FieldByName('FECHA_FINAL').AsDateTime := AF^.FechaFinal;
              IBInforme.FieldByName('DIAS').AsInteger := AF^.Dias;
              IBInforme.FieldByName('TASA').AsFloat := AF^.Tasa;
              IBInforme.FieldByName('DEBITO').AsCurrency := AF^.Debito;
              IBInforme.FieldByName('CREDITO').AsCurrency := AF^.Credito;
              IBInforme.Post;
              IBCodigo.Close;
           end;

           with IBQuery do begin
           Close;
           SQL.Clear;
           SQL.Add('Select FECHA_A_PAGAR, CAPITAL_A_PAGAR');
           SQL.Add('from "col$tablaliquidacion"');
           SQL.Add('where ');
           SQL.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$tablaliquidacion".PAGADA = 0');
           SQL.Add('order by FECHA_A_PAGAR');           
           ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
           ParamByName('ID_COLOCACION').AsString := vcolocacion;
           Open;
           Last;
           First;
           if FieldByName('FECHA_A_PAGAR').AsDateTime = 0 then
              FechaProx := '0000/00/00'
           else
              FechaProx :=  DateToStr(FieldByName('FECHA_A_PAGAR').AsDateTime);
           Close;
           end;

           Report.Variables.ByName['Empresa'].AsString := Empresa;
           Report.Variables.ByName['Colocacion'].AsString := vColocacion;
           Report.Variables.ByName['Hoy'].AsDateTime := Date;
           Report.Variables.ByName['FechaCorte'].AsDateTime := fFechaActual;
           Report.Variables.ByName['ProximaCuota'].AsString := FechaProx;
           Report.Variables.ByName['Asociado'].AsString := Asociado;
           Report.Variables.ByName['Cuenta'].AsString := IntToStr(NumeroCuenta) + '-' + IntToStr(DigitoCuenta);
           Report.Variables.ByName['NuevoSaldo'].AsDouble := vSaldoActual - vAbonoCapital;
           Report.Variables.ByName['InteresesHasta'].AsDateTime := vFechaFInt;
           Report.Variables.ByName['CapitalHasta'].AsDateTime := NuevaFechaCapital;
           Report.Variables.ByName['comprobante'].AsString := VComprobante;
           Report.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;

           if Report.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Report;
              frmVistaPreliminar.ShowModal;
           end;

           IBInforme.EmptyDataSet;
end;

procedure TfrmLiquidacionExtraordinaria1.Empleado;
begin
        with dmColocacion.IBQuery do
         begin
           sql.Clear;
           sql.Add('select ID_EMPLEADO, DOCUMENTO, PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           vComprobanteTmp := StrToInt(Trim(FieldByName('DOCUMENTO').AsString));
           Close;
         end;
end;

procedure TfrmLiquidacionExtraordinaria1.inicializar;
begin
  vColocacion := '';
  vComprobante := '';
  vAbonocapital := 0;
  vAbonointeresAnticipado := 0;
  vAbonoInteresContingente := 0;
  vAbonoInteresCorriente  := 0;
  vAbonoInteresCausado    := 0;
  vAbonoInteresMora       := 0;
  vInteresDevuelto        := 0;
  vInteresCobradoCausado  := 0;
  vInteresCobradoCorriente:= 0;
  vInteresCobrado         := 0;
  vFechaInicialAnticipado := fFechaActual;
  vFechaFinalAnticipado   := fFechaActual;
  vFechaInicialContingente := fFechaActual;
  vFechaFinalContingente := fFechaActual;
  vFechaInicialCorriente  := fFechaActual;
  vFechaFinalCorriente    := fFechaActual;
  vFechaInicialCausado    := fFechaActual;
  vFechaFinalCausado      := fFechaActual;
  vFechaInicialMora       := fFechaActual;
  vFechaFinalMora         := fFechaActual;
  vFechaInicialCobradoCausado := fFechaActual;
  vFechaFinalCobradoCausado := fFechaActual;
  vFechaInicialCobradoCorriente := fFechaActual;
  vFechaFinalCobradoCorriente := fFechaActual;
  vFechaInicialDevuelto   := fFechaActual;
  vFechaFinalDevuelto     := fFechaActual;
  vFechaInteres           := fFechaActual;
  vFechaCapital           := fFechaActual;
  vDiasAnticipado         := 0;
  vDiasContingente        := 0;
  vDiasCorriente          := 0;
  vDiasCausado            := 0;
  vDiasMora               := 0;
  vTasaAnticipado         := 0;
  vTasaContingente        := 0;
  vTasaCorriente          := 0;
  vTasaCausado            := 0;
  vTasaMora               := 0;
  vSaldoActual            := 0;
  Clasificacion           := 0;
  Garantia                := 0;
  Categoria               := '';
  CodigoPuc               := '';
  FechaInicial            := fFechaActual;
  FechaFinal              := fFechaActual;
  Tasa                    := 0;
  Dias                    := 0;
  Caja                    := 0;
  Debito                  := 0;
  Credito                 := 0;
  devolucion              := False;
  TipoCuota               := 0;
  Amortizacion            := 0;
  TasaLiquidacion         := 0;
  vFechaIInt              := fFechaActual;
  vFechaFInt              := fFechaActual;
  FechaInteres            := fFechaActual;

  vcostas                 := 0;
  vhonorarios             := 0;
  DescripcionEstado       := '';

  //**
  vValorCuota             := 0;
  CapitalaPagar           := 0;
  InteresaPagar           := 0;
  vTotalInteres           := 0;
  totaldebitos            := 0;
  totalcreditos           := 0;
  NumeroCuenta            := 0;
  DigitoCuenta            := 0;
  vTotalAhorros           := 0;
  vTotalLiquidacion       := 0;
  TGeneral                := 0;
  //**

  EdAgencia.KeyValue := Agencia;
  EdNumeroColocacion.Text := vColocacion;
  EdNumeroIdentificacion.Caption := '';
  EdNombre.Caption := '';
  EdSaldoColocacion.Caption := '';
  EdFechaCapital.Caption := '';
  EdFechaInteres.Caption := '';
  EdNoComprobante.Text := '';
  EsIntereses.Checked := False;
  EsCapital.Checked := False;
  EsExtra.Checked := False;
  EdAbonoCapital.Text := '';
  EdInteresCobradoCausado.Text := '';
  EdFechaInicialCobradoCausado.Date := fFechaActual;
  EdFechaFinalCobradoCausado.Date := fFechaActual;
  EdDiasCobradoCausado.Text := '';
  EdTasaCobradoCausado.Text := '';
  EdInteresCobradoCorriente.Text := '';
  EdFechaInicialCobradoCorriente.Date := fFechaActual;
  EdFechaFinalCobradoCorriente.Date := fFechaActual;
  EdDiasCobradoCorriente.Text := '';
  EdTasaCobradoCorriente.Text := '';
  EdInteresDevuelto.Text := '';
  EdFechaInicialDevuelto.Date := fFechaActual;
  EdFechaFinalDevuelto.Date := fFechaActual;
  EdDiasDevuelto.Text := '';
  EdTasaDevolucion.Text := '';
  EdAbonoInteresCausado.Text := '';
  EdFechaInicialCausado.Date := fFechaActual;
  EdFechaFinalCausado.Date := fFechaActual;
  EdDiasAplicadosCausado.Text := '';
  EdTasaAplicadaCausado.Text := '';
  EdAbonoInteresContingente.Text := '';
  EdFechaInicialContingente.Date := fFechaActual;
  EdFechaFinalContingente.Date := fFechaActual;
  EdDiasAplicadosContingente.Text := '';
  EdTasaAplicadaContingente.Text := '';
  EdAbonoInteresCorriente.Text := '';
  EdFechaInicialCorriente.Date := fFechaActual;
  EdFechaFinalCorriente.Date := fFechaActual;
  EdDiasAplicadosCorriente.Text := '';
  EdTasaAplicadaCorriente.Text := '';
  EdAbonoInteresAnticipado.Text := '';
  EdFechaInicialAnticipado.Date := fFechaActual;
  EdFechaFinalAnticipado.Date := fFechaActual;
  EdDiasAplicadosAnticipado.Text := '';
  EdTasaAplicadaAnticipado.Text := '';
  EdAbonoInteresMora.Text := '';
  EdFechaInicialMora.Date := fFechaActual;
  EdFechaFinalMora.Date := fFechaActual;
  EdDiasAplicadosMora.Text := '';
  EdTasaAplicadaMora.Text := '';
  GroupBox3.Visible := False;
  GroupBox1.Enabled := True;
  GroupBox3.Enabled := True;
//  GroupBox6.Visible := False;
//  GroupBox4.Visible := False;
//  GroupBox7.Visible := False;
  EdAgencia.SetFocus;
  CmdInforme.Enabled := False;
  CmdGrabar.Visible := False;
  CmdReversar.Visible := False;
  CmdAceptar.Visible := True;
  CmdAceptar.Enabled := True;
  EdTotalColManual.Caption := '';
  EdCostas.Caption := '';
  EdCuentaAbogado.Caption := '';
  EdAbogado.Caption := '';
  if DmColocacion.IBDSagencias.Transaction.InTransaction then
   begin
     DmColocacion.IBDSagencias.Transaction.Commit;
     Dmcolocacion.IBDSagencias.Transaction.StartTransaction;
   end;
  dmColocacion.IBDSagencias.Active := true;
  dmColocacion.IBDSagencias.Last;
  dmColocacion.IBDSagencias.First;
  PageControl1.Visible := False;
  PageControl1.Enabled := True;
  NumeroCuentaAbogado := 0;
  DigitoCuentaAbogado := 0;
end;


procedure TFrmLiquidacionExtraordinaria1.CmdGrabarClick(Sender: TObject);
var
I,J : integer;
TotalDebitoRecibo : Currency;
TotalCreditoRecibo : Currency;
Consec:string;
DescImpuesto : Currency;
begin
if MessageDlg('Seguro de Realizar el Abono?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
  CmdGrabar.Enabled := False;
  Application.ProcessMessages;
  TotalDebitoRecibo := 0;
  TotalCreditoRecibo := 0;
  for I:=0 to MyCuotasLiq.Lista.Count - 1 do
   begin
     Application.ProcessMessages;
     AR := MyCuotasLiq.Lista.Items[I];
     TotalDebitoRecibo := TotalDebitoRecibo + AR^.Debito;
     TotalCreditoRecibo := TotalCreditoRecibo + AR^.Credito;
   end;
  if not (TotalDebitoRecibo = TotalCreditoRecibo) then
   begin
     MessageDlg('La Nota Contable está Descuadrada' + #10 + #13 +
                       'Revise los Valores',mtError,[mbOk],0);
     Exit;
   end
  else
   begin
    abono_capital := 0;
    abono_cxc := 0;
    abono_servicios := 0;
    abono_mora := 0;
    abono_anticipado := 0;
    Cuota_anterior := 0;
    cambio := false;

///**Genero el consecutivo
    Consec := FormatCurr('00000000',ObtenerConsecutivo(IBSaldo,1));
    vComprobante := Consec;
    EdNoComprobante.Text := Consec;
    dmGeneral.IBTransaction1.StartTransaction;



    with IBQuery do
     try
      grabarextracto;
      SQL.Clear;
      SQL.Add('insert into "col$extractodet" values (');
      SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
      SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
      SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
      if  MyCuotasLiq.Lista.Count > 0 then
       for I := 0 to MyCuotasLiq.Lista.Count -1 do
        begin
          Application.ProcessMessages;
          AR := MyCuotasLiq.Lista.Items[I];
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(vcomprobante);
          ParamByName('ID_COLOCACION').AsString := vcolocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
          ParamByName('HORA_EXTRACTO').AsDateTime := fFechaHoraActual;
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

        // LLevo al extracto de Ahorros
        if vhonorarios > 0 then begin
           SQL.Clear;
           SQL.Add('insert into "cap$extracto" values(');
           SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
           SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
           SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
           SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
           ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuentaAbogado;
           ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuentaAbogado;
           ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
           ParamByName('HORA_MOVIMIENTO').AsTime := fHoraActual;
           ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 19;
           ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdNocomprobante.Text;
           ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'PAGO DE HONORARIOS COL. No.' + vColocacion;
           ParamByName('VALOR_DEBITO').AsCurrency := vHonorarios;
           ParamByName('VALOR_CREDITO').AsCurrency := 0;
           try
             Open;
             if RowsAffected < 1 then
              begin
                MessageDlg('Error Grabando Extracto Captaciones',mtError,[mbok],0);
                Exit;
              end
           except
                MessageDlg('Error Grabando Extracto Captaciones',mtError,[mbok],0);
                Exit;
           end; // del try
        end;

      DescImpuesto := SimpleRoundTo((vTotalLiquidacion/1000) * 4,0);
      New(AR);
      AR^.CuotaNumero := 0;
      AR^.CodigoPuc   := '531520000000000000';
      AR^.FechaInicial := fFechaActual;
      AR^.FechaFinal   := fFechaActual;
      AR^.Dias         := 0;
      AR^.Tasa         := 0;
      AR^.Debito       := DescImpuesto;
      AR^.Credito      := 0;
      AR^.EsCapital := False;
      AR^.EsCausado := False;
      AR^.EsCorriente := False;
      AR^.EsVencido := False;
      AR^.EsAnticipado := False;
      AR^.EsDevuelto := False;
      if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);

      New(AR);
      AR^.CuotaNumero := 0;
      AR^.CodigoPuc   := '244205000000000000';
      AR^.FechaInicial := fFechaActual;
      AR^.FechaFinal   := fFechaActual;
      AR^.Dias         := 0;
      AR^.Tasa         := 0;
      AR^.Debito       := 0;
      AR^.Credito      := DescImpuesto;
      AR^.EsCapital := False;
      AR^.EsCausado := False;
      AR^.EsCorriente := False;
      AR^.EsVencido := False;
      AR^.EsAnticipado := False;
      AR^.EsDevuelto := False;
      if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);

      TotalDebitoRecibo := TotalDebitoRecibo + DescImpuesto;
      TotalCreditoRecibo := TotalCreditoRecibo + DescImpuesto;

      //**Genero el comprobante
      with IBQuery1 do
       begin
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
         ParamByName('ID_COMPROBANTE').AsString:= vComprobante;
         ParamByname('FECHADIA').AsDate := fFechaActual;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
         ParamByName('DESCRIPCION').AsString := 'Descuento de Cartera por Pagaré No.' + vColocacion;
         ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebitoRecibo;
         ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCreditoRecibo;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByname('ANULACION').asstring := '';
         ParamByName('IMPRESO').AsInteger  := 1;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ExecSQL;
         Close;

         for I := 0 to MyCuotasLiq.Lista.Count -1 do
          begin
            Application.ProcessMessages;
            AR := MycuotasLiq.Lista.Items[I];
            SQL.Clear;
            SQL.Add('insert into "con$auxiliar" values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
            ParamByName('ID_COMPROBANTE').AsString := vComprobante;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('CODIGO').AsString := AR^.CodigoPuc;
            ParamByName('DEBITO').AsCurrency := ar^.Debito;
            ParamByName('CREDITO').AsCurrency := ar^.Credito;
            if LeftStr(AR^.CodigoPuc,8) = '21050501' then
              ParamByName('ID_CUENTA').AsInteger := NumeroCuenta
            else
              ParamByName('ID_CUENTA').AsInteger := 0;
            if LeftStr(AR^.CodigoPuc,2) = '14' then
              ParamByName('ID_COLOCACION').AsString := vColocacion
            else
              ParamByName('ID_COLOCACION').AsString := '';
            ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
            ParamByName('ID_PERSONA').AsString := vNumeroId;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            ExecSQL;
           end;
       end;
//**Actualizo extracto y saldos mes
      with IBQuery1 do
       begin
         Close;
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
         ParamByName('HORA_MOVIMIENTO').AsTime := fFechaHoraActual;
         if vTotalLiquidacion > 0 then
          begin
            ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 17;
            ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vComprobante;
            ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'DESCUENTO DE CARTERA COLOCACION No.' + vcolocacion;
            ParamByName('VALOR_DEBITO').AsCurrency := 0;
            ParamByName('VALOR_CREDITO').AsCurrency := vTotalLiquidacion;
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
//***fin actualizo extracto
  VerificarCancelacionCredito(Agencia,vColocacion);
  DmGeneral.IBTransaction1.Commit;
  dmgeneral.IBTransaction1.StartTransaction;
  MessageDlg('Cuotas Abonadas',mtInformation,[mbOK],0);
  CmdGrabar.Enabled := False;
  CmdInforme.Click;
  inicializar;
     except
       Transaction.Rollback;
       MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
       Exit;
     end;
   end;
 end
else
   CmdReversar.Click;
end;

procedure TFrmLiquidacionExtraordinaria1.CmdReversarClick(Sender: TObject);
begin
          DmGeneral.IBTransaction1.Rollback;
          MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
          Inicializar;
end;

procedure TFrmLiquidacionExtraordinaria1.EsCapitalClick(Sender: TObject);
begin
        if EsCapital.Checked = True then
         begin
           GroupBox3.Visible := True;
           EdAbonoCapital.SetFocus;
         end
        else
         begin
           vAbonocapital := 0;
           GroupBox3.Visible := False;
           Devueltos.Checked := False;
           Cobrados.Checked := False;
           LimpiarDevueltos;
           LimpiarCobrados;
         end;
        Esinteresesclick(Sender);
end;

procedure TFrmLiquidacionExtraordinaria1.EsInteresesClick(Sender: TObject);
var DiasMinimo,DiasTiene:Integer;
begin
        if EsIntereses.Checked = True then
         begin
           PageControl1.Visible := True;
           PageControl1.ActivePage := InfoIntereses;
           InfoIntereses.TabVisible := True;
           InfoDevueltos.TabVisible := False;
           InfoCobrados.TabVisible := False;
           Devueltos.Checked := False;
           Cobrados.Checked := False;
           vInteresCobrado := 0;
           vInteresDevuelto := 0;
           vTasaDevCob := 0;
           LimpiarDevueltos;
           LimpiarCobrados;

           EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);

           CmdAceptar.Visible := True;
           CmdAceptar.Enabled := True;

           EdAbonoInteresCausado.SetFocus;

           with IBSQL1 do begin
             Close;
             SQL.Clear;
             SQL.Add('select DIAS_INICIALES from "col$codigospuc" where');
             SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ID_GARANTIA = :ID_GARANTIA and');
             SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
             ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
             ParamByName('ID_GARANTIA').AsInteger := Garantia;
             ParamByName('ID_CATEGORIA').AsString := 'C';
             try
              ExecQuery;
              DiasMinimo := FieldByName('DIAS_INICIALES').AsInteger;
             except
              DiasMinimo := 9999;
              raise;
             end;

             DiasTiene := DiasEntre(vFechaInteres,fFechaActual);
             if vTipoInteres = 'V' then DiasTiene := DiasTiene - Amortizacion;
             if DiasTiene < 0 then DiasTiene := 0;
             if DiasTiene < DiasMinimo then begin
                Label123.Visible := False;
                Label123.Enabled := False;
                EdAbonoInteresContingente.Enabled := False;
                EdAbonoInteresContingente.Visible := False;
                EdFechaInicialContingente.Enabled := False;
                EdFechaInicialContingente.Visible := False;
                EdFechaFinalContingente.Enabled := False;
                EdFechaFinalContingente.Visible := False;
                EdDiasAplicadosContingente.Enabled := False;
                EdDiasAplicadosContingente.Visible := False;
                EdTasaAplicadaContingente.Enabled := False;
                EdTasaAplicadaContingente.Visible := False;
             end
             else
             begin
                Label123.Visible := True;
                Label123.Enabled := True;
                EdAbonoInteresContingente.Enabled := True;
                EdAbonoInteresContingente.Visible := True;
                EdFechaInicialContingente.Visible := True;
                EdFechaFinalContingente.Visible := True;
                EdDiasAplicadosContingente.Enabled := True;
                EdDiasAplicadosContingente.Visible := True;
                EdTasaAplicadaContingente.Enabled := True;
                EdTasaAplicadaContingente.Visible := True;
             end;

           end;
        end
        else
        begin
           PageControl1.Visible := False;
           LimpiarManualIntereses;
           if not EsCapital.Checked  then begin
              CmdAceptar.Visible := True;
              CmdAceptar.Enabled := True;
           end;
        end;
end;

procedure TFrmLiquidacionExtraordinaria1.DevueltosClick(Sender: TObject);
begin
        if Devueltos.Checked = True then
         begin
           EsIntereses.Checked := False;
           EsInteresesClick(Sender);
           PageControl1.Visible := True;
           PageControl1.ActivePage := InfoDevueltos;
           InfoIntereses.TabVisible := False;
           InfoDevueltos.TabVisible := True;
           InfoCobrados.TabVisible := False;
           LimpiarCobrados;
           EdInteresDevuelto.SetFocus;
         end;

end;

procedure TFrmLiquidacionExtraordinaria1.CobradosClick(Sender: TObject);
begin
        if Cobrados.Checked = True then
         begin
           EsIntereses.Checked := False;
           EsInteresesClick(Sender);
           PageControl1.Visible := True;
           PageControl1.ActivePage := InfoCobrados;
           InfoIntereses.TabVisible := False;
           InfoDevueltos.TabVisible := False;
           InfoCobrados.TabVisible := True;
           EsIntereses.Checked := False;
           LimpiarDevueltos;
           EdInteresCobradoCausado.SetFocus;
         end;
end;


procedure TFrmLiquidacionExtraordinaria1.GroupBox5Exit(Sender: TObject);
begin
        if (Devueltos.Checked = True) or (Cobrados.Checked = True) then
          EsIntereses.Checked := False;
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosCausadoChange(
  Sender: TObject);
begin
        DiasCausado;
        DiasContingentes;
        DiasCorriente;
        DiasAnticipado;
        DiasMora;
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosCorrienteChange(
  Sender: TObject);
begin
        DiasCorriente;
        DiasAnticipado;
        DiasMora;
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosAnticipadoChange(
  Sender: TObject);
begin
        DiasAnticipado;
        DiasMora;
end;

procedure TFrmLiquidacionExtraordinaria1.DiasCausado;
begin
        if EdDiasAplicadosCausado.Text = '' then EdDiasAplicadosCausado.Text := '0';
        vDiasCausado := StrToInt(EdDiasAplicadosCausado.Text);
        EdDiasAplicadosCausado.Text := FormatCurr('#0',vDiasCausado);
        if (vAbonoInteresCausado <> 0) then
        begin
           vFechaInicialCausado := CalculoFecha(vFechaInteres,1);
           vFechaFinalCausado := CalculoFechaManual(vFechaInicialCausado,vDiasCausado);
           EdFechaInicialCausado.Date := vFechaInicialCausado;
           EdFechaFinalCausado.Date := vFechaFinalCausado;
        end;
end;

procedure TFrmLiquidacionExtraordinaria1.DiasCorriente;
begin
        if EdDiasAplicadosCorriente.Text = '' then EdDiasAplicadosCorriente.Text := '0';
        vDiasCorriente := StrToInt(EdDiasAplicadosCorriente.Text);
        EdDiasAplicadosCorriente.Text := FormatCurr('#0',vDiasCorriente);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaInteres,1);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.Date := vFechaInicialCorriente;
           EdFechaFinalCorriente.Date := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.Date := vFechaInicialCorriente;
           EdFechaFinalCorriente.Date := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresContingente <> 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaFinalContingente,1);
           vFechaFinalCorriente := CalculoFechaManual(vFechaInicialCorriente,vDiasCorriente);
           EdFechaInicialCorriente.Date := vFechaInicialCorriente;
           EdFechaFinalCorriente.Date := vFechaFinalCorriente;
         end;
end;

procedure TFrmLiquidacionExtraordinaria1.DiasAnticipado;
begin
        if EdDiasAplicadosAnticipado.Text = '' then EdDiasAplicadosAnticipado.Text := '0';
        vDiasAnticipado := StrToInt(EdDiasAplicadosAnticipado.Text);
        EdDiasAplicadosAnticipado.Text := FormatCurr('#0',vDiasAnticipado);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaInteres,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.Date := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.Date := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.Date := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.Date := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresContingente <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaFinalContingente,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.Date := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.Date := vFechaFinalAnticipado;
         end
        else
        if (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado <> 0) then
         begin
           vFechaInicialAnticipado := CalculoFecha(vFechaFinalCorriente,1);
           vFechaFinalAnticipado := CalculoFechaManual(vFechaInicialAnticipado,vDiasAnticipado);
           EdFechaInicialAnticipado.Date := vFechaInicialAnticipado;
           EdFechaFinalAnticipado.Date := vFechaFinalAnticipado;
         end;
end;

procedure TFrmLiquidacionExtraordinaria1.DiasMora;
begin
        if EdDiasAplicadosMora.Text = '' then EdDiasAplicadosMora.Text := '0';
        vDiasMora := StrToInt(EdDiasAplicadosMora.Text);
        EdDiasAplicadosMora.Text := FormatCurr('#0',vDiasMora);
        if (vAbonoInteresMora > 0) and (vTipoInteres = 'V') then
         begin
           if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaInteres,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalCausado,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonoInteresContingente <> 0) and (vAbonoInteresCorriente = 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalContingente,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonoInteresCorriente <> 0) and (vAbonointeresAnticipado = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalCorriente,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonointeresAnticipado <> 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalAnticipado,1);
              vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end;
         end;
        if (vAbonoInteresMora > 0) and (vTipoInteres = 'A') then
         begin
           vFechaInicialMora := CalculoFecha(vFechaInteres,1);
           vFechaFinalMora := CalculoFechaManual(vFechaInicialMora,vDiasMora);
           EdFechaInicialMora.Date := vFechaInicialMora;
           EdFechaFinalMora.Date := vFechaFinalMora;
         end;

end;

procedure TFrmLiquidacionExtraordinaria1.LimpiarManualIntereses;
begin
  EdAbonoInteresContingente.Text := '';
  EdAbonoInteresCausado.Text := '';
  EdAbonoInterescorriente.Text := '';
  EdAbonoInteresAnticipado.Text := '';
  EdAbonoInteresMora.Text := '';
  EdAbonoCostas.Text := '';
  EdAbonoHonorarios.Text := '';

  EdDiasAplicadosContingente.Text := '';
  EdDiasAplicadosCausado.Text := '';
  EdDiasAplicadosCorriente.Text := '';
  EdDiasAplicadosAnticipado.Text := '';
  EdDiasAplicadosMora.Text := '';

  EdTasaAplicadaContingente.Text := '';
  EdTasaAplicadaCausado.Text := '';
  EdTasaAplicadaCorriente.Text := '';
  EdTasaAplicadaAnticipado.Text := '';
  EdTasaAplicadaMora.Text := '';

  TGeneral := TGeneral - vAbonoInteresContingente - vAbonoInteresCausado -
                         vAbonoInteresCorriente - vAbonoInteresAnticipado -
                         vAbonoInteresMora - vcostas - vhonorarios;

  vAbonoInteresContingente :=0;
  vDiasContingente:=0;
  vTasaContingente:=0;

  vAbonoInteresCausado:=0;
  vDiasCausado:=0;
  vTasaCausado:=0;

  vAbonoInteresCorriente:=0;
  vDiasCorriente:=0;
  vTasaCorriente:=0;

  vAbonoInteresAnticipado:=0;
  vDiasAnticipado:=0;
  vTasaAnticipado:=0;

  vAbonoInteresMora:=0;
  vDiasMora := 0;
  vTasaMora := 0;

  vhonorarios := 0;
  vcostas := 0;

  EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TFrmLiquidacionExtraordinaria1.EdAbonoInteresContingenteExit(
  Sender: TObject);
begin
          if EdAbonoInteresContingente.Text = '' then EdAbonoInteresContingente.Text := '0';
          vAbonoInteresContingente := StrToCurr(EdAbonoInteresContingente.Text);
          EdAbonoInteresContingente.Text := FormatCurr('#,##0',vAbonoInteresContingente);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosContingenteChange(
  Sender: TObject);
begin
        DiasContingentes;
        DiasCorriente;
        DiasAnticipado;
        DiasMora;

end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosContingenteExit(
  Sender: TObject);
begin
        DiasContingentes;
        DiasCorriente;
        DiasAnticipado;
        DiasMora;
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaAplicadaContingenteExit(
  Sender: TObject);
begin
        if EdTasaAplicadaContingente.Text = '' then EdTasaAplicadaContingente.Text := '0.00';
        vTasaContingente := StrToFloat(EdTasaAplicadaContingente.Text);
        EdTasaAplicadaContingente.Text := FormatCurr('#0.00%',vTasaContingente);
end;

procedure TFrmLiquidacionExtraordinaria1.DiasContingentes;
begin
        if EdDiasAplicadosContingente.Text = '' then EdDiasAplicadosContingente.Text := '0';
        vDiasContingente := StrToInt(EdDiasAplicadosContingente.Text);
        EdDiasAplicadosContingente.Text := FormatCurr('#0',vDiasContingente);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente > 0) then
         begin
           vFechaInicialContingente := CalculoFecha(vFechaInteres,1);
           vFechaFinalContingente := CalculoFechaManual(vFechaInicialContingente,vDiasContingente);
           EdFechaInicialContingente.Date := vFechaInicialContingente;
           EdFechaFinalContingente.Date := vFechaFinalContingente;
         end
        else
         begin
           vFechaInicialContingente := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalContingente := CalculoFechaManual(vFechaInicialContingente,vDiasContingente);
           EdFechaInicialContingente.Date := vFechaInicialContingente;
           EdFechaFinalContingente.Date := vFechaFinalContingente;
         end;
end;

procedure TFrmLiquidacionExtraordinaria1.EdAbonoCostasExit(
  Sender: TObject);
begin
          if EdAbonoCostas.Text = '' then EdAbonoCostas.Text := '0';
          vcostas := StrToCurr(EdAbonoCostas.Text);
          EdAbonoCostas.Text := FormatCurr('#,##0',vcostas);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
          CmdAceptar.SetFocus;
end;

procedure TFrmLiquidacionExtraordinaria1.EdAbonoHonorariosExit(
  Sender: TObject);
begin
          if EdAbonoHonorarios.Text = '' then EdAbonoHonorarios.Text := '0';
          vhonorarios := StrToCurr(EdAbonoHonorarios.Text);
          EdAbonoHonorarios.Text := FormatCurr('#,##0',vhonorarios);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasAplicadosMoraChange(
  Sender: TObject);
begin
        diasmora;
end;


procedure TFrmLiquidacionExtraordinaria1.DiasDevuelto;
begin
        if EdDiasDevuelto.Text = '' then EdDiasDevuelto.Text := '0';
        vDiasDevuelto := StrToInt(EdDiasDevuelto.Text);
        EdDiasDevuelto.Text := FormatCurr('#0',vDiasDevuelto);
        if (vInteresDevuelto <> 0) then
        begin
           vFechaInicialDevuelto := CalculoFecha(vFechaInteres,1);
           if vFechaInicialDevuelto >= Date then
              vFechaInicialDevuelto := CalculoFecha(Date,1);
           vFechaFinalDevuelto := CalculoFechaManual(vFechaInicialDevuelto,vDiasDevuelto);
           EdFechaInicialDevuelto.Date := vFechaInicialDevuelto;
           EdFechaFinalDevuelto.Date := vFechaFinalDevuelto;
        end;
end;

procedure TFrmLiquidacionExtraordinaria1.DiasCobradoCausado;
begin
        if EdDiasCobradoCausado.Text = '' then EdDiasCobradoCausado.Text := '0';
        vDiasCobradoCausado := StrToInt(EdDiasCobradoCausado.Text);
        EdDiasCobradoCausado.Text := FormatCurr('#0',vDiasCobradoCausado);
        if (vInteresCobradoCausado <> 0) then
        begin
           vFechaInicialCobradoCausado := CalculoFecha(vFechaInteres,1);
           vFechaFinalCobradoCausado := CalculoFechaManual(vFechaInicialCobradoCausado,vDiasCobradoCausado);
           EdFechaInicialCobradoCausado.Date := vFechaInicialCobradoCausado;
           EdFechaFinalCobradoCausado.Date := vFechaFinalCobradoCausado;
        end;
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasDevueltoExit(
  Sender: TObject);
begin
        DiasDevuelto;
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasDevueltoChange(
  Sender: TObject);
begin
        DiasDevuelto;
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaDevolucionExit(
  Sender: TObject);
begin
        if EdTasaDevolucion.Text = '' then EdTasaDevolucion.Text := '0.00';
        vTasaDevolucion := StrToFloat(EdTasaDevolucion.Text);
        EdTasaDevolucion.Text := FormatCurr('#0.00%',vTasaDevolucion);
        CmdAceptar.SetFocus;
end;

procedure TFrmLiquidacionExtraordinaria1.EdInteresCobradoCausadoExit(
  Sender: TObject);
begin
          if EdInteresCobradoCausado.Text = '' then EdInteresCobradoCausado.Text := '0';
          vInteresCobradoCausado := StrToCurr(EdInteresCobradoCausado.Text);
          EdInteresCobradoCausado.Text := FormatCurr('#,##0',vInteresCobradoCausado);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaCobradoCausadoExit(
  Sender: TObject);
begin
        if EdTasaCobradoCausado.Text = '' then EdTasaCobradoCausado.Text := '0.00';
        vTasaCobradoCausado := StrToFloat(EdTasaCobradoCausado.Text);
        EdTasaCobradoCausado.Text := FormatCurr('#0.00%',vTasaCobradoCausado);
end;

procedure TFrmLiquidacionExtraordinaria1.EdTasaCobradoCorrienteExit(
  Sender: TObject);
begin
        if EdTasaCobradoCorriente.Text = '' then EdTasaCobradoCorriente.Text := '0.00';
        vTasaCobradoCorriente := StrToFloat(EdTasaCobradoCorriente.Text);
        EdTasaCobradoCorriente.Text := FormatCurr('#0.00%',vTasaCobradoCorriente);
        CmdAceptar.SetFocus;
end;

procedure TFrmLiquidacionExtraordinaria1.DiasCobradoCorriente;
begin
        if EdDiasCobradoCorriente.Text = '' then EdDiasCobradoCorriente.Text := '0';
        vDiasCobradoCorriente := StrToInt(EdDiasCobradoCorriente.Text);
        EdDiasCobradoCorriente.Text := FormatCurr('#0',vDiasCobradoCorriente);
        if (vInteresCobradoCausado <> 0) and (vInteresCobradoCorriente <> 0) then
         begin
           vFechaInicialCobradoCorriente := CalculoFecha(vFechaFinalCobradoCausado,1);
           vFechaFinalCobradoCorriente := CalculoFechaManual(vFechaInicialCobradoCorriente,vDiasCobradoCorriente);
           EdFechaInicialCobradoCorriente.Date := vFechaInicialCobradoCorriente;
           EdFechaFinalCobradoCorriente.Date := vFechaFinalCobradoCorriente;
         end;
        if (vInteresCobradoCausado = 0) and (vInteresCobradoCorriente <> 0) then
         begin
           vFechaInicialCobradoCorriente := CalculoFecha(vFechaInteres,1);
           vFechaFinalCobradoCorriente := CalculoFechaManual(vFechaInicialCobradoCorriente,vDiasCobradoCorriente);
           EdFechaInicialCobradoCorriente.Date := vFechaInicialCobradoCorriente;
           EdFechaFinalCobradoCorriente.Date := vFechaFinalCobradoCorriente;
        end;
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasCobradoCausadoChange(
  Sender: TObject);
begin
        DiasCobradoCausado;
        DiasCobradoCorriente;        
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasCobradoCausadoExit(
  Sender: TObject);
begin
        DiasCobradoCausado;
        DiasCobradoCorriente;
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasCobradoCorrienteExit(
  Sender: TObject);
begin
        DiasCobradoCorriente;
end;

procedure TFrmLiquidacionExtraordinaria1.EdDiasCobradoCorrienteChange(
  Sender: TObject);
begin
        DiasCobradoCorriente;
end;

procedure TFrmLiquidacionExtraordinaria1.EdInteresCobradoCorrienteExit(
  Sender: TObject);
begin
          if EdInteresCobradoCorriente.Text = '' then EdInteresCobradoCorriente.Text := '0';
          vInteresCobradoCorriente := StrToCurr(EdInteresCobradoCorriente.Text);
          EdInteresCobradoCorriente.Text := FormatCurr('#,##0',vInteresCobradoCorriente);
          TGeneral := vAbonoCapital + vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente +
                      vAbonoInteresAnticipado + vAbonoInteresMora + vInteresCobradoCausado + vInteresCobradoCorriente - vInteresDevuelto + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,##0',TGeneral);
end;


procedure TFrmLiquidacionExtraordinaria1.LimpiarCobrados;
begin
           EdInteresCobradoCausado.Text := '';
           vInteresCobradoCausado := 0;
           EdFechaInicialCobradoCausado.Date := fFechaActual;
           vFechaInicialCobradoCausado := fFechaActual;
           EdFechaFinalCobradoCausado.Date :=Date;
           vFechaFinalCobradoCausado := fFechaActual;
           EdDiasCobradoCausado.Text := '';
           vDiasCobradoCausado := 0;
           EdTasaCobradoCausado.Text := '';
           vTasaCobradoCausado := 0;
           EdInteresCobradoCorriente.Text := '';
           vInteresCobradoCorriente := 0;
           EdFechaInicialCobradoCorriente.Date := fFechaActual;
           vFechaInicialCobradoCorriente := fFechaActual;
           EdFechaFinalCobradoCorriente.Date := fFechaActual;
           vFechaFinalCobradoCorriente := fFechaActual;
           EdDiasCobradoCorriente.Text := '';
           vDiasCobradoCorriente := 0;
           EdTasaCobradoCorriente.Text := '';
           vTasaCobradoCorriente := 0;
end;

procedure TFrmLiquidacionExtraordinaria1.LimpiarDevueltos;
begin
           EdInteresDevuelto.Text := '';
           vInteresDevuelto := 0;
           EdFechaInicialDevuelto.Date := fFechaActual;
           vFechaInicialDevuelto := fFechaActual;
           EdFechaFinalDevuelto.Date := fFechaActual;
           vFechaFinalDevuelto := fFechaActual;
           EdDiasDevuelto.Text := '';
           vDiasDevuelto := 0;
           EdTasaDevolucion.Text := '';
           vTasaDevolucion := 0;
end;

procedure TFrmLiquidacionExtraordinaria1.NingunoClick(Sender: TObject);
begin
       if Ninguno.Checked then begin
        LimpiarCobrados;
        LimpiarDevueltos;
        Devueltos.Checked := False;
        Cobrados.Checked := False;
        InfoDevueltos.TabVisible := False;
        InfoCobrados.TabVisible := False;
       end;
end;

end.
