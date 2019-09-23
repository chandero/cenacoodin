unit UnitBarridoAutomatico;

interface

uses Classes, IniFiles,SysUtils,QControls,DateUtils,StrUtils,Math,SqlExpr,DBXpress,
     UnitGlobalesAutomatico;


procedure Inicializar;
function BuscoSaldoAhorros(vtipoid:Integer;vNumeroId:string) : Currency;
procedure Procesar;
procedure Ejecutar;

var
   Agencia : Integer;
   FechaHoy:TDateTime;
   Error:Boolean;
   IDT:TTransactiondesc;
   IBQTabla1: TSQLTable;
   IBQTabla, IBQuery1, IBCuotas, IBGrupo3,
   IBBarrido, IBExtracto, IBComprobante:TSQLQuery;

   NumeroCuenta:Integer;
   DigitoCuenta:Integer;
   vTotalAhorros,vTotalLiquidacion:Currency;
   CodigoAhorros,CodigoCaja:string;
   abono_capital,
   abono_cxc,
   abono_servicios,
   abono_mora,
   abono_anticipado :Currency;
   ConsecBarridoInicial,ConsecBarridoFinal:string;
   VNoComprobante:string;

implementation

procedure Inicializar;
var
  MiIni:TIniFile;
begin
  MiIni := TIniFile.Create('./Barrido.ini');
  Agencia := MiIni.ReadInteger('DBSERVER','DBAgencia',1);
  DBName := MiIni.ReadString('DBSERVER','DBName','192.168.200.140:/var/db/fbird/database.fdb');
  DBAlias := MiIni.ReadString('DBSERVER','DBUser','BARRIDO');
  DBPassword := MiIni.ReadString('DBSERVER','DBPassword','barrido');
  FechaHoy := Date;

  IBDatabase1 := TSQLConnection.Create(nil);
  IBDatabase1.ConnectionName := 'IBLocal';
  IBDatabase1.DriverName := 'interbase';
  IBDatabase1.GetDriverFunc := 'getSQLDriverINTERBASE';
  IBDatabase1.KeepConnection := True;
  IBDatabase1.LibraryName := 'dbexpint.dll';
  IBDatabase1.LoadParamsOnConnect := False;
  IBDatabase1.LoginPrompt := False;
  IBDatabase1.Name := 'IBDatabase1';
  IBDatabase1.VendorLib := 'GDS32.DLL';
  IBDatabase1.Params.Clear;
  IBDatabase1.Params.Add('BlobSize=-1');
  IBDatabase1.Params.Add('CommitRetain=False');
  IBDatabase1.Params.Add('Database='+DBName);
  IBDatabase1.Params.Add('DriverName=Interbase');
  IBDatabase1.Params.Add('ErrorResourceFile=');
  IBDatabase1.Params.Add('LocaleCode=0000');
  IBDatabase1.Params.Add('Password='+DBPassword);
  IBDatabase1.Params.Add('RoleName=CARTERA');
  IBDatabase1.Params.Add('ServerCharSet=ISO8859_1');
  IBDatabase1.Params.Add('SQLDialect=3');
  IBDatabase1.Params.Add('Interbase TransIsolation=ReadCommited');
  IBDatabase1.Params.Add('User_Name='+DBAlias);
  IBDatabase1.Params.Add('WaitOnLocks=True');


  try
   IBDatabase1.Open;
  except
   raise;
   Exit;
  end;
  Writeln('Conectado a : ' + dbname);
  IBQTabla1 := TSQLTable.Create(nil);
  IBQTabla  := TSQLQuery.Create(nil);
  IBQuery1 := TSQLQuery.Create(nil);
  IBCuotas := TSQLQuery.Create(nil);
  IBGrupo3 := TSQLQuery.Create(nil);
  IBBarrido := TSQLQuery.Create(nil);
  IBExtracto := TSQLQuery.Create(nil);
  IBComprobante := TSQLQuery.Create(nil);

  IBQTabla.SQLConnection        := IBDatabase1;
  IBQTabla.ParamCheck           := True;
  IBQTabla1.SQLConnection       := IBDatabase1;
  IBQuery1.SQLConnection        := IBDatabase1;
  IBCuotas.SQLConnection        := IBDatabase1;
  IBGrupo3.SQLConnection        := IBDatabase1;
  IBBarrido.SQLConnection       := IBDatabase1;
  IBExtracto.SQLConnection      := IBDatabase1;
  IBComprobante.SQLConnection   := IBDatabase1;

  Error := False;

  Writeln('Procesando...');
  Procesar;
  if not Error then
  begin
   Writeln('Ejecutando...');
   Exit;
   //Ejecutar;
  end;
end;

procedure Procesar;
var Fecha:TDateTime;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Total:Integer;
    CuotasaLiquidar:Integer;
    SQLText:string;
begin
       IDT.TransactionID := 1+Random(100);
       IDT.IsolationLevel := xilREADCOMMITTED;
//       IBDatabase1.StartTransaction(IDT);
       Writeln('Borrando Temporal Anterior...');
       with IBQTabla do
       begin
         Close;
         SQL.Clear;
         SQL.Add('delete from');
         SQL.Add('"col$barridoCartera"');
         ExecSQL(False);
//         IBDatabase1.Commit(IDT);
         Close;
       end;

//        IBDatabase1.StartTransaction(IDT);

        Conteo := 0;
        Writeln('Calculando Total de Registros...');
        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0) and ');
          SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 1)');
          try
            IBQuery1.Open;
            Total := FieldByName('TOTAL').AsInteger;
            Writeln('Registros a Evaluar:' + IntToStr(Total));
          except
            Error := True;
            Exit;
          end;
        end;

        with IBQuery1 do begin
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
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0) and ');
          SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 1)');
          SQL.Add('Order by "col$colocacion".ID_ESTADO_COLOCACION DESC, "col$colocacion".FECHA_INTERES DESC');
          try
            Open;
            if RecordCount <= 0 then
            begin
               Close;
               Error := True;
               Exit;
            end
            else
            begin
              while not Eof do
               begin
                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                if Int(Fecha) <= Int(FechaHoy) then
                 begin
                   Conteo := Conteo + 1;
                   with IBCuotas do
                    begin
                      SQL.Clear;
                      SQL.Add('select count(CUOTA_NUMERO) as CUOTAS');
                      SQL.Add('from "col$tablaliquidacion"');
                      SQL.Add('where');
                      SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
                      SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
                      SQL.Add('PAGADA = 0 and');
                      SQL.Add('FECHA_A_PAGAR <= :FECHA');
                      ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                      ParamByName('FECHA').AsDate := FechaHoy;
                      Open;
                      CuotasaLiquidar := IBCuotas.FieldByName('CUOTAS').AsInteger;
                      IBCuotas.Close;
                    end;

                   if CuotasaLiquidar > 0 then begin
                    with IBQTabla do
                    begin
                      SQL.Clear;
                      SQL.Add('insert into "col$barridoCartera" values(');
                      SQL.Add(':"AGENCIA",');
                      SQL.Add(':"COLOCACION",');
                      SQL.Add(':"IDIDENTIFICACION",');
                      SQL.Add(':"IDPERSONA",');
                      SQL.Add(':"CUOTASALIQUIDAR",');
                      SQL.Add(':"CLASIFICACION",');
                      SQL.Add(':"CATEGORIA",');
                      SQL.Add(':"GARANTIA",');
                      SQL.Add(':"SALDOACTUAL",');
                      SQL.Add(':"ESTADO",');
                      SQL.Add(':"VALORCUOTA",');
                      SQL.Add(':"FECHAPAGOK",');
                      SQL.Add(':"FECHAPAGOI",');
                      SQL.Add(':"TIPOCUOTA",');
                      SQL.Add(':"IDINTERES",');
                      SQL.Add(':"TIPOINTERES",');
                      SQL.Add(':"VALORTASA",');
                      SQL.Add(':"VALORACTUALTASA",');
                      SQL.Add(':"VALORMORA",');
                      SQL.Add(':"PUNTOSADIC",');
                      SQL.Add(':"AMORTIZAK",');
                      SQL.Add(':"AMORTIZAI",');
                      SQL.Add(':"DIASPRORROGA");');
                      ParamByName('AGENCIA').AsInteger := IBQuery1.fieldbyname('ID_AGENCIA').AsInteger;
                      ParamByName('COLOCACION').AsString := IBQuery1.fieldbyname('ID_COLOCACION').AsString;
                      ParamByName('IDIDENTIFICACION').AsInteger := IBQuery1.fieldbyname('ID_IDENTIFICACION').AsInteger;
                      ParamByName('IDPERSONA').AsString := IBQuery1.fieldbyname('ID_PERSONA').AsString;
                      ParamByName('CUOTASALIQUIDAR').AsInteger := CuotasaLiquidar;
                      ParamByName('CLASIFICACION').AsInteger := IBQuery1.fieldbyname('ID_CLASIFICACION').AsInteger;
                      ParamByName('CATEGORIA').AsString := IBQuery1.fieldbyname('ID_CATEGORIA').AsString;
                      ParamByName('GARANTIA').AsInteger := IBQuery1.fieldbyname('ID_GARANTIA').AsInteger;
                      ParamByName('SALDOACTUAL').AsCurrency := IBQuery1.fieldbyname('SALDO').AsCurrency;
                      ParamByName('ESTADO').AsInteger := IBQuery1.fieldbyname('ID_ESTADO_COLOCACION').AsInteger;
                      ParamByName('VALORCUOTA').AsInteger := IBQuery1.fieldbyname('VALOR_CUOTA').AsInteger;
                      ParamByName('FECHAPAGOK').AsDate := IBQuery1.fieldbyname('FECHA_CAPITAL').AsDateTime;
                      ParamByName('FECHAPAGOI').AsDate := IBQuery1.fieldbyname('FECHA_INTERES').AsDateTime;
                      ParamByName('TIPOCUOTA').AsInteger := IBQuery1.fieldbyname('ID_TIPO_CUOTA').AsInteger;
                      ParamByName('IDINTERES').AsInteger := IBQuery1.fieldbyname('ID_INTERES').AsInteger;
                      ParamByName('TIPOINTERES').AsString := IBQuery1.fieldbyname('TIPO_INTERES').AsString;
                      ParamByName('VALORTASA').AsFloat := IBQuery1.fieldbyname('TASA_INTERES_CORRIENTE').AsFloat;
                      ParamByName('VALORACTUALTASA').AsFloat := IBQuery1.fieldbyname('VALOR_ACTUAL_TASA').AsFloat;
                      ParamByName('VALORMORA').AsFloat := IBQuery1.fieldbyname('TASA_INTERES_MORA').AsFloat;
                      ParamByName('PUNTOSADIC').AsFloat := IBQuery1.fieldbyname('PUNTOS_INTERES').AsFloat;
                      ParamByName('AMORTIZAK').AsInteger := IBQuery1.fieldbyname('AMORTIZA_CAPITAL').AsInteger;
                      ParamByName('AMORTIZAI').AsInteger := IBQuery1.fieldbyname('AMORTIZA_INTERES').AsInteger;
                      ParamByName('DIASPRORROGA').AsInteger := IBQuery1.fieldbyname('DIAS_PRORROGADOS').AsInteger;
                      ExecSQL;
                      Close;
                    end; // fin de with insert
                   end; // fin de if cuotasaLiquidar
                 end; //fin de if dias
                Next;
               end; //fin de while
//              IBDatabase1.Commit(IDT);
            end; // fin if recordcount
          except
            Close;
            Error := True;
            Exit;
           end;
        end;
//    IBDatabase1.StartTransaction(IDT);
    with IBGrupo3 do
     begin
       SQL.Clear;
       SQL.Add('select count(COLOCACION) as total from "col$barridoCartera"');
       Open;
       Writeln('Total a Ejecutar:'+IntToStr(FieldByName('TOTAL').AsInteger));
       if FieldByName('TOTAL').AsInteger > 0 then
          Error := False
       else
          Error := True;
       IBGrupo3.Close;
     end;
//     IBDatabase1.Commit(IDT);
end;

procedure Ejecutar;
var CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I,J,K,L:Integer;
    Clasificacion:Integer;
    Categoria:string;
    Garantia:Integer;
    SaldoActual:Currency;
    TipoCapital:string;
    TipoInteres:Integer;
    TipoCuota:Integer;
    FechaPagoK:TDateTime;
    FechaPagoI:TDateTime;
    Estado:Integer;
    ValorTasa:Double;
    ValorMora:Double;
    ValorCuota:Currency;
    PuntosAdic:Double;
    AmortizaK:Integer;
    AmortizaI:Integer;
    DiasProrroga:Integer;
    IdAgencia : Integer;
    Colocacion : string;
    CuotasPendientes : Integer;
    ConsecBarrido : String;
    vNoComprobanteBarrido : string;
    TotalDebitoRecibo : Currency;
    TotalCreditoRecibo : Currency;
    TotalDebito: Currency;
    TotalCredito : Currency;
    DescImpuesto : Currency;
    Conteo:Integer;
    Save_Cursor:TCursor;
    Total:Integer;
    ConteoConsec : Integer;
    Cuota : Integer;
    PrimerConsec:Boolean;
    ContadorLiq:Integer;
    IdIdentificacion:Integer;
    IdPersona:string;
begin
        PrimerConsec := False;
        ContadorLiq := 0;
        with IBBarrido do
         begin
//           IBDatabase1.StartTransaction(IDT);
//           TransactionLevel := IDT.TransactionID;
           SQL.Clear;
           SQL.Add('delete from "col$extractobarridotmp"');
           ExecSQL;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" where ID_CODIGOPUCBASICO = 1');
           Open;
           CodigoCaja := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION = 2');
           Open;
           CodigoAhorros := FieldByName('CODIGO_CONTABLE').AsString;
           Close;

//           IBDatabase1.Commit(IDT);
         end;

//        IBDatabase1.StartTransaction(IDT);

        with IBQuery1 do begin
//          TransactionLevel := IDT.TransactionID;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$barridoCartera"');
          Open;
          Total := FieldByName('TOTAL').AsInteger;
          Close;
        end;

         with IBQuery1 do
         begin
           Close;
           SQL.Clear;
           SQL.Add('Select * ');
           SQL.Add('from "col$barridoCartera" order by AGENCIA,COLOCACION');
           Open;


           while not Eof do
            begin
              IdIdentificacion := FieldByName('IDIDENTIFICACION').AsInteger;
              IdPersona := FieldByName('IDPERSONA').AsString;
              vTotalAhorros := BuscoSaldoAhorros(IdIdentificacion,IdPersona);
              IdAgencia := FieldByName('AGENCIA').AsInteger;
              Colocacion := FieldByName('COLOCACION').AsString;
              if Colocacion = '20040002518' then
                 WriteLn('Iniciar Verificacion');
              Clasificacion := FieldByName('CLASIFICACION').AsInteger;
              Categoria     := FieldByName('CATEGORIA').AsString;
              Garantia      := FieldByName('GARANTIA').AsInteger;
              SaldoActual   := FieldByName('SALDOACTUAL').AsCurrency;
              TipoInteres   := FieldByName('IDINTERES').AsInteger;
              TipoCuota     := FieldByName('TIPOCUOTA').AsInteger;
              ValorCuota    := FieldByName('VALORCUOTA').AsCurrency;
              if FieldByName('TIPOINTERES').AsString = 'F' then
               ValorTasa := FieldByName('VALORTASA').AsFloat
              else
               ValorTasa := FieldByName('VALORACTUALTASA').AsFloat;
              PuntosAdic := FieldByName('PUNTOSADIC').AsFloat;
              ValorMora     := (ValorTasa + PuntosAdic) + FieldByName('VALORMORA').AsFloat;
              AmortizaK     := FieldByName('AMORTIZAK').AsInteger;
              AmortizaI     := FieldByName('AMORTIZAI').AsInteger;
              DiasProrroga  := FieldByName('DIASPRORROGA').AsInteger;
              FechaPagoK    := FieldByName('FECHAPAGOK').AsDateTime;
              FechaPagoI    := FieldByName('FECHAPAGOI').AsDateTime;
              Estado        := FieldByName('ESTADO').AsInteger;
              CuotasPendientes := FieldByName('CUOTASALIQUIDAR').AsInteger;
              if  CuotasPendientes > 1 then
                  CuotasPendientes := 1;
              I := 1;
              while I <= CuotasPendientes do
               begin
                 Conteo := Conteo + 1;
                 I  := I + 1;
                 if FieldByName('TIPOCUOTA').AsInteger = 1 then
                    LiquidarCuotasFija(IdAgencia,Colocacion,1,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);
{                 else if FieldByName('TIPOCUOTA').AsInteger = 2 then
                    LiquidarCuotasVarAnticipada(IdAgencia,Colocacion,1,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                 else if FieldByName('TIPOCUOTA').AsInteger = 3 then
                    LiquidarCuotasVarVencida(IdAgencia,Colocacion,1,FechaHoy,
                    CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                    FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);
}
                    if CuotasLiq.Lista.Count <= 0 then Break;
                    J := CuotasLiq.Lista.Count - 1;
                    AF := CuotasLiq.Lista.Items[J];
                    vTotalLiquidacion := AF^.Debito;
                    AF^.CodigoPuc := CodigoAhorros;
                    Cuota := AF^.CuotaNumero;
//* inicio 4 x mil
                 DescImpuesto := SimpleRoundTo((vTotalLiquidacion/1000) * 4,0);
                 New(AF);
                 AF^.CuotaNumero := 0;
                 AF^.CodigoPuc   := '531520000000000000';
                 AF^.FechaInicial := FechaHoy;
                 AF^.FechaFinal   := FechaHoy;
                 AF^.Dias         := 0;
                 AF^.Tasa         := 0;
                 AF^.Debito       := DescImpuesto;
                 AF^.Credito      := 0;
                 AF^.EsCapital := False;
                 AF^.EsCausado := False;
                 AF^.EsCorriente := False;
                 AF^.EsVencido := False;
                 AF^.EsAnticipado := False;
                 AF^.EsDevuelto := False;
                 if (AF^.Debito <> 0) or
                    (AF^.Credito <> 0) then
                    CuotasLiq.Lista.Add(AF);

                 New(AF);
                 AF^.CuotaNumero := 0;
                 AF^.CodigoPuc   := '244205000000000000';
                 AF^.FechaInicial := FechaHoy;
                 AF^.FechaFinal   := FechaHoy;
                 AF^.Dias         := 0;
                 AF^.Tasa         := 0;
                 AF^.Debito       := 0;
                 AF^.Credito      := DescImpuesto;
                 AF^.EsCapital := False;
                 AF^.EsCausado := False;
                 AF^.EsCorriente := False;
                 AF^.EsVencido := False;
                 AF^.EsAnticipado := False;
                 AF^.EsDevuelto := False;
                 if (AF^.Debito <> 0) or
                    (AF^.Credito <> 0) then
                    CuotasLiq.Lista.Add(AF);
//* fin 4 x mil
                 if vTotalLiquidacion <= vTotalAhorros then
                  begin
                    ContadorLiq := ContadorLiq + 1;
                    abono_capital := 0;
                    abono_cxc := 0;
                    abono_servicios := 0;
                    abono_mora := 0;
                    abono_anticipado := 0;
                    //Genero el consecutivo
                    ConteoConsec := ObtenerConsecutivoBarrido;
                    if PrimerConsec = False then
                     begin
                       ConsecBarridoInicial := FormatCurr('00000000',ConteoConsec);
                       PrimerConsec := True;
                     end;
//                    ConteoConsec := ConteoConsec + 1;
                    ConsecBarrido := FormatCurr('00000000',ConteoConsec);
                    for K := 0 to CuotasLiq.Lista.Count - 1 do
                     begin
                       AF := CuotasLiq.Lista.Items[K];
                       if AF^.EsCapital then
                          abono_capital := abono_capital + AF^.Credito;
                       if AF^.EsCausado then
                          abono_cxc := abono_cxc + AF^.Credito;
                       if AF^.EsCorriente then
                          abono_servicios := abono_servicios + AF^.Credito;
                       if AF^.EsVencido then
                          abono_mora := abono_mora + AF^.Credito;
                       if AF^.EsAnticipado then
                          abono_anticipado := abono_anticipado + AF^.Credito;
                     end; //for K
                    TotalDebitoRecibo := 0;
                    TotalCreditoRecibo := 0;
                    for L := 0 to CuotasLiq.Lista.Count - 1 do
                     begin
                       AF := CuotasLiq.Lista.Items[L];
                       TotalDebitoRecibo := TotalDebitoRecibo + AF^.Debito;
                       TotalCreditoRecibo := TotalCreditoRecibo + AF^.Credito;
                     end; // for L
                    //**grabarextracto
                    with IBExtracto do
                     begin
                       IBExtracto.Close;
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
                       ParamByName('ID_AGENCIA').AsInteger := agencia;
                       ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(ConsecBarrido);
                       ParamByName('ID_COLOCACION').AsString := Colocacion;
                       ParamByName('FECHA_EXTRACTO').AsDate := FechaHoy;
                       ParamByName('HORA_EXTRACTO').AsTime := Time;
                       ParamByName('CUOTA_EXTRACTO').AsInteger := Cuota;
                       ParamByName('TIPO_OPERACION').AsInteger := 1;
                       ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := SaldoActual; //vSaldoActual;
                       ParamByName('ABONO_CAPITAL').AsCurrency := abono_capital;
                       ParamByName('ABONO_CXC').AsCurrency := abono_cxc;
                       ParamByName('ABONO_SERVICIOS').AsCurrency := abono_servicios;
                       ParamByName('ABONO_ANTICIPADO').AsCurrency := abono_anticipado;
                       ParamByName('ABONO_MORA').AsCurrency := abono_mora;
                       ParamByName('ABONO_SEGURO').AsCurrency := 0;
                       ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
                       ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
                       ParamByName('ABONO_OTROS').AsCurrency := 0;
                       ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasa;
                       ParamByName('ID_EMPLEADO').AsString := 'BARRIDO';
                       ParamByName('INTERES_PAGO_HASTA').AsDate := CuotasLiq.InteresesHasta;
                       ParamByName('CAPITAL_PAGO_HASTA').AsDate := CuotasLiq.CapitalHasta;
                       ParamByName('TIPO_ABONO').AsInteger  := BooleanoToInt(False);
                       ExecSQL;
                       IBExtracto.Close;
                       //fin  grabarextracto

                       //grabartablaliquidacion
                       sql.Clear;
                       sql.Add('update "col$tablaliquidacion" set');
                       sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
                       sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
                       sql.Add(' where ');
                       sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                       sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
                       sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
                       ParamByName('ID_AGENCIA').AsInteger := agencia;
                       ParamByName('ID_COLOCACION').AsString := Colocacion;
                       ParamByName('CUOTA_NUMERO').AsInteger := Cuota;
                       ParamByName('PAGADA').AsInteger := 1;
                       ParamByName('FECHA_PAGADA').AsDate := FechaHoy;
                       ExecSQL;
                       IBExtracto.Close;
                       //fin grabar tablaliquidacion

                       SQL.Clear;
                       SQL.Add('insert into "col$extractodet" values (');
                       SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
                       SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
                       SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
                       if  CuotasLiq.Lista.Count > 0 then
                       for L := 0 to CuotasLiq.Lista.Count - 1 do
                        begin
                          AF := CuotasLiq.Lista.Items[L];
                          ParamByName('ID_AGENCIA').AsInteger := agencia;
                          ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(ConsecBarrido);
                          ParamByName('ID_COLOCACION').AsString := colocacion;
                          ParamByName('FECHA_EXTRACTO').AsDate := FechaHoy;
                          ParamByName('HORA_EXTRACTO').AsTime := Time;
                          ParamByName('CODIGO_PUC').AsString := AF^.CodigoPuc;
                          ParamByName('FECHA_INICIAL').AsDate := AF^.FechaInicial;
                          ParamByName('FECHA_FINAL').AsDate := AF^.FechaFinal;
                          ParamByName('DIAS_APLICADOS').AsInteger := AF^.Dias;
                          ParamByName('TASA_LIQUIDACION').AsFloat := AF^.Tasa;
                          ParamByName('VALOR_DEBITO').AsCurrency := AF^.Debito;
                          ParamByName('VALOR_CREDITO').AsCurrency := AF^.Credito;
                          ExecSQL;
                          IBExtracto.Close;
                        end;     //fin for L dentro ibquery2


                       // alimento tabla para comprobante
                       SQL.Clear;
                       SQL.Add('insert into "col$extractobarridotmp" values (');
                       SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
                       SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
                       SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
                       if  CuotasLiq.Lista.Count > 0 then
                       for L := 0 to CuotasLiq.Lista.Count - 1 do
                        begin
                          AF := CuotasLiq.Lista.Items[L];
                          ParamByName('ID_AGENCIA').AsInteger := agencia;
                          ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(ConsecBarrido);
                          ParamByName('ID_COLOCACION').AsString := colocacion;
                          ParamByName('FECHA_EXTRACTO').AsDate := FechaHoy;
                          ParamByName('HORA_EXTRACTO').AsTime := Time;
                          ParamByName('CODIGO_PUC').AsString := AF^.CodigoPuc;
                          ParamByName('FECHA_INICIAL').AsDate := AF^.FechaInicial;
                          ParamByName('FECHA_FINAL').AsDate := AF^.FechaFinal;
                          ParamByName('DIAS_APLICADOS').AsInteger := AF^.Dias;
                          ParamByName('TASA_LIQUIDACION').AsFloat := AF^.Tasa;
                          ParamByName('VALOR_DEBITO').AsCurrency := AF^.Debito;
                          ParamByName('VALOR_CREDITO').AsCurrency := AF^.Credito;
                          ExecSQL;
                          IBExtracto.Close;
                        end;     //fin alimentar tabla de extracto para comprobante

                       sql.Clear;
                       sql.Add('update "col$colocacion" set ');
                       sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
                       sql.Add('"col$colocacion"."FECHA_CAPITAL" =:"FECHA_CAPITAL",');
                       sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
                       sql.Add(' where ');
                       sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                       sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
                       ParamByName('ID_AGENCIA').AsInteger := agencia;
                       ParamByName('ID_COLOCACION').AsString := colocacion;
                       ParamByName('ABONOS_CAPITAL').AsCurrency := abono_capital;
                       ParamByName('FECHA_CAPITAL').AsDate := CuotasLiq.CapitalHasta;
                       ParamByName('FECHA_INTERES').AsDate := CuotasLiq.InteresesHasta;
                       ExecSQL;

                       //**Actualizo extracto y saldos mes
                       IBExtracto.Close;
                       SQL.Clear;
                       SQL.Add('insert into "cap$extracto" values(');
                       SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
                       SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
                       SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
                       SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
                       ParamByName('ID_AGENCIA').AsInteger := Agencia;
                       ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
                       ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
                       ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
                       ParamByName('FECHA_MOVIMIENTO').AsDate := FechaHoy;
                       ParamByName('HORA_MOVIMIENTO').AsTime := Time;
                       if vTotalLiquidacion > 0 then
                        begin
                          ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 4;
                          ParamByName('DOCUMENTO_MOVIMIENTO').AsString := ConsecBarrido;
                          ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'DESCUENTO COLOCACION No.' + colocacion;
                          ParamByName('VALOR_DEBITO').AsCurrency := 0;
                          ParamByName('VALOR_CREDITO').AsCurrency := vTotalLiquidacion;
                          try
                           ExecSQL;
                             if RowsAffected < 1 then
                              begin
                                Error := True;
                                Exit;
                              end;
                          except
                           Error := True;
                           Exit;
                          end; // del try
                          IBExtracto.Close;
                        end; // fin if vtotalliquidacion interno
                     end; // fin with//***fin actualizo extracto
                    vTotalAhorros := vTotalAhorros - vTotalLiquidacion;
                    SaldoActual := SaldoActual - abono_capital;
                    VerificarCancelacionCredito(Agencia,Colocacion);
//                    IBDatabase1.Commit(IDT);
                  end
                 else
                  begin
                    with IBBarrido do
                     begin
                       IBBarrido.Close;
                       SQL.Clear;
                       SQL.Add('delete from "col$barridoCartera"');
                       SQL.Add('where AGENCIA =:"AGENCIA" and COLOCACION =:"COLOCACION"');
                       ParamByName('AGENCIA').AsInteger := IdAgencia;
                       ParamByName('COLOCACION').AsString := Colocacion;
                       ExecSQL;
                       IBBarrido.Close;
                     end;
                  end;
               end; // fin for cuotas pendientes
              IBQuery1.Next;
            end; // fin while not ibquery1.eof
            ConsecBarridoFinal := FormatCurr('00000000',ConteoConsec);
{            with IBConsecB do
             begin
               Close;
               SQL.Clear;
               SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
               SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 2');
               ParamByName('CONSECUTIVO').AsInteger := ConteoConsec;
               ExecQuery;
               Close;
             end;
}
//            IBDatabase1.Commit(IDT);
//            IBDatabase1.StartTransaction(IDT);
           //close;
          end; // fin with ibquery1 Select tabla barrido


        //**Busco Valores y Genero el comprobante
     if ContadorLiq > 0 then
      begin
        with IBQTabla do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('SUM("col$extractobarridotmp".VALOR_DEBITO) as TOTALDEBITO,');
           SQL.Add('SUM("col$extractobarridotmp".VALOR_CREDITO) as TOTALCREDITO');
           SQL.Add('from "col$extractobarridotmp"');
//           SQL.Add('where');
//           SQL.Add('("col$extractobarridotmp".ID_CBTE_COLOCACION >= :"ID1") and');
//           SQL.Add('("col$extractobarridotmp".ID_CBTE_COLOCACION <= :"ID2")');
//           ParamByName('ID1').AsInteger := StrToInt(ConsecBarridoInicial);
//           ParamByName('ID2').AsInteger := StrToInt(ConsecBarridoFinal);
           Open;
           TotalDebito := FieldByName('TOTALDEBITO').AsCurrency;
           TotalCredito := FieldByName('TOTALCREDITO').AsCurrency;
           Close;
         end;

        VNocomprobante := FormatCurr('00000000',ObtenerConsecutivo);

        with IBcomprobante do
         begin
           sql.Clear;
           sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
           sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
           sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
           sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
           sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
           sql.Add('"con$comprobante"."ANULACION", "con$comprobante"."ID_EMPLEADO") ');
           sql.Add('values (');
           sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
           sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
           sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
           ParamByName('ID_COMPROBANTE').AsString:= vNoComprobante;
           ParamByname('FECHADIA').AsDate := FechaHoy;
           ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
           ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
           ParamByName('DESCRIPCION').AsString := 'Descuento de Cartera por Barrido de Fecha ' + DateToStr(FechaHoy) + ' A las ' + FormatDateTime('T',Time);
           ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebito;
           ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCredito;
           ParamByName('ESTADO').AsString  := 'O';
           ParamByname('ANULACION').asstring := '';
           ParamByName('IMPRESO').AsInteger  := 1;
           ParamByName('ID_EMPLEADO').AsString := 'BARRIDO';
           ExecSQL;
           Close;
         end;

        with IBQTabla do
         begin
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('CODIGO_PUC, SUM(VALOR_DEBITO) AS DEBITO, SUM(VALOR_CREDITO) AS CREDITO');
           SQL.Add('from "col$extractobarridotmp"');
//           SQL.Add('where');
//           SQL.Add('("col$extractodet".ID_CBTE_COLOCACION >= :"ID1") and');
//           SQL.Add('("col$extractodet".ID_CBTE_COLOCACION <= :"ID2") and');
//           SQL.Add('("col$extractodet".FECHA_EXTRACTO = :"FECHA")');
           SQL.Add('group by CODIGO_PUC');
//           ParamByName('ID1').AsInteger := StrToInt(ConsecBarridoInicial);
  //         ParamByName('ID2').AsInteger := StrToInt(ConsecBarridoFinal);
    //       ParamByName('FECHA').AsDate := Now;
           Open;

           while not IBQTabla.Eof do
           begin
            with IBcomprobante do
             begin
              SQL.Clear;
              SQL.Add('insert into "con$auxiliar" values (');
              SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
              SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
              SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
              ParamByName('ID_COMPROBANTE').AsString := vNoComprobante;
              ParamByName('ID_AGENCIA').AsInteger:= Agencia;
              ParamByName('FECHA').AsDate := FechaHoy;
              ParamByName('CODIGO').AsString := IBQTabla.FieldByName('CODIGO_PUC').AsString;
              ParamByName('DEBITO').AsCurrency := IBQTabla.FieldByName('DEBITO').AsCurrency;
              ParamByName('CREDITO').AsCurrency := IBQTabla.FieldByName('CREDITO').AsCurrency;
              ParamByName('ID_CUENTA').AsInteger := 0;
              ParamByName('ID_COLOCACION').AsString := '';
              ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              ParamByName('ID_PERSONA').AsString := '';
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              ExecSQL;
             end;
            Next;
           end;

           with IBCuotas do
            begin
              Close;
              SQL.Clear;
              SQL.Add('insert into "col$controlbarrido" values');
              SQL.Add('(:FECHA,:HORA,:CONSECINI,:CONSECFIN,:ID_COMPROBANTE,:IMPRESO)');
              ParamByName('FECHA').AsDate := FechaHoy;
              ParamByName('HORA').AsTime := Time;
              ParamByName('CONSECINI').AsInteger := StrToInt(ConsecBarridoInicial);
              ParamByName('CONSECFIN').AsInteger := StrToInt(ConsecBarridoFinal);
              ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(vNoComprobante);
              ParamByName('IMPRESO').AsInteger := 0;
              ExecSQL;
              Close;
            end;

//          IBDatabase1.Commit(IDT);
          Error := False;
         end;
      end
     else
      begin
        Error := True;
      end; // Fin if conteoconsec > 1
end;

function BuscoSaldoAhorros(vtipoid:Integer;vNumeroId:string) : Currency;
var
 IBSaldo:TSQLQuery;
 IDT1:TTransactionDesc;
 SaldoAhorros:Currency;
begin
 try
  IBSaldo := TSQLQuery.Create(nil);
  IDT1.TransactionID := 5;
  IDT1.IsolationLevel := xilREADCOMMITTED;
//  IBDatabase1.StartTransaction(IDT1);
  IBSaldo.SQLConnection := IBDatabase1;
//  IBSaldo.TransactionLevel := 5;
  with IBSaldo do
   begin

     sql.Clear;
     Sql.Add('select * from P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
     ParamByName('ID_PERSONA').AsString := vNumeroId;
     Open;
     NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     DigitoCuenta := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;

     SQL.Clear;
     SQL.Add('Select * from SALDO_DISPONIBLE (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
     ParamByName('ANO').AsString := IntToStr(YearOf(FechaHoy));
     ParamByName('FECHA1').AsDate := EncodeDate(YearOf(FechaHoy),01,01);
     ParamByName('FECHA2').AsDate := EncodeDate(YearOf(FechaHoy),12,31);
     try
      Open;
      SaldoAhorros := FieldByName('SALDO_DISPONIBLE').AsCurrency;
     except
      raise;
      Error := True;
      Exit;
     end;
     Result := SaldoAhorros;
//     IBDatabase1.Commit(IDT1);
   end;
  except
   WriteLn('Error en Cuenta:'+vNumeroId);
  end;
end;



end.
