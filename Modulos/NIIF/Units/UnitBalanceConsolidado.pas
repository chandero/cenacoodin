unit UnitBalanceConsolidado;

interface

uses
  Windows, Messages, StrUtils, Math, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  FR_Class, FR_DSet, FR_DBSet, IBSQL, pr_Common, pr_Classes, pr_Parser;

type
  TfrmBalanceConsolidado = class(TForm)
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdReporte: TBitBtn;
    cmdCerrar: TBitBtn;
    CBMeses: TComboBox;
    Reporte: TfrReport;
    IBQuery1: TIBQuery;
    CBNivel: TComboBox;
    frDBDataSet1: TfrDBDataSet;
    IBSQL1: TIBSQL;
    chkMiles: TCheckBox;
    Label1: TLabel;
    EdCodigo: TStaticText;
    pReporte: TprReport;
    procedure cmdProcesarClick(Sender: TObject);
    procedure ReporteGetValue(const ParName: String;
      var ParValue: Variant);
    procedure cmdReporteClick(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
    procedure pReporteUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanceConsolidado: TfrmBalanceConsolidado;
  CodigoExcedente:string;
  CodigoPerdida:string;
  ValorEoP:Currency;
  CodigoEoP:string;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales;

procedure TfrmBalanceConsolidado.cmdProcesarClick(Sender: TObject);
var Valor4,Valor5,Valor6,Valor7:Currency;
begin
        if (CBMeses.ItemIndex < 0) or
           (CBNivel.ItemIndex < 0) then
        begin
           MessageDlg('Debe seleccionar el Mes y el Nivel',mtError,[mbcancel],0);
           Exit;
        end;

        cmdProcesar.Enabled := False;


        with IBSQL1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$codigosingresosgastos"');
          try
           ExecQuery;
           if RecordCount > 0 then
            while not Eof do begin
              if FieldByName('ID').AsInteger = 1 then
                CodigoExcedente := FieldByName('CODIGO').AsString;
              if FieldByName('ID').AsInteger = 2 then
                CodigoPerdida := FieldByName('CODIGO').AsString;
              Next;
            end
           else
            begin
               CodigoExcedente := Format('%.18d',[0]);
               CodigoPerdida   := Format('%.18d',[0]);
            end;
          except
           Transaction.Rollback;
           raise;
          end;
          Close;
          SQL.Clear;
          SQL.Add('select SALDO from VALOR_CONSOLIDADO(:MES,:CODIGO)');
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
          ParamByName('CODIGO').AsString := '400000000000000000';
          try
           ExecQuery;
           if RecordCount > 0 then
              Valor4 := FieldByName('SALDO').AsCurrency
           else
              Valor4 := 0;
          except
            Transaction.Rollback;
            raise;
          end;
          Close;
          ParamByName('CODIGO').AsString := '500000000000000000';
          try
           ExecQuery;
           if RecordCount > 0 then
              Valor5 := FieldByName('SALDO').AsCurrency
           else
              Valor5 := 0;
          except
            Transaction.Rollback;
            raise;
          end;
          Close;
          ParamByName('CODIGO').AsString := '600000000000000000';
          try
           ExecQuery;
           if RecordCount > 0 then
              Valor6 := FieldByName('SALDO').AsCurrency
           else
              Valor6 := 0;
          except
            Transaction.Rollback;
            raise;
          end;
          Close;
          ParamByName('CODIGO').AsString := '700000000000000000';
          try
           ExecQuery;
           if RecordCount > 0 then
              Valor7 := FieldByName('SALDO').AsCurrency
           else
              Valor7 := 0;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

        ValorEoP := Valor4+Valor5+Valor6+Valor7;
        if ValorEoP > 0 then
           CodigoEoP := CodigoPerdida
        else
           CodigoEoP := CodigoExcedente;

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM BALANCE_CONSOLIDADO(:MES,:NIVELX)');
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
          ParamByName('NIVELX').AsInteger := CBNivel.ItemIndex+1;
        end;

        cmdReporte.Enabled := True;
        cmdReporte.Click;

end;

procedure TfrmBalanceConsolidado.ReporteGetValue(const ParName: String;
  var ParValue: Variant);
var Nivel:Integer;
    Codigo:string;
begin
        if ParName = 'EMPRESA' then ParValue := Empresa;

        if ParName = 'NIT' then ParValue := Nit;

        if ParName = 'MESCORTE' then ParValue := UpperCase(CBMeses.Items[CBMeses.ItemIndex]);

        if ParName = 'CODIGO' then
        begin
           Nivel := IBQuery1.FieldByName('NIVEL').AsInteger;
           case Nivel of
           1: ParValue := LeftStr(IBQuery1.FieldByName('CODIGO').AsString,1);
           2: ParValue := LeftStr(IBQuery1.FieldByName('CODIGO').AsString,2);
           3: ParValue := LeftStr(IBQuery1.FieldByName('CODIGO').AsString,4);
           4: ParValue := LeftStr(IBQuery1.FieldByName('CODIGO').AsString,6);
           5: ParValue := LeftStr(IBQuery1.FieldByName('CODIGO').AsString,8);
           6: ParValue := LeftStr(IBQuery1.FieldByName('CODIGO').AsString,10);
           7: ParValue := LeftStr(IBQuery1.FieldByName('CODIGO').AsString,12);
           8: ParValue := LeftStr(IBQuery1.FieldByName('CODIGO').AsString,14);
           end;
        end;

        if ParName = 'NOMBRE' then
           ParValue := IBQuery1.FieldByName('NOMBRE').AsString;

        if ParName = 'SALDO' then
        begin
           Nivel := IBQuery1.FieldByName('NIVEL').AsInteger;
           Codigo := IBQuery1.FieldByName('CODIGO').AsString;
           ParValue := IBQuery1.FieldByName('SALDO').AsCurrency;
           case Nivel of
           1: begin
                if LeftStr(Codigo,1) = LeftStr(CodigoEoP,1) then
                   ParValue := ParValue + ValorEoP;
              end;
           2: begin
                if LeftStr(Codigo,2) = LeftStr(CodigoEoP,2) then
                   ParValue := ParValue + ValorEoP;
              end;
           3: begin
                if LeftStr(Codigo,4) = LeftStr(CodigoEoP,4) then
                   ParValue := ParValue + ValorEoP;
              end;
           4: begin
                if LeftStr(Codigo,6) = LeftStr(CodigoEoP,6) then
                   ParValue := ParValue + ValorEoP;
              end;
           5: begin
                if LeftStr(Codigo,8) = LeftStr(CodigoEoP,8) then
                   ParValue := ParValue + ValorEoP;
              end;
           6: begin
                if LeftStr(Codigo,10) = LeftStr(CodigoEoP,10) then
                   ParValue := ParValue + ValorEoP;
              end;
           7: begin
                if LeftStr(Codigo,12) = LeftStr(CodigoEoP,12) then
                   ParValue := ParValue + ValorEoP;
              end;
           8: begin
                if LeftStr(Codigo,14) = LeftStr(CodigoEoP,14) then
                   ParValue := ParValue + ValorEoP;
              end;
           end;
           if chkMiles.Checked then ParValue := SimpleRoundTo((ParValue/1000),-2);

        end;
end;

procedure TfrmBalanceConsolidado.cmdReporteClick(Sender: TObject);
begin
         pReporte.Variables.ByName['EMPRESA'].AsString := Empresa;
         pReporte.Variables.ByName['NIT'].AsString := Nit;
         pReporte.Variables.ByName['MESCORTE'].AsString := UpperCase(CBMeses.Items[CBMeses.ItemIndex])+ ' de ' + IntToStr(Yearof(ffechaactual));
         if chkMiles.Checked then pReporte.Variables.ByName['ENMILES'].AsString := 'Expresado en Miles'
         else pReporte.Variables.ByName['ENMILES'].AsString := 'Expresado en Pesos';

         if pReporte.PrepareReport then
            pReporte.PreviewPreparedReport(True);
{        if Reporte.PrepareReport then
           Reporte.ShowPreparedReport;}
end;

procedure TfrmBalanceConsolidado.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBalanceConsolidado.pReporteUnknownVariable(Sender: TObject;
  const VarName: String; var Value: TprVarValue; var IsProcessed: Boolean);
var Nivel:Integer;
    Codigo:string;
    Valor:Currency;
begin
        Application.ProcessMessages;
        if VarName = 'CODIGO' then
        begin
           Nivel := IBQuery1.FieldByName('NIVEL').AsInteger;
           case Nivel of
           1: _vSetAsString(Value,LeftStr(IBQuery1.FieldByName('CODIGO').AsString,1));
           2: _vSetAsString(Value,LeftStr(IBQuery1.FieldByName('CODIGO').AsString,2));
           3: _vSetAsString(Value,LeftStr(IBQuery1.FieldByName('CODIGO').AsString,4));
           4: _vSetAsString(Value,LeftStr(IBQuery1.FieldByName('CODIGO').AsString,6));
           5: _vSetAsString(Value,LeftStr(IBQuery1.FieldByName('CODIGO').AsString,8));
           6: _vSetAsString(Value,LeftStr(IBQuery1.FieldByName('CODIGO').AsString,10));
           7: _vSetAsString(Value,LeftStr(IBQuery1.FieldByName('CODIGO').AsString,12));
           8: _vSetAsString(Value,LeftStr(IBQuery1.FieldByName('CODIGO').AsString,14));
           end;
           EdCodigo.Caption := Value.vString;
        end;

        if VarName = 'NOMBRE' then
           _vSetAsString(Value,IBQuery1.FieldByName('NOMBRE').AsString);

        if (VarName = 'SALDO') or (VarName = 'SALDO1') then
        begin
           Nivel := IBQuery1.FieldByName('NIVEL').AsInteger;
           Codigo := IBQuery1.FieldByName('CODIGO').AsString;
           Valor:= IBQuery1.FieldByName('SALDO').AsCurrency;
           case Nivel of
           1: begin
                if LeftStr(Codigo,1) = LeftStr(CodigoEoP,1) then
                   Valor := Valor + ValorEoP;
              end;
           2: begin
                if LeftStr(Codigo,2) = LeftStr(CodigoEoP,2) then
                   Valor := Valor + ValorEoP;
              end;
           3: begin
                if LeftStr(Codigo,4) = LeftStr(CodigoEoP,4) then
                   Valor := Valor + ValorEoP;
              end;
           4: begin
                if LeftStr(Codigo,6) = LeftStr(CodigoEoP,6) then
                   Valor := Valor + ValorEoP;
              end;
           5: begin
                if LeftStr(Codigo,8) = LeftStr(CodigoEoP,8) then
                   Valor := Valor + ValorEoP;
              end;
           6: begin
                if LeftStr(Codigo,10) = LeftStr(CodigoEoP,10) then
                   Valor := Valor + ValorEoP;
              end;
           7: begin
                if LeftStr(Codigo,12) = LeftStr(CodigoEoP,12) then
                   Valor := Valor + ValorEoP;
              end;
           8: begin
                if LeftStr(Codigo,14) = LeftStr(CodigoEoP,14) then
                   Valor := Valor + ValorEoP;
              end;
           end;

           if chkMiles.Checked then Valor:= SimpleRoundTo((Valor/1000),-2);


           _vSetAsDouble(Value,Valor);
        end;
        IsProcessed:= True;

end;

end.
