unit UnitPaginarPapel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, JvEdit, JvTypedEdit, DB, DBClient,
  pr_Common, pr_TxClasses;

type
  TfrmPaginarPapel = class(TForm)
    RGTipo: TRadioGroup;
    Panel1: TPanel;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdPagina: TJvIntegerEdit;
    EdCantidad: TJvIntegerEdit;
    CDS: TClientDataSet;
    CDSID_PAGINA: TIntegerField;
    CDSPAGINA: TIntegerField;
    GroupBox2: TGroupBox;
    EdEncabezado: TMemo;
    Reporte2: TprTxReport;
    Reporte1: TprTxReport;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPaginarPapel: TfrmPaginarPapel;

implementation

{$R *.dfm}


uses UnitGlobales;

procedure TfrmPaginarPapel.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmPaginarPapel.CmdProcesarClick(Sender: TObject);
var pag:Integer;
begin
        for pag := EdPagina.Value to (EdPagina.Value + EdCantidad.Value - 1) do
        begin
         CDS.Open;
         CDS.Insert;
         CDS.FieldByName('ID_PAGINA').AsInteger := pag;
         CDS.FieldByName('PAGINA').AsInteger := pag;
         CDS.Post;
         CDS.Close;
        end;

        Reporte1.Variables.ByName['EMPRESA'].AsString := Empresa;
        Reporte1.Variables.ByName['NIT'].AsString := Nit;
        Reporte1.Variables.ByName['ENCABEZADO'].AsString := UpperCase(EdEncabezado.Text);

        Reporte2.Variables.ByName['EMPRESA'].AsString := Empresa;
        Reporte2.Variables.ByName['NIT'].AsString := Nit;
        Reporte2.Variables.ByName['ENCABEZADO'].AsString := UpperCase(EdEncabezado.Text);

        case RGTipo.ItemIndex of
         0: if Reporte1.PrepareReport then
               Reporte1.PreviewPreparedReport(True);
         1: if Reporte2.PrepareReport then
               Reporte2.PreviewPreparedReport(True);
        end;

        CDS.EmptyDataSet;
end;

end.
