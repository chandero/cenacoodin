unit UnitConsultaComprobantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, UnitDmGeneral,
  Buttons, pr_Classes, pr_Common, pr_TxClasses, Provider, DBClient, DateUtils,
  DBCtrls;

type
  TfrmConsultaComprobantes = class(TForm)
    Gtipocomprobante: TDBGrid;
    IBQtipocomprobante: TIBQuery;
    IBQcomprobante: TIBQuery;
    IBAuxiliar: TIBQuery;
    Label1: TLabel;
    DStipocomprobante: TDataSource;
    DScomprobante: TDataSource;
    DSauxiliar: TDataSource;
    Gcomprobante: TDBGrid;
    Gauxiliar: TDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    IBQcomprobanteID_COMPROBANTE: TIntegerField;
    IBQcomprobanteID_AGENCIA: TSmallintField;
    IBQcomprobanteTIPO_COMPROBANTE: TIBStringField;
    IBQcomprobanteFECHADIA: TDateField;
    IBQcomprobanteDESCRIPCION: TMemoField;
    IBQcomprobanteTOTAL_DEBITO: TIBBCDField;
    IBQcomprobanteTOTAL_CREDITO: TIBBCDField;
    IBQcomprobanteESTADO: TIBStringField;
    IBQcomprobanteIMPRESO: TSmallintField;
    IBQcomprobanteANULACION: TMemoField;
    IBQcomprobanteID_EMPLEADO: TIBStringField;
    CmdCerrar: TBitBtn;
    Btnreporte: TBitBtn;
    BitBtn1: TBitBtn;
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
    IBAuxiliarID_CUENTA: TIBStringField;
    IBAuxiliarID_COLOCACION: TIBStringField;
    IBAuxiliarID_IDENTIFICACION: TSmallintField;
    IBAuxiliarID_PERSONA: TIBStringField;
    IBAuxiliarPRIMER_APELLIDO1: TIBStringField;
    IBAuxiliarSEGUNDO_APELLIDO1: TIBStringField;
    IBAuxiliarNOMBRE1: TIBStringField;
    IBAuxiliarDEBITO: TIBBCDField;
    IBAuxiliarCREDITO: TIBBCDField;
    IBAuxiliarASOCIADO: TIBStringField;
    Report1: TprTxReport;
    prReport1: TprReport;
    IBAuxiliar1: TIBQuery;
    CDSauxiliar: TClientDataSet;
    DSPauxiliar: TDataSetProvider;
    CDSauxiliarID_COMPROBANTE: TIntegerField;
    CDSauxiliarDESCRIPCION_AGENCIA: TStringField;
    CDSauxiliarTIPO: TStringField;
    CDSauxiliarFECHADIA: TDateField;
    CDSauxiliarDESCRIPCION: TMemoField;
    CDSauxiliarPRIMER_APELLIDO: TStringField;
    CDSauxiliarSEGUNDO_APELLIDO: TStringField;
    CDSauxiliarNOMBRE: TStringField;
    CDSauxiliarCODIGO: TStringField;
    CDSauxiliarCUENTA: TStringField;
    CDSauxiliarID_CUENTA: TStringField;
    CDSauxiliarID_COLOCACION: TStringField;
    CDSauxiliarID_IDENTIFICACION: TSmallintField;
    CDSauxiliarID_PERSONA: TStringField;
    CDSauxiliarPRIMER_APELLIDO1: TStringField;
    CDSauxiliarSEGUNDO_APELLIDO1: TStringField;
    CDSauxiliarNOMBRE1: TStringField;
    CDSauxiliarDEBITO: TBCDField;
    CDSauxiliarCREDITO: TBCDField;
    CDSauxiliarASOCIADO: TStringField;
    DSPcomprobante: TDataSetProvider;
    CDScomprobante: TClientDataSet;
    CDScomprobanteID_COMPROBANTE: TIntegerField;
    CDScomprobanteID_AGENCIA: TSmallintField;
    CDScomprobanteTIPO_COMPROBANTE: TStringField;
    CDScomprobanteFECHADIA: TDateField;
    CDScomprobanteDESCRIPCION: TMemoField;
    CDScomprobanteTOTAL_DEBITO: TBCDField;
    CDScomprobanteTOTAL_CREDITO: TBCDField;
    CDScomprobanteESTADO: TStringField;
    CDScomprobanteIMPRESO: TSmallintField;
    CDScomprobanteANULACION: TMemoField;
    CDScomprobanteID_EMPLEADO: TStringField;
    IBQtipocomprobanteID: TSmallintField;
    IBQtipocomprobanteDESCRIPCION: TIBStringField;
    IBQtipocomprobanteLLAVECSC: TSmallintField;
    IBQtipocomprobanteABREVIATURA: TIBStringField;
    Label4: TLabel;
    CBMeses: TComboBox;
    DBCBtipocomprobante: TDBLookupComboBox;
    btnProcesar: TBitBtn;
    procedure IBQcomprobanteAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQcomprobanteDESCRIPCIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnreporteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CDScomprobanteDESCRIPCIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure CDScomprobanteAfterScroll(DataSet: TDataSet);
    procedure CDScomprobanteAfterRefresh(DataSet: TDataSet);
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaComprobantes: TfrmConsultaComprobantes;
  dmGeneral: TdmGeneral;
  Anho : Integer;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmConsultaComprobantes.IBQcomprobanteAfterScroll(
  DataSet: TDataSet);
begin


{
        IBAuxiliar.Close;
        IBAuxiliar.ParamByName('TIPO_COMPROBANTE').AsString := DataSet.FieldByName('TIPO_COMPROBANTE').AsString;
        IBAuxiliar.ParamByName('ID_COMPROBANTE').AsInteger := DataSet.FieldByName('ID_COMPROBANTE').AsInteger;
        IBAuxiliar.Open;

        CDSauxiliar.Refresh;
}





end;

procedure TfrmConsultaComprobantes.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQtipocomprobante.Database := dmGeneral.IBDatabase1;
        IBQcomprobante.Database := dmGeneral.IBDatabase1;
        IBAuxiliar.Database := dmGeneral.IBDatabase1;
        IBAuxiliar1.Database := dmGeneral.IBDatabase1;

        IBQtipocomprobante.Transaction := dmGeneral.IBTransaction1;
        IBQcomprobante.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar1.Transaction := dmGeneral.IBTransaction1;

        CDScomprobante.Open;
        CDSauxiliar.Open;

end;

procedure TfrmConsultaComprobantes.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        IBQtipocomprobante.Open;
        IBQtipocomprobante.Last;
        IBQtipocomprobante.First;
        DBCBtipocomprobante.DropDown;
        Anho := DBAnho;        

end;

procedure TfrmConsultaComprobantes.IBQcomprobanteDESCRIPCIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TfrmConsultaComprobantes.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsultaComprobantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        IBAuxiliar.Close;
        IBQcomprobante.Close;
        IBQtipocomprobante.Close;

        dmGeneral.Free;
end;

procedure TfrmConsultaComprobantes.BtnreporteClick(Sender: TObject);
begin
          Report1.Variables.ByName['EMPRESA'].AsString := Empresa;
          Report1.Variables.ByName['NIT'].AsString := Nit;
          if Report1.PrepareReport then
            Report1.PreviewPreparedReport(True);
end;

procedure TfrmConsultaComprobantes.BitBtn1Click(Sender: TObject);
begin
          prReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
          prReport1.Variables.ByName['NIT'].AsString := Nit;
          prReport1.Variables.ByName['FechaHoy'].AsDateTime := fFechaActual;
          if prReport1.PrepareReport then
            prReport1.PreviewPreparedReport(True);
end;

procedure TfrmConsultaComprobantes.CDScomprobanteDESCRIPCIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TfrmConsultaComprobantes.CDScomprobanteAfterScroll(
  DataSet: TDataSet);
begin
        IBAuxiliar.Close;
        IBAuxiliar.ParamByName('TIPO_COMPROBANTE').AsString := DataSet.FieldByName('TIPO_COMPROBANTE').AsString;
        IBAuxiliar.ParamByName('ID_COMPROBANTE').AsInteger := DataSet.FieldByName('ID_COMPROBANTE').AsInteger;
        IBAuxiliar.Open;

        CDSauxiliar.Refresh;
end;

procedure TfrmConsultaComprobantes.CDScomprobanteAfterRefresh(
  DataSet: TDataSet);
begin
        IBAuxiliar.Close;
        IBAuxiliar.ParamByName('TIPO_COMPROBANTE').AsString := DataSet.FieldByName('TIPO_COMPROBANTE').AsString;
        IBAuxiliar.ParamByName('ID_COMPROBANTE').AsInteger := DataSet.FieldByName('ID_COMPROBANTE').AsInteger;
        IBAuxiliar.Open;

        CDSauxiliar.Refresh;
end;

procedure TfrmConsultaComprobantes.btnProcesarClick(Sender: TObject);
var
  FechaInicial, FechaFinal: TDateTime;
begin
        btnProcesar.Enabled := False;
        TryEncodeDate(Anho, CBMeses.ItemIndex + 1, 01,FechaInicial);
        TryEncodeDate(Anho, CBMeses.ItemIndex + 1, DaysInAMonth(Anho,CBMeses.ItemIndex + 1), FechaFinal);

        IBQcomprobante.Close;
        IBAuxiliar.Close;
        CDSauxiliar.Refresh;
        Application.ProcessMessages;
        IBQcomprobante.ParamByName('TIPO_COMPROBANTE').AsString := DBCBtipocomprobante.KeyValue;
        IBQcomprobante.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
        IBQcomprobante.ParamByName('FECHA_FINAL').AsDate := FechaFinal;
        IBQcomprobante.Open;

        CDScomprobante.Refresh;
        btnProcesar.Enabled := True;
end;

end.
