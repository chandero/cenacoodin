unit UnitGlobalesCol;

interface

Uses Dialogs,Forms,StdCtrls,DBCtrls,
     Messages,SysUtils,Math,Controls,DateUtils,Classes,
     UnitdmColocacion, UnitGlobales;

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
function BuscoTasaEfectivaMaxima(Fecha:TDate):Double;
function BuscoTasaEfectivaMaximaVariable(Fecha:TDate):Double;
function BuscoTasaEfectivaMaximaDtf(Fecha:TDate):Double;
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
procedure LiquidarCuotasVarAnticipada(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);
procedure LiquidarCuotasVarVencida(IdAgencia:Integer;IdColocacion:string;CuotasALiquidar:Integer;FechaCorte:TDate;
                            var MyCuotasLiq:TCuotasLiq;Clasificacion:Integer;Garantia:Integer;Categoria:String;Estado:Integer;ValorCuota:Currency;
                            FechaPagoK:TDate;FechaPagoI:TDate;TipoInteres:integer;ValorTasa:Double;ValorMora:Double;PuntosAdic:Double;
                            SaldoActual:Currency;AmortizaK:Integer;AmortizaI:Integer;DiasProrroga:Integer);
procedure CalcularFechasLiquidarFija(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
procedure CalcularFechasLiquidarVarAnticipada(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
procedure CalcularFechasDevolucion(FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
procedure CalcularFechasMora(FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
procedure CalcularFechasLiquidarVarVencida(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
function TasaEfectivaVencida(Tasa: Double;Amortiza:Integer): Double;
function TasaEfectivaAnticipada(Tasa: Double;Amortiza:Integer): Double;
function CuotaVivienda(Valor:Currency;Plazo:Integer;TasaE:Single;Amortiza:Integer): Currency;
function CalcularIntAnt(vClasificacion:Integer;vGarantia:Integer;vInteresVencido:string;
                        vDesembolso:Currency;vTasaNominal:Single;vAmortizaInteres:Integer;
                        vIdColocacion:string;vNotaContable:string;vFechaInteres:TDate;vFechaCapital:Tdate) :Currency;
procedure VerificarCancelacionCredito(Agencia:Integer;Colocacion:string);

var
vSaldoActual : Currency;
vTasa : double;
Cuotas : integer;
CodigoCaja:string;
fechakant : TDate;
fechacapital : TDate;

implementation

procedure CalcularFechasLiquidarFija(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
var FechaF1,FechaF2,FechaF3:TDate;
    Fecha,FechaA,FechaB:TDate;
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
       if (Int(Fecha) > Int(FechaF2)) and (FechaF2 > FechaF3) and (Paso = False) then
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

procedure CalcularFechasLiquidarVarAnticipada(FechaInicial:TDate;FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
var FechaF1,FechaF2,FechaF3:TDate;
    Fecha,FechaA,FechaB:TDate;
    AF:PFechasLiq;
    A,AA,M,MM,D,DD:Word;
    Paso : Boolean;
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
        begin
          Fecha := FechaF3;
          if (Int(Fecha) > Int(FechaF2)) and (Paso = False) and (Int(FechaF1) < Int(FechaF2)) then
           begin
             Fecha := FechaF2;
             Paso := True;
           end;
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
       else
        if Fecha <= FechaF2 then
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
var FechaF1,FechaF2,FechaF3:TDate;
    Fecha,FechaA,FechaB:TDate;
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
       if (Int(Fecha) > Int(FechaF2)) and (Paso = False) then
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

procedure CalcularFechasDevolucion(FechaCorte:TDate;FechaProx:TDate;var FechasLiq:TList);
var FechaF1,FechaF2:TDate;
    Fecha:TDate;
    AF:PFechasLiq;
    A,AA,M,MM,D,DD:Word;
begin
    New(AF);
    AF^.Anticipado := False;
    AF^.Causado := False;
    AF^.Corrientes := False;
    AF^.Vencida := False;
    AF^.Devuelto := False;

    FechaF1 := FechaCorte;
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
    A,AA,M,MM,D,DD:Word;
begin
    New(AF);
    AF^.Anticipado := False;
    AF^.Causado := False;
    AF^.Corrientes := False;
    AF^.Vencida := False;
    AF^.Devuelto := False;

    FechaF2 := IncDay(FechaCorte,-1);
    FechaF3 := FechaProx;

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

function BuscoTasaEfectivaMaximaVariable(Fecha:TDate):Double;
begin
        with dmColocacion.IBQueryVarios do
        begin
                SQL.Clear;
                SQL.Add('select VALOR_ACTUAL_TASA from ');
                SQL.Add(' "col$tasavariables" ');
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
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDate;
//    Dias:Integer;
//    Meses:Integer;
    Capital:Currency;
    TotalInteres:Currency;
    TotalIntCredito:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    TasaEfectiva:Double;
    TotalCuotas:Integer;
    NoCuota:Integer;
    Costas:Currency;
    InteresCuota : Currency;
    FechaProxNueva:TDate;
    Es_Vivienda : Boolean;
    ValorCuotaVivienda : Currency;
    TasaMaxima : Double;
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
     ValorCuotaVivienda  := FieldByName('CAPITAL_A_PAGAR').AsCurrency + FieldByName('INTERES_A_PAGAR').AsCurrency;
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
        Fecha1 := FechaPagoI;
        FechaProx := FieldByName('FECHA_A_PAGAR').AsDateTime;
        FechaProx := CalculoFecha(FechaProx,DiasProrroga);
        FechaProxK := CalculoFecha(FechaPagoK,AmortizaK);
        FechaProxNueva := FechaProx;
        MyCuotasLiq.CapitalHasta := FechaProxK;
        if (NoCuota = TotalCuotas) then
           Capital := SaldoActual;
        if NoCuota = TotalCuotas then
           MyCuotasLiq.FechaProx := 0
        else
           MyCuotasLiq.FechaProx := CalculoFecha(FechaProx,Amortizacion);

        try
         FechasLiq := TList.Create;
         FechaArranque := IncDay(Fecha1);
         CalcularFechasLiquidarFija(FechaArranque,FechaCorte,FechaProx,FechasLiq);
         FechaProxNueva := FechaProx;
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
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaVariable(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
             end;

            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);

            if ValorMora > TasaMaxima then
               TasaMora := TasaMaxima
            else
               TasaMora := ValorMora;

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

            TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
            TasaMora     := TasaNominalVencida(TasaMora,Amortizacion);

            AR^.CuotaNumero  := FieldByName('CUOTA_NUMERO').AsInteger;
            AR^.FechaInicial := AF^.FechaInicial;
            AR^.FechaFinal   := AF^.FechaFinal;
            AR^.Dias := DiasEntreFechas(AF^.FechaInicial,AF^.FechaFinal,FechaProx);
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
        FechaPagoI := CalculoFecha(FechaPagoI,Amortizacion);
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
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDate;
    Capital:Currency;
    TotalInteres:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    FechaProxNueva:TDate;
    TasaEfectiva:Double;
    TotalCuotas:Integer;
    NoCuota:Integer;
    Costas:Currency;
    TasaMaxima : Double;
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
        FechaProx := calculofecha(FechaPagoI,DiasProrroga); //FieldByName('FECHA_A_PAGAR').AsDateTime;
        if (NoCuota = TotalCuotas) and (SaldoActual < Capital) then
           Capital := SaldoActual
        else
           Capital := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
        if NoCuota = TotalCuotas then
         begin
           MyCuotasLiq.FechaProx := FechaProx;
           MyCuotasLiq.CapitalHasta := FechaPagoK;
           FechaProxNueva := CalculoFecha(FechaProx,-Amortizacion);
//           FechaProx := CalculoFecha(FechaProx,DiasProrroga);
//           FechaProxNueva := FechaProx;
           FechaPagoI := FechaCorte;
         end
        else
         begin
           MyCuotasLiq.FechaProx := CalculoFecha(FechaProx,Amortizacion);
           FechaProxK := CalculoFecha(FechaPagoK,AmortizaK);
           MyCuotasLiq.CapitalHasta := FechaProxK;
           FechaProxNueva := FechaProx;
           FechaProx := Calculofecha(FechaProx,Amortizacion);
           FechaPagoI := CalculoFecha(FechaPagoI,Amortizacion);
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
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaVariable(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
             end;

            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);

            if ValorMora > TasaMaxima then
               TasaMora := TasaMaxima
            else
               TasaMora := ValorMora;

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

            TasaLiquidar := TasaNominalAnticipada(TasaLiquidar,Amortizacion) + PuntosAdic;
            TasaMora     := TasaNominalAnticipada(TasaMora,Amortizacion);

            AR^.CuotaNumero  := FieldByName('CUOTA_NUMERO').AsInteger;
            AR^.FechaInicial := AF^.FechaInicial;
            AR^.FechaFinal   := AF^.FechaFinal;
            AR^.Dias := DiasEntreFechas(AF^.FechaInicial,AF^.FechaFinal,FechaProx);
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
    TasaMora:Double;
    Amortizacion:Integer;
    Fecha1,Fecha2,Fecha3,Fecha4,FechaCausada,FechaArranque:TDate;
    Capital:Currency;
    TotalInteres:Currency;
    TotalCredito:Currency;
    TotalDebito :Currency;
    CodigoCaja:string;
    FechaProxNueva:TDate;
    TasaEfectiva:Double;
    TotalCuotas:Integer;
    NoCuota:Integer;
    Costas:Currency;
    TasaMaxima : Double;
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
        if (NoCuota = TotalCuotas) and (SaldoActual < Capital) then
           Capital := SaldoActual
        else
           Capital := FieldByName('CAPITAL_A_PAGAR').AsCurrency;
        if NoCuota = TotalCuotas then
         begin
           MyCuotasLiq.FechaProx := 0;
           FechaProx := CalculoFecha(FechaProx,DiasProrroga);
           FechaProxNueva := FechaProx;
         end
        else
         begin
           MyCuotasLiq.FechaProx := CalculoFecha(FechaProx,Amortizacion);
           MyCuotasLiq.CapitalHasta := FechaProxK;
           FechaProxNueva := FechaProx;
         end;
        try
         FechasLiq := TList.Create;
         FechaArranque := IncDay(Fecha1);
         CalcularFechasLiquidarVarVencida(FechaArranque,FechaCorte,FechaProx,FechasLiq);
         if FechaProx > FechaCorte then
            CalcularFechasDevolucion(FechaCorte,FechaProx,FechasLiq)
         else
            CalcularFechasMora(FechaCorte,FechaProx,FechasLiq);

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
             end
            else if TipoInteres = 1 then
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaDtf(FechaPagoI);
               TasaLiquidar := TasaEfectiva;
             end
            else
             begin
               TasaEfectiva := BuscoTasaEfectivaMaximaVariable(AF^.FechaFinal);
               if ValorTasa > TasaEfectiva then
                  TasaLiquidar := TasaEfectiva
               else
                  TasaLiquidar := ValorTasa;
             end;

            TasaMaxima := BuscoTasaEfectivaMaxima(AF^.FechaFinal);

            if ValorMora > TasaEfectiva then
               TasaMora := TasaEfectiva
            else
               TasaMora := ValorMora;

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

            TasaLiquidar := TasaNominalVencida(TasaLiquidar,Amortizacion) + PuntosAdic;
            TasaMora     := TasaNominalVencida(TasaMora,Amortizacion);

            AR^.CuotaNumero  := FieldByName('CUOTA_NUMERO').AsInteger;
            AR^.FechaInicial := AF^.FechaInicial;
            AR^.FechaFinal   := AF^.FechaFinal;
            AR^.Dias := DiasEntreFechas(AF^.FechaInicial,AF^.FechaFinal,FechaProx);
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
        FechaPagoI := CalculoFecha(FechaPagoI,Amortizacion);
        MyCuotasLiq.NuevoSaldo := SaldoActual;
        MyCuotasLiq.InteresesHasta := FechaPagoI;
        Next;
      end;
   end;
   dmColocacion.IBSQLcodigos.Close;
   dmColocacion.IBQuery.Close;
   MyCuotasLiq.Liquidado := True;
end;


function TasaNominalVencida(TasaE:Single;Amortiza:Integer): Single;
var Potencia:Single;
begin
        Amortiza := Amortiza div 30;
        Amortiza := 12 div Amortiza;
        Potencia := power(1+(TasaE/100),(1/Amortiza));
        Potencia := ((Potencia-1)*Amortiza*100);
        Result := SimpleRoundTo(Potencia,-2);
end;

function TasaNominalAnticipada(TasaE:Single;Amortiza:Integer): Single;
var Potencia:Single;
begin
        Amortiza := Amortiza div 30;

        Amortiza := 12 div Amortiza;
        Potencia := power(1+(TasaE/100),-(1/Amortiza));
        Potencia := Abs(((Potencia-1)*Amortiza*100));
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
//        Result := Cuota;
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


    Plazo := Plazo div 30;

    if Modalidad = 'A' then
       Tasa := TasaNominalAnticipada((TasaE+PuntosAdicionales),AmortizaInteres)
    else
       Tasa := TasaNominalVencida((TasaE+PuntosAdicionales),AmortizaInteres);

    Saldo  := vDesembolso;
    FechaK := FechaDesembolso;
    if AmortizaCapital < AmortizaInteres then
       Amortiza := AmortizaCapital
    else
       Amortiza := AmortizaInteres;

    Pagos := Plazo div (Amortiza div 30);

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
    if TipoCuota = 'F' then
    begin
          Pagos := Plazo div (AmortizaCapital div 30);
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
    end
    else
{ Si es cuota variable}
    begin
        { Proceso Capital }
          FechaK := FechaDesembolso;
          Pagos := Plazo div (AmortizaCapital div 30);
          for I := 1 to Pagos - 1 do
          begin
            Application.ProcessMessages;
            FechaK := CalculoFecha(FechaK,AmortizaCapital);
            Capital := ValorCuota;
            Saldo := Saldo - Capital;
            DecodeDate(FechaK,A,M,D);
            DecodeDate(FechaDesembolso,AA,MM,DD);
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
          Pagos := Plazo div (AmortizaInteres div 30);
          for I := 1 to Pagos do
          begin
          Application.ProcessMessages;
          FechaI := CalculoFecha(FechaI,AmortizaInteres);
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

    Plazo := Plazo div 30;

    if Modalidad = 'A' then
       Tasa := TasaNominalAnticipada((TasaE+PuntosAdicionales),AmortizaInteres)
    else
       Tasa := TasaNominalVencida((TasaE+PuntosAdicionales),AmortizaInteres);

    Saldo  := vDesembolso;
    FechaK := FechaDesembolso;
    if AmortizaCapital < AmortizaInteres then
       Amortiza := AmortizaCapital
    else
       Amortiza := AmortizaInteres;

    Pagos := Plazo div (Amortiza div 30);

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
    Pagos := Plazo div (AmortizaCapital div 30);
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
     Pagos := Plazo div (AmortizaInteres div 30);
     for I := 1 to Pagos do
      begin
        Application.ProcessMessages;
        FechaI := CalculoFecha(FechaI,AmortizaInteres);
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


    Plazo := Plazo div 30;

    if Modalidad = 'A' then
       Tasa := TasaNominalAnticipada(TasaE,AmortizaInteres)
    else
       Tasa := TasaNominalVencida(TasaE,AmortizaInteres);

    Saldo  := vDesembolso;
    FechaK := FechaDesembolso;
    if AmortizaCapital < AmortizaInteres then
       Amortiza := AmortizaCapital
    else
       Amortiza := AmortizaInteres;

    Pagos := Plazo div (Amortiza div 30);

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
          Pagos := Plazo div (AmortizaCapital div 30);
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
          Pagos := Plazo div (AmortizaCapital div 30);
          for I := 1 to Pagos - 1 do
          begin
            Application.ProcessMessages;
            FechaK := CalculoFecha(FechaK,AmortizaCapital);
            Capital := ValorCuota;
            Saldo := Saldo - Capital;
            DecodeDate(FechaK,A,M,D);
            DecodeDate(FechaDesembolso,AA,MM,DD);
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
          Pagos := Plazo div (AmortizaInteres div 30);
          for I := 1 to Pagos do
          begin
          Application.ProcessMessages;
          FechaI := CalculoFecha(FechaI,AmortizaInteres);
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

function TasaEfectivaVencida(Tasa: Double;Amortiza:Integer): Double;
 var n:single;
     potencia: Single;
begin
       if Amortiza = 0 then
       begin
          Result := 0;
          Exit;
       end;
       n := (12/(Amortiza/30));
       potencia := power(1+(Tasa/100)/n,n);
       Result := SimpleRoundTo((potencia-1)*100,-2);
end;

function TasaEfectivaAnticipada(Tasa: Double;Amortiza:Integer): Double;
 var n:single;
     potencia: Single;
begin
       if Amortiza = 0 then
       begin
          Result := 0;
          Exit;
       end;
       n := (12/(Amortiza/30));
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

begin
      with dmColocacion.IBQuery do
       begin
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
            Open;
            Close;
          end
         else
         if (Saldo = 0) and ((Estado = EsPrejuridico)
            or (Estado = EsJuridico) or (Estado = EsCastigado)) then
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
            Open;
            Close;
          end

       end;
end;

end.


