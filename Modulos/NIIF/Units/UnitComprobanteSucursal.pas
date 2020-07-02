unit UnitComprobanteSucursal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, IBSQL, DateUtils, DB,
  DBClient, IBCustomDataSet, IBQuery, Math, IBDatabase, pr_Common,
  pr_TxClasses;

type
  TFrmComprobanteSucursal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdFecha: TDateTimePicker;
    EdUsuario: TStaticText;
    EdStatus: TStaticText;
    Panel2: TPanel;
    CmdGenera: TBitBtn;
    CmdCerrar: TBitBtn;
    cmdReporte: TBitBtn;
    Label3: TLabel;
    Edcomprobante: TEdit;
    IBSQL1: TIBSQL;
    IBSQLDesc: TIBSQL;
    IBSQLAux: TIBSQL;
    CDconsecutivo: TClientDataSet;
    CDconsecutivoconsecutivo: TIntegerField;
    CDconsecutivoid_consecutivo: TIntegerField;
    IBQuery2: TIBQuery;
    IBAuxiliar: TIBQuery;
    IBQuery: TIBQuery;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    IBTransaction1: TIBTransaction;
    IBSQL4: TIBSQL;
    Report: TprTxReport;
    IBSQL5: TIBSQL;
    CDcomision: TClientDataSet;
    CDcomisioncomision: TCurrencyField;
    CDcomisionagencia: TIntegerField;
    CDcomisionvalor: TAggregateField;
    IBQuery1: TIBQuery;
    CDcomisionid_identificacion: TIntegerField;
    CDcomisionid_persona: TStringField;
    IBSQLTemp: TIBSQL;
    IBTTemp: TIBTransaction;
    procedure EdFechaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdGeneraClick(Sender: TObject);
    procedure EdFechaEnter(Sender: TObject);
    procedure cmdReporteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    tabla :string;
    id_caja: integer;
    procesado: boolean;
    function codigo_remoto(id_agencia, id_origen: integer): string;
    { Private declarations }
  public
  FechaCierre :TDate;
    { Public declarations }
  end;

var
  FrmComprobanteSucursal: TFrmComprobanteSucursal;

implementation
uses UnitVistaPreliminar,UnitGlobales,UnitdmGeneral;
{$R *.dfm}

procedure TFrmComprobanteSucursal.EdFechaChange(Sender: TObject);
var   Es_Movimiento, Es_Contabilizado : Boolean;
      vFecha :TDate;
begin
        vFecha := EdFecha.Date;
        vFecha := EncodeDate(YearOf(vFecha),MonthOf(vFecha),DayOf(vFecha));
        Es_Movimiento := False;
        Es_Contabilizado := False;
        with IBSQL1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('Select * from "caj$cierresucursal" Where ID_CAJA = :ID_CAJA and FECHA = :FECHA');
           ParamByName('ID_CAJA').AsInteger := id_caja;
           ParamByName('FECHA').AsDate := EdFecha.Date;
         try
           ExecQuery;
         except
           MessageDlg('Error al verificar Cierre',mtError,[mbcancel],0);
           Exit;
         end;
         if FieldByName('ES_MOVIMIENTO').AsInteger = 0 then
         begin
             with IBQuery1 do
             begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT');
               SQL.Add('"caj$movremotoentrada".NUMERO_CUENTA');
               SQL.Add('FROM');
               SQL.Add('"caj$movremotoentrada"');
               SQL.Add('WHERE');
               SQL.Add('("caj$movremotoentrada".FECHA_MOV BETWEEN :FECHA1 AND :FECHA2)');
               ParamByName('FECHA1').AsDateTime := vFecha + StrToTime('00:00:00');
               ParamByName('FECHA2').AsDateTime := vFecha + StrToTime('23:59:59');
               Open;
               Last;
               if RecordCount = 0 then
               begin
                 EdStatus.Caption := 'No Hay Movimientos';
                 CmdGenera.Enabled := False;
               end
             else
             begin
                EdStatus.Caption := 'Por Contabilizar';
                CmdGenera.Enabled := True;
                Close;
                SQL.Clear;
                SQL.Add('select * from "caj$cierresucursal" where FECHA = :FECHA');
                ParamByName('FECHA').AsDate := vFecha;
                Open;
                if RecordCount = 0 then
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('insert into "caj$cierresucursal" values (:ID_CAJA,:FECHA,:CONTABILIZADO,:ES_MOVIMIENTO)');
                  ParamByName('ID_CAJA').AsInteger := 25;
                  ParamByName('FECHA').AsDate := vFecha;
                  ParamByName('CONTABILIZADO').AsInteger := 0;
                  ParamByName('ES_MOVIMIENTO').AsInteger := 1;
                  ExecSQL;
                end
                else
                begin
                 Close;
                 SQL.Clear;
                 SQL.Add('update "caj$cierresucursal" set ES_MOVIMIENTO = 1 where FECHA = :FECHA');
                 ParamByName('FECHA').AsDate := vFecha;
                 ExecSQL;
                end;
             end;
             Transaction.Commit;
             Transaction.StartTransaction;

            end;
         end
         else if FieldByName('CONTABILIZADO').AsInteger = 0 then
         begin
           EdStatus.Caption := 'Por Contabilizar';
           CmdGenera.Enabled := True;
         end
         else
         begin
           EdStatus.Caption := 'Ya Contabilizado';
           CmdGenera.Enabled := False;
         end;
        end;

end;

procedure TFrmComprobanteSucursal.FormShow(Sender: TObject);
begin
        //EdFecha.Date := fFechaActual;
        procesado := False;
        with IBSQL1 do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 18');
          ExecQuery;
          id_caja := FieldByName('VALOR_MINIMO').AsInteger;
          Close;
        end;
        Self.Caption := 'Comprobantes Sucursales, Caja No. ' + IntToStr(id_caja);
end;

procedure TFrmComprobanteSucursal.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmComprobanteSucursal.CmdCerrarClick(Sender: TObject);
var    i:Integer;
begin
        Close;
end;

procedure TFrmComprobanteSucursal.CmdGeneraClick(Sender: TObject);
var Fecha1,Fecha2:TDateTime;
    frmVistaPrelimar :TfrmVistaPreliminar;
    Entradas,Salidas,Descuento,Caja:Currency;
    Codigo,CodigoCaja:string;
    ValorTasa,ValorVeces,ValorValor:Currency;
    TotalDebito,TotalCredito:Currency;
    NoHay:Boolean;
    Consecutivo :Integer;
    vAhorros :Currency;
    vAportes :Currency;
    vComision :Currency;
begin
        if MessageDlg('Seguro de Generar el Comprobante',mtConfirmation,[mbYes,MbNo],0) <> mryes then
           Exit;
        CmdGenera.Enabled := False;
        Application.ProcessMessages;
        Empleado;
        Fecha1 := EdFecha.Date;
        Fecha1 := EncodeDate(YearOf(Fecha1),MonthOf(Fecha1),DayOf(Fecha1));
        Fecha2 := EdFecha.Date;
        Fecha2 := EncodeDate(YearOf(Fecha2),MonthOf(Fecha2),DayOf(Fecha2));
        Tabla := '"compcaj'+ IntToStr(id_caja) +'_'+FloatToStr(Time())+'"';
        procesado := True;
        with IBQuery do
        begin
            Close;
            SQL.Clear;
            SQL.Add('create table ' + Tabla + '(');
            SQL.Add('ID_AGENCIA SMALLINT,');
            SQL.Add('AGENCIA VARCHAR(50),');
            SQL.Add('ID_CAJA SMALLINT,');
            SQL.Add('FECHA_MOV TIMESTAMP,');
            SQL.Add('ORIGEN_MOVIMIENTO SMALLINT,');
            SQL.Add('ID_TIPO_CAPTACION SMALLINT,');
            SQL.Add('ID_TIPO_MOVIMIENTO SMALLINT,');
            SQL.Add('EFECTIVO_DB NUMERICO,');
            SQL.Add('CHEQUE_DB NUMERICO,');
            SQL.Add('EFECTIVO_CR NUMERICO,');
            SQL.Add('CHEQUE_CR NUMERICO)');
            try
               ExecSQL;
            finally
               IBQuery.Transaction.CommitRetaining;
               IBQuery.Close;
            end;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
            SQL.Add('"caj$movremotoentrada".ID_CAJA,');
            SQL.Add('"caj$movremotoentrada".FECHA_MOV,');
            SQL.Add('"caj$movremotoentrada".ID_TIPO_CAPTACION,');
            SQL.Add('"caj$movremotoentrada".ORIGEN_MOVIMIENTO,');
            SQL.Add('"caj$movremotoentrada".ID_TIPO_MOVIMIENTO,');
            SQL.Add('"caj$movremotoentrada".BILLETES,');
            SQL.Add('"caj$movremotoentrada".MONEDAS,');
            SQL.Add('"caj$movremotoentrada".CHEQUES,');
            SQL.Add('"caj$movremotoentrada".ID_AGENCIA_REMOTA,');
            SQL.Add('"caj$movremotoentrada".ES_COMISION');
            SQL.Add('FROM');
            SQL.Add('"caj$movremotoentrada"');
            SQL.Add('INNER JOIN "gen$agencia" ON ("caj$movremotoentrada".ID_AGENCIA_REMOTA = "gen$agencia".ID_AGENCIA)');
            SQL.Add('WHERE');
            SQL.Add('("caj$movremotoentrada".ID_CAJA = :ID_CAJA) AND');
            SQL.Add('("caj$movremotoentrada".FECHA_MOV BETWEEN :FECHA1 AND :FECHA2)');
            ParamByName('ID_CAJA').AsInteger := id_caja;
            ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
            ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
            try
             Open;
               while not Eof do
               begin
                 if Abs(FieldByName('ES_COMISION').AsInteger) = 1 then
                 begin
                   CDcomision.Append;
                   CDcomision.FieldValues['agencia'] := FieldByName('ID_AGENCIA_REMOTA').AsInteger;
                   CDcomision.FieldValues['comision'] := FieldByName('BILLETES').AsCurrency + FieldByName('MONEDAS').AsCurrency;
                   CDcomision.Post;
                end;
                  IBQuery1.SQL.Clear;
                  IBQuery1.SQL.Add('insert into '+Tabla+' values(');
                  IBQuery1.SQL.Add(':ID_AGENCIA,:AGENCIA,:ID_CAJA,:FECHA_MOV,:ORIGEN_MOVIMIENTO,:ID_TIPO_CAPTACION,');
                  IBQuery1.SQL.Add(':ID_TIPO_MOVIMIENTO,');
                  IBQuery1.SQL.Add(':EFECTIVO_DB,:CHEQUE_DB,:EFECTIVO_CR,:CHEQUE_CR)');
                  IBQuery1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA_REMOTA').AsInteger;
                  IBQuery1.ParamByName('AGENCIA').AsString := FieldByName('DESCRIPCION_AGENCIA').AsString;
                  IBQuery1.ParamByName('ID_CAJA').AsInteger := FieldByName('ID_CAJA').AsInteger;
                  IBQuery1.ParamByName('FECHA_MOV').AsDateTime := FieldByName('FECHA_MOV').AsDateTime;
                  IBQuery1.ParamByName('ORIGEN_MOVIMIENTO').AsInteger := FieldByName('ORIGEN_MOVIMIENTO').AsInteger;
                  IBQuery1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
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
               try
                 IBQuery1.ExecSQL;
               except
                 MessageDlg('Error al actualizar temporal',mtError,[mbcancel],0);
               end;
               Next;
             end;
           except
              MessageDlg('Error al tratar de generar el informe',mtError,[mbcancel],0);
           end;
        end;
           IBQuery1.Transaction.CommitRetaining;
        with IBSQL4 do
        begin
          IBQuery1.Close;
          Close;
          SQL.Clear;
          SQL.Add('select ID_AGENCIA,DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA <> :ID_AGENCIA order by ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          while not Eof do
          begin
            IBQuery2.Close;
            IBQuery2.SQL.Clear;
            IBQuery2.SQL.Add('SELECT');
            IBQuery2.SQL.Add('ID_ORIGEN,CODIGO,');
            IBQuery2.SQL.Add('SUM(EFECTIVO_DB+CHEQUE_DB) AS ENTRADA,');
            IBQuery2.SQL.Add('SUM(EFECTIVO_CR+CHEQUE_CR) AS SALIDA');
            IBQuery2.SQL.Add('FROM');
            IBQuery2.SQL.Add(Tabla);
            IBQuery2.SQL.Add('INNER JOIN "caj$origen" ON (ORIGEN_MOVIMIENTO = "caj$origen".ID_ORIGEN)');
            IBQuery2.SQL.Add('where ' + '' + tabla + '' + '.'+ 'ID_AGENCIA = :ID_AGENCIA');
            IBQuery2.SQL.Add('GROUP BY');
            IBQuery2.SQL.Add('ID_ORIGEN,CODIGO');
            IBQuery2.SQL.Add('ORDER BY');
            IBQuery2.SQL.Add('ID_ORIGEN');
            IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
            IBQuery2.Open;
            IBQuery2.Last;
            IBQuery2.First;
            Entradas := 0;
            Salidas :=  0;
            vAhorros := 0;
            vAportes := 0;
            vComision := 0;
            if IBQuery2.RecordCount <> 0 then// validacion para la generacion del comprobante
            begin
              Consecutivo := ObtenerConsecutivo(IBSQL2);
              Edcomprobante.Text := Edcomprobante.Text + '- ' + IntToStr(Consecutivo);
              CDconsecutivo.Append;
              CDconsecutivo.FieldValues['consecutivo'] := Consecutivo;
              CDconsecutivo.FieldValues['id_consecutivo'] := CDconsecutivo.RecNo + 1;
              CDconsecutivo.Post;
              //**calculo de la comision
              CDcomision.Filtered := False;
              CDcomision.Filter := 'agencia = ' + IBSQL4.FieldByName('ID_AGENCIA').AsString;
              CDcomision.Filtered := True;
              CDcomision.AggregatesActive := True;
              if CDcomision.RecordCount <> 0 then// valor de la comision
                 vComision := CDcomisionvalor.Value
              else
                 vComision := 0;
              //**
              with IBSQL3 do
              begin
                Close;
                SQL.Clear;
                SQL.Add('INSERT INTO "con$comprobante" VALUES(');
                SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,:FECHADIA,');
                SQL.Add(':DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,:ESTADO,:IMPRESO,');
                SQL.Add(':ANULACION,:ID_EMPLEADO)');
                ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
                ParamByName('FECHADIA').AsDate := EdFecha.Date;
                ParamByName('DESCRIPCION').AsString := 'Contabilización de Movimientos de la Agencia  ' + IBSQL4.FieldByName('DESCRIPCION_AGENCIA').AsString + ', CAJA '+
                                                           IntToStr(id_caja) + ' '+ EdUsuario.Caption +
                                                           ' en la Fecha';
                ParamByName('TOTAL_DEBITO').AsCurrency := 0;
                ParamByName('TOTAL_CREDITO').AsCurrency := 0;
                ParamByName('ESTADO').AsString := 'O';
                ParamByName('IMPRESO').AsInteger := 0;
                ParamByName('ANULACION').Clear;
                ParamByName('ID_EMPLEADO').AsString := DBAlias;
                ExecQuery;
             end;// FIN IBSQL3
           while not IBQuery2.Eof do
           begin
             Entradas := IBQuery2.FieldByName('ENTRADA').AsCurrency;
             Salidas :=  IBQuery2.FieldByName('SALIDA').AsCurrency;
             Codigo := IBQuery2.FieldByName('CODIGO').AsString;
             if IBQuery2.FieldByName('ID_ORIGEN').AsInteger in [2,4] then
                vAhorros := vAhorros + (Entradas - Salidas)
             else if IBQuery2.FieldByName('ID_ORIGEN').AsInteger = 1 then
                vAportes := vAportes + (Entradas - Salidas);
// Registrar Entradas
            if Entradas > 0 then
            begin
              IBSQLAux.Close;
              IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
              IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
              IBSQLAux.ParamByName('CODIGO').AsString := Codigo;
              IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
              IBSQLAux.ParamByName('CREDITO').AsCurrency := Entradas;
              IBSQLAux.ParamByName('ID_CUENTA').Clear;
              IBSQLAux.ParamByName('ID_COLOCACION').Clear;
              IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              IBSQLAux.ParamByName('ID_PERSONA').Clear;
              IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
              IBSQLAux.ParamByName('TASA_RETENCION').Clear;
              IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
           try
              IBSQLAux.ExecQuery;
              NoHay := False;
           except
               MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
               Exit;
           end;
           end;
//Registrar Salidas
           if Salidas > 0 then
           begin
             IBSQLAux.Close;
             IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
             IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
             IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
             IBSQLAux.ParamByName('CODIGO').AsString := Codigo;
             IBSQLAux.ParamByName('DEBITO').AsCurrency := Salidas;
             IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
             IBSQLAux.ParamByName('ID_CUENTA').Clear;
             IBSQLAux.ParamByName('ID_COLOCACION').Clear;
             IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             IBSQLAux.ParamByName('ID_PERSONA').Clear;
             IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
             IBSQLAux.ParamByName('TASA_RETENCION').Clear;
             IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
             try
               IBSQLAux.ExecQuery;
               NoHay := False;
             except
               MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
               Exit;
             end;
             end;
// Registrar Otros Descuentos
            IBSQLDesc.Close;
            IBSQLDesc.ParamByName('CODIGO').AsString := Codigo;
            try
              IBSQLDesc.ExecQuery;
            except
            end;
            if IBSQLDesc.RecordCount > 0 then
               while not IBSQLDesc.Eof do
               begin
                 if IBSQLDesc.FieldByName('TOMAR_VALOR').AsString = 'E' then
                 begin
                    ValorTasa:= SimpleRoundTo(IBSQLDesc.FieldByName('TASA').AsFloat*Entradas,0);
                    ValorValor := IBSQLDesc.FieldByName('VALOR').AsCurrency;
                    ValorVeces := IBSQLDesc.FieldByName('VECES').AsInteger * Entradas;
                 end
                 else
                 begin
                    ValorTasa:= SimpleRoundTo(IBSQLDesc.FieldByName('TASA').AsFloat*Salidas,0);
                    ValorValor := IBSQLDesc.FieldByName('VALOR').AsCurrency;
                    ValorVeces := IBSQLDesc.FieldByName('VECES').AsInteger * Salidas;
                 end;
                 if ValorTasa > 0 then
                 begin
                   IBSQLAux.Close;
                   IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                   IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                   IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_D').AsString;
                   IBSQLAux.ParamByName('DEBITO').AsCurrency := ValorTasa;
                   IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                   IBSQLAux.ParamByName('ID_CUENTA').Clear;
                   IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                   IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                   IBSQLAux.ParamByName('ID_PERSONA').Clear;
                   IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                   IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                   IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                   try
                     IBSQLAux.ExecQuery;
                     NoHay := False;
                   except
                     MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                     Exit;
                   end;
                   IBSQLAux.Close;
                   iBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                   IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                   IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_C').AsString;
                   IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                   IBSQLAux.ParamByName('CREDITO').AsCurrency := ValorTasa;
                   IBSQLAux.ParamByName('ID_CUENTA').Clear;
                   IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                   IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                   IBSQLAux.ParamByName('ID_PERSONA').Clear;
                   IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                   IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                   IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                   try
                     IBSQLAux.ExecQuery;
                     NoHay := False;
                   except
                     MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                     Exit;
                   end;
                   end;
                   if ValorVeces > 0 then begin
                      IBSQLAux.Close;
                      IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                      IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                      IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_D').AsString;
                      IBSQLAux.ParamByName('DEBITO').AsCurrency := ValorVeces;
                      IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                      IBSQLAux.ParamByName('ID_CUENTA').Clear;
                      IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                      IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                      IBSQLAux.ParamByName('ID_PERSONA').Clear;
                      IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                      IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                      IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                      try
                        IBSQLAux.ExecQuery;
                        NoHay := False;
                      except
                        MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                        Exit;
                      end;
                      IBSQLAux.Close;
                      IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                      IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                      IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                      IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_C').AsString;
                      IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                      IBSQLAux.ParamByName('CREDITO').AsCurrency := ValorVeces;
                      IBSQLAux.ParamByName('ID_CUENTA').Clear;
                      IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                      IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                      IBSQLAux.ParamByName('ID_PERSONA').Clear;
                      IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                      IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                      IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                      try
                        IBSQLAux.ExecQuery;
                        NoHay := False;
                      except
                         MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                         Exit;
                      end;
                     end;
                     if ValorValor > 0 then begin
                        IBSQLAux.Close;
                        IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                        IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                        IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                        IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_D').AsString;
                        IBSQLAux.ParamByName('DEBITO').AsCurrency := ValorValor;
                        IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                        IBSQLAux.ParamByName('ID_CUENTA').Clear;
                        IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                        IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                        IBSQLAux.ParamByName('ID_PERSONA').Clear;
                        IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                        IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                        IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                        try
                           IBSQLAux.ExecQuery;
                           NoHay := False;
                        except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                        end;
                       IBSQLAux.Close;
                       IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                       IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                       IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                       IBSQLAux.ParamByName('CODIGO').AsString := ibsqldesc.FieldByName('CODIGO_C').AsString;
                       IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                       IBSQLAux.ParamByName('CREDITO').AsCurrency := ValorValor;
                       IBSQLAux.ParamByName('ID_CUENTA').Clear;
                       IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                       IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                       IBSQLAux.ParamByName('ID_PERSONA').Clear;
                       IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                       IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                       IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                       try
                         IBSQLAux.ExecQuery;
                          NoHay := False;
                       except
                           MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                           Exit;
                       end;
                       end;
                        IBSQLDesc.Next;
                       end;


                      IBQuery2.Next;
                   end;


                    vAportes := vAportes;// - vComision;
                   if vAportes <> 0 then begin  // consignacion para cuentas de aportes
                       IBSQLAux.Close;
                       IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                       IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                       IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                       IBSQLAux.ParamByName('CODIGO').AsString := codigo_remoto(IBSQL4.FieldByName('ID_AGENCIA').AsInteger,1);
                       if vAportes > 0 then begin
                         IBSQLAux.ParamByName('DEBITO').AsCurrency := vaportes;
                         IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                       end
                       else
                       begin
                         IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                         IBSQLAux.ParamByName('CREDITO').AsCurrency := -vAportes;
                       end;
                       IBSQLAux.ParamByName('ID_CUENTA').Clear;
                       IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                       IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                       IBSQLAux.ParamByName('ID_PERSONA').Clear;
                       IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                       IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                       IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                       try
                         IBSQLAux.ExecQuery;
                         NoHay := False;
                       except
                         MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                         Exit;
                    end;
                    end;
                      vAhorros := vAhorros;// - vComision;
                   if vAhorros <> 0 then begin // consignacion para cuentas de ahorros
                       IBSQLAux.Close;
                       IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                       IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                       IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                       IBSQLAux.ParamByName('CODIGO').AsString := codigo_remoto(IBSQL4.FieldByName('ID_AGENCIA').AsInteger,2);
                       if vAhorros > 0 then begin
                         IBSQLAux.ParamByName('DEBITO').AsCurrency := vahorros + vComision;
                         IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                       end
                       else
                       begin
                         IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                         IBSQLAux.ParamByName('CREDITO').AsCurrency := -vAhorros - vComision;
                       end;
                       IBSQLAux.ParamByName('ID_CUENTA').Clear;
                       IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                       IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                       IBSQLAux.ParamByName('ID_PERSONA').Clear;
                       IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                       IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                       IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                       try
                         IBSQLAux.ExecQuery;
                         NoHay := False;
                       except
                         MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                         Exit;
                    end;
                    end;
                    //** inicio ingresos
                    if vComision > 0 then
                    begin
                     IBSQLAux.Close;
                     IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                     IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                     IBSQLAux.ParamByName('CODIGO').AsString := codigo_remoto(IBSQL4.FieldByName('ID_AGENCIA').AsInteger,2);
                     IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                     IBSQLAux.ParamByName('CREDITO').AsCurrency := vComision;
                     IBSQLAux.ParamByName('ID_CUENTA').Clear;
                     IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                     IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                     IBSQLAux.ParamByName('ID_PERSONA').Clear;
                     IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                     IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                     IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                     try
                       IBSQLAux.ExecQuery;
                       NoHay := False;
                    except
                      MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                      Exit;
                    end;
                    end;
//

                    //**
                   {if vComision <> 0 then begin // consignacion para cuentas de ahorros
                       IBSQLAux.Close;
                       IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                       IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                       IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
                       IBSQLAux.ParamByName('CODIGO').AsString := codigo_remoto(IBSQL4.FieldByName('ID_AGENCIA').AsInteger,2);
                       if vAhorros > 0 then begin
                         IBSQLAux.ParamByName('DEBITO').AsCurrency := vahorros;
                         IBSQLAux.ParamByName('CREDITO').AsCurrency := 0;
                       end
                       else
                       begin
                         IBSQLAux.ParamByName('DEBITO').AsCurrency := 0;
                         IBSQLAux.ParamByName('CREDITO').AsCurrency := -vAhorros;
                       end;
                       IBSQLAux.ParamByName('ID_CUENTA').Clear;
                       IBSQLAux.ParamByName('ID_COLOCACION').Clear;
                       IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                       IBSQLAux.ParamByName('ID_PERSONA').Clear;
                       IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
                       IBSQLAux.ParamByName('TASA_RETENCION').Clear;
                       IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
                       try
                         IBSQLAux.ExecQuery;
                         NoHay := False;
                       except
                         MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
                         Exit;
                    end;
                    end;  }
                    //**fin ingresos
                 IBQuery2.Next;
                 end;

                with IBSQL1 do begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT SUM(DEBITO) AS DEBITO,SUM(CREDITO) AS  CREDITO FROM "con$auxiliar"');
                  SQL.Add('WHERE ID_AGENCIA = :AGENCIA and ID_COMPROBANTE = :COMPROBANTE');
                  ParamByName('AGENCIA').AsInteger := Agencia;
                  ParamByName('COMPROBANTE').AsInteger := Consecutivo;
                  ExecQuery;
                  TotalDebito := FieldByName('DEBITO').AsCurrency;
                  TotalCredito := FieldByName('CREDITO').AsCurrency;
                  Close;
                  SQL.Clear;
                  SQL.Add('UPDATE "con$comprobante" SET TOTAL_DEBITO = :DEBITO, TOTAL_CREDITO = :CREDITO,');
                  SQL.Add('IMPRESO = 1 WHERE ID_AGENCIA = :ID_AGENCIA and ID_COMPROBANTE = :ID_COMPROBANTE');
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
                  ParamByName('DEBITO').AsCurrency := TotalDebito;
                  ParamByName('CREDITO').AsCurrency := TotalCredito;
                  ExecQuery;
                end;
                  Next;
                end;
               end;
               with IBSQL1 do
               begin
                 Close;
                 SQL.Clear;
                 SQL.Add('update "caj$cierresucursal" set CONTABILIZADO = 1 where FECHA = :FECHA');
                 ParamByName('FECHA').AsDate := EdFecha.Date;
                 ExecQuery;
               end;
               IBSQL1.Transaction.Commit;
               cmdReporte.Click;

{        with IBSQLColocacion do begin
           Close;
           ParamByName('ID_CAJA').AsInteger := StrToInt(EdCaja.Caption);
           ParamByName('FECHA1').AsDateTime := Fecha1 + StrToTime('00:00:00');
           ParamByName('FECHA2').AsDateTime := Fecha2 + StrToTime('23:59:59');
           try
             ExecQuery;
             if RecordCount > 0 then begin
             NoHay := False;
             while not eof do begin
              IBSQLAux.Close;
              IBSQLAux.ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
              IBSQLAux.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBSQLAux.ParamByName('FECHA').AsDate := EdFecha.Date;
              IBSQLAux.ParamByName('CODIGO').AsString := FieldByName('CODIGO_PUC').AsString;
              IBSQLAux.ParamByName('DEBITO').AsCurrency := FieldByName('DEBITO').AsCurrency;
              IBSQLAux.ParamByName('CREDITO').AsCurrency := FieldByName('CREDITO').AsCurrency;
              IBSQLAux.ParamByName('ID_CUENTA').Clear;
              IBSQLAux.ParamByName('ID_COLOCACION').Clear;
              IBSQLAux.ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              IBSQLAux.ParamByName('ID_PERSONA').Clear;
              IBSQLAux.ParamByName('MONTO_RETENCION').AsCurrency := 0;
              IBSQLAux.ParamByName('TASA_RETENCION').Clear;
              IBSQLAux.ParamByName('ESTADOAUX').AsString := 'O';
              try
               IBSQLAux.ExecQuery;
               NoHay := False;
              except
               MessageDlg('Error al Actualizar Auxiliar',mtError,[mbcancel],0);
               Exit;
              end;
              Next;
             end;
             end
             else
              if NoHay then
              begin
                MessageDlg('No Existe Información para el comprobante',mtInformation,[mbok],0);
              end;
           except
              MessageDlg('Error al buscar movimientos de colocaciones',mterror,[mbcancel],0);
              Transaction.Rollback;
              raise;
           end;
        end;}

       { with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT SUM(DEBITO) AS DEBITO,SUM(CREDITO) AS  CREDITO FROM "con$auxiliar"');
          SQL.Add('WHERE ID_AGENCIA = :AGENCIA and ID_COMPROBANTE = :COMPROBANTE');
          ParamByName('AGENCIA').AsInteger := Agencia;
          ParamByName('COMPROBANTE').AsInteger := Consecutivo;
          try
            ExecQuery;
            TotalDebito := FieldByName('DEBITO').AsCurrency;
            TotalCredito := FieldByName('CREDITO').AsCurrency;
          finally
            Close;
          end;
          SQL.Clear;
          SQL.Add('UPDATE "con$comprobante" SET TOTAL_DEBITO = :DEBITO, TOTAL_CREDITO = :CREDITO,');
          SQL.Add('IMPRESO = 1 WHERE ID_AGENCIA = :ID_AGENCIA and ID_COMPROBANTE = :ID_COMPROBANTE');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COMPROBANTE').AsInteger := Consecutivo;
          ParamByName('DEBITO').AsCurrency := TotalDebito;
          ParamByName('CREDITO').AsCurrency := TotalCredito;
          try
             ExecQuery;
          except
          end;
        end;}


end;

procedure TFrmComprobanteSucursal.EdFechaEnter(Sender: TObject);
begin
        EdFechaChange(Sender);
end;

procedure TFrmComprobanteSucursal.cmdReporteClick(Sender: TObject);
begin
        with IBAuxiliar do begin
         if not Transaction.InTransaction then
            Transaction.StartTransaction;
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         CDconsecutivo.Filtered := False;
         ParamByName('ID1').AsInteger := CDconsecutivo.FieldByName('consecutivo').AsInteger;
         CDconsecutivo.Next;
         ParamByName('ID2').AsInteger := CDconsecutivo.FieldByName('consecutivo').AsInteger;
         CDconsecutivo.Next;
         ParamByName('ID3').AsInteger := CDconsecutivo.FieldByName('consecutivo').AsInteger;
         try
          Open;
          Report.Variables.ByName['EMPRESA'].AsString := Empresa;
          Report.Variables.ByName['NIT'].AsString := Nit;
          if Report.PrepareReport then
             Report.PreviewPreparedReport(True);
         except
         end;
        end;

end;


function TFrmComprobanteSucursal.codigo_remoto(id_agencia,
  id_origen: integer): string;
begin
      IBSQL5.Close;
      IBSQL5.ParamByName('ID_AGENCIA').AsInteger := id_agencia;
      IBSQL5.ParamByName('ID_ORIGEN').AsInteger := id_origen;
      IBSQL5.ExecQuery;
      Result := IBSQL5.FieldByName('CODIGO').AsString;
end;

procedure TFrmComprobanteSucursal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
       if Procesado then
        with IBQuery2 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;     
          Transaction.StartTransaction;
          Close;
          Sql.Clear;
          Sql.Add('drop table ' + Tabla);
          try
            ExecSQL;
          finally
            Close;
            Transaction.Commit;
          end;
        end;

        CanClose := True;


end;

end.
