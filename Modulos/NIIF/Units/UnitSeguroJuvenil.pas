unit UnitSeguroJuvenil;

interface

uses
  Windows, Messages, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, DBCtrls, ComCtrls, ExtCtrls, Buttons,
  DB, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, pr_parser, IBSQL,
  UnitPantallaProgreso, IBDatabase, DBClient, JvTypedEdit, FR_DSet,
  FR_DBSet, FR_Class;

type
  Seguro = record
    Existe:Boolean;
    FechaS:TDate;
  end;

type
  TfrmSeguroJuvenil = class(TForm)
    IBQTipoCaptacion: TIBQuery;
    DSTipoCaptacion: TDataSource;
    IBQuery5: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBTransaction1: TIBTransaction;
    CdJuvenil: TClientDataSet;
    CdJuvenilID_AGENCIA: TIntegerField;
    CdJuvenilNUMERO_CUENTA: TIntegerField;
    CdJuvenilDIGITO_CUENTA: TIntegerField;
    CdJuvenilID_PERSONA: TStringField;
    CdJuvenilNOMBRE: TStringField;
    CdJuvenilEDAD: TIntegerField;
    IBSQL3: TIBSQL;
    IBQuery1: TIBQuery;
    CdJuvenilID_IDENTIFICACION: TSmallintField;
    IBSQL4: TIBSQL;
    CdJuvenilRENOVACION: TIntegerField;
    IBTransaction2: TIBTransaction;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    IBSQL6: TIBSQL;
    IBQuery2: TIBQuery;
    Panel2: TPanel;
    CmdGenerar: TBitBtn;
    Cmdcerrar: TBitBtn;
    CmdExceL: TBitBtn;
    Panel1: TPanel;
    Label24: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Label3: TLabel;
    EdFechaCorte: TDateTimePicker;
    Label2: TLabel;
    JvEdad: TJvIntegerEdit;
    BitImprimir: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure EdNumeroIKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroFKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdGenerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdExcelClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure CmdcerrarClick(Sender: TObject);
  private
    vSaldoAhorros:Currency;
    vSaldoAportes:Currency;
    vSaldoJuvenil:Currency;
    vNumero :Integer;
    vNumero1 :Integer;
    _iEstadoJuvenil :Smallint;
    _iTipoJuvenil :Smallint;
    procedure Inicializar;
    function buscar(vagencia,vcuenta,vdigito:integer):Seguro;
    function edad(ag,tipo,cuenta,digito:integer): integer;
    function Saldo(Ag, Tipo, Cuenta, Digito: integer): currency;
    procedure vSaldo(vIdPersona: string; vIdentificacion: integer);
    procedure DatosJuvenil(Ag, TipoC, Cuenta, Digito: Integer);
    procedure BuscaDato(vagencia, vcuenta, vdigito: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeguroJuvenil: TfrmSeguroJuvenil;
  SaldoTotal:Currency;
  PrimaM:Currency;
  ValorAseg:Currency;
  TipoJ:Integer;
  NumeroJ:string;
  NombreJ:string;

implementation
{$R *.dfm}

uses UnitdmGeneral, UnitGlobales,UnitGlobalesCol, UnitdmColocacion,
  UnitImpresion, unitMain, ComObj;

procedure TfrmSeguroJuvenil.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmSeguroJuvenil.Inicializar;
begin
        with IBQTipoCaptacion do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Open;
         Last;
        end;

        with IBSQL4 do begin
         if Transaction.InTransaction then
           Transaction.Rollback;
         Transaction.StartTransaction;
        end;

        EdFechaCorte.Date := fFechaActual;
        DBLCBTipoCaptacion.KeyValue := 4;
        ValorAseg := 0;
        PrimaM := 0;
end;

procedure TfrmSeguroJuvenil.EdNumeroIKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmSeguroJuvenil.EdNumeroFKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmSeguroJuvenil.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmSeguroJuvenil.CmdGenerarClick(Sender: TObject);
var      xdeudas :Boolean;
         total :Integer;
         Ag,Tipo,Cuenta,Digito,vEdad:Integer;
         vActivo:Boolean;
         vMinAportes,vMinJuvenil,vMinAhorros :Currency;
         FechaV:TDate;
         frmProgreso:TfrmProgreso;
         _iPloliza: Integer;
         _bAplicar :Boolean;
begin
        if MessageDlg('Esta seguro(a) de Realizar el Barrido de Seguros Juveniles',mtInformation,[mbYes,mbNo],0) = mrNo then
           Exit;
        _bAplicar := False;
        with IBSQL2 do
        begin
          //Buscar Poliza;
          Close;
          SQL.Clear;
          SQL.Add('select count(1) as CONTADOR from "cap$controlsegjuv" where FECHA = :FECHA');
          ParamByName('FECHA').AsDateTime := EdFechaCorte.DateTime;
          ExecQuery;
          if FieldByName('CONTADOR').AsInteger > 0 then
          begin
            ShowMessage('El Barrido de Credividas para esta fecha ya se realizo');
            Exit;
          end;
          Panel1.Enabled := False;
          Close;
          SQL.Clear;
          SQL.Add('select max(ID_POLIZA) AS ID_POLIZA from "cap$polizajuvenil"');
          ExecQuery;
          _iPloliza := FieldByName('ID_POLIZA').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add(' SALDO_MINIMO');
          SQL.Add('FROM');
          SQL.Add(' "cap$tipocaptacion"');
          SQL.Add('WHERE');
          SQL.Add(' ID_TIPO_CAPTACION = :ID');

          // Aportaciones sociales
          ParamByName('ID').AsInteger := 1;
          try
            ExecQuery;
            vMinAportes := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
          raise;
          end;

          // Ahorro Rindediario
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
          ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
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
      end;// fin del with


        CmdGenerar.Enabled :=False;
        Application.ProcessMessages;
        dmColocacion := TdmColocacion.Create(Self);

        with IBSQL1 do
        begin
          Close;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
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
        with IBQuery5 do
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
         // SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA BETWEEN :NUMERO_CUENTA_1 and :NUMERO_CUENTA_2');
          SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
          //SQL.Add('AND "cap$maestro".NUMERO_CUENTA = 7801');
          SQL.Add('and "cap$maestro".FECHA_APERTURA <= :FECHACORTE and "cap$maestrotitular".NUMERO_TITULAR = 1 and "cap$maestro".ID_ESTADO = 1');
          SQL.Add('ORDER BY');
          SQL.Add('"cap$maestro".ID_AGENCIA, "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
          Open;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Caption := 'Reporte de Seguros Juveniles';
          frmProgreso.Max := total;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
             frmProgreso.InfoLabel := 'Registro No ' + IntToStr(FieldByName('NUMERO_CUENTA').AsInteger);
             frmProgreso.Position := RecNo;
             Application.ProcessMessages;
             Ag     := FieldByName('ID_AGENCIA').AsInteger;
             Tipo   := FieldByName('ID_TIPO_CAPTACION').AsInteger;
             Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
             Digito := FieldByName('DIGITO_CUENTA').AsInteger;
             vSaldoAportes := 0;
             vSaldoAhorros := 0;
             vSaldoJuvenil := 0;
             xdeudas := False;
             vActivo := False;
             vEdad := EDAD(Ag,Tipo,Cuenta,Digito);
             BuscaDato(Ag,Cuenta,Digito);//busca el estado del seguro Juvenil y el tipo de Inserción (renovacion o primera vez)
             if _iEstadoJuvenil = 0 then
             begin
               if (vEdad <= JvEdad.Value) then
               begin
                 DatosJuvenil(Ag,DBLCBTipoCaptacion.KeyValue,Cuenta,Digito);
                 vSaldo(FieldByName('ID_PERSONA').AsString,FieldByName('ID_IDENTIFICACION').AsInteger);
                 vSaldoJuvenil := SALDO(Ag,Tipo,Cuenta,Digito);
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
                   end;// fin del While ibsql2 para obtener deudas
                 end; // fin del recorcount del busca deudad
                 if (not xdeudas) and (vSaldoJuvenil >= vMinJuvenil) and (vSaldoAhorros >= vMinAhorros) and (vSaldoAportes >= vMinAportes) then
                 begin
                   _bAplicar := True;
                   with IBSQL4 do
                   begin
                     ParamByName('ID_AGENCIA').AsInteger := Ag;
                     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
                     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                     ParamByName('ID_IDENTIFICACION').AsInteger := TipoJ;
                     ParamByName('ID_PERSONA').AsString := NumeroJ;
                     ParamByName('EDAD').AsInteger := vEdad;
                     ParamByName('VALOR_ASEGURADO').AsCurrency := ValorAseg;
                     ParamByName('PRIMA').AsCurrency := PrimaM;
                     ParamByName('FECHA_SEGURO').AsDate := EdFechaCorte.DateTime;
                     ParamByName('ID_POLIZA').AsInteger := _iPloliza;
                     ParamByName('TIPO').AsInteger := _iTipoJuvenil;
                     ParamByName('IMPRESO').AsInteger := 0;
                     ParamByName('ID_USUARIO').AsString := DBAlias;
                     ExecQuery;
                   end; // Fin With IBSQL4
                 end;
               end; // fin del valida la edad
             end; // fin del valida si existe o no el seguro
             Next;
          end;// fin del while
        end; // Fin del IBquery
        frmProgreso.Cerrar;
        if _bAplicar = False then
        begin
           ShowMessage('No existen Seguros para Aplicar');
           IBSQL4.Transaction.Rollback;
        end
        else
        begin
           with IBSQL3 do
           begin
             Close;
             SQL.Clear;
             SQL.Add('INSERT INTO "cap$controlsegjuv" values (:AG,:TIPOC,:FECHA,:ID_EMPLEADO)');
             ParamByName('AG').AsInteger := Agencia;
             ParamByName('TIPOC').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('FECHA').AsDate := EdFechaCorte.Date;
             ParamByName('ID_EMPLEADO').AsString := DBAlias;
             ExecQuery;
             Close;
           end;
           IBSQL4.Transaction.Commit;
           CmdGenerar.Enabled := False;
           //BitImprimir.Enabled := True;
           ShowMessage('Seguros Aplicados con Exito.');
        end;


end;

function TfrmSeguroJuvenil.buscar(vagencia,vcuenta,vdigito:integer):seguro;
begin
        with IBSQL2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT *');
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
          if RecordCount > 0 then
            begin
              Result.Existe := True;
              Result.FechaS := FieldByName('FECHA_SEGURO').AsDate;
            end
          else
            begin
              Result.Existe := False;
              Result.FechaS := 0;
            end;
        end;

end;

procedure TfrmSeguroJuvenil.FormCreate(Sender: TObject);
begin
        if IBTransaction1.InTransaction then
           IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
end;

function TfrmSeguroJuvenil.edad(ag,tipo,cuenta,
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

function TfrmSeguroJuvenil.Saldo(Ag, Tipo, Cuenta,
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

procedure TfrmSeguroJuvenil.vSaldo(vIdPersona: string;
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

procedure TfrmSeguroJuvenil.DatosJuvenil(Ag, TipoC, Cuenta,
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

procedure TfrmSeguroJuvenil.CmdExcelClick(Sender: TObject);
var   G :Integer;
      Excel, WorkBook, WorkSheet: Variant;
      DesAgencia :string;
      Format: OleVariant;
const
       xlWBATWorksheet = -4167;

begin
       Excel := CreateOleObject('Excel.Application');
       Excel.DisplayAlerts := false;
       Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
       WorkSheet := WorkBook.WorkSheets[1];
       WorkSheet.Name := 'Seguro Juvenil';
       G := 0;
       with IBQuery2 do
       begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT "gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE as NOMBRE,');
          SQL.Add('"cap$segurojuvenil".ID_PERSONA,');
          SQL.Add('"cap$segurojuvenil".EDAD,');
          SQL.Add('"cap$segurojuvenil".VALOR_ASEGURADO');
          SQL.Add('FROM "cap$segurojuvenil"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("cap$segurojuvenil".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("cap$segurojuvenil".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('WHERE FECHA_SEGURO = :FECHA');
          ParamByName('FECHA').AsDate := EdFechaCorte.Date;
          Open;
          WorkSheet.Cells[1,1].ColumnWidth := 31;
          WorkSheet.Cells[1,2].ColumnWidth := 12;
          WorkSheet.cells[1,3].ColumnWidth := 3;
          WorkSheet.Cells[1,4].ColumnWidth := 8;
//          WorkSheet.range['A3:E3'].Font.FontStyle := 'Bold';
          IBQuery2.Last;
          IBQuery2.First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Caption := 'Aplicando Seguro Juvenil';
          frmProgreso.Max := IBQuery2.RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
           frmProgreso.InfoLabel := 'Registro No ' + IntToStr(RecNo);
           frmProgreso.Position := RecNo;
           Application.ProcessMessages;
           for G := 1 to 4 do
             WorkSheet.Cells[recno, G] := Fields.Fields[G - 1].AsString;
           Next;
          end;
          frmProgreso.Cerrar;
        end;
          WorkBook.SaveAs('c:\SeguroJuvenil' + IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('00',DayOf(EdFechaCorte.Date)) + '.xls');
          Excel.WorkBooks.Open('c:\SeguroJuvenil' + IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('00',DayOf(EdFechaCorte.Date)) + '.xls');
          Excel.visible:=True;
end;


procedure TfrmSeguroJuvenil.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'NIT' then
           ParValue := Nit;
        if ParName = 'EMPRESA' then
           ParValue := Empresa;
        if ParName = 'FUNCIONARIO' then
           ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'VALORA' then
           ParValue := ValorAseg;
end;

procedure TfrmSeguroJuvenil.CmdcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmSeguroJuvenil.BuscaDato(vagencia, vcuenta, vdigito: integer);
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
        if FieldByName('FECHA_SEGURO').AsDate > 0 then
        begin
          _dFechaVencimiento := IncYear(FieldByName('FECHA_SEGURO').AsDate,1);
          if _dFechaVencimiento <= EdFechaCorte.DateTime then
          begin
            _iTipoJuvenil := 1;
            _iEstadoJuvenil := 0;
          end;
        end
        else
        begin
          _iEstadoJuvenil := 0; // Se encuentra para Renovación o Inserción
          _iTipoJuvenil := 0; //Ingreso
        end;
     end;


end;

end.

