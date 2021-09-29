unit UnitConsultaExtractoCaptacionOtros;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, IBCustomDataSet, IBQuery, StdCtrls, JvEdit, DBCtrls,
  Grids, DBGrids, JvDBCtrl, ExtCtrls, JvTypedEdit, ComCtrls, Buttons,
  pr_TxClasses, pr_Common, pr_Classes, pr_Parser, XStringGrid, IBDatabase;

type
  TfrmConsultaExtractoCaptacionOtros = class(TForm)
    IBTiposCaptacion: TIBQuery;
    DSTiposCaptacion: TDataSource;
    IBConsulta: TIBSQL;
    IBExtracto: TIBQuery;
    Panel1: TPanel;
    DSTiposMovimiento: TDataSource;
    IBTiposMovimiento: TIBQuery;
    JvDBGrid1: TJvDBGrid;
    IBTiposMovimientoID_TIPO_MOVIMIENTO: TSmallintField;
    IBTiposMovimientoDESCRIPCION_MOVIMIENTO: TIBStringField;
    IBExtractoID_TIPO_MOVIMIENTO: TSmallintField;
    IBExtractoDOCUMENTO_MOVIMIENTO: TIBStringField;
    IBExtractoFECHA_MOVIMIENTO: TDateField;
    IBExtractoHORA_MOVIMIENTO: TTimeField;
    IBExtractoDESCRIPCION_MOVIMIENTO: TIBStringField;
    IBExtractoVALOR_DEBITO: TIBBCDField;
    IBExtractoVALOR_CREDITO: TIBBCDField;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    TipoInforme: TRadioGroup;
    CmdReporte: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdOtro: TBitBtn;
    GridExtracto: TXStringGrid;
    IBmaestrotitular: TIBQuery;
    IBPersonas: TIBQuery;
    DSExtracto: TDataSource;
    ReporteB: TprTxReport;
    TipoReporte: TRadioGroup;
    IBQuery1: TIBQuery;
    IBExtracto1: TIBQuery;
    ReporteBr: TprTxReport;
    IBTExtracto: TIBTransaction;
    Label7: TLabel;
    EdTotCheques: TStaticText;
    EdValorCheques: TStaticText;
    btnVerDetalle: TBitBtn;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdSaldoInicial: TStaticText;
    EdTotDebito: TStaticText;
    EdTotCredito: TStaticText;
    EdSaldoFinal: TStaticText;
    EdSaldoDisponible: TStaticText;
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    EdNumeroCap: TJvEdit;
    EdDigitoCap: TStaticText;
    EdNombreCap: TStaticText;
    EdAnoCap: TJvYearEdit;
    EdFechaI: TDateTimePicker;
    EdFechaF: TDateTimePicker;
    CmdActualizar: TBitBtn;
    ReporteB1: TprTxReport;
    ReporteBr1: TprTxReport;
    procedure EdNumeroCapKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCapExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdAnoCapExit(Sender: TObject);
    procedure CmdActualizarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdOtroClick(Sender: TObject);
    procedure CmdReporteClick(Sender: TObject);
    procedure ReporteBUnknownObjFunction(Sender: TObject;
      Component: TComponent; const FuncName: String;
      const Parameters: TprVarsArray; ParametersCount: Integer;
      var Value: TprVarValue; var IsProcessed: Boolean);
    procedure ReporteBUnknownFunction(Sender: TObject;
      const FuncName: String; const Parameters: TprVarsArray;
      ParametersCount: Integer; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure EdFechaFExit(Sender: TObject);
    procedure ReporteBrUnknownFunction(Sender: TObject;
      const FuncName: String; const Parameters: TprVarsArray;
      ParametersCount: Integer; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure ReporteBrUnknownObjFunction(Sender: TObject;
      Component: TComponent; const FuncName: String;
      const Parameters: TprVarsArray; ParametersCount: Integer;
      var Value: TprVarValue; var IsProcessed: Boolean);
    procedure btnVerDetalleClick(Sender: TObject);
  private
    FTp:Integer;
    FAg:Integer;
    FCta:Integer;
    FDgt:Integer;
    { Private declarations }
  public
    procedure Inicializar;
    property Tipo:Integer read FTp Write FTp;
    property AgenciaA:Integer read FAg Write FAg;
    property Cuenta:Integer read FCta Write FCta;
    property Digito:Integer read FDgt Write FDgt;
    { Public declarations }
  end;

var
  frmConsultaExtractoCaptacionOtros: TfrmConsultaExtractoCaptacionOtros;
  Saldo :Currency;
  SaldoInicial,SaldoFinal,SaldoDisponible,TotalDebito,TotalCredito,Canje:Currency;
  TablaExtracto:string;

implementation

{$R *.dfm}

uses UnitdmGeneral, UnitGlobales, UnitRelacionChequesEnCanje;

procedure TfrmConsultaExtractoCaptacionOtros.Inicializar;
begin
     if IBTExtracto.InTransaction Then
        IBTExtracto.Rollback;

     IBTExtracto.StartTransaction;

     IBTiposCaptacion.Open;
     IBTiposCaptacion.Last;

     IBTiposMovimiento.Open;
     IBTiposMovimientoID_TIPO_MOVIMIENTO.DisplayFormat := '000';
     IBExtractoID_TIPO_MOVIMIENTO.DisplayFormat := '000';
     IBExtractoVALOR_DEBITO.DisplayFormat := '#,#0.00';
     IBExtractoVALOR_CREDITO.DisplayFormat := '#,#0.00';

     SaldoInicial := 0;

     GridExtracto.RowCount := 2;
     GridExtracto.Cells[0,1] := '';
     GridExtracto.Cells[1,1] := '';
     GridExtracto.Cells[2,1] := '';
     GridExtracto.Cells[3,1] := '';
     GridExtracto.Cells[4,1] := '';
     GridExtracto.Cells[5,1] := '';
     GridExtracto.Cells[6,1] := '';
     GridExtracto.Cells[7,1] := '';
     EdSaldoInicial.Caption := '';
     EdTotDebito.Caption := '';
     EdTotCredito.Caption := '';
     EdSaldoFinal.Caption := '';
     EdSaldoDisponible.Caption := '';
     EdNumeroCap.Text := '';
     EdDigitoCap.Caption := '';

     EdNombreCap.Caption := '';



     if (FTp <> 0) and (FAg <> 0) and (FCta <> 0) then begin
        DBLCBTipoCaptacion.KeyValue := Tipo;
        EdNumeroCap.Text := Format('%.7d',[Cuenta]);
        EdDigitoCap.Caption := IntToStr(Digito);
        EdNumeroCapExit(EdNumeroCap);
        Cuenta := 0;
        EdAnoCap.Value := YearOf(fFechaActual) - 2;
        EdAnoCapexit(Self);
        CmdActualizar.Click;
      end
     else
      begin
        EdAnoCap.Value := YearOf(fFechaActual) - 2;
        EdAnoCapExit(EdAnoCap);
        EdFechaI.Date := EncodeDate(EdAnoCap.Value,01,01);
        EdFechaF.Date := EncodeDate(EdAnoCap.Value,12,31);
        EdAnoCap.Enabled := False;
        EdFechaI.Enabled := False;
        EdFechaF.Enabled := False;
        EdNumeroCap.Enabled := True;
        DBLCBTipoCaptacion.Enabled := True;
        CmdActualizar.Enabled := False;
        GroupBox1.Enabled := False;
        GroupBox9.Enabled := True;
        GridExtracto.RowCount := 2;
        GridExtracto.Cells[0,1] := '';
        GridExtracto.Cells[1,1] := '';
        GridExtracto.Cells[2,1] := '';
        GridExtracto.Cells[3,1] := '';
        GridExtracto.Cells[4,1] := '';
        GridExtracto.Cells[5,1] := '';
        GridExtracto.Cells[6,1] := '';
        GridExtracto.Cells[7,1] := '';
        EdSaldoInicial.Caption := '';
        EdTotDebito.Caption := '';
        EdTotCredito.Caption := '';
        EdSaldoFinal.Caption := '';
        EdSaldoDisponible.Caption := '';

        DBLCBTipoCaptacion.SetFocus;
      end;


     Cuenta := 0;
     Digito := 0;
end;

procedure TfrmConsultaExtractoCaptacionOtros.EdNumeroCapKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsultaExtractoCaptacionOtros.EdNumeroCapExit(Sender: TObject);
var id_iden :Integer;
    id_per : string;
begin
        if EdNumeroCap.Text = '' then Abort;

        EdNumeroCap.Text := Format('%.7d',[StrToInt(EdNumeroCap.Text)]);
        EdDigitoCap.Caption := DigitoControl(DBLCBTipoCaptacion.KeyValue,format('%.7d',[StrToInt(EdNumeroCap.Text)]));


        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "cap$maestro" ');
             SQL.Add(' LEFT JOIN "cap$maestrotitular" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and "cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and ');
             SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and "cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA and "cap$maestrotitular".NUMERO_TITULAR = 1)');
             SQL.Add('where "cap$maestro".ID_AGENCIA = :"ID_AGENCIA" and "cap$maestro".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and "cap$maestro".NUMERO_CUENTA = :"NUMERO_CUENTA" and "cap$maestro".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             try
               ExecQuery;
             except
               MessageDlg('No se pudo realizar la consulta',mtError,[mbcancel],0);
               Abort;
             end;
             if RecordCount = 0 then
             begin
                MessageDlg('Captación No Existe!',mtError,[mbcancel],0);
//                EdNumeroCap.SetFocus;
//                Exit;
             end;
             id_per := FieldByName('ID_PERSONA').AsString;
             id_iden := FieldByName('ID_IDENTIFICACION').AsInteger;
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,');
             SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$persona".NOMBRE from "gen$persona" ');
             SQL.Add(' where ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA" ');
             ParamByName('ID_IDENTIFICACION').AsInteger := id_iden;
             ParamByName('ID_PERSONA').AsString := id_per;
             try
               ExecQuery;
             except
               MessageDlg('No se pudo realizar la consulta',mtError,[mbcancel],0);
//               Exit;
             end;

             EdAnoCap.Enabled := True;
             EdAnoCap.SetFocus;
             EdFechaI.Enabled := True;
             EdFechaF.Enabled := True;
             EdNumeroCap.Enabled := False;
             DBLCBTipoCaptacion.Enabled := False;

             EdNombreCap.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                    FieldByName('NOMBRE').AsString;


        end;

end;

procedure TfrmConsultaExtractoCaptacionOtros.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmConsultaExtractoCaptacionOtros.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmConsultaExtractoCaptacionOtros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        IBTExtracto.Commit;
        CanClose := True;
end;

procedure TfrmConsultaExtractoCaptacionOtros.EdAnoCapExit(Sender: TObject);
begin
        try

          if (EdAnoCap.Value = YearOf(fFechaActual) ) or
             (EdAnoCap.Value = YearOf(fFechaActual) - 1 ) then
          begin
              MessageDlg('Este año debe procesarse por la opción normal de extractos',
                          mtInformation,[mbok],0);
              EdAnoCap.Value := YearOf(fFechaActual) - 2;
              Exit;
          end;

          EdFechaI.MinDate := EncodeDate(EdAnoCap.Value,01,01);
          EdFechaI.MaxDate := EncodeDate(EdAnoCap.Value,12,31);
          EdFechaF.MinDate := EncodeDate(EdAnoCap.Value,01,01);
          EdFechaF.MaxDate := EncodeDate(EdAnoCap.Value,12,31);
          EdFechaI.Date := EdFechaI.MinDate;
          EdFechaI.Date := EncodeDate(EdAnoCap.Value,01,01);
          EdFechaF.Date := EncodeDate(EdAnoCap.Value,12,31);
          if YearOf(fFechaActual) > EdAnoCap.Value then
             EdFechaF.Date := EncodeDate(EdAnoCap.Value,12,31)
          else
             EdFechaF.Date := fFechaActual - 2;
        finally
          TablaExtracto := '"cap$extracto' + IntToStr(EdAnoCap.Value)+'"';
        end;
end;

procedure TfrmConsultaExtractoCaptacionOtros.CmdActualizarClick(Sender: TObject);
var FechaI :TDate;
begin
        Saldo := 0;
        SaldoInicial := 0;
        CmdActualizar.Enabled := False;
        GroupBox9.Enabled := False;
        Application.ProcessMessages;
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select SALDO_INICIAL from "cap$maestrosaldoinicial" ');
             SQL.Add(' where "cap$maestrosaldoinicial".ID_AGENCIA = :"ID_AGENCIA" and ');
             SQL.Add('"cap$maestrosaldoinicial".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
             SQL.Add('"cap$maestrosaldoinicial".NUMERO_CUENTA = :"NUMERO_CUENTA" and ');
             SQL.Add('"cap$maestrosaldoinicial".DIGITO_CUENTA = :"DIGITO_CUENTA" and ANO = :"ANO"');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             ParamByName('ANO').AsString := IntToStr(EdAnoCap.Value);
             try
               ExecQuery;
             except
               MessageDlg('No se pudo realizar la consulta del saldo inicial',mtError,[mbcancel],0);
               Abort;
             end;
             SaldoInicial := FieldByName('SALDO_INICIAL').AsCurrency;
        end;

        FechaI := EncodeDate(EdAnoCap.Value,01,01);

        if FechaI <> Int(EdFechaI.Date) then
        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select SUM(VALOR_DEBITO - VALOR_CREDITO) AS SUMA from '+ TablaExtracto);//"cap$extracto" ');
             SQL.Add('where (ID_AGENCIA = :"ID_AGENCIA" ) and ');
             SQL.Add('(ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) and ');
             SQL.Add('(NUMERO_CUENTA = :"NUMERO_CUENTA") and (DIGITO_CUENTA = :"DIGITO_CUENTA") and ');
             SQL.Add('(FECHA_MOVIMIENTO BETWEEN :"FECHA1" and :"FECHA2" )');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             ParamByName('FECHA1').AsDate := EncodeDate(EdAnoCap.Value,01,01);
             ParamByName('FECHA2').AsDate := IncDay(EdFechaI.Date,-1);
             try
               Screen.Cursor := crHourGlass;
               ExecQuery;
               Screen.Cursor := crDefault;
             except
               MessageDlg('No se pudo realizar la consulta del extracto saldo inicial',mtError,[mbcancel],0);
               Abort;
             end;
             Saldo := FieldByName('SUMA').AsCurrency;
        end;

        SaldoInicial := SaldoInicial + Saldo;
        Saldo := SaldoInicial;

        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select SUM(VALOR_DEBITO) AS TDEBITO,SUM(VALOR_CREDITO) AS TCREDITO from ' + TablaExtracto);//"cap$extracto" ');
             SQL.Add('where (ID_AGENCIA = :"ID_AGENCIA" ) and ');
             SQL.Add('(ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) and ');
             SQL.Add('(NUMERO_CUENTA = :"NUMERO_CUENTA") and (DIGITO_CUENTA = :"DIGITO_CUENTA") and ');
             SQL.Add('(FECHA_MOVIMIENTO BETWEEN :"FECHA1" and :"FECHA2")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             ParamByName('FECHA1').AsDate := EdFechaI.Date;
             ParamByName('FECHA2').AsDate := EdFechaF.Date;
             try
               Screen.Cursor := crHourGlass;
               ExecQuery;
               Screen.Cursor := crDefault;
             except
               MessageDlg('No se pudo realizar la consulta del extracto totales débito y crédito',mtError,[mbcancel],0);
               Abort;
             end;
             TotalDebito := FieldByName('TDEBITO').AsCurrency;
             TotalCredito := FieldByName('TCREDITO').AsCurrency;
             EdTotDebito.Caption  := FormatCurr('#,#0.00',FieldByName('TDEBITO').AsCurrency);
             EdTotcredito.Caption := FormatCurr('#,#0.00',FieldByName('TCREDITO').AsCurrency);
        end;

        SaldoFinal := SaldoInicial + TotalDebito - TotalCredito;

        EdSaldoInicial.Caption := FormatCurr('$#,#0.00',SaldoInicial);
        EdSaldoFinal.Caption := FormatCurr('$#,#0.00',SaldoFinal);


        with IBExtracto do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select');
             SQL.Add('  ID_TIPO_MOVIMIENTO,');
             SQL.Add('  DOCUMENTO_MOVIMIENTO,');
             SQL.Add('  FECHA_MOVIMIENTO,');
             SQL.Add('  HORA_MOVIMIENTO,');
             SQL.Add('  DESCRIPCION_MOVIMIENTO,');
             SQL.Add('  VALOR_DEBITO,');
             SQL.Add('  VALOR_CREDITO');
             SQL.Add('from ');
             SQL.Add(TablaExtracto);
             SQL.Add('where');
             SQL.Add('  (ID_AGENCIA = :"ID_AGENCIA" ) ');
             SQL.Add(' and');
             SQL.Add(' (ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) ');
             SQL.Add(' and');
             SQL.Add(' (NUMERO_CUENTA = :"NUMERO_CUENTA") ');
             SQL.Add(' and');
             SQL.Add(' (DIGITO_CUENTA = :"DIGITO_CUENTA")');
             SQL.Add(' and ');
             SQL.Add('(FECHA_MOVIMIENTO between :"FECHA1" and :"FECHA2")');
             SQL.Add('order by');
             SQL.Add(' FECHA_MOVIMIENTO, HORA_MOVIMIENTO, VALOR_CREDITO');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             ParamByName('FECHA1').AsDate := EdFechaI.Date;
             ParamByName('FECHA2').AsDate := EdFechaF.Date;
             try
               Screen.Cursor := crHourGlass;
               Open;
               Screen.Cursor := crDefault;
               GroupBox1.Enabled := True;
             except
               MessageDlg('No se pudo realizar la consulta del extracto',mtError,[mbcancel],0);
               Abort;
             end;

             while not Eof do
             begin
               Application.ProcessMessages;
               if RecNo > 1 then GridExtracto.RowCount := RecNo + 1;
               GridExtracto.Cells[0,RecNo] := DateToStr(FieldByName('FECHA_MOVIMIENTO').AsDateTime);
               GridExtracto.Cells[1,RecNo] := TimeToStr(FieldByName('HORA_MOVIMIENTO').AsDateTime);
               GridExtracto.Cells[2,RecNo] := FieldByName('DOCUMENTO_MOVIMIENTO').AsString;
               GridExtracto.Cells[3,RecNo] := Format('%.3d',[FieldByName('ID_TIPO_MOVIMIENTO').AsInteger]);
               GridExtracto.Cells[4,RecNo] := FieldByName('DESCRIPCION_MOVIMIENTO').AsString;
               GridExtracto.Cells[5,RecNo] := FormatCurr('#,#0.00',FieldByName('VALOR_DEBITO').AsCurrency);
               GridExtracto.Cells[6,RecNo] := FormatCurr('#,#0.00',FieldByName('VALOR_CREDITO').AsCurrency);
               Saldo := Saldo + (FieldByName('VALOR_DEBITO').AsCurrency) - (FieldByName('VALOR_CREDITO').AsCurrency);
               GridExtracto.Cells[7,RecNo] := FormatCurr('#,#0.00',Saldo);
               Next;
             end;
        end;

        with IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select count(*) as CANTIDAD, sum(VALOR_CHEQUE) as VALOR');
          SQL.Add('from "cap$canje"');
          SQL.Add('where (ID_AGENCIA = :"ID_AGENCIA" ) and ');
          SQL.Add('(ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) and ');
          SQL.Add('(NUMERO_CUENTA = :"NUMERO_CUENTA") and (DIGITO_CUENTA = :"DIGITO_CUENTA") and ');
          SQL.Add('LIBERADO = 0 and DEVUELTO = 0');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;

          EdTotCheques.Caption := IntToStr(FieldByName('CANTIDAD').AsInteger);
          EdValorCheques.Caption := FormatCurr('$#,0.00',FieldByName('VALOR').AsCurrency);

          SaldoDisponible := SaldoFinal - FieldByName('VALOR').AsCurrency;
          EdSaldoDisponible.Caption := FormatCurr('$#,#0.00',SaldoDisponible);

          Close;
        end;

        GroupBox1.Enabled := True;

end;

procedure TfrmConsultaExtractoCaptacionOtros.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsultaExtractoCaptacionOtros.CmdOtroClick(Sender: TObject);
begin
                Inicializar;
end;

procedure TfrmConsultaExtractoCaptacionOtros.CmdReporteClick(Sender: TObject);
begin
        Saldo := SaldoInicial;
        case TipoReporte.ItemIndex of
        0: begin
            with IBExtracto do begin
             SQL.Clear;
             SQL.Add('select ID_TIPO_MOVIMIENTO, DOCUMENTO_MOVIMIENTO, FECHA_MOVIMIENTO, HORA_MOVIMIENTO, DESCRIPCION_MOVIMIENTO, VALOR_DEBITO, VALOR_CREDITO');
             SQL.Add('from '+ TablaExtracto);//"cap$extracto"');
             SQL.Add('where (ID_AGENCIA = :"ID_AGENCIA" ) and (ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) and (NUMERO_CUENTA = :"NUMERO_CUENTA") and ');
             SQL.Add('(DIGITO_CUENTA = :"DIGITO_CUENTA") and (FECHA_MOVIMIENTO between :"FECHA1" and :"FECHA2")');
             SQL.Add('order by FECHA_MOVIMIENTO,HORA_MOVIMIENTO');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             ParamByName('FECHA1').AsDate := EdFechaI.Date;
             ParamByName('FECHA2').AsDate := EdFechaF.Date;
             Open;
            end;
           case TipoInforme.ItemIndex of
           0: with ReporteB1 do
              begin
               Variables.ByName['Empresa'].AsString := Empresa;
               Variables.ByName['FechaHoy'].AsDateTime := Date;
               Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;
               Variables.ByName['Numero_Captacion'].AsString := Format('%.2d',[Agencia]) + '-' + EdNumeroCap.Text + '-' + EdDigitoCap.Caption;
               Variables.ByName['Nombre_Titular'].AsString := EdNombreCap.Caption;
               Variables.ByName['Fecha_Inicial'].AsDateTime := EdFechaI.Date;
               Variables.ByName['Fecha_Final'].AsDateTime   := EdFechaF.Date;
               Variables.ByName['Saldo_Inicial'].AsDouble := SaldoInicial;
               if PrepareReport then
                  PreviewPreparedReport(True);
              end;
           end;
           end;
        1: begin
            with IBExtracto1 do begin
             Close;
             SQL.Clear;
             SQL.Add('select ID_TIPO_MOVIMIENTO, DOCUMENTO_MOVIMIENTO, FECHA_MOVIMIENTO, HORA_MOVIMIENTO, DESCRIPCION_MOVIMIENTO, VALOR_DEBITO, VALOR_CREDITO');
             SQL.Add('from '+ TablaExtracto);//"cap$extracto"');
             SQL.Add('where ((ID_AGENCIA = :"ID_AGENCIA" ) and (ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) and (NUMERO_CUENTA = :"NUMERO_CUENTA") and ');
             SQL.Add('(DIGITO_CUENTA = :"DIGITO_CUENTA")) and (FECHA_MOVIMIENTO between :"FECHA1" and :"FECHA2")');
             SQL.Add('and ((ID_TIPO_MOVIMIENTO <> :TP1) and (ID_TIPO_MOVIMIENTO <> :TP2))');
             SQL.Add('order by FECHA_MOVIMIENTO,HORA_MOVIMIENTO');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             ParamByName('FECHA1').AsDate := EdFechaI.Date;
             ParamByName('FECHA2').AsDate := EdFechaF.Date;
             ParamByName('TP1').AsInteger := 7;
             ParamByName('TP2').AsInteger := 8;
//             ParamByName('TP3').AsInteger := 15;
//             ParamByName('TP4').AsInteger := 16;
             Open;
            end;
            with IBQuery1 do begin
             Close;
             SQL.Clear;
             SQL.Add('select SUM(VALOR_DEBITO) AS DEBITO,SUM(VALOR_CREDITO) AS CREDITO from '+ TablaExtracto);//"cap$extracto"');
             SQL.Add('where ((ID_AGENCIA = :"ID_AGENCIA" ) and (ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) and (NUMERO_CUENTA = :"NUMERO_CUENTA") and ');
             SQL.Add('(DIGITO_CUENTA = :"DIGITO_CUENTA")) and (FECHA_MOVIMIENTO between :"FECHA1" and :"FECHA2")');
             SQL.Add('and ((ID_TIPO_MOVIMIENTO = :TP1) or (ID_TIPO_MOVIMIENTO = :TP2))');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             ParamByName('FECHA1').AsDate := EdFechaI.Date;//(YearOf(EdFechaI.Date),MonthOf(EdFechaI.Date),DayOf(EdFechaI.Date));
             ParamByName('FECHA2').AsDate := EdFechaF.Date; //(YearOf(EdFechaF.Date),MonthOf(EdFechaF.Date),DayOf(EdFechaF.Date));
             ParamByName('TP1').AsInteger := 7;
             ParamByName('TP2').AsInteger := 8;
//             ParamByName('TP3').AsInteger := 15;
//             ParamByName('TP4').AsInteger := 16;
             Open;
             ReporteBr.Variables.ByName['TotalIntereses'].AsDouble := FieldByName('DEBITO').AsCurrency;
             ReporteBr.Variables.ByName['TotalRetenciones'].AsDouble := FieldByName('CREDITO').AsCurrency;             
             ReporteBr1.Variables.ByName['TotalIntereses'].AsDouble := FieldByName('DEBITO').AsCurrency;
             ReporteBr1.Variables.ByName['TotalRetenciones'].AsDouble := FieldByName('CREDITO').AsCurrency;             
           end;
           case TipoInforme.ItemIndex of
           0: with ReporteBr1 do
              begin
               Variables.ByName['Empresa'].AsString := Empresa;
               Variables.ByName['FechaHoy'].AsDateTime := Date;
               Variables.ByName['Captacion'].AsString := DBLCBTipoCaptacion.Text;
               Variables.ByName['Numero_Captacion'].AsString := Format('%.2d',[Agencia]) + '-' + EdNumeroCap.Text + '-' + EdDigitoCap.Caption;
               Variables.ByName['Nombre_Titular'].AsString := EdNombreCap.Caption;
               Variables.ByName['Fecha_Inicial'].AsDateTime := EdFechaI.Date;
               Variables.ByName['Fecha_Final'].AsDateTime := EdFechaF.Date;
               Variables.ByName['Saldo_Inicial'].AsDouble := SaldoInicial;
               if PrepareReport then
                  PreviewPreparedReport(True);
              end;
           end;
         end;
        end;
end;

procedure TfrmConsultaExtractoCaptacionOtros.ReporteBUnknownObjFunction(
  Sender: TObject; Component: TComponent; const FuncName: String;
  const Parameters: TprVarsArray; ParametersCount: Integer;
  var Value: TprVarValue; var IsProcessed: Boolean);
begin
  IsProcessed := False;
  if (Component=IBExtracto) and
   (AnsiCompareText(FuncName,'IBExtracto.Field')=0) and
   (ParametersCount=1) then
  begin
           Saldo := Saldo + IBExtracto.FieldByName('VALOR_DEBITO').AsCurrency -
                            IBExtracto.FieldByName('VALOR_CREDITO').AsCurrency;
           ReporteB.Variables.ByName['Saldo_Inicial'].Formula := CurrToStr(Saldo);
           ReporteB1.Variables.ByName['Saldo_Inicial'].Formula := CurrToStr(Saldo);
           _vSetAsDouble(Value,Saldo);
           IsProcessed := True;
  end;
end;

procedure TfrmConsultaExtractoCaptacionOtros.ReporteBUnknownFunction(
  Sender: TObject; const FuncName: String; const Parameters: TprVarsArray;
  ParametersCount: Integer; var Value: TprVarValue;
  var IsProcessed: Boolean);
begin
        IsProcessed := False;
        if ( FuncName = 'CALCULAR' ) and
           ( Parameters[0].vString = 'Saldo_Final' ) then
        begin
           _vSetAsDouble(Value,Saldo);
           IsProcessed := True;
        end;

end;

procedure TfrmConsultaExtractoCaptacionOtros.EdFechaFExit(Sender: TObject);
begin
        CmdActualizar.Enabled := True;
        CmdActualizar.SetFocus;
end;


procedure TfrmConsultaExtractoCaptacionOtros.ReporteBrUnknownFunction(
  Sender: TObject; const FuncName: String; const Parameters: TprVarsArray;
  ParametersCount: Integer; var Value: TprVarValue;
  var IsProcessed: Boolean);
begin
        IsProcessed := False;
        if ( FuncName = 'CALCULAR' ) and
           ( Parameters[0].vString = 'Saldo_Final' ) then
        begin
           ReporteBr.Variables.ByName['SaldoACorte'].AsDouble := Saldo + ReporteBr.Variables.ByName['TotalIntereses'].AsDouble -
           ReporteBr.Variables.ByName['TotalRetenciones'].AsDouble;
           ReporteBr1.Variables.ByName['SaldoACorte'].AsDouble := Saldo + ReporteBr.Variables.ByName['TotalIntereses'].AsDouble -
           ReporteBr1.Variables.ByName['TotalRetenciones'].AsDouble;
           _vSetAsDouble(Value,Saldo);
           IsProcessed := True;
        end;

end;

procedure TfrmConsultaExtractoCaptacionOtros.ReporteBrUnknownObjFunction(
  Sender: TObject; Component: TComponent; const FuncName: String;
  const Parameters: TprVarsArray; ParametersCount: Integer;
  var Value: TprVarValue; var IsProcessed: Boolean);
begin
  IsProcessed := False;
  if (Component=IBExtracto1) and
   (AnsiCompareText(FuncName,'IBExtracto1.Field')=0) and
   (ParametersCount=1) then
  begin
           Saldo := Saldo + IBExtracto1.FieldByName('VALOR_DEBITO').AsCurrency -
                            IBExtracto1.FieldByName('VALOR_CREDITO').AsCurrency;
           ReporteB.Variables.ByName['Saldo_Inicial'].Formula := CurrToStr(Saldo);
           _vSetAsDouble(Value,Saldo);
           IsProcessed := True;
  end;

end;

procedure TfrmConsultaExtractoCaptacionOtros.btnVerDetalleClick(
  Sender: TObject);
var frmRelacionChequesEnCanje:TfrmRelacionChequesEnCanje;
begin
    frmRelacionChequesEnCanje := TfrmRelacionChequesEnCanje.Create(Self);
    with frmRelacionChequesEnCanje do
    begin
         idagencia := Agencia;
         idtipo := DBLCBTipoCaptacion.KeyValue;
         cuenta := StrToInt(EdNumeroCap.Text);
         digito := StrToInt(EdDigitoCap.Caption);
         ShowModal;
    end;
end;

end.
