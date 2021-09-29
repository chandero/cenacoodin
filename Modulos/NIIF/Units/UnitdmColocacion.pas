unit UnitdmColocacion;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBSQL, UnitDmGeneral;

type
  TdmColocacion = class(TDataModule)
    IBDSclasificacion: TIBDataSet;
    IBDSlinea: TIBDataSet;
    IBDSinversion: TIBDataSet;
    IBDSrespaldo: TIBDataSet;
    IBDSgarantia: TIBDataSet;
    IBDScolocacion: TIBDataSet;
    IBDSpersona: TIBDataSet;
    IBDStasavariable: TIBDataSet;
    IBDSenteaprobador: TIBDataSet;
    DStiposid: TDataSource;
    IBQuery: TIBQuery;
    DSclasificacion: TDataSource;
    DSlinea: TDataSource;
    DSinversion: TDataSource;
    DSrespaldo: TDataSource;
    DSgarantia: TDataSource;
    DStipocuota: TDataSource;
    DStasavariable: TDataSource;
    DSenteaprobador: TDataSource;
    IBDScontable: TIBDataSet;
    IBQuery1: TIBQuery;
    IBSQL: TIBSQL;
    IBSQLcodigos: TIBSQL;
    IBDSagencias: TIBDataSet;
    DSagencia: TDataSource;
    IBQueryVarios: TIBQuery;
    IBDSTipoCuota: TIBQuery;
    IBDSTiposId: TIBQuery;
    IBDSEstado: TIBDataSet;
    DSEstado: TDataSource;
    IBQDescuentos: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CloseConnection;
  end;

var
  dmColocacion: TdmColocacion;
  dbGeneral: TdmGeneral;

implementation

{$R *.dfm}

procedure TdmColocacion.CloseConnection;
begin
   if dbGeneral.IBTransaction1.InTransaction then
      dbGeneral.IBTransaction1.Rollback;
   dbGeneral.IBDatabase1.Close;
end;

procedure TdmColocacion.DataModuleCreate(Sender: TObject);
begin
        dbGeneral := TdmGeneral.Create(nil);
        dbGeneral.getConnected;
        IBDSclasificacion.Database := dbGeneral.IBDatabase1;
        IBDSlinea.Database := dbGeneral.IBDatabase1;
        IBDSinversion.Database := dbGeneral.IBDatabase1;
        IBDSrespaldo.Database := dbGeneral.IBDatabase1;
        IBDSgarantia.Database := dbGeneral.IBDatabase1;
        IBDScolocacion.Database := dbGeneral.IBDatabase1;
        IBDSpersona.Database := dbGeneral.IBDatabase1;
        IBDStasavariable.Database := dbGeneral.IBDatabase1;
        IBDSenteaprobador.Database := dbGeneral.IBDatabase1;
        IBDScontable.Database := dbGeneral.IBDatabase1;
        IBQuery.Database := dbGeneral.IBDatabase1;
        IBQuery1.Database := dbGeneral.IBDatabase1;
        IBSQL.Database := dbGeneral.IBDatabase1;
        IBSQLcodigos.Database := dbGeneral.IBDatabase1;
        IBDSagencias.Database := dbGeneral.IBDatabase1;
        IBQueryVarios.Database := dbGeneral.IBDatabase1;
        IBDSTipoCuota.Database := dbGeneral.IBDatabase1;
        IBDSTiposId.Database := dbGeneral.IBDatabase1;
        IBDSEstado.Database := dbGeneral.IBDatabase1;
        IBQDescuentos.Database := dbGeneral.IBDatabase1;


        IBDSclasificacion.Transaction := dbGeneral.IBTransaction1;
        IBDSlinea.Transaction := dbGeneral.IBTransaction1;
        IBDSinversion.Transaction := dbGeneral.IBTransaction1;
        IBDSrespaldo.Transaction := dbGeneral.IBTransaction1;
        IBDSgarantia.Transaction := dbGeneral.IBTransaction1;
        IBDScolocacion.Transaction := dbGeneral.IBTransaction1;
        IBDSpersona.Transaction := dbGeneral.IBTransaction1;
        IBDStasavariable.Transaction := dbGeneral.IBTransaction1;
        IBDSenteaprobador.Transaction := dbGeneral.IBTransaction1;
        IBDScontable.Transaction := dbGeneral.IBTransaction1;
        IBQuery.Transaction := dbGeneral.IBTransaction1;
        IBQuery1.Transaction := dbGeneral.IBTransaction1;
        IBSQL.Transaction := dbGeneral.IBTransaction1;
        IBSQLcodigos.Transaction := dbGeneral.IBTransaction1;
        IBDSagencias.Transaction := dbGeneral.IBTransaction1;
        IBQueryVarios.Transaction := dbGeneral.IBTransaction1;
        IBDSTipoCuota.Transaction := dbGeneral.IBTransaction1;
        IBDSTiposId.Transaction := dbGeneral.IBTransaction1;
        IBDSEstado.Transaction := dbGeneral.IBTransaction1;
        IBQDescuentos.Transaction := dbGeneral.IBTransaction1;

end;

procedure TdmColocacion.DataModuleDestroy(Sender: TObject);
begin
        
        dbGeneral.Free;
end;

end.
