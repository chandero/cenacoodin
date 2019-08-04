unit UnitNivelIngresos;

interface

uses
  Windows, Messages, Math, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, DBClient, FR_Class,
  FR_DSet, FR_DBSet, IBDatabase, Provider, DBCtrls;

type
  TfrmNivelIngresos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    Panel2: TPanel;
    CmdProceso: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBSQL3: TIBSQL;
    Database: TIBDatabase;
    Transaction: TIBTransaction;
    Label5: TLabel;
    LblEstado: TLabel;
    CDProductos: TClientDataSet;
    CmdExceL: TBitBtn;
    CDProductosID_AGENCIA: TIntegerField;
    CDProductosNO1: TIntegerField;
    CDProductosRANGO1: TCurrencyField;
    CDProductosNO2: TIntegerField;
    CDProductosRANGO2: TCurrencyField;
    CDProductosNO3: TIntegerField;
    CDProductosRANGO3: TCurrencyField;
    CDProductosNO4: TIntegerField;
    CDProductosRANGO4: TCurrencyField;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdExceLClick(Sender: TObject);
  private
    procedure Productos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNivelIngresos: TfrmNivelIngresos;
  FechaInicial:TDate;
  Posicion:Integer;
implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso,UnitImpresion,
     UnitMain,ComObj, UnitdmColocacion;

procedure TfrmNivelIngresos.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmNivelIngresos.CmdProcesoClick(Sender: TObject);
var
i : Integer;
begin

for i := 1 to 4 do begin
   Agencia := i;
   DBpath1 := dbpath + FormatCurr('00',Agencia) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('0000',YearOf(EdFechaCorte.Date)) + '/';
   lblEstado.Caption := 'Procesando Agencia' + FormatCurr('00',Agencia);
   Database.DataBaseName := DBserver + ':' + DBpath1 + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
   try
     Database.Connected := True;
   except
     raise;
   end;

   FechaInicial := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
   Productos;

   try
     Database.Connected := False;
   except
     raise;
   end;
end; //fin de for

   lblEstado.Caption := 'Proceso Terminado con Exito';
   CmdExceL.Enabled := True;
end;

procedure TfrmNivelIngresos.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

procedure TfrmNivelIngresos.Productos;
var
Cartera, Saldo : Currency;
Total:Integer;
begin
    frmProgreso := TfrmProgreso.Create(Self);
    if IBQuery1.Transaction.InTransaction then
       IBQuery1.Transaction.Rollback;
    IBquery1.Transaction.StartTransaction;
    frmProgreso.Min := 0;
    frmProgreso.Max := 1;
    frmProgreso.Position := 0;
    frmProgreso.Ejecutar;
    frmProgreso.Min := 0;
    with IBquery1 do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT count("cap$maestrotitular".ID_PERSONA) as TOTAL');
     SQL.Add('FROM "cap$maestro" LEFT JOIN "cap$maestrotitular" ON ( "cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and');
     SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
     SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
     SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA and "cap$maestrotitular".TIPO_TITULAR = 1 )');
     SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
     SQL.Add('WHERE "cap$maestro".ID_TIPO_CAPTACION = 1 and "cap$tiposestado".SE_SUMA = 1 AND FECHA_APERTURA <= :FECHACORTE');
     ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
     try
      Open;
      Total := FieldByName('TOTAL').AsInteger;
      if Total < 1 then
        begin
          MessageDlg('No hay registros para trabajar',mtInformation,[mbok],0);
          Transaction.Rollback;
          Exit;
        end;
     except
      Transaction.Rollback;
      raise;
      Exit;
     end;

     frmProgreso.Max := Total;
     frmProgreso.InfoLabel := 'Buscando Registros';
     Posicion := 0;
     Application.ProcessMessages;
     Close;
    end;

    with IBQuery2 do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT * FROM NIVEL_INGRESOS(:FECHA_CORTE)');
     ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
     try
       Open;
     except
       frmProgreso.Cerrar;
       Transaction.Rollback;
       raise;
       Exit;
     end;
    end;

    while not IBQuery2.Eof do begin
      frmProgreso.InfoLabel := 'Agencia' + IntToStr(Agencia);

      Posicion := Posicion + 1;
      frmProgreso.Position := Posicion;
      Application.ProcessMessages;

      CDProductos.Append;
      CDProductos.FieldValues['ID_AGENCIA'] := Agencia;
      CDProductos.FieldValues['NO1'] := IBQuery2.FieldByName('NO1').AsString;
      CDProductos.FieldValues['RANGO1'] := IBQuery2.FieldByName('RANGO1').AsString;
      CDProductos.FieldValues['NO2'] := IBQuery2.FieldByName('NO2').AsString;
      CDProductos.FieldValues['RANGO2'] := IBQuery2.FieldByName('RANGO2').AsString;
      CDProductos.FieldValues['NO3'] := IBQuery2.FieldByName('NO3').AsString;
      CDProductos.FieldValues['RANGO3'] := IBQuery2.FieldByName('RANGO3').AsString;
      CDProductos.FieldValues['NO4'] := IBQuery2.FieldByName('NO4').AsString;
      CDProductos.FieldValues['RANGO4'] := IBQuery2.FieldByName('RANGO4').AsString;
      CDProductos.Post;

     IBQuery2.Next;
    end; //FIN WHILE

    IBQuery2.Close;
    frmProgreso.Cerrar;
end;

procedure TfrmNivelIngresos.CmdExceLClick(Sender: TObject);
var   G :Integer;
      Excel, WorkBook, WorkSheet: Variant;
      DesAgencia :string;
      Format: OleVariant;
const
       xlWBATWorksheet = -4167;

begin
       Excel := CreateOleObject('Excel.Application');
       Excel.DisplayAlerts := False;
       Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
       WorkSheet := WorkBook.WorkSheets[1];
       WorkSheet.Name := 'Nivel de Ingresos';
       G := 0;

       WorkSheet.Cells[1,1].ColumnWidth := 4;
       WorkSheet.Cells[1,2].ColumnWidth := 5;
       WorkSheet.cells[1,3].ColumnWidth := 12;
       WorkSheet.Cells[1,4].ColumnWidth := 5;
       WorkSheet.Cells[1,5].ColumnWidth := 12;
       WorkSheet.Cells[1,6].ColumnWidth := 5;
       WorkSheet.Cells[1,7].ColumnWidth := 12;
       WorkSheet.Cells[1,8].ColumnWidth := 5;
       WorkSheet.Cells[1,9].ColumnWidth := 12;

       WorkSheet.Cells[1,1] := 'AGENCIA';
       WorkSheet.Cells[1,2] := 'NO1';
       WorkSheet.Cells[1,3] := 'RANGO1';
       WorkSheet.Cells[1,4] := 'NO2';
       WorkSheet.Cells[1,5] := 'RANGO2';
       WorkSheet.Cells[1,6] := 'NO3';
       WorkSheet.Cells[1,7] := 'RANGO3';
       WorkSheet.Cells[1,8] := 'N04';
       WorkSheet.Cells[1,9] := 'RANGO4';

//          WorkSheet.range['A3:E3'].Font.FontStyle := 'Bold';
          CDProductos.Last;
          CDProductos.First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Caption := 'Generando Nivel Ingresos';
          frmProgreso.Max := CDProductos.RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not CDProductos.Eof do
          begin
           frmProgreso.InfoLabel := 'Registro No ' + IntToStr(CDProductos.RecNo);
           frmProgreso.Position := CDProductos.RecNo;
           Application.ProcessMessages;
           for G := 1 to 9 do
             WorkSheet.Cells[cdproductos.RecNo + 1, G] := CDProductos.Fields.Fields[G - 1].AsString;
           CDProductos.Next;
          end;
          frmProgreso.Cerrar;

          WorkBook.SaveAs('c:\NivelI' + IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('00',DayOf(EdFechaCorte.Date)) + '.xls');
          Excel.WorkBooks.Open('c:\NivelI' + IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('00',DayOf(EdFechaCorte.Date)) + '.xls');
          Excel.visible:=True;
          CDProductos.Close;
end;


end.
