unit UnitCausacionCarteraDiariaAuto;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Math, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IB, IBSQL, DB, IBCustomDataSet, IBQuery,
  ComCtrls, Grids, DBGrids, XStringGrid, Buttons,UnitDmGeneral, UnitDmColocacion,
  pr_Common, pr_TxClasses, IBDatabase, DBClient, Provider;

type
  TfrmCausacionCarteraDiariaAuto = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    RGProceso: TRadioGroup;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    IBSQL1: TIBSQL;
    CmdCerrar: TBitBtn;
    EdCapital: TMaskEditCellEditor;
    EdInteres: TMaskEditCellEditor;
    EdCostas: TMaskEditCellEditor;
    CmdProcesar: TBitBtn;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    IBQuery1: TIBQuery;
    IBQVarios: TIBQuery;
    CmdImprimir: TBitBtn;
    CmdAplicar: TBitBtn;
    CmdComprobante: TBitBtn;
    IBQuery2: TIBQuery;
    IBTAdicional: TIBTransaction;
    CmdImprimirProvision: TBitBtn;
    Label2: TLabel;
    EdComprobante: TStaticText;
    IBAuxiliar: TIBQuery;
    ReporteCom: TprTxReport;
    IBSQL5: TIBSQL;
    IBTAlterna: TIBTransaction;
    IBQuery3: TIBQuery;
    IBSQL6: TIBSQL;
    IBSQL7: TIBSQL;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GridP: TXStringGrid;
    TabSheet2: TTabSheet;
    XSauxiliar: TXStringGrid;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Edittotaldebito: TMemo;
    Edittotalcredito: TMemo;
    IBSQL8: TIBSQL;
    IBSQL9: TIBSQL;
    IBQuery4: TIBQuery;
    ReporteDN: TprTxReport;
    IBQuery5: TIBQuery;
    CDReal: TClientDataSet;
    IBQReal: TIBQuery;
    DPReal: TDataSetProvider;
    IBSQL10: TIBSQL;
    IBActualizaGarReal: TIBSQL;
    IBTransaction1: TIBTransaction;
    CDReal1: TClientDataSet;
    IBSQL11: TIBSQL;
    IBQRealAct: TIBQuery;
    Reporte: TprTxReport;
    ReporteD: TprTxReport;
    Button1: TButton;
    BtnCorregirMora: TBitBtn;
    btnReNota: TBitBtn;
    edCuadre: TMemo;
    IBQnota: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmdImprimirClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure EdFechaCorteChange(Sender: TObject);
    procedure CmdComprobanteClick(Sender: TObject);
    procedure CmdImprimirProvisionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnCorregirMoraClick(Sender: TObject);
    procedure btnReNotaClick(Sender: TObject);
  private
    { Private declarations }
    procedure EvaluarCortoPlazo;
    function EvaluarEdad(Clasificacion, Garantia, Dias: Integer; FColocacion: String): string;
//    procedure PrimerPaso;
//    procedure SegundoPaso;
    function CalculoAportes(id: integer; pr: string): currency;
    procedure PrimerPasoComprobante;
    procedure ActualizarGrid;
    procedure SegundoPasoComprobante;
    procedure TercerPasoComprobante;
    procedure CuartoPasoComprobante;
    procedure QuintoPasoComprobante;
    procedure SextoPasoComprobante;
    procedure SeptimoPasoComprobante;
    procedure OctavoPasoComprobante;
    procedure PrimerPasoCausacion;
    procedure SegundoPasoCausacion;
    procedure NovenoPasoComprobante;
    procedure DecimoPasoComprobante;
    procedure TercerPasoCausacion;
    function BuscoTasaAnt(Ag: integer; Colocacion: string;FechaIntereses:TDate): Single;
    procedure PrimerPC;
    procedure SegundoPC;
    procedure TercerPC;
    procedure CuartoPC;
    procedure QuintoPC;
    procedure SextoPC;
    procedure SeptimoPC;
    procedure OctavoPC;
    procedure NovenoPC;
    procedure DecimoPC;
    procedure OncePC;
    procedure ContabilizarCPLP;
    procedure ContabilizarKC;
    procedure ContabilizarCau;
    procedure ContabilizarR;
    procedure DescuentoGarReal;
    procedure CalculoProvision;
    procedure GarantiasReales;
    procedure verificarCuadre(linea: String);
  public
    { Public declarations }
  end;

type
  PList = ^AList;
  AList = record
    codigo   : string;
    nomcuenta: string;
    debito   : currency;
    credito  : currency;
    nocuenta : integer;
    nocredito: string;
    tipoide  : integer;
    idpersona: string;
    monto    : currency;
    tasa     : single;
    estado   : string;
  end;

var
  frmCausacionCarteraDiariaAuto: TfrmCausacionCarteraDiariaAuto;
  dmColocacion: TdmColocacion;
// Variables
    Total,Dias,DiasCorrientes,DiasContingencia,DiasANT,DiasCXC,DiasCON :Integer;
    Anticipados,Causados,Contingentes,Aportes,Capital,Interes,PCostas,CortoPlazo,LargoPlazo,Costas:Currency;
    FechaInicial,FechaFinal:TDate;
    Tasa,TasaMax,TasaAnt:Single;
    Tasa1:Single;
    NumeroCuenta,DigitoCuenta:Integer;
    Saldo:Currency;
    Edad:string;
    Consecutivo:Integer;
    Lista:TList;
    //Variables de Fecha
    _dFechaInicial :TDate;
    _dFechaFinal :TDate;
    _dfechaHoy :TDate;
    _iAno :Integer;
    //Variables de tasa
    _cTasaIpcNueva :Single;
    _cTasaDtfMaxima :Single;
    _diferencia: Currency;


implementation

{$R *.dfm}

uses UnitGlobales,UnitGlobalesCol, UnitFechaAEvaluar,
     UnitPantallaProgreso;

var frmPantallaProgreso:TfrmProgreso;


procedure TfrmCausacionCarteraDiariaAuto.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(self);
end;


procedure TfrmCausacionCarteraDiariaAuto.FormShow(Sender: TObject);
var I:Integer;
    Fecha: TDateTime;
begin
        with IBSQL1 do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         try
           ExecQuery;
           I := 0;
           while not Eof do begin
                I := I + 1;
                GridP.Cells[0,I] := IntToStr(FieldByName('ID_CLASIFICACION').AsInteger) + '->'+ FieldByName('DESCRIPCION_CLASIFICACION').AsString;
                GridP.Cells[1,I] := IntToStr(FieldByName('ID_GARANTIA').AsInteger) + '->'+ FieldByName('DESCRIPCION_GARANTIA').AsString;
                GridP.Cells[2,I] := FieldByName('ID_EDAD').AsString;
                GridP.Cells[3,I] := Format('%3.2f',[FieldByName('A_CAPITAL').AsFloat]);
                GridP.Cells[4,I] := Format('%3.2f',[FieldByName('A_INTERESES').AsFloat]);
                GridP.Cells[5,I] := Format('%3.2f',[FieldByName('A_COSTAS').AsFloat]);
            Next;
           end;
         except
           raise;
         end;
        end;
        EdFechaCorte.Date := fFechaActual;
        if MonthOf(EdFechaCorte.Date) <> 2 then
        begin
            if TryEncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),30,Fecha) then EdFechaCorte.Date := Fecha;
        end
        else
            if TryEncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)),Fecha) then EdFechaCorte.Date := Fecha;
        
        _diferencia := 0;

        CmdProcesar.Click;
end;


procedure TfrmCausacionCarteraDiariaAuto.CmdCerrarClick(Sender: TObject);
begin
        PostMessage(Handle, WM_CLOSE, 0, 0);
        modalresult := mrCancel;
end;

procedure TfrmCausacionCarteraDiariaAuto.CmdProcesarClick(Sender: TObject);
begin
        _iAno := YearOf(EdFechaCorte.Date);
        _dfechaHoy := EdFechaCorte.Date;
        _dFechaInicial := EncodeDate(YearOf(Date),01,01);
        _dFechaFinal := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)));
        RGProceso.Enabled := False;
        CmdProcesar.Enabled := False;
        Application.ProcessMessages;
        PrimerPasoCausacion;
        Application.ProcessMessages;
//        BtnCorregirMora.Click;
        SegundoPasoCausacion;
        Application.ProcessMessages;
        GarantiasReales;
        Application.ProcessMessages;
        CalculoProvision;
        Application.ProcessMessages;
        if RGProceso.ItemIndex = 1 then begin
           {if IBSQL9.Transaction.InTransaction then
             IBSQL9.Transaction.Rollback;
           IBSQL9.Transaction.StartTransaction;
           IBSQL9.Close;
           IBSQL9.SQL.Clear;
           IBSQL9.SQL.Add('EXECUTE PROCEDURE P_COL_RECUPERACIONES');
           IBSQL9.ExecQuery;
           IBSQL9.Transaction.Commit;}
           TercerPasoCausacion;
           Application.ProcessMessages;
           CmdAplicar.Enabled := True;
           CmdAplicar.Click;           
        end;
        CmdImprimir.Enabled := True;
        CmdImprimirProvision.Enabled := True;

end;

procedure TfrmCausacionCarteraDiariaAuto.EvaluarCortoPlazo;
begin
              if CortoPlazo < 1 then begin
                 CortoPlazo := Saldo;
                 LargoPlazo := 0;
                 Exit;
              end;

              if CortoPlazo > Saldo then begin
                 CortoPlazo := Saldo;
                 LargoPlazo := 0;
                 Exit;
              end;

              if (CortoPlazo + LargoPlazo) < Saldo then
              begin
               if LargoPlazo > 0 then
                  LargoPlazo := Saldo - CortoPlazo
               else
               begin
                 CortoPlazo := Saldo;
                 LargoPlazo := 0;
               end;
               Exit;
              end;

              LargoPlazo := Saldo - CortoPlazo;
              if LargoPlazo < 1 then LargoPlazo := 0;
end;


procedure TfrmCausacionCarteraDiariaAuto.FormDestroy(Sender: TObject);
begin
        dmColocacion.Free;
end;

function TfrmCausacionCarteraDiariaAuto.EvaluarEdad(Clasificacion,
  Garantia,Dias: Integer; FColocacion: String): string;
var  
  _edad, _eval: String;
begin
        with IBQVarios do begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_CATEGORIA from COL$CODIGOSPUC where ');
          SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ');
          SQL.Add('ID_GARANTIA = :ID_GARANTIA and :DIAS BETWEEN DIAS_INICIALES and DIAS_FINALES');
          ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
          ParamByName('ID_GARANTIA').AsInteger := Garantia;
          ParamByName('DIAS').AsInteger := Dias;
          try
           Open;
           _edad := FieldByName('ID_CATEGORIA').AsString;
           if _edad = '' then Result := 'A';
          except
           _edad := 'A';
          end;
        end;

        with IBQVarios do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT FIRST 1 e.EVALUACION FROM "col$evaluacion" e WHERE e.ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := FColocacion;
          Open;
          _eval := FieldByName('EVALUACION').AsString;
          if _edad < _eval then
          begin
             _edad := _eval;
          end;
        end;
        result := _edad;
end;

{procedure TfrmCausacionColocaciones.PrimerPaso;
var I :Integer;
begin
        frmPantallaProgreso := TfrmProgreso.Create(Self);
// Actualizar tabla de tasas
        with IBSQL2 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('update "col$porccausacion" set');
          SQL.Add('A_CAPITAL = :A_CAPITAL,A_INTERESES = :A_INTERESES,A_COSTAS = :A_COSTAS');
          SQL.Add('where');
          SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ID_GARANTIA = :ID_GARANTIA and ID_EDAD = :ID_EDAD');
          frmPantallaProgreso.Min := 1;
          frmPantallaProgreso.Max := GridP.RowCount - 1;
          frmPantallaProgreso.Position := 1;
          frmPantallaProgreso.Info.Caption := 'Progreso Actual';
          frmPantallaProgreso.InfoLabel := 'Actualizando Tabla de Valores a Provisionar';
          frmPantallaProgreso.Ejecutar;
          for I := 1 to GridP.RowCount - 1 do
          begin
              frmPantallaProgreso.Position := I;
              Application.ProcessMessages;
              ParamByName('ID_CLASIFICACION').AsInteger := StrToInt(LeftStr(GridP.Cells[0,I],1));
              ParamByName('ID_GARANTIA').AsInteger := StrToInt(LeftStr(GridP.Cells[1,I],1));
              ParamByName('ID_EDAD').AsString := GridP.Cells[2,I];
              ParamByName('A_CAPITAL').AsFloat := StrToFloat(GridP.Cells[3,I]);
              ParamByName('A_INTERESES').AsFloat := StrToFloat(GridP.Cells[4,I]);
              ParamByName('A_COSTAS').AsFloat := StrToFloat(GridP.Cells[5,I]);
              try
               ExecQuery;
              except
               frmPantallaProgreso.Cerrar;
               raise;
              end;
          end; // for

          try
             Transaction.Commit;
          except
             frmPantallaProgreso.Cerrar;
             raise;
          end;

        end; // with
// fin actualizacion tabla de tasas

        with IBSQL3 do begin
           if Transaction.InTransaction then Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('delete from "col$causacionestmp"');
           try
            ExecQuery;
            Transaction.Commit;
           except
            MessageDlg('No se pudo vaciar la tabla anterior',mtError,[mbcancel],0);
            Transaction.Rollback;
            Exit;
           end;
        end;

        with IBQuery1 do begin
            if Transaction.InTransaction then Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('select * from P_COL_003');
            try
             Open;
            except
             Transaction.Rollback;
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;

            Total := FieldByName('TOTAL').AsInteger;

            Close;
            SQL.Clear;
            SQL.Add('select * from P_COL_004');
            try
             Open;
            except
             Transaction.Rollback;
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;
         end;
            frmPantallaProgreso.Min := 0;
            frmPantallaProgreso.Max := Total;
            frmPantallaProgreso.Position := 0;
            frmPantallaProgreso.InfoLabel := 'Procesando Causaci?n de Colocaciones';
            while not IBQuery1.Eof do
            begin
                frmPantallaProgreso.Position := IBQuery1.RecNo;
                Application.ProcessMessages;
                FechaInicial := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                FechaFinal := EdFechaCorte.Date;
                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('select DIAS_INICIALES from COL$CODIGOSPUC where');
                IBSQL3.SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ');
                IBSQL3.SQL.Add('ID_GARANTIA = :ID_GARANTIA and ');
                IBSQL3.SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
                IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                IBSQL3.ParamByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
                IBSQL3.ParamByName('ID_CATEGORIA').AsString := 'C';
                try
                 IBSQL3.ExecQuery;
                except
                 IBQuery1.Transaction.Rollback;
                 frmPantallaProgreso.Cerrar;
                 Exit;
                end;// try
                Saldo := IBQuery1.FieldByName('SALDO').AsCurrency;
                DiasContingencia := IBSQL3.FieldByName('DIAS_INICIALES').AsInteger;
                Dias := DiasEntre(FechaInicial,FechaFinal);

                if Dias > 0 then
                  if (Dias >= DiasContingencia) then begin
                     DiasANT := 0;
                     DiasCON := Dias - (DiasContingencia - 1);
                     DiasCXC := DiasContingencia - 1;
                  end
                  else
                  begin
                     DiasANT := 0;
                     DiasCON := 0;
                     DiasCXC := Dias;
                  end// if
                else
                 begin
                  DiasANT := Dias * -1;
                  DiasCON := 0;
                  DiasCXC := 0;
                 end; // if
// Calculo Tasa sobre la cual liquidar
            if IBQuery1.FieldByName('TIPO_INTERES').AsString = 'F' then begin
               Tasa := IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
               TasaMax := BuscoTasaEfectivaMaximaNueva(IBQVarios,EdFechaCorte.Date);
             end
            else begin
               Tasa := IBQuery1.FieldByName('VALOR_ACTUAL_TASA').AsFloat;
               if IBQuery1.FieldByName('ID_INTERES').AsInteger = 1 then
                 TasaMax := BuscoTasaEfectivaMaximaDtfNueva(IBQVarios,EdFechaCorte.Date)
               else
                 TasaMax := BuscoTasaEfectivaMaximaIPCNueva(IBQVarios);
            end;

            if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'A' then
             begin
              Tasa := TasaNominalAnticipada(Tasa,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
              TasaMax := TasaNominalAnticipada(TasaMax,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
             end
            else
             begin
              Tasa := TasaNominalVencida(Tasa,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
              TasaMax := TasaNominalVencida(TasaMax,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
             end;

            Tasa := Tasa + IBQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
            if Tasa > TasaMax then
              Tasa := TasaMax;
// Fin Calculo Tasa
// Calculo Intereses
            Anticipados := SimpleRoundTo(((IBQuery1.FieldByName('SALDO').AsCurrency * (Tasa/100)) / 360 ) * DiasANT,0);
            Causados  := SimpleRoundTo(((IBQuery1.FieldByName('SALDO').AsCurrency * (Tasa/100)) / 360 ) * DiasCXC,0);
            Contingentes := SimpleRoundTo(((IBQuery1.FieldByName('SALDO').AsCurrency * (Tasa/100)) / 360 ) * DiasCON,0);
// Fin Calculo Intereses
            Aportes := 0;
// Evaluar Edad
            DiasCorrientes := Dias;
            if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'V' then
               Dias := Dias - IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
            if Dias < 1 then Dias := 0;
            Edad := EvaluarEdad(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,
                                IBQuery1.FieldByName('ID_GARANTIA').AsInteger,Dias);
// Calculo Corto y Largo Plazo
            if Edad = 'A' then
              with IBSQL3 do begin
               Close;
               SQL.Clear;
               SQL.Add('select * from "col$tablaliquidacion"');
               SQL.Add(' where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION") AND');
               SQL.Add(' (PAGADA = 0) ORDER BY FECHA_A_PAGAR');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
              if RecordCount > 0 then
              while not Eof do
              begin
                if DiasEntre(EdFechaCorte.Date,FieldbyName('FECHA_A_PAGAR').AsDate) <= 360 then
                   CortoPlazo := CortoPlazo + SimpleRoundTo(FieldByName('CAPITAL_A_PAGAR').AsCurrency,0)
                else
                   LargoPlazo := LargoPlazo + SimpleRoundTo(FieldByName('CAPITAL_A_PAGAR').AsCurrency,0);
              Next;
              end; // while
              Close;
              EvaluarCortoPlazo;
              end // whit
            else
              begin
                CortoPlazo := 0;
                LargoPlazo := 0;
              end; // if
// Fin Corto y Largo Plazo
// Leo Costas Judiciales;
            with IBSQL3 do begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT SUM(VALOR_COSTAS) AS COSTAS FROM "col$costas"');
             SQL.Add('WHERE ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
             ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
             ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
             try
              ExecQuery;
              Costas := FieldByName('COSTAS').AsCurrency;
             except
              Costas := 0;
             end;
            end;
// Fin Leo Costas
// Insertar datos en tabla temporal
            with IBSQL4 do begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "col$causacionestmp" values(:ID_AGENCIA,');
                SQL.Add(':ID_COLOCACION,:FECHA_CORTE,:ID_CLASIFICACION,:ID_GARANTIA,:ID_EDAD,:ID_ARRASTRE,');
                SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,:VALOR,:DEUDA,');
                SQL.Add(':FECHA_CAPITAL,:FECHA_INTERES,:DIAS,:ANTICIPADOS,');
                SQL.Add(':CAUSADOS,:CONTINGENCIAS,:APORTES,:PCAPITAL,:PINTERES,');
                SQL.Add(':PCOSTAS,:CORTO_PL,:LARGO_PL,:COSTAS)');
                ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                ParamByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
                ParamByName('ID_EDAD').AsString := Edad;
                ParamByName('ID_ARRASTRE').AsString := Edad;
                ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                ParamByName('VALOR').AsCurrency := IBQuery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                ParamByName('DEUDA').AsCurrency := IBQuery1.FieldByName('SALDO').AsCurrency;
                ParamByName('FECHA_CAPITAL').AsDate := IBQuery1.FieldByName('FECHA_CAPITAL').AsDateTime;
                ParamByName('FECHA_INTERES').AsDate := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                ParamByName('DIAS').AsInteger := DiasCorrientes;
                ParamByName('ANTICIPADOS').AsCurrency := Anticipados;
                ParamByName('CAUSADOS').AsCurrency := Causados;
                ParamByName('CONTINGENCIAS').AsCurrency := Contingentes;
                ParamByName('APORTES').AsCurrency := Aportes;
                ParamByName('PCAPITAL').AsCurrency := 0;
                ParamByName('PINTERES').AsCurrency := 0;
                ParamByName('PCOSTAS').AsCurrency := 0;
                ParamByName('CORTO_PL').AsCurrency := CortoPlazo;
                ParamByName('LARGO_PL').AsCurrency := LargoPlazo;
                ParamByName('COSTAS').AsCurrency := Costas;
                try
                 ExecQuery;
                except
                 MessageDlg('Error al Guardar Datos Temporale',mtError,[mbcancel],0);
                 frmProgreso.Cerrar;
                 Transaction.Rollback;
                 raise;
                 Exit;
                end;
            end;
// Continuar ciclo while
            IBQuery1.Next;
            end; // while
            IBQuery1.Transaction.Commit;
            IBQuery1.Close;
            frmPantallaProgreso.Cerrar;
            Application.ProcessMessages;
end;
}
{procedure TfrmCausacionColocaciones.SegundoPaso;
var id_ant:Integer;
    pr_ant:string;
    edad_ant:string;
    primerpaso:Boolean;
    vAportes:Currency;
    AportesCon:Currency;
    Deuda:Currency;
begin
          frmPantallaProgreso  := TfrmProgreso.Create(Self);
          frmPantallaProgreso.Min := 0;
          frmPantallaProgreso.Max := Total;
          frmPantallaProgreso.InfoLabel := 'Aplicando Ley de Arrastre';
          frmPantallaProgreso.Position := 0;
          frmPantallaProgreso.Ejecutar;
          primerpaso := True;
          id_ant := 0;
          pr_ant := '';
          with IBQuery1 do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$causacionestmp" order by ID_IDENTIFICACION,ID_PERSONA,ID_EDAD DESC,ID_AGENCIA,ID_COLOCACION');
           try
            Open;
           except
            MessageDlg('Error al Iniciar la Tabla Temporal para el Segundo proceso',mtError,[mbcancel],0);
            Transaction.Rollback;
            raise;
            Exit;
           end;
          end;

          id_ant := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
          pr_ant := IBQuery1.FieldByName('ID_PERSONA').AsString;
          edad_ant := IBQuery1.FieldByName('ID_EDAD').AsString;
          AportesCon := CalculoAportes(id_ant,pr_ant);
          primerpaso := True;

          while not IBQuery1.Eof  do begin
              frmPantallaProgreso.Position := IBQuery1.RecNo;
              Application.ProcessMessages;
              if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> id_ant) or
                 (IBQuery1.FieldByName('ID_PERSONA').AsString <> pr_ant) then
              begin
                 id_ant := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                 pr_ant := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 edad_ant := IBQuery1.FieldByName('ID_EDAD').AsString;
                 AportesCon := CalculoAportes(id_ant,pr_ant);
              end;
              Deuda := IBQuery1.FieldByName('DEUDA').AsCurrency;
// Calculo Provisiones
                with IBSQL3 do begin
                   Close;
                   SQL.Clear;
                   SQL.Add('SELECT A_CAPITAL,A_INTERESES,A_COSTAS from "col$porccausacion" where');
                   SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ID_GARANTIA = :ID_GARANTIA and');
                   SQL.Add('ID_EDAD = :ID_EDAD');
                   ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                   ParamByName('ID_GARANTIA').AsInteger := IBQuery1.fieldbyname('ID_GARANTIA').AsInteger;
                   ParamByName('ID_EDAD').AsString := edad_ant;
                   try
                    ExecQuery;
                   except
                    MessageDlg('Error al Buscar Datos Para Aplicar Provisi?n',mtError,[mbcancel],0);
                    frmPantallaProgreso.Cerrar;
                    raise;
                    Exit;
                   end; // try
                   Capital := SimpleRoundTo(IBQuery1.FieldByName('DEUDA').AsCurrency * (FieldByName('A_CAPITAL').AsFloat / 100),0);
                   Interes := SimpleRoundTo(IBQuery1.FieldByName('CAUSADOS').AsCurrency * (FieldByName('A_INTERESES').AsFloat / 100),0);
                   PCostas := SimpleRoundTo(IBQuery1.FieldByName('COSTAS').AsCurrency * (FieldByName('A_COSTAS').AsFloat / 100),0);
                end; // with
// Fin Calculo Provisiones
// Valido Aportes
                if AportesCon > Deuda then
                begin
                   vAportes := Deuda;
                   AportesCon := AportesCon - vAportes;
                end
                else if Deuda > AportesCon then begin
                     vAportes := AportesCon;
                     AportesCon := 0;
                end;



// Fin Valido Aportes
// Actualizar Provision y Edad por Arrastre
                 with IBSQL3 do begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update "col$causacionestmp" SET ID_ARRASTRE = :ID_ARRASTRE,');
                    SQL.Add('PCAPITAL = :PCAPITAL, PINTERES = :PINTERES, PCOSTAS = :PCOSTAS, APORTES = :APORTES');
                    SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
                    ParamByName('ID_AGENCIA').AsInteger := IBQuery1.fieldbyname('ID_AGENCIA').AsInteger;
                    ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                    ParamByName('ID_ARRASTRE').AsString := edad_ant;
                    ParamByName('PCAPITAL').AsCurrency := Capital;
                    ParamByName('PINTERES').AsCurrency := Interes;
                    ParamByName('PCOSTAS').AsCurrency := PCostas;
                    ParamByName('APORTES').AsCurrency := vAportes;
                    try
                      ExecQuery;
                    except
                      frmPantallaProgreso.Cerrar;
                      MessageDlg('Error Actualizando Tabla Temporal',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                    end;
                 end; // with
// Fin Actualizaci?n
          IBQuery1.Next;
          end; // while
          IBQuery1.Close;
          IBQuery1.Transaction.Commit;
          frmPantallaProgreso.Cerrar;
end;
}
function TfrmCausacionCarteraDiariaAuto.CalculoAportes(id: integer;
  pr: string): currency;
begin
// Calculo Aportes
            with IBSQL3 do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT *  FROM P_CAP_0008 (:ID_AGENCIA,');
               SQL.Add(':ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
               ParamByName('ID_IDENTIFICACION').AsInteger := id;
               ParamByName('ID_PERSONA').AsString := pr;
               try
                ExecQuery;
                NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                DigitoCuenta := FieldByName('DIGITO_CUENTA').AsInteger;
               except
                Result := 0;
                Transaction.Rollback;
                raise;
                Exit;
               end;

               Close;
               SQL.Clear;
//               SQL.Add('SELECT SALDO_ACTUAL FROM SALDO_ACTUAL(:ID_AGENCIA,:TIPO,:CUENTA,:DIGITO,:ANO,:FECHA1,:FECHA2)');
               SQL.Add('SELECT SALDO_ACTUAL FROM SALDO_ACTUAL_MES(:ID_AGENCIA,:TIPO,:CUENTA,:DIGITO,:ANO,:FECHA1,:FECHA2)');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('TIPO').AsInteger := 1;
               ParamByName('CUENTA').AsInteger := NumeroCuenta;
               ParamByName('DIGITO').AsInteger := DigitoCuenta;
               parambyname('ANO').AsInteger := _iAno;//IntToStr(Yearof(Date));
               Parambyname('FECHA1').asDate := _dFechaInicial;// EncodeDate(YearOf(Date),01,01);
               ParamByName('FECHA2').AsDate := _dFechaFinal;// EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)));
               try
                ExecQuery;
                Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
               except
                Result := 0;
                Transaction.Rollback;
                raise;
                Exit;
               end;
            end;
            Result := Saldo;
end;

procedure TfrmCausacionCarteraDiariaAuto.CmdImprimirClick(Sender: TObject);
begin
          if IBQuery1.Transaction.InTransaction then
             IBQuery1.Transaction.Rollback;
          IBQuery1.Transaction.StartTransaction;

          IBQuery1.Close;
          IBQuery1.SQL.Clear;
          IBQuery1.SQL.Add('SELECT');
          IBQuery1.SQL.Add('c.ID_AGENCIA,');
          IBQuery1.SQL.Add('c.ID_COLOCACION,');
          IBQuery1.SQL.Add('c.FECHA_CORTE,');
          IBQuery1.SQL.Add('c.ID_CLASIFICACION,');
          IBQuery1.SQL.Add('c.ID_GARANTIA,');
          IBQuery1.SQL.Add('c.ID_EDAD_ANT,');
          IBQuery1.SQL.Add('c.ID_ARRASTRE,');
          IBQuery1.SQL.Add('c.ID_IDENTIFICACION,');
          IBQuery1.SQL.Add('c.ID_PERSONA,');
          IBQuery1.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery1.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery1.SQL.Add('"col$categoria".DESCRIPCION_CATEGORIA,');
          IBQuery1.SQL.Add('c.VALOR,');
          IBQuery1.SQL.Add('c.DEUDA,');
          IBQuery1.SQL.Add('c.FECHA_CAPITAL,');
          IBQuery1.SQL.Add('c.FECHA_INTERES,');
          IBQuery1.SQL.Add('c.DIAS,');
          IBQuery1.SQL.Add('c.MOROSIDAD,');
          IBQuery1.SQL.Add('c.ANTICIPADOS,');
          IBQuery1.SQL.Add('c.CAUSADOS,');
          IBQuery1.SQL.Add('c.CONTINGENCIAS,');
          IBQuery1.SQL.Add('c.APORTES,');
          IBQuery1.SQL.Add('c.PCAPITAL,');
          IBQuery1.SQL.Add('c.PINTERES,');
          IBQuery1.SQL.Add('c.PCOSTAS,');
          IBQuery1.SQL.Add('c.CORTO_PL,');
          IBQuery1.SQL.Add('c.LARGO_PL,');
          IBQuery1.SQL.Add('c.COSTAS,');
          IBQuery1.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBQuery1.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBQuery1.SQL.Add('"gen$persona".NOMBRE');
          IBQuery1.SQL.Add('FROM');
          IBQuery1.SQL.Add('"col$causaciondiariatmp" c');
          IBQuery1.SQL.Add('LEFT JOIN "gen$persona" ON ');
          IBQuery1.SQL.Add('(c.ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
          IBQuery1.SQL.Add('(c.ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBQuery1.SQL.Add('LEFT JOIN "col$clasificacion" ON (c.ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery1.SQL.Add('LEFT JOIN "col$garantia" ON (c.ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          IBQuery1.SQL.Add('LEFT JOIN "col$categoria" ON (c.ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          IBQuery1.SQL.Add('where FECHA_CORTE = :FECHA AND DEUDA > 0 and c.ID_CLASIFICACION = 1');
          IBQuery1.SQL.Add('ORDER BY');
          IBQuery1.SQL.Add('c.ID_GARANTIA,');
          IBQuery1.SQL.Add('c.ID_ARRASTRE,');
          IBQuery1.SQL.Add('c.ID_AGENCIA,');
          IBQuery1.SQL.Add('c.ID_COLOCACION');
          IBQuery1.ParamByName('FECHA').AsDate := EdFechaCorte.Date;

          IBQuery2.Close;
          IBQuery2.SQL.Clear;
          IBQuery2.SQL.Add('SELECT');
          IBQuery2.SQL.Add('c.ID_AGENCIA,');
          IBQuery2.SQL.Add('c.ID_COLOCACION,');
          IBQuery2.SQL.Add('c.FECHA_CORTE,');
          IBQuery2.SQL.Add('c.ID_CLASIFICACION,');
          IBQuery2.SQL.Add('c.ID_GARANTIA,');
          IBQuery2.SQL.Add('c.ID_EDAD_ANT,');
          IBQuery2.SQL.Add('c.ID_ARRASTRE,');
          IBQuery2.SQL.Add('c.ID_IDENTIFICACION,');
          IBQuery2.SQL.Add('c.ID_PERSONA,');
          IBQuery2.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery2.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery2.SQL.Add('"col$categoria".DESCRIPCION_CATEGORIA,');
          IBQuery2.SQL.Add('c.VALOR,');
          IBQuery2.SQL.Add('c.DEUDA,');
          IBQuery2.SQL.Add('c.FECHA_CAPITAL,');
          IBQuery2.SQL.Add('c.FECHA_INTERES,');
          IBQuery2.SQL.Add('c.DIAS,');
          IBQuery2.SQL.Add('c.MOROSIDAD,');
          IBQuery2.SQL.Add('c.ANTICIPADOS,');
          IBQuery2.SQL.Add('c.CAUSADOS,');
          IBQuery2.SQL.Add('c.CONTINGENCIAS,');
          IBQuery2.SQL.Add('c.APORTES,');
          IBQuery2.SQL.Add('c.PCAPITAL,');
          IBQuery2.SQL.Add('c.PINTERES,');
          IBQuery2.SQL.Add('c.PCOSTAS,');
          IBQuery2.SQL.Add('c.CORTO_PL,');
          IBQuery2.SQL.Add('c.LARGO_PL,');
          IBQuery2.SQL.Add('c.COSTAS,');
          IBQuery2.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBQuery2.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBQuery2.SQL.Add('"gen$persona".NOMBRE');
          IBQuery2.SQL.Add('FROM');
          IBQuery2.SQL.Add('"col$causaciondiariatmp" c');
          IBQuery2.SQL.Add('LEFT JOIN "gen$persona" ON ');
          IBQuery2.SQL.Add('(c.ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
          IBQuery2.SQL.Add('(c.ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBQuery2.SQL.Add('LEFT JOIN "col$clasificacion" ON (c.ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery2.SQL.Add('LEFT JOIN "col$garantia" ON (c.ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          IBQuery2.SQL.Add('LEFT JOIN "col$categoria" ON (c.ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          IBQuery2.SQL.Add('where FECHA_CORTE = :FECHA AND DEUDA > 0 and c.ID_CLASIFICACION = 2');
          IBQuery2.SQL.Add('ORDER BY');
          IBQuery2.SQL.Add('c.ID_GARANTIA,');
          IBQuery2.SQL.Add('c.ID_ARRASTRE,');
          IBQuery2.SQL.Add('c.ID_AGENCIA,');
          IBQuery2.SQL.Add('c.ID_COLOCACION');
          IBQuery2.ParamByName('FECHA').AsDate := EdFechaCorte.Date;

          IBQuery3.Close;
          IBQuery3.SQL.Clear;
          IBQuery3.SQL.Add('SELECT');
          IBQuery3.SQL.Add('c.ID_AGENCIA,');
          IBQuery3.SQL.Add('c.ID_COLOCACION,');
          IBQuery3.SQL.Add('c.FECHA_CORTE,');
          IBQuery3.SQL.Add('c.ID_CLASIFICACION,');
          IBQuery3.SQL.Add('c.ID_GARANTIA,');
          IBQuery3.SQL.Add('c.ID_EDAD_ANT,');
          IBQuery3.SQL.Add('c.ID_ARRASTRE,');
          IBQuery3.SQL.Add('c.ID_IDENTIFICACION,');
          IBQuery3.SQL.Add('c.ID_PERSONA,');
          IBQuery3.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery3.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery3.SQL.Add('"col$categoria".DESCRIPCION_CATEGORIA,');
          IBQuery3.SQL.Add('c.VALOR,');
          IBQuery3.SQL.Add('c.DEUDA,');
          IBQuery3.SQL.Add('c.FECHA_CAPITAL,');
          IBQuery3.SQL.Add('c.FECHA_INTERES,');
          IBQuery3.SQL.Add('c.DIAS,');
          IBQuery3.SQL.Add('c.MOROSIDAD,');
          IBQuery3.SQL.Add('c.ANTICIPADOS,');
          IBQuery3.SQL.Add('c.CAUSADOS,');
          IBQuery3.SQL.Add('c.CONTINGENCIAS,');
          IBQuery3.SQL.Add('c.APORTES,');
          IBQuery3.SQL.Add('c.PCAPITAL,');
          IBQuery3.SQL.Add('c.PINTERES,');
          IBQuery3.SQL.Add('c.PCOSTAS,');
          IBQuery3.SQL.Add('c.CORTO_PL,');
          IBQuery3.SQL.Add('c.LARGO_PL,');
          IBQuery3.SQL.Add('c.COSTAS,');
          IBQuery3.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBQuery3.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBQuery3.SQL.Add('"gen$persona".NOMBRE');
          IBQuery3.SQL.Add('FROM');
          IBQuery3.SQL.Add('"col$causaciondiariatmp" c');
          IBQuery3.SQL.Add('LEFT JOIN "gen$persona" ON ');
          IBQuery3.SQL.Add('(c.ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
          IBQuery3.SQL.Add('(c.ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBQuery3.SQL.Add('LEFT JOIN "col$clasificacion" ON (c.ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery3.SQL.Add('LEFT JOIN "col$garantia" ON (c.ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          IBQuery3.SQL.Add('LEFT JOIN "col$categoria" ON (c.ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          IBQuery3.SQL.Add('where FECHA_CORTE = :FECHA AND DEUDA > 0 and c.ID_CLASIFICACION = 3');
          IBQuery3.SQL.Add('ORDER BY');
          IBQuery3.SQL.Add('c.ID_GARANTIA,');
          IBQuery3.SQL.Add('c.ID_ARRASTRE,');
          IBQuery3.SQL.Add('c.ID_AGENCIA,');
          IBQuery3.SQL.Add('c.ID_COLOCACION');
          IBQuery3.ParamByName('FECHA').AsDate := EdFechaCorte.Date;

          IBQuery4.Close;
          IBQuery4.SQL.Clear;
          IBQuery4.SQL.Add('SELECT');
          IBQuery4.SQL.Add('c.ID_AGENCIA,');
          IBQuery4.SQL.Add('c.ID_COLOCACION,');
          IBQuery4.SQL.Add('c.FECHA_CORTE,');
          IBQuery4.SQL.Add('c.ID_CLASIFICACION,');
          IBQuery4.SQL.Add('c.ID_GARANTIA,');
          IBQuery4.SQL.Add('c.ID_EDAD_ANT,');
          IBQuery4.SQL.Add('c.ID_ARRASTRE,');
          IBQuery4.SQL.Add('c.ID_IDENTIFICACION,');
          IBQuery4.SQL.Add('c.ID_PERSONA,');
          IBQuery4.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery4.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery4.SQL.Add('"col$categoria".DESCRIPCION_CATEGORIA,');
          IBQuery4.SQL.Add('c.VALOR,');
          IBQuery4.SQL.Add('c.DEUDA,');
          IBQuery4.SQL.Add('c.FECHA_CAPITAL,');
          IBQuery4.SQL.Add('c.FECHA_INTERES,');
          IBQuery4.SQL.Add('c.DIAS,');
          IBQuery4.SQL.Add('c.MOROSIDAD,');
          IBQuery4.SQL.Add('c.ANTICIPADOS,');
          IBQuery4.SQL.Add('c.CAUSADOS,');
          IBQuery4.SQL.Add('c.CONTINGENCIAS,');
          IBQuery4.SQL.Add('c.APORTES,');
          IBQuery4.SQL.Add('c.PCAPITAL,');
          IBQuery4.SQL.Add('c.PINTERES,');
          IBQuery4.SQL.Add('c.PCOSTAS,');
          IBQuery4.SQL.Add('c.CORTO_PL,');
          IBQuery4.SQL.Add('c.LARGO_PL,');
          IBQuery4.SQL.Add('c.COSTAS,');
          IBQuery4.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBQuery4.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBQuery4.SQL.Add('"gen$persona".NOMBRE');
          IBQuery4.SQL.Add('FROM');
          IBQuery4.SQL.Add('"col$causaciondiariatmp" c ');
          IBQuery4.SQL.Add('LEFT JOIN "gen$persona" ON ');
          IBQuery4.SQL.Add('(c.ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
          IBQuery4.SQL.Add('(c.ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBQuery4.SQL.Add('LEFT JOIN "col$clasificacion" ON (c.ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery4.SQL.Add('LEFT JOIN "col$garantia" ON (c.ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          IBQuery4.SQL.Add('LEFT JOIN "col$categoria" ON (c.ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          IBQuery4.SQL.Add('where FECHA_CORTE = :FECHA AND DEUDA > 0 and c.ID_CLASIFICACION = 4');
          IBQuery4.SQL.Add('ORDER BY');
          IBQuery4.SQL.Add('c.ID_GARANTIA,');
          IBQuery4.SQL.Add('c.ID_ARRASTRE,');
          IBQuery4.SQL.Add('c.ID_AGENCIA,');
          IBQuery4.SQL.Add('c.ID_COLOCACION');
          IBQuery4.ParamByName('FECHA').AsDate := EdFechaCorte.Date;

          IBQuery5.Close;
          IBQuery5.SQL.Clear;
          IBQuery5.SQL.Add('select');
          IBQuery5.SQL.Add('SUM(VALOR) as VALOR,');
          IBQuery5.SQL.Add('SUM(DEUDA) as SALDO,');
          IBQuery5.SQL.Add('SUM(ANTICIPADOS) as ANTICIPADOS,');
          IBQuery5.SQL.Add('SUM(CAUSADOS) as CAUSADOS,');
          IBQuery5.SQL.Add('SUM(CONTINGENCIAS) as CONTINGENCIAS,');
          IBQuery5.SQL.Add('SUM(APORTES) as APORTES,');
          IBQuery5.SQL.Add('SUM(PCAPITAL) as PCAPITAL,');
          IBQuery5.SQL.Add('SUM(PINTERES) as PINTERES,');
          IBQuery5.SQL.Add('SUM(PCOSTAS) as PCOSTAS,');
          IBQuery5.SQL.Add('SUM(CORTO_PL) as CORTO_PL,');
          IBQuery5.SQL.Add('SUM(LARGO_PL) as LARGO_PL,');
          IBQuery5.SQL.Add('SUM(COSTAS) as COSTAS');
          IBQuery5.SQL.Add('FROM');
          IBQuery5.SQL.Add('"col$causaciondiariatmp" c');
          IBQuery5.SQL.Add('WHERE FECHA_CORTE = :FECHA');
          IBQuery5.ParamByName('FECHA').AsDate := EdFechaCorte.Date;
          IBQuery5.Open;

          Reporte.Variables.ByName['Valor'].AsDouble := IBQuery5.FieldByName('VALOR').AsCurrency;
          Reporte.Variables.ByName['Saldo'].AsDouble := IBQuery5.FieldByName('SALDO').AsCurrency;
          Reporte.Variables.ByName['Anticipados'].AsDouble := IBQuery5.FieldByName('ANTICIPADOS').AsCurrency;
          Reporte.Variables.ByName['Causados'].AsDouble := IBQuery5.FieldByName('CAUSADOS').AsCurrency;
          Reporte.Variables.ByName['Contingencias'].AsDouble := IBQuery5.FieldByName('CONTINGENCIAS').AsCurrency;
          Reporte.Variables.ByName['Aportes'].AsDouble := IBQuery5.FieldByName('APORTES').AsCurrency;
          Reporte.Variables.ByName['PCapital'].AsDouble := IBQuery5.FieldByName('PCAPITAL').AsCurrency;
          Reporte.Variables.ByName['PInteres'].AsDouble := IBQuery5.FieldByName('PINTERES').AsCurrency;
          Reporte.Variables.ByName['PCostas'].AsDouble := IBQuery5.FieldByName('PCOSTAS').AsCurrency;
          Reporte.Variables.ByName['Corto_pl'].AsDouble := IBQuery5.FieldByName('CORTO_PL').AsCurrency;
          Reporte.Variables.ByName['Largo_pl'].AsDouble := IBQuery5.FieldByName('LARGO_PL').AsCurrency;
          Reporte.Variables.ByName['Costas'].AsDouble := IBQuery5.FieldByName('COSTAS').AsCurrency;


          Reporte.Variables.ByName['Empresa'].AsString := Empresa;
          Reporte.Variables.ByName['Agencia'].AsInteger := Agencia;
          Reporte.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.Date;
          Reporte.Title := 'Calificaci?n,Causaci?n y Provisi?n de Colocaciones';
          if Reporte.PrepareReport then begin
             Reporte.PreviewPreparedReport(true);
          end;
          IBQuery5.Close;
          IBQuery1.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.CmdAplicarClick(Sender: TObject);
var Total:Integer;
    I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;

begin

        CmdAplicar.Enabled := False;
        Application.ProcessMessages;

        with IBQuery2 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;

           Close;
           SQL.Clear;
           SQL.Add('select count(*) as TOTAL from "col$causaciondiariamovtmp"');
           try
            Open;
            Total := IBQuery2.FieldByName('TOTAL').AsInteger;
           except
             MessageDlg('Error al Buscar Datos a Procesar',mtError,[mbcancel],0);
             Transaction.Rollback;
             raise;
             Exit;
           end;

           Close;
           SQL.Clear;
           SQL.Add('select * from "col$causaciondiariamovtmp"');
           try
            Open;
           except
             MessageDlg('Error al Buscar Datos a Procesar',mtError,[mbcancel],0);
             Transaction.Rollback;
             raise;
             Exit;
           end;
           frmPantallaProgreso := TfrmProgreso.Create(Self);
           frmPantallaProgreso.Min := 0;
           frmPantallaProgreso.Max := Total;
           frmPantallaProgreso.Ejecutar;
           while not Eof do begin
             frmPantallaProgreso.InfoLabel := 'Aplicando Tabla de Movimientos:' + FieldByName('ID_COLOCACION').AsString;
             frmPantallaProgreso.Position :=  RecNo;
             Application.ProcessMessages;

             IBSQL4.Close;
             IBSQL4.SQL.Clear;
             IBSQL4.SQL.Add('update "col$causaciondiariamov" set PCAPITAL_ANUAL = :PCAPITAL_ANUAL, PINTERES_ANUAL = :PINTERES_ANUAL, PCOSTAS_ANUAL = :PCOSTAS_ANUAL,');
             IBSQL4.SQL.Add('PCAPITAL_ACT = :PCAPITAL_ACT, PINTERES_ACT = :PINTERES_ACT, PCOSTAS_ACT = :PCOSTAS_ACT');
             IBSQL4.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
             IBSQL4.ParamByName('ID_AGENCIA').AsInteger := IBQuery2.FieldByName('ID_AGENCIA').AsInteger;
             IBSQL4.ParamByName('ID_COLOCACION').AsString := IBQuery2.FieldByName('ID_COLOCACION').AsString;
             IBSQL4.ParamByName('PCAPITAL_ANUAL').AsCurrency := IBQuery2.FieldByName('PCAPITAL_ANUAL').AsCurrency;
             IBSQL4.ParamByName('PINTERES_ANUAL').AsCurrency := IBQuery2.FieldByName('PINTERES_ANUAL').AsCurrency;
             IBSQL4.ParamByName('PCOSTAS_ANUAL').AsCurrency := IBQuery2.FieldByName('PCOSTAS_ANUAL').AsCurrency;
             IBSQL4.ParamByName('PCAPITAL_ACT').AsCurrency := IBQuery2.FieldByName('PCAPITAL_ACT').AsCurrency;
             IBSQL4.ParamByName('PINTERES_ACT').AsCurrency := IBQuery2.FieldByName('PINTERES_ACT').AsCurrency;
             IBSQL4.ParamByName('PCOSTAS_ACT').AsCurrency := IBQuery2.FieldByName('PCOSTAS_ACT').AsCurrency;
             IBSQL4.ExecQuery;
             if IBSQL4.RowsAffected <= 0 then begin
               IBSQL4.Close;
               IBSQL4.SQL.Clear;
               IBSQL4.SQL.Add('insert into "col$causaciondiariamov" (ID_AGENCIA,ID_COLOCACION,PCAPITAL_ANUAL,PINTERES_ANUAL,PCOSTAS_ANUAL,PCAPITAL_ACT,PINTERES_ACT,PCOSTAS_ACT)');
               IBSQL4.SQL.Add('values (:ID_AGENCIA,:ID_COLOCACION,:PCAPITAL_ANUAL,:PINTERES_ANUAL,:PCOSTAS_ANUAL,:PCAPITAL_ACT,:PINTERES_ACT,:PCOSTAS_ACT)');
               IBSQL4.ParamByName('ID_AGENCIA').AsInteger := IBQuery2.FieldByName('ID_AGENCIA').AsInteger;
               IBSQL4.ParamByName('ID_COLOCACION').AsString := IBQuery2.FieldByName('ID_COLOCACION').AsString;
               IBSQL4.ParamByName('PCAPITAL_ANUAL').AsCurrency := IBQuery2.FieldByName('PCAPITAL_ANUAL').AsCurrency;
               IBSQL4.ParamByName('PINTERES_ANUAL').AsCurrency := IBQuery2.FieldByName('PINTERES_ANUAL').AsCurrency;
               IBSQL4.ParamByName('PCOSTAS_ANUAL').AsCurrency := IBQuery2.FieldByName('PCOSTAS_ANUAL').AsCurrency;
               IBSQL4.ParamByName('PCAPITAL_ACT').AsCurrency := IBQuery2.FieldByName('PCAPITAL_ACT').AsCurrency;
               IBSQL4.ParamByName('PINTERES_ACT').AsCurrency := IBQuery2.FieldByName('PINTERES_ACT').AsCurrency;
               IBSQL4.ParamByName('PCOSTAS_ACT').AsCurrency := IBQuery2.FieldByName('PCOSTAS_ACT').AsCurrency;
               IBSQL4.ExecQuery;
             end;
             IBQuery2.Next;
           end;  //Fin de While
           frmPantallaProgreso.Cerrar;

           Close;
           SQL.Clear;
           SQL.Add('select count(*) as TOTAL from "col$causaciondiaria" where');
           SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
           ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
           try
            Open;
            Total := IBQuery2.FieldByName('TOTAL').AsInteger;
           except
             MessageDlg('Error al Buscar Datos a Procesar',mtError,[mbcancel],0);
             Transaction.Rollback;
             raise;
             Exit;
           end;

           Close;
           SQL.Clear;
           SQL.Add('select * from "col$causaciondiaria" where');
           SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
           SQL.Add('order by "col$causaciondiaria".ID_AGENCIA,"col$causaciondiaria".ID_COLOCACION');
           ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
           try
            Open;
           except
             MessageDlg('Error al Buscar Datos a Procesar',mtError,[mbcancel],0);
             Transaction.Rollback;
             raise;
             Exit;
           end;
           frmPantallaProgreso := TfrmProgreso.Create(Self);
           frmPantallaProgreso.Min := 0;
           frmPantallaProgreso.Max := Total;
           frmPantallaProgreso.Ejecutar;
           while not Eof do begin
             frmPantallaProgreso.InfoLabel := 'Aplicando Calificación:' + FieldByName('ID_COLOCACION').AsString;
             frmPantallaProgreso.Position :=  RecNo;
             Application.ProcessMessages;

             IBSQL4.Close;
             IBSQL4.SQL.Clear;
             IBSQL4.SQL.Add('UPDATE "col$colocacion" SET ID_CATEGORIA = :ID_CATEGORIA, ID_EVALUACION = :ID_EVALUACION');
             IBSQL4.SQL.Add('where "col$colocacion".ID_AGENCIA = :ID_AGENCIA and "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
             IBSQL4.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
             IBSQL4.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
             IBSQL4.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_ARRASTRE').AsString;
             //CAMBIO -- IBSQL4.ParamByName('ID_EVALUACION').AsString := FieldByName('ID_ARRASTRE').AsString;
             IBSQL4.ExecQuery;
             IBQuery2.Next;
           end;
           frmPantallaProgreso.Cerrar;

           Close;
           SQL.Clear;
           SQL.Add('update "col$causacionescontrol" SET APLICADA = 1');
           SQL.Add('where FECHA = :FECHA');
           ParamByName('FECHA').AsDate := EdFechaCorte.Date;
           try
            ExecSQL;
           except
            MessageDlg('Error al Actualizar la Tabla de Control',mtError,[mbcancel],0);
            Transaction.Rollback;
            raise;
            Exit;
           end;

           IBQuery2.Transaction.Commit;
         end;
         // MessageDlg('Calificaci?n Aplicada con Exito!',mtInformation,[mbok],0);
         CmdComprobante.Enabled := True;
         CmdComprobante.Click;
end;

procedure TfrmCausacionCarteraDiariaAuto.EdFechaCorteChange(Sender: TObject);
var Fecha:TDateTime;
begin
        if MonthOf(EdFechaCorte.Date) <> 2 then
        begin
            if TryEncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),30,Fecha) then EdFechaCorte.Date := Fecha;
        end
        else
            if TryEncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)),Fecha) then EdFechaCorte.Date := Fecha;

        with IBSQL2 do begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "col$causacionescontrol" where');
          SQL.Add('FECHA = :FECHA');
          ParamByName('FECHA').AsDate := EdFechaCorte.Date;
          try
           ExecQuery;
          except
           MessageDlg('Error al Verificar Control',mtError,[mbcancel],0);
           raise;
           Exit;
          end;
          if RecordCount > 0 then begin
          if FieldByName('PROCESADA').AsInteger = 0 then begin
            CmdProcesar.Enabled := True;
//            RGProceso.Enabled := True;
            CmdAplicar.Enabled := False;
            CmdComprobante.Enabled := False;
            CmdImprimir.Enabled := False;
            CmdImprimirProvision.Enabled := False;
            btnReNota.Enabled := True;
          end
          else begin
            CmdProcesar.Enabled := False;
//            RGProceso.Enabled := True;
            CmdAplicar.Enabled := True;
            CmdComprobante.Enabled := True;
            CmdImprimir.Enabled := True;
            CmdImprimirProvision.Enabled := True;
            btnReNota.Enabled := True;
          end;

          if FieldByName('APLICADA').AsInteger = 0 then begin
            CmdAplicar.Enabled := True;
            CmdComprobante.Enabled := False;
            CmdImprimir.Enabled := True;
            CmdImprimirProvision.Enabled := True;
          end
          else begin
            CmdAplicar.Enabled := False;
            CmdComprobante.Enabled := True;
            CmdImprimir.Enabled := True;
            CmdImprimirProvision.Enabled := True;
          end;

          if FieldByName('CONTABILIZADA').AsInteger = 0 then begin
            CmdComprobante.Enabled := True;
            Consecutivo := FieldByName('ID_COMPROBANTE').AsInteger;
            EdComprobante.Caption := Format('%.7d',[consecutivo]);
          end
          else begin
            CmdComprobante.Enabled := False;
            Consecutivo := FieldByName('ID_COMPROBANTE').AsInteger;
            EdComprobante.Caption := Format('%.7d',[consecutivo]);
          end;
          end
          else
          begin
            CmdProcesar.Enabled := True;
            CmdAplicar.Enabled := False;
            CmdImprimir.Enabled := False;
            CmdComprobante.Enabled := False;
            CmdImprimirProvision.Enabled := False;
          end;
        end;

end;

procedure TfrmCausacionCarteraDiariaAuto.CmdComprobanteClick(Sender: TObject);
begin
        CmdComprobante.Enabled := False;
        Application.ProcessMessages;

        try
          Lista := Tlist.Create;
        finally
          Lista.Clear;
        end;

        PrimerPC;   // Corto y Largo Plazo
        SegundoPC;  // Ajustar Calificacion
        TercerPC;   // Causacion de Intereses
        CuartoPC;   // Provision de Capital de Colocaciones
        QuintoPC;   // Provision de Interes de Colocaciones y Costas Judiciales
        SextoPC;    // Provision General
        SeptimoPC;  // Traslado de Intereses Anticipados
        OctavoPC;   // Contingencias
        DecimoPC;   // Enviar Comprobante Contable

        OncePC; // Generar notas de soporte

        {
        with IBAuxiliar do begin
         if  Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;

         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
         try
          Open;
          ReporteCom.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteCom.Variables.ByName['NIT'].AsString := Nit;
          if ReporteCom.PrepareReport then
            ReporteCom.PreviewPreparedReport(True);
         except
          MessageDlg('Error al generar el reporte',mtError,[mbcancel],0);
         end;
         Transaction.Commit;
        end;
        }

        CmdCerrar.Click;

end;

procedure TfrmCausacionCarteraDiariaAuto.PrimerPasoComprobante;
var AR : Plist;
    CortoActual,LargoActual:Currency;
    CodigoCorto,CodigoLargo:string;
    ValorCorto,ValorLargo:Currency;
    Aplica :Boolean;
begin
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION, ');
                 SQL.Add('"col$causaciones".ID_GARANTIA,"col$causaciones".ID_EDAD, ');
                 SQL.Add('SUM("col$causaciones".CORTO_PL) AS CORTO,');
                 SQL.Add('SUM("col$causaciones".LARGO_PL) AS LARGO from "col$causaciones"');
                 SQL.Add('inner join COL$CODIGOSPUC on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_EDAD = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".ID_EDAD = '+QuotedStr('A'));
                 SQL.Add('and "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION, "col$causaciones".ID_GARANTIA,');
                 SQL.Add('"col$causaciones".ID_EDAD');
                 SQL.Add('order by "col$causaciones".ID_CLASIFICACION DESC,"col$causaciones".ID_GARANTIA,');
                 SQL.Add('"col$causaciones".ID_EDAD');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Corto y Largo Plazo',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_CAPITAL_CP,COL$CODIGOSPUC.COD_CAPITAL_LP');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := fieldbyname('ID_GARANTIA').AsInteger;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      CodigoCorto := IBSQL3.FieldByName('COD_CAPITAL_CP').AsString;
                      CodigoLargo := IBSQL3.FieldByName('COD_CAPITAL_LP').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Corto y Largo Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoCorto;
                     try
                      IBSQL3.ExecQuery;
                      ValorCorto := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoCorto;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      ValorCorto := ValorCorto + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoLargo;
                     try
                      IBSQL3.ExecQuery;
                      ValorLargo := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoLargo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      ValorLargo := ValorLargo + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;//  Comparar Valor y Contabilizar Diferencia
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoCorto;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if ValorCorto > FieldByName('CORTO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoCorto;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := ValorCorto - FieldByName('CORTO').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if ValorCorto < FieldByName('CORTO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoCorto;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('CORTO').AsCurrency - ValorCorto;
                        Lista.Add(AR);
                        Aplica := True;
                     end;

                     IBSQL3.Close;
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoLargo;
                     IBSQL3.ExecQuery;
                     if ValorLargo > FieldByName('LARGO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoLargo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := ValorLargo - FieldByName('LARGO').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if ValorLargo < FieldByName('LARGO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoLargo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('LARGO').AsCurrency - ValorLargo;
                        Lista.Add(AR);
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               IBSQL2.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.ActualizarGrid;
var
i:integer;
ARecord: PList;
vtotal_debito,vtotal_credito:currency;

begin
   vtotal_debito:= 0;
   vtotal_credito:= 0;
   with Lista do
     if count > 0 then
     begin
      xsauxiliar.RowCount := Count+1;
      for i:=0 to (Count - 1) do
       begin
        Arecord := Items[i];
        xsauxiliar.ColWidths[0] := 112;
        xsauxiliar.Cells [0,i+1] := arecord^.codigo;
        xsauxiliar.ColWidths[1] := 205;
        xsauxiliar.Cells [1,i+1] := arecord^.nomcuenta;
        xsauxiliar.ColWidths[2] := 100;
        xsauxiliar.Cells [2,i+1] := formatcurr ('#,##0.00',Arecord^.debito);
        vtotal_debito := vtotal_debito + ARecord^.debito;
        xsauxiliar.ColWidths[3] := 100;
        xsauxiliar.Cells [3,i+1] := formatcurr ('#,##0.00',Arecord^.credito);
        vtotal_credito := vtotal_credito + Arecord^.credito;
        edittotaldebito.Text := currtostr(vtotal_debito);
        edittotalcredito.Text := currtostr(vtotal_credito);
       end;
    end
    else if count = 0 then
    begin
     edittotaldebito.Text := '0';
     edittotalcredito.Text:= '0';
     xsauxiliar.RowCount := 2;
     xsauxiliar.Cells[0,1]:= '';
     xsauxiliar.Cells[1,1]:= '';
     xsauxiliar.Cells[2,1]:= '';
     xsauxiliar.Cells[3,1]:= '';
     xsauxiliar.Cells[4,1]:= '';
    end;
    Application.ProcessMessages;
end;

procedure TfrmCausacionCarteraDiariaAuto.SegundoPasoComprobante;
var AR:PList;
    Codigo:string;
    Valor:Currency;
    Aplica :Boolean;
begin
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION, ');
                 SQL.Add('"col$causaciones".ID_GARANTIA,"col$causaciones".ID_ARRASTRE, ');
                 SQL.Add('SUM("col$causaciones".DEUDA) AS DEUDA');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join COL$CODIGOSPUC on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".ID_ARRASTRE > '+QuotedStr('A'));
                 SQL.Add('and "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION, "col$causaciones".ID_GARANTIA,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 SQL.Add('order by "col$causaciones".ID_CLASIFICACION DESC,"col$causaciones".ID_GARANTIA,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_CAPITAL_CP');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := fieldbyname('ID_GARANTIA').AsInteger;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_ARRASTRE').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_CAPITAL_CP').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Corto y Largo Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > FieldByName('DEUDA').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - FieldByName('DEUDA').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < FieldByName('DEUDA').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('DEUDA').AsCurrency - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               IBSQL2.Transaction.Commit;

// Ajuste Costas
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION, ');
                 SQL.Add('"col$causaciones".ID_ARRASTRE, ');
                 SQL.Add('SUM("col$causaciones".COSTAS) AS COSTAS');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join COL$CODIGOSPUC on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 SQL.Add('order by "col$causaciones".ID_CLASIFICACION DESC,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_COSTAS');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_ARRASTRE').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_COSTAS').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Costas',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Costas Actuales',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Costas Actuales',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > FieldByName('COSTAS').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - FieldByName('COSTAS').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < FieldByName('COSTAS').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('COSTAS').AsCurrency - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               IBSQL2.Transaction.Commit;

end;

procedure TfrmCausacionCarteraDiariaAuto.TercerPasoComprobante;
var AR:PList;
    Valor:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION, ');
                 SQL.Add('"col$causaciones".ID_ARRASTRE, ');
                 SQL.Add('SUM("col$causaciones".CAUSADOS) AS CAUSADOS');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join COL$CODIGOSPUC on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 SQL.Add('order by "col$causaciones".ID_CLASIFICACION DESC,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_CXC');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_ARRASTRE').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_CXC').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Interes Causado',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > FieldByName('CAUSADOS').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - FieldByName('CAUSADOS').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < FieldByName('CAUSADOS').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('CAUSADOS').AsCurrency - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial - ar^.debito + ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.credito - ar^.debito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.credito - ar^.debito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.credito - ar^.debito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               Codigo := '415005000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Comercial <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Comercial < 0 then begin
                   AR^.credito := -Comercial;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Comercial;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415010000000000000';
               if Consumo <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Consumo < 0 then begin
                   AR^.credito := -Consumo;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Consumo;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415015000000000000';
               if Vivienda <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Vivienda < 0 then begin
                   AR^.credito := -Vivienda;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Vivienda;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;
                Actualizargrid;
                IBSQL2.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.CuartoPasoComprobante;
var AR:PList;
    Valor:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION, ');
                 SQL.Add('"col$causaciones".ID_GARANTIA,"col$causaciones".ID_ARRASTRE, ');
                 SQL.Add('SUM("col$causaciones".PCAPITAL) AS PCAPITAL');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join COL$CODIGOSPUC on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION, "col$causaciones".ID_GARANTIA,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 SQL.Add('order by "col$causaciones".ID_CLASIFICACION DESC,"col$causaciones".ID_GARANTIA,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_PROV_CAPITAL');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := fieldbyname('ID_GARANTIA').AsInteger;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_ARRASTRE').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_PROV_CAPITAL').AsString;
                     except
                      MessageDlg('Error Buscando Codigo Provision Capital',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-FieldByName('PCAPITAL').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -FieldByName('PCAPITAL').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-FieldByName('PCAPITAL').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -FieldByName('PCAPITAL').AsCurrency - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.debito - ar^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               Codigo := '511510000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Comercial <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Comercial < 0 then begin
                   AR^.debito := -Comercial;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Comercial;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '511515000000000000';
               if Consumo <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Consumo < 0 then begin
                   AR^.debito := -Consumo;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Consumo;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '511520000000000000';
               if Vivienda <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Vivienda < 0 then begin
                   AR^.debito := -Vivienda;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Vivienda;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
                Actualizargrid;
                IBSQL3.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.QuintoPasoComprobante;
var AR:PList;
    Valor:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION, ');
                 SQL.Add('"col$causaciones".ID_ARRASTRE, ');
                 SQL.Add('SUM("col$causaciones".PINTERES) AS PINTERES');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join COL$CODIGOSPUC on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 SQL.Add('order by "col$causaciones".ID_CLASIFICACION,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_PROV_INTERES');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_ARRASTRE').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_PROV_INTERES').AsString;
                     except
                      MessageDlg('Error Buscando Codigo Provision Interes',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-FieldByName('PINTERES').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -FieldByName('PINTERES').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-FieldByName('PINTERES').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -FieldByName('PINTERES').AsCurrency - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.debito - ar^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
{               Codigo := '511530000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if (Comercial + Consumo + Vivienda + Microcredito) <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if (Comercial + Consumo + Vivienda + Microcredito) < 0 then begin
                   AR^.debito := -(Comercial + Consumo + Vivienda + Microcredito);
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := (Comercial + Consumo + Vivienda + Microcredito);
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
                Actualizargrid;
                IBSQL3.Transaction.Commit;
}
//Provision de Costas Judiciales
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION, ');
                 SQL.Add('"col$causaciones".ID_ARRASTRE, ');
                 SQL.Add('SUM("col$causaciones".PCOSTAS) AS PCOSTAS');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join COL$CODIGOSPUC on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 SQL.Add('order by "col$causaciones".ID_CLASIFICACION,');
                 SQL.Add('"col$causaciones".ID_ARRASTRE');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_PROV_COSTAS');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_ARRASTRE').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_PROV_COSTAS').AsString;
                     except
                      MessageDlg('Error Buscando Codigo Provision Costas',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-FieldByName('PCOSTAS').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -FieldByName('PCOSTAS').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-FieldByName('PCOSTAS').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -FieldByName('PCOSTAS').AsCurrency - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.debito - ar^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with

               Codigo := '511530000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if (Comercial + Consumo + Vivienda + Microcredito) <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if (Comercial + Consumo + Vivienda + Microcredito) < 0 then begin
                   AR^.debito := -(Comercial + Consumo + Vivienda + Microcredito);
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := (Comercial + Consumo + Vivienda + Microcredito);
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
                Actualizargrid;
                IBSQL3.Transaction.Commit;

end;

procedure TfrmCausacionCarteraDiariaAuto.SextoPasoComprobante;
var AR:PList;
    Valor:Currency;
    Codigo:string;
    Colocaciones:Currency;
    Aplica :Boolean;
begin
              Colocaciones    := 0;
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select SUM("col$causaciones".DEUDA) AS DEUDA ');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                   Valor := FieldByName('DEUDA').AsCurrency;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

                 Colocaciones := SimpleRoundTo((Valor * 0.01),0);
// Validar Contra Saldo Actual
                     Codigo := '149810000000000000';
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Provision General',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-Colocaciones) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -Colocaciones;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-Colocaciones) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -Colocaciones - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     Valor := ar^.debito - AR^.credito;

               Codigo := '511524000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Valor <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Valor < 0 then begin
                   AR^.debito := -Valor;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Valor;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
              end;
              actualizargrid;
              IBSQL3.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.SeptimoPasoComprobante;
var AR:PList;
    Valor:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION,MAX(COL$CODIGOSPUC.COD_INT_ANT) AS COD_INT_ANT,');
                 SQL.Add('SUM("col$causaciones".ANTICIPADOS) AS ANTICIPADOS');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join COL$CODIGOSPUC on');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION,COL$CODIGOSPUC.COD_INT_ANT');
                 SQL.Add('order by "col$causaciones".ID_CLASIFICACION');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Anticipados',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     Codigo := FieldByName('COD_INT_ANT').AsString;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-FieldByName('ANTICIPADOS').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -FieldByName('ANTICIPADOS').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-FieldByName('ANTICIPADOS').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -FieldByName('ANTICIPADOS').AsCurrency - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.debito - ar^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               Codigo := '415005000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Comercial <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Comercial < 0 then begin
                   AR^.debito := -Comercial;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Comercial;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415010000000000000';
               if Consumo <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Consumo < 0 then begin
                   AR^.debito := -Consumo;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Consumo;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415015000000000000';
               if Vivienda <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Vivienda < 0 then begin
                   AR^.debito := -Vivienda;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Vivienda;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
                Actualizargrid;
                IBSQL3.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.OctavoPasoComprobante;
var AR:PList;
    Valor:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION,MAX(COL$CODIGOSPUC.COD_CONTINGENCIA) AS COD_CONTINGENCIA,');
                 SQL.Add('SUM("col$causaciones".CONTINGENCIAS) AS CONTINGENCIAS');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join COL$CODIGOSPUC on');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION,COL$CODIGOSPUC.COD_CONTINGENCIA');
//                 SQL.Add('order by "col$causaciones".ID_CLASIFICACION,"col$causaciones".ID_ARRASTRE');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Anticipados',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     Codigo := FieldByName('COD_CONTINGENCIA').AsString;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (FieldByName('CONTINGENCIAS').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - FieldByName('CONTINGENCIAS').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (FieldByName('CONTINGENCIAS').AsCurrency) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('CONTINGENCIAS').AsCurrency - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.debito - ar^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               Codigo := '860500000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if (Comercial+Consumo+Vivienda+Microcredito) <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if (Comercial+Consumo+Vivienda+Microcredito) < 0 then begin
                   AR^.debito := -(Comercial+Consumo+Vivienda+Microcredito);
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := (Comercial+Consumo+Vivienda+Microcredito);
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
                Actualizargrid;
                IBSQL3.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.PrimerPasoCausacion;
var I :Integer;
vFechaGracia:TDate;
DiasMora:Integer;
Dia:Word;
NFecha:TDateTime;
_fechaInteresGracia, _fechaGracia : TDate;
_diasGracia, _diasCorridosGracia : Integer;
begin
        frmPantallaProgreso := TfrmProgreso.Create(Self);

// Actualizar tabla de tasas
        with IBSQL2 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" WHERE ID_MINIMO = 33');
          ExecQuery;
          vFechaGracia := DateOf(FieldByName('VALOR_MINIMO').AsInteger);
          Close;
          SQL.Clear;
          SQL.Add('update "col$porccausacion" set');
          SQL.Add('A_CAPITAL = :A_CAPITAL,A_INTERESES = :A_INTERESES,A_COSTAS = :A_COSTAS');
          SQL.Add('where');
          SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ID_GARANTIA = :ID_GARANTIA and ID_EDAD = :ID_EDAD');
          frmPantallaProgreso.Min := 1;
          frmPantallaProgreso.Max := GridP.RowCount - 1;
          frmPantallaProgreso.Position := 1;
          frmPantallaProgreso.Info.Caption := 'Progreso Actual';
          frmPantallaProgreso.InfoLabel := 'Actualizando Tabla de Valores a Provisionar';
          frmPantallaProgreso.Ejecutar;
          for I := 1 to GridP.RowCount - 1 do
          begin
              frmPantallaProgreso.Position := I;
              Application.ProcessMessages;
              ParamByName('ID_CLASIFICACION').AsInteger := StrToInt(LeftStr(GridP.Cells[0,I],1));
              ParamByName('ID_GARANTIA').AsInteger := StrToInt(LeftStr(GridP.Cells[1,I],1));
              ParamByName('ID_EDAD').AsString := GridP.Cells[2,I];
              ParamByName('A_CAPITAL').AsFloat := StrToFloat(GridP.Cells[3,I]);
              ParamByName('A_INTERESES').AsFloat := StrToFloat(GridP.Cells[4,I]);
              ParamByName('A_COSTAS').AsFloat := StrToFloat(GridP.Cells[5,I]);
              try
               ExecQuery;
              except
               frmPantallaProgreso.Cerrar;
               raise;
              end;
          end; // for

          try
             Transaction.Commit;
          except
             frmPantallaProgreso.Cerrar;
             raise;
          end;

        end; // with
// fin actualizacion tabla de causacion

        with IBSQL3 do begin
           if Transaction.InTransaction then Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('delete from "col$causaciondiariatmp"');
           try
            ExecQuery;
            Transaction.Commit;
           except
            MessageDlg('No se pudo vaciar la tabla col$causaciondiariatmp',mtError,[mbcancel],0);
            Transaction.Rollback;
            Exit;
           end;
        end;

        with IBSQL3 do begin
           if Transaction.InTransaction then Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('delete from "col$causaciondiariamovtmp"');
           try
            ExecQuery;
            Transaction.Commit;
           except
            MessageDlg('No se pudo vaciar la tabla col$causaciondiariamovtmp',mtError,[mbcancel],0);
            Transaction.Rollback;
            Exit;
           end;
        end;

        with IBQuery1 do begin
            if Transaction.InTransaction then Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('select * from P_COL_003');
            try
             Open;
            except
             Transaction.Rollback;
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;

            Total := FieldByName('TOTAL').AsInteger;

            Close;
            SQL.Clear;
            SQL.Add('select * from P_COL_004');
//            SQL.Add('select * from P_COL_004 where id_colocacion = ' + QuotedStr('20070101433'));
            try
             Open;
            except
             Transaction.Rollback;
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;
         end;
            frmPantallaProgreso.Min := 0;
            frmPantallaProgreso.Max := Total;
            frmPantallaProgreso.Position := 0;
            frmPantallaProgreso.InfoLabel := 'Procesando Causaci?n de Colocaciones';
            while not IBQuery1.Eof do
            begin
                frmPantallaProgreso.Position := IBQuery1.RecNo;
                Application.ProcessMessages;
                FechaInicial := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                FechaFinal := EdFechaCorte.Date;
                //Aqui va el valor de gen$minimos = 33
                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('select DIAS_INICIALES from COL$CODIGOSPUC where');
                IBSQL3.SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ');
                IBSQL3.SQL.Add('ID_GARANTIA = :ID_GARANTIA and ');
                IBSQL3.SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
                IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                IBSQL3.ParamByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
                IBSQL3.ParamByName('ID_CATEGORIA').AsString := 'C';
                try
                 IBSQL3.ExecQuery;
                except
                 IBQuery1.Transaction.Rollback;
                 frmPantallaProgreso.Cerrar;
                 Exit;
                end;// try

                Saldo := IBQuery1.FieldByName('SALDO').AsCurrency;

                //DiasMora := ObtenerDiasMora(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,IBSQL2);
                DiasMora := ObtenerDiasMoraCausacion(IBQuery1.FieldByName('ID_COLOCACION').AsString,
                                                     IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger,
                                                     IBQuery1.FieldByName('ID_LINEA').AsInteger,
                                                     IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger,
                                                     IBQuery1.FieldByName('DIAS_PAGO').AsInteger,
                                                     IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime,
                                                     IBQuery1.FieldByName('FECHA_INTERES').AsDateTime,
                                                     _dfechaHoy,
                                                     IBQuery1.FieldByName('TIPOC_INTERES').AsString ); 



                Dias := DiasEntreFechas(IncDay(FechaInicial),FechaFinal,CalculoFecha(IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime,IBQuery1.FieldByName('DIAS_PAGO').AsInteger));
                if Dias < 0 then
                  Dias := Dias + 2;

                {
                if IBQuery1.FieldByName('ID_LINEA').AsInteger = 13 then
                  if vFechaGracia > EdFechaCorte.Date then
                  begin
                    Dias := Dias + IBQuery1.FieldByName('PERIODO_GRACIA').AsInteger;
                  end;
                }
                DiasCorrientes := Dias;

                // Evaluar Edad Y Dias de Mora
               ////if IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2 then
                    ////DiasMora := DiasEntreFechas(IncDay(IBQuery1.FieldByName('FECHA_CAPITAL').AsDateTime),FechaFinal,IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime + IBQuery1.FieldByName('DIAS_PAGO').AsInteger);


                if DiasMora < 1 then DiasMora := 0;
                Edad := EvaluarEdad(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,
                                IBQuery1.FieldByName('ID_GARANTIA').AsInteger,DiasMora, IBQuery1.FieldByName('ID_COLOCACION').AsString);

                if (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or
                  (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then
                Edad := 'E';

            // Insertar datos en tabla temporal
            with IBSQL4 do begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "col$causaciondiariatmp" values(:ID_AGENCIA,');
                SQL.Add(':ID_COLOCACION,:FECHA_CORTE,:ID_CLASIFICACION,:ID_GARANTIA,:ID_EDAD_ANT,:ID_EDAD_ACT,:ID_ARRASTRE,');
                SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,:FECHA_DESEMBOLSO,:VALOR,:DEUDA,:ID_TIPO_CUOTA,');
                SQL.Add(':FECHA_CAPITAL,:FECHA_INTERES,:TIPOC_INTERES,:AMORTIZA_CAPITAL,:AMORTIZA_INTERES,:TIPO_INTERES,');
                SQL.Add(':TASA_INTERES_CORRIENTE,:ID_INTERES,');
                SQL.Add(':VALOR_ACTUAL_TASA,:PUNTOS_INTERES,');
                SQL.Add(':DIAS,:TASA,:ANTICIPADOS,');
                SQL.Add(':CAUSADOS,:CONTINGENCIAS,:APORTES,:PCAPITAL,:PINTERES,');
                SQL.Add(':PCOSTAS,:CORTO_PL,:LARGO_PL,:COSTAS,:ID_ESTADO,');
                SQL.Add(':PCAPITAL_REC,:PINTERES_REC,:PCOSTAS_REC,:PCAPITAL_REV,:PINTERES_REV,:PCOSTAS_REV,:PCAPITAL_GAS,:PINTERES_GAS,:PCOSTAS_GAS,');
                SQL.Add(':VALOR_GARANTIA, :GARANTIA_DESCONTADA, :MOROSIDAD)');
                ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                ParamByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
                ParamByName('ID_EDAD_ANT').AsString := IBQuery1.FieldByName('ID_CATEGORIA').AsString;
                ParamByName('ID_EDAD_ACT').AsString := Edad;
                ParamByName('ID_ARRASTRE').AsString := Edad;
                ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                ParamByName('FECHA_DESEMBOLSO').AsDate := CalculoFecha(IBQuery1.fieldbyname('FECHA_DESEMBOLSO').AsDateTime,IBQuery1.FieldByName('DIAS_PAGO').AsInteger);
                ParamByName('VALOR').AsCurrency := IBQuery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                ParamByName('DEUDA').AsCurrency := IBQuery1.FieldByName('SALDO').AsCurrency;
                ParamByName('ID_TIPO_CUOTA').AsInteger := IBQuery1.fieldbyname('ID_TIPO_CUOTA').AsInteger;
                ParamByName('FECHA_CAPITAL').AsDate := IBQuery1.FieldByName('FECHA_CAPITAL').AsDateTime;
                ParamByName('FECHA_INTERES').AsDate := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                ParamByName('TIPOC_INTERES').AsString := IBQuery1.FieldByName('TIPOC_INTERES').AsString;
                ParamByName('AMORTIZA_CAPITAL').AsInteger := IBQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger;
                ParamByName('AMORTIZA_INTERES').AsInteger := IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
                ParamByName('TIPO_INTERES').AsString := IBQuery1.FieldByName('TIPO_INTERES').AsString;
                ParamByName('TASA_INTERES_CORRIENTE').AsDouble := IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                ParamByName('ID_INTERES').AsInteger := IBQuery1.FieldByName('ID_INTERES').AsInteger;
                ParamByName('VALOR_ACTUAL_TASA').AsDouble := IBQuery1.FieldByName('VALOR_ACTUAL_TASA').AsFloat;
                ParamByName('PUNTOS_INTERES').AsDouble := IBQuery1.fieldbyname('PUNTOS_INTERES').AsFloat;
                ParamByName('DIAS').AsInteger := DiasCorrientes;
                ParamByName('TASA').AsDouble := 0;
                ParamByName('ANTICIPADOS').AsCurrency := 0;
                ParamByName('CAUSADOS').AsCurrency := 0;
                ParamByName('CONTINGENCIAS').AsCurrency := 0;
                ParamByName('APORTES').AsCurrency := 0;
                ParamByName('PCAPITAL').AsCurrency := 0;
                ParamByName('PINTERES').AsCurrency := 0;
                ParamByName('PCOSTAS').AsCurrency := 0;
                ParamByName('CORTO_PL').AsCurrency := 0;
                ParamByName('LARGO_PL').AsCurrency := 0;
                ParamByName('COSTAS').AsCurrency := 0;
                ParamByName('ID_ESTADO').AsInteger := IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                ParamByName('PCAPITAL_REC').AsCurrency := 0;
                ParamByName('PINTERES_REC').AsCurrency := 0;
                ParamByName('PCOSTAS_REC').AsCurrency := 0;
                ParamByName('PCAPITAL_REV').AsCurrency := 0;
                ParamByName('PINTERES_REV').AsCurrency := 0;
                ParamByName('PCOSTAS_REV').AsCurrency := 0;
                ParamByName('PCAPITAL_GAS').AsCurrency := 0;
                ParamByName('PINTERES_GAS').AsCurrency := 0;
                ParamByName('PCOSTAS_GAS').AsCurrency := 0;
                ParamByName('VALOR_GARANTIA').AsCurrency := 0;
                ParamByName('GARANTIA_DESCONTADA').AsCurrency := 0;
                ParamByName('MOROSIDAD').AsInteger := DiasMora;
                try
                 ExecQuery;
                except
                 MessageDlg('Error al Guardar Datos Temporales',mtError,[mbcancel],0);
                 frmProgreso.Cerrar;
                 Transaction.Rollback;
                 raise;
                 Exit;
                end;
            end;
// Continuar ciclo while
            IBQuery1.Next;
            end; // while
            IBQuery1.Transaction.Commit;
            IBQuery1.Close;

            // Inclusion de Creditos Saldados con Recuperacion o Reversion de Provisiones
            if IBQuery2.Transaction.InTransaction then
              IBQuery2.Transaction.Rollback;
            IBQuery2.Transaction.StartTransaction;
            IBQuery2.SQL.Clear;
            IBQuery2.SQL.Add('EXECUTE PROCEDURE P_COL_005(:FECHA1,:FECHA2,:FECHA_CORTE)');
            IBQuery2.ParamByName('FECHA1').AsDate := RecodeDay(EdFechaCorte.Date,01);
            IBQuery2.ParamByName('FECHA2').AsDate := RecodeDay(EdFechaCorte.Date,Dayof(EndOfAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date))));
            IBQuery2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
            IBQuery2.ExecSQL;
            IBQuery2.Transaction.Commit;
            // Fin Recuperacion Provisiones

            frmPantallaProgreso.Cerrar;
            Application.ProcessMessages;
end;

procedure TfrmCausacionCarteraDiariaAuto.SegundoPasoCausacion;
var id_ant:Integer;
    pr_ant:string;
    edad_act:string;
    primerpaso:Boolean;
    vAportes:Currency;
    AportesCon:Currency;
    Deuda:Currency;
    ListaFechas:TList;
    AFechas:PFechasLiq;
    FechaInicial,FechaFinal:TDate;
    i,Ano,Mes,Dia,DiasCalc:Integer;
    FechaDesembolso:TDate;
    TasaViv:Double;
    Evaluacion: String;
    _fechaInteresGracia: TDate;
    _fechaGracia: TDate;
    _diasGracia: Integer;
    _diasCorridosGracia : Integer;
    _diasParaCausar, _diasParaContingencia: Integer;
    _morosidad: Integer;
    _queryGracia : TIBQuery;
begin
          with IBQuery1 do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
           Transaction.StartTransaction;

           _queryGracia := TIBQuery.Create(self);
           _queryGracia.SQL.Add('SELECT FIRST 1 * FROM COL_PERIODO_GRACIA WHERE ID_COLOCACION = :ID_COLOCACION AND ESTADO <> 9 ORDER BY FECHA_REGISTRO DESC');


           _cTasaDtfMaxima := BuscoTasaEfectivaMaximaDtfNueva(IBQuery1,EdFechaCorte.Date);//** se puede con variable?

           _cTasaIpcNueva := BuscoTasaEfectivaMaximaIPCNueva(IBQuery1); //** se puede con variable?

          Close;
          SQL.Clear;
          SQL.Add('select count(*) as TOTAL from "col$causaciondiariatmp" where FECHA_CORTE = :FECHA_CORTE AND DEUDA > 0');
          ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
          Open;
          Total := FieldByName('TOTAL').AsInteger;

          frmPantallaProgreso  := TfrmProgreso.Create(Self);
          frmPantallaProgreso.Min := 0;
          frmPantallaProgreso.Max := Total;
          frmPantallaProgreso.InfoLabel := 'Aplicando Ley de Arrastre';
          frmPantallaProgreso.Position := 0;
          frmPantallaProgreso.Ejecutar;
          primerpaso := True;
          id_ant := 0;
          pr_ant := '';

           Close;
           SQL.Clear;
           SQL.Add('select * from "col$causaciondiariatmp" WHERE DEUDA > 0 order by ID_IDENTIFICACION,ID_PERSONA,ID_EDAD_ACT DESC,ID_AGENCIA,ID_COLOCACION');
           try
            Open;
           except
            MessageDlg('Error al Iniciar la Tabla Temporal para el Segundo proceso',mtError,[mbcancel],0);
            Transaction.Rollback;
            raise;
            Exit;
           end;
          end;

          //  IBQuery1.Locate('ID_COLOCACION',VarArrayOf(['20020002417']),[locaseinsensitive]);
          id_ant := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
          pr_ant := IBQuery1.FieldByName('ID_PERSONA').AsString;
          edad_act := IBQuery1.FieldByName('ID_EDAD_ACT').AsString;
          AportesCon := CalculoAportes(id_ant,pr_ant);
          primerpaso := True;

          while not IBQuery1.Eof  do begin
              frmPantallaProgreso.Position := IBQuery1.RecNo;
              frmPantallaProgreso.InfoLabel := IBQuery1.FieldByName('ID_PERSONA').AsString + '-' + IBQuery1.FieldByName('ID_COLOCACION').AsString;
              Application.ProcessMessages;
              if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> id_ant) or
                 (IBQuery1.FieldByName('ID_PERSONA').AsString <> pr_ant) then
              begin
                 id_ant := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                 pr_ant := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 edad_act := IBQuery1.FieldByName('ID_EDAD_ACT').AsString;
                 AportesCon := CalculoAportes(id_ant,pr_ant);
              end;
              Deuda := IBQuery1.FieldByName('DEUDA').AsCurrency;
              Tasa1 := BuscoTasaEfectivaMaxima1(IBQVarios,EdFechaCorte.Date,IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,'A');
              _morosidad := IBQuery1.FieldByName('MOROSIDAD').AsInteger;
              _diasParaCausar := 0;
              _diasParaContingencia := 0;
              // Primer Paso
              Saldo := IBQuery1.FieldByName('DEUDA').AsCurrency;
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('select DIAS_INICIALES from COL$CODIGOSPUC where');
              IBSQL3.SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ');
              IBSQL3.SQL.Add('ID_GARANTIA = :ID_GARANTIA and ');
              IBSQL3.SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
              IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
              IBSQL3.ParamByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
              IBSQL3.ParamByName('ID_CATEGORIA').AsString := 'C';
              try
                IBSQL3.ExecQuery;
                DiasContingencia := IBSQL3.FieldByName('DIAS_INICIALES').AsInteger;
              except
                IBQuery1.Transaction.Rollback;
                frmPantallaProgreso.Cerrar;
                Exit;
              end;// try
              Dias := IBQuery1.FieldByName('DIAS').AsInteger;
              DiasCorrientes := Dias;

              if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'V' then
                DiasContingencia := DiasContingencia + IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;

              if Dias > 0 then
                if (Dias >= DiasContingencia) then begin
                    DiasANT := 0;
                    DiasCON := Dias - (DiasContingencia - 1);
                    DiasCXC := DiasContingencia - 1;
                 end
                else
                 begin
                    DiasANT := 0;
                    DiasCON := 0;
                    DiasCXC := Dias;
                 end// if
              else
                 begin
                  DiasANT := Dias;
                  DiasCON := 0;
                  DiasCXC := 0;
                 end; // if

              // Evaluar Fechas
              if DiasCXC > 0 then
              begin
                 FechaInicial := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                 FechaFinal := EdFechaCorte.Date;
                 ListaFechas := TList.Create;
                 if IBQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger = 1 then
                    CalcularFechasLiquidarFija(FechaInicial,FechaFinal,FechaFinal,ListaFechas)
                 else
                 if IBQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger = 2 then
                    CalcularFechasLiquidarVarAnticipada(FechaInicial,FechaFinal,FechaFinal,ListaFechas)
                 else
                    CalcularFechasLiquidarVarVencida(FechaInicial,FechaFinal,FechaFinal,ListaFechas);

                 Causados := 0;
                 Contingentes := 0;
                 DiasCXC := 0;
                 DiasCON := 0;
                 for i := 0 to ListaFechas.Count - 1 do begin
                   AFechas := ListaFechas.Items[i];
                    Bisiesto := False;
                    FechaDesembolso := IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
                    if AFechas^.FechaInicial = FechaInicial then
                       AFechas^.FechaInicial := CalculoFecha(FechaInicial,1);
                    DiasCalc := DiasEnFechas(AFechas^.FechaInicial,AFechas^.FechaFinal,FechaDesembolso,bisiesto);
                    if DiasCalc < 0 then DiasCalc := 0;
                    Dispose(AFechas);
                    if DiasCXC < (DiasContingencia - 1) then
                    begin
                       DiasCXC := DiasCXC + DiasCalc;
                       if DiasCXC > (DiasContingencia - 1) then
                       begin
                          DiasCON := DiasCXC - (DiasContingencia-1);
                          DiasCXC := (DiasContingencia-1);
                          // Contingentes := Contingentes + SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * DiasCON,0);
                          _diasParaContingencia := _diasParaContingencia + DiasCON;
                          DiasCalc := DiasCalc - DiasCON;
                       end;
                       _diasParaCausar := _diasParaCausar + DiasCalc;
                       // Causados := Causados + SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * DiasCalc,0);
                    end
                    else
                    begin
                       _diasParaContingencia := _diasParaContingencia + DiasCalc;
                       //Contingentes := Contingentes + SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * DiasCalc,0);
                       //DiasCON := DiasCON + DiasCalc;
                    end;
                end;
                 ListaFechas.Free;
               end
               else
               begin
                 Contingentes := 0;
                 Causados := 0;
                 DiasCON := 0;
                 DiasCXC := 0;
                 _diasParaCausar := 0;
                 _diasParaContingencia := 0;
               end;

//
// Calcula la Tasa que se debe aplicar   Causados
                    if IBQuery1.FieldByName('ID_INTERES').AsInteger = 0 then begin
                       Tasa := BuscoTasaEfectivaMaxima1(IBQVarios,edFechaCorte.Date,IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,'A');
                       if IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat < Tasa then
                          Tasa :=IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                       if IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'E' then
                          Tasa := TasaNominalVencida(Tasa,30)
                       else
                       begin
                        if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'A' then
                         begin
                           Tasa := TasaNominalAnticipada(Tasa,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
                         end
                        else
                         begin
                           Tasa := TasaNominalVencida(Tasa,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
                         end;
                       end;
                    end
                    else
                    if IBQuery1.FieldByName('ID_INTERES').AsInteger = 1 then begin
                       Tasa := BuscoTasaEfectivaMaximaDtfNueva(IBQVarios,edFechaCorte.Date);
                       if IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat < Tasa then
                          Tasa :=IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;

                       if IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'E' then
                          Tasa := TasaNominalVencida(Tasa,30)
                       else
                       begin
                        if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'A' then
                         begin
                           Tasa := TasaNominalAnticipada(Tasa,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger) + IBQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
                         end
                        else
                         begin
                           Tasa := TasaNominalVencida(Tasa,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger) + IBQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
                         end;
                       end;
                    end
                    else
                    if IBQuery1.FieldByName('ID_INTERES').AsInteger = 2 then begin
                       Tasa := _cTasaIpcNueva; //BuscoTasaEfectivaMaximaIPCNueva(IBQVarios); //*** esto se puede calcular con variable
                       if IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat < Tasa then
                          Tasa :=IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;

                       if IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'E' then
                          Tasa := TasaNominalVencida(Tasa,30)
                       else
                       begin
                        if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'A' then
                         begin
                           Tasa := TasaNominalAnticipada(Tasa,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger) + IBQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
                         end
                        else
                         begin
                           Tasa := TasaNominalVencida(Tasa,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger) + IBQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
                         end;
                       end;
                    end;

                    //*****Tasa de vivienda***////
                    if IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger = 3 then begin
                       TasaViv := BuscoTasaEfectivaUvrNueva(IBQVarios,edFechaCorte.Date);
                       if IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'E' then
                          TasaViv := TasaNominalVencida(Tasa,30)
                       else
                       begin
                        if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'A' then
                         begin
                           TasaViv := TasaNominalAnticipada(TasaViv,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger) + IBQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
                         end
                        else
                         begin
                           TasaViv := TasaNominalVencida(TasaViv,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger) + IBQuery1.FieldByName('PUNTOS_INTERES').AsFloat;
                         end;
                        end;
                       if Tasa > TasaViv then
                          Tasa := TasaViv;
                    end;

                    if IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'E' then begin
                       Tasa := Tasa1;
                       Tasa := TasaNominalVencida(Tasa1,30);
                    end;
//  Fin Tasa A Aplicar Causados
            if _morosidad < 1 then
            begin
               _diasParaCausar := _diasParaCausar + _diasParaContingencia;
               _diasParaContingencia := 0;
            end;
// Consultar los días de gracia solicitados y evaluar si se debe causar o no

//
            Causados := SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * _diasParaCausar,0);
            Contingentes := SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * _diasParaContingencia,0);
            DiasCXC := _diasParaCausar;
            DiasCON := _diasParaContingencia;

            // Buscar Tasa Anticipada
            if DiasANT < 0 then begin
               TasaAnt := BuscoTasaAnt(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,IBQuery1.FieldByName('FECHA_INTERES').AsDateTime);
               if TasaAnt = 0 then begin
                 case IBQuery1.FieldByName('ID_INTERES').AsInteger of
                     0 : begin
                           TasaAnt := BuscoTasaEfectivaMaxima1(IBQVarios,EdFechaCorte.Date,IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,'A');
                           if IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat < TasaAnt then
                             TasaAnt := IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                         end;

                     1 :  TasaAnt := _cTasaDtfMaxima;// BuscoTasaEfectivaMaximaDtfNueva(IBQVarios,EdFechaCorte.Date);//** se puede con variable?

                     2 : TasaAnt := _cTasaIpcNueva;// BuscoTasaEfectivaMaximaIPCNueva(IBQVarios); //** se puede con variable?
                 end;
                 if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'A' then
                   TasaAnt := TasaNominalAnticipada(TasaAnt,IBQuery1.fieldbyname('AMORTIZA_INTERES').AsInteger)
                 else
                   TasaAnt := TasaNominalVencida(TasaAnt,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
               end;
            end;
           // Fin Buqueda de Tasa Anticipada

           // Calculo Intereses
            Anticipados := SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (TasaAnt/100)) / 360 ) * -DiasANT,0);
//            Causados  := SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * DiasCXC,0);
//            Contingentes := SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * DiasCON,0);
// Fin Calculo Intereses
            Aportes := 0;
// Evaluar Edad
// Calculo Corto y Largo Plazo
            CortoPlazo := 0;
            LargoPlazo := 0;
            if edad_act = 'A' then
              with IBSQL3 do begin
               Close;
               SQL.Clear;
               SQL.Add('select SUM(CAPITAL_A_PAGAR) AS CORTOPLAZO from "col$tablaliquidacion"');
               SQL.Add('where (ID_COLOCACION = :"ID_COLOCACION") AND');
               SQL.Add('(FECHA_A_PAGAR>:FECHACORTE) AND CUOTA_NUMERO <= (SELECT FIRST 1 CUOTA_NUMERO + 11 FROM');
               SQL.Add('"col$tablaliquidacion" WHERE PAGADA = 0 AND ID_COLOCACION = :"ID_COLOCACION")');
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
               ExecQuery;
               if RecordCount > 0 then
                begin
                  CortoPlazo := SimpleRoundTo(FieldByName('CORTOPLAZO').AsCurrency,0);
                  LargoPlazo := SimpleRoundTo(IBQuery1.FieldByName('DEUDA').AsCurrency - CortoPlazo,0);
                end; //
               Close;
               EvaluarCortoPlazo;
              end // with
            else
              begin
                CortoPlazo := 0;
                LargoPlazo := 0;
              end; // if
// Fin Corto y Largo Plazo
// Leo Costas Judiciales;
            with IBSQL3 do begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT SUM(VALOR_COSTAS) AS COSTAS FROM "col$costas"');
             SQL.Add('WHERE ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION AND FECHA<=:FECHACORTE');
             ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
             ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
             ParamByName('FECHACORTE').AsDate := RecodeDay(EdFechaCorte.Date,Dayof(EndOfAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date))));
             try
              ExecQuery;
              Costas := FieldByName('COSTAS').AsCurrency;
             except
              Costas := 0;
             end;
            end;
// Fin Leo Costas
// Valido Aportes
                if AportesCon > Deuda then
                begin
                   vAportes := Deuda;
                   AportesCon := AportesCon - vAportes;
                end
                else if Deuda > AportesCon then begin
                     vAportes := AportesCon;
                     AportesCon := 0;
                end;

// Fin Valido Aportes
// Actualizar Edad por Arrastre
                 // Buscar Edad Seg?n Evaluaci?n
                 with IBSQL3 do begin
                    Close;
                    SQL.Clear;
                    SQL.Add('SELECT ID_EVALUACION FROM "col$colocacion" c WHERE ');
                    SQL.Add('c.ID_COLOCACION = :ID_COLOCACION');
                    ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                    try
                     ExecQuery;
                     if RecordCount > 0 then
                         Evaluacion := FieldByName('ID_EVALUACION').AsString
                     else
                         Evaluacion := '';
                    except
                      frmPantallaProgreso.Cerrar;
                      MessageDlg('Error Actualizando Tabla Temporal',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                    end;
                  end;
                 // Fin busqueda edad Evaluaci?n
                 // Evaluando evaluacion

                 if edad_act < Evaluacion then
                    edad_act := Evaluacion;

                 with IBSQL3 do begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update "col$causaciondiariatmp" SET ID_ARRASTRE = :ID_ARRASTRE,TASA = :TASA,');
                    SQL.Add('ANTICIPADOS = :ANTICIPADOS,CAUSADOS = :CAUSADOS,CONTINGENCIAS = :CONTINGENCIAS,');
                    SQL.Add('APORTES = :APORTES, COSTAS = :COSTAS,');
                    SQL.Add('CORTO_PL = :CORTO_PL, LARGO_PL = :LARGO_PL');
                    SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
                    ParamByName('ID_AGENCIA').AsInteger := IBQuery1.fieldbyname('ID_AGENCIA').AsInteger;
                    ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                    ParamByName('ID_ARRASTRE').AsString := edad_act;
                    ParamByName('TASA').AsDouble := Tasa;
                    ParamByName('ANTICIPADOS').AsCurrency := Anticipados;
                    ParamByName('CAUSADOS').AsCurrency := Causados;
                    ParamByName('CONTINGENCIAS').AsCurrency := Contingentes;
                    ParamByName('APORTES').AsCurrency := vAportes;
                    ParamByName('COSTAS').AsCurrency := Costas;
                    ParamByName('CORTO_PL').AsCurrency := CortoPlazo;
                    ParamByName('LARGO_PL').AsCurrency := LargoPlazo;
                    try
                      ExecQuery;
                    except
                      frmPantallaProgreso.Cerrar;
                      MessageDlg('Error Actualizando Tabla Temporal',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                    end;
                 end; // with
// Fin Actualizaci?n
          IBQuery1.Next;
          end; // while
          IBQuery1.Close;
          if dmGeneral.IBTransaction1.InTransaction  then
            dmGeneral.IBTransaction1.Commit;
          frmPantallaProgreso.Cerrar;
end;

procedure TfrmCausacionCarteraDiariaAuto.NovenoPasoComprobante;
var AR:PList;
   i:Integer;
   Valor,Valor1:Currency;
begin
             Valor := 0;
             for i := 0 to Lista.Count - 1 do
             begin
               AR := Lista.Items[i];
               if (LeftStr(AR^.codigo,1) = '5') and
                  (AR^.credito > 0) then begin
                   Valor := Valor + AR^.credito;
                   Lista.Items[i] := nil;
               end;
             end;
            if Valor > 0 then
             for i := 0 to Lista.Count - 1 do
             begin
               AR := Lista.Items[i];
               if AR <> nil then
               if AR^.codigo = '149810000000000000' then begin
                  if AR^.credito > 0 then
                     AR^.credito := AR^.credito + Valor
                  else
                  begin
                     AR^.debito := ar^.debito - Valor;
                     if AR^.debito < 0 then begin
                        AR^.credito := -ar^.debito;
                        AR^.debito := 0;
                     end;
                  end;
               end
               else
               if AR^.codigo = '511524000000000000' then begin
                  if AR^.debito > 0 then
                     AR^.debito := AR^.debito + Valor
                  else
                  begin
                     AR^.credito := ar^.credito - Valor;
                     if AR^.credito < 0 then begin
                        AR^.debito := -ar^.debito;
                        AR^.credito := 0;
                     end;
                  end;
               end;
             end;
             i :=0;
             while True do begin
               if i > (Lista.Count - 1) then Break;
                 if Lista.Items[i] = nil then Lista.Delete(i);
               i := i + 1;
             end;

             Lista.Pack;


             actualizargrid;

end;

procedure TfrmCausacionCarteraDiariaAuto.DecimoPasoComprobante;
var I:Integer;
    TotalDebito:Currency;
    TotalCredito:Currency;
    ARecord:PList;
begin
      Consecutivo := ObtenerConsecutivoTmp(IBSQL1);
      EdComprobante.Caption := FormatCurr('0000000',Consecutivo);

      TotalDebito := 0;
      TotalCredito := 0;

      for I := 0 to Lista.Count - 1 do
      begin
        ARecord := Lista.Items[i];
        TotalDebito := TotalDebito + arecord^.debito;
        TotalCredito := TotalCredito + arecord^.credito;
      end;

      with IBSQL1 do begin
       if Transaction.InTransaction then
          Transaction.Rollback;
       Transaction.StartTransaction;
         Close;
         sql.Clear;
         sql.Add('insert into CON$COMPROBANTE (CON$COMPROBANTE."ID_COMPROBANTE",');
         sql.Add('CON$COMPROBANTE."FECHADIA", CON$COMPROBANTE."TIPO_COMPROBANTE",');
         sql.Add('CON$COMPROBANTE."ID_AGENCIA", CON$COMPROBANTE."DESCRIPCION",');
         sql.Add('CON$COMPROBANTE."TOTAL_DEBITO", CON$COMPROBANTE."TOTAL_CREDITO",');
         sql.Add('CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO",');
         sql.Add('CON$COMPROBANTE."ANULACION",CON$COMPROBANTE.ID_EMPLEADO)');
         sql.Add('values (');
         sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
         sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
         sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION",:ID_EMPLEADO)');

         ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
         ParamByname('FECHADIA').AsDate := Date;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
         ParamByName('DESCRIPCION').AsString := 'AJUSTE CALIFICACION, CAUSACION Y PROVISION DE CARTERA EN LA FECHA';
         ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebito;
         ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCredito;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByname('ANULACION').asstring := '';
         ParamByName('IMPRESO').AsInteger  := 1;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ExecQuery;

         Close;
         SQL.Clear;
         SQL.Add('insert into CON$AUXILIAR values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
         if Lista.Count > 0 then
         for I := 0 to Lista.Count -1 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('insert into CON$AUXILIAR values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
            ARecord := Lista.Items[I];
            ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := Date;
            ParamByName('CODIGO').AsString := Arecord^.codigo;
            ParamByName('DEBITO').AsCurrency := Arecord^.debito;
            ParamByName('CREDITO').AsCurrency := Arecord^.credito;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
            ExecQuery;
         end;
        try
         Transaction.Commit;
        except
         Transaction.Rollback;
         raise;
         Exit;
        end;
       end;
end;

procedure TfrmCausacionCarteraDiariaAuto.TercerPasoCausacion;
begin
        case RGProceso.ItemIndex of
         1: begin
             with IBSQL2 do begin
              if Transaction.InTransaction then
                 Transaction.Rollback;
              Transaction.StartTransaction;
              Close;
              SQL.Clear;
              SQL.Add('insert into "col$causacionescontrol" values (');
              SQL.Add(':FECHA,:PROCESADA,:APLICADA,:CONTABILIZADA,:ID_COMPROBANTE)');
              ParamByName('FECHA').AsDate := EdFechaCorte.Date;
              ParamByName('PROCESADA').AsInteger := 1;
              ParamByName('APLICADA').AsInteger := 0;
              ParamByName('CONTABILIZADA').AsInteger := 0;
              ParamByName('ID_COMPROBANTE').Clear;
              try
               ExecQuery;
              except
               MessageDlg('Error al Actualizar la Tabla de Control',mtError,[mbcancel],0);
               Transaction.Rollback;
               raise;
               Exit;
              end;

              Close;
              SQL.Clear;
              SQL.Add('insert into "col$causaciondiaria" select * from "col$causaciondiariatmp"');
              try
               ExecQuery;
              except
               MessageDlg('Error al Trasladar Valores',mtError,[mbcancel],0);
               Transaction.Rollback;
               raise;
               Exit;
              end;

              Transaction.Commit;
              // MessageDlg('Traslado de Valores Culminado',mtInformation,[mbok],0);
             end;
           end;
         end;
end;

procedure TfrmCausacionCarteraDiariaAuto.CmdImprimirProvisionClick(
  Sender: TObject);
begin
     if RGProceso.ItemIndex = 1 then begin
        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$causaciondiaria".ID_AGENCIA,"col$causaciondiaria".ID_COLOCACION,"col$causaciondiaria".ID_CLASIFICACION,');
          SQL.Add('"col$causaciondiaria".DEUDA,"col$causaciondiaria".ID_EDAD_ANT,"col$causaciondiaria".ID_EDAD_ACT,"col$causaciondiaria".ID_ARRASTRE,');
          SQL.Add('"col$causaciondiaria".ID_GARANTIA,"col$causaciondiaria".DIAS,"col$causaciondiaria".MOROSIDAD,"col$causaciondiaria".ID_AGENCIA,');
          SQL.Add('"col$causaciondiariamov".PCAPITAL_ANUAL,"col$causaciondiariamov".PINTERES_ANUAL,"col$causaciondiariamov".PCOSTAS_ANUAL,');
          SQL.Add('"col$causaciondiariamov".PCAPITAL_ACT,"col$causaciondiariamov".PINTERES_ACT,"col$causaciondiariamov".PCOSTAS_ACT,');
          SQL.Add('"col$causaciondiaria".PCAPITAL,"col$causaciondiaria".PINTERES,"col$causaciondiaria".PCOSTAS,');
          SQL.Add('"col$causaciondiaria".PCAPITAL_REC,"col$causaciondiaria".PINTERES_REC,"col$causaciondiaria".PCOSTAS_REC,');
          SQL.Add('"col$causaciondiaria".PCAPITAL_REV,"col$causaciondiaria".PINTERES_REV,"col$causaciondiaria".PCOSTAS_REV,');
          SQL.Add('"col$causaciondiaria".PCAPITAL_GAS,"col$causaciondiaria".PINTERES_GAS,"col$causaciondiaria".PCOSTAS_GAS,');
          SQL.Add('"col$causaciondiaria".VALOR_GARANTIA, "col$causaciondiaria".GARANTIA_DESCONTADA,');
          SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION, "col$garantia".DESCRIPCION_GARANTIA,"col$categoria".DESCRIPCION_CATEGORIA');
          SQL.Add('from "col$causaciondiaria"');
          SQL.Add('left join "col$causaciondiariamov" on ("col$causaciondiaria".ID_AGENCIA = "col$causaciondiariamov".ID_AGENCIA and');
          SQL.Add('"col$causaciondiaria".ID_COLOCACION = "col$causaciondiariamov".ID_COLOCACION)');
          SQL.Add('inner join "col$clasificacion" on ("col$causaciondiaria".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          SQL.Add('inner join "col$garantia" on ("col$causaciondiaria".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          SQL.Add('inner join "col$categoria" on ("col$causaciondiaria".ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          SQL.Add('where "col$causaciondiaria".FECHA_CORTE = :FECHA AND');
          SQL.Add('((PCAPITAL_REC>0) or (PINTERES_REC>0) or (PCOSTAS_REC>0) or');
          SQL.Add('(PCAPITAL_REV>0) or (PINTERES_REV>0) or (PCOSTAS_REV>0) or');
          SQL.Add('(PCAPITAL_GAS>0) or (PINTERES_GAS>0) or (PCOSTAS_GAS>0) or');
          SQL.Add('(PCAPITAL_ANUAL>0) or (PINTERES_ANUAL>0) or (PCOSTAS_ANUAL>0) or');
          SQL.Add('(PCAPITAL_ACT>0) or (PINTERES_ACT>0) or (PCOSTAS_ACT>0))');
          SQL.Add('order by "col$causaciondiaria".ID_CLASIFICACION, "col$causaciondiaria".ID_GARANTIA,"col$causaciondiaria".ID_ARRASTRE');
          ParamByName('FECHA').AsDate := EdFechaCorte.Date;

          IBQuery4.Close;
          IBQuery4.SQL.Clear;
          IBQuery4.SQL.Add('select');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_CLASIFICACION,');
          IBQuery4.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamov".PCAPITAL_ANUAL) as PCAPITAL_ANUAL,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamov".PINTERES_ANUAL) as PINTERES_ANUAL,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamov".PCOSTAS_ANUAL) as PCOSTAS_ANUAL,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamov".PCAPITAL_ACT) as PCAPITAL_ACT,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamov".PINTERES_ACT) as PINTERES_ACT,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamov".PCOSTAS_ACT) as PCOSTAS_ACT,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PCAPITAL) as PCAPITAL,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PINTERES) as PINTERES,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PCOSTAS) as PCOSTAS,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PCAPITAL_REC) as PCAPITAL_REC,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PINTERES_REC) as PINTERES_REC,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PCOSTAS_REC) as PCOSTAS_REC,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PCAPITAL_REV) as PCAPITAL_REV,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PINTERES_REV) as PINTERES_REV,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PCOSTAS_REV) as PCOSTAS_REV,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PCAPITAL_GAS) as PCAPITAL_GAS,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PINTERES_GAS) as PINTERES_GAS,');
          IBQuery4.SQL.Add('SUM("col$causaciondiaria".PCOSTAS_GAS) as PCOSTAS_GAS');
          IBQuery4.SQL.Add('from "col$causaciondiaria"');
          IBQuery4.SQL.Add('LEFT JOIN "col$clasificacion" ON ("col$causaciondiaria".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery4.SQL.Add('LEFT JOIN "col$causaciondiariamov" ON ("col$causaciondiaria".ID_AGENCIA = "col$causaciondiariamov".ID_AGENCIA and');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_COLOCACION = "col$causaciondiariamov".ID_COLOCACION)');
          IBQuery4.SQL.Add('where fecha_corte = :fecha');
          IBQuery4.SQL.Add('group by');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_CLASIFICACION,');
          IBQuery4.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION');
          IBQuery4.SQL.Add('order by');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_CLASIFICACION');
          IBQuery4.ParamByName('FECHA').AsDate := EdFechaCorte.Date;
        end; // Fin de With
     end
     else
     begin
        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$causaciondiariatmp".ID_AGENCIA,"col$causaciondiariatmp".ID_COLOCACION,"col$causaciondiariatmp".ID_CLASIFICACION,');
          SQL.Add('"col$causaciondiariatmp".DEUDA,"col$causaciondiariatmp".ID_EDAD_ANT,"col$causaciondiariatmp".ID_EDAD_ACT,"col$causaciondiariatmp".ID_ARRASTRE,');
          SQL.Add('"col$causaciondiariatmp".ID_GARANTIA,"col$causaciondiariatmp".DIAS,"col$causaciondiariatmp".MOROSIDAD,"col$causaciondiariatmp".ID_AGENCIA,');
          SQL.Add('"col$causaciondiariamovtmp".PCAPITAL_ANUAL,"col$causaciondiariamovtmp".PINTERES_ANUAL,"col$causaciondiariamovtmp".PCOSTAS_ANUAL,');
          SQL.Add('"col$causaciondiariamovtmp".PCAPITAL_ACT,"col$causaciondiariamovtmp".PINTERES_ACT,"col$causaciondiariamovtmp".PCOSTAS_ACT,');
          SQL.Add('"col$causaciondiariatmp".PCAPITAL,"col$causaciondiariatmp".PINTERES,"col$causaciondiariatmp".PCOSTAS,');
          SQL.Add('"col$causaciondiariatmp".PCAPITAL_REC,"col$causaciondiariatmp".PINTERES_REC,"col$causaciondiariatmp".PCOSTAS_REC,');
          SQL.Add('"col$causaciondiariatmp".PCAPITAL_REV,"col$causaciondiariatmp".PINTERES_REV,"col$causaciondiariatmp".PCOSTAS_REV,');
          SQL.Add('"col$causaciondiariatmp".PCAPITAL_GAS,"col$causaciondiariatmp".PINTERES_GAS,"col$causaciondiariatmp".PCOSTAS_GAS,');
          SQL.Add('"col$causaciondiariatmp".VALOR_GARANTIA, "col$causaciondiariatmp".GARANTIA_DESCONTADA,');
          SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION, "col$garantia".DESCRIPCION_GARANTIA,"col$categoria".DESCRIPCION_CATEGORIA');
          SQL.Add('from "col$causaciondiariatmp"');
          SQL.Add('left join "col$causaciondiariamovtmp" on ("col$causaciondiariatmp".ID_AGENCIA = "col$causaciondiariamovtmp".ID_AGENCIA and');
          SQL.Add('"col$causaciondiariatmp".ID_COLOCACION = "col$causaciondiariamovtmp".ID_COLOCACION)');
          SQL.Add('inner join "col$clasificacion" on ("col$causaciondiariatmp".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          SQL.Add('inner join "col$garantia" on ("col$causaciondiariatmp".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          SQL.Add('inner join "col$categoria" on ("col$causaciondiariatmp".ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          SQL.Add('where "col$causaciondiariatmp".FECHA_CORTE = :FECHA AND');
          SQL.Add('((PCAPITAL_REC>0) or (PINTERES_REC>0) or (PCOSTAS_REC>0) or');
          SQL.Add('(PCAPITAL_REV>0) or (PINTERES_REV>0) or (PCOSTAS_REV>0) or');
          SQL.Add('(PCAPITAL_GAS>0) or (PINTERES_GAS>0) or (PCOSTAS_GAS>0) or');
          SQL.Add('(PCAPITAL_ANUAL>0) or (PINTERES_ANUAL>0) or (PCOSTAS_ANUAL>0) or');
          SQL.Add('(PCAPITAL_ACT>0) or (PINTERES_ACT>0) or (PCOSTAS_ACT>0))');
          SQL.Add('order by "col$causaciondiariatmp".ID_CLASIFICACION, "col$causaciondiariatmp".ID_GARANTIA,"col$causaciondiariatmp".ID_ARRASTRE');
          ParamByName('FECHA').AsDate := EdFechaCorte.Date;

          IBQuery4.Close;
          IBQuery4.SQL.Clear;
          IBQuery4.SQL.Add('select');
          IBQuery4.SQL.Add('"col$causaciondiariatmp".ID_CLASIFICACION,');
          IBQuery4.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamovtmp".PCAPITAL_ANUAL) as PCAPITAL_ANUAL,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamovtmp".PINTERES_ANUAL) as PINTERES_ANUAL,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamovtmp".PCOSTAS_ANUAL) as PCOSTAS_ANUAL,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamovtmp".PCAPITAL_ACT) as PCAPITAL_ACT,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamovtmp".PINTERES_ACT) as PINTERES_ACT,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariamovtmp".PCOSTAS_ACT) as PCOSTAS_ACT,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PCAPITAL) as PCAPITAL,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PINTERES) as PINTERES,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PCOSTAS) as PCOSTAS,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PCAPITAL_REC) as PCAPITAL_REC,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PINTERES_REC) as PINTERES_REC,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PCOSTAS_REC) as PCOSTAS_REC,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PCAPITAL_REV) as PCAPITAL_REV,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PINTERES_REV) as PINTERES_REV,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PCOSTAS_REV) as PCOSTAS_REV,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PCAPITAL_GAS) as PCAPITAL_GAS,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PINTERES_GAS) as PINTERES_GAS,');
          IBQuery4.SQL.Add('SUM("col$causaciondiariatmp".PCOSTAS_GAS) as PCOSTAS_GAS');
          IBQuery4.SQL.Add('from "col$causaciondiariatmp"');
          IBQuery4.SQL.Add('LEFT JOIN "col$clasificacion" ON ("col$causaciondiariatmp".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery4.SQL.Add('LEFT JOIN "col$causaciondiariamovtmp" ON ("col$causaciondiariatmp".ID_AGENCIA = "col$causaciondiariamovtmp".ID_AGENCIA and');
          IBQuery4.SQL.Add('"col$causaciondiariatmp".ID_COLOCACION = "col$causaciondiariamovtmp".ID_COLOCACION)');
          IBQuery4.SQL.Add('where fecha_corte = :fecha');
          IBQuery4.SQL.Add('group by');
          IBQuery4.SQL.Add('"col$causaciondiariatmp".ID_CLASIFICACION,');
          IBQuery4.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION');
          IBQuery4.SQL.Add('order by');
          IBQuery4.SQL.Add('"col$causaciondiariatmp".ID_CLASIFICACION');
          IBQuery4.ParamByName('FECHA').AsDate := EdFechaCorte.Date;
        end; // fin de With
     end; //  Fin de if

     ReporteD.Variables.ByName['Empresa'].AsString := Empresa;
     ReporteD.Variables.ByName['Agencia'].AsInteger := Agencia;
     ReporteD.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.Date;
     ReporteD.Title := 'Calificaci?n y Provisi?n de Colocaciones';
     if ReporteD.PrepareReport then begin
       Reporte.PreviewPreparedReport(true);
     end;
     IBQuery1.Transaction.Commit;
end;

function TfrmCausacionCarteraDiariaAuto.BuscoTasaAnt(Ag: integer;
  Colocacion: string;FechaIntereses:TDate): Single;
begin
        with IBSQL5 do begin
          Close;
          Transaction := IBTAlterna;
          Transaction.Active := True;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "col$extracto" where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          SQL.Add('ORDER BY FECHA_EXTRACTO DESC, HORA_EXTRACTO DESC');
          ParamByName('ID_AGENCIA').AsInteger := Ag;
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          try
            ExecQuery;
            if RecordCount > 0 then
             while not Eof do begin
                if FieldByName('INTERES_PAGO_HASTA').AsDate = FechaIntereses then begin
                   If (FieldByName('TASA_INTERES_LIQUIDACION') <> nil ) then
                       Result := SimpleRoundTo(FieldByName('TASA_INTERES_LIQUIDACION').AsDouble)
                   Else
                       Result := 0;
                   Transaction.Commit;
                   Exit;
                end;
             Next;
             end;
             Close;
             Transaction.Commit;
             Result := 0;
          except
             Transaction.Rollback;
             Result := 0;
          end;
        end;
end;

procedure TfrmCausacionCarteraDiariaAuto.PrimerPC;
var AR : Plist;
    CortoActual,LargoActual:Currency;
    CodigoCorto,CodigoLargo:string;
    ValorCorto,ValorLargo:Currency;
    Aplica :Boolean;
begin
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciondiaria".ID_CLASIFICACION, ');
                 SQL.Add('"col$causaciondiaria".ID_GARANTIA,"col$causaciondiaria".ID_EDAD_ACT, ');
                 SQL.Add('SUM("col$causaciondiaria".CORTO_PL) AS CORTO,');
                 SQL.Add('SUM("col$causaciondiaria".LARGO_PL) AS LARGO from "col$causaciondiaria"');
                 SQL.Add('inner join COL$CODIGOSPUC on ');
                 SQL.Add('("col$causaciondiaria".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciondiaria".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where "col$causaciondiaria".ID_EDAD_ACT = '+QuotedStr('A'));
                 SQL.Add('and "col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciondiaria".ID_CLASIFICACION, "col$causaciondiaria".ID_GARANTIA,');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT');
                 SQL.Add('order by "col$causaciondiaria".ID_CLASIFICACION DESC,"col$causaciondiaria".ID_GARANTIA,');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Corto y Largo Plazo',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
                while not Eof do begin
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_CAPITAL_CP,COL$CODIGOSPUC.COD_CAPITAL_LP');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := fieldbyname('ID_GARANTIA').AsInteger;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD_ACT').AsString;
                     try
                      IBSQL3.ExecQuery;
                      CodigoCorto := IBSQL3.FieldByName('COD_CAPITAL_CP').AsString;
                      CodigoLargo := IBSQL3.FieldByName('COD_CAPITAL_LP').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Corto y Largo Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoCorto;
                     try
                      IBSQL3.ExecQuery;
                      ValorCorto := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoLargo;
                     try
                      IBSQL3.ExecQuery;
                      ValorLargo := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

//  Comparar Valor y Contabilizar Diferencia
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoCorto;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if ValorCorto > FieldByName('CORTO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoCorto;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := ValorCorto - FieldByName('CORTO').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if ValorCorto < FieldByName('CORTO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoCorto;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('CORTO').AsCurrency - ValorCorto;
                        Lista.Add(AR);
                        Aplica := True;
                     end;

                     IBSQL3.Close;
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoLargo;
                     IBSQL3.ExecQuery;
                     if ValorLargo > FieldByName('LARGO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoLargo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := ValorLargo - FieldByName('LARGO').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if ValorLargo < FieldByName('LARGO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoLargo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('LARGO').AsCurrency - ValorLargo;
                        Lista.Add(AR);
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with

               verificarCuadre('Corto y Largo Plazo');

               IBSQL2.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.SegundoPC;
var AR:PList;
    Codigo:string;
    Valor,ValorDeuda:Currency;
    Aplica :Boolean;
begin
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_EDAD > :ID_EDAD');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                ParamByName('ID_EDAD').AsString := 'A';
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".DEUDA) AS DEUDA');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_GARANTIA = :ID_GARANTIA and ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_GARANTIA').AsInteger := FieldByName('ID_GARANTIA').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorDeuda := IBSQL2.FieldByName('DEUDA').AsCurrency
                   else
                      ValorDeuda := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_CAPITAL_CP');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := fieldbyname('ID_GARANTIA').AsInteger;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_CAPITAL_CP').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Corto y Largo Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;


//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > ValorDeuda then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - ValorDeuda;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < ValorDeuda then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := ValorDeuda - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               IBSQL1.Transaction.Commit;

// Ajuste Costas
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_GARANTIA = 1');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".COSTAS) AS COSTAS');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorDeuda := IBSQL2.FieldByName('COSTAS').AsCurrency
                   else
                      ValorDeuda := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_COSTAS');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_COSTAS').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Costas',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Costas',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;


//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > ValorDeuda then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - ValorDeuda;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < ValorDeuda then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := ValorDeuda - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               IBSQL1.Transaction.Commit;
               verificarCuadre('Ajustar Calificacion');
end;

procedure TfrmCausacionCarteraDiariaAuto.TercerPC;
var AR:PList;
    Valor,ValorCausado:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_GARANTIA = 1');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".CAUSADOS) AS CAUSADOS');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorCausado := IBSQL2.FieldByName('CAUSADOS').AsCurrency
                   else
                      ValorCausado := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_CXC');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_CXC').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Interes Causado',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > ValorCausado then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - ValorCausado;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < ValorCausado then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := ValorCausado - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                          if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial - ar^.debito + ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.credito - ar^.debito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.credito - ar^.debito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.credito - ar^.debito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               Codigo := '415005000000000000'{ YA ES NIIF };
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Comercial <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Comercial < 0 then begin
                   AR^.credito := -Comercial;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Comercial;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415010000000000000'{ YA ES NIIF };
               if Consumo <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Consumo < 0 then begin
                   AR^.credito := -Consumo;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Consumo;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415015000000000000'{ YA ES NIIF };
               if Vivienda <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Vivienda < 0 then begin
                   AR^.credito := -Vivienda;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Vivienda;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415017000000000000'{ YA ES NIIF};
               if Microcredito <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Microcredito < 0 then begin
                   AR^.credito := -Microcredito;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Microcredito;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

                Actualizargrid;
                IBSQL1.Transaction.Commit;

                verificarCuadre('Causacion de Intereses');                
end;

procedure TfrmCausacionCarteraDiariaAuto.CuartoPC;
var AR:PList;
    Valor,ValorProvision, ValorE:Currency;
    Codigo,CodigoI,CodigoE:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
              ValorE := 0;
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".PCAPITAL) AS PCAPITAL');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_GARANTIA = :ID_GARANTIA and');
                 IBSQL2.SQL.Add('ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_GARANTIA').AsInteger := FieldByName('ID_GARANTIA').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorProvision := IBSQL2.FieldByName('PCAPITAL').AsCurrency
                   else
                      ValorProvision := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_PROV_CAPITAL');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := fieldbyname('ID_GARANTIA').AsInteger;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_PROV_CAPITAL').AsString;
                     except
                      MessageDlg('Error Buscando Codigo Provision Capital',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-ValorProvision) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -ValorProvision;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-ValorProvision) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -ValorProvision - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + AR^.debito - AR^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + AR^.debito - AR^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + AR^.debito - AR^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + AR^.debito - AR^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with

               IBSQL3.Close;
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select "col$causaciondiaria".ID_CLASIFICACION,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PCAPITAL_REC) AS PCAPITAL_REC,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PCAPITAL_REV) AS PCAPITAL_REV,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PCAPITAL_GAS) AS PCAPITAL_GAS,');
               IBSQL3.SQL.Add('COL$CODIGOSPUC.COD_IPROV_CAPITAL,');
               IBSQL3.SQL.Add('COL$CODIGOSPUC.COD_EPROV_CAPITAL');
               IBSQL3.SQL.Add('from "col$causaciondiaria"');
               IBSQL3.SQL.Add('inner join COL$CODIGOSPUC on');
               IBSQL3.SQL.Add('("col$causaciondiaria".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
               IBSQL3.SQL.Add('"col$causaciondiaria".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
               IBSQL3.SQL.Add('"col$causaciondiaria".ID_EDAD_ACT = COL$CODIGOSPUC.ID_CATEGORIA)');
               IBSQL3.SQL.Add('where');
               IBSQL3.SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
               IBSQL3.SQL.Add('group by "col$causaciondiaria".ID_CLASIFICACION,');
               IBSQL3.SQL.Add('COL$CODIGOSPUC.COD_IPROV_CAPITAL,');
               IBSQL3.SQL.Add('COL$CODIGOSPUC.COD_EPROV_CAPITAL');
               IBSQL3.SQL.Add('order by "col$causaciondiaria".ID_CLASIFICACION ASC');
               IBSQL3.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
               try
                 IBSQL3.ExecQuery;
               except
                 MessageDlg('Error Buscando Codigo I/G Provision Capital',mtError,[mbcancel],0);
                 IBSQL3.Transaction.Rollback;
                 raise;
                 Exit;
               end;

               while not IBSQL3.Eof do begin
                Aplica := False;
                if IBSQL3.FieldByName('PCAPITAL_REC').AsCurrency > 0 then begin
                  IBSQL8.Close;
                  IBSQL8.SQL.Clear;
                  IBSQL8.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                  IBSQL8.ParamByName('CODIGO').AsString := IBSQL3.FieldByName('COD_IPROV_CAPITAL').AsString;
                  IBSQL8.ExecQuery;
                  New(ar);
                  AR^.codigo := IBSQL3.FieldByName('COD_IPROV_CAPITAL').AsString;
                  AR^.nomcuenta := IBSQL8.FieldByName('NOMBRE').AsString;
                  AR^.nocuenta := 0;
                  AR^.nocredito := '';
                  AR^.tipoide := 0;
                  AR^.idpersona := '';
                  AR^.monto := 0;
                  AR^.tasa := 0;
                  AR^.estado := 'O';
                  AR^.credito := IBSQL3.FieldByName('PCAPITAL_REC').AsCurrency;
                  AR^.debito := 0;
                  Lista.Add(AR);
                  Aplica := True;
                  IBSQL8.Close;
                 end;
              {
                if IBSQL3.FieldByName('PCAPITAL_REV').AsCurrency > 0 then begin
                  IBSQL8.Close;
                  IBSQL8.SQL.Clear;
                  IBSQL8.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                  IBSQL8.ParamByName('CODIGO').AsString := IBSQL3.FieldByName('COD_EPROV_CAPITAL').AsString;
                  IBSQL8.ExecQuery;
                  New(ar);
                  AR^.codigo := IBSQL3.FieldByName('COD_EPROV_CAPITAL').AsString;
                  AR^.nomcuenta := IBSQL8.FieldByName('NOMBRE').AsString;
                  AR^.nocuenta := 0;
                  AR^.nocredito := '';
                  AR^.tipoide := 0;
                  AR^.idpersona := '';
                  AR^.monto := 0;
                  AR^.tasa := 0;
                  AR^.estado := 'O';
                  AR^.credito := IBSQL3.FieldByName('PCAPITAL_REV').AsCurrency;
                  AR^.debito := 0;
                  Lista.Add(AR);
                  IBSQL8.Close;
                 end;

                if IBSQL3.FieldByName('PCAPITAL_GAS').AsCurrency > 0 then begin
                  IBSQL8.Close;
                  IBSQL8.SQL.Clear;
                  IBSQL8.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                  IBSQL8.ParamByName('CODIGO').AsString := IBSQL3.FieldByName('COD_EPROV_CAPITAL').AsString;
                  IBSQL8.ExecQuery;
                  New(ar);
                  AR^.codigo := IBSQL3.FieldByName('COD_EPROV_CAPITAL').AsString;
                  AR^.nomcuenta := IBSQL8.FieldByName('NOMBRE').AsString;
                  AR^.nocuenta := 0;
                  AR^.nocredito := '';
                  AR^.tipoide := 0;
                  AR^.idpersona := '';
                  AR^.monto := 0;
                  AR^.tasa := 0;
                  AR^.estado := 'O';
                  AR^.credito := 0;
                  AR^.debito := IBSQL3.FieldByName('PCAPITAL_GAS').AsCurrency;
                  Lista.Add(AR);
                  IBSQL8.Close;
                 end;   }

                 if Aplica then
                 if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                   Comercial := Comercial + ar^.debito - ar^.credito
                 else if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                   Consumo := Consumo + ar^.debito - ar^.credito
                 else if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                   Vivienda := Vivienda + ar^.debito - ar^.credito
                 else if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                   Microcredito := Microcredito + ar^.debito - ar^.credito;
                 ActualizarGrid;

                 IBSQL3.Next;
                end;   //Fin de While ibsql3
                IBSQL3.Close;

               IBSQL3.Close;
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select first 1 COD_IPROV_CAPITAL,COD_EPROV_CAPITAL from COL$CODIGOSPUC');
               IBSQL3.SQL.Add(' where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION');
//               IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
               IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := 1;
               try
                 IBSQL3.ExecQuery;
                 CodigoI := IBSQL3.FieldByName('COD_IPROV_CAPITAL').AsString;
                 CodigoE := IBSQL3.FieldByName('COD_EPROV_CAPITAL').AsString;
               except
                 MessageDlg('Error Buscando Codigo I/G Provision Capital',mtError,[mbcancel],0);
                 IBSQL3.Transaction.Rollback;
                 raise;
                 Exit;
               end;


//               Codigo := '511510000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Comercial <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := CodigoE;
                 IBSQL3.ExecQuery;
                 AR^.codigo := CodigoE;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Comercial < 0 then begin
                   AR^.debito := -Comercial;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Comercial;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               IBSQL3.Close;
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select first 1 COD_IPROV_CAPITAL,COD_EPROV_CAPITAL from COL$CODIGOSPUC');
               IBSQL3.SQL.Add(' where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION');
//               IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
               IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := 2;
               try
                 IBSQL3.ExecQuery;
                 CodigoI := IBSQL3.FieldByName('COD_IPROV_CAPITAL').AsString;
                 CodigoE := IBSQL3.FieldByName('COD_EPROV_CAPITAL').AsString;
               except
                 MessageDlg('Error Buscando Codigo I/G Provision Capital',mtError,[mbcancel],0);
                 IBSQL3.Transaction.Rollback;
                 raise;
                 Exit;
               end;

//               Codigo := '511515000000000000';

               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Consumo <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := CodigoE;
                 IBSQL3.ExecQuery;
                 AR^.codigo := CodigoE;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Consumo < 0 then begin
                   AR^.debito := -Consumo;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Consumo;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               IBSQL3.Close;
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select first 1 COD_IPROV_CAPITAL,COD_EPROV_CAPITAL from COL$CODIGOSPUC');
               IBSQL3.SQL.Add(' where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION');
//               IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
               IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := 3;
               try
                 IBSQL3.ExecQuery;
                 CodigoI := IBSQL3.FieldByName('COD_IPROV_CAPITAL').AsString;
                 CodigoE := IBSQL3.FieldByName('COD_EPROV_CAPITAL').AsString;
               except
                 MessageDlg('Error Buscando Codigo I/G Provision Capital',mtError,[mbcancel],0);
                 IBSQL3.Transaction.Rollback;
                 raise;
                 Exit;
               end;


               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

//               Codigo := '511520000000000000';
               if Vivienda <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := CodigoE;
                 IBSQL3.ExecQuery;
                 AR^.codigo := CodigoE;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Vivienda < 0 then begin
                   AR^.debito := -Vivienda;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Vivienda;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               IBSQL3.Close;
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select first 1 COD_IPROV_CAPITAL,COD_EPROV_CAPITAL from COL$CODIGOSPUC');
               IBSQL3.SQL.Add(' where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION');
//               IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
               IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := 4;
               try
                 IBSQL3.ExecQuery;
                 CodigoI := IBSQL3.FieldByName('COD_IPROV_CAPITAL').AsString;
                 CodigoE := IBSQL3.FieldByName('COD_EPROV_CAPITAL').AsString;
               except
                 MessageDlg('Error Buscando Codigo I/G Provision Capital',mtError,[mbcancel],0);
                 IBSQL3.Transaction.Rollback;
                 raise;
                 Exit;
               end;


               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

//               Codigo := '511523000000000000';
               if Microcredito <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := CodigoE;
                 IBSQL3.ExecQuery;
                 AR^.codigo := CodigoE;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Microcredito < 0 then begin
                   AR^.debito := -Microcredito;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Microcredito;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
                Actualizargrid;
                IBSQL1.Transaction.Commit;

                verificarCuadre('Provision de Capital de Colocaciones');
end;

procedure TfrmCausacionCarteraDiariaAuto.QuintoPC;
var AR:PList;
    Valor,ValorProvision:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_GARANTIA = 1');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".PINTERES) AS PINTERES');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorProvision := IBSQL2.FieldByName('PINTERES').AsCurrency
                   else
                      ValorProvision := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_PROV_INTERES');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_PROV_INTERES').AsString;
                     except
                      MessageDlg('Error Buscando Codigo Provision Interes',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-ValorProvision) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -ValorProvision;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-ValorProvision) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -ValorProvision - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.debito - ar^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with

//Provision de Costas Judiciales
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_GARANTIA = 1');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".PCOSTAS) AS PCOSTAS');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorProvision := IBSQL2.FieldByName('PCOSTAS').AsCurrency
                   else
                      ValorProvision := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;
// Buscar y Comparar Valores
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_PROV_COSTAS');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_PROV_COSTAS').AsString;
                     except
                      MessageDlg('Error Buscando Codigo Provision Costas',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-ValorProvision) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -ValorProvision;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-ValorProvision) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -ValorProvision - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.debito - ar^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with

               IBSQL3.Close;
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select "col$causaciondiaria".ID_CLASIFICACION,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PINTERES_REC) AS PINTERES_REC,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PINTERES_REV) AS PINTERES_REV,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PINTERES_GAS) AS PINTERES_GAS');
               IBSQL3.SQL.Add('from "col$causaciondiaria"');
               IBSQL3.SQL.Add('where');
               IBSQL3.SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
               IBSQL3.SQL.Add('group by "col$causaciondiaria".ID_CLASIFICACION');
               IBSQL3.SQL.Add('order by "col$causaciondiaria".ID_CLASIFICACION ASC');
               IBSQL3.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
               try
                 IBSQL3.ExecQuery;
               except
                 MessageDlg('Error Buscando Recuperacion Interes',mtError,[mbcancel],0);
                 IBSQL3.Transaction.Rollback;
                 raise;
                 Exit;
               end;

               while not IBSQL3.Eof do begin
                Aplica := False;
                if IBSQL3.FieldByName('PINTERES_REC').AsCurrency > 0 then begin
                  New(ar);
                  //AR^.codigo := '425037000000000000'; //Anterior
                  //AR^.codigo := '418026000000000000'; //Anterior
                  AR^.codigo := '422522000000000000'; //Nuevo C?digo
                  AR^.nomcuenta := 'REINTEGRO PROVISIONES DE CUENTAS POR COBRAR';
                  AR^.nocuenta := 0;
                  AR^.nocredito := '';
                  AR^.tipoide := 0;
                  AR^.idpersona := '';
                  AR^.monto := 0;
                  AR^.tasa := 0;
                  AR^.estado := 'O';
                  AR^.credito := IBSQL3.FieldByName('PINTERES_REC').AsCurrency;
                  AR^.debito := 0;
                  Lista.Add(AR);
                  Aplica := True;
                 end;

                 if Aplica then
                 if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                    Comercial := Comercial + ar^.debito - ar^.credito
                 else if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                    Consumo := Consumo + ar^.debito - ar^.credito
                 else if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                    Vivienda := Vivienda + ar^.debito - ar^.credito
                 else if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                    Microcredito := Microcredito + ar^.debito - ar^.credito;
                 ActualizarGrid;

                 IBSQL3.Next;
                end;   //Fin de While ibsql3

               IBSQL3.Close;
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select "col$causaciondiaria".ID_CLASIFICACION,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PCOSTAS_REC) AS PCOSTAS_REC,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PCOSTAS_REV) AS PCOSTAS_REV,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PCOSTAS_GAS) AS PCOSTAS_GAS');
               IBSQL3.SQL.Add('from "col$causaciondiaria"');
               IBSQL3.SQL.Add('where');
               IBSQL3.SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
               IBSQL3.SQL.Add('group by "col$causaciondiaria".ID_CLASIFICACION');
               IBSQL3.SQL.Add('order by "col$causaciondiaria".ID_CLASIFICACION ASC');
               IBSQL3.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
               try
                 IBSQL3.ExecQuery;
               except
                 MessageDlg('Error Buscando Recuperacion Interes',mtError,[mbcancel],0);
                 IBSQL3.Transaction.Rollback;
                 raise;
                 Exit;
               end;

               while not IBSQL3.Eof do begin
                Aplica := False;
                if IBSQL3.FieldByName('PCOSTAS_REC').AsCurrency > 0 then begin
                  New(ar);
                  //AR^.codigo := '425037000000000000'; Anterior
                  //AR^.codigo := '418026000000000000'; //Anterior
                  AR^.codigo := '422522000000000000'; //Nuevo C?digo
                  AR^.nomcuenta := 'REINTEGRO PROVISIONES DE CUENTAS POR COBRAR';
                  AR^.nocuenta := 0;
                  AR^.nocredito := '';
                  AR^.tipoide := 0;
                  AR^.idpersona := '';
                  AR^.monto := 0;
                  AR^.tasa := 0;
                  AR^.estado := 'O';
                  AR^.credito := IBSQL3.FieldByName('PCOSTAS_REC').AsCurrency;
                  AR^.debito := 0;
                  Lista.Add(AR);
                  Aplica := True;
                 end;

                 if Aplica then
                 if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                    Comercial := Comercial + ar^.debito - ar^.credito
                 else if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                    Consumo := Consumo + ar^.debito - ar^.credito
                 else if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                    Vivienda := Vivienda + ar^.debito - ar^.credito
                 else if IBSQL3.FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                    Microcredito := Microcredito + ar^.debito - ar^.credito;
                 ActualizarGrid;

                 IBSQL3.Next;
                end;   //Fin de While ibsql3

                IBSQL3.Close;

               //Codigo := '146810000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
               Codigo := '511527000000000000';
               if (Comercial) <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if (Comercial) < 0 then begin
                   AR^.debito := -(Comercial);
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := (Comercial);
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '511518000000000000';
               if (Consumo + Vivienda + Microcredito) <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;

                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if (Consumo + Vivienda + Microcredito) < 0 then begin
                   AR^.debito := -(Consumo + Vivienda + Microcredito);
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := (Consumo + Vivienda + Microcredito);
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;


                IBSQL1.Transaction.Commit;
                Actualizargrid;

                verificarCuadre('Provision de Interes de Colocaciones y Costas Judiciales');
end;

procedure TfrmCausacionCarteraDiariaAuto.SextoPC;
var AR:PList;
    Valor:Currency;
    Codigo:string;
    Colocaciones:Currency;
    Aplica :Boolean;
    ProvisionGral: Double;
begin
              Colocaciones    := 0;
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select SUM("col$causaciondiaria".DEUDA) AS DEUDA ');
                 SQL.Add('from "col$causaciondiaria"');
                 SQL.Add('where "col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                   Valor := FieldByName('DEUDA').AsCurrency;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

                 Close;
                 SQL.Clear;
                 SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 30');
                 ExecQuery;
                 ProvisionGral := FieldByName('VALOR_MINIMO').AsFloat;
                 Close;

                 Colocaciones := SimpleRoundTo((Valor * ProvisionGral),0);
// Validar Contra Saldo Actual
                     Codigo := '146810000000000000';

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-Colocaciones) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -Colocaciones;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-Colocaciones) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -Colocaciones - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     Valor := ar^.debito - AR^.credito;

               Codigo := '511529000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Valor <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Valor < 0 then begin
                   AR^.debito := -Valor;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Valor;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
              end;
              actualizargrid;
              IBSQL3.Transaction.Commit;

              verificarCuadre('Provision General');              
end;

procedure TfrmCausacionCarteraDiariaAuto.SeptimoPC;
var AR:PList;
    Valor,ValorAnticipado:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_EDAD = :ID_EDAD and ID_GARANTIA = 1');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                ParamByName('ID_EDAD').AsString := 'A';
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".ANTICIPADOS) AS ANTICIPADOS');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorAnticipado := IBSQL2.FieldByName('ANTICIPADOS').AsCurrency
                   else
                      ValorAnticipado := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_INT_ANT');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := fieldbyname('ID_GARANTIA').AsInteger;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_INT_ANT').AsString;
                     except
                      MessageDlg('Error Buscando Codigo Provision Interes',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
{
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select CON$PUC.SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('where CON$PUC.CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select SUM(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from CON$PUC');
                     IBSQL3.SQL.Add('left join CON$SALDOSCUENTA ON (CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA and ');
                     IBSQL3.SQL.Add('CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO)');
                     IBSQL3.SQL.Add('where CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO and CON$SALDOSCUENTA.MES <= :MES');
                     IBSQL3.SQL.Add('group by CON$PUC.SALDOINICIAL');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger;
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     try
                      IBSQL3.ExecQuery;
                      Valor := Valor + IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
}
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

//Comparar Saldos y Contabilizar
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (-ValorAnticipado) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - -ValorAnticipado;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (-ValorAnticipado) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := -ValorAnticipado - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.debito - ar^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               Codigo := '415005000000000000'{YA ES NIIF};
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Comercial <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Comercial < 0 then begin
                   AR^.debito := -Comercial;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Comercial;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415010000000000000'{YA ES NIIF};
               if Consumo <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Consumo < 0 then begin
                   AR^.debito := -Consumo;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Consumo;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415015000000000000'{YA ES NIIF};
               if Vivienda <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Vivienda < 0 then begin
                   AR^.debito := -Vivienda;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Vivienda;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415017000000000000'{YA ES NIIF};
               if Microcredito <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Microcredito < 0 then begin
                   AR^.debito := -Microcredito;
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := Microcredito;
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
                Actualizargrid;
                IBSQL1.Transaction.Commit;

                verificarCuadre('Traslado de Intereses Anticipados');
end;

procedure TfrmCausacionCarteraDiariaAuto.OctavoPC;
var AR:PList;
    Valor,ValorContingencia:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_GARANTIA = 1 and ID_EDAD >= ''C''');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".CONTINGENCIAS) AS CONTINGENCIAS');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorContingencia := IBSQL2.FieldByName('CONTINGENCIAS').AsCurrency
                   else
                      ValorContingencia := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_CONTINGENCIA');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := Fieldbyname('ID_GARANTIA').AsInteger;;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_CONTINGENCIA').AsString;
                     except
                      MessageDlg('Error Buscando Codigo Provision Interes',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

//Comparar Saldos y Contabilizar
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > (ValorContingencia) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - ValorContingencia;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < (ValorContingencia) then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := ValorContingencia - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                     if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.debito - ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.debito - ar^.credito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               Codigo := '860500000000000000'{YA ES NIIF};
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if (Comercial+Consumo+Vivienda+Microcredito) <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if (Comercial+Consumo+Vivienda+Microcredito) < 0 then begin
                   AR^.debito := -(Comercial+Consumo+Vivienda+Microcredito);
                   AR^.credito := 0;
                 end
                 else begin
                   AR^.credito := (Comercial+Consumo+Vivienda+Microcredito);
                   AR^.debito := 0;
                 end;
                 Lista.Add(AR);
                end;
                Actualizargrid;
                IBSQL1.Transaction.Commit;

                verificarCuadre('Contingencias');                
end;

procedure TfrmCausacionCarteraDiariaAuto.NovenoPC;
var AR:PList;
   i:Integer;
   Valor,Valor1:Currency;
begin
             Valor := 0;
             for i := 0 to Lista.Count - 1 do
             begin
               AR := Lista.Items[i];
               if (LeftStr(AR^.codigo,1) = '5') and
                  (AR^.credito > 0) then begin
                   Valor := Valor + AR^.credito;
                   Lista.Items[i] := nil;
               end;
             end;
            if Valor > 0 then
             for i := 0 to Lista.Count - 1 do
             begin
               AR := Lista.Items[i];
               if AR <> nil then
               if AR^.codigo = '146810000000000000'{YA ES NIIF} then begin
                  if AR^.credito > 0 then
                     AR^.credito := AR^.credito + Valor
                  else
                  begin
                     AR^.debito := ar^.debito - Valor;
                     if AR^.debito < 0 then begin
                        AR^.credito := -ar^.debito;
                        AR^.debito := 0;
                     end;
                  end;
               end
               else
               if AR^.codigo = '511529000000000000'{YA ES NIIF} then begin
                  if AR^.debito > 0 then
                     AR^.debito := AR^.debito + Valor
                  else
                  begin
                     AR^.credito := ar^.credito - Valor;
                     if AR^.credito < 0 then begin
                        AR^.debito := -ar^.debito;
                        AR^.credito := 0;
                     end;
                  end;
               end;
             end;
             i :=0;
             while True do begin
               if i > (Lista.Count - 1) then Break;
                 if Lista.Items[i] = nil then Lista.Delete(i);
               i := i + 1;
             end;

             Lista.Pack;


             actualizargrid;

end;

procedure TfrmCausacionCarteraDiariaAuto.DecimoPC;
var I:Integer;
    TotalDebito:Currency;
    TotalCredito:Currency;
    ARecord:PList;
    FechaComp:TDate;
begin

      FechaComp := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)));
      if Consecutivo < 1 then
         Consecutivo := ObtenerConsecutivo(IBSQL1);
      EdComprobante.Caption := FormatCurr('0000000',Consecutivo);

      TotalDebito := 0;
      TotalCredito := 0;

      for I := 0 to Lista.Count - 1 do
      begin
        ARecord := Lista.Items[i];
        TotalDebito := TotalDebito + arecord^.debito;
        TotalCredito := TotalCredito + arecord^.credito;
      end;

      with IBSQL1 do begin
       if Transaction.InTransaction then
          Transaction.Rollback;
       Transaction.StartTransaction;
         Close;
         sql.Clear;
         sql.Add('insert into CON$COMPROBANTE (CON$COMPROBANTE."ID_COMPROBANTE",');
         sql.Add('CON$COMPROBANTE."FECHADIA", CON$COMPROBANTE."TIPO_COMPROBANTE",');
         sql.Add('CON$COMPROBANTE."ID_AGENCIA", CON$COMPROBANTE."DESCRIPCION",');
         sql.Add('CON$COMPROBANTE."TOTAL_DEBITO", CON$COMPROBANTE."TOTAL_CREDITO",');
         sql.Add('CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO",');
         sql.Add('CON$COMPROBANTE."ANULACION",CON$COMPROBANTE.ID_EMPLEADO)');
         sql.Add('values (');
         sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
         sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
         sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION",:ID_EMPLEADO)');

         ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
         ParamByname('FECHADIA').AsDate := FechaComp;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
         ParamByName('DESCRIPCION').AsString := 'AJUSTE CALIFICACION, CAUSACION Y PROVISION DE CARTERA EN LA FECHA';
         ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebito;
         ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCredito;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByname('ANULACION').asstring := '';
         ParamByName('IMPRESO').AsInteger  := 1;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ExecQuery;

         Close;
         SQL.Clear;
         SQL.Add('insert into CON$AUXILIAR values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
         if Lista.Count > 0 then
         for I := 0 to Lista.Count -1 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('insert into CON$AUXILIAR values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
            ARecord := Lista.Items[I];
            ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := FechaComp;
            ParamByName('CODIGO').AsString := Arecord^.codigo;
            ParamByName('DEBITO').AsCurrency := Arecord^.debito;
            ParamByName('CREDITO').AsCurrency := Arecord^.credito;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
            ExecQuery;
         end;

         Close;
         SQL.Clear;
         SQL.Add('update "col$causacionescontrol" set CONTABILIZADA = 1, ID_COMPROBANTE = :CSC');
         SQL.Add('where FECHA = :FECHA');
         ParamByName('FECHA').AsDate := EdFechaCorte.Date;
         ParamByName('CSC').AsInteger := Consecutivo;
         ExecQuery;
        try
         Transaction.Commit;
        except
         Transaction.Rollback;
         raise;
         Exit;
        end;
       end;
end;

procedure TfrmCausacionCarteraDiariaAuto.ContabilizarCPLP;
var AR : Plist;
    Aplica :Boolean;
    CodigoCorto,CodigoLargo:string;
    ValorCorto,ValorLargo:Currency;
begin
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciondiaria".ID_CLASIFICACION,');
                 SQL.Add('"col$causaciondiaria".ID_GARANTIA,"col$causaciondiaria".ID_EDAD_ACT,');
                 SQL.Add('SUM("col$causaciondiaria".CORTO_PL) AS CORTO,');
                 SQL.Add('SUM("col$causaciondiaria".LARGO_PL) AS LARGO,');
                 SQL.Add('COL$CODIGOSPUC.COD_CAPITAL_CP,');
                 SQL.Add('COL$CODIGOSPUC.COD_CAPITAL_LP');
                 SQL.Add('from "col$causaciondiaria"');
                 SQL.Add('inner join COL$CODIGOSPUC on');
                 SQL.Add('("col$causaciondiaria".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciondiaria".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where');
                 SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciondiaria".ID_CLASIFICACION, "col$causaciondiaria".ID_GARANTIA,');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT,COL$CODIGOSPUC.COD_CAPITAL_CP,COL$CODIGOSPUC.COD_CAPITAL_LP');
                 SQL.Add('order by "col$causaciondiaria".ID_CLASIFICACION DESC,"col$causaciondiaria".ID_GARANTIA,');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Corto y Largo Plazo',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

                 // Buscar y Comparar Valores
                 while not Eof do begin
                   CodigoCorto := FieldByName('COD_CAPITAL_CP').AsString;
                   CodigoLargo := FieldByName('COD_CAPITAL_LP').AsString;

                   IBSQL3.Close;
                   IBSQL3.SQL.Clear;
                   IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                   IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                   IBSQL3.ParamByName('CODIGO').AsString := CodigoCorto;
                   try
                    IBSQL3.ExecQuery;
                    ValorCorto := IBSQL3.FieldByName('SALDO').AsCurrency;
                   except
                    MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                    Transaction.Rollback;
                    raise;
                    Exit;
                   end;

                   IBSQL3.Close;
                   IBSQL3.SQL.Clear;
                   IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                   IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                   IBSQL3.ParamByName('CODIGO').AsString := CodigoLargo;
                   try
                    IBSQL3.ExecQuery;
                    ValorLargo := IBSQL3.FieldByName('SALDO').AsCurrency;
                   except
                    MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                    Transaction.Rollback;
                    raise;
                    Exit;
                   end;

                   //  Comparar Valor y Contabilizar Diferencia
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoCorto;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if ValorCorto > FieldByName('CORTO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoCorto;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := ValorCorto - FieldByName('CORTO').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if ValorCorto < FieldByName('SALDO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoCorto;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('CORTO').AsCurrency - ValorCorto;
                        Lista.Add(AR);
                        Aplica := True;
                     end;

                     IBSQL3.Close;
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoLargo;
                     IBSQL3.ExecQuery;
                     if ValorLargo > FieldByName('LARGO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoLargo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := ValorLargo - FieldByName('LARGO').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if ValorLargo < FieldByName('LARGO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoLargo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('LARGO').AsCurrency - ValorLargo;
                        Lista.Add(AR);
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               IBSQL2.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.ContabilizarKC;
var AR:PList;
    Codigo:string;
    Valor,ValorDeuda:Currency;
    Aplica :Boolean;
begin
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_EDAD > :ID_EDAD');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                ParamByName('ID_EDAD').AsString := 'A';
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".DEUDA) AS DEUDA');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_GARANTIA = :ID_GARANTIA and ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_GARANTIA').AsInteger := FieldByName('ID_GARANTIA').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorDeuda := IBSQL2.FieldByName('DEUDA').AsCurrency
                   else
                      ValorDeuda := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_CAPITAL_CP');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := fieldbyname('ID_GARANTIA').AsInteger;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_CAPITAL_CP').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Corto y Largo Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;


//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > ValorDeuda then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - ValorDeuda;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < ValorDeuda then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := ValorDeuda - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               IBSQL1.Transaction.Commit;

// Ajuste Costas
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_GARANTIA = 1');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".COSTAS) AS COSTAS');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorDeuda := IBSQL2.FieldByName('COSTAS').AsCurrency
                   else
                      ValorDeuda := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_COSTAS');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_COSTAS').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Costas',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Costas',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;


//Comparar Saldos y Contabilizar

                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > ValorDeuda then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - ValorDeuda;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < ValorDeuda then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := ValorDeuda - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               IBSQL1.Transaction.Commit;

end;

procedure TfrmCausacionCarteraDiariaAuto.ContabilizarCau;
var AR:PList;
    Valor,ValorCausado:Currency;
    Codigo:string;
    Comercial,Consumo,Vivienda,Microcredito:Currency;
    Aplica :Boolean;
begin
              Comercial    := 0;
              Consumo      := 0;
              Vivienda     := 0;
              Microcredito := 0;
              with IBSQL1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select * from "col$porccausacion"');
                SQL.Add('where ID_GARANTIA = 1');
                SQL.Add('order by ID_CLASIFICACION,ID_GARANTIA,ID_EDAD');
                try
                  ExecQuery;
                except
                  Transaction.Rollback;
                  raise;
                end;
                while not Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SUM("col$causaciondiaria".CAUSADOS) AS CAUSADOS');
                 IBSQL2.SQL.Add('from "col$causaciondiaria"');
                 IBSQL2.SQL.Add('where ID_CLASIFICACION = :ID_CLASIFICACION and ');
                 IBSQL2.SQL.Add('ID_ARRASTRE = :ID_CATEGORIA and');
                 IBSQL2.SQL.Add('FECHA_CORTE = :FECHA_CORTE');
                 IBSQL2.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                 IBSQL2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EDAD').AsString;
                 IBSQL2.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                      ValorCausado := IBSQL2.FieldByName('CAUSADOS').AsCurrency
                   else
                      ValorCausado := 0;
                 except
                   MessageDlg('Error al Buscar Deuda',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

// Buscar y Comparar Valores
// Buscar Codigo Puc
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select COL$CODIGOSPUC.COD_CXC');
                     IBSQL3.SQL.Add('from COL$CODIGOSPUC where COL$CODIGOSPUC.ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('COL$CODIGOSPUC.ID_GARANTIA = :ID_GARANTIA and COL$CODIGOSPUC.ID_CATEGORIA = :ID_CATEGORIA');
                     IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                     IBSQL3.ParamByName('ID_GARANTIA').AsInteger := 1;
                     IBSQL3.ParamByName('ID_CATEGORIA').AsString := fieldbyname('ID_EDAD').AsString;
                     try
                      IBSQL3.ExecQuery;
                      Codigo := IBSQL3.FieldByName('COD_CXC').AsString;
                     except
                      MessageDlg('Error Buscando Codigos Interes Causado',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//  Buscar en Puc Saldos Actuales
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                     IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     try
                      IBSQL3.ExecQuery;
                      Valor := IBSQL3.FieldByName('SALDO').AsCurrency;
                     except
                      MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                     end;
//Comparar Saldos y Contabilizar
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if Valor > ValorCausado then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := Valor - ValorCausado;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if Valor < ValorCausado then
                     begin
                        New(AR);
                        AR^.codigo := Codigo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := ValorCausado - Valor;
                        Lista.Add(AR);
                        Aplica := True;
                     end;
                     if Aplica then
                          if FieldByName('ID_CLASIFICACION').AsInteger = 1 then
                        Comercial := Comercial - ar^.debito + ar^.credito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 2 then
                        Consumo := Consumo + ar^.credito - ar^.debito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 3 then
                        Vivienda := Vivienda + ar^.credito - ar^.debito
                     else if FieldByName('ID_CLASIFICACION').AsInteger = 4 then
                        Microcredito := Microcredito + ar^.credito - ar^.debito;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               Codigo := '415005000000000000'{YA ES NIIF};
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');

               if Comercial <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Comercial < 0 then begin
                   AR^.credito := -Comercial;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Comercial;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415010000000000000'{YA ES NIIF};
               if Consumo <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Consumo < 0 then begin
                   AR^.credito := -Consumo;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Consumo;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415015000000000000'{YA ES NIIF};
               if Vivienda <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Vivienda < 0 then begin
                   AR^.credito := -Vivienda;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Vivienda;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

               Codigo := '415017000000000000'{YA ES NIIF};
               if Microcredito <> 0 then begin
                 New(ar);
                 IBSQL3.Close;
                 IBSQL3.ParamByName('CODIGO').AsString := Codigo;
                 IBSQL3.ExecQuery;
                 AR^.codigo := Codigo;
                 AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                 AR^.nocuenta := 0;
                 AR^.nocredito := '';
                 AR^.tipoide := 0;
                 AR^.idpersona := '';
                 AR^.monto := 0;
                 AR^.tasa := 0;
                 AR^.estado := 'O';
                 if Microcredito < 0 then begin
                   AR^.credito := -Microcredito;
                   AR^.debito := 0;
                 end
                 else begin
                   AR^.debito := Microcredito;
                   AR^.credito := 0;
                 end;
                 Lista.Add(AR);
                end;

                Actualizargrid;
                IBSQL1.Transaction.Commit;
end;


procedure TfrmCausacionCarteraDiariaAuto.ContabilizarR;
var AR : Plist;
    Aplica :Boolean;
    CortoActual,LargoActual:Currency;
    CodigoCorto,CodigoLargo:string;
    CodigoPK,CodigoPI,CodigoPC:string;
    CodigoRK,CodigoRI,CodigoRC:string;
    CodigoGK,CodigoGI,CodigoGC:string;
    ValorCorto,ValorLargo:Currency;
begin
               with IBSQL2 do begin
                 if Transaction.InTransaction then
                    Transaction.Rollback;
                 Transaction.StartTransaction;
                 Close;
                 SQL.Clear;
                 SQL.Add('select "col$causaciondiaria".ID_CLASIFICACION,');
                 SQL.Add('"col$causaciondiaria".ID_GARANTIA,"col$causaciondiaria".ID_EDAD_ACT,');
                 SQL.Add('SUM("col$causaciondiaria".DEUDA) AS SALDO,');
                 SQL.Add('COL$CODIGOSPUC.COD_CAPITAL_CP,');
                 SQL.Add('COL$CODIGOSPUC.COD_CAPITAL_LP');
                 SQL.Add('from "col$causaciondiaria"');
                 SQL.Add('inner join COL$CODIGOSPUC on');
                 SQL.Add('("col$causaciondiaria".ID_CLASIFICACION = COL$CODIGOSPUC.ID_CLASIFICACION and');
                 SQL.Add('"col$causaciondiaria".ID_GARANTIA = COL$CODIGOSPUC.ID_GARANTIA and');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT = COL$CODIGOSPUC.ID_CATEGORIA)');
                 SQL.Add('where');
                 SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciondiaria".ID_CLASIFICACION, "col$causaciondiaria".ID_GARANTIA,');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT,COL$CODIGOSPUC.COD_CAPITAL_CP,COL$CODIGOSPUC.COD_CAPITAL_LP');
                 SQL.Add('order by "col$causaciondiaria".ID_CLASIFICACION DESC,"col$causaciondiaria".ID_GARANTIA,');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT');
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 try
                   ExecQuery;
                 except
                   MessageDlg('Error al Buscar Corto y Largo Plazo',mtError,[mbcancel],0);
                   Transaction.Rollback;
                   raise;
                   Exit;
                 end;

                 // Buscar y Comparar Valores
                 while not Eof do begin
                   CodigoCorto := FieldByName('COD_CAPITAL_CP').AsString;
                   CodigoLargo := FieldByName('COD_CAPITAL_LP').AsString;

                   IBSQL3.Close;
                   IBSQL3.SQL.Clear;
                   IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                   IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                   IBSQL3.ParamByName('CODIGO').AsString := CodigoCorto;
                   try
                    IBSQL3.ExecQuery;
                    ValorCorto := IBSQL3.FieldByName('SALDO').AsCurrency;
                   except
                    MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                    Transaction.Rollback;
                    raise;
                    Exit;
                   end;

                   IBSQL3.Close;
                   IBSQL3.SQL.Clear;
                   IBSQL3.SQL.Add('select * from VALOR_AGENCIA(:ID_AGENCIA,:MES,:CODIGO)');
                   IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQL3.ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
                   IBSQL3.ParamByName('CODIGO').AsString := CodigoLargo;
                   try
                    IBSQL3.ExecQuery;
                    ValorLargo := IBSQL3.FieldByName('SALDO').AsCurrency;
                   except
                    MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
                    Transaction.Rollback;
                    raise;
                    Exit;
                   end;

                   //  Comparar Valor y Contabilizar Diferencia
                     IBSQL3.Close;
                     IBSQL3.SQL.Clear;
                     IBSQL3.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoCorto;
                     IBSQL3.ExecQuery;
                     Aplica := False;
                     if ValorCorto > FieldByName('CORTO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoCorto;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := ValorCorto - FieldByName('CORTO').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if ValorCorto < FieldByName('CORTO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoCorto;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('CORTO').AsCurrency - ValorCorto;
                        Lista.Add(AR);
                        Aplica := True;
                     end;

                     IBSQL3.Close;
                     IBSQL3.ParamByName('CODIGO').AsString := CodigoLargo;
                     IBSQL3.ExecQuery;
                     if ValorLargo > FieldByName('LARGO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoLargo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.debito := 0;
                        AR^.credito := ValorLargo - FieldByName('LARGO').AsCurrency;
                        Lista.Add(AR);
                        Aplica := True;
                     end
                     else if ValorLargo < FieldByName('LARGO').AsCurrency then
                     begin
                        New(AR);
                        AR^.codigo := CodigoLargo;
                        AR^.nomcuenta := IBSQL3.FieldByName('NOMBRE').AsString;
                        AR^.nocuenta := 0;
                        AR^.nocredito := '';
                        AR^.tipoide := 0;
                        AR^.idpersona := '';
                        AR^.monto := 0;
                        AR^.tasa := 0;
                        AR^.estado := 'O';
                        AR^.credito := 0;
                        AR^.debito := FieldByName('LARGO').AsCurrency - ValorLargo;
                        Lista.Add(AR);
                     end;
                     ActualizarGrid;
                     Next;
                end; // while
               end;// with
               IBSQL2.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiariaAuto.DescuentoGarReal;
var
    Capital,Interes,PCostas:Currency;
    PCapDiaAnt,PIntDiaAnt,PCosDiaAnt:Currency;
    PCapAcum,PIntAcum,PCosAcum:Currency;
    MovCapital,RecCapital,RevGCapital,GCapital:Currency;
    MovInteres,RecInteres,RevGInteres,GInteres:Currency;
    MovCostas,RecCostas,RevGCostas,GCostas:Currency;
    TipoId:Integer;
    Persona:string;
    edad_ant:string;
    SaldoGarantia,SaldoCapital,NuevaDeuda:Currency;
    PorcGarantia:Double;
    MoraCredito:Integer;
begin
          with IBQReal do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
           Transaction.StartTransaction;

//          Close;
//          SQL.Clear;
//          SQL.Add('
          try
           Open;
          except
           MessageDlg('Error al Iniciar la Tabla Temporal para proceso de Garantias',mtError,[mbcancel],0);
           Transaction.Rollback;
           raise;
           Exit;
          end;

          DPReal.DataSet := IBQReal;
          CDReal.ProviderName := 'DPReal';
          CDReal.Open;

          CDReal1.ProviderName := 'DPReal';
          CDReal1.Open;

          frmPantallaProgreso  := TfrmProgreso.Create(Self);
          frmPantallaProgreso.Min := 0;
          frmPantallaProgreso.Max := CDReal.RecordCount;
          frmPantallaProgreso.Titulo := 'Aplicando Descuento de Garant?as Reales';
          frmPantallaProgreso.Position := 0;
          frmPantallaProgreso.Ejecutar;

          while not CDReal.Eof  do begin
              frmPantallaProgreso.Position := CDReal.RecNo;
              frmPantallaProgreso.InfoLabel := CDReal.FieldByName('ID_PERSONA').AsString + '-' + CDReal.FieldByName('ID_COLOCACION').AsString;
              Application.ProcessMessages;

              if CDReal.FieldByName('TIPOC_INTERES').AsString = 'A' then
                MoraCredito := CDReal.FieldByName('MOROSIDAD').AsInteger + CDReal.FieldByName('AMORTIZA_INTERES').AsInteger
              else
                MoraCredito := CDReal.FieldByName('MOROSIDAD').AsInteger;

              IBSQL9.Close;
              IBSQL9.SQL.Clear;
              IBSQL9.SQL.Add('SELECT VALOR_MINIMO FROM "gen$minimos" WHERE ID_MINIMO = :MINIMO');              
              if (MoraCredito <= 540) then
                IBSQL9.ParamByName('MINIMO').AsInteger := 50
              else if ((MoraCredito > 540) and (MoraCredito <= 720)) then
                IBSQL9.ParamByName('MINIMO').AsInteger := 52
              else if ((MoraCredito >= 720) and (MoraCredito <= 900)) then
                IBSQL9.ParamByName('MINIMO').AsInteger := 53
              else if ((MoraCredito >= 900) and (MoraCredito <= 1080)) then
                IBSQL9.ParamByName('MINIMO').AsInteger := 54
              else if (MoraCredito > 1080) then
                IBSQL9.ParamByName('MINIMO').AsInteger := 55;

              IBSQL9.ExecQuery;
              PorcGarantia := IBSQL9.FieldByName('VALOR_MINIMO').AsFloat;

              TipoId := CDReal.FieldByName('ID_IDENTIFICACION').AsInteger;
              Persona := CDReal.FieldByName('ID_PERSONA').AsString;
              SaldoCapital := 0;
              SaldoGarantia := 0;

              CDReal1.Filtered := False;
              CDReal1.Filter := 'ID_PERSONA = ' + '''' + Persona + '''' + ' and id_identificacion = ' + IntToStr(TipoId);
              CDReal1.Filtered := True;
              while not CDReal1.Eof do begin
                SaldoCapital := CDReal1.FieldByName('DEUDA').AsCurrency - CDReal1.FieldByName('GARANTIA_DESCONTADA').AsCurrency;
                SaldoGarantia := SaldoGarantia + SimpleRoundTo((CDReal1.FieldByName('VALOR_GARANTIA').AsCurrency * PorcGarantia),0);
                if SaldoCapital < SaldoGarantia then
                 begin
                   CDReal1.Edit;
                   CDReal1.FieldValues['GARANTIA_DESCONTADA'] := SaldoCapital;
                   CDReal1.Post;
                   SaldoGarantia := SaldoGarantia - SaldoCapital;
                   SaldoCapital := 0;
                 end
                else if SaldoCapital > SaldoGarantia then
                 begin
                   CDReal1.Edit;
                   CDReal1.FieldValues['GARANTIA_DESCONTADA'] := SaldoGarantia;
                   CDReal1.Post;
                   SaldoCapital := SaldoCapital - SaldoGarantia;
                   SaldoGarantia := 0;
                 end
                else if SaldoCapital = SaldoGarantia then
                 begin
                   CDReal1.Edit;
                   CDReal1.FieldValues['GARANTIA_DESCONTADA'] := SaldoGarantia;
                   CDReal1.Post;
                   SaldoGarantia := 0;
                   SaldoCapital := 0;
                 end;
                CDReal1.Next;
              end;  //fin de while filtrado por persona
              CDReal1.Filtered := False;
            CDReal.Next;

                //Buscar Fianzas
                if SaldoGarantia > 0 then
                 begin
                   IBSQL9.Close;
                   IBSQL9.SQL.Clear;
                   IBSQL9.SQL.Add('SELECT "col$colgarantias".ID_AGENCIA,');
                   IBSQL9.SQL.Add('"col$colgarantias".ID_COLOCACION,"col$colgarantiasreal".CUENTAS_DE_ORDEN,');
                   IBSQL9.SQL.Add('"col$causaciondiariatmp".ID_ARRASTRE,"col$causaciondiariatmp".DEUDA,');
                   IBSQL9.SQL.Add('"col$causaciondiariatmp".CAUSADOS,"col$causaciondiariatmp".PCAPITAL,');
                   IBSQL9.SQL.Add('"col$causaciondiariatmp".PINTERES,"col$causaciondiariatmp".PCOSTAS,');
                   IBSQL9.SQL.Add('"col$causaciondiariatmp".PCAPITAL_REC,"col$causaciondiariatmp".PINTERES_REC,');
                   IBSQL9.SQL.Add('"col$causaciondiariatmp".PCOSTAS_REC,"col$causaciondiariatmp".PCAPITAL_REV,');
                   IBSQL9.SQL.Add('"col$causaciondiariatmp".PINTERES_REV,"col$causaciondiariatmp".PCAPITAL_GAS,');
                   IBSQL9.SQL.Add('"col$causaciondiariatmp".PCOSTAS_REV,"col$causaciondiariatmp".PINTERES_GAS,');
                   IBSQL9.SQL.Add('"col$causaciondiariatmp".PCOSTAS_GAS,"col$causaciondiariatmp".VALOR_GARANTIA,');
                   IBSQL9.SQL.Add('"col$causaciondiariatmp".GARANTIA_DESCONTADA FROM "col$colgarantias"');
                   IBSQL9.SQL.Add('INNER JOIN "col$colgarantiasreal" ON ("col$colgarantias".ID_AGENCIA = "col$colgarantiasreal".ID_AGENCIA)');
                   IBSQL9.SQL.Add('AND ("col$colgarantias".ID_COLOCACION = "col$colgarantiasreal".ID_COLOCACION)');
                   IBSQL9.SQL.Add('INNER JOIN "col$causaciondiariatmp" ON ("col$colgarantias".ID_AGENCIA = "col$causaciondiariatmp".ID_AGENCIA)');
                   IBSQL9.SQL.Add('AND ("col$colgarantias".ID_COLOCACION = "col$causaciondiariatmp".ID_COLOCACION)');
                   IBSQL9.SQL.Add('WHERE "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION AND');
                   IBSQL9.SQL.Add('"col$colgarantias".ID_PERSONA = :ID_PERSONA AND "col$colgarantiasreal".ES_HIPOTECA = 1');
                   IBSQL9.ParamByName('ID_IDENTIFICACION').AsInteger := TIPOID;
                   IBSQL9.ParamByName('ID_PERSONA').AsString := Persona;
                   try
                    Open;
                   except
                    MessageDlg('Error al Buscar Fianzas para Aplicar Descuento de Garant?a',mtError,[mbcancel],0);
                    Transaction.Rollback;
                    raise;
                    Exit;
                   end;

                   while not IBSQL9.Eof do begin
                     SaldoCapital := IBSQL9.FieldByName('DEUDA').AsCurrency - IBSQL9.FieldByName('GARANTIA_DESCONTADA').AsCurrency;
                     SaldoGarantia := SaldoGarantia + SimpleRoundTo((IBSQL9.FieldByName('VALOR_GARANTIA').AsCurrency * PorcGarantia),0);
                     if SaldoCapital < SaldoGarantia then
                      begin
                        CDReal1.Filtered := False;
                        CDReal1.Filter := 'ID_COLOCACION = ' + '''' + IBSQL9.FieldByName('ID_COLOCACION').AsString + '''' + ' and ID_AGENCIA = ' + IntToStr(IBSQL9.FieldByName('ID_AGENCIA').AsInteger);
                        CDReal1.Filtered := True;
                        CDReal1.Edit;
                        CDReal1.FieldValues['GARANTIA_DESCONTADA'] := SaldoCapital;
                        CDReal1.Post;
                        SaldoGarantia := SaldoGarantia - SaldoCapital;
                        SaldoCapital := 0;
                      end
                     else if SaldoCapital > SaldoGarantia then
                      begin
                        CDReal1.Filtered := False;
                        CDReal1.Filter := 'ID_COLOCACION = ' + '''' + IBSQL9.FieldByName('ID_COLOCACION').AsString + '''' + ' and ID_AGENCIA = ' + IntToStr(IBSQL9.FieldByName('ID_AGENCIA').AsInteger);
                        CDReal1.Filtered := True;
                        CDReal1.Edit;
                        CDReal1.FieldValues['GARANTIA_DESCONTADA'] := SaldoGarantia;
                        CDReal1.Post;
                        SaldoGarantia := SaldoGarantia - SaldoCapital;
                        SaldoCapital := SaldoCapital - SaldoGarantia;
                      end
                     else if SaldoCapital = SaldoGarantia then
                      begin
                        CDReal1.Filtered := False;
                        CDReal1.Filter := 'ID_COLOCACION = ' + '''' + IBSQL9.FieldByName('ID_COLOCACION').AsString + '''' + ' and ID_AGENCIA = ' + IntToStr(IBSQL9.FieldByName('ID_AGENCIA').AsInteger);
                        CDReal1.Filtered := True;
                        CDReal1.Edit;
                        CDReal1.FieldValues['GARANTIA_DESCONTADA'] := SaldoGarantia;
                        CDReal1.Post;
                        SaldoGarantia := 0;
                        SaldoCapital := 0;
                      end;
                     IBSQL9.Next;
                   end; //Fin While Fianzas
                 end;  //fin SaldoGarantia > 0

          end; // while
          frmPantallaProgreso.Cerrar;
          IBQReal.Close;

          //Actualizar Tabla Temporal con Datos de Descuento Garantias
          frmPantallaProgreso  := TfrmProgreso.Create(Self);
          frmPantallaProgreso.Min := 0;
          frmPantallaProgreso.Max := CDReal.RecordCount;
          frmPantallaProgreso.Titulo := 'Actualizando Garant?as Reales';
          frmPantallaProgreso.Position := 0;
          frmPantallaProgreso.Ejecutar;

          CDReal1.Filtered := False;
          CDReal1.Last;
          CDReal1.First;
          while not CDReal1.Eof do
           begin
             frmPantallaProgreso.Position := CDReal1.RecNo;
             frmPantallaProgreso.InfoLabel := CDReal1.FieldByName('ID_PERSONA').AsString + '-' + CDReal1.FieldByName('ID_COLOCACION').AsString;
             Application.ProcessMessages;
             IBQRealAct.SQL.Clear;
             IBQRealAct.SQL.Add('UPDATE "col$causaciondiariatmp" set VALOR_GARANTIA = :VALOR_GARANTIA, GARANTIA_DESCONTADA = :GARANTIA_DESCONTADA');
             IBQRealAct.SQL.Add ('WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
             IBQRealAct.ParamByName('ID_AGENCIA').AsInteger := CDReal1.FieldByName('ID_AGENCIA').AsInteger;
             IBQRealAct.ParamByName('ID_COLOCACION').AsString := CDReal1.FieldByName('ID_COLOCACION').AsString;
             IBQRealAct.ParamByName('VALOR_GARANTIA').AsCurrency := CDReal1.FieldByName('VALOR_GARANTIA').AsCurrency;
             IBQRealAct.ParamByName('GARANTIA_DESCONTADA').AsCurrency := CDReal1.FieldByName('GARANTIA_DESCONTADA').AsCurrency;
             IBQRealAct.ExecSQL;
             CDReal1.Next;
           end;
          IBQRealAct.Transaction.Commit;
          frmPantallaProgreso.Close;
          end; //Fin de With inicial

end;

procedure TfrmCausacionCarteraDiariaAuto.GarantiasReales;
var
    Capital,Interes,PCostas:Currency;
    edad_ant:string;
    SaldoGarantia,SaldoCapital,NuevaDeuda:Currency;
    PorcGarantia:Double;
    MoraCredito:Integer;
begin
          with IBQReal do begin
           if Transaction.InTransaction then
               Transaction.Rollback;
           Transaction.StartTransaction;

          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$datogarantia".MATRICULA,');
          SQL.Add('"col$datogarantia".CUENTAS_DE_ORDEN');
          SQL.Add('FROM  "col$datogarantia"');
          SQL.Add('WHERE "col$datogarantia".ESTADO = 0 AND CUENTAS_DE_ORDEN > 0');
          SQL.Add('ORDER BY MATRICULA ASC');
          try
           Open;
          except
           MessageDlg('Error al Seleccionar las Garantias Reales',mtError,[mbcancel],0);
           Transaction.Rollback;
           raise;
           Exit;
          end;

          DPReal.DataSet := IBQReal;
          CDReal.ProviderName := 'DPReal';
          CDReal.Open;

          frmPantallaProgreso  := TfrmProgreso.Create(Self);
          frmPantallaProgreso.Min := 0;
          frmPantallaProgreso.Max := CDReal.RecordCount;
          frmPantallaProgreso.Titulo := 'Aplicando Descuento de Garantias Reales';
          frmPantallaProgreso.Position := 0;
          frmPantallaProgreso.Ejecutar;

          SaldoGarantia := 0;
          while not CDReal.Eof  do begin
              SaldoGarantia := CDReal.FieldByName('CUENTAS_DE_ORDEN').AsCurrency;

              IBSQL10.Close;
              IBSQL10.SQL.Clear; 
              IBSQL10.SQL.Add('SELECT');
              IBSQL10.SQL.Add('"col$garantiacol".ID_AGENCIA,');
              IBSQL10.SQL.Add('"col$garantiacol".ID_COLOCACION,');
              IBSQL10.SQL.Add('"col$garantiacol".TIPO_RESPALDO,');
              IBSQL10.SQL.Add('"col$causaciondiariatmp".DEUDA,');
              IBSQL10.SQL.Add('"col$causaciondiariatmp".TIPOC_INTERES,');
              IBSQL10.SQL.Add('"col$causaciondiariatmp".AMORTIZA_INTERES,');
              IBSQL10.SQL.Add('"col$causaciondiariatmp".MOROSIDAD,');
              IBSQL10.SQL.Add('"col$causaciondiariatmp".GARANTIA_DESCONTADA');
              IBSQL10.SQL.Add('FROM');
              IBSQL10.SQL.Add('"col$garantiacol"');
              IBSQL10.SQL.Add('INNER JOIN "col$causaciondiariatmp" ON ("col$garantiacol".ID_AGENCIA = "col$causaciondiariatmp".ID_AGENCIA)');
              IBSQL10.SQL.Add('AND ("col$garantiacol".ID_COLOCACION = "col$causaciondiariatmp".ID_COLOCACION)');
              IBSQL10.SQL.Add('WHERE');
              IBSQL10.SQL.Add('"col$causaciondiariatmp".FECHA_CORTE = :FECHA_CORTE AND');
              IBSQL10.SQL.Add('"col$causaciondiariatmp".ID_GARANTIA = 1 AND');
              IBSQL10.SQL.Add('"col$causaciondiariatmp".ID_ARRASTRE IN (' + QuotedStr('B') + ',' + QuotedStr('C') + ',' + QuotedStr('D') + ',' + QuotedStr('E') + ') AND');
              IBSQL10.SQL.Add('"col$garantiacol".MATRICULA = :MATRICULA');
              IBSQL10.SQL.Add('ORDER BY "col$garantiacol".TIPO_RESPALDO ASC, "col$garantiacol".ID_COLOCACION ASC');
              IBSQL10.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
              IBSQL10.ParamByName('MATRICULA').AsString := CDReal.FieldByName('MATRICULA').AsString;
              IBSQL10.ExecQuery;

              while not IBSQL10.Eof do begin
                frmPantallaProgreso.Position := CDReal.RecNo;
                frmPantallaProgreso.InfoLabel := CDReal.FieldByName('MATRICULA').AsString;
                Application.ProcessMessages;

                if IBSQL10.FieldByName('TIPOC_INTERES').AsString = 'A' then
                  MoraCredito := IBSQL10.FieldByName('MOROSIDAD').AsInteger + IBSQL10.FieldByName('AMORTIZA_INTERES').AsInteger
                else
                  MoraCredito := IBSQL10.FieldByName('MOROSIDAD').AsInteger;

                IBSQL9.Close;
                IBSQL9.SQL.Clear;
                IBSQL9.SQL.Add('SELECT VALOR_MINIMO FROM "gen$minimos" WHERE ID_MINIMO = :MINIMO');
                if (MoraCredito <= 540) then
                  IBSQL9.ParamByName('MINIMO').AsInteger := 50
                else if ((MoraCredito > 540) and (MoraCredito <= 720)) then
                  IBSQL9.ParamByName('MINIMO').AsInteger := 52
                else if ((MoraCredito >= 720) and (MoraCredito <= 900)) then
                  IBSQL9.ParamByName('MINIMO').AsInteger := 53
                else if ((MoraCredito >= 900) and (MoraCredito <= 1080)) then
                  IBSQL9.ParamByName('MINIMO').AsInteger := 54
                else if (MoraCredito > 1080) then
                  IBSQL9.ParamByName('MINIMO').AsInteger := 55;
                IBSQL9.ExecQuery;

                PorcGarantia := IBSQL9.FieldByName('VALOR_MINIMO').AsFloat;

                SaldoGarantia := SimpleRoundTo((SaldoGarantia * PorcGarantia),0);
                SaldoCapital := IBSQL10.FieldByName('DEUDA').AsCurrency;

                if SaldoCapital < SaldoGarantia then
                  begin
                    IBQRealAct.SQL.Clear;
                    IBQRealAct.SQL.Add('UPDATE "col$causaciondiariatmp" set VALOR_GARANTIA = VALOR_GARANTIA + :VALOR_GARANTIA, GARANTIA_DESCONTADA = GARANTIA_DESCONTADA + :GARANTIA_DESCONTADA');
                    IBQRealAct.SQL.Add ('WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
                    IBQRealAct.ParamByName('ID_AGENCIA').AsInteger := IBSQL10.FieldByName('ID_AGENCIA').AsInteger;
                    IBQRealAct.ParamByName('ID_COLOCACION').AsString := IBSQL10.FieldByName('ID_COLOCACION').AsString;
                    IBQRealAct.ParamByName('VALOR_GARANTIA').AsCurrency := SaldoGarantia;
                    IBQRealAct.ParamByName('GARANTIA_DESCONTADA').AsCurrency := SaldoCapital;
                    IBQRealAct.ExecSQL;

                    SaldoGarantia := SaldoGarantia - SaldoCapital;
                    SaldoCapital := 0;
                  end
                 else if SaldoCapital > SaldoGarantia then
                  begin
                    IBQRealAct.SQL.Clear;
                    IBQRealAct.SQL.Add('UPDATE "col$causaciondiariatmp" set VALOR_GARANTIA = VALOR_GARANTIA + :VALOR_GARANTIA, GARANTIA_DESCONTADA = GARANTIA_DESCONTADA + :GARANTIA_DESCONTADA');
                    IBQRealAct.SQL.Add ('WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
                    IBQRealAct.ParamByName('ID_AGENCIA').AsInteger := IBSQL10.FieldByName('ID_AGENCIA').AsInteger;
                    IBQRealAct.ParamByName('ID_COLOCACION').AsString := IBSQL10.FieldByName('ID_COLOCACION').AsString;
                    IBQRealAct.ParamByName('VALOR_GARANTIA').AsCurrency := SaldoGarantia;
                    IBQRealAct.ParamByName('GARANTIA_DESCONTADA').AsCurrency := SaldoGarantia;
                    IBQRealAct.ExecSQL;

                    SaldoGarantia := 0;
                    SaldoCapital := SaldoCapital - SaldoGarantia;
                  end
                 else if SaldoCapital = SaldoGarantia then
                  begin
                    IBQRealAct.SQL.Clear;
                    IBQRealAct.SQL.Add('UPDATE "col$causaciondiariatmp" set VALOR_GARANTIA = VALOR_GARANTIA + :VALOR_GARANTIA, GARANTIA_DESCONTADA = GARANTIA_DESCONTADA + :GARANTIA_DESCONTADA');
                    IBQRealAct.SQL.Add ('WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
                    IBQRealAct.ParamByName('ID_AGENCIA').AsInteger := IBSQL10.FieldByName('ID_AGENCIA').AsInteger;
                    IBQRealAct.ParamByName('ID_COLOCACION').AsString := IBSQL10.FieldByName('ID_COLOCACION').AsString;
                    IBQRealAct.ParamByName('VALOR_GARANTIA').AsCurrency := SaldoGarantia;
                    IBQRealAct.ParamByName('GARANTIA_DESCONTADA').AsCurrency := SaldoGarantia;
                    IBQRealAct.ExecSQL;

                    SaldoGarantia := 0;
                    SaldoCapital := 0;
                  end;
                  IBSQL10.Next;
                end; // Fin While IBSQL10
             CDReal.Next;
            end; // Fin de While CDReal

          IBQRealAct.Transaction.Commit;
          frmPantallaProgreso.Close;
          end; //Fin de With inicial
end;

procedure TfrmCausacionCarteraDiariaAuto.CalculoProvision;
var
    Deuda:Currency;
    PCapDiaAnt,PIntDiaAnt,PCosDiaAnt:Currency;
    PCapAcum,PIntAcum,PCosAcum:Currency;
    FechaAnterior,FechaAnoAnterior : TDate;
    MovCapital,RecCapital,RevGCapital,GCapital:Currency;
    MovInteres,RecInteres,RevGInteres,GInteres:Currency;
    MovCostas,RecCostas,RevGCostas,GCostas:Currency;
    _iDiasMora,_iIdEstadoCol :Integer;
begin
          with IBQuery1 do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
           Transaction.StartTransaction;

          //Inicio Proceso para llenar la Temporal de Movimientos
          IBSQL6.Close;
          IBSQL6.SQL.Clear;
          IBSQL6.SQL.Add('SELECT first 1 FECHA from "col$causacionescontrol" order by FECHA DESC');
          IBSQL6.ExecQuery;
          FechaAnterior := IBSQL6.FieldByName('FECHA').AsDate;
          IBSQL6.Close;

          IBSQL6.SQL.Clear;
          IBSQL6.SQL.Add('insert into "col$causaciondiariamovtmp" select * from "col$causaciondiariamov"');
          IBSQL6.SQL.Add('where (PCAPITAL_ANUAL>0) or (PINTERES_ANUAL>0) or (PCOSTAS_ANUAL>0) or (PCAPITAL_ACT>0) or (PINTERES_ACT>0) or (PCOSTAS_ACT>0)');
          IBSQL6.ExecQuery;
          IBSQL6.Transaction.Commit;
          IBSQL6.Transaction.StartTransaction;
          //fin de Temporal Movimientos

          Close;
          SQL.Clear;
          SQL.Add('select count(*) as TOTAL from "col$causaciondiariatmp" where FECHA_CORTE = :FECHA_CORTE AND DEUDA > 0');
          ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
          Open;
          Total := FieldByName('TOTAL').AsInteger;

          frmPantallaProgreso  := TfrmProgreso.Create(Self);
          frmPantallaProgreso.Min := 0;
          frmPantallaProgreso.Max := Total;
          frmPantallaProgreso.Titulo := 'Calculando Provisión...';
          frmPantallaProgreso.Position := 0;
          frmPantallaProgreso.Ejecutar;

          Close;
          SQL.Clear;
          SQL.Add('select * from "col$causaciondiariatmp" WHERE DEUDA > 0 order by ID_IDENTIFICACION,ID_PERSONA,ID_EDAD_ACT DESC,ID_AGENCIA,ID_COLOCACION');
          try
           Open;
           frmPantallaProgreso.Titulo := 'Calculando Provisión ...'+'- Leyendo Colocaciones';
          except
           MessageDlg('Error al Iniciar la Tabla Temporal para el Segundo proceso',mtError,[mbcancel],0);
           Transaction.Rollback;
           raise;
           Exit;
          end;
//          end;

          while not IBQuery1.Eof  do begin
              frmPantallaProgreso.Position := IBQuery1.RecNo;
              frmPantallaProgreso.InfoLabel := IBQuery1.FieldByName('ID_PERSONA').AsString + '-' + IBQuery1.FieldByName('ID_COLOCACION').AsString;
              Application.ProcessMessages;


           Capital := 0;
           Interes := 0;
           PCostas := 0;
           PCapAcum := 0;
           PIntAcum := 0;
           PCosAcum := 0;
           MovCapital := 0;
           MovInteres := 0;
           MovCostas := 0;
           RecCapital := 0;
           RecInteres := 0;
           RecCostas := 0;
           PCapDiaAnt := 0;
           PIntDiaAnt := 0;
           PCosDiaAnt := 0;
           RevGInteres := 0;
           RevGCapital := 0;
           RevGCostas := 0;
           GCapital := 0;
           GInteres := 0;
           GCostas := 0;

           with IBSQL3 do begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT A_CAPITAL,A_INTERESES,A_COSTAS from "col$porccausacion" where');
            SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ID_GARANTIA = :ID_GARANTIA and');
            SQL.Add('ID_EDAD = :ID_EDAD');
            ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
            ParamByName('ID_GARANTIA').AsInteger := IBQuery1.fieldbyname('ID_GARANTIA').AsInteger;
            ParamByName('ID_EDAD').AsString := IBQuery1.FieldByName('ID_ARRASTRE').AsString;
            try
             ExecQuery;
             frmPantallaProgreso.Titulo := 'Calculando Provisión ...'+'- Leyendo Porcentajes Provisión';
            except
             MessageDlg('Error al Buscar Datos Para Aplicar Provisión',mtError,[mbcancel],0);
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end; // try

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Calc Capital';
            if (IBQuery1.FieldByName('ID_ESTADO').AsInteger = 2) then
               Capital := SimpleRoundTo((IBQuery1.FieldByName('DEUDA').AsCurrency) * (FieldByName('A_CAPITAL').AsFloat / 100),0)
            else
               Capital := SimpleRoundTo((IBQuery1.FieldByName('DEUDA').AsCurrency - IBQuery1.FieldByName('GARANTIA_DESCONTADA').AsCurrency) * (FieldByName('A_CAPITAL').AsFloat / 100),0);
            if Capital < 0 then Capital := 0;
            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Calc Interes';
            Interes := SimpleRoundTo(IBQuery1.FieldByName('CAUSADOS').AsCurrency * (FieldByName('A_INTERESES').AsFloat / 100),0);
            frmPantallaProgreso.Titulo := 'Calculando Provisi?n ...'+'- Calc Costas';
            PCostas := SimpleRoundTo(IBQuery1.FieldByName('COSTAS').AsCurrency * (FieldByName('A_COSTAS').AsFloat / 100),0);
            // Valida estado
            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Validando Mora';
            if IBQuery1.FieldByName('ID_ESTADO').AsInteger = 2 then
               _iDiasMora := IBQuery1.FieldByName('MOROSIDAD').AsInteger
            else
               _iDiasMora := IBQuery1.FieldByName('DIAS').AsInteger;
            /// validar requerimiento
            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Validando Calificacion';

            if (IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger = 2) and (IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'E') and (_iDiasMora <= 360) then
            begin
            //  Capital := SimpleRoundTo((Capital/2),0);
            end;
            // fin validacion de provision

           end; // with

           frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Causacion Anterior';
           IBSQL6.Close;
           IBSQL6.SQL.Clear;
           IBSQL6.SQL.Add('select PCAPITAL, PINTERES, PCOSTAS from "col$causaciondiaria"');
           IBSQL6.SQL.Add('where ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION AND FECHA_CORTE = :FECHA_CORTE');
           IBSQL6.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
           IBSQL6.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
           IBSQL6.ParamByName('FECHA_CORTE').AsDate := FechaAnterior;
           IBSQL6.ExecQuery;
           PCapAcum := IBSQL6.FieldByName('PCAPITAL').AsCurrency;
           PIntAcum := IBSQL6.FieldByName('PINTERES').AsCurrency;
           PCosAcum := IBSQL6.FieldByName('PCOSTAS').AsCurrency;
           IBSQL6.Close;

           frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Causa Mov Tmp';
           IBSQL6.SQL.Clear;
           IBSQL6.SQL.Add('select * from "col$causaciondiariamovtmp" where ID_AGENCIA = :ID_AGENCIA  AND ID_COLOCACION = :ID_COLOCACION');
           IBSQL6.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
           IBSQL6.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
           IBSQL6.ExecQuery;

           frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Capital Vs PCapAcum';
           if Capital < PCapAcum then
            begin
              MovCapital := PCapAcum - Capital;
              if IBSQL6.FieldByName('PCAPITAL_ANUAL').AsCurrency > 0 then
                if IBSQL6.FieldByName('PCAPITAL_ANUAL').AsCurrency > MovCapital then
                  RecCapital := MovCapital
                else begin
                  RevGCapital := MovCapital - IBSQL6.FieldByName('PCAPITAL_ANUAL').AsCurrency;
                  RecCapital := IBSQL6.FieldByName('PCAPITAL_ANUAL').AsCurrency;
                end
              else
                RevGCapital := MovCapital;
            end
           else
            begin
              MovCapital := Capital - PCapAcum;
              GCapital := MovCapital;
            end;

           frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Interes Vs PIntAcum';
           if Interes < PIntAcum then
            begin
              MovInteres := PIntAcum - Interes;
              if IBSQL6.FieldByName('PINTERES_ANUAL').AsCurrency > 0 then
                if IBSQL6.FieldByName('PINTERES_ANUAL').AsCurrency > MovInteres then
                  RecInteres := MovInteres
                else begin
                  RevGInteres := MovInteres - IBSQL6.FieldByName('PINTERES_ANUAL').AsCurrency;
                  RecInteres := IBSQL6.FieldByName('PINTERES_ANUAL').AsCurrency;
                end
              else
                RevGInteres := MovInteres;
            end
           else
            begin
              MovInteres := Interes  - PIntAcum;
              GInteres := MovInteres;
            end;

           frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Costas Vs PCosAcum';
           if PCostas < PCosAcum then
             begin
               MovCostas := PCosAcum - PCostas;
               if IBSQL6.FieldByName('PCOSTAS_ANUAL').AsCurrency > 0 then
                 if IBSQL6.FieldByName('PCOSTAS_ANUAL').AsCurrency > MovCostas then
                   RecCostas := MovCostas
                 else begin
                   RevGCostas := MovCostas - IBSQL6.FieldByName('PCOSTAS_ANUAL').AsCurrency;
                   RecCostas := IBSQL6.FieldByName('PCOSTAS_ANUAL').AsCurrency;
                 end
               else
                 RevGCostas := MovCostas;
             end
            else
             begin
               MovCostas := PCostas - PCosAcum;
               GCostas := MovCostas;
             end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update Capital';
            if RecCapital > 0 then begin
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('update "col$causaciondiariamovtmp" set PCAPITAL_ANUAL = PCAPITAL_ANUAL - :REC');
              IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSQL3.ParamByName('REC').AsCurrency := RecCapital;
              IBSQL3.ExecQuery;
              IBSQL3.Close;
            end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update Interes';
            if RecInteres > 0  then begin
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('update "col$causaciondiariamovtmp" set PINTERES_ANUAL = PINTERES_ANUAL - :REC');
              IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSQL3.ParamByName('REC').AsCurrency := RecInteres;
              IBSQL3.ExecQuery;
              IBSQL3.Close;
            end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update Costas';
            if RecCostas > 0  then begin
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('update "col$causaciondiariamovtmp" set PCOSTAS_ANUAL = PCOSTAS_ANUAL - :REC');
              IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSQL3.ParamByName('REC').AsCurrency := RecCostas;
              IBSQL3.ExecQuery;
              IBSQL3.Close;
            end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update RevCapital';
            if RevGCapital > 0  then begin
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('update "col$causaciondiariamovtmp" set PCAPITAL_ACT = PCAPITAL_ACT - :REC');
              IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSQL3.ParamByName('REC').AsCurrency := RevGCapital;
              IBSQL3.ExecQuery;
              IBSQL3.Close;
            end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update RevInteres';
            if RevGInteres > 0  then begin
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('update "col$causaciondiariamovtmp" set PINTERES_ACT = PINTERES_ACT - :REC');
              IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSQL3.ParamByName('REC').AsCurrency := RevGInteres;
              IBSQL3.ExecQuery;
              IBSQL3.Close;
            end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update RevCostas';
            if RevGCostas > 0  then begin
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('update "col$causaciondiariamovtmp" set PCOSTAS_ACT = PCOSTAS_ACT - :REC');
              IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSQL3.ParamByName('REC').AsCurrency := RevGCostas;
              IBSQL3.ExecQuery;
              IBSQL3.Close;
            end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update GCapital';
            if GCapital > 0  then begin
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('update "col$causaciondiariamovtmp" set PCAPITAL_ACT = PCAPITAL_ACT + :GASTO');
              IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSQL3.ParamByName('GASTO').AsCurrency := GCapital;
              IBSQL3.ExecQuery;
              if IBSQL3.RowsAffected <= 0 then begin
                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('insert into "col$causaciondiariamovtmp" (ID_AGENCIA,ID_COLOCACION,PCAPITAL_ACT)');
                IBSQL3.SQL.Add('values (:ID_AGENCIA,:ID_COLOCACION,:PCAPITAL_ACT)');
                IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                IBSQL3.ParamByName('PCAPITAL_ACT').AsCurrency := GCapital;
              end;
              IBSQL3.Close;
            end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update GInteres';
            if GInteres > 0  then begin
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('update "col$causaciondiariamovtmp" set PINTERES_ACT = PINTERES_ACT + :GASTO');
              IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSQL3.ParamByName('GASTO').AsCurrency := GInteres;
              IBSQL3.ExecQuery;
              if IBSQL3.RowsAffected <= 0 then begin
                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('insert into "col$causaciondiariamovtmp" (ID_AGENCIA,ID_COLOCACION,PINTERES_ACT)');
                IBSQL3.SQL.Add('values (:ID_AGENCIA,:ID_COLOCACION,:PINTERES_ACT)');
                IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                IBSQL3.ParamByName('PINTERES_ACT').AsCurrency := GInteres;
              end;
              IBSQL3.Close;
            end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update GCostas';
            if GCostas > 0  then begin
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('update "col$causaciondiariamovtmp" set PCOSTAS_ACT = PCOSTAS_ACT + :GASTO');
              IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              IBSQL3.ParamByName('GASTO').AsCurrency := GCostas;
              IBSQL3.ExecQuery;
              if IBSQL3.RowsAffected <= 0 then begin
                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('insert into "col$causaciondiariamovtmp" (ID_AGENCIA,ID_COLOCACION,PCOSTAS_ACT)');
                IBSQL3.SQL.Add('values (:ID_AGENCIA,:ID_COLOCACION,:PCOSTAS_ACT)');
                IBSQL3.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                IBSQL3.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                IBSQL3.ParamByName('PCOSTAS_ACT').AsCurrency := GCostas;
              end;
              IBSQL3.Close;
            end;

            frmPantallaProgreso.Titulo := 'Calculando Provision ...'+'- Update Provision';
           // Actualizar Provision
           {
            try
                //Writeln(PChar('Capital:'+CurrToStr(Capital)));
            except
                Capital := 0;
            end;

             try
                //WriteLn(PChar('Interes:'+CurrToStr(Interes)));
            except
                Interes := 0;
            end;

            try
                //WriteLn(PChar('PCostas:'+CurrToStr(PCostas)));
            except
                PCostas := 0;
            end;

            try
                //WriteLn(PChar('RecCapital:'+CurrToStr(RecCapital)));
            except
                RecCapital := 0;
            end;

            try
                //WriteLn(PChar('RecInteres:'+CurrToStr(RecInteres)));
            except
                RecInteres := 0;
            end;

            try
                //WriteLn(PChar('RecCostas:'+CurrToStr(RecCostas)));
            except
                RecCostas := 0;
            end;

            try
               //WriteLn(PChar('RevGCapital:'+CurrToStr(RevGCapital)));
            except
                RevGCapital := 0;
            end;

            try
               //WriteLn(PChar('RevGInteres:'+CurrToStr(RevGInteres)));
            except
                RevGInteres := 0;
            end;

            try
               //WriteLn(PChar('RevGCostas:'+CurrToStr(RevGCostas)));
            except
                RevGCostas := 0;
            end;

            try
               //WriteLn(PChar('GCapital:'+CurrToStr(GCapital)));
            except
                GCapital := 0;
            end;

            try
               //WriteLn(PChar('GInteres:'+CurrToStr(GInteres)));
            except
                GInteres := 0;
            end;

            try
              //WriteLn(PChar('GCostas:'+CurrToStr(GCostas)));
            except
                GCostas := 0;
            end;
            }
            with IBSQL3 do begin
              Close;
              SQL.Clear;
              SQL.Add('update "col$causaciondiariatmp" SET ');
              SQL.Add('PCAPITAL = :PCAPITAL, PINTERES = :PINTERES, PCOSTAS = :PCOSTAS,');
              SQL.Add('PCAPITAL_REC = :PCAPITAL_REC, PINTERES_REC = :PINTERES_REC, PCOSTAS_REC = :PCOSTAS_REC,');
              SQL.Add('PCAPITAL_REV = :PCAPITAL_REV, PINTERES_REV = :PINTERES_REV, PCOSTAS_REV = :PCOSTAS_REV,');
              SQL.Add('PCAPITAL_GAS = :PCAPITAL_GAS, PINTERES_GAS = :PINTERES_GAS, PCOSTAS_GAS = :PCOSTAS_GAS');
              SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
              ParamByName('ID_AGENCIA').AsInteger := IBQuery1.fieldbyname('ID_AGENCIA').AsInteger;
              ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              ParamByName('PCAPITAL').AsCurrency := Capital;
              ParamByName('PINTERES').AsCurrency := Interes;
              ParamByName('PCOSTAS').AsCurrency := PCostas;
              ParamByName('PCAPITAL_REC').AsCurrency := RecCapital;
              ParamByName('PINTERES_REC').AsCurrency := RecInteres;
              ParamByName('PCOSTAS_REC').AsCurrency := RecCostas;
              ParamByName('PCAPITAL_REV').AsCurrency := RevGCapital;
              ParamByName('PINTERES_REV').AsCurrency := RevGInteres;
              ParamByName('PCOSTAS_REV').AsCurrency := RevGCostas;
              ParamByName('PCAPITAL_GAS').AsCurrency := GCapital;
              ParamByName('PINTERES_GAS').AsCurrency := GInteres;
              ParamByName('PCOSTAS_GAS').AsCurrency := GCostas;
              try
               ExecQuery;
              except
               //frmPantallaProgreso.Cerrar;
               //MessageDlg('Error Actualizando Tabla Temporal',mtError,[mbcancel],0);
               //Transaction.Rollback;
               //raise;
               //Exit;
              end;
            end; // with
            IBQuery1.Next;
           end; //fin While Principal
         end; //fin with Principal IBQuery1
         frmPantallaProgreso.Cerrar;
         IBSQL3.Transaction.Commit;
        // MessageDlg('Provision Terminada con Exito!!',mtInformation,[mbok],0);
       // Fin Actualizaci?n
end;

procedure TfrmCausacionCarteraDiariaAuto.Button1Click(Sender: TObject);
var
vFechaGracia:TDate;
DiasMora:Integer;
Dia:Word;
NFecha:TDateTime;
Total:Integer;
begin
        frmPantallaProgreso := TfrmProgreso.Create(Self);
        with IBQuery1 do begin
            if Transaction.InTransaction then Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('select count(*) as TOTAL from "col$causaciondiariatmp"');
            try
             Open;
            except
             Transaction.Rollback;
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;

            Total := FieldByName('TOTAL').AsInteger;

            Close;
            SQL.Clear;
            SQL.Add('select * from "col$causaciondiariatmp"');
            try
             Open;
            except
             Transaction.Rollback;
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;
         end;
            frmPantallaProgreso.Min := 0;
            frmPantallaProgreso.Max := Total;
            frmPantallaProgreso.Position := 0;
            frmPantallaProgreso.InfoLabel := 'Procesando Anticipados Causaci?n de Colocaciones';
            while not IBQuery1.Eof do
            begin
                frmPantallaProgreso.Position := IBQuery1.RecNo;
                Application.ProcessMessages;
                FechaInicial := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                FechaFinal := EdFechaCorte.Date;

                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('select VALOR_MINIMO from "gen$minimos" WHERE ID_MINIMO = 33');
                IBSQL3.ExecQuery;
                vFechaGracia := DateOf(IBSQL3.FieldByName('VALOR_MINIMO').AsInteger);

                if IBQuery1.FieldByName('ID_ESTADO').AsInteger = 2 then
                  Dias := DiasEntreFechas(IncDay(FechaInicial),FechaFinal,IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)
                else
                  begin
                    Dia := DayOf(IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime);
                    if TryEncodeDate(YearOf(FechaInicial),MonthOf(FechaInicial),Dia,NFecha) then
                      FechaInicial := NFecha;
                    Dias := DiasEntreFechas(IncDay(FechaInicial),FechaFinal,IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime);
                  end;

            // Buscar Tasa Anticipada
            if Dias < 0 then begin
               TasaAnt := BuscoTasaAnt(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,IBQuery1.FieldByName('FECHA_INTERES').AsDateTime);
               if TasaAnt = 0 then begin
                 case IBQuery1.FieldByName('ID_INTERES').AsInteger of
                     0 : begin
                           TasaAnt := BuscoTasaEfectivaMaxima1(IBQVarios,EdFechaCorte.Date,IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,'A');
                           if IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat < TasaAnt then
                             TasaAnt := IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                         end;

                     1 : TasaAnt := BuscoTasaEfectivaMaximaDtfNueva(IBQVarios,EdFechaCorte.Date);

                     2 : TasaAnt := BuscoTasaEfectivaMaximaIPCNueva(IBQVarios);
                 end;
                 if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'A' then
                   TasaAnt := TasaNominalAnticipada(TasaAnt,IBQuery1.fieldbyname('AMORTIZA_INTERES').AsInteger)
                 else
                   TasaAnt := TasaNominalVencida(TasaAnt,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
               end;
               // Calculo Intereses
               Anticipados := SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (TasaAnt/100)) / 360 ) * -Dias,0);
               with IBSQL4 do begin
                   Close;
                   SQL.Clear;
                   SQL.Add('update "col$causaciondiariatmp" set DIAS = :DIAS, ANTICIPADOS = :ANTICIPADOS');
                   SQL.Add('WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
                   ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                   ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                   ParamByName('DIAS').AsInteger := Dias;
                   ParamByName('ANTICIPADOS').AsCurrency := Anticipados;
                   try
                    ExecQuery;
                   except
                    MessageDlg('Error al Guardar Datos en la Temporal',mtError,[mbcancel],0);
                    frmProgreso.Cerrar;
                    Transaction.Rollback;
                    raise;
                    Exit;
                   end;
               end;
              end;
            // Fin Buqueda de Tasa Anticipada
            Anticipados := 0;
            // Continuar ciclo while
            IBQuery1.Next;
            end; // while
            IBQuery1.Transaction.Commit;
            IBQuery1.Close;
            // MessageDlg('Proceso Anticipados Terminado con Exito',mtinformation,[mbok],0);

end;

procedure TfrmCausacionCarteraDiariaAuto.BtnCorregirMoraClick(Sender: TObject);
var
vFechaGracia:TDate;
DiasMora:Integer;
Total:Integer;
id_ant:Integer;
pr_ant:string;
Edad,edad_ant:string;
begin
        frmPantallaProgreso := TfrmProgreso.Create(Self);
        with IBQuery1 do begin
            if Transaction.InTransaction then
              Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('select count(*) as TOTAL from "col$causaciondiariatmp"');
            try
             Open;
            except
             Transaction.Rollback;
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;

            Total := FieldByName('TOTAL').AsInteger;

            Close;
            SQL.Clear;
            SQL.Add('select "col$causaciondiariatmp".*, "col$colocacion".ID_LINEA, "col$colocacion".PERIODO_GRACIA, "col$colocacion".DIAS_PAGO from "col$causaciondiariatmp"');
            SQL.Add('INNER JOIN "col$colocacion" on ("col$causaciondiariatmp".id_agencia = "col$colocacion".ID_AGENCIA AND');
            SQL.Add('"col$causaciondiariatmp".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
{            SQL.ADD('AND "col$causaciondiariatmp".FECHA_DESEMBOLSO = :FECHA');
            PARAMBYNAME('FECHA').AsDate := EDFECHACORTE.Date;}
            try
             Open;
            except
             Transaction.Rollback;
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;
         end;

            frmPantallaProgreso.Min := 0;
            frmPantallaProgreso.Max := Total;
            frmPantallaProgreso.Position := 0;
            frmPantallaProgreso.InfoLabel := 'Procesando Correcion de mora Causaci?n de Colocaciones';
            while not IBQuery1.Eof do
            begin
                frmPantallaProgreso.Position := IBQuery1.RecNo;
                Application.ProcessMessages;
                FechaInicial := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                FechaFinal := EdFechaCorte.Date;

                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('select VALOR_MINIMO from "gen$minimos" WHERE ID_MINIMO = 33');
                IBSQL3.ExecQuery;
                vFechaGracia := DateOf(IBSQL3.FieldByName('VALOR_MINIMO').AsInteger);

                Saldo := IBQuery1.FieldByName('DEUDA').AsCurrency;

                DiasMora := ObtenerDiasMora(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,IBSQL2);

//                Dias := DiasEntreFechas(IncDay(FechaInicial),FechaFinal,IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime);
                Dias := DiasEntre(FechaInicial,FechaFinal);

                if IBQuery1.FieldByName('ID_LINEA').AsInteger = 13 then
                  if vFechaGracia > EdFechaCorte.Date then
                  begin
                    Dias := Dias + IBQuery1.FieldByName('PERIODO_GRACIA').AsInteger;
                  end;

                // Evaluar Edad Y Dias de Mora
               if IBQuery1.FieldByName('ID_ESTADO').AsInteger = 2 then
                    DiasMora := DiasEntreFechas(IncDay(IBQuery1.FieldByName('FECHA_CAPITAL').AsDateTime),FechaFinal,IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime + IBQuery1.FieldByName('DIAS_PAGO').AsInteger);


                if DiasMora < 1 then DiasMora := 0;
                Edad := EvaluarEdad(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,
                                IBQuery1.FieldByName('ID_GARANTIA').AsInteger,DiasMora, IBQuery1.FieldByName('ID_COLOCACION').AsString);
                if (IBQuery1.FieldByName('ID_ESTADO').AsInteger = 2) or
                  (IBQuery1.FieldByName('ID_ESTADO').AsInteger = 3) then
                Edad := 'E';


               with IBSQL4 do begin
                   Close;
                   SQL.Clear;
                   SQL.Add('update "col$causaciondiariatmp" set DIAS = :DIAS, MOROSIDAD = :MOROSIDAD, ID_EDAD_ACT = :EDAD');
                   SQL.Add('WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
                   ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                   ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                   ParamByName('DIAS').AsInteger := Dias;
                   ParamByName('MOROSIDAD').AsInteger := DiasMora;
                   ParamByName('EDAD').AsString := Edad;
                   try
                    ExecQuery;
                    Transaction.CommitRetaining;
                   except
                    MessageDlg('Error al Guardar Datos en la Temporal',mtError,[mbcancel],0);
                    frmProgreso.Cerrar;
                    Transaction.Rollback;
                    raise;
                    Exit;
                   end;
               end;
//              end;
            // Continuar ciclo while
            IBQuery1.Next;
            end; // while
            IBQuery1.Transaction.Commit;
            IBQuery1.Close;
            frmPantallaProgreso.Cerrar;
            Application.ProcessMessages;

          //Ley de Arrastre
{
          frmPantallaProgreso  := TfrmProgreso.Create(Self);
          frmPantallaProgreso.Min := 0;
          frmPantallaProgreso.Max := Total;
          frmPantallaProgreso.InfoLabel := 'Aplicando Ley de Arrastre';
          frmPantallaProgreso.Position := 0;
          frmPantallaProgreso.Ejecutar;
          id_ant := 0;
          pr_ant := '';
          with IBQuery1 do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$causaciondiariatmp" order by ID_IDENTIFICACION,ID_PERSONA,ID_EDAD_ACT DESC,ID_AGENCIA,ID_COLOCACION');
           try
            Open;
           except
            frmProgreso.Cerrar;
            MessageDlg('Error al Iniciar la Tabla Temporal para Ley de Arrastre',mtError,[mbcancel],0);
            Transaction.Rollback;
            raise;
            Exit;
           end;
          end;

          id_ant := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
          pr_ant := IBQuery1.FieldByName('ID_PERSONA').AsString;
          edad_ant := IBQuery1.FieldByName('ID_EDAD_ACT').AsString;

          while not IBQuery1.Eof  do begin
              frmPantallaProgreso.Position := IBQuery1.RecNo;
              Application.ProcessMessages;
              if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> id_ant) or
                 (IBQuery1.FieldByName('ID_PERSONA').AsString <> pr_ant) then
              begin
                 id_ant := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                 pr_ant := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 edad_ant := IBQuery1.FieldByName('ID_EDAD_ACT').AsString;
              end;
// Actualizar Edad por Arrastre
                 with IBSQL3 do begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update "col$causaciondiariatmp" SET ID_ARRASTRE = :ID_ARRASTRE');
                    SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
                    ParamByName('ID_AGENCIA').AsInteger := IBQuery1.fieldbyname('ID_AGENCIA').AsInteger;
                    ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                    ParamByName('ID_ARRASTRE').AsString := edad_ant;
                    try
                      ExecQuery;
                      Transaction.CommitRetaining;
                    except
                      frmPantallaProgreso.Cerrar;
                      MessageDlg('Error Actualizando Tabla Temporal',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                    end;
                 end; // with
// Fin Actualizaci?n
          IBQuery1.Next;
          end; // while
          IBQuery1.Transaction.Commit;
          IBQuery1.Close;
          frmPantallaProgreso.Cerrar;
          Application.ProcessMessages;

        GarantiasReales;
        CalculoProvision;
        if RGProceso.ItemIndex = 1 then begin
           TercerPasoCausacion;
           CmdAplicar.Enabled := True;
        end;                     }

          // MessageDlg('Proceso Correci?n de Mora Aplicado con Exito',mtinformation,[mbok],0);
end;

procedure TfrmCausacionCarteraDiariaAuto.verificarCuadre(linea: String);
var I:Integer;
    TotalDebito:Currency;
    TotalCredito:Currency;
    ARecord:PList;
    _nuevadiff: Currency;
begin
      TotalDebito := 0;
      TotalCredito := 0;

      for I := 0 to Lista.Count - 1 do
      begin
        ARecord := Lista.Items[i];
        TotalDebito := TotalDebito + arecord^.debito;
        TotalCredito := TotalCredito + arecord^.credito;
      end;
      _nuevadiff := TotalDebito - TotalCredito;
      if _nuevadiff <> 0 then
      begin

        if (_nuevadiff <> _diferencia) then
        begin
         edCuadre.Lines.Add('Diferencia en: ' + linea);
         _diferencia := _nuevadiff;
        end;
      end;
      Application.ProcessMessages;

end;


procedure TfrmCausacionCarteraDiariaAuto.btnReNotaClick(Sender: TObject);
var I:Integer;
    TotalDebito:Currency;
    TotalCredito:Currency;
    ARecord:PList;
    FechaComp:TDate;
    idauxiliar: Integer;
begin
        try
          Lista := Tlist.Create;
        finally
          Lista.Clear;
        end;

        PrimerPC;   // verificarCuadre('Corto y Largo Plazo');
        SegundoPC;  // verificarCuadre('Ajustar Calificacion');
        TercerPC;   // verificarCuadre('Causacion de Intereses');
        CuartoPC;   // verificarCuadre('Provision de Capital de Colocaciones');
        QuintoPC;   // verificarCuadre('Provision de Interes de Colocaciones y Costas Judiciales');
        SextoPC;    // verificarCuadre('Provision General');
        SeptimoPC;  // verificarCuadre('Traslado de Intereses Anticipados');
        OctavoPC;   // verificarCuadre('Contingencias');
        
      Consecutivo := StrToInt(EdComprobante.Caption);
      FechaComp := EdFechaCorte.Date;

      TotalDebito := 0;
      TotalCredito := 0;

      for I := 0 to Lista.Count - 1 do
      begin
        ARecord := Lista.Items[i];
        TotalDebito := TotalDebito + arecord^.debito;
        TotalCredito := TotalCredito + arecord^.credito;
      end;

      if TotalDebito <> TotalCredito then
      begin
         ShowMessage('El Comprobante está descuadrado...');
      end;

      with IBSQL1 do begin
       if Transaction.InTransaction then
          Transaction.Rollback;
       Transaction.StartTransaction;
         Close;
         sql.Clear;
         sql.Add('UPDATE CON$COMPROBANTE SET ');
         sql.Add('CON$COMPROBANTE."TOTAL_DEBITO" = :TOTAL_DEBITO, CON$COMPROBANTE."TOTAL_CREDITO" = :TOTAL_CREDITO');
         sql.Add('WHERE TIPO_COMPROBANTE = :TIPO_COMPROBANTE and ID_COMPROBANTE = :ID_COMPROBANTE');

         ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
         ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebito;
         ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCredito;
         ExecQuery;

         SQL.Clear;
         SQL.Add('DELETE FROM CON$AUXILIAR WHERE TIPO_COMPROBANTE = :TIPO_COMPROBANTE and ID_COMPROBANTE = :ID_COMPROBANTE');
         ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
         ExecQuery;

         if Lista.Count > 0 then
         for I := 0 to Lista.Count -1 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('insert into CON$AUXILIAR values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
            ARecord := Lista.Items[I];
            ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := FechaComp;
            ParamByName('CODIGO').AsString := Arecord^.codigo;
            ParamByName('DEBITO').AsCurrency := Arecord^.debito;
            ParamByName('CREDITO').AsCurrency := Arecord^.credito;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
            ExecQuery;
         end;
        try
         Transaction.Commit;
        except
         Transaction.Rollback;
         raise;
         Exit;
        end;
       end;
       ShowMessage('Proceso Finalizado...');
end;

procedure TfrmCausacionCarteraDiariaAuto.OncePC;
begin

end;

end.

