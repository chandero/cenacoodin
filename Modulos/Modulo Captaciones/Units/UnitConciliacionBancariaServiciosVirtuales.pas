unit UnitConciliacionBancariaServiciosVirtuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvToolEdit;

type
  TfrmConciliacionBancariaServiciosVirtuales = class(TForm)
    GroupBox1: TGroupBox;
    OD1: TOpenDialog;
    edComautFile: TJvFilenameEdit;
    Label1: TLabel;
    Label2: TLabel;
    edAutconFile: TJvFilenameEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConciliacionBancariaServiciosVirtuales: TfrmConciliacionBancariaServiciosVirtuales;

implementation

{$R *.dfm}

end.
