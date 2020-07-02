unit Unittesoreria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pr_Common, pr_TxClasses, DB, IBCustomDataSet, IBQuery, ComCtrls,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, IBDatabase, DBClient, DateUtils;

type
  TFrmtesoreria = class(TForm)
    CDcheques: TIBQuery;
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
    CDcajassaldo: TCurrencyField;
    IBregistro: TIBQuery;
    PRcajas: TprTxReport;
    CDcajasid_caja: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BTejecutarClick(Sender: TObject);
    procedure BTsalirClick(Sender: TObject);
  private
    procedure saldo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmtesoreria: TFrmtesoreria;

implementation

uses UnitdmGeneral,Unitvistapreliminar,unitglobales;

{$R *.dfm}

procedure TFrmtesoreria.FormCreate(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        IBcajas.Open;
        IBcajas.Last;
        DBfecha.DateTime := Date;
        DBfecha.MaxDate := Date;
end;

procedure TFrmtesoreria.saldo;
var    saldo_1,saldo_2,saldo_total :Currency;
begin
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
            with IBregistro do
            begin
              Close;
              saldo_1 := 0;
              saldo_2 := 0;
              saldo_total := 0;
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
              saldo_1 := FieldByName('efectivo').AsCurrency + FieldByName('moneda').AsCurrency;//+ FieldByName('cheque').AsCurrency;
              // CONSIGNACION
              SQL.Clear;
              SQL.Add('select * from SALDO_MOVIMIENTO(:CAJA,:MOVIMIENTO,:DESDE,:HASTA)');
              ParamByName('CAJA').AsInteger := CDcheques.fieldbyname('ID_CAJA').AsInteger;
              ParamByName('MOVIMIENTO').AsString := '1';
              ParamByName('DESDE').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),00,00,00,000);
              ParamByName('HASTA').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),23,59,59,999);
              //ShowMessage(DateTimeToStr(EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),23,59,59,999)));
              Open;
              saldo_1 := saldo_1 + FieldByName('SALDO_MONEDA').AsCurrency + FieldByName('SALDO_BILLETES').AsCurrency;//+ FieldByName('SALDO_CHEQUE').AsCurrency;
              //consignacion remota
              SQL.Clear;
              SQL.Add('select * from SALDO_MOVREMOTO(:CAJA,:MOVIMIENTO,:DESDE,:HASTA)');
              ParamByName('CAJA').AsInteger := CDcheques.fieldbyname('ID_CAJA').AsInteger;
              ParamByName('MOVIMIENTO').AsString := '1';
              ParamByName('DESDE').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),00,00,00,000);
              ParamByName('HASTA').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),23,59,59,999);
              Open;
              saldo_1 := saldo_1 + FieldByName('SALDO_MONEDA').AsCurrency + FieldByName('SALDO_BILLETES').AsCurrency;//+ FieldByName('SALDO_CHEQUE').AsCurrency;
              // fin consignacion
              // RETIROS
              SQL.Clear;
              SQL.Add('select * from SALDO_MOVIMIENTO(:CAJA,:MOVIMIENTO,:DESDE,:HASTA)');
              ParamByName('CAJA').AsInteger := CDcheques.fieldbyname('ID_CAJA').AsInteger;
              ParamByName('MOVIMIENTO').AsString := '2';
              ParamByName('DESDE').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),00,00,00,000);
              ParamByName('HASTA').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),23,59,59,999);
              Open;
              saldo_2 := saldo_2  + FieldByName('SALDO_MONEDA').AsCurrency + FieldByName('SALDO_BILLETES').AsCurrency; //+ FieldByName('SALDO_CHEQUE').AsCurrency;
              // RETIROS REMOTOS
              SQL.Clear;
              SQL.Add('select * from SALDO_MOVREMOTO(:CAJA,:MOVIMIENTO,:DESDE,:HASTA)');
              ParamByName('CAJA').AsInteger := CDcheques.fieldbyname('ID_CAJA').AsInteger;
              ParamByName('MOVIMIENTO').AsString := '2';
              ParamByName('DESDE').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),00,00,00,000);
              ParamByName('HASTA').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),23,59,59,999);
              Open;
              saldo_2 := saldo_2  + FieldByName('SALDO_MONEDA').AsCurrency + FieldByName('SALDO_BILLETES').AsCurrency; //+ FieldByName('SALDO_CHEQUE').AsCurrency;
              // RETIROS REMOTOS
              //CONSIGNACIONES MOV. COLOCACION
              SQL.Clear;
              SQL.Add('select * from SALDO_MOVICOL(:CAJA,:DESDE,:HASTA)');
              ParamByName('CAJA').AsInteger := CDcheques.fieldbyname('ID_CAJA').AsInteger;
              ParamByName('DESDE').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),00,00,00,000);
              ParamByName('HASTA').AsDateTime := EncodeDateTime(YearOf(DBFecha.DateTime),MonthOf(DBfecha.DateTime),DayOf(DBfecha.DateTime),23,59,59,999);
              Open;
              saldo_1 := saldo_1 + FieldByName('SALDO_BILLETES').AsCurrency + FieldByName('SALDO_MONEDAS').AsCurrency;
              Close;
              saldo_total := saldo_1 - saldo_2;
              try
               CDcajas.Append;
               CDcajas.FieldValues['id_caja'] := CDcheques.FieldByName('ID_CAJA').AsInteger;
               CDcajas.FieldValues['saldo'] := saldo_total;
               CDcajas.Post;
              except
               raise;
              end;
              CDcheques.Next;
            end;
          end;
          PRcajas.Variables.ByName['empresa'].AsString := Empresa;
          PRcajas.Variables.ByName['hoy'].AsDateTime := fFechaActual;
          PRcajas.Variables.ByName['empleado'].AsString := Trim(Apellidos+' '+Nombres);
          PRcajas.Variables.ByName['Nit'].AsString := Nit;
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
