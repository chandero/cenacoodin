unit UnitActualizaGarantiaReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, JvEdit, JvTypedEdit, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmActualizaGarantiaReal = class(TForm)
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label3: TLabel;
    EdPoliza: TLabeledEdit;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label4: TLabel;
    EdFechaIPoliza: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdFechaFPoliza: TDateTimePicker;
    EdFechaAvaluo: TDateTimePicker;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    CbEstadoGar: TComboBox;
    JvAvaluo: TJvCurrencyEdit;
    JvCuenta: TJvCurrencyEdit;
    JvValorAsegurado: TJvCurrencyEdit;
    EdCodAseguradora: TEdit;
    IBRegistro: TIBQuery;
    procedure CmdAceptarClick(Sender: TObject);
    procedure JvAvaluoKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    _bActualiza :Boolean;
    _sMatricula :string;
    { Public declarations }
  end;

var
  FrmActualizaGarantiaReal: TFrmActualizaGarantiaReal;

implementation

{$R *.dfm}

uses UnitGlobales;



procedure TFrmActualizaGarantiaReal.CmdAceptarClick(Sender: TObject);
begin
        with IBRegistro do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('UPDATE');
          SQL.Add('  "col$datogarantia"');
          SQL.Add('SET');
          SQL.Add('  AVALUO = :AVALUO,');
          SQL.Add('  FECHA_AVALUO = :FECHA_AVALUO,');
          SQL.Add('  CUENTAS_DE_ORDEN = :CUENTAS_DE_ORDEN,');
          SQL.Add('  POLIZA_INCENDIO = :POLIZA_INCENDIO,');
          SQL.Add('  VALOR_ASEGURADO = :VALOR_ASEGURADO,');
          SQL.Add('  FECHA_INICIAL_POLIZA = :FECHA_INICIAL_POLIZA,');
          SQL.Add('  FECHA_FINAL_POLIZA = :FECHA_FINAL_POLIZA,');
          SQL.Add('  CODIGO_ASEGURADORA = :CODIGO_ASEGURADORA,');
          SQL.Add('  ESTADO = :ESTADO');
          SQL.Add('WHERE');
          SQL.Add('  "col$datogarantia".MATRICULA = :MATRICULA AND ');
          SQL.Add('  "col$datogarantia".ID_AGENCIA = :AGENCIA');
          ParamByName('AVALUO').AsCurrency := JvAvaluo.Value;
          ParamByName('FECHA_AVALUO').AsDateTime := EdFechaAvaluo.DateTime;
          ParamByName('CUENTAS_DE_ORDEN').AsCurrency := JvCuenta.Value;
          ParamByName('POLIZA_INCENDIO').AsString := EdPoliza.Text;
          ParamByName('VALOR_ASEGURADO').AsCurrency := JvValorAsegurado.Value;
          ParamByName('FECHA_INICIAL_POLIZA').AsDateTime := EdFechaIPoliza.DateTime;
          ParamByName('FECHA_FINAL_POLIZA').AsDateTime := EdFechaFPoliza.DateTime;
          ParamByName('CODIGO_ASEGURADORA').AsString := EdCodAseguradora.Text;
          ParamByName('ESTADO').AsInteger := CbEstadoGar.ItemIndex;
          ParamByName('AGENCIA').AsInteger := Agencia;
          ParamByName('MATRICULA').AsString := _sMatricula;
          ExecSQL;
          Transaction.Commit;
          _bActualiza := True;
          Self.Close;
        end;
end;

procedure TFrmActualizaGarantiaReal.JvAvaluoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmActualizaGarantiaReal.CmdCerrarClick(Sender: TObject);
begin
        Self.Close;
end;

end.
