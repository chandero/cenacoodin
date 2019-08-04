unit UnitProrrogaCaptaciones;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBStoredProc, IBCustomDataSet, pr_Common, pr_TxClasses,
  IBQuery, IBSQL, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, UnitPantallaProgreso,
  DBClient;

type
  TfrmProrrogaCaptacion = class(TForm)
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label3: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    EdFecha: TDateTimePicker;
    RadioTipoProrroga: TRadioGroup;
    Panel1: TPanel;
    CmdProrrogar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    CmdAplicar: TBitBtn;
    IBTiposCaptacion: TIBQuery;
    DSTiposCaptacion: TDataSource;
    IBProrroga: TIBQuery;
    IBConsulta: TIBQuery;
    IBSQL1: TIBSQL;
    IBDias: TIBSQL;
    IBTasa: TIBSQL;
    IBSQL2: TIBSQL;
    CDStemp: TClientDataSet;
    CDStempID_AGENCIA: TIntegerField;
    CDStempID_TIPO_CAPTACION: TIntegerField;
    CDStempNUMERO_CUENTA: TIntegerField;
    CDStempDIGITO_CUENTA: TIntegerField;
    CDStempID_IDENTIFICACION: TIntegerField;
    CDStempID_PERSONA: TStringField;
    CDStempNOMBRE: TStringField;
    CDStempAMORTIZACION: TIntegerField;
    CDStempTASAE: TFloatField;
    CDStempFECHA_INI_ACT: TDateField;
    CDStempFECHA_FIN_ACT: TDateField;
    CDStempFECHA_INI_NEW: TDateField;
    CDStempFECHA_FIN_NEW: TDateField;
    CDStempVALOR_INICIAL: TCurrencyField;
    CDStempPLAZO: TIntegerField;
    CDStempMODALIDAD: TStringField;
    Reporte: TprTxReport;
    procedure FormShow(Sender: TObject);
    procedure DBLCBTipoCaptacionEnter(Sender: TObject);
    procedure RadioTipoProrrogaClick(Sender: TObject);
    procedure CmdProrrogarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    procedure Inicializar;
    { Public declarations }
  end;

var
  frmProrrogaCaptacion: TfrmProrrogaCaptacion;
  frmProgreso:TfrmProgreso;
  Tabla:string;
  Total:Integer;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobalesCol,UnitGlobales;

procedure TfrmProrrogaCaptacion.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmProrrogaCaptacion.Inicializar;
begin
         if dmGeneral.IBTransaction1.InTransaction then
            dmGeneral.IBTransaction1.Commit;
         dmGeneral.IBTransaction1.StartTransaction;
         IBTiposCaptacion.Open;
         IBTiposCaptacion.Last;
         EdFecha.Date := Date;
end;

procedure TfrmProrrogaCaptacion.DBLCBTipoCaptacionEnter(Sender: TObject);
begin
        DBLCBTipoCaptacion.DropDown;
end;

procedure TfrmProrrogaCaptacion.RadioTipoProrrogaClick(Sender: TObject);
begin
        if RadioTipoProrroga.ItemIndex > - 1 then
           CmdProrrogar.Enabled := True;
end;

procedure TfrmProrrogaCaptacion.CmdProrrogarClick(Sender: TObject);
var FechaAper:TDate;
    FechaVenc:TDate;
    FechaPro:TDate;
    FechaVencPro:TDate;
    Amortiza:Integer;
    Plazo:Integer;
    Dia:Word;
    Dif:Integer;
begin
{        with IBDias do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select * from "cap$diasprorrogados" where ');
             SQL.Add('ID_TIPO_CAPTACION = :"ID" and FECHA_PRORROGA = :"FECHA"');
             ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('FECHA').AsDate := EdFecha.Date;
             try
               ExecQuery;
             except
               frmProgreso.Cerrar;
               MessageDlg('Error Localizando Fecha',mtError,[mbcancel],0);
               Exit;
             end;
             if RecordCount > 0 then
                if FieldByName('PRORROGADO').AsInteger <> 0 then
                begin
                   MessageDlg('Captaciones de este día ya fueron prorrogadas, '+#13+
                               'Captación: ' + DBLCBTipoCaptacion.Text,mtInformation,[mbok],0);
                   Exit;
                end;
        end;
}
        DBLCBTipoCaptacion.Enabled := False;
        EdFecha.Enabled := False;
        RadioTipoProrroga.Enabled := False;
        IBConsulta.Close;
        IBConsulta.SQL.Add('SELECT * FROM P_CAP_0005 (:ID,:FECHA)');
        IBConsulta.ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
        IBConsulta.ParamByName('FECHA').AsDate := EdFecha.Date;
        try
          IBConsulta.Open;
        except
          MessageDlg('Error calculando el total de captaciones a prorrogar',mtError,[mbcancel],0);
          Exit;
        end;
        Total := IBConsulta.FieldByName('TOTAL').AsInteger;
        if Total < 1 then
        begin
          Messagedlg('No Existen Captaciones a Prorrogar',mtinformation,[mbok],0);
          ibconsulta.Transaction.Rollback;
          exit;
        end;
        frmProgreso := TfrmProgreso.Create(Self);
        frmProgreso.Titulo := 'Prorrogando Captaciones ' + DBLCBTipoCaptacion.Text + ' - Progreso';
        frmProgreso.Min := 0;
        frmProgreso.Max := 100;
        frmProgreso.Position := 0;
        frmProgreso.InfoLabel := '';
        frmProgreso.Ejecutar;
        frmProgreso.InfoLabel := 'Calculando Captaciones a Prorrogar';

        frmProgreso.Max := Total;
        frmProgreso.Position := 0;
        IBConsulta.Close;

        Application.ProcessMessages;

        CDStemp.Close;
        CDStemp.Open;
        CDStemp.EmptyDataSet;
// Fin creación tabla temporal
// Seleccionar Captaciones a Prorrogar
        IBConsulta.Close;
        IBConsulta.SQL.Clear;
        IBConsulta.SQL.Add('SELECT * FROM P_CAP_0006 (:ID,:FECHA)');
        IBConsulta.ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
        IBConsulta.ParamByName('FECHA').AsDate := EdFecha.Date;
        try
          IBConsulta.Open;
        except
          frmProgreso.Cerrar;
          MessageDlg('Error Buscando captaciones a prorrogar',mtError,[mbcancel],0);
          Exit;
        end;

        with IBConsulta do
        begin
         frmProgreso.InfoLabel := 'Procesando Prorrogas';
         Application.ProcessMessages;
         while not Eof do
         begin
              frmProgreso.Position := RecNo;
              Application.ProcessMessages;
              CDStemp.Insert;
              CDStempID_AGENCIA.Value := FieldByName('ID_AGENCIA').AsInteger;
              CDStempID_TIPO_CAPTACION.Value := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              CDStempNUMERO_CUENTA.Value := FieldByName('NUMERO_CUENTA').AsInteger;
              CDStempDIGITO_CUENTA.Value := FieldByName('DIGITO_CUENTA').AsInteger;
              CDStempID_IDENTIFICACION.Value := FieldByName('ID_IDENTIFICACION').AsInteger;
              CDStempID_PERSONA.Value := FieldByName('ID_PERSONA').AsString;
              CDStempNOMBRE.Value := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                           FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                           FieldByName('NOMBRE').AsString;
              CDStempAMORTIZACION.Value := FieldByName('AMORTIZACION').AsInteger;
              FechaAper    := FieldByName('FECHA_APERTURA').AsDateTime;
              FechaVenc    := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
              FechaPro     := FieldByName('FECHA_PRORROGA').AsDateTime;
              FechaVencPro := FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime;
              Amortiza     := FieldByName('AMORTIZACION').AsInteger;
              Plazo        := FieldByName('PLAZO_CUENTA').AsInteger;

              IBTasa.Close;
              IBTasa.ParamByName('FECHA').AsDate := fFechaActual;
              IBTasa.ParamByName('MONTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
              IBTasa.ParamByName('PLAZO').AsInteger := Plazo;
              IBTasa.ExecQuery;
              CDStempTASAE.Value := IBTasa.FieldByName('TACD_TASAE').AsFloat;
              IBTasa.Close;

              if (Amortiza mod 30) = 0 then
                 Dia := DayOf(FechaAper);
              if FechaPro > FechaAper then
                 FechaAper := FechaPro;
              if FechaVencPro > FechaVenc then
                 FechaVenc := FechaVencPro;
              CDStempFECHA_INI_ACT.Value := FechaAper;
              CDStempFECHA_FIN_ACT.Value := FechaVenc;
              FechaPro := EdFecha.Date;
              FechaVencPro := CalculoFecha(FechaPro,Plazo);
              if (Amortiza mod 30) = 0 then begin
                 Dif := Dia - DayOf(FechaPro);
                 if Dif > 0 then
                    FechaVencPro := CalculoFecha(FechaVencPro,Dif);
              end;
              CDStempFECHA_INI_NEW.Value := FechaPro;
              CDStempFECHA_FIN_NEW.Value := FechaVencPro;
              CDStempVALOR_INICIAL.Value := FieldByName('VALOR_INICIAL').AsCurrency;
              CDStempPLAZO.Value := Plazo;
              CDStempMODALIDAD.Value := FieldByName('MODALIDAD').AsString;
              CDStemp.Post;
              Next;
         end;
         frmProgreso.Cerrar;
         Transaction.CommitRetaining;
         Close;
       end;
       CmdVer.Enabled := True;
       CmdProrrogar.Enabled := False;
       if RadioTipoProrroga.ItemIndex = 1 then
          CmdAplicar.Enabled := True;
       MessageDlg('Proceso de Cálculo de Prorroga, Culminado con exito',mtInformation,[mbOk],0);
end;

procedure TfrmProrrogaCaptacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmProrrogaCaptacion.CmdVerClick(Sender: TObject);
var NameAgencia:string;
    TipoProrroga:string;
begin
        if RadioTipoProrroga.ItemIndex = 0 then
           TipoProrroga := ' DE PRUEBA'
        else
           TipoProrroga := ' DEFINITIVA';
        if not IBSQL1.Transaction.Intransaction then IBSQL1.Transaction.StartTransaction;
        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" ');
        IBSQL1.SQL.Add('where ID_AGENCIA = :"ID"');
        IBSQL1.ParamByName('ID').AsInteger := Agencia;
        try
          IBSQL1.ExecQuery;
          NameAgencia := IBSQL1.FieldByName('DESCRIPCION_AGENCIA').AsString;
        except
          NameAgencia := 'No Encontrado';
        end;
        IBSQL1.Close;

        with Reporte do
        begin
          Variables.ByName['EMPRESA'].AsString := Empresa;
          Variables.ByName['FECHACORTE'].AsDateTime := EdFecha.Date;
          Variables.ByName['AGENCIA'].AsString := NameAgencia;
          Variables.ByName['CAPTACION'].AsString := DBLCBTipoCaptacion.Text;
          Variables.ByName['NIT'].AsString := Nit;
          Variables.ByName['TIPOPRORROGA'].AsString := TipoProrroga;
          if PrepareReport then
             PreviewPreparedReport(True);
        end

end;

procedure TfrmProrrogaCaptacion.CmdAplicarClick(Sender: TObject);
var
 Dia: Word;
 Lista: TList;
 i: Integer;
 ARecord:PTablaCerLiq;
begin
        with CDSTemp do
        begin
           First;
           IBProrroga.SQL.Clear;
           IBProrroga.SQL.Add('update "cap$maestro" ');
           IBProrroga.SQL.Add('set ID_ESTADO = :ID_ESTADO, TASA_EFECTIVA = :TASA, FECHA_PRORROGA = :FECHA_PRORROGA,');
           IBProrroga.SQL.Add('FECHA_VENCIMIENTO_PRORROGA = :FECHA_VENCIMIENTO_PRORROGA');
           IBProrroga.SQL.Add('where (ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBProrroga.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA)');
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('insert into "cap$historiaprorrogas" values (');
           IBSQL1.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
           IBSQL1.SQL.Add(':FECHA_INICIAL_ANT,:FECHA_FINAL_ANT,:FECHA_INICIAL_ACT,:FECHA_FINAL_ACT)');
           frmProgreso := TfrmProgreso.Create(self);
           frmProgreso.Min := 0;
           frmProgreso.Max := Total;
           frmProgreso.InfoLabel := 'Aplicando Prorroga';
           frmProgreso.Ejecutar;
           Application.ProcessMessages;
           while not Eof do
           begin
                 frmProgreso.Position := RecNo;
                 Application.ProcessMessages;
                 IBProrroga.ParamByName('ID_ESTADO').AsInteger := 6;
                 IBProrroga.ParamByName('FECHA_PRORROGA').AsDate := FieldByName('FECHA_INI_NEW').AsDateTime;
                 IBProrroga.ParamByName('TASA').AsFloat := FieldByName('TASAE').AsFloat;
                 IBProrroga.ParamByName('FECHA_VENCIMIENTO_PRORROGA').AsDate := FieldByName('FECHA_FIN_NEW').AsDateTime;
                 IBProrroga.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                 IBProrroga.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBProrroga.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                 IBProrroga.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                 try
                   IBProrroga.ExecSQL;
                   IBProrroga.Close;
                 except
                   frmProgreso.Cerrar;
                   MessageDlg('Error actualizando tabla maestro',mtError,[mbcancel],0);
                   Exit;
                 end;
                 // Crear y guardar tabla de liquidacion
                 if (FieldByName('ID_TIPO_CAPTACION').AsInteger = 6) then
                 begin
                        Dia := DayOf(FieldByName('FECHA_INI_NEW').AsDateTime);

                        Lista := TablaCer(FieldByName('VALOR_INICIAL').AsCurrency,FieldByName('TASAE').AsFloat,
                                  FieldByName('MODALIDAD').AsString,FieldByName('FECHA_INI_NEW').AsDateTime,FieldByName('FECHA_INI_NEW').AsDateTime,
                                  FieldByName('AMORTIZACION').AsInteger,FieldByName('PLAZO').AsInteger,Dia);
                        IBSQL2.Close;
                        IBSQL2.SQL.Clear;
                        IBSQL2.SQL.Add('Insert into "cap$tablaliquidacion" values(');
                        IBSQL2.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                        IBSQL2.SQL.Add(':"FECHA_PAGO",:"VALOR",:"PAGADO")');
                        IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;;
                        IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                        IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                        IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                        for i := 0 to Lista.Count - 1 do
                        begin
                           ARecord := Lista.Items[i];
                           IBSQL2.ParamByName('FECHA_PAGO').AsDate := ARecord^.FechaPago;
                           IBSQL2.ParamByName('VALOR').AsCurrency := ARecord^.Valor;
                           IBSQL2.ParamByName('PAGADO').AsInteger := BooleanoToInt(ARecord^.Liquidado);
                           try
                              IBSQL2.ExecQuery;
                              IBSQL2.Close;
                              Dispose(ARecord);
                           except
                              raise;
                           end;
                        end;
                        Lista.Free;
                 end;
                 // Fin crear tabla liquidacion


                 IBSQL1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                 IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                 IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                 IBSQL1.ParamByName('FECHA_INICIAL_ANT').AsDate := FieldByName('FECHA_INI_ACT').AsDateTime;
                 IBSQL1.ParamByName('FECHA_FINAL_ANT').AsDate := FieldByName('FECHA_FIN_ACT').AsDateTime;
                 IBSQL1.ParamByName('FECHA_INICIAL_ACT').AsDate := FieldByName('FECHA_INI_NEW').AsDateTime;
                 IBSQL1.ParamByName('FECHA_FINAL_ACT').AsDate := FieldByName('FECHA_FIN_NEW').AsDateTime;
                 try
                   IBSQL1.ExecQuery;
                   IBSQL1.Close;
                 except
                   frmProgreso.Cerrar;
                   MessageDlg('Error actualizando tabla historica',mtError,[mbcancel],0);
                   Exit;
                 end;

                 Next;
           end;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('insert into "cap$diasprorrogados" values(');
           IBSQL1.SQL.Add(':ID_TIPO_CAPTACION,:FECHA_PRORROGA,:HORA_PRORROGA,:PRORROGADO)');
           IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
           IBSQL1.ParamByName('FECHA_PRORROGA').AsDate := EdFecha.Date;
           IBSQL1.ParamByName('HORA_PRORROGA').AsTime := Time;
           IBSQL1.ParamByName('PRORROGADO').AsInteger := 1;
           try
             IBSQL1.ExecQuery;
             IBSQL1.Close;
           except
             frmProgreso.Cerrar;
             MessageDlg('Error Marcando Dia Liquidado',mtError,[mbcancel],0);
             Exit;
           end;
           IBProrroga.Transaction.Commit;
        end;
        frmProgreso.Cerrar;
        MessageDlg('No Olvide Realizar la Recuperacion de la Tabla de Liquidacion'+#13+'Aplicación de la Prorroga Culminado con Exito!',mtInformation,[mbok],0);
        CmdAplicar.Enabled := False;
end;

procedure TfrmProrrogaCaptacion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
      if dmGeneral.IBTransaction1.InTransaction then
         dmGeneral.IBTransaction1.Commit;

      if Tabla <> '' then
      begin
        dmGeneral.IBTransaction1.StartTransaction;
        IBConsulta.Close;
        IBConsulta.SQL.Clear;
        IBConsulta.SQL.Add('drop table ' + Tabla);
        try
          IBConsulta.ExecSQL;
          IBConsulta.Close;
          IBConsulta.Transaction.Commit;
        except
        end;
      end;
      CanClose := True;
end;

end.
