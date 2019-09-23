unit Unit_Dmpuc;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, UnitDmGeneral;

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
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dmpuc: TDmpuc;
  dmGeneral : TdmGeneral;

implementation

{$R *.dfm}

procedure TDmpuc.DataModuleCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBDataSet1.Database := dmGeneral.IBDatabase1;
        IBDataSetinformes.Database := dmGeneral.IBDatabase1;
        IBDataSetcentros.Database := dmGeneral.IBDatabase1;
        IBDataSetSaldos.Database := dmGeneral.IBDatabase1;
        IBDataSet1.Transaction := dmGeneral.IBTransaction1;
        IBDataSetinformes.Transaction := dmGeneral.IBTransaction1;
        IBDataSetcentros.Transaction := dmGeneral.IBTransaction1;
        IBDataSetSaldos.Transaction := dmGeneral.IBTransaction1;
end;

procedure TDmpuc.DataModuleDestroy(Sender: TObject);
begin
        dmGeneral.Free;
end;

end.
