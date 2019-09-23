unit UnitLibroBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils, DateUtils,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, IBCustomDataSet, IBQuery, DB, UnitDmGeneral,
  DBClient, FR_E_TXT, FR_E_CSV, FR_Class, frOLEExl, FR_DSet, FR_DBSet;

type
  TfrmLibroBalanceGeneral = class(TForm)
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    CBMeses: TComboBox;
    EdAno: TMaskEdit;
    frReport1: TfrReport;
    frDBDatos: TfrDBDataSet;
    frOLEExcelExport1: TfrOLEExcelExport;
    frCSVExport1: TfrCSVExport;
    IBQTabla1: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    CurrencyField4: TCurrencyField;
    IBQTabla: TClientDataSet;
    IBQTablaCODIGO: TStringField;
    IBQTablaNOMBRE: TStringField;
    IBQTablaSALDOANTERIOR: TCurrencyField;
    IBQTablaDEBITOMOV: TCurrencyField;
    IBQTablaCREDITOMOV: TCurrencyField;
    IBQTablaDESCRIPCION_AGENCIA: TStringField;
    IBQuery2: TIBQuery;
    IBQuery1: TIBQuery;
    IBQSaldoAnt: TIBQuery;
    IBQSaldoAct: TIBQuery;
    IBQPuc: TIBQuery;
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function Empleado: string;
    function removeLeadingZeros(const Value: string): string;
  public
    { Public declarations }
  end;

var
  frmLibroBalanceGeneral: TfrmLibroBalanceGeneral;
  dmGeneral : TdmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmLibroBalanceGeneral.CmdAceptarClick(Sender: TObject);
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
       CmdAceptar.Enabled := false;
       IBQTabla.EmptyDataSet;
       IBQTabla1.EmptyDataSet;
       with IBQPuc do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('CON$PUC.CODIGO,');
          SQL.Add('CON$PUC.ID_AGENCIA,');
          SQL.Add('CON$PUC.NOMBRE,');
          SQL.Add('CON$PUC.SALDOINICIAL,');
          SQL.Add('CON$PUC.NIVEL,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          SQL.Add(' from CON$PUC ');
          SQL.Add('LEFT JOIN "gen$agencia" ON (CON$PUC.ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('(CON$PUC.ID_AGENCIA = :ID_AGENCIA) and (CON$PUC.CODIGO BETWEEN :CODIGO1 and :CODIGO2)  ');
          SQL.Add('order by CON$PUC.CODIGO');

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('CODIGO1').AsString := '100000000000000000';
          ParamByName('CODIGO2').AsString := '799999999999999999';
          Open;
       end;

       with IBQSaldoAnt do
        Begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('SUM(CON$SALDOSCUENTA.DEBITO) AS DEBITO,');
          SQL.Add('SUM(CON$SALDOSCUENTA.CREDITO) AS CREDITO');
          SQL.Add(' from CON$SALDOSCUENTA ');
          SQL.Add('where ');
          SQL.Add('CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('(CON$SALDOSCUENTA.CODIGO = :"CODIGO") and');
          SQL.Add('(CON$SALDOSCUENTA.MES < :"MES")');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
         end;

       with IBQSaldoAct do
        Begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('CON$PUC.CODIGO,');
          SQL.Add('CON$SALDOSCUENTA.DEBITO,');
          SQL.Add('CON$SALDOSCUENTA.CREDITO');
          SQL.Add(' from CON$PUC ');
          SQL.Add('LEFT JOIN CON$SALDOSCUENTA ON (CON$PUC.CODIGO = CON$SALDOSCUENTA.CODIGO and CON$PUC.ID_AGENCIA = CON$SALDOSCUENTA.ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('CON$PUC.ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('(CON$PUC.CODIGO = :"CODIGO") and');
          SQL.Add('(CON$SALDOSCUENTA.MES = :"MES")');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
         end;

         with IBQuery1 do
         begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('CON$PUC.SALDOINICIAL AS SALDOINICIAL ');
          SQL.Add('from CON$PUC ');
          SQL.Add('where ');
          SQL.Add('CON$PUC.ID_AGENCIA = :ID_AGENCIA and ');
          SQL.Add('(CON$PUC.CODIGO = :"CODIGO") ');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
         end;

         with IBQuery2 do
         begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('case when (CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) is null ');
          SQL.Add('then 0 ');
          SQL.Add('else ');
          SQL.Add('(CON$SALDOSCUENTA.DEBITO - CON$SALDOSCUENTA.CREDITO) ');
          SQL.Add('end ');
          SQL.Add('AS MOVIMIENTO ');
          SQL.Add('from CON$SALDOSCUENTA ');
          SQL.Add('where ');
          SQL.Add('CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and ');
          SQL.Add('(CON$SALDOSCUENTA.CODIGO = :CODIGO) and ');
          SQL.Add('(CON$SALDOSCUENTA.MES < :MES) ');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
         end;

         TotalIngresos := 0;
         TotalGastos := 0;
         SaldoAnt := 0;
         DebitMov := 0;
         CrediMov := 0;
         SaldoAct := 0;

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

             IBQTabla.First;

             frReport1.LoadFromFile('ReportesCon\frLibroBalance.frf');
             frReport1.Dictionary.Variables['EMPRESA'] := QuotedStr(Empresa);
             frReport1.Dictionary.Variables['NIT'] := QuotedStr(Nit);
             frReport1.Dictionary.Variables['CORTE'] := QuotedStr(CBMeses.Text);
             frReport1.Dictionary.Variables['ANHO'] := QuotedStr(EdAno.Text);
             frReport1.PrepareReport;
             frReport1.ShowPreparedReport;
end;

procedure TfrmLibroBalanceGeneral.FormCreate(Sender: TObject);
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

function TfrmLibroBalanceGeneral.Empleado;
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

function TfrmLibroBalanceGeneral.removeLeadingZeros(const Value: string): string;
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

procedure TfrmLibroBalanceGeneral.FormShow(Sender: TObject);
begin
        EdAno.Text := IntToStr(DBAnho);
end;

procedure TfrmLibroBalanceGeneral.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLibroBalanceGeneral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := CaFree;
end;

end.
