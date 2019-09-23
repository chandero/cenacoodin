unit UnitImprimirSeguro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FR_Class, StdCtrls, Buttons, IBSQL, DB, IBCustomDataSet, IBQuery,
  JvEdit,DateUtils, JvLabel, ExtCtrls, JvStaticText, DBClient, FR_DSet,
  FR_DBSet;
 type
  Seguro = record
    Existe:Boolean;
    FechaS:TDate;
  end;

type
  TFrmImprimirSeguro = class(TForm)
    frReport1: TfrReport;
    GrPrincipal: TGroupBox;
    BitBuscar: TBitBtn;
    IBSQL2: TIBSQL;
    IBQuery1: TIBQuery;
    JvNumeroCuenta: TJvEdit;
    IBSQL1: TIBSQL;
    IBSQL4: TIBSQL;
    IBSQL6: TIBSQL;
    IBSQL3: TIBSQL;
    JvLabel1: TJvLabel;
    Panel1: TPanel;
    BtSeguro: TBitBtn;
    BtCerrar: TBitBtn;
    Label1: TLabel;
    JvAhorrador: TJvStaticText;
    BtCancelar: TBitBtn;
    Condiciones: TGroupBox;
    ChJuvenil: TCheckBox;
    ChAportes: TCheckBox;
    ChCreditos: TCheckBox;
    ChRindediario: TCheckBox;
    BitReporte: TBitBtn;
    GroupBox2: TGroupBox;
    IBSQL5: TIBSQL;
    EdPersona: TMemo;
    IBSQL7: TIBSQL;
    CdDataset: TClientDataSet;
    CdDatasetPOLIZA: TStringField;
    CdDatasetFECHA1: TDateField;
    CdDatasetFECHA2: TDateField;
    CdDatasetASEGURADO: TStringField;
    frDBDataSet1: TfrDBDataSet;
    procedure BitBuscarClick(Sender: TObject);
    procedure BtCerrarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure JvNumeroCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure BtSeguroClick(Sender: TObject);
    procedure EdPersonaKeyPress(Sender: TObject; var Key: Char);
    procedure BitReporteClick(Sender: TObject);
  private
    TipoJ :Integer;
    NumeroJ:string;
    NombreJ:string;
    vSaldoAhorros :Currency;
    vSaldoAportes :Currency;
    _iEstadoJuvenil :Smallint;
    _iTipoJuvenil :Smallint;
    Ag,Tipo,Cuenta,Digito,vEdad:Integer;
    PrimaM,ValorAseg :Currency;
    _iPoliza :Integer;
    _iCodSeguro :Integer;
    _dFechaSeguro :TDate;
    _sPoliza :string;
    function edad(ag, tipo, cuenta, digito: integer): integer;
    { Private declarations }
  public
  published
    procedure buscar(vagencia, vcuenta, vdigito: Integer);
    procedure DatosJuvenil(Ag, TipoC, Cuenta, Digito: Integer);
    procedure vSaldo(vIdPersona: string; vIdentificacion: integer);
    function Saldo(Ag, Tipo, Cuenta, Digito: integer): currency;
    procedure Seguro;
    { Public declarations }
  end;

var
  FrmImprimirSeguro: TFrmImprimirSeguro;

implementation

uses UnitdmColocacion,UnitGlobales,UnitGlobalesCol, unitMain;

{$R *.dfm}

procedure TFrmImprimirSeguro.BitBuscarClick(Sender: TObject);
var      xdeudas :Boolean;
         vActivo:Boolean;
         vMinAportes,vMinJuvenil,vMinAhorros :Currency;
         FechaV:TDate;
         vSaldoJuvenil :Currency;
         _sIdPersona :string;
         _iIdIdentificacion :Integer;
begin
        with IBSQL2 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select max(ID_POLIZA) AS ID_POLIZA from "cap$polizajuvenil"');
          ExecQuery;
          _iPoliza := FieldByName('ID_POLIZA').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add(' SALDO_MINIMO');
          SQL.Add('FROM');
          SQL.Add(' "cap$tipocaptacion"');
          SQL.Add('WHERE');
          SQL.Add(' ID_TIPO_CAPTACION = :ID');
          ParamByName('ID').AsInteger := 1;
          try
           ExecQuery;
           vMinAportes := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
          raise;
          end;
          Close;
          ParamByName('ID').AsInteger := 2;
          try
            ExecQuery;
            vMinAhorros := FieldByName('SALDO_MINIMO').AsCurrency;
          except
            Transaction.Rollback;
          raise;
          end;
          // Ahorro Juvenil
          Close;
          ParamByName('ID').AsInteger := 4;
          try
            ExecQuery;
            vMinJuvenil := FieldByName('SALDO_MINIMO').AsCurrency;
          except
            Transaction.Rollback;
          raise;
          end;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('VALOR_MINIMO');
          SQL.Add('FROM');
          SQL.Add(' "gen$minimos"');
          SQL.Add('WHERE');
          SQL.Add(' ID_MINIMO = :ID');
          ParamByName('ID').AsInteger := 40;
          try
            ExecQuery;
            PrimaM := FieldByName('VALOR_MINIMO').AsCurrency;
            Close;
            ParamByName('ID').AsInteger := 41;
            ExecQuery;
            ValorAseg := FieldByName('VALOR_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
          raise;
          end;
      end; // fin del with IBSQL2
      dmColocacion := TdmColocacion.Create(Self);
      with IBQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA, "cap$maestro".DIGITO_CUENTA,');
        SQL.Add('"gen$persona".ID_PERSONA,"gen$persona".ID_IDENTIFICACION,');
        SQL.Add('"cap$maestro".FECHA_APERTURA,');
        SQL.Add('"cap$maestro".ID_ESTADO');
        SQL.Add(' FROM');
        SQL.Add('"cap$maestro"');
        SQL.Add('INNER JOIN "cap$maestrotitular" on (("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
        SQL.Add('AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
        SQL.Add('AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA))');
        SQL.Add('INNER JOIN "gen$persona" on (("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA))');
        SQL.Add('WHERE');
        SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA');
        SQL.Add('and "cap$maestro".FECHA_APERTURA <= :FECHACORTE and "cap$maestrotitular".NUMERO_TITULAR = 1 and "cap$maestro".ID_ESTADO = 1');
        SQL.Add('ORDER BY');
        SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA');
        ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;//para el caso de los juveniles
        ParamByName('ID_AGENCIA').AsInteger := Agencia;
        ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(JvNumeroCuenta.Text);
        ParamByName('FECHACORTE').AsDate := fFechaActual;
        Open;
        Ag     := FieldByName('ID_AGENCIA').AsInteger;
        Tipo   := FieldByName('ID_TIPO_CAPTACION').AsInteger;
        Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
        Digito := FieldByName('DIGITO_CUENTA').AsInteger;
        _sIdPersona := FieldByName('ID_PERSONA').AsString;
        _iIdIdentificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
        vSaldoAportes := 0;
        vSaldoAhorros := 0;
        vSaldoJuvenil := 0;
        xdeudas := True;
        vActivo := False;

        ChCreditos.Checked := True;
        ChJuvenil.Checked := True;
        ChRindediario.Checked := True;
        ChAportes.Checked := True;
        DatosJuvenil(Ag,4,Cuenta,Digito);
        JvAhorrador.Caption :=NombreJ;

        vEdad := EDAD(Ag,Tipo,Cuenta,Digito);
        Buscar(Ag,Cuenta,Digito);//busca el estado del seguro Juvenil y el tipo de Inserción (renovacion o primera vez)
        if _iEstadoJuvenil = 0 then
        begin
          if (vEdad <= 14) then
          begin
             vSaldo(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger);
             vSaldoJuvenil := SALDO(Ag,Tipo,Cuenta,Digito);
             IBSQL2.Close;
             IBSQL2.SQL.Clear;
             IBSQL2.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
             IBSQL2.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
             IBSQL2.SQL.Add('and ID_ESTADO_COLOCACION < 3');
             IBSQL2.ParamByName('ID_IDENTIFICACION').AsInteger := _iIdIdentificacion;
             IBSQL2.ParamByName('ID_PERSONA').AsString := _sIdPersona;
             IBSQL2.ExecQuery;
             if IBSQL2.RecordCount > 0 then
             begin
                while not IBSQL2.Eof do
                begin
                   if ObtenerDeudaHoy1(IBSQL2.FieldByName('ID_AGENCIA').AsInteger,IBSQL2.FieldByName('ID_COLOCACION').AsString,IBSQL1).Dias > 0 then
                   begin
                     xDeudas := False;
                     Break;
                   end; // fin del obtener deuda
                   IBSQL2.Next;
                end; //fin del while
             end;// fin deñ if del IBSQL2
             ChCreditos.Checked := xdeudas;
             if (vSaldoJuvenil < vMinJuvenil) then
                ChJuvenil.Checked := False;
             if (vSaldoAhorros < vMinAhorros) then
                ChRindediario.Checked := False;
             if (vSaldoAportes < vMinAportes) then
                ChAportes.Checked := False;
             if (xdeudas) and (vSaldoJuvenil >= vMinJuvenil) and (vSaldoAhorros >= vMinAhorros) and (vSaldoAportes >= vMinAportes) then
             begin
                BtSeguro.Enabled := True;
                EdPersona.SetFocus;
                GrPrincipal.Enabled := False;
             end
             else
             begin
               BtSeguro.Enabled := False;
               ShowMessage('No se puede Entregar el Seguro, Favor revise');
             end;
              // Fin  Validacion de saldos y deudas
          end;// fin del validad edad
        end // fin del buscar
        else
        begin
          BtSeguro.Enabled := False;
          if MessageDlg('El seguro ya se encuentra registrado. Lo desea recuperar.?',mtInformation,[mbYes,mbNo],0) = mrno then
             Exit;
          BtSeguro.Enabled := True;
          EdPersona.SetFocus;
          GrPrincipal.Enabled := False;         
        end;
      end;// fin del IBQury1
end;

procedure TFrmImprimirSeguro.buscar(vagencia, vcuenta,vdigito: integer);
var   _dFechaVencimiento :TDate;
begin
      _iEstadoJuvenil := 1;
      with IBSQL2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT MAX(FECHA_SEGURO) AS FECHA_SEGURO');
        SQL.Add('FROM');
        SQL.Add('"cap$segurojuvenil"');
        SQL.Add('WHERE');
        SQL.Add('("cap$segurojuvenil".ID_AGENCIA = :ID_AGENCIA) AND ');
        SQL.Add('("cap$segurojuvenil".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
        SQL.Add('("cap$segurojuvenil".DIGITO_CUENTA = :DIGITO)');
        ParamByName('ID_AGENCIA').AsInteger := vagencia;
        ParamByName('NUMERO_CUENTA').AsInteger := vcuenta;
        ParamByName('DIGITO').AsInteger := vdigito;
        ExecQuery;
        _dFechaSeguro := FieldByName('FECHA_SEGURO').AsDate;
        if FieldByName('FECHA_SEGURO').AsDate > 0 then
        begin
          _dFechaVencimiento := IncYear(_dFechaSeguro,1);
          if _dFechaVencimiento <= fFechaActual then
          begin
            _iTipoJuvenil := 1;
            _iEstadoJuvenil := 0;
          end;
        end
        else
        begin
          _iEstadoJuvenil := 0; // Se encuentra para Renovación o Inserción
          _iTipoJuvenil := 0; //Ingreso
          _dFechaSeguro := fFechaActual;
        end;
        if _iEstadoJuvenil = 1 then
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT CODIGO,ID_POLIZA');
            SQL.Add('FROM');
            SQL.Add('"cap$segurojuvenil"');
            SQL.Add('WHERE');
            SQL.Add('("cap$segurojuvenil".ID_AGENCIA = :ID_AGENCIA) AND ');
            SQL.Add('("cap$segurojuvenil".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
            SQL.Add('("cap$segurojuvenil".DIGITO_CUENTA = :DIGITO) AND');
            SQL.Add('("cap$segurojuvenil".FECHA_SEGURO = :FECHA)');
            ParamByName('ID_AGENCIA').AsInteger := vagencia;
            ParamByName('NUMERO_CUENTA').AsInteger := vcuenta;
            ParamByName('DIGITO').AsInteger := vdigito;
            ParamByName('FECHA').AsDate := _dFechaSeguro;
            ExecQuery;
            _iCodSeguro := FieldByName('CODIGO').AsInteger;
            _iPoliza := FieldByName('ID_POLIZA').AsInteger;
        end;
     end;
end;

procedure TFrmImprimirSeguro.DatosJuvenil(Ag, TipoC, Cuenta,
  Digito: Integer);
begin
        IBSQL6.Close;
        IBSQL6.ParamByName('ID_AGENCIA').AsInteger := Ag;
        IBSQL6.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoC;
        IBSQL6.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
        IBSQL6.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
        IBSQL6.ExecQuery;
        if IBSQL6.RecordCount > 0 then begin
          TipoJ := IBSQL6.FieldByName('ID_IDENTIFICACION').AsInteger;
          NumeroJ := IBSQL6.FieldByName('ID_PERSONA').AsString;
          NombreJ := IBSQL6.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBSQL6.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + IBSQL6.FieldByName('NOMBRE').AsString;
        end;

end;

function TFrmImprimirSeguro.edad(ag, tipo, cuenta,
  digito: integer): integer;
var vFecha :TDate;
begin
        with IBSQL3 do
        begin
         Close;
         SQL.Clear;
         SQL.Add('select "gen$persona".FECHA_NACIMIENTO from "cap$maestrotitular"');
         SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
         SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
         SQL.Add('where');
         SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
         SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
         SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
         SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2');
         ParamByName('ID_AGENCIA').AsInteger := Ag;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
         ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
         ParamByName('DIGITO_CUENTA').AsInteger := Digito;
         ExecQuery;
         vFecha := FieldByName('FECHA_NACIMIENTO').AsDate;
         Result := YearsBetween(vFecha,fFechaActual);
        end;
end;

function TFrmImprimirSeguro.Saldo(Ag, Tipo, Cuenta,
  Digito: integer): currency;
begin
        with IBSQL3 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
            ParamByName('AG').AsInteger := Ag;
            ParamByName('TP').AsInteger := Tipo;
            ParamByName('CTA').AsInteger := Cuenta;
            ParamByName('DGT').AsInteger := Digito;
            ParamByName('ANO').AsInteger := YearOf(fFechaActual);
            ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
            ParamByName('FECHA2').AsDate := fFechaActual;
            ExecQuery;
            Result := FieldByName('SALDO_ACTUAL').AsCurrency;
        end;

end;

procedure TFrmImprimirSeguro.vSaldo(vIdPersona: string;
  vIdentificacion: integer);
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,');
          SQL.Add('"cap$maestrotitular".DIGITO_CUENTA,');
          SQL.Add('"cap$maestrotitular".ID_AGENCIA');
          SQL.Add('FROM');
          SQL.Add('"cap$maestrotitular"');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".ID_TIPO_CAPTACION="cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".ID_AGENCIA="cap$maestro".ID_AGENCIA)');
          SQL.Add('WHERE');
          SQL.Add('("cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
          SQL.Add('("cap$maestrotitular".ID_PERSONA = :ID_PERSONA) AND ');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION <= 2) AND ');
          SQL.Add('("cap$maestro".ID_ESTADO = 1) AND ');
          SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1)');
          ParamByName('ID_PERSONA').AsString := vIdPersona;
          ParamByName('ID_IDENTIFICACION').AsInteger := vIdentificacion;
          Open;
          while not Eof do
          begin
            if FieldByName('ID_TIPO_CAPTACION').AsInteger = 1 then
               vSaldoAportes := saldo(FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_TIPO_CAPTACION').AsInteger,FieldByName('NUMERO_CUENTA').AsInteger,FieldByName('DIGITO_CUENTA').AsInteger)
            else
               vSaldoAhorros := saldo(FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_TIPO_CAPTACION').AsInteger,FieldByName('NUMERO_CUENTA').AsInteger,FieldByName('DIGITO_CUENTA').AsInteger);
            Next;
          end;

        end;

end;

procedure TFrmImprimirSeguro.BtCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmImprimirSeguro.BtCancelarClick(Sender: TObject);
begin
        grprIncipal.Enabled := True;
        JvAhorrador.Caption := '';
        ChJuvenil.Checked := False;
        ChRindediario.Checked := False;
        ChAportes.Checked := False;
        ChCreditos.Checked := False;
        JvNumeroCuenta.Text := '';
        EdPersona.Text := '';
        BtSeguro.Enabled := False;
        BitReporte.Enabled := False;       
        JvNumeroCuenta.SetFocus;
end;

procedure TFrmImprimirSeguro.Seguro;
begin

end;

procedure TFrmImprimirSeguro.JvNumeroCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
          BitBuscar.Click;
end;

procedure TFrmImprimirSeguro.BtSeguroClick(Sender: TObject);
begin
        if MessageDlg('Esta Seguro de Registrar el Seguro Juvenil',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        if _iEstadoJuvenil = 0 then // Validación si el 
        begin
          with IBSQL4 do
          begin
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
            ParamByName('DIGITO_CUENTA').AsInteger := Digito;
            ParamByName('ID_IDENTIFICACION').AsInteger := TipoJ;
            ParamByName('ID_PERSONA').AsString := NumeroJ;
            ParamByName('EDAD').AsInteger := vEdad;
            ParamByName('VALOR_ASEGURADO').AsCurrency := ValorAseg;
            ParamByName('PRIMA').AsCurrency := PrimaM;
            ParamByName('FECHA_SEGURO').AsDate := fFechaActual;
            ParamByName('ID_POLIZA').AsInteger := _iPoliza;
            ParamByName('TIPO').AsInteger := _iTipoJuvenil;
            ParamByName('IMPRESO').AsInteger := 0;
            ParamByName('ID_USUARIO').AsString := DBAlias;
            ParamByName('PERSONA').AsString := UpperCase(EdPersona.Text) + ' -- ' + DateTimeToStr(fFechaHoraActual);
            ExecQuery;
         end; // Fin With IBSQL4
        end
        else // Registrar la persona a quien se le entrega el carné
        begin
          if EdPersona.Text <> '' then
          begin
            IBSQL7.Close;
            IBSQL7.ParamByName('PERSONA').AsString := UpperCase(EdPersona.Text) + ' -- ' + DateTimeToStr(fFechaHoraActual);;
            IBSQL7.ParamByName('CODIGO').AsInteger := _iCodSeguro;
            IBSQL7.ExecQuery;
          end;
        end;
        with IBSQL2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select POLIZA from "cap$polizajuvenil" where ID_POLIZA = :ID_POLIZA');
          ParamByName('ID_POLIZA').AsInteger := _iPoliza;
          ExecQuery;
          _sPoliza := FieldByName('POLIZA').AsString;
          Close;
        end;

        IBSQL4.Transaction.Commit;
        ShowMessage('Operación Realizada con Exito');
        BitReporte.Enabled := True;
        BtSeguro.Enabled := False;
end;

procedure TFrmImprimirSeguro.EdPersonaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BtSeguro.SetFocus;
end;

procedure TFrmImprimirSeguro.BitReporteClick(Sender: TObject);
begin
        CdDataset.CancelUpdates;
        CdDataset.Append;
        CdDataset.FieldByName('POLIZA').AsString := _sPoliza;
        CdDataset.FieldByName('FECHA1').AsDateTime := _dFechaSeguro;
        CdDataset.FieldByName('FECHA2').AsDateTime := IncYear(_dFechaSeguro,1);
        CdDataset.FieldByName('ASEGURADO').AsString := JvAhorrador.Caption;
        CdDataset.Post;
        frReport1.LoadFromFile(frmMain.ruta1 + 'reporte\frmCarneJuvenil.frf');
        frReport1.ShowReport;
end;

end.
