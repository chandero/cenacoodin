unit UnitDescargaPagare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvStaticText, StdCtrls, Buttons, DB, IBCustomDataSet,
  IBSQL;

type
  TFrmDescargaPagare = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EDcolocacion: TEdit;
    Asociado: TLabel;
    JVasociado: TJvStaticText;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    JVfechaK: TJvStaticText;
    Label4: TLabel;
    JVfechaI: TJvStaticText;
    Label2: TLabel;
    JVsaldo: TJvStaticText;
    Label9: TLabel;
    JVcalificacion: TJvStaticText;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    JVfechaVE: TJvStaticText;
    Label6: TLabel;
    JVfechaKE: TJvStaticText;
    Label10: TLabel;
    JVfechaIE: TJvStaticText;
    Label11: TLabel;
    JVsaldoE: TJvStaticText;
    Label12: TLabel;
    JVvalorE: TJvStaticText;
    Label13: TLabel;
    JVclasificacionE: TJvStaticText;
    Label14: TLabel;
    Label15: TLabel;
    JVentidad: TJvStaticText;
    JVdocumento: TJvStaticText;
    Panel3: TPanel;
    Bcancelar: TSpeedButton;
    Baceptar: TBitBtn;
    Bcerrar: TBitBtn;
    IBSQL1: TIBSQL;
    procedure BcerrarClick(Sender: TObject);
    procedure EDcolocacionExit(Sender: TObject);
    procedure BcancelarClick(Sender: TObject);
    procedure EDcolocacionKeyPress(Sender: TObject; var Key: Char);
    procedure BaceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDescargaPagare: TFrmDescargaPagare;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmDescargaPagare.BcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmDescargaPagare.EDcolocacionExit(Sender: TObject);
var     vId_Persona :string;
        vId_Identificacion :Integer;
begin
        if EDcolocacion.Text <> '' then
        begin
        with IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$colendosado".FECHAK,');
          SQL.Add('"col$colendosado".FECHAI,');
          SQL.Add('"col$colendosado".SALDO,');
          SQL.Add('"col$colendosado".ID_CATEGORIA AS CATEGORIA,');
          SQL.Add('"col$colendosado".ESTADO,');
          SQL.Add('"col$colendosado".DOCUMENTO,');
          SQL.Add('"col$entidad".DESCRIPCION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"col$colocacion".ID_CATEGORIA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO_ACTUAL,');
          SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$entidad"');
          SQL.Add('INNER JOIN "col$colendosado" ON ("col$entidad".ID_ENTIDAD="col$colendosado".ID_ENTIDAD)');
          SQL.Add('INNER JOIN "col$colocacion" ON ("col$colocacion".ID_COLOCACION="col$colendosado".ID_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$colendosado".ID_COLOCACION = :ID_COLOCACION)');
          ParamByName('ID_COLOCACION').AsString := EDcolocacion.Text;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('No se Encuentra Registrado en la Tabla Endosados...',mtInformation,[mbok],0);
            EDcolocacion.SelectAll;
            EDcolocacion.SetFocus;
            Exit;
          end;
          if FieldByName('ESTADO').AsInteger = 0 then
          begin
            MessageDlg('La Colocación ya fue Descargada...',mtInformation,[mbok],0);
            EDcolocacion.SelectAll;
            EDcolocacion.SetFocus;
            Exit;
          end;
          JVsaldo.Caption := CurrToStrF(FieldByName('SALDO').AsCurrency,ffCurrency,1);
          JVsaldoe.Caption := CurrToStrF(FieldByName('SALDO_ACTUAL').AsCurrency,ffCurrency,1);
          JVvalorE.Caption := CurrToStrF(FieldByName('VALOR_DESEMBOLSO').AsCurrency,ffCurrency,1);
          JVfechaK.Caption := FieldByName('FECHAK').AsString;
          JVfechaI.Caption := FieldByName('FECHAI').AsString;
          JVcalificacion.Caption := FieldByName('CATEGORIA').AsString;
          JVfechaVE.Caption := FieldByName('FECHA_VENCIMIENTO').AsString;
          JVfechaKE.Caption := FieldByName('FECHA_CAPITAL').AsString;
          JVfechaIE.Caption := FieldByName('FECHA_INTERES').AsString;
          JVclasificacionE.Caption := FieldByName('ID_CATEGORIA').AsString;
          JVentidad.Caption := FieldByName('DESCRIPCION').AsString;
          JVdocumento.Caption := FieldByName('DOCUMENTO').AsString;
          vId_Persona := FieldByName('ID_PERSONA').AsString;
          vId_Identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('select NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := vId_Persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := vId_Identificacion;
          ExecQuery;
          JVasociado.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Baceptar.Enabled := True;
          Baceptar.SetFocus;
        end;
        end;
end;

procedure TFrmDescargaPagare.BcancelarClick(Sender: TObject);
begin
        JVsaldo.Caption := '';
        JVasociado.Caption := '';
        JVfechaI.Caption := '';
        JVfechaK.Caption := '';
        JVcalificacion.Caption := '';
        jvfechaie.Caption := '';
        jvfechake.Caption := '';
        JVentidad.Caption := '';
        JVdocumento.Caption := '';
        JVfechaVE.Caption := '';
        JVvalorE.Caption := '';
        jvsaldoe.Caption := '';
        JVclasificacionE.Caption := '';
        Baceptar.Enabled := False;
        EDcolocacion.Text := '';
        EDcolocacion.SetFocus;

end;

procedure TFrmDescargaPagare.EDcolocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           edcolocacionexit(Self);
end;

procedure TFrmDescargaPagare.BaceptarClick(Sender: TObject);
begin
        if MessageDlg('Esta seguro de Realizar la Operación?',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update "col$colendosado" set ESTADO = 0,FECHA_SALIDA = :FECHA_SALIDA,ID_EMPLEADO_DESCARGA = :ID_EMPLEADO');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := EDcolocacion.Text;
          ParamByName('FECHA_SALIDA').AsDate := fFechaActual;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
            ExecQuery;
            Transaction.Commit;
          except
          on E: Exception do
          begin
             MessageDlg('Error al Atualizar los Datos, con Mensage' + #13 + E.Message,mtError,[mbok],0);
             Transaction.Rollback;
          end;
          end;
            MessageDlg('Colocación descargada con Exito...',mtInformation,[mbok],0);
            Bcancelar.Click;
        end;
end;

end.
