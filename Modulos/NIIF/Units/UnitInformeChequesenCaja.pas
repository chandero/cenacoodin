unit UnitInformeChequesenCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, StdCtrls,
  Buttons, JvEdit, JvTypedEdit, ComCtrls, ExtCtrls;

type
  TfrmInformeChequesenCaja = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Caja: TLabel;
    EdFechaFin: TDateTimePicker;
    EdCaja: TJvIntegerEdit;
    Panel2: TPanel;
    CmdGenera: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery: TIBQuery;
    RGFiltro: TRadioGroup;
    IBQueryID_CAJA: TSmallintField;
    IBQueryDESCRIPCION: TIBStringField;
    IBQueryNUMERO_CHEQUE: TIntegerField;
    IBQueryFECHA: TDateField;
    IBQueryPLAZA: TIBStringField;
    IBQueryVALOR: TIBBCDField;
    IBQueryID_AGENCIA: TSmallintField;
    IBQueryNUMERO_CUENTA: TIntegerField;
    IBQueryID_TIPO_CUENTA: TSmallintField;
    IBQueryDIGITO_CUENTA: TIntegerField;
    IBQueryPRIMER_APELLIDO: TIBStringField;
    IBQuerySEGUNDO_APELLIDO: TIBStringField;
    IBQueryNOMBRE: TIBStringField;
    Label2: TLabel;
    EdFechaIni: TDateTimePicker;
    Report: TprTxReport;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdGeneraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeChequesenCaja: TfrmInformeChequesenCaja;
  sql:TStrings;

implementation

uses UnitGlobales,UnitVistaPreliminar;

{$R *.dfm}

procedure TfrmInformeChequesenCaja.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeChequesenCaja.CmdGeneraClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
       with IBQuery.SQL do begin
         Clear;
         AddStrings(sql);
         Add(' WHERE "caj$cheques".ID_CAJA = :ID_CAJA and');
         Add('FECHA BETWEEN :FECHA1 and :FECHA2');
       end;

       IBQuery.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
       IBQuery.ParamByName('FECHA1').AsDate := EdFechaIni.Date;
       IBQuery.ParamByName('FECHA2').AsDate := EdFechaFin.Date;

       Report.Variables.ByName['Filtro'].AsString := 'Todos los Cheques';
       Report.Variables.ByName['Empresa'].AsString := Empresa;
       Report.Variables.ByName['Agencia'].AsString := Ciudad;
       Report.Variables.ByName['Fecha1'].AsDateTime := EdFechaIni.Date;
       Report.Variables.ByName['Fecha2'].AsDateTime := EdFechaFin.Date;
       case RGFiltro.ItemIndex of
       1 : begin
            IBQuery.SQL.Add(' and ENVIADO = 0');
            Report.Variables.ByName['Filtro'].AsString := 'Cheques Por Enviar';
           end;
       2 : begin
            IBQuery.SQL.Add(' and ENVIADO <> 0');
            Report.Variables.ByName['Filtro'].AsString := 'Cheques Enviados';
           end;
       end;

       with IBQuery do
       begin
         try
          Open;
          if RecordCount > 0 then
          begin
            if Report.PrepareReport then
             begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Report;
              frmVistaPreliminar.ShowModal;
             end;

//              Report.PreviewPreparedReport(True);
          end
          else
            MessageDlg('No se Encontraron Datos',mtInformation,[mbok],0);
         except
            MessageDlg('Error al Buscar Datos',mtError,[mbcancel],0);
         end;
       end;
end;

procedure TfrmInformeChequesenCaja.FormShow(Sender: TObject);
begin
        EdFechaIni.Date := Date;
        EdFechaFin.Date := Date;
        sql := TStringList.Create;
        sql.AddStrings(IBQuery.SQL);
end;

procedure TfrmInformeChequesenCaja.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
