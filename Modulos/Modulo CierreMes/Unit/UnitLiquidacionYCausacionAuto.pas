unit UnitLiquidacionYCausacionAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, IBStoredProc, IB, DBClient, IBDatabase, IBCustomDataSet, IBSQL, DB,
  StdCtrls;

type
  TfrmLiquidacionYCausacionAuto = class(TForm)
    Label1: TLabel;
    edCaptacion: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLiquidacionYCausacionAuto: TfrmLiquidacionYCausacionAuto;
  _queryCaptacion, _queryRetefuente, _queryDiasLiquidados : TIBQuery;
  _queryProcedure : TIBStoredProc;
  _transaction: TIBTransaction;
implementation

{$R *.dfm}

uses UnitDmGeneral;

procedure TfrmLiquidacionYCausacionAuto.FormCreate(Sender: TObject);
begin
        _queryCaptacion := TIBQuery.Create(self);
        _queryRetefuente := TIBQuery.Create(self);
        _queryDiasLiquidados := TIBQuery.Create(self);
        _queryProcedure := TIBStoredProc.Create(self);
        _transaction := TIBTransaction.Create(self);

        _transaction.DefaultDatabase := dmGeneral.IBDatabase1;

        _queryCaptacion.Database := dmGeneral.IBDatabase1;
        _queryRetefuente.Database := dmGeneral.IBDatabase1;
        _queryDiasLiquidados.Database := dmGeneral.IBDatabase1;
        _queryProcedure.Database := dmGeneral.IBDatabase1;
        
        _queryCaptacion.Transaction := _transaction;
        _queryRetefuente.Transaction := _transaction;
        _queryDiasLiquidados.Transaction := _transaction;
        _queryProcedure.Transaction := _transaction;
        
end;

procedure TfrmLiquidacionYCausacionAuto.FormShow(Sender: TObject);
var
  DiarioR: Currency;
  TasaR: Float;
begin
        with _queryRetencion do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select DIARIO_RETEFUENTE, TASA_RETEFUENTE from "gen$valorretefuente" WHERE ID_RETEFUENTE = :ID_RETEFUENTE');
             ParamByName('ID_RETEFUENTE').AsInteger := 1;
             try
                Open;
                DiarioR := FieldByName('DIARIO_RETEFUENTE').AsCurrency;
                TasaR := FieldByName('TASA_RETEFUENTE').AsFloat;
             except
                DiarioR := 0;
                TasaR := 0;
             end;
             Close;
        end;
        
        _queryCaptacion.SQL.Clear;
        _queryCaptacion.SQL.Add('SELECT * FROM "cap$tipocaptacion" a WHERE a.ID_FORMA = :ID_FORMA');
        _queryCaptacion.ParamByName('ID_FORMA').AsInteger := 2;
        _queryCaptacion.Open;

        while not _queryCaptacion.Eof do
        begin
          edCaptacion.Text := _queryCaptacion.FieldByName('DESCRIPCION').AsString;
          // Inicio Ciclo Captacion

          // Continuación Ciclo _queryCaptacion
          _queryCaptacion.Next;
        end;
end;

end.
