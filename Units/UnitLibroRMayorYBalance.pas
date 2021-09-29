unit UnitLibroRMayorYBalance;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, pr_Common, pr_TxClasses, DB,
  IBCustomDataSet, IBQuery, DBClient;

type
  TfrmLibroMayorYBalance = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    CBMeses: TComboBox;
    EdAno: TMaskEdit;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQPuc: TIBQuery;
    IBQSaldoAct: TIBQuery;
    IBQSaldoActDEBITO: TIBBCDField;
    IBQSaldoActCREDITO: TIBBCDField;
    IBQuery1: TIBQuery;
    IBQTabla: TClientDataSet;
    IBQTablaCODIGO: TStringField;
    IBQTablaNOMBRE: TStringField;
    IBQTablaNIVEL: TIntegerField;
    IBQTablaDESCRIPCION_AGENCIA: TStringField;
    IBQTablaDEBITOANT: TCurrencyField;
    IBQTablaCREDITOANT: TCurrencyField;
    IBQTablaDEBITOMOV: TCurrencyField;
    IBQTablaCREDITOMOV: TCurrencyField;
    IBQTabla1: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    CurrencyField4: TCurrencyField;
    IBQTablaDEBITOACT: TCurrencyField;
    IBQTablaCREDITOACT: TCurrencyField;
    IBQTabla1DEBITOACT: TCurrencyField;
    IBQTabla1CREDITOACT: TCurrencyField;
    ReportBalance: TprTxReport;
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLibroMayorYBalance: TfrmLibroMayorYBalance;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales,UnitPantallaProgreso;

procedure TfrmLibroMayorYBalance.CmdAceptarClick(Sender: TObject);
var SaldoInicial,SaldoAnterior, SaldoActual:Currency;
SumDebito,SumCredito:Currency;
frmProgreso:TfrmProgreso;
Total:Integer;
Mes:Integer;
begin
       CmdAceptar.Enabled := False;
       Application.ProcessMessages;
       Mes := CBMeses.ItemIndex + 1;
       with IBQPuc do
        begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('Count(*) as TOTAL');
          SQL.Add(' from CON$PUC ');
          SQL.Add('where ');
          SQL.Add('(CON$PUC.CODIGO BETWEEN :"CODIGO_INICIAL" and :"CODIGO_FINAL") and');
          SQL.Add('(CON$PUC.NIVEL = :"NIVEL")');
          ParamByName('CODIGO_INICIAL').AsString := '000000000000000000';
          ParamByName('CODIGO_FINAL').AsString := '799999999999999999';
          ParamByName('NIVEL').AsInteger := 3;
          Open;
          Total := FieldByName('TOTAL').AsInteger;
          Close;
        end;


        with IBQPuc do
         begin
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('CON$PUC.CODIGO,');
           SQL.Add('CON$PUC.ID_AGENCIA,');
           SQL.Add('CON$PUC.NOMBRE,');
           SQL.Add('CON$PUC.NIVEL');
           SQL.Add(' from CON$PUC ');
           SQL.Add('where ');
           SQL.Add('(CON$PUC.CODIGO BETWEEN :"CODIGO_INICIAL" and :"CODIGO_FINAL") and');
           SQL.Add('(CON$PUC.NIVEL = :"NIVEL")');
           SQL.Add('order by CON$PUC.CODIGO');
           ParamByName('CODIGO_INICIAL').AsString := '';
           ParamByName('CODIGO_FINAL').AsString := '799999999999999999';
           ParamByName('NIVEL').AsInteger := 3;
           Open;
        end;

              frmProgreso := TfrmProgreso.Create(Self);
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Caption := 'Procesando Mayor y Balance Primera Parte';
              Application.ProcessMessages;
              frmProgreso.Ejecutar;
              while (not IBQPuc.Eof)  do
               begin
                 frmProgreso.Position := IBQPuc.RecNo;
                 frmProgreso.InfoLabel := 'Procesando Cuenta: ' + IBQPuc.FieldByName('CODIGO').AsString;
                 Application.ProcessMessages;
                 IBQSaldoAct.Close;
                 IBQSaldoAct.ParamByName('CODIGO').AsString  := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQSaldoAct.ParamByName('MES').AsString := Format('%.2d',[Mes]);
                 try
                  IBQSaldoAct.Open;
                 except
                  frmProgreso.Cerrar;
                  IBQSaldoAct.Transaction.Rollback;
                  raise;
                  Exit;
                 end;
                 IBQTabla.Open;
                 IBQTabla.Insert;
                 IBQTabla.FieldByName('CODIGO').AsString := LeftStr(IBQPuc.FieldByName('CODIGO').AsString,4);
                 IBQTabla.FieldByName('NOMBRE').AsString := IBQPuc.FieldByName('NOMBRE').AsString;
                 IBQTabla.FieldByName('NIVEL').AsInteger := IBQPuc.FieldByName('NIVEL').AsInteger;

                 IBQuery1.Close;
                 IBQuery1.SQL.Clear;
                 IBQuery1.SQL.Add('select SUM(CON$SALDOSINICIALES.SALDOINICIAL) AS SALDO from CON$SALDOSINICIALES');
                 IBQuery1.SQL.Add('where CON$SALDOSINICIALES.CODIGO = :CODIGO');
                 IBQuery1.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 try
                  IBQuery1.Open;
                  if IBQuery1.RecordCount > 0 then
                    SaldoInicial := IBQuery1.FieldByName('SALDO').AsCurrency
                  else
                    SaldoInicial := 0;
                 except
                    SaldoInicial := 0;
                 end;

                 IBQuery1.Close;
                 IBQuery1.SQL.Clear;
                 IBQuery1.SQL.Add('select ');
                 IBQuery1.SQL.Add('SUM(CON$SALDOSCUENTA.DEBITO) AS DEBITO,');
                 IBQuery1.SQL.Add('SUM(CON$SALDOSCUENTA.CREDITO) AS CREDITO');
                 IBQuery1.SQL.Add(' from CON$SALDOSCUENTA ');
                 IBQuery1.SQL.Add('where ');
                 IBQuery1.SQL.Add('(CON$SALDOSCUENTA.CODIGO = :"CODIGO") and ');
                 IBQuery1.SQL.Add('(CON$SALDOSCUENTA.MES < :"MES")');
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

                 SaldoAnterior := SaldoInicial + SumDebito - SumCredito;
                 if SaldoAnterior > 0 then
                  begin
                    IBQTabla.FieldByName('DEBITOANT').AsCurrency := SaldoAnterior;
                    IBQTabla.FieldByName('CREDITOANT').AsCurrency := 0;
                  end;
                 if SaldoAnterior < 0 then
                  begin
                    IBQTabla.FieldByName('CREDITOANT').AsCurrency := SaldoAnterior * -1;
                    IBQTabla.FieldByName('DEBITOANT').AsCurrency := 0;
                  end;
                 if SaldoAnterior = 0 then
                  begin
                    IBQTabla.FieldByName('DEBITOANT').AsCurrency := 0;
                    IBQTabla.FieldByName('CREDITOANT').AsCurrency := 0;
                  end;
                 IBQTabla.FieldByName('DEBITOMOV').AsCurrency := IBQSaldoAct.FieldByName('DEBITO').AsCurrency;
                 IBQTabla.FieldByName('CREDITOMOV').AsCurrency := IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
                 SaldoActual := SaldoAnterior + IBQSaldoAct.FieldByName('DEBITO').AsCurrency - IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
                 if SaldoActual > 0 then begin
                   IBQTabla.FieldByName('DEBITOACT').AsCurrency := saldoactual;
                   IBQTabla.FieldByName('CREDITOACT').AsCurrency := 0;
                 end
                 else
                 begin
                   IBQTabla.FieldByName('DEBITOACT').AsCurrency := 0;
                   IBQTabla.FieldByName('CREDITOACT').AsCurrency := -SaldoActual;
                 end;
                 IBQTabla.Post;
                 IBQTabla.Close;
                 IBQPuc.Next;
                end;

                frmProgreso.Cerrar;
                IBQPuc.Close;


///*****
       with IBQPuc do
        begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('Count(*) as TOTAL');
          SQL.Add(' from CON$PUC ');
          SQL.Add('where ');
          SQL.Add('(CON$PUC.CODIGO BETWEEN :"CODIGO_INICIAL" and :"CODIGO_FINAL") and');
          SQL.Add('(CON$PUC.NIVEL = :"NIVEL")');
          ParamByName('CODIGO_INICIAL').AsString := '800000000000000000';
          ParamByName('CODIGO_FINAL').AsString := '999999999999999999';
          ParamByName('NIVEL').AsInteger := 3;
          Open;
          Total := FieldByName('TOTAL').AsInteger;
          Close;
        end;


        with IBQPuc do
         begin
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('CON$PUC.CODIGO,');
           SQL.Add('CON$PUC.ID_AGENCIA,');
           SQL.Add('CON$PUC.NOMBRE,');
           SQL.Add('CON$PUC.NIVEL');
           SQL.Add(' from CON$PUC ');
           SQL.Add('where ');
           SQL.Add('(CON$PUC.CODIGO BETWEEN :"CODIGO_INICIAL" and :"CODIGO_FINAL") and');
           SQL.Add('(CON$PUC.NIVEL = :"NIVEL")');
           SQL.Add('order by CON$PUC.CODIGO');
           ParamByName('CODIGO_INICIAL').AsString := '800000000000000000';
           ParamByName('CODIGO_FINAL').AsString := '999999999999999999';
           ParamByName('NIVEL').AsInteger := 3;
           Open;
        end;

              frmProgreso := TfrmProgreso.Create(Self);
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Caption := 'Procesando Mayor y Balance Segunda Parte';
              Application.ProcessMessages;
              frmProgreso.Ejecutar;
              while (not IBQPuc.Eof)  do
               begin
                 frmProgreso.Position := IBQPuc.RecNo;
                 frmProgreso.InfoLabel := 'Procesando Cuenta: ' + IBQPuc.FieldByName('CODIGO').AsString;
                 Application.ProcessMessages;
                 IBQSaldoAct.Close;
                 IBQSaldoAct.ParamByName('CODIGO').AsString  := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQSaldoAct.ParamByName('MES').AsString := Format('%.2d',[Mes]);
                 try
                  IBQSaldoAct.Open;
                 except
                  frmProgreso.Cerrar;
                  IBQSaldoAct.Transaction.Rollback;
                  raise;
                  Exit;
                 end;
                 IBQTabla1.Open;
                 IBQTabla1.Insert;
                 IBQTabla1.FieldByName('CODIGO').AsString := LeftStr(IBQPuc.FieldByName('CODIGO').AsString,4);
                 IBQTabla1.FieldByName('NOMBRE').AsString := IBQPuc.FieldByName('NOMBRE').AsString;
                 IBQTabla1.FieldByName('NIVEL').AsInteger := IBQPuc.FieldByName('NIVEL').AsInteger;

                 IBQuery1.Close;
                 IBQuery1.SQL.Clear;
                 IBQuery1.SQL.Add('select SUM(CON$SALDOSINICIALES.SALDOINICIAL) AS SALDO from CON$SALDOSINICIALES');
                 IBQuery1.SQL.Add('where CON$SALDOSINICIALES.CODIGO = :CODIGO');
                 IBQuery1.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 try
                  IBQuery1.Open;
                  if IBQuery1.RecordCount > 0 then
                    SaldoInicial := IBQuery1.FieldByName('SALDO').AsCurrency
                  else
                    SaldoInicial := 0;
                 except
                    SaldoInicial := 0;
                 end;


                 IBQuery1.Close;
                 IBQuery1.SQL.Clear;
                 IBQuery1.SQL.Add('select ');
                 IBQuery1.SQL.Add('SUM(CON$SALDOSCUENTA.DEBITO) AS DEBITO,');
                 IBQuery1.SQL.Add('SUM(CON$SALDOSCUENTA.CREDITO) AS CREDITO');
                 IBQuery1.SQL.Add(' from CON$SALDOSCUENTA ');
                 IBQuery1.SQL.Add('where ');
                 IBQuery1.SQL.Add('(CON$SALDOSCUENTA.CODIGO = :"CODIGO") and ');
                 IBQuery1.SQL.Add('(CON$SALDOSCUENTA.MES < :"MES")');
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

                 SaldoAnterior := SaldoInicial + SumDebito - SumCredito;
                 if SaldoAnterior > 0 then
                  begin
                    IBQTabla1.FieldByName('DEBITOANT').AsCurrency := SaldoAnterior;
                    IBQTabla1.FieldByName('CREDITOANT').AsCurrency := 0;
                  end;
                 if SaldoAnterior < 0 then
                  begin
                    IBQTabla1.FieldByName('CREDITOANT').AsCurrency := SaldoAnterior * -1;
                    IBQTabla1.FieldByName('DEBITOANT').AsCurrency := 0;
                  end;
                 if SaldoAnterior = 0 then
                  begin
                    IBQTabla1.FieldByName('DEBITOANT').AsCurrency := 0;
                    IBQTabla1.FieldByName('CREDITOANT').AsCurrency := 0;
                  end;
                 IBQTabla1.FieldByName('DEBITOMOV').AsCurrency := IBQSaldoAct.FieldByName('DEBITO').AsCurrency;
                 IBQTabla1.FieldByName('CREDITOMOV').AsCurrency := IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
                 SaldoActual := SaldoAnterior + IBQSaldoAct.FieldByName('DEBITO').AsCurrency - IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
                 if SaldoActual > 0 then begin
                   IBQTabla1.FieldByName('DEBITOACT').AsCurrency := saldoactual;
                   IBQTabla1.FieldByName('CREDITOACT').AsCurrency := 0;
                 end
                 else
                 begin
                   IBQTabla1.FieldByName('DEBITOACT').AsCurrency := 0;
                   IBQTabla1.FieldByName('CREDITOACT').AsCurrency := -SaldoActual;
                 end;
                 IBQTabla1.Post;
                 IBQTabla1.Close;
                 IBQPuc.Next;
                end;

                frmProgreso.Cerrar;
                IBQPuc.Close;



                ReportBalance.Variables.ByName['EMPRESA'].AsString := Empresa;
                ReportBalance.Variables.ByName['NIT'].AsString := Nit;
                ReportBalance.Variables.ByName['Mes'].AsString := CBMeses.Text;
                ReportBalance.Variables.ByName['AnoCorte'].AsString := EdAno.Text;
                if ReportBalance.PrepareReport then
                   ReportBalance.PreviewPreparedReport(True);


end;

procedure TfrmLibroMayorYBalance.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLibroMayorYBalance.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLibroMayorYBalance.FormCreate(Sender: TObject);
begin
     with IBQPuc do begin
       if Transaction.InTransaction then
          Transaction.Rollback;
       Transaction.StartTransaction;
     end;
end;

end.
