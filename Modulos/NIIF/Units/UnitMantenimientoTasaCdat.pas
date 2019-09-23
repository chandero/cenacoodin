unit UnitMantenimientoTasaCdat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBTable, Grids, DBGrids, Math, IBQuery, DBCtrls;

type
  TfrmMantenimientoTasaCdat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdCerrar: TBitBtn;
    CmdActualizar: TBitBtn;
    IBDtf: TIBSQL;
    IBOrdinaria: TIBSQL;
    IBConsultar: TIBSQL;
    DSDtf: TDataSource;
    DSFijas: TDataSource;
    DsetFija: TIBQuery;
    DsetDtf: TIBQuery;
    DsetFijaID_TASA: TIntegerField;
    DsetFijaID_CLASIFICACION: TIntegerField;
    DsetFijaID_EDAD: TIBStringField;
    DsetFijaFECHA_INICIAL: TDateField;
    DsetFijaFECHA_FINAL: TDateField;
    DsetFijaVALOR_TASA_EFECTIVA: TFloatField;
    ControlTipoTasa: TPageControl;
    InfoFijas: TTabSheet;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GridFijas: TDBGrid;
    EdFechaInicialFija: TDateTimePicker;
    EdFechaFinalFija: TDateTimePicker;
    EdTasaFija: TEdit;
    CBclasificacion: TDBLookupComboBox;
    CBEdad: TComboBox;
    procedure EdFechaInicialDtfEnter(Sender: TObject);
    procedure EdFechaInicialDtfExit(Sender: TObject);
    procedure EdFechaFinalDtfEnter(Sender: TObject);
    procedure EdFechaFinalDtfExit(Sender: TObject);
    procedure EdTasaDtfEnter(Sender: TObject);
    procedure EdTasaDtfExit(Sender: TObject);
    procedure EdTasaDtfKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdTasaFijaExit(Sender: TObject);
    procedure EdTasaFijaEnter(Sender: TObject);
    procedure EdTasaFijaKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaInicialFijaEnter(Sender: TObject);
    procedure EdFechaInicialFijaExit(Sender: TObject);
    procedure EdFechaFinalFijaEnter(Sender: TObject);
    procedure EdFechaFinalFijaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBclasificacionExit(Sender: TObject);
  private
    { Private declarations }
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmMantenimientoTasaCdat: TfrmMantenimientoTasaCdat;
  FechaInicialDtf,FechaFinalDtf:TDate;
  FechaInicialFija,FechaFinalFija:TDate;
  TasaDtf, TasaFija:Extended;
  EsDtf,EsOrdinaria,EsUvr:Boolean;
implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalescol,UnitDmColocacion;

procedure TfrmMantenimientoTasaCdat.Inicializar;
begin
        EsDtf := False;
        EsOrdinaria := False;
        EsUvr := False;
        ControlTipoTasa.ActivePage := InfoTasaDtf;
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;
        DSetDtf.Open;
        DsetFija.Open;
        EdFechaInicialDtf.Date := fFechaActual;
        EdFechaFinalDtf.Date := fFechaActual;
        EdFechaInicialFija.Date := fFechaActual;
        EdFechaFinalFija.Date := fFechaActual;

       CBclasificacion.KeyValue := -1;
       dmColocacion.IBDSclasificacion.Active := true;
       dmColocacion.IBDSclasificacion.Last;
       dmColocacion.IBDSclasificacion.First;
       CBEdad.Text := 'A';

       EdTasaFija.Text := '';
       EdTasaDtf.Text := '';
       
end;

procedure TfrmMantenimientoTasaCdat.EdFechaInicialDtfEnter(Sender: TObject);
begin
        EdFechaInicialDtf.Date := fFechaActual;
end;

procedure TfrmMantenimientoTasaCdat.EdFechaInicialDtfExit(Sender: TObject);
begin
        FechaInicialDtf := EdFechaInicialDtf.Date;
end;

procedure TfrmMantenimientoTasaCdat.EdFechaFinalDtfEnter(Sender: TObject);
begin
        EdFechaFinalDtf.Date := fFechaActual;
end;

procedure TfrmMantenimientoTasaCdat.EdFechaFinalDtfExit(Sender: TObject);
begin
        FechaFinalDtf := EdFechaFinalDtf.Date;
end;

procedure TfrmMantenimientoTasaCdat.EdTasaDtfEnter(Sender: TObject);
begin
        EdTasaDtf.SelectAll;
end;

procedure TfrmMantenimientoTasaCdat.EdTasaDtfExit(Sender: TObject);
begin
        TasaDtf := StrToFloat(EdTasaDtf.Text);
        EdTasaDtf.Text := FormatCurr('#0.00%',TasaDtf);
        EsDtf := True;
end;

procedure TfrmMantenimientoTasaCdat.EdTasaDtfKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmMantenimientoTasaCdat.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmMantenimientoTasaCdat.CmdActualizarClick(Sender: TObject);
var Id:Integer;
begin
        if EsUvr then
         begin
          with IBConsultar do begin
           Close;
           SQL.Clear;
           SQL.Add('select ID_TASA_DTF from "col$tasauvr" order by ID_TASA_DTF DESC');
           ExecQuery;
           Id := FieldByName('ID_TASA_DTF').AsInteger;
           Close;
          end;
          with IBDtf do begin
           Close;
           SQL.Clear;
           SQL.Add('insert into "col$tasauvr" values (:ID_TASA_DTF,:FECHA_INICIAL,:FECHA_FINAL, :VALOR_TASA_EFECTIVA)');
           ParamByName('ID_TASA_DTF').AsInteger := Id + 1;
           ParamByName('FECHA_INICIAL').AsDate := FechaInicialFija;
           ParamByName('FECHA_FINAL').AsDate := FechaFinalFija;
           TasaFija := SimpleRoundTo(TasaFija,-2);
           ParamByName('VALOR_TASA_EFECTIVA').AsDouble := TasaFija;
           TRY
            ExecQuery;
            MessageDlg('Actualización Tasa Máxima Exitosa',mtInformation,[mbOK],0);
           except
            MessageDlg('Error Actualizando Tasa Máxima',mtError,[mbOK],0);
           end;
           Close;
          end;
        end;

        if EsDtf then
         begin
          with IBConsultar do begin
           Close;
           SQL.Clear;
           SQL.Add('select ID_TASA_DTF from "col$tasadtf" order by ID_TASA_DTF DESC');
           ExecQuery;
           Id := FieldByName('ID_TASA_DTF').AsInteger;
           Close;
          end;
          with IBDtf do begin
           Close;
           SQL.Clear;
           SQL.Add('insert into "col$tasadtf" values (:ID_TASA_DTF,:FECHA_INICIAL,:FECHA_FINAL, :VALOR_TASA_EFECTIVA)');
           ParamByName('ID_TASA_DTF').AsInteger := Id + 1;
           ParamByName('FECHA_INICIAL').AsDate := FechaInicialDtf;
           ParamByName('FECHA_FINAL').AsDate := FechaFinalDtf;
           TasaDtf := SimpleRoundTo(TasaDtf,-2);
           ParamByName('VALOR_TASA_EFECTIVA').AsDouble := TasaDtf;
           TRY
            ExecQuery;
            MessageDlg('Actualización DTF Exitosa',mtInformation,[mbOK],0);
           except
            MessageDlg('Error Actualizando DTF',mtError,[mbOK],0);
           end;
           Close;

           SQL.Clear;
           SQL.Add('update "col$tasasvariables" set VALOR_ACTUAL_TASA = :TASA where ID_INTERES = 1');
           ParamByName('TASA').AsDouble := TasaDtf;
           ExecQuery;
           Close;

           SQL.Clear;
           SQL.Add('update "col$tasavariables" set VALOR_ACTUAL_TASA = :TASA where ID_INTERES = 1');
           ParamByName('TASA').AsDouble := TasaDtf;
           ExecQuery;
           Close;
          end;
          IBDtf.Transaction.Commit;
         end;

        if EsOrdinaria then
         begin
          with IBConsultar do begin
           Close;
           SQL.Clear;
           SQL.Add('select ID_TASA from "col$tasaclasificacion" order by ID_TASA DESC');
           ExecQuery;
           Id := FieldByName('ID_TASA').AsInteger;
           Close;
          end;
          with IBDtf do begin
           Close;
           SQL.Clear;
           SQL.Add('insert into "col$tasaclasificacion" values (:ID_TASA,:ID_CLASIFICACION,:ID_EDAD,:FECHA_INICIAL,:FECHA_FINAL, :VALOR_TASA_EFECTIVA)');
           ParamByName('ID_TASA').AsInteger := Id + 1;
           ParamByName('ID_CLASIFICACION').AsInteger := CBclasificacion.KeyValue;
           ParamByName('ID_EDAD').AsString := Trim(CBEdad.Text);
           ParamByName('FECHA_INICIAL').AsDate := FechaInicialFija;
           ParamByName('FECHA_FINAL').AsDate := FechaFinalFija;
           TasaFija := SimpleRoundTo(TasaFija,-2);
           ParamByName('VALOR_TASA_EFECTIVA').AsDouble := TasaFija;
           TRY
            ExecQuery;
            MessageDlg('Actualización Tasa Máxima Exitosa',mtInformation,[mbOK],0);
           except
            MessageDlg('Error Actualizando Tasa Máxima',mtError,[mbOK],0);
           end;
           Close;
          end;
          IBDtf.Transaction.Commit;
         end;
         inicializar;
end;

procedure TfrmMantenimientoTasaCdat.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmMantenimientoTasaCdat.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMantenimientoTasaCdat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

procedure TfrmMantenimientoTasaCdat.EdTasaFijaExit(Sender: TObject);
begin
        TasaFija := StrToFloat(EdTasaFija.Text);
        EdTasaFija.Text := FormatCurr('#0.00%',TasaFija);
        EsOrdinaria := True;
end;

procedure TfrmMantenimientoTasaCdat.EdTasaFijaEnter(Sender: TObject);
begin
        EdTasaFija.SelectAll;
end;

procedure TfrmMantenimientoTasaCdat.EdTasaFijaKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmMantenimientoTasaCdat.EdFechaInicialFijaEnter(Sender: TObject);
begin
        EdFechaInicialFija.Date := fFechaActual;
end;

procedure TfrmMantenimientoTasaCdat.EdFechaInicialFijaExit(Sender: TObject);
begin
        FechaInicialFija := EdFechaInicialFija.Date;
end;

procedure TfrmMantenimientoTasaCdat.EdFechaFinalFijaEnter(Sender: TObject);
begin
        EdFechaFinalFija.Date := fFechaActual;
end;

procedure TfrmMantenimientoTasaCdat.EdFechaFinalFijaExit(Sender: TObject);
begin
        FechaFinalFija := EdFechaFinalFija.Date;
end;

procedure TfrmMantenimientoTasaCdat.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmMantenimientoTasaCdat.CBclasificacionExit(Sender: TObject);
begin
        if CBclasificacion.KeyValue = 3 then begin
          EsUvr := True;
          EsDtf := False;
        end;
end;

end.
