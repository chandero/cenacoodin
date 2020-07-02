unit UnitInformeCobroConstante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XStringGrid, StdCtrls, Buttons, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, DateUtils, IBSQL, pr_Common, pr_TxClasses, pr_parser,
  DBClient;

type
  TfrmInformeCobroConstante = class(TForm)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    GridColocaciones: TXStringGrid;
    Panel5: TPanel;
    CmdProcesar: TBitBtn;
    CmdImprimir: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    Panel2: TPanel;
    FechaBarrido: TLabel;
    EdParametro: TEdit;
    IBQuery2: TIBQuery;
    IBQTabla: TClientDataSet;
    IBQTablaAGENCIA: TIntegerField;
    IBQTablaCOLOCACION: TStringField;
    IBQTablaCUENTA: TStringField;
    IBQTablaNIT: TStringField;
    IBQTablaNOMBRE: TStringField;
    IBQTablaPRIMERAPELLIDO: TStringField;
    IBQTablaSEGUNDOAPELLIDO: TStringField;
    IBQTablaAHORROS: TIntegerField;
    IBQTablaSALDODEUDA: TIntegerField;
    IBQTablaVALORCUOTA: TIntegerField;
    IBQTablaDIAS: TIntegerField;
    IBQTablaFECHACAPITAL: TDateField;
    IBQTablaFECHAINTERES: TDateField;
    IBQTablaTIPOCUOTA: TStringField;
    ReporteCarteraAhorros: TprTxReport;
    procedure CmdProcesarClick(Sender: TObject);
    procedure EdParametroEnter(Sender: TObject);
    procedure EdParametroExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdImprimirClick(Sender: TObject);
    procedure ReporteCarteraAhorrosUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
  private
    { Private declarations }
    function BuscarAhorros(Id:Integer;Documento:string) : Currency;
    function BuscarAportes(Id:Integer;Documento:string) : Currency;
    function Cuenta(ID: integer; Documento: string): string;
  public
    { Public declarations }
  end;

var
  frmInformeCobroConstante: TfrmInformeCobroConstante;
  Id:Integer;
  Documento:string;
  Parametro:Currency;
  Tabla:string;
implementation

{$R *.dfm}
uses UnitdmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso,UnitVistaPreliminar,
     UnitdmColocacion;


procedure TfrmInformeCobroConstante.CmdProcesarClick(Sender: TObject);
var Fecha:TDate;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
    CuotasaLiquidar:Integer;
    Ahorros:Currency;

    CuotasLiq:TCuotasLiq;
    AF:PCuotasLiq;
    I: Integer;
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
    Colocacion : string;
    vTotalLiquidacion:Currency;
    Diferencia:Currency;
begin
        CmdProcesar.Enabled := False;
        Application.ProcessMessages;
        FechaHoy := Date;
        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('where ID_ESTADO_COLOCACION = 0');

          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
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
          SQL.Add('where "col$colocacion".ID_ESTADO_COLOCACION = 0');
          SQL.Add('Order by "col$colocacion".ID_COLOCACION DESC, "col$colocacion".FECHA_INTERES DESC');
          try
            Open;
            Last;
            First;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Buscando Colocaciones';
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Ejecutar;
              while not Eof do
               begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
                Application.ProcessMessages;
                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                Fecha := IncDay(Fecha);
                Dias := DiasEntre(Fecha,FechaHoy);
                if Int(Fecha) <= Int(FechaHoy) then
                 begin
                   IdAgencia := FieldByName('ID_AGENCIA').AsInteger;
                   Colocacion := FieldByName('ID_COLOCACION').AsString;
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
                   if FieldByName('ID_TIPO_CUOTA').AsInteger = 1 then
                      LiquidarCuotasFija(IdAgencia,Colocacion,1,FechaHoy,
                      CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                      FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                   else if FieldByName('ID_TIPO_CUOTA').AsInteger = 2 then
                      LiquidarCuotasVarAnticipada(IdAgencia,Colocacion,1,FechaHoy,
                      CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                      FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga)
                   else if FieldByName('ID_TIPO_CUOTA').AsInteger = 3 then
                      LiquidarCuotasVarVencida(IdAgencia,Colocacion,1,FechaHoy,
                      CuotasLiq,Clasificacion,Garantia,Categoria,Estado,ValorCuota,
                      FechaPagoK,FechaPagoI,TipoInteres,ValorTasa,ValorMora,PuntosAdic,SaldoActual,AmortizaK,AmortizaI,DiasProrroga);

                   Id := FieldByName('ID_IDENTIFICACION').AsInteger;
                   Documento := FieldByName('ID_PERSONA').AsString;
                   Ahorros := BuscarAhorros(Id,Documento);
                   if CuotasLiq.Lista.Count <= 0 then
                   begin
                     Next;
                     Continue;
                   end;
                   I := CuotasLiq.Lista.Count - 1;
                   AF := CuotasLiq.Lista.Items[I];
                   vTotalLiquidacion := AF^.Debito;
                   Diferencia := vTotalLiquidacion - Ahorros;
                   if (Diferencia > 0) and (Diferencia <= Parametro) then
                    begin
                      Conteo := Conteo + 1;
                      GridColocaciones.RowCount := Conteo + 1;
                      GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                      GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                          FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                          FieldByName('NOMBRE').AsString;
                      GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                      GridColocaciones.Cells[3,Conteo] := CurrToStr(vTotalLiquidacion); //FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                      GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                      GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                      GridColocaciones.Cells[6,Conteo] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                      GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                      GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                      GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                      GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                      GridColocaciones.Cells[11,Conteo] := FormatCurr('$#,#0.00',Ahorros);

                      IBQTabla.Append;
                      IBQTabla.FieldByName('AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                      IBQTabla.FieldByName('COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                      IBQTabla.FieldByName('CUENTA').AsString := cuenta(IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger,IBQuery1.FieldByName('ID_PERSONA').AsString);
                      IBQTabla.FieldByName('NIT').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                      IBQTabla.FieldByName('PRIMERAPELLIDO').AsString := Trim(IBQuery1.Fieldbyname('PRIMER_APELLIDO').AsString);
                      IBQTabla.FieldByName('SEGUNDOAPELLIDO').AsString := Trim(IBQuery1.Fieldbyname('SEGUNDO_APELLIDO').AsString);
                      IBQTabla.FieldByName('NOMBRE').AsString := Trim(IBQuery1.FieldByName('NOMBRE').AsString);
                      IBQTabla.FieldByName('AHORROS').AsCurrency := Ahorros;
                      IBQTabla.FieldByName('SALDODEUDA').AsCurrency := IBQuery1.FieldByName('SALDO').AsCurrency;
                      IBQTabla.FieldByName('VALORCUOTA').AsCurrency := vTotalLiquidacion; //IBQuery1.FieldByName('VALOR_CUOTA').AsCurrency;
                      IBQTabla.FieldByName('DIAS').AsInteger := Dias;
                      IBQTabla.FieldByName('TIPOCUOTA').AsString := IBQuery1.FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                      IBQTabla.FieldByName('FECHACAPITAL').AsDateTime := IBQuery1.FieldByName('FECHA_CAPITAL').AsDateTime;
                      IBQTabla.FieldByName('FECHAINTERES').AsDateTime := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                      IBQTabla.Post;
                    end; // fin if vTotalLiquidacion
                 end; // fin Fecha
                Next;
               end; // fin de while
              frmProgreso.Cerrar;
          end;
          except
            Screen.Cursor := Save_Cursor;
            Close;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            Exit;
          end;
        end;
    Screen.Cursor := Save_Cursor;

    if IBQTabla.RecordCount > 0 then
      CmdImprimir.Enabled := True
    else
      MessageDlg('No se Encontraron Colocaciones con los Parámetros Establecidos',mtError,[mbcancel],0);
end;

function TfrmInformeCobroConstante.BuscarAhorros(Id: integer;
  Documento: string): Currency;
var Saldo,Movimiento,Canje:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
begin

  with IBSQL2 do begin
     Close;
     sql.Clear;
     Sql.Add('select * from P_CAP_0008_JUD (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('ID_IDENTIFICACION').AsInteger := Id;
     ParamByName('ID_PERSONA').AsString := Documento;
     ExecQuery;
     Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     Digito := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;

     SQL.Clear;
     SQL.Add('Select * from SALDO_DISPONIBLE (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
     ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
     ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
     ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
     try
      ExecQuery;
      if RecordCount < 1 then
        Saldo := 0
      else
        Saldo := FieldByName('SALDO_DISPONIBLE').AsCurrency;
     except
      MessageDlg('Error Consultando Saldo Ahorros',mtError,[mbcancel],0);
      raise;
      Exit;
     end;

     Result := Saldo;
  end;
end;

function TfrmInformeCobroConstante.BuscarAportes(Id: integer;
  Documento: string): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
begin
           with IBSQL2 do begin
                Close;
                SQL.Clear;
                SQL.Add('Select First 1 "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA,"cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestrotitular"');
                SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND');
                SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1 and');
                SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
                ParamByName('ID_IDENTIFICACION').AsInteger := Id;
                ParamByName('ID_PERSONA').AsString  := Documento;
                ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                try
                  ExecQuery;
                  if RecordCount < 1 then
                  begin
                   Saldo := 0;
//                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
//                   EdNumeroCap.SetFocus;
//                   Exit;
                  end;
                  Saldo := FieldByName('SALDO_INICIAL').AsCurrency;
                  Ag := FieldByName('ID_AGENCIA').AsInteger;
                  Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
                  Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                except
                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   Result := 0;
                   Exit;
                end;

                Close;
                SQL.Clear;
                SQL.Add('SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS MOVIMIENTO from "cap$maestro"');
                SQL.Add('LEFT JOIN "cap$extracto" ON ("cap$maestro".ID_AGENCIA = "cap$extracto".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$extracto".ID_TIPO_CAPTACION) AND ');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$extracto".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$extracto".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
//                SQL.Add('and "cap$extracto".ID_TIPO_MOVIMIENTO <> 7');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
                ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
                try
                  ExecQuery;
                  if RecordCount < 1 then
                   Movimiento := 0
                  else
                   Movimiento := FieldByName('MOVIMIENTO').AsCurrency;
                except
                   MessageDlg('Error Consultando Movimientos',mtError,[mbcancel],0);
                   Movimiento := 0;
                end;

                Close;
                SQL.Clear;
                SQL.Add('SELECT SUM("cap$canje".VALOR_CHEQUE + "cap$canje".VALOR_MONEDAS) AS CANJE');
                SQL.Add('FROM');
                SQL.Add('"cap$maestro"');
                SQL.Add('LEFT JOIN "cap$canje" ON ("cap$maestro".ID_AGENCIA = "cap$canje".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$canje".ID_TIPO_CAPTACION) AND ("cap$maestro".NUMERO_CUENTA = "cap$canje".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$canje".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$canje".LIBERADO = 0 and');
                SQL.Add('"cap$canje".DEVUELTO = 0');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                try
                 ExecQuery;
                 if RecordCount < 1 then
                   Canje := 0
                 else
                   Canje := FieldByName('CANJE').AsCurrency;
                except
                   MessageDlg('Error Consultando Canje',mtError,[mbcancel],0);
                   Canje := 0;
                end;
         end;
         Saldo := Saldo + Movimiento;
         Disponible := Saldo - Canje;
         Result := Disponible;
end;

procedure TfrmInformeCobroConstante.EdParametroEnter(Sender: TObject);
begin
        EdParametro.SelectAll;
end;

procedure TfrmInformeCobroConstante.EdParametroExit(Sender: TObject);
begin
         if EdParametro.Text = '' then Parametro := 0
        else
         begin
           Parametro := StrToCurr(EdParametro.Text);
           EdParametro.Text := FormatCurr('#,#0',Parametro);
         end;
end;

procedure TfrmInformeCobroConstante.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCobroConstante.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        EdParametro.SetFocus;
end;

procedure TfrmInformeCobroConstante.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmInformeCobroConstante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        if Tabla <> '' then
         begin
           With IBQuery1 do
             begin
              Close;
              SQL.Clear;
              SQL.Add('drop table ' + Tabla);
              Open;
              Close;
              Transaction.Commit;
              Transaction.StartTransaction;
            end;
         end;
end;

procedure TfrmInformeCobroConstante.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeCobroConstante.CmdImprimirClick(Sender: TObject);
begin
        Empleado;

        ReporteCarteraAhorros.Variables.ByName['Empresa'].AsString := Empresa;
        ReporteCarteraAhorros.Variables.ByName['Nit'].AsString := Nit;
        ReporteCarteraAhorros.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
        ReporteCarteraAhorros.Variables.ByName['Hoy'].AsDateTime := Date;
        ReporteCarteraAhorros.Variables.ByName['constante'].AsDouble := Parametro;

        if ReporteCarteraAhorros.PrepareReport then
         begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := ReporteCarteraAhorros;
           frmVistaPreliminar.ShowModal;
         end;
end;

procedure TfrmInformeCobroConstante.ReporteCarteraAhorrosUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var
Cuenta,Digito:string;
Ahorros:Currency;
Fecha:TDate;
Dias:Integer;
begin

    if (VarName = 'Cuenta') then
     begin
       with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select First 1 "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA,"cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestrotitular"');
          SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
          SQL.Add('Where');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
          SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1');
          ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString  := IBQuery1.FieldByName('ID_PERSONA').AsString;
          ExecQuery;
          Cuenta := FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger);
          Digito := IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
          Close;
        end;
      _vSetAsString(Value,Cuenta + '-' + Digito);
       IsProcessed := True;
     end;

    if (VarName = 'Ahorros') then
     begin
       Ahorros := BuscarAhorros(IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger,IBQuery1.FieldByName('ID_PERSONA').AsString);
      _vSetAsDouble(Value,Ahorros);
       IsProcessed := True;
     end;

    if (VarName = 'Dias') then
     begin
       Fecha := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
       if IBQuery1.FieldByName('INTERES').AsString = 'V' then
          Fecha := CalculoFecha(Fecha,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
       Fecha := IncDay(Fecha);
       Dias := DiasEntre(Fecha,Date);
      _vSetAsInteger(Value,Dias);
       IsProcessed := True;
     end;

end;

function TfrmInformeCobroConstante.Cuenta(ID: integer;
  Documento: string): string;
var
Cuenta:string;
begin
       with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select First 1 "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA,"cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestrotitular"');
          SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
          SQL.Add('Where');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
          SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1');
          ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString  := IBQuery1.FieldByName('ID_PERSONA').AsString;
          ExecQuery;
          Cuenta := FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger) + '-' +
                    IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
          Close;
        end;
        Result := Cuenta;
end;

end.
