unit UnitAgregarObservacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TfrmAgregarObservacionCobro = class(TForm)
    Panel1: TPanel;
    EdFechaObservacion: TDateTimePicker;
    Label1: TLabel;
    ChkCompromiso: TCheckBox;
    Label2: TLabel;
    EdFechaCompromiso: TDateTimePicker;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCancelar: TBitBtn;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure ChkCompromisoClick(Sender: TObject);
  private
    { Private declarations }
    FMemo:string;
    FFechaObs:TDate;
    FEsCompromiso:Boolean;
    FFechaCom:TDate;
  public
    { Public declarations }
    property FechaObs:TDate read FFechaObs Write FFechaObs;
    property FechaCom:TDate read FFechaCom Write FFechaCom;
    property EsCompromiso:Boolean read FEsCompromiso Write FEsCompromiso;
    property Memo:string read FMemo Write FMemo;
  end;

var
  frmAgregarObservacionCobro: TfrmAgregarObservacionCobro;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmAgregarObservacionCobro.FormShow(Sender: TObject);
begin
        EdFechaObservacion.Date := fFechaActual;
        EdFechaCompromiso.Date := fFechaActual;
end;

procedure TfrmAgregarObservacionCobro.CmdAceptarClick(Sender: TObject);
begin
        FFechaObs := EdFechaObservacion.Date;
        FFechaCom := EdFechaCompromiso.Date;
        FEsCompromiso := ChkCompromiso.Checked;
        FMemo := Memo1.Text;
end;

procedure TfrmAgregarObservacionCobro.ChkCompromisoClick(Sender: TObject);
begin
        if ChkCompromiso.Checked then
           EdFechaCompromiso.Enabled := true
        else
        begin
           EdFechaCompromiso.Date := Date;
           EdFechaCompromiso.Enabled := False;
        end;
end;

end.
