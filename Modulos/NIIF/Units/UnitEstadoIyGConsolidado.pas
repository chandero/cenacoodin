unit UnitEstadoIyGConsolidado;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Math, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pr_Common, pr_Classes, IBSQL, FR_DSet, FR_DBSet, DB,
  IBCustomDataSet, IBQuery, FR_Class, StdCtrls, Buttons, ExtCtrls,pr_Parser;

type
  TfrmEstadoIyGConsolidado = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdReporte: TBitBtn;
    cmdCerrar: TBitBtn;
    CBMeses: TComboBox;
    CBNivel: TComboBox;
    chkMiles: TCheckBox;
    EdCodigo: TStaticText;
    Reporte: TfrReport;
    IBQuery1: TIBQuery;
    frDBDataSet1: TfrDBDataSet;
    IBSQL1: TIBSQL;
    pReporte: TprReport;
    procedure cmdProcesarClick(Sender: TObject);
    procedure pReporteUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure cmdReporteClick(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstadoIyGConsolidado: TfrmEstadoIyGConsolidado;
  ValorEoP:Currency;
  CodigoPerdida:string;
  CodigoExcedente:string;
  CodigoEoP:string;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales;

procedure TfrmEstadoIyGConsolidado.cmdProcesarClick(Sender: TObject);
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
          SQL.Add('SELECT * FROM ESTADO_IYG_CONSOLIDADO(:MES,:NIVELX)');
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
          ParamByName('NIVELX').AsInteger := CBNivel.ItemIndex+1;
        end;

        cmdReporte.Enabled := True;
        cmdReporte.Click;

end;

procedure TfrmEstadoIyGConsolidado.pReporteUnknownVariable(Sender: TObject;
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

        if VarName = 'EXCEDENTE' then
        begin
           if ValorEoP > 0 then
             _vSetAsString(Value,'PERDIDA DEL EJERCICIO')
           else
             _vSetAsString(Value,'EXCEDENTE DEL EJERCICIO');
        end;

        if VarName = 'SALDO_EXCEDENTE' then
          if chkMiles.Checked then
           _vSetAsDouble(Value,SimpleRoundTo((ValorEoP/1000),-2))
          else
           _vSetAsDouble(Value,ValorEoP);

        IsProcessed:= True;
end;

procedure TfrmEstadoIyGConsolidado.cmdReporteClick(Sender: TObject);
begin
         pReporte.Variables.ByName['EMPRESA'].AsString := Empresa;
         pReporte.Variables.ByName['NIT'].AsString := Nit;
         pReporte.Variables.ByName['MESCORTE'].AsString := UpperCase(CBMeses.Items[CBMeses.ItemIndex])+ ' de ' + IntToStr(Yearof(ffechaactual));
         if chkMiles.Checked then pReporte.Variables.ByName['ENMILES'].AsString := 'Expresado en Miles'
         else pReporte.Variables.ByName['ENMILES'].AsString := 'Expresado en Pesos';

         if pReporte.PrepareReport then
            pReporte.PreviewPreparedReport(True);

end;

procedure TfrmEstadoIyGConsolidado.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

end.
