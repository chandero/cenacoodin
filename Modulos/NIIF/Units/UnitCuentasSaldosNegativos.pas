unit UnitCuentasSaldosNegativos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, pr_Common,
  pr_TxClasses, IBDatabase, DB, IBCustomDataSet, IBQuery, DateUtils;

type
  TfrmCuentasSaldosNegativos = class(TForm)
    Label24: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Label3: TLabel;
    EdFecha: TDateTimePicker;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    Label1: TLabel;
    Reporte: TprTxReport;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCuentasSaldosNegativos: TfrmCuentasSaldosNegativos;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmCuentasSaldosNegativos.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCuentasSaldosNegativos.btnProcesarClick(Sender: TObject);
  var
    Ano:Integer;
    Fecha1,Fecha2:TDate;
begin
        btnProcesar.Enabled := False;

        Label1.Caption := 'Este proceso puede tardar varios minutos...';
        Application.ProcessMessages;

        Ano := YearOf(EdFecha.Date);
        Fecha1 := EncodeDate(YearOf(EdFecha.Date),01,01);
        Fecha2 := EdFecha.Date;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from SALDOS_CUENTAS_FILTRO(:FILTRO,:TIPO,:ANO,:FECHA1,:FECHA2)');
          ParamByName('FILTRO').AsInteger := 2;
          ParamByName('TIPO').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('ANO').AsInteger := Ano;
          ParamByName('FECHA1').AsDate := Fecha1;
          ParamByName('FECHA2').AsDate := Fecha2;
          try
           Open;
           Application.ProcessMessages;
           Label1.Caption := 'Proceso culminado';
           if RecordCount > 0 then
           begin
            with Reporte do begin
              Variables.ByName['EMPRESA'].AsString := Empresa;
              Variables.ByName['NIT'].AsString := Nit;
              Variables.ByName['FECHA'].AsDateTime := fFechaActual;
              Variables.ByName['FECHACORTE'].AsDateTime := EdFecha.Date;
              if PrepareReport then
                PreviewPreparedReport(True);
            end
           end
           else
             ShowMessage('No hay información');
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;
        end;
       IBQuery1.Transaction.Commit;        
end;

procedure TfrmCuentasSaldosNegativos.FormCreate(Sender: TObject);
begin
        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
        end;
        IBQuery2.Open;
        IBQuery2.Last;
        EdFecha.Date := fFechaActual;
end;

end.
