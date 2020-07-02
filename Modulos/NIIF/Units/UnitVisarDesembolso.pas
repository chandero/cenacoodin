unit UnitVisarDesembolso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, Mask, StdCtrls, DBCtrls, Buttons, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, IBSQL, DateUtils, JclSysUtils, FR_Class,sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, JclShell,
  IBDatabase, strutils, Fr_Dbset, DBClient, UnitDmGeneral, UnitDmColocacion, UnitDmSolicitud;

type
  TfrmVisarDesembolso = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label31: TLabel;
    EdTipoIdentificacion: TStaticText;
    EdNumeroIdentificacion: TStaticText;
    EdNombre: TStaticText;
    CmdBuscar: TBitBtn;
    EdAgencia: TDBLookupComboBox;
    EdNumeroColocacion: TMaskEdit;
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
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label30: TLabel;
    Label53: TLabel;
    Label54: TLabel;
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
    EdTasaMora: TStaticText;
    EdTipoCuota: TStaticText;
    EdAmortizaCapital: TStaticText;
    EdAmortizaInteres: TStaticText;
    EdPeriodoGracia: TStaticText;
    EdSaldoColocacion: TStaticText;
    EdTasaMaxima: TStaticText;
    EdTasaNominal: TStaticText;
    EdDiasProrroga: TStaticText;
    EdTasaMaximaNominal: TStaticText;
    EdFechaCapital: TStaticText;
    EdFechaInteres: TStaticText;
    EdEnteAprobador: TStaticText;
    EdNotaContable: TStaticText;
    EdTotalCuotas: TStaticText;
    Panel2: TPanel;
    CmdCerrar: TBitBtn;
    CmdVisar: TBitBtn;
    CmdTablaLiq: TBitBtn;
    CmdGarantias: TBitBtn;
    CmdAnular: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    IBQuery2: TIBQuery;
    Label29: TLabel;
    EdCuentaAportes: TStaticText;
    IBAhorros: TIBQuery;
    IBAportes: TIBQuery;
    IBAbonar: TIBQuery;
    IBAhorrosCREDITO: TIBBCDField;
    IBAportesCREDITO: TIBBCDField;
    IBSQL1: TIBSQL;
    SpeedButton1: TSpeedButton;
    frReport1: TfrReport;
    frCompositeReport1: TfrCompositeReport;
    IdTCPClient1: TIdTCPClient;
    IBEquivida: TIBSQL;
    IBTransaction1: TIBTransaction;
    IBHonorarios: TIBSQL;
    IBSQL2: TIBSQL;
    Reporte: TfrReport;
    CHcredivida: TCheckBox;
    CDbeneficiarios: TClientDataSet;
    CDbeneficiariosnombre: TStringField;
    CDbeneficiariosporciento: TCurrencyField;
    CDbeneficiariosparentesco: TIntegerField;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CmdTablaLiqClick(Sender: TObject);
    procedure CmdGarantiasClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdVisarClick(Sender: TObject);
    procedure CmdAnularClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormCreate(Sender: TObject);
  private
  // VARIABLES MANEJO DE DESEMBOLSO
    vidSolicitud :string;
    vfecha_nacimiento: string;
    vlugar_nacimiento: string;
    vdireccion: string;
    v_telefono: string;
    vlugar_expedicion: string;
    v_ciudad: string;
    v_certificado: string;
    seguro_vida: boolean;
    v_empresa: string;
    v_cargo: string;
    Ves_Credivida: boolean;
    procedure Inicializar;
    function AplicarDescuentos:Boolean;
    procedure BuscarDatos;
    function AbonarAportes:Boolean;
    function AbonarAhorros:Boolean;
    procedure CambiarEstadoColocacion;
    procedure ReversarColocacion;
    function DescontarAhorros: boolean;
    procedure AbonarCuotas;
    procedure elimina_temp;
    procedure Verifica_credito;
    procedure imprimir_reporte(cadena: string);
    procedure equivida;
    function con_equivida: string;
    procedure VerificaCaptacion;
    procedure AbonaHonorarios;
    procedure AutorizacionCredivida;
    procedure InfDesembolso;
    { Private declarations }
  public
  es_creditos: Boolean;
  published
    { Public declarations }
  end;

var
  frmVisarDesembolso: TfrmVisarDesembolso;
  dmGeneral: TdmGeneral;
  dmColocacion: TdmColocacion;
  dmSolicitud: TdmSolicitud;
  colocacion : string;
  vcolocacion : string;
  vDesembolso : Currency;
  vEstadoColocacion:Integer;
  vCuentaAportes:Integer;
  vIdIdentificacion:Integer;
  vIdPersona:String;
  consecutivo:integer;
  consec:string;
  vNotaContable:string;
  DigitoC:String;
  vCodigoPucAportes:String;
  vCodigoPucAhorros:String;
  ValorAportes:Currency;
  ValorAhorros:Currency;
  ValorDescuentoAho : Currency;
  EsAnulado : Integer;
  EsVigente : Integer;
  Empleado1 : string;
  Bancoldex : Boolean;
  LineaBancoldex : string;
  NoBancoldex : string;
implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, UnitBuscarColocacion, UnitTablaPagoColocacion, UnitConsultaGarantias,
  UnitImpresion, unitMain;


procedure TfrmVisarDesembolso.EdNumeroColocacionExit(Sender: TObject);
var TasaEfectiva:Double;
    TasaAplicada : Double;
    SalMinimo:Currency;
    VecesMinimo:Integer;
    SaldoControl:Currency;
begin
           Ves_Credivida := False;
           colocacion := trim(EdNumeroColocacion.Text);
           EdNumeroColocacion.Text := colocacion;
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
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
                SQL.Add('"col$enteaprobador"."DESCRIPCION_ENTE_APROBADOR",');
                SQL.Add('"col$colocacion"."NOTA_CONTABLE",');
                SQL.Add('"col$colocacion".NUMERO_CUENTA,');
                SQL.Add('"col$colocacion".ID_EMPLEADO,');
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
                SQL.Add('"gen$persona".FECHA_NACIMIENTO,');
                SQL.Add('"gen$persona".LUGAR_NACIMIENTO,');
                SQL.Add('"gen$persona".LUGAR_EXPEDICION,');
                SQL.Add('"gen$persona".EMPRESA_LABORA,');
                SQL.Add('"gen$persona".CARGO_ACTUAL,');
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

                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := colocacion;
                Open;
                
                if RecordCount > 0 then
                begin
                     if FieldByName('ES_NOVISADO').AsInteger <> 1 then
                      begin
                          MessageDlg('Esta Colocación no se puede Visar',mtError,[mbOK],0);
                          CmdVisar.Enabled := False;
                          CmdAnular.Enabled := False;
                          Exit;
                      end;
                      vfecha_nacimiento := FormatDateTime('dd/mm/yyyy',FieldByName('FECHA_NACIMIENTO').AsDateTime);
                      vlugar_nacimiento := FieldByName('LUGAR_NACIMIENTO').AsString;
                      vlugar_expedicion := FieldByName('LUGAR_EXPEDICION').AsString;
                      v_cargo := FieldByName('CARGO_ACTUAL').AsString;
                      v_empresa := FieldByName('EMPRESA_LABORA').AsString;
                      Empleado1 := FieldByName('ID_EMPLEADO').AsString;
                      vIdIdentificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
                      EdTipoIdentificacion.Caption := FieldByName('DESCRIPCION_IDENTIFICACION').AsString ;
                      vIdPersona := FieldByName('ID_PERSONA').AsString;
                      EdNumeroIdentificacion.Caption := vIdPersona;
                      EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      EdClasificacion.Caption := FieldByName('DESCRIPCION_CLASIFICACION').AsString ;
                      EdLinea.Caption := FieldByName('DESCRIPCION_LINEA').AsString ;
                      EdInversion.Caption := FieldByName('DESCRIPCION_INVERSION').AsString ;
                      EdRespaldo.Caption := FieldByName('DESCRIPCION_RESPALDO').AsString;
                      EdGarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString ;
                      EdFechaColocacion.Caption := DateToStr(FieldByName('FECHA_DESEMBOLSO').AsFloat);
                      vDesembolso := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                      EdValorColocacion.Caption := FormatCurr('#,#0',vDesembolso);
                      EdSaldoColocacion.Caption := FormatCurr('#,#0',FieldByName('SALDO_ACTUAL').AsCurrency);
                      EdPlazo.Caption := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
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
                        TasaEfectiva := FieldByName('VALOR_ACTUAL_TASA').AsFloat; // + FieldByName('PUNTOS_INTERES').AsFloat;
                      end;
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
                      EdTasaMaxima.Caption := FormatCurr('#0.00%',BuscoTasaEfectivaMaxima(Date,IBQuery.FieldByName('ID_CLASIFICACION').AsInteger,'A'));
                      EdEnteAprobador.Caption := FieldByName('DESCRIPCION_ENTE_APROBADOR').AsString;
                      vNotaContable := FieldByName('NOTA_CONTABLE').AsString;
                      EdNotaContable.Caption := vNotaContable;
                      vCuentaAportes := FieldByName('NUMERO_CUENTA').AsInteger;
                      EdCuentaAportes.Caption := IntToStr(vCuentaAportes);
                      if FieldByName('INTERES').AsString = 'V' then
                      begin
                         EdTasaMaximaNominal.Caption := FormatCurr('#0.00%',(TasaNominalVencida(BuscoTasaEfectivaMaxima(Date,IBQuery.FieldByName('ID_CLASIFICACION').AsInteger,'A'),FieldByName('AMORTIZA_INTERES').AsInteger)+FieldByName('PUNTOS_INTERES').AsFloat) );
                         TasaAplicada := TasaNominalVencida(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat;
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end
                      else
                      begin
                         EdTasaMaximaNominal.Caption := FormatCurr('#0.00%',TasaNominalAnticipada(BuscoTasaEfectivaMaxima(Date,IBQuery.FieldByName('ID_CLASIFICACION').AsInteger,'A'),FieldByName('AMORTIZA_INTERES').AsInteger));
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
                      EdTotalCuotas.Caption := IntTostr(IBQuery1.FieldByName('CUOTAS').AsInteger);
                      IBQuery1.SQL.Clear;
                      IBQuery1.SQL.Add('select distinct ID_SOLICITUD from "col$desembolsoparcial"');
                      IBQuery1.SQL.Add('where ID_COLOCACION = :ID_COLOCACION');
                      IBQuery1.ParamByName('ID_COLOCACION').AsString := colocacion;
                      IBQuery1.Open;
                      vidSolicitud := IBQuery1.FieldByName('ID_SOLICITUD').AsString;
                      IBQuery1.SQL.Clear;
                      IBQuery1.SQL.Add('select S_VIDA from "col$solicitud" where ID_SOLICITUD = :ID');
                      IBQuery1.ParamByName('ID').AsString := vidSolicitud;
                      IBQuery1.Open;
                      seguro_vida := IntToBool(IBQuery1.FieldByName('S_VIDA').AsInteger);
                      CHcredivida.Checked := False;
                      if not (seguro_vida) then
                         CHcredivida.Enabled := False
                      else
                         CHcredivida.Enabled := True;
                      IBQuery1.Close;

                      IBQuery1.SQL.Clear;
                      IBQuery1.SQL.Add('select LINEA_BANCOLDEX, NO_BANCOLDEX from "col$infbancoldex" where id_colocacion = :id_colocacion');
                      IBQuery1.ParamByName('ID_COLOCACION').AsString := colocacion;
                      IBQuery1.Open;
                      if IBQuery1.RecordCount > 0 then
                       begin
                         Bancoldex := True;
                         LineaBancoldex := IBQuery1.FieldByName('LINEA_BANCOLDEX').AsString;
                         NoBancoldex := IBQuery1.FieldByName('NO_BANCOLDEX').AsString;
                       end;
                      IBQuery1.Close;
                end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                      EdNumeroColocacion.SetFocus;
                end;
        end;
// Verificar si se Visa o No
           with IBSQL1 do begin
              Close;
              SQL.Clear;
              SQL.Add('select * from "gen$minimos" where ID_MINIMO = 0');
              try
                ExecQuery;
                if RecordCount < 1 then begin
                   MessageDlg('Parametro de Salario Mínimo, no esta actualizado'+#13+
                              'Por Favor Consulte con Sistemas'+#13+
                              'Envie la Colocación a Visado',mtError,[mbOk],0);
//                   Transaction.Commit;
                   Exit;
                end;
                SalMinimo := FieldByName('VALOR_MINIMO').AsCurrency;
              except
                Transaction.Rollback;
                MessageDlg('Error al Consultar Salario Mínimo''Por Favor Consulte con Sistemas'+#13+
                              'Envie la Colocación a Visado',mtError,[mbOk],0);
                raise;
                Exit;
              end;

              Close;
              SQL.Clear;
              SQL.Add('select * from "gen$direccion"');
              SQL.Add('where ID_PERSONA = :ID_PERSONA and');
              SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and');
              SQL.Add('ID_DIRECCION = 1');
              ParamByName('ID_PERSONA').AsString := vIdPersona;
              ParamByName('ID_IDENTIFICACION').AsInteger := vIdIdentificacion;
              ExecQuery;
              v_telefono := FieldByName('TELEFONO1').AsString;
              vdireccion := FieldByName('DIRECCION').AsString;
              v_ciudad := FieldByName('MUNICIPIO').AsString;
              Close;
              SQL.Clear;
              SQL.Add('select * from "gen$minimos" where ID_MINIMO = 2');
              try
                ExecQuery;
                if RecordCount < 1 then begin
                   MessageDlg('Parametro de Veces Salarios Mínimos para No Visado, no esta actualizado'+#13+
                              'Por Favor Consulte con Sistemas'+#13+
                              'Envie la Colocación a Visado',mtError,[mbOk],0);
//                   Transaction.Commit;
                   Exit;
                end;
                VecesMinimo := FieldByName('VALOR_MINIMO').AsInteger;
              except
                Transaction.Rollback;
                MessageDlg('Error al Consultar Veces Salario Mínimo para No Visado''Por Favor Consulte con Sistemas'+#13+
                              'Envie la Colocación a Visado',mtError,[mbOk],0);
                raise;
                Exit;
              end;
              ///**************
              CDbeneficiarios.CancelUpdates;
             Close;
             SQL.Clear;
             SQL.Add('SELECT *');
             SQL.Add('FROM');
             SQL.Add(' "gen$beneficiario"');
             SQL.Add('WHERE');
             SQL.Add('("gen$beneficiario".ID_PERSONA = :ID_PERSONA) AND ');
             SQL.Add('("gen$beneficiario".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
             SQL.Add('("gen$beneficiario".AUXILIO = 0)');
             ParamByName('ID_PERSONA').AsString := vIdPersona;
             ParamByName('ID_IDENTIFICACION').AsInteger := vIdIdentificacion;
             ExecQuery;
             while not Eof do
             begin
                 CDbeneficiarios.Append;
                 CDbeneficiarios.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                 CDbeneficiarios.FieldValues['porciento'] := FieldByName('PORCENTAJE').AsCurrency;
                 CDbeneficiarios.FieldValues['parentesco'] := FieldByName('ID_PARENTESCO').AsString;
                 CDbeneficiarios.Post;
                 Next;
            end;
           ///**************

           end;

        SaldoControl := SalMinimo * VecesMinimo;
        if es_creditos = True then // evalua si el desembolso va a ser realizado por creditos
        begin
           //if SaldoControl > vDesembolso then begin
              CmdVisar.Enabled := True;
              CmdAnular.Enabled := True;
        //   end
        //   else
        //   begin
        //      CmdVisar.Enabled := False;
        //      CmdAnular.Enabled := False;
        //      MessageDlg('No tiene privilegios para visar esta colocación',mtError,[mbcancel],0);
         //     Exit;
        //   end;
        end;
end;

procedure TfrmVisarDesembolso.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,self);
end;

procedure TfrmVisarDesembolso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        dmColocacion.Free;
        dmSolicitud.Free;

        Action := caFree;
end;

procedure TfrmVisarDesembolso.FormShow(Sender: TObject);
begin
        Inicializar;

end;

procedure TfrmVisarDesembolso.Inicializar;
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
            EdEnteAprobador.Caption := '';
            EdNotaContable.Caption := '';
            EdTotalCuotas.Caption := '';
            colocacion := '';
            vcolocacion := '';
            vDesembolso := 0;
            vEstadoColocacion := 0;
            vCuentaAportes := 0;
            vIdIdentificacion := 0;
            vIdPersona := '';
            consecutivo := 0;
            consec := '';
            vNotaContable := '';
            DigitoC := '';
            vCodigoPucAportes := '';
            vCodigoPucAhorros := '';
            ValorAportes := 0;
            ValorAhorros := 0;
            ValorDescuentoAho := 0;
            Empleado1 := '';
            EsAnulado := 0;
            EsVigente := 0;
            Bancoldex := False;
            LineaBancoldex := '';
            if dmColocacion.IBDSagencias.Transaction.InTransaction then
               dmColocacion.IBDSagencias.Transaction.Rollback;
            dmColocacion.IBDSagencias.Transaction.StartTransaction;

            dmColocacion.IBDSagencias.Open;
            dmColocacion.IBDSagencias.Last;
            dmColocacion.IBDSagencias.First;
            EdAgencia.KeyValue := Agencia;
end;

procedure TfrmVisarDesembolso.CmdTablaLiqClick(Sender: TObject);
var frmTablaPagoColocacion:TfrmTablaPagoColocacion;
begin
        frmTablaPagoColocacion := TfrmTablaPagoColocacion.Create(Self);
        frmTablaPagoColocacion.TablaLiq := Colocacion;
        frmTablaPagoColocacion.Saldo := vDesembolso;
        frmTablaPagoColocacion.ShowModal;
end;

procedure TfrmVisarDesembolso.CmdGarantiasClick(Sender: TObject);
var frmConsultaGarantias:TfrmConsultaGarantias;
begin
        frmConsultaGarantias := TfrmConsultaGarantias.Create(Self);
        frmConsultaGarantias.Agencia := Agencia;
        frmConsultaGarantias.IdColocacion := Colocacion;
        frmConsultaGarantias.ShowModal;
end;

procedure TfrmVisarDesembolso.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmVisarDesembolso.CmdVisarClick(Sender: TObject);
var
ColocacionDes:string;
begin
        if MessageDlg('Seguro de Visar Esta Colocación?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
         CmdVisar.Enabled := False;
         CmdAnular.Enabled := False;
         Application.ProcessMessages;

         if AplicarDescuentos then
          begin
            //DescontarAhorros;
            CambiarEstadoColocacion;
            AbonarCuotas;// realiza los abonos de las cuotas de los créditos
            //Enabled := False;
            //VerificaCaptacion;
            //AbonaHonorarios;

            with IBSQL2 do begin
             Close;
             SQL.Clear;
             SQL.Add('select ID_COLOCACION,ID_AGENCIA from "col$infdesembolso"');
             SQL.Add('where ID_COLOCACION_DES = :ID_COLOCACION');
             ParamByName('ID_COLOCACION').AsString := colocacion;
             ExecQuery;
             while not IBSQL2.Eof do begin
               VerificarCancelacionCredito(IBSQL2.FieldByName('ID_AGENCIA').AsInteger,IBSQL2.FieldByName('ID_COLOCACION').AsString);
               Next;
             end;
             IBSQL2.Close;

             if Bancoldex then begin
               SQL.Clear;
               SQL.Add('update "col$creditosbancoldex" set SALDO = SALDO - :VALOR where linea = :linea and id_obligacion = :obligacion');
               ParamByName('VALOR').AsCurrency := vDesembolso;
               ParamByName('LINEA').AsString := LineaBancoldex;
               ParamByName('OBLIGACION').AsString := NoBancoldex;
               ExecQuery;
               Close;
             end;

            end;
            try
              elimina_temp;
            except
              MessageDlg('Error Borrando Datos Temporales',mtError,[mbok],0);
            end;
            try
              InfDesembolso;
            except
            end;
            if CHcredivida.Checked then
            begin
              try
               AutorizacionCredivida;
              except
               MessageDlg('No se Pudo Actualizar la Autorización del Credivida' + #13 +
               'Favor Informar a Sistemas',mtInformation,[mbok],0);
              end;
            end;

            dmColocacion.IBDScolocacion.Transaction.Commit;
            if dmGeneral.IBTransaction1.InTransaction then
               dmGeneral.IBTransaction1.Commit;
            dmGeneral.IBTransaction1.StartTransaction;

            try
              if seguro_vida then
                 equivida;
            except
            begin
               inicializar;
               MessageDlg('Error Cargando Datos del Credivida',mtConfirmation,[mbOK],0);
            end;
            end;
            if Ves_Credivida then
            begin
              if MessageDlg('Desea Recuperar Nuevamente el Reporte de Credivida?',mtInformation,[mbyes,mbno],0) = mryes then
              begin
                imprimir_reporte(frmMain.ruta1 + '\reporte\RepEquivida.frf');  
              end;

            end;
            Inicializar;
            MessageDlg('Colocacion Visada',mtConfirmation,[mbOK],0);
          end
         else
          begin
            dmColocacion.IBDScolocacion.Transaction.Rollback;
            MessageDlg('No Se Pudo Visar la Colocación' + #13 + #10 +
                       'Por Favor Verifique',mtError,[mbOK],0);
          end;
         end;
end;

function TfrmVisarDesembolso.AplicarDescuentos:Boolean;
var
TotalDebitos : Currency;
TotalCreditos : Currency;
begin
    with IBQuery do
     begin
       SQL.Clear;
       Sql.Add('select ');
       SQL.Add('SUM("col$concol".DEBITO) AS DEBITO1,');
       SQL.Add('SUM("col$concol".CREDITO) AS CREDITO1');
       SQL.Add('from "col$concol" Where ');
       SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
       SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION"');
       SQL.Add('GROUP BY ');
       SQL.Add('"col$concol".ID_AGENCIA,');
       SQL.Add('"col$concol".ID_COLOCACION');
       ParamByName('ID_AGENCIA').AsInteger := Agencia;
       ParamByName('ID_COLOCACION').AsString := Colocacion;
       Open;
       TotalDebitos := FieldByName('DEBITO1').AsCurrency;
       TotalCreditos := FieldByName('CREDITO1').AsCurrency;
       Close;
     end;

 With IBQuery1 do
  begin
    Sql.Clear;
    Sql.Add('select ');
    Sql.Add('"col$concol".ID_AGENCIA,');
    Sql.Add('"col$concol".ID_COLOCACION,');
    Sql.Add('"col$concol".CODIGO,');
    Sql.Add('"col$concol".DEBITO,');
    Sql.Add('"col$concol".CREDITO,');
    Sql.Add('"col$concol".FECHA_Y_HORA');
    SQL.Add('from "col$concol" Where ');
    SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
    SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION"');
    ParamByName('ID_AGENCIA').AsInteger := Agencia;
    ParamByName('ID_COLOCACION').AsString := Colocacion;
    Open;

    with IBAbonar do
     try
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
       ParamByName('ID_COMPROBANTE').AsString:= vNotaContable;
       ParamByname('FECHADIA').AsDate := IBQuery1.FieldByName('FECHA_Y_HORA').AsDateTime;
       ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
       ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
       ParamByName('DESCRIPCION').AsString := 'Desembolso de Crédito Numero' + colocacion + 'Cuenta Aportes No.' + IntToStr(vCuentaAportes);
       ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebitos;
       ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCreditos;
       ParamByName('ESTADO').AsString  := 'O';
       ParamByname('ANULACION').asstring := '';
       ParamByName('IMPRESO').AsInteger  := Ord(true);
       ParamByName('ID_EMPLEADO').AsString := Empleado1;

       ExecSQL;

       While not IBQuery1.Eof do
        begin
          SQL.Clear;
          SQL.Add('insert into "con$auxiliar" values (');
          SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
          SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
          SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
          ParamByName('ID_COMPROBANTE').AsString := vNotaContable;
          ParamByName('ID_AGENCIA').AsInteger:= IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
          ParamByName('FECHA').AsDate := IBQuery1.FieldByName('FECHA_Y_HORA').AsDateTime;
          ParamByName('CODIGO').AsString := IBQuery1.FieldByName('CODIGO').AsString;
          ParamByName('DEBITO').AsCurrency := IBQuery1.FieldByName('DEBITO').AsCurrency;
          ParamByName('CREDITO').AsCurrency := IBQuery1.FieldByName('CREDITO').AsCurrency;
          ParamByName('ID_CUENTA').AsInteger := vCuentaAportes;
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('ID_IDENTIFICACION').AsInteger := vIdIdentificacion;
          ParamByName('ID_PERSONA').AsString := vIdPersona;
          ParamByName('MONTO_RETENCION').AsCurrency := 0;
          ParamByName('TASA_RETENCION').AsFloat := 0;
          ParamByName('ESTADOAUX').AsString := 'O';
          ParamByName('TIPO_COMPROBANTE').AsInteger := 1;          
          ExecSQL;
          IBQuery1.Next;
        end;

     BuscarDatos;
     Result := True;
     except
     Result := False;
     raise;
     end;
  end;
end;

procedure TfrmVisarDesembolso.BuscarDatos;
var ValorHonorarios:Currency;
begin
        With IBQuery1 do
         begin
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" ');
           SQL.Add('where ID_CODIGOPUCBASICO = 8');
           Open;
           vCodigoPucAhorros := FieldByName('CODIGO').AsString;
           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" ');
           SQL.Add('where ID_CODIGOPUCBASICO = 3');
           Open;
           vCodigoPucAportes := FieldByName('CODIGO').AsString;
           Close;
           SQL.Clear;
           SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
           SQL.Add('where "col$estado".ES_ANULADO = 1');
           Open;
           EsAnulado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
           Close;
         end;

        with IBAhorros do
         begin
           SQL.Clear;
           SQL.Add('Select *');
           SQL.Add('from "col$concol"');
           SQL.Add('where ');
           SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$concol".CODIGO =:"CODIGO"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ParamByName('CODIGO').AsString := vCodigoPucAhorros;
           Open;
           while not Eof do
           begin
             ValorAhorros := ValorAhorros + FieldByName('CREDITO').AsCurrency;
             Next;
           end;
           Close;

           IBHonorarios.Close;
           IBHonorarios.SQL.Clear;
           IBHonorarios.SQL.Add('select sum(VALOR_HONORARIOS) as VALOR from "col$pagocostastmp" where ID_SOLICITUD = :ID_SOLICITUD');
           IBHonorarios.ParamByName('ID_SOLICITUD').AsString := vidSolicitud;
           IBHonorarios.ExecQuery;
           ValorHonorarios := IBHonorarios.FieldByName('VALOR').AsCurrency;
           IBHonorarios.Close;

           if ValorHonorarios > 0 then
             ValorAhorros := ValorAhorros - ValorHonorarios;
         end;

         with IBSQL1  do
         begin
           Close;
           SQL.Clear;
           SQL.Add('Select *');
           SQL.Add('from "col$concol"');
           SQL.Add('where ');
           SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$concol".CODIGO =:"CODIGO"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ParamByName('CODIGO').AsString := vCodigoPucAhorros;
           ExecQuery;
           while not Eof DO
           begin
              ValorDescuentoAho := ValorDescuentoAho + FieldByName('DEBITO').AsCurrency;
              Next;
           end;
           Close;
         end;
         
        with IBAportes do
         begin
           SQL.Clear;
           SQL.Add('Select CREDITO');
           SQL.Add('from "col$concol"');
           SQL.Add('where ');
           SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$concol".CODIGO =:"CODIGO"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ParamByName('CODIGO').AsString := vCodigoPucAportes;
           Open;
           while not IBAportes.Eof do
            begin
              ValorAportes := ValorAportes + FieldByName('CREDITO').AsCurrency;
              Next;
            end;
           Close;
         end;
end;

function TfrmVisarDesembolso.AbonarAportes:Boolean;
begin
    DigitoC := DigitoControl(1,formatcurr('0000000',vCuentaAportes));
    Result := True;
          with IBQuery1 do
           begin
             SQL.Clear;
             SQL.Add('insert into "cap$extracto" values(');
             SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
             SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
             SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
             SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
             ParamByName('NUMERO_CUENTA').AsInteger := vCuentaAportes;
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoC);
             ParamByName('FECHA_MOVIMIENTO').AsDateTime := Date;
             ParamByName('HORA_MOVIMIENTO').AsTime := Time;
             if ValorAportes > 0 then
               begin
                ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 11;
                ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vNotaContable;
                ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'CONSIGNACION POR DESEMBOLSO DE CREDITO ' + colocacion;
                ParamByName('VALOR_DEBITO').AsCurrency := ValorAportes;
                ParamByName('VALOR_CREDITO').AsCurrency := 0;
                try
                  Open;
                  if RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
                   Result := False;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
                  raise;
                  Result := False;
                  Exit;
                end; // del try
               end;
           end;
           Close;
end;


function TfrmVisarDesembolso.AbonarAhorros:Boolean;
begin
    DigitoC := DigitoControl(2,formatcurr('0000000',vCuentaAportes));
    Result := True;
          with IBQuery1 do
           begin
             SQL.Clear;
             SQL.Add('insert into "cap$extracto" values(');
             SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
             SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
             SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
             SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
             ParamByName('NUMERO_CUENTA').AsInteger := vCuentaAportes;
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoC);
             ParamByName('FECHA_MOVIMIENTO').AsDateTime := Date;
             ParamByName('HORA_MOVIMIENTO').AsTime := Time;
             if ValorAhorros > 0 then
               begin
                ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 29;
                ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vNotaContable;
                ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'CONSIGNACION POR DESEMBOLSO DE CREDITO ' + colocacion;
                ParamByName('VALOR_DEBITO').AsCurrency := ValorAhorros;
                ParamByName('VALOR_CREDITO').AsCurrency := 0;
                try
                  Open;
                  if RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
                   Result := False;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
                  raise;
                  Result := False;
                  Exit;
                end; // del try
               end;
           end;
           Close;
end;

procedure TfrmVisarDesembolso.CambiarEstadoColocacion;
var    es_parcial :Boolean;
       v_desembolso :Currency;
       v_parcial :Currency;
begin
        v_parcial :=0;
        v_desembolso := 0;
        with IBQuery1 do
         begin
           SQL.Clear;
           SQL.Add('update "col$colocacion"');
           SQL.Add('set ID_ESTADO_COLOCACION = 0');
           SQL.Add('where');
           SQL.Add('ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('ID_COLOCACION =:"ID_COLOCACION"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := colocacion;
           Open;
           Close;
           SQL.Clear;
           SQL.Add('select ES_DESEMBOLSO_PARCIAL,VALOR_APROBADO from "col$solicitud"');
           SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
           ParamByName('ID_SOLICITUD').AsString := vidSolicitud;
           Open;
           es_parcial := IntToBool(FieldByName('ES_DESEMBOLSO_PARCIAL').AsInteger);
           v_desembolso := FieldByName('VALOR_APROBADO').AsCurrency;
           if es_parcial = False then
           begin
             SQL.Clear;
             SQL.Add('update "col$solicitud" set ');
             SQL.Add('ESTADO = 6');
             SQL.Add('WHERE ID_SOLICITUD = :ID_SOLICITUD');
             ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
             Open;
           end
           else
           begin
             SQL.Clear;
             SQL.Add('select sum(VALOR_DESEMBOLSO) AS VALOR from "col$desembolsoparcial"');
             SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
             ParamByName('ID_SOLICITUD').AsString :=vidSolicitud;
             Open;
             v_parcial := FieldByName('VALOR').AsCurrency;
             if v_parcial < v_Desembolso then
             begin
               SQL.Clear;
               SQL.Add('update "col$solicitud" set ');
               SQL.Add('ESTADO = 12');
               SQL.Add('WHERE ID_SOLICITUD = :ID_SOLICITUD');
               ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
               Open;
             end
             else
             begin
               SQL.Clear;
               SQL.Add('update "col$solicitud" set ');
               SQL.Add('ESTADO = 6');
               SQL.Add('WHERE ID_SOLICITUD = :ID_SOLICITUD');
               ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
               Open;
             end;
           end;
           SQL.Clear;
           SQL.Add('update "col$desembolsoparcial" set');
           SQL.Add('DESEMBOLSADO = 1');
           SQL.Add('where ID_COLOCACION = :ID_COLOCACION');
           ParamByName('ID_COLOCACION').AsString := colocacion;
           Open;
         end;
end;

procedure TfrmVisarDesembolso.CmdAnularClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Reversar Esta Colocación?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            AplicarDescuentos;
            ReversarColocacion;
            elimina_temp;
            try
              InfDesembolso;
            except
            end;
            dmColocacion.IBDScolocacion.Transaction.Commit;
            if dmGeneral.IBTransaction1.InTransaction then
               dmGeneral.IBTransaction1.Commit;
            MessageDlg('Colocacion Reversada',mtConfirmation,[mbOK],0);
            Inicializar;
          end
         else
          begin
            dmColocacion.IBDScolocacion.Transaction.Rollback;
            MessageDlg('No Se Pudo Reversar la Colocación' + #13 + #10 +
                       'Por Favor Verifique',mtError,[mbOK],0);
          end;
end;

procedure TfrmVisarDesembolso.ReversarColocacion;
var Descripcion:string;
begin
        with IBQuery do
         begin
           SQL.Clear;
           SQL.Add('update "col$colocacion" set ID_ESTADO_COLOCACION = :"ID_ESTADO_COLOCACION"');
           SQL.Add('where ');
           SQL.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COLOCACION').AsString := Colocacion;
           ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsAnulado;
           ExecSQL;
           Close;
           SQL.Clear;
           SQL.Add('update "con$comprobante" set ESTADO = :"ESTADO", ANULACION =:"ANULACION"');
           SQL.Add('where ');
           SQL.Add('"con$comprobante".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"con$comprobante".ID_COMPROBANTE =:"ID_COMPROBANTE"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COMPROBANTE').AsInteger := StrToInt(vNotaContable);
           ParamByName('ESTADO').AsString := 'N';
           while Descripcion = '' do
           begin
             Descripcion := InputBox('Reversión Desembolso','Concepto por el Cual se Reversa','');
           end;
           ParamByName('ANULACION').AsString := Descripcion;
           ExecSQL;
           Close;

           SQL.Clear;
           SQL.Add('update "con$auxiliar" set ESTADOAUX = :"ESTADOAUX"');
           SQL.Add('where ');
           SQL.Add('"con$auxiliar".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"con$auxiliar".ID_COMPROBANTE =:"ID_COMPROBANTE"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COMPROBANTE').AsInteger := StrToInt(vNotaContable);
           ParamByName('ESTADOAUX').AsString := 'N';
           ExecSQL;
           Close;

           SQL.Clear;
           SQL.Add('delete from "col$tablaliquidacion"');
           SQL.Add('where ');
           SQL.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COLOCACION').AsString := Colocacion;
           ExecSQL;
           Close;

           SQL.Clear;
           SQL.Add('delete from "col$extracto"');
           SQL.Add('where ');
           SQL.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COLOCACION').AsString := Colocacion;
           ExecSQL;
           Close;

           SQL.Clear;
           SQL.Add('delete from "col$colgarantias"');
           SQL.Add('where ');
           SQL.Add('"col$colgarantias".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$colgarantias".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COLOCACION').AsString := Colocacion;
           ExecSQL;
           Close;
           // Eliminar y validar movimiento de la garantia
           SQL.Clear;
           SQL.Add('delete from "col$garantiacol"');
           SQL.Add('where ');
           SQL.Add('"col$garantiacol".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$garantiacol".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COLOCACION').AsString := colocacion;
           ExecSQL;
           Close;
           //Eliminar el registro de seguros de vida equivida
           SQL.Clear;
           SQL.Add('delete from "col$relacionseguro"');
           SQL.Add('where ID_COLOCACION = :ID_COLOCACION and');
           SQL.Add('ID_AGENCIA = :ID_AGENCIA');
           ParamByName('ID_COLOCACION').AsString := colocacion;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ExecSQL;
           Close;
           SQL.Clear;
           SQL.Add('update "col$desembolsoparcial" set DESEMBOLSADO = 0');
           SQL.Add('where ID_COLOCACION = :ID_COLOCACION');
           SQL.Add('and ID_AGENCIA = :ID_AGENCIA');
           ParamByName('ID_COLOCACION').AsString := colocacion;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ExecSQL;
           Close;
           SQL.Clear;
           SQL.Add('update "col$solicitud" set ESTADO = 11');
           SQL.Add('WHERE ID_SOLICITUD = :ID_SOLICITUD');
           SQL.Add('and OFICINA = :ID_AGENCIA');
           ParamByName('ID_SOLICITUD').AsString := vidSolicitud;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ExecSQL;
           //SQL.
           Close;
         end;
         //FrmDesembolso := TFrmDesembolso.Create(self);
end;

function TfrmVisarDesembolso.DescontarAhorros: boolean;
begin
    DigitoC := DigitoControl(2,formatcurr('0000000',vCuentaAportes));
          with IBQuery1 do
           begin
             SQL.Clear;
             SQL.Add('insert into "cap$extracto" values(');
             SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
             SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
             SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
             SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
             ParamByName('NUMERO_CUENTA').AsInteger := vCuentaAportes;
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoC);
             ParamByName('FECHA_MOVIMIENTO').AsDateTime := Date;
             ParamByName('HORA_MOVIMIENTO').AsTime := Time;
             if ValorDescuentoAho > 0 then
               begin
                ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 17;
                ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vNotaContable;
                ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'DESCUENTO LIQUI. DE CUOTAS ' + colocacion;
                ParamByName('VALOR_DEBITO').AsCurrency := 0;
                ParamByName('VALOR_CREDITO').AsCurrency := ValorDescuentoAho;
                try
                  Open;
                  if RowsAffected < 1 then
                  begin
                   MessageDlg('Error Realizando Descuentos',mtError,[mbok],0);
                   Result := False;
                   Exit;
                  end
                except
                  MessageDlg('Error Realizando Descuentos',mtError,[mbok],0);
                  raise;
                  Result := False;
                  Exit;
                end; // del try
               end;
           end;
           Close;
end;

procedure TfrmVisarDesembolso.AbonarCuotas;
var Honorarios:Currency;
begin
        Honorarios := 0;
        if DmSolicitud.IBSolicitud1.Transaction.InTransaction then
           DmSolicitud.IBSolicitud1.Transaction.Commit;
        DmSolicitud.IBSolicitud1.Transaction.StartTransaction;
      try
        with DmSolicitud.IBSQL2 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
{          Close;
          SQL.Clear;
          SQL.Add('select * from "col$pagocostastmp" where ID_COLOCACION_DES = :ID_COLOCACION');
          SQL.Add('and ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ExecQuery;
          if RecordCount > 0 then
            with DmSolicitud.IBSolicitud1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('insert into "col$costas" values (:ID_AGENCIA,:ID_COLOCACION,');
              SQL.Add(':FECHA,:ID_CBTE_COLOCACION,:VALOR_COSTAS,:VALOR_HONORARIOS,:VALOR_OTROS,:DESCRIPCION)');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := Colocacion;
              ParamByName('FECHA').AsDate := DmSolicitud.IBSQL2.FieldByName('FECHA').AsDate;
              ParamByName('ID_CBTE_COLOCACION').AsInteger := DmSolicitud.IBSQL2.FieldByName('ID_CBTE_COLOCACION').AsInteger;
              ParamByName('VALOR_COSTAS').AsCurrency := -DmSolicitud.IBSQL2.FieldByName('VALOR_COSTAS').AsCurrency;
              ParamByName('VALOR_HONORARIOS').AsCurrency := -DmSolicitud.IBSQL2.FieldByName('VALOR_HONORARIOS').AsCurrency;
              ParamByName('VALOR_OTROS').AsCurrency := 0;
              ParamByName('DESCRIPCION').AsString := 'VALOR COSTAS Y HONORARIOS RECIBIDOS EN LA FECHA';
              ExecSQL;
            end;      }
//          end;

          Close;
          SQL.Clear;
          SQL.Add('select * from "col$extractotmp" where ID_COLOCACION_DES = :ID_COLOCACION');
          SQL.Add('and ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ExecQuery;
          while not Eof do
          begin
            with DmSolicitud.IBsolicitud1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('insert into "col$extracto" (');
              SQL.Add('"col$extracto"."ID_AGENCIA", "col$extracto"."ID_CBTE_COLOCACION",');
              SQL.Add('"col$extracto"."ID_COLOCACION", "col$extracto"."FECHA_EXTRACTO",');
              SQL.Add('"col$extracto"."HORA_EXTRACTO", "col$extracto"."CUOTA_EXTRACTO",');
              SQL.Add('"col$extracto"."TIPO_OPERACION", "col$extracto"."SALDO_ANTERIOR_EXTRACTO",');
              SQL.Add('"col$extracto"."ABONO_CAPITAL", "col$extracto"."ABONO_CXC",');
              SQL.Add('"col$extracto"."ABONO_SERVICIOS", "col$extracto"."ABONO_ANTICIPADO",');
              SQL.Add('"col$extracto"."ABONO_MORA", "col$extracto"."ABONO_SEGURO",');
              SQL.Add('"col$extracto"."ABONO_PAGXCLI", "col$extracto"."ABONO_HONORARIOS",');
              SQL.Add('"col$extracto"."ABONO_OTROS", "col$extracto"."TASA_INTERES_LIQUIDACION",');
              SQL.Add('"col$extracto"."ID_EMPLEADO",');
              SQL.Add('"col$extracto"."INTERES_PAGO_HASTA",');
              SQL.Add('"col$extracto"."CAPITAL_PAGO_HASTA",');
              SQL.Add('"col$extracto"."TIPO_ABONO")');
              SQL.Add(' Values (');
              SQL.Add(':"ID_AGENCIA", :"ID_CBTE_COLOCACION", :"ID_COLOCACION",');
              SQL.Add(':"FECHA_EXTRACTO", :"HORA_EXTRACTO", :"CUOTA_EXTRACTO",');
              SQL.Add(':"TIPO_OPERACION", :"SALDO_ANTERIOR_EXTRACTO", :"ABONO_CAPITAL",');
              SQL.Add(':"ABONO_CXC", :"ABONO_SERVICIOS", :"ABONO_ANTICIPADO", :"ABONO_MORA",');
              SQL.Add(':"ABONO_SEGURO", :"ABONO_PAGXCLI", :"ABONO_HONORARIOS",');
              SQL.Add(':"ABONO_OTROS", :"TASA_INTERES_LIQUIDACION", :"ID_EMPLEADO",');
              SQL.Add(':"INTERES_PAGO_HASTA", :"CAPITAL_PAGO_HASTA", :"TIPO_ABONO")');
              ParamByName('ID_AGENCIA').AsInteger := DmSolicitud.IBSQL2.FieldByName('ID_AGENCIA').AsInteger;
              ParamByName('ID_CBTE_COLOCACION').AsInteger := DmSolicitud.IBSQL2.FieldByName('ID_CBTE_COLOCACION').AsInteger;
              ParamByName('ID_COLOCACION').AsString := DmSolicitud.IBSQL2.FieldByName('ID_COLOCACION').AsString;
              ParamByName('FECHA_EXTRACTO').AsDate := DmSolicitud.IBSQL2.FieldByName('FECHA_EXTRACTO').AsDateTime;
              ParamByName('HORA_EXTRACTO').AsDateTime := DmSolicitud.IBSQL2.FieldByName('HORA_EXTRACTO').AsTime;
              ParamByName('CUOTA_EXTRACTO').AsInteger := DmSolicitud.IBSQL2.FieldByName('CUOTA_EXTRACTO').AsInteger;
              ParamByName('TIPO_OPERACION').AsInteger := DmSolicitud.IBSQL2.FieldByName('TIPO_OPERACION').AsInteger;
              ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := DmSolicitud.IBSQL2.FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency;
              ParamByName('ABONO_CAPITAL').AsCurrency := DmSolicitud.IBSQL2.FieldByName('ABONO_CAPITAL').AsCurrency;
              ParamByName('ABONO_CXC').AsCurrency := DmSolicitud.IBSQL2.FieldByName('ABONO_CXC').AsCurrency;
              ParamByName('ABONO_SERVICIOS').AsCurrency := DmSolicitud.IBSQL2.FieldByName('ABONO_SERVICIOS').AsCurrency;
              ParamByName('ABONO_ANTICIPADO').AsCurrency := DmSolicitud.IBSQL2.FieldByName('ABONO_ANTICIPADO').AsCurrency;
              ParamByName('ABONO_MORA').AsCurrency := DmSolicitud.IBSQL2.FieldByName('ABONO_MORA').AsCurrency;
              ParamByName('ABONO_SEGURO').AsCurrency := DmSolicitud.IBSQL2.FieldByName('ABONO_SEGURO').AsCurrency;
              ParamByName('ABONO_PAGXCLI').AsCurrency := DmSolicitud.IBSQL2.FieldByName('ABONO_PAGXCLI').AsCurrency;
              ParamByName('ABONO_HONORARIOS').AsCurrency := DmSolicitud.IBSQL2.FieldByName('ABONO_HONORARIOS').AsCurrency;
              ParamByName('ABONO_OTROS').AsCurrency := DmSolicitud.IBSQL2.FieldByName('ABONO_OTROS').AsCurrency;
              ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := DmSolicitud.IBSQL2.FieldByName('TASA_INTERES_LIQUIDACION').AsFloat;
              ParamByName('ID_EMPLEADO').AsString := DmSolicitud.IBSQL2.FieldByName('ID_EMPLEADO').AsString;
              ParamByName('INTERES_PAGO_HASTA').AsDate := DmSolicitud.IBSQL2.FieldByName('INTERES_PAGO_HASTA').AsDate;
              ParamByName('CAPITAL_PAGO_HASTA').AsDate := DmSolicitud.IBSQL2.FieldByName('CAPITAL_PAGO_HASTA').AsDate;
              ParamByName('TIPO_ABONO').AsInteger := DmSolicitud.IBSQL2.FieldByName('TIPO_ABONO').AsInteger;
              Open;
            end;// Fin actualiza la tabla col$extrato
            Next;
          end;//fin del while recorre extractotmp
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$extractodettmp"');
          SQL.Add('where ID_COLOCACION_DES = :ID_COLOCACION');
          SQL.Add('and ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ExecQuery;
          while not Eof do
          begin
            with DmSolicitud.IBSolicitud1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('insert into "col$extractodet" values (');
              SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
              SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
              SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
              ParamByName('ID_AGENCIA').AsInteger := DmSolicitud.IBSQL2.FieldByName('ID_AGENCIA').AsInteger;
              ParamByName('ID_CBTE_COLOCACION').AsInteger:= DmSolicitud.IBSQL2.FieldByName('ID_CBTE_COLOCACION').AsInteger;
              ParamByName('ID_COLOCACION').AsString := DmSolicitud.IBSQL2.FieldByName('ID_COLOCACION').AsString;
              ParamByName('FECHA_EXTRACTO').AsDate := DmSolicitud.IBSQL2.FieldByName('FECHA_EXTRACTO').AsDate;
              ParamByName('HORA_EXTRACTO').AsDateTime := DmSolicitud.IBSQL2.FieldByName('HORA_EXTRACTO').AsTime;
              ParamByName('CODIGO_PUC').AsString := DmSolicitud.IBSQL2.FieldByName('CODIGO_PUC').AsString;
              ParamByName('FECHA_INICIAL').AsDate := DmSolicitud.IBSQL2.FieldByName('FECHA_INICIAL').AsDate;
              ParamByName('FECHA_FINAL').AsDate := DmSolicitud.IBSQL2.FieldByName('FECHA_FINAL').AsDate;
              ParamByName('DIAS_APLICADOS').AsInteger := DmSolicitud.IBSQL2.FieldByName('DIAS_APLICADOS').AsInteger;
              ParamByName('TASA_LIQUIDACION').AsFloat := DmSolicitud.IBSQL2.FieldByName('TASA_LIQUIDACION').AsFloat;
              ParamByName('VALOR_DEBITO').AsCurrency := DmSolicitud.IBSQL2.FieldByName('VALOR_DEBITO').AsCurrency;
              ParamByName('VALOR_CREDITO').AsCurrency := DmSolicitud.IBSQL2.FieldByName('VALOR_CREDITO').AsCurrency;
              ExecSQL;
            end;
            Next;
          end; // fin del while recorre extractodettmp
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$infdesembolso" where');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('ID_COLOCACION_DES = :ID_COLOCACION');
          SQL.Add('and ES_COLOCACION = 0');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ExecQuery;
          while not Eof do
          begin
            with DmSolicitud.IBSolicitud1 do
            begin
              SQL.Clear;
              if not(IntToBool(DmSolicitud.IBSQL2.FieldByName('ES_LIQUIDATOTAL').AsInteger)) then
              begin
                SQL.Add('update "col$tablaliquidacion" set');
                SQL.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
                SQL.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
                SQL.Add('where');
                SQL.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                SQL.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
                SQL.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
                ParamByName('ID_AGENCIA').AsInteger := DmSolicitud.IBSQL2.FieldByName('ID_AGENCIA').AsInteger;
                ParamByName('ID_COLOCACION').AsString := DmSolicitud.IBSQL2.FieldByName('ID_COLOCACION').AsString;
                ParamByName('CUOTA_NUMERO').AsInteger := DmSolicitud.IBSQL2.FieldByName('CUOTA_NUMERO').AsInteger;
                ParamByName('PAGADA').AsInteger := 1;
                ParamByName('FECHA_PAGADA').AsDate := DmSolicitud.IBSQL2.FieldByName('FECHA_LIQUIDACION').AsDate;
              end
              else
              begin
                SQL.Add('update "col$tablaliquidacion" set');
                SQL.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
                SQL.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
                SQL.Add('where');
                SQL.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                SQL.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
                SQL.Add('"col$tablaliquidacion"."PAGADA" = 0');
                ParamByName('ID_AGENCIA').AsInteger := DmSolicitud.IBSQL2.FieldByName('ID_AGENCIA').AsInteger;
                ParamByName('ID_COLOCACION').AsString := DmSolicitud.IBSQL2.FieldByName('ID_COLOCACION').AsString;
                ParamByName('PAGADA').AsInteger := 1;
                ParamByName('FECHA_PAGADA').AsDate := DmSolicitud.IBSQL2.FieldByName('FECHA_LIQUIDACION').AsDate;
              end;
                ExecSQL;
                Close;
            end;
            Next;
          end; // Fin de la actualizacion de la tabla col$tablaliquidacion
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$infdesembolso" where');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('ID_COLOCACION_DES = :ID_COLOCACION');
          SQL.Add('and ES_COLOCACION = 1');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ExecQuery;
          while not Eof do
          begin
            with DmSolicitud.IBSolicitud1 do
            begin
               SQL.Clear;
               SQL.Add('update "col$colocacion" set ');
               SQL.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
               SQL.Add('"col$colocacion"."FECHA_CAPITAL" =:"FECHA_CAPITAL",');
               SQL.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
               SQL.Add(' where ');
               SQL.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
               SQL.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
               ParamByName('ID_AGENCIA').AsInteger := DmSolicitud.IBSQL2.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := DmSolicitud.IBSQL2.FieldByName('ID_COLOCACION').AsString;
               ParamByName('ABONOS_CAPITAL').AsCurrency := DmSolicitud.IBSQL2.FieldByName('CAPITAL').AsCurrency;
               ParamByName('FECHA_CAPITAL').AsDate := DmSolicitud.IBSQL2.FieldByName('CAPITAL_HASTA').AsDate;
               ParamByName('FECHA_INTERES').AsDate := DmSolicitud.IBSQL2.FieldByName('INTERES_HASTA').AsDate;
               Open;
               Close;
            end;
            Next;
          end;
        end;  // fin del DmSolicitud.IBSQL2
        DmSolicitud.IBSolicitud1.Transaction.Commit;
      except
        DmSolicitud.IBSolicitud1.Transaction.Rollback;
      end;
end;

procedure TfrmVisarDesembolso.SpeedButton1Click(Sender: TObject);
var     FileName :string;
begin
//FileName := 'c:\xml\'+vIdPersona +'.xml';
        AutorizacionCredivida;
        //imprimir_reporte(frmMain.ruta1 + '\reporte\RepEquivida.frf');
end;

procedure TfrmVisarDesembolso.elimina_temp;
begin
          with IBQuery do
          begin
            Close;
            SQL.Clear;
            SQL.Add('delete from "col$extractotmp" where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ExecSQL;
            SQL.Clear;
            SQL.Add('delete from "col$extractodettmp" where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ExecSQL;
            SQL.Clear;
            SQL.Add('delete from "col$infdesembolso" where ID_SOLICITUD = :ID_SOLICITUD');
            SQL.Add('and ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ExecSQL;
            SQL.Clear;
            SQL.Add('delete from "col$concol"');
            SQL.Add('where ID_COLOCACION = :ID_COLOCACION and');
            SQL.Add('ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ExecSQL;
            SQL.Clear;
            SQL.Add('delete from "col$pagocostastmp"');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
            SQL.Add('ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_SOLICITUD').AsString := vidSolicitud;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ExecSQL;
            {SQL.Clear;
            SQL.Add('delete from "col$marcas"');
            SQL.Add('where ID_COLOCACION = :ID_COLOCACION and');
            SQL.Add('ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            Open;
            Close;}
          end;

end;

procedure TfrmVisarDesembolso.Verifica_credito;
var     saldo :Currency;
        estado, essaldado :Integer;
        colocacion_total :string;
begin
        essaldado := 7;
     try
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          IF Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select distinct ID_COLOCACION,ID_AGENCIA from "col$infdesembolso"');
          SQL.Add('where ID_COLOCACION_DES = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := colocacion;
          Open;
          while not Eof do
          begin
            colocacion_total  := FieldByName('ID_COLOCACION').AsString;
            with DmSolicitud.IBsolicitud2 do
            begin
              Close;
              if Transaction.InTransaction then
                 Transaction.Commit;
              Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('Select ');
            SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL as SALDO, ');
            SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION');
            SQL.Add('from "col$colocacion" ');
            SQL.Add('where ');
            SQL.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            SQL.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            Parambyname('ID_COLOCACION').AsString := colocacion_total;
            Open;
            saldo := FieldByName('SALDO').AsCurrency;
            Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
            if (Saldo = 0) and (Estado = 0) then
            begin
              SQL.Clear;
              sql.Add('update "col$colocacion" set ');
              sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');
              sql.Add(' where ');
              sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
              sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
              ParamByName('ID_AGENCIA').AsInteger := agencia;
              ParamByName('ID_COLOCACION').AsString := colocacion_total;
              ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsSaldado;
              Open;
              Close;
            end;// FIN DEL IF
              Transaction.Commit;
           end;// FIN DEL WITH
            Next;
          end;// FIN DEL WHILE
          Transaction.Commit;
        end;// FIN DEL WITH PRINCIPAL
     except
        DmSolicitud.IBSolicitud1.Transaction.Rollback;
     end;
end;

procedure TfrmVisarDesembolso.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
          if ParName = 'poliza' then
             ParValue := vPolizaCredivida;
          if ParName = 'nombre' then
             ParValue := EdNombre.Caption;
          if ParName = 'certificado' then
             ParValue := v_certificado;
          if ParName = 'documento' then
             ParValue := vIdPersona;
          if ParName = 'lugar_exp' then
             ParValue := vlugar_expedicion;
          if ParName = 'nacimiento' then
             ParValue := vlugar_nacimiento;
          if ParName = 'fecha_nacimiento' then
             ParValue := vfecha_nacimiento;
          if ParName = 'empresa' then
             ParValue := v_empresa;
          if ParName = 'cargo' then
             ParValue := v_cargo;
          if ParName = 'direccion' then
             ParValue := vdireccion;
          if ParName = 'ciudad' then
             ParValue := v_ciudad;
          if ParName = 'telefono' then
             ParValue := v_telefono;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos"');
          SQL.Add('where ID_MINIMO = 9');
          ExecQuery;
          if ParName = 'valor_poliza' then
             ParValue := FieldByName('VALOR_MINIMO').AsCurrency;
          if ParName = 'poliza_total' then
             ParValue := FieldByName('VALOR_MINIMO').AsCurrency * 12;
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$agencia"');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
          ExecQuery;
          if ParName = 'ciudad_exp' then
             ParValue := FieldByName('DESCRIPCION_AGENCIA').AsString;
          Close;
          SQL.Clear;
          SQL.Add('');
          if ParName = 'mes' then
             ParValue := UpperCase(FormatDateTime('mmmm',Date));
        end;
         with CDbeneficiarios do
          begin
            First;
            if RecordCount = 0 then
            begin
               if ParName = 'nom1' then
               ParValue := 'LOS DE LEY';
               if ParName = 'por1' then
                 ParValue := 100;
            end;
           while not Eof do
           begin
            //primero
            if RecNo = 1 then
            begin
               if ParName = 'nom1' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por1' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            //segundo
            if RecNo = 2 then
            begin
               if ParName = 'nom2' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por2' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            //tercero
            if RecNo = 3 then
            begin
               if ParName = 'nom3' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por3' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            //cuarto
            if RecNo = 4 then
            begin
               if ParName = 'nom4' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por4' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            Next;
            end;
          end;
        
end;

procedure TfrmVisarDesembolso.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        //frCompositeReport1.DoublePass := True;
        //frCompositeReport1.Reports.Clear;
        //frCompositeReport1.Reports.Add(frReport1);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TfrmVisarDesembolso.equivida;
var     AStream :TStringStream;
        cadena :string;
        tamano :Integer;
        XmlDoc, Rdoc :TsdXmlDocument;
        Nodo: TXmlNode;
        respuesta :string;
begin
        BuscaPoliza;
        v_certificado := con_equivida;
        {XmlDoc := TsdXmlDocument.CreateName('equivida');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Nodo := XmlDoc.Root.NodeNew('registro');
        with Nodo do
        begin
          WriteString('cedula',vIdPersona);
          WriteString('nombre',EdNombre.Caption);
          WriteString('direccion',vdireccion);
          WriteString('telefono',v_telefono);
          WriteString('consecutivo',v_certificado);
          WriteString('ciudad',v_ciudad);
          WriteString('ciudad_nacimiento',vlugar_nacimiento);
          WriteString('fecha_nacimiento',vfecha_nacimiento);
          with CDbeneficiarios do
          begin
            First;
            if RecordCount = 0 then
            begin
               WriteString('nom1','LOS DE LEY');
               WriteInteger('por1',100);
               WriteInteger('par1',0);
            end;
           while not Eof do
           begin
            //primero
            if RecNo = 1 then
            begin
              WriteString('nom1',FieldByName('Nombre').AsString);
              WriteInteger('por1',FieldByName('porciento').AsInteger);
              WriteInteger('par1',FieldByName('parentesco').AsInteger);
            end;
            //segundo
            if RecNo = 2 then
            begin
              WriteString('nom2',FieldByName('Nombre').AsString);
              WriteInteger('por2',FieldByName('porciento').AsInteger);
              WriteInteger('par2',FieldByName('parentesco').AsInteger);
            end;
            //tercero
            if RecNo = 3 then
            begin
              WriteString('nom3',FieldByName('Nombre').AsString);
              WriteInteger('por3',FieldByName('porciento').AsInteger);
              WriteInteger('par3',FieldByName('parentesco').AsInteger);
            end;
            //cuarto
            if RecNo = 4 then
            begin
              WriteString('nom4',FieldByName('Nombre').AsString);
              WriteInteger('por4',FieldByName('porciento').AsInteger);
              WriteInteger('par4',FieldByName('parentesco').AsInteger);
            end;
            Next;
            end;
          end;
        end;
          AStream := TStringStream.Create('');
          //XmlDoc.SaveToFile('c:\xml\'+ vIdPersona +'.xml');
          XmlDoc.SaveToStream(AStream);
        with IdTCPClient1 do
        begin
          Host := host_equivida;
          Port := 4001;
          Connect;
          if Connected then
          begin
            WriteInteger(AStream.Size);
            OpenWriteBuffer;
            WriteStream(AStream);
            CloseWriteBuffer;
            FreeAndNil(AStream);
            tamano := ReadInteger;
//            Application.ProcessMessages;
            AStream := TStringStream.Create('');
            ReadStream(AStream,tamano,False);
            RDoc := TsdXmlDocument.Create;
            RDoc.LoadFromStream(AStream);
            respuesta := Rdoc.Root.ReadString('respuesta');}
            //** CAMBIAR FORMA DE REGISTRAR EQUIVIDA
         with IBEquivida do
         begin
           Close;
           if Transaction.InTransaction then
             Transaction.Commit;
            Transaction.StartTransaction;
            SQL.Clear;
              try
                SQl.Add('INSERT INTO "col$datocredivida" VALUES (:ID_PERSONA,:CERTIFICADO,:FECHA,:FECHACAPTURA)');
                ParamByname('ID_PERSONA').AsString := vIdPersona;
                ParamByName('CERTIFICADO').AsString := v_Certificado;
                ParamByname('FECHA').AsDate := fFechaActual + 365;
                ParamByName('FECHACAPTURA').AsDate := fFechaActual;
                ExecQuery;
                Transaction.Commit;
                imprimir_reporte(frmMain.ruta1 + '\reporte\RepEquivida.frf');
                Ves_Credivida := True;
              except
              begin
                 MessageDlg('Favor Verifique la Poliza No. '+ v_certificado + ' En Sistemas',mtInformation,[mbok],0);
                 Ves_Credivida := False;
              end;
            end;
           end;
end;

function TfrmVisarDesembolso.con_equivida: string;
var    consecutivo :Integer;
begin
        with IBEquivida do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select CONSECUTIVO as CONSECUTIVO from');
          SQL.Add('"gen$con_seguro"');
          ExecQuery;
          consecutivo := FieldByName('CONSECUTIVO').AsInteger + 1;
          Close;
          SQL.Clear;
          SQL.Add('update "gen$con_seguro" set CONSECUTIVO = :CONSECUTIVO WHERE ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('CONSECUTIVO').AsInteger := consecutivo;
          ExecQuery;
          Close;
          Transaction.Commit;
        end;
        Result := IntToStr(Agencia)+FormatCurr('000000',consecutivo);
end;

procedure TfrmVisarDesembolso.VerificaCaptacion;
var
ColocacionJud:string;
begin

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$infcrediticia".ID_COLOCACION');
          SQL.Add('FROM');
          SQL.Add('"gen$infcrediticia"');
          SQL.Add('WHERE');
          SQL.Add('("gen$infcrediticia".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("gen$infcrediticia".ID_COLOCACION IS NOT NULL) AND');
          SQL.Add('"gen$infcrediticia".ES_DESCUENTO = 1 AND');
          SQL.Add('"gen$infcrediticia".ESTADO in (2,3)');
          ParamByName('ID_SOLICITUD').AsString := vidSolicitud;
          ExecQuery;
          ColocacionJud := FieldByName('ID_COLOCACION').AsString;
          Close;
          
          if ColocacionJud <> '' then begin
            SQL.Clear;
            SQL.Add('insert into "cap$obsestado" values (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
            SQL.Add(':FECHA,:HORA,:ID_ESTADO_ANTERIOR,:ID_ESTADO_ACTUAL,:OBSERVACION,:ID_EMPLEADO)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
            ParamByName('NUMERO_CUENTA').AsInteger := vCuentaAportes;
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(1,formatcurr('0000000',vCuentaAportes)));
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('HORA').AsTime := fFechaHoraActual;
            ParamByName('ID_ESTADO_ANTERIOR').AsInteger := 10;
            ParamByName('ID_ESTADO_ACTUAL').AsInteger := 1;
            ParamByName('OBSERVACION').AsString := 'REFINANCIACION DE COLOCACION No.' + ColocacionJud;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            try
              ExecQuery;
            except
              MessageDlg('Error al tratar de Actualizar Estado',mtError,[mbcancel],0);
              Transaction.Rollback;
              Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('insert into "cap$obsestado" values (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
            SQL.Add(':FECHA,:HORA,:ID_ESTADO_ANTERIOR,:ID_ESTADO_ACTUAL,:OBSERVACION,:ID_EMPLEADO)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
            ParamByName('NUMERO_CUENTA').AsInteger := vCuentaAportes;
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(2,formatcurr('0000000',vCuentaAportes)));
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('HORA').AsTime := fFechaHoraActual;
            ParamByName('ID_ESTADO_ANTERIOR').AsInteger := 10;
            ParamByName('ID_ESTADO_ACTUAL').AsInteger := 1;
            ParamByName('OBSERVACION').AsString := 'REFINANCIACION DE COLOCACION No.' + ColocacionJud;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            try
              ExecQuery;
            except
              MessageDlg('Error al tratar de Actualizar Estado',mtError,[mbcancel],0);
              Transaction.Rollback;
              Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('update "cap$maestro" set "cap$maestro".ID_ESTADO = :ID_ESTADO');
            SQL.Add('where "cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
            SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
            ParamByName('ID_ESTADO').AsInteger := 1;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
            ParamByName('NUMERO_CUENTA').AsInteger := vCuentaAportes;
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(1,formatcurr('0000000',vCuentaAportes)));
            try
             ExecQuery;
            except
             MessageDlg('Error al tratar de Actualizar "cap$maestro"',mtError,[mbcancel],0);
             Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('update "cap$maestro" set "cap$maestro".ID_ESTADO = :ID_ESTADO');
            SQL.Add('where "cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
            SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
            ParamByName('ID_ESTADO').AsInteger := 1;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
            ParamByName('NUMERO_CUENTA').AsInteger := vCuentaAportes;
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(2,formatcurr('0000000',vCuentaAportes)));
            try
             ExecQuery;
            except
             MessageDlg('Error al tratar de Actualizar "cap$maestro"',mtError,[mbcancel],0);
             Exit;
            end;

          end;
        end;

end;

procedure TfrmVisarDesembolso.AbonaHonorarios;
begin
        with IBSQL1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$pagocostastmp" where ID_COLOCACION_DES = :ID_COLOCACION_DES');
          ParamByName('ID_COLOCACION_DES').AsString := colocacion;
          ExecQuery;
          while not IBSQL1.Eof do begin
            IBHonorarios.Close;
            IBHonorarios.SQL.Clear;
            IBHonorarios.SQL.Add('insert into "cap$extracto" values(');
            IBHonorarios.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
            IBHonorarios.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
            IBHonorarios.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
            IBHonorarios.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
            IBHonorarios.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBHonorarios.ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
            IBHonorarios.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA_AB').AsInteger;
            IBHonorarios.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA_AB').AsInteger;
            IBHonorarios.ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
            IBHonorarios.ParamByName('HORA_MOVIMIENTO').AsTime := fHoraActual;
            IBHonorarios.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 19;
            IBHonorarios.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := FormatCurr('00000000',IBSQL1.FieldByName('ID_CBTE_COLOCACION').AsInteger);
            IBHonorarios.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'PAGO DE HONORARIOS COL. No.' + IBSQL1.FieldByName('ID_COLOCACION').AsString;
            IBHonorarios.ParamByName('VALOR_DEBITO').AsCurrency := IBSQL1.FieldByName('VALOR_HONORARIOS').AsCurrency;
            IBHonorarios.ParamByName('VALOR_CREDITO').AsCurrency := 0;
            try
              IBHonorarios.ExecQuery;
              if IBHonorarios.RowsAffected < 1 then
               begin
                 MessageDlg('Error Grabando Extracto Captaciones',mtError,[mbok],0);
                 Exit;
               end
            except
                 MessageDlg('Error Grabando Extracto Captaciones',mtError,[mbok],0);
                 Exit;
            end; // del try

            IBHonorarios.Close;
            IBHonorarios.SQL.Clear;
            IBHonorarios.SQL.Add('insert into "col$costas" values (:ID_AGENCIA,:ID_COLOCACION,');
            IBHonorarios.SQL.Add(':FECHA,:ID_CBTE_COLOCACION,:VALOR_COSTAS,:VALOR_HONORARIOS,:VALOR_OTROS,:DESCRIPCION)');
            IBHonorarios.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBHonorarios.ParamByName('ID_COLOCACION').AsString := IBSQL1.FieldByName('ID_COLOCACION').AsString;
            IBHonorarios.ParamByName('FECHA').AsDate := fFechaActual;
            IBHonorarios.ParamByName('ID_CBTE_COLOCACION').AsInteger := IBSQL1.FieldByName('ID_CBTE_COLOCACION').AsInteger;
            IBHonorarios.ParamByName('VALOR_COSTAS').AsCurrency := -IBSQL1.FieldByName('VALOR_COSTAS').AsCurrency;
            IBHonorarios.ParamByName('VALOR_HONORARIOS').AsCurrency := -IBSQL1.FieldByName('VALOR_HONORARIOS').AsCurrency;
            IBHonorarios.ParamByName('VALOR_OTROS').AsCurrency := 0;
            IBHonorarios.ParamByName('DESCRIPCION').AsString := 'VALOR COSTAS Y HONORARIOS RECIBIDOS EN LA FECHA';
            IBHonorarios.ExecQuery;
            IBHonorarios.Close;

           Next;
          end;
        end;
end;

procedure TfrmVisarDesembolso.AutorizacionCredivida;
var   DgCuenta :Integer;
        ano :string;
begin
        DgCuenta := StrToInt(DigitoControl(2,FormatCurr('0000000',vCuentaAportes)));
        ano := IntToStr(YearOf(fFechaActual)+ 1);
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "col$credivida" (NUMERO_CUENTA,DG_CUENTA,FECHA_VENCIMIENTO,APLICADO,DESCONTADO,IMPRESO)');
          SQL.Add('values (:NUMERO_CUENTA,:DG_CUENTA,:FECHA_VENCIMIENTO,0,0,0)');
          ParamByName('NUMERO_CUENTA').AsInteger := vCuentaAportes;
          ParamByName('DG_CUENTA').AsInteger := DgCuenta;
          ParamByName('FECHA_VENCIMIENTO').AsDate := StrToDate(FormatDateTime(ano + '/mm/dd',fFechaActual));
          ExecSQL;
        end;
end;

procedure TfrmVisarDesembolso.InfDesembolso;
begin
        with IBQuery do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update "col$desembolso" set ID_EMPLEADO_VISADOR = :ID_EMPLEADO,HORA_VISACION = :HORA');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('HORA').AsTime :=  fHoraActual;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          ExecSQL;
        end;

end;

procedure TfrmVisarDesembolso.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        dmColocacion := TdmColocacion.Create(self);
        dmSolicitud := TDmSolicitud.Create(self);

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBAhorros.Database := dmGeneral.IBDatabase1;
        IBAportes.Database := dmGeneral.IBDatabase1;
        IBAbonar.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBEquivida.Database := dmGeneral.IBDatabase1;
        IBHonorarios.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;

        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBAhorros.Transaction := dmGeneral.IBTransaction1;
        IBAportes.Transaction := dmGeneral.IBTransaction1;
        IBAbonar.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBEquivida.Transaction := dmGeneral.IBTransaction1;
        IBHonorarios.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Transaction := dmGeneral.IBTransaction1;


        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
end;

end.
