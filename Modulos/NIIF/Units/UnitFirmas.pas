unit UnitFirmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ExtCtrls, StdCtrls, Buttons, DB;

type
  TFrmFirmas = class(TForm)
    DBfirma: TDBImage;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DSfirmas: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFirmas: TFrmFirmas;

implementation
uses UnitOperacionesCaja;

{$R *.dfm}

procedure TFrmFirmas.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

end.
