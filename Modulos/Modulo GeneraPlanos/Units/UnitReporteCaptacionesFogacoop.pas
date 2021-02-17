unit UnitReporteCaptacionesFogacoop;

interface

uses
  Windows, Messages, Math, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, DBClient, FR_Class,
  FR_DSet, FR_DBSet, IBDatabase;

type
  TfrmReporteCaptacionesFogacoop = class(TForm)
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
    CDSaldosRojo: TClientDataSet;
    CDSaldosRojoID_AGENCIA: TIntegerField;
    CDSaldosRojoID_TIPO_CAPTACION: TIntegerField;
    CDSaldosRojoNUMERO_CUENTA: TIntegerField;
    CDSaldosRojoDIGITO_CUENTA: TIntegerField;
    CDSaldosRojoID_IDENTIFICACION: TIntegerField;
    CDSaldosRojoID_PERSONA: TStringField;
    CDSaldosRojoASOCIADO: TStringField;
    CDSaldosRojoSALDO: TCurrencyField;
    CDSinAportes: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    CurrencyField1: TCurrencyField;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    SinAportes: TfrReport;
    frDBSinAportes: TfrDBDataSet;
    frDBSaldosrojo: TfrDBDataSet;
    SaldosRojo: TfrReport;
    Database: TIBDatabase;
    Transaction: TIBTransaction;
    Label5: TLabel;
    LblEstado: TLabel;
    IBSQL4: TIBSQL;
    IBAgencia: TIBQuery;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SinAportesGetValue(const ParName: String;
      var ParValue: Variant);
    procedure EdFechaCorteExit(Sender: TObject);
  private
    function Asociado(TipoId:Integer;IDPersona:string):string;
    procedure Contractuales;
    procedure Cdat;
    procedure Ahorros;
    { Private declarations }
  public
    { Public declarations }
  end;

type PCaptaciones=^ACaptaciones;
     ACaptaciones=Record
      TipoId:string;
      Identificacion:string;
      Nombre:string;
      Codigo:string;
      NombreDepos:string;
      TipoAho:Integer;
      Amortiza:Integer;
      FechaApertura:string;
      Plazo:Integer;
      FechaVencimiento:string;
      Modalidad:Integer;
      TasaNominal:Single;
      TasaEfectiva:Single;
      InteresCausado:Currency;
      Saldo:Currency;
      DepositoInicial:Currency;
      NumeroCuenta:string;
      FechaNacimiento:string;
      Sexo:string;
      Ciiu:string;
      Excenta:Integer;
      FechaAceptacion:string;
      EstadoCta:string;
      BajoMonto:string;
      ValorCuota:Currency;
end;

var
  frmReporteCaptacionesFogacoop: TfrmReporteCaptacionesFogacoop;
  F:TextFile;

  Total,Posicion:Integer;
  AR:PCaptaciones;
  Verdadero:Boolean;
  Tp:Integer;
  FechaA,FechaV:TDate;
  Cadena:string;
  FechaInicial : TDate;
  SaldoInicial:Currency;
  Saldo:Currency;
  FechaCorte : TDate;


implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso,UnitImpresion,
     UnitMain;

procedure TfrmReporteCaptacionesFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteCaptacionesFogacoop.CmdProcesoClick(Sender: TObject);
var
NRuta:string;
begin
   CmdProceso.Enabled := False;
   Application.ProcessMessages;
   NRuta := DBPath1;

   IBAgencia.Close;
   IBAgencia.Open;
   IBAgencia.Last;
   IBAgencia.First;

   if TipoProceso = 1 then
    begin
      IBSQL1.Database := dmGeneral.IBDatabase1;
      IBSQL1.Transaction := dmGeneral.IBTransaction1;

      IBSQL2.Database := dmGeneral.IBDatabase1;
      IBSQL2.Transaction := dmGeneral.IBTransaction1;

      IBSQL4.Database := dmGeneral.IBDatabase1;
      IBSQL4.Transaction := dmGeneral.IBTransaction1;

      IBQuery2.Database := dmGeneral.IBDatabase1;
      IBQuery2.Transaction := dmGeneral.IBTransaction1;

      lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';      
      Cadena := IntToStr(YearOf(FechaCorte)) + IntToStr(MonthOf(FechaCorte)) + IntToStr(DayOf(FechaCorte));
      AssignFile(F,'C:/PlanosFinMes/CAPTACIONES' + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + Cadena + '.TXT');

      FechaInicial := EncodeDate(YearOf(FechaCorte),01,01);

      Rewrite(F);
      Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'ASOCIADO' + #9 + 'CODIGO CONTABLE' + #9 + 'NOMBRE DEPOSITO' + #9 + 'TIPO AHORRO' + #9 +
                'AMORTIZACION' + #9 +'FECHA APERT' + #9 + 'PLAZO' + #9 + 'FECHA VENC' + #9 + 'MODALIDAD' + #9 + 'TASA NOM' + #9 + 'TASA EFECT' + #9 +
                'INT CAUSADO' + #9 + 'SALDO' + #9 + 'DEP INICIAL' + #9 + 'NO CUENTA' + #9 + 'GMF' + #9 + 'FECHA ACEPTA' + #9 + 'ESTADO CTA' + #9 + 'BAJO MONTO' + #9 + 'FECHA NAC' + #9 + 'SEXO' + #9 + 'CIIU' + #9 + 'VALORCUOTA' ;
      Writeln(F,Cadena);
      Ahorros;
      Contractuales;
      Cdat;
      CloseFile(F);
      IBAgencia.Close;
    end
   else
    begin
      while not IBAgencia.Eof do
       begin
         NRuta := dbpath1 + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + FormatCurr('00',MonthOf(FechaCorte)) + FormatCurr('0000',YearOf(FechaCorte)) + '/';
         lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';
         Database.DataBaseName := DBserver1 + ':' + NRuta + DBname;
         Database.Params.Values['lc_ctype'] := 'ISO8859_1';
         Database.Params.Values['User_Name'] := 'SYSDBA';
         Database.Params.Values['PassWord'] := 'masterkey';
         Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
         try
           Database.Connected := True;
         except
           raise;
         end;

         Cadena := IntToStr(YearOf(FechaCorte)) + IntToStr(MonthOf(FechaCorte)) + IntToStr(DayOf(FechaCorte));
         AssignFile(F,'C:/PlanosFinMes/CAPTACIONES' + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + Cadena + '.TXT');

         FechaInicial := EncodeDate(YearOf(FechaCorte),01,01);

         Rewrite(F);
         Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'ASOCIADO' + #9 + 'CODIGO CONTABLE' + #9 + 'NOMBRE DEPOSITO' + #9 + 'TIPO AHORRO' + #9 +
                   'AMORTIZACION' + #9 +'FECHA APERT' + #9 + 'PLAZO' + #9 + 'FECHA VENC' + #9 + 'MODALIDAD' + #9 + 'TASA NOM' + #9 + 'TASA EFECT' + #9 +
                   'INT CAUSADO' + #9 + 'SALDO' + #9 + 'DEP INICIAL' + #9 + 'NO CUENTA' + #9 + 'GMF' + #9 + 'FECHA ACEPTA' + #9 + 'ESTADO CTA' + #9 + 'BAJO MONTO' + #9 + 'FECHA NAC' + #9 + 'SEXO' + #9 + 'CIIU' + #9 + 'VALORCUOTA' ;
         Writeln(F,Cadena);
         Ahorros;
         Contractuales;
         Cdat;
         CloseFile(F);
         Database.Close;
         IBAgencia.Next;
       end;  // fin while Agencias
    end;  //Fin if TipoProceso

   lblEstado.Caption := 'Proceso Terminado con Exito';
end;

procedure TfrmReporteCaptacionesFogacoop.BitBtn1Click(Sender: TObject);
var Archivo:string;

begin
        SaveDialog1.DefaultExt := 'TXT';
        SaveDialog1.InitialDir := 'C:\Planos';
        SaveDialog1.Title := 'Guardar Como:';
        SaveDialog1.Execute;
        Archivo := SaveDialog1.FileName;
        AssignFile(F,Archivo);
end;

procedure TfrmReporteCaptacionesFogacoop.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

function TfrmReporteCaptacionesFogacoop.Asociado(TipoId:Integer;IdPersona:string):string;
begin
        with IBSQL4 do begin
         Close;
         SQL.Clear;
         SQL.Add('select NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO from "gen$persona"');
         SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA');
         ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
         ParamByName('ID_PERSONA').AsString := IDPersona;
         ExecQuery;
         Result := Trim(FieldByName('NOMBRE').AsString) + ' ' + Trim(FieldByName('PRIMER_APELLIDO').AsString) + ' ' + Trim(FieldByName('SEGUNDO_APELLIDO').AsString);
         Close;
        end;
end;

procedure TfrmReporteCaptacionesFogacoop.SinAportesGetValue(
  const ParName: String; var ParValue: Variant);
begin
        if ParName = 'Fecha' then ParValue := fFechaActual;
end;

procedure TfrmReporteCaptacionesFogacoop.Contractuales;
var
frmProgreso:TfrmProgreso;
fecha_a: TDateTime;
plazo: Integer;
fecha_v: TDateTime;
_amortizacion: Integer;
begin
    Tp := 5;
    frmProgreso := TfrmProgreso.Create(Self);
    if IBSQL1.Transaction.InTransaction then
       IBSQL1.Transaction.Rollback;
    IBSQL1.Transaction.StartTransaction;
    frmProgreso.Min := 0;
    frmProgreso.Max := 1;
    frmProgreso.Position := 0;
    frmProgreso.Ejecutar;
    // Procesar ID_TIPO_CAPTACION
    frmProgreso.Min := 0;
    with IBSQL1 do begin
     Close;
     SQL.Clear;
     SQL.Add('select count(*) as TOTAL from "cap$causacioncon" where ANO =:ANO and MES = :MES');
     ParamByName('ANO').AsInteger := yearof(EdFechaCorte.Date);
     ParamByName('MES').AsInteger := monthof(EdFechaCorte.Date);
     try
       ExecQuery;
       Total := FieldByName('TOTAL').AsInteger;
       if Total < 1 then
         begin
           MessageDlg('No hay registros para trabajar',mtInformation,[mbok],0);
         end;
     except
      Transaction.Rollback;
      raise;
      Exit;
     end;
     frmProgreso.Max := Total;
     frmProgreso.InfoLabel := 'Buscando AHORRO CONTRACTUAL a Trabajar';
     Posicion := 0;
     Application.ProcessMessages;
     Close;
     SQL.Clear;
     SQL.Add('select * from "cap$causacioncon" where ANO = :ANO and MES = :MES');
     ParamByName('ANO').AsInteger := yearof(EdFechaCorte.Date);
     ParamByName('MES').AsInteger := monthof(EdFechaCorte.Date);
     try
      ExecQuery;
     except
      frmProgreso.Cerrar;
      Transaction.Rollback;
      raise;
      Exit;
     end;

    while not Eof do begin
     frmProgreso.InfoLabel := 'Analizando Captación ' +
                              IntToStr(FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                              Format('%.2d',[agencia])+'-'+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+
                              '-'+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
     Posicion := Posicion + 1;
     frmProgreso.Position := Posicion;
     Application.ProcessMessages;

     SaldoInicial := FieldByName('VALOR_INICIAL').AsCurrency;
     Application.ProcessMessages;

     IBQuery2.Close;
     IBQuery2.SQL.Clear;
     IBQuery2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:ID,:CTA,:DG,:ANO,:FECHA_INICIAL,:FECHA_FINAL)');
     IBQuery2.ParamByName('ID').AsInteger  := FieldByName('ID_TIPO_CAPTACION').AsInteger;
     IBQuery2.ParamByName('AG').AsInteger  := FieldByName('ID_AGENCIA').AsInteger;
     IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
     IBQuery2.ParamByName('DG').AsInteger  := FieldByName('DIGITO_CUENTA').AsInteger;
     IBQuery2.ParamByName('ANO').AsString  := IntToStr(YearOf(EdFechaCorte.Date));
     IBQuery2.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
     IBQuery2.ParamByName('FECHA_FINAL').AsDate := EdFechaCorte.Date;
     try
      IBQuery2.Open;
      Saldo := IBQuery2.FieldByName('SALDO_ACTUAL').AsCurrency;
     except
      frmProgreso.Cerrar;
      IBQuery2.Transaction.Rollback;
      raise;
      Exit;
     end; // try
//     if Saldo = 0 then begin
       

     IBQuery2.Close;
     IBQuery2.SQL.Clear;
     IBQuery2.SQL.Add('select "cap$tipocaptacion".DESCRIPCION,"cap$tipocaptacion".CODIGO_CONTABLE from "cap$tipocaptacion"');
     IBQuery2.SQL.Add('where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
     IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
     try
       IBQuery2.Open;
     except
       frmProgreso.Cerrar;
       Transaction.Rollback;
       raise;
       Exit;
     end;

     New(AR);
     case FieldByName('ID_IDENTIFICACION').AsInteger of
       3: AR^.TipoId := 'C';
       4: AR^.TipoId := 'N';
       1: AR^.TipoId := 'R';
       2: AR^.TipoId := 'I'
       else AR^.TipoId := 'O';
     end;

     if AR^.TipoId = 'N' then
       AR^.Identificacion := MidStr(FieldByName('ID_PERSONA').AsString,1,3) + '-' +
                             MidStr(FieldByName('ID_PERSONA').AsString,4,3) + '-' +
                             MidStr(FieldByName('ID_PERSONA').AsString,7,3) + '-' +
                             MidStr(FieldByName('ID_PERSONA').AsString,10,1)
     else
       AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
     AR^.Nombre := Trim(FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
                   Trim(FieldByName('SEGUNDO_APELLIDO').AsString) + ' ' +
                   Trim(FieldByName('NOMBRE').AsString);
     AR^.Codigo := LeftStr(IBQuery2.FieldByName('CODIGO_CONTABLE').AsString,6);
     AR^.NombreDepos := IBQuery2.FieldByName('DESCRIPCION').AsString;
     AR^.TipoAho := 3;
     AR^.Amortiza := 30;
     AR^.FechaApertura := FieldByName('FECHA_APERTURA').AsString;
     fecha_a := FieldByName('FECHA_APERTURA').AsDateTime;

     IBQuery2.Close;
     IBQuery2.SQL.Clear;
     IBQuery2.SQL.Add('select "cap$tiposplancontractual".PLAZO from "cap$tiposplancontractual"');
     IBQuery2.SQL.Add('where ID_PLAN = :ID_PLAN');
     IBQuery2.ParamByName('ID_PLAN').AsInteger := FieldByName('ID_PLAN').AsInteger;
     try
       IBQuery2.Open;
     except
       frmProgreso.Cerrar;
       Transaction.Rollback;
       raise;
       Exit;
     end;
     AR^.Plazo := IBQuery2.FieldByName('PLAZO').AsInteger;
     plazo := IBQuery2.FieldByName('PLAZO').AsInteger;
     if (plazo > 360) then _amortizacion := 360
     else _amortizacion := plazo;
     fecha_v := CalculoFecha(fecha_a,plazo);
     AR^.FechaVencimiento := DateToStr(fecha_v);
     AR^.Modalidad := 2;
     AR^.TasaNominal := SimpleRoundTo(TasaNominalVencida(FieldByName('CUOTA').AsDouble,_amortizacion),-2);
     AR^.TasaEfectiva := SimpleRoundTo(FieldByName('CUOTA').AsDouble,-2);
     AR^.InteresCausado := FieldByName('CAUSACION_ACUMULADA').AsCurrency - FieldByName('RETEFUENTE_ACUMULADA').AsCurrency;
     AR^.Saldo := Saldo;
     AR^.DepositoInicial := Saldo;

     AR^.NumeroCuenta := IntToStr(Tp)+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);

     IBQuery2.Close;
     IBQuery2.SQL.Clear;
     IBQuery2.SQL.Add('SELECT "gen$persona".SEXO, "gen$persona".FECHA_NACIMIENTO, "gen$persona".ID_CIIU');
     IBQuery2.SQL.Add('FROM "cap$maestrotitular" INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
     IBQuery2.SQL.Add('AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA) WHERE ');
     IBQuery2.SQL.Add('("cap$maestrotitular".ID_AGENCIA = :AG) AND ("cap$maestrotitular".ID_TIPO_CAPTACION = :TIPO) AND');
     IBQuery2.SQL.Add('("cap$maestrotitular".NUMERO_CUENTA = :CTA) AND ("cap$maestrotitular".DIGITO_CUENTA = :DIG) AND ("cap$maestrotitular".NUMERO_TITULAR = :TITULAR)');
     IBQuery2.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
     IBQuery2.ParamByName('TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
     IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
     IBQuery2.ParamByName('DIG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
     if Tp = 4 then
       IBQuery2.ParamByName('TITULAR').AsInteger := 2
     else
       IBQuery2.ParamByName('TITULAR').AsInteger := 1;
      try
       IBQuery2.Open;
       AR^.FechaNacimiento := DateToStr(IBQuery2.FieldByName('FECHA_NACIMIENTO').AsDateTime);
       AR^.Sexo := IBQuery2.FieldByName('SEXO').AsString;
       AR^.Ciiu := IBQuery2.FieldByName('ID_CIIU').AsString;
      except
       frmProgreso.Cerrar;
       IBQuery2.Transaction.Rollback;
       raise;
       Exit;
      end; // try
     Application.ProcessMessages;


     AR^.Excenta := 0;
     AR^.FechaAceptacion := '';
     AR^.EstadoCta := '1';
     AR^.BajoMonto := '0';
     AR^.ValorCuota := FieldByName('VALOR_INICIAL').AsCurrency;

     Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.Nombre +#9+ AR^.Codigo + #9 +
               AR^.NombreDepos + #9 + IntToStr(AR^.TipoAho) + #9 + IntToStr(AR^.Amortiza) + #9 +
               AR^.FechaApertura + #9 + IntToStr(AR^.Plazo) + #9 + AR^.FechaVencimiento + #9 +
               IntToStr(AR^.Modalidad) + #9 + Format('%2.2f',[AR^.TasaNominal]) + #9 + Format('%2.2f',[AR^.TasaEfectiva]) + #9 +
               FormatCurr('0.00',AR^.InteresCausado) + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + FormatCurr('0.00',AR^.DepositoInicial) + #9 +
               AR^.NumeroCuenta + #9 + IntToStr(AR^.Excenta) + #9 + AR^.FechaAceptacion + #9 + AR^.EstadoCta + #9 + AR^.BajoMonto + #9 + AR^.FechaNacimiento + #9 + AR^.Sexo + #9 + AR^.Ciiu + #9 + CurrToStr(AR^.ValorCuota);
     Dispose(AR);
     Append(F);
     Writeln(F,cadena);
     Next;
   end; // while
  end; // with
  frmProgreso.Cerrar;
end;

procedure TfrmReporteCaptacionesFogacoop.Cdat;
var
fecha_a: TDateTime;
plazo: Integer;
fecha_v: TDateTime;
begin
    Tp := 6;
    frmProgreso := TfrmProgreso.Create(Self);
    if IBSQL1.Transaction.InTransaction then
       IBSQL1.Transaction.Rollback;
    IBSQL1.Transaction.StartTransaction;
    frmProgreso.Min := 0;
    frmProgreso.Max := 1;
    frmProgreso.Position := 0;
    frmProgreso.Ejecutar;
    // Procesar ID_TIPO_CAPTACION
    frmProgreso.Min := 0;
    with IBSQL1 do begin
     Close;
     SQL.Clear;
     SQL.Add('select count(*) as TOTAL from "cap$causacioncdat" where ANO =:ANO and MES = :MES');
     ParamByName('ANO').AsInteger := yearof(EdFechaCorte.Date);
     ParamByName('MES').AsInteger := monthof(EdFechaCorte.Date);
     try
      ExecQuery;
      Total := FieldByName('TOTAL').AsInteger;
      if Total < 1 then
        begin
          MessageDlg('No hay registros para trabajar',mtInformation,[mbok],0);
        end;
      except
       Transaction.Rollback;
       raise;
       Exit;
      end;

    frmProgreso.Max := Total;
    frmProgreso.InfoLabel := 'Buscando CDAT a Trabajar';
    Posicion := 0;
    Application.ProcessMessages;

    Close;
    SQL.Clear;
    SQL.Add('select * from "cap$causacioncdat" where ANO = :ANO and MES = :MES');
    ParamByName('ANO').AsInteger := yearof(EdFechaCorte.Date);
    ParamByName('MES').AsInteger := monthof(EdFechaCorte.Date);
    try
     ExecQuery;
    except
     frmProgreso.Cerrar;
     Transaction.Rollback;
     raise;
     Exit;
    end;

    while not Eof do begin
     frmProgreso.InfoLabel := 'Analizando Captación ' +
                              IntToStr(FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                              Format('%.2d',[agencia])+'-'+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+
                              '-'+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
     Posicion := Posicion + 1;
     frmProgreso.Position := Posicion;
     Application.ProcessMessages;

     SaldoInicial := FieldByName('VALOR_INICIAL').AsCurrency;

     IBQuery2.Close;
     IBQuery2.SQL.Clear;
     IBQuery2.SQL.Add('select "cap$tipocaptacion".DESCRIPCION,"cap$tipocaptacion".CODIGO_CONTABLE from "cap$tipocaptacion"');
     IBQuery2.SQL.Add('where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
     IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
     try
      IBQuery2.Open;
      except
      frmProgreso.Cerrar;
      Transaction.Rollback;
      raise;
      Exit;
     end;

     New(AR);
     case FieldByName('ID_IDENTIFICACION').AsInteger of
       3: AR^.TipoId := 'C';
       4: AR^.TipoId := 'N';
       1: AR^.TipoId := 'R';
       2: AR^.TipoId := 'I'
       else AR^.TipoId := 'O';
     end;

     if AR^.TipoId = 'N' then
       AR^.Identificacion := MidStr(FieldByName('ID_PERSONA').AsString,1,3) + '-' +
                             MidStr(FieldByName('ID_PERSONA').AsString,4,3) + '-' +
                             MidStr(FieldByName('ID_PERSONA').AsString,7,3) + '-' +
                             MidStr(FieldByName('ID_PERSONA').AsString,10,1)
     else
       AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
     AR^.Nombre := Trim(FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
                   Trim(FieldByName('SEGUNDO_APELLIDO').AsString) + ' ' +
                   Trim(FieldByName('NOMBRE').AsString);

     AR^.Codigo := LeftStr(IBQuery2.FieldByName('CODIGO_CONTABLE').AsString,6);
     if FieldByName('PLAZO_CUENTA').AsInteger < 180 then
       AR^.Codigo := '211005'
     else
       AR^.Codigo := '211010';
     if FieldByName('PLAZO_CUENTA').AsInteger > 360 then
       AR^.Codigo := '211015';

     AR^.NombreDepos := IBQuery2.FieldByName('DESCRIPCION').AsString;
     AR^.TipoAho := 2;
     AR^.Amortiza := FieldByName('AMORTIZACION').AsInteger;
     AR^.FechaApertura := FieldByName('FECHA_APERTURA').AsString;
     fecha_a :=  FieldByName('FECHA_APERTURA').AsDateTime;
     AR^.Plazo := FieldByName('PLAZO_CUENTA').AsInteger;
     plazo := FieldByName('PLAZO_CUENTA').AsInteger;
     fecha_v := CalculoFecha(fecha_a, plazo);
//     AR^.FechaVencimiento := DateToStr(EdFechaCorte.Date);
     AR^.FechaVencimiento := DateToStr(fecha_v);
     if FieldByName('FECHA_PRORROGA').AsDateTime > FieldByName('FECHA_APERTURA').AsDateTime then begin
       FechaA := FieldByName('FECHA_PRORROGA').AsDateTime;
       FechaV := CalculoFecha(FechaA,AR^.Plazo);
       //AR^.FechaApertura := DateToStr(FechaA);
       AR^.FechaVencimiento := DateToStr(FechaV);
     end;

     if FieldByName('MODALIDAD').AsString = 'A' then
       AR^.Modalidad := 1
     else
       AR^.Modalidad := 2;

     AR^.TasaEfectiva := FieldByName('TASA_EFECTIVA').AsFloat;
     AR^.TasaNominal := TasaNominalVencida(AR^.TasaEfectiva,Ar^.Amortiza);
     AR^.InteresCausado := FieldByName('NETO_TOTAL').AsCurrency;
     AR^.Saldo := FieldByName('VALOR_INICIAL').AsCurrency;
     AR^.DepositoInicial := FieldByName('VALOR_INICIAL').AsCurrency;
     AR^.NumeroCuenta := IntToStr(Tp)+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);

     IBQuery2.Close;
     IBQuery2.SQL.Clear;
     IBQuery2.SQL.Add('SELECT "gen$persona".SEXO, "gen$persona".FECHA_NACIMIENTO, "gen$persona".ID_CIIU');
     IBQuery2.SQL.Add('FROM "cap$maestrotitular" INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
     IBQuery2.SQL.Add('AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA) WHERE ');
     IBQuery2.SQL.Add('("cap$maestrotitular".ID_AGENCIA = :AG) AND ("cap$maestrotitular".ID_TIPO_CAPTACION = :TIPO) AND');
     IBQuery2.SQL.Add('("cap$maestrotitular".NUMERO_CUENTA = :CTA) AND ("cap$maestrotitular".DIGITO_CUENTA = :DIG) AND ("cap$maestrotitular".NUMERO_TITULAR = :TITULAR)');
     IBQuery2.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
     IBQuery2.ParamByName('TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
     IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
     IBQuery2.ParamByName('DIG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
     if Tp = 4 then
       IBQuery2.ParamByName('TITULAR').AsInteger := 2
     else
       IBQuery2.ParamByName('TITULAR').AsInteger := 1;
      try
       IBQuery2.Open;
       AR^.FechaNacimiento := DateToStr(IBQuery2.FieldByName('FECHA_NACIMIENTO').AsDateTime);
       AR^.Sexo := IBQuery2.FieldByName('SEXO').AsString;
       AR^.Ciiu := IBQuery2.FieldByName('ID_CIIU').AsString;
      except
       frmProgreso.Cerrar;
       IBQuery2.Transaction.Rollback;
       raise;
       Exit;
      end; // try
     Application.ProcessMessages;
     

     AR^.Excenta := 0;
     AR^.FechaAceptacion := '';
     AR^.EstadoCta := '1';
     AR^.BajoMonto := '0';
     AR^.ValorCuota := 0;

     Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.Nombre +#9+ AR^.Codigo + #9 +
               AR^.NombreDepos + #9 + IntToStr(AR^.TipoAho) + #9 + IntToStr(AR^.Amortiza) + #9 +
               AR^.FechaApertura + #9 + IntToStr(AR^.Plazo) + #9 + AR^.FechaVencimiento + #9 +
               IntToStr(AR^.Modalidad) + #9 + Format('%2.2f',[AR^.TasaNominal]) + #9 + Format('%2.2f',[AR^.TasaEfectiva]) + #9 +
               FormatCurr('0.00',AR^.InteresCausado) + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + FormatCurr('0.00',AR^.DepositoInicial) + #9 +
               AR^.NumeroCuenta + #9 + IntToStr(AR^.Excenta) + #9 + AR^.FechaAceptacion + #9 + AR^.EstadoCta + #9 + AR^.BajoMonto + #9 + AR^.FechaNacimiento + #9 + AR^.Sexo + #9 + AR^.Ciiu + #9 + CurrToStr(AR^.ValorCuota);
     Dispose(AR);
     Append(F);
     Writeln(F,cadena);
//     CloseFile(F);
     Next;
    end; // while
   end; // with
   frmProgreso.Cerrar;
end;

procedure TfrmReporteCaptacionesFogacoop.Ahorros;
var
FActualizacion:TDate;
begin
    frmProgreso := TfrmProgreso.Create(Self);
    if IBSQL1.Transaction.InTransaction then
       IBSQL1.Transaction.Rollback;
    IBSQL1.Transaction.StartTransaction;
    frmProgreso.Min := 0;
    frmProgreso.Max := 1;
    frmProgreso.Position := 0;
    frmProgreso.Ejecutar;
    // Procesar ID_TIPO_CAPTACION
    frmProgreso.Min := 0;
    with IBSQL1 do begin
     Close;
     SQL.Clear;
     SQL.Add('select * from P_CAP_0000T(:FECHA_CORTE)');
     ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
     try
      ExecQuery;
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
     frmProgreso.InfoLabel := 'Buscando CAPTACION a Trabajar';
     Posicion := 0;
     Application.ProcessMessages;
     Close;
     SQL.Clear;
     SQL.Add('select * from P_CAP_0000(:FECHA_CORTE)');
     ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
     try
       ExecQuery;
     except
       frmProgreso.Cerrar;
       Transaction.Rollback;
       raise;
       Exit;
     end;

     while not Eof do begin
      frmProgreso.InfoLabel := 'Analizando Captación ' +
                               IntToStr(FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                               Format('%.2d',[agencia])+'-'+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+
                               '-'+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
      Posicion := Posicion + 1;
      frmProgreso.Position := Posicion;
      Application.ProcessMessages;

      IBQuery2.Close;
      IBQuery2.SQL.Clear;
      IBQuery2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:ID,:CTA,:DG,:ANO,:FECHA_INICIAL,:FECHA_FINAL)');
      IBQuery2.ParamByName('ID').AsInteger  := FieldByName('ID_TIPO_CAPTACION').AsInteger;
      IBQuery2.ParamByName('AG').AsInteger  := FieldByName('ID_AGENCIA').AsInteger;
      IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
      IBQuery2.ParamByName('DG').AsInteger  := FieldByName('DIGITO_CUENTA').AsInteger;
      IBQuery2.ParamByName('ANO').AsString  := IntToStr(YearOf(EdFechaCorte.Date));
      IBQuery2.ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
      IBQuery2.ParamByName('FECHA_FINAL').AsDate := EdFechaCorte.Date;
      try
       IBQuery2.Open;
       Saldo := IBQuery2.FieldByName('SALDO_ACTUAL').AsCurrency;
      except
       frmProgreso.Cerrar;
       IBQuery2.Transaction.Rollback;
       raise;
       Exit;
      end; // try
     Application.ProcessMessages;

  //   {
     if Saldo < 0 then begin
       CDSaldosRojo.Open;
       CDSaldosRojo.Append;
       CDSaldosRojo.FieldByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
       CDSaldosRojo.FieldByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
       CDSaldosRojo.FieldByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
       CDSaldosRojo.FieldByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
       CDSaldosRojo.FieldByName('ID_IDENTIFICACION').AsInteger := IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger;
       CDSaldosRojo.FieldByName('ID_PERSONA').AsString := IBSQL1.FieldByName('ID_PERSONA').AsString;
       CDSaldosRojo.FieldByName('ASOCIADO').AsString := IBSQL1.FieldByName('NOMBRE').AsString + ' ' + IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString;
       // asociado(IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger,IBSQL1.FieldByName('ID_PERSONA').AsString);
       CDSaldosRojo.FieldByName('SALDO').AsCurrency := Saldo;
       CDSaldosRojo.Post;
     end;

     if Saldo > 0 then begin
       with IBSQL2 do BEGIN
         Close;
         SQL.Clear;
         SQL.Add('SELECT "cap$maestro".NUMERO_CUENTA,"cap$maestro".DIGITO_CUENTA');
         SQL.Add('FROM "cap$maestro" INNER JOIN "cap$maestrotitular" ON ');
         SQL.Add(' ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA) AND');
         SQL.Add(' ("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION) AND');
         SQL.Add(' ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
         SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
         SQL.Add('WHERE ("cap$maestro".ID_ESTADO = 1) AND ("cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
         SQL.Add('("cap$maestrotitular".ID_PERSONA = :ID_PERSONA) AND "cap$maestro".ID_TIPO_CAPTACION = 1');
         ParamByName('ID_IDENTIFICACION').AsInteger := IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger;
         ParamByName('ID_PERSONA').AsString := IBSQL1.FieldByName('ID_PERSONA').AsString;
         ExecQuery;
         if RecordCount < 0 then begin
           CDSinAportes.Open;
           CDSinAportes.Append;
           CDSinAportes.FieldByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
           CDSinAportes.FieldByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
           CDSinAportes.FieldByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
           CDSinAportes.FieldByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
           CDSinAportes.FieldByName('ID_IDENTIFICACION').AsInteger := IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger;
           CDSinAportes.FieldByName('ID_PERSONA').AsString := IBSQL1.FieldByName('ID_PERSONA').AsString;
           CDSinAportes.FieldByName('ASOCIADO').AsString := IBSQL1.FieldByName('NOMBRE').AsString + ' ' + IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString;
           CDSinAportes.FieldByName('SALDO').AsCurrency := Saldo;
           CDSinAportes.Post;
         end;
         Close;
       end;
     end;      //}

     Tp := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
     if (Tp = 6) and ((IBSQL1.FieldByName('ID_ESTADO').AsInteger <> 1) and (IBSQL1.FieldByName('ID_ESTADO').AsInteger <> 6)) then
       begin
         Next;
         Continue;
       end;

     if Tp <> 6 then
       if Saldo = 0 then
         begin
           Next;
           Continue;
         end;

     IBQuery2.Close;
     IBQuery2.SQL.Clear;
     IBQuery2.SQL.Add('select "cap$tipocaptacion".DESCRIPCION,"cap$tipocaptacion".CODIGO_CONTABLE, "cap$tipocaptacion".INTERES_EFECTIVO from "cap$tipocaptacion"');
     IBQuery2.SQL.Add('where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
     IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
     try
      IBQuery2.Open;
     except
      frmProgreso.Cerrar;
      Transaction.Rollback;
      raise;
      Exit;
     end;

     New(AR);
     case FieldByName('ID_IDENTIFICACION').AsInteger of
       3: AR^.TipoId := 'C';
       4: AR^.TipoId := 'N';
       1: AR^.TipoId := 'R';
       2: AR^.TipoId := 'I'
       else AR^.TipoId := 'O';
     end;

     if AR^.TipoId = 'N' then
       AR^.Identificacion := MidStr(FieldByName('ID_PERSONA').AsString,1,3) + '-' +
                             MidStr(FieldByName('ID_PERSONA').AsString,4,3) + '-' +
                             MidStr(FieldByName('ID_PERSONA').AsString,7,3) + '-' +
                             MidStr(FieldByName('ID_PERSONA').AsString,10,1)
     else
       AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
     AR^.Nombre := Trim(IBSQL1.FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
                   Trim(IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString) + ' ' +
                   Trim(IBSQL1.FieldByName('NOMBRE').AsString);

     AR^.Codigo := LeftStr(IBQuery2.FieldByName('CODIGO_CONTABLE').AsString,6);
     AR^.NombreDepos := IBQuery2.FieldByName('DESCRIPCION').AsString;
     if ((Tp = 2) or (Tp = 3) or (Tp = 4)) then
       AR^.TipoAho := 1
     else if Tp = 5 then
       AR^.TipoAho := 3
     else
       AR^.TipoAho := 2;

     AR^.Amortiza := 1;
     AR^.FechaApertura := IBSQL1.FieldByName('FECHA_APERTURA').AsString;
     AR^.Plazo := 0;
     AR^.FechaVencimiento := '';
     if FieldByName('MODALIDAD').AsString = 'A' then
       AR^.Modalidad := 1
     else
       AR^.Modalidad := 2;
     AR^.TasaNominal := SimpleRoundTo(TasaNominalVencida(IBQuery2.FieldByName('INTERES_EFECTIVO').AsFloat,30),-2);
     AR^.TasaEfectiva := SimpleRoundTo(IBQuery2.FieldByName('INTERES_EFECTIVO').AsFloat,-2);
     AR^.InteresCausado := 0;
     AR^.Saldo := Saldo;
     AR^.DepositoInicial := Saldo;
     AR^.NumeroCuenta := IntToStr(Tp)+Format('%.2d',[ibsql1.FieldByName('ID_AGENCIA').AsInteger])+Format('%.7d',[IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger])+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);

     IBQuery2.Close;
     IBQuery2.SQL.Clear;
     IBQuery2.SQL.Add('SELECT "gen$persona".SEXO, "gen$persona".FECHA_ACTUALIZACION, "gen$persona".FECHA_NACIMIENTO, "gen$persona".ID_CIIU');
     IBQuery2.SQL.Add('FROM "cap$maestrotitular" INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
     IBQuery2.SQL.Add('AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA) WHERE ');
     IBQuery2.SQL.Add('("cap$maestrotitular".ID_AGENCIA = :AG) AND ("cap$maestrotitular".ID_TIPO_CAPTACION = :TIPO) AND');
     IBQuery2.SQL.Add('("cap$maestrotitular".NUMERO_CUENTA = :CTA) AND ("cap$maestrotitular".DIGITO_CUENTA = :DIG) AND ("cap$maestrotitular".NUMERO_TITULAR = :TITULAR)');
     IBQuery2.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
     IBQuery2.ParamByName('TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
     IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
     IBQuery2.ParamByName('DIG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
     if Tp = 4 then
       IBQuery2.ParamByName('TITULAR').AsInteger := 2
     else
       IBQuery2.ParamByName('TITULAR').AsInteger := 1;
      try
       IBQuery2.Open;
       AR^.FechaNacimiento := DateToStr(IBQuery2.FieldByName('FECHA_NACIMIENTO').AsDateTime);
       AR^.Sexo := IBQuery2.FieldByName('SEXO').AsString;
       AR^.Ciiu := IBQuery2.FieldByName('ID_CIIU').AsString;
       FActualizacion := IBQuery2.FieldByName('FECHA_ACTUALIZACION').AsDateTime;
      except
       frmProgreso.Cerrar;
       IBQuery2.Transaction.Rollback;
       raise;
       Exit;
      end; // try
     Application.ProcessMessages;

     IBQuery2.Close;
     IBQuery2.SQL.Clear;
     IBQuery2.SQL.Add('select GMF, FECHA_CAMBIO from "cap$maestroexcentas" where ID_AGENCIA = :AG');
     IBQuery2.SQL.Add('AND ID_TIPO_CAPTACION = :TIPO AND NUMERO_CUENTA = :CTA AND DIGITO_CUENTA = :DIG');
     IBQuery2.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
     IBQuery2.ParamByName('TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
     IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
     IBQuery2.ParamByName('DIG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
     try
      IBQuery2.Open;
     except
      frmProgreso.Cerrar;
      Transaction.Rollback;
      raise;
      Exit;
     end;

     if IBQuery2.FieldByName('GMF').AsInteger = 1 then
      begin
        AR^.Excenta := 1;
        if VarIsEmpty(IBQuery2.FieldByName('FECHA_CAMBIO').AsVariant)  then
         AR^.FechaAceptacion := DateToStr(IBQuery2.FieldByName('FECHA_CAMBIO').AsDateTime)
        else
         AR^.FechaAceptacion := DateToStr(IBSQL1.FieldByName('FECHA_APERTURA').AsDate);
      end
     else
      begin
        AR^.Excenta := 0;
        AR^.FechaAceptacion := '';
      end;

     AR^.EstadoCta := '1';
     AR^.BajoMonto := '0';
     AR^.ValorCuota := 0;

     Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.Nombre +#9+ AR^.Codigo + #9 +
               AR^.NombreDepos + #9 + IntToStr(AR^.TipoAho) + #9 + IntToStr(AR^.Amortiza) + #9 +
               AR^.FechaApertura + #9 + IntToStr(AR^.Plazo) + #9 + AR^.FechaVencimiento + #9 +
               IntToStr(AR^.Modalidad) + #9 + Format('%2.2f',[AR^.TasaNominal]) + #9 + Format('%2.2f',[AR^.TasaEfectiva]) + #9 +
               FormatCurr('0.00',AR^.InteresCausado) + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + FormatCurr('0.00',AR^.DepositoInicial) + #9 +
               AR^.NumeroCuenta + #9 + IntToStr(AR^.Excenta) + #9 + AR^.FechaAceptacion + #9 + AR^.EstadoCta + #9 + AR^.BajoMonto + #9 + AR^.FechaNacimiento + #9 + AR^.Sexo + #9 + AR^.Ciiu + #9 + CurrToStr(AR^.ValorCuota);
     Dispose(AR);
     Append(F);
     Writeln(F,cadena);
     Next;
    end; // while
   end; // with

     if CDSinAportes.RecordCount > 0 then begin
//      if messagedlg('Guardar Archivo?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      try
       CDSinAportes.SaveToFile(RutaSalida + 'SinAportes' + IntToStr(agencia) + '.TXT',dfXMLUTF8);
      finally
      end;
{       SinAportes.LoadFromFile(frmMain.ruta+'\Reportes\SinAportes.frf');
       FrmImpresion := FrmImpresion.Create(Self);
       SinAportes.Preview := FrmImpresion.frPreview1;
       SinAportes.ShowReport;
       FrmImpresion.ShowModal;}
     end;


     if CDSaldosRojo.RecordCount > 0 then begin
//      if messagedlg('Guardar Archivo?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      try
       CDSaldosRojo.SaveToFile(RutaSalida + 'SaldosRojo' + IntToStr(agencia) + '.xml',dfXML);
      finally
      end;
 {      SaldosRojo.LoadFromFile(frmMain.ruta+'\Reportes\SinAportes.frf');
       FrmImpresion := FrmImpresion.Create(Self);
       SaldosRojo.Preview := FrmImpresion.frPreview1;
       SaldosRojo.ShowReport;
       FrmImpresion.ShowModal;  }
     end;
     frmProgreso.Cerrar;
end;

procedure TfrmReporteCaptacionesFogacoop.EdFechaCorteExit(Sender: TObject);
begin
        FechaCorte := EdFechaCorte.Date;
end;

end.
