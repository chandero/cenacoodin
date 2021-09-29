unit UnitMovimientoTerceros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DateUtils, Dialogs, StdCtrls, Buttons, ExtCtrls, JvEdit, JvTypedEdit;

type
  TfrmMovimientoTercero = class(TForm)
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    btnAExcel: TBitBtn;
    Label1: TLabel;
    EdPeriodo: TJvYearEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimientoTercero: TfrmMovimientoTercero;

implementation

uses UnitGlobales;
{$R *.dfm}

procedure TfrmMovimientoTercero.FormCreate(Sender: TObject);
begin
        EdPeriodo.Value := YearOf(fFechaActual);
end;

end.
