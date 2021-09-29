unit UnitInformeAsociadosHabilesInHabiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBSQL, DBClient, FR_DSet, FR_DBSet, FR_Class,
  FR_Desgn, FR_ChBox;

type
  TfrmInformeAsociadosHabilesInHabiles = class(TForm)
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    Bar1: TProgressBar;
    IBTransaction1: TIBTransaction;
    IBQAsociados: TIBQuery;
    IBQPersona: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    CDSHabil: TClientDataSet;
    CDSHabilID_AGENCIA: TIntegerField;
    CDSHabilNUMERO_CUENTA: TIntegerField;
    CDSHabilDIGITO_CUENTA: TIntegerField;
    CDSHabilID_TIPO_CAPTACION: TIntegerField;
    CDSHabilASOCIADO: TStringField;
    CDSHabilDOCUMENTO: TStringField;
    CDSInHabil: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    CDSInHabilEDUCACION: TBooleanField;
    CDSInHabilAPORTES: TBooleanField;
    CDSInHabilAHORROS: TBooleanField;
    CDSInHabilJUVENIL: TBooleanField;
    CDSInHabilCARTERA: TBooleanField;
    CDSInHabilFIANZAS: TBooleanField;
    rgInforme: TRadioGroup;
    btnReporte: TBitBtn;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    frReport2: TfrReport;
    Label1: TLabel;
    frCheckBoxObject1: TfrCheckBoxObject;
    frDesigner1: TfrDesigner;
    DSHabil: TDataSource;
    DSInHabil: TDataSource;
    CDSHabilTOTAL: TAggregateField;
    CDSInHabilTOTAL: TAggregateField;
    IBSQL3: TIBSQL;
    CDInHabil: TIBQuery;
    CDInHabilID_TIPO_CAPTACION: TSmallintField;
    CDInHabilID_AGENCIA: TSmallintField;
    CDInHabilNUMERO_CUENTA: TIntegerField;
    CDInHabilDIGITO_CUENTA: TSmallintField;
    CDInHabilDOCUMENTO: TIBStringField;
    CDInHabilASOCIADO: TIBStringField;
    CDInHabilEDUCACION: TSmallintField;
    CDInHabilAPORTES: TSmallintField;
    CDInHabilDEUDAS: TSmallintField;
    CDHabil: TIBQuery;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    function ValidarAsociado: Boolean;
    { Public declarations }
  end;

var
  frmInformeAsociadosHabilesInHabiles: TfrmInformeAsociadosHabilesInHabiles;

  xEducacion:Boolean;
  xAportesAct:Boolean;
  xAportesAnt:Boolean;
  xRindediario:Boolean;
  xJuvenil:Boolean;
  xDeudas:Boolean;
  xFianzas:Boolean;
  xApertura:Boolean;
  xAperturaJ:Boolean;
  xJuridico:Boolean;

  Ag:Integer;
  Tp:Integer;
  Nm:Integer;
  Dg:Integer;

  AgJ:Integer;
  TpJ:Integer;
  NmJ:Integer;
  DgJ:Integer;


  SaldoApoAnt:Currency;
  SaldoApoAct:Currency;
  SaldoValido:Currency;
  SaldoMinimo:Currency;
  SaldoRindediario:Currency;
  vJuvenil:Currency;
  vJuvenilYa:Boolean;

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

procedure TfrmInformeAsociadosHabilesInHabiles.btnCerrarClick(
  Sender: TObject);
begin
        Close;
end;

function TfrmInformeAsociadosHabilesInHabiles.ValidarAsociado: Boolean;
var
  FechaCorte:TDateTime;
begin
        SaldoMinimoApo := 88000;
        SaldoMinimoRin := 5000;
        SaldoMinimoJuv := 66000;

        Ano := '2005';
        Fecha1 := EncodeDate(2005,10,01);
        Fecha2 := EncodeDate(2005,10,15);

        xAportesAct    := False;
        xRindediario   := False;
//        xAportesAnt    := False;
        xJuvenil       := False;
        xDeudas        := True;
        xFianzas       := True;
        xApertura      := True;

        FechaCorte := Encodedate(2005,10,15);

        Result := True;

// Verificación de Asociado y Requisitos
              Ag := IdAgencia;
              Tp := IdTipo;
              Nm := Numero;
              Dg := Digito;

              xApertura := True;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_MES(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
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
                  SaldoApoAct := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoApoAct >= SaldoMinimoApo then
                    xAportesAct := True
                  else
                    xAportesAct := False;
                end
                else
                begin
                  SaldoApoAct := 0;
                  xAportesAct := False;
                end;
              except
                IBSQL1.Transaction.Rollback;
                raise;
                Result := False;
                Exit;
              end;

{              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
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
                  else
                    xRindediario := False;
                end
                else
                begin
                  SaldoRindediario := 0;
                  xRindediario := False;
                end;
              except
                Transaction.Rollback;
                raise;
                Result := False;
                Exit;
              end;
}

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
              IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
              IBSQL1.ParamByName('ID_PERSONA').AsString := Persona;
              try
               IBSQL1.ExecQuery;
               xJuridico := False;
               xDeudas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xDeudas := False;
                   if (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or
                      (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then
                      begin
                       xDeudas := False;
                       xJuridico := True;
                      end;
                   IBSQL1.Next;
                 end;
               end;
               except
                IBSQL1.Transaction.Rollback;
                raise;
                Result := False;
                Exit;
              end;


              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colgarantias"');
              IBSQL1.SQL.Add('inner join "col$colocacion" ON ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
              IBSQL1.SQL.Add('"col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
              IBSQL1.SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA and "col$colocacion".ID_ESTADO_COLOCACION < 4');
//              IBSQL1.SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
              IBSQL1.ParamByName('ID_PERSONA').AsString := Persona;
              try
               IBSQL1.ExecQuery;
               xFianzas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
//                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     if (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or
                        (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then
                            xDeudas := False;
//                          xFianzas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                IBSQL1.Transaction.Rollback;
                raise;
                Result := False;
                Exit;
              end;

 {
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
                    IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
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
                         if IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency < SaldoMinimoJuv then
                           xJuvenil := False;
                         IBSQL2.Next;
                      end;

                    except
                      Transaction.Rollback;
                      raise;
                    end;
                 IBSQL1.Next;
                end;

               except
                Transaction.Rollback;
                raise;
                Result := False;
                Exit;
              end;
}
// Fin verificación de Requisitos

// Fin Verificar Valores

end;

procedure TfrmInformeAsociadosHabilesInHabiles.btnProcesarClick(
  Sender: TObject);
begin
        if MessageDlg('Procesar Elimina la tabla anterior'+#13+'Seguro de Continuar?',mtConfirmation,[mbyes,mbno],0) <> mrYes then
          Exit;

        with IBSQL3 do
        begin
         if Transaction.InTransaction then
            Transaction.StartTransaction;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('delete from "gen$habilesinhabiles"');
         try
          ExecQuery;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
        end;



        with IBQAsociados do
        begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT ');
         SQL.Add('  "cap$maestro".ID_AGENCIA,');
         SQL.Add('  "cap$maestro".ID_TIPO_CAPTACION,');
         SQL.Add('  "cap$maestro".NUMERO_CUENTA,');
         SQL.Add('  "cap$maestro".DIGITO_CUENTA,');
         SQL.Add('  "gen$persona".ID_IDENTIFICACION,');
         SQL.Add('  "gen$persona".ID_PERSONA,');
         SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
         SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
         SQL.Add('  "gen$persona".NOMBRE,');
         SQL.Add('  "gen$persona".EDUCACION');
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
//         SQL.Add('  and ("cap$maestro".FECHA_APERTURA BETWEEN ''2005/10/01'' AND ''2005/10/15'')'); 
         try
          Open;
          Last;
          First;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;

         Bar1.Min := 0;
         Bar1.Max := RecordCount;
         Bar1.Position := 0;

         IBSQL3.SQL.Clear;
         IBSQL3.SQL.Add('insert into "gen$habilesinhabiles" values (:ID_IDENTIFICACION,:ID_PERSONA,:HABIL,:EDUCACION,:APORTES,:DEUDAS,:JURIDICO)');
         IBSQL3.Close;

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
            xEducacion := False;
            if FieldByName('EDUCACION').AsInteger <> 0 then
                xEducacion := True;
            if ValidarAsociado then
            if (xAportesAct) and (xEducacion) and (xDeudas) then
            begin
               CDSHabil.Open;
               CDSHabil.Append;
               CDSHabil.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               CDSHabil.FieldByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               CDSHabil.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               CDSHabil.FieldByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               CDSHabil.FieldByName('DOCUMENTO').AsString := FieldByName('ID_PERSONA').AsString;
               CDSHabil.FieldByName('ASOCIADO').AsString := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                            FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                            FieldByName('NOMBRE').AsString);
               CDSHabil.Post;
               CDSHabil.Close;
               IBSQL3.Close;
               IBSQL3.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               IBSQL3.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
               IBSQL3.ParamByName('HABIL').AsInteger := 1;
               IBSQL3.ParamByName('EDUCACION').AsInteger := 0;
               IBSQL3.ParamByName('APORTES').AsInteger := 0;
               IBSQL3.ParamByName('DEUDAS').AsInteger := 0;
               IBSQL3.ParamByName('JURIDICO').AsInteger := 0;
               try
                IBSQL3.ExecQuery;
               except
                Transaction.Rollback;
                raise;
                Exit;
               end;
            end
            else
            begin
               CDSInHabil.Open;
               CDSInHabil.Append;
               CDSInHabil.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               CDSInHabil.FieldByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               CDSInHabil.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               CDSInHabil.FieldByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               CDSInHabil.FieldByName('DOCUMENTO').AsString := FieldByName('ID_PERSONA').AsString;
               CDSInHabil.FieldByName('ASOCIADO').AsString := Trim(FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                            FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                            FieldByName('NOMBRE').AsString);
               CDSInHabil.FieldByName('EDUCACION').AsBoolean := not xEducacion;
               CDSInHabil.FieldByName('APORTES').AsBoolean := not xAportesAct;
               CDSInHabil.FieldByName('AHORROS').AsBoolean := not xRindediario;
               CDSInHabil.FieldByName('JUVENIL').AsBoolean := not xJuvenil;
               CDSInHabil.FieldByName('CARTERA').AsBoolean := not xDeudas;
               CDSInHabil.FieldByName('FIANZAS').AsBoolean := not xFianzas;
               CDSInHabil.Post;
               CDSInHabil.Close;
               IBSQL3.Close;
               IBSQL3.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               IBSQL3.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
               IBSQL3.ParamByName('HABIL').AsInteger := 0;
               IBSQL3.ParamByName('EDUCACION').AsInteger := BooleanoToInt(not xEducacion);
               IBSQL3.ParamByName('APORTES').AsInteger := BooleanoToInt(not xAportesAct);
               IBSQL3.ParamByName('DEUDAS').AsInteger := BooleanoToInt(not xDeudas);
               IBSQL3.ParamByName('JURIDICO').AsInteger := BooleanoToInt(xJuridico);
               try
                IBSQL3.ExecQuery;
               except
                Transaction.Rollback;
                raise;
                Exit;
               end;

            end;
            Next;
         end; // fin del while
        end; // fin del with IBQAsociados
        IBSQL3.Transaction.Commit;
        btnProcesar.Enabled := False;
        ShowMessage('Proceso finalizado con exito!');

end;

procedure TfrmInformeAsociadosHabilesInHabiles.btnReporteClick(
  Sender: TObject);
begin
        CDInHabil.Transaction.StartTransaction;
        case rgInforme.ItemIndex of
        1:
            with frReport1 do
            begin
              LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reporte\InfAsociadosInHabiles.frf');
              CDInHabil.Open;
//              frReport1.DesignReport;
              if PrepareReport then
                 ShowPreparedReport;
            end;
        0:
            with frReport1 do
            begin
              LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reporte\InfAsociadosHabiles.frf');
              CDHabil.Open;
//              frReport1.DesignReport;
              if PrepareReport then
                 ShowPreparedReport;
            end;
        end;
        CDInHabil.Transaction.Commit;
end;

procedure TfrmInformeAsociadosHabilesInHabiles.frReport1GetValue(
  const ParName: String; var ParValue: Variant);
begin
        if ParName = 'EMPRESA' then
           ParValue := Empresa;
        if ParName = 'NIT' then
           ParValue := Nit;
        if ParName = 'FECHA' then
           ParValue := fFechaActual;
        if ParName = 'OFICINA' then
           ParValue := Ciudad;
end;

procedure TfrmInformeAsociadosHabilesInHabiles.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
        if dmColocacion.IBSQL.Transaction.InTransaction then
           dmColocacion.IBSQL.Transaction.Rollback;
        dmColocacion.IBSQL.Transaction.StartTransaction;
end;

procedure TfrmInformeAsociadosHabilesInHabiles.FormCloseQuery(
  Sender: TObject; var CanClose: Boolean);
begin
 dmColocacion.IBSQL.Transaction.Commit;
 dmColocacion.Free;
 CanClose := True;
end;

end.
