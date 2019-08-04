unit Unitcomparartabla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery, IBSQL;

type
  Tfrmcomparartabla = class(TForm)
    Panel3: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    Panel1: TPanel;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IB: TIBSQL;
    Label1: TLabel;
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcomparartabla: Tfrmcomparartabla;

implementation

{$R *.dfm}

uses  UnitDmGeneral, UnitGlobales, UnitGlobalesCol, UnitVistaPreliminar;

procedure Tfrmcomparartabla.CmdAceptarClick(Sender: TObject);
var
vFechaTabla : TDate;
vFechaColocacion : TDate;
vFechaNormal : TDate;
vTipoCuota : Integer;
AmortizaI : Integer;
begin
       with IBQuery1 do
        begin
          SQL.Clear;
          SQL.Add('select *');
          SQL.Add('from "col$colocacion"');
          SQL.Add('where');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION < 2 and');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL > 0');
          SQL.Add('order by "col$colocacion".ID_COLOCACION');
          Open;
          while not IBQuery1.Eof do
           begin
             Label1.Caption := FieldByName('ID_COLOCACION').AsString;
             Application.ProcessMessages;
             vFechaColocacion := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
             vTipoCuota := IBQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger;
             AmortizaI := IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
             with IBQuery2 do
              begin
                SQL.Clear;
                SQL.Add('Select first 1 *');
                SQL.Add('from "col$tablaliquidacion"');
                SQL.Add('where ');
                SQL.Add('"col$tablaliquidacion".PAGADA = 0 and "col$tablaliquidacion".ID_COLOCACION = :ID_COLOCACION');
                SQL.Add('order by "col$tablaliquidacion".CUOTA_NUMERO ASC');
                ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                Open;
                vFechaTabla := IBQuery2.FieldByName('FECHA_A_PAGAR').AsDateTime;
                if (vTipoCuota = 1)  or (vTipoCuota = 3) then
                   vFechaNormal := CalculoFecha(vFechaColocacion,AmortizaI)
                else
                   vFechaNormal := vFechaColocacion;
                if vFechaNormal <> vFechaTabla then
                   with IB do
                    begin
                      SQL.Clear;
                      SQL.Add('insert into "errorestabla" values(:ID_COLOCACION,:CUOTA,:FECHA_INTERES,');
                      SQL.Add(':FECHA_A_PAGAR,:AMORTIZAI,:TIPO_CUOTA)');
                      ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                      ParamByName('CUOTA').AsInteger := IBQuery2.FieldByName('CUOTA_NUMERO').AsInteger;
                      ParamByName('FECHA_INTERES').AsDate := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                      ParamByName('FECHA_A_PAGAR').AsDate := IBQuery2.FieldByName('FECHA_A_PAGAR').AsDateTime;
                      ParamByName('AMORTIZAI').AsInteger := IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
                      ParamByName('TIPO_CUOTA').AsInteger := IBQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger;
                      ExecQuery;
                    end;
               end;
            Next;
           end;

        end;
end;

procedure Tfrmcomparartabla.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

end.
