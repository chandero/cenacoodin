unit UnitCaptaciones;

interface

uses Math,Controls,SysUtils,DateUtils, IBDatabase, UnitDmGeneral, UnitdmLiquidacionCaptacion, UnitGlobales, UnitGlobalesCol;

type tInteres = record
   Interes:Currency;
   Causado:Currency;
   ReteInteres:Currency;
   ReteCausado:Currency;
   Retencion:Currency;
   SaldoAFecha:Currency;
   SaldoLiquidacion:Currency;
   TasaLiquidacion:Double;
   DiasLiquidacion:Integer;
end;

function InteresDiario(Ag:Integer;Tipo:Integer;Numero:Integer;Digito:Integer;FechaCorte:TDate;TasaN:Double;SaldoMinimo:Currency;DiarioRetefuente:Currency;TasaRetefuente:Double):tInteres;
function InteresCertificado(Valor:Currency;FechaCorte:TDate;TasaN:Double;DiarioRetefuente:Currency;TasaRetefuente:Extended;UltimoPago:TDate;Amor:Integer):tInteres;

implementation

function InteresDiario(Ag:Integer;Tipo:Integer;Numero:Integer;Digito:Integer;FechaCorte:TDate;TasaN:Double;SaldoMinimo:Currency;DiarioRetefuente:Currency;TasaRetefuente:Double):tInteres;
var SaldoI:Currency;
    Saldo:Currency;
    SaldoMenor:Currency;
    SaldoActual:Currency;
    CanjeActual:Currency;
    R:tInteres;
    FechaAnt:TDate;
    FechaIni:TDateTime;
    FechaFin:TDateTime;
    YearIni:Word;
    MonthIni:Word;
    DayIni:Word;
    YearFin:Word;
    MonthFin:Word;
    DayFin:Word;
    AnhoCorte : Word;
    AnhoInicial: Word;
    _transaction: TIBTransaction;
begin

        _transaction := TIBTransaction.Create(nil);
        _transaction.DefaultDatabase := dmGeneral.IBDatabase1;
        _transaction.StartTransaction;

        dmLiquidacionCaptacion.IBConsulta.Database := dmGeneral.IBDatabase1;
        dmLiquidacionCaptacion.IBConsulta.Transaction := _transaction;

        YearIni := YearOf(FechaCorte);
        MonthIni := 1;
        DayIni := 1;

        YearFin := YearIni;
        MonthFin := MonthOf(FechaCorte) - 1;
        if (MonthFin < 1) then
        begin
          MonthFin := 1;
          DayFin := 1;
        end
        else
          DayFin := DaysInAMonth(YearFin,MonthFin);

        TryEncodeDate(YearIni, MonthIni, DayIni, FechaIni);
        TryEncodeDate(YearFin, MonthFin, DayFin, FechaFin);

        Saldo := 0;
        SaldoActual := 0;
        SaldoMenor := 0;
        SaldoI := 0;

        AnhoCorte := YearOf(FechaCorte);


        with dmLiquidacionCaptacion.IBConsulta do
        begin

             Close;
             SQL.Clear;
             SQL.Add('SELECT');
             SQL.Add('SALDO_ACTUAL,');
             SQL.Add('SALDO_DISPONIBLE,');
             SQL.Add('SALDO_EN_CANJE ');
             SQL.Add('FROM SALDOS_VIGENTES(');
             SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
             SQL.Add(':ANO,:FECHA1,:FECHA2)');
             ParamByName('ID_AGENCIA').AsInteger := Ag;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := Numero;
             ParamByName('DIGITO_CUENTA').AsInteger := Digito;
             ParamByName('ANO').AsInteger := YearOf(FechaCorte);
             ParamByName('FECHA2').AsDate := FechaCorte;
             ParamByName('FECHA1').AsDate := EncodeDate(YearOf(FechaCorte),1,1);
             try
               ExecQuery;
               SaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency;
               CanjeActual := FieldByName('SALDO_EN_CANJE').AsCurrency;
             except
               SaldoActual := 0;
             end;
             
             Close;
             //Busca el saldo actual de la cuenta y verifica si cumple con el saldo minimo
             if SaldoActual < SaldoMinimo then
             begin
                Result.Interes := 0;
                Result.Retencion := 0;
                Result.SaldoAFecha := 0;
                Result.SaldoLiquidacion := 0;
                Exit;
             end;
             // busca el saldo al dia anterior
             FechaAnt := IncDay(FechaCorte,-1);
             AnhoInicial := YearOf(FechaAnt);
             if (AnhoInicial <> AnhoCorte) then
             begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT SALDO_INICIAL FROM "cap$maestrosaldoinicial" WHERE ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and ANO = :ANO');
               ParamByName('ID_AGENCIA').AsInteger := Ag;
               ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
               ParamByName('NUMERO_CUENTA').AsInteger := Numero;
               ParamByName('DIGITO_CUENTA').AsInteger := Digito;
               ParamByName('ANO').AsInteger := AnhoCorte;
               try
                ExecQuery;
                if (RecordCount > 0 ) then
                   Saldo := FieldByName('SALDO_INICIAL').AsCurrency
                else
                   Saldo := 0;
               except
                Saldo := 0;
               end;
               Close;
             end
             else
             begin
               ParamByName('FECHA2').AsDate := IncDay(FechaCorte,-1);
               ParamByName('FECHA1').AsDate := EncodeDate(AnhoCorte,1,1);
               try
                ExecQuery;
                Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
               except
                Saldo := 0;
               end;
               Close;
             end;

// Evaluar Movimientos del Dia

             SQL.Clear;
             SQL.Add('select VALOR_DEBITO, VALOR_CREDITO from "cap$extracto" where ');
             SQL.Add('(ID_AGENCIA = :"ID_AGENCIA" ) and (ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) and ');
             SQL.Add('(NUMERO_CUENTA = :"NUMERO_CUENTA") and (DIGITO_CUENTA = :"DIGITO_CUENTA") and ');
             SQL.Add('(FECHA_MOVIMIENTO = :"FECHA_MOVIMIENTO") ORDER BY HORA_MOVIMIENTO');
             ParamByName('ID_AGENCIA').AsInteger := Ag;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := Numero;
             ParamByName('DIGITO_CUENTA').AsInteger := Digito;
             ParamByName('FECHA_MOVIMIENTO').AsDate := FechaCorte;
             try
               ExecQuery;
             except
               Close;
               Result.Interes := 0;
               Result.Retencion := 0;
               Exit;
             end;

             SaldoMenor := Saldo;

             while not Eof do
             begin
               Saldo := Saldo + FieldByName('VALOR_DEBITO').AsCurrency - FieldByName('VALOR_CREDITO').AsCurrency;
               if Saldo < SaldoMenor then
                  SaldoMenor := Saldo;
               Next;
             end;

             SaldoMenor := SaldoMenor - CanjeActual;

             if SaldoMenor < 0 then SaldoMenor := 0;

             Saldo := SaldoMenor;

             R.SaldoAFecha := SaldoActual;
             R.SaldoLiquidacion := Saldo;
             R.DiasLiquidacion := 1;
             R.Causado := 0;
             R.TasaLiquidacion := TasaN;

             R.Interes := Saldo * ( TasaN/100 ) / 360;
             R.Interes := SimpleRoundTo(R.Interes,0);
             if R.Interes >= DiarioRetefuente then
             begin
                R.Retencion := R.Interes * ( TasaRetefuente / 100 );
                R.Retencion := SimpleRoundTo(R.Retencion,0);
             end
             else
                R.Retencion := 0;
        end;

      _transaction.Commit;
      Result := R;

end;

function InteresCertificado(Valor:Currency;FechaCorte:TDate;TasaN:Double;DiarioRetefuente:Currency;TasaRetefuente:Extended;UltimoPago:TDate;Amor:Integer):tInteres;
var R:tInteres;
    Dias: Integer;
    DiasC: Integer;
    FechaC: TDate;
    Total : Currency;
    Diario:Integer;
    Dia:Integer;
    tInteres :Currency;
begin
        Dia := DayOf(FechaCorte);
        if Dia = 31 then
           Dia := 30;

        FechaCorte := EncodeDate(YearOf(FechaCorte),MonthOf(FechaCorte),Dia);

        UltimoPago := CalculoFecha(FechaCorte,-Amor);

        FechaC := FechaCorte;
        FechaC := EncodeDate(YearOf(FechaC),MonthOf(FechaC),01);
        FechaC := IncDay(FechaC,-1);

        DiasC := DiasEntre(Int(UltimoPago),Int(FechaC));
        if DiasC < 1 then DiasC := 0;
        Dias := DiasEntre(Int(UltimoPago),Int(FechaCorte));
        if Dias > Amor then Dias := Amor;
        R.DiasLiquidacion := Dias;
        tInteres := (Valor * (TasaN/100))/360 * Dias;
        tInteres := SimpleRoundTo(tInteres,0);
        Dias := Dias - DiasC;
//        R.Interes := (Valor * (TasaN/100))/360 * Dias;
        R.Causado := (Valor * (TasaN/100))/360 * DiasC;
//        R.Interes := SimpleRoundTo(R.Interes,0);
        R.Causado := SimpleRoundTo(R.Causado,0);
        R.Interes := tInteres - R.Causado;
        Total := R.Interes + R.Causado;
        if tInteres >= (DiarioRetefuente * Amor) then
        begin
           R.ReteInteres := R.Interes * ( TasaRetefuente / 100);
           R.ReteInteres := SimpleRoundTo(R.ReteInteres,0);
           R.ReteCausado := R.Causado * ( TasaRetefuente / 100);
           R.ReteCausado := SimpleRoundTo(R.ReteCausado,0);
           R.Retencion := R.ReteInteres + R.ReteCausado;
        end
        else
        begin
           R.ReteInteres := 0;
           R.ReteCausado := 0;
           R.Retencion := 0;
        end;
        
        R.SaldoAFecha := Valor;
        R.SaldoLiquidacion := Valor;
        R.TasaLiquidacion := TasaN;

        Result := R;
end;

end.
