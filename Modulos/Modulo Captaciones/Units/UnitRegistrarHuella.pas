unit UnitRegistrarHuella;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, OleCtrls, DPFPCtlXLib_TLB, ExtCtrls;

type
  TfrmRegistrarHuella = class(TForm)
    btnCancelar: TBitBtn;
    btnValidar: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
  private
    { Private declarations }
    TomaHuella : Boolean;
  public
    { Public declarations }
    property Valido:Boolean Read TomaHuella Write TomaHuella;
  end;

var
  frmRegistrarHuella: TfrmRegistrarHuella;

implementation

{$R *.dfm}

end.
