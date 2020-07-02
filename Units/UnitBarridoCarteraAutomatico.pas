unit UnitBarridoCarteraAutomatico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, DateUtils,
  Grids, XStringGrid, ExtCtrls, ComCtrls, IBSQL, StrUtils, pr_Common,
  pr_TxClasses, Math, pr_parser, Printers, SqlExpr;

type
  TfrmBarridoCartera = class(TForm)
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    GridColocaciones: TXStringGrid;
    Panel1: TPanel;
    FechaBarrido: TLabel;
    EdFechaBarrido: TDateTimePicker;
    RGCuota: TRadioGroup;
    Panel5: TPanel;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Report1: TprTxReport;
    Label1: TLabel;
    Report: TprTxReport;
    private
     procedure Procesar;
    end;

implementation

uses UnitdmGeneral,UnitGlobales,UnitGlobalesCol,UnitdmColocacion;

procedure Procesar;
var Fecha:TDate;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Total:Integer;
    CuotasaLiquidar:Integer;
    IBSQL1:TSQLQuery;
    IBT1:TSQLConnection;
    IBSQL2:TSQLQuery;
begin
        IBSQL1 := TSQLQuery.Create(nil);
        IBT1 := TSQLConnection.Create(nil);
        IBT1.Connected := False;
        IBT1.ConnectionName := 'Database.fdb';
        IBT1.DriverName := 'interbase';
        IBT1.GetDriverFunc := 'getsqldriverinterbase';
        IBT1.KeepConnection := True;
        IBT1.LibraryName := 'dbexpint.dll';
        IBT1.LoadParamsOnConnect := False;
        IBT1.LoginPrompt := False;
        IBT1.Connected := True;

        IBSQL1.SQLConnection := IBT1;
        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('delete from "col$barridoCartera"');
        IBSQL1.Open;
        IBSQL1.Close;


        Conteo := 0;

        IBSQL2 := TSQLQuery.Create(nil);
        IBSQL2.SQLConnection := IBT1;

        IBSQL2.Close;
        IBSQL2.SQL.Clear;
        IBSQL2.SQL.Add('SELECT');
        IBSQL2.SQL.Add('COUNT(*) AS TOTAL');
        IBSQL2.SQL.Add('FROM');
        IBSQL2.SQL.Add('"col$colocacion"');
        IBSQL2.SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
        IBSQL2.SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
        IBSQL2.SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
        IBSQL2.SQL.Add('WHERE');
        IBSQL2.SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0) and ');
        IBSQL2.SQL.Add('("col$colocacion".ID_TIPO_CUOTA =1)');
        try
         IBSQL2.Open;
         Total := FieldByName('TOTAL').AsInteger;
        except
         Writeln('Error Buscando Registros!');
         Exit;
        end;

        IBSQL2.Close;
        IBSQL2.SQL.Clear;
        IBSQL2.SQL.Add('SELECT');
        IBSQL2.SQL.Add('"col$colocacion".ID_AGENCIA,');
        IBSQL2.SQL.Add('"col$colocacion".ID_COLOCACION,');
        IBSQL2.SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
        IBSQL2.SQL.Add('"col$colocacion".ID_PERSONA,');
        IBSQL2.SQL.Add('"col$colocacion".ID_CLASIFICACION,');
        IBSQL2.SQL.Add('"col$colocacion".ID_CATEGORIA,');
        IBSQL2.SQL.Add('"col$colocacion".ID_GARANTIA,');
        IBSQL2.SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
        IBSQL2.SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
        IBSQL2.SQL.Add('"col$colocacion".ID_INTERES,');
        IBSQL2.SQL.Add('"col$colocacion".TIPO_INTERES,');
        IBSQL2.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
        IBSQL2.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
        IBSQL2.SQL.Add('"gen$persona".NOMBRE,');
        IBSQL2.SQL.Add('"col$colocacion".FECHA_CAPITAL,');
        IBSQL2.SQL.Add('"col$colocacion".FECHA_INTERES,');
        IBSQL2.SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
        IBSQL2.SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
        IBSQL2.SQL.Add('"col$colocacion".VALOR_CUOTA,');
        IBSQL2.SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
        IBSQL2.SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,');
        IBSQL2.SQL.Add('"col$colocacion".TASA_INTERES_MORA,');
        IBSQL2.SQL.Add('"col$colocacion".PUNTOS_INTERES,');
        IBSQL2.SQL.Add('"col$colocacion".DIAS_PRORROGADOS,');
        IBSQL2.SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
        IBSQL2.SQL.Add('"col$tasasvariables".VALOR_ACTUAL_TASA,');
        IBSQL2.SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
        IBSQL2.SQL.Add('"col$tiposcuota".CAPITAL,');
        IBSQL2.SQL.Add('"col$tiposcuota".INTERES');
        IBSQL2.SQL.Add('FROM');
        IBSQL2.SQL.Add('"col$colocacion"');
        IBSQL2.SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
        IBSQL2.SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
        IBSQL2.SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES) ');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0) and ');
          case RGCuota.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_TIPO_CUOTA < 4)');
           1: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 1)');
           2: SQL.Add('("col$colocacion".ID_TIPO_CUOTA > 1)');
          end;
          SQL.Add('Order by "col$colocacion".ID_ESTADO_COLOCACION DESC, "col$colocacion".FECHA_INTERES ASC');


          frmProgreso := TfrmProgreso.Create(self);
          frmProgreso.Titulo := 'Buscando Colocaciones';
          frmProgreso.Min := 0;
          frmProgreso.Max := Total;
          frmProgreso.Position := 0;
          frmProgreso.Ejecutar;

          try
            Open;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               frmprogreso.cerrar;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
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
                if Int(Fecha) <= Int(FechaHoy) then
                 begin
                   Conteo := Conteo + 1;
                   GridColocaciones.RowCount := Conteo + 1;
                   GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                   GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                       FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                       FieldByName('NOMBRE').AsString;
                   GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                   GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                   GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                   GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                   GridColocaciones.Cells[6,Conteo] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                   GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                   GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;

                   with IBCuotas do
                    begin
                      SQL.Clear;
                      SQL.Add('select count(CUOTA_NUMERO) as CUOTAS');
                      SQL.Add('from "col$tablaliquidacion"');
                      SQL.Add('where');
                      SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
                      SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
                      SQL.Add('PAGADA = 0 and');
                      SQL.Add('FECHA_A_PAGAR <= :"FECHA"');
                      ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                      ParamByName('FECHA').AsDate := FechaHoy;
                      ExecQuery;
                      CuotasaLiquidar := IBCuotas.FieldByName('CUOTAS').AsInteger;
                      IBCuotas.Close;
                    end;

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
                 end; //fin de if dias
                Next;
               end; //fin de while
              frmProgreso.Cerrar;
              Transaction.Commit;
              Transaction.StartTransaction;
            end; // fin if recordcount
          except
            Screen.Cursor := Save_Cursor;
            Close;
            frmprogreso.cerrar;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            Exit;
           end;
        end;
    Screen.Cursor := Save_Cursor;
    with IBGrupo3 do
     begin
       SQL.Clear;
       SQL.Add('select count(COLOCACION) as total from "col$barridoCartera"');
       Open;
       if FieldByName('TOTAL').AsInteger > 0 then
          CmdEjecutar.Enabled := True
       else
          MessageDlg('No se Encontraron Colocaciones Vencidas a la Fecha',mtError,[mbcancel],0);
       IBGrupo3.Close;
     end;
end;



end.
 