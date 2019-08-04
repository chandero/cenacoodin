unit UnitReporteVotantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, FR_IBXDB, FR_DSet, FR_DBSet, FR_Class, FR_Intrp, pr_Common,
  pr_Classes, DBClient;

type
  TfrmReporte = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdFechaIni: TDateTimePicker;
    EdFechaFin: TDateTimePicker;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    Filtro: TCheckBox;
    EdJurado: TEdit;
    lusuario: TLabel;
    IBQuery2: TIBQuery;
    CDCuentas: TClientDataSet;
    CDCuentasNUMERO_CUENTA: TIntegerField;
    CdInforme: TClientDataSet;
    CdInformeID_IDENTIFICACION: TIntegerField;
    CdInformeID_PERSONA: TIntegerField;
    prReport1: TprReport;
    IBQuery1ID_IDENTIFICACION: TIntegerField;
    IBQuery1ID_PERSONA: TIBStringField;
    IBQuery1ASOCIADO: TIBStringField;
    IBQuery1VALIDACION: TIBStringField;
    IBQuery1NUMERO_CUENTA: TIntegerField;
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdJuradoExit(Sender: TObject);
    procedure FiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReporte: TfrmReporte;
  Usuario:string;
  Jurado:string;
implementation

{$R *.dfm}

uses unitdmGeneral, UnitGlobales;

procedure TfrmReporte.CmdAceptarClick(Sender: TObject);
var FechaIni,FechaFin:Variant;
begin
        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from ELECCION2');
          if Filtro.Checked then begin
            SQL.Add('where VALIDACION = :VALIDACION');
            ParamByName('VALIDACION').AsString := Usuario;
          end;
          Open;
          try
           Open;
           prReport1.Variables.ByName['FechaIni'].AsDateTime := EdFechaIni.Date;
           prReport1.Variables.ByName['FechaFin'].AsDateTime := EdFechaFin.Date;
           prReport1.Variables.ByName['Jurado'].AsString := Jurado;
           if prReport1.PrepareReport then
              prReport1.PreviewPreparedReport(True);
          except
           MessageDlg('Error al Buscar votantes',mtError,[mbcancel],0);
           Exit;
          end;
        end;
end;

procedure TfrmReporte.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporte.FormShow(Sender: TObject);
begin
        EdFechaIni.Date := Date;
        EdFechaFin.Date := Date;
end;

procedure TfrmReporte.EdJuradoExit(Sender: TObject);
begin
        Usuario := EdJurado.Text;
        with IBQuery2 do
         begin
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado" where ID_EMPLEADO = :Usuario');
          ParamByName('USUARIO').AsString := Usuario;
          Open;
          Jurado := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
         end;
end;

procedure TfrmReporte.FiltroClick(Sender: TObject);
begin
        if Filtro.Checked then
         begin
           lusuario.Visible := True;
           EdJurado.Visible := True;
         end
        else
         begin
           lusuario.Visible := False;
           EdJurado.Visible := False;
         end;
end;

end.
