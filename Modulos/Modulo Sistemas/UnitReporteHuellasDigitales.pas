unit UnitReporteHuellasDigitales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, pr_Common,
  pr_Classes;

type
  TForm1 = class(TForm)
    cmdReporte: TBitBtn;
    BitBtn2: TBitBtn;
    IBQuery: TIBQuery;
    prReport1: TprReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UnitDmGeneral;

end.
