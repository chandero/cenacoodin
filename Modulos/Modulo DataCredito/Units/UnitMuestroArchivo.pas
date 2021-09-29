unit UnitMuestroArchivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pr_CommonPreviewPanel, pr_TxPreviewPanel, StdCtrls;

type
  TfrmMuestroArchivo = class(TForm)
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
  frmMuestroArchivo: TfrmMuestroArchivo;

implementation

{$R *.dfm}

procedure TfrmMuestroArchivo.FormShow(Sender: TObject);
begin
          Memo1.Lines.LoadFromFile('c:/Datacredito/Datacredito' + FechaCorte + '.TXT');
end;

end.
