unit UnitReporteEndoso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, FR_Class, FR_DSet, FR_DBSet;

type
  TFrmReporteEndoso = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBentidad: TDBLookupComboBox;
    CHtotal: TCheckBox;
    Panel2: TPanel;
    Breporte: TBitBtn;
    Bcerrar: TBitBtn;
    IBentidad: TIBQuery;
    DSentidad: TDataSource;
    frReport1: TfrReport;
    IBparcial: TIBQuery;
    frDBDataSet1: TfrDBDataSet;
    IBtotal: TIBQuery;
    frDBDataSet2: TfrDBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BreporteClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BcerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  FrmReporteEndoso: TFrmReporteEndoso;

implementation

uses UnitdmGeneral, UnitImpresion, unitMain, UnitGlobales;

{$R *.dfm}

procedure TFrmReporteEndoso.FormCreate(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        IBentidad.Open;
        IBentidad.Last;
end;

procedure TFrmReporteEndoso.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmReporteEndoso.BreporteClick(Sender: TObject);
begin
        Empleado;
        if CHtotal.Checked then
        begin
          IBtotal.Close;
          IBtotal.Open;
          if IBtotal.RecordCount = 0 then
          begin
            MessageDlg('No Existen Registros Disponibles',mtInformation,[mbok],0);
            Exit;
          end;
          IBtotal.Last;
          imprimir_reporte(frmMain.ruta1 + '\reporte\RepPagareEndosadoTotal.frf');
        end
        else
        begin
          if DBentidad.KeyValue = Null then
             Exit;
          IBparcial.Close;
          IBparcial.ParamByName('ID_ENTIDAD').AsInteger := DBentidad.KeyValue;
          IBparcial.Open;
          if IBparcial.RecordCount = 0 then
          begin
            MessageDlg('No Existen Registros Disponibles',mtInformation,[mbok],0);
            Exit;
          end;
          imprimir_reporte(frmMain.ruta1 + '\reporte\RepPagareEndosado.frf');
        end;
end;

procedure TFrmReporteEndoso.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'entidad' then
          ParValue := DBentidad.Text;
        if ParName = 'nit' then
          ParValue := Nit;
        if ParName = 'empresa' then
          ParValue := Empresa;
        if ParName = 'empleado' then
          ParValue := Nombres + ' ' + Apellidos;
end;

procedure TFrmReporteEndoso.BcerrarClick(Sender: TObject);
begin
        Close;
end;

end.
