unit UnitCertificaReteFuenteCap;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons, ComCtrls, IBSQL,
  pr_Common, pr_TxClasses, pr_Classes, DB, IBCustomDataSet, IBQuery,
  IBDatabase, JvEdit, JvFloatEdit, DBClient;

type
  TfrmCertificaReteFuenteCap = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdNumeroIdentificacion: TMemo;
    DBLCBTipoIdentificacion: TDBLookupComboBox;
    Label2: TLabel;
    Panel2: TPanel;
    btnGenerar: TBitBtn;
    btnCerrar: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    Bar1: TProgressBar;
    EdNombre: TStaticText;
    Panel4: TPanel;
    Label4: TLabel;
    EdAno: TEdit;
    Label5: TLabel;
    EdTasa: TJvFloatEdit;
    lblEstado: TLabel;
    btnOtro: TBitBtn;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    CDCuentas: TClientDataSet;
    CDCuentasTIPO: TStringField;
    CDCuentasSALDO: TCurrencyField;
    prReport1: TprReport;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnOtroClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Inicializar;
    { Public declarations }
  end;

var
  frmCertificaReteFuenteCap: TfrmCertificaReteFuenteCap;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmCertificaReteFuenteCap.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCertificaReteFuenteCap.btnGenerarClick(Sender: TObject);
var
   Numero:Integer;
   Asociado:string;
   Direccion:string;
   Ciudad1:string;
   TipoDoc:string;
   NumeroDoc:string;
   Ano:Integer;
   Tasa:Double;
   SaldoApo:Currency;
   SaldoAho:Currency;
   SaldoJuv:Currency;
   SaldoCon:Currency;
   SaldoCdat:Currency;
   IntPagAho:Currency;
   IntPagJuv:Currency;
   IntPagCon:Currency;
   IntPagCdat:Currency;
   SaldoCap:Currency;
   SaldoIntPag:Currency;
   SaldoRetFue:Currency;
   SaldoCre:Currency;
   SaldoIntRec:Currency;
// Datos Cuentas
   Ag,Tipo,Cuenta,Digito:Integer;
begin

   btnGenerar.Enabled := False;

   lblEstado.Caption := 'Conectando a la Base de Datos';
   IBDatabase1.DataBaseName := DBserver1 + ':' + DBpath1 + DBname1;
   IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
   IBDatabase1.Params.Values['User_Name'] := 'SYSDBA';
   IBDatabase1.Params.Values['PassWord'] := 'masterkey';
  // IBDatabase1.Params.Values['sql_role_name'] := 'CAPTACIONES';
   try
     IBDatabase1.Connected := True;
   except
     raise;
   end;
//   ShowMessage(IBDatabase1.DatabaseName);
   SaldoApo    := 0;
   SaldoCap    := 0;
   SaldoCre    := 0;
   SaldoIntPag := 0;
   SaldoRetFue := 0;
   SaldoIntRec := 0;
   SaldoAho    := 0;
   SaldoJuv    := 0;
   SaldoCon    := 0;
   SaldoCdat   := 0;
   IntPagAho   := 0;
   IntPagJuv   := 0;
   IntPagCon   := 0;
   IntPagCdat  := 0;
   
   CDCuentas.EmptyDataSet;

   TipoDoc := DBLCBTipoIdentificacion.Text;
   NumeroDoc := EdNumeroIdentificacion.Text;

   if IBSQL1.Transaction.InTransaction then
     IBSQL1.Transaction.Rollback;

   IBSQL1.Transaction.StartTransaction;

   lblEstado.Caption := 'Obteniendo Datos del Asociado';
   Application.ProcessMessages;
   with IBSQL1 do begin
     Close;
     SQL.Clear;
     SQL.Add('select (PRIMER_APELLIDO || '' '' || SEGUNDO_APELLIDO || '' '' || NOMBRE) AS NOMBRE from "gen$persona"');
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
     try
      ExecQuery;
     except
      Transaction.Rollback;
      raise;
     end;
     EdNombre.Caption := FieldByName('NOMBRE').AsString;
     Asociado := FieldByName('NOMBRE').AsString;

     lblEstado.Caption := 'Verificando Dirección';
     Application.ProcessMessages;

     Close;
     SQL.Clear;
     SQL.Add('select * from "gen$direccion" ');
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_DIRECCION = 1');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
     try
      ExecQuery;
     except
      Transaction.Rollback;
      raise;
     end;
     Direccion := FieldByName('DIRECCION').AsString;
     Ciudad1 := FieldByName('MUNICIPIO').AsString;

     lblEstado.Caption := 'Buscando Captaciones';
     Application.ProcessMessages;

     Close;
     SQL.Clear;
     SQL.Add('select "cap$maestrotitular".ID_AGENCIA, "cap$maestrotitular".ID_TIPO_CAPTACION, "cap$maestrotitular".NUMERO_CUENTA, "cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
     SQL.Add('inner join "cap$maestro" ON ( "cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
     SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION  and');
     SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
     SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA )');
     SQL.Add('inner join "cap$tiposestado" ON ( "cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO )');
     SQL.Add('where');
     SQL.Add('ID_IDENTIFICACION = :ID and ID_PERSONA = :ID_PERSONA and "cap$maestrotitular".NUMERO_TITULAR = 1 and');
     SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 1 or "cap$maestrotitular".ID_TIPO_CAPTACION = 2 or "cap$maestrotitular".ID_TIPO_CAPTACION = 4 or "cap$maestrotitular".ID_TIPO_CAPTACION = 5)');
     SQL.Add('order by "cap$maestrotitular".ID_AGENCIA, "cap$maestrotitular".ID_TIPO_CAPTACION, "cap$maestrotitular".NUMERO_CUENTA, "cap$maestrotitular".DIGITO_CUENTA');
     ParamByName('ID').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     try
       ExecQuery;
       if RecordCount < 1 then begin
          Exit;
       end; // if
     except
       MessageDlg('Error al Buscar Total de Captaciones',mtError,[mbok],0);
       Exit;
     end; // try

     lblEstado.Caption := 'Obteniendo Saldos e Intereses de Captaciones';
     Application.ProcessMessages;
     while not Eof do begin
        Ag := FieldByName('ID_AGENCIA').AsInteger;
        Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
        Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
        Digito := FieldByName('DIGITO_CUENTA').AsInteger;

        IBSQL2.Close;
        IBSQL2.SQL.Clear;
        IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(');
        IBSQL2.SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
        IBSQL2.SQL.Add(':DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
        IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
        IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
        IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
        IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
        IBSQL2.ParamByName('ANO').AsString := EdAno.Text;
        IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(StrToInt(EdAno.Text),01,01);
        IBSQL2.ParamByName('FECHA2').AsDate := EncodeDate(StrToInt(EdAno.Text),12,31);
        try
          IBSQL2.ExecQuery;
          if Tipo = 1 then begin
             SaldoApo := SaldoApo + IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;

          end
          else if Tipo = 2 then begin
             SaldoAho := SaldoAho + IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
             IBSQL3.Close;
             IBSQL3.SQL.Clear;
             IBSQL3.SQL.Add('select sum(VALOR_DEBITO) as DEBITO, sum(VALOR_CREDITO) as CREDITO from "cap$extracto" where');
             IBSQL3.SQL.Add('ID_AGENCIA = :ID_AGENCIA AND ID_TIPO_CAPTACION = :TIPO AND NUMERO_CUENTA = :CUENTA AND');
             IBSQL3.SQL.Add('DIGITO_CUENTA = :DIGITO AND ID_TIPO_MOVIMIENTO IN (7,8,15,16) AND');
             IBSQL3.SQL.Add('FECHA_MOVIMIENTO BETWEEN :FECHA1 AND :FECHA2');
             IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Ag;
             IBSQL3.ParamByName('TIPO').AsInteger := Tipo;
             IBSQL3.ParamByName('CUENTA').AsInteger := Cuenta;
             IBSQL3.ParamByName('DIGITO').AsInteger := Digito;
             IBSQL3.ParamByName('FECHA1').AsDate := EncodeDate(StrToInt(EdAno.Text),01,01);
             IBSQL3.ParamByName('FECHA2').AsDate := EncodeDate(StrToInt(EdAno.Text),12,31);
             IBSQL3.ExecQuery;
             IntPagAho := IntPagAho + IBSQL3.FieldByName('DEBITO').AsCurrency;
//             SaldoRetFue := SaldoRetFue + IBSQL3.FieldByName('CREDITO').AsCurrency;

          end
          else if Tipo = 4 then begin
             SaldoJuv := SaldoJuv + IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
             IBSQL3.Close;
             IBSQL3.SQL.Clear;
             IBSQL3.SQL.Add('select sum(VALOR_DEBITO) as DEBITO, sum(VALOR_CREDITO) as CREDITO from "cap$extracto" where');
             IBSQL3.SQL.Add('ID_AGENCIA = :ID_AGENCIA AND ID_TIPO_CAPTACION = :TIPO AND NUMERO_CUENTA = :CUENTA AND');
             IBSQL3.SQL.Add('DIGITO_CUENTA = :DIGITO AND ID_TIPO_MOVIMIENTO IN (7,8,15,16) AND');
             IBSQL3.SQL.Add('FECHA_MOVIMIENTO BETWEEN :FECHA1 AND :FECHA2');
             IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Ag;
             IBSQL3.ParamByName('TIPO').AsInteger := Tipo;
             IBSQL3.ParamByName('CUENTA').AsInteger := Cuenta;
             IBSQL3.ParamByName('DIGITO').AsInteger := Digito;
             IBSQL3.ParamByName('FECHA1').AsDate := EncodeDate(StrToInt(EdAno.Text),01,01);
             IBSQL3.ParamByName('FECHA2').AsDate := EncodeDate(StrToInt(EdAno.Text),12,31);
             IBSQL3.ExecQuery;
             IntPagJuv := IntPagJuv + IBSQL3.FieldByName('DEBITO').AsCurrency;
//             SaldoRetFue := SaldoRetFue + IBSQL3.FieldByName('CREDITO').AsCurrency;

          end
          else if Tipo = 5 then begin
             SaldoCon := SaldoCon + IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
             IBSQL3.Close;
             IBSQL3.SQL.Clear;
             IBSQL3.SQL.Add('select SUM(VALOR_INICIAL) AS VALOR, SUM(RETEFUENTE_ACUMULADA) AS RETEFUENTE, SUM(CAUSACION_ACUMULADA) AS CAUSACION from "cap$causacioncon"');
             IBSQL3.SQL.Add('where ID_AGENCIA = :ID_AGENCIA AND ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION AND');
             IBSQL3.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA AND ANO = :ANO AND MES = :MES');
             IBSQL3.ParamByName('ID_AGENCIA').AsInteger := Ag;
             IBSQL3.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
             IBSQL3.ParamByName('ID_IDENTIFICACION').AsInteger :=  DBLCBTipoIdentificacion.KeyValue;
             IBSQL3.ParamByName('ID_PERSONA').AsString := NumeroDoc;
             IBSQL3.ParamByName('ANO').AsInteger := StrToInt(EdAno.Text);
             IBSQL3.ParamByName('MES').AsInteger := 12;
             IBSQL3.ExecQuery;
             IntPagCon := IBSQL3.FieldByName('CAUSACION').AsCurrency;
             SaldoRetFue := SaldoRetFue + IBSQL3.FieldByName('RETEFUENTE').AsCurrency;
          end;
         except
          raise;
        end;
        Next;
     end;

    if SaldoApo > 0 then begin
      CDCuentas.Append;
      CDCuentas.FieldByName('TIPO').AsString := 'Saldo en Aportes';
      CDCuentas.FieldByName('SALDO').AsCurrency := SaldoApo;
      CDCuentas.Post;
    end;

    if SaldoAho > 0 then begin
      CDCuentas.Append;
      CDCuentas.FieldByName('TIPO').AsString := 'Saldo Ahorro Rindediario';
      CDCuentas.FieldByName('SALDO').AsCurrency := SaldoAho;
      CDCuentas.Post;
    end;

    if SaldoJuv > 0 then begin
      CDCuentas.Append;
      CDCuentas.FieldByName('TIPO').AsString := 'Saldo Ahorro Juvenil';
      CDCuentas.FieldByName('SALDO').AsCurrency := SaldoJuv;
      CDCuentas.Post;
    end;

    if SaldoCon > 0 then begin
      CDCuentas.Append;
      CDCuentas.FieldByName('TIPO').AsString := 'Saldo Ahorro Contractual';
      CDCuentas.FieldByName('SALDO').AsCurrency := SaldoCon;
      CDCuentas.Post;
    end;

{     lblEstado.Caption := 'Calculando Saldo e Intereses Contractual y Cdats';
     Application.ProcessMessages;

     Close;
     SQL.Clear;
     SQL.Add('select SUM(VALOR_INICIAL) AS VALOR, SUM(RETEFUENTE_ACUMULADA) AS RETEFUENTE, SUM(CAUSACION_ACUMULADA) AS CAUSACION from "cap$causacioncon"');
     SQL.Add('where ID_AGENCIA = :ID_AGENCIA AND ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION AND');
     SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA AND ANO = :ANO AND MES = :MES');
     ParamByName('ID_AGENCIA').AsInteger := Ag;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
     ParamByName('ID_IDENTIFICACION').AsInteger :=  DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     ParamByName('ANO').AsInteger := StrToInt(EdAno.Text);
     ParamByName('MES').AsInteger := 12;
     try
       ExecQuery;
       SaldoCon := FieldByName('VALOR').AsCurrency;
       IntPagCon := FieldByName('CAUSACION').AsCurrency;
       SaldoRetFue := SaldoRetFue + FieldByName('RETEFUENTE').AsCurrency;
       if SaldoCon > 0 then begin
         CDCuentas.Append;
         CDCuentas.FieldByName('TIPO').AsString := 'Saldo Ahorro Contractual';
         CDCuentas.FieldByName('SALDO').AsCurrency := SaldoCon;
         CDCuentas.Post;
       end;
     except
       raise;
     end;     }


     Close;
     SQL.Clear;
     SQL.Add('select SUM(VALOR_INICIAL) AS VALOR, SUM(RETEFUENTE_TOTAL) AS RETEFUENTE, SUM(CAUSACION_TOTAL) AS CAUSACION from "cap$causacioncdat"');
     SQL.Add('where ID_AGENCIA = :ID_AGENCIA AND ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION AND');
     SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA AND ANO = :ANO AND MES = :MES');
     ParamByName('ID_AGENCIA').AsInteger := Ag;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 6;
     ParamByName('ID_IDENTIFICACION').AsInteger :=  DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     ParamByName('ANO').AsInteger := StrToInt(EdAno.Text);
     ParamByName('MES').AsInteger := 12;
     try
       ExecQuery;
       SaldoCdat := FieldByName('VALOR').AsCurrency;
       IntPagCdat := FieldByName('CAUSACION').AsCurrency;
//       SaldoRetFue := SaldoRetFue + FieldByName('RETEFUENTE').AsCurrency;
       Close;
       if SaldoCdat > 0 then begin
         CDCuentas.Append;
         CDCuentas.FieldByName('TIPO').AsString := 'Saldo CDATS';
         CDCuentas.FieldByName('SALDO').AsCurrency := SaldoCdat;
         CDCuentas.Post;
       end;
     except
       raise;
     end;

     CDCuentas.Append;
     CDCuentas.FieldByName('TIPO').AsString := 'Intereses Pagados y Causados';
     CDCuentas.FieldByName('SALDO').AsCurrency := IntPagAho + IntPagJuv + IntPagCon + IntPagCdat;
     CDCuentas.Post;

     Close;
     SQL.Clear;
     SQL.Add('select SUM(RETENCION - DEVOLUCION) AS VALOR from "dian$retefuente"');
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and CODIGO = :CODIGO');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     ParamByName('CODIGO').AsString := '244535000000000000';
     try
      ExecQuery;
      SaldoRetFue := SaldoRetFue + FieldByName('VALOR').AsCurrency;
     except
      raise;
     end;

     CDCuentas.Append;
     CDCuentas.FieldByName('TIPO').AsString := 'Retención en la Fuente';
     CDCuentas.FieldByName('SALDO').AsCurrency := SaldoRetFue;
     CDCuentas.Post;

// Colocaciones

     lblEstado.Caption := 'Obteniendo Saldos de Colocaciones';
     Application.ProcessMessages;

     Close;
     SQL.Clear;
     SQL.Add('select SUM("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS DEUDA from "col$colocacion"');
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_ESTADO_COLOCACION NOT IN (4,5)');
{     SQL.Add('select distinct ("col$extracto".SALDO_ANTERIOR_EXTRACTO - "col$extracto".ABONO_CAPITAL) AS DEUDA from "col$extracto"');
     SQL.Add('inner join "col$colocacion" on ("col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_ESTADO_COLOCACION NOT IN (4,5)');
     SQL.Add('AND FECHA_EXTRACTO <= :FECHA_CORTE ORDER BY FECHA_EXTRACTO DESC');}
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     //ParamByName('FECHA_CORTE').AsDate := EncodeDate(StrToInt(EdAno.Text),12,31);
     try
      ExecQuery;
      SaldoCre := FieldByName('DEUDA').AsCurrency;
      if SaldoCre > 0 then begin
        CDCuentas.Append;
        CDCuentas.FieldByName('TIPO').AsString := 'Saldo en Créditos';
        CDCuentas.FieldByName('SALDO').AsCurrency := SaldoCre;
        CDCuentas.Post;
      end;
     except
      raise;
     end;

// Intereses Recibidos

     lblEstado.Caption := 'Obteniendo Intereses Recibidos';
     Application.ProcessMessages;

     Close;
     SQL.Clear;
     SQL.Add('select SUM(VALOR) as VALOR from "dian$interesesrecibidos"');
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     try
      ExecQuery;
      SaldoIntRec := FieldByName('VALOR').AsCurrency;
      if SaldoIntRec > 0 then begin
        CDCuentas.Append;
        CDCuentas.FieldByName('TIPO').AsString := 'Intereses Recibidos por Créditos';
        CDCuentas.FieldByName('SALDO').AsCurrency := SaldoIntRec;
        CDCuentas.Post;
      end;
     except
      raise;
     end;

//
     Close;
     SQL.Clear;
     SQL.Add('select * from "con$retefuentecsc" where ID_PERSONA = :ID_PERSONA');
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     try
      ExecQuery;
      if RecordCount <1 then
      begin
         Numero := ObtenerConsecutivoReteFuente(Self.IBDatabase1);
         IBSQL2.Close;
         IBSQL2.SQL.Clear;
         IBSQL2.SQL.Add('insert into "con$retefuentecsc" values (:ID_PERSONA,:CSC)');
         IBSQL2.ParamByName('ID_PERSONA').AsString := NumeroDoc;
         IBSQL2.ParamByName('CSC').AsInteger := Numero;
         try
          IBSQL2.ExecQuery;
         except
          raise;
         end;
      end
      else
         Numero := FieldByName('CSC').AsInteger;
     except
      raise;
     end;
      Transaction.Commit;
      IBDatabase1.Close;
   end; // end with

   lblEstado.Caption := 'Generando Certificado';
   Application.ProcessMessages;
   with prReport1 do begin
     Variables.ByName['NUMERO'].AsInteger := Numero;
     Variables.ByName['ASOCIADO'].AsString := Asociado;
     Variables.ByName['DIRECCION'].AsString := Direccion;
     Variables.ByName['CIUDAD'].AsString := Ciudad1;
     Variables.ByName['TIPODOC'].AsString := TipoDoc;
     Variables.ByName['NUMERODOC'].AsString := NumeroDoc;
     Variables.ByName['ANO'].AsString := EdAno.Text;
     Variables.ByName['TASA'].AsDouble := EdTasa.Value;
     Variables.ByName['CIUDADCON'].AsString := Ciudad;
     Variables.ByName['SALDOAPO'].AsDouble := SaldoApo;
     Variables.ByName['SALDOCAP'].AsDouble := SaldoCap;
     Variables.ByName['SALDOINTPAG'].AsDouble := SaldoIntPag;
     Variables.ByName['SALDORETFUE'].AsDouble := SaldoRetFue;
     Variables.ByName['SALDOCRE'].AsDouble := SaldoCre;
     Variables.ByName['SALDOINTREC'].AsDouble := SaldoIntRec;
     Variables.ByName['ANOACTUAL'].AsInteger := StrToInt(EdAno.Text) + 1;

     if PrepareReport then
       PreviewPreparedReport(True);
   end;




end;

procedure TfrmCertificaReteFuenteCap.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCertificaReteFuenteCap.Inicializar;
begin
        with IBQuery1 do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Close;
         Open;
         Last;
        end;

        EdAno.Text := IntToStr(YearOf(ffechaactual) - 1);
//        EdAno.Text := '2005';

end;

procedure TfrmCertificaReteFuenteCap.FormCreate(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmCertificaReteFuenteCap.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        IBQuery1.Transaction.Commit;
end;

procedure TfrmCertificaReteFuenteCap.btnOtroClick(Sender: TObject);
begin
        btnGenerar.Enabled := True;
        EdNumeroIdentificacion.Text := '';
        EdNombre.Caption := '';
        DBLCBTipoIdentificacion.SetFocus;
end;

end.


{     SQL.Clear;
     SQL.Add('select SUM(VALOR) as VALOR from "dian$saldosdepositos" where');
     SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and');
     SQL.Add('ID_PERSONA = :ID_PERSONA');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     try
      ExecQuery;
      SaldoCap := FieldByName('VALOR').AsCurrency;
      Close;
     except
      raise;
     end;

     lblEstado.Caption := 'Calculando Saldo Intereses Pagados';

     Close;
     SQL.Clear;
     SQL.Add('select SUM(VALOR) as VALOR from "dian$interesespagos"');
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     try
      ExecQuery;
      SaldoIntPag := FieldByName('VALOR').AsCurrency;
     except
      raise;
     end;

// Retefuente aplicada
     lblEstado.Caption := 'Calculando Saldo Retefuente Aplicada';


     Close;
     SQL.Clear;
     SQL.Add('select SUM(RETENCION - DEVOLUCION) AS VALOR from "dian$retefuente"');
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     try
      ExecQuery;
      SaldoRetFue := FieldByName('VALOR').AsCurrency;
     except
      raise;
     end;  }
