unit UnitInformeAsociadosHabilesInHabiles;

interface

uses
  DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, IBCustomDataSet, DataSetToExcel,
  FR_Class, FR_E_TXT, FR_E_RTF, Provider, FR_ChBox, FR_DSet, FR_DBSet,
  DBClient, IBSQL, IBQuery, IBDatabase,
  FR_Desgn, frRtfExp, frexpimg;

type
  TfrmInformeAsociadosHabilesInHabiles = class(TForm)
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    Bar1: TProgressBar;
    IBTransaction1: TIBTransaction;
    _ibqReporte: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    _cdsReporte: TClientDataSet;
    rgInforme: TRadioGroup;
    btnReporte: TBitBtn;
    frReport1: TfrReport;
    DataSet: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
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
    GroupBox1: TGroupBox;
    chkAportes: TCheckBox;
    chkDeudas: TCheckBox;
    chkAhorros: TCheckBox;
    chkJuvenil: TCheckBox;
    chkJuridico: TCheckBox;
    chkFianzas: TCheckBox;
    chkEducacion: TCheckBox;
    frRTFExport1: TfrRTFExport;
    btnAExcel: TBitBtn;
    SD1: TSaveDialog;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnAExcelClick(Sender: TObject);
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
  IBSQL4: TIBSQL;  
begin
        IBSQL4 := TIBSQL.Create(nil);
        IBSQL4.Database := dmGeneral.IBDatabase1;
        IBSQL4.Transaction := dmGeneral.IBTransaction1;
        with IBSQL4 do begin
          if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add(' SALDO_MINIMO');
          SQL.Add('FROM');
          SQL.Add(' "cap$tipocaptacion"');
          SQL.Add('WHERE');
          SQL.Add(' ID_TIPO_CAPTACION = :ID');
// Aportaciones sociales
          ParamByName('ID').AsInteger := 1;
          try
           ExecQuery;
           SaldoMinimoApo := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

// Ahorro Rindediario
          Close;
          ParamByName('ID').AsInteger := 2;
          try
           ExecQuery;
           SaldoMinimoRin := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;
// Ahorro Juvenil
          Close;
          ParamByName('ID').AsInteger := 4;
          try
           ExecQuery;
           SaldoMinimoJuv := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

          Transaction.Commit;
          Close;
        end;

        Ano := IntToStr(YearOf(edFecha.Date));
        Fecha1 := EncodeDate(YearOf(edFecha.Date),01,01);
        Fecha2 := edFecha.Date;

        xAportesAct    := False;
        xRindediario   := False;
        xJuvenil       := False;
        xDeudas        := True;
        xFianzas       := True;
        xJuridico      := True;
//        xApertura      := True;

        FechaCorte := edFecha.Date;

        Result := True;

// Verificación de Asociado y Requisitos
              Ag := IdAgencia;
              Tp := IdTipo;
              Nm := Numero;
              Dg := Digito;

              xApertura := True;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
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

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
              IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
              IBSQL1.ParamByName('ID_PERSONA').AsString := Persona;
              try
               IBSQL1.ExecQuery;
               xJuridico := True;
               xDeudas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDiasMoraAFecha(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2, FechaCorte) > 0 then
                     xDeudas := False;
                   if (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or
                      (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then
                      begin
                       xJuridico := False;
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
                     if (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or
                        (IBSQL1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then
                        begin
                            xFianzas := False;
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
        FreeAndNil(IBSQL4);
// Fin verificación de Requisitos

// Fin Verificar Valores


end;

procedure TfrmInformeAsociadosHabilesInHabiles.btnProcesarClick(
  Sender: TObject);
var
  _cdsAsociado:TClientDataSet;
  _dspAsociado:TDataSetProvider;
  _ibqAsociado:TIBQuery;
  _ibtran : TIBTransaction;
  _cxEducacion, _cxAportes, _cxAhorros, _cxJuvenil, _cxDeudas, _cxFianzas, _cxJuridico:Boolean;
begin
        if MessageDlg('Procesar Elimina la tabla anterior'+#13+'Seguro de Continuar?',mtConfirmation,[mbyes,mbno],0) <> mrYes then
          Exit;


        _cxEducacion := chkEducacion.Checked;
        _cxAportes := chkAportes.Checked;
        _cxAhorros := chkAhorros.Checked;
        _cxJuvenil := chkJuvenil.Checked;
        _cxDeudas := chkDeudas.Checked;
        _cxJuridico := chkJuridico.Checked;
        _cxFianzas := chkFianzas.Checked;

        with IBSQL3 do
        begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('delete from "gen$habilesinhabilesn"');
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

        _ibqAsociado := TIBQuery.Create(nil);
        _ibtran := TIBTransaction.Create(nil);
        _ibtran.DefaultDatabase := dmGeneral.IBDataBase1;
        _ibtran.StartTransaction;
        _ibqAsociado.Transaction := _ibtran;

       _ibqHabilidad.Close;
       _cdsHabilidad.Close;
       if _ibt.InTransaction then
         _ibt.Rollback;
       _ibt.StartTransaction;
       _ibqHabilidad.Open;
       _cdsHabilidad.Open;

        with _ibqAsociado do
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
            xEducacion := False;
            if FieldByName('EDUCACION').AsInteger <> 0 then
                xEducacion := True;
            if ValidarAsociado then
            begin
               _cdsHabilidad.Append;
               _cdsHabilidad.FieldByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
               _cdsHabilidad.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
               if (xAportesAct) and
                  (xEducacion)  and
                  (xDeudas and xJuridico) {    and
                  (xFianzas)    and
                  (xJuridico) }  then
                _cdsHabilidad.FieldByName('HABIL').AsInteger := 1
               else
                _cdsHabilidad.FieldByName('HABIL').AsInteger := 0;
               _cdsHabilidad.FieldByName('EDUCACION').AsInteger := BooleanoToInt(xEducacion);
               _cdsHabilidad.FieldByName('APORTES').AsInteger := BooleanoToInt(xAportesAct);
               _cdsHabilidad.FieldByName('DEUDAS').AsInteger := BooleanoToInt(xDeudas and xJuridico);
               _cdsHabilidad.FieldByName('FIANZAS').AsInteger := BooleanoToInt(xFianzas);
               _cdsHabilidad.FieldByName('JURIDICO').AsInteger := BooleanoToInt(xJuridico);
               _cdsHabilidad.FieldByName('HABILITADA').AsInteger := 1;
               _cdsHabilidad.FieldByName('YA_VOTO').AsInteger := 0;
               _cdsHabilidad.FieldByName('FECHA_VOTO').Clear;
               _cdsHabilidad.FieldByName('HORA_VOTO').Clear;
               _cdsHabilidad.FieldByName('VALIDACION').Clear;
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

procedure TfrmInformeAsociadosHabilesInHabiles.btnReporteClick(
  Sender: TObject);
begin
        if IBTransaction1.InTransaction then
          IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
        _ibqReporte.Close;
        _ibqReporte.Open;
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


        case rgInforme.ItemIndex of
        1:begin
            _cdsReporte.Filtered := False;
            _cdsReporte.Filter := 'HABIL = 0';
            _cdsReporte.Filtered := True;
            with frReport1 do
            begin
              LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reporte\InfAsociadosInHabiles.frf');
              frReport1.Dictionary.Variables['EMPRESA'] := QuotedStr(Empresa);
              frReport1.Dictionary.Variables['NIT'] := QuotedStr(Nit);
              frReport1.Dictionary.Variables['FECHA'] := QuotedStr(DateToStr(edFecha.Date));
              frReport1.Dictionary.Variables['OFICINA'] := QuotedStr(Ciudad);
              if PrepareReport then
                 ShowPreparedReport;
            end;
          end;
        0:begin
            _cdsReporte.Filtered := False;
            _cdsReporte.Filter := 'HABIL = 1';
            _cdsReporte.Filtered := True;
            with frReport1 do
            begin
              LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reporte\InfAsociadosHabiles.frf');
              frReport1.Dictionary.Variables['EMPRESA'] := QuotedStr(Empresa);
              frReport1.Dictionary.Variables['NIT'] := QuotedStr(Nit);
              frReport1.Dictionary.Variables['FECHA'] := QuotedStr(DateToStr(edFecha.Date));
              frReport1.Dictionary.Variables['OFICINA'] := QuotedStr(Ciudad);
              if PrepareReport then
                 ShowPreparedReport;
            end;
          end;
        end;
       _cdsReporte.Close;
       IBTransaction1.Commit;
end;

procedure TfrmInformeAsociadosHabilesInHabiles.FormCreate(Sender: TObject);
begin
        if _ibt.InTransaction then
          _ibt.Rollback;
        _ibt.StartTransaction;
        _ibqHabilidad.Open;
        _cdsHabilidad.Open;

        if IBTransaction1.InTransaction then
           IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
        _ibqReporte.Open;

        edFecha.Date := fFechaActual;
end;

procedure TfrmInformeAsociadosHabilesInHabiles.FormCloseQuery(
  Sender: TObject; var CanClose: Boolean);
begin
 CanClose := True;
end;

procedure TfrmInformeAsociadosHabilesInHabiles.btnAExcelClick(
  Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
        if IBTransaction1.InTransaction then
          IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
        _ibqReporte.Close;
        _ibqReporte.Open;
        _cdsReporte.Close;
        _cdsReporte.Open;
        case rgInforme.ItemIndex of
        1:begin
            _cdsReporte.Filtered := False;
            _cdsReporte.Filter := 'HABIL = 0';
            _cdsReporte.Filtered := True;
        end;
        0:begin
            _cdsReporte.Filtered := False;
            _cdsReporte.Filter := 'HABIL = 1';
            _cdsReporte.Filtered := True;
        end;
        end;

          if (SD1.Execute) then
          begin
           _cdsReporte.First;
           ExcelFile := TDataSetToExcel.Create(_cdsReporte,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

end.
