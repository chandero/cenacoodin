unit UnitCierreDia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery;

type
  TfrmCierreDia = class(TForm)
    Label1: TLabel;
    EdFechaCierre: TDateTimePicker;
    Panel1: TPanel;
    CmdCerrarDia: TBitBtn;
    CmdSalir: TBitBtn;
    IBQuery1: TIBQuery;
    procedure CmdSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarDiaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCierreDia: TfrmCierreDia;

implementation

{$R *.dfm}

uses UnitDmGeneral;

procedure TfrmCierreDia.CmdSalirClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCierreDia.FormShow(Sender: TObject);
begin
        EdFechaCierre.Date := Date;
end;

procedure TfrmCierreDia.CmdCerrarDiaClick(Sender: TObject);
begin
        with IBQuery1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('insert into "fun$diascerrados" values (:FECHA,:CERRADO,:APLICADO)');
           ParamByName('FECHA').AsDate := EdFechaCierre.Date;
           ParamByName('CERRADO').AsInteger := 1;
           ParamByName('APLICADO').AsInteger := 0;
           try
            ExecSQL;
            Transaction.Commit;
            ShowMessage('Dia Cerrado con Exito!');
           except
            ShowMessage('El dia ya fue cerrado');
           end;
        end;
end;

end.
