unit UnitGestionColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBDatabase, IBQuery, DBCtrls, StdCtrls, Buttons, Mask,
  ExtCtrls, ComCtrls, JvEdit, JvTypedEdit;

type
  TfrmGestionColocacion = class(TForm)
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
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    Label53: TLabel;
    Label54: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label19: TLabel;
    EdEnteAprobador: TStaticText;
    Panel4: TPanel;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    EdNotaContable: TStaticText;
    EdTotalCuotas: TStaticText;
    EdNumeroColocacion: TMaskEdit;
    CmdTablaLiq: TBitBtn;
    CmdGarantias: TBitBtn;
    Button1: TButton;
    IBCuotas: TIBQuery;
    IBQAgencia: TIBQuery;
    DSAgencia: TDataSource;
    EdFechaCapital: TDateTimePicker;
    EdFechaInteres: TDateTimePicker;
    CmdGrabar: TBitBtn;
    IBTransaction1: TIBTransaction;
    IBQfecha: TIBQuery;
    chkFechaSync: TCheckBox;
    btnRecalcularCuota: TBitBtn;
    Label29: TLabel;
    edNuevaCuota: TJvCurrencyEdit;
    btnGuardarCuota: TBitBtn;
    Label32: TLabel;
    edRecalculos: TStaticText;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdBuscarClick(Sender: TObject);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure CmdNuevoClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure CmdTablaLiqClick(Sender: TObject);
    procedure CmdGarantiasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure EdFechaInteresChange(Sender: TObject);
    procedure EdFechaCapitalChange(Sender: TObject);
    procedure btnRecalcularCuotaClick(Sender: TObject);
    procedure btnGuardarCuotaClick(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGestionColocacion: TfrmGestionColocacion;

  transaction1: TIBTransaction;
  colocacion : string;
  vcolocacion : string;
  vDesembolso : Currency;
  vSaldoActual, vValorCuota, vCuotaAnt : Currency;
  vCuotaTipo, vModalidad : String;
  vAmortizaCapital: Integer;
  vAmortizaInteres: Integer;
  vTasaEfectiva: Double;
  vFechaCapital, vFechaInteres, vFechaVencimiento: TDate;
  vPlazo: Integer;
implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, unitDmGeneral, UnitdmColocacion,UnitBuscarColocacion, UnitGestionTablaLiquidacion, UnitConsultaGarantias;


procedure TfrmGestionColocacion.EdNumeroColocacionExit(Sender: TObject);
var TasaEfectiva:Double;
TasaAplicada : Double;
begin
        colocacion := trim(EdNumeroColocacion.Text);
        EdNumeroColocacion.Text := colocacion;

        If Trim(EdNumeroColocacion.Text) = '' then Exit;
        with IBQuery do
        begin
                if Transaction.InTransaction then
                  Transaction.Commit;
                Transaction.StartTransaction;
                SQL.Clear;
                SQL.Add('SELECT ');
                SQL.Add('"col$colocacion".ID_AGENCIA,');
                SQL.Add('"col$colocacion".ID_COLOCACION,');
                SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
                SQL.Add('"col$colocacion".ID_PERSONA,');
                SQL.Add('"col$colocacion".ID_CLASIFICACION,');
                SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
                SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
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
                SQL.Add('"col$enteaprobador".DESCRIPCION_ENTE_APROBADOR,');
                SQL.Add('"col$colocacion".NOTA_CONTABLE,');
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
                SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION ');
                SQL.Add(' FROM ');
                SQL.Add('"col$colocacion" ');
                SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION) ');
                SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION) ');
                SQL.Add('LEFT JOIN "col$enteaprobador" ON ("col$colocacion".ID_ENTE_APROBADOR = "col$enteaprobador".ID_ENTE_APROBADOR) ');
                SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO) ');
                SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION) ');
                SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA) ');
                SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA) ');
                SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
                SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) ');
                SQL.Add('LEFT OUTER JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) ');
                SQL.Add(' JOIN "gen$tiposidentificacion" ON ("col$colocacion".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION) ');
                SQL.Add(' WHERE ');
                SQL.Add('(ID_COLOCACION = :"ID_COLOCACION")');

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

                      EdAgencia.KeyValue := FieldByName('ID_AGENCIA').AsInteger; 
                      EdTipoIdentificacion.Caption := FieldByName('DESCRIPCION_IDENTIFICACION').AsString ;
                      EdNumeroIdentificacion.Caption := FieldByName('ID_PERSONA').AsString ;
                      EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString  + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString  + ' ' + FieldByName('NOMBRE').AsString ;
                      EdClasificacion.Caption := FieldByName('DESCRIPCION_CLASIFICACION').AsString ;
                      EdLinea.Caption := FieldByName('DESCRIPCION_LINEA').AsString ;
                      EdInversion.Caption := FieldByName('DESCRIPCION_INVERSION').AsString ;
                      EdRespaldo.Caption := FieldByName('DESCRIPCION_RESPALDO').AsString;
                      EdGarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString ;
                      EdFechaColocacion.Caption := DateToStr(FieldByName('FECHA_DESEMBOLSO').AsFloat);
                      vDesembolso := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                      vFechaVencimiento := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                      EdValorColocacion.Caption := FormatCurr('#,#0.00',vDesembolso);
                      EdSaldoColocacion.Caption := FormatCurr('#,#0.00',FieldByName('SALDO_ACTUAL').AsCurrency);
                      vSaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
                      EdPlazo.Caption := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
                      //tipo tasa
                      vCuotaTipo := FieldByName('TIPO_INTERES').AsString;
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
                        vTasaEfectiva := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                      end
                      else
                      begin
                        EdTasaEfectiva.Caption := ''; //FormatCurr('#0.00%',FieldByName('VALOR_ACTUAL_TASA').AsFloat); // + FieldByName('PUNTOS_INTERES').AsFloat);
                        TasaEfectiva := FieldByName('VALOR_ACTUAL_TASA').AsFloat; // + FieldByName('PUNTOS_INTERES').AsFloat;
                      end;
                      EdTasaMora.Caption := FormatCurr('#0.00%',FieldByName('TASA_INTERES_MORA').AsFloat);
                      EdTipoCuota.Caption := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                      EdAmortizaCapital.Caption := IntToStr(FieldByName('AMORTIZA_CAPITAL').AsInteger);
                      vAmortizaCapital := FieldByName('AMORTIZA_CAPITAL').AsInteger;
                      EdAmortizaInteres.Caption := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
                      vAmortizaInteres := FieldByName('AMORTIZA_INTERES').AsInteger;
                      EdPeriodoGracia.Caption := IntToStr(FieldByName('PERIODO_GRACIA').AsInteger);
                      EdDiasProrroga.Caption := IntToStr(FieldByName('DIAS_PRORROGADOS').AsInteger);
                      EdValorCuota.Caption := FormatCurr('#,#0',FieldByName('VALOR_CUOTA').AsCurrency);
                      vCuotaAnt := FieldByName('VALOR_CUOTA').AsCurrency;
                      FechaKant := FieldByname('FECHA_CAPITAL').AsDateTime;
                      vFechaCapital := FieldByname('FECHA_CAPITAL').AsDateTime;
                      EdFechaCapital.Date := Fechakant;
                      EdFechaInteres.Date := FieldByName('FECHA_INTERES').AsDateTime;
                      vFechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
                      EdTasaMaxima.Caption := FormatCurr('#0.00%',BuscoTasaEfectivaMaxima(Date,FieldByName('ID_CLASIFICACION').AsInteger,'A'));
                      EdEnteAprobador.Caption := FieldByName('DESCRIPCION_ENTE_APROBADOR').AsString;
                      EdNotaContable.Caption := FieldByName('NOTA_CONTABLE').AsString;
                      Self.Caption := 'Consulta de Colocación - Estado:' + FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                      vModalidad := FieldByName('INTERES').AsString;
                      if FieldByName('INTERES').AsString = 'V' then
                      begin
                         EdTasaMaximaNominal.Caption := FormatCurr('#0.00%',(TasaNominalVencida(BuscoTasaEfectivaMaxima(Date,FieldByName('ID_CLASIFICACION').AsInteger,'A'),FieldByName('AMORTIZA_INTERES').AsInteger)));
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

                      if FieldByName('ES_SALDADO').AsInteger <> 0 then
                       begin
                         MessageDlg('La Colocación Está Saldada',mtError,[mbOK],0);
                         Close;
                         CmdNuevo.SetFocus;
                         Exit;
                       end;
                      Close;

                      IBCuotas.SQL.Clear;
                      IBCuotas.SQL.Add('select count(*) as CUOTAS from "col$tablaliquidacion" where ');
                      IBCuotas.SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and ');
                      IBCuotas.SQL.Add('PAGADA = 0');
                      IBCuotas.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
                      IBCuotas.Open;
                      EdTotalCuotas.Caption := IntTostr(IBCuotas.FieldByName('CUOTAS').AsInteger);
                      IBCuotas.Close;

                      IBQuery1.Close;
                      IBQuery1.SQL.Clear;
                      IBQuery1.SQL.Add('SELECT COUNT(*) AS TOTAL FROM "col$recalculocuota" WHERE ID_COLOCACION = :ID_COLOCACION');
                      IBQuery1.ParamByName('ID_COLOCACION').AsString := colocacion;
                      IBQuery1.Open;
                      if (IBQuery1.RecordCount > 0) then edRecalculos.Caption := IBQuery1.FieldByName('TOTAL').AsString;
                      IBQuery1.Close;

                 end
                else
                begin
                      MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
                end;
        end;
end;

procedure TfrmGestionColocacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmGestionColocacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if control_consulta then
        begin
          //dmColocacion.Free;
          Action := caFree;
        end;
        control_consulta := True;
end;

procedure TfrmGestionColocacion.CmdBuscarClick(Sender: TObject);
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;
end;

procedure TfrmGestionColocacion.EdNumeroColocacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmGestionColocacion.Inicializar;
begin
            if DmGeneral.IBTransaction1.InTransaction then
              DmGeneral.IBTransaction1.Rollback;
            DmGeneral.IBTransaction1.StartTransaction;

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
            EdFechaCapital.Date := 0;
            EdFechaInteres.Date := 0;
            IBQAgencia.Open;
            IBQAgencia.Last;
            IBQAgencia.First;
            EdAgencia.KeyValue := -1;
            EdEnteAprobador.Caption := '';
            EdNotaContable.Caption := '';
            EdTotalCuotas.Caption := '';
            edRecalculos.Caption := '';
            edNuevaCuota.Value := 0;
end;

procedure TfrmGestionColocacion.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
        EdNumeroColocacion.SetFocus;
end;


procedure TfrmGestionColocacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmGestionColocacion.EdAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmGestionColocacion.CmdTablaLiqClick(Sender: TObject);
var frmGestionTablaLiquidacion:TfrmGestionTablaLiquidacion;
begin
        frmGestionTablaLiquidacion := TfrmGestionTablaLiquidacion.Create(Self);
        frmGestionTablaLiquidacion.TablaLiq := Colocacion;
        frmGestionTablaLiquidacion.Saldo := vDesembolso;
        frmGestionTablaLiquidacion.ShowModal;
end;

procedure TfrmGestionColocacion.CmdGarantiasClick(Sender: TObject);
var frmConsultaGarantias:TfrmConsultaGarantias;
begin
        frmConsultaGarantias := TfrmConsultaGarantias.Create(Self);
        frmConsultaGarantias.Agencia := Agencia;
        frmConsultaGarantias.IdColocacion := Colocacion;
        frmConsultaGarantias.ShowModal;
end;

procedure TfrmGestionColocacion.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmGestionColocacion.FormCreate(Sender: TObject);
begin
//        dmGeneral := TdmGeneral.Create(self);
//        dmGeneral.getConnected;
        transaction1 := TIBTransaction.Create(self);
        transaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        transaction1.StartTransaction;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery.Database := dmGeneral.IBDatabase1;
        IBQuery.Transaction := dmGeneral.IBTransaction1;
        IBCuotas.Database := dmGeneral.IBDatabase1;
        IBCuotas.Transaction := dmGeneral.IBTransaction1;
        IBQAgencia.Database := dmGeneral.IBDatabase1;
        IBQAgencia.Transaction := transaction1;
        //if control_consulta then
        //   dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmGestionColocacion.CmdGrabarClick(Sender: TObject);
begin

        if (MessageDlg('Desea cambiar la oficina, fechas de capital e interes?',mtConfirmation,[mbYes,mbNo],0)) = mrYes then
        begin
         IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
         IBQfecha.Database := dmGeneral.IBDatabase1;
         IBQfecha.Transaction := IBTransaction1;
         IBTransaction1.StartTransaction;
         IBQfecha.Close;
         IBQfecha.SQL.Clear;
         IBQfecha.SQL.Add('UPDATE "col$colocacion" c SET c.ID_AGENCIA = :ID_AGENCIA, c.FECHA_CAPITAL = :FECHA_CAPITAL, c.FECHA_INTERES = :FECHA_INTERES');
         IBQfecha.SQL.Add('WHERE c.ID_COLOCACION = :ID_COLOCACION');
         IBQfecha.ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
         IBQfecha.ParamByName('FECHA_CAPITAL').AsDate := EdFechaCapital.Date;
         IBQfecha.ParamByName('FECHA_INTERES').AsDate := EdFechaInteres.Date;
         IBQfecha.ParamByName('ID_COLOCACION').AsString := colocacion;
         IBQfecha.ExecSQL;
         IBTransaction1.Commit;
         vFechaCapital := EdFechaCapital.Date;
         vFechaInteres := EdFechaInteres.Date;
        end;

end;

procedure TfrmGestionColocacion.EdFechaInteresChange(Sender: TObject);
begin
        if (chkFechaSync.Checked) then
               EdFechaCapital.Date := EdFechaInteres.Date;
end;

procedure TfrmGestionColocacion.EdFechaCapitalChange(Sender: TObject);
begin
        if (chkFechaSync.Checked) then
                EdFechaInteres.Date := EdFechaCapital.Date;
end;

procedure TfrmGestionColocacion.btnRecalcularCuotaClick(Sender: TObject);
begin
        vPlazo := DiasEntre(vFechaCapital, vFechaVencimiento);
        if vCuotaTipo = 'F' then
        begin
           vAmortizaCapital := vAmortizaInteres;
           vValorCuota := CuotaFija(vSaldoActual,vPlazo,vTasaEfectiva,vAmortizaInteres);
        end
        else
        begin
           vValorCuota := CuotaVariable(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaCapital);
        end;
        edNuevaCuota.Value := vValorCuota;
        btnRecalcularCuota.Enabled := False;
        btnGuardarCuota.Enabled := True;
end;

procedure TfrmGestionColocacion.btnGuardarCuotaClick(Sender: TObject);
var
  IBQuery, IBQtabla: TIBQuery;
  vCuota : Integer;
  _vTransaction: TIBTransaction;
begin
        if (MessageDlg('Desea aplicar el recalculo de la cuota?',mtConfirmation,[mbYes,mbNo],0)) = mrYes then
        begin
           _vTransaction := TIBTransaction.Create(nil);
           _vTransaction.DefaultDatabase := dmGeneral.IBDatabase1;
           IBQuery := TIBQuery.Create(nil);
           IBQtabla := TIBQuery.Create(nil);
           IBQuery.Database := dmGeneral.IBDatabase1;
           IBQuery.Transaction := _vTransaction;

           IBQtabla.Database := dmGeneral.IBDatabase1;
           IBQtabla.Transaction := _vTransaction;

           IBQuery.SQL.Clear;
           IBQuery.SQL.Add('UPDATE "col$colocacion" SET VALOR_CUOTA = :VALOR_CUOTA WHERE ID_COLOCACION = :ID_COLOCACION');
           IBQuery.ParamByName('VALOR_CUOTA').AsCurrency := vValorCuota;
           IBQuery.ParamByName('ID_COLOCACION').AsString := colocacion;
           IBQuery.ExecSQL;

           IBQtabla.SQL.Clear;
           IBQtabla.SQL.Add('SELECT COUNT(*) AS CUOTA FROM "col$tablaliquidacion" t WHERE t.ID_COLOCACION = :ID_COLOCACION and t.FECHA_A_PAGAR <= :FECHA_A_PAGAR');
           IBQtabla.ParamByName('ID_COLOCACION').AsString := colocacion;
           IBQtabla.ParamByName('FECHA_A_PAGAR').AsDate := vFechaInteres;
           IBQtabla.Open;

           vCuota := IBQtabla.FieldByName('CUOTA').AsInteger;

           CrearTablaLiquidacionNuevaCuota(colocacion,vSaldoActual,vValorCuota,vFechaInteres,vTasaEfectiva,0,vAmortizaCapital,vAmortizaInteres,vPlazo,vCuotaTipo,vModalidad, vCuota);

           IBQuery.Close;
           IBQuery.SQL.Clear;
           IBQuery.SQL.Add('INSERT INTO "col$recalculocuota" (FECHA,ID_COLOCACION,CUOTA_ANTERIOR,CUOTA_NUEVA,CUOTA_CAMBIO) VALUES (:FECHA,:ID_COLOCACION,:CUOTA_ANTERIOR,:CUOTA_NUEVA,:CUOTA_CAMBIO)');
           IBQuery.ParamByName('FECHA').AsDate := fFechaActual;
           IBQuery.ParamByName('ID_COLOCACION').AsString := colocacion;
           IBQuery.ParamByName('CUOTA_ANTERIOR').AsCurrency := vCuotaAnt;
           IBQuery.ParamByName('CUOTA_NUEVA').AsCurrency := vValorCuota;
           IBQuery.ParamByName('CUOTA_CAMBIO').AsInteger := vCuota + 1;
           IBQuery.ExecSQL;

           _vTransaction.Commit;

           btnGuardarCuota.Enabled := False;

           ShowMessage('Proceso Recalculo de Cuota, Finalizado!!!');

        end;
end;

end.


