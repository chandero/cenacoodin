unit UnitMuestroLiquidacionColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls, DateUtils,
  XStringGrid, pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery, Mask,
  IBSQL, Math, IBDatabase, DBClient, StrUtils; 

type
  TfrmMuestroLiquidacionColocacion = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    HeaderControl1: THeaderControl;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdInforme: TBitBtn;
    Grid: TXStringGrid;
    EdCapital: TStaticText;
    EdCausado: TStaticText;
    EdCorriente: TStaticText;
    EdAnticipado: TStaticText;
    EdDevuelto: TStaticText;
    EdVencido: TStaticText;
    Label7: TLabel;
    EdTotal: TStaticText;
    EdDCausado: TStaticText;
    EdDCorriente: TStaticText;
    EdDAnticipado: TStaticText;
    EdDDevuelto: TStaticText;
    EdDVencido: TStaticText;
    IBQuery: TIBQuery;
    BtnCerrar: TBitBtn;
    Label9: TLabel;
    EdNocomprobante: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    EdSaldoAnterior: TStaticText;
    Label12: TLabel;
    EdPagoxcliente: TStaticText;
    Label13: TLabel;
    EdSeguro: TStaticText;
    Label14: TLabel;
    Label15: TLabel;
    EdOtrosIngresos: TStaticText;
    EdNuevoSaldo: TStaticText;
    Label8: TLabel;
    Label16: TLabel;
    EdOperacion: TStaticText;
    IBQuery1: TIBQuery;
    EditCellEditor1: TEditCellEditor;
    EditCellEditor2: TEditCellEditor;
    IBQuery2: TIBQuery;
    EdHonorarios: TMemo;
    EdCuotas: TStaticText;
    Label17: TLabel;
    IBSQL1: TIBSQL;
    IBCodigo: TIBQuery;
    IBInforme: TClientDataSet;
    IBInformeCUOTA: TIntegerField;
    IBInformeCODIGO: TStringField;
    IBInformeNOMBRE: TStringField;
    IBInformeID_AGENCIA: TIntegerField;
    IBInformeFECHA_INICIAL: TDateField;
    IBInformeFECHA_FINAL: TDateField;
    IBInformeDIAS: TIntegerField;
    IBInformeTASA: TFloatField;
    IBInformeDEBITO: TCurrencyField;
    IBInformeCREDITO: TCurrencyField;
    IBTransaction2: TIBTransaction;
    IBCambioEstado: TIBSQL;
    Report: TprTxReport;
    procedure FormShow(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdInformeClick(Sender: TObject);
    procedure EdNocomprobanteExit(Sender: TObject);
    procedure EdhonorariosExit(Sender: TObject);
    procedure EdhonorariosKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCerrarClick(Sender: TObject);
    procedure EdNocomprobanteKeyPress(Sender: TObject; var Key: Char);
    procedure GridSelectCell(Sender: TObject;
    ACol, ARow: Integer; var CanSelect: Boolean);
    procedure GridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure EdHonorarios1Exit(Sender: TObject);
    procedure EdHonorarios1KeyPress(Sender: TObject; var Key: Char);
    procedure EdHonorariosEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
  private
    MyLista :TList;
    MyColocacion:string;
    MyProximaCuota:TDate;
    MyFechaCorte:TDate;
    MyAsociado:string;
    MyNuevoSaldo:Currency;
    MyInteresesHasta:TDate;
    MyCapitalHasta:TDate;
    MyNumeroCuenta:Integer;
    MyDigitoCuenta:Integer;
    MyTipoId:Integer;
    MyNumeroId:string;
    MyTotalLiquidacion:Currency;
    MyDiasProrrogados:Integer;
    MyNuevoEstado:Integer;
    MyAplicaGravamen:Boolean;
    MyAbonoExtracto:Currency;
    MyRetiroExtracto:Currency;
    MyBaseGMF:Currency;
    MyEstadoActual:Integer;
    MyNacional:Boolean;
    MyFechaConsignacion:TDate;
    MyCodigoBanco:string;
    MyDiasCobradosPeriodoGracia: Integer;
    MyIdPeriodoGracia: Integer;
    procedure Empleado;
    function BuscarCodigoPuc(Codigo: String): string;
    procedure Grabarextracto;
    procedure GrabarTablaLiquidacion;
    procedure MostrarFormulario;
    procedure VerificacionCambioEstado;
    { Private declarations }
  public
    property Lista:TList read MyLista Write MyLista;
    property Colocacion:string read MyColocacion Write MyColocacion;
    property ProximaCuota:TDate read MyProximaCuota Write MyProximaCuota;
    property FechaCorte:TDate read MyFechaCorte Write MyFechaCorte;
    property Asociado:string read MyAsociado Write MyAsociado;
    property NuevoSaldo:Currency read MyNuevoSaldo Write MyNuevoSaldo;
    property InteresesHasta:TDate read MyInteresesHasta Write MyInteresesHasta;
    property CapitalHasta:TDate read MyCapitalHasta Write MyCapitalHasta;
    property NumeroCuenta:Integer read MyNumeroCuenta Write MyNumeroCuenta;
    property DigitoCuenta:Integer read MyDigitoCuenta Write MyDigitoCuenta;
    property TipoId :Integer read MyTipoId Write MyTipoId;
    property NumeroId:string read MyNumeroId Write MyNumeroId;
    property TotalLiquidacion:Currency read MyTotalLiquidacion Write MyTotalLiquidacion;
    property DiasProrrogados:Integer read MyDiasProrrogados Write MyDiasProrrogados;
    property NuevoEstado:Integer read MyNuevoEstado Write MyNuevoEstado;
    property AplicaGravamen:Boolean  read MyAplicaGravamen Write MyAplicaGravamen;
    property AbonoExtracto:Currency read MyAbonoExtracto Write MyAbonoExtracto;
    property RetiroExtracto:Currency read MyRetiroExtracto Write MyRetiroExtracto;
    property BaseGMF:Currency read MyBaseGMF Write MyBaseGMF;
    property EstadoActual:Integer read MyEstadoActual Write MyEstadoActual;
    property Nacional:Boolean read MyNacional Write MyNacional;
    property FechaConsignacion:TDate read MyFechaConsignacion Write MyFechaConsignacion;
    property CodigoBanco:string read MyCodigoBanco Write MyCodigoBanco;
    property DiasCobradosPeriodoGracia: Integer Read MyDiasCobradosPeriodoGracia Write MyDiasCobradosPeriodoGracia;
    property IdPeriodoGracia: Integer Read MyIdPeriodoGracia Write MyIdPeriodoGracia;
    { Public declarations }
  end;

var
  frmMuestroLiquidacionColocacion: TfrmMuestroLiquidacionColocacion;
  vNoComprobante : string;
  vTipoOperacion : integer;
  vseguro        : currency;
  vpagxcliente   : currency;
  vhonorarios    : currency;
  votrospagos    : currency;
  vCuotaNo       : Integer;
  Capital   :Currency;
  Causado   :Currency;
  DiasCausado:Integer;
  Corriente :Currency;
  DiasCorriente:Integer;
  Vencido   :Currency;
  DiasVencido:Integer;
  Anticipado:Currency;
  DiasAnticipado:Integer;
  Devuelto  :Currency;
  DiasDevuelto:Integer;
  Total:Currency;
  saldo : currency;
  abono_capital : currency;
  abono_cxc : currency;
  abono_servicios : currency;
  abono_anticipado: currency;
  abono_mora : currency;
  Cuota_anterior : integer;
  cambio : boolean;
  DirInt : integer;
  debito : string;
  credito : string;
  honorarios : string;
  separadormiles : char;
  Consecutivo : Integer;  
  implementation

uses UnitdmColocacion,UnitdmGeneral, UnitVistaPreliminar,
     UnitGlobalesCol, UnitGlobales;

{$R *.dfm}

procedure TfrmMuestroLiquidacionColocacion.FormShow(Sender: TObject);
begin
        separadormiles := ThousandSeparator;
        ThousandSeparator := ',';
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;
        MostrarFormulario;
end;

procedure TfrmMuestroLiquidacionColocacion.MostrarFormulario;
var AF:PCuotasLiq;
    I:Integer;
begin
        with Grid do
        begin
          if MyLista.Count > 0 then
             RowCount := MyLista.Count + 1
          else
             RowCount := 2;
        end;
        Capital    := 0;
        Causado    := 0;
        Corriente  := 0;
        Vencido    := 0;
        Anticipado := 0;
        Devuelto   := 0;
        DiasCausado:=0;
        DiasCorriente:=0;
        DiasVencido:=0;
        DiasAnticipado:=0;
        DiasDevuelto:=0;
        vTipoOperacion := 1;

        for I := 0 to (MyLista.Count - 1) do
         begin
           Application.ProcessMessages;
           AF := MyLista.Items[I];
           Grid.Cells[0,I+1] := FormatCurr('000',AF^.CuotaNumero);
           Grid.Cells[1,I+1] := AF^.CodigoPuc;
           Grid.Cells[2,I+1] := BuscarCodigoPuc(AF^.CodigoPuc);
           Grid.Cells[3,I+1] := DateToStr(AF^.FechaInicial);
           Grid.Cells[4,I+1] := DateToStr(AF^.FechaFinal);
           Grid.Cells[5,I+1] := IntToStr(AF^.Dias);
           Grid.Cells[6,I+1] := FormatCurr('#0.00',AF^.Tasa);
           Grid.Cells[7,I+1] := FormatCurr('#,##',AF^.Debito);
           Grid.Cells[8,I+1] := FormatCurr('#,##',AF^.Credito);



           if AF^.EsCapital then
             begin
               abono_capital := AF^.Credito;
               Capital := Capital + AF^.Credito;
             end;

           if AF^.EsCausado then
             begin
               abono_cxc := AF^.Credito;
               Causado := Causado + AF^.Credito;
               DiasCausado := DiasCausado + AF^.Dias;
             end;

           if AF^.EsCorriente then
             begin
               abono_servicios := AF^.Credito;
               Corriente := Corriente + AF^.Credito;
               DiasCorriente := DiasCorriente + AF^.Dias;
             end;

           if AF^.EsVencido then
             begin
               abono_mora := AF^.Credito;
               Vencido := Vencido + AF^.Credito;
               DiasVencido := DiasVencido + AF^.Dias;
             end;

           if AF^.EsAnticipado then
             begin
               abono_anticipado := AF^.Credito;
               Anticipado := Anticipado + AF^.Credito;
               DiasAnticipado := DiasAnticipado + AF^.Dias;
             end;

           if AF^.EsDevuelto then
             if AF^.Debito <> 0 then
               begin
                 Devuelto := Devuelto + AF^.Debito;
                 DiasDevuelto := DiasDevuelto + AF^.Dias;
               end;
           end;

           with IBQuery do
           begin
             sql.Clear;
             sql.Add('Select CUOTA_NUMERO from "col$tablaliquidacion"');
             sql.Add(' where "col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
             sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and ');
             Sql.Add('"col$tablaliquidacion"."PAGADA" = 0 ');
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_COLOCACION').AsString := Colocacion;
             Open;
             vCuotaNo := FieldByName('CUOTA_NUMERO').AsInteger;
             Close;
           end;

           EdSaldoAnterior.Caption := FormatCurr('#,#0',vSaldoActual);
           EdCapital.Caption:= FormatCurr('#,#0',Capital);
           EdCausado.Caption := FormatCurr('#,#0',Causado);
           EdDCausado.Caption := IntToStr(DiasCausado);
           EdCorriente.Caption := FormatCurr('#,#0',Corriente);
           EdDCorriente.Caption := IntToStr(DiasCorriente);
           EdVencido.Caption   := FormatCurr('#,#0',Vencido);
           EdDVencido.Caption := IntToStr(DiasVencido);
           EdAnticipado.Caption := FormatCurr('#,#0',Anticipado);
           EdDAnticipado.Caption := IntToStr(DiasAnticipado);
           EdDevuelto.Caption := FormatCurr('#,#0',Devuelto);
           EdDDevuelto.Caption := IntToStr(DiasDevuelto);
           vseguro := 0;
           EdSeguro.Caption := FormatCurr('#,#0',vseguro);
           vpagxcliente := 0;
           EdpagoxCliente.Caption := FormatCurr('#,#0',vpagxcliente);
           votrospagos := 0;
           EdOtrosIngresos.Caption := FormatCurr('#,#0',votrospagos);
           EdHonorarios.Text := honorarios;
           saldo := vSaldoactual - Capital;
           EdNuevoSaldo.Caption := FormatCurr('#,#0',Nuevosaldo);
           EdCuotas.Caption := inttostr(Cuotas);
           Total := vseguro + vpagxcliente + vhonorarios + votrospagos + Capital + Causado + Corriente + Vencido + Anticipado-Devuelto;
           EdTotal.Caption := FormatCurr('#,#0',Total);
           CmdInforme.Enabled := True;
           CmdAceptar.Enabled := true;
end;

function TfrmMuestroLiquidacionColocacion.BuscarCodigoPuc(Codigo: String): String;
begin
        with dmColocacion.IBSQL do
        begin
            SQL.Clear;
            SQL.Add('select NOMBRE from CON$PUC where ');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and CODIGO = :"CODIGO" ');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('CODIGO').AsString := Codigo;
            ExecQuery;
            if RecordCount = 0 then
               Result := 'CODIGO NO EXISTE'
            else
               Result := FieldByName('NOMBRE').AsString;
            Close;
        end;
end;


procedure TfrmMuestroLiquidacionColocacion.CmdAceptarClick(
  Sender: TObject);
var
I,J : integer;
AR:PCuotasLiq;
TotalDebitoRecibo : Currency;
TotalCreditoRecibo : Currency;
Consec:string;
MyCuotasLiq:TCuotasLiq;
DescImpuesto : Currency;
CodigoAhorros,CodigoCapital:string;
begin
  CmdAceptar.Enabled := False;
  Application.ProcessMessages;
if MessageDlg('Seguro de Realizar el Abono?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
  CmdAceptar.Enabled := False;
  Application.ProcessMessages;
  TotalDebitoRecibo := 0;
  TotalCreditoRecibo := 0;
  for I:=0 to Lista.Count - 1 do
   begin
     Application.ProcessMessages;
     AR := Lista.Items[I];
     TotalDebitoRecibo := TotalDebitoRecibo + AR^.Debito;
     TotalCreditoRecibo := TotalCreditoRecibo + AR^.Credito;
   end;
  if not (TotalDebitoRecibo = TotalCreditoRecibo) then
   begin
     MessageDlg('La Nota Contable está Descuadrada' + #10 + #13 +
                       'Revise los Valores',mtError,[mbOk],0);
     Exit;
     Grid.SetFocus;
   end
  else
   begin
    abono_capital := 0;
    abono_cxc := 0;
    abono_servicios := 0;
    abono_mora := 0;
    abono_anticipado := 0;
    Cuota_anterior := 0;
    cambio := false;

///**Genero el consecutivo
    Consec := FormatCurr('00000000',ObtenerConsecutivo(IBSQL1));
    vNoComprobante := Consec;
    EdNoComprobante.Text := Consec;
    dmGeneral.IBTransaction1.StartTransaction;

    with IBQuery do
     try
      for J := 0 to Lista.Count - 1 do
       begin
         AR := Lista.Items[J];
         if AR^.CuotaNumero <> Cuota_anterior then
           if cambio = False then
              cambio := True
           else
            begin
              grabarextracto;
              grabartablaliquidacion;
            end;
         Cuota_anterior := AR^.CuotaNumero;
         if AR^.EsCapital then
            abono_capital := abono_capital + AR^.Credito;
         if AR^.EsCausado then
            abono_cxc := abono_cxc + AR^.Credito;
         if AR^.EsCorriente then
            abono_servicios := abono_servicios + AR^.Credito;
         if AR^.EsVencido then
            abono_mora := abono_mora + AR^.Credito;
         if AR^.EsAnticipado then
            abono_anticipado := abono_anticipado + AR^.Credito;
       end;

      grabarextracto;
      grabartablaliquidacion;

      SQL.Clear;
      SQL.Add('insert into "col$extractodet" values (');
      SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
      SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
      SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
      if  Lista.Count > 0 then
       for I := 0 to Lista.Count -1 do
        begin
          Application.ProcessMessages;
          AR := Lista.Items[I];
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger:= strtoint(vNocomprobante);
          ParamByName('ID_COLOCACION').AsString := colocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
          ParamByName('HORA_EXTRACTO').AsDateTime := fHoraActual;
          ParamByName('CODIGO_PUC').AsString := AR^.CodigoPuc;
          ParamByName('FECHA_INICIAL').AsDate := AR^.FechaInicial;
          ParamByName('FECHA_FINAL').AsDate := AR^.FechaFinal;
          ParamByName('DIAS_APLICADOS').AsInteger := AR^.Dias;
          ParamByName('TASA_LIQUIDACION').AsFloat := AR^.Tasa;
          ParamByName('VALOR_DEBITO').AsCurrency := AR^.Debito;
          ParamByName('VALOR_CREDITO').AsCurrency := AR^.Credito;
          ExecSql;
          Close;
        end;

      sql.Clear;
      sql.Add('update "col$colocacion" set ');
      sql.Add('"col$colocacion"."ABONOS_CAPITAL" = "col$colocacion"."ABONOS_CAPITAL" + :"ABONOS_CAPITAL",');
      sql.Add('"col$colocacion"."FECHA_CAPITAL" =:"FECHA_CAPITAL",');
      sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES",');
      SQL.Add('"col$colocacion".DIAS_PRORROGADOS = DIAS_PRORROGADOS + :"DIAS_PRORROGADOS"');
//      SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');
      sql.Add(' where ');
      sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
      sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
      ParamByName('ID_AGENCIA').AsInteger := agencia;
      ParamByName('ID_COLOCACION').AsString := colocacion;
      ParamByName('ABONOS_CAPITAL').AsCurrency := Capital;
      ParamByName('FECHA_CAPITAL').AsDate := CapitalHasta;
      ParamByName('FECHA_INTERES').AsDate := InteresesHasta;
      ParamByName('DIAS_PRORROGADOS').AsInteger := MyDiasProrrogados;
//      ParamByName('ID_ESTADO_COLOCACION').AsInteger := NuevoEstado;
      ExecSql;
      Close;

      /// Actualizar DiasCobrados Periodo Gracias
      SQL.Clear;
      SQL.Add('UPDATE COL_PERIODO_GRACIA SET DIAS_COBRADOS = :DIAS_COBRADOS WHERE ID = :ID');
      ParamByName('DIAS_COBRADOS').AsInteger := MyDiasCobradosPeriodoGracia;
      ParamByName('ID').AsInteger := MyIdPeriodoGracia;
      ExecSQL;
      Close;


      if not AplicaGravamen then begin
        DescImpuesto := SimpleRoundTo((BaseGMF/1000) * 4,0);
        New(AR);
        AR^.CuotaNumero := 0;
        AR^.CodigoPuc   := '523050000000000000'{YA ES NIIF};
        AR^.FechaInicial := fFechaActual;
        AR^.FechaFinal   := fFechaActual;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := DescImpuesto;
        AR^.Credito      := 0;
        AR^.EsCapital := False;
        AR^.EsCausado := False;
        AR^.EsCorriente := False;
        AR^.EsVencido := False;
        AR^.EsAnticipado := False;
        AR^.EsDevuelto := False;
        if (AR^.Debito <> 0) or
           (AR^.Credito <> 0) then
            Lista.Add(AR);

        New(AR);
        AR^.CuotaNumero := 0;
        AR^.CodigoPuc   := '243005000000000000'{YA ES NIIF};
        AR^.FechaInicial := fFechaActual;
        AR^.FechaFinal   := fFechaActual;
        AR^.Dias         := 0;
        AR^.Tasa         := 0;
        AR^.Debito       := 0;
        AR^.Credito      := DescImpuesto;
        AR^.EsCapital := False;
        AR^.EsCausado := False;
        AR^.EsCorriente := False;
        AR^.EsVencido := False;
        AR^.EsAnticipado := False;
        AR^.EsDevuelto := False;
        if (AR^.Debito <> 0) or
           (AR^.Credito <> 0) then
            Lista.Add(AR);

        TotalDebitoRecibo := TotalDebitoRecibo + DescImpuesto;
        TotalCreditoRecibo := TotalCreditoRecibo + DescImpuesto;
      end;

      //**Genero el comprobante
      with IBQuery do
       begin
         sql.Clear;
         sql.Add('insert into CON$COMPROBANTE (CON$COMPROBANTE."ID_COMPROBANTE",');
         sql.Add('CON$COMPROBANTE."FECHADIA", CON$COMPROBANTE."TIPO_COMPROBANTE",');
         sql.Add('CON$COMPROBANTE."ID_AGENCIA", CON$COMPROBANTE."DESCRIPCION",');
         sql.Add('CON$COMPROBANTE."TOTAL_DEBITO", CON$COMPROBANTE."TOTAL_CREDITO",');
         sql.Add('CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO",');
         sql.Add('CON$COMPROBANTE."ANULACION", CON$COMPROBANTE."ID_EMPLEADO") ');
         sql.Add('values (');
         sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
         sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
         sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
         ParamByName('ID_COMPROBANTE').AsString:= vNoComprobante;
         ParamByname('FECHADIA').AsDate := fFechaActual;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
         if Nacional then
           ParamByName('DESCRIPCION').AsString := 'Descuento de Cartera por Pagar? No.' + Colocacion + ' ' + 'Consig. Nal' + ' ' + DateToStr(FechaConsignacion)
         else
           ParamByName('DESCRIPCION').AsString := 'Descuento de Cartera por Pagar? No.' + Colocacion;
         ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebitoRecibo;
         ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCreditoRecibo;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByname('ANULACION').asstring := '';
         ParamByName('IMPRESO').AsInteger  := 1;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ExecSQL;
         Close;

         for I := 0 to Lista.Count -1 do
          begin
            Application.ProcessMessages;
            AR := Lista.Items[I];
            SQL.Clear;
            SQL.Add('insert into CON$AUXILIAR values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
            ParamByName('ID_COMPROBANTE').AsString := vNoComprobante;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('CODIGO').AsString := AR^.CodigoPuc;
            ParamByName('DEBITO').AsCurrency := ar^.Debito;
            ParamByName('CREDITO').AsCurrency := ar^.Credito;
            if LeftStr(AR^.CodigoPuc,6) = '210505' then
              ParamByName('ID_CUENTA').AsInteger := NumeroCuenta
            else
              ParamByName('ID_CUENTA').AsInteger := 0;
            if LeftStr(AR^.CodigoPuc,2) = '14' then
              ParamByName('ID_COLOCACION').AsString := Colocacion
            else
              ParamByName('ID_COLOCACION').AsString := '';
            ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
            ParamByName('ID_PERSONA').AsString := NumeroId;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
            ExecSQL;
           end;
       end;
//**Actualizo extracto y saldos mes
    if AbonoExtracto > 0  then begin
      with IBQuery1 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('insert into "cap$extracto" values(');
         SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
         SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
         SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
         SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO",:"ID")');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
         ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
         ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
         ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
         ParamByName('HORA_MOVIMIENTO').AsTime := fHoraActual;
         ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
         ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vNoComprobante;
         ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'CONSIG. NAL DTO CARTERA COL. No.' + colocacion;
         ParamByName('VALOR_DEBITO').AsCurrency := AbonoExtracto;
         ParamByName('VALOR_CREDITO').AsCurrency := 0;
         ParamByName('ID').AsInteger := 0;
         try
          ExecSQL;
          if RowsAffected < 1 then
            begin
              MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
              Exit;
            end;
         except
            MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
            Exit;
         end; // del try
       end;
    end;

    if RetiroExtracto > 0  then begin
      with IBQuery1 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('insert into "cap$extracto" values(');
         SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
         SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
         SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
         SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO",:"ID")');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
         ParamByName('NUMERO_CUENTA').AsInteger := NumeroCuenta;
         ParamByName('DIGITO_CUENTA').AsInteger := DigitoCuenta;
         ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
         ParamByName('HORA_MOVIMIENTO').AsTime := fHoraActual;
         ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 17;
         ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vNoComprobante;
         ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'DESCUENTO DE CARTERA COLOCACION No.' + colocacion;
         ParamByName('VALOR_DEBITO').AsCurrency := 0;
         ParamByName('VALOR_CREDITO').AsCurrency := RetiroExtracto;
         ParamByName('ID').AsInteger := 0;
         try
          ExecSQL;
          if RowsAffected < 1 then
            begin
              MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
              Exit;
            end;
         except
            MessageDlg('Error Grabando Descuento',mtError,[mbok],0);
            Exit;
         end; // del try
       end;
    end;

    if Nacional then begin
      with IBQuery1 do begin
        Close;
        SQL.Clear;
        SQL.Add('insert into "col$pagoconnal" VALUES(');
        SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:FECHA_EXTRACTO,:ID_CBTE_COLOCACION,');
        SQL.Add(':FECHA_CONSIGNACION)');
        ParamByName('ID_AGENCIA').AsInteger := Agencia;
        ParamByName('ID_COLOCACION').AsString := Colocacion;
        ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
        ParamByName('ID_CBTE_COLOCACION').AsString := vNoComprobante;
        ParamByName('FECHA_CONSIGNACION').AsDate := FechaConsignacion;
         try
          ExecSQL;
          if RowsAffected < 1 then
            begin
              MessageDlg('Error Grabando Tabla de Nacional',mtError,[mbok],0);
              Exit;
            end;
         except
            MessageDlg('Error Grabando Tabla de Nacional',mtError,[mbok],0);
            Exit;
         end; // del try
       end;
    end;
//***fin actualizo extracto

     except
       Transaction.Rollback;
       MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
       Exit;
     end;

     EdHonorarios.Text := '';
     Grid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect];
     EdHonorarios.Enabled := False;

     DmGeneral.IBTransaction1.Commit;
     VerificarCancelacionCredito(Agencia,Colocacion);
     VerificacionCambioEstado;
     MessageDlg('Cuotas Abonadas',mtInformation,[mbOK],0);
     CmdInforme.Click;
   end;
 end
else
 begin
   dmGeneral.IBTransaction1.Rollback;
   MessageDlg('Error al Abonar Cuotas',mtInformation,[mbOK],0);
 end;
end;

procedure TfrmMuestroLiquidacionColocacion.GrabarExtracto;
var
SaldoExtracto : Currency;
SumTasa:Single;
SumDias, I:Integer;
MyCuotasLiq : TCuotasLiq;
AR : PCuotasLiq;
TasaLiquidacion : Single;
FechaCapital:TDate;
FechaInteres:TDate;
FechaDesembolso:TDate;
NuevaFecha:TDateTime;
begin
        SumTasa := 0;
        SumDias := 0;
         if  MyLista.Count > 0 then
          for I := 0 to MyLista.Count -1 do
          begin
                AR := MyLista.Items[i];
                if AR^.EsCausado or AR^.EsCorriente or AR^.EsAnticipado then
                 begin
                   SumDias := SumDias + ar^.Dias;
                   SumTasa := SumTasa + (ar^.Tasa * AR^.Dias);
//                   TasaLiquidacion := SumTasa / SumDias;
                 end;
          end;
          try
            TasaLiquidacion := SumTasa / SumDias;
          except
            TasaLiquidacion := vTasa;
          end;


        with IBQuery1 do
         begin
          if IBTransaction2.InTransaction then
             IBTransaction2.Commit;
          IBTransaction2.StartTransaction;
          sql.Clear;
          sql.Add('select "col$extracto".SALDO_ANTERIOR_EXTRACTO, "col$extracto".ABONO_CAPITAL,');
          SQL.Add('"col$extracto".INTERES_PAGO_HASTA, "col$extracto".CAPITAL_PAGO_HASTA,');
          SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".DIAS_PAGO,');
          SQL.Add('"col$colocacion".ID_LINEA, "col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL, "col$colocacion".AMORTIZA_INTERES');
          SQL.Add('from "col$extracto"');
          SQL.Add('inner join "col$colocacion" on ("col$extracto".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
          SQL.Add('"col$extracto".ID_COLOCACION = "col$colocacion".ID_COLOCACION) where');
          SQL.Add('"col$extracto".ID_AGENCIA = :"ID_AGENCIA" and');
          SQL.Add('"col$extracto".ID_COLOCACION = :"ID_COLOCACION"');
          Parambyname('ID_AGENCIA').AsInteger := agencia;
          parambyname('ID_COLOCACION').AsString := colocacion;
          open;
          First;
          Last;
          SaldoExtracto := FieldByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency - FieldByName('ABONO_CAPITAL').AsCurrency;
          FechaDesembolso := FieldByName('FECHA_DESEMBOLSO').AsDateTime + FieldByName('DIAS_PAGO').AsInteger;

          //
          if (IBQuery1.FieldByName('ID_LINEA').AsInteger <> 6) and (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 0) then
           begin
            if TryEncodeDate(YearOf(FieldByName('CAPITAL_PAGO_HASTA').AsDateTime),MonthOf(FieldByName('CAPITAL_PAGO_HASTA').AsDateTime),DayOf(FechaDesembolso),NuevaFecha) then
              FechaCapital := NuevaFecha
            else
              FechaCapital := FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;

            if TryEncodeDate(YearOf(FieldByName('INTERES_PAGO_HASTA').AsDateTime),MonthOf(FieldByName('INTERES_PAGO_HASTA').AsDateTime),DayOf(FechaDesembolso),NuevaFecha) then
              FechaInteres := NuevaFecha
            else
              FechaInteres := FieldByName('INTERES_PAGO_HASTA').AsDateTime;
           end
          else
           begin
             FechaCapital := FieldByName('CAPITAL_PAGO_HASTA').AsDateTime;
             FechaInteres := FieldByName('INTERES_PAGO_HASTA').AsDateTime;
           end;
          //
          if abono_capital > 0 then
            FechaCapital := CalculoFecha(FechaCapital,FieldByName('AMORTIZA_CAPITAL').AsInteger)
          else
            FechaCapital := FechaCapital;

          FechaInteres := CalculoFecha(FechaInteres,FieldByName('AMORTIZA_INTERES').AsInteger);
          Close;

          sql.Clear;
          sql.Add('insert into "col$extracto" (');
          sql.Add('"col$extracto"."ID_AGENCIA", "col$extracto"."ID_CBTE_COLOCACION",');
          sql.Add('"col$extracto"."ID_COLOCACION", "col$extracto"."FECHA_EXTRACTO",');
          sql.Add('"col$extracto"."HORA_EXTRACTO", "col$extracto"."CUOTA_EXTRACTO",');
          sql.Add('"col$extracto"."TIPO_OPERACION", "col$extracto"."SALDO_ANTERIOR_EXTRACTO",');
          sql.Add('"col$extracto"."ABONO_CAPITAL", "col$extracto"."ABONO_CXC",');
          sql.Add('"col$extracto"."ABONO_SERVICIOS", "col$extracto"."ABONO_ANTICIPADO",');
          sql.Add('"col$extracto"."ABONO_MORA", "col$extracto"."ABONO_SEGURO",');
          sql.Add('"col$extracto"."ABONO_PAGXCLI", "col$extracto"."ABONO_HONORARIOS",');
          sql.Add('"col$extracto"."ABONO_OTROS", "col$extracto"."TASA_INTERES_LIQUIDACION",');
          sql.Add('"col$extracto"."ID_EMPLEADO",');
          sql.Add('"col$extracto"."INTERES_PAGO_HASTA",');
          sql.Add('"col$extracto"."CAPITAL_PAGO_HASTA",');
          sql.Add('"col$extracto"."TIPO_ABONO")');
          sql.Add(' Values (');
          sql.Add(':"ID_AGENCIA", :"ID_CBTE_COLOCACION", :"ID_COLOCACION",');
          sql.Add(':"FECHA_EXTRACTO", :"HORA_EXTRACTO", :"CUOTA_EXTRACTO",');
          sql.Add(':"TIPO_OPERACION", :"SALDO_ANTERIOR_EXTRACTO", :"ABONO_CAPITAL",');
          sql.Add(':"ABONO_CXC", :"ABONO_SERVICIOS", :"ABONO_ANTICIPADO", :"ABONO_MORA",');
          sql.Add(':"ABONO_SEGURO", :"ABONO_PAGXCLI", :"ABONO_HONORARIOS",');
          sql.Add(':"ABONO_OTROS", :"TASA_INTERES_LIQUIDACION", :"ID_EMPLEADO",');
          sql.Add(':"INTERES_PAGO_HASTA", :"CAPITAL_PAGO_HASTA", :"TIPO_ABONO")');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_CBTE_COLOCACION').AsInteger := strtoint(vNoComprobante);
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
          ParamByName('HORA_EXTRACTO').AsDateTime := fHoraActual;
          ParamByName('CUOTA_EXTRACTO').AsInteger := Cuota_anterior;
          ParamByName('TIPO_OPERACION').AsInteger := vTipoOperacion;
          if SaldoExtracto > 0 then
            ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := SaldoExtracto
          else
            ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vSaldoActual;
          ParamByName('ABONO_CAPITAL').AsCurrency := abono_capital;
          ParamByName('ABONO_CXC').AsCurrency := abono_cxc;
          ParamByName('ABONO_SERVICIOS').AsCurrency := abono_servicios;
          ParamByName('ABONO_ANTICIPADO').AsCurrency := abono_anticipado;
          ParamByName('ABONO_MORA').AsCurrency := abono_mora;
          ParamByName('ABONO_SEGURO').AsCurrency := vseguro;
          ParamByName('ABONO_PAGXCLI').AsCurrency := vpagxcliente;
          ParamByName('ABONO_HONORARIOS').AsCurrency := vhonorarios;
          ParamByName('ABONO_OTROS').AsCurrency := votrospagos;
          ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := TasaLiquidacion;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          if FechaInteres = 0 then
            ParamByName('INTERES_PAGO_HASTA').AsDate := InteresesHasta
          else
            ParamByName('INTERES_PAGO_HASTA').AsDate := FechaInteres; //InteresesHasta;
          if fechacapital = 0 then
            ParamByName('CAPITAL_PAGO_HASTA').AsDate := CapitalHasta
          else
            ParamByName('CAPITAL_PAGO_HASTA').AsDate := fechacapital; //CapitalHasta;
          ParamByName('TIPO_ABONO').AsBoolean := False;
          ExecSQL;
          Close;
          abono_capital := 0;
          abono_cxc := 0;
          abono_servicios := 0;
          abono_mora := 0;
          abono_anticipado := 0;
          vhonorarios := 0;
         end;
end;


procedure TfrmMuestroLiquidacionColocacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := caFree;
        ThousandSeparator := separadormiles;
end;

procedure TfrmMuestroLiquidacionColocacion.CmdInformeClick(
  Sender: TObject);
var Tabla:string;
    I:Integer;
    AF:PCuotasLiq;
    frmVistaPreliminar:TfrmVistaPreliminar;
begin
        Empleado;

        for I := 0 to (MyLista.Count - 1) do
         begin
              AF := MyLista.Items[I];
              IBInforme.Append;
              IBInforme.FieldByName('CUOTA').AsInteger := AF^.CuotaNumero;
              IBInforme.FieldByName('CODIGO').AsString := AF^.CodigoPuc;
              IBCodigo.Close;
              IBCodigo.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBCodigo.ParamByName('CODIGO').AsString := AF^.CodigoPuc;
              IBCodigo.Open;
              IBInforme.FieldByName('NOMBRE').AsString := IBCodigo.FieldByName('NOMBRE').AsString;
              IBInforme.FieldByName('ID_AGENCIA').AsInteger := Agencia;
              IBInforme.FieldByName('FECHA_INICIAL').AsDateTime := AF^.FechaInicial;
              IBInforme.FieldByName('FECHA_FINAL').AsDateTime := AF^.FechaFinal;
              IBInforme.FieldByName('DIAS').AsInteger := AF^.Dias;
              IBInforme.FieldByName('TASA').AsFloat := AF^.Tasa;
              IBInforme.FieldByName('DEBITO').AsCurrency := AF^.Debito;
              IBInforme.FieldByName('CREDITO').AsCurrency := AF^.Credito;
              IBInforme.Post;
              IBCodigo.Close;
           end;

           Report.Variables.ByName['Empresa'].AsString := Empresa;
           Report.Variables.ByName['Colocacion'].AsString := Colocacion;
           Report.Variables.ByName['Hoy'].AsDateTime := fFechaActual;
           if ProximaCuota = 0 then
            Report.Variables.ByName['ProximaCuota'].AsString := '0000/00/00'
           else
            Report.Variables.ByName['ProximaCuota'].AsString := DateToStr(ProximaCuota);
           Report.Variables.ByName['FechaCorte'].AsDateTime := FechaCorte;
           Report.Variables.ByName['Asociado'].AsString := Asociado;
           Report.Variables.ByName['Cuenta'].AsString := IntToStr(NumeroCuenta) + '-' + IntToStr(DigitoCuenta);
           Report.Variables.ByName['NuevoSaldo'].AsDouble := NuevoSaldo;
           Report.Variables.ByName['InteresesHasta'].AsDateTime := InteresesHasta;
           Report.Variables.ByName['CapitalHasta'].AsDateTime := CapitalHasta;
           Report.Variables.ByName['comprobante'].AsString := VNoComprobante;
           Report.Variables.ByName['empleado'].AsString := Nombres + '    ' + Apellidos;

           if Report.PrepareReport then
           begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Report;
              frmVistaPreliminar.ShowModal;
           end;

           IBInforme.EmptyDataSet;

end;

procedure TfrmMuestroLiquidacionColocacion.EdNocomprobanteExit(
  Sender: TObject);
var
comprobante : string;
begin
        if EdNoComprobante.Text = '' then
           vNoComprobante := ''
        else
         begin
           comprobante := trim(EdNoComprobante.Text);
           vNoComprobante := formatcurr('0000000',strtoint(comprobante));
           EdNoComprobante.Text := vNoComprobante;
         end;
end;



procedure TfrmMuestroLiquidacionColocacion.EdhonorariosExit(
  Sender: TObject);
var AR : PcuotasLiq;
I : integer;
total_debito : currency;
total_credito : currency;
caja : currency;
cuota : integer;
begin
        total_debito := 0;
        total_credito := 0;
        vhonorarios := 0;
        vhonorarios := strtocurr(EdHonorarios.Text);
        honorarios := formatcurr('#,#0',vhonorarios);
        if vhonorarios <> 0 then
         begin
             New(AR);
             AR^.CuotaNumero := VCuotaNo;
             AR^.CodigoPuc    := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString;
             AR^.FechaInicial := FechaCorte;
             AR^.FechaFinal   := FechaCorte;
             AR^.Dias         := 0;
             AR^.Tasa         := 0;
             AR^.Debito       := 0;
             AR^.Credito      := vhonorarios;
             AR^.EsCapital := False;
             AR^.EsCausado := False;
             AR^.EsCorriente := False;
             AR^.EsVencido := False;
             AR^.EsAnticipado := False;
             AR^.EsDevuelto := False;
             Lista.Insert(1,AR);

             For I := 0 to lista.Count - 1 do
              begin
                AR := MyLista.Items[I];
                Cuota := AR^.CuotaNumero;
                if (AR^.CuotaNumero = Cuota) and (AR^.CodigoPuc <> '110505000000000000') then
                 begin
                   total_debito := total_debito + AR^.Debito;
                   total_credito := total_credito + AR^.Credito;
                   caja := total_credito - total_debito;
                 end
                 else
                   if (AR^.CuotaNumero = Cuota) and (AR^.CodigoPuc = '110505000000000000') then
                    begin
                      AR^.Debito := caja;
                      total_debito := 0;
                      total_credito := 0;
                    end;
              end;
         MostrarFormulario;
         end;
end;

procedure TfrmMuestroLiquidacionColocacion.EdhonorariosKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;


procedure TfrmMuestroLiquidacionColocacion.BtnCerrarClick(Sender: TObject);
begin
        close;
end;


procedure TfrmMuestroLiquidacionColocacion.GrabarTablaLiquidacion;
begin
        with IBQuery1 do
         begin
          sql.Clear;
          sql.Add('update "col$tablaliquidacion" set');
          sql.Add('"col$tablaliquidacion"."PAGADA" =:"PAGADA",');
          sql.Add('"col$tablaliquidacion"."FECHA_PAGADA" =:"FECHA_PAGADA"');
          sql.Add(' where ');
          sql.Add('"col$tablaliquidacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
          sql.Add('"col$tablaliquidacion"."ID_COLOCACION" =:"ID_COLOCACION" and');
          sql.Add('"col$tablaliquidacion"."CUOTA_NUMERO" =:"CUOTA_NUMERO"');
          ParamByName('ID_AGENCIA').AsInteger := agencia;
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('CUOTA_NUMERO').AsInteger := Cuota_anterior;
          ParamByName('PAGADA').AsInteger := 1;
          ParamByName('FECHA_PAGADA').AsDate := fFechaActual;
          ExecSQL;
          Close;
         end;
end;


procedure TfrmMuestroLiquidacionColocacion.EdNocomprobanteKeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmMuestroLiquidacionColocacion.GridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
        DirInt := ARow-1;
        CanSelect := true;
end;

procedure TfrmMuestroLiquidacionColocacion.GridSetEditText(Sender: TObject;
  ACol, ARow: Integer; const Value: String);
var AR : PcuotasLiq;
total_debito : currency;
total_credito : currency;
caja : currency;
Cuota : integer;
I : integer;
begin
         total_debito := 0;
         total_credito := 0;
         caja := 0;
         if DirInt <> -1 then
          begin
           AR := Lista.Items[DirInt];
           if (ACol = 7) and (ARow = DirInt+1) then
              AR^.Debito := strtocurr(Value)
           else
           if (ACol = 8) and (ARow = DirInt+1) then
              AR^.Credito := strtocurr(Value);
           Cuota := AR^.CuotaNumero;
           For I := 0 to lista.Count - 1 do
            begin
             AR := MyLista.Items[I];
             if (AR^.CuotaNumero = Cuota) and (AR^.CodigoPuc <> '110505000000000000') then
               begin
                 total_debito := total_debito + AR^.Debito;
                 total_credito := total_credito + AR^.Credito;
                 caja := total_credito - total_debito;
               end;
             if (AR^.CuotaNumero = Cuota) and (AR^.CodigoPuc = '110505000000000000') then
                 begin
                   AR^.Debito := caja;
                   caja := 0;
                 end;
            end;
           Dirint := -1;
           MostrarFormulario;
          end;
end;

procedure TfrmMuestroLiquidacionColocacion.EdHonorarios1Exit(
  Sender: TObject);
var AR : PcuotasLiq;
I : integer;
total_debito : currency;
total_credito : currency;
caja : currency;
cuota : integer;
begin
        total_debito := 0;
        total_credito := 0;
        if EdHonorarios.Text = '' then
           vhonorarios := 0
        else
           vhonorarios := strtocurr(EdHonorarios.Text);
        honorarios := formatcurr('#,#0',vhonorarios);
        EdHonorarios.Text := honorarios;
        if vhonorarios <> 0 then
         begin
             New(AR);
             AR^.CuotaNumero := VCuotaNo;
             AR^.CodigoPuc    := dmColocacion.IBSQLcodigos.FieldByName('COD_COSTAS').AsString;
             AR^.FechaInicial := FechaCorte;
             AR^.FechaFinal   := FechaCorte;
             AR^.Dias         := 0;
             AR^.Tasa         := 0;
             AR^.Debito       := 0;
             AR^.Credito      := vhonorarios;
             AR^.EsCapital := False;
             AR^.EsCausado := False;
             AR^.EsCorriente := False;
             AR^.EsVencido := False;
             AR^.EsAnticipado := False;
             AR^.EsDevuelto := False;
             Lista.Insert(1,AR);

             For I := 0 to lista.Count - 1 do
              begin
                AR := MyLista.Items[I];
                Cuota := AR^.CuotaNumero;
                if (AR^.CuotaNumero = Cuota) and (AR^.CodigoPuc <> CodigoCaja) then
                 begin
                   total_debito := total_debito + AR^.Debito;
                   total_credito := total_credito + AR^.Credito;
                   caja := total_credito - total_debito;
                 end
                 else
                   if (AR^.CuotaNumero = Cuota) and (AR^.CodigoPuc = CodigoCaja) then
                    begin
                      AR^.Debito := caja;
                      total_debito := 0;
                      total_credito := 0;
                    end;
              end;
         MostrarFormulario;
         end;
end;

procedure TfrmMuestroLiquidacionColocacion.EdHonorarios1KeyPress(
  Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmMuestroLiquidacionColocacion.EdHonorariosEnter(
  Sender: TObject);
begin
        EdHonorarios.Text := '';
end;

procedure TfrmMuestroLiquidacionColocacion.Empleado;
begin
        with dmColocacion.IBQuery do
         begin
           if Transaction.InTransaction then
             Transaction.Rollback;
           Transaction.StartTransaction;
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
         end;
end;
procedure TfrmMuestroLiquidacionColocacion.GridExit(Sender: TObject);
var AR : PcuotasLiq;
I : integer;
TotalDebitoRecibo : currency;
TotalCreditoRecibo : currency;
begin

end;

procedure TfrmMuestroLiquidacionColocacion.VerificacionCambioEstado;
begin
        if EstadoActual <> NuevoEstado then begin
          with IBCambioEstado do begin
            if Transaction.InTransaction then
              Transaction.Commit;
            Transaction.StartTransaction;

            Close;
            SQL.Clear;
            SQL.Add('insert into "col$cambioestado" values(:ID_AGENCIA,:ID_COLOCACION,:FECHA_CAMBIO,');
            SQL.Add(':ID_ESTADO_ACTUAL,:ID_ESTADO_NUEVO,:ID_EMPLEADO,:SALDO,:FECHA_CAPITAL,:FECHA_INTERES)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := Colocacion;
            ParamByName('FECHA_CAMBIO').AsDate := fFechaActual;
            ParamByName('ID_ESTADO_ACTUAL').AsInteger := EstadoActual;
            ParamByName('ID_ESTADO_NUEVO').AsInteger := NuevoEstado;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('SALDO').AsCurrency := saldo;
            ParamByName('FECHA_CAPITAL').AsDate := CapitalHasta;
            ParamByName('FECHA_INTERES').AsDate := InteresesHasta;
            ExecQuery;
            Close;

            SQL.Clear;
            sql.Add('update "col$colocacion" set ');
            sql.Add('"col$colocacion".ID_ESTADO_COLOCACION =:"ID_ESTADO_COLOCACION"');
            sql.Add(' where ');
            sql.Add('"col$colocacion".ID_AGENCIA =:"ID_AGENCIA" and');
            sql.Add('"col$colocacion".ID_COLOCACION =:"ID_COLOCACION"');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := Colocacion;
            ParamByName('ID_ESTADO_COLOCACION').AsInteger := NuevoEstado;
            ExecQuery;
            Close;
            Transaction.Commit;
          end;
        end;


end;

end.




