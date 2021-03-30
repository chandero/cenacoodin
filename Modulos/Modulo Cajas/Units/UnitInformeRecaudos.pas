unit UnitInformeRecaudos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvEdit, JvTypedEdit, ComCtrls, ExtCtrls,
  pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery, IBSQL, DateUtils,
  pr_Classes;

type
  TfrmInformeRecaudo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Caja: TLabel;
    EdFecha: TDateTimePicker;
    EdCaja: TJvIntegerEdit;
    Panel2: TPanel;
    CmdGenera: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBSQL1: TIBSQL;
    repRecaudo: TprTxReport;
    prRepRecaudo: TprReport;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdGeneraClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function ValidarCaja: Boolean;
  public
    { Public declarations }
  end;

var
  frmInformeRecaudo: TfrmInformeRecaudo;
  Generado: Boolean;
  Empleado: String;
  Codigo: String;

implementation

{$R *.dfm}

uses UnitdmGeneral, UnitGlobales;

procedure TfrmInformeRecaudo.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        EdFecha.Date := fFechaActual;
        Generado := False;
end;

procedure TfrmInformeRecaudo.FormCreate(Sender: TObject);
begin
        ValidarCaja;
end;

function TfrmInformeRecaudo.ValidarCaja: Boolean;
begin
         Result := False;
         if dmGeneral.IBTransaction1.InTransaction then
         begin
            dmGeneral.IBTransaction1.Commit;
         end;
         with IBSQL1 do
         begin
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('CAJ$CAJAS.ID_CAJA,');
           SQL.Add('CAJ$CAJAS.HORA_INICIO,');
           SQL.Add('CAJ$CAJAS.HORA_FINAL,');
           SQL.Add('CAJ$CAJAS.CODIGO,');
           SQL.Add('"caj$estados".PERMITE_MOVIMIENTO,');
           SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
           SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$empleado".NOMBRE');
           SQL.Add('FROM');
           SQL.Add('CAJ$CAJAS');
           SQL.Add('INNER JOIN "caj$estados" ON (CAJ$CAJAS.ID_ESTADO_CAJA = "caj$estados".ID_ESTADO)');
           SQL.Add('INNER JOIN "gen$empleado" ON (CAJ$CAJAS.ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('where CAJ$CAJAS.ID_EMPLEADO = :ID_EMPLEADO');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           try
            ExecQuery;
            if RecordCount > 0 then
            begin
               EdCaja.Value := FieldByName('ID_CAJA').AsInteger;
               Empleado := Trim(FieldByName('PRIMER_APELLIDO').AsString+' '+
                                FieldByName('SEGUNDO_APELLIDO').AsString+' '+
                                FieldByName('NOMBRE').AsString);
               Codigo := FieldByName('CODIGO').AsString;
            end
            else
            begin
              Result := False;
              Close;
              Exit;
            end;
           except
              Result := False;
              Exit;
           end;
         end;
         Result := True;

end;

procedure TfrmInformeRecaudo.CmdGeneraClick(Sender: TObject);
begin
        IBQuery1.Close;
        IBQuery1.ParamByName('ID_CAJA').AsInteger := EdCaja.Value;
        IBQuery1.ParamByName('FECHA_INI').AsDateTime := EncodeDateTime(YearOf(EdFecha.Date), MonthOf(EdFecha.Date), DayOfTheMonth(EdFecha.Date), 00,00,00,00);
        IBQuery1.ParamByName('FECHA_FIN').AsDateTime := EncodeDateTime(YearOf(EdFecha.Date), MonthOf(EdFecha.Date), DayOfTheMonth(EdFecha.Date), 23,59,59,999);
        IBQuery1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBQuery1.Open;
        IBQuery1.Last;
        IBQuery1.First;

        if (IBQuery1.RecordCount > 0 ) then
        begin
        {
         repRecaudo.Variables.ByName['EMPRESA'].AsString := Empresa;
         repRecaudo.Variables.ByName['DIA'].AsDateTime := EdFecha.Date;
         repRecaudo.Variables.ByName['EMPLEADO'].AsString := Empleado;
         repRecaudo.Variables.ByName['CAJA'].AsInteger := EdCaja.Value;
         if repRecaudo.PrepareReport then
           repRecaudo.PreviewPreparedReport(true);
         }
         prRepRecaudo.LoadTemplateFromFile(ExtractFilePath(Application.ExeName) + '/Reporte/InformeDeRecaudoDelDia.prt', False);
         prRepRecaudo.Variables.ByName['EMPRESA'].AsString := Empresa;
         prRepRecaudo.Variables.ByName['DIA'].AsDateTime := EdFecha.Date;
         prRepRecaudo.Variables.ByName['EMPLEADO'].AsString := Empleado;
         prRepRecaudo.Variables.ByName['CAJA'].AsInteger := EdCaja.Value;
         if prRepRecaudo.PrepareReport then
           prRepRecaudo.PreviewPreparedReport(true);
        end
        else
          ShowMessage('No hay datos para este día');
end;

procedure TfrmInformeRecaudo.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeRecaudo.FormDestroy(Sender: TObject);
begin
        IBQuery1.Transaction.Commit;
end;

end.
