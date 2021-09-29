unit Unit_DmComprobante;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBSQL, IBTable;

type
  TDmComprobante = class(TDataModule)
    Dscomprobante: TDataSource;
    Dsauxiliar: TDataSource;
    Dsagencia: TDataSource;
    Dstipocomp: TDataSource;
    IBQuery1: TIBQuery;
    Dspersona: TDataSource;
    Dstipoid: TDataSource;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    IBVarios: TIBSQL;
    IBQsetagencia: TIBQuery;
    IBQsettipocomp: TIBQuery;
    IBQsetpersona: TIBQuery;
    IBQsettipoid: TIBQuery;
    IBQsetauxiliar: TIBQuery;
    IBQsetcomprobante: TIBQuery;
    IBDataSet1: TIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmComprobante: TDmComprobante;

implementation

{$R *.dfm}

uses UnitDmGeneral;

end.
