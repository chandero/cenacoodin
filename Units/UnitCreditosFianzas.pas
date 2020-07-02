unit UnitCreditosFianzas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons;

type
  TFrmCreditosFianzas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CDcredito: TClientDataSet;
    DScredito: TDataSource;
    CDcreditocolocacion: TStringField;
    CDcreditovalor: TCurrencyField;
    CDcreditosaldo: TCurrencyField;
    CDcreditofecha: TDateField;
    CDcreditoestado: TStringField;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCreditosFianzas: TFrmCreditosFianzas;

implementation

{$R *.dfm}

procedure TFrmCreditosFianzas.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

end.
