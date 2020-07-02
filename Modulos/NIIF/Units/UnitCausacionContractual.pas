unit UnitCausacionContractual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, DBClient, Math, DateUtils, pr_Common, pr_TxClasses, IBSQL;
type
  Contractual = record
    Dias:Integer;
    CausacionMensual :Currency;
    CausacionAcumulada: Currency;
    RetefuenteMensual: Currency;
    RetefuenteAcumulada: Currency;
    //SeCausa :Boolean;
  end;
type
  TFrmCausacionContractual = class(TForm)
    Panel1: TPanel;
    Dfecha: TDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Rdefinitivo: TRadioButton;
    Rprueba: TRadioButton;
    Panel2: TPanel;
    Label2: TLabel;
    EDcomprobante: TEdit;
    Panel3: TPanel;
    CmdLiquidar: TBitBtn;
    CmdInforme: TBitBtn;
    CmdAplicar: TBitBtn;
    CmdComprobante: TBitBtn;
    CmdCerrar: TBitBtn;
    IBcontractual: TIBQuery;
    CdContractual: TClientDataSet;
    CdContractualid_agencia: TSmallintField;
    CdContractualid_tipo_captacion: TSmallintField;
    CdContractualnumero_cuenta: TIntegerField;
    CdContractualdigito_cuenta: TSmallintField;
    CdContractualid_plan: TSmallintField;
    CdContractualcuota: TCurrencyField;
    CdContractualvalor_inicial: TCurrencyField;
    CdContractualfecha_apertura: TDateField;
    CdContractualfecha_vencimiento: TDateField;
    CdContractualid_tipo_captacion_abono: TSmallintField;
    CdContractualnumero_cuenta_abono: TIntegerField;
    CdContractualid_identificacion: TSmallintField;
    CdContractualid_persona: TStringField;
    CdContractualprimer_apellido: TStringField;
    CdContractualsegundo_apellido: TStringField;
    CdContractualnombre: TStringField;
    CdContractualretefuente: TSmallintField;
    CdContractualano: TSmallintField;
    CdContractualmes: TSmallintField;
    CdContractualdias: TSmallintField;
    //z: TCurrencyField;
    CdContractualcausacion_acumulada: TCurrencyField;
    CdContractualretefuente_mensual: TCurrencyField;
    CdContractualretefuente_acumulada: TCurrencyField;
    CdContractualsum_causacion_mensual: TAggregateField;
    CdContractualsum_causacion_acumulada: TAggregateField;
    CdContractualsum_retefuente_mensual: TAggregateField;
    CdContractualsum_retefuente_acumulada: TAggregateField;
    CdContractualplazo: TSmallintField;
    Reporte: TprTxReport;
    CdComprobante: TClientDataSet;
    CdComprobanteid_comprobante: TSmallintField;
    CdComprobanteagencia: TStringField;
    CdComprobantetipo_comprobante: TStringField;
    CdComprobantefecha: TDateField;
    CdComprobanteempleado: TStringField;
    CdComprobantecodigo: TStringField;
    CdComprobantenombre: TStringField;
    CdComprobantedebito: TCurrencyField;
    CdComprobantecredito: TCurrencyField;
    ReporteC: TprTxReport;
    CdCodigos: TClientDataSet;
    CdCodigosid_codigo: TSmallintField;
    CdCodigoscodigo: TStringField;
    CdCodigosdescripcion: TStringField;
    IBSComprobante: TIBSQL;
    IBSQL1: TIBSQL;
    IBAuxiliar: TIBQuery;
    ReporteA: TprTxReport;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure CmdComprobanteClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
  private
  FechaCorte :TDateTime;
  vRetefuenteMensual,vRetefuenteAcumulada :Currency;
  vCausacionMensual,vCausacionAcumulada :Currency;
  vTopeRetefuente :Currency;
  _bEstadoActivo :Boolean;
    Comprobante: Integer;
    function vContractual(FechaApertura, FechaVencimiento: Tdate;
      Plazo: Smallint; Cuota,vCuota: Currency): Contractual;
    procedure NotaC;
    function BuscaFecha(_iNumeroCuenta: Integer): Tdate;
    { Private declarations }
  public
   vAplicaRetefuente :Boolean;
    { Public declarations }
  end;

var
  FrmCausacionContractual: TFrmCausacionContractual;

implementation
uses UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmCausacionContractual.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmCausacionContractual.FormCreate(Sender: TObject);
var     anoi,mesi,diasi :Integer;
begin
        anoi := YearOf(fFechaActual);
        mesi := MonthOf(fFechaActual);
        diasi := DaysInAMonth(anoi,mesi);
        Dfecha.DateTime := StrToDate(IntToStr(anoi) + '/' + IntToStr(mesi) + '/' + IntToStr(diasi));
        Dfecha.MaxDate := StrToDate(IntToStr(anoi) + '/' + IntToStr(mesi) + '/' + IntToStr(diasi));
        with IBcontractual do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "cap$codigoscontractual"');
          Open;
          while not eof do
          begin
            CdCodigos.Append;
            CdCodigos.FieldValues['id_codigo'] := FieldByName('ID_CODIGO').AsInteger;
            CdCodigos.FieldValues['codigo'] := FieldByName('CODIGO').AsString;
            CdCodigos.FieldValues['descripcion'] := FieldByName('DESCRIPCION').AsString;
            CdCodigos.Post;
            Next;
          end;

        end;
end;

procedure TFrmCausacionContractual.CmdLiquidarClick(Sender: TObject);
var     vFecha,vFechaFinal,vFechaPrueba,_dFechaVencimiento :TDate;
begin
        vTopeRetefuente := 1300;
        vFechaPrueba := Dfecha.Date + 1;
        if DayOf(vFechaPrueba) = 1 then
           vFechaFinal := Dfecha.Date
        else
           vFechaFinal := Dfecha.Date + 1;
        //ShowMessage(DateToStr(vFechaPrueba) + ' ' + DateToStr(vFechaFinal));
        CdContractual.CancelUpdates;
        vCausacionMensual := 0;
        vCausacionAcumulada := 0;
        vRetefuenteMensual := 0;
        vRetefuenteAcumulada := 0;
        FechaCorte := Dfecha.DateTime;
        with IBcontractual do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "cap$causacioncon" where MES = :MES and ANO = :ANO');
          ParamByName('MES').AsInteger := MonthOf(Dfecha.Date);
          ParamByName('ANO').AsInteger := YearOf(Dfecha.Date);
          Open;
          if RecordCount  > 0 then
          begin
            MessageDlg('La Causación para este Mes ya fue Realizada...',mtWarning,[mbok],0);
            Exit;
          end;
          if MessageDlg('Esta Seguro de Realizar la Liquidación',mtInformation,[mbyes,mbno],0) = mrno then
            Exit;
          Close;
          SQL.Clear;
          SQL.Add('select * from P_CAP_CON(5,' + '''' + DateToStr(vfechafinal) + '''' + ' )');
          Open;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Min := 0;
          frmProgreso.Titulo := 'Causación de Contractuales';
          frmProgreso.Max := RecordCount;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Contractual No: 50' + IntToStr(agencia) + '-' + FormatCurr('000000',FieldByName('numero_cuenta').AsCurrency) + '-' + FieldByName('digito_cuenta').AsString;
            Application.ProcessMessages;
            try
            if FieldByName('RETEFUENTE').AsInteger = 0 then
                vAplicaRetefuente := False
            else
                vAplicaRetefuente := True;
            if FieldByName('ID_ESTADO_CUENTA').AsInteger <> 12 then
            begin
              _dFechaVencimiento := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
              _bEstadoActivo := True;
            end
            else
            begin
              _dFechaVencimiento := BuscaFecha(FieldByName('NUMERO_CUENTA').AsInteger);
              _bEstadoActivo := False;
            end;
            CdContractual.Append;
            CdContractual.FieldValues['id_agencia'] := FieldByName('ID_AGENCIA').AsInteger;
            CdContractual.FieldValues['id_tipo_captacion'] := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            CdContractual.FieldValues['numero_cuenta'] := FieldByName('NUMERO_CUENTA').AsInteger;
            CdContractual.FieldValues['digito_cuenta'] := FieldByName('DIGITO_CUENTA').AsInteger;
            CdContractual.FieldValues['id_plan'] := FieldByName('ID_PLAN').AsInteger;
            CdContractual.FieldValues['cuota'] := FieldByName('CUOTA').AsCurrency;
            CdContractual.FieldValues['plazo'] := FieldByName('PLAZO').AsInteger;
            CdContractual.FieldValues['valor_inicial'] := FieldByName('VALOR_INICIAL').AsCurrency;
            CdContractual.FieldValues['fecha_apertura'] := FieldByName('FECHA_APERTURA').AsDateTime;
            CdContractual.FieldValues['fecha_vencimiento'] := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
            CdContractual.FieldValues['id_tipo_captacion_abono'] := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
            CdContractual.FieldValues['numero_cuenta_abono'] := FieldByName('NUMERO_CUENTA_ABONO').AsInteger;
            CdContractual.FieldValues['id_identificacion'] := FieldByName('ID_IDENTIFICACION').AsInteger;
            CdContractual.FieldValues['id_persona'] := FieldByName('ID_PERSONA').AsString;
            CdContractual.FieldValues['primer_apellido'] := FieldByName('PRIMER_APELLIDO').AsString;
            CdContractual.FieldValues['segundo_apellido'] := FieldByName('SEGUNDO_APELLIDO').AsString;
            CdContractual.FieldValues['nombre'] := FieldByName('NOMBRE').AsString;
            CdContractual.FieldValues['retefuente'] := FieldByName('RETEFUENTE').AsInteger;
            CdContractual.FieldValues['ano'] := YearOf(FechaCorte);
            CdContractual.FieldValues['mes'] := MonthOf(FechaCorte);
            CdContractual.FieldValues['dias'] := vContractual(FieldByName('FECHA_APERTURA').AsDateTime,_dFechaVencimiento,FieldByName('PLAZO').AsInteger,FieldByName('CUOTA').AsCurrency,FieldByName('VALOR_INICIAL').AsCurrency).Dias;
            CdContractual.FieldValues['causacion_mensual'] := vContractual(FieldByName('FECHA_APERTURA').AsDateTime,_dFechaVencimiento,FieldByName('PLAZO').AsInteger,FieldByName('CUOTA').AsCurrency,FieldByName('VALOR_INICIAL').AsCurrency).CausacionMensual;
            CdContractual.FieldValues['causacion_acumulada'] := vContractual(FieldByName('FECHA_APERTURA').AsDateTime,_dFechaVencimiento,FieldByName('PLAZO').AsInteger,FieldByName('CUOTA').AsCurrency,FieldByName('VALOR_INICIAL').AsCurrency).CausacionAcumulada;
            CdContractual.FieldValues['retefuente_mensual'] := vContractual(FieldByName('FECHA_APERTURA').AsDateTime,_dFechaVencimiento,FieldByName('PLAZO').AsInteger,FieldByName('CUOTA').AsCurrency,FieldByName('VALOR_INICIAL').AsCurrency).RetefuenteMensual;
            CdContractual.FieldValues['retefuente_acumulada'] := vContractual(FieldByName('FECHA_APERTURA').AsDateTime,_dFechaVencimiento,FieldByName('PLAZO').AsInteger,FieldByName('CUOTA').AsCurrency,FieldByName('VALOR_INICIAL').AsCurrency).RetefuenteAcumulada;
            CdContractual.Post;
            except
            on e: Exception do
            begin
              MessageDlg('Error al Tratar de Realizar la Causacion de Ahorro Contractual' + #13 + 'con Mensaje : ' + e.Message,mtError,[mbok],0);
              CdContractual.CancelUpdates;
              Exit;
            end;
            end;
            Next;
          end;
          frmProgreso.Cerrar;
          // calculo totales de causacion y retefuente
          with CdContractual do
          begin
            AggregatesActive := True;
            Filtered := False;
            Filtered := True;
            AggregatesActive := True;
            vCausacionMensual := CdContractualsum_causacion_mensual.Value;
            vCausacionAcumulada := CdContractualsum_causacion_acumulada.Value;
            vRetefuenteMensual := CdContractualsum_retefuente_mensual.Value;
            vRetefuenteAcumulada := CdContractualsum_retefuente_acumulada.Value;
          end;
        end;
        CmdLiquidar.Enabled := False;
        CmdAplicar.Enabled := True;
        CmdComprobante.Enabled := True;
        CmdInforme.Enabled := True;
end;

function TFrmCausacionContractual.vContractual(FechaApertura,
  FechaVencimiento: Tdate; Plazo: Smallint; Cuota,vCuota: Currency): Contractual;
var
        Vcausacion :Currency;
        Dia,Dia1,Mes,Ano :Smallint;
        AnoActual,MesActual :Smallint;
        vDias :Smallint;
        vCausacionMensual,vCausacionAcumulada :Currency;
        vRetefuenteMensual,vRetefuenteAcumulada :Currency;
        SeAcumula :Boolean;
        vMesesAcumula :Integer;
        vFechaApertura :TDate;
        vMesesAcumulado :Smallint;
        AnoVencimiento,MesVencimiento :Integer;
begin
        vCausacionMensual := 0;
        vCausacionAcumulada := 0;
        vRetefuenteAcumulada := 0;
        vRetefuenteMensual := 0;
        Vcausacion := ((Cuota * vCuota)/Plazo);
        Dia := DayOf(FechaApertura);
        Dia1 := Dia;
        Mes := MonthOf(FechaApertura);
        Ano := YearOf(FechaApertura);
        MesActual := MonthOf(FechaCorte);
        AnoActual := YearOf(FechaCorte);
        AnoVencimiento := YearOf(FechaVencimiento);
        MesVencimiento := MonthOf(FechaVencimiento);
        if (Dia in  [29,30,31]) and (MesActual = 2) then
           vFechaApertura := FechaApertura  -  3
           else if Dia = 1 then
             vFechaApertura := FechaApertura + 5
             else if (Dia in  [28,29,30,31])  then
               vFechaApertura := FechaApertura - 3
               else
                  vFechaApertura := FechaApertura;
        vMesesAcumulado := MonthsBetween(vFechaApertura,FechaCorte);
        if (Ano = AnoActual) and (Mes = MesActual) then// validacion primer mes del contractual
        begin
           vDias := 30 - Dia;
           SeAcumula := True;
           if vDias <= 0 then
              vDias := 0;
        end
        else//validacion  para despues del segundo mes
        begin
          vDias := 30;
          SeAcumula := True;
        end;
        vCausacionMensual := (Vcausacion * vDias);
        Dia := (30 - Dia);
        if Dia <= 0 then
           Dia := 0;

       // if SeAcumula then
           vCausacionAcumulada := (Vcausacion * (Dia + (vMesesAcumulado * 30)));
        if (Vcausacion >= vTopeRetefuente) and (vAplicaRetefuente) then
        begin
          if SeAcumula then
             vRetefuenteAcumulada := (vCausacionAcumulada * 0.07);
          vRetefuenteMensual := (vCausacionMensual * 0.07);
        end;
        vDias := Dia + (vMesesAcumulado * 30);
       { if (AnoVencimiento < AnoActual) then
        begin
        end
        else
        begin}
        if ((AnoVencimiento <= AnoActual) and (MesVencimiento <= MesActual) and (_bEstadoActivo)) or (AnoVencimiento < AnoActual) then
        begin
        if (AnoVencimiento = AnoActual) and (MesVencimiento = MesActual) then
        begin
          vCausacionMensual := Dia1 * Vcausacion;
          vCausacionAcumulada := (vCuota * Cuota);
        end
        else
        begin
          vCausacionMensual := 0;
          vCausacionAcumulada := (vCuota * Cuota);
        end;
        if Vcausacion >= vTopeRetefuente then
        begin
          if SeAcumula then
             vRetefuenteAcumulada := (vCausacionAcumulada * 0.07);
          vRetefuenteMensual := 0;
        end;
          vDias := Plazo;
        end;
        //end;
        Result.Dias := vDias;
        Result.CausacionMensual := SimpleRoundTo(vCausacionMensual,0);
        Result.CausacionAcumulada := SimpleRoundTo(vCausacionAcumulada,0);
        Result.RetefuenteMensual := SimpleRoundTo(vRetefuenteMensual,0);
        Result.RetefuenteAcumulada := SimpleRoundTo(vRetefuenteAcumulada,0);
end;

procedure TFrmCausacionContractual.CmdInformeClick(Sender: TObject);
begin
        Reporte.Variables.ByName['Empresa'].AsString := Empresa;
        Reporte.Variables.ByName['FechaCorte'].AsDateTime := FechaCorte;
        Reporte.Variables.ByName['ret_mensual'].AsDouble := vretefuentemensual;
        Reporte.Variables.ByName['ret_acumulada'].AsDouble := vRetefuenteAcumulada;
        Reporte.Variables.ByName['caus_mensual'].AsDouble := vcausacionmensual;
        Reporte.Variables.ByName['caus_acumulada'].AsDouble := vCausacionAcumulada;
        Empleado;
        Reporte.Variables.ByName['empleado'].AsString := Nombres + ' ' + Apellidos;
        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);

end;

procedure TFrmCausacionContractual.CmdComprobanteClick(Sender: TObject);
var    i :Integer;
begin
        if Rprueba.Checked then
        begin
          with CdComprobante do
          begin
            Append;
            FieldValues['id_comprobante'] := 1;
            FieldValues['agencia'] := Empresa;
            FieldValues['tipo_comprobante'] := 1;
            FieldValues['fecha'] := fFechaActual;
            Empleado;
            FieldValues['empleado'] := Nombres + ' ' + Apellidos;
            for i := 0 to 2 do
            begin
            if i = 0 then
            begin
              //CdCodigos.Filtered := False;
              CdCodigos.Filter := 'id_codigo = 1';
              CdCodigos.Filtered := True;
              FieldValues['codigo'] := CdCodigos.FieldByName('codigo').AsString;;
              FieldValues['nombre'] := CdCodigos.FieldByName('descripcion').AsString;
              FieldValues['debito'] := vCausacionMensual;
              FieldValues['credito'] := 0;
              Post;
            end;
            if i = 1 then
            begin
              Append;
              //CdCodigos.Filtered := False;
              CdCodigos.Filter := 'id_codigo = 2';
              CdCodigos.Filtered := True;
              FieldValues['codigo'] := CdCodigos.FieldByName('codigo').AsString;;
              FieldValues['nombre'] := CdCodigos.FieldByName('descripcion').AsString;
              FieldValues['debito'] := 0;
              FieldValues['credito'] := vCausacionMensual - vRetefuenteMensual;
              Post;
            end;
            if i = 2 then
            begin
              Append;
              //CdCodigos.Filtered := False;
              CdCodigos.Filter := 'id_codigo = 3';
              CdCodigos.Filtered := True;
              FieldValues['codigo'] := CdCodigos.FieldByName('codigo').AsString;;
              FieldValues['nombre'] := CdCodigos.FieldByName('descripcion').AsString;
              FieldValues['debito'] := 0;
              FieldValues['credito'] := vRetefuenteMensual;
              Post;
            end;
            end;
          end;
        //end;
          if Reportec.PrepareReport then
            Reportec.PreviewPreparedReport(True);
        end
        else
        begin
        with IBAuxiliar do
        begin
             if Transaction.InTransaction then
                Transaction.Rollback;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
             SQL.Add('"con$comprobante".FECHADIA,');
             SQL.Add('"con$comprobante".DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('"con$auxiliar".CODIGO,');
             SQL.Add('"con$puc".NOMBRE AS CUENTA,');
             SQL.Add('"con$auxiliar".DEBITO,');
             SQL.Add('"con$auxiliar".CREDITO');
             SQL.Add('from ');
             SQL.Add('"con$comprobante" ');
             SQL.Add('INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
             SQL.Add('INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('("con$comprobante".ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             try
              Open;
              ReporteA.Variables.ByName['EMPRESA'].AsString := Empresa;
              ReporteA.Variables.ByName['NIT'].AsString := Nit;
              ReporteA.Variables.ByName['Agencia'].AsString := IntToStr(Agencia);
              if ReporteA.PrepareReport then
                 ReporteA.PreviewPreparedReport(True);
              Close;
             except
               MessageDlg('Error generando el comprobante',mtError,[mbcancel],0);
               Close;
             end;
             Transaction.Commit;
        end;
        end;

end;

procedure TFrmCausacionContractual.NotaC;

begin
        Comprobante := ObtenerConsecutivo(IBSComprobante,4);//generacion del comprobante
        with IBSQL1 do
        begin
          if Transaction.InTransaction then
              Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('insert into "con$comprobante"');
          SQL.Add('("con$comprobante"."ID_COMPROBANTE", "con$comprobante"."ID_AGENCIA", ');
          SQL.Add('"con$comprobante"."TIPO_COMPROBANTE", "con$comprobante"."FECHADIA", ');
          SQL.Add('"con$comprobante"."DESCRIPCION", "con$comprobante"."TOTAL_DEBITO", ');
          SQL.Add('"con$comprobante"."TOTAL_CREDITO", ');
          SQL.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO", ');
          SQL.Add('"con$comprobante"."ANULACION", ');
          SQL.Add('"con$comprobante"."ID_EMPLEADO")');
          SQL.Add('values');
          SQL.Add('(:"ID_COMPROBANTE", :"ID_AGENCIA", :"TIPO_COMPROBANTE", ');
          SQL.Add(':"FECHADIA", ');
          SQL.Add(':"DESCRIPCION", :"TOTAL_DEBITO", :"TOTAL_CREDITO", :"ESTADO", ');
          SQL.Add(':"IMPRESO", ');
          SQL.Add(':"ANULACION", :"ID_EMPLEADO")');
          ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
          ParamByName('FECHADIA').AsDateTime := fFechaActual;
          ParamByName('DESCRIPCION').AsString := 'Contabilizacion Causación Aho. Contractual';
          ParamByName('TOTAL_DEBITO').AsCurrency := vCausacionMensual;
          ParamByName('TOTAL_CREDITO').AsCurrency := vCausacionMensual;
          ParamByName('ESTADO').AsString := 'O';
          ParamByName('IMPRESO').AsInteger := 1;
          ParamByName('ANULACION').AsString := '';
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
            ExecQuery;
          except
          begin
            MessageDlg('Error Generando Comprobante',mtInformation,[mbok],0);
            Transaction.Rollback;
            Exit;
          end;
          end;
          //contabilizacion causacion mensual
          Close;
          SQL.Clear;
          SQL.Add('insert into "con$auxiliar" values (');
          SQL.Add(':ID_COMPROBANTE,');
          SQL.Add(':ID_AGENCIA,');
          SQL.Add(':FECHA,');
          SQL.Add(':CODIGO,');
          SQL.Add(':DEBITO,');
          SQL.Add(':CREDITO,');
          SQL.Add(':ID_CUENTA,');
          SQL.Add(':ID_COLOCACION,');
          SQL.Add(':ID_IDENTIFICACION,');
          SQL.Add(':ID_PERSONA,');
          SQL.Add(':MONTO_RETENCION,');
          SQL.Add(':TASA_RETENCION,');
          SQL.Add(':ESTADOAUX');
          SQL.Add(')');
          ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHA').AsDateTime := fFechaActual;
          CdCodigos.Filtered := False;
          CdCodigos.Filter := 'id_codigo = 1';
          CdCodigos.Filtered := True;
          ParamByName('CODIGO').AsString := CdCodigos.FieldByName('codigo').AsString;
          ParamByName('DEBITO').AsCurrency := vCausacionMensual;
          ParamByName('CREDITO').AsCurrency := 0;
          ParamByName('ID_CUENTA').Clear;
          ParamByName('ID_COLOCACION').Clear;
          ParamByName('ID_IDENTIFICACION').AsInteger := 0;
          ParamByName('ID_PERSONA').Clear;
          ParamByName('MONTO_RETENCION').AsCurrency := 0;
          ParamByName('TASA_RETENCION').AsFloat := 0;
          ParamByName('ESTADOAUX').AsString := 'O';
          try
            ExecQuery;
          except
          begin
            MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
            Transaction.Rollback;
            Exit;
          end;
          end;
          //contabilizacion total causacion
          ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHA').AsDateTime := fFechaActual;
          CdCodigos.Filtered := False;
          CdCodigos.Filter := 'id_codigo = 2';
          CdCodigos.Filtered := True;
          ParamByName('CODIGO').AsString := CdCodigos.FieldByName('codigo').AsString;
          ParamByName('DEBITO').AsCurrency := 0;
          ParamByName('CREDITO').AsCurrency := vCausacionMensual - vRetefuenteMensual;
          ParamByName('ID_CUENTA').Clear;
          ParamByName('ID_COLOCACION').Clear;
          ParamByName('ID_IDENTIFICACION').AsInteger := 0;
          ParamByName('ID_PERSONA').Clear;
          ParamByName('MONTO_RETENCION').AsCurrency := 0;
          ParamByName('TASA_RETENCION').AsFloat := 0;
          ParamByName('ESTADOAUX').AsString := 'O';
          try
            ExecQuery;
          except
          begin
            MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
            Transaction.Rollback;
            Exit;
          end;
          end;
          // contabilizacion retefuente
          //contabilizacion retefuente
          ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('FECHA').AsDateTime := fFechaActual;
          CdCodigos.Filtered := False;
          CdCodigos.Filter := 'id_codigo = 3';
          CdCodigos.Filtered := True;
          ParamByName('CODIGO').AsString := CdCodigos.FieldByName('codigo').AsString;
          ParamByName('DEBITO').AsCurrency := 0;
          ParamByName('CREDITO').AsCurrency := vRetefuenteMensual;
          ParamByName('ID_CUENTA').Clear;
          ParamByName('ID_COLOCACION').Clear;
          ParamByName('ID_IDENTIFICACION').AsInteger := 0;
          ParamByName('ID_PERSONA').Clear;
          ParamByName('MONTO_RETENCION').AsCurrency := 0;
          ParamByName('TASA_RETENCION').AsFloat := 0;
          ParamByName('ESTADOAUX').AsString := 'O';
          try
            ExecQuery;
          except
          begin
            MessageDlg('Error Actualizando Comprobante',mtError,[mbok],0);
            Transaction.Rollback;
            Exit;
          end;
          end;
          Transaction.Commit;
        end;
        end;

procedure TFrmCausacionContractual.CmdAplicarClick(Sender: TObject);
begin
        if Rdefinitivo.Checked then
        begin
          if MessageDlg('Esta seguro de aplicar la causación?',mtInformation,[mbyes,mbno],0) = mrno then
             Exit;
          NotaC;
          EDcomprobante.Text := IntToStr(Comprobante);
          if IBSQL1.Transaction.InTransaction then
           IBSQL1.Transaction.Commit;
          IBSQL1.Transaction.StartTransaction;
          with CdContractual do
          begin
            Last;
            frmProgreso := TfrmProgreso.Create(Self);
            frmProgreso.Min := 0;
            frmProgreso.Titulo := 'Aplicando Causación de Contractuales';
            frmProgreso.Max := RecordCount;
            frmProgreso.Ejecutar;
            First;
            while not Eof do
            begin
              frmProgreso.Position := RecNo;
              frmProgreso.InfoLabel := 'Registro Numero: ' + IntToStr(RecNo);
              Application.ProcessMessages;
              with IBSQL1 do
              begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$causacioncon" values(');
                SQL.Add(':ID_AGENCIA,');
                SQL.Add(':ID_TIPO_CAPTACION,');
                SQL.Add(':NUMERO_CUENTA,');
                SQL.Add(':DIGITO_CUENTA,');
                SQL.Add(':ID_PLAN,');
                SQL.Add(':CUOTA,');
                SQL.Add(':VALOR_INICIAL,');
                SQL.Add(':FECHA_APERTURA,');
                SQL.Add(':FECHA_VENCIMIENTO,');
                SQL.Add(':ID_TIPO_CAPTACION_ABONO,');
                SQL.Add(':NUMERO_CUENTA_ABONO,');
                SQL.Add(':ID_IDENTIFICACION,');
                SQL.Add(':ID_PERSONA,');
                SQL.Add(':PRIMER_APELLIDO,');
                SQL.Add(':SEGUNDO_APELLIDO,');
                SQL.Add(':NOMBRE,');
                SQL.Add(':RETEFUENTE,');
                SQL.Add(':ANO,');
                SQL.Add(':MES,');
                SQL.Add(':DIAS,');
                SQL.Add(':RETEFUENTE_MENSUAL,');
                SQL.Add(':RETEFUENTE_ACUMULADA,');
                SQL.Add(':CAUSACION_MENSUAL,');
                SQL.Add(':CAUSACION_ACUMULADA)');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := CdContractual.FieldByName('id_tipo_captacion').AsInteger;
                ParamByName('NUMERO_CUENTA').AsInteger := CdContractual.FieldByName('numero_cuenta').AsInteger;
                ParamByName('DIGITO_CUENTA').AsInteger := CdContractual.FieldByName('digito_cuenta').AsInteger;
                ParamByName('ID_PLAN').AsInteger := CdContractual.FieldByName('id_plan').AsInteger;
                ParamByName('CUOTA').AsCurrency := CdContractual.FieldByName('cuota').AsCurrency;
                ParamByName('VALOR_INICIAL').AsCurrency := CdContractual.FieldByName('valor_inicial').AsCurrency;
                ParamByName('FECHA_APERTURA').AsDate := CdContractual.FieldByName('fecha_apertura').AsDateTime;
                ParamByName('FECHA_VENCIMIENTO').AsDate := CdContractual.FieldByName('fecha_vencimiento').AsDateTime;
                ParamByName('ID_TIPO_CAPTACION_ABONO').AsInteger := CdContractual.FieldByName('id_tipo_captacion_abono').AsInteger;
                ParamByName('NUMERO_CUENTA_ABONO').AsInteger := CdContractual.FieldByName('numero_cuenta_abono').AsInteger;
                ParamByName('ID_IDENTIFICACION').AsInteger := CdContractual.FieldByName('id_identificacion').AsInteger;
                ParamByName('ID_PERSONA').AsString := CdContractual.FieldByName('id_persona').AsString;
                ParamByName('PRIMER_APELLIDO').AsString := CdContractual.FieldByName('primer_apellido').AsString;
                ParamByName('SEGUNDO_APELLIDO').AsString := CdContractual.FieldByName('segundo_apellido').AsString;
                ParamByName('NOMBRE').AsString := CdContractual.FieldByName('nombre').AsString;
                ParamByName('RETEFUENTE').AsInteger := CdContractual.FieldByName('retefuente').AsInteger;
                ParamByName('ANO').AsInteger := YearOf(Dfecha.Date);
                ParamByName('MES').AsInteger := MonthOf(Dfecha.Date);
                ParamByName('DIAS').AsInteger := CdContractual.FieldByName('dias').AsInteger;
                ParamByName('RETEFUENTE_MENSUAL').AsCurrency := CdContractual.FieldByName('retefuente_mensual').AsCurrency;
                ParamByName('RETEFUENTE_ACUMULADA').AsCurrency := CdContractual.FieldByName('retefuente_acumulada').AsCurrency;
                ParamByName('CAUSACION_MENSUAL').AsCurrency := CdContractual.FieldByName('causacion_mensual').AsCurrency;
                ParamByName('CAUSACION_ACUMULADA').AsCurrency := CdContractual.FieldByName('causacion_acumulada').AsCurrency;
                ExecQuery;
              end;
              Next;
            end;
          end;
          IBSQL1.Transaction.Commit;
          //MessageDlg('Causación Aplicada con Exito...',mtInformation,[mbok],0);
          frmProgreso.Cerrar;
          CmdAplicar.Enabled := False;
          Rprueba.Enabled := False;
          CmdComprobante.Click
        end;
end;

function TFrmCausacionContractual.BuscaFecha(
  _iNumeroCuenta: Integer): Tdate;
begin
        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('     MAX(FECHA_DESCUENTO) AS FECHA_DESCUENTO');
          SQL.Add('FROM "cap$tablaliquidacioncon"');
          SQL.Add('WHERE');
          SQL.Add('    "cap$tablaliquidacioncon".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('    "cap$tablaliquidacioncon".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('    "cap$tablaliquidacioncon".NUMERO_CUENTA = :NUMERO_CUENTA AND');
          SQL.Add('    "cap$tablaliquidacioncon".DESCONTADO = 1');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 5;
          ParamByName('NUMERO_CUENTA').AsInteger := _iNumeroCuenta;
          ExecQuery;
          Result := FieldByName('FECHA_DESCUENTO').AsDate;
        end;
end;

end.
