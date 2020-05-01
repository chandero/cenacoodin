unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, IBDatabase, StdCtrls;

type
  TfrmMain = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    zcoreConnection: TADOConnection;
    ADOQuery1: TADOQuery;
    btnConectar: TButton;
    edzconnected: TEdit;
    procedure btnConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnConectarClick(Sender: TObject);
begin
        try
          zcoreConnection.DefaultDatabase := 'synlight';
          zcoreConnection.Open('coodinzcore', 'cooDin2020');
          if zcoreConnection.Connected then
          begin
            edzconnected.Text := 'Conectada';
          end
          else
          begin
           edzconnected.Text := 'No Conectada';
          end;
        except
           on E: Exception do ShowMessage(E.Message);
        end;
end;

end.
