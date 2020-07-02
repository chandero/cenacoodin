unit UnitSincronizarPlanCuentasNIIF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, Buttons, ExtCtrls, ComCtrls, DB, IBCustomDataSet,
  IBQuery, unitDmGeneral;

type
  TfrmSincronizarPlanCuentasNIIF = class(TForm)
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    pb: TProgressBar;
    Label1: TLabel;
    edColgaap: TEdit;
    IBQcolgaap: TIBQuery;
    IBQniif: TIBQuery;
    IBQproceso: TIBQuery;
    btnCerrar: TBitBtn;
    IBQparalelo: TIBQuery;
    btnProcesar5: TBitBtn;
    btnProcesar6: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure Procesar;
    procedure Procesar5;
    procedure Procesar6;
    procedure ProcesarMayor(Codigo: String);
    procedure btnProcesar5Click(Sender: TObject);
    procedure btnProcesar6Click(Sender: TObject);
  private
    { Private declarations }
    function EvaluarCodigoMayor(Codigo: String): String;
    function ComplementarCodigo(CodigoAnt: String; CodigoNuevo: String):String;
  public
    { Public declarations }
  end;

var
  frmSincronizarPlanCuentasNIIF: TfrmSincronizarPlanCuentasNIIF;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmSincronizarPlanCuentasNIIF.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQcolgaap.Database := dmgeneral.IBDatabase1;
        IBQniif.Database := dmGeneral.IBDatabase1;
        IBQproceso.Database := dmGeneral.IBDatabase1;
        IBQparalelo.Database := dmGeneral.IBDatabase1;

        IBQcolgaap.Transaction := dmGeneral.IBTransaction1;
        IBQniif.Transaction := dmGeneral.IBTransaction1;
        IBQproceso.Transaction := dmGeneral.IBTransaction1;
        IBQparalelo.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmSincronizarPlanCuentasNIIF.btnProcesarClick(Sender: TObject);
var
  Codigo: String;
  CodigoNuevo: String;
  CodigoAnt: String;
  Porcentaje: Integer;
  nivel: Integer;
begin
        Procesar;

        Showmessage('Proceso finalizado!!!');
end;

procedure TfrmSincronizarPlanCuentasNIIF.Procesar;
var
  Codigo: String;
  CodigoNuevo: String;
  CodigoAnt: String;
  Porcentaje: Integer;
  nivel: Integer;
begin
        IBQcolgaap.SQL.Clear;
        IBQcolgaap.SQL.Add('SELECT * FROM "con$puc" p ORDER BY p.CODIGO');
        IBQcolgaap.Open;
        IBQcolgaap.Last;
        IBQcolgaap.First;

        pb.Min := 0;
        pb.Max := IBQcolgaap.RecordCount;
        pb.Position := 0;

        while not IBQcolgaap.Eof do
        begin
           // Incrementar pb
              pb.Position := IBQcolgaap.RecordCount;
              Application.ProcessMessages;
              edColgaap.Text := IBQcolgaap.FieldByName('CODIGO').AsString + ' ' + IBQcolgaap.FieldByName('NOMBRE').AsString;
              Codigo := IBQcolgaap.FieldByName('CODIGO').AsString;
              // Evaluar si exite en TMP$PARALELO
              IBQproceso.Close;
              IBQproceso.SQL.Clear;
              IBQproceso.SQL.Add('SELECT * FROM TMP$PARALELO t WHERE t.COLGAAP = :CODIGO');
              IBQproceso.ParamByName('CODIGO').AsString := Codigo;
              IBQproceso.Open;
              if (IBQproceso.RecordCount > 0 ) then
              begin
                  // Existe equivalencia exacta
                  // Verificar si existe en CON$PARALELO
                  CodigoNuevo := IBQproceso.FieldByName('NIIF').AsString;
                  IBQparalelo.SQL.Clear;
                  IBQparalelo.SQL.Add('SELECT * FROM CON$PARALELO p WHERE p.COLGAAP = :CODIGO');
                  IBQparalelo.ParamByName('CODIGO').AsString := IBQcolgaap.FieldByName('CODIGO').AsString;
                  IBQparalelo.Open;
                  if (IBQparalelo.RecordCount < 1 ) then
                  begin
                        IBQparalelo.Close;
                        IBQparalelo.SQL.Clear;
                        IBQparalelo.SQL.Add('INSERT INTO CON$PARALELO (COLGAAP, NIIF, PORCENTAJE, ID_AGENCIA)');
                        IBQparalelo.SQL.Add('VALUES (:COLGAAP, :NIIF, :PORCENTAJE, :ID_AGENCIA)');
                        IBQparalelo.ParamByName('COLGAAP').AsString := Codigo;
                        IBQparalelo.ParamByName('NIIF').AsString := CodigoNuevo;
                        IBQparalelo.ParamByName('PORCENTAJE').AsInteger := 100;
                        IBQparalelo.ParamByName('ID_AGENCIA').AsInteger := IBQcolgaap.FieldByName('ID_AGENCIA').AsInteger;
                        IBQparalelo.ExecSQL;
                  end;
                  // Verificar si la cuenta existe en CON$PUC
                  IBQniif.Close;
                  IBQniif.SQL.Clear;
                  IBQniif.SQL.Add('SELECT * FROM CON$PUC p WHERE p.CODIGO = :CODIGO');
                  IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                  IBQniif.Open;
                  if (IBQniif.RecordCount < 1) then
                  begin
                      // Insertar cuenta
                          IBQniif.Close;
                          IBQniif.SQL.Clear;
                          IBQniif.SQL.Add('INSERT INTO CON$PUC (');
                          IBQniif.SQL.Add('CODIGO,');
                          IBQniif.SQL.Add('ID_AGENCIA, CLAVE, NOMBRE,');
                          IBQniif.SQL.Add('TIPO, CODIGOMAYOR, MOVIMIENTO, ESBANCO,');
                          IBQniif.SQL.Add('INFORME, NIVEL, NATURALEZA, CENTROCOSTO,');
                          IBQniif.SQL.Add('SALDOINICIAL, ESCAPTACION, ESCOLOCACION)');
                          IBQniif.SQL.Add('VALUES (');
                          IBQniif.SQL.Add(':CODIGO, :ID_AGENCIA, :CLAVE, :NOMBRE,');
                          IBQniif.SQL.Add(':TIPO, :CODIGOMAYOR, :MOVIMIENTO, :ESBANCO,');
                          IBQniif.SQL.Add(':INFORME, :NIVEL, :NATURALEZA, :CENTROCOSTO,');
                          IBQniif.SQL.Add(':SALDOINICIAL, :ESCAPTACION, :ESCOLOCACION)');
                          IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                          IBQniif.ParamByName('ID_AGENCIA').AsInteger := IBQcolgaap.FieldByName('ID_AGENCIA').AsInteger;
                          IBQniif.ParamByName('CLAVE').AsString := IBQcolgaap.FieldByName('CLAVE').AsString;
                          IBQniif.ParamByName('NOMBRE').AsString := IBQcolgaap.FieldByName('NOMBRE').AsString;
                          IBQniif.ParamByName('TIPO').AsString := IBQcolgaap.FieldByName('TIPO').AsString;
                          IBQniif.ParamByName('CODIGOMAYOR').AsString := EvaluarCodigoMayor(CodigoNuevo);
                          IBQniif.ParamByName('MOVIMIENTO').AsInteger := IBQcolgaap.FieldByName('MOVIMIENTO').AsInteger;
                          IBQniif.ParamByName('ESBANCO').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESBANCO').AsInteger);
                          IBQniif.ParamByName('INFORME').AsString := IBQcolgaap.FieldByName('INFORME').AsString;
                          IBQniif.ParamByName('NIVEL').AsInteger := IBQcolgaap.FieldByName('NIVEL').AsInteger;
                          IBQniif.ParamByName('NATURALEZA').AsString := IBQcolgaap.FieldByName('NATURALEZA').AsString;
                          IBQniif.ParamByName('CENTROCOSTO').AsString := IBQcolgaap.FieldByName('CENTROCOSTO').AsString;
                          IBQniif.ParamByName('SALDOINICIAL').AsCurrency := IBQcolgaap.FieldByName('SALDOINICIAL').AsCurrency;
                          IBQniif.ParamByName('ESCAPTACION').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESCAPTACION').AsInteger);
                          IBQniif.ParamByName('ESCOLOCACION').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESCOLOCACION').AsInteger);
                          IBQniif.ExecSQL;
                  end
                  else
                  begin
                      // actualizar campo MOVIMIENTO
                          IBQniif.Close;
                          IBQniif.SQL.Clear;
                          IBQniif.SQL.Add('UPDATE CON$PUC SET MOVIMIENTO = :MOVIMIENTO WHERE CODIGO = :CODIGO');
                          IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                          IBQniif.ParamByName('MOVIMIENTO').AsInteger := IBQcolgaap.FieldByName('MOVIMIENTO').AsInteger;
                          IBQniif.ExecSQL;
                  end;
              end // fin de if IBQproceso > 0
              else
              begin
                ProcesarMayor(Codigo);
              end;
              IBQcolgaap.Next;
         end; // fin del while IBQcolgaap
end;

procedure TfrmSincronizarPlanCuentasNIIF.ProcesarMayor(Codigo: String);
var
   CodigoAnt, CodigoNuevo, CodigoMayor: String;
begin
                CodigoAnt := Codigo;
                CodigoMayor := EvaluarCodigoMayor(CodigoAnt);
                // Evaluar si exite en TMP$PARALELO
                IBQproceso.Close;
                IBQproceso.SQL.Clear;
                IBQproceso.SQL.Add('SELECT * FROM TMP$PARALELO t WHERE t.COLGAAP = :CODIGO');
                IBQproceso.ParamByName('CODIGO').AsString := CodigoMayor;
                IBQproceso.Open;
                if (IBQproceso.RecordCount > 0 ) then
                begin
                  CodigoNuevo := IBQproceso.FieldByName('NIIF').AsString;
                  CodigoNuevo := ComplementarCodigo(CodigoAnt, CodigoNuevo);
                  IBQparalelo.SQL.Clear;
                  IBQparalelo.SQL.Add('SELECT * FROM CON$PARALELO p WHERE p.COLGAAP = :CODIGO');
                  IBQparalelo.ParamByName('CODIGO').AsString := CodigoNuevo;
                  IBQparalelo.Open;
                  if (IBQparalelo.RecordCount < 1 ) then
                  begin
                        IBQparalelo.Close;
                        IBQparalelo.SQL.Clear;
                        IBQparalelo.SQL.Add('INSERT INTO CON$PARALELO (COLGAAP, NIIF, PORCENTAJE, ID_AGENCIA)');
                        IBQparalelo.SQL.Add('VALUES (:COLGAAP, :NIIF, :PORCENTAJE, :ID_AGENCIA)');
                        IBQparalelo.ParamByName('COLGAAP').AsString := CodigoAnt;
                        IBQparalelo.ParamByName('NIIF').AsString := CodigoNuevo;
                        IBQparalelo.ParamByName('PORCENTAJE').AsInteger := 100;
                        IBQparalelo.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                        IBQparalelo.ExecSQL;
                  end;
                  // Verificar si la cuenta existe en CON$PUC
                  IBQniif.Close;
                  IBQniif.SQL.Clear;
                  IBQniif.SQL.Add('SELECT * FROM CON$PUC p WHERE p.CODIGO = :CODIGO');
                  IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                  IBQniif.Open;
                  if (IBQniif.RecordCount < 1) then
                  begin
                      // Insertar cuenta
                          IBQniif.Close;
                          IBQniif.SQL.Clear;
                          IBQniif.SQL.Add('INSERT INTO CON$PUC (');
                          IBQniif.SQL.Add('CODIGO,');
                          IBQniif.SQL.Add('ID_AGENCIA, CLAVE, NOMBRE,');
                          IBQniif.SQL.Add('TIPO, CODIGOMAYOR, MOVIMIENTO, ESBANCO,');
                          IBQniif.SQL.Add('INFORME, NIVEL, NATURALEZA, CENTROCOSTO,');
                          IBQniif.SQL.Add('SALDOINICIAL, ESCAPTACION, ESCOLOCACION)');
                          IBQniif.SQL.Add('VALUES (');
                          IBQniif.SQL.Add(':CODIGO, :ID_AGENCIA, :CLAVE, :NOMBRE,');
                          IBQniif.SQL.Add(':TIPO, :CODIGOMAYOR, :MOVIMIENTO, :ESBANCO,');
                          IBQniif.SQL.Add(':INFORME, :NIVEL, :NATURALEZA, :CENTROCOSTO,');
                          IBQniif.SQL.Add(':SALDOINICIAL, :ESCAPTACION, :ESCOLOCACION)');
                          IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                          IBQniif.ParamByName('ID_AGENCIA').AsInteger := IBQcolgaap.FieldByName('ID_AGENCIA').AsInteger;
                          IBQniif.ParamByName('CLAVE').AsString := IBQcolgaap.FieldByName('CLAVE').AsString;
                          IBQniif.ParamByName('NOMBRE').AsString := IBQcolgaap.FieldByName('NOMBRE').AsString;
                          IBQniif.ParamByName('TIPO').AsString := IBQcolgaap.FieldByName('TIPO').AsString;
                          IBQniif.ParamByName('CODIGOMAYOR').AsString := EvaluarCodigoMayor(CodigoNuevo);
                          IBQniif.ParamByName('MOVIMIENTO').AsInteger := IBQcolgaap.FieldByName('MOVIMIENTO').AsInteger;
                          IBQniif.ParamByName('ESBANCO').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESBANCO').AsInteger);
                          IBQniif.ParamByName('INFORME').AsString := IBQcolgaap.FieldByName('INFORME').AsString;
                          IBQniif.ParamByName('NIVEL').AsInteger := IBQcolgaap.FieldByName('NIVEL').AsInteger;
                          IBQniif.ParamByName('NATURALEZA').AsString := IBQcolgaap.FieldByName('NATURALEZA').AsString;
                          IBQniif.ParamByName('CENTROCOSTO').AsString := IBQcolgaap.FieldByName('CENTROCOSTO').AsString;
                          IBQniif.ParamByName('SALDOINICIAL').AsCurrency := IBQcolgaap.FieldByName('SALDOINICIAL').AsCurrency;
                          IBQniif.ParamByName('ESCAPTACION').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESCAPTACION').AsInteger);
                          IBQniif.ParamByName('ESCOLOCACION').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESCOLOCACION').AsInteger);
                          IBQniif.ExecSQL;
                  end
                  else
                  begin
                      // actualizar campo MOVIMIENTO
                          IBQniif.Close;
                          IBQniif.SQL.Clear;
                          IBQniif.SQL.Add('UPDATE CON$PUC SET MOVIMIENTO = :MOVIMIENTO WHERE CODIGO = :CODIGO');
                          IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                          IBQniif.ParamByName('MOVIMIENTO').AsInteger := IBQcolgaap.FieldByName('MOVIMIENTO').AsInteger;                          
                          IBQniif.ExecSQL;
                  end;
                end
                else
                begin
             //       ProcesarMayor(Codigo);
                end;

end;

function TfrmSincronizarPlanCuentasNIIF.ComplementarCodigo(CodigoAnt: String; CodigoNuevo: String):String;
var Longitud : Integer;
    Cadena : String[18];
    Codigo : String;
    Nivel : Integer;
    LongDatos: Integer;
begin
        Cadena := '000000000000000000';
        Longitud := 16;
        Codigo := CodigoAnt;

        if MidStr(Codigo,17,2) = '00' then
        begin
          Longitud := 14; //18-10  Nivel 9
          Nivel := 9;
          LongDatos := 2;
        end;
        if MidStr(Codigo,15,2) = '00' then
        begin
         Longitud := 13; //16-9   Nivel 8
         Nivel := 8;
         LongDatos := 2;
        end;
        if MidStr(Codigo,13,2) = '00' then
        begin
         Longitud := 10; //14-8   Nivel 7
         Nivel := 7;
         LongDatos := 2;
        end;
        if MidStr(Codigo,11,2) = '00' then
        begin
         Longitud := 8; //12-7    Nivel 6
         Nivel := 6;
         LongDatos := 2;
        end;
        if MidStr(Codigo,9,2)  = '00' then
        begin
          Longitud := 6; //10-6    Nivel 5
          Nivel := 5;
          LongDatos := 2;
        end;
        if MidStr(Codigo,7,2)  = '00' then
        begin
         Longitud := 4; //8-5     Nivel 4
         Nivel := 4;
         LongDatos := 2;
        end;
        if MidStr(Codigo,5,2)  = '00' then
        begin
         Longitud := 2; //6-4     Nivel 3
         Nivel := 3;
         LongDatos := 2;
        end;
        if MidStr(Codigo,3,2)  = '00' then
        begin
         Longitud := 1; //4-3     Nivel 2
         Nivel := 2;
         LongDatos := 1;
        end;
        if Midstr(Codigo,2,1)  = '0'  then
        begin
         Longitud := 1; //1-2     Nivel 1
         Nivel := 1;
         LongDatos := 1;
        end;
        CodigoNuevo := LeftStr(CodigoNuevo,Longitud)+MidStr(CodigoAnt,Longitud+1,LongDatos);
        CodigoNuevo := CodigoNuevo + LeftStr(cadena,18-Length(CodigoNuevo));
        Result := CodigoNuevo;
end;

function TfrmSincronizarPlanCuentasNIIF.EvaluarCodigoMayor(Codigo: String): String;
var Longitud : Integer;
    Cadena : String[18];
begin
        Cadena := '000000000000000000';
        Longitud := 16;

        if MidStr(Codigo,17,2) = '00' then Longitud := 14; //18-10
        if MidStr(Codigo,15,2) = '00' then Longitud := 13; //16-9
        if MidStr(Codigo,13,2) = '00' then Longitud := 10; //14-8
        if MidStr(Codigo,11,2) = '00' then Longitud := 8; //12-7
        if MidStr(Codigo,9,2)  = '00' then Longitud := 6; //10-6
        if MidStr(Codigo,7,2)  = '00' then Longitud := 4; //8-5
        if MidStr(Codigo,5,2)  = '00' then Longitud := 2; //6-4
        if MidStr(Codigo,3,2)  = '00' then Longitud := 1; //4-3
        if Midstr(Codigo,2,1)  = '0'  then Longitud := 1; //1-2
        Insert(LeftStr(Codigo,Longitud),Cadena,1);
        Result := Cadena;
end;

procedure TfrmSincronizarPlanCuentasNIIF.btnCerrarClick(Sender: TObject);
begin
        dmGeneral.Free;
        Close;
end;

procedure TfrmSincronizarPlanCuentasNIIF.btnProcesar5Click(
  Sender: TObject);
begin
        Procesar5;
        Showmessage('Proceso finalizado!!!');
end;

procedure TfrmSincronizarPlanCuentasNIIF.btnProcesar6Click(
  Sender: TObject);
begin
        Procesar6;
        Showmessage('Proceso finalizado!!!');
end;

procedure TfrmSincronizarPlanCuentasNIIF.Procesar5();
var
  Codigo: String;
  CodigoNuevo: String;
  CodigoAnt: String;
  Porcentaje: Integer;
  nivel: Integer;
begin
        IBQcolgaap.SQL.Clear;
        IBQcolgaap.SQL.Add('SELECT * FROM "con$puc" p WHERE p.NIVEL = 5 ORDER BY p.CODIGO ASC');
        IBQcolgaap.Open;
        IBQcolgaap.Last;
        IBQcolgaap.First;

        pb.Min := 0;
        pb.Max := IBQcolgaap.RecordCount;
        pb.Position := 0;

        while not IBQcolgaap.Eof do
        begin
           // Incrementar pb
              pb.Position := IBQcolgaap.RecordCount;
              Application.ProcessMessages;
              edColgaap.Text := IBQcolgaap.FieldByName('CODIGO').AsString + ' ' + IBQcolgaap.FieldByName('NOMBRE').AsString;
              CodigoAnt := IBQcolgaap.FieldByName('CODIGO').AsString;
              Codigo := IBQcolgaap.FieldByName('CODIGOMAYOR').AsString;
              // Evaluar si exite en TMP$PARALELO
              IBQproceso.Close;
              IBQproceso.SQL.Clear;
              IBQproceso.SQL.Add('SELECT * FROM TMP$PARALELO t WHERE t.COLGAAP = :CODIGO');
              IBQproceso.ParamByName('CODIGO').AsString := Codigo;
              IBQproceso.Open;
              if (IBQproceso.RecordCount > 0 ) then
              begin
                  CodigoNuevo := IBQproceso.FieldByName('NIIF').AsString;
                  CodigoNuevo := ComplementarCodigo(CodigoAnt, CodigoNuevo);
                  IBQparalelo.SQL.Clear;
                  IBQparalelo.SQL.Add('SELECT * FROM CON$PARALELO p WHERE p.COLGAAP = :CODIGO');
                  IBQparalelo.ParamByName('CODIGO').AsString := CodigoNuevo;
                  IBQparalelo.Open;
                  if (IBQparalelo.RecordCount < 1 ) then
                  begin
                        IBQparalelo.Close;
                        IBQparalelo.SQL.Clear;
                        IBQparalelo.SQL.Add('INSERT INTO CON$PARALELO (COLGAAP, NIIF, PORCENTAJE, ID_AGENCIA)');
                        IBQparalelo.SQL.Add('VALUES (:COLGAAP, :NIIF, :PORCENTAJE, :ID_AGENCIA)');
                        IBQparalelo.ParamByName('COLGAAP').AsString := CodigoAnt;
                        IBQparalelo.ParamByName('NIIF').AsString := CodigoNuevo;
                        IBQparalelo.ParamByName('PORCENTAJE').AsInteger := 100;
                        IBQparalelo.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                        IBQparalelo.ExecSQL;
                  end;
                  // Verificar si la cuenta existe en CON$PUC
                  IBQniif.Close;
                  IBQniif.SQL.Clear;
                  IBQniif.SQL.Add('SELECT * FROM CON$PUC p WHERE p.CODIGO = :CODIGO');
                  IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                  IBQniif.Open;
                  if (IBQniif.RecordCount < 1) then
                  begin
                      // Insertar cuenta
                          IBQniif.Close;
                          IBQniif.SQL.Clear;
                          IBQniif.SQL.Add('INSERT INTO CON$PUC (');
                          IBQniif.SQL.Add('CODIGO,');
                          IBQniif.SQL.Add('ID_AGENCIA, CLAVE, NOMBRE,');
                          IBQniif.SQL.Add('TIPO, CODIGOMAYOR, MOVIMIENTO, ESBANCO,');
                          IBQniif.SQL.Add('INFORME, NIVEL, NATURALEZA, CENTROCOSTO,');
                          IBQniif.SQL.Add('SALDOINICIAL, ESCAPTACION, ESCOLOCACION)');
                          IBQniif.SQL.Add('VALUES (');
                          IBQniif.SQL.Add(':CODIGO, :ID_AGENCIA, :CLAVE, :NOMBRE,');
                          IBQniif.SQL.Add(':TIPO, :CODIGOMAYOR, :MOVIMIENTO, :ESBANCO,');
                          IBQniif.SQL.Add(':INFORME, :NIVEL, :NATURALEZA, :CENTROCOSTO,');
                          IBQniif.SQL.Add(':SALDOINICIAL, :ESCAPTACION, :ESCOLOCACION)');
                          IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                          IBQniif.ParamByName('ID_AGENCIA').AsInteger := IBQcolgaap.FieldByName('ID_AGENCIA').AsInteger;
                          IBQniif.ParamByName('CLAVE').AsString := IBQcolgaap.FieldByName('CLAVE').AsString;
                          IBQniif.ParamByName('NOMBRE').AsString := IBQcolgaap.FieldByName('NOMBRE').AsString;
                          IBQniif.ParamByName('TIPO').AsString := IBQcolgaap.FieldByName('TIPO').AsString;
                          IBQniif.ParamByName('CODIGOMAYOR').AsString := EvaluarCodigoMayor(CodigoNuevo);
                          IBQniif.ParamByName('MOVIMIENTO').AsInteger := IBQcolgaap.FieldByName('MOVIMIENTO').AsInteger;
                          IBQniif.ParamByName('ESBANCO').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESBANCO').AsInteger);
                          IBQniif.ParamByName('INFORME').AsString := IBQcolgaap.FieldByName('INFORME').AsString;
                          IBQniif.ParamByName('NIVEL').AsInteger := IBQcolgaap.FieldByName('NIVEL').AsInteger;
                          IBQniif.ParamByName('NATURALEZA').AsString := IBQcolgaap.FieldByName('NATURALEZA').AsString;
                          IBQniif.ParamByName('CENTROCOSTO').AsString := IBQcolgaap.FieldByName('CENTROCOSTO').AsString;
                          IBQniif.ParamByName('SALDOINICIAL').AsCurrency := IBQcolgaap.FieldByName('SALDOINICIAL').AsCurrency;
                          IBQniif.ParamByName('ESCAPTACION').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESCAPTACION').AsInteger);
                          IBQniif.ParamByName('ESCOLOCACION').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESCOLOCACION').AsInteger);
                          IBQniif.ExecSQL;
                  end;

              end;
              IBQcolgaap.Next;
        end;
end;

procedure TfrmSincronizarPlanCuentasNIIF.Procesar6();
var
  Codigo: String;
  CodigoNuevo: String;
  CodigoAnt: String;
  Porcentaje: Integer;
  nivel: Integer;
begin
        IBQcolgaap.SQL.Clear;
        IBQcolgaap.SQL.Add('SELECT * FROM "con$puc" p WHERE p.NIVEL = 4 ORDER BY p.CODIGO ASC');
        IBQcolgaap.Open;
        IBQcolgaap.Last;
        IBQcolgaap.First;

        pb.Min := 0;
        pb.Max := IBQcolgaap.RecordCount;
        pb.Position := 0;

        while not IBQcolgaap.Eof do
        begin
           // Incrementar pb
              pb.Position := IBQcolgaap.RecordCount;
              Application.ProcessMessages;
              edColgaap.Text := IBQcolgaap.FieldByName('CODIGO').AsString + ' ' + IBQcolgaap.FieldByName('NOMBRE').AsString;
              CodigoAnt := IBQcolgaap.FieldByName('CODIGO').AsString;
              Codigo := IBQcolgaap.FieldByName('CODIGOMAYOR').AsString;
              // Evaluar si exite en TMP$PARALELO
              IBQproceso.Close;
              IBQproceso.SQL.Clear;
              IBQproceso.SQL.Add('SELECT * FROM TMP$PARALELO t WHERE t.COLGAAP = :CODIGO');
              IBQproceso.ParamByName('CODIGO').AsString := Codigo;
              IBQproceso.Open;
              if (IBQproceso.RecordCount > 0 ) then
              begin
                  CodigoNuevo := IBQproceso.FieldByName('NIIF').AsString;
                  CodigoNuevo := ComplementarCodigo(CodigoAnt, CodigoNuevo);
                  IBQparalelo.SQL.Clear;
                  IBQparalelo.SQL.Add('SELECT * FROM CON$PARALELO p WHERE p.COLGAAP = :CODIGO');
                  IBQparalelo.ParamByName('CODIGO').AsString := CodigoNuevo;
                  IBQparalelo.Open;
                  if (IBQparalelo.RecordCount < 1 ) then
                  begin
                        IBQparalelo.Close;
                        IBQparalelo.SQL.Clear;
                        IBQparalelo.SQL.Add('INSERT INTO CON$PARALELO (COLGAAP, NIIF, PORCENTAJE, ID_AGENCIA)');
                        IBQparalelo.SQL.Add('VALUES (:COLGAAP, :NIIF, :PORCENTAJE, :ID_AGENCIA)');
                        IBQparalelo.ParamByName('COLGAAP').AsString := CodigoAnt;
                        IBQparalelo.ParamByName('NIIF').AsString := CodigoNuevo;
                        IBQparalelo.ParamByName('PORCENTAJE').AsInteger := 100;
                        IBQparalelo.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                        IBQparalelo.ExecSQL;
                  end;
                  // Verificar si la cuenta existe en CON$PUC
                  IBQniif.Close;
                  IBQniif.SQL.Clear;
                  IBQniif.SQL.Add('SELECT * FROM CON$PUC p WHERE p.CODIGO = :CODIGO');
                  IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                  IBQniif.Open;
                  if (IBQniif.RecordCount < 1) then
                  begin
                      // Insertar cuenta
                          IBQniif.Close;
                          IBQniif.SQL.Clear;
                          IBQniif.SQL.Add('INSERT INTO CON$PUC (');
                          IBQniif.SQL.Add('CODIGO,');
                          IBQniif.SQL.Add('ID_AGENCIA, CLAVE, NOMBRE,');
                          IBQniif.SQL.Add('TIPO, CODIGOMAYOR, MOVIMIENTO, ESBANCO,');
                          IBQniif.SQL.Add('INFORME, NIVEL, NATURALEZA, CENTROCOSTO,');
                          IBQniif.SQL.Add('SALDOINICIAL, ESCAPTACION, ESCOLOCACION)');
                          IBQniif.SQL.Add('VALUES (');
                          IBQniif.SQL.Add(':CODIGO, :ID_AGENCIA, :CLAVE, :NOMBRE,');
                          IBQniif.SQL.Add(':TIPO, :CODIGOMAYOR, :MOVIMIENTO, :ESBANCO,');
                          IBQniif.SQL.Add(':INFORME, :NIVEL, :NATURALEZA, :CENTROCOSTO,');
                          IBQniif.SQL.Add(':SALDOINICIAL, :ESCAPTACION, :ESCOLOCACION)');
                          IBQniif.ParamByName('CODIGO').AsString := CodigoNuevo;
                          IBQniif.ParamByName('ID_AGENCIA').AsInteger := IBQcolgaap.FieldByName('ID_AGENCIA').AsInteger;
                          IBQniif.ParamByName('CLAVE').AsString := IBQcolgaap.FieldByName('CLAVE').AsString;
                          IBQniif.ParamByName('NOMBRE').AsString := IBQcolgaap.FieldByName('NOMBRE').AsString;
                          IBQniif.ParamByName('TIPO').AsString := IBQcolgaap.FieldByName('TIPO').AsString;
                          IBQniif.ParamByName('CODIGOMAYOR').AsString := EvaluarCodigoMayor(CodigoNuevo);
                          IBQniif.ParamByName('MOVIMIENTO').AsInteger := IBQcolgaap.FieldByName('MOVIMIENTO').AsInteger;
                          IBQniif.ParamByName('ESBANCO').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESBANCO').AsInteger);
                          IBQniif.ParamByName('INFORME').AsString := IBQcolgaap.FieldByName('INFORME').AsString;
                          IBQniif.ParamByName('NIVEL').AsInteger := IBQcolgaap.FieldByName('NIVEL').AsInteger;
                          IBQniif.ParamByName('NATURALEZA').AsString := IBQcolgaap.FieldByName('NATURALEZA').AsString;
                          IBQniif.ParamByName('CENTROCOSTO').AsString := IBQcolgaap.FieldByName('CENTROCOSTO').AsString;
                          IBQniif.ParamByName('SALDOINICIAL').AsCurrency := IBQcolgaap.FieldByName('SALDOINICIAL').AsCurrency;
                          IBQniif.ParamByName('ESCAPTACION').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESCAPTACION').AsInteger);
                          IBQniif.ParamByName('ESCOLOCACION').AsBoolean := IntToBoolean(IBQcolgaap.FieldByName('ESCOLOCACION').AsInteger);
                          IBQniif.ExecSQL;
                  end;

              end;
              IBQcolgaap.Next;
        end;
end;

end.
