unit UnitCalculoTasas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmCalculoTasas = class(TForm)
    Panel1: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    ControlTipoTasa: TPageControl;
    InfoNomEfec: TTabSheet;
    InfoEfecNom: TTabSheet;
    Panel3: TPanel;
    RadioNominal: TRadioGroup;
    GroupBox3: TGroupBox;
    EdTasaEfecAnt: TLabeledEdit;
    EdAmortizaEfecAnt: TLabeledEdit;
    EdResNomAnt: TLabeledEdit;
    GroupBox4: TGroupBox;
    EdTasaEfecVen: TLabeledEdit;
    EdAmortizaEfecVen: TLabeledEdit;
    EdResNomVen: TLabeledEdit;
    Panel2: TPanel;
    RadioEfectiva: TRadioGroup;
    GroupBox1: TGroupBox;
    EdTasaNomAnt: TLabeledEdit;
    EdAmortizaNomAnt: TLabeledEdit;
    EdResEfecAnt: TLabeledEdit;
    GroupBox2: TGroupBox;
    EdTasaNomVen: TLabeledEdit;
    EdAmortizaNomVen: TLabeledEdit;
    EdResEfecVen: TLabeledEdit;
    edMensualNominal: TLabeledEdit;
    edMensualNominalAnticipada: TLabeledEdit;
    edMensualEfectiva: TLabeledEdit;
    edEfectivaAnticipadaMensual: TLabeledEdit;
    procedure EdTasaNomAntExit(Sender: TObject);
    procedure EdAmortizaNomAntExit(Sender: TObject);
    procedure EdTasaNomVenExit(Sender: TObject);
    procedure EdAmortizaNomVenExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EsAnticipadaKeyPress(Sender: TObject; var Key: Char);
    procedure EsVencidaKeyPress(Sender: TObject; var Key: Char);
    procedure EdTasaNomVenKeyPress(Sender: TObject; var Key: Char);
    procedure EdAmortizaNomVenKeyPress(Sender: TObject; var Key: Char);
    procedure EdAmortizaNomAntKeyPress(Sender: TObject; var Key: Char);
    procedure EdTasaNomAntKeyPress(Sender: TObject; var Key: Char);
    procedure RadioEfectivaClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdTasaEfecAntExit(Sender: TObject);
    procedure RadioNominalClick(Sender: TObject);
    procedure EdAmortizaEfecAntExit(Sender: TObject);
    procedure EdTasaEfecVenExit(Sender: TObject);
    procedure EdAmortizaEfecVenExit(Sender: TObject);
    procedure EdTasaEfecAntKeyPress(Sender: TObject; var Key: Char);
    procedure EdAmortizaEfecAntKeyPress(Sender: TObject; var Key: Char);
    procedure EdTasaEfecVenKeyPress(Sender: TObject; var Key: Char);
    procedure EdAmortizaEfecVenKeyPress(Sender: TObject; var Key: Char);
    procedure ControlTipoTasaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculoTasas: TfrmCalculoTasas;
  TasaNominalAnt : Double;
  TasaNominalVen : Double;
  TasaEfectivaAnt: Double;
  TasaEfectivaVen: Double;
  Amortizacion   : Integer;
  Resultado      : Double;

implementation

uses UnitGlobalesCol, UnitGlobales;

{$R *.dfm}

procedure TfrmCalculoTasas.EdTasaNomAntExit(Sender: TObject);
begin
        if EdTasaNomAnt.Text <> '' then
           TasaNominalAnt := StrtoFloat(EdTasaNomAnt.Text)
        else
           TasaNominalAnt := 0;
end;

procedure TfrmCalculoTasas.EdAmortizaNomAntExit(Sender: TObject);
begin
        if EdAmortizaNomAnt.Text <> '' then
           Amortizacion := StrtoInt(EdAmortizaNomAnt.Text)
        else
           Amortizacion := 0;
        CmdAceptar.SetFocus;
end;

procedure TfrmCalculoTasas.EdTasaNomVenExit(Sender: TObject);
begin
        if EdTasaNomVen.Text <> '' then
           TasaNominalVen := StrToFloat(EdTasaNomVen.Text)
        else
           TasaNominalVen := 0;
end;

procedure TfrmCalculoTasas.EdAmortizaNomVenExit(Sender: TObject);
begin
        if EdAmortizaNomVen.Text <> '' then
           Amortizacion := StrToInt(EdAmortizaNomVen.Text)
        else
           Amortizacion := 0;
        CmdAceptar.SetFocus;
end;

procedure TfrmCalculoTasas.CmdAceptarClick(Sender: TObject);
begin
        if ControlTipoTasa.ActivePage = InfoEfecNom then
           begin
             if RadioNominal.ItemIndex = 0 then
                EdResNomAnt.Text := FormatCurr('#0.00',(TasaNominalAnticipada(TasaEfectivaAnt,Amortizacion)));
                edEfectivaAnticipadaMensual.Text := FormatCurr('#0.00',(TasaNominalAnticipada(TasaEfectivaAnt,Amortizacion)/12));
                edMensualNominalAnticipada.Text := FormatCurr('#0.00',(TasaNominalAnticipada(TasaEfectivaAnt,Amortizacion)/12));
             if RadioNominal.ItemIndex = 1 then
                EdResNomVen.Text := FormatCurr('#0.00',(TasaNominalVencida(TasaEfectivaVen,Amortizacion)));
                edMensualNominal.Text := FormatCurr('#0.00', (TasaNominalVencida(TasaEfectivaVen,Amortizacion)/12));
           end;

        if ControlTipoTasa.ActivePage = InfoNomEfec then
           begin
             if RadioEfectiva.ItemIndex = 0 then
                EdResEfecAnt.Text := FormatCurr('#0.00',(TasaEfectivaAnticipada(TasaNominalAnt,Amortizacion)));
             if RadioEfectiva.ItemIndex = 1 then
                EdResEfecVen.Text := FormatCurr('#0.00',(TasaEfectivaVencida(TasaNominalVen,Amortizacion)));
                edMensualEfectiva.Text := FormatCurr('#0.00',(TasaEfectivaVencida(TasaNominalVen,Amortizacion)/12));
           end;
end;

procedure TfrmCalculoTasas.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.EsAnticipadaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.EsVencidaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.EdTasaNomVenKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.EdAmortizaNomVenKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.EdAmortizaNomAntKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.EdTasaNomAntKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.RadioEfectivaClick(Sender: TObject);
begin
        Case RadioEfectiva.ItemIndex of
           0 : begin
                 GroupBox1.Visible := True;
                 EdTasaNomAnt.Text := '';
                 EdAmortizaNomAnt.Text := '';
                 EdResEfecAnt.Text := '';
                 EdTasaNomAnt.SetFocus;
                 GroupBox2.Visible := False;
               end;
           1 : begin
                 GroupBox2.Visible := True;
                 EdTasaNomVen.Text := '';
                 EdAmortizaNomVen.Text := '';
                 EdResEfecVen.Text := '';
                 EdTasaNomVen.SetFocus;
                 GroupBox1.Visible := False;
               end;
        end;
end;

procedure TfrmCalculoTasas.CmdCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmCalculoTasas.EdTasaEfecAntExit(Sender: TObject);
begin
        if EdTasaEfecAnt.Text <> '' then
           TasaEfectivaAnt := StrtoFloat(EdTasaEfecAnt.Text)
        else
           TasaEfectivaAnt := 0;
end;

procedure TfrmCalculoTasas.RadioNominalClick(Sender: TObject);
begin
        Case RadioNominal.ItemIndex of
           0 : begin
                 GroupBox3.Visible := True;
                 EdTasaEfecAnt.Text := '';
                 EdAmortizaEfecAnt.Text := '';
                 EdResNomAnt.Text := '';
                 EdTasaEfecAnt.SetFocus;
                 GroupBox4.Visible := False;
               end;
           1 : begin
                 GroupBox4.Visible := True;
                 EdTasaEfecVen.Text := '';
                 EdAmortizaEfecVen.Text := '';
                 EdResNomVen.Text := '';
                 EdTasaEfecVen.SetFocus;
                 GroupBox3.Visible := False;
               end;
        end;
end;

procedure TfrmCalculoTasas.EdAmortizaEfecAntExit(Sender: TObject);
begin
        if EdAmortizaEfecAnt.Text <> '' then
           Amortizacion := StrtoInt(EdAmortizaEfecAnt.Text)
        else
           Amortizacion := 0;
        CmdAceptar.SetFocus;
end;

procedure TfrmCalculoTasas.EdTasaEfecVenExit(Sender: TObject);
begin
        if EdTasaEfecVen.Text <> '' then
           TasaEfectivaVen := StrToFloat(EdTasaEfecVen.Text)
        else
           TasaEfectivaVen := 0;
end;

procedure TfrmCalculoTasas.EdAmortizaEfecVenExit(Sender: TObject);
begin
        if EdAmortizaEfecVen.Text <> '' then
           Amortizacion := StrToInt(EdAmortizaEfecVen.Text)
        else
           Amortizacion := 0;
        CmdAceptar.SetFocus;
end;

procedure TfrmCalculoTasas.EdTasaEfecAntKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.EdAmortizaEfecAntKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.EdTasaEfecVenKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.EdAmortizaEfecVenKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCalculoTasas.ControlTipoTasaChange(Sender: TObject);
begin
        if ControlTipoTasa.TabIndex = 0 then
           RadioEfectivaClick(Sender);
        if ControlTipoTasa.TabIndex = 1 then
           RadioNominalClick(Sender);
end;

procedure TfrmCalculoTasas.FormShow(Sender: TObject);
begin
        if ControlTipoTasa.TabIndex = 0 then
           RadioEfectivaClick(Sender);
        if ControlTipoTasa.TabIndex = 1 then
           RadioNominalClick(Sender);
end;

end.
