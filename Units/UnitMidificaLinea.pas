unit UnitMidificaLinea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBQuery;

type
  TFrmModificaLinea = class(TForm)
    TabLineas: TPageControl;
    TabModifica: TTabSheet;
    TabCrea: TTabSheet;
    Label1: TLabel;
    EDdescripcion: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    IBlinea: TIBQuery;
    DSlinea: TDataSource;
    DBlinea: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure TabModificaShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModificaLinea: TFrmModificaLinea;

implementation

{$R *.dfm}

procedure TFrmModificaLinea.FormCreate(Sender: TObject);
begin
        TabLineas.ActivePageIndex := 0;
        with IBlinea do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Open;
          Last;
        end;
end;

procedure TFrmModificaLinea.TabModificaShow(Sender: TObject);
begin
        DBlinea.SetFocus;
end;

end.
