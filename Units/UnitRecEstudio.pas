unit UnitRecEstudio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, FR_Class;

type
  TFrmRecEstudio = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label36: TLabel;
    Msolicitud: TMaskEdit;
    DBoficina: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DSoficina: TDataSource;
    IBoficina: TIBQuery;
    FrReport: TfrReport;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBoficinaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRecEstudio: TFrmRecEstudio;

implementation
uses UnitGlobales, unitMain, UnitImpresion;

{$R *.dfm}

procedure TFrmRecEstudio.FormCreate(Sender: TObject);
begin
        if IBoficina.Transaction.InTransaction then
           IBoficina.Transaction.Rollback;
        IBoficina.Transaction.StartTransaction;
        IBoficina.Open;
        IBoficina.Last;
        DBoficina.KeyValue := Agencia;
        if Agencia = 1 then
           DBoficina.Enabled := True
        else
           DBoficina.Enabled := False;
        FrmImpresion := TFrmImpresion.Create(Self);
end;

procedure TFrmRecEstudio.BitBtn1Click(Sender: TObject);
begin
        try
          frReport.Preview := FrmImpresion.frPreview1;
          FrReport.LoadPreparedReport(FrmMain._sSession + '\' + IntToStr(DBoficina.KeyValue) + Msolicitud.Text + '.frp');
          FrReport.ShowPreparedReport;
          FrReport.ShowReport;
          FrmImpresion.ShowModal;
        except
          ShowMessage('No se puede Recuperar el Informe, No pertenece a esta Sesión');
        end;
end;

procedure TFrmRecEstudio.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRecEstudio.DBoficinaKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
           Msolicitud.SetFocus;
end;

end.
