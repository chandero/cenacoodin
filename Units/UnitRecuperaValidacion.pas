unit UnitRecuperaValidacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery,UnitGlobales;

type
  TFrmRecuperaValidacion = class(TForm)
    GroupBox1: TGroupBox;
    mObservacion: TMemo;
    Panel1: TPanel;
    btValidar: TButton;
    Button1: TButton;
    IBValidacion: TIBQuery;
    procedure Button1Click(Sender: TObject);
    procedure btValidarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidaMov;
    procedure ValidaCol;
    procedure ValidaRem;

  public
    { Public declarations }
  end;

var
  FrmRecuperaValidacion: TFrmRecuperaValidacion;
  FValidar: TValidarCap;
  CValidar:TValidarCol;
  _iIdCaja :Integer;
  _dFechaMov :TDateTime;

implementation
uses UnitValidarCaptacion, UnitValidarColocacion;

{$R *.dfm}

procedure TFrmRecuperaValidacion.Button1Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRecuperaValidacion.btValidarClick(Sender: TObject);
var
        _iTipo :Integer;
begin
        btValidar.Enabled := False;
        if Trim(mObservacion.Text) = '' then
        begin
          ShowMessage('Debe Colocar una Observación');
          Exit;
        end;
        with IBValidacion do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select ID_CAJA from CAJ$CAJAS where ID_EMPLEADO = :ID_EMPLEADO');
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          Open;
          _iIdCaja := FieldByName('ID_CAJA').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('SELECT FIRST 1 FECHAULT, TIPO FROM PRD$VALIDACAJA(:IDCAJA,:FECHA) ORDER BY FECHAULT DESC');
          ParamByName('IDCAJA').AsInteger := _iIdCaja;
          ParamByName('FECHA').AsDate := fFechaActual;
          Open;
          _iTipo := FieldByName('TIPO').AsInteger;
          _dFechaMov := FieldByName('FECHAULT').AsDateTime;
          //ShowMessage(DateTimeToStr(_dFechaMov));
          case _iTipo of
           1 : ValidaMov;
           2 : ValidaCol;
           3 : ValidaRem;
          end;
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO');
          SQL.Add('  "caj$controlvalida"(');
          SQL.Add('  IDCAJA,');
          SQL.Add('  OBSERVACION,');
          SQL.Add('  FECHAHORA)');
          SQL.Add('VALUES(');
          SQL.Add('  :IDCAJA,');
          SQL.Add('  :OBSERVACION,');
          SQL.Add('  :FECHAHORA)');
          ParamByName('IDCAJA').AsInteger := _iIdCaja;
          ParamByName('OBSERVACION').AsString := mObservacion.Text;
          ParamByName('FECHAHORA').AsDateTime := Date + Time;
          ExecSQL;
          Transaction.Commit;
        end;
        
end;

procedure TFrmRecuperaValidacion.ValidaMov;
begin
        with IBValidacion do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select  *  from "caj$movimiento" where ID_CAJA = :ID_CAJA');
           SQL.Add('AND FECHA_MOV = :FECHA');
           ParamByName('FECHA').AsDateTime := _dFechaMov;
           ParamByName('ID_CAJA').AsInteger := _iIdCaja;
           Open;
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := fFechaActual;
               FValidar.Caja :=  _iIdCaja;
               FValidar.Origen := FieldByName('ORIGEN_MOVIMIENTO').AsInteger;
               FValidar.Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               FValidar.Operacion := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
               FValidar.Agencia := Agencia;
               FValidar.Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
               FValidar.Documento := FieldByName('DOCUMENTO').AsInteger;
               FValidar.Billetes := FieldByName('BILLETES').AsInteger;
               FValidar.Monedas := FieldByName('MONEDAS').AsInteger;
               FValidar.Cheques := FieldByName('CHEQUES').AsInteger;
               IBValidacion.Close;
               IBValidacion.SQL.Clear;
               IBValidacion.SQL.Add('SELECT');
               IBValidacion.SQL.Add('  "gen$persona".NOMBRE,');
               IBValidacion.SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
               IBValidacion.SQL.Add('  "gen$persona".PRIMER_APELLIDO');
               IBValidacion.SQL.Add('FROM');
               IBValidacion.SQL.Add('  "gen$persona"');
               IBValidacion.SQL.Add('  INNER JOIN "cap$maestrotitular" ON ("gen$persona".ID_IDENTIFICACION = "cap$maestrotitular".ID_IDENTIFICACION)');
               IBValidacion.SQL.Add('  AND ("gen$persona".ID_PERSONA = "cap$maestrotitular".ID_PERSONA)');
               IBValidacion.SQL.Add('WHERE');
               IBValidacion.SQL.Add('  "cap$maestrotitular".ID_AGENCIA = :ID_AGENCIA AND');
               IBValidacion.SQL.Add('  "cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION AND');
               IBValidacion.SQL.Add('  "cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA AND');
               IBValidacion.SQL.Add('  "cap$maestrotitular".NUMERO_TITULAR = 1 AND');
               IBValidacion.SQL.Add('  "cap$maestrotitular".TIPO_TITULAR = 1');
               IBValidacion.Open;
               FValidar.Nombre := IBValidacion.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                  IBValidacion.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                  IBValidacion.FieldByName('NOMBRE').AsString;
               IBValidacion.Close;
               Validar := FValidar;
               ShowModal;
               Free;
           end;
        end;
end;

procedure TFrmRecuperaValidacion.ValidaCol;
var
        _sIdColocacion :string;
begin
        with IBValidacion do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select  *  from "caj$movimientocol" where ID_CAJA = :ID_CAJA');
           SQL.Add('AND FECHA_MOV = :FECHA');
           ParamByName('FECHA').AsDateTime := _dFechaMov;
           ParamByName('ID_CAJA').AsInteger := _iIdCaja;
           Open;
           frmValidarColocacion := TfrmValidarColocacion.Create(Self);
           with frmValidarColocacion do
           begin
               CValidar.Fecha := fFechaActual;
               CValidar.Caja := _iIdCaja;
               CValidar.Documento := FieldByName('DOCUMENTO').AsInteger;
               CValidar.Colocacion := FieldByName('ID_COLOCACION').AsString;
               CValidar.Interes := FieldByName('INTERESES').AsCurrency;
               CValidar.Devuelto := FieldByName('DEVOLUCION').AsCurrency;
               CValidar.Otras := 0;
               CValidar.Efectivo := FieldByName('BILLETES').AsCurrency;
               _sIdColocacion := FieldByName('ID_COLOCACION').AsString;
               CValidar.Capital := IBValidacion.FieldByName('CAPITAL').AsCurrency;               
               //Información de Colocación y Persona
               IBValidacion.Close;
               IBValidacion.SQL.Clear;
               IBValidacion.SQL.Add('SELECT');
               IBValidacion.SQL.Add('  "gen$persona".NOMBRE,');
               IBValidacion.SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
               IBValidacion.SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
               IBValidacion.SQL.Add('  "col$garantia".DESCRIPCION_GARANTIA,');
               IBValidacion.SQL.Add('  "col$clasificacion".DESCRIPCION_CLASIFICACION,');
               IBValidacion.SQL.Add('  "col$estado".DESCRIPCION_ESTADO_COLOCACION,');
               IBValidacion.SQL.Add('  "gen$persona".LUGAR_EXPEDICION,');
               IBValidacion.SQL.Add('    "col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS DEUDA,');
               IBValidacion.SQL.Add('  "col$colocacion".FECHA_INTERES,');
               IBValidacion.SQL.Add('  "col$colocacion".NUMERO_CUENTA,');
               IBValidacion.SQL.Add('  "col$colocacion".FECHA_CAPITAL');
               IBValidacion.SQL.Add('FROM');
               IBValidacion.SQL.Add('  "gen$persona"');
               IBValidacion.SQL.Add('  INNER JOIN "col$colocacion" ON ("gen$persona".ID_IDENTIFICACION = "col$colocacion".ID_IDENTIFICACION)');
               IBValidacion.SQL.Add('  AND ("gen$persona".ID_PERSONA = "col$colocacion".ID_PERSONA)');
               IBValidacion.SQL.Add('  INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
               IBValidacion.SQL.Add('  INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
               IBValidacion.SQL.Add('  INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
               IBValidacion.SQL.Add('WHERE');
               IBValidacion.SQL.Add('  "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
               IBValidacion.ParamByName('ID_COLOCACION').AsString := _sIdColocacion;
               IBValidacion.Open;
               CValidar.Nombre := IBValidacion.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                  IBValidacion.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                  IBValidacion.FieldByName('NOMBRE').AsString;
               CValidar.Clasificacion := IBValidacion.FieldByName('DESCRIPCION_CLASIFICACION').AsString;
               CValidar.Cuenta := IBValidacion.FieldByName('NUMERO_CUENTA').AsInteger;
               CValidar.Garantia := IBValidacion.FieldByName('DESCRIPCION_GARANTIA').AsString;
               CValidar.Estado := IBValidacion.FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
               CValidar.FechaInt := IBValidacion.FieldByName('FECHA_INTERES').AsDateTime;
               CValidar.NuevoSaldo := IBValidacion.FieldByName('DEUDA').AsCurrency;
               Validar := CValidar;
               ShowModal;
               Free;
           end;
        end;
end;

procedure TFrmRecuperaValidacion.ValidaRem;
begin
        with IBValidacion do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select  *  from "caj$movremotosalida" where ID_CAJA = :ID_CAJA');
           SQL.Add('AND FECHA_MOV = :FECHA');
           ParamByName('FECHA').AsDateTime := _dFechaMov;
           ParamByName('ID_CAJA').AsInteger := _iIdCaja;
           Open;
           frmValidarCaptacion := TfrmValidarCaptacion.Create(Self);
           with frmValidarCaptacion do
           begin
               FValidar.Fecha := fFechaActual;
               FValidar.Caja :=  _iIdCaja;
               FValidar.Origen := FieldByName('ORIGEN_MOVIMIENTO').AsInteger;
               FValidar.Tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               FValidar.Operacion := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
               FValidar.Agencia := FieldByName('ID_AGENCIA_REMOTA').AsInteger;
               FValidar.Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
               FValidar.Documento := FieldByName('DOCUMENTO').AsInteger;
               FValidar.Billetes := FieldByName('BILLETES').AsInteger;
               FValidar.Monedas := FieldByName('MONEDAS').AsInteger;
               FValidar.Cheques := FieldByName('CHEQUES').AsInteger;
               FValidar.Nombre := FieldByName('ASOCIADO').AsString;
               IBValidacion.Close;
               Validar := FValidar;
               ShowModal;
               Free;
           end;
        end;

end;

end.
