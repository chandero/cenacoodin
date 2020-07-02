unit UnitCierreDiarioCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, StdCtrls,
  Buttons, JvEdit, JvTypedEdit, ComCtrls, ExtCtrls, IBSQL, DateUtils;

type
  TfrmCierreDiarioCaja = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Caja: TLabel;
    EdFecha: TDateTimePicker;
    Panel2: TPanel;
    CmdCierre: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery: TIBQuery;
    IBQuery1: TIBQuery;
    EdCaja: TStaticText;
    IBsql1: TIBSQL;
    EdUsuario: TStaticText;
    Label2: TLabel;
    Label3: TLabel;
    EdNuevaFecha: TDateTimePicker;
    Label4: TLabel;
    IBSQL2: TIBSQL;
    procedure FormShow(Sender: TObject);
    procedure CmdCierreClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CerrarCaja;
  public
    function ValidarCaja: Boolean;
    { Public declarations }
  end;

var
  frmCierreDiarioCaja: TfrmCierreDiarioCaja;

implementation

uses UnitdmGeneral, UnitGlobales;

{$R *.dfm}

function TfrmCierreDiarioCaja.ValidarCaja: boolean;
begin
         Result := False;
         if dmGeneral.IBTransaction1.InTransaction then
         begin
            dmGeneral.IBTransaction1.Commit;
         end;
         with IBsql1 do
         begin
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"caj$cajas".ID_CAJA,');
           SQL.Add('"caj$cajas".HORA_INICIO,');
           SQL.Add('"caj$cajas".HORA_FINAL,');
           SQL.Add('"caj$estados".PERMITE_MOVIMIENTO,');
           SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
           SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$empleado".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('"caj$cajas"');
           SQL.Add('INNER JOIN "caj$estados" ON ("caj$cajas".ID_ESTADO_CAJA = "caj$estados".ID_ESTADO)');
           SQL.Add('INNER JOIN "gen$empleado" ON ("caj$cajas".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('where "caj$cajas".ID_EMPLEADO = :ID_EMPLEADO');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           try
            ExecQuery;
            if RecordCount > 0 then
            begin
               if FieldByName('PERMITE_MOVIMIENTO').AsInteger = 0 then
               begin
                  Result := False;
                  Exit;
               end;
               if ( FieldByName('HORA_INICIO').AsTime > Time ) or
                  ( FieldByName('HORA_FINAL').AsTime < Time ) then
               begin
                  Result := False;
                  Exit;
               end;
               EdCaja.Caption := IntToStr(FieldByName('ID_CAJA').AsInteger);
               EdUsuario.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                    FieldByName('NOMBRE').AsString;
            end
            else
            begin
              Result := False;
              Close;
              Exit;
            end;
           except
              Result := False;
              Exit;
           end;
         end;
         Result := True;

end;

procedure TfrmCierreDiarioCaja.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        ValidarCaja;
        EdFecha.Date := Date;
        EdNuevaFecha.Date := IncDay(Date);
end;

procedure TfrmCierreDiarioCaja.CmdCierreClick(Sender: TObject);

begin
        with IBsql1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "caj$cierres" where ID_CAJA = :ID_CAJA and FECHA = :FECHA');
           ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
           ParamByName('FECHA').AsDate := EdFecha.Date;
           try
             ExecQuery;
             if RecordCount > 0 then
             begin
              if FieldByName('ESTADO').AsInteger = 0 then
                 CerrarCaja;
             end
             else
             begin
                 MessageDlg('Ese día no puede ser cerrado',mterror,[mbcancel],0);
                 Transaction.Rollback;
             end;
           except
              Messagedlg('Error consultando día',mterror,[mbcancel],0);
              Transaction.Rollback;              
           end;
        end;
end;

procedure TfrmCierreDiarioCaja.CerrarCaja;
var ValorArqueo,ValorEMov,ValorCMov:Currency;
    ValorBInicial,ValorMInicial,ValorEInicial,ValorCInicial:Currency;
    ValorBilletes,ValorMonedas:Currency;
    Fecha1,Fecha2:TDateTime;
    Cheques:Currency;
    ValorRMov,ValorRCMov:Currency;
begin
       ValorBilletes := 0;
       ValorMonedas  := 0;

        Fecha1 := EdFecha.Date;
        Fecha1 := EncodeDate(YearOf(Fecha1),MonthOf(Fecha1),DayOf(Fecha1));
        Fecha2 := EdFecha.Date;
        Fecha2 := EncodeDate(YearOf(Fecha2),MonthOf(Fecha2),DayOf(Fecha2));


       if EdNuevaFecha.Date <= EdFecha.Date then
       begin
         MessageDlg('La nueva fecha no puede ser '+#13+
                    'Anterior o Igual a la Actual',mtError,[mbcancel],0);
         EdNuevaFecha.SetFocus;
         Exit;
       end;

       if MessageDlg('Seguro de Cerrar el Día?',mtConfirmation,[mbyes,mbno],0) = mrno then
          Exit;

// leer arqueo del día
       with IBsql1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('SUM ("gen$denominaciones".VALOR * "caj$arqueos".CANTIDAD_DENOMINACION) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"caj$arqueos"');
          SQL.Add('INNER JOIN "gen$denominaciones" ON ("caj$arqueos".ID_DENOMINACION = "gen$denominaciones".ID_DENOMINACION)');
          SQL.Add('WHERE');
          SQL.Add('(ID_AGENCIA = :ID_AGENCIA) AND');
          SQL.Add('(ID_CAJA = :ID_CAJA) AND');
          SQL.Add('(FECHA_MOV = :FECHA_MOV) AND');
          SQL.Add('("gen$denominaciones".ID_DENOMINACION <> 0)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA_MOV').AsDate := EdFecha.Date;
          try
            ExecQuery;
            ValorArqueo := FieldByName('TOTAL').AsCurrency;
          except
            MessageDlg('Error verificando arqueo del día',mtError,[mbcancel],0);
            IBQuery.Transaction.Rollback;
           Exit;
          end;

          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('SUM ("caj$arqueos".VALOR_DENOMINACION) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"caj$arqueos"');
          SQL.Add('INNER JOIN "gen$denominaciones" ON ("caj$arqueos".ID_DENOMINACION = "gen$denominaciones".ID_DENOMINACION)');
          SQL.Add('WHERE');
          SQL.Add('(ID_AGENCIA = :ID_AGENCIA) AND');
          SQL.Add('(ID_CAJA = :ID_CAJA) AND');
          SQL.Add('(FECHA_MOV = :FECHA_MOV) AND');
          SQL.Add('("gen$denominaciones".ID_DENOMINACION = 0)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA_MOV').AsDate := EdFecha.Date;
          try
            ExecQuery;
            ValorArqueo := ValorArqueo+FieldByName('TOTAL').AsCurrency;
          except
            MessageDlg('Error verificando arqueo monedas del día',mtError,[mbcancel],0);
            IBQuery.Transaction.Rollback;
            Exit;
          end;

          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('SUM(BILLETES) AS BILLETE, SUM(MONEDAS) AS MONEDA, SUM(BILLETES+MONEDAS) AS EFECTIVO,');
          SQL.Add('SUM(CHEQUES) AS CHEQUE');
          SQL.Add('FROM');
          SQL.Add('"caj$movimiento"');
          SQL.Add('WHERE');
          SQL.Add('"caj$movimiento".ID_CAJA = :ID_CAJA and');
          SQL.Add('"caj$movimiento".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('"caj$movimiento".FECHA_MOV BETWEEN :FECHA1 and :FECHA2 and');
          SQL.Add('"caj$movimiento".ID_TIPO_MOVIMIENTO = 1');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
          ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
          try
           ExecQuery;
           ValorEMov := FieldByName('EFECTIVO').AsCurrency;
           ValorCMov := FieldByName('CHEQUE').AsCurrency;
           ValorBilletes := ValorBilletes + FieldByName('BILLETE').AsCurrency;
           ValorMonedas := ValorMonedas + FieldByName('MONEDA').AsCurrency;
          except
           MessageDlg('Error leyendo movimiento',mtError,[mbcancel],0);
           IBQuery.Transaction.Rollback;
           Exit;
          end;

          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('SUM(BILLETES) AS BILLETE, SUM(MONEDAS) AS MONEDA, SUM(BILLETES+MONEDAS) AS EFECTIVO,');
          SQL.Add('SUM(CHEQUES) AS CHEQUE');
          SQL.Add('FROM');
          SQL.Add('"caj$movimiento"');
          SQL.Add('WHERE');
          SQL.Add('"caj$movimiento".ID_CAJA = :ID_CAJA and');
          SQL.Add('"caj$movimiento".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('"caj$movimiento".FECHA_MOV BETWEEN :FECHA1 and :FECHA2 and');
          SQL.Add('"caj$movimiento".ID_TIPO_MOVIMIENTO = 2');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
          ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
          try
           ExecQuery;
           ValorRMov := FieldByName('EFECTIVO').AsCurrency;
           ValorRCMov := FieldByName('CHEQUE').AsCurrency;
//           ValorBilletesR := FieldByName('BILLETE').AsCurrency;
//           ValorMonedasR :=  FieldByName('MONEDA').AsCurrency;
          except
           MessageDlg('Error leyendo movimiento',mtError,[mbcancel],0);
           IBQuery.Transaction.Rollback;
           Exit;
          end;
//*** inicio movimientos remotos
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('SUM(BILLETES) AS BILLETE, SUM(MONEDAS) AS MONEDA, SUM(BILLETES+MONEDAS) AS EFECTIVO,');
          SQL.Add('SUM(CHEQUES) AS CHEQUE');
          SQL.Add('FROM');
          SQL.Add('"caj$movremotosalida"');
          SQL.Add('WHERE');
          SQL.Add('ID_CAJA = :ID_CAJA and');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('FECHA_MOV BETWEEN :FECHA1 and :FECHA2 and');
          SQL.Add('ID_TIPO_MOVIMIENTO = 1 AND ES_COMISION = 0');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
          ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
          try
           ExecQuery;
           ValorEMov := ValorEMov + FieldByName('EFECTIVO').AsCurrency;
           ValorCMov := ValorCMov + FieldByName('CHEQUE').AsCurrency;
           ValorBilletes := ValorBilletes + FieldByName('BILLETE').AsCurrency;
           ValorMonedas := ValorMonedas + FieldByName('MONEDA').AsCurrency;
          except
           MessageDlg('Error leyendo movimiento',mtError,[mbcancel],0);
           IBQuery.Transaction.Rollback;
           Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('SUM(BILLETES) AS BILLETE, SUM(MONEDAS) AS MONEDA, SUM(BILLETES+MONEDAS) AS EFECTIVO,');
          SQL.Add('SUM(CHEQUES) AS CHEQUE');
          SQL.Add('FROM');
          SQL.Add('"caj$movremotosalida"');
          SQL.Add('WHERE');
          SQL.Add('ID_CAJA = :ID_CAJA and');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('FECHA_MOV BETWEEN :FECHA1 and :FECHA2 and');
          SQL.Add('ID_TIPO_MOVIMIENTO = 2 AND ES_COMISION = 0');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
          ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
          try
           ExecQuery;
           ValorRMov := ValorRMov + FieldByName('EFECTIVO').AsCurrency;
           ValorRCMov := ValorRMov + FieldByName('CHEQUE').AsCurrency;
          except
           MessageDlg('Error leyendo movimiento',mtError,[mbcancel],0);
           IBQuery.Transaction.Rollback;
           Exit;
          end;
//*** fin movimientos remotos
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('SUM(BILLETES) AS BILLETE, SUM(MONEDAS) AS MONEDA, SUM(BILLETES+MONEDAS) AS EFECTIVO');
          SQL.Add('FROM');
          SQL.Add('"caj$movimientocol"');
          SQL.Add('WHERE');
          SQL.Add('"caj$movimientocol".ID_CAJA = :ID_CAJA and');
          SQL.Add('"caj$movimientocol".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('"caj$movimientocol".FECHA_MOV BETWEEN :FECHA1 and :FECHA2');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
          ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
          try
           ExecQuery;
           ValorEMov := ValorEMov + FieldByName('EFECTIVO').AsCurrency;
           ValorBilletes := ValorBilletes + FieldByName('BILLETE').AsCurrency;
           ValorMonedas := ValorMonedas + FieldByName('MONEDA').AsCurrency;
          except
           MessageDlg('Error leyendo movimiento colocaciones',mtError,[mbcancel],0);
           IBQuery.Transaction.Rollback;
           Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('SUM(BILLETES) AS BILLETE, SUM(MONEDAS) AS MONEDA, SUM(BILLETES+MONEDAS) AS EFECTIVO');
          SQL.Add('FROM');
          SQL.Add('"caj$recaudos"');
          SQL.Add('WHERE');
          SQL.Add('"caj$recaudos".ID_CAJA = :ID_CAJA and');
          SQL.Add('"caj$recaudos".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('"caj$recaudos".FECHA_MOV BETWEEN :FECHA1 and :FECHA2');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
          ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
          try
           ExecQuery;
           ValorEMov := ValorEMov + FieldByName('EFECTIVO').AsCurrency;
           ValorBilletes := ValorBilletes + FieldByName('BILLETE').AsCurrency;
           ValorMonedas := ValorMonedas + FieldByName('MONEDA').AsCurrency;
          except
           MessageDlg('Error leyendo otros recaudos',mtError,[mbcancel],0);
           IBQuery.Transaction.Rollback;
           Exit;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select * from "caj$cierres" where ID_CAJA = :ID_CAJA and FECHA = :FECHA');
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
            ExecQuery;
            ValorEInicial := FieldByName('SALDO_INICIAL_EFECTIVO').AsCurrency + FieldByName('SALDO_INICIAL_MONEDA').AsCurrency;
            ValorCInicial := FieldByName('SALDO_INICIAL_CHEQUE').AsCurrency;
            ValorBInicial := FieldByName('SALDO_INICIAL_EFECTIVO').AsCurrency;
            ValorMInicial := FieldByName('SALDO_INICIAL_MONEDA').AsCurrency;
          except
            MessageDlg('Error leyendo saldos iniciales',mtError,[mbcancel],0);
            IBQuery.Transaction.Rollback;
            Exit;
          end;
          Close;
       end;

{      if ( (ValorEInicial + ValorEMov) <> ValorArqueo ) then
       begin
        MessageDlg('Información Movimiento=Arqueo no concuerda'+#13+
                   FormatCurr('#,#0.00',(ValorEInicial + ValorEMov))+'='+FormatCurr('#,#0.00',ValorArqueo),mtError,[mbcancel],0);
        Exit;
       end;
}
// Proceso de cierre

// 1. Actualizar Arqueo al Nuevo Dia
        ValorCMov := 0;
        with IBSQL2 do begin
          Close;
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          try
           ExecQuery;
           ValorCMov := FieldByName('SUMA').AsCurrency;
          except
           ValorCMov := 0;
          end;
        end;
        
        with IBsql1 do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('"caj$arqueos".ID_AGENCIA,');
         SQL.Add('"caj$arqueos".ID_CAJA,');
         SQL.Add('"caj$arqueos".ID_DENOMINACION,');
         SQL.Add('"caj$arqueos".CANTIDAD_DENOMINACION,');
         SQL.Add('"caj$arqueos".VALOR_DENOMINACION');
         SQL.Add('FROM');
         SQL.Add('"caj$arqueos"');
         SQL.Add('WHERE');
         SQL.Add('(ID_AGENCIA = :ID_AGENCIA) AND');
         SQL.Add('(ID_CAJA = :ID_CAJA) AND');
         SQL.Add('(FECHA_MOV = :FECHA_MOV)');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         ParamByName('FECHA_MOV').AsDate := EdFecha.Date;
         try
          ExecQuery;
          IBQuery.Close;
          while not Eof do begin
           IBQuery.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
           IBQuery.ParamByName('ID_CAJA').AsInteger := FieldByName('ID_CAJA').AsInteger;
           IBQuery.ParamByName('FECHA_MOV').AsDate := EdNuevaFecha.Date;
           IBQuery.ParamByName('ID_DENOMINACION').AsInteger := FieldByName('ID_DENOMINACION').AsInteger;
           IBQuery.ParamByName('CANTIDAD_DENOMINACION').AsInteger := FieldByName('CANTIDAD_DENOMINACION').AsInteger;
           IBQuery.ParamByName('VALOR_DENOMINACION').AsCurrency := FieldByName('VALOR_DENOMINACION').AsCurrency;
           try
             IBQuery.ExecSQL;
           except
             MessageDlg('Error Actualizando nuevo arqueo',mtError,[mbcancel],0);
             IBQuery.Transaction.Rollback;
             Exit;
           end;
           Next;
          end;
         except
           MessageDlg('Error actualizando arqueo del nuevo día',mtError,[mbcancel],0);
           IBQuery.Transaction.Rollback;
           Exit;
         end;
        end;
// Busco Cheques en Caja
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT SUM(VALOR) AS VALOR FROM "caj$cheques" WHERE ID_CAJA = :ID_CAJA and ');
         SQL.Add('ENVIADO = 0');
         ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
         try
          ExecQuery;
          ValorRCMov := FieldByName('VALOR').AsCurrency;
         except
           MessageDlg('Error actualizando arqueo del nuevo día',mtError,[mbcancel],0);
           IBQuery.Transaction.Rollback;
           Exit;
         end;
        end;
// Fin Busco Cheques en Caja
// Actualizar Cierre del Dia

        with IBsql1 do begin
          Close;
          SQL.Clear;
          SQL.Add('Update "caj$cierres" ');
          SQL.Add('set SALDO_FINAL_EFECTIVO = :EFECTIVO,');
          SQL.Add('SALDO_FINAL_CHEQUE = :CHEQUE,');
          SQL.Add('SALDO_FINAL_MONEDA = :MONEDA,');
          SQL.Add('ESTADO = 1');
          SQL.Add('where');
          SQL.Add('ID_CAJA = :ID_CAJA and');
          SQL.Add('FECHA = :FECHA');
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA').AsDate := EdFecha.Date;
          ParamByName('EFECTIVO').AsCurrency := ValorBInicial + ValorBilletes - ValorRMov;
          ParamByName('MONEDA').AsCurrency := ValorMInicial + ValorMonedas;
          ParamByName('CHEQUE').AsCurrency := ValorRCMov;
          try
            ExecQuery;
          except
            MessageDlg('Error actualizando cierre del día',mtError,[mbcancel],0);
            IBQuery.Transaction.Rollback;
            Exit;
          end;
        end;

// Crear nuevo dia en "caj$cierres"
        with IBsql1 do begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "caj$cierres" values(');
          SQL.Add(':ID_CAJA,:FECHA,:SALDO_INICIAL_EFECTIVO,');
          SQL.Add(':SALDO_INICIAL_CHEQUE,:SALDO_INICIAL_MONEDA,');
          SQL.Add(':SALDO_FINAL_EFECTIVO,:SALDO_FINAL_CHEQUE,');
          SQL.Add(':SALDO_FINAL_MONEDA,:ESTADO,:CONTABILIZADO)');
          ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
          ParamByName('FECHA').AsDate := EdNuevaFecha.Date;
          ParamByName('SALDO_INICIAL_EFECTIVO').AsCurrency := ValorBInicial + ValorBilletes - ValorRMov;
          ParamByName('SALDO_INICIAL_MONEDA').AsCurrency := ValorMInicial + ValorMonedas;
          ParamByName('SALDO_INICIAL_CHEQUE').AsCurrency := ValorRCMov;
          ParamByName('SALDO_FINAL_EFECTIVO').AsCurrency := 0;
          ParamByName('SALDO_FINAL_MONEDA').AsCurrency := 0;
          ParamByName('SALDO_FINAL_CHEQUE').AsCurrency := 0;
          ParamByName('ESTADO').AsInteger := 0;
          ParamByName('CONTABILIZADO').AsInteger := 0;
          try
            ExecQuery;
          except
            MessageDlg('Error creando nuevo dia en cierre',mtError,[mbcancel],0);
            IBQuery.Transaction.Rollback;
            Exit;
          end;
        end;

        IBQuery.Transaction.Commit;
        MessageDlg('Proceso de Cierre Culminado con Exito!',mtInformation,[mbok],0);
        CmdCierre.Enabled := False;


end;

procedure TfrmCierreDiarioCaja.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCierreDiarioCaja.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
