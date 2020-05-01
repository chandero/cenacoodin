unit UnitAjusteTasa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, JvFloatEdit, ExtCtrls, ComCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase, UnitDmGeneral, DBClient, Grids,
  DBGrids, DataSetToExcel;

type
  TfrmAjusteTasa = class(TForm)
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    IBTproceso: TIBTransaction;
    IBQcolocacion: TIBQuery;
    IBQajustar: TIBQuery;
    IBQtipocuota: TIBQuery;
    IBQrespaldo: TIBQuery;
    CDSajustados: TClientDataSet;
    CDSajustadosID_COLOCACION: TStringField;
    CDSajustadosCUOTA_ORIGINAL: TCurrencyField;
    CDSajustadosCUOTA_GRACIA: TCurrencyField;
    CDSajustadosNOMBRE: TStringField;
    CDSajustadosFECHA_CAMBIO: TDateTimeField;
    DSajustados: TDataSource;
    Panel2: TPanel;
    DBGajustados: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    edTasa: TJvFloatEdit;
    edTipo: TRadioGroup;
    pgbar: TProgressBar;
    Label2: TLabel;
    edColocacion: TEdit;
    btnExcel: TBitBtn;
    SD1: TSaveDialog;
    CDSajustadosTASA_ORIGINAL: TFloatField;
    CDSajustadosTASA_GRACIA: TFloatField;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure edTasaExit(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjusteTasa: TfrmAjusteTasa;

implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol;

procedure TfrmAjusteTasa.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAjusteTasa.btnProcesarClick(Sender: TObject);
var
  _valor : Currency;
  _tasa : Double;
  _plazo: Integer;
  _amortiza: Integer;
  _cuota : Currency;
  _idtipoCuota: Integer;
  _tipoCuota: String;
  _linea : Integer;
  _hoy : TDate;
begin
     if (MessageDlg('Seguro de realizar el Proceso?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
     begin

        IBTproceso.StartTransaction;
        IBQcolocacion.Close;
        IBQcolocacion.Open;
        IBQcolocacion.Last;
        IBQcolocacion.First;

        btnProcesar.Enabled := False;
        edTasa.Enabled := False;
        CDSajustados.Open;
        CDSajustados.EmptyDataSet;

        pgbar.Min := 0;
        pgbar.Max := IBQcolocacion.RecordCount;

        _hoy := fFechaHoraActual;

        while not IBQcolocacion.Eof do
        begin
             pgbar.Position := IBQcolocacion.RecNo;
             edColocacion.Text := IBQcolocacion.FieldByName('ID_COLOCACION').AsString;
             Application.ProcessMessages;
             CDSajustados.Insert;
             IBQrespaldo.Close;
             IBQrespaldo.ParamByName('ID_COLOCACION').AsString := IBQcolocacion.FieldByName('ID_COLOCACION').AsString;
             CDSajustadosID_COLOCACION.Value := IBQcolocacion.FieldByName('ID_COLOCACION').AsString;
             CDSajustadosNOMBRE.Value := IBQcolocacion.FieldByName('NOMBRE').AsString;
             IBQrespaldo.ParamByName('CUOTA_ORIGINAL').AsCurrency := IBQcolocacion.FieldByName('VALOR_CUOTA').AsCurrency;
             CDSajustadosCUOTA_ORIGINAL.Value := IBQcolocacion.FieldByName('VALOR_CUOTA').AsCurrency;
             IBQrespaldo.ParamByName('TASA_ORIGINAL').AsFloat := IBQcolocacion.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
             CDSajustadosTASA_ORIGINAL.Value := IBQcolocacion.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
             IBQrespaldo.ParamByName('FECHA_CAMBIO').AsDateTime := _hoy;
             CDSajustadosFECHA_CAMBIO.Value := _hoy;
             _valor := IBQcolocacion.FieldByName('VALOR_DESEMBOLSO').AsCurrency - IBQcolocacion.FieldByName('ABONOS_CAPITAL').AsCurrency;
             _tasa := IBQcolocacion.FieldByName('TASA_INTERES_CORRIENTE').AsFloat;
             _linea := IBQcolocacion.FieldByName('ID_LINEA').AsInteger;
             case edTipo.ItemIndex of
               0: _tasa := _tasa - edTasa.Value;
               1: _tasa := _tasa + edTasa.Value;
             end;
             _plazo := IBQcolocacion.FieldByName('PLAZO_COLOCACION').AsInteger;
             _amortiza := IBQcolocacion.FieldByName('AMORTIZA_INTERES').AsInteger;
             _idtipoCuota := IBQcolocacion.FieldByName('ID_TIPO_CUOTA').AsInteger;
             IBQtipocuota.Close;
             IBQtipocuota.ParamByName('ID_TIPOS_CUOTA').AsInteger := _idtipoCuota;
             IBQtipocuota.Open;
             _tipoCuota := IBQtipocuota.FieldByName('TIPO_CUOTA').AsString;

             if _tipoCuota = 'F' then
             begin
             //vivienda******************************
               if _linea = 7 then
               begin
                 _cuota := CuotaVivienda(_valor,_plazo,_tasa,_amortiza);
               end
               else
                 _cuota := CuotaFija(_valor,_plazo,_tasa,_amortiza);
               end
             else
             begin
              _cuota := CuotaVariable(_valor,_plazo,_tasa,_amortiza);
             end;

             IBQrespaldo.ParamByName('CUOTA_GRACIA').AsCurrency := _cuota;
             CDSajustadosCUOTA_GRACIA.Value := _cuota;
             IBQrespaldo.ParamByName('TASA_GRACIA').AsFloat := _tasa;
             CDSajustadosTASA_GRACIA.Value := _tasa;
             IBQrespaldo.ExecSQL;
             CDSajustados.Post;

             IBQajustar.Close;
             IBQajustar.ParamByName('TASA_INTERES_CORRIENTE').AsFloat := _tasa;
             IBQajustar.ParamByName('VALOR_CUOTA').AsCurrency := _cuota;
             IBQajustar.ParamByName('ID_COLOCACION').AsString := IBQcolocacion.FieldByName('ID_COLOCACION').AsString;
             IBQajustar.ExecSQL;
             IBQajustar.Close;

             IBQcolocacion.Next;
        end;
        IBTproceso.Commit;
        btnExcel.Enabled := True;
     end;   
     ShowMessage('Proceso Finalizado Con Exito');

end;

procedure TfrmAjusteTasa.edTasaExit(Sender: TObject);
begin
        if edTasa.Value <> 0 then
          btnProcesar.Enabled := True
        else
          btnProcesar.Enabled := False;
end;

procedure TfrmAjusteTasa.btnExcelClick(Sender: TObject);
var
  ExcelFile:TDataSetToExcel;
begin
        CDSajustados.Last;
        CDSajustados.First;
        SD1.Filter := 'Archivos Excel (*.xls)|*.XLS';
        if SD1.Execute then
        begin
          ExcelFile := TDataSetToExcel.Create(CDSajustados,SD1.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

end.
