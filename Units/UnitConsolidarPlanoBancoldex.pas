unit UnitConsolidarPlanoBancoldex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient,sdXmlDocuments, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, JvPanel, JvLabel, DBClient,
  FR_DSet, FR_DBSet, FR_Class,IBSQL, DateUtils, JvProgressBar,StrUtils,
  IBDatabase;
type
  Deuda = record
    Valor:Currency;
    Dias:Integer;
  end;
type
  TfrmConsolidarPlanoBancoldex = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DTfecha1: TDateTimePicker;
    IdTCPClient1: TIdTCPClient;
    SQLQuery1: TIBQuery;
    SQLQuery2: TIBQuery;
    IBDataSet1: TIBDataSet;
    IBDataSet1ID_ESTADO_COLOCACION: TSmallintField;
    IBDataSet1DESCRIPCION_ESTADO_COLOCACION: TIBStringField;
    IBDataSet1ES_PREJURIDICO: TSmallintField;
    IBDataSet1ES_JURIDICO: TSmallintField;
    IBDataSet1ES_CASTIGADO: TSmallintField;
    IBDataSet1ES_NOVISADO: TSmallintField;
    IBDataSet1ES_ANULADO: TSmallintField;
    IBDataSet1ES_CANCELADO: TSmallintField;
    IBDataSet1ES_VIGENTE: TSmallintField;
    IBDataSet1ES_SALDADO: TSmallintField;
    IBDataSet1COLOR: TSmallintField;
    IBDataSet1ES_FALLECIDO: TSmallintField;
    IBDataSet1ES_INCAPACITADO: TSmallintField;
    IBSQL1: TIBSQL;
    Panel2: TPanel;
    CmdDatacredito: TBitBtn;
    CmdCerrar: TBitBtn;
    BTimportar: TBitBtn;
    BTelimina: TBitBtn;
    IBQuery1: TIBQuery;
    IBSClientes: TIBSQL;
    GroupBox2: TGroupBox;
    BarD: TProgressBar;
    GroupBox3: TGroupBox;
    BarOcana: TJvProgressBar;
    BarAbrego: TJvProgressBar;
    BarConvencion: TJvProgressBar;
    GroupBox4: TGroupBox;
    ChOcana: TCheckBox;
    ChAbrego: TCheckBox;
    ChConvencion: TCheckBox;
    IBTransaction1: TIBTransaction;
    IBTransaction2: TIBTransaction;
    IBDatabase2: TIBDatabase;
    CmdEnviar: TBitBtn;
    IBQuery2: TIBQuery;
    IBDatabase1: TIBDatabase;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    BarAguachica: TJvProgressBar;
    ChAguachica: TCheckBox;
    Label2: TLabel;
    DTFecha2: TDateTimePicker;
    procedure BTimportarClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure BTeliminaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdDatacreditoClick(Sender: TObject);
    procedure CmdEnviarClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DTFecha2Exit(Sender: TObject);
  private
    XmlPet,XmlRes: TsdXmlDocument;
    Nodo,Nodo1:TXmlNode;
    Size:Integer;
    AStream:TMemoryStream;
    sentencia :string;
    host_server: string;
    puerto_server: Integer;
    procedure ExtraerRemoto(puerto: integer; Hostr,Desc_Agencia: string);
    procedure ExtraerLocal;
    procedure RealizarPlano;
    { Private declarations }
  public
  published
    procedure Imprimir_reporte(cadena:string);
    { Public declarations }
  end;

type TBancoldex = Record
     ObliBancoldex,
     Colocacion,
     TipoIdentificacion,
     NumeroIdentificacion,
     Nombre,
     TipoSociedad,
     Direccion,
     Ciudad,
     Ciiu,
     EmpAct,
     EmpGen,
     TotalActivos,
     FechaActivos,
     ValorCredito,
     Destino1,
     MontoDes1,
     Destino2,
     MontoDes2,
     Destino3,
     MontoDes3,
     FechaDesembolso,
     FechaVencimiento,
     ClaseCredito,
     PeriodoGracia,
     FormaAmortiza,
     MargenInter,
     TasaInteres,
     Saldo,
     ClaseGar1,
     ValorGar1,
     ClaseGar2,
     ValorGar2,
     ClaseGar3,
     ValorGar3,
     Genero,
     NitInter,
     Linea,
     Telefono,
     FechaNac,
     NEscolar,
     DestinoAECI:string;
end;


var
  frmConsolidarPlanoBancoldex: TfrmConsolidarPlanoBancoldex;
  PlanoBancoldex:TStringList;
  MesCorteAct:string;
  DAgencia:string;
  Dia:Integer;
implementation

uses UnitPantallaProgreso, UnitGlobalesCol, UnitGlobales, UnitdmGeneral,UnitImpresion,
  unitMain;

{$R *.dfm}

procedure TfrmConsolidarPlanoBancoldex.BTimportarClick(Sender: TObject);
begin
        with SQLQuery1 do
        begin
           if Transaction.InTransaction then
             Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$planobancoldex"');
           Open;
           if RecordCount <> 0 then
           begin
             MessageDlg('Existen Datos En la Tabla, Debe Eliminarlos Primero',mtInformation,[mbok],0);
             Exit;
           end;
        end;
        sentencia := 'SELECT distinct "col$infbancoldex".NO_BANCOLDEX, "col$infbancoldex".ID_COLOCACION,' +
        '"col$infbancoldex".ID_IDENTIFICACION, "col$infbancoldex".ID_PERSONA,' +
        '"gen$persona".NOMBRE, "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,' +
        '"gen$persona".ID_CIIU,"gen$persona".SEXO,"col$infbancoldex".TIPO_SOCIEDAD,' +
        '"col$infbancoldex".EMPLEOS_ACT, "col$infbancoldex".EMPLEOS_GENERAR,' +
        '"col$infbancoldex".TOTAL_ACTIVOS, "col$infbancoldex".FECHA_CORTE_ACTIVOS,' +
        '"col$infbancoldex".DESTINO1, "col$infbancoldex".MONTO1,' +
        '"col$infbancoldex".DESTINO2, "col$infbancoldex".MONTO2,' +
        '"col$infbancoldex".DESTINO3, "col$infbancoldex".MONTO3,' +
        '"col$infbancoldex".CLASE_CREDITO, "col$infbancoldex".AMORTIZACION,' +
        '"col$infbancoldex".MARGEN_INT, "col$infbancoldex".TASA_EA,' +
        '"col$infbancoldex".GARANTIA1, "col$infbancoldex".VALORGAR1,' +
        '"col$infbancoldex".GARANTIA2, "col$infbancoldex".VALORGAR2,' +
        '"col$infbancoldex".GARANTIA3, "col$infbancoldex".VALORGAR3,' +
        '"col$infbancoldex".LINEA_BANCOLDEX, "gen$direccion".TELEFONO1,' +
        '"gen$direccion".DIRECCION, "gen$municipioban".COD_MUNICIPIO_BAN,' +
        '("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) as DEUDA,"col$colocacion".VALOR_DESEMBOLSO,' +
        '"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".FECHA_VENCIMIENTO,' +
        '"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".ID_CATEGORIA,' +
        '"col$colocacion".ID_TIPO_CUOTA,"gen$persona".FECHA_NACIMIENTO,"col$creditosbancoldex".PUNTOS_ADIC ' +
        'FROM "col$infbancoldex"' +
        ' INNER JOIN "col$colocacion" ON ("col$infbancoldex".ID_COLOCACION="col$colocacion".ID_COLOCACION)' +
        ' AND ("col$infbancoldex".ID_AGENCIA="col$colocacion".ID_AGENCIA)' +
        ' INNER JOIN "gen$persona" ON ("col$infbancoldex".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)' +
        ' AND ("col$infbancoldex".ID_PERSONA="gen$persona".ID_PERSONA) ' +
        ' INNER JOIN "gen$direccion" ON ("col$infbancoldex".ID_PERSONA="gen$direccion".ID_PERSONA) ' +
        ' LEFT JOIN "gen$municipioban" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipioban".COD_MUNICIPIO) ' +
        ' INNER JOIN "col$creditosbancoldex" ON ("col$infbancoldex".LINEA_BANCOLDEX = "col$creditosbancoldex".LINEA and "col$infbancoldex".NO_BANCOLDEX = "col$creditosbancoldex".ID_OBLIGACION) ' +
        'WHERE "col$colocacion".ID_ESTADO_COLOCACION = 0 and "col$colocacion".FECHA_DESEMBOLSO between  :FECHA1 and :FECHA2 and "gen$direccion".ID_DIRECCION = 1';
        ExtraerLocal;
        ChOcana.Checked := True;
        sentencia := 'SELECT distinct "col$infbancoldex".NO_BANCOLDEX, "col$infbancoldex".ID_COLOCACION,' +
        '"col$infbancoldex".ID_IDENTIFICACION, "col$infbancoldex".ID_PERSONA,' +
        '"gen$persona".NOMBRE, "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,' +
        '"gen$persona".ID_CIIU,"gen$persona".SEXO,"col$infbancoldex".TIPO_SOCIEDAD,' +
        '"col$infbancoldex".EMPLEOS_ACT, "col$infbancoldex".EMPLEOS_GENERAR,' +
        '"col$infbancoldex".TOTAL_ACTIVOS, "col$infbancoldex".FECHA_CORTE_ACTIVOS,' +
        '"col$infbancoldex".DESTINO1, "col$infbancoldex".MONTO1,' +
        '"col$infbancoldex".DESTINO2, "col$infbancoldex".MONTO2,' +
        '"col$infbancoldex".DESTINO3, "col$infbancoldex".MONTO3,' +
        '"col$infbancoldex".CLASE_CREDITO, "col$infbancoldex".AMORTIZACION,' +
        '"col$infbancoldex".MARGEN_INT, "col$infbancoldex".TASA_EA,' +
        '"col$infbancoldex".GARANTIA1, "col$infbancoldex".VALORGAR1,' +
        '"col$infbancoldex".GARANTIA2, "col$infbancoldex".VALORGAR2,' +
        '"col$infbancoldex".GARANTIA3, "col$infbancoldex".VALORGAR3,' +
        '"col$infbancoldex".LINEA_BANCOLDEX, "gen$direccion".TELEFONO1,' +
        '"gen$direccion".DIRECCION, "gen$municipioban".COD_MUNICIPIO_BAN,' +
        '("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) as DEUDA,"col$colocacion".VALOR_DESEMBOLSO,' +
        '"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".FECHA_VENCIMIENTO,' +
        '"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".ID_CATEGORIA,' +
        '"col$colocacion".ID_TIPO_CUOTA,"gen$persona".FECHA_NACIMIENTO,"col$creditosbancoldex".PUNTOS_ADIC ' +
        'FROM "col$infbancoldex"' +
        'INNER JOIN "col$colocacion" ON ("col$infbancoldex".ID_COLOCACION="col$colocacion".ID_COLOCACION)' +
        'AND ("col$infbancoldex".ID_AGENCIA="col$colocacion".ID_AGENCIA)' +
        'INNER JOIN "gen$persona" ON ("col$infbancoldex".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)' +
        'AND ("col$infbancoldex".ID_PERSONA="gen$persona".ID_PERSONA)' +
        'INNER JOIN "gen$direccion" ON ("col$infbancoldex".ID_PERSONA="gen$direccion".ID_PERSONA)' +
        'LEFT JOIN "gen$municipioban" ON ("gen$direccion".COD_MUNICIPIO = "gen$municipioban".COD_MUNICIPIO)' + 
        ' INNER JOIN "col$creditosbancoldex" ON ("col$infbancoldex".LINEA_BANCOLDEX = "col$creditosbancoldex".LINEA and "col$infbancoldex".NO_BANCOLDEX = "col$creditosbancoldex".ID_OBLIGACION) ' +
//        'WHERE "col$colocacion".ID_ESTADO_COLOCACION = 0 and "gen$direccion".ID_DIRECCION =  1 and "col$colocacion".FECHA_DESEMBOLSO >= ' + '''' + IntToStr(YearOf(DTfecha.Date))+ '/' + FormatCurr('00',MonthOf(DTfecha.Date)) + '/' +  '01' + '''' + 'and "col$colocacion".FECHA_DESEMBOLSO <= ' + '''' + IntToStr(YearOf(DTfecha.Date))+ '/' + FormatCurr('00',MonthOf(DTfecha.Date)) + '/' +  FormatCurr('00',DayOf(DTfecha.Date))+ '''';
        'WHERE "col$colocacion".ID_ESTADO_COLOCACION = 0 and "gen$direccion".ID_DIRECCION =  1 and' +
        '"col$colocacion".FECHA_DESEMBOLSO >= ' + '''' + DateToStr(DTfecha1.Date) + '''' + ' and "col$colocacion".FECHA_DESEMBOLSO <= ' + '''' + DateToStr(DTfecha2.Date) + '''';
//        ShowMessage(sentencia);
        ExtraerRemoto(puerto_abrego,host_abrego,'ABREGO');
        ChAbrego.Checked := True;
        ExtraerRemoto(puerto_convencion,host_convencion,'CONVENCION');
        ChConvencion.Checked := True;
        ExtraerRemoto(puerto_aguachica ,host_aguachica,'AGUACHICA');
        ChAguachica.Checked := True;
        BTimportar.Enabled := False;
end;

procedure TfrmConsolidarPlanoBancoldex.ExtraerRemoto(puerto: integer; Hostr,Desc_Agencia: string);
var     cadena :String;
        Astream1 :TMemoryStream;
        j,i :Integer;
        AList,AListCampos:TList;
        AgenciaRem:Integer;
        TasaNominal:Double;
begin
           XmlPet := TsdXmlDocument.CreateName('query_info');
           XmlPet.XmlFormat := xfReadable;
           Nodo := XmlPet.Root.NodeNew('querys');
           Nodo1 := Nodo.NodeNew('query');
           Nodo1.WriteString('tipo','select');
           nodo1.WriteString('sentencia',sentencia);
           XmlPet.SaveToFile('c:\bancoldex.xml');
           DAgencia := Desc_Agencia;
           if DAgencia  = 'ABREGO' then
            begin
              host_server := host_abrego;
              puerto_server := puerto_abrego;
              AgenciaRem := 2;
            end;
           if DAgencia = 'CONVENCION' then
            begin
              host_server := host_convencion;
              puerto_server := puerto_convencion;
              AgenciaRem := 3;
            end;

           if DAgencia = 'AGUACHICA' then
            begin
              host_server := host_aguachica;
              puerto_server := puerto_aguachica;
              AgenciaRem := 4;
            end;

          // AStream := TMemoryStream.Create;

           with IdTCPClient1 do
           begin
             Host := host_server;
             Port := puerto_server;
             Connect;
             if Connected then
             begin
                Cadena := ReadLn();
                AStream := TMemoryStream.Create;
                XmlPet.SaveToStream(AStream);
                WriteInteger(AStream.Size);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                FreeAndNil(AStream);
                Size := ReadInteger;
                AStream := TMemoryStream.Create;
                ReadStream(AStream,Size,False);
                XmlRes := TsdXmlDocument.Create;
                XmlRes.LoadFromStream(AStream);
                Disconnect;
                AList := TList.Create;
                Nodo := XmlRes.Root.NodeByName('consulta000');
                Nodo.NodesByName('Registro',AList);
                if AList.Count <= 1 then begin
                  MessageDlg('No Existen Datos en la Agencia ' + Desc_Agencia,mtInformation,[mbok],0);
                  Exit;
                end
                else
                  if Desc_Agencia = 'ABREGO' then begin
                    BarAbrego.Min := 0;
                    BarAbrego.Max := AList.Count-1;
                    BarAbrego.Position := 0;
                  end else if Desc_Agencia = 'CONVENCION' then begin
                    BarConvencion.Min := 0;
                    BarConvencion.Max := AList.Count-1;
                    BarConvencion.Position := 0;
                  end else begin
                    BarAguachica.Min := 0;
                    BarAguachica.Max := AList.Count-1;
                    BarAguachica.Position := 0;
                  end;
                for i := 0 to AList.Count -1 do
                begin
                  AListCampos := TList.Create;
                  TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                  with sqlquery1 do
                  begin
                    if Desc_Agencia = 'ABREGO' then
                      BarAbrego.Position := i
                    else if Desc_Agencia = 'CONVENCION' then
                      BarConvencion.Position := i
                    else
                      BarAguachica.Position := i;
                    Application.ProcessMessages;
                    Close;
                    SQL.Clear;
                    SQL.Add('insert into "col$planobancoldex" values (:ID_AGENCIA,:ID_COLOCACION,:NO_BANCOLDEX,');
                    SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,:NOMBRE,:TIPO_SOCIEDAD,:DIRECCION,:CIUDAD,:CIIU,');
                    SQL.Add(':EMPLEOS_ACT,:EMPLEOS_GENERAR,:TOTAL_ACTIVOS,:FECHA_CORTE_ACTIVOS,:VALOR,');
                    SQL.Add(':DESTINO1,:MONTO1,:DESTINO2,:MONTO2,:DESTINO3,:MONTO3,:FECHA_DESEMBOLSO,');
                    SQL.Add(':FECHA_VENCIMIENTO,:CLASE_CREDITO,:AMORTIZACION,:MARGEN_INT,:TASA_EA,:SALDO,');
                    SQL.Add(':GARANTIA1,:VALORGAR1,:GARANTIA2,:VALORGAR2,:GARANTIA3,:VALORGAR3,');
                    SQL.Add(':GENERO,:TELEFONO,:LINEA_BANCOLDEX,:AMORTIZAK,:CALIFICACION,:TASA_NOM,:FECHA_NACIMIENTO,:PUNTOS_ADIC)');
                    ParamByName('ID_AGENCIA').AsInteger := AgenciaRem;
                    ParamByName('ID_COLOCACION').AsString := TXmlNode(AListCampos[1]).ValueAsString;
                    ParamByName('NO_BANCOLDEX').AsString := TXmlNode(AListCampos[0]).ValueAsString;
                    if TXmlNode(AListCampos[2]).ValueAsInteger = 4 then
                       ParamByName('ID_IDENTIFICACION').AsInteger := 1
                    else if TXmlNode(AListCampos[2]).ValueAsInteger = 3 then
                       ParamByName('ID_IDENTIFICACION').AsInteger := 2
                    else if TXmlNode(AListCampos[2]).ValueAsInteger = 2 then
                       ParamByName('ID_IDENTIFICACION').AsInteger := 3
                    else if TXmlNode(AListCampos[2]).ValueAsInteger = 7 then
                       ParamByName('ID_IDENTIFICACION').AsInteger := 4
                    else ParamByName('ID_IDENTIFICACION').AsInteger := 2;
                    ParamByName('ID_PERSONA').AsString := TXmlNode(AListCampos[3]).ValueAsString;
                    ParamByName('NOMBRE').AsString := LeftStr(TXmlNode(AListCampos[4]).ValueAsString + ' ' + TXmlNode(AListCampos[5]).ValueAsString + ' ' + TXmlNode(AListCampos[6]).ValueAsString,50);
                    ParamByName('TIPO_SOCIEDAD').AsInteger := TXmlNode(AListCampos[9]).ValueAsInteger;
                    ParamByName('DIRECCION').AsString := TXmlNode(AListCampos[32]).ValueAsString;
                    ParamByName('CIUDAD').AsInteger := TXmlNode(AListCampos[33]).ValueAsInteger;
                    ParamByName('CIIU').AsInteger := TXmlNode(AListCampos[7]).ValueAsInteger;
                    ParamByName('EMPLEOS_ACT').AsString := TXmlNode(AListCampos[10]).ValueAsString;
                    ParamByName('EMPLEOS_GENERAR').AsString := TXmlNode(AListCampos[11]).ValueAsString;
                    ParamByName('TOTAL_ACTIVOS').AsCurrency := TXmlNode(AListCampos[12]).ValueAsFloat;
                    ParamByName('FECHA_CORTE_ACTIVOS').AsString := TXmlNode(AListCampos[13]).ValueAsString;
                    ParamByName('VALOR').AsCurrency := TXmlNode(AListCampos[35]).ValueAsFloat;
                    ParamByName('DESTINO1').AsInteger := TXmlNode(AListCampos[14]).ValueAsInteger;
                    ParamByName('MONTO1').AsCurrency := TXmlNode(AListCampos[15]).ValueAsFloat;
                    ParamByName('DESTINO2').AsInteger := TXmlNode(AListCampos[16]).ValueAsInteger;
                    ParamByName('MONTO2').AsCurrency := TXmlNode(AListCampos[17]).ValueAsFloat;
                    ParamByName('DESTINO3').AsInteger := TXmlNode(AListCampos[18]).ValueAsInteger;
                    ParamByName('MONTO3').AsCurrency := TXmlNode(AListCampos[19]).ValueAsFloat;
                    ParamByName('FECHA_DESEMBOLSO').AsString := IntToStr(YearOf(TXmlNode(AListCampos[36]).ValueAsDateTime)) + FormatCurr('00',MonthOf(TXmlNode(AListCampos[36]).ValueAsDateTime)) + FormatCurr('00',DayOf(TXmlNode(AListCampos[36]).ValueAsDateTime));
                    ParamByName('FECHA_VENCIMIENTO').AsString := IntToStr(YearOf(TXmlNode(AListCampos[37]).ValueAsDateTime)) + FormatCurr('00',MonthOf(TXmlNode(AListCampos[37]).ValueAsDateTime)) + FormatCurr('00',DayOf(TXmlNode(AListCampos[37]).ValueAsDateTime));
                    ParamByName('CLASE_CREDITO').AsString := '1';
                    ParamByName('AMORTIZACION').AsInteger := TXmlNode(AListCampos[21]).ValueAsInteger;
                    ParamByName('MARGEN_INT').AsFloat := TXmlNode(AListCampos[22]).ValueAsFloat;
                    ParamByName('TASA_EA').AsFloat := TXmlNode(AListCampos[23]).ValueAsFloat;
                    ParamByName('SALDO').AsCurrency := TXmlNode(AListCampos[34]).ValueAsFloat;
                    ParamByName('GARANTIA1').AsInteger := TXmlNode(AListCampos[24]).ValueAsInteger;
                    ParamByName('VALORGAR1').AsCurrency := TXmlNode(AListCampos[25]).ValueAsFloat;
                    ParamByName('GARANTIA2').AsInteger := TXmlNode(AListCampos[26]).ValueAsInteger;
                    ParamByName('VALORGAR2').AsCurrency := TXmlNode(AListCampos[27]).ValueAsFloat;
                    ParamByName('GARANTIA3').AsInteger := TXmlNode(AListCampos[28]).ValueAsInteger;
                    ParamByName('VALORGAR3').AsCurrency := TXmlNode(AListCampos[29]).ValueAsFloat;
                    ParamByName('GENERO').AsString := TXmlNode(AListCampos[8]).ValueAsString;
                    ParamByName('TELEFONO').AsString := TXmlNode(AListCampos[31]).ValueAsString;
                    ParamByName('LINEA_BANCOLDEX').AsString := TXmlNode(AListCampos[30]).ValueAsString;
                    ParamByName('AMORTIZAK').AsInteger := TXmlNode(AListCampos[38]).ValueAsInteger;
                    ParamByName('CALIFICACION').AsString := TXmlNode(AListCampos[39]).ValueAsString;
                    if TXmlNode(AListCampos[40]).ValueAsInteger = 2 then
                      TasaNominal := TasaNominalAnticipada(TXmlNode(AListCampos[23]).ValueAsFloat,TXmlNode(AListCampos[21]).ValueAsInteger)
                     else
                      TasaNominal := TasaNominalVencida(TXmlNode(AListCampos[23]).ValueAsFloat,TXmlNode(AListCampos[21]).ValueAsInteger);
                    ParamByName('TASA_NOM').AsFloat := TasaNominal + TXmlNode(AListCampos[22]).ValueAsFloat;
                    ParamByName('FECHA_NACIMIENTO').AsString := IntToStr(YearOf(TXmlNode(AListCampos[41]).ValueAsDateTime))+ FormatCurr('00',MonthOf(TXmlNode(AListCampos[41]).ValueAsDateTime)) + FormatCurr('00',DayOf(TXmlNode(AListCampos[41]).ValueAsDateTime));
                    ParamByName('PUNTOS_ADIC').AsFloat := TXmlNode(AListCampos[42]).ValueAsFloat;
                    ExecSQL;
                  end;
                end;
                SQLQuery1.Transaction.Commit;
                SQLQuery1.Transaction.StartTransaction;
             end;
           end;
end;

procedure TfrmConsolidarPlanoBancoldex.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var       paquete :Currency;
begin
          if AWorkMode = wmRead then
          begin
//            paquete := AWorkCount/1000;
            if DAgencia = 'ABREGO' then
              BarAbrego.Position := AWorkCount
            else if DAgencia = 'CONVENCION' then
              BarConvencion.Position := AWorkCount
            else
              BarAguachica.Position := AWorkCount;
            Application.ProcessMessages;
          end;

end;

procedure TfrmConsolidarPlanoBancoldex.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          if AWorkMode = wmRead then
          begin
            if DAgencia = 'ABREGO' then
              BarAbrego.Max := AWorkCountMax
            else if DAgencia = 'CONVENCION' then
              BarConvencion.Max := AWorkCountMax
            else
              BarAguachica.Max := AWorkCountMax;
          end;

end;

procedure TfrmConsolidarPlanoBancoldex.BTeliminaClick(Sender: TObject);
begin
        if MessageDlg('Esta Seguro de Eliminar los Datos',mtInformation,[mbyes,mbno],0) = mryes then
        begin
          with SQLQuery1 do
          begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('delete from "col$planobancoldex"');
            ExecSQL;
            Transaction.Commit;
            Transaction.StartTransaction;
        end;
       end;
end;

procedure TfrmConsolidarPlanoBancoldex.ExtraerLocal;
var TasaNominal:Double;
begin
        SQLQuery1.Close;
        SQLQuery1.SQL.Clear;
        SQLQuery1.SQL.Add(sentencia);
        SQLQuery1.ParamByName('FECHA1').AsDate := DTfecha1.Date; //(YearOf(DTfecha.Date),MonthOf(DTfecha.Date),01);
        SQLQuery1.ParamByName('FECHA2').AsDate := DTFecha2.Date;
        SQLQuery1.Open;
        SQLQuery1.Last;
        SQLQuery1.First;
        BarOcana.Min := 0;
        BarOcana.Max := SQLQuery1.RecordCount;
        BarOcana.Position := 0;
        while not SQLQuery1.Eof do
        begin
          BarOcana.Position := SQLQuery1.RecNo;
          Application.ProcessMessages;
          with SQLQuery2 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "col$planobancoldex" values (:ID_AGENCIA,:ID_COLOCACION,:NO_BANCOLDEX,');
            SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,:NOMBRE,:TIPO_SOCIEDAD,:DIRECCION,:CIUDAD,:CIIU,');
            SQL.Add(':EMPLEOS_ACT,:EMPLEOS_GENERAR,:TOTAL_ACTIVOS,:FECHA_CORTE_ACTIVOS,:VALOR,');
            SQL.Add(':DESTINO1,:MONTO1,:DESTINO2,:MONTO2,:DESTINO3,:MONTO3,:FECHA_DESEMBOLSO,');
            SQL.Add(':FECHA_VENCIMIENTO,:CLASE_CREDITO,:AMORTIZACION,:MARGEN_INT,:TASA_EA,:SALDO,');
            SQL.Add(':GARANTIA1,:VALORGAR1,:GARANTIA2,:VALORGAR2,:GARANTIA3,:VALORGAR3,');
            SQL.Add(':GENERO,:TELEFONO,:LINEA_BANCOLDEX,:AMORTIZAK,:CALIFICACION,:TASA_NOM,:FECHA_NACIMIENTO,:PUNTOS_ADIC)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia; //SQLQuery1.FieldByName('ID_AGENCIA').AsInteger;
            ParamByName('ID_COLOCACION').AsString := SQLQuery1.FieldByName('ID_COLOCACION').AsString;
            ParamByName('NO_BANCOLDEX').AsString := SQLQuery1.FieldByName('NO_BANCOLDEX').AsString;
            if SQLQuery1.FieldByName('ID_IDENTIFICACION').AsInteger = 4 then
              ParamByName('ID_IDENTIFICACION').AsInteger := 1
            else if SQLQuery1.FieldByName('ID_IDENTIFICACION').AsInteger = 3 then
              ParamByName('ID_IDENTIFICACION').AsInteger := 2
            else if SQLQuery1.FieldByName('ID_IDENTIFICACION').AsInteger = 2 then
              ParamByName('ID_IDENTIFICACION').AsInteger := 3
            else if SQLQuery1.FieldByName('ID_IDENTIFICACION').AsInteger = 7 then
              ParamByName('ID_IDENTIFICACION').AsInteger := 4
            else ParamByName('ID_IDENTIFICACION').AsInteger := 2;
            ParamByName('ID_PERSONA').AsString := SQLQuery1.FieldByName('ID_PERSONA').AsString;
            ParamByName('NOMBRE').AsString := LeftStr(SQLQuery1.FieldByName('NOMBRE').AsString + ' ' + SQLQuery1.FieldByName('PRIMER_APELLIDO').AsString + ' ' +  SQLQuery1.FieldByName('SEGUNDO_APELLIDO').AsString,50);
            ParamByName('TIPO_SOCIEDAD').AsInteger := SQLQuery1.FieldByName('TIPO_SOCIEDAD').AsInteger;
            ParamByName('DIRECCION').AsString := SQLQuery1.FieldByName('DIRECCION').AsString;
            ParamByName('CIUDAD').AsInteger := SQLQuery1.FieldByName('COD_MUNICIPIO_BAN').AsInteger;
            ParamByName('CIIU').AsInteger := SQLQuery1.FieldByName('ID_CIIU').AsInteger;
            ParamByName('EMPLEOS_ACT').AsString := SQLQuery1.FieldByName('EMPLEOS_ACT').AsString;
            ParamByName('EMPLEOS_GENERAR').AsString := SQLQuery1.FieldByName('EMPLEOS_GENERAR').AsString;
            ParamByName('TOTAL_ACTIVOS').AsCurrency := SQLQuery1.FieldByName('TOTAL_ACTIVOS').AsCurrency;
            ParamByName('FECHA_CORTE_ACTIVOS').AsString := SQLQuery1.FieldByName('FECHA_CORTE_ACTIVOS').AsString;
            ParamByName('VALOR').AsCurrency := SQLQuery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
            ParamByName('DESTINO1').AsInteger := SQLQuery1.FieldByName('DESTINO1').AsInteger;
            ParamByName('MONTO1').AsCurrency := SQLQuery1.FieldByName('MONTO1').AsCurrency;
            ParamByName('DESTINO2').AsInteger := SQLQuery1.FieldByName('DESTINO2').AsInteger;
            ParamByName('MONTO2').AsCurrency := SQLQuery1.FieldByName('MONTO2').AsCurrency;
            ParamByName('DESTINO3').AsInteger := SQLQuery1.FieldByName('DESTINO3').AsInteger;
            ParamByName('MONTO3').AsCurrency := SQLQuery1.FieldByName('MONTO3').AsCurrency;
            ParamByName('FECHA_DESEMBOLSO').AsString := IntToStr(YearOf(SQLQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)) + FormatCurr('00',MonthOf(SQLQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime)) + FormatCurr('00',DayOf(SQLQuery1.FieldByName('FECHA_DESEMBOLSO').AsDateTime));
            ParamByName('FECHA_VENCIMIENTO').AsString := IntToStr(YearOf(SQLQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime)) + FormatCurr('00',MonthOf(SQLQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime)) + FormatCurr('00',DayOf(SQLQuery1.FieldByName('FECHA_VENCIMIENTO').AsDateTime));
            ParamByName('CLASE_CREDITO').AsString := '1';
            ParamByName('AMORTIZACION').AsInteger := SQLQuery1.FieldByName('AMORTIZACION').AsInteger;
            ParamByName('MARGEN_INT').AsFloat := SQLQuery1.FieldByName('MARGEN_INT').AsFloat;
            ParamByName('TASA_EA').AsFloat := SQLQuery1.FieldByName('TASA_EA').AsFloat;
            ParamByName('SALDO').AsCurrency := SQLQuery1.FieldByName('DEUDA').AsCurrency;
            ParamByName('GARANTIA1').AsInteger := SQLQuery1.FieldByName('GARANTIA1').AsInteger;
            ParamByName('VALORGAR1').AsCurrency := SQLQuery1.FieldByName('VALORGAR1').AsCurrency;
            ParamByName('GARANTIA2').AsInteger := SQLQuery1.FieldByName('GARANTIA2').AsInteger;
            ParamByName('VALORGAR2').AsCurrency := SQLQuery1.FieldByName('VALORGAR2').AsCurrency;
            ParamByName('GARANTIA3').AsInteger := SQLQuery1.FieldByName('GARANTIA3').AsInteger;
            ParamByName('VALORGAR3').AsCurrency := SQLQuery1.FieldByName('VALORGAR3').AsCurrency;
            ParamByName('GENERO').AsString := SQLQuery1.FieldByName('SEXO').AsString;
            ParamByName('TELEFONO').AsString := SQLQuery1.FieldByName('TELEFONO1').AsString;
            ParamByName('LINEA_BANCOLDEX').AsString := SQLQuery1.FieldByName('LINEA_BANCOLDEX').AsString;
            ParamByName('AMORTIZAK').AsInteger := SQLQuery1.FieldByName('AMORTIZA_CAPITAL').AsInteger;
            ParamByName('CALIFICACION').AsString := SQLQuery1.FieldByName('ID_CATEGORIA').AsString;
            if SQLQuery1.FieldByName('ID_TIPO_CUOTA').AsInteger = 2 then
              TasaNominal := TasaNominalAnticipada(SQLQuery1.FieldByName('TASA_EA').AsFloat,SQLQuery1.FieldByName('AMORTIZACION').AsInteger)
            else
              TasaNominal := TasaNominalVencida(SQLQuery1.FieldByName('TASA_EA').AsFloat,SQLQuery1.FieldByName('AMORTIZACION').AsInteger);
            ParamByName('TASA_NOM').AsFloat := TasaNominal + SQLQuery1.FieldByName('MARGEN_INT').AsFloat;
            ParamByName('FECHA_NACIMIENTO').AsString := IntToStr(YearOf(SQLQuery1.FieldByName('FECHA_NACIMIENTO').AsDateTime))+ FormatCurr('00',MonthOf(SQLQuery1.FieldByName('FECHA_NACIMIENTO').AsDateTime)) + FormatCurr('00',DayOf(SQLQuery1.FieldByName('FECHA_NACIMIENTO').AsDateTime));
            ParamByName('PUNTOS_ADIC').AsFloat := SQLQuery1.FieldByName('PUNTOS_ADIC').AsFloat;
            ExecSQL;
          end;
          SQLQuery1.Next;
        end;
        SQLQuery2.Transaction.Commit;
        SQLQuery2.Transaction.StartTransaction;
end;

procedure TfrmConsolidarPlanoBancoldex.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarPlanoBancoldex.FormShow(Sender: TObject);
begin
        PlanoBancoldex := TStringList.Create;
        PlanoBancoldex.Clear;
        DTfecha1.Date := EncodeDate(YearOf(Date),MonthOf(Date) - 1,01);
        DTfecha2.Date := EncodeDate(YearOf(Date),MonthOf(Date) - 1,DayOf(Date));
        DTfecha2.Date := RecodeDay(DTfecha1.Date,Dayof(EndOfAMonth(YearOf(DTfecha1.Date),MonthOf(DTfecha1.Date))));
        Dia := Dayof(DTfecha2.Date);
        if Dia > 30 then Dia := 30;
        DTfecha2.Date := RecodeDay(DTfecha1.Date,Dia);
        MesCorteAct := DateToStr(DTfecha2.Date);
end;

procedure TfrmConsolidarPlanoBancoldex.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarPlanoBancoldex.CmdDatacreditoClick(Sender: TObject);
begin
        CmdDatacredito.Enabled := False;
        RealizarPlano;
        PlanoBancoldex.SaveToFile('c:/BANCOLDEX' + MesCorteAct + '.TXT');
end;


procedure TfrmConsolidarPlanoBancoldex.RealizarPlano;
var LineaC:TBancoldex;
begin
  if dmGeneral.IBTransaction1.InTransaction then
    dmGeneral.IBTransaction1.Rollback;
  dmGeneral.IBTransaction1.StartTransaction;


  with IBQuery1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select count(*) as CONTEO from "col$planobancoldex"');
    try
     Open;
     if RecordCount < 1 then begin
       MessageDlg('No Existe Información para Procesar',mtInformation,[mbok],0);
       Transaction.Rollback;
       Exit;
     end;
     BarD.Min := 0;
     BarD.Max := FieldByName('CONTEO').AsInteger;
     BarD.Position := 0;
    except
     Transaction.Rollback;
     raise;
     Exit;
    end;
  end;

  with IBQuery1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from "col$planobancoldex"');
    try
     Open;
    except
     Transaction.Rollback;
     raise;
     Exit;
    end;

    while not eof do begin
      BarD.Position := RecNo;
      Application.ProcessMessages;

      LineaC.ObliBancoldex := FormatCurr('000000000000000',StrToCurr(FieldByName('NO_BANCOLDEX').AsString));
      LineaC.Colocacion := FormatCurr('000000000000000',StrToCurr((IntToStr(FieldByName('ID_AGENCIA').AsInteger) + FieldByName('ID_COLOCACION').AsString)));
      LineaC.TipoIdentificacion := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
      LineaC.NumeroIdentificacion := FormatCurr('00000000000',StrToCurr(FieldByName('ID_PERSONA').AsString));
      LineaC.Nombre := Format('%-50s',[LeftStr(FieldByName('NOMBRE').AsString,50)]);
      LineaC.TipoSociedad := Format('%.2d',[FieldByName('TIPO_SOCIEDAD').AsInteger]);
      LineaC.Direccion := Format('%-50s',[LeftStr(FieldByName('DIRECCION').AsString,50)]);
      LineaC.Ciudad := Format('%.5s',[FieldByName('CIUDAD').AsString]);
      LineaC.Ciiu := Formatcurr('0000',StrToCurr(FieldByName('CIIU').AsString));
      LineaC.EmpAct := FormatCurr('000',StrToCurr(FieldByName('EMPLEOS_ACT').AsString));
      LineaC.EmpGen := FormatCurr('000',StrToCurr(FieldByName('EMPLEOS_GENERAR').AsString));
      LineaC.TotalActivos := FormatCurr('00000000000',FieldByName('TOTAL_ACTIVOS').AsCurrency);
      LineaC.FechaActivos := Format('%.4s',[FieldByName('FECHA_CORTE_ACTIVOS').AsString]);
      LineaC.ValorCredito := FormatCurr('00000000000',FieldByName('VALOR').AsCurrency);
      LineaC.Destino1 := IntToStr(FieldByName('DESTINO1').AsInteger);
      LineaC.MontoDes1 := FormatCurr('00000000000',FieldByName('MONTO1').AsCurrency);
      LineaC.Destino2 := IntToStr(FieldByName('DESTINO2').AsInteger);
      LineaC.MontoDes2 := FormatCurr('00000000000',FieldByName('MONTO2').AsCurrency);
      LineaC.Destino3 := IntToStr(FieldByName('DESTINO3').AsInteger);
      LineaC.MontoDes3 := FormatCurr('00000000000',FieldByName('MONTO3').AsCurrency);
      LineaC.FechaDesembolso := FieldByName('FECHA_DESEMBOLSO').AsString;
      LineaC.FechaVencimiento := FieldByName('FECHA_VENCIMIENTO').AsString;
      LineaC.ClaseCredito := '1';
      LineaC.PeriodoGracia := '000';
      if FieldByName('AMORTIZACION').AsInteger < 15 then
        LineaC.FormaAmortiza := '5'
      else if FieldByName('AMORTIZACION').AsInteger = 15 then
        LineaC.FormaAmortiza := '4'
      else if FieldByName('AMORTIZACION').AsInteger = 30 then
        LineaC.FormaAmortiza := '1'
      else if FieldByName('AMORTIZACION').AsInteger = 90 then
        LineaC.FormaAmortiza := '2'
      else if FieldByName('AMORTIZACION').AsInteger = 180 then
        LineaC.FormaAmortiza := '3'
      else LineaC.FormaAmortiza := '1';
//      LineaC.MargenInter := FormatCurr('00.00',(FieldByName('PUNTOS_ADIC').AsFloat - FieldByName('MARGEN_INT').AsFloat));
      LineaC.MargenInter := FormatCurr('00.00',FieldByName('MARGEN_INT').AsFloat);
      LineaC.TasaInteres := FormatCurr('00.00',(FieldByName('TASA_EA').AsFloat + FieldByName('PUNTOS_ADIC').AsFloat));
      LineaC.Saldo := FormatCurr('00000000000',FieldByName('SALDO').AsCurrency);
      LineaC.ClaseGar1 := FormatCurr('00',FieldByName('GARANTIA1').AsInteger);
      LineaC.ValorGar1 := FormatCurr('00000000000',FieldByName('VALORGAR1').AsCurrency);
      LineaC.ClaseGar2 := FormatCurr('00',FieldByName('GARANTIA2').AsInteger);
      LineaC.ValorGar2 := FormatCurr('00000000000',FieldByName('VALORGAR2').AsCurrency);
      LineaC.ClaseGar3 := FormatCurr('00',FieldByName('GARANTIA3').AsInteger);
      LineaC.ValorGar3 := FormatCurr('00000000000',FieldByName('VALORGAR3').AsCurrency);
      if FieldByName('GENERO').AsString = 'M' then
        LineaC.Genero := '1'
      else
        LineaC.Genero := '2';
      LineaC.NitInter := '08905053636';
      LineaC.Linea  := FieldByName('LINEA_BANCOLDEX').AsString;
      LineaC.Telefono := Format('%-15s',[LeftStr(FieldByName('TELEFONO').AsString,15)]);
      LineaC.FechaNac := FieldByName('FECHA_NACIMIENTO').AsString;
      LineaC.NEscolar := '  ';
      LineaC.DestinoAECI := '  ';


      PlanoBancoldex.Add(LineaC.ObliBancoldex + LineaC.Colocacion + LineaC.TipoIdentificacion +
                       LineaC.NumeroIdentificacion + LineaC.Nombre + LineaC.TipoSociedad +
                       LineaC.Direccion + LineaC.Ciudad + LineaC.Ciiu + LineaC.EmpAct +
                       LineaC.EmpGen + LineaC.TotalActivos + LineaC.FechaActivos + LineaC.ValorCredito +
                       LineaC.Destino1 + LineaC.MontoDes1 + LineaC.Destino2 + LineaC.MontoDes2 +
                       LineaC.Destino3 + LineaC.MontoDes3 + LineaC.FechaDesembolso + LineaC.FechaVencimiento +
                       LineaC.ClaseCredito + LineaC.PeriodoGracia + LineaC.FormaAmortiza + LineaC.MargenInter +
                       LineaC.TasaInteres + LineaC.Saldo + LineaC.ClaseGar1 + LineaC.ValorGar1 +
                       LineaC.ClaseGar2 + LineaC.ValorGar2 + LineaC.ClaseGar3 + LineaC.ValorGar3 +
                       LineaC.Genero + LineaC.NitInter + LineaC.Linea + LineaC.Telefono + LineaC.FechaNac + LineaC.NEscolar + LineaC.DestinoAECI);

      Next;
    end; // fin de while
   Close;
  end; //fin de with principal

end;

procedure TfrmConsolidarPlanoBancoldex.CmdEnviarClick(Sender: TObject);
begin
        with IBQuery2 do begin
          if Transaction.InTransaction then
            Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT "col$planobancoldex".ID_AGENCIA,');
          SQL.Add('"col$planobancoldex".ID_COLOCACION,');
          SQL.Add('"col$planobancoldex".NOMBRE,');
          SQL.Add('"col$planobancoldex".FECHA_DESEMBOLSO,');
          SQL.Add('"col$planobancoldex".FECHA_VENCIMIENTO,');
          SQL.Add('"col$planobancoldex".VALOR,');
          SQL.Add('"col$planobancoldex".SALDO,');
          SQL.Add('"col$planobancoldex".TASA_NOM,');
          SQL.Add('"col$planobancoldex".AMORTIZAK,');
          SQL.Add('"col$planobancoldex".AMORTIZACION,');
          SQL.Add('"col$planobancoldex".CALIFICACION');
          SQL.Add('FROM');
          SQL.Add('"col$planobancoldex"');
          Open;
          imprimir_reporte(frmMain.ruta1 + '\Reporte\RepCustodiaBancoldex.frf');
          Close;
        end;
end;

procedure TfrmConsolidarPlanoBancoldex.Imprimir_reporte(cadena:string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;


procedure TfrmConsolidarPlanoBancoldex.frReport1GetValue(
  const ParName: String; var ParValue: Variant);
begin
        if ParName = 'entidad' then
          ParValue := 'BANCOLDEX';
        if ParName = 'nit' then
          ParValue := Nit;
        if ParName = 'empresa' then
          ParValue := Empresa;
        if ParName = 'empleado' then
          ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'city' then
          ParValue := Ciudad;
        if ParName = 'consecutivo' then
          ParValue := '1';
end;

procedure TfrmConsolidarPlanoBancoldex.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmConsolidarPlanoBancoldex.DTFecha2Exit(Sender: TObject);
begin
        MesCorteAct := IntToStr(YearOf(DTFecha2.Date)) + FormatCurr('00',MonthOf(DTFecha2.Date)) + FormatCurr('00',DayOf(DTFecha2.Date));
end;

end.
