unit unitConsultarArticulo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Spin;

type

  { TfrmConsultarArticulo }

  TfrmConsultarArticulo = class(TForm)
    btnLimpiar: TButton;
    btnSalir: TButton;
    edArticulo: TEdit;
    edCantidad: TSpinEdit;
    edCodigo: TEdit;
    edId: TEdit;
    edPrecio: TEdit;
    edPresentacion: TEdit;
    edQuery: TSQLQuery;
    edTransaction: TSQLTransaction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    procedure BuscarProducto;
    procedure CleanData;
  public
    { public declarations }
  end;

var
  frmConsultarArticulo: TfrmConsultarArticulo;

implementation

{$R *.lfm}

{ TfrmConsultarArticulo }

uses unitConnectionFactory;

procedure TfrmConsultarArticulo.CleanData;
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

procedure TfrmConsultarArticulo.edCodigoExit(Sender: TObject);
begin
  BuscarProducto
end;

procedure TfrmConsultarArticulo.edCodigoKeyPress(Sender: TObject; var Key: char
  );
begin
  if (Key = Char(13) ) then
  begin
       BuscarProducto;
  end;
end;

procedure TfrmConsultarArticulo.btnSalirClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConsultarArticulo.btnLimpiarClick(Sender: TObject);
begin
  cleanData;
end;

procedure TfrmConsultarArticulo.FormShow(Sender: TObject);
begin
       edQuery.DataBase := ConnectionFactory.IBConnection1;
     edTransaction.DataBase := ConnectionFactory.IBConnection1;


     edQuery.Transaction := edTransaction;

end;

procedure TfrmConsultarArticulo.BuscarProducto;
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
      edCantidad.Value:=edQuery.FieldByName('PROD_INVENTORY').AsInteger;
 end
 else
 begin
      edArticulo.Text:='Artículo No Encontrado';
 end;
 edTransaction.Commit;
 ConnectionFactory.IBConnection1.Close();
end;

end;

end.

