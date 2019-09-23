unit UnitAyudasSolidaridad;

interface

uses
  Windows, DateUtils, Math, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBSQL, IBDatabase, pr_Common, pr_TxClasses;

type
  TfrmAyudas = class(TForm)
    Label1: TLabel;
    EdFecha: TDateTimePicker;
    Panel1: TPanel;
    CmdAplicar: TBitBtn;
    CmdVer: TBitBtn;
    CmdCerrar: TBitBtn;
    Label2: TLabel;
    EdNota: TStaticText;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    IBAuxiliar: TIBQuery;
    ReporteC: TprTxReport;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAyudas: TfrmAyudas;

implementation

{$R *.dfm}

uses unitPantallaProgreso, unitGlobales, unitDmGeneral;

procedure TfrmAyudas.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAyudas.CmdAplicarClick(Sender: TObject);
var Total:Integer;
    frmProgreso:TfrmProgreso;
    Consecutivo:Integer;
    ValorAhorro:Currency;
    ValorAhorroJ:Currency;
    ValorOtrasBono:Currency;
    ValorOtrasFunerario:Currency;
    ValorSolidaridad:Currency;
    ValorEducacion:Currency;
    ValorGMF:Currency;
begin

        if MessageDlg('Seguro de Aplicar Ayudas',mtConfirmation,[mbyes,mbno],0) = mrno then
        begin
           Exit;
        end;

        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from "fun$diascerrados" where FECHA = :FECHA');
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
            Open;
            if RecordCount > 0 then begin
              if FieldByName('APLICADO').AsInteger <> 0 then begin
                ShowMessage('Dia ya fue aplicado');
                Transaction.Rollback;
                Exit;
              end
              else
              if FieldByName('CERRADO').AsInteger = 0 then begin
                ShowMessage('Dia no ha sido cerrado');
                Transaction.Rollback;
                Exit;
              end
            end
            else
            begin
                ShowMessage('Dia no ha sido cerrado');
                Transaction.Rollback;
                Exit;
            end; // if


          except
            Transaction.Rollback;
            raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select count(*) as TOTAL from "fun$movimiento" where FECHA = :FECHA');
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
           Open;
           Total := FieldByName('TOTAL').AsInteger;
          except
           Transaction.Rollback;
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select SUM(VALOR_APROBADO) as VALOR from "fun$movimiento" where FECHA = :FECHA and ID_AYUDA > 5');
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
            Open;
            ValorEducacion := FieldByName('VALOR').AsCurrency;
          except
            Transaction.Rollback;
            raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select SUM(VALOR_APROBADO) as VALOR from "fun$movimiento" where FECHA = :FECHA and ID_AYUDA = 1');
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
            Open;
            ValorOtrasBono := FieldByName('VALOR').AsCurrency;
          except
            Transaction.Rollback;
            raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select SUM(VALOR_APROBADO) as VALOR from "fun$movimiento" where FECHA = :FECHA and ID_AYUDA = 5');
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
            Open;
            ValorOtrasFunerario := FieldByName('VALOR').AsCurrency;
          except
            Transaction.Rollback;
            raise;
          end;



          Close;
          SQL.Clear;
          SQL.Add('select SUM(VALOR_APROBADO) as VALOR from "fun$movimiento" where FECHA = :FECHA and ID_TIPO_CAPTACION = 1 and ID_AYUDA <> 1 and ID_AYUDA <> 5');
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
            Open;
            ValorAhorro := FieldByName('VALOR').AsCurrency;
          except
            Transaction.Rollback;
            raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select SUM(VALOR_APROBADO) as VALOR from "fun$movimiento" where FECHA = :FECHA and ID_TIPO_CAPTACION = 4 and ID_AYUDA <> 1 and ID_AYUDA <> 3 and ID_AYUDA <> 5');
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
            Open;
            ValorAhorroJ := FieldByName('VALOR').AsCurrency;
          except
            Transaction.Rollback;
            raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select * from "fun$movimiento" where FECHA = :FECHA');
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
           Open;
          except
           Transaction.Rollback;
           raise;
          end;

          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Min := 0;
          frmProgreso.Max := Total;
          frmProgreso.InfoLabel := 'Procesando Ayudas';

          Consecutivo := ObtenerConsecutivo(IBSQL1);

          EdNota.Caption := Format('%.8d',[Consecutivo]);

          frmProgreso.Ejecutar;

          while not Eof do begin
             frmProgreso.Position := RecNo;
             Application.ProcessMessages;
             if ((FieldByName('ID_AYUDA').AsInteger = 1) or
//                 (FieldByName('ID_AYUDA').AsInteger = 3) or
                 (FieldByName('ID_AYUDA').AsInteger = 5)) then begin
                  Next;
                  Continue;
             end;
             IBQuery2.Close;
             IBQuery2.SQL.Clear;
             IBQuery2.SQL.Add('insert into "cap$extracto" values(');
             IBQuery2.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
             IBQuery2.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
             IBQuery2.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
             IBQuery2.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
             IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
             if FieldByName('ID_TIPO_CAPTACION').AsInteger = 1 then begin
                IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
                IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digitocontrol(2,Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])));
             end
             else
             begin
                IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
             end;
             IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
             IBQuery2.ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual; //EdFecha.Date;
             IBQuery2.ParamByName('HORA_MOVIMIENTO').AsTime := Time;
             IBQuery2.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
             IBQuery2.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := EdNota.Caption;
             IBQuery2.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Ayuda de Solidaridad y/o Educación';
             IBQuery2.ParamByName('VALOR_DEBITO').AsCurrency := FieldByName('VALOR_APROBADO').AsCurrency;
             IBQuery2.ParamByName('VALOR_CREDITO').AsCurrency := 0;
             try
               IBQuery2.ExecSQL;
             except
               Transaction.Rollback;
               frmProgreso.Cerrar;
               raise;
             end;
             Next;
          end;
        end;

        frmProgreso.Cerrar;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "con$comprobante" values(');
          SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,');
          SQL.Add(':FECHADIA,:DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,');
          SQL.Add(':ESTADO,:IMPRESO,:ANULACION,:ID_EMPLEADO)');
          ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('TIPO_COMPROBANTE').AsString := '1';
          ParamByName('FECHADIA').AsDate := fFechaActual; //EdFecha.Date;
          ParamByName('DESCRIPCION').AsString := 'AYUDAS DE SOLIDARIDAD Y EDUCACION ENTREGADAS EN LA FECHA';
          ParamByName('TOTAL_DEBITO').AsCurrency := ValorAhorro+ValorAhorroJ+ValorOtrasBono+ValorOtrasFunerario;
          ParamByName('TOTAL_CREDITO').AsCurrency := ValorAhorro+ValorAhorroJ+ValorOtrasBono+ValorOtrasFunerario;
          ParamByName('ESTADO').AsString := 'O';
          ParamByName('IMPRESO').AsInteger := 1;
          ParamByName('ANULACION').AsString := '';
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
            ExecSQL;
          except
            Transaction.Rollback;

            raise;
          end;
        end;

        ValorSolidaridad := ValorAhorro+ValorAhorroJ+ValorOtrasBono+ValorOtrasFunerario - ValorEducacion;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "con$auxiliar" values(');
          SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:FECHA,');
          SQL.Add(':CODIGO,:DEBITO,:CREDITO,:ID_CUENTA,');
          SQL.Add(':ID_COLOCACION,:ID_IDENTIFICACION,');
          SQL.Add(':ID_PERSONA,:MONTO_RETENCION,:TASA_RETENCION,:ESTADOAUX)');

          ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHA').AsDate := fFechaActual; //EdFecha.Date;
          ParamByName('ID_CUENTA').Clear;
          ParamByName('ID_COLOCACION').Clear;
          ParamByName('ID_IDENTIFICACION').AsInteger := 0;
          ParamByName('ID_PERSONA').Clear;
          ParamByName('MONTO_RETENCION').AsCurrency := 0;
          ParamByName('TASA_RETENCION').AsFloat := 0;
          ParamByName('ESTADOAUX').AsString := 'O';
//  Cuentas Debito
          if ValorSolidaridad > 0 then begin

            if Agencia <> 1 then
              ParamByName('CODIGO').AsString := '270595010000000000'
            else
              ParamByName('CODIGO').AsString := '261005000000000000';
            ParamByName('DEBITO').AsCurrency := ValorSolidaridad;
            ParamByName('CREDITO').AsCurrency := 0;
            try
             ExecSQL;
            except
             raise;
            end;
          end;

          if ValorEducacion > 0 then begin
            if Agencia <> 1 then
              ParamByName('CODIGO').AsString := '270595010000000000'
            else
              ParamByName('CODIGO').AsString := '260505000000000000';
            ParamByName('DEBITO').AsCurrency := ValorEducacion;
            ParamByName('CREDITO').AsCurrency := 0;
            try
             ExecSQL;
            except
             raise;
            end;
          end;

//          ValorGMF := ValorSolidaridad + ValorEducacion;

//          ValorGMF := SimpleRoundTo((ValorGMF / 1000) * 4,0);

          ValorGMF := 0;

// Valores Credito
          if ValorAhorro > 0 then begin
            ParamByName('CODIGO').AsString := '210505010000000000';
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := ValorAhorro;
            try
             ExecSQL;
            except
             raise;
            end;
          end;

          if ValorAhorroJ > 0 then begin
            ParamByName('CODIGO').AsString := '210505030000000000';
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := ValorAhorroJ;
            try
             ExecSQL;
            except
             raise;
            end;
          end;

          if ValorOtrasBono > 0 then begin
            ParamByName('CODIGO').AsString := '249595030000000000';
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := ValorOtrasBono;
            try
             ExecSQL;
            except
             raise;
            end;
          end;

          if ValorOtrasFunerario > 0 then begin
            ParamByName('CODIGO').AsString := '249595030000000000';
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := ValorOtrasFunerario;
            try
             ExecSQL;
            except
             raise;
            end;
          end;

// Fin Creditos
// Incluyo GMF
          if ValorGMF > 0 then begin
            ParamByName('CODIGO').AsString := '531520000000000000';
            ParamByName('DEBITO').AsCurrency := ValorGMF;
            ParamByName('CREDITO').AsCurrency := 0;
            try
             ExecSQL;
            except
             raise;
            end;

            ParamByName('CODIGO').AsString := '244295000000000000';
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := ValorGMF;
            try
             ExecSQL;
            except
             raise;
            end;

          end;
// Fin GMF

        end; // with

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('update "fun$movimiento" set APLICADO = 1 where FECHA = :FECHA');
           ParamByName('FECHA').AsDate := EdFecha.Date;
           try
            ExecSQL;
           except
            Transaction.Rollback;
            raise;
           end;

           Close;
           SQL.Clear;
           SQL.Add('update "fun$diascerrados" set APLICADO = 1 where FECHA = :FECHA');
           ParamByName('FECHA').AsDate := EdFecha.Date;
           try
            ExecSQL;
           except
            Transaction.Rollback;
            raise;
           end;

        end;

        IBQuery1.Transaction.Commit;
        IBQuery1.Transaction.StartTransaction;

        with IBAuxiliar do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
             SQL.Add('"con$comprobante".FECHADIA,');
             SQL.Add('"con$comprobante".DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('"con$auxiliar".CODIGO,');
             SQL.Add('"con$puc".NOMBRE AS CUENTA,');
             SQL.Add('"con$auxiliar".DEBITO,');
             SQL.Add('"con$auxiliar".CREDITO');
             SQL.Add('from ');
             SQL.Add('"con$comprobante" ');
             SQL.Add('INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
             SQL.Add('INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('("con$comprobante".ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
             try
              Open;
              if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
              Close;
             except
               MessageDlg('Error al listar comprobante, verifique por Grabación de Comprobantes',mtError,[mbcancel],0);
               Close;
             end;

        end;

        IBQuery1.Transaction.Commit;



end;

procedure TfrmAyudas.FormShow(Sender: TObject);
begin
        EdFecha.Date :=  IncDay(Date,-1);
end;

end.
