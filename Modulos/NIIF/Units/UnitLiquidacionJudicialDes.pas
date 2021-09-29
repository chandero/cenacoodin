unit UnitLiquidacionJudicialDes;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, DB,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, IBSQL, DateUtils, Math,
  DBClient, JvEdit, JvTypedEdit, Grids, JvStringGrid;

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

type
     TCuotasLiq = record
     Lista:TList;
     FechaProx:TDate;
     NuevoSaldo:Currency;
     InteresesHasta:TDate;
     CapitalHasta:TDate;
     Liquidado:Boolean;
end;
  
type
  TfrmLiquidacionJudicialDes = class(TForm)
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdInforme: TBitBtn;
    BtnCerrar: TBitBtn;
    IBQuery: TIBQuery;
    CmdReversar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBSaldo: TIBSQL;
    IBExtractoDet: TIBSQL;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label4: TLabel;
    Label31: TLabel;
    Label8: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    EdNumeroColocacion: TMemo;
    EdNumeroIdentificacion: TStaticText;
    EdNombre: TStaticText;
    CmdBuscar: TBitBtn;
    EdAgencia: TDBLookupComboBox;
    EdSaldocolocacion: TStaticText;
    EdFechaCapital: TStaticText;
    EdFechaInteres: TStaticText;
    EdFecha: TStaticText;
    EdCostas: TStaticText;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    EdNocomprobante: TMaskEdit;
    IBSQL2: TIBSQL;
    IBSQL1: TIBSQL;
    Label124: TLabel;
    EdTotalColManual: TStaticText;
    PageControl1: TPageControl;
    InfoJudicial: TTabSheet;
    InfoCastigada: TTabSheet;
    GroupBox6: TGroupBox;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
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
    CmdNuevo: TBitBtn;
    GroupBox13: TGroupBox;
    Label169: TLabel;
    Label168: TLabel;
    EdCuentaAbogado: TStaticText;
    EdAbogado: TStaticText;
    Report: TprTxReport;
    IBTabla: TIBSQL;
    IBConsulta: TIBSQL;
    IBQuery3: TIBQuery;
    DataSource1: TDataSource;
    IBNacional: TIBSQL;
    EdAbonoCapital: TEdit;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EdFechaInicial: TDateTimePicker;
    EdFechaFinal: TDateTimePicker;
    EdTasaAplicada: TLabeledEdit;
    EdAbonoInteres: TJvCurrencyEdit;
    EdAbonoCostasCas: TJvCurrencyEdit;
    EdAbonoHonorariosCas: TJvCurrencyEdit;
    EdDiasAplicados: TJvIntegerEdit;
    EdAbonoCostas: TJvCurrencyEdit;
    EdAbonoHonorarios: TJvCurrencyEdit;
    Label2: TLabel;
    ChkPapeleria: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdAbonoInterescausadoExit(Sender: TObject);
    procedure EdAbonoInterescorrienteExit(Sender: TObject);
    procedure EdAbonoInteresmoraExit(Sender: TObject);
    procedure EdFechaInicialCausadoExit(Sender: TObject);
    procedure EdFechaFinalcausadoExit(Sender: TObject);
    procedure EdDiasAplicadosCausadoExit(Sender: TObject);
    procedure EdTasaAplicadaCausadoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdFechaInicialCorrienteExit(Sender: TObject);
    procedure EdFechaInicialMoraExit(Sender: TObject);
    procedure EdDiasAplicadosCorrienteExit(Sender: TObject);
    procedure EdTasaAplicadaCorrienteExit(Sender: TObject);
    procedure EdTasaAplicadaMoraExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure BtnCerrarClick(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure EdTasaAplicadaCausadoEnter(Sender: TObject);
    procedure EdTasaAplicadaCorrienteEnter(Sender: TObject);
    procedure EdTasaAplicadaMoraEnter(Sender: TObject);
    procedure EdFechaFinalCorrienteExit(Sender: TObject);
    procedure EdFechaFinalMoraExit(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure CmdReversarClick(Sender: TObject);
    procedure EdDiasAplicadosCausadoChange(Sender: TObject);
    procedure EdDiasAplicadosCorrienteChange(Sender: TObject);
    procedure EdAbonoInteresContingenteExit(Sender: TObject);
    procedure EdAbonoCostas1Exit(Sender: TObject);
    procedure EdDiasAplicadosContingenteExit(Sender: TObject);
    procedure EdDiasAplicadosContingenteChange(Sender: TObject);
    procedure EdDiasAplicadosMoraChange(Sender: TObject);
    procedure EdDiasAplicadosMoraExit(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure EdAbonoHonorarios1Exit(Sender: TObject);
    procedure EdAbonoInteresExit(Sender: TObject);
    procedure EdDiasAplicadosExit(Sender: TObject);
    procedure EdDiasAplicadosChange(Sender: TObject);
    procedure EdAbonoHonorariosExit(Sender: TObject);
    procedure EdAbonoHonorariosCasExit(Sender: TObject);
    procedure EdAbonoCostasExit(Sender: TObject);
    procedure EdAbonoCostasCasExit(Sender: TObject);
    procedure ChkPapeleriaClick(Sender: TObject);
  private
    procedure GrabarExtracto;
    procedure GrabarTablaLiquidacion;
    procedure GrabarExtractoDet;
    procedure Empleado;
    procedure DiasCausado;
    procedure DiasCorriente;
    procedure DiasMora;
    procedure DiasInteres;
    procedure inicializar;
    procedure LimpiarManualIntereses;
    procedure DiasContingentes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLiquidacionJudicialDes: TfrmLiquidacionJudicialDes;
  vColocacion : string;
  vComprobante : string;
  vAbonocapital : currency;
  vAbonoInteresContingente:Currency;
  vAbonoInteresCorriente  : Currency;
  vAbonoInteresCausado    : Currency;
  vAbonoInteresMora       : Currency;
  vFechaInteres           : TDate;
  vFechaCapital           : TDate;
  vFechaInicialContingente:TDate;
  vFechaInicialCorriente  : TDate;
  vFechaFinalContingente  : TDate;
  vFechaFinalCorriente    : TDate;
  vFechaInicialCausado    : TDate;
  vFechaFinalCausado      : TDate;
  vFechaInicialMora       : TDate;
  vFechaFinalMora         : TDate;
  vDiasContingente:Integer;
  vDiasCorriente          : Integer;
  vDiasCausado            : Integer;
  vDiasMora               : Integer;
  vTasaContingente        : Single;
  vTasaCorriente          : Single;
  vTasaCausado            : Single;
  vTasaMora               : Single;
  vSaldoActual            : Currency;
  vInteresCobrado         : Currency;
  vTipoInteres            : string;
  TipoInteres             : Integer;
  vPuntosAdic             : Double;
  TasaC                   : Double;  
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
  vFechaDesembolso        : TDate;
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
  NumeroCuentaAh          : Integer;
  DigitoCuentaAh          : Integer;
  NumeroCuentaAp          : Integer;
  DigitoCuentaAp          : Integer;
  vTotalLiquidacion       : Currency;
  vComprobanteTmp         : Integer;
  FechaIntAnt             : TDate;
  FechaCapAnt             : TDate;
  ValorDesembolsoCol      : Currency;
  SaldoActualCol          : Currency;
  vPapeleria              : Currency;  

  // Castigada
  vAbonoInteresCas : Currency;
  vFechaInteresCas : TDate;
  vFechaInicialInteresCas : TDate;
  vFechaFinalInteresCas   : TDate;
  vDiasCas : Integer;
  vTasaCas : Single;
 

  vseguro        : currency;
  vpagxcliente   : currency;
  vhonorarios    : currency;
  vcostas        : Currency;
  votrospagos    : Currency;

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

  ListaCuentas:TList;

  NuevaFechaCapital :TDate;

  Fila:Integer;
  NumeroCuentaAbogado:Integer;
  DigitoCuentaAbogado:Integer;

  CodigoAhorros : string;
  vIdSolicitud : string;
  EstadoActual:Integer;
  
implementation

uses UnitDmGeneral, UnitdmColocacion, UnitGlobales, UnitBuscarColocacion,
     UnitVistaPreliminar, UnitGlobalesCol;

{$R *.dfm}

procedure TfrmLiquidacionJudicialDes.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmLiquidacionJudicialDes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmLiquidacionJudicialDes.EdNumeroColocacionExit(Sender: TObject);
var DiasMinimo,DiasTiene:Integer;
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        vColocacion := trim(EdNumeroColocacion.Text);
        EdNumeroColocacion.Text := vColocacion;

        If EdNumeroColocacion.Text = '' then Exit;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$extractotmp" where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ExecQuery;
          if RecordCount > 0 then begin
            MessageDlg('La Colocación ya se Liquidó',mtError,[mbOK],0);
            CmdNuevo.Click;
            Exit;
          end;
          Close;
        end;

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
          SQL.Add('"col$colocacion".TIPO_INTERES,');
          SQL.Add('"col$colocacion".ID_INTERES,');
          SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
          SQL.Add('"col$colocacion".PUNTOS_INTERES,');
          SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
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
          SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
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
          Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          Self.Caption := 'Liquidación Cartera para Desembolso - Estado:' + FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
          DescripcionEstado := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
          TipoCuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
          Amortizacion := FieldByName('AMORTIZA_INTERES').AsInteger;
          AmortizaK := FieldByName('AMORTIZA_CAPITAL').AsInteger;
          FechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
          vTipoInteres := FieldByName('INTERES').AsString;
          vPuntosAdic := FieldByName('PUNTOS_INTERES').asfloat;
          EstadoActual := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          TipoInteres   := FieldByName('ID_INTERES').AsInteger;

          if FieldByName('TIPO_INTERES').AsString = 'F' then
            TasaC := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
          else
            TasaC := FieldByName('VALOR_ACTUAL_TASA').AsFloat;

          if RecordCount > 0 then
           begin
             vTipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
             vNumeroId := FieldByName('ID_PERSONA').AsString ;
             EdNumeroIdentificacion.Caption := FieldByName('ID_PERSONA').AsString ;
             EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
             vSaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
             EdAbonoCapital.Text := FormatCurr('#,#0.00',vSaldoActual);
             vAbonoCapital := vSaldoActual;
             EdSaldoColocacion.Caption := FormatCurr('#,#0.00',vSaldoActual);
             vFechaCapital := FieldByname('FECHA_CAPITAL').AsDateTime;
             EdFechaCapital.Caption := DateToStr(vFechaCapital);
             vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
             EdFechaInteres.Caption := DateToStr(vFechaInteres);
             vFechaDesembolso := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
//             EdEstado.Caption := DescripcionEstado;
             Close;

             if (Estado = 2) then begin
               PageControl1.Visible := True;
               InfoJudicial.TabVisible := True;
               PageControl1.ActivePage := InfoJudicial;
               InfoCastigada.TabVisible  := False;
             end
             else if (Estado = 3) then begin
               PageControl1.Visible := True;
               InfoCastigada.TabVisible := True;
               PageControl1.ActivePage := InfoCastigada;
               InfoJudicial.TabVisible := False;
             end
             else begin
               MessageDlg('La Colocación NO está Judicial o Castigada',mtError,[mbOK],0);
               inicializar;
               Exit;
             end;

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
                vcostas := FieldByName('COSTAS').AsCurrency;
                EdCostas.Caption := FormatCurr('#,#0',vcostas);
                if Estado = 2 then EdAbonoCostas.Text := FormatCurr('#,#0',vcostas)
                else EdAbonoCostasCas.Value := vcostas;
                Close;

                TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                            vAbonoInteresMora + vcostas + vhonorarios;
                EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);

                SQL.Clear;
                SQL.Add('select "gen$infcrediticia".ID_SOLICITUD from "gen$infcrediticia"');
                SQL.Add('inner join "col$solicitud" on ("gen$infcrediticia".ID_SOLICITUD = "col$solicitud".ID_SOLICITUD)');
                SQL.Add('where "gen$infcrediticia".ID_COLOCACION = :ID_COLOCACION and');
                SQL.Add('"col$solicitud".ESTADO in (4,12)');
                ParamByName('ID_COLOCACION').AsString := vColocacion;
                ExecQuery;
                if RecordCount > 0 then
                  vIdSolicitud := FieldByName('ID_SOLICITUD').AsString
                else begin
                  MessageDlg('No se encuentra Solicitud para esta Colocación',mtError,[mbOK],0);
                  inicializar;
                  Exit;
                end;
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
                    groupbox13.Visible := True;
                    EdCuentaAbogado.Caption := IntToStr(NumeroCuentaAbogado) + '-' + IntToStr(DigitoCuentaAbogado);
                    EdAbogado.Caption := FieldByName('NOMBRE').AsString + ' ' +
                                         FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                         FieldByName('SEGUNDO_APELLIDO').AsString;
                  end;

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
                 DiasMinimo := DiasMinimo - 30;
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
              EdAbonoCapital.SetFocus;
           end
           else
            begin
              MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
              EdNumeroColocacion.SetFocus;
            end;
        end;
end;

procedure TfrmLiquidacionJudicialDes.FormShow(Sender: TObject);
begin
        EdAgencia.KeyValue := Agencia;
        EdFecha.Caption := FormatDateTime('yyyy/mm/dd',fFechaActual);
        Inicializar;
end;

procedure TfrmLiquidacionJudicialDes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaCausadoEnter(
  Sender: TObject);
begin
        EdTasaAplicadaCausado.Text := FormatCurr('#0.00',vTasaCausado);
        EdTasaAplicadaCausado.SelectAll;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaCorrienteEnter(
  Sender: TObject);
begin
        EdTasaAplicadaCorriente.Text := FormatCurr('#0.00',vTasaCorriente);
        EdTasaAplicadaCorriente.SelectAll;
end;


procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaMoraEnter(
  Sender: TObject);
begin
        EdTasaAplicadaMora.Text := FormatCurr('#0.00',vTasaMora);
        EdTasaAplicadaMora.SelectAll;
end;

//Inicio - **intereses causados**///
procedure TfrmLiquidacionJudicialDes.EdAbonoInteresCausadoExit(
  Sender: TObject);
begin
          if EdAbonoInteresCausado.Text = '' then EdAbonoInteresCausado.Text := '0';
          vAbonoInteresCausado := StrToCurr(EdAbonoInteresCausado.Text);
          EdAbonoInteresCausado.Text := FormatCurr('#,##0',vAbonoInteresCausado);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas + vPapeleria;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdFechaInicialCausadoExit(
  Sender: TObject);
begin
//        vFechaInicialCausado := EdFechaInicialCausado.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdFechaFinalcausadoExit(Sender: TObject);
begin
//        vFechaFinalCausado := EdFechaFinalCausado.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosCausadoExit(
  Sender: TObject);
begin
        DiasCausado;
        DiasContingentes;
        DiasCorriente;
        DiasMora;
        if (EstadoActual = 2) or (EstadoActual = 3) then
          vTasaCausado := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora
        else
          vTasaCausado := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,vFechaFinalCausado,FechaInteres).TasaLiquidar;
        EdTasaAplicadaCausado.Text := FormatCurr('#0.00%',vTasaCausado);
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaCausadoExit(
  Sender: TObject);
begin

end;
//***Fin - Intereses Causados***////

//***Inicio - Interes corrientes**///
procedure TfrmLiquidacionJudicialDes.EdAbonoInterescorrienteExit(
  Sender: TObject);
begin
          if EdAbonoInteresCorriente.Text = '' then EdAbonoInteresCorriente.Text := '0';
          vAbonoInteresCorriente := StrToCurr(EdAbonoInteresCorriente.Text);
          EdAbonoInteresCorriente.Text := FormatCurr('#,##0',vAbonoInteresCorriente);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas + vPapeleria;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdFechaInicialCorrienteExit(
  Sender: TObject);
begin
//        vFechaInicialCorriente := EdFechaInicialCorriente.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdFechaFinalCorrienteExit(
  Sender: TObject);
begin
//        vFechaFinalCorriente := EdFechaFinalCorriente.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosCorrienteExit(
  Sender: TObject);
begin
        DiasCorriente;
        DiasMora;
        if (EstadoActual = 2) or (EstadoActual = 3) then
          vTasaCorriente := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora
        else
          vTasaCorriente := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,vFechaFinalCorriente,FechaInteres).TasaLiquidar;
        EdTasaAplicadaCorriente.Text := FormatCurr('#0.00%',vTasaCorriente);        
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaCorrienteExit(
  Sender: TObject);
begin
end;
///***Fin - Intereses Corrientes****////

//***Inicio - Intereses Mora**///
procedure TfrmLiquidacionJudicialDes.EdAbonoInteresMoraExit(
  Sender: TObject);
begin
          if EdAbonoInteresMora.Text = '' then EdAbonoInteresMora.Text := '0';
          vAbonoInteresMora := StrToCurr(EdAbonoInteresMora.Text);
          EdAbonoInteresMora.Text := FormatCurr('#,##0',vAbonoInteresMora);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas + vPapeleria;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdFechaInicialMoraExit(
  Sender: TObject);
begin
        vFechaInicialMora := EdFechaInicialMora.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdFechaFinalMoraExit(
  Sender: TObject);
begin
        vFechaFinalMora := EdFechaFinalMora.Date;
end;

procedure TfrmLiquidacionJudicialDes.EdTasaAplicadaMoraExit(
  Sender: TObject);
begin

end;
///**Fin - Intereses Mora**///

procedure TfrmLiquidacionJudicialDes.CmdAceptarClick(Sender: TObject);
var
I,J:Integer;
vCalFechaCausado : TDate;
vCalFechaCorriente : TDate;
vCalFechaAnticipado : TDate;
vCalFechaMora : TDate;
SumTasa:Single;
SumDias:Integer;
vCuentasdeOrden:Currency;
CodigoIvaGenerado : string;
CodigoPapeleria : string;
begin
  totaldebitos := 0;
  totalcreditos := 0;
  vCuentasdeOrden := 0;
  empleado;
  GroupBox1.Enabled := False;
  PageControl1.Enabled := False;

  with dmColocacion.IBSQL do
   begin
     SQL.Clear;
     SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 2');
     ExecQuery;
     CodigoAhorros := FieldByName('CODIGO_CONTABLE').AsString;
     Close;

     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 12');
     ExecQuery;
     CodigoPapeleria := FieldByName('CODIGO').AsString;
     Close;

     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 11');
     ExecQuery;
     CodigoIvaGenerado := FieldByName('CODIGO').AsString;
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
     ExecQuery;
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

     if Estado = 2 then begin
        if vAbonoCapital <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
           if CapitalaPagar = 0 then CapitalaPagar := vValorCuota;
           AR^.FechaInicial := fFechaActual; //vFechaCapital;
           AR^.FechaFinal   := fFechaActual; //CalculoFecha(vFechaCapital,DiasCapital);
           vFechaFInt := FechaIntAnt; //AR^.FechaFinal;
           NuevaFechaCapital := FechaCapAnt;//AR^.FechaFinal;
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

        if vAbonoInteresCausado <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString;
           AR^.FechaInicial := vFechaInicialCausado;
           AR^.FechaFinal := vFechaFinalCausado;
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
          AR^.EsCorriente := True;
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

// coloco papeleria
         if vPapeleria > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoPapeleria;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := SimpleRoundTo(vPapeleria/1.16,0);
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;

          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoIvaGenerado;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := vPapeleria - SimpleRoundTo(vPapeleria/1.16,0);
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
        end;

       //  fin Coloco Papeleria


        vTotalLiquidacion := TGeneral;

        New(AR);
        AR^.CuotaNumero := 0;
        AR^.CodigoPuc    := CodigoAhorros;
        AR^.FechaInicial := fFechaActual;
        AR^.FechaFinal   := fFechaActual;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := vTotalLiquidacion;//TotalCreditos - TotalDebitos;
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
         TotalDebitos := TotalDebitos + AR^.Debito;
         TotalCreditos := TotalCreditos + AR^.Credito;

       TotalDebitos := 0;
       TotalCreditos := 0;

        if  MyCuotasLiq.Lista.Count > 0 then
         for I := 0 to MyCuotasLiq.Lista.Count -1 do
          begin
            AR := MyCuotasLiq.Lista.Items[i];
            if AR^.EsCausado or AR^.EsCorriente or AR^.EsAnticipado then
              begin
                SumTasa := SumTasa + (ar^.Tasa * AR^.Dias);
                SumDias := SumDias + ar^.Dias;
              end;
          end;
          try
            TasaLiquidacion := SumTasa / SumDias;
          except
            TasaLiquidacion := Tasa;
          end;

        vTotalInteres := vAbonoInteresContingente + vAbonoInteresCausado + vAbonoInteresCorriente;
     end // fin de if estado = 2
    else if Estado = 3 then
     begin
        if vAbonocapital <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := '425005010000000000';
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           vFechaFInt := FechaIntAnt;
           FechaCapAnt := fFechaActual;
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

           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := '831015000000000000';
           if CapitalaPagar = 0 then CapitalaPagar := vValorCuota;
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoCapital;
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
           vCuentasdeOrden := vCuentasdeOrden + vAbonocapital;
         end;

        if vAbonoInteresCas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := '425005020000000000';
           AR^.FechaInicial := vFechaInicialInteresCas;
           AR^.FechaFinal   := vFechaFinalInteresCas;
           vFechaIInt := AR^.FechaInicial;
           vFechaFInt := AR^.FechaFinal;
           AR^.Dias := vDiasCas;
           AR^.Tasa := vTasaCas;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresCas;
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

           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := '831025010000000000';
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal   := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vAbonoInteresCas;
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
           vCuentasdeOrden := vCuentasdeOrden + vAbonoInteresCas;
         end;

        if vcostas <> 0 then
         begin
           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := '425005030000000000';
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vCostas;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;

           New(AR);
           AR^.CuotaNumero := 0;
           AR^.CodigoPuc := '831025020000000000';
           AR^.FechaInicial := fFechaActual;
           AR^.FechaFinal := fFechaActual;
           AR^.Dias := 0;
           AR^.Tasa := 0;
           AR^.Debito := 0;
           AR^.Credito := vCostas;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
           vCuentasdeOrden := vCuentasdeOrden + vCostas;
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
           AR^.Credito := vHonorarios;
           AR^.EsCapital := False;
           AR^.EsCausado := False;
           AR^.EsCorriente := False;
           AR^.EsVencido := False;
           AR^.EsAnticipado := False;
           AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
         end;

          // Coloco Deudoras de Control
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := '880500000000000000';
          AR^.FechaInicial := ffechaactual;
          AR^.FechaFinal   := ffechaactual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := vCuentasdeOrden;
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
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;

// coloco papeleria
         if vPapeleria > 0 then begin
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoPapeleria;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := SimpleRoundTo(vPapeleria/1.16,0);
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;

          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoIvaGenerado;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := vPapeleria - SimpleRoundTo(vPapeleria/1.16,0);
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;
        end;

       //  fin Coloco Papeleria

          vTotalLiquidacion := TGeneral;

          // coloco caja
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoAhorros;
          AR^.FechaInicial := fFechaActual;
          AR^.FechaFinal   := fFechaActual;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := vTotalLiquidacion;
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
           TotalDebitos := TotalDebitos + AR^.Debito;
           TotalCreditos := TotalCreditos + AR^.Credito;

        TotalDebitos := 0;
        TotalCreditos := 0;
        vCuentasdeOrden := 0;

       TGeneral := vTotalLiquidacion;
     end; // fin if estado = 3

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
     dmColocacion.IBSQLcodigos.Transaction.RollBack;
     Exit;
   end;
end;


procedure TfrmLiquidacionJudicialDes.GrabarExtractoDet;
begin
      with IBQuery do
        begin
          SQL.Clear;
          SQL.Add('insert into "col$extractodet" values (');
          SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
          SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
          SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');

          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(vComprobante);
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := Now;
          ParamByName('HORA_EXTRACTO').AsDateTime := Time;
          ParamByName('CODIGO_PUC').AsString := CodigoPuc;
          ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
          ParamByName('FECHA_FINAL').AsDate := FechaFinal;
          ParamByName('DIAS_APLICADOS').AsInteger := Dias;
          ParamByName('TASA_LIQUIDACION').AsFloat := Tasa;
          ParamByName('VALOR_DEBITO').AsCurrency := Debito;
          ParamByName('VALOR_CREDITO').AsCurrency := Credito;
          ExecSql;
          Close;
        end;
end;

procedure TfrmLiquidacionJudicialDes.GrabarExtracto;
var
FechaIntAnt:TDate;
FechaCapAnt:TDate;
vCuotaTipo : string;
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
       Open;
       FechaIntAnt := FieldByName('FECHA_INTERES').AsDateTime;
       FechaCapAnt := FieldByName('FECHA_CAPITAL').AsDateTime;
       Close;

       sql.Clear;
       SQL.Add('insert into "col$extractotmp" (');
       SQL.Add('"col$extractotmp"."ID_AGENCIA", "col$extractotmp"."ID_CBTE_COLOCACION",');
       SQL.Add('"col$extractotmp"."ID_COLOCACION", "col$extractotmp"."FECHA_EXTRACTO",');
       SQL.Add('"col$extractotmp"."HORA_EXTRACTO", "col$extractotmp"."CUOTA_EXTRACTO",');
       SQL.Add('"col$extractotmp"."TIPO_OPERACION", "col$extractotmp"."SALDO_ANTERIOR_EXTRACTO",');
       SQL.Add('"col$extractotmp"."ABONO_CAPITAL", "col$extractotmp"."ABONO_CXC",');
       SQL.Add('"col$extractotmp"."ABONO_SERVICIOS", "col$extractotmp"."ABONO_ANTICIPADO",');
       SQL.Add('"col$extractotmp"."ABONO_MORA", "col$extractotmp"."ABONO_SEGURO",');
       SQL.Add('"col$extractotmp"."ABONO_PAGXCLI", "col$extractotmp"."ABONO_HONORARIOS",');
       SQL.Add('"col$extractotmp"."ABONO_OTROS", "col$extractotmp"."TASA_INTERES_LIQUIDACION",');
       SQL.Add('"col$extractotmp"."ID_EMPLEADO",');
       SQL.Add('"col$extractotmp"."INTERES_PAGO_HASTA",');
       SQL.Add('"col$extractotmp"."CAPITAL_PAGO_HASTA",');
       SQL.Add('"col$extractotmp"."TIPO_ABONO",');
       SQL.Add('"col$extractotmp"."ID_SOLICITUD",');
       SQL.Add('"col$extractotmp"."ID_COLOCACION_DES")');
       SQL.Add(' Values (');
       SQL.Add(':"ID_AGENCIA", :"ID_CBTE_COLOCACION", :"ID_COLOCACION",');
       SQL.Add(':"FECHA_EXTRACTO", :"HORA_EXTRACTO", :"CUOTA_EXTRACTO",');
       SQL.Add(':"TIPO_OPERACION", :"SALDO_ANTERIOR_EXTRACTO", :"ABONO_CAPITAL",');
       SQL.Add(':"ABONO_CXC", :"ABONO_SERVICIOS", :"ABONO_ANTICIPADO", :"ABONO_MORA",');
       SQL.Add(':"ABONO_SEGURO", :"ABONO_PAGXCLI", :"ABONO_HONORARIOS",');
       SQL.Add(':"ABONO_OTROS", :"TASA_INTERES_LIQUIDACION", :"ID_EMPLEADO",');
       SQL.Add(':"INTERES_PAGO_HASTA", :"CAPITAL_PAGO_HASTA", :"TIPO_ABONO", :"ID_SOLICITUD", :"ID_COLOCACION_DES")');
       if Estado = 2 then begin
         ParamByName('ID_AGENCIA').AsInteger := agencia;
         ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
         ParamByName('ID_COLOCACION').AsString := vColocacion;
         ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
         ParamByName('HORA_EXTRACTO').AsDateTime := fFechaHoraActual;
         ParamByName('CUOTA_EXTRACTO').AsInteger := 0;
         ParamByName('TIPO_OPERACION').AsInteger := 1;
         ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
         ParamByName('ABONO_CAPITAL').AsCurrency := vAbonocapital;
         ParamByName('ABONO_CXC').AsCurrency := vAbonoInteresCausado;
         ParamByName('ABONO_SERVICIOS').AsCurrency := vAbonoInteresCorriente;
         ParamByName('ABONO_ANTICIPADO').AsCurrency := 0;
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
         if vAbonoInteresCausado > 0 then
         ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalCausado;
         if vAbonoInteresContingente > 0 then
           ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalContingente;
         if vAbonoInteresCorriente > 0 then
           ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalCorriente;
         ParamByName('CAPITAL_PAGO_HASTA').AsDate := fFechaActual;
         ParamByName('TIPO_ABONO').AsInteger := BooleanoToInt(devolucion);
         ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
         ParamByName('ID_COLOCACION_DES').AsString := '';
       end
      else
       begin
         ParamByName('ID_AGENCIA').AsInteger := Agencia ;
         ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vComprobante);
         ParamByName('ID_COLOCACION').AsString := vColocacion;
         ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
         ParamByName('HORA_EXTRACTO').AsDateTime := fFechaHoraActual;
         ParamByName('CUOTA_EXTRACTO').AsInteger := 0;
         ParamByName('TIPO_OPERACION').AsInteger := 1;
         ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
         ParamByName('ABONO_CAPITAL').AsCurrency := vAbonocapital;
         ParamByName('ABONO_CXC').AsCurrency := 0;
         ParamByName('ABONO_SERVICIOS').AsCurrency := vAbonoInteresCas;
         ParamByName('ABONO_ANTICIPADO').AsCurrency := 0;
         ParamByName('ABONO_MORA').AsCurrency := 0;
         ParamByName('ABONO_SEGURO').AsCurrency := 0;
         if vcostas <> 0 then
            ParamByName('ABONO_PAGXCLI').AsCurrency := vCostas
         else
            ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
         if vhonorarios <> 0 then
            ParamByName('ABONO_HONORARIOS').AsCurrency := vHonorarios
         else
            ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
         ParamByName('ABONO_OTROS').AsCurrency := 0;
         ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasaCas;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         if vAbonoInteresCas > 0 then
            ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaFinalInteresCas
         else
            ParamByName('INTERES_PAGO_HASTA').AsDate := FechaIntAnt;

         ParamByName('CAPITAL_PAGO_HASTA').AsDate := fFechaActual;
         ParamByName('TIPO_ABONO').AsInteger := 0;
         ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
         ParamByName('ID_COLOCACION_DES').AsString := '';
       end;
       ExecSQL;
       Close;

       if (vcostas <> 0) or (vhonorarios <> 0) then begin
         SQL.Clear;
         SQL.Add('insert into "col$pagocostastmp" values (:ID_AGENCIA,:ID_COLOCACION,');
         SQL.Add(':FECHA,:ID_CBTE_COLOCACION,:VALOR_COSTAS,:VALOR_HONORARIOS,:VALOR_OTROS,');
         SQL.Add(':ID_SOLICITUD,:ID_COLOCACION_DES,:NUMERO_CUENTA_AB,:DIGITO_CUENTA_AB)');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COLOCACION').AsString := vColocacion;
         ParamByName('FECHA').AsDate := fFechaActual;
         ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vComprobante);
         ParamByName('VALOR_COSTAS').AsCurrency := vcostas;
         ParamByName('VALOR_HONORARIOS').AsCurrency := vhonorarios;
         ParamByName('VALOR_OTROS').AsCurrency := 0;
         ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
         ParamByName('ID_COLOCACION_DES').AsString := '';
         ParamByName('NUMERO_CUENTA_AB').AsInteger := NumeroCuentaAbogado;
         ParamByName('DIGITO_CUENTA_AB').AsInteger := DigitoCuentaAbogado;
         ExecSQL;
         Close;
       end;
     end;
end;

procedure TfrmLiquidacionJudicialDes.BtnCerrarClick(Sender: TObject);
begin
        if DmColocacion.IBDSagencias.Transaction.InTransaction then
           DmColocacion.IBDSagencias.Transaction.Rollback;
        Close;
end;

procedure TfrmLiquidacionJudicialDes.CmdBuscarClick(Sender: TObject);
var frmBusquedaDeColocacion:TfrmBusquedaDeColocacion;
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;

end;

procedure TfrmLiquidacionJudicialDes.CmdInformeClick(Sender: TObject);
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
           Report.Variables.ByName['Hoy'].AsDateTime := fFechaActual;
           Report.Variables.ByName['FechaCorte'].AsDateTime := fFechaActual;
           Report.Variables.ByName['ProximaCuota'].AsString := FechaProx;           
           Report.Variables.ByName['Asociado'].AsString := Asociado;
           Report.Variables.ByName['Cuenta'].AsString := IntToStr(NumeroCuentaAh) + '-' + IntToStr(DigitoCuentaAh);
           Report.Variables.ByName['NuevoSaldo'].AsDouble := vSaldoActual - vAbonoCapital;
           Report.Variables.ByName['InteresesHasta'].AsDateTime := vFechaFInt;
           Report.Variables.ByName['CapitalHasta'].AsDateTime := NuevaFechaCapital;
           Report.Variables.ByName['comprobante'].AsString := VComprobante;
           Report.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;

           if Report.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.CmdImprimir.Enabled := False;
              frmVistaPreliminar.Reporte := Report;
              frmVistaPreliminar.ShowModal;
           end;
           IBInforme.EmptyDataSet;
end;

procedure TfrmLiquidacionJudicialDes.Empleado;
begin
        with dmColocacion.IBQuery do
         begin
           if Transaction.InTransaction then
             Transaction.Rollback;
           Transaction.StartTransaction;
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
         end;
end;

procedure TfrmLiquidacionJudicialDes.inicializar;
begin
  if dmGeneral.IBTransaction1.InTransaction then
    dmGeneral.IBTransaction1.Rollback;
  dmGeneral.IBTransaction1.StartTransaction;

  DmColocacion.IBDSagencias.Open;
  DmColocacion.IBDSagencias.Last;
  DmColocacion.IBDSagencias.First;
  vColocacion := '';
  vComprobante := '';
  vAbonocapital := 0;
  vAbonoInteresContingente := 0;
  vAbonoInteresCorriente  := 0;
  vAbonoInteresCausado    := 0;
  vAbonoInteresMora       := 0;
  vAbonoInteresCas        := 0;
  vFechaInicialContingente := fFechaActual;
  vFechaFinalContingente := fFechaActual;
  vFechaInicialCorriente  := fFechaActual;
  vFechaFinalCorriente    := fFechaActual;
  vFechaInicialCausado    := fFechaActual;
  vFechaFinalCausado      := fFechaActual;
  vFechaInicialMora       := fFechaActual;
  vFechaFinalMora         := fFechaActual;
  vFechaInicialInteresCas := fFechaActual;
  vFechaFinalInteresCas   := fFechaActual;
  vFechaInteres           := fFechaActual;
  vFechaInteresCas        := fFechaActual;
  vFechaCapital           := fFechaActual;
  vDiasContingente        := 0;
  vDiasCorriente          := 0;
  vDiasCausado            := 0;
  vDiasMora               := 0;
  vDiasCas                := 0;
  vTasaContingente        := 0;
  vTasaCorriente          := 0;
  vTasaCausado            := 0;
  vTasaMora               := 0;
  vTasaCas                := 0;
  vSaldoActual            := 0;
  TipoInteres             := 0;
  vPuntosAdic             := 0;
  TasaC                   := 0;
  EstadoActual            := 0;
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
  vPapeleria := 0;
  ChkPapeleria.Checked := False;

  //**
  vValorCuota             := 0;
  CapitalaPagar           := 0;
  InteresaPagar           := 0;
  vTotalInteres           := 0;
  totaldebitos            := 0;
  totalcreditos           := 0;
  NumeroCuentaAp          := 0;
  DigitoCuentaAp          := 0;
  NumeroCuentaAh          := 0;
  DigitoCuentaAh          := 0;
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
  EdCuentaAbogado.Caption := '';
  EdAbogado.Caption := '';
  EdNoComprobante.Text := '';
  EdAbonoCapital.Text := '';
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
  EdAbonoInteresMora.Text := '';
  EdFechaInicialMora.Date := fFechaActual;
  EdFechaFinalMora.Date := fFechaActual;
  EdDiasAplicadosMora.Text := '';
  EdTasaAplicadaMora.Text := '';
//  GroupBox3.Visible := False;
//  GroupBox3.Enabled := True;
  GroupBox1.Enabled := True;
  CmdInforme.Enabled := False;
  CmdGrabar.Visible := False;
  CmdReversar.Visible := False;
  CmdAceptar.Visible := True;
  CmdAceptar.Enabled := True;
  EdTotalColManual.Caption := '';
//  EdEstado.Caption := '';
  EdCostas.Caption := '';
  EdAbonoCostas.Text := '';
  EdAbonoHonorarios.Text := '';

  PageControl1.Visible := False;
  PageControl1.Enabled := True;

  NumeroCuentaAbogado := 0;
  DigitoCuentaAbogado := 0;
  EdNumeroColocacion.Text := '';
  EdAgencia.SetFocus;
end;


procedure TfrmLiquidacionJudicialDes.CmdGrabarClick(Sender: TObject);
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
     CmdReversar.Click;
     Exit;
   end
  else
   begin
    abono_capital := 0;
    abono_cxc := 0;
    abono_servicios := 0;
    abono_mora := 0;
    Cuota_anterior := 0;
    cambio := false;

///**Genero el consecutivo
    vComprobante := IntToStr(ObtenerConsecutivodesembolso(IBSaldo));
    IBSaldo.Transaction.StartTransaction;
    EdNoComprobante.Text := vComprobante;

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


    with IBQuery do
     try
      grabarextracto;
      Close;
      SQL.Clear;
      SQL.Add('insert into "col$extractodettmp" values (');
      SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
      SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
      SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO",:ID_SOLICITUD,:ID_COLOCACION_DES,:CUOTA_EXTRACTO)');
      if  MyCuotasLiq.Lista.Count > 0 then
       for I := 0 to MyCuotasLiq.Lista.Count -1 do
        begin
          Application.ProcessMessages;
          AR := MyCuotasLiq.Lista.Items[I];
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger:= StrToInt(vcomprobante);
          ParamByName('ID_COLOCACION').AsString := vColocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
          ParamByName('HORA_EXTRACTO').AsDateTime := fFechaHoraActual;
          if AR^.CodigoPuc = CodigoCaja then
            ParamByName('CODIGO_PUC').AsString := CodigoAhorros
          else
            ParamByName('CODIGO_PUC').AsString := AR^.CodigoPuc;
          ParamByName('FECHA_INICIAL').AsDate := AR^.FechaInicial;
          ParamByName('FECHA_FINAL').AsDate := AR^.FechaFinal;
          ParamByName('DIAS_APLICADOS').AsInteger := AR^.Dias;
          ParamByName('TASA_LIQUIDACION').AsFloat := AR^.Tasa;
          ParamByName('VALOR_DEBITO').AsCurrency := AR^.Debito;
          ParamByName('VALOR_CREDITO').AsCurrency := AR^.Credito;
          ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
          ParamByName('ID_COLOCACION_DES').AsString := '';
          ParamByName('CUOTA_EXTRACTO').AsInteger := 0;//AR^.CuotaNumero;
          ExecSql;
          Close;
        end;// FIN 4 FOR


{       if (vcostas > 0) or (vhonorarios > 0) then begin
         SQL.Clear;
         SQL.Add('INSERT INTO "col$pagocostastmp"');
         SQL.Add('values(:ID_AGENCIA,:ID_COLOCACION,:FECHA,:ID_CBTE_COLOCACION,');
         SQL.Add(':VALOR_COSTAS,:VALOR_HONORARIOS,:VALOR_OTROS,');
         SQL.Add(':ID_SOLICITUD,:ID_COLOCACION_DES,:NUMERO_CUENTA_AB,:DIGITO_CUENTA_AB)');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COLOCACION').AsString := vColocacion;
         ParamByName('FECHA').AsDate := fFechaActual;
         ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vComprobante);
         ParamByName('VALOR_COSTAS').AsCurrency := vcostas;
         ParamByName('VALOR_HONORARIOS').AsCurrency := vhonorarios;
         ParamByName('VALOR_OTROS').AsCurrency := 0;
         ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
         ParamByName('ID_COLOCACION_DES').AsString := '';
         ParamByName('NUMERO_CUENTA_AB').AsInteger := NumeroCuentaAbogado;
         ParamByName('DIGITO_CUENTA_AB').AsInteger := DigitoCuentaAbogado;
         ExecSQL;
         Close;
       end;           }


       SQL.Clear;
       SQL.Add('insert into "col$infdesembolso" ("col$infdesembolso".ID_AGENCIA,"col$infdesembolso".ID_COLOCACION,');
       SQL.Add('"col$infdesembolso".CAPITAL,"col$infdesembolso".CAPITAL_HASTA, "col$infdesembolso".INTERES_HASTA,');
       SQL.Add('"col$infdesembolso".ES_COLOCACION,"col$infdesembolso".ID_SOLICITUD,"col$infdesembolso".ES_LIQUIDATOTAL)');
       SQL.Add('values(');
       SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:CAPITAL,:CAPITAL_HASTA,:INTERES_HASTA, :ES_COLOCACION,:ID_SOLICITUD,0)');
       ParamByName('ID_AGENCIA').AsInteger := agencia;
       ParamByName('ID_COLOCACION').AsString := vColocacion;
       ParamByName('CAPITAL').AsCurrency := vAbonocapital;
       ParamByName('CAPITAL_HASTA').AsDate := FechaCapAnt;
       ParamByName('INTERES_HASTA').AsDate := vFechaFInt;
       ParamByName('ES_COLOCACION').AsInteger := 1;
       ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
       ExecSql;
       Transaction.Commit;
       Close;


     MessageDlg('Cuotas Liquidadas con Exito',mtInformation,[mbOK],0);
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


procedure TfrmLiquidacionJudicialDes.CmdReversarClick(Sender: TObject);
begin
          DmGeneral.IBTransaction1.Rollback;
          MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
          Inicializar;
end;



procedure TfrmLiquidacionJudicialDes.DiasCausado;
begin
        if EdDiasAplicadosCausado.Text = '' then EdDiasAplicadosCausado.Text := '0';
        vDiasCausado := StrToInt(EdDiasAplicadosCausado.Text);
        EdDiasAplicadosCausado.Text := FormatCurr('#0',vDiasCausado);
        if (vAbonoInteresCausado <> 0) then
        begin
           vFechaInicialCausado := CalculoFecha(vFechaInteres,1);
           vFechaFinalCausado := CalculoFechaManual1(vFechaInicialCausado,vFechaDesembolso,vDiasCausado);
           EdFechaInicialCausado.Date := vFechaInicialCausado;
           EdFechaFinalCausado.Date := vFechaFinalCausado;
        end;
end;

procedure TfrmLiquidacionJudicialDes.DiasCorriente;
begin
        if EdDiasAplicadosCorriente.Text = '' then EdDiasAplicadosCorriente.Text := '0';
        vDiasCorriente := StrToInt(EdDiasAplicadosCorriente.Text);
        EdDiasAplicadosCorriente.Text := FormatCurr('#0',vDiasCorriente);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaInteres,1);
           vFechaFinalCorriente := CalculoFechaManual1(vFechaInicialCorriente,vFechaDesembolso,vDiasCorriente);
           EdFechaInicialCorriente.Date := vFechaInicialCorriente;
           EdFechaFinalCorriente.Date := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalCorriente := CalculoFechaManual1(vFechaInicialCorriente,vFechaDesembolso,vDiasCorriente);
           EdFechaInicialCorriente.Date := vFechaInicialCorriente;
           EdFechaFinalCorriente.Date := vFechaFinalCorriente;
         end
        else
        if (vAbonoInteresContingente <> 0) then
         begin
           vFechaInicialCorriente := CalculoFecha(vFechaFinalContingente,1);
           vFechaFinalCorriente := CalculoFechaManual1(vFechaInicialCorriente,vFechaDesembolso,vDiasCorriente);
           EdFechaInicialCorriente.Date := vFechaInicialCorriente;
           EdFechaFinalCorriente.Date := vFechaFinalCorriente;
         end;
end;


procedure TfrmLiquidacionJudicialDes.DiasMora;
begin
        if EdDiasAplicadosMora.Text = '' then EdDiasAplicadosMora.Text := '0';
        vDiasMora := StrToInt(EdDiasAplicadosMora.Text);
        EdDiasAplicadosMora.Text := FormatCurr('#0',vDiasMora);
        if (vAbonoInteresMora > 0) and (vTipoInteres = 'V') then
         begin
           if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaInteres,1);
              vFechaFinalMora := CalculoFechaManual1(vFechaInicialMora,vFechaDesembolso,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonoInteresCausado <> 0) and (vAbonoInteresContingente = 0) and (vAbonoInteresCorriente = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalCausado,1);
              vFechaFinalMora := CalculoFechaManual1(vFechaInicialMora,vFechaDesembolso,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonoInteresContingente <> 0) and (vAbonoInteresCorriente = 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalContingente,1);
              vFechaFinalMora := CalculoFechaManual1(vFechaInicialMora,vFechaDesembolso,vDiasMora);
              EdFechaInicialMora.Date := vFechaInicialMora;
              EdFechaFinalMora.Date := vFechaFinalMora;
            end
           else
           if (vAbonoInteresCorriente <> 0) then
            begin
              vFechaInicialMora := CalculoFecha(vFechaFinalCorriente,1);
              vFechaFinalMora := CalculoFechaManual1(vFechaInicialMora,vFechaDesembolso,vDiasMora);
              EdFechaInicialMora.DateTime := vFechaInicialMora;
              EdFechaFinalMora.DateTime := vFechaFinalMora;
            end
         end;
        if (vAbonoInteresMora > 0) and (vTipoInteres = 'A') then
         begin
           vFechaInicialMora := CalculoFecha(vFechaInteres,1);
           vFechaFinalMora := CalculoFechaManual1(vFechaInicialMora,vFechaDesembolso,vDiasMora);
           EdFechaInicialMora.DateTime := vFechaInicialMora;
           EdFechaFinalMora.DateTime := vFechaFinalMora;
         end;

end;

procedure TfrmLiquidacionJudicialDes.DiasInteres;
begin
        if EdDiasAplicados.Text = '' then EdDiasAplicados.Text := '0';
        vDiasCas := StrToInt(EdDiasAplicados.Text);
        EdDiasAplicados.Text := FormatCurr('#0',vDiasCas);
        if (vAbonoInteresCas <> 0) then
        begin
           vFechaInicialInteresCas := CalculoFecha(vFechaInteres,1);
           vFechaFinalInteresCas := CalculoFechaManual1(vFechaInicialInterescas,vFechaDesembolso,vDiasCas);
           EdFechaInicial.Date := vFechaInicialInteresCas;
           EdFechaFinal.Date := vFechaFinalInteresCas;
        end;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosCausadoChange(
  Sender: TObject);
begin
        DiasCausado;
        DiasContingentes;
        DiasCorriente;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosCorrienteChange(
  Sender: TObject);
begin
        DiasCorriente;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.GrabarTablaLiquidacion;
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
          ParamByName('FECHA_PAGADA').AsDate := Now;
          ExecSQL;
          Close;
         end;
end;
procedure TfrmLiquidacionJudicialDes.LimpiarManualIntereses;
begin
  EdAbonoInteresContingente.Text := '';
  EdAbonoInteresCausado.Text := '';
  EdAbonoInterescorriente.Text := '';
  EdAbonoInteres.Value := 0;
  EdAbonoInteresMora.Text := '';
  EdAbonoCostas.Text := '';
  EdAbonoCostasCas.Value := 0;
  EdAbonoHonorariosCas.Value := 0;
  EdAbonoHonorarios.Text := '';

  EdDiasAplicadosContingente.Text := '';
  EdDiasAplicadosCausado.Text := '';
  EdDiasAplicadosCorriente.Text := '';
  EdDiasAplicados.Value := 0;
  EdDiasAplicadosMora.Text := '';

  EdTasaAplicadaContingente.Text := '';
  EdTasaAplicadaCausado.Text := '';
  EdTasaAplicadaCorriente.Text := '';
  EdTasaAplicada.Text := '';
  EdTasaAplicadaMora.Text := '';

  vAbonoInteresContingente :=0;
  vDiasContingente:=0;
  vTasaContingente:=0;

  vAbonoInteresCausado:=0;
  vDiasCausado:=0;
  vTasaCausado:=0;

  vAbonoInteresCorriente:=0;
  vDiasCorriente:=0;
  vTasaCorriente:=0;

  vAbonoInteresCas := 0;
  vDiasCas := 0;
  vTasaCas := 0;

  vAbonoInteresMora:=0;
  vDiasMora := 0;
  vTasaMora := 0;

  vhonorarios := 0;
  vcostas := 0;

  TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente +
              vAbonoInteresCorriente + vAbonoInteresCas + vAbonoInteresMora +
              vcostas + vhonorarios;

  EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoInteresContingenteExit(
  Sender: TObject);
begin
          if EdAbonoInteresContingente.Text = '' then EdAbonoInteresContingente.Text := '0';
          vAbonoInteresContingente := StrToCurr(EdAbonoInteresContingente.Text);
          EdAbonoInteresContingente.Text := FormatCurr('#,##0',vAbonoInteresContingente);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas + vPapeleria;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoCostas1Exit(Sender: TObject);
begin
          vcostas := EdAbonoCostas.Value;
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosContingenteExit(
  Sender: TObject);
begin
        DiasContingentes;
        DiasCorriente;
        DiasMora;
        if (EstadoActual = 2) or (EstadoActual = 3) then
          vTasaContingente := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora
        else
          vTasaContingente := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,vFechaFinalContingente,FechaInteres).TasaLiquidar;
        EdTasaAplicadaContingente.Text := FormatCurr('#0.00%',vTasaContingente);        
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosContingenteChange(
  Sender: TObject);
begin
        DiasContingentes;
        DiasCausado;
        DiasCorriente;
        DiasMora;
end;

procedure TfrmLiquidacionJudicialDes.DiasContingentes;
begin
        if EdDiasAplicadosContingente.Text = '' then EdDiasAplicadosContingente.Text := '0';
        vDiasContingente := StrToInt(EdDiasAplicadosContingente.Text);
        EdDiasAplicadosContingente.Text := FormatCurr('#0',vDiasContingente);
        if (vAbonoInteresCausado = 0) and (vAbonoInteresContingente > 0) then
         begin
           vFechaInicialContingente := CalculoFecha(vFechaInteres,1);
           vFechaFinalContingente := CalculoFechaManual1(vFechaInicialContingente,vFechaDesembolso,vDiasContingente);
           EdFechaInicialContingente.Date := vFechaInicialContingente;
           EdFechaFinalContingente.Date := vFechaFinalContingente;
         end
        else
         begin
           vFechaInicialContingente := CalculoFecha(vFechaFinalCausado,1);
           vFechaFinalContingente := CalculoFechaManual1(vFechaInicialContingente,vFechaDesembolso,vDiasContingente);
           EdFechaInicialContingente.Date := vFechaInicialContingente;
           EdFechaFinalContingente.Date := vFechaFinalContingente;
         end;
end;


procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosMoraChange(
  Sender: TObject);
begin
        diasmora;
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosMoraExit(
  Sender: TObject);
begin
        diasmora;
        vTasaMora := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora;
        EdTasaAplicadaMora.Text := FormatCurr('#0.00%',vTasaMora);
end;

procedure TfrmLiquidacionJudicialDes.CmdNuevoClick(Sender: TObject);
begin
        inicializar;
end;


procedure TfrmLiquidacionJudicialDes.EdAbonoHonorarios1Exit(
  Sender: TObject);
begin
          if EdAbonoHonorariosCas.Text = '' then EdAbonoHonorariosCas.Text := '0';
          vhonorarios := StrToCurr(EdAbonoHonorariosCas.Text);
          EdAbonoHonorariosCas.Text := FormatCurr('#,##0',vhonorarios);
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoInteresExit(Sender: TObject);
begin
          vAbonoInteresCas := EdAbonoInteres.Value;
          TGeneral := vAbonoCapital + vAbonoInteresCas + vcostas + vhonorarios + vPapeleria;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosExit(Sender: TObject);
begin
        DiasInteres;
        vTasaCas := BuscoTasaManual(Clasificacion,TasaC,TipoInteres,TipoCuota,vPuntosAdic,Amortizacion,fFechaActual,FechaInteres).TasaMora;
        EdTasaAplicada.Text := FormatCurr('#0.00%',vTasaCas);        
end;

procedure TfrmLiquidacionJudicialDes.EdDiasAplicadosChange(
  Sender: TObject);
begin
        DiasInteres;
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoHonorariosExit(
  Sender: TObject);
begin
          vhonorarios := EdAbonoHonorarios.Value;
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas + vPapeleria;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoHonorariosCasExit(
  Sender: TObject);
begin
          vhonorarios := EdAbonoHonorariosCas.Value;
          TGeneral := vAbonoCapital + vAbonoInteresCas + vhonorarios + vcostas + vPapeleria;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoCostasExit(Sender: TObject);
begin
          vcostas := EdAbonoCostas.Value;
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas + vPapeleria;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.EdAbonoCostasCasExit(Sender: TObject);
begin
          vcostas := EdAbonoCostasCas.Value;
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas + vPapeleria;
          EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

procedure TfrmLiquidacionJudicialDes.ChkPapeleriaClick(Sender: TObject);
begin
        if ChkPapeleria.Checked then
         begin
           with IBSQL1 do begin
             Close;
             SQL.Clear;
             SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 4');
             ExecQuery;
             vPapeleria := FieldByName('VALOR_MINIMO').AsCurrency;
             Close;
           end;
         end
        else
           vPapeleria := 0;
           
        if Estado = 2 then
          TGeneral := vAbonoCapital + vAbonoInteresCausado + vAbonoInteresContingente + vAbonoInteresCorriente +
                      vAbonoInteresMora + vhonorarios + vcostas + vPapeleria
        else if Estado = 3 then
          TGeneral := vAbonoCapital + vAbonoInteresCas + vcostas + vhonorarios + vPapeleria;

        EdTotalColManual.Caption := FormatCurr('#,0.00',TGeneral);
end;

end.
