unit UnitBuscarCiiu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, IBDatabase;

type
  TfrmBuscarCIIU = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    edDescripcion: TEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    btnCancelar: TBitBtn;
    IBTransaction1: TIBTransaction;
    IBQCLASECIIU: TIBQuery;
    IBQTIPOCIIU: TIBQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBLookupListBox1: TDBLookupListBox;
    procedure IBQCLASECIIUAfterScroll(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDescripcionKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    IdCiiu:string;
  end;

var
  frmBuscarCIIU: TfrmBuscarCIIU;

implementation

{$R *.dfm}

uses unitDmGeneral, UnitGlobales;

procedure TfrmBuscarCIIU.IBQCLASECIIUAfterScroll(DataSet: TDataSet);
begin
        IBQTIPOCIIU.Close;
        IBQTIPOCIIU.SQL.Clear;
        IBQTIPOCIIU.SQL.Add('select * from "gen$tiposciiu" where "gen$tiposciiu".ID_CLASE_CIIU = :ID_CLASE');
        IBQTIPOCIIU.ParamByName('ID_CLASE').AsString := IBQCLASECIIU.FieldByName('ID_CLASE_CIIU').AsString;
        IBQTIPOCIIU.Open;
end;

procedure TfrmBuscarCIIU.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmBuscarCIIU.FormCreate(Sender: TObject);
begin
        IBTransaction1.StartTransaction;
        IBQTIPOCIIU.Open;
        IBQCLASECIIU.Open;
        IBQCLASECIIU.Last;
        IBQCLASECIIU.First;
end;

procedure TfrmBuscarCIIU.BitBtn1Click(Sender: TObject);
begin
        IdCiiu := IBQTIPOCIIU.FieldByName('ID_CIIU').AsString;
end;

procedure TfrmBuscarCIIU.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        IBTransaction1.Commit;
end;

procedure TfrmBuscarCIIU.edDescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key <> #13 then
        begin
                IBQTIPOCIIU.Close;
                IBQTIPOCIIU.SQL.Clear;
                IBQTIPOCIIU.SQL.Add('select * from "gen$tiposciiu" where DESCRIPCION_CIIU LIKE :DESCRIPCION');
                IBQTIPOCIIU.ParamByName('DESCRIPCION').AsString := '%'+edDescripcion.Text+'%';
                IBQTIPOCIIU.Open;
        end;

end;

end.
