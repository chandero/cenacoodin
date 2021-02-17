unit UnitAuxiliar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask, ComCtrls, DB,
  DBClient, IBCustomDataSet, IBQuery, UnitDmGeneral, DataSetToExcel, DateUtils, StrUtils,
  pr_Common, pr_TxClasses, FR_Class, FR_DSet, FR_DBSet, IBSQL, frOLEExl,
  JvProgressBar, JvMemDS;

type
  TfrmAuxiliar = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdFechaInicial: TDateTimePicker;
    EdFechaFinal: TDateTimePicker;
    EdCodigoInicial: TMaskEdit;
    EdCodigoFinal: TMaskEdit;
    EdCtaI: TStaticText;
    EdCtaF: TStaticText;
    RGTipo: TRadioGroup;
    GBDocumento: TGroupBox;
    CBtiposid: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQsaldoanterior: TIBQuery;
    CDSauxiliar: TClientDataSet;
    CDSauxiliarFECHA: TDateField;
    CDSauxiliarTIPO: TStringField;
    CDSauxiliarNUMERO: TIntegerField;
    CDSauxiliarDESCRIPCION: TStringField;
    CDSauxiliarDEBITO: TCurrencyField;
    CDSauxiliarCREDITO: TCurrencyField;
    CDSauxiliarSALDO_ANTERIOR: TCurrencyField;
    CDSauxiliarSALDO_ACTUAL: TCurrencyField;
    CDSauxiliarDOCUMENTO: TStringField;
    CDSauxiliarNOMBRE: TStringField;
    IBQmovimiento: TIBQuery;
    IBQPuc: TIBQuery;
    btnReporte: TBitBtn;
    btnAExcel: TBitBtn;
    frReport1: TfrReport;
    prTxReport1: TprTxReport;
    CDSauxiliarCHEQUE: TStringField;
    CDSauxiliarNOMBREPUC: TStringField;
    CDSauxiliarCODIGO: TStringField;
    SD1: TSaveDialog;
    frDBDataSet1: TfrDBDataSet;
    IBSQL1: TIBSQL;
    frOLEExcelExport1: TfrOLEExcelExport;
    IBQtipodocumento: TIBQuery;
    DStiposdocumento: TDataSource;
    IBQpersona: TIBQuery;
    pgbar: TProgressBar;
    chkSoloTerceros: TCheckBox;
    pgbar2: TJvProgressBar;
    MDauxiliar: TJvMemoryData;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReporteClick(Sender: TObject);
    procedure btnAExcelClick(Sender: TObject);
    procedure EdCodigoInicialExit(Sender: TObject);
    procedure EdCodigoFinalExit(Sender: TObject);
    procedure EdCodigoInicialKeyPress(Sender: TObject; var Key: Char);
    procedure EdCodigoFinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmAuxiliar: TfrmAuxiliar;
  dmGeneral: TdmGeneral;
  CodigoInicial, CodigoFinal:String;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmAuxiliar.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;

        IBQpuc.Database := dmGeneral.IBDatabase1;
        IBQpuc.Transaction := dmGeneral.IBTransaction1;

        IBQsaldoanterior.Database := dmGeneral.IBDatabase1;
        IBQsaldoanterior.Transaction := dmGeneral.IBTransaction1;

        IBQmovimiento.Database := dmGeneral.IBDatabase1;
        IBQmovimiento.Transaction := dmGeneral.IBTransaction1;

        IBQtipodocumento.Database := dmGeneral.IBDatabase1;
        IBQtipodocumento.Transaction := dmGeneral.IBTransaction1;

        IBQpersona.Database := dmGeneral.IBDatabase1;
        IBQpersona.Transaction := dmGeneral.IBTransaction1;

        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmAuxiliar.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmAuxiliar.Inicializar;
begin
       if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Commit;

       dmGeneral.IBTransaction1.StartTransaction;

       IBQtipodocumento.Open;
       IBQtipodocumento.Last;

        CDSauxiliar.Open;
        CDSauxiliar.EmptyDataSet;       
end;

procedure TfrmAuxiliar.CmdAceptarClick(Sender: TObject);
var
  FechaInicialSaldoInicial, FechaFinalSaldoInicial:TDate;
  FechaInicialMov, FechaFinalMov: TDate;
  SaldoAnterior,
  DebitoMov,CreditoMov,SaldoActual:Currency;
begin

        // Calcular fechas para saldo anterior
        if ( (MonthOf(EdFechaInicial.Date) = 1) and (DayOf(EdFechaInicial.Date) = 1)) then
        begin
           FechaInicialSaldoInicial := 0;
           FechaFinalSaldoInicial := 0;
        end
        else
        begin
           FechaInicialSaldoInicial := EncodeDate(DBAnho,01,01);
           FechaFinalSaldoInicial := Int(IncDay(EdFechaInicial.Date, -1));
           IBQsaldoanterior.ParamByName('FECHA_INICIAL').AsDate := FechaInicialSaldoInicial;
           IBQsaldoanterior.ParamByName('FECHA_FINAL').AsDate := FechaFinalSaldoInicial;
           IBQsaldoanterior.ParamByName('ESTADO').AsString := 'N'; 
        end;

        FechaInicialMov := EdFechaInicial.Date;
        FechaFinalMov := EdFechaFinal.Date;


        // Leer el rango de codigos
        IBQpuc.Close;
        IBQpuc.SQL.Clear;
        IBQpuc.SQL.Add('SELECT * FROM CON$PUC p WHERE p.CODIGO BETWEEN :CODIGO_INI and :CODIGO_FIN');
        IBQpuc.SQL.Add('and p.MOVIMIENTO = 1 ORDER BY p.CODIGO ASC');
        IBQpuc.ParamByName('CODIGO_INI').AsString := CodigoInicial;
        IBQpuc.ParamByName('CODIGO_FIN').AsString := CodigoFinal;
        IBQpuc.Open;
        IBQpuc.Last;
        IBQpuc.First;

        pgbar.Min := 0;
        pgbar.Max := IBQpuc.RecordCount;
        pgbar.Position := 0;

        IBQmovimiento.Close;
        IBQmovimiento.SQL.Clear;
        IBQmovimiento.SQL.Add('SELECT');
        IBQmovimiento.SQL.Add('t.ABREVIATURA,');
        IBQmovimiento.SQL.Add('a.ID_COMPROBANTE,');
        IBQmovimiento.SQL.Add('a.FECHA,');
        IBQmovimiento.SQL.Add('a.CODIGO,');
        IBQmovimiento.SQL.Add('m.NOMBRE AS NOMBREPUC,');
        IBQmovimiento.SQL.Add('c.DESCRIPCION,');
        IBQmovimiento.SQL.Add('a.DEBITO,');
        IBQmovimiento.SQL.Add('a.CREDITO,');
        IBQmovimiento.SQL.Add('a.ID_PERSONA,');
        IBQmovimiento.SQL.Add('a.ID_IDENTIFICACION');
        IBQmovimiento.SQL.Add('FROM CON$COMPROBANTE c');
        IBQmovimiento.SQL.Add('INNER JOIN CON$TIPOCOMPROBANTE t ON c.TIPO_COMPROBANTE = t.ID');
        IBQmovimiento.SQL.Add('INNER JOIN CON$AUXILIAR a ON a.TIPO_COMPROBANTE = c.TIPO_COMPROBANTE and a.ID_COMPROBANTE = c.ID_COMPROBANTE');
        IBQmovimiento.SQL.Add('LEFT JOIN CON$PUC m ON a.CODIGO = m.CODIGO');
        IBQmovimiento.SQL.Add('WHERE c.ESTADO <> :ESTADO and a.FECHA BETWEEN :FECHA_INICIAL and :FECHA_FINAL and a.CODIGO = :CODIGO');
        if ((not VarIsNull(CBtiposid.KeyValue)) and (EdNumeroIdentificacion.Text <> '')) then
        begin
            IBQmovimiento.SQL.Add(' and a.ID_IDENTIFICACION = :ID_IDENTIFICACION and a.ID_PERSONA = :ID_PERSONA');
        end;
        if (chkSoloTerceros.Checked) then
        begin
            IBQmovimiento.SQL.Add(' and a.ID_PERSONA <> ''''');
        end;
        IBQmovimiento.SQL.Add('ORDER BY a.CODIGO ASC, a.FECHA ASC');
        if (chkSoloTerceros.Checked) then
        begin
            IBQmovimiento.SQL.Add(', a.ID_PERSONA ASC');
        end;
                // Crear query de movimientos
        IBQmovimiento.ParamByName('FECHA_INICIAL').AsDate := EdFechaInicial.Date;
        IBQmovimiento.ParamByName('FECHA_FINAL').AsDate := EdFechaFinal.Date;
        IBQmovimiento.ParamByName('ESTADO').AsString := 'N';
        if ((not VarIsNull(CBtiposid.KeyValue)) and (EdNumeroIdentificacion.Text <> '')) then
        begin
            IBQmovimiento.ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
            IBQmovimiento.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
        end;

        CDSauxiliar.EmptyDataSet;

        MDauxiliar.Open;
        MDauxiliar.EmptyTable;


        if IBQPuc.RecordCount > 0 then
        begin
            SaldoAnterior := 0;
            DebitoMov := 0;
            CreditoMov := 0;
            SaldoActual := 0;
            while not IBQPuc.Eof do
            begin
                  pgbar.Position := IBQPuc.RecNo;
                  Application.ProcessMessages;
                  SaldoAnterior := 0;
                  SaldoActual := 0;
                  DebitoMov := 0;
                  CreditoMov := 0;
                  //Buscar Saldo Inicial del Código.
                  SaldoAnterior := IBQPuc.FieldByName('SALDOINICIAL').AsCurrency;
                  if (FechaFinalSaldoInicial > 0) then
                  begin
                     IBQsaldoanterior.Close;
                     IBQsaldoanterior.ParamByName('CODIGO').AsString := IBQPuc.FieldByName('CODIGO').AsString;
                     IBQsaldoanterior.Open;
                     if (not VarIsNull(IBQsaldoanterior.FieldByName('DEBITO').Value)) then
                     begin
                         DebitoMov := IBQsaldoanterior.FieldByName('DEBITO').AsCurrency;
                     end
                     else
                     begin
                         DebitoMov := 0;
                     end;
                     if (not VarIsNull(IBQsaldoanterior.FieldByName('CREDITO').Value)) then
                     begin
                         CreditoMov := IBQsaldoanterior.FieldByName('CREDITO').AsCurrency;
                     end
                     else
                     begin
                         CreditoMov := 0;
                     end;
                  end;
                  SaldoAnterior := SaldoAnterior + DebitoMov - CreditoMov;
                  IBQmovimiento.Close;
                  IBQmovimiento.ParamByName('CODIGO').AsString := IBQpuc.FieldByName('CODIGO').AsString;
                  IBQmovimiento.Open;
                  IBQmovimiento.Last;
                  IBQmovimiento.First;
                  DebitoMov := 0;
                  CreditoMov := 0;
                  pgbar2.Min := 0;
                  pgbar2.Max := IBQmovimiento.RecordCount;
                  pgbar2.Position := 0;
                  while not IBQmovimiento.Eof do
                  begin
                     pgbar2.Position := IBQmovimiento.RecNo;
                     Application.ProcessMessages;
                     MDauxiliar.Append;
                     MDauxiliar.FieldByName('FECHA').AsDateTime := IBQmovimiento.FieldByName('FECHA').AsDateTime;
                     MDauxiliar.FieldByName('TIPO').AsString := IBQmovimiento.FieldByName('ABREVIATURA').AsString;
                     MDauxiliar.FieldByName('NUMERO').AsInteger := IBQmovimiento.FieldByName('ID_COMPROBANTE').AsInteger;
                     MDauxiliar.FieldByName('CODIGO').AsString := IBQmovimiento.FieldByName('CODIGO').AsString;
                     MDauxiliar.FieldByName('NOMBREPUC').AsString := IBQmovimiento.FieldByName('NOMBREPUC').AsString;
                     MDauxiliar.FieldByName('CHEQUE').AsString := '';                                          
                     CDSauxiliar.Append;
                     CDSauxiliarFECHA.Value := IBQmovimiento.FieldByName('FECHA').AsDateTime;
                     CDSauxiliarTIPO.Value := IBQmovimiento.FieldByName('ABREVIATURA').AsString;
                     CDSauxiliarNUMERO.Value := IBQmovimiento.FieldByName('ID_COMPROBANTE').AsInteger;
                     CDSauxiliarCODIGO.Value := IBQmovimiento.FieldByName('CODIGO').AsString;
                     CDSauxiliarNOMBREPUC.Value := IBQmovimiento.FieldByName('NOMBREPUC').AsString;
                     CDSauxiliarCHEQUE.Value := '';
                     if (not VarIsNull(IBQmovimiento.FieldByName('DEBITO').Value)) then
                     begin
                         DebitoMov := IBQmovimiento.FieldByName('DEBITO').AsCurrency;
                     end
                     else
                     begin
                         DebitoMov := 0;
                     end;

                     if (not VarIsNull(IBQmovimiento.FieldByName('CREDITO').Value)) then
                     begin
                         CreditoMov := IBQmovimiento.FieldByName('CREDITO').AsCurrency;
                     end
                     else
                     begin
                         CreditoMov := 0;
                     end;
                     MDauxiliar.FieldByName('SALDO_ANTERIOR').AsCurrency := SaldoAnterior;
                     CDSauxiliarSALDO_ANTERIOR.Value := SaldoAnterior;
                     MDauxiliar.FieldByName('DEBITO').AsCurrency := DebitoMov;
                     CDSauxiliarDEBITO.Value := DebitoMov;
                     MDauxiliar.FieldByName('CREDITO').AsCurrency := CreditoMov;
                     CDSauxiliarCREDITO.Value := CreditoMov;
                     SaldoActual := SaldoAnterior + DebitoMov - CreditoMov;
                     SaldoAnterior := SaldoActual;
                     MDauxiliar.FieldByName('SALDO_ACTUAL').AsCurrency := SaldoActual;
                     CDSauxiliarSALDO_ACTUAL.Value := SaldoActual;
                     MDauxiliar.FieldByName('DOCUMENTO').AsString := IBQmovimiento.FieldByName('ID_PERSONA').AsString;
                     CDSauxiliarDOCUMENTO.Value := IBQmovimiento.FieldByName('ID_PERSONA').AsString;
                     // consultar persona
                     IBQpersona.Close;
                     IBQpersona.ParamByName('ID_IDENTIFICACION').AsInteger := IBQmovimiento.FieldByName('ID_IDENTIFICACION').AsInteger;
                     IBQpersona.ParamByName('ID_PERSONA').AsString := IBQmovimiento.FieldByName('ID_PERSONA').AsString;
                     IBQpersona.Open;
                     if (IBQpersona.RecordCount > 0 ) then
                     begin
                       MDauxiliar.FieldByName('NOMBRE').AsString := IBQpersona.FieldByName('NOMBRE').AsString + ' ' + IBQpersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQpersona.FieldByName('SEGUNDO_APELLIDO').AsString;
                       CDSauxiliarNOMBRE.Value := IBQpersona.FieldByName('NOMBRE').AsString + ' ' + IBQpersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQpersona.FieldByName('SEGUNDO_APELLIDO').AsString;
                       MDauxiliar.FieldByName('DESCRIPCION').AsString := IBQmovimiento.FieldByName('DESCRIPCION').AsString + ' ' + IBQpersona.FieldByName('NOMBRE').AsString + ' ' + IBQpersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQpersona.FieldByName('SEGUNDO_APELLIDO').AsString;
                       CDSauxiliarDESCRIPCION.Value := IBQmovimiento.FieldByName('DESCRIPCION').AsString + ' ' + IBQpersona.FieldByName('NOMBRE').AsString + ' ' + IBQpersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' + IBQpersona.FieldByName('SEGUNDO_APELLIDO').AsString;
                     end
                     else
                     begin
                       MDauxiliar.FieldByName('NOMBRE').AsString := '';
                       CDSauxiliarNOMBRE.Value := '';
                       MDauxiliar.FieldByName('DESCRIPCION').AsString := IBQmovimiento.FieldByName('DESCRIPCION').AsString;
                       CDSauxiliarDESCRIPCION.Value := IBQmovimiento.FieldByName('DESCRIPCION').AsString;
                     end;
                     //
                     MDauxiliar.Post;
                     //CDSauxiliar.Post;
                     IBQmovimiento.Next;
                  end;
                  IBQpuc.Next;
            end; //  fin del while not IBQPuc.Eof
            // CDSauxiliar.First;
            MDauxiliar.First;
        end; // fin del if IBQPuc.RecordCount > 0

        CmdAceptar.Enabled := False;
        btnReporte.Enabled := True;
        btnAExcel.Enabled := True;
end;

procedure TfrmAuxiliar.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAuxiliar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

procedure TfrmAuxiliar.btnReporteClick(Sender: TObject);
begin

                CDSauxiliar.First;
                if (chkSoloTerceros.Checked) then
                begin
                        frReport1.LoadFromFile('ReportesCon\frAuxiliarTercero.frf');
                end
                else
                begin
                        frReport1.LoadFromFile('ReportesCon\frAuxiliar.frf');
                end;
                frReport1.Dictionary.Variables['EMPRESA'] := QuotedStr(Empresa);
                frReport1.Dictionary.Variables['NIT'] := QuotedStr(nit);
                frReport1.Dictionary.Variables['CODIGOINICIAL'] := QuotedStr(CodigoInicial);
                frReport1.Dictionary.Variables['CODIGOFINAL'] := QuotedStr(CodigoFinal);
                frReport1.Dictionary.Variables['FECHAINICIAL'] := EdFechaInicial.Date;
                frReport1.Dictionary.Variables['FECHAFINAL'] := EdFechaFinal.Date;

                if frReport1.PrepareReport then
                   frReport1.ShowPreparedReport;
end;

procedure TfrmAuxiliar.btnAExcelClick(Sender: TObject);
var
   ExcelFile : TDataSetToExcel;
begin
          SD1.Title := 'Nombre Para El Archivo de Balance';
          if (SD1.Execute) then
          begin
           CDSauxiliar.Filtered := False;
           CDSauxiliar.First;
           ExcelFile := TDataSetToExcel.Create(CDSauxiliar,SD1.FileName);
           ExcelFile.WriteFile;
           ExcelFile.Free;
          end;
end;

procedure TfrmAuxiliar.EdCodigoInicialExit(Sender: TObject);
var
  Cadena: String;
begin
        Cadena := EdCodigoInicial.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoInicial := Cadena;
        with IBSQL1 do begin
         Close;
         ParamByName('CODIGO').AsString := CodigoInicial;
         ExecQuery;
         if RecordCount > 0 then
            EdCtaI.Caption := FieldByName('NOMBRE').AsString
         else
            EdCtaI.Caption := 'NO SE ENCONTRO CODIGO';
        end;
end;

procedure TfrmAuxiliar.EdCodigoFinalExit(Sender: TObject);
var
  Cadena: String;
begin
        Cadena := EdCodigoFinal.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoFinal := Cadena;
        with IBSQL1 do begin
         Close;
         ParamByName('CODIGO').AsString := CodigoFinal;
         ExecQuery;
         if RecordCount > 0 then
            EdCtaF.Caption := FieldByName('NOMBRE').AsString
         else
            EdCtaF.Caption := 'NO SE ENCONTRO CODIGO';
        end;
end;

procedure TfrmAuxiliar.EdCodigoInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     EnterTabs(Key, Self);
end;

procedure TfrmAuxiliar.EdCodigoFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     EnterTabs(Key, Self);
end;

end.
