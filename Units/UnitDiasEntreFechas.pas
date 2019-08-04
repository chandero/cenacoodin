unit UnitDiasEntreFechas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmDiasEntreFechas = class(TForm)
    Label1: TLabel;
    EdFI: TDateTimePicker;
    Label2: TLabel;
    EdFF: TDateTimePicker;
    Label3: TLabel;
    EdDias: TStaticText;
    Panel1: TPanel;
    btnCalcular: TBitBtn;
    btnCerrar: TBitBtn;
    Label4: TLabel;
    EdFC: TDateTimePicker;
    chkB: TCheckBox;
    RG: TRadioGroup;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDiasEntreFechas: TfrmDiasEntreFechas;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmDiasEntreFechas.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmDiasEntreFechas.btnCalcularClick(Sender: TObject);
var dias:Integer;
begin
        case RG.ItemIndex of
          0: dias := DiasEnFechas(EdFI.Date,EdFF.Date,EdFC.Date,chkB.Checked);
//          1: dias := DiasEntreFechas(EdFI.Date,EdFF.Date,EdFC.Date,chkB.Checked);
//          2: dias := DiasEntreFechas1(EdFI.Date,EdFF.Date,EdFC.Date,chkB.Checked,False);
        end;
        EdDias.Caption := IntToStr(dias);
end;

end.
