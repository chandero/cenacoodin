unit UnitLibroCajaDiario;

interface

uses
  Windows, Messages, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pr_Common, pr_TxClasses, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids;

type
  TfrmLibroRCajaDiario = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    CBMeses: TComboBox;
    EdAno: TMaskEdit;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQPuc: TIBQuery;
    IBQAuxiliar: TIBQuery;
    IBQTemp: TClientDataSet;
    IBQTempCODIGO: TStringField;
    IBQTempDIA: TIntegerField;
    IBQTempMES: TIntegerField;
    IBQTempDEBITO: TCurrencyField;
    IBQTempCREDITO: TCurrencyField;
    IBQTempNOMBRE: TStringField;
    IBQTemp1: TClientDataSet;
    StringField1: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    StringField2: TStringField;
    TOTALD: TAggregateField;
    TOTALC: TAggregateField;
    Reporte: TprTxReport;
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ReporteUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLibroRCajaDiario: TfrmLibroRCajaDiario;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales, UnitPantallaProgreso;

procedure TfrmLibroRCajaDiario.CmdAceptarClick(Sender: TObject);
     // AQUI COMIENZA
var Total:Integer;
    frmProgreso: TfrmProgreso;
    Codigo:string;
begin

        CmdAceptar.Enabled := False;
        Application.ProcessMessages;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        with IBQAuxiliar do begin
         Close;
         SQL.Clear;
         SQL.Add('select COUNT(*) AS TOTAL from CON$AUXILIAR where');
         SQL.Add('((ESTADOAUX = :ESTADO) and (FECHA BETWEEN :FECHA1 and :FECHA2))');
         ParamByName('ESTADO').AsString := 'C';
         ParamByName('FECHA1').AsDate := EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,01);
         ParamByName('FECHA2').AsDate := EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,DaysInMonth(EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,01)));
         try
          Open;
          Total := FieldByName('TOTAL').AsInteger;
         except
          Transaction.Rollback;
         end;

         Close;
         SQL.Clear;
         SQL.Add('select * from CON$AUXILIAR where');
         SQL.Add('((ESTADOAUX = :ESTADO) and (FECHA BETWEEN :FECHA1 and :FECHA2))');
         SQL.Add('Order by FECHA,ID_AGENCIA,CODIGO');
         ParamByName('ESTADO').AsString := 'C';
         ParamByName('FECHA1').AsDate := EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,01);
         ParamByName('FECHA2').AsDate := EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,DaysInMonth(EncodeDate(StrToInt(EdAno.Text),CBMeses.ItemIndex + 1,01)));
         try
          Open;
         except
          Transaction.Rollback;
          raise;
         end;

         frmProgreso := TfrmProgreso.Create(Self);
         frmProgreso.Caption := 'Procesando Caja Diario';
         frmProgreso.Min := 0;
         frmProgreso.Max := Total;
         frmProgreso.Position := 0;
         frmProgreso.Ejecutar;

         while not Eof do begin
           frmProgreso.Position := RecNo;
           frmProgreso.InfoLabel := 'Procesando: ' + FieldByName('CODIGO').AsString + ' ' + FieldByName('FECHA').AsString;
           Application.ProcessMessages;
           IBQTemp.Open;

           if not IBQTemp.FindKey([MonthOf(FieldByName('FECHA').AsDateTime),DayOf(FieldByName('FECHA').AsDateTime),LeftStr(FieldByName('CODIGO').AsString,4)]) then
//           if not IBQTemp.Locate('MES;DIA;CODIGO',VarArrayOf([MonthOf(FieldByName('FECHA').AsDateTime),DayOf(FieldByName('FECHA').AsDateTime),LeftStr(FieldByName('CODIGO').AsString,4)]),[loCaseInsensitive]) then
           begin
              IBQTemp.Insert;
              IBQTemp.FieldByName('CODIGO').AsString := LeftStr(FieldByName('CODIGO').AsString,4);
              IBQPuc.Close;
              IBQPuc.SQL.Clear;
              IBQPuc.SQL.Add('select NOMBRE from CON$PUC where CODIGO = :CODIGO');
              Codigo := '00000000000000';
              Codigo := LeftStr(FieldByName('CODIGO').AsString,4) + Codigo;
              IBQPuc.ParamByName('CODIGO').AsString := Codigo;
              try
                IBQPuc.Open;
              except
                IBQPuc.Transaction.Rollback;
                frmProgreso.Cerrar;
                raise;
              end;
              IBQTemp.FieldByName('NOMBRE').AsString := IBQPuc.FieldByName('NOMBRE').AsString;
              IBQTemp.FieldByName('DIA').AsInteger := DayOf(FieldByName('FECHA').AsDateTime);
              IBQTemp.FieldByName('MES').AsInteger := MonthOf(FieldByName('FECHA').AsDateTime);
              IBQTemp.FieldByName('DEBITO').AsCurrency := 0;
              IBQTemp.FieldByName('CREDITO').AsCurrency := 0;
              IBQTemp.Post;


           end;
           IBQTemp.Edit;
           IBQTemp.FieldByName('DEBITO').AsCurrency := IBQTemp.FieldByName('DEBITO').AsCurrency + FieldByName('DEBITO').AsCurrency;
           IBQTemp.FieldByName('CREDITO').AsCurrency := IBQTemp.FieldByName('CREDITO').AsCurrency + FieldByName('CREDITO').AsCurrency;
           IBQTemp.Post;
           IBQTemp.First;
           IBQTemp.Close;

           IBQTemp1.Open;
           if not IBQTemp1.FindKey([LeftStr(FieldByName('CODIGO').AsString,4)]) then
//           if not IBQTemp.Locate('MES;DIA;CODIGO',VarArrayOf([MonthOf(FieldByName('FECHA').AsDateTime),DayOf(FieldByName('FECHA').AsDateTime),LeftStr(FieldByName('CODIGO').AsString,4)]),[loCaseInsensitive]) then
           begin

              IBQTemp1.Insert;
              IBQTemp1.FieldByName('CODIGO').AsString := LeftStr(FieldByName('CODIGO').AsString,4);
              IBQTemp1.FieldByName('NOMBRE').AsString := IBQPuc.FieldByName('NOMBRE').AsString;
              //IBQTemp1.FieldByName('MES').AsInteger := MonthOf(FieldByName('FECHA').AsDateTime);
              IBQTemp1.FieldByName('DEBITO').AsCurrency := 0;
              IBQTemp1.FieldByName('CREDITO').AsCurrency := 0;
              IBQTemp1.Post;
           end;
           IBQTemp1.Edit;
           IBQTemp1.FieldByName('DEBITO').AsCurrency := IBQTemp1.FieldByName('DEBITO').AsCurrency + FieldByName('DEBITO').AsCurrency;
           IBQTemp1.FieldByName('CREDITO').AsCurrency := IBQTemp1.FieldByName('CREDITO').AsCurrency + FieldByName('CREDITO').AsCurrency;
           IBQTemp1.Post;
           IBQTemp1.Close;

           Next;
         end;
         frmProgreso.Cerrar;

       end;

     // AQUI TERMINA


    {
        with IBQTemp do begin
          Close;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
        end;

        with IBQTemp1 do begin
          Close;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
        end;
     }


        Reporte.Variables.ByName['MES'].AsString := CBMeses.Text;
        Reporte.Variables.ByName['ANOCORTE'].AsString := EdAno.Text;

        if Reporte.PrepareReport then
           Reporte.PreviewPreparedReport(True);
     
end;

procedure TfrmLibroRCajaDiario.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLibroRCajaDiario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        entertabs(Key,Self);
end;

procedure TfrmLibroRCajaDiario.FormCreate(Sender: TObject);
begin

      with IBQPuc do begin
        if Transaction.InTransaction then
           Transaction.Rollback;
        Transaction.StartTransaction;
      end;
      
end;

procedure TfrmLibroRCajaDiario.ReporteUnknownVariable(Sender: TObject;
  const VarName: String; var Value: TprVarValue; var IsProcessed: Boolean);
begin
        if (VarName = 'TotalCodigoDebito') then
        begin
            Value.vDouble := IBQTemp1.FieldByName('TotalCodigoDebito').AsCurrency;
        end;
        if (VarName = 'TotalCodigoCredito') then
        begin
            Value.vDouble := IBQTemp1.FieldByName('TotalCodigoCredito').AsCurrency;
        end;
end;

end.
