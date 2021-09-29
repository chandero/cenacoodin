unit unitCargarArticulo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, memds, FileUtil, RTTICtrls, Forms, Controls,
  Graphics, Dialogs, StdCtrls, Spin;

type

  { TfrmCargaArticulo }

  TfrmCargaArticulo = class(TForm)
    btnAgregar: TButton;
    btnLimpiar: TButton;
    btnSalir: TButton;
    edCodigo: TEdit;
    edArticulo: TEdit;
    edId: TEdit;
    edPrecio: TEdit;
    edPresentacion: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edCantidad: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edQuery: TSQLQuery;
    edTransaction: TSQLTransaction;
    edQueryInsert: TSQLQuery;
    Label6: TLabel;
    MemDataset1: TMemDataset;
    procedure btnAgregarClick(Sender: TObject);
    procedure btnAgregarKeyPress(Sender: TObject; var Key: char);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure edArticuloChange(Sender: TObject);
    procedure edCantidadKeyPress(Sender: TObject; var Key: char);
    procedure edCodigoExit(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    procedure BuscarProducto;
    procedure cleanData;
  public
    { public declarations }
  end;

var
  frmCargaArticulo: TfrmCargaArticulo;

implementation

{$R *.lfm}

uses unitConnectionFactory;

{ TfrmCargaArticulo }

procedure TfrmCargaArticulo.edCodigoKeyPress(Sender: TObject; var Key: char);
begin
     if (Key = Char(13)) then
     begin
           BuscarProducto;
           edCantidad.SetFocus;
     end;
end;

procedure TfrmCargaArticulo.btnAgregarClick(Sender: TObject);
begin

          edQueryInsert.Close;
          edQueryInsert.Params.ParamByName('MOVE_DATE').AsDate:=Date;
          edQueryInsert.Params.ParamByName('MOVE_TIME').AsTime:=Time;
          edQueryInsert.Params.ParamByName('PROD_ID').AsInteger:=StrToInt(edId.Text);
          edQueryInsert.Params.ParamByName('MOVE_QUANTITY').AsInteger := edCantidad.Value;
          edQueryInsert.Params.ParamByName('EMPL_ID').Clear;

          ConnectionFactory.IBConnection1.Open;

          if (not ConnectionFactory.IBConnection1.Connected) then
          begin
             ShowMessage('No se pudo conectar con la base de datos');
          end
          else
          begin
            edTransaction.StartTransaction;
            edQueryInsert.ExecSQL;
            edTransaction.Commit;
            ShowMessage('Artículo:'+edArticulo.Text+', Cantidad:'+IntToStr(edCantidad.Value)+' Agregado');
            cleanData;
          end;
end;

procedure TfrmCargaArticulo.btnAgregarKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TfrmCargaArticulo.btnLimpiarClick(Sender: TObject);
begin
     cleanData;
end;

procedure TfrmCargaArticulo.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCargaArticulo.edArticuloChange(Sender: TObject);
begin

end;

procedure TfrmCargaArticulo.edCantidadKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = Char(13)) then
  begin
     btnAgregar.SetFocus;
  end;
end;

procedure TfrmCargaArticulo.edCodigoExit(Sender: TObject);
begin
     BuscarProducto;
end;

procedure TfrmCargaArticulo.FormCreate(Sender: TObject);
begin

end;

procedure TfrmCargaArticulo.FormShow(Sender: TObject);
begin
     edQuery.DataBase := ConnectionFactory.IBConnection1;
     edTransaction.DataBase := ConnectionFactory.IBConnection1;

     edQueryInsert.DataBase := ConnectionFactory.IBConnection1;
     edQuery.Transaction := edTransaction;
     edQueryInsert.Transaction := edTransaction;
end;

procedure TfrmCargaArticulo.BuscarProducto();
begin
     //Buscar Producto
     edQuery.Close;
     edQuery.Params.ParamByName('CODE').AsString := edCodigo.Text;

     ConnectionFactory.IBConnection1.Open;

     if (not ConnectionFactory.IBConnection1.Connected) then
     begin
         ShowMessage('No se pudo conectar con la base de datos');
     end
     else
     begin
      edTransaction.StartTransaction;
      edQuery.Open;
      if (edQuery.RecordCount > 0 ) then
      begin
           edArticulo.Text:= edQuery.FieldByName('PROD_NAME').AsString;
           edPresentacion.Text:= edQuery.FieldByName('PROD_PRESENTATION').AsString;
           edPrecio.Text:=Format('%.2n', [edQuery.FieldByName('PROD_SALE01').AsCurrency]);
           edId.Text:= edQuery.FieldByName('PROD_ID').AsString;
      end
      else
      begin
           edArticulo.Text:='Artículo No Encontrado';
      end;
      edTransaction.Commit;
      ConnectionFactory.IBConnection1.Close();
     end;
end;

procedure TfrmCargaArticulo.cleanData;
begin
     edCodigo.Text:='';
     edArticulo.Text:= '';
     edPresentacion.Text:='';
     edId.Text:='';
     edPresentacion.Text:='';
     edCantidad.Value:=1;
     edPrecio.Text:='';
     edCodigo.SetFocus;
end;

end.

