unit UnitClaseData;

interface
uses IBQuery,IBDatabase,Controls;
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
       procedure ControlArchivo(_sArchivo:string);
       function ConsultaArchivo(_sArchvio:string):Boolean;
       function ValidaDescarga(_iIdAgencia:Integer;_dFecha:Tdate):Boolean;
       procedure InsertaDescarga(_iIdAgencia:Integer;_dFecha:TDate);

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

function TData.ConsultaArchivo(_sArchvio: string): Boolean;
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
       SQL.Add('SELECT TDB$CONTROL.ARCHIVO FROM TDB$CONTROL WHERE TDB$CONTROL.ARCHIVO = :ARCHIVO');
       ParamByName('ARCHIVO').AsString := _sArchvio;
       Open;
       if RecordCount = 0 then
          Result := True
       else
          Result := False;
       Transaction.Rollback;
     end;
end;

procedure TData.ControlArchivo(_sArchivo: string);
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
       SQL.Add('INSERT INTO TDB$CONTROL(ARCHIVO) VALUES(:ARCHIVO)');
       ParamByName('ARCHIVO').AsString := _sArchivo;
       ExecSQL;
       Transaction.Commit;
     end;
end;
function TData.ValidaDescarga(_iIdAgencia: Integer;
  _dFecha: Tdate): Boolean;
var IBquery1 : TIBQuery;
    IBTransaction1: TIBTransaction;
begin
     IBTransaction1 := TIBTransaction.Create(nil);
     IBtransaction1.DefaultDatabase := _IbDatabase;
     IBtransaction1.DefaultAction := TARollback;
     IBtransaction1.Active := True;
     IBquery1 := TIBQuery.Create(nil);
     with Ibquery1 do
     begin
       Database := _IBdatabase;
       Transaction := IBtransaction1;
       Close;
       SQL.Clear;
       SQL.Add('SELECT COUNT(0) AS CONTADOR FROM TDB$CONTROLAGENCIA WHERE  TDB$CONTROLAGENCIA.FECHA = :FECHA AND TDB$CONTROLAGENCIA.IDAGENCIA = :IDAGENCIA');
       ParamByName('FECHA').AsDateTime := _dFecha;
       ParamByName('IDAGENCIA').AsInteger := _iIdAgencia;
       Open;
       if FieldByName('CONTADOR').AsInteger > 0 then
          Result := False
       else
          Result := True;
       Transaction.Commit;
     end;
end;
procedure TData.InsertaDescarga(_iIdAgencia: Integer; _dFecha: TDate);
var IBquery1 : TIBQuery;
    IBTransaction1: TIBTransaction;
begin
     IBTransaction1 := TIBTransaction.Create(nil);
     IBtransaction1.DefaultDatabase := _IbDatabase;
     IBtransaction1.DefaultAction := TARollback;
     IBtransaction1.Active := True;
     IBquery1 := TIBQuery.Create(nil);
     with Ibquery1 do
     begin
       Database := _IBdatabase;
       Transaction := IBtransaction1;
       Close;
       SQL.Clear;
       SQL.Add('INSERT INTO TDB$CONTROLAGENCIA (IDAGENCIA,FECHA) VALUES(:IDAGENCIA,:FECHA)');
       ParamByName('FECHA').AsDateTime := _dFecha;
       ParamByName('IDAGENCIA').AsInteger := _iIdAgencia;
       ExecSQL;
       Transaction.Commit;
     end;
end;


end.
