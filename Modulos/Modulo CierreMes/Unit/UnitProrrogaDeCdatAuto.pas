unit UnitProrrogaDeCdatAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvEdit, JvTypedEdit, StdCtrls;

type
  TfrmLiquidacionCdatAuto = class(TForm)
    Label1: TLabel;
    edCaptacion: TEdit;
    Label2: TLabel;
    edEstado: TEdit;
    Label3: TLabel;
    edCantidad: TJvIntegerEdit;
    progreso: TProgressBar;
    procedure FormActivate(Sender: TObject);
  private
    procedure ProcesarCertificados;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmLiquidacionCdatAuto: TfrmLiquidacionCdatAuto;
  Liquidado:Boolean;
  TasaR:Extended;
  DiarioR:Currency;
  SaldoMinimo:Currency;
  Tabla:string;
  Codigo_Captacion:string;
  Codigo_Captacion2:string;
  Codigo_Captacion4:string;
  TotalCapta2:Currency;
  TotalCapta4:Currency;
  TotalCapta2R:Currency;
  TotalCapta4R:Currency;
  TotalCapta2RMes:Currency;
  TotalCapta4RMes:Currency;
  Comprobante :Integer;
  aporte,ahorro,certificado,programado:Boolean;
  
implementation

{$R *.dfm}

procedure TfrmLiquidacionCdatAuto.ProcesarCertificados;
var MinCaptacion,MaxCaptacion:Integer;
    Ag,Numero,Digito:Integer;
    L:tInteres;
    FechaCorte:TDate;
    Valor:Currency;
    TipoI:string;
    CodTipoI:Integer;
    TasaN:Double;
    Retefuente:Currency;
    UltimoPago:TDate;
    Puntos:Double;
    Moda:string;
    Amor:Integer;
begin
          TotalCapta2:=0;
          TotalCapta4:=0;
          TotalCapta2R:=0;
          TotalCapta4R:=0;
          TotalCapta2RMes:=0;
          TotalCapta4RMes:=0;
          MinCaptacion := 1;
          MaxCaptacion := 1;

          FechaCorte := _fechaProceso;
                      
          with _queryProcedure do
          begin
              StoredProcName := 'P_CAP_0003';
              ParamByName('ID').AsInteger := _id_captacion;
              ParamByName('FECHA').AsDate := FechaCorte;
              try
                 Application.ProcessMessages;
                 Prepare;
                 ExecProc;
              except
                 // frmProgreso.Cerrar;
                 edEstado.Text := 'No existen cdat a las cuales liquidarles intereses';
                 PostMessage(Handle, WM_CLOSE, 0, 0);
                 modalresult := mrCancel;;
              end;
              MaxCaptacion := ParamByName('TOTAL').AsInteger;
              if MaxCaptacion = 0 then
              begin
                 edEstado.Text := 'No existen captaciones a las cuales liquidarles intereses';
                 PostMessage(Handle, WM_CLOSE, 0, 0);
                 modalresult := mrCancel;;
              end;
              Close;
// Crear Tabla Temporal
              //frmProgreso.InfoLabel := 'Creando Tabla Temporal';
          end;

          Application.ProcessMessages;
          CDStemp.Open;
          CDStemp.EmptyDataSet;
          {
          Tabla := '"liq' + FloatToStr(Date) + IntToStr(DBLCBTipoCaptacion.KeyValue) + '"';
          IBConsulta.Close;
          IBConsulta.SQL.Clear;
          IBConsulta.SQL.Add('create table ' + Tabla + '(');
          IBConsulta.SQL.Add('ID_AGENCIA TIPOS,');
          IBConsulta.SQL.Add('ID_TIPO_CAPTACION TIPOS,');
          IBConsulta.SQL.Add('NUMERO_CUENTA TIPO_CAPTACION,');
          IBConsulta.SQL.Add('DIGITO_CUENTA TIPOS,');
          IBConsulta.SQL.Add('ID_IDENTIFICACION TIPOS,');
          IBConsulta.SQL.Add('ID_PERSONA VARCHAR(15),');
          IBConsulta.SQL.Add('NOMBRE VARCHAR(150),');
          IBConsulta.SQL.Add('ID_TIPO_CAPTACION_ABONO TIPOS,');
          IBConsulta.SQL.Add('NUMERO_CUENTA_ABONO TIPO_CAPTACION,');
          IBConsulta.SQL.Add('SALDO_ACTUAL NUMERICO,');
          IBConsulta.SQL.Add('TASA_LIQUIDACION DOUBLE PRECISION,');
          IBConsulta.SQL.Add('DIAS INTEGER,');
          IBConsulta.SQL.Add('INTERES NUMERICO,');
          IBConsulta.SQL.Add('CAUSADO NUMERICO,');
          IBConsulta.SQL.Add('RETENCION NUMERICO,');
          IBConsulta.SQL.Add('RETEINTERES NUMERICO,');
          IBConsulta.SQL.Add('RETECAUSADO NUMERICO,');
          IBConsulta.SQL.Add('NETO NUMERICO )');
          try
              IBConsulta.ExecSQL;
              IBConsulta.Transaction.CommitRetaining;
              IBConsulta.Close;
          except
              frmProgreso.Cerrar;
              MessageDlg('No se pudo crear la tabla temporal para la liquidación',mtError,[mbcancel],0);
              Exit;
          end;
           }
// Fin creación tabla temporal
          //frmProgreso.InfoLabel := 'Iniciando Proceso de Liquidación';

        with _queryALiquidar do
        begin
            SQL.Clear;
            SQL.Add('select * from P_CAP_0004 (:ID, :FECHA)');
            ParamByName('ID').AsInteger := _id_captacion;
            ParamByName('FECHA').AsDate := FechaCorte;
              try
                 Application.ProcessMessages;
                 Open;
              except
                 EdEstado.Text := 'Error Localizando Captaciones a Liquidar';
                 PostMessage(Handle, WM_CLOSE, 0, 0);
                 modalresult := mrCancel;
              end;

              progreso.Min  := MinCaptacion;
              progreso.Max := MaxCaptacion;
              progreso.Position:= 1;
              //CmdCerrar.Enabled := False;
              {
              IBConsulta.Close;
              IBConsulta.SQL.Clear;
              IBConsulta.SQL.Add('insert into ' + Tabla + ' values (');
              IBConsulta.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
              IBConsulta.SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NOMBRE",:ID_TIPO_ABONO,:NUMERO_ABONO,');
              IBConsulta.SQL.Add(':"SALDO_ACTUAL",:"TASA_LIQUIDACION",:"DIAS",');
              IBConsulta.SQL.Add(':"INTERES",:"CAUSADO",:"RETENCION",:"RETEINTERES",:"RETECAUSADO",:"NETO")');
              }
              while not Eof do
              begin
                Application.ProcessMessages;
                edCaptacion.Text := 'Liquidando Captacion:' + IntToStr(_id_captacion) + '-' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Numero := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                progreso.Position := RecNo;
                Valor := FieldByName('VALOR_INICIAL').AsCurrency;
                UltimoPago := FieldByName('FECHA_ULTIMO_PAGO').AsDateTime;
                TipoI := FieldByName('TIPO_INTERES').AsString;
                CodTipoI := FieldByName('ID_INTERES').AsInteger;
                TasaN := FieldByName('TASA_EFECTIVA').AsFloat;
                Puntos := FieldByName('PUNTOS_ADICIONALES').AsFloat;
                Moda := FieldByName('MODALIDAD').AsString;
                Amor := FieldByName('AMORTIZACION').AsInteger;
// Evaluar Fecha Ultimo Pago
                if UltimoPago < FieldByName('FECHA_APERTURA').AsDateTime then
                   UltimoPago := FieldByName('FECHA_APERTURA').AsDateTime;
                if UltimoPago < FieldByName('FECHA_PRORROGA').AsDateTime then
                   UltimoPago := FieldByName('FECHA_PRORROGA').AsDateTime;

// Evaluar la tasa a liquidar
                if TipoI = 'V' then
                with _query do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select VALOR_ACTUAL_TASA from "col$tasasvariables" where');
                    SQL.Add('ID_INTERES = :"ID"');
                    ParamByName('ID').AsInteger := CodTipoI;
                    try
                      ExecSQL;
                      TasaN := FieldByName('VALOR_ACTUAL_TASA').AsFloat;
                    except
                      //MessageDlg('Error obteniendo tasa:' + IntToStr(CodTipoI),mtError,[mbcancel],0);
                      TasaN := 0;
                    end;
                    Close;
                end;

                if Moda = 'A' then
                   TasaN := TasaNominalAnticipada(TasaN,Amor)
                else
                   TasaN := TasaNominalVencida(TasaN,Amor);

                if Puntos < 0 then Puntos := 0;

                TasaN := TasaN + Puntos;

                L := InteresCertificado(Valor,FechaCorte,TasaN,DiarioR,TasaR,UltimoPago,Amor);
                CDStemp.Insert;
                CDStempID_AGENCIA.Value := FieldByName('ID_AGENCIA').AsInteger;
                CDStempID_TIPO_CAPTACION.Value := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                CDStempNUMERO_CUENTA.Value := FieldByName('NUMERO_CUENTA').AsInteger;
                CDStempDIGITO_CUENTA.Value := FieldByName('DIGITO_CUENTA').AsInteger;
                CDStempID_IDENTIFICACION.Value := FieldByName('ID_IDENTIFICACION').AsInteger;
                CDStempID_PERSONA.Value := FieldByName('ID_PERSONA').AsString;
                CDStempNOMBRE.Value := FieldbyName('PRIMER_APELLIDO').AsString + ' ' +
                                                                    FieldbyName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                                    FieldbyName('NOMBRE').AsString;
                CDStempID_TIPO_CAPTACION_ABONO.Value := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                CDStempNUMERO_CUENTA_ABONO.Value := FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
                CDStempSALDO_ACTUAL.Value := L.SaldoAFecha;
                CDStempTASA_LIQUIDACION.Value  := L.TasaLiquidacion;
                CDStempDIAS.Value := L.DiasLiquidacion;
                CDStempINTERES.Value := L.Interes;
                CDStempCAUSADO.Value := L.Causado;
                if FieldByName('RETEFUENTE').AsInteger = 0 then
                begin
                   L.Retencion := 0;
                   L.ReteInteres := 0;
                   L.ReteCausado := 0;
                end;
                CDStempRETENCION.Value := L.Retencion;
                CDStempRETEINTERES.Value := L.ReteInteres;
                CDStempRETECAUSADO.Value := L.ReteCausado;
                CDStempNETO.Value := L.Interes + L.Causado - L.Retencion;
                if (L.Interes > 0) then
                  CDStemp.Post
                else
                  CDStemp.Cancel;
                if FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger = 2 then begin
                   TotalCapta2 := TotalCapta2 + L.Interes + L.Causado;
                   TotalCapta2R := TotalCapta2R + L.Retencion;
                   TotalCapta2RMes := TotalCapta2RMes + L.ReteInteres;
                end
                else
                if FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger = 4 then begin
                   TotalCapta4 := TotalCapta4 + L.Interes + L.Causado;
                   TotalCapta4R := TotalCapta4R + L.Retencion;
                   TotalCapta4RMes := TotalCapta4RMes + L.ReteInteres;
                end;
                Next;
              end;
          Close;
          
        end;
        
        CDStemp.First;
        if edDefinitivo.Checked then
          Aplicar;

        _transaction.Commit;
        CmdCerrar.Enabled := True;

        PostMessage(Handle, WM_CLOSE, 0, 0);
        modalresult := mrCancel;
          //frmProgreso.Cerrar;
          //Liquidado := True;
          //CmdLiquidar.Enabled := False;
          //CmdVer.Enabled := True;
          //CmdCerrar.Enabled := True;
          //RadioTipoLiquidacion.Enabled := False;
          //if RadioTipoLiquidacion.ItemIndex = 1 then
          //CmdAplicar.Enabled := True;
end;

procedure TfrmLiquidacionCdatAuto.FormActivate(Sender: TObject);
begin
        ProcesarCertificados
end;

end.
