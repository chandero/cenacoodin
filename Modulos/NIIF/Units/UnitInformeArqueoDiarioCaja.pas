unit UnitInformeArqueoDiarioCaja;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, StdCtrls,
  Buttons, JvEdit, JvTypedEdit, ComCtrls, ExtCtrls, IBSQL;

type
  TfrmInformeArqueoDiarioCaja = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Caja: TLabel;
    EdFecha: TDateTimePicker;
    EdCaja: TJvIntegerEdit;
    Panel2: TPanel;
    CmdGenera: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery: TIBQuery;
    IBQuery3: TIBQuery;
    IBQueryID_CAJA: TSmallintField;
    IBQueryFECHA: TDateField;
    IBQuerySALDO_INICIAL_EFECTIVO: TIBBCDField;
    IBQuerySALDO_INICIAL_CHEQUE: TIBBCDField;
    IBQuerySALDO_INICIAL_MONEDA: TIBBCDField;
    IBQuerySALDO_FINAL_CHEQUE: TIBBCDField;
    IBQuerySALDO_FINAL_EFECTIVO: TIBBCDField;
    IBQuerySALDO_FINAL_MONEDA: TIBBCDField;
    IBQuery2PRIMER_APELLIDO: TIBStringField;
    IBQuery2SEGUNDO_APELLIDO: TIBStringField;
    IBQuery2NOMBRE: TIBStringField;
    Report: TprTxReport;
    IBSumas: TIBQuery;
    IBSQL2: TIBSQL;
    Reporte1: TprTxReport;
    procedure CmdGeneraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeArqueoDiarioCaja: TfrmInformeArqueoDiarioCaja;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmInformeArqueoDiarioCaja.CmdGeneraClick(Sender: TObject);
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
        try
            IBQuery.Close;
            IBQuery.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
            IBQuery.ParamByName('FECHA').AsDate := EdFecha.Date;
            IBQuery.Open;
            if IBQuery.RecordCount < 1 then
              MessageDlg('No se encontro información inicial para este día',mtInformation,[mbok],0);
        except
             MessageDlg('Error Buscando Información de Cierre',mtError,[mbcancel],0);
             Exit;
        end;
{
        try
            IBQuery1.Close;
            IBQuery1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBQuery1.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
            IBQuery1.ParamByName('FECHA_MOV').AsDate := EdFecha.Date;
            IBQuery1.Open;
            if IBQuery1.RecordCount < 1 then
               MessageDlg('No se encontro información de arqueo para este día',mtInformation,[mbok],0);
        except
              MessageDlg('Error Buscando Información de Arqueo',mtError,[mbcancel],0);
              Exit;
        end;
}
        try
            IBQuery2.Close;
            IBQuery2.ParamByName('ID_EMPLEADO').AsString := DBAlias;
            IBQuery2.Open;
        except
            MessageDlg('Error Buscando Funcionario',mtError,[mbcancel],0);
            Exit;
        end;

{        try
            IBQuery3.Close;
            IBQuery3.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBQuery3.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
            IBQuery3.ParamByName('FECHA_MOV').AsDate := EdFecha.Date;
            IBQuery3.Open;
            if IBQuery1.RecordCount < 1 then
               MessageDlg('No se encontro información de arqueo monedas para este día',mtInformation,[mbok],0);
        except
              MessageDlg('Error Buscando Información de Arqueo Monedas',mtError,[mbcancel],0);
              Exit;
        end;
}
        with IBSumas do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('SUM(BILLETES+MONEDAS) AS CONSIGNADO,SUM(CHEQUES) AS CHEQUES');
         SQL.Add('FROM "caj$movimiento" where FECHA_MOV BETWEEN :FECHA1 and :FECHA2 and ID_CAJA = :ID_CAJA');
         SQL.Add(' and ID_TIPO_MOVIMIENTO = 1');
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
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
         SQL.Add('FROM "caj$movimiento" where FECHA_MOV BETWEEN :FECHA1 and :FECHA2 and ID_CAJA = :ID_CAJA');
         SQL.Add(' and ID_TIPO_MOVIMIENTO = 2');
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
         try
           Open;
           Retirado := Retirado + FieldByName('CONSIGNADO').AsCurrency;
         except
           MessageDlg('Error al Sumar Movimientos',mtError,[mbcancel],0);
           Transaction.RollbackRetaining;
           Exit;
         end;
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('SUM(BILLETES+MONEDAS) AS CONSIGNADO');
         SQL.Add('FROM "caj$movimientocol" where FECHA_MOV BETWEEN :FECHA1 and :FECHA2 and ID_CAJA = :ID_CAJA');
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
         try
           Open;
           Consignado := Consignado + FieldByName('CONSIGNADO').AsCurrency;
         except
           MessageDlg('Error al Sumar Movimientos',mtError,[mbcancel],0);
           Transaction.RollbackRetaining;
           Exit;
         end;
        // inicio saldos remotos
           Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('SUM(BILLETES+MONEDAS) AS CONSIGNADO,SUM(CHEQUES) AS CHEQUES');
         SQL.Add('FROM "caj$movremotosalida" where (FECHA_MOV BETWEEN :FECHA1 and :FECHA2 and ID_CAJA = :ID_CAJA) AND (ES_COMISION = 0)');
         SQL.Add('and ID_TIPO_MOVIMIENTO = 1');
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
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
         SQL.Add('FROM "caj$movremotosalida" where (FECHA_MOV BETWEEN :FECHA1 and :FECHA2 and ID_CAJA = :ID_CAJA) AND (ES_COMISION = 0)');
         SQL.Add(' and ID_TIPO_MOVIMIENTO = 2');
         ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
         ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
         ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
         try
           Open;
           Retirado := Retirado + FieldByName('CONSIGNADO').AsCurrency;
         except
           MessageDlg('Error al Sumar Movimientos',mtError,[mbcancel],0);
           Transaction.RollbackRetaining;
           Exit;
         end;
        // fin saldos remotos

        end;
        with IBSQL2 do begin
         Close;
         ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
         ParamByName('FECHA').AsDate := EdFecha.Date;
         try
          ExecQuery;
          Cheques := FieldByName('SUMA').AsCurrency;
         except
          Cheques := 0;
         end;
        end;

        Reporte1.Variables.ByName['Empresa'].AsString := Empresa;
        Reporte1.Variables.ByName['Consignado'].AsDouble := Consignado;
        Reporte1.Variables.ByName['Retirado'].AsDouble := Retirado;
        Reporte1.Variables.ByName['Cheques'].AsDouble := Cheques;
        if Reporte1.PrepareReport then
           Reporte1.PreviewPreparedReport(True);
//      if Report.PrepareReport then
//          Report.PreviewPreparedReport(True);


end;
procedure TfrmInformeArqueoDiarioCaja.FormShow(Sender: TObject);
begin
        EdFecha.Date := Date;
        if IBQuery.Transaction.InTransaction then
           IBQuery.Transaction.Commit;
        IBQuery.Transaction.StartTransaction;

end;

procedure TfrmInformeArqueoDiarioCaja.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeArqueoDiarioCaja.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

end.
