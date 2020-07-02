unit UnitCreditosFianzas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons,
  JvEdit, JvTypedEdit;

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
    Panel3: TPanel;
    Label1: TLabel;
    valor: TJvCurrencyEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCreditosFianzas: TFrmCreditosFianzas;

implementation

uses UnitExtractoCredito,UnitGlobales;

{$R *.dfm}

procedure TFrmCreditosFianzas.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmCreditosFianzas.DBGrid1DblClick(Sender: TObject);
begin
        frmExtractoCredito := TfrmExtractoCredito.Create(Self);
        frmExtractoCredito.Colocacion := CDcreditocolocacion.Value;
        frmExtractoCredito.AgenciaC := Agencia;
        frmExtractoCredito.ShowModal;

end;

end.
