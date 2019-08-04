unit UnitDeJuvenilaAsociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, DBClient, DateUtils,
  IBCustomDataSet, IBQuery, DataSetToExcel;

type
  TfrmDeJuvenilaAsociado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edFechaCorte: TDateTimePicker;
    btConsulta: TBitBtn;
    BtExcel: TBitBtn;
    BtSalir: TBitBtn;
    CDSdata: TClientDataSet;
    CDSdataANHO: TIntegerField;
    CDSdataMES: TIntegerField;
    CDSdataDOCUMENTO: TStringField;
    IBQproceso: TIBQuery;
    pb1: TProgressBar;
    CDSdataNOMBRE: TStringField;
    CDSdataPRIMER_APELLIDO: TStringField;
    CDSdataSEGUNDO_APELLIDO: TStringField;
    Save: TSaveDialog;
    CDSdataTOTALMES: TAggregateField;
    CDSresumen: TClientDataSet;
    CDSresumenANHO: TIntegerField;
    CDSresumenMES: TIntegerField;
    CDSresumenTOTAL: TIntegerField;
    procedure BtSalirClick(Sender: TObject);
    procedure btConsultaClick(Sender: TObject);
    procedure BtExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeJuvenilaAsociado: TfrmDeJuvenilaAsociado;

implementation

{$R *.dfm}

uses unitDmGeneral, unitGlobales, unitGlobalesCol;

procedure TfrmDeJuvenilaAsociado.BtSalirClick(Sender: TObject);
begin
   dmGeneral.IBTransaction1.Commit;
   Close;
end;

procedure TfrmDeJuvenilaAsociado.btConsultaClick(Sender: TObject);
var
  _vDias, _vEdad, _vDiff: Integer;
  _vFechaNacimiento, _vFechaActual, _vFechaHappy: TDate;
  _vAno, _vMes, _vTotal: Integer;
begin

        CDSdata.Open;
        CDSdata.EmptyDataSet;

        _vFechaActual := fFechaActual;
        IBQproceso.Close;
        IBQproceso.Open;

        while not IBQproceso.Eof do
        begin
          _vFechaNacimiento := IBQproceso.FieldByName('FECHA_NACIMIENTO').AsDateTime;
          _vDias := DiasEntre(_vFechaNacimiento, _vFechaActual);
          _vEdad := _vDias div 365;
          if (_vEdad < 18) then
          begin
            _vDiff := (18 - _vEdad) * 365;
            if _vDiff > 0 then
            begin
              _vFechaHappy := CalculoFecha(_vFechaActual, _vDiff);
              if (_vFechaHappy <= edFechaCorte.Date) then
              begin
                CDSdata.Insert;
                CDSdataANHO.Value := YearOf(_vFechaHappy);
                CDSdataMES.Value := MonthOf(_vFechaHappy);
                CDSdataDOCUMENTO.Value := IBQproceso.FieldByName('ID_PERSONA').AsString;
                CDSdataNOMBRE.Value := IBQproceso.FieldByName('NOMBRE').AsString;
                CDSdataPRIMER_APELLIDO.Value := IBQproceso.FieldByName('PRIMER_APELLIDO').AsString;
                CDSdataSEGUNDO_APELLIDO.Value := IBQproceso.FieldByName('SEGUNDO_APELLIDO').AsString;
                CDSdata.Post;
              end;
            end;
          end;
          IBQproceso.Next;
        end;

        CDSdata.First;
        CDSresumen.Open;
        _vAno := 0;
        _vMes := 0;
        _vTotal := 0;
        while not CDSdata.Eof do
        begin
          if (_vAno <> CDSdataANHO.Value) or (_vMes <> CDSdataMES.Value) then
          begin
             _vAno := CDSdataANHO.Value;
             _vMes := CDSdataMES.Value;
             _vTotal := 0;
             CDSresumen.Insert;
             CDSresumenANHO.Value := _vAno;
             CDSresumenMES.Value := _vMes;
             CDSresumenTOTAL.Value := _vTotal;
             CDSresumen.Post;
          end;
          CDSresumen.Filter := 'ANHO = ' + CDSdataANHO.AsString + ' and MES = ' + CDSdataMES.AsString;
          CDSresumen.Filtered := True;
          CDSresumen.Edit;
          CDSresumenTOTAL.Value := CDSresumenTOTAL.Value + 1;
          CDSresumen.Post;
          CDSresumen.Filtered := False;
          CDSdata.Next;
        end;


        BtExcel.Enabled := True;
end;

procedure TfrmDeJuvenilaAsociado.BtExcelClick(Sender: TObject);
var   ExcelFile:TDataSetToExcel;
begin
        if Save.Execute then
        begin
          CDSresumen.First;
          ExcelFile := TDataSetToExcel.Create(CDSresumen,Save.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TfrmDeJuvenilaAsociado.FormCreate(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
end;

end.
