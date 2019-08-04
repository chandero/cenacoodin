unit UnitInformedeAsociados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBClient, UnitDmGeneral,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TfrmInformedeAsociados = class(TForm)
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    cmdCerrar: TBitBtn;
    cmdReporte: TBitBtn;
    CmdGenerar: TBitBtn;
    CDSasociado: TClientDataSet;
    IBQasociado: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure cmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformedeAsociados: TfrmInformedeAsociados;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

procedure TfrmInformedeAsociados.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformedeAsociados.FormCreate(Sender: TObject);
begin
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        if (IBTransaction1.InTransaction) then
        begin
            IBTransaction1.Commit;
        end;
        IBTransaction1.StartTransaction;
        IBQasociado.Transaction := IBTransaction1;

end;

procedure TfrmInformedeAsociados.FormShow(Sender: TObject);
begin
        IBQasociado.SQL.Clear;
        IBQasociado.SQL.Add('SELECT ');
        IBQasociado.SQL.Add('"ti".DESCRIPCION_IDENTIFICACION,');
        IBQasociado.SQL.Add('"p".ID_PERSONA,');
        IBQasociado.SQL.Add('"p".SEXO,');
        IBQasociado.SQL.Add('(CURRENT_DATE - CAST("p".FECHA_NACIMIENTO AS DATE)) / 365 AS EDAD,');
        IBQasociado.SQL.Add('"p".FECHA_NACIMIENTO,');
        IBQasociado.SQL.Add('"gen$tiposestadocivil".DESCRIPCION_ESTADO_CIVIL,');
        IBQasociado.SQL.Add('COUNT("be".*) AS HIJOS,');
        IBQasociado.SQL.Add('"gen$direccion".DIRECCION,');
        IBQasociado.SQL.Add('"gen$direccion".BARRIO,');
        IBQasociado.SQL.Add('"gen$direccion".MUNICIPIO,');
        IBQasociado.SQL.Add('"gen$direccion".TELEFONO1,');
        IBQasociado.SQL.Add('"gen$direccion".TELEFONO2,');
        IBQasociado.SQL.Add('"p".EMAIL,');
        IBQasociado.SQL.Add('"p".EDUCACION');
        IBQasociado.SQL.Add('FROM');
        IBQasociado.SQL.Add('"gen$persona" "p"');
        IBQasociado.SQL.Add('INNER JOIN "gen$tiposidentificacion" "ti" ON ("ti".ID_IDENTIFICACION="p".ID_IDENTIFICACION)');
        IBQasociado.SQL.Add('INNER JOIN "gen$tiposestadocivil" "ec" ON ("ec".ID_TIPO_ESTADO_CIVIL="p".ID_TIPO_ESTADO_CIVIL)');
end;

end.
