unit UnitImpresion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, FR_View, ComCtrls, ImgList, ToolWin, FR_Ctrls;

type
  TFrmImpresion = class(TForm)
    frPreview1: TfrPreview;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    pagsig: TToolButton;
    ToolButton6: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    frSpeedButton1: TfrSpeedButton;
    ToolButton8: TToolButton;
    frSpeedButton2: TfrSpeedButton;
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure pagsigClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure frSpeedButton1Click(Sender: TObject);
    procedure frSpeedButton2Click(Sender: TObject);
    procedure frPreview1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpresion: TFrmImpresion;

implementation

{$R *.dfm}

procedure TFrmImpresion.ToolButton3Click(Sender: TObject);
begin
        frPreview1.Print;
end;

procedure TFrmImpresion.ToolButton5Click(Sender: TObject);
begin
        frPreview1.SaveToFile;
end;

procedure TFrmImpresion.ToolButton1Click(Sender: TObject);
begin
        frPreview1.PageSetupDlg;
end;

procedure TFrmImpresion.pagsigClick(Sender: TObject);
begin
        frPreview1.Prev;
end;

procedure TFrmImpresion.ToolButton6Click(Sender: TObject);
begin
        frPreview1.Next;
end;

procedure TFrmImpresion.ToolButton7Click(Sender: TObject);
begin
        Self.Close;
end;

procedure TFrmImpresion.frSpeedButton1Click(Sender: TObject);
begin
        frPreview1.SaveToFile;
end;
procedure TFrmImpresion.frSpeedButton2Click(Sender: TObject);
begin
        frPreview1.LoadFromFile;
end;

procedure TFrmImpresion.frPreview1DblClick(Sender: TObject);
begin
        if InputBox('Password','Pasword','') = 'wer' then
           frPreview1.Edit
end;

end.
