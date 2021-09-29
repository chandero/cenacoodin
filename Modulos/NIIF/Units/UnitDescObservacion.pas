unit UnitDescObservacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmDescObsrevacion = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Mobservacion: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDescObsrevacion: TFrmDescObsrevacion;

implementation

{$R *.dfm}

procedure TFrmDescObsrevacion.BitBtn1Click(Sender: TObject);
begin
        Mobservacion.Text := '';
        Close;
end;

end.
