unit UnitRecuperarBarridoCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  pr_Common, pr_TxClasses,pr_parser, IBSQL, Printers;

type
  TfrmRecuperarBarridoCartera = class(TForm)
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdImprimir: TBitBtn;
    IBPersona: TIBSQL;
    Report: TprTxReport;
    GroupBox1: TGroupBox;
    EdFechaHora: TLabeledEdit;
    EdNotaContable: TLabeledEdit;
    EdLiquidaciones: TLabeledEdit;
    IBGrupo2: TIBQuery;
    IBGrupo1: TIBQuery;
    IBAuxiliar: TIBQuery;
    Label1: TLabel;
    EdImpresora: TLabel;
    cmdImpresora: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IBGrupo3: TIBQuery;
    IBBarrido: TIBSQL;
    Label2: TLabel;
    EdUsuario: TEdit;
    ReporteBarrido: TprTxReport;
    procedure CmdImprimirClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cmdImpresoraClick(Sender: TObject);
    procedure ReporteBarridoUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure ReporteBarridoPrintComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecuperarBarridoCartera: TfrmRecuperarBarridoCartera;
  ConsecBarridoInicial : string;
  ConsecBarridoFinal : string;
  vNoComprobante : Integer;
  FechaBarrido : TDate;
  HoraBarrido : TDateTime;

implementation

{$R *.dfm}

uses UnitdmGeneral, UnitVistaPreliminar,
     UnitGlobalesCol, UnitGlobales;

procedure TfrmRecuperarBarridoCartera.CmdImprimirClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
    Device, Driver, Port: array[0..255] of char;
    PrinterName: string;
    buf:array[0..255] of char;
    Handle, hDeviceMode: THandle;
begin

        CmdImprimir.Enabled := False;
        Printer.GetPrinter(Device,Driver,Port,hDeviceMode);
        PrinterName := Format('%s', [Device]);
        EdImpresora.Caption := PrinterName;

        Empleado;
         with IBGrupo1 do
          begin
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('"col$extracto".ID_COLOCACION,');
           SQL.Add('"col$extracto".ID_CBTE_COLOCACION,');
           SQL.Add('"col$extracto".FECHA_EXTRACTO,');
           SQL.Add('"col$extracto".CAPITAL_PAGO_HASTA,');
           SQL.Add('"col$extracto".INTERES_PAGO_HASTA,');
           SQL.Add('"col$extracto".SALDO_ANTERIOR_EXTRACTO,');
           sql.Add('("col$extracto".SALDO_ANTERIOR_EXTRACTO - "col$extracto".ABONO_CAPITAL) as SALDO,');
           SQL.Add('"col$extracto".ID_EMPLEADO,');
           SQL.Add('"col$extracto".CUOTA_EXTRACTO,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE,');
           SQL.Add('"col$extractodet".CODIGO_PUC,');
           SQL.Add('"col$extractodet".FECHA_INICIAL,');
           SQL.Add('"col$extractodet".FECHA_FINAL,');
           SQL.Add('"col$extractodet".DIAS_APLICADOS,');
           SQL.Add('"col$extractodet".TASA_LIQUIDACION,');
           SQL.Add('"col$extractodet".VALOR_DEBITO,');
           SQL.Add('"col$extractodet".VALOR_CREDITO,');
           SQL.Add('"con$puc".NOMBRE as CUENTA,');
           SQL.Add('"gen$empleado".PRIMER_APELLIDO as APE1EMPLEADO,');
           SQL.Add('"gen$empleado".SEGUNDO_APELLIDO as APE2EMPLEADO,');
           SQL.Add('"gen$empleado".NOMBRE as NOMEMPLEADO');
           SQL.Add('from "col$extractodet" ');
           SQL.Add('left join "col$colocacion" on ("col$extractodet".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$extractodet".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
           SQL.Add('LEFT JOIN "gen$persona" on ("gen$persona".ID_IDENTIFICACION = "col$colocacion".ID_IDENTIFICACION and ');
           SQL.Add('"gen$persona".ID_PERSONA = "col$colocacion".ID_PERSONA)');
           SQL.Add('LEFT JOIN "con$puc" ON ("col$extractodet".CODIGO_PUC = "con$puc".CODIGO and ');
           SQL.Add('"col$extractodet".ID_AGENCIA = "con$puc".ID_AGENCIA )');
           SQL.Add('inner join "col$extracto" on ("col$extractodet".ID_AGENCIA = "col$extracto".ID_AGENCIA and');
           SQL.Add('"col$extractodet".ID_COLOCACION = "col$extracto".ID_COLOCACION and ');
           SQL.Add('"col$extractodet".ID_CBTE_COLOCACION = "col$extracto".ID_CBTE_COLOCACION)');
           SQL.Add('left join "gen$empleado" on ("col$extracto".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
           SQL.Add('where');
           SQL.Add('"col$extractodet".ID_CBTE_COLOCACION >= :"ID1" and "col$extractodet".ID_CBTE_COLOCACION <= :"ID2"');
           SQL.Add('and "col$extractodet".FECHA_EXTRACTO = :"FECHA_EXTRACTO" and "col$extracto".ID_EMPLEADO =:ID_EMPLEADO');
           SQL.Add('order by "col$extractodet".ID_CBTE_COLOCACION,  "col$extractodet".VALOR_CREDITO');
           ParamByName('ID1').AsString :=  ConsecBarridoInicial;
           ParamByName('ID2').AsString :=  ConsecBarridoFinal;
           ParamByName('FECHA_EXTRACTO').AsDate := FechaBarrido;
           ParamByName('ID_EMPLEADO').AsString := Trim(EdUsuario.Text);
           Open;
           Last;
           First;

         with IBGrupo2 do
          begin
            SQL.Clear;
            SQL.Add('select ');
            SQL.Add('"col$extracto".ID_COLOCACION,');
            SQL.Add('"col$extracto".FECHA_EXTRACTO,');
            SQL.Add('("col$extracto".ABONO_CAPITAL + "col$extracto".ABONO_CXC');
            SQL.Add('+ "col$extracto".ABONO_ANTICIPADO + "col$extracto".ABONO_SERVICIOS');
            SQL.Add('+ "col$extracto".ABONO_MORA) AS LIQUIDACION,');
            SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
            SQL.Add('"col$colocacion".ID_PERSONA,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE');
            SQL.Add('from "col$extracto"');
            SQL.Add('left join "col$colocacion" on ("col$extracto".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
            SQL.Add('LEFT JOIN "gen$persona" on ("gen$persona".ID_IDENTIFICACION = "col$colocacion".ID_IDENTIFICACION and');
            SQL.Add('"gen$persona".ID_PERSONA = "col$colocacion".ID_PERSONA)');
            SQL.Add('where');
            SQL.Add('"col$extracto".ID_CBTE_COLOCACION >= :"ID1" and "col$extracto".ID_CBTE_COLOCACION <= :"ID2"');
            SQL.Add('and "col$extracto".FECHA_EXTRACTO = :"FECHA_EXTRACTO" and "col$extracto".ID_EMPLEADO =:ID_EMPLEADO');
            SQL.Add('order by "col$extracto".ID_COLOCACION');
            ParamByName('ID1').AsString := ConsecBarridoInicial;
            ParamByName('ID2').AsString := ConsecBarridoFinal;
            ParamByName('FECHA_EXTRACTO').AsDate := FechaBarrido;
            ParamByName('ID_EMPLEADO').AsString := Trim(EdUsuario.Text);
            Open;
            Last;
            First;

           Printer.GetPrinter(Device,Driver,Port,hDeviceMode);
           PrinterName := Format('%s', [Device]);
           EdImpresora.Caption := PrinterName;

// Imprimir Comprobante
       with IBAuxiliar do
        begin
          sql.Clear;
          SQL.Add('Select');
          SQL.Add('"con$comprobante".ID_COMPROBANTE,');
          SQL.Add('"con$comprobante".FECHADIA,');
          SQL.Add('"con$comprobante".DESCRIPCION,');
          SQL.Add('"con$comprobante".TOTAL_DEBITO,');
          SQL.Add('"con$comprobante".TOTAL_CREDITO,');
          SQL.Add('"con$comprobante".ESTADO,');
          SQL.Add('"con$comprobante".IMPRESO,');
          SQL.Add('"con$comprobante".ANULACION,');
          SQL.Add('"con$auxiliar".CODIGO,');
          SQL.Add('"con$puc".NOMBRE,');
          SQL.Add('"con$auxiliar".DEBITO,');
          SQL.Add('"con$auxiliar".CREDITO,');
          SQL.Add('"con$auxiliar".ID_CUENTA,');
          SQL.Add('"con$auxiliar".ID_COLOCACION,');
          SQL.Add('"con$auxiliar".ID_IDENTIFICACION,');
          SQL.Add('"con$auxiliar".ID_PERSONA,');
          SQL.Add('"con$auxiliar".MONTO_RETENCION,');
          SQL.Add('"con$auxiliar".TASA_RETENCION,');
          SQL.Add('"con$tipocomprobante".DESCRIPCION AS DESCRIPCION1,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          SQL.Add('from "con$auxiliar"');
          SQL.Add('inner join "con$comprobante" on ("con$auxiliar".ID_COMPROBANTE = "con$comprobante".ID_COMPROBANTE and "con$auxiliar".ID_AGENCIA = "con$comprobante".ID_AGENCIA)');
          SQL.Add('inner join "con$tipocomprobante" on ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID)');
          SQL.Add('INNER join "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
          SQL.Add('inner join "gen$agencia" on ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('where "con$auxiliar".ID_COMPROBANTE =:"ID_COMPROBANTE"');
          SQL.Add('and "con$auxiliar".ID_AGENCIA =:"ID_AGENCIA"');
          SQL.Add('order by "con$auxiliar".CREDITO');
          ParamByName('ID_COMPROBANTE').AsInteger := VNocomprobante;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;


          ReporteBarrido.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteBarrido.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          ReporteBarrido.Variables.ByName['NIT'].AsString := Nit;

          if ReporteBarrido.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReporteBarrido;
             frmVistaPreliminar.ShowModal;
           end;
        IBAuxiliar.Close;
        IBGrupo1.Close;
        IBGrupo2.Close;
        end;
        end;
          end;

        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        CmdCerrar.SetFocus;
end;

procedure TfrmRecuperarBarridoCartera.CmdCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmRecuperarBarridoCartera.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRecuperarBarridoCartera.FormShow(Sender: TObject);
var
     Device, Driver, Port: array[0..255] of char;
     PrinterName: string;
     buf:array[0..255] of char;
     Handle, hDeviceMode: THandle;
begin
        if IBPersona.Transaction.InTransaction then
           IBPersona.Transaction.Rollback;

        IBPersona.Transaction.StartTransaction;

        with IBPersona do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from "col$controlbarrido"');
         SQL.Add('where IMPRESO = 0 order by FECHA DESC');
         ExecQuery;
         if RecordCount > 0 then begin
           FechaBarrido := FieldByName('FECHA').AsDate;
           HoraBarrido := FieldbyName('HORA').AsTime;
           EdFechaHora.Text :=  DateToStr(FechaBarrido) + ' ' + formatdatetime('T',HoraBarrido);
           vNoComprobante := FieldByName('ID_COMPROBANTE').AsInteger;
           EdNotaContable.Text := IntToStr(vNoComprobante);
           ConsecBarridoInicial := FieldByName('CONSECINI').AsString;
           ConsecBarridoFinal := FieldByName('CONSECFIN').AsString;
           EdLiquidaciones.Text := IntToStr(FieldByName('CONSECFIN').AsInteger - FieldByName('CONSECINI').AsInteger + 1);
           Close;
         end
         else
           MessageDlg('No se Encontró Barrido Pendiente' + #13 + 'Para Imprimir',mtError,[mbok],0);
        end;

        Printer.GetPrinter(Device,Driver,Port,hDeviceMode);
        PrinterName := Format('%s', [Device]);
        EdImpresora.Caption := PrinterName;        
end;

procedure TfrmRecuperarBarridoCartera.cmdImpresoraClick(Sender: TObject);
begin
        PrinterSetupDialog1.Execute;
end;

procedure TfrmRecuperarBarridoCartera.ReporteBarridoUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue; var IsProcessed: Boolean);
var
FechaProx, Saldo, Cuenta : String;
ValorSaldo : Currency;
CuotaProx : string;
begin
    if (VarName = 'Saldo') then
     begin
       with IBGrupo3 do
        begin
          SQL.Clear;
          SQL.Add('Select ');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) as SALDO,');
          SQL.Add('from "col$colocacion"');
          SQL.Add('where ');
          SQL.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
          ParamByName('ID_COLOCACION').AsString := IBGrupo1.FieldByName('ID_COLOCACION').AsString;
          Open;
          ValorSaldo := FieldByName('SALDO').AsCurrency;
          Close;
        end;
       _vSetAsDouble(Value,ValorSaldo);
       IsProcessed := True;
     end;

    if (VarName = 'FechaProx') then
     begin
        with IBGrupo3 do
         begin
           sql.Clear;
           SQL.Add('Select FECHA_A_PAGAR, CAPITAL_A_PAGAR');
           SQL.Add('from "col$tablaliquidacion"');
           SQL.Add('where ');
           SQL.Add('"col$tablaliquidacion".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$tablaliquidacion".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$tablaliquidacion".PAGADA = 0');
           SQL.Add('order by FECHA_A_PAGAR');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := IBGrupo1.FieldByName('ID_COLOCACION').AsString;
           Open;
           Last;
           First;
           if FieldByName('FECHA_A_PAGAR').AsDateTime = 0 then
              CuotaProx := '0000/00/00'
           else
              CuotaProx := DateToStr(FieldByName('FECHA_A_PAGAR').AsDateTime);
{              SQL.Add('select FECHA_A_PAGAR, CUOTA_NUMERO ');
              SQL.Add('from "col$tablaliquidacion"');
              SQL.Add('where ');
              SQL.Add('ID_AGENCIA =:"ID_AGENCIA" and');
              SQL.Add('ID_COLOCACION =:"ID_COLOCACION" and');
              SQL.Add('CUOTA_NUMERO = :"CUOTA_NUMERO"');
              SQL.Add('order by CUOTA_NUMERO');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_COLOCACION').AsString := IBGrupo1.FieldByName('ID_COLOCACION').AsString;
              ParamByName('CUOTA_NUMERO').AsInteger := IBGrupo1.FieldByName('CUOTA_EXTRACTO').AsInteger + 1;
              Open;
              CuotaProx := FieldByName('FECHA_A_PAGAR').AsDateTime; }
              Close;
         end;
      _vSetAsString(Value,CuotaProx);
       IsProcessed := True;
     end;

    if (VarName = 'Cuenta') then
     begin
        with IBGrupo3 do
         begin
           sql.Clear;
           Sql.Add('select * from P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           ParamByName('ID_AGENCIA').AsInteger;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           ParamByName('ID_IDENTIFICACION').AsInteger := IBGrupo1.FieldByName('ID_IDENTIFICACION').AsInteger;
           ParamByName('ID_PERSONA').AsString := IBGrupo1.FieldByName('ID_PERSONA').AsString;
           Open;
           Cuenta := IntToStr(FieldByName('NUMERO_CUENTA').AsInteger) + '-' + DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)); ;
           Close;
         end;
      _vSetAsString(Value,Cuenta);
       IsProcessed := True;
     end;

    if (VarName = 'CuentaRes') then
     begin
        with IBBarrido do
         begin
           sql.Clear;
           Sql.Add('select * from P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           ParamByName('ID_AGENCIA').AsInteger;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           ParamByName('ID_IDENTIFICACION').AsInteger := IBGrupo2.FieldByName('ID_IDENTIFICACION').AsInteger;
           ParamByName('ID_PERSONA').AsString := IBGrupo2.FieldByName('ID_PERSONA').AsString;
           ExecQuery;
           Cuenta := IntToStr(FieldByName('NUMERO_CUENTA').AsInteger) + '-' + DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)); ;
           Close;
         end;
      _vSetAsString(Value,Cuenta);
       IsProcessed := True;
     end;
end;

procedure TfrmRecuperarBarridoCartera.ReporteBarridoPrintComplete(
  Sender: TObject);
begin

         with IBPersona do
         begin
           if Transaction.InTransaction then
             Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('update "col$controlbarrido" set IMPRESO = 1');
           SQL.Add('where');
           SQL.Add('ID_COMPROBANTE = :ID_COMPROBANTE and');
           SQL.Add('FECHA = :FECHA');
           ParamByName('ID_COMPROBANTE').AsInteger := VNocomprobante;
           ParamByName('FECHA').AsDate := FechaBarrido;
           ExecQuery;
           Close;
           Transaction.Commit;
         end;
end;

end.
