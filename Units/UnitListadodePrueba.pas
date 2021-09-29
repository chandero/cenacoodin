unit UnitListadodePrueba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, pr_Common, pr_TxClasses,
  DB, IBCustomDataSet, IBQuery;

type
  TfrmListadodePrueba = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdFecha: TDateTimePicker;
    CmdAceptar: TBitBtn;
    CmdCancelar: TBitBtn;
    IBQuery1: TIBQuery;
    Report: TprTxReport;
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListadodePrueba: TfrmListadodePrueba;

implementation

{$R *.dfm}

uses unitDmGeneral,UnitGlobales, unitVistaPreliminar;

procedure TfrmListadodePrueba.CmdAceptarClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
        with IBQuery1 do begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHADIA').AsDate := EdFecha.Date;
          try
            Open;
          except
            MessageDlg('Error al recuperar datos',mtError,[mbcancel],0);
            Transaction.Rollback;
            Exit;
          end;
          if RecordCount < 1 then begin
            MessageDlg('No existen registros para mostrar',mtInformation,[mbok],0);
            Transaction.Commit;
            Exit;
          end;

          Report.Variables.ByName['Empresa'].AsString := Empresa;
          Report.Variables.ByName['Fecha'].AsDateTime := EdFecha.DateTime;
          if Report.PrepareReport then begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := Report;
             frmVistaPreliminar.ShowModal;
             frmVistaPreliminar.Free;
          end;
        end;

end;

procedure TfrmListadodePrueba.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmListadodePrueba.CmdCancelarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmListadodePrueba.FormShow(Sender: TObject);
begin
        EdFecha.Date := Date;
end;

end.
