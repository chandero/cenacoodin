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
var     Consecutivo:Integer;
    ValorSolidaridad:Currency;
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
          SQL.Add('select SUM(VALOR_APROBADO) as VALOR from "fun$movimiento" where FECHA = :FECHA');
          ParamByName('FECHA').AsDate := EdFecha.Date;
          try
            Open;
            ValorSolidaridad := FieldByName('VALOR').AsCurrency;
          except
            Transaction.Rollback;
            raise;
          end;

        end;

        Consecutivo := ObtenerConsecutivo(IBSQL1);
        EdNota.Caption := Format('%.8d',[Consecutivo]);

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('insert into CON$COMPROBANTE values(');
          SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,');
          SQL.Add(':FECHADIA,:DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,');
          SQL.Add(':ESTADO,:IMPRESO,:ANULACION,:ID_EMPLEADO)');
          ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('TIPO_COMPROBANTE').AsString := '1';
          ParamByName('FECHADIA').AsDate := fFechaActual; //EdFecha.Date;
          ParamByName('DESCRIPCION').AsString := 'AYUDAS DE SOLIDARIDAD ENTREGADAS EN LA FECHA';
          ParamByName('TOTAL_DEBITO').AsCurrency := ValorSolidaridad;
          ParamByName('TOTAL_CREDITO').AsCurrency := ValorSolidaridad;
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

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('insert into CON$AUXILIAR values(');
          SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:FECHA,');
          SQL.Add(':CODIGO,:DEBITO,:CREDITO,:ID_CUENTA,');
          SQL.Add(':ID_COLOCACION,:ID_IDENTIFICACION,');
          SQL.Add(':ID_PERSONA,:MONTO_RETENCION,:TASA_RETENCION,:ESTADOAUX, :TIPO_COMPROBANTE)');

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
          ParamByName('TIPO_COMPROBANTE').AsInteger := 1;

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


// Valores Credito
// LEER MOVIMIENTOS POR MEDICO DEL DIA

          IBQuery2.Close;
          IBQuery2.SQL.Clear;
          IBQuery2.SQL.Add('SELECT ');
          IBQuery2.SQL.Add('  "fun$movimiento".ID_MEDICO,');
          IBQuery2.SQL.Add('  "fun$medicos".ID_IDENTIFICACION,');
          IBQuery2.SQL.Add('  "fun$medicos".ID_PERSONA,');
          IBQuery2.SQL.Add('  SUM("fun$movimiento".VALOR_APROBADO) AS VALOR');
          IBQuery2.SQL.Add('FROM');
          IBQuery2.SQL.Add('  "fun$movimiento"');
          IBQuery2.SQL.Add('INNER JOIN "fun$medicos" ON ("fun$movimiento".ID_MEDICO = "fun$medicos".ID_MEDICO)');
          IBQuery2.SQL.Add('WHERE');
          IBQuery2.SQL.Add('"fun$movimiento".FECHA = :FECHA');
          IBQuery2.SQL.Add('GROUP BY ');
          IBQuery2.SQL.Add('  "fun$movimiento".ID_MEDICO,');
          IBQuery2.SQL.Add('  "fun$medicos".ID_IDENTIFICACION,');
          IBQuery2.SQL.Add('  "fun$medicos".ID_PERSONA');
          IBQuery2.ParamByName('FECHA').AsDate := EdFecha.Date;
          try
           IBQuery2.Open;
          except
           IBQuery2.Transaction.Rollback;
           raise;
          end;

          while not IBQuery2.Eof do begin

            ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := IBQuery2.FieldByName('ID_PERSONA').AsString;
            ParamByName('CODIGO').AsString := '249595030000000000';
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := IBQuery2.FieldByName('VALOR').AsCurrency;
            try
             ExecSQL;
             IBQuery2.Next;
            except
             raise;
            end;
            
          end;

// Fin Creditos
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

{
        with IBAuxiliar do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('CON$AUXILIAR.ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('CON$TIPOCOMPROBANTE.DESCRIPCION AS TIPO,');
             SQL.Add('CON$COMPROBANTE.FECHADIA,');
             SQL.Add('CON$COMPROBANTE.DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('CON$AUXILIAR.CODIGO,');
             SQL.Add('CON$PUC.NOMBRE AS CUENTA,');
             SQL.Add('CON$AUXILIAR.DEBITO,');
             SQL.Add('CON$AUXILIAR.CREDITO');
             SQL.Add('from ');
             SQL.Add('CON$COMPROBANTE ');
             SQL.Add('INNER JOIN CON$AUXILIAR ON (CON$COMPROBANTE.ID_COMPROBANTE = CON$AUXILIAR.ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN CON$PUC ON (CON$AUXILIAR.CODIGO = CON$PUC.CODIGO)');
             SQL.Add('INNER JOIN CON$TIPOCOMPROBANTE ON (CON$COMPROBANTE.TIPO_COMPROBANTE = CON$TIPOCOMPROBANTE.ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON (CON$AUXILIAR.ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON (CON$COMPROBANTE.ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('(CON$COMPROBANTE.ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('(CON$COMPROBANTE.ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
             try
              Open;
              if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
              Close;
             except
               MessageDlg('Error al listar comprobante, verifique por Grabaci?n de Comprobantes',mtError,[mbcancel],0);
               Close;
             end;

        end;

        IBQuery1.Transaction.Commit;

}

end;

procedure TfrmAyudas.FormShow(Sender: TObject);
begin
        EdFecha.Date :=  fFechaActual;
end;

end.
