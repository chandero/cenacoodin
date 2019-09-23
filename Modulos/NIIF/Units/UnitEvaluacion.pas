unit UnitEvaluacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, ExtCtrls, StdCtrls, Mask, DBCtrls,
  Buttons, IBSQL;

type
  TfrmEvaluacion = class(TForm)
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
    Button1: TButton;
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
    Panel4: TPanel;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    CmdTablaLiq: TBitBtn;
    CmdGarantias: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    GroupBox3: TGroupBox;
    Label29: TLabel;
    EdCategoria: TStaticText;
    RGEvaluacion: TRadioGroup;
    cmdActualizar: TBitBtn;
    Label32: TLabel;
    EdEvaluacion: TStaticText;
    IBSQL1: TIBSQL;
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdBuscarClick(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure CmdTablaLiqClick(Sender: TObject);
    procedure CmdGarantiasClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdActualizarClick(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEvaluacion: TfrmEvaluacion;
  colocacion : string;
  vcolocacion : string;
  vDesembolso : Currency;

implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, UnitDmGeneral, UnitdmColocacion,UnitBuscarColocacion, UnitTablaLiquidacion, UnitConsultaGarantias;


procedure TfrmEvaluacion.EdNumeroColocacionExit(Sender: TObject);
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
                SQL.Add('"col$colocacion".ID_CATEGORIA,');
                SQL.Add('"col$colocacion".ID_EVALUACION,');
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
                      if (FieldByName('ES_NOVISADO').AsInteger <> 0) or
                         (FieldByName('ES_ANULADO').AsInteger <> 0)  or
                         (FieldByName('ES_CANCELADO').AsInteger <> 0 ) then
                       begin
                          MessageDlg('Esta Colocación no se puede Liquidar',mtError,[mbOK],0);
                          CmdNuevo.SetFocus;
                          Exit;
                       end;

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
                      EdNotaContable.Caption := FieldByName('NOTA_CONTABLE').AsString;
                      EdCategoria.Caption := FieldByName('ID_CATEGORIA').AsString;
                      EdEvaluacion.Caption := FieldByName('ID_EVALUACION').AsString;
                      Self.Caption := 'Consulta de Colocación - Estado:' + FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;

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

                      if FieldByName('ES_SALDADO').AsInteger <> 0 then
                       begin
                         MessageDlg('La Colocación Está Saldada',mtError,[mbOK],0);
                         Close;
                         CmdNuevo.SetFocus;
                         Exit;
                       end;
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
                end;
        end;
end;

procedure TfrmEvaluacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmEvaluacion.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
        if dmColocacion.IBDScolocacion.Transaction.InTransaction then
           dmColocacion.IBDScolocacion.Transaction.Rollback;
        dmColocacion.IBDScolocacion.Transaction.StartTransaction;
        dmColocacion.IBDSagencias.Open;
        dmColocacion.IBDSagencias.Last;
end;

procedure TfrmEvaluacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if dmColocacion.IBDScolocacion.Transaction.InTransaction then
           dmColocacion.IBDScolocacion.Transaction.Commit;
        dmColocacion.Free;
        Action := caFree;

end;

procedure TfrmEvaluacion.CmdBuscarClick(Sender: TObject);
begin
        frmBusquedaDeColocacion := TfrmBusquedaDeColocacion.Create(Self);
        if frmBusquedaDeColocacion.ShowModal = mrOK then
        begin
           EdNumeroColocacion.Text := frmBusquedaDeColocacion.Colocacion;
           EdNumeroColocacionExit(TObject(EdNumeroColocacion));
        end;

end;

procedure TfrmEvaluacion.Inicializar;
begin
            if DmGeneral.IBTransaction1.InTransaction then
            begin
              DmGeneral.IBTransaction1.Commit;
              DmGeneral.IBTransaction1.StartTransaction;
            end;

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

end;

procedure TfrmEvaluacion.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
        EdNumeroColocacion.SetFocus;
end;

procedure TfrmEvaluacion.CmdTablaLiqClick(Sender: TObject);
var frmTablaLiquidacion:TfrmTablaLiquidacion;
begin
        frmTablaLiquidacion := TfrmTablaLiquidacion.Create(Self);
        frmTablaLiquidacion.TablaLiq := Colocacion;
        frmTablaLiquidacion.Saldo := vDesembolso;
        frmTablaLiquidacion.ShowModal;
end;

procedure TfrmEvaluacion.CmdGarantiasClick(Sender: TObject);
var frmConsultaGarantias:TfrmConsultaGarantias;
begin
        frmConsultaGarantias := TfrmConsultaGarantias.Create(Self);
        frmConsultaGarantias.Agencia := Agencia;
        frmConsultaGarantias.IdColocacion := Colocacion;
        frmConsultaGarantias.ShowModal;
end;

procedure TfrmEvaluacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmEvaluacion.FormShow(Sender: TObject);
begin
        inicializar;
end;

procedure TfrmEvaluacion.cmdActualizarClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Cambiar la Categoria',mtConfirmation,[mbyes,mbno],0) = mrno then
         Exit;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "col$hevaluacion" values');
          SQL.Add('(:ID_AGENCIA,:ID_COLOCACION,:FECHA,:EVALUACION_ANTERIOR,:EVALUACION_NUEVA,:ID_EMPLEADO)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ParamByName('FECHA').AsDate := fFechaActual;
          ParamByName('EVALUACION_ANTERIOR').AsString := EdEvaluacion.Caption;
          case RGEvaluacion.ItemIndex of
           0: ParamByName('EVALUACION_NUEVA').AsString := 'A';
           1: ParamByName('EVALUACION_NUEVA').AsString := 'B';
           2: ParamByName('EVALUACION_NUEVA').AsString := 'C';
           3: ParamByName('EVALUACION_NUEVA').AsString := 'D';
           4: ParamByName('EVALUACION_NUEVA').AsString := 'E';
          end;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;
        end;



        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('update "col$colocacion" set ID_EVALUACION = :ID_EVALUACION');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := colocacion;
          case RGEvaluacion.ItemIndex of
           0: ParamByName('ID_EVALUACION').AsString := 'A';
           1: ParamByName('ID_EVALUACION').AsString := 'B';
           2: ParamByName('ID_EVALUACION').AsString := 'C';
           3: ParamByName('ID_EVALUACION').AsString := 'D';
           4: ParamByName('ID_EVALUACION').AsString := 'E';
          end;
          try
            ExecQuery;
            Transaction.Commit;
            CmdNuevo.Click;
          except
            Transaction.Rollback;
            raise;
            Exit;
          end;
        end;

        MessageDlg('Colocación Actualizada con Exito!',mtInformation,[mbok],0);

end;

end.
