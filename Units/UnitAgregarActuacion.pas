unit UnitAgregarActuacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DBCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmAgregarActuacion = class(TForm)
    Panel1: TPanel;
    EdFechaObservacion: TDateTimePicker;
    Label1: TLabel;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCancelar: TBitBtn;
    EdObservacion: TMemo;
    Label2: TLabel;
    IBActuacion: TIBQuery;
    DSActuacion: TDataSource;
    CBtipoAct: TDBLookupComboBox;
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
  frmAgregarActuacion: TfrmAgregarActuacion;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmAgregarActuacion.FormShow(Sender: TObject);
begin
        EdFechaObservacion.Date := fFechaActual;
        EdFechaCompromiso.Date := fFechaActual;
end;

procedure TfrmAgregarActuacion.CmdAceptarClick(Sender: TObject);
begin
        FFechaObs := EdFechaObservacion.Date;
        FFechaCom := EdFechaCompromiso.Date;
        FEsCompromiso := ChkCompromiso.Checked;
        FMemo := Memo1.Text;
end;

procedure TfrmAgregarActuacion.ChkCompromisoClick(Sender: TObject);
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
