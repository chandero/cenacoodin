unit UnitGlobalesAutomatico;

interface

uses StrUtils,SysUtils,Math,QControls,Classes,DateUtils,SqlExpr,DBXpress;

type
     PCuotasLiq = ^ACuotasLiq;
     ACuotasLiq = record
         CuotaNumero:Integer;
         CodigoPuc:string;
         FechaInicial:TDateTime;
         FechaFinal:TDateTime;
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
       FechaInicial :TDateTime;
       FechaFinal   :TDateTime;
       Anticipado   :Boolean;
       Causado      :Boolean;
       Corrientes   :Boolean;
       Vencida      :Boolean;
       Devuelto     :Boolean;
     end;


type TCuotasLiq = record
     Lista:TList;
     FechaProx:TDateTime;
     NuevoSaldo:Currency;
     InteresesHasta:TDateTime;
     CapitalHasta:TDateTime;
     Liquidado:Boolean;
end;

function DigitoControl(Tipo:Integer;Cuenta: string): string;
function ObtenerConsecutivo: LongInt;
function ObtenerConsecutivoBarrido: Longint;
function  DiasEntreFechas1(FechaInicial:TDateTime;FechaFinal:TDateTime;FechaCorte:TDateTime;Bisiesto:Boolean;Devuelto:Boolean):Integer;
function CalculoFecha(FechaActual:TDateTime;Dias:Integer):TDateTime;
function InttoBoolean (Valor: Integer): Boolean;
function BooleanoToInt(valor: boolean): integer;
function CuotaVariable(Valor:Currency;Plazo:Integer;TasaE:Single; Amortiza:Integer): Currency;
function TasaNominalVencida(TasaE:Single;Amortiza:Integer): Single;
function TasaNominalAnticipada(TasaE:Single;Amortiza:Integer): Single;
function FactorCuota(TasaE:Single;Plazo:Integer;Amortiza:Integer):Single;
function CuotaFija(Valor:Currency;Plazo:Integer;TasaE:Single; Amortiza:Integer): Currency;
function CuotaVivienda(Valor:Currency;Plazo:Integer;TasaE:Single; Amortiza:Integer): Currency;
procedure CalcularFechasLiquidarFija(FechaInicial:TDateTime;FechaCorte:TDateTime;FechaProx:TDateTime;var FechasLiq:TList);
procedure CalcularFechasDevolucion1(FechaDesembolso:TDateTime;FechaCorte:TDateTime;FechaProx:TDateTime;var FechasLiq:TList);
procedure CalcularFechasMora(FechaCorte:TDateTime;FechaProx:TDateTime;var FechasLiq:TList);
function BuscoTasaEfectivaMaxima(Fecha:TDateTime):Double;
function BuscoTasaEfectivaMaximaDtf(Fecha:TDateTime):Double;
function TasaEfectivaVencida(Tasa: Double;Amortiza:Integer): Double;
procedure LiquidarCuotasFija(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDateTime;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDateTime;FechaPagoI:TDateTime;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);

procedure VerificarCancelacionCredito(Agencia:Integer;Colocacion:string);

var
   DBName:string;
   DBAlias:string;
   DBPassword:string;
   IBDatabase1:TSQLConnection;
   vTasa:Double;
   
implementation

function DigitoControl(Tipo:Integer;Cuenta: string): string;
var
    n,i:Integer;
begin
        n := 0;
        for i := 0 to 6 do
        begin
          n := n + StrToInt(MidStr(cuenta,i+1,1));
        end;
        n := n + Tipo;
        Result := RightStr(FormatCurr('00',n),1);
end;


function ObtenerConsecutivo: LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
    IBSQL1:TSQLQuery;
    IDT1:TTransactionDesc;
begin
       IBSQL1 := TSQLQuery.Create(nil);
       IBSQL1.SQLConnection := IBDatabase1;
       IDT1.TransactionID :=200+Random(100);
       IDT1.IsolationLevel := xilREADCOMMITTED;
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         IBDatabase1.StartTransaction(IDT1);
         TransactionLevel := IDT1.TransactionID;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 1');
          Open;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 1');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecSQL;
          IBDatabase1.Commit(IDT1);
          Result := Consecutivo;
          break;
         except
             begin
              WaitCount := Random(20);
              for I := 1 to WaitCount do
                 Tries := 0;
              Continue;
             end;
          end;
        end;
end;


function ObtenerConsecutivoBarrido: Longint;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
    IBSQL1:TSQLQuery;
    IDT2:TTransactionDesc;
begin
       IBSQL1 := TSQLQuery.Create(nil);
       IBSQL1.SQLConnection := IBDatabase1;
//       IDT2.TransactionID :=300+Random(100);
//       IDT2.IsolationLevel := xilREADCOMMITTED;

       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
//         IBDatabase1.StartTransaction(IDT2);
//         TransactionLevel := IDT2.TransactionID;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 2');
          Open;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 2');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecSQL;
//          IBDatabase1.Commit(IDT2);
          Result := Consecutivo;
          break;
         except
             begin
              WaitCount := Random(20);
              for I := 1 to WaitCount do
                 Tries := 0;
              Continue;
             end
          end;
        end;
end;

function  DiasEntreFechas1(FechaInicial:TDateTime;FechaFinal:TDateTime;FechaCorte:TDateTime;Bisiesto:Boolean;Devuelto:Boolean):Integer;
var A,AA,M,MM,D,DD,AAA,DDD,MMM,AAAA,MMMM,DDDD,B:Word;
    Dias:Integer;
    Fecha:TDateTime;
    Negativo:Boolean;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 1;
        Fecha := FechaInicial;
        DecodeDate(FechaInicial,A,M,D);
        B := D;
        DecodeDate(FechaFinal,AA,MM,DD);
        DecodeDate(FechaCorte,AAA,MMM,DDD);
        FechaInicial := EncodeDate(A,M,D);
        FechaFinal := EncodeDate(AA,MM,DD);
        FechaCorte := EncodeDate(AAA,MMM,DDD);

        if (MM=2) and (DD=28) then begin
          if (DDD=28) then DD := DDD//28
          else if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD := 30
          else if (DDD<28) then DD := 30;
        end
        else if (MM=2) and (DD=29) then
          if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD:= 30
          else if (DDD<29) then DD:= 30;

        if DD = 31 then DD := 30;
        if D = 31 then D := 30;

        while (D <> DD) and (M <= MM) and (A <= AA) do
        begin
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;

       DDDD := Dayof(EndOfAMonth(YearOf(Date),02));
       if ((DDDD=29) and(M=3) and (B=1)) and (Bisiesto) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 2;

       if ((DDDD=28) and(M=3) and (B=1)) and (Bisiesto) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 2;

       if (DDDD=28) and (DDD=30) and (MM=2) and Devuelto then
         Dias := Dias - 1;
       if (DDDD=28) and (DDD=29) and (MM=2) and Devuelto then
         Dias := Dias - 1;

        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;

function BooleanoToInt(valor: boolean): integer;
begin
        if valor then
           Result := 1
        else
           Result := 0;
end;

function InttoBoolean (Valor: Integer): Boolean;
begin
       If Valor <> 0 then
          Result := True
       Else
          Result := False;
end;

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

procedure CalcularFechasLiquidarFija(FechaInicial:TDateTime;FechaCorte:TDateTime;FechaProx:TDateTime;var FechasLiq:TList);
var FechaF1,FechaF2,FechaF3:TDateTime;
    Fecha,FechaA,FechaB:TDateTime;
    AF:PFechasLiq;
    Paso : Boolean;
    A,AA,M,MM,D,DD:Word;
begin
    FechaF1 := FechaInicial;
    FechaF2 := FechaCorte;

    FechaF3 := FechaProx;
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
       if (Int(Fecha) > Int(FechaF2)) and (Paso = False) and (Int(FechaF1) < Int(FechaF2)) then
//       if (Int(Fecha) > Int(FechaF2)) and (FechaF2 > FechaF3) and (Paso = False) then
        begin
          Fecha := FechaF2;
          Paso := True;
        end;
       AF^.FechaInicial := FechaF1;
       AF^.FechaFinal := Fecha;
       DecodeDate(AF^.FechaInicial,A,M,D);
       DecodeDate(AF^.FechaFinal,AA,MM,DD);       
       FechaA := RecodeDay(Fecha,01);
       FechaB := RecodeDay(FechaF2,01);

       if (Fecha <= FechaF2) and (FechaA = FechaB) then
        begin
          AF^.Anticipado := False;
          AF^.Causado := False;
          AF^.Corrientes := True;
          AF^.Vencida := False;
          AF^.Devuelto := False;
        end
       else if Fecha <= FechaF2 then
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

procedure CalcularFechasDevolucion1(FechaDesembolso:TDateTime;FechaCorte:TDateTime;FechaProx:TDateTime;var FechasLiq:TList);
var FechaF1,FechaF2:TDateTime;
    Fecha:TDateTime;
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

procedure CalcularFechasMora(FechaCorte:TDateTime;FechaProx:TDateTime;var FechasLiq:TList);
var FechaF1,FechaF2,FechaF3:TDateTime;
    Fecha,FechaX,FechaY:TDateTime;
    AF:PFechasLiq;
    A,AA,M,MM,D,DD:Word;
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
       FechaF1 := Fecha;
       if not (((M=MM) and (D=31) and (DD=31))) and
          not (((M=MM) and (D=30) and (DD=31))) then
         FechasLiq.Add(AF);
       FechaF1 := IncDay(Fecha);
     end;
end;

function BuscoTasaEfectivaMaxima(Fecha:TDateTime):Double;
var
 Total:Integer;
 IBQueryVarios:TSQLQuery;
begin
        Total := 0;
        IBQueryVarios := TSQLQuery.Create(nil);
        IBQueryVarios.SQLConnection := IBDatabase1;
        with IBQueryVarios do
        begin
                SQL.Clear;
                SQL.Add('select VALOR_TASA_EFECTIVA from ');
                SQL.Add(' "col$tasafijas" where (:"FECHA" between FECHA_INICIAL and FECHA_FINAL)');
                ParamByName('FECHA').AsDate := Fecha;
                Open;
                while not Eof do
                begin
                  Inc(Total);
                  break;
                end;
                if Total = 0 then
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

function BuscoTasaEfectivaMaximaDtf(Fecha:TDateTime):Double;
var
  Total :Integer;
  IBQueryVarios:TSQLQuery;
begin
        Total := 0;
        IBQueryVarios := TSQLQuery.Create(nil);
        IBQueryVarios.SQLConnection := IBDatabase1;
        with IBQueryVarios do
        begin
                SQL.Clear;
                SQL.Add('select VALOR_TASA_EFECTIVA from ');
                SQL.Add(' "col$tasadtf" ');
                SQL.Add('where (:"FECHA" between FECHA_INICIAL and FECHA_FINAL)');
                ParamByName('FECHA').AsDate := Fecha;
                Open;
                while not Eof do
                begin
                  Inc(Total);
                  break;
                end;
                if Total = 0 then
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

function BuscoTasaEfectivaMaximaIPC:Double;
var
  IBQueryVarios:TSQLQuery;
begin
        IBQueryVarios := TSQLQuery.Create(nil);
        IBQueryVarios.SQLConnection := IBDatabase1;

        with IBQueryVarios do
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

function CalculoFecha(FechaActual:TDateTime;Dias:Integer):TDateTime;
var Mes: Integer;
    Ano: Integer;
    Dia: Integer;
    I: Integer;
begin

     Dia := DayOf(FechaActual);
     Mes := MonthOf(FechaActual);
     Ano := YearOf(FechaActual);


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

        Result := FechaActual;
        Result := RecodeDate(Result,Ano,Mes,Dia);

end;

procedure LiquidarCuotasFija(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDateTime;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDateTime;FechaPagoI:TDateTime;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);

var I,J:Integer;
    FechasLiq:TList;
    AR:PCuotasLiq;
    AF:PFechasLiq;
    FechaProx:TDateTime;
    FechaProxK:TDateTime;
    TasaLiquidar:Double;
    TasaDev : Double;
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDateTime;
    Capital:Currency;
    TotalInteres:Currency;
    TotalIntCredito:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    TasaEfectiva:Double;
    TotalCuotas:Integer;
    Total:Integer;
    NoCuota:Integer;
    Costas:Currency;
    InteresCuota : Currency;
    FechaProxNueva:TDateTime;
    FechaDesembolso:TDateTime;
    Es_Vivienda, Bisiesto : Boolean;
    ValorCuotaVivienda : Currency;
    TasaMaxima : Double;
    TasaDoble : Double;
    TasaNomDev:Double;
    Devuelto:Boolean;
    ProximoPago:TDateTime;
    Ano,Mes,Dia,AnoA,MesA,DiaA:Word;
    IBSQL,IBSQLcodigos, IBQuery:TSQLQuery;
begin
  TotalCredito := 0;
  TotalDebito  := 0;
  Costas := 0;
  ValorCuotaVivienda := 0;
  FechaCorte := Trunc(FechaCorte);

  if AmortizaK < AmortizaI then Amortizacion := AmortizaK
   else Amortizacion := AmortizaI;

  IBSQL := TSQLQuery.Create(nil);
  IBSQLcodigos := TSQLQuery.Create(nil);
  IBQuery := TSQLQuery.Create(nil);

  IBSQL.SQLConnection := IBDatabase1;
  IBSQLcodigos.SQLConnection := IBDatabase1;
  IBQuery.SQLConnection := IBDatabase1;

  with IBSQL do
   begin
     SQL.Clear;
     SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
     Open;
     CodigoCaja := FieldByName('CODIGO').AsString;
     Close;
   end;

  with IBSQLcodigos do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select * from "col$codigospuc" where ');
     SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
     SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
     SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA" ');
     ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
     ParamByName('ID_GARANTIA').AsInteger      := Garantia;
     ParamByName('ID_CATEGORIA').AsString     := Categoria;
     Open;
     Total := 0;
     while not Eof do
     begin
       Inc(Total);
       break;
     end;
     if Total = 0 then
      begin
        MyCuotasLiq.Liquidado:= False;
        Close;
        Exit;
      end;
   end;

  with IBQuery do
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
//     Last;
//     First;
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
//     Last;
//     First;
     MyCuotasLiq.Lista := TList.Create;

//Busco Costas
     if Costas > 0 then
      begin
        New(AR);
        AR^.CuotaNumero := 0;
        if Estado = 2 then //Juridico
         AR^.CodigoPuc   := IBSQLcodigos.FieldByName('COD_COSTAS').AsString
        else
         AR^.CodigoPuc   := IBSQLcodigos.FieldByName('COD_COSTAS_CAS').AsString;

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
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaIPC;
               TasaLiquidar := TasaEfectiva;
             end;

            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);

//            if ValorMora > TasaMaxima then
//               TasaMora := TasaMaxima
//            else
//               TasaMora := ValorMora;

            if (AF^.Anticipado) or (AF^.Devuelto) then
              AR^.CodigoPuc   := IBSQLcodigos.FieldByName('COD_INT_ANT').AsString
            else
             if AF^.Causado then
               AR^.CodigoPuc   := IBSQLcodigos.FieldByName('COD_CXC').AsString
            else
             if AF^.Corrientes then
               AR^.CodigoPuc   := IBSQLcodigos.FieldByName('COD_INT_MES').AsString
            else
             if AF^.Vencida then
               AR^.CodigoPuc   := IBSQLcodigos.FieldByName('COD_INT_MORA').AsString;

            if AF^.Devuelto then
             begin
               with IBSQL do begin
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
                 ParamByName('CODIGO_PUC').AsString := IBSQLcodigos.FieldByName('COD_INT_ANT').AsString;
                 Open;
                 TasaNomDev := FieldByName('TASA_LIQUIDACION').AsFloat;
                 Close;
               end;
                 TasaDev := TasaEfectivaVencida(TasaDev,Amortizacion);
             end;

            TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
//            TasaMora     := TasaNominalVencida(TasaMaxima,Amortizacion);
            TasaMora     := TasaNominalVencida(TasaMaxima,30);

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

// Calculo Capital
          New(AR);
          AR^.CuotaNumero := FieldByName('CUOTA_NUMERO').AsInteger;
          AR^.CodigoPuc   := IBSQLcodigos.FieldByName('COD_CAPITAL_CP').AsString;
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
   IBSQLcodigos.Close;
   IBQuery.Close;
   MyCuotasLiq.Liquidado := True;
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
IBSQLTmp :TSQLQuery;
IDT2:TTransactionDesc;
begin
     IBSQLTmp := TSQLQuery.Create(nil);
     IBSQLTmp.SQLConnection := IBDatabase1;

//     IDT2.TransactionID := 400+Random(100);
//     IDT2.IsolationLevel := xilREADCOMMITTED;

      with IBSQLTmp do
       begin
//         IBDatabase1.StartTransaction(IDT2);
//         TransactionLevel := IDT2.TransactionID;
         Close;
         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_VIGENTE = 1');
         Open;
         EsVigente := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_PREJURIDICO = 1');
         Open;
         EsPrejuridico := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_JURIDICO = 1');
         Open;
         EsJuridico := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_CASTIGADO = 1');
         Open;
         EsCastigado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_CANCELADO = 1');
         Open;
         EsCancelado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_SALDADO = 1');
         Open;
         EsSaldado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_FALLECIDO = 1');
         Open;
         EsFallecido := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where "col$estado".ES_INCAPACITADO = 1');
         Open;
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
         Open;
         saldo := FieldByName('SALDO').AsCurrency;
         Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         if (Saldo = 0) and (Estado = EsVigente) then
          begin
            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsSaldado;
            ExecSQL;
            Close;
          end
         else
         if (Saldo = 0) and ((Estado = EsPrejuridico) or (Estado = EsJuridico) or (Estado = EsCastigado)) then
          begin
            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsCancelado;
            ExecSQL;
            Close;
          end
         else
         if (Saldo = 0) and (Estado = EsFallecido) then
          begin
            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsFallecido;
            ExecSQL;
            Close;
          end
         else
         if (Saldo = 0) and (Estado = EsIncapacitado) then
          begin
            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := agencia;
            ParamByName('ID_COLOCACION').AsString := colocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsIncapacitado;
            ExecSQL;
            Close;
          end;
//          IBDatabase1.Commit(IDT2);
       end;
end;


end.
 