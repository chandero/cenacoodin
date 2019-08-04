unit UnitSaldosIniciales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, IBSQL,
  IBDatabase, ComCtrls, JvProgressBar;

type
  TfrmSaldosIniciales = class(TForm)
    BtnAceptar: TBitBtn;
    IBQuery1: TIBQuery;
    IBSQL1: TIBSQL;
    IBBase2: TIBSQL;
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    IBconsalod: TIBSQL;
    IBSQL2: TIBSQL;
    Barra: TJvProgressBar;
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaldosIniciales: TfrmSaldosIniciales;
  Alias,Clave :string;
  
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmSaldosIniciales.BtnAceptarClick(Sender: TObject);
var
codigo:string;
saldoinicial, movimiento : Currency;
saldo:Currency;
begin
BtnAceptar.Enabled := False;
saldoinicial := 0;
saldo := 0;
  with IBSQL2 do begin
    if Transaction.InTransaction then
      Transaction.Rollback;
    Transaction.StartTransaction;
    Close;
    SQL.Clear;
    SQL.Add('delete from CON$SALDOSINICIALES');
    ExecQuery;
    Close;
    Transaction.Commit;
  end;

  with IBQuery1 do begin
   Close;
   sql.Clear;
   sql.Add('select ');
   sql.Add('CON$PUC.CODIGO,');
   sql.Add('CON$PUC.ID_AGENCIA,');
   sql.Add('CON$PUC.SALDOINICIAL');
   sql.Add('from CON$PUC');
   SQL.Add('WHERE CON$PUC.ID_AGENCIA = :AGENCIA');
   SQL.Add('order by CON$PUC.CODIGO');
   ParamByName('AGENCIA').AsInteger := Agencia;
   open;
   Last;
   First;
   Barra.Min := 0;
   Barra.Max := IBQuery1.RecordCount;
   Barra.Position := 0;
      while not Eof do
       begin
          Barra.Position := IBQuery1.RecNo;
          Application.ProcessMessages;
         codigo := fieldbyname('CODIGO').AsString;
         saldoinicial := FieldByName('SALDOINICIAL').AsCurrency;
         IBSQL1.Close;
         IBSQL1.ParamByName('CODIGO').AsString := codigo;
         IBSQL1.ParamByName('AGENCIA').AsInteger := Agencia;
         IBSQL1.ExecQuery;
         movimiento := IBSQL1.FieldByName('MOVIMIENTO').AsCurrency;
         IBSQL1.Close;
         saldo := saldoinicial + movimiento;
         if IBBase2.Transaction.InTransaction then
           IBBase2.Transaction.Commit;
         IBBase2.Transaction.StartTransaction;
         IBBase2.ParamByName('AGENCIA').AsInteger := Agencia;
         IBBase2.ParamByName('CODIGO').AsString := codigo;
         IBBase2.ParamByName('SALDOINICIAL').AsCurrency := saldo;
         IBBase2.ExecQuery;
         IBBase2.Close;
         IBconsalod.Close;
         IBconsalod.ParamByName('AGENCIA').AsInteger := Agencia;
         IBconsalod.ParamByName('CODIGO').AsString := codigo;
         IBconsalod.ParamByName('SALDOINICIAL').AsCurrency := saldo;
         IBconsalod.ExecQuery;
         IBconsalod.Close;
         IBBase2.Transaction.Commit;
         IBBase2.Transaction.StartTransaction;
         saldo := 0;
         Next;
       end;
   MessageDlg('Proceso Terminado con Exito',mtInformation,[mbok],0);
  end;



end;

procedure TfrmSaldosIniciales.FormCreate(Sender: TObject);
begin
        Alias := DBAlias;
        Clave := DBPasabordo;
        DBAlias := 'SYSDBA';
        DBPasabordo:= 'masterkey';
        IBDatabase1.DatabaseName := BaseAnoAnt;
        IBDatabase1.Params.Values['User_Name'] := DBAlias;
        IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
        IBDatabase1.Connected := True;
        IBTransaction1.Active := True;
        IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
end;

end.
