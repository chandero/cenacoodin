unit UnitVistaPreliminar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pr_CommonPreviewPanel, pr_PreviewPanel, pr_ControlBar,pr_Common, pr_TxClasses,
  Buttons, ToolWin, ComCtrls, StdCtrls, ImgList, pr_TxPreviewPanel, Printers;
type
  TfrmVistaPreliminar = class(TForm)
    Manager: TprControlBarManager;
    ImageList1: TImageList;
    Vista: TprTxPreviewPanel;
    prControlBar1: TprControlBar;
    ToolBar1: TToolBar;
    CmdImprimir: TToolButton;
    ToolButton4: TToolButton;
    CmdAbrir: TToolButton;
    CmdGuardar: TToolButton;
    ToolButton5: TToolButton;
    CmdExportar: TToolButton;
    ToolButton7: TToolButton;
    Label1: TLabel;
    CBpaginas: TComboBox;
    ToolButton8: TToolButton;
    CmdBuscar: TToolButton;
    ToolButton10: TToolButton;
    CBzoom: TComboBox;
    ToolButton11: TToolButton;
    CmdCerrar: TToolButton;
    PrintDialog1: TPrintDialog;
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdImprimirClick(Sender: TObject);
    procedure CBpaginasChange(Sender: TObject);
    procedure CBzoomChange(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
  private
    MyReporte:TprTxReport;
  public
    property Reporte:TprTxReport read MyReporte Write MyReporte;
    { Public declarations }
  end;

var
  frmVistaPreliminar: TfrmVistaPreliminar;

implementation

{$R *.dfm}

uses pr_Utils, pr_Strings, pr_MultiLang, UnitBuscarTexto;


procedure TfrmVistaPreliminar.FormShow(Sender: TObject);
var i:Integer;
begin
        Vista.Report := Reporte;
        for i := 1 to Vista.Report.PagesCount do
        begin
          CBpaginas.Items.Add(IntToStr(i));  
        end;

end;

procedure TfrmVistaPreliminar.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmVistaPreliminar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := caFree;
end;

procedure TfrmVistaPreliminar.CmdImprimirClick(Sender: TObject);
begin
        if Vista.Report.SetupPrintParams then
           Vista.Report.PrintPreparedReport;

end;

procedure TfrmVistaPreliminar.CBpaginasChange(Sender: TObject);
begin
        Vista.CurPage := CBpaginas.ItemIndex;
end;

procedure TfrmVistaPreliminar.CBzoomChange(Sender: TObject);
begin
        case CBzoom.ItemIndex of
        0: Vista.Font.Size := 48;
        1: Vista.Font.Size := 25;
        2: Vista.Font.Size := 14;
        3: Vista.Font.Size := 12;
        4: Vista.Font.Size := 10;
        5: Vista.Font.Size := 9;
        6: Vista.Font.Size := 8;
        7: Vista.Font.Size := 6;
        8: Vista.Font.Size := 5;
        9: Vista.Font.Size := 4;
        end

end;

procedure TfrmVistaPreliminar.CmdBuscarClick(Sender: TObject);
var frmBuscarTexto:TfrmBuscarTexto;
    FromPos:TPoint;
    Pos:TPoint;
begin
       frmBuscarTexto := TfrmBuscarTexto.Create(Self);
       if frmBuscarTexto.ShowModal = mrOk then
       begin
          FromPos.X := 0;
          FromPos.Y := 0;
          if Vista.FindText(frmBuscarTexto.EdTexto.Text,True,True,FromPos,Pos) then
          begin
                Vista.SetCursorPos(Pos.X,Pos.Y,true); 
          end;
       end;


end;

end.
