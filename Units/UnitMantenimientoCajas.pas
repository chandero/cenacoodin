unit UnitMantenimientoCajas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask,
  DBCtrls, ExtCtrls, Buttons;

type
  TfrmMantenimientoCajas = class(TForm)
    DBGrid1: TDBGrid;
    DSCajas: TDataSource;
    EdCaja: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdDescripcion: TDBEdit;
    DBLCBEmpleados: TDBLookupComboBox;
    Label3: TLabel;
    DSEmpleado: TDataSource;
    IBEmpleado: TIBQuery;
    EdHoraIni: TDBEdit;
    EdHoraFin: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    DBNavigator: TDBNavigator;
    IBCajas: TIBDataSet;
    IBCajasID_CAJA: TSmallintField;
    IBCajasDESCRIPCION: TIBStringField;
    IBCajasID_ESTADO_CAJA: TSmallintField;
    IBCajasID_EMPLEADO: TIBStringField;
    IBCajasHORA_INICIO: TTimeField;
    IBCajasHORA_FINAL: TTimeField;
    EdServicaja: TDBCheckBox;
    IBCajasCODIGO: TIBStringField;
    IBCajasSERVICAJA: TSmallintField;
    EdCodigo: TDBEdit;
    Label6: TLabel;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBCajasBeforePost(DataSet: TDataSet);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMantenimientoCajas: TfrmMantenimientoCajas;

implementation

{$R *.dfm}

uses UnitdmGeneral;

procedure TfrmMantenimientoCajas.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMantenimientoCajas.FormShow(Sender: TObject);
begin
        if IBCajas.Transaction.InTransaction then
           IBCajas.Transaction.Rollback;
        IBCajas.Transaction.StartTransaction;
        IBCajas.Open;
        IBEmpleado.Open;
end;

procedure TfrmMantenimientoCajas.IBCajasBeforePost(DataSet: TDataSet);
begin
        IBCajasID_ESTADO_CAJA.Value := 1;
end;

procedure TfrmMantenimientoCajas.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
        if Button = nbpost then
           IBCajas.Transaction.CommitRetaining;
end;

end.
