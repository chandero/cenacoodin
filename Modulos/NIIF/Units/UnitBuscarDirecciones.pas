unit UnitBuscarDirecciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, ExtCtrls, Grids, DBGrids,
  StdCtrls, Buttons, DBCtrls, UnitDmGeneral;

type
  TfrmBuscarDirecciones = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CBtiposid: TDBLookupComboBox;
    EdNombre: TEdit;
    EdNumeroIdentificacion: TMemo;
    CmdBuscarPersona: TBitBtn;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    GridDireccion: TStringGrid;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    CmdNuevo: TBitBtn;
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdNuevoClick(Sender: TObject);
    procedure CmdBuscarPersonaClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure BuscarDireccion;
  public
    { Public declarations }
  end;

var
  frmBuscarDirecciones: TfrmBuscarDirecciones;
  dmGeneral:TdmGeneral;
  vListaDirecciones:TList;
  Colores :array[1..15] of TColor;  
implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, UnitBuscarPersona;

type
   PListaDireccion = ^AListaDireccion;
   AListaDireccion = record
      TipoDireccion:Integer;
      Direccion:String;
      Barrio:String;
      Municipio:String;
      Telefono1:String;
      Telefono2:String;
      Telefono3:String;
      Telefono4:String;
   end;
   
procedure TfrmBuscarDirecciones.EdNumeroIdentificacionExit(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
           
        with IBQuery1 do
        begin
             SQL.Clear;
             SQL.Add('select * from "gen$persona" where ');
             SQL.Add('"gen$persona".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ');
             SQL.Add('"gen$persona".ID_PERSONA = :"ID_PERSONA"');
             ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
             Active := true;
             Last;
             First;
             if RecordCount = 1 then
             begin
                EdNombre.Text  := FieldByName('PRIMER_APELLIDO').AsString + ' '+
                                  FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                  FieldByName('NOMBRE').AsString;
                Close;
                BuscarDireccion;
                CmdNuevo.SetFocus;
             end;
        end;
end;

procedure TfrmBuscarDirecciones.BuscarDireccion;
var I:Integer;
begin
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
//        if IBQuery1.Transaction.InTransaction then
//           IBQuery1.Transaction.Rollback;
//        IBQuery1.Transaction.StartTransaction;

        with IBQuery1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$direccion" where ');
            SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ');
            SQL.Add('ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
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
//            Transaction.Commit;
        end;

end;

procedure TfrmBuscarDirecciones.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeNERAL.getConnected;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBDataSet1.Database := dmGeneral.IBDatabase1;
        IBDataSet1.Transaction := dmGeneral.IBTransaction1;
        Colores[7] := clYellow;
        Colores[6] := clBlue;
        Colores[5] := clFuchsia;
        Colores[4] := clAqua;
        Colores[3] := clLtGray;
        Colores[2] := clDkGray;
        Colores[1] := clWhite;
end;

procedure TfrmBuscarDirecciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := caFree;
end;

procedure TfrmBuscarDirecciones.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
        IBDataSet1.Open;
        IBDataSet1.Last;
        IBDataSet1.First;
        CBtiposid.KeyValue := 0;
end;

procedure TfrmBuscarDirecciones.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmBuscarDirecciones.CmdNuevoClick(Sender: TObject);
var I : Integer;
begin
      EdNumeroIdentificacion.Text := '';
      EdNombre.Text := '';
        For I := 0 to GridDireccion.RowCount do
         begin
           GridDireccion.Cells[0,I] := '';
           GridDireccion.Cells[1,I] := '';
           GridDireccion.Cells[2,I] := '';
           GridDireccion.Cells[3,I] := '';
           GridDireccion.Cells[4,I] := '';
           GridDireccion.Cells[5,I] := '';
           GridDireccion.Cells[6,I] := '';
           GridDireccion.Cells[7,I] := '';
         end;
      CBtiposid.SetFocus;
end;

procedure TfrmBuscarDirecciones.CmdBuscarPersonaClick(Sender: TObject);
var frmBuscarPersona:TfrmBuscarPersona;
begin
        frmBuscarPersona := TfrmBuscarPersona.Create(Self);
        if frmBuscarPersona.ShowModal = mrOK then
        begin
           CBtiposid.KeyValue := frmBuscarPersona.id_identificacion;
           EdNumeroIdentificacion.Text := frmBuscarPersona.id_persona;
           EdNumeroIdentificacionExit(TObject(EdNumeroIdentificacion));
        end;

end;

procedure TfrmBuscarDirecciones.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBuscarDirecciones.BitBtn1Click(Sender: TObject);
var I:Integer;
begin
      EdNumeroIdentificacion.Text := '';
      EdNombre.Text := '';
        For I := 0 to GridDireccion.RowCount do
         begin
           GridDireccion.Cells[0,I] := '';
           GridDireccion.Cells[1,I] := '';
           GridDireccion.Cells[2,I] := '';
           GridDireccion.Cells[3,I] := '';
           GridDireccion.Cells[4,I] := '';
           GridDireccion.Cells[5,I] := '';
           GridDireccion.Cells[6,I] := '';
           GridDireccion.Cells[7,I] := '';
         end;
      EdNumeroIdentificacion.SetFocus;
end;

end.
