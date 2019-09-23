unit UnitListadodePrueba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, pr_Common, pr_TxClasses,
  DB, IBCustomDataSet, IBQuery, UnitDmGeneral, DBCtrls, IBDatabase;

type
  TfrmListadodePrueba = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdFechaI: TDateTimePicker;
    CmdAceptar: TBitBtn;
    CmdCancelar: TBitBtn;
    IBQuery1: TIBQuery;
    Label2: TLabel;
    EdAgencia: TEdit;
    Label4: TLabel;
    dblcbtipo: TDBLookupComboBox;
    IBQTipoC: TIBQuery;
    DsTipoC: TDataSource;
    Label3: TLabel;
    EdFechaF: TDateTimePicker;
    IBTTipo: TIBTransaction;
    Report: TprTxReport;
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListadodePrueba: TfrmListadodePrueba;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales, unitVistaPreliminar;

procedure TfrmListadodePrueba.CmdAceptarClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('        SELECT ');
  IBQuery1.SQL.Add('CON$COMPROBANTE.ID_AGENCIA,');
  IBQuery1.SQL.Add('CON$COMPROBANTE.ID_COMPROBANTE,');
  IBQuery1.SQL.Add('CON$COMPROBANTE.TIPO_COMPROBANTE,');
  IBQuery1.SQL.Add('CON$COMPROBANTE.FECHADIA,');
  IBQuery1.SQL.Add('CON$TIPOCOMPROBANTE.ABREVIATURA,');
  IBQuery1.SQL.Add('CON$TIPOCOMPROBANTE.DESCRIPCION AS TIPOCOMPROBANTE,');
  IBQuery1.SQL.Add('CON$AUXILIAR.CODIGO,');
  IBQuery1.SQL.Add('CON$COMPROBANTE.DESCRIPCION,');
  IBQuery1.SQL.Add('CON$AUXILIAR.DEBITO,');
  IBQuery1.SQL.Add('CON$AUXILIAR.CREDITO,');
  IBQuery1.SQL.Add('CON$AUXILIAR.ID_CUENTA,');
  IBQuery1.SQL.Add('CON$AUXILIAR.ID_COLOCACION,');
  IBQuery1.SQL.Add('CON$AUXILIAR.ID_PERSONA,');
  IBQuery1.SQL.Add('CON$AUXILIAR.MONTO_RETENCION,');
  IBQuery1.SQL.Add('CON$AUXILIAR.TASA_RETENCION,');
  IBQuery1.SQL.Add('CON$PUC.NOMBRE,');
  IBQuery1.SQL.Add('"gen$persona".PRIMER_APELLIDO,');
  IBQuery1.SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
  IBQuery1.SQL.Add('"gen$persona".NOMBRE AS NOMBRE1,');
  IBQuery1.SQL.Add('CON$COMPROBANTE.TOTAL_DEBITO,');
  IBQuery1.SQL.Add('CON$COMPROBANTE.TOTAL_CREDITO');
  IBQuery1.SQL.Add('FROM');
  IBQuery1.SQL.Add('CON$COMPROBANTE');
  IBQuery1.SQL.Add('INNER JOIN CON$AUXILIAR ON ((CON$COMPROBANTE.ID_COMPROBANTE = CON$AUXILIAR.ID_COMPROBANTE) AND (CON$COMPROBANTE.ID_AGENCIA = CON$AUXILIAR.ID_AGENCIA) AND (CON$COMPROBANTE.TIPO_COMPROBANTE = CON$AUXILIAR.TIPO_COMPROBANTE))');
  IBQuery1.SQL.Add('LEFT JOIN CON$TIPOCOMPROBANTE ON (CON$COMPROBANTE.TIPO_COMPROBANTE = CON$TIPOCOMPROBANTE.ID) ');
  IBQuery1.SQL.Add('LEFT JOIN CON$PUC ON (CON$AUXILIAR.CODIGO = CON$PUC.CODIGO) AND (CON$AUXILIAR.ID_AGENCIA = CON$PUC.ID_AGENCIA)');
  IBQuery1.SQL.Add('LEFT  JOIN "gen$persona" ON (CON$AUXILIAR.ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND (CON$AUXILIAR.ID_PERSONA = "gen$persona".ID_PERSONA)');
  IBQuery1.SQL.Add('WHERE');

  if ( not VarIsNull(dblcbtipo.KeyValue)) then
  begin
     IBQuery1.SQL.Add(' CON$COMPROBANTE.TIPO_COMPROBANTE = :TIPO AND');
     IBQuery1.ParamByName('TIPO').AsInteger := dblcbtipo.KeyValue;
  end;
  IBQuery1.SQL.Add('(CON$COMPROBANTE.FECHADIA BETWEEN :FECHAI AND :FECHAF) AND ');
  IBQuery1.SQL.Add('(CON$COMPROBANTE.ID_AGENCIA = :ID_AGENCIA)');
  IBQuery1.SQL.Add('ORDER BY');
  IBQuery1.SQL.Add('CON$COMPROBANTE.FECHADIA,');
  IBQuery1.SQL.Add('CON$COMPROBANTE.ID_AGENCIA,');
  IBQuery1.SQL.Add('CON$COMPROBANTE.TIPO_COMPROBANTE,');
  IBQuery1.SQL.Add('CON$COMPROBANTE.ID_COMPROBANTE');


        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := StrToInt(EdAgencia.Text);
        IBQuery1.ParamByName('FECHAI').AsDate := EdFechaI.Date;
        IBQuery1.ParamByName('FECHAF').AsDate := EdFechaF.Date;


        with IBQuery1 do begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;

          Transaction.StartTransaction;

          try
            Open;
          except
            MessageDlg('Error al recuperar datos',mtError,[mbcancel],0);
            Transaction.Rollback;
            Exit;
          end;
          if RecordCount < 1 then begin
            MessageDlg('No existen registros para mostrar',mtInformation,[mbok],0);
            Transaction.Commit;
            Exit;
          end;

          Report.Variables.ByName['Empresa'].AsString := Empresa;
          Report.Variables.ByName['Fecha'].AsDateTime := fFechaActual;

          if Report.PrepareReport then begin
             Report.PreviewPreparedReport(true);
          end;
        end;

end;

procedure TfrmListadodePrueba.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmListadodePrueba.CmdCancelarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmListadodePrueba.FormShow(Sender: TObject);
begin
        EdFechaI.Date := fFechaActual;
        EdFechaF.Date := fFechaActual;
end;

procedure TfrmListadodePrueba.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBTTipo.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTTipo.StartTransaction;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;

        IBQTipoC.Database := dmGeneral.IBDatabase1;
        IBQTipoC.Transaction := IBTTipo;

        IBQTipoC.Open;
        IBQTipoC.Last;
end;

procedure TfrmListadodePrueba.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        IBTTipo.Commit;
        dmGeneral.Free;
end;

end.
