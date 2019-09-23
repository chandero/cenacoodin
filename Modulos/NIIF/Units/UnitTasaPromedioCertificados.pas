unit UnitTasaPromedioCertificados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, IBSQL;

type
  TfrmTasaPromedioCertificados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdFecha: TDateTimePicker;
    CmdGenerar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTasaPromedioCertificados: TfrmTasaPromedioCertificados;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmTasaPromedioCertificados.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

end.
