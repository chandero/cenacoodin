unit UnitBarridoCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, DateUtils,
  Grids, XStringGrid, ExtCtrls, ComCtrls, IBSQL, StrUtils, pr_Common,
  pr_TxClasses, Math, pr_parser, Printers, IBDatabase, FMTBcd, DBXpress,
  SqlExpr, DBClient;

type
  TfrmBarridoCartera = class(TForm)
    IBQuery1: TIBQuery;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    GridColocaciones: TXStringGrid;
    IBQTabla: TIBQuery;
    IBCuotas: TIBSQL;
    IBSaldo: TIBSQL;
    IBQuery2: TIBQuery;
    IBcomprobante: TIBSQL;
    IBExtracto: TIBSQL;
    IBConsecB: TIBSQL;
    Panel1: TPanel;
    FechaBarrido: TLabel;
    EdFechaBarrido: TDateTimePicker;
    RGCuota: TRadioGroup;
    Panel5: TPanel;
    CmdProcesar: TBitBtn;
    CmdEjecutar: TBitBtn;
    CmdImprimir: TBitBtn;
    IBBarrido: TIBSQL;
    IBQuery: TIBQuery;
    IBQuery2CODIGO_PUC: TIBStringField;
    IBQuery2FECHA_INICIAL: TDateField;
    IBQuery2FECHA_FINAL: TDateField;
    IBQuery2DIAS_APLICADOS: TIntegerField;
    IBQuery2TASA_LIQUIDACION: TFloatField;
    IBQuery2VALOR_DEBITO: TIBBCDField;
    IBQuery2VALOR_CREDITO: TIBBCDField;
    IBQuery2NOMBRE: TIBStringField;
    IBGrupo1: TIBQuery;
    IBAuxiliar: TIBQuery;
    IBGrupo3: TIBQuery;
    CmdCerrar: TBitBtn;
    EdImpresora: TLabel;
    PrinterSetupDialog1: TPrinterSetupDialog;
    cmdImpresora: TBitBtn;
    Label1: TLabel;
    IBGrupo2: TIBQuery;
    IBTBarrido: TIBTransaction;
    SQLQuery1: TSQLQuery;
    SQLConnection1: TSQLConnection;
    Report1: TprTxReport;
    Report: TprTxReport;
    DSBarrido: TClientDataSet;
    DSBarridoAGENCIA: TSmallintField;
    DSBarridoCOLOCACION: TStringField;
    DSBarridoIDIDENTIFICACION: TSmallintField;
    DSBarridoIDPERSONA: TStringField;
    DSBarridoCUOTASALIQUIDAR: TIntegerField;
    DSBarridoCLASIFICACION: TSmallintField;
    DSBarridoCATEGORIA: TStringField;
    DSBarridoGARANTIA: TSmallintField;
    DSBarridoSALDOACTUAL: TCurrencyField;
    DSBarridoESTADO: TSmallintField;
    DSBarridoVALORCUOTA: TCurrencyField;
    DSBarridoFECHAPAGOK: TDateField;
    DSBarridoFECHAPAGOI: TDateField;
    DSBarridoTIPOCUOTA: TSmallintField;
    DSBarridoIDINTERES: TIntegerField;
    DSBarridoTIPOINTERES: TStringField;
    DSBarridoVALORTASA: TFloatField;
    DSBarridoVALORACTUALTASA: TFloatField;
    DSBarridoVALORMORA: TFloatField;
    DSBarridoPUNTOSADIC: TFloatField;
    DSBarridoAMORTIZAK: TIntegerField;
    DSBarridoAMORTIZAI: TIntegerField;
    DSBarridoDIASPRORROGA: TIntegerField;
    IBTSaldo: TIBTransaction;
    IBTExtracto: TIBTransaction;
    procedure CmdProcesarClick(Sender: TObject);
    procedure EdFechaBarridoEnter(Sender: TObject);
    procedure EdFechaBarridoExit(Sender: TObject);
    procedure CmdEjecutarClick(Sender: TObject);
    procedure CmdImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReportUnknownVariable(Sender: TObject; const VarName: String;
      var Value: TprVarValue; var IsProcessed: Boolean);
    procedure CmdCerrarClick(Sender: TObject);
    procedure cmdImpresoraClick(Sender: TObject);
    procedure ReportPrintComplete(Sender: TObject);
  private
    { Private declarations }
    function BuscoSaldoAhorros(vTipoId:Integer;vNumeroId:string;FechaInicial:TDate;FechaFinal:TDate;Ano:string):Currency;
  public
    { Public declarations }
  end;

var
  frmBarridoCartera: TfrmBarridoCartera;
  Tabla : string;
  NumeroCuenta:Integer;
  DigitoCuenta:Integer;
  SaldoAhorros:Currency;
  Movimiento:Currency;
  TotalCanje:Currency;
  vTotalAhorros:Currency;
  vTotalLiquidacion:Currency;
  CodigoCaja:string;
  CodigoAhorros:string;
  abono_capital : currency;
  abono_cxc : currency;
  abono_servicios : currency;
  abono_anticipado: currency;
  abono_mora : currency;
  consec : string;
  VNocomprobante : string;
  ConsecBarridoInicial : string;
  ConsecBarridoFinal : string;
  NombresAsociado:string;
  ApellidosAsociado:string;
  Alias : string;
  vTipoId : Integer;
  vNumeroId : string;
  FechaInicial:TDate;
  FechaFinal:TDate;
  Ano:string;
implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso,UnitVistaPreliminar,
     UnitdmColocacion;

procedure TfrmBarridoCartera.CmdProcesarClick(Sender: TObject);
var Fecha:TDate;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
    CuotasaLiquidar:Integer;
begin
        CmdProcesar.Enabled := False;
        Application.ProcessMessages;
        if IBQuery1.Transaction.InTransaction then
          IBQuery1.Transaction.Rollback;
        IBQuery1.Transaction.StartTransaction;

             with IBQTabla do
              begin
                if Transaction.InTransaction then
                  Transaction.Rollback;
                Transaction.StartTransaction;
                SQL.Clear;
                SQL.Add('delete from "col$barridoCartera"');
                Open;
                Transaction.Commit;
                Transaction.StartTransaction;
                Close;
              end;


        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0) and ');
          case RGCuota.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_TIPO_CUOTA < 4)');
           1: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 1)');
           2: SQL.Add('("col$colocacion".ID_TIPO_CUOTA > 1)');
          end;
//          SQL.Add('Order by "col$colocacion".ID_COLOCACION, "col$colocacion".FECHA_INTERES DESC');

          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"col$colocacion".ID_CLASIFICACION,');
          SQL.Add('"col$colocacion".ID_CATEGORIA,');
          SQL.Add('"col$colocacion".ID_GARANTIA,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
          SQL.Add('"col$colocacion".ID_INTERES,');
          SQL.Add('"col$colocacion".TIPO_INTERES,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
          SQL.Add('"col$colocacion".TASA_INTERES_MORA,');
          SQL.Add('"col$colocacion".PUNTOS_INTERES,');
          SQL.Add('"col$colocacion".DIAS_PRORROGADOS,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0) and ');
          case RGCuota.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_TIPO_CUOTA < 4)');
           1: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 1)');
           2: SQL.Add('("col$colocacion".ID_TIPO_CUOTA > 1)');
          end;
          SQL.Add('Order by "col$colocacion".ID_PERSONA, "col$colocacion".FECHA_INTERES ASC');
//          SQL.Add('Order by "col$colocacion".ID_ESTADO_COLOCACION DESC, "col$colocacion".FECHA_INTERES DESC');


          frmProgreso := TfrmProgreso.Create(self);
          frmProgreso.Titulo := 'Buscando Colocaciones';
          frmProgreso.Min := 0;
          frmProgreso.Max := Total;
          frmProgreso.Position := 0;
          frmProgreso.Ejecutar;

          try
            Open;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               frmprogreso.cerrar;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              while not Eof do
               begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Colocaci?n No:' + FieldByName('ID_COLOCACION').AsString;
                Application.ProcessMessages;
                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                if Int(Fecha) <= Int(FechaHoy) then
                 begin
                   Conteo := Conteo + 1;
                   GridColocaciones.RowCount := Conteo + 1;
                   GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                   GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                       FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                       FieldByName('NOMBRE').AsString;
                   GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                   GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                   GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                   GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                   GridColocaciones.Cells[6,Conteo] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                   GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                   GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;

                   with IBCuotas do
                    begin
                      SQL.Clear;
                      SQL.Add('select count(CUOTA_NUMERO) as CUOTAS');
                      SQL.Add('from "col$tablaliquidacion"');
                      SQL.Add('where');
                      SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
                      SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
                      SQL.Add('PAGADA = 0 and');
                      SQL.Add('FECHA_A_PAGAR <= :"FECHA"');
                      ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                      ParamByName('FECHA').AsDate := FechaHoy;
                      ExecQuery;
                      CuotasaLiquidar := IBCuotas.FieldByName('CUOTAS').AsInteger;
                      IBCuotas.Close;
                    end;

                   if CuotasaLiquidar > 0 then begin
                      DSBarrido.Append;
                      DSBarrido.FieldByName('AGENCIA').AsInteger := IBQuery1.fieldbyname('ID_AGENCIA').AsInteger;
                      DSBarrido.FieldByName('COLOCACION').AsString := IBQuery1.fieldbyname('ID_COLOCACION').AsString;
                      DSBarrido.FieldByName('IDIDENTIFICACION').AsInteger := IBQuery1.fieldbyname('ID_IDENTIFICACION').AsInteger;
                      DSBarrido.FieldByName('IDPERSONA').AsString := IBQuery1.fieldbyname('ID_PERSONA').AsString;
                      DSBarrido.FieldByName('CUOTASALIQUIDAR').AsInteger := CuotasaLiquidar;
                      DSBarrido.FieldByName('CLASIFICACION').AsInteger := IBQuery1.fieldbyname('ID_CLASIFICACION').AsInteger;
                      DSBarrido.FieldByName('CATEGORIA').AsString := IBQuery1.fieldbyname('ID_CATEGORIA').AsString;
                      DSBarrido.FieldByName('GARANTIA').AsInteger := IBQuery1.fieldbyname('ID_GARANTIA').AsInteger;
                      DSBarrido.FieldByName('SALDOACTUAL').AsCurrency := IBQuery1.fieldbyname('SALDO').AsCurrency;
                      DSBarrido.FieldByName('ESTADO').AsInteger := IBQuery1.fieldbyname('ID_ESTADO_COLOCACION').AsInteger;
                      DSBarrido.FieldByName('VALORCUOTA').AsInteger := IBQuery1.fieldbyname('VALOR_CUOTA').AsInteger;
                      DSBarrido.FieldByName('FECHAPAGOK').AsDateTime := IBQuery1.fieldbyname('FECHA_CAPITAL').AsDateTime;
                      DSBarrido.FieldByName('FECHAPAGOI').AsDateTime := IBQuery1.fieldbyname('FECHA_INTERES').AsDateTime;
                      DSBarrido.FieldByName('TIPOCUOTA').AsInteger := IBQuery1.fieldbyname('ID_TIPO_CUOTA').AsInteger;
                      DSBarrido.FieldByName('IDINTERES').AsInteger := IBQuery1.fieldbyname('ID_INTERES').AsInteger;
                      DSBarrido.FieldByName('TIPOINTERES').AsString := IBQuery1.fieldbyname('TIPO_INTERES').AsString;
                      DSBarrido.FieldByName('VALORTASA').AsFloat := IBQuery1.fieldbyname('TASA_INTERES_CORRIENTE').AsFloat;
                      DSBarrido.FieldByName('VALORACTUALTASA').AsFloat := IBQuery1.fieldbyname('VALOR_ACTUAL_TASA').AsFloat;
                      DSBarrido.FieldByName('VALORMORA').AsFloat := IBQuery1.fieldbyname('TASA_INTERES_MORA').AsFloat;
                      DSBarrido.FieldByName('PUNTOSADIC').AsFloat := IBQuery1.fieldbyname('PUNTOS_INTERES').AsFloat;
                      DSBarrido.FieldByName('AMORTIZAK').AsInteger := IBQuery1.fieldbyname('AMORTIZA_CAPITAL').AsInteger;
                      DSBarrido.FieldByName('AMORTIZAI').AsInteger := IBQuery1.fieldbyname('AMORTIZA_INTERES').AsInteger;
                      DSBarrido.FieldByName('DIASPRORROGA').AsInteger := IBQuery1.fieldbyname('DIAS_PRORROGADOS').AsInteger;
                      DSBarrido.Post;

                   end; // fin de if cuotasaLiquidar
                 end; //fin de if dias
                Next;
               end; //fin de while
              frmProgreso.Cerrar;
              Transaction.Commit;
              Transaction.StartTransaction;
            end; // fin if recordcount
          except
            Screen.Cursor := Save_Cursor;
            Close;
            frmprogreso.cerrar;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            Exit;
           end;
        end;
        Screen.Cursor := Save_Cursor;
        if DSBarrido.RecordCount > 0 then
          CmdEjecutar.Enabled := True
        else
          MessageDlg('No se Encontraron Colocaciones Vencidas a la Fecha',mtError,[mbcancel],0);
end;


procedure TfrmBarridoCartera.EdFechaBarridoEnter(Sender: TObject);
begin
        FechaHoy := fFechaActual;
end;

procedure TfrmBarridoCartera.EdFechaBarridoExit(Sender: TObject);
begin
        FechaHoy := EdFechaBarrido.Date;
end;

procedure TfrmBarridoCartera.CmdEjecutarClick(Sender: TObject);
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I,J,K,L:Integer;
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
    IdAgencia : Integer;
    Colocacion : string;
    CuotasPendientes : Integer;
    ConsecBarrido : String;
    vNoComprobanteBarrido : string;
    TotalDebitoRecibo : Currency;
    TotalCreditoRecibo : Currency;
    TotalDebito: Currency;
    TotalCredito : Currency;
    DescImpuesto : Currency;
    Conteo:Integer;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
    ConteoConsec : Integer;
    Cuota : Integer;
    PrimerConsec:Boolean;
    ContadorLiq:Integer;
    IdIdentificacion:Integer;
    IdPersona:string;
begin
        CmdEjecutar.Enabled := False;
        Application.ProcessMessages;
        PrimerConsec := False;
        ContadorLiq := 0;
        Ano := IntToStr(YearOf(FechaHoy));
        FechaInicial := EncodeDate(YearOf(FechaHoy),01,01);
        FechaFinal := FechaHoy; //EncodeDate(YearOf(FechaHoy),12,31);

        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        with IBBarrido do
         begin
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('delete from "col$extractobarridotmp"');
           ExecQuery;
           IBBarrido.Close;
           Transaction.Commit;
         end;

        Total := DSBarrido.RecordCount;

        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Efectuando Liquidaciones';
        frmProgreso.Min := 0;
        frmProgreso.Max := Total;
        frmProgreso.Position := 0;
        frmProgreso.Ejecutar;


         with DSBarrido do
         begin
           First;
           while not Eof do
            begin
              frmProgreso.Position := RecNo;
              frmProgreso.InfoLabel := 'Colocaci?n No:' + FieldByName('COLOCACION').AsString + '-' + IntToStr(RecNo);
              Application.ProcessMessages;
              IdIdentificacion := FieldByName('IDIDENTIFICACION').AsInteger;
              IdPersona := FieldByName('IDPERSONA').AsString;
              vTotalAhorros := BuscoSaldoAhorros(IdIdentificacion,IdPersona,FechaInicial,FechaFinal,Ano);
              IdAgencia := FieldByName('AGENCIA').AsInteger;
              Colocacion := FieldByName('COLOCACION').AsString;
              Clasificacion := FieldByName('CLASIFICACION').AsInteger;
              Categoria     := FieldByName('CATEGORIA').AsString;
              Garantia      := FieldByName('GARANTIA').AsInteger;
              SaldoActual   := FieldByName('SALDOACTUAL').AsCurrency;
              TipoInteres   := FieldByName('IDINTERES').AsInteger;
              TipoCuota     := FieldByName('TIPOCUOTA').AsInteger;
              ValorCuota    := FieldByName('VALORCUOTA').AsCurrency;
              if FieldByName('TIPOINTERES').AsString = 'F' then
               ValorTasa := FieldByName('VALORTASA').AsFloat
              else
               ValorTasa := FieldByName('VALORACTUALTASA').AsFloat;
              PuntosAdic := FieldByName('PUNTOSADIC').AsFloat;
              ValorMora     := (ValorTasa + PuntosAdic) + FieldByName('VALORMORA').AsFloat;
              AmortizaK     := FieldByName('AMORTIZAK').AsInteger;
              AmortizaI     := FieldByName('AMORTIZAI').AsInteger;
              DiasProrroga  := FieldByName('DIASPRORROGA').AsInteger;
              FechaPagoK    := FieldByName('FECHAPAGOK').AsDateTime;
              FechaPagoI    := FieldByName('FECHAPAGOI').AsDateTime;
              Estado        := FieldByName('ESTADO').AsInteger;
              CuotasPendientes := FieldByName('CUOTASALIQUIDAR').AsInteger;
              if  CuotasPendientes > 1 then
                  CuotasPendientes := 1;
              I := 1;
              while I <= CuotasPendientes do
               begin
                 Conteo := Conteo + 1;
                 I  := I + 1;
                 Application.ProcessMessages;
                 if FieldByName('TIPOCUOTA').AsInteger = 1 then
                    LiquidarCuotasFija(IdAgencia,Colocacion,1,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                 else if FieldByName('TIPOCUOTA').AsInteger = 2 then
                    LiquidarCuotasVarAnticipada(IdAgencia,Colocacion,1,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                 else if FieldByName('TIPOCUOTA').AsInteger = 3 then
                    LiquidarCuotasVarVencida(IdAgencia,Colocacion,1,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);

                    if CuotasLiq.Lista.Count <= 0 then Break;
                    J := CuotasLiq.Lista.Count - 1;
                    AF := CuotasLiq.Lista.Items[J];
                    vTotalLiquidacion := AF^.Debito;
                    AF^.CodigoPuc := CodigoAhorros;
                    Cuota := AF^.CuotaNumero;
                 //* inicio 4 x mil
                 DescImpuesto := SimpleRoundTo((vTotalLiquidacion/1000) * 4,0);
                 New(AF);
                 AF^.CuotaNumero := 0;
                 AF^.CodigoPuc   := '523050000000000000'{YA ES NIIF};
                 AF^.FechaInicial := FechaHoy;
                 AF^.FechaFinal   := FechaHoy;
                 AF^.Dias         := 0;
                 AF^.Tasa         := 0;
                 AF^.Debito       := DescImpuesto;
                 AF^.Credito      := 0;
                 AF^.EsCapital := False;
                 AF^.EsCausado := False;
                 AF^.EsCorriente := False;
                 AF^.EsVencido := False;
                 AF^.EsAnticipado := False;
                 AF^.EsDevuelto := False;
                 if (AF^.Debito <> 0) or
                    (AF^.Credito <> 0) then
                    CuotasLiq.Lista.Add(AF);

                 New(AF);
                 AF^.CuotaNumero := 0;
                 AF^.CodigoPuc   := '243005000000000000'{YA ES NIIF};
                 AF^.FechaInicial := FechaHoy;
                 AF^.FechaFinal   := FechaHoy;
                 AF^.Dias         := 0;
                 AF^.Tasa         := 0;
                 AF^.Debito       := 0;
                 AF^.Credito      := DescImpuesto;
                 AF^.EsCapital := False;
                 AF^.EsCausado := False;
                 AF^.EsCorriente := False;
                 AF^.EsVencido := False;
                 AF^.EsAnticipado := False;
                 AF^.EsDevuelto := False;
                 if (AF^.Debito <> 0) or
                    (AF^.Credito <> 0) then
                    CuotasLiq.Lista.Add(AF);
                 //* fin 4 x mil
                 if vTotalLiquidacion <= vTotalAhorros then
                  begin
                    ContadorLiq := ContadorLiq + 1;
                    abono_capital := 0;
                    abono_cxc := 0;
                    abono_servicios := 0;
                    abono_mora := 0;
                    abono_anticipado := 0;
                    //Genero el consecutivo
                    ConteoConsec := ObtenerConsecutivoBarrido(IBConsecB);
                    if PrimerConsec = False then
                     begin
                       ConsecBarridoInicial := FormatCurr('00000000',ConteoConsec);
                       PrimerConsec := True;
                     end;

                    ConsecBarrido := FormatCurr('00000000',ConteoConsec);
                    for K := 0 to CuotasLiq.Lista.Count - 1 do
                     begin
                       AF := CuotasLiq.Lista.Items[K];
                       if AF^.EsCapital then
                          abono_capital := abono_capital + AF^.Credito;
                       if AF^.EsCausado then
                          abono_cxc := abono_cxc + AF^.Credito;
                       if AF^.EsCorriente then
                          abono_servicios := abono_servicios + AF^.Credito;
                       if AF^.EsVencido then
                          abono_mora := abono_mora + AF^.Credito;
                       if AF^.EsAnticipado then
                          abono_anticipado := abono_anticipado + AF^.Credito;
                     end; //for K
                    TotalDebitoRecibo := 0;
                    TotalCreditoRecibo := 0;
                    for L := 0 to CuotasLiq.Lista.Count - 1 do
                     begin
                       Application.ProcessMessages;
                       AF := CuotasLiq.Lista.Items[L];
                       TotalDebitoRecibo := TotalDebitoRecibo + AF^.Debito;
                       TotalCreditoRecibo := TotalCreditoRecibo + AF^.Credito;
                     end; // for L
                    //**grabarextracto

                    if IBTBarrido.InTransaction then
                      IBTBarrido.Commit;
                    IBTBarrido.StartTransaction;

                    with IBExtracto do
                     begin
                       Close;
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
                       ParamByName('ID_AGENCIA').AsInteger := agencia;
                       ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(ConsecBarrido);
                       ParamByName('ID_COLOCACION').AsString := Colocacion;
                       ParamByName('FECHA_EXTRACTO').AsDate := FechaHoy;
                       ParamByName('HORA_EXTRACTO').AsDateTime := fHoraActual;
                       ParamByName('CUOTA_EXTRACTO').AsInteger := Cuota;
                       ParamByName('TIPO_OPERACION').AsInteger := 1;
                       ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := SaldoActual; //vSaldoActual;
                       ParamByName('ABONO_CAPITAL').AsCurrency := abono_capital;
                       ParamByName('ABONO_CXC').AsCurrency := abono_cxc;
                       ParamByName('ABONO_SERVICIOS').AsCurrency := abono_servicios;
                       ParamByName('ABONO_ANTICIPADO').AsCurrency := abono_anticipado;
                       ParamByName('ABONO_MORA').AsCurrency := abono_mora;
                       ParamByName('ABONO_SEGURO').AsCurrency := 0;
                       ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
                       ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
                       ParamByName('ABONO_OTROS').AsCurrency := 0;
                       ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasa;
                       ParamByName('ID_EMPLEADO').AsString := DBAlias;
                       ParamByName('INTERES_PAGO_HASTA').AsDate := CuotasLiq.InteresesHasta;
                       ParamByName('CAPITAL_PAGO_HASTA').AsDate := CuotasLiq.CapitalHasta;
                       ParamByName('TIPO_ABONO').AsBoolean := False;
                       ExecQuery;
                       Close;
                       //fin  grabarextracto

                       //grabartablaliquidacion
                       sql.Clear;
                       sql.Add('update "col$tablaliquidacion" set');
                       sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
                       sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
                       sql.Add(' where ');
                       sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                       sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
                       sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
                       ParamByName('ID_AGENCIA').AsInteger := agencia;
                       ParamByName('ID_COLOCACION').AsString := Colocacion;
                       ParamByName('CUOTA_NUMERO').AsInteger := Cuota;
                       ParamByName('PAGADA').AsInteger := 1;
                       ParamByName('FECHA_PAGADA').AsDate := FechaHoy;
                       ExecQuery;
                       Close;
                       //fin grabar tablaliquidacion

                       SQL.Clear;
                       SQL.Add('insert into "col$extractodet" values (');
                       SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
                       SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
                       SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
                       if  CuotasLiq.Lista.Count > 0 then
                       for L := 0 to CuotasLiq.Lista.Count - 1 do
                        begin
                          Application.ProcessMessages;
                          AF := CuotasLiq.Lista.Items[L];
                          ParamByName('ID_AGENCIA').AsInteger := agencia;
                          ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(ConsecBarrido);
                          ParamByName('ID_COLOCACION').AsString := colocacion;
                          ParamByName('FECHA_EXTRACTO').AsDate := FechaHoy;
                          ParamByName('HORA_EXTRACTO').AsDateTime := fHoraActual;
                          ParamByName('CODIGO_PUC').AsString := AF^.CodigoPuc;
                          ParamByName('FECHA_INICIAL').AsDate := AF^.FechaInicial;
                          ParamByName('FECHA_FINAL').AsDate := AF^.FechaFinal;
                          ParamByName('DIAS_APLICADOS').AsInteger := AF^.Dias;
                          ParamByName('TASA_LIQUIDACION').AsFloat := AF^.Tasa;
                          ParamByName('VALOR_DEBITO').AsCurrency := AF^.Debito;
                          ParamByName('VALOR_CREDITO').AsCurrency := AF^.Credito;
                          ExecQuery;
                          Close;
                        end;     //fin for L dentro ibquery2


                       // alimento tabla para comprobante
                       SQL.Clear;
                       SQL.Add('insert into "col$extractobarridotmp" values (');
                       SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
                       SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
                       SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
                       if  CuotasLiq.Lista.Count > 0 then
                       for L := 0 to CuotasLiq.Lista.Count - 1 do
                        begin
                          Application.ProcessMessages;
                          AF := CuotasLiq.Lista.Items[L];
                          ParamByName('ID_AGENCIA').AsInteger := agencia;
                          ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(ConsecBarrido);
                          ParamByName('ID_COLOCACION').AsString := colocacion;
                          ParamByName('FECHA_EXTRACTO').AsDate := FechaHoy;
                          ParamByName('HORA_EXTRACTO').AsDateTime := fHoraActual;
                          ParamByName('CODIGO_PUC').AsString := AF^.CodigoPuc;
                          ParamByName('FECHA_INICIAL').AsDate := AF^.FechaInicial;
                          ParamByName('FECHA_FINAL').AsDate := AF^.FechaFinal;
                          ParamByName('DIAS_APLICADOS').AsInteger := AF^.Dias;
                          ParamByName('TASA_LIQUIDACION').AsFloat := AF^.Tasa;
                          ParamByName('VALOR_DEBITO').AsCurrency := AF^.Debito;
                          ParamByName('VALOR_CREDITO').AsCurrency := AF^.Credito;
                          ExecQuery;
                          Close;
                        end;     //fin alimentar tabla de extracto para comprobante

                       sql.Clear;
                       sql.Add('update "col$colocacion" set ');
                       sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
                       sql.Add('"col$colocacion"."FECHA_CAPITAL" =:"FECHA_CAPITAL",');
                       sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
                       sql.Add(' where ');
                       sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                       sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
                       ParamByName('ID_AGENCIA').AsInteger := agencia;
                       ParamByName('ID_COLOCACION').AsString := colocacion;
                       ParamByName('ABONOS_CAPITAL').AsCurrency := abono_capital;
                       ParamByName('FECHA_CAPITAL').AsDate := CuotasLiq.CapitalHasta;
                       ParamByName('FECHA_INTERES').AsDate := CuotasLiq.InteresesHasta;
                       ExecQuery;
                       Close;

                       //**Actualizo extracto y saldos mes
                       SQL.Clear;
                       SQL.Add('insert into "cap$extracto" values(');
                       SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
                       SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
                       SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
                       SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO",:"ID")');
                       ParamByName('ID_AGENCIA').AsInteger := Agencia;
                       ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
                       ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
                       ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
                       ParamByName('FECHA_MOVIMIENTO').AsDate := FechaHoy;
                       ParamByName('HORA_MOVIMIENTO').AsTime := fHoraActual;
                       if vTotalLiquidacion > 0 then
                        begin
                          ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 4;
                          ParamByName('DOCUMENTO_MOVIMIENTO').AsString := ConsecBarrido;
                          ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'DESCUENTO COLOCACION No.' + colocacion;
                          ParamByName('VALOR_DEBITO').AsCurrency := 0;
                          ParamByName('VALOR_CREDITO').AsCurrency := vTotalLiquidacion;
                          ParamByName('ID').AsInteger := 0;
                          try
                           ExecQuery;
                             if RowsAffected < 1 then
                              begin
                                MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
                                Exit;
                              end;
                          except
                           frmProgreso.Cerrar;
                           MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
                           Exit;
                          end; // del try
                          Close;
                        end; // fin if vtotalliquidacion interno
                     end; // fin with//***fin actualizo extracto
                    vTotalAhorros := vTotalAhorros - vTotalLiquidacion;
                    SaldoActual := SaldoActual - abono_capital;
                    IBTBarrido.Commit;
                    VerificarCancelacionCredito(Agencia,Colocacion);
                  end;
               end; // fin for cuotas pendientes
              DSBarrido.Next;
            end; // fin while not ibquery1.eof
            ConsecBarridoFinal := FormatCurr('00000000',ConteoConsec);
            frmProgreso.Cerrar;
          end; // fin with ibquery1 Select tabla barrido


        //**Busco Valores y Genero el comprobante
     if ContadorLiq > 0 then
      begin
        with IBQTabla do
         begin
           if Transaction.InTransaction then
             Transaction.Commit;
           Transaction.StartTransaction;

           Close;
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('SUM("col$extractobarridotmp".VALOR_DEBITO) as TOTALDEBITO,');
           SQL.Add('SUM("col$extractobarridotmp".VALOR_CREDITO) as TOTALCREDITO');
           SQL.Add('from "col$extractobarridotmp"');
           Open;
           TotalDebito := FieldByName('TOTALDEBITO').AsCurrency;
           TotalCredito := FieldByName('TOTALCREDITO').AsCurrency;
           Close;
         end;

        VNocomprobante := FormatCurr('00000000',ObtenerConsecutivo(IBConsecB));

        with IBcomprobante do
         begin
           Close;
           sql.Clear;
           sql.Add('insert into CON$COMPROBANTE (CON$COMPROBANTE."ID_COMPROBANTE",');
           sql.Add('CON$COMPROBANTE."FECHADIA", CON$COMPROBANTE."TIPO_COMPROBANTE",');
           sql.Add('CON$COMPROBANTE."ID_AGENCIA", CON$COMPROBANTE."DESCRIPCION",');
           sql.Add('CON$COMPROBANTE."TOTAL_DEBITO", CON$COMPROBANTE."TOTAL_CREDITO",');
           sql.Add('CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO",');
           sql.Add('CON$COMPROBANTE."ANULACION", CON$COMPROBANTE."ID_EMPLEADO") ');
           sql.Add('values (');
           sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
           sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
           sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
           ParamByName('ID_COMPROBANTE').AsString:= vNoComprobante;
           ParamByname('FECHADIA').AsDate := FechaHoy;
           ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
           ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
           ParamByName('DESCRIPCION').AsString := 'Descuento de Cartera por Barrido de Fecha ' + DateToStr(fFechaActual) + ' A las ' + FormatDateTime('T',fHoraActual);
           ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebito;
           ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCredito;
           ParamByName('ESTADO').AsString  := 'O';
           ParamByname('ANULACION').asstring := '';
           ParamByName('IMPRESO').AsInteger  := 1;
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ExecQuery;
           Close;
         end;

        with IBQTabla do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('CODIGO_PUC, SUM(VALOR_DEBITO) AS DEBITO, SUM(VALOR_CREDITO) AS CREDITO');
           SQL.Add('from "col$extractobarridotmp"');
           SQL.Add('group by CODIGO_PUC');
           Open;

           while not IBQTabla.Eof do
           begin
            with IBcomprobante do
             begin
              Close;
              SQL.Clear;
              SQL.Add('insert into CON$AUXILIAR values (');
              SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
              SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
              SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX", :"TIPO_COMPROBANTE")');
              ParamByName('ID_COMPROBANTE').AsString := vNoComprobante;
              ParamByName('ID_AGENCIA').AsInteger:= Agencia;
              ParamByName('FECHA').AsDate := FechaHoy;
              ParamByName('CODIGO').AsString := IBQTabla.FieldByName('CODIGO_PUC').AsString;
              ParamByName('DEBITO').AsCurrency := IBQTabla.FieldByName('DEBITO').AsCurrency;
              ParamByName('CREDITO').AsCurrency := IBQTabla.FieldByName('CREDITO').AsCurrency;
              ParamByName('ID_CUENTA').AsInteger := 0;
              ParamByName('ID_COLOCACION').AsString := '';
              ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              ParamByName('ID_PERSONA').AsString := '';
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
              ExecQuery;
              Close;
             end;
            Next;
           end;

           with IBCuotas do
            begin
              Close;
              SQL.Clear;
              SQL.Add('insert into "col$controlbarrido" values');
              SQL.Add('(:FECHA,:HORA,:CONSECINI,:CONSECFIN,:ID_COMPROBANTE,:IMPRESO)');
              ParamByName('FECHA').AsDate := FechaHoy;
              ParamByName('HORA').AsTime := fHoraActual;
              ParamByName('CONSECINI').AsInteger := StrToInt(ConsecBarridoInicial);
              ParamByName('CONSECFIN').AsInteger := StrToInt(ConsecBarridoFinal);
              ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(vNoComprobante);
              ParamByName('IMPRESO').AsInteger := 0;
              ExecQuery;
              Close;
              Transaction.Commit;
            end;

          Transaction.Commit;
          CmdImprimir.Enabled := True;
         end;
      end
     else
      begin
        MessageDlg('No se Realizaron Liquidaciones por Insuficiencia de Ahorros',mtError,[mbcancel],0);
      end; // Fin if conteoconsec > 1
        Screen.Cursor := Save_Cursor;
end;

function TfrmBarridoCartera.BuscoSaldoAhorros(vtipoid:Integer;vNumeroId:string;FechaInicial:TDate;FechaFinal:TDate;Ano:string) : Currency;
begin
  with IBSaldo do
   begin
     if Transaction.InTransaction then
       Transaction.Rollback;
     Transaction.StartTransaction;
     Close;
     SQL.Clear;
     SQL.Add('select CODIGO from COL$CODIGOSPUCBASICOS where ID_CODIGOPUCBASICO = 1');
     ExecQuery;
     CodigoCaja := FieldByName('CODIGO').AsString;
     Close;

     SQL.Clear;
     SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 2');
     ExecQuery;
     CodigoAhorros := FieldByName('CODIGO_CONTABLE').AsString;
     Close;

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

     SQL.Clear;
     SQL.Add('select SALDO_DISPONIBLE from SALDOS_VIGENTES(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
     ParamByName('AG').AsInteger := Agencia;
     ParamByName('TP').AsInteger := 2;
     ParamByName('NM').AsInteger := NumeroCuenta;
     ParamByName('DG').AsInteger := DigitoCuenta;
     ParamByName('ANO').AsString := Ano;
     ParamByName('FECHA1').AsDate := FechaInicial;
     ParamByName('FECHA2').AsDate := FechaFinal;
     try
      ExecQuery;
      if RecordCount < 1 then
        SaldoAhorros := 0
      else
        SaldoAhorros := FieldByName('SALDO_DISPONIBLE').AsCurrency;
        Transaction.Commit;
     except
      MessageDlg('Error Consultando Saldo Ahorros',mtError,[mbcancel],0);
      raise;
      Transaction.Rollback;
      Exit;
     end;

     Result := SaldoAhorros;
   end;
end;
procedure TfrmBarridoCartera.CmdImprimirClick(Sender: TObject);
var Tabla:string;
    I:Integer;
    AF:PCuotasLiq;
    vColocacion : string;
    vComprobante : string;
    Fecha : TDate;
    CapitalHasta : TDate;
    InteresHasta : TDate;
    SaldoAnterior : Currency;
    Cuota : Integer;
    Nuevosaldo : Currency;
    FechaaPagar: TDate;
    frmVistaPreliminar:TfrmVistaPreliminar;
    Cuenta : string;
    ValorSaldo : Currency;
    CuotaProx : TDate;
    imprimir : Boolean;
    anulacion : string;
     Device, Driver, Port: array[0..255] of char;
     PrinterName: string;
     buf:array[0..255] of char;
     Handle, hDeviceMode: THandle;
begin
        Printer.GetPrinter(Device,Driver,Port,hDeviceMode);
        PrinterName := Format('%s', [Device]);
        EdImpresora.Caption := PrinterName;

        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        if IBTExtracto.InTransaction then
          IBTExtracto.Rollback;
        IBTExtracto.StartTransaction;

         with IBGrupo1 do
          begin
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('"col$extracto".ID_COLOCACION,');
           SQL.Add('"col$extracto".ID_CBTE_COLOCACION,');
           SQL.Add('"col$extracto".FECHA_EXTRACTO,');
           SQL.Add('"col$extracto".CAPITAL_PAGO_HASTA,');
           SQL.Add('"col$extracto".INTERES_PAGO_HASTA,');
           SQL.Add('"col$extracto".SALDO_ANTERIOR_EXTRACTO,');
           sql.Add('("col$extracto".SALDO_ANTERIOR_EXTRACTO - "col$extracto".ABONO_CAPITAL) as SALDO,');
           SQL.Add('"col$extracto".ID_EMPLEADO,');
           SQL.Add('"col$extracto".CUOTA_EXTRACTO,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
           SQL.Add('"col$extractobarridotmp".CODIGO_PUC,');
           SQL.Add('"col$extractobarridotmp".FECHA_INICIAL,');
           SQL.Add('"col$extractobarridotmp".FECHA_FINAL,');
           SQL.Add('"col$extractobarridotmp".DIAS_APLICADOS,');
           SQL.Add('"col$extractobarridotmp".TASA_LIQUIDACION,');
           SQL.Add('"col$extractobarridotmp".VALOR_DEBITO,');
           SQL.Add('"col$extractobarridotmp".VALOR_CREDITO,');
           SQL.Add('CON$PUC.NOMBRE as CUENTA,');
           SQL.Add('"gen$empleado".PRIMER_APELLIDO as APE1EMPLEADO,');
           SQL.Add('"gen$empleado".SEGUNDO_APELLIDO as APE2EMPLEADO,');
           SQL.Add('"gen$empleado".NOMBRE as NOMEMPLEADO');
           SQL.Add('from "col$extractobarridotmp" ');
           SQL.Add('left join "col$colocacion" on ("col$extractobarridotmp".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$extractobarridotmp".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
           SQL.Add('LEFT JOIN "gen$persona" on ("gen$persona".ID_IDENTIFICACION = "col$colocacion".ID_IDENTIFICACION and ');
           SQL.Add('"gen$persona".ID_PERSONA = "col$colocacion".ID_PERSONA)');
           SQL.Add('LEFT JOIN CON$PUC ON ("col$extractobarridotmp".CODIGO_PUC = CON$PUC.CODIGO and ');
           SQL.Add('"col$extractobarridotmp".ID_AGENCIA = CON$PUC.ID_AGENCIA )');
           SQL.Add('inner join "col$extracto" on ("col$extractobarridotmp".ID_AGENCIA = "col$extracto".ID_AGENCIA and');
           SQL.Add('"col$extractobarridotmp".ID_COLOCACION = "col$extracto".ID_COLOCACION and ');
           SQL.Add('"col$extractobarridotmp".ID_CBTE_COLOCACION = "col$extracto".ID_CBTE_COLOCACION and ');
           SQL.Add('"col$extractobarridotmp".HORA_EXTRACTO = "col$extracto".HORA_EXTRACTO)');
           SQL.Add('inner join "gen$empleado" on ("col$extracto".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('where');
           SQL.Add('"col$extractobarridotmp".ID_CBTE_COLOCACION >= :"ID1" and "col$extractobarridotmp".ID_CBTE_COLOCACION <= :"ID2"');
           SQL.Add('and "col$extractobarridotmp".FECHA_EXTRACTO = :"FECHA_EXTRACTO"');
           SQL.Add('order by "col$extractobarridotmp".ID_CBTE_COLOCACION,  "col$extractobarridotmp".VALOR_CREDITO');
           ParamByName('ID1').AsString :=  ConsecBarridoInicial;
           ParamByName('ID2').AsString :=  ConsecBarridoFinal;
           ParamByName('FECHA_EXTRACTO').AsDate := FechaHoy;
           Open;
           Last;
           First;

         with IBGrupo2 do
          begin
            SQL.Clear;
            SQL.Add('select ');
            SQL.Add('"col$extracto".ID_COLOCACION,');
            SQL.Add('"col$extracto".FECHA_EXTRACTO,');
            SQL.Add('("col$extracto".ABONO_CAPITAL + "col$extracto".ABONO_CXC');
            SQL.Add('+ "col$extracto".ABONO_ANTICIPADO + "col$extracto".ABONO_SERVICIOS');
            SQL.Add('+ "col$extracto".ABONO_MORA) AS LIQUIDACION,');
            SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
            SQL.Add('"col$colocacion".ID_PERSONA,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE');
            SQL.Add('from "col$extracto"');
            SQL.Add('left join "col$colocacion" on ("col$extracto".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
            SQL.Add('LEFT JOIN "gen$persona" on ("gen$persona".ID_IDENTIFICACION = "col$colocacion".ID_IDENTIFICACION and');
            SQL.Add('"gen$persona".ID_PERSONA = "col$colocacion".ID_PERSONA)');
            SQL.Add('where');
            SQL.Add('"col$extracto".ID_CBTE_COLOCACION >= :"ID1" and "col$extracto".ID_CBTE_COLOCACION <= :"ID2"');
            SQL.Add('and "col$extracto".FECHA_EXTRACTO = :"FECHA_EXTRACTO"');
            SQL.Add('order by "col$extracto".ID_COLOCACION');
            ParamByName('ID1').AsString := ConsecBarridoInicial;
            ParamByName('ID2').AsString := ConsecBarridoFinal;
            ParamByName('FECHA_EXTRACTO').AsDate := FechaHoy;
            Open;
            Last;
            First;

           Printer.GetPrinter(Device,Driver,Port,hDeviceMode);
           PrinterName := Format('%s', [Device]);
           EdImpresora.Caption := PrinterName;

// Imprimir Comprobante
       Empleado;
       with IBAuxiliar do
        begin
          sql.Clear;
          SQL.Add('Select');
          SQL.Add('CON$COMPROBANTE.ID_COMPROBANTE,');
          SQL.Add('CON$COMPROBANTE.FECHADIA,');
          SQL.Add('CON$COMPROBANTE.DESCRIPCION,');
          SQL.Add('CON$COMPROBANTE.TOTAL_DEBITO,');
          SQL.Add('CON$COMPROBANTE.TOTAL_CREDITO,');
          SQL.Add('CON$COMPROBANTE.ESTADO,');
          SQL.Add('CON$COMPROBANTE.IMPRESO,');
          SQL.Add('CON$COMPROBANTE.ANULACION,');
          SQL.Add('CON$AUXILIAR.CODIGO,');
          SQL.Add('CON$PUC.NOMBRE,');
          SQL.Add('CON$AUXILIAR.DEBITO,');
          SQL.Add('CON$AUXILIAR.CREDITO,');
          SQL.Add('CON$AUXILIAR.ID_CUENTA,');
          SQL.Add('CON$AUXILIAR.ID_COLOCACION,');
          SQL.Add('CON$AUXILIAR.ID_IDENTIFICACION,');
          SQL.Add('CON$AUXILIAR.ID_PERSONA,');
          SQL.Add('CON$AUXILIAR.MONTO_RETENCION,');
          SQL.Add('CON$AUXILIAR.TASA_RETENCION,');
          SQL.Add('CON$TIPOCOMPROBANTE.DESCRIPCION AS DESCRIPCION1,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          SQL.Add('from CON$AUXILIAR');
          SQL.Add('inner join CON$COMPROBANTE on (CON$AUXILIAR.ID_COMPROBANTE = CON$COMPROBANTE.ID_COMPROBANTE and CON$AUXILIAR.ID_AGENCIA = CON$COMPROBANTE.ID_AGENCIA)');
          SQL.Add('inner join CON$TIPOCOMPROBANTE on (CON$COMPROBANTE.TIPO_COMPROBANTE = CON$TIPOCOMPROBANTE.ID)');
          SQL.Add('INNER join CON$PUC ON (CON$AUXILIAR.CODIGO = CON$PUC.CODIGO)');
          SQL.Add('inner join "gen$agencia" on (CON$AUXILIAR.ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('where CON$AUXILIAR.ID_COMPROBANTE =:"ID_COMPROBANTE"');
          SQL.Add('and CON$AUXILIAR.ID_AGENCIA =:"ID_AGENCIA"');
          SQL.Add('order by CON$AUXILIAR.CREDITO');
          ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(VNocomprobante);
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;


          Report.Variables.ByName['EMPRESA'].AsString := Empresa;
          Report.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          Report.Variables.ByName['NIT'].AsString := Nit;

          if Report.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := Report;
             frmVistaPreliminar.ShowModal;
           end;
        IBAuxiliar.Close;
        IBGrupo1.Close;
        IBGrupo2.Close;
        end;
        end;
          end;

        CmdCerrar.SetFocus;
end;

procedure TfrmBarridoCartera.FormShow(Sender: TObject);
var
     Device, Driver, Port: array[0..255] of char;
     PrinterName: string;
     buf:array[0..255] of char;
     Handle, hDeviceMode: THandle;
begin
        EdFechaBarrido.Date := fFechaActual;
        FechaHoy := EdFechaBarrido.Date;
        Printer.GetPrinter(Device,Driver,Port,hDeviceMode);
        PrinterName := Format('%s', [Device]);
        EdImpresora.Caption := PrinterName;
        CmdProcesar.SetFocus;
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
end;

procedure TfrmBarridoCartera.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmBarridoCartera.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmBarridoCartera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
end;

procedure TfrmBarridoCartera.ReportUnknownVariable(Sender: TObject;
  const VarName: String; var Value: TprVarValue; var IsProcessed: Boolean);
var
FechaProx, Saldo, Cuenta : String;
ValorSaldo : Currency;
CuotaProx : string;
begin
    if (VarName = 'Saldo') then
     begin
       with IBGrupo3 do
        begin
          SQL.Clear;
          SQL.Add('Select ');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) as SALDO,');
          SQL.Add('from "col$colocacion"');
          SQL.Add('where ');
          SQL.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
          ParamByName('ID_COLOCACION').AsString := IBGrupo1.FieldByName('ID_COLOCACION').AsString;
          Open;
          ValorSaldo := FieldByName('SALDO').AsCurrency;
          Close;
        end;
       _vSetAsDouble(Value,ValorSaldo);
       IsProcessed := True;
     end;

    if (VarName = 'FechaProx') then
     begin
        with IBGrupo3 do
         begin
           sql.Clear;
           SQL.Add('Select FECHA_A_PAGAR, CAPITAL_A_PAGAR');
           SQL.Add('from "col$tablaliquidacion"');
           SQL.Add('where ');
           SQL.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$tablaliquidacion".PAGADA = 0');
           SQL.Add('order by FECHA_A_PAGAR');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := IBGrupo1.FieldByName('ID_COLOCACION').AsString;
           Open;
           Last;
           First;
           if FieldByName('FECHA_A_PAGAR').AsDateTime = 0 then
              CuotaProx := '0000/00/00'
           else
              CuotaProx := DateToStr(FieldByName('FECHA_A_PAGAR').AsDateTime);
{              SQL.Add('select FECHA_A_PAGAR, CUOTA_NUMERO ');
              SQL.Add('from "col$tablaliquidacion"');
              SQL.Add('where ');
              SQL.Add('ID_AGENCIA =:"ID_AGENCIA" and');
              SQL.Add('ID_COLOCACION =:"ID_COLOCACION" and');
              SQL.Add('CUOTA_NUMERO = :"CUOTA_NUMERO"');
              SQL.Add('order by CUOTA_NUMERO');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := IBGrupo1.FieldByName('ID_COLOCACION').AsString;
              ParamByName('CUOTA_NUMERO').AsInteger := IBGrupo1.FieldByName('CUOTA_EXTRACTO').AsInteger + 1;
              Open;
              CuotaProx := FieldByName('FECHA_A_PAGAR').AsDateTime; }
              Close;
         end;
      _vSetAsString(Value,CuotaProx);
       IsProcessed := True;
     end;

    if (VarName = 'Cuenta') then
     begin
        with IBGrupo3 do
         begin
           sql.Clear;
           Sql.Add('select * from P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           ParamByName('ID_AGENCIA').AsInteger;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           ParamByName('ID_IDENTIFICACION').AsInteger := IBGrupo1.FieldByName('ID_IDENTIFICACION').AsInteger;
           ParamByName('ID_PERSONA').AsString := IBGrupo1.FieldByName('ID_PERSONA').AsString;
           Open;
           Cuenta := IntToStr(FieldByName('NUMERO_CUENTA').AsInteger) + '-' + DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)); ;
           Close;
         end;
      _vSetAsString(Value,Cuenta);
       IsProcessed := True;
     end;

    if (VarName = 'CuentaRes') then
     begin
        with IBBarrido do
         begin
           sql.Clear;
           Sql.Add('select * from P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           ParamByName('ID_AGENCIA').AsInteger;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           ParamByName('ID_IDENTIFICACION').AsInteger := IBGrupo2.FieldByName('ID_IDENTIFICACION').AsInteger;
           ParamByName('ID_PERSONA').AsString := IBGrupo2.FieldByName('ID_PERSONA').AsString;
           ExecQuery;
           Cuenta := IntToStr(FieldByName('NUMERO_CUENTA').AsInteger) + '-' + DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)); ;
           Close;
         end;
      _vSetAsString(Value,Cuenta);
       IsProcessed := True;
     end;
end;

procedure TfrmBarridoCartera.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBarridoCartera.cmdImpresoraClick(Sender: TObject);
begin
        PrinterSetupDialog1.Execute;
end;

procedure TfrmBarridoCartera.ReportPrintComplete(Sender: TObject);
begin
        with IBCuotas do
         begin
           Close;
           SQL.Clear;
           SQL.Add('update "col$controlbarrido" set IMPRESO = 1');
           SQL.Add('where');
           SQL.Add('ID_COMPROBANTE = :ID_COMPROBANTE and');
           SQL.Add('FECHA = :FECHA');
           ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(VNocomprobante);
           ParamByName('FECHA').AsDate := FechaHoy;
           ExecQuery;
           Close;
           Transaction.Commit;
         end;
end;

end.
