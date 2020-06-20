unit UnitDescuentoContractualAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, CommCtrl,
  IBQuery, IBStoredProc, IB, DBClient, IBDatabase, IBCustomDataSet, IBSQL, DB,
  Dialogs, ComCtrls, JvEdit, JvTypedEdit, StdCtrls, DateUtils, Math, Grids,
  DBGrids;

type
  TfrmDescuentoContractualAuto = class(TForm)
    Label1: TLabel;
    edCaptacion: TEdit;
    Label2: TLabel;
    edEstado: TEdit;
    Label3: TLabel;
    edCantidad: TJvIntegerEdit;
    progreso: TProgressBar;
    progreso2: TProgressBar;
    CDSContractual: TClientDataSet;
    CDSContractualID_AGENCIA: TIntegerField;
    CDSContractualID_TIPO_CAPTACION: TIntegerField;
    CDSContractualNUMERO_CUENTA: TIntegerField;
    CDSContractualDIGITO_CUENTA: TIntegerField;
    CDSContractualID_IDENTIFICACION: TIntegerField;
    CDSContractualID_PERSONA: TStringField;
    CDSContractualNOMBRE: TStringField;
    CDSContractualDESCUENTO: TCurrencyField;
    CDSContractualID_TIPO_CAPTACION_D: TIntegerField;
    CDSContractualNUMERO_CUENTA_D: TIntegerField;
    CDSContractualDIGITO_CUENTA_D: TIntegerField;
    CDSContractualESTADO: TStringField;
    CDSContractualFECHA_DESCUENTO: TDateField;
    CDSContractualCUOTA: TStringField;
    CDSContractualDIAS: TIntegerField;
    CdSaldo: TClientDataSet;
    CdSaldoCUENTA: TIntegerField;
    CdSaldoDIGITO: TIntegerField;
    CdSaldoVALOR: TCurrencyField;
    CdSaldoTOTAL: TAggregateField;
    IBPagar: TIBSQL;
    IbComprobante: TIBQuery;
    IbAux: TIBQuery;
    gridContractual: TDBGrid;
    dsContractual: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ProcesarContractual;
    procedure Aplicar;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmDescuentoContractualAuto: TfrmDescuentoContractualAuto;
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
  _tipo: Integer;
  
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitCaptaciones, UnitGlobalesCol, UnitGlobales;

procedure TfrmDescuentoContractualAuto.ProcesarContractual;
var MinCaptacion,MaxCaptacion:Integer;
    Ag,Numero,Digito:Integer;
    AgD,TipoD,NumeroD,DigitoD:Integer;
    FechaCorte:TDate;
    Valor:Currency;
    Cuota:Currency;
    TipoI:string;
    CodTipoI:Integer;
    TipoCuentaAhorros:Integer;
    CuentaAhorros:Integer;
    DigitoCuentaAhorros:Integer;
    SaldoDisponible:Currency;
    DiaDescuento:Integer;
    DiaCorte:Integer;
    FechaDescuento :TDate;
    vDias :Integer;
    vCuota :Currency;
    vSaldo :Currency;
begin
          CdSaldo.CancelUpdates;
          MinCaptacion := 0;
          MaxCaptacion := 0;

          FechaCorte := _fechaProceso;


          Application.ProcessMessages;
          with _queryALiquidar do
          begin
            SQL.Clear;
            SQL.Add('select * from P_CAP_0021 (:ID, :FECHA, :FECHA1)');
            ParamByName('ID').AsInteger := _tipo;
            ParamByName('FECHA').AsDate := FechaCorte;
            ParamByName('FECHA1').AsDate := EncodeDate(YearOf(FechaCorte),MonthOf(FechaCorte),1);
            try
               Application.ProcessMessages;
               Screen.Cursor := crHourGlass;
               Open;
               Last;
               First;
               MaxCaptacion := RecordCount;
               if MaxCaptacion = 0 then
               begin
                 EdEstado.Text := 'No Existen Captaciones a Descontar';
                 PostMessage(Handle, WM_CLOSE, 0, 0);
                 modalresult := mrCancel;
               end;
              Screen.Cursor := crDefault;
            except
                 EdEstado.Text := 'Error Localizando Captaciones a Liquidar';
                        _transaction.Rollback;
                        modalresult := mrCancel;
                        PostMessage(Handle, WM_CLOSE, 0, 0);
            end;

              progreso.Min  := MinCaptacion;
              progreso.Max := MaxCaptacion;
              progreso.Position:= 0;
              while not Eof do
              begin
                progreso.Position := RecNo;              
                Application.ProcessMessages;
                edCaptacion.Text := 'Descontando a Contractual:' + IntToStr(_tipo) + '-' + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) + '-' +
                                         Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + '-' +
                                         IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Numero := FieldByName('NUMERO_CUENTA').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA').AsInteger;
                Valor := FieldByName('VALOR_INICIAL').AsCurrency;
                Cuota := FieldByName('CUOTA').AsCurrency;
                vCuota := ValidaCon(Numero,_tipo,Digito);

                TipoCuentaAhorros := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                CuentaAhorros := FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
                FechaDescuento := FieldByName('FECHA_DESCUENTO').AsDateTime;
                DigitoCuentaAhorros := StrToInt(DigitoControl(TipoCuentaAhorros,FormatCurr('0000000',CuentaAhorros)));
                CDSContractual.Insert;
                CDSContractual.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                CDSContractual.FieldByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                CDSContractual.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                CDSContractual.FieldByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                CDSContractual.FieldByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                CDSContractual.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                CDSContractual.FieldByName('NOMBRE').AsString := FieldByName('PRIMER_APELLIDO').AsString + ' '+
                                                                 FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                                 FieldByName('NOMBRE').AsString;
                CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                CDSContractual.FieldByName('FECHA_DESCUENTO').AsDateTime := FieldByName('FECHA_DESCUENTO').AsDateTime;
                if CuentaAhorros = 0 then
                begin
                   CDSContractual.FieldByName('ID_TIPO_CAPTACION_D').AsInteger := 0;
                   CDSContractual.FieldByName('NUMERO_CUENTA_D').AsInteger := 0;
                   CDSContractual.FieldByName('DIGITO_CUENTA_D').AsInteger := 0;
                   CDSContractual.FieldByName('ESTADO').AsString := 'N';
                end
                else
                begin
                   AgD := Agencia;
                   TipoD := TipoCuentaAhorros;
                   NumeroD := CuentaAhorros;
                   DigitoD := DigitoCuentaAhorros;
                   CDSContractual.FieldByName('ID_TIPO_CAPTACION_D').asinteger := TipoD;
                   CDSContractual.FieldByName('NUMERO_CUENTA_D').AsInteger := NumeroD;
                   CDSContractual.FieldByName('DIGITO_CUENTA_D').AsInteger := DigitoD;
                   _query.Close;
                   _query.SQL.Clear;
                   _query.SQL.Add('select SALDO_DISPONIBLE from SALDO_DISPONIBLE(:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
                   _query.ParamByName('AG').AsInteger := AgD;
                   _query.ParamByName('TP').AsInteger := TipoD;
                   _query.ParamByName('CTA').AsInteger := NumeroD;
                   _query.ParamByName('DG').AsInteger := DigitoD;
                   _query.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                   _query.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                   _query.ParamByName('FECHA2').AsDate := fFechaActual;
                   try
                    vSaldo := 0;
                    with CdSaldo do
                    begin
                      Filtered := False;
                      AggregatesActive := False;
                      Filter := 'CUENTA = ' + IntToStr(NumeroD) + ' and DIGITO = ' + IntToStr(DigitoD);
                      Filtered := True;
                      AggregatesActive := True;
                      try
                        if not VarIsNull(CdSaldoTOTAL.Value) then
                          vSaldo := CdSaldoTOTAL.Value;
                      except
                        vSaldo := 0;
                      end;
                    end;
                    _query.Open;
                    if vCuotasContractual < 3 then
                    begin
                      if _query.RecordCount > 0 then begin
                         //ShowMessage(CurrToStr(IBSQL1.FieldByName('SALDO_DISPONIBLE').AsCurrency) + ' vi=' + CurrToStr(FieldByName('VALOR_INICIAL').AsCurrency)+ ' vs=' + CurrToStr(vSaldo));
                         if _query.FieldByName('SALDO_DISPONIBLE').AsCurrency >= (FieldByName('VALOR_INICIAL').AsCurrency  + vSaldo)then
                          begin
                           CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                           CDSContractual.FieldByName('ESTADO').AsString := 'S';
                           CdSaldo.Append;
                           CdSaldo.FieldValues['CUENTA'] := numerod;
                           CdSaldo.FieldValues['DIGITO'] := digitod;
                           CdSaldo.FieldValues['VALOR'] := FieldByName('VALOR_INICIAL').AsCurrency;
                           CdSaldo.Post;
                          end
                         else
                          begin
                           CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                           CDSContractual.FieldByName('ESTADO').AsString := 'T';
                          end;
                      end
                      else
                      begin
                           CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                           CDSContractual.FieldByName('ESTADO').AsString := 'X';
                      end
                    end
                    else
                    begin
                       CDSContractual.FieldByName('DESCUENTO').AsCurrency := FieldByName('VALOR_INICIAL').AsCurrency;
                       CDSContractual.FieldByName('ESTADO').AsString := 'V';
                    end;
                   except
                        _transaction.Rollback;
                        modalresult := mrCancel;
                        PostMessage(Handle, WM_CLOSE, 0, 0);

                   end;
                  end;
                  vDias := DaysBetween(fFechaActual, FechaDescuento);
                  CDSContractual.FieldValues['DIAS'] := vDias;
                  CDSContractual.FieldValues['CUOTA'] := vCuota;
                  CDSContractual.Post;
                  Next;
              end;
            end;

end;

procedure TfrmDescuentoContractualAuto.FormCreate(Sender: TObject);
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

        IBPagar.Transaction := _transaction;

        _tipo := 5;
end;

procedure TfrmDescuentoContractualAuto.FormActivate(Sender: TObject);
begin
        CDSContractual.Open;
        CDSContractual.EmptyDataSet;
        ProcesarContractual;
        CDSContractual.Filter := 'ESTADO = '+QuotedStr('S');
        CDSContractual.Filtered := True;
        CDSContractual.Last;
        CDSContractual.First;
        edCantidad.Value := CDSContractual.RecordCount;
        if CDSContractual.RecordCount > 0 then
           Aplicar;
        CDSContractual.Close;

        _transaction.Commit;
        // modalresult := mrCancel;
        // PostMessage(Handle, WM_CLOSE, 0, 0);

end;

procedure TfrmDescuentoContractualAuto.FormShow(Sender: TObject);
begin
        _transaction.StartTransaction;
        _fechaProceso := fFechaActual;
end;

procedure TfrmDescuentoContractualAuto.Aplicar;
var Total:Integer;
    Ag:Integer;
    Tipo : Integer;
    Numero:Integer;
    Digito:Integer;
    VrDescuento,GMF:Currency;
    ValorCap2:Currency;
    _dFechaDescuento :TDate;
    ValorCap4:Currency;
    Codigo_GMF:string;
    Codigo_GGMF:string;
    vNuevoPlazo : Integer;
    Lista :TList;
    I :Integer;
    ARecord:PTablaConLiq;
    _queryConsulta : TIBQuery;
    _ibsql1, _ibsql2 : TIBSQL;
    _transactionComprobante : TIBTransaction;
    _tipo: Integer;
begin
        _tipo := 5;

        _queryConsulta := TIBQuery.Create(self);
        _ibsql1 := TIBSQL.Create(self);
        _ibsql2 := TIBSQL.Create(self);
        _transactionComprobante := TIBTransaction.Create(self);


        _transactionComprobante.DefaultDatabase := dmGeneral.IBDatabase1;

        _queryConsulta.Database := dmGeneral.IBDatabase1;        
        _queryConsulta.Transaction := _transaction;
        _ibsql1.Transaction := _transaction;
        _ibsql2.Transaction := _transactionComprobante;

        IBComprobante.Transaction := _transaction;
        IBAux.Transaction := _transaction;
        IBPagar.Transaction := _transaction;


        Empleado;
        VrDescuento:=0;
        ValorCap2 := 0;
        ValorCap4 := 0;
        with CDSContractual do begin
           Filter := 'ESTADO = '+QuotedStr('S');
           Filtered := True;
           Last;
           First;
           Total := RecordCount;
           if Total < 1 then begin
                        _transaction.Rollback;
                        modalresult := mrCancel;
                        PostMessage(Handle, WM_CLOSE, 0, 0);
           end;

           Comprobante := ObtenerConsecutivo(_ibsql2);

           SendMessage (progreso2.Handle, PBM_SETBARCOLOR, 0, clYellow);
           progreso2.Min  := 0;
           progreso2.Max := Total;
           progreso2.Position:= 0;
           while not Eof do
           begin
              Application.ProcessMessages;
              progreso2.Position := RecNo;
              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('insert into "cap$extracto" values(');
              IBPagar.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
              IBPagar.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
              IBPagar.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
              IBPagar.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO",:"ID")');
              if FieldByName('ESTADO').AsString = 'S' then
              begin
                IBPagar.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := _fechaProceso;
                IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
                IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Descuento por Cuota Ahorro Contractual';
                IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := FieldByName('DESCUENTO').AsCurrency;
                IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
                IBPagar.ParamByName('ID').AsInteger := 0;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                      _transaction.Rollback;
                      modalresult := mrCancel;
                      PostMessage(Handle, WM_CLOSE, 0, 0);
                   end;
                  VrDescuento := VrDescuento + FieldByName('DESCUENTO').AsCurrency;
                except
                    _transaction.Rollback;
                    modalresult := mrCancel;
                    PostMessage(Handle, WM_CLOSE, 0, 0);
                end;

                Ag := FieldByName('ID_AGENCIA').AsInteger;
                Numero := FieldByName('NUMERO_CUENTA_D').AsInteger;
                Tipo :=  FieldByName('ID_TIPO_CAPTACION_D').AsInteger;
                Digito := FieldByName('DIGITO_CUENTA_D').AsInteger;
                _dFechaDescuento := FieldByName('FECHA_DESCUENTO').AsDateTime;
                IBPagar.Close;
                IBPagar.ParamByName('ID_AGENCIA').AsInteger := Ag;
                IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := Numero;
                IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := Digito;
                IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDate := _fechaProceso;
                IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
                IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
                IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Descuento por Cuota Ahorro Contractual';
                IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := 0;
                IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := FieldByName('DESCUENTO').AsCurrency;
                IBPagar.ParamByName('ID').AsInteger := 0;
                try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                        _transaction.Rollback;
                        modalresult := mrCancel;
                        PostMessage(Handle, WM_CLOSE, 0, 0);
                  end
                except
                        _transaction.Rollback;
                        modalresult := mrCancel;
                        PostMessage(Handle, WM_CLOSE, 0, 0);
                end;

                case Tipo of
                 2: ValorCap2 := ValorCap2 + FieldByName('DESCUENTO').AsCurrency;
                 4: ValorCap4 := ValorCap4 + FieldByName('DESCUENTO').AsCurrency;
                end;
                if CDSContractualDIAS.Value > 5 then
                begin
                  _ibsql1.Close;
                  _ibsql1.SQL.Clear;
                  _ibsql1.SQL.Add('SELECT ');
                  _ibsql1.SQL.Add('COUNT(*) as TOTAL');
                  _ibsql1.SQL.Add('FROM');
                  _ibsql1.SQL.Add('"cap$tablaliquidacioncon"');
                  _ibsql1.SQL.Add('WHERE');
                  _ibsql1.SQL.Add('(DESCONTADO = 0) AND ');
                  _ibsql1.SQL.Add('(ID_TIPO_CAPTACION = 5) AND ');
                  _ibsql1.SQL.Add('(NUMERO_CUENTA = :NM) AND ');
                  _ibsql1.SQL.Add('(DIGITO_CUENTA = :DG)');
                  _ibsql1.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  _ibsql1.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  _ibsql1.ExecQuery;
                  vNuevoPlazo := _ibsql1.FieldByName('TOTAL').AsInteger * 30;
                  Lista := TablaCon(FieldByName('DESCUENTO').AsCurrency,_fechaProceso,30,vNuevoPlazo,DayOf(_fechaProceso),_fechaProceso);
                  _ibsql1.Close;
                  _ibsql1.SQL.Clear;
                  _ibsql1.SQL.Add('DELETE FROM "cap$tablaliquidacioncon" WHERE DESCONTADO = 0 AND NUMERO_CUENTA = :NM AND DIGITO_CUENTA = :DG AND ID_TIPO_CAPTACION = 5');
                  _ibsql1.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  _ibsql1.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  _ibsql1.ExecQuery;
                  _ibsql1.SQL.Clear;
                  _ibsql1.SQL.Add('INSERT into "cap$tablaliquidacioncon" values(');
                  _ibsql1.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                  _ibsql1.SQL.Add(':"FECHA_DESCUENTO",:"VALOR",:"DESCONTADO")');
                  _ibsql1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  _ibsql1.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
                  _ibsql1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  _ibsql1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  for i := 0 to Lista.Count - 1 do
                  begin
                     ARecord := Lista.Items[i];
                     _ibsql1.ParamByName('FECHA_DESCUENTO').AsDate := ARecord^.FechaDescuento;
                     _ibsql1.ParamByName('VALOR').AsCurrency := ARecord^.Valor;
                     _ibsql1.ParamByName('DESCONTADO').AsInteger := BooleanoToInt(ARecord^.Descontado);
                     try
                        _ibsql1.ExecQuery;
                        Dispose(ARecord);
                     except
                        _transaction.Rollback;
                        modalresult := mrCancel;
                        PostMessage(Handle, WM_CLOSE, 0, 0);
                     end;
                  end;
                  Lista.Free;
                  _ibsql1.Close;
                  _ibsql1.SQL.Clear;
                  _ibsql1.SQL.Add('INSERT INTO "cap$controlcon" values(:ID_AGENCIA,:ID_TIPO_CAPTACION,');
                  _ibsql1.SQL.Add(':NUMERO_CUENTA,:DIGITO_CUENTA,:FECHA_ANTERIOR,:FECHA_ACTUAL,');
                  _ibsql1.SQL.Add(':C_VENCIDA,:PLAZO_ACTUAL,:ID_EMPLEADO,:HORA,:DIA)');
                  _ibsql1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  _ibsql1.ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
                  _ibsql1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  _ibsql1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  _ibsql1.ParamByName('FECHA_ANTERIOR').AsDate := FieldByName('FECHA_DESCUENTO').AsDateTime;
                  _ibsql1.ParamByName('FECHA_ACTUAL').AsDate := _fechaProceso;
                  _ibsql1.ParamByName('C_VENCIDA').AsInteger := FieldByName('CUOTA').AsInteger;
                  _ibsql1.ParamByName('PLAZO_ACTUAL').AsInteger := vNuevoPlazo;
                  _ibsql1.ParamByName('ID_EMPLEADO').AsString := DBAlias;
                  _ibsql1.ParamByName('HORA').AsTime := Time;
                  _ibsql1.ParamByName('DIA').AsInteger := FieldByName('DIAS').AsInteger;
                  _ibsql1.ExecQuery;
                  _ibsql1.Close;
                  _ibsql1.SQL.Clear;
                  _ibsql1.SQL.Add('UPDATE "cap$maestro" SET FECHA_VENCIMIENTO_PRORROGA = :FECHA WHERE ID_TIPO_CAPTACION = 5 AND NUMERO_CUENTA = :NM AND DIGITO_CUENTA = :DG');
                  _ibsql1.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  _ibsql1.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  _ibsql1.ParamByName('FECHA').AsDate := CalculoFecha(_fechaProceso,vNuevoPlazo);
                  _ibsql1.ExecQuery;

                end;
//                else
//                begin
                  _ibsql1.Close;
                  _ibsql1.SQL.Clear;
                  _ibsql1.SQL.Add('update "cap$tablaliquidacioncon" set DESCONTADO = 1 where');
                  _ibsql1.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                  _ibsql1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
                  _ibsql1.SQL.Add('FECHA_DESCUENTO = :FECHA_DESCUENTO');
                  _ibsql1.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                  _ibsql1.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  _ibsql1.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  _ibsql1.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  _ibsql1.ParamByName('FECHA_DESCUENTO').AsDate := _dFechaDescuento;
                  try
                   _ibsql1.ExecQuery;
                   if _ibsql1.RowsAffected < 1 then
                    begin
                     //MessageDlg('Error Marcando Cuenta:'+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]),mtError,[mbcancel],0);
                        _transaction.Rollback;
                        modalresult := mrCancel;
                        PostMessage(Handle, WM_CLOSE, 0, 0);                     
                    end;
                  except
                        _transaction.Rollback;
                        modalresult := mrCancel;
                        PostMessage(Handle, WM_CLOSE, 0, 0);
                  end;
//                end;// FIN DEL VALIDA DIAS
              end;
              Next;
            end;
           end;

        GMF := SimpleRoundTo((VrDescuento / 1000) * 4,0);

        with _queryConsulta do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from CAP$CONTABLE where ');
            SQL.Add('ID_CAPTACION = :"ID_CAPTACION" and ID_CONTABLE = :"ID_CONTABLE"');
            ParamByName('ID_CAPTACION').AsInteger := _tipo;
            ParamByName('ID_CONTABLE').AsInteger := 3;
            Open;
            Codigo_GMF := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
            ParamByName('ID_CAPTACION').AsInteger := _tipo;
            ParamByName('ID_CONTABLE').AsInteger := 4;
            Open;
            Codigo_GGMF := FieldByName('CODIGO_CONTABLE').AsString;
            Close;
        end;

        with IbComprobante do
        begin
           Close;
           ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
           ParamByName('FECHADIA').AsDateTime := _fechaProceso;
           ParamByName('DESCRIPCION').AsString := 'Descuento Ahorro Contractual';
           ParamByName('TOTAL_DEBITO').AsCurrency := VrDescuento + GMF;
           ParamByName('TOTAL_CREDITO').AsCurrency := VrDescuento + GMF;
           ParamByName('ESTADO').AsString := 'O';
           ParamByName('IMPRESO').AsInteger := 1;
           ParamByName('ANULACION').AsString := '';
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ExecSQL;
        end;

        with ibAux  do
        begin
           Close;
           if VrDescuento > 0 then
           begin
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := _fechaProceso;
             ParamByName('CODIGO').AsString := Codigo_Captacion;
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := VrDescuento;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
             ExecSQL;
           if ValorCap2 > 0 then
           begin
             Close;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := _fechaProceso;
             ParamByName('CODIGO').AsString := Codigo_Captacion2;
             ParamByName('DEBITO').AsCurrency := ValorCap2;
             ParamByName('CREDITO').AsCurrency := 0 ;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
             ExecSQL;
           end;

           if ValorCap4 > 0 then
           begin
             Close;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := _fechaProceso;
             ParamByName('CODIGO').AsString := Codigo_Captacion4;
             ParamByName('DEBITO').AsCurrency := ValorCap4;
             ParamByName('CREDITO').AsCurrency := 0 ;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
             ExecSQL;
           end;
           Close;
           ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('FECHA').AsDateTime := _fechaProceso;
           ParamByName('CODIGO').AsString := Codigo_GMF;
           ParamByName('DEBITO').AsCurrency := 0;
           ParamByName('CREDITO').AsCurrency := GMF;
           ParamByName('ID_CUENTA').AsInteger :=0;
           ParamByName('ID_COLOCACION').Clear;
           ParamByName('ID_IDENTIFICACION').AsInteger := 0;
           ParamByName('ID_PERSONA').Clear;
           ParamByName('MONTO_RETENCION').AsCurrency := 0;
           ParamByName('TASA_RETENCION').AsFloat := 0;
           ParamByName('ESTADOAUX').AsString := 'O';
           ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
           ExecSQL;

           Close;
           ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('FECHA').AsDateTime := _fechaProceso;
           ParamByName('CODIGO').AsString := Codigo_GGMF;
           ParamByName('DEBITO').AsCurrency := GMF;
           ParamByName('CREDITO').AsCurrency := 0;
           ParamByName('ID_CUENTA').AsInteger :=0;
           ParamByName('ID_COLOCACION').Clear;
           ParamByName('ID_IDENTIFICACION').AsInteger := 0;
           ParamByName('ID_PERSONA').Clear;
           ParamByName('MONTO_RETENCION').AsCurrency := 0;
           ParamByName('TASA_RETENCION').AsFloat := 0;
           ParamByName('ESTADOAUX').AsString := 'O';
           ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
           ExecSQL;
           end;
        end;

end;

end.
