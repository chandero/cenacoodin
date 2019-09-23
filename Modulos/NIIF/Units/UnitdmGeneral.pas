unit UnitdmGeneral;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBSQL, IBCustomDataSet, IBQuery;

type
  TdmGeneral = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBSQL1: TIBSQL;
    IBQuery1: TIBQuery;
    DSagencia: TDataSource;
    IBDSAgencias: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function getConnected: Boolean;
    { Public declarations }
  end;

var
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses unitGlobales;

procedure TdmGeneral.DataModuleCreate(Sender: TObject);
begin
                IBDatabase1.DefaultTransaction := IBTransaction1;
                IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
                IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
                IBDatabase1.Params.Values['User_Name'] := DBAlias;
                IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
                IBDatabase1.Params.Values['sql_role_name'] := Role;
end;

procedure TdmGeneral.DataModuleDestroy(Sender: TObject);
begin
        if IBTransaction1.InTransaction then
                IBTransaction1.Commit;
        IBDatabase1.Close;
end;

function TdmGeneral.getConnected;
begin
                try
                    IBDatabase1.Open;
                    getConnected := IBDatabase1.Connected;
                    IBTransaction1.StartTransaction;
                except
                    getConnected := false;
                    raise;
                end; // fin del try

end;

end.
