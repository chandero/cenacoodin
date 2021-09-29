unit UnitCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TfrmCalendario = class(TForm)
    Calendario: TMonthCalendar;
    procedure CalendarioDblClick(Sender: TObject);
  private
    { Private declarations }
    FDate:TDate;
  public
    property Fecha:TDate read FDate Write FDate;
    { Public declarations }
  end;

var
  frmCalendario: TfrmCalendario;

implementation

{$R *.dfm}

procedure TfrmCalendario.CalendarioDblClick(Sender: TObject);
begin
        Fecha := Calendario.Date;
        Close
end;

end.
