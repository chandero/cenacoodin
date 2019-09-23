unit UnitExtractoColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, DBClient, IBDatabase, Math, UnitDmGeneral;

type
  TFrmExtractoColocacion = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    EdAgencia: TDBLookupComboBox;
    EdNumeroColocacion: TMaskEdit;
    IBQExtractoCol: TIBQuery;
    IBQuery: TIBQuery;
    IBQCol: TIBQuery;
    IBQTabla: TIBQuery;
    IBQExtractoColID_AGENCIA: TSmallintField;
    IBQExtractoColID_CBTE_COLOCACION: TIntegerField;
    IBQExtractoColID_COLOCACION: TIBStringField;
    IBQExtractoColFECHA_EXTRACTO: TDateField;
    IBQExtractoColHORA_EXTRACTO: TTimeField;
    IBQExtractoColCUOTA_EXTRACTO: TIntegerField;
    IBQExtractoColTIPO_OPERACION: TSmallintField;
    IBQExtractoColSALDO_ANTERIOR_EXTRACTO: TIBBCDField;
    IBQExtractoColABONO_CAPITAL: TIBBCDField;
    IBQExtractoColABONO_CXC: TIBBCDField;
    IBQExtractoColABONO_ANTICIPADO: TIBBCDField;
    IBQExtractoColABONO_SERVICIOS: TIBBCDField;
    IBQExtractoColABONO_MORA: TIBBCDField;
    IBQExtractoColABONO_SEGURO: TIBBCDField;
    IBQExtractoColABONO_PAGXCLI: TIBBCDField;
    IBQExtractoColABONO_HONORARIOS: TIBBCDField;
    IBQExtractoColABONO_OTROS: TIBBCDField;
    IBQExtractoColTASA_INTERES_LIQUIDACION: TFloatField;
    IBQExtractoColID_EMPLEADO: TIBStringField;
    IBQExtractoColINTERES_PAGO_HASTA: TDateField;
    IBQExtractoColCAPITAL_PAGO_HASTA: TDateField;
    IBQExtractoColTIPO_ABONO: TSmallintField;
    IBQExtractoColFECHA_A_PAGAR: TDateField;
    IBQExtractoColCAPITAL_A_PAGAR: TIBBCDField;
    IBQExtractoColINTERES_A_PAGAR: TIBBCDField;
    IBQuery1: TIBQuery;
    IBQuery1FECHA_A_PAGAR: TDateField;
    IBQuery1CAPITAL_A_PAGAR: TIBBCDField;
    IBQColID_AGENCIA: TSmallintField;
    IBQColID_COLOCACION: TIBStringField;
    IBQColID_IDENTIFICACION: TSmallintField;
    IBQColID_PERSONA: TIBStringField;
    IBQColFECHA_DESEMBOLSO: TDateField;
    IBQColVALOR_DESEMBOLSO: TIBBCDField;
    IBQColABONOS_CAPITAL: TIBBCDField;
    IBQColSALDO_ACTUAL: TIBBCDField;
    IBQColPLAZO_COLOCACION: TIntegerField;
    IBQColFECHA_VENCIMIENTO: TDateField;
    IBQColTIPO_INTERES: TIBStringField;
    IBQColDESCRIPCION_TASA: TIBStringField;
    IBQColVALOR_ACTUAL_TASA: TFloatField;
    IBQColTASA_INTERES_CORRIENTE: TFloatField;
    IBQColTASA_INTERES_MORA: TFloatField;
    IBQColPUNTOS_INTERES: TFloatField;
    IBQColAMORTIZA_CAPITAL: TIntegerField;
    IBQColAMORTIZA_INTERES: TIntegerField;
    IBQColPERIODO_GRACIA: TIntegerField;
    IBQColDIAS_PRORROGADOS: TIntegerField;
    IBQColVALOR_CUOTA: TIBBCDField;
    IBQColCAPITAL: TIBStringField;
    IBQColINTERES: TIBStringField;
    IBQColTIPO_CUOTA: TIBStringField;
    IBQColFECHA_CAPITAL: TDateField;
    IBQColFECHA_INTERES: TDateField;
    IBQColDESCRIPCION_ESTADO_COLOCACION: TIBStringField;
    IBQColES_PREJURIDICO: TSmallintField;
    IBQColES_JURIDICO: TSmallintField;
    IBQColES_CASTIGADO: TSmallintField;
    IBQColES_NOVISADO: TSmallintField;
    IBQColES_ANULADO: TSmallintField;
    IBQColES_CANCELADO: TSmallintField;
    IBQColDESCRIPCION_CLASIFICACION: TIBStringField;
    IBQColDESCRIPCION_INVERSION: TIBStringField;
    IBQColDESCRIPCION_LINEA: TIBStringField;
    IBQColDESCRIPCION_RESPALDO: TIBStringField;
    IBQColDESCRIPCION_GARANTIA: TIBStringField;
    IBQColDESCRIPCION_TIPO_CUOTA: TIBStringField;
    IBQColNOMBRE: TIBStringField;
    IBQColPRIMER_APELLIDO: TIBStringField;
    IBQColSEGUNDO_APELLIDO: TIBStringField;
    IBQColDESCRIPCION_IDENTIFICACION: TIBStringField;
    CmdNuevo: TBitBtn;
    ReporExtractoCol: TprTxReport;
    Extracto: TClientDataSet;
    ExtractoFECHA: TDateField;
    ExtractoNO_COMP: TIntegerField;
    ExtractoCUOTA: TIntegerField;
    ExtractoTASA: TFloatField;
    ExtractoINTERES: TStringField;
    ExtractoCAPITAL: TStringField;
    ExtractoSALDO: TStringField;
    ExtractoFECHA_VENC: TStringField;
    ExtractoCAPITAL_VENC: TStringField;
    ExtractoINTERES_PAGO_HASTA: TDateField;
    ExtractoCAPITAL_PAGO_HASTA: TDateField;
    DSAgencia: TDataSource;
    IBAgencia: TIBQuery;
    IBTExtracto: TIBTransaction;
    procedure EdAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroColocacionExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure Empleado;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroColocacionEnter(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    AgC : Integer;
    Col : string;
    procedure MostrarExtracto;
    procedure Inicializar;
    { Private declarations }
  public
    property AgenciaC : Integer read agc Write agc;
    property Colocacion : string read col Write col;
    { Public declarations }
  end;

var
  FrmExtractoColocacion: TFrmExtractoColocacion;
  dmGeneral : TdmGeneral;
  vcolocacion : string;
  Nombres : String;
  Apellidos : String;

implementation

{$R *.dfm}

uses UnitVistaPreliminar, UnitGlobales, UnitGlobalesCol;

procedure TFrmExtractoColocacion.EdAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmExtractoColocacion.EdNumeroColocacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmExtractoColocacion.EdNumeroColocacionExit(Sender: TObject);
begin
        vcolocacion := trim(EdNumeroColocacion.Text);
        CmdAceptar.Enabled := True;
        CmdAceptar.SetFocus;
end;

procedure TFrmExtractoColocacion.CmdAceptarClick(Sender: TObject);
begin
        MostrarExtracto;
        CmdNuevo.SetFocus;
        CmdAceptar.Enabled := False;
end;

procedure TFrmExtractoColocacion.MostrarExtracto;
var
Cuotas : string;
Intereses : Currency;
InteresAnticipado : Currency;
InteresCorriente  : Currency;
InteresServicios  : Currency;
InteresMora       : Currency;
SaldoActual       : Currency;
SaldoAnterior     : Currency;
TotalAbonoCapital : Currency;
TasaNominal       : Double;
frmVistaPreliminar:TfrmVistaPreliminar;
Tabla : String;
begin
        Empleado;

        Intereses := 0;
        with IBQCol do begin
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO_ACTUAL,');
          SQL.Add('"col$colocacion".PLAZO_COLOCACION,');
          SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
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
          ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
          ParamByName('ID_COLOCACION').AsString := vcolocacion;
          Open;
          TotalAbonoCapital := FieldByName('ABONOS_CAPITAL').AsCurrency;
          if FieldByName('INTERES').AsString = 'A' then
             TasaNominal := TasaNominalAnticipada(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger)
          else
             TasaNominal := TasaNominalVencida(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger);

          if RecordCount > 0 then begin
           with IBQExtractoCol do begin
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"col$extracto".ID_AGENCIA,');
             SQL.Add('"col$extracto".ID_CBTE_COLOCACION,');
             SQL.Add('"col$extracto".ID_COLOCACION,');
             SQL.Add('"col$extracto".FECHA_EXTRACTO,');
             SQL.Add('"col$extracto".HORA_EXTRACTO,');
             SQL.Add('"col$extracto".CUOTA_EXTRACTO,');
             SQL.Add('"col$extracto".TIPO_OPERACION,');
             SQL.Add('"col$extracto".SALDO_ANTERIOR_EXTRACTO,');
             SQL.Add('"col$extracto".ABONO_CAPITAL,');
             SQL.Add('"col$extracto".ABONO_CXC,');
             SQL.Add('"col$extracto".ABONO_ANTICIPADO,');
             SQL.Add('"col$extracto".ABONO_SERVICIOS,');
             SQL.Add('"col$extracto".ABONO_MORA,');
             SQL.Add('"col$extracto".ABONO_SEGURO,');
             SQL.Add('"col$extracto".ABONO_PAGXCLI,');
             SQL.Add('"col$extracto".ABONO_HONORARIOS,');
             SQL.Add('"col$extracto".ABONO_OTROS,');
             SQL.Add('"col$extracto".TASA_INTERES_LIQUIDACION,');
             SQL.Add('"col$extracto".ID_EMPLEADO,');
             SQL.Add('"col$extracto".INTERES_PAGO_HASTA,');
             SQL.Add('"col$extracto".CAPITAL_PAGO_HASTA,');
             SQL.Add('"col$extracto".TIPO_ABONO,');
             SQL.Add('"col$tablaliquidacion".FECHA_A_PAGAR,');
             SQL.Add('"col$tablaliquidacion".CAPITAL_A_PAGAR,');
             SQL.Add('"col$tablaliquidacion".INTERES_A_PAGAR');
             SQL.Add('FROM ');
             SQL.Add('"col$extracto" LEFT JOIN "col$tablaliquidacion" ON ');
             SQL.Add('("col$extracto".ID_AGENCIA = "col$tablaliquidacion".ID_AGENCIA) AND');
             SQL.Add('("col$extracto".ID_COLOCACION = "col$tablaliquidacion".ID_COLOCACION) AND');
             SQL.Add('("col$tablaliquidacion".CUOTA_NUMERO = "col$extracto".CUOTA_EXTRACTO)');
             SQL.Add(' WHERE ');
             SQL.Add('("col$extracto".ID_AGENCIA =:"ID_AGENCIA") AND');
             SQL.Add('("col$extracto".ID_COLOCACION =:"ID_COLOCACION")');
             SQL.Add(' ORDER BY "col$extracto".FECHA_EXTRACTO,"col$extracto".HORA_EXTRACTO, "col$extracto".CUOTA_EXTRACTO');

             ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
             ParamByName('ID_COLOCACION').AsString := vcolocacion;
             Open;

             While not IBQExtractocol.Eof do begin
                Extracto.Append;
                Extracto.FieldByName('FECHA').AsDateTime  := IBQExtractocol.FieldByName('FECHA_EXTRACTO').AsDateTime;
                Extracto.FieldByName('NO_COMP').AsInteger := IBQExtractocol.FieldByName('ID_CBTE_COLOCACION').AsInteger;
                Extracto.FieldByName('CUOTA').AsInteger := IBQExtractocol.FieldByName('CUOTA_EXTRACTO').AsInteger;
                Extracto.FieldByName('CAPITAL').AsString := FormatCurr('#,##0.00',IBQExtractocol.FieldByName('ABONO_CAPITAL').AsCurrency);
                Extracto.FieldByName('TASA').AsFloat := SimpleRoundTo(IBQExtractocol.FieldByName('TASA_INTERES_LIQUIDACION').AsFloat);
                if IBQExtractoCol.FieldByName('TIPO_ABONO').AsInteger <> 0 then
                   Extracto.FieldByName('INTERES').AsString := '-(' + FormatCurr('#,##0.00',IBQExtractocol.FieldByName('ABONO_ANTICIPADO').AsCurrency) + ')'
                else
                   begin
                     Extracto.FieldByName('INTERES').AsString := FormatCurr('#,##0.00',IBQExtractocol.FieldByName('ABONO_ANTICIPADO').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_SERVICIOS').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_CXC').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_MORA').AsCurrency);
                     Intereses := Intereses + (IBQExtractocol.FieldByName('ABONO_ANTICIPADO').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_SERVICIOS').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_CXC').AsCurrency +
                                                      IBQExtractocol.FieldByName('ABONO_MORA').AsCurrency);
                   end;
                Extracto.FieldByName('SALDO').AsString := FormatCurr('#,##0.00',IBQExtractocol.FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency - IBQExtractocol.FieldByName('ABONO_CAPITAL').AsCurrency);
                if IBQExtractocol.FieldByName('CUOTA_EXTRACTO').AsInteger = 0 then
                 begin
                   Extracto.FieldByName('FECHA_VENC').AsString := '0000/00/00';
                   Extracto.FieldByName('CAPITAL_VENC').AsString := FormatCurr('#,##0.00',0);
                 end
                else
                 begin
                   Extracto.FieldByName('FECHA_VENC').AsString := datetostr(IBQExtractocol.FieldByName('FECHA_A_PAGAR').AsDateTime);
                   Extracto.FieldByName('CAPITAL_VENC').AsString := FormatCurr('#,##0.00',IBQExtractocol.FieldByName('CAPITAL_A_PAGAR').AsCurrency + IBQExtractocol.FieldByName('INTERES_A_PAGAR').AsCurrency);
                 end;
                IBQuery1.Close;
                Extracto.FieldByName('INTERES_PAGO_HASTA').AsDateTime := IBQExtractocol.FieldByName('INTERES_PAGO_HASTA').AsDateTime;
                Extracto.FieldByName('CAPITAL_PAGO_HASTA').AsDateTime := IBQExtractocol.FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;
                Extracto.Post;
                IBQExtractoCol.Next;
             end; // While ExtractoCol
             Close;

             ReporExtractocol.Variables.ByName['Empresa'].AsString := Empresa;
             ReporExtractoCol.Variables.ByName['Hoy'].AsDateTime := Now;
             ReporExtractoCol.Variables.ByName['Intereses'].AsDouble := Intereses;
             ReporExtractoCol.Variables.ByName['TotalAbonoCapital'].AsDouble := TotalAbonoCapital;
             ReporExtractoCol.Variables.ByName['empleado'].AsString := Nombres + ' ' + Apellidos;
             ReporExtractoCol.Variables.ByName['TasaNominal'].AsDouble := TasaNominal;

             if ReporExtractoCol.PrepareReport then
              begin
                frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
                frmVistaPreliminar.Reporte := ReporExtractoCol;
                frmVistaPreliminar.Vista.Font.Size := 8;
                frmVistaPreliminar.ShowModal;
              end;


            IBQExtractocol.Close;
           end; // with ExtractoCol
          IBQcol.Close;
          end // fin Recordcount IBQCol
          else
          begin
            MessageDlg('Número de Colocación No Existe',mtError,[mbOK],0);
            Exit;
            EdNumeroColocacion.SetFocus;
          end;
        end;  // with IBQCol
        IBTExtracto.Commit;
end;

procedure TFrmExtractoColocacion.Empleado;
begin
        with IBQuery do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
         end;
end;

procedure TFrmExtractoColocacion.Inicializar;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;

        dmGeneral.IBTransaction1.StartTransaction;

        IBAgencia.Active := True;
        IBAgencia.Last;
        EdAgencia.KeyValue := Agencia;
        if Colocacion <> '' then
         begin
           vcolocacion := Colocacion;
           CmdAceptar.Click;
           Colocacion := '';
         end
        else
         begin
           EdNumeroColocacion.Text := '';
           EdNumeroColocacion.SetFocus;
         end;
         Extracto.CancelUpdates;
end;

procedure TFrmExtractoColocacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := caFree;
end;

procedure TFrmExtractoColocacion.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TFrmExtractoColocacion.EdNumeroColocacionEnter(Sender: TObject);
begin
        EdNumeroColocacion.SelectAll;
end;

procedure TFrmExtractoColocacion.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TFrmExtractoColocacion.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBTExtracto.DefaultDatabase := dmGeneral.IBDatabase1;
        IBQExtractoCol.Database := dmGeneral.IBDatabase1;
        IBQExtractoCol.Transaction := dmGeneral.IBTransaction1;
        IBQuery.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery.Transaction := dmGeneral.IBTransaction1;
        IBQCol.Database := dmGeneral.IBDatabase1;
        IBQCol.Transaction := dmGeneral.IBTransaction1;
        IBQTabla.Database := dmGeneral.IBDatabase1;
        IBQTabla.Transaction := dmGeneral.IBTransaction1;
        IBAgencia.Database := dmGeneral.IBDatabase1;
        IBAgencia.Transaction := dmGeneral.IBTransaction1;
end;

end.


