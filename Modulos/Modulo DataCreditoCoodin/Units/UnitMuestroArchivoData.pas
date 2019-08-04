unit UnitMuestroArchivoData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pr_CommonPreviewPanel, pr_TxPreviewPanel, StdCtrls;

type
  TfrmMuestroArchivoData = class(TForm)
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
  frmMuestroArchivoData: TfrmMuestroArchivoData;

implementation

{$R *.dfm}

procedure TfrmMuestroArchivoData.FormShow(Sender: TObject);
begin
//          Memo1.Lines.LoadFromFile('c:/Datacredito' + FechaCorte + '.TXT');
          Memo1.Lines.LoadFromFile('c:/PTCAC270625' + FechaCorte + '.TXT');
end;

end.
