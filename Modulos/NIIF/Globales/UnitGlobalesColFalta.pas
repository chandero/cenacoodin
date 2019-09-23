unit UnitGlobalesCol;

interface

Uses Dialogs,Forms,StdCtrls,DBCtrls,IB, IBSQL, IBDatabase, IBQuery,
     Messages,SysUtils,Math,Controls,DateUtils,Classes,
     UnitdmColocacion, UnitGlobales, UnitDmGeneral;
type
  Deuda = record
    Valor:Currency;
    Dias:Integer;
  end;

type
  TasasManual = record
    TasaLiquidar:Double;
    TasaMora:Double;
  end;
  

type
     PCuotasLiq = ^ACuotasLiq;
     ACuotasLiq = record
         CuotaNumero:Integer;
         CodigoPuc:string;
         FechaInicial:TDate;
         FechaFinal:TDate;
         Dias:Integer;
         Tasa:Double;
         Debito:Currency;
         Credito:Currency;
         EsCapital   :Boolean;
         EsCausado   :Boolean;
         EsCorriente :Boolean;
         EsVencido   :Boolean;
         EsAnticipado:Boolean;
         EsDevuelto  :Boolean;
     end;

type
     PFechasLiq = ^AFechasLiq;
     AFechasLiq = record
       FechaInicial :TDate;
       FechaFinal   :TDate;
       Anticipado   :Boolean;
       Causado      :Boolean;
       Corrientes   :Boolean;
       Vencida      :Boolean;
       Devuelto     :Boolean;
     end;

type TCuotasLiq = record
     Lista:TList;
     FechaProx:TDate;
     NuevoSaldo:Currency;
     InteresesHasta:TDate;
     CapitalHasta:TDate;
     Liquidado:Boolean;
end;

function TasaNominalVencida(TasaE:Single;Amortiza:Integer): Single;
function TasaNominalAnticipada(TasaE:Single;Amortiza:Integer): Single;
function FactorCuota(TasaE:Single;Plazo:Integer;Amortiza:Integer):Single;
function CuotaFija(Valor:Currency;Plazo:Integer;TasaE:Single;Amortiza:Integer): Currency;
function CuotaVariable(Valor:Currency;Plazo:Integer;TasaE:Single;Amortiza:Integer): Currency;
function CalculoFecha(FechaActual:TDate;Dias:Integer):TDate;
function CalculoFechaMes(Ano,Mes,Dia:Integer;Dias:Integer):TDate;
function CalculoFechaManual(FechaActual:TDate;Dias:Integer):TDate;
function CalculoFechaManual1(FechaActual:TDate;FechaDesembolso:TDate;Dias:Integer):TDate;
function BuscoTasaEfectivaMaxima(Fecha:TDate):Double;
function BuscoTasaEfectivaUvr(Fecha:TDate):Double;
function BuscoTasaEfectivaUvrNueva(IBQuery1:TIBQuery;Fecha:TDate):Double;
function BuscoTasaEfectivaMaximaNueva(IBQuery1:TIBQuery;Fecha:TDate):Double;
function BuscoTasaEfectivaMaximaIPC:Double;
function BuscoTasaEfectivaMaximaIPCNueva(IBQuery1:TIBQuery):Double;
function BuscoTasaEfectivaMaximaDtf(Fecha:TDate):Double;
function BuscoTasaEfectivaMaximaDtfNueva(IBQuery1:TIBQuery;Fecha:TDate):Double;
procedure CrearTablaLiquidacion(TableName:String;vDesembolso:Currency;ValorCuota:Currency;
                               FechaDesembolso:TDate;TasaE:Single;PuntosAdicionales:Single;
                               AmortizaCapital:Integer;
                               AmortizaInteres:Integer;Plazo:Integer;
                               TipoCuota:String;Modalidad:String);
procedure CrearTablaLiquidacionVivienda(TableName:String;vDesembolso:Currency;ValorCuota:Currency;
                               FechaDesembolso:TDate;TasaE:Single;PuntosAdicionales:Single;
                               AmortizaCapital:Integer;
                               AmortizaInteres:Integer;Plazo:Integer;
                               TipoCuota:String;Modalidad:String);
procedure CrearTablaLiquidacionTmp(TableName:String;vDesembolso:Currency;ValorCuota:Currency;
                               FechaDesembolso:TDate;TasaE:Single;
                               AmortizaCapital:Integer;
                               AmortizaInteres:Integer;Plazo:Integer;
                               TipoCuota:String;Modalidad:String);
procedure LiquidarCuotasFija(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);
procedure LiquidarCuotasFijaPagoTotal(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);
procedure LiquidarCuotasVarAnticipada(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);
procedure LiquidarCuotasVarAnticipadaPagoTotal(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);
procedure LiquidarCuotasVarVencida(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);
procedure LiquidarCuotasVarVencidaPagoTotal(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);
procedure CalcularFechasLiquidarFija(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
procedure CalcularFechasLiquidarVarAnticipada(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
procedure CalcularFechasDevolucion(FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
procedure CalcularFechasDevolucion1(FechaDesembolso:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
procedure CalcularFechasMora(FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
procedure CalcularFechasLiquidarVarVencida(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
function TasaEfectivaVencida(Tasa: Double;Amortiza:Integer): Double;
function TasaEfectivaAnticipada(Tasa: Double;Amortiza:Integer): Double;
function TasaDevolucion(Agencia:Integer;Colocacion:string): Double;
function CuotaVivienda(Valor:Currency;Plazo:Integer;TasaE:Single;Amortiza:Integer): Currency;
function CalcularIntAnt(vClasificacion:Integer;vGarantia:Integer;vInteresVencido:string;
                        vDesembolso:Currency;vTasaNominal:Single;vAmortizaInteres:Integer;
                        vIdColocacion:string;vNotaContable:string;vFechaInteres:TDate;vFechaCapital:Tdate) :Currency;
procedure VerificarCancelacionCredito(Agencia:Integer;Colocacion:string);
function ObtenerConsecutivoColocacion(IBSQL1:TIBSQL): Longint;
function ObtenerConsecutivoBarrido(IBSQL1:TIBSQL): Longint;
function ObtenerDeudaHoy(Agencia:Integer;Colocacion:string;IBSQL1:TIBSQL) : Deuda;
function ObtenerDeudaHoy1(Agencia:Integer;Colocacion:string;IBSQL1:TIBSQL) : Deuda;
function ObtenerDeudaFecha(Agencia:Integer;Colocacion:string;FechaCorte:TDate;IBSQL1:TIBSQL) : Deuda;
function ObtenerDiasMora(Agencia:Integer;Colocacion:string) : Currency;
function BuscoTasaManual(Clasificacion:Integer;TasaC:Single;TipoInteres:Integer;TipoCuota:Integer;PuntosA:Double;Amortiza:Integer;FechaF:TDate;FechaPagoI:TDate): TasasManual;
function BuscoTasaDevManual(Colocacion:string;CodigoAnt:string;FechaF:TDate): Double;
var
vSaldoActual : Currency;
vTasa : double;
Cuotas : integer;
CodigoCaja:string;
fechakant : TDate;
fechacapital : TDate;

function ObtenerConsecutivodesembolso(IBSQL1: TIBSQL): LongInt;

implementation

procedure CalcularFechasLiquidarFija(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
var FechaF1,FechaF2,FechaF3,FechaF4:TDate;
    Fecha,FechaA,FechaB:TDate;
    AF:PFechasLiq;
    Paso : Boolean;
    A,AA,M,MM,D,DD:Word;
begin
    FechaF1 := FechaInicial;
    FechaF2 := FechaCorte;

    FechaF3 := FechaProx;
    FechaF4 := fFechaActual;
    Paso := False;

    // Inicio While 1
    While Int(FechaF1) <= Int(FechaF3) do
     begin
       New(AF);
       AF^.Anticipado := False;
       AF^.Causado := False;
       AF^.Corrientes := False;
       AF^.Vencida := False;
       AF^.Devuelto := False;
       Fecha := FechaF1;
       Fecha := RecodeDay(FechaF1,Dayof(EndOfAMonth(YearOf(Fecha),MonthOf(Fecha))));
       if Int(Fecha) > Int(FechaF3) then
          Fecha := FechaF3;
       if (Int(Fecha) > Int(FechaF4)) and (Paso = False) and (Int(FechaF1) < Int(FechaF4)) then
//       if (Int(Fecha) > Int(FechaF2)) and (Paso = False) and (Int(FechaF1) < Int(FechaF2)) then
//       if (Int(Fecha) > Int(FechaF2)) and (FechaF2 > FechaF3) and (Paso = False) then
        begin
//          Fecha := FechaF2;
          Fecha := FechaF4;
          Paso := True;
        end;
       AF^.FechaInicial := FechaF1;
       AF^.FechaFinal := Fecha;
       DecodeDate(AF^.FechaInicial,A,M,D);
       DecodeDate(AF^.FechaFinal,AA,MM,DD);
       FechaA := RecodeDay(Fecha,01);
//       FechaB := RecodeDay(FechaF2,01);
       FechaB := RecodeDay(FechaF4,01);

       if (Fecha <= FechaF4) and (FechaA = FechaB) then
        begin
          AF^.Anticipado := False;
          AF^.Causado := False;
          AF^.Corrientes := True;
          AF^.Vencida := False;
          AF^.Devuelto := False;
        end
       else if (Fecha <= FechaF4) then
        begin
          AF^.Anticipado := False;
          AF^.Causado := True;
          AF^.Corrientes := False;
          AF^.Vencida := False;
          AF^.Devuelto := False;
        end
       else
        begin
          AF^.Anticipado := True;
          AF^.Causado := False;
          AF^.Corrientes := False;
          AF^.Vencida := False;
          AF^.Devuelto := False;
        end;

       FechaF1 := Fecha;
       if not ((M=MM) and (D=31) and (DD=31)) then
         FechasLiq.Add(AF);
       FechaF1 := IncDay(Fecha);
     end;  // fin del While 1
end;

procedure CalcularFechasLiquidarVarAnticipada(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
var FechaF1,FechaF2,FechaF3,FechaF4:TDate;
    Fecha,FechaA,FechaB:TDate;
    AF:PFechasLiq;
    A,AA,M,MM,D,DD:Word;
    Paso : Boolean;
begin
    FechaF1 := FechaInicial;
    FechaF2 := FechaCorte;
    FechaF3 := FechaProx;
    FechaF4 := ffechaactual;
    Paso := False;

    // Inicio While 1
    While Int(FechaF1) <= Int(FechaF3) do
     begin
       New(AF);
       AF^.Anticipado := False;
       AF^.Causado := False;
       AF^.Corrientes := False;
       AF^.Vencida := False;
       AF^.Devuelto := False;
       Fecha := FechaF1;
       Fecha := RecodeDay(FechaF1,Dayof(EndOfAMonth(YearOf(Fecha),MonthOf(Fecha))));
       if Int(Fecha) > Int(FechaF3) then
//        begin
          Fecha := FechaF3;
          if (Int(Fecha) > Int(FechaF4)) and (Paso = False) and (Int(FechaF1) < Int(FechaF4)) then
           begin
             Fecha := FechaF4;
             Paso := True;
           end;
  //      end;

       AF^.FechaInicial := FechaF1;
       AF^.FechaFinal := Fecha;
       DecodeDate(AF^.FechaInicial,A,M,D);
       DecodeDate(AF^.FechaFinal,AA,MM,DD);
       FechaA := RecodeDay(Fecha,01);
       FechaB := RecodeDay(FechaF4,01);

       if (Fecha <= FechaF4) and (FechaA = FechaB) then
        begin
          AF^.Anticipado := False;
          AF^.Causado := False;
          AF^.Corrientes := True;
          AF^.Vencida := False;
          AF^.Devuelto := False;
        end
       else
        if Fecha <= FechaF4 then
         begin
           AF^.Anticipado := False;
           AF^.Causado := True;
           AF^.Corrientes := False;
           AF^.Vencida := False;
           AF^.Devuelto := False;
         end
        else
         begin
           AF^.Anticipado := True;
           AF^.Causado := False;
           AF^.Corrientes := False;
           AF^.Vencida := False;
           AF^.Devuelto := False;
         end;

       FechaF1 := Fecha;
       if not ((M=MM) and (D=31) and (DD=31)) then
         FechasLiq.Add(AF);
       FechaF1 := IncDay(Fecha);
     end;  // fin del While 1

end;

procedure CalcularFechasLiquidarVarVencida(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
var FechaF1,FechaF2,FechaF3,FechaF4:TDate;
    Fecha,FechaA,FechaB:TDate;
    AF:PFechasLiq;
    Paso : Boolean;
    A,AA,M,MM,D,DD:Word;
begin
    FechaF1 := FechaInicial;
    FechaF2 := FechaCorte;
    FechaF3 := FechaProx;
    FechaF4 := fFechaActual;
    Paso := False;

    // Inicio While 1
    While Int(FechaF1) <= Int(FechaF3) do
     begin
       New(AF);
       AF^.Anticipado := False;
       AF^.Causado := False;
       AF^.Corrientes := False;
       AF^.Vencida := False;
       AF^.Devuelto := False;
       Fecha := FechaF1;
       Fecha := RecodeDay(FechaF1,Dayof(EndOfAMonth(YearOf(Fecha),MonthOf(Fecha))));
       if Int(Fecha) > Int(FechaF3) then
          Fecha := FechaF3;
       if (Int(Fecha) > Int(FechaF4)) and (Paso = False) and (Int(FechaF1) < Int(FechaF4)) then
        begin
          Fecha := FechaF1; //FechaF2;
          Paso := True;
        end;
       AF^.FechaInicial := FechaF1;
       AF^.FechaFinal := Fecha;
       DecodeDate(AF^.FechaInicial,A,M,D);
       DecodeDate(AF^.FechaFinal,AA,MM,DD);
       FechaA := RecodeDay(Fecha,01);
       FechaB := RecodeDay(FechaF4,01);

       if (Fecha <= FechaF4) and (FechaA = FechaB) then
        begin
          AF^.Anticipado := False;
          AF^.Causado := False;
          AF^.Corrientes := True;
          AF^.Vencida := False;
          AF^.Devuelto := False;
        end
       else if Fecha <= FechaF4 then
        begin
          AF^.Anticipado := False;
          AF^.Causado := True;
          AF^.Corrientes := False;
          AF^.Vencida := False;
          AF^.Devuelto := False;
        end
       else
        begin
          AF^.Anticipado := True;
          AF^.Causado := False;
          AF^.Corrientes := False;
          AF^.Vencida := False;
          AF^.Devuelto := False;
        end;

       FechaF1 := Fecha;
       if not ((M=MM) and (D=31) and (DD=31)) then
         FechasLiq.Add(AF);
       FechaF1 := IncDay(Fecha);
     end;  // fin del While 1
end;

procedure CalcularFechasDevolucion(FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
var FechaF1,FechaF2:TDate;
    Fecha:TDate;
    AF:PFechasLiq;
    A,AA,AAA,M,MM,MMM,D,DD,DDD:Word;
begin
    New(AF);
    AF^.Anticipado := False;
    AF^.Causado := False;
    AF^.Corrientes := False;
    AF^.Vencida := False;
    AF^.Devuelto := False;

    FechaF1 := FechaCorte;
    DecodeDate(FechaProx,AAA,MMM,DDD);
    if (MMM=2) and (DDD=28) then
      FechaF2 := FechaProx
    else
      FechaF2 := IncDay(FechaProx,-1);



    While FechaF1 <= FechaF2 do
     begin
       New(AF);
       AF^.Anticipado := False;
       AF^.Causado := False;
       AF^.Corrientes := False;
       AF^.Vencida := False;
       AF^.Devuelto := False;
       Fecha := FechaF1;
       Fecha := RecodeDay(FechaF1,Dayof(EndOfAMonth(YearOf(Fecha),MonthOf(Fecha))));
       if Int(Fecha) > Int(FechaF2) then
          Fecha := FechaF2;
       AF^.Vencida := False;
       AF^.Devuelto := True;
       AF^.FechaInicial := FechaF1;
       AF^.FechaFinal := Fecha;
       DecodeDate(AF^.FechaInicial,A,M,D);
       DecodeDate(AF^.FechaFinal,AA,MM,DD);
       FechaF1 := Fecha;
       if not ((M=MM) and (D=31) and (DD=31)) then
          FechasLiq.Add(AF);
       FechaF1 := IncDay(Fecha);
     end;
end;

procedure CalcularFechasDevolucion1(FechaDesembolso:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
var FechaF1,FechaF2:TDate;
    Fecha:TDate;
    AF:PFechasLiq;
    A,AA,AAA,AAAA,M,MM,MMM,MMMM,D,DD,DDD,DDDD:Word;
begin
    New(AF);
    AF^.Anticipado := False;
    AF^.Causado := False;
    AF^.Corrientes := False;
    AF^.Vencida := False;
    AF^.Devuelto := False;

    FechaF1 := FechaCorte;
    DecodeDate(FechaProx,AAA,MMM,DDD);
    DecodeDate(FechaDesembolso,AAAA,MMMM,DDDD);
    if (MMM=2) and (DDD=28) and (DDD<>DDDD) then
      FechaF2 := FechaProx
    else
      FechaF2 := IncDay(FechaProx,-1);



    While FechaF1 <= FechaF2 do
     begin
       New(AF);
       AF^.Anticipado := False;
       AF^.Causado := False;
       AF^.Corrientes := False;
       AF^.Vencida := False;
       AF^.Devuelto := False;
       Fecha := FechaF1;
       Fecha := RecodeDay(FechaF1,Dayof(EndOfAMonth(YearOf(Fecha),MonthOf(Fecha))));
       if Int(Fecha) > Int(FechaF2) then
          Fecha := FechaF2;
       AF^.Vencida := False;
       AF^.Devuelto := True;
       AF^.FechaInicial := FechaF1;
       AF^.FechaFinal := Fecha;
       DecodeDate(AF^.FechaInicial,A,M,D);
       DecodeDate(AF^.FechaFinal,AA,MM,DD);
       FechaF1 := Fecha;
       if not ((M=MM) and (D=31) and (DD=31)) then
          FechasLiq.Add(AF);
       FechaF1 := IncDay(Fecha);
     end;
end;

procedure CalcularFechasMora(FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
var FechaF1,FechaF2,FechaF3:TDate;
    Fecha,FechaX,FechaY:TDate;
    AF:PFechasLiq;
    A,AA,AAA,M,MM,MMM,D,DD,DDD:Word;
begin
    New(AF);
    AF^.Anticipado := False;
    AF^.Causado := False;
    AF^.Corrientes := False;
    AF^.Vencida := False;
    AF^.Devuelto := False;

    FechaF2 := FechaCorte;
    FechaF3 := IncDay(FechaProx,1);

    FechaX := FechaF3;
    FechaY := FechaF2;
    FechaF1 := FechaX;
    FechaF2 := FechaY;

    While FechaF1 <= FechaF2 do
     begin
       New(AF);
       AF^.Anticipado := False;
       AF^.Causado := False;
       AF^.Corrientes := False;
       AF^.Vencida := False;
       AF^.Devuelto := False;
       Fecha := FechaF1;
       Fecha := RecodeDay(FechaF1,Dayof(EndOfAMonth(YearOf(Fecha),MonthOf(Fecha))));
       if Int(Fecha) > Int(FechaF2) then
          Fecha := FechaF2;
       AF^.Vencida := True;
       AF^.Devuelto := False;
       AF^.FechaInicial := FechaF1;
       AF^.FechaFinal := Fecha;
       DecodeDate(AF^.FechaInicial,A,M,D);
       DecodeDate(AF^.FechaFinal,AA,MM,DD);
       DecodeDate(FechaProx,AAA,MMM,DDD);
       FechaF1 := Fecha;
       if not (((M=MM) and (D=31) and (DD=31))) and
          not (((M=MM) and (D=30) and (DD=30) and (DD=DDD))) then
         FechasLiq.Add(AF);
       FechaF1 := IncDay(Fecha);
     end;
end;

function BuscoTasaEfectivaMaxima(Fecha:TDate):Double;
begin
        with dmColocacion.IBQueryVarios do
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

function BuscoTasaEfectivaUvr(Fecha:TDate):Double;
begin
        with dmColocacion.IBQueryVarios do
        begin
                SQL.Clear;
                SQL.Add('select VALOR_TASA_EFECTIVA from ');
                SQL.Add(' "col$tasauvr" where (:"FECHA" between FECHA_INICIAL and FECHA_FINAL)');
                ParamByName('FECHA').AsDate := Fecha;
                Open;
                if RecordCount = 0 then
                begin
                        SQL.Clear;
                        SQL.Add('select VALOR_TASA_EFECTIVA from ');
                        SQL.Add('"col$tasauvr" order by FECHA_INICIAL ASC ');
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

function BuscoTasaEfectivaUvrNueva(IBQuery1:TIBQuery;Fecha:TDate):Double;
begin
        with IBQuery1 do
        begin
                SQL.Clear;
                SQL.Add('select VALOR_TASA_EFECTIVA from ');
                SQL.Add(' "col$tasauvr" where (:"FECHA" between FECHA_INICIAL and FECHA_FINAL)');
                ParamByName('FECHA').AsDate := Fecha;
                Open;
                if RecordCount = 0 then
                begin
                        SQL.Clear;
                        SQL.Add('select VALOR_TASA_EFECTIVA from ');
                        SQL.Add('"col$tasauvr" order by FECHA_INICIAL ASC ');
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


function BuscoTasaEfectivaMaximaNueva(IBQuery1:TIBQuery;Fecha:TDate):Double;
begin
        with IBQuery1 do
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
                        SQL.Add(' "col$tasafijas" ');
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

function BuscoTasaEfectivaMaximaIPC:Double;
begin
        with dmColocacion.IBQueryVarios do
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

function BuscoTasaEfectivaMaximaIPCNueva(IBQuery1:TIBQuery):Double;
begin
        with IBQuery1 do
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


function BuscoTasaEfectivaMaximaDtf(Fecha:TDate):Double;
begin
        with dmColocacion.IBQueryVarios do
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

function BuscoTasaEfectivaMaximaDtfNueva(IBQuery1:TIBQuery;Fecha:TDate):Double;
begin
        with IBQuery1 do
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


procedure LiquidarCuotasFija(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);

var I,J:Integer;
    FechasLiq:TList;
    AR:PCuotasLiq;
    AF:PFechasLiq;
    FechaProx:TDate;
    FechaProxK:TDate;
    TasaLiquidar:Double;
    TasaDev : Double;
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDate;
    Capital:Currency;
    TotalInteres:Currency;
    TotalIntCredito:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    TasaEfectiva:Double;
    TasaEfectiva1:Double;
    TotalCuotas:Integer;
    NoCuota:Integer;
    Costas:Currency;
    InteresCuota : Currency;
    FechaProxNueva:TDate;
    FechaDesembolso:TDate;
    Es_Vivienda : Boolean;
    ValorCuotaVivienda : Currency;
    TasaMaxima : Double;
    TasaDoble : Double;
    TasaNomDev:Double;
    Devuelto:Boolean;
    ProximoPago:TDate;
    Ano,Mes,Dia,AnoA,MesA,DiaA:Word;
begin
  TotalCredito := 0;
  TotalDebito  := 0;
  Costas := 0;
  ValorCuotaVivienda := 0;
  FechaCorte := Trunc(FechaCorte);

  if AmortizaK < AmortizaI then Amortizacion := AmortizaK
   else Amortizacion := AmortizaI;

  with dmColocacion.IBSQL do
   begin
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
     ExecQuery;
     CodigoCaja := FieldByName('CODIGO').AsString;
     Close;
   end;

  with dmColocacion.IBSQLcodigos do
   begin
     SQL.Clear;
     SQL.Add('select * from "col$codigospuc" where ');
     SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
     SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
     SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
     ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
     ParamByName('ID_GARANTIA').AsInteger      := Garantia;
     ParamByName('ID_CATEGORIA').AsString     := Categoria;
     ExecQuery;
     if RecordCount = 0 then
      begin
        MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
        MyCuotasLiq.Liquidado:= False;
        Close;
        Exit;
      end;
   end;

  with dmColocacion.IBQuery do
   begin
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colocacion".ID_LINEA,');
     SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".DIAS_PAGO,');
     SQL.Add('"col$tablaliquidacion".CUOTA_NUMERO,');
     SQL.Add('"col$tablaliquidacion".CAPITAL_A_PAGAR,');
     SQL.Add('"col$tablaliquidacion".INTERES_A_PAGAR,');
     SQL.Add('"col$lineas".ES_VIVIENDA');
     SQL.Add('from "col$colocacion"');
     SQL.Add('INNER JOIN "col$tablaliquidacion" ON ("col$colocacion".ID_COLOCACION = "col$tablaliquidacion".ID_COLOCACION) ');
     SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA) ');
     SQL.Add(' where ');
     SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and "col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
     SQL.Add('and "col$tablaliquidacion".PAGADA = 0');
     SQL.Add('ORDER BY "col$tablaliquidacion".CUOTA_NUMERO');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Last;
     First;
     ValorCuotaVivienda  := SimpleRoundTo(FieldByName('CAPITAL_A_PAGAR').AsCurrency + FieldByName('INTERES_A_PAGAR').AsCurrency,0);
     FechaDesembolso := CalculoFecha(FieldByName('FECHA_DESEMBOLSO').AsDateTime,FieldByName('DIAS_PAGO').AsInteger);
     Es_Vivienda := InttoBoolean(FieldByName('ES_VIVIENDA').AsInteger);
     Close;

     SQL.Clear;
     SQL.Add('select count(*) as CUOTAS from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     TotalCuotas := FieldByName('CUOTAS').AsInteger;
     Close;

     SQL.Clear;
     SQL.Add('select VALOR_COSTAS from "col$costas" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Costas := FieldByName('VALOR_COSTAS').AsCurrency;

     SQL.Clear;
     SQL.Add('select * from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
     SQL.Add('PAGADA = 0 ');
     SQL.Add('order by "col$tablaliquidacion".ID_COLOCACION, "col$tablaliquidacion".CUOTA_NUMERO');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Last;
     First;
     MyCuotasLiq.Lista := TList.Create;

//Busco Costas
     if Costas > 0 then
      begin
        New(AR);
        AR^.CuotaNumero := 0;
        if Estado = 2 then //Juridico
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString
        else
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS_CAS').AsString;

        AR^.FechaInicial := FechaCorte;
        AR^.FechaFinal   := FechaCorte;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := 0;
        AR^.Credito      :=  Costas;
        AR^.EsCapital := False;
        AR^.EsCausado := False;
        AR^.EsCorriente := False;
        AR^.EsVencido := False;
        AR^.EsAnticipado := False;
        if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
        MyCuotasLiq.Lista.Add(AR);
        TotalCredito := TotalCredito + AR^.Credito;
        TotalDebito  := TotalDebito  + AR^.Debito;
      end;

     for I := 0 to (CuotasALiquidar - 1) do
      begin
     // Calcular Fechas a Liquidar
        NoCuota := FieldByName('CUOTA_NUMERO').AsInteger;
        if Es_Vivienda then
         ValorCuota := ValorCuotaVivienda;
        InteresCuota := SimpleRoundTo((SaldoActual * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic) / 100 * Amortizacion ) / 360,0);
        Capital := Valorcuota - InteresCuota;
//        Fecha1 := calculofecha(FechaPagoI,DiasProrroga);
        Fecha1 := FechaPagoI;
        FechaProx := FieldByName('FECHA_A_PAGAR').AsDateTime;
        FechaProx := CalculoFecha(FechaProx,DiasProrroga);
//        FechaProxK := calculofecha(FechaPagoK,DiasProrroga);
        FechaProxK := FechaProx;
        FechaProxNueva := FechaProx;
        MyCuotasLiq.CapitalHasta := FechaProxK;
        if SaldoActual < Capital then
           Capital := SaldoActual;
        if NoCuota = TotalCuotas then
         begin
           Capital := SaldoActual;
           MyCuotasLiq.FechaProx := 0
         end
        else
         begin
           ProximoPago := CalculoFecha(FechaProx,Amortizacion);
           DecodeDate(FechaDesembolso,Ano,Mes,Dia);
           DecodeDate(ProximoPago,AnoA,MesA,DiaA);
           if (MesA=2) and (Dia>DayOf(ProximoPago)) then Dia := DiaA;
           ProximoPago := EncodeDate(AnoA,MesA,Dia);
           MyCuotasLiq.FechaProx := ProximoPago;
         end;

        try
         FechasLiq := TList.Create;
         FechaArranque := IncDay(Fecha1);

         CalcularFechasLiquidarFija(FechaArranque,FechaCorte,FechaProx,FechasLiq);
//         FechaProxNueva := FechaProx;
         if FechaProxNueva > FechaCorte then
            CalcularFechasDevolucion1(FechaDesembolso,FechaCorte,FechaProxNueva,FechasLiq)
         else
            CalcularFechasMora(FechaCorte,FechaProxNueva,FechasLiq);

// Proceso de Liquidación de Fechas
         TotalInteres := 0;
         TotalIntCredito := 0;
         for J := 0 to (FechasLiq.Count - 1) do
          begin
            AF := FechasLiq.Items[J];
            New(AR);
            if TipoInteres = 0 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion);
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end;

            if Clasificacion = 3 then begin
              TasaEfectiva1 := BuscoTasaEfectivaUvr(FechaPagoI);
              TasaEfectiva1 := TasaNominalVencida(TasaEfectiva1,Amortizacion);
              if TasaEfectiva1 < TasaLiquidar then
                TasaLiquidar := TasaEfectiva1;
             end;


            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            TasaMora     := TasaNominalVencida(TasaMaxima,30);

            if (AF^.Anticipado) or (AF^.Devuelto) then
              AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
            else
             if AF^.Causado then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
            else
             if AF^.Corrientes then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString
            else
             if AF^.Vencida then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;

            if AF^.Devuelto then
             begin
               with dmColocacion.IBSQL do begin
                 Close;
                 sql.Clear;
                 sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION, "col$extractodet".ID_CBTE_COLOCACION,');
                 sql.Add('"col$extractodet".FECHA_INICIAL, "col$extractodet".FECHA_FINAL');
                 sql.Add('from "col$extracto"');
                 sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
                 sql.Add('where');
                 sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
                 sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
                 sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
                 sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
                 sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
                 sql.Add('"col$extractodet".VALOR_CREDITO > 0');
                 sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
                 ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                 ParamByName('ID_COLOCACION').AsString := IdColocacion;
                 ParamByName('FECHA').AsDate := AF^.FechaFinal;
                 ParamByName('CODIGO_PUC').AsString := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
                 ExecQuery;
                 TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
                 Close;
               end;
                 TasaDev := TasaEfectivaVencida(TasaDev,Amortizacion);
             end;

            if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4) then
             begin
               TasaDoble := SimpleRoundTo(2 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end
            else if Clasificacion = 3 then
             begin
               TasaDoble := SimpleRoundTo(1.5 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end;
            vTasa := TasaLiquidar;

            AR^.CuotaNumero  := FieldByName('CUOTA_NUMERO').AsInteger;
            AR^.FechaInicial := AF^.FechaInicial;
            AR^.FechaFinal   := AF^.FechaFinal;
            DecodeDate(AF^.FechaInicial,Ano,Mes,Dia);
            if ((Int(FechaArranque) = Int(AR^.FechaInicial)) and (Mes=3) and (Dia=1) and (AF^.Devuelto=False) and (AF^.Vencida=False)) then
               Bisiesto := True
            else
               Bisiesto := False;
            if AF^.Devuelto then Devuelto := True
            else Devuelto := False;

            AR^.Dias := DiasEntreFechas1(AF^.FechaInicial,AF^.FechaFinal,FechaDesembolso,Bisiesto,Devuelto);
            if AF^.Vencida then
               AR^.Tasa := TasaMora
            else
               AR^.Tasa := TasaLiquidar;

            if AF^.Devuelto then
               AR^.Credito := 0
            else
               AR^.Debito  := 0;

            if AF^.Devuelto then
               AR^.Debito := SimpleRoundTo((Capital * TasaLiquidar / 100 * AR^.Dias ) / 360,0)
            else
             if AF^.Vencida then
                AR^.Credito    := SimpleRoundTo((Capital * TasaMora / 100 * AR^.Dias ) / 360,0)
            else
                AR^.Credito    := SimpleRoundTo((SaldoActual * TasaLiquidar / 100 * AR^.Dias ) / 360,0);

            AR^.EsCapital := False;
            if AF^.Causado then
             begin
               AR^.EsCausado := True;
               TotalIntCredito := TotalIntCredito + AR^.Credito;
             end
            else AR^.EsCausado := False;
            if AF^.Corrientes then
             begin
               AR^.EsCorriente := True;
               TotalIntCredito := TotalIntCredito + AR^.Credito;
             end
            else AR^.EsCorriente := False;
            if AF^.Vencida then AR^.EsVencido := True
            else AR^.EsVencido := False;
            if AF^.Anticipado then
             begin
               AR^.EsAnticipado := True;
               TotalIntCredito := TotalIntCredito + AR^.Credito;
             end
            else AR^.EsAnticipado := False;
            if AF^.Devuelto Then AR^.EsDevuelto := True
            else AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
            TotalCredito := TotalCredito + AR^.Credito;
            TotalInteres := TotalInteres + AR^.Credito;
            TotalDebito  := TotalDebito  + AR^.Debito;
          end;

//          if TotalIntCredito > InteresCuota  then begin
//            AR^.Credito := AR^.Credito - (TotalIntCredito - InteresCuota);
//            TotalCredito := TotalCredito - (TotalIntCredito - InteresCuota);
//          end;

// Calculo Capital
          New(AR);
          AR^.CuotaNumero := FieldByName('CUOTA_NUMERO').AsInteger;
          AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := Capital;
          AR^.EsCapital := True;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);
          TotalCredito := TotalCredito + AR^.Credito;
          TotalDebito  := TotalDebito  + AR^.Debito;;
// Limpiar tabla de Fechas
          for J := 0 to (FechasLiq.Count - 1) do
           begin
             AF := FechasLiq.Items[J];
             Dispose(AF);
           end;

// Coloco Caja
          New(AR);
          AR^.CuotaNumero := FieldByName('CUOTA_NUMERO').AsInteger;
          AR^.CodigoPuc    := CodigoCaja;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCredito - TotalDebito;
          AR^.Credito      := 0;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
          TotalDebito := 0;
          TotalCredito := 0;
        finally
          FechasLiq.Free;
        end;
        SaldoActual := SaldoActual - Capital;
//        FechaPagoI := CalculoFecha(FechaPagoI,DiasProrroga);
        FechaPagoI := FechaProx; //CalculoFecha(FechaPagoI,Amortizacion);
        MyCuotasLiq.NuevoSaldo := SaldoActual;
        MyCuotasLiq.InteresesHasta := FechaPagoI;
        Next;
      end;
   end;
   dmColocacion.IBSQLcodigos.Close;
   dmColocacion.IBQuery.Close;
   MyCuotasLiq.Liquidado := True;
end;

procedure LiquidarCuotasVarAnticipada(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);

var I,J:Integer;
    FechasLiq:TList;
    AR:PCuotasLiq;
    AF:PFechasLiq;
    FechaProx:TDate;
    FechaProxK:TDate;
    TasaLiquidar:Double;
    TasaDev:Double;
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDate;
    Capital:Currency;
    TotalInteres:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    FechaProxNueva:TDate;
    FechaDesembolso:TDate;
    TasaEfectiva:Double;
    TasaEfectiva1:Double;
    TotalCuotas:Integer;
    NoCuota:Integer;
    Costas:Currency;
    TasaMaxima : Double;
    TasaDoble : Double;
    Dia,Mes,Ano:Word;
    FechaAnterior:TDateTime;
    A,M,D,AA,MM,DD:Word;
    TasaNomDev:Double;
    Devuelto:Boolean;
begin
  TotalCredito := 0;
  TotalDebito  := 0;
  Costas := 0;
  FechaCorte := Trunc(FechaCorte);

  if AmortizaK < AmortizaI then Amortizacion := AmortizaK
   else Amortizacion := AmortizaI;

  with dmColocacion.IBSQL do
   begin
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
     ExecQuery;
     CodigoCaja := FieldByName('CODIGO').AsString;
     Close;
   end;

  with dmColocacion.IBSQLcodigos do
   begin
     SQL.Clear;
     SQL.Add('select * from "col$codigospuc" where ');
     SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
     SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
     SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
     ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
     ParamByName('ID_GARANTIA').AsInteger      := Garantia;
     ParamByName('ID_CATEGORIA').AsString     := Categoria;
     ExecQuery;
     if RecordCount = 0 then
      begin
        MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
        MyCuotasLiq.Liquidado:= False;
        Close;
        Exit;
      end;
   end;

  with dmColocacion.IBQuery do
   begin
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".DIAS_PAGO');
     SQL.Add('from "col$colocacion"');
     SQL.Add(' where ');
     SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and "col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     FechaDesembolso := CalculoFecha(FieldByName('FECHA_DESEMBOLSO').AsDateTime,FieldByName('DIAS_PAGO').AsInteger);
     Close;

     SQL.Clear;
     SQL.Add('select count(*) as CUOTAS from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     TotalCuotas := FieldByName('CUOTAS').AsInteger;
     Close;

     SQL.Clear;
     SQL.Add('select VALOR_COSTAS from "col$costas" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Costas := FieldByName('VALOR_COSTAS').AsCurrency;

     SQL.Clear;
     SQL.Add('select * from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
     SQL.Add('PAGADA = 0 ');
     SQL.Add('order by "col$tablaliquidacion".ID_COLOCACION, "col$tablaliquidacion".CUOTA_NUMERO');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Last;
     First;
     MyCuotasLiq.Lista := TList.Create;
//Busco Costas
     if Costas > 0 then
      begin
        New(AR);
        AR^.CuotaNumero := 0;
        if Estado = 2 then //Juridico
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString
        else
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS_CAS').AsString;
        AR^.FechaInicial := FechaCorte;
        AR^.FechaFinal   := FechaCorte;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := 0;
        AR^.Credito      :=  Costas;
        AR^.EsCapital := False;
        AR^.EsCausado := False;
        AR^.EsCorriente := False;
        AR^.EsVencido := False;
        AR^.EsAnticipado := False;
        if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
        MyCuotasLiq.Lista.Add(AR);
        TotalCredito := TotalCredito + AR^.Credito;
        TotalDebito  := TotalDebito  + AR^.Debito;
      end;
//pendiente arreglar prorroga
     for I := 0 to (CuotasALiquidar - 1) do
      begin
     // Calcular Fechas a Liquidar
        NoCuota := FieldByName('CUOTA_NUMERO').AsInteger;
        Capital := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
//        Capital := Valorcuota;
        Fecha1 := FechaPagoI;
        FechaProx := FieldByName('FECHA_A_PAGAR').AsDateTime; //calculofecha(FechaPagoI,DiasProrroga); //
        if FechaProx < FechaPagoI then
           FechaProx := FechaPagoI;
        FechaProxNueva := FechaProx;
//        FechaProx := CalculoFecha(FechaProx,DiasProrroga);
        if DiasProrroga > 0 then Capital := 0;
        if NoCuota = TotalCuotas then
         begin
           MyCuotasLiq.FechaProx := FechaProx;
           MyCuotasLiq.CapitalHasta := FechaPagoK;
           FechaProxNueva := CalculoFecha(FechaProx,-Amortizacion);
           FechaProx := CalculoFecha(FechaProx,DiasProrroga);
           FechaProxNueva := FechaProx;
           FechaPagoI := FechaCorte;
           if SaldoActual < Capital then Capital := SaldoActual
           else Capital := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
         end
        else
         begin
           FechaProx := CalculoFecha(FechaProx,Amortizacion);
           DecodeDate(FechaProx,A,M,D);
           DecodeDate(FechaDesembolso,AA,MM,DD);
           if TryEncodeDate(A,M,DD,FechaAnterior) then
             FechaProx := FechaAnterior;
           MyCuotasLiq.FechaProx := FechaProx;
           if Capital > 0 then
            begin
              FechaProxK := CalculoFecha(FechaPagoK,DiasProrroga);
              FechaProxK := calculofecha(FechaProxK,AmortizaK);
              DecodeDate(FechaProxK,A,M,D);
              DecodeDate(FechaDesembolso,AA,MM,DD);
              if TryEncodeDate(A,M,DD,FechaAnterior) then
                FechaProxK := FechaAnterior;
            end
           else
            FechaProxK := FechaPagoK;
           MyCuotasLiq.CapitalHasta := FechaProxK;
//           FechaProxNueva := FechaProx;
//           FechaProx := Calculofecha(FechaProx,Amortizacion);
//           FechaPagoI := CalculoFecha(FechaPagoI,Amortizacion);
         end;
        try
         FechasLiq := TList.Create;
         FechaArranque := IncDay(Fecha1);
         CalcularFechasLiquidarVarAnticipada(FechaArranque,FechaCorte,FechaProx,FechasLiq);
         if FechaProxNueva > FechaCorte then
            CalcularFechasDevolucion(FechaCorte,FechaProxNueva,FechasLiq)
         else
            CalcularFechasMora(FechaCorte,FechaProxNueva,FechasLiq);

// Proceso de Liquidación de Fechas
         TotalInteres := 0;
         for J := 0 to (FechasLiq.Count - 1) do
          begin
            AF := FechasLiq.Items[J];
            New(AR);
            if TipoInteres = 0 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
               TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion);
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion) + PuntosAdic;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion) + PuntosAdic;
             end;

            if Clasificacion = 3 then begin
              TasaEfectiva1 := BuscoTasaEfectivaUvr(FechaPagoI);
              TasaEfectiva1 := TasaNominalAnticipada(TasaEfectiva1,Amortizacion);
              if TasaEfectiva1 < TasaLiquidar then
                TasaLiquidar := TasaEfectiva1;
             end;


            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            TasaMora     := TasaNominalVencida(TasaMaxima,30);

            if (AF^.Anticipado) or (AF^.Devuelto) then
              AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
            else
             if AF^.Causado then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
            else
             if AF^.Corrientes then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString
            else
             if AF^.Vencida then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;


            if AF^.Devuelto then
             begin
               with dmColocacion.IBSQL do begin
                 Close;
                 sql.Clear;
                 sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION, "col$extractodet".ID_CBTE_COLOCACION,');
                 sql.Add('"col$extractodet".FECHA_INICIAL, "col$extractodet".FECHA_FINAL');
                 sql.Add('from "col$extracto"');
                 sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
                 sql.Add('where');
                 sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
                 sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
                 sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
                 sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
                 sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
                 sql.Add('"col$extractodet".VALOR_CREDITO > 0');
                 sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
                 ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                 ParamByName('ID_COLOCACION').AsString := IdColocacion;
                 ParamByName('FECHA').AsDate := AF^.FechaFinal;
                 ParamByName('CODIGO_PUC').AsString := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
                 ExecQuery;
                 TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
                 Close;
               end;
                 TasaDev := TasaEfectivaAnticipada(TasaDev,Amortizacion);
             end;


            if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4) then
             begin
               TasaDoble := SimpleRoundTo(2 * (TasaNominalAnticipada(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end
            else if Clasificacion = 3 then
             begin
               TasaDoble := SimpleRoundTo(1.5 * (TasaNominalAnticipada(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end;

            if DiasProrroga > 0 then
             AR^.CuotaNumero := 0
            else
             AR^.CuotaNumero  := FieldByName('CUOTA_NUMERO').AsInteger;
            AR^.FechaInicial := AF^.FechaInicial;
            AR^.FechaFinal   := AF^.FechaFinal;
            DecodeDate(AF^.FechaInicial,Ano,Mes,Dia);
            if ((Int(FechaArranque) = Int(AR^.FechaInicial)) and (Mes=3) and (Dia=1) and (AF^.Devuelto=False) and (AF^.Vencida=False)) then
                Bisiesto := True
            else
                Bisiesto := False;
            if AF^.Devuelto then Devuelto := True
            else Devuelto := False;
            AR^.Dias := DiasEntreFechas1(AF^.FechaInicial,AF^.FechaFinal,FechaDesembolso,Bisiesto,Devuelto);
            if AF^.Vencida then
               AR^.Tasa := TasaMora
            else
               AR^.Tasa := TasaLiquidar;

            if AF^.Devuelto then
               AR^.Credito := 0
            else
               AR^.Debito  := 0;

            if AF^.Devuelto then
               AR^.Debito := SimpleRoundTo((Capital * TasaLiquidar / 100 * AR^.Dias ) / 360,0)
            else
             if AF^.Vencida then
                AR^.Credito    := SimpleRoundTo((Capital * TasaMora / 100 * AR^.Dias ) / 360,0)
            else
                AR^.Credito      := SimpleRoundTo(((SaldoActual - Capital) * TasaLiquidar / 100 * AR^.Dias ) / 360,0);

            AR^.EsCapital := False;
            if AF^.Causado then AR^.EsCausado := True
            else AR^.EsCausado := False;
            if AF^.Corrientes then AR^.EsCorriente := True
            else AR^.EsCorriente := False;
            if AF^.Vencida then AR^.EsVencido := True
            else AR^.EsVencido := False;
            if AF^.Anticipado then AR^.EsAnticipado := True
            else AR^.EsAnticipado := False;
            if AF^.Devuelto Then AR^.EsDevuelto := True
            else AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
            TotalCredito := TotalCredito + AR^.Credito;
            TotalInteres := TotalInteres + AR^.Credito;
            TotalDebito  := TotalDebito  + AR^.Debito;
          end;

// Calculo Capital
          New(AR);
          AR^.CuotaNumero := FieldByName('CUOTA_NUMERO').AsInteger;
          AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      :=  Capital; //FieldByName('CAPITAL_A_PAGAR').AsCurrency;
          AR^.EsCapital := True;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);
          TotalCredito := TotalCredito + AR^.Credito;
          TotalDebito  := TotalDebito  + AR^.Debito;;

          if FechasLiq.Count <= 0 then
             FechaPagoI := CalculoFecha(FechaPagoI,-Amortizacion);
// Limpiar tabla de Fechas
          for J := 0 to (FechasLiq.Count - 1) do
           begin
             AF := FechasLiq.Items[J];
             Dispose(AF);
           end;

// Coloco Caja
          New(AR);
          AR^.CuotaNumero := FieldByName('CUOTA_NUMERO').AsInteger;
          AR^.CodigoPuc    := CodigoCaja;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCredito - TotalDebito;
          AR^.Credito      := 0;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
          TotalDebito := 0;
          TotalCredito := 0;
        finally
          FechasLiq.Free;
        end;
        SaldoActual := SaldoActual - Capital;
        MyCuotasLiq.NuevoSaldo := SaldoActual;
        MyCuotasLiq.InteresesHasta := FechaProx; //FechaPagoI;
        Next;
      end;
   end;
   dmColocacion.IBSQLcodigos.Close;
   dmColocacion.IBQuery.Close;
   MyCuotasLiq.Liquidado := True;
end;

procedure LiquidarCuotasVarVencida(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);

var I,J:Integer;
    FechasLiq:TList;
    AR:PCuotasLiq;
    AF:PFechasLiq;
    FechaProx:TDate;
    FechaProxK:TDate;
    TasaLiquidar:Double;
    TasaDev:Double;
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDate;
    Capital:Currency;
    TotalInteres:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    FechaProxNueva:TDate;
    FechaDesembolso:TDate;
    TasaEfectiva:Double;
    TasaEfectiva1:Double;
    TotalCuotas:Integer;
    NoCuota:Integer;
    Costas:Currency;
    TasaMaxima : Double;
    TasaDoble : Double;
    Dia,DiaA,Mes,MesA,Ano,AnoA:Word;
    TasaNomDev:Double;
    Devuelto:Boolean;
    ProximoPago:TDate;
begin
  TotalCredito := 0;
  TotalDebito  := 0;
  Costas := 0;
  FechaCorte := Trunc(FechaCorte);

  if AmortizaK < AmortizaI then Amortizacion := AmortizaK
   else Amortizacion := AmortizaI;

  with dmColocacion.IBSQL do
   begin
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
     ExecQuery;
     CodigoCaja := FieldByName('CODIGO').AsString;
     Close;
   end;

  with dmColocacion.IBSQLcodigos do
   begin
     SQL.Clear;
     SQL.Add('select * from "col$codigospuc" where ');
     SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
     SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
     SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
     ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
     ParamByName('ID_GARANTIA').AsInteger      := Garantia;
     ParamByName('ID_CATEGORIA').AsString     := Categoria;
     ExecQuery;
     if RecordCount = 0 then
      begin
        MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
        MyCuotasLiq.Liquidado:= False;
        Close;
        Exit;
      end;
   end;

  with dmColocacion.IBQuery do
   begin
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".DIAS_PAGO');
     SQL.Add('from "col$colocacion"');
     SQL.Add(' where ');
     SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and "col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     FechaDesembolso := CalculoFecha(FieldByName('FECHA_DESEMBOLSO').AsDateTime,FieldByName('DIAS_PAGO').AsInteger);
     Close;

     SQL.Clear;
     SQL.Add('select count(*) as CUOTAS from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     TotalCuotas := FieldByName('CUOTAS').AsInteger;
     Close;

     SQL.Clear;
     SQL.Add('select VALOR_COSTAS from "col$costas" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Costas := FieldByName('VALOR_COSTAS').AsCurrency;

     SQL.Clear;
     SQL.Add('select * from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
     SQL.Add('PAGADA = 0 ');
     SQL.Add('order by "col$tablaliquidacion".ID_COLOCACION, "col$tablaliquidacion".CUOTA_NUMERO');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Last;
     First;
     MyCuotasLiq.Lista := TList.Create;
//Busco Costas
     if Costas > 0 then
      begin
        New(AR);
        AR^.CuotaNumero := 0;
        if Estado = 2 then //Juridico
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString
        else
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS_CAS').AsString;
        AR^.FechaInicial := FechaCorte;
        AR^.FechaFinal   := FechaCorte;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := 0;
        AR^.Credito      :=  Costas;
        AR^.EsCapital := False;
        AR^.EsCausado := False;
        AR^.EsCorriente := False;
        AR^.EsVencido := False;
        AR^.EsAnticipado := False;
        if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
        MyCuotasLiq.Lista.Add(AR);
        TotalCredito := TotalCredito + AR^.Credito;
        TotalDebito  := TotalDebito  + AR^.Debito;
      end;

     for I := 0 to (CuotasALiquidar - 1) do
      begin
     // Calcular Fechas a Liquidar
        NoCuota := FieldByName('CUOTA_NUMERO').AsInteger;
        Capital := Valorcuota;
        Fecha1 := FechaPagoI;
        FechaProx := FieldByName('FECHA_A_PAGAR').AsDateTime;
        FechaProxK := FieldByName('FECHA_A_PAGAR').AsDateTime;
        if FechaProx < FechaPagoI then
           FechaProx := FechaPagoI;
        if SaldoActual < Capital then
           Capital := SaldoActual
        else
           Capital := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
        if NoCuota = TotalCuotas then
         begin
           MyCuotasLiq.FechaProx := FechaProx;
           MyCuotasLiq.CapitalHasta := FechaPagoK;
           FechaProx := CalculoFecha(FechaProx,DiasProrroga);
           FechaProxNueva := FechaProx;
           FechaPagoI := FechaCorte;
         end
        else
         begin
           ProximoPago := CalculoFecha(FechaProx,Amortizacion);
           DecodeDate(FechaDesembolso,Ano,Mes,Dia);
           DecodeDate(ProximoPago,AnoA,MesA,DiaA);
           ProximoPago := EncodeDate(AnoA,MesA,Dia);
           MyCuotasLiq.FechaProx := ProximoPago;
           if Capital > 0 then
            begin
              FechaProxK := CalculoFecha(FechaPagoK,DiasProrroga);
              FechaProxK := calculofecha(FechaProxK,AmortizaK);
            end
           else
            FechaProxK := FechaPagoK;
           MyCuotasLiq.CapitalHasta := FechaProxK;
           FechaProxNueva := FechaProx;
           FechaProx := Calculofecha(FechaProx,Amortizacion);
           FechaPagoI := CalculoFecha(FechaPagoI,Amortizacion);
//           FechaProx := Calculofecha(FechaPagoI,Amortizacion);
//           FechaPagoI := FechaProx; // CalculoFecha(FechaPagoI,Amortizacion);
         end;
        try
         FechasLiq := TList.Create;
         FechaArranque := IncDay(Fecha1);

         CalcularFechasLiquidarVarVencida(FechaArranque,FechaCorte,FechaProxNueva,FechasLiq);
         if FechaProxNueva > FechaCorte then
            CalcularFechasDevolucion(FechaCorte,FechaProxNueva,FechasLiq)
         else
            CalcularFechasMora(FechaCorte,FechaProxNueva,FechasLiq);

// Proceso de Liquidación de Fechas
         TotalInteres := 0;
         for J := 0 to (FechasLiq.Count - 1) do
          begin
            AF := FechasLiq.Items[J];
            New(AR);
            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            if TipoInteres = 0 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion);
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end;

            if Clasificacion = 3 then begin
              TasaEfectiva1 := BuscoTasaEfectivaUvr(FechaPagoI);
              TasaEfectiva1 := TasaNominalVencida(TasaEfectiva1,Amortizacion);
              if TasaEfectiva1 < TasaLiquidar then
                TasaLiquidar := TasaEfectiva1;
             end;


            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            TasaMora     := TasaNominalVencida(TasaMaxima,30);

            if (AF^.Anticipado) or (AF^.Devuelto) then
              AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
            else
             if AF^.Causado then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
            else
             if AF^.Corrientes then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString
            else
             if AF^.Vencida then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;

            if AF^.Devuelto then
             begin
               with dmColocacion.IBSQL do begin
                 Close;
                 sql.Clear;
                 sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION, "col$extractodet".ID_CBTE_COLOCACION,');
                 sql.Add('"col$extractodet".FECHA_INICIAL, "col$extractodet".FECHA_FINAL');
                 sql.Add('from "col$extracto"');
                 sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
                 sql.Add('where');
                 sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
                 sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
                 sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
                 sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
                 sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
                 sql.Add('"col$extractodet".VALOR_CREDITO > 0');
                 sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
                 ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                 ParamByName('ID_COLOCACION').AsString := IdColocacion;
                 ParamByName('FECHA').AsDate := AF^.FechaFinal;
                 ParamByName('CODIGO_PUC').AsString := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
                 ExecQuery;
                 TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
                 Close;
               end;
                 TasaDev := TasaEfectivaVencida(TasaDev,Amortizacion);
             end;

            if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4) then
             begin
               TasaDoble := SimpleRoundTo(2 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end
            else if Clasificacion = 3 then
             begin
               TasaDoble := SimpleRoundTo(1.5 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end;

            AR^.CuotaNumero  := FieldByName('CUOTA_NUMERO').AsInteger;
            AR^.FechaInicial := AF^.FechaInicial;
            AR^.FechaFinal   := AF^.FechaFinal;
            DecodeDate(AF^.FechaInicial,Ano,Mes,Dia);
            if ((Int(FechaArranque) = Int(AR^.FechaInicial)) and (Mes=3) and (Dia=1) and (AF^.Devuelto=False) and (AF^.Vencida=False)) then
                Bisiesto := True
            else
                Bisiesto := False;
            if AF^.Devuelto then Devuelto := True
            else Devuelto := False;
            AR^.Dias := DiasEntreFechas1(AF^.FechaInicial,AF^.FechaFinal,FechaDesembolso,Bisiesto,Devuelto);
            if AF^.Vencida then
               AR^.Tasa := TasaMora
            else
               AR^.Tasa := TasaLiquidar;

            if AF^.Devuelto then
               AR^.Credito := 0
            else
               AR^.Debito  := 0;

            if AF^.Devuelto then
               AR^.Debito := SimpleRoundTo((Capital * TasaLiquidar / 100 * AR^.Dias ) / 360,0)
            else
             if AF^.Vencida then
                AR^.Credito    := SimpleRoundTo((Capital * TasaMora / 100 * AR^.Dias ) / 360,0)
            else
                AR^.Credito    := SimpleRoundTo((SaldoActual * TasaLiquidar / 100 * AR^.Dias ) / 360,0);

            AR^.EsCapital := False;
            if AF^.Causado then AR^.EsCausado := True
            else AR^.EsCausado := False;
            if AF^.Corrientes then AR^.EsCorriente := True
            else AR^.EsCorriente := False;
            if AF^.Vencida then AR^.EsVencido := True
            else AR^.EsVencido := False;
            if AF^.Anticipado then AR^.EsAnticipado := True
            else AR^.EsAnticipado := False;
            if AF^.Devuelto Then AR^.EsDevuelto := True
            else AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
            TotalCredito := TotalCredito + AR^.Credito;
            TotalInteres := TotalInteres + AR^.Credito;
            TotalDebito  := TotalDebito  + AR^.Debito;
          end;

// Calculo Capital
          New(AR);
          AR^.CuotaNumero := FieldByName('CUOTA_NUMERO').AsInteger;
          AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      :=  Capital; //FieldByName('CAPITAL_A_PAGAR').AsCurrency;
          AR^.EsCapital := True;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);
          TotalCredito := TotalCredito + AR^.Credito;
          TotalDebito  := TotalDebito  + AR^.Debito;;

          if FechasLiq.Count <= 0 then
             FechaPagoI := CalculoFecha(FechaPagoI,-Amortizacion);
// Limpiar tabla de Fechas
          for J := 0 to (FechasLiq.Count - 1) do
           begin
             AF := FechasLiq.Items[J];
             Dispose(AF);
           end;

// Coloco Caja
          New(AR);
          AR^.CuotaNumero := FieldByName('CUOTA_NUMERO').AsInteger;
          AR^.CodigoPuc    := CodigoCaja;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCredito - TotalDebito;
          AR^.Credito      := 0;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
          TotalDebito := 0;
          TotalCredito := 0;
        finally
          FechasLiq.Free;
        end;
        SaldoActual := SaldoActual - Capital;
        MyCuotasLiq.NuevoSaldo := SaldoActual;
        MyCuotasLiq.InteresesHasta := FechaPagoI;
        Next;
      end;
   end;
   dmColocacion.IBSQLcodigos.Close;
   dmColocacion.IBQuery.Close;
   MyCuotasLiq.Liquidado := True;
end;

procedure LiquidarCuotasFijaPagoTotal(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);

var I,J:Integer;
    FechasLiq:TList;
    AR:PCuotasLiq;
    AF:PFechasLiq;
    FechaProx:TDate;
    FechaProxK:TDate;
    TasaLiquidar:Double;
    TasaDev : Double;
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDate;
    Capital:Currency;
    TotalInteres:Currency;
    TotalIntCredito:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    TasaEfectiva:Double;
    TasaEfectiva1:Double;
    TotalCuotas:Integer;
    NoCuota:Integer;
    Costas:Currency;
    Honorarios:Currency;
    InteresCuota : Currency;
    FechaProxNueva:TDate;
    FechaDesembolso:TDate;
    Es_Vivienda : Boolean;
    ValorCuotaVivienda : Currency;
    TasaMaxima : Double;
    TasaDoble : Double;
    Dia,Mes,Ano:Word;
    DiaA,MesA,AnoA:Word;
    Saldo:Currency;
    CapitalMora:Currency;
    FechaInicialMora:TDate;
    TasaNomDev:Double;
    IBSQL1:TIBSQL;
    IBT1:TIBTRANSACTION;
    Devuelto:Boolean;
begin
  IBSQL1 := TIBSQL.Create(Application);
  IBT1 := TIBTransaction.Create(Application);
  IBSQL1.Transaction := IBT1;
  IBT1.DefaultDatabase := dmGeneral.IBDatabase1;

  TotalCredito := 0;
  TotalDebito  := 0;
  Costas := 0;
  ValorCuotaVivienda := 0;
  FechaCorte := Trunc(FechaCorte);

  if AmortizaK < AmortizaI then Amortizacion := AmortizaK
   else Amortizacion := AmortizaI;

  with dmColocacion.IBSQL do
   begin
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
     ExecQuery;
     CodigoCaja := FieldByName('CODIGO').AsString;
     Close;
   end;

  with dmColocacion.IBSQLcodigos do
   begin
     SQL.Clear;
     SQL.Add('select * from "col$codigospuc" where ');
     SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
     SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
     SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
     ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
     ParamByName('ID_GARANTIA').AsInteger      := Garantia;
     ParamByName('ID_CATEGORIA').AsString     := Categoria;
     ExecQuery;
     if RecordCount = 0 then
      begin
        MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
        MyCuotasLiq.Liquidado:= False;
        Close;
        Exit;
      end;
   end;

  with dmColocacion.IBQuery do
   begin
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colocacion".ID_LINEA,');
     SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".DIAS_PAGO,');
     SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - ABONOS_CAPITAL AS SALDO,');
     SQL.Add('"col$colocacion".FECHA_INTERES,');
     SQL.Add('"col$tablaliquidacion".CUOTA_NUMERO,');
     SQL.Add('"col$tablaliquidacion".CAPITAL_A_PAGAR,');
     SQL.Add('"col$tablaliquidacion".INTERES_A_PAGAR,');
     SQL.Add('"col$lineas".ES_VIVIENDA');
     SQL.Add('from "col$colocacion"');
     SQL.Add('INNER JOIN "col$tablaliquidacion" ON ("col$colocacion".ID_COLOCACION = "col$tablaliquidacion".ID_COLOCACION) ');
     SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA) ');
     SQL.Add(' where ');
     SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and "col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
     SQL.Add('and "col$tablaliquidacion".PAGADA = 0');
     SQL.Add('ORDER BY "col$tablaliquidacion".CUOTA_NUMERO');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Last;
     First;
     ValorCuotaVivienda  := SimpleRoundTo(FieldByName('CAPITAL_A_PAGAR').AsCurrency + FieldByName('INTERES_A_PAGAR').AsCurrency,0);
     Saldo := FieldByName('SALDO').AsCurrency;
     FechaDesembolso := CalculoFecha(FieldByName('FECHA_DESEMBOLSO').AsDateTime,FieldByName('DIAS_PAGO').AsInteger);
     Es_Vivienda := InttoBoolean(FieldByName('ES_VIVIENDA').AsInteger);
     Close;

     SQL.Clear;
     SQL.Add('select VALOR_COSTAS from "col$costas" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Costas := FieldByName('VALOR_COSTAS').AsCurrency;
     Close;

{     SQL.Clear;
     SQL.Add('select VALOR_HONORARIOS from "col$costas" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Honorarios := FieldByName('VALOR_HONORARIOS').AsCurrency;
     Close;      }

     MyCuotasLiq.Lista := TList.Create;

//Busco Costas
     if Costas > 0 then
      begin
        New(AR);
        AR^.CuotaNumero := 0;
        if Estado = 2 then //Juridico
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString
        else
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS_CAS').AsString;
        AR^.FechaInicial := FechaCorte;
        AR^.FechaFinal   := FechaCorte;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := 0;
        AR^.Credito      :=  Costas;
        AR^.EsCapital := False;
        AR^.EsCausado := False;
        AR^.EsCorriente := False;
        AR^.EsVencido := False;
        AR^.EsAnticipado := False;
        if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
        MyCuotasLiq.Lista.Add(AR);
        TotalCredito := TotalCredito + AR^.Credito;
        TotalDebito  := TotalDebito  + AR^.Debito;
      end;

//Proceso de Cobro de Cuotas en Mora
          IBT1.StartTransaction;
          IBSQL1.SQL.Clear;
          IBSQL1.SQL.Add('select CUOTA_NUMERO, CAPITAL_A_PAGAR, FECHA_A_PAGAR from "col$tablaliquidacion" where ');
          IBSQL1.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
          IBSQL1.SQL.Add('PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
          IBSQL1.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
          IBSQL1.ParamByName('ID_COLOCACION').AsString := IdColocacion;
          IBSQL1.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
          IBSQL1.ExecQuery;

          while not IBSQL1.Eof do begin
            NoCuota := IBSQL1.FieldByName('CUOTA_NUMERO').AsInteger;
            if Es_Vivienda then
             ValorCuota := ValorCuotaVivienda;
            InteresCuota := SimpleRoundTo((SaldoActual * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic) / 100 * Amortizacion ) / 360,0);
            Capital := Valorcuota - InteresCuota;
            Fecha1 := FechaPagoI;
            FechaProx := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDateTime;
            FechaProx := CalculoFecha(FechaProx,DiasProrroga);
            FechaProxK := FechaProx;
            FechaProxNueva := FechaProx;
            MyCuotasLiq.CapitalHasta := FechaProxK;
            if SaldoActual < Capital then
             Capital := SaldoActual;
            if NoCuota = TotalCuotas then
             begin
               Capital := SaldoActual;
               MyCuotasLiq.FechaProx := 0
             end
            else
             MyCuotasLiq.FechaProx := CalculoFecha(FechaProx,Amortizacion);

            try
              FechasLiq := TList.Create;
              FechaArranque := IncDay(Fecha1);

              CalcularFechasLiquidarFija(FechaArranque,FechaCorte,FechaProx,FechasLiq);
              if FechaProxNueva > FechaCorte then
                CalcularFechasDevolucion(FechaCorte,FechaProxNueva,FechasLiq)
              else
                CalcularFechasMora(FechaCorte,FechaProxNueva,FechasLiq);
              // Proceso de Liquidación de Fechas
              TotalInteres := 0;
              TotalIntCredito := 0;
              for J := 0 to (FechasLiq.Count - 1) do
               begin
                 AF := FechasLiq.Items[J];
                 New(AR);
            if TipoInteres = 0 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion);
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end;

            if Clasificacion = 3 then begin
              TasaEfectiva1 := BuscoTasaEfectivaUvr(FechaPagoI);
              TasaEfectiva1 := TasaNominalVencida(TasaEfectiva1,Amortizacion);
              if TasaEfectiva1 < TasaLiquidar then
                TasaLiquidar := TasaEfectiva1;
             end;


            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            TasaMora     := TasaNominalVencida(TasaMaxima,30);

                 if (AF^.Anticipado) or (AF^.Devuelto) then
                  AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
                 else
                 if AF^.Causado then
                  AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
                 else
                 if AF^.Corrientes then
                  AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString
                 else
                 if AF^.Vencida then
                  AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;

                 if AF^.Devuelto then
                  begin
                    with dmColocacion.IBSQL do begin
                     Close;
                     sql.Clear;
                     sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION, "col$extractodet".ID_CBTE_COLOCACION,');
                     sql.Add('"col$extractodet".FECHA_INICIAL, "col$extractodet".FECHA_FINAL');
                     sql.Add('from "col$extracto"');
                     sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
                     sql.Add('where');
                     sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
                     sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
                     sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
                     sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
                     sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
                     sql.Add('"col$extractodet".VALOR_CREDITO > 0');
                     sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
                     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                     ParamByName('ID_COLOCACION').AsString := IdColocacion;
                     ParamByName('FECHA').AsDate := AF^.FechaFinal;
                     ParamByName('CODIGO_PUC').AsString := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
                     ExecQuery;
                     TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
                     Close;
                    end;
                    TasaDev := TasaEfectivaVencida(TasaDev,Amortizacion);
                  end;


                 if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4) then
                  begin
                    TasaDoble := SimpleRoundTo(2 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
                    if TasaMora > TasaDoble then
                      TasaMora := TasaDoble;
                  end
                 else if Clasificacion = 3 then
                  begin
                    TasaDoble := SimpleRoundTo(1.5 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
                    if TasaMora > TasaDoble then
                      TasaMora := TasaDoble;
                  end;
                 vTasa := TasaLiquidar;

                 AR^.CuotaNumero  := IBSQL1.FieldByName('CUOTA_NUMERO').AsInteger;
                 AR^.FechaInicial := AF^.FechaInicial;
                 AR^.FechaFinal   := AF^.FechaFinal;
                 DecodeDate(AF^.FechaInicial,Ano,Mes,Dia);
                 if ((Int(FechaArranque) = Int(AR^.FechaInicial)) and (Mes=3) and (Dia=1) and (AF^.Devuelto=False) and (AF^.Vencida=False)) then
                  Bisiesto := True
                 else
                  Bisiesto := False;
                 if AF^.Devuelto then Devuelto := True
                 else Devuelto := False;
                 AR^.Dias := DiasEntreFechas1(AF^.FechaInicial,AF^.FechaFinal,FechaDesembolso,Bisiesto,Devuelto);
                 if AF^.Vencida then
                   AR^.Tasa := TasaMora
                 else
                   AR^.Tasa := TasaLiquidar;

                 if AF^.Devuelto then
                   AR^.Credito := 0
                 else
                   AR^.Debito  := 0;

                 if AF^.Devuelto then
                  AR^.Debito := SimpleRoundTo((Capital * TasaLiquidar / 100 * AR^.Dias ) / 360,0)
                 else
                 if AF^.Vencida then
                  AR^.Credito    := SimpleRoundTo((Capital * TasaMora / 100 * AR^.Dias ) / 360,0)
                 else
                  AR^.Credito    := SimpleRoundTo((SaldoActual * TasaLiquidar / 100 * AR^.Dias ) / 360,0);

                 AR^.EsCapital := False;
                 if AF^.Causado then
                  begin
                    AR^.EsCausado := True;
                    TotalIntCredito := TotalIntCredito + AR^.Credito;
                  end
                 else AR^.EsCausado := False;
                 if AF^.Corrientes then
                  begin
                    AR^.EsCorriente := True;
                    TotalIntCredito := TotalIntCredito + AR^.Credito;
                  end
                 else AR^.EsCorriente := False;
                 if AF^.Vencida then AR^.EsVencido := True
                 else AR^.EsVencido := False;
                 if AF^.Anticipado then
                  begin
                    AR^.EsAnticipado := True;
                    TotalIntCredito := TotalIntCredito + AR^.Credito;
                  end
                 else AR^.EsAnticipado := False;
                 if AF^.Devuelto Then AR^.EsDevuelto := True
                 else AR^.EsDevuelto := False;
                 if (AR^.Debito <> 0) or (AR^.Credito <> 0) then
                  MyCuotasLiq.Lista.Add(AR);
                 TotalCredito := TotalCredito + AR^.Credito;
                 TotalInteres := TotalInteres + AR^.Credito;
                 TotalDebito  := TotalDebito  + AR^.Debito;
               end; // fin de for fechas

              // Calculo Capital
              New(AR);
              AR^.CuotaNumero := IBSQL1.FieldByName('CUOTA_NUMERO').AsInteger;
              AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
              AR^.FechaInicial := FechaCorte;
              AR^.FechaFinal   := FechaCorte;
              AR^.Dias         := 0;
              AR^.Tasa         := 0;
              AR^.Debito       := 0;
              AR^.Credito      := Capital;
              AR^.EsCapital := True;
              AR^.EsCausado := False;
              AR^.EsCorriente := False;
              AR^.EsVencido := False;
              AR^.EsAnticipado := False;
              if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
              MyCuotasLiq.Lista.Add(AR);
              TotalCredito := TotalCredito + AR^.Credito;
              TotalDebito  := TotalDebito  + AR^.Debito;;
              // Limpiar tabla de Fechas
              for J := 0 to (FechasLiq.Count - 1) do
               begin
                 AF := FechasLiq.Items[J];
                 Dispose(AF);
               end;

            finally
              FechasLiq.Free;
            end;
            SaldoActual := SaldoActual - Capital;
            FechaPagoI := FechaProx; //CalculoFecha(FechaPagoI,Amortizacion);
            IBSQL1.Next;
          end;
          IBSQL1.Close;
// Fin de Cuotas en Mora


        InteresCuota := SimpleRoundTo((SaldoActual * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic) / 100 * Amortizacion ) / 360,0);
        Capital := SaldoActual;
        Fecha1 := FechaPagoI;
        FechaProxNueva := calculofecha(FechaPagoI,Amortizacion);
        FechaProx := FechaCorte;
        MyCuotasLiq.CapitalHasta := FechaProx;
        MyCuotasLiq.FechaProx := 0;
        try
        FechasLiq := TList.Create;
        FechaArranque := IncDay(Fecha1);
        CalcularFechasLiquidarFija(FechaArranque,FechaCorte,FechaProx,FechasLiq);
         if FechaPagoI > FechaCorte then
            CalcularFechasDevolucion(FechaCorte,FechaPagoI,FechasLiq);
         // Proceso de Liquidación de Fechas
         TotalInteres := 0;
         TotalIntCredito := 0;
         for J := 0 to (FechasLiq.Count - 1) do
          begin
            AF := FechasLiq.Items[J];
            New(AR);
            if TipoInteres = 0 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion);
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end;

            if Clasificacion = 3 then begin
              TasaEfectiva1 := BuscoTasaEfectivaUvr(FechaPagoI);
              TasaEfectiva1 := TasaNominalVencida(TasaEfectiva1,Amortizacion);
              if TasaEfectiva1 < TasaLiquidar then
                TasaLiquidar := TasaEfectiva1;
             end;


            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            TasaMora     := TasaNominalVencida(TasaMaxima,30);

            if (AF^.Anticipado) or (AF^.Devuelto) then
              AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
            else
             if AF^.Causado then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
            else
             if AF^.Corrientes then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString
            else
             if AF^.Vencida then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;

            if AF^.Devuelto then
             begin
               with dmColocacion.IBSQL do begin
                 Close;
                 sql.Clear;
                 sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION, "col$extractodet".ID_CBTE_COLOCACION,');
                 sql.Add('"col$extractodet".FECHA_INICIAL, "col$extractodet".FECHA_FINAL');
                 sql.Add('from "col$extracto"');
                 sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
                 sql.Add('where');
                 sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
                 sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
                 sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
                 sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
                 sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
                 sql.Add('"col$extractodet".VALOR_CREDITO > 0');
                 sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
                 ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                 ParamByName('ID_COLOCACION').AsString := IdColocacion;
                 ParamByName('FECHA').AsDate := AF^.FechaFinal;
                 ParamByName('CODIGO_PUC').AsString := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
                 ExecQuery;
                 TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
                 Close;
               end;
                 TasaDev := TasaEfectivaVencida(TasaDev,Amortizacion);
             end;

            if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4) then
             begin
               TasaDoble := SimpleRoundTo(2 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end
            else if Clasificacion = 3 then
             begin
               TasaDoble := SimpleRoundTo(1.5 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end;
            vTasa := TasaLiquidar;

            AR^.CuotaNumero  := 0;
            AR^.FechaInicial := AF^.FechaInicial;
            AR^.FechaFinal   := AF^.FechaFinal;
            DecodeDate(AF^.FechaInicial,Ano,Mes,Dia);
            if ((Int(FechaArranque) = Int(AR^.FechaInicial)) and (Mes=3) and (Dia=1) and (AF^.Devuelto=False) and (AF^.Vencida=False)) then
               Bisiesto := True
            else
               Bisiesto := False;
             AR^.Dias := DiasEntrePagoTotal(AF^.FechaInicial,AF^.FechaFinal);
            if AF^.Vencida then
               AR^.Tasa := TasaMora
            else
               AR^.Tasa := TasaLiquidar;

            if AF^.Devuelto then
               AR^.Credito := 0
            else
               AR^.Debito  := 0;

            if AF^.Devuelto then
               AR^.Debito := SimpleRoundTo((Capital * TasaLiquidar / 100 * AR^.Dias ) / 360,0)
            else
               AR^.Credito    := SimpleRoundTo((SaldoActual * TasaLiquidar / 100 * AR^.Dias ) / 360,0);

            AR^.EsCapital := False;
            if AF^.Causado then
             begin
               AR^.EsCausado := True;
               TotalIntCredito := TotalIntCredito + AR^.Credito;
             end
            else AR^.EsCausado := False;
            if AF^.Corrientes then
             begin
               AR^.EsCorriente := True;
               TotalIntCredito := TotalIntCredito + AR^.Credito;
             end
            else AR^.EsCorriente := False;
            if AF^.Vencida then AR^.EsVencido := True
            else AR^.EsVencido := False;
            if AF^.Anticipado then
             begin
               AR^.EsAnticipado := True;
               TotalIntCredito := TotalIntCredito + AR^.Credito;
             end
            else AR^.EsAnticipado := False;
            if AF^.Devuelto Then AR^.EsDevuelto := True
            else AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
            TotalCredito := TotalCredito + AR^.Credito;
            TotalInteres := TotalInteres + AR^.Credito;
            TotalDebito  := TotalDebito  + AR^.Debito;
          end;

          // Calculo Capital
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      := Capital;
          AR^.EsCapital := True;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);
          TotalCredito := TotalCredito + AR^.Credito;
          TotalDebito  := TotalDebito  + AR^.Debito;;
          // Limpiar tabla de Fechas
          for J := 0 to (FechasLiq.Count - 1) do
           begin
             AF := FechasLiq.Items[J];
             Dispose(AF);
           end;

          // Coloco Caja
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoCaja;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCredito - TotalDebito;
          AR^.Credito      := 0;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
          TotalDebito := 0;
          TotalCredito := 0;
        finally
          FechasLiq.Free;
        end;
        SaldoActual := SaldoActual - Capital;
        FechaPagoI := FechaProx;
        MyCuotasLiq.NuevoSaldo := SaldoActual;
        MyCuotasLiq.InteresesHasta := FechaPagoI;
   end;
   dmColocacion.IBSQLcodigos.Close;
   dmColocacion.IBQuery.Close;
   MyCuotasLiq.Liquidado := True;
end;

procedure LiquidarCuotasVarAnticipadaPagoTotal(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);

var I,J:Integer;
    FechasLiq:TList;
    AR:PCuotasLiq;
    AF:PFechasLiq;
    FechaProx:TDate;
    FechaProxK:TDate;
    TasaLiquidar:Double;
    TasaDev:Double;
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDate;
    Capital:Currency;
    TotalInteres:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    FechaProxNueva:TDate;
    FechaDesembolso:TDate;
    TasaEfectiva:Double;
    TasaEfectiva1:Double;
    TotalCuotas:Integer;
    NoCuota:Integer;
    Costas:Currency;
    TasaMaxima : Double;
    TasaDoble : Double;
    Dia,Mes,Ano:Word;
    FechaAnterior:TDateTime;
    A,M,D,AA,MM,DD:Word;
    Saldo:Currency;
    CapitalMora:Currency;
    FechaInicialMora:TDate;
    TasaNomDev:Double;
    IBSQL1:TIBSQL;
    IBT1:TIBTRANSACTION;
    Devuelto:Boolean;
begin
  IBSQL1 := TIBSQL.Create(Application);
  IBT1 := TIBTransaction.Create(Application);
  IBSQL1.Transaction := IBT1;
  IBT1.DefaultDatabase := dmGeneral.IBDatabase1;

  TotalCredito := 0;
  TotalDebito  := 0;
  Costas := 0;
  FechaCorte := Trunc(FechaCorte);

  if AmortizaK < AmortizaI then Amortizacion := AmortizaK
   else Amortizacion := AmortizaI;

  with dmColocacion.IBSQL do
   begin
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
     ExecQuery;
     CodigoCaja := FieldByName('CODIGO').AsString;
     Close;
   end;

  with dmColocacion.IBSQLcodigos do
   begin
     SQL.Clear;
     SQL.Add('select * from "col$codigospuc" where ');
     SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
     SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
     SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
     ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
     ParamByName('ID_GARANTIA').AsInteger      := Garantia;
     ParamByName('ID_CATEGORIA').AsString     := Categoria;
     ExecQuery;
     if RecordCount = 0 then
      begin
        MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
        MyCuotasLiq.Liquidado:= False;
        Close;
        Exit;
      end;
   end;

  with dmColocacion.IBQuery do
   begin
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".DIAS_PAGO,');
     SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL as SALDO');
     SQL.Add('from "col$colocacion"');
     SQL.Add(' where ');
     SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and "col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     FechaDesembolso := CalculoFecha(FieldByName('FECHA_DESEMBOLSO').AsDateTime,FieldByName('DIAS_PAGO').AsInteger);
     Saldo := FieldByName('SALDO').AsCurrency;
     Close;

     SQL.Clear;
     SQL.Add('select first 1 FECHA_A_PAGAR from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE" and CAPITAL_A_PAGAR > 0');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     ParamByName('FECHA_CORTE').AsDate := FechaCorte;
     Open;
     FechaInicialMora := FieldByName('FECHA_A_PAGAR').AsDateTime;
     Close;

     SQL.Clear;
     SQL.Add('select VALOR_COSTAS from "col$costas" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Costas := FieldByName('VALOR_COSTAS').AsCurrency;

     SQL.Clear;
     SQL.Add('select count(*) as CUOTAS, sum(CAPITAL_A_PAGAR) as MORA from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
     SQL.Add('PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     ParamByName('FECHA_CORTE').AsDate := FechaCorte;
     Open;
     TotalCuotas := FieldByName('CUOTAS').AsInteger;
     CapitalMora := FieldByName('MORA').AsCurrency;

     MyCuotasLiq.Lista := TList.Create;
     //Busco Costas
     if Costas > 0 then
      begin
        New(AR);
        AR^.CuotaNumero := 0;
        if Estado = 2 then //Juridico
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString
        else
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS_CAS').AsString;
        AR^.FechaInicial := FechaCorte;
        AR^.FechaFinal   := FechaCorte;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := 0;
        AR^.Credito      :=  Costas;
        AR^.EsCapital := False;
        AR^.EsCausado := False;
        AR^.EsCorriente := False;
        AR^.EsVencido := False;
        AR^.EsAnticipado := False;
        if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
        MyCuotasLiq.Lista.Add(AR);
        TotalCredito := TotalCredito + AR^.Credito;
        TotalDebito  := TotalDebito  + AR^.Debito;
      end;
//Proceso de Cobro de Cuotas en Mora
     IBT1.StartTransaction;
     IBSQL1.SQL.Clear;
     IBSQL1.SQL.Add('select CUOTA_NUMERO, CAPITAL_A_PAGAR, FECHA_A_PAGAR from "col$tablaliquidacion" where ');
     IBSQL1.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
     IBSQL1.SQL.Add('PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
     IBSQL1.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     IBSQL1.ParamByName('ID_COLOCACION').AsString := IdColocacion;
     IBSQL1.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
     IBSQL1.ExecQuery;

     while not IBSQL1.Eof do begin
      // Calcular Fechas a Liquidar
      NoCuota := IBSQL1.FieldByName('CUOTA_NUMERO').AsInteger;
      Capital := Valorcuota;
      Fecha1 := FechaPagoI;
      FechaProx := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDateTime; //calculofecha(FechaPagoI,DiasProrroga); //
      if FechaProx < FechaPagoI then
        FechaProx := FechaPagoI;
      FechaProxNueva := FechaProx;
      if SaldoActual < Capital then
        Capital := SaldoActual
      else
        Capital := IBSQL1.FieldByName('CAPITAL_A_PAGAR').AsCurrency;
      if DiasProrroga > 0 then Capital := 0;
      if NoCuota = TotalCuotas then
       begin
         MyCuotasLiq.FechaProx := FechaProx;
         MyCuotasLiq.CapitalHasta := FechaPagoK;
         FechaProxNueva := CalculoFecha(FechaProx,-Amortizacion);
         FechaProx := CalculoFecha(FechaProx,DiasProrroga);
         FechaProxNueva := FechaProx;
         FechaPagoI := FechaCorte;
       end
      else
       begin
         FechaProx := CalculoFecha(FechaProx,Amortizacion);
         DecodeDate(FechaProx,A,M,D);
         DecodeDate(FechaDesembolso,AA,MM,DD);
         if TryEncodeDate(A,M,DD,FechaAnterior) then
          FechaProx := FechaAnterior;
         MyCuotasLiq.FechaProx := FechaProx;
         if Capital > 0 then
          begin
            FechaProxK := CalculoFecha(FechaPagoK,DiasProrroga);
            FechaProxK := calculofecha(FechaProxK,AmortizaK);
            DecodeDate(FechaProxK,A,M,D);
            DecodeDate(FechaDesembolso,AA,MM,DD);
            if TryEncodeDate(A,M,DD,FechaAnterior) then
              FechaProxK := FechaAnterior;
          end
         else
          FechaProxK := FechaPagoK;
         MyCuotasLiq.CapitalHasta := FechaProxK;
       end;
      try
       FechasLiq := TList.Create;
       FechaArranque := IncDay(Fecha1);
       CalcularFechasLiquidarVarAnticipada(FechaArranque,FechaCorte,FechaProx,FechasLiq);
       if FechaProxNueva > FechaCorte then
          CalcularFechasDevolucion(FechaCorte,FechaProxNueva,FechasLiq)
       else
          CalcularFechasMora(FechaCorte,FechaProxNueva,FechasLiq);
       // Proceso de Liquidación de Fechas
       TotalInteres := 0;
       for J := 0 to (FechasLiq.Count - 1) do
        begin
          AF := FechasLiq.Items[J];
          New(AR);
            if TipoInteres = 0 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
               TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion);
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion) + PuntosAdic;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion) + PuntosAdic;
             end;

            if Clasificacion = 3 then begin
              TasaEfectiva1 := BuscoTasaEfectivaUvr(FechaPagoI);
              TasaEfectiva1 := TasaNominalAnticipada(TasaEfectiva1,Amortizacion);
              if TasaEfectiva1 < TasaLiquidar then
                TasaLiquidar := TasaEfectiva1;
             end;


            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            TasaMora     := TasaNominalVencida(TasaMaxima,30);

          if (AF^.Anticipado) or (AF^.Devuelto) then
            AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
          else
          if AF^.Causado then
            AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
          else
          if AF^.Corrientes then
            AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString
          else
          if AF^.Vencida then
            AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;

          if AF^.Devuelto then
           begin
             with dmColocacion.IBSQL do begin
              Close;
              sql.Clear;
              sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION, "col$extractodet".ID_CBTE_COLOCACION,');
              sql.Add('"col$extractodet".FECHA_INICIAL, "col$extractodet".FECHA_FINAL');
              sql.Add('from "col$extracto"');
              sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
              sql.Add('where');
              sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
              sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
              sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
              sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
              sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
              sql.Add('"col$extractodet".VALOR_CREDITO > 0');
              sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
              ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
              ParamByName('ID_COLOCACION').AsString := IdColocacion;
              ParamByName('FECHA').AsDate := AF^.FechaFinal;
              ParamByName('CODIGO_PUC').AsString := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
              ExecQuery;
              TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
              Close;
             end;
             TasaDev := TasaEfectivaAnticipada(TasaDev,Amortizacion);
           end;

          if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4)then
           begin
             TasaDoble := SimpleRoundTo(2 * (TasaNominalAnticipada(ValorTasa,Amortizacion) + PuntosAdic));
             if TasaMora > TasaDoble then
              TasaMora := TasaDoble;
           end
          else if Clasificacion = 3 then
           begin
             TasaDoble := SimpleRoundTo(1.5 * (TasaNominalAnticipada(ValorTasa,Amortizacion) + PuntosAdic));
             if TasaMora > TasaDoble then
              TasaMora := TasaDoble;
           end;

          AR^.CuotaNumero  := IBSQL1.FieldByName('CUOTA_NUMERO').AsInteger;
          AR^.FechaInicial := AF^.FechaInicial;
          AR^.FechaFinal   := AF^.FechaFinal;
          DecodeDate(AF^.FechaInicial,Ano,Mes,Dia);
          if ((Int(FechaArranque) = Int(AR^.FechaInicial)) and (Mes=3) and (Dia=1) and (AF^.Devuelto=False) and (AF^.Vencida=False)) then
            Bisiesto := True
          else
            Bisiesto := False;
          if AF^.Devuelto then Devuelto := True
          else Devuelto := False;
          AR^.Dias := DiasEntreFechas1(AF^.FechaInicial,AF^.FechaFinal,FechaDesembolso,Bisiesto,Devuelto);
          if AF^.Vencida then
             AR^.Tasa := TasaMora
          else
             AR^.Tasa := TasaLiquidar;

          if AF^.Devuelto then
             AR^.Credito := 0
          else
             AR^.Debito  := 0;

          if AF^.Devuelto then
             AR^.Debito := SimpleRoundTo((Capital * TasaLiquidar / 100 * AR^.Dias ) / 360,0)
          else
          if AF^.Vencida then
             AR^.Credito    := SimpleRoundTo((Capital * TasaMora / 100 * AR^.Dias ) / 360,0)
          else
             AR^.Credito      := SimpleRoundTo(((SaldoActual - Capital) * TasaLiquidar / 100 * AR^.Dias ) / 360,0);

          AR^.EsCapital := False;
          if AF^.Causado then AR^.EsCausado := True
          else AR^.EsCausado := False;
          if AF^.Corrientes then AR^.EsCorriente := True
          else AR^.EsCorriente := False;
          if AF^.Vencida then AR^.EsVencido := True
          else AR^.EsVencido := False;
          if AF^.Anticipado then AR^.EsAnticipado := True
          else AR^.EsAnticipado := False;
          if AF^.Devuelto Then AR^.EsDevuelto := True
          else AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or (AR^.Credito <> 0) then
            MyCuotasLiq.Lista.Add(AR);
          TotalCredito := TotalCredito + AR^.Credito;
          TotalInteres := TotalInteres + AR^.Credito;
          TotalDebito  := TotalDebito  + AR^.Debito;
        end;  //Fin for Fechas

       // Calculo Capital
       New(AR);
       AR^.CuotaNumero := IBSQL1.FieldByName('CUOTA_NUMERO').AsInteger;
       AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
       AR^.FechaInicial := FechaCorte;
       AR^.FechaFinal   := FechaCorte;
       AR^.Dias         := 0;
       AR^.Tasa         := 0;
       AR^.Debito       := 0;
       AR^.Credito      :=  Capital;
       AR^.EsCapital := True;
       AR^.EsCausado := False;
       AR^.EsCorriente := False;
       AR^.EsVencido := False;
       AR^.EsAnticipado := False;
       if (AR^.Debito <> 0) or (AR^.Credito <> 0) then
         MyCuotasLiq.Lista.Add(AR);
       TotalCredito := TotalCredito + AR^.Credito;
       TotalDebito  := TotalDebito  + AR^.Debito;;
       if FechasLiq.Count <= 0 then
         FechaPagoI := CalculoFecha(FechaPagoI,-Amortizacion);
       // Limpiar Lista de Fechas
       for J := 0 to (FechasLiq.Count - 1) do
        begin
          AF := FechasLiq.Items[J];
          Dispose(AF);
        end;


      finally
       FechasLiq.Free;
      end;
      SaldoActual := SaldoActual - Capital;
      FechaPagoI := FechaProx;
      IBSQL1.Next;
     end;
     IBSQL1.Close;
// Fin de Cuotas en Mora

        Capital := SaldoActual;
        Fecha1 := FechaPagoI;
        FechaProx := FechaCorte;
        MyCuotasLiq.FechaProx := 0;
        MyCuotasLiq.CapitalHasta := FechaProx;
        try
         FechasLiq := TList.Create;
         FechaArranque := IncDay(Fecha1);
         CalcularFechasLiquidarVarAnticipada(FechaArranque,FechaCorte,FechaProx,FechasLiq);
         if FechaPagoI > FechaCorte then
            CalcularFechasDevolucion(FechaCorte,FechaPagoI,FechasLiq);

// Proceso de Liquidación de Fechas
         TotalInteres := 0;
         for J := 0 to (FechasLiq.Count - 1) do
          begin
            AF := FechasLiq.Items[J];
            New(AR);
            if TipoInteres = 0 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
               TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion);
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion) + PuntosAdic;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion) + PuntosAdic;
             end;

            if Clasificacion = 3 then begin
              TasaEfectiva1 := BuscoTasaEfectivaUvr(FechaPagoI);
              TasaEfectiva1 := TasaNominalAnticipada(TasaEfectiva1,Amortizacion);
              if TasaEfectiva1 < TasaLiquidar then
                TasaLiquidar := TasaEfectiva1;
             end;


            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            TasaMora     := TasaNominalVencida(TasaMaxima,30);

            if (AF^.Anticipado) or (AF^.Devuelto) then
              AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
            else
             if AF^.Causado then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
            else
             if AF^.Corrientes then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString
            else
             if AF^.Vencida then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;


            if AF^.Devuelto then
             begin
               with dmColocacion.IBSQL do begin
                 Close;
                 sql.Clear;
                 sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION, "col$extractodet".ID_CBTE_COLOCACION,');
                 sql.Add('"col$extractodet".FECHA_INICIAL, "col$extractodet".FECHA_FINAL');
                 sql.Add('from "col$extracto"');
                 sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
                 sql.Add('where');
                 sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
                 sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
                 sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
                 sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
                 sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
                 sql.Add('"col$extractodet".VALOR_CREDITO > 0');
                 sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
                 ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                 ParamByName('ID_COLOCACION').AsString := IdColocacion;
                 ParamByName('FECHA').AsDate := AF^.FechaFinal;
                 ParamByName('CODIGO_PUC').AsString := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
                 ExecQuery;
                 TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
                 Close;
               end;
                 TasaDev := TasaEfectivaVencida(TasaDev,Amortizacion);
             end;

            if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4) then
             begin
               TasaDoble := SimpleRoundTo(2 * (TasaNominalAnticipada(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end
            else if Clasificacion = 3 then
             begin
               TasaDoble := SimpleRoundTo(1.5 * (TasaNominalAnticipada(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end;

            AR^.CuotaNumero  := 0;
            AR^.FechaInicial := AF^.FechaInicial;
            AR^.FechaFinal   := AF^.FechaFinal;
            DecodeDate(AF^.FechaInicial,Ano,Mes,Dia);
            if ((Int(FechaArranque) = Int(AR^.FechaInicial)) and (Mes=3) and (Dia=1) and (AF^.Devuelto=False) and (AF^.Vencida=False)) then
                Bisiesto := True
            else
                Bisiesto := False;
            AR^.Dias := DiasEntrePagoTotal(AF^.FechaInicial,AF^.FechaFinal);
            if AF^.Vencida then
               AR^.Tasa := TasaMora
            else
               AR^.Tasa := TasaLiquidar;

            if AF^.Devuelto then
               AR^.Credito := 0
            else
               AR^.Debito  := 0;

            if AF^.Devuelto then
               AR^.Debito := SimpleRoundTo((Capital * TasaLiquidar / 100 * AR^.Dias ) / 360,0)
            else
             if AF^.Vencida then
                AR^.Credito    := SimpleRoundTo((CapitalMora * TasaMora / 100 * AR^.Dias ) / 360,0)
            else
                AR^.Credito      := SimpleRoundTo(((SaldoActual - CapitalMora) * TasaLiquidar / 100 * AR^.Dias ) / 360,0);

            AR^.EsCapital := False;
            if AF^.Causado then AR^.EsCausado := True
            else AR^.EsCausado := False;
            if AF^.Corrientes then AR^.EsCorriente := True
            else AR^.EsCorriente := False;
            if AF^.Vencida then AR^.EsVencido := True
            else AR^.EsVencido := False;
            if AF^.Anticipado then AR^.EsAnticipado := True
            else AR^.EsAnticipado := False;
            if AF^.Devuelto Then AR^.EsDevuelto := True
            else AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
            TotalCredito := TotalCredito + AR^.Credito;
            TotalInteres := TotalInteres + AR^.Credito;
            TotalDebito  := TotalDebito  + AR^.Debito;
          end;

// Calculo Capital
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      :=  Capital; //FieldByName('CAPITAL_A_PAGAR').AsCurrency;
          AR^.EsCapital := True;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);
          TotalCredito := TotalCredito + AR^.Credito;
          TotalDebito  := TotalDebito  + AR^.Debito;;

          if FechasLiq.Count <= 0 then
             FechaPagoI := CalculoFecha(FechaPagoI,-Amortizacion);
// Limpiar tabla de Fechas
          for J := 0 to (FechasLiq.Count - 1) do
           begin
             AF := FechasLiq.Items[J];
             Dispose(AF);
           end;

// Coloco Caja
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoCaja;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCredito - TotalDebito;
          AR^.Credito      := 0;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
          TotalDebito := 0;
          TotalCredito := 0;
        finally
          FechasLiq.Free;
        end;
        SaldoActual := SaldoActual - Capital;
        MyCuotasLiq.NuevoSaldo := SaldoActual;
        MyCuotasLiq.InteresesHasta := FechaProx; //FechaPagoI;
   end;
   dmColocacion.IBSQLcodigos.Close;
   dmColocacion.IBQuery.Close;
   MyCuotasLiq.Liquidado := True;
end;

procedure LiquidarCuotasVarVencidaPagoTotal(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);

var I,J:Integer;
    FechasLiq:TList;
    AR:PCuotasLiq;
    AF:PFechasLiq;
    FechaProx:TDate;
    FechaProxK:TDate;
    TasaLiquidar:Double;
    TasaDev:Double;
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDate;
    Capital:Currency;
    TotalInteres:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    FechaProxNueva:TDate;
    FechaDesembolso:TDate;
    TasaEfectiva:Double;
    TasaEfectiva1:Double;
    TotalCuotas:Integer;
    NoCuota:Integer;
    Costas:Currency;
    TasaMaxima : Double;
    TasaDoble : Double;
    Dia,Mes,Ano:Word;
    Saldo:Currency;
    CapitalMora:Currency;
    FechaInicialMora:TDate;
    TasaNomDev:Double;
    IBSQL1:TIBSQL;
    IBT1:TIBTransaction;
    Devuelto:Boolean;
begin
  IBSQL1 := TIBSQL.Create(Application);
  IBT1 := TIBTransaction.Create(Application);
  IBSQL1.Transaction := IBT1;
  IBT1.DefaultDatabase := dmGeneral.IBDatabase1;

  TotalCredito := 0;
  TotalDebito  := 0;
  Costas := 0;
  FechaCorte := Trunc(FechaCorte);

  if AmortizaK < AmortizaI then Amortizacion := AmortizaK
   else Amortizacion := AmortizaI;

  with dmColocacion.IBSQL do
   begin
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
     ExecQuery;
     CodigoCaja := FieldByName('CODIGO').AsString;
     Close;
   end;

  with dmColocacion.IBSQLcodigos do
   begin
     SQL.Clear;
     SQL.Add('select * from "col$codigospuc" where ');
     SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
     SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
     SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
     ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
     ParamByName('ID_GARANTIA').AsInteger      := Garantia;
     ParamByName('ID_CATEGORIA').AsString     := Categoria;
     ExecQuery;
     if RecordCount = 0 then
      begin
        MessageDlg('No Existen Códigos contables para liquidar esta Colocación',mtError,[mbOk],0);
        MyCuotasLiq.Liquidado:= False;
        Close;
        Exit;
      end;
   end;

  with dmColocacion.IBQuery do
   begin
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".DIAS_PAGO,');
     SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - ABONOS_CAPITAL as SALDO');
     SQL.Add('from "col$colocacion"');
     SQL.Add(' where ');
     SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and "col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     FechaDesembolso := CalculoFecha(FieldByName('FECHA_DESEMBOLSO').AsDateTime,FieldByName('DIAS_PAGO').AsInteger);
     Saldo := FieldByName('SALDO').AsCurrency;
     Close;

     SQL.Clear;
     SQL.Add('select first 1 FECHA_A_PAGAR from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     ParamByName('FECHA_CORTE').AsDate := FechaCorte;
     Open;
     FechaInicialMora := FieldByName('FECHA_A_PAGAR').AsDateTime;
     Close;

     SQL.Clear;
     SQL.Add('select VALOR_COSTAS from "col$costas" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     Open;
     Costas := FieldByName('VALOR_COSTAS').AsCurrency;

     SQL.Clear;
     SQL.Add('select count(*) as CUOTAS, sum(CAPITAL_A_PAGAR) as MORA from "col$tablaliquidacion" where ');
     SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
     SQL.Add('PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
     ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     ParamByName('ID_COLOCACION').AsString := IdColocacion;
     ParamByName('FECHA_CORTE').AsDate := FechaCorte;
     Open;
     TotalCuotas := FieldByName('CUOTAS').AsInteger;
     CapitalMora := FieldByName('MORA').AsCurrency;

     MyCuotasLiq.Lista := TList.Create;

     if Costas > 0 then
      begin
        New(AR);
        AR^.CuotaNumero := 0;
        if Estado = 2 then //Juridico
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString
        else
         AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS_CAS').AsString;
        AR^.FechaInicial := FechaCorte;
        AR^.FechaFinal   := FechaCorte;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := 0;
        AR^.Credito      :=  Costas;
        AR^.EsCapital := False;
        AR^.EsCausado := False;
        AR^.EsCorriente := False;
        AR^.EsVencido := False;
        AR^.EsAnticipado := False;
        if (AR^.Debito <> 0) or
         (AR^.Credito <> 0) then
        MyCuotasLiq.Lista.Add(AR);
        TotalCredito := TotalCredito + AR^.Credito;
        TotalDebito  := TotalDebito  + AR^.Debito;
      end;

//Proceso de Cobro de Cuotas en Mora
     IBT1.StartTransaction;
     IBSQL1.SQL.Clear;
     IBSQL1.SQL.Add('select CUOTA_NUMERO, CAPITAL_A_PAGAR, FECHA_A_PAGAR from "col$tablaliquidacion" where ');
     IBSQL1.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
     IBSQL1.SQL.Add('PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
     IBSQL1.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
     IBSQL1.ParamByName('ID_COLOCACION').AsString := IdColocacion;
     IBSQL1.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
     IBSQL1.ExecQuery;

     while not IBSQL1.Eof do begin
      // Calcular Fechas a Liquidar
      NoCuota := IBSQL1.FieldByName('CUOTA_NUMERO').AsInteger;
      Capital := Valorcuota;
      Fecha1 := FechaPagoI;
      FechaProx := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDateTime;
      FechaProxK := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDateTime;
      if FechaProx < FechaPagoI then
         FechaProx := FechaPagoI;
      if SaldoActual < Capital then
         Capital := SaldoActual
      else
         Capital := IBSQL1.FieldByName('CAPITAL_A_PAGAR').AsCurrency;
      if NoCuota = TotalCuotas then
       begin
         MyCuotasLiq.FechaProx := FechaProx;
         MyCuotasLiq.CapitalHasta := FechaPagoK;
         FechaProx := CalculoFecha(FechaProx,DiasProrroga);
         FechaProxNueva := FechaProx;
         FechaPagoI := FechaCorte;
       end
      else
       begin
         MyCuotasLiq.FechaProx := CalculoFecha(FechaProx,Amortizacion);
         if Capital > 0 then
          begin
            FechaProxK := CalculoFecha(FechaPagoK,DiasProrroga);
            FechaProxK := calculofecha(FechaProxK,AmortizaK);
          end
         else
          FechaProxK := FechaPagoK;
         MyCuotasLiq.CapitalHasta := FechaProxK;
         FechaProxNueva := FechaProx;
//         FechaProx := Calculofecha(FechaProx,Amortizacion);
         FechaPagoI := CalculoFecha(FechaPagoI,Amortizacion);
       end;
      try
       FechasLiq := TList.Create;
       FechaArranque := IncDay(Fecha1);
       CalcularFechasLiquidarVarVencida(FechaArranque,FechaCorte,FechaProxNueva,FechasLiq);
       if FechaProxNueva > FechaCorte then
          CalcularFechasDevolucion(FechaCorte,FechaProxNueva,FechasLiq)
       else
          CalcularFechasMora(FechaCorte,FechaProxNueva,FechasLiq);
       // Proceso de Liquidación de Fechas
       TotalInteres := 0;
       for J := 0 to (FechasLiq.Count - 1) do
        begin
          AF := FechasLiq.Items[J];
          New(AR);
          TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            if TipoInteres = 0 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion);
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva;
               TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
             end;

            if Clasificacion = 3 then begin
              TasaEfectiva1 := BuscoTasaEfectivaUvr(FechaPagoI);
              TasaEfectiva1 := TasaNominalVencida(TasaEfectiva1,Amortizacion);
              if TasaEfectiva1 < TasaLiquidar then
                TasaLiquidar := TasaEfectiva1;
             end;


            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            TasaMora     := TasaNominalVencida(TasaMaxima,30);

          if (AF^.Anticipado) or (AF^.Devuelto) then
            AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
          else
          if AF^.Causado then
            AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
          else
          if AF^.Corrientes then
            AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString
          else
          if AF^.Vencida then
            AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;
          if AF^.Devuelto then
           begin
             with dmColocacion.IBSQL do begin
              Close;
              sql.Clear;
              sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION, "col$extractodet".ID_CBTE_COLOCACION,');
              sql.Add('"col$extractodet".FECHA_INICIAL, "col$extractodet".FECHA_FINAL');
              sql.Add('from "col$extracto"');
              sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
              sql.Add('where');
              sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
              sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
              sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
              sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
              sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
              sql.Add('"col$extractodet".VALOR_CREDITO > 0');
              sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
              ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
              ParamByName('ID_COLOCACION').AsString := IdColocacion;
              ParamByName('FECHA').AsDate := AF^.FechaFinal;
              ParamByName('CODIGO_PUC').AsString := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
              ExecQuery;
              TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
              Close;
             end;
             TasaDev := TasaEfectivaVencida(TasaDev,Amortizacion);
           end;

          if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4)then
           begin
             TasaDoble := SimpleRoundTo(2 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
             if TasaMora > TasaDoble then
              TasaMora := TasaDoble;
           end
          else if Clasificacion = 3 then
           begin
             TasaDoble := SimpleRoundTo(1.5 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
             if TasaMora > TasaDoble then
              TasaMora := TasaDoble;
           end;

          AR^.CuotaNumero  := IBSQL1.FieldByName('CUOTA_NUMERO').AsInteger;
          AR^.FechaInicial := AF^.FechaInicial;
          AR^.FechaFinal   := AF^.FechaFinal;
          DecodeDate(AF^.FechaInicial,Ano,Mes,Dia);
          if ((Int(FechaArranque) = Int(AR^.FechaInicial)) and (Mes=3) and (Dia=1) and (AF^.Devuelto=False) and (AF^.Vencida=False)) then
              Bisiesto := True
          else
              Bisiesto := False;
          if AF^.Devuelto then Devuelto := True
          else Devuelto := False;
          AR^.Dias := DiasEntreFechas1(AF^.FechaInicial,AF^.FechaFinal,FechaDesembolso,Bisiesto,Devuelto);
          if AF^.Vencida then
             AR^.Tasa := TasaMora
          else
             AR^.Tasa := TasaLiquidar;

          if AF^.Devuelto then
             AR^.Credito := 0
          else
             AR^.Debito  := 0;

          if AF^.Devuelto then
             AR^.Debito := SimpleRoundTo((Capital * TasaLiquidar / 100 * AR^.Dias ) / 360,0)
          else
           if AF^.Vencida then
              AR^.Credito    := SimpleRoundTo((Capital * TasaMora / 100 * AR^.Dias ) / 360,0)
          else
              AR^.Credito    := SimpleRoundTo((SaldoActual * TasaLiquidar / 100 * AR^.Dias ) / 360,0);

          AR^.EsCapital := False;
          if AF^.Causado then AR^.EsCausado := True
          else AR^.EsCausado := False;
          if AF^.Corrientes then AR^.EsCorriente := True
          else AR^.EsCorriente := False;
          if AF^.Vencida then AR^.EsVencido := True
          else AR^.EsVencido := False;
          if AF^.Anticipado then AR^.EsAnticipado := True
          else AR^.EsAnticipado := False;
          if AF^.Devuelto Then AR^.EsDevuelto := True
          else AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
          TotalCredito := TotalCredito + AR^.Credito;
          TotalInteres := TotalInteres + AR^.Credito;
          TotalDebito  := TotalDebito  + AR^.Debito;
        end;

        // Calculo Capital
        New(AR);
        AR^.CuotaNumero := IBSQL1.FieldByName('CUOTA_NUMERO').AsInteger;
        AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
        AR^.FechaInicial := FechaCorte;
        AR^.FechaFinal   := FechaCorte;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := 0;
        AR^.Credito      :=  Capital;
        AR^.EsCapital := True;
        AR^.EsCausado := False;
        AR^.EsCorriente := False;
        AR^.EsVencido := False;
        AR^.EsAnticipado := False;
        if (AR^.Debito <> 0) or (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);
        TotalCredito := TotalCredito + AR^.Credito;
        TotalDebito  := TotalDebito  + AR^.Debito;;

        if FechasLiq.Count <= 0 then
          FechaPagoI := CalculoFecha(FechaPagoI,-Amortizacion);
        // Limpiar tabla de Fechas
        for J := 0 to (FechasLiq.Count - 1) do
         begin
           AF := FechasLiq.Items[J];
           Dispose(AF);
         end;

      finally
       FechasLiq.Free;
      end;
      SaldoActual := SaldoActual - Capital;
      FechaPagoI := FechaProx;
      IBSQL1.Next;
    end; //fin de For Fechas
    IBSQL1.Close;
// Fin de Cuotas en Mora



        Capital := SaldoActual;
        Fecha1 := FechaPagoI;
        FechaProx := FechaCorte;
        MyCuotasLiq.FechaProx := FechaProx;
        MyCuotasLiq.CapitalHasta := 0;
        try
         FechasLiq := TList.Create;
         FechaArranque := IncDay(Fecha1);
         CalcularFechasLiquidarVarVencida(FechaArranque,FechaCorte,FechaProx,FechasLiq);
         if FechaPagoI > FechaCorte then
            CalcularFechasDevolucion(FechaCorte,FechaPagoI,FechasLiq);

         // Proceso de Liquidación de Fechas
         TotalInteres := 0;
         for J := 0 to (FechasLiq.Count - 1) do
          begin
            AF := FechasLiq.Items[J];
            New(AR);
            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
            if TipoInteres = 0 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaxima(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(Fecha1);
               TasaLiquidar := TasaEfectiva;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva
             end;

            if (AF^.Anticipado) or (AF^.Devuelto) then
              AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
            else
             if AF^.Causado then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CXC').AsString
            else
             if AF^.Corrientes then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MES').AsString
            else
             if AF^.Vencida then
               AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;

            if AF^.Devuelto then
             begin
               with dmColocacion.IBSQL do begin
                 Close;
                 sql.Clear;
                 sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION, "col$extractodet".ID_CBTE_COLOCACION,');
                 sql.Add('"col$extractodet".FECHA_INICIAL, "col$extractodet".FECHA_FINAL');
                 sql.Add('from "col$extracto"');
                 sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
                 sql.Add('where');
                 sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
                 sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
                 sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
                 sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
                 sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
                 sql.Add('"col$extractodet".VALOR_CREDITO > 0');
                 sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
                 ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                 ParamByName('ID_COLOCACION').AsString := IdColocacion;
                 ParamByName('FECHA').AsDate := AF^.FechaFinal;
                 ParamByName('CODIGO_PUC').AsString := dmColocacion.IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
                 ExecQuery;
                 TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
                 Close;
               end;
                 TasaDev := TasaEfectivaVencida(TasaDev,Amortizacion);
             end;

            TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
            TasaMora     := TasaNominalVencida(TasaMaxima,Amortizacion);

            if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4) then
             begin
               TasaDoble := SimpleRoundTo(2 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end
            else if Clasificacion = 3 then
             begin
               TasaDoble := SimpleRoundTo(1.5 * (TasaNominalVencida(ValorTasa,Amortizacion) + PuntosAdic));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end;

            AR^.CuotaNumero  := 0;
            AR^.FechaInicial := AF^.FechaInicial;
            AR^.FechaFinal   := AF^.FechaFinal;
            DecodeDate(AF^.FechaInicial,Ano,Mes,Dia);
            if ((Int(FechaArranque) = Int(AR^.FechaInicial)) and (Mes=3) and (Dia=1) and (AF^.Devuelto=False) and (AF^.Vencida=False)) then
                Bisiesto := True
            else
                Bisiesto := False;
            AR^.Dias := DiasEntrePagoTotal(AF^.FechaInicial,AF^.FechaFinal);
            if AF^.Vencida then
               AR^.Tasa := TasaMora
            else
               AR^.Tasa := TasaLiquidar;

            if AF^.Devuelto then
               AR^.Credito := 0
            else
               AR^.Debito  := 0;

            if AF^.Devuelto then
               AR^.Debito := SimpleRoundTo((Capital * TasaLiquidar / 100 * AR^.Dias ) / 360,0)
            else
             if AF^.Vencida then
                AR^.Credito := SimpleRoundTo((CapitalMora * TasaMora / 100 * AR^.Dias ) / 360,0)
            else
                AR^.Credito := SimpleRoundTo((SaldoActual * TasaLiquidar / 100 * AR^.Dias ) / 360,0);

            AR^.EsCapital := False;
            if AF^.Causado then AR^.EsCausado := True
            else AR^.EsCausado := False;
            if AF^.Corrientes then AR^.EsCorriente := True
            else AR^.EsCorriente := False;
            if AF^.Vencida then AR^.EsVencido := True
            else AR^.EsVencido := False;
            if AF^.Anticipado then AR^.EsAnticipado := True
            else AR^.EsAnticipado := False;
            if AF^.Devuelto Then AR^.EsDevuelto := True
            else AR^.EsDevuelto := False;
            if (AR^.Debito <> 0) or
               (AR^.Credito <> 0) then
               MyCuotasLiq.Lista.Add(AR);
            TotalCredito := TotalCredito + AR^.Credito;
            TotalInteres := TotalInteres + AR^.Credito;
            TotalDebito  := TotalDebito  + AR^.Debito;
          end;

// Calculo Capital
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc   := dmColocacion.IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := 0;
          AR^.Credito      :=  Capital;
          AR^.EsCapital := True;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
          MyCuotasLiq.Lista.Add(AR);
          TotalCredito := TotalCredito + AR^.Credito;
          TotalDebito  := TotalDebito  + AR^.Debito;;

          if FechasLiq.Count <= 0 then
             FechaPagoI := CalculoFecha(FechaPagoI,-Amortizacion);
          // Limpiar tabla de Fechas
          for J := 0 to (FechasLiq.Count - 1) do
           begin
             AF := FechasLiq.Items[J];
             Dispose(AF);
           end;

// Coloco Caja
          New(AR);
          AR^.CuotaNumero := 0;
          AR^.CodigoPuc    := CodigoCaja;
          AR^.FechaInicial := FechaCorte;
          AR^.FechaFinal   := FechaCorte;
          AR^.Dias         := 0;
          AR^.Tasa         := 0;
          AR^.Debito       := TotalCredito - TotalDebito;
          AR^.Credito      := 0;
          AR^.EsCapital := False;
          AR^.EsCausado := False;
          AR^.EsCorriente := False;
          AR^.EsVencido := False;
          AR^.EsAnticipado := False;
          AR^.EsDevuelto := False;
          if (AR^.Debito <> 0) or
             (AR^.Credito <> 0) then
             MyCuotasLiq.Lista.Add(AR);
          TotalDebito := 0;
          TotalCredito := 0;
        finally
          FechasLiq.Free;
        end;
        SaldoActual := SaldoActual - Capital;
        MyCuotasLiq.NuevoSaldo := SaldoActual;
        MyCuotasLiq.InteresesHasta := FechaPagoI;
        Next;
   end;
   dmColocacion.IBSQLcodigos.Close;
   dmColocacion.IBQuery.Close;
   MyCuotasLiq.Liquidado := True;
end;


function TasaNominalVencida(TasaE:Single;Amortiza:Integer): Single;
var Potencia:Single;
    Factor:Double;
begin
        if Amortiza < 30 then Amortiza := 30;
        Factor := Amortiza / 30;
        Factor := 12 / Factor;
        Potencia := power(1+(TasaE/100),(1/Factor));
        Potencia := ((Potencia-1)*Factor*100);
        Result := SimpleRoundTo(Potencia,-2);
end;

function TasaNominalAnticipada(TasaE:Single;Amortiza:Integer): Single;
var Potencia:Single;
    Factor:Double;
begin
        if Amortiza < 30 then Amortiza := 30;
        Factor := Amortiza / 30;
        Factor := 12 / Factor;
        Potencia := power(1+(TasaE/100),-(1/Factor));
        Potencia := Abs(((Potencia-1)* Factor*100));
        Result := RoundTo(Potencia,-2);
end;


function FactorCuota(TasaE:Single;Plazo:Integer;Amortiza:Integer):Single;
var N:Extended;
    I:Single;
    Potencia:Single;
begin
         N:=(Plazo div 30)/(Amortiza/30);
         I:=TasaNominalVencida(TasaE,Amortiza);
         Amortiza := Amortiza div 30;
         I:=((I/100)/12) * Amortiza;
         Potencia := power((1+I),N);
         Result := (I*Potencia)/(Potencia-1);
end;

function CuotaFija(Valor:Currency;Plazo:Integer;TasaE:Single; Amortiza:Integer): Currency;
var Cuota,Cuota1: Currency;
begin
        Cuota := Valor * FactorCuota(TasaE,Plazo,Amortiza);
//        Result := Cuota;
        Cuota := Cuota / 1000;
        Cuota1 := Int(Cuota);
        Cuota := Frac(Cuota);
        Result := Cuota1 * 1000;
        if Cuota <> 0 then Result := Result + 1000;
end;

function CuotaVivienda(Valor:Currency;Plazo:Integer;TasaE:Single; Amortiza:Integer): Currency;
var Cuota,Cuota1: Currency;
begin
        Cuota := (Valor / 1000000) * 20000;
        Cuota := Cuota / 1000;
        Cuota1 := Int(Cuota);
        Cuota := Frac(Cuota);
        Result := Cuota1 * 1000;
        if Cuota <> 0 then Result := Result + 1000;
end;

function CuotaVariable(Valor:Currency;Plazo:Integer;TasaE:Single; Amortiza:Integer): Currency;
var Cuota,Cuota1: Currency;
begin
        Cuota := Valor / (Plazo/Amortiza);
        Cuota := Cuota / 1000;
        Cuota1 := Int(Cuota);
        Cuota := Frac(Cuota);
        Result := Cuota1 * 1000;
        if Cuota <> 0 then Result := Result + 1000;
end;

function CalculoFecha(FechaActual:TDate;Dias:Integer):TDate;
var Mes: Integer;
    Ano: Integer;
    Dia: Integer;
    I: Integer;
    FinMes:Boolean;
begin


     Dia := DayOf(FechaActual);
     Mes := MonthOf(FechaActual);
     Ano := YearOf(FechaActual);

     if Dia = DaysInMonth(FechaActual) then
        FinMes := True
     else
        FinMes := False;

     if Dias > 0 then
      begin
        for I := 1 to Dias do
        begin
           Dia := Dia + 1;
           if Dia > 30 then
           begin
              Dia := 1;
              Mes := Mes + 1;
              if Mes > 12 then
              begin
                   Mes := 1;
                   Ano := Ano + 1;
              end
           end
        end;
      end
     else
      begin
        for I := 1 to ABS(Dias) do
        begin
           Dia := Dia - 1;
           if Dia = 0 then
           begin
              Dia := 30;
              Mes := Mes - 1;
              if Mes = 0 then
              begin
                   Mes := 12;
                   Ano := Ano - 1;
              end
           end
        end;
        Dia := ABS(Dia);
      end;

        if Mes = 2 then
         if Dia > 28 then
            Dia := DayOf(EndOfAMonth(Ano,Mes));

//         if FinMes then
//           Dia := DayOf(EndOfAMonth(Ano,Mes));

//        Result := FechaActual;
        Result := EncodeDate(Ano,Mes,Dia);

end;

function CalculoFechaMes(Ano,Mes,Dia:Integer;Dias:Integer):TDate;
var I: Integer;
    Fecha:TDateTime;
begin

     for I := 1 to (Dias div 30) do
     begin
      Mes := Mes + 1;
      if Mes > 12 then
      begin
         Mes := 1;
         Ano := Ano + 1;
      end;
     end;

     if not TryEncodeDate(Ano,Mes,Dia,Fecha) then
     begin
       Dia := DayOf(EndOfAMonth(Ano,Mes));
       Fecha := EncodeDate(Ano,Mes,Dia);
     end;

     Result := Fecha;

end;


function CalculoFechaManual(FechaActual:TDate;Dias:Integer):TDate;
var Mes: Integer;
    Ano: Integer;
    Dia: Integer;
    I: Integer;
begin
     Dia := DayOf(FechaActual);
     Mes := MonthOf(FechaActual);
     Ano := YearOf(FechaActual);

     if (Mes = 2) and (dia = DayOf(EndOfAMonth(Ano,Mes))) then begin
       FechaActual := IncDay(FechaActual,1);
       Dia := DayOf(FechaActual);
       Mes := MonthOf(FechaActual);
       Ano := YearOf(FechaActual);
     end;


     if Dias > 0 then
      begin
        for I := 1 to (Dias-1) do
        begin
           Dia := Dia + 1;
           if Dia > 30 then
           begin
              Dia := 1;
              Mes := Mes + 1;
              if Mes > 12 then
              begin
                   Mes := 1;
                   Ano := Ano + 1;
              end
           end
        end;
      end
     else
      begin
        for I := 1 to (ABS(Dias)-1) do
        begin
           Dia := Dia - 1;
           if Dia = 0 then
           begin
              Dia := 30;
              Mes := Mes - 1;
              if Mes = 0 then
              begin
                   Mes := 12;
                   Ano := Ano - 1;
              end
           end
        end;
        Dia := ABS(Dia);
      end;

        if Mes = 2 then
         if Dia > 28 then
            Dia := DayOf(EndOfAMonth(Ano,Mes));


        Result := FechaActual;
        Result := RecodeDate(Result,Ano,Mes,Dia);

end;

function CalculoFechaManual1(FechaActual:TDate;FechaDesembolso:TDate;Dias:Integer):TDate;
var Mes: Integer;
    Ano : Integer;
    Dia: Integer;
    MesD,DiaD,AnoD : Word;
    I: Integer;
begin
     DecodeDate(FechaDesembolso,AnoD,MesD,DiaD);
     Dia := DayOf(FechaActual);
     Mes := MonthOf(FechaActual);
     Ano := YearOf(FechaActual);

     if (Mes = 2) and (Dia = DayOf(EndOfAMonth(Ano,Mes))) then begin
       FechaActual := IncDay(FechaActual,1);
       Dia := DayOf(FechaActual);
       Mes := MonthOf(FechaActual);
       Ano := YearOf(FechaActual);
     end;


     if Dias > 0 then
      begin
        for I := 1 to (Dias-1) do
        begin
           Dia := Dia + 1;
           if Dia > 30 then
           begin
              Dia := 1;
              Mes := Mes + 1;
              if Mes > 12 then
              begin
                   Mes := 1;
                   Ano := Ano + 1;
              end
           end
        end;
      end
     else
      begin
        for I := 1 to (ABS(Dias)-1) do
        begin
           Dia := Dia - 1;
           if Dia = 0 then
           begin
              Dia := 30;
              Mes := Mes - 1;
              if Mes = 0 then
              begin
                   Mes := 12;
                   Ano := Ano - 1;
              end
           end
        end;
        Dia := ABS(Dia);
      end;

        if Mes = 2 then
         if Dia > 28 then
            Dia := DayOf(EndOfAMonth(Ano,Mes));
        if ((DiaD = 28) or (DiaD = 29)) and (Dia > DiaD)  then
          Dia := DiaD;

        Result := FechaActual;
        Result := RecodeDate(Result,Ano,Mes,Dia);

end;

procedure CrearTablaLiquidacion(TableName:String;vDesembolso:Currency;ValorCuota:Currency;
                               FechaDesembolso:TDate;TasaE:Single;PuntosAdicionales:Single;
                               AmortizaCapital:Integer;
                               AmortizaInteres:Integer;Plazo:Integer;
                               TipoCuota:String;Modalidad:String);
var A,AA,M,MM,D,DD:Word;
    Amortiza:Integer;
    FechaK:TDate;
    FechaI:TDate;
    Interes:Currency;
    Capital:Currency;
    Saldo:Currency;
    Saldo1:Currency;
    Valor:Currency;
    Tasa:Single;
    Pagos,I,B:Integer;
    DiaAnterior:TDateTime;
begin
//    Plazo := Plazo div 30;

    if Modalidad = 'A' then
       Tasa := TasaNominalAnticipada(TasaE,AmortizaInteres) + PuntosAdicionales
    else
       Tasa := TasaNominalVencida(TasaE,AmortizaInteres) + PuntosAdicionales;

    Saldo  := vDesembolso;
    FechaK := FechaDesembolso;
    if AmortizaCapital < AmortizaInteres then
       Amortiza := AmortizaCapital
    else
       Amortiza := AmortizaInteres;

//    Pagos := Plazo div (Amortiza div 30);
    Pagos := Plazo div Amortiza;

    for B := 1 to Pagos do
    begin
        FechaK := CalculoFecha(FechaK,Amortiza);
        DecodeDate(FechaK,A,M,D);
        DecodeDate(FechaDesembolso,AA,MM,DD);
        if Plazo <> Amortiza then
          if TryEncodeDate(A,M,DD,DiaAnterior) then
             FechaK := DiaAnterior;
        with dmColocacion.IBQuery do
        begin
           SQL.Clear;
           SQL.Add('INSERT INTO "col$tablaliquidacion" (ID_AGENCIA,ID_COLOCACION,CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGAR, INTERES_A_PAGAR, PAGADA, ES_ANORMAL) VALUES (');
           SQL.Add(':"ID_AGENCIA",:"ID_COLOCACION",:"CUOTA_NUMERO",:"FECHA",:"CAPITAL",:"INTERES",:"PAGADA", :"ES_ANORMAL")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := TableName;
           ParamByName('CUOTA_NUMERO').AsInteger := B;
           ParamByName('FECHA').AsDate := FechaK;
           ParamByName('CAPITAL').AsCurrency := 0;
           ParamByName('INTERES').AsCurrency := 0;
           ParamByName('PAGADA').AsInteger := 0;
           ParamByName('ES_ANORMAL').AsInteger := 0;
           ExecSQL;
           Close;
        end;
    end;


    { Proceso Cuota Fija}
    if TipoCuota = 'F' then
    begin
//          Pagos := Plazo div (AmortizaCapital div 30);
          Pagos := Plazo div Amortiza;
          FechaK := FechaDesembolso;
          for I:=1 to Pagos - 1 do
          begin
            Application.ProcessMessages;
            FechaK := CalculoFecha(FechaK,AmortizaCapital);
            Interes := SimpleRoundTo(Saldo*(Tasa/100)*(AmortizaInteres)/360,0);
            Capital := ValorCuota - Interes;
            Saldo := Saldo - Capital;
            DecodeDate(FechaK,A,M,D);
            DecodeDate(FechaDesembolso,AA,MM,DD);
            if Plazo <> Amortiza then
              if TryEncodeDate(A,M,DD,DiaAnterior) then
                FechaK := DiaAnterior;
            with dmColocacion.IBQuery do
            begin
                SQL.Clear;
                SQL.Add('update "col$tablaliquidacion" ');
                SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL",INTERES_A_PAGAR = :"INTERES" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" AND ID_COLOCACION = :"ID_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := TableName;
                ParamByName('FECHA').AsDate := FechaK;
                ParamByName('CAPITAL').AsCurrency := Capital;
                ParamByName('INTERES').AsCurrency := Interes;
                ExecSQL;
                Close;
            end;
          end;

          FechaK := CalculoFecha(FechaK,AmortizaCapital);
          Interes := SimpleRoundTo(Saldo*(Tasa/100)*AmortizaInteres/360,0);
          Capital := Saldo;
          DecodeDate(FechaK,A,M,D);
          DecodeDate(FechaDesembolso,AA,MM,DD);
          if Plazo <> Amortiza then
            if TryEncodeDate(A,M,DD,DiaAnterior) then
              FechaK := DiaAnterior;

            with dmColocacion.IBQuery do
            begin
                SQL.Clear;
                SQL.Add('update "col$tablaliquidacion" ');
                SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL",INTERES_A_PAGAR = :"INTERES" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := TableName;
                ParamByName('FECHA').AsDate := FechaK;
                ParamByName('CAPITAL').AsCurrency := Capital;
                ParamByName('INTERES').AsCurrency := Interes;
                ExecSQL;
                Close;
            end;
    end
    else
{ Si es cuota variable}
    begin
        { Proceso Capital }
          FechaK := FechaDesembolso;
//          Pagos := Plazo div (AmortizaCapital div 30);
          Pagos := Plazo div AmortizaCapital;
          if Pagos <= 1 then Pagos := 1;
          for I := 1 to Pagos - 1 do
          begin
            Application.ProcessMessages;
            FechaK := CalculoFecha(FechaK,AmortizaCapital);
            Capital := ValorCuota;
            Saldo := Saldo - Capital;
            DecodeDate(FechaK,A,M,D);
            DecodeDate(FechaDesembolso,AA,MM,DD);
            if Plazo <> Amortiza then
              if TryEncodeDate(A,M,DD,DiaAnterior) then
                FechaK := DiaAnterior;
            with dmColocacion.IBQuery do
            begin
                SQL.Clear;
                SQL.Add('update "col$tablaliquidacion" ');
                SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := TableName;
                ParamByName('CAPITAL').AsCurrency := Capital;
                ParamByName('FECHA').AsDate := FechaK;
                ExecSQL;
                Close;
            end;
          end;

            FechaK := CalculoFecha(FechaK,AmortizaCapital);
            Capital := Saldo;
            DecodeDate(FechaK,A,M,D);
            DecodeDate(FechaDesembolso,AA,MM,DD);
            if Plazo <> Amortiza then
              if TryEncodeDate(A,M,DD,DiaAnterior) then
                FechaK := DiaAnterior;
            with dmColocacion.IBQuery do
            begin
                SQL.Clear;
                SQL.Add('update "col$tablaliquidacion" ');
                SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := TableName;
                ParamByName('CAPITAL').AsCurrency := Capital;
                ParamByName('FECHA').AsDate := FechaK;
                ExecSQL;
                Close;
            end;


      { Proceso Interes }
          Saldo  := vDesembolso;
          FechaI := FechaDesembolso;
//          Pagos := Plazo div (AmortizaInteres div 30);
          Pagos := Plazo div AmortizaInteres;
          for I := 1 to Pagos do
          begin
          Application.ProcessMessages;
          FechaI := CalculoFecha(FechaI,AmortizaInteres);
          DecodeDate(FechaI,A,M,D);
          DecodeDate(FechaDesembolso,AA,MM,DD);
          if Plazo <> Amortiza then
            if TryEncodeDate(A,M,DD,DiaAnterior) then
              FechaI := DiaAnterior;
          with dmColocacion.IBQuery do
          begin
             SQL.Clear;
             SQL.Add('select * from "col$tablaliquidacion" ');
             SQL.Add(' where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COLOCACION').AsString := TableName;
             ParamByName('FECHA').AsDate := FechaI;
             Open;
             if RecordCount > 0 then
             begin
                Saldo1 := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
             end
             else
             begin
                Saldo1 := 0;
             end;
             Close;
             Valor := Saldo;
             if Modalidad = 'A' then Valor := Saldo - Saldo1;
             Interes := SimpleRoundTo(Valor*(Tasa/100)*AmortizaInteres/360,0);
             Saldo := Saldo - Saldo1;
               SQL.Clear;
               SQL.Add('update "col$tablaliquidacion" ');
               SQL.Add(' set INTERES_A_PAGAR = :"INTERES" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_COLOCACION').AsString := TableName;
               ParamByName('INTERES').AsCurrency := Interes;
               ParamByName('FECHA').AsDate:= FechaI;
               ExecSQL;
               Close;
          end;
          end;
    end;
end;

procedure CrearTablaLiquidacionVivienda(TableName:String;vDesembolso:Currency;ValorCuota:Currency;
                               FechaDesembolso:TDate;TasaE:Single;PuntosAdicionales:Single;
                               AmortizaCapital:Integer;
                               AmortizaInteres:Integer;Plazo:Integer;
                               TipoCuota:String;Modalidad:String);
var A,AA,M,MM,D,DD:Word;
    Amortiza:Integer;
    FechaK:TDate;
    FechaI:TDate;
    Interes:Currency;
    Capital:Currency;
    Saldo:Currency;
    Saldo1:Currency;
    Valor:Currency;
    Tasa:Single;
    Pagos,I,B:Integer;
    DiaAnterior:TDateTime;
begin

//    Plazo := Plazo div 30;

    if Modalidad = 'A' then
       Tasa := TasaNominalAnticipada(TasaE,AmortizaInteres) + PuntosAdicionales
    else
       Tasa := TasaNominalVencida(TasaE,AmortizaInteres) + PuntosAdicionales;

    Saldo  := vDesembolso;
    FechaK := FechaDesembolso;
    if AmortizaCapital < AmortizaInteres then
       Amortiza := AmortizaCapital
    else
       Amortiza := AmortizaInteres;

//    Pagos := Plazo div (Amortiza div 30);
    Pagos := Plazo div Amortiza;

    for B := 1 to Pagos do
    begin
        FechaK := CalculoFecha(FechaK,Amortiza);
        DecodeDate(FechaK,A,M,D);
        DecodeDate(FechaDesembolso,AA,MM,DD);
        if TryEncodeDate(A,M,DD,DiaAnterior) then
           FechaK := DiaAnterior;
        with dmColocacion.IBQuery do
        begin
           SQL.Clear;
           SQL.Add('INSERT INTO "col$tablaliquidacion" (ID_AGENCIA,ID_COLOCACION,CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGAR, INTERES_A_PAGAR, PAGADA, ES_ANORMAL) VALUES (');
           SQL.Add(':"ID_AGENCIA",:"ID_COLOCACION",:"CUOTA_NUMERO",:"FECHA",:"CAPITAL",:"INTERES",:"PAGADA", :"ES_ANORMAL")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := TableName;
           ParamByName('CUOTA_NUMERO').AsInteger := B;
           ParamByName('FECHA').AsDate := FechaK;
           ParamByName('CAPITAL').AsCurrency := 0;
           ParamByName('INTERES').AsCurrency := 0;
           ParamByName('PAGADA').AsInteger := 0;
           ParamByName('ES_ANORMAL').AsInteger := 0;
           ExecSQL;
           Close;
        end;
    end;


    { Proceso Cuota Fija}
//    Pagos := Plazo div (AmortizaCapital div 30);
    Pagos := Plazo div Amortiza;
    if Pagos <= 1 then Pagos := 1;
    FechaK := FechaDesembolso;
    for I:=1 to Pagos - 1 do
     begin
       Application.ProcessMessages;
       FechaK := CalculoFecha(FechaK,AmortizaCapital);
       Interes := SimpleRoundTo(Saldo*(Tasa/100)*(AmortizaInteres)/360,0);
       Capital := ValorCuota - Interes;
       Saldo := Saldo - Capital;
       DecodeDate(FechaK,A,M,D);
       DecodeDate(FechaDesembolso,AA,MM,DD);
       if TryEncodeDate(A,M,DD,DiaAnterior) then
          FechaK := DiaAnterior;
       with dmColocacion.IBQuery do
        begin
          SQL.Clear;
          SQL.Add('update "col$tablaliquidacion" ');
          SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL",INTERES_A_PAGAR = :"INTERES" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" AND ID_COLOCACION = :"ID_COLOCACION"');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := TableName;
          ParamByName('FECHA').AsDate := FechaK;
          ParamByName('CAPITAL').AsCurrency := Capital;
          ParamByName('INTERES').AsCurrency := Interes;
          ExecSQL;
          Close;
        end;
       if (I in [12,24,36,48,60,72,84]) then
          ValorCuota := ValorCuota + SimpleRoundTo(ValorCuota*(5.28/100),0);
     end;

     FechaK := CalculoFecha(FechaK,AmortizaCapital);
     Interes := SimpleRoundTo(Saldo*(Tasa/100)*AmortizaInteres/360,0);
     Capital := Saldo;
     DecodeDate(FechaK,A,M,D);
     DecodeDate(FechaDesembolso,AA,MM,DD);
     if TryEncodeDate(A,M,DD,DiaAnterior) then
        FechaK := DiaAnterior;

     with dmColocacion.IBQuery do
      begin
        SQL.Clear;
        SQL.Add('update "col$tablaliquidacion" ');
        SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL",INTERES_A_PAGAR = :"INTERES" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
        ParamByName('ID_AGENCIA').AsInteger := Agencia;
        ParamByName('ID_COLOCACION').AsString := TableName;
        ParamByName('FECHA').AsDate := FechaK;
        ParamByName('CAPITAL').AsCurrency := Capital;
        ParamByName('INTERES').AsCurrency := Interes;
        ExecSQL;
        Close;
      end;

      { Proceso Interes }
     Saldo  := vDesembolso;
     FechaI := FechaDesembolso;
//     Pagos := Plazo div (AmortizaInteres div 30);
     Pagos := Plazo div Amortiza;
     for I := 1 to Pagos do
      begin
        Application.ProcessMessages;
        FechaI := CalculoFecha(FechaI,AmortizaInteres);
        DecodeDate(FechaI,A,M,D);
        DecodeDate(FechaDesembolso,AA,MM,DD);
        if TryEncodeDate(A,M,DD,DiaAnterior) then
          FechaI := DiaAnterior;
        with dmColocacion.IBQuery do
         begin
           SQL.Clear;
           SQL.Add('select * from "col$tablaliquidacion" ');
           SQL.Add(' where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := TableName;
           ParamByName('FECHA').AsDate := FechaI;
           Open;
           if RecordCount > 0 then
            begin
              Saldo1 := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
            end
           else
            begin
              Saldo1 := 0;
            end;
           Close;
           Valor := Saldo;
           if Modalidad = 'A' then Valor := Saldo - Saldo1;
           Interes := SimpleRoundTo(Valor*(Tasa/100)*AmortizaInteres/360,0);
           Saldo := Saldo - Saldo1;
           SQL.Clear;
           SQL.Add('update "col$tablaliquidacion" ');
           SQL.Add(' set INTERES_A_PAGAR = :"INTERES" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := TableName;
           ParamByName('INTERES').AsCurrency := Interes;
           ParamByName('FECHA').AsDate:= FechaI;
           ExecSQL;
           Close;
         end;
      end;
end;

procedure CrearTablaLiquidacionTmp(TableName:String;vDesembolso:Currency;ValorCuota:Currency;
                               FechaDesembolso:TDate;TasaE:Single;
                               AmortizaCapital:Integer;
                               AmortizaInteres:Integer;Plazo:Integer;
                               TipoCuota:String;Modalidad:String);
var A,AA,M,MM,D,DD:Word;
    Amortiza:Integer;
    FechaK:TDate;
    FechaI:TDate;
    Interes:Currency;
    Capital:Currency;
    Saldo:Currency;
    Saldo1:Currency;
    Valor:Currency;
    Tasa:Single;
    Pagos,I,B:Integer;
    DiaAnterior:TDateTime;
begin
//    Plazo := Plazo div 30;

    if Modalidad = 'A' then
       Tasa := TasaNominalAnticipada(TasaE,AmortizaInteres)// + PuntosAdicionales
    else
       Tasa := TasaNominalVencida(TasaE,AmortizaInteres);// + PuntosAdicionales;

    Saldo  := vDesembolso;
    FechaK := FechaDesembolso;
    if AmortizaCapital < AmortizaInteres then
       Amortiza := AmortizaCapital
    else
       Amortiza := AmortizaInteres;

//    Pagos := Plazo div (Amortiza div 30);
    Pagos := Plazo div Amortiza;

    for B := 1 to Pagos do
    begin
        FechaK := CalculoFecha(FechaK,Amortiza);
        DecodeDate(FechaK,A,M,D);
        DecodeDate(FechaDesembolso,AA,MM,DD);
        if Plazo <> Amortiza then
          if TryEncodeDate(A,M,DD,DiaAnterior) then
             FechaK := DiaAnterior;
        with dmColocacion.IBQuery do
        begin
           SQL.Clear;
           SQL.Add('INSERT INTO "col$tablaliquidaciontmp" (ID_AGENCIA,ID_COLOCACION,CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGAR, INTERES_A_PAGAR) VALUES (');
           SQL.Add(':"ID_AGENCIA",:"ID_COLOCACION",:"CUOTA_NUMERO",:"FECHA",:"CAPITAL",:"INTERES")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := TableName;
           ParamByName('CUOTA_NUMERO').AsInteger := B;
           ParamByName('FECHA').AsDate := FechaK;
           ParamByName('CAPITAL').AsCurrency := 0;
           ParamByName('INTERES').AsCurrency := 0;
           ExecSQL;
           Close;
        end;
    end;
    { Proceso Cuota Fija}
    if TipoCuota = 'F' then
    begin
//          Pagos := Plazo div (AmortizaCapital div 30);
          Pagos := Plazo div Amortiza;
          FechaK := FechaDesembolso;
          for I:=1 to Pagos - 1 do
          begin
            Application.ProcessMessages;
            FechaK := CalculoFecha(FechaK,AmortizaCapital);
            Interes := SimpleRoundTo(Saldo*(Tasa/100)*(AmortizaInteres)/360,0);
            Capital := ValorCuota - Interes;
            Saldo := Saldo - Capital;
            DecodeDate(FechaK,A,M,D);
            DecodeDate(FechaDesembolso,AA,MM,DD);
            if Plazo <> Amortiza then
              if TryEncodeDate(A,M,DD,DiaAnterior) then
                FechaK := DiaAnterior;
            with dmColocacion.IBQuery do
            begin
                SQL.Clear;
                SQL.Add('update "col$tablaliquidaciontmp" ');
                SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL",INTERES_A_PAGAR = :"INTERES" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" AND ID_COLOCACION = :"ID_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := TableName;
                ParamByName('FECHA').AsDate := FechaK;
                ParamByName('CAPITAL').AsCurrency := Capital;
                ParamByName('INTERES').AsCurrency := Interes;
                ExecSQL;
                Close;
            end;
          end;

          FechaK := CalculoFecha(FechaK,AmortizaCapital);
          Interes := SimpleRoundTo(Saldo*(Tasa/100)*AmortizaInteres/360,0);
          Capital := Saldo;
          DecodeDate(FechaK,A,M,D);
          DecodeDate(FechaDesembolso,AA,MM,DD);
          if Plazo <> Amortiza then
            if TryEncodeDate(A,M,DD,DiaAnterior) then
              FechaK := DiaAnterior;

            with dmColocacion.IBQuery do
            begin
                SQL.Clear;
                SQL.Add('update "col$tablaliquidaciontmp" ');
                SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL",INTERES_A_PAGAR = :"INTERES" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := TableName;
                ParamByName('FECHA').AsDate := FechaK;
                ParamByName('CAPITAL').AsCurrency := Capital;
                ParamByName('INTERES').AsCurrency := Interes;
                ExecSQL;
                Close;
            end;
    end
    else
{ Si es cuota variable}
    begin
        { Proceso Capital }
          FechaK := FechaDesembolso;
//          Pagos := Plazo div (AmortizaCapital div 30);
          Pagos := Plazo div AmortizaCapital;
          if Pagos <= 1 then Pagos := 1;
          for I := 1 to Pagos - 1 do
          begin
            Application.ProcessMessages;
            FechaK := CalculoFecha(FechaK,AmortizaCapital);
            Capital := ValorCuota;
            Saldo := Saldo - Capital;
            DecodeDate(FechaK,A,M,D);
            DecodeDate(FechaDesembolso,AA,MM,DD);
            if Plazo <> Amortiza then
              if TryEncodeDate(A,M,DD,DiaAnterior) then
                FechaK := DiaAnterior;
            with dmColocacion.IBQuery do
            begin
                SQL.Clear;
                SQL.Add('update "col$tablaliquidaciontmp" ');
                SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := TableName;
                ParamByName('CAPITAL').AsCurrency := Capital;
                ParamByName('FECHA').AsDate := FechaK;
                ExecSQL;
                Close;
            end;
          end;

            FechaK := CalculoFecha(FechaK,AmortizaCapital);
            Capital := Saldo;
            DecodeDate(FechaK,A,M,D);
            DecodeDate(FechaDesembolso,AA,MM,DD);
            if Plazo <> Amortiza then
              if TryEncodeDate(A,M,DD,DiaAnterior) then
                FechaK := DiaAnterior;
            with dmColocacion.IBQuery do
            begin
                SQL.Clear;
                SQL.Add('update "col$tablaliquidaciontmp" ');
                SQL.Add(' set CAPITAL_A_PAGAR = :"CAPITAL" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := TableName;
                ParamByName('CAPITAL').AsCurrency := Capital;
                ParamByName('FECHA').AsDate := FechaK;
                ExecSQL;
                Close;
            end;


      { Proceso Interes }
          Saldo  := vDesembolso;
          FechaI := FechaDesembolso;
//          Pagos := Plazo div (AmortizaInteres div 30);
          Pagos := Plazo div AmortizaInteres;
          for I := 1 to Pagos do
          begin
          Application.ProcessMessages;
          FechaI := CalculoFecha(FechaI,AmortizaInteres);
          DecodeDate(FechaI,A,M,D);
          DecodeDate(FechaDesembolso,AA,MM,DD);
          if Plazo <> Amortiza then
            if TryEncodeDate(A,M,DD,DiaAnterior) then
              FechaI := DiaAnterior;
          with dmColocacion.IBQuery do
          begin
             SQL.Clear;
             SQL.Add('select * from "col$tablaliquidaciontmp" ');
             SQL.Add(' where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COLOCACION').AsString := TableName;
             ParamByName('FECHA').AsDate := FechaI;
             Open;
             if RecordCount > 0 then
             begin
                Saldo1 := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
             end
             else
             begin
                Saldo1 := 0;
             end;
             Close;
             Valor := Saldo;
             if Modalidad = 'A' then Valor := Saldo - Saldo1;
             Interes := SimpleRoundTo(Valor*(Tasa/100)*AmortizaInteres/360,0);
             Saldo := Saldo - Saldo1;
               SQL.Clear;
               SQL.Add('update "col$tablaliquidaciontmp" ');
               SQL.Add(' set INTERES_A_PAGAR = :"INTERES" where FECHA_A_PAGAR = :"FECHA" and ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION"');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_COLOCACION').AsString := TableName;
               ParamByName('INTERES').AsCurrency := Interes;
               ParamByName('FECHA').AsDate:= FechaI;
               ExecSQL;
               Close;
          end;
          end;
    end;
end;

function TasaDevolucion(Agencia:Integer;Colocacion:String):Double;
begin
        with dmColocacion.IBQuery1 do
         begin
           SQL.Clear;
           SQL.Add('SELECT TASA_INTERES_LIQUIDACION FROM "col$extracto"');
           SQL.Add('Where');
           SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
           SQL.Add('ID_COLOCACION = :ID_COLOCACION');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           Open;
           First;
           Last;
           Result := FieldByName('TASA_INTERES_LIQUIDACION').AsFloat;
           Close;
         end;
end;
//}
function TasaEfectivaVencida(Tasa: Double;Amortiza:Integer): Double;
 var n:single;
     potencia: Single;
     Factor:Double;
begin
       Factor := Amortiza;
       if Factor = 0 then
       begin
          Result := 0;
          Exit;
       end;
       n := (12/(Factor/30));
       potencia := power(1+(Tasa/100)/n,n);
       Result := SimpleRoundTo((potencia-1)*100,-2);
end;

function TasaEfectivaAnticipada(Tasa: Double;Amortiza:Integer): Double;
 var n:single;
     potencia: Single;
     Factor:Double;
begin
       Factor := Amortiza;
       if Factor = 0 then
       begin
          Result := 0;
          Exit;
       end;
       n := (12/(Factor/30));
       potencia := power(1+(Tasa/100)/-n,-n);
       Result := SimpleRoundTo((potencia-1)*100,-2);
end;

function CalcularIntAnt(vClasificacion:Integer;vGarantia:Integer;vInteresVencido:string;
                        vDesembolso:Currency;vTasaNominal:Single;vAmortizaInteres:Integer;
                        vIdColocacion:string;vNotaContable:string;vFechaInteres:TDate;vFechaCapital:Tdate) :Currency;
var
    vInteresAnt:Currency;
    vFechaHora:TDateTime;
    vCodigoInteresAnticipado:string;
begin
{Contabilizo Interes Anticipado}
             vInteresAnt := 0;
             with dmColocacion.IBQuery do
             begin
                  SQL.Clear;
                  SQL.Add('select * from "col$codigospuc" where ');
                  SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
                  SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
                  SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA"');
                  ParamByName('ID_CLASIFICACION').AsInteger := vClasificacion;
                  ParamByName('ID_GARANTIA').AsInteger := vGarantia;
                  ParamByName('ID_CATEGORIA').AsString := 'A';
                  Open;
                  vCodigoInteresAnticipado:= FieldByName('COD_INT_ANT').AsString;
                  Close;
             end;

             with dmColocacion.IBDScontable do
             begin
              Open;
              if vInteresVencido = 'A' then
              begin
                 Append;
                 vInteresAnt := SimpleRoundTo(vDesembolso*(vTasaNominal/100)*vAmortizaInteres/360,0);
                 vFechaHora := Now;
                 FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                 FieldByName('ID_AGENCIA').AsInteger := Agencia;
                 FieldByName('ID_COLOCACION').AsString := vIdColocacion;
                 FieldByName('CODIGO').AsString := vCodigoInteresAnticipado;
                 FieldByName('DEBITO').AsCurrency := 0;
                 FieldByName('CREDITO').AsCurrency := vInteresAnt;
                 Post;
              end;
             end;
{Fin Contabilizo Interes Anticipado}

{Agregar al extracto}
                if vInteresAnt <> 0 then
                begin
                  With Dmcolocacion.IBQuery1 do
                  begin
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
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    if Trim(vNotacontable)<> '' then
                       ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vNotaContable)
                    else
                       ParamByName('ID_CBTE_COLOCACION').AsInteger := 0;                  
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_EXTRACTO').AsDate := Now;
                    ParamByName('HORA_EXTRACTO').AsDateTime := Time;
                    ParamByName('CUOTA_EXTRACTO').AsInteger := 0;
                    ParamByName('TIPO_OPERACION').AsInteger := 1;
                    ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vDesembolso;
                    ParamByName('ABONO_CAPITAL').AsCurrency := 0;
                    ParamByName('ABONO_CXC').AsCurrency := 0;
                    ParamByName('ABONO_SERVICIOS').AsCurrency := 0;
                    ParamByName('ABONO_ANTICIPADO').AsCurrency := vInteresAnt;
                    ParamByName('ABONO_MORA').AsCurrency := 0;
                    ParamByName('ABONO_SEGURO').AsCurrency := 0;
                    ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
                    ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
                    ParamByName('ABONO_OTROS').AsCurrency := 0;
                    ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasaNominal;
                    ParamByName('ID_EMPLEADO').AsString := DBAlias;
                    ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaInteres;
                    ParamByName('CAPITAL_PAGO_HASTA').AsDate := vFechaCapital;
                    ParamByName('TIPO_ABONO').AsBoolean := False;
                    ExecSQL;
                    Close;
                  end;

                 With DmColocacion.IBQuery1 do
                  begin
                    sql.Clear;
                    sql.Add('update "col$colocacion" set ');
                    sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
                    sql.Add(' where ');
                    sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                    sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_INTERES').AsDate := vFechaInteres;
                    ExecSql;
                    Close;
                  end;
                end;
             Result := vInteresAnt;
{fin Agregar al Extracto}
end;

procedure VerificarCancelacionCredito(Agencia:Integer;Colocacion:string);
var
Saldo : Currency;
EsVigente : Integer;
EsPrejuridico : Integer;
EsJuridico : Integer;
EsCastigado : Integer;
EsCancelado : Integer;
Estado : Integer;
EsSaldado : Integer;
EsFallecido : Integer;
EsIncapacitado : Integer;
IBSQLTmp :TIBSQL;
IBTRANTmp :TIBTransaction;
begin
     IBSQLTmp := TIBSQL.Create(Application);
     IBTRANTmp := TIBTransaction.Create(Application);
     IBSQLTmp.Transaction := IBTRANTmp;
     IBTRANTmp.DefaultDatabase := dmGeneral.IBDatabase1;

      with IBSQLTmp do
       begin
         if Transaction.InTransaction then
           Transaction.Commit;
         Transaction.StartTransaction;

         Close;
         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_VIGENTE = 1');
         ExecQuery;
         EsVigente := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_PREJURIDICO = 1');
         ExecQuery;
         EsPrejuridico := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_JURIDICO = 1');
         ExecQuery;
         EsJuridico := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_CASTIGADO = 1');
         ExecQuery;
         EsCastigado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_CANCELADO = 1');
         ExecQuery;
         EsCancelado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_SALDADO = 1');
         ExecQuery;
         EsSaldado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_FALLECIDO = 1');
         ExecQuery;
         EsFallecido := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_INCAPACITADO = 1');
         ExecQuery;
         EsIncapacitado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ');
         SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL as SALDO, ');
         SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION');
         SQL.Add('from "col$colocacion" ');
         SQL.Add('where ');
         SQL.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
         SQL.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         Parambyname('ID_COLOCACION').AsString := Colocacion;
         ExecQuery;
         saldo := FieldByName('SALDO').AsCurrency;
         Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         if (Saldo = 0) and (Estado = EsVigente) then
          begin
            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION",');
            SQL.Add('"col$colocacion".FECHA_SALDADO = :FECHA');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsSaldado;
            ParamByName('FECHA').AsDate := fFechaActual;
            ExecQuery;
            Close;
          end
         else
         if (Saldo = 0) and ((Estado = EsPrejuridico) or (Estado = EsJuridico) or (Estado = EsCastigado)) then
          begin
            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION",');
            SQL.Add('"col$colocacion".FECHA_SALDADO = :FECHA');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsCancelado;
            ParamByName('FECHA').AsDate := fFechaActual;
            ExecQuery;
            Close;
          end
         else
         if (Saldo = 0) and (Estado = EsFallecido) then
          begin
            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION",');
            SQL.Add('"col$colocacion".FECHA_SALDADO = :FECHA');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsFallecido;
            ParamByName('FECHA').AsDate := fFechaActual;
            ExecQuery;
            Close;
          end
         else
         if (Saldo = 0) and (Estado = EsIncapacitado) then
          begin
            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION",');
            SQL.Add('"col$colocacion".FECHA_SALDADO = :FECHA');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsIncapacitado;
            ParamByName('FECHA').AsDate := fFechaActual;
            ExecQuery;
            Close;
          end;
          Transaction.Commit;
       end;
end;

function ObtenerConsecutivoColocacion(IBSQL1:TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 3');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 3');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
         except
           on E: EIBInterBaseError do
           begin
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
        end;
end;

function ObtenerConsecutivoBarrido(IBSQL1:TIBSQL): Longint;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
        if Transaction.InTransaction then
           Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 2');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          if (Consecutivo = 0) or (Consecutivo = 1) then
            MessageDlg('Error en Consecutivo',mtError,[mbok],0);
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 2');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
        end;
end;

function ObtenerDeudaHoy(Agencia:Integer;Colocacion:string;IBSQL1:TIBSQL) : Deuda;
var
    CuotasaLiquidar : Integer;
//
    CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I:Integer;
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
    Fecha : TDate;
    Fecha1:TDate;
    Dias:Integer;
    Tipo : string;
    amortiza : Integer;
    FechaHoy : TDate;
    vTotalLiquidacion : Currency;
begin
        FechaHoy := fFechaActual;

        with IBSQL1 do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
           ExecQuery;
           CodigoCaja := FieldByName('CODIGO').AsString;
           Close;
         end;

        with IBSQL1 do
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
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ParamByName('FECHA').AsDate := FechaHoy;
           ExecQuery;
           CuotasaLiquidar := FieldByName('CUOTAS').AsInteger;
           Close;
         end;


        with IBSQL1 do
         begin
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
           SQL.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and "col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ExecQuery;

           Fecha := FieldByName('FECHA_INTERES').AsDateTime;
           Tipo := FieldByName('INTERES').AsString;
           Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;

           if Tipo = 'V' then
              Fecha := CalculoFecha(Fecha,Amortiza);
              Fecha1 := IncDay(Fecha);
              Dias := DiasEntre(Fecha1,FechaHoy);
           if (Int(Fecha) <= Int(FechaHoy)) and (FieldByName('ID_ESTADO_COLOCACION').AsInteger <= 3) then
            begin
              Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
              Categoria     := FieldByName('ID_CATEGORIA').AsString;
              Garantia      := FieldByName('ID_GARANTIA').AsInteger;
              SaldoActual   := FieldByName('SALDO').AsCurrency;
              TipoInteres   := FieldByName('ID_INTERES').AsInteger;
              TipoCuota     := FieldByName('ID_TIPO_CUOTA').AsInteger;
              ValorCuota    := FieldByName('VALOR_CUOTA').AsCurrency;
              if FieldByName('TIPO_INTERES').AsString = 'F' then
                ValorTasa := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
              else
                ValorTasa := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
              PuntosAdic := FieldByName('PUNTOS_INTERES').AsFloat;
              ValorMora     := (ValorTasa + PuntosAdic) + FieldByName('TASA_INTERES_MORA').AsFloat;
              AmortizaK     := FieldByName('AMORTIZA_CAPITAL').AsInteger;
              AmortizaI     := FieldByName('AMORTIZA_INTERES').AsInteger;
              DiasProrroga  := FieldByName('DIAS_PRORROGADOS').AsInteger;
              FechaPagoK    := FieldByName('FECHA_CAPITAL').AsDateTime;
              FechaPagoI    := FieldByName('FECHA_INTERES').AsDateTime;
              Estado        := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
           Close;
              vTotalLiquidacion := 0;
                 if TipoCuota = 1 then
                    LiquidarCuotasFija(Agencia,Colocacion,CuotasaLiquidar,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                 else if TipoCuota = 2 then
                    LiquidarCuotasVarAnticipada(Agencia,Colocacion,CuotasaLiquidar,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                 else if TipoCuota = 3 then
                    LiquidarCuotasVarVencida(Agencia,Colocacion,cuotasaliquidar,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);

//                    if CuotasLiq.Lista.Count <= 0 then Break;
                    for I := 0 to CuotasLiq.Lista.Count - 1 do
                     begin
                       AF := CuotasLiq.Lista.Items[I];
                       if AF^.CodigoPuc = CodigoCaja then
                         vTotalLiquidacion := vTotalLiquidacion + AF^.Debito;
                     end;
              Result.Valor := vTotalLiquidacion;
              Result.Dias := Dias;
            end  // fin de if
           else
            begin
             Result.Valor := 0;
             Result.Dias := 0;
            end;
         end; //fin de with
end;

function ObtenerDeudaFecha(Agencia:Integer;Colocacion:string;FechaCorte:TDate;IBSQL1:TIBSQL) : Deuda;
var
    CuotasaLiquidar : Integer;
//
    CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I:Integer;
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
    Fecha : TDate;
    Fecha1:TDate;
    Dias:Integer;
    Tipo : string;
    amortiza : Integer;
    FechaHoy : TDate;
    vTotalLiquidacion : Currency;
begin
        FechaHoy := FechaCorte;

        with IBSQL1 do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
           ExecQuery;
           CodigoCaja := FieldByName('CODIGO').AsString;
           Close;
         end;

        with IBSQL1 do
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
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ParamByName('FECHA').AsDate := FechaHoy;
           ExecQuery;
           CuotasaLiquidar := FieldByName('CUOTAS').AsInteger;
           Close;
         end;


        with IBSQL1 do
         begin
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
           SQL.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and "col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ExecQuery;

           Fecha := FieldByName('FECHA_INTERES').AsDateTime;
           Tipo := FieldByName('INTERES').AsString;
           Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;

           if Tipo = 'V' then
              Fecha := CalculoFecha(Fecha,Amortiza);
              Fecha1 := IncDay(Fecha);
              Dias := DiasEntre(Fecha1,FechaHoy);
           if Int(Fecha) <= Int(FechaHoy) then
            begin
              Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
              Categoria     := FieldByName('ID_CATEGORIA').AsString;
              Garantia      := FieldByName('ID_GARANTIA').AsInteger;
              SaldoActual   := FieldByName('SALDO').AsCurrency;
              TipoInteres   := FieldByName('ID_INTERES').AsInteger;
              TipoCuota     := FieldByName('ID_TIPO_CUOTA').AsInteger;
              ValorCuota    := FieldByName('VALOR_CUOTA').AsCurrency;
              if FieldByName('TIPO_INTERES').AsString = 'F' then
                ValorTasa := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
              else
                ValorTasa := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
              PuntosAdic := FieldByName('PUNTOS_INTERES').AsFloat;
              ValorMora     := (ValorTasa + PuntosAdic) + FieldByName('TASA_INTERES_MORA').AsFloat;
              AmortizaK     := FieldByName('AMORTIZA_CAPITAL').AsInteger;
              AmortizaI     := FieldByName('AMORTIZA_INTERES').AsInteger;
              DiasProrroga  := FieldByName('DIAS_PRORROGADOS').AsInteger;
              FechaPagoK    := FieldByName('FECHA_CAPITAL').AsDateTime;
              FechaPagoI    := FieldByName('FECHA_INTERES').AsDateTime;
              Estado        := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
           Close;
              vTotalLiquidacion := 0;
                 if TipoCuota = 1 then
                    LiquidarCuotasFija(Agencia,Colocacion,CuotasaLiquidar,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                 else if TipoCuota = 2 then
                    LiquidarCuotasVarAnticipada(Agencia,Colocacion,CuotasaLiquidar,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                 else if TipoCuota = 3 then
                    LiquidarCuotasVarVencida(Agencia,Colocacion,cuotasaliquidar,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);

//                    if CuotasLiq.Lista.Count <= 0 then Break;
                    for I := 0 to CuotasLiq.Lista.Count - 1 do
                     begin
                       AF := CuotasLiq.Lista.Items[I];
                       if AF^.CodigoPuc = CodigoCaja then
                         vTotalLiquidacion := vTotalLiquidacion + AF^.Debito;
                     end;
              Result.Valor := vTotalLiquidacion;
              Result.Dias := Dias;
            end  // fin de if
           else
            begin
             Result.Valor := 0;
             Result.Dias := 0;
            end;
         end; //fin de with
end;

function ObtenerDeudaHoy1(Agencia:Integer;Colocacion:string;IBSQL1:TIBSQL) : Deuda;
var
    CuotasaLiquidar : Integer;
//
    CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I:Integer;
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
    Fecha : TDate;
    Fecha1:TDate;
    Dias:Integer;
    Tipo : string;
    amortiza : Integer;
    FechaHoy : TDate;
    vTotalLiquidacion : Currency;
begin
        FechaHoy := fFechaActual;

        with IBSQL1 do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
           ExecQuery;
           CodigoCaja := FieldByName('CODIGO').AsString;
           Close;
         end;

        with IBSQL1 do
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
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ParamByName('FECHA').AsDate := FechaHoy;
           ExecQuery;
           CuotasaLiquidar := FieldByName('CUOTAS').AsInteger;
           Close;
         end;


        with IBSQL1 do
         begin
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
           SQL.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and "col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ExecQuery;

           Fecha := FieldByName('FECHA_INTERES').AsDateTime;
           Tipo := FieldByName('INTERES').AsString;
           Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;

           if Tipo = 'V' then
              Fecha := CalculoFecha(Fecha,Amortiza);
              Fecha1 := IncDay(Fecha);
              Dias := DiasEntre(Fecha,FechaHoy);
           if (Int(Fecha) <= Int(FechaHoy)) and (FieldByName('ID_ESTADO_COLOCACION').AsInteger <= 3) then
            begin
              Clasificacion := FieldByName('ID_CLASIFICACION').AsInteger;
              Categoria     := FieldByName('ID_CATEGORIA').AsString;
              Garantia      := FieldByName('ID_GARANTIA').AsInteger;
              SaldoActual   := FieldByName('SALDO').AsCurrency;
              TipoInteres   := FieldByName('ID_INTERES').AsInteger;
              TipoCuota     := FieldByName('ID_TIPO_CUOTA').AsInteger;
              ValorCuota    := FieldByName('VALOR_CUOTA').AsCurrency;
              if FieldByName('TIPO_INTERES').AsString = 'F' then
                ValorTasa := FieldByName('TASA_INTERES_CORRIENTE').AsFloat
              else
                ValorTasa := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
              PuntosAdic := FieldByName('PUNTOS_INTERES').AsFloat;
              ValorMora     := (ValorTasa + PuntosAdic) + FieldByName('TASA_INTERES_MORA').AsFloat;
              AmortizaK     := FieldByName('AMORTIZA_CAPITAL').AsInteger;
              AmortizaI     := FieldByName('AMORTIZA_INTERES').AsInteger;
              DiasProrroga  := FieldByName('DIAS_PRORROGADOS').AsInteger;
              FechaPagoK    := FieldByName('FECHA_CAPITAL').AsDateTime;
              FechaPagoI    := FieldByName('FECHA_INTERES').AsDateTime;
              Estado        := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
           Close;
              vTotalLiquidacion := 0;
                 if TipoCuota = 1 then
                    LiquidarCuotasFija(Agencia,Colocacion,CuotasaLiquidar,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                 else if TipoCuota = 2 then
                    LiquidarCuotasVarAnticipada(Agencia,Colocacion,CuotasaLiquidar,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                 else if TipoCuota = 3 then
                    LiquidarCuotasVarVencida(Agencia,Colocacion,cuotasaliquidar,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);

//                    if CuotasLiq.Lista.Count <= 0 then Break;
                    for I := 0 to CuotasLiq.Lista.Count - 1 do
                     begin
                       AF := CuotasLiq.Lista.Items[I];
                       if AF^.CodigoPuc = CodigoCaja then
                         vTotalLiquidacion := vTotalLiquidacion + AF^.Debito;
                     end;
              Result.Valor := vTotalLiquidacion;
              Result.Dias := Dias;
            end  // fin de if
           else
            begin
             Result.Valor := 0;
             Result.Dias := 0;
            end;
         end; //fin de with
end;

function ObtenerDiasMora(Agencia:Integer;Colocacion:string) : Currency;
begin

end;

function ObtenerConsecutivodesembolso(IBSQL1: TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
        if Transaction.InTransaction then
           Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 7');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 7');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
        end;
end;

function BuscoTasaManual(Clasificacion:Integer;TasaC:Single;TipoInteres:Integer;TipoCuota:Integer;PuntosA:Double;Amortiza:Integer;FechaF:TDate;FechaPagoI:TDate): TasasManual;
var TasaE,TasaLiquidar,TasaM,TasaMora,TasaDoble:Double;
IBSQLTmp :TIBQuery;
IBTRANTmp :TIBTransaction;
begin

            IBSQLTmp := TIBQuery.Create(Application);
            IBTRANTmp := TIBTransaction.Create(Application);
            IBSQLTmp.Transaction := IBTRANTmp;
            IBTRANTmp.DefaultDatabase := dmGeneral.IBDatabase1;

            if TipoInteres = 0 then
             begin
               TasaE := BuscoTasaEfectivaMaxima(FechaF);
               if TasaC > TasaE then
                  TasaLiquidar := TasaE
               else
                  TasaLiquidar := TasaC;
             end
            else if TipoInteres = 1 then
             begin
               TasaE := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaE;
             end
            else
             begin
               TasaE := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaE;
             end;

            if Clasificacion = 3 then
             begin
               TasaE := BuscoTasaEfectivaUvrNueva(IBSQLTmp,FechaPagoI);
               if TasaC > TasaE then
                  TasaLiquidar := TasaE
               else
                  TasaLiquidar := TasaC;
             end;

            TasaM := BuscoTasaEfectivaMaxima(FechaF);

            if TipoCuota = 2 then
              TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortiza) + PuntosA
            else
              TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortiza) + PuntosA;

            TasaMora     := TasaNominalVencida(TasaM,30);

            if (Clasificacion = 1) or (Clasificacion = 2) or (Clasificacion = 4) then
             begin
               if TipoCuota = 2 then
                 TasaDoble := SimpleRoundTo(2 * (TasaNominalAnticipada(TasaC,Amortiza) + PuntosA))
               else
                 TasaDoble := SimpleRoundTo(2 * (TasaNominalVencida(TasaC,Amortiza) + PuntosA));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end
            else if Clasificacion = 3 then
             begin
               if TipoCuota = 2 then
                 TasaDoble := SimpleRoundTo(1.5 * (TasaNominalAnticipada(TasaC,Amortiza) + PuntosA))
               else
                 TasaDoble := SimpleRoundTo(1.5 * (TasaNominalVencida(TasaC,Amortiza) + PuntosA));
               if TasaMora > TasaDoble then
                TasaMora := TasaDoble;
             end;
             Result.TasaLiquidar := TasaLiquidar;
             Result.TasaMora := TasaMora;
end;

function BuscoTasaDevManual(Colocacion:string;CodigoAnt:string;FechaF:TDate): Double;
var
IBSQL :TIBSQL;
IBTRAN :TIBTransaction;
begin
            IBSQL := TIBSQL.Create(Application);
            IBTRAN := TIBTransaction.Create(Application);
            IBSQL.Transaction := IBTRAN;
            IBTRAN.DefaultDatabase := dmGeneral.IBDatabase1;
            with IBSQL do
             begin
               if Transaction.InTransaction then
                 Transaction.Commit;
               Transaction.StartTransaction;
               Close;
               sql.Clear;
               sql.Add('select distinct "col$extractodet".TASA_LIQUIDACION');
               sql.Add('from "col$extracto"');
               sql.Add('inner join "col$extractodet" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION)');
               sql.Add('where');
               sql.Add('"col$extracto".ID_AGENCIA =:"ID_AGENCIA" and');
               sql.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
               sql.Add('"col$extracto".TIPO_OPERACION = 1 and');
               sql.Add('(:FECHA between "col$extractodet".FECHA_INICIAL and "col$extractodet".FECHA_FINAL) and');
               sql.Add('"col$extractodet".CODIGO_PUC = :CODIGO_PUC and');
               sql.Add('"col$extractodet".VALOR_CREDITO > 0');
               sql.Add('order by "col$extracto".FECHA_EXTRACTO DESC');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_COLOCACION').AsString := Colocacion;
               ParamByName('FECHA').AsDate := FechaF;
               ParamByName('CODIGO_PUC').AsString := CodigoAnt;
               ExecQuery;
               Result := FieldByName('TASA_LIQUIDACION').AsFloat;
               Close;
             end;
end;

end.


