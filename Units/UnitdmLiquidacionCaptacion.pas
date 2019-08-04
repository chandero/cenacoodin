unit UnitdmLiquidacionCaptacion;

interface

uses
  SysUtils, Classes, IBSQL;

type
  TdmLiquidacionCaptacion = class(TDataModule)
    IBConsulta: TIBSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLiquidacionCaptacion: TdmLiquidacionCaptacion;

implementation

{$R *.dfm}

uses UnitdmGeneral;

end.
