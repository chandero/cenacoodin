unit UnitConsultaCanje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, ExtCtrls;

type
  TFrmConsultaCanje = class(TForm)
    GroupBox1: TGroupBox;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    IBQuery1NUMERO_CHEQUE: TIntegerField;
    IBQuery1ID_TIPO_CAPTACION: TSmallintField;
    IBQuery1NUMERO_CUENTA: TIntegerField;
    IBQuery1FECHA_ENTRADA: TDateField;
    IBQuery1VALOR_CHEQUE: TIBBCDField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaCanje: TFrmConsultaCanje;

implementation

{$R *.dfm}

procedure TFrmConsultaCanje.Button2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmConsultaCanje.Button1Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Open;
        end;
end;

end.
