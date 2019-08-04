unit UnitExencionGMF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JvEdit, DBCtrls, IBSQL, IBDatabase,
  DB, IBCustomDataSet, IBQuery, FR_Class, pr_Common, pr_Classes;

type
  TfrmExencionGMF = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    EdNumeroCap: TJvEdit;
    EdDigitoCap: TStaticText;
    EdNombreCap: TStaticText;
    btnCerrar: TBitBtn;
    btnReporte: TBitBtn;
    btnMarcar: TBitBtn;
    EdAgencia: TStaticText;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBQuery: TIBQuery;
    frReport1: TfrReport;
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure EdNumeroCapExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnReporteClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btnMarcarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExencionGMF: TfrmExencionGMF;
  Marca :Boolean;
  Asociado, TipoDocumento, Documento, Cuenta:string;


implementation

{$R *.dfm}

uses UnitdmGeneral, UnitGlobales;

procedure TfrmExencionGMF.FormCreate(Sender: TObject);
begin
        with IBQuery1 do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('  "cap$tipocaptacion".ID_TIPO_CAPTACION,');
           SQL.Add('  "cap$tipocaptacion".DESCRIPCION,');
           SQL.Add('  "cap$tiposforma".AHORRO');
           SQL.Add('FROM');
           SQL.Add(' "cap$tipocaptacion"');
           SQL.Add(' INNER JOIN "cap$tiposforma" ON ("cap$tipocaptacion".ID_FORMA="cap$tiposforma".ID_FORMA)');
           SQL.Add('WHERE "cap$tiposforma".AHORRO = 1');
           Open;
           Last;
           First;
        end;

        with IBSQL1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "gen$agencia" where ID_AGENCIA = :AGENCIA');
           ParamByName('AGENCIA').AsInteger := Agencia;
           try
            ExecQuery;
            EdAgencia.Caption := FieldByName('DESCRIPCION_AGENCIA').AsString;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

end;

procedure TfrmExencionGMF.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmExencionGMF.EdNumeroCapExit(Sender: TObject);
begin
        if EdNumeroCap.Text = '' then
        begin
           MessageDlg('Debe digitar un número de Captacion',mtInformation,[mbok],0);
           Exit;
        end;

        EdNumeroCap.Text := Format('%.7d',[StrToInt(Trim(EdNumeroCap.Text))]);

        if DBLCBTipoCaptacion.KeyValue < 1 then
        begin
          MessageDlg('Debe seleccionar un tipo de captación',mtInformation,[mbok],0);
          Exit;
        end;

        EdDigitoCap.Caption := DigitoControl(DBLCBTipoCaptacion.KeyValue,EdNumeroCap.Text);

        with IBQuery do
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('  "cap$maestro".ID_AGENCIA,');
           SQL.Add('  "cap$maestro".ID_TIPO_CAPTACION,');
           SQL.Add('  "cap$maestro".NUMERO_CUENTA,');
           SQL.Add('  "cap$maestro".DIGITO_CUENTA,');
           SQL.Add('  "cap$maestro".VALOR_INICIAL,');
           SQL.Add('  "cap$maestro".ID_FORMA,');
           SQL.Add('  "cap$maestro".FECHA_APERTURA,');
           SQL.Add('  "cap$maestro".PLAZO_CUENTA,');
           SQL.Add('  "cap$maestro".TIPO_INTERES,');
           SQL.Add('  "cap$maestro".ID_INTERES,');
           SQL.Add('  "cap$maestro".TASA_EFECTIVA,');
           SQL.Add('  "cap$maestro".PUNTOS_ADICIONALES,');
           SQL.Add('  "cap$maestro".MODALIDAD,');
           SQL.Add('  "cap$maestro".AMORTIZACION,');
           SQL.Add('  "cap$maestro".CUOTA,');
           SQL.Add('  "cap$maestro".CUOTA_CADA,');
           SQL.Add('  "cap$maestro".ID_PLAN,');
           SQL.Add('  "cap$maestro".ID_ESTADO,');
           SQL.Add('  "cap$maestro".FECHA_VENCIMIENTO,');
           SQL.Add('  "cap$maestro".FECHA_ULTIMO_PAGO,');
           SQL.Add('  "cap$maestro".FECHA_PROXIMO_PAGO,');
           SQL.Add('  "cap$maestro".FECHA_PRORROGA,');
           SQL.Add('  "cap$maestro".FECHA_VENCIMIENTO_PRORROGA,');
           SQL.Add('  "cap$maestro".FIRMAS,');
           SQL.Add('  "cap$maestro".SELLOS,');
           SQL.Add('  "cap$maestro".PROTECTOGRAFOS,');
           SQL.Add('  "cap$maestro".ID_TIPO_CAPTACION_ABONO,');
           SQL.Add('  "cap$maestro".NUMERO_CUENTA_ABONO,');
           SQL.Add('  "cap$tiposestado".DESCRIPCION,');
           SQL.Add('  "cap$tiposestado".PARA_ACTIVAR,');
           SQL.Add('  "cap$tiposestado".PARA_SALDAR,');
           SQL.Add('  "cap$tiposestado".PERMITE_MOVIMIENTO,');
           SQL.Add('  "gen$agencia".DESCRIPCION_AGENCIA,');
           SQL.Add('  "gen$persona".ID_IDENTIFICACION,');
           SQL.Add('  "gen$persona".ID_PERSONA,');
           SQL.Add('  "gen$persona".LUGAR_EXPEDICION,');
           SQL.Add('  "gen$persona".FECHA_EXPEDICION,');
           SQL.Add('  "gen$persona".SEXO,');
           SQL.Add('  "gen$persona".FECHA_NACIMIENTO,');
           SQL.Add('  "gen$persona".LUGAR_NACIMIENTO,');
           SQL.Add('  "gen$persona".NOMBRE,');
           SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
           SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('  "gen$persona".ID_IDENTIFICACION_CONYUGE,');
           SQL.Add('  "gen$persona".ID_CONYUGE,');
           SQL.Add('  "gen$persona".PRIMER_APELLIDO_CONYUGE,');
           SQL.Add('  "gen$persona".SEGUNDO_APELLIDO_CONYUGE,');
           SQL.Add('  "gen$persona".NOMBRE_CONYUGE,');
           SQL.Add('  "gen$persona".INGRESOS_CONYUGE,');
           SQL.Add('  "gen$persona".INGRESOS_CONYUGE_OTROS,');
           SQL.Add('  "gen$persona".EGRESOS_CONYUGE,');
           SQL.Add('  "gen$persona".OTROS_EGRESOS_CONYUGE,');
           SQL.Add('  "gen$persona".PROFESION,');
           SQL.Add('  "gen$persona".EMPRESA_LABORA,');
           SQL.Add('  "gen$persona".CARGO_ACTUAL,');
           SQL.Add('  "gen$persona".DECLARACION,');
           SQL.Add('  "gen$persona".INGRESOS_A_PRINCIPAL,');
           SQL.Add('  "gen$persona".INGRESOS_OTROS,');
           SQL.Add('  "gen$persona".DESC_INGR_OTROS,');
           SQL.Add('  "gen$persona".EGRESOS_ALQUILER,');
           SQL.Add('  "gen$persona".EGRESOS_ALIMENTACION,');
           SQL.Add('  "gen$persona".EGRESOS_TRANSPORTE,');
           SQL.Add('  "gen$persona".EGRESOS_SERVICIOS,');
           SQL.Add('  "gen$persona".EGRESOS_DEUDAS,');
           SQL.Add('  "gen$persona".EGRESOS_OTROS,');
           SQL.Add('  "gen$persona".TOTAL_ACTIVOS,');
           SQL.Add('  "gen$persona".TOTAL_PASIVOS,');
           SQL.Add('  "gen$tiposestadocivil".DESCRIPCION_ESTADO_CIVIL,');
           SQL.Add('  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION');
           SQL.Add('FROM');
           SQL.Add('  "cap$maestro"');
           SQL.Add('  LEFT JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
           SQL.Add(' AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
           SQL.Add(' AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA)');
           SQL.Add(' AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
           SQL.Add('  LEFT JOIN "gen$agencia" ON');
           SQL.Add('("cap$maestro".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
           SQL.Add('  LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('  LEFT JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
           SQL.Add(' LEFT JOIN "gen$tiposestadocivil" ON "gen$persona".ID_TIPO_ESTADO_CIVIL = "gen$tiposestadocivil".ID_TIPO_ESTADO_CIVIL');
           SQL.Add(' LEFT JOIN "gen$tiposidentificacion" ON');
           SQL.Add('("gen$persona".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
           SQL.Add('WHERE');
           SQL.Add('  ("cap$maestro".ID_AGENCIA = :ID_AGENCIA) AND ');
           SQL.Add('  ("cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND ');
           SQL.Add('  ("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
           SQL.Add('  ("cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA)');
           SQL.Add('ORDER BY');
           SQL.Add('  "cap$maestrotitular".NUMERO_TITULAR');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
           ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(Trim(ednumerocap.Text));
           ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(Trim(eddigitocap.Caption));
           try
             Open;
             if RecordCount < 1 then
               begin
                 MessageDlg('No Encontre registros con estos datos'+#13+
                                    'Por Favor verifique!',mtInformation,[mbok],0);
                 Exit;
               end;
           except
             MessageDlg('Error al buscar captación',mtError,[mbcancel],0);
             Exit;
           end;

           Asociado := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                  FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                  FieldByName('NOMBRE').AsString;

           TipoDocumento := FieldByName('DESCRIPCION_IDENTIFICACION').AsString;
           Documento := FieldByName('ID_PERSONA').AsString;

           EdNombreCap.Caption := Asociado;
           Cuenta := IntToStr(DBLCBTipoCaptacion.KeyValue)+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+ '-'+
                     Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' + IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);

           if FieldByName('ID_ESTADO').AsInteger = 1 then
           begin
            IBSQL1.Close;
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('select * from "cap$maestroexcentas"');
            IBSQL1.SQL.Add('where');
            IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
            IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
            IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
            try
              IBSQL1.ExecQuery;
              if IBSQL1.RecordCount > 0 then
              begin
                if IBSQL1.FieldByName('GMF').AsInteger = 1 then
                begin
                   btnMarcar.Caption := '&DesMarcar';
                   btnMarcar.Enabled := True;
                   Marca := True;
                end
                else
                 begin
                   btnMarcar.Enabled := True;
                   btnMarcar.Caption := '&Marcar';
                   Marca := False;
                 end; // del if GMF
              end
              else
              begin
                 btnMarcar.Enabled := True;
                 btnMarcar.Caption := '&Marcar';
                 Marca := False;
              end; // del if ibsql1.recordcount
            except
              IBSQL1.Transaction.Rollback;
              raise;
              Exit;
            end; // del try
           end;
        end;

end;

procedure TfrmExencionGMF.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmExencionGMF.btnReporteClick(Sender: TObject);
begin
        if Marca then
          frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\ReportesCap\SolicitudMarcacionGMF.frf')
        else
          frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\ReportesCap\SolicitudDesMarcacionGMF.frf');

        if frReport1.PrepareReport then
           frReport1.ShowPreparedReport;

end;

procedure TfrmExencionGMF.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin

        if ParName = 'CIUDAD' then
           ParValue := Ciudad;
        if ParName = 'FECHA' then
           ParValue := fFechaActual;
        if ParName = 'ASOCIADO' then
           ParValue := Asociado;
        if ParName = 'TIPO_DOCUMENTO' then
           ParValue := TipoDocumento;
        if ParName = 'DOCUMENTO' then
           ParValue := Documento;
        if ParName = 'CUENTA' then
           ParValue := Cuenta;
        if ParName = 'EMPRESA' then
           ParValue := Empresa;
        if ParName = 'FUNCIONARIO' then
           ParValue := Nombres+' '+Apellidos;
end;

procedure TfrmExencionGMF.btnMarcarClick(Sender: TObject);
begin

        if MessageDlg('Seguro de Realizar Esta Operación?',mtConfirmation,[mbYes,mbNo],0) <> mrYes
         then Exit;


        Marca := not Marca;

        if Marca then
        begin
           // Verificar si existe
            IBSQL1.Close;
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('select count(*) as total from "cap$maestroexcentas"');
            IBSQL1.SQL.Add('where');
            IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
            IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
            IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
            try
              IBSQL1.ExecQuery;
              if IBSQL1.FieldByName('total').AsInteger > 0 then
              begin
                  IBSQL1.Close;
                  IBSQL1.SQL.Clear;
                  IBSQL1.SQL.Add('update "cap$maestroexcentas" SET GMF = 1');
                  IBSQL1.SQL.Add('where');
                  IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA');
                  IBSQL1.SQL.Add('and');
                  IBSQL1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
                  IBSQL1.SQL.Add('and');
                  IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA');
                  IBSQL1.SQL.Add('and');
                  IBSQL1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
                  IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
                  IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                  IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                  try
                   IBSQL1.ExecQuery;
                  except
                   IBSQL1.Transaction.Rollback;
                   raise;
                   Exit;
                  end;
              end // de hacer update sobre maestroexcentas
              else
              begin
                   IBSQL1.Close;
                   IBSQL1.SQL.Clear;
                   IBSQL1.SQL.Add('insert into "cap$maestroexcentas" (ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,GMF) values (');
                   IBSQL1.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:GMF)');
                   IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
                   IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                   IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                   IBSQL1.ParamByName('GMF').AsInteger := 1;
                   try
                    IBSQL1.ExecQuery;
                   except
                    IBSQL1.Transaction.Rollback;
                    raise;
                    Exit;
                   end;
              end;
            except
             IBSQL1.Transaction.Rollback;
             raise;
             Exit;
            end;
        end
        else
        begin
            IBSQL1.Close;
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('update "cap$maestroexcentas" SET GMF = 0');
            IBSQL1.SQL.Add('where');
            IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA');
            IBSQL1.SQL.Add('and');
            IBSQL1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
            IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
            IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
            IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
            IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
            try
             IBSQL1.ExecQuery;
            except
             IBSQL1.Transaction.Rollback;
             raise;
             Exit;
            end;
        end;

        IBSQL1.Transaction.Commit;

        btnMarcar.Enabled := False;
        btnReporte.Enabled := True;
end;

end.
