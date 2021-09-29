unit UnitVisarColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, Mask, StdCtrls, DBCtrls, Buttons, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, IBSQL, DateUtils;

type
  TfrmVisarColocacion = class(TForm)
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
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CmdTablaLiqClick(Sender: TObject);
    procedure CmdGarantiasClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdVisarClick(Sender: TObject);
    procedure CmdAnularClick(Sender: TObject);
  private
    procedure Inicializar;
    function AplicarDescuentos:Boolean;
    procedure BuscarDatos;
    function AbonarAportes:Boolean;
    function AbonarAhorros:Boolean;
    procedure CambiarEstadoColocacion;
    procedure ReversarColocacion;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisarColocacion: TfrmVisarColocacion;
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
  EsAnulado : Integer;
  EsVigente : Integer;
  Empleado1 : string;
implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, UnitDmGeneral, UnitdmColocacion,UnitBuscarColocacion, UnitTablaPagoColocacion, UnitConsultaGarantias;


procedure TfrmVisarColocacion.EdNumeroColocacionExit(Sender: TObject);
var TasaEfectiva:Double;
TasaAplicada : Double;
begin
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
                      EdTasaMaxima.Caption := FormatCurr('#0.00%',BuscoTasaEfectivaMaxima(Date));
                      EdEnteAprobador.Caption := FieldByName('DESCRIPCION_ENTE_APROBADOR').AsString;
                      vNotaContable := FieldByName('NOTA_CONTABLE').AsString;
                      EdNotaContable.Caption := vNotaContable;
                      vCuentaAportes := FieldByName('NUMERO_CUENTA').AsInteger;
                      EdCuentaAportes.Caption := IntToStr(vCuentaAportes);
                      if FieldByName('INTERES').AsString = 'V' then
                      begin
                         EdTasaMaximaNominal.Caption := FormatCurr('#0.00%',(TasaNominalVencida(BuscoTasaEfectivaMaxima(Date),FieldByName('AMORTIZA_INTERES').AsInteger)+FieldByName('PUNTOS_INTERES').AsFloat) );
                         TasaAplicada := TasaNominalVencida(TasaEfectiva,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat;
                         EdTasaNominal.Caption := FormatCurr('#0.00%',TasaAplicada);
                      end
                      else
                      begin
                         EdTasaMaximaNominal.Caption := FormatCurr('#0.00%',TasaNominalAnticipada(BuscoTasaEfectivaMaxima(Date),FieldByName('AMORTIZA_INTERES').AsInteger));
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
                      IBQuery1.Close;
                end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                      EdNumeroColocacion.SetFocus;
                end;
        end;
        CmdVisar.Enabled := True;
        CmdAnular.Enabled := True;
end;

procedure TfrmVisarColocacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,self);
end;

procedure TfrmVisarColocacion.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmVisarColocacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmVisarColocacion.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Commit;
         DmGeneral.IBTransaction1.StartTransaction;
        Inicializar;
end;

procedure TfrmVisarColocacion.Inicializar;
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
            dmColocacion.IBDSagencias.Open;
            dmColocacion.IBDSagencias.Last;
            dmColocacion.IBDSagencias.First;
            EdAgencia.KeyValue := Agencia;
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
            Empleado1 := '';
            EsAnulado := 0;
            EsVigente := 0;
end;

procedure TfrmVisarColocacion.CmdTablaLiqClick(Sender: TObject);
var frmTablaPagoColocacion:TfrmTablaPagoColocacion;
begin
        frmTablaPagoColocacion := TfrmTablaPagoColocacion.Create(Self);
        frmTablaPagoColocacion.TablaLiq := Colocacion;
        frmTablaPagoColocacion.Saldo := vDesembolso;
        frmTablaPagoColocacion.ShowModal;
end;

procedure TfrmVisarColocacion.CmdGarantiasClick(Sender: TObject);
var frmConsultaGarantias:TfrmConsultaGarantias;
begin
        frmConsultaGarantias := TfrmConsultaGarantias.Create(Self);
        frmConsultaGarantias.Agencia := Agencia;
        frmConsultaGarantias.IdColocacion := Colocacion;
        frmConsultaGarantias.ShowModal;
end;

procedure TfrmVisarColocacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmVisarColocacion.CmdVisarClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Visar Esta Colocación?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
         CmdVisar.Enabled := False;
         CmdAnular.Enabled := False;
         Application.ProcessMessages;
         if AplicarDescuentos and AbonarAhorros and AbonarAportes then
          begin
            CambiarEstadoColocacion;
            dmColocacion.IBDScolocacion.Transaction.Commit;
            GroupBox1.Enabled := False;
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

function TfrmVisarColocacion.AplicarDescuentos:Boolean;
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
          SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
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

procedure TfrmVisarColocacion.BuscarDatos;
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
           SQL.Add('Select CREDITO');
           SQL.Add('from "col$concol"');
           SQL.Add('where ');
           SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$concol".CODIGO =:"CODIGO"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ParamByName('CODIGO').AsString := vCodigoPucAhorros;
           Open;
           ValorAhorros := FieldByName('CREDITO').AsCurrency;
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

function TfrmVisarColocacion.AbonarAportes:Boolean;
begin
    DigitoC := DigitoControl(1,formatcurr('0000000',vCuentaAportes));
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
                ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
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


function TfrmVisarColocacion.AbonarAhorros:Boolean;
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
             if ValorAhorros > 0 then
               begin
                ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
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

procedure TfrmVisarcolocacion.CambiarEstadoColocacion;
begin
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
         end;
end;

procedure TfrmVisarColocacion.CmdAnularClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Reversar Esta Colocación?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            AplicarDescuentos;
            ReversarColocacion;
            dmColocacion.IBDScolocacion.Transaction.Commit;
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

procedure Tfrmvisarcolocacion.ReversarColocacion;
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
           Open;
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
           Open;
           Close;

           SQL.Clear;
           SQL.Add('update "con$auxiliar" set ESTADOAUX = :"ESTADOAUX"');
           SQL.Add('where ');
           SQL.Add('"con$auxiliar".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"con$auxiliar".ID_COMPROBANTE =:"ID_COMPROBANTE"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COMPROBANTE').AsInteger := StrToInt(vNotaContable);
           ParamByName('ESTADOAUX').AsString := 'N';
           Open;
           Close;

           SQL.Clear;
           SQL.Add('delete from "col$tablaliquidacion"');
           SQL.Add('where ');
           SQL.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COLOCACION').AsString := Colocacion;
           Open;
           Close;

           SQL.Clear;
           SQL.Add('delete from "col$extracto"');
           SQL.Add('where ');
           SQL.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COLOCACION').AsString := Colocacion;
           Open;
           Close;

           SQL.Clear;
           SQL.Add('delete from "col$colgarantias"');
           SQL.Add('where ');
           SQL.Add('"col$colgarantias".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$colgarantias".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COLOCACION').AsString := Colocacion;
           Open;
           Close;

           SQL.Clear;
           SQL.Add('delete from "col$colgarantiasreal"');
           SQL.Add('where ');
           SQL.Add('"col$colgarantiasreal".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$colgarantiasreal".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByname('ID_AGENCIA').AsInteger := Agencia;
           ParamByname('ID_COLOCACION').AsString := Colocacion;
           Open;
           Close;
         end;
end;

end.
