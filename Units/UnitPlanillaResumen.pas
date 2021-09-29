unit UnitPlanillaResumen;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pr_Common, pr_TxClasses, DB,
  IBCustomDataSet, IBQuery, Buttons, ComCtrls, IBSQL;

type
  TfrmPlanillaResumen = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    EdFecha: TDateTimePicker;
    Panel1: TPanel;
    CmdAceptar: TBitBtn;
    CmdCancelar: TBitBtn;
    IBQuery1: TIBQuery;
    RGTipo: TRadioGroup;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBQuery2: TIBQuery;
    Report: TprTxReport;
    IBQuery3: TIBQuery;
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdFechaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanillaResumen: TfrmPlanillaResumen;

implementation

{$R *.dfm}

uses UnitGlobales, UnitdmGeneral, UnitVistaPreliminar;

procedure TfrmPlanillaResumen.CmdAceptarClick(Sender: TObject);
var Codigo:string;
    frmVistaPreliminar:TfrmVistaPreliminar;
    Consecutivo:Integer;
begin
        Consecutivo := 0;
        if IBSQL1.Transaction.InTransaction then
           IBSQL1.Transaction.Commit;
        IBSQL1.Transaction.StartTransaction;
        with IBSQL1 do begin
           Close;
           SQL.Clear;
           SQL.Add('delete from CON$PLANILLARESUMEN');
           try
             ExecQuery;
             IBSQL1.Transaction.Commit;
           except
             MessageDlg('Error al Limpiar Planilla',mtError,[mbok],0);
           end;
        end;
        IBQuery1.Transaction.StartTransaction;

        if RGTipo.ItemIndex = 1 then
         with IBQuery3 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where ID_CONSECUTIVO = 4');
          Open;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Consecutivo := Consecutivo + 1;

          Close;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set CONSECUTIVO = :CONSECUTIVO where ID_CONSECUTIVO = 4');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecSQL;
          Close;

          Close;
          SQL.Clear;
          SQL.Add('insert into CON$CONTROLPLANILLA values (:FECHA_PLANILLA,:FECHA_IMPRESION,:CONSECUTIVO)');
          ParamByName('FECHA_PLANILLA').AsDate := EdFecha.Date;
          ParamByName('FECHA_IMPRESION').AsDate := fFechaActual;
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecSQL;
          Close;
         end;

        with IBQuery1 do begin
           Close;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('FECHADIA').AsDate := EdFecha.Date;
           try
            Open;
           except
            MessageDlg('Error al Buscar Datos para este día',mtError,[mbok],0);
           end;
        end;

        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('update CON$PLANILLARESUMEN SET DEBITO = DEBITO + :DEBITO,');
        IBSQL1.SQL.Add('CREDITO = CREDITO + :CREDITO where CODIGO = :CODIGO');
        IBSQL2.SQL.Clear;
        IBSQL2.SQL.Add('insert into CON$PLANILLARESUMEN VALUES (:CODIGO,:DEBITO,:CREDITO)');

        with IBQuery1 do
        while not Eof do begin
              Codigo := LeftStr(FieldByName('CODIGO').AsString,4);
              Codigo := Codigo + '00000000000000';
              IBSQL1.ParamByName('CODIGO').AsString := Codigo;
              IBSQL1.ParamByName('DEBITO').AsCurrency := FieldByName('DEBITO').AsCurrency;
              IBSQL1.ParamByName('CREDITO').AsCurrency := FieldByName('CREDITO').AsCurrency;
              try
               IBSQL1.ExecQuery;
               if IBSQL1.RowsAffected < 1 then begin
                  IBSQL2.ParamByName('CODIGO').AsString := Codigo;
                  IBSQL2.ParamByName('DEBITO').AsCurrency := FieldByName('DEBITO').AsCurrency;
                  IBSQL2.ParamByName('CREDITO').AsCurrency := FieldByName('CREDITO').AsCurrency;
                  try
                    IBSQL2.ExecQuery;
                  except
                    MessageDlg('Error al Generar Planilla',mtError,[mbcancel],0);
                    IBSQL2.Transaction.Rollback;
                    Exit;
                  end;
               end; // if
              except
                    MessageDlg('Error al Generar Planilla',mtError,[mbcancel],0);
                    IBSQL2.Transaction.Rollback;
                    Exit;
              end;
              Next;
        end;

        Report.Variables.ByName['EMPRESA'].AsString := Empresa;
        Report.Variables.ByName['FECHA'].AsDateTime := EdFecha.Date;
        Report.Variables.ByName['CONSECUTIVO'].AsInteger := Consecutivo;
        frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
        frmVistaPreliminar.Reporte := Report;
        frmVistaPreliminar.ShowModal;
        IBSQL1.Transaction.Commit;

end;


procedure TfrmPlanillaResumen.CmdCancelarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmPlanillaResumen.FormShow(Sender: TObject);
begin
        EdFecha.Date := Date;
        if IBSQL1.Transaction.InTransaction then
           IBSQL1.Transaction.Rollback;
        IBSQL1.Transaction.StartTransaction;
end;

procedure TfrmPlanillaResumen.EdFechaChange(Sender: TObject);
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from CON$CONTROLPLANILLA where FECHA_PLANILLA = :FECHA_PLANILLA');
          ParamByName('FECHA_PLANILLA').AsDate := EdFecha.Date;
          ExecQuery;
          if RecordCount > 0 then
           begin
             CmdAceptar.Enabled := False;
             MessageDlg('Planilla Definitiva ya Impresa el :'+FieldByName('FECHA_IMPRESION').AsString,mtInformation,[mbok],0);
             Exit;
           end;
        end;

        CmdAceptar.Enabled := True;
end;

end.
