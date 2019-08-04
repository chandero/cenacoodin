unit unitModificarArticulo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb,  FileUtil, Forms, Controls, Graphics,
  Dialogs, DBGrids, DbCtrls, StdCtrls, fpspreadsheet,  fpstypes;

type

  { TfrmModificaArticulo }

  TfrmModificaArticulo = class(TForm)
    Button1: TButton;
    btnAplicar: TButton;
    btnAExcel: TButton;
    DSdata: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    edCodigo: TEdit;
    edNombre: TEdit;
    edQuery: TSQLQuery;
    edTransaction: TSQLTransaction;
    Label1: TLabel;
    Label2: TLabel;
    SD: TSaveDialog;
    edQueryBuscar: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: char);
    procedure edNombreKeyPress(Sender: TObject; var Key: char);
    procedure edQueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    procedure BuscarProductoPorCodigo;
    procedure BuscarProductoPorNombre;
  public
    { public declarations }
  end;

var
  frmModificaArticulo: TfrmModificaArticulo;
  buscando: Boolean;

const OUTPUT_FORMAT = sfExcel5;

implementation

{$R *.lfm}

{ TfrmModificaArticulo }

uses unitConnectionFactory;

procedure TfrmModificaArticulo.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmModificaArticulo.btnAplicarClick(Sender: TObject);
begin
  edQuery.ApplyUpdates;
  edTransaction.Commit;
  edTransaction.StartTransaction;
  edQuery.Open;
end;

procedure TfrmModificaArticulo.btnAExcelClick(Sender: TObject);
var
  MyWorkbook: TsWorkbook;
  MyWorksheet: TsWorksheet;
  MyDir: string;
  i, j: Integer;
begin
  // Initialization
  if (SD.Execute) then
  begin

    MyDir := SD.FileName;

    // Create the spreadsheet
    MyWorkbook := TsWorkbook.Create;
    MyWorksheet := MyWorkbook.AddWorksheet('ARTICULOS');

    // Write the field names
    for i := 0 to edQuery.Fields.Count - 1 do
    MyWorksheet.WriteText(0, i, edQuery.Fields[i].FieldName);

  // Write all cells to the worksheet
    edQuery.First;
    j := 0;
    while not edQuery.EOF do
    begin
    for i := 0 to edQuery.Fields.Count - 1 do
      MyWorksheet.WriteText(j + 1, i, edQuery.Fields[i].AsString);
      edQuery.Next;
      Inc(j);
    end;
  end;

  btnAExcel.Enabled:=false;
    // Save the spreadsheet to a file
  MyWorkbook.WriteToFile(MyDir + STR_EXCEL_EXTENSION, OUTPUT_FORMAT);
  MyWorkbook.Free;

  btnAExcel.Enabled:=true;

  ShowMessage('Documento: '+MyDir + ' Guardado!!');

end;

procedure TfrmModificaArticulo.edCodigoKeyPress(Sender: TObject; var Key: char);
begin
  BuscarProductoPorCodigo;
end;

procedure TfrmModificaArticulo.edNombreKeyPress(Sender: TObject; var Key: char);
begin
  BuscarProductoPorNombre;
end;

procedure TfrmModificaArticulo.edQueryFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  _sIzquierda1, _sDerecha1, _sIzquierda2: String;
begin
     if (Trim(edCodigo.Text) <> '') then
     begin

       _sIzquierda1 := LeftStr(DataSet.FieldByName('PROD_CODE').AsString, Length(edCodigo.Text));
       _sDerecha1 := edCodigo.Text;
       _sIzquierda2 := LeftStr(DataSet.FieldByName('PROD_BARCODE').AsString, Length(edCodigo.Text));
       if (_sIzquierda1 = _sDerecha1) or
          (_sIzquierda2 = _sDerecha1)
       then
       begin
           Accept := True;
       end
       else
       begin
           Accept := False;
       end;
     end
     else if (Trim(edNombre.Text) <> '') then
     begin
       if (Pos(Trim(edNombre.Text), DataSet.FieldByName('PROD_NAME').AsString) > 0)
       then
       begin
           Accept := True;
       end
       else
       begin
           Accept := False;
       end;
     end;

end;

procedure TfrmModificaArticulo.FormCreate(Sender: TObject);
begin

end;

procedure TfrmModificaArticulo.FormShow(Sender: TObject);
begin
  edQuery.DataBase := ConnectionFactory.IBConnection1;
  edQueryBuscar.DataBase := ConnectionFactory.IBConnection1;
  edTransaction.DataBase := ConnectionFactory.IBConnection1;
  edQuery.Transaction := edTransaction;
  edQueryBuscar.Transaction := edTransaction;
  edTransaction.StartTransaction;
  edQuery.Open;
end;

procedure TfrmModificaArticulo.BuscarProductoPorCodigo;
begin
           DBGrid1.DataSource.DataSet.Filtered := False;
           if (edCodigo.Text <> '') then
           begin
             DBGrid1.DataSource.DataSet.DisableControls;
             DBGrid1.DataSource.DataSet.Filter   := 'PROD_CODE >= ' + QuotedStr(edCodigo.Text) + ' OR PROD_BARCODE >= ' + QuotedStr(edCodigo.Text);
             DBGrid1.DataSource.DataSet.Filtered := True;
             DBGrid1.DataSource.DataSet.First;
             DBGrid1.DataSource.DataSet.EnableControls;
           end;
end;

procedure TfrmModificaArticulo.BuscarProductoPorNombre;
begin
     DBGrid1.DataSource.DataSet.Filtered := False;
    if (edNombre.Text <> '') then
     begin
  DBGrid1.DataSource.DataSet.DisableControls;
  DBGrid1.DataSource.DataSet.Filter   := 'PROD_NAME >= ' + QuotedStr(edNombre.Text);
  DBGrid1.DataSource.DataSet.Filtered := True;
  DBGrid1.DataSource.DataSet.First;
  DBGrid1.DataSource.DataSet.EnableControls;
  end;

end;

end.

