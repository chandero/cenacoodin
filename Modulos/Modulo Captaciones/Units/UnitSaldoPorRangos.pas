unit UnitSaldoPorRangos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DateUtils, Dialogs, StdCtrls, JvEdit, JvTypedEdit, DB, DBClient, ComCtrls, Buttons,
  ExtCtrls, DataSetToExcel, IBSQL, IBCustomDataSet, IBQuery, UnitDmGeneral;

type
  TfrmSaldoPorRango = class(TForm)
    Label2: TLabel;
    JvEdadIni: TJvIntegerEdit;
    Label1: TLabel;
    JvEdadFin: TJvIntegerEdit;
    Label3: TLabel;
    Panel2: TPanel;
    CmdGenerar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label4: TLabel;
    EdFechaCorte: TDateTimePicker;
    CDSsaldoporrango: TClientDataSet;
    CDSsaldoporrangoID_PERSONA: TStringField;
    CDSsaldoporrangoNOMBRE: TStringField;
    CDSsaldoporrangoPRIMER_APELLIDO: TStringField;
    CDSsaldoporrangoSEGUNDO_APELLIDO: TStringField;
    CDSsaldoporrangoAPORTES: TCurrencyField;
    CDSsaldoporrangoAHORROS: TCurrencyField;
    SD1: TSaveDialog;
    IBSQL1: TIBSQL;
    IBQuery1: TIBQuery;
    btnAExcel: TBitBtn;
    IBSQL2: TIBSQL;
    CDSsaldoporrangoEDAD: TIntegerField;
    CDSsaldoporrangoFECHA_NACIMIENTO: TDateField;
    rgTipo: TRadioGroup;
    procedure CmdGenerarClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure JvEdadIniKeyPress(Sender: TObject; var Key: Char);
    procedure JvEdadFinKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaCorteKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   function Saldo(Ag, Tipo, Cuenta, Digito: integer): currency;
  public
    { Public declarations }
  end;

var
  frmSaldoPorRango: TfrmSaldoPorRango;

implementation

uses UnitPantallaProgreso, UnitGlobales;

{$R *.dfm}



procedure TfrmSaldoPorRango.CmdGenerarClick(Sender: TObject);
var
  Total, Ano, Ag, Tipo, Edad, TipoCap: Integer;
  Numero, Digito: String;
  FechaInicial: TDate;
  FechaFinal: TDate;
  SaldoAportes, SaldoAhorros : Currency;
begin
        if dmGeneral.IBTransaction1.InTransaction then
        begin
              dmGeneral.IBTransaction1.Commit;
        end;
        dmGeneral.IBTransaction1.StartTransaction;
        Ano := DBAnho;
        FechaInicial := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
        FechaFinal := EdFechaCorte.Date;

        if (rgTipo.ItemIndex = 0) then
        begin
           TipoCap := 1;
        end
        else
        begin
           TipoCap := 4;
        end;

        with IBSQL1 do
        begin
            ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCap;
            ExecQuery;
            Total := FieldByName('TOTAL').AsInteger;
        end;

        with IBQuery1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('m.ID_AGENCIA, m.ID_TIPO_CAPTACION, m.NUMERO_CUENTA,');
           SQL.Add('p.ID_PERSONA,p.ID_IDENTIFICACION,');
           SQL.Add('p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, p.NOMBRE, p.FECHA_NACIMIENTO');
           SQL.Add(' FROM ');
           SQL.Add('"cap$maestro" m ');
           SQL.Add('INNER JOIN "cap$maestrotitular" t on ((m.ID_AGENCIA = t.ID_AGENCIA)');
           SQL.Add('AND (m.ID_TIPO_CAPTACION = t.ID_TIPO_CAPTACION)');
           SQL.Add('AND (m.NUMERO_CUENTA = t.NUMERO_CUENTA) AND (m.DIGITO_CUENTA = t.DIGITO_CUENTA))');
           SQL.Add('INNER JOIN "gen$persona" p on ((t.ID_IDENTIFICACION = p.ID_IDENTIFICACION) AND (t.ID_PERSONA = p.ID_PERSONA))');
           SQL.Add('INNER JOIN "cap$tiposestado" e on (e.ID_ESTADO = m.ID_ESTADO)');           
           SQL.Add('WHERE');
           SQL.Add('m.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION ');
           SQL.Add(' and e.SE_SUMA <> 0');
           if (Tipo = 4 ) then
           begin
               SQL.Add(' and m.NUMERO_TITULAR = 2');
           end;
           SQL.Add('ORDER BY');
           SQL.Add('p.PRIMER_APELLIDO');
           ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCap;
           Open;
           frmProgreso := TfrmProgreso.Create(Self);
           frmProgreso.Caption := 'Generando Reporte Por Rango: '+ IntToStr(JvEdadIni.Value) + ' y '+ IntToStr(JvEdadFin.Value) + ' Años';
           frmProgreso.Max := total;
           frmProgreso.Min := 0;
           frmProgreso.Ejecutar;

           CDSsaldoporrango.Close;
           CDSsaldoporrango.Open;
           CDSsaldoporrango.EmptyDataSet;

           while not Eof do
           begin
              frmProgreso.InfoLabel := 'Registro No ' + IntToStr(RecNo);
              frmProgreso.Position := RecNo;
              Application.ProcessMessages;
              //Buscar Cuentas y Leer Saldos
              Ag     := FieldByName('ID_AGENCIA').AsInteger;
              Tipo   := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              Numero := FieldByName('NUMERO_CUENTA').AsString;
              // Buscar Saldo Aportes
              if (TipoCap = 1) then
              begin
                Tipo := 1;
                Digito := DigitoControl(Tipo, Numero);
                SaldoAportes := Saldo(Ag, Tipo, StrToInt(Numero), StrToInt(Digito));
                Tipo := 2;
                Digito := DigitoControl(Tipo, Numero);
                SaldoAhorros := Saldo(Ag, Tipo, StrToInt(Numero), StrToInt(Digito));
              end
              else
              begin
                SaldoAportes := 0;
                Tipo := 4;
                Digito := DigitoControl(Tipo, Numero);
                SaldoAhorros := Saldo(Ag, Tipo, StrToInt(Numero), StrToInt(Digito));
              end;
              Edad := DiasEntre(IBQuery1.FieldByName('FECHA_NACIMIENTO').AsDateTime, EdFechaCorte.Date);
              Edad := (Edad div 365);
              if (Edad >= JvEdadIni.Value) and (Edad <= JvEdadFin.Value) then
              begin
                CDSsaldoporrango.Append;
                CDSsaldoporrangoID_PERSONA.Value := IBQuery1.FieldByName('ID_PERSONA').AsString;
                CDSsaldoporrangoNOMBRE.Value := IBQuery1.FieldByName('NOMBRE').AsString;
                CDSsaldoporrangoPRIMER_APELLIDO.Value := IBQuery1.FieldByName('PRIMER_APELLIDO').AsString;
                CDSsaldoporrangoSEGUNDO_APELLIDO.Value := IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString;
                CDSsaldoporrangoEDAD.Value := Edad;
                CDSsaldoporrangoFECHA_NACIMIENTO.Value := IBQuery1.FieldByName('FECHA_NACIMIENTO').AsDateTime;
                CDSsaldoporrangoAPORTES.Value := SaldoAportes;
                CDSsaldoporrangoAHORROS.Value := SaldoAhorros;
                CDSsaldoporrango.Post;
              end;
              Next;
           end;
           frmProgreso.Close;
           ShowMessage('Proceso finalizado, por favor exporte el archivo a Excel');
           CmdGenerar.Enabled := false;
       end;
end;

function TfrmSaldoPorRango.Saldo(Ag, Tipo, Cuenta,
  Digito: integer): currency;
var
  FechaInicial : TDate;
  FechaFinal : TDate;
begin
        FechaInicial := EncodeDate(DBAnho, 01, 01);
        FechaFinal := EdFechaCorte.Date;
        with IBSQL2 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
            ParamByName('AG').AsInteger := Ag;
            ParamByName('TP').AsInteger := Tipo;
            ParamByName('CTA').AsInteger := Cuenta;
            ParamByName('DGT').AsInteger := Digito;
            ParamByName('ANO').AsInteger := DBAnho;
            ParamByName('FECHA1').AsDate := FechaInicial;
            ParamByName('FECHA2').AsDate := FechaFinal;
            ExecQuery;
            Result := FieldByName('SALDO_ACTUAL').AsCurrency;
        end;
end;

procedure TfrmSaldoPorRango.btnAExcelClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          SD1.Title := 'Nombre Para El Archivo de Saldos';
          if (SD1.Execute) then
          begin
           CDSsaldoporrango.Filtered := False;
           CDSsaldoporrango.First;
           ExcelFile := TDataSetToExcel.Create(CDSsaldoporrango,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

procedure TfrmSaldoPorRango.JvEdadIniKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmSaldoPorRango.JvEdadFinKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmSaldoPorRango.EdFechaCorteKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmSaldoPorRango.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := fFechaActual;
end;

end.
