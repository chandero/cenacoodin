unit UnitPlanoBancoldex;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Math, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, IBCustomDataSet, IBQuery, JvProgressBar,
  JvSpecialProgress, Buttons, IBSQL, JvEdit, JvTypedEdit, pr_Common,
  pr_Classes, IBDatabase;

type
  TfrmPlanoBancoldex = class(TForm)
    Label1: TLabel;
    CBMeses: TComboBox;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    Barra: TJvSpecialProgress;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    SaveD: TSaveDialog;
    IBGarReal: TIBSQL;
    Label2: TLabel;
    EdAno: TJvYearEdit;
    Database: TIBDatabase;
    Transaction: TIBTransaction;
    Label5: TLabel;
    LblEstado: TLabel;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type TColocacion = Record
     ObliBancoldex,
     Colocacion,
     TipoIdentificacion,
     NumeroIdentificacion,
     Nombre,
     TipoSociedad,
     Direccion,
     Ciudad,
     Ciiu,
     EmpAct,
     EmpGen,
     TotalActivos,
     FechaActivos,
     ValorCredito,
     Destino1,
     MontoDes1,
     Destino2,
     MontoDes2,
     Destino3,
     MontoDes3,
     FechaDesembolso,
     FechaVencimiento,
     ClaseCredito,
     PeriodoGracia,
     FormaAmortiza,
     MargenInter,
     TasaInteres,
     Saldo,
     ClaseGar1,
     ValorGar1,
     ClaseGar2,
     ValorGar2,
     ClaseGar3,
     ValorGar3,
     Genero,
     NitInter,
     Linea,
     Telefono:string;
end;


var
  frmPlanoBancoldex: TfrmPlanoBancoldex;

implementation

{$R *.dfm}

uses unitDmGeneral,unitGlobalesCol, UnitGlobales;

procedure TfrmPlanoBancoldex.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmPlanoBancoldex.CmdProcesarClick(Sender: TObject);
var FechaCorte:TDate;
    Dia:Integer;
    Total:Integer;
    Lineas:TColocacion;
    Codigo:string;
    Cadena:string;
    Archivo:TextFile;
    TasaMax:Double;
    uvr : Currency;
    ValorVis:Currency;
    FechaVencimiento:TDate;
    ValorGReal:Currency;
begin
    Dia := DaysInAMonth(YearOf(Date),CBMeses.ItemIndex + 1);
    if Dia > 30 then Dia := 30;
    FechaCorte := EncodeDate(EdAno.Value,CBMeses.ItemIndex + 1,Dia);

// Ocaña
   DBpath1 := dbpath + '01' + FormatCurr('00',MonthOf(FechaCorte)) + FormatCurr('0000',YearOf(FechaCorte)) + '/';
   lblEstado.Caption := 'Procesando ' + Ciudad + '...';
   Database.DataBaseName := DBserver + ':' + DBpath1 + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
   try
     Database.Connected := True;
   except
     raise;
   end;

    Cadena := IntToStr(YearOf(FechaCorte)) + IntToStr(MonthOf(FechaCorte)) + IntToStr(DayOf(FechaCorte));
    AssignFile(ARCHIVO,'//Archivos/publico/PlanosFinMes/CARTERA01' + Cadena + '.TXT');
    //AssignFile(F,'C:/PlanosFinMes/Aportes' + Cadena);

        Rewrite(Archivo);
        Cadena := 'TIPO ID'+ #9 +'IDENTIFICACION' + #9 + 'NOMBRE' + #9 + 'CLASIFICACION' + #9 + 'CALIFICACION' + #9 + 'CODIGO' + #9 + 'REESTRUCTURADO' + #9 + 'COLOCACION' + #9 + 'DESEMBOLSO' + #9 + 'VENCIMIENTO' + #9 + '' +
                  'MOROSIDAD' + #9 + 'TIPO CUOTA' + #9 + 'CUOTAS PAGAS' + #9 + 'AMORTIZACION' + #9 + 'MODALIDAD' + #9 + 'TASA NOMINAL' + #9 + 'TASA EFECTIVA' + #9 + '' +
                  'PRESTAMO' + #9 + 'CUOTA' + #9 + 'CAPITAL' + #9 + 'INTERES' + #9 + 'OTROS' + #9 + 'GARANTIA' + #9 + 'AVALUO' + #9 + 'PROV CAPITAL' + #9 + 'PROV INTERES' + #9 + 'CONTINGEN' + #9 + ''+
                  'VALOR CUOTAS EX' + #9 + 'MESES CUOTAS EX' + #9 + 'ULTIMO PAGO' + #9 + 'CLASE GARANTIA' + #9 + 'DESTINO' + #9 + 'AGENCIA' + #9 + 'AMORTIZAK' + #9 + 'CUOTASMORA' + #9 + 'CLASEVIV' + #9 + 'SENALVIS' + #9 + 'TIPOVIV' + #9 + 'SENALSUB' + #9 + 'ENTREDES' + #9 + 'MARGENRED' + #9 + 'SENALDES' + #9 + 'MONEDA';

        Writeln(Archivo,Cadena);



        IBQuery2.Close;
        IBQuery2.SQL.Clear;
        IBQuery2.SQL.Add('select VALOR_ACTUAL_TASA from "col$tasasvariables" where ID_INTERES = 3');
        try
          IBQuery2.Open;
        except
          raise;
        end;
        uvr  := IBQuery2.FieldByName('VALOR_ACTUAL_TASA').AsCurrency;

        ValorVis := SimpleRoundTo((uvr * 100),0);

       with IBQuery1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Close;
           SQL.Clear;
           SQL.Add('select Count(*) as TOTAL from "col$causaciondiaria" where');
           SQL.Add('FECHA_CORTE = :FECHA_CORTE');
           ParamByName('FECHA_CORTE').AsDate := FechaCorte;
           try
             Open;
             if RecordCount > 0 then Total := FieldByName('TOTAL').AsInteger;
           except
             raise;
           end;

           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('  "col$causaciondiaria".ID_AGENCIA,');
           SQL.Add('  "col$causaciondiaria".ID_COLOCACION,');
           SQL.Add('  "col$causaciondiaria".FECHA_CORTE,');
           SQL.Add('  "col$causaciondiaria".ID_CLASIFICACION,');
           SQL.Add('  "col$causaciondiaria".ID_GARANTIA,');
           SQL.Add('  "col$causaciondiaria".ID_EDAD_ACT,');
           SQL.Add('  "col$causaciondiaria".ID_ARRASTRE,');
           SQL.Add('  "col$causaciondiaria".ID_IDENTIFICACION,');
           SQL.Add('  "col$causaciondiaria".ID_PERSONA,');
           SQL.Add('  "col$causaciondiaria".FECHA_DESEMBOLSO,');
           SQL.Add('  "col$causaciondiaria".VALOR,');
           SQL.Add('  "col$causaciondiaria".DEUDA,');
           SQL.Add('  "col$causaciondiaria".ID_TIPO_CUOTA,');
           SQL.Add('  "col$causaciondiaria".FECHA_CAPITAL,');
           SQL.Add('  "col$causaciondiaria".FECHA_INTERES,');
           SQL.Add('  "col$causaciondiaria".TIPOC_INTERES,');
           SQL.Add('  "col$causaciondiaria".AMORTIZA_CAPITAL,');
           SQL.Add('  "col$causaciondiaria".AMORTIZA_INTERES,');
           SQL.Add('  "col$causaciondiaria".TIPO_INTERES,');
           SQL.Add('  "col$causaciondiaria".TASA_INTERES_CORRIENTE,');
           SQL.Add('  "col$causaciondiaria".ID_INTERES,');
           SQL.Add('  "col$causaciondiaria".VALOR_ACTUAL_TASA,');
           SQL.Add('  "col$causaciondiaria".PUNTOS_INTERES,');
           SQL.Add('  "col$causaciondiaria".DIAS,');
           SQL.Add('  "col$causaciondiaria".TASA,');
           SQL.Add('  "col$causaciondiaria".ANTICIPADOS,');
           SQL.Add('  "col$causaciondiaria".CAUSADOS,');
           SQL.Add('  "col$causaciondiaria".CONTINGENCIAS,');
           SQL.Add('  "col$causaciondiaria".APORTES,');
           SQL.Add('  "col$causaciondiaria".PCAPITAL,');
           SQL.Add('  "col$causaciondiaria".PINTERES,');
           SQL.Add('  "col$causaciondiaria".PCOSTAS,');
           SQL.Add('  "col$causaciondiaria".CORTO_PL,');
           SQL.Add('  "col$causaciondiaria".LARGO_PL,');
           SQL.Add('  "col$causaciondiaria".COSTAS,');
           SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
           SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('  "gen$persona".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('  "col$causaciondiaria"');
           SQL.Add('  LEFT JOIN "gen$persona" ON ("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('where');
           SQL.Add('FECHA_CORTE = :FECHA_CORTE');
           SQL.Add('Order by ID_AGENCIA,ID_COLOCACION');
           ParamByName('FECHA_CORTE').AsDate := FechaCorte;
           try
             Open;
           except
             raise;
           end;

           Barra.Minimum := 0;
           Barra.Maximum := Total;
           Barra.Position := 0;

           while not Eof do begin
              Barra.Position := RecNo;
              Barra.Caption := FloatToStr(simpleroundto((RecNo/Total)*100,0))+'%';
              Application.ProcessMessages;
              Lineas.Tipo_Identificacion := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
              Lineas.Numero_Identificacion := FieldByName('ID_PERSONA').AsString;
              Lineas.Nombre := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                               FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                               FieldByName('NOMBRE').AsString;
              Lineas.Calificacion := FieldByName('ID_ARRASTRE').AsString;
              Lineas.Clasificacion := FieldByName('ID_CLASIFICACION').AsString;
// Busco Codigo Contable
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select COD_CAPITAL_CP from "col$codigospuc" where');
              IBQuery2.SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and');
              IBQuery2.SQL.Add('ID_GARANTIA = :ID_GARANTIA and');
              IBQuery2.SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
              IBQuery2.ParamByName('ID_CLASIFICACION').AsInteger := fieldbyname('ID_CLASIFICACION').AsInteger;
              IBQuery2.ParamByName('ID_GARANTIA').AsInteger := FieldByName('ID_GARANTIA').AsInteger;
              IBQuery2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_ARRASTRE').AsString;
              try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                   Codigo := LeftStr(IBQuery2.FieldByName('COD_CAPITAL_CP').AsString,6);
              except
                Transaction.Rollback;
                raise;
              end;
// Fin Codigo Contable
              Lineas.Codigo_Contable := Codigo;
              Lineas.Reestructurado := '0';
              Lineas.Numero_Credito := IntToStr(FieldByName('ID_AGENCIA').AsInteger) + FieldByName('ID_COLOCACION').AsString;
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select FECHA_DESEMBOLSO from "col$colocacion" where');
              IBSQL1.SQL.Add('ID_COLOCACION = :ID_COLOCACION and ID_AGENCIA = :ID_AGENCIA');
              IBSQL1.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              try
               IBSQL1.ExecQuery;
              except
               raise;
              end;

              Lineas.Fecha_Desembolso := FormatDateTime('yyyy/MM/dd',IBSQL1.FieldByName('FECHA_DESEMBOLSO').AsDateTime);

// Buscar Fecha Vencimiento
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select ID_TIPO_CUOTA,FECHA_VENCIMIENTO,FECHA_INTERES from "col$colocacion"');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then begin
                 if IBQuery2.FieldByName('FECHA_INTERES').AsDateTime > ibquery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime then begin
                   Lineas.Fecha_Vencimiento := FormatDateTime('yyyy/MM/dd',IBQuery2.FieldByName('FECHA_INTERES').AsDateTime);
                   FechaVencimiento := IBQuery2.FieldByName('FECHA_INTERES').AsDateTime;
                 end
                 else begin
                   Lineas.Fecha_Vencimiento := FormatDateTime('yyyy/MM/dd',IBQuery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime);
                   FechaVencimiento := IBQuery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                 end;
               end
               else begin
                 Lineas.Fecha_Vencimiento := Lineas.Fecha_Desembolso;
                 FechaVencimiento := IBSQL1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
               end;
              except
               raise;
              end;

//              FechaVencimiento := StrToDate(Lineas.Fecha_Vencimiento);

              if ( FieldByName('TIPOC_INTERES').AsString = 'A' ) then
                 Dia := FieldByName('DIAS').AsInteger
              else
              if ( FieldByName('TIPOC_INTERES').AsString = 'V' ) then
                 Dia := FieldByName('DIAS').AsInteger - FieldByName('AMORTIZA_INTERES').AsInteger;

              if Dia < 1 then Dia := 0;

              if FechaCorte > FechaVencimiento then
                Dia := DaysBetween(FechaCorte,FechaVencimiento);

              Lineas.Morosidad := IntToStr(Dia);
              if IBQuery2.FieldByName('ID_TIPO_CUOTA').AsInteger = 1 then
                  Lineas.Tipo_Cuota := '1'
              else
                  Lineas.Tipo_Cuota := '2';

// Buscar cuotas pagas
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select count(*) as TOTAL from "col$tablaliquidacion" ');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and');
              IBQuery2.SQL.Add('PAGADA <> 0 and FECHA_PAGADA <= :FECHA_CORTE');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                   Lineas.Cuotas_Pagas := IntToStr(IBQuery2.FieldByName('TOTAL').AsInteger)
                else
                   Lineas.Cuotas_Pagas := '0';
              except
                raise;
              end;
// Fin Cuotas Pagas
              Lineas.Amortizacion := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
              if FieldByName('TIPOC_INTERES').AsString = 'A' then
                 Lineas.Modalidad := '1'
              else
                 Lineas.Modalidad := '2';

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$tasafijas" where :FECHA BETWEEN FECHA_INICIAL and FECHA_FINAL');
              IBQuery2.ParamByName('FECHA').AsDate := FechaCorte;
              try
               IBQuery2.Open;
               TasaMax := IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
              except
               raise;
              end;


              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$tasafijas" where :FECHA BETWEEN FECHA_INICIAL and FECHA_FINAL');
              IBQuery2.ParamByName('FECHA').AsDate := FechaCorte;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then begin
                 if IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat < (FieldByName('TASA_INTERES_CORRIENTE').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat) then
                   TasaMax := IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat
                 else
                   TasaMax := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
               end
               else

               begin
                  if TasaMax > FieldByName('TASA_INTERES_CORRIENTE').AsFloat then
                    TasaMax := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
               end;
              except
               raise;
              end;

              Lineas.Tasa_Efectiva := FormatCurr('00.00',(TasaMax + FieldByName('PUNTOS_INTERES').AsFloat));

              if FieldByName('TIPOC_INTERES').AsString = 'A' then
                 Lineas.Tasa_Nominal := FormatCurr('00.00',(TasaNominalAnticipada(TasaMax,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat))
              else
                 Lineas.Tasa_Nominal := FormatCurr('00.00',(TasaNominalVencida(TasaMax,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat));

              Lineas.Valor_Prestamo := FormatCurr('#0',FieldByName('VALOR').AsCurrency);
// Busco Valor Cuota
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select VALOR_CUOTA from "col$colocacion"');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then
                  Lineas.Valor_Cuota := FormatCurr('#0',IBQuery2.FieldByName('VALOR_CUOTA').AsCurrency)
               else
                  Lineas.Valor_Cuota := '0';
              except
               raise;
              end;
//Fin Cuota
              Lineas.Saldo_Capital := FormatCurr('#0',FieldByName('DEUDA').AsCurrency);
              Lineas.Saldo_Interes := FormatCurr('#0',FieldByName('CAUSADOS').AsCurrency);
              Lineas.Otros_Saldos  := FormatCurr('#0',FieldByName('COSTAS').AsCurrency);

              //Proceso Garantia Real
              ValorGReal := 0;
              IBGarReal.Close;
              IBGarReal.SQL.Clear;
              IBGarReal.SQL.Add('SELECT "col$colgarantiasreal".CUENTAS_DE_ORDEN as VALOR, FECHA_AVALUO as FECHA_AVALUO');
              IBGarReal.SQL.Add('FROM "col$colgarantiasreal" INNER JOIN "col$colocacion" on ("col$colgarantiasreal".ID_AGENCIA = "col$colocacion".ID_AGENCIA');
              IBGarReal.SQL.Add('and "col$colgarantiasreal".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
              IBGarReal.SQL.Add('WHERE "col$colgarantiasreal".ID_AGENCIA = :ID_AGENCIA and');
              IBGarReal.SQL.Add('"col$colgarantiasreal".ID_COLOCACION = :ID_COLOCACION and');
              IBGarReal.SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION <= 3');
              IBGarReal.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBGarReal.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBGarReal.ExecQuery;
              while not IBGarReal.Eof do begin
                ValorGReal := ValorGReal + IBGarReal.FieldByName('VALOR').AsCurrency;
                IBGarReal.Next;
              end;
              if ValorGReal > 0 then
                Lineas.Valor_Garantia := CurrToStr(ValorGReal)
              else
                Lineas.Valor_Garantia := '0';
              //Fin Garantía Real

              if not IBGarReal.FieldByName('FECHA_AVALUO').IsNull then
                Lineas.Fecha_Avaluo := IBGarReal.FieldByName('FECHA_AVALUO').AsString
              else
                Lineas.Fecha_Avaluo := '';
              IBGarReal.Close;

              Lineas.Provision_Capital := FormatCurr('#0',FieldByName('PCAPITAL').AsCurrency);
              Lineas.Provision_Interes := FormatCurr('#0',FieldByName('PINTERES').AsCurrency);
              Lineas.Contintengia_Interes := FormatCurr('#0',FieldByName('CONTINGENCIAS').AsCurrency);
              Lineas.Valor_Cuotas_Extras := '';
              Lineas.Meses_Cuotas_Extras := '';
// Busco Fecha Ultimo Pago
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$extracto" where');
              IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION and');
              IBQuery2.SQL.Add('TIPO_OPERACION = 1 and FECHA_EXTRACTO <= :FECHA_CORTE');
              IBQuery2.SQL.Add('Order by FECHA_EXTRACTO, HORA_EXTRACTO');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
                IBQuery2.Last;
              except
                raise;
              end;
              Lineas.Fecha_Ultimo_Pago := FormatDateTime('dd/mm/yyyy',IBQuery2.FieldByName('FECHA_EXTRACTO').AsDateTime);
              if Lineas.Fecha_Ultimo_Pago = '30/12/1899' then
                Lineas.Fecha_Ultimo_Pago := '';
// Fin Ultimo pago
              if FieldByName('ID_GARANTIA').AsInteger = 1 then
                 Lineas.Clase_Garantia := '9'
              else
                 Lineas.Clase_Garantia := '1';

              Lineas.Destino_Credito := 'A';
              Lineas.Agencia := Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]);
              Lineas.AmortizaK := Format('%.2d',[IBQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger]);

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select sum(CAPITAL_A_PAGAR) as CAPITAL from "col$tablaliquidacion" where ');
              IBQuery2.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
              IBQuery2.SQL.Add('PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
              except
                raise;
              end;

              Lineas.CuotasMora := '0';
              if StrToInt(Lineas.Morosidad) <> 0 then
              begin
                if IBQuery2.FieldByName('CAPITAL').AsCurrency > FieldByName('DEUDA').AsCurrency then
                   Lineas.CuotasMora := CurrToStr(FieldByName('DEUDA').AsCurrency)
                else
                   Lineas.CuotasMora := CurrToStr(IBQuery2.FieldByName('CAPITAL').AsCurrency);
              end;

              if Lineas.Clasificacion  = '3' then
               begin
                 Lineas.ClaseViv := '1';
                 Lineas.Senalvis := '0';

                 if SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) < (643100 * uvr) then
                   Lineas.TipoViv := '1'
                 else if (SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) > (643100 * uvr)) and (SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) < (2411625 * uvr)) then
                   Lineas.TipoViv := '2'
                 else if (SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) > (2411625 * uvr)) then
                   Lineas.TipoViv := '3';

                 Lineas.SenalSub := '0';
                 Lineas.EntRedes := '0';
                 Lineas.MargenRed := '0';
                 Lineas.SenalDes := '1';
                 Lineas.Moneda := '1';
               end
              else
               begin
                 Lineas.ClaseViv := '';
                 Lineas.Senalvis := '';
                 Lineas.TipoViv := ''; //falta
                 Lineas.SenalSub := '';
                 Lineas.EntRedes := '';
                 Lineas.MargenRed := '';
                 Lineas.SenalDes  := '1';
                 Lineas.Moneda := '1';
               end;

              Cadena := Lineas.Tipo_Identificacion + #9 +
                          Lineas.Numero_Identificacion + #9 +
                          Lineas.Nombre + #9 +
                          Lineas.Clasificacion + #9 +
                          Lineas.Calificacion + #9 +
                          Lineas.Codigo_Contable + #9 +
                          Lineas.Reestructurado + #9 +
                          Lineas.Numero_Credito + #9 +
                          Lineas.Fecha_Desembolso + #9 +
                          Lineas.Fecha_Vencimiento + #9 +
                          Lineas.Morosidad + #9 +
                          Lineas.Tipo_Cuota + #9 +
                          Lineas.Cuotas_Pagas + #9 +
                          Lineas.Amortizacion + #9 +
                          Lineas.Modalidad + #9 +
                          Lineas.Tasa_Nominal + #9 +
                          Lineas.Tasa_Efectiva + #9 +
                          Lineas.Valor_Prestamo + #9 +
                          Lineas.Valor_Cuota + #9 +
                          Lineas.Saldo_Capital + #9 +
                          Lineas.Saldo_Interes + #9 +
                          Lineas.Otros_Saldos + #9 +
                          Lineas.Valor_Garantia + #9 +
                          Lineas.Fecha_Avaluo + #9 +
                          Lineas.Provision_Capital + #9 +
                          Lineas.Provision_Interes + #9 +
                          Lineas.Contintengia_Interes + #9 +
                          Lineas.Valor_Cuotas_Extras + #9 +
                          Lineas.Meses_Cuotas_Extras + #9 +
                          Lineas.Fecha_Ultimo_Pago + #9 +
                          Lineas.Clase_Garantia + #9 +
                          Lineas.Destino_Credito + #9 +
                          Lineas.Agencia + #9 +
                          Lineas.AmortizaK + #9 +
                          Lineas.CuotasMora + #9 +
                          Lineas.ClaseViv + #9 +
                          Lineas.Senalvis + #9 +
                          Lineas.TipoViv + #9 +
                          Lineas.SenalSub + #9 +
                          Lineas.EntRedes + #9 +
                          Lineas.MargenRed + #9 +
                          Lineas.SenalDes + #9 +
                          Lineas.Moneda;
              Writeln(Archivo,Cadena);
            Next;
           end; // del while
        end; // del with
    CloseFile(Archivo);
    Database.Close;
// Fin Ocaña

// Abrego
   DBpath1 := dbpath + '02' + FormatCurr('00',MonthOf(FechaCorte)) + FormatCurr('0000',YearOf(FechaCorte)) + '/';
   lblEstado.Caption := 'Procesando Abrego ...';
   Database.DataBaseName := DBserver + ':' + DBpath1 + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
   try
     Database.Connected := True;
   except
     raise;
   end;

    Cadena := IntToStr(YearOf(FechaCorte)) + IntToStr(MonthOf(FechaCorte)) + IntToStr(DayOf(FechaCorte));
    AssignFile(ARCHIVO,'//Archivos/publico/PlanosFinMes/CARTERA02' + Cadena + '.TXT');
    //AssignFile(F,'C:/PlanosFinMes/Aportes' + Cadena);

        Rewrite(Archivo);
        Cadena := 'TIPO ID'+ #9 +'IDENTIFICACION' + #9 + 'NOMBRE' + #9 + 'CLASIFICACION' + #9 + 'CALIFICACION' + #9 + 'CODIGO' + #9 + 'REESTRUCTURADO' + #9 + 'COLOCACION' + #9 + 'DESEMBOLSO' + #9 + 'VENCIMIENTO' + #9 + '' +
                  'MOROSIDAD' + #9 + 'TIPO CUOTA' + #9 + 'CUOTAS PAGAS' + #9 + 'AMORTIZACION' + #9 + 'MODALIDAD' + #9 + 'TASA NOMINAL' + #9 + 'TASA EFECTIVA' + #9 + '' +
                  'PRESTAMO' + #9 + 'CUOTA' + #9 + 'CAPITAL' + #9 + 'INTERES' + #9 + 'OTROS' + #9 + 'GARANTIA' + #9 + 'AVALUO' + #9 + 'PROV CAPITAL' + #9 + 'PROV INTERES' + #9 + 'CONTINGEN' + #9 + ''+
                  'VALOR CUOTAS EX' + #9 + 'MESES CUOTAS EX' + #9 + 'ULTIMO PAGO' + #9 + 'CLASE GARANTIA' + #9 + 'DESTINO' + #9 + 'AGENCIA' + #9 + 'AMORTIZAK' + #9 + 'CUOTASMORA' + #9 + 'CLASEVIV' + #9 + 'SENALVIS' + #9 + 'TIPOVIV' + #9 + 'SENALSUB' + #9 + 'ENTREDES' + #9 + 'MARGENRED' + #9 + 'SENALDES' + #9 + 'MONEDA';

        Writeln(Archivo,Cadena);



        IBQuery2.Close;
        IBQuery2.SQL.Clear;
        IBQuery2.SQL.Add('select VALOR_ACTUAL_TASA from "col$tasasvariables" where ID_INTERES = 3');
        try
          IBQuery2.Open;
        except
          raise;
        end;
        uvr  := IBQuery2.FieldByName('VALOR_ACTUAL_TASA').AsCurrency;

        ValorVis := SimpleRoundTo((uvr * 100),0);

       with IBQuery1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Close;
           SQL.Clear;
           SQL.Add('select Count(*) as TOTAL from "col$causaciondiaria" where');
           SQL.Add('FECHA_CORTE = :FECHA_CORTE');
           ParamByName('FECHA_CORTE').AsDate := FechaCorte;
           try
             Open;
             if RecordCount > 0 then Total := FieldByName('TOTAL').AsInteger;
           except
             raise;
           end;

           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('  "col$causaciondiaria".ID_AGENCIA,');
           SQL.Add('  "col$causaciondiaria".ID_COLOCACION,');
           SQL.Add('  "col$causaciondiaria".FECHA_CORTE,');
           SQL.Add('  "col$causaciondiaria".ID_CLASIFICACION,');
           SQL.Add('  "col$causaciondiaria".ID_GARANTIA,');
           SQL.Add('  "col$causaciondiaria".ID_EDAD_ACT,');
           SQL.Add('  "col$causaciondiaria".ID_ARRASTRE,');
           SQL.Add('  "col$causaciondiaria".ID_IDENTIFICACION,');
           SQL.Add('  "col$causaciondiaria".ID_PERSONA,');
           SQL.Add('  "col$causaciondiaria".FECHA_DESEMBOLSO,');
           SQL.Add('  "col$causaciondiaria".VALOR,');
           SQL.Add('  "col$causaciondiaria".DEUDA,');
           SQL.Add('  "col$causaciondiaria".ID_TIPO_CUOTA,');
           SQL.Add('  "col$causaciondiaria".FECHA_CAPITAL,');
           SQL.Add('  "col$causaciondiaria".FECHA_INTERES,');
           SQL.Add('  "col$causaciondiaria".TIPOC_INTERES,');
           SQL.Add('  "col$causaciondiaria".AMORTIZA_CAPITAL,');
           SQL.Add('  "col$causaciondiaria".AMORTIZA_INTERES,');
           SQL.Add('  "col$causaciondiaria".TIPO_INTERES,');
           SQL.Add('  "col$causaciondiaria".TASA_INTERES_CORRIENTE,');
           SQL.Add('  "col$causaciondiaria".ID_INTERES,');
           SQL.Add('  "col$causaciondiaria".VALOR_ACTUAL_TASA,');
           SQL.Add('  "col$causaciondiaria".PUNTOS_INTERES,');
           SQL.Add('  "col$causaciondiaria".DIAS,');
           SQL.Add('  "col$causaciondiaria".TASA,');
           SQL.Add('  "col$causaciondiaria".ANTICIPADOS,');
           SQL.Add('  "col$causaciondiaria".CAUSADOS,');
           SQL.Add('  "col$causaciondiaria".CONTINGENCIAS,');
           SQL.Add('  "col$causaciondiaria".APORTES,');
           SQL.Add('  "col$causaciondiaria".PCAPITAL,');
           SQL.Add('  "col$causaciondiaria".PINTERES,');
           SQL.Add('  "col$causaciondiaria".PCOSTAS,');
           SQL.Add('  "col$causaciondiaria".CORTO_PL,');
           SQL.Add('  "col$causaciondiaria".LARGO_PL,');
           SQL.Add('  "col$causaciondiaria".COSTAS,');
           SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
           SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('  "gen$persona".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('  "col$causaciondiaria"');
           SQL.Add('  LEFT JOIN "gen$persona" ON ("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('where');
           SQL.Add('FECHA_CORTE = :FECHA_CORTE');
           SQL.Add('Order by ID_AGENCIA,ID_COLOCACION');
           ParamByName('FECHA_CORTE').AsDate := FechaCorte;
           try
             Open;
           except
             raise;
           end;

           Barra.Minimum := 0;
           Barra.Maximum := Total;
           Barra.Position := 0;

           while not Eof do begin
              Barra.Position := RecNo;
              Barra.Caption := FloatToStr(simpleroundto((RecNo/Total)*100,0))+'%';
              Application.ProcessMessages;
              Lineas.Tipo_Identificacion := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
              Lineas.Numero_Identificacion := FieldByName('ID_PERSONA').AsString;
              Lineas.Nombre := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                               FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                               FieldByName('NOMBRE').AsString;
              Lineas.Calificacion := FieldByName('ID_ARRASTRE').AsString;
              Lineas.Clasificacion := FieldByName('ID_CLASIFICACION').AsString;
// Busco Codigo Contable
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select COD_CAPITAL_CP from "col$codigospuc" where');
              IBQuery2.SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and');
              IBQuery2.SQL.Add('ID_GARANTIA = :ID_GARANTIA and');
              IBQuery2.SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
              IBQuery2.ParamByName('ID_CLASIFICACION').AsInteger := fieldbyname('ID_CLASIFICACION').AsInteger;
              IBQuery2.ParamByName('ID_GARANTIA').AsInteger := FieldByName('ID_GARANTIA').AsInteger;
              IBQuery2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_ARRASTRE').AsString;
              try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                   Codigo := LeftStr(IBQuery2.FieldByName('COD_CAPITAL_CP').AsString,6);
              except
                Transaction.Rollback;
                raise;
              end;
// Fin Codigo Contable
              Lineas.Codigo_Contable := Codigo;
              Lineas.Reestructurado := '0';
              Lineas.Numero_Credito := IntToStr(FieldByName('ID_AGENCIA').AsInteger) + FieldByName('ID_COLOCACION').AsString;
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select FECHA_DESEMBOLSO from "col$colocacion" where');
              IBSQL1.SQL.Add('ID_COLOCACION = :ID_COLOCACION and ID_AGENCIA = :ID_AGENCIA');
              IBSQL1.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              try
               IBSQL1.ExecQuery;
              except
               raise;
              end;

              Lineas.Fecha_Desembolso := FormatDateTime('yyyy/MM/dd',IBSQL1.FieldByName('FECHA_DESEMBOLSO').AsDateTime);

// Buscar Fecha Vencimiento
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select ID_TIPO_CUOTA,FECHA_VENCIMIENTO,FECHA_INTERES from "col$colocacion"');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then begin
                 if IBQuery2.FieldByName('FECHA_INTERES').AsDateTime > ibquery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime then begin
                   Lineas.Fecha_Vencimiento := FormatDateTime('yyyy/MM/dd',IBQuery2.FieldByName('FECHA_INTERES').AsDateTime);
                   FechaVencimiento := IBQuery2.FieldByName('FECHA_INTERES').AsDateTime;
                 end
                 else begin
                   Lineas.Fecha_Vencimiento := FormatDateTime('yyyy/MM/dd',IBQuery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime);
                   FechaVencimiento := IBQuery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                 end;
               end
               else begin
                 Lineas.Fecha_Vencimiento := Lineas.Fecha_Desembolso;
                 FechaVencimiento := IBSQL1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
               end;
              except
               raise;
              end;

//              FechaVencimiento := StrToDate(Lineas.Fecha_Vencimiento);

              if ( FieldByName('TIPOC_INTERES').AsString = 'A' ) then
                 Dia := FieldByName('DIAS').AsInteger
              else
              if ( FieldByName('TIPOC_INTERES').AsString = 'V' ) then
                 Dia := FieldByName('DIAS').AsInteger - FieldByName('AMORTIZA_INTERES').AsInteger;

              if Dia < 1 then Dia := 0;

              if FechaCorte > FechaVencimiento then
                Dia := DaysBetween(FechaCorte,FechaVencimiento);

              Lineas.Morosidad := IntToStr(Dia);
              if IBQuery2.FieldByName('ID_TIPO_CUOTA').AsInteger = 1 then
                  Lineas.Tipo_Cuota := '1'
              else
                  Lineas.Tipo_Cuota := '2';

// Buscar cuotas pagas
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select count(*) as TOTAL from "col$tablaliquidacion" ');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and');
              IBQuery2.SQL.Add('PAGADA <> 0 and FECHA_PAGADA <= :FECHA_CORTE');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                   Lineas.Cuotas_Pagas := IntToStr(IBQuery2.FieldByName('TOTAL').AsInteger)
                else
                   Lineas.Cuotas_Pagas := '0';
              except
                raise;
              end;
// Fin Cuotas Pagas
              Lineas.Amortizacion := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
              if FieldByName('TIPOC_INTERES').AsString = 'A' then
                 Lineas.Modalidad := '1'
              else
                 Lineas.Modalidad := '2';

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$tasafijas" where :FECHA BETWEEN FECHA_INICIAL and FECHA_FINAL');
              IBQuery2.ParamByName('FECHA').AsDate := FechaCorte;
              try
               IBQuery2.Open;
               TasaMax := IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
              except
               raise;
              end;


              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$tasafijas" where :FECHA BETWEEN FECHA_INICIAL and FECHA_FINAL');
              IBQuery2.ParamByName('FECHA').AsDate := FechaCorte;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then begin
                 if IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat < (FieldByName('TASA_INTERES_CORRIENTE').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat) then
                   TasaMax := IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat
                 else
                   TasaMax := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
               end
               else

               begin
                  if TasaMax > FieldByName('TASA_INTERES_CORRIENTE').AsFloat then
                    TasaMax := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
               end;
              except
               raise;
              end;

              Lineas.Tasa_Efectiva := FormatCurr('00.00',(TasaMax + FieldByName('PUNTOS_INTERES').AsFloat));

              if FieldByName('TIPOC_INTERES').AsString = 'A' then
                 Lineas.Tasa_Nominal := FormatCurr('00.00',(TasaNominalAnticipada(TasaMax,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat))
              else
                 Lineas.Tasa_Nominal := FormatCurr('00.00',(TasaNominalVencida(TasaMax,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat));

              Lineas.Valor_Prestamo := FormatCurr('#0',FieldByName('VALOR').AsCurrency);
// Busco Valor Cuota
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select VALOR_CUOTA from "col$colocacion"');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then
                  Lineas.Valor_Cuota := FormatCurr('#0',IBQuery2.FieldByName('VALOR_CUOTA').AsCurrency)
               else
                  Lineas.Valor_Cuota := '0';
              except
               raise;
              end;
//Fin Cuota
              Lineas.Saldo_Capital := FormatCurr('#0',FieldByName('DEUDA').AsCurrency);
              Lineas.Saldo_Interes := FormatCurr('#0',FieldByName('CAUSADOS').AsCurrency);
              Lineas.Otros_Saldos  := FormatCurr('#0',FieldByName('COSTAS').AsCurrency);

              //Proceso Garantia Real
              ValorGReal := 0;
              IBGarReal.Close;
              IBGarReal.SQL.Clear;
              IBGarReal.SQL.Add('SELECT "col$colgarantiasreal".CUENTAS_DE_ORDEN as VALOR, FECHA_AVALUO as FECHA_AVALUO');
              IBGarReal.SQL.Add('FROM "col$colgarantiasreal" INNER JOIN "col$colocacion" on ("col$colgarantiasreal".ID_AGENCIA = "col$colocacion".ID_AGENCIA');
              IBGarReal.SQL.Add('and "col$colgarantiasreal".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
              IBGarReal.SQL.Add('WHERE "col$colgarantiasreal".ID_AGENCIA = :ID_AGENCIA and');
              IBGarReal.SQL.Add('"col$colgarantiasreal".ID_COLOCACION = :ID_COLOCACION and');
              IBGarReal.SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION <= 3');
              IBGarReal.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBGarReal.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBGarReal.ExecQuery;
              while not IBGarReal.Eof do begin
                ValorGReal := ValorGReal + IBGarReal.FieldByName('VALOR').AsCurrency;
                IBGarReal.Next;
              end;
              if ValorGReal > 0 then
                Lineas.Valor_Garantia := CurrToStr(ValorGReal)
              else
                Lineas.Valor_Garantia := '0';
              //Fin Garantía Real

              if not IBGarReal.FieldByName('FECHA_AVALUO').IsNull then
                Lineas.Fecha_Avaluo := IBGarReal.FieldByName('FECHA_AVALUO').AsString
              else
                Lineas.Fecha_Avaluo := '';
              IBGarReal.Close;

              Lineas.Provision_Capital := FormatCurr('#0',FieldByName('PCAPITAL').AsCurrency);
              Lineas.Provision_Interes := FormatCurr('#0',FieldByName('PINTERES').AsCurrency);
              Lineas.Contintengia_Interes := FormatCurr('#0',FieldByName('CONTINGENCIAS').AsCurrency);
              Lineas.Valor_Cuotas_Extras := '';
              Lineas.Meses_Cuotas_Extras := '';
// Busco Fecha Ultimo Pago
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$extracto" where');
              IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION and');
              IBQuery2.SQL.Add('TIPO_OPERACION = 1 and FECHA_EXTRACTO <= :FECHA_CORTE');
              IBQuery2.SQL.Add('Order by FECHA_EXTRACTO, HORA_EXTRACTO');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
                IBQuery2.Last;
              except
                raise;
              end;
              Lineas.Fecha_Ultimo_Pago := FormatDateTime('dd/mm/yyyy',IBQuery2.FieldByName('FECHA_EXTRACTO').AsDateTime);
              if Lineas.Fecha_Ultimo_Pago = '30/12/1899' then
                Lineas.Fecha_Ultimo_Pago := '';
// Fin Ultimo pago
              if FieldByName('ID_GARANTIA').AsInteger = 1 then
                 Lineas.Clase_Garantia := '9'
              else
                 Lineas.Clase_Garantia := '1';

              Lineas.Destino_Credito := 'A';
              Lineas.Agencia := Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]);
              Lineas.AmortizaK := Format('%.2d',[IBQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger]);

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select sum(CAPITAL_A_PAGAR) as CAPITAL from "col$tablaliquidacion" where ');
              IBQuery2.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
              IBQuery2.SQL.Add('PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
              except
                raise;
              end;

              Lineas.CuotasMora := '0';
              if StrToInt(Lineas.Morosidad) <> 0 then
              begin
                if IBQuery2.FieldByName('CAPITAL').AsCurrency > FieldByName('DEUDA').AsCurrency then
                   Lineas.CuotasMora := CurrToStr(FieldByName('DEUDA').AsCurrency)
                else
                   Lineas.CuotasMora := CurrToStr(IBQuery2.FieldByName('CAPITAL').AsCurrency);
              end;

              if Lineas.Clasificacion  = '3' then
               begin
                 Lineas.ClaseViv := '1';
                 Lineas.Senalvis := '0';

                 if SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) < (643100 * uvr) then
                   Lineas.TipoViv := '1'
                 else if (SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) > (643100 * uvr)) and (SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) < (2411625 * uvr)) then
                   Lineas.TipoViv := '2'
                 else if (SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) > (2411625 * uvr)) then
                   Lineas.TipoViv := '3';

                 Lineas.SenalSub := '0';
                 Lineas.EntRedes := '0';
                 Lineas.MargenRed := '0';
                 Lineas.SenalDes := '1';
                 Lineas.Moneda := '1';
               end
              else
               begin
                 Lineas.ClaseViv := '';
                 Lineas.Senalvis := '';
                 Lineas.TipoViv := ''; //falta
                 Lineas.SenalSub := '';
                 Lineas.EntRedes := '';
                 Lineas.MargenRed := '';
                 Lineas.SenalDes  := '1';
                 Lineas.Moneda := '1';
               end;

              Cadena := Lineas.Tipo_Identificacion + #9 +
                          Lineas.Numero_Identificacion + #9 +
                          Lineas.Nombre + #9 +
                          Lineas.Clasificacion + #9 +
                          Lineas.Calificacion + #9 +
                          Lineas.Codigo_Contable + #9 +
                          Lineas.Reestructurado + #9 +
                          Lineas.Numero_Credito + #9 +
                          Lineas.Fecha_Desembolso + #9 +
                          Lineas.Fecha_Vencimiento + #9 +
                          Lineas.Morosidad + #9 +
                          Lineas.Tipo_Cuota + #9 +
                          Lineas.Cuotas_Pagas + #9 +
                          Lineas.Amortizacion + #9 +
                          Lineas.Modalidad + #9 +
                          Lineas.Tasa_Nominal + #9 +
                          Lineas.Tasa_Efectiva + #9 +
                          Lineas.Valor_Prestamo + #9 +
                          Lineas.Valor_Cuota + #9 +
                          Lineas.Saldo_Capital + #9 +
                          Lineas.Saldo_Interes + #9 +
                          Lineas.Otros_Saldos + #9 +
                          Lineas.Valor_Garantia + #9 +
                          Lineas.Fecha_Avaluo + #9 +
                          Lineas.Provision_Capital + #9 +
                          Lineas.Provision_Interes + #9 +
                          Lineas.Contintengia_Interes + #9 +
                          Lineas.Valor_Cuotas_Extras + #9 +
                          Lineas.Meses_Cuotas_Extras + #9 +
                          Lineas.Fecha_Ultimo_Pago + #9 +
                          Lineas.Clase_Garantia + #9 +
                          Lineas.Destino_Credito + #9 +
                          Lineas.Agencia + #9 +
                          Lineas.AmortizaK + #9 +
                          Lineas.CuotasMora + #9 +
                          Lineas.ClaseViv + #9 +
                          Lineas.Senalvis + #9 +
                          Lineas.TipoViv + #9 +
                          Lineas.SenalSub + #9 +
                          Lineas.EntRedes + #9 +
                          Lineas.MargenRed + #9 +
                          Lineas.SenalDes + #9 +
                          Lineas.Moneda;
              Writeln(Archivo,Cadena);
            Next;
           end; // del while
        end; // del with
    CloseFile(Archivo);
    Database.Close;
// Fin Abrego

// Convencion
   DBpath1 := dbpath + '03' + FormatCurr('00',MonthOf(FechaCorte)) + FormatCurr('0000',YearOf(FechaCorte)) + '/';
   lblEstado.Caption := 'Procesando Convencion ...';
   Database.DataBaseName := DBserver + ':' + DBpath1 + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
   try
     Database.Connected := True;
   except
     raise;
   end;

    Cadena := IntToStr(YearOf(FechaCorte)) + IntToStr(MonthOf(FechaCorte)) + IntToStr(DayOf(FechaCorte));
    AssignFile(ARCHIVO,'//Archivos/publico/PlanosFinMes/CARTERA03' + Cadena + '.TXT');
    //AssignFile(F,'C:/PlanosFinMes/Aportes' + Cadena);

        Rewrite(Archivo);
        Cadena := 'TIPO ID'+ #9 +'IDENTIFICACION' + #9 + 'NOMBRE' + #9 + 'CLASIFICACION' + #9 + 'CALIFICACION' + #9 + 'CODIGO' + #9 + 'REESTRUCTURADO' + #9 + 'COLOCACION' + #9 + 'DESEMBOLSO' + #9 + 'VENCIMIENTO' + #9 + '' +
                  'MOROSIDAD' + #9 + 'TIPO CUOTA' + #9 + 'CUOTAS PAGAS' + #9 + 'AMORTIZACION' + #9 + 'MODALIDAD' + #9 + 'TASA NOMINAL' + #9 + 'TASA EFECTIVA' + #9 + '' +
                  'PRESTAMO' + #9 + 'CUOTA' + #9 + 'CAPITAL' + #9 + 'INTERES' + #9 + 'OTROS' + #9 + 'GARANTIA' + #9 + 'AVALUO' + #9 + 'PROV CAPITAL' + #9 + 'PROV INTERES' + #9 + 'CONTINGEN' + #9 + ''+
                  'VALOR CUOTAS EX' + #9 + 'MESES CUOTAS EX' + #9 + 'ULTIMO PAGO' + #9 + 'CLASE GARANTIA' + #9 + 'DESTINO' + #9 + 'AGENCIA' + #9 + 'AMORTIZAK' + #9 + 'CUOTASMORA' + #9 + 'CLASEVIV' + #9 + 'SENALVIS' + #9 + 'TIPOVIV' + #9 + 'SENALSUB' + #9 + 'ENTREDES' + #9 + 'MARGENRED' + #9 + 'SENALDES' + #9 + 'MONEDA';

        Writeln(Archivo,Cadena);



        IBQuery2.Close;
        IBQuery2.SQL.Clear;
        IBQuery2.SQL.Add('select VALOR_ACTUAL_TASA from "col$tasasvariables" where ID_INTERES = 3');
        try
          IBQuery2.Open;
        except
          raise;
        end;
        uvr  := IBQuery2.FieldByName('VALOR_ACTUAL_TASA').AsCurrency;

        ValorVis := SimpleRoundTo((uvr * 100),0);

       with IBQuery1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Close;
           SQL.Clear;
           SQL.Add('select Count(*) as TOTAL from "col$causaciondiaria" where');
           SQL.Add('FECHA_CORTE = :FECHA_CORTE');
           ParamByName('FECHA_CORTE').AsDate := FechaCorte;
           try
             Open;
             if RecordCount > 0 then Total := FieldByName('TOTAL').AsInteger;
           except
             raise;
           end;

           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('  "col$causaciondiaria".ID_AGENCIA,');
           SQL.Add('  "col$causaciondiaria".ID_COLOCACION,');
           SQL.Add('  "col$causaciondiaria".FECHA_CORTE,');
           SQL.Add('  "col$causaciondiaria".ID_CLASIFICACION,');
           SQL.Add('  "col$causaciondiaria".ID_GARANTIA,');
           SQL.Add('  "col$causaciondiaria".ID_EDAD_ACT,');
           SQL.Add('  "col$causaciondiaria".ID_ARRASTRE,');
           SQL.Add('  "col$causaciondiaria".ID_IDENTIFICACION,');
           SQL.Add('  "col$causaciondiaria".ID_PERSONA,');
           SQL.Add('  "col$causaciondiaria".FECHA_DESEMBOLSO,');
           SQL.Add('  "col$causaciondiaria".VALOR,');
           SQL.Add('  "col$causaciondiaria".DEUDA,');
           SQL.Add('  "col$causaciondiaria".ID_TIPO_CUOTA,');
           SQL.Add('  "col$causaciondiaria".FECHA_CAPITAL,');
           SQL.Add('  "col$causaciondiaria".FECHA_INTERES,');
           SQL.Add('  "col$causaciondiaria".TIPOC_INTERES,');
           SQL.Add('  "col$causaciondiaria".AMORTIZA_CAPITAL,');
           SQL.Add('  "col$causaciondiaria".AMORTIZA_INTERES,');
           SQL.Add('  "col$causaciondiaria".TIPO_INTERES,');
           SQL.Add('  "col$causaciondiaria".TASA_INTERES_CORRIENTE,');
           SQL.Add('  "col$causaciondiaria".ID_INTERES,');
           SQL.Add('  "col$causaciondiaria".VALOR_ACTUAL_TASA,');
           SQL.Add('  "col$causaciondiaria".PUNTOS_INTERES,');
           SQL.Add('  "col$causaciondiaria".DIAS,');
           SQL.Add('  "col$causaciondiaria".TASA,');
           SQL.Add('  "col$causaciondiaria".ANTICIPADOS,');
           SQL.Add('  "col$causaciondiaria".CAUSADOS,');
           SQL.Add('  "col$causaciondiaria".CONTINGENCIAS,');
           SQL.Add('  "col$causaciondiaria".APORTES,');
           SQL.Add('  "col$causaciondiaria".PCAPITAL,');
           SQL.Add('  "col$causaciondiaria".PINTERES,');
           SQL.Add('  "col$causaciondiaria".PCOSTAS,');
           SQL.Add('  "col$causaciondiaria".CORTO_PL,');
           SQL.Add('  "col$causaciondiaria".LARGO_PL,');
           SQL.Add('  "col$causaciondiaria".COSTAS,');
           SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
           SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('  "gen$persona".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('  "col$causaciondiaria"');
           SQL.Add('  LEFT JOIN "gen$persona" ON ("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('where');
           SQL.Add('FECHA_CORTE = :FECHA_CORTE');
           SQL.Add('Order by ID_AGENCIA,ID_COLOCACION');
           ParamByName('FECHA_CORTE').AsDate := FechaCorte;
           try
             Open;
           except
             raise;
           end;

           Barra.Minimum := 0;
           Barra.Maximum := Total;
           Barra.Position := 0;

           while not Eof do begin
              Barra.Position := RecNo;
              Barra.Caption := FloatToStr(simpleroundto((RecNo/Total)*100,0))+'%';
              Application.ProcessMessages;
              Lineas.Tipo_Identificacion := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
              Lineas.Numero_Identificacion := FieldByName('ID_PERSONA').AsString;
              Lineas.Nombre := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                               FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                               FieldByName('NOMBRE').AsString;
              Lineas.Calificacion := FieldByName('ID_ARRASTRE').AsString;
              Lineas.Clasificacion := FieldByName('ID_CLASIFICACION').AsString;
// Busco Codigo Contable
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select COD_CAPITAL_CP from "col$codigospuc" where');
              IBQuery2.SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and');
              IBQuery2.SQL.Add('ID_GARANTIA = :ID_GARANTIA and');
              IBQuery2.SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
              IBQuery2.ParamByName('ID_CLASIFICACION').AsInteger := fieldbyname('ID_CLASIFICACION').AsInteger;
              IBQuery2.ParamByName('ID_GARANTIA').AsInteger := FieldByName('ID_GARANTIA').AsInteger;
              IBQuery2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_ARRASTRE').AsString;
              try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                   Codigo := LeftStr(IBQuery2.FieldByName('COD_CAPITAL_CP').AsString,6);
              except
                Transaction.Rollback;
                raise;
              end;
// Fin Codigo Contable
              Lineas.Codigo_Contable := Codigo;
              Lineas.Reestructurado := '0';
              Lineas.Numero_Credito := IntToStr(FieldByName('ID_AGENCIA').AsInteger) + FieldByName('ID_COLOCACION').AsString;
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select FECHA_DESEMBOLSO from "col$colocacion" where');
              IBSQL1.SQL.Add('ID_COLOCACION = :ID_COLOCACION and ID_AGENCIA = :ID_AGENCIA');
              IBSQL1.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              try
               IBSQL1.ExecQuery;
              except
               raise;
              end;

              Lineas.Fecha_Desembolso := FormatDateTime('yyyy/MM/dd',IBSQL1.FieldByName('FECHA_DESEMBOLSO').AsDateTime);

// Buscar Fecha Vencimiento
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select ID_TIPO_CUOTA,FECHA_VENCIMIENTO,FECHA_INTERES from "col$colocacion"');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then begin
                 if IBQuery2.FieldByName('FECHA_INTERES').AsDateTime > ibquery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime then begin
                   Lineas.Fecha_Vencimiento := FormatDateTime('yyyy/MM/dd',IBQuery2.FieldByName('FECHA_INTERES').AsDateTime);
                   FechaVencimiento := IBQuery2.FieldByName('FECHA_INTERES').AsDateTime;
                 end
                 else begin
                   Lineas.Fecha_Vencimiento := FormatDateTime('yyyy/MM/dd',IBQuery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime);
                   FechaVencimiento := IBQuery2.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                 end;
               end
               else begin
                 Lineas.Fecha_Vencimiento := Lineas.Fecha_Desembolso;
                 FechaVencimiento := IBSQL1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
               end;
              except
               raise;
              end;

//              FechaVencimiento := StrToDate(Lineas.Fecha_Vencimiento);

              if ( FieldByName('TIPOC_INTERES').AsString = 'A' ) then
                 Dia := FieldByName('DIAS').AsInteger
              else
              if ( FieldByName('TIPOC_INTERES').AsString = 'V' ) then
                 Dia := FieldByName('DIAS').AsInteger - FieldByName('AMORTIZA_INTERES').AsInteger;

              if Dia < 1 then Dia := 0;

              if FechaCorte > FechaVencimiento then
                Dia := DaysBetween(FechaCorte,FechaVencimiento);

              Lineas.Morosidad := IntToStr(Dia);
              if IBQuery2.FieldByName('ID_TIPO_CUOTA').AsInteger = 1 then
                  Lineas.Tipo_Cuota := '1'
              else
                  Lineas.Tipo_Cuota := '2';

// Buscar cuotas pagas
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select count(*) as TOTAL from "col$tablaliquidacion" ');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION and');
              IBQuery2.SQL.Add('PAGADA <> 0 and FECHA_PAGADA <= :FECHA_CORTE');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                   Lineas.Cuotas_Pagas := IntToStr(IBQuery2.FieldByName('TOTAL').AsInteger)
                else
                   Lineas.Cuotas_Pagas := '0';
              except
                raise;
              end;
// Fin Cuotas Pagas
              Lineas.Amortizacion := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
              if FieldByName('TIPOC_INTERES').AsString = 'A' then
                 Lineas.Modalidad := '1'
              else
                 Lineas.Modalidad := '2';

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$tasafijas" where :FECHA BETWEEN FECHA_INICIAL and FECHA_FINAL');
              IBQuery2.ParamByName('FECHA').AsDate := FechaCorte;
              try
               IBQuery2.Open;
               TasaMax := IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat;
              except
               raise;
              end;


              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$tasafijas" where :FECHA BETWEEN FECHA_INICIAL and FECHA_FINAL');
              IBQuery2.ParamByName('FECHA').AsDate := FechaCorte;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then begin
                 if IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat < (FieldByName('TASA_INTERES_CORRIENTE').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat) then
                   TasaMax := IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat
                 else
                   TasaMax := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
               end
               else

               begin
                  if TasaMax > FieldByName('TASA_INTERES_CORRIENTE').AsFloat then
                    TasaMax := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
               end;
              except
               raise;
              end;

              Lineas.Tasa_Efectiva := FormatCurr('00.00',(TasaMax + FieldByName('PUNTOS_INTERES').AsFloat));

              if FieldByName('TIPOC_INTERES').AsString = 'A' then
                 Lineas.Tasa_Nominal := FormatCurr('00.00',(TasaNominalAnticipada(TasaMax,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat))
              else
                 Lineas.Tasa_Nominal := FormatCurr('00.00',(TasaNominalVencida(TasaMax,FieldByName('AMORTIZA_INTERES').AsInteger) + FieldByName('PUNTOS_INTERES').AsFloat));

              Lineas.Valor_Prestamo := FormatCurr('#0',FieldByName('VALOR').AsCurrency);
// Busco Valor Cuota
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select VALOR_CUOTA from "col$colocacion"');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then
                  Lineas.Valor_Cuota := FormatCurr('#0',IBQuery2.FieldByName('VALOR_CUOTA').AsCurrency)
               else
                  Lineas.Valor_Cuota := '0';
              except
               raise;
              end;
//Fin Cuota
              Lineas.Saldo_Capital := FormatCurr('#0',FieldByName('DEUDA').AsCurrency);
              Lineas.Saldo_Interes := FormatCurr('#0',FieldByName('CAUSADOS').AsCurrency);
              Lineas.Otros_Saldos  := FormatCurr('#0',FieldByName('COSTAS').AsCurrency);

              //Proceso Garantia Real
              ValorGReal := 0;
              IBGarReal.Close;
              IBGarReal.SQL.Clear;
              IBGarReal.SQL.Add('SELECT "col$colgarantiasreal".CUENTAS_DE_ORDEN as VALOR, FECHA_AVALUO as FECHA_AVALUO');
              IBGarReal.SQL.Add('FROM "col$colgarantiasreal" INNER JOIN "col$colocacion" on ("col$colgarantiasreal".ID_AGENCIA = "col$colocacion".ID_AGENCIA');
              IBGarReal.SQL.Add('and "col$colgarantiasreal".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
              IBGarReal.SQL.Add('WHERE "col$colgarantiasreal".ID_AGENCIA = :ID_AGENCIA and');
              IBGarReal.SQL.Add('"col$colgarantiasreal".ID_COLOCACION = :ID_COLOCACION and');
              IBGarReal.SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION <= 3');
              IBGarReal.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBGarReal.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBGarReal.ExecQuery;
              while not IBGarReal.Eof do begin
                ValorGReal := ValorGReal + IBGarReal.FieldByName('VALOR').AsCurrency;
                IBGarReal.Next;
              end;
              if ValorGReal > 0 then
                Lineas.Valor_Garantia := CurrToStr(ValorGReal)
              else
                Lineas.Valor_Garantia := '0';
              //Fin Garantía Real

              if not IBGarReal.FieldByName('FECHA_AVALUO').IsNull then
                Lineas.Fecha_Avaluo := IBGarReal.FieldByName('FECHA_AVALUO').AsString
              else
                Lineas.Fecha_Avaluo := '';
              IBGarReal.Close;

              Lineas.Provision_Capital := FormatCurr('#0',FieldByName('PCAPITAL').AsCurrency);
              Lineas.Provision_Interes := FormatCurr('#0',FieldByName('PINTERES').AsCurrency);
              Lineas.Contintengia_Interes := FormatCurr('#0',FieldByName('CONTINGENCIAS').AsCurrency);
              Lineas.Valor_Cuotas_Extras := '';
              Lineas.Meses_Cuotas_Extras := '';
// Busco Fecha Ultimo Pago
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$extracto" where');
              IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION and');
              IBQuery2.SQL.Add('TIPO_OPERACION = 1 and FECHA_EXTRACTO <= :FECHA_CORTE');
              IBQuery2.SQL.Add('Order by FECHA_EXTRACTO, HORA_EXTRACTO');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
                IBQuery2.Last;
              except
                raise;
              end;
              Lineas.Fecha_Ultimo_Pago := FormatDateTime('dd/mm/yyyy',IBQuery2.FieldByName('FECHA_EXTRACTO').AsDateTime);
              if Lineas.Fecha_Ultimo_Pago = '30/12/1899' then
                Lineas.Fecha_Ultimo_Pago := '';
// Fin Ultimo pago
              if FieldByName('ID_GARANTIA').AsInteger = 1 then
                 Lineas.Clase_Garantia := '9'
              else
                 Lineas.Clase_Garantia := '1';

              Lineas.Destino_Credito := 'A';
              Lineas.Agencia := Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]);
              Lineas.AmortizaK := Format('%.2d',[IBQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger]);

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select sum(CAPITAL_A_PAGAR) as CAPITAL from "col$tablaliquidacion" where ');
              IBQuery2.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" and ');
              IBQuery2.SQL.Add('PAGADA = 0 and FECHA_A_PAGAR < :"FECHA_CORTE"');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
              except
                raise;
              end;

              Lineas.CuotasMora := '0';
              if StrToInt(Lineas.Morosidad) <> 0 then
              begin
                if IBQuery2.FieldByName('CAPITAL').AsCurrency > FieldByName('DEUDA').AsCurrency then
                   Lineas.CuotasMora := CurrToStr(FieldByName('DEUDA').AsCurrency)
                else
                   Lineas.CuotasMora := CurrToStr(IBQuery2.FieldByName('CAPITAL').AsCurrency);
              end;

              if Lineas.Clasificacion  = '3' then
               begin
                 Lineas.ClaseViv := '1';
                 Lineas.Senalvis := '0';

                 if SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) < (643100 * uvr) then
                   Lineas.TipoViv := '1'
                 else if (SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) > (643100 * uvr)) and (SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) < (2411625 * uvr)) then
                   Lineas.TipoViv := '2'
                 else if (SimpleRoundTo((FieldByName('VALOR').AsCurrency / 0.70),0) > (2411625 * uvr)) then
                   Lineas.TipoViv := '3';

                 Lineas.SenalSub := '0';
                 Lineas.EntRedes := '0';
                 Lineas.MargenRed := '0';
                 Lineas.SenalDes := '1';
                 Lineas.Moneda := '1';
               end
              else
               begin
                 Lineas.ClaseViv := '';
                 Lineas.Senalvis := '';
                 Lineas.TipoViv := ''; //falta
                 Lineas.SenalSub := '';
                 Lineas.EntRedes := '';
                 Lineas.MargenRed := '';
                 Lineas.SenalDes  := '1';
                 Lineas.Moneda := '1';
               end;

              Cadena := Lineas.Tipo_Identificacion + #9 +
                          Lineas.Numero_Identificacion + #9 +
                          Lineas.Nombre + #9 +
                          Lineas.Clasificacion + #9 +
                          Lineas.Calificacion + #9 +
                          Lineas.Codigo_Contable + #9 +
                          Lineas.Reestructurado + #9 +
                          Lineas.Numero_Credito + #9 +
                          Lineas.Fecha_Desembolso + #9 +
                          Lineas.Fecha_Vencimiento + #9 +
                          Lineas.Morosidad + #9 +
                          Lineas.Tipo_Cuota + #9 +
                          Lineas.Cuotas_Pagas + #9 +
                          Lineas.Amortizacion + #9 +
                          Lineas.Modalidad + #9 +
                          Lineas.Tasa_Nominal + #9 +
                          Lineas.Tasa_Efectiva + #9 +
                          Lineas.Valor_Prestamo + #9 +
                          Lineas.Valor_Cuota + #9 +
                          Lineas.Saldo_Capital + #9 +
                          Lineas.Saldo_Interes + #9 +
                          Lineas.Otros_Saldos + #9 +
                          Lineas.Valor_Garantia + #9 +
                          Lineas.Fecha_Avaluo + #9 +
                          Lineas.Provision_Capital + #9 +
                          Lineas.Provision_Interes + #9 +
                          Lineas.Contintengia_Interes + #9 +
                          Lineas.Valor_Cuotas_Extras + #9 +
                          Lineas.Meses_Cuotas_Extras + #9 +
                          Lineas.Fecha_Ultimo_Pago + #9 +
                          Lineas.Clase_Garantia + #9 +
                          Lineas.Destino_Credito + #9 +
                          Lineas.Agencia + #9 +
                          Lineas.AmortizaK + #9 +
                          Lineas.CuotasMora + #9 +
                          Lineas.ClaseViv + #9 +
                          Lineas.Senalvis + #9 +
                          Lineas.TipoViv + #9 +
                          Lineas.SenalSub + #9 +
                          Lineas.EntRedes + #9 +
                          Lineas.MargenRed + #9 +
                          Lineas.SenalDes + #9 +
                          Lineas.Moneda;
              Writeln(Archivo,Cadena);
            Next;
           end; // del while
        end; // del with
    CloseFile(Archivo);
    Database.Close;
// Fin Convencion

// Inicio Proceso Garantias Reales sin Credito
     {   with IBQuery1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as TOTAL from "col$colocacion" inner join "col$colgarantiasreal" on ("col$colocacion".ID_COLOCACION = "col$colgarantiasreal".ID_COLOCACION)');
           SQL.Add('where "col$colgarantiasreal".ES_HIPOTECA = 1 and "col$colocacion".ID_ESTADO_COLOCACION in (7,8)');
           try
             Open;
             if RecordCount > 0 then Total := FieldByName('TOTAL').AsInteger;
           except
             raise;
           end;

           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"col$colocacion".ID_AGENCIA,');
           SQL.Add('"col$colocacion".ID_COLOCACION,');
           SQL.Add('"col$colocacion".ID_CLASIFICACION,');
           SQL.Add('"col$colocacion".ID_GARANTIA,');
           SQL.Add('"col$colocacion".ID_EVALUACION,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
           SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
           SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
           SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - ABONOS_CAPITAL AS DEUDA,');
           SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
           SQL.Add('"col$colocacion".FECHA_CAPITAL,');
           SQL.Add('"col$colocacion".FECHA_INTERES,');
           SQL.Add('"col$tiposcuota".INTERES,');
           SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
           SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
           SQL.Add('"col$colocacion".TIPO_INTERES,');
           SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
           SQL.Add('"col$colocacion".ID_INTERES,');
           SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
           SQL.Add('"col$colocacion".PUNTOS_INTERES,');
           SQL.Add('"col$colgarantiasreal".CUENTAS_DE_ORDEN as VALOR_REAL,');
           SQL.Add('"col$colgarantiasreal".FECHA_AVALUO,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$persona".NOMBRE');
           SQL.Add('from "col$colocacion"');
           SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('inner join "col$tiposcuota" on ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
           SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES)');
           SQL.Add('inner join "col$colgarantiasreal" on ("col$colocacion".ID_COLOCACION = "col$colgarantiasreal".ID_COLOCACION)');
           SQL.Add('where');
           SQL.Add('"col$colgarantiasreal".ES_HIPOTECA = 1 and "col$colocacion".ID_ESTADO_COLOCACION in (7,8)');
           SQL.Add('Order by "col$colocacion".ID_AGENCIA,"col$colocacion".ID_COLOCACION');
           try
             Open;
           except
             raise;
           end;

           Barra.Minimum := 0;
           Barra.Maximum := Total;
           Barra.Position := 0;

           while not Eof do begin
              Barra.Position := RecNo;
              Barra.Caption := 'Procesando Garantias Reales' + FloatToStr(simpleroundto((RecNo/Total)*100,0))+'%';
              Application.ProcessMessages;
              Lineas.Tipo_Identificacion := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
              Lineas.Numero_Identificacion := FieldByName('ID_PERSONA').AsString;
              Lineas.Nombre := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                               FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                               FieldByName('NOMBRE').AsString;
              Lineas.Calificacion := FieldByName('ID_EVALUACION').AsString;
              Lineas.Clasificacion := FieldByName('ID_CLASIFICACION').AsString;
              // Busco Codigo Contable
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select COD_CAPITAL_CP from "col$codigospuc" where');
              IBQuery2.SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and');
              IBQuery2.SQL.Add('ID_GARANTIA = :ID_GARANTIA and');
              IBQuery2.SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
              IBQuery2.ParamByName('ID_CLASIFICACION').AsInteger := fieldbyname('ID_CLASIFICACION').AsInteger;
              IBQuery2.ParamByName('ID_GARANTIA').AsInteger := FieldByName('ID_GARANTIA').AsInteger;
              IBQuery2.ParamByName('ID_CATEGORIA').AsString := FieldByName('ID_EVALUACION').AsString;
              try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                   Codigo := LeftStr(IBQuery2.FieldByName('COD_CAPITAL_CP').AsString,6);
              except
                Transaction.Rollback;
                raise;
              end;
              // Fin Codigo Contable
              Lineas.Codigo_Contable := Codigo;
              Lineas.Reestructurado := '0';
              Lineas.Numero_Credito := FieldByName('ID_COLOCACION').AsString;
              Lineas.Fecha_Desembolso := FormatDateTime('dd/mm/yyyy',FieldByName('FECHA_DESEMBOLSO').AsDateTime);
              if FieldByName('FECHA_INTERES').AsDateTime > FieldByName('FECHA_VENCIMIENTO').AsDateTime then
                Lineas.Fecha_Vencimiento := FormatDateTime('dd/mm/yyyy',FieldByName('FECHA_INTERES').AsDateTime)
              else
                Lineas.Fecha_Vencimiento := FormatDateTime('dd/mm/yyyy',FieldByName('FECHA_VENCIMIENTO').AsDateTime);

              Lineas.Morosidad := '0';
              if FieldByName('ID_TIPO_CUOTA').AsInteger = 1 then
                  Lineas.Tipo_Cuota := '1'
              else
                  Lineas.Tipo_Cuota := '2';

              Lineas.Cuotas_Pagas := '0';
              Lineas.Amortizacion := IntToStr(FieldByName('AMORTIZA_INTERES').AsInteger);
              if FieldByName('INTERES').AsString = 'A' then
                 Lineas.Modalidad := '1'
              else
                 Lineas.Modalidad := '2';

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$tasafijas" where :FECHA BETWEEN FECHA_INICIAL and FECHA_FINAL');
//              IBQuery2.ParamByName('FECHA').AsDate := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
              IBQuery2.ParamByName('FECHA').AsDate := FechaCorte;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then begin
                 if IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat < FieldByName('TASA_INTERES_CORRIENTE').AsFloat then
                   TasaMax := IBQuery2.FieldByName('VALOR_TASA_EFECTIVA').AsFloat
                 else
                   TasaMax := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
               end
               else
               begin
                  if TasaMax > FieldByName('TASA_INTERES_CORRIENTE').AsFloat then
                    TasaMax := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
               end;
              except
               raise;
              end;

              Lineas.Tasa_Efectiva := FloatToStr(TasaMax);

              if FieldByName('INTERES').AsString = 'A' then
                 Lineas.Tasa_Nominal := FloatToStr(TasaNominalAnticipada(TasaMax,FieldByName('AMORTIZA_INTERES').AsInteger))
              else
                 Lineas.Tasa_Nominal := FloatToStr(TasaNominalVencida(TasaMax,FieldByName('AMORTIZA_INTERES').AsInteger));

              Lineas.Valor_Prestamo := FormatCurr('#0',FieldByName('VALOR_DESEMBOLSO').AsCurrency);
// Busco Valor Cuota
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select VALOR_CUOTA from "col$colocacion"');
              IBQuery2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              try
               IBQuery2.Open;
               if IBQuery2.RecordCount > 0 then
                  Lineas.Valor_Cuota := FormatCurr('#0',IBQuery2.FieldByName('VALOR_CUOTA').AsCurrency)
               else
                  Lineas.Valor_Cuota := '0';
              except
               raise;
              end;
//Fin Cuota
              Lineas.Saldo_Capital := FormatCurr('#0',FieldByName('DEUDA').AsCurrency);
              Lineas.Saldo_Interes := '0';
              Lineas.Otros_Saldos  := '0';

              if FieldByName('VALOR_REAL').AsCurrency > 0 then
                Lineas.Valor_Garantia := CurrToStr(FieldByName('VALOR_REAL').AsCurrency)
              else
                Lineas.Valor_Garantia := '0';

              if not FieldByName('FECHA_AVALUO').IsNull then
                Lineas.Fecha_Avaluo := FieldByName('FECHA_AVALUO').AsString
              else
                Lineas.Fecha_Avaluo := '';
              Lineas.Provision_Capital := '0';
              Lineas.Provision_Interes := '0';
              Lineas.Contintengia_Interes := '0';
              Lineas.Valor_Cuotas_Extras := '';
              Lineas.Meses_Cuotas_Extras := '';
// Busco Fecha Ultimo Pago
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "col$extracto" where');
              IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_COLOCACION = :ID_COLOCACION and');
              IBQuery2.SQL.Add('TIPO_OPERACION = 1 and FECHA_EXTRACTO <= :FECHA_CORTE');
              IBQuery2.SQL.Add('Order by FECHA_EXTRACTO, HORA_EXTRACTO');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
              try
                IBQuery2.Open;
                IBQuery2.Last;
              except
                raise;
              end;
              Lineas.Fecha_Ultimo_Pago := FormatDateTime('dd/mm/yyyy',IBQuery2.FieldByName('FECHA_EXTRACTO').AsDateTime);
// Fin Ultimo pago
              if FieldByName('ID_GARANTIA').AsInteger = 1 then
                 Lineas.Clase_Garantia := '9'
              else
                 Lineas.Clase_Garantia := '1';

              Lineas.Destino_Credito := 'A';
              Lineas.Agencia := Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]);

              Cadena := Lineas.Tipo_Identificacion + ';' +
                          Lineas.Numero_Identificacion + ';' +
                          Lineas.Nombre + ';' +
                          Lineas.Clasificacion + ';' +
                          Lineas.Calificacion + ';' +
                          Lineas.Codigo_Contable + ';' +
                          Lineas.Reestructurado + ';' +
                          Lineas.Numero_Credito + ';' +
                          Lineas.Fecha_Desembolso + ';' +
                          Lineas.Fecha_Vencimiento + ';' +
                          Lineas.Morosidad + ';' +
                          Lineas.Tipo_Cuota + ';' +
                          Lineas.Cuotas_Pagas + ';' +
                          Lineas.Amortizacion + ';' +
                          Lineas.Modalidad + ';' +
                          Lineas.Tasa_Nominal + ';' +
                          Lineas.Tasa_Efectiva + ';' +
                          Lineas.Valor_Prestamo + ';' +
                          Lineas.Valor_Cuota + ';' +
                          Lineas.Saldo_Capital + ';' +
                          Lineas.Saldo_Interes + ';' +
                          Lineas.Otros_Saldos + ';' +
                          Lineas.Valor_Garantia + ';' +
                          Lineas.Fecha_Avaluo + ';' +
                          Lineas.Provision_Capital + ';' +
                          Lineas.Provision_Interes + ';' +
                          Lineas.Contintengia_Interes + ';' +
                          Lineas.Valor_Cuotas_Extras + ';' +
                          Lineas.Meses_Cuotas_Extras + ';' +
                          Lineas.Fecha_Ultimo_Pago + ';' +
                          Lineas.Clase_Garantia + ';' +
                          Lineas.Destino_Credito + ';' +
                          Lineas.Agencia;
              Writeln(Archivo,Cadena);
            Next;
           end; // del while
        end; // del with            }
     // Fin de Proceso Garantias Reales sin Credito
end;

end.
