unit UnitRecuperarComprobante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses, pr_Parser;

type
  TfrmRecuperarComprobante = class(TForm)
    IBQauxiliar: TIBQuery;
    IBQcomprobante: TIBQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Ednocomprobante: TLabeledEdit;
    edagencia: TLabeledEdit;
    Panel2: TPanel;
    Btnaceptar: TBitBtn;
    BtnCerrar: TBitBtn;
    IBQcomprobanteID_COMPROBANTE: TIntegerField;
    IBQcomprobanteFECHADIA: TDateField;
    IBQcomprobanteDESCRIPCION: TMemoField;
    IBQcomprobanteTOTAL_DEBITO: TIBBCDField;
    IBQcomprobanteTOTAL_CREDITO: TIBBCDField;
    IBQcomprobanteESTADO: TIBStringField;
    IBQcomprobanteIMPRESO: TSmallintField;
    IBQcomprobanteANULACION: TMemoField;
    IBQcomprobanteDESCRIPCION1: TIBStringField;
    IBQcomprobanteDESCRIPCION_AGENCIA: TIBStringField;
    IBQauxiliarID_COMPROBANTE: TIntegerField;
    IBQauxiliarID_AGENCIA: TSmallintField;
    IBQauxiliarCODIGO: TIBStringField;
    IBQauxiliarNOMBRE: TIBStringField;
    IBQauxiliarDEBITO: TIBBCDField;
    IBQauxiliarCREDITO: TIBBCDField;
    IBQauxiliarID_CUENTA: TIBStringField;
    IBQauxiliarID_COLOCACION: TIBStringField;
    IBQauxiliarID_IDENTIFICACION: TSmallintField;
    IBQauxiliarID_PERSONA: TIBStringField;
    IBQauxiliarMONTO_RETENCION: TIBBCDField;
    IBQauxiliarTASA_RETENCION: TFloatField;
    Reccomp: TprTxReport;
    procedure EdnocomprobanteExit(Sender: TObject);
    procedure edagenciaExit(Sender: TObject);
    procedure edagenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdnocomprobanteKeyPress(Sender: TObject; var Key: Char);
    procedure BtnaceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCerrarClick(Sender: TObject);
    procedure ReccompUnknownObjFunction(Sender: TObject;
      Component: TComponent; const FuncName: String;
      const Parameters: TprVarsArray; ParametersCount: Integer;
      var Value: TprVarValue; var IsProcessed: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecuperarComprobante: TfrmRecuperarComprobante;
  vid_comprobante : string;
  vid_agencia : integer;
implementation

uses unitglobales;
{$R *.dfm}



procedure TfrmRecuperarComprobante.EdnocomprobanteExit(Sender: TObject);
begin
        vid_comprobante := ednocomprobante.Text;
end;

procedure TfrmRecuperarComprobante.edagenciaExit(Sender: TObject);
begin
        vid_agencia := strtoint(edagencia.Text);
end;

procedure TfrmRecuperarComprobante.edagenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmRecuperarComprobante.EdnocomprobanteKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmRecuperarComprobante.BtnaceptarClick(Sender: TObject);
var
anulacion : string;
begin
      with IBQcomprobante do
        begin
          sql.Clear;
          sql.Add('Select CON$COMPROBANTE.ID_COMPROBANTE,');
          sql.Add('CON$COMPROBANTE.ID_AGENCIA,');
          sql.Add('CON$COMPROBANTE.FECHADIA,');
          sql.Add('CON$COMPROBANTE.DESCRIPCION,');
          sql.Add('CON$COMPROBANTE.TOTAL_DEBITO,');
          sql.Add('CON$COMPROBANTE.TOTAL_CREDITO,');
          sql.Add('CON$COMPROBANTE.ESTADO,');
          sql.Add('CON$COMPROBANTE.IMPRESO,');
          sql.Add('CON$COMPROBANTE.ANULACION,');
          sql.Add('CON$TIPOCOMPROBANTE.DESCRIPCION AS DESCRIPCION1,');
          sql.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          sql.Add(' from ');
          sql.Add('CON$COMPROBANTE,');
          sql.Add('CON$TIPOCOMPROBANTE,');
          sql.Add('"gen$agencia"');
          sql.Add('where CON$COMPROBANTE."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
          sql.Add('and CON$COMPROBANTE."ID_AGENCIA" =:"ID_AGENCIA"');
          ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
          ParamByName('ID_AGENCIA').AsInteger := vid_agencia;
          open;
          anulacion := FieldByName('ANULACION').AsString;
          if anulacion <> '' then
             Reccomp.Variables.ByName['anulacion'].AsString := 'Anulado por:'
          else
             Reccomp.Variables.ByName['anulacion'].AsString := '';
        end;

        with IBQauxiliar do
        begin
          sql.Clear;
          sql.Add('select ');
          sql.Add('CON$AUXILIAR.ID_COMPROBANTE,');
          sql.Add('CON$AUXILIAR.ID_AGENCIA,');
          sql.Add('CON$AUXILIAR.CODIGO,');
          sql.Add('CON$PUC.NOMBRE,');
          sql.Add('CON$AUXILIAR.DEBITO,');
          sql.Add('CON$AUXILIAR.CREDITO,');
          sql.Add('CON$AUXILIAR.ID_CUENTA,');
          sql.Add('CON$AUXILIAR.ID_COLOCACION,');
          sql.Add('CON$AUXILIAR.ID_IDENTIFICACION,');
          sql.Add('CON$AUXILIAR.ID_PERSONA,');
          sql.Add('CON$AUXILIAR.MONTO_RETENCION,');
          sql.Add('CON$AUXILIAR.TASA_RETENCION');
          sql.Add('FROM CON$AUXILIAR INNER JOIN CON$PUC');
          sql.Add('ON (CON$AUXILIAR."CODIGO" = CON$PUC."CODIGO")');
          sql.Add('where CON$AUXILIAR."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
          sql.Add('and CON$AUXILIAR."ID_AGENCIA" =:"ID_AGENCIA"');
          sql.Add('order by CON$AUXILIAR."CREDITO"');
          ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
          ParamByName('ID_AGENCIA').AsInteger := vid_agencia;
          Open;
         end;
        RecComp.Variables.ByName['empresa'].AsString := Empresa;
        RecComp.Variables.ByName['hoy'].AsDateTime := Date;
        If RecComp.PrepareReport then
           RecComp.PreviewPreparedReport(true);
        IBQcomprobante.Close;
        IBQauxiliar.Close;
end;

procedure TfrmRecuperarComprobante.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRecuperarComprobante.BtnCerrarClick(Sender: TObject);
begin
        close;
end;

procedure TfrmRecuperarComprobante.ReccompUnknownObjFunction(
  Sender: TObject; Component: TComponent; const FuncName: String;
  const Parameters: TprVarsArray; ParametersCount: Integer;
  var Value: TprVarValue; var IsProcessed: Boolean);
var
  f : TField;
begin
 if (Component=IBQauxiliar) and
    (AnsiCompareText(FuncName,'IBQauxiliar.field')=0) and
    (ParametersCount=1) then
  begin
    if _vAsString(Parameters[0]) = 'ID' then
     begin
      f := IBQauxiliar.FindField('ID_CUENTA');
      if f <> nil then
       begin
         if trim(f.AsString) <> '' then
           value.vString := trim(f.AsString)
         else
         begin
         f := IBQauxiliar.FindField('ID_COLOCACION');
         if f <> nil then
            if trim(f.AsString) <> '' then
              value.vString := trim(f.AsString)
         else
         if trim(f.AsString) = '' then
            value.vString := '';
         end;
        IsProcessed := true;
       end;
     end;
  end;
end;

end.
