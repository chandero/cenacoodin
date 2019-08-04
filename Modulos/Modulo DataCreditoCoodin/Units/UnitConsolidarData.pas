unit UnitConsolidarData;

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
  TfrmConsolidarData = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DTfecha: TDateTimePicker;
    IdTCPClient1: TIdTCPClient;
    SQLQuery1: TIBQuery;
    SQLQuery2: TIBQuery;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
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
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox5: TCheckBox;
    Panel2: TPanel;
    CmdDatacredito: TBitBtn;
    CmdEnviar: TBitBtn;
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
    CmdCifin: TBitBtn;
    GroupBox5: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    GroupBox6: TGroupBox;
    BarC: TProgressBar;
    IBTransaction1: TIBTransaction;
    IBTransaction2: TIBTransaction;
    IBDatabase1: TIBDatabase;
    IBDatabase2: TIBDatabase;
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
    procedure DTfechaExit(Sender: TObject);
    procedure CmdCifinClick(Sender: TObject);
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
    procedure ClientesDatacredito;
    procedure EncabezadoDatacredito;
    procedure FinDatacredito;
    procedure EncabezadoCifin;
    procedure ClientesCifin;
    procedure FinCifin;

    { Private declarations }
  public
    { Public declarations }
  end;

type Registro = Record
    Numero:string; // * 18
    Identificacion:string; // * 11
    Nombre:string; // * 45
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
end;

type Registro1 = Record
    TRegistro:string; // * 1 N
    TProducto:string; // * 2 N
    TEntidad:string; // * 4 N
    CEntidad:string; // * 10 N
    IdenCifin:string; // * 18 A
    TOblig:string; // * 8 N
    FCorte:string; // * 8 Fecha
end;

type Registro2 = Record
    TRegistro:string; // * 1 N
    TAccion:string; // * 1 N
    JustAccion:string; // * 2 N Solo Aplica si TAccion = 8
    TIden:string; // * 2 N
    Identificacion:string; // * 14 A
    Nombre:string; // * 60 A
    Ciiu:string; // * 6 N
    NJuridica:string; // * 3 N
    Numero:string; // * 20 A
    CodSuc:string; // * 6 A
    Calidad:string; // * 1 A
end;

type Registro3 = Record
    TRegistro:string; // * 1 N
    TAccion:string; // * 1 N
    JustAccion:string; // * 2 N  Aplica si TAccion = 3
    Numero:string; // * 20 A
    CodSuc:string; // * 6 A
    LineaC:string; // * 3 N
    ModalC:string; // * 2 N
    TpGar:string; // * 2 N
    TpMone:string; // * 2 N
    PePago:string; // * 2 periodo de pago N
    ValIni:string; // * 12 N
    VSaldo:string; // * 12 N
    VGar:string; // * 12 N
    VCuota:string; // * 12 N
    ValMor:string; // * 12 N
    FInicial:string; // * 8 F
    FTermi:string; // * 8 F
    FUPago:string; // * 8  Fecha de Pago F
    FechaC:string; // * 8 F
    Estado:string; // * 2 N
    Califi:string; // * 2 A
    EdMora:string; // * 2 N
    ModoExt:string; // * 2 N
    NatReest:string; // * 2 N
    NumReest:string; // * 3 N
    CCance:string; // * 03 N
    ProbNoPago:string; // * 3 N - 0-100
    TpIdOrig:string; // * 2 N
    NoIdOrig:string; // * 14 A
    TpEntOrig:string; // * 4 N
    CodEntOrig:string; // * 10 N
end;

  
var
  frmConsolidarData: TfrmConsolidarData;
  PlanoReporte:TStringList;
  SumaNovedad:Integer;
  SumaRegistros:Integer;
  MesCorteAct:string;
  PlanoEncabezado:TStringList;
  PlanoClientes:TStringList;
  PlanoMovimientos:TStringList;
  SumaObligaciones:Integer;
  LineaF, LineaE:string;
  DAgencia:string;
  Dia:Integer;
implementation

uses UnitPantallaProgreso, UnitGlobalesCol, UnitGlobales, UnitdmGeneral;

{$R *.dfm}

procedure TfrmConsolidarData.BTimportarClick(Sender: TObject);
begin
        with SQLQuery1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$ReporteDatatmp"');
           Open;
           if RecordCount <> 0 then
           begin
             MessageDlg('Existen Datos En la Tabla, Debe Eliminarlos Primero',mtInformation,[mbok],0);
             Exit;
           end;
        end;
        sentencia := 'SELECT * from "col$ReporteData" WHERE "col$ReporteData".FECHA_CORTE = ' + '''' +IntToStr(YearOf(DTfecha.Date))+ FormatCurr('00',MonthOf(DTfecha.Date))+ '''';
        ExtraerLocal;
        ChOcana.Checked := True;
        ExtraerRemoto(3052,'192.168.201.2','ABREGO');
        ChAbrego.Checked := True;
        ExtraerRemoto(3052,'192.168.202.2','CONVENCION');
        ChConvencion.Checked := True;
        BTimportar.Enabled := False;
end;

procedure TfrmConsolidarData.ExtraerRemoto(puerto: integer; Hostr,Desc_Agencia: string);
var     cadena :String;
        Astream1 :TMemoryStream;
        j,i :Integer;
        AList,AListCampos:TList;
begin
           XmlPet := TsdXmlDocument.CreateName('query_info');
           XmlPet.XmlFormat := xfReadable;
           Nodo := XmlPet.Root.NodeNew('querys');
           Nodo1 := Nodo.NodeNew('query');
           Nodo1.WriteString('tipo','select');
           nodo1.WriteString('sentencia',sentencia);
           XmlPet.SaveToFile('c:\colocacion.xml');
           DAgencia := Desc_Agencia;
           if DAgencia  = 'ABREGO' then
            begin
              host_server := host_abrego;
              puerto_server := puerto_abrego;
            end;
           if DAgencia = 'CONVENCION' then
            begin
              host_server := host_convencion;
              puerto_server := puerto_convencion;
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
                if Desc_Agencia = 'ABREGO' then begin
                  BarAbrego.Min := 0;
                  BarAbrego.Max := AList.Count-1;
                  BarAbrego.Position := 0;
                end else begin
                  BarConvencion.Min := 0;
                  BarConvencion.Max := AList.Count-1;
                  BarConvencion.Position := 0;
                end;
                for i := 0 to AList.Count -1 do
                begin
                  AListCampos := TList.Create;
                  TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                  with sqlquery1 do
                  begin
                    if Desc_Agencia = 'ABREGO' then
                      BarAbrego.Position := i
                    else
                      BarConvencion.Position := i;
                    Application.ProcessMessages;
                    Close;
                    SQL.Clear;
                    SQL.Add('insert into "col$ReporteDatatmp" values (:NUMERO,:IDENTIFICACION,:NOMBRE,:NOMBREC,:FNACIM,:FAPERT,:FVENCI,:VCUOTA,:NOVEDAD,:ADJETI,:TPIDEN,:VALINI,:VALDEU,');
                    SQL.Add(':VALMOR,:VALDIS,:TPMONE,:TPOBLI,:TPGARA,:CALIFI,:CRESID,:DRESID,:TRESID,:CLABOR,:TLABOR,:CCORRE,:DCORRE,');
                    SQL.Add(':CIIU,:TCUOTA,:CCANCE,:CEMORA,:FUPAGO,:OFICIN,:CRADIC,:FOPAGO,:PEPAGO,:EDMORA,:FACTUA,:RECLAM,:RESPON,:ESTRAC,:RELLEN,:LINEA,:FECHA_DESEMBOLSO,:FECHA_VENCIMIENTO,:IDIDENT)');
                    ParamByName('NUMERO').AsString := TXmlNode(AListCampos[0]).ValueAsString;
                    ParamByName('IDENTIFICACION').AsString := TXmlNode(AListCampos[1]).ValueAsString;
                    ParamByName('NOMBRE').AsString := TXmlNode(AListCampos[2]).ValueAsString;
                    ParamByName('NOMBREC').AsString := TXmlNode(AListCampos[3]).ValueAsString;
                    ParamByName('FNACIM').AsString := TXmlNode(AListCampos[4]).ValueAsString;
                    ParamByName('FAPERT').AsString := TXmlNode(AListCampos[5]).ValueAsString;
                    ParamByName('FVENCI').AsString := TXmlNode(AListCampos[6]).ValueAsString;
                    ParamByName('VCUOTA').AsString := TXmlNode(AListCampos[7]).ValueAsString;
                    ParamByName('NOVEDAD').AsString := TXmlNode(AListCampos[8]).ValueAsString;
                    ParamByName('ADJETI').AsString := TXmlNode(AListCampos[9]).ValueAsString;
                    ParamByName('TPIDEN').AsString := TXmlNode(AListCampos[10]).ValueAsString;
                    ParamByName('VALINI').AsString := TXmlNode(AListCampos[11]).ValueAsString;
                    ParamByName('VALDEU').AsString := TXmlNode(AListCampos[12]).ValueAsString;
                    ParamByName('VALMOR').AsString := TXmlNode(AListCampos[13]).ValueAsString;
                    ParamByName('VALDIS').AsString := TXmlNode(AListCampos[14]).ValueAsString;
                    ParamByName('TPMONE').AsString := TXmlNode(AListCampos[15]).ValueAsString;
                    ParamByName('TPOBLI').AsString := TXmlNode(AListCampos[16]).ValueAsString;
                    ParamByName('TPGARA').AsString := TXmlNode(AListCampos[17]).ValueAsString;
                    ParamByName('CALIFI').AsString := TXmlNode(AListCampos[18]).ValueAsString;
                    ParamByName('CRESID').AsString := TXmlNode(AListCampos[19]).ValueAsString;
                    ParamByName('DRESID').AsString := TXmlNode(AListCampos[20]).ValueAsString;
                    ParamByName('TRESID').AsString := TXmlNode(AListCampos[21]).ValueAsString;
                    ParamByName('CLABOR').AsString := TXmlNode(AListCampos[22]).ValueAsString;
                    ParamByName('TLABOR').AsString := TXmlNode(AListCampos[23]).ValueAsString;
                    ParamByName('CCORRE').AsString := TXmlNode(AListCampos[24]).ValueAsString;
                    ParamByName('DCORRE').AsString := TXmlNode(AListCampos[25]).ValueAsString;
                    ParamByName('CIIU').AsString := TXmlNode(AListCampos[26]).ValueAsString;
                    ParamByName('TCUOTA').AsString := TXmlNode(AListCampos[27]).ValueAsString;
                    ParamByName('CCANCE').AsString := TXmlNode(AListCampos[28]).ValueAsString;
                    ParamByName('CEMORA').AsString := TXmlNode(AListCampos[29]).ValueAsString;
                    ParamByName('FUPAGO').AsString := TXmlNode(AListCampos[30]).ValueAsString;
                    ParamByName('OFICIN').AsString := TXmlNode(AListCampos[31]).ValueAsString;
                    ParamByName('CRADIC').AsString := TXmlNode(AListCampos[32]).ValueAsString;
                    ParamByName('FOPAGO').AsString := TXmlNode(AListCampos[33]).ValueAsString;
                    ParamByName('PEPAGO').AsString := TXmlNode(AListCampos[34]).ValueAsString;
                    ParamByName('EDMORA').AsString := TXmlNode(AListCampos[35]).ValueAsString;
                    ParamByName('FACTUA').AsString := TXmlNode(AListCampos[36]).ValueAsString;
                    ParamByName('RECLAM').AsString := TXmlNode(AListCampos[37]).ValueAsString;
                    ParamByName('RESPON').AsString := TXmlNode(AListCampos[38]).ValueAsString;
                    ParamByName('ESTRAC').AsString := TXmlNode(AListCampos[39]).ValueAsString;
                    ParamByName('RELLEN').AsString := TXmlNode(AListCampos[40]).ValueAsString;
                    ParamByName('LINEA').AsString := TXmlNode(AListCampos[42]).ValueAsString;
                    ParamByName('FECHA_DESEMBOLSO').AsString := TXmlNode(AListCampos[43]).ValueAsString;
                    ParamByName('FECHA_VENCIMIENTO').AsString := TXmlNode(AListCampos[44]).ValueAsString;
                    ParamByName('IDIDENT').AsString := TXmlNode(AListCampos[45]).ValueAsString;
                    ExecSQL;
                  end;
                end;
                SQLQuery1.Transaction.Commit;
                SQLQuery1.Transaction.StartTransaction;
             end;
           end;
end;

procedure TfrmConsolidarData.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var       paquete :Currency;
begin
          if AWorkMode = wmRead then
          begin
//            paquete := AWorkCount/1000;
            if DAgencia = 'ABREGO' then
              BarAbrego.Position := AWorkCount
            else
              BarConvencion.Position := AWorkCount;
            Application.ProcessMessages;
          end;

end;

procedure TfrmConsolidarData.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          if AWorkMode = wmRead then
          begin
            if DAgencia = 'ABREGO' then
              BarAbrego.Max := AWorkCountMax
            else
              BarConvencion.Max := AWorkCountMax;
          end;

end;

procedure TfrmConsolidarData.BTeliminaClick(Sender: TObject);
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
            SQL.Add('delete from "col$ReporteDatatmp"');
            ExecSQL;
            Transaction.Commit;
            Transaction.StartTransaction;
        end;
       end;  
end;

procedure TfrmConsolidarData.ExtraerLocal;
begin
        SQLQuery1.Close;
        SQLQuery1.SQL.Clear;
        SQLQuery1.SQL.Add(sentencia);
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
            SQL.Add('insert into "col$ReporteDatatmp" values (:NUMERO,:IDENTIFICACION,:NOMBRE,:NOMBREC,:FNACIM,:FAPERT,:FVENCI,:VCUOTA,:NOVEDAD,:ADJETI,:TPIDEN,:VALINI,:VALDEU,');
            SQL.Add(':VALMOR,:VALDIS,:TPMONE,:TPOBLI,:TPGARA,:CALIFI,:CRESID,:DRESID,:TRESID,:CLABOR,:TLABOR,:CCORRE,:DCORRE,');
            SQL.Add(':CIIU,:TCUOTA,:CCANCE,:CEMORA,:FUPAGO,:OFICIN,:CRADIC,:FOPAGO,:PEPAGO,:EDMORA,:FACTUA,:RECLAM,:RESPON,:ESTRAC,:RELLEN,:LINEA,:FECHA_DESEMBOLSO,:FECHA_VENCIMIENTO,:IDIDENT)');
            ParamByName('NUMERO').AsString := SQLQuery1.FieldByName('NUMERO').AsString;
            ParamByName('IDENTIFICACION').AsString := SQLQuery1.FieldByName('IDENTIFICACION').AsString;
            ParamByName('NOMBRE').AsString := SQLQuery1.FieldByName('NOMBRE').AsString;
            ParamByName('NOMBREC').AsString := SQLQuery1.FieldByName('NOMBREC').AsString;
            ParamByName('FNACIM').AsString := SQLQuery1.FieldByName('FNACIM').AsString;
            ParamByName('FAPERT').AsString := SQLQuery1.FieldByName('FAPERT').AsString;
            ParamByName('FVENCI').AsString := SQLQuery1.FieldByName('FVENCI').AsString;
            ParamByName('VCUOTA').AsString := SQLQuery1.FieldByName('VCUOTA').AsString;
            ParamByName('NOVEDAD').AsString := SQLQuery1.FieldByName('NOVEDAD').AsString;
            ParamByName('ADJETI').AsString := SQLQuery1.FieldByName('ADJETI').AsString;
            ParamByName('TPIDEN').AsString := SQLQuery1.FieldByName('TPIDEN').AsString;
            ParamByName('VALINI').AsString := SQLQuery1.FieldByName('VALINI').AsString;
            ParamByName('VALDEU').AsString := SQLQuery1.FieldByName('VALDEU').AsString;
            ParamByName('VALMOR').AsString := SQLQuery1.FieldByName('VALMOR').AsString;
            ParamByName('VALDIS').AsString := SQLQuery1.FieldByName('VALDIS').AsString;
            ParamByName('TPMONE').AsString := SQLQuery1.FieldByName('TPMONE').AsString;
            ParamByName('TPOBLI').AsString := SQLQuery1.FieldByName('TPOBLI').AsString;
            ParamByName('TPGARA').AsString := SQLQuery1.FieldByName('TPGARA').AsString;
            ParamByName('CALIFI').AsString := SQLQuery1.FieldByName('CALIFI').AsString;
            ParamByName('CRESID').AsString := SQLQuery1.FieldByName('CRESID').AsString;
            ParamByName('DRESID').AsString := SQLQuery1.FieldByName('DRESID').AsString;
            ParamByName('TRESID').AsString := SQLQuery1.FieldByName('TRESID').AsString;
            ParamByName('CLABOR').AsString := SQLQuery1.FieldByName('CLABOR').AsString;
            ParamByName('TLABOR').AsString := SQLQuery1.FieldByName('TLABOR').AsString;
            ParamByName('CCORRE').AsString := SQLQuery1.FieldByName('CCORRE').AsString;
            ParamByName('DCORRE').AsString := SQLQuery1.FieldByName('DCORRE').AsString;
            ParamByName('CIIU').AsString := SQLQuery1.FieldByName('CIIU').AsString;
            ParamByName('TCUOTA').AsString := SQLQuery1.FieldByName('TCUOTA').AsString;
            ParamByName('CCANCE').AsString := SQLQuery1.FieldByName('CCANCE').AsString;
            ParamByName('CEMORA').AsString := SQLQuery1.FieldByName('CEMORA').AsString;
            ParamByName('FUPAGO').AsString := SQLQuery1.FieldByName('FUPAGO').AsString;
            ParamByName('OFICIN').AsString := SQLQuery1.FieldByName('OFICIN').AsString;
            ParamByName('CRADIC').AsString := SQLQuery1.FieldByName('CRADIC').AsString;
            ParamByName('FOPAGO').AsString := SQLQuery1.FieldByName('FOPAGO').AsString;
            ParamByName('PEPAGO').AsString := SQLQuery1.FieldByName('PEPAGO').AsString;
            ParamByName('EDMORA').AsString := SQLQuery1.FieldByName('EDMORA').AsString;
            ParamByName('FACTUA').AsString := SQLQuery1.FieldByName('FACTUA').AsString;
            ParamByName('RECLAM').AsString := SQLQuery1.FieldByName('RECLAM').AsString;
            ParamByName('RESPON').AsString := SQLQuery1.FieldByName('RESPON').AsString;
            ParamByName('ESTRAC').AsString := SQLQuery1.FieldByName('ESTRAC').AsString;
            ParamByName('RELLEN').AsString := SQLQuery1.FieldByName('RELLEN').AsString;
            ParamByName('LINEA').AsString := SQLQuery1.FieldByName('LINEA').AsString;
            ParamByName('FECHA_DESEMBOLSO').AsString := SQLQuery1.FieldByName('FECHA_DESEMBOLSO').AsString;
            ParamByName('FECHA_VENCIMIENTO').AsString := SQLQuery1.FieldByName('FECHA_VENCIMIENTO').AsString;
            ParamByName('IDIDENT').AsString := SQLQuery1.FieldByName('IDIDENT').AsString;
            ExecSQL;
          end;
          SQLQuery1.Next;
        end;
        SQLQuery2.Transaction.Commit;
        SQLQuery2.Transaction.StartTransaction;
end;

procedure TfrmConsolidarData.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarData.FormShow(Sender: TObject);
begin
        PlanoReporte := TStringList.Create;
        PlanoReporte.Clear;
        PlanoEncabezado := TStringList.Create;
        PlanoClientes := TStringList.Create;
        PlanoMovimientos := TStringList.Create;
        PlanoEncabezado.Clear;
        PlanoClientes.Clear;
        PlanoMovimientos.Clear;
        DTfecha.Date := EncodeDate(YearOf(Date),MonthOf(Date) - 1,DayOf(Date));
        DTfecha.Date := RecodeDay(DTfecha.Date,Dayof(EndOfAMonth(YearOf(dtfecha.Date),MonthOf(DTfecha.Date))));
        Dia := Dayof(DTfecha.Date);
        if Dia > 30 then Dia := 30;
        DTfecha.Date := RecodeDay(DTfecha.Date,Dia);
        MesCorteAct := IntToStr(YearOf(DTfecha.Date)) + FormatCurr('00',MonthOf(DTfecha.Date)) + FormatCurr('00',DayOf(DTfecha.Date));
end;

procedure TfrmConsolidarData.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarData.CmdDatacreditoClick(Sender: TObject);
begin
        CmdDatacredito.Enabled := False;
        EncabezadoDatacredito;
        ClientesDatacredito;
        FinDatacredito;
        PlanoReporte.SaveToFile('c:/PTCAC273919' + MesCorteAct + '.TXT');
end;


procedure TfrmConsolidarData.ClientesDatacredito;
var cadena:string;
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
    FechaNacimiento:string;
    DescAgencia:string;

    i,j: Integer;
    Entero: Integer;
    S1,S2 :TStringList;
    ColocacionErr : string;
begin
  if dmGeneral.IBTransaction1.InTransaction then
    dmGeneral.IBTransaction1.Rollback;
  dmGeneral.IBTransaction1.StartTransaction;

  SumaNovedad := 0;
  SumaRegistros := 0;

  with IBQuery1 do begin
    Close;
    SQL.Clear;
    SQL.Add('select count(*) as CONTEO from "col$ReporteDatatmp"');
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
    SQL.Add('select * from "col$ReporteDatatmp"');
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

      LineaC.Numero := FieldByName('NUMERO').AsString;
      LineaC.Identificacion := FieldByName('IDENTIFICACION').AsString;
      LineaC.Nombre := FieldByName('NOMBRE').AsString;
      LineaC.FNacim := FieldByName('FNACIM').AsString;
      LineaC.FApert := FieldByName('FAPERT').AsString;
      LineaC.FVenci := FieldByName('FVENCI').AsString;
      LineaC.VCuota := FieldByName('VCUOTA').AsString;
      LineaC.Noveda := FieldByName('NOVEDAD').AsString;
      SumaNovedad := SumaNovedad + StrToInt(FieldByName('NOVEDAD').AsString);      
      LineaC.Adjeti := FieldByName('ADJETI').AsString;
      LineaC.TpIden := FieldByName('TPIDEN').AsString;
      LineaC.ValIni := FieldByName('VALINI').AsString;
      LineaC.ValDeu := FieldByName('VALDEU').AsString;
      LineaC.ValMor := FieldByName('VALMOR').AsString;
      LineaC.ValDis := FieldByName('VALDIS').AsString;
      LineaC.TpMone := FieldByName('TPMONE').AsString;
      LineaC.TpObli := FieldByName('TPOBLI').AsString;
      LineaC.TpGara := FieldByName('TPGARA').AsString;
      LineaC.Califi := FieldByName('CALIFI').AsString;
      LineaC.CResid := FieldByName('CRESID').AsString;
      LineaC.DResid := FieldByName('DRESID').AsString;
      LineaC.TResid := FieldByName('TRESID').AsString;
      LineaC.CLabor := FieldByName('CLABOR').AsString;
      LineaC.TLabor := FieldByName('TLABOR').AsString;
      LineaC.CCorre := FieldByName('CCORRE').AsString;
      LineaC.DCorre := FieldByName('DCORRE').AsString;
      LineaC.Ciiu := FieldByName('CIIU').AsString;
      LineaC.TCuota := FieldByName('TCUOTA').AsString;
      LineaC.CCance := FieldByName('CCANCE').AsString;
      LineaC.CeMora := FieldByName('CEMORA').AsString;
      LineaC.FUPago := FieldByName('FUPAGO').AsString;
      LineaC.Oficin := FieldByName('OFICIN').AsString;
      LineaC.CRadic := FieldByName('CRADIC').AsString;
      LineaC.FoPago := FieldByName('FOPAGO').AsString;
      LineaC.PePago := FieldByName('PEPAGO').AsString;
      LineaC.EdMora := FieldByName('EDMORA').AsString;
      LineaC.FActua := FieldByName('FACTUA').AsString;
      LineaC.Reclam := FieldByName('RECLAM').AsString;
      LineaC.Respon := FieldByName('RESPON').AsString;
      LineaC.Estrac := FieldByName('ESTRAC').AsString;
      LineaC.Rellen := '              ';

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
      Next;
    end; // fin de while
   Close;
  end; //fin de with principal

  CheckBox2.Checked := True;
end;

procedure TfrmConsolidarData.EncabezadoDatacredito;
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
      cadena := Format('%.4d',[YearOf(DTfecha.Date)])+Format('%.2d',[monthOf(DTfecha.Date)]);
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

procedure TfrmConsolidarData.FinDatacredito;
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
      CmdEnviar.Enabled := True;
end;


procedure TfrmConsolidarData.DTfechaExit(Sender: TObject);
begin
        MesCorteAct := IntToStr(YearOf(DTfecha.Date)) + FormatCurr('00',MonthOf(DTfecha.Date-1)) + FormatCurr('00',DayOf(DTfecha.Date));
        
end;

procedure TfrmConsolidarData.CmdCifinClick(Sender: TObject);
begin
        CmdCifin.Enabled := False;
        ClientesCifin;
        FinCifin;
        EncabezadoCifin;

        PlanoMovimientos.Add(LineaF);
        PlanoEncabezado.AddStrings(PlanoClientes);
        PlanoEncabezado.AddStrings(PlanoMovimientos);
        PlanoEncabezado.SaveToFile('c:/Cifin' + MesCorteAct + '.TXT');

end;

procedure TfrmConsolidarData.EncabezadoCifin;
var cadena:string;
    LineaE:Registro1;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Encabezado del Archivo
      LineaE.TRegistro := '1';
      LineaE.TProducto := '21';
      LineaE.TEntidad := '0201';
      LineaE.CEntidad := '0000003264';
      LineaE.IdenCifin := '162519            ';
      LineaE.TOblig := StringReplace(Format('%8d',[Sumaobligaciones]),' ','0',[rfReplaceAll]);
      LineaE.FCorte := Format('%.4d',[YearOf(DTfecha.Date)]) + Format('%.2d',[monthOf(DTfecha.Date)]) + Format('%.2d',[dayOf(DTfecha.Date)]);

      PlanoEncabezado.Add(LineaE.TRegistro + LineaE.TProducto + LineaE.TEntidad+
                          LineaE.CEntidad + LineaE.IdenCifin + LineaE.TOblig + LineaE.FCorte);
                          
      CheckBox3.Checked := True;
end;


procedure TfrmConsolidarData.ClientesCifin;
var cadena:string;
    LineaC:Registro2;
    LineaM:Registro3;
    LineaError:string;
    ColocacionNew:string;
    ConverColocacion:Int64;
    ColocacionAnt:string;
    ColocacionActual:string;
    DiasMora:Integer;
    NoCod:Integer;
    NovedadLocal:Integer;
    Fecha:TDate;
    Apel1,Apel2,Nombre:string;
    Identificacion:string;
    Ident:Int64;
    AgenciaLocal:Integer;
    ColocacionLocal:string;
    Tmp:Currency;

     i,j: Integer;
     Entero: Integer;
     S1,S2 :TStringList;
     ColocacionErr : string;
begin
           if dmGeneral.IBTransaction1.InTransaction then
              dmGeneral.IBTransaction1.Rollback;
           dmGeneral.IBTransaction1.StartTransaction;

        SumaRegistros := 0;
        SumaObligaciones := 0;
        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as CONTEO from "col$ReporteDatatmp"');
           try
            Open;
            if RecordCount < 1 then begin
              MessageDlg('No existe información para Procesar',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
            BarC.Min := 0;
            BarC.Max := FieldByName('CONTEO').AsInteger;
            BarC.Position := 0;
           except
              Transaction.Rollback;
              raise;
              Exit;
           end;
        end;

        with IBQuery1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$ReporteDatatmp"');
           try
            Open;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;

           while not eof do begin
             BarC.Position := RecNo;
             Application.ProcessMessages;
             cadena := IBQuery1.FieldByName('NUMERO').AsString;
             if MidStr(cadena,17,1) = 'C' then
              begin
                AgenciaLocal := StrToInt(MidStr(cadena,5,1));
                ColocacionLocal := MidStr(cadena,6,11);
              end
             else
              begin
                AgenciaLocal := StrToInt(MidStr(cadena,7,1));
                ColocacionLocal := MidStr(cadena,8,11);
                SumaObligaciones := SumaObligaciones + 1;
              end;
             // Proceso informacion Clientes
             LineaC.TRegistro := '2';
             LineaC.TAccion := '7';
             LineaC.JustAccion := '  ';
             LineaC.TIden := IBQuery1.FieldByName('IDIDENT').AsString;
             Ident := StrToInt64(IBQuery1.FieldByName('IDENTIFICACION').AsString);
             Identificacion := Format('%-14s',[IntToStr(Ident)]);
//                               Format('%-14s',[LeftStr(IBSClientes.FieldByName('ID_PERSONA').AsString,14)]);
             LineaC.Identificacion := Identificacion;
             LineaC.Nombre := IBQuery1.FieldByName('NOMBREC').AsString;
             LineaC.Ciiu := '000000';
             case StrToInt(IBQuery1.FieldByName('TPIDEN').AsString) of
               3 : LineaC.NJuridica := '000';
               4 : LineaC.NJuridica := '007';
               7 : LineaC.NJuridica := '007';
             end;
             if FieldByName('RESPON').AsString = '00' then
              begin
                LineaC.Numero := '00' + FieldByName('NUMERO').AsString;
                LineaC.CodSuc := IntToStr(AgenciaLocal) + '     ';
                LineaC.Calidad := 'P'
              end
             else if FieldByName('RESPON').AsString = '01' then
              begin
                LineaC.Numero := '0000' + LeftStr(FieldByName('NUMERO').AsString,16);
                LineaC.CodSuc := IntToStr(AgenciaLocal) + '     ';
                LineaC.Calidad := 'C';
              end;

             PlanoClientes.Add(LineaC.TRegistro + LineaC.TAccion + LineaC.JustAccion +
                              LineaC.TIden + LineaC.Identificacion + LineaC.Nombre + LineaC.Ciiu +
                              LineaC.NJuridica + LineaC.Numero + LineaC.CodSuc + LineaC.Calidad);

             SumaRegistros := SumaRegistros + 1;
             IBSClientes.Close;
             // fin de proceso clientes

             //Inicio proceso Obligaciones
             if FieldByName('RESPON').AsString = '00' then
              begin
                LineaM.TRegistro := '3';
                LineaM.TAccion := '1';
                LineaM.JustAccion := '  ';
                LineaM.Numero := '00' + FieldByName('NUMERO').AsString;
                LineaM.CodSuc := IntToStr(AgenciaLocal) + '     ';

                LineaM.LineaC := IBQuery1.FieldByName('LINEA').AsString;

               if FieldByName('TPOBLI').AsString = '1' then
                 LineaM.ModalC := '01'
               else if FieldByName('TPOBLI').AsString = '2' then
                 LineaM.ModalC := '02'
               else if FieldByName('TPOBLI').AsString = '3' then
                 LineaM.ModalC := '03'
               else LineaM.ModalC := '05';

               if FieldByName('TPGARA').AsString = '1' then
                  LineaM.TpGar := '10'
               else LineaM.TpGar := '02';

               LineaM.TpMone := '01';

               if FieldByName('PEPAGO').AsString = '1' then
                 LineaM.PePago := '07'
               else if FieldByName('PEPAGO').AsString = '2' then
                 LineaM.PePago := '10'
               else if FieldByName('PEPAGO').AsString = '3' then
                 LineaM.PePago := '13'
               else if FieldByName('PEPAGO').AsString = '4' then
                 LineaM.PePago := '16'
               else if FieldByName('PEPAGO').AsString = '5' then
                 LineaM.PePago := '19'
               else if FieldByName('PEPAGO').AsString = '6' then
                 LineaM.PePago := '22'
               else if FieldByName('PEPAGO').AsString = '9' then
                 LineaM.PePago := '23';

               Tmp := StrToCurr(FieldByName('VALINI').AsString);
               LineaM.ValIni := StringReplace(Format('%12s',[CurrToStr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
               Tmp := StrToCurr(FieldByName('VALDEU').AsString);
               LineaM.VSaldo := StringReplace(Format('%12s',[currtostr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
               LineaM.VGar := '000000000000'; // ojo
               Tmp := StrToCurr(FieldByName('VCUOTA').AsString);
               LineaM.VCuota := StringReplace(Format('%12s',[currtostr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);
               Tmp := StrToCurr(FieldByName('VALMOR').AsString);
               LineaM.ValMor := StringReplace(Format('%12s',[currtostr(int(Tmp/1000))]),' ','0',[rfReplaceAll]);


               LineaM.FInicial := IBQuery1.FieldByName('FECHA_DESEMBOLSO').AsString;
               LineaM.FTermi := IBQuery1.FieldByName('FECHA_VENCIMIENTO').AsString;
               LineaM.FUPago := '        ';
               LineaM.FechaC := Format('%.4d',[YearOf(DTfecha.Date)])+ Format('%.2d',[monthOf(DTfecha.Date)]) + Format('%.2d',[dayOf(DTfecha.Date)]);

               if FieldByName('NOVEDAD').AsString = '01' then
                 LineaM.Estado := '01'
               else if FieldByName('NOVEDAD').AsString = '12' then
                 LineaM.Estado := '04'
               else if FieldByName('NOVEDAD').AsString = '13' then
                 LineaM.Estado := '06'
               else if FieldByName('NOVEDAD').AsString = '05' then
                 LineaM.Estado := '07'
               else if FieldByName('NOVEDAD').AsString = '14' then
                 LineaM.Estado := '08'
               else LineaM.Estado := '01';

               if FieldByName('CALIFI').AsString = 'A' then
                 LineaM.Califi := '01'
               else if FieldByName('CALIFI').AsString = 'B' then
                 LineaM.Califi := '02'
               else if FieldByName('CALIFI').AsString = 'C' then
                 LineaM.Califi := '03'
               else if FieldByName('CALIFI').AsString = 'D' then
                 LineaM.Califi := '04'
               else if FieldByName('CALIFI').AsString = 'E' then
                 LineaM.Califi := '05';

               if LineaM.Estado = '06' then
                 LineaM.Califi := '06';

               if FieldByName('EDMORA').AsString = '001' then
                 LineaM.EdMora := '00'
               else if FieldByName('EDMORA').AsString = '030' then
                 LineaM.EdMora := '01'
               else if FieldByName('EDMORA').AsString = '060' then
                 LineaM.EdMora := '02'
               else if FieldByName('EDMORA').AsString = '090' then
                 LineaM.EdMora := '03'
               else if FieldByName('EDMORA').AsString = '120' then
                 LineaM.EdMora := '04'
               else if FieldByName('EDMORA').AsString = '150' then
                 LineaM.EdMora := '05'
               else if FieldByName('EDMORA').AsString = '180' then
                 LineaM.EdMora := '06'
               else if FieldByName('EDMORA').AsString = '210' then
                 LineaM.EdMora := '07'
               else if FieldByName('EDMORA').AsString = '240' then
                 LineaM.EdMora := '08'
               else if FieldByName('EDMORA').AsString = '270' then
                 LineaM.EdMora := '09'
               else if FieldByName('EDMORA').AsString = '300' then
                 LineaM.EdMora := '10'
               else if FieldByName('EDMORA').AsString = '330' then
                 LineaM.EdMora := '11'
               else if FieldByName('EDMORA').AsString = '360' then
                 LineaM.EdMora := '12'
               else LineaM.EdMora := '13';

               LineaM.ModoExt := '  ';
               LineaM.NatReest := '  ';
               LineaM.NumReest := '   ';
               LineaM.CCance := FieldByName('CCANCE').AsString;

               LineaM.ProbNoPago := '   ';
{               if (LineaM.EdMora = '00') or (LineaM.EdMora = '01') or (LineaM.EdMora = '02') then
                 LineaM.ProbNoPago := '000'
               else if (LineaM.EdMora = '03') then
                 LineaM.ProbNoPago := '010'
               else if (LineaM.EdMora = '04') then
                 LineaM.ProbNoPago := '020'
               else if (LineaM.EdMora = '05') then
                 LineaM.ProbNoPago := '030'
               else if (LineaM.EdMora = '06') then
                 LineaM.ProbNoPago := '040'
               else if (LineaM.EdMora = '07') then
                 LineaM.ProbNoPago := '050'
               else if (LineaM.EdMora = '08') then
                 LineaM.ProbNoPago := '060'
               else if (LineaM.EdMora = '09') then
                 LineaM.ProbNoPago := '070'
               else if (LineaM.EdMora = '10') then
                 LineaM.ProbNoPago := '080'
               else if (LineaM.EdMora = '11') then
                 LineaM.ProbNoPago := '090'
               else if (LineaM.EdMora = '12') or (LineaM.EdMora = '13') then
                 LineaM.ProbNoPago := '100'; }

               LineaM.TpIdOrig := '  ';
               LineaM.NoIdOrig := '              ';
               LineaM.TpEntOrig := '    ';
               LineaM.CodEntOrig := '          ';

               PlanoMovimientos.Add(LineaM.TRegistro + LineaM.TAccion + LineaM.JustAccion +
                                    LineaM.Numero + LineaM.CodSuc + LineaM.LineaC + LineaM.ModalC +
                                    LineaM.TpGar + LineaM.TpMone + LineaM.PePago + LineaM.ValIni +
                                    LineaM.VSaldo + LineaM.VGar + LineaM.VCuota + LineaM.ValMor +
                                    LineaM.FInicial + LineaM.FTermi + LineaM.FUPago + LineaM.FechaC +
                                    LineaM.Estado + LineaM.Califi + LineaM.EdMora + LineaM.ModoExt +
                                    LineaM.NatReest + LineaM.NumReest + LineaM.CCance + LineaM.ProbNoPago +
                                    LineaM.TpIdOrig + LineaM.NoIdOrig + LineaM.TpEntOrig + LineaM.CodEntOrig);

               SumaRegistros := SumaRegistros + 1;
               IBSClientes.Close;
              end; //fin de if deudor principal
            Next;
           end; // fin while
        end; // fin with
        CheckBox4.Checked := True;
end;

procedure TfrmConsolidarData.FinCifin;
var cadena:string;
    i1,i2 :Integer;
    J:Integer;
begin
// Generar Identificador
      cadena := '9';
      LineaF := cadena;
// Numero de Regitros
      cadena := StringReplace(Format('%8d',[SumaRegistros + 2]),' ','0',[rfReplaceAll]);
      LineaF := LineaF + cadena;

//      PlanoReporte.Add(LineaF);
      CheckBox6.Checked := True;
end;

end.
