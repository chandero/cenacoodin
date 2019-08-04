unit UnitCarteraFogacoop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, DateUtils,
  Grids, XStringGrid, ExtCtrls, ComCtrls, IBSQL, StrUtils, pr_Common,
  pr_TxClasses, Math, pr_parser, Printers, IBDatabase;

type
  TfrmCarteraFogacoop = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    Panel5: TPanel;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdReporte: TBitBtn;
    Reporte: TprTxReport;
    Label5: TLabel;
    LblEstado: TLabel;
    Database: TIBDatabase;
    Transaction: TIBTransaction;
    IBAgencia: TIBQuery;
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
    procedure Cartera;
    { Private declarations }
  public
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
  IBSQL2,IBSQL3:TIBSQL;
  IBQuery1,IBQuery3,IBTasa:TIBQuery;
  IBT1,IBT2,IBT3,IBT4:TIBTransaction;

implementation

{$R *.dfm}

uses unitdmGeneral, Unitglobales, unitglobalescol, UnitDmcolocacion, UnitPantallaProgreso;

procedure TfrmCarteraFogacoop.EdFechaCorteEnter(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

procedure TfrmCarteraFogacoop.EdFechaCorteExit(Sender: TObject);
begin
        FechaCorte := EdFechaCorte.Date;
end;

procedure TfrmCarteraFogacoop.CmdProcesarClick(Sender: TObject);
var
NRuta:string;
begin
   CmdProcesar.Enabled := False;
   Application.ProcessMessages;
   NRuta := DBPath1;

   IBAgencia.Close;
   IBAgencia.Open;
   IBAgencia.Last;
   IBAgencia.First;

   if TipoProceso = 1 then
    begin
      lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';    
      IBQuery1 := TIBQuery.Create(Application);
      IBT1 := TIBTransaction.Create(Application);
      IBQuery1.Transaction := dmgeneral.IBTransaction1;
      IBT1.DefaultDatabase := dmgeneral.IBDatabase1;

      IBSQL2 := TIBSQL.Create(Application);
      IBT2 := TIBTransaction.Create(Application);
      IBSQL2.Transaction := dmgeneral.IBTransaction1;
      IBT2.DefaultDatabase := dmgeneral.IBDatabase1;

      IBSQL3 := TIBSQL.Create(Application);
      IBT3 := TIBTransaction.Create(Application);
      IBSQL3.Transaction := dmgeneral.IBTransaction1;
      IBT3.DefaultDatabase := dmgeneral.IBDatabase1;

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

         IBQuery1 := TIBQuery.Create(Application);
         IBT1 := TIBTransaction.Create(Application);
         IBQuery1.Transaction := IBT1;
         IBT1.DefaultDatabase := Database;

         IBSQL2 := TIBSQL.Create(Application);
         IBT2 := TIBTransaction.Create(Application);
         IBSQL2.Transaction := IBT2;
         IBT2.DefaultDatabase := Database;

         IBSQL3 := TIBSQL.Create(Application);
         IBT3 := TIBTransaction.Create(Application);
         IBSQL3.Transaction := IBT3;
         IBT3.DefaultDatabase := Database;

         Cartera;
         IBAgencia.Next;
       end;  // fin while Agencias
    end;  //Fin if TipoProceso

   LblEstado.Caption := 'Proceso Culminado con Exito!';
   CmdReporte.Enabled := True;
end;

procedure TfrmCarteraFogacoop.Cartera;
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
    MesTrece : String;
    MesMayor : String;
    MesActual : String;
    AnoFP : Integer;
    MesFP : Integer;
    MesTabla : Integer;
    MesContador : Integer;
    AR:PCartera;
    Archivo:TextFile;
    Cadena:string;
begin
   Mes := MonthOf(FechaCorte);
   Ano := YearOf(FechaCorte);
   MesContador := Mes;

   Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + IntToStr(MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
   AssignFile(Archivo,'C:/PlanosFinMes/RECCARTERA' + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + Cadena + '.TXT');
   Rewrite(Archivo);
   Cadena := 'CLASIFICACION' + #9 + 'MES' + #9 + 'SALDO' + #9 + 'CAPITAL' + #9 + 'INTERES';
   Writeln(Archivo,Cadena);

   for I := 1 to 13 do
    begin
      MesContador := MesContador + 1;
      if MesContador > 12 then
        begin
          Ano := Ano + 1;
          MesContador := 1;
        end;
      with IBQuery1 do begin
        SQL.Clear;
        if Transaction.InTransaction then
          Transaction.Commit;
        Transaction.StartTransaction;
        SQL.Add('update "col$carteraf" set');
        SQL.Add('"col$carteraf".ANOMES = :"ANOMES",');
        SQL.Add('"col$carteraf".SALDO = 0,');
        SQL.Add('"col$carteraf".CAPITAL = 0,');
        SQL.Add('"col$carteraf".INTERES = 0');
        SQL.Add('where "col$carteraf".MES = :"MES"');
        ParamByName('ANOMES').AsString := CurrToStr(Ano) + FormatCurr('00',MesContador);
        ParamByName('MES').AsInteger := I;
        Open;
        Close;
      end;
    end;

   if ibquery1.Transaction.InTransaction then
     IBQuery1.Transaction.Commit;
   IBQuery1.Transaction.StartTransaction;

   if ibsql2.Transaction.InTransaction then
     IBSQL2.Transaction.Commit;
   IBSQL2.Transaction.StartTransaction;

   if ibsql3.Transaction.InTransaction then
     IBSQL3.Transaction.Commit;
   IBSQL3.Transaction.StartTransaction;

   with IBQuery1 do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT FIRST 1 MES, ANOMES FROM "col$carteraf" ORDER BY MES DESC');
     Open;
     MesTrece := FieldByName('ANOMES').AsString;

     Close;
     SQL.Clear;
     SQL.Add('SELECT');
     SQL.Add('COUNT(*) AS TOTAL');
     SQL.Add('FROM');
     SQL.Add('"col$colocacion"');
     SQL.Add('where ID_ESTADO_COLOCACION <= 2 and');
     SQL.Add('ID_EVALUACION = :"ID_EVALUACION1"');
     ParamByName('ID_EVALUACION1').AsString := 'A';
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
      Close;
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
      SQL.Add('"col$colocacion".ID_EVALUACION = :"ID_EVALUACION1"');
      SQL.Add('Order by "col$colocacion".ID_COLOCACION');
      ParamByName('ID_EVALUACION1').AsString := 'A';
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

         IBQuery3 := TIBQuery.Create(Application);
         IBT4 := TIBTransaction.Create(Application);
         IBQuery3.Transaction := dmgeneral.IBTransaction1;
         IBT4.DefaultDatabase := dmgeneral.IBDatabase1;

         TasaFijaE := BuscoTasaEfectivaMaxima1(IBQuery3,FechaCorte,Clasificacion,'A');
         TasaDtfE := buscotasaefectivamaximaDTFNueva(IBQuery3,FechaCorte);
         TasaIpcE := BuscoTasaEfectivaMaximaIPCNueva(IBQuery3);

         IBQuery3.Free;

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

           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('select ');
           IBSQL2.SQL.Add('"col$tablaliquidacion".ID_COLOCACION,');
           IBSQL2.SQL.Add('"col$tablaliquidacion".FECHA_A_PAGAR,');
           IBSQL2.SQL.Add('"col$tablaliquidacion".CAPITAL_A_PAGAR,');
           IBSQL2.SQL.Add('"col$tablaliquidacion".INTERES_A_PAGAR');
           IBSQL2.SQL.Add('from "col$tablaliquidacion"');
           IBSQL2.SQL.Add('where ');
           IBSQL2.SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION" and');
           IBSQL2.SQL.Add('"col$tablaliquidacion".PAGADA = 0');
           IBSQL2.ParamByName('ID_COLOCACION').AsString := colocacion;
           IBSQL2.ExecQuery;

           while not IBSQL2.Eof do
            begin
              if Saldo <= 0 then Break;
              FechaaPagar := IBSQL2.FieldByName('FECHA_A_PAGAR').AsDateTime;
              CapitalaPagar := abs(SimpleRoundTo(IBSQL2.FieldByName('CAPITAL_A_PAGAR').AsCurrency,0));
              InteresaPagar := abs(SimpleRoundTo(IBSQL2.FieldByName('INTERES_A_PAGAR').AsCurrency,0));
              if Colocacion <> IBSQL2.FieldByName('ID_COLOCACION').AsString then cambio := True;
              if cambio = False then
                Saldo := Saldo - CapitalaPagar
              else
                Saldo := 0;

              if TipoInteres = 'A' then Saldo := Saldo - CapitalaPagar;
              InteresCalculado := SimpleRoundTo((Saldo * Tasa / 100 * Amortizacion) / 360,0);


              TCapital := TCapital + CapitalaPagar;
              TInteres := TInteres + InteresaPagar;
              TCuotas := TCuotas + 1;

              MesActual := FormatCurr('0000',yearof(FechaaPagar)) + FormatCurr('00',MonthOf(FechaaPagar));
              if MesActual >= MesTrece then
               begin
                 IBSQL3.Close;
                 IBSQL3.SQL.Clear;
                 IBSQL3.SQL.Add('update "col$carteraf" set');
                 IBSQL3.SQL.Add('SALDO = SALDO + :SALDO,');
                 IBSQL3.SQL.Add('CAPITAL = CAPITAL + :CAPITAL,');
                 IBSQL3.SQL.Add('INTERES = INTERES + :INTERES');
                 IBSQL3.SQL.Add('where');
                 IBSQL3.SQL.Add('"col$carteraf".CLASIFICACION = :"CLASIFICACION" and');
                 IBSQL3.SQL.Add('"col$carteraf".ANOMES = :"ANOMES"');
                 IBSQL3.ParamByName('CLASIFICACION').AsInteger := Clasificacion;
                 IBSQL3.ParamByName('ANOMES').AsString := MesTrece;
                 IBSQL3.ParamByName('SALDO').AsCurrency := abs(Saldo);
                 IBSQL3.ParamByName('CAPITAL').AsCurrency := abs(CapitalaPagar);
                 IBSQL3.ParamByName('INTERES').AsCurrency := abs(InteresCalculado);
                 IBSQL3.ExecQuery;
                 IBSQL3.Transaction.CommitRetaining;
               end
              else
               begin
                 IBSQL3.Close;
                 IBSQL3.SQL.Clear;
                 IBSQL3.SQL.Add('update "col$carteraf" set');
                 IBSQL3.SQL.Add('SALDO = SALDO + :SALDO,');
                 IBSQL3.SQL.Add('CAPITAL = CAPITAL + :CAPITAL,');
                 IBSQL3.SQL.Add('INTERES = INTERES + :INTERES');
                 IBSQL3.SQL.Add('where');
                 IBSQL3.SQL.Add('"col$carteraf".CLASIFICACION = :"CLASIFICACION" and');
                 IBSQL3.SQL.Add('"col$carteraf".ANOMES = :"ANOMES"');
                 IBSQL3.ParamByName('CLASIFICACION').AsInteger := Clasificacion;
                 IBSQL3.ParamByName('ANOMES').AsString := FormatCurr('0000',yearof(FechaaPagar)) + FormatCurr('00',MonthOf(FechaaPagar));
                 IBSQL3.ParamByName('SALDO').AsCurrency := abs(Saldo);
                 IBSQL3.ParamByName('CAPITAL').AsCurrency := abs(CapitalaPagar);
                 IBSQL3.ParamByName('INTERES').AsCurrency := abs(InteresCalculado);
                 IBSQL3.ExecQuery;
                 IBSQL3.Transaction.CommitRetaining;
               end;

              IBSQL2.Next;
           end; // fin while tabla liquidacion

           ibquery1.Next;
          end; //fin de while colocaciones

          ibsql3.Transaction.Commit;


          if ibsql2.Transaction.InTransaction then
            IBSQL2.Transaction.Commit;
          IBSQL2.Transaction.StartTransaction;

          IBSQL2.Close;
          IBSQL2.SQL.Clear;
          IBSQL2.SQL.Add('select clasificacion, mes, saldo, capital, interes  from "col$carteraf" group by clasificacion, mes, saldo, capital, interes');
          IBSQL2.ExecQuery;
          while not IBSQL2.Eof do begin
            New(AR);
            AR^.Clasificacion := IBSQL2.FieldByName('CLASIFICACION').AsInteger;
            AR^.Mes := IBSQL2.FieldByName('MES').AsInteger;
            AR^.Saldo := IBSQL2.FieldByName('SALDO').AsCurrency;
            AR^.Capital := IBSQL2.FieldByName('CAPITAL').AsCurrency;
            AR^.Intereses := IBSQL2.FieldByName('INTERES').AsCurrency;
            Cadena := IntToStr(AR^.Clasificacion) + #9 + IntToStr(AR^.Mes) + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + FormatCurr('0.00',AR^.Capital) + #9 + FormatCurr('0.00',AR^.Intereses);
            Dispose(AR);
            Writeln(Archivo,Cadena);
            IBSQL2.Next;
          end;
          IBSQL2.Close;

          CloseFile(Archivo);
          frmProgreso.Cerrar;
          Transaction.Commit;
          Database.Close;
          IBQuery1.Free;
          IBSQL2.Free;
          IBSQL3.Free;
        end; // fin with
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
             Reporte.PreviewPreparedReport(True);
{            begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Reporte;
              frmVistaPreliminar.ShowModal;
            end;}

           Close;
         end;
end;

end.
