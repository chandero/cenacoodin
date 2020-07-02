unit UnitProcesarCentrales;

interface
                                                   
uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBSQL, StrUtils, DBClient, JvLabel, JvBlinkingLabel,
  Provider;

type
  TfrmProcesarCentrales = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    EdFechaCorte: TDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    ChkActiva: TCheckBox;
    GroupBox2: TGroupBox;
    Bar: TProgressBar;
    CmdGenerar: TBitBtn;
    CmdEnviar: TBitBtn;
    CmdVer: TBitBtn;
    CmdCerrar: TBitBtn;
    IBSNoCredito: TIBSQL;
    IBSClientes: TIBSQL;
    IBSCuotas: TIBSQL;
    IBQuery2: TIBQuery;
    Ed1: TEdit;
    OpenDialog1: TOpenDialog;
    DataActual: TClientDataSet;
    Ed2: TEdit;
    ChkSaldada: TCheckBox;
    IBTmp: TIBQuery;
    IBSReporteAnt: TIBSQL;
    ChkCastigada: TCheckBox;
    IBQuery3: TIBQuery;
    ChkInsertarTabla: TCheckBox;
    LbOficina: TJvBlinkingLabel;
    Database: TIBDatabase;
    Transaction: TIBTransaction;
    DPActual: TDataSetProvider;
    IBActual: TIBQuery;
    IBAgencia: TIBQuery;
    Transaction1: TIBTransaction;
    Label2: TLabel;
    lblColocacion: TLabel;
    ClienteData: TClientDataSet;
    DataProvider: TDataSetProvider;
    IBData: TIBQuery;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGenerarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure EdFechaCorteExit(Sender: TObject);
    procedure DataActualBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure DataActualAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    procedure ProcesarObligaciones;
    procedure ProcesarObligacionesCerradas;
    function Novedad(IDAgencia: Integer; IdColocacion: string;Dias:Integer): Integer;
    function Adjetivo(IdAgencia: Integer; IdColocacion: string): string;
    procedure InsertarTabla;
    procedure DatosOficina;
    { Private declarations }
  public
    { Public declarations }
  end;

type Registro = Record
    Numero:string; // * 18
    Identificacion:string; // * 11
    Nombre:string; // * 45
    NombreC:string; // *60
    FNacim:string; // * 06
    FApert:string; // * 06
    FVenci:string; // * 06
    VCuota:string; // * 10
    Noveda:string; // * 02
    Adjeti:string; // * 02
    TpIden:string; // * 01
    ValIni:string; // * 10
    ValDeu:string; // * 10
    ValMor:string; // * 10
    ValDis:string; // * 10
    TpMone:string; // * 01
    TpObli:string; // * 01
    TpGara:string; // * 01
    Califi:string; // * 01
    CResid:string; // * 15
    DResid:string; // * 30
    TResid:string; // * 10
    CLabor:string; // * 15
    TLabor:string; // * 10
    CCorre:string; // * 15
    DCorre:string; // * 30
    Ciiu  :string; // * 06
    TCuota:string; // * 03
    CCance:string; // * 03
    CeMora:string; // * 03
    FUPago:string; // * 06
    Oficin:string; // * 15
    CRadic:string; // * 15 ciudad radicación
    FoPago:string; // * 01 forma de pago
    PePago:string; // * 01 periodo de pago
    EdMora:string; // * 03
    FActua:string; // * 08 Fecha de Corte
    Reclam:string; // * 01
    Respon:string; // * 02  00 para deudor, 01 para codeudor
    Estrac:string; // * 01  Estrato Social
    Rellen:string; // * 14  en ceros
    Linea:string; // 1
    FDes:string; // 8
    FVen:string; // 8
    TpIdCi:string; // 2
    DiasMora:string; //4
    FechaExig:string;
    CodMunicipio:string // 8
end;

var
  frmProcesarCentrales: TfrmProcesarCentrales;
  PlanoReporte:TStringList;
  SumaNovedad:Integer;
  SumaRegistros:Integer;
  PlanoErrores:TStringList;
  MesCorteAct:string;
  MesCorteAnt:string;
  Mes,Ano : Integer;
  MesAnt,AnoAnt : string;
  MesAct,AnoAct : string;
  FechaAnterior : TDate;
  Dia:Integer;

  cadena:string;
  LineaC:Registro;
  ColocacionNew:string;
  ConverColocacion:Int64;
  Nombre:string;
  NombreC,Apel1C,Apel2C:string;
  FechaNacimiento:string;
  FechaExigibilidad:TDate;
  FechaPrescripcion:TDate;
  FechaPagada:TDate;
  FechaLimitePago:TDate;
  PeriocidadPago:Integer;
  CuotasPagadas:Integer;
  CuotasTotal:Integer;
  CuotasMora:Integer;
  ValorMora,ValorCuota:Currency;
  FechaVencimiento:TDate;
  FechaDesembolso:TDate;
  FechaCorte:tdate;

  i,j: Integer;
  Entero: Integer;
  S1,S2 :TStringList;
  ColocacionErr : string;
  DescAgencia:string;
  SentenciaTotal,Sentencia:string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobalesCol,UnitDmcolocacion, UnitMuestroArchivoData, UnitGlobales;

procedure TfrmProcesarCentrales.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmProcesarCentrales.ProcesarObligaciones;  //Procesar las Colocaciones Causadas
var
 PersonasCargo:Integer;
 Codigo:string;
 LCodigo:Integer;
 IBQuery1 :TIBQuery;
 IBSQL1,IBPersona,IBSCodeudores:TIBSQL;
 IBT1,IBT2:TIBTransaction;
 Longitud:Integer;
begin
        if Transaction.InTransaction then
          Transaction.Rollback;
        Transaction.StartTransaction;


        IBQuery1 := TIBQuery.Create(nil);
        IBQuery1.Transaction  := Transaction;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add(SentenciaTotal);
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información con esa fecha de corte',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            Bar.Min := 0;
            Bar.Max := FieldByName('CONTEO').AsInteger;
            Bar.Position := 0;
           except
              Transaction.Rollback;
              raise;
              Exit;
           end;
           FreeAndNil(IBQuery1);
        end;

        IBQuery1 := TIBQuery.Create(nil);
        IBQuery1.Transaction  := Transaction;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add(Sentencia);
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           DataActual.Open;
           DataActual.EmptyDataSet;
           IBActual.Open;
           FechaPagada := 0;

           while not eof do begin
             Bar.Position := RecNo;
             Application.ProcessMessages;
             // Proceso informacion Clientes
             ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
             lblColocacion.Caption := ColocacionNew;
             ConverColocacion := StrToInt64(ColocacionNew);
             ColocacionNew := Format('%.18d',[ConverColocacion]);
             ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);


             DataActual.Insert;
             DataActual.FieldByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
             DataActual.FieldByName('ID_COLOCACION').AsString := ColocacionNew;
             DataActual.FieldByName('TIPO_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
             if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger = 6) and (StrToIntDef(LeftStr(IBQuery1.FieldByName('ID_PERSONA').AsString,1),-1) = -1) then
              begin
                Longitud := Length(IBQuery1.FieldByName('ID_PERSONA').AsString);
                DataActual.FieldByName('ID_PERSONA').AsString := MidStr(IBQuery1.FieldByName('ID_PERSONA').AsString,2,Longitud - 1);
              end
             else
               DataActual.FieldByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBPersona := TIBSQL.Create(nil);
             IBPersona.Transaction  := IBT1;

             with IBPersona do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,');
               SQL.Add('FECHA_EXPEDICION,FECHA_NACIMIENTO,ID_TIPO_ESTADO_CIVIL,');
               SQL.Add('ID_CIIU,EMPRESA_LABORA,FECHA_INGRESO_EMPRESA,');
               SQL.Add('INGRESOS_A_PRINCIPAL + INGRESOS_OTROS AS INGRESOS,');
               SQL.Add('TOTAL_ACTIVOS,TOTAL_PASIVOS,FECHA_ACTUALIZACION,');
               SQL.Add('ID_TIPOCONTRATO,ID_OCUPACION,FECHA_ULTIMO_BALANCE,NUMERO_EMPLEADOS,');
               SQL.Add('PERSONAS_A_CARGO,ID_ESTRATO,ID_ESTUDIO');
               SQL.Add('FROM "gen$persona"');
               SQL.Add('LEFT JOIN "gen$persadicional" ON ("gen$persona".ID_IDENTIFICACION = "gen$persadicional".ID_IDENTIFICACION)');
               SQL.Add('AND ("gen$persona".ID_PERSONA = "gen$persadicional".ID_PERSONA)');
               SQL.Add('WHERE "gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION AND');
               SQL.Add('"gen$persona".ID_PERSONA = :ID_PERSONA');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
               ExecQuery;
               Nombre := Trim(IBPersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                      IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                      IBPersona.FieldByName('NOMBRE').AsString);


               if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
                begin
                  NombreC := Format('%-29s',[LeftStr(IBPersona.FieldByName('NOMBRE').AsString,29)]);
                  Apel1C := Format('%-15s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString,15)]);
                  Apel2C := Format('%-14s',[LeftStr(IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
                  NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
                  PersonasCargo := IBPersona.FieldByName('PERSONAS_A_CARGO').AsInteger;
                end
               else
                begin
                  NombreC := Format('%-60s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString +
                             IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString +
                             IBPersona.FieldByName('NOMBRE').AsString,60)]);
                  PersonasCargo := IBPersona.FieldByName('NUMERO_EMPLEADOS').AsInteger;
                end;

               DataActual.FieldByName('NOMBREDATA').AsString := Format('%-45s',[LeftStr(Nombre,45)]);
               DataActual.FieldByName('NOMBRECIFIN').AsString := NombreC;
               NombreC := '';
               Nombre := '';

               DataActual.FieldByName('FECHA_EXP_DOC').AsDateTime := IBPersona.FieldByName('FECHA_EXPEDICION').AsDate;
               DataActual.FieldByName('COD_LUGAR_EXP_DOC').AsInteger := 0;
               DataActual.FieldByName('FECHA_NACIMIENTO').AsDateTime := IBPersona.FieldByName('FECHA_NACIMIENTO').AsDate;
               DataActual.FieldByName('CIIU').AsInteger := IBPersona.FieldByName('ID_CIIU').AsInteger;
               DataActual.FieldByName('ESTRATO').AsInteger := IBPersona.FieldByName('ID_ESTRATO').AsInteger;
               DataActual.FieldByName('PERSONA_A_CARGO').AsInteger := PersonasCargo;
               DataActual.FieldByName('FECHA_ACT_DATOS').AsDateTime := IBPersona.FieldByName('FECHA_ACTUALIZACION').AsDate;
               DataActual.FieldByName('ESTADO_CIVIL').AsInteger := IBPersona.FieldByName('ID_TIPO_ESTADO_CIVIL').AsInteger;
               DataActual.FieldByName('NIVEL_ESTUDIOS').AsInteger := IBPersona.FieldByName('ID_ESTUDIO').AsInteger;
               DataActual.FieldByName('INGRESOS').AsCurrency := IBPersona.FieldByName('INGRESOS').AsCurrency;
               DataActual.FieldByName('ACTIVOS').AsCurrency := IBPersona.FieldByName('TOTAL_ACTIVOS').AsCurrency;
               DataActual.FieldByName('PASIVOS').AsCurrency := IBPersona.FieldByName('TOTAL_PASIVOS').AsCurrency;
               DataActual.FieldByName('FECHA_BALANCE').AsDateTime := IBPersona.FieldByName('FECHA_ULTIMO_BALANCE').AsDate;
               DataActual.FieldByName('NOMBRE_EMPLEADOR').AsString := IBPersona.FieldByName('EMPRESA_LABORA').AsString;
               DataActual.FieldByName('FECHA_ING_EMPRESA').AsDateTime := IBPersona.FieldByName('FECHA_INGRESO_EMPRESA').AsDate;
               DataActual.FieldByName('OCUPACION').AsInteger := IBPersona.FieldByName('ID_OCUPACION').AsInteger;
               DataActual.FieldByName('TIPO_CONTRATO').AsInteger := IBPersona.FieldByName('ID_TIPOCONTRATO').AsInteger;
               IBPersona.Close;
               FreeAndNil(IBPersona);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
             DataActual.FieldByName('CALIFICACION').AsString := IBQuery1.FieldByName('ID_ARRASTRE').AsString;
             DataActual.FieldByName('ESTADO').AsInteger := IBQuery1.FieldByName('ID_ESTADO').AsInteger;
             DataActual.FieldByName('DIASMORA').AsInteger := IBQuery1.FieldByName('MOROSIDAD').AsInteger;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT "col$cambioestado".FECHA_CAMBIO FROM "col$cambioestado"');
               SQL.Add('WHERE "col$cambioestado".ID_ESTADO_ACTUAL = 0 AND "col$cambioestado".ID_ESTADO_NUEVO = 2 AND');
               SQL.Add('"col$cambioestado".ID_AGENCIA = :ID_AGENCIA AND "col$cambioestado".ID_COLOCACION = :ID_COLOCACION');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               if (IBSQL1.RecordCount > 0) and (IBQuery1.FieldByName('MOROSIDAD').AsInteger > 2192) then
                begin
                  FechaExigibilidad := IBSQL1.FieldByName('FECHA_CAMBIO').AsDate;
                  FechaPrescripcion := CalculoFecha(IBSQL1.FieldByName('FECHA_CAMBIO').AsDate,3653);
                  DataActual.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime := FechaExigibilidad;
                  DataActual.FieldByName('FECHA_PRESCRIPCION').AsDateTime := FechaPrescripcion;
                end
               else
                begin
                  DataActual.FieldByName('FECHA_EXIGIBILIDAD').Clear;
                  DataActual.FieldByName('FECHA_PRESCRIPCION').Clear;
                end;
               Close;
               IBSQL1.Close;
             end;

             FreeAndNil(IBSQL1);
             IBT1.Commit;
             FreeAndNil(IBT1);

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               SQL.Clear;
               SQL.Add('SELECT DIASMORA FROM "col$centralriesgotmp" WHERE ID_COLOCACION = :ID_COLOCACION AND FECHA_CORTE = :FECHA_CORTE');
               ParamByName('ID_COLOCACION').AsString := ColocacionNew;
               ParamByName('FECHA_CORTE').AsDate := FechaAnterior;
               ExecQuery;
               if IBSQL1.FieldByName('DIASMORA').AsInteger > 0 then
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select FIRST 1 FECHA_EXTRACTO from "col$extracto" where ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION AND FECHA_EXTRACTO >= :FECHA_CORTE ORDER BY FECHA_EXTRACTO DESC');
                  ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                  ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                  ParamByName('FECHA_CORTE').AsDate := FechaAnterior;
                  ExecQuery;
                  if IBSQL1.RecordCount > 0 then
                   begin
                     FechaPagada := IBSQL1.FieldByName('FECHA_EXTRACTO').AsDate;
                     DataActual.FieldByName('FECHA_PAGO').AsDateTime := FechaPagada;
                   end
                  else
                     DataActual.FieldByName('FECHA_PAGO').Clear;
                end;
               Close;

               SQL.Clear;
               SQL.Add('SELECT FIRST 1 FECHA_A_PAGAR FROM "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION=:ID_COLOCACION');
               SQL.Add('AND PAGADA = 0 ORDER BY FECHA_A_PAGAR ASC');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               if(IBSQL1.RecordCount > 0 ) then
                  FechaLimitePago := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDate
               else
                  FechaLimitePago := FechaCorte;
               DataActual.FieldByName('FECHA_LIMITE_PAGO').AsDateTime := FechaLimitePago;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('PERIOCIDAD_PAGO').AsInteger := IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT COUNT(CUOTA_NUMERO) AS TOTAL FROM "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION AND PAGADA = 1');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               CuotasPagadas := IBSQL1.FieldByName('TOTAL').AsInteger;
               DataActual.FieldByName('CUOTAS_PAGADAS').AsInteger := CuotasPagadas;

               Close;
               SQL.Clear;
               SQL.Add('SELECT COUNT(CUOTA_NUMERO) AS TOTAL FROM "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               CuotasTotal := IBSQL1.FieldByName('TOTAL').AsInteger;
               DataActual.FieldByName('CUOTAS_TOTAL').AsInteger := CuotasTotal;

               Close;
               SQL.Clear;
               SQL.Add('SELECT COUNT(CUOTA_NUMERO) AS TOTAL, SUM(CAPITAL_A_PAGAR + INTERES_A_PAGAR) AS MORA FROM "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION AND PAGADA = 0');
               SQL.Add('AND FECHA_A_PAGAR <= :FECHA_CORTE');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ParamByName('FECHA_CORTE').AsDate :=  RecodeDay(EdFechaCorte.Date,Dayof(EndOfAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date))));
               ExecQuery;
               CuotasMora := IBSQL1.FieldByName('TOTAL').AsInteger;
               ValorMora := IBSQL1.FieldByName('MORA').AsCurrency;
               DataActual.FieldByName('CUOTAS_MORA').AsInteger := CuotasMora;

               if IBQuery1.FieldByName('ID_ESTADO').AsInteger = 3 then
                begin
                 if CuotasMora <= 0 then
                   DataActual.FieldByName('CUOTAS_MORA').AsInteger := 1;
                 DataActual.FieldByName('VALOR_MORA').AsCurrency := IBQuery1.FieldByName('SALDO').AsCurrency
                end
               else
                 DataActual.FieldByName('VALOR_MORA').AsCurrency := ValorMora;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('VALOR').AsCurrency := IBQuery1.fieldbyname('VALOR').AsCurrency;
             DataActual.FieldByName('SALDO').AsCurrency := IBQuery1.fieldbyname('DEUDA').AsCurrency;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT VALOR_CUOTA, FECHA_DESEMBOLSO, FECHA_VENCIMIENTO FROM "col$colocacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               ValorCuota := IBSQL1.FieldByName('VALOR_CUOTA').AsCurrency;
               FechaVencimiento := IBSQL1.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
               FechaDesembolso := IBSQL1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
               DataActual.FieldByName('VALOR_CUOTA').AsCurrency := ValorCuota;
               DataActual.FieldByName('FECHA_VENCIMIENTO').AsDateTime := FechaVencimiento;
               DataActual.FieldByName('FECHA_DESEMBOLSO').AsDateTime := FechaDesembolso;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
             DataActual.FieldByName('VALOR_GARANTIA').AsCurrency := IBQuery1.FieldByName('VALOR_GARANTIA').AsCurrency;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DESCRIPCION_AGENCIA, CODIGO_MUNICIPIO FROM "gen$agencia"  WHERE ID_AGENCIA = :ID_AGENCIA');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ExecQuery;
               Codigo := IntToStr(IBSQL1.FieldByName('CODIGO_MUNICIPIO').AsInteger);
               DataActual.FieldByName('COD_CIUDAD_RAD').AsString := RightStr(Codigo,3);
               DataActual.FieldByName('NOM_CIUDAD_RAD').AsString := IBSQL1.FieldByName('DESCRIPCION_AGENCIA').AsString;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
               SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
               SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
               ParamByName('TIPO').AsInteger := 1;
               ExecQuery;
               Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
               LCodigo := StrLen(PChar(Codigo));
               DataActual.FieldByName('COD_CIUDAD_RES').AsString := RightStr(Codigo,3);
               DataActual.FieldByName('NOM_CIUDAD_RES').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
               if LCodigo = 5 then
                 DataActual.FieldByName('COD_DPTO_RES').AsString := LeftStr(Codigo,2)
               else
                 DataActual.FieldByName('COD_DPTO_RES').AsString := LeftStr(Codigo,1);
               DataActual.FieldByName('NOM_DPTO_RES').AsString := IBSQL1.FieldByName('DPTO').AsString;
               DataActual.FieldByName('DIRECCION_RES').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
               DataActual.FieldByName('TELEFONO_RES').AsString := IBSQL1.FieldByName('TELEFONO1').AsString;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
               SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
               SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
               ParamByName('TIPO').AsInteger := 2;
               ExecQuery;
               Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
               LCodigo := StrLen(PChar(Codigo));
               DataActual.FieldByName('COD_CIUDAD_LAB').AsString := RightStr(Codigo,3);
               DataActual.FieldByName('NOM_CIUDAD_LAB').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
               if LCodigo = 5 then
                 DataActual.FieldByName('COD_DPTO_LAB').AsString := LeftStr(Codigo,2)
               else
                 DataActual.FieldByName('COD_DPTO_LAB').AsString := LeftStr(Codigo,1);
               DataActual.FieldByName('NOM_DPTO_LAB').AsString := IBSQL1.FieldByName('DPTO').AsString;
               DataActual.FieldByName('DIRECCION_LAB').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
               DataActual.FieldByName('TELEFONO_LAB').AsString := IBSQL1.FieldByName('TELEFONO1').AsString;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
               SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
               SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
               ParamByName('TIPO').AsInteger := 3;
               ExecQuery;
               Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
               DataActual.FieldByName('COD_CIUDAD_COR').AsString := RightStr(Codigo,3);
               DataActual.FieldByName('NOM_CIUDAD_COR').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
               DataActual.FieldByName('NOM_DPTO_COR').AsString := IBSQL1.FieldByName('DPTO').AsString;
               DataActual.FieldByName('DIRECCION_COR').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('FECHA_CORTE').AsDateTime := EdFechaCorte.Date;
             DataActual.Post;
            // fin de proceso clientes

            // Inicio proceso CODEUDORES

             IBT2 := TIBTransaction.Create(nil);
             IBT2.DefaultDatabase := Database;
             IBT2.StartTransaction;
             IBSCodeudores := TIBSQL.Create(nil);
             IBSCodeudores.Transaction := IBT2;

             with IBSCodeudores do begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,');
               SQL.Add('FECHA_EXPEDICION,FECHA_NACIMIENTO,ID_TIPO_ESTADO_CIVIL,');
               SQL.Add('ID_CIIU,EMPRESA_LABORA,FECHA_INGRESO_EMPRESA,');
               SQL.Add('INGRESOS_A_PRINCIPAL + INGRESOS_OTROS AS INGRESOS,');
               SQL.Add('TOTAL_ACTIVOS,TOTAL_PASIVOS,FECHA_ACTUALIZACION,');
               SQL.Add('ID_TIPOCONTRATO,ID_OCUPACION,FECHA_ULTIMO_BALANCE,NUMERO_EMPLEADOS,');
               SQL.Add('PERSONAS_A_CARGO,ID_ESTRATO,ID_ESTUDIO,');
               SQL.Add('"col$colgarantias".ID_IDENTIFICACION,"col$colgarantias".ID_PERSONA,"col$colgarantias".CSC_GARANTIA');
               SQL.Add('FROM   "col$colgarantias"');
               SQL.Add('LEFT JOIN "gen$persona" ON ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
               SQL.Add('AND ("col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA)');
               SQL.Add('LEFT JOIN "gen$persadicional" ON ("gen$persona".ID_IDENTIFICACION = "gen$persadicional".ID_IDENTIFICACION)');
               SQL.Add('AND ("gen$persona".ID_PERSONA = "gen$persadicional".ID_PERSONA)');
               SQL.Add('WHERE "col$colgarantias".ID_AGENCIA = :ID_AGENCIA AND');
               SQL.Add('"col$colgarantias".ID_COLOCACION = :ID_COLOCACION');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;

               while not  IBSCodeudores.Eof do begin
                 Application.ProcessMessages;

                 ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
                 ConverColocacion := StrToInt64(ColocacionNew);
                 lblColocacion.Caption := ColocacionNew;
                 ColocacionNew := ColocacionNew + 'C' + IntToStr(IBSCodeudores.FieldByName('CSC_GARANTIA').AsInteger);
                 ColocacionNew := StringReplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);

                 Nombre := Trim(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                        IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                        IBSCodeudores.FieldByName('NOMBRE').AsString);

                 if (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
                  begin
                    NombreC := Format('%-29s',[LeftStr(IBSCodeudores.FieldByName('NOMBRE').AsString,29)]);
                    Apel1C := Format('%-15s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString,15)]);
                    Apel2C := Format('%-14s',[LeftStr(IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
                    NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
                    PersonasCargo := IBSCodeudores.FieldByName('PERSONAS_A_CARGO').AsInteger;
                  end
                 else
                  begin
                    NombreC := Format('%-60s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString +
                               IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString +
                               IBSCodeudores.FieldByName('NOMBRE').AsString,60)]);
                    PersonasCargo := IBSCodeudores.FieldByName('NUMERO_EMPLEADOS').AsInteger;
                  end;

                 DataActual.Insert;
                 DataActual.FieldByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                 DataActual.FieldByName('ID_COLOCACION').AsString := ColocacionNew;
                 DataActual.FieldByName('TIPO_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;

                 if (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger = 6) and (StrToIntDef(LeftStr(IBSCodeudores.FieldByName('ID_PERSONA').AsString,1),-1) = -1) then
                  begin
                    Longitud := Length(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                    DataActual.FieldByName('ID_PERSONA').AsString := MidStr(IBSCodeudores.FieldByName('ID_PERSONA').AsString,2,Longitud - 1);
                  end
                 else
                  DataActual.FieldByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);

                 DataActual.FieldByName('NOMBREDATA').AsString := Format('%-45s',[LeftStr(Nombre,45)]);
                 DataActual.FieldByName('NOMBRECIFIN').AsString := NombreC;
                 NombreC := '';
                 Nombre := '';

                 DataActual.FieldByName('FECHA_EXP_DOC').AsDateTime := IBSCodeudores.FieldByName('FECHA_EXPEDICION').AsDate;
                 DataActual.FieldByName('COD_LUGAR_EXP_DOC').AsInteger := 0;
                 DataActual.FieldByName('FECHA_NACIMIENTO').AsDateTime := IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsDate;
                 DataActual.FieldByName('CIIU').AsInteger := IBSCodeudores.FieldByName('ID_CIIU').AsInteger;
                 DataActual.FieldByName('ESTRATO').AsInteger := IBSCodeudores.FieldByName('ID_ESTRATO').AsInteger;
                 DataActual.FieldByName('PERSONA_A_CARGO').AsInteger := PersonasCargo;
                 DataActual.FieldByName('FECHA_ACT_DATOS').AsDateTime := IBSCodeudores.FieldByName('FECHA_ACTUALIZACION').AsDate;
                 DataActual.FieldByName('ESTADO_CIVIL').AsInteger := IBSCodeudores.FieldByName('ID_TIPO_ESTADO_CIVIL').AsInteger;
                 DataActual.FieldByName('NIVEL_ESTUDIOS').AsInteger := IBSCodeudores.FieldByName('ID_ESTUDIO').AsInteger;
                 DataActual.FieldByName('INGRESOS').AsCurrency := IBSCodeudores.FieldByName('INGRESOS').AsCurrency;
                 DataActual.FieldByName('ACTIVOS').AsCurrency := IBSCodeudores.FieldByName('TOTAL_ACTIVOS').AsCurrency;
                 DataActual.FieldByName('PASIVOS').AsCurrency := IBSCodeudores.FieldByName('TOTAL_PASIVOS').AsCurrency;
                 DataActual.FieldByName('FECHA_BALANCE').AsDateTime := IBSCodeudores.FieldByName('FECHA_ULTIMO_BALANCE').AsDate;
                 DataActual.FieldByName('NOMBRE_EMPLEADOR').AsString := IBSCodeudores.FieldByName('EMPRESA_LABORA').AsString;
                 DataActual.FieldByName('FECHA_ING_EMPRESA').AsDateTime := IBSCodeudores.FieldByName('FECHA_INGRESO_EMPRESA').AsDate;
                 DataActual.FieldByName('OCUPACION').AsInteger := IBSCodeudores.FieldByName('ID_OCUPACION').AsInteger;
                 DataActual.FieldByName('TIPO_CONTRATO').AsInteger := IBSCodeudores.FieldByName('ID_TIPOCONTRATO').AsInteger;
                 DataActual.FieldByName('CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                 DataActual.FieldByName('CALIFICACION').AsString := IBQuery1.FieldByName('ID_ARRASTRE').AsString;
                 DataActual.FieldByName('ESTADO').AsInteger := IBQuery1.FieldByName('ID_ESTADO').AsInteger;
                 DataActual.FieldByName('DIASMORA').AsInteger := IBQuery1.FieldByName('MOROSIDAD').AsInteger;
                 DataActual.FieldByName('FECHA_DESEMBOLSO').AsDateTime := IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;


                 if FechaExigibilidad <> Null then
                    begin
                      DataActual.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime := FechaExigibilidad;
                      DataActual.FieldByName('FECHA_PRESCRIPCION').AsDateTime := FechaPrescripcion;
                    end
                   else
                     begin
                      DataActual.FieldByName('FECHA_EXIGIBILIDAD').Clear;
                      DataActual.FieldByName('FECHA_PRESCRIPCION').Clear;
                    end;

                 if FechaPagada <> 0 then
                   DataActual.FieldByName('FECHA_PAGO').AsDateTime := FechaPagada
                 else
                   DataActual.FieldByName('FECHA_PAGO').Clear;
                 DataActual.FieldByName('FECHA_LIMITE_PAGO').AsDateTime := FechaLimitePago;
                 DataActual.FieldByName('PERIOCIDAD_PAGO').AsInteger := IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
                 DataActual.FieldByName('CUOTAS_PAGADAS').AsInteger := CuotasPagadas;
                 DataActual.FieldByName('CUOTAS_TOTAL').AsInteger := CuotasTotal;
                 DataActual.FieldByName('CUOTAS_MORA').AsInteger := cuotasmora;
                 DataActual.FieldByName('VALOR_MORA').AsCurrency := ValorMora;
                 DataActual.FieldByName('VALOR').AsCurrency := IBQuery1.fieldbyname('VALOR').AsCurrency;
                 DataActual.FieldByName('SALDO').AsCurrency := IBQuery1.fieldbyname('DEUDA').AsCurrency;
                 DataActual.FieldByName('VALOR_CUOTA').AsCurrency := valorcuota;
                 DataActual.FieldByName('FECHA_VENCIMIENTO').AsDateTime := FechaVencimiento;
                 DataActual.FieldByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
                 DataActual.FieldByName('VALOR_GARANTIA').AsCurrency := IBQuery1.FieldByName('VALOR_GARANTIA').AsCurrency;

                 IBT1 := TIBTransaction.Create(nil);
                 IBT1.DefaultDatabase := Database;
                 IBT1.StartTransaction;
                 IBSQL1 := TIBSQL.Create(nil);
                 IBSQL1.Transaction  := IBT1;

                 with IBSQL1 do begin
                   Close;
                   SQL.Clear;
                   SQL.Add('SELECT DESCRIPCION_AGENCIA, CODIGO_MUNICIPIO FROM "gen$agencia"  WHERE ID_AGENCIA = :ID_AGENCIA');
                   ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                   ExecQuery;
                   Codigo := IntToStr(IBSQL1.FieldByName('CODIGO_MUNICIPIO').AsInteger);
                   DataActual.FieldByName('COD_CIUDAD_RAD').AsString := RightStr(Codigo,3);
                   DataActual.FieldByName('NOM_CIUDAD_RAD').AsString := IBSQL1.FieldByName('DESCRIPCION_AGENCIA').AsString;
                   Close;
                   FreeAndNil(IBSQL1);
                   IBT1.Commit;
                   FreeAndNil(IBT1);
                 end;

                 IBT1 := TIBTransaction.Create(nil);
                 IBT1.DefaultDatabase := Database;
                 IBT1.StartTransaction;
                 IBSQL1 := TIBSQL.Create(nil);
                 IBSQL1.Transaction  := IBT1;

                 with IBSQL1 do begin
                   Close;
                   SQL.Clear;
                   SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
                   SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
                   SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
                   ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
                   ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                   ParamByName('TIPO').AsInteger := 1;
                   ExecQuery;
                   Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
                   LCodigo := StrLen(PChar(Codigo));
                   DataActual.FieldByName('COD_CIUDAD_RES').AsString := RightStr(Codigo,3);
                   DataActual.FieldByName('NOM_CIUDAD_RES').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
                   if LCodigo = 5 then
                     DataActual.FieldByName('COD_DPTO_RES').AsString := LeftStr(Codigo,2)
                   else
                     DataActual.FieldByName('COD_DPTO_RES').AsString := LeftStr(Codigo,1);
                   DataActual.FieldByName('COD_DPTO_RES').AsInteger := StrToInt(LeftStr(Codigo,2));
                   DataActual.FieldByName('NOM_DPTO_RES').AsString := IBSQL1.FieldByName('DPTO').AsString;
                   DataActual.FieldByName('DIRECCION_RES').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
                   DataActual.FieldByName('TELEFONO_RES').AsString := IBSQL1.FieldByName('TELEFONO1').AsString;
                   Close;
                   FreeAndNil(IBSQL1);
                   IBT1.Commit;
                   FreeAndNil(IBT1);
                 end;

                 IBT1 := TIBTransaction.Create(nil);
                 IBT1.DefaultDatabase := Database;
                 IBT1.StartTransaction;
                 IBSQL1 := TIBSQL.Create(nil);
                 IBSQL1.Transaction  := IBT1;

                 with IBSQL1 do begin
                   Close;
                   SQL.Clear;
                   SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
                   SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
                   SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
                   ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
                   ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                   ParamByName('TIPO').AsInteger := 2;
                   ExecQuery;
                   Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
                   LCodigo := StrLen(PChar(Codigo));
                   DataActual.FieldByName('COD_CIUDAD_LAB').AsString := RightStr(Codigo,3);
                   DataActual.FieldByName('NOM_CIUDAD_LAB').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
                   if LCodigo = 5 then
                     DataActual.FieldByName('COD_DPTO_LAB').AsString := LeftStr(Codigo,2)
                   else
                     DataActual.FieldByName('COD_DPTO_LAB').AsString := LeftStr(Codigo,1);
                   DataActual.FieldByName('COD_DPTO_LAB').AsInteger := StrToInt(LeftStr(Codigo,2));
                   DataActual.FieldByName('NOM_DPTO_LAB').AsString := IBSQL1.FieldByName('DPTO').AsString;
                   DataActual.FieldByName('DIRECCION_LAB').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
                   DataActual.FieldByName('TELEFONO_LAB').AsString := IBSQL1.FieldByName('TELEFONO1').AsString;
                   Close;
                   FreeAndNil(IBSQL1);
                   IBT1.Commit;
                   FreeAndNil(IBT1);
                 end;

                 IBT1 := TIBTransaction.Create(nil);
                 IBT1.DefaultDatabase := Database;
                 IBT1.StartTransaction;
                 IBSQL1 := TIBSQL.Create(nil);
                 IBSQL1.Transaction  := IBT1;

                 with IBSQL1 do begin
                   Close;
                   SQL.Clear;
                   SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
                   SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
                   SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
                   ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
                   ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                   ParamByName('TIPO').AsInteger := 3;
                   ExecQuery;
                   Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
                   DataActual.FieldByName('COD_CIUDAD_COR').AsString := RightStr(Codigo,3);
                   DataActual.FieldByName('NOM_CIUDAD_COR').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
                   DataActual.FieldByName('NOM_DPTO_COR').AsString := IBSQL1.FieldByName('DPTO').AsString;
                   DataActual.FieldByName('DIRECCION_COR').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
                   IBSQL1.Close;
                   FreeAndNil(IBSQL1);
                   IBT1.Commit;
                   FreeAndNil(IBT1);
                 end;

                 DataActual.FieldByName('FECHA_CORTE').AsDateTime := EdFechaCorte.Date;
                 DataActual.Post;
                 IBSCodeudores.Next;
               end;  // Fin While Codeudores

              IBSCodeudores.Close;
              FreeAndNil(IBSCodeudores);
              IBT2.Commit;
              FreeAndNil(IBT2);
            end; // Fin proceso Codeudores
            IBQuery1.Next;
           end; // fin de while Clientes
           IBQuery1.Close;
           FreeAndNil(IBQuery1);
        end; //fin de with principal
        Application.ProcessMessages;
end;

procedure TfrmProcesarCentrales.ProcesarObligacionesCerradas;
var
 PersonasCargo:Integer;
 Codigo:string;
 LCodigo:Integer;
 Fecha:TDate;
 DiasMora:Integer;
 IBQuery1:TIBQuery;
 IBSQL1,IBSCodeudores,IBPersona:TIBSQL;
 IBT1,IBT2:TIBTransaction;
 Longitud:Integer;
begin
        if Transaction.InTransaction then
          Transaction.Rollback;
        Transaction.StartTransaction;

        IBQuery1 := TIBQuery.Create(nil);
        IBQuery1.Transaction  := Transaction;

        with IBQuery1 do begin
           SQL.Clear;
           SQL.Add(SentenciaTotal);
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información con esa fecha de corte',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            Bar.Min := 0;
            Bar.Max := FieldByName('CONTEO').AsInteger;
            Bar.Position := 0;
           except
              Transaction.Rollback;
              raise;
              Exit;
           end;
           FreeAndNil(IBQuery1);
        end;

        IBQuery1 := TIBQuery.Create(nil);
        IBQuery1.Transaction  := Transaction;

        with IBQuery1 do begin
           SQL.Clear;
           SQL.Add(Sentencia);
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           while not eof do begin
             Bar.Position := RecNo;
             Application.ProcessMessages;
             // Proceso informacion Clientes
             ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
             lblColocacion.Caption := ColocacionNew;
             ConverColocacion := StrToInt64(ColocacionNew);
             ColocacionNew := Format('%.18d',[ConverColocacion]);
             ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);

             FechaPagada := 0;
             DataActual.Insert;
             DataActual.FieldByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
             DataActual.FieldByName('ID_COLOCACION').AsString := ColocacionNew;
             DataActual.FieldByName('TIPO_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
             if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger = 6) and (StrToIntDef(LeftStr(IBQuery1.FieldByName('ID_PERSONA').AsString,1),-1) = -1) then
              begin
                Longitud := Length(IBQuery1.FieldByName('ID_PERSONA').AsString);
                DataActual.FieldByName('ID_PERSONA').AsString := MidStr(IBQuery1.FieldByName('ID_PERSONA').AsString,2,Longitud - 1);
              end
             else
               DataActual.FieldByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBPersona := TIBSQL.Create(nil);
             IBPersona.Transaction  := IBT1;

             with IBPersona do begin
               SQL.Clear;
               SQL.Add('SELECT NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,');
               SQL.Add('FECHA_EXPEDICION,FECHA_NACIMIENTO,ID_TIPO_ESTADO_CIVIL,');
               SQL.Add('ID_CIIU,EMPRESA_LABORA,FECHA_INGRESO_EMPRESA,');
               SQL.Add('INGRESOS_A_PRINCIPAL + INGRESOS_OTROS AS INGRESOS,');
               SQL.Add('TOTAL_ACTIVOS,TOTAL_PASIVOS,FECHA_ACTUALIZACION,');
               SQL.Add('ID_TIPOCONTRATO,ID_OCUPACION,FECHA_ULTIMO_BALANCE,NUMERO_EMPLEADOS,');
               SQL.Add('PERSONAS_A_CARGO,ID_ESTRATO,ID_ESTUDIO');
               SQL.Add('FROM "gen$persona"');
               SQL.Add('LEFT JOIN "gen$persadicional" ON ("gen$persona".ID_IDENTIFICACION = "gen$persadicional".ID_IDENTIFICACION)');
               SQL.Add('AND ("gen$persona".ID_PERSONA = "gen$persadicional".ID_PERSONA)');
               SQL.Add('WHERE "gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION AND');
               SQL.Add('"gen$persona".ID_PERSONA = :ID_PERSONA');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
               ExecQuery;
               Nombre := Trim(IBPersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                      IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                      IBPersona.FieldByName('NOMBRE').AsString);


               if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
                begin
                  NombreC := Format('%-29s',[LeftStr(IBPersona.FieldByName('NOMBRE').AsString,29)]);
                  Apel1C := Format('%-15s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString,15)]);
                  Apel2C := Format('%-14s',[LeftStr(IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
                  NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
                  PersonasCargo := IBPersona.FieldByName('PERSONAS_A_CARGO').AsInteger;
                end
               else
                begin
                  NombreC := Format('%-60s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString +
                             IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString +
                             IBPersona.FieldByName('NOMBRE').AsString,60)]);
                  PersonasCargo := IBPersona.FieldByName('NUMERO_EMPLEADOS').AsInteger;
                end;
               DataActual.FieldByName('NOMBREDATA').AsString := Format('%-45s',[LeftStr(Nombre,45)]);
               DataActual.FieldByName('NOMBRECIFIN').AsString := NombreC;
               NombreC := '';
               Nombre := '';

               DataActual.FieldByName('FECHA_EXP_DOC').AsDateTime := IBPersona.FieldByName('FECHA_EXPEDICION').AsDate;
               DataActual.FieldByName('COD_LUGAR_EXP_DOC').AsInteger := 0;
               DataActual.FieldByName('FECHA_NACIMIENTO').AsDateTime := IBPersona.FieldByName('FECHA_NACIMIENTO').AsDate;
               DataActual.FieldByName('CIIU').AsInteger := IBPersona.FieldByName('ID_CIIU').AsInteger;
               DataActual.FieldByName('ESTRATO').AsInteger := IBPersona.FieldByName('ID_ESTRATO').AsInteger;
               DataActual.FieldByName('PERSONA_A_CARGO').AsInteger := PersonasCargo;
               DataActual.FieldByName('FECHA_ACT_DATOS').AsDateTime := IBPersona.FieldByName('FECHA_ACTUALIZACION').AsDate;
               DataActual.FieldByName('ESTADO_CIVIL').AsInteger := IBPersona.FieldByName('ID_TIPO_ESTADO_CIVIL').AsInteger;
               DataActual.FieldByName('NIVEL_ESTUDIOS').AsInteger := IBPersona.FieldByName('ID_ESTUDIO').AsInteger;
               DataActual.FieldByName('INGRESOS').AsCurrency := IBPersona.FieldByName('INGRESOS').AsCurrency;
               DataActual.FieldByName('ACTIVOS').AsCurrency := IBPersona.FieldByName('TOTAL_ACTIVOS').AsCurrency;
               DataActual.FieldByName('PASIVOS').AsCurrency := IBPersona.FieldByName('TOTAL_PASIVOS').AsCurrency;
               DataActual.FieldByName('FECHA_BALANCE').AsDateTime := IBPersona.FieldByName('FECHA_ULTIMO_BALANCE').AsDate;
               DataActual.FieldByName('NOMBRE_EMPLEADOR').AsString := IBPersona.FieldByName('EMPRESA_LABORA').AsString;
               DataActual.FieldByName('FECHA_ING_EMPRESA').AsDateTime := IBPersona.FieldByName('FECHA_INGRESO_EMPRESA').AsDate;
               DataActual.FieldByName('OCUPACION').AsInteger := IBPersona.FieldByName('ID_OCUPACION').AsInteger;
               DataActual.FieldByName('TIPO_CONTRATO').AsInteger := IBPersona.FieldByName('ID_TIPOCONTRATO').AsInteger;
               IBPersona.Close;
               FreeAndNil(IBPersona);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
             DataActual.FieldByName('CALIFICACION').AsString := IBQuery1.FieldByName('ID_CATEGORIA').AsString;
             DataActual.FieldByName('ESTADO').AsInteger := IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger;
             if (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3)  then
                Fecha := IBQuery1.FieldByName('FECHA_CAPITAL').AsDateTime
             else
                Fecha := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
             Fecha := IncDay(Fecha);
             DiasMora := DiasEntre(Fecha,EdFechaCorte.Date);
             if (DiasMora < 0) then DiasMora := 0;
             DataActual.FieldByName('DIASMORA').AsInteger := DiasMora;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               SQL.Clear;
               SQL.Add('SELECT "col$cambioestado".FECHA_CAMBIO FROM "col$cambioestado"');
               SQL.Add('WHERE "col$cambioestado".ID_ESTADO_ACTUAL = 0 AND "col$cambioestado".ID_ESTADO_NUEVO = 2 AND');
               SQL.Add('"col$cambioestado".ID_AGENCIA = :ID_AGENCIA AND "col$cambioestado".ID_COLOCACION = :ID_COLOCACION');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               if (IBSQL1.RecordCount > 0) and (DiasMora > 2192) then
                begin
                  FechaExigibilidad := IBSQL1.FieldByName('FECHA_CAMBIO').AsDate;
                  FechaPrescripcion := CalculoFecha(IBSQL1.FieldByName('FECHA_CAMBIO').AsDate,3653);
                  DataActual.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime := FechaExigibilidad;
                  DataActual.FieldByName('FECHA_PRESCRIPCION').AsDateTime := FechaPrescripcion;
                end
               else
                begin
                  DataActual.FieldByName('FECHA_EXIGIBILIDAD').Clear;
                  DataActual.FieldByName('FECHA_PRESCRIPCION').Clear;
                end;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               SQL.Clear;
               SQL.Add('SELECT DIASMORA FROM "col$centralriesgotmp" WHERE ID_COLOCACION = :ID_COLOCACION AND FECHA_CORTE = :FECHA_CORTE');
               ParamByName('ID_COLOCACION').AsString := ColocacionNew;
               ParamByName('FECHA_CORTE').AsDate := FechaAnterior;
               ExecQuery;
               if IBSQL1.FieldByName('DIASMORA').AsInteger > 0 then
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select FIRST 1 FECHA_EXTRACTO from "col$extracto" where ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION AND FECHA_EXTRACTO >= :FECHA_CORTE ORDER BY FECHA_EXTRACTO DESC');
                  ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                  ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                  ParamByName('FECHA_CORTE').AsDate := FechaAnterior;
                  ExecQuery;
                  if IBSQL1.RecordCount > 0 then
                   begin
                     FechaPagada := IBSQL1.FieldByName('FECHA_EXTRACTO').AsDate;
                     DataActual.FieldByName('FECHA_PAGO').AsDateTime := FechaPagada;
                   end
                   else
                     DataActual.FieldByName('FECHA_PAGO').Clear;
                end;

               if (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 6) or (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 7) or (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 10) then
                 DataActual.FieldByName('FECHA_PAGO').AsDateTime := IBQuery1.FieldByName('FECHA_SALDADO').AsDateTime;

               Close;
               SQL.Clear;
               SQL.Add('SELECT FIRST 1 FECHA_A_PAGAR FROM "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION=:ID_COLOCACION');
               SQL.Add('AND PAGADA = 0 ORDER BY FECHA_A_PAGAR ASC');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               FechaLimitePago := IBSQL1.FieldByName('FECHA_A_PAGAR').AsDate;
               DataActual.FieldByName('FECHA_LIMITE_PAGO').AsDateTime := FechaLimitePago;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('PERIOCIDAD_PAGO').AsInteger := IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               SQL.Clear;
               SQL.Add('SELECT COUNT(CUOTA_NUMERO) AS TOTAL FROM "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION AND PAGADA = 1');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               CuotasPagadas := IBSQL1.FieldByName('TOTAL').AsInteger;
               DataActual.FieldByName('CUOTAS_PAGADAS').AsInteger := CuotasPagadas;

               Close;
               SQL.Clear;
               SQL.Add('SELECT COUNT(CUOTA_NUMERO) AS TOTAL FROM "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               CuotasTotal := IBSQL1.FieldByName('TOTAL').AsInteger;
               DataActual.FieldByName('CUOTAS_TOTAL').AsInteger := CuotasTotal;

               Close;
               SQL.Clear;
               SQL.Add('SELECT COUNT(CUOTA_NUMERO) AS TOTAL, SUM(CAPITAL_A_PAGAR + INTERES_A_PAGAR) AS MORA FROM "col$tablaliquidacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION AND PAGADA = 0');
               SQL.Add('AND FECHA_A_PAGAR <= :FECHA_CORTE');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ParamByName('FECHA_CORTE').AsDate := RecodeDay(EdFechaCorte.Date,Dayof(EndOfAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date))));
               ExecQuery;
               CuotasMora := IBSQL1.FieldByName('TOTAL').AsInteger;
               ValorMora := IBSQL1.FieldByName('MORA').AsCurrency;
               DataActual.FieldByName('CUOTAS_MORA').AsInteger := CuotasMora;

               if IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3 then
                begin
                 if CuotasMora <= 0 then
                   DataActual.FieldByName('CUOTAS_MORA').AsInteger := 1;
                 DataActual.FieldByName('VALOR_MORA').AsCurrency := IBQuery1.FieldByName('SALDO').AsCurrency
                end
               else
                 DataActual.FieldByName('VALOR_MORA').AsCurrency := ValorMora;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('VALOR').AsCurrency := IBQuery1.fieldbyname('VALOR_DESEMBOLSO').AsCurrency;
             DataActual.FieldByName('SALDO').AsCurrency := IBQuery1.fieldbyname('SALDO').AsCurrency;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               SQL.Clear;
               SQL.Add('SELECT VALOR_CUOTA, FECHA_DESEMBOLSO,FECHA_VENCIMIENTO FROM "col$colocacion" WHERE ID_AGENCIA = :ID_AGENCIA AND ID_COLOCACION = :ID_COLOCACION');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               ValorCuota := IBSQL1.FieldByName('VALOR_CUOTA').AsCurrency;
               FechaVencimiento := IBSQL1.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
               FechaDesembolso := IBSQL1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
               DataActual.FieldByName('VALOR_CUOTA').AsCurrency := ValorCuota;
               DataActual.FieldByName('FECHA_VENCIMIENTO').AsDateTime := FechaVencimiento;
               DataActual.FieldByName('FECHA_DESEMBOLSO').AsDateTime := FechaDesembolso;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
             DataActual.FieldByName('VALOR_GARANTIA').AsCurrency := 0;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               SQL.Clear;
               SQL.Add('SELECT DESCRIPCION_AGENCIA, CODIGO_MUNICIPIO FROM "gen$agencia"  WHERE ID_AGENCIA = :ID_AGENCIA');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ExecQuery;
               Codigo := IntToStr(IBSQL1.FieldByName('CODIGO_MUNICIPIO').AsInteger);
               DataActual.FieldByName('COD_CIUDAD_RAD').AsString := RightStr(Codigo,3);
               DataActual.FieldByName('NOM_CIUDAD_RAD').AsString := IBSQL1.FieldByName('DESCRIPCION_AGENCIA').AsString;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               SQL.Clear;
               SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
               SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
               SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
               ParamByName('TIPO').AsInteger := 1;
               ExecQuery;
               Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
               LCodigo := StrLen(PChar(Codigo));
               DataActual.FieldByName('COD_CIUDAD_RES').AsString := RightStr(Codigo,3);
               DataActual.FieldByName('NOM_CIUDAD_RES').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
               if LCodigo = 5 then
                 DataActual.FieldByName('COD_DPTO_RES').AsString := LeftStr(Codigo,2)
               else
                 DataActual.FieldByName('COD_DPTO_RES').AsString := LeftStr(Codigo,1);
               DataActual.FieldByName('NOM_DPTO_RES').AsString := IBSQL1.FieldByName('DPTO').AsString;
               DataActual.FieldByName('DIRECCION_RES').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
               DataActual.FieldByName('TELEFONO_RES').AsString := IBSQL1.FieldByName('TELEFONO1').AsString;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBSQL1);
             end;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               SQL.Clear;
               SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
               SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
               SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
               ParamByName('TIPO').AsInteger := 2;
               ExecQuery;
               Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
               LCodigo := StrLen(PChar(Codigo));
               DataActual.FieldByName('COD_CIUDAD_LAB').AsString := RightStr(Codigo,3);
               DataActual.FieldByName('NOM_CIUDAD_LAB').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
               if LCodigo = 5 then
                 DataActual.FieldByName('COD_DPTO_LAB').AsString := LeftStr(Codigo,2)
               else
                 DataActual.FieldByName('COD_DPTO_LAB').AsString := LeftStr(Codigo,1);
               DataActual.FieldByName('NOM_DPTO_LAB').AsString := IBSQL1.FieldByName('DPTO').AsString;
               DataActual.FieldByName('DIRECCION_LAB').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
               DataActual.FieldByName('TELEFONO_LAB').AsString := IBSQL1.FieldByName('TELEFONO1').AsString;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             IBT1 := TIBTransaction.Create(nil);
             IBT1.DefaultDatabase := Database;
             IBT1.StartTransaction;
             IBSQL1 := TIBSQL.Create(nil);
             IBSQL1.Transaction  := IBT1;

             with IBSQL1 do begin
               SQL.Clear;
               SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
               SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
               SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
               ParamByName('TIPO').AsInteger := 3;
               ExecQuery;
               Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
               DataActual.FieldByName('COD_CIUDAD_COR').AsString := RightStr(Codigo,3);
               DataActual.FieldByName('NOM_CIUDAD_COR').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
               DataActual.FieldByName('NOM_DPTO_COR').AsString := IBSQL1.FieldByName('DPTO').AsString;
               DataActual.FieldByName('DIRECCION_COR').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
               Close;
               FreeAndNil(IBSQL1);
               IBT1.Commit;
               FreeAndNil(IBT1);
             end;

             DataActual.FieldByName('FECHA_CORTE').AsDateTime := EdFechaCorte.Date;
             DataActual.Post;
            // fin de proceso clientes

             IBT2 := TIBTransaction.Create(nil);
             IBT2.DefaultDatabase := Database;
             IBT2.StartTransaction;
             IBSCodeudores := TIBSQL.Create(nil);
             IBSCodeudores.Transaction  := IBT2;

            // Inicio proceso CODEUDORES
             with IBSCodeudores do begin
               SQL.Clear;
               SQL.Add('SELECT NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,');
               SQL.Add('FECHA_EXPEDICION,FECHA_NACIMIENTO,ID_TIPO_ESTADO_CIVIL,');
               SQL.Add('ID_CIIU,EMPRESA_LABORA,FECHA_INGRESO_EMPRESA,');
               SQL.Add('INGRESOS_A_PRINCIPAL + INGRESOS_OTROS AS INGRESOS,');
               SQL.Add('TOTAL_ACTIVOS,TOTAL_PASIVOS,FECHA_ACTUALIZACION,');
               SQL.Add('ID_TIPOCONTRATO,FECHA_ULTIMO_BALANCE,NUMERO_EMPLEADOS,');
               SQL.Add('PERSONAS_A_CARGO,ID_ESTRATO,ID_ESTUDIO,');
               SQL.Add('"col$colgarantias".ID_IDENTIFICACION,"col$colgarantias".ID_PERSONA,"col$colgarantias".CSC_GARANTIA');
               SQL.Add('FROM   "col$colgarantias"');
               SQL.Add('LEFT JOIN "gen$persona" ON ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
               SQL.Add('AND ("col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA)');
               SQL.Add('LEFT JOIN "gen$persadicional" ON ("gen$persona".ID_IDENTIFICACION = "gen$persadicional".ID_IDENTIFICACION)');
               SQL.Add('AND ("gen$persona".ID_PERSONA = "gen$persadicional".ID_PERSONA)');
               SQL.Add('WHERE "col$colgarantias".ID_AGENCIA = :ID_AGENCIA AND');
               SQL.Add('"col$colgarantias".ID_COLOCACION = :ID_COLOCACION');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;

               while not  IBSCodeudores.Eof do begin
                 Application.ProcessMessages;

                 ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
                 lblColocacion.Caption := ColocacionNew;
                 ConverColocacion := StrToInt64(ColocacionNew);
                 ColocacionNew := ColocacionNew + 'C' + IntToStr(IBSCodeudores.FieldByName('CSC_GARANTIA').AsInteger);
                 ColocacionNew := StringReplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);

                 Nombre := Trim(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                        IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                        IBSCodeudores.FieldByName('NOMBRE').AsString);

                 if (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
                  begin
                    NombreC := Format('%-29s',[LeftStr(IBSCodeudores.FieldByName('NOMBRE').AsString,29)]);
                    Apel1C := Format('%-15s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString,15)]);
                    Apel2C := Format('%-14s',[LeftStr(IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
                    NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
                    PersonasCargo := IBSCodeudores.FieldByName('PERSONAS_A_CARGO').AsInteger;
                  end
                 else
                  begin
                    NombreC := Format('%-60s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString +
                               IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString +
                               IBSCodeudores.FieldByName('NOMBRE').AsString,60)]);
                    PersonasCargo := IBSCodeudores.FieldByName('NUMERO_EMPLEADOS').AsInteger;
                  end;


                 DataActual.Insert;
                 DataActual.FieldByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                 DataActual.FieldByName('ID_COLOCACION').AsString := ColocacionNew;
                 DataActual.FieldByName('TIPO_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;

                 if (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger = 6) and (StrToIntDef(LeftStr(IBSCodeudores.FieldByName('ID_PERSONA').AsString,1),-1) = -1) then
                  begin
                    Longitud := Length(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                    DataActual.FieldByName('ID_PERSONA').AsString := MidStr(IBSCodeudores.FieldByName('ID_PERSONA').AsString,2,Longitud - 1);
                  end
                 else
                  DataActual.FieldByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);

                 DataActual.FieldByName('NOMBREDATA').AsString := Format('%-45s',[LeftStr(Nombre,45)]);
                 DataActual.FieldByName('NOMBRECIFIN').AsString := NombreC;
                 NombreC := '';
                 Nombre := '';

                 DataActual.FieldByName('FECHA_EXP_DOC').AsDateTime := IBSCodeudores.FieldByName('FECHA_EXPEDICION').AsDate;
                 DataActual.FieldByName('COD_LUGAR_EXP_DOC').AsInteger := 0;
                 DataActual.FieldByName('FECHA_NACIMIENTO').AsDateTime := IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsDate;
                 DataActual.FieldByName('CIIU').AsInteger := IBSCodeudores.FieldByName('ID_CIIU').AsInteger;
                 DataActual.FieldByName('ESTRATO').AsInteger := IBSCodeudores.FieldByName('ID_ESTRATO').AsInteger;
                 DataActual.FieldByName('PERSONA_A_CARGO').AsInteger := PersonasCargo;
                 DataActual.FieldByName('FECHA_ACT_DATOS').AsDateTime := IBSCodeudores.FieldByName('FECHA_ACTUALIZACION').AsDate;
                 DataActual.FieldByName('ESTADO_CIVIL').AsInteger := IBSCodeudores.FieldByName('ID_TIPO_ESTADO_CIVIL').AsInteger;
                 DataActual.FieldByName('NIVEL_ESTUDIOS').AsInteger := IBSCodeudores.FieldByName('ID_ESTUDIO').AsInteger;
                 DataActual.FieldByName('INGRESOS').AsCurrency := IBSCodeudores.FieldByName('INGRESOS').AsCurrency;
                 DataActual.FieldByName('ACTIVOS').AsCurrency := IBSCodeudores.FieldByName('TOTAL_ACTIVOS').AsCurrency;
                 DataActual.FieldByName('PASIVOS').AsCurrency := IBSCodeudores.FieldByName('TOTAL_PASIVOS').AsCurrency;
                 DataActual.FieldByName('FECHA_BALANCE').AsDateTime := IBSCodeudores.FieldByName('FECHA_ULTIMO_BALANCE').AsDate;
                 DataActual.FieldByName('NOMBRE_EMPLEADOR').AsString := IBSCodeudores.FieldByName('EMPRESA_LABORA').AsString;
                 DataActual.FieldByName('FECHA_ING_EMPRESA').AsDateTime := IBSCodeudores.FieldByName('FECHA_INGRESO_EMPRESA').AsDate;
                 DataActual.FieldByName('TIPO_CONTRATO').AsInteger := IBSCodeudores.FieldByName('ID_TIPOCONTRATO').AsInteger;
                 DataActual.FieldByName('CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                 DataActual.FieldByName('CALIFICACION').AsString := IBQuery1.FieldByName('ID_CATEGORIA').AsString;
                 DataActual.FieldByName('ESTADO').AsInteger := IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger;
                 DataActual.FieldByName('DIASMORA').AsInteger := DiasMora;
                 DataActual.FieldByName('FECHA_DESEMBOLSO').AsDateTime := IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime;


                 if FechaExigibilidad <> Null then
                    begin
                      DataActual.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime := FechaExigibilidad;
                      DataActual.FieldByName('FECHA_PRESCRIPCION').AsDateTime := FechaPrescripcion;
                    end
                   else
                     begin
                      DataActual.FieldByName('FECHA_EXIGIBILIDAD').Clear;
                      DataActual.FieldByName('FECHA_PRESCRIPCION').Clear;
                    end;

                 if FechaPagada <> 0 then
                   DataActual.FieldByName('FECHA_PAGO').AsDateTime := FechaPagada
                 else
                   DataActual.FieldByName('FECHA_PAGO').Clear;

                 if (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 6) or (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 7) or (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 10) then
                   DataActual.FieldByName('FECHA_PAGO').AsDateTime := IBQuery1.FieldByName('FECHA_SALDADO').AsDateTime;

                 DataActual.FieldByName('FECHA_LIMITE_PAGO').AsDateTime := FechaLimitePago;
                 DataActual.FieldByName('PERIOCIDAD_PAGO').AsInteger := IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
                 DataActual.FieldByName('CUOTAS_PAGADAS').AsInteger := CuotasPagadas;
                 DataActual.FieldByName('CUOTAS_TOTAL').AsInteger := CuotasTotal;
                 if IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3 then
                  begin
                    DataActual.FieldByName('CUOTAS_MORA').AsInteger := CuotasMora;
                    DataActual.FieldByName('VALOR_MORA').AsCurrency := IBQuery1.FieldByName('SALDO').AsCurrency;
                  end
                 else
                  begin
                    DataActual.FieldByName('CUOTAS_MORA').AsInteger := 0;
                    DataActual.FieldByName('VALOR_MORA').AsCurrency := 0;
                  end;
                 DataActual.FieldByName('VALOR').AsCurrency := IBQuery1.fieldbyname('VALOR_DESEMBOLSO').AsCurrency;
                 DataActual.FieldByName('SALDO').AsCurrency := IBQuery1.fieldbyname('SALDO').AsCurrency;
                 DataActual.FieldByName('VALOR_CUOTA').AsCurrency := valorcuota;
                 DataActual.FieldByName('FECHA_VENCIMIENTO').AsDateTime := FechaVencimiento;
                 DataActual.FieldByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
                 DataActual.FieldByName('VALOR_GARANTIA').AsCurrency := 0;

                 IBT1 := TIBTransaction.Create(nil);
                 IBT1.DefaultDatabase := Database;
                 IBT1.StartTransaction;
                 IBSQL1 := TIBSQL.Create(nil);
                 IBSQL1.Transaction  := IBT1;

                 with IBSQL1 do begin
                   SQL.Clear;
                   SQL.Add('SELECT DESCRIPCION_AGENCIA, CODIGO_MUNICIPIO FROM "gen$agencia"  WHERE ID_AGENCIA = :ID_AGENCIA');
                   ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                   ExecQuery;
                   Codigo := IntToStr(IBSQL1.FieldByName('CODIGO_MUNICIPIO').AsInteger);
                   DataActual.FieldByName('COD_CIUDAD_RAD').AsString := RightStr(Codigo,3);
                   DataActual.FieldByName('NOM_CIUDAD_RAD').AsString := IBSQL1.FieldByName('DESCRIPCION_AGENCIA').AsString;
                   Close;
                   FreeAndNil(IBSQL1);
                   IBT1.Commit;
                   FreeAndNil(IBT1);
                 end;

                 IBT1 := TIBTransaction.Create(nil);
                 IBT1.DefaultDatabase := Database;
                 IBT1.StartTransaction;
                 IBSQL1 := TIBSQL.Create(nil);
                 IBSQL1.Transaction  := IBT1;

                 with IBSQL1 do begin
                   SQL.Clear;
                   SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
                   SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
                   SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
                   ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
                   ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                   ParamByName('TIPO').AsInteger := 1;
                   ExecQuery;
                   Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
                   LCodigo := StrLen(PChar(Codigo));
                   DataActual.FieldByName('COD_CIUDAD_RES').AsString := RightStr(Codigo,3);
                   DataActual.FieldByName('NOM_CIUDAD_RES').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
                   if LCodigo = 5 then
                     DataActual.FieldByName('COD_DPTO_RES').AsString := LeftStr(Codigo,2)
                   else
                     DataActual.FieldByName('COD_DPTO_RES').AsString := LeftStr(Codigo,1);
                   DataActual.FieldByName('COD_DPTO_RES').AsInteger := StrToInt(LeftStr(Codigo,2));
                   DataActual.FieldByName('NOM_DPTO_RES').AsString := IBSQL1.FieldByName('DPTO').AsString;
                   DataActual.FieldByName('DIRECCION_RES').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
                   DataActual.FieldByName('TELEFONO_RES').AsString := IBSQL1.FieldByName('TELEFONO1').AsString;
                   Close;
                   FreeAndNil(IBSQL1);
                   IBT1.Commit;
                   FreeAndNil(IBT1);
                 end;

                 IBT1 := TIBTransaction.Create(nil);
                 IBT1.DefaultDatabase := Database;
                 IBT1.StartTransaction;
                 IBSQL1 := TIBSQL.Create(nil);
                 IBSQL1.Transaction  := IBT1;

                 with IBSQL1 do begin
                   SQL.Clear;
                   SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
                   SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
                   SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
                   ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
                   ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                   ParamByName('TIPO').AsInteger := 2;
                   ExecQuery;
                   Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
                   LCodigo := StrLen(PChar(Codigo));
                   DataActual.FieldByName('COD_CIUDAD_LAB').AsString := RightStr(Codigo,3);
                   DataActual.FieldByName('NOM_CIUDAD_LAB').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
                   if LCodigo = 5 then
                     DataActual.FieldByName('COD_DPTO_LAB').AsString := LeftStr(Codigo,2)
                   else
                     DataActual.FieldByName('COD_DPTO_LAB').AsString := LeftStr(Codigo,1);
                   DataActual.FieldByName('COD_DPTO_LAB').AsInteger := StrToInt(LeftStr(Codigo,2));
                   DataActual.FieldByName('NOM_DPTO_LAB').AsString := IBSQL1.FieldByName('DPTO').AsString;
                   DataActual.FieldByName('DIRECCION_LAB').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
                   DataActual.FieldByName('TELEFONO_LAB').AsString := IBSQL1.FieldByName('TELEFONO1').AsString;
                   Close;
                   FreeAndNil(IBSQL1);
                   IBT1.Commit;
                   FreeAndNil(IBT1);
                 end;

                 IBT1 := TIBTransaction.Create(nil);
                 IBT1.DefaultDatabase := Database;                 
                 IBT1.StartTransaction;
                 IBSQL1 := TIBSQL.Create(nil);
                 IBSQL1.Transaction  := IBT1;

                 with IBSQL1 do begin
                   SQL.Clear;
                   SQL.Add('SELECT "gen$direccion".COD_MUNICIPIO, "gen$municipios".NOMBRE, "gen$municipios".DPTO,DIRECCION,TELEFONO1 FROM "gen$direccion"');
                   SQL.Add('INNER JOIN "gen$municipios" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipios".COD_MUNICIPIO)');
                   SQL.Add('WHERE "gen$direccion".ID_IDENTIFICACION = :ID_IDENTIFICACION AND "gen$direccion".ID_PERSONA = :ID_PERSONA AND "gen$direccion".ID_DIRECCION = :TIPO');
                   ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
                   ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
                   ParamByName('TIPO').AsInteger := 3;
                   ExecQuery;
                   Codigo := IntToStr(IBSQL1.FieldByName('COD_MUNICIPIO').AsInteger);
                   DataActual.FieldByName('COD_CIUDAD_COR').AsString := RightStr(Codigo,3);
                   DataActual.FieldByName('NOM_CIUDAD_COR').AsString := IBSQL1.FieldByName('NOMBRE').AsString;
                   DataActual.FieldByName('NOM_DPTO_COR').AsString := IBSQL1.FieldByName('DPTO').AsString;
                   DataActual.FieldByName('DIRECCION_COR').AsString := IBSQL1.FieldByName('DIRECCION').AsString;
                   IBSQL1.Close;
                   FreeAndNil(IBSQL1);
                   IBT1.Commit;
                   FreeAndNil(IBT1);
                 end;

                 DataActual.FieldByName('FECHA_CORTE').AsDateTime := EdFechaCorte.Date;
                 DataActual.Post;
                 IBSCodeudores.Next;
               end;  // Fin While Codeudores
              IBSCodeudores.Close;
              FreeAndNil(IBSCodeudores);
              IBT2.Commit;
              FreeAndNil(IBT2);
            end; // Fin proceso Codeudores
            IBQuery1.Next;
           end; // fin de while Clientes
           IBQuery1.Close;
           FreeAndNil(IBQuery1);
        end; //fin de with principal
        Application.ProcessMessages;
end;

procedure TfrmProcesarCentrales.CmdProcesarClick(Sender: TObject);
var
NRuta:string;
begin
   CmdProcesar.Enabled := False;
   Application.ProcessMessages;
   NRuta := DBPath1;

   CmdProcesar.Enabled := False;
   EdFechaCorteexit(Sender);

   with IBSClientes do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT first 1 FECHA_CORTE from "col$centralriesgotmp" order by FECHA_CORTE DESC');
      ExecQuery;
      FechaAnterior := FieldByName('FECHA_CORTE').AsDate;
      Close;
      
      SQL.Clear;
      SQL.Add('select * from "col$controlreportedata" where FECHA_CORTE = :FECHA_CORTE');
      ParamByName('FECHA_CORTE').AsDateTime := EdFechaCorte.Date;// EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DayOf(EdFechaCorte.Date));
      ExecQuery;
      if RecordCount > 0 then
       begin
         MessageDlg('El Proceso de Consolidación de Agencias para esta Fecha' +  #13 + 'Ya fue Generado',mtError,[mbok],0);
         cmdGenerar.Enabled := true;
         Exit;
       end;
       Close;
    end;

   IBAgencia.Close;
   IBAgencia.Open;
   IBAgencia.Last;
   IBAgencia.First;

   if TipoProceso = 1 then
    begin
      Database := dmGeneral.IBDatabase1;
      Transaction := dmGeneral.IBTransaction1;
      lbOficina.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';
      DatosOficina;
      IBAgencia.Close;
    end
   else
    begin
      while not IBAgencia.Eof do
       begin
         NRuta := dbpath1 + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + FormatCurr('00',MonthOf(FechaCorte)) + FormatCurr('0000',YearOf(FechaCorte)) + '/';
         lbOficina.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';
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

         DatosOficina;
         ChkActiva.Checked := False;
         ChkCastigada.Checked := False;
         ChkSaldada.Checked := False;
         ChkInsertarTabla.Checked := False;
         Database.Connected := False;

         IBAgencia.Next;
       end;  // fin while Agencias
    end;  //Fin if TipoProceso

     with IBSClientes do
      begin
        if Transaction.InTransaction then
           Transaction.Commit;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('insert into "col$controlreportedata" (FECHA_CORTE,FECHA_PROCESO,ID_EMPLEADO,PROCESADO,DATACREDITO,CIFIN) VALUES(:FECHA_CORTE,:FECHA_PROCESO,:ID_EMPLEADO,:PROCESADO,0,0)');
         ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
         ParamByName('FECHA_PROCESO').AsDate := fFechaActual;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ParamByName('PROCESADO').AsInteger := 1;
         ExecQuery;
         Close;
         IBSClientes.Transaction.Commit;
      end;

      LbOficina.Caption := 'Proceso Terminado con Exito!!! ...';
      CmdGenerar.Enabled := true;
end;

procedure TfrmProcesarCentrales.FormShow(Sender: TObject);
var
    Dia:Word;
    Mes:Word;
    Ano:Word;
begin
        PlanoReporte := TStringList.Create;
        PlanoReporte.Clear;
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        if Transaction1.InTransaction then
          Transaction1.Rollback;
        Transaction1.StartTransaction;

        Ano := YearOf(Date);
        Mes := MonthOf(Date);
        Dia := DayOf(Date);

        Mes := Mes - 1;
        if Mes < 1 then
        begin
          Mes := 12;
          Ano := Ano -1;
        end;

        EdFechaCorte.Date := EncodeDate(Ano,Mes,Dia);

        EdFechaCorte.Date := RecodeDay(EdFechaCorte.Date,Dayof(EndOfAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date))));
        Dia := Dayof(EdFechaCorte.Date);
        if Dia > 30 then Dia := 30;
        EdFechaCorte.Date := RecodeDay(EdFechaCorte.Date,Dia);
        MesCorteAct := IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('00',DayOf(EdFechaCorte.Date));

end;

function TfrmProcesarCentrales.Novedad(IdAgencia: Integer;
  IdColocacion: string;Dias:Integer): Integer;
var
Mora:Integer;
Novedad:integer;
Saldo:Currency;
Estado:Integer;
Edad:string;
begin
        if (Dias < 30) then Novedad := 1 //'01'
        else if (Dias >= 30) and (Dias < 60) then Novedad := 6 //'06'
        else if (Dias >= 60) and (Dias < 90) then Novedad := 7 //'07'
        else if (Dias >= 90) and (Dias < 120) then Novedad := 8 //'08'
        else if (Dias >= 120) and (Dias < 180) then Novedad := 9 //'09'
        else if (Dias >= 180) then Novedad := 12; //'12';

        with IBSCuotas do begin
         Close;
         SQL.Clear;
         SQL.Add('select "col$causaciondiaria".DEUDA, "col$causaciondiaria".ID_EDAD_ACT, "col$causaciondiaria".ID_ESTADO');
         SQL.Add('from "col$causaciondiaria"');
         SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
         SQL.Add('ID_COLOCACION = :ID_COLOCACION and');
         SQL.Add('FECHA_CORTE = :FECHA_CORTE');
         ParamByName('ID_AGENCIA').AsInteger := IDAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
         ExecQuery;
         Saldo := FieldByName('DEUDA').AsCurrency;
         Edad := FieldByName('ID_EDAD_ACT').AsString;
         Estado := FieldByName('ID_ESTADO').AsInteger;

         if (Estado = 2) then Novedad := 12;//'05'

        end;

        Result := Novedad;
end;

function TfrmProcesarCentrales.Adjetivo(IdAgencia: Integer;
  IdColocacion: string): string;
var
Estado:Integer;
Castigado,Fallecido:Integer;
begin
        with IBSCuotas do begin
         Close;
         SQL.Clear;
         SQL.Add('select ID_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where');
         SQL.Add('ES_FALLECIDO = 1');
         ExecQuery;
         Fallecido := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('select ID_ESTADO_COLOCACION from "col$colocacion"');
         SQL.Add('where ');
         SQL.Add('ID_AGENCIA =:"ID_AGENCIA" and');
         SQL.Add('ID_COLOCACION =:"ID_COLOCACION"');
         ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ExecQuery;
         Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;
        end;

        if (Estado = Fallecido) then Result := '16'
        else Result := '00';

end;

procedure TfrmProcesarCentrales.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmProcesarCentrales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmProcesarCentrales.CmdGenerarClick(Sender: TObject);
var
  pos : Integer;
  cadena:String;
  Posicion : Integer;
begin
        IBData.SQL.Clear;
        IBData.SQL.Add('SELECT * FROM "col$centralriesgotmp" c WHERE c.FECHA_CORTE = :FECHA_CORTE ');
        IBData.ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
        if (IBData.Transaction.InTransaction) then
        begin
           IBData.Transaction.Commit;
           IBData.Transaction.StartTransaction;
        end;
        with ClienteData do
        begin
         Close;
         Open;
         //Filter := 'FECHA_CORTE = ' + QuotedStr(IntToStr(YearOf(EdFechaCorte.Date))+'/'+IntToStr(MonthOf(EdFechaCorte.Date))+'/'+IntToStr(DayOf(EdFechaCorte.Date)));
         //Filter := 'FECHA_CORTE = ' + QuotedStr(DateToStr(EdFechaCorte.Date));
         //Filtered := True;
         Last;
         First;
         PlanoReporte.Clear;
         Bar.Min := 1;
         Bar.Max := RecordCount;
         Bar.Step := 1;
         while not ClienteData.Eof do
         begin
           lblColocacion.Caption := FieldByName('ID_COLOCACION').AsString;
           Bar.Position := RecNo;
           cadena := '';
                      cadena := cadena + FieldByName('ID_AGENCIA').AsString;    // 01
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('ID_COLOCACION').AsString; // 02
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('TIPO_IDENTIFICACION').AsString; // 03
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('ID_PERSONA').AsString; // 04
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOMBREDATA').AsString;  // 05
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOMBRECIFIN').AsString; // 06
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_EXP_DOC').AsString; // 07
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('COD_LUGAR_EXP_DOC').AsString; // 08
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_NACIMIENTO').AsString; // 09
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('CIIU').AsString; // 10
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('ESTRATO').AsString; // 11
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('PERSONA_A_CARGO').AsString;  // 12
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_ACT_DATOS').AsString; // 13
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('ESTADO_CIVIL').AsString; // 14
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NIVEL_ESTUDIOS').AsString; // 15
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('INGRESOS').AsString; // 16
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('ACTIVOS').AsString; // 17
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('PASIVOS').AsString; // 18
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_BALANCE').AsString; // 19
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOMBRE_EMPLEADOR').AsString; // 20
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_ING_EMPRESA').AsString; // 21
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('TIPO_CONTRATO').AsString; // 22
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('OCUPACION').AsString; // 23
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('CLASIFICACION').AsString; // 24
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('CALIFICACION').AsString; // 25
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('ESTADO').AsString; // 26
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('DIASMORA').AsString; // 27
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_DESEMBOLSO').AsString; // 28
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_VENCIMIENTO').AsString; // 29
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_EXIGIBILIDAD').AsString; // 30
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_PRESCRIPCION').AsString; // 31
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_PAGO').AsString; // 32
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('PERIOCIDAD_PAGO').AsString; // 33
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('CUOTAS_PAGADAS').AsString; // 34
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('CUOTAS_TOTAL').AsString; // 35
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('CUOTAS_MORA').AsString; // 36
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('VALOR').AsString; // 37
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('SALDO').AsString; // 38
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('VALOR_CUOTA').AsString; // 39
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('VALOR_MORA').AsString; // 40
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('ID_GARANTIA').AsString; // 41
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('VALOR_GARANTIA').AsString; // 42
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_LIMITE_PAGO').AsString; // 43
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('COD_CIUDAD_RAD').AsString; // 44
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOM_CIUDAD_RAD').AsString; // 45
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('COD_CIUDAD_RES').AsString; // 46
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOM_CIUDAD_RES').AsString; // 47
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('COD_DPTO_RES').AsString; // 48
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOM_DPTO_RES').AsString; // 49
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('DIRECCION_RES').AsString; // 50
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('TELEFONO_RES').AsString; // 51
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('COD_CIUDAD_LAB').AsString; // 52
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOM_CIUDAD_LAB').AsString; // 53
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('COD_DPTO_LAB').AsString; // 54
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOM_DPTO_LAB').AsString; // 55
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('DIRECCION_LAB').AsString; // 56
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('TELEFONO_LAB').AsString; // 57
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('COD_CIUDAD_COR').AsString; // 58
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOM_CIUDAD_COR').AsString; // 59
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('NOM_DPTO_COR').AsString; // 60
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('DIRECCION_COR').AsString; // 61
           cadena := cadena + ';';
                      cadena := cadena + FieldByName('FECHA_CORTE').AsString; // 62
           PlanoReporte.Add(cadena);
           Next;
         end;
        end;
        PlanoReporte.SaveToFile('C:/CENTRALES' + FormatDateTime('yyyymmdd',EdFechaCorte.DateTime) + '.CSV');
     //   PlanoErrores.SaveToFile('c:/ErroresDatacredito' + MesCorteAct + '.TXT');
        CmdVer.Enabled := True;
end;

procedure TfrmProcesarCentrales.CmdVerClick(Sender: TObject);
var frmMuestroArchivoData : TfrmMuestroArchivoData;
begin
        frmMuestroArchivoData := TfrmMuestroArchivoData.Create(Self);
        frmMuestroArchivoData.FechaCorte := FormatDateTime('yyyymmdd',EdFechaCorte.DateTime);
        frmMuestroArchivoData.ShowModal;
end;

procedure TfrmProcesarCentrales.EdFechaCorteExit(Sender: TObject);
begin
        Mes := MonthOf(EdFechaCorte.Date);
        Ano := YearOf(EdFechaCorte.Date);
        MesAct := FormatCurr('00',Mes);
        AnoAct := FormatCurr('0000',Ano);
        Mes := Mes - 1;
        if Mes = 0 then begin
          Mes  := 12;
          AnoAnt := FormatCurr('0000',Ano - 1);
        end
        else
          AnoAnt := FormatCurr('0000',Ano);
        MesAnt := FormatCurr('00',Mes);
        MesCorteAnt := AnoAnt + MesAnt;
        MesCorteAct := IntToStr(YearOf(edFechaCorte.Date)) + MesAct;
        FechaCorte := EdFechaCorte.Date;
end;

procedure TfrmProcesarCentrales.InsertarTabla;
var
S1,S2 :TStringList;
Colocacion,Documento:string;
i:Integer;
IBSCodeudores:TIBSQL;
begin
        if (DataActual.RecordCount > 0) then
        begin
         DataActual.ApplyUpdates(0);
         IBActual.Transaction.Commit;
         DataActual.EmptyDataSet;
         DataActual.Close;
         IBActual.Close;
        end;


{        IBSCodeudores := TIBSQL.Create(nil);
        IBSCodeudores.Transaction  := dmGeneral.IBTransaction1;
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        DataActual.Open;
        DataActual.Last;
        Bar.Min := 0;
        Bar.Max := DataActual.RecordCount;
        Bar.Position := 0;
        DataActual.First;
        while not DataActual.Eof do begin
          Bar.Position := DataActual.RecNo;
          Application.ProcessMessages;
          with IBSCodeudores do begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO "col$centralriesgotmp" (ID_AGENCIA, ID_COLOCACION, TIPO_IDENTIFICACION, ID_PERSONA, NOMBREDATA, NOMBRECIFIN,');
            SQL.Add('FECHA_EXP_DOC, COD_LUGAR_EXP_DOC, FECHA_NACIMIENTO, CIIU, ESTRATO, PERSONA_A_CARGO, FECHA_ACT_DATOS, ESTADO_CIVIL,');
            SQL.Add('NIVEL_ESTUDIOS, INGRESOS, ACTIVOS, PASIVOS, FECHA_BALANCE, NOMBRE_EMPLEADOR, FECHA_ING_EMPRESA, TIPO_CONTRATO, OCUPACION,CLASIFICACION,');
            SQL.Add('CALIFICACION, ESTADO, DIASMORA, FECHA_DESEMBOLSO, FECHA_VENCIMIENTO, FECHA_EXIGIBILIDAD, FECHA_PRESCRIPCION, FECHA_PAGO, PERIOCIDAD_PAGO,');
            SQL.Add('CUOTAS_PAGADAS, CUOTAS_TOTAL, CUOTAS_MORA, VALOR, SALDO, VALOR_CUOTA, VALOR_MORA, ID_GARANTIA, VALOR_GARANTIA, FECHA_LIMITE_PAGO,');
            SQL.Add('COD_CIUDAD_RAD, NOM_CIUDAD_RAD, COD_CIUDAD_RES, NOM_CIUDAD_RES, COD_DPTO_RES, NOM_DPTO_RES, DIRECCION_RES, TELEFONO_RES, COD_CIUDAD_LAB,');
            SQL.Add('NOM_CIUDAD_LAB, COD_DPTO_LAB, NOM_DPTO_LAB, DIRECCION_LAB, TELEFONO_LAB, COD_CIUDAD_COR, NOM_CIUDAD_COR, NOM_DPTO_COR, DIRECCION_COR, FECHA_CORTE)');
            SQL.Add('VALUES (:ID_AGENCIA, :ID_COLOCACION, :TIPO_IDENTIFICACION, :ID_PERSONA, :NOMBREDATA, :NOMBRECIFIN, :FECHA_EXP_DOC, :COD_LUGAR_EXP_DOC,');
            SQL.Add(':FECHA_NACIMIENTO, :CIIU, :ESTRATO, :PERSONA_A_CARGO, :FECHA_ACT_DATOS, :ESTADO_CIVIL, :NIVEL_ESTUDIOS, :INGRESOS, :ACTIVOS, :PASIVOS,');
            SQL.Add(':FECHA_BALANCE, :NOMBRE_EMPLEADOR, :FECHA_ING_EMPRESA, :TIPO_CONTRATO, :OCUPACION, :CLASIFICACION, :CALIFICACION, :ESTADO, :DIASMORA, :FECHA_DESEMBOLSO,');
            SQL.Add(':FECHA_VENCIMIENTO, :FECHA_EXIGIBILIDAD, :FECHA_PRESCRIPCION, :FECHA_PAGO, :PERIOCIDAD_PAGO, :CUOTAS_PAGADAS, :CUOTAS_TOTAL, :CUOTAS_MORA,');
            SQL.Add(':VALOR, :SALDO, :VALOR_CUOTA, :VALOR_MORA, :ID_GARANTIA, :VALOR_GARANTIA, :FECHA_LIMITE_PAGO, :COD_CIUDAD_RAD, :NOM_CIUDAD_RAD, :COD_CIUDAD_RES,');
            SQL.Add(':NOM_CIUDAD_RES, :COD_DPTO_RES, :NOM_DPTO_RES, :DIRECCION_RES, :TELEFONO_RES, :COD_CIUDAD_LAB, :NOM_CIUDAD_LAB, :COD_DPTO_LAB, :NOM_DPTO_LAB,');
            SQL.Add(':DIRECCION_LAB, :TELEFONO_LAB, :COD_CIUDAD_COR, :NOM_CIUDAD_COR, :NOM_DPTO_COR, :DIRECCION_COR, :FECHA_CORTE)');
            ParamByName('ID_AGENCIA').AsInteger := DataActual.FieldByName('ID_AGENCIA').AsInteger;
            ParamByName('ID_COLOCACION').AsString := DataActual.FieldByName('ID_COLOCACION').AsString;
            ParamByName('TIPO_IDENTIFICACION').AsInteger := DataActual.FieldByName('TIPO_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := DataActual.FieldByName('ID_PERSONA').AsString;
            ParamByName('NOMBREDATA').AsString := DataActual.FieldByName('NOMBREDATA').AsString;
            ParamByName('NOMBRECIFIN').AsString := DataActual.FieldByName('NOMBRECIFIN').AsString;
            ParamByName('FECHA_EXP_DOC').AsDate :=  DataActual.FieldByName('FECHA_EXP_DOC').AsDateTime;
            ParamByName('COD_LUGAR_EXP_DOC').AsInteger := DataActual.FieldByName('COD_LUGAR_EXP_DOC').AsInteger;
            ParamByName('FECHA_NACIMIENTO').AsDate := DataActual.FieldByName('FECHA_NACIMIENTO').AsDateTime;
            ParamByName('CIIU').AsInteger := DataActual.FieldByName('CIIU').AsInteger;
            ParamByName('ESTRATO').AsString := DataActual.FieldByName('ESTRATO').AsString;
            ParamByName('PERSONA_A_CARGO').AsInteger := DataActual.FieldByName('PERSONA_A_CARGO').AsInteger;
            ParamByName('FECHA_ACT_DATOS').AsDate := DataActual.FieldByName('FECHA_ACT_DATOS').AsDateTime;
            ParamByName('ESTADO_CIVIL').AsInteger := DataActual.FieldByName('ESTADO_CIVIL').AsInteger;
            ParamByName('NIVEL_ESTUDIOS').AsInteger := DataActual.FieldByName('NIVEL_ESTUDIOS').AsInteger;
            ParamByName('INGRESOS').AsCurrency := DataActual.FieldByName('INGRESOS').AsCurrency;
            ParamByName('ACTIVOS').AsCurrency := DataActual.FieldByName('ACTIVOS').AsCurrency;
            ParamByName('PASIVOS').AsCurrency := DataActual.FieldByName('PASIVOS').AsCurrency;
            ParamByName('FECHA_BALANCE').AsDate := DataActual.FieldByName('FECHA_BALANCE').AsDateTime;
            ParamByName('NOMBRE_EMPLEADOR').AsString := DataActual.FieldByName('NOMBRE_EMPLEADOR').AsString;
            ParamByName('FECHA_ING_EMPRESA').AsDate := DataActual.FieldByName('FECHA_ING_EMPRESA').AsDateTime;
            ParamByName('TIPO_CONTRATO').AsInteger := DataActual.FieldByName('TIPO_CONTRATO').AsInteger;
            ParamByName('OCUPACION').AsInteger := DataActual.FieldByName('OCUPACION').AsInteger;            
            ParamByName('CLASIFICACION').AsInteger := DataActual.FieldByName('CLASIFICACION').AsInteger;
            ParamByName('CALIFICACION').AsString := DataActual.FieldByName('CALIFICACION').AsString;
            ParamByName('ESTADO').AsInteger := DataActual.FieldByName('ESTADO').AsInteger;
            ParamByName('DIASMORA').AsInteger := DataActual.FieldByName('DIASMORA').AsInteger;
            ParamByName('FECHA_DESEMBOLSO').AsDate := DataActual.FieldByName('FECHA_DESEMBOLSO').AsDateTime;
            ParamByName('FECHA_VENCIMIENTO').AsDate := DataActual.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
            ParamByName('FECHA_EXIGIBILIDAD').AsDate := DataActual.FieldByName('FECHA_EXIGIBILIDAD').AsDateTime;
            ParamByName('FECHA_PRESCRIPCION').AsDate := DataActual.FieldByName('FECHA_PRESCRIPCION').AsDateTime;
            ParamByName('FECHA_PAGO').AsDate := DataActual.FieldByName('FECHA_PAGO').AsDateTime;
            ParamByName('PERIOCIDAD_PAGO').AsInteger := DataActual.FieldByName('PERIOCIDAD_PAGO').AsInteger;
            ParamByName('CUOTAS_PAGADAS').AsInteger := DataActual.FieldByName('CUOTAS_PAGADAS').AsInteger;
            ParamByName('CUOTAS_TOTAL').AsInteger := DataActual.FieldByName('CUOTAS_TOTAL').AsInteger;
            ParamByName('CUOTAS_MORA').AsInteger := DataActual.FieldByName('CUOTAS_MORA').AsInteger;
            ParamByName('VALOR').AsCurrency := DataActual.FieldByName('VALOR').AsCurrency;
            ParamByName('SALDO').AsCurrency := DataActual.FieldByName('SALDO').AsCurrency;
            ParamByName('VALOR_CUOTA').AsCurrency := DataActual.FieldByName('VALOR_CUOTA').AsCurrency;
            ParamByName('VALOR_MORA').AsCurrency := DataActual.FieldByName('VALOR_MORA').AsCurrency;
            ParamByName('ID_GARANTIA').AsInteger := DataActual.FieldByName('ID_GARANTIA').AsInteger;
            ParamByName('VALOR_GARANTIA').AsCurrency := DataActual.FieldByName('VALOR_GARANTIA').AsCurrency;
            ParamByName('FECHA_LIMITE_PAGO').AsDate := DataActual.FieldByName('FECHA_LIMITE_PAGO').AsDateTime;
            ParamByName('COD_CIUDAD_RAD').AsString := DataActual.FieldByName('COD_CIUDAD_RAD').AsString;
            ParamByName('NOM_CIUDAD_RAD').AsString := DataActual.FieldByName('NOM_CIUDAD_RAD').AsString;
            ParamByName('COD_CIUDAD_RES').AsString := DataActual.FieldByName('COD_CIUDAD_RES').AsString;
            ParamByName('NOM_CIUDAD_RES').AsString := DataActual.FieldByName('NOM_CIUDAD_RES').AsString;
            ParamByName('COD_DPTO_RES').AsString := DataActual.FieldByName('COD_DPTO_RES').AsString;
            ParamByName('NOM_DPTO_RES').AsString := DataActual.FieldByName('NOM_DPTO_RES').AsString;
            ParamByName('DIRECCION_RES').AsString := DataActual.FieldByName('DIRECCION_RES').AsString;
            ParamByName('TELEFONO_RES').AsString := DataActual.FieldByName('TELEFONO_RES').AsString;
            ParamByName('COD_CIUDAD_LAB').AsString := DataActual.FieldByName('COD_CIUDAD_LAB').AsString;
            ParamByName('NOM_CIUDAD_LAB').AsString := DataActual.FieldByName('NOM_CIUDAD_LAB').AsString;
            ParamByName('COD_DPTO_LAB').AsString := DataActual.FieldByName('COD_DPTO_LAB').AsString;
            ParamByName('NOM_DPTO_LAB').AsString := DataActual.FieldByName('NOM_DPTO_LAB').AsString;
            ParamByName('DIRECCION_LAB').AsString := DataActual.FieldByName('DIRECCION_LAB').AsString;
            ParamByName('TELEFONO_LAB').AsString := DataActual.FieldByName('TELEFONO_LAB').AsString;
            ParamByName('COD_CIUDAD_COR').AsString := DataActual.FieldByName('COD_CIUDAD_COR').AsString;
            ParamByName('NOM_CIUDAD_COR').AsString := DataActual.FieldByName('NOM_CIUDAD_COR').AsString;
            ParamByName('NOM_DPTO_COR').AsString := DataActual.FieldByName('NOM_DPTO_COR').AsString;
            ParamByName('DIRECCION_COR').AsString := DataActual.FieldByName('DIRECCION_COR').AsString;
            ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
            IBSCodeudores.ExecQuery;
            IBSCodeudores.Close;
          end;
          DataActual.Next;
        end;

        IBSCodeudores.Transaction.Commit;
        IBSCodeudores.Free;         }
end;

procedure TfrmProcesarCentrales.DatosOficina;
var
Fecha1, Fecha2:TDate;
begin
           //Proceso de Obligaciones Activas
        SentenciaTotal := 'select count(*) as CONTEO from "col$causaciondiaria" where (FECHA_CORTE = ' + QuotedStr(DateToStr(EdFechaCorte.Date)) + ') and (id_estado not in (7,6))';
        Sentencia := 'select * from "col$causaciondiaria" where (FECHA_CORTE =' + QuotedStr(DateToStr(EdFechaCorte.Date)) + ') and (id_estado not in (7,6)) order by ID_COLOCACION ASC';
        ProcesarObligaciones;
        ChkActiva.Checked := True;

        //Proceso de Obligaciones Castigadas
        SentenciaTotal := 'select count(*) as CONTEO from "col$colocacion" where "col$colocacion".ID_ESTADO_COLOCACION = 3 and ("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) > 0';
        Sentencia := 'select "col$colocacion".ID_AGENCIA,"col$colocacion".ID_COLOCACION,"col$colocacion".ID_IDENTIFICACION,"col$colocacion".ID_PERSONA,"col$colocacion".FECHA_DESEMBOLSO,' +
                     '"col$colocacion".FECHA_VENCIMIENTO,"col$colocacion".VALOR_CUOTA,"col$colocacion".ID_TIPO_CUOTA,"col$colocacion".FECHA_INTERES, "col$colocacion".FECHA_CAPITAL, "col$colocacion".AMORTIZA_INTERES,"col$colocacion".ID_ESTADO_COLOCACION,' +
                     '"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".ID_EVALUACION,"col$colocacion".ID_GARANTIA,"col$colocacion".ID_CLASIFICACION,"col$colocacion".ID_CATEGORIA,"col$colocacion".VALOR_DESEMBOLSO,' +
                     '("col$colocacion".VALOR_DESEMBOLSO - ABONOS_CAPITAL) AS SALDO,"col$tiposcuota".INTERES from "col$colocacion" left join "gen$persona"' +
                     'on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)' +
                     'INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)' +
                     'where "col$colocacion".ID_ESTADO_COLOCACION = 3 and ("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) > 0';
        ProcesarObligacionesCerradas;
        ChkCastigada.Checked := True;

        //Proceso Obligaciones Saldadas
        Fecha1 := EncodeDate(YearOf(FechaCorte),MonthOf(FechaCorte),01);
        Fecha2 := RecodeDay(EdFechaCorte.Date,Dayof(EndOfAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date))));;
        SentenciaTotal := 'select count(*) as CONTEO from "col$colocacion" where (FECHA_SALDADO between ' + QuotedStr(DateToStr(Fecha1)) + ' and ' + QuotedStr(DateToStr(Fecha2)) + ') and (fecha_desembolso not between ' + QuotedStr(DateToStr(Fecha1)) + ' and ' + QuotedStr(DateToStr(Fecha2)) + ')';
        sentencia := 'select "col$colocacion".ID_AGENCIA,"col$colocacion".ID_COLOCACION,"col$colocacion".ID_IDENTIFICACION,"col$colocacion".ID_PERSONA,' +
                     '"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".FECHA_VENCIMIENTO,"col$colocacion".VALOR_CUOTA,"col$colocacion".FECHA_INTERES, "col$colocacion".FECHA_CAPITAL,' +
                     '"col$colocacion".ID_TIPO_CUOTA,"col$colocacion".AMORTIZA_INTERES,"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".VALOR_DESEMBOLSO,' +
                     '("col$colocacion".VALOR_DESEMBOLSO - ABONOS_CAPITAL) AS SALDO,"col$colocacion".ID_CLASIFICACION,"col$colocacion".ID_CATEGORIA,"col$colocacion".ID_GARANTIA,' +
                     '"col$tiposcuota".INTERES,"col$colocacion".ID_LINEA,"col$colocacion".ID_ESTADO_COLOCACION, "col$colocacion".FECHA_SALDADO from "col$colocacion"' +
                     ' INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA) where ' +
                     '(FECHA_SALDADO between ' + QuotedStr(DateToStr(Fecha1)) + ' and ' + QuotedStr(DateToStr(Fecha2)) + ') and (fecha_desembolso not between ' + QuotedStr(DateToStr(Fecha1)) + ' and '+ QuotedStr(DateToStr(Fecha2)) + ')' +
                     ' and "col$colocacion".ID_COLOCACION NOT IN (SELECT ID_COLOCACION FROM "TRAS$COLOCACION" WHERE FECHA_TRASLADO BETWEEN ' + QuotedStr(DateToStr(Fecha1)) + ' and ' + QuotedStr(DateToStr(Fecha2)) + ')';
        ProcesarObligacionesCerradas;
        ChkSaldada.Checked := True;

        //Proceso Insertar Registros en Tabla
        InsertarTabla;
        ChkInsertarTabla.Checked := True;
end;

procedure TfrmProcesarCentrales.DataActualBeforeApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
        ShowMessage('Listo para Aplicar Cambios!!');
end;

procedure TfrmProcesarCentrales.DataActualAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
        ShowMessage('Cambios Aplicados!!');
end;

end.
