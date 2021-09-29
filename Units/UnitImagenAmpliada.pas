unit UnitImagenAmpliada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvLabel, JvAppearingLabel;

type
  TfrmImagenAmpliada = class(TForm)
    Image1: TImage;
    JvAppearingLabel1: TJvAppearingLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FImagen:TBitmap;
  public
    { Public declarations }
    property Imagen:TBitmap read FImagen Write FImagen;
  end;

var
  frmImagenAmpliada: TfrmImagenAmpliada;

implementation

{$R *.dfm}

procedure TfrmImagenAmpliada.Image1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmImagenAmpliada.FormShow(Sender: TObject);
begin
        Image1.Picture.Graphic := Imagen;
end;

end.
