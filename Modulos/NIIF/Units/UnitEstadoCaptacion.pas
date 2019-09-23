unit UnitEstadoCaptacion;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, DBCtrls, DB, IBCustomDataSet, IBQuery,
  ExtCtrls, Buttons, IBSQL, unitDmGeneral;

type
  TfrmEstadoCaptacion = class(TForm)
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    EdNumeroCap: TJvEdit;
    EdDigitoCap: TStaticText;
    EdNombreCap: TStaticText;
    Label1: TLabel;
    EdEstadoCap: TStaticText;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    DBLCBTiposEstado: TDBLookupComboBox;
    IBEstadoCap: TIBQuery;
    DSEstadoCap: TDataSource;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    CmdActualizar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBTiposCaptacion: TIBQuery;
    DSTiposCaptacion: TDataSource;
    IBSQL1: TIBSQL;
    CmdOtra: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCapEnter(Sender: TObject);
    procedure EdNumeroCapExit(Sender: TObject);
    procedure EdNumeroCapKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdActualizarClick(Sender: TObject);
    procedure CmdOtraClick(Sender: TObject);
    procedure DBLCBTiposEstadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstadoCaptacion: TfrmEstadoCaptacion;
  dmGeneral: TdmGeneral;
  EstadoActual:Integer;
  SaldoActual:Currency;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmEstadoCaptacion.FormShow(Sender: TObject);
begin
        with IBTiposCaptacion do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Open;
         Last;
        end;
        DBLCBTipoCaptacion.KeyValue := 1;

end;

procedure TfrmEstadoCaptacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmEstadoCaptacion.EdNumeroCapEnter(Sender: TObject);
begin
        EdNumeroCap.SelectAll;
end;

procedure TfrmEstadoCaptacion.EdNumeroCapExit(Sender: TObject);
begin
        if EdNumeroCap.Text = '' then
        begin
           MessageDlg('Sin un Número de Captación no puede seguir',mtError,[mbcancel],0);
           Exit;
        end;

        if DBLCBTipoCaptacion.KeyValue < 1 then
        begin
           MessageDlg('Sin un Tipo de Captación, no puede seguir',mtError,[mbcancel],0);
           Exit;
        end;

        EdNumeroCap.Text := Format('%.7d',[StrToInt(EdNumeroCap.Text)]);
        EdDigitoCap.Caption := DigitoControl(DBLCBTipoCaptacion.KeyValue,EdNumeroCap.Text);

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select "cap$maestro".ID_ESTADO, "cap$tiposestado".DESCRIPCION, "cap$tiposestado".PERMITE_CAMBIAR, "gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "cap$maestro"');
          SQL.Add('LEFT JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ');
          SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
          SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
          sql.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
          SQL.Add('where "cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
          SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
          try
            ExecQuery;
            if RecordCount < 1 then
              begin
               MessageDlg('Cuenta no Existe!',mtError,[mbcancel],0);
               Exit;
              end;
          except
            MessageDlg('Error Grave al buscar Captación',mtError,[mbcancel],0);
            Transaction.Rollback;
            Close;
          end;
        end;

        EdNombreCap.Caption := IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                               IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                               IBSQL1.FieldByName('NOMBRE').AsString;

        EdEstadoCap.Caption := IBSQL1.FieldByName('DESCRIPCION').AsString;
        EstadoActual := IBSQL1.FieldByName('ID_ESTADO').AsInteger;
        if IBSQL1.FieldByName('PERMITE_CAMBIAR').AsInteger = 0 then begin
          Panel1.Enabled := True;
          IBEstadoCap.Open;
          DBLCBTiposEstado.KeyValue := EstadoActual;
          DBLCBTiposEstado.SetFocus;
          CmdActualizar.Enabled := True;
        end;
        IBSQL1.Close;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM SALDO_ACTUAL(:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
          ParamByName('AG').AsInteger := Agencia;
          ParamByName('TP').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('CTA').AsInteger := StrToInt(EdNumeroCap.Text);
          ParamByName('DG').AsInteger := StrToInt(EdDigitoCap.Caption);
          ParamByName('ANO').AsInteger := YearOf(fFechaActual);
          ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
          ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
          try
           ExecQuery;
           if RecordCount > 0 then
             SaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency
           else
             SaldoActual := 0;
          except
           raise;
          end;
        end;


end;

procedure TfrmEstadoCaptacion.EdNumeroCapKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmEstadoCaptacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmEstadoCaptacion.CmdActualizarClick(Sender: TObject);
begin
        CmdActualizar.Enabled := False;
        Application.ProcessMessages;
        if Memo1.Text = '' then
         begin
           MessageDlg('Debe especificar la observación del por qué del cambio de estado',mtInformation,[mbok],0);
           Exit;
         end;

        if DBLCBTiposEstado.KeyValue = EstadoActual then
          begin
            MessageDlg('No se realizara ningún cambio',mtError,[mbcancel],0);
            Exit;
          end;

        if MessageDlg('Seguro de Cambiar el Estado',mtConfirmation,[mbyes,mbno],0) = mrno then
           Exit;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "cap$obsestado" values (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
          SQL.Add(':FECHA,:HORA,:ID_ESTADO_ANTERIOR,:ID_ESTADO_ACTUAL,:OBSERVACION,:ID_EMPLEADO)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
          ParamByName('FECHA').AsDate := Date;
          ParamByName('HORA').AsTime := Time;
          ParamByName('ID_ESTADO_ANTERIOR').AsInteger := EstadoActual;
          ParamByName('ID_ESTADO_ACTUAL').AsInteger := DBLCBTiposEstado.KeyValue;
          ParamByName('OBSERVACION').AsString := Memo1.Text;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
            ExecQuery;
          except
            MessageDlg('Error al tratar de Actualizar',mtError,[mbcancel],0);
            Transaction.Rollback;
            Exit;
          end;

          Close;
          SQL.Clear;
          SQL.Add('update "cap$maestro" set "cap$maestro".ID_ESTADO = :ID_ESTADO');
          SQL.Add('where "cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
          SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA');
          ParamByName('ID_ESTADO').AsInteger := DBLCBTiposEstado.KeyValue;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
          try
           ExecQuery;
          except
           MessageDlg('Error al tratar de Actualizar "cap$maestro"',mtError,[mbcancel],0);
           Exit;
          end;

          Transaction.Commit;
        end;

        MessageDlg('Actualización Realizada Con Exito!',mtInformation,[mbok],0);
        CmdCerrar.Click;

end;

procedure TfrmEstadoCaptacion.CmdOtraClick(Sender: TObject);
begin
        DBLCBTipoCaptacion.KeyValue := 1;
        EdNumeroCap.Text := '';
        EdDigitoCap.Caption := '';
        EdNombreCap.Caption := '';
        EdEstadoCap.Caption := '';
        Panel1.Enabled := False;
        IBEstadoCap.Close;
end;

procedure TfrmEstadoCaptacion.DBLCBTiposEstadoClick(Sender: TObject);
begin
        if (IBEstadoCap.FieldByName('SE_SUMA').AsInteger = BooleanoToInt(False)) and
           (SaldoActual <> 0) then begin
           DBLCBTiposEstado.KeyValue := EstadoActual;
           MessageDlg('No Puede Cambiar a Este Estado'+#13+'Captación con Saldo',mtError,[mbcancel],0);
        end;

end;

procedure TfrmEstadoCaptacion.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;

        IBEstadoCap.Database := dmGeneral.IBDatabase1;
        IBTiposCaptacion.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;

        IBEstadoCap.Transaction := dmGeneral.IBTransaction1;
        IBTiposCaptacion.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmEstadoCaptacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.
