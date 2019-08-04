unit UnitDescuentoContractual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, JvTypedEdit, Buttons, DBCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, DateUtils;

type
  TFrmDescuentoContractual = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdComprobante: TStaticText;
    sTitularContractual: TStaticText;
    Label3: TLabel;
    JvNumero: TJvIntegerEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    sTitularCuenta: TStaticText;
    jvCuenta: TJvIntegerEdit;
    Panel1: TPanel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    sValorCuota: TStaticText;
    sFechaDescuento: TStaticText;
    Label9: TLabel;
    sSaldo: TStaticText;
    Label10: TLabel;
    sDisponible: TStaticText;
    btAplicar: TBitBtn;
    btReporte: TBitBtn;
    btCancelar: TBitBtn;
    btCerrar: TBitBtn;
    IBTiposCaptacion: TIBQuery;
    DSTiposCaptacion: TDataSource;
    IBQuery1: TIBQuery;
    sDigitoCuenta: TStaticText;
    sDigitoContractual: TStaticText;
    procedure btCerrarClick(Sender: TObject);
    procedure Inicio;
    procedure FormCreate(Sender: TObject);
    procedure JvNumeroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDescuentoContractual: TFrmDescuentoContractual;
  _cValorCuota :Currency;
  _cDisponible :Currency;
  _cSaldo :Currency;

implementation

uses UnitdmGeneral, UnitGlobales;

{$R *.dfm}

procedure TFrmDescuentoContractual.btCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmDescuentoContractual.Inicio;
begin
     if dmGeneral.IBTransaction1.InTransaction then
        dmGeneral.IBTransaction1.Rollback;
     dmGeneral.IBTransaction1.StartTransaction;
     IBTiposCaptacion.Open;
     IBTiposCaptacion.Last;
     DBLCBTipoCaptacion.KeyValue := 2;
end;

procedure TFrmDescuentoContractual.FormCreate(Sender: TObject);
begin
        Inicio;
end;

procedure TFrmDescuentoContractual.JvNumeroExit(Sender: TObject);
var
        _dFechaIni :TDate;
        _dFechaFin :TDate;
        _dFechaDescuento :TDate;
        _iDigitoContractual :Integer;
begin
        _dFechaIni := EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),1);
        _dFechaFin := EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DaysInMonth(fFechaActual));
        //ShowMessage(DateToStr(_dFechaIni) + ' ' + DateToStr(_dFechaFin));
        _iDigitoContractual := StrToInt(DigitoControl(5,format('%.7d',[Jvnumero.value])));
        sDigitoContractual.Caption := IntToStr(_iDigitoContractual);
        with IBQuery1 DO
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT CUOTA FROM "cap$maestro" WHERE NUMERO_CUENTA = :NUMERO_CUENTA');
          SQL.Add('AND ID_TIPO_CAPTACION = 5 and ID_ESTADO = 1');
          if RecordCount = 0 then
          begin
            ShowMessage('La Captación no se Encuentra Activa, Favor Revise');
            Exit;
          end;
          _cValorCuota := FieldByName('CUOTA').AsCurrency;
          Close;
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) AS MOVIMIENTO FROM "cap$extracto" WHERE');
          SQL.Add('"cap$extracto".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('"cap$extracto".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('"cap$extracto".NUMERO_CUENTA = :NUMERO_CUENTA and');
          SQL.Add('"cap$extracto".DIGITO_CUENTA = :DIGITO_CUENTA and');
          SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA');
          ParamByName('FECHA1').AsDateTime := _dFechaIni;
          ParamByName('FECHA2').AsDateTime := _dFechaFin;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
          ParamByName('NUMERO_CUENTA').AsInteger := JvNumero.Value;
          ParamByName('DIGITO_CUENTA').AsInteger := _iDigitoContractual;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          if FieldByName('MOVIMIENTO').AsInteger > 0 then
          begin
            ShowMessage('La Cuota para este mes ya fue Pagada, Favor revise');
            Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('SELECT FIRST 1 FECHA_DESCUENTO FROM "cap$tablaliquidacioncon" WHERE');
          SQL.Add('"cap$tablaliquidacioncon".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('"cap$tablaliquidacioncon".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('"cap$tablaliquidacioncon".NUMERO_CUENTA = :NUMERO_CUENTA and');
          SQL.Add('"cap$tablaliquidacioncon".DIGITO_CUENTA = :DIGITO_CUENTA and');
          SQL.Add('"cap$tablaliquidacioncon".FECHA_DESCUENTO <= :FECHA and');
          SQL.Add('"cap$tablaliquidacioncon".DESCONTADO = 0');
          SQL.Add('ORDER BY "cap$tablaliquidacioncon".FECHA_DESCUENTO ASC');
          Open;
          if RecordCount = 0 then
          begin
            ShowMessage('No existen Cuotas para Descontar, Favor revise');
          end;
          _dFechaDescuento := FieldByName('FECHA_DESCUENTO').AsDateTime;
        end;
        sValorCuota.Caption := CurrToStr(_cValorCuota);
        sFechaDescuento.Caption := DateToStr(_dFechaDescuento);
end;

end.
