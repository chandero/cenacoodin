unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBDatabase, IBCustomDataSet, IBQuery;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
begin
        Self.IBTransaction1.Active := False;
        Self.IBDatabase1.Close;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
      try
        Self.IBDatabase1.DatabaseName := Self.Edit1.Text;
        Self.IBDatabase1.Open;
        Self.IBTransaction1.Active := True;
      Except
        ShowMessage('No se Conecto');
      end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
        with Self.IBQuery1 do
        begin
          Close;
          SQL.Add('select select DISTINCT MATRICULA_INMOBILIARIA FROM "col$colgarantiasreal"');
          Open;
          while not Eof do
          begin
            
            Next;
          end;
        end;
end;

end.
