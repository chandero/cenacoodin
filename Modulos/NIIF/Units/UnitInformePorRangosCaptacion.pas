unit UnitInformePorRangosCaptacion;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Buttons, DB, Grids, DBGrids,
  IBCustomDataSet, IBQuery, DBClient, pr_Common, pr_TxClasses, IBSQL,
  Provider;

type
  TfrmInformeCaptacionesporRango = class(TForm)
    Panel1: TPanel;
    Label24: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    CmdContinuar: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    DSRangos: TDataSource;
    GroupBox1: TGroupBox;
    IBRangos: TIBQuery;
    IBCaptaciones: TIBQuery;
    IBTiposCaptacion: TIBQuery;
    DSTipoCaptacion: TDataSource;
    IBRangosID_TIPO_CAPTACION: TSmallintField;
    IBRangosID_RANGO: TIntegerField;
    IBRangosMINIMO: TIBBCDField;
    IBRangosMAXIMO: TIBBCDField;
    CmdProcesar: TBitBtn;
    CmdOtro: TBitBtn;
    CmdReporte: TBitBtn;
    CmdCerrar: TBitBtn;
    IBReporte: TIBQuery;
    CDS: TClientDataSet;
    CDSID_RANGO: TIntegerField;
    CDSMINIMO: TCurrencyField;
    CDSMAXIMO: TCurrencyField;
    CDSTOTAL: TIntegerField;
    CDSSUMATORIA: TCurrencyField;
    EdCuenta: TStaticText;
    IBSQL1: TIBSQL;
    Reporte: TprTxReport;
    dspRangos: TDataSetProvider;
    cdsRangos: TClientDataSet;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    cdsRangosID_TIPO_CAPTACION: TSmallintField;
    cdsRangosID_RANGO: TIntegerField;
    cdsRangosMINIMO: TBCDField;
    cdsRangosMAXIMO: TBCDField;
    procedure CmdContinuarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdOtroClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure CmdReporteClick(Sender: TObject);
    procedure DBLCBTipoCaptacionExit(Sender: TObject);
    procedure cdsRangosMINIMOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsRangosMAXIMOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CasoAhorros;
    procedure CasoCertificados;
  public
    { Public declarations }
  end;

var
  frmInformeCaptacionesporRango: TfrmInformeCaptacionesporRango;
  Tipo:Integer;
implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmInformeCaptacionesporRango.CmdContinuarClick(
  Sender: TObject);
begin
        with IBRangos do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "cap$rangos" where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION ORDER BY ID_RANGO ASC');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          try
           Open;
          except
           Transaction.Rollback;
           raise;
          end;
        end;

        cdsRangos.Open;
        cdsRangos.First;

        Panel1.Enabled := False;
        Panel3.Enabled := True;
end;

procedure TfrmInformeCaptacionesporRango.FormShow(Sender: TObject);
begin
        with IBTiposCaptacion do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select');
          SQL.Add('"cap$tipocaptacion".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$tipocaptacion".DESCRIPCION,');
          SQL.Add('"cap$tiposforma".AHORRO,');
          SQL.Add('"cap$tiposforma".CERTIFICADO,');
          SQL.Add('"cap$tiposforma".PROGRAMADO,');
          SQL.Add('"cap$tiposforma".APORTE');
          SQL.Add('from "cap$tipocaptacion"');
          SQL.Add('inner join "cap$tiposforma" on ("cap$tiposforma".ID_FORMA = "cap$tipocaptacion".ID_FORMA)');
          try
           Open;
           Last;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        Panel3.Enabled := False;

end;

procedure TfrmInformeCaptacionesporRango.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeCaptacionesporRango.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeCaptacionesporRango.CmdOtroClick(Sender: TObject);
begin
        EdCuenta.Caption := '';
        IBRangos.Close;
        Panel3.Enabled := False;
        Panel1.Enabled := True;
end;

procedure TfrmInformeCaptacionesporRango.CmdProcesarClick(Sender: TObject);
begin
        with cdsRangos do begin
          ApplyUpdates(-1);
          IBRangos.Transaction.CommitRetaining;

          CDS.EmptyDataSet;
          First;

          while not Eof do begin
            CDS.Open;
            CDS.Insert;
            CDS.FieldByName('ID_RANGO').AsInteger := FieldByName('ID_RANGO').AsInteger;
            CDS.FieldByName('MINIMO').AsCurrency := FieldByName('MINIMO').AsCurrency;
            CDS.FieldByName('MAXIMO').AsCurrency := FieldByName('MAXIMO').AsCurrency;
            CDS.FieldByName('TOTAL').AsInteger := 0;
            CDS.FieldByName('SUMATORIA').AsCurrency := 0;
            CDS.Post;
            CDS.Close;
            Next;
          end;

        end;

        with IBSQL1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select "cap$tiposforma".AHORRO,');
          SQL.Add('"cap$tiposforma".CERTIFICADO, "cap$tiposforma".PROGRAMADO, "cap$tiposforma".APORTE from "cap$tipocaptacion"');
          SQL.Add('inner join "cap$tiposforma" on ("cap$tiposforma".ID_FORMA = "cap$tipocaptacion".ID_FORMA)');
          SQL.Add('where ID_TIPO_CAPTACION = :ID');
          ParamByName('ID').AsInteger := Tipo;
          try
           ExecQuery;
           if (FieldByName('AHORRO').AsInteger <> 0) or
              (FieldByName('APORTE').AsInteger <> 0) or
              (FieldByName('PROGRAMADO').AsInteger <> 0) then CasoAhorros;
           if (FieldByName('CERTIFICADO').AsInteger <> 0) then CasoCertificados;
           Exit;
          except
           Transaction.Rollback;
           raise;
          end;
        end;

        ShowMessage('No se puede procesar ese tipo de captación');
end;

procedure TfrmInformeCaptacionesporRango.CasoAhorros;
var
  test:Boolean;
begin
        with IBReporte do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from SALDOS_CUENTAS_MES(:ID,:ANO,:FECHA1,:FECHA2)');
         ParamByName('ID').AsInteger := DBLCBTipoCaptacion.KeyValue;
         ParamByName('ANO').AsInteger := YearOf(fFechaActual);
         ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),01);
         ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOfTheMonth(fFechaActual));
         try
          Open;
         except
          Transaction.Rollback;
          raise;
          exit;
         end;

         while not Eof do begin
            EdCuenta.Caption := Format('%.7d',[FieldByName('NUMERO').AsInteger]);
            Application.ProcessMessages;
            test := False;
            CDS.Open;
            while not CDS.Eof do begin
              Application.ProcessMessages;
              if (CDS.FieldByName('MINIMO').AsCurrency <= FieldByName('SALDO_ACTUAL').AsCurrency) and
                 (CDS.FieldByName('MAXIMO').AsCurrency >= FieldByName('SALDO_ACTUAL').AsCurrency) then begin
                 CDS.Edit;
                 CDS.FieldByName('TOTAL').AsInteger := CDS.FieldByName('TOTAL').AsInteger + 1;
                 CDS.FieldByName('SUMATORIA').AsCurrency := CDS.FieldByName('SUMATORIA').AsCurrency + FieldByName('SALDO_ACTUAL').AsCurrency;
                 CDS.Post;
                 test := True;
                 Break;
              end;
              CDS.Next;
            end;
            CDS.Close;
            Next;
         end;
        end;
        CmdReporte.Click;
end;

procedure TfrmInformeCaptacionesporRango.CasoCertificados;
begin
       with IBReporte do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from "cap$maestro" where ID_TIPO_CAPTACION = :ID and (ID_ESTADO = 1 or ID_ESTADO = 6 or ID_ESTADO = 12) order by ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA');
         ParamByName('ID').AsInteger := Tipo;
         try
          Open;
         except
          Transaction.Rollback;
          raise;
         end;

         while not Eof do begin
            EdCuenta.Caption := Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]);
            Application.ProcessMessages;
            CDS.Open;
            CDS.First;
            while not CDS.Eof do begin
              if (CDS.FieldByName('MINIMO').AsCurrency <= FieldByName('VALOR_INICIAL').AsCurrency) and
                 (CDS.FieldByName('MAXIMO').AsCurrency >= FieldByName('VALOR_INICIAL').AsCurrency) then begin
                 CDS.Edit;
                 CDS.FieldByName('TOTAL').AsInteger := CDS.FieldByName('TOTAL').AsInteger + 1;
                 CDS.FieldByName('SUMATORIA').AsCurrency := CDS.FieldByName('SUMATORIA').AsCurrency + FieldByName('VALOR_INICIAL').AsCurrency;
                 CDS.Post;
                 Break;
              end;
              CDS.Next;
            end;
            CDS.Close;
            Next;
         end;
       end;
       CmdReporte.Click;
end;

procedure TfrmInformeCaptacionesporRango.CmdReporteClick(Sender: TObject);
var
DescAgencia:string;
begin
//        CDS.IndexDefs.Update;
//        CDS.IndexName := CDS.IndexDefs.Items[0].Name;
        if not IBTiposCaptacion.Active then
          IBTiposCaptacion.Open;
        Reporte.Variables.ByName['vEMPRESA'].AsString := Empresa;
        Reporte.Variables.ByName['vCAPTACION'].AsString := IBTiposCaptacion.FieldByName('DESCRIPCION').AsString;
        case Agencia of
         1 : DescAgencia := 'OCANA';
         2 : DescAgencia := 'ABREGO';
         3 : DescAgencia := 'CONVENCION';
        end;
        Reporte.Variables.ByName['AGENCIA'].AsString := DescAgencia;
        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);
end;

procedure TfrmInformeCaptacionesporRango.DBLCBTipoCaptacionExit(
  Sender: TObject);
begin
        Tipo := DBLCBTipoCaptacion.KeyValue;
end;

procedure TfrmInformeCaptacionesporRango.cdsRangosMINIMOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := FormatCurr('#,0',Sender.Value); 
end;

procedure TfrmInformeCaptacionesporRango.cdsRangosMAXIMOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := FormatCurr('#,0',Sender.Value);
end;

procedure TfrmInformeCaptacionesporRango.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then Key := #9;
end;

end.
