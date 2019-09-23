unit UnitDesreferencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, DBClient;

type
  TFrmReferencias = class(TForm)
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    ClientDataSet1nombre: TStringField;
    ClientDataSet1telefono: TStringField;
    ClientDataSet1direccion: TStringField;
    ClientDataSet1tipo_referencia: TStringField;
    ClientDataSet1parentesco: TStringField;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReferencias: TFrmReferencias;

implementation

{$R *.dfm}

procedure TFrmReferencias.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

end.
