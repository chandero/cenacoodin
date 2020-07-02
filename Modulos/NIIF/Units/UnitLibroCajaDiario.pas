unit UnitLibroCajaDiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  StrUtils,
  DB, DBClient, FR_DSet, FR_DBSet, FR_Class, frOLEExl, pr_Common,
  pr_TxClasses, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Mask, ExtCtrls,
  Dialogs, UnitdmGeneral;

type
  TfrmLibroRCajaDiario = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    CBMeses: TComboBox;
    EdAno: TMaskEdit;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQTemp: TIBQuery;
    IBQTemp1: TIBQuery;
    Reporte: TprTxReport;
    frReport1: TfrReport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    CDSdata: TClientDataSet;
    CDSdataCODIGO: TStringField;
    CDSdataNOMBRE: TStringField;
    CDSdataDEBITO: TCurrencyField;
    CDSdataCREDITO: TCurrencyField;
    CDSdataDIA: TIntegerField;
    CDSdata1: TClientDataSet;
    CDSdata1CODIGO: TStringField;
    CDSdata1NOMBRE: TStringField;
    CDSdata1DEBITO: TCurrencyField;
    CDSdata1CREDITO: TCurrencyField;
    IBQuery1: TIBQuery;
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLibroRCajaDiario: TfrmLibroRCajaDiario;
  dmGeneral: TdmGeneral;
implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmLibroRCajaDiario.CmdAceptarClick(Sender: TObject);
var
  Codigo: String;
begin
        with IBQTemp do begin
          Close;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
          Open;
        end;


        CDSdata.Open;
        CDSdata.EmptyDataSet;

        while not IBQTemp.Eof do
        begin
            CDSdata.Filtered := False;
            CDSdata.Filter := 'DIA = ' + IntToStr(IBQTemp.FieldByName('DIA').AsInteger) + ' and CODIGO = ' + QuotedStr(LeftStr(IBQTemp.FieldByName('CODIGO').AsString,4));
            CDSdata.Filtered := True;
            if (CDSdata.RecordCount > 0) then
            begin
                CDSdata.Edit;
                CDSdataDEBITO.Value := CDSdataDEBITO.Value + IBQTemp.FieldByName('DEBITO').AsCurrency;
                CDSdataCREDITO.Value := CDSdataCREDITO.Value + IBQTemp.FieldByName('CREDITO').AsCurrency;
                CDSdata.Post;
            end
            else
            begin
                CDSdata.Insert;
                Codigo := LeftStr(IBQTemp.FieldByName('CODIGO').AsString,4);
                IBQuery1.Close;
                IBQuery1.ParamByName('CODIGO').AsString := Codigo+'00000000000000';
                IBQuery1.Open;
                CDSdataDIA.Value := IBQTemp.FieldByName('DIA').AsInteger;
                CDSdataCODIGO.Value := Codigo;
                CDSdataNOMBRE.Value := IBQuery1.FieldByName('NOMBRE').AsString;
                CDSdataDEBITO.Value := IBQTemp.FieldByName('DEBITO').AsCurrency;
                CDSdataCREDITO.Value := IBQTemp.FieldByName('CREDITO').AsCurrency;
                CDSdata.Post;
            end;
            IBQTemp.Next;
        end;


        with IBQTemp1 do begin
          Close;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
          Open;
        end;

        while not IBQTemp1.Eof do
        begin
            CDSdata1.Filtered := False;        
            CDSdata1.Filter := 'CODIGO = ' + QuotedStr(LeftStr(IBQTemp1.FieldByName('CODIGO').AsString,4));
            CDSdata1.Filtered := True;
            if (CDSdata1.RecordCount > 0) then
            begin
                CDSdata1.Edit;
                CDSdata1DEBITO.Value := CDSdata1DEBITO.Value + IBQTemp1.FieldByName('DEBITO').AsCurrency;
                CDSdata1CREDITO.Value := CDSdata1CREDITO.Value + IBQTemp1.FieldByName('CREDITO').AsCurrency;
                CDSdata1.Post;
            end
            else
            begin
                CDSdata1.Insert;
                Codigo := LeftStr(IBQTemp1.FieldByName('CODIGO').AsString,4);
                IBQuery1.Close;
                IBQuery1.ParamByName('CODIGO').AsString := Codigo+'00000000000000';
                IBQuery1.Open;
                CDSdata1CODIGO.Value := Codigo;
                CDSdata1NOMBRE.Value := IBQuery1.FieldByName('NOMBRE').AsString;
                CDSdata1DEBITO.Value := IBQTemp1.FieldByName('DEBITO').AsCurrency;
                CDSdata1CREDITO.Value := IBQTemp1.FieldByName('CREDITO').AsCurrency;
                CDSdata1.Post;
            end;
            IBQTemp1.Next;
        end;

       {
        Reporte.Variables.ByName['MES'].AsString := CBMeses.Text;
        Reporte.Variables.ByName['ANOCORTE'].AsString := EdAno.Text;
        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);
        }
        CDSdata.Filtered := False;
        CDSdata1.Filtered := False;
        CDSdata.First;
        CDSdata1.First;



        frReport1.LoadFromFile('ReportesCon\frLibroCajaDiario.frf');
        frReport1.Dictionary.Variables['MES'] := QuotedStr(CBMeses.Text);
        frReport1.Dictionary.Variables['ANHOCORTE'] := EdAno.Text;
        if frReport1.PrepareReport then
          frReport1.ShowPreparedReport;

end;

procedure TfrmLibroRCajaDiario.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLibroRCajaDiario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        entertabs(Key,Self);
end;

procedure TfrmLibroRCajaDiario.FormCreate(Sender: TObject);
begin
      dmGeneral := TdmGeneral.Create(self);
      dmGeneral.getConnected;

      IBQTemp.Database := dmGeneral.IBDatabase1;
      IBQTemp1.Database := dmGeneral.IBDatabase1;
      IBQuery1.Database := dmGeneral.IBDatabase1;

      IBQTemp.Transaction := dmGeneral.IBTransaction1;
      IBQTemp1.Transaction := dmGeneral.IBTransaction1;
      IBQuery1.Transaction := dmGeneral.IBTransaction1;

      with IBQTemp do begin
        if Transaction.InTransaction then
           Transaction.Rollback;
        Transaction.StartTransaction;
      end;
      
end;

end.
