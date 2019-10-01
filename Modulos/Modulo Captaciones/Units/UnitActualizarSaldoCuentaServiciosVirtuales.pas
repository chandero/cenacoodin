unit UnitActualizarSaldoCuentaServiciosVirtuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Buttons,
  IBDatabase;

type
  TfrmActualizarSaldoCuentaServiciosVirtuales = class(TForm)
    GroupBox4: TGroupBox;
    DBGCuentas: TDBGrid;
    IBQvCuenta: TIBQuery;
    edBuscar: TEdit;
    DSCuentas: TDataSource;
    btnActualizarUno: TButton;
    btnActualizarTodos: TButton;
    CmdCerrar: TBitBtn;
    IBQupdate: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure FormShow(Sender: TObject);
    procedure edBuscarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CmdCerrarClick(Sender: TObject);
    procedure btnActualizarUnoClick(Sender: TObject);
    procedure btnActualizarTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActualizarSaldoCuentaServiciosVirtuales: TfrmActualizarSaldoCuentaServiciosVirtuales;

implementation

uses UnitdmGeneral;

{$R *.dfm}

procedure TfrmActualizarSaldoCuentaServiciosVirtuales.FormShow(
  Sender: TObject);
begin
       if (not dmGeneral.IBDatabase1.Connected) then
       begin
           ShowMessage('Database Desconectada');
       end;

       if (IBQvCuenta.Transaction.InTransaction) then
         IBQvCuenta.Transaction.Commit;
       IBQvCuenta.Transaction.StartTransaction;
       IBQvCuenta.Open;
       IBQvCuenta.Last;
end;

procedure TfrmActualizarSaldoCuentaServiciosVirtuales.edBuscarKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
        IBQvCuenta.Locate('VICU_NUMERO_CUENTA', edBuscar.Text, []);
end;

procedure TfrmActualizarSaldoCuentaServiciosVirtuales.CmdCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmActualizarSaldoCuentaServiciosVirtuales.btnActualizarUnoClick(
  Sender: TObject);
begin
        if (IBTransaction1.InTransaction) then
          IBTransaction1.Commit;
        IBTransaction1.StartTransaction;
        IBQupdate.Close;
        IBQupdate.SQL.Clear;
        IBQupdate.SQL.Add('UPDATE VIRTUAL_CUENTA SET VICU_ESLEIDO = 0 WHERE VICU_ID = :VICU_ID');
        IBQupdate.ParamByName('VICU_ID').AsInteger := IBQvCuenta.FieldByName('VICU_ID').AsInteger;
        IBQupdate.ExecSQL;
        IBTransaction1.Commit;
        ShowMessage('Actualización Enviada...');
end;

procedure TfrmActualizarSaldoCuentaServiciosVirtuales.btnActualizarTodosClick(
  Sender: TObject);
begin
        if (IBTransaction1.InTransaction) then
          IBTransaction1.Commit;
        IBTransaction1.StartTransaction;
        IBQupdate.Close;
        IBQupdate.SQL.Clear;
        IBQupdate.SQL.Add('UPDATE VIRTUAL_CUENTA SET VICU_ESLEIDO = 0 WHERE VICU_ESTADO <> 9');
        IBQupdate.ExecSQL;
        IBTransaction1.Commit;
        ShowMessage('Actualización Enviada...');
end;

end.
