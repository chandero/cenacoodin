unit UnitInformeBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FR_DSet, FR_DBSet, frOLEExl, FR_Class, FR_E_TXT, FR_E_CSV, DB, DateUtils, StrUtils,
  DBClient, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmInformeBalance = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    CBMeses: TComboBox;
    EdAno: TMaskEdit;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    frReport1: TfrReport;
    IBQPuc: TIBQuery;
    IBQSaldoAct: TIBQuery;
    IBQuery1: TIBQuery;
    IBQTabla: TClientDataSet;
    IBQTablaCODIGO: TStringField;
    IBQTablaNOMBRE: TStringField;
    IBQTablaSALDOANTERIOR: TCurrencyField;
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
    IBQSaldoAnt: TIBQuery;
    frCSVExport1: TfrCSVExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frDBDatos: TfrDBDataSet;
    IBQuery2: TIBQuery;
    chkRegistrado: TCheckBox;
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function removeLeadingZeros(const Value: string): string;
    function Empleado: String;
  public
    { Public declarations }
  end;

var
  frmInformeBalance: TfrmInformeBalance;

implementation

uses UnitdmGeneral, UnitGlobales;

{$R *.dfm}

procedure TfrmInformeBalance.CmdAceptarClick(Sender: TObject);
var
Tabla:String;
SaldoAnterior:Currency;

// Utilidad o Perdida
SaldoAnt : Currency;
DebitMov : Currency;
CrediMov : Currency;
SaldoAct : Currency;

TotalIngresos: Currency;
TotalGastos: Currency;
Codigo : String;

begin
       if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
       dmGeneral.IBTransaction1.StartTransaction;
       Empleado;
       with IBQPuc do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('"con$puc".CODIGO,');
          SQL.Add('"con$puc".ID_AGENCIA,');
          SQL.Add('"con$puc".NOMBRE,');
          SQL.Add('"con$puc".SALDOINICIAL,');
          SQL.Add('"con$puc".NIVEL,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          SQL.Add(' from "con$puc" ');
          SQL.Add('LEFT JOIN "gen$agencia" ON ("con$puc".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('("con$puc".ID_AGENCIA = :ID_AGENCIA) and ("con$puc".CODIGO BETWEEN :CODIGO1 and :CODIGO2)  ');
          SQL.Add('order by "con$puc".CODIGO');

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('CODIGO1').AsString := '100000000000000000';
          ParamByName('CODIGO2').AsString := '399999999999999999';
          Open;
       end;

       with IBQSaldoAnt do
        Begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('SUM("con$saldoscuenta".DEBITO) AS DEBITO,');
          SQL.Add('SUM("con$saldoscuenta".CREDITO) AS CREDITO');
          SQL.Add(' from "con$saldoscuenta" ');
          SQL.Add('where ');
          SQL.Add('"con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('("con$saldoscuenta".CODIGO = :"CODIGO") and');
          SQL.Add('("con$saldoscuenta".MES < :"MES")');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
         end;

       with IBQSaldoAct do
        Begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('"con$puc".CODIGO,');
          SQL.Add('"con$saldoscuenta".DEBITO,');
          SQL.Add('"con$saldoscuenta".CREDITO');
          SQL.Add(' from "con$puc" ');
          SQL.Add('LEFT JOIN "con$saldoscuenta" ON ("con$puc".CODIGO = "con$saldoscuenta".CODIGO and "con$puc".ID_AGENCIA = "con$saldoscuenta".ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('"con$puc".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('("con$puc".CODIGO = :"CODIGO") and');
          SQL.Add('("con$saldoscuenta".MES = :"MES")');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
         end;

         with IBQuery1 do
         begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('"con$puc".SALDOINICIAL AS SALDOINICIAL ');
          SQL.Add('from "con$puc" ');
          SQL.Add('where ');
          SQL.Add('"con$puc".ID_AGENCIA = :ID_AGENCIA and ');
          SQL.Add('("con$puc".CODIGO = :"CODIGO") ');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
         end;

         with IBQuery2 do
         begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('case when ("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) is null ');
          SQL.Add('then 0 ');
          SQL.Add('else ');
          SQL.Add('("con$saldoscuenta".DEBITO - "con$saldoscuenta".CREDITO) ');
          SQL.Add('end ');
          SQL.Add('AS MOVIMIENTO ');
          SQL.Add('from "con$saldoscuenta" ');
          SQL.Add('where ');
          SQL.Add('"con$saldoscuenta".ID_AGENCIA = :ID_AGENCIA and ');
          SQL.Add('("con$saldoscuenta".CODIGO = :CODIGO) and ');
          SQL.Add('("con$saldoscuenta".MES < :MES) ');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
         end;

         TotalIngresos := 0;
         TotalGastos := 0;
         SaldoAnt := 0;
         DebitMov := 0;
         CrediMov := 0;
         SaldoAct := 0;

         IBQuery1.ParamByName('CODIGO').AsString := '400000000000000000';
         IBQuery1.Open;
         IBQuery2.ParamByName('CODIGO').AsString := '400000000000000000';
         IBQuery2.Open;
         SaldoAnterior := IBQuery1.FieldByName('SALDOINICIAL').AsCurrency + IBQuery2.FieldByName('MOVIMIENTO').AsCurrency;
         SaldoAnt := SaldoAnt + SaldoAnterior;
         IBQuery1.Close;
         IBQuery2.Close;

         IBQuery1.ParamByName('CODIGO').AsString := '500000000000000000';
         IBQuery1.Open;
         IBQuery2.ParamByName('CODIGO').AsString := '500000000000000000';
         IBQuery2.Open;
         SaldoAnterior := IBQuery1.FieldByName('SALDOINICIAL').AsCurrency + IBQuery2.FieldByName('MOVIMIENTO').AsCurrency;
         SaldoAnt := SaldoAnt + SaldoAnterior;
         IBQuery1.Close;
         IBQuery2.Close;

         IBQuery1.ParamByName('CODIGO').AsString := '600000000000000000';
         IBQuery1.Open;
         IBQuery2.ParamByName('CODIGO').AsString := '600000000000000000';
         IBQuery2.Open;
         SaldoAnterior := IBQuery1.FieldByName('SALDOINICIAL').AsCurrency + IBQuery2.FieldByName('MOVIMIENTO').AsCurrency;
         SaldoAnt := SaldoAnt + SaldoAnterior;
         IBQuery1.Close;
         IBQuery2.Close;

         IBQuery1.ParamByName('CODIGO').AsString := '700000000000000000';
         IBQuery1.Open;
         IBQuery2.ParamByName('CODIGO').AsString := '700000000000000000';
         IBQuery2.Open;
         SaldoAnterior := IBQuery1.FieldByName('SALDOINICIAL').AsCurrency + IBQuery2.FieldByName('MOVIMIENTO').AsCurrency;
         SaldoAnt := SaldoAnt + SaldoAnterior;
         IBQSaldoAnt.Close;
         IBQuery1.Close;
         IBQuery2.Close;

         IBQSaldoAct.ParamByName('CODIGO').AsString := '400000000000000000';
         IBQSaldoAct.Open;
         DebitMov := DebitMov + IBQSaldoAct.FieldByName('DEBITO').AsCurrency;
         CrediMov := CrediMov + IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
         IBQSaldoAct.Close;
         IBQSaldoAct.ParamByName('CODIGO').AsString := '500000000000000000';
         IBQSaldoAct.Open;
         DebitMov := DebitMov + IBQSaldoAct.FieldByName('DEBITO').AsCurrency;
         CrediMov := CrediMov + IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
         IBQSaldoAct.Close;
         IBQSaldoAct.ParamByName('CODIGO').AsString := '600000000000000000';
         IBQSaldoAct.Open;
         DebitMov := DebitMov + IBQSaldoAct.FieldByName('DEBITO').AsCurrency;
         CrediMov := CrediMov + IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
         IBQSaldoAct.Close;
         IBQSaldoAct.ParamByName('CODIGO').AsString := '700000000000000000';
         IBQSaldoAct.Open;
         DebitMov := DebitMov + IBQSaldoAct.FieldByName('DEBITO').AsCurrency;
         CrediMov := CrediMov + IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
         IBQSaldoAct.Close;

           with IBQTabla do
            begin
              IBQTabla.EmptyDataSet;
              While (not IBQPuc.Eof) do
               begin
                 Open;
                 Insert;
                 IBQSaldoAnt.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQSaldoAnt.Open;
                 IBQSaldoAct.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQSaldoAct.Open;
                 FieldByName('CODIGO').AsString := removeLeadingZeros(IBQPuc.FieldByName('CODIGO').AsString);
                 FieldByName('NOMBRE').AsString := IBQPuc.FieldByName('NOMBRE').AsString;
                 SaldoAnterior := IBQPuc.FieldByName('SALDOINICIAL').AsCurrency + IBQSaldoAnt.FieldByName('DEBITO').AsCurrency - IBQSaldoAnt.FieldByName('CREDITO').AsCurrency;
                 FieldByName('SALDOANTERIOR').AsCurrency := SaldoAnterior;
                 FieldByName('DEBITOMOV').AsCurrency := IBQSaldoAct.FieldByName('DEBITO').AsCurrency;
                 FieldByName('CREDITOMOV').AsCurrency := IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
                 FieldByName('DESCRIPCION_AGENCIA').AsString := IBQPuc.FieldByName('DESCRIPCION_AGENCIA').AsString;
                 Post;
                 Close;
                 IBQSaldoAnt.Close;
                 IBQSaldoAct.Close;
                 IBQPuc.Next;

               end;
            end;

             // 3
             IBQTabla.Open;
             if (IBQTabla.Locate('CODIGO','3',[])) then
             begin
                 IBQTabla.Edit;
                 IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency := IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency + SaldoAnt;
                 IBQTabla.FieldByName('DEBITOMOV').AsCurrency := IBQTabla.FieldByName('DEBITOMOV').AsCurrency   + DebitMov;
                 IBQTabla.FieldByName('CREDITOMOV').AsCurrency := IBQTabla.FieldByName('CREDITOMOV').AsCurrency + CrediMov;
                 IBQTabla.Post;
             end;
             // 36
             if (IBQTabla.Locate('CODIGO','36',[])) then
             begin
                 IBQTabla.Edit;
                 IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency := IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency + SaldoAnt;
                 IBQTabla.FieldByName('DEBITOMOV').AsCurrency := IBQTabla.FieldByName('DEBITOMOV').AsCurrency   + DebitMov;
                 IBQTabla.FieldByName('CREDITOMOV').AsCurrency := IBQTabla.FieldByName('CREDITOMOV').AsCurrency + CrediMov;
                 IBQTabla.Post;
             end;
             //3605 O 3610
             SaldoAct := SaldoAnt + DebitMov - CrediMov;
             if (SaldoAct < 0) then
                Codigo := '3605'
             else
                Codigo := '3610';
             if (IBQTabla.Locate('CODIGO',Codigo,[])) then
             begin
                 IBQTabla.Edit;
                 IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency := IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency + SaldoAnt;
                 IBQTabla.FieldByName('DEBITOMOV').AsCurrency := IBQTabla.FieldByName('DEBITOMOV').AsCurrency   + DebitMov;
                 IBQTabla.FieldByName('CREDITOMOV').AsCurrency := IBQTabla.FieldByName('CREDITOMOV').AsCurrency + CrediMov;
                 IBQTabla.Post;
             end;
             //360501 O 361001
             SaldoAct := SaldoAnt + DebitMov - CrediMov;
             if (SaldoAct < 0) then
                Codigo := '360501'
             else
                Codigo := '361001';
             if (IBQTabla.Locate('CODIGO',Codigo,[])) then
             begin
                 IBQTabla.Edit;
                 IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency := IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency + SaldoAnt;
                 IBQTabla.FieldByName('DEBITOMOV').AsCurrency := IBQTabla.FieldByName('DEBITOMOV').AsCurrency   + DebitMov;
                 IBQTabla.FieldByName('CREDITOMOV').AsCurrency := IBQTabla.FieldByName('CREDITOMOV').AsCurrency + CrediMov;
                 IBQTabla.Post;
             end;
             //36050101 O 36100101
             SaldoAct := SaldoAnt + DebitMov - CrediMov;
             if (SaldoAct < 0) then
                Codigo := '36050101'
             else
                Codigo := '36100101';
             if (IBQTabla.Locate('CODIGO',Codigo,[])) then
             begin
                 IBQTabla.Edit;
                 IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency := IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency + SaldoAnt;
                 IBQTabla.FieldByName('DEBITOMOV').AsCurrency := IBQTabla.FieldByName('DEBITOMOV').AsCurrency   + DebitMov;
                 IBQTabla.FieldByName('CREDITOMOV').AsCurrency := IBQTabla.FieldByName('CREDITOMOV').AsCurrency + CrediMov;
                 IBQTabla.Post;
             end;
             IBQTabla.First;

             While not IBQTabla.Eof do
             begin
                   //aqui
                   if (IBQTabla.FieldByName('SALDOANTERIOR').asCurrency = 0) and
                      (IBQTabla.FieldByName('DEBITOMOV').AsCurrency = 0) and
                      (IBQTabla.FieldByName('CREDITOMOV').AsCurrency = 0) then
                      IBQTabla.Delete
                   else
                      IBQTabla.Next;
             end;


             if (chkRegistrado.Checked) then
                frReport1.LoadFromFile('ReportesCon\frLibroBalance.frf')
             else
                frReport1.LoadFromFile('ReportesCon\frBalance.frf');
             frReport1.Dictionary.Variables['EMPRESA'] := QuotedStr(Empresa);
             frReport1.Dictionary.Variables['NIT'] := QuotedStr(Nit);
             frReport1.Dictionary.Variables['CORTE'] := QuotedStr(CBMeses.Text);
             frReport1.Dictionary.Variables['ANHO'] := QuotedStr(EdAno.Text);
             frReport1.PrepareReport;
             frReport1.ShowPreparedReport;
end;

procedure TfrmInformeBalance.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeBalance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := CaFree;
end;

procedure TfrmInformeBalance.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQPuc.Database := dmGeneral.IBDatabase1;
        IBQSaldoAct.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBQSaldoAnt.Database := dmGeneral.IBDatabase1;
        IBQPuc.Transaction := dmGeneral.IBTransaction1;
        IBQSaldoAct.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBQSaldoAnt.Transaction := dmGeneral.IBTransaction1;
end;

function TfrmInformeBalance.Empleado;
begin
        with IBQuery1 do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Result := FieldByName('NOMBRE').AsString + ' ' + FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
         end;
end;

function TfrmInformeBalance.removeLeadingZeros(const Value: string): string;
var
  i: Integer;
  CodigoArray: Array[1..8] of String;
begin
  Result := '';
  CodigoArray[1] := MidStr(Value,1,1);
  CodigoArray[2] := MidStr(Value,2,1);
  CodigoArray[3] := MidStr(Value,3,2);
  CodigoArray[4] := MidStr(Value,5,2);
  CodigoArray[5] := MidStr(Value,7,2);
  CodigoArray[6] := MidStr(Value,9,2);
  CodigoArray[7] := MidStr(Value,11,2);
  CodigoArray[8] := MidStr(Value,13,2);

  if (CodigoArray[8] = '00') then
  begin
    CodigoArray[8] := '';
    if CodigoArray[7] = '00' then
    begin
       CodigoArray[7] := '';
       if CodigoArray[6] = '00' then
       begin
          CodigoArray[6] := '';
          if CodigoArray[5] = '00' then
          begin
             CodigoArray[5] := '';
             if CodigoArray[4] = '00' then
             begin
                CodigoArray[4] := '';
                if CodigoArray[3] = '00' then
                begin
                   CodigoArray[3] := '';
                   if CodigoArray[2] = '0' then
                   begin
                      CodigoArray[2] := '';
                      if CodigoArray[1] = '0' then
                      begin
                         CodigoArray[1] := '';
                      end;
                   end;
                end;
             end;
          end;
       end;
    end;
  end;

  for i := 1 to 8 do
  begin
      Result := Result + CodigoArray[i];
  end;


end;

procedure TfrmInformeBalance.FormShow(Sender: TObject);
begin
        EdAno.Text := IntToStr(YearOf(fFechaActual));
end;

end.
