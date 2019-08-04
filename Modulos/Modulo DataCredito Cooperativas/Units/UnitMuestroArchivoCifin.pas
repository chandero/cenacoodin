unit UnitMuestroArchivoCifin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pr_CommonPreviewPanel, pr_TxPreviewPanel, StdCtrls;

type
  TfrmMuestroArchivoCifin = class(TForm)
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
  FechaC:string;
    { Private declarations }
  public
  property FechaCorte: string read FechaC Write FechaC;
    { Public declarations }
  end;

var
  frmMuestroArchivoCifin: TfrmMuestroArchivoCifin;

implementation

{$R *.dfm}

procedure TfrmMuestroArchivoCifin.FormShow(Sender: TObject);
begin
          Memo1.Lines.LoadFromFile('c:/Cifin' + FechaCorte + '.TXT');
end;

end.
