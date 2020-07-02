unit UnitProcesoCierreAno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, IBSQL, IBDatabase, DB, IB, 
  IBCustomDataSet, IBQuery, DateUtils;

type
  TfrmCierreAno = class(TForm)
    GroupBox1: TGroupBox;
    comprobante: TCheckBox;
    auxiliar: TCheckBox;
    cajadiario: TCheckBox;
    Panel1: TPanel;
    DTfecha: TDateTimePicker;
    Label1: TLabel;
    saldoscuenta: TCheckBox;
    saldosiniciales: TCheckBox;
    GroupBox2: TGroupBox;
    movimiento: TCheckBox;
    movimientocol: TCheckBox;
    cierres: TCheckBox;
    movsalida: TCheckBox;
    moventrada: TCheckBox;
    GroupBox3: TGroupBox;
    consecutivos: TCheckBox;
    Panel2: TPanel;
    CmdCerrar: TBitBtn;
    BTimportar: TBitBtn;
    IBSQL1: TIBSQL;
    cierressuc: TCheckBox;
    IBQuery1: TIBQuery;
    GroupBox4: TGroupBox;
    Aportes: TCheckBox;
    Rindediario: TCheckBox;
    Juvenil: TCheckBox;
    Contractual: TCheckBox;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    GroupBox5: TGroupBox;
    Provisiones: TCheckBox;
    hi: TStaticText;
    hf: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure BTimportarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCierreAno: TfrmCierreAno;
  Alias,Clave :string;
  Generado:Boolean;
implementation

{$R *.dfm}

uses UnitDmGeneral, INIFiles, UnitGlobales, UnitGlobalesCol, UnitPantallaProgreso,
  unitMain;

procedure TfrmCierreAno.FormShow(Sender: TObject);
begin
        Generado := False;
        DTfecha.Format := 'yyyy/MM/dd';
        DTfecha.Date := fFechaActual;
        DTfecha.DateTime := StrToDate(IntToStr(YearOf(fFechaActual) + 1) + '/01/02');
        with IBQuery1 do begin
         if Transaction.InTransaction then
           Transaction.Rollback;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('select CONSECUTIVO from "gen$consecutivos" where ID_CONSECUTIVO = 99');
         try
          Open;
          if FieldByName('CONSECUTIVO').AsInteger <> 0 then
             Generado := True
          else
             Generado := False;
          Transaction.Commit;
         except
             Generado := True;
         end;
        end;

end;

procedure TfrmCierreAno.BTimportarClick(Sender: TObject);
var
   Tipos:array[1..4] of Integer;
   i :Integer;
   Total:Integer;
   frmProgreso:TfrmProgreso;
   _iAno :Integer;
   _iAnoActual :Integer;
   _cSaldoActual :Currency;
   _dFechaInicial :TDate;
   _dFechaFinal :TDate;
begin
        if MessageDlg('Esta Seguro(a) de Realizar el proceso',mtWarning,[mbYes,mbNo],0) = mrNo then
           Exit;
        _iAno := YearOf(fFechaActual) + 1;
        _iAnoActual := YearOf(fFechaActual);
        _dFechaInicial := EncodeDate(_iAnoActual,01,01);
        _dFechaFinal := EncodeDate(_iAnoActual,12,31);
        BTimportar.Enabled := False;
        if Generado then begin
          MessageDlg('El Proceso de Fin de Año, ya fue Ejecutado',mtError,[mbok],0);
          BTimportar.Enabled := False;
          Exit;
        end;

        with IBQuery1 do begin
          if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
        end;

        frmMain.Timer2.Enabled := False;
        hi.Caption := TimeToStr(Now);

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('delete from CON$COMPROBANTE');
          ExecQuery;
          comprobante.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from CON$AUXILIAR');
          ExecQuery;
          auxiliar.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from CON$CAJADIARIO');
          ExecQuery;
          cajadiario.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from CON$SALDOSCUENTA');
          ExecQuery;
          saldoscuenta.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from CON$SALDOSINICIALES');
          ExecQuery;
          saldosiniciales.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from "caj$movimiento"');
          ExecQuery;
          movimiento.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from "caj$movimientocol"');
          ExecQuery;
          movimientocol.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from "caj$cierres" where FECHA <> :FECHA');
          ParamByName('FECHA').AsDate := DTfecha.Date; 
          ExecQuery;
          cierres.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from "caj$cierresucursal"');
          ExecQuery;
          cierressuc.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from "caj$movremotosalida"');
          ExecQuery;
          movsalida.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('delete from "caj$movremotoentrada"');
          ExecQuery;
          moventrada.Checked := True;

          Close;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set CONSECUTIVO = 0');
          ExecQuery;
          consecutivos.Checked := True;
          Close;
        end;

        with IBQuery1 do begin
// Procesar traslado de Saldos Iniciales
          Tipos[1] := 1;
          Tipos[2] := 2;
          Tipos[3] := 4;
          Tipos[4] := 5;

          for i := 1 to 4 do
          begin

            Close;
            SQL.Clear;
            SQL.Add('SELECT COUNT(0) AS TOTAL');
            SQL.Add('FROM "cap$maestro"');
            SQL.Add('WHERE ID_TIPO_CAPTACION = :TIPO1');
            SQL.Add('AND ID_ESTADO NOT IN (2,7,9,11,15)');
            ParamByName('TIPO1').AsInteger := Tipos[i];
            try
             Open;
             Total := FieldByName('TOTAL').AsInteger;
            except
                Transaction.Rollback;
                raise;
                Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select DESCRIPCION from "cap$tipocaptacion"');
            SQL.Add('where ID_TIPO_CAPTACION = :TIPO1');
            ParamByName('TIPO1').AsInteger := Tipos[i];
            try
             Open;
            except
                Transaction.Rollback;
                raise;
                Exit;
            end;

            frmProgreso := TfrmProgreso.Create(self);
            frmProgreso.Min := 0;
            frmProgreso.Max := Total;
            frmProgreso.Titulo := 'Procesando: ' + FieldByName('DESCRIPCION').AsString;
            frmProgreso.InfoLabel := 'Leyendo Datos, por favor sea paciente!';
            frmProgreso.Ejecutar;

            Close;
            SQL.Clear;
            SQL.Add('    SELECT');
            SQL.Add('     "cap$maestro".ID_AGENCIA,');
            SQL.Add('     "cap$maestro".ID_TIPO_CAPTACION,');
            SQL.Add('     "cap$maestro".NUMERO_CUENTA,');
            SQL.Add('     "cap$maestro".DIGITO_CUENTA');
            SQL.Add('    FROM');
            SQL.Add('       "cap$maestro"');
            SQL.Add('    WHERE');
            SQL.Add('       "cap$maestro".ID_TIPO_CAPTACION = :TIPO1');
            SQL.Add('    AND ID_ESTADO NOT IN (2,7,9,11,15)');
            SQL.Add('    ORDER BY NUMERO_CUENTA');
            ParamByName('TIPO1').AsInteger := Tipos[i];
            try
             Open;
            except
                Transaction.Rollback;
                raise;
                Exit;
            end;
            frmProgreso.InfoLabel := 'Calculando Saldos...';
            while not Eof do
            begin
               Application.ProcessMessages;
               frmProgreso.Position := RecNo;
               IBSQL2.Close;
               IBSQL2.SQL.Clear;
               IBSQL2.SQL.Add('SELECT SALDO_ACTUAL FROM SALDO_ACTUAL_MES_NOTD(');
               IBSQL2.SQL.Add(':AGENCIA,:TIPO,:CUENTA,:DIGITO,:ANO,:FECHA1,:FECHA2');
               IBSQL2.SQL.Add(')');
               IBSQL2.ParamByName('AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL2.ParamByName('TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               IBSQL2.ParamByName('CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBSQL2.ParamByName('DIGITO').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               IBSQL2.ParamByName('ANO').AsInteger := _iAnoActual;
               IBSQL2.ParamByName('FECHA1').AsDate := _dFechaInicial;
               IBSQL2.ParamByName('FECHA2').AsDate := _dFechaFinal;
               try
                IBSQL2.ExecQuery;
               except
                IBSQL2.Transaction.Rollback;
                raise;
                Exit;
               end;
               _cSaldoActual := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
               if _cSaldoActual <> 0 then
               begin
                 IBSQL3.Close;
                 IBSQL3.SQL.Clear;
                 IBSQL3.SQL.Add('insert into "cap$maestrosaldoinicial" values (');
                 IBSQL3.SQL.Add(':AGENCIA,:TIPO,:CUENTA,:DIGITO,:ANO,:SALDOINICIAL');
                 IBSQL3.SQL.Add(')');
                 IBSQL3.ParamByName('AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                 IBSQL3.ParamByName('TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL3.ParamByName('CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                 IBSQL3.ParamByName('DIGITO').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                 IBSQL3.ParamByName('ANO').AsInteger := _iAno;
                 IBSQL3.ParamByName('SALDOINICIAL').AsCurrency := _cSaldoActual;
                 try
                   IBSQL3.ExecQuery;
                 except
                   IBSQL3.Transaction.Rollback;
                 raise;
                   Exit;
                 end;
                 IBSQL3.Close;
                 IBSQL3.SQL.Clear;
                 IBSQL3.SQL.Add('insert into "cap$saldosmes" values (');
                 IBSQL3.SQL.Add(':AGENCIA,:TIPO,:CUENTA,:DIGITO,:ANO,:PERIODO,:SALDOINICIAL');
                 IBSQL3.SQL.Add(')');
                 IBSQL3.ParamByName('AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                 IBSQL3.ParamByName('TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBSQL3.ParamByName('CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                 IBSQL3.ParamByName('DIGITO').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                 IBSQL3.ParamByName('ANO').AsInteger := _iAno;
                 IBSQL3.ParamByName('PERIODO').AsInteger := 1;
                 IBSQL3.ParamByName('SALDOINICIAL').AsCurrency := _cSaldoActual;
                 try
                   IBSQL3.ExecQuery;
                 except
                   IBSQL3.Transaction.Rollback;
                 raise;
                   Exit;
                 end;
               end;
               frmProgreso.InfoLabel := 'Cuenta Número:' + FieldByName('NUMERO_CUENTA').AsString;
               Next;
            end; // del while
            frmProgreso.Cerrar;
            case Tipos[i] of
               1: Aportes.Checked := True;
               2: Rindediario.Checked := True;
               4: Juvenil.Checked := True;
               5: Contractual.Checked := True;
            end;

            Application.ProcessMessages;

           end;// del for

// Fin Traslado de Saldos

// Traslado provisiones de Cartera

           Close;
           SQL.Clear;
           SQL.Add('update "col$causaciondiariamov" set PCAPITAL_ACT = 0, PINTERES_ACT = 0, PCOSTAS_ACT = 0');
           ExecSQL;
           Transaction.CommitRetaining;
           Close;
           SQL.Clear;
           SQL.Add('SELECT * FROM P_COL_TRASANUAL_PROVISION(:FECHA)');
           ParamByName('FECHA').AsDate := EncodeDate(YearOf(fFechaActual),12,30);
           try
            Open;
           except
            //Transaction.Rollback;
            ShowMessage('Favor comunicarse con sistemas Traslado de provisión no efectuado');
           end;

           Provisiones.Checked := True;

// Fin Traslado provisiones de Cartera

// Marcar proceso realizado

           Close;
           SQL.Clear;
           SQL.Add('update "gen$consecutivos" SET CONSECUTIVO = 1 where ID_CONSECUTIVO = 99');
           try
             ExecSQL;
           except
             Transaction.Rollback;
             raise;
             Exit;
           end;
// Fin marcado
           Transaction.Commit;

          end; // del with
        ShowMessage('Proceso Terminbado con exito');
        BTimportar.Enabled := False;
        hf.Caption := TimeToStr(Now);
        frmMain.Timer2.Enabled := False;

end;

procedure TfrmCierreAno.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCierreAno.FormCreate(Sender: TObject);
begin
   ShortDateFormat := 'yyyy/MM/dd';
   
end;

end.
