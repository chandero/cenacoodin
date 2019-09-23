unit UnitCausacionColocaciones;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Math, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IB, IBSQL, DB, IBCustomDataSet, IBQuery,
  ComCtrls, Grids, DBGrids, XStringGrid, Buttons,UnitDmGeneral, UnitDmColocacion,
  pr_Common, pr_TxClasses, IBDatabase, DBClient;

type
  TfrmCausacionColocaciones = class(TForm)
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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GridP: TXStringGrid;
    TabSheet2: TTabSheet;
    XSauxiliar: TXStringGrid;
    Panel4: TPanel;
    Label6: TLabel;
    Edittotaldebito: TMemo;
    Label7: TLabel;
    Edittotalcredito: TMemo;
    CmdImprimirComprobante: TBitBtn;
    Label2: TLabel;
    EdComprobante: TStaticText;
    IBAuxiliar: TIBQuery;
    ReporteCom: TprTxReport;
    IBSQL5: TIBSQL;
    IBTAlterna: TIBTransaction;
    IBQuery3: TIBQuery;
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
    procedure CmdImprimirComprobanteClick(Sender: TObject);
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
  frmCausacionColocaciones: TfrmCausacionColocaciones;
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


procedure TfrmCausacionColocaciones.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(self);
end;


procedure TfrmCausacionColocaciones.FormShow(Sender: TObject);
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


procedure TfrmCausacionColocaciones.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCausacionColocaciones.CmdProcesarClick(Sender: TObject);
begin
        RGProceso.Enabled := False;
        Application.ProcessMessages;
        PrimerPasoCausacion;
        SegundoPasoCausacion;
        if RGProceso.ItemIndex = 1 then begin
           TercerPasoCausacion;
           CmdAplicar.Enabled := True;
        end;
        CmdImprimir.Enabled := True;
end;

procedure TfrmCausacionColocaciones.EvaluarCortoPlazo;
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


procedure TfrmCausacionColocaciones.FormDestroy(Sender: TObject);
begin
        dmColocacion.Free;
end;

function TfrmCausacionColocaciones.EvaluarEdad(Clasificacion,
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
function TfrmCausacionColocaciones.CalculoAportes(id: integer;
  pr: string): currency;
begin
// Calculo Aportes
            with IBSQL3 do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,');
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
               SQL.Add('SELECT * FROM P_CAP_0012 (:ID_AGENCIA,');
               SQL.Add(':ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO)');
               ParamByName('ID_AGENCIA').AsInteger := 1;
               ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
               ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
               ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
               parambyname('ANO').AsString := IntToStr(Yearof(Date));
               try
                ExecQuery;
                Saldo := FieldByName('SALDOAHORROS').AsCurrency;
               except
                Result := 0;
                Transaction.Rollback;
                raise;
                Exit;
               end;

               Close;
               SQL.Clear;
               SQL.Add('SELECT * FROM P_CAP_0010 (:ID_AGENCIA,');
               SQL.Add(':ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:FECHA1,:FECHA2)');
               ParamByName('ID_AGENCIA').AsInteger := 1;
               ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
               ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
               ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
               Parambyname('FECHA1').asDate := EncodeDate(YearOf(Date),01,01);
               ParamByName('FECHA2').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)));
               try
                ExecQuery;
                Saldo := Saldo + FieldByName('MOVIMIENTO').AsCurrency;
               except
                Result := 0;
                Transaction.Rollback;
                raise;
                Exit;
               end;
            end;
            Result := Saldo;
end;

procedure TfrmCausacionColocaciones.CmdImprimirClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$causacionestmp".ID_AGENCIA,');
          SQL.Add('"col$causacionestmp".ID_COLOCACION,');
          SQL.Add('"col$causacionestmp".FECHA_CORTE,');
          SQL.Add('"col$causacionestmp".ID_CLASIFICACION,');
          SQL.Add('"col$causacionestmp".ID_GARANTIA,');
          SQL.Add('"col$causacionestmp".ID_EDAD,');
          SQL.Add('"col$causacionestmp".ID_ARRASTRE,');
          SQL.Add('"col$causacionestmp".ID_IDENTIFICACION,');
          SQL.Add('"col$causacionestmp".ID_PERSONA,');
          SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          SQL.Add('"col$categoria".DESCRIPCION_CATEGORIA,');
          SQL.Add('"col$causacionestmp".VALOR,');
          SQL.Add('"col$causacionestmp".DEUDA,');
          SQL.Add('"col$causacionestmp".FECHA_CAPITAL,');
          SQL.Add('"col$causacionestmp".FECHA_INTERES,');
          SQL.Add('"col$causacionestmp".DIAS,');
          SQL.Add('"col$causacionestmp".ANTICIPADOS,');
          SQL.Add('"col$causacionestmp".CAUSADOS,');
          SQL.Add('"col$causacionestmp".CONTINGENCIAS,');
          SQL.Add('"col$causacionestmp".APORTES,');
          SQL.Add('"col$causacionestmp".PCAPITAL,');
          SQL.Add('"col$causacionestmp".PINTERES,');
          SQL.Add('"col$causacionestmp".PCOSTAS,');
          SQL.Add('"col$causacionestmp".CORTO_PL,');
          SQL.Add('"col$causacionestmp".LARGO_PL,');
          SQL.Add('"col$causacionestmp".COSTAS,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE');
          SQL.Add('FROM');
          SQL.Add('"col$causacionestmp"');
          SQL.Add('LEFT JOIN "gen$persona" ON ');
          SQL.Add('("col$causacionestmp".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ');
          SQL.Add('("col$causacionestmp".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('LEFT JOIN "col$clasificacion" ON ("col$causacionestmp".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          SQL.Add('LEFT JOIN "col$garantia" ON ("col$causacionestmp".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          SQL.Add('LEFT JOIN "col$categoria" ON ("col$causacionestmp".ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          SQL.Add('ORDER BY');
          SQL.Add('"col$causacionestmp".ID_CLASIFICACION,');
          SQL.Add('"col$causacionestmp".ID_GARANTIA,');
          SQL.Add('"col$causacionestmp".ID_ARRASTRE,');
          SQL.Add('"col$causacionestmp".ID_AGENCIA,');
          SQL.Add('"col$causacionestmp".ID_COLOCACION');

{          try
            Open;
          except
            raise;
            Exit;
          end;
}
          IBQuery3.Close;
          IBQuery3.SQL.Clear;
          IBQuery3.SQL.Add('select');
          IBQuery3.SQL.Add('  "col$causacionestmp".ID_CLASIFICACION,');
          IBQuery3.SQL.Add('  "col$causacionestmp".ID_GARANTIA,');
          IBQuery3.SQL.Add('  "col$causacionestmp".ID_ARRASTRE,');
          IBQuery3.SQL.Add('  "col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery3.SQL.Add('  "col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery3.SQL.Add('  "col$categoria".DESCRIPCION_CATEGORIA,');
          IBQuery3.SQL.Add('  SUM(VALOR) as VALOR,');
          IBQuery3.SQL.Add('  SUM(DEUDA) as DEUDA,');
          IBQuery3.SQL.Add('  SUM(ANTICIPADOS) as ANTICIPADOS,');
          IBQuery3.SQL.Add('  SUM(CAUSADOS) as CAUSADOS,');
          IBQuery3.SQL.Add('  SUM(CONTINGENCIAS) as CONTINGENCIAS,');
          IBQuery3.SQL.Add('  SUM(APORTES) as APORTES,');
          IBQuery3.SQL.Add('  SUM(PCAPITAL) as PCAPITAL,');
          IBQuery3.SQL.Add('  SUM(PINTERES) as PINTERES,');
          IBQuery3.SQL.Add('  SUM(PCOSTAS) as PCOSTAS,');
          IBQuery3.SQL.Add('  SUM(CORTO_PL) as CORTO_PL,');
          IBQuery3.SQL.Add('  SUM(LARGO_PL) as LARGO_PL,');
          IBQuery3.SQL.Add('  SUM(COSTAS) as COSTAS');
          IBQuery3.SQL.Add('from');
          IBQuery3.SQL.Add('  "col$causacionestmp"');
          IBQuery3.SQL.Add('LEFT JOIN "col$clasificacion" ON ("col$causacionestmp".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          IBQuery3.SQL.Add('LEFT JOIN "col$garantia" ON ("col$causacionestmp".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          IBQuery3.SQL.Add('LEFT JOIN "col$categoria" ON ("col$causacionestmp".ID_ARRASTRE = "col$categoria".ID_CATEGORIA)');
          IBQuery3.SQL.Add('group by');
          IBQuery3.SQL.Add('  "col$causacionestmp".ID_CLASIFICACION,');
          IBQuery3.SQL.Add('  "col$causacionestmp".ID_GARANTIA,');
          IBQuery3.SQL.Add('  "col$causacionestmp".ID_ARRASTRE,');
          IBQuery3.SQL.Add('  "col$clasificacion".DESCRIPCION_CLASIFICACION,');
          IBQuery3.SQL.Add('  "col$garantia".DESCRIPCION_GARANTIA,');
          IBQuery3.SQL.Add('  "col$categoria".DESCRIPCION_CATEGORIA');
          IBQuery3.SQL.Add('order by');
          IBQuery3.SQL.Add('  "col$causacionestmp".ID_CLASIFICACION,');
          IBQuery3.SQL.Add('  "col$causacionestmp".ID_GARANTIA,');
          IBQuery3.SQL.Add('  "col$causacionestmp".ID_ARRASTRE');


        frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
        Reporte.Variables.ByName['Empresa'].AsString := Empresa;
        Reporte.Variables.ByName['Agencia'].AsInteger := Agencia;
        Reporte.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.Date;
        Reporte.Title := 'Calificación,Causación y Provisión de Colocaciones';
        if Reporte.PrepareReport then begin
          frmVistaPreliminar.Reporte := Reporte;
          frmVistaPreliminar.ShowModal;
        end;
       Transaction.Commit;
     end;
end;

procedure TfrmCausacionColocaciones.CmdAplicarClick(Sender: TObject);
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
           SQL.Add('select count(*) as TOTAL from "col$causaciones" where');
           SQL.Add('"col$causaciones".FECHA_CORTE = :FECHA_CORTE');
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
           SQL.Add('select * from "col$causaciones" where');
           SQL.Add('"col$causaciones".FECHA_CORTE = :FECHA_CORTE');
           SQL.Add('order by "col$causaciones".ID_AGENCIA,"col$causaciones".ID_COLOCACION');
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

procedure TfrmCausacionColocaciones.EdFechaCorteChange(Sender: TObject);
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
            RGProceso.Enabled := True;
            CmdAplicar.Enabled := False;
            CmdComprobante.Enabled := False;
            CmdImprimir.Enabled := False;
            CmdImprimirComprobante.Enabled := False;
          end
          else begin
            CmdProcesar.Enabled := False;
            RGProceso.Enabled := True;
            CmdAplicar.Enabled := True;
            CmdComprobante.Enabled := True;
            CmdImprimir.Enabled := True;
            CmdImprimirComprobante.Enabled := False;
          end;

          if FieldByName('APLICADA').AsInteger = 0 then begin
            CmdAplicar.Enabled := True;
            CmdComprobante.Enabled := False;
            CmdImprimir.Enabled := True;
            CmdImprimirComprobante.Enabled := False;
          end
          else begin
            CmdAplicar.Enabled := False;
            CmdComprobante.Enabled := True;
            CmdImprimir.Enabled := True;
            CmdImprimirComprobante.Enabled := False;
          end;

          if FieldByName('CONTABILIZADA').AsInteger = 0 then begin
            CmdComprobante.Enabled := True;
            CmdImprimirComprobante.Enabled := False;
          end
          else begin
            CmdComprobante.Enabled := False;
            CmdImprimirComprobante.Enabled := False;
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
            CmdImprimirComprobante.Enabled := False;
          end;
        end;

end;

procedure TfrmCausacionColocaciones.CmdComprobanteClick(Sender: TObject);
begin

        CmdComprobante.Enabled := False;
        Application.ProcessMessages;

        XSauxiliar.DefaultRowHeight := 16;
        xsauxiliar.ColWidths [0] := 112;
        xsauxiliar.ColWidths [1] := 190;
        xsauxiliar.ColWidths [2] := 100;
        xsauxiliar.ColWidths [3] := 100;
        xsauxiliar.Cols[0].Text  := 'Código';
        xsauxiliar.Cols[1].Text  := 'Nombre Cuenta';
        xsauxiliar.Cols[2].Text  := 'Débitos';
        xsauxiliar.Cols[3].Text  := 'Créditos';
        Edittotaldebito.Text := '';
        Edittotalcredito.Text := '';
        try
          Lista := Tlist.Create;
        finally
          Lista.Clear;
        end;
        PageControl1.ActivePageIndex := 1;
{
        PrimerPasoComprobante;   // Corto y Largo Plazo
        SegundoPasoComprobante;  // Ajustar Calificacion
        TercerPasoComprobante;   // Causacion de Intereses
        CuartoPasoComprobante;   // Provision de Capital de Colocaciones
        QuintoPasoComprobante;   // Provision de Interes de Colocaciones y Costas Judiciales
        SextoPasoComprobante;    // Provision General
        SeptimoPasoComprobante;  // Traslado de Intereses Anticipados
        OctavoPasoComprobante;   // Contingencias
        NovenoPasoComprobante;   // Ajustes
        DecimoPasoComprobante;   // Enviar Comprobante Contable
}
        PrimerPC;   // Corto y Largo Plazo
        SegundoPC;  // Ajustar Calificacion
        TercerPC;   // Causacion de Intereses
        CuartoPC;   // Provision de Capital de Colocaciones
        QuintoPC;   // Provision de Interes de Colocaciones y Costas Judiciales
        SextoPC;    // Provision General
        SeptimoPC;  // Traslado de Intereses Anticipados
        OctavoPC;   // Contingencias
        NovenoPC;   // Ajustes
        DecimoPC;   // Enviar Comprobante Contable

        CmdImprimirComprobante.Enabled := True;

end;

procedure TfrmCausacionColocaciones.PrimerPasoComprobante;
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

procedure TfrmCausacionColocaciones.ActualizarGrid;
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

procedure TfrmCausacionColocaciones.SegundoPasoComprobante;
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

procedure TfrmCausacionColocaciones.TercerPasoComprobante;
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

procedure TfrmCausacionColocaciones.CuartoPasoComprobante;
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

procedure TfrmCausacionColocaciones.QuintoPasoComprobante;
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

procedure TfrmCausacionColocaciones.SextoPasoComprobante;
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

procedure TfrmCausacionColocaciones.SeptimoPasoComprobante;
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

procedure TfrmCausacionColocaciones.OctavoPasoComprobante;
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

procedure TfrmCausacionColocaciones.PrimerPasoCausacion;
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
   //      end;

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
                Dias := DiasEntre(FechaInicial,FechaFinal);
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
                SQL.Add('insert into "col$causacionestmp" values(:ID_AGENCIA,');
                SQL.Add(':ID_COLOCACION,:FECHA_CORTE,:ID_CLASIFICACION,:ID_GARANTIA,:ID_EDAD,:ID_ARRASTRE,');
                SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,:FECHA_DESEMBOLSO,:VALOR,:DEUDA,:ID_TIPO_CUOTA,');
                SQL.Add(':FECHA_CAPITAL,:FECHA_INTERES,:TIPOC_INTERES,:AMORTIZA_CAPITAL,:AMORTIZA_INTERES,:TIPO_INTERES,');
                SQL.Add(':TASA_INTERES_CORRIENTE,:ID_INTERES,');
                SQL.Add(':VALOR_ACTUAL_TASA,:PUNTOS_INTERES,');
                SQL.Add(':DIAS,:TASA,:ANTICIPADOS,');
                SQL.Add(':CAUSADOS,:CONTINGENCIAS,:APORTES,:PCAPITAL,:PINTERES,');
                SQL.Add(':PCOSTAS,:CORTO_PL,:LARGO_PL,:COSTAS,:ID_ESTADO)');
                ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                ParamByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
                ParamByName('ID_EDAD').AsString := Edad;
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
            end; // fin de with
            IBQuery1.Transaction.Commit;
            IBQuery1.Close;
            frmPantallaProgreso.Cerrar;
            Application.ProcessMessages;
end;

procedure TfrmCausacionColocaciones.SegundoPasoCausacion;
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
begin
          with IBQuery1 do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
           Transaction.StartTransaction;

          Close;
          SQL.Clear;
          SQL.Add('select count(*) as TOTAL from "col$causacionestmp" where FECHA_CORTE = :FECHA_CORTE');
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

//       IBQuery1.Locate('ID_COLOCACION',VarArrayOf(['20020002417']),[locaseinsensitive]);
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
// Busco Tasa Maxima del Mes
//              if IBQuery1.FieldByName('ID_INTERES').AsInteger = 0 then
                 Tasa1 := BuscoTasaEfectivaMaximaNueva(IBQVarios,EdFechaCorte.Date);
//              else
//              if IBQuery1.FieldByName('ID_INTERES').AsInteger = 1 then
//                 Tasa1 := BuscoTasaEfectivaMaximaDtfNueva(IBQVarios,EdFechaCorte.Date)
//              else
//              if IBQuery1.FieldByName('ID_INTERES').AsInteger = 2 then
//                 Tasa1 := BuscoTasaEfectivaMaximaIPCNueva(IBQVarios);
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
//                  DiasANT := Dias * -1;
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

{                 if IBQuery1.FieldByName('ID_COLOCACION').AsString = '20020001857' then
                 begin
                     frmFechas := TfrmFechas.Create(Self);
                     frmFechas.Sg.RowCount := ListaFechas.Count;
                     for i := 0 to ListaFechas.Count - 1 do
                     begin
                       AFechas := ListaFechas.Items[i];
                       frmFechas.Sg.Cells[0,i] := DateToStr(AFechas^.FechaInicial);
                       frmFechas.Sg.Cells[1,i] := DateToStr(AFechas^.FechaFinal);
                     end;
                     frmFechas.ShowModal;
                     frmFechas.Free;
                 end;
 }
                 Causados := 0;
                 Contingentes := 0;
                 DiasCXC := 0;
                 DiasCON := 0;
                 for i := 0 to ListaFechas.Count - 1 do begin
                   AFechas := ListaFechas.Items[i];
                    if IBQuery1.FieldByName('ID_INTERES').AsInteger = 0 then begin
                       Tasa := BuscoTasaEfectivaMaximaNueva(IBQVarios,AFechas.FechaFinal);
                       if IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat < Tasa then
                          Tasa :=IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                      end
                    else
                    if IBQuery1.FieldByName('ID_INTERES').AsInteger = 1 then begin
                       Tasa := BuscoTasaEfectivaMaximaDtfNueva(IBQVarios,AFechas.FechaFinal);
                       if IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat < Tasa then
                          Tasa :=IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                      end
                    else
                    if IBQuery1.FieldByName('ID_INTERES').AsInteger = 2 then begin
                       Tasa := BuscoTasaEfectivaMaximaIPCNueva(IBQVarios);
                       if IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat < Tasa then
                          Tasa :=IBQuery1.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
                      end;

                    if IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'E' then
                       Tasa := Tasa1;

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
                    
                    if IBQuery1.FieldByName('ID_ARRASTRE').AsString <> 'E' then
                       Tasa := Tasa + IBQuery1.FieldByName('PUNTOS_INTERES').AsFloat;

{                    DecodeDate(AFechas^.FechaInicial,Ano,Mes,Dia);
                    if ((Int(IncDay(FechaInicial)) = Int(AFechas^.FechaInicial)) and (Mes=3) and (Dia=1)) then
                       Bisiesto := True
                    else
}
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

// Calculo Tasa sobre la cual liquidar
{            if IBQuery1.FieldByName('TIPO_INTERES').AsString = 'F' then begin
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
}
// Fin Calculo Tasa
// Buscar Tasa Anticipada
            if DiasANT < 0 then begin
               TasaAnt := BuscoTasaAnt(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,IBQuery1.FieldByName('FECHA_INTERES').AsDateTime);
               if TasaAnt = 0 then begin
                 case IBQuery1.FieldByName('ID_INTERES').AsInteger of
                     0 : begin
                           TasaAnt := BuscoTasaEfectivaMaximaNueva(IBQVarios,EdFechaCorte.Date);
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
                    SQL.Add('update "col$causacionestmp" SET ID_ARRASTRE = :ID_ARRASTRE,TASA = :TASA,');
                    SQL.Add('ANTICIPADOS = :ANTICIPADOS,CAUSADOS = :CAUSADOS,CONTINGENCIAS = :CONTINGENCIAS,');
                    SQL.Add('PCAPITAL = :PCAPITAL, PINTERES = :PINTERES, PCOSTAS = :PCOSTAS, APORTES = :APORTES, COSTAS = :COSTAS,');
                    SQL.Add('CORTO_PL = :CORTO_PL, LARGO_PL = :LARGO_PL');
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

procedure TfrmCausacionColocaciones.NovenoPasoComprobante;
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

procedure TfrmCausacionColocaciones.DecimoPasoComprobante;
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
       CmdImprimirComprobante.Enabled := True;
end;

procedure TfrmCausacionColocaciones.TercerPasoCausacion;
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
              SQL.Add('insert into "col$causaciones" select * from "col$causacionestmp"');
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

procedure TfrmCausacionColocaciones.CmdImprimirComprobanteClick(
  Sender: TObject);
begin
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
//          end;
         except
          MessageDlg('Error al generar el reporte',mtError,[mbcancel],0);
         end;
         Transaction.Commit;
        end;

end;

function TfrmCausacionColocaciones.BuscoTasaAnt(Ag: integer;
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

procedure TfrmCausacionColocaciones.PrimerPC;
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
{
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
}
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
{
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
                     end;
}
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

procedure TfrmCausacionColocaciones.SegundoPC;
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
                 IBSQL2.SQL.Add('select SUM("col$causaciones".DEUDA) AS DEUDA');
                 IBSQL2.SQL.Add('from "col$causaciones"');
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
                 IBSQL2.SQL.Add('select SUM("col$causaciones".COSTAS) AS COSTAS');
                 IBSQL2.SQL.Add('from "col$causaciones"');
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

procedure TfrmCausacionColocaciones.TercerPC;
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
                 IBSQL2.SQL.Add('select SUM("col$causaciones".CAUSADOS) AS CAUSADOS');
                 IBSQL2.SQL.Add('from "col$causaciones"');
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

procedure TfrmCausacionColocaciones.CuartoPC;
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
                 IBSQL2.SQL.Add('select SUM("col$causaciones".PCAPITAL) AS PCAPITAL');
                 IBSQL2.SQL.Add('from "col$causaciones"');
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

               if Comercial <> 0 then
               begin
                if Comercial < 0 then
                   Codigo := CodigoE
                else
                   Codigo := CodigoI;
               end;
//               Codigo := '511510000000000000';
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

               if Consumo <> 0 then
               begin
                if Consumo < 0 then
                   Codigo := CodigoE
                else
                   Codigo := CodigoI;
               end;
//               Codigo := '511515000000000000';

               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

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

               if Vivienda <> 0 then
               begin
                if Vivienda < 0 then
                   Codigo := CodigoE
                else
                   Codigo := CodigoI;
               end;

               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

//               Codigo := '511520000000000000';
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

               if Microcredito <> 0 then
               begin
                if Microcredito < 0 then
                   Codigo := CodigoE
                else
                   Codigo := CodigoI;
               end;

               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('select NOMBRE from "con$puc" where CODIGO = :CODIGO');

//               Codigo := '511523000000000000';
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
                 if Vivienda < 0 then begin
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

procedure TfrmCausacionColocaciones.QuintoPC;
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
                 IBSQL2.SQL.Add('select SUM("col$causaciones".PINTERES) AS PINTERES');
                 IBSQL2.SQL.Add('from "col$causaciones"');
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
                 IBSQL2.SQL.Add('select SUM("col$causaciones".PCOSTAS) AS PCOSTAS');
                 IBSQL2.SQL.Add('from "col$causaciones"');
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
                IBSQL1.Transaction.Commit;
end;

procedure TfrmCausacionColocaciones.SextoPC;
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

procedure TfrmCausacionColocaciones.SeptimoPC;
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
                 IBSQL2.SQL.Add('select SUM("col$causaciones".ANTICIPADOS) AS ANTICIPADOS');
                 IBSQL2.SQL.Add('from "col$causaciones"');
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
                Actualizargrid;
                IBSQL1.Transaction.Commit;
end;

procedure TfrmCausacionColocaciones.OctavoPC;
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
                 IBSQL2.SQL.Add('select SUM("col$causaciones".CONTINGENCIAS) AS CONTINGENCIAS');
                 IBSQL2.SQL.Add('from "col$causaciones"');
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

procedure TfrmCausacionColocaciones.NovenoPC;
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

procedure TfrmCausacionColocaciones.DecimoPC;
var I:Integer;
    TotalDebito:Currency;
    TotalCredito:Currency;
    ARecord:PList;
    FechaComp:TDate;
begin

      FechaComp := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DaysInAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date)));
      Consecutivo := ObtenerConsecutivo(IBSQL1,1);
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
        try
         Transaction.Commit;
        except
         Transaction.Rollback;
         raise;
         Exit;
        end;
       end;
       CmdImprimirComprobante.Enabled := True;
end;

end.

