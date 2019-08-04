unit UnitTipoImpresion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmTipoImpresion = class(TForm)
    RGTipoImpresion: TRadioGroup;
    Panel1: TPanel;
    btnAceptar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure RGTipoImpresionClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FTipoImpresion:Integer;
  public
    { Public declarations }
    property TipoImpresion:Integer read ftipoimpresion Write ftipoimpresion;
  end;

var
  frmTipoImpresion: TfrmTipoImpresion;

implementation

{$R *.dfm}

procedure TfrmTipoImpresion.FormCreate(Sender: TObject);
begin
        FTipoImpresion := 0;
end;

procedure TfrmTipoImpresion.RGTipoImpresionClick(Sender: TObject);
begin
        FTipoImpresion := RGTipoImpresion.ItemIndex;
end;

procedure TfrmTipoImpresion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        if ModalResult <> mrOk then
           CanClose := False;
end;

end.
