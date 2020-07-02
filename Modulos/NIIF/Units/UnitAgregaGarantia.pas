unit UnitAgregaGarantia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, JvEdit, JvTypedEdit;

type
  TFrmAgregaGarantia = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdEscritura: TLabeledEdit;
    EdFechaEscritura: TDateTimePicker;
    EdCiudad: TLabeledEdit;
    Label8: TLabel;
    EdFechaAvaluo: TDateTimePicker;
    Label10: TLabel;
    Label3: TLabel;
    EdFechaRegistro: TDateTimePicker;
    EdMatricula: TLabeledEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdFechaIPoliza: TDateTimePicker;
    Label7: TLabel;
    EdFechaFPoliza: TDateTimePicker;
    Label6: TLabel;
    EDnotaria: TEdit;
    Notaria: TLabel;
    EdPoliza: TLabeledEdit;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    EDvalor: TJvCurrencyEdit;
    EDcuentas: TJvCurrencyEdit;
    EDAvaluo: TJvCurrencyEdit;
    procedure EdEscrituraKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaEscrituraKeyPress(Sender: TObject; var Key: Char);
    procedure EDnotariaKeyPress(Sender: TObject; var Key: Char);
    procedure EdCiudadKeyPress(Sender: TObject; var Key: Char);
    procedure EdMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaRegistroKeyPress(Sender: TObject; var Key: Char);
    procedure EDAvaluoKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaAvaluoKeyPress(Sender: TObject; var Key: Char);
    procedure EDcuentasKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaIPolizaKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaFPolizaKeyPress(Sender: TObject; var Key: Char);
    procedure EDvalorKeyPress(Sender: TObject; var Key: Char);
    procedure EdPolizaKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    es_modificacion :Boolean;
    _sIdPersona :string;
    { Public declarations }
  end;

var
  FrmAgregaGarantia: TFrmAgregaGarantia;

implementation
uses UnitGlobales, UnitDesembolso, DB;

{$R *.dfm}

procedure TFrmAgregaGarantia.EdEscrituraKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EdFechaEscrituraKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EDnotariaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EdCiudadKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)

end;

procedure TFrmAgregaGarantia.EdMatriculaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EdFechaRegistroKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EDAvaluoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EdFechaAvaluoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EDcuentasKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EdFechaIPolizaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EdFechaFPolizaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EDvalorKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.EdPolizaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAgregaGarantia.CmdAceptarClick(Sender: TObject);
begin
        with FrmDesembolso.CDgarantiareal do
        begin
          if es_modificacion then
             Delete;
          Append;
          FieldValues['numero_escritura'] := EdEscritura.Text;
          FieldValues['fecha_escritura'] := EdFechaEscritura.DateTime;
          FieldValues['nombre_notaria'] :=  EDnotaria.Text;
          FieldValues['ciudad_notaria'] :=  EdCiudad.Text;
          FieldValues['matricula'] :=  EdMatricula.Text;
          FieldValues['fecha_registro'] := EdFechaRegistro.Date;
          FieldValues['avaluo'] :=  EDAvaluo.Value;
          FieldValues['fecha_avaluo'] := EdFechaAvaluo.DateTime;
          FieldValues['cuentas_orden'] := EDcuentas.Value;
          FieldValues['fecha_ini_poliza'] := EdFechaIPoliza.Date;
          FieldValues['fecha_fin_poliza'] := EdFechaFPoliza.Date;
          FieldValues['valor_asegurado'] :=  EDvalor.Value;
          FieldValues['poliza_incendio'] :=  EdPoliza.Text;
          FieldValues['ID_PERSONA'] := _sIdPersona;
          post;
        end;
end;

end.
