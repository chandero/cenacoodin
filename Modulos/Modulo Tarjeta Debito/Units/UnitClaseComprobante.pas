unit UnitClaseComprobante;

interface
uses IBQuery,IBDatabase,Controls;
type
   TComprobante = class
     _iIdComprobante :Integer;
     _iIdAgencia :Integer;
     _iTipoComprobante :Integer;
     _dFecha :tDate;
     _sDescripcion :string;
     _cDebito :Currency;
     _cCredito :Currency;
     _sEstado :string;
     _iImpreso :Integer;
     _sAnulacion :string;
     _sIdEmpleado :string;
     _sCodigo :string;
     _sIdCuenta :string;
     _sIdColocacion :string;
     _iIdIdentificacion :Integer;
     _sIdPersona :string;
     _cMonto :Currency;
     _cTasa :Currency;
     _IBDatabase: TIBDatabase;
     public
       property IdComprobante :integer read _iIdComprobante;
       property IdAgencia :Integer Write _iIdAgencia;
       property TipoComprobante :Integer Write _iTipoComprobante;
       property Fecha :tDate Write _dFecha;
       property Descripcion :string Write _sDescripcion;
       property Debito :Currency Write _cDebito;
       property Credito :Currency Write _cCredito;
       property Estado :string Write _sEstado;
       property Impreso :Integer Write _iImpreso;
       property Anulacion :string Write _sAnulacion;
       property IdEmpleado :string Write _sIdEmpleado;
       property Codigo :string Write _sCodigo;
       property IdCuenta :string Write _sIdCuenta;
       property IdColocacion :string Write _sIdColocacion;
       property IdIdentificacion :Integer Write _iIdIdentificacion;
       property IdPersona :string Write _sIdPersona;
       property Monto :Currency Write _cMonto;
       property Tasa :Currency Write _cTasa;
       property Database :TIBDatabase write _IBDatabase;
       procedure Inicio;
       function Auxiliar:Integer;
       function Comprobante:Integer;
   end;


implementation
procedure TComprobante.Inicio;
begin
     _cDebito := 0;
     _cCredito := 0;
end;
function TComprobante.Auxiliar:Integer;
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
       SQL.Add('INSERT INTO');
       SQL.Add('"con$auxiliar"(');
       SQL.Add('ID_COMPROBANTE,ID_AGENCIA,FECHA,');
       SQL.Add('CODIGO,DEBITO,CREDITO,ID_CUENTA,');
       SQL.Add('ID_COLOCACION,ID_IDENTIFICACION,');
       SQL.Add('ID_PERSONA,MONTO_RETENCION,');
       SQL.Add('TASA_RETENCION,ESTADOAUX)');
       SQL.Add('VALUES(');
       SQL.Add(':ID_COMPROBANTE,:ID_AGENCIA,');
       SQL.Add(':FECHA,:CODIGO,:DEBITO,:CREDITO,');
       SQL.Add(':ID_CUENTA,:ID_COLOCACION,');
       SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,');
       SQL.Add(':MONTO_RETENCION,:TASA_RETENCION,');
       SQL.Add(':ESTADOAUX)');
       ParamByName('ID_COMPROBANTE').AsInteger := _iIdComprobante;
       ParamByName('ID_AGENCIA').AsInteger := _iIdAgencia;
       ParamByName('FECHA').AsDate := _dFecha;
       ParamByName('CODIGO').AsString := _sCodigo;
       ParamByName('DEBITO').AsCurrency := _cDebito;
       ParamByName('CREDITO').AsCurrency := _cCredito;
       ParamByName('ID_CUENTA').AsString := _sIdCuenta;
       ParamByName('ID_COLOCACION').AsString := _sIdColocacion;
       ParamByName('ID_IDENTIFICACION').AsInteger := _iIdIdentificacion;
       ParamByName('ID_PERSONA').AsString := _sIdPersona;
       ParamByName('MONTO_RETENCION').AsCurrency := _cMonto;
       ParamByName('TASA_RETENCION').AsCurrency := _cTasa;
       ParamByName('ESTADOAUX').AsString := _sEstado;
       ExecSQL;
       Result := RowsAffected;
       Transaction.Commit;
       Inicio;
     end;

end;
function TComprobante.Comprobante:Integer;
var IBquery1 : TIBQuery;
    IBTransaction1: TIBTransaction;
begin
     _sCodigo := '';
     _sIdCuenta := '';
     _sIdColocacion := '';
     _iIdIdentificacion := 0;
     _sIdPersona := '';
     _cMonto := 0;
     _cTasa := 0;
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
       SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 1');
       ExecSQL;
       _iIdComprobante := FieldByName('CONSECUTIVO').AsInteger + 1;
       Close;
       SQL.Clear;
       SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
       SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 1');
       ParamByName('CONSECUTIVO').AsInteger := _iIdComprobante;
       ExecSQL;
       Transaction.Commit;
       Transaction.StartTransaction;
       Close;
       SQL.Clear;
       SQL.Add('INSERT INTO "con$comprobante"(');
       SQL.Add('ID_COMPROBANTE,ID_AGENCIA,TIPO_COMPROBANTE,FECHADIA,');
       SQL.Add('DESCRIPCION,TOTAL_DEBITO,TOTAL_CREDITO,ESTADO,');
       SQL.Add('IMPRESO,ANULACION,ID_EMPLEADO)');
       SQL.Add('VALUES(:ID_COMPROBANTE,:ID_AGENCIA,:TIPO_COMPROBANTE,');
       SQL.Add(':FECHADIA,:DESCRIPCION,:TOTAL_DEBITO,:TOTAL_CREDITO,');
       SQL.Add(':ESTADO,:IMPRESO,:ANULACION,:ID_EMPLEADO)');
       ParamByName('ID_COMPROBANTE').AsInteger := _iIdComprobante;
       ParamByName('ID_AGENCIA').AsInteger := _iIdAgencia;
       ParamByName('TIPO_COMPROBANTE').AsInteger := _iTipoComprobante;
       ParamByName('FECHADIA').AsDate := _dFecha;
       ParamByName('DESCRIPCION').AsString := _sDescripcion;
       ParamByName('TOTAL_DEBITO').AsCurrency := _cDebito;
       ParamByName('TOTAL_CREDITO').AsCurrency := _cCredito;
       ParamByName('ESTADO').AsString := _sEstado;
       ParamByName('IMPRESO').AsInteger := _iImpreso;
       ParamByName('ANULACION').AsString := _sAnulacion;
       ParamByName('ID_EMPLEADO').AsString := _sIdEmpleado;
       ExecSQL;
       Result := RowsAffected;
       Transaction.Commit;
     end;
end;
end.
 