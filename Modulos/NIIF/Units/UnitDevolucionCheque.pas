unit UnitDevolucionCheque;

interface

uses
  Math, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB,
  IBCustomDataSet, IBQuery, IBDatabase, JvEdit, JvTypedEdit, Grids, DBGrids;

type
  TfrmDevolucionCheque = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBTransaction1: TIBTransaction;
    IBQBancos: TIBQuery;
    IBQAgencia: TIBQuery;
    IBQTipo: TIBQuery;
    Panel2: TPanel;
    sg1: TStringGrid;
    dblcbBanco: TDBLookupComboBox;
    dsBancos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure sg1DblClick(Sender: TObject);
    procedure sg1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TColumnWidthHelper = record
   Index : integer;
   MaxWidth : integer;
  end;

var
  frmDevolucionCheque: TfrmDevolucionCheque;
  ColumnWidthHelper: TColumnWidthHelper;

implementation

{$R *.dfm}


uses
unitDmGeneral,
unitGlobales;

procedure TfrmDevolucionCheque.FormCreate(Sender: TObject);
begin
  with IBQBancos do
  begin
     if Transaction.InTransaction then
       Transaction.RollBack;
     Transaction.StartTransaction;
     Open;
     Last;
     First;
  end;

  sg1.Cells[0,0] := 'Banco';
  sg1.Cells[1,0] := 'Cheque';
  sg1.Cells[2,0] := 'Valor';
  sg1.Cells[3,0] := 'Asociado';
  sg1.Cells[4,0] := 'Cuenta';
  sg1.ColWidths[0] := 200;
  sg1.ColWidths[1] := 100;
  sg1.ColWidths[2] := 100;
  sg1.ColWidths[3] := 250;
  sg1.ColWidths[4] := 100;

end;

procedure TfrmDevolucionCheque.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmDevolucionCheque.sg1DblClick(Sender: TObject);
var
   mouseInGrid : TPoint;
   gridCoord: TGridCoord;
begin
  //Convert "Screen" Mouse to "Grid" Mouse
  mouseInGrid := sg1.ScreenToClient(Mouse.CursorPos) ;
  gridCoord := sg1.MouseCoord(mouseInGrid.X, mouseInGrid.Y) ;

  //Titles displayed but we double-clicked on "regular" row?
  if gridCoord.Y <> 0 then Exit;

  //find Column index
//  if {dgIndicator} in sg1.Options then
//    ColumnWidthHelper.Index := -1 + gridCoord.x
//  else
    ColumnWidthHelper.Index := gridCoord.x;

  //Indicator Column?
  if ColumnWidthHelper.Index < 0 then Exit;
// continues belowend;
  //continues from above ...

   ColumnWidthHelper.MaxWidth := -1;

   //"recalculate" ColumnWidthHelper.MaxWidth
   sg1.Repaint;

   //"auto size" Column width
   sg1.ColWidths[ColumnWidthHelper.Index] := 4 + ColumnWidthHelper.MaxWidth;
end;

procedure TfrmDevolucionCheque.sg1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  //is this is the column we want to auto-size?
  if ACol = ColumnWidthHelper.Index then
  begin
    //find the widest string
    ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, sg1.Canvas.TextWidth(sg1.Cells[ACol,ARow])) ;
  end;

  if (gdFocused in State) then
  begin
    if (ACol = 0) then
    with dblcbBanco do
    begin
      Left := Rect.Left + sg1.Left + 2;
      Top := Rect.Top + sg1.Top + 2;
      Width := Rect.Right - Rect.Left;
      Width := Rect.Right - Rect.Left;
      Height := Rect.Bottom - Rect.Top;
      Visible := True;
    end;
  end
end;

end.
