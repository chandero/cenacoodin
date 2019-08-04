unit UnitSaldosCuentasconTarjetaDebito;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, IBDatabase, DB, IBCustomDataSet,
  IBQuery, FR_DSet, FR_DBSet, FR_Class, pr_Common, pr_TxClasses;

type
  TfrmSaldosCuentasconTarjetaDebito = class(TForm)
    rgTipo: TRadioGroup;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Reporte: TprTxReport;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaldosCuentasconTarjetaDebito: TfrmSaldosCuentasconTarjetaDebito;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmSaldosCuentasconTarjetaDebito.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSaldosCuentasconTarjetaDebito.Inicializar;
begin
end;

procedure TfrmSaldosCuentasconTarjetaDebito.btnProcesarClick(
  Sender: TObject);
  var
    Ano:Integer;
    Fecha1,Fecha2:TDate;
begin

        Ano := YearOf(fFechaActual);
        Fecha1 := EncodeDate(YearOf(fFechaActual),01,01);
        Fecha2 := fFechaActual;

        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from SALDOS_CUENTAS_TARJETA(:FILTRO,:ANO,:FECHA1,:FECHA2)');
          ParamByName('FILTRO').AsInteger := rgTipo.ItemIndex;
          ParamByName('ANO').AsInteger := Ano;
          ParamByName('FECHA1').AsDate := Fecha1;
          ParamByName('FECHA2').AsDate := Fecha2;
          try
           Open;
           if RecordCount > 0 then
            with Reporte do begin
              Variables.ByName['EMPRESA'].AsString := Empresa;
              Variables.ByName['NIT'].AsString := Nit;
              Variables.ByName['FECHA'].AsDateTime := fFechaActual;
              if PrepareReport then
                PreviewPreparedReport(True);
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

end.
