unit UnitPlantillas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
  IBDatabase,
  // Personal
UnitdmGeneral, ExtCtrls, DBCtrls, IBTable;


type
  TfrmPlantilla = class(TForm)
    grMaestro: TDBGrid;
    Label1: TLabel;
    grDetalle: TDBGrid;
    Label2: TLabel;
    EditPlantilla: TEdit;
    Label3: TLabel;
    dsMaestro: TDataSource;
    dsDetalle: TDataSource;
    dbnav2: TDBNavigator;
    dbnav1: TDBNavigator;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBQDetalle: TIBQuery;
    IBQmaestro: TIBQuery;
    BitBtn3: TBitBtn;
    IBTransaction1: TIBTransaction;
    procedure FormCreate(Sender: TObject);
    procedure IBTdetalleBeforeInsert(DataSet: TDataSet);
    procedure EditPlantillaChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    property Query:TIBQuery read IBQdetalle;
  end;

var
  frmPlantilla: TfrmPlantilla;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

procedure TfrmPlantilla.FormCreate(Sender: TObject);
begin

        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBQMaestro.Database := dmGeneral.IBDatabase1;
        IBQDetalle.Database := dmGeneral.IBDatabase1;

        IBQMaestro.Transaction := dmGeneral.IBTransaction1;
        IBQDetalle.Transaction := dmGeneral.IBTransaction1;

        IBTransaction1.StartTransaction;
        IBQMaestro.Open;
        IBQDetalle.Open;
end;

procedure TfrmPlantilla.IBTdetalleBeforeInsert(DataSet: TDataSet);
begin
        DataSet.FieldByName('PLAN_ID').AsInteger := IBQmaestro.FieldByName('PLAN_ID').AsInteger;
end;

procedure TfrmPlantilla.EditPlantillaChange(Sender: TObject);
begin
        if (EditPlantilla.Text <> '') then
        begin
         IBQmaestro.Filter := 'PLAN_DESCRIPCION LIKE %' + EditPlantilla.Text + '%';
         IBQmaestro.Filtered := True;
        end
        else
        begin
          IBQmaestro.Filter := '';
          IBQmaestro.Filtered := false;
        end;

end;

procedure TfrmPlantilla.BitBtn3Click(Sender: TObject);
var
 _query:TIBQuery;
 _transaction: TIBTransaction;
begin
        if MessageDlg('Confirmar Eliminar Plantilla Seleccionada',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
                _query := TIBQuery.Create(nil);
                _transaction := TIBTransaction.Create(nil);
                _transaction.DefaultDatabase := dmGeneral.IBDatabase1;
                _query.Transaction := _transaction;
                _transaction.StartTransaction;
                _query.SQL.Add('delete from CON$PLANTILLA where PLAN_ID = :PLAN_ID');
                _query.ParamByName('PLAN_ID').AsInteger := IBQmaestro.fieldbyname('PLAN_ID').AsInteger;
                try
                 _query.ExecSQL;
                 _transaction.Commit;
                 IBTransaction1.Commit;
                 IBTransaction1.StartTransaction;
                 IBQmaestro.Open;
                 IBQDetalle.Open;
                Except
                  raise;
                end;
                _query.Free;
                _transaction.Free;
        end;
end;

end.
