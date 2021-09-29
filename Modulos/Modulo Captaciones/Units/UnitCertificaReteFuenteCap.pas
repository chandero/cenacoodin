unit UnitCertificaReteFuenteCap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons, ComCtrls, IBSQL,
  pr_Common, pr_TxClasses, pr_Classes, DB, IBCustomDataSet, IBQuery,
  IBDatabase, JvEdit, JvFloatEdit;

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
    IBSQL1: TIBSQL;
    EdNombre: TStaticText;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBSQL2: TIBSQL;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    Panel4: TPanel;
    Label4: TLabel;
    EdAno: TEdit;
    Label5: TLabel;
    EdTasa: TJvFloatEdit;
    lblEstado: TLabel;
    btnOtro: TBitBtn;
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
   IBDatabase1.Params.Values['User_Name'] := 'LDUARTE'; //'RETEFUENTE';
   IBDatabase1.Params.Values['PassWord'] := ''; //'retefuente';
   IBDatabase1.Params.Values['sql_role_name'] := 'CAPTACIONES';
   try
     IBDatabase1.Connected := True;
   except
     raise;
   end;
   
   SaldoCap    := 0;
   SaldoCre    := 0;
   SaldoIntPag := 0;
   SaldoRetFue := 0;
   SaldoIntRec := 0;

   TipoDoc := DBLCBTipoIdentificacion.Text;
   NumeroDoc := EdNumeroIdentificacion.Text;

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
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and ID_DIRECCION = 2');
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
     SQL.Add('Select "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
     SQL.Add('Where');
     SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
     SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
     SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION > 1 and "cap$maestrotitular".NUMERO_TITULAR = 1');
     SQL.Add('Order by "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString  := NumeroDoc;
     try
       ExecQuery;
       if RecordCount < 1 then begin
          Exit;
       end; // if
     except
       MessageDlg('Error al Buscar Total de Aportes',mtError,[mbok],0);
       Exit;
     end; // try

     lblEstado.Caption := 'Obteniendo Saldos e Intereses de Captaciones';
     Application.ProcessMessages;
     while not Eof do begin
        Ag := FieldByName('ID_AGENCIA').AsInteger;
        Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
        Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
        Digito := FieldByName('DIGITO_CUENTA').AsInteger;

        if Tipo < 6 then begin
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
          SaldoCap := SaldoCap + IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
        except
          raise;
        end;
        end;

        if Tipo = 6 then begin
          IBSQL2.Close;
          IBSQL2.SQL.Clear;
          IBSQL2.SQL.Add('select VALOR_INICIAL from "cap$causacioncdat"');
          IBSQL2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
          IBSQL2.SQL.Add('ANO = :ANO and MES = :MES');
          IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
          IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
          IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
          IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
          IBSQL2.ParamByName('ANO').AsInteger := StrToInt(EdAno.Text);
          IBSQL2.ParamByName('MES').AsInteger := 12;
          try
           IBSQL2.ExecQuery;
           SaldoCap := SaldoCap + IBSQL2.FieldByName('VALOR_INICIAL').AsCurrency;
          except
           raise;
          end;
        end;

        if Tipo < 5 then begin
          IBSQL2.Close;
          IBSQL2.SQL.Clear;
          IBSQL2.SQL.Add('select sum(VALOR_DEBITO) as DEBITO, sum(VALOR_CREDITO) as CREDITO FROM "cap$extracto"');
          IBSQL2.SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
          IBSQL2.SQL.Add('FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2 and');
          IBSQL2.SQL.Add('((ID_TIPO_MOVIMIENTO = 8) or (ID_TIPO_MOVIMIENTO = 16) or (ID_TIPO_MOVIMIENTO = 7) or (ID_TIPO_MOVIMIENTO = 15))');
          IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Ag;
          IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
          IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
          IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
          IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(StrToInt(EdAno.Text),01,01);
          IBSQL2.ParamByName('FECHA2').AsDate := EncodeDate(StrToInt(EdAno.Text),12,31);
          try
            IBSQL2.ExecQuery;
            SaldoIntPag := SaldoIntPag + IBSQL2.FieldByName('DEBITO').AsCurrency;
            SaldoRetFue := SaldoRetFue + IBSQL2.FieldByName('CREDITO').AsCurrency;
          except
            raise;
          end;
        end;
        Next;
     end; // end while


     lblEstado.Caption := 'Obteniendo Saldos de Colocaciones';
     Application.ProcessMessages;

     Close;
     SQL.Clear;
     SQL.Add('select SUM("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS DEUDA from "col$colocacion"');
     SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     try
      ExecQuery;
      SaldoCre := FieldByName('DEUDA').AsCurrency;
     except
      raise;
     end;

     lblEstado.Caption := 'Obteniendo Intereses Recibidos';
     Application.ProcessMessages;

     Close;
     SQL.Clear;
     SQL.Add('select');
     SQL.Add('sum("col$extracto".ABONO_CXC+"col$extracto".ABONO_ANTICIPADO+');
     SQL.Add('"col$extracto".ABONO_SERVICIOS+"col$extracto".ABONO_MORA) AS INTERES');
     SQL.Add('from "col$colocacion"');
     SQL.Add('inner join "col$extracto" on ("col$extracto".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
     SQL.Add('"col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
     SQL.Add('where "col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = :ID_PERSONA');
     ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     try
      ExecQuery;
      SaldoIntRec := FieldByName('INTERES').AsCurrency;
     except
      raise;
     end;

     Close;
     SQL.Clear;
     SQL.Add('select * from CON$RETEFUENTECSC where ID_PERSONA = :ID_PERSONA');
     ParamByName('ID_PERSONA').AsString := NumeroDoc;
     try
      ExecQuery;
      if RecordCount <1 then
      begin
         Numero := ObtenerConsecutivoReteFuente(Self.IBDatabase1);
         IBSQL2.Close;
         IBSQL2.SQL.Clear;
         IBSQL2.SQL.Add('insert into CON$RETEFUENTECSC values (:ID_PERSONA,:CSC)');
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
     Variables.ByName['SALDOCAP'].AsDouble := SaldoCap;
     Variables.ByName['SALDOINTPAG'].AsDouble := SaldoIntPag;
     Variables.ByName['SALDORETFUE'].AsDouble := SaldoRetFue;
     Variables.ByName['SALDOCRE'].AsDouble := SaldoCre;
     Variables.ByName['SALDOINTREC'].AsDouble := SaldoIntRec;

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
        end;
end;

procedure TfrmCertificaReteFuenteCap.FormCreate(Sender: TObject);
begin
        if IBQuery1.Transaction.InTransaction then
           IBQuery1.Transaction.Rollback;
        IBQuery1.Transaction.StartTransaction;
        IBQuery1.Open;
        IBQuery1.Last;
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
