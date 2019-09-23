unit UnitLiquidaciondePrueba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Buttons, ExtCtrls,StrUtils, DB,
  pr_Parser, IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, IBSQL, DateUtils
  , UnitdmGeneral,  UnitdmColocacion, Grids, DBGrids, DBClient, Provider;

type
  TfrmLiquidaciondePrueba = class(TForm)
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    CBlinea: TDBLookupComboBox;
    EdFechaDesembolso: TDateTimePicker;
    EdValorDesembolso: TMemo;
    EdPlazo: TMemo;
    EdTasaEfectiva: TMemo;
    CBtipocuota: TDBLookupComboBox;
    EdAmortizaCapital: TMemo;
    EdAmortizaInteres: TMemo;
    EdValorCuota: TStaticText;
    EdTipoTasa: TComboBox;
    CBtasavariable: TDBLookupComboBox;
    EdPuntosAdicionales: TMemo;
    Panel4: TPanel;
    CmdGrabar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    CmdVerTabla: TBitBtn;
    CmdInforme: TBitBtn;
    IBVarios: TIBSQL;
    IBSQL1: TIBSQL;
    GridDescuento: TDBGrid;
    GDSDescuento: TDataSource;
    IBQueryTabla: TIBQuery;
    DBDescontar: TDBCheckBox;
    IBQDescuento: TIBQuery;
    CDSDescuento: TClientDataSet;
    CDSADescontar: TClientDataSet;
    CDSADescontarID_DESCUENTO: TIntegerField;
    CDSADescontarCUOTA: TIntegerField;
    CDSADescontarVALOR: TCurrencyField;
    CDSCuotas: TClientDataSet;
    CDSADescontarCODIGO: TStringField;
    DSPCuotas: TDataSetProvider;
    DSCuotas: TDataSource;
    Report: TprTxReport;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CBlineaEnter(Sender: TObject);
    procedure CBtasavariableEnter(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBtipocuotaEnter(Sender: TObject);
    procedure CBlineaExit(Sender: TObject);
    procedure EdValorDesembolsoEnter(Sender: TObject);
    procedure EdValorDesembolsoExit(Sender: TObject);
    procedure EdPlazoEnter(Sender: TObject);
    procedure EdPlazoExit(Sender: TObject);
    procedure EdTipoTasaEnter(Sender: TObject);
    procedure EdTipoTasaExit(Sender: TObject);
    procedure EdPuntosAdicionalesEnter(Sender: TObject);
    procedure EdPuntosAdicionalesExit(Sender: TObject);
    procedure EdTasaEfectivaEnter(Sender: TObject);
    procedure EdTasaEfectivaExit(Sender: TObject);
    procedure CBtipocuotaExit(Sender: TObject);
    procedure EdAmortizaCapitalEnter(Sender: TObject);
    procedure EdAmortizaCapitalExit(Sender: TObject);
    procedure EdAmortizaInteresEnter(Sender: TObject);
    procedure EdAmortizaInteresExit(Sender: TObject);
    procedure EdAmortizaCapitalKeyPress(Sender: TObject; var Key: Char);
    procedure EdAmortizaInteresKeyPress(Sender: TObject; var Key: Char);
    procedure EdPuntosAdicionalesKeyPress(Sender: TObject; var Key: Char);
    procedure EdTasaEfectivaKeyPress(Sender: TObject; var Key: Char);
    procedure EdValorDesembolsoKeyPress(Sender: TObject; var Key: Char);
    procedure EdPlazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaDesembolsoExit(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure ReportUnknownObjFunction(Sender: TObject;
      Component: TComponent; const FuncName: String;
      const Parameters: TprVarsArray; ParametersCount: Integer;
      var Value: TprVarValue; var IsProcessed: Boolean);
    procedure CmdInformeClick(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDescuentoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridDescuentoKeyPress(Sender: TObject; var Key: Char);
    procedure GridDescuentoColExit(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLiquidaciondePrueba: TfrmLiquidaciondePrueba;
  dmGeneral: TdmGeneral;
  dmColocacion: TdmColocacion;
    vIdColocacion:String;
    vTipoId:Integer;
    vNumeroId:String;
    vLinea:Integer;
    vFechaDesembolso:TDate;
    vDesembolso:Currency;
    vPlazo:Integer;
    vTipoTasa:String;
    vTasaVariable:Integer;
    vPuntosAdicionales:Single;
    vTasaEfectiva:Single;
    vTasaMora:Single;
    vTipoCuota:Integer;
    vAmortizaCapital:Integer;
    vAmortizaInteres:Integer;
    vPeriodoGracia:Integer;
    vValorCuota:Currency;

    vCapitalVencido:String;
    vInteresVencido:String;
    vCuotaTipo:String;
    Consec:String;

    Saldo:Currency;

    vFechaGracia :TDate;

implementation

uses UnitGlobales, UnitGlobalesCol;

{$R *.dfm}



procedure TfrmLiquidaciondePrueba.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmLiquidaciondePrueba.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLiquidaciondePrueba.CBlineaEnter(Sender: TObject);
begin
        CBlinea.KeyValue := vLinea;
        CBlinea.DropDown;
end;

procedure TfrmLiquidaciondePrueba.CBtasavariableEnter(Sender: TObject);
begin
        CBtasavariable.DropDown;
end;

procedure TfrmLiquidaciondePrueba.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLiquidaciondePrueba.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if Consec <> '' then begin
          with IBSQL1 do begin
            If Transaction.InTransaction then Transaction.Commit;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('delete from "col$tablaliquidaciontmp" where ID_COLOCACION = :ID_COLOCACION');
            ParamByName('ID_COLOCACION').AsString := Consec;
            ExecQuery;
            Close;
          end;
        end;
        try
       //   dmColocacion.Free;
        except
        end;
        dmGeneral.Free;
        Action := caFree;
        
end;

procedure TfrmLiquidaciondePrueba.CBtipocuotaEnter(Sender: TObject);
begin
        CBtipocuota.KeyValue := vTipoCuota;
        CBtipocuota.DropDown;
end;

procedure TfrmLiquidaciondePrueba.CBlineaExit(Sender: TObject);
begin
        vLinea := CBlinea.KeyValue;
        with IBvarios do begin
          Close;
          SQL.Clear;
          SQL.Add('select TASA from "col$lineas" where ID_LINEA = :ID');
          ParamByName('ID').AsInteger := vLinea;
          ExecQuery;
          vTasaEfectiva := FieldByName('TASA').AsDouble;
          Close;
        end;

end;

procedure TfrmLiquidaciondePrueba.EdValorDesembolsoEnter(Sender: TObject);
begin
        EdValorDesembolso.Text := FormatCurr('#0',vDesembolso);
        EdValorDesembolso.SelectAll;
end;

procedure TfrmLiquidaciondePrueba.EdValorDesembolsoExit(Sender: TObject);
begin
          if EdValorDesembolso.Text = '' then EdValorDesembolso.Text := '0';
          vDesembolso := StrToCurr(EdValorDesembolso.Text);
          if vDesembolso = 0 then
          begin
            MessageDlg('El Valor de la Colocación no puede ser $0',mtError,[mbOK],0);
            EdValorDesembolso.SetFocus;
          end;
          EdValorDesembolso.Text := FormatCurr('#,##0',vDesembolso);
end;

procedure TfrmLiquidaciondePrueba.EdPlazoEnter(Sender: TObject);
begin
        EdPlazo.Text := FormatCurr('#0',vPlazo);
        EdPlazo.SelectAll;
end;

procedure TfrmLiquidaciondePrueba.EdPlazoExit(Sender: TObject);
var Plazo:Integer;
begin
        if EdPlazo.Text = '' then EdPlazo.Text := '0';
        vPlazo := StrToInt(EdPlazo.Text);
        if vPlazo <= 0 then
        begin
           MessageDlg('El Plazo de la Colocación no puede ser 0 dias',mtError,[mbOK],0);
           EdPlazo.SetFocus;
           Exit;
        end;
        EdPlazo.Text := FormatCurr('#0',vPlazo);

        Plazo := vPlazo;
{
        if CBlinea.KeyValue = 13 then begin
         with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" WHERE ID_MINIMO = 33');
          ExecQuery;
          vPeriodoGracia := FieldByName('VALOR_MINIMO').AsInteger;
          vFechaGracia := DateOf(vPeriodoGracia);
          vPeriodoGracia := DiasEntre(EdFechaDesembolso.Date,vFechaGracia);
          Close;
         end; //fin de With

         Plazo := vPlazo - ((vPeriodoGracia div vAmortizaCapital) * vAmortizaCapital);
        end;
}
        if vCuotaTipo = 'F' then
        begin
           vAmortizaCapital := vAmortizaInteres;
           EdAmortizaCapital.Text := FormatCurr('#0',vAmortizaCapital);
//           if CBlinea.KeyValue = 13 then
//             vValorCuota := CuotaFijaP(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaInteres)
//           else
             vValorCuota := CuotaFija(vDesembolso,Plazo,vTasaEfectiva,vAmortizaInteres, InttoBoolean(dmColocacion.IBDSlinea.FieldByName('CF_REDONDEO').AsInteger));
        end
        else
        begin
           vValorCuota := CuotaVariable(vDesembolso,Plazo,vTasaEfectiva,vAmortizaCapital, vAmortizaInteres, vInteresVencido);
        end;
      //  if CBlinea.KeyValue <> 13 then
          EdValorCuota.Caption := FormatCurr('#,##0',vValorCuota);

end;

procedure TfrmLiquidaciondePrueba.EdTipoTasaEnter(Sender: TObject);
begin
        if vTipoTasa = 'F' then
         EdTipoTasa.ItemIndex := 0
        else
         EdTipoTasa.ItemIndex := 1;
end;

procedure TfrmLiquidaciondePrueba.EdTipoTasaExit(Sender: TObject);
begin
        if LeftStr(EdTipoTasa.Text,1) = 'F' then
        begin
            CBtasavariable.Enabled := false;
            CBtasavariable.KeyValue := -1;
            EdPuntosAdicionales.Enabled := false;
            vPuntosAdicionales := 0;
            EdPuntosAdicionales.Text := FormatCurr('#0.00',vPuntosAdicionales);
            EdTasaEfectiva.Enabled := true;
            EdTasaEfectiva.SetFocus;
            vTipocuota := 1;
            vTipoTasa := 'F';
        end
        else
        begin
            CBtasavariable.Enabled := true;
            CBtasavariable.KeyValue := 1;
            EdPuntosAdicionales.Enabled := true;
            EdTasaEfectiva.Enabled := false;
            vTasaEfectiva := dmColocacion.IBDStasavariable.FieldValues['VALOR_ACTUAL_TASA'];
            EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);
            CBtasavariable.SetFocus;
            vTipoCuota := 2;
            vTipoTasa := 'V';
        end;

        if vTipoTasa = 'F' then
         begin
           DmColocacion.IBDStipocuota.ParamByName('ES_VARIABLE').AsInteger := 1;
           DmColocacion.IBDStipocuota.ParamByName('ES_FIJA').AsInteger := 1;
         end;
        if vTipoTasa = 'V' then
         begin
           DmColocacion.IBDStipocuota.ParamByName('ES_VARIABLE').AsInteger := 1;
           DmColocacion.IBDStipocuota.ParamByName('ES_FIJA').AsInteger := 0;
           EdTasaEfectiva.Text := '0';
         end;

        if vLinea = 7 then
         begin
           vTasaEfectiva := 25.34;
           EdTasaEfectiva.Text := FormatCurr('#0.00',vTasaEfectiva);
           EdTasaEfectiva.Enabled := False;
           vTasaMora := 15;
         end;
        DmColocacion.IBDStipocuota.Active := False;
        DmColocacion.IBDStipocuota.Active := True;
        DmColocacion.IBDStipocuota.Last;
        DmColocacion.IBDStipocuota.First;

end;

procedure TfrmLiquidaciondePrueba.EdPuntosAdicionalesEnter(
  Sender: TObject);
begin
        EdPuntosAdicionales.Text := FormatCurr('#0.00',vPuntosAdicionales);
        EdPuntosAdicionales.SelectAll;
end;

procedure TfrmLiquidaciondePrueba.EdPuntosAdicionalesExit(Sender: TObject);
begin
        if EdPuntosAdicionales.Text = '' then EdPuntosAdicionales.Text := '0.00';
        vPuntosAdicionales := StrToFloat(EdPuntosAdicionales.Text);
        EdPuntosAdicionales.Text := FormatCurr('#0.00',vPuntosAdicionales);
        vTasaEfectiva := dmColocacion.IBDStasavariable.FieldValues['VALOR_ACTUAL_TASA'] + vPuntosAdicionales;
        EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);
end;

procedure TfrmLiquidaciondePrueba.EdTasaEfectivaEnter(Sender: TObject);
begin
        EdTasaEfectiva.Text := FormatCurr('#0.00',vTasaEfectiva);
        EdTasaEfectiva.SelectAll;
end;

procedure TfrmLiquidaciondePrueba.EdTasaEfectivaExit(Sender: TObject);
begin
        if EdTasaEfectiva.Text = '' then EdTasaEfectiva.Text := '0.00';
        vTasaEfectiva := StrToFloat(EdTasaEfectiva.Text);
        if vTasaEfectiva = 0 then
        begin
           MessageDlg('La Tasa Efectiva no puede ser 0% ',mtError,[mbOK],0);
           EdTasaEfectiva.SetFocus;
           exit;
        end;
        EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);
end;

procedure TfrmLiquidaciondePrueba.CBtipocuotaExit(Sender: TObject);
begin
        vTipoCuota := CBtipocuota.KeyValue;
        if DmColocacion.IBDStipocuota.Locate('ID_TIPOS_CUOTA',VarArrayOf([vTipoCuota]),[loCaseInsensitive]) = True then
        begin
           vCapitalVencido := DmColocacion.IBDStipocuota.FieldByName('CAPITAL').AsString;
           vInteresVencido := DMColocacion.IBDStipocuota.FieldByName('INTERES').AsString;
           vCuotaTipo := DMColocacion.IBDStipocuota.FieldByName('TIPO_CUOTA').AsString;
        end
        else
        begin
           vCapitalVencido := 'V';
           vInteresVencido := 'V';
           vCuotaTipo      := 'F';
        end;
end;

procedure TfrmLiquidaciondePrueba.EdAmortizaCapitalEnter(Sender: TObject);
begin
        EdAmortizaCapital.Text := FormatCurr('#0',vAmortizaCapital);
end;

procedure TfrmLiquidaciondePrueba.EdAmortizaCapitalExit(Sender: TObject);
begin
        if EdAmortizaCapital.Text = '' then EdAmortizaCapital.Text := '0';
        vAmortizaCapital := StrToInt(EdAmortizaCapital.Text);
        if vAmortizaCapital = 0 then
        begin
           MessageDlg('La Amortización a Capital no puede ser 0 dias',mtError,[mbOK],0);
           EdAmortizaCapital.SetFocus;
        end;

        EdAmortizaCapital.Text := FormatCurr('#0',vAmortizaCapital);
        if vCuotaTipo = 'F' then
        begin
           vAmortizaInteres := vAmortizaCapital;
           EdAmortizaInteres.Text  := FormatCurr('#0',vAmortizaInteres);
        end;
end;

procedure TfrmLiquidaciondePrueba.EdAmortizaInteresEnter(Sender: TObject);
begin
        EdAmortizaInteres.Text := FormatCurr('#0',vAmortizaInteres);
end;

procedure TfrmLiquidaciondePrueba.EdAmortizaInteresExit(Sender: TObject);
begin
        if EdAmortizaInteres.Text = '' then EdAmortizaInteres.Text := '0';
        vAmortizaInteres := StrToInt(EdAmortizaInteres.Text);
        if vAmortizaInteres = 0 then
        begin
           MessageDlg('La Amortización a Interes no puede ser 0 dias',mtError,[mbOK],0);
           EdAmortizaInteres.SetFocus;
        end;
        EdAmortizaInteres.Text := FormatCurr('#0',vAmortizaInteres);
end;

procedure TfrmLiquidaciondePrueba.EdAmortizaCapitalKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmLiquidaciondePrueba.EdAmortizaInteresKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmLiquidaciondePrueba.EdPuntosAdicionalesKeyPress(
  Sender: TObject; var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmLiquidaciondePrueba.EdTasaEfectivaKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmLiquidaciondePrueba.EdValorDesembolsoKeyPress(
  Sender: TObject; var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmLiquidaciondePrueba.EdPlazoKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmLiquidaciondePrueba.EdFechaDesembolsoExit(Sender: TObject);
begin
        vFechaDesembolso := EdFechaDesembolso.Date;
end;

procedure TfrmLiquidaciondePrueba.CmdGrabarClick(Sender: TObject);
var FormatoAnterior:String;
begin
            if vLinea < 1 then
            begin
               messagedlg('El tipo de linea no es valido',mtError,[mbOk],0);
               CBlinea.SetFocus;
               exit;
            end;

            if vDesembolso < 1 then
            begin
               messagedlg('No diligencio el valor de la colocación',mtError,[mbOk],0);
               EdValorDesembolso.SetFocus;
               exit;
            end;
            if vPlazo < 1 then
            begin
               messagedlg('No diligencio el plazo de la colocación',mtError,[mbOk],0);
               EdPlazo.SetFocus;
               exit;
            end;
            if vTasaEfectiva < 1 then
            begin
               messagedlg('La tasa efectiva no es valida',mtError,[mbOk],0);
               EdTasaEfectiva.SetFocus;
               exit;
            end;

            if vAmortizaCapital < 1 then
            begin
               messagedlg('El valor de la amortización a capital no es valido',mtError,[mbOk],0);
               EdAmortizaCapital.SetFocus;
               exit;
            end;
            if vAmortizaInteres < 1 then
            begin
               messagedlg('El valor de la amortización a interes no es valido',mtError,[mbOk],0);
               EdAmortizaInteres.SetFocus;
               exit;
            end;
            CmdGrabar.Enabled := false;
            CmdInforme.Enabled := true;
            Randomize;
            FormatoAnterior := LongTimeFormat;
            LongTimeFormat := 'hhmmss';
            Consec := TimeToStr(Time)+IntToStr(Random(999));
            LongTimeFormat := FormatoAnterior;
{
            if CBlinea.KeyValue = 13 then begin
              CrearTablaLiquidacionPTmp_Mod(Consec,vDesembolso,vValorCuota,
                      vFechaDesembolso,vTasaEfectiva,vPuntosAdicionales,vAmortizaCapital,
                      vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido,vperiodogracia);
              EdValorCuota.Caption := FormatCurr('#,##0',vValorCuota);
            end
            else
}
            CrearTablaLiquidacionTmp(Consec,vDesembolso,vValorCuota,
                      CalculoFecha(vFechaDesembolso,vPeriodoGracia),vTasaEfectiva,vAmortizaCapital,
                      vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido);

        with IBQuerytabla do
        begin
             If Transaction.InTransaction then Transaction.Commit;
             Transaction.StartTransaction;
             SQL.Clear;
             SQL.Add('select ID_COLOCACION, CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGAR, ');
             SQL.Add('INTERES_A_PAGAR,(CAPITAL_A_PAGAR + INTERES_A_PAGAR) as TOTALCUOTA, OTROS ');
             SQL.Add('from "col$tablaliquidaciontmp" where ');
             SQL.Add('ID_COLOCACION = :"ID_COLOCACION" ORDER BY CUOTA_NUMERO');
             ParamByName('ID_COLOCACION').AsString := Consec;
             Open;
        end;
        CDSCuotas.Close;
        CDSCuotas.Open;

        CDSADescontar.EmptyDataSet;

        CalcularDescuentoPorCuota(CDSCuotas,CDSDescuento, CDSADescontar, vDesembolso);

        If IBQueryTabla.Transaction.InTransaction then
           IBQueryTabla.Transaction.Commit;
        IBQueryTabla.Transaction.StartTransaction;
        CDSADescontar.First;
        While not CDSADescontar.Eof do
        begin
         with IBQuerytabla do
         begin
             SQL.Clear;
             SQL.Add('update "col$tablaliquidaciontmp" SET OTROS = OTROS + :OTROS  where ');
             SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and CUOTA_NUMERO = :CUOTA_NUMERO');
             ParamByName('ID_COLOCACION').AsString := Consec;
             ParamByName('CUOTA_NUMERO').AsInteger := CDSADescontar.FieldByName('CUOTA_NUMERO').AsInteger;
             ParamByName('OTROS').AsCurrency := CdsADescontar.FieldByName('VALOR').AsCurrency;
             ExecSQL;
         end;
         CDSADescontar.Next
        end;

        IBQueryTabla.Transaction.Commit;

        with IBQuerytabla do
        begin
             If Transaction.InTransaction then Transaction.Commit;
             Transaction.StartTransaction;
             SQL.Clear;
             SQL.Add('select ID_COLOCACION, CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGAR, ');
             SQL.Add('INTERES_A_PAGAR,(CAPITAL_A_PAGAR + INTERES_A_PAGAR) as TOTALCUOTA, OTROS ');
             SQL.Add('from "col$tablaliquidaciontmp" where ');
             SQL.Add('ID_COLOCACION = :"ID_COLOCACION" ORDER BY CUOTA_NUMERO');
             ParamByName('ID_COLOCACION').AsString := Consec;
             Open;
        end;
        
        CmdInformeClick(CmdInforme);
        {
        Saldo := vDesembolso;
        Report.Variables.ByName['Tasa'].AsDouble := vTasaEfectiva;
        Report.Variables.ByName['Desembolso'].AsDouble := vDesembolso;
        Report.Variables.ByName['Empresa'].AsString  := Empresa;
        if Report.PrepareReport then
        begin
           Report.PreviewPreparedReport(true);
        end;
        }

end;

procedure TfrmLiquidaciondePrueba.ReportUnknownObjFunction(Sender: TObject;
  Component: TComponent; const FuncName: String;
  const Parameters: TprVarsArray; ParametersCount: Integer;
  var Value: TprVarValue; var IsProcessed: Boolean);
var   f : TField;
begin
if (Component=IBQuerytabla) and
   (AnsiCompareText(FuncName,'IBQuerytabla.Field')=0) and
   (ParametersCount=1) then
  begin
    // Parameter with index 0 is the fieldname
    f := IBQuerytabla.FindField(_vAsString(Parameters[0]));
    if f<>nil then
      begin
        // field is found return length of field value
        Saldo := Saldo - f.AsCurrency;
        _vSetAsDouble(Value,Saldo);
        IsProcessed := true;
      end
  end
end;

procedure TfrmLiquidaciondePrueba.CmdInformeClick(Sender: TObject);
begin
        Saldo := vDesembolso;
        Report.Variables.ByName['Tasa'].AsDouble := vTasaEfectiva;
        Report.Variables.ByName['Desembolso'].AsDouble := vDesembolso;
        Report.Variables.ByName['Empresa'].AsString  := Empresa;
        if Report.PrepareReport then
        begin
           Report.PreviewPreparedReport(true);
        end;
end;

procedure TfrmLiquidaciondePrueba.Inicializar;
begin
    if dmGeneral.IBTransaction1.InTransaction then
       dmGeneral.IBTransaction1.Rollback;
    dmGeneral.IBTransaction1.StartTransaction;

    Consec := '';
    EdFechaDesembolso.Date := Date;
    vFechaDesembolso := Date;
    vDesembolso := 0;
    vPlazo := 0;
    vTipoTasa := 'F';
    vTasaVariable := 0;
    vPuntosAdicionales := 0;
    vTasaEfectiva := 0;
    vTasaMora := 0;
    vTipoCuota := -1;
    vAmortizaCapital := 0;
    vAmortizaInteres := 0;
    vPeriodoGracia := 0;
    vValorCuota := 0;
    vLinea := -1;

    with dmColocacion do
     begin
       if IBDSTiposId.Transaction.InTransaction then
         IBDSTiposId.Transaction.Rollback;
       IBDSTiposId.Transaction.StartTransaction;
       IBDStiposid.Active := true;
       IBDStiposid.Last;
       IBDStiposid.First;
       IBDSclasificacion.Active := true;
       IBDSclasificacion.Last;
       IBDSclasificacion.First;
       IBDSlinea.Active := true;
       IBDSlinea.Last;
       IBDSlinea.First;
       IBDSinversion.Active := true;
       IBDSinversion.Last;
       IBDSinversion.First;
       IBDSrespaldo.Active := true;
       IBDSrespaldo.Last;
       IBDSrespaldo.First;
       IBDSgarantia.Active := true;
       IBDSgarantia.Last;
       IBDSgarantia.First;
       IBDStipocuota.Active := true;
       IBDStipocuota.Last;
       IBDStipocuota.First;
       IBDStasavariable.Active := true;
       IBDStasavariable.Last;
       IBDStasavariable.First;
     end;

    CBlinea.KeyValue  := vLinea;
    CBtasavariable.KeyValue := vTasaVariable;
    EdTipoTasa.ItemIndex := 0;
    CBtipocuota.KeyValue := vTipoCuota;
    EdFechaDesembolso.Date := Date;
    EdValorDesembolso.Text := '';
    EdPlazo.Text := '';
    EdPuntosAdicionales.Text := '';
    EdTasaEfectiva.Text :='';
    EdAmortizaCapital.Text := '';
    EdAmortizaInteres.Text := '';
    EdValorCuota.Caption := '';

    CmdGrabar.Enabled := True;
    CBlinea.SetFocus;
end;

procedure TfrmLiquidaciondePrueba.CmdNuevoClick(Sender: TObject);
begin
        if Consec <> '' then begin
          with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('delete from "col$tablaliquidaciontmp" where ID_COLOCACION = :ID_COLOCACION');
            ParamByName('ID_COLOCACION').AsString := Consec;
            ExecQuery;
            Close;
          end;
        end;
        
        Inicializar;
end;

procedure TfrmLiquidaciondePrueba.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBVarios.Database := dmGeneral.IBDatabase1;
        IBVarios.Transaction := dmGeneral.IBTransaction1;
        IBQuerytabla.Database := dmGeneral.IBDatabase1;
        IBQuerytabla.Transaction := dmGeneral.IBTransaction1;
        IBQDescuento.Database := dmGeneral.IBDatabase1;
        IBQDescuento.Transaction := dmGeneral.IBTransaction1;
        IBQDescuento.Open;
        CDSDescuento.Open;        
        while not IBQDescuento.Eof do
        begin
             CDSDescuento.Append;
             CDSDescuento.FieldByName('ID_DESCUENTO').AsInteger := IBQDescuento.FieldByName('ID_DESCUENTO').AsInteger;
             CDSDescuento.FieldByName('DESCRIPCION_DESCUENTO').AsString := IBQDescuento.FieldbyName('DESCRIPCION_DESCUENTO').AsString;
             CDSDescuento.FieldByName('DESCONTAR').AsBoolean := True;
             CDSDescuento.Post;
             IBQDescuento.Next;
        end;
        dmColocacion := TdmColocacion.Create(Self);
        DBDescontar.Caption := '';
        DBDescontar.Color := GridDescuento.Color;
        DBDescontar.Visible := False;
end;

procedure TfrmLiquidaciondePrueba.GridDescuentoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBDescontar.DataField) then
    begin
     DBDescontar.Left := Rect.Left + GridDescuento.Left + 6;    //15
     DBDescontar.Top := Rect.Top + GridDescuento.top + 2;        //2
     DBDescontar.Width := Rect.Right - Rect.Left;
     DBDescontar.Height := Rect.Bottom - Rect.Top;

     DBDescontar.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBDescontar.DataField) then
    begin
      DrawRect:=Rect;

      InflateRect(DrawRect,-2,-2);

      DrawState := ISChecked[Column.Field.AsBoolean];

      GridDescuento.Canvas.FillRect(Rect);
      DrawFrameControl(GridDescuento.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TfrmLiquidaciondePrueba.GridDescuentoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = Chr(9)) then Exit;

  if (GridDescuento.SelectedField.FieldName = DBDescontar.DataField) then
  begin
    DBDescontar.SetFocus;
    SendMessage(DBDescontar.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TfrmLiquidaciondePrueba.GridDescuentoColExit(Sender: TObject);
begin
      if GridDescuento.SelectedField.FieldName = DBDescontar.DataField then
        DBDescontar.Visible := false;
end;

end.
