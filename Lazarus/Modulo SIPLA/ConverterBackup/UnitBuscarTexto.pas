unit UnitBuscarTexto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmBuscarTexto = class(TForm)
    EdTexto: TEdit;
    Label1: TLabel;
    CmdBuscar: TBitBtn;
    CmdCancelar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarTexto: TfrmBuscarTexto;

implementation

{$R *.dfm}

end.
