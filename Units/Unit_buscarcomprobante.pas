unit Unit_buscarcomprobante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tfrmbuscarcomprobante = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    EditCODIGO: TMaskEdit;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label2: TLabel;
    EditAgencia: TMaskEdit;
    procedure EditCODIGOKeyPress(Sender: TObject; var Key: Char);
    procedure EditAgenciaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbuscarcomprobante: Tfrmbuscarcomprobante;

implementation

{$R *.dfm}


procedure Tfrmbuscarcomprobante.EditCODIGOKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
        editagencia.SetFocus;
end;

procedure Tfrmbuscarcomprobante.EditAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
        BtnAceptar.SetFocus;
end;

end.
