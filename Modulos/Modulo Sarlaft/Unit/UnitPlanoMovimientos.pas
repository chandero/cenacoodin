unit UnitPlanoMovimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IBSQLMonitor, DB, IBCustomDataSet, IBQuery,
  Buttons;

type
  TfrmPlanoMovimientos = class(TForm)
    IBQuery1: TIBQuery;
    Panel1: TPanel;
    Label1: TLabel;
    edAnho: TComboBox;
    edPeriodo: TComboBox;
    Label2: TLabel;
    btnExportar: TBitBtn;
    SD1: TSaveDialog;
    btnCerrar: TBitBtn;
    Label3: TLabel;
    edEstado: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanoMovimientos: TfrmPlanoMovimientos;

implementation

{$R *.dfm}

uses UnitGlobal, UnitdmGeneral, DateUtils, DataSetToExcel;

procedure TfrmPlanoMovimientos.FormCreate(Sender: TObject);
begin
        // Asignar años
        edAnho.Items := lista_anhos;
        
end;

procedure TfrmPlanoMovimientos.btnExportarClick(Sender: TObject);
var
  _fecha_inicial, _fecha_final, _fecha_corte: TDate;
  _anho, _periodo, _ultimo_dia, _dia_corte: Integer;
  _toExcel :TDataSetToExcel;
  _filename: String;
  Query: TStrings;
begin
 if (SD1.Execute) then
 begin
   btnExportar.Enabled := False;
   btnCerrar.Enabled := False;
   edAnho.Enabled := False;
   edPeriodo.Enabled := False;
   edEstado.Text := 'Procesando....';
   Application.ProcessMessages;
   dmGeneral.IBDatabase1.DataBaseName := base_server + ':' + base_path + lista_bases[edAnho.ItemIndex];
   dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
   dmGeneral.IBDatabase1.Params.Values['User_Name'] := base_user;
   dmGeneral.IBDatabase1.Params.Values['PassWord'] := base_pass;
   dmGeneral.IBDatabase1.Open;

   dmGeneral.IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
   dmGeneral.IBTransaction1.StartTransaction;

   IBQuery1.Database := dmGeneral.IBDatabase1;
   IBQuery1.Transaction := dmGeneral.IBTransaction1;
   IBQuery1.SQL.Text := 'SELECT * FROM SARLAFT_MOVIMIENTOS (:ANHO, :FECHA_INICIAL, :FECHA_FINAL, :FECHA_CORTE)';
   //***
   _anho := StrToInt(edAnho.Text);
   _periodo := edPeriodo.ItemIndex;
   _ultimo_dia := DaysInAMonth(_anho, _periodo);
   if (_ultimo_dia > 30) then _dia_corte := 30
   else _dia_corte := _ultimo_dia;
   _fecha_inicial := EncodeDate(_anho, _periodo, 1);
   _fecha_final := EncodeDate(_anho, _periodo, _ultimo_dia);
   _fecha_corte := EncodeDate(_anho, _periodo, _dia_corte);

   IBQuery1.Close;
   IBQuery1.ParamByName('ANHO').AsInteger := StrToInt(edAnho.Text);
   IBQuery1.ParamByName('FECHA_INICIAL').AsDate := _fecha_inicial;
   IBQuery1.ParamByName('FECHA_FINAL').AsDate := _fecha_final;
   IBQuery1.ParamByName('FECHA_CORTE').AsDate := _fecha_corte;
   IBQuery1.Open;
   IBQuery1.First;

    _filename := SD1.FileName;
    _toExcel := TDataSetToExcel.Create(IBQuery1, _filename);
    _toExcel.WriteFile;
    IBQuery1.Close;
    edEstado.Text := 'Proceso Finalizado....';
    btnCerrar.Enabled := True;
 end;
end;

procedure TfrmPlanoMovimientos.btnCerrarClick(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
        begin
           dmGeneral.IBTransaction1.Commit;
           dmGeneral.IBDatabase1.Close;
        end;
        Close;
end;

end.
