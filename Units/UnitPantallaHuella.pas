unit UnitPantallaHuella;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvSpecialLabel, ExtCtrls, JvComponent,
  JvTransparentForm, JvLabel, JvBlinkingLabel;

type
  TfrmPantallaHuella = class(TForm)
    Image1: TImage;
    JvTransparentForm1: TJvTransparentForm;
    JvBlinkingLabel1: TJvBlinkingLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPantallaHuella: TfrmPantallaHuella;

implementation

{$R *.dfm}

procedure TfrmPantallaHuella.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Image1.Picture.Bitmap.FreeImage;
        Image1.Refresh;
end;

end.
