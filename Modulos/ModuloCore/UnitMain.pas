unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, DB, SqlExpr;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    _connectionF: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet2: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
