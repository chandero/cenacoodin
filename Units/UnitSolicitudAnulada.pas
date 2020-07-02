unit UnitSolicitudAnulada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, FR_Class, FR_DSet, FR_DBSet;

type
  TFrmSolicitudAnulada = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DTfecha1: TDateTimePicker;
    DTfecha2: TDateTimePicker;
    Label3: TLabel;
    ChTotal: TCheckBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBSolicitudAnulada: TIBQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frCompositeReport1: TfrCompositeReport;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ChTotalClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
  public
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  FrmSolicitudAnulada: TFrmSolicitudAnulada;

implementation
uses UnitGlobales, UnitImpresion, unitMain;

{$R *.dfm}

procedure TFrmSolicitudAnulada.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmSolicitudAnulada.FormCreate(Sender: TObject);
begin
        DTfecha1.Date := fFechaActual;
        DTfecha2.Date := fFechaActual;
end;

procedure TFrmSolicitudAnulada.BitBtn1Click(Sender: TObject);
begin
        with IBSolicitudAnulada do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          ParamByName('FECHA1').AsDate := DTfecha1.Date;
          ParamByName('FECHA2').AsDate := DTfecha2.Date;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('Registro no Encontrados',mtInformation,[mbok],0);
            Exit;
          end;
          imprimir_reporte(frmMain.ruta1 + '\Reporte\RepSolicitudAnuladas.frf');
        end;
end;

procedure TFrmSolicitudAnulada.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmSolicitudAnulada.ChTotalClick(Sender: TObject);
begin
        if ChTotal.Checked then
        begin
          DTfecha1.Date := StrToDate('2005/01/01');
          DTfecha2.DateTime := fFechaActual;
        end
        else
        begin
          DTfecha1.Date := fFechaActual;
          DTfecha2.DateTime := fFechaActual;
        end;
end;

procedure TFrmSolicitudAnulada.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'fecha1' then
           ParValue := DTfecha1.Date;
        if ParName = 'fecha2' then
           ParValue := DTfecha2.Date;
end;

end.
