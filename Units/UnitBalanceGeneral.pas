unit UnitBalanceGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  IBSQL, pr_Common, pr_TxClasses, StrUtils, DBClient;

type
  TfrmBalanceGeneral = class(TForm)
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
    IBQuery1: TIBQuery;
    IBQTabla: TClientDataSet;
    IBQTablaCODIGO: TStringField;
    IBQTablaNOMBRE: TStringField;
    IBQTablaDEBITOANT: TCurrencyField;
    IBQTablaCREDITOANT: TCurrencyField;
    IBQTablaDEBITOMOV: TCurrencyField;
    IBQTablaCREDITOMOV: TCurrencyField;
    IBQTabla1: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    CurrencyField4: TCurrencyField;
    IBQSaldoAnt: TIBQuery;
    ReportBalance: TprTxReport;
    IBQTablaDESCRIPCION_AGENCIA: TStringField;
    IBQSaldoInicial: TIBQuery;
    procedure CBMesesExit(Sender: TObject);
    procedure CBMesesKeyPress(Sender: TObject; var Key: Char);
    procedure EdAnoExit(Sender: TObject);
    procedure EdAnoKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdAceptarClick(Sender: TObject);
  private
    function Empleado:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanceGeneral: TfrmBalanceGeneral;
  Mes : String;
  MesCorte : String;
  NomMes : String;
  AnoCorte : Integer;
  CodigoInicial : String;
  CodigoFinal   : String;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitVistaPreliminar;

procedure TfrmBalanceGeneral.CBMesesExit(Sender: TObject);
begin
        With CBMeses do
         case ItemIndex of
           0: begin
                Mes := '01';
                MesCorte := '00';
                AnoCorte := AnoCorte - 1;
                NomMes := 'Enero';
              end;
           1: begin
                Mes := '02';
                MesCorte := '01';
                NomMes := 'Febrero';
              end;
           2: begin
                Mes := '03';
                MesCorte := '02';
                NomMes := 'Marzo';
              end;
           3: begin
                Mes := '04';
                MesCorte := '03';
                NomMes := 'Abril';
              end;
           4: begin
                Mes := '05';
                MesCorte := '04';
                NomMes := 'Mayo';
              end;
           5: begin
                Mes := '06';
                MesCorte := '05';
                NomMes := 'Junio';
              end;
           6: begin
                Mes := '07';
                MesCorte := '06';
                NomMes := 'Julio';
              end;
           7: begin
                Mes := '08';
                MesCorte := '07';
                NomMes := 'Agosto';
              end;
           8: begin
                Mes := '09';
                MesCorte := '08';
                NomMes := 'Septiembre';
              end;
           9: begin
                Mes := '10';
                MesCorte := '09';
                NomMes := 'Octubre';
              end;
          10: begin
                Mes := '11';
                MesCorte := '10';
                NomMes := 'Noviembre';
              end;
          11: begin
                Mes := '12';
                MesCorte := '11';
                NomMes := 'Diciembre';
              end;
         end;
end;

procedure TfrmBalanceGeneral.CBMesesKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmBalanceGeneral.EdAnoExit(Sender: TObject);
begin
        AnoCorte := StrToInt(EdAno.Text);
end;

procedure TfrmBalanceGeneral.EdAnoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmBalanceGeneral.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBalanceGeneral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        Action := CaFree;
end;

procedure TfrmBalanceGeneral.CmdAceptarClick(Sender: TObject);
var
Tabla:String;
SaldoAnterior:Currency;
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
          SQL.Add('CON$PUC.CODIGO,');
          SQL.Add('CON$PUC.ID_AGENCIA,');
          SQL.Add('CON$PUC.NOMBRE,');
          SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA');
          SQL.Add(' from CON$PUC ');
          SQL.Add('LEFT JOIN "gen$agencia" ON (CON$PUC.ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
          SQL.Add('where ');
          SQL.Add('(CON$PUC.ID_AGENCIA = :ID_AGENCIA) and');
          SQL.Add('(CON$PUC.NIVEL = :"NIVEL")');
          SQL.Add('order by CON$PUC.CODIGO');

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('NIVEL').AsInteger := 3;
          Open;
       end;

       with IBQSaldoInicial do
       begin
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('p.CODIGO, ');
          SQL.Add('s.SALDOINICIAL ');
          SQL.Add('from CON$PUC p ');
          SQL.Add('left join CON$SALDOSINICIALES s ON (p.CODIGO = s.CODIGO and p.ID_AGENCIA = s.ID_AGENCIA) ');
          SQL.Add('where ');
          SQL.Add('p.ID_AGENCIA = :ID_AGENCIA and ');
          SQL.Add('p.CODIGO = :CODIGO ');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
       end;

       with IBQSaldoAnt do
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
          ParamByName('MES').AsInteger := StrToInt(MesCorte);
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
          ParamByName('MES').AsInteger := StrToInt(Mes);
         end;

           with IBQTabla do
            begin
              While (not IBQPuc.Eof) do
               begin
                 Open;
                 Insert;
                 IBQSaldoAnt.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQSaldoAnt.Open;
                 IBQSaldoAct.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 IBQSaldoAct.Open;
                 FieldByName('CODIGO').AsString := LeftStr(IBQPuc.FieldByName('CODIGO').AsString,4);
                 FieldByName('NOMBRE').AsString := IBQPuc.FieldByName('NOMBRE').AsString;
                 IBQSaldoInicial.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                 SaldoAnterior := IBQSaldoInicial.FieldByName('SALDOINICIAL').AsCurrency + IBQSaldoAnt.FieldByName('DEBITO').AsCurrency - IBQSaldoAnt.FieldByName('CREDITO').AsCurrency;
                 if SaldoAnterior > 0 then
                  begin
                    FieldByName('DEBITOANT').AsCurrency := SaldoAnterior;
                    FieldByName('CREDITOANT').AsCurrency := 0;
                  end
                 else
                  begin
                    FieldByName('DEBITOANT').AsCurrency := 0;
                    FieldByName('CREDITOANT').AsCurrency := -SaldoAnterior;
                  end;
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

             IBQPuc.Close;
             IBQSaldoAct.Close;

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


              ReportBalance.Variables.ByName['Empresa'].AsString := Empresa;
              ReportBalance.Variables.ByName['Nit'].AsString := Nit;
              ReportBalance.Variables.ByName['Hoy'].AsDateTime := Now;
              ReportBalance.Variables.ByName['Empleado'].AsString := Empleado;
              ReportBalance.Variables.ByName['Mes'].AsString := NomMes;
              ReportBalance.Variables.ByName['AnoCorte'].AsInteger := AnoCorte;

              if ReportBalance.PrepareReport then
               begin
                 frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
                 frmVistaPreliminar.Reporte := ReportBalance;
                 frmVistaPreliminar.ShowModal;
               end;

end;

function TfrmBalanceGeneral.Empleado;
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


end.





