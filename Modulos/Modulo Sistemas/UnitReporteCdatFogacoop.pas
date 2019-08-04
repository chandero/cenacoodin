unit UnitReporteCdatFogacoop;

interface

uses
  Windows, Messages, Math, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit;

type
  TfrmReporteCdatFogacoop = class(TForm)
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
    BitBtn1: TBitBtn;
    IBSQL1: TIBSQL;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type PCaptaciones=^ACaptaciones;
     ACaptaciones=Record
      TipoId:Integer;
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
      CausadoTotal:Currency;
      CausadoMensual:Currency;
      Retefuente:Currency;
      NetoCausado:Currency;
      Saldo:Currency;
      DepositoInicial:Currency;
      NumeroCuenta:string;
      Excenta:Integer;
      FechaAceptacion:string;
end;


var
  frmReporteCdatFogacoop: TfrmReporteCdatFogacoop;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso;

procedure TfrmReporteCdatFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteCdatFogacoop.CmdProcesoClick(Sender: TObject);
var frmProgreso:TfrmProgreso;
    Total,Posicion:Integer;
    SaldoInicial:Currency;
    Movimiento:Currency;
    AR:PCaptaciones;
    Verdadero:Boolean;
    Tp:Integer;
    FechaA,FechaV:TDate;
    Cadena:string;
    Archivo:TextFile;
begin
    Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + IntToStr(MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
    AssignFile(Archivo,'//Archivos/publico/PlanosFinMes/CDAT' + Cadena);
    Rewrite(Archivo);
    Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'ASOCIADO' + #9 + 'CODIGO CONTABLE' + #9 + 'NOMBRE DEPOSITO' + #9 + 'TIPO AHORRO' + #9 +
              'AMORTIZACION' + #9 +'FECHA APERT' + #9 + 'PLAZO' + #9 + 'FECHA VENC' + #9 + 'MODALIDAD' + #9 + 'TASA NOM' + #9 + 'TASA EFECT' + #9 +
              'TOTAL CAUSADO' + #9 + 'CAUSADO MENSUAL' + #9 + 'RETEFUENTE' + #9 + 'NETO CAUSADO' + #9 + 'SALDO' + #9 + 'DEP INICIAL' + #9 + 'NO CUENTA' + #9 + 'GMF';
    Writeln(Archivo,Cadena);
    CloseFile(Archivo);

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
          SQL.Add('select count(*) as TOTAL from "cap$causacioncdat" where ANO = :ANO and MES = :MES');
          ParamByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
          ParamByName('MES').AsInteger := MonthOf(EdFechaCorte.Date);
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
          SQL.Add('select "cap$causacioncdat".ID_IDENTIFICACION,"cap$causacioncdat".ID_PERSONA,"cap$causacioncdat".AMORTIZACION,');
          SQL.Add('"cap$causacioncdat".FECHA_APERTURA,"cap$causacioncdat".FECHA_PRORROGA,"cap$causacioncdat".PLAZO_CUENTA,');
          SQL.Add('"cap$causacioncdat".FECHA_VENCIMIENTO,"cap$causacioncdat".TASA_E,"cap$causacioncdat".CAUSACION_TOTAL,"cap$causacioncdat".CAUSACION_MENSUAL,');
          SQL.Add('"cap$causacioncdat".RETEFUENTE,"cap$causacioncdat".NETO_A_CAUSAR,"cap$causacioncdat".VALOR_INICIAL,');
          SQL.Add('"cap$causacioncdat".VALOR_INICIAL,"cap$causacioncdat".ID_TIPO_CAPTACION,"cap$causacioncdat".ID_AGENCIA,"cap$causacioncdat".NUMERO_CUENTA,');
          SQL.Add('"cap$causacioncdat".DIGITO_CUENTA,"gen$persona".NOMBRE,"gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO');
          SQL.Add('from "cap$causacioncdat"');
          SQL.Add('inner join "gen$persona" on ("cap$causacioncdat".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "cap$causacioncdat".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('where ANO = :ANO and MES = :MES');
          ParamByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
          ParamByName('MES').AsInteger := MonthOf(EdFechaCorte.Date);
          try
           ExecQuery;
          except
           frmProgreso.Cerrar;
           Transaction.Rollback;
           raise;
           Exit;
          end;

          while not Eof do begin
            frmProgreso.InfoLabel := 'Analizando CDAT' + '6' +
                                     Format('%.2d',[agencia])+'-'+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+
                                     '-'+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
            Posicion := Posicion + 1;
            frmProgreso.Position := Posicion;
            Application.ProcessMessages;

            New(AR);
            AR^.TipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
            AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
            AR^.Nombre := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                          FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                          FieldByName('NOMBRE').AsString;

            if FieldByName('PLAZO_CUENTA').AsInteger < 180 then
              AR^.Codigo := '211005'
            else if (FieldByName('PLAZO_CUENTA').AsInteger >= 180) and (FieldByName('PLAZO_CUENTA').AsInteger <= 360) then
              AR^.Codigo := '211010'
            else if FieldByName('PLAZO_CUENTA').AsInteger > 360 then
              AR^.Codigo := '211015';
            AR^.NombreDepos := 'C.D.A.T.';
            AR^.TipoAho := 2;
            AR^.Amortiza := FieldByName('AMORTIZACION').AsInteger;
            AR^.FechaApertura := FieldByName('FECHA_APERTURA').AsString;
            AR^.Plazo := FieldByName('PLAZO_CUENTA').AsInteger;
            AR^.FechaVencimiento := DateToStr(EdFechaCorte.Date);
            if FieldByName('FECHA_PRORROGA').AsDateTime > FieldByName('FECHA_APERTURA').AsDateTime then
               FechaA := FieldByName('FECHA_PRORROGA').AsDateTime;
            FechaV := CalculoFecha(FechaA,AR^.Plazo);
            AR^.FechaApertura := DateToStr(FechaA);
            AR^.FechaVencimiento := DateToStr(FechaV);
            AR^.Modalidad := 2;
            AR^.TasaEfectiva := FieldByName('TASA_E').AsFloat;
            AR^.TasaNominal := TasaEfectivaVencida(AR^.TasaEfectiva,Ar^.Amortiza);
            AR^.CausadoTotal := FieldByName('CAUSACION_TOTAL').AsCurrency;
            AR^.CausadoMensual := FieldByName('CAUSACION_MENSUAL').AsCurrency;
            AR^.Retefuente := FieldByName('RETEFUENTE').AsCurrency;
            AR^.NetoCausado := FieldByName('NETO_A_CAUSAR').AsCurrency;
            AR^.Saldo := FieldByName('VALOR_INICIAL').AsCurrency;
            AR^.DepositoInicial := FieldByName('VALOR_INICIAL').AsCurrency;
            AR^.NumeroCuenta := '6'+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
            AR^.Excenta := 0;
            AR^.FechaAceptacion := '';
            Cadena := IntToStr(AR^.TipoId) + #9 + AR^.Identificacion + #9 + AR^.Nombre +#9+ AR^.Codigo + #9 +
                      AR^.NombreDepos + #9 + IntToStr(AR^.TipoAho) + #9 + IntToStr(AR^.Amortiza) + #9 +
                      AR^.FechaApertura + #9 + IntToStr(AR^.Plazo) + #9 + AR^.FechaVencimiento + #9 +
                      IntToStr(AR^.Modalidad) + #9 + Format('%2.2f',[AR^.TasaEfectiva]) + #9 + Format('%2.2f',[AR^.TasaNominal]) + #9 +
                      FormatCurr('0.00',AR^.CausadoTotal) + #9 + FormatCurr('0.00',AR^.CausadoMensual) + #9 + FormatCurr('0.00',AR^.Retefuente) + #9 +
                      FormatCurr('0.00',AR^.NetoCausado) + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + FormatCurr('0.00',AR^.DepositoInicial) + #9 +
                      AR^.NumeroCuenta + #9 + IntToStr(AR^.Excenta) + #9 + AR^.FechaAceptacion;
            Dispose(AR);
            Append(Archivo);
            Writeln(Archivo,cadena);
            CloseFile(Archivo);
            Next;
          end; // while
        end; // with
     frmProgreso.Cerrar;

end;

procedure TfrmReporteCdatFogacoop.BitBtn1Click(Sender: TObject);
var Archivo:string;

begin
//        SaveDialog1.DefaultExt := 'TXT';
//        SaveDialog1.InitialDir := 'C:\Planos';
//        SaveDialog1.Title := 'Guardar Como:';
//        SaveDialog1.Execute;
//        Archivo := SaveDialog1.FileName;
//        AssignFile(F,Archivo);
end;

procedure TfrmReporteCdatFogacoop.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := fFechaActual;
end;

end.
