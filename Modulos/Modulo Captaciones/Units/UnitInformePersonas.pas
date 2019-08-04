unit UnitInformePersonas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmInformePersonas = class(TForm)
    Filtro: TGroupBox;
    Label1: TLabel;
    cmbPersona: TComboBox;
    btnProcesar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformePersonas: TfrmInformePersonas;

implementation

{$R *.dfm}

end.
