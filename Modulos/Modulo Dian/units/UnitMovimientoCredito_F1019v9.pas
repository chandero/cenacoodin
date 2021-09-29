unit UnitMovimientoCredito_F1019v9;

interface

uses
  DateUtils, StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, Grids, StdCtrls,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, JvSpecialProgress, XLSfile,
  DBGrids, IBDatabase, DataSetToExcel;

type
  TfrmMovimientoCredito_F1019v9 = class(TForm)
    Bar2: TJvSpecialProgress;
    Bar1: TJvSpecialProgress;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    btnAExcelPrimero: TBitBtn;
    IBQuery1: TIBQuery;
    sd1: TSaveDialog;
    IBSQL2: TIBSQL;
    IBSQL1: TIBQuery;
    Bar3: TJvSpecialProgress;
    IBQuery2: TIBQuery;

    Label3: TLabel;
    JvSaldo: TJvCurrencyEdit;
    IBGMF: TIBQuery;
    CDSInfo: TClientDataSet;
    CDSInfoTIPODOCUMENTO: TIntegerField;
    CDSInfoDOCUMENTO: TStringField;
    CDSInfoPRIMER_APELLIDO: TStringField;
    CDSInfoSEGUNDO_APELLIDO: TStringField;
    CDSInfoNOMBRE: TStringField;
    CDSInfoPERIODO: TIntegerField;
    CDSInfoSEGUNDO_NOMBRE: TStringField;
    CDSInfoRAZONSOCIAL: TStringField;
    CDSInfoDIRECCION: TStringField;
    CDSInfoDEPARTAMENTO: TIntegerField;
    CDSInfoMUNICIPIO: TIntegerField;
    CDSInfoPAIS: TIntegerField;
    CDSInfoSALDOFINAL: TCurrencyField;
    CDSInfoPROMEDIO: TCurrencyField;
    CDSInfoMEDIANA: TCurrencyField;
    CDSInfoMAXIMO: TCurrencyField;
    CDSInfoMINIMO: TCurrencyField;
    CDSInfoVALORCREDITO: TCurrencyField;
    CDSInfoNUMERODEBITO: TIntegerField;
    CDSInfoNUMEROCREDITO: TIntegerField;
    CDSInfoPROMEDIOCREDITO: TCurrencyField;
    CDSInfoMEDIANACREDITO: TCurrencyField;
    CDSInfoDEBITO: TCurrencyField;
    CDSInfoPROMEDIODEBITO: TCurrencyField;
    Data: TDBGrid;
    DSData: TDataSource;
    Transaction: TIBTransaction;
    Label4: TLabel;
    cmbMes: TComboBox;
    CDSsaldosdia: TClientDataSet;
    CDSInfoCUENTA: TStringField;
    CDSInfoTIPOCUENTA: TIntegerField;
    CDSInfoGMF: TIntegerField;
    CDSsaldosdiaDIA: TIntegerField;
    CDSsaldosdiaSALDOANTERIOR: TCurrencyField;
    CDSsaldosdiaDEBITO: TCurrencyField;
    CDSsaldosdiaCREDITO: TCurrencyField;
    CDSsaldosdiaSALDODIA: TCurrencyField;
    CDSpersona: TClientDataSet;
    CDSpersonaID_PERSONA: TStringField;
    CDSpersonaCREDITO: TCurrencyField;
    CDSpersonaSALDO: TCurrencyField;
    CDSsaldosdiaTIPO: TIntegerField;
    CDStitulares: TClientDataSet;
    CDStitularesCUENTA: TStringField;
    CDStitularesCONCEPTO: TIntegerField;
    CDStitularesTIPODOCUMENTO: TIntegerField;
    CDStitularesNUMERODOCUMENTO: TStringField;
    CDStitularesPRIMER_APELLIDO: TStringField;
    CDStitularesSEGUNDO_APELLIDO: TStringField;
    CDStitularesNOMBRE: TStringField;
    CDStitularesSEGUNDO_NOMBRE: TStringField;
    CDStitularesRAZON_SOCIAL: TStringField;
    CDSfinal: TClientDataSet;
    CDSfinalTIPODOCUMENTO: TIntegerField;
    CDSfinalDOCUMENTO: TStringField;
    CDSfinalPRIMER_APELLIDO: TStringField;
    CDSfinalSEGUNDO_APELLIDO: TStringField;
    CDSfinalNOMBRE: TStringField;
    CDSfinalSEGUNDO_NOMBRE: TStringField;
    CDSfinalRAZONSOCIAL: TStringField;
    CDSfinalDIRECCION: TStringField;
    CDSfinalMUNICIPIO: TIntegerField;
    CDSfinalDEPARTAMENTO: TIntegerField;
    CDSfinalPAIS: TIntegerField;
    CDSfinalTIPOCUENTA: TIntegerField;
    CDSfinalCUENTA: TStringField;
    CDSfinalGMF: TIntegerField;
    CDSfinalSALDOFINAL: TCurrencyField;
    CDSfinalPROMEDIO: TCurrencyField;
    CDSfinalMEDIANA: TCurrencyField;
    CDSfinalMAXIMO: TCurrencyField;
    CDSfinalMINIMO: TCurrencyField;
    CDSfinalVALORCREDITO: TCurrencyField;
    CDSfinalNUMEROCREDITO: TIntegerField;
    CDSfinalPROMEDIOCREDITO: TCurrencyField;
    CDSfinalMEDIANACREDITO: TCurrencyField;
    CDSfinalVALORDEBITO: TCurrencyField;
    CDSfinalNUMERODEBITO: TIntegerField;
    CDSfinalPROMEDIODEBITO: TCurrencyField;
    CDSInfoID_AGENCIA: TIntegerField;
    CDSInfoID_TIPO_CAPTACION: TIntegerField;
    CDSInfoNUMERO_CUENTA: TIntegerField;
    CDSInfoDIGITO_CUENTA: TIntegerField;
    btnAExcelSegundo: TBitBtn;
    CDSInfoDV: TStringField;
    CDSfinalDV: TStringField;
    CDStitularesDV: TStringField;
    btnAExcelHoja: TBitBtn;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAExcelPrimeroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAExcelSegundoClick(Sender: TObject);
    procedure btnAExcelHojaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type TPersona = class(TObject)
        public
           TipoDocumento: String;
           NumeroDocumento: String;
           DigitoVerificacion: String;
           PrimerApellido: String;
           SegundoApellido: String;
           PrimerNombre: String;
           SegundoNombre: String;
           RazonSocial: String;
           Direccion: String;
           Departamento: String;
           Municipio: String;
           Pais: String;
  end;

var
  frmMovimientoCredito_F1019v9: TfrmMovimientoCredito_F1019v9;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmMovimientoCredito_F1019v9.btnProcesarClick(Sender: TObject);
var
  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Dr:string;
  Dpto :string;
  Mn:string;
  Dias,Mes,Total:Integer;
  Cuenta:string;
  iAgencia,iTipo,iCuenta,iDigito:Integer;
  vCodMunicipio :string;
  _sNombre :string;
  _cSaldoCheque :Currency;
  Persona: TPersona;
  FechaCorte, FechaInicial: TDateTime;
  FechaDia: TDateTime;
  SaldoInicial: Currency;
  SaldoFinal, Promedio, Mediana, Maximo, Minimo, ValorCredito, PromedioCredito, MedianaCredito, ValorDebito, PromedioDebito: Currency;
  NumeroCredito, NumeroDebito, Salto: Integer;
  asociado: String;
begin
        Application.ProcessMessages;

        Persona := TPersona.Create;

        Mes := cmbMes.ItemIndex + 1;
        Dias := DaysInAMonth(EdPeriodo.Value, Mes);
        TryEncodeDate(EdPeriodo.Value, Mes, 1, FechaInicial);

        TryEncodeDate(EdPeriodo.Value, Mes, DaysInAMonth(EdPeriodo.Value, Mes), FechaCorte);

        CDSinfo.Open;

        with IBQuery1 do
        begin
         if Transaction.Intransaction then Transaction.Commit;
         Transaction.StartTransaction;
         SQL.Clear;
         SQL.Add('select mt.*, m.*, me.*');
         SQL.Add('from');
         SQL.Add('"cap$maestrotitular" mt ');
         SQL.Add('inner join "cap$maestro" m ON m.ID_AGENCIA = mt.ID_AGENCIA and m.ID_TIPO_CAPTACION = mt.ID_TIPO_CAPTACION and m.NUMERO_CUENTA = mt.NUMERO_CUENTA and m.DIGITO_CUENTA = mt.DIGITO_CUENTA');
         SQL.Add('left join "cap$maestroexcentas" me ON m.ID_AGENCIA = me.ID_AGENCIA and m.ID_TIPO_CAPTACION = me.ID_TIPO_CAPTACION and m.NUMERO_CUENTA = me.NUMERO_CUENTA and m.DIGITO_CUENTA = me.DIGITO_CUENTA');
         SQL.Add('where mt.ID_TIPO_CAPTACION IN (2,3,4) and m.FECHA_APERTURA <= :FECHA_CORTE and mt.NUMERO_TITULAR = 1');
         ParamByName('FECHA_CORTE').AsDate := FechaCorte;
         try
           Open;
           Last;
           First;
           Bar1.Minimum := 0;
           Bar1.Maximum := Recordcount;
         except
           Transaction.Rollback;
           raise;
         end;



         while not Eof do begin
           Bar1.Position := RecNo;
           Application.ProcessMessages;

           SaldoInicial := 0;
           SaldoFinal := 0;
           Promedio := 0;
           Mediana := 0;
           Maximo := 0;
           Minimo := 0;
           ValorCredito := 0;
           PromedioCredito := 0;
           MedianaCredito := 0;
           ValorDebito := 0;
           PromedioDebito:=0;
           NumeroCredito := 0;
           NumeroDebito := 0;

           CDSinfo.Insert;

           Persona.TipoDocumento := '';
           Persona.NumeroDocumento := '';
           Persona.DigitoVerificacion := '';
           Persona.PrimerApellido := '';
           Persona.SegundoApellido := '';
           Persona.PrimerNombre := '';
           Persona.SegundoNombre := '';
           Persona.RazonSocial := '';
           Persona.Direccion := '';
           Persona.Departamento := '';
           Persona.Municipio := '';
           Persona.Pais := '169';
//Busco Persona
         IBQuery2.Close;
         IBQuery2.SQL.Clear;
         IBQuery2.SQL.Add('SELECT p.*, d.* FROM "gen$persona" p');
         IBQuery2.SQL.Add('left join "gen$direccion" d on d.ID_IDENTIFICACION = p.ID_IDENTIFICACION and d.ID_PERSONA = p.ID_PERSONA');
         IBQuery2.SQL.Add('WHERE p.ID_IDENTIFICACION = :ID_IDENTIFICACION and p.ID_PERSONA = :ID_PERSONA');
         IBQuery2.ParamByName('ID_IDENTIFICACION').asInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
         IBQuery2.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
         IBQuery2.Open;
//Primera Parte, Datos del Asociado
         case IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger of
             1: Tp := '11';
             2: Tp := '12';
             3: Tp := '13';
             4: Tp := '31';
             6: Tp := '22';
             9: Tp := '11';//NUI son registrados como Registros Civiles
         end;

         Persona.TipoDocumento := Tp;
         if IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
         begin
            Id := LeftStr(IBQuery2.FieldByName('ID_PERSONA').AsString,Length(IBQuery2.FieldByName('ID_PERSONA').AsString)-1);
            Dg := RightStr(IBQuery2.FieldByName('ID_PERSONA').AsString,1);
         end
         else
         begin
            Id := IBQuery2.FieldByName('ID_PERSONA').AsString;
            Dg := '';
         end;

         Persona.NumeroDocumento := Id;
         Persona.DigitoVerificacion := Dg;

         if Tp <> '31' then
         begin
            Persona.PrimerApellido := IBQuery2.FieldByName('PRIMER_APELLIDO').AsString;
            Persona.SegundoApellido := IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString;
            _sNombre := Trim(IBQuery2.FieldByName('NOMBRE').AsString);
            Persona.PrimerNombre := _sNombre;
            if Pos(' ', _sNombre) > 0 then
            begin
              Persona.PrimerNombre := LeftStr(_sNombre,Pos(' ', _sNombre)-1);
              Persona.SegundoNombre := RightStr(_sNombre,Length(_sNombre) - Pos(' ', _sNombre));
            end;
         end
         else
         begin
                Persona.PrimerApellido := '';
                Persona.SegundoApellido := '';
                Persona.PrimerNombre := '';
                Persona.SegundoNombre := '';
         end;

         if Tp = '31' then
                Persona.RazonSocial := Trim(IBQuery2.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + IBQuery2.FieldByName('NOMBRE').AsString)
         else
                Persona.RazonSocial := '';


         Dr := Trim(IBQuery2.FieldByName('DIRECCION').AsString);
         Persona.Direccion := Dr;

         vCodMunicipio := IBQuery2.FieldByName('COD_MUNICIPIO').AsString;
         if (vCodMunicipio = '') Then vCodMunicipio := '00000';
         
         try
            if StrLen(PChar(vCodMunicipio)) = 4 then
             vCodMunicipio := '0' +  vCodMunicipio;
            if (vCodMunicipio = '') then vCodMunicipio := '00000';
             Dpto := FormatCurr('00',StrToInt(LeftStr(vCodMunicipio,2)));
             Mn := FormatCurr('000',StrToInt(RightStr(vCodMunicipio,3)));
           except
              begin
                Mn := '00';
                Dpto := '000';
              end;
         end;


         Persona.Departamento := Dpto;
         Persona.Municipio := Mn;

// Fin Primera Parte, Datos del Asociado

              // Evaluo Saldo Inicial
              IBQuery2.Close;
              if (Mes = 1) then
              begin
               IBQuery2.SQL.Clear;
               IBQuery2.SQL.Add('SELECT SALDO_INICIAL AS SALDO_ACTUAL FROM "cap$maestrosaldoinicial" s');
               IBQuery2.SQL.Add('WHERE s.ID_AGENCIA = :ID_AGENCIA and s.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and s.NUMERO_CUENTA = :NUMERO_CUENTA and s.DIGITO_CUENTA = :DIGITO_CUENTA and s.ANO = :ANHO');
               IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               IBQuery2.ParamByName('ANHO').AsInteger := EdPeriodo.Value;
              end
              else
              begin
               IBQuery2.SQL.Clear;
               IBQuery2.SQL.Add('SELECT SALDO_ACTUAL FROM SALDO_ACTUAL(:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA, :ANHO, :FECHA_INICIAL, :FECHA_FINAL)');

               IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               IBQuery2.ParamByName('ANHO').AsInteger := EdPeriodo.Value;
               IBQuery2.ParamByName('FECHA_INICIAL').AsDateTime := EncodeDate(EdPeriodo.Value, 01, 01);
               IBQuery2.ParamByName('FECHA_FINAL').AsDateTime := EncodeDate(EdPeriodo.Value, Mes - 1, DaysInAMonth(EdPeriodo.Value, Mes - 1));
              end;

              IBQuery2.Open;

              SaldoInicial := IBQuery2.FieldByName('SALDO_ACTUAL').AsCurrency;

              IBQuery2.Close;
              IBQuery2.SQL.Clear;
              IBQuery2.SQL.Add('SELECT * FROM "cap$extracto" s');
              IBQuery2.SQL.Add('WHERE s.ID_AGENCIA = :ID_AGENCIA and s.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and s.NUMERO_CUENTA = :NUMERO_CUENTA and s.DIGITO_CUENTA = :DIGITO_CUENTA');
              IBQuery2.SQL.Add('and s.FECHA_MOVIMIENTO BETWEEN :FECHA_INICIAL and :FECHA_FINAL');
              IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
              IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
              IBQuery2.ParamByName('FECHA_INICIAL').AsDateTime := FechaInicial;
              IBQuery2.ParamByName('FECHA_FINAL').AsDateTime := FechaCorte;
              IBQuery2.Open;

              CDSsaldosdia.Open;
              CDSsaldosdia.EmptyDataSet;
              FechaDia := FechaInicial;
              while FechaDia <= FechaCorte do
              begin
                 Application.ProcessMessages;
                 CDSsaldosdia.Insert;
                 CDSsaldosdiaDIA.Value := DayOf(FechaDia);
                 CDSsaldosdiaSALDOANTERIOR.Value := 0;
                 CDSsaldosdiaDEBITO.Value := 0;
                 CDSsaldosdiaCREDITO.Value := 0;
                 CDSsaldosdiaSALDODIA.Value := 0;
                 CDSsaldosdia.Post;
                 FechaDia := IncDay(FechaDia);
              end;

              while not IBQuery2.Eof do
              begin
                 Application.ProcessMessages;
                 CDSsaldosdia.Filter := '';
                 CDSsaldosdia.Filtered := False;
                 CDSsaldosdia.Filter := 'DIA = ' + IntToStr(DayOf(IBQuery2.FieldByName('FECHA_MOVIMIENTO').AsDateTime));
                 CDSsaldosdia.Filtered := True;
                 CDSsaldosdia.Edit;
                 CDSsaldosdiaDEBITO.Value := CDSsaldosdiaDEBITO.Value + IBQuery2.FieldByName('VALOR_CREDITO').AsCurrency;
                 CDSsaldosdiaCREDITO.Value := CDSsaldosdiaCREDITO.Value + IBQuery2.FieldByName('VALOR_DEBITO').AsCurrency;
                 CDSsaldosdiaTIPO.Value := IBQuery2.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
                 CDSsaldosdia.Post;
                 IBQuery2.Next;
              end;
                  CDSsaldosdia.Filter := '';
                  CDSsaldosdia.Filtered := False;
              // Calcular Saldos
              CDSsaldosdia.First;
              while not CDSsaldosdia.Eof do
              begin
                  CDSsaldosdia.Edit;
                  CDSsaldosdiaSALDOANTERIOR.Value := SaldoInicial;
                  CDSsaldosdiaSALDODIA.Value := SaldoInicial + CDSsaldosdiaCREDITO.Value - CDSsaldosdiaDEBITO.Value;
                  Saldoinicial := CDSsaldosdiaSALDODIA.Value;
                  CDSsaldosdia.Post;
                  CDSsaldosdia.Next;
              end;

              // Evaluar valores
              CDSsaldosdia.Last;

              SaldoFinal := CDSsaldosdiaSALDODIA.Value;

              CDSsaldosdia.First;
              while not CDSsaldosdia.Eof do
              begin
                  Promedio := Promedio + CDSsaldosdiaSALDODIA.Value;
                  CDSSaldosdia.Next;
              end;

              Promedio := Promedio / CDSsaldosdia.RecordCount;

              CDSsaldosdia.IndexName := 'cdssaldosdia_idx_saldodia';
              CDSsaldosdia.First;
              if (CDSsaldosdia.RecordCount mod 2 = 0) then
                Salto := (CDSsaldosdia.RecordCount + 2) div 2
              else
                Salto := (CDSsaldosdia.RecordCount + 1) div 2;
              CDSsaldosdia.MoveBy(Salto);

              Mediana := CDSsaldosdiaSALDODIA.Value;

              CDSsaldosdia.First;
              Minimo := CDSsaldosdiaSALDODIA.Value;
              CDSsaldosdia.Last;
              Maximo := CDSsaldosdiaSALDODIA.Value;

              CDSsaldosdia.IndexName := 'cdssaldosdia_idx_dia';
              CDSsaldosdia.Filter := 'CREDITO <> 0 and TIPO <> 23 and TIPO <> 31';
              CDSsaldosdia.Filtered := True;
              while not cdssaldosdia.Eof do
              begin
                  ValorCredito := ValorCredito + CDSsaldosdiaCREDITO.Value;
                  NumeroCredito := NumeroCredito + 1;
                  CDSsaldosdia.Next;
              end;


              if (NumeroCredito <> 0) then
                      PromedioCredito := ValorCredito / NumeroCredito
              else
                      PromedioCredito := 0;

              CDSsaldosdia.First;
              CDSsaldosdia.MoveBy(CDSsaldosdia.RecordCount div 2);
              MedianaCredito := CDSsaldosdiaCREDITO.Value;


              CDSsaldosdia.Filtered := False;
              CDSsaldosdia.Filter := 'DEBITO <> 0 and TIPO <> 23 and TIPO <> 31';
              CDSsaldosdia.Filtered := True;

              while not cdssaldosdia.Eof do
              begin
                  ValorDebito := ValorDebito + CDSsaldosdiaDEBITO.Value;
                  NumeroDebito := NumeroDebito + 1;
                  CDSsaldosdia.Next;
              end;

              if (NumeroDebito <> 0) then
                      PromedioDebito := ValorDebito / NumeroDebito
              else
                      PromedioDebito := 0;

              Bar2.Maximum := IBQuery2.RecordCount;
// Validar Saldo
              CDSinfo.Insert;
              CDSInfoTIPODOCUMENTO.Value := StrToInt(Persona.TipoDocumento);
              CDSInfoDOCUMENTO.Value := Persona.NumeroDocumento;
              CDSInfoDV.Value := Persona.DigitoVerificacion;
              CDSInfoPRIMER_APELLIDO.Value := Persona.PrimerApellido;
              CDSInfoSEGUNDO_APELLIDO.Value := Persona.SegundoApellido;
              CDSInfoNOMBRE.Value := Persona.PrimerNombre;
              CDSInfoSEGUNDO_NOMBRE.Value := Persona.SegundoNombre;
              CDSInfoRAZONSOCIAL.Value := Persona.RazonSocial;
              CDSInfoPERIODO.Value := Mes;
              CDSInfoDIRECCION.Value := Persona.Direccion;
              CDSInfoMUNICIPIO.Value := StrtoInt(Persona.Municipio);
              CDSInfoDEPARTAMENTO.Value := StrToInt(Persona.Departamento);
              CDSInfoPAIS.Value := StrToInt(Persona.Pais);
              CDSInfoTIPOCUENTA.Value := 1;
              CDSInfoCUENTA.Value := SysUtils.Format('%.*d', [2, FieldByName('ID_TIPO_CAPTACION').AsInteger])+SysUtils.Format('%.*d', [6, FieldByName('NUMERO_CUENTA').AsInteger]);
              if (FieldByName('GMF').AsInteger = 1) then
                      CDSInfoGMF.Value := 9
              else
                      CDSInfoGMF.Value := 1;
              CDSInfoSALDOFINAL.Value := SaldoFinal;
              CDSInfoPROMEDIO.Value := Promedio;
              CDSInfoMEDIANA.Value := Mediana;
              CDSInfoMAXIMO.Value := Maximo;
              CDSInfoMINIMO.Value := Minimo;
              CDSInfoVALORCREDITO.Value := ValorCredito;
              CDSInfoNUMEROCREDITO.Value := NumeroCredito;
              CDSInfoPROMEDIOCREDITO.Value := PromedioCredito;
              CDSInfoMEDIANACREDITO.Value := MedianaCredito;
              CDSInfoDEBITO.Value := ValorDebito;
              CDSInfoNUMERODEBITO.Value := NumeroDebito;
              CDSInfoPROMEDIODEBITO.Value := PromedioDebito;
              CDSInfoID_AGENCIA.Value := FieldByName('ID_AGENCIA').AsInteger;
              CDSInfoID_TIPO_CAPTACION.Value := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              CDSInfoNUMERO_CUENTA.Value := FieldByName('NUMERO_CUENTA').AsInteger;
              CDSInfoDIGITO_CUENTA.Value := FieldByName('DIGITO_CUENTA').AsInteger;

              if (SaldoFinal = 0) and (Promedio = 0) and (Mediana = 0) and (Maximo = 0) and (Minimo = 0) and (ValorCredito = 0) and (MedianaCredito = 0) and (ValorDebito = 0) and (PromedioCredito = 0) and (PromedioDebito = 0) then
              begin
                 CDSinfo.Cancel;
              end
              else
              begin
               CDSInfo.Post;
              end;

              CDSpersona.Filtered := False;
              CDSpersona.Filter := 'ID_PERSONA = ' + QuotedStr(Persona.NumeroDocumento);
              CDSpersona.Filtered := True;

              if (CDSpersona.RecordCount > 0) then
              begin
                  CDSpersona.Edit;
                  CDSpersonaCREDITO.Value := CDSpersonaCREDITO.Value + ValorCredito;
                  CDSpersonaSALDO.Value := CDSpersonaSALDO.Value + SaldoFinal;
                  CDSpersona.Post;
              end
              else
              begin
                 CDSpersona.Insert;
                 CDSpersonaID_PERSONA.Value := Persona.NumeroDocumento;
                 CDSpersonaCREDITO.Value := ValorCredito;
                 CDSpersonaSALDO.Value := SaldoFinal;
                 CDSpersona.Post;
              end;


          Next; //next del query personas
         end; // fin del While de ibquery1

        end; // Fin del With IBQuery1

        // Sacar personas excentas del reporte

        IBQuery2.Close;
        IBQuery2.SQL.Clear;
        IBQuery2.SQL.Add('SELECT p.ID_IDENTIFICACION, p.ID_PERSONA, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, p.NOMBRE, mt.TIPO_TITULAR FROM "cap$maestrotitular" mt');
        IBQuery2.SQL.Add('INNER JOIN "gen$persona" p ON p.ID_IDENTIFICACION = mt.ID_IDENTIFICACION and p.ID_PERSONA = mt.ID_PERSONA');
        IBQuery2.SQL.Add('WHERE mt.ID_AGENCIA = :ID_AGENCIA and mt.ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and mt.NUMERO_CUENTA = :NUMERO_CUENTA and mt.DIGITO_CUENTA = :DIGITO_CUENTA and mt.NUMERO_TITULAR > 1');



        CDSinfo.First;
        CDSinfo.Filtered := False;
        CDSfinal.Open;
        CDSfinal.EmptyDataSet;
        CDStitulares.Open;
        CDStitulares.EmptyDataSet;

        Bar2.Minimum := 0;
        Bar2.Maximum := CDSinfo.RecordCount;
        Bar2.Position := 0;
        while not CDSinfo.Eof do
        begin
                Bar2.Position := CDSinfo.RecNo;
                Application.ProcessMessages;
                CDSpersona.Filtered := False;
                CDSpersona.Filter :=  'ID_PERSONA = ' + QuotedStr(CDSInfoDOCUMENTO.Value);
                CDSpersona.Filtered := True;
                if (CDSpersona.RecordCount > 0) then
                begin
                    if (CDSpersonaCREDITO.Value >= EdMonto.Value) or ( CDSpersonaSALDO.Value >= JvSaldo.Value) then
                    begin
                      CDSfinal.Insert;
                      CDSfinalTIPODOCUMENTO.Value := CDSInfoTIPODOCUMENTO.Value;
                      CDSfinalDOCUMENTO.Value := CDSInfoDOCUMENTO.Value;
                      CDSfinalDV.Value := CDSInfoDV.Value;
                      CDSfinalPRIMER_APELLIDO.Value := CDSInfoPRIMER_APELLIDO.Value;
                      CDSfinalSEGUNDO_APELLIDO.Value := CDSInfoSEGUNDO_APELLIDO.Value;
                      CDSfinalNOMBRE.Value := CDSInfoNOMBRE.Value;
                      CDSfinalSEGUNDO_NOMBRE.Value := CDSInfoSEGUNDO_NOMBRE.Value;
                      CDSfinalRAZONSOCIAL.Value := CDSInfoRAZONSOCIAL.Value;
                      CDSfinalDIRECCION.Value := CDSInfoDIRECCION.Value;
                      CDSfinalMUNICIPIO.Value := CDSInfoMUNICIPIO.Value;
                      CDSfinalDEPARTAMENTO.Value := CDSInfoDEPARTAMENTO.Value;
                      CDSfinalPAIS.Value := CDSInfoPAIS.Value;
                      CDSfinalTIPOCUENTA.Value := CDSInfoTIPOCUENTA.Value;
                      CDSfinalCUENTA.Value := CDSInfoCUENTA.Value;
                      CDSfinalGMF.Value := CDSInfoGMF.Value;
                      CDSfinalSALDOFINAL.Value := CDSInfoSALDOFINAL.Value;
                      CDSfinalPROMEDIO.Value := CDSInfoPROMEDIO.Value;
                      CDSfinalMEDIANA.Value := CDSInfoMEDIANA.Value;
                      CDSfinalMAXIMO.Value := CDSInfoMAXIMO.Value;
                      CDSfinalMINIMO.Value := CDSInfoMINIMO.Value;
                      CDSfinalVALORCREDITO.Value := CDSInfoVALORCREDITO.Value;
                      CDSfinalNUMEROCREDITO.Value := CDSInfoNUMEROCREDITO.Value;
                      CDSfinalPROMEDIOCREDITO.Value := CDSInfoPROMEDIOCREDITO.Value;
                      CDSfinalMEDIANACREDITO.Value :=  CDSInfoMEDIANACREDITO.Value;
                      CDSfinalVALORDEBITO.Value := CDSInfoDEBITO.Value;
                      CDSfinalNUMERODEBITO.Value := CDSInfoNUMERODEBITO.Value;
                      CDSfinalPROMEDIODEBITO.Value := CDSInfoPROMEDIODEBITO.Value;
                      CDSfinal.Post;

                      // Buscar segundos titulares
                      IBQuery2.Close;
                      IBQuery2.ParamByName('ID_AGENCIA').AsInteger := CDSInfoID_AGENCIA.Value;
                      IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := CDSInfoID_TIPO_CAPTACION.Value;
                      IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := CDSInfoNUMERO_CUENTA.Value;
                      IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := CDSInfoDIGITO_CUENTA.Value;
                      IBQuery2.Open;
                      while not IBQuery2.Eof do
                      begin
                          CDStitulares.Insert;
                          CDStitularesCUENTA.Value := CDSInfoCUENTA.Value;
                          if (IBQuery2.FieldByName('TIPO_TITULAR').AsInteger = 1) then
                                  CDStitularesCONCEPTO.Value := 1
                          else
                                  CDStitularesCONCEPTO.Value := 2;

                          case IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger of
                             1: Tp := '11';
                             2: Tp := '12';
                             3: Tp := '13';
                             4: Tp := '31';
                             6: Tp := '22';
                             9: Tp := '11';//NUI son registrados como Registros Civiles
                          end;

                          CDStitularesTIPODOCUMENTO.Value := StrToInt(Tp);
                          if IBQuery2.FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
                          begin
                            Id := LeftStr(IBQuery2.FieldByName('ID_PERSONA').AsString,Length(IBQuery2.FieldByName('ID_PERSONA').AsString)-1);
                            Dg := RightStr(IBQuery2.FieldByName('ID_PERSONA').AsString,1);
                          end
                          else
                          begin
                            Id := IBQuery2.FieldByName('ID_PERSONA').AsString;
                            Dg := '';
                          end;
                          CDStitularesNUMERODOCUMENTO.Value := Id;
                          CDStitularesDV.Value := Dg;
                          if Tp <> '31' then
                          begin
                            Persona.PrimerApellido := IBQuery2.FieldByName('PRIMER_APELLIDO').AsString;
                            Persona.SegundoApellido := IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString;
                            _sNombre := Trim(IBQuery2.FieldByName('NOMBRE').AsString);
                            Persona.SegundoNombre := '';
                            Persona.PrimerNombre := _sNombre;
                            if Pos(' ', _sNombre) > 0 then
                            begin
                              Persona.PrimerNombre := LeftStr(_sNombre,Pos(' ', _sNombre)-1);
                              Persona.SegundoNombre := RightStr(_sNombre,Length(_sNombre) - Pos(' ', _sNombre));
                            end;
                         end
                         else
                         begin
                                Persona.PrimerApellido := '';
                                Persona.SegundoApellido := '';
                                Persona.PrimerNombre := '';
                                Persona.SegundoNombre := '';
                         end;

                         if Tp = '31' then

                         begin
                                Persona.RazonSocial := Trim(IBQuery2.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQuery2.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + IBQuery2.FieldByName('NOMBRE').AsString);
                         end
                         else
                         begin
                                Persona.RazonSocial := '';
                         end;

                         CDStitularesPRIMER_APELLIDO.Value := Persona.PrimerApellido;
                         CDStitularesSEGUNDO_APELLIDO.Value := Persona.SegundoApellido;
                         CDStitularesNOMBRE.Value := Persona.PrimerNombre;
                         CDStitularesSEGUNDO_NOMBRE.Value := Persona.SegundoNombre;
                         CDStitularesRAZON_SOCIAL.Value := Persona.RazonSocial;
                         CDStitulares.Post;
                         IBQuery2.Next;
                      end;  // del while de ibquery2
                    end;   // del saldo > tope
                end;  // del if recordcount de cdspersona
                CDSinfo.Next;
        end;
        IBQuery2.Transaction.Commit;        

        ShowMessage('Proceso Finalizado con Exito!!');
        btnAExcelPrimero.Enabled := True;
        btnAExcelSegundo.Enabled := True;
        btnAExcelHoja.Enabled := True;
end;

procedure TfrmMovimientoCredito_F1019v9.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMovimientoCredito_F1019v9.btnAExcelPrimeroClick(Sender: TObject);
var   ExcelFile:TDataSetToExcel;
begin
        if SD1.Execute then
        begin
          CDSfinal.Filtered := False;
          CDSfinal.First;
          ExcelFile := TDataSetToExcel.Create(CDSfinal,SD1.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TfrmMovimientoCredito_F1019v9.FormCreate(Sender: TObject);
begin
             EdPeriodo.Value := YearOf(fFechaActual) -1 ;
end;

procedure TfrmMovimientoCredito_F1019v9.btnAExcelSegundoClick(
  Sender: TObject);
var   ExcelFile:TDataSetToExcel;

begin
        if SD1.Execute then
        begin
          CDStitulares.Filtered := False;
          CDStitulares.First;
          ExcelFile := TDataSetToExcel.Create(CDStitulares,SD1.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TfrmMovimientoCredito_F1019v9.btnAExcelHojaClick(
  Sender: TObject);
var   ExcelFile:TDataSetToExcel;
begin
        if SD1.Execute then
        begin
          CDSinfo.Filtered := False;
          CDSinfo.First;
          ExcelFile := TDataSetToExcel.Create(CDSinfo,SD1.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;


end.

