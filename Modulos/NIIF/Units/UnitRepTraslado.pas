unit UnitRepTraslado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, FR_DSet, FR_DBSet, FR_Class;

type
  TFrmRepTraslado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CbEstado: TComboBox;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    vFecha1: TDateTimePicker;
    vFecha2: TDateTimePicker;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    IbTraslado: TIBQuery;
    procedure CbEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  published
    procedure imprimir(cadena: string);
    { Public declarations }
  end;

var
  FrmRepTraslado: TFrmRepTraslado;

implementation
uses UnitGlobales, UnitImpresion, unitMain;

{$R *.dfm}

procedure TFrmRepTraslado.CbEstadoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmRepTraslado.BitBtn1Click(Sender: TObject);
begin
        with IbTraslado do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          ParamByName('FECHA1').AsDate := vFecha1.Date;
          ParamByName('FECHA2').AsDate := vFecha2.Date;
          ParamByName('ESTADO').AsInteger := CbEstado.ItemIndex;
          Open;
        end;
        Empleado;
        imprimir(frmMain.ruta1 + '\reporte\RepTraslado.frf');
end;

procedure TFrmRepTraslado.imprimir(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmRepTraslado.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'empleado' then
           ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'fecha1' then
           ParValue := vFecha1.Date;
        if ParName = 'fecha2' then
           ParValue := vFecha2.Date;
        if ParName = 'estado' then
           ParValue := CbEstado.Text;

end;

procedure TFrmRepTraslado.FormCreate(Sender: TObject);
begin
        vFecha1.Date := fFechaActual;
        vFecha2.Date := fFechaActual;
        Empleado;
end;

end.
