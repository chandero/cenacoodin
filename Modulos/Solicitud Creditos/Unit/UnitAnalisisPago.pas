unit UnitAnalisisPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvEdit, JvTypedEdit, JvLabel, JvCheckBox,
  Buttons;

type
  TFrmAnalisisPago = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    JVinresos: TJvCurrencyEdit;
    JVdeduccion: TJvCurrencyEdit;
    JVdisponible: TJvCurrencyEdit;
    JVdisppago: TJvCurrencyEdit;
    JVcuota: TJvCurrencyEdit;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JVsolvencia: TJvCheckBox;
    JvLabel5: TJvLabel;
    JVexperencia: TJvEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAnalisisPago: TFrmAnalisisPago;

implementation

{$R *.dfm}

procedure TFrmAnalisisPago.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

end.
