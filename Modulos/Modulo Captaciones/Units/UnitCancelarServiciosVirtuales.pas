unit UnitCancelarServiciosVirtuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, DB, IBCustomDataSet, IBQuery, Buttons, StdCtrls,
  Grids, DBGrids;

type
  TfrmCancelarServiciosVirtuales = class(TForm)
    GroupBox4: TGroupBox;
    DBGCuentas: TDBGrid;
    edBuscar: TEdit;
    btnActualizarUno: TButton;
    CmdCerrar: TBitBtn;
    IBQvCuenta: TIBQuery;
    DSCuentas: TDataSource;
    IBQupdate: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure CmdCerrarClick(Sender: TObject);
    procedure btnActualizarUnoClick(Sender: TObject);
    procedure edBuscarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelarServiciosVirtuales: TfrmCancelarServiciosVirtuales;

implementation

{$R *.dfm}

uses UnitGlobales, UnitdmGeneral;

procedure TfrmCancelarServiciosVirtuales.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCancelarServiciosVirtuales.btnActualizarUnoClick(
  Sender: TObject);
begin
        if (MessageDlg('Seguro de Cancelar los Servicios de la Cuenta Seleccionada?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          if (IBTransaction1.InTransaction) then
                IBTransaction1.Commit;
          IBTransaction1.StartTransaction;
          IBQupdate.Close;
          IBQupdate.SQL.Clear;
          IBQupdate.SQL.Add('UPDATE VIRTUAL_CUENTA SET VICU_ESTADO = 9, VICU_ESLEIDO = 0, VICU_FECHACANCELACION = :VICU_FECHACANCELACION WHERE VICU_ID = :VICU_ID');
          IBQupdate.ParamByName('VICU_FECHACANCELACION').AsDateTime := fFechaHoraActual;
          IBQupdate.ParamByName('VICU_ID').AsInteger := IBQvCuenta.FieldByName('VICU_ID').AsInteger;
          IBQupdate.ExecSQL;

          IBQupdate.Close;
          IBQupdate.SQL.Clear;
          IBQupdate.SQL.Add('UPDATE VIRTUAL_CUENTA_CANAL SET VICC_ESTADO = 9, VICC_ESLEIDO = 0 WHERE VICU_ID = :VICU_ID AND VICC_ESTADO <> 9');
          IBQupdate.ParamByName('VICU_ID').AsInteger := IBQvCuenta.FieldByName('VICU_ID').AsInteger;
          IBQupdate.ExecSQL;

          IBQupdate.Close;
          IBQupdate.SQL.Clear;
          IBQupdate.SQL.Add('UPDATE VIRTUAL_TARJETA_CUENTA SET VITC_ESTADO = 9, VITC_ESLEIDO = 0, VITC_FECHACANCELACION = :VITC_FECHACANCELACION WHERE VICU_ID = :VICU_ID AND VITC_ESTADO <> 9');
          IBQupdate.ParamByName('VITC_FECHACANCELACION').AsDateTime := fFechaHoraActual;
          IBQupdate.ParamByName('VICU_ID').AsInteger := IBQvCuenta.FieldByName('VICU_ID').AsInteger;
          IBQupdate.ExecSQL;

          IBTransaction1.Commit;
          ShowMessage('Cancelación Enviada...');
        end;
end;

procedure TfrmCancelarServiciosVirtuales.edBuscarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        IBQvCuenta.Locate('VICU_NUMERO_CUENTA', edBuscar.Text, []);
end;

procedure TfrmCancelarServiciosVirtuales.FormShow(Sender: TObject);
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

end.
