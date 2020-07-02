unit UnitBarridoTD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Grids, DBGrids, ExtCtrls, Buttons,
  IBCustomDataSet, IBQuery, ShellApi,JvStaticText, DBCtrls, IBSQL, DateUtils,
  ComCtrls, pr_Common, pr_TxClasses;

type
  TFrmBarridoTD = class(TForm)
    GroupBox1: TGroupBox;
    CDbarrido: TClientDataSet;
    DSbarrido: TDataSource;
    CDbarridonombres: TStringField;
    CDbarridoid_tarjeta: TStringField;
    CDbarridonumero_cuenta: TIntegerField;
    CDbarridodigito_cuenta: TIntegerField;
    CDbarridofecha_descuento: TDateField;
    DBbarrido: TDBGrid;
    Panel1: TPanel;
    CmdProcesar: TBitBtn;
    CmdEjecutar: TBitBtn;
    CmdReporte: TBitBtn;
    CmdCerrar: TBitBtn;
    IBTdebito: TIBQuery;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    JvValor: TJvStaticText;
    JvFecha: TJvStaticText;
    JvTotal: TJvStaticText;
    JvStaticText4: TJvStaticText;
    CDbarridodescuento: TBooleanField;
    CmdCancelar: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    IBSQL1: TIBSQL;
    CDbarridoid_tipo: TIntegerField;
    IBSComprobante: TIBSQL;
    CDbarridonumero: TAggregateField;
    IbCodigos: TIBSQL;
    IBimpuestos: TIBSQL;
    ReporteC: TprTxReport;
    IBAuxiliar: TIBQuery;
    CDbarridoid_persona: TStringField;
    ReporteA: TprTxReport;
    Memo1: TMemo;
    ReporteD: TprTxReport;
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdCancelarClick(Sender: TObject);
    procedure CmdEjecutarClick(Sender: TObject);
    procedure DBbarridoColExit(Sender: TObject);
    procedure DBbarridoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CmdReporteClick(Sender: TObject);
  private
    vValorComision :Currency;
    vAmortizacion :Integer;
    vGravamen :Currency;
    vComprobante :Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBarridoTD: TFrmBarridoTD;

implementation
uses UnitGlobales, UnitPantallaProgreso, UnitdmGeneral, UnitGlobalesCol;

{$R *.dfm}

procedure TFrmBarridoTD.CmdProcesarClick(Sender: TObject);
var     FechaCorte :TDate;
        vSaldoActual :Currency;
        vSaldoMinimo :Currency;
begin
        FechaCorte := fFechaActual;
        with IBTdebito do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".ID_PERSONA,');
          SQL.Add('"cap$tarjetactrlcuota".NUMERO_CUENTA,');
          SQL.Add('"cap$tarjetactrlcuota".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$tarjetactrlcuota".DIGITO_CUENTA,');
          SQL.Add('"cap$tarjetactrlcuota".ID_TARJETA,');
          SQL.Add('"cap$tarjetactrlcuota".FECHA_PROXIMO_DESCUENTO,');
          SQL.Add('"cap$tarjetacuenta".ID_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"cap$tarjetactrlcuota"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$tarjetactrlcuota".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$tarjetactrlcuota".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
          SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "cap$tarjetacuenta" ON ("cap$tarjetactrlcuota".ID_TARJETA = "cap$tarjetacuenta".ID_TARJETA)');
          SQL.Add('WHERE');
          SQL.Add('("cap$tarjetactrlcuota".FECHA_PROXIMO_DESCUENTO <= :FECHA) AND ');
          SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1) AND');
          SQL.Add('("cap$tarjetacuenta".ID_ESTADO IN (1,2))');
          ParamByName('FECHA').AsDate := FechaCorte;
          Open;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Titulo := 'Barrido Tarjeta Débito';
          frmProgreso.Min := 0;
          frmProgreso.Max := RecordCount;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Tarjeta No : ' + FieldByName('ID_TARJETA').AsString;
            Application.ProcessMessages;
            // buscar saldo minimo de ahorros
            IBSQL1.Close;
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL');
            IBSQL1.SQL.Add('(:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
            IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
            IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
            IBSQL1.ParamByName('ANO').AsString := IntToStr(YearOf(ffechaactual));
            IBSQL1.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(ffechaactual),01,01);
            IBSQL1.ParamByName('FECHA2').AsDate := fFechaActual;
            IBSQL1.ExecQuery;
            vSaldoActual := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
            IBSQL1.Close;
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('select SALDO_MINIMO FROM "cap$tipocaptacion" WHERE ID_TIPO_CAPTACION = :ID_TIPO');
            IBSQL1.ParamByName('ID_TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBSQL1.ExecQuery;
            vSaldoMinimo := IBSQL1.FieldByName('SALDO_MINIMO').AsCurrency;
            IBSQL1.Close;
            // fin de saldo minimo de ahorros
            CDbarrido.Append;
            CDbarrido.FieldValues['nombres'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            CDbarrido.FieldValues['id_tarjeta'] := FieldByName('ID_TARJETA').AsString;
            CDbarrido.FieldValues['numero_cuenta'] := FieldByName('NUMERO_CUENTA').AsInteger;
            CDbarrido.FieldValues['digito_cuenta'] := FieldByName('DIGITO_CUENTA').AsInteger;
            CDbarrido.FieldValues['fecha_descuento'] := FieldByName('FECHA_PROXIMO_DESCUENTO').AsDateTime;
            if (vSaldoActual - vValorComision) > 0 then
               CDbarrido.FieldValues['descuento'] := True
            else
            begin
               CDbarrido.FieldValues['descuento'] := False;
               Memo1.Lines.Add(FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + #9 + FieldByName('NUMERO_CUENTA').AsString + ' ' + currtostrf(vSaldoActual,ffCurrency,2) + #13);
            end;
            CDbarrido.FieldValues['id_tipo'] := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            CDbarrido.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
            CDbarrido.Append;
            Next;
          end;
          frmProgreso.Cerrar;
        end;
        CDbarrido.First;
        JvTotal.Caption := IntToStr(CDbarrido.RecordCount);
        CmdProcesar.Enabled := False;
        CmdEjecutar.Enabled := True;
        CmdCancelar.Enabled := True;
        with CDbarrido do
        begin
          First;
          Filtered := False;
          Filter := 'descuento = true';
          Filtered := True;
          if RecordCount = 0 then
             CmdEjecutar.Enabled := False;
        end;
        if (CmdEjecutar.Enabled = False) then
        with CDbarrido do
        begin
          First;
          Filtered := False;
          Filter := 'descuento = false';
          Filtered := True;
          if (RecordCount <> 0) then
          begin
            if MessageDlg('Existen Asociados con Fondos Insuficientes. Desea Ver el Resultado?',mtInformation,[mbyes,mbno],0) = mrno then
            begin
               CancelUpdates;
               Exit;
            end;
            ReporteD.Variables.ByName['EMPRESA'].AsString := Empresa;
            ReporteD.Variables.ByName['NIT'].AsString := Nit;
            ReporteD.Variables.ByName['Agencia'].AsString := IntToStr(Agencia);
            if ReporteD.PrepareReport then
               ReporteD.PreviewPreparedReport(True);
          end;
        end;
        //Memo1.Lines.SaveToFile('c:\reporteTD.txt');
        //ShellExecute(Handle, 'open', 'notepad.exe', PChar('c:\reporteTD.txt'), nil, SW_SHOWNORMAL);

end;

procedure TFrmBarridoTD.FormCreate(Sender: TObject);
begin
        CmdCancelar.Click;
        with IBTdebito do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 20');
          Open;
          vValorComision := FieldByName('VALOR_MINIMO').AsCurrency;
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 19');
          Open;
          vAmortizacion := FieldByName('VALOR_MINIMO').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 12');
          Open;
          vGravamen := (FieldByName('VALOR_MINIMO').AsCurrency/1000);
        end;
        JvValor.Caption := currtostrf(vValorComision,ffCurrency,0);
        JvFecha.Caption := DateToStr(fFechaActual);

end;

procedure TFrmBarridoTD.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmBarridoTD.CmdCancelarClick(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        CDbarrido.CancelUpdates;
        JvTotal.Caption := '';
        CmdProcesar.Enabled := True;
        CmdEjecutar.Enabled := False;
        CmdCancelar.Enabled := False;
        //CmdReporte.Enabled := False;
        //CmdProcesar.SetFocus;
end;

procedure TFrmBarridoTD.CmdEjecutarClick(Sender: TObject);
var     vValorTarjeta :Currency;
        vValorImpuestos :Currency;
        Comprobante :Integer;
        FechaPro:TDate;
        FechaVencPro:TDate;
        Dia,Dif:Integer;
        vDebito,vCredito :Currency;
        vAportes,vOrdinario,vJuvenil :Currency;
        CodigoAho,CodigoApo,CodigoJuv :string;
        CodImpAho,CodImpJuv :string;
        CodGMFAho,CodGMFJuv :string;
        vValorImpAho,vValorImpJuv :Currency;
        CodCuota :string;
begin
        if MessageDlg('Esta Seguro de Aplicar el Barrido?',mtInformation,[mbok],0) = mrno then
           Exit;
        Comprobante := ObtenerConsecutivo(IBSComprobante,4);//generacion del comprobante
        vComprobante := Comprobante;
        CmdEjecutar.Enabled := False;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        CmdReporte.Enabled := True;
        vValorTarjeta := 0;
        vValorImpuestos := 0;
        vAportes := 0;
        vOrdinario := 0;
        vJuvenil := 0;
        IBimpuestos.Close;
        IBimpuestos.ParamByName('ID_CONTABLE').AsInteger := 11;
        IBimpuestos.ParamByName('ID_CAPTACION').AsInteger := 2;
        IBimpuestos.ExecQuery;
        CodCuota := IBimpuestos.FieldByName('CODIGO_CONTABLE').AsString;
        with CDbarrido do // inicio cdbarrido
        begin
          First;
          Filtered := False;
          Filter := 'descuento = true';
          Filtered := True;
          while not Eof do
          begin
            //vValorTarjeta := vValorTarjeta + vValorComision;
            with IBSQL1 do
            begin
              Close;
              // registrar salida en el extracto
              SQL.Clear;
              SQL.Add('insert into "cap$extracto" values(');
              SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
              SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
              SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
              SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_TIPO_CAPTACION').AsInteger := CDbarridoid_tipo.Value;
              ParamByName('NUMERO_CUENTA').AsInteger := CDbarridonumero_cuenta.Value;
              ParamByName('DIGITO_CUENTA').AsInteger := cdbarridodigito_cuenta.Value;
              ParamByName('FECHA_MOVIMIENTO').AsDate := fFechaActual;
              ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
              ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 28;
              ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
              ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Descuento Cuota Admon Tarjeta Débito';
              ParamByName('VALOR_DEBITO').AsCurrency := 0;
              ParamByName('VALOR_CREDITO').AsCurrency := vValorComision;
            try
              ExecQuery;
            except
              Transaction.Rollback;
              MessageDlg('Error al Descontar la Cuota de Administración',mtError,[mbOk],0);
              raise;
              Exit;
            end;// fin del primer raise
             //actualizar nueva fecha de descuento
            Close;
            SQL.Clear;
            SQL.Add('update "cap$tarjetactrlcuota" set');
            SQL.Add('FECHA_DESCUENTO = :FECHA_DESCUENTO,FECHA_PROXIMO_DESCUENTO = :FECHA_PROXIMO_DESCUENTO');
            SQL.Add('where ID_TARJETA = :ID_TARJETA and ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_TARJETA').AsString := CDbarridoid_tarjeta.Value;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA_DESCUENTO').asDate := CDbarridofecha_descuento.Value;
            FechaPro := CDbarridofecha_descuento.Value;
            FechaVencPro := CalculoFecha(FechaPro,vAmortizacion);
            Dif := Dia - DayOf(FechaPro);
            if Dif > 0 then
               FechaVencPro := CalculoFecha(FechaVencPro,Dif);
            ParamByName('FECHA_PROXIMO_DESCUENTO').AsDate := FechaVencPro;
            try
             ExecQuery;
            except
             Transaction.Rollback;
             MessageDlg('Error al tratar de registrar próximo descuento de cuota',mtError,[mbOk],0);
             raise;
            end;//fin del segundo raise
            //fin actualizacion nueva fecha de descuento

          end;// fin del ibsql
           Next;
        end;// fin del while
        end;//fin cdbarrido
        // buscar tipos de cuentas y valores
        with CDbarrido do
        begin
          //aportes
          Filtered := False;
          Filter := 'id_tipo = 1 and descuento = true';
          Filtered := True;
          AggregatesActive := True;
          if RecordCount > 0 then
          begin
              vAportes := vValorComision * CDbarridonumero.Value;
              IbCodigos.Close;
              IbCodigos.ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
              CodigoApo := IbCodigos.FieldByName('CODIGO_CONTABLE').AsString;
          end;
          //ahorros
          Filtered := False;
          Filter := 'id_tipo = 2 and descuento = true';
          Filtered := True;
          AggregatesActive := True;
          if RecordCount > 0 then
          begin
              vOrdinario := vValorComision * CDbarridonumero.Value;
              IbCodigos.Close;
              IbCodigos.ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
              IbCodigos.ExecQuery;
              CodigoAho:= IbCodigos.FieldByName('CODIGO_CONTABLE').AsString;
              IBimpuestos.Close;
              IBimpuestos.ParamByName('ID_CONTABLE').AsInteger := 4;
              IBimpuestos.ParamByName('ID_CAPTACION').AsInteger := 2;
              IBimpuestos.ExecQuery;
              CodGMFAho := IBimpuestos.FieldByName('CODIGO_CONTABLE').AsString;
              IBimpuestos.Close;
              IBimpuestos.ParamByName('ID_CONTABLE').AsInteger := 12;
              IBimpuestos.ParamByName('ID_CAPTACION').AsInteger := 2;
              IBimpuestos.ExecQuery;
              CodImpAho := IBimpuestos.FieldByName('CODIGO_CONTABLE').AsString;
              vValorImpAho := vOrdinario * vGravamen;
          end;
          //juvenil
          Filtered := False;
          Filter := 'id_tipo = 4 and descuento = true';
          Filtered := True;
          AggregatesActive := True;
          if RecordCount > 0 then
          begin
              vJuvenil := vValorComision * CDbarridonumero.Value;
              IbCodigos.Close;
              IbCodigos.ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
              IbCodigos.ExecQuery;
              CodigoJuv := IbCodigos.FieldByName('CODIGO_CONTABLE').AsString;
              IBimpuestos.Close;
              IBimpuestos.ParamByName('ID_CONTABLE').AsInteger := 4;
              IBimpuestos.ParamByName('ID_CAPTACION').AsInteger := 4;
              IBimpuestos.ExecQuery;
              CodGMFJuv := IBimpuestos.FieldByName('CODIGO_CONTABLE').AsString;
              IBimpuestos.Close;
              IBimpuestos.ParamByName('ID_CONTABLE').AsInteger := 12;
              IBimpuestos.ParamByName('ID_CAPTACION').AsInteger := 4;
              IBimpuestos.ExecQuery;
              CodImpJuv := IBimpuestos.FieldByName('CODIGO_CONTABLE').AsString;
              vValorImpJuv := vJuvenil * vGravamen;
          end;
        end;// fin cdbarrido
        vValorTarjeta := vAportes + vJuvenil + vOrdinario;
        vValorImpuestos := vValorImpJuv + vValorImpAho;
        vCredito := vValorImpuestos + vValorTarjeta;
        vDebito := vCredito;
        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "con$comprobante"');
          SQL.Add('("con$comprobante"."ID_COMPROBANTE", "con$comprobante"."ID_AGENCIA", ');
          SQL.Add('"con$comprobante"."TIPO_COMPROBANTE", "con$comprobante"."FECHADIA", ');
          SQL.Add('"con$comprobante"."DESCRIPCION", "con$comprobante"."TOTAL_DEBITO", ');
          SQL.Add('"con$comprobante"."TOTAL_CREDITO", ');
          SQL.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO", ');
          SQL.Add('"con$comprobante"."ANULACION", ');
          SQL.Add('"con$comprobante"."ID_EMPLEADO")');
          SQL.Add('values');
          SQL.Add('(:"ID_COMPROBANTE", :"ID_AGENCIA", :"TIPO_COMPROBANTE", ');
          SQL.Add(':"FECHADIA", ');
          SQL.Add(':"DESCRIPCION", :"TOTAL_DEBITO", :"TOTAL_CREDITO", :"ESTADO", ');
          SQL.Add(':"IMPRESO", ');
          SQL.Add(':"ANULACION", :"ID_EMPLEADO")');
          ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
          ParamByName('FECHADIA').AsDateTime := fFechaActual;
          ParamByName('DESCRIPCION').AsString := 'Descuento Cuotas de Manejo Tarjetas Debito';
          ParamByName('TOTAL_DEBITO').AsCurrency := vDebito;
          ParamByName('TOTAL_CREDITO').AsCurrency := vCredito;
          ParamByName('ESTADO').AsString := 'O';
          ParamByName('IMPRESO').AsInteger := 1;
          ParamByName('ANULACION').AsString := '';
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
            ExecQuery;
          except
          begin
            MessageDlg('Error Generando Comprobante',mtInformation,[mbok],0);
            Transaction.Rollback;
            Exit;
          end;
          end;
          Close;
          SQL.Clear;
          SQL.Add('insert into "con$auxiliar" values (');
          SQL.Add(':ID_COMPROBANTE,');
          SQL.Add(':ID_AGENCIA,');
          SQL.Add(':FECHA,');
          SQL.Add(':CODIGO,');
          SQL.Add(':DEBITO,');
          SQL.Add(':CREDITO,');
          SQL.Add(':ID_CUENTA,');
          SQL.Add(':ID_COLOCACION,');
          SQL.Add(':ID_IDENTIFICACION,');
          SQL.Add(':ID_PERSONA,');
          SQL.Add(':MONTO_RETENCION,');
          SQL.Add(':TASA_RETENCION,');
          SQL.Add(':ESTADOAUX');
          SQL.Add(')');
          if (vAportes + vJuvenil + vOrdinario) > 0 then
          begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := CodCuota;
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := (vAportes + vOrdinario + vJuvenil);
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            try
              ExecQuery;
            except
            begin
              MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            end;
          end;

          //aportes
          if vAportes > 0 then
          begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := CodigoApo;
            ParamByName('DEBITO').AsCurrency := vAportes;
            ParamByName('CREDITO').AsCurrency := 0;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            try
              ExecQuery;
            except
            begin
              MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            end;
          end;
          if vOrdinario > 0 then
          begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := CodigoAho;
            ParamByName('DEBITO').AsCurrency := vOrdinario;
            ParamByName('CREDITO').AsCurrency := 0;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            try
              ExecQuery;
            except;
            begin
              MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            end;
          end;
          //juvenil
          if vJuvenil> 0 then
          begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := CodigoJuv;
            ParamByName('DEBITO').AsCurrency := vJuvenil;
            ParamByName('CREDITO').AsCurrency := 0;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            try
              ExecQuery;
            except;
            begin
              MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            end;
          end;
            // impuesto asumidos
            if CodImpAho = CodImpJuv then
            begin
              ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('FECHA').AsDateTime := fFechaActual;
              ParamByName('CODIGO').AsString := CodImpAho;
              ParamByName('DEBITO').AsCurrency := 0;
              ParamByName('CREDITO').AsCurrency := (vValorImpAho + vValorImpJuv);
              ParamByName('ID_CUENTA').Clear;
              ParamByName('ID_COLOCACION').Clear;
              ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              ParamByName('ID_PERSONA').Clear;
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              try
                ExecQuery;
              except;
              begin
                MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
                Transaction.Rollback;
                Exit;
              end;
              end;
              ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('FECHA').AsDateTime := fFechaActual;
              ParamByName('CODIGO').AsString := CodGMFAho;
              ParamByName('DEBITO').AsCurrency := (vValorImpAho + vValorImpJuv);
              ParamByName('CREDITO').AsCurrency := 0;
              ParamByName('ID_CUENTA').Clear;
              ParamByName('ID_COLOCACION').Clear;
              ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              ParamByName('ID_PERSONA').Clear;
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              try
                ExecQuery;
              except;
              begin
                MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
                Transaction.Rollback;
                Exit;
              end;
              end;
            end // fin valida codigo impuestos
            else
            begin
              if vValorImpAho > 0 then
              begin
                ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA').AsDateTime := fFechaActual;
                ParamByName('CODIGO').AsString := CodimpAho;
                ParamByName('DEBITO').AsCurrency := 0;
                ParamByName('CREDITO').AsCurrency := vValorImpAho;
                ParamByName('ID_CUENTA').Clear;
                ParamByName('ID_COLOCACION').Clear;
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').Clear;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').AsFloat := 0;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                  ExecQuery;
                except;
                begin
                  MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
                  Transaction.Rollback;
                  Exit;
                end;
                end;

                //gmf
                ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA').AsDateTime := fFechaActual;
                ParamByName('CODIGO').AsString := CodGMFAho;
                ParamByName('DEBITO').AsCurrency := vValorImpAho;
                ParamByName('CREDITO').AsCurrency := 0;
                ParamByName('ID_CUENTA').Clear;
                ParamByName('ID_COLOCACION').Clear;
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').Clear;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').AsFloat := 0;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                  ExecQuery;
                except;
                begin
                  MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
                  Transaction.Rollback;
                  Exit;
                end;
                end;

                //
              end;

              if vValorImpJuv > 0 then
              begin
                ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA').AsDateTime := fFechaActual;
                ParamByName('CODIGO').AsString := CodImpJuv;
                ParamByName('DEBITO').AsCurrency := 0;
                ParamByName('CREDITO').AsCurrency := vValorImpJuv;
                ParamByName('ID_CUENTA').Clear;
                ParamByName('ID_COLOCACION').Clear;
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').Clear;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').AsFloat := 0;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                  ExecQuery;
                except;
                begin
                  MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
                  Transaction.Rollback;
                  Exit;
                 end;
                 end;
               //gmf
                ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('FECHA').AsDateTime := fFechaActual;
                ParamByName('CODIGO').AsString := CodGMFJuv;
                ParamByName('DEBITO').AsCurrency := vValorImpJuv;
                ParamByName('CREDITO').AsCurrency := 0;
                ParamByName('ID_CUENTA').Clear;
                ParamByName('ID_COLOCACION').Clear;
                ParamByName('ID_IDENTIFICACION').AsInteger := 0;
                ParamByName('ID_PERSONA').Clear;
                ParamByName('MONTO_RETENCION').AsCurrency := 0;
                ParamByName('TASA_RETENCION').AsFloat := 0;
                ParamByName('ESTADOAUX').AsString := 'O';
                try
                  ExecQuery;
                except;
                begin
                  MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
                  Transaction.Rollback;
                  Exit;
                 end;
                 end;

               //
               end;
              end; // fin del begin else
              Transaction.Commit;
          end;
          CmdReporte.Click;
          // genero comprobante
end;

procedure TFrmBarridoTD.DBbarridoColExit(Sender: TObject);
begin
 if DBbarrido.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False

end;

procedure TFrmBarridoTD.DBbarridoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
     DBCheckBox1.Left := Rect.Left + DBbarrido.Left + 2;
     DBCheckBox1.Top := Rect.Top + DBbarrido.top + 2;
     DBCheckBox1.Width := Rect.Right - Rect.Left;
     DBCheckBox1.Height := Rect.Bottom - Rect.Top;
     DBCheckBox1.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      DBbarrido.Canvas.FillRect(Rect);
      DrawFrameControl(DBbarrido.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFrmBarridoTD.CmdReporteClick(Sender: TObject);
begin
// Imprimir Comprobante
        with CDbarrido do
        begin
          Filtered := False;
          Filter := 'descuento = true';
          Filtered := True;
        end;
        with IBAuxiliar do
        begin
             if Transaction.InTransaction then
                Transaction.Rollback;
             Transaction.StartTransaction;
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
             ParamByName('ID_COMPROBANTE').AsInteger := vComprobante;
             try
              Open;
              ReporteC.Variables.ByName['EMPRESA'].AsString := Empresa;
              ReporteC.Variables.ByName['NIT'].AsString := Nit;
              ReporteC.Variables.ByName['Agencia'].AsString := IntToStr(Agencia);
              if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
              Close;
             except
               MessageDlg('Error generando el comprobante',mtError,[mbcancel],0);
               Close;
             end;
             Transaction.Commit;
        end;

end;

end.
