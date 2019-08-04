unit UnitMovimientoCredito;

interface

uses
  DateUtils, StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, Grids, StdCtrls,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, JvSpecialProgress, XLSfile;

type
  TfrmMovimientoCredito = class(TForm)
    Bar2: TJvSpecialProgress;
    Bar1: TJvSpecialProgress;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    btnAExcel: TBitBtn;
    Sg1: TStringGrid;
    IBQuery1: TIBQuery;
    Cds1: TClientDataSet;
    sd1: TSaveDialog;
    IBSQL2: TIBSQL;
    IBSQL1: TIBQuery;
    Bar3: TJvSpecialProgress;
    IBQuery2: TIBQuery;
    Cds1Cuenta: TStringField;
    Cds1Credito: TCurrencyField;
    Cds1Interes: TCurrencyField;
    Cds1Saldo: TCurrencyField;
    Sg2: TStringGrid;

    Label3: TLabel;
    JvSaldo: TJvCurrencyEdit;
    IBGMF: TIBQuery;
    Edit1: TEdit;
    ClientDataSet1: TClientDataSet;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimientoCredito: TfrmMovimientoCredito;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmMovimientoCredito.btnProcesarClick(Sender: TObject);
var
  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Dr:string;
  Dpto :string;
  Mn:string;
  Total:Integer;
  Fila,jFila:Integer;
  Saldo,Credito,Interes:Currency;
  Saldo1,Credito1,Interes1:Currency;
  Cuenta:string;
  iAgencia,iTipo,iCuenta,iDigito:Integer;
  vCodMunicipio :string;
  _sNombre :string;
  _cSaldoCheque :Currency;
begin
        Fila := -1;
        jFila := -1;
        Application.ProcessMessages;
        Sg1.RowCount := 1;
        Sg1.ColWidths[0] := 40;
        Sg1.ColWidths[1] := 100;
        Sg1.ColWidths[2] := 10;
        Sg1.ColWidths[3] := 80;
        Sg1.ColWidths[4] := 80;
        Sg1.ColWidths[5] := 80;
        Sg1.ColWidths[6] := 80;
        Sg1.ColWidths[7] := 80;
        Sg1.ColWidths[8] := 100;
        Sg1.ColWidths[9] := 50;
        Sg1.ColWidths[10] := 50;
        Sg1.ColWidths[11] := 50;
        Sg1.ColWidths[12] := 80;
        Sg1.ColWidths[13] := 80;
        Sg1.ColWidths[14] := 80;
        Sg1.ColWidths[15] := 80;
        //Sg1.ColWidths[16] := 10;//GMF
        //Sg1.ColWidths[17] := 100;//MUNICIPIO
//***********************************//
        Sg2.ColWidths[0] := 10;
        Sg2.ColWidths[1] := 80;
        Sg2.ColWidths[2] := 10;
        Sg2.ColWidths[3] := 80;
        Sg2.ColWidths[4] := 200;
        Sg2.ColWidths[5] := 200;
        Sg2.ColWidths[6] := 200;
        Sg2.ColWidths[7] := 100;


        with IBQuery1 do
        begin
         Transaction.StartTransaction;
         {Close;
         SQL.Clear;
         SQL.Add('select');
         SQL.Add('count(*) as TOTAL');
         SQL.Add('from');
         SQL.Add('"gen$persona"');
         SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and');
         SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA and "gen$direccion".ID_DIRECCION = 1 ');
         SQL.Add('and "gen$direccion".ID_DIRECCION = 1)');
         try
           Open;
           Total := FieldByName('TOTAL').AsInteger;
         except
           Transaction.Rollback;
           raise;
         end;
         Close;

         Bar3.Maximum := Total;}

         SQL.Clear;
         SQL.Add('select distinct');
         SQL.Add('"gen$persona".ID_IDENTIFICACION,');
         SQL.Add('"gen$persona".ID_PERSONA,');
         SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
         SQL.Add('"gen$direccion".DIRECCION || '' '' || "gen$direccion".BARRIO AS DIRECCION,');
         SQL.Add('"gen$direccion".MUNICIPIO AS MUNICIPIO,"gen$direccion".COD_MUNICIPIO');
         SQL.Add('from');
         SQL.Add('"gen$persona"');
         SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and');
         SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA ');
         SQL.Add('and "gen$direccion".ID_DIRECCION = 1) ');
         try
           Open;
           Last;
           First;
           Bar3.Minimum := 0;
           Bar3.Maximum := Recordcount;
         except
           Transaction.Rollback;
           raise;
         end;

         while not Eof do begin
           Bar3.Position := RecNo;
           Application.ProcessMessages;
           //vCodMunicipio := FieldByName('COD_MUNICIPIO').AsString;
           //if (vCodMunicipio = '') Then vCodMunicipio := '00000';
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select');
           IBSQL1.SQL.Add('"cap$maestro".ID_AGENCIA,');
           IBSQL1.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION,');
           IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA,');
           IBSQL1.SQL.Add('"cap$maestro".DIGITO_CUENTA');
           IBSQL1.SQL.Add('from');
           IBSQL1.SQL.Add('"cap$maestrotitular"');
           IBSQL1.SQL.Add('inner join');
           IBSQL1.SQL.Add('"cap$maestro" on ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
           IBSQL1.SQL.Add('where');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION IN (2,4) and');
           IBSQL1.SQL.Add('"cap$maestro".ID_ESTADO <> 15');
           IBSQL1.SQL.Add('and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1 ');
//           IBSQL1.SQL.Add('AND "cap$maestro".NUMERO_CUENTA >= 50000');
           IBSQL1.SQL.Add('order by');
           IBSQL1.SQL.Add('"cap$maestro".ID_AGENCIA,');
           IBSQL1.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION,');
           IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA,');
           IBSQL1.SQL.Add('"cap$maestro".DIGITO_CUENTA');
           IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
           IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
           try
            IBSQL1.Open;
            IBSQL1.Last;
            IBSQL1.First;
           except
            Transaction.Rollback;
            raise;
           end;
           Bar1.Maximum := IBSQL1.RecordCount;
           Bar1.Position := 0;
           Saldo   := 0;
           Credito := 0;
           Interes := 0;
           Cds1.Open;
           Cds1.EmptyDataSet;
           Cds1.Close;

           while not IBSQL1.Eof do
           begin

             Saldo1   := 0;
             Credito1 := 0;
             Interes1 := 0;
             _cSaldoCheque := 0;
             Bar1.Position := IBSQL1.RecNo;
             Application.ProcessMessages;
// Movimiento Contable Credito (Debito en Extracto)
//             if IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger = 35 then
//                ShowMessage('listo');
             if IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger < 6 then
             begin
              {IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('SELECT');
              IBQuery2.SQL.Add('  SUM("dian$chequedevuelto".VALOR) AS VALOR');
              IBQuery2.SQL.Add('FROM');
              IBQuery2.SQL.Add('  "dian$chequedevuelto"');
              IBQuery2.SQL.Add('WHERE');
              IBQuery2.SQL.Add('  "dian$chequedevuelto".DIGITO_CUENTA = :DG AND');
              IBQuery2.SQL.Add('  "dian$chequedevuelto".ID_TIPO_CAPTACION = :TP AND');
              IBQuery2.SQL.Add('  "dian$chequedevuelto".NUMERO_CUENTA = :NUMERO_CUENTA');
              IBQuery2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
              IBQuery2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
              IBQuery2.Open;
              _cSaldoCheque := IBQuery2.FieldByName('VALOR').AsCurrency;}
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "cap$extracto"');
              IBQuery2.SQL.Add('where');
              IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
              IBQuery2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
              IBQuery2.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA and');
              IBQuery2.SQL.Add('(FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2) and');
              IBQuery2.SQL.Add('VALOR_DEBITO <> 0');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.fieldbyname('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
              IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
              IBQuery2.ParamByName('FECHA1').AsDate := _dFechaInicial;
              IBQuery2.ParamByName('FECHA2').AsDate := _dFechaCorteAhorros;
              //ShowMessage('Inicial:' + DateToStr(_dFechaInicial) + ' Final:' + DateToStr(_dFechaCorteAhorros));
              try
                IBQuery2.Open;
                IBQuery2.Last;
                IBQuery2.First;
              except
                IBQuery2.Transaction.Rollback;
                raise;
              end;
              Bar2.Maximum := IBQuery2.RecordCount;
              while not IBQuery2.Eof do
              begin
                Bar2.Position := IBQuery2.RecNo;
                Application.ProcessMessages;
                //Validacion para reportes antiguos, en el caso de los desembolsos

                if ( ((IBQuery2.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 6) or (IBQuery2.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1) ) and
                     (Pos('CARTE',IBQuery2.FieldByName('DOCUMENTO_MOVIMIENTO').AsString) <> 0) or
                     (Pos('CONSIGNACION POR DESEMBOLSO',IBQuery2.FieldByName('DESCRIPCION_MOVIMIENTO').AsString)<>0) ) then
                begin
                   IBQuery2.Next;
                   Continue;
                end;
                if IBQuery2.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger <> 23 then // REVERSIONES DE TARJETA DEBITO
                begin
                  Credito1 := Credito1 + IBQuery2.FieldByName('VALOR_DEBITO').AsCurrency;
                  Credito := Credito + IBQuery2.FieldByName('VALOR_DEBITO').AsCurrency;
                end;
                if IBQuery2.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 31 then // DEVOLUCION DE CHEQUES
                begin
                   _cSaldoCheque := _cSaldoCheque + IBQuery2.FieldByName('VALOR_CREDITO').AsCurrency;
                end;

                IBQuery2.Next;
              end; // fin del while
             end; // fin del i
// Saldo en Depositos e Intereses Causados
             Credito := Credito - _cSaldoCheque;
             Credito1 := Credito1 - _cSaldoCheque;
             case IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger of
             2,
             4,
             5: begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_MES_NOTD(:AGENCIA,:TIPO,:NUMERO,:DIGITO,:ANO,:FECHA1,:FECHA2)');
                 IBSQL2.ParamByName('AGENCIA').AsInteger := IBSQL1.fieldbyname('ID_AGENCIA').AsInteger;
                 IBSQL2.ParamByName('TIPO').AsInteger := IBSQL1.fieldbyname('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL2.ParamByName('NUMERO').AsInteger := IBSQL1.fieldbyname('NUMERO_CUENTA').AsInteger;
                 IBSQL2.ParamByName('DIGITO').AsInteger := IBSQL1.fieldbyname('DIGITO_CUENTA').AsInteger;
                 IBSQL2.ParamByName('ANO').AsString := IntToStr(EdPeriodo.Value);
                 IBSQL2.ParamByName('FECHA1').AsDate := _dFechaInicial;
                 IBSQL2.ParamByName('FECHA2').AsDate := _dFechaCorteAhorros;
                 try
                  IBSQL2.ExecQuery;
                  Saldo1 := Saldo1 + IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                  Saldo := Saldo + IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                 except
                  Transaction.Rollback;
                  raise;
                 end;
                end; // fin del begin
             6: begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select');
                 IBSQL2.SQL.Add('"cap$causacioncdat".VALOR_INICIAL, "cap$causacioncdat".VALOR');
                 IBSQL2.SQL.Add('from');
                 IBSQL2.SQL.Add('"cap$causacioncdat"');
                 IBSQL2.SQL.Add('where');
                 IBSQL2.SQL.Add('"cap$causacioncdat".ID_AGENCIA = :ID_AGENCIA and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".NUMERO_CUENTA = :NUMERO_CUENTA and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".DIGITO_CUENTA = :DIGITO_CUENTA and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".ANO = :ANO and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".MES = :MES');
                 IBSQL2.ParamByName('ANO').AsInteger := EdPeriodo.Value;
                 IBSQL2.ParamByName('MES').AsInteger := MonthOf(_dFechaCorteAhorros);
                 try
                  IBSQL2.ExecQuery;
                  Saldo1 := Saldo1 + IBSQL2.FieldByName('VALOR_INICIAL').AsCurrency;
                  Interes1 := Interes1 + IBSQL2.FieldByName('VALOR').AsCurrency;
                  Saldo := Saldo + IBSQL2.FieldByName('VALOR_INICIAL').AsCurrency;
                  Interes := Interes + IBSQL2.FieldByName('VALOR').AsCurrency;
                 except
                  Transaction.Rollback;
                  raise;
                 end;
                end; // fin del begin 6
             end; // fin del case
               if (Credito1 > 0) or (Saldo1 > 0) then
               begin
                 Cds1.Open;
                 Cds1.Append;
                 Cds1.FieldByName('Cuenta').AsString := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsString+
                                                      Format('%.2d',[IBSQL1.FieldByName('ID_AGENCIA').AsInteger])+
                                                      Format('%.7d',[IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger])+
                                                      IBSQL1.FieldByName('DIGITO_CUENTA').AsString;
                 Cds1.FieldByName('Credito').AsCurrency := Credito1;
                 Cds1.FieldByName('Interes').AsCurrency := Interes1;
                 Cds1.FieldByName('Saldo').AsCurrency := Saldo1;
                 Cds1.Post;
                 Cds1.Close;
               end;

            IBSQL1.Next; // next del query captaciones
           end; // fin del while del IBSQL1
// Validar Saldo
           
           if (Credito >= EdMonto.Value) or (Saldo >= JvSaldo.Value) then
           begin
            Cds1.Open;
            while not Cds1.Eof do
            begin
             Inc(Fila);
             Sg1.RowCount := Fila + 1;
             //Sg1.Cells[0,Fila] := IntToStr(Fila+1);
             //Sg1.Cells[1,Fila] := '2';
             //Sg1.Cells[2,Fila] := '10';
             //Sg1.Cells[3,Fila] := '00';

             if FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
             begin
               Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
               Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
             end
             else
             begin
               Id := FieldByName('ID_PERSONA').AsString;
               Dg := '';
             end;

             case FieldByName('ID_IDENTIFICACION').AsInteger of
             1: tp := '11';
             2: Tp := '12';
             3: Tp := '13';
             4: Tp := '31';
             6: Tp := '22';
             9: Tp := '11';//NUI son registrados como Registros Civiles
             end;

             Sg1.Cells[0,Fila] := Tp;
             Sg1.Cells[1,Fila] := Id;
             Sg1.Cells[2,Fila] := Dg;


{             with IBSQL1 do
             begin
               Close;
               SQL.Clear;
               SQL.Add('select DPTO,MUN from "dian$con_personas" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
               ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               Open;
               Mn := FormatCurr('000',FieldByName('MUN').AsInteger);
               Dpto := FormatCurr('00',FieldByName('DPTO').AsInteger);
             end;}
             try
               if StrLen(PChar(vCodMunicipio)) = 4 then
                  vCodMunicipio := '0' +  vCodMunicipio;
               if (vCodMunicipio = '') then vCodMunicipio := '00000';
               Dpto := FormatCurr('00',StrToInt(LeftStr(vCodMunicipio,2)));
               Mn := FormatCurr('000',StrToInt(RightStr(vCodMunicipio,3)));
             except
             begin
               Mn := '00';
               Dpto := '000';
             end;
             end;


             {case Agencia of
             1: Mn := '54498';
             2: Mn := '54003';
             3: Mn := '54206';
             end;}

             Dr := Trim(FieldByName('DIRECCION').AsString);

             //Sg1.Cells[6,Fila] := Tp;
             if Tp <> '31' then
             begin
               Sg1.Cells[3,Fila] := FieldByName('PRIMER_APELLIDO').AsString;
               Sg1.Cells[4,Fila] := FieldByName('SEGUNDO_APELLIDO').AsString;
               _sNombre := Trim(FieldByName('NOMBRE').AsString);
               Sg1.Cells[5,Fila] := _sNombre;
               if Pos(' ', _sNombre) > 0 then
               begin
                   Sg1.Cells[5,Fila] := LeftStr(_sNombre,Pos(' ', _sNombre)-1);
                   Sg1.Cells[6,Fila] := RightStr(_sNombre,Length(_sNombre) - Pos(' ', _sNombre));
               end;
             end
             else
             begin
               Sg1.Cells[3,Fila] := '';
               Sg1.Cells[4,Fila] := '';
               Sg1.Cells[5,Fila] := '';
               Sg1.Cells[6,Fila] := '';
             end;
             if Tp = '31' then
                Sg1.Cells[7,Fila] := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString)
             else
                Sg1.Cells[7,Fila] := '';
             Sg1.Cells[8,Fila] := Dr;
             Sg1.Cells[9,Fila] := Dpto;
             Sg1.Cells[10,Fila] := Mn;
             Sg1.Cells[11,Fila] := FormatCurr('#0',Cds1.FieldByName('Credito').AsCurrency);
             //Sg1.Cells[12,Fila] := FormatCurr('#0',Cds1.FieldByName('Interes').AsCurrency);
             Sg1.Cells[12,Fila] := FormatCurr('#0',Cds1.FieldByName('Saldo').AsCurrency);
             Sg1.Cells[13,Fila] := Cds1.FieldByName('Cuenta').AsString;
             ibquery2.Close;
             IBQuery2.SQL.Clear;
             IBQuery2.SQL.Add('SELECT ');
             IBQuery2.SQL.Add('  "cap$maestrotitular".ID_IDENTIFICACION,');
             IBQuery2.SQL.Add('  "cap$maestrotitular".ID_PERSONA,');
             IBQuery2.SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
             IBQuery2.SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
             IBQuery2.SQL.Add('  "gen$persona".NOMBRE');
             IBQuery2.SQL.Add('FROM');
             IBQuery2.SQL.Add('  "cap$maestrotitular"');
             IBQuery2.SQL.Add('  INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
             IBQuery2.SQL.Add('WHERE');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA) AND ');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND ');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA) AND ');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR > 1)');
             iTipo := StrToInt(midstr(Cds1.FieldByName('Cuenta').AsString,1,1));
             iAgencia := StrToInt(midstr(Cds1.FieldByName('Cuenta').AsString,2,2));
             iCuenta := StrToInt(midstr(Cds1.FieldByName('Cuenta').AsString,4,7));
             iDigito := StrToInt(midstr(Cds1.FieldByName('Cuenta').AsString,11,1));
             IBQuery2.ParamByName('ID_AGENCIA').AsInteger := iAgencia;
             IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := iTipo;
             IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := iCuenta;
             IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := iDigito;
             try
              IBQuery2.Open;
              IBQuery2.Last;
              IBQuery2.First;
              Sg1.Cells[14,Fila] := IntToStr(IBQuery2.RecordCount);
              Sg1.Cells[15,Fila] := '1';
              // validar exexnicon Movimientos financieros

              IBGMF.Close;
              IBGMF.ParamByName('Nm').AsInteger := iCuenta;
              IBGMF.ParamByName('Tp').AsInteger := iTipo;
              IBGMF.Open;
              if IBGMF.FieldByName('GMF').AsInteger > 0 then
                Sg1.Cells[16,Fila] := '1'
              else
                Sg1.Cells[16,Fila] := '9';
              // /*/*/*/*/*/*
              //Sg1.Cells[17,Fila] := FieldByName('MUNICIPIO').AsString;
              
              while not IBQuery2.Eof do
              begin
                Inc(jFila);
               case IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger of
               1: tp := '11';
               2: Tp := '12';
               3: Tp := '13';
               4: Tp := '31';
               6: Tp := '22';
               9: Tp := '11';//NUI son registrados como Registros Civiles
               end;
                Sg2.RowCount := jFila + 1;
                ///
                Sg2.Cells[0,jFila] := Cds1.FieldByName('Cuenta').AsString;
                Sg2.Cells[1,jFila] := tp;
                Sg2.Cells[2,jFila] := IBQuery2.FieldByName('ID_PERSONA').AsString;
                Sg2.Cells[3,jFila] := '';
                Sg2.Cells[4,jFila] := IBQuery2.FieldByName('PRIMER_APELLIDO').AsString;
                Sg2.Cells[5,jFila] := IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString;
                //** DIVIDIR NOMBRES EN DOS CAMPOS
                 Sg2.Cells[6,jFila] := IBQuery2.FieldByName('NOMBRE').AsString;
                 if Pos(' ', IBQuery2.FieldByName('NOMBRE').AsString) > 0 then
                 begin
                   Sg2.Cells[6,jFila] := Leftstr(IBQuery2.FieldByName('NOMBRE').AsString,Pos(' ', IBQuery2.FieldByName('NOMBRE').AsString)-1);
                   Sg2.Cells[7,jFila] := RightStr(IBQuery2.FieldByName('NOMBRE').AsString,Length(IBQuery2.FieldByName('NOMBRE').AsString) - Pos(' ', IBQuery2.FieldByName('NOMBRE').AsString));
                 end;
                ///



             {   Sg2.Cells[0,jFila] := FieldByName('ID_IDENTIFICACION').AsString;
                Sg2.Cells[1,jFila] := Id;
                Sg2.Cells[3,jFila] := IBQuery2.FieldByName('ID_PERSONA').AsString;
                Sg2.Cells[2,jFila] := IBQuery2.FieldByName('ID_IDENTIFICACION').AsString;
                Sg2.Cells[4,jFila] := IBQuery2.FieldByName('PRIMER_APELLIDO').AsString;
                Sg2.Cells[5,jFila] := IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString;
                Sg2.Cells[6,jFila] := IBQuery2.FieldByName('NOMBRE').AsString;
                Sg2.Cells[7,jFila] := Cds1.FieldByName('Cuenta').AsString;}
                IBQuery2.Next;
              end;
             except
              IBQuery2.Transaction.Rollback;
              raise;
             end;
            Cds1.Next;
           end; // fin del while Cds1
           Cds1.Close;
          end; // fin de la validación de saldo
         Next; //next del query personas
         end; // fin del While de ibquery1
         Transaction.Commit;
        end; // Fin del With IBQuery1

end;

procedure TfrmMovimientoCredito.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMovimientoCredito.btnAExcelClick(Sender: TObject);
begin
        if sd1.Execute then
           StringGridToXLS(Sg1,sd1.FileName);
        if sd1.Execute then
           StringGridToXLS(Sg2,sd1.FileName);

end;

procedure TfrmMovimientoCredito.FormCreate(Sender: TObject);
begin
             EdPeriodo.Value := YearOf(fFechaActual) -1 ;
end;

end.
=======
unit UnitMovimientoCredito;

interface

uses
  DateUtils, StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, Grids, StdCtrls,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, JvSpecialProgress, XLSfile;

type
  TfrmMovimientoCredito = class(TForm)
    Bar2: TJvSpecialProgress;
    Bar1: TJvSpecialProgress;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    btnAExcel: TBitBtn;
    Sg1: TStringGrid;
    IBQuery1: TIBQuery;
    Cds1: TClientDataSet;
    sd1: TSaveDialog;
    IBSQL2: TIBSQL;
    IBSQL1: TIBQuery;
    Bar3: TJvSpecialProgress;
    IBQuery2: TIBQuery;
    Cds1Cuenta: TStringField;
    Cds1Credito: TCurrencyField;
    Cds1Interes: TCurrencyField;
    Cds1Saldo: TCurrencyField;
    Sg2: TStringGrid;

    Label3: TLabel;
    JvSaldo: TJvCurrencyEdit;
    IBGMF: TIBQuery;
    Edit1: TEdit;
    ClientDataSet1: TClientDataSet;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimientoCredito: TfrmMovimientoCredito;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmMovimientoCredito.btnProcesarClick(Sender: TObject);
var
  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Dr:string;
  Dpto :string;
  Mn:string;
  Total:Integer;
  Fila,jFila:Integer;
  Saldo,Credito,Interes:Currency;
  Saldo1,Credito1,Interes1:Currency;
  Cuenta:string;
  iAgencia,iTipo,iCuenta,iDigito:Integer;
  vCodMunicipio :string;
  _sNombre :string;
  _cSaldoCheque :Currency;
begin
        Fila := -1;
        jFila := -1;
        Application.ProcessMessages;
        Sg1.RowCount := 1;
        Sg1.ColWidths[0] := 40;
        Sg1.ColWidths[1] := 100;
        Sg1.ColWidths[2] := 10;
        Sg1.ColWidths[3] := 80;
        Sg1.ColWidths[4] := 80;
        Sg1.ColWidths[5] := 80;
        Sg1.ColWidths[6] := 80;
        Sg1.ColWidths[7] := 80;
        Sg1.ColWidths[8] := 100;
        Sg1.ColWidths[9] := 50;
        Sg1.ColWidths[10] := 50;
        Sg1.ColWidths[11] := 50;
        Sg1.ColWidths[12] := 80;
        Sg1.ColWidths[13] := 80;
        Sg1.ColWidths[14] := 80;
        Sg1.ColWidths[15] := 80;
        //Sg1.ColWidths[16] := 10;//GMF
        //Sg1.ColWidths[17] := 100;//MUNICIPIO
//***********************************//
        Sg2.ColWidths[0] := 10;
        Sg2.ColWidths[1] := 80;
        Sg2.ColWidths[2] := 10;
        Sg2.ColWidths[3] := 80;
        Sg2.ColWidths[4] := 200;
        Sg2.ColWidths[5] := 200;
        Sg2.ColWidths[6] := 200;
        Sg2.ColWidths[7] := 100;


        with IBQuery1 do
        begin
         Transaction.StartTransaction;
         {Close;
         SQL.Clear;
         SQL.Add('select');
         SQL.Add('count(*) as TOTAL');
         SQL.Add('from');
         SQL.Add('"gen$persona"');
         SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and');
         SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA and "gen$direccion".ID_DIRECCION = 1 ');
         SQL.Add('and "gen$direccion".ID_DIRECCION = 1)');
         try
           Open;
           Total := FieldByName('TOTAL').AsInteger;
         except
           Transaction.Rollback;
           raise;
         end;
         Close;

         Bar3.Maximum := Total;}

         SQL.Clear;
         SQL.Add('select distinct');
         SQL.Add('"gen$persona".ID_IDENTIFICACION,');
         SQL.Add('"gen$persona".ID_PERSONA,');
         SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
         SQL.Add('"gen$direccion".DIRECCION || '' '' || "gen$direccion".BARRIO AS DIRECCION,');
         SQL.Add('"gen$direccion".MUNICIPIO AS MUNICIPIO,"gen$direccion".COD_MUNICIPIO');
         SQL.Add('from');
         SQL.Add('"gen$persona"');
         SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and');
         SQL.Add('"gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA ');
         SQL.Add('and "gen$direccion".ID_DIRECCION = 1) ');
         try
           Open;
           Last;
           First;
           Bar3.Minimum := 0;
           Bar3.Maximum := Recordcount;
         except
           Transaction.Rollback;
           raise;
         end;

         while not Eof do begin
           Bar3.Position := RecNo;
           Application.ProcessMessages;
           //vCodMunicipio := FieldByName('COD_MUNICIPIO').AsString;
           //if (vCodMunicipio = '') Then vCodMunicipio := '00000';
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select');
           IBSQL1.SQL.Add('"cap$maestro".ID_AGENCIA,');
           IBSQL1.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION,');
           IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA,');
           IBSQL1.SQL.Add('"cap$maestro".DIGITO_CUENTA');
           IBSQL1.SQL.Add('from');
           IBSQL1.SQL.Add('"cap$maestrotitular"');
           IBSQL1.SQL.Add('inner join');
           IBSQL1.SQL.Add('"cap$maestro" on ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
           IBSQL1.SQL.Add('where');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION IN (2,4) and');
           IBSQL1.SQL.Add('"cap$maestro".ID_ESTADO <> 15');
           IBSQL1.SQL.Add('and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1 ');
//           IBSQL1.SQL.Add('AND "cap$maestro".NUMERO_CUENTA >= 50000');
           IBSQL1.SQL.Add('order by');
           IBSQL1.SQL.Add('"cap$maestro".ID_AGENCIA,');
           IBSQL1.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION,');
           IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA,');
           IBSQL1.SQL.Add('"cap$maestro".DIGITO_CUENTA');
           IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
           IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
           try
            IBSQL1.Open;
            IBSQL1.Last;
            IBSQL1.First;
           except
            Transaction.Rollback;
            raise;
           end;
           Bar1.Maximum := IBSQL1.RecordCount;
           Bar1.Position := 0;
           Saldo   := 0;
           Credito := 0;
           Interes := 0;
           Cds1.Open;
           Cds1.EmptyDataSet;
           Cds1.Close;

           while not IBSQL1.Eof do
           begin

             Saldo1   := 0;
             Credito1 := 0;
             Interes1 := 0;
             _cSaldoCheque := 0;
             Bar1.Position := IBSQL1.RecNo;
             Application.ProcessMessages;
// Movimiento Contable Credito (Debito en Extracto)
//             if IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger = 35 then
//                ShowMessage('listo');
             if IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger < 6 then
             begin
              {IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('SELECT');
              IBQuery2.SQL.Add('  SUM("dian$chequedevuelto".VALOR) AS VALOR');
              IBQuery2.SQL.Add('FROM');
              IBQuery2.SQL.Add('  "dian$chequedevuelto"');
              IBQuery2.SQL.Add('WHERE');
              IBQuery2.SQL.Add('  "dian$chequedevuelto".DIGITO_CUENTA = :DG AND');
              IBQuery2.SQL.Add('  "dian$chequedevuelto".ID_TIPO_CAPTACION = :TP AND');
              IBQuery2.SQL.Add('  "dian$chequedevuelto".NUMERO_CUENTA = :NUMERO_CUENTA');
              IBQuery2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
              IBQuery2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
              IBQuery2.Open;
              _cSaldoCheque := IBQuery2.FieldByName('VALOR').AsCurrency;}
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('select * from "cap$extracto"');
              IBQuery2.SQL.Add('where');
              IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
              IBQuery2.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
              IBQuery2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
              IBQuery2.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA and');
              IBQuery2.SQL.Add('(FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2) and');
              IBQuery2.SQL.Add('VALOR_DEBITO <> 0');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.fieldbyname('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
              IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
              IBQuery2.ParamByName('FECHA1').AsDate := _dFechaInicial;
              IBQuery2.ParamByName('FECHA2').AsDate := _dFechaCorteAhorros;
              //ShowMessage('Inicial:' + DateToStr(_dFechaInicial) + ' Final:' + DateToStr(_dFechaCorteAhorros));
              try
                IBQuery2.Open;
                IBQuery2.Last;
                IBQuery2.First;
              except
                IBQuery2.Transaction.Rollback;
                raise;
              end;
              Bar2.Maximum := IBQuery2.RecordCount;
              while not IBQuery2.Eof do
              begin
                Bar2.Position := IBQuery2.RecNo;
                Application.ProcessMessages;
                //Validacion para reportes antiguos, en el caso de los desembolsos

                if ( ((IBQuery2.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 6) or (IBQuery2.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1) ) and
                     (Pos('CARTE',IBQuery2.FieldByName('DOCUMENTO_MOVIMIENTO').AsString) <> 0) or
                     (Pos('CONSIGNACION POR DESEMBOLSO',IBQuery2.FieldByName('DESCRIPCION_MOVIMIENTO').AsString)<>0) ) then
                begin
                   IBQuery2.Next;
                   Continue;
                end;
                if IBQuery2.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger <> 23 then // REVERSIONES DE TARJETA DEBITO
                begin
                  Credito1 := Credito1 + IBQuery2.FieldByName('VALOR_DEBITO').AsCurrency;
                  Credito := Credito + IBQuery2.FieldByName('VALOR_DEBITO').AsCurrency;
                end;
                if IBQuery2.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 31 then // DEVOLUCION DE CHEQUES
                begin
                   _cSaldoCheque := _cSaldoCheque + IBQuery2.FieldByName('VALOR_CREDITO').AsCurrency;
                end;

                IBQuery2.Next;
              end; // fin del while
             end; // fin del i
// Saldo en Depositos e Intereses Causados
             Credito := Credito - _cSaldoCheque;
             Credito1 := Credito1 - _cSaldoCheque;
             case IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger of
             2,
             4,
             5: begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_MES_NOTD(:AGENCIA,:TIPO,:NUMERO,:DIGITO,:ANO,:FECHA1,:FECHA2)');
                 IBSQL2.ParamByName('AGENCIA').AsInteger := IBSQL1.fieldbyname('ID_AGENCIA').AsInteger;
                 IBSQL2.ParamByName('TIPO').AsInteger := IBSQL1.fieldbyname('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL2.ParamByName('NUMERO').AsInteger := IBSQL1.fieldbyname('NUMERO_CUENTA').AsInteger;
                 IBSQL2.ParamByName('DIGITO').AsInteger := IBSQL1.fieldbyname('DIGITO_CUENTA').AsInteger;
                 IBSQL2.ParamByName('ANO').AsString := IntToStr(EdPeriodo.Value);
                 IBSQL2.ParamByName('FECHA1').AsDate := _dFechaInicial;
                 IBSQL2.ParamByName('FECHA2').AsDate := _dFechaCorteAhorros;
                 try
                  IBSQL2.ExecQuery;
                  Saldo1 := Saldo1 + IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                  Saldo := Saldo + IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                 except
                  Transaction.Rollback;
                  raise;
                 end;
                end; // fin del begin
             6: begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select');
                 IBSQL2.SQL.Add('"cap$causacioncdat".VALOR_INICIAL, "cap$causacioncdat".VALOR');
                 IBSQL2.SQL.Add('from');
                 IBSQL2.SQL.Add('"cap$causacioncdat"');
                 IBSQL2.SQL.Add('where');
                 IBSQL2.SQL.Add('"cap$causacioncdat".ID_AGENCIA = :ID_AGENCIA and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".NUMERO_CUENTA = :NUMERO_CUENTA and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".DIGITO_CUENTA = :DIGITO_CUENTA and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".ANO = :ANO and');
                 IBSQL2.SQL.Add('"cap$causacioncdat".MES = :MES');
                 IBSQL2.ParamByName('ANO').AsInteger := EdPeriodo.Value;
                 IBSQL2.ParamByName('MES').AsInteger := MonthOf(_dFechaCorteAhorros);
                 try
                  IBSQL2.ExecQuery;
                  Saldo1 := Saldo1 + IBSQL2.FieldByName('VALOR_INICIAL').AsCurrency;
                  Interes1 := Interes1 + IBSQL2.FieldByName('VALOR').AsCurrency;
                  Saldo := Saldo + IBSQL2.FieldByName('VALOR_INICIAL').AsCurrency;
                  Interes := Interes + IBSQL2.FieldByName('VALOR').AsCurrency;
                 except
                  Transaction.Rollback;
                  raise;
                 end;
                end; // fin del begin 6
             end; // fin del case
               if (Credito1 > 0) or (Saldo1 > 0) then
               begin
                 Cds1.Open;
                 Cds1.Append;
                 Cds1.FieldByName('Cuenta').AsString := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsString+
                                                      Format('%.2d',[IBSQL1.FieldByName('ID_AGENCIA').AsInteger])+
                                                      Format('%.7d',[IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger])+
                                                      IBSQL1.FieldByName('DIGITO_CUENTA').AsString;
                 Cds1.FieldByName('Credito').AsCurrency := Credito1;
                 Cds1.FieldByName('Interes').AsCurrency := Interes1;
                 Cds1.FieldByName('Saldo').AsCurrency := Saldo1;
                 Cds1.Post;
                 Cds1.Close;
               end;

            IBSQL1.Next; // next del query captaciones
           end; // fin del while del IBSQL1
// Validar Saldo
           
           if (Credito >= EdMonto.Value) or (Saldo >= JvSaldo.Value) then
           begin
            Cds1.Open;
            while not Cds1.Eof do
            begin
             Inc(Fila);
             Sg1.RowCount := Fila + 1;
             //Sg1.Cells[0,Fila] := IntToStr(Fila+1);
             //Sg1.Cells[1,Fila] := '2';
             //Sg1.Cells[2,Fila] := '10';
             //Sg1.Cells[3,Fila] := '00';

             if FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
             begin
               Id := LeftStr(FieldByName('ID_PERSONA').AsString,Length(FieldByName('ID_PERSONA').AsString)-1);
               Dg := RightStr(FieldByName('ID_PERSONA').AsString,1);
             end
             else
             begin
               Id := FieldByName('ID_PERSONA').AsString;
               Dg := '';
             end;

             case FieldByName('ID_IDENTIFICACION').AsInteger of
             1: tp := '11';
             2: Tp := '12';
             3: Tp := '13';
             4: Tp := '31';
             6: Tp := '22';
             9: Tp := '11';//NUI son registrados como Registros Civiles
             end;

             Sg1.Cells[0,Fila] := Tp;
             Sg1.Cells[1,Fila] := Id;
             Sg1.Cells[2,Fila] := Dg;


{             with IBSQL1 do
             begin
               Close;
               SQL.Clear;
               SQL.Add('select DPTO,MUN from "dian$con_personas" where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
               ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               Open;
               Mn := FormatCurr('000',FieldByName('MUN').AsInteger);
               Dpto := FormatCurr('00',FieldByName('DPTO').AsInteger);
             end;}
             try
               if StrLen(PChar(vCodMunicipio)) = 4 then
                  vCodMunicipio := '0' +  vCodMunicipio;
               if (vCodMunicipio = '') then vCodMunicipio := '00000';
               Dpto := FormatCurr('00',StrToInt(LeftStr(vCodMunicipio,2)));
               Mn := FormatCurr('000',StrToInt(RightStr(vCodMunicipio,3)));
             except
             begin
               Mn := '00';
               Dpto := '000';
             end;
             end;


             {case Agencia of
             1: Mn := '54498';
             2: Mn := '54003';
             3: Mn := '54206';
             end;}

             Dr := Trim(FieldByName('DIRECCION').AsString);

             //Sg1.Cells[6,Fila] := Tp;
             if Tp <> '31' then
             begin
               Sg1.Cells[3,Fila] := FieldByName('PRIMER_APELLIDO').AsString;
               Sg1.Cells[4,Fila] := FieldByName('SEGUNDO_APELLIDO').AsString;
               _sNombre := Trim(FieldByName('NOMBRE').AsString);
               Sg1.Cells[5,Fila] := _sNombre;
               if Pos(' ', _sNombre) > 0 then
               begin
                   Sg1.Cells[5,Fila] := LeftStr(_sNombre,Pos(' ', _sNombre)-1);
                   Sg1.Cells[6,Fila] := RightStr(_sNombre,Length(_sNombre) - Pos(' ', _sNombre));
               end;
             end
             else
             begin
               Sg1.Cells[3,Fila] := '';
               Sg1.Cells[4,Fila] := '';
               Sg1.Cells[5,Fila] := '';
               Sg1.Cells[6,Fila] := '';
             end;
             if Tp = '31' then
                Sg1.Cells[7,Fila] := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString)
             else
                Sg1.Cells[7,Fila] := '';
             Sg1.Cells[8,Fila] := Dr;
             Sg1.Cells[9,Fila] := Dpto;
             Sg1.Cells[10,Fila] := Mn;
             Sg1.Cells[11,Fila] := FormatCurr('#0',Cds1.FieldByName('Credito').AsCurrency);
             //Sg1.Cells[12,Fila] := FormatCurr('#0',Cds1.FieldByName('Interes').AsCurrency);
             Sg1.Cells[12,Fila] := FormatCurr('#0',Cds1.FieldByName('Saldo').AsCurrency);
             Sg1.Cells[13,Fila] := Cds1.FieldByName('Cuenta').AsString;
             ibquery2.Close;
             IBQuery2.SQL.Clear;
             IBQuery2.SQL.Add('SELECT ');
             IBQuery2.SQL.Add('  "cap$maestrotitular".ID_IDENTIFICACION,');
             IBQuery2.SQL.Add('  "cap$maestrotitular".ID_PERSONA,');
             IBQuery2.SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
             IBQuery2.SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
             IBQuery2.SQL.Add('  "gen$persona".NOMBRE');
             IBQuery2.SQL.Add('FROM');
             IBQuery2.SQL.Add('  "cap$maestrotitular"');
             IBQuery2.SQL.Add('  INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
             IBQuery2.SQL.Add('WHERE');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA) AND ');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND ');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA) AND ');
             IBQuery2.SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR > 1)');
             iTipo := StrToInt(midstr(Cds1.FieldByName('Cuenta').AsString,1,1));
             iAgencia := StrToInt(midstr(Cds1.FieldByName('Cuenta').AsString,2,2));
             iCuenta := StrToInt(midstr(Cds1.FieldByName('Cuenta').AsString,4,7));
             iDigito := StrToInt(midstr(Cds1.FieldByName('Cuenta').AsString,11,1));
             IBQuery2.ParamByName('ID_AGENCIA').AsInteger := iAgencia;
             IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := iTipo;
             IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := iCuenta;
             IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := iDigito;
             try
              IBQuery2.Open;
              IBQuery2.Last;
              IBQuery2.First;
              Sg1.Cells[14,Fila] := IntToStr(IBQuery2.RecordCount);
              Sg1.Cells[15,Fila] := '1';
              // validar exexnicon Movimientos financieros

              IBGMF.Close;
              IBGMF.ParamByName('Nm').AsInteger := iCuenta;
              IBGMF.ParamByName('Tp').AsInteger := iTipo;
              IBGMF.Open;
              if IBGMF.FieldByName('GMF').AsInteger > 0 then
                Sg1.Cells[16,Fila] := '1'
              else
                Sg1.Cells[16,Fila] := '9';
              // /*/*/*/*/*/*
              //Sg1.Cells[17,Fila] := FieldByName('MUNICIPIO').AsString;
              
              while not IBQuery2.Eof do
              begin
                Inc(jFila);
               case IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger of
               1: tp := '11';
               2: Tp := '12';
               3: Tp := '13';
               4: Tp := '31';
               6: Tp := '22';
               9: Tp := '11';//NUI son registrados como Registros Civiles
               end;
                Sg2.RowCount := jFila + 1;
                ///
                Sg2.Cells[0,jFila] := Cds1.FieldByName('Cuenta').AsString;
                Sg2.Cells[1,jFila] := tp;
                Sg2.Cells[2,jFila] := IBQuery2.FieldByName('ID_PERSONA').AsString;
                Sg2.Cells[3,jFila] := '';
                Sg2.Cells[4,jFila] := IBQuery2.FieldByName('PRIMER_APELLIDO').AsString;
                Sg2.Cells[5,jFila] := IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString;
                //** DIVIDIR NOMBRES EN DOS CAMPOS
                 Sg2.Cells[6,jFila] := IBQuery2.FieldByName('NOMBRE').AsString;
                 if Pos(' ', IBQuery2.FieldByName('NOMBRE').AsString) > 0 then
                 begin
                   Sg2.Cells[6,jFila] := Leftstr(IBQuery2.FieldByName('NOMBRE').AsString,Pos(' ', IBQuery2.FieldByName('NOMBRE').AsString)-1);
                   Sg2.Cells[7,jFila] := RightStr(IBQuery2.FieldByName('NOMBRE').AsString,Length(IBQuery2.FieldByName('NOMBRE').AsString) - Pos(' ', IBQuery2.FieldByName('NOMBRE').AsString));
                 end;
                ///



             {   Sg2.Cells[0,jFila] := FieldByName('ID_IDENTIFICACION').AsString;
                Sg2.Cells[1,jFila] := Id;
                Sg2.Cells[3,jFila] := IBQuery2.FieldByName('ID_PERSONA').AsString;
                Sg2.Cells[2,jFila] := IBQuery2.FieldByName('ID_IDENTIFICACION').AsString;
                Sg2.Cells[4,jFila] := IBQuery2.FieldByName('PRIMER_APELLIDO').AsString;
                Sg2.Cells[5,jFila] := IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString;
                Sg2.Cells[6,jFila] := IBQuery2.FieldByName('NOMBRE').AsString;
                Sg2.Cells[7,jFila] := Cds1.FieldByName('Cuenta').AsString;}
                IBQuery2.Next;
              end;
             except
              IBQuery2.Transaction.Rollback;
              raise;
             end;
            Cds1.Next;
           end; // fin del while Cds1
           Cds1.Close;
          end; // fin de la validación de saldo
         Next; //next del query personas
         end; // fin del While de ibquery1
         Transaction.Commit;
        end; // Fin del With IBQuery1

end;

procedure TfrmMovimientoCredito.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMovimientoCredito.btnAExcelClick(Sender: TObject);
begin
        if sd1.Execute then
           StringGridToXLS(Sg1,sd1.FileName);
        if sd1.Execute then
           StringGridToXLS(Sg2,sd1.FileName);

end;

procedure TfrmMovimientoCredito.FormCreate(Sender: TObject);
begin
             EdPeriodo.Value := YearOf(fFechaActual) -1 ;
end;

end.

