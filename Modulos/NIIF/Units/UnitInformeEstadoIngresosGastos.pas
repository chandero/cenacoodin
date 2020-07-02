unit UnitInformeEstadoIngresosGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils,
  DateUtils, Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, FR_Class, DB, DBClient,
  IBCustomDataSet, IBQuery, FR_DSet, FR_DBSet, frOLEExl, FR_E_TXT, FR_E_CSV, UnitGlobales;

type
  TfrmInformeEstadoIngresosGastos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label5: TLabel;
    CBMeses: TComboBox;
    Label4: TLabel;
    EdAno: TMaskEdit;
    frReport1: TfrReport;
    IBQPuc: TIBQuery;
    IBQSaldoAct: TIBQuery;
    IBQuery1: TIBQuery;
    IBQTabla: TClientDataSet;
    IBQTablaCODIGO: TStringField;
    IBQTablaNOMBRE: TStringField;
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
    IBQTablaSALDOANTERIOR: TCurrencyField;
    procedure CmdAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
     function Empleado: String;
     function removeLeadingZeros(const Value: String): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeEstadoIngresosGastos: TfrmInformeEstadoIngresosGastos;
  TotalIngresos: Currency;
  TotalGastos: Currency;

implementation

uses UnitdmGeneral;

{$R *.dfm}

procedure TfrmInformeEstadoIngresosGastos.CmdAceptarClick(Sender: TObject);
var
Tabla:String;
SaldoAnterior:Currency;

// Utilidad o Perdida
SaldoAnt : Currency;
DebitMov : Currency;
CrediMov : Currency;
SaldoAct : Currency;

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
          ParamByName('CODIGO1').AsString := '400000000000000000';
          ParamByName('CODIGO2').AsString := '799999999999999999';
          Open;
       end;

       SaldoAnt := 0;
       DebitMov := 0;
       CrediMov := 0;
       SaldoAct := 0;

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

         TotalIngresos := 0;
         TotalGastos := 0;

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
                 if ((IBQPuc.FieldByName('CODIGO').AsString = '400000000000000000') or
                     (IBQPuc.FieldByName('CODIGO').AsString = '500000000000000000') or
                     (IBQPuc.FieldByName('CODIGO').AsString = '600000000000000000') or
                     (IBQPuc.FieldByName('CODIGO').AsString = '700000000000000000'))
                 then
                 begin
                    SaldoAnt := SaldoAnt + SaldoAnterior;
                    DebitMov := DebitMov + IBQSaldoAct.FieldByName('DEBITO').AsCurrency;
                    CrediMov := CrediMov + IBQSaldoAct.FieldByName('CREDITO').AsCurrency;
                 end;
                 Post;
                 Close;

                 IBQSaldoAnt.Close;
                 IBQSaldoAct.Close;
                 IBQPuc.Next;

               end;
               SaldoAct := SaldoAnt + DebitMov + CrediMov;
               IBQTabla.Open;
               IBQTabla.Insert;
               IBQTabla.FieldByName('CODIGO').AsString := 'AL CORTE';
               IBQTabla.FieldByName('NOMBRE').AsString := 'GANANCIA O PERDIDA';
               IBQTabla.FieldByName('SALDOANTERIOR').AsCurrency := SaldoAnt;
               IBQTabla.FieldByName('DEBITOMOV').AsCurrency := DebitMov;
               IBQTabla.FieldByName('CREDITOMOV').AsCurrency := CrediMov;
               IBQTabla.Post;
               IBQTabla.Close;
            end;

             IBQPuc.Close;
             IBQSaldoAct.Close;

             IBQTabla.Open;
             IBQTabla.First;

             frReport1.LoadFromFile('ReportesCon\frEstadoIngresosGastos.frf');
             frReport1.Dictionary.Variables['EMPRESA'] := QuotedStr(Empresa);
             frReport1.Dictionary.Variables['NIT'] := QuotedStr(Nit);
             frReport1.Dictionary.Variables['CORTE'] := QuotedStr(CBMeses.Text);
             frReport1.Dictionary.Variables['ANHO'] := QuotedStr(EdAno.Text);
             frReport1.PrepareReport;
             frReport1.ShowPreparedReport;
end;

function TfrmInformeEstadoIngresosGastos.Empleado;
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


procedure TfrmInformeEstadoIngresosGastos.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQPuc.Database := dmGeneral.IBDatabase1;
        IBQSaldoAct.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQSaldoAnt.Database := dmGeneral.IBDatabase1;
        IBQPuc.Transaction := dmGeneral.IBTransaction1;
        IBQSaldoAct.Transaction := dmGeneral.IBTransaction1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQSaldoAnt.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmInformeEstadoIngresosGastos.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmInformeEstadoIngresosGastos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := CaFree;
end;

procedure TfrmInformeEstadoIngresosGastos.FormShow(Sender: TObject);
begin
        EdAno.Text := IntToStr(YearOf(fFechaActual));
end;

function TfrmInformeEstadoIngresosGastos.removeLeadingZeros(const Value: string): string;
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

end.
