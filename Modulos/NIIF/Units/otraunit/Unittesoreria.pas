unit Unittesoreria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery, ComCtrls,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, IBDatabase, DBClient;

type
  TFrmtesoreria = class(TForm)
    CDcheques: TIBQuery;
    PRcheques: TprTxReport;
    Panel1: TPanel;
    Fecha: TLabel;
    DBfecha: TDateTimePicker;
    Label1: TLabel;
    DBcaja: TDBLookupComboBox;
    CHtodas: TCheckBox;
    Panel2: TPanel;
    BTejecutar: TBitBtn;
    BTsalir: TBitBtn;
    IBcajas: TIBQuery;
    IBTransaction1: TIBTransaction;
    DScajas: TDataSource;
    CDcajas: TClientDataSet;
    CDcajasid_caja: TIntegerField;
    CDcajassaldo: TCurrencyField;
    PRcajas: TprTxReport;
    procedure FormCreate(Sender: TObject);
    procedure BTejecutarClick(Sender: TObject);
    procedure BTsalirClick(Sender: TObject);
  private

    { Private declarations }
  public
  procedure cheques;
    procedure saldo;
    { Public declarations }
  end;

var
  Frmtesoreria: TFrmtesoreria;

implementation

uses UnitdataQuerys, UnitPrincipal,Unitvistapreliminar,unitglobal,unitdata;

{$R *.dfm}
procedure TFrmtesoreria.cheques;
begin
        FrmQuerys := TFrmQuerys.Create(Self);
        frmVistaPreliminar := TfrmVistaPreliminar.Create(self);
        with CDcheques do
        begin
           Close;
           verificatransaccion(FrmQuerys.IBseleccion);
           SQL.Clear;
           SQL.Add('SELECT DISTINCT');
           SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
           SQL.Add('"gen$agencia".ID_AGENCIA,');
           SQL.Add('"gen$bancos".DESCRIPCION ,');
           SQL.Add('"tes$cheques".NUMERO_CHEQUE,');
           SQL.Add('"tes$cheques".NUMERO_CUENTA,');
           SQL.Add('"tes$cheques".VALOR,');
           SQL.Add('"tes$cheques".FECHA_CONSIGNADO,');
           SQL.Add('"tes$cheques".PLAZA');
           SQL.Add('FROM');
           SQL.Add('"tes$cheques"');
           SQL.Add('LEFT OUTER JOIN "gen$bancos" ON ("tes$cheques".ID_BANCO = "gen$bancos".ID_BANCO)');
           SQL.Add('LEFT OUTER JOIN "gen$agencia" ON ("tes$cheques".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
           SQL.Add('WHERE');
           SQL.Add('("tes$cheques".LIBERADO = 0)');
           SQL.Add('ORDER BY');
           SQL.Add('"tes$cheques".PLAZA');
           Open;
           Last;
           First;
              PRcheques.Variables.ByName['empresa'].AsString := FrMain.Empresa;
              PRcheques.Variables.ByName['hoy'].AsDateTime := Date;
              PRcheques.Variables.ByName['Empleado'].AsString := empleados(FrmQuerys.IBseleccion,UpperCase(FrMain.Dbalias));
              PRcheques.Variables.ByName['Nit'].AsString := FrMain.Nit;
              if prcheques.PrepareReport then
               begin
                 frmVistaPreliminar.Reporte := PRcheques;
                 frmVistaPreliminar.ShowModal;
               end;
           Close;
        end;
end;

procedure TFrmtesoreria.FormCreate(Sender: TObject);
begin
        IBcajas.Open;
        IBcajas.Last;
        DBfecha.DateTime := Date;
        DBfecha.MaxDate := Date;
end;

procedure TFrmtesoreria.saldo;
var    saldo_1,saldo_2,saldo_total :Currency;
begin
        FrmQuerys := TFrmQuerys.Create(self);
        frmVistaPreliminar := TfrmVistaPreliminar.Create(self);
        CDcajas.CancelUpdates;
        with CDcheques do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"caj$cajas".ID_CAJA');
          SQL.Add('FROM');
          SQL.Add('"caj$cajas"');
          if CHtodas.Checked = False then
          begin
            SQL.Add('WHERE');
            SQL.Add('("caj$cajas".ID_CAJA = :caja)');
            ParamByName('caja').AsInteger := DBcaja.KeyValue;
          end;
          SQL.Add('order by "caj$cajas".ID_CAJA');
          Open;
          while not Eof do
          begin
            with FrmQuerys.IBregistro do
            begin
              Close;
              saldo_1 := 0;
              saldo_2 := 0;
              saldo_total := 0;
              verificatransaccion(FrmQuerys.IBregistro);
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"caj$cierres".SALDO_INICIAL_EFECTIVO as efectivo,');
              SQL.Add('"caj$cierres".SALDO_INICIAL_CHEQUE as cheque,');
              SQL.Add('"caj$cierres".SALDO_INICIAL_MONEDA as moneda');
              SQL.Add('FROM');
              SQL.Add('"caj$cierres"');
              SQL.Add('WHERE');
              SQL.Add('("caj$cierres".ID_CAJA = :caja) AND');
              SQL.Add('("caj$cierres".FECHA = :Fecha)');
              ParamByName('caja').AsString := CDcheques.fieldbyname('ID_CAJA').AsString;
              ParamByName('fecha').AsDate := DBfecha.Date;
              Open;
              saldo_1 := FieldByName('efectivo').AsCurrency + FieldByName('cheque').AsCurrency + FieldByName('moneda').AsCurrency;
              // CONSIGNACION
              SQL.Clear;
              SQL.Add('select * from SALDO_MOVIMIENTO(:CAJA,:MOVIMIENTO,:DESDE,:HASTA)');
              ParamByName('CAJA').AsString := CDcheques.fieldbyname('ID_CAJA').AsString;
              ParamByName('MOVIMIENTO').AsString := '1';
              ParamByName('DESDE').AsString := FormatDateTime('yyyy/mm/dd 00:00:00',DBfecha.DateTime);
              ParamByName('HASTA').AsString := FormatDateTime('yyyy/mm/dd 23:59:59',DBfecha.DateTime);
              Open;
              saldo_1 := saldo_1 + FieldByName('SALDO_CHEQUE').AsCurrency + FieldByName('SALDO_MONEDA').AsCurrency + FieldByName('SALDO_BILLETES').AsCurrency;
              // RETIROS
              SQL.Clear;
              SQL.Add('select * from SALDO_MOVIMIENTO(:CAJA,:MOVIMIENTO,:DESDE,:HASTA)');
              ParamByName('CAJA').AsString := CDcheques.fieldbyname('ID_CAJA').AsString;
              ParamByName('MOVIMIENTO').AsString := '2';
              ParamByName('DESDE').AsString := FormatDateTime('yyyy/mm/dd 00:00:00',DBfecha.DateTime);
              ParamByName('HASTA').AsString := FormatDateTime('yyyy/mm/dd 23:59:59',DBfecha.DateTime);
              Open;
              saldo_2 := saldo_2 + FieldByName('SALDO_CHEQUE').AsCurrency + FieldByName('SALDO_MONEDA').AsCurrency + FieldByName('SALDO_BILLETES').AsCurrency;
              //CONSIGNACIONES MOV. COLOCACION
              SQL.Clear;
              SQL.Add('select * from SALDO_MOVICOL(:CAJA,:DESDE,:HASTA)');
              ParamByName('CAJA').AsString := CDcheques.fieldbyname('ID_CAJA').AsString;
              ParamByName('DESDE').AsString := FormatDateTime('yyyy/mm/dd 00:00:00',DBfecha.DateTime);
              ParamByName('HASTA').AsString := FormatDateTime('yyyy/mm/dd 23:59:59',DBfecha.DateTime);
              Open;
              saldo_1 := saldo_1 + FieldByName('SALDO_BILLETES').AsCurrency + FieldByName('SALDO_MONEDAS').AsCurrency;
              Close;
              saldo_total := saldo_1 - saldo_2;
              CDcajas.Append;
              CDcajas.FieldValues['id_caja'] := CDcheques.FieldByName('ID_CAJA').AsInteger;
              CDcajas.FieldValues['saldo'] := saldo_total;
              CDcajas.Post;
              CDcheques.Next;
            end;
          end;
          PRcajas.Variables.ByName['empresa'].AsString := FrMain.Empresa;
          PRcajas.Variables.ByName['hoy'].AsDateTime := Date;
          PRcajas.Variables.ByName['Empleado'].AsString := empleados(FrmQuerys.IBseleccion,UpperCase(FrMain.Dbalias));
          PRcajas.Variables.ByName['Nit'].AsString := FrMain.Nit;
          PRcajas.Variables.ByName['fecha_corte'].AsDateTime:= dbfecha.Date;
          if PRcajas.PrepareReport then
          begin
            frmVistaPreliminar.Reporte := PRcajas;
            frmVistaPreliminar.ShowModal;
          end;
          Close;
        end;
end;

procedure TFrmtesoreria.BTejecutarClick(Sender: TObject);
begin
        saldo;
end;

procedure TFrmtesoreria.BTsalirClick(Sender: TObject);
begin
        Close;
end;

end.
