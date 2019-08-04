unit UnitAgregarObservacionSol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TfrmAgregarObservacionSol = class(TForm)
    Panel1: TPanel;
    EdFechaObservacion: TDateTimePicker;
    Label1: TLabel;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCancelar: TBitBtn;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
  private
    { Private declarations }
    FMemo:string;
    FFechaObs:TDate;
  public
    { Public declarations }
    property FechaObs:TDate read FFechaObs Write FFechaObs;
    property Memo:string read FMemo Write FMemo;
  end;

var
  frmAgregarObservacionSol: TfrmAgregarObservacionSol;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmAgregarObservacionSol.FormShow(Sender: TObject);
begin
        EdFechaObservacion.Date := fFechaActual;
        Memo1.SetFocus;
end;

procedure TfrmAgregarObservacionSol.CmdAceptarClick(Sender: TObject);
begin
        FFechaObs := EdFechaObservacion.Date;
        FMemo := Memo1.Text;
end;

end.
