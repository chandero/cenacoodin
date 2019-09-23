unit UnitPlanillaConsolidada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, DBClient, DateUtils, FR_DSet, FR_DBSet, FR_Class;

type
  TFrmPlanillaConsolidada = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DTFecha: TDateTimePicker;
    BitBtn1: TBitBtn;
    IBQuery1: TIBQuery;
    cdSumatoria: TClientDataSet;
    cdSumatoriaAGENCIA: TSmallintField;
    cdSumatoriaTIPO: TSmallintField;
    cdSumatoriaDESTIPO: TStringField;
    cdSumatoriaAPORTES: TCurrencyField;
    cdSumatoriaAHORROS: TCurrencyField;
    cdSumatoriaJUVENIL: TCurrencyField;
    cdSumatoriaCDAT: TCurrencyField;
    cdSumatoriaCARTERA: TCurrencyField;
    cdSumatoriaDESCAGENCIA: TStringField;
    ibSI: TIBQuery;
    ibSA: TIBQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    cdSumatoriaCONTRACTUAL: TCurrencyField;
    cdSumatoriaDESEMBOLSO: TCurrencyField;
    procedure BitBtn1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormCreate(Sender: TObject);
  private
        vAportes,vAhorros,vJuvenil,vContractual,vCdat,vCartera :Currency;
        vAportesI,vAhorrosI,vJuvenilI,vContractualI,vCdatI,vCarteraI :Currency;
        vCarteraV, vConsolidada, vCarteraIv, vConsolidadai :Currency;
        vDesembolsosI, Vdesembolsos, vRecaudo :Currency;

    { Private declarations }
  public
  published
    procedure imprimir(cadena: string);
    procedure Inicializa;
    { Public declarations }
  end;

var
  FrmPlanillaConsolidada: TFrmPlanillaConsolidada;

implementation
uses UnitGlobales, unitMain, UnitImpresion;

{$R *.dfm}

procedure TFrmPlanillaConsolidada.BitBtn1Click(Sender: TObject);
var     vFechaSI :TDate;
        vMesSI :Integer;
        vDiaSI :Integer;
begin
        empleado;
        vConsolidada := 0;        
        cdSumatoria.CancelUpdates;
        vMesSI := MonthOf(DTFecha.Date) - 1;
        if vMesSI = 0 then
           vFechaSI := StrToDate(FormatDateTime('yyyy/12/31',DTFecha.Date -35))
        else
           vFechaSI := StrToDate((FormatDateTime('yyyy/mm/01',DTFecha.Date ))) - 1;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          if Agencia = 1 then
             SQL.Add('select ID_AGENCIA,DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA <> 0')
          else
          begin
            SQL.Add('select ID_AGENCIA,DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_AGENCIA').AsInteger := Agencia
          end;
          Open;
          while not Eof do
          begin
            inicializa;
            ibSI.Close;
            ibSA.Close;
            ibSI.ParamByName('FECHA').AsDate := vFechaSI;
            ibSI.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
            ibSI.Open;
            cdSumatoria.Append;
            cdSumatoria.FieldValues['AGENCIA'] := FieldByName('ID_AGENCIA').AsInteger;
            cdSumatoria.FieldValues['TIPO'] := 1;
            cdSumatoria.FieldValues['DESTIPO'] := 'SALDO INICIAL';
            while not ibSI.Eof do
            begin
              case ibSI.FieldByName('ID_TIPO_CAPTACION').AsInteger of
                1: begin
                     vAportesI := ibSI.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['APORTES'] := vAportesI;
                   end;
                2: begin
                     vAhorrosI := ibSI.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['AHORROS'] := vAhorrosI
                   end;
                4: begin
                     vJuvenilI := ibSI.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['JUVENIL'] := vJuvenilI;
                   end;
                5: begin
                     vContractualI := ibSI.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['CONTRACTUAL'] := vContractualI;
                   end;
                6: begin
                     vCdatI := ibSI.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['CDAT'] := vCdatI;
                   end;
                7: vcarteraiv := ibSI.FieldByName('SALDO_ACTUAL').AsCurrency;
                10: begin
                      vCarteraI := ibSI.FieldByName('SALDO_ACTUAL').AsCurrency;
                      if vCarterai = 0 then
                      begin
                         vCarterai := vcarteraiv;
                         vConsolidadai := vCarteraiv;
                      end;
                      cdSumatoria.FieldValues['CARTERA'] := vCarteraI;
                    end;
                11: begin
                      vDesembolsosI := 0;
                      cdSumatoria.FieldValues['DESEMBOLSO'] := vDesembolsosI;
                    end;
              end;
              ibSI.Next;
            end;
            cdSumatoria.FieldValues['DESCAGENCIA'] := 'Agencia: ' + FieldByName('DESCRIPCION_AGENCIA').AsString;
            cdSumatoria.Post;
            ibSA.ParamByName('FECHA').AsDate := DTFecha.Date;
            ibSA.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
            ibSA.Open;
            cdSumatoria.Append;
            cdSumatoria.FieldValues['AGENCIA'] := FieldByName('ID_AGENCIA').AsInteger;
            cdSumatoria.FieldValues['TIPO'] := 2;
            cdSumatoria.FieldValues['DESTIPO'] := 'SALDO ACTUAL';
            while not ibSA.Eof do
            begin
              case ibSA.FieldByName('ID_TIPO_CAPTACION').AsInteger of
                1: begin
                     vAportes := ibSA.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['APORTES'] := vAportes;
                   end;
                2: begin
                     vAhorros := ibSA.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['AHORROS'] := vAhorros;
                   end;
                4: begin
                     vJuvenil := ibSA.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['JUVENIL'] := vJuvenil;
                   end;
                5: begin
                     vContractual := ibSA.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['CONTRACTUAL'] := vContractual;
                   end;
                6: begin
                     vCdat := ibSA.FieldByName('SALDO_ACTUAL').AsCurrency;
                     cdSumatoria.FieldValues['CDAT'] := vCdat;
                   end;
                7: begin
                     vcarterav := ibSA.FieldByName('SALDO_ACTUAL').AsCurrency;
                   end;
                10: begin
                      vCartera := ibSA.FieldByName('SALDO_ACTUAL').AsCurrency;
                      if vCartera = 0 then
                      begin
                         vCartera := vcarterav;
                         vConsolidada := vCartera;
                      end;
                      cdSumatoria.FieldValues['CARTERA'] := vCartera;
                    end;
                11: begin
                      vDesembolsos := ibSA.FieldByName('SALDO_ACTUAL').AsCurrency;
                      cdSumatoria.FieldValues['DESEMBOLSO'] := vDesembolsos;
                    end;
              end;
              ibSA.Next;
            end;
            //diferencias
            cdSumatoria.FieldValues['DESCAGENCIA'] := 'Agencia: ' + FieldByName('DESCRIPCION_AGENCIA').AsString;
            cdSumatoria.Post;
            cdSumatoria.Append;
            cdSumatoria.FieldValues['AGENCIA'] := FieldByName('ID_AGENCIA').AsInteger;
            cdSumatoria.FieldValues['TIPO'] := 3;
            cdSumatoria.FieldValues['DESTIPO'] := 'DIFERENCIA';
            cdSumatoria.FieldValues['APORTES'] := vAportes - vAportesI;
            cdSumatoria.FieldValues['AHORROS'] := vAhorros - vAhorrosI;
            cdSumatoria.FieldValues['JUVENIL'] := vJuvenil - vJuvenilI;
            cdSumatoria.FieldValues['CONTRACTUAL'] := vContractual - vContractualI;
            cdSumatoria.FieldValues['CDAT'] := vCdat - vCdatI;
            cdSumatoria.FieldValues['CARTERA'] := vCartera - vCarteraI;
            cdSumatoria.FieldValues['DESEMBOLSO'] := (vCarteraI + vDesembolsos) - vCartera;
            Next;
          end;
          //GENERACION CONSOLIDADA
          if Agencia = 1 then
          begin
            inicializa;
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('ID_TIPO_CAPTACION,');
            SQL.Add('SUM(SALDO_ACTUAL) AS SALDO_ACTUAL');
            SQL.Add('FROM');
            SQL.Add('"gen$planilladiaria"');
            SQL.Add('WHERE');
            SQL.Add('("gen$planilladiaria".FECHA = :FECHA)');
            SQL.Add('GROUP BY ID_TIPO_CAPTACION');
            ParamByName('FECHA').AsDate := vFechaSI;
            Open;
            cdSumatoria.Append;
            cdSumatoria.FieldValues['AGENCIA'] := 10;
            cdSumatoria.FieldValues['TIPO'] := 10;
            cdSumatoria.FieldValues['DESTIPO'] := 'SALDO INICIAL';
            while not Eof do
            begin
                case FieldByName('ID_TIPO_CAPTACION').AsInteger of
                  1: begin
                       vAportesI := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['APORTES'] := vAportesI;
                     end;
                  2: begin
                       vAhorrosI := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['AHORROS'] := vAhorrosI
                     end;
                  4: begin
                       vJuvenilI := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['JUVENIL'] := vJuvenilI;
                     end;
                  5: begin
                       vContractualI := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['CONTRACTUAL'] := vContractualI;
                     end;
                  6: begin
                       vCdatI := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['CDAT'] := vCdatI;
                     end;
                  7: vcarteraiv := ibSI.FieldByName('SALDO_ACTUAL').AsCurrency;
                  10: begin
                        vCarteraI := FieldByName('SALDO_ACTUAL').AsCurrency;
                        //if vcarterai = 0 then
                           //vcarterai := vconsolidadai + vCarterai;
                        cdSumatoria.FieldValues['CARTERA'] := vconsolidadai + vCarterai;
                      end;
                  11: cdSumatoria.FieldValues['DESEMBOLSO'] := 0; 
                end;
              Next;
            end;
            cdSumatoria.FieldValues['DESCAGENCIA'] := 'INF. CONSOLIDADA';
            cdSumatoria.Post;
            // consolidado saldos actuales
            Close;
            ParamByName('FECHA').AsDate := DTFecha.Date;
            Open;
            cdSumatoria.Append;
            cdSumatoria.FieldValues['AGENCIA'] := 10;
            cdSumatoria.FieldValues['TIPO'] := 11;
            cdSumatoria.FieldValues['DESTIPO'] := 'SALDO ACTUAL';
            while not Eof do
            begin
                case FieldByName('ID_TIPO_CAPTACION').AsInteger of
                  1: begin
                       vAportes := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['APORTES'] := vAportes;
                     end;
                  2: begin
                       vAhorros := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['AHORROS'] := vAhorros;
                     end;
                  4: begin
                       vJuvenil := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['JUVENIL'] := vJuvenil;
                     end;
                  5: begin
                       vContractual := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['CONTRACTUAL'] := vContractual;
                     end;
                  6: begin
                       vCdat := FieldByName('SALDO_ACTUAL').AsCurrency;
                       cdSumatoria.FieldValues['CDAT'] := vCdat;
                     end;
                  10: begin
                        vCartera := FieldByName('SALDO_ACTUAL').AsCurrency;
                        //if vCartera = 0 then
                           //vCartera := vConsolidada + vCartera;
                        cdSumatoria.FieldValues['CARTERA'] := vConsolidada + vCartera;;
                      end;
                  11: begin
                         Vdesembolsos := FieldByName('SALDO_ACTUAL').AsCurrency;
                         cdSumatoria.FieldValues['DESEMBOLSO'] := vDesembolsos;
                      end;
                end;
              Next;
            end;
            cdSumatoria.FieldValues['DESCAGENCIA'] := 'INF. CONSOLIDADA';
            cdSumatoria.Post;
            //diferencias
            cdSumatoria.Append;
            cdSumatoria.FieldValues['AGENCIA'] := 10;
            cdSumatoria.FieldValues['TIPO'] := 12;
            cdSumatoria.FieldValues['DESTIPO'] := 'DIFERENCIA';
            cdSumatoria.FieldValues['APORTES'] := vAportes - vAportesI;
            cdSumatoria.FieldValues['AHORROS'] := vAhorros - vAhorrosI;
            cdSumatoria.FieldValues['JUVENIL'] := vJuvenil - vJuvenilI;
            cdSumatoria.FieldValues['CONTRACTUAL'] := vContractual - vContractualI;
            cdSumatoria.FieldValues['CDAT'] := vCdat - vCdatI;
            cdSumatoria.FieldValues['CARTERA'] := (vCartera + vConsolidada) - (vCarteraI + vconsolidadai);
            cdSumatoria.FieldValues['DESEMBOLSO'] := ((vCarteraI + vconsolidadai) + vdesembolsos) - (vCartera + vConsolidada);
            cdSumatoria.FieldValues['DESCAGENCIA'] := 'INF. CONSOLIDADA';
            cdSumatoria.Post;
            //porcentajes
            {cdSumatoria.Append;
            cdSumatoria.FieldValues['AGENCIA'] := 10;
            cdSumatoria.FieldValues['TIPO'] := 13;
            cdSumatoria.FieldValues['DESTIPO'] := 'PORCENTAJE';
            cdSumatoria.FieldValues['APORTES'] := 100 * (vAportes - vAportesI) / vAportesI;
            cdSumatoria.FieldValues['AHORROS'] := 100 * (vAhorros - vAhorrosI) / vAhorrosI;
            cdSumatoria.FieldValues['JUVENIL'] := 100 * (vJuvenil - vJuvenilI) / vJuvenilI;
            cdSumatoria.FieldValues['CONTRACTUAL'] := 100 * (vContractual - vContractualI) / vContractualI;
            cdSumatoria.FieldValues['CDAT'] := 100 * (vCdat - vCdatI) / vCdatI;
            cdSumatoria.FieldValues['CARTERA'] := 100 * (vCartera - vCarteraI) / vCarteraI;
            cdSumatoria.FieldValues['DESCAGENCIA'] := 'INF. CONSOLIDADA';
            cdSumatoria.Post;}
          end;

        end;
        if Role = 'CREDITOS' then
           imprimir(frmmain.ruta1 + '\Reporte\RepSumatoriaCre.frf')
        else
           imprimir(frmmain.ruta1 + '\Reporte\RepSumatoria.frf');
end;

procedure TFrmPlanillaConsolidada.imprimir(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.ModifyPrepared := False;
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmPlanillaConsolidada.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'fecha' then
          ParValue := DTFecha.Date;
        if ParName = 'empleado' then
          ParValue := Nombres + ' ' + Apellidos;
end;

procedure TFrmPlanillaConsolidada.Inicializa;
begin
        vAportes := 0;
        vAhorros := 0;
        vJuvenil := 0;
        vContractual := 0;
        vCdat := 0;
        vCartera := 0;
        vAportesI := 0;
        vAhorrosI := 0;
        vJuvenilI := 0;
        vContractualI := 0;
        vCdatI := 0;
        vCarteraI := 0;
        vcarterav := 0;
        vDesembolsosI := 0;
        Vdesembolsos := 0;
        vRecaudo := 0;        
end;

procedure TFrmPlanillaConsolidada.FormCreate(Sender: TObject);
begin
        //ShowMessage(DateToStr(fFechaActual - 1));
        //DTFecha.MaxDate := fFechaActual - 1;
        DTFecha.Date := fFechaActual - 1;
        DTFecha.MaxDate := fFechaActual - 1;
        DTFecha.MinDate := StrToDate('2006/10/04');
end;

end.
