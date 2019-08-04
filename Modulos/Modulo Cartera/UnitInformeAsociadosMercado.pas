unit UnitInformeAsociadosMercado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery, IBSQL, Dateutils,
  pr_Common, pr_TxClasses, pr_parser, DBClient;

type
  TfrmInformeAsociadosporMercado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdMunicipio: TEdit;
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    IBQTabla: TClientDataSet;
    IBQTablaAGENCIA: TIntegerField;
    IBQTablaCUENTA: TIntegerField;
    IBQTablaDIGITO: TIntegerField;
    IBQTablaNIT: TStringField;
    IBQTablaNOMBRE: TStringField;
    IBQTablaPRIMERAPELLIDO: TStringField;
    IBQTablaSEGUNDOAPELLIDO: TStringField;
    IBQTablaAPORTES: TCurrencyField;
    IBQTablaAHORROS: TCurrencyField;
    IBQTablaSALDODEUDA: TCurrencyField;
    IBQTablaCOLOCACION: TStringField;
    IBQTablaFECHAINTERES: TStringField;
    IBQTablaDIASMORA: TIntegerField;
    ReporteAsociados: TprTxReport;
    IBSQL3: TIBSQL;
    procedure EdMunicipio1Enter(Sender: TObject);
    procedure EdMunicipio1Exit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure ReporteAsociadosUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdMunicipioEnter(Sender: TObject);
    procedure EdMunicipioExit(Sender: TObject);
  private
    { Private declarations }
    function BuscarAhorros(TipoId: Integer; NumeroId: string;Cuenta:Integer): Currency;
    function BuscarAportes(TipoId: Integer; NumeroId: string;Cuenta:Integer): Currency;
  public
    { Public declarations }
  end;

var
  frmInformeAsociadosporMercado: TfrmInformeAsociadosporMercado;
  Municipio:string;
  TotalAportes:Currency;
  TotalAhorros:Currency;
  IdPersona:string;


implementation

{$R *.dfm}

uses  UnitDmGeneral, UnitGlobales, UnitGlobalesCol, UnitVistaPreliminar;

procedure TfrmInformeAsociadosporMercado.EdMunicipio1Enter(Sender: TObject);
begin
        EdMunicipio.SelectAll;
end;

procedure TfrmInformeAsociadosporMercado.EdMunicipio1Exit(
  Sender: TObject);
begin
        Municipio := UpperCase(EdMunicipio.Text);
        EdMunicipio.Text := Municipio;
end;

procedure TfrmInformeAsociadosporMercado.CmdAceptarClick(
  Sender: TObject);
var
Tabla:string;
Cuenta:Integer;
Documento:string;
No:Integer;
Fecha:TDate;
Tipo:string;
Amortiza,Dias:Integer;
begin
        If DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;

        DmGeneral.IBTransaction1.StartTransaction;

        No := 0;
        with IBSQL1 do
         begin
           sql.Clear;
           sql.Add('select ID_EMPLEADO, DOCUMENTO, PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ExecQuery;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
         end;

{           Tabla := '"Asociados' + FloatToStr(Now)+ '"';
           with IBQTabla do
            begin
              SQL.Clear;
              SQL.Add('create table ' + Tabla + ' (');
              SQL.Add('AGENCIA             INTEGER,');
              SQL.Add('CUENTA              INTEGER,');
              SQL.Add('DIGITO              INTEGER,');
              SQL.Add('NIT                 VARCHAR(15),');
              SQL.Add('NOMBRE              VARCHAR(255),');
              SQL.Add('PRIMERAPELLIDO      VARCHAR(30),');
              SQL.Add('SEGUNDOAPELLIDO     VARCHAR(30),');
              SQL.Add('APORTES             INTEGER,');
              SQL.Add('AHORROS             INTEGER,');
              SQL.Add('SALDODEUDA          INTEGER,');
              SQL.Add('FECHAINTERES        VARCHAR(10));');
              ExecSQL;
              Transaction.CommitRetaining;
              Close;
            end;  }

       //inicio
       
        with IBQuery1 do
         begin
           SQL.Clear;
           SQL.Add('select distinct');
           SQL.Add('"gen$persona".ID_IDENTIFICACION,');
           SQL.Add('"gen$persona".ID_PERSONA,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$persona".NOMBRE,');
           SQL.Add('"gen$direccion".MUNICIPIO,');
           SQL.Add('"col$colocacion".ID_AGENCIA,');
           SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) as SALDODEUDA,');
           SQL.Add('"col$colocacion".ID_COLOCACION,');
           SQL.Add('"col$colocacion".ID_AGENCIA,');
           SQL.Add('"col$colocacion".FECHA_INTERES,');
           SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
           SQL.Add('"col$tiposcuota".INTERES');
           SQL.Add('from "gen$persona"');
           SQL.Add('left join "col$colocacion" on ("gen$persona".ID_IDENTIFICACION = "col$colocacion".ID_IDENTIFICACION and "gen$persona".ID_PERSONA = "col$colocacion".ID_PERSONA)');
           SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
           SQL.Add('inner join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and "gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA)');
           SQL.Add('where');
           SQL.Add('"gen$persona".ID_PERSONA = :ID_PERSONA and');
           SQL.Add('"gen$persona".ID_TIPO_RELACION = 1 and');
           SQL.Add('"gen$direccion".ID_DIRECCION = 1 and');
           SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION <= 3');
           SQL.Add('order by "gen$persona".ID_PERSONA ASC');
           ParamByName('ID_PERSONA').AsString := Municipio;
           Open;
           Last;
           First;
           Documento := '';
           while not Eof do
           begin
             IBSQL1.Close;
             IBSQL1.SQL.Clear;
             IBSQL1.Sql.Add('select * from P_CAP_0008_JUD (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
             IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
             IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
             IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
             IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
             IBSQL1.ExecQuery;

             IBQTabla.Append;
             IBQTabla.FieldByName('AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
             IBQTabla.FieldByName('CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
             IBQTabla.FieldByName('DIGITO').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
             IBQTabla.FieldByName('NIT').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
             IBQTabla.FieldByName('NOMBRE').AsString := IBQuery1.FieldByName('NOMBRE').AsString;
             IBQTabla.FieldByName('COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
             Fecha := FieldByName('FECHA_INTERES').AsDateTime;
             Tipo := FieldByName('INTERES').AsString;
             Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
             if Tipo = 'V' then
                Fecha := CalculoFecha(Fecha,Amortiza);
             Dias := DiasEntre(Fecha,fFechaActual);
             IBQTabla.FieldByName('DIASMORA').AsInteger := Dias; //ObtenerDeudaHoy(Agencia,IBQuery1.FieldByName('ID_COLOCACION').AsString,IBSQL3).Dias;
             IBQTabla.FieldByName('PRIMERAPELLIDO').AsString := IBQuery1.FieldByName('PRIMER_APELLIDO').AsString;
             IBQTabla.FieldByName('SEGUNDOAPELLIDO').AsString := IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString;
             if FieldByName('ID_PERSONA').AsString <> Documento then
              begin
                IBQTabla.FieldByName('APORTES').AsCurrency := BuscarAportes(FieldByName('ID_IDENTIFICACION').AsInteger,FieldByName('ID_PERSONA').AsString,IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger);
                IBQTabla.FieldByName('AHORROS').AsCurrency := BuscarAhorros(FieldByName('ID_IDENTIFICACION').AsInteger,FieldByName('ID_PERSONA').AsString,IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger);
                Documento := FieldByName('ID_PERSONA').AsString;
              end
             else
              begin
                IBQTabla.FieldByName('APORTES').AsCurrency := 0;
                IBQTabla.FieldByName('AHORROS').AsCurrency := 0;
              end;
             IBQTabla.FieldByName('SALDODEUDA').AsCurrency := FieldByName('SALDODEUDA').AsCurrency;
             if FieldByName('FECHA_INTERES').AsDateTime <> 0 then
                IBQTabla.FieldByName('FECHAINTERES').AsString := DateToStr(FieldByName('FECHA_INTERES').AsDateTime)
             else
                IBQTabla.FieldByName('FECHAINTERES').AsString := '';
             if IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger <> Cuenta then
              begin
                No := No + 1;
                Cuenta := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
              end;
             Documento := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
             IBQTabla.Post;
             Next;
           end; //fin de while
           Close;
           IBSQL1.Close;
         end;
       // fin para el reporte
{         With IBQuery3 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * ');
            SQL.Add('from ' + Tabla + ' order by CUENTA');
            Open;
          end; }

         ReporteAsociados.Variables.ByName['Empresa'].AsString := Empresa;
         ReporteAsociados.Variables.ByName['Nit'].AsString := Nit;
         ReporteAsociados.Variables.ByName['No'].AsInteger := No;
         ReporteAsociados.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
         ReporteAsociados.Variables.ByName['Hoy'].AsDateTime := Date;
         ReporteAsociados.Variables.ByName['Municipio'].AsString := Municipio;

         if ReporteAsociados.PrepareReport then
          begin
            frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
            frmVistaPreliminar.Reporte := ReporteAsociados;
            frmVistaPreliminar.ShowModal;
          end;
         IBQuery3.Close;

    {     With IBQTabla do
          begin
            Close;
            SQL.Clear;
            SQL.Add('drop table ' + Tabla);
            Open;
            Close;
            Transaction.Commit;
            Transaction.StartTransaction;
          end;}
end;

function TfrmInformeAsociadosporMercado.BuscarAhorros(TipoId :Integer; NumeroID:string;Cuenta:Integer) : Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,DigitoCuentaAh,NumeroCuentaAh,Digito:Integer;
begin
           Digito := StrToInt(DigitoControl(2,FormatCurr('0000000',Cuenta)));

           with IBSQL2 do begin
                Close;
                SQL.Clear;
                SQL.Add('Select First 1 "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
                SQL.Add('Where');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 2');
                ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
                ParamByName('ID_PERSONA').AsString  := NumeroId;
                try
                  ExecQuery;
                  Ag := FieldByName('ID_AGENCIA').AsInteger;
                  Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  NumeroCuentaAh := FieldByName('NUMERO_CUENTA').AsInteger;
                  DigitoCuentaAh := FieldByName('DIGITO_CUENTA').AsInteger;
                except
                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   Result := 0;
                   Exit;
                end;

                Close;
                SQL.Clear;
                SQL.Add('Select "cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestro"');
                SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestro".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := Cuenta; //NumeroCuentaAh;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito; //DigitoCuentaAh;
                ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                try
                  ExecQuery;
                  if RecordCount < 1 then
                   Saldo := 0
                  else
                  Saldo := FieldByName('SALDO_INICIAL').AsCurrency;
                except
                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   Result := 0;
                   Exit;
                end;

                Close;
                SQL.Clear;
                SQL.Add('SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS MOVIMIENTO from "cap$maestro"');
                SQL.Add('LEFT JOIN "cap$extracto" ON ("cap$maestro".ID_AGENCIA = "cap$extracto".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$extracto".ID_TIPO_CAPTACION) AND ');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$extracto".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$extracto".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := Cuenta; //NumeroCuentaAh;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito; //DigitoCuentaAh;
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
                ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
                try
                  ExecQuery;
                  if RecordCount < 1 then
                   Movimiento := 0
                  else
                   Movimiento := FieldByName('MOVIMIENTO').AsCurrency;
                except
                   MessageDlg('Error Consultando Movimientos',mtError,[mbcancel],0);
                   Movimiento := 0;
                end;

                Close;
                SQL.Clear;
                SQL.Add('SELECT SUM("cap$canje".VALOR_CHEQUE + "cap$canje".VALOR_MONEDAS) AS CANJE');
                SQL.Add('FROM');
                SQL.Add('"cap$maestro"');
                SQL.Add('LEFT JOIN "cap$canje" ON ("cap$maestro".ID_AGENCIA = "cap$canje".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$canje".ID_TIPO_CAPTACION) AND ("cap$maestro".NUMERO_CUENTA = "cap$canje".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$canje".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$canje".LIBERADO = 0 and');
                SQL.Add('"cap$canje".DEVUELTO = 0');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := Cuenta; //NumeroCuentaAh;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito; //DigitoCuentaAh;
                try
                 ExecQuery;
                 if RecordCount < 1 then
                   Canje := 0
                 else
                   Canje := FieldByName('CANJE').AsCurrency;
                except
                   MessageDlg('Error Consultando Canje',mtError,[mbcancel],0);
                   Canje := 0;
                end;
         end;
         Saldo := Saldo + Movimiento;
         Disponible := Saldo - Canje;
         Result := Disponible;

end;

function TfrmInformeAsociadosporMercado.BuscarAportes(TipoId :Integer; NumeroID:string;Cuenta:Integer) : Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Digito,DigitoCuentaAp,NumeroCuentaAp:Integer;
begin
           Digito := StrToInt(DigitoControl(1,FormatCurr('0000000',Cuenta)));

           with IBSQL2 do begin
                Close;
                SQL.Clear;
                SQL.Add('Select First 1 "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
                SQL.Add('Where');
                SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
                SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
                SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1');
                ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
                ParamByName('ID_PERSONA').AsString  := NumeroId;
                try
                  ExecQuery;
                  Ag := FieldByName('ID_AGENCIA').AsInteger;
                  Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  NumeroCuentaAp := FieldByName('NUMERO_CUENTA').AsInteger;
                  DigitoCuentaAp := FieldByName('DIGITO_CUENTA').AsInteger;
                except
                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   Result := 0;
                   Exit;
                end;

                Close;
                SQL.Clear;
                SQL.Add('SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS MOVIMIENTO from "cap$maestro"');
                SQL.Add('LEFT JOIN "cap$extracto" ON ("cap$maestro".ID_AGENCIA = "cap$extracto".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$extracto".ID_TIPO_CAPTACION) AND ');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$extracto".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$extracto".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := Cuenta; //NumeroCuentaAp;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito; //DigitoCuentaAp;
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
                ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
                try
                  ExecQuery;
                  if RecordCount < 1 then
                   Movimiento := 0
                  else
                   Movimiento := FieldByName('MOVIMIENTO').AsCurrency;
                except
                   MessageDlg('Error Consultando Movimientos',mtError,[mbcancel],0);
                   Movimiento := 0;
                end;


                Close;
                SQL.Clear;
                SQL.Add('Select "cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestro"');
                SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestro".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := Cuenta; //NumeroCuentaAp;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito; //DigitoCuentaAp;
                ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                try
                  ExecQuery;
                  if RecordCount < 1 then
                   Saldo := 0
                  else
                  Saldo := FieldByName('SALDO_INICIAL').AsCurrency;
                except
                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   Result := 0;
                   Exit;
                end;

                Close;
                SQL.Clear;
                SQL.Add('SELECT SUM("cap$canje".VALOR_CHEQUE + "cap$canje".VALOR_MONEDAS) AS CANJE');
                SQL.Add('FROM');
                SQL.Add('"cap$maestro"');
                SQL.Add('LEFT JOIN "cap$canje" ON ("cap$maestro".ID_AGENCIA = "cap$canje".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$canje".ID_TIPO_CAPTACION) AND ("cap$maestro".NUMERO_CUENTA = "cap$canje".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$canje".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$canje".LIBERADO = 0 and');
                SQL.Add('"cap$canje".DEVUELTO = 0');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := Cuenta; //NumeroCuentaAp;
                ParamByName('DIGITO_CUENTA').AsInteger := Digito; //DigitoCuentaAp;
                try
                 ExecQuery;
                 if RecordCount < 1 then
                   Canje := 0
                 else
                   Canje := FieldByName('CANJE').AsCurrency;
                except
                   MessageDlg('Error Consultando Canje',mtError,[mbcancel],0);
                   Canje := 0;
                end;
         end;
         Saldo := Saldo + Movimiento;
         Disponible := Saldo - Canje;
         Result := Disponible;
end;

procedure TfrmInformeAsociadosporMercado.ReporteAsociadosUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var
Cuenta,Digito:string;
Ahorros,Aportes:Currency;
begin
    if (VarName = 'Cuenta') then
     begin
       with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select First 1 "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA,"cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestrotitular"');
          SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
          SQL.Add('Where');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
          SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1');
          ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString  := IBQuery1.FieldByName('ID_PERSONA').AsString;
          ExecQuery;
          Cuenta := FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger);
          Digito := IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
          Close;
        end;
      _vSetAsString(Value,Cuenta + '-' + Digito);
       IsProcessed := True;
     end;

    if (VarName = 'BuscarAhorros') then
     begin
       if IdPersona <> Trim(IBQuery1.FieldByName('ID_PERSONA').AsString) then
        begin
//          Ahorros := BuscarAhorros(IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger,IBQuery1.FieldByName('ID_PERSONA').AsString);
          TotalAhorros := TotalAhorros + Ahorros;
        end
       else
        Ahorros := 0;

//       IdPersona := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
       _vSetAsDouble(Value,Ahorros);
       IsProcessed := True;
     end;

    if (VarName = 'BuscarAportes') then
     begin
       if IdPersona <> Trim(IBQuery1.FieldByName('ID_PERSONA').AsString) then
        begin
//          Aportes := BuscarAportes(IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger,IBQuery1.FieldByName('ID_PERSONA').AsString);
          TotalAportes := TotalAportes + Aportes;
        end
       else
        Aportes := 0;

       IdPersona := Trim(IBQuery1.FieldByName('ID_PERSONA').AsString);
      _vSetAsDouble(Value,Aportes);
       IsProcessed := True;
     end;


end;

procedure TfrmInformeAsociadosporMercado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeAsociadosporMercado.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeAsociadosporMercado.FormShow(Sender: TObject);
begin
        TotalAportes := 0;
        TotalAhorros := 0;
end;

procedure TfrmInformeAsociadosporMercado.EdMunicipioEnter(
  Sender: TObject);
begin
        EdMunicipio.SelectAll;
end;

procedure TfrmInformeAsociadosporMercado.EdMunicipioExit(
  Sender: TObject);
begin
        Municipio := EdMunicipio.Text;
end;

end.
