unit UnitCdatporEdades;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, pr_Common, pr_TxClasses,
  IBSQL, DB, IBCustomDataSet, IBQuery;

type
  TfrmCdatporEdades = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    IBReporte: TIBQuery;
    IBSQL1: TIBSQL;
    CmdAplicar: TBitBtn;
    CmdComprobante: TBitBtn;
    Label2: TLabel;
    StaticText1: TStaticText;
    Reporte: TprTxReport;
    procedure BitBtn2Click(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  PList = ^AList;
  AList = record
    codigo   : string;
    nomcuenta: string;
    debito   : currency;
    credito  : currency;
    nocuenta : integer;
    nocredito: string;
    tipoide  : integer;
    idpersona: string;
    monto    : currency;
    tasa     : single;
    estado   : string;
  end;

var
  frmCdatporEdades: TfrmCdatporEdades;
  TpMenos6m:Currency;
  Tp6y12m:Currency;
  Tp12y18m:Currency;
  Tp18m:Currency;
  Lista:TList;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales,UnitVistaPreliminar;

procedure TfrmCdatporEdades.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmCdatporEdades.CmdProcesarClick(Sender: TObject);
var frmVistaPrevia:TfrmVistaPreliminar;
begin
        with IBReporte do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
        end;

        with IBSQL1 do begin
           Close;
           ParamByName('PLAZO1').AsInteger := 0;
           ParamByName('PLAZO2').AsInteger := 179;
           ExecQuery;
           TpMenos6m := FieldByName('VALOR').AsCurrency;
           Reporte.Variables.ByName['pMenos6m'].AsDouble := FieldByName('VALOR').AsCurrency;
           Close;
           ParamByName('PLAZO1').AsInteger := 180;
           ParamByName('PLAZO2').AsInteger := 360;
           ExecQuery;
           Tp6y12m := FieldByName('VALOR').AsCurrency;
           Reporte.Variables.ByName['p6y12m'].AsDouble := FieldByName('VALOR').AsCurrency;
           Close;
           ParamByName('PLAZO1').AsInteger := 361;
           ParamByName('PLAZO2').AsInteger := 540;
           ExecQuery;
           Tp12y18m := FieldByName('VALOR').AsCurrency;
           Reporte.Variables.ByName['p12y18m'].AsDouble := FieldByName('VALOR').AsCurrency;
           Close;
           ParamByName('PLAZO1').AsInteger := 541;
           ParamByName('PLAZO2').AsInteger := 9999;
           ExecQuery;
           Tp18m := FieldByName('VALOR').AsCurrency;
           Reporte.Variables.ByName['p18m'].AsDouble := FieldByName('VALOR').AsCurrency;
           Close;
        end;

        Reporte.Variables.ByName['Empresa'].AsString := Empresa;
        Reporte.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.Date;
        if Reporte.PrepareReport then begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := Reporte;
           frmVistaPreliminar.ShowModal;
        end;


end;

procedure TfrmCdatporEdades.CmdAplicarClick(Sender: TObject);
var vMenos6m,v6y12m,v12y18m,v18m:Currency;
    AR:PList;
begin
        Lista.Clear;
        with IBSQL1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          if TpMenos6m > 0 then begin
            Close;
// Buscar Codigo Puc
            SQL.Clear;
//  Buscar en Puc Saldos Actuales
            Close;
            SQL.Clear;
            SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('where "con$puc".CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := '211005000000000000';
            try
               ExecQuery;
               vMenos6m := FieldByName('SALDO').AsCurrency;
            except
               MessageDlg('Error al Obtener valor de Menor a 6 meses',mtError,[mbcancel],0);
               Transaction.Rollback;
               raise;
               Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
            SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
            SQL.Add('where "con$puc".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
            SQL.Add('group by "con$puc".SALDOINICIAL');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('CODIGO').AsString := '211005000000000000';
            ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
            try
              ExecQuery;
              vMenos6m := vMenos6m + FieldByName('SALDO').AsCurrency;
            except
              MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
              Transaction.Rollback;
              raise;
              Exit;
            end;
            vMenos6m := TpMenos6m - (-vMenos6m);
            if vMenos6m <> 0 then begin
              New(AR);
              AR^.codigo := '211005000000000000';
              if vMenos6m > 0 then begin
                 AR^.debito := 0;
                 AR^.credito := vMenos6m;
              end
              else
                 AR^.debito := -vMenos6m;
                 AR^.credito := 0;
              end;
              AR^.nocuenta := 0;
              AR^.nocredito := '';
              AR^.tipoide := 0;
              AR^.idpersona := '';
              AR^.monto := 0;
              AR^.tasa := 0;
              AR^.estado := 'O';
              Lista.Add(AR);
          end;
          if Tp6y12m > 0 then begin
            Close;
// Buscar Codigo Puc
            SQL.Clear;
//  Buscar en Puc Saldos Actuales
            Close;
            SQL.Clear;
            SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('where "con$puc".CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := '211010000000000000';
            try
               ExecQuery;
               v6y12m := FieldByName('SALDO').AsCurrency;
            except
               MessageDlg('Error al Obtener valor de Mayor a 6 meses',mtError,[mbcancel],0);
               Transaction.Rollback;
               raise;
               Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
            SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
            SQL.Add('where "con$puc".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
            SQL.Add('group by "con$puc".SALDOINICIAL');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('CODIGO').AsString := '211010000000000000';
            ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
            try
              ExecQuery;
              v6y12m := v6y12m + FieldByName('SALDO').AsCurrency;
            except
              MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
              Transaction.Rollback;
              raise;
              Exit;
            end;
            v6y12m := Tp6y12m - (-v6y12m);
            if v6y12m <> 0 then begin
              New(AR);
              AR^.codigo := '211010000000000000';
              if v6y12m > 0 then begin
                 AR^.debito := 0;
                 AR^.credito := v6y12m;
              end
              else
                 AR^.debito := -v6y12m;
                 AR^.credito := 0;
              end;
              AR^.nocuenta := 0;
              AR^.nocredito := '';
              AR^.tipoide := 0;
              AR^.idpersona := '';
              AR^.monto := 0;
              AR^.tasa := 0;
              AR^.estado := 'O';
              Lista.Add(AR);
          end;

          if Tp12y18m > 0 then begin
            Close;
// Buscar Codigo Puc
            SQL.Clear;
//  Buscar en Puc Saldos Actuales
            Close;
            SQL.Clear;
            SQL.Add('select "con$puc".SALDOINICIAL AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('where "con$puc".CODIGO = :CODIGO');
            ParamByName('CODIGO').AsString := '211015000000000000';
            try
               ExecQuery;
               v12y18m := FieldByName('SALDO').AsCurrency;
            except
               MessageDlg('Error al Obtener valor de Mayor a 6 meses',mtError,[mbcancel],0);
               Transaction.Rollback;
               raise;
               Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select SUM("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) AS SALDO');
            SQL.Add('from "con$puc"');
            SQL.Add('left join "con$saldoscuenta" ON ("con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA and ');
            SQL.Add('"con$puc".CODIGO = "con$saldoscuenta".CODIGO)');
            SQL.Add('where "con$puc".ID_AGENCIA = :ID_AGENCIA and "con$puc".CODIGO = :CODIGO and "con$saldoscuenta".MES <= :MES');
            SQL.Add('group by "con$puc".SALDOINICIAL');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('CODIGO').AsString := '211015000000000000';
            ParamByName('MES').AsInteger := Monthof(EdFechaCorte.Date);
            try
              ExecQuery;
              v12y18m := v12y18m + FieldByName('SALDO').AsCurrency;
            except
              MessageDlg('Error al Obtener valor de Corto Plazo',mtError,[mbcancel],0);
              Transaction.Rollback;
              raise;
              Exit;
            end;
            v12y18m := Tp12y18m - (-v12y18m);
            if v12y18m <> 0 then begin
              New(AR);
              AR^.codigo := '211015000000000000';
              if v12y18m > 0 then begin
                 AR^.debito := 0;
                 AR^.credito := v12y18m;
              end
              else
                 AR^.debito := -v12y18m;
                 AR^.credito := 0;
              end;
              AR^.nocuenta := 0;
              AR^.nocredito := '';
              AR^.tipoide := 0;
              AR^.idpersona := '';
              AR^.monto := 0;
              AR^.tasa := 0;
              AR^.estado := 'O';
              Lista.Add(AR);
          end;

         end;
end;

procedure TfrmCdatporEdades.FormCreate(Sender: TObject);
begin
        Lista := TList.Create;
end;

end.
