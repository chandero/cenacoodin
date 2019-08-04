unit UnitReporteBalance;

interface

uses
  Windows, Messages, Math, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, IBDatabase;

type
  TfrmReporteBalance = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    Panel2: TPanel;
    CmdProceso: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    SaveDialog1: TSaveDialog;
    IBSQL1: TIBSQL;
    Database: TIBDatabase;
    Transaction: TIBTransaction;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type PBalance=^ABalance;
     ABalance=Record
      Codigo:String;
      Nombre:string;
      Saldo:Currency;
end;


var
  frmReporteBalance: TfrmReporteBalance;
  F:TextFile;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol;

procedure TfrmReporteBalance.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteBalance.CmdProcesoClick(Sender: TObject);
var AR:PBalance;
    Cadena:string;
    Archivo:TextFile;    
begin
   Database.DataBaseName := DBserver + ':' + DBpath + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
   try
     Database.Connected := True;
   except
     raise;
   end;

    Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
    AssignFile(Archivo,'C:/PlanosFinMes/BALANCE' + Cadena + '.TXT');
//    AssignFile(Archivo,'C:/PlanosFinMes/Captaciones' + Cadena);
    Rewrite(Archivo);
    Cadena := 'CODIGO' + #9 + 'NOMBRE' + #9 + 'SALDO';
    Writeln(Archivo,Cadena);
    CloseFile(Archivo);

    if IBSQL1.Transaction.InTransaction then
       IBSQL1.Transaction.Rollback;
    IBSQL1.Transaction.StartTransaction;
    with IBSQL1 do begin
     Close;
     SQL.Clear;
     SQL.Add('select * from BALANCE_GENERAL_CONSOLIDADO(:MES,6)');
     ParamByName('MES').AsInteger := monthof(EdFechaCorte.Date);
     try
      ExecQuery;
     except
      Transaction.Rollback;
      raise;
      Exit;
     end;

     while not Eof do begin
       New(AR);
       AR^.Codigo := LeftStr(FieldByName('CODIGO').AsString,10);
       AR^.Nombre := FieldByName('NOMBRE').AsString;
       AR^.Saldo := FieldByName('SALDO').AsCurrency;

       Cadena := AR^.Codigo + #9 + AR^.Nombre + #9 + CurrToStr(AR^.Saldo);
       Dispose(AR);
       Append(Archivo);
       Writeln(archivo,cadena);
       CloseFile(archivo);
       Next;
     end; // while
   end; // with
   MessageDlg('Proceso Terminado con Exito!',mtInformation,[mbok],0);
   Database.Close;
end;

procedure TfrmReporteBalance.BitBtn1Click(Sender: TObject);
var Archivo:string;

begin
        SaveDialog1.DefaultExt := 'TXT';
        SaveDialog1.InitialDir := 'C:\Planos';
        SaveDialog1.Title := 'Guardar Como:';
        SaveDialog1.Execute;
        Archivo := SaveDialog1.FileName;
        AssignFile(F,Archivo);
end;

procedure TfrmReporteBalance.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

end.
