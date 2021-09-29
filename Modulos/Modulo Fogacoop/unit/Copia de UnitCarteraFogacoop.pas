unit UnitCarteraFogacoop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, DateUtils,
  Grids, XStringGrid, ExtCtrls, ComCtrls, IBSQL, StrUtils, pr_Common,
  pr_TxClasses, Math, pr_parser, Printers, IBDatabase;

type
  TfrmCarteraFogacoop = class(TForm)
    GridColocaciones: TXStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    Panel5: TPanel;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    CmdReporte: TBitBtn;
    IBQuery3: TIBQuery;
    IBQuery3CLASIFICACION: TIntegerField;
    IBQuery3MES: TIntegerField;
    IBQuery3SALDO: TIBBCDField;
    IBQuery3CAPITAL: TIBBCDField;
    IBQuery3INTERES: TIBBCDField;
    Reporte: TprTxReport;
    IBQTasa: TIBQuery;
    IBTransaction2: TIBTransaction;
    procedure EdFechaCorteEnter(Sender: TObject);
    procedure EdFechaCorteExit(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarteraFogacoop: TfrmCarteraFogacoop;
  FechaCorte : TDate;
  TasaFijaE : Double;
  TasaDtfE : Double;
  TasaIpcE : Double;

  Tasa : Double;
  Mes : Integer ;
  Ano : Integer;

implementation

{$R *.dfm}

uses unitdmGeneral, Unitglobales, UnitVistaPreliminar,
     unitglobalescol, UnitDmcolocacion, UnitPantallaProgreso;

procedure TfrmCarteraFogacoop.EdFechaCorteEnter(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

procedure TfrmCarteraFogacoop.EdFechaCorteExit(Sender: TObject);
begin
        FechaCorte := EdFechaCorte.Date;
end;

procedure TfrmCarteraFogacoop.CmdProcesarClick(Sender: TObject);
var Fecha:TDate;
    FechaaPagar : TDate;
    CapitalaPagar : Currency;
    InteresaPagar : Currency;
    InteresCalculado : Currency;
    TipoInteres : string;
    TipoCuota : Integer;
    TipoTasa : Integer;
    TipoCredito : string;
    Saldo : Currency;
    cambio : Boolean;
    Colocacion : string;
    Clasificacion : Integer;
    FechaCapital : TDate;
    FechaInteres : TDate;
    AmortizaK : Integer;
    AmortizaI : Integer;
    Amortizacion : Integer;
    Conteo : Integer;
    Save_Cursor:TCursor;
    Total : Integer;
    I,J,K : Integer;
    TCapital : Currency;
    TInteres : Currency;
    TSaldo : Currency;
    TCuotas : Integer;
    MesUno : String;
    MesDos : String;
    MesTres : String;
    MesCuatro : String;
    MesCinco : String;
    MesSeis : String;
    MesSiete : String;
    MesOcho : String;
    MesNueve : String;
    MesDiez : String;
    MesOnce : String;
    MesDoce : String;
    AnoFP : Integer;
    MesFP : Integer;
    MesTabla : Integer;
    MesContador : Integer;
begin
        Mes := MonthOf(FechaCorte);
        Ano := YearOf(FechaCorte);
        MesContador := Mes;
        for I := 1 to 12 do
         begin
           MesContador := MesContador + 1;
           if MesContador > 12 then
            begin
              Ano := Ano + 1;
              MesContador := 1;
            end;
           with IBQuery1 do begin
            Close;
            SQL.Clear;
            SQL.Add('update "col$carteraf" set');
            SQL.Add('"col$carteraf".ANOMES = :"ANOMES"');
            SQL.Add('where "col$carteraf".MES = :"MES"');
            ParamByName('ANOMES').AsString := CurrToStr(Ano) + FormatCurr('00',MesContador);
            ParamByName('MES').AsInteger := I;
            Open;
            Close;
           end;
           IBQuery1.Transaction.CommitRetaining;
         end;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('update "col$carteraf" set');
          SQL.Add('"col$carteraf".SALDO = 0,');
          SQL.Add('"col$carteraf".CAPITAL = 0,');
          SQL.Add('"col$carteraf".INTERES = 0');
          Open;
          Close;
        end;

        IBQuery1.Transaction.CommitRetaining;
        
        CmdProcesar.Enabled := False;
        Application.ProcessMessages;

        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        TasaFijaE := BuscoTasaEfectivaMaxima(FechaCorte);
        TasaDtfE := buscotasaefectivamaximadtf(FechaCorte);
        TasaIpcE := BuscoTasaEfectivaMaximaIPCNueva(IBQTasa);

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('where ID_ESTADO_COLOCACION <= 2 and');
          SQL.Add('(ID_EVALUACION = :"ID_EVALUACION1" or');
          SQL.Add('ID_EVALUACION = :"ID_EVALUACION2" or');
          SQL.Add('ID_EVALUACION = :"ID_EVALUACION3")');
          ParamByName('ID_EVALUACION1').AsString := 'A';
          ParamByName('ID_EVALUACION2').AsString := 'B';
          ParamByName('ID_EVALUACION2').AsString := 'C';
          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;

        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Buscando Colocaciones';
        frmProgreso.Min := 0;
        frmProgreso.Max := Total;
        frmProgreso.Position := 0;
        frmProgreso.Ejecutar;

// Ocaña
        with IBQuery1 do begin
         SQL.Clear;
         SQL.Add('SELECT ');
         SQL.Add('"col$colocacion".ID_COLOCACION,');
         SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
         SQL.Add('"col$colocacion".ID_CLASIFICACION,');
         SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
         SQL.Add('"col$colocacion".ID_INTERES,');
         SQL.Add('"col$colocacion".FECHA_CAPITAL,');
         SQL.Add('"col$colocacion".FECHA_INTERES,');
         SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
         SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
         SQL.Add('"col$tiposcuota".INTERES,');
         SQL.Add('"col$tiposcuota".TIPO_CUOTA');
         SQL.Add('FROM');
         SQL.Add('"col$colocacion"');
         SQL.Add('inner join "col$tiposcuota" on ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
         SQL.Add('where');
         SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION <= 2 and');
         SQL.Add('("col$colocacion".ID_EVALUACION = :"ID_EVALUACION1" or');
         SQL.Add('"col$colocacion".ID_EVALUACION = :"ID_EVALUACION2" or');
         SQL.Add('"col$colocacion".ID_EVALUACION = :"ID_EVALUACION3")');
         SQL.Add('Order by "col$colocacion".ID_COLOCACION');
         ParamByName('ID_EVALUACION1').AsString := 'A';
         ParamByName('ID_EVALUACION2').AsString := 'B';
         ParamByName('ID_EVALUACION2').AsString := 'C';
         Open;
         while not IBQuery1.Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
            Application.ProcessMessages;
            Saldo := FieldByName('SALDO').AsCurrency;
            TSaldo := Saldo;            
            Colocacion := FieldByName('ID_COLOCACION').AsString;
            Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
            TipoInteres := FieldByName('INTERES').AsString;
            TipoCuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
            TipoTasa := FieldByName('ID_INTERES').AsInteger;
            TipoCredito := FieldByName('TIPO_CUOTA').AsString;
            FechaCapital := FieldByName('FECHA_CAPITAL').AsDateTime;
            FechaInteres := FieldByName('FECHA_INTERES').AsDateTime;
            AmortizaK := FieldByName('AMORTIZA_CAPITAL').AsInteger;
            AmortizaI := FieldByName('AMORTIZA_INTERES').AsInteger;
            cambio := False;
            TCapital := 0;
            TInteres := 0;
            TCuotas := 0;
            if AmortizaK < AmortizaI then
               Amortizacion := AmortizaK
            else
               Amortizacion := AmortizaI;

            if TipoInteres = 'V' then
             begin
               if TipoTasa = 0 then Tasa := TasaNominalVencida(TasaFijaE,amortizacion)
               else if TipoTasa = 1 then Tasa := TasaNominalVencida(TasaDtfE,amortizacion)
               else if TipoTasa = 2 then Tasa := TasaNominalVencida(TasaIpcE,amortizacion);
             end
            else
             begin
               if TipoTasa = 0 then Tasa := TasaNominalAnticipada(TasaFijaE,amortizacion)
               else if TipoTasa = 1 then Tasa := TasaNominalAnticipada(TasaDtfE,amortizacion)
               else if TipoTasa = 2 then Tasa := TasaNominalAnticipada(TasaIpcE,amortizacion);
             end;

            IBQuery2.Close;
            IBQuery2.SQL.Clear;
            IBQuery2.SQL.Add('select ');
            IBQuery2.SQL.Add('"col$tablaliquidacion".ID_COLOCACION,');
            IBQuery2.SQL.Add('"col$tablaliquidacion".FECHA_A_PAGAR,');
            IBQuery2.SQL.Add('"col$tablaliquidacion".CAPITAL_A_PAGAR,');
            IBQuery2.SQL.Add('"col$tablaliquidacion".INTERES_A_PAGAR');
            IBQuery2.SQL.Add('from "col$tablaliquidacion"');
            IBQuery2.SQL.Add('where ');
            IBQuery2.SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION" and');
            IBQuery2.SQL.Add('"col$tablaliquidacion".PAGADA = 0 and');
            IBQuery2.SQL.Add('"col$tablaliquidacion".FECHA_A_PAGAR <= :"FECHA"');
            IBQuery2.ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
            IBQuery2.ParamByName('FECHA').AsDate := CalculoFecha(FechaCorte,360);
            IBQuery2.Open;
            
            while not IBQuery2.Eof do
             begin
               if Saldo <= 0 then Break;
               FechaaPagar := IBQuery2.FieldByName('FECHA_A_PAGAR').AsDateTime;
               CapitalaPagar := abs(SimpleRoundTo(IBQuery2.FieldByName('CAPITAL_A_PAGAR').AsCurrency,0));
               InteresaPagar := abs(SimpleRoundTo(IBQuery2.FieldByName('INTERES_A_PAGAR').AsCurrency,0));
//               if Saldo < CapitalaPagar then CapitalaPagar := Saldo;
               if Colocacion <> IBQuery2.FieldByName('ID_COLOCACION').AsString then cambio := True;
               if cambio = False then
                  Saldo := Saldo - CapitalaPagar
               else
                  Saldo := 0;

               if TipoInteres = 'A' then Saldo := Saldo - CapitalaPagar;
               InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);


               TCapital := TCapital + CapitalaPagar;
               TInteres := TInteres + InteresaPagar;
               TCuotas := TCuotas + 1;
               IBQuery2.Next;

               IBSQL1.Close;
               IBSQL1.SQL.Clear;
               IBSQL1.SQL.Add('update "col$carteraf" set');
               IBSQL1.SQL.Add('SALDO = SALDO + :SALDO,');
               IBSQL1.SQL.Add('CAPITAL = CAPITAL + :CAPITAL,');
               IBSQL1.SQL.Add('INTERES = INTERES + :INTERES');
               IBSQL1.SQL.Add('where');
               IBSQL1.SQL.Add('"col$carteraf".CLASIFICACION = :"CLASIFICACION" and');
               IBSQL1.SQL.Add('"col$carteraf".ANOMES = :"ANOMES"');
               IBSQL1.ParamByName('CLASIFICACION').AsInteger := Clasificacion;
               IBSQL1.ParamByName('ANOMES').AsString := FormatCurr('0000',yearof(FechaaPagar)) + FormatCurr('00',MonthOf(FechaaPagar));
               IBSQL1.ParamByName('SALDO').AsCurrency := abs(Saldo);
               IBSQL1.ParamByName('CAPITAL').AsCurrency := abs(CapitalaPagar);
               IBSQL1.ParamByName('INTERES').AsCurrency := abs(InteresCalculado);
               IBSQL1.ExecQuery;
               IBSQL1.Transaction.CommitRetaining;

             end; // fin while tabla liquidacion

            Conteo := Conteo + 1;
            GridColocaciones.RowCount := Conteo + 1;
            GridColocaciones.Cells[0,Conteo] := Colocacion;
            GridColocaciones.Cells[1,Conteo] := FormatCurr('$#,##0',TSaldo);
            GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',TCapital);
            GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',TInteres);
            GridColocaciones.Cells[4,Conteo] := DateToStr(FechaaPagar);
            GridColocaciones.Cells[5,Conteo] := IntToStr(TCuotas);
            Next;
          end; //fin de while colocaciones
          frmProgreso.Cerrar;
          Transaction.Commit;
          Transaction.StartTransaction;
        end; // fin with
//fin Ocaña

    Screen.Cursor := Save_Cursor;
    CmdReporte.Enabled := True;
end;

procedure TfrmCarteraFogacoop.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
end;

procedure TfrmCarteraFogacoop.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmCarteraFogacoop.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCarteraFogacoop.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

procedure TfrmCarteraFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCarteraFogacoop.CmdReporteClick(Sender: TObject);
begin
        with IBQuery3 do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$carteraf"');
           Open;

           Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
           Reporte.Variables.ByName['NIT'].AsString := Nit;

           if Reporte.PrepareReport then
            begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Reporte;
              frmVistaPreliminar.ShowModal;
            end;

           Close;
         end;


end;

end.

        Mes := MonthOf(FechaCorte);
        MesUno := Mes + 1;
        MesDos := Mes + 2;
        MesTres := Mes + 3;
        MesCuatro := Mes + 4;
        MesCinco := Mes + 5;
        MesSeis := Mes + 6;
        MesSiete := Mes + 7;
        MesOcho := Mes + 8;
        MesNueve := Mes + 9;
        MesDiez := Mes + 10;
        MesOnce := Mes + 11;
        MesDoce := Mes + 12;



        CarteraCom := TList.Create;
        CarteraCons := TList.Create;
        CarteraViv := TList.Create;

        New(com);
        Com^.MesUno := 1;
        Com^.CapitalUno := 0;
        Com^.InteresUno := 0;
        Com^.SaldoUno := 0;

        Com^.MesDos := 2;
        Com^.CapitalDos := 0;
        Com^.InteresDos := 0;
        Com^.SaldoDos := 0;

        Com^.MesTres := 3;
        Com^.CapitalTres := 0;
        Com^.InteresTres := 0;
        Com^.SaldoTres := 0;

        Com^.MesCuatro := 4;
        Com^.CapitalCuatro := 0;
        Com^.InteresCuatro := 0;
        Com^.SaldoCuatro := 0;

        Com^.MesCinco := 5;
        Com^.CapitalCinco := 0;
        Com^.InteresCinco := 0;
        Com^.SaldoCinco := 0;

        Com^.MesSeis := 6;
        Com^.CapitalSeis := 0;
        Com^.InteresSeis := 0;
        Com^.SaldoSeis := 0;

        Com^.MesSiete := 7;
        Com^.CapitalSiete := 0;
        Com^.InteresSiete := 0;
        Com^.SaldoSiete := 0;

        Com^.MesOcho := 8;
        Com^.CapitalOcho := 0;
        Com^.InteresOcho := 0;
        Com^.SaldoOcho := 0;

        Com^.MesNueve := 9;
        Com^.CapitalNueve := 0;
        Com^.InteresNueve := 0;
        Com^.SaldoNueve := 0;

        Com^.MesDiez := 10;
        Com^.CapitalDiez := 0;
        Com^.InteresDiez := 0;
        Com^.SaldoDiez := 0;

        Com^.MesOnce := 11;
        Com^.CapitalOnce := 0;
        Com^.InteresOnce := 0;
        Com^.SaldoOnce := 0;

        Com^.MesDoce := 12;
        Com^.CapitalDoce := 0;
        Com^.InteresDoce := 0;
        Com^.SaldoDoce := 0;

        New(Cons);
        Cons^.MesUno := 1;
        Cons^.CapitalUno := 0;
        Cons^.InteresUno := 0;
        Cons^.SaldoUno := 0;

        Cons^.MesDos := 2;
        Cons^.CapitalDos := 0;
        Cons^.InteresDos := 0;
        Cons^.SaldoDos := 0;

        Cons^.MesTres := 3;
        Cons^.CapitalTres := 0;
        Cons^.InteresTres := 0;
        Cons^.SaldoTres := 0;

        Cons^.MesCuatro := 4;
        Cons^.CapitalCuatro := 0;
        Cons^.InteresCuatro := 0;
        Cons^.SaldoCuatro := 0;

        Cons^.MesCinco := 5;
        Cons^.CapitalCinco := 0;
        Cons^.InteresCinco := 0;
        Cons^.SaldoCinco := 0;

        Cons^.MesSeis := 6;
        Cons^.CapitalSeis := 0;
        Cons^.InteresSeis := 0;
        Cons^.SaldoSeis := 0;

        Cons^.MesSiete := 7;
        Cons^.CapitalSiete := 0;
        Cons^.InteresSiete := 0;
        Cons^.SaldoSiete := 0;

        Cons^.MesOcho := 8;
        Cons^.CapitalOcho := 0;
        Cons^.InteresOcho := 0;
        Cons^.SaldoOcho := 0;

        Cons^.MesNueve := 9;
        Cons^.CapitalNueve := 0;
        Cons^.InteresNueve := 0;
        Cons^.SaldoNueve := 0;

        Cons^.MesDiez := 10;
        Cons^.CapitalDiez := 0;
        Cons^.InteresDiez := 0;
        Cons^.SaldoDiez := 0;

        Cons^.MesOnce := 11;
        Cons^.CapitalOnce := 0;
        Cons^.InteresOnce := 0;
        Cons^.SaldoOnce := 0;

        Cons^.MesDoce := 12;
        Cons^.CapitalDoce := 0;
        Cons^.InteresDoce := 0;
        Cons^.SaldoDoce := 0;


        New(Viv);
        Viv^.MesUno := 1;
        Viv^.CapitalUno := 0;
        Viv^.InteresUno := 0;
        Viv^.SaldoUno := 0;

        Viv^.MesDos := 2;
        Viv^.CapitalDos := 0;
        Viv^.InteresDos := 0;
        Viv^.SaldoDos := 0;

        Viv^.MesTres := 3;
        Viv^.CapitalTres := 0;
        Viv^.InteresTres := 0;
        Viv^.SaldoTres := 0;

        Viv^.MesCuatro := 4;
        Viv^.CapitalCuatro := 0;
        Viv^.InteresCuatro := 0;
        Viv^.SaldoCuatro := 0;

        Viv^.MesCinco := 5;
        Viv^.CapitalCinco := 0;
        Viv^.InteresCinco := 0;
        Viv^.SaldoCinco := 0;

        Viv^.MesSeis := 6;
        Viv^.CapitalSeis := 0;
        Viv^.InteresSeis := 0;
        Viv^.SaldoSeis := 0;

        Viv^.MesSiete := 7;
        Viv^.CapitalSiete := 0;
        Viv^.InteresSiete := 0;
        Viv^.SaldoSiete := 0;

        Viv^.MesOcho := 8;
        Viv^.CapitalOcho := 0;
        Viv^.InteresOcho := 0;
        Viv^.SaldoOcho := 0;

        Viv^.MesNueve := 9;
        Viv^.CapitalNueve := 0;
        Viv^.InteresNueve := 0;
        Viv^.SaldoNueve := 0;

        Viv^.MesDiez := 10;
        Viv^.CapitalDiez := 0;
        Viv^.InteresDiez := 0;
        Viv^.SaldoDiez := 0;

        Viv^.MesOnce := 11;
        Viv^.CapitalOnce := 0;
        Viv^.InteresOnce := 0;
        Viv^.SaldoOnce := 0;

        Viv^.MesDoce := 12;
        Viv^.CapitalDoce := 0;
        Viv^.InteresDoce := 0;
        Viv^.SaldoDoce := 0;



               if Clasificacion = 1 then
                begin
                  if MonthOf(FechaaPagar) = MesUno then
                   begin
                     InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
//                     Com := CarteraCom.Items[2];
                     Com^.CapitalUno := Com^.CapitalUno + CapitalaPagar;
//                     Com := CarteraCom.Items[3];
                     Com^.InteresUno := Com^.InteresUno + InteresCalculado;
//                     Com := CarteraCom.Items[4];
                     Com^.SaldoUno := Com^.SaldoUno + Saldo;
                   end;
                  if MonthOf(FechaaPagar) = MesDos then
                   begin
                     InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
//                     Com := CarteraCom.Items[6];
                     Com^.CapitalDos := Com^.CapitalDos + CapitalaPagar;
//                     Com := CarteraCom.Items[7];
                     Com^.InteresDos := Com^.InteresDos + InteresCalculado;
//                       Com := CarteraCom.Items[8];
                       Com^.SaldoDos := Com^.SaldoDos + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesTres then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Com := CarteraCom.Items[10];
                       Com^.CapitalTres := Com^.CapitalTres + CapitalaPagar;
//                       Com := CarteraCom.Items[11];
                       Com^.InteresTres := Com^.InteresTres + InteresCalculado;
//                       Com := CarteraCom.Items[12];
                       Com^.SaldoTres := Com^.SaldoTres + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesCuatro then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Com := CarteraCom.Items[14];
                       Com^.CapitalCuatro := Com^.CapitalCuatro + CapitalaPagar;
//                       Com := CarteraCom.Items[15];
                       Com^.InteresCuatro := Com^.InteresCuatro + InteresCalculado;
 //                      Com := CarteraCom.Items[16];
                       Com^.SaldoCuatro := Com^.SaldoCuatro + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesCinco then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Com := CarteraCom.Items[18];
                       Com^.CapitalCinco := Com^.CapitalCinco + CapitalaPagar;
 //                      Com := CarteraCom.Items[19];
                       Com^.InteresCinco := Com^.InteresCinco + InteresCalculado;
 //                      Com := CarteraCom.Items[20];
                       Com^.SaldoCinco := Com^.SaldoCinco + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesSeis then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Com := CarteraCom.Items[22];
                       Com^.CapitalSeis := Com^.CapitalSeis + CapitalaPagar;
 //                      Com := CarteraCom.Items[23];
                       Com^.InteresSeis := Com^.InteresSeis + InteresCalculado;
//                       Com := CarteraCom.Items[24];
                       Com^.SaldoSeis := Com^.SaldoSeis + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesSiete then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
//                       Com := CarteraCom.Items[26];
                       Com^.CapitalSiete := Com^.CapitalSiete + CapitalaPagar;
//                       Com := CarteraCom.Items[27];
                       Com^.InteresSiete := Com^.InteresSiete + InteresCalculado;
//                       Com := CarteraCom.Items[28];
                       Com^.SaldoSiete := Com^.SaldoSiete + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesOcho then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Com := CarteraCom.Items[30];
                       Com^.CapitalOcho := Com^.CapitalOcho + CapitalaPagar;
 //                      Com := CarteraCom.Items[31];
                       Com^.InteresOcho := Com^.InteresOcho + InteresCalculado;
 //                      Com := CarteraCom.Items[32];
                       Com^.SaldoOcho := Com^.SaldoOcho + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesNueve then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
  //                     Com := CarteraCom.Items[34];
                       Com^.CapitalNueve := Com^.CapitalNueve + CapitalaPagar;
 //                      Com := CarteraCom.Items[35];
                       Com^.InteresNueve := Com^.InteresNueve + InteresCalculado;
 //                      Com := CarteraCom.Items[36];
                       Com^.SaldoNueve := Com^.SaldoNueve + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesDiez then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Com := CarteraCom.Items[38];
                       Com^.CapitalDiez := Com^.CapitalDiez + CapitalaPagar;
//                       Com := CarteraCom.Items[39];
                       Com^.InteresDiez := Com^.InteresDiez + InteresCalculado;
 //                      Com := CarteraCom.Items[40];
                       Com^.SaldoDiez := Com^.SaldoDiez + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesOnce then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Com := CarteraCom.Items[42];
                       Com^.CapitalOnce := Com^.CapitalOnce + CapitalaPagar;
 //                      Com := CarteraCom.Items[43];
                       Com^.InteresOnce := Com^.InteresOnce + InteresCalculado;
 //                      Com := CarteraCom.Items[44];
                       Com^.SaldoOnce := Com^.SaldoOnce + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesDoce then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Com := CarteraCom.Items[46];
                       Com^.CapitalDoce := Com^.CapitalDoce + CapitalaPagar;
//                       Com := CarteraCom.Items[47];
                       Com^.InteresDoce := Com^.InteresDoce + InteresCalculado;
//                       Com := CarteraCom.Items[48];
                       Com^.SaldoDoce := Com^.SaldoDoce + Saldo;
                     end;
                end
               else
                if Clasificacion = 2 then
                 begin
                    if MonthOf(FechaaPagar) = MesUno then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
//                       Cons := CarteraCons.Items[2];
                       Cons^.CapitalUno := Cons^.CapitalUno + CapitalaPagar;
//                       Cons := CarteraCons.Items[3];
                       Cons^.InteresUno := Cons^.InteresUno + InteresCalculado;
//                       Cons := CarteraCons.Items[4];
                       Cons^.SaldoUno := Cons^.SaldoUno + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesDos then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Cons := CarteraCons.Items[6];
                       Cons^.CapitalDos := Cons^.CapitalDos + CapitalaPagar;
//                       Cons := CarteraCons.Items[7];
                       Cons^.InteresDos := Cons^.InteresDos + InteresCalculado;
//                       Cons := CarteraCons.Items[8];
                       Cons^.SaldoDos := Cons^.SaldoDos + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesTres then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
  //                     Cons := CarteraCons.Items[10];
                       Cons^.CapitalTres := Cons^.CapitalTres + CapitalaPagar;
 //                      Cons := CarteraCons.Items[11];
                       Cons^.InteresTres := Cons^.InteresTres + InteresCalculado;
//                       Cons := CarteraCons.Items[12];
                       Cons^.SaldoTres := Cons^.SaldoTres + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesCuatro then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
//                       Cons := CarteraCons.Items[14];
                       Cons^.CapitalCuatro := Cons^.CapitalCuatro + CapitalaPagar;
//                       Cons := CarteraCons.Items[15];
                       Cons^.InteresCuatro := Cons^.InteresCuatro + InteresCalculado;
//                       Cons := CarteraCons.Items[16];
                       Cons^.SaldoCuatro := Cons^.SaldoCuatro + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesCinco then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Cons := CarteraCons.Items[18];
                       Cons^.CapitalCinco := Cons^.CapitalCinco + CapitalaPagar;
 //                      Cons := CarteraCons.Items[19];
                       Cons^.InteresCinco := Cons^.InteresCinco + InteresCalculado;
//                       Cons := CarteraCons.Items[20];
                       Cons^.SaldoCinco := Cons^.SaldoCinco + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesSeis then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
//                       Cons := CarteraCons.Items[22];
                       Cons^.CapitalSeis := Cons^.CapitalSeis + CapitalaPagar;
 //                      Cons := CarteraCons.Items[23];
                       Cons^.InteresSeis := Cons^.InteresSeis + InteresCalculado;
//                       Cons := CarteraCons.Items[24];
                       Cons^.SaldoSeis := Cons^.SaldoSeis + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesSiete then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
//                       Cons := CarteraCons.Items[26];
                       Cons^.CapitalSiete := Cons^.CapitalSiete + CapitalaPagar;
 //                      Cons := CarteraCons.Items[27];
                       Cons^.InteresSiete := Cons^.InteresSiete + InteresCalculado;
//                       Cons := CarteraCons.Items[28];
                       Cons^.SaldoSiete := Cons^.SaldoSiete + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesOcho then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Cons := CarteraCons.Items[30];
                       Cons^.CapitalOcho := Cons^.CapitalOcho + CapitalaPagar;
//                       Cons := CarteraCons.Items[31];
                       Cons^.InteresOcho := Cons^.InteresOcho + InteresCalculado;
 //                      Cons := CarteraCons.Items[32];
                       Cons^.SaldoOcho := Cons^.SaldoOcho + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesNueve then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Cons := CarteraCons.Items[34];
                       Cons^.CapitalNueve := Cons^.CapitalNueve + CapitalaPagar;
//                       Cons := CarteraCons.Items[35];
                       Cons^.InteresNueve := Cons^.InteresNueve + InteresCalculado;
 //                      Cons := CarteraCons.Items[36];
                       Cons^.SaldoNueve := Cons^.SaldoNueve + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesDiez then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Cons := CarteraCons.Items[38];
                       Cons^.CapitalDiez := Cons^.CapitalDiez + CapitalaPagar;
//                       Cons := CarteraCons.Items[39];
                       Cons^.InteresDiez := Cons^.InteresDiez + InteresCalculado;
 //                      Cons := CarteraCons.Items[40];
                       Cons^.SaldoDiez := Cons^.SaldoDiez + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesOnce then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
  //                     Cons := CarteraCons.Items[42];
                       Cons^.CapitalOnce := Cons^.CapitalOnce + CapitalaPagar;
  //                     Cons := CarteraCons.Items[43];
                       Cons^.InteresOnce := Cons^.InteresOnce + InteresCalculado;
  //                     Cons := CarteraCons.Items[44];
                       Cons^.SaldoOnce := Cons^.SaldoOnce + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesDoce then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
   //                    Cons := CarteraCons.Items[46];
                       Cons^.CapitalDoce := Cons^.CapitalDoce + CapitalaPagar;
//                       Cons := CarteraCons.Items[47];
                       Cons^.InteresDoce := Cons^.InteresDoce + InteresCalculado;
   //                    Cons := CarteraCons.Items[48];
                       Cons^.SaldoDoce := Cons^.SaldoDoce + Saldo;
                     end;
                 end
                else
                 if Clasificacion = 3 then
                  begin
                    if MonthOf(FechaaPagar) = MesUno then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
//                       Viv := CarteraViv.Items[2];
                       Viv^.CapitalUno := Viv^.CapitalUno + CapitalaPagar;
 //                      Viv := CarteraViv.Items[3];
                       Viv^.InteresUno := Viv^.InteresUno + InteresCalculado;
 //                      Viv := CarteraViv.Items[4];
                       Viv^.SaldoUno := Viv^.SaldoUno + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesDos then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Viv := CarteraViv.Items[6];
                       Viv^.CapitalDos := Viv^.CapitalDos + CapitalaPagar;
  //                     Viv := CarteraViv.Items[7];
                       Viv^.InteresDos := Viv^.InteresDos + InteresCalculado;
  //                     Viv := CarteraViv.Items[8];
                       Viv^.SaldoDos := Viv^.SaldoDos + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesTres then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
  //                     Viv := CarteraViv.Items[10];
                       Viv^.CapitalTres := Viv^.CapitalTres + CapitalaPagar;
  //                     Viv := CarteraViv.Items[11];
                       Viv^.InteresTres := Viv^.InteresTres + InteresCalculado;
  //                     Viv := CarteraViv.Items[12];
                       Viv^.SaldoTres := Viv^.SaldoTres + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesCuatro then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
   //                    Viv := CarteraViv.Items[14];
                       Viv^.CapitalCuatro := Viv^.CapitalCuatro + CapitalaPagar;
   //                    Viv := CarteraViv.Items[15];
                       Viv^.InteresCuatro := Viv^.InteresCuatro + InteresCalculado;
   //                    Viv := CarteraViv.Items[16];
                       Viv^.SaldoCuatro := Viv^.SaldoCuatro + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesCinco then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
    //                   Viv := CarteraViv.Items[18];
                       Viv^.CapitalCinco := Viv^.CapitalCinco + CapitalaPagar;
   //                    Viv := CarteraViv.Items[19];
                       Viv^.InteresCinco := Viv^.InteresCinco + InteresCalculado;
    //                   Viv := CarteraViv.Items[20];
                       Viv^.SaldoCinco := Viv^.SaldoCinco + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesSeis then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
  //                     Viv := CarteraViv.Items[22];
                       Viv^.CapitalSeis := Viv^.CapitalSeis + CapitalaPagar;
  //                     Viv := CarteraViv.Items[23];
                       Viv^.InteresSeis := Viv^.InteresSeis + InteresCalculado;
   //                    Viv := CarteraViv.Items[24];
                       Viv^.SaldoSeis := Viv^.SaldoSeis + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesSiete then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Viv := CarteraViv.Items[26];
                       Viv^.CapitalSiete := Viv^.CapitalSiete + CapitalaPagar;
 //                      Viv := CarteraViv.Items[27];
                       Viv^.InteresSiete := Viv^.InteresSiete + InteresCalculado;
//                       Viv := CarteraViv.Items[28];
                       Viv^.SaldoSiete := Viv^.SaldoSiete + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesOcho then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Viv := CarteraViv.Items[30];
                       Viv^.CapitalOcho := Viv^.CapitalOcho + CapitalaPagar;
  //                     Viv := CarteraViv.Items[31];
                       Viv^.InteresOcho := Viv^.InteresOcho + InteresCalculado;
   //                    Viv := CarteraViv.Items[32];
                       Viv^.SaldoOcho := Viv^.SaldoOcho + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesNueve then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Viv := CarteraViv.Items[34];
                       Viv^.CapitalNueve := Viv^.CapitalNueve + CapitalaPagar;
 //                      Viv := CarteraViv.Items[35];
                       Viv^.InteresNueve := Viv^.InteresNueve + InteresCalculado;
 //                      Viv := CarteraViv.Items[36];
                       Viv^.SaldoNueve := Viv^.SaldoNueve + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesDiez then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
 //                      Viv := CarteraViv.Items[38];
                       Viv^.CapitalDiez := Viv^.CapitalDiez + CapitalaPagar;
  //                     Viv := CarteraViv.Items[39];
                       Viv^.InteresDiez := Viv^.InteresDiez + InteresCalculado;
    //                   Viv := CarteraViv.Items[40];
                       Viv^.SaldoDiez := Viv^.SaldoDiez + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesOnce then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
  //                     Viv := CarteraViv.Items[42];
                       Viv^.CapitalOnce := Viv^.CapitalOnce + CapitalaPagar;
   //                    Viv := CarteraViv.Items[43];
                       Viv^.InteresOnce := Viv^.InteresOnce + InteresCalculado;
  //                     Viv := CarteraViv.Items[44];
                       Viv^.SaldoOnce := Viv^.SaldoOnce + Saldo;
                     end;
                    if MonthOf(FechaaPagar) = MesDoce then
                     begin
                       InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);
  //                     Viv := CarteraViv.Items[46];
                       Viv^.CapitalDoce := Viv^.CapitalDoce + CapitalaPagar;
  //                     Viv := CarteraViv.Items[47];
                       Viv^.InteresDoce := Viv^.InteresDoce + InteresCalculado;
   //                    Viv := CarteraViv.Items[48];
                       Viv^.SaldoDoce := Viv^.SaldoDoce + Saldo;
                     end;
                  end;

     PCarteraCom = ^ACarteraCom;
     ACarteracom = record
         MesUno:Currency;
         CapitalUno:Currency;
         InteresUno:Currency;
         SaldoUno:Currency;
         MesDos:Currency;
         CapitalDos:Currency;
         InteresDos:Currency;
         SaldoDos:Currency;
         MesTres:Currency;
         CapitalTres:Currency;
         InteresTres:Currency;
         SaldoTres:Currency;
         MesCuatro:Currency;
         CapitalCuatro:Currency;
         InteresCuatro:Currency;
         SaldoCuatro:Currency;
         MesCinco:Currency;
         CapitalCinco:Currency;
         InteresCinco:Currency;
         SaldoCinco:Currency;
         MesSeis:Currency;
         CapitalSeis:Currency;
         InteresSeis:Currency;
         SaldoSeis:Currency;
         MesSiete:Currency;
         CapitalSiete:Currency;
         InteresSiete:Currency;
         SaldoSiete:Currency;
         MesOcho:Currency;
         CapitalOcho:Currency;
         InteresOcho:Currency;
         SaldoOcho:Currency;
         MesNueve:Currency;
         CapitalNueve:Currency;
         InteresNueve:Currency;
         SaldoNueve:Currency;
         MesDiez:Currency;
         CapitalDiez:Currency;
         InteresDiez:Currency;
         SaldoDiez:Currency;
         MesOnce:Currency;
         CapitalOnce:Currency;
         InteresOnce:Currency;
         SaldoOnce:Currency;
         MesDoce:Currency;
         CapitalDoce:Currency;
         InteresDoce:Currency;
         SaldoDoce:Currency;
     end;


     PCarteraCons = ^ACarteraCons;
     ACarteracons = record
         MesUno:Currency;
         CapitalUno:Currency;
         InteresUno:Currency;
         SaldoUno:Currency;
         MesDos:Currency;
         CapitalDos:Currency;
         InteresDos:Currency;
         SaldoDos:Currency;
         MesTres:Currency;
         CapitalTres:Currency;
         InteresTres:Currency;
         SaldoTres:Currency;
         MesCuatro:Currency;
         CapitalCuatro:Currency;
         InteresCuatro:Currency;
         SaldoCuatro:Currency;
         MesCinco:Currency;
         CapitalCinco:Currency;
         InteresCinco:Currency;
         SaldoCinco:Currency;
         MesSeis:Currency;
         CapitalSeis:Currency;
         InteresSeis:Currency;
         SaldoSeis:Currency;
         MesSiete:Currency;
         CapitalSiete:Currency;
         InteresSiete:Currency;
         SaldoSiete:Currency;
         MesOcho:Currency;
         CapitalOcho:Currency;
         InteresOcho:Currency;
         SaldoOcho:Currency;
         MesNueve:Currency;
         CapitalNueve:Currency;
         InteresNueve:Currency;
         SaldoNueve:Currency;
         MesDiez:Currency;
         CapitalDiez:Currency;
         InteresDiez:Currency;
         SaldoDiez:Currency;
         MesOnce:Currency;
         CapitalOnce:Currency;
         InteresOnce:Currency;
         SaldoOnce:Currency;
         MesDoce:Currency;
         CapitalDoce:Currency;
         InteresDoce:Currency;
         SaldoDoce:Currency;
     end;

     PCarteraViv = ^ACarteraViv;
     ACarteraViv = record
         MesUno:Currency;
         CapitalUno:Currency;
         InteresUno:Currency;
         SaldoUno:Currency;
         MesDos:Currency;
         CapitalDos:Currency;
         InteresDos:Currency;
         SaldoDos:Currency;
         MesTres:Currency;
         CapitalTres:Currency;
         InteresTres:Currency;
         SaldoTres:Currency;
         MesCuatro:Currency;
         CapitalCuatro:Currency;
         InteresCuatro:Currency;
         SaldoCuatro:Currency;
         MesCinco:Currency;
         CapitalCinco:Currency;
         InteresCinco:Currency;
         SaldoCinco:Currency;
         MesSeis:Currency;
         CapitalSeis:Currency;
         InteresSeis:Currency;
         SaldoSeis:Currency;
         MesSiete:Currency;
         CapitalSiete:Currency;
         InteresSiete:Currency;
         SaldoSiete:Currency;
         MesOcho:Currency;
         CapitalOcho:Currency;
         InteresOcho:Currency;
         SaldoOcho:Currency;
         MesNueve:Currency;
         CapitalNueve:Currency;
         InteresNueve:Currency;
         SaldoNueve:Currency;
         MesDiez:Currency;
         CapitalDiez:Currency;
         InteresDiez:Currency;
         SaldoDiez:Currency;
         MesOnce:Currency;
         CapitalOnce:Currency;
         InteresOnce:Currency;
         SaldoOnce:Currency;
         MesDoce:Currency;
         CapitalDoce:Currency;
         InteresDoce:Currency;
         SaldoDoce:Currency;
     end;

