unit UnitDireccionesAsociados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  IBDatabase, UnitDmGeneral;

type
  TfrmDireccionesAsociado = class(TForm)
    Panel1: TPanel;
    GridDireccion: TStringGrid;
    Panel2: TPanel;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBTAdicional: TIBTransaction;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FId:Integer;
    FDocumento:string;
    
    FNombre:string;
  public
    property Id:Integer read FId Write FId;
    property Documento:string read FDocumento Write FDocumento;
    property Nombre:string read FNombre Write FNombre;
    { Public declarations }
  end;

var
  frmDireccionesAsociado: TfrmDireccionesAsociado;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

procedure TfrmDireccionesAsociado.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmDireccionesAsociado.FormShow(Sender: TObject);
var I:Integer;
begin
        Caption := 'Direcciones de:' + FNombre;
        I := 0;
        GridDireccion.ColCount := 8;
        GridDireccion.FixedCols := 0;
        GridDireccion.FixedRows := 0;
        GridDireccion.ColWidths[0] := 30;
        GridDireccion.ColWidths[1] := 190;
        GridDireccion.ColWidths[2] := 100;
        GridDireccion.ColWidths[3] := 70;
        GridDireccion.ColWidths[4] := 60;
        GridDireccion.ColWidths[5] := 60;
        GridDireccion.ColWidths[6] := 60;
        GridDireccion.ColWidths[7] := 60;
        if IBQuery1.Transaction.InTransaction then
           IBQuery1.Transaction.Rollback;
        IBQuery1.Transaction.StartTransaction;

        with IBQuery1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$direccion" where ');
            SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ');
            SQL.Add('ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_IDENTIFICACION').AsInteger := FId;
            ParamByName('ID_PERSONA').AsString := FDocumento;
            Open;
            GridDireccion.Cells[0,0] := 'ID';
            GridDireccion.Cells[1,0] := 'Dirección';
            GridDireccion.Cells[2,0] := 'Barrio';
            GridDireccion.Cells[3,0] := 'Municipio';
            GridDireccion.Cells[4,0] := 'Teléfono 1';
            GridDireccion.Cells[5,0] := 'Teléfono 2';
            GridDireccion.Cells[6,0] := 'Teléfono 3';
            GridDireccion.Cells[7,0] := 'Teléfono 4';
            GridDireccion.FixedRows := 1;
            if RecordCount > 0 then
            begin
                while not eof do
                begin
                  I := I + 1;
                  GridDireccion.RowCount := I+1;
                  GridDireccion.Cells[0,I] := IntToStr(FieldByName('ID_DIRECCION').AsInteger);
                  GridDireccion.Cells[1,I] := FieldByName('DIRECCION').AsString;
                  GridDireccion.Cells[2,I] := FieldByName('BARRIO').AsString;
                  GridDireccion.Cells[3,I] := FieldByName('MUNICIPIO').AsString;
                  GridDireccion.Cells[4,I] := FieldByName('TELEFONO1').AsString;
                  GridDireccion.Cells[5,I] := FieldByName('TELEFONO2').AsString;
                  GridDireccion.Cells[6,I] := FieldByName('TELEFONO3').AsString;
                  GridDireccion.Cells[7,I] := FieldByName('TELEFONO4').AsString;
                  Next;
                end;
            end;
            Transaction.Commit;
        end;

end;

procedure TfrmDireccionesAsociado.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBTAdicional.DefaultDatabase := dmGeneral.IBDatabase1;
        
end;

end.
