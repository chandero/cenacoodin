unit UnitdmGeneral;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBSQL;

type
  TdmGeneral = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBSQL1: TIBSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

end.
