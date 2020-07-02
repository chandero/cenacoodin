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
          sql.Add('Select "con$comprobante".ID_COMPROBANTE,');
          sql.Add('"con$comprobante".ID_AGENCIA,');
          sql.Add('"con$comprobante".FECHADIA,');
          sql.Add('"con$comprobante".DESCRIPCION,');
          sql.Add('"con$comprobante".TOTAL_DEBITO,');
          sql.Add('"con$comprobante".TOTAL_CREDITO,');
          sql.Add('"con$comprobante".ESTADO,');
          sql.Add('"con$comprobante".IMPRESO,');
          sql.Add('"con$comprobante".ANULACION,');
          sql.Add('"con$tipocomprobante".DESCRIPCION AS DESCRIPCION1,');
          sql.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          sql.Add(' from ');
          sql.Add('"con$comprobante",');
          sql.Add('"con$tipocomprobante",');
          sql.Add('"gen$agencia"');
          sql.Add('where "con$comprobante"."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
          sql.Add('and "con$comprobante"."ID_AGENCIA" =:"ID_AGENCIA"');
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
          sql.Add('"con$auxiliar".ID_COMPROBANTE,');
          sql.Add('"con$auxiliar".ID_AGENCIA,');
          sql.Add('"con$auxiliar".CODIGO,');
          sql.Add('"con$puc".NOMBRE,');
          sql.Add('"con$auxiliar".DEBITO,');
          sql.Add('"con$auxiliar".CREDITO,');
          sql.Add('"con$auxiliar".ID_CUENTA,');
          sql.Add('"con$auxiliar".ID_COLOCACION,');
          sql.Add('"con$auxiliar".ID_IDENTIFICACION,');
          sql.Add('"con$auxiliar".ID_PERSONA,');
          sql.Add('"con$auxiliar".MONTO_RETENCION,');
          sql.Add('"con$auxiliar".TASA_RETENCION');
          sql.Add('FROM "con$auxiliar" INNER JOIN "con$puc"');
          sql.Add('ON ("con$auxiliar"."CODIGO" = "con$puc"."CODIGO")');
          sql.Add('where "con$auxiliar"."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
          sql.Add('and "con$auxiliar"."ID_AGENCIA" =:"ID_AGENCIA"');
          sql.Add('order by "con$auxiliar"."CREDITO"');
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
