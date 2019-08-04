unit UnitReimprimirCDAT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, JvTypedEdit, Buttons, ExtCtrls, FR_Class,
  NLetra, UnitDmGeneral, DB, IBCustomDataSet, IBQuery, UnitGlobales, UnitGlobalesCol,
  DBClient, Provider;

type
  TfrmReimprimirCDAT = class(TForm)
    Label1: TLabel;
    edNumero: TJvIntegerEdit;
    Panel1: TPanel;
    btnGenerar: TBitBtn;
    NLetra: TNLetra;
    frCdat: TfrReport;
    CmdCerrar: TBitBtn;
    IBQdata: TIBQuery;
    IBQbeneficiario: TIBQuery;
    CDSbeneficiario: TClientDataSet;
    DSPbeneficiario: TDataSetProvider;
    procedure btnGenerarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edNumeroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReimprimirCDAT: TfrmReimprimirCDAT;

implementation

{$R *.dfm}

procedure TfrmReimprimirCDAT.btnGenerarClick(Sender: TObject);
var
  SUMA, PAGADERO: String;
  _tasaNominal: Currency;
  _tasaEfectiva: Currency;
  _valor: Currency;
  _amortizacion: Integer;
  _idAgencia, _tipoCaptacion, _numeroCuenta, _digitoCuenta, _numeroAhorro: Integer;
  _nit, _documento, _: String;
  _asociado: String;
  _fechaApertura, _fechaVencimiento: TDate;
begin

        _idAgencia := Agencia;
        _tipoCaptacion := 6;
        _numeroCuenta := edNumero.Value;
        _digitoCuenta := StrToInt(DigitoControl(_tipoCaptacion, IntToStr(_numeroCuenta)));

        IBQdata.Close;
        IBQdata.SQL.Clear;
        IBQdata.SQL.Add('SELECT m.*, p.* FROM "cap$maestro" m ');
        IBQdata.SQL.Add('INNER JOIN "cap$maestrotitular" t ON m.ID_AGENCIA = t.ID_AGENCIA and m.ID_TIPO_CAPTACION = t.ID_TIPO_CAPTACION and m.NUMERO_CUENTA = t.NUMERO_CUENTA and m.DIGITO_CUENTA = t.DIGITO_CUENTA and t.NUMERO_TITULAR = 1');
        IBQdata.SQL.Add('INNER JOIN "gen$persona" p ON t.ID_IDENTIFICACION = p.ID_IDENTIFICACION and t.ID_PERSONA = p.ID_PERSONA');
        IBQdata.SQL.Add('WHERE m.ID_AGENCIA = :ID_AGENCIA and m.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and m.NUMERO_CUENTA = :NUMERO_CUENTA');
        IBQdata.ParamByName('ID_AGENCIA').AsInteger := _idAgencia;
        IBQdata.ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipoCaptacion;
        IBQdata.ParamByName('NUMERO_CUENTA').AsInteger := _numeroCuenta;
        IBQdata.Open;

        IBQbeneficiario.Close;
        IBQbeneficiario.SQL.Clear;
        IBQbeneficiario.SQL.Add('SELECT b.*, t.DESCRIPCION_PARENTESCO AS PARENTESCO FROM "cap$maestrobeneficiario" b');
        IBQbeneficiario.SQL.Add('INNER JOIN "gen$tiposparentesco" t ON b.ID_PARENTESCO = t.ID_PARENTESCO');
        IBQbeneficiario.SQL.Add('WHERE b.ID_AGENCIA = :ID_AGENCIA and b.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and b.NUMERO_CUENTA = :NUMERO_CUENTA');
        IBQbeneficiario.ParamByName('ID_AGENCIA').AsInteger := _idAgencia;
        IBQbeneficiario.ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipoCaptacion;
        IBQbeneficiario.ParamByName('NUMERO_CUENTA').AsInteger := _numeroCuenta;
        IBQbeneficiario.Open;

        _valor := IBQdata.FieldByName('VALOR_INICIAL').AsCurrency;
        _amortizacion := IBQdata.FieldByName('AMORTIZACION').AsInteger;
        _nit := Nit;
        _tasaEfectiva := IBQdata.FieldbyName('TASA_EFECTIVA').AsFloat;
        _documento := IBQdata.FieldByName('ID_PERSONA').AsString;
        _fechaApertura := IBQdata.FieldByName('FECHA_APERTURA').AsDateTime;
        _fechaVencimiento := IBQdata.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
        _asociado := IBQdata.FieldByName('NOMBRE').AsString + ' ' + IBQdata.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQdata.FieldByName('SEGUNDO_APELLIDO').AsString;
        _numeroAhorro := IBQdata.FieldByName('NUMERO_CUENTA_ABONO').AsInteger;


        NLetra.Numero := trunc(_valor);
        _tasaNominal := TasaNominalVencida(_tasaEfectiva, _amortizacion);

        SUMA := UpperCase(NLetra.Letras);

        if StrPos(PChar(SUMA), PChar('MIL')) <> nil then
        begin
            SUMA := SUMA + ' DE';
        end;
        SUMA := SUMA + ' PESOS ML';

        PAGADERO := 'CADA ' + IntToStr(_amortizacion) + ' DIAS';

        frCdat.LoadFromFile('Reporte\frCdat.frf');
        frCdat.Dictionary.Variables['NIT'] := QuotedStr(_nit);
        frCdat.Dictionary.Variables['NUMERO'] := _numeroCuenta;
        frCdat.Dictionary.Variables['VALOR'] := _valor;
        frCdat.Dictionary.Variables['DOCUMENTO'] := QuotedStr(_documento);
        frCdat.Dictionary.Variables['ASOCIADO'] := QuotedStr(_asociado);
        frCdat.Dictionary.Variables['SUMA'] := QuotedStr(SUMA);
        frCdat.Dictionary.Variables['PAGADERO'] := QuotedStr(PAGADERO);
        frCdat.Dictionary.Variables['FECHA_EXPEDICION'] := _fechaApertura;
        frCdat.Dictionary.Variables['FECHA_VENCIMIENTO'] := _fechaVencimiento;
        frCdat.Dictionary.Variables['CIUDAD'] := QuotedStr(Ciudad);
        frCdat.Dictionary.Variables['CUENTA'] := QuotedStr(IntToStr(_numeroAhorro));
        frCdat.Dictionary.Variables['TASA_EFECTIVA'] := _tasaEfectiva;
        frCdat.Dictionary.Variables['TASA_NOMINAL'] := _tasaNominal;

        if (frCdat.PrepareReport) then
          frCdat.ShowPreparedReport;

end;

procedure TfrmReimprimirCDAT.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReimprimirCDAT.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
end;

procedure TfrmReimprimirCDAT.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmReimprimirCDAT.edNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

end.
