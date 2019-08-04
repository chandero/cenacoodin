unit UnitProcesarDatos;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBSQL, StrUtils, DBClient;

type
  TfrmProcesarDatos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    EdFechaCorte: TDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox2: TGroupBox;
    Bar: TProgressBar;
    CmdGenerar: TBitBtn;
    CmdEnviar: TBitBtn;
    CmdVer: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBSNoCredito: TIBSQL;
    IBSClientes: TIBSQL;
    IBSCodeudores: TIBSQL;
    IBSCuotas: TIBSQL;
    IBQuery2: TIBQuery;
    DataAnterior: TClientDataSet;
    DataErrores: TClientDataSet;
    DataErroresCOLOCACION_ERRADO: TStringField;
    DataErroresIDENTIFICACION: TStringField;
    DataErroresAGENCIA: TIntegerField;
    DataErroresCOLOCACION_CORRECTO: TStringField;
    DataAnteriorNUMERO: TStringField;
    DataAnteriorIDENTIFICACION: TStringField;
    DataAnteriorNOMBRE: TStringField;
    DataAnteriorFNACIM: TStringField;
    DataAnteriorFAPERT: TStringField;
    DataAnteriorFVENCI: TStringField;
    DataAnteriorVCUOTA: TStringField;
    Ed1: TEdit;
    OpenDialog1: TOpenDialog;
    DataAnteriorNOVEDA: TStringField;
    DataAnteriorADJETI: TStringField;
    DataAnteriorTPIDEN: TStringField;
    DataAnteriorVALINI: TStringField;
    DataAnteriorVALDEU: TStringField;
    DataAnteriorVALMOR: TStringField;
    DataAnteriorVALDIS: TStringField;
    DataAnteriorTPMONE: TStringField;
    DataAnteriorTPOBLI: TStringField;
    DataAnteriorTPGARA: TStringField;
    DataAnteriorCALIFI: TStringField;
    DataAnteriorCRESID: TStringField;
    DataAnteriorDRESID: TStringField;
    DataAnteriorTRESID: TStringField;
    DataAnteriorCLABOR: TStringField;
    DataAnteriorTLABOR: TStringField;
    DataAnteriorCCORRE: TStringField;
    DataAnteriorDCORRE: TStringField;
    DataAnteriorCIIU: TStringField;
    DataAnteriorTCUOTA: TStringField;
    DataAnteriorCCANCE: TStringField;
    DataAnteriorCEMORA: TStringField;
    DataAnteriorFUPAGO: TStringField;
    DataAnteriorOFICIN: TStringField;
    DataAnteriorCRADIC: TStringField;
    DataAnteriorFOPAGO: TStringField;
    DataAnteriorPEPAGO: TStringField;
    DataAnteriorEDMORA: TStringField;
    DataAnteriorFACTUA: TStringField;
    DataAnteriorRECLAM: TStringField;
    DataAnteriorRESPON: TStringField;
    DataAnteriorESTRAC: TStringField;
    DataAnteriorRELLEN: TStringField;
    DataActual: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    Ed2: TEdit;
    IBPersona: TIBSQL;
    CheckBox4: TCheckBox;
    IBTmp: TIBQuery;
    IBSReporteAnt: TIBSQL;
    CheckBox3: TCheckBox;
    IBQuery3: TIBQuery;
    DataActualizaTabla: TClientDataSet;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    StringField45: TStringField;
    StringField46: TStringField;
    StringField47: TStringField;
    StringField48: TStringField;
    StringField49: TStringField;
    StringField50: TStringField;
    StringField51: TStringField;
    StringField52: TStringField;
    StringField53: TStringField;
    StringField54: TStringField;
    StringField55: TStringField;
    StringField56: TStringField;
    StringField57: TStringField;
    StringField58: TStringField;
    StringField59: TStringField;
    StringField60: TStringField;
    StringField61: TStringField;
    StringField62: TStringField;
    StringField63: TStringField;
    StringField64: TStringField;
    StringField65: TStringField;
    StringField66: TStringField;
    StringField67: TStringField;
    StringField68: TStringField;
    StringField69: TStringField;
    StringField70: TStringField;
    StringField71: TStringField;
    StringField72: TStringField;
    StringField73: TStringField;
    StringField74: TStringField;
    StringField75: TStringField;
    StringField76: TStringField;
    StringField77: TStringField;
    StringField78: TStringField;
    StringField79: TStringField;
    StringField80: TStringField;
    DataSaldados: TClientDataSet;
    StringField81: TStringField;
    StringField82: TStringField;
    StringField83: TStringField;
    StringField84: TStringField;
    StringField85: TStringField;
    StringField86: TStringField;
    StringField87: TStringField;
    StringField88: TStringField;
    StringField89: TStringField;
    StringField90: TStringField;
    StringField91: TStringField;
    StringField92: TStringField;
    StringField93: TStringField;
    StringField94: TStringField;
    StringField95: TStringField;
    StringField96: TStringField;
    StringField97: TStringField;
    StringField98: TStringField;
    StringField99: TStringField;
    StringField100: TStringField;
    StringField101: TStringField;
    StringField102: TStringField;
    StringField103: TStringField;
    StringField104: TStringField;
    StringField105: TStringField;
    StringField106: TStringField;
    StringField107: TStringField;
    StringField108: TStringField;
    StringField109: TStringField;
    StringField110: TStringField;
    StringField111: TStringField;
    StringField112: TStringField;
    StringField113: TStringField;
    StringField114: TStringField;
    StringField115: TStringField;
    StringField116: TStringField;
    StringField117: TStringField;
    StringField118: TStringField;
    StringField119: TStringField;
    StringField120: TStringField;
    DataActualNOMBREC: TStringField;
    DataSaldadosNOMBREC: TStringField;
    DataSaldadosLINEA: TStringField;
    DataSaldadosFECHA_DESEMBOLSO: TStringField;
    DataSaldadosFECHA_VENCIMIENTO: TStringField;
    DataSaldadosIDIDENT: TStringField;
    DataActualLINEA: TStringField;
    DataActualFECHA_DESEMBOLSO: TStringField;
    DataActualFECHA_VENCIMIENTO: TStringField;
    DataActualIDIDENT: TStringField;
    CheckBox6: TCheckBox;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGenerarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure EdFechaCorteExit(Sender: TObject);
  private
    procedure Encabezado;
    procedure ColActivas;
    function Novedad(IDAgencia: Integer; IdColocacion: string;Dias:Integer): Integer;
    function Adjetivo(IdAgencia: Integer; IdColocacion: string): string;
    procedure RegistroFin;
    procedure ColCastigadas;
    procedure InsertarTabla;
    procedure ColSaldadas;
    { Private declarations }
  public
    { Public declarations }
  end;

type Registro = Record
    Numero:string; // * 18
    Identificacion:string; // * 11
    Nombre:string; // * 45
    NombreC:string; // *60
    FNacim:string; // * 06
    FApert:string; // * 06
    FVenci:string; // * 06
    VCuota:string; // * 10
    Noveda:string; // * 02
    Adjeti:string; // * 02
    TpIden:string; // * 01
    ValIni:string; // * 10
    ValDeu:string; // * 10
    ValMor:string; // * 10
    ValDis:string; // * 10
    TpMone:string; // * 01
    TpObli:string; // * 01
    TpGara:string; // * 01
    Califi:string; // * 01
    CResid:string; // * 15
    DResid:string; // * 30
    TResid:string; // * 10
    CLabor:string; // * 15
    TLabor:string; // * 10
    CCorre:string; // * 15
    DCorre:string; // * 30
    Ciiu  :string; // * 06
    TCuota:string; // * 03
    CCance:string; // * 03
    CeMora:string; // * 03
    FUPago:string; // * 06
    Oficin:string; // * 15
    CRadic:string; // * 15 ciudad radicación
    FoPago:string; // * 01 forma de pago
    PePago:string; // * 01 periodo de pago
    EdMora:string; // * 03
    FActua:string; // * 08 Fecha de Corte
    Reclam:string; // * 01
    Respon:string; // * 02  00 para deudor, 01 para codeudor
    Estrac:string; // * 01  Estrato Social
    Rellen:string; // * 14  en ceros
    Linea:string; // 1
    FDes:string; // 8
    FVen:string; // 8
    TpIdCi:string; // 2
    Sucursal:string;
    DiasMora:string
end;

var
  frmProcesarDatos: TfrmProcesarDatos;
  PlanoReporte:TStringList;
  SumaNovedad:Integer;
  SumaRegistros:Integer;
  PlanoErrores:TStringList;
  MesCorteAct:string;
  MesCorteAnt:string;
  Mes,Ano : Integer;
  MesAnt,AnoAnt : string;
  MesAct,AnoAct : string;
  FechaAnt : TDate;
  Dia:Integer;


    cadena:string;
    LineaC:registro;
    LineaError:string;
    ColocacionNew:string;
    ConverColocacion:Int64;
    ColocacionAnt:string;
    ColocacionActual:string;
    DiasMora:Integer;
    NoCod:Integer;
    NovedadLocal:Integer;
    Fecha:TDate;
    Nombre:string;
    NombreC,Apel1C,Apel2C:string;
    FechaNacimiento:string;

    i,j: Integer;
    Entero: Integer;
    S1,S2 :TStringList;
    ColocacionErr : string;
    DescAgencia:string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobalesCol,UnitDmcolocacion, UnitMuestroArchivoData, UnitGlobales;

procedure TfrmProcesarDatos.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmProcesarDatos.Encabezado;
var cadena:string;
    LineaC:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Encabezado del Archivo
      cadena := '000000000000000000';
      LineaC := cadena;
// Codigo y Tipo Cartera
      cadena := '27391927';
      LineaC := LineaC + cadena;
// Fecha Corte
      cadena := Format('%.4d',[YearOf(EdFechaCorte.Date)])+Format('%.2d',[monthOf(EdFechaCorte.Date)]);
      LineaC := LineaC + cadena;
// Ampliacion Milenio
      cadena := 'M';
      LineaC := LineaC + cadena;
// Indicador de Valores en Miles
      cadena := '0';
      LineaC := LineaC + cadena;
// Relleno
      cadena := '';
      i1 := 1;
      i2 := 326;
      for J := i1 to i2 do
          cadena := cadena + '0';
      LineaC := LineaC + cadena;
      PlanoReporte.Add(LineaC);
      CheckBox1.Checked := True;
end;

procedure TfrmProcesarDatos.ColActivas;  //Procesar las Colocaciones Causadas
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        SumaNovedad := 0;
        SumaRegistros := 0;
        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as CONTEO from "col$causaciondiaria" where (FECHA_CORTE = :"FECHA_CORTE") and (id_estado not in (7,6))');
           ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información con esa fecha de corte',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            Bar.Min := 0;
            Bar.Max := FieldByName('CONTEO').AsInteger;
            Bar.Position := 0;
           except
              Transaction.Rollback;
              raise;
              Exit;
           end;
        end;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$causaciondiaria" where (FECHA_CORTE = :"FECHA_CORTE") and (id_estado not in (7,6)) order by ID_COLOCACION ASC');
           ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           while not eof do begin
             Bar.Position := RecNo;
             Application.ProcessMessages;
             // Proceso informacion Clientes
             with IBSClientes do begin
              Close;
              SQL.Clear;
              SQL.Add('select ');
              SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
              SQL.Add('"col$colocacion".ID_PERSONA,');
              SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
              SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
              SQL.Add('"col$colocacion".VALOR_CUOTA,');
              SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
              SQL.Add('"col$tiposcuota".INTERES,');
              SQL.Add('"gen$direccion".ID_DIRECCION,');
              SQL.Add('"gen$direccion".DIRECCION,');
              SQL.Add('"gen$direccion".MUNICIPIO,');
              SQL.Add('"gen$direccion".TELEFONO1');
              SQL.Add('from "col$colocacion"');
              SQL.Add('left join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
              SQL.Add('left join "gen$direccion" on ("col$colocacion".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$direccion".ID_PERSONA)');
              SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
              SQL.Add('where');
              SQL.Add('"col$colocacion".ID_AGENCIA = :"ID_AGENCIA" and');
              SQL.Add('"col$colocacion".ID_COLOCACION = :"ID_COLOCACION"');
              ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              ExecQuery;
              try
                ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
                ConverColocacion := StrToInt64(ColocacionNew);
                ColocacionNew := Format('%.18d',[ConverColocacion]);       //'000000000000000000';
                ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);
                NovedadLocal := 0;
              except
                ShowMessage(ColocacionNew);
                raise;
              end;
            end;
            case IBSClientes.FieldByName('ID_IDENTIFICACION').AsInteger of
               3 : LineaC.TpIdCi := '01';
               4 : LineaC.TpIdCi := '02';
               6 : LineaC.TpIdCi := '03';
               2 : LineaC.TpIdCi := '04';
               8 : LineaC.TpIdCi := '05';
               7 : LineaC.TpIdCi := '07';
               1 : LineaC.TpIdCi := '09';
               0 : LineaC.TpIdCi := '01';
             end;
            LineaC.Numero := ColocacionNew;
            LineaC.Identificacion := StringReplace(Format('%11s',[trim(IBSClientes.FieldByName('ID_PERSONA').AsString)]),' ','0',[rfReplaceAll]);
            with IBPersona do begin
              Application.ProcessMessages;
              Close;
              SQL.Clear;
              SQL.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO,');
              SQL.Add('NOMBRE, FECHA_NACIMIENTO');
              SQL.Add('from "gen$persona" where ');
              SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and');
              SQL.Add('ID_PERSONA = :"ID_PERSONA"');
              ParamByName('ID_IDENTIFICACION').AsInteger := IBSClientes.FieldByName('ID_IDENTIFICACION').AsInteger;
              ParamByName('ID_PERSONA').AsString := IBSClientes.FieldByName('ID_PERSONA').AsString;
              ExecQuery;
              Nombre := Trim(IBPersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                      IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                      IBPersona.FieldByName('NOMBRE').AsString);


               if (IBSClientes.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBSClientes.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
                begin
                  NombreC := Format('%-29s',[LeftStr(IBPersona.FieldByName('NOMBRE').AsString,29)]);
                  Apel1C := Format('%-15s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString,15)]);
                  Apel2C := Format('%-14s',[LeftStr(IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
                  LineaC.NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
                end
               else
                begin
                  NombreC := Format('%-60s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString +
                  IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString +
                  IBPersona.FieldByName('NOMBRE').AsString,60)]);
                  LineaC.NombreC := NombreC;
                end;

               NombreC := '';

              FechaNacimiento := IBPersona.FieldByName('FECHA_NACIMIENTO').AsString;
              Close;
            end;

             LineaC.Nombre := Format('%-45s',[LeftStr(Nombre,45)]);
             Nombre := '';
             LineaC.Sucursal := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger);
             LineaC.Respon := '00';
             LineaC.Califi := IBQuery1.FieldByName('ID_ARRASTRE').AsString;
             LineaC.FNacim := '000000';
             LineaC.FApert := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDateTime)])+Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDateTime)]);
             LineaC.FVenci := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDateTime)])+Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDateTime)]);
             LineaC.VCuota := Formatcurr('0000000000',IBSClientes.FieldByName('VALOR_CUOTA').ASCurrency);
             Fecha := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
             if IBSClientes.FieldByName('INTERES').AsString = 'V' then
                Fecha := CalculoFecha(Fecha,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
             Fecha := IncDay(Fecha);
             DiasMora := ObtenerDeudaFecha(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,EdFechaCorte.Date,IBSCodeudores).Dias;
             LineaC.DiasMora := IntToStr(DiasMora);
             NovedadLocal := Novedad(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,DiasMora);
             SumaNovedad := SumaNovedad + NovedadLocal;
             
             LineaC.Noveda := StringReplace(Format('%2s',[IntToStr(Novedadlocal)]),' ','0',[rfReplaceAll]);
             LineaC.Adjeti := adjetivo(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString);
             case IBSClientes.FieldByName('ID_IDENTIFICACION').AsInteger of
               3 : LineaC.TpIden := '1';
               4 : LineaC.TpIden := '2';
               6 : LineaC.TpIden := '3';
               7 : LineaC.TpIden := '4';
               9 : LineaC.TpIden := '5';
               0 : LineaC.TpIden := '1';
             end;
            LineaC.ValIni := FormatCurr('0000000000',ibquery1.FieldByName('VALOR').AsCurrency);
            LineaC.ValDeu := FormatCurr('0000000000',ibquery1.FieldByName('DEUDA').AsCurrency);
            if (IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'A') or (IBQuery1.FieldByName('ID_ARRASTRE').AsString = 'B') then
              LineaC.ValMor := FormatCurr('0000000000',ObtenerDeudaFecha(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,EdFechaCorte.Date,IBSCodeudores).Valor)
            else
              LineaC.ValMor := FormatCurr('0000000000',IBQuery1.FieldByName('DEUDA').AsCurrency);
            LineaC.ValDis := '0000000000';
            LineaC.TpMone := '1';
            LineaC.TpObli := IntToStr(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger);
            LineaC.TpGara := IntToStr(IBQuery1.FieldByName('ID_GARANTIA').AsInteger);

            LineaC.CResid := Format('%15s',[leftstr(trim(ibsclientes.FieldByName('MUNICIPIO').AsString),15)]);
            LineaC.DResid := Format('%30s',[leftstr(trim(ibsclientes.FieldByName('DIRECCION').AsString),30)]);
            LineaC.TResid := StringReplace(Format('%10s',[leftstr(trim(ibsclientes.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
            LineaC.CLabor := Format('%15s',[LeftStr(trim(ibsclientes.FieldByName('MUNICIPIO').AsString),15)]);
            LineaC.TLabor := StringReplace(Format('%10s',[LeftStr(trim(ibsclientes.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
            LineaC.CCorre := Format('%15s',[leftstr(trim(ibsclientes.FieldByName('MUNICIPIO').AsString),15)]);
            LineaC.DCorre := Format('%30s',[leftstr(trim(ibsclientes.FieldByName('DIRECCION').AsString),30)]);
            LineaC.Ciiu := '000000';
            with IBSCuotas do
             begin
               Application.ProcessMessages;
               SQL.Clear;
               SQL.Add('select count(CUOTA_NUMERO) as CUOTAS from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION"');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               try
                 LineaC.TCuota := Format('%.3d',[FieldByName('CUOTAS').AsInteger]);
                 Close;
               except
                 raise;
               end;
             end;
            with IBSCuotas do
             begin
               Application.ProcessMessages;
               SQL.Clear;
               SQL.Add('select count(CUOTA_NUMERO) as CUOTASPAG from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
               SQL.Add('PAGADA = 1 and FECHA_A_PAGAR <= :"FECHA_CORTE"');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
               ExecQuery;
               try
                 LineaC.CCance := Format('%.3d',[FieldByName('CUOTASPAG').AsInteger]);
                 Close;
               except
                 raise;
               end;
             end;
            if (NovedadLocal = 1) or (NovedadLocal = 5) then
             LineaC.CeMora := '000'
            else
            begin
              with IBSCuotas do
               begin
                 Application.ProcessMessages;
                 SQL.Clear;
                 SQL.Add('select count(CUOTA_NUMERO) as CUOTASMORA from "col$tablaliquidacion"');
                 SQL.Add('where ');
                 SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
                 SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
                 SQL.Add('FECHA_A_PAGAR <= :"FECHA_CORTE" and FECHA_PAGADA <= :"FECHA_CORTE" and');
                 SQL.Add('PAGADA = 0');
                 ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                 ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                 ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
                 ExecQuery;
                 try
                   LineaC.CeMora := Format('%.3d',[FieldByName('CUOTASMORA').AsInteger]);
                   Close;
                 except
                 raise;
                 end;
               end;
            end;
            with IBQuery2 do
             begin
               Application.ProcessMessages;
               Close;
               SQL.Clear;
               SQL.Add('select FECHA_PAGADA from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
               SQL.Add('PAGADA = 1 and FECHA_PAGADA <= :FECHA_CORTE');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
               Open;
               try
                 IBQuery2.First;
                 IBQuery2.Last;
                 if IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime <> 0 then
                    LineaC.FUPago := Format('%.4d',[YearOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)])+ Format('%.2d',[monthOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)]) + Format('%.2d',[DayOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)])
                 else
                    LineaC.FUPago := '00000000';
                 Close;
               except
                 ShowMessage(LineaC.FUPago);
                 raise;
               end;
             end;
            with IBQuery2 do begin
             SQL.Clear;
             SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA = :ID_AGENCIA');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             Open;
             DescAgencia := LeftStr(Trim(FieldByName('DESCRIPCION_AGENCIA').AsString),15);
             Close;
            end;

            LineaC.Oficin := Format('%15s',[DescAgencia]);
            LineaC.CRadic := Format('%15s',[DescAgencia]);
            LineaC.FoPago := '0';
            case IBQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger of
              30 : LineaC.PePago := '1';
              60 : LineaC.PePago := '2';
              90 : LineaC.PePago := '3';
              180 : LineaC.PePago := '4';
              360 : LineaC.PePago := '5';
            end;
            if LineaC.PePago = '' then LineaC.PePago := '9';

            if (DiasMora < 30) then LineaC.EdMora := '001'
            else if (DiasMora >= 30) and (DiasMora < 60) then LineaC.EdMora := '030'
            else if (DiasMora >= 60) and (DiasMora < 90) then LineaC.EdMora := '060'
            else if (DiasMora >= 90) and (DiasMora < 120) then LineaC.EdMora := '090'
            else if (DiasMora >= 120) and (DiasMora < 150) then LineaC.EdMora := '120'
            else if (DiasMora >= 150) and (DiasMora < 180) then LineaC.EdMora := '150'
            else if (DiasMora >= 180) and (DiasMora < 210) then LineaC.EdMora := '180'
            else if (DiasMora >= 210) and (DiasMora < 240) then LineaC.EdMora := '210'
            else if (DiasMora >= 240) and (DiasMora < 270) then LineaC.EdMora := '240'
            else if (DiasMora >= 270) and (DiasMora < 300) then LineaC.EdMora := '270'
            else if (DiasMora >= 300) and (DiasMora < 330) then LineaC.EdMora := '300'
            else if (DiasMora >= 330) and (DiasMora < 360) then LineaC.EdMora := '330'
            else if (DiasMora > 360) then LineaC.EdMora := '360';
            LineaC.FActua := Format('%.4d',[YearOf(EdFechaCorte.Date)]) + Format('%.2d',[monthOf(EdFechaCorte.Date)]) + Format('%.2d',[DayOf(EdFechaCorte.Date)]);
            LineaC.Reclam := '0';

            LineaC.Estrac := '3';
            LineaC.Rellen := '              ';

            with IBSClientes do begin
              IBSClientes.Close;
              SQL.Clear;
              SQL.Add('select ID_IDENTIFICACION, ID_LINEA, FECHA_DESEMBOLSO, FECHA_VENCIMIENTO from "col$colocacion" where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION =:ID_COLOCACION');
              ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              ExecQuery;
            end;

            if IBSClientes.FieldByName('ID_LINEA').AsInteger = 1 then
               LineaC.Linea := '003'
            else if IBSClientes.FieldByName('ID_LINEA').AsInteger = 7 then
               LineaC.Linea := '014'
            else
               LineaC.Linea := '007';

            LineaC.FDes := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)])+ Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)]) + Format('%.2d',[dayOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)]);
            LineaC.FVen := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)])+ Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)]) + Format('%.2d',[dayOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)]);


            DataActual.Open;
            DataActual.Insert;
            DataActual.FieldByName('NUMERO').AsString := LineaC.Numero;
            DataActual.FieldByName('IDENTIFICACION').AsString := LineaC.Identificacion;
            DataActual.FieldByName('NOMBRE').AsString := LineaC.Nombre;
            DataActual.FieldByName('NOMBREC').AsString := LineaC.NombreC;
            DataActual.FieldByName('FNACIM').AsString := LineaC.FNacim;
            DataActual.FieldByName('FAPERT').AsString := LineaC.FApert;
            DataActual.FieldByName('FVENCI').AsString := LineaC.FVenci;
            DataActual.FieldByName('VCUOTA').AsString := LineaC.VCuota;
            DataActual.FieldByName('NOVEDA').AsString := LineaC.Noveda;
            DataActual.FieldByName('ADJETI').AsString := LineaC.Adjeti;
            DataActual.FieldByName('TPIDEN').AsString := LineaC.TpIden;
            DataActual.FieldByName('VALINI').AsString := LineaC.ValIni;
            DataActual.FieldByName('VALDEU').AsString := LineaC.ValDeu;
            DataActual.FieldByName('VALMOR').AsString := LineaC.ValMor;
            DataActual.FieldByName('VALDIS').AsString := LineaC.ValDis;
            DataActual.FieldByName('TPMONE').AsString := LineaC.TpMone;
            DataActual.FieldByName('TPOBLI').AsString := LineaC.TpObli;
            DataActual.FieldByName('TPGARA').AsString := LineaC.TpGara;
            DataActual.FieldByName('CALIFI').AsString := LineaC.Califi;
            DataActual.FieldByName('CRESID').AsString := LineaC.CResid;
            DataActual.FieldByName('DRESID').AsString := LineaC.DResid;
            DataActual.FieldByName('TRESID').AsString := LineaC.TResid;
            DataActual.FieldByName('CLABOR').AsString := LineaC.CLabor;
            DataActual.FieldByName('TLABOR').AsString := LineaC.TLabor;
            DataActual.FieldByName('CCORRE').AsString := LineaC.CCorre;
            DataActual.FieldByName('DCORRE').AsString := LineaC.DCorre;
            DataActual.FieldByName('CIIU').AsString := LineaC.Ciiu;
            DataActual.FieldByName('TCUOTA').AsString := LineaC.TCuota;
            DataActual.FieldByName('CCANCE').AsString := LineaC.CCance;
            DataActual.FieldByName('CEMORA').AsString := LineaC.CeMora;
            DataActual.FieldByName('FUPAGO').AsString := LineaC.FUPago;
            DataActual.FieldByName('OFICIN').AsString := LineaC.Oficin;
            DataActual.FieldByName('CRADIC').AsString := LineaC.CRadic;
            DataActual.FieldByName('FOPAGO').AsString := LineaC.FoPago;
            DataActual.FieldByName('PEPAGO').AsString := LineaC.PePago;
            DataActual.FieldByName('EDMORA').AsString := LineaC.EdMora;
            DataActual.FieldByName('FACTUA').AsString := LineaC.FActua;
            DataActual.FieldByName('RECLAM').AsString := LineaC.Reclam;
            DataActual.FieldByName('RESPON').AsString := LineaC.Respon;
            DataActual.FieldByName('ESTRAC').AsString := LineaC.Estrac;
            DataActual.FieldByName('RELLEN').AsString := LineaC.Rellen;
            DataActual.FieldByName('LINEA').AsString := LineaC.Linea;
            DataActual.FieldByName('FECHA_DESEMBOLSO').AsString := LineaC.FDes;
            DataActual.FieldByName('FECHA_VENCIMIENTO').AsString := LineaC.FVen;
            DataActual.FieldByName('IDIDENT').AsString := LineaC.TpIdCi;
            DataActual.Post;
            DataActual.Close;

            PlanoReporte.Add(LineaC.Numero + LineaC.Identificacion + LineaC.Nombre +
                       LineaC.FNacim + LineaC.FApert + LineaC.FVenci + LineaC.VCuota +
                       LineaC.Noveda + LineaC.Adjeti + LineaC.TpIden + LineaC.ValIni +
                       LineaC.ValDeu + LineaC.ValMor + LineaC.ValDis + LineaC.TpMone +
                       LineaC.TpObli + LineaC.TpGara + LineaC.Califi + LineaC.CResid +
                       LineaC.DResid + LineaC.TResid + LineaC.CLabor + LineaC.TLabor +
                       LineaC.CCorre + LineaC.DCorre + LineaC.Ciiu + LineaC.TCuota +
                       LineaC.CCance + LineaC.CeMora + LineaC.FUPago + LineaC.Oficin +
                       LineaC.CRadic + LineaC.FoPago + LineaC.PePago + LineaC.EdMora +
                       LineaC.FActua + LineaC.Reclam + LineaC.Respon + LineaC.Estrac + LineaC.Rellen);

            SumaRegistros := SumaRegistros + 1;
            IBSClientes.Close;
            // fin de proceso clientes

            // Inicio proceso CODEUDORES
//             NoCod := 0;
             with IBSCodeudores do begin
              Close;
              SQL.Clear;
              SQL.Add('select ');
              SQL.Add('"col$colgarantias".ID_IDENTIFICACION,');
              SQL.Add('"col$colgarantias".ID_PERSONA,');
              SQL.Add('"col$colgarantias".CSC_GARANTIA,');
              SQL.Add('"gen$persona".PRIMER_APELLIDO,');
              SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
              SQL.Add('"gen$persona".NOMBRE,');
              SQL.Add('"gen$persona".FECHA_NACIMIENTO');
              SQL.Add('from "col$colgarantias"');
              SQL.Add('left join "gen$persona" on ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA)');
              SQL.Add('where');
              SQL.Add('"col$colgarantias".ID_AGENCIA = :"ID_AGENCIA" and');
              SQL.Add('"col$colgarantias".ID_COLOCACION = :"ID_COLOCACION"');
              ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              ExecQuery;
            end;

            while not IBSCodeudores.Eof do
             begin
               Application.ProcessMessages;
               ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ConverColocacion := StrToInt64(ColocacionNew);
            //   ColocacionNew := Format('%.16d',[ConverColocacion]);
               ColocacionNew := ColocacionNew + 'C' + IntToStr(IBSCodeudores.FieldByName('CSC_GARANTIA').AsInteger);
               ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);
             //  NovedadLocal := 0;

               LineaC.Numero := ColocacionNew;
               LineaC.Identificacion := StringReplace(Format('%11s',[trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString)]),' ','0',[rfReplaceAll]);
               //proceso verificacion codeudores
               if DataErrores.Locate('COLOCACION_ERRADO;IDENTIFICACION',VarArrayOf([LineaC.Numero,trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString)]),[locaseinsensitive]) then
                  LineaC.Numero := DataErrores.FieldValues['COLOCACION_CORRECTO'];
               //fin

               if (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
                begin
                  NombreC := Format('%-29s',[LeftStr(IBSCodeudores.FieldByName('NOMBRE').AsString,29)]);
                  Apel1C := Format('%-15s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString,15)]);
                  Apel2C := Format('%-14s',[LeftStr(IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
                  LineaC.NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
                end
               else
                begin
                  NombreC := Format('%-60s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString +
                  IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString +
                  IBSCodeudores.FieldByName('NOMBRE').AsString,60)]);
                  LineaC.NombreC := NombreC;
                end;

               NombreC := '';

               Nombre := Trim(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString + ' '
                         + IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString + ' '
                         + IBSCodeudores.FieldByName('NOMBRE').AsString);
               LineaC.Nombre := Format('%-45s',[LeftStr(Nombre,45)]);
               Nombre := '';
               LineaC.FNacim := '000000';
               SumaNovedad := SumaNovedad + NovedadLocal;
               case IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger of
                 3 : LineaC.TpIden := '1';
                 4 : LineaC.TpIden := '2';
                 6 : LineaC.TpIden := '3';
                 7 : LineaC.TpIden := '4';
                 9 : LineaC.TpIden := '5';
                 0 : LineaC.TpIden := '1';
               end;

              with IBSCuotas do begin
               Application.ProcessMessages;
               IBSCuotas.Close;
               SQL.Clear;
               SQL.Add('select first 1');
               SQL.Add('"gen$direccion".ID_DIRECCION,');
               SQL.Add('"gen$direccion".DIRECCION,');
               SQL.Add('"gen$direccion".MUNICIPIO,');
               SQL.Add('"gen$direccion".TELEFONO1');
               SQL.Add('from "gen$direccion"');
               SQL.Add('where');
               SQL.Add('"gen$direccion".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and');
               SQL.Add('"gen$direccion".ID_PERSONA = :"ID_PERSONA"');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
               ExecQuery;
               LineaC.CResid := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
               LineaC.DResid := Format('%30s',[leftstr(trim(ibscuotas.FieldByName('DIRECCION').AsString),30)]);
               LineaC.TResid := StringReplace(Format('%10s',[leftstr(trim(ibscuotas.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
               LineaC.CLabor := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
               LineaC.TLabor := StringReplace(Format('%10s',[leftstr(trim(ibscuotas.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
               LineaC.CCorre := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
               LineaC.DCorre := Format('%30s',[leftstr(trim(ibscuotas.FieldByName('DIRECCION').AsString),30)]);
               IBSCuotas.Close;
              end;

              LineaC.Respon := '01';


              with IBSClientes do begin
                IBSClientes.Close;
                SQL.Clear;
                SQL.Add('select ID_IDENTIFICACION, ID_LINEA, FECHA_DESEMBOLSO, FECHA_VENCIMIENTO from "col$colocacion" where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION =:ID_COLOCACION');
                ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                ExecQuery;
              end;

              if IBSClientes.FieldByName('ID_LINEA').AsInteger = 1 then
                 LineaC.Linea := '003'
              else if IBSClientes.FieldByName('ID_LINEA').AsInteger = 7 then
                 LineaC.Linea := '014'
              else
                 LineaC.Linea := '007';

              LineaC.FDes := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)])+ Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)]) + Format('%.2d',[dayOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)]);
              LineaC.FVen := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)])+ Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)]) + Format('%.2d',[dayOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)]);
              case IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger of
                 3 : LineaC.TpIdCi := '01';
                 4 : LineaC.TpIdCi := '02';
                 6 : LineaC.TpIdCi := '03';
                 2 : LineaC.TpIdCi := '04';
                 8 : LineaC.TpIdCi := '05';
                 7 : LineaC.TpIdCi := '07';
                 1 : LineaC.TpIdCi := '09';
                 0 : LineaC.TpIdCi := '01';
              end;


              DataActual.Open;
              DataActual.Insert;
              DataActual.FieldByName('NUMERO').AsString := LineaC.Numero;
              DataActual.FieldByName('IDENTIFICACION').AsString := LineaC.Identificacion;
              DataActual.FieldByName('NOMBRE').AsString := LineaC.Nombre;
              DataActual.FieldByName('NOMBREC').AsString := LineaC.NombreC;
              DataActual.FieldByName('FNACIM').AsString := LineaC.FNacim;
              DataActual.FieldByName('FAPERT').AsString := LineaC.FApert;
              DataActual.FieldByName('FVENCI').AsString := LineaC.FVenci;
              DataActual.FieldByName('VCUOTA').AsString := LineaC.VCuota;
              DataActual.FieldByName('NOVEDA').AsString := LineaC.Noveda;
              DataActual.FieldByName('ADJETI').AsString := LineaC.Adjeti;
              DataActual.FieldByName('TPIDEN').AsString := LineaC.TpIden;
              DataActual.FieldByName('VALINI').AsString := LineaC.ValIni;
              DataActual.FieldByName('VALDEU').AsString := LineaC.ValDeu;
              DataActual.FieldByName('VALMOR').AsString := LineaC.ValMor;
              DataActual.FieldByName('VALDIS').AsString := LineaC.ValDis;
              DataActual.FieldByName('TPMONE').AsString := LineaC.TpMone;
              DataActual.FieldByName('TPOBLI').AsString := LineaC.TpObli;
              DataActual.FieldByName('TPGARA').AsString := LineaC.TpGara;
              DataActual.FieldByName('CALIFI').AsString := LineaC.Califi;
              DataActual.FieldByName('CRESID').AsString := LineaC.CResid;
              DataActual.FieldByName('DRESID').AsString := LineaC.DResid;
              DataActual.FieldByName('TRESID').AsString := LineaC.TResid;
              DataActual.FieldByName('CLABOR').AsString := LineaC.CLabor;
              DataActual.FieldByName('TLABOR').AsString := LineaC.TLabor;
              DataActual.FieldByName('CCORRE').AsString := LineaC.CCorre;
              DataActual.FieldByName('DCORRE').AsString := LineaC.DCorre;
              DataActual.FieldByName('CIIU').AsString := LineaC.Ciiu;
              DataActual.FieldByName('TCUOTA').AsString := LineaC.TCuota;
              DataActual.FieldByName('CCANCE').AsString := LineaC.CCance;
              DataActual.FieldByName('CEMORA').AsString := LineaC.CeMora;
              DataActual.FieldByName('FUPAGO').AsString := LineaC.FUPago;
              DataActual.FieldByName('OFICIN').AsString := LineaC.Oficin;
              DataActual.FieldByName('CRADIC').AsString := LineaC.CRadic;
              DataActual.FieldByName('FOPAGO').AsString := LineaC.FoPago;
              DataActual.FieldByName('PEPAGO').AsString := LineaC.PePago;
              DataActual.FieldByName('EDMORA').AsString := LineaC.EdMora;
              DataActual.FieldByName('FACTUA').AsString := LineaC.FActua;
              DataActual.FieldByName('RECLAM').AsString := LineaC.Reclam;
              DataActual.FieldByName('RESPON').AsString := LineaC.Respon;
              DataActual.FieldByName('ESTRAC').AsString := LineaC.Estrac;
              DataActual.FieldByName('RELLEN').AsString := LineaC.Rellen;
              DataActual.FieldByName('LINEA').AsString := LineaC.Linea;
              DataActual.FieldByName('FECHA_DESEMBOLSO').AsString := LineaC.FDes;
              DataActual.FieldByName('FECHA_VENCIMIENTO').AsString := LineaC.FVen;
              DataActual.FieldByName('IDIDENT').AsString := LineaC.TpIdCi;
              DataActual.Post;
              DataActual.Close;

              PlanoReporte.Add(LineaC.Numero + LineaC.Identificacion + LineaC.Nombre +
                       LineaC.FNacim + LineaC.FApert + LineaC.FVenci + LineaC.VCuota +
                       LineaC.Noveda + LineaC.Adjeti + LineaC.TpIden + LineaC.ValIni +
                       LineaC.ValDeu + LineaC.ValMor + LineaC.ValDis + LineaC.TpMone +
                       LineaC.TpObli + LineaC.TpGara + LineaC.Califi + LineaC.CResid +
                       LineaC.DResid + LineaC.TResid + LineaC.CLabor + LineaC.TLabor +
                       LineaC.CCorre + LineaC.DCorre + LineaC.Ciiu + LineaC.TCuota +
                       LineaC.CCance + LineaC.CeMora + LineaC.FUPago + LineaC.Oficin +
                       LineaC.CRadic + LineaC.FoPago + LineaC.PePago + LineaC.EdMora +
                       LineaC.FActua + LineaC.Reclam + LineaC.Respon + LineaC.Estrac + LineaC.Rellen);

              SumaRegistros := SumaRegistros + 1;
              IBSCodeudores.Next;
             end; // fin de While Codeudores
            IBSCodeudores.Close;
            // Fin proceso Codeudores
            Next;
//             end; // fin with IBSClientes
           end; // fin de while
           Close;
        end; //fin de with principal

//        PlanoReporte.SaveToFile('c:/Datacredito/Datacredito' + '2Paso' + '.TXT');
        CheckBox2.Checked := True;
        Application.ProcessMessages;
end;

procedure TfrmProcesarDatos.CmdProcesarClick(Sender: TObject);
begin
        CmdProcesar.Enabled := False;
        EdFechaCorteexit(Sender);
        with IBSClientes do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from "col$controlreportedata" where FECHA_CORTE =:FECHA_CORTE and DATACREDITO = 1');
         ParamByName('FECHA_CORTE').AsString := MidStr(MesCorteAct,1,6);
         ExecQuery;
         if RecordCount > 0 then begin
           MessageDlg('El Reporte DATACREDITO para esta Fecha' +  #13 + 'Ya fue Generado',mtError,[mbok],0);
           Exit;
         end;
         Close;
        end;

        Encabezado;
        ColActivas;
        Colcastigadas;
        ColSaldadas;
        InsertarTabla;
        RegistroFin;

        with IBSClientes do begin
         if Transaction.InTransaction then
           Transaction.Commit;
         Transaction.StartTransaction;
         Close;
         SQL.Clear;
         SQL.Add('insert into "col$controlreportedata" (FECHA_CORTE,FECHA_PROCESO,ID_EMPLEADO,PROCESADO,DATACREDITO,CIFIN) VALUES(:FECHA_CORTE,:FECHA_PROCESO,:ID_EMPLEADO,:PROCESADO,1,0)');
         ParamByName('FECHA_CORTE').AsString := MidStr(MesCorteAct,1,6);
         ParamByName('FECHA_PROCESO').AsDate := fFechaActual;
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ParamByName('PROCESADO').AsInteger := 1;
         ExecQuery;
         Close;
         IBSClientes.Transaction.Commit;
        end;             

        CmdGenerar.Enabled := True;
end;

procedure TfrmProcesarDatos.FormShow(Sender: TObject);
var
    Dia:Word;
    Mes:Word;
    Ano:Word;
begin
        PlanoReporte := TStringList.Create;
//        PlanoErrores := TStringList.Create;
        PlanoReporte.Clear;
//        PlanoErrores.Clear;
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        dmColocacion.IBDSagencias.Active := True;


        Ano := YearOf(Date);
        Mes := MonthOf(Date);
        Dia := DayOf(Date);

        Mes := Mes - 1;
        if Mes < 1 then
        begin
          Mes := 12;
          Ano := Ano -1;
        end;

        EdFechaCorte.Date := EncodeDate(Ano,Mes,Dia);

        EdFechaCorte.Date := RecodeDay(EdFechaCorte.Date,Dayof(EndOfAMonth(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date))));
        Dia := Dayof(EdFechaCorte.Date);
        if Dia > 30 then Dia := 30;
        EdFechaCorte.Date := RecodeDay(EdFechaCorte.Date,Dia);
        MesCorteAct := IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('00',DayOf(EdFechaCorte.Date));


{        EdFechaCorte.Date := RecodeDay(Date,Dayof(EndOfAMonth(YearOf(Date),MonthOf(Date))));
        Mes := MonthOf(EdFechaCorte.Date);
        Ano := YearOf(EdFechaCorte.Date);
        MesAct := FormatCurr('00',Mes);
        AnoAct := FormatCurr('0000',Ano);
        Mes := Mes - 1;
        if Mes = 0 then begin
          Mes  := 12;
          AnoAnt := FormatCurr('0000',Ano - 1);
        end
        else
          AnoAnt := FormatCurr('0000',Ano);
        MesAnt := FormatCurr('00',Mes);
        MesCorteAnt := AnoAnt + MesAnt;
        MesCorteAct := IntToStr(YearOf(edFechaCorte.Date)) + MesAct;     }
end;

function TfrmProcesarDatos.Novedad(IdAgencia: Integer;
  IdColocacion: string;Dias:Integer): Integer;
var
Mora:Integer;
Novedad:integer;
Saldo:Currency;
Estado:Integer;
Edad:string;
begin
        if (Dias < 30) then Novedad := 1 //'01'
        else if (Dias >= 30) and (Dias < 60) then Novedad := 6 //'06'
        else if (Dias >= 60) and (Dias < 90) then Novedad := 7 //'07'
        else if (Dias >= 90) and (Dias < 120) then Novedad := 8 //'08'
        else if (Dias >= 120) and (Dias < 180) then Novedad := 9 //'09'
        else if (Dias >= 180) then Novedad := 12; //'12';

        with IBSCuotas do begin
         Close;
         SQL.Clear;
         SQL.Add('select "col$causaciondiaria".DEUDA, "col$causaciondiaria".ID_EDAD_ACT, "col$causaciondiaria".ID_ESTADO');
         SQL.Add('from "col$causaciondiaria"');
         SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
         SQL.Add('ID_COLOCACION = :ID_COLOCACION and');
         SQL.Add('FECHA_CORTE = :FECHA_CORTE');
         ParamByName('ID_AGENCIA').AsInteger := IDAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
         ExecQuery;
         Saldo := FieldByName('DEUDA').AsCurrency;
         Edad := FieldByName('ID_EDAD_ACT').AsString;
         Estado := FieldByName('ID_ESTADO').AsInteger;

         if (Estado = 2) then Novedad := 12;//'05'
         
        end;

        Result := Novedad;
end;

function TfrmProcesarDatos.Adjetivo(IdAgencia: Integer;
  IdColocacion: string): string;
var
Estado:Integer;
Castigado,Fallecido:Integer;
begin
        with IBSCuotas do begin
         Close;
         SQL.Clear;
         SQL.Add('select ID_ESTADO_COLOCACION from "col$estado"');
         SQL.Add('where');
         SQL.Add('ES_FALLECIDO = 1');
         ExecQuery;
         Fallecido := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;

         SQL.Clear;
         SQL.Add('select ID_ESTADO_COLOCACION from "col$colocacion"');
         SQL.Add('where ');
         SQL.Add('ID_AGENCIA =:"ID_AGENCIA" and');
         SQL.Add('ID_COLOCACION =:"ID_COLOCACION"');
         ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
         ParamByName('ID_COLOCACION').AsString := IdColocacion;
         ExecQuery;
         Estado := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
         Close;
        end;

        if (Estado = Fallecido) then Result := '16'
        else Result := '00';

end;

procedure TfrmProcesarDatos.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmProcesarDatos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmProcesarDatos.CmdGenerarClick(Sender: TObject);
begin
        PlanoReporte.SaveToFile('c:/Datacredito' + MesCorteAct + '.TXT');
     //   PlanoErrores.SaveToFile('c:/ErroresDatacredito' + MesCorteAct + '.TXT');
        CmdVer.Enabled := True;
end;

procedure TfrmProcesarDatos.CmdVerClick(Sender: TObject);
var frmMuestroArchivoData : TfrmMuestroArchivoData;
begin
        frmMuestroArchivoData := TfrmMuestroArchivoData.Create(Self);
        frmMuestroArchivoData.FechaCorte := MesCorteAct;
        frmMuestroArchivoData.ShowModal;
end;

procedure TfrmProcesarDatos.RegistroFin;
var cadena:string;
    LineaC:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Identificador
      cadena := 'ZZZZZZZZZZZZZZZZZZ';
      LineaC := cadena;
// Fecha Proceso
      cadena := Format('%.2d',[dayof(Date)])+Format('%.2d',[monthOf(Date)])+Format('%.4d',[YearOf(Date)]);
      LineaC := LineaC + cadena;
// Numero de Regitros
      cadena := StringReplace(Format('%8d',[SumaRegistros + 2]),' ','0',[rfReplaceAll]);
      LineaC := LineaC + cadena;
// Sumatoria Novedades
      cadena := StringReplace(Format('%8d',[SumaNovedad]),' ','0',[rfReplaceAll]);
      LineaC := LineaC + cadena;
// Relleno
      cadena := '';
      i1 := 1;
      i2 := 318;
      for J := i1 to i2 do
          cadena := cadena + '0';
      LineaC := LineaC + cadena;
      PlanoReporte.Add(LineaC);
      CheckBox5.Checked := True;
      CmdGenerar.Enabled := True;
end;

procedure TfrmProcesarDatos.EdFechaCorteExit(Sender: TObject);
begin
        Mes := MonthOf(EdFechaCorte.Date);
        Ano := YearOf(EdFechaCorte.Date);
        MesAct := FormatCurr('00',Mes);
        AnoAct := FormatCurr('0000',Ano);
        Mes := Mes - 1;
        if Mes = 0 then begin
          Mes  := 12;
          AnoAnt := FormatCurr('0000',Ano - 1);
        end
        else
          AnoAnt := FormatCurr('0000',Ano);
        MesAnt := FormatCurr('00',Mes);
        MesCorteAnt := AnoAnt + MesAnt;
        MesCorteAct := IntToStr(YearOf(edFechaCorte.Date)) + MesAct;
end;

procedure TfrmProcesarDatos.ColCastigadas;
begin
        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select ');
           SQL.Add('"col$colocacion".ID_AGENCIA,');
           SQL.Add('"col$colocacion".ID_COLOCACION,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
           SQL.Add('"col$colocacion".ID_PERSONA,');
           SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
           SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
           SQL.Add('"col$colocacion".VALOR_CUOTA,');
           SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
           SQL.Add('"col$colocacion".FECHA_INTERES,');
           SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
           SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
           SQL.Add('"col$colocacion".ID_EVALUACION,');
           SQL.Add('"col$colocacion".ID_GARANTIA,');
           SQL.Add('"col$colocacion".ID_CLASIFICACION,');
           SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
           SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - ABONOS_CAPITAL) AS SALDO,');
           SQL.Add('"col$tiposcuota".INTERES');
           SQL.Add('from "col$colocacion"');
           SQL.Add('left join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
           SQL.Add('where');
           SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION = 3');
           SQL.Add('and ("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) > 0');
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           while not eof do begin
             Application.ProcessMessages;
             // Proceso informacion Clientes
             ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
             ConverColocacion := StrToInt64(ColocacionNew);
             ColocacionNew := Format('%.18d',[ConverColocacion]);       //'000000000000000000';
             ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);
             NovedadLocal := 0;

             LineaC.Numero := ColocacionNew;
             LineaC.Identificacion := StringReplace(Format('%11s',[trim(IBQuery1.FieldByName('ID_PERSONA').AsString)]),' ','0',[rfReplaceAll]);
             with IBPersona do begin
               Application.ProcessMessages;
               IBPersona.Close;
               SQL.Clear;
               SQL.Add('select "gen$persona".PRIMER_APELLIDO,');
               SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
               SQL.Add('"gen$persona".NOMBRE, "gen$persona".FECHA_NACIMIENTO,');
               SQL.Add('"gen$direccion".ID_DIRECCION,');
               SQL.Add('"gen$direccion".DIRECCION,');
               SQL.Add('"gen$direccion".MUNICIPIO,');
               SQL.Add('"gen$direccion".TELEFONO1');
               SQL.Add('from "gen$persona"');
               SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and "gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA)');
               SQL.Add('where');
               SQL.Add('"gen$persona".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and');
               SQL.Add('"gen$persona".ID_PERSONA = :"ID_PERSONA"');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
               ExecQuery;
               Nombre := Trim(IBPersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                      IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                      IBPersona.FieldByName('NOMBRE').AsString);

               if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
                begin
                  NombreC := Format('%-29s',[LeftStr(IBPersona.FieldByName('NOMBRE').AsString,29)]);
                  Apel1C := Format('%-15s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString,15)]);
                  Apel2C := Format('%-14s',[LeftStr(IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
                  LineaC.NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
                end
               else
                begin
                  NombreC := Format('%-60s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString +
                  IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString +
                  IBPersona.FieldByName('NOMBRE').AsString,60)]);
                  LineaC.NombreC := NombreC;
                end;

               FechaNacimiento := IBPersona.FieldByName('FECHA_NACIMIENTO').AsString;
            end;

            NombreC := '';

             LineaC.Nombre := Format('%-45s',[nombre]);
             Nombre := '';
             LineaC.FNacim := '000000';
             LineaC.FApert := Format('%.4d',[YearOf(IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)])+Format('%.2d',[monthOf(IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)]);
             LineaC.FVenci := Format('%.4d',[YearOf(IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime)])+Format('%.2d',[monthOf(IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime)]);
             LineaC.VCuota := Formatcurr('0000000000',IBQuery1.FieldByName('VALOR_CUOTA').ASCurrency);
             Fecha := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
             if IBQuery1.FieldByName('INTERES').AsString = 'V' then
                Fecha := CalculoFecha(Fecha,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
             Fecha := IncDay(Fecha);
             DiasMora := DiasEntre(Fecha,EdFechaCorte.Date);
             NovedadLocal := 13; //Novedad(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,DiasMora);
             SumaNovedad := SumaNovedad + NovedadLocal;
             LineaC.Noveda := StringReplace(Format('%2s',[IntToStr(Novedadlocal)]),' ','0',[rfReplaceAll]);
             LineaC.Adjeti := adjetivo(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString);
             case IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger of
               3 : LineaC.TpIden := '1';
               4 : LineaC.TpIden := '2';
               6 : LineaC.TpIden := '3';
               7 : LineaC.TpIden := '4';
               9 : LineaC.TpIden := '5';
               0 : LineaC.TpIden := '1';
             end;
            LineaC.ValIni := FormatCurr('0000000000',IBQuery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency);
            LineaC.ValDeu := FormatCurr('0000000000',IBQuery1.FieldByName('SALDO').AsCurrency);
            if (IBQuery1.FieldByName('ID_EVALUACION').AsString = 'A') or (IBQuery1.FieldByName('ID_EVALUACION').AsString = 'B') then
              LineaC.ValMor := FormatCurr('0000000000',ObtenerDeudafecha(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,EdFechaCorte.Date,IBSCodeudores).Valor)
            else
              LineaC.ValMor := FormatCurr('0000000000',IBQuery1.FieldByName('SALDO').AsCurrency);
            LineaC.ValDis := '0000000000';
            LineaC.TpMone := '1';
            LineaC.TpObli := IntToStr(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger);
            LineaC.TpGara := IntToStr(IBQuery1.FieldByName('ID_GARANTIA').AsInteger);
            LineaC.Califi := IBQuery1.FieldByName('ID_EVALUACION').AsString;
            LineaC.CResid := Format('%15s',[leftstr(trim(IBPersona.FieldByName('MUNICIPIO').AsString),15)]);
            LineaC.DResid := Format('%30s',[leftstr(trim(IBPersona.FieldByName('DIRECCION').AsString),30)]);
            LineaC.TResid := StringReplace(Format('%10s',[leftstr(trim(IBPersona.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
            LineaC.CLabor := Format('%15s',[LeftStr(trim(IBPersona.FieldByName('MUNICIPIO').AsString),15)]);
            LineaC.TLabor := StringReplace(Format('%10s',[LeftStr(trim(IBPersona.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
            LineaC.CCorre := Format('%15s',[leftstr(trim(IBPersona.FieldByName('MUNICIPIO').AsString),15)]);
            LineaC.DCorre := Format('%30s',[leftstr(trim(IBPersona.FieldByName('DIRECCION').AsString),30)]);
            IBPersona.Close;
            LineaC.Ciiu := '000000';
            with IBSCuotas do
             begin
               Application.ProcessMessages;
               SQL.Clear;
               SQL.Add('select count(CUOTA_NUMERO) as CUOTAS from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION"');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ExecQuery;
               try
                 LineaC.TCuota := Format('%.3d',[FieldByName('CUOTAS').AsInteger]);
                 Close;
               except
                 raise;
               end;
             end;
            with IBSCuotas do
             begin
               Application.ProcessMessages;
               SQL.Clear;
               SQL.Add('select count(CUOTA_NUMERO) as CUOTASPAG from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
               SQL.Add('PAGADA = 1 and FECHA_A_PAGAR <= :"FECHA_CORTE"');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
               ExecQuery;
               try
                 LineaC.CCance := Format('%.3d',[FieldByName('CUOTASPAG').AsInteger]);
                 Close;
               except
                 raise;
               end;
             end;
            with IBSCuotas do
             begin
               Application.ProcessMessages;
               SQL.Clear;
               SQL.Add('select count(CUOTA_NUMERO) as CUOTASMORA from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
               SQL.Add('FECHA_A_PAGAR <= :"FECHA_CORTE" and');
               SQL.Add('PAGADA = 0');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
               ExecQuery;
               try
                 LineaC.CeMora := Format('%.3d',[FieldByName('CUOTASMORA').AsInteger]);
                 Close;
               except
                 raise;
               end;
             end;
            with IBQuery2 do
             begin
               Application.ProcessMessages;
               Close;
               SQL.Clear;
               SQL.Add('select FECHA_PAGADA from "col$tablaliquidacion"');
               SQL.Add('where ');
               SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
               SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
               SQL.Add('PAGADA = 1');
               ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
               ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
               Open;
               try
                 IBQuery2.First;
                 IBQuery2.Last;
                 if IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime <> 0 then
                    LineaC.FUPago := Format('%.4d',[YearOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)])+ Format('%.2d',[monthOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)]) + Format('%.2d',[DayOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)])
                 else
                    LineaC.FUPago := '00000000';
                 Close;
               except
                 ShowMessage(LineaC.FUPago);
                 raise;
               end;
             end;
            if Agencia = 1 then
             begin
               LineaC.Oficin := '          OCAÑA';
               LineaC.CRadic := '          OCAÑA';
             end
            else if Agencia = 2 then
             begin
              LineaC.Oficin := '         ABREGO';
              LineaC.CRadic := '         ABREGO';
             end
            else if Agencia = 3 then
             begin
              LineaC.Oficin := '     CONVENCION';
              LineaC.CRadic := '     CONVENCION';
             end;

            LineaC.FoPago := '0';
            case IBQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger of
              30 : LineaC.PePago := '1';
              60 : LineaC.PePago := '2';
              90 : LineaC.PePago := '3';
              180 : LineaC.PePago := '4';
              360 : LineaC.PePago := '5';
            end;
            if LineaC.PePago = '' then LineaC.PePago := '9';

            if (DiasMora < 30) then LineaC.EdMora := '001'
            else if (DiasMora >= 30) and (DiasMora < 60) then LineaC.EdMora := '030'
            else if (DiasMora >= 60) and (DiasMora < 90) then LineaC.EdMora := '060'
            else if (DiasMora >= 90) and (DiasMora < 120) then LineaC.EdMora := '090'
            else if (DiasMora >= 120) and (DiasMora < 150) then LineaC.EdMora := '120'
            else if (DiasMora >= 150) and (DiasMora < 180) then LineaC.EdMora := '150'
            else if (DiasMora >= 180) and (DiasMora < 210) then LineaC.EdMora := '180'
            else if (DiasMora >= 210) and (DiasMora < 240) then LineaC.EdMora := '210'
            else if (DiasMora >= 240) and (DiasMora < 270) then LineaC.EdMora := '240'
            else if (DiasMora >= 270) and (DiasMora < 300) then LineaC.EdMora := '270'
            else if (DiasMora >= 300) and (DiasMora < 330) then LineaC.EdMora := '300'
            else if (DiasMora >= 330) and (DiasMora < 360) then LineaC.EdMora := '330'
            else if (DiasMora > 360) then LineaC.EdMora := '360';
            LineaC.FActua := Format('%.4d',[YearOf(EdFechaCorte.Date)]) + Format('%.2d',[monthOf(EdFechaCorte.Date)]) + Format('%.2d',[DayOf(EdFechaCorte.Date)]);
            LineaC.Reclam := '0';
            LineaC.Respon := '00';
            LineaC.Estrac := '3';
            LineaC.Rellen := '              ';

            with IBSClientes do begin
              IBSClientes.Close;
              SQL.Clear;
              SQL.Add('select ID_IDENTIFICACION, ID_LINEA, FECHA_DESEMBOLSO, FECHA_VENCIMIENTO from "col$colocacion" where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION =:ID_COLOCACION');
              ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              ExecQuery;
            end;

            if IBSClientes.FieldByName('ID_LINEA').AsInteger = 1 then
               LineaC.Linea := '003'
            else if IBSClientes.FieldByName('ID_LINEA').AsInteger = 7 then
               LineaC.Linea := '014'
            else
               LineaC.Linea := '007';

            LineaC.FDes := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)])+ Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)]) + Format('%.2d',[dayOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)]);
            LineaC.FVen := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)])+ Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)]) + Format('%.2d',[dayOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)]);
            case IBSClientes.FieldByName('ID_IDENTIFICACION').AsInteger of
               3 : LineaC.TpIdCi := '01';
               4 : LineaC.TpIdCi := '02';
               6 : LineaC.TpIdCi := '03';
               2 : LineaC.TpIdCi := '04';
               8 : LineaC.TpIdCi := '05';
               7 : LineaC.TpIdCi := '07';
               1 : LineaC.TpIdCi := '01';
               0 : LineaC.TpIdCi := '01';
            end;





            PlanoReporte.Add(LineaC.Numero + LineaC.Identificacion + LineaC.Nombre +
                             LineaC.FNacim + LineaC.FApert + LineaC.FVenci + LineaC.VCuota +
                             LineaC.Noveda + LineaC.Adjeti + LineaC.TpIden + LineaC.ValIni +
                             LineaC.ValDeu + LineaC.ValMor + LineaC.ValDis + LineaC.TpMone +
                             LineaC.TpObli + LineaC.TpGara + LineaC.Califi + LineaC.CResid +
                             LineaC.DResid + LineaC.TResid + LineaC.CLabor + LineaC.TLabor +
                             LineaC.CCorre + LineaC.DCorre + LineaC.Ciiu + LineaC.TCuota +
                             LineaC.CCance + LineaC.CeMora + LineaC.FUPago + LineaC.Oficin +
                             LineaC.CRadic + LineaC.FoPago + LineaC.PePago + LineaC.EdMora +
                             LineaC.FActua + LineaC.Reclam + LineaC.Respon + LineaC.Estrac + LineaC.Rellen);

            DataActual.Open;
            DataActual.Insert;
            DataActual.FieldByName('NUMERO').AsString := LineaC.Numero;
            DataActual.FieldByName('IDENTIFICACION').AsString := LineaC.Identificacion;
            DataActual.FieldByName('NOMBRE').AsString := LineaC.Nombre;
            DataActual.FieldByName('NOMBREC').AsString := LineaC.NombreC;
            DataActual.FieldByName('FNACIM').AsString := LineaC.FNacim;
            DataActual.FieldByName('FAPERT').AsString := LineaC.FApert;
            DataActual.FieldByName('FVENCI').AsString := LineaC.FVenci;
            DataActual.FieldByName('VCUOTA').AsString := LineaC.VCuota;
            DataActual.FieldByName('NOVEDA').AsString := LineaC.Noveda;
            DataActual.FieldByName('ADJETI').AsString := LineaC.Adjeti;
            DataActual.FieldByName('TPIDEN').AsString := LineaC.TpIden;
            DataActual.FieldByName('VALINI').AsString := LineaC.ValIni;
            DataActual.FieldByName('VALDEU').AsString := LineaC.ValDeu;
            DataActual.FieldByName('VALMOR').AsString := LineaC.ValMor;
            DataActual.FieldByName('VALDIS').AsString := LineaC.ValDis;
            DataActual.FieldByName('TPMONE').AsString := LineaC.TpMone;
            DataActual.FieldByName('TPOBLI').AsString := LineaC.TpObli;
            DataActual.FieldByName('TPGARA').AsString := LineaC.TpGara;
            DataActual.FieldByName('CALIFI').AsString := LineaC.Califi;
            DataActual.FieldByName('CRESID').AsString := LineaC.CResid;
            DataActual.FieldByName('DRESID').AsString := LineaC.DResid;
            DataActual.FieldByName('TRESID').AsString := LineaC.TResid;
            DataActual.FieldByName('CLABOR').AsString := LineaC.CLabor;
            DataActual.FieldByName('TLABOR').AsString := LineaC.TLabor;
            DataActual.FieldByName('CCORRE').AsString := LineaC.CCorre;
            DataActual.FieldByName('DCORRE').AsString := LineaC.DCorre;
            DataActual.FieldByName('CIIU').AsString := LineaC.Ciiu;
            DataActual.FieldByName('TCUOTA').AsString := LineaC.TCuota;
            DataActual.FieldByName('CCANCE').AsString := LineaC.CCance;
            DataActual.FieldByName('CEMORA').AsString := LineaC.CeMora;
            DataActual.FieldByName('FUPAGO').AsString := LineaC.FUPago;
            DataActual.FieldByName('OFICIN').AsString := LineaC.Oficin;
            DataActual.FieldByName('CRADIC').AsString := LineaC.CRadic;
            DataActual.FieldByName('FOPAGO').AsString := LineaC.FoPago;
            DataActual.FieldByName('PEPAGO').AsString := LineaC.PePago;
            DataActual.FieldByName('EDMORA').AsString := LineaC.EdMora;
            DataActual.FieldByName('FACTUA').AsString := LineaC.FActua;
            DataActual.FieldByName('RECLAM').AsString := LineaC.Reclam;
            DataActual.FieldByName('RESPON').AsString := LineaC.Respon;
            DataActual.FieldByName('ESTRAC').AsString := LineaC.Estrac;
            DataActual.FieldByName('RELLEN').AsString := LineaC.Rellen;
            DataActual.FieldByName('LINEA').AsString := LineaC.Linea;
            DataActual.FieldByName('FECHA_DESEMBOLSO').AsString := LineaC.FDes;
            DataActual.FieldByName('FECHA_VENCIMIENTO').AsString := LineaC.FVen;
            DataActual.FieldByName('IDIDENT').AsString := LineaC.TpIdCi;
            DataActual.Post;
            DataActual.Close;

            SumaRegistros := SumaRegistros + 1;
            // fin de proceso clientes

            // Inicio proceso CODEUDORES
//             NoCod := 0;
             with IBSCodeudores do begin
              Close;
              SQL.Clear;
              SQL.Add('select ');
              SQL.Add('"col$colgarantias".ID_IDENTIFICACION,');
              SQL.Add('"col$colgarantias".ID_PERSONA,');
              SQL.Add('"col$colgarantias".CSC_GARANTIA,');
              SQL.Add('"gen$persona".PRIMER_APELLIDO,');
              SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
              SQL.Add('"gen$persona".NOMBRE,');
              SQL.Add('"gen$persona".FECHA_NACIMIENTO');
              SQL.Add('from "col$colgarantias"');
              SQL.Add('left join "gen$persona" on ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA)');
              SQL.Add('where');
              SQL.Add('"col$colgarantias".ID_AGENCIA = :"ID_AGENCIA" and');
              SQL.Add('"col$colgarantias".ID_COLOCACION = :"ID_COLOCACION"');
              ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
              ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
              ExecQuery;
            end;

            while not IBSCodeudores.Eof do
             begin
               Application.ProcessMessages;
               ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
               ConverColocacion := StrToInt64(ColocacionNew);
               ColocacionNew := Format('%.16d',[ConverColocacion]);
               ColocacionNew := ColocacionNew + 'C' + IntToStr(IBSCodeudores.FieldByName('CSC_GARANTIA').AsInteger);
               ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);
               NovedadLocal := 0;

               LineaC.Numero := ColocacionNew;
               LineaC.Identificacion := StringReplace(Format('%11s',[trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString)]),' ','0',[rfReplaceAll]);
//proceso verificacion codeudores
               if DataErrores.Locate('COLOCACION_ERRADO;IDENTIFICACION',VarArrayOf([LineaC.Numero,trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString)]),[locaseinsensitive]) then
                  LineaC.Numero := DataErrores.FieldValues['COLOCACION_CORRECTO'];
//fin
               Nombre := IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString + ' '
                         + IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString + ' '
                         + IBSCodeudores.FieldByName('NOMBRE').AsString;
               LineaC.Nombre := Format('%-45s',[trim(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString) + ' '
                       + trim(IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString) + ' '
                       + trim(IBSCodeudores.FieldByName('NOMBRE').AsString)]);
               Nombre := '';


               if (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
                begin
                  NombreC := Format('%-29s',[LeftStr(IBSCodeudores.FieldByName('NOMBRE').AsString,29)]);
                  Apel1C := Format('%-15s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString,15)]);
                  Apel2C := Format('%-14s',[LeftStr(IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
                  LineaC.NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
                end
               else
                begin
                  NombreC := Format('%-60s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString +
                  IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString +
                  IBSCodeudores.FieldByName('NOMBRE').AsString,60)]);
                  LineaC.NombreC := NombreC;
                end;


               if (IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsString = '') or (IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsString = '1899/12/30') Then
                LineaC.FNacim := '000000'
               else
                LineaC.FNacim := Format('%.4d',[YearOf(IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsDateTime)])+Format('%.2d',[monthOf(IBSCodeudores.FieldByName('FECHA_NACIMIENTO').AsDateTime)]);
               SumaNovedad := SumaNovedad + NovedadLocal;
               case IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger of
                 3 : LineaC.TpIden := '1';
                 4 : LineaC.TpIden := '2';
                 6 : LineaC.TpIden := '3';
                 7 : LineaC.TpIden := '4';
                 9 : LineaC.TpIden := '5';
                 0 : LineaC.TpIden := '1';
               end;

              with IBSCuotas do begin
               Application.ProcessMessages;
               IBSCuotas.Close;
               SQL.Clear;
               SQL.Add('select first 1');
               SQL.Add('"gen$direccion".ID_DIRECCION,');
               SQL.Add('"gen$direccion".DIRECCION,');
               SQL.Add('"gen$direccion".MUNICIPIO,');
               SQL.Add('"gen$direccion".TELEFONO1');
               SQL.Add('from "gen$direccion"');
               SQL.Add('where');
               SQL.Add('"gen$direccion".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and');
               SQL.Add('"gen$direccion".ID_PERSONA = :"ID_PERSONA"');
               ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
               ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
               ExecQuery;
               LineaC.CResid := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
               LineaC.DResid := Format('%30s',[leftstr(trim(ibscuotas.FieldByName('DIRECCION').AsString),30)]);
               LineaC.TResid := StringReplace(Format('%10s',[leftstr(trim(ibscuotas.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
               LineaC.CLabor := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
               LineaC.TLabor := StringReplace(Format('%10s',[leftstr(trim(ibscuotas.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
               LineaC.CCorre := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
               LineaC.DCorre := Format('%30s',[leftstr(trim(ibscuotas.FieldByName('DIRECCION').AsString),30)]);
               IBSCuotas.Close;
              end;

              LineaC.Respon := '01';

              with IBSClientes do begin
                IBSClientes.Close;
                SQL.Clear;
                SQL.Add('select ID_IDENTIFICACION, ID_LINEA, FECHA_DESEMBOLSO, FECHA_VENCIMIENTO from "col$colocacion" where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION =:ID_COLOCACION');
                ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                ExecQuery;
              end;

              if IBSClientes.FieldByName('ID_LINEA').AsInteger = 1 then
                 LineaC.Linea := '003'
              else if IBSClientes.FieldByName('ID_LINEA').AsInteger = 7 then
                 LineaC.Linea := '014'
              else
                 LineaC.Linea := '007';

              LineaC.FDes := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)])+ Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)]) + Format('%.2d',[dayOf(IBSClientes.FieldByName('FECHA_DESEMBOLSO').AsDate)]);
              LineaC.FVen := Format('%.4d',[YearOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)])+ Format('%.2d',[monthOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)]) + Format('%.2d',[dayOf(IBSClientes.FieldByName('FECHA_VENCIMIENTO').AsDate)]);
              case IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger of
                 3 : LineaC.TpIdCi := '01';
                 4 : LineaC.TpIdCi := '02';
                 6 : LineaC.TpIdCi := '03';
                 2 : LineaC.TpIdCi := '04';
                 8 : LineaC.TpIdCi := '05';
                 7 : LineaC.TpIdCi := '07';
                 1 : LineaC.TpIdCi := '09';
                 0 : LineaC.TpIdCi := '01';
              end;



              PlanoReporte.Add(LineaC.Numero + LineaC.Identificacion + LineaC.Nombre +
                               LineaC.FNacim + LineaC.FApert + LineaC.FVenci + LineaC.VCuota +
                               LineaC.Noveda + LineaC.Adjeti + LineaC.TpIden + LineaC.ValIni +
                               LineaC.ValDeu + LineaC.ValMor + LineaC.ValDis + LineaC.TpMone +
                               LineaC.TpObli + LineaC.TpGara + LineaC.Califi + LineaC.CResid +
                               LineaC.DResid + LineaC.TResid + LineaC.CLabor + LineaC.TLabor +
                               LineaC.CCorre + LineaC.DCorre + LineaC.Ciiu + LineaC.TCuota +
                               LineaC.CCance + LineaC.CeMora + LineaC.FUPago + LineaC.Oficin +
                               LineaC.CRadic + LineaC.FoPago + LineaC.PePago + LineaC.EdMora +
                               LineaC.FActua + LineaC.Reclam + LineaC.Respon + LineaC.Estrac + LineaC.Rellen);

              DataActual.Open;
              DataActual.Insert;
              DataActual.FieldByName('NUMERO').AsString := LineaC.Numero;
              DataActual.FieldByName('IDENTIFICACION').AsString := LineaC.Identificacion;
              DataActual.FieldByName('NOMBRE').AsString := LineaC.Nombre;
              DataActual.FieldByName('NOMBREC').AsString := LineaC.NombreC;
              DataActual.FieldByName('FNACIM').AsString := LineaC.FNacim;
              DataActual.FieldByName('FAPERT').AsString := LineaC.FApert;
              DataActual.FieldByName('FVENCI').AsString := LineaC.FVenci;
              DataActual.FieldByName('VCUOTA').AsString := LineaC.VCuota;
              DataActual.FieldByName('NOVEDA').AsString := LineaC.Noveda;
              DataActual.FieldByName('ADJETI').AsString := LineaC.Adjeti;
              DataActual.FieldByName('TPIDEN').AsString := LineaC.TpIden;
              DataActual.FieldByName('VALINI').AsString := LineaC.ValIni;
              DataActual.FieldByName('VALDEU').AsString := LineaC.ValDeu;
              DataActual.FieldByName('VALMOR').AsString := LineaC.ValMor;
              DataActual.FieldByName('VALDIS').AsString := LineaC.ValDis;
              DataActual.FieldByName('TPMONE').AsString := LineaC.TpMone;
              DataActual.FieldByName('TPOBLI').AsString := LineaC.TpObli;
              DataActual.FieldByName('TPGARA').AsString := LineaC.TpGara;
              DataActual.FieldByName('CALIFI').AsString := LineaC.Califi;
              DataActual.FieldByName('CRESID').AsString := LineaC.CResid;
              DataActual.FieldByName('DRESID').AsString := LineaC.DResid;
              DataActual.FieldByName('TRESID').AsString := LineaC.TResid;
              DataActual.FieldByName('CLABOR').AsString := LineaC.CLabor;
              DataActual.FieldByName('TLABOR').AsString := LineaC.TLabor;
              DataActual.FieldByName('CCORRE').AsString := LineaC.CCorre;
              DataActual.FieldByName('DCORRE').AsString := LineaC.DCorre;
              DataActual.FieldByName('CIIU').AsString := LineaC.Ciiu;
              DataActual.FieldByName('TCUOTA').AsString := LineaC.TCuota;
              DataActual.FieldByName('CCANCE').AsString := LineaC.CCance;
              DataActual.FieldByName('CEMORA').AsString := LineaC.CeMora;
              DataActual.FieldByName('FUPAGO').AsString := LineaC.FUPago;
              DataActual.FieldByName('OFICIN').AsString := LineaC.Oficin;
              DataActual.FieldByName('CRADIC').AsString := LineaC.CRadic;
              DataActual.FieldByName('FOPAGO').AsString := LineaC.FoPago;
              DataActual.FieldByName('PEPAGO').AsString := LineaC.PePago;
              DataActual.FieldByName('EDMORA').AsString := LineaC.EdMora;
              DataActual.FieldByName('FACTUA').AsString := LineaC.FActua;
              DataActual.FieldByName('RECLAM').AsString := LineaC.Reclam;
              DataActual.FieldByName('RESPON').AsString := LineaC.Respon;
              DataActual.FieldByName('ESTRAC').AsString := LineaC.Estrac;
              DataActual.FieldByName('RELLEN').AsString := LineaC.Rellen;
              DataActual.FieldByName('LINEA').AsString := LineaC.Linea;
              DataActual.FieldByName('FECHA_DESEMBOLSO').AsString := LineaC.FDes;
              DataActual.FieldByName('FECHA_VENCIMIENTO').AsString := LineaC.FVen;
              DataActual.FieldByName('IDIDENT').AsString := LineaC.TpIdCi;
              DataActual.Post;
              DataActual.Close;

              SumaRegistros := SumaRegistros + 1;
              IBSCodeudores.Next;
             end; // fin de While Codeudores
            // Fin proceso Codeudores
            Next;
           end; // fin de while
        end; //fin de with principal


//        PlanoReporte.SaveToFile('c:/Datacredito/Datacredito' + 'Castigados' + '.TXT');
//        PlanoErrores.SaveToFile('c:/Datacredito/ErroresDatacredito' + 'Castigados' + '.TXT');

        CheckBox3.Checked := True;
end;

procedure TfrmProcesarDatos.InsertarTabla;
var
S1,S2 :TStringList;
Colocacion,Documento:string;
i:Integer;
begin
        DataActual.Open;
        DataActual.Last;
        Bar.Min := 0;
        Bar.Max := DataActual.RecordCount;
        Bar.Position := 0;
        DataActual.First;
        while not DataActual.Eof do begin
          Bar.Position := DataActual.RecNo;
          Application.ProcessMessages;
          with IBSCodeudores do begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "col$ReporteData"');
            SQL.Add('values (:NUMERO,:IDENTIFICACION,:NOMBRE,:NOMBREC,:FNACIM,:FAPERT,:FVENCI,');
            SQL.Add(':VCUOTA,:NOVEDAD,:ADJETI,:TPIDEN,:VALINI,:VALDEU,:VALMOR,:VALDIS,:TPMONE,:TPOBLI,:TPGARA,:CALIFI,');
            SQL.Add(':CRESID,:DRESID,:TRESID,:CLABOR,:TLABOR,:CCORRE,:DCORRE,:CIIU,:TCUOTA,:CCANCE,:CEMORA,:FUPAGO,:OFICIN,');
            SQL.Add(':CRADIC,:FOPAGO,:PEPAGO,:EDMORA,:FACTUA,:RECLAM,:RESPON,:ESTRAC,:RELLEN,:FECHA_CORTE,:LINEA,:FECHA_DESEMBOLSO,:FECHA_VENCIMIENTO,:IDIDENT)');
            ParamByName('NUMERO').AsString := DataActual.FieldByName('NUMERO').AsString;
            ParamByName('IDENTIFICACION').AsString := DataActual.FieldByName('IDENTIFICACION').AsString;
            ParamByName('NOMBRE').AsString := DataActual.FieldByName('NOMBRE').AsString;
            ParamByName('NOMBREC').AsString := DataActual.FieldByName('NOMBREC').AsString;
            ParamByName('FNACIM').AsString := DataActual.FieldByName('FNACIM').AsString;
            ParamByName('FAPERT').AsString := DataActual.FieldByName('FAPERT').AsString;
            ParamByName('FVENCI').AsString := DataActual.FieldByName('FVENCI').AsString;
            ParamByName('VCUOTA').AsString := DataActual.FieldByName('VCUOTA').AsString;
            ParamByName('NOVEDAD').AsString := DataActual.FieldByName('NOVEDA').AsString;
            ParamByName('ADJETI').AsString := DataActual.FieldByName('ADJETI').AsString;
            ParamByName('TPIDEN').AsString := DataActual.FieldByName('TPIDEN').AsString;
            ParamByName('VALINI').AsString := DataActual.FieldByName('VALINI').AsString;
            ParamByName('VALDEU').AsString := DataActual.FieldByName('VALDEU').AsString;
            ParamByName('VALMOR').AsString := DataActual.FieldByName('VALMOR').AsString;
            ParamByName('VALDIS').AsString := DataActual.FieldByName('VALDIS').AsString;
            ParamByName('TPMONE').AsString := DataActual.FieldByName('TPMONE').AsString;
            ParamByName('TPOBLI').AsString := DataActual.FieldByName('TPOBLI').AsString;
            ParamByName('TPGARA').AsString := DataActual.FieldByName('TPGARA').AsString;
            ParamByName('CALIFI').AsString := DataActual.FieldByName('CALIFI').AsString;
            ParamByName('CRESID').AsString := DataActual.FieldByName('CRESID').AsString;
            ParamByName('DRESID').AsString := DataActual.FieldByName('DRESID').AsString;
            ParamByName('TRESID').AsString := DataActual.FieldByName('TRESID').AsString;
            ParamByName('CLABOR').AsString := DataActual.FieldByName('CLABOR').AsString;
            ParamByName('TLABOR').AsString := DataActual.FieldByName('TLABOR').AsString;
            ParamByName('CCORRE').AsString := DataActual.FieldByName('CCORRE').AsString;
            ParamByName('DCORRE').AsString := DataActual.FieldByName('DCORRE').AsString;
            ParamByName('CIIU').AsString := DataActual.FieldByName('CIIU').AsString;
            ParamByName('TCUOTA').AsString := DataActual.FieldByName('TCUOTA').AsString;
            ParamByName('CCANCE').AsString := DataActual.FieldByName('CCANCE').AsString;
            ParamByName('CEMORA').AsString := DataActual.FieldByName('CEMORA').AsString;
            ParamByName('FUPAGO').AsString := DataActual.FieldByName('FUPAGO').AsString;
            ParamByName('OFICIN').AsString := DataActual.FieldByName('OFICIN').AsString;
            ParamByName('CRADIC').AsString := DataActual.FieldByName('CRADIC').AsString;
            ParamByName('FOPAGO').AsString := DataActual.FieldByName('FOPAGO').AsString;
            ParamByName('PEPAGO').AsString := DataActual.FieldByName('PEPAGO').AsString;
            ParamByName('EDMORA').AsString := DataActual.FieldByName('EDMORA').AsString;
            ParamByName('FACTUA').AsString := DataActual.FieldByName('FACTUA').AsString;
            ParamByName('RECLAM').AsString := DataActual.FieldByName('RECLAM').AsString;
            ParamByName('RESPON').AsString := DataActual.FieldByName('RESPON').AsString;
            ParamByName('ESTRAC').AsString := DataActual.FieldByName('ESTRAC').AsString;
            ParamByName('RELLEN').AsString := '              ';//DataActual.FieldByName('RELLEN').AsString;
            ParamByName('FECHA_CORTE').AsString := MidStr(MesCorteAct,1,6);
            ParamByName('LINEA').AsString := DataActual.FieldByName('LINEA').AsString;
            ParamByName('FECHA_DESEMBOLSO').AsString := DataActual.FieldByName('FECHA_DESEMBOLSO').AsString;
            ParamByName('FECHA_VENCIMIENTO').AsString := DataActual.FieldByName('FECHA_VENCIMIENTO').AsString;
            ParamByName('IDIDENT').AsString := DataActual.FieldByName('IDIDENT').AsString;
            IBSCodeudores.ExecQuery;
            IBSCodeudores.Close;
          end;
          DataActual.Next;
        end;

        CheckBox6.Checked := True;
        IBSCodeudores.Transaction.Commit;
end;

procedure TfrmProcesarDatos.ColSaldadas;
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

    with IBQuery1 do begin
     Close;
     SQL.Clear;
     SQL.Add('select count(*) as CONTEO from "col$colocacion" where (extract(year from fecha_saldado) = :ANO and extract(month from FECHA_SALDADO) = :MES)');
     ParamByName('ANO').AsString := AnoAct;
     ParamByName('MES').AsString := MesAct;
     try
       Open;
       if RecordCount < 1 then begin
         MessageDlg('No existen Colocaciones Saldadas con esa fecha de corte',mtInformation,[mbok],0);
         Transaction.Rollback;
         Exit;
       end;
       Bar.Min := 0;
       Bar.Max := FieldByName('CONTEO').AsInteger;
       Bar.Position := 0;
       except
        Transaction.Rollback;
        raise;
        Exit;
       end;
//    end;

    with IBQuery1 do begin
     Close;
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colocacion".ID_AGENCIA,');
     SQL.Add('"col$colocacion".ID_COLOCACION,');
     SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
     SQL.Add('"col$colocacion".ID_PERSONA,');
     SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
     SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
     SQL.Add('"col$colocacion".VALOR_CUOTA,');
     SQL.Add('"col$colocacion".FECHA_INTERES,');
     SQL.Add('"col$colocacion".ID_TIPO_CUOTA,');
     SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
     SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');     
     SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
     SQL.Add('"col$colocacion".ABONOS_CAPITAL,');
     SQL.Add('"col$colocacion".ID_CLASIFICACION,');
     SQL.Add('"col$colocacion".ID_CATEGORIA,');
     SQL.Add('"col$colocacion".ID_GARANTIA,');
     SQL.Add('"col$tiposcuota".INTERES,');
     SQL.Add('"col$colocacion".ID_LINEA,');
     SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION');
     SQL.Add('from "col$colocacion"');
     SQL.Add('left join "gen$persona" on ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
     SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
     SQL.Add('where');
     SQL.Add('(extract(year from fecha_saldado) = :ano and extract(month from FECHA_SALDADO) = :MES) order by ID_COLOCACION ASC');
     ParamByName('ANO').AsString := AnoAct;
     ParamByName('MES').AsString := MesAct;
     try
       Open;
     except
       Transaction.Rollback;
       raise;
       Exit;
     end;
    end;

     while not eof do begin
      Bar.Position := RecNo;
      Application.ProcessMessages;

      ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
      ConverColocacion := StrToInt64(ColocacionNew);
      ColocacionNew := Format('%.18d',[ConverColocacion]);       //'000000000000000000';
      ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);
      NovedadLocal := 0;

      LineaC.Numero := ColocacionNew;
      LineaC.Identificacion := StringReplace(Format('%11s',[trim(Ibquery1.FieldByName('ID_PERSONA').AsString)]),' ','0',[rfReplaceAll]);
      with IBPersona do begin
       Application.ProcessMessages;
       Close;
       SQL.Clear;
       SQL.Add('select "gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO,');
       SQL.Add('"gen$persona".NOMBRE, "gen$persona".FECHA_NACIMIENTO,');
       SQL.Add('"gen$direccion".ID_DIRECCION, "gen$direccion".DIRECCION,');
       SQL.Add('"gen$direccion".MUNICIPIO, "gen$direccion".TELEFONO1');
       SQL.Add('from "gen$persona"');
       SQL.Add('left join "gen$direccion" on ("gen$persona".ID_IDENTIFICACION = "gen$direccion".ID_IDENTIFICACION and "gen$persona".ID_PERSONA = "gen$direccion".ID_PERSONA)');
       SQL.Add('where "gen$persona".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and');
       SQL.Add('"gen$persona".ID_PERSONA = :"ID_PERSONA"');
       ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
       ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
       ExecQuery;
       Nombre := Trim(IBPersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                 IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                 IBPersona.FieldByName('NOMBRE').AsString);

       if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
        begin
          NombreC := Format('%-29s',[LeftStr(IBPersona.FieldByName('NOMBRE').AsString,29)]);
          Apel1C := Format('%-15s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString,15)]);
          Apel2C := Format('%-14s',[LeftStr(IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
          LineaC.NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
        end
       else
        begin
          NombreC := Format('%-60s',[LeftStr(IBPersona.FieldByName('PRIMER_APELLIDO').AsString +
                     IBPersona.FieldByName('SEGUNDO_APELLIDO').AsString +
                     IBPersona.FieldByName('NOMBRE').AsString,60)]);
          LineaC.NombreC := NombreC;
        end;

       NombreC := '';
       FechaNacimiento := IBPersona.FieldByName('FECHA_NACIMIENTO').AsString;
       Close;
      end;

      LineaC.Nombre := Format('%-45s',[LeftStr(Nombre,45)]);
      Nombre := '';
      LineaC.FNacim := '000000';
      LineaC.FApert := Format('%.4d',[YearOf(IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)])+Format('%.2d',[monthOf(IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)]);
      LineaC.FVenci := Format('%.4d',[YearOf(IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime)])+Format('%.2d',[monthOf(IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime)]);
      LineaC.VCuota := Formatcurr('0000000000',IBQuery1.FieldByName('VALOR_CUOTA').ASCurrency);
      Fecha := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
      if IBQuery1.FieldByName('INTERES').AsString = 'V' then
        Fecha := CalculoFecha(Fecha,IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger);
      Fecha := IncDay(Fecha);
      DiasMora := 0; //ObtenerDeudaFecha(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,EdFechaCorte.Date,IBSCodeudores).Dias;
      if FieldByName('ID_ESTADO_COLOCACION').AsInteger = 6 THEN
        NovedadLocal := 14
      else
        NovedadLocal := 5;
      SumaNovedad := SumaNovedad + NovedadLocal;
      LineaC.Noveda := StringReplace(Format('%2s',[IntToStr(Novedadlocal)]),' ','0',[rfReplaceAll]);
      LineaC.Adjeti := adjetivo(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString);
      case IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger of
        3 : LineaC.TpIden := '1';
        4 : LineaC.TpIden := '2';
        6 : LineaC.TpIden := '3';
        7 : LineaC.TpIden := '4';
        9 : LineaC.TpIden := '5';
        0 : LineaC.TpIden := '1';
      end;
      LineaC.ValIni := FormatCurr('0000000000',ibquery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency);
      LineaC.ValDeu := '0000000000'; //FormatCurr('0000000000',(ibquery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency - IBQuery1.FieldByName('ABONOS_CAPITAL').AsCurrency));
//      if (IBQuery1.FieldByName('ID_CATEGORIA').AsString = 'A') or (IBQuery1.FieldByName('ID_CATEGORIA').AsString = 'B') then
//        LineaC.ValMor := FormatCurr('0000000000',ObtenerDeudaFecha(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,EdFechaCorte.Date,IBSCodeudores).Valor)
//      else
      LineaC.ValMor := '0000000000'; //FormatCurr('0000000000',(IBQuery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency - IBQuery1.FieldByName('ABONOS_CAPITAL').AsCurrency));
      LineaC.ValDis := '0000000000';
      LineaC.TpMone := '1';
      LineaC.TpObli := IntToStr(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger);
      LineaC.TpGara := IntToStr(IBQuery1.FieldByName('ID_GARANTIA').AsInteger);
      LineaC.Califi := IBQuery1.FieldByName('ID_CATEGORIA').AsString;
      LineaC.CResid := Format('%15s',[leftstr(trim(IBPersona.FieldByName('MUNICIPIO').AsString),15)]);
      LineaC.DResid := Format('%30s',[leftstr(Trim(IBPersona.FieldByName('DIRECCION').AsString),30)]);
      LineaC.TResid := StringReplace(Format('%10s',[leftstr(Trim(IBPersona.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
      LineaC.CLabor := Format('%15s',[LeftStr(trim(IBPersona.FieldByName('MUNICIPIO').AsString),15)]);
      LineaC.TLabor := StringReplace(Format('%10s',[LeftStr(trim(IBPersona.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
      LineaC.CCorre := Format('%15s',[leftstr(trim(IBPersona.FieldByName('MUNICIPIO').AsString),15)]);
      LineaC.DCorre := Format('%30s',[leftstr(trim(IBPersona.FieldByName('DIRECCION').AsString),30)]);
      LineaC.Ciiu := '000000';
      with IBSCuotas do begin
       Application.ProcessMessages;
       SQL.Clear;
       SQL.Add('select count(CUOTA_NUMERO) as CUOTAS from "col$tablaliquidacion"');
       SQL.Add('where ');
       SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
       SQL.Add('ID_COLOCACION = :"ID_COLOCACION"');
       ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
       ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
       ExecQuery;
       try
         LineaC.TCuota := Format('%.3d',[FieldByName('CUOTAS').AsInteger]);
         LineaC.CCance := Format('%.3d',[FieldByName('CUOTAS').AsInteger]);
         Close;
       except
         raise;
       end;
      end;

      LineaC.CeMora := '000';

      with IBQuery2 do begin
       Application.ProcessMessages;
       Close;
       SQL.Clear;
       SQL.Add('select FECHA_PAGADA from "col$tablaliquidacion"');
       SQL.Add('where ');
       SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and');
       SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and');
       SQL.Add('PAGADA = 1 and FECHA_PAGADA <= :FECHA_CORTE');
       ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
       ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
       ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
       Open;
       try
        IBQuery2.First;
        IBQuery2.Last;
        if IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime <> 0 then
          LineaC.FUPago := Format('%.4d',[YearOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)])+ Format('%.2d',[monthOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)]) + Format('%.2d',[DayOf(IBQuery2.FieldByName('FECHA_PAGADA').AsDateTime)])
        else
          LineaC.FUPago := '00000000';
       Close;
       except
          ShowMessage(LineaC.FUPago);
          raise;
       end;
      end;

      with IBQuery2 do begin
       SQL.Clear;
       SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA = :ID_AGENCIA');
       ParamByName('ID_AGENCIA').AsInteger := Agencia;
       Open;
       DescAgencia := LeftStr(Trim(FieldByName('DESCRIPCION_AGENCIA').AsString),15);
       Close;
      end;

      LineaC.Oficin := Format('%15s',[DescAgencia]);
      LineaC.CRadic := Format('%15s',[DescAgencia]);
      LineaC.FoPago := '0';
      case IBQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger of
        30 : LineaC.PePago := '1';
        60 : LineaC.PePago := '2';
        90 : LineaC.PePago := '3';
        180 : LineaC.PePago := '4';
        360 : LineaC.PePago := '5';
      end;

      if LineaC.PePago = '' then LineaC.PePago := '9';

      if (DiasMora < 30) then LineaC.EdMora := '001'
      else if (DiasMora >= 30) and (DiasMora < 60) then LineaC.EdMora := '030'
      else if (DiasMora >= 60) and (DiasMora < 90) then LineaC.EdMora := '060'
      else if (DiasMora >= 90) and (DiasMora < 120) then LineaC.EdMora := '090'
      else if (DiasMora >= 120) and (DiasMora < 150) then LineaC.EdMora := '120'
      else if (DiasMora >= 150) and (DiasMora < 180) then LineaC.EdMora := '150'
      else if (DiasMora >= 180) and (DiasMora < 210) then LineaC.EdMora := '180'
      else if (DiasMora >= 210) and (DiasMora < 240) then LineaC.EdMora := '210'
      else if (DiasMora >= 240) and (DiasMora < 270) then LineaC.EdMora := '240'
      else if (DiasMora >= 270) and (DiasMora < 300) then LineaC.EdMora := '270'
      else if (DiasMora >= 300) and (DiasMora < 330) then LineaC.EdMora := '300'
      else if (DiasMora >= 330) and (DiasMora < 360) then LineaC.EdMora := '330'
      else if (DiasMora > 360) then LineaC.EdMora := '360';
      LineaC.FActua := Format('%.4d',[YearOf(EdFechaCorte.Date)]) + Format('%.2d',[monthOf(EdFechaCorte.Date)]) + Format('%.2d',[DayOf(EdFechaCorte.Date)]);
      LineaC.Reclam := '0';
      LineaC.Respon := '00';
      LineaC.Estrac := '3';
      LineaC.Rellen := '              ';

      if IBQuery1.FieldByName('ID_LINEA').AsInteger = 1 then
        LineaC.Linea := '003'
      else if IBQuery1.FieldByName('ID_LINEA').AsInteger = 7 then
        LineaC.Linea := '014'
      else
        LineaC.Linea := '007';

      LineaC.FDes := Format('%.4d',[YearOf(IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)])+ Format('%.2d',[monthOf(IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)]) + Format('%.2d',[dayOf(IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)]);
      LineaC.FVen := Format('%.4d',[YearOf(IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime)])+ Format('%.2d',[monthOf(IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime)]) + Format('%.2d',[dayOf(IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime)]);
      case IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger of
        3 : LineaC.TpIdCi := '01';
        4 : LineaC.TpIdCi := '02';
        6 : LineaC.TpIdCi := '03';
        2 : LineaC.TpIdCi := '04';
        8 : LineaC.TpIdCi := '05';
        7 : LineaC.TpIdCi := '07';
        1 : LineaC.TpIdCi := '09';
        0 : LineaC.TpIdCi := '01';
      end;

     DataActual.Open;
     DataActual.Insert;
     DataActual.FieldByName('NUMERO').AsString := LineaC.Numero;
     DataActual.FieldByName('IDENTIFICACION').AsString := LineaC.Identificacion;
     DataActual.FieldByName('NOMBRE').AsString := LineaC.Nombre;
     DataActual.FieldByName('NOMBREC').AsString := LineaC.NombreC;
     DataActual.FieldByName('FNACIM').AsString := LineaC.FNacim;
     DataActual.FieldByName('FAPERT').AsString := LineaC.FApert;
     DataActual.FieldByName('FVENCI').AsString := LineaC.FVenci;
     DataActual.FieldByName('VCUOTA').AsString := LineaC.VCuota;
     DataActual.FieldByName('NOVEDA').AsString := LineaC.Noveda;
     DataActual.FieldByName('ADJETI').AsString := LineaC.Adjeti;
     DataActual.FieldByName('TPIDEN').AsString := LineaC.TpIden;
     DataActual.FieldByName('VALINI').AsString := LineaC.ValIni;
     DataActual.FieldByName('VALDEU').AsString := LineaC.ValDeu;
     DataActual.FieldByName('VALMOR').AsString := LineaC.ValMor;
     DataActual.FieldByName('VALDIS').AsString := LineaC.ValDis;
     DataActual.FieldByName('TPMONE').AsString := LineaC.TpMone;
     DataActual.FieldByName('TPOBLI').AsString := LineaC.TpObli;
     DataActual.FieldByName('TPGARA').AsString := LineaC.TpGara;
     DataActual.FieldByName('CALIFI').AsString := LineaC.Califi;
     DataActual.FieldByName('CRESID').AsString := LineaC.CResid;
     DataActual.FieldByName('DRESID').AsString := LineaC.DResid;
     DataActual.FieldByName('TRESID').AsString := LineaC.TResid;
     DataActual.FieldByName('CLABOR').AsString := LineaC.CLabor;
     DataActual.FieldByName('TLABOR').AsString := LineaC.TLabor;
     DataActual.FieldByName('CCORRE').AsString := LineaC.CCorre;
     DataActual.FieldByName('DCORRE').AsString := LineaC.DCorre;
     DataActual.FieldByName('CIIU').AsString := LineaC.Ciiu;
     DataActual.FieldByName('TCUOTA').AsString := LineaC.TCuota;
     DataActual.FieldByName('CCANCE').AsString := LineaC.CCance;
     DataActual.FieldByName('CEMORA').AsString := LineaC.CeMora;
     DataActual.FieldByName('FUPAGO').AsString := LineaC.FUPago;
     DataActual.FieldByName('OFICIN').AsString := LineaC.Oficin;
     DataActual.FieldByName('CRADIC').AsString := LineaC.CRadic;
     DataActual.FieldByName('FOPAGO').AsString := LineaC.FoPago;
     DataActual.FieldByName('PEPAGO').AsString := LineaC.PePago;
     DataActual.FieldByName('EDMORA').AsString := LineaC.EdMora;
     DataActual.FieldByName('FACTUA').AsString := LineaC.FActua;
     DataActual.FieldByName('RECLAM').AsString := LineaC.Reclam;
     DataActual.FieldByName('RESPON').AsString := LineaC.Respon;
     DataActual.FieldByName('ESTRAC').AsString := LineaC.Estrac;
     DataActual.FieldByName('RELLEN').AsString := LineaC.Rellen;
     DataActual.FieldByName('LINEA').AsString := LineaC.Linea;
     DataActual.FieldByName('FECHA_DESEMBOLSO').AsString := LineaC.FDes;
     DataActual.FieldByName('FECHA_VENCIMIENTO').AsString := LineaC.FVen;
     DataActual.FieldByName('IDIDENT').AsString := LineaC.TpIdCi;
     DataActual.Post;
     DataActual.Close;

     PlanoReporte.Add(LineaC.Numero + LineaC.Identificacion + LineaC.Nombre +
                       LineaC.FNacim + LineaC.FApert + LineaC.FVenci + LineaC.VCuota +
                       LineaC.Noveda + LineaC.Adjeti + LineaC.TpIden + LineaC.ValIni +
                       LineaC.ValDeu + LineaC.ValMor + LineaC.ValDis + LineaC.TpMone +
                       LineaC.TpObli + LineaC.TpGara + LineaC.Califi + LineaC.CResid +
                       LineaC.DResid + LineaC.TResid + LineaC.CLabor + LineaC.TLabor +
                       LineaC.CCorre + LineaC.DCorre + LineaC.Ciiu + LineaC.TCuota +
                       LineaC.CCance + LineaC.CeMora + LineaC.FUPago + LineaC.Oficin +
                       LineaC.CRadic + LineaC.FoPago + LineaC.PePago + LineaC.EdMora +
                       LineaC.FActua + LineaC.Reclam + LineaC.Respon + LineaC.Estrac + LineaC.Rellen);

     SumaRegistros := SumaRegistros + 1;
     // fin de proceso clientes

    // Inicio proceso CODEUDORES
    with IBSCodeudores do begin
     Close;
     SQL.Clear;
     SQL.Add('select ');
     SQL.Add('"col$colgarantias".ID_IDENTIFICACION,');
     SQL.Add('"col$colgarantias".ID_PERSONA,');
     SQL.Add('"col$colgarantias".CSC_GARANTIA,');
     SQL.Add('"gen$persona".PRIMER_APELLIDO,');
     SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
     SQL.Add('"gen$persona".NOMBRE,');
     SQL.Add('"gen$persona".FECHA_NACIMIENTO');
     SQL.Add('from "col$colgarantias"');
     SQL.Add('left join "gen$persona" on ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA)');
     SQL.Add('where');
     SQL.Add('"col$colgarantias".ID_AGENCIA = :"ID_AGENCIA" and');
     SQL.Add('"col$colgarantias".ID_COLOCACION = :"ID_COLOCACION"');
     ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
     ExecQuery;
    end;

    while not IBSCodeudores.Eof do begin
     Application.ProcessMessages;
     ColocacionNew := IntToStr(IBQuery1.FieldByName('ID_AGENCIA').AsInteger) + IBQuery1.FieldByName('ID_COLOCACION').AsString;
     ConverColocacion := StrToInt64(ColocacionNew);
     ColocacionNew := ColocacionNew + 'C' + IntToStr(IBSCodeudores.FieldByName('CSC_GARANTIA').AsInteger);
     ColocacionNew := stringreplace(Format('%18s',[colocacionnew]),' ','0',[rfReplaceAll]);

     LineaC.Numero := ColocacionNew;
     LineaC.Identificacion := StringReplace(Format('%11s',[trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString)]),' ','0',[rfReplaceAll]);

     if (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 2) or (IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger <> 7) then
      begin
        NombreC := Format('%-29s',[LeftStr(IBSCodeudores.FieldByName('NOMBRE').AsString,29)]);
        Apel1C := Format('%-15s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString,15)]);
        Apel2C := Format('%-14s',[LeftStr(IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString,14)]);
        LineaC.NombreC := Apel1C + ' ' + Apel2C + ' ' + NombreC;
      end
     else
      begin
        NombreC := Format('%-60s',[LeftStr(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString +
        IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString +
        IBSCodeudores.FieldByName('NOMBRE').AsString,60)]);
        LineaC.NombreC := NombreC;
      end;

     NombreC := '';

     Nombre := Trim(IBSCodeudores.FieldByName('PRIMER_APELLIDO').AsString + ' '
               + IBSCodeudores.FieldByName('SEGUNDO_APELLIDO').AsString + ' '
               + IBSCodeudores.FieldByName('NOMBRE').AsString);
     LineaC.Nombre := Format('%-45s',[LeftStr(Nombre,45)]);
     Nombre := '';
     LineaC.FNacim := '000000';
     SumaNovedad := SumaNovedad + NovedadLocal;
     case IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger of
      3 : LineaC.TpIden := '1';
      4 : LineaC.TpIden := '2';
      6 : LineaC.TpIden := '3';
      7 : LineaC.TpIden := '4';
      9 : LineaC.TpIden := '5';
      0 : LineaC.TpIden := '1';
     end;

     with IBSCuotas do begin
      Application.ProcessMessages;
      IBSCuotas.Close;
      SQL.Clear;
      SQL.Add('select first 1');
      SQL.Add('"gen$direccion".ID_DIRECCION,');
      SQL.Add('"gen$direccion".DIRECCION,');
      SQL.Add('"gen$direccion".MUNICIPIO,');
      SQL.Add('"gen$direccion".TELEFONO1');
      SQL.Add('from "gen$direccion"');
      SQL.Add('where');
      SQL.Add('"gen$direccion".ID_IDENTIFICACION = :"ID_IDENTIFICACION" and');
      SQL.Add('"gen$direccion".ID_PERSONA = :"ID_PERSONA"');
      ParamByName('ID_IDENTIFICACION').AsInteger := IBSCodeudores.FieldByName('ID_IDENTIFICACION').AsInteger;
      ParamByName('ID_PERSONA').AsString := Trim(IBSCodeudores.FieldByName('ID_PERSONA').AsString);
      ExecQuery;
      LineaC.CResid := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
      LineaC.DResid := Format('%30s',[leftstr(trim(ibscuotas.FieldByName('DIRECCION').AsString),30)]);
      LineaC.TResid := StringReplace(Format('%10s',[leftstr(trim(ibscuotas.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
      LineaC.CLabor := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
      LineaC.TLabor := StringReplace(Format('%10s',[leftstr(trim(ibscuotas.FieldByName('TELEFONO1').AsString),10)]),' ','0',[rfReplaceAll]);
      LineaC.CCorre := Format('%15s',[leftstr(trim(ibscuotas.FieldByName('MUNICIPIO').AsString),15)]);
      LineaC.DCorre := Format('%30s',[leftstr(trim(ibscuotas.FieldByName('DIRECCION').AsString),30)]);
      IBSCuotas.Close;
     end;

     LineaC.Respon := '01';

     DataActual.Open;
     DataActual.Insert;
     DataActual.FieldByName('NUMERO').AsString := LineaC.Numero;
     DataActual.FieldByName('IDENTIFICACION').AsString := LineaC.Identificacion;
     DataActual.FieldByName('NOMBRE').AsString := LineaC.Nombre;
     DataActual.FieldByName('NOMBREC').AsString := LineaC.NombreC;
     DataActual.FieldByName('FNACIM').AsString := LineaC.FNacim;
     DataActual.FieldByName('FAPERT').AsString := LineaC.FApert;
     DataActual.FieldByName('FVENCI').AsString := LineaC.FVenci;
     DataActual.FieldByName('VCUOTA').AsString := LineaC.VCuota;
     DataActual.FieldByName('NOVEDA').AsString := LineaC.Noveda;
     DataActual.FieldByName('ADJETI').AsString := LineaC.Adjeti;
     DataActual.FieldByName('TPIDEN').AsString := LineaC.TpIden;
     DataActual.FieldByName('VALINI').AsString := LineaC.ValIni;
     DataActual.FieldByName('VALDEU').AsString := LineaC.ValDeu;
     DataActual.FieldByName('VALMOR').AsString := LineaC.ValMor;
     DataActual.FieldByName('VALDIS').AsString := LineaC.ValDis;
     DataActual.FieldByName('TPMONE').AsString := LineaC.TpMone;
     DataActual.FieldByName('TPOBLI').AsString := LineaC.TpObli;
     DataActual.FieldByName('TPGARA').AsString := LineaC.TpGara;
     DataActual.FieldByName('CALIFI').AsString := LineaC.Califi;
     DataActual.FieldByName('CRESID').AsString := LineaC.CResid;
     DataActual.FieldByName('DRESID').AsString := LineaC.DResid;
     DataActual.FieldByName('TRESID').AsString := LineaC.TResid;
     DataActual.FieldByName('CLABOR').AsString := LineaC.CLabor;
     DataActual.FieldByName('TLABOR').AsString := LineaC.TLabor;
     DataActual.FieldByName('CCORRE').AsString := LineaC.CCorre;
     DataActual.FieldByName('DCORRE').AsString := LineaC.DCorre;
     DataActual.FieldByName('CIIU').AsString := LineaC.Ciiu;
     DataActual.FieldByName('TCUOTA').AsString := LineaC.TCuota;
     DataActual.FieldByName('CCANCE').AsString := LineaC.CCance;
     DataActual.FieldByName('CEMORA').AsString := LineaC.CeMora;
     DataActual.FieldByName('FUPAGO').AsString := LineaC.FUPago;
     DataActual.FieldByName('OFICIN').AsString := LineaC.Oficin;
     DataActual.FieldByName('CRADIC').AsString := LineaC.CRadic;
     DataActual.FieldByName('FOPAGO').AsString := LineaC.FoPago;
     DataActual.FieldByName('PEPAGO').AsString := LineaC.PePago;
     DataActual.FieldByName('EDMORA').AsString := LineaC.EdMora;
     DataActual.FieldByName('FACTUA').AsString := LineaC.FActua;
     DataActual.FieldByName('RECLAM').AsString := LineaC.Reclam;
     DataActual.FieldByName('RESPON').AsString := LineaC.Respon;
     DataActual.FieldByName('ESTRAC').AsString := LineaC.Estrac;
     DataActual.FieldByName('RELLEN').AsString := LineaC.Rellen;
     DataActual.FieldByName('LINEA').AsString := LineaC.Linea;
     DataActual.FieldByName('FECHA_DESEMBOLSO').AsString := LineaC.FDes;
     DataActual.FieldByName('FECHA_VENCIMIENTO').AsString := LineaC.FVen;
     DataActual.FieldByName('IDIDENT').AsString := LineaC.TpIdCi;
     DataActual.Post;
     DataActual.Close;

     PlanoReporte.Add(LineaC.Numero + LineaC.Identificacion + LineaC.Nombre +
                       LineaC.FNacim + LineaC.FApert + LineaC.FVenci + LineaC.VCuota +
                       LineaC.Noveda + LineaC.Adjeti + LineaC.TpIden + LineaC.ValIni +
                       LineaC.ValDeu + LineaC.ValMor + LineaC.ValDis + LineaC.TpMone +
                       LineaC.TpObli + LineaC.TpGara + LineaC.Califi + LineaC.CResid +
                       LineaC.DResid + LineaC.TResid + LineaC.CLabor + LineaC.TLabor +
                       LineaC.CCorre + LineaC.DCorre + LineaC.Ciiu + LineaC.TCuota +
                       LineaC.CCance + LineaC.CeMora + LineaC.FUPago + LineaC.Oficin +
                       LineaC.CRadic + LineaC.FoPago + LineaC.PePago + LineaC.EdMora +
                       LineaC.FActua + LineaC.Reclam + LineaC.Respon + LineaC.Estrac + LineaC.Rellen);

     SumaRegistros := SumaRegistros + 1;
     IBSCodeudores.Next;
    end; // fin de While Codeudores

     IBSCodeudores.Close;
     // Fin proceso Codeudores
     Next;

           end; // fin de while
           Close;
        end; //fin de with principal

//        PlanoReporte.SaveToFile('c:/Datacredito/Datacredito' + '2Paso' + '.TXT');
        CheckBox4.Checked := True;
        Application.ProcessMessages;

end;

end.
