unit UnitInformeGeneraldeCaptaciones1;

interface

uses
  Windows, Messages, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, DBCtrls, ComCtrls, ExtCtrls, Buttons,
  DB, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, pr_parser, IBSQL,
  UnitPantallaProgreso, IBDatabase, DBClient, JvTypedEdit;

type
  TfrmInformeGeneraldeCaptaciones = class(TForm)
    Label24: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Label25: TLabel;
    EdNumeroI: TJvEdit;
    Label1: TLabel;
    EdNumeroF: TJvEdit;
    Label3: TLabel;
    EdFechaCorte: TDateTimePicker;
    Panel1: TPanel;
    RGTipoInforme: TRadioGroup;
    Panel2: TPanel;
    CmdGenerar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQTipoCaptacion: TIBQuery;
    DSTipoCaptacion: TDataSource;
    IBQuery5: TIBQuery;
    IBSQL1: TIBSQL;
    ReporteCon: TprTxReport;
    ReporteCer: TprTxReport;
    IBSQL2: TIBSQL;
    IBTransaction1: TIBTransaction;
    CdJuvenil: TClientDataSet;
    CdJuvenilID_TIPO_CAPTACION: TIntegerField;
    CdJuvenilID_AGENCIA: TIntegerField;
    CdJuvenilNUMERO_CUENTA: TIntegerField;
    CdJuvenilDIGITO_CUENTA: TIntegerField;
    CdJuvenilID_PERSONA: TStringField;
    CdJuvenilNOMBRE: TStringField;
    CdJuvenilDEUDA: TStringField;
    CdJuvenilEDAD: TIntegerField;
    CdJuvenilAPORTES: TCurrencyField;
    CdJuvenilAHORROS: TCurrencyField;
    IBSQL3: TIBSQL;
    CdMayor: TClientDataSet;
    CdMayorID_TIPO_CAPTACION: TIntegerField;
    CdMayorID_AGENCIA: TIntegerField;
    CdMayorNUMERO_CUENTA: TIntegerField;
    CdMayorDIGITO_CUENTA: TIntegerField;
    CdMayorID_PERSONA: TStringField;
    CdMayorNOMBRE: TStringField;
    JvEdad: TJvIntegerEdit;
    Label2: TLabel;
    CdJuvenilJUVENIL: TCurrencyField;
    IBQuery1: TIBQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    prMayor: TprTxReport;
    ReporteCap: TprTxReport;
    CdMayorJUVENIL: TCurrencyField;
    CdMayorEDAD: TCurrencyField;
    CdJuvenilACTIVO: TStringField;
    procedure ReporteCapUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroIKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroFKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdGenerarClick(Sender: TObject);
    procedure EdNumeroIExit(Sender: TObject);
    procedure EdNumeroFExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure prMayorUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure BitBtn1Click(Sender: TObject);
  private
    vSaldoAhorro: currency;
    vSaldoAporte: currency;
    vNumero :Integer;
    vNumero1 :Integer;
    procedure Inicializar;
    function buscar(vid_agencia, vnumero_cuenta, vtipo,
      vdigito: integer): boolean;
    function edad(ag,tipo,cuenta, digito:integer): integer;
    function Saldo(Ag, Tipo, Cuenta, Digito: integer): currency;
    procedure vSaldo(vIdPersona: string; vIdentificacion: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeGeneraldeCaptaciones: TfrmInformeGeneraldeCaptaciones;
  frmProgreso:TfrmProgreso;
  SaldoTotal:Currency;

implementation
{$R *.dfm}

uses UnitdmGeneral, UnitGlobales,UnitGlobalesCol, UnitdmColocacion;

procedure TfrmInformeGeneraldeCaptaciones.ReporteCapUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var Ag,Tipo,Cuenta,Digito,vEdad:Integer;
    Saldo:Currency;
    vFecha :TDate;
begin
        Ag     := CdJuvenil.FieldByName('ID_AGENCIA').AsInteger;
        Tipo   := CdJuvenil.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        Cuenta := CdJuvenil.FieldByName('NUMERO_CUENTA').AsInteger;
        Digito := CdJuvenil.FieldByName('DIGITO_CUENTA').AsInteger;

        {frmProgreso.Position := CdJuvenil.RecNo;
        frmProgreso.InfoLabel := 'Captacion: ' + IntToStr(CdJuvenil.FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                                 Format('%.2d',[CdJuvenil.FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                 Format('%.7d',[CdJuvenil.FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                 IntToStr(CdJuvenil.FieldByName('DIGITO_CUENTA').AsInteger);
        Application.ProcessMessages;}

{        if VarName = 'SALDO_ACTUAL' then begin
          with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
            ParamByName('AG').AsInteger := Ag;
            ParamByName('TP').AsInteger := Tipo;
            ParamByName('CTA').AsInteger := Cuenta;
            ParamByName('DGT').AsInteger := Digito;
            ParamByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
            ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
            ParamByName('FECHA2').AsDate := EdFechaCorte.Date;
            try
             ExecQuery;
             Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
            except
             Transaction.Rollback;
            end;
          end;
           _vSetAsDouble(Value,Saldo);
           SaldoTotal := SaldoTotal + Saldo;
           IsProcessed := True;
        end;}

        if VarName = 'SEGUNDO_TITULAR' then begin
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE,"gen$persona".FECHA_NACIMIENTO from "cap$maestrotitular"');
           IBSQL1.SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
           IBSQL1.SQL.Add('where');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Ag;
           IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
           IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
           IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
           try
            IBSQL1.ExecQuery;
            vFecha := IBSQL1.FieldByName('FECHA_NACIMIENTO').AsDate;
            if IBSQL1.RecordCount > 0 then
               _vSetAsString(Value,IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                   IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                   IBSQL1.FieldByName('NOMBRE').AsString)
            else
               _vSetAsString(Value,'');
           except
               _vSetAsString(Value,'');
           end;
           IsProcessed := True;
        end;

        {if VarName = 'SaldoTotal' then begin
           SaldoTotal := SaldoTotal / 2;
           _vSetAsDouble(Value,SaldoTotal);
           IsProcessed := True;
        end;}
        {if VarName = 'EDAD' then
        begin
         IBSQL1.Close;
         IBSQL1.SQL.Clear;
         IBSQL1.SQL.Add('select "gen$persona".FECHA_NACIMIENTO from "cap$maestrotitular"');
         IBSQL1.SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
         IBSQL1.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
         IBSQL1.SQL.Add('where');
         IBSQL1.SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
         IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
         IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
         IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2');
         IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Ag;
         IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
         IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
         IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
         IBSQL1.ExecQuery;
         vFecha := IBSQL1.FieldByName('FECHA_NACIMIENTO').AsDate;
         vEdad := YearsBetween(vFecha,fFechaActual);
         _vSetAsDouble(Value,vEdad);
         IsProcessed := True;
        end; }



end;

procedure TfrmInformeGeneraldeCaptaciones.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmInformeGeneraldeCaptaciones.Inicializar;
begin
        with IBQTipoCaptacion do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Open;
         Last;
        end;

        //EdFechaCorte.Date := fFechaActual;

        frmProgreso := TfrmProgreso.Create(Self);
end;

procedure TfrmInformeGeneraldeCaptaciones.EdNumeroIKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmInformeGeneraldeCaptaciones.EdNumeroFKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmInformeGeneraldeCaptaciones.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeGeneraldeCaptaciones.CmdGenerarClick(Sender: TObject);
var      xdeudas :Boolean;
         total :Integer;
         numero :Integer;
         Ag,Tipo,Cuenta,Digito,vEdad:Integer;
         vActivo :Boolean;
         vMinAportes,vMinJuvenil,vMinAhorros :Currency;
begin
        vMinAportes := 0;
        vMinJuvenil := 0;
        vMinAhorros := 0;
        vActivo := False;
        CmdGenerar.Enabled :=False;
        Application.ProcessMessages;
        dmColocacion := TdmColocacion.Create(Self);
        numero := 0;
        vNumero1 := 0;
        with IBSQL1 do begin
          Close;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('NUMERO_CUENTA_1').AsInteger := StrToInt(EdNumeroI.Text);
          ParamByName('NUMERO_CUENTA_2').AsInteger := StrToInt(EdNumeroF.Text);
          ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
          try
            ExecQuery;
            total := FieldByName('TOTAL').AsInteger;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

         CdJuvenil.CancelUpdates;
         CdMayor.CancelUpdates;
         xdeudas := False;
         with IBQuery5 do
         begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA, "cap$maestro".DIGITO_CUENTA,');
           SQL.Add('"gen$persona".ID_PERSONA,"gen$persona".ID_IDENTIFICACION,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE, "cap$maestro".VALOR_INICIAL, "cap$maestro".PLAZO_CUENTA,');
           SQL.Add('"cap$maestro".CUOTA,');
           SQL.Add('"cap$maestro".TASA_EFECTIVA,');
           SQL.Add('"cap$maestro".PUNTOS_ADICIONALES,');
           SQL.Add('"cap$maestro".AMORTIZACION,');
           SQL.Add('"cap$maestro".FECHA_APERTURA,');
           SQL.Add('"cap$maestro".FECHA_VENCIMIENTO,');
           SQL.Add('"cap$tiposestado".SE_SUMA');
           SQL.Add(' FROM');
           SQL.Add('"cap$maestro"');
           SQL.Add('INNER JOIN "cap$tiposestado" on ("cap$tiposestado".ID_ESTADO = "cap$maestro".ID_ESTADO)');
           SQL.Add('INNER JOIN "cap$maestrotitular" on (("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA)');
           SQL.Add('AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION)');
           SQL.Add('AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA))');
           SQL.Add('INNER JOIN "gen$persona" on (("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA))');
           SQL.Add('WHERE');
           SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA BETWEEN :NUMERO_CUENTA_1 and :NUMERO_CUENTA_2');
           SQL.Add('and "cap$maestro".FECHA_APERTURA <= :FECHACORTE and "cap$maestrotitular".NUMERO_TITULAR = 1 and "cap$tiposestado".SE_SUMA <> 0 and "cap$maestro".ID_ESTADO = 1');
           SQL.Add('ORDER BY');
           SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA');
           ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('NUMERO_CUENTA_1').AsInteger := StrToInt(EdNumeroI.Text);
           ParamByName('NUMERO_CUENTA_2').AsInteger := StrToInt(EdNumeroF.Text);
           ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
           Open;
           frmProgreso := TfrmProgreso.Create(Self);
           frmProgreso.Caption := 'Generando Reportre de Juv. Mayores de 14 Años';
           frmProgreso.Max := total;
           frmProgreso.Min := 0;
           frmProgreso.Ejecutar;
           while not Eof do
           begin
              frmProgreso.InfoLabel := 'Registro No ' + IntToStr(RecNo);
              frmProgreso.Position := RecNo;
              Application.ProcessMessages;
              Ag     := FieldByName('ID_AGENCIA').AsInteger;
              Tipo   := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
              Digito := FieldByName('DIGITO_CUENTA').AsInteger;
              //if buscar(FieldByName('ID_AGENCIA').AsInteger,FieldByName('NUMERO_CUENTA').AsInteger,FieldByName('ID_TIPO_CAPTACION').AsInteger,FieldByName('DIGITO_CUENTA').AsInteger) = False then
              //begin
                 vEdad := EDAD(Ag,Tipo,Cuenta,Digito);
                 if vEdad < JvEdad.Value then
                 begin
                   {vSaldo(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger);
                   numero := numero + 1;
                   CdJuvenil.Append;
                   CdJuvenil.FieldValues['ID_AGENCIA'] := Ag;
                   CdJuvenil.FieldValues['ID_TIPO_CAPTACION'] := Tipo;
                   CdJuvenil.FieldValues['NUMERO_CUENTA'] := Cuenta;
                   CdJuvenil.FieldValues['DIGITO_CUENTA'] := Digito;
                   CdJuvenil.FieldValues['ID_PERSONA'] := FieldByName('ID_PERSONA').AsString;
                   CdJuvenil.FieldValues['NOMBRE'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                   vMinJuvenil := SALDO(Ag,Tipo,Cuenta,Digito);
                   CdJuvenil.FieldValues['JUVENIL'] := vMinJuvenil;
                   CdJuvenil.FieldValues['AHORROS'] := vSaldoAhorro;
                   CdJuvenil.FieldValues['APORTES'] := vSaldoAporte;
                   CdJuvenil.FieldValues['EDAD'] := vEdad;
                   IBSQL2.Close;
                   IBSQL2.SQL.Clear;
                   IBSQL2.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
                   IBSQL2.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
                   IBSQL2.SQL.Add('and ID_ESTADO_COLOCACION < 3');
                   IBSQL2.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                   IBSQL2.ParamByName('ID_PERSONA').AsString := FIELDBYNAME('ID_PERSONA').AsString;
                   IBSQL2.ExecQuery;
                   if IBSQL2.RecordCount > 0 then
                   begin
                      while not IBSQL2.Eof do
                      begin
                         if ObtenerDeudaHoy1(IBSQL2.FieldByName('ID_AGENCIA').AsInteger,IBSQL2.FieldByName('ID_COLOCACION').AsString,IBSQL1).Dias > 0 then
                         begin
                            xDeudas := True;
                            Break;
                         end;
                      IBSQL2.Next;
                      end;
                   end;
                   if xdeudas then
                      CdJuvenil.FieldValues['DEUDA'] := 'X'
                   else
                      CdJuvenil.FieldValues['DEUDA'] := '';
                   if (xdeudas) or (vMinJuvenil < 70000) or (vSaldoAhorro < 6000) or (vSaldoAporte < 94000) then
                      CdJuvenil.FieldValues['ACTIVO'] := ''
                   else
                      CdJuvenil.FieldValues['ACTIVO'] := '**';

                   CdJuvenil.Post;}
                end// fin del edad
                else
                begin
                  vnumero1 := vNumero1 + 1;
                  CdMayor.Append;
                  CdMayor.FieldValues['ID_AGENCIA'] := Ag;
                  CdMayor.FieldValues['ID_TIPO_CAPTACION'] := Tipo;
                  CdMayor.FieldValues['NUMERO_CUENTA'] := Cuenta;
                  CdMayor.FieldValues['DIGITO_CUENTA'] := Digito;
                  CdMayor.FieldValues['ID_PERSONA'] := FieldByName('ID_PERSONA').AsString;
                  CdMayor.FieldValues['NOMBRE'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                  CdMayor.FieldValues['JUVENIL'] := SALDO(Ag,Tipo,Cuenta,Digito);
                  CdMayor.FieldValues['EDAD'] := vEdad;
                  CdMayor.Post;
                end;
             // end;// FIN DEL IF
              xdeudas := False;
              vSaldoAporte := 0;
              vSaldoAhorro := 0;
                 Next;
           end;// FIN DE WHILE
        end; //FIN DEL WITH
        vNumero := numero;
        frmProgreso.Cerrar;
        BitBtn1.Click;
end;

procedure TfrmInformeGeneraldeCaptaciones.EdNumeroIExit(Sender: TObject);
begin
        EdNumeroI.Text := Format('%.7d',[StrtoInt(EdNumeroI.Text)]);
end;

procedure TfrmInformeGeneraldeCaptaciones.EdNumeroFExit(Sender: TObject);
begin
        EdNumeroF.Text := Format('%.7d',[StrtoInt(EdNumeroF.Text)]);
end;

function TfrmInformeGeneraldeCaptaciones.buscar(vid_agencia,
  vnumero_cuenta, vtipo, vdigito: integer): boolean;
begin
        Result := False;
        with IBSQL2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT *');
          SQL.Add('FROM');
          SQL.Add('"gen$detalles"');
          SQL.Add('WHERE');
          SQL.Add('("gen$detalles".ID_AGENCIA = :ID_AGENCIA) AND ');
          SQL.Add('("gen$detalles".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION) AND ');
          SQL.Add('("gen$detalles".NUMERO_CUENTA = :NUMERO_CUENTA) AND ');
          SQL.Add('("gen$detalles".DIGITO_CUENTA = :DIGITO) AND ');
          SQL.Add('("gen$detalles".ANO = 2006)');
          ParamByName('ID_AGENCIA').AsInteger := vid_agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := vtipo;
          ParamByName('NUMERO_CUENTA').AsInteger := vnumero_cuenta;
          ParamByName('DIGITO').AsInteger := vdigito;
          ExecQuery;
          if RecordCount > 0 then
             Result := True;
        end;

end;

procedure TfrmInformeGeneraldeCaptaciones.FormCreate(Sender: TObject);
begin
        if IBTransaction1.InTransaction then
           IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
        EdFechaCorte.Date := fFechaActual;
        DBLCBTipoCaptacion.KeyValue := 4;
end;

function TfrmInformeGeneraldeCaptaciones.edad(ag,tipo,cuenta,
  digito:Integer): integer;
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

function TfrmInformeGeneraldeCaptaciones.Saldo(Ag, Tipo, Cuenta,
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

procedure TfrmInformeGeneraldeCaptaciones.vSaldo(vIdPersona: string;
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
//          First;
//          ShowMessage(IntToStr(RecordCount));
          while not Eof do
          begin
            if FieldByName('ID_TIPO_CAPTACION').AsInteger = 1 then
               vSaldoAporte := saldo(FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_TIPO_CAPTACION').AsInteger,FieldByName('NUMERO_CUENTA').AsInteger,FieldByName('DIGITO_CUENTA').AsInteger)
            else
               vSaldoAhorro := saldo(FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_TIPO_CAPTACION').AsInteger,FieldByName('NUMERO_CUENTA').AsInteger,FieldByName('DIGITO_CUENTA').AsInteger);
            Next;
          end;

        end;
end;

procedure TfrmInformeGeneraldeCaptaciones.BitBtn2Click(Sender: TObject);
begin
              ReporteCap.Variables.ByName['Empresa'].AsString := Empresa;
              ReporteCap.Variables.ByName['numero'].AsInteger := vNumero;
              ReporteCap.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.DateTime;
              ReporteCap.Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;
              ReporteCap.Variables.ByName['rango'].AsString := IntToStr(jvedad.Value);
              SaldoTotal := 0;

              //frmProgreso.Min := 0;
              //frmProgreso.Max := IBSQL1.FieldByName('TOTAL').AsInteger;

              //frmProgreso.Ejecutar;
              if ReporteCap.PrepareReport then
                 //frmProgreso.Cerrar;
                 ReporteCap.PreviewPreparedReport(True);

end;

procedure TfrmInformeGeneraldeCaptaciones.prMayorUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var Ag,Tipo,Cuenta,Digito,vEdad:Integer;
    Saldo:Currency;
    vFecha :TDate;
begin
        Ag     := CdMayor.FieldByName('ID_AGENCIA').AsInteger;
        Tipo   := CdMayor.FieldByName('ID_TIPO_CAPTACION').AsInteger;
        Cuenta := CdMayor.FieldByName('NUMERO_CUENTA').AsInteger;
        Digito := CdMayor.FieldByName('DIGITO_CUENTA').AsInteger;

        {frmProgreso.Position := CdJuvenil.RecNo;
        frmProgreso.InfoLabel := 'Captacion: ' + IntToStr(CdJuvenil.FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                                 Format('%.2d',[CdJuvenil.FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                 Format('%.7d',[CdJuvenil.FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                 IntToStr(CdJuvenil.FieldByName('DIGITO_CUENTA').AsInteger);
        Application.ProcessMessages;}

{        if VarName = 'SALDO_ACTUAL' then begin
          with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
            ParamByName('AG').AsInteger := Ag;
            ParamByName('TP').AsInteger := Tipo;
            ParamByName('CTA').AsInteger := Cuenta;
            ParamByName('DGT').AsInteger := Digito;
            ParamByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
            ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
            ParamByName('FECHA2').AsDate := EdFechaCorte.Date;
            try
             ExecQuery;
             Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
            except
             Transaction.Rollback;
            end;
          end;
           _vSetAsDouble(Value,Saldo);
           SaldoTotal := SaldoTotal + Saldo;
           IsProcessed := True;
        end;}

        if VarName = 'SEGUNDO_TITULAR' then begin
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE,"gen$persona".FECHA_NACIMIENTO from "cap$maestrotitular"');
           IBSQL1.SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
           IBSQL1.SQL.Add('where');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Ag;
           IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
           IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
           IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
           try
            IBSQL1.ExecQuery;
            vFecha := IBSQL1.FieldByName('FECHA_NACIMIENTO').AsDate;
            if IBSQL1.RecordCount > 0 then
               _vSetAsString(Value,IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                   IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                   IBSQL1.FieldByName('NOMBRE').AsString)
            else
               _vSetAsString(Value,'');
           except
               _vSetAsString(Value,'');
           end;
           IsProcessed := True;
        end;
        if VarName = 'FECHAN' then
        begin
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select "gen$persona".FECHA_NACIMIENTO from "cap$maestrotitular"');
           IBSQL1.SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
           IBSQL1.SQL.Add('where');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Ag;
           IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
           IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
           IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
           IBSQL1.ExecQuery;
           vFecha := IBSQL1.FieldByName('FECHA_NACIMIENTO').AsDate;
          _vSetAsDateTime(Value,vFecha);
           IsProcessed := True;
        end;

end;

procedure TfrmInformeGeneraldeCaptaciones.BitBtn1Click(Sender: TObject);
begin
              prMayor.Variables.ByName['Empresa'].AsString := Empresa;
              prMayor.Variables.ByName['numero'].AsInteger := vNumero1;
              prMayor.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.DateTime;
              prMayor.Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;
              prMayor.Variables.ByName['rango'].AsString := IntToStr(jvedad.Value);

              SaldoTotal := 0;

              //frmProgreso.Min := 0;
              //frmProgreso.Max := IBSQL1.FieldByName('TOTAL').AsInteger;

              //frmProgreso.Ejecutar;
              if prMayor.PrepareReport then
                 //frmProgreso.Cerrar;
                 prMayor.PreviewPreparedReport(True);

end;

end.
