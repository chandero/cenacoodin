unit UnitCierreAnual;

interface

uses
  Forms, DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, pr_Parser, IBSQL,
  DBCtrls, DBClient, UnitdmGeneral;

type
  Tfrmcierreanual = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdCodigoInicial: TMaskEdit;
    Label2: TLabel;
    EdCodigoFinal: TMaskEdit;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery1ID_AGENCIA: TSmallintField;
    IBQuery1ID_COMPROBANTE: TIntegerField;
    IBQuery1CODIGO: TIBStringField;
    IBQuery1DEBITO: TIBBCDField;
    IBQuery1CREDITO: TIBBCDField;
    IBQuery1ID_PERSONA: TIBStringField;
    IBQuery1ESTADOAUX: TIBStringField;
    IBQuery1FECHADIA: TDateField;
    IBQuery1DESCRIPCION: TMemoField;
    IBQuery1NOMBRE: TIBStringField;
    IBQuery1SALDOINICIAL: TIBBCDField;
    IBQuery1DESCRIPCION_AGENCIA: TIBStringField;
    IBQuery1NOMBRE1: TIBStringField;
    IBQuery1PRIMER_APELLIDO: TIBStringField;
    IBQuery1SEGUNDO_APELLIDO: TIBStringField;
    EdCtaI: TStaticText;
    EdCtaF: TStaticText;
    IBSQL1: TIBSQL;
    ReportAuxiliar: TprTxReport;
    IBTipoDocumento: TIBQuery;
    DSTipoDocumento: TDataSource;
    IBpuc: TIBQuery;
    IBSaldo: TIBQuery;
    CDsaldos: TClientDataSet;
    CDsaldoscodigo: TStringField;
    CDsaldosnombre: TStringField;
    CDsaldosdebito: TCurrencyField;
    CDsaldoscredito: TCurrencyField;
    Report1: TprTxReport;
    IBQuery3: TIBQuery;
    Label3: TLabel;
    EDcodigo: TMaskEdit;
    Ednombre: TEdit;
    Label4: TLabel;
    report10: TprTxReport;
    Panel3: TPanel;
    Label5: TLabel;
    EdFecha: TDateTimePicker;
    Label6: TLabel;
    EdMemo: TMemo;
    Panel4: TPanel;
    Label7: TLabel;
    EdNota: TStaticText;
    procedure EdCodigoInicialExit(Sender: TObject);
    procedure EdCodigoFinalExit(Sender: TObject);
    procedure EdCodigoInicialKeyPress(Sender: TObject; var Key: Char);
    procedure EdCodigoFinalKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaInicialKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaFinalKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaInicialExit(Sender: TObject);
    procedure EdFechaFinalExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure ReportAuxiliarUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure FormShow(Sender: TObject);
    procedure EDcodigoExit(Sender: TObject);
    procedure EDcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    function Empleado : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcierreanual  : Tfrmcierreanual;
  CodigoInicial   : String;
  CodigoFinal     : String;
  codigo_r        : string;
  FechaInicial    : TDate;
  FechaFinal      : TDate;
  Cadena          : String;
  SaldoMovimiento : Currency;
  SaldoInicial    : Currency;
  CodigoGrupo     : String;
  SumaSaldoCodigo : Currency;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure Tfrmcierreanual.EdCodigoInicialExit(Sender: TObject);
begin
        Cadena := EdCodigoInicial.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoInicial := Cadena;
        with IBSQL1 do begin
         Close;
         ParamByName('CODIGO').AsString := CodigoInicial;
         ExecQuery;
         if RecordCount > 0 then
            EdCtaI.Caption := FieldByName('NOMBRE').AsString
         else
            EdCtaI.Caption := 'NO SE ENCONTRO CODIGO';
        end;
end;

procedure Tfrmcierreanual.EdCodigoFinalExit(Sender: TObject);
begin
        Cadena := EdCodigoFinal.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoFinal := Cadena;
        with IBSQL1 do begin
         Close;
         ParamByName('CODIGO').AsString := CodigoFinal;
         ExecQuery;
         if RecordCount > 0 then
            EdCtaF.Caption := FieldByName('NOMBRE').AsString
         else
            EdCtaF.Caption := 'NO SE ENCONTRO CODIGO';
        end;


end;

procedure Tfrmcierreanual.EdCodigoInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure Tfrmcierreanual.EdCodigoFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure Tfrmcierreanual.EdFechaInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure Tfrmcierreanual.EdFechaFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure Tfrmcierreanual.EdFechaInicialExit(Sender: TObject);
begin
        //FechaInicial := EdFechaInicial.Date;
end;

procedure Tfrmcierreanual.EdFechaFinalExit(Sender: TObject);
begin
       // FechaFinal := EdFechaFinal.Date;
end;

procedure Tfrmcierreanual.CmdAceptarClick(Sender: TObject);
var
NomAgencia, tipo : String;
cansecutivo :Integer;
saldo_cuenta, movimiento,debito,credito,valor_d,valor_c,total:Currency;
begin
        if MessageDlg('Esta Seguro de Realizar la Operación',mtInformation,[mbyes,mbno],0) = mryes then
        begin
        CmdAceptar.Enabled := False;
        Application.ProcessMessages;
        Cansecutivo := ObtenerConsecutivo(IBSQL1,4);
        if IBpuc.Transaction.InTransaction then
           IBpuc.Transaction.Commit;
        IBpuc.Transaction.StartTransaction;
        CDsaldos.CancelUpdates;
        saldo_cuenta := 0;
        movimiento := 0;
        debito := 0;
        credito := 0;
        valor_d := 0;
        valor_c := 0;
        IBpuc.Close;
        IBpuc.ParamByName('COD_INICIAL').AsString := CodigoInicial;
        IBpuc.ParamByName('COD_FINAL').AsString := CodigoFinal;
        IBpuc.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBpuc.Open;
        while not IBpuc.Eof do
        begin
          saldo_cuenta := IBpuc.FieldByName('SALDOINICIAL').AsCurrency;
          IBSaldo.Close;
          IBSaldo.ParamByName('CODIGO').AsString := IBpuc.FieldByName('CODIGO').AsString;
          IBSaldo.ParamByName('ID_AGENCIA').AsInteger := Agencia;
          IBSaldo.Open;
          Movimiento := IBSaldo.FieldByName('SALDO').AsCurrency + saldo_cuenta;
          if movimiento < 0 then
          begin
             debito := ABS(movimiento);
             valor_d := valor_d + debito;
             credito := 0;
          end
          else
          begin
             credito := ABS(movimiento);
             valor_c := valor_c + credito;
             debito := 0;
          end;
          if ABS(movimiento) > 0 then
          begin
             CDsaldos.Append;
             CDsaldos.FieldValues['codigo'] := IBpuc.FieldByName('CODIGO').AsString;
             CDsaldos.FieldValues['nombre'] := IBpuc.FieldByName('NOMBRE').AsString;
             CDsaldos.FieldValues['debito'] := debito;
             CDsaldos.FieldValues['credito'] := credito;
             CDsaldos.Post;
          end;
          IBpuc.Next;
                    debito := 0;
          credito := 0;
          saldo_cuenta := 0;
          movimiento := 0;
        end;
                       if valor_c <> valor_d then
               begin
                  if valor_c > valor_d then
                     tipo := 'd'
                  else
                     tipo := 'c';
                  total := abs(valor_c - valor_d);
               end;
               credito := 0;credito := 0;
               if tipo = 'c' then
                  credito := total
               else
                  debito := total;
                  valor_d := valor_d + debito;
                  valor_c := valor_c + credito;
             CDsaldos.Append;
             CDsaldos.FieldValues['codigo'] := codigo_r;
             CDsaldos.FieldValues['nombre'] := Ednombre.Text;
             CDsaldos.FieldValues['debito'] := debito;
             CDsaldos.FieldValues['credito'] := credito;
             CDsaldos.Post;


        CDsaldos.IndexFieldNames := 'debito';

         with IBQuery1 do begin
         Close;
         sql.Clear;
         sql.Add('insert into "CON$COMPROBANTE" ("con$comprobante"."ID_COMPROBANTE",');
         sql.Add('"CON$COMPROBANTE"."FECHADIA", "CON$COMPROBANTE"."TIPO_COMPROBANTE",');
         sql.Add('"CON$COMPROBANTE"."ID_AGENCIA", "CON$COMPROBANTE"."DESCRIPCION",');
         sql.Add('"CON$COMPROBANTE"."TOTAL_DEBITO", "CON$COMPROBANTE"."TOTAL_CREDITO",');
         sql.Add('"CON$COMPROBANTE"."ESTADO", "CON$COMPROBANTE"."IMPRESO",');
         sql.Add('"CON$COMPROBANTE"."ANULACION","CON$COMPROBANTE".ID_EMPLEADO)');
         sql.Add('values (');
         sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
         sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
         sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION",:ID_EMPLEADO)');
         ParamByName('ID_COMPROBANTE').AsString:= IntToStr(cansecutivo);
         ParamByname('FECHADIA').AsDate := EdFecha.Date; //fFechaActual;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
         ParamByName('DESCRIPCION').AsBlob := EdMemo.Text;
         ParamByName('TOTAL_DEBITO').AsCurrency  := valor_d;
         ParamByName('TOTAL_CREDITO').AsCurrency  := valor_c;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByname('ANULACION').Clear;
         ParamByName('IMPRESO').AsInteger  := 0;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         Open;
         CDsaldos.First;
         while not CDsaldos.Eof do
         begin
         SQL.Clear;
         SQL.Add('insert into "CON$AUXILIAR" values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX", :"TIPO_COMPROBANTE")');
            ParamByName('ID_COMPROBANTE').AsString := IntToStr(cansecutivo);
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := EdFecha.Date;
            ParamByName('CODIGO').AsString := CDsaldos.FieldByName('codigo').AsString;
            ParamByName('DEBITO').AsCurrency := CDsaldos.FieldByName('debito').AsCurrency;
            ParamByName('CREDITO').AsCurrency := CDsaldos.FieldByName('credito').AsCurrency;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
          Open;
          CDsaldos.Next;
         end;
         Close;
        end;
        CmdAceptar.Enabled := False;
        IBpuc.Transaction.Commit;
        end;
        EdNota.Caption := Format('%.5d',[cansecutivo]);
end;

procedure Tfrmcierreanual.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

function Tfrmcierreanual.Empleado:String;
begin
        with IBQuery do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Result := FieldByName('NOMBRE').AsString + ' ' + FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
         end;
end;

procedure Tfrmcierreanual.ReportAuxiliarUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var
PrimerSaldo : Currency;
Nombres : String;
begin
    {if VarName = 'SALDOINICIAL' then
     begin
      PrimerSaldo := IBQuery1.FieldByName('SALDOINICIAL').AsCurrency ;
      CodigoGrupo := IBQuery1.fieldByName('CODIGO').AsString;
      SaldoMovimiento := 0;
      with IBQuery2 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('Select ');
         SQL.Add('"con$auxiliar".DEBITO,');
         SQL.Add('"con$auxiliar".CREDITO,');
         SQL.Add('"con$auxiliar".FECHA');
         SQL.Add('from "con$auxiliar"');
         SQL.Add('where ');
         SQL.Add('("con$auxiliar".ID_AGENCIA =:"ID_AGENCIA") and');
         SQL.Add('("con$auxiliar".CODIGO =:"CODIGO") and');
         SQL.Add('("con$auxiliar".FECHA <:"FECHA_INICIAL")');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('CODIGO').AsString := CodigoGrupo;
         ParamByName('FECHA_INICIAL').AsDate := EdFechaInicial.Date;
           case RGTipo.ItemIndex of
           0: begin
              SQL.Add('and (("con$auxiliar".ESTADOAUX = :"ESTADOAUX1") or ("con$auxiliar".ESTADOAUX = :"ESTADOAUX2"))');
              ParamByName('ESTADOAUX1').AsString := 'C';
              ParamByName('ESTADOAUX2').AsString := 'O';
              end;
           1: begin
              SQL.Add('and ("con$auxiliar".ESTADOAUX = :"ESTADOAUX")');
              ParamByName('ESTADOAUX').AsString := 'C';
              end;
           end;

         Open;

         IBQuery2.Last;
         IBQuery2.First;
         SaldoInicial := PrimerSaldo;
         While not IBQuery2.Eof do
          begin
            SaldoInicial := SaldoInicial +
                            (FieldByName('DEBITO').AsCurrency -
                            FieldByName('CREDITO').AsCurrency);
            next;
          end;
         _vSetAsDouble(Value,SaldoInicial);
         IsProcessed := True;
       end;
       SaldoMovimiento := SaldoInicial;
    end;

    if VarName = 'SALDOACTUAL' then
     begin
      SaldoMovimiento :=  SaldoMovimiento +
               (IBQuery1.FieldByName('DEBITO').AsCurrency -
                IBQuery1.FieldByName('CREDITO').AsCurrency);
      SumaSaldoCodigo := SaldoMovimiento;
      _vSetAsDouble(Value,SaldoMovimiento);
      IsProcessed := True;
     end;

    if (VarName = 'BENEFICIARIO') then
     begin
      Nombres := trim(IBQuery1.FieldByName('NOMBRE1').AsString) + ' ' +
                 trim(IBQuery1.FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
                 trim(IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString);
      _vSetAsString(Value,Nombres);
      IsProcessed := True;
     end;

              }
end;

procedure Tfrmcierreanual.FormShow(Sender: TObject);
begin
        {EdFechaInicial.Date := Date;
        EdFechaFinal.Date := Date;}
        EdFecha.Date := EncodeDate(YearOf(fFechaActual)-1,12,31);
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
end;

procedure Tfrmcierreanual.EDcodigoExit(Sender: TObject);

begin
        Cadena := EDcodigo.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        codigo_r := Cadena;
        with IBSQL1 do begin
         Close;
         ParamByName('CODIGO').AsString := Codigo_r ;
         ExecQuery;
         if RecordCount > 0 then
            Ednombre.Text := FieldByName('NOMBRE').AsString
         else
            Ednombre.Text := 'NO SE ENCONTRO CODIGO';
        end;

end;

procedure Tfrmcierreanual.EDcodigoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure Tfrmcierreanual.FormKeyPress(Sender: TObject; var Key: Char);
begin
  EnterTabs(Key,Self);
end;

procedure Tfrmcierreanual.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;

        IBQuery.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBTipoDocumento.Database := dmGeneral.IBDatabase1;
        IBpuc.Database := dmGeneral.IBDatabase1;
        IBSaldo.Database := dmGeneral.IBDatabase1;
        IBQuery3.Database := dmGeneral.IBDatabase1;

        IBQuery.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBTipoDocumento.Transaction := dmGeneral.IBTransaction1;
        IBpuc.Transaction := dmGeneral.IBTransaction1;
        IBSaldo.Transaction := dmGeneral.IBTransaction1;
        IBQuery3.Transaction := dmGeneral.IBTransaction1;

end;

end.
