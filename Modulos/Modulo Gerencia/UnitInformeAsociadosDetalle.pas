unit UnitInformeAsociadosDetalle;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBSQL, DBClient, FR_DSet, FR_DBSet, FR_Class,
  FR_Desgn, FR_ChBox, Provider, frRtfExp, frexpimg, FR_E_TXT, FR_E_RTF;

type
  TfrmInformeAsociadosDetalle = class(TForm)
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    Bar1: TProgressBar;
    IBTransaction1: TIBTransaction;
    _ibqReporte: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    _cdsReporte: TClientDataSet;
    btnReporte: TBitBtn;
    frReport1: TfrReport;
    DataSet: TfrDBDataSet;
    Label1: TLabel;
    frCheckBoxObject1: TfrCheckBoxObject;
    IBSQL3: TIBSQL;
    _cdsHabilidad: TClientDataSet;
    _dspHabilidad: TDataSetProvider;
    _ibqHabilidad: TIBQuery;
    _ibt: TIBTransaction;
    _dspReporte: TDataSetProvider;
    edFecha: TDateTimePicker;
    Label2: TLabel;
    rgOrdenar: TRadioGroup;
    frRTFExport1: TfrRTFExport;
    rgTipo: TRadioGroup;
    Label3: TLabel;
    EdFechaJuvenil: TDateTimePicker;
    _cdsJuvenil: TClientDataSet;
    _dspJuvenil: TDataSetProvider;
    _ibqJuvenil: TIBQuery;
    IBSQL4: TIBSQL;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    function ValidarAsociado: Boolean;
    function ValidarJuvenil: Boolean;
    procedure Asociado;
    procedure Juvenil;
    { Public declarations }
  end;

var
  frmInformeAsociadosDetalle: TfrmInformeAsociadosDetalle;

  xAportesAct:Boolean;
  xRindediario:Boolean;
  xJuvenil:Boolean;
  xDeudas:Boolean;
  xFianzas:Boolean;
  xApertura:Boolean;
  xEdad:Boolean;

  Ag:Integer;
  Tp:Integer;
  Nm:Integer;
  Dg:Integer;

  SaldoAportes:Currency;
  SaldoRindediario:Currency;
  SaldoJuvenil:Currency;

  SaldoMinimoApo:Currency;
  SaldoMinimoRin:Currency;
  SaldoMinimoJuv:Currency;

  Ano:string;
  Fecha1:TDate;
  Fecha2:TDate;

  Id:Integer;
  Persona:string;
  IdAgencia,IdTipo,Numero,Digito:Integer;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol, UnitdmColocacion;

procedure TfrmInformeAsociadosDetalle.btnCerrarClick(
  Sender: TObject);
begin
        Close;
end;

function TfrmInformeAsociadosDetalle.ValidarAsociado: Boolean;
var
  FechaCorte:TDateTime;
begin
        SaldoMinimoApo := 100000;
        SaldoMinimoRin := 6000;
        SaldoMinimoJuv := 50000;

        Ano := IntToStr(YearOf(fFechaActual));
        Fecha1 := EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),01);
        Fecha2 := fFechaActual;

        SaldoAportes := 0;
        SaldoRindediario := 0;
        SaldoJuvenil := 0;

        SaldoMinimoApo:= 0;
        SaldoMinimoRin:= 0;
        SaldoMinimoJuv:= 0;

        xAportesAct    := False;
        xRindediario   := False;
        xJuvenil       := False;
        xDeudas        := True;
        xFianzas       := True;

        FechaCorte := edFecha.Date;


// Verificación de Asociado y Requisitos
        Ag := IdAgencia;
        Tp := IdTipo;
        Nm := Numero;
        Dg := Digito;

        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;        

        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
        IBSQL1.ParamByName('AG').AsInteger := Ag;
        IBSQL1.ParamByName('TP').AsInteger := Tp;
        IBSQL1.ParamByName('NM').AsInteger := Nm;
        IBSQL1.ParamByName('DG').AsInteger := Dg;
        IBSQL1.ParamByName('ANO').AsString := Ano;
        IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
        IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
        try
          IBSQL1.ExecQuery;
          if IBSQL1.RecordCount > 0 then begin
            SaldoAportes := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
            if SaldoAportes >= SaldoMinimoApo then
              xAportesAct := True
            else begin
              xAportesAct := False;
            end;
          end
          else
          begin
            SaldoAportes := 0;
            xAportesAct := False;
          end;
        except
          IBSQL1.Transaction.Rollback;
          raise;
        end;

        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
        IBSQL1.ParamByName('AG').AsInteger := Ag;
        IBSQL1.ParamByName('TP').AsInteger := 2;
        IBSQL1.ParamByName('NM').AsInteger := Nm;
        IBSQL1.ParamByName('DG').AsInteger := StrToInt(DigitoControl(2,Format('%.7d',[Nm])));
        IBSQL1.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
        IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
        IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
        try
          IBSQL1.ExecQuery;
          if IBSQL1.RecordCount > 0 then begin
            SaldoRindediario := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
            if SaldoRindediario >= SaldoMinimoRin then
              xRindediario := True
            else begin
              xRindediario := False;
            end;
          end
          else
          begin
            SaldoRindediario := 0;
            xRindediario := False;
          end;
        except
          IBSQL1.Transaction.Rollback;
          raise;
        end;


        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
        IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
        IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION <= 3');
        IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
        IBSQL1.ParamByName('ID_PERSONA').AsString := Persona;
        try
         IBSQL1.ExecQuery;
         xDeudas := True;
         if IBSQL1.RecordCount > 0 then begin
           if (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or
              (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then begin
              xDeudas := False;
              Exit;
           end;

           while not IBSQL1.Eof do begin
             if ObtenerDiasMora(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2) > 0 then
               xDeudas := False;
             IBSQL1.Next;
           end;
         end;
         except
          IBSQL1.Transaction.Rollback;
          raise;
        end;

        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colgarantias"');
        IBSQL1.SQL.Add('inner join "col$colocacion" ON ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
        IBSQL1.SQL.Add('"col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
        IBSQL1.SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA and "col$colocacion".ID_ESTADO_COLOCACION < 4');
        IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
        IBSQL1.ParamByName('ID_PERSONA').AsString := Persona;
        try
         IBSQL1.ExecQuery;
         xFianzas := True;
         if IBSQL1.RecordCount > 0 then begin
           if (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or
              (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then begin
              xFianzas := False;
              Exit;
           end;

           while not IBSQL1.Eof do begin
             if ObtenerDiasMora(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2) > 0 then
              begin
               xFianzas := False;
               Exit;
              end;
             IBSQL1.Next;
           end;
         end;
         except
          IBSQL1.Transaction.Rollback;
          raise;
        end;

        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select * from "cap$maestrotitular"');
        IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
        IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
        IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
        IBSQL1.SQL.Add('where');
        IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and "cap$maestrotitular".ID_TIPO_CAPTACION = 4 and "cap$tiposestado".SE_SUMA <> 0');
        IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
        IBSQL1.ParamByName('ID_PERSONA').AsString := Persona;
        try
         IBSQL1.ExecQuery;
         xJuvenil := True;
         if IBSQL1.RecordCount > 0 then
          while not IBSQL1.Eof do begin
              IBSQL2.Close;
              IBSQL2.SQL.Clear;
              IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
              IBSQL2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBSQL2.ParamByName('NM').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
              IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
              IBSQL2.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
              IBSQL2.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
              IBSQL2.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
              try
                IBSQL2.ExecQuery;
                if IBSQL2.RecordCount > 0 then
                while not IBSQL2.Eof do begin
                   SaldoJuvenil := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
                   if SaldoJuvenil < SaldoMinimoJuv then begin
                     xJuvenil := False;
                     Exit;
                   end;
                   SaldoJuvenil := 0;
                   IBSQL2.Next;
                end;

              except
                IBSQL2.Transaction.Rollback;
                raise;
              end;
           IBSQL1.Next;
          end;
         except
          IBSQL1.Transaction.Rollback;
          raise;
        end;
// Fin verificación de Requisitos
        if (xAportesAct) and (xRindediario) and (xJuvenil) and (xDeudas) and (xFianzas) then
          Result := True
        else
          Result := False;
// Fin Verificar Valores

end;

procedure TfrmInformeAsociadosDetalle.btnProcesarClick(
  Sender: TObject);

begin
        if MessageDlg('Procesar Elimina la tabla anterior'+#13+'Seguro de Continuar?',mtConfirmation,[mbyes,mbno],0) <> mrYes then
          Exit;

        case rgTipo.ItemIndex of
         0: begin
             Asociado;
            end;
         1: begin
             Juvenil;
            end;
        end;
end;

procedure TfrmInformeAsociadosDetalle.btnReporteClick(
  Sender: TObject);
begin
        if IBTransaction1.InTransaction then
          IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;

        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        _ibqReporte.Close;
        case rgTipo.ItemIndex of
         0: begin
              _ibqReporte.SQL.Clear;
              _ibqReporte.SQL.Add('SELECT "gen$asociadosdetalle".NUMERO_CUENTA,');
              _ibqReporte.SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
              _ibqReporte.SQL.Add('"gen$persona".NOMBRE FROM "gen$asociadosdetalle"');
              _ibqReporte.SQL.Add('INNER JOIN "gen$persona" ON ("gen$asociadosdetalle".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
              _ibqReporte.SQL.Add('AND ("gen$asociadosdetalle".ID_PERSONA = "gen$persona".ID_PERSONA)');
              _ibqReporte.Open;
            end;
         1: begin
              _ibqReporte.SQL.Clear;
              _ibqReporte.SQL.Add('SELECT "gen$juvenildetalle".NUMERO_CUENTA,');
              _ibqReporte.SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
              _ibqReporte.SQL.Add('"gen$persona".NOMBRE FROM "gen$juvenildetalle"');
              _ibqReporte.SQL.Add('INNER JOIN "gen$persona" ON ("gen$juvenildetalle".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
              _ibqReporte.SQL.Add('AND ("gen$juvenildetalle".ID_PERSONA = "gen$persona".ID_PERSONA)');
              _ibqReporte.Open;
            end;
        end;

        _cdsReporte.Close;
        _cdsReporte.Open;
        case rgOrdenar.ItemIndex of
         0: begin
             _cdsReporte.IndexFieldNames := 'NUMERO_CUENTA';
            end;
         1: begin
             _cdsReporte.IndexFieldNames := 'PRIMER_APELLIDO;SEGUNDO_APELLIDO;NOMBRE';
            end;
        end;

        with frReport1 do
         begin
           case rgTipo.ItemIndex of
             0: begin
                  LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reporte\InfAsociadosDetalle.frf');
                end;
             1: begin
                  LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reporte\InfJuvenilesDetalle.frf');
                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('SELECT COUNT(NUMERO_CUENTA) AS TOTAL from "gen$juvenildetalle" WHERE SEXO = :SEXO');
                  IBSQL2.ParamByName('SEXO').AsString := 'F';
                  IBSQL2.ExecQuery;
                  frReport1.Dictionary.Variables['MUJERES'] := IBSQL2.FieldByName('TOTAL').AsInteger;
                  IBSQL2.Close;

                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('SELECT COUNT(NUMERO_CUENTA) AS TOTAL from "gen$juvenildetalle" WHERE SEXO = :SEXO');
                  IBSQL2.ParamByName('SEXO').AsString := 'M';
                  IBSQL2.ExecQuery;
                  frReport1.Dictionary.Variables['HOMBRES'] := IBSQL2.FieldByName('TOTAL').AsInteger;
                  IBSQL2.Close;
                end;
           end;
           frReport1.Dictionary.Variables['EMPRESA'] := QuotedStr(Empresa);
           frReport1.Dictionary.Variables['NIT'] := QuotedStr(Nit);
           frReport1.Dictionary.Variables['FECHA'] := QuotedStr(DateToStr(edFecha.Date));
           frReport1.Dictionary.Variables['OFICINA'] := QuotedStr(Ciudad);
           if PrepareReport then
             ShowPreparedReport;
         end;
       _cdsReporte.CancelUpdates;
       _cdsReporte.Close;
       IBTransaction1.Commit;
end;

procedure TfrmInformeAsociadosDetalle.FormCreate(Sender: TObject);
begin
        if _ibt.InTransaction then
          _ibt.Rollback;
        _ibt.StartTransaction;
        _ibqHabilidad.Open;
        _cdsHabilidad.Open;
        _ibqJuvenil.Open;
        _cdsJuvenil.Open;

        if IBTransaction1.InTransaction then
           IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
        _ibqReporte.Open;

        edFecha.Date := fFechaActual;
        EdFechaJuvenil.Date := fFechaActual;
end;

procedure TfrmInformeAsociadosDetalle.FormCloseQuery(
  Sender: TObject; var CanClose: Boolean);
begin
 CanClose := True;
end;

procedure TfrmInformeAsociadosDetalle.Asociado;
var
  _cdsAsociado:TClientDataSet;
  _dspAsociado:TDataSetProvider;
  _ibqAsociado:TIBQuery;
  _ibtran : TIBTransaction;
begin
        _ibqAsociado := TIBQuery.Create(nil);
        _ibtran := TIBTransaction.Create(nil);
        _ibtran.DefaultDatabase := dmGeneral.IBDataBase1;
        _ibtran.StartTransaction;
        _ibqAsociado.Transaction := _ibtran;

        with IBSQL3 do
        begin
         Close;
         SQL.Clear;
         SQL.Add('delete from "gen$asociadosdetalle"');
         try
          ExecQuery;
          Transaction.Commit;
          Transaction.StartTransaction;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
        end;



       _ibqHabilidad.Close;
       _cdsHabilidad.Close;
       if _ibt.InTransaction then
         _ibt.Rollback;
       _ibt.StartTransaction;
       _ibqHabilidad.Open;
       _cdsHabilidad.Open;

        if _ibtran.InTransaction then
          _ibtran.Rollback;
        _ibtran.StartTransaction;
        
        with _ibqAsociado do
        begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT ');
         SQL.Add('  "cap$maestro".ID_AGENCIA,');
         SQL.Add('  "cap$maestro".ID_TIPO_CAPTACION,');
         SQL.Add('  "cap$maestro".NUMERO_CUENTA,');
         SQL.Add('  "cap$maestro".DIGITO_CUENTA,');
         SQL.Add('  "cap$maestro".FECHA_APERTURA,');
         SQL.Add('  "gen$persona".ID_IDENTIFICACION,');
         SQL.Add('  "gen$persona".ID_PERSONA,');
         SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
         SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
         SQL.Add('  "gen$persona".NOMBRE');
         SQL.Add('FROM');
         SQL.Add(' "cap$maestro"');
         SQL.Add(' INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO="cap$tiposestado".ID_ESTADO)');
         SQL.Add(' INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
         SQL.Add('  AND ("cap$maestro".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
         SQL.Add('  AND ("cap$maestro".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
         SQL.Add('  AND ("cap$maestro".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
         SQL.Add(' INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
         SQL.Add('  AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
         SQL.Add('WHERE');
         SQL.Add('  ("cap$tiposestado".SE_SUMA = 1) AND ');
         SQL.Add('  ("cap$maestro".ID_TIPO_CAPTACION = 1) AND ');
         SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR = 1)');
         try
          Open;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
        end;

         _dspAsociado := TDataSetProvider.Create(nil);
         _cdsAsociado := TClientDataSet.Create(nil);
         _dspAsociado.DataSet := _ibqAsociado;
         _cdsAsociado.SetProvider(_dspAsociado);
         _cdsAsociado.Open;
         _cdsAsociado.Last;
         _cdsAsociado.First;

         Bar1.Min := 0;
         Bar1.Max := _cdsAsociado.RecordCount;
         Bar1.Position := 0;

         with _cdsAsociado do
         while not Eof do
         begin
            Bar1.Position := RecNo;
            Label1.Caption := FieldByName('ID_IDENTIFICACION').AsString + '-' + FieldByName('ID_PERSONA').AsString + '-' +
                              Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                            FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                            FieldByName('NOMBRE').AsString);
            Application.ProcessMessages;
            Id := FieldByName('ID_IDENTIFICACION').AsInteger;
            Persona := FieldByName('ID_PERSONA').AsString;
            IdAgencia := FieldByName('ID_AGENCIA').AsInteger;
            IdTipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            Numero := FieldByName('NUMERO_CUENTA').AsInteger;
            Digito := FieldByName('DIGITO_CUENTA').AsInteger;

            if FieldByName('FECHA_APERTURA').AsDateTime <= edFecha.Date then
              xApertura := True
            else
              xApertura := False;

            if ValidarAsociado then
            begin
               _cdsHabilidad.Append;
               _cdsHabilidad.FieldByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               _cdsHabilidad.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
               _cdsHabilidad.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               _cdsHabilidad.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               _cdsHabilidad.Post;
             end;
            Next;
         end; // fin del while
         _cdsHabilidad.ApplyUpdates(-1);
         _ibt.Commit;
         btnProcesar.Enabled := False;
         ShowMessage('Proceso finalizado con exito!');
end;

procedure TfrmInformeAsociadosDetalle.Juvenil;
var
  _cdsAsociado:TClientDataSet;
  _dspAsociado:TDataSetProvider;
  _ibqAsociado:TIBQuery;
  _ibtran : TIBTransaction;
begin
        _ibqAsociado := TIBQuery.Create(nil);
        _ibtran := TIBTransaction.Create(nil);
        _ibtran.DefaultDatabase := dmGeneral.IBDataBase1;
        _ibtran.StartTransaction;
        _ibqAsociado.Transaction := _ibtran;

        with _ibqAsociado do
        begin
         Close;
         SQL.Clear;
         SQL.Add('delete from "gen$juvenildetalle"');
         try
          Open;
          Transaction.Commit;
          Transaction.StartTransaction;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add('delete from "gen$juvenildetalle_new"');
         try
          Open;
          Transaction.Commit;
          Transaction.StartTransaction;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
        end;


        with _ibqAsociado do
        begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT "cap$maestrotitular".ID_AGENCIA,"cap$maestro".ID_TIPO_CAPTACION,"cap$maestro".NUMERO_CUENTA, "cap$maestro".DIGITO_CUENTA,');
         SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION, "cap$maestrotitular".ID_PERSONA,NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,SEXO,FECHA_NACIMIENTO');
         SQL.Add('from "cap$maestro"');
         SQL.Add('inner join "cap$maestrotitular" on (');
         SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION AND');
         SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA AND');
         SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
         SQL.Add('inner join "gen$persona" on ("cap$maestrotitular".ID_IDENTIFICACION =  "gen$persona".ID_IDENTIFICACION AND');
         SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
         SQL.Add('where "cap$maestro".ID_TIPO_CAPTACION = 4  AND FECHA_APERTURA <= :FECHA_CORTE AND NUMERO_TITULAR = 2');
         SQL.Add('AND "cap$maestro".ID_ESTADO = 1');
         ParamByName('FECHA_CORTE').AsDate := edFecha.Date;
         try
          Open;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
        end;

         _dspAsociado := TDataSetProvider.Create(nil);
         _cdsAsociado := TClientDataSet.Create(nil);
         _dspAsociado.DataSet := _ibqAsociado;
         _cdsAsociado.SetProvider(_dspAsociado);
         _cdsAsociado.Open;
         _cdsAsociado.Last;
         _cdsAsociado.First;

         Bar1.Min := 0;
         Bar1.Max := _cdsAsociado.RecordCount;
         Bar1.Position := 0;

         with _cdsAsociado do
         while not Eof do
         begin
            Bar1.Position := RecNo;
            Label1.Caption := FieldByName('ID_IDENTIFICACION').AsString + '-' + FieldByName('ID_PERSONA').AsString + '-' +
                              Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                            FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                            FieldByName('NOMBRE').AsString);
            Application.ProcessMessages;
            Id := FieldByName('ID_IDENTIFICACION').AsInteger;
            Persona := FieldByName('ID_PERSONA').AsString;
            IdAgencia := FieldByName('ID_AGENCIA').AsInteger;
            IdTipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            Numero := FieldByName('NUMERO_CUENTA').AsInteger;
            Digito := FieldByName('DIGITO_CUENTA').AsInteger;

            if ((EdFechaJuvenil.Date - FieldByName('FECHA_NACIMIENTO').AsDateTime)/365.25) <= 14 then
              xEdad := true
            else
              xEdad := False;

            if ValidarJuvenil then
            begin
               _cdsJuvenil.Append;
               _cdsJuvenil.FieldByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               _cdsJuvenil.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
               _cdsJuvenil.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               _cdsJuvenil.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               _cdsJuvenil.FieldByName('SEXO').AsString := FieldByName('SEXO').AsString;
               _cdsJuvenil.Post;
             end
             else
             begin
               IBSQL3.SQL.Clear;
               IBSQL3.SQL.Add('insert into "gen$juvenildetalle_new" VALUES(:ID,:PERSONA,:AG,:CUENTA,:SEXO)');
               IBSQL3.ParamByName('ID').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               IBSQL3.ParamByName('PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
               IBSQL3.ParamByName('AG').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL3.ParamByName('CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBSQL3.ParamByName('SEXO').AsString := FieldByName('SEXO').AsString;
               try
                 IBSQL3.ExecQuery;
                 IBSQL3.Transaction.Commit;
                 IBSQL3.Transaction.StartTransaction;
               except
                 IBSQL3.Transaction.Rollback;
                 raise;
                 Exit;
               end;
             end;
            Next;
         end; // fin del while
         _cdsJuvenil.ApplyUpdates(-1);
         _ibt.Commit;
         btnProcesar.Enabled := False;
         ShowMessage('Proceso finalizado con exito!');
end;


function TfrmInformeAsociadosDetalle.ValidarJuvenil:Boolean;
var
  FechaCorte:TDateTime;
  idT:Integer;
  personaT:string;
begin
        SaldoMinimoApo := 100000;
        SaldoMinimoRin := 6000;
        SaldoMinimoJuv := 50000;

        Ano := IntToStr(YearOf(fFechaActual));
        Fecha1 := EncodeDate(YearOf(fFechaActual),01,01);
        Fecha2 := fFechaActual;

        SaldoAportes := 0;
        SaldoRindediario := 0;
        SaldoJuvenil := 0;

        SaldoMinimoApo:= 0;
        SaldoMinimoRin:= 0;
        SaldoMinimoJuv:= 0;

        xAportesAct    := False;
        xRindediario   := False;
        xJuvenil       := False;
        xDeudas        := True;
        xFianzas       := True;

        FechaCorte := edFecha.Date;

// Verificación de Asociado y Requisitos
        Ag := IdAgencia;
        Tp := IdTipo;
        Nm := Numero;
        Dg := Digito;

        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
        IBSQL1.ParamByName('AG').AsInteger := Ag;
        IBSQL1.ParamByName('TP').AsInteger := Tp;
        IBSQL1.ParamByName('NM').AsInteger := Nm;
        IBSQL1.ParamByName('DG').AsInteger := Dg;
        IBSQL1.ParamByName('ANO').AsString := Ano;
        IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;
        IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;
        try
          IBSQL1.ExecQuery;
          if IBSQL1.RecordCount > 0 then begin
            SaldoJuvenil := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
            if SaldoJuvenil >= SaldoMinimoJuv then
              xJuvenil := True
            else begin
              xJuvenil := False;
            end;
          end
          else
          begin
            SaldoJuvenil := 0;
            xJuvenil := False;
          end;
        except
          IBSQL1.Transaction.Rollback;
          raise;
        end;


        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('SELECT ID_IDENTIFICACION,ID_PERSONA FROM "cap$maestrotitular" where ID_TIPO_CAPTACION = :TP AND NUMERO_CUENTA = :NMJ AND NUMERO_TITULAR = 1');
        IBSQL1.ParamByName('TP').AsInteger := Tp;
        IBSQL1.ParamByName('NMJ').AsInteger := Nm;
        try
         IBSQL1.ExecQuery;
         idT := IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger;
         personaT := IBSQL1.FieldByName('ID_PERSONA').AsString;
        except
          IBSQL1.Transaction.Rollback;
          raise;
        end;

        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('SELECT ID_AGENCIA, ID_TIPO_CAPTACION,NUMERO_CUENTA, DIGITO_CUENTA FROM "cap$maestrotitular" where ID_IDENTIFICACION = :IDT AND ID_PERSONA = :IDPERSONAT AND ID_TIPO_CAPTACION = 1');
        IBSQL1.ParamByName('IDT').AsInteger := idT;
        IBSQL1.ParamByName('IDPERSONAT').AsString := personaT;
        try
         IBSQL1.ExecQuery;
         if IBSQL1.RecordCount > 0 then
           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
           IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
           IBSQL2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
           IBSQL2.ParamByName('NM').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
           IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
           IBSQL2.ParamByName('ANO').AsString := Ano;
           IBSQL2.ParamByName('FECHA1').AsDate := Fecha1;
           IBSQL2.ParamByName('FECHA2').AsDate := Fecha2;
           try
            IBSQL2.ExecQuery;
            if IBSQL2.RecordCount > 0 then begin
              SaldoAportes := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
              if SaldoAportes >= SaldoMinimoApo then
                  xAportesAct := True
                else begin
                  xAportesAct := False;
                end;
              end
              else
              begin
                SaldoAportes := 0;
                xAportesAct := False;
              end;
           except
             IBSQL2.Transaction.Rollback;
             raise;
           end;
        except
         IBSQL1.Transaction.Rollback;
         raise;
        end;

        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('SELECT ID_AGENCIA, ID_TIPO_CAPTACION,NUMERO_CUENTA, DIGITO_CUENTA FROM "cap$maestrotitular" where ID_IDENTIFICACION = :IDT AND ID_PERSONA = :IDPERSONAT AND ID_TIPO_CAPTACION = 2');
        IBSQL1.ParamByName('IDT').AsInteger := idT;
        IBSQL1.ParamByName('IDPERSONAT').AsString := personaT;
        try
         IBSQL1.ExecQuery;
         if IBSQL1.RecordCount > 0 then
           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
           IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
           IBSQL2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
           IBSQL2.ParamByName('NM').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
           IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
           IBSQL2.ParamByName('ANO').AsString := Ano;
           IBSQL2.ParamByName('FECHA1').AsDate := Fecha1;
           IBSQL2.ParamByName('FECHA2').AsDate := Fecha2;
           try
            IBSQL2.ExecQuery;
            if IBSQL2.RecordCount > 0 then begin
              SaldoRindediario := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
              if SaldoRindediario >= SaldoMinimoRin then
                  xRindediario := True
                else begin
                  xRindediario := False;
                end;
              end
              else
              begin
                SaldoRindediario := 0;
                xRindediario := False;
              end;
           except
             IBSQL2.Transaction.Rollback;
             raise;
           end;
        except
         IBSQL1.Transaction.Rollback;
         raise;
        end;

        IBSQL1.Close;
        IBSQL1.SQL.Clear;
        IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
        IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
        IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION <= 3');
        IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := idT;
        IBSQL1.ParamByName('ID_PERSONA').AsString := personaT;
        try
         IBSQL1.ExecQuery;
         xDeudas := True;
         if IBSQL1.RecordCount > 0 then begin
           if (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or
              (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then begin
              xDeudas := False;
              Exit;
           end;

           while not IBSQL1.Eof do begin
             if ObtenerDiasMora(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2) > 0 then
               xDeudas := False;
             IBSQL1.Next;
           end;
         end;
         except
          IBSQL1.Transaction.Rollback;
          raise;
        end;    
// Fin verificación de Requisitos

        if (xAportesAct) and (xRindediario) and (xJuvenil) and (xDeudas) and (xEdad) then
          Result := True
        else
          Result := False;

// Fin Verificar Valores

end;

end.
