unit UnitResumenProductos;

interface

uses
  Windows, Messages, Math, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, DBClient, FR_Class,
  FR_DSet, FR_DBSet, IBDatabase, Provider, DBCtrls;

type
  TfrmResumenProductos = class(TForm)
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
    CDDatos: TClientDataSet;
    DataP: TDataSetProvider;
    CDProductos: TClientDataSet;
    CDProductosID_PERSONA: TStringField;
    CDProductosAPORTES: TCurrencyField;
    CDProductosAHORROS: TCurrencyField;
    CDProductosJUVENIL: TCurrencyField;
    CDProductosCONTRACTUAL: TCurrencyField;
    CDProductosCDAT: TCurrencyField;
    CDProductosCARTERA: TCurrencyField;
    CmdExceL: TBitBtn;
    CDProductosID_AGENCIA: TIntegerField;
    DPSaldos: TDataSetProvider;
    CDSaldos: TClientDataSet;
    IBSaldos: TIBQuery;
    IBCartera: TIBQuery;
    DPCartera: TDataSetProvider;
    CDCartera: TClientDataSet;
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
  frmResumenProductos: TfrmResumenProductos;
  FechaInicial:TDate;
  Posicion:Integer;
implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso,UnitImpresion,
     UnitMain,ComObj, UnitdmColocacion;

procedure TfrmResumenProductos.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmResumenProductos.CmdProcesoClick(Sender: TObject);
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

procedure TfrmResumenProductos.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

procedure TfrmResumenProductos.Productos;
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
     SQL.Add('FROM');
     SQL.Add('"cap$maestro"');
     SQL.Add('LEFT JOIN "cap$maestrotitular" ON ( "cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and');
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
     frmProgreso.InfoLabel := 'Buscando Asociados para Trabajar';
     Posicion := 0;
     Application.ProcessMessages;
     Close;
    end;

//    CDProductos.Open;
    with IBSaldos do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT ID_IDENTIFICACION,ID_PERSONA, TIPO, SUM(SALDO) AS SALDO FROM SALDOSPORPERSONA(:ANO,:FECHA1,:FECHA2)');
     SQL.Add('GROUP BY ID_IDENTIFICACION, ID_PERSONA, TIPO');
     ParamByName('ANO').AsString  := IntToStr(YearOf(EdFechaCorte.Date));
     ParamByName('FECHA1').AsDate := FechaInicial;
     ParamByName('FECHA2').AsDate := EdFechaCorte.Date;
     try
       Open;
     except
       frmProgreso.Cerrar;
       Transaction.Rollback;
       raise;
       Exit;
     end;
    end;
    DPSaldos.DataSet := IBSaldos;
    CDSaldos.ProviderName := 'DPSaldos';
    CDSaldos.Open;

    with IBCartera do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT ID_IDENTIFICACION,ID_PERSONA,SUM(VALOR_DESEMBOLSO - ABONOS_CAPITAL) AS SALDO from "col$colocacion"');
     SQL.Add('WHERE ID_ESTADO_COLOCACION IN (0,2)');
     SQL.Add('GROUP BY ID_IDENTIFICACION, ID_PERSONA');
     SQL.Add('HAVING SUM(VALOR_DESEMBOLSO - ABONOS_CAPITAL) > 0');
     try
       Open;
     except
       frmProgreso.Cerrar;
       Transaction.Rollback;
       raise;
       Exit;
     end;
    end;
    DPCartera.DataSet := IBCartera;
    CDCartera.ProviderName := 'DPCartera';
    CDCartera.Open;

    with IBQuery2 do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT ');
     SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
     SQL.Add('"cap$maestrotitular".ID_PERSONA');
     SQL.Add('FROM');
     SQL.Add('"cap$maestro"');
     SQL.Add('LEFT JOIN "cap$maestrotitular" ON ( "cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and');
     SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
     SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
     SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA and "cap$maestrotitular".TIPO_TITULAR = 1 )');
     SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
     SQL.Add('WHERE');
     SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = 1 and "cap$tiposestado".SE_SUMA = 1 AND FECHA_APERTURA <= :FECHACORTE');
     SQL.Add('ORDER BY "cap$maestrotitular".ID_PERSONA');
     ParamByName('FECHACORTE').AsDate := EdFechaCorte.Date;
     try
       Open;
     except
       frmProgreso.Cerrar;
       Transaction.Rollback;
       raise;
       Exit;
     end;
    end;
    DataP.DataSet := IBQuery2;
    CDDatos.ProviderName := 'DataP';
    CDDatos.Open;
    CDDatos.Last;
    CDDatos.First;
    while not CDDatos.Eof do begin
      frmProgreso.InfoLabel := 'Analizando Asociado ' + CDDatos.FieldByName('ID_PERSONA').AsString;

      Posicion := Posicion + 1;
      frmProgreso.Position := Posicion;
      Application.ProcessMessages;

      CDProductos.Append;
      CDProductos.FieldValues['ID_AGENCIA'] := Agencia;
      CDProductos.FieldValues['ID_PERSONA'] := CDDatos.FieldByName('ID_PERSONA').AsString;

      CDCartera.Filtered := False;
      CDCartera.Filter := 'id_persona = ' + '''' + CDDatos.FieldByName('ID_PERSONA').AsString + '''' + ' and id_identificacion = ' + IntToStr(CDDatos.FieldByName('ID_IDENTIFICACION').AsInteger);
      CDCartera.Filtered := True;
      if CDCartera.FieldByName('SALDO').AsCurrency > 0 then
        Cartera := CDCartera.FieldByName('SALDO').AsCurrency
      else
        Cartera := 0;



      CDSaldos.Filtered := False;
      CDSaldos.Filter := 'ID_PERSONA = ' + '''' + CDDatos.FieldByName('ID_PERSONA').AsString + '''' + ' and id_identificacion = ' + IntToStr(CDDatos.FieldByName('ID_IDENTIFICACION').AsInteger) + 'and TIPO = 1';
      CDSaldos.Filtered := True;
      CDProductos.FieldValues['APORTES'] := CDSaldos.FieldByName('SALDO').AsCurrency;

      CDSaldos.Filtered := False;
      CDSaldos.Filter := 'ID_PERSONA = ' + '''' + CDDatos.FieldByName('ID_PERSONA').AsString + '''' + ' and id_identificacion = ' + IntToStr(CDDatos.FieldByName('ID_IDENTIFICACION').AsInteger) + 'and TIPO = 2';
      CDSaldos.Filtered := True;
      CDProductos.FieldValues['AHORROS'] := CDSaldos.FieldByName('SALDO').AsCurrency;

      CDSaldos.Filtered := False;
      CDSaldos.Filter := 'ID_PERSONA = ' + '''' + CDDatos.FieldByName('ID_PERSONA').AsString + '''' + ' and id_identificacion = ' + IntToStr(CDDatos.FieldByName('ID_IDENTIFICACION').AsInteger) + 'and TIPO = 4';
      CDSaldos.Filtered := True;
      CDProductos.FieldValues['JUVENIL'] := CDSaldos.FieldByName('SALDO').AsCurrency;

      CDSaldos.Filtered := False;
      CDSaldos.Filter := 'ID_PERSONA = ' + '''' + CDDatos.FieldByName('ID_PERSONA').AsString + '''' + ' and id_identificacion = ' + IntToStr(CDDatos.FieldByName('ID_IDENTIFICACION').AsInteger) + 'and TIPO = 5';
      CDSaldos.Filtered := True;
      CDProductos.FieldValues['CONTRACTUAL'] := CDSaldos.FieldByName('SALDO').AsCurrency;

      CDSaldos.Filtered := False;
      CDSaldos.Filter := 'ID_PERSONA = ' + '''' + CDDatos.FieldByName('ID_PERSONA').AsString + '''' + ' and id_identificacion = ' + IntToStr(CDDatos.FieldByName('ID_IDENTIFICACION').AsInteger) + 'and TIPO = 6';
      CDSaldos.Filtered := True;
      CDProductos.FieldValues['CDAT'] := CDSaldos.FieldByName('SALDO').AsCurrency;

      if Cartera > 0 then
        CDProductos.FieldValues['CARTERA'] := Cartera;
      CDProductos.Post;

     CDDatos.Next;
    end; //FIN WHILE ASOCIADOS

    IBSQL3.Close;
    IBSQL3.Transaction.Rollback;
    CDSaldos.Close;
    CDCartera.Close;
    CDDatos.Close;

    frmProgreso.Cerrar;
end;

procedure TfrmResumenProductos.CmdExceLClick(Sender: TObject);
var   G :Integer;
      Excel, WorkBook, WorkSheet: Variant;
      DesAgencia :string;
      Format: OleVariant;
const
       xlWBATWorksheet = -4167;

begin
       Excel := CreateOleObject('Excel.Application');
       Excel.DisplayAlerts := false;
       Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
       WorkSheet := WorkBook.WorkSheets[1];
       WorkSheet.Name := 'Productos' + IntToStr(Agencia);
       G := 0;

       WorkSheet.Cells[1,1].ColumnWidth := 4;
       WorkSheet.Cells[1,2].ColumnWidth := 12;
       WorkSheet.cells[1,3].ColumnWidth := 8;
       WorkSheet.Cells[1,4].ColumnWidth := 8;
       WorkSheet.Cells[1,5].ColumnWidth := 8;
       WorkSheet.Cells[1,6].ColumnWidth := 8;
       WorkSheet.Cells[1,7].ColumnWidth := 8;
       WorkSheet.Cells[1,8].ColumnWidth := 8;

       WorkSheet.Cells[1,1] := 'AGENCIA';
       WorkSheet.Cells[1,2] := 'NIT';
       WorkSheet.Cells[1,3] := 'APORTES';
       WorkSheet.Cells[1,4] := 'AHORROS';
       WorkSheet.Cells[1,5] := 'JUVENIL';
       WorkSheet.Cells[1,6] := 'CONTRACTUAL';
       WorkSheet.Cells[1,7] := 'CDAT';
       WorkSheet.Cells[1,8] := 'CARTERA';

//          WorkSheet.range['A3:E3'].Font.FontStyle := 'Bold';
          CDProductos.Last;
          CDProductos.First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Caption := 'Generando Productos';
          frmProgreso.Max := CDProductos.RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not CDProductos.Eof do
          begin
           frmProgreso.InfoLabel := 'Registro No ' + IntToStr(CDProductos.RecNo);
           frmProgreso.Position := CDProductos.RecNo;
           Application.ProcessMessages;
           for G := 1 to 8 do
             WorkSheet.Cells[cdproductos.RecNo + 1, G] := CDProductos.Fields.Fields[G - 1].AsString;
           CDProductos.Next;
          end;
          frmProgreso.Cerrar;

          WorkBook.SaveAs('c:\PlanosFinMes\Productos' + IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('00',DayOf(EdFechaCorte.Date)) + '.xls');
          Excel.WorkBooks.Open('c:\PlanosFinMes\Productos' + IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('00',DayOf(EdFechaCorte.Date)) + '.xls');
          Excel.visible:=True;
          CDProductos.Close;
end;


end.
