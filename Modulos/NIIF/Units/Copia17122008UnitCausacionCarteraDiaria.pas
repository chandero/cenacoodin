unit UnitCausacionCarteraDiaria;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Math, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IB, IBSQL, DB, IBCustomDataSet, IBQuery,
  ComCtrls, Grids, DBGrids, XStringGrid, Buttons,UnitDmGeneral, UnitDmColocacion,
  pr_Common, pr_TxClasses, IBDatabase, DBClient;

type
  TfrmCausacionCarteraDiaria = class(TForm)
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
    ReporteD: TprTxReport;
    Reporte: TprTxReport;
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
  private
    { Private declarations }
    procedure EvaluarCortoPlazo;
    function EvaluarEdad(Clasificacion, Garantia, Dias: Integer): string;
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
    procedure ContabilizarCPLP;
    procedure ContabilizarKC;
    procedure ContabilizarCau;
    procedure ContabilizarR;
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
  frmCausacionCarteraDiaria: TfrmCausacionCarteraDiaria;
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

implementation

{$R *.dfm}

uses UnitGlobales,UnitGlobalesCol, UnitFechaAEvaluar,
     UnitPantallaProgreso, UnitVistaPreliminar;

var frmPantallaProgreso:TfrmProgreso;


procedure TfrmCausacionCarteraDiaria.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(self);
end;


procedure TfrmCausacionCarteraDiaria.FormShow(Sender: TObject);
var I:Integer;
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
        EdFechaCorte.Date := Date;
end;


procedure TfrmCausacionCarteraDiaria.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCausacionCarteraDiaria.CmdProcesarClick(Sender: TObject);
begin
        RGProceso.Enabled := False;
        CmdProcesar.Enabled := False;
        Application.ProcessMessages;
        PrimerPasoCausacion;
        SegundoPasoCausacion;
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
           CmdAplicar.Enabled := True;
        end;
        CmdImprimir.Enabled := True;
        CmdImprimirProvision.Enabled := True;
end;

procedure TfrmCausacionCarteraDiaria.EvaluarCortoPlazo;
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


procedure TfrmCausacionCarteraDiaria.FormDestroy(Sender: TObject);
begin
        dmColocacion.Free;
end;

function TfrmCausacionCarteraDiaria.EvaluarEdad(Clasificacion,
  Garantia,Dias: Integer): string;
begin
        with IBQVarios do begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_CATEGORIA from "col$codigospuc" where ');
          SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ');
          SQL.Add('ID_GARANTIA = :ID_GARANTIA and :DIAS BETWEEN DIAS_INICIALES and DIAS_FINALES');
          ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
          ParamByName('ID_GARANTIA').AsInteger := Garantia;
          ParamByName('DIAS').AsInteger := Dias;
          try
           Open;
           Result := FieldByName('ID_CATEGORIA').AsString;
           if Result = '' then Result := 'A';
          except
           Result := 'A';
          end;
        end;
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
            frmPantallaProgreso.InfoLabel := 'Procesando Causación de Colocaciones';
            while not IBQuery1.Eof do
            begin
                frmPantallaProgreso.Position := IBQuery1.RecNo;
                Application.ProcessMessages;
                FechaInicial := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                FechaFinal := EdFechaCorte.Date;
                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('select DIAS_INICIALES from "col$codigospuc" where');
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
                    MessageDlg('Error al Buscar Datos Para Aplicar Provisión',mtError,[mbcancel],0);
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
// Fin Actualización
          IBQuery1.Next;
          end; // while
          IBQuery1.Close;
          IBQuery1.Transaction.Commit;
          frmPantallaProgreso.Cerrar;
end;
}
function TfrmCausacionCarteraDiaria.CalculoAportes(id: integer;
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
               SQL.Add('SELECT SALDO_ACTUAL FROM SALDO_ACTUAL(:ID_AGENCIA,:TIPO,:CUENTA,:DIGITO,:ANO,:FECHA1,:FECHA2)');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('TIPO').AsInteger := 1;
               ParamByName('CUENTA').AsInteger := NumeroCuenta;
               ParamByName('DIGITO').AsInteger := DigitoCuenta;
               parambyname('ANO').AsString := IntToStr(Yearof(Date));
               Parambyname('FECHA1').asDate := EncodeDate(YearOf(Date),01,01);
               ParamByName('FECHA2').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)));
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

procedure TfrmCausacionCarteraDiaria.CmdImprimirClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;

begin
          if IBQuery1.Transaction.InTransaction then
             IBQuery1.Transaction.Rollback;
          IBQuery1.Transaction.StartTransaction;

          IBQuery1.Close;
          IBQuery1.SQL.Clear;
          IBQuery1.SQL.Add('SELECT');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_AGENCIA,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_COLOCACION,');
          IBQuery1.SQL.Add('"col$causaciondiaria".FECHA_CORTE,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_CLASIFICACION,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_GARANTIA,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_EDAD_ANT,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_ARRASTRE,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_PERSONA,');
          IBQuery1.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery1.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery1.SQL.Add('"col$categoria".DESCRIPCION_CATEGORIA,');
          IBQuery1.SQL.Add('"col$causaciondiaria".VALOR,');
          IBQuery1.SQL.Add('"col$causaciondiaria".DEUDA,');
          IBQuery1.SQL.Add('"col$causaciondiaria".FECHA_CAPITAL,');
          IBQuery1.SQL.Add('"col$causaciondiaria".FECHA_INTERES,');
          IBQuery1.SQL.Add('"col$causaciondiaria".DIAS,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ANTICIPADOS,');
          IBQuery1.SQL.Add('"col$causaciondiaria".CAUSADOS,');
          IBQuery1.SQL.Add('"col$causaciondiaria".CONTINGENCIAS,');
          IBQuery1.SQL.Add('"col$causaciondiaria".APORTES,');
          IBQuery1.SQL.Add('"col$causaciondiaria".PCAPITAL,');
          IBQuery1.SQL.Add('"col$causaciondiaria".PINTERES,');
          IBQuery1.SQL.Add('"col$causaciondiaria".PCOSTAS,');
          IBQuery1.SQL.Add('"col$causaciondiaria".CORTO_PL,');
          IBQuery1.SQL.Add('"col$causaciondiaria".LARGO_PL,');
          IBQuery1.SQL.Add('"col$causaciondiaria".COSTAS,');
          IBQuery1.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBQuery1.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBQuery1.SQL.Add('"gen$persona".NOMBRE');
          IBQuery1.SQL.Add('FROM');
          IBQuery1.SQL.Add('"col$causaciondiaria"');
          IBQuery1.SQL.Add('LEFT JOIN "gen$persona" ON ');
          IBQuery1.SQL.Add('("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
          IBQuery1.SQL.Add('("col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBQuery1.SQL.Add('LEFT JOIN "col$clasificacion" ON ("col$causaciondiaria".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery1.SQL.Add('LEFT JOIN "col$garantia" ON ("col$causaciondiaria".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          IBQuery1.SQL.Add('LEFT JOIN "col$categoria" ON ("col$causaciondiaria".ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          IBQuery1.SQL.Add('where FECHA_CORTE = :FECHA AND DEUDA > 0 and "col$causaciondiaria".ID_CLASIFICACION = 1');
          IBQuery1.SQL.Add('ORDER BY');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_GARANTIA,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_ARRASTRE,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_AGENCIA,');
          IBQuery1.SQL.Add('"col$causaciondiaria".ID_COLOCACION');
          IBQuery1.ParamByName('FECHA').AsDate := EdFechaCorte.Date;

          IBQuery2.Close;
          IBQuery2.SQL.Clear;
          IBQuery2.SQL.Add('SELECT');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_AGENCIA,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_COLOCACION,');
          IBQuery2.SQL.Add('"col$causaciondiaria".FECHA_CORTE,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_CLASIFICACION,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_GARANTIA,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_EDAD_ANT,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_ARRASTRE,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_PERSONA,');
          IBQuery2.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery2.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery2.SQL.Add('"col$categoria".DESCRIPCION_CATEGORIA,');
          IBQuery2.SQL.Add('"col$causaciondiaria".VALOR,');
          IBQuery2.SQL.Add('"col$causaciondiaria".DEUDA,');
          IBQuery2.SQL.Add('"col$causaciondiaria".FECHA_CAPITAL,');
          IBQuery2.SQL.Add('"col$causaciondiaria".FECHA_INTERES,');
          IBQuery2.SQL.Add('"col$causaciondiaria".DIAS,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ANTICIPADOS,');
          IBQuery2.SQL.Add('"col$causaciondiaria".CAUSADOS,');
          IBQuery2.SQL.Add('"col$causaciondiaria".CONTINGENCIAS,');
          IBQuery2.SQL.Add('"col$causaciondiaria".APORTES,');
          IBQuery2.SQL.Add('"col$causaciondiaria".PCAPITAL,');
          IBQuery2.SQL.Add('"col$causaciondiaria".PINTERES,');
          IBQuery2.SQL.Add('"col$causaciondiaria".PCOSTAS,');
          IBQuery2.SQL.Add('"col$causaciondiaria".CORTO_PL,');
          IBQuery2.SQL.Add('"col$causaciondiaria".LARGO_PL,');
          IBQuery2.SQL.Add('"col$causaciondiaria".COSTAS,');
          IBQuery2.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBQuery2.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBQuery2.SQL.Add('"gen$persona".NOMBRE');
          IBQuery2.SQL.Add('FROM');
          IBQuery2.SQL.Add('"col$causaciondiaria"');
          IBQuery2.SQL.Add('LEFT JOIN "gen$persona" ON ');
          IBQuery2.SQL.Add('("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
          IBQuery2.SQL.Add('("col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBQuery2.SQL.Add('LEFT JOIN "col$clasificacion" ON ("col$causaciondiaria".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery2.SQL.Add('LEFT JOIN "col$garantia" ON ("col$causaciondiaria".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          IBQuery2.SQL.Add('LEFT JOIN "col$categoria" ON ("col$causaciondiaria".ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          IBQuery2.SQL.Add('where FECHA_CORTE = :FECHA AND DEUDA > 0 and "col$causaciondiaria".ID_CLASIFICACION = 2');
          IBQuery2.SQL.Add('ORDER BY');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_GARANTIA,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_ARRASTRE,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_AGENCIA,');
          IBQuery2.SQL.Add('"col$causaciondiaria".ID_COLOCACION');
          IBQuery2.ParamByName('FECHA').AsDate := EdFechaCorte.Date;

          IBQuery3.Close;
          IBQuery3.SQL.Clear;
          IBQuery3.SQL.Add('SELECT');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_AGENCIA,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_COLOCACION,');
          IBQuery3.SQL.Add('"col$causaciondiaria".FECHA_CORTE,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_CLASIFICACION,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_GARANTIA,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_EDAD_ANT,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_ARRASTRE,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_PERSONA,');
          IBQuery3.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery3.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery3.SQL.Add('"col$categoria".DESCRIPCION_CATEGORIA,');
          IBQuery3.SQL.Add('"col$causaciondiaria".VALOR,');
          IBQuery3.SQL.Add('"col$causaciondiaria".DEUDA,');
          IBQuery3.SQL.Add('"col$causaciondiaria".FECHA_CAPITAL,');
          IBQuery3.SQL.Add('"col$causaciondiaria".FECHA_INTERES,');
          IBQuery3.SQL.Add('"col$causaciondiaria".DIAS,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ANTICIPADOS,');
          IBQuery3.SQL.Add('"col$causaciondiaria".CAUSADOS,');
          IBQuery3.SQL.Add('"col$causaciondiaria".CONTINGENCIAS,');
          IBQuery3.SQL.Add('"col$causaciondiaria".APORTES,');
          IBQuery3.SQL.Add('"col$causaciondiaria".PCAPITAL,');
          IBQuery3.SQL.Add('"col$causaciondiaria".PINTERES,');
          IBQuery3.SQL.Add('"col$causaciondiaria".PCOSTAS,');
          IBQuery3.SQL.Add('"col$causaciondiaria".CORTO_PL,');
          IBQuery3.SQL.Add('"col$causaciondiaria".LARGO_PL,');
          IBQuery3.SQL.Add('"col$causaciondiaria".COSTAS,');
          IBQuery3.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBQuery3.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBQuery3.SQL.Add('"gen$persona".NOMBRE');
          IBQuery3.SQL.Add('FROM');
          IBQuery3.SQL.Add('"col$causaciondiaria"');
          IBQuery3.SQL.Add('LEFT JOIN "gen$persona" ON ');
          IBQuery3.SQL.Add('("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
          IBQuery3.SQL.Add('("col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBQuery3.SQL.Add('LEFT JOIN "col$clasificacion" ON ("col$causaciondiaria".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery3.SQL.Add('LEFT JOIN "col$garantia" ON ("col$causaciondiaria".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          IBQuery3.SQL.Add('LEFT JOIN "col$categoria" ON ("col$causaciondiaria".ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          IBQuery3.SQL.Add('where FECHA_CORTE = :FECHA AND DEUDA > 0 and "col$causaciondiaria".ID_CLASIFICACION = 3');
          IBQuery3.SQL.Add('ORDER BY');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_GARANTIA,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_ARRASTRE,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_AGENCIA,');
          IBQuery3.SQL.Add('"col$causaciondiaria".ID_COLOCACION');
          IBQuery3.ParamByName('FECHA').AsDate := EdFechaCorte.Date;

          IBQuery4.Close;
          IBQuery4.SQL.Clear;
          IBQuery4.SQL.Add('SELECT');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_AGENCIA,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_COLOCACION,');
          IBQuery4.SQL.Add('"col$causaciondiaria".FECHA_CORTE,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_CLASIFICACION,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_GARANTIA,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_EDAD_ANT,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_ARRASTRE,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_IDENTIFICACION,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_PERSONA,');
          IBQuery4.SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery4.SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery4.SQL.Add('"col$categoria".DESCRIPCION_CATEGORIA,');
          IBQuery4.SQL.Add('"col$causaciondiaria".VALOR,');
          IBQuery4.SQL.Add('"col$causaciondiaria".DEUDA,');
          IBQuery4.SQL.Add('"col$causaciondiaria".FECHA_CAPITAL,');
          IBQuery4.SQL.Add('"col$causaciondiaria".FECHA_INTERES,');
          IBQuery4.SQL.Add('"col$causaciondiaria".DIAS,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ANTICIPADOS,');
          IBQuery4.SQL.Add('"col$causaciondiaria".CAUSADOS,');
          IBQuery4.SQL.Add('"col$causaciondiaria".CONTINGENCIAS,');
          IBQuery4.SQL.Add('"col$causaciondiaria".APORTES,');
          IBQuery4.SQL.Add('"col$causaciondiaria".PCAPITAL,');
          IBQuery4.SQL.Add('"col$causaciondiaria".PINTERES,');
          IBQuery4.SQL.Add('"col$causaciondiaria".PCOSTAS,');
          IBQuery4.SQL.Add('"col$causaciondiaria".CORTO_PL,');
          IBQuery4.SQL.Add('"col$causaciondiaria".LARGO_PL,');
          IBQuery4.SQL.Add('"col$causaciondiaria".COSTAS,');
          IBQuery4.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          IBQuery4.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          IBQuery4.SQL.Add('"gen$persona".NOMBRE');
          IBQuery4.SQL.Add('FROM');
          IBQuery4.SQL.Add('"col$causaciondiaria"');
          IBQuery4.SQL.Add('LEFT JOIN "gen$persona" ON ');
          IBQuery4.SQL.Add('("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
          IBQuery4.SQL.Add('("col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
          IBQuery4.SQL.Add('LEFT JOIN "col$clasificacion" ON ("col$causaciondiaria".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery4.SQL.Add('LEFT JOIN "col$garantia" ON ("col$causaciondiaria".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          IBQuery4.SQL.Add('LEFT JOIN "col$categoria" ON ("col$causaciondiaria".ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          IBQuery4.SQL.Add('where FECHA_CORTE = :FECHA AND DEUDA > 0 and "col$causaciondiaria".ID_CLASIFICACION = 4');
          IBQuery4.SQL.Add('ORDER BY');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_GARANTIA,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_ARRASTRE,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_AGENCIA,');
          IBQuery4.SQL.Add('"col$causaciondiaria".ID_COLOCACION');
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
          IBQuery5.SQL.Add('"col$causaciondiaria"');
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


          frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
          Reporte.Variables.ByName['Empresa'].AsString := Empresa;
          Reporte.Variables.ByName['Agencia'].AsInteger := Agencia;
          Reporte.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.Date;
          Reporte.Title := 'Calificación,Causación y Provisión de Colocaciones';
          if Reporte.PrepareReport then begin
             frmVistaPreliminar.Reporte := Reporte;
             frmVistaPreliminar.ShowModal;
          end;
          IBQuery5.Close;
          IBQuery1.Transaction.Commit;
end;

procedure TfrmCausacionCarteraDiaria.CmdAplicarClick(Sender: TObject);
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
             IBSQL4.Transaction := IBTAdicional;
             IBTAdicional.Active := True;
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
//             IBSQL4.Close;
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
             IBSQL4.Transaction := IBTAdicional;
             IBTAdicional.Active := True;
             IBSQL4.Close;
             IBSQL4.SQL.Clear;
             IBSQL4.SQL.Add('UPDATE "col$colocacion" SET ID_CATEGORIA = :ID_CATEGORIA, ID_EVALUACION = :ID_EVALUACION');
             IBSQL4.SQL.Add('where "col$colocacion".ID_AGENCIA = :ID_AGENCIA and "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
             IBSQL4.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
             IBSQL4.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
             IBSQL4.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_ARRASTRE').AsString;
             IBSQL4.ParamByName('ID_EVALUACION').AsString := FieldByName('ID_ARRASTRE').AsString;
            while True do
             try
               if IBTAdicional.InTransaction then
                  IBTAdicional.Rollback;
               IBTAdicional.StartTransaction;
               IBSQL4.ExecQuery;
               IBTAdicional.Commit;
               Break;
             except
              on E: EIBInterBaseError do
              begin
               RecordLocked := False;
               if E.SQLCode = -913 then RecordLocked := True;
               if RecordLocked then
                begin
                 WaitCount := Random(20);
                 for I := 1 to WaitCount do
                 Application.ProcessMessages;
                 Continue;
                end
               else
                begin
                 ErrorMsg := ErrorMsg + E.Message +
                 ' (' + IntToStr(E.IBErrorCode ) + '). ';
                 MessageDlg(ErrorMsg,mterror,[mbOk],0);
               end;
              end;
             end;
             Next;
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
         MessageDlg('Calificación Aplicada con Exito!',mtInformation,[mbok],0);
         CmdComprobante.Enabled := True;
end;

procedure TfrmCausacionCarteraDiaria.EdFechaCorteChange(Sender: TObject);
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
          end
          else begin
            CmdProcesar.Enabled := False;
//            RGProceso.Enabled := True;
            CmdAplicar.Enabled := True;
            CmdComprobante.Enabled := True;
            CmdImprimir.Enabled := True;
            CmdImprimirProvision.Enabled := True;
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

procedure TfrmCausacionCarteraDiaria.CmdComprobanteClick(Sender: TObject);
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

end;

procedure TfrmCausacionCarteraDiaria.PrimerPasoComprobante;
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
                 SQL.Add('inner join "col$codigospuc" on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_EDAD = "col$codigospuc".ID_CATEGORIA)');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_CAPITAL_CP,"col$codigospuc".COD_CAPITAL_LP');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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

procedure TfrmCausacionCarteraDiaria.ActualizarGrid;
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

procedure TfrmCausacionCarteraDiaria.SegundoPasoComprobante;
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
                 SQL.Add('inner join "col$codigospuc" on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = "col$codigospuc".ID_CATEGORIA)');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_CAPITAL_CP');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
                 SQL.Add('inner join "col$codigospuc" on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = "col$codigospuc".ID_CATEGORIA)');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_COSTAS');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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

procedure TfrmCausacionCarteraDiaria.TercerPasoComprobante;
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
                 SQL.Add('inner join "col$codigospuc" on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = "col$codigospuc".ID_CATEGORIA)');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_CXC');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

procedure TfrmCausacionCarteraDiaria.CuartoPasoComprobante;
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
                 SQL.Add('inner join "col$codigospuc" on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = "col$codigospuc".ID_CATEGORIA)');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_PROV_CAPITAL');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

procedure TfrmCausacionCarteraDiaria.QuintoPasoComprobante;
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
                 SQL.Add('inner join "col$codigospuc" on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = "col$codigospuc".ID_CATEGORIA)');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_PROV_INTERES');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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
                 SQL.Add('inner join "col$codigospuc" on ');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = "col$codigospuc".ID_CATEGORIA)');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_PROV_COSTAS');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

procedure TfrmCausacionCarteraDiaria.SextoPasoComprobante;
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

procedure TfrmCausacionCarteraDiaria.SeptimoPasoComprobante;
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
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION,MAX("col$codigospuc".COD_INT_ANT) AS COD_INT_ANT,');
                 SQL.Add('SUM("col$causaciones".ANTICIPADOS) AS ANTICIPADOS');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join "col$codigospuc" on');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = "col$codigospuc".ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION,"col$codigospuc".COD_INT_ANT');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

procedure TfrmCausacionCarteraDiaria.OctavoPasoComprobante;
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
                 SQL.Add('select "col$causaciones".ID_CLASIFICACION,MAX("col$codigospuc".COD_CONTINGENCIA) AS COD_CONTINGENCIA,');
                 SQL.Add('SUM("col$causaciones".CONTINGENCIAS) AS CONTINGENCIAS');
                 SQL.Add('from "col$causaciones"');
                 SQL.Add('inner join "col$codigospuc" on');
                 SQL.Add('("col$causaciones".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciones".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciones".ID_ARRASTRE = "col$codigospuc".ID_CATEGORIA)');
                 SQL.Add('where "col$causaciones".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciones".ID_CLASIFICACION,"col$codigospuc".COD_CONTINGENCIA');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

procedure TfrmCausacionCarteraDiaria.PrimerPasoCausacion;
var I :Integer;
vFechaGracia:TDate;
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
            MessageDlg('No se pudo vaciar la tabla anterior',mtError,[mbcancel],0);
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
            MessageDlg('No se pudo vaciar la tabla anterior de Movimientos',mtError,[mbcancel],0);
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
            frmPantallaProgreso.InfoLabel := 'Procesando Causación de Colocaciones';
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

                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('select DIAS_INICIALES from "col$codigospuc" where');
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

                Dias := DiasEntre(FechaInicial,FechaFinal);

                if IBQuery1.FieldByName('ID_LINEA').AsInteger = 13 then
                  if vFechaGracia > EdFechaCorte.Date then
                  begin
//                    Dias := DiasEntre(FechaInicial,FechaFinal);
                    Dias := Dias + IBQuery1.FieldByName('PERIODO_GRACIA').AsInteger;
//                    if Dias > 0 then Dias := 0;
                  end;

                DiasCorrientes := Dias;
            // Evaluar Edad
            if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'V' then
               Dias := Dias - IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
            if Dias < 1 then Dias := 0;
            Edad := EvaluarEdad(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,
                                IBQuery1.FieldByName('ID_GARANTIA').AsInteger,Dias);
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
                SQL.Add(':PCAPITAL_REC,:PINTERES_REC,:PCOSTAS_REC,:PCAPITAL_REV,:PINTERES_REV,:PCOSTAS_REV,:PCAPITAL_GAS,:PINTERES_GAS,:PCOSTAS_GAS)');
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
              IBQuery2.Transaction.StartTransaction;
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

procedure TfrmCausacionCarteraDiaria.SegundoPasoCausacion;
var id_ant:Integer;
    pr_ant:string;
    edad_ant:string;
    primerpaso:Boolean;
    vAportes:Currency;
    AportesCon:Currency;
    Deuda:Currency;
    ListaFechas:TList;
    AFechas:PFechasLiq;
    FechaInicial,FechaFinal:TDate;
    i,Ano,Mes,Dia,DiasCalc:Integer;
    FechaDesembolso:TDate;
    PCapDiaAnt,PIntDiaAnt,PCosDiaAnt:Currency;
    PCapAcum,PIntAcum,PCosAcum:Currency;
    FechaAnterior,FechaAnoAnterior : TDate;
    MovCapital,RecCapital,RevGCapital,GCapital:Currency;
    MovInteres,RecInteres,RevGInteres,GInteres:Currency;
    MovCostas,RecCostas,RevGCostas,GCostas:Currency;
    TasaViv:Double;
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
          edad_ant := IBQuery1.FieldByName('ID_EDAD_ACT').AsString;
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
                 edad_ant := IBQuery1.FieldByName('ID_EDAD_ACT').AsString;
                 AportesCon := CalculoAportes(id_ant,pr_ant);
              end;
              Deuda := IBQuery1.FieldByName('DEUDA').AsCurrency;
              Tasa1 := BuscoTasaEfectivaMaxima1(IBQVarios,EdFechaCorte.Date,IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,'A');
              // Primer Paso
              Saldo := IBQuery1.FieldByName('DEUDA').AsCurrency;
              IBSQL3.Close;
              IBSQL3.SQL.Clear;
              IBSQL3.SQL.Add('select DIAS_INICIALES from "col$codigospuc" where');
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
                  DiasANT := dias;
                  DiasCON := 0;
                  DiasCXC := 0;
                 end; // if

              // Evaluar Fechas
              if DiasCXC > 0 then begin
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
                    if IBQuery1.FieldByName('ID_INTERES').AsInteger = 0 then begin
                       Tasa := BuscoTasaEfectivaMaxima1(IBQVarios,AFechas.FechaFinal,IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,'A');
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
                       Tasa := BuscoTasaEfectivaMaximaDtfNueva(IBQVarios,AFechas.FechaFinal);
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
                       Tasa := BuscoTasaEfectivaMaximaIPCNueva(IBQVarios);
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
                       TasaViv := BuscoTasaEfectivaUvrNueva(IBQVarios,AFechas.FechaFinal);
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

                    Bisiesto := False;
                    FechaDesembolso := IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
                    if AFechas^.FechaInicial = FechaInicial then
                       AFechas^.FechaInicial := CalculoFecha(FechaInicial,1);
                    DiasCalc := DiasEnFechas(AFechas^.FechaInicial,AFechas^.FechaFinal,FechaDesembolso,bisiesto);
                    if DiasCalc < 0 then DiasCalc := 0;
                    Dispose(AFechas);
                    if DiasCXC < (DiasContingencia - 1) then begin
                       DiasCXC := DiasCXC + DiasCalc;
                       if DiasCXC > (DiasContingencia - 1) then
                       begin
                          DiasCON := DiasCXC - (DiasContingencia-1);
                          DiasCXC := (DiasContingencia-1);
                          Contingentes := Contingentes + SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * DiasCON,0);
                          DiasCalc := DiasCalc - DiasCON;
                       end;
                       Causados := Causados + SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * DiasCalc,0);
                    end
                    else
                    begin
                       Contingentes := Contingentes + SimpleRoundTo(((IBQuery1.FieldByName('DEUDA').AsCurrency * (Tasa/100)) / 360 ) * DiasCalc,0);
                       DiasCON := DiasCON + DiasCalc;
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
               end;


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

                     1 : TasaAnt := BuscoTasaEfectivaMaximaDtfNueva(IBQVarios,EdFechaCorte.Date);

                     2 : TasaAnt := BuscoTasaEfectivaMaximaIPCNueva(IBQVarios);
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
            if edad_ant = 'A' then
              with IBSQL3 do begin
               Close;
               SQL.Clear;
               SQL.Add('select * from "col$tablaliquidacion"');
               SQL.Add('where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION") AND');
               SQL.Add('((PAGADA = 0) OR ((PAGADA=1) AND (FECHA_A_PAGAR>:FECHACORTE)))');
               SQL.Add('ORDER BY FECHA_A_PAGAR');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
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

// Calculo Provisiones
                Capital := 0;
                Interes := 0;
                PCostas := 0;
                PCapDiaAnt := 0;
                PIntDiaAnt := 0;
                PCosDiaAnt := 0;
                PCapAcum := 0;
                PIntAcum := 0;
                PCosAcum := 0;
                MovCapital := 0;
                RecCapital := 0;
                RevGCapital := 0;
                GCapital := 0;
                MovInteres := 0;
                RecInteres := 0;
                RevGInteres := 0;
                GInteres := 0;
                MovCostas := 0;
                RecCostas := 0;
                RevGCostas := 0;
                GCostas := 0;

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
                    MessageDlg('Error al Buscar Datos Para Aplicar Provisión',mtError,[mbcancel],0);
                    frmPantallaProgreso.Cerrar;
                    raise;
                    Exit;
                   end; // try
                   Capital := SimpleRoundTo(Deuda * (FieldByName('A_CAPITAL').AsFloat / 100),0);
                   Interes := SimpleRoundTo(Causados * (FieldByName('A_INTERESES').AsFloat / 100),0);
                   PCostas := SimpleRoundTo(Costas * (FieldByName('A_COSTAS').AsFloat / 100),0);
                end; // with
// Fin Calculo Provisiones

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

{                IBSQL6.Close;
                IBSQL6.SQL.Clear;
                IBSQL6.SQL.Add('select PCAPITAL, PINTERES, PCOSTAS from "col$causaciones"');
                IBSQL6.SQL.Add('where ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION AND FECHA_CORTE = :FECHA_CORTE');
                IBSQL6.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                IBSQL6.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                IBSQL6.ParamByName('FECHA_CORTE').AsDate := FechaAnterior;
                IBSQL6.ExecQuery;
                PCapAcum := IBSQL6.FieldByName('PCAPITAL').AsCurrency;
                PIntAcum := IBSQL6.FieldByName('PINTERES').AsCurrency;
                PCosAcum := IBSQL6.FieldByName('PCOSTAS').AsCurrency;
                IBSQL6.Close;    }

                IBSQL6.SQL.Clear;
                IBSQL6.SQL.Add('select * from "col$causaciondiariamovtmp" where ID_AGENCIA = :ID_AGENCIA  AND ID_COLOCACION = :ID_COLOCACION');
                IBSQL6.ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                IBSQL6.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                IBSQL6.ExecQuery;

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
                    IBSQL3.Close;
                  end;
                  IBSQL3.Close;
                end;

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
                    IBSQL3.Close;
                  end;
                  IBSQL3.Close;
                end;

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
                    IBSQL3.Close;
                  end;
                  IBSQL3.Close;
                end;

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
                    SQL.Add('update "col$causaciondiariatmp" SET ID_ARRASTRE = :ID_ARRASTRE,TASA = :TASA,');
                    SQL.Add('ANTICIPADOS = :ANTICIPADOS,CAUSADOS = :CAUSADOS,CONTINGENCIAS = :CONTINGENCIAS,');
                    SQL.Add('PCAPITAL = :PCAPITAL, PINTERES = :PINTERES, PCOSTAS = :PCOSTAS, APORTES = :APORTES, COSTAS = :COSTAS,');
                    SQL.Add('CORTO_PL = :CORTO_PL, LARGO_PL = :LARGO_PL, PCAPITAL_REC = :PCAPITAL_REC, PINTERES_REC = :PINTERES_REC,');
                    SQL.Add('PCOSTAS_REC = :PCOSTAS_REC, PCAPITAL_REV = :PCAPITAL_REV, PINTERES_REV = :PINTERES_REV, PCOSTAS_REV = :PCOSTAS_REV,');
                    SQL.Add('PCAPITAL_GAS = :PCAPITAL_GAS, PINTERES_GAS = :PINTERES_GAS, PCOSTAS_GAS = :PCOSTAS_GAS');
                    SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
                    ParamByName('ID_AGENCIA').AsInteger := IBQuery1.fieldbyname('ID_AGENCIA').AsInteger;
                    ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                    ParamByName('ID_ARRASTRE').AsString := edad_ant;
                    ParamByName('TASA').AsDouble := Tasa;
                    ParamByName('ANTICIPADOS').AsCurrency := Anticipados;
                    ParamByName('CAUSADOS').AsCurrency := Causados;
                    ParamByName('CONTINGENCIAS').AsCurrency := Contingentes;
                    ParamByName('PCAPITAL').AsCurrency := Capital;
                    ParamByName('PINTERES').AsCurrency := Interes;
                    ParamByName('PCOSTAS').AsCurrency := PCostas;
                    ParamByName('APORTES').AsCurrency := vAportes;
                    ParamByName('COSTAS').AsCurrency := Costas;
                    ParamByName('CORTO_PL').AsCurrency := CortoPlazo;
                    ParamByName('LARGO_PL').AsCurrency := LargoPlazo;
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
                      frmPantallaProgreso.Cerrar;
                      MessageDlg('Error Actualizando Tabla Temporal',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                    end;
                 end; // with
// Fin Actualización
          IBQuery1.Next;
          end; // while
          IBQuery1.Close;
          if dmGeneral.IBTransaction1.InTransaction  then
            dmGeneral.IBTransaction1.Commit;
          frmPantallaProgreso.Cerrar;
end;

procedure TfrmCausacionCarteraDiaria.NovenoPasoComprobante;
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

procedure TfrmCausacionCarteraDiaria.DecimoPasoComprobante;
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
         sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
         sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
         sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
         sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
         sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
         sql.Add('"con$comprobante"."ANULACION","con$comprobante".ID_EMPLEADO)');
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
         SQL.Add('insert into "con$auxiliar" values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
         if Lista.Count > 0 then
         for I := 0 to Lista.Count -1 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "con$auxiliar" values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
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

procedure TfrmCausacionCarteraDiaria.TercerPasoCausacion;
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
              MessageDlg('Proceso terminado con exito',mtInformation,[mbok],0);
             end;
           end;
         end;
end;

procedure TfrmCausacionCarteraDiaria.CmdImprimirProvisionClick(
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
          SQL.Add('"col$causaciondiaria".ID_GARANTIA,"col$causaciondiaria".DIAS,"col$causaciondiaria".ID_AGENCIA,');
          SQL.Add('"col$causaciondiariamov".PCAPITAL_ANUAL,"col$causaciondiariamov".PINTERES_ANUAL,"col$causaciondiariamov".PCOSTAS_ANUAL,');
          SQL.Add('"col$causaciondiariamov".PCAPITAL_ACT,"col$causaciondiariamov".PINTERES_ACT,"col$causaciondiariamov".PCOSTAS_ACT,');
          SQL.Add('"col$causaciondiaria".PCAPITAL,"col$causaciondiaria".PINTERES,"col$causaciondiaria".PCOSTAS,');
          SQL.Add('"col$causaciondiaria".PCAPITAL_REC,"col$causaciondiaria".PINTERES_REC,"col$causaciondiaria".PCOSTAS_REC,');
          SQL.Add('"col$causaciondiaria".PCAPITAL_REV,"col$causaciondiaria".PINTERES_REV,"col$causaciondiaria".PCOSTAS_REV,');
          SQL.Add('"col$causaciondiaria".PCAPITAL_GAS,"col$causaciondiaria".PINTERES_GAS,"col$causaciondiaria".PCOSTAS_GAS,');
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
          SQL.Add('"col$causaciondiariatmp".ID_GARANTIA,"col$causaciondiariatmp".DIAS,"col$causaciondiariatmp".ID_AGENCIA,');
          SQL.Add('"col$causaciondiariamovtmp".PCAPITAL_ANUAL,"col$causaciondiariamovtmp".PINTERES_ANUAL,"col$causaciondiariamovtmp".PCOSTAS_ANUAL,');
          SQL.Add('"col$causaciondiariamovtmp".PCAPITAL_ACT,"col$causaciondiariamovtmp".PINTERES_ACT,"col$causaciondiariamovtmp".PCOSTAS_ACT,');
          SQL.Add('"col$causaciondiariatmp".PCAPITAL,"col$causaciondiariatmp".PINTERES,"col$causaciondiariatmp".PCOSTAS,');
          SQL.Add('"col$causaciondiariatmp".PCAPITAL_REC,"col$causaciondiariatmp".PINTERES_REC,"col$causaciondiariatmp".PCOSTAS_REC,');
          SQL.Add('"col$causaciondiariatmp".PCAPITAL_REV,"col$causaciondiariatmp".PINTERES_REV,"col$causaciondiariatmp".PCOSTAS_REV,');
          SQL.Add('"col$causaciondiariatmp".PCAPITAL_GAS,"col$causaciondiariatmp".PINTERES_GAS,"col$causaciondiariatmp".PCOSTAS_GAS,');
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

     frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
     ReporteD.Variables.ByName['Empresa'].AsString := Empresa;
     ReporteD.Variables.ByName['Agencia'].AsInteger := Agencia;
     ReporteD.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.Date;
     ReporteD.Title := 'Calificación y Provisión de Colocaciones';
     if ReporteD.PrepareReport then begin
       frmVistaPreliminar.Reporte := ReporteD;
       frmVistaPreliminar.ShowModal;
     end;
     IBQuery1.Transaction.Commit;
end;

function TfrmCausacionCarteraDiaria.BuscoTasaAnt(Ag: integer;
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
                   Result := SimpleRoundTo(FieldByName('TASA_INTERES_LIQUIDACION').AsDouble);
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

procedure TfrmCausacionCarteraDiaria.PrimerPC;
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
                 SQL.Add('inner join "col$codigospuc" on ');
                 SQL.Add('("col$causaciondiaria".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciondiaria".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT = "col$codigospuc".ID_CATEGORIA)');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_CAPITAL_CP,"col$codigospuc".COD_CAPITAL_LP');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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

procedure TfrmCausacionCarteraDiaria.SegundoPC;
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_CAPITAL_CP');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_COSTAS');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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

procedure TfrmCausacionCarteraDiaria.TercerPC;
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_CXC');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               Codigo := '415005000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

               Codigo := '415017000000000000';
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

procedure TfrmCausacionCarteraDiaria.CuartoPC;
var AR:PList;
    Valor,ValorProvision:Currency;
    Codigo,CodigoI,CodigoE:string;
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_PROV_CAPITAL');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PCAPITAL_REC) AS PCAPITAL_REC,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PCAPITAL_REV) AS PCAPITAL_REV,');
               IBSQL3.SQL.Add('SUM("col$causaciondiaria".PCAPITAL_GAS) AS PCAPITAL_GAS,');
               IBSQL3.SQL.Add('"col$codigospuc".COD_IPROV_CAPITAL,');
               IBSQL3.SQL.Add('"col$codigospuc".COD_EPROV_CAPITAL');
               IBSQL3.SQL.Add('from "col$causaciondiaria"');
               IBSQL3.SQL.Add('inner join "col$codigospuc" on');
               IBSQL3.SQL.Add('("col$causaciondiaria".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
               IBSQL3.SQL.Add('"col$causaciondiaria".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
               IBSQL3.SQL.Add('"col$causaciondiaria".ID_EDAD_ACT = "col$codigospuc".ID_CATEGORIA)');
               IBSQL3.SQL.Add('where');
               IBSQL3.SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
               IBSQL3.SQL.Add('group by "col$causaciondiaria".ID_CLASIFICACION,');
               IBSQL3.SQL.Add('"col$codigospuc".COD_IPROV_CAPITAL,');
               IBSQL3.SQL.Add('"col$codigospuc".COD_EPROV_CAPITAL');
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
                  IBSQL8.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
                  IBSQL8.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
                  IBSQL8.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('select first 1 COD_IPROV_CAPITAL,COD_EPROV_CAPITAL from "col$codigospuc"');
               IBSQL3.SQL.Add(' where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION');
//               IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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
               IBSQL3.SQL.Add('select first 1 COD_IPROV_CAPITAL,COD_EPROV_CAPITAL from "col$codigospuc"');
               IBSQL3.SQL.Add(' where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION');
//               IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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
               IBSQL3.SQL.Add('select first 1 COD_IPROV_CAPITAL,COD_EPROV_CAPITAL from "col$codigospuc"');
               IBSQL3.SQL.Add(' where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION');
//               IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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
               IBSQL3.SQL.Add('select first 1 COD_IPROV_CAPITAL,COD_EPROV_CAPITAL from "col$codigospuc"');
               IBSQL3.SQL.Add(' where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION');
//               IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

end;

procedure TfrmCausacionCarteraDiaria.QuintoPC;
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_PROV_INTERES');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_PROV_COSTAS');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
                  AR^.codigo := '425037000000000000';
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
                  AR^.codigo := '425037000000000000';
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

               Codigo := '511530000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

                IBSQL1.Transaction.Commit;
                Actualizargrid;
end;

procedure TfrmCausacionCarteraDiaria.SextoPC;
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
                     Codigo := '149810000000000000';

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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

procedure TfrmCausacionCarteraDiaria.SeptimoPC;
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_INT_ANT');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('where "con$puc".CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
                     IBSQL3.SQL.Add('from "con$puc"');
                     IBSQL3.SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
                     IBSQL3.SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
                     IBSQL3.SQL.Add('where "con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
                     IBSQL3.SQL.Add('group by "con$puc".SALDOINICIAL');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               Codigo := '415005000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

               Codigo := '415017000000000000';
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
end;

procedure TfrmCausacionCarteraDiaria.OctavoPC;
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_CONTINGENCIA');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               Codigo := '860500000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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
end;

procedure TfrmCausacionCarteraDiaria.NovenoPC;
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

procedure TfrmCausacionCarteraDiaria.DecimoPC;
var I:Integer;
    TotalDebito:Currency;
    TotalCredito:Currency;
    ARecord:PList;
    FechaComp:TDate;
begin

      FechaComp := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)));
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
         sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
         sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
         sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
         sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
         sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
         sql.Add('"con$comprobante"."ANULACION","con$comprobante".ID_EMPLEADO)');
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
         SQL.Add('insert into "con$auxiliar" values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
         if Lista.Count > 0 then
         for I := 0 to Lista.Count -1 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "con$auxiliar" values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
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

procedure TfrmCausacionCarteraDiaria.ContabilizarCPLP;
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
                 SQL.Add('"col$codigospuc".COD_CAPITAL_CP,');
                 SQL.Add('"col$codigospuc".COD_CAPITAL_LP');
                 SQL.Add('from "col$causaciondiaria"');
                 SQL.Add('inner join "col$codigospuc" on');
                 SQL.Add('("col$causaciondiaria".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciondiaria".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT = "col$codigospuc".ID_CATEGORIA)');
                 SQL.Add('where');
                 SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciondiaria".ID_CLASIFICACION, "col$causaciondiaria".ID_GARANTIA,');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT,"col$codigospuc".COD_CAPITAL_CP,"col$codigospuc".COD_CAPITAL_LP');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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

procedure TfrmCausacionCarteraDiaria.ContabilizarKC;
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_CAPITAL_CP');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_COSTAS');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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

procedure TfrmCausacionCarteraDiaria.ContabilizarCau;
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
                     IBSQL3.SQL.Add('select "col$codigospuc".COD_CXC');
                     IBSQL3.SQL.Add('from "col$codigospuc" where "col$codigospuc".ID_CLASIFICACION = :ID_CLASIFICACION and ');
                     IBSQL3.SQL.Add('"col$codigospuc".ID_GARANTIA = :ID_GARANTIA and "col$codigospuc".ID_CATEGORIA = :ID_CATEGORIA');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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
               Codigo := '415005000000000000';
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

               Codigo := '415017000000000000';
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


procedure TfrmCausacionCarteraDiaria.ContabilizarR;
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
                 SQL.Add('"col$codigospuc".COD_CAPITAL_CP,');
                 SQL.Add('"col$codigospuc".COD_CAPITAL_LP');
                 SQL.Add('from "col$causaciondiaria"');
                 SQL.Add('inner join "col$codigospuc" on');
                 SQL.Add('("col$causaciondiaria".ID_CLASIFICACION = "col$codigospuc".ID_CLASIFICACION and');
                 SQL.Add('"col$causaciondiaria".ID_GARANTIA = "col$codigospuc".ID_GARANTIA and');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT = "col$codigospuc".ID_CATEGORIA)');
                 SQL.Add('where');
                 SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE');
                 SQL.Add('group by "col$causaciondiaria".ID_CLASIFICACION, "col$causaciondiaria".ID_GARANTIA,');
                 SQL.Add('"col$causaciondiaria".ID_EDAD_ACT,"col$codigospuc".COD_CAPITAL_CP,"col$codigospuc".COD_CAPITAL_LP');
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
                     IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');
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

end.

