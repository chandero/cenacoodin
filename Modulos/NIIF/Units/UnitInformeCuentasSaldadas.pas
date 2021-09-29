unit UnitInformeCuentasSaldadas;

interface

uses
  DateUtils, StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, DBCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase, pr_Common, pr_TxClasses;

type
  TfrmInformeCuentasSaldadas = class(TForm)
    Panel1: TPanel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Label2: TLabel;
    Label1: TLabel;
    EdFecha1: TDateTimePicker;
    btnProcesar: TBitBtn;
    btnReporte: TBitBtn;
    btnCerrar: TBitBtn;
    IBQTipoCaptacion: TIBQuery;
    DSTipoCaptacion: TDataSource;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    Label3: TLabel;
    Label4: TLabel;
    EdFecha2: TDateTimePicker;
    prTxReport1: TprTxReport;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdFecha1Exit(Sender: TObject);
    procedure EdFecha2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Inicializar;
    { Public declarations }
  end;

var
  frmInformeCuentasSaldadas: TfrmInformeCuentasSaldadas;

implementation

{$R *.dfm}

uses unitdmGeneral, unitGlobales;

procedure TfrmInformeCuentasSaldadas.btnCerrarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmInformeCuentasSaldadas.Inicializar;
begin
        if IBQTipoCaptacion.Transaction.InTransaction then
           IBQTipoCaptacion.Transaction.Rollback;
        IBQTipoCaptacion.Transaction.StartTransaction;

        IBQTipoCaptacion.Close;
        IBQTipoCaptacion.SQL.Clear;
        IBQTipoCaptacion.SQL.Add('select * from "cap$tipocaptacion" order by ID_TIPO_CAPTACION ASC');
        IBQTipoCaptacion.Open;
        IBQTipoCaptacion.Last;
        IBQTipoCaptacion.First;

        EdFecha1.Date := fFechaActual;
        EdFecha2.Date := fFechaActual;

end;

procedure TfrmInformeCuentasSaldadas.btnProcesarClick(Sender: TObject);
begin
        DBLCBTipoCaptacion.Enabled := False;
        EdFecha1.Enabled := False;
        EdFecha2.Enabled := False;

        Application.ProcessMessages;

        with IBQuery1 do
        begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('  "cap$maestro".ID_AGENCIA,');
             SQL.Add('  "cap$maestro".ID_TIPO_CAPTACION,');
             SQL.Add('  "cap$maestro".NUMERO_CUENTA,');
             SQL.Add('  "cap$maestro".DIGITO_CUENTA,');
             SQL.Add('  "cap$maestro".FECHA_SALDADA,');
             SQL.Add('  "cap$maestrotitular".ID_PERSONA,');
             SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
             SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('  "gen$persona".NOMBRE,');
             SQL.Add('  "cap$maestro".VALOR_INICIAL,');
             SQL.Add('  "cap$tiposestado".DESCRIPCION');
             SQL.Add('FROM');
             SQL.Add(' "cap$maestro"');
             SQL.Add(' INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
             SQL.Add('  AND ("cap$maestro".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
             SQL.Add('  AND ("cap$maestro".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
             SQL.Add('  AND ("cap$maestro".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
             SQL.Add(' INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
             SQL.Add('  AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
             SQL.Add(' INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO="cap$tiposestado".ID_ESTADO)');
             SQL.Add('WHERE');
             SQL.Add(' "cap$maestro".FECHA_SALDADA BETWEEN :FECHA1 AND :FECHA2');
             SQL.Add(' and "cap$maestro".ID_TIPO_CAPTACION = :ID ORDER BY "cap$maestro".NUMERO_CUENTA');
             ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('FECHA1').AsDate := EdFecha1.Date;
             ParamByName('FECHA2').AsDate := EdFecha2.Date;
             try
               Open;
               btnReporte.Enabled := True;
               btnProcesar.Enabled := False;
               Application.ProcessMessages;
             except
               Transaction.Rollback;
               raise;
               Exit;
             end;
        end;
end;

procedure TfrmInformeCuentasSaldadas.btnReporteClick(Sender: TObject);
begin
        Empleado;
        prTxReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
        prTxReport1.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
        prTxReport1.Variables.ByName['TIPO'].AsString := DBLCBTipoCaptacion.Text;
        prTxReport1.Variables.ByName['DESDE'].AsDateTime := EdFecha1.Date;
        prTxReport1.Variables.ByName['HASTA'].AsDateTime := EdFecha2.Date;
        if prTxReport1.PrepareReport then
           prTxReport1.PreviewPreparedReport(True);
end;

procedure TfrmInformeCuentasSaldadas.FormCreate(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmInformeCuentasSaldadas.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCuentasSaldadas.EdFecha1Exit(Sender: TObject);
begin
        if EdFecha1.Date > EdFecha2.Date then
             EdFecha1.Date := EdFecha2.Date;
end;

procedure TfrmInformeCuentasSaldadas.EdFecha2Exit(Sender: TObject);
begin
        if EdFecha2.Date < EdFecha1.Date then
           EdFecha2.Date := EdFecha1.Date;
end;

end.
