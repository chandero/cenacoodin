unit UnitIncluirGarReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, JvEdit, JvTypedEdit, Mask,
  IBSQL, DB, IBCustomDataSet, IBQuery;

type
  TfrmIncluirGarReal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    GroupBox1: TGroupBox;
    EdEscritura: TLabeledEdit;
    EdFechaEscritura: TDateTimePicker;
    Label2: TLabel;
    EDnotaria: TEdit;
    Notaria: TLabel;
    EdCiudad: TLabeledEdit;
    EdMatricula: TLabeledEdit;
    EdFechaRegistro: TDateTimePicker;
    Label3: TLabel;
    EDAvaluo: TJvCurrencyEdit;
    Label10: TLabel;
    EdFechaAvaluo: TDateTimePicker;
    Label8: TLabel;
    EDcuentas: TJvCurrencyEdit;
    Label4: TLabel;
    EdFechaIPoliza: TDateTimePicker;
    Label5: TLabel;
    EdFechaFPoliza: TDateTimePicker;
    Label7: TLabel;
    EDvalor: TJvCurrencyEdit;
    Label6: TLabel;
    EdPoliza: TLabeledEdit;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    EdNumeroColocacion: TMaskEdit;
    IBSQL1: TIBSQL;
    CmdNuevo: TBitBtn;
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
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
  private
    { Private declarations }
  public
    es_modificacion :Boolean;
    procedure Inicializar;
    { Public declarations }
  end;

var
  frmIncluirGarReal: TfrmIncluirGarReal;

implementation
uses UnitGlobales, UnitDmGeneral;

{$R *.dfm}

procedure TfrmIncluirGarReal.EdEscrituraKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EdFechaEscrituraKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EDnotariaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EdCiudadKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)

end;

procedure TfrmIncluirGarReal.EdMatriculaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EdFechaRegistroKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EDAvaluoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EdFechaAvaluoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EDcuentasKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EdFechaIPolizaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EdFechaFPolizaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EDvalorKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.EdPolizaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TfrmIncluirGarReal.CmdAceptarClick(Sender: TObject);
begin
  if MessageDlg('Seguro de Adicionar Garantia Real?',mtConfirmation,[mbyes,mbno],0) = mrYes then begin
    CmdAceptar.Enabled := False;
    IBSQL1.Close;
    IBSQL1.SQL.Clear;
    IBSQL1.SQL.Add('insert into "col$colgarantiasreal" VALUES (');
    IBSQL1.SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:NUMERO_ESCRITURA,');
    IBSQL1.SQL.Add(':FECHA_ESCRITURA,:NOMBRE_NOTARIA,:CIUDAD_ESCRITURA,');
    IBSQL1.SQL.Add(':MATRICULA_INMOBILIARIA,:FECHA_REGISTRO,:AVALUO,:FECHA_AVALUO,');
    IBSQL1.SQL.Add(':CUENTAS_DE_ORDEN,:POLIZA_INCENDIO,:VALOR_ASEGURADO,:FECHA_INICIAL_POLIZA,');
    IBSQL1.SQL.Add(':FECHA_FINAL_POLIZA,:CODIGO_ASEGURADORA,:ES_HIPOTECA)');
    IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
    IBSQL1.ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
    IBSQL1.ParamByName('NUMERO_ESCRITURA').AsString := EdEscritura.Text;
    IBSQL1.ParamByName('FECHA_ESCRITURA').AsDate := EdFechaEscritura.Date;
    IBSQL1.ParamByName('NOMBRE_NOTARIA').AsString  :=  EDnotaria.Text;
    IBSQL1.ParamByName('CIUDAD_ESCRITURA').AsString :=  EdCiudad.Text;
    IBSQL1.ParamByName('MATRICULA_INMOBILIARIA').AsString :=  EdMatricula.Text;
    IBSQL1.ParamByName('FECHA_REGISTRO').AsDate := EdFechaRegistro.Date;
    IBSQL1.ParamByName('AVALUO').AsCurrency :=  EDAvaluo.Value;
    IBSQL1.ParamByName('FECHA_AVALUO').AsDate := EdFechaAvaluo.Date;
    IBSQL1.ParamByName('CUENTAS_DE_ORDEN').AsCurrency := EDcuentas.Value;
    IBSQL1.ParamByName('POLIZA_INCENDIO').AsString := EdPoliza.Text;
    IBSQL1.ParamByName('VALOR_ASEGURADO').AsCurrency := EDvalor.Value;
    IBSQL1.ParamByName('FECHA_INICIAL_POLIZA').AsDate := EdFechaIPoliza.Date;
    IBSQL1.ParamByName('FECHA_FINAL_POLIZA').AsDate := EdFechaFPoliza.Date;
    IBSQL1.ParamByName('CODIGO_ASEGURADORA').AsString := '';
    IBSQL1.ParamByName('ES_HIPOTECA').AsBoolean := True;
    IBSQL1.ExecQuery;
    IBSQL1.Transaction.Commit;
    MessageDlg('Registro Grabado con Exito',mtInformation,[mbok],0);
  end;
end;

procedure TfrmIncluirGarReal.EdNumeroColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmIncluirGarReal.FormShow(Sender: TObject);
begin
        if IBSQL1.Transaction.InTransaction then
          IBSQL1.Transaction.Rollback;
        IBSQL1.Transaction.StartTransaction;
end;

procedure TfrmIncluirGarReal.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmIncluirGarReal.Inicializar;
var
FechaHoy : TDate;
begin
        FechaHoy := fFechaActual;
        EdNumeroColocacion.Text := '';
        EdEscritura.Text := '';
        EdFechaEscritura.Date := FechaHoy;
        EDnotaria.Text := '';
        EdCiudad.Text := '';
        EdMatricula.Text := '';
        EdFechaRegistro.Date := FechaHoy;
        EDAvaluo.Value := 0;
        EdFechaAvaluo.Date := FechaHoy;
        EDcuentas.Value := 0;
        EdFechaIPoliza.Date  := FechaHoy;
        EdFechaFPoliza.Date := FechaHoy;
        EDvalor.Value := 0;
        EdPoliza.Text := '';
        if IBSQL1.Transaction.InTransaction then
          IBSQL1.Transaction.Rollback;
        IBSQL1.Transaction.StartTransaction;
        CmdAceptar.Enabled := True;
end;

end.
