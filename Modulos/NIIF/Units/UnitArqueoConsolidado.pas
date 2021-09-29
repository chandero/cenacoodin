unit UnitArqueoConsolidado;

interface

uses
  Windows, Messages, DateUtils,SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBSQL, DB, IBCustomDataSet, IBQuery, pr_Common,
  pr_TxClasses, Buttons, ComCtrls, ExtCtrls;

type
  TfrmArqueoConsolidado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdFecha: TDateTimePicker;
    Panel2: TPanel;
    CmdGenera: TBitBtn;
    CmdCerrar: TBitBtn;
    Report: TprTxReport;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery2PRIMER_APELLIDO: TIBStringField;
    IBQuery2SEGUNDO_APELLIDO: TIBStringField;
    IBQuery2NOMBRE: TIBStringField;
    IBQuery: TIBQuery;
    IBQuery3: TIBQuery;
    IBSumas: TIBQuery;
    IBSQL2: TIBSQL;
    ChkCerradas: TCheckBox;
    Reporte1: TprTxReport;
    procedure CmdGeneraClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArqueoConsolidado: TfrmArqueoConsolidado;

implementation

{$R *.dfm}

uses UnitGlobales,UnitDmGeneral;

procedure TfrmArqueoConsolidado.CmdGeneraClick(Sender: TObject);
var Consignado,Retirado,Cheques:Currency;
    Fecha1,Fecha2:TDateTime;
begin

        Consignado := 0;
        Retirado := 0;
        Cheques  := 0;
        Fecha1 := EdFecha.Date;
        Fecha1 := EncodeDate(YearOf(Fecha1),MonthOf(Fecha1),DayOf(Fecha1));
        Fecha2 := EdFecha.Date;
        Fecha2 := EncodeDate(YearOf(Fecha2),MonthOf(Fecha2),DayOf(Fecha2));
        with IBQuery do
        begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('select SUM(SALDO_INICIAL_EFECTIVO) AS SALDO_INICIAL_EFECTIVO,');
            SQL.Add('SUM(SALDO_INICIAL_CHEQUE) AS SALDO_INICIAL_CHEQUE,');
            SQL.Add('SUM(SALDO_INICIAL_MONEDA) AS SALDO_INICIAL_MONEDA,');
            SQL.Add('SUM(SALDO_FINAL_CHEQUE) AS SALDO_FINAL_CHEQUE,');
            SQL.Add('SUM(SALDO_FINAL_EFECTIVO) AS SALDO_FINAL_EFECTIVO,');
            SQL.Add('SUM(SALDO_FINAL_MONEDA) AS SALDO_FINAL_MONEDA from "caj$cierres"');
            SQL.Add('where FECHA = :FECHA');
            if ChkCerradas.Checked then
               SQL.Add('and ESTADO <> 0');
            try
             ParamByName('FECHA').AsDate := EdFecha.Date;
             Open;
             if RecordCount < 1 then
              MessageDlg('No se encontro información inicial para este día',mtInformation,[mbok],0);
            except
              MessageDlg('Error Buscando Información de Cierre',mtError,[mbcancel],0);
              Exit;
            end;
        end;
        with IBSumas do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('SUM(BILLETES+MONEDAS) AS CONSIGNADO,SUM(CHEQUES) AS CHEQUES');
         SQL.Add('FROM "caj$movimiento"');
         SQL.Add('inner join "caj$cierres" on ("caj$movimiento".ID_CAJA = "caj$cierres".ID_CAJA)');
         SQL.Add('where FECHA_MOV BETWEEN :FECHA1 and :FECHA2');
         SQL.Add('and ID_TIPO_MOVIMIENTO = 1   and  "caj$cierres".FECHA = :FECHA');
         if ChkCerradas.Checked then
            SQL.Add('and "caj$cierres".ESTADO <> 0');
         ParamByName('FECHA').AsDate := EdFecha.Date;
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         try
           Open;
           Consignado := Consignado + FieldByName('CONSIGNADO').AsCurrency;
           Cheques := Cheques + FieldByName('CHEQUES').AsCurrency;
         except
           MessageDlg('Error al Sumar Movimientos',mtError,[mbcancel],0);
           Transaction.RollbackRetaining;
           Exit;
         end;
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('SUM(BILLETES+MONEDAS) AS CONSIGNADO,SUM(CHEQUES) AS CHEQUES');
         SQL.Add('FROM "caj$movimiento"');
         SQL.Add('inner join "caj$cierres" on ("caj$movimiento".ID_CAJA = "caj$cierres".ID_CAJA)');
         SQL.Add('where FECHA_MOV BETWEEN :FECHA1 and :FECHA2');
         SQL.Add(' and ID_TIPO_MOVIMIENTO = 2  and  "caj$cierres".FECHA = :FECHA');
         if ChkCerradas.Checked then begin
            SQL.Add('and "caj$cierres".ESTADO <> 0');
         end;
         ParamByName('FECHA').AsDate := EdFecha.Date;
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         try
           Open;
           Retirado := Retirado + FieldByName('CONSIGNADO').AsCurrency;
         except
           MessageDlg('Error al Sumar Movimientos',mtError,[mbcancel],0);
           Transaction.RollbackRetaining;
           Exit;
         end;
//** movimiento remotos
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('SUM(BILLETES+MONEDAS) AS CONSIGNADO,SUM(CHEQUES) AS CHEQUES');
         SQL.Add('FROM "caj$movremotosalida"');
         SQL.Add('inner join "caj$cierres" on ("caj$movremotosalida".ID_CAJA = "caj$cierres".ID_CAJA)');
         SQL.Add('where FECHA_MOV BETWEEN :FECHA1 and :FECHA2');
         SQL.Add('and ID_TIPO_MOVIMIENTO = 1');
         SQL.Add('and "caj$cierres".FECHA = :FECHA AND "caj$movremotosalida".ES_COMISION = 0');
         if ChkCerradas.Checked then
            SQL.Add('and "caj$cierres".ESTADO <> 0');
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA').AsDate := EdFecha.Date;
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         try
           Open;
           Consignado := Consignado + FieldByName('CONSIGNADO').AsCurrency;
           Cheques := Cheques + FieldByName('CHEQUES').AsCurrency;
         except
           MessageDlg('Error al Sumar Movimientos',mtError,[mbcancel],0);
           Transaction.RollbackRetaining;
           Exit;
         end;
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('SUM(BILLETES+MONEDAS) AS CONSIGNADO,SUM(CHEQUES) AS CHEQUES');
         SQL.Add('FROM "caj$movremotosalida"');
         SQL.Add('inner join "caj$cierres" on ("caj$movremotosalida".ID_CAJA = "caj$cierres".ID_CAJA)');
         SQL.Add('where FECHA_MOV BETWEEN :FECHA1 and :FECHA2');
         SQL.Add(' and ID_TIPO_MOVIMIENTO = 2 and "caj$cierres".FECHA = :FECHA AND "caj$movremotosalida".ES_COMISION = 0');
         if ChkCerradas.Checked then
            SQL.Add('and "caj$cierres".ESTADO <> 0');
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA').AsDate := EdFecha.Date;
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         try
           Open;
           Retirado := Retirado + FieldByName('CONSIGNADO').AsCurrency;
         except
           MessageDlg('Error al Sumar Movimientos',mtError,[mbcancel],0);
           Transaction.RollbackRetaining;
           Exit;
         end;
//** fin moviminetos remotos
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('SUM(BILLETES+MONEDAS) AS CONSIGNADO');
         SQL.Add('FROM "caj$movimientocol"');
         SQL.Add('inner join "caj$cierres" on ("caj$movimientocol".ID_CAJA = "caj$cierres".ID_CAJA)');
         SQL.Add('where FECHA_MOV BETWEEN :FECHA1 and :FECHA2');
         if ChkCerradas.Checked then begin
            SQL.Add('and "caj$cierres".ESTADO <> 0 and  "caj$cierres".FECHA = :FECHA');
            ParamByName('FECHA').AsDate := EdFecha.Date;
         end;
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         try
           Open;
           Consignado := Consignado + FieldByName('CONSIGNADO').AsCurrency;
         except
           MessageDlg('Error al Sumar Movimientos',mtError,[mbcancel],0);
           Transaction.RollbackRetaining;
           Exit;
         end;
        end;

        with IBSQL2 do begin
         Close;
         SQL.Clear;
         SQL.Add('select SUM(VALOR) AS SUMA from "caj$cheques"');
         SQL.Add('inner join "caj$cierres" on ("caj$cheques".ID_CAJA = "caj$cierres".ID_CAJA)');
         SQL.Add('where ("caj$cheques".ENVIADO =  0 AND "caj$cheques".FECHA = :FECHA)');
         if ChkCerradas.Checked then begin
            SQL.Add('and "caj$cierres".ESTADO <> 0 and  "caj$cierres".FECHA = :FECHA');
         end;
         ParamByName('FECHA').AsDate := EdFecha.Date;
         try
          ExecQuery;
          Cheques := FieldByName('SUMA').AsCurrency;
         except
          Cheques := 0;
         end;
        end;

        Reporte1.Variables.ByName['Empresa'].AsString := Empresa;
        Reporte1.Variables.ByName['Empleado'].AsString := Trim(Apellidos+' '+Nombres);
        Reporte1.Variables.ByName['Fecha'].AsDateTime := EdFecha.Date;
        if ChkCerradas.Checked then
          Reporte1.Variables.ByName['Descripcion'].AsString := 'Cajas Cerradas del Día'
        else
          Reporte1.Variables.ByName['Descripcion'].AsString := '';
        Reporte1.Variables.ByName['Consignado'].AsDouble := Consignado;
        Reporte1.Variables.ByName['Retirado'].AsDouble := Retirado;
        Reporte1.Variables.ByName['Cheques'].AsDouble := Cheques;
        if Reporte1.PrepareReport then
           Reporte1.PreviewPreparedReport(True);


end;

procedure TfrmArqueoConsolidado.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmArqueoConsolidado.FormShow(Sender: TObject);
begin
        EdFecha.Date := fFechaActual;
end;

procedure TfrmArqueoConsolidado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
