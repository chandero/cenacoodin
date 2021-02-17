unit UnitRelacionDocumentoEquivalente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Math,
  Dialogs, DB, ExtCtrls, StdCtrls, Grids, DBGrids, UnitdmGeneral,
  IBCustomDataSet, IBQuery, IBDatabase, DBClient, JvEdit, JvFloatEdit,
  JvTypedEdit, pr_Common, pr_Classes, IBSQL;

type
  TfrmRelacionDocumentoEquivalente = class(TForm)
    DSdata: TDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    DBGdata: TDBGrid;
    btnImprimir: TButton;
    IBQdata: TIBQuery;
    IBTdata: TIBTransaction;
    IBQitem: TIBQuery;
    btnCerrar: TButton;
    GroupBox2: TGroupBox;
    DBGitem: TDBGrid;
    DSitem: TDataSource;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    edSubtotal: TJvCurrencyEdit;
    Label8: TLabel;
    edTasaRetencion: TJvFloatEdit;
    Label9: TLabel;
    edRetencion: TJvCurrencyEdit;
    Label10: TLabel;
    edTasaIva: TJvFloatEdit;
    Label11: TLabel;
    edIva: TJvCurrencyEdit;
    Label13: TLabel;
    edTotal: TJvCurrencyEdit;
    IBQagencia: TIBQuery;
    IBSQL1: TIBSQL;
    chkImpuesto: TCheckBox;
    chkRegimenSimplificado: TCheckBox;
    chkNoObligado: TCheckBox;
    IBQdian: TIBQuery;
    CDSdata: TClientDataSet;
    CDSdataITEM: TIntegerField;
    CDSdataCODIGO: TStringField;
    CDSdataDESCRIPCION: TStringField;
    CDSdataVALOR: TCurrencyField;
    prReport1: TprReport;
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure IBQdataAfterScroll(DataSet: TDataSet);
    procedure CDSdataAfterPost(DataSet: TDataSet);
    procedure edSubtotalChange(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizarSaldos;
  public
    { Public declarations }
  end;

var
  frmRelacionDocumentoEquivalente: TfrmRelacionDocumentoEquivalente;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

Uses unitGlobales;

procedure TfrmRelacionDocumentoEquivalente.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;
        IBTdata.DefaultDatabase := dmGeneral.IBDatabase1;
        IBQdata.Database := dmGeneral.IBDatabase1;
        IBQdata.Transaction := IBTdata;
        IBQitem.Database := dmGeneral.IBDatabase1;
        IBQitem.Transaction := IBTdata;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL1.Transaction := IBTdata;
        IBQdian.Database := dmGeneral.IBDatabase1;
        IBQdian.Transaction := IBTdata;
        if IBTdata.InTransaction then
          IBTdata.Commit;
        IBTdata.StartTransaction;
        IBQdata.Open;
end;

procedure TfrmRelacionDocumentoEquivalente.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmRelacionDocumentoEquivalente.btnImprimirClick(
  Sender: TObject);
begin
        IBQagencia.Close;
        IBQagencia.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBQagencia.Open;
        IBQdian.Close;
        IBQdian.SQL.Clear;
        IBQdian.SQL.Add('SELECT * FROM DIAN$RESOLUCION WHERE :NUMERO BETWEEN INICIAL AND FINAL');
        IBQdian.ParamByName('NUMERO').AsInteger := IBQdata.FieldByName('NUMERO').AsInteger;
        IBQdian.Open;
        prReport1.LoadTemplateFromFile('.\ReportesCon\DocumentoEquivalente.prt', false);        
        prReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
        prReport1.Variables.ByName['NIT'].AsString := Nit;
        prReport1.Variables.ByName['NUMERO'].AsInteger := IBQdata.FieldByName('NUMERO').AsInteger;
        prReport1.Variables.ByName['DIRECCION_EMPRESA'].AsString := IBQagencia.FieldByName('DIRECCION_AGENCIA').AsString + ' ' + IBQagencia.FieldByName('DESCRIPCION_AGENCIA').AsString;
        prReport1.Variables.ByName['TELEFONO_EMPRESA'].AsString := IBQagencia.FieldByName('TELEFONO_AGENCIA').AsString;
        prReport1.Variables.ByName['RESOLUCION_DIAN'].AsString := IBQdian.FieldByName('RESOLUCION').AsString;
        prReport1.Variables.ByName['FECHA_RESOLUCION'].AsString := IBQdian.FieldByName('FECHA').AsString;
        prReport1.Variables.ByName['PREFIJO'].AsString := IBQdian.FieldByName('PREFIJO').AsString;
        prReport1.Variables.ByName['PLINI'].AsInteger := IBQdian.FieldByName('INICIAL').AsInteger;
        prReport1.Variables.ByName['PLFIN'].AsInteger := IBQdian.FieldByName('FINAL').AsInteger;               
        prReport1.Variables.ByName['FECHA'].AsDateTime := IBQdata.FieldByName('FECHA').AsDateTime;
        prReport1.Variables.ByName['DOCUMENTO'].AsString := IBQdata.FieldByName('ID_PERSONA').AsString;        
        prReport1.Variables.ByName['NOMBRE'].AsString := IBQdata.FieldByName('NOMBRE').AsString;
        prReport1.Variables.ByName['DIRECCION'].AsString := IBSQL1.FieldByName('DIRECCION').AsString;
        prReport1.Variables.ByName['CIUDAD'].AsString := IBSQL1.FieldByName('MUNICIPIO').AsString;
        prReport1.Variables.ByName['TELEFONO'].AsString := IBSQL1.FieldByName('TELEFONO1').AsString;
        prReport1.Variables.ByName['SUBTOTAL'].AsDouble := edSubtotal.Value;
        prReport1.Variables.ByName['TASA_RETEFUENTE'].AsDouble := edTasaRetencion.Value;
        prReport1.Variables.ByName['RETEFUENTE'].AsDouble := edRetencion.Value;
        prReport1.Variables.ByName['TASA_IVA'].AsDouble := edTasaIva.Value;
        prReport1.Variables.ByName['RETEIVA'].AsDouble := edIva.Value;
        prReport1.Variables.ByName['TOTAL'].AsDouble := edTotal.Value;

        CDSdata.First;

        if prReport1.PrepareReport then
          prReport1.PreviewPreparedReport(true);
end;

procedure TfrmRelacionDocumentoEquivalente.IBQdataAfterScroll(
  DataSet: TDataSet);
begin
        edTasaRetencion.Value := IBQdata.FieldByName('TASA_RETENCION').AsFloat;
        edTasaIva.Value := IBQdata.FieldByName('TASA_IVA').AsFloat;

        chkImpuesto.Checked := IntToBoolean(IBQdata.FieldByName('NO_RESPONSABLE_IVA').AsInteger);
        chkRegimenSimplificado.Checked := IntToBoolean(IBQdata.FieldByName('RESPONSABLE_SIMPLIFICADO').AsInteger);
        chkNoObligado.Checked := IntToBoolean(IBQdata.FieldByName('NO_OBLIGADO_FACTURAR').AsInteger);

        IBQItem.Close;
        IBQItem.ParamByName('ID').AsInteger := IBQdata.FieldByName('ID').AsInteger;
        IBQItem.Open;

        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT FIRST 1 * FROM "gen$direccion" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA AND ID_DIRECCION = :ID_DIRECCION');
          ParamByName('ID_IDENTIFICACION').AsInteger := IBQdata.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString := IBQdata.FieldByName('ID_PERSONA').AsString;
          ParamByName('ID_DIRECCION').AsInteger := 1;
          ExecQuery;
        end;

        CDSdata.EmptyDataSet;
        CDSdata.Open;

        while not IBQItem.Eof do
        begin
           CDSdata.Insert;
           CDSdataITEM.Value := IBQItem.FieldByName('CSC').AsInteger;
           CDSdataCODIGO.Value := IBQItem.FieldByName('CODIGO').AsString;
           CDSdataDESCRIPCION.Value := IBQItem.FieldByName('DESCRIPCION').AsString;
           CDSdataVALOR.Value := IBQItem.FieldByName('VALOR').AsCurrency;
           CDSdata.Post;
           IBQItem.Next;
        end;

        
end;

procedure TfrmRelacionDocumentoEquivalente.CDSdataAfterPost(
  DataSet: TDataSet);
begin
        edSubtotal.Value := CDSdata.Aggregates[0].Value;
end;

procedure TfrmRelacionDocumentoEquivalente.ActualizarSaldos;
begin
        edRetencion.Value :=  RoundTo(edSubtotal.Value * edTasaRetencion.Value / 100, 0);
        edIva.Value := RoundTo(edSubtotal.Value * edTasaIva.Value / 100, 0);
        edTotal.Value := edSubtotal.Value - edRetencion.Value + edIva.Value;
end;

procedure TfrmRelacionDocumentoEquivalente.edSubtotalChange(
  Sender: TObject);
begin
        ActualizarSaldos;
end;

end.
