unit UnitConsultaJuvenil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB,
  IBCustomDataSet, IBQuery, DateUtils, Menus;

type
  TFrmConsultaJuvenil = class(TForm)
    GrConsulta: TGroupBox;
    rEntregados: TRadioButton;
    rNoEntregados: TRadioButton;
    rTodos: TRadioButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dFecha1: TDateTimePicker;
    dFecha2: TDateTimePicker;
    Panel1: TPanel;
    btConsulta: TBitBtn;
    BitNuevo: TBitBtn;
    BtSalir: TBitBtn;
    BtExcel: TBitBtn;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    IBQuery2: TIBQuery;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label3: TLabel;
    EdNombre: TEdit;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    Seguro1: TMenuItem;
    Direccion1: TMenuItem;
    procedure BtSalirClick(Sender: TObject);
    procedure BtExcelClick(Sender: TObject);
    procedure BitNuevoClick(Sender: TObject);
    procedure btConsultaClick(Sender: TObject);
    procedure EdNombreChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Direccion1Click(Sender: TObject);
    procedure Seguro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaJuvenil: TFrmConsultaJuvenil;

implementation
uses ComObj, UnitPantallaProgreso, UnitDireccionesAsociados,
  UnitImprimirSeguro;

{$R *.dfm}

procedure TFrmConsultaJuvenil.BtSalirClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmConsultaJuvenil.BtExcelClick(Sender: TObject);
var   G :Integer;
      Excel, WorkBook, WorkSheet: Variant;
      DesAgencia :string;
      Format: OleVariant;
const
       xlWBATWorksheet = -4167;

begin
       Excel := CreateOleObject('Excel.Application');
       Excel.DisplayAlerts := false;
       Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
       WorkSheet := WorkBook.WorkSheets[1];
       WorkSheet.Name := 'Seguro Juvenil';
       G := 0;
       with IBQuery2 do
       begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT "gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE as NOMBRE,');
          SQL.Add('"cap$segurojuvenil".ID_PERSONA,');
          SQL.Add('"cap$segurojuvenil".EDAD,');
          SQL.Add('"cap$segurojuvenil".VALOR_ASEGURADO');
          SQL.Add('FROM "cap$segurojuvenil"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("cap$segurojuvenil".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("cap$segurojuvenil".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('WHERE "cap$segurojuvenil".FECHA_SEGURO BETWEEN :FECHA1 and :FECHA2');
          ParamByName('FECHA1').AsDate := dFecha1.Date;
          ParamByName('FECHA2').AsDate := dFecha2.Date;          
          Open;
          WorkSheet.Cells[1,1].ColumnWidth := 31;
          WorkSheet.Cells[1,2].ColumnWidth := 12;
          WorkSheet.cells[1,3].ColumnWidth := 3;
          WorkSheet.Cells[1,4].ColumnWidth := 8;
//          WorkSheet.range['A3:E3'].Font.FontStyle := 'Bold';
          IBQuery2.Last;
          IBQuery2.First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Caption := 'Aplicando Seguro Juvenil';
          frmProgreso.Max := IBQuery2.RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
           frmProgreso.InfoLabel := 'Registro No ' + IntToStr(RecNo);
           frmProgreso.Position := RecNo;
           Application.ProcessMessages;
           for G := 1 to 4 do
             WorkSheet.Cells[recno, G] := Fields.Fields[G - 1].AsString;
           Next;
          end;
          frmProgreso.Cerrar;
        end;
          WorkBook.SaveAs('c:\SeguroJuvenil' + FormatDateTime('yyyyMMdd',dFecha1.Date) + '_' + FormatDateTime('yyyyMMdd',dFecha2.Date) + '.xls');
          Excel.WorkBooks.Open('c:\SeguroJuvenil' + FormatDateTime('yyyyMMdd',dFecha1.Date) + '_' + FormatDateTime('yyyyMMdd',dFecha2.Date) + '.xls');
          Excel.visible:=True;
end;

procedure TFrmConsultaJuvenil.BitNuevoClick(Sender: TObject);
begin
        btConsulta.Enabled := True;
        rTodos.Checked := True;
        GrConsulta.Enabled := True;
        BtExcel.Enabled := False;
        IBQuery1.Close;
        BtExcel.Enabled := True;
end;

procedure TFrmConsultaJuvenil.btConsultaClick(Sender: TObject);
begin
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          ParamByName('FECHA1').AsDate := dFecha1.Date;
          ParamByName('FECHA2').AsDate := dFecha2.Date;
          ParamByName('DESCRIPCION').AsString := '';
          Open;
          if RecordCount < 0 then
          begin
            ShowMessage('No se encontraron Registros');
            Exit;
          end
          else
          BtExcel.Enabled := True;
        end;
end;

procedure TFrmConsultaJuvenil.EdNombreChange(Sender: TObject);
begin
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          ParamByName('FECHA1').AsDate := dFecha1.Date;
          ParamByName('FECHA2').AsDate := dFecha2.Date;
          Parambyname('DESCRIPCION').AsString := EdNombre.Text;
          open;
        end;

end;

procedure TFrmConsultaJuvenil.FormCreate(Sender: TObject);
begin
        dFecha1.DateTime := Date;
        dFecha2.DateTime := Date;
end;

procedure TFrmConsultaJuvenil.Direccion1Click(Sender: TObject);
begin
           frmDireccionesAsociado := TfrmDireccionesAsociado.Create(Self);
           frmDireccionesAsociado.Id := ibquery1.FieldByName('ID_IDENTIFICACION').AsInteger;
           frmDireccionesAsociado.Documento := ibquery1.FieldByName('ID_PERSONA').AsString;
           frmDireccionesAsociado.Nombre := ibquery1.FieldByName('NOMBRE').AsString;
           frmDireccionesAsociado.ShowModal;

end;

procedure TFrmConsultaJuvenil.Seguro1Click(Sender: TObject);
begin
        FrmImprimirSeguro := TFrmImprimirSeguro.Create(Self);
        FrmImprimirSeguro.JvNumeroCuenta.Text := ibquery1.FieldByName('NUMERO_CUENTA').AsString;
        FrmImprimirSeguro.BitBuscar.Click;
        FrmImprimirSeguro.ShowModal;
end;

end.
