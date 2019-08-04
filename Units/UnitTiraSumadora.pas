unit UnitTiraSumadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TFrmTiraSumadora = class(TForm)
    Panel1: TPanel;
    dtFecha: TDateTimePicker;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    mCalc: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTiraSumadora: TFrmTiraSumadora;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmTiraSumadora.BitBtn1Click(Sender: TObject);
var
        _sArchivo :string;
begin
        mCalc.Lines.Clear;
        _sArchivo := 'c:\sum\' + FormatDateTime('yyyymmdd',dtFecha.DateTime) + '\sum_' + FormatDateTime('yyyymmdd',dtFecha.DateTime)+ '_'+FormatCurr('00',_sIdCaja) + '_' + DBAlias + '.sum';
        try
          mCalc.Lines.LoadFromFile(_sArchivo);
        except
          mCalc.Lines.Add('Tira no Encontrada');
        end;
end;

procedure TFrmTiraSumadora.Button1Click(Sender: TObject);
begin
        Close;
end;

end.
