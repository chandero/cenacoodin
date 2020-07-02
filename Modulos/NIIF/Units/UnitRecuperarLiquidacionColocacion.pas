unit UnitRecuperarLiquidacionColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses,pr_parser, IBSQL;

type
  TfrmRecuperarLiquidacionColocacion = class(TForm)
    EdColocacion: TLabeledEdit;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBQuery1: TIBQuery;
    EdComprobante: TLabeledEdit;
    IBPersona: TIBSQL;
    IBQuery: TIBQuery;
    Report: TprTxReport;
    procedure EdColocacionExit(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure EdComprobanteExit(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Empleado;
    procedure Asociado;
  public
    { Public declarations }
  end;

var
  frmRecuperarLiquidacionColocacion: TfrmRecuperarLiquidacionColocacion;
  vColocacion : string;
  vComprobante : string;
  Fecha : TDate;
  CapitalHasta : TDate;
  InteresHasta : TDate;
  SaldoAnterior : Currency;
  Alias : string;
  vTipoId : Integer;
  vNumeroId : string;
  NombresAsociado:string;
  ApellidosAsociado:string;
  Cuota : Integer;
  Nuevosaldo : Currency;
  FechaaPagar: TDate;

implementation

{$R *.dfm}

uses UnitdmGeneral, UnitVistaPreliminar,
     UnitGlobalesCol, UnitGlobales;

procedure TfrmRecuperarLiquidacionColocacion.EdColocacionExit(Sender: TObject);
begin
        vColocacion := EdColocacion.Text;
end;

procedure TfrmRecuperarLiquidacionColocacion.CmdGrabarClick(Sender: TObject);
var Tabla:string;
    I:Integer;
    AF:PCuotasLiq;
    frmVistaPreliminar:TfrmVistaPreliminar;
    Cuota1 : Integer;
    Cuenta:string;
begin
        with IBQuery1 do
         begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('"col$extracto".FECHA_EXTRACTO,');
           SQL.Add('"col$extracto".CAPITAL_PAGO_HASTA,');
           SQL.Add('"col$extracto".INTERES_PAGO_HASTA,');
           SQL.Add('"col$extracto".SALDO_ANTERIOR_EXTRACTO,');
           SQL.Add('"col$extracto".ID_EMPLEADO,');
           SQL.Add('"col$extracto".CUOTA_EXTRACTO,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('("col$extracto".SALDO_ANTERIOR_EXTRACTO - "col$extracto".ABONO_CAPITAL) as SALDO');
           SQL.Add('from "col$extracto" ');
           SQL.Add('left join "col$colocacion" on ("col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
           SQL.Add('where');
           SQL.Add('"col$extracto".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$extracto".ID_CBTE_COLOCACION =:"ID_CBTE_COLOCACION"');
           ParamByName('ID_COLOCACION').AsString := vColocacion;
           ParamByName('ID_CBTE_COLOCACION').AsString := vComprobante;
           Open;
           Last;
           
           if RecordCount > 0 then
            begin
              Fecha := IBQuery1.FieldByName('FECHA_EXTRACTO').AsDateTime;
              CapitalHasta := IBQuery1.FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;
              InteresHasta := IBQuery1.FieldByName('INTERES_PAGO_HASTA').AsDateTime;
              SaldoAnterior := IBQuery1.FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency;
              Alias := IBQuery1.FieldByName('ID_EMPLEADO').AsString;
              Cuota := IBQuery1.FieldByName('CUOTA_EXTRACTO').AsInteger;
              vTipoId := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
              vNumeroId := IBQuery1.FieldByName('ID_PERSONA').AsString;
              Nuevosaldo := IBQuery1.FieldByName('SALDO').AsCurrency;
              Close;

              SQL.Clear;
              SQL.Add('select "cap$maestrotitular".ID_AGENCIA, "cap$maestrotitular".ID_TIPO_CAPTACION, "cap$maestrotitular".NUMERO_CUENTA, "cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
              SQL.Add('inner join "cap$maestro" ON ( "cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
              SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION  and');
              SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
              SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA )');
              SQL.Add('inner join "cap$tiposestado" ON ( "cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO )');
              SQL.Add('where');
              SQL.Add('ID_IDENTIFICACION = :ID and ID_PERSONA = :ID_PERSONA and "cap$tiposestado".SE_SUMA <> 0 and "cap$maestrotitular".NUMERO_TITULAR = 1 and');
              SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 2 or "cap$maestrotitular".ID_TIPO_CAPTACION = 2)');
              SQL.Add('order by "cap$maestrotitular".ID_AGENCIA, "cap$maestrotitular".ID_TIPO_CAPTACION, "cap$maestrotitular".NUMERO_CUENTA, "cap$maestrotitular".DIGITO_CUENTA');
              ParamByName('ID').AsInteger := vTipoId;
              ParamByName('ID_PERSONA').AsString := vNumeroId;
              Open;
              Cuenta := IntToStr(FieldByName('NUMERO_CUENTA').AsInteger) + '-' + IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
              Close;

              SQL.Clear;
              SQL.Add('select CUOTA_NUMERO from "col$tablaliquidacion"');
              SQL.Add('where');
              SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
              SQL.Add('ID_COLOCACION = :ID_COLOCACION and');
              SQL.Add('PAGADA <> 0');
              SQL.Add('order by FECHA_A_PAGAR');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := vColocacion;
              Open;
              First;
              Last;
              cuota1 := FieldByName('CUOTA_NUMERO').AsInteger;
              Close;

              if Cuota = 0 then
                 cuota := Cuota1;

              SQL.Clear;
              SQL.Add('select FECHA_A_PAGAR, CUOTA_NUMERO ');
              SQL.Add('from "col$tablaliquidacion"');
              SQL.Add('where ');
              SQL.Add('ID_AGENCIA =:"ID_AGENCIA" and');
              SQL.Add('ID_COLOCACION =:"ID_COLOCACION" and');
              SQL.Add('CUOTA_NUMERO = :"CUOTA_NUMERO"');
              SQL.Add('order by FECHA_A_PAGAR');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := vColocacion;
              ParamByName('CUOTA_NUMERO').AsInteger := Cuota + 1;
              Open;
              FechaaPagar := FieldByName('FECHA_A_PAGAR').AsDateTime;
              Close;

              with IBQuery do
               begin
                 SQL.Clear;
                 SQL.Add('Select ');
                 SQL.Add('"col$extractodet".CODIGO_PUC,');
                 SQL.Add('"col$extractodet".FECHA_INICIAL,');
                 SQL.Add('"col$extractodet".FECHA_FINAL,');
                 SQL.Add('"col$extractodet".DIAS_APLICADOS,');
                 SQL.Add('"col$extractodet".TASA_LIQUIDACION,');
                 SQL.Add('"col$extractodet".VALOR_DEBITO,');
                 SQL.Add('"col$extractodet".VALOR_CREDITO,');
                 SQL.Add('"con$puc".NOMBRE');
                 SQL.Add('from "col$extractodet"');
                 SQL.Add('LEFT JOIN "con$puc" ON ("col$extractodet".CODIGO_PUC = "con$puc".CODIGO and ');
                 SQL.Add('"col$extractodet".ID_AGENCIA = "con$puc".ID_AGENCIA )');
                 SQL.Add('where ID_COLOCACION = :"ID_COLOCACION" and');
                 SQL.Add('ID_CBTE_COLOCACION = :"ID_CBTE_COLOCACION"');
                 SQL.Add('ORDER BY CODIGO_PUC,VALOR_DEBITO');
                 ParamByName('ID_COLOCACION').AsString := vColocacion;
                 ParamByName('ID_CBTE_COLOCACION').AsString := vComprobante;
                 Open;

                 Empleado;
                 Asociado;
                 Report.Variables.ByName['Empresa'].AsString := Empresa;
                 Report.Variables.ByName['Colocacion'].AsString := vColocacion;
                 Report.Variables.ByName['Hoy'].AsDateTime := Fecha;
                 Report.Variables.ByName['FechaCorte'].AsDateTime := Fecha;
                 Report.Variables.ByName['Asociado'].AsString := NombresAsociado + '' + ApellidosAsociado;
                 Report.Variables.ByName['InteresesHasta'].AsDateTime := InteresHasta;
                 Report.Variables.ByName['CapitalHasta'].AsDateTime := CapitalHasta;
                 Report.Variables.ByName['comprobante'].AsString := VComprobante;
                 Report.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;
                 Report.Variables.ByName['NuevoSaldo'].AsVariant := nuevosaldo;
                 Report.Variables.ByName['ProximaCuota'].AsDateTime := FechaaPagar;
                 Report.Variables.ByName['Cuota'].AsInteger := Cuota;
                 Report.Variables.ByName['Cuenta'].AsString := Cuenta;

                 if Report.PrepareReport then
                  begin
                    frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
                    frmVistaPreliminar.Reporte := Report;
                    frmVistaPreliminar.ShowModal;
                  end;
              end;
            end
           else
            begin
              MessageDlg('No se Encuentra Liquidacion para los datos Suministrados',mtError,[mbok],0);
              Exit;
            end;
         end;
         dmGeneral.IBTransaction1.Commit;
end;

procedure TfrmRecuperarLiquidacionColocacion.EdComprobanteExit(
  Sender: TObject);
begin
        vComprobante := EdComprobante.Text;
end;

procedure TfrmRecuperarLiquidacionColocacion.Empleado;
begin
        with IBPersona do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := Alias;
           execquery;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
         end;
end;

procedure TfrmRecuperarLiquidacionColocacion.Asociado;
begin
        with IBPersona do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$persona"');
           sql.Add('where "gen$persona"."ID_IDENTIFICACION" =:"ID_IDENTIFICACION" and');
           sql.Add('"gen$persona".ID_PERSONA =:"ID_PERSONA"');
           ParamByName('ID_IDENTIFICACION').AsInteger := vtipoid;
           parambyname('ID_PERSONA').AsString := vNumeroId;
           ExecQuery;
           NombresAsociado := FieldByName('NOMBRE').AsString;
           ApellidosAsociado := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
         end;
end;


procedure TfrmRecuperarLiquidacionColocacion.CmdCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmRecuperarLiquidacionColocacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRecuperarLiquidacionColocacion.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
end;

end.
