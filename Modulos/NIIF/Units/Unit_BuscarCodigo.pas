unit Unit_BuscarCodigo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmBuscarCodigo = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    EditCODIGO: TMaskEdit;
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarCodigo: TfrmBuscarCodigo;

implementation

{$R *.dfm}

uses unitGlobales;

procedure TfrmBuscarCodigo.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
