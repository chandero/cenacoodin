unit UnitReporteCaptacionesFogacoop;

interface

uses
  Windows, Messages, Math, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit;

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

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso;

procedure TfrmReporteCaptacionesFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteCaptacionesFogacoop.CmdProcesoClick(Sender: TObject);
var frmProgreso:TfrmProgreso;
    Total,Posicion:Integer;
    Saldo:Currency;
    AR:PCaptaciones;
    Verdadero:Boolean;
    Tp:Integer;
    FechaA,FechaV:TDate;
    Cadena:string;
begin
    Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + IntToStr(MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
    AssignFile(F,'//Archivos/publico/PlanosFinMes/Captaciones' + Cadena);
    Rewrite(F);
    Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'ASOCIADO' + #9 + 'CODIGO CONTABLE' + #9 + 'NOMBRE DEPOSITO' + #9 + 'TIPO AHORRO' + #9 +
              'AMORTIZACION' + #9 +'FECHA APERT' + #9 + 'PLAZO' + #9 + 'FECHA VENC' + #9 + 'MODALIDAD' + #9 + 'TASA NOM' + #9 + 'TASA EFECT' + #9 +
              'INT CAUSADO' + #9 + 'SALDO' + #9 + 'DEP INICIAL' + #9 + 'NO CUENTA' + #9 + 'GMF';
    Writeln(F,Cadena);
    CloseFile(F);
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
          SQL.Add('select * from P_CAP_0000T');
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
          SQL.Add('select * from P_CAP_0000');
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
            IBQuery2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:ID,:CTA,:DG,:ANO,:FECHA_INICIAL,:FECHA_FINAL)');
            IBQuery2.ParamByName('ID').AsInteger  := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBQuery2.ParamByName('AG').AsInteger  := FieldByName('ID_AGENCIA').AsInteger;
            IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
            IBQuery2.ParamByName('DG').AsInteger  := FieldByName('DIGITO_CUENTA').AsInteger;
            IBQuery2.ParamByName('ANO').AsString  := IntToStr(YearOf(EdFechaCorte.Date));
            IBQuery2.ParamByName('FECHA_INICIAL').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
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

            Tp := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            
            if (Tp = 6) and ((FieldByName('ID_ESTADO').AsInteger <> 1) and
                             (FieldByName('ID_ESTADO').AsInteger <> 6)) then
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
            if TP = 6 then
             if FieldByName('PLAZO').AsInteger < 180 then
                AR^.Codigo := '211005'
             else
                AR^.Codigo := '211010';
            AR^.NombreDepos := IBQuery2.FieldByName('DESCRIPCION').AsString;
            if ((Tp = 2) or (Tp = 3) or (Tp = 4)) then
               AR^.TipoAho := 1
            else
            if Tp = 5 then
               AR^.TipoAho := 3
            else
               AR^.TipoAho := 2;

            if Tp = 5 then
               AR^.Amortiza := 30
            else
               AR^.Amortiza := FieldByName('AMORTIZACION').AsInteger;

            AR^.FechaApertura := FieldByName('FECHA_APERTURA').AsString;

            if Tp = 5 then
              begin
                IBQuery3.Close;
                IBQuery3.SQL.Clear;
                IBQuery3.SQL.Add('select PLAZO from "cap$tiposplancontractual" where ID_PLAN = :ID_PLAN');
                IBQuery3.ParamByName('ID_PLAN').AsInteger := FieldByName('ID_PLAN').AsInteger;
                IBQuery3.Open;
                AR^.Plazo := IBQuery3.FieldByName('PLAZO').AsInteger;
                IBQuery3.Close;
              end
            else
            AR^.Plazo := FieldByName('PLAZO').AsInteger;
            AR^.FechaVencimiento := DateToStr(EdFechaCorte.Date);
            if Tp = 6 then begin
              if FieldByName('FECHA_PRORROGA').AsDateTime > FieldByName('FECHA_APERTURA').AsDateTime then
                 FechaA := FieldByName('FECHA_PRORROGA').AsDateTime;
              FechaV := CalculoFecha(FechaA,AR^.Plazo);
              AR^.FechaApertura := DateToStr(FechaA);
              AR^.FechaVencimiento := DateToStr(FechaV);
            end;

            if FieldByName('MODALIDAD').AsString = 'A' then
               AR^.Modalidad := 1
            else
               AR^.Modalidad := 2;
            if Tp = 6 then begin
              AR^.TasaEfectiva := FieldByName('TASA_EFECTIVA').AsFloat;
              AR^.TasaNominal := TasaEfectivaVencida(AR^.TasaEfectiva,Ar^.Amortiza);
            end
            else
            begin
              AR^.TasaNominal := SimpleRoundTo(3,-2);
              AR^.TasaEfectiva := SimpleRoundTo(3.04,-2);
            end;
            if Tp = 6 then begin
              IBQuery3.Close;
              IBQuery3.SQL.Clear;
              IBQuery3.SQL.Add('select VALOR from "cap$causacioncdat" where ');
              IBQuery3.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
              IBQuery3.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
              IBQuery3.SQL.Add('ANO = :ANO and MES = :MES');
              IBQuery3.ParamByName('ID_AGENCIA').AsInteger        := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery3.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQuery3.ParamByName('NUMERO_CUENTA').AsInteger     := FieldByName('NUMERO_CUENTA').AsInteger;
              IBQuery3.ParamByName('DIGITO_CUENTA').AsInteger     := FieldByName('DIGITO_CUENTA').AsInteger;
              IBQuery3.ParamByName('ANO').AsInteger := YearOf(EdFechaCorte.Date);
              IBQuery3.ParamByName('MES').AsInteger := MonthOf(EdFechaCorte.Date);
              try
                IBQuery3.Open;
              except
                frmProgreso.Cerrar;
                Transaction.Rollback;
                raise;
                Exit;
              end;
              AR^.InteresCausado := IBQuery3.FieldByName('VALOR').AsCurrency;
             end
            else
               AR^.InteresCausado := 0;
            if Tp = 6 then begin
               AR^.Saldo := FieldByName('VALOR_INICIAL').AsCurrency;
               AR^.DepositoInicial := FieldByName('VALOR_INICIAL').AsCurrency;
            end
            else
            begin
               AR^.Saldo := Saldo;
               AR^.DepositoInicial := Saldo;
            end;

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
            CloseFile(F);
            Next;
          end; // while
        end; // with
     frmProgreso.Cerrar;

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
        EdFechaCorte.Date := fFechaActual;
end;

end.
