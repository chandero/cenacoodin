unit UnitSaldosIniciales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, DateUtils, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, IBSQL,
  IBDatabase, ComCtrls, JvProgressBar, UnitDmGeneral;

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
  dmGeneral: TdmGeneral;
  Alias,Clave :string;
  
implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmSaldosIniciales.BtnAceptarClick(Sender: TObject);
var
Longitud:Integer;
codigo:string;
saldoinicial, movimiento : Currency;
saldo:Currency;
FechaInicialParaSaldoInicial, FechaFinalParaSaldoInicial:TDate;
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
    SQL.Add('DELETE from CON$SALDOSINICIALES');
    ExecQuery;
    Close;
    Transaction.Commit;
  end;

  FechaInicialParaSaldoInicial := EncodeDate(DBAnho-1, 01, 01);
  FechaFinalParaSaldoInicial := EncodeDate(DBAnho-1,12,31);


  with IBSQL1 do
  begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT SUM(a.DEBITO - a.CREDITO) AS MOVIMIENTO FROM CON$COMPROBANTE c');
          SQL.Add('INNER JOIN CON$AUXILIAR a ON a.TIPO_COMPROBANTE = c.TIPO_COMPROBANTE and a.ID_COMPROBANTE = c.ID_COMPROBANTE');
          SQL.Add('WHERE a.FECHA BETWEEN :FECHA_INI and :FECHA_FIN and a.CODIGO LIKE :CODIGO');
          SQL.Add(' and c.ESTADO <> :ESTADO and c.ID_AGENCIA = :AGENCIA');
          ParamByName('ESTADO').AsString := 'N';
          ParamByName('FECHA_INI').AsDate := FechaInicialParaSaldoInicial;
          ParamByName('FECHA_FIN').AsDate := FechaFinalParaSaldoInicial;
  end;

  with IBQuery1 do begin
   Close;
   sql.Clear;
   sql.Add('select ');
   sql.Add('p.CODIGO,');
   sql.Add('p.NIVEL,');
   sql.Add('p.ID_AGENCIA,');
   sql.Add('p.SALDOINICIAL');
   sql.Add('from CON$PUC p');
   SQL.Add('WHERE p.ID_AGENCIA = :AGENCIA');
   SQL.Add('order by p.CODIGO ASC');
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
          Longitud := 0;

            case (FieldByName('NIVEL').AsInteger) of
                  1: Longitud := 1;
                  2: Longitud := 2;
                  3: Longitud := 4;
                  4: Longitud := 6;
                  5: Longitud := 8;
                  6: Longitud := 10;
                  7: Longitud := 12;
                  8: Longitud := 14;
                  9: Longitud := 16;
                  10: Longitud := 18;
            end;

         Codigo := LeftStr(FieldByName('CODIGO').AsString, Longitud) + '%';

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
         IBBase2.ParamByName('CODIGO').AsString := FieldByName('CODIGO').AsString;
         IBBase2.ParamByName('SALDOINICIAL').AsCurrency := saldo;
         IBBase2.ExecQuery;
         IBBase2.Close;
         IBconsalod.Close;
         IBconsalod.ParamByName('AGENCIA').AsInteger := Agencia;
         IBconsalod.ParamByName('CODIGO').AsString := FieldByName('CODIGO').AsString;
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

        dmGeneral := TdmGeneral.Create(Self);
        dmGeneral.getConnected;

        IBBase2.Database := dmGeneral.IBDatabase1;
        IBconsalod.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;

        IBBase2.Transaction := dmGeneral.IBTransaction1;
        IBconsalod.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Transaction := dmGeneral.IBTransaction1;

end;

end.
