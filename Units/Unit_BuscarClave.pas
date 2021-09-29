unit Unit_BuscarClave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmBuscarClave = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    EditCODIGO: TMaskEdit;
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure EditCODIGOKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarClave: TfrmBuscarClave;

implementation

{$R *.dfm}




procedure TfrmBuscarClave.EditCODIGOKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if key = 13 then
        BtnAceptar.Click;
end;

end.
