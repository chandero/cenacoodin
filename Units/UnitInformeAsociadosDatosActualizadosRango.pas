unit UnitInformeAsociadosDatosActualizadosRango;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, IBDatabase, DB, IBCustomDataSet,
  IBQuery, pr_Common, pr_Classes, unitDmGeneral, Buttons;

type
  TfrmInformeAsociadosDatosActualizadosRango = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edFechaInicial: TDateTimePicker;
    Label2: TLabel;
    edFechaFinal: TDateTimePicker;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    btnExcel: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeAsociadosDatosActualizadosRango: TfrmInformeAsociadosDatosActualizadosRango;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmInformeAsociadosDatosActualizadosRango.FormCreate(
  Sender: TObject);
begin
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction1.StartTransaction;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := IBTransaction1;
end;

procedure TfrmInformeAsociadosDatosActualizadosRango.BitBtn2Click(
  Sender: TObject);
begin
        IBTransaction1.Commit;
        Close;
end;

end.
