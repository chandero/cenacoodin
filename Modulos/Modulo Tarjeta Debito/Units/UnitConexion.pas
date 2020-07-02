unit UnitConexion;
Interface
uses IBDatabase, UnitGlobalTd;

type
   TConexion = class
     private
       _database: TIBDatabase;
     public
       property Database:TIBDatabase read _database;
       function Conectar:Boolean;
       function Transaccion:TIBTransaction;
       procedure Desconectar;
   end;

implementation
function TConexion.Conectar:Boolean;
begin
  _database := TIBDatabase.Create(nil);
  _database.DatabaseName := DBserver + ':' + DBpath + DBname;
  _database.SQLDialect := 3;
  _database.LoginPrompt := False;
  _database.Params.Add('user_name='+DBAlias);
  _database.Params.Add('password='+ DBPasabordo);
  _database.Params.Add('lc_ctype=ISO8859_1');
  _database.Params.Add('sql_role_name=' + DBRole);
  try
    _database.Open;
    if (_database.Connected) then
        result := true
    else
        result := false;
  except
        result := false;
  end;
end;

procedure TConexion.Desconectar;
begin
    if (_database.Connected) then
        _database.Close;
end;
function Tconexion.Transaccion;
var    IBTransaction1: TIBTransaction;
begin
   IBTransaction1 := TIBTransaction.Create(nil);
   IBtransaction1.DefaultDatabase := _database;
   IBtransaction1.DefaultAction := TARollback;
   IBtransaction1.Active := true;
   Result := IBTransaction1;
end;
end.
