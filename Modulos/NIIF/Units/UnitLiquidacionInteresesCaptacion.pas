unit UnitLiquidacionInteresesCaptacion;

interface

uses
  Windows, Messages, Math, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DBCtrls, IBSQL, DB,
  IBCustomDataSet, IBQuery, ExtCtrls, JvComponent, JvDlg, pr_Common,
  pr_TxClasses, UnitPantallaProgreso, IBStoredProc, IB, DBClient,
  IBDatabase, unitDmGeneral;

type
  TfrmLiquidacionInteresesCaptacion = class(TForm)
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label3: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    EdFecha: TDateTimePicker;
    IBPagar: TIBSQL;
    IBDias: TIBSQL;
    RadioTipoLiquidacion: TRadioGroup;
    IBCaptacion: TIBSQL;
    IBTiposCaptacion: TIBQuery;
    DSTiposCaptacion: TDataSource;
    IBALiquidar: TIBQuery;
    Panel1: TPanel;
    CmdLiquidar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    CmdAplicar: TBitBtn;
    IBLiquidacion: TIBQuery;
    IBContabilizacion: TIBQuery;
    Label1: TLabel;
    EdTasaN: TStaticText;
    Label2: TLabel;
    EdSaldoMinimo: TStaticText;
    IBAuxiliar: TIBQuery;
    IBDComprobante: TIBDataSet;
    IBDAuxiliar: TIBDataSet;
    CmdComprobante: TBitBtn;
    IBConsulta: TIBQuery;
    Label4: TLabel;
    EdComprobante: TStaticText;
    IBTotalCaptaciones: TIBStoredProc;
    IBTotalCaptacionesTOTAL: TIntegerField;
    IBSQL1: TIBSQL;
    IBAuxiliarID_COMPROBANTE: TIntegerField;
    IBAuxiliarDESCRIPCION_AGENCIA: TIBStringField;
    IBAuxiliarTIPO: TIBStringField;
    IBAuxiliarFECHADIA: TDateField;
    IBAuxiliarDESCRIPCION: TMemoField;
    IBAuxiliarPRIMER_APELLIDO: TIBStringField;
    IBAuxiliarSEGUNDO_APELLIDO: TIBStringField;
    IBAuxiliarNOMBRE: TIBStringField;
    IBAuxiliarCODIGO: TIBStringField;
    IBAuxiliarCUENTA: TIBStringField;
    IBAuxiliarDEBITO: TIBBCDField;
    IBAuxiliarCREDITO: TIBBCDField;
    ReporteC: TprTxReport;
    IBSQL2: TIBSQL;
    IBTransaction1: TIBTransaction;
    Reporte: TprTxReport;
    CDSContractual: TClientDataSet;
    CDSContractualID_AGENCIA: TIntegerField;
    CDSContractualID_TIPO_CAPTACION: TIntegerField;
    CDSContractualNUMERO_CUENTA: TIntegerField;
    CDSContractualDIGITO_CUENTA: TIntegerField;
    CDSContractualID_IDENTIFICACION: TIntegerField;
    CDSContractualID_PERSONA: TStringField;
    CDSContractualNOMBRE: TStringField;
    CDSContractualDESCUENTO: TCurrencyField;
    CDSContractualID_TIPO_CAPTACION_D: TIntegerField;
    CDSContractualNUMERO_CUENTA_D: TIntegerField;
    CDSContractualDIGITO_CUENTA_D: TIntegerField;
    CDSContractualESTADO: TStringField;
    CDSContractualFECHA_DESCUENTO: TDateField;
    CDSContractualCUOTA: TStringField;
    CDSContractualDIAS: TIntegerField;
    CdSaldo: TClientDataSet;
    CdSaldoCUENTA: TIntegerField;
    CdSaldoDIGITO: TIntegerField;
    CdSaldoVALOR: TCurrencyField;
    CdSaldoTOTAL: TAggregateField;
    ReporteCon: TprTxReport;
    IbComprobante: TIBQuery;
    IbAux: TIBQuery;
    Reporte1: TprTxReport;
    procedure CmdCerrarClick(Sender: TObject);
    procedure RadioTipoLiquidacionClick(Sender: TObject);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure DBLCBTipoCaptacionEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure CmdComprobanteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure CasoAhorros(tipo:Integer;cada:Integer;TasaN:Double);
    procedure CasoCertificados;
    procedure Inicializar;
    procedure CasoProgramado;
    procedure AplicarProgramado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLiquidacionInteresesCaptacion: TfrmLiquidacionInteresesCaptacion;
  dmGeneral: TdmGeneral;
  Liquidado:Boolean;
  TasaR:Extended;
  DiarioR:Currency;
  SaldoMinimo:Currency;
  Tabla:string;
  Codigo_Captacion:string;
  Codigo_Captacion2:string;
  Codigo_Captacion4:string;
  TotalCapta2:Currency;
  TotalCapta4:Currency;
  TotalCapta2R:Currency;
  TotalCapta4R:Currency;
  TotalCapta2RMes:Currency;
  TotalCapta4RMes:Currency;
  Comprobante :Integer;
  frmProgreso:TfrmProgreso;
  aporte,ahorro,certificado,programado:Boolean;

implementation

{$R *.dfm}

uses  UnitCaptaciones, UnitGlobalesCol, UnitGlobales,
  UnitdmLiquidacionCaptacion, unitMain;

procedure TfrmLiquidacionInteresesCaptacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLiquidacionInteresesCaptacion.RadioTipoLiquidacionClick(
  Sender: TObject);
begin
        if ( RadioTipoLiquidacion.ItemIndex <> -1) and
           ( Liquidado = False) then
           CmdLiquidar.Enabled := True
        else
           CmdLiquidar.Enabled := False;
end;

procedure TfrmLiquidacionInteresesCaptacion.CmdLiquidarClick(
  Sender: TObject);
var forma:Integer;
    interesCada :Integer;
    interes :Double;
begin
        CmdLiquidar.Enabled := False;
        aporte := False;
        ahorro := False;
        certificado:=False;
        programado:=False;
        DBLCBTipoCaptacion.Enabled := False;
        EdFecha.Enabled := False;
        RadioTipoLiquidacion.Enabled := False;
        frmProgreso := TfrmProgreso.Create(Self);
        frmProgreso.Titulo := 'Liquidando Intereses ' + DBLCBTipoCaptacion.Text + ' - Progreso';
        frmProgreso.Min := 0;
        frmProgreso.Max := 100;
        frmProgreso.Position := 0;
        frmProgreso.InfoLabel := '';
        frmProgreso.Ejecutar;
        frmProgreso.InfoLabel := 'Buscando Tasa Retención en la Fuente';
        Application.ProcessMessages;
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select DIARIO_RETEFUENTE, TASA_RETEFUENTE from "gen$valorretefuente"');
             try
                Open;
                DiarioR := FieldByName('DIARIO_RETEFUENTE').AsCurrency;
                TasaR := FieldByName('TASA_RETEFUENTE').AsFloat;
             except
                DiarioR := 0;
                TasaR := 0;
             end;
             Close;
        end;

        if TasaR <> 0 then
           TasaR := TasaNominalVencida(TasaR,30);

        frmProgreso.InfoLabel := 'Buscando Tasa Interés y Saldo Mínimo';
        Application.ProcessMessages;
        with IBCaptacion do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$tipocaptacion" where ');
            SQL.Add('ID_TIPO_CAPTACION = :"ID"');
            ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
            try
              Application.ProcessMessages;
              ExecQuery;
            except
              frmProgreso.Cerrar;
              MessageDlg('Error Localizando Captacion',mtError,[mbcancel],0);
              Exit;
            end;
            Codigo_Captacion := FieldByName('CODIGO_CONTABLE').AsString;
            forma := FieldByName('ID_FORMA').AsInteger;
            interes := FieldByName('INTERES_EFECTIVO').AsDouble;
            SaldoMinimo := FieldByName('SALDO_MINIMO_PARA_INTERES').AsCurrency;
            interesCada:= FieldByName('INTERES_CADA').AsInteger;
            interes := TasaNominalVencida(interes,30);
            EdTasaN.Caption := FormatCurr('#0.00%',interes);
            EdSaldoMinimo.Caption := FormatCurr('$#,#0.00',SaldoMinimo);
// Buscar Codigo de Ordinario
            Close;
            ParamByName('ID').AsInteger := 2;
            try
              Application.ProcessMessages;
              ExecQuery;
            except
              frmProgreso.Cerrar;
              MessageDlg('Error Localizando Captacion 2',mtError,[mbcancel],0);
              Exit;
            end;
            Codigo_Captacion2 := FieldByName('CODIGO_CONTABLE').AsString;
// Buscar Codigo Juvenil
            Close;
            ParamByName('ID').AsInteger := 4;
            try
              Application.ProcessMessages;
              ExecQuery;
            except
              frmProgreso.Cerrar;
              MessageDlg('Error Localizando Captacion 4',mtError,[mbcancel],0);
              Exit;
            end;
            Codigo_Captacion4 := FieldByName('CODIGO_CONTABLE').AsString;
//Fin Buscar Codigos
            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$tiposforma" where ');
            SQL.Add('ID_FORMA = :"ID"');
            ParamByName('ID').AsInteger := forma;
            try
              Application.ProcessMessages;
              ExecQuery;
            except
              frmProgreso.Cerrar;
              MessageDlg('Error Localizando Forma',mtError,[mbcancel],0);
              Exit;
            end;

            if FieldByName('APORTE').AsInteger <> 0 then aporte := True;
            if FieldByName('AHORRO').AsInteger <> 0 then ahorro := True;
            if FieldByName('CERTIFICADO').AsInteger <> 0 then certificado := True;
            if FieldByName('PROGRAMADO').AsInteger <> 0 then programado := True;
            Close;
        end;

        frmProgreso.InfoLabel := 'Verificando Fecha de Liquidación';

        with IBDias do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select * from "cap$diasliquidados" where ');
             SQL.Add('ID_TIPO_CAPTACION = :"ID" and FECHA_LIQUIDADA = :"FECHA"');
             ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('FECHA').AsDate := EdFecha.Date;
             try
               ExecQuery;
             except
               frmProgreso.Cerrar;
               MessageDlg('Error Localizando Fecha',mtError,[mbcancel],0);
               Exit;
             end;
             if RecordCount > 0 then
                if FieldByName('LIQUIDADA').AsInteger <> 0 then
                begin
                   frmProgreso.Cerrar;
                   MessageDlg('Intereses de este día ya fueron liquidados, '+#13+
                               'Captación: ' + DBLCBTipoCaptacion.Text,mtInformation,[mbok],0);
                   Exit;
                end;
        end;

        if ahorro then CasoAhorros(DBLCBTipoCaptacion.KeyValue,interesCada,interes);
        if certificado then CasoCertificados;

        if programado then CasoProgramado;

end;

procedure TfrmLiquidacionInteresesCaptacion.CasoAhorros(Tipo:Integer;cada:Integer;TasaN:Double);
var MinCaptacion,MaxCaptacion:Integer;
    Ag,Numero,Digito:Integer;
    L:tInteres;
    FechaCorte:TDate;
begin
          MinCaptacion := 1;
          MaxCaptacion := 1;

          FechaCorte := EdFecha.Date;

          frmProgreso.InfoLabel := 'Buscando Captaciones a Liquidar';

          with IBTotalCaptaciones do
          begin
              StoredProcName := 'P_CAP_0001';
              ParamByName('ID').AsInteger := tipo;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Prepare;
                 ExecProc;
                 Screen.Cursor := crDefault;
              except
                 frmProgreso.Cerrar;
                 MessageDlg('Error Localizando Captaciones a Liquidar',mtError,[mbcancel],0);
                 Exit;
              end;
              MaxCaptacion := ParamByName('TOTAL').AsInteger;
              if MaxCaptacion = 0 then
              begin
                 frmProgreso.Cerrar;
                 MessageDlg('No existen captaciones a las cuales liquidarles intereses',mtInformation,[mbok],0);
                 if dmGeneral.IBTransaction1.InTransaction then
                    dmGeneral.IBTransaction1.RollbackRetaining;
                 Exit;
              end;
              Close;
// Crear Tabla Temporal
              frmProgreso.InfoLabel := 'Creando Tabla Temporal';
          end;

          Application.ProcessMessages;
          Tabla := '"liq' + FloatToStr(Date) + FloatToStr(Time)+IntToStr(DBLCBTipoCaptacion.KeyValue) + '"';
          IBConsulta.Close;
          IBConsulta.SQL.Clear;
          IBConsulta.SQL.Add('create table ' + Tabla + '(');
          IBConsulta.SQL.Add('ID_AGENCIA TIPOS,');
          IBConsulta.SQL.Add('ID_TIPO_CAPTACION TIPOS,');
          IBConsulta.SQL.Add('NUMERO_CUENTA TIPO_CAPTACION,');
          IBConsulta.SQL.Add('DIGITO_CUENTA TIPOS,');
          IBConsulta.SQL.Add('ID_IDENTIFICACION TIPOS,');
          IBConsulta.SQL.Add('ID_PERSONA VARCHAR(15),');
          IBConsulta.SQL.Add('NOMBRE VARCHAR(150),');
          IBConsulta.SQL.Add('SALDO_ACTUAL NUMERICO,');
          IBConsulta.SQL.Add('SALDO_LIQUIDACION NUMERICO,');
          IBConsulta.SQL.Add('INTERES NUMERICO,');
          IBConsulta.SQL.Add('RETENCION NUMERICO )');
          try
              IBConsulta.ExecSQL;
              IBConsulta.Transaction.CommitRetaining;
              IBConsulta.Close;
          except
              frmProgreso.Cerrar;
              MessageDlg('No se pudo crear la tabla temporal para la liquidación',mtError,[mbcancel],0);
              Exit;
          end;
// Fin creación tabla temporal
          frmProgreso.InfoLabel := 'Iniciando Proceso de Liquidación';

        with IBALiquidar do
        begin
              SQL.Clear;
              SQL.Add('SELECT ');
              SQL.Add('* FROM P_CAP_0002 (:ID)');
              ParamByName('ID').AsInteger := tipo;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Open;
                 Screen.Cursor := crDefault;
              except
                 frmProgreso.Cerrar;
                 MessageDlg('Error Localizando Captaciones a Liquidar',mtError,[mbcancel],0);
                 Exit;
              end;

              frmProgreso.Min  := MinCaptacion;
              frmProgreso.Max := MaxCaptacion;
              frmProgreso.Position:= 1;
              Screen.Cursor := crHourGlass;
              CmdCerrar.Enabled := False;
              IBConsulta.Close;
              IBConsulta.SQL.Clear;
              IBConsulta.SQL.Add('insert into ' + Tabla + ' values (');
              IBConsulta.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
              IBConsulta.SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NOMBRE",:"SALDO_ACTUAL",:"SALDO_LIQUIDACION",');
              IBConsulta.SQL.Add(':"INTERES",:"RETENCION")');
              while not Eof do
              begin
                Application.ProcessMessages;
                frmProgreso.InfoLabel := 'Liquidando Captacion:' + IntToStr(DBLCBTipoCaptacion.KeyValue) + '-' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Numero := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                frmProgreso.Position := RecNo;
                case cada of
                  1: begin
                       L := InteresDiario(ag,tipo,numero,digito,FechaCorte,TasaN,SaldoMinimo,DiarioR,TasaR);
                       IBConsulta.ParamByName('ID_AGENCIA').AsInteger := Ag;
                       IBConsulta.ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
                       IBConsulta.ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                       IBConsulta.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                       IBConsulta.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                       IBConsulta.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                       IBConsulta.ParamByName('NOMBRE').AsString := FieldbyName('PRIMER_APELLIDO').AsString + ' ' +
                                                                    FieldbyName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                                    FieldbyName('NOMBRE').AsString;
                       IBConsulta.ParamByName('SALDO_ACTUAL').AsCurrency := L.SaldoAFecha;
                       IBConsulta.ParamByName('SALDO_LIQUIDACION').AsCurrency := L.SaldoLiquidacion;
                       IBConsulta.ParamByName('INTERES').AsCurrency := L.Interes;
                       if not InttoBoolean(FieldByName('RETEFUENTE').AsInteger) then
                          L.Retencion := 0;
                       IBConsulta.ParamByName('RETENCION').AsCurrency := L.Retencion;
                       if L.Interes <> 0 then
                       try
                         IBConsulta.ExecSQL;
                       except
                         frmProgreso.Cerrar;
                         MessageDlg('No se pudo almacenar el temporal de la liquidación',mtError,[mbcancel],0);
                         frmProgreso.Cerrar;
                         CmdCerrar.Enabled := True;
                         Transaction.Rollback;
                         Exit;
                       end;
                     end;
                end;
                Next;
              end;
              Transaction.Commit;
              Close;
              frmProgreso.Cerrar;
              Screen.Cursor := crDefault;
              CmdLiquidar.Enabled := False;
              CmdVer.Enabled := True;
              CmdCerrar.Enabled := True;
          end;
          IBLiquidacion.Close;
          IBLiquidacion.SQL.Clear;
          IBLiquidacion.SQL.Add('select * from '+Tabla);
          MessageDlg('Proceso de Liquidación Culminado con Exito!',mtInformation,[mbok],0);
          Liquidado := True;
          RadioTipoLiquidacion.Enabled := False;
          if RadioTipoLiquidacion.ItemIndex = 1 then
             CmdAplicar.Enabled := True;

end;

procedure TfrmLiquidacionInteresesCaptacion.CasoCertificados;
var MinCaptacion,MaxCaptacion:Integer;
    Ag,Numero,Digito:Integer;
    L:tInteres;
    FechaCorte:TDate;
    Valor:Currency;
    TipoI:string;
    CodTipoI:Integer;
    TasaN:Double;
    Retefuente:Currency;
    UltimoPago:TDate;
    Puntos:Double;
    Moda:string;
    Amor:Integer;
begin
          TotalCapta2:=0;
          TotalCapta4:=0;
          TotalCapta2R:=0;
          TotalCapta4R:=0;
          TotalCapta2RMes:=0;
          TotalCapta4RMes:=0;
          MinCaptacion := 1;
          MaxCaptacion := 1;

          FechaCorte := EdFecha.Date;

          frmProgreso.InfoLabel := 'Buscando Captaciones a Liquidar';

          with IBTotalCaptaciones do
          begin
              StoredProcName := 'P_CAP_0003';
              ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
              ParamByName('FECHA').AsDate := EdFecha.Date;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Prepare;
                 ExecProc;
                 Screen.Cursor := crDefault;
              except
                 frmProgreso.Cerrar;
                 MessageDlg('Error Localizando Captaciones a Liquidar',mtError,[mbcancel],0);
                 Exit;
              end;
              MaxCaptacion := ParamByName('TOTAL').AsInteger;
              if MaxCaptacion = 0 then
              begin
                 frmProgreso.Cerrar;
                 MessageDlg('No existen captaciones a las cuales liquidarles intereses',mtInformation,[mbok],0);
                 if dmGeneral.IBTransaction1.InTransaction then
                    dmGeneral.IBTransaction1.RollbackRetaining;
                 Exit;
              end;
              Close;
// Crear Tabla Temporal
              frmProgreso.InfoLabel := 'Creando Tabla Temporal';
          end;

          Application.ProcessMessages;
          Tabla := '"liq' + FloatToStr(Date) + IntToStr(DBLCBTipoCaptacion.KeyValue) + '"';
          IBConsulta.Close;
          IBConsulta.SQL.Clear;
          IBConsulta.SQL.Add('create table ' + Tabla + '(');
          IBConsulta.SQL.Add('ID_AGENCIA TIPOS,');
          IBConsulta.SQL.Add('ID_TIPO_CAPTACION TIPOS,');
          IBConsulta.SQL.Add('NUMERO_CUENTA TIPO_CAPTACION,');
          IBConsulta.SQL.Add('DIGITO_CUENTA TIPOS,');
          IBConsulta.SQL.Add('ID_IDENTIFICACION TIPOS,');
          IBConsulta.SQL.Add('ID_PERSONA VARCHAR(15),');
          IBConsulta.SQL.Add('NOMBRE VARCHAR(150),');
          IBConsulta.SQL.Add('ID_TIPO_CAPTACION_ABONO TIPOS,');
          IBConsulta.SQL.Add('NUMERO_CUENTA_ABONO TIPO_CAPTACION,');
          IBConsulta.SQL.Add('SALDO_ACTUAL NUMERICO,');
          IBConsulta.SQL.Add('TASA_LIQUIDACION DOUBLE PRECISION,');
          IBConsulta.SQL.Add('DIAS INTEGER,');
          IBConsulta.SQL.Add('INTERES NUMERICO,');
          IBConsulta.SQL.Add('CAUSADO NUMERICO,');
          IBConsulta.SQL.Add('RETENCION NUMERICO,');
          IBConsulta.SQL.Add('RETEINTERES NUMERICO,');
          IBConsulta.SQL.Add('RETECAUSADO NUMERICO,');
          IBConsulta.SQL.Add('NETO NUMERICO )');
          try
              IBConsulta.ExecSQL;
              IBConsulta.Transaction.CommitRetaining;
              IBConsulta.Close;
          except
              frmProgreso.Cerrar;
              MessageDlg('No se pudo crear la tabla temporal para la liquidación',mtError,[mbcancel],0);
              Exit;
          end;
// Fin creación tabla temporal
          frmProgreso.InfoLabel := 'Iniciando Proceso de Liquidación';

        with IBALiquidar do
        begin
            SQL.Clear;
            SQL.Add('select * from P_CAP_0004 (:ID, :FECHA)');
            ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('FECHA').AsDate := FechaCorte;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Open;
                 Screen.Cursor := crDefault;
              except
                 frmProgreso.Cerrar;
                 MessageDlg('Error Localizando Captaciones a Liquidar',mtError,[mbcancel],0);
                 CmdCerrar.Enabled := True;
                 Exit;
              end;

              frmProgreso.Min  := MinCaptacion;
              frmProgreso.Max := MaxCaptacion;
              frmProgreso.Position:= 1;
              CmdCerrar.Enabled := False;
              IBConsulta.Close;
              IBConsulta.SQL.Clear;
              IBConsulta.SQL.Add('insert into ' + Tabla + ' values (');
              IBConsulta.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
              IBConsulta.SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NOMBRE",:ID_TIPO_ABONO,:NUMERO_ABONO,');
              IBConsulta.SQL.Add(':"SALDO_ACTUAL",:"TASA_LIQUIDACION",:"DIAS",');
              IBConsulta.SQL.Add(':"INTERES",:"CAUSADO",:"RETENCION",:"RETEINTERES",:"RETECAUSADO",:"NETO")');
              while not Eof do
              begin
                Application.ProcessMessages;
                frmProgreso.InfoLabel := 'Liquidando Captacion:' + IntToStr(DBLCBTipoCaptacion.KeyValue) + '-' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Numero := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                frmProgreso.Position := RecNo;
                Valor := FieldByName('VALOR_INICIAL').AsCurrency;
                UltimoPago := FieldByName('FECHA_ULTIMO_PAGO').AsDateTime;
                TipoI := FieldByName('TIPO_INTERES').AsString;
                CodTipoI := FieldByName('ID_INTERES').AsInteger;
                TasaN := FieldByName('TASA_EFECTIVA').AsFloat;
                Puntos := FieldByName('PUNTOS_ADICIONALES').AsFloat;
                Moda := FieldByName('MODALIDAD').AsString;
                Amor := FieldByName('AMORTIZACION').AsInteger;
// Evaluar Fecha Ultimo Pago
                if UltimoPago < FieldByName('FECHA_APERTURA').AsDateTime then
                   UltimoPago := FieldByName('FECHA_APERTURA').AsDateTime;
                if UltimoPago < FieldByName('FECHA_PRORROGA').AsDateTime then
                   UltimoPago := FieldByName('FECHA_PRORROGA').AsDateTime;

// Evaluar la tasa a liquidar
                if TipoI = 'V' then
                with IBSQL1 do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select VALOR_ACTUAL_TASA from "col$tasasvariables" where');
                    SQL.Add('ID_INTERES = :"ID"');
                    ParamByName('ID').AsInteger := CodTipoI;
                    try
                      ExecQuery;
                      TasaN := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
                    except
                      MessageDlg('Error obteniendo tasa:' + IntToStr(CodTipoI),mtError,[mbcancel],0);
                      TasaN := 0;
                    end;
                    Close;
                end;

                if Moda = 'A' then
                   TasaN := TasaNominalAnticipada(TasaN,Amor)
                else
                   TasaN := TasaNominalVencida(TasaN,Amor);

                if Puntos < 0 then Puntos := 0;

                TasaN := TasaN + Puntos;

                L := InteresCertificado(Valor,FechaCorte,TasaN,DiarioR,TasaR,UltimoPago,Amor);
                IBConsulta.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                IBConsulta.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBConsulta.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBConsulta.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                IBConsulta.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                IBConsulta.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                IBConsulta.ParamByName('NOMBRE').AsString := FieldbyName('PRIMER_APELLIDO').AsString + ' ' +
                                                                    FieldbyName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                                    FieldbyName('NOMBRE').AsString;
                IBConsulta.ParamByName('ID_TIPO_ABONO').AsInteger := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                IBConsulta.ParamByName('NUMERO_ABONO').AsInteger := FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
                IBConsulta.ParamByName('SALDO_ACTUAL').AsCurrency := L.SaldoAFecha;
                IBConsulta.ParamByName('TASA_LIQUIDACION').AsFloat := L.TasaLiquidacion;
                IBConsulta.ParamByName('DIAS').AsInteger := L.DiasLiquidacion;
                IBConsulta.ParamByName('INTERES').AsCurrency := L.Interes;
                IBConsulta.ParamByName('CAUSADO').AsCurrency := L.Causado;
                if FieldByName('RETEFUENTE').AsInteger = 0 then
                begin
                   L.Retencion := 0;
                   L.ReteInteres := 0;
                   L.ReteCausado := 0;
                end;
                IBConsulta.ParamByName('RETENCION').AsCurrency := L.Retencion;
                IBConsulta.ParamByName('RETEINTERES').AsCurrency := L.ReteInteres;
                IBConsulta.ParamByName('RETECAUSADO').AsCurrency := L.ReteCausado;
                IBConsulta.ParamByName('NETO').AsCurrency := L.Interes + L.Causado - L.Retencion;
                try
                  IBConsulta.ExecSQL;
                  IBConsulta.Close;
                except
                  frmProgreso.Cerrar;
                  MessageDlg('No se pudo guardar en la tabla temporal',mterror,[mbcancel],0);
                  CmdCerrar.Enabled := True;
                  Exit;
                end;
                if FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger = 2 then begin
                   TotalCapta2 := TotalCapta2 + L.Interes + L.Causado;
                   TotalCapta2R := TotalCapta2R + L.Retencion;
                   TotalCapta2RMes := TotalCapta2RMes + L.ReteInteres;
                end
                else
                if FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger = 4 then begin
                   TotalCapta4 := TotalCapta4 + L.Interes + L.Causado;
                   TotalCapta4R := TotalCapta4R + L.Retencion;
                   TotalCapta4RMes := TotalCapta4RMes + L.ReteInteres;
                end;
                Next;
              end;
          Close;
          Transaction.CommitRetaining;
        end;
          IBLiquidacion.Close;
          IBLiquidacion.SQL.Clear;
          IBLiquidacion.SQL.Add('select * from '+Tabla);
          frmProgreso.Cerrar;
          MessageDlg('Proceso de Liquidación Culminado con Exito!',mtInformation,[mbok],0);
          Liquidado := True;
          CmdLiquidar.Enabled := False;
          CmdVer.Enabled := True;
          CmdCerrar.Enabled := True;
          RadioTipoLiquidacion.Enabled := False;
          if RadioTipoLiquidacion.ItemIndex = 1 then
             CmdAplicar.Enabled := True;
        
end;

procedure TfrmLiquidacionInteresesCaptacion.Inicializar;
begin
     if dmGeneral.IBTransaction1.InTransaction then
        dmGeneral.IBTransaction1.Commit;

     dmGeneral.IBTransaction1.StartTransaction;
     IBTiposCaptacion.Open;
     IBTiposCaptacion.Last;
     EdFecha.Date := Date;

     Liquidado := False;

end;

procedure TfrmLiquidacionInteresesCaptacion.DBLCBTipoCaptacionEnter(
  Sender: TObject);
begin
        DBLCBTipoCaptacion.DropDown;
end;

procedure TfrmLiquidacionInteresesCaptacion.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmLiquidacionInteresesCaptacion.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;
        dmLiquidacionCaptacion:=TdmLiquidacionCaptacion.Create(Self);
        dmLiquidacionCaptacion.IBConsulta.Database := dmGeneral.IBDatabase1;
        dmLiquidacionCaptacion.IBConsulta.Transaction := dmGeneral.IBTransaction1;

        IBPagar.Database := dmGeneral.IBDatabase1;
        IBDias.Database := dmGeneral.IBDatabase1;
        IBCaptacion.Database := dmGeneral.IBDatabase1;
        IBTiposCaptacion.Database := dmGeneral.IBDatabase1;
        IBALiquidar.Database := dmGeneral.IBDatabase1;
        IBLiquidacion.Database := dmGeneral.IBDatabase1;
        IBContabilizacion.Database := dmGeneral.IBDatabase1;
        IBAuxiliar.Database := dmGeneral.IBDatabase1;
        IBDComprobante.Database := dmGeneral.IBDatabase1;
        IBDAuxiliar.Database := dmGeneral.IBDatabase1;
        IBConsulta.Database := dmGeneral.IBDatabase1;
        IBTotalCaptaciones.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IbComprobante.Database := dmGeneral.IBDatabase1;
        IbAux.Database := dmGeneral.IBDatabase1;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;

        IBPagar.Transaction := dmGeneral.IBTransaction1;
        IBDias.Transaction := dmGeneral.IBTransaction1;
        IBCaptacion.Transaction := dmGeneral.IBTransaction1;
        IBTiposCaptacion.Transaction := dmGeneral.IBTransaction1;
        IBALiquidar.Transaction := dmGeneral.IBTransaction1;
        IBLiquidacion.Transaction := dmGeneral.IBTransaction1;
        IBContabilizacion.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IBDComprobante.Transaction := dmGeneral.IBTransaction1;
        IBDAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IBConsulta.Transaction := dmGeneral.IBTransaction1;
        IBTotalCaptaciones.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Transaction := IBTransaction1;
        IbComprobante.Transaction := dmGeneral.IBTransaction1;
        IbAux.Transaction := dmGeneral.IBTransaction1;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;

end;

procedure TfrmLiquidacionInteresesCaptacion.FormDestroy(Sender: TObject);
begin
        dmLiquidacionCaptacion.Free;
        dmGeneral.Free;
end;

procedure TfrmLiquidacionInteresesCaptacion.CmdVerClick(Sender: TObject);
var NameAgencia:string;
    TipoLiquidacion:string;
begin

        if RadioTipoLiquidacion.ItemIndex = 0 then
           TipoLiquidacion := ' DE PRUEBA'
        else
           TipoLiquidacion := ' DEFINITIVA';
        if IBConsulta.Transaction.InTransaction then
           IBConsulta.Transaction.Rollback;
        IBConsulta.Transaction.StartTransaction;
        IBConsulta.Close;
        IBConsulta.SQL.Clear;
        IBConsulta.SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" ');
        IBConsulta.SQL.Add('where ID_AGENCIA = :"ID"');
        IBConsulta.ParamByName('ID').AsInteger := Agencia;
        try
          IBConsulta.Open;
          NameAgencia := IBConsulta.FieldByName('DESCRIPCION_AGENCIA').AsString;
        except
          NameAgencia := 'No Encontrado';
        end;
        IBConsulta.Close;
        if ahorro then
        with Reporte do
        begin
          Variables.ByName['EMPRESA'].AsString := Empresa;
          Variables.ByName['TASA'].AsString := EdTasaN.Caption;
          Variables.ByName['FECHACORTE'].AsDateTime := EdFecha.Date;
          Variables.ByName['SALDOMINIMO'].AsString := EdSaldoMinimo.Caption;
          Variables.ByName['AGENCIA'].AsString := NameAgencia;
          Variables.ByName['CAPTACION'].AsString := DBLCBTipoCaptacion.Text;
          Variables.ByName['NIT'].AsString := Nit;
          Variables.ByName['TIPOLIQUIDACION'].AsString := TipoLiquidacion;
          if PrepareReport then
             PreviewPreparedReport(True);
        end
        else
        if certificado then
        with Reporte1 do
        begin
          Variables.ByName['EMPRESA'].AsString := Empresa;
          Variables.ByName['TASA'].AsString := FormatCurr('#0.00%',TasaR);
          Variables.ByName['FECHACORTE'].AsDateTime := EdFecha.Date;
          Variables.ByName['SALDOMINIMO'].AsString := FormatCurr('$#,#0',DiarioR);
          Variables.ByName['AGENCIA'].AsString := NameAgencia;
          Variables.ByName['CAPTACION'].AsString := DBLCBTipoCaptacion.Text;
          Variables.ByName['NIT'].AsString := Nit;
          Variables.ByName['TIPOLIQUIDACION'].AsString := TipoLiquidacion;
          if PrepareReport then
             PreviewPreparedReport(True);
        end
        else
        if programado then
        with ReporteCon do
        begin
           LoadTemplateFromFile(FrmMain.Ruta1+'\reporte\RepContractualN.prt',False);
           Variables.ByName['EMPRESA'].AsString := Empresa;
           Variables.ByName['NIT'].AsString := Nit;
           Variables.ByName['FECHACORTE'].AsDateTime := EdFecha.Date;
           Variables.ByName['AGENCIA'].AsString := NameAgencia;
           Variables.ByName['TIPOLIQUIDACION'].AsString := TipoLiquidacion;
           if PrepareReport then
              PreviewPreparedReport(True);
       end;

end;

procedure TfrmLiquidacionInteresesCaptacion.CmdAplicarClick(
  Sender: TObject);
var TInteres:Currency;
    TRetefuente:Currency;
    TReteCausado:Currency;
    TReteInteres:Currency;
    TCaptacion:Currency;
    TCausado:Currency;
    TresxMil:Currency;
    Total:Currency;
    Codigo_Interes:string;
    Codigo_Retefuente:string;
    Codigo_Causados:string;
    Codigo_TresxMil:string;
    Codigo_Gasto:string;
    Codigo_Gasto3xmil:string;
    Registros:Integer;

    I, WaitCount, Tries:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;

begin

        if programado then
        begin
          AplicarProgramado;
          Exit;
        end;

        TInteres := 0;
        TRetefuente := 0;
        TReteCausado := 0;
        TReteInteres := 0;
        TCaptacion := 0;
        TCausado := 0;
        
        with IBConsulta do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select SUM(INTERES) as TINTERES from ' +Tabla);
           try
             Open;
           except
           end;
           TInteres := FieldByName('TINTERES').AsCurrency;
           Close;
           SQL.Clear;
           SQL.Add('select SUM(RETENCION) as TRETEFUENTE from ' +Tabla);
           try
             Open;
           except
           end;
           TRetefuente := FieldByName('TRETEFUENTE').AsCurrency;
           Close;
           if certificado then
           begin
            Close;
            SQL.Clear;
            SQL.Add('select SUM(CAUSADO) as TCAUSADO from ' +Tabla);
            try
              Open;
            except
            end;
            TCausado := FieldByName('TCAUSADO').AsCurrency;
            Close;
            SQL.Clear;
            SQL.Add('select SUM(RETEINTERES) as TRETEINTERES from' + Tabla);
            try
              Open;
            except
            end;
            TReteInteres := FieldByName('TRETEINTERES').AsCurrency;
            Close;
            SQL.Clear;
            SQL.Add('select SUM(RETECAUSADO) as TRETECAUSADO from' + Tabla);
            try
              Open;
            except
            end;
            TReteCausado := FieldByName('TRETECAUSADO').AsCurrency;
            Close;
          end;
           TresxMil := SimpleRoundTo(((TInteres + TCausado)/1000) * 4,0);
        end;

        with IBConsulta do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$contable" where ');
            SQL.Add('ID_CAPTACION = :"ID_CAPTACION" and ID_CONTABLE = :"ID_CONTABLE"');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 1;
            Open;
            Codigo_Retefuente := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 2;
            Open;
            Codigo_Interes := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 3;
            Open;
            Codigo_TresxMil := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 5;
            Open;
            Codigo_Gasto := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 30;
            Open;
            Codigo_Gasto3xmil := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            if certificado then begin
            Close;
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 6;
            Open;
            Codigo_Causados := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            end;
        end;

// Buscar Consecutivo
        Comprobante := ObtenerConsecutivo(IBSQL1,4);
// Fin Consecutivo

        EdComprobante.Caption := Format('%.7d',[Comprobante]);
        IBSQL1.Transaction.StartTransaction;
        with IBDComprobante do
        begin
           Open;
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('TIPO_COMPROBANTE').AsInteger := 4;
           FieldByName('FECHADIA').AsDateTime := EdFecha.Date;
           FieldByName('DESCRIPCION').AsString := 'Liquidación de Intereses ' + DBLCBTipoCaptacion.Text + ' En la Fecha';
           FieldByName('TOTAL_DEBITO').AsCurrency := TInteres + TRetefuente + TresxMil + TCausado;
           FieldByName('TOTAL_CREDITO').AsCurrency := TInteres + TRetefuente + TresxMil + TCausado;
           FieldByName('ESTADO').AsString := 'O';
           FieldByName('IMPRESO').AsInteger := 1;
           FieldByName('ANULACION').AsString := '';
           FieldByName('ID_EMPLEADO').AsString := DBAlias;
           Post;
        end;

        with IBDAuxiliar do
        begin
           Open;
        // Grabo Retención Crédito
           if TRetefuente > 0 then
            if certificado then
            begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := Codigo_Retefuente;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := TReteInteres;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            Post;
            end
            else
            begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := Codigo_Retefuente;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := TRetefuente;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            Post;
            end;
        // Grabo Retención Débito
           if TRetefuente > 0 then
           if certificado then begin
            if TotalCapta2R > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := EdFecha.Date;
              FieldByName('CODIGO').AsString := Codigo_Captacion2;
              FieldByName('DEBITO').AsCurrency := TotalCapta2R;
              FieldByName('CREDITO').AsCurrency := 0;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              Post;
             end;// if TotalCapta2R
            if TotalCapta4R > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := EdFecha.Date;
              FieldByName('CODIGO').AsString := Codigo_Captacion4;
              FieldByName('DEBITO').AsCurrency := TotalCapta4R;
              FieldByName('CREDITO').AsCurrency := 0;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              Post;
             end;// if TotalCapta4R
           end // if Certificado
           else
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := Codigo_Captacion;
            FieldByName('DEBITO').AsCurrency := TRetefuente;
            FieldByName('CREDITO').AsCurrency := 0;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            Post;
           end;// if TRetefuente
        // Grabo Interés Crédito
           if TInteres > 0 then
           if certificado then begin
            if TotalCapta2 > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := EdFecha.Date;
              FieldByName('CODIGO').AsString := Codigo_Captacion2;
              FieldByName('DEBITO').AsCurrency := 0;
              FieldByName('CREDITO').AsCurrency := TotalCapta2;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              Post;
             end;// if TotalCapta2
            if TotalCapta4 > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := EdFecha.Date;
              FieldByName('CODIGO').AsString := Codigo_Captacion4;
              FieldByName('DEBITO').AsCurrency := 0;
              FieldByName('CREDITO').AsCurrency := TotalCapta4;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              Post;
             end; // if TotalCapta4
           end //if Certificado
           else
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := EdFecha.Date;
            FieldByName('CODIGO').AsString := Codigo_Captacion;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := TInteres;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            Post;
           end;// if TInteres
        // Grabo Interés Débito
           if TInteres > 0 then begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := EdFecha.Date;
           FieldByName('CODIGO').AsString := Codigo_Interes;
           FieldByName('DEBITO').AsCurrency := TInteres;
           FieldByName('CREDITO').AsCurrency := 0;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           Post;
           end;
        // Grabo Causados Crédito
{           if TCausado > 0 then begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := EdFecha.Date;
           FieldByName('CODIGO').AsString := Codigo_Captacion;
           FieldByName('DEBITO').AsCurrency := 0;
           FieldByName('CREDITO').AsCurrency := TCausado;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           Post;
           end;
}
        // Grabo Causado Débito
           if TCausado > 0 then
           if certificado then
           begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := EdFecha.Date;
           FieldByName('CODIGO').AsString := Codigo_Causados;
           FieldByName('DEBITO').AsCurrency := TCausado-TReteCausado;
           FieldByName('CREDITO').AsCurrency := 0;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           Post;
           end
           else
           begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := EdFecha.Date;
           FieldByName('CODIGO').AsString := Codigo_Causados;
           FieldByName('DEBITO').AsCurrency := TCausado;
           FieldByName('CREDITO').AsCurrency := 0;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           Post;
           end;

        // Grabo TresxMil Crédito
           if TresxMil > 0 then begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := EdFecha.Date;
           FieldByName('CODIGO').AsString := Codigo_TresxMil;
           FieldByName('DEBITO').AsCurrency := 0;
           FieldByName('CREDITO').AsCurrency := TresxMil;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           Post;
           end;
        // Grabo TresxMil Débito
           if TresxMil > 0 then begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := EdFecha.Date;
           FieldByName('CODIGO').AsString := Codigo_Gasto3xmil;
           FieldByName('DEBITO').AsCurrency := TresxMil;
           FieldByName('CREDITO').AsCurrency := 0;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           Post;
           end;
        end;



        with IBConsulta do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as TOTAL from '+ Tabla);
           try
            Open;
           except
           end;
           Registros := FieldByName('TOTAL').AsInteger;
           Close;
           SQL.Clear;
           SQL.Add('select * from '+ Tabla);
           try
            Open;
           except
           end;

           frmprogreso := Tfrmprogreso.Create(Self);
           frmProgreso.Titulo := 'Liquidando Intereses ' + DBLCBTipoCaptacion.Text + ' - Progreso';
           frmProgreso.Min  := 1;
           frmProgreso.Max := Registros;
           frmProgreso.Position:= 1;
           frmProgreso.Ejecutar;

           while not Eof do
           begin
              Application.ProcessMessages;
              frmProgreso.Position := RecNo;
              frmProgreso.InfoLabel := 'Aplicando Interés a Captacion:' + IntToStr(DBLCBTipoCaptacion.KeyValue) + '-' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('insert into "cap$extracto" values(');
              IBPagar.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
              IBPagar.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
              IBPagar.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
              IBPagar.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
//Grabar Interes en Extracto
              if FieldByName('INTERES').AsCurrency > 0 then
              begin
                IBPagar.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := EdFecha.Date;
                IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                if certificado then
                   IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 15
                else
                   IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 7;
                IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                if certificado then
                  IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha TASA ' + FormatCurr('#0.00%',FieldByName('TASA_LIQUIDACION').AsFloat)
                else
                  IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha';                
                Total := IBConsulta.FieldByName('INTERES').AsCurrency;
                if certificado then
                  Total := Total + IBConsulta.FieldByName('CAUSADO').AsCurrency;
                IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := Total;
                IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Retención de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbok],0);
                   IBPagar.Transaction.RollbackRetaining;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Intereses de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbok],0);
                  IBPagar.Transaction.RollbackRetaining;
                  Exit;
                end;
              end;
              IBPagar.Close;
   // If Certificado Grabar en Cuenta de Abono
              if certificado then
                if Total > 0 then
                begin
                  IBPagar.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                  IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                  IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
                  IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger,Format('%.7d',[FieldByName('NUMERO_CUENTA_ABONO').AsInteger])));
                  IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := EdFecha.Date;
                  IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                  IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 15;
                  IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                  IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha ';
                  IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := Total;
                  IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                  try
                    IBPagar.ExecQuery;
                    if IBPagar.RowsAffected < 1 then
                    begin
                     MessageDlg('Error Grabando Intereses de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA_ABONO').AsInteger]),mtError,[mbok],0);
                     IBPagar.Transaction.RollbackRetaining;
                     Exit;
                    end
                  except
                    MessageDlg('Error Grabando Intereses de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA_ABONO').AsInteger]),mtError,[mbok],0);
                    IBPagar.Transaction.RollbackRetaining;
                    Exit;
                  end;
                IBPagar.Close;
                end;
   // Fin si Certificado
// Grabar Retención en Extracto
              if FieldByName('RETENCION').AsCurrency > 0 then
              begin
                IBPagar.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := EdFecha.Date;
                IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                if certificado then
                   IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 16
                else
                   IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 8;
                IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha';
                IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := 0;
                IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := FieldByName('RETENCION').AsCurrency;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Retención de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbok],0);
                   Transaction.RollbackRetaining;
                   Exit;
                  end
                except
                  MessageDlg('Error Grabando Retención de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbok],0);
                  Transaction.RollbackRetaining;
                  Exit;
                end;
              end;
              IBPagar.Close;
   // Si Certificado grabar retención en cuenta de abono
              if certificado then
                if FieldByName('RETENCION').AsCurrency > 0 then
                begin
                  IBPagar.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                  IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                  IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
                  IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger,Format('%.7d',[FieldByName('NUMERO_CUENTA_ABONO').AsInteger])));
                  IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := EdFecha.Date;
                  IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                  IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 16;
                  IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                  IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha';
                  IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := 0;
                  IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := FieldByName('RETENCION').AsCurrency;
                  try
                    IBPagar.ExecQuery;
                    if IBPagar.RowsAffected < 1 then
                    begin
                     MessageDlg('Error Grabando Retención de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA_ABONO').AsInteger]),mtError,[mbok],0);
                     Transaction.Rollback;
                     Exit;
                    end
                  except
                    MessageDlg('Error Grabando Retención de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA_ABONO').AsInteger]),mtError,[mbok],0);
                    Transaction.Rollback;
                    Exit;
                  end;
                IBPagar.Close;
                end;
        // fin si certificado
// Actualizar Saldo en Cuenta del Mes

// Grabo Detalle de la Retención
              if FieldByName('RETENCION').AsCurrency > 0 then
              begin
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('insert into "con$retencion" values(');
              IBPagar.SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"ID_IDENTIFICACION",');
              IBPagar.SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",');
              IBPagar.SQL.Add(':"VALOR_RETENCION")');
              IBPagar.ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBPagar.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
              IBPagar.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
              IBPagar.ParamByName('MONTO_RETENCION').AsCurrency := FieldByName('INTERES').AsCurrency;
              IBPagar.ParamByName('TASA_RETENCION').AsFloat := TasaR;
              IBPagar.ParamByName('VALOR_RETENCION').AsCurrency := FieldByName('RETENCION').AsCurrency;
              try
               IBPagar.ExecQuery;
               if IBPagar.RowsAffected < 1 then
               begin
                IBPagar.Transaction.Rollback;
                MessageDlg('Error Grabando en tabla de retenciones captacion:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbcancel],0);
                Exit;
               end
              except
                IBPagar.Transaction.Rollback;
                MessageDlg('Error Grabando en tabla de retenciones captacion:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbcancel],0);
                Exit;
              end;
              IBPagar.Close;
              end;

// En Caso de Certificado, Marcar la tabla de liquidación
            if certificado then
            begin
              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('update "cap$tablaliquidacion"');
              IBPagar.SQL.Add('set PAGADO = 1');
              IBPagar.SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              IBPagar.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" and FECHA_PAGO = :"FECHA_PAGO"');
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              IBPagar.ParamByName('FECHA_PAGO').AsDate := EdFecha.Date;
              try
               IBPagar.ExecQuery;
               if IBPagar.RowsAffected < 1 then
               begin
                IBPagar.Transaction.Rollback;
                MessageDlg('Error Actualizando Tabla de Liquidación Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbcancel],0);
                Exit;
               end
              except
                IBPagar.Transaction.Rollback;
                MessageDlg('Error Actualizando Tabla de Liquidación Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbcancel],0);
                Exit;
              end;
              IBPagar.Close;
            end;
// Fin marca tabla de liquidación
// Grabar maestro fecha ultimo pago
              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('update "cap$maestro"');
              IBPagar.SQL.Add('set FECHA_ULTIMO_PAGO = :FECHA');
              IBPagar.SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              IBPagar.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              IBPagar.ParamByName('FECHA').AsDate := EdFecha.Date;
              try
               IBPagar.ExecQuery;
               if IBPagar.RowsAffected < 1 then
               begin
                IBPagar.Transaction.Rollback;
                MessageDlg('Error Actualizando Fecha Ultimo Pago Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbcancel],0);
                Exit;
               end
              except
                IBPagar.Transaction.Rollback;
                MessageDlg('Error Actualizando Fecha Ultimo Pago Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbcancel],0);
                Exit;
              end;

// Fin marca maestro.

              Next;
           end;
        frmProgreso.Cerrar;
        Close;
        end;

// Marcar Dia Liquidado
        with IBDias do
        begin
             Close;
             SQL.Clear;
             SQL.Add('insert into "cap$diasliquidados"');
             SQL.Add('values (:ID_TIPO_CAPTACION,:FECHA_LIQUIDADA,:HORA_LIQUIDADA,:LIQUIDADA)');
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('FECHA_LIQUIDADA').AsDate := EdFecha.Date;
             ParamByName('HORA_LIQUIDADA').AsTime := Time;;
             ParamByName('LIQUIDADA').AsInteger := 1;
             try
               ExecQuery;
             except
               frmProgreso.Cerrar;
               MessageDlg('Error Actualizando Fecha, Informe a Sistemas',mtInformation,[mbOK],0);
             end;
        end;
// Marca Finalizada
        dmGeneral.IBTransaction1.Commit;
        CmdComprobante.Enabled := True;
        MessageDlg('Comprobante contable generado con exito!',mtInformation,[mbok],0);
        CmdAplicar.Enabled := False;

end;

procedure TfrmLiquidacionInteresesCaptacion.CmdComprobanteClick(
  Sender: TObject);
begin

        with IBAuxiliar do
        begin
             if Transaction.InTransaction then
                Transaction.Rollback;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
             SQL.Add('"con$comprobante".FECHADIA,');
             SQL.Add('"con$comprobante".DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('"con$auxiliar".CODIGO,');
             SQL.Add('"con$puc".NOMBRE AS CUENTA,');
             SQL.Add('"con$auxiliar".DEBITO,');
             SQL.Add('"con$auxiliar".CREDITO');
             SQL.Add('from ');
             SQL.Add('"con$comprobante" ');
             SQL.Add('INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
             SQL.Add('INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('("con$comprobante".ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             try
              Open;
              ReporteC.Variables.ByName['EMPRESA'].AsString := Empresa;
              ReporteC.Variables.ByName['NIT'].AsString := Nit;
              if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
              Close;
             except
               MessageDlg('Error generando el comprobante',mtError,[mbcancel],0);
               Close;
             end;
             Transaction.Commit;
        end;

end;

procedure TfrmLiquidacionInteresesCaptacion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
      if Liquidado then
      begin
        if IBConsulta.Transaction.InTransaction then
           IBConsulta.Transaction.Rollback;
        IBConsulta.Transaction.StartTransaction;
        IBConsulta.Close;
        IBConsulta.SQL.Clear;
        IBConsulta.SQL.Add('drop table ' + Tabla);
        try
          IBConsulta.ExecSQL;
        finally
          IBConsulta.Transaction.Commit;
        end;
      end;
      CanClose := True;
end;

procedure TfrmLiquidacionInteresesCaptacion.CasoProgramado;
var MinCaptacion,MaxCaptacion:Integer;
    Ag,Numero,Digito:Integer;
    AgD,TipoD,NumeroD,DigitoD:Integer;
    FechaCorte:TDate;
    Valor:Currency;
    Cuota:Currency;
    TipoI:string;
    CodTipoI:Integer;
    TipoCuentaAhorros:Integer;
    CuentaAhorros:Integer;
    DigitoCuentaAhorros:Integer;
    SaldoDisponible:Currency;
    DiaDescuento:Integer;
    DiaCorte:Integer;
    FechaDescuento :TDate;
    vDias :Integer;
    vCuota :Currency;
    vSaldo :Currency;
begin
          CdSaldo.CancelUpdates;
          MinCaptacion := 1;
          MaxCaptacion := 1;

          FechaCorte := EdFecha.Date;

          frmProgreso.InfoLabel := 'Buscando Captaciones a Descontar';

{          with IBTotalCaptaciones do
          begin
              StoredProcName := 'P_CAP_0020';
              ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
              ParamByName('FECHA').AsDate := EdFecha.Date;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Prepare;
                 ExecProc;
                 Screen.Cursor := crDefault;
              except
                 frmProgreso.Cerrar;
                 MessageDlg('Error Localizando Captaciones a Liquidar',mtError,[mbcancel],0);
                 Exit;
              end;
              MaxCaptacion := ParamByName('TOTAL').AsInteger;
              if MaxCaptacion = 0 then
              begin
                 frmProgreso.Cerrar;
                 MessageDlg('No existen captaciones a las cuales liquidarles intereses',mtInformation,[mbok],0);
                 if dmGeneral.IBTransaction1.InTransaction then
                    dmGeneral.IBTransaction1.RollbackRetaining;
                 Exit;
              end;
              Close;
          end;
}
          Application.ProcessMessages;
          with IBALiquidar do
          begin
            SQL.Clear;
            SQL.Add('select * from P_CAP_0021 (:ID, :FECHA, :FECHA1)');
            ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('FECHA').AsDate := FechaCorte;
            ParamByName('FECHA1').AsDate := EncodeDate(YearOf(FechaCorte),MonthOf(FechaCorte),1);
            try
               Application.ProcessMessages;
               Screen.Cursor := crHourGlass;
               Open;
               Last;
               First;
               MaxCaptacion := RecordCount;
               if MaxCaptacion = 0 then
               begin
                 frmProgreso.Cerrar;               
                 MessageDlg('No existen captaciones a las cuales liquidarles intereses',mtInformation,[mbok],0);
                 if dmGeneral.IBTransaction1.InTransaction then
                    dmGeneral.IBTransaction1.Rollback;
                 Exit;
               end;
              Screen.Cursor := crDefault;
            except
               frmProgreso.Cerrar;
               MessageDlg('Error Localizando Captaciones a Descontar',mtError,[mbcancel],0);
               CmdCerrar.Enabled := True;
               Exit;
            end;

              frmProgreso.Min  := MinCaptacion;
              frmProgreso.Max := MaxCaptacion;
              frmProgreso.Position:= 1;
              while not Eof do
              begin
                Application.ProcessMessages;
                frmProgreso.InfoLabel := 'Descontando Captacion:' + IntToStr(DBLCBTipoCaptacion.KeyValue) + '-' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Numero := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                vCuota := ValidaCon(Numero,5,Digito);
                frmProgreso.Position := RecNo;
                Valor := FieldByName('VALOR_INICIAL').AsCurrency;
                Cuota := FieldByName('CUOTA').AsCurrency;
                TipoCuentaAhorros := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                CuentaAhorros := FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
                FechaDescuento := FieldByName('FECHA_DESCUENTO').AsDateTime;
                DigitoCuentaAhorros := StrToInt(DigitoControl(TipoCuentaAhorros,FormatCurr('0000000',CuentaAhorros)));
                CDSContractual.Open;
                CDSContractual.Insert;
                CDSContractual.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                CDSContractual.FieldByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                CDSContractual.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                CDSContractual.FieldByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                CDSContractual.FieldByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                CDSContractual.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                CDSContractual.FieldByName('NOMBRE').AsString := FieldByName('PRIMER_APELLIDO').AsString + ' '+
                                                                 FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                                 FieldByName('NOMBRE').AsString;
                CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                CDSContractual.FieldByName('FECHA_DESCUENTO').AsDateTime := FieldByName('FECHA_DESCUENTO').AsDateTime;
                if CuentaAhorros = 0 then
                begin
                   CDSContractual.FieldByName('ID_TIPO_CAPTACION_D').AsInteger := 0;
                   CDSContractual.FieldByName('NUMERO_CUENTA_D').AsInteger := 0;
                   CDSContractual.FieldByName('DIGITO_CUENTA_D').AsInteger := 0;
                   CDSContractual.FieldByName('ESTADO').AsString := 'N';
                end
                else
                begin
                   AgD := Agencia;
                   TipoD := TipoCuentaAhorros;
                   NumeroD := CuentaAhorros;
                   DigitoD := DigitoCuentaAhorros;
                   CDSContractual.FieldByName('ID_TIPO_CAPTACION_D').asinteger := TipoD;
                   CDSContractual.FieldByName('NUMERO_CUENTA_D').AsInteger := NumeroD;
                   CDSContractual.FieldByName('DIGITO_CUENTA_D').AsInteger := DigitoD;
                   IBSQL1.Close;
                   IBSQL1.SQL.Clear;
                   IBSQL1.SQL.Add('select SALDO_DISPONIBLE from SALDO_DISPONIBLE(:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
                   IBSQL1.ParamByName('AG').AsInteger := AgD;
                   IBSQL1.ParamByName('TP').AsInteger := TipoD;
                   IBSQL1.ParamByName('CTA').AsInteger := NumeroD;
                   IBSQL1.ParamByName('DG').AsInteger := DigitoD;
                   IBSQL1.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                   IBSQL1.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                   IBSQL1.ParamByName('FECHA2').AsDate := fFechaActual;
                   try
                    vSaldo := 0;
                    with CdSaldo do
                    begin
                      Filtered := False;
                      AggregatesActive := False;
                      Filter := 'CUENTA = ' + IntToStr(NumeroD) + ' and DIGITO = ' + IntToStr(DigitoD);
                      Filtered := True;
                      AggregatesActive := True;
                      try
                        vSaldo := CdSaldoTOTAL.Value;
                      except
                        vSaldo := 0;
                      end;
                    end;
                    IBSQL1.ExecQuery;
                    if vCuotasContractual < 3 then
                    begin
                      if IBSQL1.RecordCount > 0 then begin
                         //ShowMessage(CurrToStr(IBSQL1.FieldByName('SALDO_DISPONIBLE').AsCurrency) + ' vi=' + CurrToStr(FieldByName('VALOR_INICIAL').AsCurrency)+ ' vs=' + CurrToStr(vSaldo));
                         if IBSQL1.FieldByName('SALDO_DISPONIBLE').AsCurrency >= (FieldByName('VALOR_INICIAL').AsCurrency  + vSaldo)then
                          begin
                           CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                           CDSContractual.FieldByName('ESTADO').AsString := 'S';
                           CdSaldo.Append;
                           CdSaldo.FieldValues['CUENTA'] := numerod;
                           CdSaldo.FieldValues['DIGITO'] := digitod;
                           CdSaldo.FieldValues['VALOR'] := FieldByName('VALOR_INICIAL').AsCurrency;
                           CdSaldo.Post;
                          end
                         else
                          begin
                           CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                           CDSContractual.FieldByName('ESTADO').AsString := 'T';
                          end;
                      end
                      else
                      begin
                           CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                           CDSContractual.FieldByName('ESTADO').AsString := 'X';
                      end;
                    end
                    else
                    begin
                       CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                       CDSContractual.FieldByName('ESTADO').AsString := 'V';
                    end;
                   except
                    Transaction.Rollback;
                    frmProgreso.Cerrar;
                    raise;
                   end;
                  end;
                  vDias := DaysBetween(fFechaActual, FechaDescuento);
                  CDSContractual.FieldValues['DIAS'] := vDias;
                  CDSContractual.FieldValues['CUOTA'] := vCuota;
                  CDSContractual.Post;
                  CDSContractual.Close;
                  Next;
              end;
            end;

          frmProgreso.Cerrar;
          MessageDlg('Proceso de Descuento Culminado con Exito!',mtInformation,[mbok],0);
          Liquidado := False;
          CmdLiquidar.Enabled := False;
          CmdVer.Enabled := True;
          CmdCerrar.Enabled := True;
          RadioTipoLiquidacion.Enabled := False;
          if RadioTipoLiquidacion.ItemIndex = 1 then
             CmdAplicar.Enabled := True;



end;


procedure TfrmLiquidacionInteresesCaptacion.AplicarProgramado;
var Total:Integer;
    Ag:Integer;
    Tipo : Integer;
    Numero:Integer;
    Digito:Integer;
    VrDescuento,GMF:Currency;
    ValorCap2:Currency;
    _dFechaDescuento :TDate;
    ValorCap4:Currency;
    Codigo_GMF:string;
    Codigo_GGMF:string;
    vNuevoPlazo : Integer;
    Lista :TList;
    I :Integer;
    ARecord:PTablaConLiq;
begin
        Empleado;
        VrDescuento:=0;
        ValorCap2 := 0;
        ValorCap4 := 0;
        with CDSContractual do begin
           Open;
           Filter := 'ESTADO = '+QuotedStr('S');
           Filtered := True;
           Last;
           First;
           Total := RecordCount;
           if Total < 1 then begin
             MessageDlg('No hay descuentos a aplicar',mtInformation,[mbcancel],0);
             dmGeneral.IBTransaction1.Rollback;
             Exit;
           end;

           Comprobante := ObtenerConsecutivo(IBSQL2,4);

           EdComprobante.Caption := Format('%.7d',[Comprobante]);


           frmprogreso := Tfrmprogreso.Create(Self);
           frmProgreso.Titulo := 'Aplicando Descuento ' + DBLCBTipoCaptacion.Text + ' - Progreso';
           frmProgreso.Min  := 1;
           frmProgreso.Max := Total;
           frmProgreso.Position:= 1;
           frmProgreso.Ejecutar;
           while not Eof do
           begin
              Application.ProcessMessages;
              frmProgreso.Position := RecNo;
              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('insert into "cap$extracto" values(');
              IBPagar.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
              IBPagar.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
              IBPagar.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
              IBPagar.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
              if FieldByName('ESTADO').AsString = 'S' then
              begin
                IBPagar.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := EdFecha.Date;
                IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
                IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Descuento por Cuota Ahorro Contractual';
                IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := FieldByName('DESCUENTO').AsCurrency;
                IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   frmProgreso.Cerrar;
                   MessageDlg('Error Grabando Descuento de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbok],0);
                   IBPagar.Transaction.Rollback;
                   Exit;
                  end;
                  VrDescuento := VrDescuento + FieldByName('DESCUENTO').AsCurrency;
                except
                  frmProgreso.Cerrar;
                  MessageDlg('Error Grabando Descuento de Captación:' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbok],0);
                  IBPagar.Transaction.Rollback;
                  Exit;
                end;

                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Numero := FieldByName('NUMERO_CUENTA_D').AsInteger;
                Tipo :=  FieldByName('ID_TIPO_CAPTACION_D').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA_D').AsInteger;
                _dFechaDescuento := FieldByName('FECHA_DESCUENTO').AsDateTime;
                IBPagar.Close;
                IBPagar.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := EdFecha.Date;
                IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
                IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Descuento por Cuota Ahorro Contractual';
                IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := 0;
                IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := FieldByName('DESCUENTO').AsCurrency;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando Descuento de Captación:' + Format('%.7d',[Numero]),mtError,[mbok],0);
                   IBPagar.Transaction.Rollback;
                   Exit;
                  end
                except
                  frmProgreso.Cerrar;
                  MessageDlg('Error Grabando Descuento de Captación:' + Format('%.7d',[Numero]),mtError,[mbok],0);
                  IBPagar.Transaction.Rollback;
                  Exit;
                end;

                case Tipo of
                 2: ValorCap2 := ValorCap2 + FieldByName('DESCUENTO').AsCurrency;
                 4: ValorCap4 := ValorCap4 + FieldByName('DESCUENTO').AsCurrency;
                end;
                if FieldByName('DIAS').AsInteger > 5 then
                begin
                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('SELECT ');
                  IBSQL1.SQL.Add('COUNT(*) as TOTAL');
                  IBSQL1.SQL.Add('FROM');
                  IBSQL1.SQL.Add('"cap$tablaliquidacioncon"');
                  IBSQL1.SQL.Add('WHERE');
                  IBSQL1.SQL.Add('(DESCONTADO = 0) AND ');
                  IBSQL1.SQL.Add('(ID_TIPO_CAPTACION = 5) AND ');
                  IBSQL1.SQL.Add('(NUMERO_CUENTA = :NM) AND ');
                  IBSQL1.SQL.Add('(DIGITO_CUENTA = :DG)');
                  IBSQL1.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL1.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  IBSQL1.ExecQuery;
                  vNuevoPlazo := IBSQL1.FieldByName('TOTAL').AsInteger * 30;
                  Lista := TablaCon(FieldByName('DESCUENTO').AsCurrency,fFechaActual,30,vNuevoPlazo,DayOf(fFechaActual),fFechaActual);
                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('DELETE FROM "cap$tablaliquidacioncon" WHERE DESCONTADO = 0 AND NUMERO_CUENTA = :NM AND DIGITO_CUENTA = :DG AND ID_TIPO_CAPTACION = 5');
                  IBSQL1.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL1.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  IBSQL1.ExecQuery;
                  IBSQL1.Transaction.Commit;
                  IBSQL1.Transaction.StartTransaction;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('Insert into "cap$tablaliquidacioncon" values(');
                  IBSQL1.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                  IBSQL1.SQL.Add(':"FECHA_DESCUENTO",:"VALOR",:"DESCONTADO")');
                  IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
                  IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  for i := 0 to Lista.Count - 1 do
                  begin
                     ARecord := Lista.Items[i];
                     IBSQL1.ParamByName('FECHA_DESCUENTO').AsDate := ARecord^.FechaDescuento;
                     IBSQL1.ParamByName('VALOR').AsCurrency := ARecord^.Valor;
                     IBSQL1.ParamByName('DESCONTADO').AsInteger := BooleanoToInt(ARecord^.Descontado);
                     try
                        IBSQL1.ExecQuery;
                        IBSQL1.Close;
                        Dispose(ARecord);
                     except
                        Abort;
                     end;
                  end;
                  Lista.Free;
                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('INSERT INTO "cap$controlcon" values(:ID_AGENCIA,:ID_TIPO_CAPTACION,');
                  IBSQL1.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:FECHA_ANTERIOR,:FECHA_ACTUAL,');
                  IBSQL1.SQL.Add(':C_VENCIDA,:PLAZO_ACTUAL,:ID_EMPLEADO,:HORA,:DIA)');
                  IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
                  IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  IBSQL1.ParamByName('FECHA_ANTERIOR').AsDate := FieldByName('FECHA_DESCUENTO').AsDateTime;
                  IBSQL1.ParamByName('FECHA_ACTUAL').AsDate := fFechaActual;
                  IBSQL1.ParamByName('C_VENCIDA').AsInteger := FieldByName('CUOTA').AsInteger;
                  IBSQL1.ParamByName('PLAZO_ACTUAL').AsInteger := vNuevoPlazo;
                  IBSQL1.ParamByName('ID_EMPLEADO').AsString := DBAlias;
                  IBSQL1.ParamByName('HORA').AsTime := Time;
                  IBSQL1.ParamByName('DIA').AsInteger := FieldByName('DIAS').AsInteger;
                  IBSQL1.ExecQuery;
                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('UPDATE "cap$maestro" SET FECHA_VENCIMIENTO_PRORROGA = :FECHA WHERE ID_TIPO_CAPTACION = 5 AND NUMERO_CUENTA = :NM AND DIGITO_CUENTA = :DG');
                  IBSQL1.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL1.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  IBSQL1.ParamByName('FECHA').AsDate := CalculoFecha(fFechaActual,vNuevoPlazo);
                  IBSQL1.ExecQuery;

                end;
//                else
//                begin
                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('update "cap$tablaliquidacioncon" set DESCONTADO = 1 where');
                  IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                  IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
                  IBSQL1.SQL.Add('FECHA_DESCUENTO = :FECHA_DESCUENTO');
                  IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                  IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  IBSQL1.ParamByName('FECHA_DESCUENTO').AsDate := _dFechaDescuento;
                  try
                   IBSQL1.ExecQuery;
                   if IBSQL1.RowsAffected < 1 then
                    begin
                     //MessageDlg('Error Marcando Cuenta:'+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbcancel],0);
                    end;
                  except
                    frmProgreso.Cerrar;
                    IBPagar.Transaction.Rollback;
                    raise;
                  end;
//                end;// FIN DEL VALIDA DIAS
              end;
              Next;
            end;
           end;
        frmProgreso.Cerrar;

        GMF := SimpleRoundTo((VrDescuento / 1000) * 4,0);

        with IBConsulta do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$contable" where ');
            SQL.Add('ID_CAPTACION = :"ID_CAPTACION" and ID_CONTABLE = :"ID_CONTABLE"');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 3;
            Open;
            Codigo_GMF := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 4;
            Open;
            Codigo_GGMF := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
        end;

        with IbComprobante do
        begin
           Close;
           ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
           ParamByName('FECHADIA').AsDateTime := EdFecha.Date;
           ParamByName('DESCRIPCION').AsString := 'Descuento Ahorro Contractual';
           ParamByName('TOTAL_DEBITO').AsCurrency := VrDescuento + GMF;
           ParamByName('TOTAL_CREDITO').AsCurrency := VrDescuento + GMF;
           ParamByName('ESTADO').AsString := 'O';
           ParamByName('IMPRESO').AsInteger := 1;
           ParamByName('ANULACION').AsString := '';
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ExecSQL;
        end;

        with IbAux  do
        begin
           Close;
           if VrDescuento > 0 then
           begin
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := EdFecha.Date;
             ParamByName('CODIGO').AsString := Codigo_Captacion;
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := VrDescuento;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ExecSQL;
           if ValorCap2 > 0 then
           begin
             Close;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := EdFecha.Date;
             ParamByName('CODIGO').AsString := Codigo_Captacion2;
             ParamByName('DEBITO').AsCurrency := ValorCap2;
             ParamByName('CREDITO').AsCurrency := 0 ;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ExecSQL;
           end;

           if ValorCap4 > 0 then
           begin
             Close;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := EdFecha.Date;
             ParamByName('CODIGO').AsString := Codigo_Captacion4;
             ParamByName('DEBITO').AsCurrency := ValorCap4;
             ParamByName('CREDITO').AsCurrency := 0 ;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ExecSQL;
           end;
           Close;
           ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('FECHA').AsDateTime := EdFecha.Date;
           ParamByName('CODIGO').AsString := Codigo_GMF;
           ParamByName('DEBITO').AsCurrency := 0;
           ParamByName('CREDITO').AsCurrency := GMF;
           ParamByName('ID_CUENTA').AsInteger :=0;
           ParamByName('ID_COLOCACION').Clear;
           ParamByName('ID_IDENTIFICACION').AsInteger := 0;
           ParamByName('ID_PERSONA').Clear;
           ParamByName('MONTO_RETENCION').AsCurrency := 0;
           ParamByName('TASA_RETENCION').AsFloat := 0;
           ParamByName('ESTADOAUX').AsString := 'O';
           ExecSQL;

           Close;
           ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('FECHA').AsDateTime := EdFecha.Date;
           ParamByName('CODIGO').AsString := Codigo_GGMF;
           ParamByName('DEBITO').AsCurrency := GMF;
           ParamByName('CREDITO').AsCurrency := 0;
           ParamByName('ID_CUENTA').AsInteger :=0;
           ParamByName('ID_COLOCACION').Clear;
           ParamByName('ID_IDENTIFICACION').AsInteger := 0;
           ParamByName('ID_PERSONA').Clear;
           ParamByName('MONTO_RETENCION').AsCurrency := 0;
           ParamByName('TASA_RETENCION').AsFloat := 0;
           ParamByName('ESTADOAUX').AsString := 'O';
           ExecSQL;
           end;
        end;
        dmGeneral.IBTransaction1.Commit;
        CmdComprobante.Enabled := True;
        MessageDlg('Comprobante contable generado con exito!',mtInformation,[mbok],0);
        CmdAplicar.Enabled := False;
end;

procedure TfrmLiquidacionInteresesCaptacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
