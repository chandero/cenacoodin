unit Delegados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pr_Common, pr_Classes, StdCtrls, DB, DBClient;

type
  TForm1 = class(TForm)
    Button1: TButton;
    DATA: TClientDataSet;
    DataSource1: TDataSource;
    DATANO: TIntegerField;
    prReport1: TprReport;
    procedure prReport1UnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  contador : Integer;

implementation

{$R *.dfm}

procedure TForm1.prReport1UnknownVariable(Sender: TObject;
  const VarName: String; var Value: TprVarValue; var IsProcessed: Boolean);

begin
        contador := contador + 1;
        if VarName = 'NO' then
          Value.vInteger := contador;
        IsProcessed := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:Integer;
begin
        for i := 201 to 230 do begin
          DATA.Open;
          DATA.Append;
          DATA.FieldByName('NO').AsInteger := i;
          DATA.Post;
        end;

        if prReport1.PrepareReport then
          prReport1.PreviewPreparedReport(True);
end;

end.
