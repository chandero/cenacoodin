unit UnitVisaColocacion;

interface

uses UnitDmGeneral, UnitGlobales, IBDataBase, IBQuery;

var
  colocacion : string;
  vcolocacion : string;
  vDesembolso : Currency;
  vEstadoColocacion:Integer;
  vCuentaAportes:Integer;
  vIdIdentificacion:Integer;
  vIdPersona:String;
  consecutivo:integer;
  consec:string;
  vNotaContable:string;
  DigitoC:String;
  vCodigoPucAportes:String;
  vCodigoPucAhorros:String;
  ValorAportes:Currency;
  ValorAhorros:Currency;
  EsAnulado : Integer;
  EsVigente : Integer;
  Empleado1 : string;


implementation


function AplicarDescuentos(Agencia,Colocacion):Boolean;
var
IBQuery,IBQuery1,IBAbonar:TIBQuery;
IBTransaction:TIBTransaction;
TotalDebitos : Currency;
TotalCreditos : Currency;
begin

    IBTransaction := TIBTransaction.Create(nil);

    IBQuery := TIBQuery.Create(nil);
    IBQuery1 := TIBQuery.Create(nil);
    IBAbonar := TIBQuery.Create(nil);


    with IBQuery do
     begin
       SQL.Clear;
       Sql.Add('select ');
       SQL.Add('SUM("col$concol".DEBITO) AS DEBITO1,');
       SQL.Add('SUM("col$concol".CREDITO) AS CREDITO1');
       SQL.Add('from "col$concol" Where ');
       SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
       SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION"');
       SQL.Add('GROUP BY ');
       SQL.Add('"col$concol".ID_AGENCIA,');
       SQL.Add('"col$concol".ID_COLOCACION');
       ParamByName('ID_AGENCIA').AsInteger := Agencia;
       ParamByName('ID_COLOCACION').AsString := Colocacion;
       Open;
       TotalDebitos := FieldByName('DEBITO1').AsCurrency;
       TotalCreditos := FieldByName('CREDITO1').AsCurrency;
       Close;
     end;

 With IBQuery1 do
  begin
    Sql.Clear;
    Sql.Add('select ');
    Sql.Add('"col$concol".ID_AGENCIA,');
    Sql.Add('"col$concol".ID_COLOCACION,');
    Sql.Add('"col$concol".CODIGO,');
    Sql.Add('"col$concol".DEBITO,');
    Sql.Add('"col$concol".CREDITO,');
    Sql.Add('"col$concol".FECHA_Y_HORA');
    SQL.Add('from "col$concol" Where ');
    SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
    SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION"');
    ParamByName('ID_AGENCIA').AsInteger := Agencia;
    ParamByName('ID_COLOCACION').AsString := Colocacion;
    Open;

    with IBAbonar do
     try
       sql.Clear;
       sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
       sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
       sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
       sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
       sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
       sql.Add('"con$comprobante"."ANULACION", "con$comprobante"."ID_EMPLEADO") ');
       sql.Add('values (');
       sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
       sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
       sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION", :"ID_EMPLEADO")');
       ParamByName('ID_COMPROBANTE').AsString:= vNotaContable;
       ParamByname('FECHADIA').AsDate := IBQuery1.FieldByName('FECHA_Y_HORA').AsDateTime;
       ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
       ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
       ParamByName('DESCRIPCION').AsString := 'Desembolso de Crédito Numero' + colocacion + 'Cuenta Aportes No.' + IntToStr(vCuentaAportes);
       ParamByName('TOTAL_DEBITO').AsCurrency  := TotalDebitos;
       ParamByName('TOTAL_CREDITO').AsCurrency  := TotalCreditos;
       ParamByName('ESTADO').AsString  := 'O';
       ParamByname('ANULACION').asstring := '';
       ParamByName('IMPRESO').AsInteger  := Ord(true);
       ParamByName('ID_EMPLEADO').AsString := Empleado1;

       ExecSQL;

       While not IBQuery1.Eof do
        begin
          SQL.Clear;
          SQL.Add('insert into "con$auxiliar" values (');
          SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
          SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
          SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
          ParamByName('ID_COMPROBANTE').AsString := vNotaContable;
          ParamByName('ID_AGENCIA').AsInteger:= IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
          ParamByName('FECHA').AsDate := IBQuery1.FieldByName('FECHA_Y_HORA').AsDateTime;
          ParamByName('CODIGO').AsString := IBQuery1.FieldByName('CODIGO').AsString;
          ParamByName('DEBITO').AsCurrency := IBQuery1.FieldByName('DEBITO').AsCurrency;
          ParamByName('CREDITO').AsCurrency := IBQuery1.FieldByName('CREDITO').AsCurrency;
          ParamByName('ID_CUENTA').AsInteger := vCuentaAportes;
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('ID_IDENTIFICACION').AsInteger := vIdIdentificacion;
          ParamByName('ID_PERSONA').AsString := vIdPersona;
          ParamByName('MONTO_RETENCION').AsCurrency := 0;
          ParamByName('TASA_RETENCION').AsFloat := 0;
          ParamByName('ESTADOAUX').AsString := 'O';
          ExecSQL;
          IBQuery1.Next;
        end;

     BuscarDatos;
     Result := True;
     except
     Result := False;
     raise;
     end;
  end;
end;

procedure BuscarDatos;
begin
        With IBQuery1 do
         begin
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" ');
           SQL.Add('where ID_CODIGOPUCBASICO = 8');
           Open;
           vCodigoPucAhorros := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" ');
           SQL.Add('where ID_CODIGOPUCBASICO = 3');
           Open;
           vCodigoPucAportes := FieldByName('CODIGO').AsString;
           Close;

           SQL.Clear;
           SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
           SQL.Add('where "col$estado".ES_ANULADO = 1');
           Open;
           EsAnulado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
           Close;
         end;

        with IBAhorros do
         begin
           SQL.Clear;
           SQL.Add('Select CREDITO');
           SQL.Add('from "col$concol"');
           SQL.Add('where ');
           SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$concol".CODIGO =:"CODIGO"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ParamByName('CODIGO').AsString := vCodigoPucAhorros;
           Open;
           ValorAhorros := FieldByName('CREDITO').AsCurrency;
           Close;
         end;

        with IBAportes do
         begin
           SQL.Clear;
           SQL.Add('Select CREDITO');
           SQL.Add('from "col$concol"');
           SQL.Add('where ');
           SQL.Add('"col$concol".ID_AGENCIA =:"ID_AGENCIA" and');
           SQL.Add('"col$concol".ID_COLOCACION =:"ID_COLOCACION" and');
           SQL.Add('"col$concol".CODIGO =:"CODIGO"');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Colocacion;
           ParamByName('CODIGO').AsString := vCodigoPucAportes;
           Open;
           while not IBAportes.Eof do
            begin
              ValorAportes := ValorAportes + FieldByName('CREDITO').AsCurrency;
              Next;
            end;
           Close;
         end;
end;


end.
 