unit UnitdmCaptacion;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBSQL;

type
  TdmCaptacion = class(TDataModule)
    IBTiposCaptacion: TIBQuery;
    IBTiposIdentificacion: TIBQuery;
    IBConsulta: TIBQuery;
    IBTiposParentesco: TIBQuery;
    IBTasasVariables: TIBQuery;
    IBTiposCaptacionCer: TIBQuery;
    IBPlanContractual: TIBQuery;
    IBGrabar: TIBSQL;
    IBSQL1: TIBSQL;
    IBTiposTitular: TIBQuery;
    IBTiposCaptacionCon: TIBQuery;
    IBTiposCaptacionF: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCaptacion: TdmCaptacion;

implementation

{$R *.dfm}

uses unitDmGeneral;

end.
