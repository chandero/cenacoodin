unit UnitReporteColocacionesFogacoop;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Math, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, IBCustomDataSet, IBQuery, JvProgressBar,
  JvSpecialProgress, Buttons, IBSQL, JvEdit, JvTypedEdit, pr_Common,
  pr_Classes, IBDatabase;

type
  TfrmReporteColocacionesFogacoop = class(TForm)
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
    IBQuery3: TIBQuery;
    IBAgencia: TIBQuery;
    IBSQL3: TIBSQL;
    IBQnovado: TIBQuery;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Cartera;
    function CalculoAportes(Agencia:Integer;id: Integer; pr: string): Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

type TColocacion = Record
     Tipo_Identificacion,
     Numero_Identificacion,
     Nombre,
     Calificacion,
     Clasificacion,
     Linea,
     Codigo_Contable,
     Reestructurado,
     Numero_Credito,
     Fecha_Desembolso,
     Fecha_Vencimiento,
     Dias,
     Tipo_Cuota,
     Cuotas_Pagas,
     Amortizacion,
     Modalidad,
     Tasa_Nominal,
     Tasa_Efectiva,
     Valor_Prestamo,
     Valor_Cuota,
     Saldo_Capital,
     Saldo_Interes,
     Otros_Saldos,
     Valor_Garantia,
     Fecha_Avaluo,
     Provision_Capital,
     Provision_Interes,
     Provision_Costas,
     Anticipados,
     Contintengia_Interes,
     Valor_Cuotas_Extras,
     Meses_Cuotas_Extras,
     Fecha_Ultimo_Pago,
     Clase_Garantia,
     Destino_Credito,
     Agencia,
     AmortizaK,
     CuotasMora,
     ClaseViv,
     Senalvis,
     TipoViv,
     SenalSub,
     EntRedes,
     MargenRed,
     SenalDes,
     Moneda,
     Plazo,
     Sexo,
     Ocupacion,
     Aprobador,
     Analista,
     Inversion,
     GarReal,
     DtoGarReal,
     Morosidad,
     DesGarantia,
     ValorAporteSocial,
     NumClasificacion, //Numeros de Créditos por Clasificación
     EstadoColocacion :string;
end;


var
  frmReporteColocacionesFogacoop: TfrmReporteColocacionesFogacoop;
  FechaCorte:TDate;
  _fFechaAporte :TDate;
  _fFechaInicial :TDate;

implementation

{$R *.dfm}

uses unitDmGeneral,unitGlobalesCol, UnitGlobales, UnitDmColocacion;

procedure TfrmReporteColocacionesFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteColocacionesFogacoop.CmdProcesarClick(Sender: TObject);
var
Dia:Integer;
NRuta:string;
begin
   Dia := DaysInAMonth(EdAno.Value,CBMeses.ItemIndex + 1);
   _fFechaAporte := EncodeDate(EdAno.Value,CBMeses.ItemIndex + 1,Dia);
   if Dia > 30 then Dia := 30;
     FechaCorte := EncodeDate(EdAno.Value,CBMeses.ItemIndex + 1,Dia);
   _fFechaInicial := EncodeDate(EdAno.Value,01,01);


   CmdProcesar.Enabled := False;
   Application.ProcessMessages;
   NRuta := DBPath1;   

   IBAgencia.Close;
   IBAgencia.Open;
   IBAgencia.Last;
   IBAgencia.First;

   if TipoProceso = 1 then
    begin
      IBSQL1.Database := dmGeneral.IBDatabase1;
      IBSQL1.Transaction := dmGeneral.IBTransaction1;

      IBSQL3.Database := dmGeneral.IBDatabase1;
      IBSQL3.Transaction := dmGeneral.IBTransaction1;

      IBQuery1.Database := dmGeneral.IBDatabase1;
      IBQuery1.Transaction := dmGeneral.IBTransaction1;

      IBQuery2.Database := dmGeneral.IBDatabase1;
      IBQuery2.Transaction := dmGeneral.IBTransaction1;

      IBQuery3.Database := dmGeneral.IBDatabase1;
      IBQuery3.Transaction := dmGeneral.IBTransaction1;

      IBGarReal.Database := dmGeneral.IBDatabase1;
      IBGarReal.Transaction := dmGeneral.IBTransaction1;

      IBSQL3.Database := dmGeneral.IBDatabase1;
      IBSQL3.Transaction := dmGeneral.IBTransaction1;

      lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';

      Cartera;
      IBAgencia.Close;
    end
   else
    begin
      while not IBAgencia.Eof do
       begin
         NRuta := dbpath1 + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + FormatCurr('00',MonthOf(FechaCorte)) + FormatCurr('0000',YearOf(FechaCorte)) + '/';
         lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';
         Database.DataBaseName := DBserver1 + ':' + NRuta + DBname;
         Database.Params.Values['lc_ctype'] := 'ISO8859_1';
         Database.Params.Values['User_Name'] := 'SYSDBA';
         Database.Params.Values['PassWord'] := 'masterkey';
         Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
         try
           Database.Connected := True;
         except
           raise;
         end;

         Cartera;
         IBAgencia.Next;
       end;  // fin while Agencias
    end;  //Fin if TipoProceso

    LblEstado.Caption := 'Proceso Culminado con Exito!';
end;

procedure TfrmReporteColocacionesFogacoop.Cartera;
var 
    Dia:Integer;
    Total:Integer;
    Lineas:TColocacion;
    Codigo, CodigoNiif:string;
    Cadena:string;
    Archivo:TextFile;
    TasaMax:Double;
    uvr : Currency;
    ValorVis:Currency;
    FechaVencimiento:TDate;
    ValorGReal:Currency;
    _cDesembolso :Currency;
    _sFechaAvaluo :string;
    _sValorAvaluo : Currency;
    _cCuentaOrden :Currency;
    _cGarantiaCol :Currency;
    _sMatricula :string;
    _sTipoGarantia :string;
    _cValorGarantia :Currency;
    _bGarAportes :Boolean;
    _sNumClasificacion :string;
const
  EmptyTColocacion: TColocacion = ();
begin
    if not DirectoryExists('C:/PlanosFinMes') then
      CreateDir('C:/PlanosFinMes');
    Cadena := IntToStr(YearOf(FechaCorte)) + IntToStr(MonthOf(FechaCorte)) + IntToStr(DayOf(FechaCorte));
    AssignFile(ARCHIVO,'C:/PlanosFinMes/CARTERA' + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + Cadena + '.TXT');
    Rewrite(Archivo);
    Cadena := 'TIPO ID'+ #9 +
              'IDENTIFICACION' + #9 +
              'NOMBRE' + #9 +
              'CLASIFICACION' + #9 +
              'LINEA' + #9 +
              'CALIFICACION' + #9 +
              'CODIGO' + #9 +
              'REESTRUCTURADO' + #9 +
              'COLOCACION' + #9 +
              'FDESEMBOLSO' + #9 +
              'FVENCIMIENTO' + #9 + //'' +
              'MOROSIDAD' + #9 +
              'TIPO CUOTA' + #9 +
              'CUOTAS PAGAS' + #9 +
              'AMORTIZACION' + #9 +
              'MODALIDAD' + #9 +
              'TASA NOMINAL' + #9 +
              'TASA EFECTIVA' + #9 + //'' +
              'PRESTAMO' + #9 +
              'CUOTA' + #9 +
              'CAPITAL' + #9 +
              'INTERES' + #9 +
              'COSTAS' + #9 +
              'GARANTIA DIF APORTES' + #9 +
              'FAVALUO' + #9 +
              'PROV CAPITAL' + #9 +
              'PROV INTERES' + #9 +
              'PROV COSTAS' + #9 +
              'ANTICIPADOS' + #9 +
              'CONTINGEN' + #9 + //''+
              'VALOR CUOTAS EX' + #9 +
              'MESES CUOTAS EX' + #9 +
              'FULTIMO PAGO' + #9 +
              'CLASE GARANTIA' + #9 +
              'DESTINO' + #9 +
              'AGENCIA' + #9 +
              'AMORTIZAK' + #9 +
              'CUOTASMORA' + #9 +
              'CLASEVIV' + #9 +
              'SENALVIS' + #9 +
              'TIPOVIV' + #9 +
              'SENALSUB' + #9 +
              'ENTREDES' + #9 +
              'MARGENRED' + #9 +
              'SENALDES' + #9 +
              'MONEDA' + #9 +
              'PLAZO' + #9 +
              'SEXO' + #9 +
              'OCUPACION' + #9 +
              'APROBADOR' + #9 +
              'ANALISTA' + #9 +
              'INVERSION' + #9 +
              'GAR REAL' + #9 +
              'DTO GAR REAL' + #9 +
              'MORA' + #9 +
              'DESGARANTIA' + #9 +
              'VALOR APORTES' + #9 +
              'CREDCLASIFICACION' + #9 +
              'ESTADO';

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
     Transaction.StartTransaction;
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
     SQL.Add('  "col$colocacion".ID_LINEA,');
     SQL.Add('  "col$causaciondiaria".ID_GARANTIA,');
     SQL.Add('  "col$causaciondiaria".ID_EDAD_ACT,');
     SQL.Add('  "col$causaciondiaria".ID_ARRASTRE,');
     SQL.Add('  "col$causaciondiaria".ID_IDENTIFICACION,');
     SQL.Add('  "col$causaciondiaria".ID_PERSONA,');
     SQL.Add('  "col$causaciondiaria".FECHA_DESEMBOLSO,');
     SQL.Add('  "col$causaciondiaria".VALOR,');
     SQL.Add('  "col$causaciondiaria".DEUDA,');
     SQL.Add('  "col$colocacion".PLAZO_COLOCACION,');
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
     SQL.Add('  "col$causaciondiaria".VALOR_GARANTIA,');
     SQL.Add('  "col$causaciondiaria".GARANTIA_DESCONTADA,');
     SQL.Add('  "col$causaciondiaria".MOROSIDAD,');
     SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
     SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
     SQL.Add('  "gen$persona".NOMBRE,');
     SQL.Add('  "gen$persona".SEXO, "gen$persona".ID_CIIU');
     SQL.Add('FROM');
     SQL.Add('  "col$causaciondiaria"');
     SQL.Add('  LEFT JOIN "gen$persona" ON ("col$causaciondiaria".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$causaciondiaria".ID_PERSONA = "gen$persona".ID_PERSONA)');
     SQL.Add('  INNER JOIN "col$colocacion" ON ("col$causaciondiaria".ID_AGENCIA = "col$colocacion".ID_AGENCIA AND "col$causaciondiaria".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
     SQL.Add('where');
     SQL.Add('"col$causaciondiaria".FECHA_CORTE = :FECHA_CORTE AND "col$causaciondiaria".DEUDA > 0');
     //SQL.Add('AND "col$causaciondiaria".ID_COLOCACION = 20110000492');
     SQL.Add('Order by "col$causaciondiaria".ID_AGENCIA, "col$causaciondiaria".ID_COLOCACION');
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
              _bGarAportes := False;
              Lineas := EmptyTColocacion;
              case FieldByName('ID_IDENTIFICACION').AsInteger of
                3: Lineas.Tipo_Identificacion := 'C';
                4: Lineas.Tipo_Identificacion := 'N';
                1: Lineas.Tipo_Identificacion := 'R';
                2: Lineas.Tipo_Identificacion := 'I'
                else Lineas.Tipo_Identificacion := 'O';
              end;

              if Lineas.Tipo_Identificacion = 'N' then
                 Lineas.Numero_Identificacion := MidStr(FieldByName('ID_PERSONA').AsString,1,3) + '-' +
                                       MidStr(FieldByName('ID_PERSONA').AsString,4,3) + '-' +
                                       MidStr(FieldByName('ID_PERSONA').AsString,7,3) + '-' +
                                       MidStr(FieldByName('ID_PERSONA').AsString,10,1)
              else
                Lineas.Numero_Identificacion := FieldByName('ID_PERSONA').AsString;

              Lineas.Nombre := Trim(FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
                               Trim(FieldByName('SEGUNDO_APELLIDO').AsString) + ' ' +
                               Trim(FieldByName('NOMBRE').AsString);
              Lineas.Sexo := FieldByName('SEXO').AsString;
              Lineas.Ocupacion := FieldByName('ID_CIIU').AsString;
              Lineas.Calificacion := FieldByName('ID_ARRASTRE').AsString;
              Lineas.Clasificacion := FieldByName('ID_CLASIFICACION').AsString;
              Lineas.Linea := FieldByName('ID_LINEA').AsString;
// Busco Codigo Contable
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select COD_CAPITAL_CP from COL$CODIGOSPUC where');
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
// Busco Estado del Crédito

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('SELECT');
              IBQuery2.SQL.Add('  "col$estado".DESCRIPCION_ESTADO_COLOCACION');
              IBQuery2.SQL.Add('FROM');
              IBQuery2.SQL.Add('  "col$colocacion"');
              IBQuery2.SQL.Add('  INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
              IBQuery2.SQL.Add('WHERE');
              IBQuery2.SQL.Add('  "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                   Lineas.EstadoColocacion := IBQuery2.FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
              except
                Transaction.Rollback;
                raise;
              end;

// Fin Estado del credito
              Lineas.Reestructurado := '4';
              IBQnovado.Database := Database;
              IBQnovado.Transaction := Transaction;
              IBQnovado.Close;
              IBQnovado.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQnovado.Open;
              if (IBQnovado.RecordCount > 0) then
              begin
                if (IBQnovado.FieldByName('CANTIDAD').AsInteger > 0) then
                begin
                    Lineas.Reestructurado := '3';
                end;
              end;
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

{              if FechaCorte > FechaVencimiento then
                Dia := DaysBetween(FechaCorte,FechaVencimiento); }

              Lineas.Dias := IntToStr(Dia);
              Lineas.Morosidad := IntToStr(FieldByName('MOROSIDAD').AsInteger);
              if (StrToInt(Lineas.Morosidad) < 30) then Lineas.Morosidad := '0';
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


              if (FieldByName('ID_INTERES').AsInteger = 0) then
               begin
                 TasaMax := BuscoTasaEfectivaMaxima1(IBQuery3,FechaCorte,FieldByName('ID_CLASIFICACION').AsInteger,'A');
                 if (FieldByName('TASA_INTERES_CORRIENTE').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat) < TasaMax then
                    TasaMax := (FieldByName('TASA_INTERES_CORRIENTE').AsFloat + FieldByName('PUNTOS_INTERES').AsFloat);
               end
              else if (FieldByName('ID_INTERES').AsInteger = 1)  then
               begin
                 TasaMax := BuscoTasaEfectivaMaximaDtfNueva(IBQuery3,FieldByName('FECHA_INTERES').AsDateTime);
               end
              else
               begin
                 TasaMax := BuscoTasaEfectivaMaximaIPCNueva(IBQuery3);
               end;

              if FieldByName('ID_CLASIFICACION').AsInteger = 3 then begin
                TasaMax := BuscoTasaEfectivaUvrNueva(IBQuery3,FieldByName('FECHA_INTERES').AsDateTime);
                 if (FieldByName('TASA_INTERES_CORRIENTE').AsFloat) < TasaMax then
                    TasaMax := FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
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
              {
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

              if (not IBGarReal.FieldByName('FECHA_AVALUO').IsNull) or (DateToStr(IBGarReal.FieldByName('FECHA_AVALUO').AsDate) <> '1899/12/30') then
                Lineas.Fecha_Avaluo := IBGarReal.FieldByName('FECHA_AVALUO').AsString
              else
                Lineas.Fecha_Avaluo := '';
              //Fin Garantía Real }
              // Nuevo proceso Garantia Real
              if FieldByName('ID_GARANTIA').AsInteger = 2 then //validación para Créditos no Admisibles
              begin
                Lineas.Valor_Garantia := '0';
                Lineas.Fecha_Avaluo := '';
                Lineas.DesGarantia := 'NO ADMISIBLE';
              end
              else
              begin
                IBGarReal.SQL.Clear;
                IBGarReal.Close;
                IBGarReal.SQL.Add('SELECT');
                IBGarReal.SQL.Add('"col$colocacion".ID_LINEA,');
                IBGarReal.SQL.Add('"col$colocacion".VALOR_DESEMBOLSO');
                IBGarReal.SQL.Add('FROM');
                IBGarReal.SQL.Add('"col$colocacion"');
                IBGarReal.SQL.Add('WHERE');
                IBGarReal.SQL.Add('"col$colocacion".ID_COLOCACION = :ID_COLOCACION');
                IBGarReal.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                IBGarReal.ExecQuery;
                _cDesembolso := IBGarReal.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                if IBGarReal.FieldByName('ID_LINEA').AsInteger = 8 then //Validación para la linea aportes
                begin     //Se debe colocar el saldo real de aportes a la fecha de corte
                  Lineas.Valor_Garantia := '0';
                  Lineas.Fecha_Avaluo := '';
                  Lineas.DesGarantia := 'ADMISIBLE APORTES SOCIALES';
                  //Lineas.ValorAporteSocial := FormatCurr('#0',calculoaportes(FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_IDENTIFICACION').AsInteger,FieldByName('ID_PERSONA').AsString));
                  Lineas.Clase_Garantia := '4';
                  _bGarAportes := True;
                end
                else
                begin     //HACER UN WHILE PARA EVALUAR CADA GARANTIA, SE COLOCA LA ULTIMA FECHA DE AVALUO
                //Buscar la ultima fecha de avaluo
                //Lineas.ValorAporteSocial := FormatCurr('#0',calculoaportes(FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_IDENTIFICACION').AsInteger,FieldByName('ID_PERSONA').AsString));
                //Lineas.ValorAporteSocial := '0';
                _cGarantiaCol := 0;
                IBquery2.SQL.Clear;
                IBquery2.Close;
                IBquery2.SQL.Add('SELECT');
                IBquery2.SQL.Add('*');
                IBquery2.SQL.Add('FROM');
                IBquery2.SQL.Add('"col$garantiacol"');
                IBquery2.SQL.Add('INNER JOIN "col$datogarantia" ON ("col$garantiacol".MATRICULA = "col$datogarantia".MATRICULA)');
                IBquery2.SQL.Add('WHERE');
                IBquery2.SQL.Add('"col$garantiacol".ID_COLOCACION = :ID_COLOCACION');
                IBQuery2.SQL.Add('order by FECHA_AVALUO');
                IBquery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                IBquery2.Open;
                while not IBQuery2.Eof do
                begin
                  try
                    _sFechaAvaluo := IBQuery2.FieldByName('FECHA_AVALUO').AsString;
                    _sValorAvaluo := IBQuery2.FieldByName('AVALUO').AsCurrency;
                  Except
                    _sFechaAvaluo := '';
                  end;
                  _cCuentaOrden := IBQuery2.FieldByName('CUENTAS_DE_ORDEN').AsCurrency;
                  _sMatricula := IBQuery2.FieldByName('MATRICULA').AsString;
                  _sTipoGarantia := IBQuery2.FieldByName('TIPO_VEHICULO').AsString;
                  //ejecutar proceso se extrae el valor total de las colocaciones de la matricula
                  IBGarReal.Close;
                  IBGarReal.SQL.Clear;
                  IBGarReal.SQL.Add('SELECT');
                  IBGarReal.SQL.Add('SUM("col$colocacion".VALOR_DESEMBOLSO) AS DESEMBOLSO');
                  IBGarReal.SQL.Add('FROM');
                  IBGarReal.SQL.Add('"col$garantiacol"');
                  IBGarReal.SQL.Add('INNER JOIN "col$colocacion" ON ("col$garantiacol".ID_AGENCIA = "col$colocacion".ID_AGENCIA)');
                  IBGarReal.SQL.Add('AND ("col$garantiacol".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
                  IBGarReal.SQL.Add('WHERE');
                  //IBGarReal.SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION IN (0,1,2,7) AND');
                  IBGarReal.SQL.Add('"col$garantiacol".MATRICULA = :MATRICULA');
                  IBGarReal.ParamByName('MATRICULA').AsString := _sMatricula;
                  IBGarReal.ExecQuery;
                  try
                    _cGarantiaCol := _cGarantiaCol + SimpleRoundTo((_cDesembolso * (_cCuentaOrden / IBGarReal.FieldByName('DESEMBOLSO').AsCurrency)),0);
                  except
                  begin
                     ShowMessage(FieldByName('ID_COLOCACION').AsString);
                    _cGarantiaCol := 0;
                  end;
                  end;
                  IBQuery2.Next;
                end;
                // VALOR DE APORTES, LO MODIFICO PARA PRUEBAS
                //Lineas.ValorAporteSocial := CurrToStr(FieldByName('APORTES').AsCurrency);

                Lineas.Fecha_Avaluo := _sFechaAvaluo;
                if Trim(_sTipoGarantia) <> '' then
                   Lineas.DesGarantia := 'ADMISIBLE NO HIPOTECARIA'
                else
                   Lineas.DesGarantia := 'ADMISIBLE HIPOTECARIA';
                Lineas.Valor_Garantia := CurrToStr(_cGarantiaCol);
                end;
              end;

              // Fin Nuevo proceso Garantia real

              IBGarReal.Close;
              Lineas.Provision_Capital := FormatCurr('#0',FieldByName('PCAPITAL').AsCurrency);
              Lineas.Provision_Interes := FormatCurr('#0',FieldByName('PINTERES').AsCurrency);
              Lineas.Provision_Costas := FormatCurr('#0',FieldByName('PCOSTAS').AsCurrency);
              Lineas.Anticipados := FormatCurr('#0',FieldByName('ANTICIPADOS').AsCurrency);
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
//Validación tipo de Garantia
              if _bGarAportes = False then
              begin
                if FieldByName('ID_GARANTIA').AsInteger = 1 then
                   Lineas.Clase_Garantia := '2'
                else
                   Lineas.Clase_Garantia := '1';
              end;

              Lineas.Destino_Credito := 'A';
              Lineas.Agencia := '2' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]);
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
                   Lineas.CuotasMora := CurrToStr(FieldByName('DEUDA').AsCurrency);
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
                 Lineas.Plazo := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
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
                 Lineas.Plazo := IntToStr(FieldByName('PLAZO_COLOCACION').AsInteger);
               end;

// Busco Informacion Aprobacion
              //Busco Información Ente Aprobación
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('SELECT');
              IBQuery2.SQL.Add('  "col$inversion".DESCRIPCION_INVERSION,');
              IBQuery2.SQL.Add('  "col$enteaprobador".DESCRIPCION_ENTE_APROBADOR');
              IBQuery2.SQL.Add('FROM');
              IBQuery2.SQL.Add('  "col$colocacion"');
              IBQuery2.SQL.Add('  INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION)');
              IBQuery2.SQL.Add('  INNER JOIN "col$enteaprobador" ON ("col$colocacion".ID_ENTE_APROBADOR = "col$enteaprobador".ID_ENTE_APROBADOR)');
              IBQuery2.SQL.Add('WHERE');
              IBQuery2.SQL.Add('  "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.Open;
              Lineas.Aprobador := Trim(IBQuery2.FieldByName('DESCRIPCION_ENTE_APROBADOR').AsString);
              Lineas.Inversion := Trim(IBQuery2.FieldByName('DESCRIPCION_INVERSION').AsString);
              //Busco Información del Analista
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('SELECT');
              IBQuery2.SQL.Add('  "gen$empleado".NOMBRE,');
              IBQuery2.SQL.Add('  "gen$empleado".SEGUNDO_APELLIDO,');
              IBQuery2.SQL.Add('  "gen$empleado".PRIMER_APELLIDO');
              IBQuery2.SQL.Add('FROM');
              IBQuery2.SQL.Add('  "col$desembolsoparcial"');
              IBQuery2.SQL.Add('  INNER JOIN "col$solicitud" ON ("col$desembolsoparcial".ID_SOLICITUD = "col$solicitud".ID_SOLICITUD)');
              IBQuery2.SQL.Add('  INNER JOIN "gen$empleado" ON ("col$solicitud".ID_ANALISIS = "gen$empleado".ID_EMPLEADO)');
              IBQuery2.SQL.Add('WHERE');
              IBQuery2.SQL.Add('  "col$desembolsoparcial".ID_COLOCACION = :ID_COLOCACION');
              IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
              IBQuery2.Open;
              if IBQuery2.RecordCount > 0 then
                   Lineas.Analista := Trim(IBQuery2.FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
                                      Trim(IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString) + ' ' +
                                      Trim(IBQuery2.FieldByName('NOMBRE').AsString)
              else
                   Lineas.Analista := '';
              if StrLen(PChar(Lineas.Analista)) <= 5 then// Burcar Dato en tabla Adicional
              begin
                  IBQuery2.Close;
                  IBQuery2.SQL.Clear;
                  IBQuery2.SQL.Add(' SELECT "gen$empleado".PRIMER_APELLIDO, "gen$empleado".SEGUNDO_APELLIDO,"gen$empleado".NOMBRE FROM TRAS$COLOCACION');
                  IBQuery2.SQL.Add(' INNER JOIN "gen$empleado" ON (TRAS$COLOCACION.ID_ANALISIS = "gen$empleado".ID_EMPLEADO)');
                  IBQuery2.SQL.Add(' WHERE TRAS$COLOCACION.ID_COLOCACION = :ID_COLOCACION');
                  IBQuery2.ParamByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                  IBQuery2.Open;
                  Lineas.Analista := Trim(IBQuery2.FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
                                      Trim(IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString) + ' ' +
                                      Trim(IBQuery2.FieldByName('NOMBRE').AsString);
              end;
// Fin Informacion Aprobacion
//Infomación número de Creditos por clasificacion
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('SELECT COUNT(0) as CONTADOR');
              IBQuery2.SQL.Add('FROM "col$colocacion"');
              IBQuery2.SQL.Add('WHERE ID_CLASIFICACION = :CLASIFICACION');
              IBQuery2.SQL.Add('AND ID_PERSONA = :IDPERSONA');
              IBQuery2.SQL.Add('AND ID_IDENTIFICACION = :IDIDENTIFICACION');
              IBQuery2.SQL.Add('AND ID_ESTADO_COLOCACION <> 5');
              IBQuery2.ParamByName('IDPERSONA').AsString := FieldByName('ID_PERSONA').AsString;
              IBQuery2.ParamByName('IDIDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
              IBQuery2.ParamByName('CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
              IBQuery2.Open;
              if IBQuery2.FieldByName('CONTADOR').AsInteger > 0 then
                 _sNumClasificacion := IBQuery2.FieldByName('CONTADOR').AsString
              else
                 _sNumClasificacion := '0';
              Lineas.NumClasificacion := _sNumClasificacion;
// Valor Aportes
              Lineas.ValorAporteSocial := FormatCurr('#0',CalculoAportes(FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_IDENTIFICACION').AsInteger,FieldByName('ID_PERSONA').AsString));

//Fin Infomación número de Creditos por clasificacion

              Lineas.GarReal := CurrToStr(FieldByName('VALOR_GARANTIA').AsCurrency);
              Lineas.DtoGarReal := CurrToStr(FieldByName('GARANTIA_DESCONTADA').AsCurrency);

              Cadena := Lineas.Tipo_Identificacion + #9 +
                          Lineas.Numero_Identificacion + #9 +
                          Lineas.Nombre + #9 +
                          Lineas.Clasificacion + #9 +
                          Lineas.Linea + #9 +                          
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
                          Lineas.Provision_Costas + #9 +
                          Lineas.Anticipados + #9 +
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
                          Lineas.Moneda + #9 +
                          Lineas.Plazo + #9 +
                          Lineas.Sexo + #9 +
                          Lineas.Ocupacion + #9 +
                          Lineas.Aprobador + #9 +
                          Lineas.Analista + #9 +
                          Lineas.Inversion + #9 +
                          Lineas.GarReal + #9 +
                          Lineas.DtoGarReal + #9 +
                          Lineas.Morosidad + #9 +
                          Lineas.DesGarantia + #9 +
                          Lineas.ValorAporteSocial+ #9 +
                          Lineas.NumClasificacion + #9 +
                          Lineas.EstadoColocacion;
              Writeln(Archivo,Cadena);
            Next;
           end; // del while
        end; // del with
    CloseFile(Archivo);
    Database.Close;
end;

procedure TfrmReporteColocacionesFogacoop.FormShow(Sender: TObject);
begin
        EdAno.Value := YearOf(Date);
        CBMeses.ItemIndex := MonthOf(Date);
end;

function TfrmReporteColocacionesFogacoop.CalculoAportes(Agencia:Integer;id: Integer; pr: string): Currency;
var
NumeroCuenta,DigitoCuenta:Integer;
Saldo:Currency;
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
               parambyname('ANO').AsInteger := EdAno.Value;
               Parambyname('FECHA1').AsDate := _fFechaInicial;
               ParamByName('FECHA2').AsDate := _fFechaAporte;
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


end.
