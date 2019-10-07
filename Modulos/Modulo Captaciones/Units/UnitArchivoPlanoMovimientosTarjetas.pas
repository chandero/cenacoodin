unit UnitArchivoPlanoMovimientosTarjetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, IBDatabase, DB, IBCustomDataSet,
  IBQuery, ExtCtrls;

type
  TfrmArchivoPlanoMovimeintosTarjetas = class(TForm)
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    btnProcesar: TBitBtn;
    IBQmovs: TIBQuery;
    IBTransaction1: TIBTransaction;
    Panel1: TPanel;
    btnCerrar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArchivoPlanoMovimeintosTarjetas: TfrmArchivoPlanoMovimeintosTarjetas;

implementation

uses UnitDmGeneral, UnitGlobales;

{$R *.dfm}

procedure TfrmArchivoPlanoMovimeintosTarjetas.FormShow(Sender: TObject);
begin
        IBTransaction1.StartTransaction;
end;

procedure TfrmArchivoPlanoMovimeintosTarjetas.btnCerrarClick(
  Sender: TObject);
begin
        Close;
end;

end.
