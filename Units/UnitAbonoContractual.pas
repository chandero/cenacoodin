unit UnitAbonoContractual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, FR_DSet, FR_DBSet, FR_Class;

type
  TFrmAbonoContractual = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dtFecha: TDateTimePicker;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBQuery1: TIBQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dtFechaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbonoContractual: TFrmAbonoContractual;

implementation
uses UnitGlobales, unitMain;

{$R *.dfm}

procedure TFrmAbonoContractual.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmAbonoContractual.BitBtn1Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHA').AsDateTime := dtFecha.DateTime;
          Open;
        end;
        frReport1.LoadFromFile(frmMain.ruta1 + 'Reporte\RepAbonoContractual.frf');
        frReport1.Dictionary.Variables.Variable['empresa'] := QuotedStr(empresa);
        frReport1.Dictionary.Variables.Variable['nit'] := QuotedStr(Nit);
        frReport1.Dictionary.Variables.Variable['elaboro'] := QuotedStr(Nombres + ' ' + Apellidos);
        frReport1.Dictionary.Variables.Variable['fecha'] := QuotedStr(datetostr(dtFecha.DateTime));

        frReport1.ShowReport;
end;

procedure TFrmAbonoContractual.dtFechaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BitBtn1.Click;
end;

procedure TFrmAbonoContractual.FormCreate(Sender: TObject);
begin
        Empleado;
end;

end.
