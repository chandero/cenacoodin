unit UnitImpresionCaptacion;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Printers, Dialogs, StdCtrls, Buttons, JvEdit, DBCtrls, DB, pr_Common, pr_TxClasses,
  IBCustomDataSet, IBQuery, IBSQL, NLetra,JclSysUtils, FR_Class, FR_DSet,
  FR_DBSet, FR_Shape;

type
  TfrmImpresionCaptacion = class(TForm)
    GroupBox1: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    EdNumeroCap: TJvEdit;
    EdDigitoCap: TStaticText;
    EdNombreCap: TStaticText;
    CmdImprimir: TBitBtn;
    DSTiposCaptacion: TDataSource;
    IBQuery: TIBQuery;
    Label1: TLabel;
    DBLCBAgencia: TDBLookupComboBox;
    IBAgencias: TIBQuery;
    DSAgencia: TDataSource;
    IBSql: TIBSQL;
    NLetra: TNLetra;
    IBPersona: TIBQuery;
    IBTitulares: TIBQuery;
    ReporteCap: TprTxReport;
    IBDirRes: TIBQuery;
    IBDirCor: TIBQuery;
    IBDirEmp: TIBQuery;
    IBAutorizado: TIBQuery;
    IBReferencias: TIBQuery;
    IBFuncionario: TIBQuery;
    CmdImprimirTarjeta: TBitBtn;
    Label2: TLabel;
    EdImpresora: TStaticText;
    CmdImpresora: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    CmdCerrar: TBitBtn;
    prTxReport1: TprTxReport;
    ReporteCer: TprTxReport;
    FormularioN: TfrReport;
    FormularioJ: TfrReport;
    frIBTitulares: TfrDBDataSet;
    CmdNuevoReporte: TBitBtn;
    frIBReferencias: TfrDBDataSet;
    frShapeObject1: TfrShapeObject;
    IBbeneficiario: TIBQuery;
    frDBBeneficiario: TfrDBDataSet;
    frDBauxilio: TfrDBDataSet;
    IBAuxilio: TIBQuery;
    IBQAdicionales: TIBQuery;
    frDBAdicional: TfrDBDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdNumeroCapKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCapExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCapEnter(Sender: TObject);
    procedure CmdImprimirClick(Sender: TObject);
    procedure CmdImpresoraClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdImprimirTarjetaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdNuevoReporteClick(Sender: TObject);
    procedure FormularioNGetValue(const ParName: String;
      var ParValue: Variant);
    procedure IBTitularesAfterScroll(DataSet: TDataSet);
  private
    procedure CasoCertificado;
    procedure CasoAhorro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpresionCaptacion: TfrmImpresionCaptacion;
  Impresora:string;
  tipo,age,cuenta:Integer;
implementation

{$R *.dfm}

uses UnitDmGeneral,UnitDmCaptacion,UnitGlobales, UnitGlobalesCol;

procedure TfrmImpresionCaptacion.FormShow(Sender: TObject);
var  Device, Driver, Port: array[0..255] of char;
     PrinterName: string;
     buf:array[0..255] of char;
     Handle, hDeviceMode: THandle;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        dmCaptacion.IBTiposCaptacion.Open;
        dmCaptacion.IBTiposCaptacion.Last;
        IBAgencias.Open;
        IBAgencias.Last;
        DBLCBAgencia.KeyValue := Agencia;
        Printer.GetPrinter(Device,Driver,Port,hDeviceMode);
        PrinterName := Format('%s', [Device]);
        EdImpresora.Caption := PrinterName;
end;

procedure TfrmImpresionCaptacion.FormCreate(Sender: TObject);
begin
        dmcaptacion := TdmCaptacion.Create(Self);
end;

procedure TfrmImpresionCaptacion.EdNumeroCapKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmImpresionCaptacion.EdNumeroCapExit(Sender: TObject);
begin
        if EdNumeroCap.Text = '' then
        begin
           MessageDlg('Debe digitar un número de Captacion',mtInformation,[mbok],0);
           Exit;
        end;

        EdNumeroCap.Text := Format('%.7d',[StrToInt(Trim(EdNumeroCap.Text))]);

        if DBLCBTipoCaptacion.KeyValue < 1 then
        begin
          MessageDlg('Debe seleccionar un tipo de captación',mtInformation,[mbok],0);
          Exit;
        end;

        if DBLCBAgencia.KeyValue < 1 then
        begin
          MessageDlg('Debe seleccionar una agencia',mtInformation,[mbok],0);
          Exit;
        end;

        EdDigitoCap.Caption := DigitoControl(DBLCBTipoCaptacion.KeyValue,EdNumeroCap.Text);

        with IBQuery do
        begin
           Close;
           ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencia.KeyValue;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
           ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(Trim(ednumerocap.Text));
           ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(Trim(eddigitocap.Caption));
           try
             Open;
             if RecordCount < 1 then
               begin
                 MessageDlg('No Encontre registros con estos datos'+#13+
                                    'Por Favor verifique!',mtInformation,[mbok],0);
                 Exit;
               end;
           except
             MessageDlg('Error al buscar captación',mtError,[mbcancel],0);
             Exit;
           end;

           EdNombreCap.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                  FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                  FieldByName('NOMBRE').AsString;
           NLetra.Numero := FieldByName('VALOR_INICIAL').AsInteger;
        end;

        with IBSql do
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"cap$tiposforma".ID_FORMA,');
           SQL.Add('"cap$tiposforma".DESCRIPCION,');
           SQL.Add('"cap$tiposforma".APORTE,');
           SQL.Add('"cap$tiposforma".AHORRO,');
           SQL.Add('"cap$tiposforma".CERTIFICADO,');
           SQL.Add('"cap$tiposforma".PROGRAMADO,');
           SQL.Add('"cap$tiposforma".COLOCACION,');
           SQL.Add('"cap$tiposforma".OPERACIONES');
           SQL.Add('FROM');
           SQL.Add('"cap$tipocaptacion"');
           SQL.Add('INNER JOIN "cap$tiposforma" ON ("cap$tipocaptacion".ID_FORMA = "cap$tiposforma".ID_FORMA)');
           SQL.Add('WHERE');
           SQL.Add('("cap$tipocaptacion".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION)');
           ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
           try
            IBSql.ExecQuery;
            if RecordCount < 1 then
            begin
              MessageDlg('Error verificando tipo de captacion',mtInformation,[mbok],0);
              Exit;
            end;
           except
              MessageDlg('Error verificando tipo de captacion',mtInformation,[mbok],0);
              Exit;
           end;
         if FieldByName('AHORRO').AsInteger <> 0 then CmdImprimirTarjeta.Enabled := True;
        end;

        CmdImprimir.Enabled := True;
        CmdNuevoReporte.Enabled := True;
end;

procedure TfrmImpresionCaptacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmImpresionCaptacion.EdNumeroCapEnter(Sender: TObject);
begin
        EdNumeroCap.SelectAll;
end;

procedure TfrmImpresionCaptacion.CmdImprimirClick(Sender: TObject);
var TasaE:Double;
    Amortiza:Integer;
    Moda:string;
begin
        with IBSql do begin
//         if FieldByName('AHORRO').AsInteger <> 0 then CasoAhorro;
         if FieldByName('CERTIFICADO').AsInteger <> 0 then
          if Role <> 'CREDITOS' then CasoCertificado;
        end;
end;

procedure TfrmImpresionCaptacion.CasoCertificado;
var Letras:String;
    TasaE:Double;
    TasaN:Double;
    Amortiza:Integer;
    Moda:string;

begin
      if IBQuery.FieldByName('FECHA_APERTURA').AsDateTime <> Date then
      begin
        MessageDlg('No se puede imprimir un titulo de fecha de apertura diferente a la actual',mtError,[mbcancel],0);
        Exit;
      end;

        TasaE := IBQuery.FieldByName('TASA_EFECTIVA').AsFloat;
        Amortiza := IBQuery.FieldByName('AMORTIZACION').AsInteger;
        Moda := IBQuery.FieldByName('MODALIDAD').AsString;


        if Moda = 'A' then
           TasaN := TasaNominalAnticipada(TasaE,Amortiza)
        else
           TasaN := TasaNominalVencida(TasaE,Amortiza);

      Letras := NLetra.Letras;
      if RightStr(Letras,4) = 'mil ' then
        Letras := Letras + ' PESOS'
      else
      if RightStr(Letras,9) = 'millones ' then
        Letras := Letras + ' DE PESOS'
      else
      if RightStr(Letras,6) = 'millon ' then
        Letras := Letras + ' DE PESOS'
      else
        Letras := Letras + ' PESOS';
      ReporteCer.Variables.ByName['LETRAS'].AsString := UpperCase(Letras);
      ReporteCer.Variables.ByName['NOMINAL'].AsDouble  := TasaN;
      if ReporteCer.PrepareReport then
         ReporteCer.PreviewPreparedReport(True);
end;

procedure TfrmImpresionCaptacion.CasoAhorro;
var Cadena:TStrings;
    s:string;
begin
        Impresora := EdImpresora.Caption;
        
        IBTitulares.Close;
        IBTitulares.ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencia.KeyValue;
        IBTitulares.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
        IBTitulares.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(Trim(ednumerocap.Text));
        IBTitulares.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(Trim(eddigitocap.Caption));
         try
            IBTitulares.Open;
         except
             MessageDlg('Erro localizando Autorizados',mtError,[mbok],0);
         end;

        with IBAutorizado do
        begin
           Close;
           ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencia.KeyValue;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
           ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(Trim(ednumerocap.Text));
           ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(Trim(eddigitocap.Caption));
           try
             Open;
           except
             MessageDlg('Erro localizando Autorizados',mtError,[mbok],0);
           end;
        end;

        with IBReferencias do begin
          Close;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString := IBQuery.FieldByName('ID_PERSONA').AsString;
          try
            Open;
          except
            MessageDlg('Error localizando Referencias',mtError,[mbok],0);
          end;
        end;

        with IBFuncionario do begin
          Close;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
            Open;
          except
            MessageDlg('Error Localizando Funcionario',mtError,[mbok],0);
          end;
        end;

        tipo := DBLCBTipoCaptacion.KeyValue;
        age  := DBLCBAgencia.KeyValue;
        cuenta := StrToInt(EdNumeroCap.Text);
        Cadena := TStringList.Create;
        try
          s := txc12cpiOn+txcCondensedOn;
          Cadena.Add(s);
          s := '';
          Cadena.Add(s);
          Cadena.Add(s);
          s := '                                   '+
               '                                   '+
               txcWideOn+txcBoldOn+
               'FORMULARIO DE APERTURA'+
               txcWideOff+txcBoldOff;
          Cadena.Add(s);
          s := '                                   '+
               '                                   '+
               txcWideOn+txcBoldOn+
               'Y ACTUALIZACION DE DATOS'+
               txcWideOff+txcBoldOff;
          Cadena.Add(s);
          s := '';
          Cadena.Add(s);
          Cadena.Add(s);
          s := '                              '+
               '                              '+
               'Cuenta No.:'+txcBoldOn+Format('%d%.2d-%.7d',[tipo,age,cuenta])+txcBoldOff+
               ' Fecha Apertura:'+txcBoldOn+DateToStr(IBQuery.FieldByName('FECHA_APERTURA').AsDateTime)+txcBoldOff+
               ' Ciudad:'+txcBoldOn+Format('%15s',[DBLCBAgencia.Text])+txcBoldOff+' Impreso:'+txcBoldOn+DateToStr(Date)+txcBoldOff;
          Cadena.Add(s);
          s := '';
          Cadena.Add(s);
          s := '                              '+
               '                              '+
               txcItalicOn+'I. CONDICIONES DE MANEJO'+txcItalicOff;
          Cadena.Add(s);
          s := '                              '+
               '                              '+
               'Tipo de Cuenta:'+txcBoldOn+'Individual '+txcBoldOff+' Requisitos: Nro de Firmas: '+txcBoldOn+Format('%.2d',[IBQuery.FieldByName('FIRMAS').AsInteger])+txcBoldOff+
               ' Nro de Sellos: '+txcBoldOn+Format('%.2d',[IBQuery.FieldByName('SELLOS').AsInteger])+txcBoldOff;
          Cadena.Add(s);
          s := '                              '+
               '                              '+
               'Protectografos:'+txcBoldOn+Format('%.2d',[IBQuery.FieldByName('PROTECTOGRAFOS').AsInteger])+txcBoldOff;
          Cadena.Add(s);
          s := '';
          Cadena.Add(s);
          Cadena.Add(s);
          Cadena.Add(s);
          s := '              '+
               txcItalicOn+'INFORMACION TITULAR'+txcItalicOff;
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
          while not IBTitulares.Eof do begin

// Buscar Datos
        IBDirRes.Close;
        IBDirRes.ParamByName('ID_IDENTIFICACION').AsInteger := IBTitulares.FieldByName('ID_IDENTIFICACION').AsInteger;
        IBDirRes.ParamByName('ID_PERSONA').AsString := IBTitulares.FieldByName('ID_PERSONA').AsString;
        try
          IBDirRes.Open;
        except
          MessageDlg('Error localizando dirección de Residencia',mtError,[mbok],0);
        end;

        IBDirCor.Close;
        IBDirCor.ParamByName('ID_IDENTIFICACION').AsInteger := IBTitulares.FieldByName('ID_IDENTIFICACION').AsInteger;
        IBDirCor.ParamByName('ID_PERSONA').AsString := IBTitulares.FieldByName('ID_PERSONA').AsString;
        try
          IBDirCor.Open;
        except
          MessageDlg('Error localizando dirección de Correspondencia',mtError,[mbok],0);
        end;

        IBDirEmp.Close;
        IBDirEmp.ParamByName('ID_IDENTIFICACION').AsInteger := IBTitulares.FieldByName('ID_IDENTIFICACION').AsInteger;
        IBDirEmp.ParamByName('ID_PERSONA').AsString := IBTitulares.FieldByName('ID_PERSONA').AsString;
        try
          IBDirEmp.Open;
        except
          MessageDlg('Error localizando dirección de Correspondencia',mtError,[mbok],0);
        end;
// Fin Buscar Datos

          Cadena.Clear;
          s := '              '+
               'Nombres y Apellidos: '+txcBoldOn+txcWideOn+IBTitulares.FieldByName('NOMBRE').AsString+' '+IBTitulares.FieldByName('PRIMER_APELLIDO').AsString+' '+IBTitulares.FieldByName('SEGUNDO_APELLIDO').AsString+txcWideOff+txcBoldOff;
          Cadena.Add(s);
          s := '              '+
               'Identificacion No.: '+txcBoldOn+Format('%15s',[IBTitulares.FieldByName('ID_PERSONA').AsString])+txcBoldOff+' Expedido en: '+txcBoldOn+Format('%20s',[IBTitulares.FieldByName('LUGAR_EXPEDICION').AsString])+txcBoldOff+
               'Fecha Exp: '+txcBoldOn+DateToStr(IBTitulares.FieldByName('FECHA_EXPEDICION').AsDateTime)+txcBoldOff+' Sexo: '+txcBoldOn+iff(IBTitulares.FieldByName('SEXO').AsString = 'M','Masculino ','Femenino')+txcBoldOff;
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;
          s := '              '+
               'Fecha de Nacimiento: '+txcBoldOn+DateToStr(IBTitulares.FieldByName('FECHA_NACIMIENTO').AsDateTime)+txcBoldOff+' Lugar de Nacimiento: '+txcBoldOn+Format('%20s',[IBTitulares.FieldByName('LUGAR_NACIMIENTO').AsString])+txcBoldOff+' Estado Civil: '+txcBoldOn+Format('%10s',[IBTitulares.FieldByName('DESCRIPCION_ESTADO_CIVIL').AsString])+txcBoldOff;
          Cadena.Add(s);
          s := '              '+
               'Direccion Residencia: '+txcBoldOn+Format('%35s',[IBDirRes.FieldByName('DIRECCION').AsString])+' '+Format('%20s',[IBDirRes.FieldByName('BARRIO').AsString])+txcBoldOff+
               'Municipio: '+txcBoldOn+Format('%20s',[IBDirRes.FieldByName('MUNICIPIO').AsString])+txcBoldOff+' Telefono: '+txcBoldOn+IBDirRes.FieldByName('TELEFONO1').AsString+txcBoldOff;
          Cadena.Add(s);
          s := '              '+
               'Direccion Correspondencia: '+txcBoldOn+Format('%35s',[IBDirCor.FieldByName('DIRECCION').AsString])+' '+Format('%20s',[IBDirCor.FieldByName('BARRIO').AsString])+txcBoldOff+
               'Municipio: '+txcBoldOn+Format('%20s',[IBDirCor.FieldByName('MUNICIPIO').AsString])+txcBoldOff+' Telefono: '+txcBoldOn+IBDirCor.FieldByName('TELEFONO1').AsString+txcBoldOff;
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;
          Cadena.Add(s);
          s := '              '+
               'Actividad Economica: '+txcBoldOn+Format('%30s',[IBTitulares.FieldByName('PROFESION').AsString])+txcBoldOff+' Descripción: '+Format('%20s',[IBTitulares.FieldByName('CARGO_ACTUAL').AsString])+txcBoldOff;
          Cadena.Add(s);
          s := '              '+
               'Empresa donde labora: '+txcBoldOn+Format('%20s',[IBTitulares.FieldByName('EMPRESA_LABORA').AsString])+txcBoldOff+' Direccion: '+txcBoldOn+Format('%20s',[IBDirEmp.FieldByName('DIRECCION').AsString])+txcBoldOff+
               'Ciudad: '+Format('%20s',[IBDirEmp.FieldByName('MUNICIPIO').AsString])+txcBoldOff+' Telefono: '+txcBoldOn+IBDirEmp.FieldByName('TELEFONO1').AsString+txcBoldOff;
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;
          if IBTitulares.FieldByName('ID_CONYUGE').AsString <> '' then begin
             s := '              '+
                  'Nombres y Apellidos Conyuge: '+txcBoldOn+txcWideOn+IBTitulares.FieldByName('NOMBRE_CONYUGE').AsString+' '+IBTitulares.FieldByName('PRIMER_APELLIDO_CONYUGE').AsString+' '+IBTitulares.FieldByName('SEGUNDO_APELLIDO_CONYUGE').AsString+txcWideOff+txcBoldOff;
             Cadena.Add(s);
             ImprimirCadena(Impresora,Cadena.Text);
          end;
          IBTitulares.Next;
          end;
          Cadena.Clear;
          s := '';
          Cadena.Add(s);
          s := '              '+
               txcItalicOn+'II. OTRAS PERSONAS AUTORIZADAS'+txcItalicOff;
          Cadena.Add(s);
          while not IBAutorizado.Eof do begin
            s := '              '+
                 'Nombre Autorizado: '+txcBoldOn+IBAutorizado.FieldByName('NOMBRE').AsString + ' ' +IBAutorizado.FieldByName('PRIMER_APELLIDO').AsString +' '+IBAutorizado.FieldByName('SEGUNDO_APELLIDO').AsString+txcBoldOff;
            Cadena.Add(s);
            IBAutorizado.Next;
          end;
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;
          s := '';
          Cadena.Add(s);
          s := '              '+
               txcItalicOn+'III. INFORMACION FINANCIERA'+txcItalicOff;
          Cadena.Add(s);
          s := '              '+
               'Declaro(amos) que los fondos manejados en esta modalidad de ahorro provienen de:';
          Cadena.Add(s);
          s := '              '+txcBoldOn+
               LeftStr(IBQuery.FieldByName('DECLARACION').AsString,140)+txcBoldOff;
          Cadena.Add(s);
          s := '              '+txcBoldOn+
               MidStr(IBQuery.FieldByName('DECLARACION').AsString,141,140)+txcBoldOff;
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;
          s := '              '+
               'Ingresos Mes:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('INGRESOS_A_PRINCIPAL').AsCurrency])+txcBoldOff+' Ingresos Otros:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('INGRESOS_OTROS').AsCurrency])+txcBoldOff+
               ' Detalle:'+txcBoldOn+IBQuery.FieldByName('DESC_INGR_OTROS').AsString+txcBoldOff;
          Cadena.Add(s);
          if IBQuery.FieldByName('ID_CONYUGE').AsString <> '' then begin
           s := '              '+
                'Ingresos Conyuge:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('INGRESOS_CONYUGE').AsCurrency])+txcBoldOff+' Ingresos Otros Conyuge:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('INGRESOS_CONYUGE_OTROS').AsCurrency])+txcBoldOff;
           Cadena.Add(s);
          end;
          s := '              '+
               'Egresos Arriendo:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('EGRESOS_ALQUILER').AsCurrency])+txcBoldOff+' Egresos Alimentacion:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('EGRESOS_ALIMENTACION').asCurrency])+txcBoldOff+
               ' Egresos Transporte:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('EGRESOS_TRANSPORTE').asCurrency])+txcBoldOff;
          Cadena.Add(s);
          s := '              '+
               'Egresos Servicios:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('EGRESOS_SERVICIOS').asCurrency])+txcBoldOff+' Egresos Otros:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('EGRESOS_OTROS').asCurrency])+txcBoldOff;
          Cadena.Add(s);
          if IBQuery.FieldByName('ID_CONYUGE').AsString <> '' then begin
             s:= '              '+
                 'Egresos Conyuge:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('EGRESOS_SERVICIOS').asCurrency])+txcBoldOff+' Egresos Otros Conyuge:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('OTROS_EGRESOS_CONYUGE').asCurrency])+txcBoldOff;
             Cadena.Add(s);
          end;
          s := '              '+
               'Total Activos: '+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('TOTAL_ACTIVOS').asCurrency])+txcBoldOff+' Total Pasivos:'+txcBoldOn+Format('%18.2m',[IBQuery.FieldByName('TOTAL_PASIVOS').asCurrency])+txcBoldOff;
          Cadena.Add(s);
          s := '';
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;          
          s := '              '+
               txcItalicOn+'IV. REFERENCIAS'+txcItalicOff;
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
          while not IBReferencias.Eof do begin
          Cadena.Clear;
          s := '              '+
               txcBoldOn+IBReferencias.FieldByName('NOMBRE_REFERENCIA').AsString + ' ' + IBReferencias.FieldByName('PRIMER_APELLIDO_REFERENCIA').AsString + ' ' + IBReferencias.FieldByName('SEGUNDO_APELLIDO_REFERENCIA').AsString + txcBoldOff +
               ' Tipo de Referencia:'+txcboldon+IBReferencias.FieldByName('DESCRIPCION_REFERENCIA').AsString +txcboldoff+' Parentesco:'+txcBoldOn+ IBReferencias.FieldByName('DESCRIPCION_PARENTESCO').AsString+txcBoldOff;
          Cadena.Add(s);
          s := '              '+
               'Direccion: '+Format('%50s',[IBReferencias.FieldByName('DIRECCION_REFERENCIA').AsString])+txcBoldOff+' Telefono:'+ txcBoldOn+IBReferencias.FieldByName('TELEFONO_REFERENCIA').AsString+txcBoldOff;
          Cadena.Add(s);
          IBReferencias.Next;
          ImprimirCadena(Impresora,Cadena.Text);
          end;
          Cadena.Clear;
          s := '              '+
               '___________________________________________________________________________________________________________________________________________';
          Cadena.Add(s);
          s := '              '+
               'Declar(amos) que conocemos y aceptamos las condiciones de manejo de esta modalidad de ahorro. Autorizamos a '+txcBoldOn+Empresa+txcBoldOff;
          Cadena.Add(s);
          s := '              '+
               'para: a) Reportar o consultar cualquier información relacionada con mis(nuestras) actividades financieras en las centrales de riesgo.';
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;
          Cadena.Add(s);
          s := '              '+
               'b) Que en caso de muerte, el valor de los aportes sociales sea entregado a mis beneficiarios';
          Cadena.Add(s);
          s := '              '+
               '___________________________________________________________________________________________________________________________________________';
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;
          s := '              '+
               '                                                   HUELLA DACTILAR                                                       HUELLA DACTILAR';
          Cadena.Add(s);
          s := '';
          Cadena.Add(s);
          Cadena.Add(s);
          Cadena.Add(s);
          Cadena.Add(s);
          s := '              '+
               '__________________________________________________'+'                '+'__________________________________________________';
          Cadena.Add(s);
          s := '              '+
               '                       Firma                      '+'                '+'                       Firma                      ';
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
          s := '';
          Cadena.Clear;
          Cadena.Add(s);
          Cadena.Add(s);
          Cadena.Add(s);
          Cadena.Add(s);
          s := '              '+
               '   Funcionario '+txcBoldOn+IBFuncionario.FieldByName('NOMBRE').AsString+ ' '+IBFuncionario.FieldByName('PRIMER_APELLIDO').AsString+' '+IBFuncionario.FieldByName('SEGUNDO_APELLIDO').AsString+txcBoldOff+
               txcNormal+txcCondensedOn;
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
        finally
          Cadena.Free;
        end;
end;

procedure TfrmImpresionCaptacion.CmdImpresoraClick(Sender: TObject);
var  Device, Driver, Port: array[0..255] of char;
     PrinterName: string;
     buf:array[0..255] of char;
     Handle, hDeviceMode: THandle;

begin
        if PrinterSetupDialog1.Execute then
        begin
          Printer.GetPrinter(Device,Driver,Port,hDeviceMode);
          PrinterName := Format('%s', [Device]);
          EdImpresora.Caption := PrinterName;
        end;
end;

procedure TfrmImpresionCaptacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmImpresionCaptacion.CmdImprimirTarjetaClick(Sender: TObject);
var Cadena:TStrings;
    s,tmp:string;
    tipo,age,cuenta:Integer;
begin
{        Impresora := EdImpresora.Caption;
        IBDirRes.Close;
        IBDirRes.ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery.FieldByName('ID_IDENTIFICACION').AsInteger;
        IBDirRes.ParamByName('ID_PERSONA').AsInteger := IBQuery.FieldByName('ID_PERSONA').AsInteger;
        try
          IBDirRes.Open;
        except
          MessageDlg('Error localizando dirección de Residencia',mtError,[mbok],0);
        end;

        tipo := DBLCBTipoCaptacion.KeyValue;
        age  := DBLCBAgencia.KeyValue;
        cuenta := StrToInt(EdNumeroCap.Text);
        Cadena := TStringList.Create;
        try
          s := txcNormal+txc12cpiOff+txcCondensedOn;
          Cadena.Add(s);
          s := '+-------------------------------------------------------------------------------------------------+';
          Cadena.Add(s);
          s := '| '+Format('%20s',[Empresa])+'     SOLICITUD DE INGRESO     Impreso el:'+DateToStr(Date)+'   Captacion: '+
               Format('%d%.2d-%.7d',[tipo,age,cuenta])+'|';
          Cadena.Add(s);
          s := '+-------------------------------------------------------------------------------------------------+';
          Cadena.Add(s);
          tmp := LeftStr(IBQuery.FieldByName('LUGAR_EXPEDICION').AsString,20);
          s := '| '+'Id:'+Format('%12s',[IBQuery.FieldByName('ID_PERSONA').AsString])+' |Tp: '+Format('%25s',[IBQuery.FieldByName('DESCRIPCION_IDENTIFICACION').AsString])+'| Exp: '+Format('%20s',[tmp])+'| Fecha Nac: '+DateToStr(IBQuery.FieldByName('FECHA_NACIMIENTO').AsDateTime)+'|';
          Cadena.Add(s);
          s := '+-------------------------------------------------------------------------------------------------+';
          Cadena.Add(s);
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;
          with IBTitulares do begin
          while not Eof do begin

           tmp := FieldByName('NOMBRE').AsString+' '+FieldByName('PRIMER_APELLIDO').AsString+' '+FieldByName('SEGUNDO_APELLIDO').AsString;
           s := '| Nomb: '+Format('%50s',[tmp])+'| Tel: '+Format('%15s',[IBDirRes.FieldByName('TELEFONO1').AsString])+'|';
           Cadena.Add(s);
           s := '+-------------------------------------------------------------------------------------------------+';
           Cadena.Add(s);
          end;
          end;
          ImprimirCadena(Impresora,Cadena.Text);
          Cadena.Clear;
        except
          MessageDlg('Error al Imprimir Tarjeta',mtError,[mbcancel],0);
          Exit;
        end;
}
end;

procedure TfrmImpresionCaptacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmCaptacion.Free;
end;

procedure TfrmImpresionCaptacion.CmdNuevoReporteClick(Sender: TObject);

begin
        IBTitulares.Close;
        IBTitulares.ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencia.KeyValue;
        IBTitulares.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
        IBTitulares.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(Trim(ednumerocap.Text));
        IBTitulares.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(Trim(eddigitocap.Caption));
         try
            IBTitulares.Open;
         except
             MessageDlg('Erro localizando Autorizados',mtError,[mbok],0);
         end;

        with IBReferencias do begin
          Close;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString := IBQuery.FieldByName('ID_PERSONA').AsString;
          try
            Open;
          except
            MessageDlg('Error localizando Referencias',mtError,[mbok],0);
          end;
        end;

        with IBQAdicionales do begin
           Close;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString := IBQuery.FieldByName('ID_PERSONA').AsString;
          try
            Open;
          except
            MessageDlg('Error Localizando Información Adicional',mtError,[mbok],0);
          end;
        end;

        with IBFuncionario do begin
          Close;
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          try
            Open;
          except
            MessageDlg('Error Localizando Funcionario',mtError,[mbok],0);
          end;
        end;
        with IBbeneficiario do begin
          Close;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString := IBQuery.FieldByName('ID_PERSONA').AsString;
          try
            Open;
          except
            MessageDlg('Error localizando Beneficiarios',mtError,[mbok],0);
          end;
        end;
        with IBAuxilio do begin
          Close;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString := IBQuery.FieldByName('ID_PERSONA').AsString;
          try
            Open;
          except
            MessageDlg('Error localizando Beneficiarios Auxilio por muerte',mtError,[mbok],0);
          end;
        end;


        tipo := DBLCBTipoCaptacion.KeyValue;
        age  := DBLCBAgencia.KeyValue;
        cuenta := StrToInt(EdNumeroCap.Text);

        Empleado;

        FormularioN.ShowReport;

end;

procedure TfrmImpresionCaptacion.FormularioNGetValue(const ParName: String;
  var ParValue: Variant);
begin

        if ParName = ' NIT' then
           ParValue := Nit;
        if ParName = 'CUENTA' then
           ParValue := Format('%d%.2d-%.7d',[tipo,age,cuenta]);
        if ParName = 'FECHAAPERTURA' then
           ParValue := IBQuery.FieldByName('FECHA_APERTURA').AsDateTime;
        if ParName = 'EMPRESA' then
           ParValue := Empresa;
        if ParName = 'FUNCIONARIO' then
           ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'CIUDAD' then
           ParValue := Ciudad;
        if ParName = 'TIPOCUENTA' then
           ParValue := 'Individual';
        if ParName = 'FIRMAS' then
           ParValue := IBQuery.FieldByName('FIRMAS').AsInteger;
        if ParName = 'SELLOS' then
           ParValue := IBQuery.FieldByName('SELLOS').AsInteger;
        if ParName = 'PROTECTOGRAFOS' then
           ParValue := IBQuery.FieldByName('PROTECTOGRAFOS').AsInteger;

           
end;

procedure TfrmImpresionCaptacion.IBTitularesAfterScroll(DataSet: TDataSet);
begin
           IBDirRes.Close;
           IBDirRes.ParamByName('ID_IDENTIFICACION').AsInteger := IBTitulares.FieldByName('ID_IDENTIFICACION').AsInteger;
           IBDirRes.ParamByName('ID_PERSONA').AsString := IBTitulares.FieldByName('ID_PERSONA').AsString;
           try
             IBDirRes.Open;
           except
             MessageDlg('Error localizando dirección de Residencia',mtError,[mbok],0);
           end;

           IBDirCor.Close;
           IBDirCor.ParamByName('ID_IDENTIFICACION').AsInteger := IBTitulares.FieldByName('ID_IDENTIFICACION').AsInteger;
           IBDirCor.ParamByName('ID_PERSONA').AsString := IBTitulares.FieldByName('ID_PERSONA').AsString;
           try
            IBDirCor.Open;
           except
            MessageDlg('Error localizando dirección de Correspondencia',mtError,[mbok],0);
           end;

           IBDirEmp.Close;
           IBDirEmp.ParamByName('ID_IDENTIFICACION').AsInteger := IBTitulares.FieldByName('ID_IDENTIFICACION').AsInteger;
           IBDirEmp.ParamByName('ID_PERSONA').AsString := IBTitulares.FieldByName('ID_PERSONA').AsString;
           try
            IBDirEmp.Open;
           except
            MessageDlg('Error localizando dirección de Correspondencia',mtError,[mbok],0);
           end;

end;

end.
