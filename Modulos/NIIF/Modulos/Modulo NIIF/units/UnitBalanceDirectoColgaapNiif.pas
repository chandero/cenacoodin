unit UnitBalanceDirectoColgaapNiif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitDmGeneral, StdCtrls, Buttons, DB, DBClient, ExtCtrls, Grids,
  DBGrids, IBCustomDataSet, IBQuery;

type
  TfrmBalanceDirectoColgaapNiif = class(TForm)
    GroupBox1: TGroupBox;
    Label5: TLabel;
    CBMeses: TComboBox;
    btnCerrar: TBitBtn;
    CDScolgaap: TClientDataSet;
    DScolgaap: TDataSource;
    DSniif: TDataSource;
    CDSniif: TClientDataSet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnAExcel: TBitBtn;
    Panel2: TPanel;
    btnAExcelNiif: TBitBtn;
    DBGcolgaap: TDBGrid;
    DBGniif: TDBGrid;
    CDScolgaapCODIGO: TStringField;
    CDScolgaapCUENTA: TStringField;
    CDScolgaapSALDO: TCurrencyField;
    CDSniifCODIGO: TStringField;
    CDSniifCUENTA: TStringField;
    CDSniifSALDO: TCurrencyField;
    CDSprocesarcolgaap: TClientDataSet;
    CDSprocesarniif: TClientDataSet;
    CDSprocesarcolgaapCODIGO: TStringField;
    CDSprocesarcolgaapSALDO_ANTERIOR: TCurrencyField;
    CDSprocesarcolgaapDEBITO_MOV: TCurrencyField;
    CDSprocesarcolgaapCREDITO_MOV: TCurrencyField;
    CDSprocesarcolgaapSALDO_ACTUAL: TCurrencyField;
    IBQsaldoact: TIBQuery;
    IBQpuc: TIBQuery;
    IBQuery1: TIBQuery;
    CDSprocesarniifCODIGO: TStringField;
    CDSprocesarniifCUENTA: TStringField;
    CDSprocesarniifNIVEL: TIntegerField;
    CDSprocesarniifCODIGO_MAYOR: TStringField;
    CDSprocesarniifSALDO: TCurrencyField;
    CDScolgaapMOVIMIENTO: TIntegerField;
    CDSprocesarcolgaapMOVIMIENTO: TIntegerField;
    CDSprocesarcolgaapCUENTA: TStringField;
    SD1: TSaveDialog;
    GroupBox4: TGroupBox;
    DBGsinparalelo: TDBGrid;
    CDSsinparalelo: TClientDataSet;
    DSsinparalelo: TDataSource;
    CDSsinparaleloCODIGO: TStringField;
    CDSsinparaleloCUENTA: TStringField;
    CDSsinparaleloSALDO: TCurrencyField;
    Panel3: TPanel;
    btnAExcelsinParalelo: TBitBtn;
    CDSniifNIVEL: TIntegerField;
    CDSniifMOVIMIENTO: TIntegerField;
    CDSprocesarcolgaapNIVEL: TIntegerField;
    CDScolgaapNIVEL: TIntegerField;
    CDSprocesarniifMOVIMIENTO: TIntegerField;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure btnAExcelNiifClick(Sender: TObject);
    procedure btnAExcelsinParaleloClick(Sender: TObject);
    procedure DBGniifTitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure ActualizarCodigoMayor(Codigo: String; Saldo:Currency);
  public
    { Public declarations }
  end;

var
  frmBalanceDirectoColgaapNiif: TfrmBalanceDirectoColgaapNiif;
  dmGeneral : TdmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales, UnitPantallaProgreso, DataSetToExcel;

procedure TfrmBalanceDirectoColgaapNiif.btnCerrarClick(Sender: TObject);
begin
        dmGeneral.Free;
        Close;
end;

procedure TfrmBalanceDirectoColgaapNiif.btnProcesarClick(Sender: TObject);
var
SaldoAnterior:Currency;
SumDebito,SumCredito:Currency;
Debito, Credito, Valor: Currency;
frmProgreso:TfrmProgreso;
Total:Integer;
Mes: Integer;
begin
       frmProgreso := TfrmProgreso.Create(self);
       CBMeses.Enabled := False;
       SaldoAnterior := 0;
       SumDebito := 0;
       SumCredito := 0;
       Mes := CBMeses.ItemIndex + 1;
       CDSprocesarcolgaap.Open;
       CDSprocesarcolgaap.EmptyDataSet;
       CDScolgaap.Open;
       CDScolgaap.EmptyDataSet;
       with IBQSaldoAct do
        Begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('"con$saldoscuenta".DEBITO,');
          SQL.Add('"con$saldoscuenta".CREDITO');
          SQL.Add('from "con$puc" ');
          SQL.Add('LEFT JOIN "con$saldoscuenta" ON ("con$puc".CODIGO = "con$saldoscuenta".CODIGO and "con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('("con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA) and ("con$saldoscuenta".CODIGO = :"CODIGO") and ');
          SQL.Add('("con$saldoscuenta".MES = :"MES")');
        end;
       Empleado;
       with IBQPuc do
        begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('Count(*) as TOTAL');
          SQL.Add(' from "con$puc" ');
          SQL.Add('where ');
          SQL.Add('("con$puc".ID_AGENCIA = :ID_AGENCIA)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          Total := FieldByName('TOTAL').AsInteger;
        end;


       with IBQPuc do
        Begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('"con$puc".CODIGO,');
          SQL.Add('"con$puc".ID_AGENCIA,');
          SQL.Add('"con$puc".NOMBRE,');
          SQL.Add('"con$puc".NIVEL,');
          SQL.Add('"con$puc".SALDOINICIAL,');
          SQL.Add('"con$puc".MOVIMIENTO,');
          SQL.Add('"con$puc".CODIGOMAYOR,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          SQL.Add(' from "con$puc" ');
          SQL.Add('LEFT JOIN "gen$agencia" ON ("con$puc".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('("con$puc".ID_AGENCIA = :ID_AGENCIA)');
          SQL.Add('order by "con$puc".CODIGO');

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
       end;

          IBQPuc.Last;
          IBQPuc.First;
          frmProgreso.Show;
          frmProgreso.Min := 0;
          frmProgreso.Max := IBQpuc.RecordCount;
          frmProgreso.Position := 0;

       while not IBQPuc.Eof do begin
                 frmProgreso.Position := IBQPuc.RecNo;
                 frmProgreso.InfoLabel := 'Procesando Cuenta: ' + IBQPuc.FieldByName('CODIGO').AsString;
                 Application.ProcessMessages;
                 IBQSaldoAct.Close;
                 IBQSaldoAct.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 IBQSaldoAct.ParamByName('CODIGO').AsString  := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQSaldoAct.ParamByName('MES').AsInteger := Mes;
                 try
                  IBQSaldoAct.Open;
                 except
                  frmProgreso.Cerrar;
                  dmGeneral.Free;
                  IBQpuc.Transaction.Rollback;
                  raise;
                  Exit;
                 end;
                 IBQuery1.Close;
                 IBQuery1.SQL.Clear;
                 IBQuery1.SQL.Add('select ');
                 IBQuery1.SQL.Add('SUM("con$saldoscuenta".DEBITO) AS DEBITO,');
                 IBQuery1.SQL.Add('SUM("con$saldoscuenta".CREDITO) AS CREDITO');
                 IBQuery1.SQL.Add(' from "con$saldoscuenta" ');
                 IBQuery1.SQL.Add('where ');
                 IBQuery1.SQL.Add('("con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA) and ("con$saldoscuenta".CODIGO = :"CODIGO") and ');
                 IBQuery1.SQL.Add('("con$saldoscuenta".MES < :"MES")');
                 IBQuery1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 IBQuery1.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQuery1.ParamByName('MES').AsInteger := Mes;
                 try
                   IBQuery1.Open;
                   if IBQuery1.RecordCount > 0 then
                   begin
                      SumDebito := IBQuery1.FieldByName('DEBITO').AsCurrency;
                      SumCredito := IBQuery1.FieldByName('CREDITO').AsCurrency;
                   end
                   else
                   begin
                      SumDebito := 0;
                      SumCredito := 0;
                   end;
                 except
                      SumDebito := 0;
                      SumCredito := 0;
                 end;

                 SaldoAnterior := IBQPuc.FieldByName('SALDOINICIAL').AsCurrency + SumDebito - SumCredito;
                 Debito := IBQsaldoact.FieldByName('DEBITO').AsCurrency;
                 Credito := IBQsaldoact.FieldByName('CREDITO').AsCurrency;
                 CDSprocesarcolgaap.Insert;
                 CDSprocesarcolgaapCODIGO.Value := IBQPuc.FieldByName('CODIGO').AsString;
                 CDSprocesarcolgaapCUENTA.Value := IBQPuc.FieldByName('NOMBRE').AsString;
                 CDSprocesarcolgaapSALDO_ANTERIOR.Value := SaldoAnterior;
                 CDSprocesarcolgaapDEBITO_MOV.Value := Debito;
                 CDSprocesarcolgaapCREDITO_MOV.Value := Credito;
                 CDSprocesarcolgaapSALDO_ACTUAL.Value := SaldoAnterior +  Debito - Credito;
                 CDSprocesarcolgaapMOVIMIENTO.Value := IBQpuc.FieldByName('MOVIMIENTO').AsInteger;
                 CDSprocesarcolgaapNIVEL.Value := IBQpuc.FieldByName('NIVEL').AsInteger;
                 CDSprocesarcolgaap.Post;
                 IBQpuc.Next;
       end;
       frmProgreso.Hide;
       
       CDSprocesarcolgaap.First;
       while not CDSprocesarcolgaap.Eof do
       begin
                 CDScolgaap.Insert;
                 CDScolgaapCODIGO.Value := CDSprocesarcolgaapCODIGO.Value;
                 CDScolgaapCUENTA.Value := CDSprocesarcolgaapCUENTA.Value;
                 CDScolgaapSALDO.Value := CDSprocesarcolgaapSALDO_ACTUAL.Value;
                 CDScolgaapMOVIMIENTO.Value := CDSprocesarcolgaapMOVIMIENTO.Value;
                 CDScolgaap.Post;

                 CDSprocesarcolgaap.Next;
       end;

// Construir Datos Niif

       IBQpuc.Close;
       IBQpuc.SQL.Clear;
       IBQpuc.SQL.Add('SELECT * FROM CON$PUC ORDER BY CODIGO');
       IBQpuc.Open;
       CDSprocesarniif.Open;
       CDSprocesarniif.EmptyDataSet;
       while not IBQpuc.Eof do
       begin
           CDSprocesarniif.Insert;
           CDSprocesarniifCODIGO.Value := IBQpuc.FieldByName('CODIGO').AsString;
           CDSprocesarniifCUENTA.Value := IBQpuc.FieldByName('NOMBRE').AsString;
           CDSprocesarniifNIVEL.Value := IBQpuc.FieldByName('NIVEL').AsInteger;
           CDSprocesarniifCODIGO_MAYOR.Value := IBQpuc.FieldByName('CODIGOMAYOR').AsString;
           CDSprocesarniifSALDO.Value := 0;
           CDSprocesarniifMOVIMIENTO.Value := IBQpuc.FieldByName('MOVIMIENTO').AsInteger;
           CDSprocesarniif.Post;
           IBQpuc.Next;
       end;

       // Procesar cuentas de movimiento
       CDScolgaap.Filter := 'MOVIMIENTO = 1';
       CDScolgaap.Filtered := True;
       CDScolgaap.First;


       CDSsinparalelo.Open;
       CDSsinparalelo.EmptyDataSet;

       IBQuery1.Close;
       IBQuery1.SQL.Clear;
       IBQuery1.SQL.Add('SELECT * FROM CON$PARALELO WHERE COLGAAP = :COLGAAP');

       frmProgreso.Min := 0;
       frmProgreso.Max := CDScolgaap.RecordCount;
       frmProgreso.Position := 0;
       frmProgreso.Show;

       while not CDScolgaap.Eof do
       begin
           frmProgreso.Position := CDScolgaap.RecNo;
           Application.ProcessMessages;
           IBQuery1.Close;
           IBQuery1.ParamByName('COLGAAP').AsString := CDScolgaapCODIGO.Value;
           IBQuery1.Open;
           if (IBQuery1.RecordCount > 0) then
           begin
             while not IBQuery1.Eof do
             begin
                  CDSprocesarniif.Filtered := False;
                  CDSprocesarniif.Filter := 'CODIGO = '+ QuotedStr(IBQuery1.FieldByName('NIIF').AsString);
                  CDSprocesarniif.Filtered := True;
                  if (CDSprocesarniif.RecordCount > 0) then
                  begin
                          Valor := CDScolgaapSALDO.Value * IBQuery1.FieldByName('PORCENTAJE').AsInteger / 100;
                          CDSprocesarniif.Edit;
                          CDSprocesarniifSALDO.Value := CDSprocesarniifSALDO.Value + Valor;
                          CDSprocesarniif.Post;
                          ActualizarCodigoMayor(CDSprocesarniifCODIGO_MAYOR.Value, Valor);
                  end
                  else
                  begin
                      CDSsinparalelo.Insert;
                      CDSsinparaleloCODIGO.Value :=  CDScolgaapCODIGO.Value;
                      CDSsinparaleloCUENTA.Value := CDScolgaapCUENTA.Value;
                      CDSsinparaleloSALDO.Value := CDScolgaapSALDO.Value;
                      CDSsinparalelo.Post;
                  end;
                  IBQuery1.Next;
             end;
           end
           else
           begin
                      CDSsinparalelo.Insert;
                      CDSsinparaleloCODIGO.Value :=  CDScolgaapCODIGO.Value;
                      CDSsinparaleloCUENTA.Value := CDScolgaapCUENTA.Value;
                      CDSsinparaleloSALDO.Value := CDScolgaapSALDO.Value;
                      CDSsinparalelo.Post;
           end;
           CDScolgaap.Next;
       end;
       frmProgreso.Hide;
       // Actualizar Balance Niif
       CDSprocesarniif.Filtered := False;
       CDSprocesarniif.First;
       while not CDSprocesarniif.Eof do
       begin
           CDSniif.Insert;
           CDSniifCODIGO.Value := CDSprocesarniifCODIGO.Value;
           CDSniifCUENTA.Value := CDSprocesarniifCUENTA.Value;
           CDSniifSALDO.Value := CDSprocesarniifSALDO.Value;
           CDSniifMOVIMIENTO.Value := CDSprocesarniifMOVIMIENTO.Value;
           CDSniifNIVEL.Value := CDSprocesarniifNIVEL.Value;
           CDSniif.Post;
           CDSprocesarniif.Next;
       end;
       CDScolgaap.Filtered := False;
       CDSniif.First;

end;

procedure TfrmBalanceDirectoColgaapNiif.ActualizarCodigoMayor(Codigo: String; Saldo:Currency);
var
  CodigoMayor : String;
  Nivel : Integer;
begin
                  CDSprocesarniif.Filtered := False;
                  CDSprocesarniif.Filter := 'CODIGO = '+ QuotedStr(Codigo);
                  CDSprocesarniif.Filtered := True;

                  if CDSprocesarniif.RecordCount > 0 then
                  begin
                          CDSprocesarniif.Edit;
                          CDSprocesarniifSALDO.Value := CDSprocesarniifSALDO.Value + Saldo;
                          CDSprocesarniif.Post;
                          if (CDSprocesarniifNIVEL.Value > 1) then
                                  ActualizarCodigoMayor(CDSprocesarniifCODIGO_MAYOR.Value, Saldo);
                  end;

end;

procedure TfrmBalanceDirectoColgaapNiif.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQsaldoact.Database := dmGeneral.IBDatabase1;
        IBQpuc.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;

        IBQsaldoact.Transaction := dmGeneral.IBTransaction1;
        IBQpuc.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmBalanceDirectoColgaapNiif.btnAExcelClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          if (SD1.Execute) then
          begin
           CDScolgaap.First;
           ExcelFile := TDataSetToExcel.Create(CDScolgaap,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

procedure TfrmBalanceDirectoColgaapNiif.btnAExcelNiifClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          if (SD1.Execute) then
          begin
           CDSniif.First;
           ExcelFile := TDataSetToExcel.Create(CDSniif,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

procedure TfrmBalanceDirectoColgaapNiif.btnAExcelsinParaleloClick(
  Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          if (SD1.Execute) then
          begin
           CDSsinparalelo.First;
           ExcelFile := TDataSetToExcel.Create(CDSsinparalelo,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

procedure TfrmBalanceDirectoColgaapNiif.DBGniifTitleClick(Column: TColumn);
begin
        if Column.Index = 0 then CDSniif.IndexName := 'IndexCodigo';
end;

end.
