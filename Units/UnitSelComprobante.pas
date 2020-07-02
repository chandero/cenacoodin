unit UnitSelComprobante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TFrmSelComprobante = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Rcajas: TRadioButton;
    Rahorros: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelComprobante: TFrmSelComprobante;

implementation

{$R *.dfm}

end.
