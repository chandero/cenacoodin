unit Unit_DmComprobante;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBSQL, IBTable, UnitDmGeneral;

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
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmComprobante: TDmComprobante;
  dmGeneral:TdmGeneral;

implementation

{$R *.dfm}

procedure TDmComprobante.DataModuleCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBQuery3.Database := dmGeneral.IBDatabase1;
        IBQsetagencia.Database := dmGeneral.IBDatabase1;
        IBQsettipocomp.Database := dmGeneral.IBDatabase1;
        IBQsetpersona.Database := dmGeneral.IBDatabase1;
        IBQsettipoid.Database := dmGeneral.IBDatabase1;
        IBQsetauxiliar.Database := dmGeneral.IBDatabase1;
        IBQsetcomprobante.Database := dmGeneral.IBDatabase1;

        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBQuery3.Transaction := dmGeneral.IBTransaction1;
        IBQsetagencia.Transaction := dmGeneral.IBTransaction1;
        IBQsettipocomp.Transaction := dmGeneral.IBTransaction1;
        IBQsetpersona.Transaction := dmGeneral.IBTransaction1;
        IBQsettipoid.Transaction := dmGeneral.IBTransaction1;
        IBQsetauxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQsetcomprobante.Transaction := dmGeneral.IBTransaction1;
end;

procedure TDmComprobante.DataModuleDestroy(Sender: TObject);
begin
        dmGeneral.Free;
end;

end.

