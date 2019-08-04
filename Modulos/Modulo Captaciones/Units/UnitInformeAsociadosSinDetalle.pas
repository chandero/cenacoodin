unit UnitInformeAsociadosSinDetalle;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, pr_Common, pr_TxClasses,
  IBDatabase, DB, IBCustomDataSet, IBQuery, ComCtrls, IBSQL, DBClient,
  IBStoredProc;

type
  TfrmInformeAsociadossinDetalle = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Bar: TProgressBar;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    CDAsociado: TClientDataSet;
    CDAsociadoCUENTA: TIntegerField;
    CDAsociadoNOMBRE: TStringField;
    CDAsociadoTELEFONO: TStringField;
    CDAsociadoAPORTES: TBooleanField;
    CDAsociadoRINDEDIARIO: TBooleanField;
    CDAsociadoJUVENIL: TBooleanField;
    Label1: TLabel;
    IBSP: TIBStoredProc;
    prTxReport1: TprTxReport;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeAsociadossinDetalle: TfrmInformeAsociadossinDetalle;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmInformeAsociadossinDetalle.btnCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmInformeAsociadossinDetalle.btnProcesarClick(Sender: TObject);
var
  Total:Integer;
  MinimoAportes,MinimoRindediario,MinimoJuvenil:Currency;
  Ag,Tp,Nm,Dg:Integer;
  SaldoApoAct,SaldoRindediario,SaldoJuvenil:Currency;
  xAportes,xRindediario,xJuvenil:Boolean;
  Ano:string;
  Fecha1:TDate;
  Fecha2:TDate;
begin

        Ano := IntToStr(YearOf(fFechaActual));
        Fecha1 := EncodeDate(YearOf(fFechaActual),01,01);
        Fecha2 := EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));

         CDAsociado.EmptyDataSet;

        with IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT SALDO_MINIMO FROM "cap$tipocaptacion" WHERE ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
          try
            ExecQuery;
            MinimoAportes := FieldByName('SALDO_MINIMO').AsCurrency;
          except
            Transaction.Rollback;
            raise;
          end;

          Close;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
          try
            ExecQuery;
            MinimoRindediario := FieldByName('SALDO_MINIMO').AsCurrency;
          except
            Transaction.Rollback;
            raise;
          end;

          Close;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
          try
            ExecQuery;
            MinimoJuvenil := FieldByName('SALDO_MINIMO').AsCurrency;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

        with IBQuery1 do
        begin
         Close;
         if Transaction.InTransaction  then
            Transaction.Rollback;
         Transaction.StartTransaction;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('  count(*) as TOTAL');
         SQL.Add('FROM');
         SQL.Add(' "cap$maestro"');
         SQL.Add(' INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO="cap$tiposestado".ID_ESTADO)');
         SQL.Add(' INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
         SQL.Add('  AND ("cap$maestro".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
         SQL.Add('  AND ("cap$maestro".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
         SQL.Add('  AND ("cap$maestro".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
         SQL.Add(' INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
         SQL.Add('  AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
         SQL.Add('WHERE');
         SQL.Add('  ("cap$maestro".ID_TIPO_CAPTACION = 1) AND');
         SQL.Add('  ("cap$tiposestado".SE_SUMA = 1) AND');
         SQL.Add('  ("cap$maestro".FECHA_APERTURA <= :FECHA)');
         ParamByName('FECHA').AsDate := StrToDate('2005/07/31');
         try
          Label1.Caption := 'Calculando Totales...';
          Application.ProcessMessages;
          Open;
          Total := FieldByName('TOTAL').AsInteger;
         except
          Transaction.Rollback;
          raise;
         end;

         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('  "cap$maestro".ID_AGENCIA,');
         SQL.Add('  "cap$maestro".ID_TIPO_CAPTACION,');
         SQL.Add('  "cap$maestro".NUMERO_CUENTA,');
         SQL.Add('  "cap$maestro".DIGITO_CUENTA,');
         SQL.Add('  "gen$persona".ID_IDENTIFICACION,');
         SQL.Add('  "gen$persona".ID_PERSONA,');
         SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
         SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
         SQL.Add('  "gen$persona".NOMBRE,');
         SQL.Add('  "gen$direccion".TELEFONO1');
         SQL.Add('FROM');
         SQL.Add(' "cap$maestro"');
         SQL.Add(' INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO="cap$tiposestado".ID_ESTADO)');
         SQL.Add(' INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
         SQL.Add('  AND ("cap$maestro".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
         SQL.Add('  AND ("cap$maestro".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
         SQL.Add('  AND ("cap$maestro".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
         SQL.Add(' INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
         SQL.Add('  AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
         SQL.Add(' LEFT JOIN "gen$direccion" ON ("gen$persona".ID_IDENTIFICACION="gen$direccion".ID_IDENTIFICACION)');
         SQL.Add(' AND ("gen$persona".ID_PERSONA="gen$direccion".ID_PERSONA) AND ("gen$direccion".ID_DIRECCION = 1)');
         SQL.Add('WHERE');
         SQL.Add('  ("cap$maestro".ID_TIPO_CAPTACION = 1) AND');
         SQL.Add('  ("cap$tiposestado".SE_SUMA = 1) AND');
         SQL.Add('  ("cap$maestro".FECHA_APERTURA <= :FECHA)');
         SQL.Add('ORDER BY');
         SQL.Add('  "cap$maestro".ID_AGENCIA,');
         SQL.Add('  "cap$maestro".ID_TIPO_CAPTACION,');
         SQL.Add('  "cap$maestro".NUMERO_CUENTA,');
         SQL.Add('  "cap$maestro".DIGITO_CUENTA');
         ParamByName('FECHA').AsDate := StrToDate('2005/07/31');
         try
          Open;
         except
          Transaction.Rollback;
          raise;
         end;

         Bar.Min := 0;
         Bar.Max := Total;
         Bar.Position := 0;
         Label1.Caption := 'Procesando Información...';
         while not Eof do
         begin
           Bar.Position := RecNo;
           Application.ProcessMessages;
           Ag := FieldByName('ID_AGENCIA').AsInteger;
           Tp := FieldByName('ID_TIPO_CAPTACION').AsInteger;
           Nm := FieldByName('NUMERO_CUENTA').AsInteger;
           Dg := FieldByName('DIGITO_CUENTA').AsInteger;

           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_MES(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
           IBSQL1.ParamByName('AG').AsInteger := Ag;
           IBSQL1.ParamByName('TP').AsInteger := Tp;
           IBSQL1.ParamByName('NM').AsInteger := Nm;
           IBSQL1.ParamByName('DG').AsInteger := Dg;
           IBSQL1.ParamByName('ANO').AsString := Ano;
           IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;
           IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;
           try
             IBSQL1.ExecQuery;
             if IBSQL1.RecordCount > 0 then begin
               SaldoApoAct := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
               if SaldoApoAct >= MinimoAportes then
                 xAportes := True
               else
                 xAportes := False;
             end
             else
             begin
               SaldoApoAct := 0;
               xAportes := False;
             end;
           except
             Transaction.Rollback;
             raise;
           end;


           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_MES(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
           IBSQL1.ParamByName('AG').AsInteger := Ag;
           IBSQL1.ParamByName('TP').AsInteger := 2;
           IBSQL1.ParamByName('NM').AsInteger := Nm;
           IBSQL1.ParamByName('DG').AsInteger := StrToInt(DigitoControl(2,Format('%.7d',[Nm])));
           IBSQL1.ParamByName('ANO').AsString := Ano;
           IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;
           IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;
           try
             IBSQL1.ExecQuery;
             if IBSQL1.RecordCount > 0 then begin
               SaldoRindediario := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
               if SaldoRindediario >= MinimoRindediario then
                 xRindediario := True
               else
                 xRindediario := False;
             end
             else
             begin
               SaldoRindediario := 0;
               xRindediario := False;
             end;
           except
             Transaction.Rollback;
             raise;
           end;

           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select * from "cap$maestrotitular"');
           IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
           IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
           IBSQL1.SQL.Add('where');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and "cap$maestrotitular".ID_TIPO_CAPTACION = 4 and "cap$tiposestado".SE_SUMA <> 0');
           IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
           IBSQL1.ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
           try
            IBSQL1.ExecQuery;
            xJuvenil := True;
            if IBSQL1.RecordCount > 0 then
             while not IBSQL1.Eof do begin
                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_MES(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
                 IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                 IBSQL2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL2.ParamByName('NM').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                 IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                 IBSQL2.ParamByName('ANO').AsString := Ano;
                 IBSQL2.ParamByName('FECHA1').AsDate := Fecha1;
                 IBSQL2.ParamByName('FECHA2').AsDate := Fecha2;
                 try
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                   while not IBSQL2.Eof do begin
                      if IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency < MinimoJuvenil then
                        xJuvenil := False;
                      IBSQL2.Next;
                   end;

                 except
                   Transaction.Rollback;
                   raise;
                 end;
              IBSQL1.Next;
             end;

            except
             Transaction.Rollback;
             raise;
           end;

           if ((xAportes=False) or (xRindediario=False) or (xJuvenil=False)) then
           begin
              CDAsociado.Open;
              CDAsociado.Append;
              CDAsociado.FieldByName('CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              CDAsociado.FieldByName('NOMBRE').AsString := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                            FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                            FieldByName('NOMBRE').AsString);
              CDAsociado.FieldByName('TELEFONO').AsString :=FieldByName('TELEFONO1').AsString;
              CDAsociado.FieldByName('APORTES').AsBoolean := xAportes;
              CDAsociado.FieldByName('RINDEDIARIO').AsBoolean := xRindediario;
              CDAsociado.FieldByName('JUVENIL').AsBoolean := xJuvenil;
              CDAsociado.Post;
              CDAsociado.Close;
           end;
          Next;
         end; // fin del while

        end; // fin del with

        prTxReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
        prTxReport1.Variables.ByName['NIT'].AsString := Nit;
        prTxReport1.Variables.ByName['FECHAHOY'].AsDateTime := fFechaActual;

        if prTxReport1.PrepareReport then
           prTxReport1.PreviewPreparedReport(True);

end;

end.
