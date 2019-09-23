unit UnitLibroRMayorYBalance;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DateUtils, Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, pr_Common, pr_TxClasses, DB,
  IBCustomDataSet, IBQuery, DBClient, FR_Class, FR_DSet, FR_DBSet, frOLEExl, UnitdmGeneral,
  ComCtrls;

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
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    IBQTablaSALDOANT: TCurrencyField;
    IBQTablaSALDOACT: TCurrencyField;
    IBQTabla1SALDOACT: TCurrencyField;
    IBQTabla1SALDOANT: TCurrencyField;
    frOLEExcelExport1: TfrOLEExcelExport;
    IBQPuc: TIBQuery;
    IBQsaldo: TIBQuery;
    ProgressBar1: TProgressBar;
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
  dmGeneral: TDmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales,UnitPantallaProgreso;

procedure TfrmLibroMayorYBalance.CmdAceptarClick(Sender: TObject);
var
   FechaInicialParaSaldoInicial,
   FechaFinalParaSaldoInicial,
   FechaInicialMovimiento,
   FechaFinalMovimiento: TDateTime;
   Periodo,PeriodoAnt: Word;
   SaldoAnterior,DebitoAnt, CreditoAnt, DebitoMov, CreditoMov, DebitoAct, CreditoAct, SaldoActual: Currency;
   Codigo: String;
begin
       CmdAceptar.Enabled := False;
       if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
       dmGeneral.IBTransaction1.StartTransaction;
       Empleado;
       IBQTabla.EmptyDataSet;
       CmdAceptar.Enabled := false;
       with IBQPuc do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('p.CODIGO,');
          SQL.Add('p.ID_AGENCIA,');
          SQL.Add('p.NOMBRE,');
          SQL.Add('p.SALDOINICIAL,');
          SQL.Add('ga.DESCRIPCION_AGENCIA');
          SQL.Add(' from CON$PUC p ');
          SQL.Add('LEFT JOIN "gen$agencia" ga ON (p.ID_AGENCIA = ga.ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('(p.ID_AGENCIA = :ID_AGENCIA) and');
          SQL.Add('(p.NIVEL = :"NIVEL")');
          SQL.Add('order by p.CODIGO');

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('NIVEL').AsInteger := 3;
          Open;
          Last;
          First;
       end;

       with IBQsaldo do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT SUM(a.DEBITO) AS DEBITO, SUM(a.CREDITO) AS CREDITO FROM CON$COMPROBANTE c');
          SQL.Add('INNER JOIN CON$AUXILIAR a ON a.TIPO_COMPROBANTE = c.TIPO_COMPROBANTE and a.ID_COMPROBANTE = c.ID_COMPROBANTE');
          SQL.Add('WHERE c.FECHADIA BETWEEN :FECHA_INI and :FECHA_FIN and a.CODIGO LIKE :CODIGO');
          SQL.Add(' and c.ESTADO = :ESTADO');
          ParamByName('ESTADO').AsString := 'C';
       end;

       Periodo := CBMeses.ItemIndex + 1;
       PeriodoAnt := Periodo - 1;

       if (Periodo = 1) then
       begin
           FechaInicialParaSaldoInicial := 0;
           FechaFinalParaSaldoInicial := 0;
       end
       else
       begin
           FechaInicialParaSaldoInicial := EncodeDate(DBAnho, 01, 01);
           FechaFinalParaSaldoInicial := EncodeDate(DBAnho,PeriodoAnt,DaysInAMonth(DBAnho,PeriodoAnt));
       end;

       FechaInicialMovimiento := EncodeDate(DBAnho, Periodo, 01);
       FechaFinalMovimiento := EncodeDate(DBAnho, Periodo, DaysInAMonth(DBAnho, Periodo));

       IBQTabla.Open;
       IBQTabla.EmptyDataSet;

       ProgressBar1.Min := 0;
       ProgressBar1.Max := IBQPuc.RecordCount;
       ProgressBar1.Position := 0;

       while not IBQPuc.Eof do
       begin

            ProgressBar1.Position := IBQPuc.RecNo;
            Application.ProcessMessages;

            Codigo := LeftStr(IBQpuc.FieldByName('CODIGO').AsString, 4) + '%';

            IBQTabla.Append;
            if (Periodo > 1) then
            begin
                    IBQsaldo.Close;
                    IBQsaldo.ParamByName('FECHA_INI').AsDate := FechaInicialParaSaldoInicial;
                    IBQsaldo.ParamByName('FECHA_FIN').AsDate := FechaFinalParaSaldoInicial;
                    IBQsaldo.ParamByName('CODIGO').AsString := Codigo;
                    IBQsaldo.Open;
                    if (not VarIsNull(IBQsaldo.FieldByName('DEBITO').Value)) then
                    begin
                        DebitoAnt := IBQsaldo.FieldByName('DEBITO').AsCurrency;
                    end
                    else
                    begin
                        DebitoAnt := 0;
                    end;

                    if (not VarIsNull(IBQsaldo.FieldByName('CREDITO').Value)) then
                    begin
                        CreditoAnt := IBQsaldo.FieldByName('CREDITO').AsCurrency;
                    end
                    else
                    begin
                        CreditoAnt := 0;
                    end;
            end
            else
            begin
                DebitoAnt:= 0;
                CreditoAnt:= 0;
            end;

            IBQTablaCODIGO.Value := LeftStr(IBQPuc.FieldByName('CODIGO').AsString,4);
            IBQTablaNOMBRE.Value := IBQPuc.FieldByName('NOMBRE').AsString;
            SaldoAnterior := IBQPuc.FieldByName('SALDOINICIAL').AsCurrency + DebitoAnt - CreditoAnt;
            if (SaldoAnterior > 0) then
            begin
                IBQTablaDEBITOANT.Value := SaldoAnterior;
                IBQTablaCREDITOANT.Value := 0;
            end
            else
            begin
                IBQTablaDEBITOANT.Value := 0;
                IBQTablaCREDITOANT.Value := -SaldoAnterior;
            end;


            IBQsaldo.Close;
            IBQsaldo.ParamByName('FECHA_INI').AsDate := FechaInicialMovimiento;
            IBQsaldo.ParamByName('FECHA_FIN').AsDate := FechaFinalMovimiento;
            IBQsaldo.ParamByName('CODIGO').AsString := Codigo;
            IBQsaldo.Open;

            if (not VarIsNull(IBQsaldo.FieldByName('DEBITO').Value)) then
            begin
                DebitoMov := IBQsaldo.FieldByName('DEBITO').AsCurrency;
            end
            else
            begin
                DebitoMov := 0;
            end;

            if (not VarIsNull(IBQsaldo.FieldByName('CREDITO').Value)) then
            begin
                    CreditoMov := IBQsaldo.FieldByName('CREDITO').AsCurrency;
            end
            else
            begin
                    CreditoMov := 0;
            end;

            IBQTablaDEBITOMOV.Value := DebitoMov;
            IBQTablaCREDITOMOV.Value := CreditoMov;


            if (IBQTablaDEBITOANT.Value <> 0) OR (IBQTablaCREDITOANT.Value <> 0) OR (IBQTablaDEBITOMOV.Value <> 0) OR (IBQTablaCREDITOMOV.Value <> 0) then
            begin
                SaldoActual := IBQTablaDEBITOANT.Value - IBQTablaCREDITOANT.Value +
                       IBQTablaDEBITOMOV.Value - IBQTablaCREDITOMOV.Value;
                if (SaldoActual > 0) then
                begin
                        IBQTablaDEBITOACT.Value := SaldoActual;
                        IBQTablaCREDITOACT.Value := 0;
                end
                else
                begin
                        IBQTablaDEBITOACT.Value :=  0;
                        IBQTablaCREDITOACT.Value := -SaldoActual;
                end;
                IBQTabla.Post;
            end
            else
            begin
                IBQTabla.Cancel;
            end;
            IBQPuc.Next;
       end;

       IBQPuc.Close;
       IBQTabla.Filter := 'CODIGO >=' + QuotedStr('8000');
       IBQTabla.Filtered := True;

             IBQTabla.Open;
             IBQTabla.First;

             while not IBQTabla.Eof do
             begin
                IBQTabla1.Open;
                IBQTabla1.Insert;
                IBQTabla1.FieldByName('CODIGO').AsString := IBQTabla.FieldByName('CODIGO').AsString;
                IBQTabla1.FieldByName('NOMBRE').AsString := IBQTabla.FieldByName('NOMBRE').AsString;
                IBQTabla1.FieldByName('DEBITOANT').AsCurrency := IBQTabla.FieldByName('DEBITOANT').AsCurrency;
                IBQTabla1.FieldByName('CREDITOANT').AsCurrency := IBQTabla.FieldByName('CREDITOANT').AsCurrency;
                IBQTabla1.FieldByName('DEBITOMOV').AsCurrency := IBQTabla.FieldByName('DEBITOMOV').AsCurrency;
                IBQTabla1.FieldByName('CREDITOMOV').AsCurrency := IBQTabla.FieldByName('CREDITOMOV').AsCurrency;
                IBQTabla1.Post;
                IBQTabla1.Close;

                IBQTabla.Next;
             end;
             IBQTabla.Close;

             IBQTabla.Filter := 'CODIGO <' + QuotedStr('8000');
             IBQTabla.Filtered := True;


               
                ReportBalance.Variables.ByName['EMPRESA'].AsString := Empresa;
                ReportBalance.Variables.ByName['NIT'].AsString := Nit;
                ReportBalance.Variables.ByName['Mes'].AsString := CBMeses.Text;
                ReportBalance.Variables.ByName['AnoCorte'].AsString := EdAno.Text;
                if ReportBalance.PrepareReport then
                   ReportBalance.PreviewPreparedReport(True);


                {
                frReport1.LoadFromFile('ReportesCon\frLibroMayorBalance.frf');
                frReport1.Dictionary.Variables['MES'] := QuotedStr(CBMeses.Text);
                frReport1.Dictionary.Variables['ANHOCORTE'] := QuotedStr(EdAno.Text);
                if frReport1.PrepareReport then
                   frReport1.ShowPreparedReport;
                }


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
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;

        IBQPuc.Database := dmGeneral.IBDatabase1;
        IBQPuc.Transaction := dmGeneral.IBTransaction1;

        IBQsaldo.Database := dmGeneral.IBDatabase1;
        IBQsaldo.Transaction := dmGeneral.IBTransaction1;
end;

end.
