unit UnitValidacion;

interface

uses
  Classes,
  UnitReLogin,
  UnitGlobales,
  Forms,
  Controls,
  Dialogs;

type
  Validacion = class(TThread)
  private
    function MostrarReLogin:Integer;
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Validacion.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Validacion }

procedure Validacion.Execute;
begin
  { Place thread code here }
//  Synchronize(MostrarReLogin);
  ReturnValue :=  MostrarReLogin;
end;

function Validacion.MostrarReLogin:Integer;
var frmReLogin:TfrmReLogin;
    Pasabordo:string;
begin
    Result := 1;
    frmReLogin := TfrmReLogin.Create(Application);
    if frmReLogin.ShowModal = mrOk then
    begin
     Pasabordo := frmReLogin.EdPasabordo.Text;
     if Pasabordo <> DBPasabordo then
      begin
        ShowMessage('Confirmación no valida!, Cerrando el Módulo');
        Result:= 0;
        Exit;
      end;
    end
    else
    begin
        Result := 0;
        Exit;
    end;

end;

end.
