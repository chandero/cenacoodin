unit UnitPedidoPlasticos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvMaskEdit, JvSpin, Buttons, ExtCtrls, IBSQL,
  JvEdit, JvTypedEdit;

type
  TfrmPedidoPlasticos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EdCantidad: TJvSpinEdit;
    Panel1: TPanel;
    btnRegistrar: TBitBtn;
    btnCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    Label3: TLabel;
    EdExistencia: TStaticText;
    EdUltimoPlastico: TStaticText;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRegistrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoPlasticos: TfrmPedidoPlasticos;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmPedidoPlasticos.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidoPlasticos.FormCreate(Sender: TObject);
begin
   if IBSQL1.Transaction.InTransaction then
       IBSQL1.Transaction.Rollback;
   IBSQL1.Transaction.StartTransaction;
   IBSQL1.Close;
   IBSQL1.SQL.Clear;
   IBSQL1.SQL.Add('select first 1  * from "cap$tarjetasdebito" order by ID_TARJETA DESC');
   try
     IBSQL1.ExecQuery;
     EdUltimoPlastico.Caption := IBSQL1.FieldByName('ID_TARJETA').AsString;
   except
     IBSQL1.Transaction.Rollback;
     raise;
   end;

   IBSQL1.Close;
   IBSQL1.SQL.Clear;
   IBSQL1.SQL.Add('select count(*) as TOTAL from "cap$tarjetasdebito" where ID_ESTADO = 0');
   try
    IBSQL1.ExecQuery;
    EdExistencia.Caption := IntToStr(IBSQL1.FieldByName('TOTAL').AsInteger);
   except
    IBSQL1.Transaction.Rollback;
    raise;
   end;

   IBSQL1.Close;
   IBSQL1.SQL.Clear;
   IBSQL1.SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 17');
   try
    IBSQL1.ExecQuery;
    EdCantidad.MinValue := IBSQL1.FieldByName('VALOR_MINIMO').AsInteger;
   except
    IBSQL1.Transaction.Rollback;
    raise;
   end;

end;

procedure TfrmPedidoPlasticos.btnRegistrarClick(Sender: TObject);
begin
      if MessageDlg('¿Seguro de Realizar el Pedido?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        with IBSQL1 do begin
          btnRegistrar.Enabled := False;
          Application.ProcessMessages;
          Close;
          SQL.Clear;
          SQL.Add('insert into "cap$tarjetapedido" values (:FECHA_PEDIDO,:ID_TARJETA_FINAL,:CANTIDAD)');
          ParamByName('FECHA_PEDIDO').AsDate := fFechaActual;
          ParamByName('ID_TARJETA_FINAL').AsString := EdUltimoPlastico.Caption;
          ParamByName('CANTIDAD').AsInteger := Trunc(EdCantidad.Value);
          try
           IBSQL1.ExecQuery;
           IBSQL1.Transaction.Commit;
           ShowMessage('Pedido Registrado con Exito!');
          except
           IBSQL1.Transaction.Rollback;
           ShowMessage('Error al registrar pedido');
           raise;
          end;
        end;
end;

end.
