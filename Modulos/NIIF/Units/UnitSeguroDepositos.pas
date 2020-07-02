unit UnitSeguroDepositos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, JvLabel, JvPanel, JvEdit,
  JvTypedEdit, DB, IBCustomDataSet, IBQuery,sdXmlDocuments, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, DateUtils, DBClient, FR_DSet, FR_DBSet,
  FR_Class, IBDatabase,Math, Grids, DBGrids, FR_Chart;

type
  TfrmSeguroDepositos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    BTimportar: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    JvPanel1: TJvPanel;
    BTGrafico: TBitBtn;
    IBQuery1: TIBQuery;
    frReport3: TfrReport;
    lblEstado: TStaticText;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBQuery3: TIBQuery;
    frDBDataSet1: TfrDBDataSet;
    CDTotales: TClientDataSet;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    CDTotalesAG: TIntegerField;
    CDTotalesDESCRIPCION: TStringField;
    CDTotalesMENORES2: TCurrencyField;
    CDTotalesMAYORES69: TCurrencyField;
    CDTotalesMAXSEGURO: TCurrencyField;
    CDTotalesPERSONASJ: TCurrencyField;
    CDTotalesHABILES: TCurrencyField;
    CDTotalesDEPOSITOS: TCurrencyField;
    frChartObject1: TfrChartObject;
    CDTotalesANO: TIntegerField;
    CDTotalesMES: TIntegerField;
    CDTotalesCSC: TIntegerField;
    procedure BTGraficoClick(Sender: TObject);
    procedure BTimportarClick(Sender: TObject);
    procedure frReport3GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DAgencia :string;
    descripcion: string;
    procedure Inicializar;

    { Private declarations }
  public
  published
    procedure Imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  frmSeguroDepositos: TfrmSeguroDepositos;

implementation

uses UnitGlobales, unitMain,UnitImpresion;

{$R *.dfm}

procedure TfrmSeguroDepositos.BTGraficoClick(Sender: TObject);
var Consec : Integer;
begin
        Empleado;
        CDTotales.EmptyDataSet;

        if IBQuery3.Transaction.InTransaction THEN
          IBQuery3.Transaction.Rollback;
        IBQuery3.Transaction.StartTransaction;

        IBQuery3.Close;
        IBQuery3.SQL.Clear;
        IBQuery3.SQL.Add('select max(CONSECUTIVO) AS CONSECUTIVO from "cap$polizadepositos"');
        IBQuery3.Open;
        Consec := IBQuery3.FieldByName('CONSECUTIVO').AsInteger - 3;
        IBQuery3.Close;

        IBQuery3.SQL.Clear;
        IBQuery3.SQL.Add('select * from "cap$polizadepositos" where CONSECUTIVO > :CONSEC ORDER BY CONSECUTIVO');
        IBQuery3.ParamByName('CONSEC').AsInteger := Consec;
        IBQuery3.Open;

        while not IBQuery3.Eof do
        begin
         CDTotales.Append;
         CDTotales.FieldByName('AG').AsInteger := IBQuery3.FieldByName('ID_AGENCIA').AsInteger;
         CDTotales.FieldByName('DESCRIPCION').AsString := IBQuery3.FieldByName('AGENCIA').AsString;
         CDTotales.FieldByName('DEPOSITOS').AsCurrency := IBQuery3.FieldByName('DEPOSITOS').AsCurrency;
         CDTotales.FieldByName('MENORES2').AsCurrency := IBQuery3.FieldByName('MENORES2').AsCurrency;
         CDTotales.FieldByName('MAYORES69').AsCurrency := IBQuery3.FieldByName('MAYORES69').AsCurrency;
         CDTotales.FieldByName('MAXSEGURO').AsCurrency := IBQuery3.FieldByName('MAXSEGURO').AsCurrency;
         CDTotales.FieldByName('PERSONASJ').AsCurrency := IBQuery3.FieldByName('PJURIDICAS').AsCurrency;
         CDTotales.FieldByName('HABILES').AsCurrency := IBQuery3.FieldByName('ASEGURABLE').AsCurrency;
         CDTotales.FieldByName('ANO').AsInteger := IBQuery3.FieldByName('ANO').AsInteger;
         CDTotales.FieldByName('MES').AsInteger := IBQuery3.FieldByName('MES').AsInteger;
         CDTotales.FieldByName('CSC').AsInteger := IBQuery3.FieldByName('CONSECUTIVO').AsInteger;
         CDTotales.Post;
         IBQuery3.Next;
        end;
        imprimir_reporte(frmMain.wpath + 'reporte\RepPolizaDepositos.frf');
end;

procedure TfrmSeguroDepositos.BTimportarClick(Sender: TObject);
var
    FechaPoliza:TDate;
    Database:TIBDatabase;
    Transaction:TIBTransaction;
    RutaInicial:string;
    Consecutivo : Integer;
begin
Database := TIBDatabase.Create(nil);
Transaction := TIBTransaction.Create(nil);
Database.DefaultTransaction := Transaction;
RutaInicial := DBpath1;

 if IBQuery3.Transaction.InTransaction then
   IBQuery3.Transaction.Rollback;
 IBQuery3.Transaction.StartTransaction;
 IBQuery3.Close;
 IBQuery3.SQL.Clear;
 IBQuery3.SQL.Add('select * from "cap$polizadepositos" where ANO = :ANO AND MES = :MES');
 IBQuery3.ParamByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
 IBQuery3.ParamByName('MES').AsInteger := MonthOf(EdFechaCorte.Date);
 IBQuery3.Open;
 if IBQuery3.RecordCount > 0 then
 begin
   MessageDlg('El Reporte para esta Fecha ya fue Procesado, Genere el Reporte',mtError,[mbcancel],0);
   BTGrafico.Enabled := True;
   Exit;
 end;
 IBQuery3.Close;


 IBQuery3.SQL.Clear;
 IBQuery3.SQL.Add('select * from "gen$agencia" where id_agencia > 0');
 IBQuery3.Open;

 while not IBQuery3.Eof do
 begin
   DBpath1 := RutaInicial + FormatCurr('00',IBQuery3.FieldByName('ID_AGENCIA').AsInteger) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('0000',YearOf(EdFechaCorte.Date)) + '/';
   lblEstado.Caption := 'Procesando ' + IBQuery3.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';
   Database.DataBaseName := DBserver1 + ':' + DBpath1 + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.LoginPrompt := False;
   try
     Database.Open;
   except
     raise;
   end;

   IBQuery1.Transaction := Transaction;
   if IBQuery1.Transaction.InTransaction then
      IBQuery1.Transaction.Rollback;
   IBQuery1.Transaction.StartTransaction;

   with IBQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT VALOR_MINIMO FROM "gen$minimos" WHERE ID_MINIMO = 43');
      Open;
      FechaPoliza := FieldByName('VALOR_MINIMO').AsInteger;
      Close;

      SQL.Clear;
      SQL.Add('DELETE from "cap$saldosdepositos"');
      ExecSQL;
      Close;
      Transaction.Commit;
      Transaction.StartTransaction;
    end;

   Application.ProcessMessages;

   with IBquery1 do begin
    Close;
    SQL.Clear;
    SQL.Add('EXECUTE PROCEDURE SALDOS_CUENTAS_SEGVIDA(:ANO,:FECHA1,:FECHA2)');
    ParamByName('ANO').AsString := IntToStr(YearOf(EdFechaCorte.Date));
    ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
    ParamByName('FECHA2').AsDate := EdFechaCorte.Date;
    try
      ExecSQL;
      Transaction.Commit;
    except
      MessageDlg('Error Aplicando Procedimiento Saldos Cuentas Seguro',mtInformation,[mbok],0);
      Transaction.Rollback;
      Exit;
    end;

//    Transaction.StartTransaction;
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM DATOSPOLIZA(:ANO,:FECHACORTE,:FECHAPOLIZA)');
    ParamByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
    ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
    ParamByName('FECHAPOLIZA').AsDate := FechaPoliza;
    try
      Open;
    except
      Transaction.Rollback;
      raise;
      Exit;
    end;

    CDTotales.Append;
    CDTotales.FieldByName('AG').AsInteger := IBQuery3.FieldByName('ID_AGENCIA').AsInteger;
    CDTotales.FieldByName('DESCRIPCION').AsString := IBQuery3.FieldByName('DESCRIPCION_AGENCIA').AsString;
    CDTotales.FieldByName('MENORES2').AsCurrency := IBQuery1.FieldByName('MENORES2').AsCurrency;
    CDTotales.FieldByName('MAYORES69').AsCurrency := IBQuery1.FieldByName('MAYORES69').AsCurrency;
    CDTotales.FieldByName('MAXSEGURO').AsCurrency := IBQuery1.FieldByName('MAXSEGURO').AsCurrency;
    CDTotales.FieldByName('PERSONASJ').AsCurrency := IBQuery1.FieldByName('PERSONASJ').AsCurrency;
    CDTotales.FieldByName('HABILES').AsCurrency := IBQuery1.FieldByName('HABILES').AsCurrency;
    CDTotales.FieldByName('DEPOSITOS').AsCurrency := IBQuery1.FieldByName('DEPOSITOS').AsCurrency;
    CDTotales.FieldByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
    CDTotales.FieldByName('MES').AsInteger := MonthOf(EdFechaCorte.Date);
    CDTotales.Post;

   end; // with
   Database.Close;
   IBQuery3.Next;
 end; // Fin de While

 CDTotales.First;
 IBQuery3.Close;
 IBQuery3.SQL.Clear;
 IBQuery3.SQL.Add('select max(CONSECUTIVO) AS CONSECUTIVO from "cap$polizadepositos"');
 IBQuery3.Open;
 Consecutivo := IBQuery3.FieldByName('CONSECUTIVO').AsInteger + 1;

 IBQuery3.Close;
 IBQuery3.SQL.Clear;
 IBQuery3.SQL.Add('insert into "cap$polizadepositos" values(:CONSECUTIVO,:ID_AGENCIA,:AGENCIA,:DEPOSITOS,:MENORES2,:MAYORES69,:MAXSEGURO,:PJURIDICAS,:ASEGURABLE,:ANO,:MES)');
 while not CDTotales.Eof do
  begin
   IBQuery3.ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
   IBQuery3.ParamByName('ID_AGENCIA').AsInteger := CDTotales.FieldValues['AG'];
   IBQuery3.ParamByName('AGENCIA').AsString := CDTotales.FieldValues['DESCRIPCION'];
   IBQuery3.ParamByName('DEPOSITOS').AsCurrency := CDTotales.FieldValues['DEPOSITOS'];
   IBQuery3.ParamByName('MENORES2').AsCurrency := CDTotales.FieldValues['MENORES2'];
   IBQuery3.ParamByName('MAYORES69').AsCurrency := CDTotales.FieldValues['MAYORES69'];
   IBQuery3.ParamByName('MAXSEGURO').AsCurrency := CDTotales.FieldValues['MAXSEGURO'];
   IBQuery3.ParamByName('PJURIDICAS').AsCurrency := CDTotales.FieldValues['PERSONASJ'];
   IBQuery3.ParamByName('ASEGURABLE').AsCurrency := CDTotales.FieldValues['HABILES'];
   IBQuery3.ParamByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
   IBQuery3.ParamByName('MES').AsInteger := MonthOf(EdFechaCorte.Date);
   IBQuery3.ExecSQL;
   CDTotales.Next;
  end; // Fin de while CDTotales
 IBQuery3.Transaction.Commit;

 lblEstado.Caption := 'Proceso Terminado con Exito!';
 BTGrafico.Enabled := True;
 RutaInicial := '';
end;


procedure TfrmSeguroDepositos.frReport3GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'fecha' then
          ParValue := EdFechaCorte.Date;
        if ParName = 'empleado' then
          ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'prima' then
          ParValue := 0.36;
end;

procedure TfrmSeguroDepositos.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmSeguroDepositos.Inicializar;
begin
        EdFechaCorte.Date := fFechaActual;
        EdFechaCorte.Date := EncodeDate(YearOf(EdFechaCorte.Date),(MonthOf(EdFechaCorte.Date) - 1),DaysInAMonth(YearOf(EdFechaCorte.Date),(MonthOf(EdFechaCorte.Date) - 1)));
end;

procedure TfrmSeguroDepositos.Imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport3.LoadFromFile(cadena);
        frReport3.ModifyPrepared := False;
        frReport3.Preview := FrmImpresion.frPreview1;
        frReport3.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TfrmSeguroDepositos.FormShow(Sender: TObject);
begin
        Inicializar;
end;

end.
