unit UnitControlCobroCartera;
                                                                      
interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, DateUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvEdit, JvTypedEdit, Buttons, Grids,
  XStringGrid, DB, IBCustomDataSet, DBGrids, DBCtrls, IBSQL, IBQuery,
  ComCtrls, pr_Common, pr_TxClasses, DBClient, Menus, JvComponent,
  JvArrowBtn, ImgList, JvListComb, JvStaticText, JvComCtrls, JvLabel,
  JvBlinkingLabel, JvGroupBox, FR_Class, IdGlobal, FR_DSet, FR_DBSet,
  IBDatabase, JvProgressDlg, UnitDmGeneral, Mask, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, FR_Rich, FR_OLE, frRtfExp;


type
  TfrmControlCobroCartera = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    RGEstado: TRadioGroup;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDiasIni: TJvIntegerEdit;
    EdDiasFin: TJvIntegerEdit;
    Label4: TLabel;
    CmdProcesar: TBitBtn;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    GridColocaciones: TXStringGrid;
    DataSource1: TDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    IBSQL1: TIBQuery;
    Panel5: TPanel;
    CmdAgregar: TBitBtn;
    IBDataSet1: TIBQuery;
    CmdEliminar: TBitBtn;
    IBQuery1: TIBQuery;
    DataSource2: TDataSource;
    CmdOtraBusqueda: TBitBtn;
    IBDataSet1ID_AGENCIA: TSmallintField;
    IBDataSet1ID_COLOCACION: TIBStringField;
    IBDataSet1FECHA_OBSERVACION: TDateField;
    IBDataSet1OBSERVACION: TMemoField;
    IBDataSet1ES_OBSERVACION: TSmallintField;
    IBDataSet1ES_COMPROMISO: TSmallintField;
    IBDataSet1FECHA_COMPROMISO: TDateField;
    IBDataSet1PRIMER_APELLIDO: TIBStringField;
    IBDataSet1NOMBRE: TIBStringField;
    IBDataSet1COMPLETO: TStringField;
    IBSQL2: TIBSQL;
    IBTabla: TClientDataSet;
    IBTablaID_AGENCIA: TIntegerField;
    IBTablaID_COLOCACION: TStringField;
    IBTablaDESCRIPCION_ESTADO: TStringField;
    IBTablaCUENTA: TStringField;
    IBTablaID_IDENTIFICACION: TIntegerField;
    IBTablaID_PERSONA: TStringField;
    IBTablaNOMBRE: TStringField;
    IBTablaPRIMER_APELLIDO: TStringField;
    IBTablaSEGUNDO_APELLIDO: TStringField;
    IBTablaVALOR_DESEMBOLSO: TCurrencyField;
    IBTablaSALDO: TCurrencyField;
    IBTablaVALOR_CUOTA: TCurrencyField;
    IBTablaFECHA_DESEMBOLSO: TDateField;
    IBTablaFECHA_VENCIMIENTO: TDateField;
    IBTablaID_CLASIFICACION: TSmallintField;
    IBTablaID_EVALUACION: TStringField;
    IBTablaMORA: TIntegerField;
    IBTabla1: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    DateField1: TDateField;
    DateField2: TDateField;
    SmallintField1: TSmallintField;
    StringField8: TStringField;
    IntegerField3: TIntegerField;
    IBTabla1APORTES: TCurrencyField;
    IBTabla1AHORROS: TCurrencyField;
    IBTablaAPORTES: TCurrencyField;
    IBTablaAHORROS: TCurrencyField;
    ImageList: TImageList;
    IBSQL3: TIBSQL;
    JvGroupBox1: TJvGroupBox;
    JvBlinkingLabel1: TJvBlinkingLabel;
    PageBuscar: TJvPageControl;
    Tab1: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    CBtiposid: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    CmdActualizar1: TBitBtn;
    Tab2: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    EdCaptacion: TJvEdit;
    CBTiposCaptacion: TDBLookupComboBox;
    CmdActualizar2: TBitBtn;
    Tab3: TTabSheet;
    Label18: TLabel;
    EdColocacion: TJvEdit;
    CmdActualizar3: TBitBtn;
    EdNombre: TJvStaticText;
    GroupBox6: TGroupBox;
    CmdCompromisos: TBitBtn;
    EdFechaCompromiso: TDateTimePicker;
    DSTiposId: TDataSource;
    IBDSTiposId: TIBDataSet;
    IBDSTiposCaptacion: TIBDataSet;
    DSTiposCaptacion: TDataSource;
    IBSQL4: TIBSQL;
    PopupUtilidades: TPopupMenu;
    PopupExtractos: TPopupMenu;
    PopupMantenimientos: TPopupMenu;
    PopupInformes: TPopupMenu;
    BtnUtilidades: TJvArrowButton;
    Informacin1: TMenuItem;
    Garantas1: TMenuItem;
    Liquidacin1: TMenuItem;
    BtnExtractos: TJvArrowButton;
    Captaciones1: TMenuItem;
    Colocaciones1: TMenuItem;
    BtnMantenimientos: TJvArrowButton;
    Personas1: TMenuItem;
    BtnInformes: TJvArrowButton;
    PorMora1: TMenuItem;
    PorAportes1: TMenuItem;
    Panel6: TPanel;
    Label5: TLabel;
    EdTotalColocaciones: TStaticText;
    Label6: TLabel;
    EdTotalDeuda: TStaticText;
    RGTipoCuota: TRadioGroup;
    CmdCerrar: TBitBtn;
    PrimerAviso: TMenuItem;
    frReport1: TfrReport;
    frCompositeReport1: TfrCompositeReport;
    Costas1: TMenuItem;
    Rcostas: TprTxReport;
    CDcostas: TClientDataSet;
    CDhonorarios: TClientDataSet;
    CDcostasdebito: TCurrencyField;
    CDcostascredito: TCurrencyField;
    CDcostasdescripcion: TStringField;
    CDcostasfecha: TDateField;
    CDhonorariosdebito: TCurrencyField;
    CDhonorarioscredito: TCurrencyField;
    CDhonorariosdescripcion: TStringField;
    CDhonorariosfecha: TDateField;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    IBcarta: TIBQuery;
    IBTransaction1: TIBTransaction;
    RegistrodeCartas1: TMenuItem;
    IBTControlCobro: TIBTransaction;
    CmdImprimir: TBitBtn;
    frReport2: TfrReport;
    frDBDataSet3: TfrDBDataSet;
    MasivoCartas1: TMenuItem;
    CdCarta: TClientDataSet;
    CdCartaID_COLOCACION: TStringField;
    CdCartaFECHA: TDateField;
    CdCartaNOMBRE: TStringField;
    CdCartaDIRECCION: TStringField;
    CdCartaTIPO: TStringField;
    CdCartaDIAS: TIntegerField;
    JvProgreso: TJvProgressDlg;
    IBDatoCodeudor: TIBSQL;
    IbDireccion: TIBSQL;
    TabBuscaFecha: TTabSheet;
    Label3: TLabel;
    CmdActualizar4: TBitBtn;
    EdFechaAEvaluarI: TDateTimePicker;
    ReporteAportes: TprTxReport;
    EdFechaAEvaluarF: TDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    EdFechaGestionI: TDateTimePicker;
    Label13: TLabel;
    EdFechaGestionF: TDateTimePicker;
    CmdReporteGestion: TBitBtn;
    CDSObservacion: TClientDataSet;
    CDSObservacionFECHA: TDateField;
    CDSObservacionID_COLOCACION: TStringField;
    CDSObservacionASOCIADO: TStringField;
    CDSObservacionOBSERVACION: TMemoField;
    CDSObservacionFECHA_COMPROMISO: TDateField;
    CDSObservacionES_COMPROMISO: TBooleanField;
    CDSObservacionID_AGENCIA: TIntegerField;
    RepCobro: TprTxReport;
    ReporteMora: TprTxReport;
    SegundoAviso: TMenuItem;
    MasivoCartasSegundoAviso1: TMenuItem;
    frReportPrimerAviso: TfrReport;
    CartasdeCobro1: TMenuItem;
    frRichObject1: TfrRichObject;
    frRtfAdvExport1: TfrRtfAdvExport;
    procedure CmdProcesarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridColocacionesSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure IBDataSet1OBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IBDataSet1FECHA_OBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IBDataSet1FECHA_COMPROMISOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure CmdAgregarClick(Sender: TObject);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure CmdGarantiasClick(Sender: TObject);
    procedure CmdPersonalClick(Sender: TObject);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CmdCompromisosClick(Sender: TObject);
    procedure CmdEliminarClick(Sender: TObject);
    procedure CmdOtraBusquedaClick(Sender: TObject);
    procedure IBDataSet1COMPLETOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdFechaCompromisoExit(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure CmdRepAportesClick(Sender: TObject);
    procedure CmdInformesClick(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure CmdActualizar1Click(Sender: TObject);
    procedure CmdActualizar2Click(Sender: TObject);
    procedure CmdActualizar3Click(Sender: TObject);
    procedure EdCaptacionExit(Sender: TObject);
    procedure JvBlinkingLabel1Click(Sender: TObject);
    procedure Informacin1Click(Sender: TObject);
    procedure Garantas1Click(Sender: TObject);
    procedure Liquidacin1Click(Sender: TObject);
    procedure Captaciones1Click(Sender: TObject);
    procedure Colocaciones1Click(Sender: TObject);
    procedure Personas1Click(Sender: TObject);
    procedure PorMora1Click(Sender: TObject);
    procedure PorAportes1Click(Sender: TObject);
    procedure GridColocacionesDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure CartasdeCobro1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure Costas1Click(Sender: TObject);
    procedure RegistrodeCartas1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdImprimirClick(Sender: TObject);
    procedure frReport2GetValue(const ParName: String;
      var ParValue: Variant);
    procedure MasivoCartas1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdActualizar4Click(Sender: TObject);
    procedure CmdReporteGestionClick(Sender: TObject);
    procedure PrimerAvisoClick(Sender: TObject);
    procedure SegundoAvisoClick(Sender: TObject);
  private
    { Private declarations }
    FAgencia:Integer;
    FColocacion:string;
    TId:Integer;
    Doc:string;
    ciudad_col :string;// variables utilizadas en carta_cobro
    nombre_col :string;
    direccion_col :string;
    dia_vencimiento :string;
    mes_vencimiento :string;
    ano_vencimiento :string;
    observacion_col :string;
    id_persona_col :string;
    id_identificacion_col :Integer;
    barrio_col: string;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Inicializar;
    function BuscarAhorros(TipoId: integer; DocumentoId: string; FechaInicial:TDate; FechaFinal:TDate; Ano:string): Currency;
    function BuscarAportes(TipoId: integer; DocumentoId: string; FechaInicial:TDate; FechaFinal:TDate; Ano:string): Currency;
    function BuscarCuenta(TipoId: integer; DocumentoId: string): string;
    procedure InformeMora;
    procedure InformeAportes;
    procedure BuscarColocaciones;
    procedure CartaCobro;
    procedure imprimir_reporte(cadena: string);
    procedure costas;
  public
    { Public declarations }
    property IdAgencia:Integer read FAgencia Write FAgencia;
    property Colocacion:string read FColocacion Write FColocacion;
    property Id:Integer read TId Write TId;
    property Documento:string read Doc Write Doc;
  end;

var
  frmControlCobroCartera: TfrmControlCobroCartera;
  dmGeneral: TdmGeneral;
  Colocacion:string;
  Id:Integer;
  Documento:string;
  Nombres1:string;
  FechaCompromiso:TDate;
  FilaCol:Integer;
  TotalColocaciones:Integer;
  TotalDeuda:Currency;
  ActualizarGrid:Boolean;
  FechaInicial: TDate;
  FechaFinal:TDate;
  Ano:string;
  Emp:string;

implementation

uses UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso,UnitAgregarObservacion,
     UnitConsultaLiquidacion,UnitConsultaGarantias,
     UnitDireccionesAsociados, UnitVistaPreliminar,
     UnitConsultaExtractoCaptacion, UnitExtractoColocacion,
     UnitCreaciondePersona, UnitBuscarControlCobro, UnitBuscarPersona,
     UnitImpresion, unitMain, UnitExtractoCredito, UnitGeneraCartas;

{$R *.dfm}

procedure TfrmControlCobroCartera.CreateParams
   (var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle or WS_EX_APPWINDOW;
    WndParent := GetDesktopwindow;
  end;
end;

procedure TfrmControlCobroCartera.CmdProcesarClick(Sender: TObject);
var Fecha:TDate;
    NFecha:TDateTime;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
    Ahorros : Currency;
    Aportes : Currency;
    Dia:Word;
begin
        if ( EdDiasIni.Value > EdDiasFin.Value) then
        begin
           MessageDlg('Verifique los dias de mora',mtInformation,[mbcancel],0);
           Exit;
        end;

        CmdProcesar.Enabled := False;
        CmdCompromisos.Enabled := False;
        GroupBox1.Enabled := False;
        BtnInformes.Enabled := True;
        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;

       with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          case RGEstado.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION < 4)');
           1: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0)');
           2: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 1)');
           3: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 2)');
           4: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 3)');
          end;
          SQL.Add('and ');
          case RGTipoCuota.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_TIPO_CUOTA <= 3)');
           1: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 1)');
           2: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 2 or "col$colocacion".ID_TIPO_CUOTA = 3)');
          end;
//          SQL.Add('Order by "col$colocacion".ID_COLOCACION DESC');

          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          //
          SQL.Add('"col$colocacion".ID_LINEA,');
          //
          SQL.Add('"col$colocacion".ID_CLASIFICACION,');
          SQL.Add('"col$colocacion".ID_EVALUACION,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
          SQL.Add('"col$colocacion".DIAS_PAGO,');
          SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".COLOR,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');

          case RGEstado.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION < 4)');
           1: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0)');
           2: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 1)');
           3: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 2)');
           4: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 3)');
          end;
          SQL.Add('and ');
          case RGTipoCuota.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_TIPO_CUOTA <= 3)');
           1: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 1)');
           2: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 2 or "col$colocacion".ID_TIPO_CUOTA = 3)');
          end;
//          SQL.Add('Order by "col$colocacion".ID_COLOCACION DESC');
          SQL.Add('Order by "col$colocacion".ID_ESTADO_COLOCACION DESC, "col$colocacion".FECHA_INTERES DESC');

          try
            Open;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               CmdCompromisos.Enabled := True;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Buscando Colocaciones';
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Ejecutar;
              TotalDeuda := 0;
              TotalColocaciones :=0;
              while not Eof do begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
                Application.ProcessMessages;
{                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                if FieldByName('SALDO').AsCurrency > 0 then
                 begin
                   Dia := DayOf(FieldByName('FECHA_DESEMBOLSO').AsDateTime) + FieldByName('DIAS_PAGO').AsInteger;
                   // VALIDACION PARA LA LINEA CDAT y ESTADO JURIDICO
                   if (FieldByName('ID_LINEA').AsInteger = 6) then
                   begin
                     if TryEncodeDate(YearOf(Fecha),MonthOf(Fecha),Dia,NFecha) then
                        Fecha := NFecha;
                   end;
                   // FIN VALIDACION LINEA CDAT
                     Dias := DiasEntreFechas(IncDay(Fecha),FechaHoy,FieldByName('FECHA_DESEMBOLSO').AsDateTime + FieldByName('DIAS_PAGO').AsInteger);
                 end   }
                if FieldByName('SALDO').AsCurrency > 0 then
                begin
                  Dias := ObtenerDiasMora(FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_COLOCACION').AsString,IBSQL2);
                  if Dias < -1 then Dias := Dias + 2;

                end
                else
                 Dias := 0;
                if Dias < 0 then Dias := 0;
                if (EdDiasIni.Value  <= Dias) and
                   (Dias <= EdDiasFin.Value  ) then
                begin
                   ActualizarGrid := True;
                   Conteo := Conteo + 1;
                   GridColocaciones.RowCount := Conteo + 1;
                   GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                   GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                       FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                       FieldByName('NOMBRE').AsString;
                   GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                   TotalDeuda := TotalDeuda + FieldByName('SALDO').AsCurrency;
                   GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                   GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                   GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                   GridColocaciones.Cells[6,Conteo] := FieldByName('COLOR').AsString + '-' +FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                   GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                   GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                   Id := FieldByName('ID_IDENTIFICACION').AsInteger;
                   Documento := FieldByName('ID_PERSONA').AsString;
                   //Aportes := BuscarAportes(Id,Documento,FechaInicial,FechaFinal,Ano);
                   Aportes := 0;
                   Ahorros := 0;
                   //Ahorros := BuscarAhorros(Id,Documento,FechaInicial,FechaFinal,Ano);
                   GridColocaciones.Cells[11,Conteo] := FormatCurr('$#,#0.00',Ahorros);
                   GridColocaciones.Cells[12,Conteo] := FormatCurr('$#,#0.00',Aportes);
                   //INFORMACION PARA EL REGISTRO DE CARTAS
                   CdCarta.Append;
                   CdCarta.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                   Tipo := FieldByName('INTERES').AsString;
                   Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                   if Tipo = 'V' then
                     CdCarta.FieldByName('FECHA').AsDateTime := CalculoFecha(FieldByName('FECHA_INTERES').AsDateTime,Amortiza)
                   else
                     CdCarta.FieldByName('FECHA').AsDateTime := FieldByName('FECHA_INTERES').AsDateTime;
                   CdCarta.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                   IbDireccion.Close;
                   IbDireccion.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                   IbDireccion.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                   IbDireccion.ExecQuery;
                   CdCarta.FieldByName('DIRECCION').AsString := IbDireccion.FieldByName('BARRIO').AsString;
                   CdCarta.FieldByName('TIPO').AsString := 'DEUDOR';
                   CdCarta.FieldByName('DIAS').AsInteger := Dias;
                   CdCarta.Post;
                   //FIN INFORMACION REGISTRO DE CARTAS
                   IBTabla.Append;
                   IBTabla.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                   IBTabla.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                   IBTabla.FieldByName('DESCRIPCION_ESTADO').AsString := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   IBTabla.FieldByName('CUENTA').AsString := BuscarCuenta(Id,Documento);
                   IBTabla.FieldByName('ID_IDENTIFICACION').AsInteger := Id;
                   IBTabla.FieldByName('ID_PERSONA').AsString := Documento;
                   IBTabla.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
                   IBTabla.FieldByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
                   IBTabla.FieldByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
                   IBTabla.FieldByName('VALOR_DESEMBOLSO').AsCurrency := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                   IBTabla.FieldByName('SALDO').AsCurrency := FieldByName('SALDO').AsCurrency;
                   IBTabla.FieldByName('VALOR_CUOTA').AsCurrency := FieldByName('VALOR_CUOTA').AsCurrency;
                   IBTabla.FieldByName('FECHA_DESEMBOLSO').AsDateTime := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
                   IBTabla.FieldByName('FECHA_VENCIMIENTO').AsDateTime := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                   IBTabla.FieldByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                   IBTabla.FieldByName('ID_EVALUACION').AsString := FieldByName('ID_EVALUACION').AsString;
                   IBTabla.FieldByName('MORA').AsInteger := Dias;
                   IBTabla.FieldByName('APORTES').AsCurrency := Aportes;
                   IBTabla.FieldByName('AHORROS').AsCurrency := Ahorros;
                   IBTabla.Post;
                   ActualizarGrid := False;
                end;
                Next;
              end;
              TotalColocaciones := Conteo;
              EdTotalColocaciones.Caption := Format('%.6d',[TotalColocaciones]);
              EdTotalDeuda.Caption := FormatCurr('$#,#0',TotalDeuda);
              frmProgreso.Cerrar;
            end;
          except
            Screen.Cursor := Save_Cursor;
            Close;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            raise;
            Exit;
          end;
        end;
    Screen.Cursor := Save_Cursor;
end;

procedure TfrmControlCobroCartera.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmControlCobroCartera.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmControlCobroCartera.GridColocacionesSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
       if ARow < 1 then Exit;
       GroupBox4.Caption := 'Observaciones y Compromisos Colocación No.:' + GridColocaciones.Cells[0,ARow];
       Colocacion := GridColocaciones.Cells[0,ARow];
       Id := StrToInt(GridColocaciones.Cells[8,ARow]);
       Documento := GridColocaciones.Cells[9,ARow];
       Nombres1 := GridColocaciones.Cells[1,ARow];

       with IBDataSet1 do begin
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COLOCACION').AsString := GridColocaciones.Cells[0,ARow];
         try
           Open;
           CmdAgregar.Enabled := True;
           CmdImprimir.Enabled := True;
         except
           MessageDlg('Error al buscar datos de la colocación',mtError,[mbcancel],0);
           Exit;
         end;
       end;

end;

procedure TfrmControlCobroCartera.IBDataSet1OBSERVACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TfrmControlCobroCartera.IBDataSet1FECHA_OBSERVACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := DateToStr(Sender.AsDateTime);
end;

procedure TfrmControlCobroCartera.IBDataSet1FECHA_COMPROMISOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        if (DateToStr(Sender.AsDateTime) = '1899/12/30') or
           (DateToStr(Sender.AsDateTime) = '30/12/1899') then
           Text := ''
        else
           Text :=DateToStr(Sender.AsDateTime);
end;

procedure TfrmControlCobroCartera.CmdAgregarClick(Sender: TObject);
var frmAgregarObservacionCobro:TfrmAgregarObservacionCobro;
begin
     frmAgregarObservacionCobro := TfrmAgregarObservacionCobro.Create(Self);
     with frmAgregarObservacionCobro do begin
        if ShowModal = mrok then begin
           if IBSQL1.Transaction.InTransaction then
              IBSQL1.Transaction.Rollback;
           IBSQL1.Transaction.StartTransaction;
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('INSERT INTO "col$controlcobro" values(');
           IBSQL1.SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:FECHA_OBSERVACION,');
           IBSQL1.SQL.Add(':OBSERVACION,:ES_OBSERVACION,:ES_COMPROMISO,:FECHA_COMPROMISO,');
           IBSQL1.SQL.Add(':ID_USUARIO)');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
           IBSQL1.ParamByName('ID_COLOCACION').AsString := Colocacion;
           IBSQL1.ParamByName('FECHA_OBSERVACION').AsDate := FechaObs;
           IBSQL1.ParamByName('OBSERVACION').AsString := Memo;
           IBSQL1.ParamByName('ES_OBSERVACION').AsInteger := BooleanoToInt(Not EsCompromiso);
           IBSQL1.ParamByName('ES_COMPROMISO').AsInteger := BooleanoToInt(EsCompromiso);
           IBSQL1.ParamByName('ID_USUARIO').AsString := DBAlias;
           if EsCompromiso then
              IBSQL1.ParamByName('FECHA_COMPROMISO').AsDate := FechaCom
           else
              IBSQL1.ParamByName('FECHA_COMPROMISO').Clear;

           try
             IBSQL1.ExecSQL;
             IBSQL1.Transaction.Commit;
           except
             MessageDlg('Error Al Agregar Observación',mtError,[mbcancel],0);
           end;
        end;
        Free;
     end;


       with IBDataSet1 do begin
         if IBDataSet1.Transaction.InTransaction then
           IBDataSet1.Transaction.Commit;
         IBDataSet1.Transaction.StartTransaction;
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COLOCACION').AsString := Colocacion;
         try
           Open;
         except
           MessageDlg('Error al buscar datos de la colocación',mtError,[mbcancel],0);
           Exit;
         end;
       end;

end;

procedure TfrmControlCobroCartera.CmdLiquidarClick(Sender: TObject);
var frmConsultaLiquidacion:TfrmConsultaLiquidacion;
begin
        frmConsultaLiquidacion := TfrmConsultaLiquidacion.Create(Self);
        frmConsultaLiquidacion.Agencia := Agencia;
        frmConsultaLiquidacion.Colocacion := Colocacion;
        frmConsultaLiquidacion.ShowModal;
end;

procedure TfrmControlCobroCartera.CmdGarantiasClick(Sender: TObject);
var frmConsultaGarantias:TfrmConsultaGarantias;
begin
    frmConsultaGarantias := TfrmConsultaGarantias.Create(Self);
    frmConsultaGarantias.Agencia := Agencia;
    frmConsultaGarantias.IdColocacion := Colocacion;
    frmConsultaGarantias.ShowModal;
end;

procedure TfrmControlCobroCartera.CmdPersonalClick(Sender: TObject);
var frmDireccionesAsociado:TfrmDireccionesAsociado;
begin
    frmDireccionesAsociado := TfrmDireccionesAsociado.Create(Self);
    frmDireccionesAsociado.Id := Id;
    frmDireccionesAsociado.Documento := Documento;
    frmDireccionesAsociado.Nombre := Nombres1;
    frmDireccionesAsociado.ShowModal;
end;

procedure TfrmControlCobroCartera.EdNumeroColocacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmControlCobroCartera.FormShow(Sender: TObject);
begin
//        inicializar;
end;

procedure TfrmControlCobroCartera.CmdCompromisosClick(Sender: TObject);
var Fecha:TDate;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
begin
        CmdProcesar.Enabled := False;
        CmdCompromisos.Enabled := False;
        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('INNER JOIN "col$controlcobro" ON ("col$colocacion".ID_AGENCIA = "col$controlcobro".ID_AGENCIA and "col$colocacion".ID_COLOCACION = "col$controlcobro".ID_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('"col$controlcobro".ES_COMPROMISO <> 0 and "col$controlcobro".FECHA_COMPROMISO = :FECHA_COMPROMISO');
          ParamByName('FECHA_COMPROMISO').AsDate := FechaCompromiso;
          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;


        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".COLOR,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$controlcobro"');
          SQL.Add('INNER JOIN "col$colocacion" ON ("col$controlcobro".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$controlcobro".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('"col$controlcobro".ES_COMPROMISO <> 0 and "col$controlcobro".FECHA_COMPROMISO = :FECHA_COMPROMISO');
          ParamByName('FECHA_COMPROMISO').AsDate := FechaCompromiso;
          try
            Open;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               CmdCompromisos.Enabled := True;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Buscando Colocaciones';
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Ejecutar;
              TotalDeuda := 0;
              TotalColocaciones := 0;
              while not Eof do begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
                Application.ProcessMessages;
                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                Fecha := IncDay(Fecha);
                Dias := DiasEntre(Fecha,FechaHoy);
                   ActualizarGrid := True;
                   Conteo := Conteo + 1;
                   GridColocaciones.RowCount := Conteo + 1;
                   GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                   GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                       FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                       FieldByName('NOMBRE').AsString;
                   GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                   TotalDeuda := TotalDeuda + FieldByName('SALDO').AsCurrency;
                   GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                   GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                   GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                   GridColocaciones.Cells[6,Conteo] := FieldByName('COLOR').AsString + '-'+ FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                   GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                   GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                   Id := FieldByName('ID_IDENTIFICACION').AsInteger;
                   Documento := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[11,Conteo] := FormatCurr('$#,#0.00',BuscarAhorros(Id,Documento,FechaInicial,FechaFinal,Ano));
                   GridColocaciones.Cells[12,Conteo] := FormatCurr('$#,#0.00',BuscarAportes(Id,Documento,FechaInicial,FechaFinal,Ano));
                   ActualizarGrid := False;
                Next;
              end;
              TotalColocaciones := Conteo;
              EdTotalColocaciones.Caption := Format('%.6d',[TotalColocaciones]);
              EdTotalDeuda.Caption := FormatCurr('$#,#0',TotalDeuda);
              frmProgreso.Cerrar;
            end;
          except
            Screen.Cursor := Save_Cursor;
            Close;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            Exit;
          end;
        end;
    Screen.Cursor := Save_Cursor;

end;

procedure TfrmControlCobroCartera.CmdEliminarClick(Sender: TObject);
begin
        if (IBDataSet1.FieldByName('FECHA_OBSERVACION').AsDateTime = FechaHoy) and
           (IBDataSet1.FieldByName('ID_USUARIO').AsString = DBAlias) then
        begin
           if MessageDlg('Seguro de Eliminar Esta Observación?',mtConfirmation,[mbYes,mbNo],0) = mryes then begin
             IBDataSet1.Delete;
             IBDataSet1.Transaction.CommitRetaining;
           end;
        end;
end;

procedure TfrmControlCobroCartera.CmdOtraBusquedaClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmControlCobroCartera.Inicializar;
begin
         if IBTControlCobro.InTransaction  then
           IBTControlCobro.Rollback;
         IBTControlCobro.StartTransaction;

         ActualizarGrid := False;
         IBSQL1.Close;
         IBDataSet1.Close;
         IBQuery1.Open;
         IBQuery1.Last;
         GroupBox1.Enabled := True;
         RGEstado.ItemIndex := 0;
         RGTipoCuota.ItemIndex := 0;
         EdDiasIni.Value := 0;
         EdDiasFin.Value := 0;
         with GridColocaciones do begin
           RowCount := 2;
           Cells[0,1] := '';
           Cells[1,1] := '';
           Cells[2,1] := '';
           Cells[3,1] := '';
           Cells[4,1] := '';
           Cells[5,1] := '';
           Cells[6,1] := '';
           Cells[7,1] := '';
           Cells[8,1] := '';
           Cells[9,1] := '';
           Cells[10,1] := '';
         end;
//         RGEstado.SetFocus;
         CmdProcesar.Enabled := True;
         CmdCompromisos.Enabled := True;
         FechaHoy := fFechaActual;
         EdFechaCompromiso.Date := FechaHoy;
         FechaCompromiso := EdFechaCompromiso.Date;
         IBTabla.EmptyDataSet;

         IBDSTiposId.Open;
         IBDSTiposCaptacion.Open;
         PageBuscar.Enabled := True;
         PageBuscar.ActivePage := Tab1;

         CBtiposid.KeyValue := -1;
         EdNombre.Caption := '';
         EdNumeroIdentificacion.Text := '';
         CBTiposCaptacion.KeyValue := -1;
         EdCaptacion.Text := '';
         EdColocacion.Text := '';
         BtnInformes.Enabled := False;
         EdTotalColocaciones.Caption := '';
         EdTotalDeuda.Caption := '';
         Ano := IntToStr(YearOf(FechaHoy));
         FechaInicial := EncodeDate(YearOf(FechaHoy),01,01);
         FechaFinal := EncodeDate(YearOf(FechaHoy),12,31);
         EdFechaAEvaluarI.Date := FechaHoy;
         EdFechaAEvaluarF.Date := FechaHoy;
end;

procedure TfrmControlCobroCartera.IBDataSet1COMPLETOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := IBDataSet1NOMBRE.Value + ' '+ IBDataSet1PRIMER_APELLIDO.Value;
end;

function TfrmControlCobroCartera.BuscarAhorros(TipoId: integer;
  DocumentoId: string;FechaInicial:TDate;FechaFinal:TDate;Ano:string): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
begin
  with IBSQL2 do begin
     Close;
     sql.Clear;
     Sql.Add('select * from P_CAP_0019 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('ID_IDENTIFICACION').AsInteger := Id;
     ParamByName('ID_PERSONA').AsString := Documento;
     ExecQuery;
     Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     Digito := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;

     SQL.Clear;
     SQL.Add('Select SALDO_DISPONIBLE from SALDO_DISPONIBLE_JUD (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
     ParamByName('ANO').AsString := Ano;
     ParamByName('FECHA1').AsDate := FechaInicial;
     ParamByName('FECHA2').AsDate := FechaFinal;
     try
      ExecQuery;
      if RecordCount < 1 then
        Saldo := 0
      else
        Saldo := FieldByName('SALDO_DISPONIBLE').AsCurrency;
     except
      MessageDlg('Error Consultando Saldo Ahorros',mtError,[mbcancel],0);
      raise;
      Exit;
     end;
  end;
  Result := Saldo;
end;

function TfrmControlCobroCartera.BuscarAportes(TipoId: integer;
  DocumentoId: string;FechaInicial:TDate;FechaFinal:TDate;Ano:string): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
begin
   with IBSQL2 do begin
     Close;
     SQL.Clear;
     Sql.Add('select * from P_CAP_0019 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('ID_IDENTIFICACION').AsInteger := Id;
     ParamByName('ID_PERSONA').AsString := Documento;
     ExecQuery;
     Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     Digito := StrToInt(DigitoControl(1,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;

     SQL.Clear;
     SQL.Add('Select SALDO_DISPONIBLE from SALDO_DISPONIBLE_JUD (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
     ParamByName('ANO').AsString := Ano;
     ParamByName('FECHA1').AsDate := FechaInicial;
     ParamByName('FECHA2').AsDate := FechaFinal;
     try
      ExecQuery;
      if RecordCount < 1 then
        Saldo := 0
      else
        Saldo := FieldByName('SALDO_DISPONIBLE').AsCurrency;
     except
      MessageDlg('Error Consultando Saldo Aportes',mtError,[mbcancel],0);
      raise;
      Exit;
     end;
   end;
   Result := Saldo;
end;

procedure TfrmControlCobroCartera.DBGrid1DblClick(Sender: TObject);
begin
     frmAgregarObservacionCobro := TfrmAgregarObservacionCobro.Create(Self);
     with frmAgregarObservacionCobro do begin
       if IBDataSet1.RecordCount > 0 then begin
        EdFechaObservacion.Date  := IBDataSet1.FieldByName('FECHA_OBSERVACION').AsDateTime;
        EdFechaCompromiso.Date := IBDataSet1.FieldByName('FECHA_COMPROMISO').AsDateTime;
        Memo1.Text := IBDataSet1.FieldByName('OBSERVACION').AsString;
        ChkCompromiso.Checked := InttoBoolean(IBDataSet1.FieldByName('ES_COMPROMISO').AsInteger);
        ShowModal;
       end;
       Free;
     end;

end;

procedure TfrmControlCobroCartera.EdFechaCompromisoExit(Sender: TObject);
begin
        FechaCompromiso := EdFechaCompromiso.Date;
end;

function TfrmControlCobroCartera.BuscarCuenta(TipoId: integer;
  DocumentoId: string): string;
var
NumeroCuenta, DigitoCuenta : Integer;
begin
        with IBSQL2 do
         begin
           Close;
           sql.Clear;
           Sql.Add('select * from P_CAP_0016 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           ParamByName('ID_AGENCIA').AsInteger;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           ParamByName('ID_IDENTIFICACION').AsInteger := Id;
           ParamByName('ID_PERSONA').AsString := Documento;
           ExecQuery;
           NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
           DigitoCuenta := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
           Close;
         end;
         Result := FormatCurr('0000000',NumeroCuenta) + '-' + IntToStr(DigitoCuenta);
end;

procedure TfrmControlCobroCartera.CmdInformeClick(Sender: TObject);
begin
          Empleado;
          ReporteMora.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteMora.Variables.ByName['AGENCIA'].AsInteger := Agencia;
          ReporteMora.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          ReporteMora.Variables.ByName['NIT'].AsString := Nit;
          ReporteMora.Variables.ByName['MORAI'].AsInteger := EdDiasIni.Value;

          if ReporteMora.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReporteMora;
             frmVistaPreliminar.ShowModal;
           end;
end;

procedure TfrmControlCobroCartera.CmdRepAportesClick(Sender: TObject);
begin
         Empleado;
          ReporteAportes.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteAportes.Variables.ByName['AGENCIA'].AsInteger := Agencia;
          ReporteAportes.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          ReporteAportes.Variables.ByName['NIT'].AsString := Nit;
          ReporteAportes.Variables.ByName['MORAI'].AsInteger := EdDiasIni.Value;

          if ReporteAportes.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReporteAportes;
             frmVistaPreliminar.ShowModal;
           end;
end;

procedure TfrmControlCobroCartera.InformeMora;
begin
          Empleado;
          ReporteMora.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteMora.Variables.ByName['AGENCIA'].AsInteger := Agencia;
          ReporteMora.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          ReporteMora.Variables.ByName['NIT'].AsString := Nit;
          ReporteMora.Variables.ByName['MORAI'].AsInteger := EdDiasIni.Value;
          ReporteMora.Variables.ByName['FECHAEVALUARI'].AsDateTime := EdFechaAEvaluarI.Date;
          ReporteMora.Variables.ByName['FECHAEVALUARF'].AsDateTime := EdFechaAEvaluarF.Date;

          IBTabla.First;
          if ReporteMora.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReporteMora;
             frmVistaPreliminar.ShowModal;
           end;
end;

procedure TfrmControlCobroCartera.InformeAportes;
begin
         Empleado;
          ReporteAportes.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteAportes.Variables.ByName['AGENCIA'].AsInteger := Agencia;
          ReporteAportes.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          ReporteAportes.Variables.ByName['NIT'].AsString := Nit;
          ReporteAportes.Variables.ByName['MORAI'].AsInteger := EdDiasIni.Value;

          if ReporteAportes.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReporteAportes;
             frmVistaPreliminar.ShowModal;
           end;
end;

procedure TfrmControlCobroCartera.CmdInformesClick(Sender: TObject);
begin
   //     if CmdInformes.
end;

procedure TfrmControlCobroCartera.BuscarColocaciones;
var Fecha:TDate;
    NFecha:TDateTime;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
    Dia:Word;
begin
        CmdProcesar.Enabled := False;
        CmdCompromisos.Enabled := False;
        Conteo := 0;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          //
          SQL.Add('"col$colocacion".ID_LINEA,');
          //
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
          SQL.Add('"col$colocacion".DIAS_PAGO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".COLOR,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = :ID_PERSONA');
          SQL.Add('order by "col$colocacion".ID_ESTADO_COLOCACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id;
          ParamByName('ID_PERSONA').AsString := Documento;
          try
            Open;
            if RecordCount <= 0 then
            begin
               Close;
               CmdProcesar.Enabled := True;
               CmdCompromisos.Enabled := True;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              TotalDeuda := 0;
              TotalColocaciones := 0;
              nombre_col := FieldByName('NOMBRE').AsString + ' ' +FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
              id_persona_col := FieldByName('ID_PERSONA').AsString;
              while not Eof do begin
                if FieldByName('SALDO').AsCurrency > 0 then
                  Dias := ObtenerDiasMora(FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_COLOCACION').AsString,IBSQL2)
{                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                 begin
                   Dia := DayOf(FieldByName('FECHA_DESEMBOLSO').AsDateTime) + FieldByName('DIAS_PAGO').AsInteger;
                   //Validaci{on para el caso de linea CDAT y juridicos
                   if (FieldByName('ID_LINEA').AsInteger <> 6) or (FieldByName('ID_ESTADO_COLOCACION').AsInteger =    then
                   begin
                     if TryEncodeDate(YearOf(Fecha),MonthOf(Fecha),Dia,NFecha) then
                     Fecha := NFecha;
                   end;
                   Dias := DiasEntreFechas(IncDay(Fecha),FechaHoy,FieldByName('FECHA_DESEMBOLSO').AsDateTime + FieldByName('DIAS_PAGO').AsInteger);
                 end     }
                else
                 Dias := 0;
                if Dias < 0 then Dias := 0;
                ActualizarGrid := True;
                Conteo := Conteo + 1;
                GridColocaciones.RowCount := Conteo + 1;
                GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                    FieldByName('NOMBRE').AsString;
                GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                TotalDeuda := TotalDeuda + FieldByName('SALDO').AsCurrency;
                GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                GridColocaciones.Cells[6,Conteo] := FieldByName('COLOR').AsString + '-' + FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                Id := FieldByName('ID_IDENTIFICACION').AsInteger;
                Documento := FieldByName('ID_PERSONA').AsString;
                GridColocaciones.Cells[11,Conteo] := FormatCurr('$#,#0.00',BuscarAhorros(Id,Documento,FechaInicial,FechaFinal,Ano));
                GridColocaciones.Cells[12,Conteo] := FormatCurr('$#,#0.00',BuscarAportes(Id,Documento,FechaInicial,FechaFinal,Ano));
                if (FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString = 'VIGENTE') then
                  GridColocaciones.Canvas.Brush.Color := clMoneyGreen
                else if ((FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString = 'JURIDICO') or (FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString = 'CASTIGADO')) then
                  GridColocaciones.Canvas.Brush.Color := cl3DLight;
                GridColocaciones.Canvas.Refresh;
                ActualizarGrid := False;
                Next;
              end;
              TotalColocaciones := Conteo;
              EdTotalColocaciones.Caption := Format('%.6d',[TotalColocaciones]);
              EdTotalDeuda.Caption := FormatCurr('$#,#0',TotalDeuda);
              EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                FieldByName('NOMBRE').AsString;
            end;
          except
            Close;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            Exit;
          end;
        end;
end;

procedure TfrmControlCobroCartera.CmdBuscarClick(Sender: TObject);
var frmBusquedaControlcobro:TfrmBusquedaControlCobro;
begin
        frmBusquedaControlCobro := TfrmBusquedaControlCobro.Create(Self);
        frmBusquedaControlCobro.ShowModal;
        buscarcolocaciones;
end;

procedure TfrmControlCobroCartera.CmdActualizar1Click(Sender: TObject);
begin
        GroupBox1.Enabled := False;
        PageBuscar.ActivePage := Tab1;
        Id := CBtiposid.KeyValue;
        Documento := EdNumeroIdentificacion.Text;
        BuscarColocaciones;
end;

procedure TfrmControlCobroCartera.CmdActualizar2Click(Sender: TObject);
begin
        with IBSQL4 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select ID_PERSONA,ID_IDENTIFICACION from "cap$maestrotitular" where (');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
            SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" )');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := CBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCaptacion.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(CBTiposCaptacion.KeyValue,FormatCurr('0000000',StrToFloat(EdCaptacion.Text))));
            ExecQuery;
            if RecordCount > 0 then
            begin
              CBtiposid.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdNumeroIdentificacion.Text  := FieldByName('ID_PERSONA').AsString;
              CmdActualizar1.Click;
            end
            else
            begin
              MessageDlg('Persona no encontrada',mtError,[mbOk],0);
            end;
        end;
end;

procedure TfrmControlCobroCartera.CmdActualizar3Click(Sender: TObject);
begin
        with IBSQL4 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "col$colocacion" where ');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_COLOCACION = :"ID_COLOCACION" ');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := EdColocacion.Text;
            ExecQuery;
            if RecordCount > 0 then
            begin
              CBtiposid.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdNumeroIdentificacion.Text  := FieldByName('ID_PERSONA').AsString;
              CmdActualizar1.Click;
            end
            else
            begin
              MessageDlg('Persona no encontrada',mtError,[mbOk],0);
            end;
        end;
end;

procedure TfrmControlCobroCartera.EdCaptacionExit(Sender: TObject);
begin
        EdCaptacion.Text := FormatCurr('0000000',StrToFloat(EdCaptacion.Text));
end;

procedure TfrmControlCobroCartera.JvBlinkingLabel1Click(Sender: TObject);
begin
                frmBuscarPersona := TfrmBuscarPersona.Create(self);
                if frmBuscarPersona.ShowModal = mrOk then
                begin
                   Id := frmBuscarPersona.id_identificacion;
                   Documento := frmBuscarPersona.id_persona;
                   EdNumeroIdentificacion.Text := Documento;
                   CBtiposid.KeyValue := Id;
                   PageBuscar.ActivePage := Tab1;
                   CmdActualizar1.Click;
                end;
                frmBuscarPersona.Free;
end;

procedure TfrmControlCobroCartera.Informacin1Click(Sender: TObject);
begin
           frmDireccionesAsociado := TfrmDireccionesAsociado.Create(Self);
           frmDireccionesAsociado.Id := Id;
           frmDireccionesAsociado.Documento := Documento;
           frmDireccionesAsociado.Nombre := Nombres1;
           frmDireccionesAsociado.ShowModal;
end;

procedure TfrmControlCobroCartera.Garantas1Click(Sender: TObject);
begin
           frmConsultaGarantias := TfrmConsultaGarantias.Create(Self);
           frmConsultaGarantias.Agencia := Agencia;
           frmConsultaGarantias.IdColocacion := Colocacion;
           frmConsultaGarantias.ShowModal;
end;

procedure TfrmControlCobroCartera.Liquidacin1Click(Sender: TObject);
begin
           frmConsultaLiquidacion := TfrmConsultaLiquidacion.Create(Self);
           frmConsultaLiquidacion.Agencia := Agencia;
           frmConsultaLiquidacion.Colocacion := Colocacion;
           frmConsultaLiquidacion.ShowModal;
end;

procedure TfrmControlCobroCartera.Captaciones1Click(Sender: TObject);
var
Cuenta,digito:Integer;
begin
           IBSQL3.Close;
           IBSQL3.SQL.Clear;
           IBSQL3.SQL.Add('select * from P_CAP_0008_JUD (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           IBSQL3.ParamByName('ID_AGENCIA').AsInteger;
           IBSQL3.ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           IBSQL3.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
           IBSQL3.ParamByName('ID_PERSONA').AsString := Documento;
           IBSQL3.ExecQuery;
           Cuenta := IBSQL3.FieldByName('NUMERO_CUENTA').AsInteger;
           Digito := StrToInt(DigitoControl(2,FormatCurr('0000000',IBSQL3.FieldByName('NUMERO_CUENTA').AsInteger)));
           IBSQL3.Close;

           frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
           frmConsultaExtractoCaptacion.AgenciaA := agencia;
           frmConsultaExtractoCaptacion.Tipo := 2;
           frmConsultaExtractoCaptacion.Cuenta := Cuenta;
           frmConsultaExtractoCaptacion.Digito := Digito;
           frmConsultaExtractoCaptacion.ShowModal;
end;

procedure TfrmControlCobroCartera.Colocaciones1Click(Sender: TObject);
begin
//           FrmExtractoColocacion := TFrmExtractoColocacion.Create(Self);
//           FrmExtractoColocacion.AgenciaC := Agencia;
//           FrmExtractoColocacion.Colocacion := Colocacion;
//           FrmExtractoColocacion.ShowModal;
          frmExtractoCredito := TfrmExtractoCredito.Create(Self);
          frmExtractoCredito.AgenciaC := Agencia;
          frmExtractoCredito.Colocacion := Colocacion;
          frmExtractoCredito.ShowModal;
end;

procedure TfrmControlCobroCartera.Personas1Click(Sender: TObject);
begin
           frmCreacionPersona := TfrmCreacionPersona.Create(Self);
           frmCreacionPersona.Id := Id;
           frmCreacionPersona.Documento := Documento;
           frmCreacionPersona.ShowModal;
end;

procedure TfrmControlCobroCartera.PorMora1Click(Sender: TObject);
begin
        InformeMora;
end;

procedure TfrmControlCobroCartera.PorAportes1Click(Sender: TObject);
begin
        InformeAportes;
end;

procedure TfrmControlCobroCartera.GridColocacionesDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var Atributos:Smallint;
    Color :Longint;
    Recuadro:TRect;
    i:Integer;
begin
        Recuadro.Left := Rect.Left + 2;
        Recuadro.Top := Rect.Top + 4;
        Recuadro.Right := Rect.Right - 4;
        Recuadro.Bottom := Rect.Bottom - 2;
        Recuadro.TopLeft := Rect.TopLeft;
        Recuadro.BottomRight := Rect.BottomRight;

        Color := clBtnFace;

        if ARow=0 then begin
           Atributos := DT_VCENTER or DT_CENTER or DT_SINGLELINE;
           GridColocaciones.Canvas.Font.Style := [fsBold];
           GridColocaciones.Canvas.Font.Color := clBlack;
           GridColocaciones.Canvas.Brush.Color := clBtnFace;
         end  
        else
          begin
           case ACol of
           0..1: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           2..3: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           4..10: Atributos := DT_VCENTER or DT_LEFT or DT_SINGLELINE;
           11..12: Atributos := DT_VCENTER or DT_RIGHT or DT_SINGLELINE;
           end;

        end;

        with GridColocaciones do begin
         if (ARow > 0)  and (GridColocaciones.Cells[6,ARow] <> '') then
         begin
//         Canvas.Font.Style := [];
         case StrToInt(LeftStr(GridColocaciones.Cells[6,ARow],1)) of
          0 : begin
                Canvas.Brush.Color := clWhite;
                Canvas.Font.Color := clBlack;
              end;

          1 : begin
                Canvas.Brush.Color := clGreen;
                Canvas.Font.Color := clWhite;
              end;
          2 : begin
                Canvas.Brush.Color := $0000D2D2;
                Canvas.Font.Color := clBlack;
              end;
          3 : begin
                Canvas.Brush.Color := clRed;
                Canvas.Font.Color := clWhite;
              end;
          4 : begin
                Canvas.Brush.Color := clBlue;
                Canvas.Font.Color := clWhite;
              end;
          5 : begin
                Canvas.Brush.Color := clltGray;
                Canvas.Font.Color := clWhite;
              end;

          6 : begin
                Canvas.Brush.Color := clMaroon;
                Canvas.Font.Color := clWhite;
              end;
          7 : begin
                Canvas.Brush.Color := clGray;
                Canvas.Font.Color := clWhite;
              end;
          8 : begin
                Canvas.Brush.Color := clFuchsia;
                Canvas.Font.Color := clWhite;
              end;                 
         end;
         end;

        if (gdSelected in State) then begin
          Canvas.Brush.Color := clHighlight;
          Canvas.Font.Color := clHighlightText;
        end;

        Canvas.FillRect(Rect);
        DrawText(Canvas.Handle,PChar(Cells[Acol,ARow]),-1,Recuadro,
                  Atributos);
       end;

end;

procedure TfrmControlCobroCartera.CartaCobro;
var    fecha_interes :TDate;
       tipo_cuota :Integer;
       amortiza_interes :Integer;
       Municipio :string;
begin
        observacion_col := InputBox('Observación Adicional','Digite Su Observación','');
        with IBSQL3 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$colocacion"');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION and');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          tipo_cuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
          id_identificacion_col := FieldByName('ID_IDENTIFICACION').AsInteger;
          id_persona_col := FieldByName('ID_PERSONA').AsString;
          amortiza_interes := FieldByName('AMORTIZA_INTERES').AsInteger;
          if tipo_cuota = 2 then
          begin
            dia_vencimiento := FormatDateTime('dd',FieldByName('FECHA_INTERES').AsDate);
            mes_vencimiento := FormatDateTime('MMMM',FieldByName('FECHA_INTERES').AsDate);
            ano_vencimiento := FormatDateTime('yyyy',FieldByName('FECHA_INTERES').AsDate);
          end
          else
          if (tipo_cuota = 1) or (tipo_cuota = 3) then
          begin
             fecha_interes := calculofecha(FieldByName('FECHA_INTERES').AsDate,amortiza_interes);
             dia_vencimiento := FormatDateTime('dd',fecha_interes);
             mes_vencimiento := FormatDateTime('MMMM',fecha_interes);
             ano_vencimiento := FormatDateTime('yyyy',fecha_interes);
          end;
          Close;
          SQL.Clear;
          SQL.Add('select NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := id_persona_col;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_col;
          ExecQuery;
          nombre_col := FieldByName('NOMBRE').AsString + ' ' +FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('select DIRECCION,MUNICIPIO,BARRIO from "gen$direccion"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_DIRECCION = 1');
          ParamByName('ID_PERSONA').AsString := id_persona_col;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_col;
          ExecQuery;
          Municipio := FieldByName('MUNICIPIO').AsString;
          barrio_col := UpCaseFirst(FieldByName('BARRIO').AsString);
//          if (Municipio = 'OCAÑA') or (Municipio = 'OCANA') then
//             Municipio := Ciudad;
          direccion_col := UpCaseFirst(LowerCase(Municipio)) + ', '+ LowerCase(FieldByName('DIRECCION').AsString);
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia"');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          if Agencia = 1 then
             ciudad_col := Ciudad + FormatDateTime('dd-mmm-yyyy',Date)
          else
             ciudad_col := UpCaseFirst(LowerCase(FieldByName('DESCRIPCION_AGENCIA').AsString)) + ', '+ FormatDateTime('dd-mmm-yyyy',Date);
          Close;
        end;
        //if MessageDlg('La Carta fue Impresa ?.',mtInformation,[mbyes,mbno],0) = mryes then

end;

procedure TfrmControlCobroCartera.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Dictionary.Variables.Variable['EMPRESA'] := #39+Empresa+#39;
        frReport1.Dictionary.Variables.Variable['DESCRIPCION'] := #39+Description+#39;
        frReport1.Dictionary.Variables.Variable['NIT'] := #39+Nit+#39;
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal;
        FrmImpresion.Free;

end;

procedure TfrmControlCobroCartera.CartasdeCobro1Click(Sender: TObject);
begin
        if Role = 'CARTERA' then
        begin
          cartacobro;
          imprimir_reporte(frmMain.ruta1 + '\reporte\repcarta1.frf');
          if MessageDlg('La Carta Fue Impresa ?',mtInformation,[mbyes,mbno],0) = mryes then
          begin
            with IBcarta do
            begin
              Close;
              if Transaction.InTransaction then
                 Transaction.Commit;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('insert into "col$controlcarta" values (');
              SQL.Add(':ID_COLOCACION, :FECHA_REALIZACION, :ENTREGADO, :ID_PERSONA, :ID_IDENTIFICACION, :ID_EMPLEADO, :TIPO)');
              ParamByName('ID_COLOCACION').AsString := Colocacion;
              ParamByName('FECHA_REALIZACION').AsDate := Date;
              ParamByName('ENTREGADO').AsSmallInt := 0;
              ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
              ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
              ParamByName('ID_EMPLEADO').AsString := DBAlias;
              ParamByName('TIPO').AsString := 'D';
              ExecSQL;
              Transaction.Commit;
            end;
          end;
        end
        else
           MessageDlg('Solo la Sección de Cartera tiene Permisos.',mtInformation,[mbok],0)

end;

procedure TfrmControlCobroCartera.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'nombre' then
           ParValue := nombre_col;
        if ParName = 'direccion' then
           ParValue := direccion_col;
        if ParName = 'ciudad' then
           ParValue := ciudad_col;
        if ParName = 'colocacion' then
           ParValue := Colocacion;
        if ParName = 'dia' then
           ParValue := dia_vencimiento;
        if ParName = 'mes' then
           ParValue := mes_vencimiento;
        if ParName = 'ano' then
           ParValue := ano_vencimiento;
        if ParName = 'empresa' then
           ParValue := Empresa;
        if ParName = 'nit' then
           ParValue := Nit;
        if ParName = 'observacion' then
           ParValue := observacion_col;
        if ParName = 'id_persona' then
           ParValue := id_persona_col;
        if ParName = 'empleado_res' then
           ParValue := Nombres + ' ' + Apellidos;
        if ParName = 'barrio' then
           ParValue := barrio_col;
        if ParName = 'descripcion' then
           ParValue := Description;
end;

procedure TfrmControlCobroCartera.costas;
begin
// WHILE PARA COSTAS PAGADAS
        with IBSQL3 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$costas"');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION and');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA');
//          SQL.Add('VALOR_COSTAS <= 0');
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          while not Eof DO
          begin
             if FieldByName('VALOR_COSTAS').AsCurrency < 0 then
             begin
               CDcostas.Append;
               CDcostas.FieldValues['credito'] := abs(FieldByName('VALOR_COSTAS').AsCurrency);
               CDcostas.FieldValues['descripcion'] := FieldByName('DESCRIPCION').AsString;
               CDcostas.FieldValues['fecha'] := FieldByName('FECHA').AsDate;
               CDcostas.FieldValues['debito'] := 0;
               CDcostas.Post;
             end;
             if FieldByName('VALOR_COSTAS').AsCurrency > 0 then
             begin
               CDcostas.Append;
               CDcostas.FieldValues['credito'] := 0;
               CDcostas.FieldValues['descripcion'] := FieldByName('DESCRIPCION').AsString;
               CDcostas.FieldValues['fecha'] := FieldByName('FECHA').AsDate;
               CDcostas.FieldValues['debito'] := abs(FieldByName('VALOR_COSTAS').AsCurrency);
               CDcostas.Post;
             end;
             if abs(FieldByName('VALOR_HONORARIOS').AsCurrency) > 0 then
             begin
               CDhonorarios.Append;
               CDhonorarios.FieldValues['credito'] := abs(FieldByName('VALOR_HONORARIOS').AsCurrency);
               CDhonorarios.FieldValues['descripcion'] := FieldByName('DESCRIPCION').AsString;
               CDhonorarios.FieldValues['fecha'] := FieldByName('FECHA').AsDate;
               CDhonorarios.FieldValues['debito'] := 0;
               CDhonorarios.Post;
             end;
            Next;
          end;
        end;
// WHILE PARA COSTAS CARGADAS
{        with IBSQL3 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$costas"');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION and');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('VALOR_COSTAS >= 0');
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          while not Eof DO
          begin
             if abs(FieldByName('VALOR_HONORARIOS').AsCurrency) > 0 then
             begin
               CDhonorarios.Append;
               CDhonorarios.FieldValues['credito'] := abs(FieldByName('VALOR_HONORARIOS').AsCurrency);
               CDhonorarios.FieldValues['descripcion'] := FieldByName('DESCRIPCION').AsString;
               CDhonorarios.FieldValues['fecha'] := FieldByName('FECHA').AsDate;
               CDhonorarios.FieldValues['debito'] := 0;
               CDhonorarios.Post;
             end;
            Next;
          end;
        end;}

end;

procedure TfrmControlCobroCartera.Costas1Click(Sender: TObject);
begin
        CDcostas.CancelUpdates;
        CDhonorarios.CancelUpdates;
        costas;
        CDcostas.IndexFieldNames := 'fecha';
        CDhonorarios.IndexFieldNames := 'fecha';
        Empleado;
        imprimir_reporte(frmMain.ruta1 + '\reporte\repcostas.frf');
//ShowMessage(IntToStr(CDhonorarios.RecordCount));
end;

procedure TfrmControlCobroCartera.RegistrodeCartas1Click(Sender: TObject);
begin
        {if Role = 'CARTERA' then
        begin
          FrmControlCarta := TFrmControlCarta.Create(self);
          FrmControlCarta.ShowModal;
        end
        else
          MessageDlg('Solo la Sección de Cartera Tiene Acceso',mtWarning,[mbok],0);}
end;

procedure TfrmControlCobroCartera.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBDataSet1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBSQL3.Database := dmGeneral.IBDatabase1;
        IBSQL4.Database := dmGeneral.IBDatabase1;
        IBcarta.Database := dmGeneral.IBDatabase1;
        IBDSTiposId.Database := dmGeneral.IBDatabase1;
        IBDSTiposCaptacion.Database := dmGeneral.IBDatabase1;
        IBDatoCodeudor.Database := dmGeneral.IBDatabase1;
        IbDireccion.Database := dmGeneral.IBDatabase1;

        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTControlCobro.DefaultDatabase := dmGeneral.IBDatabase1;

        inicializar;
end;

procedure TfrmControlCobroCartera.CmdImprimirClick(Sender: TObject);
begin
        Empleado;
        Emp := Nombres + Apellidos;
        //FrmImpresion := TFrmImpresion.Create(self);
        //FrmImpresion.frPreview1.Clear;
        frReport2.LoadFromFile(frmMain.ruta1 + '\reporte\GestionCobro.frf');
        //frReport2.Preview := FrmImpresion.frPreview1;
        frReport2.ShowReport;
        //FrmImpresion.ShowModal
//        imprimir_reporte(frmMain.ruta1 + '\reporte\GestionCobro.frf');
end;

procedure TfrmControlCobroCartera.frReport2GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'nombre' then
           ParValue := Nombres1;
        if ParName = 'documento' then
           ParValue := Documento;
        if ParName = 'empleado' then
           ParValue := Emp;
end;

procedure TfrmControlCobroCartera.MasivoCartas1Click(Sender: TObject);
var     _sObservacion :string;
begin
        if Role <> 'CARTERA' then
           Exit;
        if CdCarta.RecordCount > 0 then
        begin
          JvProgreso.Maximum := CdCarta.RecordCount;
          JvProgreso.Text := 'Generando Cartas de Cobro....';
          JvProgreso.Show;
          CdCarta.First;
          if IBDatoCodeudor.Transaction.InTransaction then
             IBDatoCodeudor.Transaction.Rollback;
          IBDatoCodeudor.Transaction.StartTransaction;
          FrmGeneraCarta := TFrmGeneraCarta.Create(Self);
          FrmGeneraCarta.CdCartaReal.CancelUpdates;
          FrmGeneraCarta.CdObservacion.CancelUpdates;
          while not CdCarta.Eof do
          begin
             JvProgreso.Value := CdCarta.RecNo;
             FrmGeneraCarta.CdCartaReal.Append;
             FrmGeneraCarta.CdCartaReal.FieldByName('ID_COLOCACION').AsString := CdCarta.FieldByName('ID_COLOCACION').AsString;
             FrmGeneraCarta.CdCartaReal.FieldByName('FECHA').AsDateTime := CdCarta.FieldByName('FECHA').AsDateTime;
             FrmGeneraCarta.CdCartaReal.FieldByName('NOMBRE').AsString := CdCarta.FieldByName('NOMBRE').AsString;
             FrmGeneraCarta.CdCartaReal.FieldByName('DIRECCION').AsString := CdCarta.FieldByName('DIRECCION').AsString;
             FrmGeneraCarta.CdCartaReal.FieldByName('TIPO').AsString := 'DEUDOR';
             FrmGeneraCarta.CdCartaReal.FieldByName('NOMBRE_D').AsString := '';
             FrmGeneraCarta.CdCartaReal.FieldByName('TIPO_D').AsInteger := 1;
             FrmGeneraCarta.CdCartaReal.Post;
            with IBQuery1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select * from "col$colgarantias" where ID_COLOCACION = :ID_COLOCACION');
              ParamByName('ID_COLOCACION').AsString := CdCarta.FieldByName('ID_COLOCACION').AsString;
              Open;
              _sObservacion := 'CARTA DEUDOR';
              while not Eof do
              begin
                IBDatoCodeudor.Close;
                IBDatoCodeudor.ParamByName('ID_PERSONA').AsString := Trim(FieldByName('ID_PERSONA').AsString);
                IBDatoCodeudor.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                IBDatoCodeudor.ExecQuery;
                FrmGeneraCarta.CdCartaReal.Append;
                FrmGeneraCarta.CdCartaReal.FieldByName('ID_COLOCACION').AsString := CdCarta.FieldByName('ID_COLOCACION').AsString;
                FrmGeneraCarta.CdCartaReal.FieldByName('FECHA').AsDateTime := CdCarta.FieldByName('FECHA').AsDateTime;
                FrmGeneraCarta.CdCartaReal.FieldByName('NOMBRE').AsString := IBDatoCodeudor.FieldByName('NOMBRE').AsString;
                FrmGeneraCarta.CdCartaReal.FieldByName('DIRECCION').AsString := IBDatoCodeudor.FieldByName('BARRIO').AsString;
                FrmGeneraCarta.CdCartaReal.FieldByName('TIPO').AsString := 'CODEUDOR-' + FieldByName('CSC_GARANTIA').AsString;
                FrmGeneraCarta.CdCartaReal.FieldByName('NOMBRE_D').AsString := CdCarta.FieldByName('NOMBRE').AsString;
                FrmGeneraCarta.CdCartaReal.FieldByName('TIPO_D').AsInteger := 2;
                FrmGeneraCarta.CdCartaReal.FieldByName('DIAS').AsInteger := CdCarta.FieldByName('DIAS').AsInteger;
                FrmGeneraCarta.CdCartaReal.Post;
                _sObservacion := _sObservacion + '/' + 'CODEUDOR-' + FieldByName('CSC_GARANTIA').AsString;
                Next;
              end;
            end;
            FrmGeneraCarta.CdObservacion.Append;
            FrmGeneraCarta.CdObservacion.FieldByName('ID_COLOCACION').AsString := CdCarta.FieldByName('ID_COLOCACION').AsString;
            FrmGeneraCarta.CdObservacion.FieldByName('OBSERVACION').AsString := _sObservacion;
            FrmGeneraCarta.CdObservacion.FieldByName('DIAS').AsInteger := CdCartaDIAS.Value;
            FrmGeneraCarta.CdObservacion.Post;
            _sObservacion := '';
            CdCarta.Next;
          end;
          with IBQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select CIUDAD from "gen$agencia"');
            SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            Open;
//            if Agencia = 1 then
//               FrmGeneraCarta._sCiudad := 'Bucaramanga ' + FormatDateTime('dd-mmm-yyyy',Date)
//            else
               FrmGeneraCarta._sCiudad := UpCaseFirst(LowerCase(FieldByName('CIUDAD').AsString)) + ', '+ FormatDateTime('dd-mmm-yyyy',Date);
            Close;
          end;
          JvProgreso.Close;
          FrmGeneraCarta.JvRegistros.Caption := IntToStr(FrmGeneraCarta.CdCartaReal.RecordCount);
          FrmGeneraCarta.JvRango.Caption := IntToStr(EdDiasIni.Value) + ' - ' + IntToStr(EdDiasFin.Value);
          FrmGeneraCarta._iOpcion := 1;
          FrmGeneraCarta.ShowModal;
          FrmGeneraCarta.Free;
        end
        else
        begin
          FrmGeneraCarta := TFrmGeneraCarta.Create(Self);
          FrmGeneraCarta._iOpcion := 2;
          FrmGeneraCarta.ShowModal;
          FrmGeneraCarta.Free;
        end;
end;

procedure TfrmControlCobroCartera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

procedure TfrmControlCobroCartera.CmdActualizar4Click(Sender: TObject);
var
 Fecha:TDate;
    NFecha:TDateTime;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
    Ahorros : Currency;
    Aportes : Currency;
    Dia:Word;
begin
        CmdProcesar.Enabled := False;
        CmdCompromisos.Enabled := False;
        GroupBox1.Enabled := False;
        BtnInformes.Enabled := True;
        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;

       with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          case RGEstado.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION < 4)');
           1: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0)');
           2: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 1)');
           3: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 2)');
           4: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 3)');
          end;
          SQL.Add('and ');
          case RGTipoCuota.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_TIPO_CUOTA <= 3)');
           1: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 1)');
           2: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 2 or "col$colocacion".ID_TIPO_CUOTA = 3)');
          end;
//          SQL.Add('Order by "col$colocacion".ID_COLOCACION DESC');

          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          //
          SQL.Add('"col$colocacion".ID_LINEA,');
          //
          SQL.Add('"col$colocacion".ID_CLASIFICACION,');
          SQL.Add('"col$colocacion".ID_EVALUACION,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
          SQL.Add('"col$colocacion".DIAS_PAGO,');
          SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".COLOR,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');

          case RGEstado.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION < 4)');
           1: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0)');
           2: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 1)');
           3: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 2)');
           4: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 3)');
          end;
          SQL.Add('and ');
          case RGTipoCuota.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_TIPO_CUOTA <= 3)');
           1: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 1)');
           2: SQL.Add('("col$colocacion".ID_TIPO_CUOTA = 2 or "col$colocacion".ID_TIPO_CUOTA = 3)');
          end;
//          SQL.Add('Order by "col$colocacion".ID_COLOCACION DESC');
          SQL.Add('Order by "col$colocacion".ID_ESTADO_COLOCACION DESC, "col$colocacion".FECHA_INTERES DESC');

          try
            Open;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               CmdCompromisos.Enabled := True;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Buscando Colocaciones';
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Ejecutar;
              TotalDeuda := 0;
              TotalColocaciones :=0;
              while not Eof do begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
                Application.ProcessMessages;
                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                if (Int(EdFechaAEvaluarI.Date) <= Int(Fecha)) and (Int(Fecha) <= Int(EdFechaAEvaluarF.Date)) then
                 begin
                   ActualizarGrid := True;
                   Conteo := Conteo + 1;
                   GridColocaciones.RowCount := Conteo + 1;
                   GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                   GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                       FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                       FieldByName('NOMBRE').AsString;
                   GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                   TotalDeuda := TotalDeuda + FieldByName('SALDO').AsCurrency;
                   GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                   GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                   GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                   GridColocaciones.Cells[6,Conteo] := FieldByName('COLOR').AsString + '-' +FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                   GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                   GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                   Id := FieldByName('ID_IDENTIFICACION').AsInteger;
                   Documento := FieldByName('ID_PERSONA').AsString;
                   //Aportes := BuscarAportes(Id,Documento,FechaInicial,FechaFinal,Ano);
                   Aportes := 0;
                   Ahorros := 0;
                   //Ahorros := BuscarAhorros(Id,Documento,FechaInicial,FechaFinal,Ano);
                   GridColocaciones.Cells[11,Conteo] := FormatCurr('$#,#0.00',Ahorros);
                   GridColocaciones.Cells[12,Conteo] := FormatCurr('$#,#0.00',Aportes);
                   //INFORMACION PARA EL REGISTRO DE CARTAS
                   CdCarta.Append;
                   CdCarta.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                   Tipo := FieldByName('INTERES').AsString;
                   Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                   if Tipo = 'V' then
                     CdCarta.FieldByName('FECHA').AsDateTime := CalculoFecha(FieldByName('FECHA_INTERES').AsDateTime,Amortiza)
                   else
                     CdCarta.FieldByName('FECHA').AsDateTime := FieldByName('FECHA_INTERES').AsDateTime;
                   CdCarta.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                   IbDireccion.Close;
                   IbDireccion.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                   IbDireccion.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                   IbDireccion.ExecQuery;
                   CdCarta.FieldByName('DIRECCION').AsString := IbDireccion.FieldByName('BARRIO').AsString;
                   CdCarta.FieldByName('TIPO').AsString := 'DEUDOR';
                   CdCarta.FieldByName('DIAS').AsInteger := Dias;
                   CdCarta.Post;
                   //FIN INFORMACION REGISTRO DE CARTAS
                   IBTabla.Append;
                   IBTabla.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                   IBTabla.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                   IBTabla.FieldByName('DESCRIPCION_ESTADO').AsString := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   IBTabla.FieldByName('CUENTA').AsString := BuscarCuenta(Id,Documento);
                   IBTabla.FieldByName('ID_IDENTIFICACION').AsInteger := Id;
                   IBTabla.FieldByName('ID_PERSONA').AsString := Documento;
                   IBTabla.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
                   IBTabla.FieldByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
                   IBTabla.FieldByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
                   IBTabla.FieldByName('VALOR_DESEMBOLSO').AsCurrency := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                   IBTabla.FieldByName('SALDO').AsCurrency := FieldByName('SALDO').AsCurrency;
                   IBTabla.FieldByName('VALOR_CUOTA').AsCurrency := FieldByName('VALOR_CUOTA').AsCurrency;
                   IBTabla.FieldByName('FECHA_DESEMBOLSO').AsDateTime := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
                   IBTabla.FieldByName('FECHA_VENCIMIENTO').AsDateTime := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                   IBTabla.FieldByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                   IBTabla.FieldByName('ID_EVALUACION').AsString := FieldByName('ID_EVALUACION').AsString;
                   IBTabla.FieldByName('MORA').AsInteger := Dias;
                   IBTabla.FieldByName('APORTES').AsCurrency := Aportes;
                   IBTabla.FieldByName('AHORROS').AsCurrency := Ahorros;
                   IBTabla.Post;
                   ActualizarGrid := False;
                end;
                Next;
              end;
              TotalColocaciones := Conteo;
              EdTotalColocaciones.Caption := Format('%.6d',[TotalColocaciones]);
              EdTotalDeuda.Caption := FormatCurr('$#,#0',TotalDeuda);
              frmProgreso.Cerrar;
            end;
          except
            Screen.Cursor := Save_Cursor;
            Close;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            raise;
            Exit;
          end;
        end;
    Screen.Cursor := Save_Cursor;
end;

procedure TfrmControlCobroCartera.CmdReporteGestionClick(Sender: TObject);
var Fecha:TDate;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
begin
        CmdProcesar.Enabled := False;
        CmdCompromisos.Enabled := False;
        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$controlcobro"');
          SQL.Add('INNER JOIN "col$colocacion" ON ("col$colocacion".ID_AGENCIA = "col$controlcobro".ID_AGENCIA and "col$colocacion".ID_COLOCACION = "col$controlcobro".ID_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$controlcobro".FECHA_OBSERVACION BETWEEN :FECHA1 AND :FECHA2) AND ("col$controlcobro".ID_AGENCIA = :ID_AGENCIA)');
          ParamByName('FECHA1').AsDate := EdFechaGestionI.Date;
          ParamByName('FECHA2').AsDate := EdFechaGestionF.Date;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;


        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".COLOR,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES,');
          SQL.Add('"col$controlcobro".FECHA_OBSERVACION,');
          SQL.Add('"col$controlcobro".OBSERVACION,');
          SQL.Add('"col$controlcobro".ES_COMPROMISO,');
          SQL.Add('"col$controlcobro".FECHA_COMPROMISO');
          SQL.Add('FROM');
          SQL.Add('"col$controlcobro"');
          SQL.Add('INNER JOIN "col$colocacion" ON ("col$controlcobro".ID_AGENCIA = "col$colocacion".ID_AGENCIA and "col$controlcobro".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('("col$controlcobro".FECHA_OBSERVACION BETWEEN :FECHA1 AND :FECHA2) AND ("col$controlcobro".ID_AGENCIA = :ID_AGENCIA)');
          ParamByName('FECHA1').AsDate := EdFechaGestionI.Date;
          ParamByName('FECHA2').AsDate := EdFechaGestionF.Date;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          try
            Open;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               CmdCompromisos.Enabled := True;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Buscando Observaciones';
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Ejecutar;
              while not Eof do begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
                Application.ProcessMessages;
                CDSObservacion.Append;
                CDSObservacion.FieldByName('FECHA_OBSERVACION').AsDateTime := FieldByName('FECHA_OBSERVACION').AsDateTime;
                CDSObservacion.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                CDSObservacion.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                CDSObservacion.FieldByName('ASOCIADO').AsString := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                CDSObservacion.FieldByName('OBSERVACION').AsString := FieldByName('OBSERVACION').AsString;
                CDSObservacion.FieldByName('ES_COMPROMISO').AsBoolean := InttoBoolean(FieldByName('ES_COMPROMISO').AsInteger);
                if InttoBoolean(FieldByName('ES_COMPROMISO').AsInteger) Then
                begin
                  CDSObservacion.FieldByName('FECHA_COMPROMISO').AsString := DateToStr(FieldByName('FECHA_COMPROMISO').AsDateTime);
                end
                else
                begin
                  CDSObservacion.FieldByName('FECHA_COMPROMISO').AsString := '';
                end;
                CDSObservacion.Post;
                Next;
              end;
              TotalColocaciones := Conteo;
              EdTotalColocaciones.Caption := Format('%.6d',[TotalColocaciones]);
              EdTotalDeuda.Caption := FormatCurr('$#,#0',TotalDeuda);
              frmProgreso.Cerrar;

                        Empleado;
              RepCobro.Variables.ByName['EMPRESA'].AsString := Empresa;
              RepCobro.Variables.ByName['AGENCIA'].AsInteger := Agencia;
              RepCobro.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
              RepCobro.Variables.ByName['NIT'].AsString := Nit;
              RepCobro.Variables.ByName['FECHAEVALUARI'].AsDateTime := EdFechaGestionI.Date;
              RepCobro.Variables.ByName['FECHAEVALUARF'].AsDateTime := EdFechaGestionF.Date;

              CDSObservacion.First;
              if RepCobro.PrepareReport then
              begin
                frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
                frmVistaPreliminar.Reporte := RepCobro;
                frmVistaPreliminar.ShowModal;
              end;


            end;
          except
            Screen.Cursor := Save_Cursor;
            Close;
            MessageDlg('Error al buscar observaciones, consulte con el administrador del sistemas',mtError,[mbcancel],0);
            Exit;
          end;
        end;
    Screen.Cursor := Save_Cursor;

end;

procedure TfrmControlCobroCartera.PrimerAvisoClick(Sender: TObject);
var
  id_identificacion_col: Integer;
  id_persona_col: string;
  nombre_col: string;
  direccion_col: string;
  barrio_col: string;
  ciudad_col: string;
  telefono_col: string;

  tipo_cuota: Integer;
  amortiza_interes: Integer;
  fecha_interes: TDateTime;
  dia_vencimiento: string;
  mes_vencimiento: string;
  ano_vencimiento: string;

  Municipio: String;
begin
        if Role = 'CARTERA' then
        begin
          // Seleccion de Datos a Evaluar
        with IBSQL3 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$colocacion"');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION and');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_COLOCACION').AsString := Colocacion;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          tipo_cuota := FieldByName('ID_TIPO_CUOTA').AsInteger;
          id_identificacion_col := FieldByName('ID_IDENTIFICACION').AsInteger;
          id_persona_col := FieldByName('ID_PERSONA').AsString;
          amortiza_interes := FieldByName('AMORTIZA_INTERES').AsInteger;
          if tipo_cuota = 2 then
          begin
            dia_vencimiento := FormatDateTime('dd',FieldByName('FECHA_INTERES').AsDate);
            mes_vencimiento := FormatDateTime('MMMM',FieldByName('FECHA_INTERES').AsDate);
            ano_vencimiento := FormatDateTime('yyyy',FieldByName('FECHA_INTERES').AsDate);
          end
          else
          if (tipo_cuota = 1) or (tipo_cuota = 3) then
          begin
             fecha_interes := calculofecha(FieldByName('FECHA_INTERES').AsDate,amortiza_interes);
             dia_vencimiento := FormatDateTime('dd',fecha_interes);
             mes_vencimiento := FormatDateTime('MMMM',fecha_interes);
             ano_vencimiento := FormatDateTime('yyyy',fecha_interes);
          end;
          Close;
          SQL.Clear;
          SQL.Add('select NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := id_persona_col;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_col;
          ExecQuery;
          nombre_col := FieldByName('NOMBRE').AsString + ' ' +FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('select DIRECCION,MUNICIPIO,BARRIO, TELEFONO1, TELEFONO2, TELEFONO3, TELEFONO4 from "gen$direccion"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_DIRECCION = 1');
          ParamByName('ID_PERSONA').AsString := id_persona_col;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion_col;
          ExecQuery;
          Municipio := FieldByName('MUNICIPIO').AsString;
          barrio_col := UpCaseFirst(FieldByName('BARRIO').AsString);
//          if (Municipio = 'OCAÑA') or (Municipio = 'OCANA') then
//             Municipio := Ciudad;
          direccion_col := UpperCase(FieldByName('DIRECCION').AsString);
          telefono_col := FieldByName('TELEFONO1').AsString + ' - ' + FieldByName('TELEFONO2').AsString + ' - ' + FieldByName('TELEFONO3').AsString + ' - ' + FieldByName('TELEFONO4').AsString;
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia"');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          if Agencia = 1 then
             ciudad_col := Ciudad + FormatDateTime('dd-mmm-yyyy',Date)
          else
             ciudad_col := UpCaseFirst(LowerCase(FieldByName('DESCRIPCION_AGENCIA').AsString)) + ', '+ FormatDateTime('dd-mmm-yyyy',Date);
          Close;
        end;
          // Asignar Valores

          frReportPrimerAviso.LoadFromFile(frmMain.ruta1 + '\Reporte\PrimerAviso.frf');
          
          frReportPrimerAviso.Dictionary.Variables.Variable['DEUDOR'] := QuotedStr(nombre_col);
          frReportPrimerAviso.Dictionary.Variables.Variable['DIRECCION'] := QuotedStr(direccion_col);
          frReportPrimerAviso.Dictionary.Variables.Variable['TELEFONO'] := QuotedStr(telefono_col);
          frReportPrimerAviso.Dictionary.Variables.Variable['CIUDAD'] := QuotedStr(Municipio);
          frReportPrimerAviso.Dictionary.Variables.Variable['CREDITO'] := QuotedStr(Colocacion);

          if frReportPrimerAviso.PrepareReport then
             frReportPrimerAviso.ShowPreparedReport;


          // Imprimir Formato
          //imprimir_reporte(frmMain.ruta1 + '\reporte\repcarta1.frf');

        end
        else
           MessageDlg('Solo la Sección de Cartera tiene Permisos.',mtInformation,[mbok],0)

end;

procedure TfrmControlCobroCartera.SegundoAvisoClick(Sender: TObject);
begin
        if Role = 'CARTERA' then
        begin
          cartacobro;
          imprimir_reporte(frmMain.ruta1 + '\reporte\repcarta1.frf');
 
        end
        else
           MessageDlg('Solo la Sección de Cartera tiene Permisos.',mtInformation,[mbok],0)

end;

end.
