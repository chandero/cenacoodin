unit UnitCompararPersonas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBClient, IBSQL,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, pr_Classes;

type
  TfrmCompararPersonas = class(TForm)
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdCerrar: TBitBtn;
    Label1: TLabel;
    ST1: TStaticText;
    IBTabla: TClientDataSet;
    IBTablaENT_NUM: TIntegerField;
    IBTablaSDN_NAME: TStringField;
    IBTablaREMARKS: TStringField;
    IBTablaID_PERSONA: TStringField;
    IBTablaNOMBRE: TStringField;
    IBQuery1: TIBQuery;
    IBSQL1: TIBSQL;
    cmdReporte: TBitBtn;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    Reporte: TprTxReport;
    ReporteG: TprReport;
    Rg1: TRadioGroup;
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdProcesarClick(Sender: TObject);
    procedure cmdReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompararPersonas: TfrmCompararPersonas;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales, UnitMain;

procedure TfrmCompararPersonas.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCompararPersonas.cmdProcesarClick(Sender: TObject);
var Total:Integer;
begin

        cmdProcesar.Enabled := False;
        frmMain.Timer2.Enabled := False;
        Application.ProcessMessages;

        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        with IBSQL1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as TOTAL from "gen$persona"');
           SQL.Add('inner join "cap$maestrotitular" on ("gen$persona".ID_IDENTIFICACION = "cap$maestrotitular".ID_IDENTIFICACION and');
           SQL.Add('"gen$persona".ID_PERSONA = "cap$maestrotitular".ID_PERSONA)');
           SQL.Add('where "cap$maestrotitular".ID_TIPO_CAPTACION = 2');
           try
             ExecQuery;
           except
             Transaction.Rollback;
             frmMain.Timer2.Enabled := True;
             raise;
           end;
           Total := FieldByName('TOTAL').AsInteger;
           Close;
        end;

        ProgressBar1.Min := 0;
        ProgressBar1.Max := Total;
        ProgressBar1.Position := 0;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select "gen$persona".ID_PERSONA,"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "gen$persona"');
           SQL.Add('inner join "cap$maestrotitular" on ("gen$persona".ID_IDENTIFICACION = "cap$maestrotitular".ID_IDENTIFICACION and');
           SQL.Add('"gen$persona".ID_PERSONA = "cap$maestrotitular".ID_PERSONA)');
           SQL.Add('where "cap$maestrotitular".ID_TIPO_CAPTACION = 2');
           sql.Add('order by "gen$persona".ID_IDENTIFICACION,"gen$persona".ID_PERSONA');
           try
            Open;
           except
            Transaction.Rollback;
            frmMain.Timer2.Enabled := True;
            raise;
           end;

           while not Eof do begin
                ProgressBar1.Position := RecNo;
                ST1.Caption := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                                  FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                                  FieldByName('NOMBRE').AsString);
                Application.ProcessMessages;
                IBSQL1.Close;
                IBSQL1.SQL.Clear;
                IBSQL1.SQL.Add('select ENT_NUM,SDN_NAME,REMARKS from "sipla$sdn" where REMARKS LIKE :CADENA');
                IBSQL1.ParamByName('CADENA').AsString := '%'+FieldByName('ID_PERSONA').AsString+'%';
                try
                  IBSQL1.ExecQuery;
                except
                  Transaction.Rollback;
                  frmMain.Timer2.Enabled := True;
                  raise;
                end;

                if IBSQL1.RecordCount > 0 then begin
                   IBTabla.Open;
                   IBTabla.Insert;
                   IBTabla.FieldByName('ENT_NUM').AsInteger := IBSQL1.FieldByName('ENT_NUM').AsInteger;
                   IBTabla.FieldByName('SDN_NAME').AsString := IBSQL1.FieldByName('SDN_NAME').AsString;
                   IBTabla.FieldByName('REMARKS').AsString := IBSQL1.FieldByName('REMARKS').AsString;
                   IBTabla.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                   IBTabla.FieldByName('NOMBRE').AsString := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                                  FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                                  FieldByName('NOMBRE').AsString);
                   IBTabla.Post;
                   IBTabla.Close;
                end;
                IBSQL1.Close;
                Next;
           end;
           Close;
        end;

       frmMain.Timer2.Enabled := True;
       cmdReporte.Enabled := True;
       cmdReporte.Click;
end;

procedure TfrmCompararPersonas.cmdReporteClick(Sender: TObject);
begin
        case Rg1.ItemIndex of
        0: begin
                Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
                if Reporte.PrepareReport then
                   Reporte.PreviewPreparedReport(True);
           end;
        1: begin
                ReporteG.Variables.ByName['EMPRESA'].AsString := Empresa;
                if ReporteG.PrepareReport then
                   ReporteG.PreviewPreparedReport(True);
           end;
        end;
end;

end.
