unit UnitClaseData;

interface
uses IBQuery,IBDatabase;
type
   TData = class
     _sSentencia :string;
     _sTarjeta :string;
     _sDatafono :string;
     _cSaldoDisponible :Currency;
     _cSaldoTotal :Currency;
     _IBDatabase: TIBDatabase;
     public
       property Sentencia:string Write _sSentencia;
       property Tarjeta:string Write _sTarjeta;
       property SaldoTotal:Currency Read _cSaldoTotal;
       property SaldoDisponible:Currency Read _cSaldoDisponible;
       property Database :TIBDatabase write _IBDatabase;
       procedure Query;
       function SelectQuery: TIBQuery;
       function ValidaAgencia:Integer;
       function ValidaDatafono:Integer;
       function CodAgencia:TIBQuery;
       procedure Saldos;
   end;

implementation
function TData.ValidaAgencia:Integer;
var IBquery1 : TIBQuery;
    IBTransaction1: TIBTransaction;
begin
     IBTransaction1 := TIBTransaction.Create(nil);
     IBtransaction1.DefaultDatabase := _IbDatabase;
     IBtransaction1.DefaultAction := TARollback;
     IBtransaction1.Active := true;
     IBquery1 := TIBQuery.Create(nil);
     with Ibquery1 do
     begin
       Database := _IBdatabase;
       Transaction := IBtransaction1;
       Close;
       SQL.Clear;
       SQL.Add('select ID_AGENCIA from TDB$ASIGNADA where ID_TARJETA = :ID_TARJETA');
       ParamByName('ID_TARJETA').AsString := _sTarjeta;
       Open;
       Result := FieldByName('ID_AGENCIA').AsInteger;
       Transaction.Rollback;
     end;
end;
procedure TData.Query;
var IBquery1 : TIBQuery;
    IBTransaction1: TIBTransaction;
begin
     IBTransaction1 := TIBTransaction.Create(nil);
     IBtransaction1.DefaultDatabase := _IbDatabase;
     IBtransaction1.DefaultAction := TARollback;
     IBtransaction1.Active := true;
     IBquery1 := TIBQuery.Create(nil);
     with Ibquery1 do
     begin
       Close;
       Database := _IBdatabase;
       Transaction := IBTransaction1;
       SQL.Clear;
       SQL.Add(_sSentencia);
       SQL.SaveToFile('c:\reg.sql');
       ExecSQL;
       Transaction.Commit;
     end;
end;
function TData.CodAgencia;
var IBquery1 : TIBQuery;
    IBTransaction1: TIBTransaction;
begin
     IBTransaction1 := TIBTransaction.Create(nil);
     IBtransaction1.DefaultDatabase := _IbDatabase;
     IBtransaction1.DefaultAction := TARollback;
     IBtransaction1.Active := true;
     IBquery1 := TIBQuery.Create(nil);
     with Ibquery1 do
     begin
       Close;
       Database := _IBdatabase;
       Transaction := IBTransaction1;
       SQL.Clear;
       SQL.Add('SELECT');
       SQL.Add('GEN$AGENCIA.DESCRIPCION_AGENCIA,GEN$AGENCIA.CODIGO_CONTABLE,');
       SQL.Add('GEN$SERVIDOR.ID_HOST,');
       SQL.Add('GEN$SERVIDOR.ID_PUERTO,');
       SQL.Add('GEN$AGENCIA.ID_AGENCIA');
       SQL.Add('FROM');
       SQL.Add('GEN$SERVIDOR');
       SQL.Add('INNER JOIN GEN$AGENCIA ON (GEN$SERVIDOR.ID_AGENCIA=GEN$AGENCIA.ID_AGENCIA)');
       SQL.Add('WHERE');
       SQL.Add('(GEN$SERVIDOR.ID_SERVICIO = 1)');
       Open;
     end;
     Result := IBquery1;
end;
function Tdata.SelectQuery :TIBQuery;
var IBquery1 : TIBQuery;
    IBTransaction1: TIBTransaction;
begin
     IBTransaction1 := TIBTransaction.Create(nil);
     IBtransaction1.DefaultDatabase := _IbDatabase;
     IBtransaction1.DefaultAction := TARollback;
     IBtransaction1.Active := true;
     IBquery1 := TIBQuery.Create(nil);
     with Ibquery1 do
     begin
       Close;
       Database := _IBdatabase;
       Transaction := IBTransaction1;
       SQL.Clear;
       SQL.Add(_sSentencia);
       SQL.SaveToFile('c:\sql1.txt');
       Open;
     end;
    Result := IBquery1;
end;
procedure TData.Saldos;
var IBquery1 : TIBQuery;
    IBTransaction1: TIBTransaction;
begin
     IBTransaction1 := TIBTransaction.Create(nil);
     IBtransaction1.DefaultDatabase := _IbDatabase;
     IBtransaction1.DefaultAction := TARollback;
     IBtransaction1.Active := true;
     IBquery1 := TIBQuery.Create(nil);
     with Ibquery1 do
     begin
       Close;
       Database := _IBdatabase;
       Transaction := IBTransaction1;
       SQL.Clear;
       SQL.Add('SELECT TDB$SALDO.SALDODISPONIBLE,TDB$SALDO.SALDOTOTAL FROM');
       SQL.Add('TDB$SALDO WHERE TDB$SALDO.TARJETA = :TARJETA');
       ParamByName('TARJETA').AsString := _sTarjeta;
       Open;
       _cSaldoTotal := FieldByName('SALDOTOTAL').AsCurrency;
       _cSaldoDisponible := FieldByName('SALDODISPONIBLE').AsCurrency;
     end;
end;
function TData.ValidaDatafono: Integer;
var IBquery1 : TIBQuery;
    IBTransaction1: TIBTransaction;
begin
     IBTransaction1 := TIBTransaction.Create(nil);
     IBtransaction1.DefaultDatabase := _IbDatabase;
     IBtransaction1.DefaultAction := TARollback;
     IBtransaction1.Active := true;
     IBquery1 := TIBQuery.Create(nil);
     with Ibquery1 do
     begin
       Database := _IBdatabase;
       Transaction := IBtransaction1;
       Close;
       SQL.Clear;
       SQL.Add('select DATA_OFICINA from TDB$DATAFONO where DATA_CODIGO = :DATA_CODIGO');
       ParamByName('DATA_CODIGO').AsString := _sDatafono;
       Open;
       Result := FieldByName('DATA_OFICINA').AsInteger;
       Transaction.Rollback;
     end;
end;

end.
