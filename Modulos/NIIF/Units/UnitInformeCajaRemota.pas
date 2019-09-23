unit UnitInformeCajaRemota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvEdit, JvTypedEdit, ComCtrls, ExtCtrls, DB,
  DBClient, IBCustomDataSet, IBQuery, DateUtils, pr_Common, pr_TxClasses;

type
  TFrmInformeCajaRemota = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Caja: TLabel;
    EdFecha: TDateTimePicker;
    EdCaja: TJvIntegerEdit;
    Panel2: TPanel;
    CmdGenera: TBitBtn;
    CmdCerrar: TBitBtn;
    CDinforme: TClientDataSet;
    CDinformeid_agencia: TSmallintField;
    CDinformeagencia: TStringField;
    CDinformeid_caja: TSmallintField;
    CDinformefecha_mov: TDateTimeField;
    CDinformeorigen_movimiento: TSmallintField;
    CDinformeid_tipo_captacion: TSmallintField;
    CDinformenumero_cuenta: TIntegerField;
    CDinformenombre: TStringField;
    CDinformedocumento: TStringField;
    CDinformeid_tipo_movimiento: TSmallintField;
    CDinformeefectivo_db: TCurrencyField;
    CDinformecheque_db: TCurrencyField;
    CDinformeefectivo_cr: TCurrencyField;
    CDinformecheque_cr: TCurrencyField;
    IBQuery: TIBQuery;
    CDinformeid_agencia_remota: TSmallintField;
    CDorigen: TClientDataSet;
    CDorigenorigen_movimiento: TSmallintField;
    CDorigencheque_db: TCurrencyField;
    CDorigencheque_cr: TCurrencyField;
    CDorigenefectivo_db: TCurrencyField;
    CDorigenefectivo_cr: TCurrencyField;
    CDinformesumefectivo_db: TAggregateField;
    CDinformesumefectivo_cr: TAggregateField;
    CDinformesumcheque_db: TAggregateField;
    CDinformesumcheque_cr: TAggregateField;
    CDinformecontador: TAggregateField;
    CDorigencontador: TIntegerField;
    Report: TprTxReport;
    procedure CmdGeneraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInformeCajaRemota: TFrmInformeCajaRemota;

implementation
uses UnitGlobales, UnitVistaPreliminar;

{$R *.dfm}

procedure TFrmInformeCajaRemota.CmdGeneraClick(Sender: TObject);
var    fecha1,fecha2 :TDateTime;
begin
        CDinforme.CancelUpdates;
        CDorigen.CancelUpdates;
        Fecha1 := EdFecha.Date;
        Fecha1 := EncodeDate(YearOf(Fecha1),MonthOf(Fecha1),DayOf(Fecha1));
        Fecha2 := EdFecha.Date;
        Fecha2 := EncodeDate(YearOf(Fecha2),MonthOf(Fecha2),DayOf(Fecha2));
        with IBQuery do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"caj$movremotoentrada".ID_CAJA,');
          SQL.Add('"caj$movremotoentrada".ID_AGENCIA_REMOTA,');
          SQL.Add('"caj$movremotoentrada".FECHA_MOV,');
          SQL.Add('"caj$movremotoentrada".ID_TIPO_CAPTACION,');
          SQL.Add('"caj$movremotoentrada".NUMERO_CUENTA,');
          SQL.Add('"caj$movremotoentrada".DIGITO_CUENTA,');
          SQL.Add('"caj$movremotoentrada".ORIGEN_MOVIMIENTO,');
          SQL.Add('"caj$movremotoentrada".ID_TIPO_MOVIMIENTO,');
          SQL.Add('"caj$movremotoentrada".DOCUMENTO,');
          SQL.Add('"caj$movremotoentrada".BILLETES,');
          SQL.Add('"caj$movremotoentrada".MONEDAS,');
          SQL.Add('"caj$movremotoentrada".CHEQUES,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
          SQL.Add('"gen$persona".NOMBRE AS NOMBRE1');
          SQL.Add('FROM');
          SQL.Add('"caj$movremotoentrada"');
          SQL.Add('LEFT JOIN "gen$agencia" ON ("caj$movremotoentrada".ID_AGENCIA_REMOTA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('LEFT JOIN "cap$maestro" ON (("caj$movremotoentrada".ID_AGENCIA = "cap$maestro".ID_AGENCIA) AND ("caj$movremotoentrada".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION) AND');
          SQL.Add('("caj$movremotoentrada".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA) AND ("caj$movremotoentrada".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA))');
          SQL.Add('LEFT JOIN "cap$maestrotitular" ON (("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND');
          SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA))');
          SQL.Add('LEFT JOIN "gen$persona" ON (("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA))');
          SQL.Add('WHERE');
          SQL.Add('(FECHA_MOV BETWEEN :FECHA1 AND :FECHA2) AND');
          SQL.Add('("caj$movremotoentrada".ID_CAJA = :ID_CAJA) AND');
          SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1)');
          SQL.Add('ORDER BY');
          SQL.Add('"caj$movremotoentrada".ORIGEN_MOVIMIENTO,');
          SQL.Add('"caj$movremotoentrada".ID_TIPO_MOVIMIENTO,');
          SQL.Add('"caj$movremotoentrada".FECHA_MOV,');
          SQL.Add('"caj$movremotoentrada".ID_AGENCIA_REMOTA');
          ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
//          ShowMessage(DateTimeToStr(fecha1 + StrToTime('23:59:59')));
          ParamByName('FECHA1').AsDateTime := fecha1 + StrToTime('00:00:00');
          ParamByName('FECHA2').AsDateTime := fecha2 + StrToTime('23:59:59');
          try
            Open;
            while not Eof do
            begin
               CDinforme.Append;
               CDinforme.FieldValues['id_agencia_remota'] := FieldByName('ID_AGENCIA_REMOTA').AsInteger;
               CDinforme.FieldValues['id_agencia'] := Agencia;
               CDinforme.FieldValues['agencia'] := FieldByName('DESCRIPCION_AGENCIA').AsString;
               CDinforme.FieldValues['id_caja'] := FieldByName('ID_CAJA').AsInteger;
               CDinforme.FieldValues['fecha_mov'] := FieldByName('FECHA_MOV').AsDateTime;
               CDinforme.FieldValues['origen_movimiento'] := FieldByName('ORIGEN_MOVIMIENTO').AsInteger;
               CDinforme.FieldValues['id_tipo_captacion'] := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               CDinforme.FieldValues['numero_cuenta'] := FieldByName('NUMERO_CUENTA').AsInteger;
               CDinforme.FieldValues['nombre'] := FieldByName('PRIMER_APELLIDO1').AsString + ' ' +FieldByName('SEGUNDO_APELLIDO1').AsString + ' ' + FieldByName('NOMBRE1').AsString;
               CDinforme.FieldValues['documento'] := FieldByName('DOCUMENTO').AsString;
               CDinforme.FieldValues['id_tipo_movimiento'] := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
               if FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1 then
               begin
                  CDinforme.FieldValues['efectivo_db'] := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                  CDinforme.FieldValues['cheque_db'] := FieldByName('CHEQUES').AsCurrency;
                  CDinforme.FieldValues['efectivo_cr'] := 0;
                  CDinforme.FieldValues['cheque_cr'] := 0;
               end
               else
               begin
                  CDinforme.FieldValues['efectivo_cr'] := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                  CDinforme.FieldValues['cheque_cr'] := FieldByName('CHEQUES').AsCurrency;
                  CDinforme.FieldValues['efectivo_db'] := 0;
                  CDinforme.FieldValues['cheque_db'] := 0;
               end;
               //CDinforme.FieldValues[''] := FieldByName('DESCRIPCION_AGENCIA').AsString;
               try
                 CDinforme.Post;
               except
                 MessageDlg('Error al actualizar temporal',mtError,[mbcancel],0);
               end;
               Next;
             end
           except
              MessageDlg('Error al tratar de generar el informe',mtError,[mbcancel],0);
           end;
           SQL.Clear;
           SQL.Add('SELECT "caj$origen".ID_ORIGEN FROM "caj$origen"');
           Open;
           while not Eof do
           begin
              CDinforme.Filtered := False;
              CDinforme.Filter := 'origen_movimiento = ' + FieldByName('ID_ORIGEN').AsString;
              CDinforme.Filtered := True;
              CDinforme.AggregatesActive := True;
              if CDinforme.RecordCount <> 0 then
              begin
                CDorigen.Append;
                CDorigen.FieldValues['origen_movimiento'] := FieldByName('ID_ORIGEN').AsInteger;
               // ShowMessage(CDinforme.FieldByName('contador').AsString);
                CDorigen.FieldValues['cheque_db'] := CDinformesumcheque_db.Value;
                CDorigen.FieldValues['cheque_cr'] := CDinformesumcheque_cr.Value;
                CDorigen.FieldValues['efectivo_db'] := cdinformesumefectivo_db.Value;
                CDorigen.FieldValues['efectivo_cr'] := cdinformesumefectivo_cr.Value;
                CDorigen.FieldValues['contador'] :=    CDinformecontador.Value;
                CDorigen.Post;
              end;
              Next;
           end;
        end;
        CDinforme.AggregatesActive := False;
        CDinforme.Filtered := False;
        CDinforme.IndexFieldNames := 'id_agencia_remota;fecha_mov;id_tipo_captacion';
        Empleado;
        if CDinforme.RecordCount <> 0 then
        begin
          Report.Variables.ByName['Empresa'].AsString := Empresa;
          Report.Variables.ByName['Agencia'].AsString := Ciudad;
          Report.Variables.ByName['Caja'].AsInteger := EdCaja.Value;
          Report.Variables.ByName['Empleado'].AsString := Nombres + ' ' + Apellidos;
          if Report.PrepareReport then
          begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := Report;
             frmVistaPreliminar.ShowModal;
          end;
        end;
end;

procedure TFrmInformeCajaRemota.FormCreate(Sender: TObject);
begin
        with IBQuery do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT "gen$minimos".VALOR_MINIMO FROM "gen$minimos" WHERE ("gen$minimos".ID_MINIMO = 18)');
          Open;
          EdCaja.Value := FieldByName('VALOR_MINIMO').AsInteger;
          Close;
        end;
        EdFecha.Date := fFechaActual;
end;

procedure TFrmInformeCajaRemota.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

end.
