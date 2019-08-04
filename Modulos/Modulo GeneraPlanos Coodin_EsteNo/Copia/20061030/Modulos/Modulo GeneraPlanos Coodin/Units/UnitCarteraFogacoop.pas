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
    Reporte: TprTxReport;
    IBQTasa: TIBQuery;
    IBTransaction2: TIBTransaction;
    Transaction: TIBTransaction;
    Database: TIBDatabase;
    LblEstado: TLabel;
    Label5: TLabel;
    IBQuery4: TIBQuery;
    IBQuery3: TIBQuery;
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
    function BuscoTasaEfectivaMaxima(Fecha:TDate):Double;
    function BuscoTasaEfectivaMaximaIPCNueva(IBQuery1:TIBQuery):Double;
    function BuscoTasaEfectivaMaximaDtf(Fecha:TDate):Double;
    { Public declarations }
  end;

type PCartera=^ACartera;
     ACartera=Record
      Clasificacion:integer;
      Mes:integer;
      Saldo:Currency;
      Capital:Currency;
      Intereses:Currency;
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
    AR:PCartera;
    Archivo:TextFile;
    Cadena:string;
begin


        CmdProcesar.Enabled := False;
        Application.ProcessMessages;

        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
// Ocaña
   lblEstado.Caption := 'Procesando ...';
   Database.DataBaseName := DBserver + ':' + DBpath + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
   try
     Database.Connected := True;
   except
     raise;
   end;

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

        TasaFijaE := BuscoTasaEfectivaMaxima(FechaCorte);
        TasaDtfE := buscotasaefectivamaximadtf(FechaCorte);
        TasaIpcE := BuscoTasaEfectivaMaximaIPCNueva(IBQuery1);


    Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + IntToStr(MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
    AssignFile(Archivo,'C:/PlanosFinMes/RECCARTERA' + Cadena + '.TXT');
    //AssignFile(F,'C:/PlanosFinMes/Aportes' + Cadena);

    Rewrite(Archivo);
    Cadena := 'CLASIFICACION' + #9 + 'MES' + #9 + 'SALDO' + #9 + 'CAPITAL' + #9 + 'INTERES';
    Writeln(Archivo,Cadena);

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

          IBQuery2.Close;
          IBQuery2.SQL.Clear;
          IBQuery2.SQL.Add('select clasificacion, mes, saldo, capital, interes  from "col$carteraf" group by clasificacion, mes, saldo, capital, interes');
          IBQuery2.Open;
          while not IBQuery2.Eof do begin
            New(AR);
            AR^.Clasificacion := IBQuery2.FieldByName('CLASIFICACION').AsInteger;
            AR^.Mes := IBQuery2.FieldByName('MES').AsInteger;
            AR^.Saldo := IBQuery2.FieldByName('SALDO').AsCurrency;
            AR^.Capital := IBQuery2.FieldByName('CAPITAL').AsCurrency;
            AR^.Intereses := IBQuery2.FieldByName('INTERES').AsCurrency;
            Cadena := IntToStr(AR^.Clasificacion) + #9 + IntToStr(AR^.Mes) + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + FormatCurr('0.00',AR^.Capital) + #9 + FormatCurr('0.00',AR^.Intereses);
            Dispose(AR);
            Writeln(Archivo,Cadena);
            IBQuery2.Next;
          end;
          IBQuery2.Close;

          CloseFile(Archivo);
          frmProgreso.Cerrar;
          Transaction.Commit;
          Database.Close;
//          Transaction.StartTransaction;
        end; // fin with
//fin Ocaña
    LblEstado.Caption := 'Proceso Terminado con Exito!';
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

function TfrmCarteraFogacoop.BuscoTasaEfectivaMaxima(Fecha:TDate):Double;
begin
        with ibquery3 do
        begin
                SQL.Clear;
                SQL.Add('select VALOR_TASA_EFECTIVA from ');
                SQL.Add(' "col$tasafijas" where (:"FECHA" between FECHA_INICIAL and FECHA_FINAL)');
                ParamByName('FECHA').AsDate := Fecha;
                Open;
                if RecordCount = 0 then
                begin
                        SQL.Clear;
                        SQL.Add('select VALOR_TASA_EFECTIVA from ');
                        SQL.Add('"col$tasafijas" order by FECHA_INICIAL ASC ');
                        try
                          Open;
                          Last;
                          Result := FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
                          Close;
                        except
                           Close;
                           Result := 99.999;
                           Exit;
                        end;
                end
                else
                begin
                 Result := FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
                 Close;
                end;
        end;
end;


function TfrmCarteraFogacoop.BuscoTasaEfectivaMaximaIPCNueva(IBQuery1:TIBQuery):Double;
begin
        with IBQuery3 do
        begin
                SQL.Clear;
                SQL.Add('select VALOR_ACTUAL_TASA from ');
                SQL.Add(' "col$tasasvariables" ');
                SQL.Add('Where ID_INTERES = 2');
                Open;
                Result := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
                Close;
        end;
end;

function TfrmCarteraFogacoop.BuscoTasaEfectivaMaximaDtf(Fecha:TDate):Double;
begin
        with ibquery3 do
        begin
                SQL.Clear;
                SQL.Add('select VALOR_TASA_EFECTIVA from ');
                SQL.Add(' "col$tasadtf" ');
                SQL.Add('where (:"FECHA" between FECHA_INICIAL and FECHA_FINAL)');
                ParamByName('FECHA').AsDate := Fecha;
                Open;
                if RecordCount = 0 then
                begin
                        SQL.Clear;
                        SQL.Add('select VALOR_TASA_EFECTIVA from ');
                        SQL.Add(' "col$tasadtf" ');
                        try
                          Open;
                          Last;
                          Result := FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
                          Close;
                        except
                           Close;
                           Result := 99.999;
                           Exit;
                        end;
                end
                else
                begin
                 Result := FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
                 Close;
                end;
        end;
end;


end.
