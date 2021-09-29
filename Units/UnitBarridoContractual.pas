unit UnitBarridoContractual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, pr_Common,
  pr_TxClasses, DB, IBCustomDataSet, IBQuery;

type
  TfrmBarridoContractual = class(TForm)
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdFecha: TDateTimePicker;
    RadioTipoLiquidacion: TRadioGroup;
    EdComprobante: TStaticText;
    Panel1: TPanel;
    CmdLiquidar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    CmdAplicar: TBitBtn;
    CmdComprobante: TBitBtn;
    StaticText1: TStaticText;
    IBLiquidacion: TIBQuery;
    IBContabilizacion: TIBQuery;
    IBAuxiliar: TIBQuery;
    IBAuxiliarID_COMPROBANTE: TIntegerField;
    IBAuxiliarDESCRIPCION_AGENCIA: TIBStringField;
    IBAuxiliarTIPO: TIBStringField;
    IBAuxiliarFECHADIA: TDateField;
    IBAuxiliarDESCRIPCION: TMemoField;
    IBAuxiliarPRIMER_APELLIDO: TIBStringField;
    IBAuxiliarSEGUNDO_APELLIDO: TIBStringField;
    IBAuxiliarNOMBRE: TIBStringField;
    IBAuxiliarCODIGO: TIBStringField;
    IBAuxiliarCUENTA: TIBStringField;
    IBAuxiliarDEBITO: TIBBCDField;
    IBAuxiliarCREDITO: TIBBCDField;
    ReporteC: TprTxReport;
    procedure CmdLiquidarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBarridoContractual: TfrmBarridoContractual;

implementation

{$R *.dfm}

uses unitdmgeneral,unitGlobales,unitPantallaprogreso;

procedure TfrmBarridoContractual.CmdLiquidarClick(Sender: TObject);
begin
        EdFecha.Enabled := False;
        RadioTipoLiquidacion.Enabled := False;
        frmProgreso := TfrmProgreso.Create(Self);
        frmProgreso.Titulo := 'Descuentos Ahorro Contractual ' + DBLCBTipoCaptacion.Text + ' - Progreso';
        frmProgreso.Min := 0;
        frmProgreso.Max := 100;
        frmProgreso.Position := 0;
        frmProgreso.InfoLabel := '';
        frmProgreso.Ejecutar;

end;

end.
