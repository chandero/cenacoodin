unit UnitDmSolicitud;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBSQL;

type
  TDmSolicitud = class(TDataModule)
    IBSolicitud1: TIBQuery;
    IBsolicitud2: TIBQuery;
    IBsolicitud3: TIBQuery;
    IBTsolicitud1: TIBTransaction;
    IBTsolicitud2: TIBTransaction;
    IBTsolicitud3: TIBTransaction;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    IBSQL2: TIBSQL;
    IBTSolicitud4: TIBTransaction;
    IBSolicitud4: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmSolicitud: TDmSolicitud;

implementation
uses unitdmgeneral;
{$R *.dfm}

end.
