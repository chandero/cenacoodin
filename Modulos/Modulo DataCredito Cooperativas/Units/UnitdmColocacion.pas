unit UnitdmColocacion;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBSQL;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmColocacion: TdmColocacion;

implementation

{$R *.dfm}

uses UnitdmGeneral;

end.
