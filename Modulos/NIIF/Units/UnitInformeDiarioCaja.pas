unit UnitInformeDiarioCaja;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, pr_Common, pr_TxClasses, pr_Parser,
  DB, IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, IBSQL, DBClient;

type
  TfrmInformeDiarioCaja = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EdFecha: TDateTimePicker;
    Label1: TLabel;
    CmdGenera: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    Caja: TLabel;
    EdCaja: TJvIntegerEdit;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    IBQuery: TIBQuery;
    IBQuery3ID_CAJA: TSmallintField;
    IBQuery3ID_AGENCIA: TSmallintField;
    IBQuery3ID_COLOCACION: TIBStringField;
    IBQuery3DOCUMENTO: TIntegerField;
    IBQuery3CAPITAL: TIBBCDField;
    IBQuery3INTERESES: TIBBCDField;
    IBQuery3DEVOLUCION: TIBBCDField;
    IBQuery3OTROS: TIBBCDField;
    IBQuery3BILLETES: TIBBCDField;
    IBQuery3MONEDAS: TIBBCDField;
    IBQuery3NOMBRE: TIBStringField;
    IBQuery3PRIMER_APELLIDO: TIBStringField;
    IBQuery3SEGUNDO_APELLIDO: TIBStringField;
    IBQuery4: TIBQuery;
    IBQuery4CANTIDAD: TIntegerField;
    IBQuery4EFECTIVO: TIBBCDField;
    ClientDataSet1: TClientDataSet;
    IBSQL1: TIBSQL;
    prTxReport1: TprTxReport;
    Report: TprTxReport;
    procedure CmdGeneraClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ReportUnknownObjFunction(Sender: TObject;
      Component: TComponent; const FuncName: String;
      const Parameters: TprVarsArray; ParametersCount: Integer;
      var Value: TprVarValue; var IsProcessed: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    function ValidarCaja: Boolean;
    { Public declarations }
  end;

var
  frmInformeDiarioCaja: TfrmInformeDiarioCaja;
  Tabla:string;
  Generado:Boolean;
  Empleado:string;
implementation

uses UnitdmGeneral, UnitGlobales, UnitVistaPreliminar;
{$R *.dfm}

procedure TfrmInformeDiarioCaja.CmdGeneraClick(Sender: TObject);
var Fecha1,Fecha2:TDateTime;
    frmVistaPreliminar :TfrmVistaPreliminar;
begin
       Generado := True;
       Tabla := '"diariocaj' + IntToStr(EdCaja.Value)+FloatToStr(Time)+'"';
        with IBQuery do
        begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('create table ' + Tabla + '(');
            SQL.Add('ID_AGENCIA SMALLINT,');
            SQL.Add('AGENCIA VARCHAR(50),');
            SQL.Add('ID_CAJA SMALLINT,');
            SQL.Add('FECHA_MOV TIMESTAMP,');
            SQL.Add('ORIGEN_MOVIMIENTO SMALLINT,');
            SQL.Add('ID_TIPO_CAPTACION SMALLINT,');
            SQL.Add('NUMERO_CUENTA INTEGER,');
            SQL.Add('NOMBRE VARCHAR(255),');
            SQL.Add('DOCUMENTO VARCHAR(15),');
            SQL.Add('ID_TIPO_MOVIMIENTO SMALLINT,');
            SQL.Add('EFECTIVO_DB NUMERICO,');
            SQL.Add('CHEQUE_DB NUMERICO,');
            SQL.Add('EFECTIVO_CR NUMERICO,');
            SQL.Add('CHEQUE_CR NUMERICO,DESCRIPCION_AGENCIA VARCHAR(50))');
            try
               ExecSQL;
            finally
               IBQuery.Transaction.Commit;
            end;
            Close;
        end;
        Fecha1 := EdFecha.Date;
        Fecha1 := EncodeDate(YearOf(Fecha1),MonthOf(Fecha1),DayOf(Fecha1));
        Fecha2 := EdFecha.Date;
        Fecha2 := EncodeDate(YearOf(Fecha2),MonthOf(Fecha2),DayOf(Fecha2));
        with IBQuery do begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"caj$movimiento".ID_CAJA,');
            SQL.Add('"caj$movimiento".ID_AGENCIA,');
            SQL.Add('"caj$movimiento".FECHA_MOV,');
            SQL.Add('"caj$movimiento".ID_TIPO_CAPTACION,');
            SQL.Add('"caj$movimiento".NUMERO_CUENTA,');
            SQL.Add('"caj$movimiento".DIGITO_CUENTA,');
            SQL.Add('"caj$movimiento".ORIGEN_MOVIMIENTO,');
            SQL.Add('"caj$movimiento".ID_TIPO_MOVIMIENTO,');
            SQL.Add('"caj$movimiento".DOCUMENTO,');
            SQL.Add('"caj$movimiento".BILLETES,');
            SQL.Add('"caj$movimiento".MONEDAS,');
            SQL.Add('"caj$movimiento".CHEQUES,');
            SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
            SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
            SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
            SQL.Add('"gen$empleado".NOMBRE,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
            SQL.Add('"gen$persona".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
            SQL.Add('"gen$persona".NOMBRE AS NOMBRE1');
            SQL.Add('FROM');
            SQL.Add('"caj$movimiento"');
            SQL.Add('LEFT JOIN "gen$agencia" ON ("caj$movimiento".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
            SQL.Add('LEFT JOIN "caj$cajas" ON ("caj$movimiento".ID_CAJA = "caj$cajas".ID_CAJA)');
            SQL.Add('LEFT JOIN "gen$empleado" ON ("caj$cajas".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
            SQL.Add('LEFT JOIN "cap$maestro" ON ("caj$movimiento".ID_AGENCIA = "cap$maestro".ID_AGENCIA) AND ("caj$movimiento".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION) AND ');
            SQL.Add('("caj$movimiento".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA) AND ("caj$movimiento".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
            SQL.Add('LEFT JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
            SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
            SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
            SQL.Add('WHERE');
            SQL.Add('(FECHA_MOV BETWEEN :FECHA1 AND :FECHA2) AND');
            SQL.Add('("caj$movimiento".ID_CAJA = :ID_CAJA) AND');
            SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1)');
            SQL.Add('ORDER BY');
            SQL.Add('"caj$movimiento".ORIGEN_MOVIMIENTO,');
            SQL.Add('"caj$movimiento".ID_TIPO_MOVIMIENTO,');
            SQL.Add('"caj$movimiento".FECHA_MOV');
            ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
            ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
            ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
            try
             Open;
             IBQuery1.SQL.Clear;
             IBQuery1.SQL.Add('insert into '+Tabla+' values(');
             IBQuery1.SQL.Add(':ID_AGENCIA,:AGENCIA,:ID_CAJA,:FECHA_MOV,:ORIGEN_MOVIMIENTO,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
             IBQuery1.SQL.Add(':NOMBRE,:DOCUMENTO,:ID_TIPO_MOVIMIENTO,');
             IBQuery1.SQL.Add(':EFECTIVO_DB,:CHEQUE_DB,:EFECTIVO_CR,:CHEQUE_CR,:DESCRIPCION_AGENCIA)');
             while not Eof do
             begin
               IBQuery1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBQuery1.ParamByName('AGENCIA').AsString := FieldByName('DESCRIPCION_AGENCIA').AsString;
               IBQuery1.ParamByName('ID_CAJA').AsInteger := FieldByName('ID_CAJA').AsInteger;
               IBQuery1.ParamByName('FECHA_MOV').AsDateTime := FieldByName('FECHA_MOV').AsDateTime;
               IBQuery1.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := FieldByName('ORIGEN_MOVIMIENTO').AsInteger;
               IBQuery1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               IBQuery1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBQuery1.ParamByName('NOMBRE').AsString := FieldByName('PRIMER_APELLIDO1').AsString + ' ' +FieldByName('SEGUNDO_APELLIDO1').AsString + ' ' + FieldByName('NOMBRE1').AsString;
               IBQuery1.ParamByName('DOCUMENTO').AsString := FieldByName('DOCUMENTO').AsString;
               IBQuery1.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
               if FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1 then
               begin
                  IBQuery1.ParamByName('EFECTIVO_DB').AsCurrency := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                  IBQuery1.ParamByName('CHEQUE_DB').AsCurrency := FieldByName('CHEQUES').AsCurrency;
                  IBQuery1.ParamByName('EFECTIVO_CR').AsCurrency := 0;
                  IBQuery1.ParamByName('CHEQUE_CR').AsCurrency := 0;
               end
               else
               begin
                  IBQuery1.ParamByName('EFECTIVO_CR').AsCurrency := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                  IBQuery1.ParamByName('CHEQUE_CR').AsCurrency := FieldByName('CHEQUES').AsCurrency;
                  IBQuery1.ParamByName('EFECTIVO_DB').AsCurrency := 0;
                  IBQuery1.ParamByName('CHEQUE_DB').AsCurrency := 0;
               end;
               IBQuery1.ParamByName('DESCRIPCION_AGENCIA').AsString := FieldByName('DESCRIPCION_AGENCIA').AsString;
               try
                 IBQuery1.ExecSQL;
               except
                 MessageDlg('Error al actualizar temporal',mtError,[mbcancel],0);
               end;
               Next;
             end
           except
              MessageDlg('Error al tratar de generar el informe',mtError,[mbcancel],0);
           end;
   //*** comienzo de lectura de datos remotos
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"caj$movremotosalida".ID_CAJA,');
            SQL.Add('"caj$movremotosalida".ID_AGENCIA_REMOTA,');
            SQL.Add('"caj$movremotosalida".FECHA_MOV,');
            SQL.Add('"caj$movremotosalida".ID_TIPO_CAPTACION,');
            SQL.Add('"caj$movremotosalida".NUMERO_CUENTA,');
            SQL.Add('"caj$movremotosalida".DIGITO_CUENTA,');
            SQL.Add('"caj$movremotosalida".ORIGEN_MOVIMIENTO,');
            SQL.Add('"caj$movremotosalida".ID_TIPO_MOVIMIENTO,');
            SQL.Add('"caj$movremotosalida".DOCUMENTO,');
            SQL.Add('"caj$movremotosalida".BILLETES,');
            SQL.Add('"caj$movremotosalida".MONEDAS,');
            SQL.Add('"caj$movremotosalida".CHEQUES,');
            SQL.Add('"caj$movremotosalida".ASOCIADO,');
            SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
            SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
            SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
            SQL.Add('"gen$empleado".NOMBRE');
            SQL.Add('FROM');
            SQL.Add('"caj$movremotosalida"');
            SQL.Add('LEFT JOIN "gen$agencia" ON ("caj$movremotosalida".ID_AGENCIA_REMOTA = "gen$agencia".ID_AGENCIA)');
            SQL.Add('LEFT JOIN "caj$cajas" ON ("caj$movremotosalida".ID_CAJA = "caj$cajas".ID_CAJA)');
            SQL.Add('LEFT JOIN "gen$empleado" ON ("caj$cajas".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
            SQL.Add('WHERE');
            SQL.Add('(FECHA_MOV BETWEEN :FECHA1 AND :FECHA2) AND');
            SQL.Add('("caj$movremotosalida".ID_CAJA = :ID_CAJA) AND');// AND');
            SQL.Add('("caj$movremotosalida".ES_COMISION <> 1)');
            SQL.Add('ORDER BY');
            SQL.Add('"caj$movremotosalida".ORIGEN_MOVIMIENTO,');
            SQL.Add('"caj$movremotosalida".ID_TIPO_MOVIMIENTO,');
            SQL.Add('"caj$movremotosalida".FECHA_MOV');
            ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
            ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
            ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
            try
             Open;
             IBQuery1.SQL.Clear;
             IBQuery1.SQL.Add('insert into '+Tabla+' values(');
             IBQuery1.SQL.Add(':ID_AGENCIA,:AGENCIA,:ID_CAJA,:FECHA_MOV,:ORIGEN_MOVIMIENTO,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
             IBQuery1.SQL.Add(':NOMBRE,:DOCUMENTO,:ID_TIPO_MOVIMIENTO,');
             IBQuery1.SQL.Add(':EFECTIVO_DB,:CHEQUE_DB,:EFECTIVO_CR,:CHEQUE_CR,:DESCRIPCION_AGENCIA)');
             while not Eof do
             begin
               IBQuery1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA_REMOTA').AsInteger;
               IBQuery1.ParamByName('AGENCIA').AsString := FieldByName('DESCRIPCION_AGENCIA').AsString;
               IBQuery1.ParamByName('ID_CAJA').AsInteger := FieldByName('ID_CAJA').AsInteger;
               IBQuery1.ParamByName('FECHA_MOV').AsDateTime := FieldByName('FECHA_MOV').AsDateTime;
               IBQuery1.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := FieldByName('ORIGEN_MOVIMIENTO').AsInteger;
               IBQuery1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               IBQuery1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBQuery1.ParamByName('NOMBRE').AsString := FieldByName('ASOCIADO').AsString;// + ' ' +FieldByName('SEGUNDO_APELLIDO1').AsString + ' ' + FieldByName('NOMBRE1').AsString;
               IBQuery1.ParamByName('DOCUMENTO').AsString := FieldByName('DOCUMENTO').AsString;
               IBQuery1.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
               if FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1 then
               begin
                  IBQuery1.ParamByName('EFECTIVO_DB').AsCurrency := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                  IBQuery1.ParamByName('CHEQUE_DB').AsCurrency := FieldByName('CHEQUES').AsCurrency;
                  IBQuery1.ParamByName('EFECTIVO_CR').AsCurrency := 0;
                  IBQuery1.ParamByName('CHEQUE_CR').AsCurrency := 0;
               end
               else
               begin
                  IBQuery1.ParamByName('EFECTIVO_CR').AsCurrency := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                  IBQuery1.ParamByName('CHEQUE_CR').AsCurrency := FieldByName('CHEQUES').AsCurrency;
                  IBQuery1.ParamByName('EFECTIVO_DB').AsCurrency := 0;
                  IBQuery1.ParamByName('CHEQUE_DB').AsCurrency := 0;
               end;
               IBQuery1.ParamByName('DESCRIPCION_AGENCIA').AsString := FieldByName('DESCRIPCION_AGENCIA').AsString;
               try
                 IBQuery1.ExecSQL;
               except
                 MessageDlg('Error al actualizar temporal',mtError,[mbcancel],0);
               end;
               Next;
             end
           except
              MessageDlg('Error al tratar de generar el informe',mtError,[mbcancel],0);
           end;
//**
        end;// fin del query
           IBQuery1.Close;
           IBQuery1.SQL.Clear;
           IBQuery1.SQL.Add('select * from '+ Tabla);
           IBQuery1.SQL.Add('order by ID_AGENCIA,ORIGEN_MOVIMIENTO,ID_TIPO_MOVIMIENTO,FECHA_MOV');
           IBQuery2.Close;
           IBQuery2.SQL.Clear;
           IBQuery2.SQL.Add('SELECT ');
           IBQuery2.SQL.Add('ORIGEN_MOVIMIENTO,');
           IBQuery2.SQL.Add('COUNT(ORIGEN_MOVIMIENTO) AS TOTAL,');
           IBQuery2.SQL.Add('SUM(EFECTIVO_DB) AS EFECTIVO_DB,');
           IBQuery2.SQL.Add('SUM(CHEQUE_DB) AS CHEQUE_DB,');
           IBQuery2.SQL.Add('SUM(EFECTIVO_CR) AS EFECTIVO_CR,');
           IBQuery2.SQL.Add('SUM(CHEQUE_CR) AS CHEQUE_CR');
           IBQuery2.SQL.Add('FROM');
           IBQuery2.SQL.Add(Tabla);
           IBQuery2.SQL.Add('GROUP BY');
           IBQuery2.SQL.Add('ORIGEN_MOVIMIENTO');
           IBQuery2.SQL.Add('ORDER BY');
           IBQuery2.SQL.Add('ORIGEN_MOVIMIENTO');
           IBQuery3.Close;
           IBQuery3.SQL.Clear;
           IBQuery3.SQL.Add('SELECT');
           IBQuery3.SQL.Add('"caj$movimientocol".ID_CAJA,');
           IBQuery3.SQL.Add('"caj$movimientocol".ID_AGENCIA,');
           IBQuery3.SQL.Add('"caj$movimientocol".ID_COLOCACION,');
           ibquery3.sql.Add('"caj$movimientocol".FECHA_MOV,');
           IBQuery3.SQL.Add('"caj$movimientocol".DOCUMENTO,');
           IBQuery3.SQL.Add('"caj$movimientocol".CAPITAL,');
           IBQuery3.SQL.Add('"caj$movimientocol".INTERESES,');
           IBQuery3.SQL.Add('"caj$movimientocol".DEVOLUCION,');
           IBQuery3.SQL.Add('"caj$movimientocol".OTROS,');
           IBQuery3.SQL.Add('"caj$movimientocol".BILLETES,');
           IBQuery3.SQL.Add('"caj$movimientocol".MONEDAS,');
           IBQuery3.SQL.Add('"gen$persona".NOMBRE,');
           IBQuery3.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           IBQuery3.SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
           IBQuery3.SQL.Add('FROM');
           IBQuery3.SQL.Add('"caj$movimientocol"');
           IBQuery3.SQL.Add('INNER JOIN "col$colocacion" ON ("caj$movimientocol".ID_AGENCIA = "col$colocacion".ID_AGENCIA) AND ("caj$movimientocol".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
           IBQuery3.SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
           IBQuery3.SQL.Add('where ID_CAJA = :ID_CAJA and FECHA_MOV between :FECHA1 and :FECHA2');
           IBQuery3.SQL.Add('ORDER BY FECHA_MOV');
           IBQuery3.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
           IBQuery3.ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
           IBQuery3.ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
           IBQuery4.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
           IBQuery4.ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
           IBQuery4.ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
             try
               IBQuery1.Open;
               IBQuery2.Open;
               IBQuery3.Open;
               IBQuery4.Open;
               if (IBQuery1.RecordCount > 0) or (IBQuery3.RecordCount > 0) then
                begin
                  Report.Variables.ByName['Empresa'].AsString := Empresa;
                  Report.Variables.ByName['Agencia'].AsString := Ciudad;
                  Report.Variables.ByName['Caja'].AsInteger := EdCaja.Value;
                  Report.Variables.ByName['Empleado'].AsString := Empleado;
                  if Report.PrepareReport then
                  begin
                     frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
                     frmVistaPreliminar.Reporte := Report;
                     frmVistaPreliminar.ShowModal;
//                     Report.PreviewPreparedReport(True);
                  end;
                end
               else
                 MessageDlg('No Hay Datos Para Estos Parametros!',mtinformation,[mbOk],0);
             finally
                IBQuery1.Close;
                IBQuery2.Close;
                IBQuery3.Close;
             end;

end;

procedure TfrmInformeDiarioCaja.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeDiarioCaja.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeDiarioCaja.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        EdFecha.Date := Date;
        Generado := False;
end;

procedure TfrmInformeDiarioCaja.ReportUnknownObjFunction(Sender: TObject;
  Component: TComponent; const FuncName: String;
  const Parameters: TprVarsArray; ParametersCount: Integer;
  var Value: TprVarValue; var IsProcessed: Boolean);
var f:TField;
    Efectivo:Currency;
    Cheque:Currency;
begin
  if (Component=IBQuery1) and
   (AnsiCompareText(FuncName,'IBQuery1.Field')=0) and
   (ParametersCount=1) then
  begin
    // Parameter with index 0 is the fieldname
    f := IBQuery1.FindField('ID_TIPO_MOVIMIENTO');
    Efectivo := IBQuery1.FindField('BILLETES').AsCurrency +
                IBQuery1.FindField('MONEDAS').AsCurrency;
    Cheque := IBQuery1.FindField('CHEQUES').AsCurrency;

    if f<>nil then
      begin
        // field is found return length of field value
        if f.AsInteger = 1 then
        begin
         if _vAsString(Parameters[0]) = 'Efectivo_DB' then
           _vSetAsDouble(Value,Efectivo)
         else
         if _vAsString(Parameters[0]) = 'Cheque_DB' then
           _vSetAsDouble(Value,Cheque)
         else
         if _vAsString(Parameters[0]) = 'Efectivo_CR' then
           _vSetAsDouble(Value,0)
         else
         if _vAsString(Parameters[0]) = 'Cheque_CR' then
           _vSetAsDouble(Value,0);
        end
        else
         if _vAsString(Parameters[0]) = 'Efectivo_CR' then
           _vSetAsDouble(Value,Efectivo)
         else
         if _vAsString(Parameters[0]) = 'Cheque_CR' then
           _vSetAsDouble(Value,Cheque)
         else
         if _vAsString(Parameters[0]) = 'Efectivo_DB' then
           _vSetAsDouble(Value,0)
         else
         if _vAsString(Parameters[0]) = 'Cheque_DB' then
           _vSetAsDouble(Value,0);
        end;
      end
  else
  if (Component=IBQuery2) and
   (AnsiCompareText(FuncName,'IBQuery2.Field')=0) and
   (ParametersCount=1) then
  begin
    // Parameter with index 0 is the fieldname
    f := IBQuery2.FindField('ORIGEN_MOVIMIENTO');
    Efectivo := IBQuery2.FindField('BILLETES').AsCurrency +
                IBQuery2.FindField('MONEDAS').AsCurrency;
    Cheque := IBQuery2.FindField('CHEQUES').AsCurrency;

    if f<>nil then
      begin
         if _vAsString(Parameters[0]) = 'Efectivo_DB' then
           _vSetAsDouble(Value,Efectivo)
         else
         if _vAsString(Parameters[0]) = 'Cheque_DB' then
           _vSetAsDouble(Value,Cheque)
      end;
   end
  else
  if (Component=IBQuery3) and
   (AnsiCompareText(FuncName,'IBQuery3.Field')=0) and
   (ParametersCount=1) then
  begin
    // Parameter with index 0 is the fieldname
    f := IBQuery3.FindField('ORIGEN_MOVIMIENTO');
    Efectivo := IBQuery3.FindField('BILLETES').AsCurrency +
                IBQuery3.FindField('MONEDAS').AsCurrency;
    Cheque := IBQuery3.FindField('CHEQUES').AsCurrency;

    if f<>nil then
      begin
         if _vAsString(Parameters[0]) = 'Efectivo_DB' then
           _vSetAsDouble(Value,Efectivo)
         else
         if _vAsString(Parameters[0]) = 'Cheque_DB' then
           _vSetAsDouble(Value,Cheque)
      end;
   end;
      IsProcessed := true;
end;

procedure TfrmInformeDiarioCaja.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
      if Generado then
        with IBQuery do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          Sql.Clear;
          Sql.Add('drop table ' + Tabla);
          try
            ExecSQL;
          finally
            IBQuery.Close;
            IBQuery.Transaction.Commit;
          end;
        end;

end;

function TfrmInformeDiarioCaja.ValidarCaja: Boolean;
begin
         Result := False;
         if dmGeneral.IBTransaction1.InTransaction then
         begin
            dmGeneral.IBTransaction1.Commit;
         end;
         with IBSQL1 do
         begin
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"caj$cajas".ID_CAJA,');
           SQL.Add('"caj$cajas".HORA_INICIO,');
           SQL.Add('"caj$cajas".HORA_FINAL,');
           SQL.Add('"caj$cajas".CODIGO,');
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
               EdCaja.Value := FieldByName('ID_CAJA').AsInteger;
               Empleado := Trim(FieldByName('PRIMER_APELLIDO').AsString+' '+
                                FieldByName('SEGUNDO_APELLIDO').AsString+' '+
                                FieldByName('NOMBRE').AsString);
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

end.
