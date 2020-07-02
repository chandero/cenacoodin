unit UnitInformacionSolAgencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBClient;

type
  TFrmInformacionSolAgencia = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    cdCodeudor: TClientDataSet;
    dsCodeudor: TDataSource;
    cdGarantia: TClientDataSet;
    dsGarantia: TDataSource;
    cdCodeudorIDIDENTIFICACION: TIntegerField;
    cdCodeudorNOMBRES: TStringField;
    cdCodeudorIDPERSONA: TStringField;
    cdGarantiaIDIDENTIFICACION: TIntegerField;
    cdGarantiaIDPERSONA: TStringField;
    cdGarantiaMATRICULA: TStringField;
    cdGarantiaDESCRIPCION: TStringField;
    cdCodeudorIDSOLICITUD: TStringField;
    cdGarantiaIDSOLICITUD: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInformacionSolAgencia: TFrmInformacionSolAgencia;

implementation

{$R *.dfm}

procedure TFrmInformacionSolAgencia.Button1Click(Sender: TObject);
begin
        Close;
end;

end.
