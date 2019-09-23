unit UnitInformePersonasErrorFechaNacimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses, JvLabel, JvBlinkingLabel;

type
  TfrmInfPerErrFecNac = class(TForm)
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    label1: TJvBlinkingLabel;
    Report1: TprTxReport;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure Report1BandGenerateCell(Sender: TObject;
      HorzBandInfo: TprGenHorzBandInfo; VertBandInfo: TprGenVertBandInfo);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfPerErrFecNac: TfrmInfPerErrFecNac;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmInfPerErrFecNac.btnCerrarClick(Sender: TObject);
begin
  dmGeneral.IBTransaction1.Commit;
  Close;
end;

procedure TfrmInfPerErrFecNac.FormShow(Sender: TObject);
begin
  Inicializar;
end;

procedure TfrmInfPerErrFecNac.Inicializar;
begin
   with dmGeneral.IBTransaction1 do
   begin
     if InTransaction then
        Rollback;
     StartTransaction;
   end;
end;

procedure TfrmInfPerErrFecNac.btnProcesarClick(Sender: TObject);
begin
        btnprocesar.Enabled := False;
        label1.Visible := True;
        Application.ProcessMessages;
        with IBQuery1 do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT DISTINCT');
         SQL.Add('  "gen$persona".ID_IDENTIFICACION,');
         SQL.Add('  "gen$persona".ID_PERSONA,');
         SQL.Add('  ("gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE) AS NOMBRE,');
         SQL.Add('  "gen$persona".FECHA_NACIMIENTO,');
         SQL.Add('  "cap$maestrotitular".NUMERO_CUENTA');
         SQL.Add('FROM');
         SQL.Add('  "gen$persona"');
         SQL.Add('LEFT JOIN');
         SQL.Add('  "cap$maestrotitular" on');
         SQL.Add('   ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) and');
         SQL.Add('   ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
         SQL.Add('WHERE');
         SQL.Add('  ("gen$persona".FECHA_NACIMIENTO >= (CURRENT_DATE - 6570)) AND');
         SQL.Add('  ("gen$persona".ID_IDENTIFICACION = 3) and');
         SQL.Add('  ("cap$maestrotitular".NUMERO_CUENTA > 0)');
         SQL.Add('order by NOMBRE');
         Open;
         Last;
         First;
         ShowMessage(IntToStr(RecordCount));
        end;

        Report1.Variables.ByName['EMPRESA'].AsString := Empresa;
        if Report1.PrepareReport then
        begin
           Report1.PreviewPreparedReport(True);
        end;

        label1.Visible := False;


end;

procedure TfrmInfPerErrFecNac.Report1BandGenerateCell(Sender: TObject;
  HorzBandInfo: TprGenHorzBandInfo; VertBandInfo: TprGenVertBandInfo);
begin
  Application.ProcessMessages;
end;

end.
