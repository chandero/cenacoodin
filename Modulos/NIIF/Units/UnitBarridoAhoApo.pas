unit UnitBarridoAhoApo;

interface

uses
  Windows, Messages, DateUtils, Math, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JvTypedEdit, JvEdit, IBSQL, DB,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, IBDatabase, UnitDmGeneral,
  DBClient;

type
  TfrmBarridoAhoApo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    CmdReporte: TBitBtn;
    CmdAplicar: TBitBtn;
    CmdComprobante: TBitBtn;
    CmdCerrar: TBitBtn;
    RGProceso: TRadioGroup;
    RGProcesar: TRadioGroup;
    GB1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdDias: TJvIntegerEdit;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    ReporteC: TprTxReport;
    IBAuxiliar: TIBQuery;
    CDSTabla: TClientDataSet;
    CDSTablaID_AGENCIA: TIntegerField;
    CDSTablaID_TIPO_CAPTACION: TIntegerField;
    CDSTablaNUMERO_CUENTA: TIntegerField;
    CDSTablaDIGITO_CUENTA: TIntegerField;
    CDSTablaID_IDENTIFICACION: TIntegerField;
    CDSTablaID_PERSONA: TStringField;
    CDSTablaNOMBRE: TStringField;
    CDSTablaVALOR_ABONADO: TCurrencyField;
    CDSTablaTOTAL_ABONADO: TAggregateField;
    Reporte: TprTxReport;
    procedure RGProcesoClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure CmdReporteClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure CmdComprobanteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBarridoAhoApo: TfrmBarridoAhoApo;
  SaldoMinimoApo:Currency;
  SaldoMinimoAho:Currency;
  Tabla:string;
  Comprobante :Integer;
  dmGeneral: TdmGeneral;
  
implementation

{$R *.dfm}

uses UnitPantallaProgreso, unitGlobales;

procedure TfrmBarridoAhoApo.RGProcesoClick(Sender: TObject);
begin
        case RGProceso.ItemIndex of
         0: GB1.Enabled := False;
         1: GB1.Enabled := True;
        end;
end;

procedure TfrmBarridoAhoApo.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBarridoAhoApo.CmdProcesarClick(Sender: TObject);
var Total:Integer;
    frmProgreso:TfrmProgreso;
    SaldoCuentaApo:Currency;
    SaldoCuentaAho:Currency;
    Inicial:Currency;
    Movimiento:Currency;
    DifMin:Currency;
    DifAho:Currency;
begin
        CmdProcesar.Enabled := False;
        Application.ProcessMessages;

        with IBQuery1 do begin
           if Transaction.InTransaction then Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from P_CAP_0001 (:ID)');
           ParamByName('ID').AsInteger := 1;
           try
             Open;
             if RecordCount > 0 then
                Total := FieldByName('TOTAL').AsInteger
             else
             begin
                MessageDlg('No hay registros para evaluar',mtError,[mbcancel],0);
                Transaction.Rollback;
                Exit;
             end;
           except
             Transaction.Rollback;
             raise;
             Exit;
           end;
        end;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select SALDO_MINIMO from "cap$tipocaptacion" where ID_TIPO_CAPTACION = :ID');
          ParamByName('ID').AsInteger := 1;
          try
           Open;
           SaldoMinimoApo := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;
        end;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select SALDO_MINIMO from "cap$tipocaptacion" where ID_TIPO_CAPTACION = :ID');
          ParamByName('ID').AsInteger := 2;
          try
           Open;
           SaldoMinimoAho := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;
        end;

        with IBQuery1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from P_CAP_0002 (:ID)');
         ParamByName('ID').AsInteger := 1;
         try
          Open;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
          {
          Tabla := '"Bar' + FloatToStr(Date) + IntToStr(1) + '"';
          IBQuery2.Close;
          IBQuery2.SQL.Clear;
          IBQuery2.SQL.Add('create table ' + Tabla + '(');
          IBQuery2.SQL.Add('ID_AGENCIA TIPOS,');
          IBQuery2.SQL.Add('ID_TIPO_CAPTACION TIPOS,');
          IBQuery2.SQL.Add('NUMERO_CUENTA TIPO_CAPTACION,');
          IBQuery2.SQL.Add('DIGITO_CUENTA TIPOS,');
          IBQuery2.SQL.Add('ID_IDENTIFICACION TIPOS,');
          IBQuery2.SQL.Add('ID_PERSONA VARCHAR(15),');
          IBQuery2.SQL.Add('NOMBRE VARCHAR(150),');
          IBQuery2.SQL.Add('VALOR_ABONADO NUMERICO);');
          try
              IBQuery2.ExecSQL;
              IBQuery2.Transaction.CommitRetaining;
              IBQuery2.Close;
          except
              frmProgreso.Cerrar;
              MessageDlg('No se pudo crear la tabla temporal para la liquidación',mtError,[mbcancel],0);
              Exit;
          end;
         }

         CDSTabla.Open;
         CDSTabla.EmptyDataSet;

         frmProgreso := TfrmProgreso.Create(Self);
         frmProgreso.Min := 0;
         frmProgreso.Max := Total;
         frmProgreso.Position := 0;
         frmProgreso.Ejecutar;

         while not Eof do begin
           frmProgreso.Position := RecNo;
           frmProgreso.InfoLabel := 'Analizando Aportación:'+FieldByName('ID_TIPO_CAPTACION').AsString + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' + FieldByName('DIGITO_CUENTA').AsString;
           Application.ProcessMessages;
           IBQuery2.Close;
           IBQuery2.SQL.Clear;
           IBQuery2.SQL.Add('select * from P_CAP_0012 (:AG,:ID,:CTA,:DG,:ANO)');
           IBQuery2.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
           IBQuery2.ParamByName('ID').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
           IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
           IBQuery2.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
           IBQuery2.ParamByName('ANO').AsString := IntToStr(yearof(Date));
           IBQuery2.Open;
           if IBQuery2.RecordCount > 0 then
              Inicial := IBQuery2.FieldByName('SALDOAHORROS').AsCurrency
           else
              Inicial := 0;

           IBQuery2.Close;
           IBQuery2.SQL.Clear;
           IBQuery2.SQL.Add('select * from P_CAP_0010 (:AG,:ID,:CTA,:DG,:FECHA1,:FECHA2)');
           IBQuery2.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
           IBQuery2.ParamByName('ID').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
           IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
           IBQuery2.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
           IBQuery2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
           IBQuery2.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
           IBQuery2.Open;
           if IBQuery2.RecordCount > 0 then
              Movimiento := IBQuery2.FieldByName('MOVIMIENTO').AsCurrency
           else
              Movimiento := 0;

           SaldoCuentaApo := Inicial + Movimiento;
           if SaldoCuentaApo < SaldoMinimoApo then
            begin
                 DifMin := SaldoMinimoApo - SaldoCuentaApo;
                 IBQuery2.Close;
                 IBQuery2.SQL.Clear;
                 IBQuery2.SQL.Add('select * from P_CAP_0012 (:AG,:ID,:CTA,:DG,:ANO)');
                 IBQuery2.ParamByName('AG').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                 IBQuery2.ParamByName('ID').AsInteger := 2;
                 IBQuery2.ParamByName('CTA').AsInteger := IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger;
                 IBQuery2.ParamByName('DG').AsInteger := StrToInt(digitocontrol(2,Format('%.7d',[IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger])));
                 IBQuery2.ParamByName('ANO').AsString := IntToStr(yearof(Date));
                 IBQuery2.Open;
                 if IBQuery2.RecordCount > 0 then
                    Inicial := IBQuery2.FieldByName('SALDOAHORROS').AsCurrency
                 else
                    Inicial := 0;

                 IBQuery2.Close;
                 IBQuery2.SQL.Clear;
                 IBQuery2.SQL.Add('select * from P_CAP_0010 (:AG,:ID,:CTA,:DG,:FECHA1,:FECHA2)');
                 IBQuery2.ParamByName('AG').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                 IBQuery2.ParamByName('ID').AsInteger := 2;
                 IBQuery2.ParamByName('CTA').AsInteger := IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger;
                 IBQuery2.ParamByName('DG').AsInteger := StrToInt(digitocontrol(2,Format('%.7d',[IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger])));
                 IBQuery2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
                 IBQuery2.ParamByName('FECHA2').AsDate:= EncodeDate(YearOf(Date),12,31);
                 IBQuery2.Open;
                 if IBQuery2.RecordCount > 0 then
                    Movimiento := IBQuery2.FieldByName('MOVIMIENTO').AsCurrency
                 else
                    Movimiento := 0;

                 SaldoCuentaAho := Inicial + Movimiento;
                 SaldoCuentaAho := SaldoCuentaAho - SaldoMinimoAho;
                 if SaldoCuentaAho >= DifMin then
                  begin
                   CDSTabla.Insert;
                   CDSTablaID_AGENCIA.Value := FieldByName('ID_AGENCIA').AsInteger;
                   CDSTablaID_TIPO_CAPTACION.Value := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                   CDSTablaNUMERO_CUENTA.Value := FieldByName('NUMERO_CUENTA').AsInteger;
                   CDSTablaDIGITO_CUENTA.Value := FieldByName('DIGITO_CUENTA').AsInteger;
                   CDSTablaID_IDENTIFICACION.Value := FieldByName('ID_IDENTIFICACION').AsInteger;
                   CDSTablaID_PERSONA.Value := FieldByName('ID_PERSONA').AsString;
                   CDSTablaNOMBRE.Value := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                           FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                           FieldByName('NOMBRE').AsString;
                   CDSTablaVALOR_ABONADO.Value := DifMin;
                   CDSTabla.Post;
                   {
                   IBQuery2.Close;
                   IBQuery2.SQL.Clear;
                   IBQuery2.SQL.Add('insert into ' + Tabla + ' Values(');
                   IBQuery2.SQL.Add(':AG,:TP,:CTA,:DG,:ID,:PR,:NOM,:VAL)');
                   IBQuery2.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                   IBQuery2.ParamByName('TP').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                   IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                   IBQuery2.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                   IBQuery2.ParamByName('ID').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                   IBQuery2.ParamByName('PR').AsString := FieldByName('ID_PERSONA').AsString;
                   IBQuery2.ParamByName('NOM').AsString := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                           FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                           FieldByName('NOMBRE').AsString;
                   IBQuery2.ParamByName('VAL').AsCurrency := DifMin;
                   IBQuery2.ExecSQL;
                   IBQuery2.Transaction.CommitRetaining;
                   }
                  end;
            end;
           Next; // Incrementar
         end;
         frmProgreso.Cerrar;
        end;

        if CDSTabla.RecordCount > 0 then begin
             CmdReporte.Enabled := True;
             case RGProcesar.ItemIndex of
             0: begin
                CmdAplicar.Enabled := False;
                CmdComprobante.Enabled := False;
                end;
             1: begin
                CmdAplicar.Enabled := True;
                end;
             end;
        end
        else
        begin
             MessageDlg('No Hay Valores a Barrer',mtInformation,[mbok],0);
             IBQuery2.Transaction.Commit;
        end

        {
        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select count(*) as CONTEO from ' + Tabla);
          Open;
          if FieldByName('CONTEO').AsInteger > 0 then begin
             CmdReporte.Enabled := True;
             case RGProcesar.ItemIndex of
             0: begin
                CmdAplicar.Enabled := False;
                CmdComprobante.Enabled := False;
                end;
             1: begin
                CmdAplicar.Enabled := True;
                end;
             end;
          end
          else
          begin
           MessageDlg('No Hay Valores a Barrer',mtInformation,[mbok],0);
           Transaction.Commit;
          end;
        end;
        }
end;

procedure TfrmBarridoAhoApo.CmdReporteClick(Sender: TObject);
begin
        CDSTabla.First;
        {
        with IBQuery3 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from '+tabla);
        end;
        }
        Reporte.Variables.ByName['Empresa'].AsString := Empresa;
        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);
end;

procedure TfrmBarridoAhoApo.CmdAplicarClick(Sender: TObject);
var frmprogreso:TfrmProgreso;
    Total:Integer;
    CodigoAportes:string;
    CodigoAhorros:string;
    Valor:Currency;
    GMF:Currency;
begin
// Busco Consecutivo Comprobante
         Comprobante := ObtenerConsecutivo(IBSQL1,1);
// Fin Consecutivo Comprobante

// Grabar Comprobante
       Valor := CDSTablaTOTAL_ABONADO.AsCurrency;
       GMF := Simpleroundto((Valor / 1000) * 4,0);
       {
       with IBQuery1 do begin
        Close;
        SQL.Clear;
        SQL.Add('select sum(VALOR_ABONADO) AS SUMA from' + Tabla);
        try
         Open;
         Valor := FieldByName('SUMA').AsCurrency;
         GMF := Simpleroundto((Valor / 1000) * 4,0);
        except
         Transaction.Rollback;
         raise;
         Exit;
        end;
       end;
       }
       with IBQuery1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION  = :ID');
         ParamByName('ID').AsInteger := 1;
         try
          Open;
          CodigoAportes := FieldByName('CODIGO_CONTABLE').AsString;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
       end;

       with IBQuery1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion" where ID_TIPO_CAPTACION  = :ID');
         ParamByName('ID').AsInteger := 2;
         try
          Open;
          CodigoAhorros := FieldByName('CODIGO_CONTABLE').AsString;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
       end;

       with IBQuery1 do begin
         Close;
         SQL.Clear;
         SQL.Add('insert into CON$COMPROBANTE values (');
         SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,:FECHADIA,');
         SQL.Add(':DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,:ESTADO,:IMPRESO,');
         SQL.Add(':ANULACION,:ID_EMPLEADO)');
         ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
         ParamByName('FECHADIA').AsDate := Date;
         ParamByName('DESCRIPCION').AsString := 'BARRIDO DE AHORRO PARA APORTES';
         ParamByName('TOTAL_DEBITO').AsCurrency := Valor+GMF;
         ParamByName('TOTAL_CREDITO').AsCurrency := Valor+GMF;
         ParamByName('ESTADO').AsString := 'O';
         ParamByName('IMPRESO').AsInteger := BooleanoToInt(True);
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         try
          ExecSQL;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
       end;

       with IBQuery1 do begin
         Close;
         SQL.Clear;
         SQL.Add('insert into CON$AUXILIAR values (');
         SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,:FECHA,:CODIGO,:DEBITO,:CREDITO,');
         SQL.Add(':ID_CUENTA,:ID_COLOCACION,:ID_IDENTIFICACION,:ID_PERSONA,');
         SQL.Add(':MONTO_RETENCION,:TASA_RETENCION,:ESTADOAUX, :TIPO_COMPROBANTE)');
         ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('FECHA').AsDate := Date;
         ParamByName('CODIGO').AsString := CodigoAhorros;
         ParamByName('DEBITO').AsCurrency := Valor;
         ParamByName('CREDITO').AsCurrency := 0;
         ParamByName('ID_CUENTA').Clear;
         ParamByName('ID_COLOCACION').Clear;
         ParamByName('ID_IDENTIFICACION').AsInteger := 0;
         ParamByName('ID_PERSONA').Clear;
         ParamByName('MONTO_RETENCION').AsCurrency := 0;
         ParamByName('TASA_RETENCION').Clear;
         ParamByName('ESTADOAUX').AsString := 'O';
         ParamByName('TIPO_COMPROBANTE').AsString := '1';
         try
          ExecSQL;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;

         Close;
         ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('FECHA').AsDate := Date;
         ParamByName('CODIGO').AsString := CodigoAportes;
         ParamByName('DEBITO').AsCurrency := 0;
         ParamByName('CREDITO').AsCurrency := Valor;
         ParamByName('ID_CUENTA').Clear;
         ParamByName('ID_COLOCACION').Clear;
         ParamByName('ID_IDENTIFICACION').AsInteger := 0;
         ParamByName('ID_PERSONA').Clear;
         ParamByName('MONTO_RETENCION').AsCurrency := 0;
         ParamByName('TASA_RETENCION').Clear;
         ParamByName('ESTADOAUX').AsString := 'O';
         ParamByName('TIPO_COMPROBANTE').AsString := '1';
         try
          ExecSQL;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;

         Close;
         ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('FECHA').AsDate := Date;
         ParamByName('CODIGO').AsString := '243005000000000000';
         ParamByName('DEBITO').AsCurrency := 0;
         ParamByName('CREDITO').AsCurrency := GMF;
         ParamByName('ID_CUENTA').Clear;
         ParamByName('ID_COLOCACION').Clear;
         ParamByName('ID_IDENTIFICACION').AsInteger := 0;
         ParamByName('ID_PERSONA').Clear;
         ParamByName('MONTO_RETENCION').AsCurrency := 0;
         ParamByName('TASA_RETENCION').Clear;
         ParamByName('ESTADOAUX').AsString := 'O';
         ParamByName('TIPO_COMPROBANTE').AsString := '1';
         try
          ExecSQL;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;

         Close;
         ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('FECHA').AsDate := Date;
         ParamByName('CODIGO').AsString := '523050000000000000';
         ParamByName('DEBITO').AsCurrency := GMF;
         ParamByName('CREDITO').AsCurrency := 0;
         ParamByName('ID_CUENTA').Clear;
         ParamByName('ID_COLOCACION').Clear;
         ParamByName('ID_IDENTIFICACION').AsInteger := 0;
         ParamByName('ID_PERSONA').Clear;
         ParamByName('MONTO_RETENCION').AsCurrency := 0;
         ParamByName('TASA_RETENCION').Clear;
         ParamByName('ESTADOAUX').AsString := 'O';
         ParamByName('TIPO_COMPROBANTE').AsString := '1';
         try
          ExecSQL;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
        end;
// Fin Comprobante

       CDSTabla.Last;
       CDSTabla.First;
       Total := CDSTabla.RecordCount;
       {
       with IBQuery1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select count(*) as CONTEO from ' + Tabla);
         try
           Open;
           Total := FieldByName('CONTEO').AsInteger;
         except
           raise;
           Exit;
         end;
       end;

       with IBQuery1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from ' + Tabla);
         try
           Open;
         except
           raise;
           Exit;
         end;
         }
         frmprogreso := TfrmProgreso.Create(Self);
         frmprogreso.Min := 0;
         frmprogreso.Max := Total;
         frmprogreso.Position := 0;
         frmprogreso.Ejecutar;

         IBQuery2.SQL.Clear;
         IBQuery2.SQL.Add('insert into "cap$extracto" values(');
         IBQuery2.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
         IBQuery2.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
         IBQuery2.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
         IBQuery2.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');

        with CDSTabla do begin
         while not Eof do begin
             frmprogreso.Position := RecNo;
             frmprogreso.InfoLabel := 'Abonando a Cuenta:'+FieldByName('ID_TIPO_CAPTACION').AsString + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' + FieldByName('DIGITO_CUENTA').AsString;
             Application.ProcessMessages;

              IBQuery2.Close;
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              IBQuery2.ParamByName('FECHA_MOVIMIENTO').AsDate := Date;
              IBQuery2.ParamByName('HORA_MOVIMIENTO').AsTime := Time;
              IBQuery2.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
              IBQuery2.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
              IBQuery2.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Actualización Aportes Sociales';
              IBQuery2.ParamByName('VALOR_DEBITO').AsCurrency := FieldByName('VALOR_ABONADO').AsCurrency;
              IBQuery2.ParamByName('VALOR_CREDITO').AsCurrency := 0;
              try
                IBQuery2.ExecSQL;
              except
                frmprogreso.Cerrar;
                IBQuery2.Transaction.Rollback;
                raise;
                Exit;
              end;

              IBQuery2.Close;
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
              IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(digitocontrol(2,Format('%.7d',[IBQuery1.FieldByName('NUMERO_CUENTA').AsInteger])));
              IBQuery2.ParamByName('FECHA_MOVIMIENTO').AsDate := Date;
              IBQuery2.ParamByName('HORA_MOVIMIENTO').AsTime := Time;
              IBQuery2.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
              IBQuery2.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
              IBQuery2.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Actualización Aportes Sociales';
              IBQuery2.ParamByName('VALOR_DEBITO').AsCurrency := 0;
              IBQuery2.ParamByName('VALOR_CREDITO').AsCurrency := FieldByName('VALOR_ABONADO').AsCurrency;
              try
                IBQuery2.ExecSQL;
              except
                frmprogreso.Cerrar;
                IBQuery2.Transaction.Rollback;
                raise;
                Exit;
              end;
             Next;
         end;
         try
           IBQuery2.Transaction.Commit;
         finally
           frmprogreso.Cerrar;
         end;
       end;
       CmdComprobante.Enabled := True;
end;

procedure TfrmBarridoAhoApo.CmdComprobanteClick(Sender: TObject);
begin
        with IBAuxiliar do begin
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         IBAuxiliar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
         IBAuxiliar.ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;

         ReporteC.Variables.ByName['Empresa'].AsString := Empresa;
         ReporteC.Variables.ByName['Nit'].AsString := Nit;

         if ReporteC.PrepareReport then
            ReporteC.PreviewPreparedReport(True);
         Transaction.Commit;
        end;
end;

procedure TfrmBarridoAhoApo.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBAuxiliar.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBQuery3.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;

        IBAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBQuery3.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := IBTransaction1;

end;

end.
