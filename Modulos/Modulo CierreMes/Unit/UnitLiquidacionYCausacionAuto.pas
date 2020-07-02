unit UnitLiquidacionYCausacionAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, IBStoredProc, IB, DBClient, IBDatabase, IBCustomDataSet, IBSQL, DB,
  StdCtrls, ComCtrls, Math, Buttons, JvEdit, JvTypedEdit;

type
  TfrmLiquidacionYCausacionAuto = class(TForm)
    Label1: TLabel;
    edCaptacion: TEdit;
    Label2: TLabel;
    edEstado: TEdit;
    progreso: TProgressBar;
    IBTotalCaptaciones: TIBStoredProc;
    IBTotalCaptacionesTOTAL: TIntegerField;
    CmdCerrar: TBitBtn;
    CDStemp: TClientDataSet;
    CDStempID_AGENCIA: TIntegerField;
    CDStempID_TIPO_CAPTACION: TIntegerField;
    CDStempNUMERO_CUENTA: TIntegerField;
    CDStempDIGITO_CUENTA: TIntegerField;
    CDStempID_IDENTIFICACION: TIntegerField;
    CDStempID_PERSONA: TStringField;
    CDStempNOMBRE: TStringField;
    CDStempSALDO_ACTUAL: TCurrencyField;
    CDStempSALDO_LIQUIDACION: TCurrencyField;
    CDStempINTERES: TCurrencyField;
    CDStempRETENCION: TCurrencyField;
    CDStempID_TIPO_CAPTACION_ABONO: TIntegerField;
    CDStempNUMERO_CUENTA_ABONO: TIntegerField;
    CDStempTASA_LIQUIDACION: TFloatField;
    CDStempDIAS: TIntegerField;
    CDStempCAUSADO: TCurrencyField;
    CDStempRETEINTERES: TCurrencyField;
    CDStempRETECAUSADO: TCurrencyField;
    CDStempNETO: TCurrencyField;
    CDStempTOTALINTERES: TAggregateField;
    CDStempTOTALRETENCION: TAggregateField;
    CDStempTOTALCAUSADO: TAggregateField;
    CDStempTOTALRETEINTERES: TAggregateField;
    CDStempTOTALRETECAUSADO: TAggregateField;
    IBDComprobante: TIBDataSet;
    IBDAuxiliar: TIBDataSet;
    progreso2: TProgressBar;
    IBPagar: TIBSQL;
    edDefinitivo: TCheckBox;
    Label3: TLabel;
    edCantidad: TJvIntegerEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    _tipo : Integer;
    procedure ProcesarAhorros;
    procedure ProcesarCertificados(_id_captacion: Integer);    
    procedure Aplicar;
  public
    { Public declarations }
    property Tipo:Integer Read _tipo Write _tipo;
  end;

var
  frmLiquidacionYCausacionAuto: TfrmLiquidacionYCausacionAuto;
  _queryCaptacion, _queryRetefuente, _queryDiasLiquidados, _query : TIBQuery;
  _queryALiquidar: TIBQuery;
  _queryProcedure : TIBStoredProc;
  _transaction: TIBTransaction;
  _fechaProceso: TDate;

  Tabla:string;
  Codigo_Captacion:string;
  Codigo_Captacion2:string;
  Codigo_Captacion3:string;
  Codigo_Captacion4:string;
  TotalCapta2:Currency;
  TotalCapta3:Currency;
  TotalCapta4:Currency;
  TotalCapta2R:Currency;
  TotalCapta3R:Currency;
  TotalCapta4R:Currency;
  TotalCapta2RMes:Currency;
  TotalCapta3RMes:Currency;
  TotalCapta4RMes:Currency;
  Comprobante :Integer;
  aporte,ahorro,certificado,programado:Boolean;
  interes, TasaN: Double;
  SaldoMinimo: Currency;

  DiarioR: Currency;
  TasaR: Extended;
  MinCaptacion,MaxCaptacion:Integer;
  Ag,Numero,Digito:Integer;

  FechaCorte: TDate;
  cada: Integer;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitCaptaciones, UnitGlobalesCol, UnitGlobales;

procedure TfrmLiquidacionYCausacionAuto.FormCreate(Sender: TObject);
begin
        _query := TIBQuery.Create(self);
        _queryCaptacion := TIBQuery.Create(self);
        _queryRetefuente := TIBQuery.Create(self);
        _queryDiasLiquidados := TIBQuery.Create(self);
        _queryALiquidar := TIBQuery.Create(self);
        _queryProcedure := TIBStoredProc.Create(self);
        _transaction := TIBTransaction.Create(self);

        _transaction.DefaultDatabase := dmGeneral.IBDatabase1;

        _query.Database := dmGeneral.IBDatabase1;
        _queryCaptacion.Database := dmGeneral.IBDatabase1;
        _queryRetefuente.Database := dmGeneral.IBDatabase1;
        _queryDiasLiquidados.Database := dmGeneral.IBDatabase1;
        _queryALiquidar.Database := dmGeneral.IBDatabase1;
        _queryProcedure.Database := dmGeneral.IBDatabase1;

        _query.Transaction := _transaction;
        _queryCaptacion.Transaction := _transaction;
        _queryRetefuente.Transaction := _transaction;
        _queryALiquidar.Transaction := _transaction;
        _queryDiasLiquidados.Transaction := _transaction;
        _queryProcedure.Transaction := _transaction;

        IBDComprobante.Transaction := _transaction;
        IBDAuxiliar.Transaction := _transaction;
        IBPagar.Transaction := _transaction;
        
end;

procedure TfrmLiquidacionYCausacionAuto.ProcesarAhorros;
 var
   L:tInteres;

begin
        Application.ProcessMessages;
        with _queryRetefuente do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select DIARIO_RETEFUENTE, TASA_RETEFUENTE from "gen$valorretefuente" WHERE ID_RETEFUENTE = :ID_RETEFUENTE');
             ParamByName('ID_RETEFUENTE').AsInteger := 1;
             try
                Open;
                DiarioR := FieldByName('DIARIO_RETEFUENTE').AsCurrency;
                TasaR := FieldByName('TASA_RETEFUENTE').AsFloat;
             except
                DiarioR := 0;
                TasaR := 0;
             end;
             Close;
        end;

        if TasaR <> 0 then
           TasaR := TasaNominalVencida(TasaR,30);

        cada := 1;

        _queryCaptacion.Close;
        _queryCaptacion.SQL.Clear;
        _queryCaptacion.SQL.Add('SELECT * FROM "cap$tipocaptacion" a WHERE a.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
        _queryCaptacion.ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
        _queryCaptacion.Open;
        Codigo_Captacion2 := _queryCaptacion.FieldByName('CODIGO_CONTABLE').AsString;

        _queryCaptacion.Close;
        _queryCaptacion.SQL.Clear;
        _queryCaptacion.SQL.Add('SELECT * FROM "cap$tipocaptacion" a WHERE a.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
        _queryCaptacion.ParamByName('ID_TIPO_CAPTACION').AsInteger := 3;
        _queryCaptacion.Open;
        Codigo_Captacion3 := _queryCaptacion.FieldByName('CODIGO_CONTABLE').AsString;

        _queryCaptacion.Close;
        _queryCaptacion.SQL.Clear;
        _queryCaptacion.SQL.Add('SELECT * FROM "cap$tipocaptacion" a WHERE a.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
        _queryCaptacion.ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
        _queryCaptacion.Open;
        Codigo_Captacion4 := _queryCaptacion.FieldByName('CODIGO_CONTABLE').AsString;

        _queryCaptacion.SQL.Clear;
        _queryCaptacion.SQL.Add('SELECT * FROM "cap$tipocaptacion" a WHERE a.ID_FORMA = :ID_FORMA');
        _queryCaptacion.ParamByName('ID_FORMA').AsInteger := 2;
        _queryCaptacion.Open;

        _query.Close;
        _query.SQL.Clear;
        _query.SQL.Add('SELECT * FROM CAP$DIASLIQUIDADOS WHERE ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION AND FECHA_LIQUIDADA = :FECHA_LIQUIDADA');

        while not _queryCaptacion.Eof do
        begin
          edCaptacion.Text := _queryCaptacion.FieldByName('DESCRIPCION').AsString;
          // Inicio Ciclo Captacion
          _tipo := _queryCaptacion.FieldByName('ID_TIPO_CAPTACION').AsInteger;
          //Verificar si hay que liquidar o no el producto
          _query.Close;
          _query.ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipo;
          _query.ParamByName('FECHA_LIQUIDADA').AsDate := _fechaProceso;
          _query.Open;
          if _query.RecordCount > 0 then
          begin
            _queryCaptacion.Next;
            Continue;
          end;
          MinCaptacion := 1;
          MaxCaptacion := 1;
          Application.ProcessMessages;
          Codigo_Captacion := _queryCaptacion.FieldByName('CODIGO_CONTABLE').AsString;
          FechaCorte := _fechaProceso;
          interes := _queryCaptacion.FieldByName('INTERES_EFECTIVO').AsFloat;
          SaldoMinimo := _queryCaptacion.FieldByName('SALDO_MINIMO_PARA_INTERES').AsCurrency;
          cada:= _queryCaptacion.FieldByName('INTERES_CADA').AsInteger;
          TasaN := TasaNominalVencida(interes,30);
          with _queryProcedure do
          begin
              StoredProcName := 'P_CAP_0001';
              ParamByName('ID').AsInteger := _tipo;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Prepare;
                 ExecProc;
                 Screen.Cursor := crDefault;
              except
                 EdEstado.Text := 'Error Localizando Captaciones a Liquidar';
                 Continue;
              end;
              MaxCaptacion := ParamByName('TOTAL').AsInteger;
              if MaxCaptacion = 0 then
              begin
                 edEstado.Text := 'No existen captaciones a las cuales liquidarles intereses';
                 Continue;
              end;
              Close;
// Crear Tabla Temporal
//              frmProgreso.InfoLabel := 'Creando Tabla Temporal';
          end;

          edEstado.Text := 'Iniciando Proceso de Liquidación';

          with _queryALiquidar do
          begin
              SQL.Clear;
              SQL.Add('SELECT ');
              SQL.Add('* FROM P_CAP_0002 (:ID)');
              ParamByName('ID').AsInteger := _tipo;
              try
                 Application.ProcessMessages;
                 Screen.Cursor := crHourGlass;
                 Open;
                 Screen.Cursor := crDefault;
              except
                 EdEstado.Text := 'Error Localizando Captaciones a Liquidar';
                 Continue;
              end;

              progreso.Min  := MinCaptacion;
              progreso.Max := MaxCaptacion;
              progreso.Position:= 1;

              progreso2.Min  := 0;
              progreso2.Max := 1;
              progreso2.Position:= 0;

              Screen.Cursor := crHourGlass;
              CmdCerrar.Enabled := False;
              CDStemp.Open;
              CDStemp.EmptyDataSet;

              while not Eof do
              begin
                Application.ProcessMessages;
                edEstado.Text := 'Liquidando Captacion:' + IntToStr(_tipo) + '-' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Numero := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                progreso.Position := RecNo;
                case cada of
                  1: begin
                       L := InteresDiario(ag,_tipo,numero,digito,FechaCorte,TasaN,SaldoMinimo,DiarioR,TasaR);
                       CDSTemp.Insert;
                       CDStempID_AGENCIA.Value := Ag;
                       CDStempID_TIPO_CAPTACION.Value := _tipo;
                       CDStempNUMERO_CUENTA.Value := Numero;
                       CDStempDIGITO_CUENTA.Value := Digito;
                       CDStempID_IDENTIFICACION.Value := FieldByName('ID_IDENTIFICACION').AsInteger;
                       CDStempID_PERSONA.Value := FieldByName('ID_PERSONA').AsString;
                       CDStempNOMBRE.Value := FieldbyName('PRIMER_APELLIDO').AsString + ' ' +
                                              FieldbyName('SEGUNDO_APELLIDO').AsString + ' ' +
                                              FieldbyName('NOMBRE').AsString;
                       CDStempSALDO_ACTUAL.Value := L.SaldoAFecha;
                       CDStempSALDO_LIQUIDACION.Value := L.SaldoLiquidacion;
                       CDStempCAUSADO.Value := 0;
                       CDStempRETEINTERES.Value := 0;
                       CDStempRETECAUSADO.Value := 0;
                       CDStempINTERES.Value := L.Interes;
                       if not InttoBoolean(FieldByName('RETEFUENTE').AsInteger) then
                          L.Retencion := 0;
                       CDStempRETENCION.Value := L.Retencion;
                       if (L.Interes > 0) then
                         CDStemp.Post
                       else
                         CDStemp.Cancel;
                     end;
                end;
                edCantidad.Value := CDStemp.RecordCount;
                Next;
              end;

              Close;
              Screen.Cursor := crDefault;
              // CmdLiquidar.Enabled := False;
              // CmdVer.Enabled := True;

          end;

          edEstado.Text := 'Proceso de Liquidación Culminado con Exito!';

          // Continuación Ciclo _queryCaptacion
          if edDefinitivo.Checked then
            Aplicar;
          _queryCaptacion.Next;
        end;
        _transaction.Commit;
        CmdCerrar.Enabled := True;

        PostMessage(Handle, WM_CLOSE, 0, 0);
        modalresult := mrCancel;
end;

procedure TfrmLiquidacionYCausacionAuto.ProcesarCertificados(_id_captacion: Integer);
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
                 edEstado.Text := 'No existen captaciones a las cuales liquidarles intereses';
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

procedure TfrmLiquidacionYCausacionAuto.Aplicar;
var TInteres:Currency;
    TRetefuente:Currency;
    TReteCausado:Currency;
    TReteInteres:Currency;
    TCaptacion:Currency;
    TCausado:Currency;
    TresxMil:Currency;
    Total:Currency;
    Codigo_Interes:string;
    Codigo_Retefuente:string;
    Codigo_Causados:string;
    Codigo_TresxMil:string;
    Codigo_Gasto:string;
    Codigo_Gasto3xmil:string;
    Registros:Integer;

    I, WaitCount, Tries:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;

    _queryConsulta : TIBQuery;
    _ibsql1 : TIBSQL;
    _transactionConsulta, _transactionComprobante : TIBTransaction;
begin
        {
        if programado then
        begin
          AplicarProgramado;
          Exit;
        end;
        }

        _queryConsulta := TIBQuery.Create(self);
        _ibsql1 := TIBSQL.Create(self);
        _transactionConsulta := TIBTransaction.Create(self);
        _transactionComprobante := TIBTransaction.Create(self);

        _queryConsulta.Database := dmGeneral.IBDatabase1;
        _transactionConsulta.DefaultDatabase := dmGeneral.IBDatabase1;
        _transactionComprobante.DefaultDatabase := dmGeneral.IBDatabase1;

        _queryConsulta.Transaction := _transactionConsulta;
        _ibsql1.Transaction := _transactionComprobante;

        IBDComprobante.Transaction := _transactionComprobante;
        IBDAuxiliar.Transaction := _transactionComprobante;
        IBPagar.Transaction := _transactionComprobante;

        _transactionConsulta.StartTransaction;

        TInteres := 0;
        TRetefuente := 0;
        TReteCausado := 0;
        TReteInteres := 0;
        TCaptacion := 0;
        TCausado := 0;

        CDStemp.Last;
        CDStemp.First;
        if VarIsNull(CDStempTOTALINTERES.Value) then
          TInteres := 0
        else
          TInteres := CDStempTOTALINTERES.Value;

        if VarIsNull(CDStempTOTALRETENCION.Value) then
          TRetefuente := 0
        else
          TRetefuente := CDStempTOTALRETENCION.Value;

        if VarIsNull(CDStempTOTALRETECAUSADO.Value) then
          TReteCausado := 0
        else
          TReteCausado := CDStempTOTALRETECAUSADO.Value;

        if VarIsNull(CDStempTOTALRETEINTERES.Value) then
          TReteInteres := 0
        else
          TReteInteres := CDStempTOTALRETEINTERES.Value;

        if VarIsNull(CDStempTOTALCAUSADO.Value) then
          TCausado := 0
        else
          TCausado := CDStempTOTALCAUSADO.Value;


        if (TInteres = 0) and (TRetefuente = 0) and (TReteCausado = 0) and (TReteInteres = 0) and (TCaptacion = 0) and (TCausado = 0) then
        begin
// Marcar Dia Liquidado
          with _ibsql1 do
          begin
             if (Transaction.InTransaction) then
             begin
                Transaction.Commit;
             end;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('INSERT INTO CAP$DIASLIQUIDADOS');
             SQL.Add('values (:ID_TIPO_CAPTACION,:FECHA_LIQUIDADA,:HORA_LIQUIDADA,:TIPO_COMPROBANTE, :ID_COMPROBANTE, :LIQUIDADA)');
             ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipo;
             ParamByName('FECHA_LIQUIDADA').AsDate := _fechaProceso;
             ParamByName('HORA_LIQUIDADA').AsTime := Time;
             ParamByName('TIPO_COMPROBANTE').Clear;
             ParamByName('ID_COMPROBANTE').Clear;
             ParamByName('LIQUIDADA').AsInteger := 1;
             try
               ExecQuery;
             except
               edEstado.Text := 'Error Actualizando Fecha, Informe a Sistemas';
             end;
          end;
// Marca Finalizada
        _ibsql1.Transaction.Commit;
           exit;
        end;
        {
        with IBConsulta do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select SUM(INTERES) as TINTERES from ' +Tabla);
           try
             Open;
           except
           end;
           TInteres := FieldByName('TINTERES').AsCurrency;
           Close;
           SQL.Clear;
           SQL.Add('select SUM(RETENCION) as TRETEFUENTE from ' +Tabla);
           try
             Open;
           except
           end;
           TRetefuente := FieldByName('TRETEFUENTE').AsCurrency;
           Close;
           if certificado then
           begin
            Close;
            SQL.Clear;
            SQL.Add('select SUM(CAUSADO) as TCAUSADO from ' +Tabla);
            try
              Open;
            except
            end;
            TCausado := FieldByName('TCAUSADO').AsCurrency;
            Close;
            SQL.Clear;
            SQL.Add('select SUM(RETEINTERES) as TRETEINTERES from' + Tabla);
            try
              Open;
            except
            end;
            TReteInteres := FieldByName('TRETEINTERES').AsCurrency;
            Close;
            SQL.Clear;
            SQL.Add('select SUM(RETECAUSADO) as TRETECAUSADO from' + Tabla);
            try
              Open;
            except
            end;
            TReteCausado := FieldByName('TRETECAUSADO').AsCurrency;
            Close;
          end;

        end;
        }
        with _queryConsulta do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
        end;


        TresxMil := SimpleRoundTo(((TInteres + TCausado)/1000) * 4,0);

        with _queryConsulta do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from CAP$CONTABLE where ');
            SQL.Add('ID_CAPTACION = :"ID_CAPTACION" and ID_CONTABLE = :"ID_CONTABLE"');
            ParamByName('ID_CAPTACION').AsInteger := _tipo;
            ParamByName('ID_CONTABLE').AsInteger := 1;
            Open;
            Codigo_Retefuente := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := _tipo;
            ParamByName('ID_CONTABLE').AsInteger := 2;
            Open;
            Codigo_Interes := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := _tipo;
            ParamByName('ID_CONTABLE').AsInteger := 3;
            Open;
            Codigo_TresxMil := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := _tipo;
            ParamByName('ID_CONTABLE').AsInteger := 5;
            Open;
            Codigo_Gasto := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := _tipo;
            ParamByName('ID_CONTABLE').AsInteger := 30;
            Open;
            Codigo_Gasto3xmil := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            if certificado then begin
            Close;
            ParamByName('ID_CAPTACION').AsInteger := _tipo;
            ParamByName('ID_CONTABLE').AsInteger := 6;
            Open;
            Codigo_Causados := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            end;
        end;

// Buscar Consecutivo
        Comprobante := ObtenerConsecutivo(_ibsql1);
// Fin Consecutivo

        //EdComprobante.Caption := Format('%.7d',[Comprobante]);
        _ibsql1.Transaction.StartTransaction;
        with IBDComprobante do
        begin
           Open;
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
           FieldByName('FECHADIA').AsDateTime := _fechaProceso;
           FieldByName('DESCRIPCION').AsString := 'Liquidación de Intereses en la Fecha ' +
                                                  'Tasa de Liquidación: ' + CurrToStr(TasaN) + ', ' +
                                                  'Saldo Mínimo en cuenta: ' + CurrToStr(SaldoMinimo);
           FieldByName('TOTAL_DEBITO').AsCurrency := TInteres + TRetefuente + TresxMil + TCausado;
           FieldByName('TOTAL_CREDITO').AsCurrency := TInteres + TRetefuente + TresxMil + TCausado;
           FieldByName('ESTADO').AsString := 'O';
           FieldByName('IMPRESO').AsInteger := 1;
           FieldByName('ANULACION').AsString := '';
           FieldByName('ID_EMPLEADO').AsString := DBAlias;
           Post;
        end;

        with IBDAuxiliar do
        begin
           Open;
        // Grabo Retención Crédito
           if TRetefuente > 0 then
            if certificado then
            begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := _fechaProceso;
            FieldByName('CODIGO').AsString := Codigo_Retefuente;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := TReteInteres;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
            end
            else
            begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := _fechaProceso;
            FieldByName('CODIGO').AsString := Codigo_Retefuente;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := TRetefuente;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
            end;
        // Grabo Retención Débito
           if TRetefuente > 0 then
           if certificado then begin
            if TotalCapta2R > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := _fechaProceso;
              FieldByName('CODIGO').AsString := Codigo_Captacion2;
              FieldByName('DEBITO').AsCurrency := TotalCapta2R;
              FieldByName('CREDITO').AsCurrency := 0;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
              Post;
             end;// if TotalCapta2R
            if TotalCapta3R > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := _fechaProceso;
              FieldByName('CODIGO').AsString := Codigo_Captacion3;
              FieldByName('DEBITO').AsCurrency := TotalCapta3R;
              FieldByName('CREDITO').AsCurrency := 0;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
              Post;
             end;// if TotalCapta3R
            if TotalCapta4R > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := _fechaProceso;
              FieldByName('CODIGO').AsString := Codigo_Captacion4;
              FieldByName('DEBITO').AsCurrency := TotalCapta4R;
              FieldByName('CREDITO').AsCurrency := 0;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
              Post;
             end;// if TotalCapta4R
           end // if Certificado
           else
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := _fechaProceso;
            FieldByName('CODIGO').AsString := Codigo_Captacion;
            FieldByName('DEBITO').AsCurrency := TRetefuente;
            FieldByName('CREDITO').AsCurrency := 0;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end;// if TRetefuente
        // Grabo Interés Crédito
           if TInteres > 0 then
           if certificado then begin
            if TotalCapta2 > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := _fechaProceso;
              FieldByName('CODIGO').AsString := Codigo_Captacion2;
              FieldByName('DEBITO').AsCurrency := 0;
              FieldByName('CREDITO').AsCurrency := TotalCapta2;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
              Post;
             end;// if TotalCapta2
            if TotalCapta3 > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := _fechaProceso;
              FieldByName('CODIGO').AsString := Codigo_Captacion3;
              FieldByName('DEBITO').AsCurrency := 0;
              FieldByName('CREDITO').AsCurrency := TotalCapta3;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
              Post;
             end;// if TotalCapta3
            if TotalCapta4 > 0 then
             begin
              Append;
              FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
              FieldByName('ID_AGENCIA').AsInteger := Agencia;
              FieldByName('FECHA').AsDateTime := _fechaProceso;
              FieldByName('CODIGO').AsString := Codigo_Captacion4;
              FieldByName('DEBITO').AsCurrency := 0;
              FieldByName('CREDITO').AsCurrency := TotalCapta4;
              FieldByName('ID_CUENTA').AsInteger :=0;
              FieldByName('ID_COLOCACION').AsString := '';
              FieldByName('ID_IDENTIFICACION').AsInteger := 0;
              FieldByName('ID_PERSONA').AsString := '';
              FieldByName('MONTO_RETENCION').AsCurrency := 0;
              FieldByName('TASA_RETENCION').AsFloat := 0;
              FieldByName('ESTADOAUX').AsString := 'O';
              FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
              Post;
             end; // if TotalCapta4
           end //if Certificado
           else
           begin
            Append;
            FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
            FieldByName('ID_AGENCIA').AsInteger := Agencia;
            FieldByName('FECHA').AsDateTime := _fechaProceso;
            FieldByName('CODIGO').AsString := Codigo_Captacion;
            FieldByName('DEBITO').AsCurrency := 0;
            FieldByName('CREDITO').AsCurrency := TInteres;
            FieldByName('ID_CUENTA').AsInteger :=0;
            FieldByName('ID_COLOCACION').AsString := '';
            FieldByName('ID_IDENTIFICACION').AsInteger := 0;
            FieldByName('ID_PERSONA').AsString := '';
            FieldByName('MONTO_RETENCION').AsCurrency := 0;
            FieldByName('TASA_RETENCION').AsFloat := 0;
            FieldByName('ESTADOAUX').AsString := 'O';
            FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
            Post;
           end;// if TInteres
        // Grabo Interés Débito
           if TInteres > 0 then begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := _fechaProceso;
           FieldByName('CODIGO').AsString := Codigo_Interes;
           FieldByName('DEBITO').AsCurrency := TInteres;
           FieldByName('CREDITO').AsCurrency := 0;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
           Post;
           end;
        // Grabo Causados Crédito
{           if TCausado > 0 then begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := EdFecha.Date;
           FieldByName('CODIGO').AsString := Codigo_Captacion;
           FieldByName('DEBITO').AsCurrency := 0;
           FieldByName('CREDITO').AsCurrency := TCausado;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           Post;
           end;
}
        // Grabo Causado Débito
           if TCausado > 0 then
           if certificado then
           begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := _fechaProceso;
           FieldByName('CODIGO').AsString := Codigo_Causados;
           FieldByName('DEBITO').AsCurrency := TCausado-TReteCausado;
           FieldByName('CREDITO').AsCurrency := 0;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
           Post;
           end
           else
           begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := _fechaProceso;
           FieldByName('CODIGO').AsString := Codigo_Causados;
           FieldByName('DEBITO').AsCurrency := TCausado;
           FieldByName('CREDITO').AsCurrency := 0;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
           Post;
           end;

        // Grabo TresxMil Crédito
           if TresxMil > 0 then begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := _fechaProceso;
           FieldByName('CODIGO').AsString := Codigo_TresxMil;
           FieldByName('DEBITO').AsCurrency := 0;
           FieldByName('CREDITO').AsCurrency := TresxMil;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
           Post;
           end;
        // Grabo TresxMil Débito
           if TresxMil > 0 then begin
           Append;
           FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
           FieldByName('ID_AGENCIA').AsInteger := Agencia;
           FieldByName('FECHA').AsDateTime := _fechaProceso;
           FieldByName('CODIGO').AsString := Codigo_Gasto3xmil;
           FieldByName('DEBITO').AsCurrency := TresxMil;
           FieldByName('CREDITO').AsCurrency := 0;
           FieldByName('ID_CUENTA').AsInteger :=0;
           FieldByName('ID_COLOCACION').AsString := '';
           FieldByName('ID_IDENTIFICACION').AsInteger := 0;
           FieldByName('ID_PERSONA').AsString := '';
           FieldByName('MONTO_RETENCION').AsCurrency := 0;
           FieldByName('TASA_RETENCION').AsFloat := 0;
           FieldByName('ESTADOAUX').AsString := 'O';
           FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
           Post;
           end;
        end;


        CDStemp.Last;
        CDStemp.First;
        //with IBConsulta do
        with CDStemp do
        begin
           Registros := CDStemp.RecordCount;
           progreso2.Min  := 0;
           progreso2.Max := Registros;
           progreso2.Position:= 1;

           while not Eof do
           begin
              Application.ProcessMessages;
              progreso2.Position := RecNo;
              edEstado.Text := CDStempID_TIPO_CAPTACION.AsString + '-' + Format('%.2d',[CDStempID_AGENCIA.Value]) + '-' +
                                        Format('%.7d',[CDStempNUMERO_CUENTA.Value]) + '-' +
                                        IntToStr(CDStempDIGITO_CUENTA.Value);
              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('insert into "cap$extracto" values(');
              IBPagar.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
              IBPagar.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
              IBPagar.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
              IBPagar.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO",:"ID")');
//Grabar Interes en Extracto
              //if FieldByName('INTERES').AsCurrency > 0 then
              if CDStempINTERES.Value > 0 then
              begin
                IBPagar.ParamByName('ID_AGENCIA').AsInteger := CDStempID_AGENCIA.Value;
                IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDStempID_TIPO_CAPTACION.Value;
                IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := CDStempNUMERO_CUENTA.Value;
                IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := CDStempDIGITO_CUENTA.Value;
                IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := _fechaProceso;
                IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                if certificado then
                   IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 15
                else
                   IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 7;
                IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                if certificado then
                  IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha TASA ' + FormatCurr('#0.00%',CDStempTASA_LIQUIDACION.Value)
                else
                  IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha';
                Total := CDStempINTERES.AsCurrency;
                if certificado then
                  Total := Total + CDStempCAUSADO.AsCurrency;
                IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := Total;
                IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                IBPagar.ParamByName('ID').AsInteger := 0;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   edEstado.Text := 'Error Grabando Retención de Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                   IBPagar.Transaction.RollbackRetaining;
                   Exit;
                  end
                except
                  edEstado.Text := 'Error Grabando Intereses de Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                  IBPagar.Transaction.RollbackRetaining;
                  Exit;
                end;
              end;
              IBPagar.Close;
   // If Certificado Grabar en Cuenta de Abono
              if certificado then
                if Total > 0 then
                begin
                  IBPagar.ParamByName('ID_AGENCIA').AsInteger := CDStempID_AGENCIA.AsInteger;
                  IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDStempID_TIPO_CAPTACION_ABONO.AsInteger;
                  IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := CDStempNUMERO_CUENTA_ABONO.AsInteger;
                  IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(CDStempID_TIPO_CAPTACION_ABONO.AsInteger,Format('%.7d',[CDStempNUMERO_CUENTA_ABONO.AsInteger])));
                  IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := _fechaProceso;
                  IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                  IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 15;
                  IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                  IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha ';
                  IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := Total;
                  IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                  try
                    IBPagar.ExecQuery;
                    if IBPagar.RowsAffected < 1 then
                    begin
                     edEstado.Text := 'Error Grabando Intereses de Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA_ABONO.AsInteger]);
                     IBPagar.Transaction.RollbackRetaining;
                     Exit;
                    end
                  except
                    edEstado.Text := 'Error Grabando Intereses de Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA_ABONO.AsInteger]);
                    IBPagar.Transaction.RollbackRetaining;
                    Exit;
                  end;
                IBPagar.Close;
                end;
   // Fin si Certificado
// Grabar Retención en Extracto
              if CDStempRETENCION.AsCurrency > 0 then
              begin
                IBPagar.ParamByName('ID_AGENCIA').AsInteger := CDStempID_AGENCIA.AsInteger;
                IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDStempID_TIPO_CAPTACION.AsInteger;
                IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := CDStempNUMERO_CUENTA.AsInteger;
                IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := CDStempDIGITO_CUENTA.AsInteger;
                IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := _fechaProceso;
                IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                if certificado then
                   IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 16
                else
                   IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 8;
                IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha';
                IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := 0;
                IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := CDStempRETENCION.AsCurrency;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   edEstado.Text := 'Error Grabando Retención de Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                   IBPagar.Transaction.RollbackRetaining;
                   Exit;
                  end
                except
                  edEstado.Text := 'Error Grabando Retención de Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                  IBPagar.Transaction.RollbackRetaining;
                  Exit;
                end;
              end;
              IBPagar.Close;
   // Si Certificado grabar retención en cuenta de abono
              if certificado then
                if CDStempRETENCION.AsCurrency > 0 then
                begin
                  IBPagar.ParamByName('ID_AGENCIA').AsInteger := CDStempID_AGENCIA.AsInteger;
                  IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDStempID_TIPO_CAPTACION_ABONO.AsInteger;
                  IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := CDStempNUMERO_CUENTA_ABONO.AsInteger;
                  IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(CDStempID_TIPO_CAPTACION_ABONO.AsInteger,Format('%.7d',[CDStempNUMERO_CUENTA_ABONO.AsInteger])));
                  IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := _fechaProceso;
                  IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                  IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 16;
                  IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                  IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Liquidación de Intereses en la Fecha';
                  IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := 0;
                  IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := CDStempRETENCION.AsCurrency;
                  try
                    IBPagar.ExecQuery;
                    if IBPagar.RowsAffected < 1 then
                    begin
                     edEstado.Text := 'Error Grabando Retención de Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA_ABONO.AsInteger]);
                     IBPagar.Transaction.Rollback;
                     Exit;
                    end
                  except
                    edEstado.Text := 'Error Grabando Retención de Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA_ABONO.AsInteger]);
                    IBPagar.Transaction.Rollback;
                    Exit;
                  end;
                IBPagar.Close;
                end;
        // fin si certificado
// Actualizar Saldo en Cuenta del Mes

// Grabo Detalle de la Retención
              if CDStempRETENCION.AsCurrency > 0 then
              begin
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('insert into "con$retencion" values(');
              IBPagar.SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"ID_IDENTIFICACION",');
              IBPagar.SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",');
              IBPagar.SQL.Add(':"VALOR_RETENCION")');
              IBPagar.ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := CDStempID_AGENCIA.AsInteger;
              IBPagar.ParamByName('ID_IDENTIFICACION').AsInteger := CDStempID_IDENTIFICACION.AsInteger;
              IBPagar.ParamByName('ID_PERSONA').AsString := CDStempID_PERSONA.AsString;
              IBPagar.ParamByName('MONTO_RETENCION').AsCurrency := CDStempINTERES.AsCurrency;
              IBPagar.ParamByName('TASA_RETENCION').AsFloat := TasaR;
              IBPagar.ParamByName('VALOR_RETENCION').AsCurrency := CDStempRETENCION.AsCurrency;
              try
               IBPagar.ExecQuery;
               if IBPagar.RowsAffected < 1 then
               begin
                IBPagar.Transaction.Rollback;
                edEstado.Text := 'Error Grabando en tabla de retenciones captacion:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                Exit;
               end
              except
                IBPagar.Transaction.Rollback;
                edEstado.Text := 'Error Grabando en tabla de retenciones captacion:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                Exit;
              end;
              IBPagar.Close;
              end;

// En Caso de Certificado, Marcar la tabla de liquidación
            if certificado then
            begin
              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('update "cap$tablaliquidacion"');
              IBPagar.SQL.Add('set PAGADO = 1');
              IBPagar.SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              IBPagar.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" and FECHA_PAGO = :"FECHA_PAGO"');
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := CDStempID_AGENCIA.AsInteger;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDStempID_TIPO_CAPTACION.AsInteger;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := CDStempNUMERO_CUENTA.AsInteger;
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := CDStempDIGITO_CUENTA.AsInteger;
              IBPagar.ParamByName('FECHA_PAGO').AsDate := _fechaProceso;
              try
               IBPagar.ExecQuery;
               if IBPagar.RowsAffected < 1 then
               begin
                IBPagar.Transaction.Rollback;
                edEstado.Text := 'Error Actualizando Tabla de Liquidación Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                Exit;
               end
              except
                IBPagar.Transaction.Rollback;
                edEstado.Text := 'Error Actualizando Tabla de Liquidación Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                Exit;
              end;
              IBPagar.Close;
            end;
// Fin marca tabla de liquidación
// Grabar maestro fecha ultimo pago
              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('update "cap$maestro"');
              IBPagar.SQL.Add('set FECHA_ULTIMO_PAGO = :FECHA');
              IBPagar.SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              IBPagar.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := CDStempID_AGENCIA.AsInteger;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDStempID_TIPO_CAPTACION.AsInteger;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := CDStempNUMERO_CUENTA.AsInteger;
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := CDStempDIGITO_CUENTA.AsInteger;
              IBPagar.ParamByName('FECHA').AsDate := _fechaProceso;
              try
               IBPagar.ExecQuery;
               if IBPagar.RowsAffected < 1 then
               begin
                IBPagar.Transaction.Rollback;
                edEstado.Text := 'Error Actualizando Fecha Ultimo Pago Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                Exit;
               end
              except
                IBPagar.Transaction.Rollback;
                edEstado.Text := 'Error Actualizando Fecha Ultimo Pago Captación:' + Format('%.7d',[CDStempNUMERO_CUENTA.AsInteger]);
                Exit;
              end;

// Fin marca maestro.

              Next;
           end;
        end;

// Marcar Dia Liquidado
        with _ibsql1 do
        begin
             Close;
             SQL.Clear;
             SQL.Add('INSERT INTO CAP$DIASLIQUIDADOS');
             SQL.Add('values (:ID_TIPO_CAPTACION,:FECHA_LIQUIDADA,:HORA_LIQUIDADA,:TIPO_COMPROBANTE, :ID_COMPROBANTE, :LIQUIDADA)');
             ParamByName('ID_TIPO_CAPTACION').AsInteger := _tipo;
             ParamByName('FECHA_LIQUIDADA').AsDate := _fechaProceso;
             ParamByName('HORA_LIQUIDADA').AsTime := Time;
             ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('LIQUIDADA').AsInteger := 1;
             try
               ExecQuery;
             except
               edEstado.Text := 'Error Actualizando Fecha, Informe a Sistemas';
             end;
        end;
// Marca Finalizada
        _ibsql1.Transaction.Commit;
        edEstado.Text := 'Comprobante contable generado con exito!';

end;

procedure TfrmLiquidacionYCausacionAuto.FormShow(Sender: TObject);
begin
        _transaction.StartTransaction;
        _fechaProceso := fFechaActual;
        
end;

procedure TfrmLiquidacionYCausacionAuto.CmdCerrarClick(Sender: TObject);
begin
       Close;
end;

procedure TfrmLiquidacionYCausacionAuto.FormActivate(Sender: TObject);
begin
        ProcesarAhorros;
end;

end.
