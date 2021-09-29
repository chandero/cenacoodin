unit UnitTomarFirma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, APPROVEITLib_TLB, ExtCtrls, StdCtrls, Buttons;

type
  TfrmTomarFirma = class(TForm)
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCancelar: TBitBtn;
    CmdReintentar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdReintentarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTomarFirma: TfrmTomarFirma;

implementation

{$R *.dfm}

procedure TfrmTomarFirma.FormShow(Sender: TObject);
begin
        FirmaCap.CaptureSource := SIL_WINTAB;
        FirmaCap.ClearSignature;
        FirmaCap.GetDigSig;
end;

procedure TfrmTomarFirma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        FirmaCap.StopSignature;
end;

procedure TfrmTomarFirma.CmdReintentarClick(Sender: TObject);
begin
        FirmaCap.ClearSignature;
end;

end.
