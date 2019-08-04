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
      Nombres:string;
      Saldo:Currency;
      NumeroCuenta:string;
end;



var
  frmReporteAportesFogacoop: TfrmReporteAportesFogacoop;
  F:TextFile;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso;

procedure TfrmReporteAportesFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReporteAportesFogacoop.CmdProcesoClick(Sender: TObject);
var frmProgreso:TfrmProgreso;
    Total,Posicion:Integer;
    SaldoInicial:Currency;
    Movimiento:Currency;
    AR:PCaptaciones;
    Verdadero:Boolean;
    Tp:Integer;
    FechaA,FechaV:TDate;
    Cadena:string;
begin
// Ocaña
   lblEstado.Caption := 'Procesando ...';
   Database.DataBaseName := DBserver + ':' + DBpath + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
   try
     Database.Connected := True;
   except
     raise;
   end;

    Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + IntToStr(MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
    AssignFile(F,'C:/PlanosFinMes/Aportes' + Cadena + '.TXT');
    //AssignFile(F,'C:/PlanosFinMes/Aportes' + Cadena);

    Rewrite(F);
    Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'ASOCIADO' + #9 + 'SALDO' + #9 + 'NO CUENTA';
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
          SQL.Add('select * from P_CAP_APORTEST');
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
          SQL.Add('select * from P_CAP_APORTES');
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
            IBQuery2.ParamByName('FECHA_INICIAL').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
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
              if FieldByName('ID_IDENTIFICACION').AsInteger = 3 then
                AR^.TipoId := 'C'
              else AR^.TipoId := 'O';
              AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
              AR^.Nombres := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                            FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                            FieldByName('NOMBRE').AsString;
              AR^.Saldo := SaldoInicial;
              AR^.NumeroCuenta := '1'+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
              Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.Nombres + #9 + FormatCurr('0.00',AR^.Saldo) + #9 + AR^.NumeroCuenta;
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
     LblEstado.Caption := 'Proceso Culminado con Exito!';
// FIN OCAÑA
end;

procedure TfrmReporteAportesFogacoop.BitBtn1Click(Sender: TObject);
var Archivo:string;

begin
        SaveDialog1.DefaultExt := 'TXT';
        SaveDialog1.InitialDir := 'C:\Planos';
        SaveDialog1.Title := 'Guardar Como:';
        SaveDialog1.Execute;
        Archivo := SaveDialog1.FileName;
        AssignFile(F,Archivo);
end;

procedure TfrmReporteAportesFogacoop.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

end.
