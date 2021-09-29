unit UnitTomarFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, tscap32_rt, StdCtrls, Buttons;

type
  TfrmTomarFoto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    VideoCap: TtsCap32;
    CmdTomarFoto: TBitBtn;
    BitBtn1: TBitBtn;
    procedure CmdTomarFotoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTomarFoto: TfrmTomarFoto;

implementation

{$R *.dfm}

procedure TfrmTomarFoto.CmdTomarFotoClick(Sender: TObject);
begin
        VideoCap.SaveAsBMP := 'C:\foto.bmp';
end;

procedure TfrmTomarFoto.FormShow(Sender: TObject);
begin
        VideoCap.Driver := 0;
        VideoCap.Connected := not VideoCap.Connected;
end;

procedure TfrmTomarFoto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        VideoCap.Connected := not VideoCap.Connected;
end;

end.
