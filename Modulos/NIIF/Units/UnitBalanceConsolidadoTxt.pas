unit UnitBalanceConsolidadoTxt;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses, JvEdit, JvTypedEdit;

type
  TfrmBalanceConsolidadoTxt = class(TForm)
    CBMeses: TComboBox;
    CBNivel: TComboBox;
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdReporte: TBitBtn;
    cmdCerrar: TBitBtn;
    IBQTabla: TIBQuery;
    Label1: TLabel;
    EdYear: TJvIntegerEdit;
    IBQTablaCODIGO: TIBStringField;
    IBQTablaNOMBRE: TIBStringField;
    IBQTablaNIVEL: TIntegerField;
    IBQTablaSALDOMESANT: TIBBCDField;
    IBQTablaDEBITO: TIBBCDField;
    IBQTablaCREDITO: TIBBCDField;
    IBQTablaSALDO: TIBBCDField;
    Reporte: TprTxReport;
    procedure cmdProcesarClick(Sender: TObject);
    procedure cmdReporteClick(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanceConsolidadoTxt: TfrmBalanceConsolidadoTxt;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmBalanceConsolidadoTxt.cmdProcesarClick(Sender: TObject);
begin
        if (CBMeses.ItemIndex < 0) or
           (CBNivel.ItemIndex < 0) then
        begin
           MessageDlg('Debe seleccionar el Mes y el Nivel',mtError,[mbcancel],0);
           Exit;
        end;

        cmdProcesar.Enabled := False;

        with IBQTabla do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM BALANCE_CONSOLIDADO_OFICINAS(:MES,:NIVELX)');
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
          ParamByName('NIVELX').AsInteger := CBNivel.ItemIndex+1;
        end;

        cmdReporte.Enabled := True;
        cmdReporte.Click;
        

end;

procedure TfrmBalanceConsolidadoTxt.cmdReporteClick(Sender: TObject);
begin
         Empleado;
         Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
         Reporte.Variables.ByName['NIT'].AsString := Nit;
         Reporte.Variables.ByName['EMPLEADO'].AsString := Trim(Nombres) + ' ' + Trim(Apellidos);
         Reporte.Variables.ByName['MES'].AsString := UpperCase(CBMeses.Items[CBMeses.ItemIndex]);
         Reporte.Variables.ByName['ANOCORTE'].AsString := IntToStr(EdYear.Value);

         if Reporte.PrepareReport then
            Reporte.PreviewPreparedReport(True);

end;

procedure TfrmBalanceConsolidadoTxt.cmdCerrarClick(Sender: TObject);
begin
        if IBQTabla.Transaction.InTransaction then
           IBQTabla.Transaction.Commit;
        Close;
end;

procedure TfrmBalanceConsolidadoTxt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBalanceConsolidadoTxt.FormCreate(Sender: TObject);
begin
        EdYear.Value := YearOf(ffechaactual);
end;

end.
