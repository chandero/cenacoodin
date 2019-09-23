unit UnitGarantiaReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TfrmGarantiaReal = class(TForm)
    GroupBox1: TGroupBox;
    EdEscritura: TLabeledEdit;
    Label1: TLabel;
    EdFechaEscritura: TDateTimePicker;
    EdCiudad: TLabeledEdit;
    EdMatricula: TLabeledEdit;
    EdFechaRegistro: TDateTimePicker;
    Label2: TLabel;
    Label10: TLabel;
    EdValorAvaluo: TMemo;
    Label3: TLabel;
    EdCuentasOrden: TMemo;
    EdPoliza: TLabeledEdit;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    EdNotaria: TComboBox;
    Label4: TLabel;
    EdValorAsegurado: TMemo;
    EdFechaIPoliza: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdFechaFPoliza: TDateTimePicker;
    Label8: TLabel;
    EdFechaAvaluo: TDateTimePicker;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdPolizaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdAceptarClick(Sender: TObject);
    procedure EdValorAvaluoEnter(Sender: TObject);
    procedure EdValorAvaluoExit(Sender: TObject);
    procedure EdCuentasOrdenEnter(Sender: TObject);
    procedure EdCuentasOrdenExit(Sender: TObject);
    procedure EdValorAseguradoEnter(Sender: TObject);
    procedure EdValorAseguradoExit(Sender: TObject);
  private
    function GetEscritura:String;
    function GetFechaEscritura:TDate;
    function GetCiudadEscritura:String;
    function GetNotaria:String;
    function GetMatricula:String;
    function GetFechaRegistro:TDate;
    function GetValorAvaluo:Currency;
    function GetFechaAvaluo:TDate;
    function GetCuentasOrden:Currency;
    function GetValorAsegurado:Currency;
    function GetFechaIPoliza:TDate;
    function GetFechaFPoliza:TDate;
    function GetPoliza:String;
    procedure SetEscritura(vNewValue:String);
    procedure SetFechaEscritura(vNewValue:TDate);
    procedure SetCiudadEscritura(vNewValue:String);
    procedure SetNotaria(vNewValue:String);
    procedure SetMatricula(vNewValue:String);
    procedure SetFechaRegistro(vNewValue:TDate);
    procedure SetValorAvaluo(vNewValue:Currency);
    procedure SetFechaAvaluo(vNewValue:TDate);
    procedure SetCuentasOrden(vNewValue:Currency);
    procedure SetValorAsegurado(vNewValue:Currency);
    procedure SetFechaIPoliza(vNewValue:TDate);
    procedure SetFechaFPoliza(vNewValue:TDate);
    procedure SetPoliza(vNewValue:String);
    { Private declarations }
  public
    property Escritura:String read GetEscritura write SetEscritura;
    property FechaEscritura:TDate read GetFechaEscritura write SetFechaEscritura;
    property CiudadEscritura:String read GetCiudadEscritura write SetCiudadEscritura;
    property Notaria:String read GetNotaria write SetNotaria;
    property Matricula:String read GetMatricula write SetMatricula;
    property FechaRegistro:TDate read GetFechaRegistro write SetFechaRegistro;
    property ValorAvaluo:Currency read GetValorAvaluo write SetValorAvaluo;
    property FechaAvaluo:TDate read GetFechaAvaluo write SetFechaAvaluo;
    property CuentasOrden:Currency read GetCuentasOrden write SetCuentasOrden;
    property ValorAsegurado:Currency read GetValorAsegurado write SetValorAsegurado;
    property FechaIPoliza:TDate read GetFechaIPoliza write SetFechaIPoliza;
    property FechaFPoliza:TDate read GetFechaFPoliza write SetFechaFPoliza;
    property Poliza:String read GetPoliza write SetPoliza;
    { Public declarations }
  end;

var
  frmGarantiaReal: TfrmGarantiaReal;

implementation

{$R *.dfm}

uses UnitGlobales;

var
        vEscritura:String;
        vFechaEscritura:TDate;
        vCiudadEscritura:String;
        vNotaria:String;
        vMatricula:String;
        vFechaRegistro:TDate;
        vValorAvaluo:Currency;
        vFechaAvaluo:TDate;
        vCuentasOrden:Currency;
        vValorAsegurado:Currency;
        vFechaIPoliza:TDate;
        vFechaFPoliza:TDate;
        vPoliza:String;

function TfrmGarantiaReal.GetEscritura:String;
begin
        Result := vEscritura;
end;

function TfrmGarantiaReal.GetFechaEscritura:TDate;
begin
        Result := vFechaEscritura;
end;

function TfrmGarantiaReal.GetCiudadEscritura:String;
begin
        Result := vCiudadEscritura;
end;

function TfrmGarantiaReal.GetNotaria:String;
begin
        Result := vNotaria;
end;

function TfrmGarantiaReal.GetMatricula:String;
begin
        Result := vMatricula;
end;

function TfrmGarantiaReal.GetFechaRegistro:TDate;
begin
        Result := vFechaRegistro;
end;

function TfrmGarantiaReal.GetValorAvaluo:Currency;
begin
        Result := vValorAvaluo;
end;

function TfrmGarantiaReal.GetFechaAvaluo:TDate;
begin
        Result := vFechaAvaluo;
end;

function TfrmGarantiaReal.GetCuentasOrden:Currency;
begin
        Result := vCuentasOrden;
end;

function TfrmGarantiaReal.GetValorAsegurado:Currency;
begin
        Result := vValorAsegurado;
end;

function TfrmGarantiaReal.GetFechaIPoliza:TDate;
begin
        Result := vFechaIPoliza;
end;

function TfrmGarantiaReal.GetFechaFPoliza:TDate;
begin
        Result := vFechaFPoliza;
end;

function TfrmGarantiaReal.GetPoliza:String;
begin
        Result := vPoliza;
end;

procedure TfrmGarantiaReal.SetEscritura(vNewValue:String);
begin
        vEscritura := vNewValue;
end;

procedure TfrmGarantiaReal.SetFechaEscritura(vNewValue:TDate);
begin
        vFechaEscritura := vNewValue;
end;

procedure TfrmGarantiaReal.SetCiudadEscritura(vNewValue:String);
begin
        vCiudadEscritura := vNewValue;
end;

procedure TfrmGarantiaReal.SetNotaria(vNewValue:String);
begin
        vNotaria := vNewValue;
end;

procedure TfrmGarantiaReal.SetMatricula(vNewValue:String);
begin
        vMatricula := vNewValue;
end;

procedure TfrmGarantiaReal.SetFechaRegistro(vNewValue:TDate);
begin
        vFechaRegistro := vNewValue;
end;

procedure TfrmGarantiaReal.SetValorAvaluo(vNewValue:Currency);
begin
        vValorAvaluo := vNewValue;
end;

procedure TfrmGarantiaReal.SetFechaAvaluo(vNewValue:TDate);
begin
        vFechaAvaluo := vNewValue;
end;

procedure TfrmGarantiaReal.SetCuentasOrden(vNewValue:Currency);
begin
        vCuentasOrden := vNewValue;
end;

procedure TfrmGarantiaReal.SetValorAsegurado(vNewValue:Currency);
begin
        vValorAsegurado := vNewValue;
end;

procedure TfrmGarantiaReal.SetFechaIPoliza(vNewValue:TDate);
begin
        vFechaIPoliza := vNewValue;
end;

procedure TfrmGarantiaReal.SetFechaFPoliza(vNewValue:TDate);
begin
        vFechaFPoliza := vNewValue;
end;

procedure TfrmGarantiaReal.SetPoliza(vNewValue:String);
begin
        vPoliza := vNewValue;
end;

procedure TfrmGarantiaReal.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmGarantiaReal.FormCreate(Sender: TObject);
begin
        EdFechaEscritura.Date := Date;
        EdFechaRegistro.Date := Date;
        EdFechaIPoliza.Date := Date;
        EdFechaAvaluo.Date := Date;

end;

procedure TfrmGarantiaReal.EdPolizaExit(Sender: TObject);
begin
        CmdAceptar.Enabled := True;
        CmdAceptar.SetFocus;
end;

procedure TfrmGarantiaReal.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmGarantiaReal.CmdAceptarClick(Sender: TObject);
begin
        Escritura := EdEscritura.Text;
        FechaEscritura := EdFechaEscritura.Date;
        CiudadEscritura := EdCiudad.Text;
        Notaria := EdNotaria.Text;
        Matricula := EdMatricula.Text;
        FechaAvaluo := EdFechaAvaluo.Date;
        FechaRegistro := EdFechaRegistro.Date;
        FechaIPoliza := EdFechaIPoliza.Date;
        FechaFPoliza := EdFechaFPoliza.Date;
        Poliza := EdPoliza.Text;


end;

procedure TfrmGarantiaReal.EdValorAvaluoEnter(Sender: TObject);
begin
        EdValorAvaluo.Text := FormatCurr('0.00',ValorAvaluo);
        EdValorAvaluo.SelectAll;
end;

procedure TfrmGarantiaReal.EdValorAvaluoExit(Sender: TObject);
begin
        if EdValorAvaluo.Text = '' then EdValorAvaluo.Text := '0.00';
        ValorAvaluo := StrToFloat(EdValorAvaluo.Text);
        EdValorAvaluo.Text := FormatCurr('#,##0.00',ValorAvaluo);
end;

procedure TfrmGarantiaReal.EdCuentasOrdenEnter(Sender: TObject);
begin
        EdCuentasOrden.Text := FormatCurr('0.00',CuentasOrden);
        EdCuentasOrden.SelectAll;
end;

procedure TfrmGarantiaReal.EdCuentasOrdenExit(Sender: TObject);
begin
        if EdCuentasOrden.Text = '' then EdCuentasOrden.Text := '0.00';
        CuentasOrden := StrToFloat(EdCuentasOrden.Text);
        EdCuentasOrden.Text := FormatCurr('#,##0.00',CuentasOrden);
end;

procedure TfrmGarantiaReal.EdValorAseguradoEnter(Sender: TObject);
begin
        EdValorAsegurado.Text := FormatCurr('0.00',ValorAsegurado);
        EdValorAsegurado.SelectAll;
end;

procedure TfrmGarantiaReal.EdValorAseguradoExit(Sender: TObject);
begin
        if EdValorAsegurado.Text = '' then EdValorAsegurado.Text := '0.00';
        ValorAsegurado := StrToFloat(EdValorAsegurado.Text);
        EdValorAsegurado.Text := FormatCurr('#,##0.00',ValorAsegurado);
end;

end.
