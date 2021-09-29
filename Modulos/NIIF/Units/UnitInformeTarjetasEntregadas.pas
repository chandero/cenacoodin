unit UnitInformeTarjetasEntregadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, pr_Classes, pr_Common,
  pr_TxClasses, DB, IBCustomDataSet, IBQuery;

type
  TfrmTarjetasEntregadas = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    EdDesde: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    EdHasta: TDateTimePicker;
    btnReporte: TBitBtn;
    btnCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    rgTipo: TRadioGroup;
    prTxReport1: TprTxReport;
    prReport1: TprReport;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarjetasEntregadas: TfrmTarjetasEntregadas;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmTarjetasEntregadas.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTarjetasEntregadas.btnReporteClick(Sender: TObject);
begin
  with IBQuery1 do
  begin
      if Transaction.InTransaction then
         Transaction.Rollback;
      Transaction.StartTransaction;
      Close;
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('"cap$tarjetacuenta".ID_TARJETA,');
      SQL.Add('"cap$tarjetacuenta".ID_AGENCIA,');
      SQL.Add('"cap$tarjetacuenta".ID_TIPO_CAPTACION,');
      SQL.Add('"cap$tarjetacuenta".NUMERO_CUENTA,');
      SQL.Add('"cap$tarjetacuenta".DIGITO_CUENTA,');
      SQL.Add('"cap$tarjetacuenta".FECHA_ASIGNACION,');
      SQL.Add('"cap$tarjetacuenta".FECHA_BLOQUEO,');
      SQL.Add('"cap$tarjetacuenta".FECHA_CANCELADA,');
      SQL.Add('"cap$tarjetacuenta".CUPO_ATM,');
      SQL.Add('"cap$tarjetacuenta".CUPO_POS,');
      SQL.Add('"cap$tarjetacuenta".TRANS_ATM,');
      SQL.Add('"cap$tarjetacuenta".TRANS_POS,');
      SQL.Add('"gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE AS NOMBRE,');
      SQL.Add('"cap$tarjetacuenta".ID_ESTADO,');
      SQL.Add('"cap$tarjetaestado".DESCRIPCION');
      SQL.Add('FROM');
      SQL.Add('"cap$tarjetacuenta"');
      SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$tarjetacuenta".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ');
      SQL.Add('("cap$tarjetacuenta".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ("cap$tarjetacuenta".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$tarjetacuenta".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
      SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
      SQL.Add('INNER JOIN "cap$tarjetaestado" ON ("cap$tarjetacuenta".ID_ESTADO = "cap$tarjetaestado".ID_ESTADO)');
      SQL.Add('where "cap$tarjetacuenta".FECHA_ASIGNACION BETWEEN :FECHA1 and :FECHA2');
      ParamByName('FECHA1').AsDate := EdDesde.Date;
      ParamByName('FECHA2').AsDate := EdHasta.Date;


      prTxReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
      prTxReport1.Variables.ByName['NIT'].AsString := Nit;
      prTxReport1.Variables.ByName['F_INICIAL'].AsDateTime := EdDesde.Date;
      prTxReport1.Variables.ByName['F_FINAL'].AsDateTime := EdHasta.Date;

      prReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
      prReport1.Variables.ByName['NIT'].AsString := Nit;
      prReport1.Variables.ByName['F_INICIAL'].AsDateTime := EdDesde.Date;
      prReport1.Variables.ByName['F_FINAL'].AsDateTime := EdHasta.Date;

      case rgTipo.ItemIndex of
      0: if prTxReport1.PrepareReport then prTxReport1.PreviewPreparedReport(True);
      1: if prReport1.PrepareReport then prReport1.PreviewPreparedReport(True);
      end;

      Transaction.Commit;
  end;

end;

procedure TfrmTarjetasEntregadas.FormCreate(Sender: TObject);
begin
        EdDesde.Date := fFechaActual;
        EdHasta.Date := fFechaActual;
end;

end.
