unit UnitBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StrUtils, Dialogs, FR_Class, frOLEExl, FR_DSet, FR_DBSet, DB, DBClient,DataSetToExcel,
  IBCustomDataSet, IBQuery, StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, DateUtils, UnitdmGeneral;

type
  TfrmBalance = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    CBMeses: TComboBox;
    EdAno: TMaskEdit;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQPuc: TIBQuery;
    IBQsaldo: TIBQuery;
    IBQTabla: TClientDataSet;
    IBQTablaCODIGO: TStringField;
    IBQTablaNOMBRE: TStringField;
    IBQTablaDEBITOANT: TCurrencyField;
    IBQTablaCREDITOANT: TCurrencyField;
    IBQTablaDEBITOMOV: TCurrencyField;
    IBQTablaCREDITOMOV: TCurrencyField;
    IBQTablaDESCRIPCION_AGENCIA: TStringField;
    IBQTabla1: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    CurrencyField4: TCurrencyField;
    IBQTabla1DEBITOACT: TCurrencyField;
    IBQTabla1CREDITOACT: TCurrencyField;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    frOLEExcelExport1: TfrOLEExcelExport;
    frReport1: TfrReport;
    Label1: TLabel;
    CBNivel: TComboBox;
    btnAExcel: TBitBtn;
    SD1: TSaveDialog;
    btnReporte: TBitBtn;
    IBQTablaDEBITOACT: TCurrencyField;
    IBQTablaCREDITOACT: TCurrencyField;
    Label2: TLabel;
    EdCodigoInicial: TMaskEdit;
    Label3: TLabel;
    EdCodigoFinal: TMaskEdit;
    btnAExcel1Col: TBitBtn;
    IBQTabla1Col: TClientDataSet;
    IBQTabla1ColCODIGO: TStringField;
    IBQTabla1ColNOMBRE: TStringField;
    IBQTabla1ColSALDO: TCurrencyField;
    btnAExcel4Col: TBitBtn;
    IBQTabla4Col: TClientDataSet;
    IBQTabla4ColCODIGO: TStringField;
    IBQTabla4ColNOMBRE: TStringField;
    IBQTabla4ColSALDOANTERIOR: TCurrencyField;
    IBQTabla4ColDEBITO: TCurrencyField;
    IBQTabla4ColCREDITO: TCurrencyField;
    IBQTabla4ColSALDOACTUAL: TCurrencyField;
    procedure CmdAceptarClick(Sender: TObject);
    procedure IBQTablaCalcFields(DataSet: TDataSet);
    procedure IBQTabla1CalcFields(DataSet: TDataSet);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure EdCodigoInicialExit(Sender: TObject);
    procedure EdCodigoFinalExit(Sender: TObject);
    procedure CBMesesKeyPress(Sender: TObject; var Key: Char);
    procedure EdCodigoInicialKeyPress(Sender: TObject; var Key: Char);
    procedure CBNivelKeyPress(Sender: TObject; var Key: Char);
    procedure EdCodigoFinalKeyPress(Sender: TObject; var Key: Char);
    procedure EdAnoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAExcel1ColClick(Sender: TObject);
    procedure btnAExcel4ColClick(Sender: TObject);
  private
    { Private declarations }
    function RightPad(value:string; length:integer=18;pad:char='0'):string;
  public
    { Public declarations }
  end;

var
  frmBalance: TfrmBalance;
  dmGeneral: TdmGeneral;
  Cadena        : String;
  CodigoInicial : String;
  CodigoFinal   : String;  

implementation

uses UnitGlobales;

{$R *.dfm}

procedure TfrmBalance.CmdAceptarClick(Sender: TObject);
var
   FechaInicialParaSaldoInicial,
   FechaFinalParaSaldoInicial,
   FechaInicialMovimiento,
   FechaFinalMovimiento: TDateTime;
   Periodo,PeriodoAnt: Word;
   SaldoAnterior,DebitoAnt, CreditoAnt, DebitoMov, CreditoMov, DebitoAct, CreditoAct, SaldoActual: Currency;
   Codigo: String;
   Longitud: Integer;
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
          SQL.Add('p.NIVEL,');
          SQL.Add('p.SALDOINICIAL,');
          SQL.Add('a.DESCRIPCION_AGENCIA');
          SQL.Add(' from CON$PUC p');
          SQL.Add('LEFT JOIN "gen$agencia" a ON (p.ID_AGENCIA = a.ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('(p.ID_AGENCIA = :ID_AGENCIA) and');
          SQL.Add('p.CODIGO >= :CODIGO_INICIAL and p.CODIGO <= :CODIGO_FINAL');
          SQL.Add('and (p.NIVEL <= :"NIVEL")');
          SQL.Add('order by p.CODIGO');

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('CODIGO_INICIAL').AsString := CodigoInicial;
          ParamByName('CODIGO_FINAL').AsString := CodigoFinal;
          ParamByName('NIVEL').AsInteger := CBNivel.ItemIndex + 1;
          Open;
          Last;
          First;
       end;

       with IBQsaldo do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT SUM(a.DEBITO) AS DEBITO, SUM(a.CREDITO) AS CREDITO FROM CON$COMPROBANTE c');
          SQL.Add('INNER JOIN CON$AUXILIAR a ON a.TIPO_COMPROBANTE = c.TIPO_COMPROBANTE and a.ID_COMPROBANTE = c.ID_COMPROBANTE');
          SQL.Add('WHERE a.FECHA BETWEEN :FECHA_INI and :FECHA_FIN and a.CODIGO LIKE :CODIGO');
          SQL.Add(' and c.ESTADO <> :ESTADO');
          ParamByName('ESTADO').AsString := 'N';
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

            Longitud := 0;

            case (IBQPuc.FieldByName('NIVEL').AsInteger) of
                  1: Longitud := 1;
                  2: Longitud := 2;
                  3: Longitud := 4;
                  4: Longitud := 6;
                  5: Longitud := 8;
                  6: Longitud := 10;
                  7: Longitud := 12;
                  8: Longitud := 14;
                  9: Longitud := 16;
                  10: Longitud := 18;
            end;

            Codigo := LeftStr(IBQpuc.FieldByName('CODIGO').AsString, Longitud) + '%';

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


            IBQTablaCODIGO.Value := LeftStr(IBQPuc.FieldByName('CODIGO').AsString,Longitud);
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
                        IBQTablaDEBITOACT.Value :=  SaldoActual;
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


       IBQTabla.First;
       IBQTabla1Col.Open;
       IBQTabla1Col.EmptyDataSet;

            case (StrToInt(CBNivel.Text)) of
                  1: Longitud := 1;
                  2: Longitud := 2;
                  3: Longitud := 4;
                  4: Longitud := 6;
                  5: Longitud := 8;
                  6: Longitud := 10;
                  7: Longitud := 12;
                  8: Longitud := 14;
                  9: Longitud := 16;
                  10: Longitud := 18;
            end;

       while not IBQTabla.Eof do
       begin

           Codigo := RightPad(IBQTabla.FieldByName('CODIGO').AsString,Longitud,'0');


           IBQTabla1Col.Insert;
           IBQTabla1ColCODIGO.Value := Codigo;
           IBQTabla1ColNOMBRE.Value := IBQTablaNOMBRE.Value;
           IBQTabla1ColSALDO.Value := IBQTablaDEBITOACT.Value - IBQTablaCREDITOACT.Value;
           IBQTabla1Col.Post;


           IBQTabla4Col.Insert;
           IBQTabla4ColCODIGO.Value := Codigo;
           IBQTabla4ColNOMBRE.Value := IBQTablaNOMBRE.Value;
           IBQTabla4ColSALDOANTERIOR.Value := IBQTablaDEBITOANT.Value - IBQTablaCREDITOANT.Value;
           IBQTabla4ColDEBITO.Value := IBQTablaDEBITOMOV.Value;
           IBQTabla4ColCREDITO.Value := IBQTablaCREDITOMOV.Value;
           IBQTabla4ColSALDOACTUAL.Value := IBQTablaDEBITOACT.Value - IBQTablaCREDITOACT.Value;
           IBQTabla4Col.Post;
           
           IBQTabla.Next;
       end;

       btnReporte.Enabled := True;
       btnAExcel.Enabled := True;
       btnAExcel1Col.Enabled := True;
       btnAExcel4Col.Enabled := True;



end;

procedure TfrmBalance.IBQTablaCalcFields(DataSet: TDataSet);
var
  ValorCuenta: Currency;
begin
        ValorCuenta := DataSet.FieldByName('DEBITOANT').AsCurrency - DataSet.FieldByName('CREDITOANT').AsCurrency +
                       DataSet.FieldByName('DEBITOMOV').AsCurrency - DataSet.FieldByName('CREDITOMOV').AsCurrency;
        if (ValorCuenta > 0) then
        begin
          DataSet.FieldByName('DEBITOACT').AsCurrency :=  ValorCuenta;
          DataSet.FieldByName('CREDITOACT').AsCurrency := 0;
        end
        else
        begin
          DataSet.FieldByName('DEBITOACT').AsCurrency :=  0;
          DataSet.FieldByName('CREDITOACT').AsCurrency := -ValorCuenta;
        end;
end;

procedure TfrmBalance.IBQTabla1CalcFields(DataSet: TDataSet);
var
  ValorCuenta: Currency;
begin
        ValorCuenta := DataSet.FieldByName('DEBITOANT').AsCurrency - DataSet.FieldByName('CREDITOANT').AsCurrency +
                       DataSet.FieldByName('DEBITOMOV').AsCurrency - DataSet.FieldByName('CREDITOMOV').AsCurrency;
        if (ValorCuenta > 0) then
        begin
          DataSet.FieldByName('DEBITOACT').AsCurrency :=  ValorCuenta;
          DataSet.FieldByName('CREDITOACT').AsCurrency := 0;
        end
        else
        begin
          DataSet.FieldByName('DEBITOACT').AsCurrency :=  0;
          DataSet.FieldByName('CREDITOACT').AsCurrency := -ValorCuenta;
        end;
end;

procedure TfrmBalance.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBalance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

procedure TfrmBalance.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;

        IBQPuc.Database := dmGeneral.IBDatabase1;
        IBQPuc.Transaction := dmGeneral.IBTransaction1;

        IBQsaldo.Database := dmGeneral.IBDatabase1;
        IBQsaldo.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmBalance.FormShow(Sender: TObject);
begin
        EdAno.Text := IntToStr(DBAnho);
end;

procedure TfrmBalance.btnAExcelClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          SD1.Title := 'Nombre Para El Archivo de Balance';
          if (SD1.Execute) then
          begin
           IBQTabla.First;
           ExcelFile := TDataSetToExcel.Create(IBQTabla,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

procedure TfrmBalance.btnReporteClick(Sender: TObject);
begin
                IBQTabla.First;
                frReport1.LoadFromFile('ReportesCon\frBalance.frf');
                frReport1.Dictionary.Variables['EMPRESA'] := QuotedStr(Empresa);
                frReport1.Dictionary.Variables['NIT'] := QuotedStr(nit);
                frReport1.Dictionary.Variables['CORTE'] := QuotedStr(CBMeses.Text);
                frReport1.Dictionary.Variables['ANHO'] := QuotedStr(EdAno.Text);
                if frReport1.PrepareReport then
                   frReport1.ShowPreparedReport;
end;

procedure TfrmBalance.EdCodigoInicialExit(Sender: TObject);
begin
        Cadena := EdCodigoInicial.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoInicial := Cadena;
end;

procedure TfrmBalance.EdCodigoFinalExit(Sender: TObject);
begin
        Cadena := EdCodigoFinal.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoFinal := Cadena;
end;

procedure TfrmBalance.CBMesesKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmBalance.EdCodigoInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmBalance.CBNivelKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmBalance.EdCodigoFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmBalance.EdAnoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmBalance.btnAExcel1ColClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          SD1.Title := 'Nombre Para El Archivo de Balance';
          if (SD1.Execute) then
          begin
           IBQTabla1Col.First;
           ExcelFile := TDataSetToExcel.Create(IBQTabla1Col,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

procedure TfrmBalance.btnAExcel4ColClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          SD1.Title := 'Nombre Para El Archivo de Balance';
          if (SD1.Execute) then
          begin
           IBQTabla4Col.First;
           ExcelFile := TDataSetToExcel.Create(IBQTabla4Col,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

function TfrmBalance.RightPad(value:string; length:integer=18;pad:char='0'):string;
begin
     result := LeftStr(value + StringOfChar(pad,length) ,length);
end;

end.
