unit UnitProyeccionPagoCDAT;

interface

uses
  Windows, Messages, SysUtils, StrUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, JvEdit, JvTypedEdit, JvFloatEdit,
  DB, DBClient, pr_Common, pr_TxClasses;

type
  TfrmProyeccionPagoCDAT = class(TForm)
    Panel1: TPanel;
    CmdLiquidar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    Panel2: TPanel;
    EdValor: TJvCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdPlazo: TJvIntegerEdit;
    Label3: TLabel;
    EdAmortizacion: TJvIntegerEdit;
    EdTasa: TJvFloatEdit;
    Label4: TLabel;
    CDS: TClientDataSet;
    ComboModalidadCer: TComboBox;
    Label5: TLabel;
    CDSFECHA: TDateField;
    CDSVALOR: TCurrencyField;
    Reporte: TprTxReport;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProyeccionPagoCDAT: TfrmProyeccionPagoCDAT;

implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol;

procedure TfrmProyeccionPagoCDAT.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmProyeccionPagoCDAT.CmdLiquidarClick(Sender: TObject);
var
    i:Integer;
    ARecord:PTablaCerLiq;
    Lista:TList;
begin
        if EdValor.Value <= 0 then begin
          MessageDlg('Debe Colocar un Valor Valido',mtInformation,[mbok],0);
          Exit;
        end;

        if EdTasa.Value <= 0 then begin
          MessageDlg('Debe Colocar una Tasa Valida',mtInformation,[mbok],0);
          Exit;
        end;

        if EdPlazo.Value <= 0 then begin
          MessageDlg('Debe Colocar un Plazo Valido',mtInformation,[mbok],0);
          Exit;
        end;

        if EdAmortizacion.Value <= 0 then begin
          MessageDlg('Debe Colocar una Amortización Valida',mtInformation,[mbok],0);
          Exit;
        end;

        if EdAmortizacion.Value > EdPlazo.Value then begin
          MessageDlg('Amortización no puede ser mayor al plazo',mtInformation,[mbok],0);
          Exit;
        end;

        Lista := TablaCer(EdValor.Value,EdTasa.Value,
                          LeftStr(ComboModalidadCer.Text,1),fFechaActual,fFechaActual,
                                  EdAmortizacion.Value,EdPlazo.Value,Dayof(fFechaActual));

        try
          CDS.EmptyDataSet;
        finally
          CDS.Open;
        end;
        for i := 0 to Lista.Count - 1 do
        begin
           ARecord := Lista.Items[i];
           CDS.Insert;
           CDS.FieldByName('FECHA').AsDateTime := ARecord^.FechaPago;
           CDS.FieldByName('VALOR').AsCurrency := ARecord^.Valor;
           CDS.Post;
        end;
        CDS.Close;

        CmdVer.Enabled := True;
        CmdVer.Click;

end;

procedure TfrmProyeccionPagoCDAT.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmProyeccionPagoCDAT.CmdVerClick(Sender: TObject);
var TasaN:Extended;
begin
        if ComboModalidadCer.ItemIndex = 0 then
           TasaN := TasaNominalVencida(EdTasa.Value,EdAmortizacion.Value)
        else
           TasaN := TasaNominalAnticipada(EdTasa.Value,EdAmortizacion.Value);

        Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
        Reporte.Variables.ByName['vVALOR'].AsDouble := EdValor.Value;
        Reporte.Variables.ByName['vTASA'].AsDouble := EdTasa.Value;
        Reporte.Variables.ByName['vTASAN'].AsDouble := TasaN;
        Reporte.Variables.ByName['vPLAZO'].AsInteger := EdPlazo.Value;
        Reporte.Variables.ByName['vAMORTIZACION'].AsInteger := EdAmortizacion.Value;
        Reporte.Variables.ByName['vMODALIDAD'].AsString := ComboModalidadCer.Text;
        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);
end;

end.
