unit Unit_Dmpuc;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmpuc = class(TDataModule)
    DataSourcesaldos: TDataSource;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    DataSourceInformes: TDataSource;
    IBDataSetinformes: TIBDataSet;
    DataSourcecentros: TDataSource;
    IBDataSetcentros: TIBDataSet;
    IBDataSetSaldos: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dmpuc: TDmpuc;

implementation

{$R *.dfm}

uses unitdmgeneral;

end.
