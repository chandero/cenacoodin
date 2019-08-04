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
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SinAportesGetValue(const ParName: String;
      var ParValue: Variant);
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
      Excenta:Integer;
      FechaAceptacion:string;
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

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso,UnitImpresion,
     UnitMain;

procedure TfrmReporteCaptacionesFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteCaptacionesFogacoop.CmdProcesoClick(Sender: TObject);
begin
    lblEstado.Caption := 'Procesando  ...';
    Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + IntToStr(MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
    AssignFile(F,'C:/PlanosFinMes/CAPTACIONES' + Cadena + '.TXT');
    //AssignFile(F,'C:/PlanosFinMes/Captaciones' + Cadena);

    FechaInicial := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
    Agencia := 1;

    Rewrite(F);
    Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'ASOCIADO' + #9 + 'CODIGO CONTABLE' + #9 + 'NOMBRE DEPOSITO' + #9 + 'TIPO AHORRO' + #9 +
              'AMORTIZACION' + #9 +'FECHA APERT' + #9 + 'PLAZO' + #9 + 'FECHA VENC' + #9 + 'MODALIDAD' + #9 + 'TASA NOM' + #9 + 'TASA EFECT' + #9 +
              'INT CAUSADO' + #9 + 'SALDO' + #9 + 'DEP INICIAL' + #9 + 'NO CUENTA' + #9 + 'GMF';
    Writeln(F,Cadena);
    Ahorros;
    Contractuales;
    Cdat;
    CloseFile(F);

    lblEstado.Caption := 'Proceso Terminado con Exito';
end;

procedure TfrmReporteCaptacionesFogacoop.BitBtn1Click(Sender: TObject);
var Archivo:string;

begin
        SaveDialog1.DefaultExt := 'TXT';
        SaveDialog1.InitialDir := 'C:\PlanosFinMes';
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
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO');
         SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :IDPersona');
         ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
         ParamByName('ID_PERSONA').AsString := IDPersona;
         ExecQuery;
         Result := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
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
           frmProgreso.Cerrar;
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
     IBQuery2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_PLANOS(:AG,:ID,:CTA,:DG,:ANO,:FECHA_INICIAL,:FECHA_FINAL)');
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
     if FieldByName('ID_IDENTIFICACION').AsInteger = 3 then
       AR^.TipoId := 'C'
     else AR^.TipoId := 'O';
     AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
     AR^.Nombre := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                   FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                   FieldByName('NOMBRE').AsString;
     AR^.Codigo := LeftStr(IBQuery2.FieldByName('CODIGO_CONTABLE').AsString,6);
     AR^.NombreDepos := IBQuery2.FieldByName('DESCRIPCION').AsString;
     AR^.TipoAho := 3;
     AR^.Amortiza := 30;
     AR^.FechaApertura := FieldByName('FECHA_APERTURA').AsString;

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
     AR^.FechaVencimiento := DateToStr(EdFechaCorte.Date);
     AR^.Modalidad := 2;
     AR^.TasaNominal := SimpleRoundTo(1,-2);
     AR^.TasaEfectiva := SimpleRoundTo(1,-2);
     AR^.InteresCausado := FieldByName('CAUSACION_ACUMULADA').AsCurrency - FieldByName('RETEFUENTE_ACUMULADA').AsCurrency;
     AR^.Saldo := Saldo;
     AR^.DepositoInicial := Saldo;

     AR^.NumeroCuenta := IntToStr(Tp)+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
     AR^.Excenta := 0;
     AR^.FechaAceptacion := '';
     Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.Nombre +#9+ AR^.Codigo + #9 +
               AR^.NombreDepos + #9 + IntToStr(AR^.TipoAho) + #9 + IntToStr(AR^.Amortiza) + #9 +
               AR^.FechaApertura + #9 + IntToStr(AR^.Plazo) + #9 + AR^.FechaVencimiento + #9 +
               IntToStr(AR^.Modalidad) + #9 + Format('%2.2f',[AR^.TasaNominal]) + #9 + Format('%2.2f',[AR^.TasaEfectiva]) + #9 +
               FormatCurr('0.00',AR^.InteresCausado) + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + FormatCurr('0.00',AR^.DepositoInicial) + #9 +
               AR^.NumeroCuenta + #9 + IntToStr(AR^.Excenta) + #9 + AR^.FechaAceptacion;
     Dispose(AR);
     Append(F);
     Writeln(F,cadena);
     Next;
   end; // while
  end; // with
  frmProgreso.Cerrar;
end;

procedure TfrmReporteCaptacionesFogacoop.Cdat;
begin
    Tp := 6;
//    Rewrite(F);
//    CloseFile(F);
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
          Transaction.Rollback;
          Exit;
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
     if FieldByName('ID_IDENTIFICACION').AsInteger = 3 then
       AR^.TipoId := 'C'
     else AR^.TipoId := 'O';
     AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
     AR^.Nombre := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                   FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                   FieldByName('NOMBRE').AsString;

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
     AR^.Plazo := FieldByName('PLAZO_CUENTA').AsInteger;
//     AR^.FechaVencimiento := DateToStr(EdFechaCorte.Date);
     AR^.FechaVencimiento := DateToStr(CalculoFecha(FieldByName('FECHA_APERTURA').AsDate,AR^.Plazo));
     if FieldByName('FECHA_PRORROGA').AsDateTime > FieldByName('FECHA_APERTURA').AsDateTime then begin
       FechaA := FieldByName('FECHA_PRORROGA').AsDateTime;
       FechaV := CalculoFecha(FechaA,AR^.Plazo);
       AR^.FechaApertura := DateToStr(FechaA);
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
     AR^.Excenta := 0;
     AR^.FechaAceptacion := '';
     Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.Nombre +#9+ AR^.Codigo + #9 +
               AR^.NombreDepos + #9 + IntToStr(AR^.TipoAho) + #9 + IntToStr(AR^.Amortiza) + #9 +
               AR^.FechaApertura + #9 + IntToStr(AR^.Plazo) + #9 + AR^.FechaVencimiento + #9 +
               IntToStr(AR^.Modalidad) + #9 + Format('%2.2f',[AR^.TasaNominal]) + #9 + Format('%2.2f',[AR^.TasaEfectiva]) + #9 +
               FormatCurr('0.00',AR^.InteresCausado) + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + FormatCurr('0.00',AR^.DepositoInicial) + #9 +
               AR^.NumeroCuenta + #9 + IntToStr(AR^.Excenta) + #9 + AR^.FechaAceptacion;
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

     {         if Saldo < 0 then begin
              CDSaldosRojo.Open;
              CDSaldosRojo.Append;
              CDSaldosRojo.FieldByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
              CDSaldosRojo.FieldByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
              CDSaldosRojo.FieldByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
              CDSaldosRojo.FieldByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
              CDSaldosRojo.FieldByName('ID_IDENTIFICACION').AsInteger := IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger;
              CDSaldosRojo.FieldByName('ID_PERSONA').AsString := IBSQL1.FieldByName('ID_PERSONA').AsString;
              CDSaldosRojo.FieldByName('ASOCIADO').AsString := asociado(FieldByName('ID_IDENTIFICACION').AsInteger,FieldByName('ID_PERSONA').AsString);
              CDSaldosRojo.FieldByName('SALDO').AsCurrency := Saldo;
              CDSaldosRojo.Post;
            end;

            if Saldo > 0 then begin
              with IBSQL2 do BEGIN
                Close;
                SQL.Clear;
                SQL.Add('SELECT "cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA');
                SQL.Add('FROM "cap$maestrotitular" INNER JOIN "cap$maestro" ON ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
                SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
                SQL.Add('WHERE ("cap$maestro".ID_ESTADO = 1) AND ("cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
                SQL.Add('("cap$maestrotitular".ID_PERSONA = :ID_PERSONA)');
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
                  CDSinAportes.FieldByName('ASOCIADO').AsString := asociado(FieldByName('ID_IDENTIFICACION').AsInteger,FieldByName('ID_PERSONA').AsString);
                  CDSinAportes.FieldByName('SALDO').AsCurrency := Saldo;
                  CDSinAportes.Post;
                end;
                Close;
               end;
              end;      }

     Tp := FieldByName('ID_TIPO_CAPTACION').AsInteger;
     if (Tp = 6) and ((FieldByName('ID_ESTADO').AsInteger <> 1) and (FieldByName('ID_ESTADO').AsInteger <> 6)) then
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
     if FieldByName('ID_IDENTIFICACION').AsInteger = 3 then
       AR^.TipoId := 'C'
     else AR^.TipoId := 'O';
       AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
     AR^.Nombre := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                   FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                   FieldByName('NOMBRE').AsString;

     AR^.Codigo := LeftStr(IBQuery2.FieldByName('CODIGO_CONTABLE').AsString,6);
     AR^.NombreDepos := IBQuery2.FieldByName('DESCRIPCION').AsString;
     if ((Tp = 2) or (Tp = 3) or (Tp = 4)) then
       AR^.TipoAho := 1
     else if Tp = 5 then
       AR^.TipoAho := 3
     else
       AR^.TipoAho := 2;

     AR^.Amortiza := 1;
     AR^.FechaApertura := FieldByName('FECHA_APERTURA').AsString;
     AR^.Plazo := 0;
     AR^.FechaVencimiento := DateToStr(EdFechaCorte.Date);
     if FieldByName('MODALIDAD').AsString = 'A' then
       AR^.Modalidad := 1
     else
       AR^.Modalidad := 2;
       AR^.TasaNominal := SimpleRoundTo(4,-2);
       AR^.TasaEfectiva := SimpleRoundTo(4.07,-2);
       AR^.InteresCausado := 0;
       AR^.Saldo := Saldo;
       AR^.DepositoInicial := Saldo;
       AR^.NumeroCuenta := IntToStr(Tp)+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
       AR^.Excenta := 0;
       AR^.FechaAceptacion := '';
       Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.Nombre +#9+ AR^.Codigo + #9 +
                 AR^.NombreDepos + #9 + IntToStr(AR^.TipoAho) + #9 + IntToStr(AR^.Amortiza) + #9 +
                 AR^.FechaApertura + #9 + IntToStr(AR^.Plazo) + #9 + AR^.FechaVencimiento + #9 +
                 IntToStr(AR^.Modalidad) + #9 + Format('%2.2f',[AR^.TasaNominal]) + #9 + Format('%2.2f',[AR^.TasaEfectiva]) + #9 +
                 FormatCurr('0.00',AR^.InteresCausado) + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + FormatCurr('0.00',AR^.DepositoInicial) + #9 +
                 AR^.NumeroCuenta + #9 + IntToStr(AR^.Excenta) + #9 + AR^.FechaAceptacion;
       Dispose(AR);
       Append(F);
       Writeln(F,cadena);
       Next;
      end; // while
     end; // with

     if CDSinAportes.RecordCount > 0 then begin
       SinAportes.LoadFromFile(frmMain.ruta+'\Reportes\SinAportes.frf');
       FrmImpresion := FrmImpresion.Create(Self);
       SinAportes.Preview := FrmImpresion.frPreview1;
       SinAportes.ShowReport;
       FrmImpresion.ShowModal;
     end;

     if CDSaldosRojo.RecordCount > 0 then begin
       SaldosRojo.LoadFromFile(frmMain.ruta+'\Reportes\SinAportes.frf');
       FrmImpresion := FrmImpresion.Create(Self);
       SaldosRojo.Preview := FrmImpresion.frPreview1;
       SaldosRojo.ShowReport;
       FrmImpresion.ShowModal;
     end;
     frmProgreso.Cerrar;
end;

end.
