unit UnitReporteAportesFogacoop;

interface

uses
  Windows, Messages, Math, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, IBDatabase;

type
  TfrmReporteAportesFogacoop = class(TForm)
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
    Database: TIBDatabase;
    Transaction: TIBTransaction;
    Label5: TLabel;
    LblEstado: TLabel;
    IBAgencia: TIBQuery;
    Label2: TLabel;
    dtFechaR: TDateTimePicker;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdFechaCorteExit(Sender: TObject);
  private
    procedure Aportes;
    { Private declarations }
  public
    { Public declarations }
  end;

type PCaptaciones=^ACaptaciones;
     ACaptaciones=Record
      TipoId:string;
      Identificacion:string;
      Nombres:string;
      Saldo:Currency;
      NumeroCuenta:string;
      FechaNacimiento:string;
      Sexo:string;
      Ciiu:string;
      vAporteMensual:string;
      vAporteOrdinario:string;
      vAporteExt:string;
      vRevalorizacion:string;
      Contribucion:string;
      FechaVinculacion :string;
end;



var
  frmReporteAportesFogacoop: TfrmReporteAportesFogacoop;
  F:TextFile;
  FechaCorte:tdate;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso;

procedure TfrmReporteAportesFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteAportesFogacoop.CmdProcesoClick(Sender: TObject);
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
      IBQuery2.Database := dmGeneral.IBDatabase1;
      IBQuery2.Transaction := dmGeneral.IBTransaction1;
      lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';      
      Aportes;
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

         Aportes;
         IBAgencia.Next;
       end;  // fin while Agencias
    end;  //Fin if TipoProceso

   LblEstado.Caption := 'Proceso Culminado con Exito!';
end;

procedure TfrmReporteAportesFogacoop.Aportes;
var frmProgreso:TfrmProgreso;
    Total,Posicion:Integer;
    SaldoInicial:Currency;
    Movimiento:Currency;
    AR:PCaptaciones;
    Verdadero:Boolean;
    Tp:Integer;
    FechaA,FechaV,FechaI:TDate;
    Cadena:string;
begin
    FechaI := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
    Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + IntToStr(MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
    AssignFile(F,'C:/PlanosFinMes/APORTES' + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + Cadena + '.TXT');

    Rewrite(F);
    Cadena := 'TIPO ID' + #9 +
              'NIT/CC' + #9 +
              'ASOCIADO' + #9 +
              'SALDO' + #9 +
              'NO CUENTA' + #9 +
              'FECHA NAC' + #9 +
              'SEXO' + #9 +
              'CIIU' + #9 +
              'VAPORTEMENSUAL' + #9 +
              'VAPORTEORDINARIO' + #9 +
              'VAPORTEEXT' + #9 +
              'VREVAAPORTE' + #9 +
              'CONTRIBUCION' + #9 +
              'FECHAVINCULACION';
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
          SQL.Add('select * from P_CAP_APORTEST(:FECHA_CORTE)');
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
          frmProgreso.InfoLabel := 'Buscando APORTES a Trabajar';
          Posicion := 0;
          Application.ProcessMessages;
          Close;
          SQL.Clear;
          SQL.Add('select * from P_CAP_APORTES(:FECHA_CORTE)');
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
            frmProgreso.InfoLabel := 'Analizando Aportes ' + IntToStr(FieldByName('ID_TIPO_CAPTACION').AsInteger) +
                                     Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+'-'+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+
                                     '-'+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
            Posicion := Posicion + 1;
            frmProgreso.Position := Posicion;
            Application.ProcessMessages;

            IBQuery2.SQL.Clear;
            IBQuery2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_PLANOS(:AG,:ID,:CTA,:DG,:ANO,:FECHA_INICIAL,:FECHA_FINAL)');
            IBQuery2.ParamByName('ID').AsInteger  := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            IBQuery2.ParamByName('AG').AsInteger  := FieldByName('ID_AGENCIA').AsInteger;
            IBQuery2.ParamByName('CTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
            IBQuery2.ParamByName('DG').AsInteger  := FieldByName('DIGITO_CUENTA').AsInteger;
            IBQuery2.ParamByName('ANO').AsString  := IntToStr(YearOf(EdFechaCorte.Date));
            IBQuery2.ParamByName('FECHA_INICIAL').AsDate := FechaI;
            IBQuery2.ParamByName('FECHA_FINAL').AsDate := EdFechaCorte.Date;
            try
             IBQuery2.Open;
             SaldoInicial := IBQuery2.FieldByName('SALDO_ACTUAL').AsCurrency;
            except
             frmProgreso.Cerrar;
             IBQuery2.Transaction.Rollback;
             raise;
             Exit;
            end; // try
            Application.ProcessMessages;

            if SaldoInicial <> 0 then begin
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
              AR^.Nombres := Trim(FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
                            Trim(FieldByName('SEGUNDO_APELLIDO').AsString) + ' ' +
                            Trim(FieldByName('NOMBRE').AsString);
              AR^.Saldo := SaldoInicial;
              AR^.NumeroCuenta := '1'+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
              AR^.FechaVinculacion := FormatDateTime('yyyy/mm/dd',FieldByName('FECHA_APERTURA').AsDateTime);
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
              AR^.vAporteMensual := '0';
              AR^.vAporteOrdinario := '0';
              AR^.vAporteExt := '0';
//rEVALORIZACION DE APORTES
              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('SELECT');
              IBQuery2.SQL.Add('  "cap$extracto".VALOR_DEBITO');
              IBQuery2.SQL.Add('FROM');
              IBQuery2.SQL.Add('  "cap$extracto"');
              IBQuery2.SQL.Add('WHERE');
              IBQuery2.SQL.Add('  "cap$extracto".FECHA_MOVIMIENTO = :FECHA AND');
              IBQuery2.SQL.Add('  "cap$extracto".ID_TIPO_CAPTACION = 1 AND');
              IBQuery2.SQL.Add('  "cap$extracto".DESCRIPCION_MOVIMIENTO LIKE '+ QuotedStr('Revalori%') + ' AND');
              IBQuery2.SQL.Add('  "cap$extracto".ID_AGENCIA = :AG AND');
              IBQuery2.SQL.Add('  "cap$extracto".NUMERO_CUENTA = :NM AND');
              IBQuery2.SQL.Add('  "cap$extracto".DIGITO_CUENTA = :DG');
              IBQuery2.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('NM').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBQuery2.ParamByName('DG').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              IBQuery2.ParamByName('FECHA').AsDate := dtFechaR.Date;
              IBQuery2.Open;
              if RecordCount > 0 then
                AR^.vRevalorizacion := IBQuery2.FieldByName('VALOR_DEBITO').AsString
              else
                AR^.vRevalorizacion := '0';

              AR^.Contribucion := '0';
              Cadena := AR^.TipoId + #9 +
                        AR^.Identificacion + #9 +
                        AR^.Nombres + #9 +
                        FormatCurr('0.00',AR^.Saldo) + #9 +
                        AR^.NumeroCuenta + #9 +
                        AR^.FechaNacimiento + #9 +
                        AR^.Sexo + #9 +
                        AR^.Ciiu + #9 +
                        AR^.vAporteMensual + #9 +
                        AR^.vAporteOrdinario + #9 +
                        AR^.vAporteExt + #9 +
                        AR^.vRevalorizacion + #9 +
                        AR^.Contribucion + #9 +
                        AR^.FechaVinculacion;
              Dispose(AR);
              Append(F);
              Writeln(F,cadena);
              CloseFile(F);
            end;
            Next;
          end; // while
        end; // with
     frmProgreso.Cerrar;
     Database.Close;
end;

procedure TfrmReporteAportesFogacoop.BitBtn1Click(Sender: TObject);
var Archivo:string;

begin
        SaveDialog1.DefaultExt := 'TXT';
        SaveDialog1.InitialDir := 'C:\PlanosFinMes';
        SaveDialog1.Title := 'Guardar Como:';
        SaveDialog1.Execute;
        Archivo := SaveDialog1.FileName;
        AssignFile(F,Archivo);
end;

procedure TfrmReporteAportesFogacoop.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

procedure TfrmReporteAportesFogacoop.EdFechaCorteExit(Sender: TObject);
begin
        FechaCorte := EdFechaCorte.Date;
end;

end.
