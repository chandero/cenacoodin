unit UnitEnteAgencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvStaticText, Mask, StdCtrls, Buttons, JvEdit, DBCtrls,
  ExtCtrls, JvTypedEdit, Grids, DBGrids, DB, DBClient, IBCustomDataSet, JclSysUtils,
  IBQuery, IBDatabase, ImgList, DateUtils, Math, FR_DSet, FR_DBSet,
  FR_Class, JvLabel, Menus, IdBaseComponent, IdComponent, IdTCPConnection, sdXmlDocuments,
  IdTCPClient, sdXmlObjectStorage, JvComponent, JvProgressDlg, JvThread,
  JvThreadTimer, IBSQL;

type
  TFrmEnteAgencias = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Msolicitud: TMaskEdit;
    BTbuscar: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    JVsolicitante: TJvStaticText;
    Label5: TLabel;
    JVid_persona: TJvStaticText;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    JvStaticText2: TJvStaticText;
    JVvalor: TJvCurrencyEdit;
    JVplazo: TJvIntegerEdit;
    EDgarantia: TEdit;
    EDinversion: TEdit;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    CDcodeudores: TClientDataSet;
    DScodeudores: TDataSource;
    IBTransaction1: TIBTransaction;
    Label2: TLabel;
    JVfecha: TJvStaticText;
    Label4: TLabel;
    JVcuenta: TJvStaticText;
    Label15: TLabel;
    JVcodeudores: TJvStaticText;
    Label16: TLabel;
    DBente: TDBLookupComboBox;
    DSente: TDataSource;
    IBente: TIBQuery;
    CDcodeudoresid_persona: TStringField;
    CDcodeudoresid_identificacion: TSmallintField;
    CDcodeudoresnombres: TStringField;
    CDcodeudoresdefinicion: TStringField;
    CDcodeudoresnumero: TSmallintField;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    Label17: TLabel;
    DBobservacion: TDBLookupComboBox;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    DSobservacion: TDataSource;
    ImageList1: TImageList;
    GroupBox7: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    JVcdat: TJvCurrencyEdit;
    JVjuvenil: TJvCurrencyEdit;
    JVaportes: TJvCurrencyEdit;
    JVahorro: TJvCurrencyEdit;
    JVcontractual: TJvCurrencyEdit;
    Rsi: TRadioButton;
    Rno: TRadioButton;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    JVvalora: TJvCurrencyEdit;
    JVplazoa: TJvIntegerEdit;
    JVtasaa: TJvFloatEdit2;
    DBlinea: TDBLookupComboBox;
    CHverifica: TCheckBox;
    Gaprobacion: TGroupBox;
    RAprobado: TRadioButton;
    Rnegado: TRadioButton;
    Gconcepto: TGroupBox;
    Mconcepto: TMemo;
    Raplazado: TRadioButton;
    Rfavorable: TRadioButton;
    Rnegativo: TRadioButton;
    Baceptar: TBitBtn;
    Bnuevo: TBitBtn;
    Binforme: TBitBtn;
    bacta: TBitBtn;
    frreport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    CDinfcodeudor: TClientDataSet;
    CDinfcodeudorinformacion: TStringField;
    CDinfcodeudordescripcion: TStringField;
    CDestado: TClientDataSet;
    CDestadoaprobado: TSmallintField;
    CDestadonegado: TSmallintField;
    CDestadoaplazado: TSmallintField;
    IBTransaction2: TIBTransaction;
    frDBDataSet2: TfrDBDataSet;
    Label28: TLabel;
    EDacta: TEdit;
    frDBDataSet3: TfrDBDataSet;
    CDfirmas: TClientDataSet;
    CDfirmasfirma: TStringField;
    frDBDataSet4: TfrDBDataSet;
    TabSheet3: TTabSheet;
    Label29: TLabel;
    JVdesembolso: TJvCurrencyEdit;
    JvLabel1: TJvLabel;
    JVabono: TJvIntegerEdit;
    CDparcial: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Bcerrar: TSpeedButton;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DTfechap: TDateTimePicker;
    JVparcial: TJvCurrencyEdit;
    JVnum: TJvStaticText;
    Panel6: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    CDparcialNumero: TSmallintField;
    CDparcialfecha: TDateField;
    CDparcialvalor: TCurrencyField;
    JVpagointeres: TJvStaticText;
    JVamortizacion: TJvStaticText;
    JVrespaldo: TJvStaticText;
    JVtipocuota: TJvStaticText;
    JVgarantia: TJvStaticText;
    Panel7: TPanel;
    Label33: TLabel;
    BitBtn9: TBitBtn;
    Label34: TLabel;
    JVresto: TJvCurrencyEdit;
    CHparcial: TCheckBox;
    Label35: TLabel;
    EDclasificacion: TEdit;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JVmes: TJvEdit;
    PopupMenu1: TPopupMenu;
    InformacinGeneral1: TMenuItem;
    DBImage1: TDBImage;
    IBfoto: TIBQuery;
    DataSource2: TDataSource;
    DBoficina: TDBLookupComboBox;
    Label36: TLabel;
    IdTCPClient1: TIdTCPClient;
    DSoficina: TDataSource;
    IBoficina: TIBQuery;
    CDobservacion: TClientDataSet;
    CDobservacionobservacion: TStringField;
    CDobservacionid_observacion: TIntegerField;
    CDtipoobservacion: TClientDataSet;
    CDtipoobservaciontipo: TIntegerField;
    CDtipoobservaciondescripcion: TStringField;
    CDcreditos: TClientDataSet;
    CDcreditosid_colocacion: TStringField;
    CDcreditosid_persona: TStringField;
    CDcreditosvalor_cuota: TCurrencyField;
    CDcreditosfecha_capital: TDateField;
    CDcreditosfecha_interes: TDateField;
    CDcreditossaldo: TCurrencyField;
    CDfianzas: TClientDataSet;
    CDfianzasid_colocacion: TStringField;
    CDfianzasfecha_interes: TDateField;
    CDfianzassaldo: TCurrencyField;
    CDfianzasestado: TStringField;
    CDfianzasid_persona: TStringField;
    CDfianzasvalor_desembolso: TCurrencyField;
    CDcapacidad: TClientDataSet;
    CDcapacidadid_identificacion: TSmallintField;
    CDcapacidadingresos: TCurrencyField;
    CDcapacidaddeducciones: TCurrencyField;
    CDcapacidaddisponible: TCurrencyField;
    CDcapacidadvalor_cuota: TCurrencyField;
    CDcapacidaddisp_pago: TCurrencyField;
    CDcapacidadsolv_economica: TSmallintField;
    CDcapacidadid_persona: TStringField;
    CDcapacidaddefinicion: TStringField;
    CDcapacidadexp_creditos: TStringField;
    CDdescuentos: TClientDataSet;
    CDdescuentosid_colocacion: TStringField;
    CDconcepto: TClientDataSet;
    CDconceptotipo: TIntegerField;
    CDconceptoconcepto: TStringField;
    CDtipoobservacionobservacion: TStringField;
    CDconceptodescripcion: TStringField;
    IBlinea: TIBQuery;
    DSlinea: TDataSource;
    CDfoto: TClientDataSet;
    CDfotofoto: TBlobField;
    DataSource3: TDataSource;
    BitBtn11: TBitBtn;
    IBTransaction3: TIBTransaction;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    IBSQL5: TIBSQL;
    CDestadobancoldex: TSmallintField;
    IBQuery1: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure MconceptoExit(Sender: TObject);
    procedure CHverificaClick(Sender: TObject);
    procedure BcerrarClick(Sender: TObject);
    procedure BnuevoClick(Sender: TObject);
    procedure BinformeClick(Sender: TObject);
    procedure frreport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure MsolicitudExit(Sender: TObject);
    procedure BaceptarClick(Sender: TObject);
    procedure bactaClick(Sender: TObject);
    procedure JVvaloraExit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure JVplazoaExit(Sender: TObject);
    procedure DBoficinaExit(Sender: TObject);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure DBImage1DblClick(Sender: TObject);
    procedure JVExecute(Sender: TObject; params: Pointer);
    procedure BitBtn11Click(Sender: TObject);
  private
  codigo_ente :Integer;
    id_persona: string;
    id_identificacion: integer;
    oficina: integer;
    desc_linea: string;
    es_parcial :Boolean;
    n_analista: string;
    id_analisis: string;
    id_linea: integer;
    host_server: string;
    puerto_server: integer;
    Astream :TStringStream;
    XmlDoc,Xmlres :TsdXmlDocument;
    tamano :Integer;
    nodo :TXmlNode;
    nodo1 :TXmlNode;
    estado_solicitud: integer;
    v_ingresos: currency;
    v_valorcuota: currency;
    v_dispago: currency;
    a: integer;
    valida_tcp: boolean;
    id_garantia: integer;
    procedure aportes;
    procedure limpiar;
    procedure imprimir_reporte(cadena: string);
    procedure registra_solicitud(estado:Integer);
    procedure registra_observacion(id_observacion: integer;
      concepto: string);
    procedure reporte;
    procedure firmas(ente:string);
    function verifica_pago : Boolean;
    function verifica_saldo: boolean;
    procedure desembolso(opcion:Smallint);
    function retorna_fecha: tdate;
    procedure registrar;
    { Private declarations }
  public
  published
    procedure cmChildKey(var msg: TWMKEY); message CM_CHILDKEY;
    { Public declarations }
  end;

var
  FrmEnteAgencias: TFrmEnteAgencias;
  LineaBancoldex:string;
  Bancoldex:Boolean;
  SaldoBancoldex:Currency;  
  const num_codeudor: array[0..25] of string = ('CERO','UNO','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE','DIEZ','OCNCE','DOCE','TRECE','CATORCE','QUINCE','DIECISEIS','DIECISIETE','DIECIOCHO','DIECINUEVE','VEINTE','VEINTIUNO','VEINTIDOS','VEINTITRES','VEINTICUATRO','VEINTICINCO');
implementation

uses UnitDmSolicitud, UnitAnalisisPago, UnitDesreferencias,
  UnitCreditosFianzas, UnitDescObservacion, UnitInfGeneral, UnitImpresion,
  UnitMain, UnitConsultaProductos, unitGlobales, UnitProgreso,
  UnitPantallaProgreso,ZLibEx, UnitInformacionBancoldexEnte, UnitGlobalesCol;

{$R *.dfm}

procedure TFrmEnteAgencias.FormCreate(Sender: TObject);
begin
        IBente.Open;
        IBente.Last;
        IBoficina.Open;
        IBoficina.Last;
        DBoficina.KeyValue := 2;
        IBlinea.Open;
        IBlinea.Last;
        DmSolicitud := TDmSolicitud.Create(self);
        PageControl1.ActivePageIndex := 0;
end;

procedure TFrmEnteAgencias.cmChildKey(var msg: TWMKEY);
begin
if msg.CharCode = VK_RETURN then
    if not (Assigned(ActiveControl) and
           ((ActiveControl is TButton) or
            (ActiveControl is TCustomMemo)))
    then begin
      msg.Result := 1;
      keybd_event(VK_TAB, MapVirtualKey(VK_TAB,0), 0, 0);
      Keybd_event(VK_TAB, MapVirtualKey(VK_TAB,0), KEYEVENTF_KEYUP, 0);
    end;
end;

procedure TFrmEnteAgencias.BitBtn3Click(Sender: TObject);
begin
          with CDcapacidad do
          begin
            Filtered := False;
            Filter := 'id_persona = ' + CDcodeudoresid_persona.Value;
            Filtered := True;
            FrmAnalisisPago := TFrmAnalisisPago.Create(self);
            FrmAnalisisPago.Caption := 'Análisis de ' + CDcodeudoresnombres.Value;
            FrmAnalisisPago.JVinresos.Value := FieldByName('ingresos').AsCurrency;
            FrmAnalisisPago.JVdeduccion.Value := FieldByName('deducciones').AsCurrency;
            FrmAnalisisPago.JVdisponible.Value := FieldByName('disponible').AsCurrency;
            FrmAnalisisPago.JVdisppago.Value := FieldByName('disp_pago').AsCurrency;
            FrmAnalisisPago.JVcuota.Value := FieldByName('valor_cuota').AsCurrency;
            FrmAnalisisPago.JVsolvencia.Checked := IntToBool(abs(FieldByName('solv_economica').AsInteger));
            FrmAnalisisPago.JVexperencia.Text := FieldByName('exp_creditos').AsString;
            FrmAnalisisPago.ShowModal;
          end;
end;

procedure TFrmEnteAgencias.BitBtn4Click(Sender: TObject);
begin
        FrmReferencias.ShowModal;
end;

procedure TFrmEnteAgencias.BitBtn5Click(Sender: TObject);
var     valor_creditos :Currency;
begin
          valor_creditos := 0;
          FrmCreditosFianzas := TFrmCreditosFianzas.Create(self);
          FrmCreditosFianzas.Caption := 'Creditos de : '+CDcodeudoresnombres.Text;
          with CDcreditos do
          begin
            Filtered := False;
            Filter := 'id_persona = ' +  CDcodeudoresid_persona.Value;
            Filtered := True;
            if RecordCount = 0 then
            begin
              MessageDlg('No Posee Créditos Vigentes',mtInformation,[mbok],0);
              Exit;
            end;
            while not Eof do
            begin
               valor_creditos := valor_creditos + FieldByName('saldo').AsCurrency;
               FrmCreditosFianzas.CDcredito.Append;
               FrmCreditosFianzas.CDcredito.FieldValues['colocacion'] := FieldByName('id_colocacion').AsString;
               FrmCreditosFianzas.CDcredito.FieldValues['saldo'] := FieldByName('saldo').AsCurrency;
               FrmCreditosFianzas.CDcredito.FieldValues['fecha'] := FieldByName('fecha_interes').AsDateTime;
               FrmCreditosFianzas.CDcredito.FieldValues['estado'] := FieldByName('fecha_capital').AsString;
               FrmCreditosFianzas.CDcredito.FieldValues['valor'] :=  FieldByName('valor_cuota').AsCurrency;
               FrmCreditosFianzas.CDcredito.Post;
               Next;
            end;
            FrmCreditosFianzas.DBGrid1.Columns[1].Title.Caption := 'Valor Cuota';
            FrmCreditosFianzas.DBGrid1.Columns[4].Title.Caption := 'Fecha Capital';
            FrmCreditosFianzas.label1.Caption := 'Total Saldo Créditos Vigentes';
            FrmCreditosFianzas.valor.Value := valor_creditos;
            FrmCreditosFianzas.ShowModal;
          end;

end;

procedure TFrmEnteAgencias.BitBtn1Click(Sender: TObject);
var     valor_creditos :Currency;
begin
          valor_creditos := 0;
          FrmCreditosFianzas := TFrmCreditosFianzas.Create(self);
          FrmCreditosFianzas.Caption := 'Fianzas de : '+CDcodeudoresnombres.Text;
          with CDfianzas do
          begin
            Filtered := False;
            Filter := 'id_persona = ' + CDcodeudoresid_persona.Value;
            Filtered := True;
            if RecordCount = 0 then
            begin
              MessageDlg('No Posee Fianzas Vigentes',mtInformation,[mbok],0);
              Exit;
            end;
            while not Eof do
            begin
               valor_creditos := valor_creditos + FieldByName('saldo').AsCurrency;
               FrmCreditosFianzas.CDcredito.Append;
               FrmCreditosFianzas.CDcredito.FieldValues['colocacion'] := FieldByName('id_colocacion').AsString;
               FrmCreditosFianzas.CDcredito.FieldValues['saldo'] := FieldByName('saldo').AsCurrency;
               FrmCreditosFianzas.CDcredito.FieldValues['fecha'] := FieldByName('fecha_interes').AsDateTime;
               FrmCreditosFianzas.CDcredito.FieldValues['estado'] := FieldByName('estado').AsString;
               FrmCreditosFianzas.CDcredito.FieldValues['valor'] := FieldByName('valor_desembolso').AsCurrency;
               FrmCreditosFianzas.CDcredito.Post;
               Next;
            end;
            FrmCreditosFianzas.label1.Caption := 'Total Saldo Fianzas Vigentes';
            FrmCreditosFianzas.valor.Value := valor_creditos;
            FrmCreditosFianzas.Caption := 'Fianzas de ' + CDcodeudoresnombres.Value;
            FrmCreditosFianzas.ShowModal;
          end;

end;

procedure TFrmEnteAgencias.BitBtn6Click(Sender: TObject);
var       filtro :string;
begin
          CDobservacion.Filtered := False;
          filtro :=  'id_observacion = ' + IntToStr(DBobservacion.KeyValue);
          CDobservacion.Filter := filtro;
          CDobservacion.Filtered := True;
          FrmDescObsrevacion := TFrmDescObsrevacion.Create(Self);
          FrmDescObsrevacion.Caption := DBobservacion.Text;
          FrmDescObsrevacion.Mobservacion.Text := CDobservacion.FieldByName('observacion').AsString;
          FrmDescObsrevacion.ShowModal;
end;

procedure TFrmEnteAgencias.aportes;
begin
end;

procedure TFrmEnteAgencias.MconceptoExit(Sender: TObject);
begin
        Mconcepto.Text := UpperCase(Mconcepto.Text);
end;

procedure TFrmEnteAgencias.CHverificaClick(Sender: TObject);
begin
        if CHverifica.Checked then
        begin
           Rfavorable.Visible := True;
           Rnegativo.Visible := True;
           Rfavorable.Checked := True;
           RAprobado.Visible := False;
           Rnegado.Visible := False;
           Raplazado.Visible := False;
           CHparcial.Enabled := False;
           Gaprobacion.Caption := 'Concepto Comite de Creditos';
           Gconcepto.Caption := 'Observaciones Comite de Créditos';
        end
        else
        begin
           Rfavorable.Visible := False;
           Rnegativo.Visible := False;
           RAprobado.Visible := true;
           RAprobado.Checked := True;
           Rnegado.Visible := true;
           Raplazado.Visible := true;
           CHparcial.Enabled := True;
           Gaprobacion.Caption := 'Aprobación o Negación de Solicitudes de Credito';
           Gconcepto.Caption := 'Observación Ente Aprobador';
        end;
end;

procedure TFrmEnteAgencias.limpiar;
begin
        CDfianzas.CancelUpdates;
        CDcreditos.CancelUpdates;
        CDcapacidad.CancelUpdates;
        CDdescuentos.CancelUpdates;
        CDobservacion.CancelUpdates;
        CDtipoobservacion.CancelUpdates;
        CDcodeudores.CancelUpdates;
        IBfoto.Close;
        EDclasificacion.Text := '';
        Panel1.Enabled := True;
        Msolicitud.Text := '';
        DBente.KeyValue := -1;
        JVid_persona.Caption := '';
        JVsolicitante.Caption := '';
        JVcodeudores.Caption := '';
        JVcuenta.Caption := '';
        JVfecha.Caption := '';
        JVvalor.Value := 0;
        EDgarantia.Text := '';
        JVplazo.Value := 0;
        EDinversion.Text := '';
        DBobservacion.KeyValue := -1;
        JVaportes.Value := 0;
        JVahorro.Value := 0;
        JVcontractual.Value := 0;
        JVcdat.Value := 0;
        JVjuvenil.Value := 0;
        Rno.Checked := False;
        Rsi.Checked := False;
        RAprobado.Checked := True;
        Rnegado.Checked := False;
        Raplazado.Checked := False;
        Rfavorable.Checked := False;
        Rnegativo.Checked := False;
        RAprobado.Visible := True;
        Rnegado.Visible := True;
        Raplazado.Visible := True ;
        Rfavorable.Visible := False;
        Rnegativo.Visible := False;
        Mconcepto.Text := '';
        CDcodeudores.CancelUpdates;
        Gaprobacion.Caption := 'Aprobación o Negación de Solicitudes de Credito';
        Gconcepto.Caption := 'Observación Ente Aprobador';
        JVvalora.Value := 0;
        JVplazoa.Value := 0;
        JVtasaa.Value := 0;
        DBlinea.KeyValue := -1;
        PageControl1.ActivePageIndex := 0;
        PageControl1.Enabled := False;
        Baceptar.Enabled := True;
        bacta.Enabled := False;
        Binforme.Enabled := False;
        EDacta.Text := '';
        JVamortizacion.Caption := '';
        JVpagointeres.Caption := '';
        JVrespaldo.Caption := '';
        JVgarantia.Caption := '';
        JVtipocuota.Caption := '';
        CHparcial.Checked := False;
        CHverifica.Checked := False;        
        DBlinea.KeyValue := -1;
        Bancoldex := False;
        LineaBancoldex := '';
        DBoficina.SetFocus;
end;

procedure TFrmEnteAgencias.BcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmEnteAgencias.BnuevoClick(Sender: TObject);
begin
        TabSheet1.Enabled := True;
        TabSheet2.Enabled := True;
        TabSheet3.TabVisible := False;
        CDfoto.CancelUpdates;
        limpiar;
end;

procedure TFrmEnteAgencias.BinformeClick(Sender: TObject);
begin
        //reporte;
        if CHverifica.Checked then
          imprimir_reporte(frmMain.wpath+'reporte\repinfconsejo_of.frf')
        else
          imprimir_reporte(frmMain.wpath+'reporte\repinforme_of.frf');
end;

procedure TFrmEnteAgencias.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;


procedure TFrmEnteAgencias.frreport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'cuenta' then
           ParValue := JVcuenta.Caption;
        if ParName = 'asociado' then
           ParValue := JVsolicitante.Caption;
        if ParName = 'ente' then
           ParValue := DBente.Text;
        if ParName = 'linea' then
           ParValue := DBlinea.Text;
        if ParName = 'oficina' then
           ParValue := DBoficina.Text;
        if ParName = 'amortizacion' then
           ParValue := JVamortizacion.Caption;
        if ParName = 'reciprocidad' then
           ParValue := desc_linea;
        if ParName = 'num_codeudor' then
           ParValue := JVcodeudores.Caption;
        if ParName = 'garantia' then
           ParValue := JVgarantia.Caption;
        if ParName = 'pago_interes' then
           ParValue := JVpagointeres.Caption;
        if ParName = 'deudor' then
           ParValue := JVsolicitante.Caption;
        if ParName = 'analista' then
           ParValue := n_analista;
        if ParName = 'tasa' then
           ParValue := define_tasa(id_linea,JVtasaa.Value);
        if ParName = 'numero_rad' then
           ParValue := Msolicitud.Text;
        if ParName = 'fecha' then
           ParValue := vFechaEnte;
        if ParName = 'valor' then
           ParValue := JVvalora.Value;
        if ParName = 'plazo' then
           ParValue := JVplazoa.Value;
        if ParName = 'acta' then
           ParValue := EDacta.Text;
        if ParName = 'identificacion' then
           ParValue := id_persona;
        if ParName = 'radicado' then
           ParValue := Msolicitud.Text;
        if ParName = 'plazo_a' then
           ParValue := JVplazoa.Value;
        if ParName = 'valor_solicitado' then
           ParValue := JVvalora.Value;
        if ParName = 'inversion' then
           ParValue := EDinversion.Text;
        if ParName = 'disp_pago' then
           ParValue := v_dispago;
        if ParName = 'valor_cuota' then
           ParValue := v_valorcuota;
        if ParName = 'ingresos' then
           ParValue := v_ingresos;
        if ParName = 'Bancoldex' then
           ParValue := Bancoldex;           

end;

procedure TFrmEnteAgencias.MsolicitudExit(Sender: TObject);
var     numero,estado,id_pagointeres :Integer;
        mensage, descuentos :string;
        i,j :Integer;
        opcion :Boolean;
        Astream2 :TMemoryStream;
begin
      if Msolicitud.Text <> '          ' then
      begin
        valida_tcp := False;
        frmProgreso := TfrmProgreso.Create(Self);
        frmProgreso.Titulo := 'Recibiendo Información de ' + DBoficina.Text;
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'KBs Recibidos: 0';
        frmProgreso.Position := 2; // carga de referencia
        frmProgreso.Ejecutar;
        Application.ProcessMessages;
        opcion := True;
        XmlDoc := TsdXmlDocument.CreateName('solicitud');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        XmlDoc.Root.WriteString('id_solicitud',Msolicitud.Text);
        XmlDoc.Root.WriteString('id_tipo','0');// 0 PARA CONSULTA Y 1 PARA INSERCION Y ACTUALIZACION
        XmlDoc.Root.WriteString('id_modulo','E');
        XmlDoc.SaveToFile('c:\consulta_general.xml');
        Astream := TStringStream.Create('');
        XmlDoc.SaveToStream(Astream);
        with IdTCPClient1 do
        begin
          Port := puerto_server;
          Host := host_server;
          try
            Application.ProcessMessages;
            Connect;
          except
          on E: Exception do
          begin
            Application.ProcessMessages;
            frmProgreso.Cerrar;
            MessageDlg('Error de Conexión' + #13 + E.Message,mtError,[mbok],0);
            Disconnect;
            Msolicitud.SetFocus;
            Exit;
          end;
          end;
          if Connected then
          begin
            WriteInteger(Astream.Size);
            OpenWriteBuffer;
            WriteStream(Astream);
            CloseWriteBuffer;
            FreeAndNil(Astream);
            valida_tcp := True;
            tamano := ReadInteger;
            Application.ProcessMessages;
            Astream := TStringStream.Create('');
            ReadStream(Astream,tamano,False);
            Astream2 := TMemoryStream.Create;
            Astream.Position := 0;
            ZDeCompressStream(Astream,Astream2);
            Astream2.Seek(0,0);
            Xmlres.LoadFromStream(Astream2);
            Xmlres.SaveTofile('c:\ente_aprobador.xml');
            nodo := Xmlres.Root.NodeByName('solicitud');
            frmProgreso.Cerrar;
            Disconnect;
            if nodo.ReadString('encontrado') = 'error' then
            begin
              MessageDlg('Ha Ocurrido un Error En Momento de Ejecución con Mensaje;'+#13+nodo.ReadString('mensaje'),mtError,[mbok],0);
              Msolicitud.SetFocus;
              Disconnect;
              Exit;
            end;
            if nodo.ReadString('encontrado') = 'false' then
            begin
               MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
               Msolicitud.SetFocus;
               Exit;
            end;
            estado := nodo.ReadInteger('estado');
            //estado := 2
            with DmSolicitud.IBSQL1 do
            begin
              Close;
              if Transaction.InTransaction then
                 Transaction.Commit;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
              SQL.Add('FROM');
              SQL.Add('"col$estadosolicitud"');
              SQL.Add('WHERE');
              SQL.Add('("col$estadosolicitud".ID_ESTADO = :ID_ESTADO)');
              ParamByName('ID_ESTADO').AsInteger := estado;
              ExecQuery;
              mensage := FieldByName('DESCRIPCION_ESTADO').AsString;
              Close;
              {if estado = 8 then
                 DBente.KeyValue := 3
              else if estado in [2,3] then
                 DBente.KeyValue := estado - 1
              else}
              //estado := 2;// ojo
              JVvalora.Value := nodo.ReadFloat('valor_aprobado');
              if JVvalora.Value > Monto_EnteAprobador then
              begin
               if (Id_EnteAprobador = 1) or (Id_EnteAprobador = 2) or (Id_EnteAprobador = 3) then
               begin
                 if MessageDlg('El Valor de la Solicitud Excede El Monto Permitido' + #13 + 'Monto Permitido : ' +  FormatCurr('#,##0.00',Monto_EnteAprobador) + #13 + 'Monto Solicitud: ' + FormatCurr('#,##0.00',JVvalora.Value) +  #13 + 'Desea Continuar',mtinformation,[mbyes,mbno],0) = mrno then
                 begin
                    Msolicitud.SetFocus;
                    Exit;
                 end;
               end
               else
               begin

                  MessageDlg('El Valor de la Solicitud Excede El Monto Permitido' + #13 + 'Monto Permitido : ' +  FormatCurr('#,##0.00',Monto_EnteAprobador) + #13 + 'Monto Solicitud: ' + FormatCurr('#,##0.00',JVvalora.Value),mtinformation,[mbok],0);
                  Msolicitud.SetFocus;
                  Exit;
               end;
                end;
              if estado in [2,3,8,9] then
              begin
                DBente.KeyValue := Id_EnteAprobador;
                //MessageDlg('La solicitud se Encuentra Aplazada',mtInformation,[MBOK],0);
                //DBente.KeyValue := nodo.ReadInteger('ente_aprobador');
              end
              else
              begin
                MessageDlg('La Solicitud se Encuentra en Estado : '+ mensage,mtInformation,[MBOK],0);
                Msolicitud.SetFocus;
                Exit;
              end;
              if (DBente.KeyValue = 1) or (DBente.KeyValue = 0) then
                 EDacta.Text := FormatDateTime('YYMMDD',Date)
              else
                 EDacta.Text := frmMain.n_acta;
              CDcodeudores.CancelUpdates;
              CDcapacidad.CancelUpdates;
              try
                codigo_ente := DBente.KeyValue;
              except
              begin
               MessageDlg('Debe Registrar el Ente Aprobador',mtError,[mbok],0);
               DBente.SetFocus;
               Exit;
              end;
              end;
              if codigo_ente = 2 then
                CHverifica.Enabled := True
              else
                CHverifica.Enabled := False;
              if (DBente.KeyValue = 3) and (estado <> 8) then
              begin
                if MessageDlg('La solicitud no ha Pasado por Comite de Créditos' + #13 + '               Desea Continuar?',mtInformation,[mbyes,mbno],0) = mrno then
                begin
                   Msolicitud.SetFocus;
                  Exit;
                end;
              end;
              Panel1.Enabled := False;
              PageControl1.Enabled := True;
              IBlinea.Open;
              DBlinea.KeyValue := nodo.ReadInteger('Linea');
              id_analisis := nodo.ReadString('id_analisis');
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION');
              SQL.Add('FROM');
              SQL.Add('"col$clasificacion"');
              SQL.Add('WHERE');
              SQL.Add('("col$clasificacion".ID_CLASIFICACION = :ID_CLASIFICACION)');
              ParamByName('ID_CLASIFICACION').AsInteger := nodo.ReadInteger('clasificacion');
              ExecQuery;
              EDclasificacion.Text := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
              Close;
              JVamortizacion.Caption := 'CADA ' + nodo.ReadString('amortizacion') + ' DIAS';
              JVpagointeres.Caption := 'CADA ' + nodo.ReadString('pago_interes') + ' DIAS';
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO');
              SQL.Add('FROM');
              SQL.Add('"col$respaldo"');
              SQL.Add('WHERE');
              SQL.Add('("col$respaldo".ID_RESPALDO = :ID_RESPALDO)');
              ParamByName('ID_RESPALDO').AsInteger := nodo.ReadInteger('respaldo');
              ExecQuery;
              JVrespaldo.Caption := FieldByName('DESCRIPCION_RESPALDO').AsString;
              Close;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA');
              SQL.Add('FROM');
              SQL.Add('"col$tiposcuota"');
              SQL.Add('WHERE');
              SQL.Add('("col$tiposcuota".ID_TIPOS_CUOTA = :TIPO_CUOTA)');
              ParamByName('TIPO_CUOTA').AsInteger := nodo.ReadInteger('tipo_cuota');
              ExecQuery;
              JVtipocuota.Caption := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
              Close;
              id_garantia := nodo.ReadInteger('garantia');
              SQL.Clear;
              SQL.Add('select DESCRIPCION_GARANTIA from "col$garantia"');
              SQL.Add('where ID_GARANTIA = :ID_GARANTIA');
              ParamByName('ID_GARANTIA').AsInteger := nodo.ReadInteger('garantia');
              ExecQuery;
              JVgarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString;
              Close;
              id_linea := nodo.ReadInteger('linea');
              SQL.Clear;
              SQL.Add('select TASA from "col$lineas"');
              SQL.Add('where ID_LINEA = :ID_LINEA');
              ParamByName('ID_LINEA').AsInteger := id_linea;
              ExecQuery;
              JVtasaa.Value := FieldByName('TASA').AsCurrency;
              Close;
              JVfecha.Caption := nodo.ReadString('fecha_recepcion');
              JVplazoa.Value := nodo.ReadInteger('plazo_aprobado');
              JVvalor.Value := nodo.ReadFloat('valor_solicitado');
              EDgarantia.Text := nodo.ReadString('destino');
              JVmes.Text := CurrToStr(SimpleRoundTo(JVplazoa.Value / 30,-1));
              EDgarantia.Text := nodo.ReadString('des_garantia');
              EDinversion.Text := nodo.ReadString('destino');
              JVplazo.Value := nodo.ReadInteger('plazo_aprobado');
              id_pagointeres := nodo.ReadInteger('pago_interes');
              JVcodeudores.Caption := num_codeudor[nodo.readinteger('numero_codeudores')]+ ' ( ' + nodo.ReadString('numero_codeudores')+ ' )';
              oficina := DBoficina.KeyValue;
              id_identificacion := nodo.ReadInteger('id_identificacion');
              id_persona := nodo.ReadString('id_persona');
              JVsolicitante.Caption := nodo.ReadString('nombre') + ' ' + nodo.ReadString('p_apellido') + ' ' + nodo.ReadString('s_apellido');
              JVid_persona.Caption := id_persona;
              CDcodeudores.Append;// informacion de la grid
              CDcodeudores.FieldValues['id_persona'] := id_persona;
              CDcodeudores.FieldValues['id_identificacion'] := id_identificacion;
              CDcodeudores.FieldValues['nombres'] := JVsolicitante.Caption;
              CDcodeudores.FieldValues['definicion'] := 'DEUDOR';
              CDcodeudores.FieldValues['numero'] := 0;
              CDcodeudores.Post;
              CDcapacidad.Append;// capacidad de pago
              CDcapacidad.FieldValues['id_persona'] := id_persona;
              CDcapacidad.FieldValues['id_identificacion'] := id_identificacion;
              CDcapacidad.FieldValues['ingresos'] := nodo.ReadFloat('ingresos');
              v_ingresos := nodo.ReadFloat('ingresos');
              CDcapacidad.FieldValues['deducciones'] := nodo.ReadFloat('deducciones');
              CDcapacidad.FieldValues['disponible'] := nodo.ReadFloat('disponible');
              CDcapacidad.FieldValues['valor_cuota'] := nodo.ReadFloat('valor_cuota');
              v_valorcuota := nodo.ReadFloat('valor_cuota');
              CDcapacidad.FieldValues['disp_pago'] := nodo.ReadFloat('disponibilidad');
              v_dispago := nodo.ReadFloat('disponibilidad');
              CDcapacidad.FieldValues['solv_economica'] := ABS(nodo.ReadInteger('solv_economica'));
              CDcapacidad.FieldValues['exp_creditos'] := nodo.ReadString('exp_creditos');
              CDcapacidad.FieldValues['definicion'] :='DEUDOR';
              CDcapacidad.Post;
//              DBImage1.LoadPicture :=
{              try
              nodo := Xmlres.Root.NodeByName('foto');
              CDfoto.Append;
              CDfoto.FieldValues['foto'] := nodo.BinaryString;
              CDfoto.Post;
              except
              CDfoto.CancelUpdates;
              end;        }
              nodo := Xmlres.Root.NodeByName('codeudores');// registro informacion de codeudores
              for i := 0 to nodo.NodeCount -1 do
              begin
               CDcodeudores.Append;
               CDcodeudores.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
               CDcodeudores.FieldValues['id_identificacion'] := nodo.Nodes[i].ReadInteger('id_identificacion');
               CDcodeudores.FieldValues['nombres'] := nodo.Nodes[i].ReadString('nombre');
               if Abs(nodo.Nodes[i].ReadInteger('es_conyuge')) = 0 then
                  CDcodeudores.FieldValues['definicion'] := 'CODEUDOR(' +nodo.Nodes[i].ReadString('id_entrada') +')'
               else
                  CDcodeudores.FieldValues['definicion'] := 'CONYUGE';
                CDcodeudores.FieldValues['numero'] := nodo.Nodes[i].ReadInteger('id_entrada');
               CDcodeudores.Post;
               CDcapacidad.Append;
               CDcapacidad.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
               CDcapacidad.FieldValues['id_identificacion'] := nodo.Nodes[i].ReadInteger('id_identificacion');
               CDcapacidad.FieldValues['ingresos'] := nodo.Nodes[i].ReadFloat('ingresos');
               CDcapacidad.FieldValues['deducciones'] := nodo.Nodes[i].ReadFloat('deducciones');
               CDcapacidad.FieldValues['disponible'] := nodo.Nodes[i].ReadFloat('disponible');
               CDcapacidad.FieldValues['valor_cuota'] := nodo.Nodes[i].ReadFloat('valor_cuota');
               CDcapacidad.FieldValues['disp_pago'] := nodo.Nodes[i].ReadFloat('disponibilidad');
               CDcapacidad.FieldValues['solv_economica'] := ABS(nodo.Nodes[i].ReadInteger('solv_economica'));
               CDcapacidad.FieldValues['exp_creditos'] := nodo.Nodes[i].ReadString('exp_creditos');
               CDcapacidad.FieldValues['definicion'] :='CODEUDOR(' +nodo.Nodes[i].ReadString('id_entrada') +')';
               CDcapacidad.Post;
              end;
              CDobservacion.CancelUpdates;
              CDtipoobservacion.CancelUpdates;

              //Informacion Bancoldex
              try
                nodo := Xmlres.Root.NodeByName('bancoldex');
                LineaBancoldex := nodo.ReadString('LINEA_BANCOLDEX');
              except
                LineaBancoldex := '';
              end;
              if LineaBancoldex <> '' then begin
                Bancoldex := True;
                frmInformacionBancoldexEnte := TfrmInformacionBancoldexEnte.Create(Self);
                frmInformacionBancoldexEnte.CDBancoldex.CancelUpdates;
                frmInformacionBancoldexEnte.CDDestinoB.CancelUpdates;
                frmInformacionBancoldexEnte.CDGarantiaB.CancelUpdates;
                frmInformacionBancoldexEnte.CDBancoldex.Append;
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['LINEA'] := nodo.ReadString('LINEA_BANCOLDEX');
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['NO_BANCOLDEX'] := nodo.ReadString('NO_BANCOLDEX');
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['EMPLEOS_ACT'] := nodo.ReadString('EMPLEOS_ACT');
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['EMPLEOS_GENERAR'] := nodo.ReadString('EMPLEOS_GENERAR');
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['TOTAL_ACTIVOS'] := nodo.ReadString('TOTAL_ACTIVOS');
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['FECHA_ACTIVOS'] := nodo.ReadString('FECHA_CORTE_ACTIVOS');
                if IBSQL3.Transaction.InTransaction then
                  IBSQL3.Transaction.Rollback;
                IBSQL3.Transaction.StartTransaction;
                if nodo.ReadInteger('DESTINO1') > 0 then begin
                  IBSQL3.Close;
                  IBSQL3.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('DESTINO1');
                  IBSQL3.ExecQuery;
                  frmInformacionBancoldexEnte.CDDestinoB.Append;
                  frmInformacionBancoldexEnte.CDDestinoB.FieldValues['NO'] := 1;
                  frmInformacionBancoldexEnte.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
                  frmInformacionBancoldexEnte.CDDestinoB.FieldValues['MONTO'] := nodo.ReadFloat('MONTO1');
                  frmInformacionBancoldexEnte.CDDestinoB.Post;
                end;
                if nodo.ReadInteger('DESTINO2') > 0 then begin
                  IBSQL3.Close;
                  IBSQL3.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('DESTINO2');
                  IBSQL3.ExecQuery;
                  frmInformacionBancoldexEnte.CDDestinoB.Append;
                  frmInformacionBancoldexEnte.CDDestinoB.FieldValues['NO'] := 2;
                  frmInformacionBancoldexEnte.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
                  frmInformacionBancoldexEnte.CDDestinoB.FieldValues['MONTO'] := nodo.ReadFloat('MONTO2');
                  frmInformacionBancoldexEnte.CDDestinoB.Post;
                end;
                if nodo.ReadInteger('DESTINO3')> 0 then begin
                  IBSQL3.Close;
                  IBSQL3.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('DESTINO3');
                  IBSQL3.ExecQuery;
                  frmInformacionBancoldexEnte.CDDestinoB.Append;
                  frmInformacionBancoldexEnte.CDDestinoB.FieldValues['NO'] := 3;
                  frmInformacionBancoldexEnte.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
                  frmInformacionBancoldexEnte.CDDestinoB.FieldValues['MONTO'] := nodo.ReadFloat('MONTO3');
                  frmInformacionBancoldexEnte.CDDestinoB.Post;
                end;
                if nodo.ReadInteger('GARANTIA1') > 0 then begin
                  IBSQL4.Close;
                  IBSQL4.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('GARANTIA1');
                  IBSQL4.ExecQuery;
                  frmInformacionBancoldexEnte.CDGarantiaB.Append;
                  frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['NO'] := 1;
                  frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
                  frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['VALORG'] := nodo.ReadFloat('VALORGAR1');
                  frmInformacionBancoldexEnte.CDGarantiaB.Post;
                end;
                if nodo.ReadInteger('GARANTIA2') > 0 then begin
                  IBSQL4.Close;
                  IBSQL4.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('GARANTIA2');
                  IBSQL4.ExecQuery;
                  frmInformacionBancoldexEnte.CDGarantiaB.Append;
                  frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['NO'] := 2;
                  frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
                  frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['VALORG'] := nodo.ReadFloat('VALORGAR2');
                  frmInformacionBancoldexEnte.CDGarantiaB.Post;
                end;
                if nodo.ReadInteger('GARANTIA3') > 0 then begin
                  IBSQL4.Close;
                  IBSQL4.ParamByName('CODIGO').AsInteger := nodo.ReadInteger('GARANTIA3');
                  IBSQL4.ExecQuery;
                  frmInformacionBancoldexEnte.CDGarantiaB.Append;
                  frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['NO'] := 3;
                  frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
                  frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['VALORG'] := nodo.ReadFloat('VALORGAR3');
                  frmInformacionBancoldexEnte.CDGarantiaB.Post;
                end;
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['LINEA'] := nodo.ReadString('LINEA_BANCOLDEX');
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['VISITA'] := nodo.ReadInteger('VISITA');
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['FECHA_VISITA'] := nodo.ReadDateTime('FECHA_VISITA');
                IBSQL5.Close;
                IBSQL5.ParamByName('TIPO').AsInteger := nodo.ReadInteger('TIPO_SOCIEDAD');
                IBSQL5.ExecQuery;
                frmInformacionBancoldexEnte.CDBancoldex.FieldValues['TIPO_SOCIEDAD'] := IBSQL5.FieldByName('DESCRIPCION').AsString;
                frmInformacionBancoldexEnte.CDBancoldex.Post;
                // Saldo Bancoldex
                SQL.Clear;
                SQL.Add('select TASA_EA, PUNTOS_ADIC, SALDO from "col$creditosbancoldex" where linea = :Linea');
                ParamByName('LINEA').AsString := LineaBancoldex;
                ExecQuery;
                SaldoBancoldex := FieldByName('SALDO').AsCurrency;
                JVtasaa.Value := SimpleRoundTo(BuscoTasaEfectivaMaximaDtfNueva(IBQuery1,fFechaActual) + FieldByName('PUNTOS_ADIC').AsFloat,-2);
                if JVvalora.Value > SaldoBancoldex then
                  MessageDlg('No se Puede Aprobar Porque El Valor Solicitado Supera el Saldo Bancoldex',mtWarning,[mbok],0);
                frmInformacionBancoldexEnte.Saldo := SaldoBancoldex;
                frmInformacionBancoldexEnte.Analisis := True;
                frmInformacionBancoldexEnte.Solicitud := Msolicitud.Text;
                Close;
              end;
              //fin Datos Bancoldex

              nodo := Xmlres.Root.NodeByName('observaciones');
              for i := 0 to nodo.NodeCount - 1 do
              begin
                CDobservacion.Append;
                CDobservacion.FieldValues['observacion'] := nodo.Nodes[i].ReadString('observacion');
                CDobservacion.FieldValues['id_observacion'] := nodo.Nodes[i].ReadInteger('tipo');
                CDtipoobservacion.Append;
                CDtipoobservacion.FieldValues['tipo'] := nodo.Nodes[i].ReadInteger('tipo');
                SQL.Clear;
                SQL.Add('SELECT');
                SQL.Add('"col$tipoobservacion".DESCRIPCION');
                SQL.Add('FROM');
                SQL.Add('"col$tipoobservacion"');
                SQL.Add('WHERE');
                SQL.Add('("col$tipoobservacion".ID_TIPO IN (:TIPO))');
                ParamByName('TIPO').AsInteger := nodo.NodeS[i].ReadInteger('tipo');
                ExecQuery;
                Close;
                CDtipoobservacion.FieldValues['descripcion'] := FieldByName('DESCRIPCION').AsString;
                CDtipoobservacion.FieldValues['observacion'] := nodo.Nodes[i].ReadString('observacion');
                CDtipoobservacion.Post;
                CDobservacion.Post;
              end;
              CDcreditos.CancelUpdates;
              nodo := Xmlres.Root.NodeByName('colocaciones');
              for i := 0 to nodo.NodeCount - 1 do
              begin
                CDcreditos.Append;
                CDcreditos.FieldValues['id_colocacion'] := nodo.Nodes[i].ReadString('id_colocacion') ;
                CDcreditos.FieldValues['valor_cuota'] := nodo.Nodes[i].ReadFloat('valor_cuota');
                CDcreditos.FieldValues['fecha_capital'] := nodo.Nodes[i].ReadDateTime('fecha_capital');
                CDcreditos.FieldValues['fecha_interes'] := nodo.Nodes[i].ReadDateTime('fecha_interes');
                CDcreditos.FieldValues['saldo'] := nodo.Nodes[i].ReadFloat('saldo');
                CDcreditos.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
                CDcreditos.Post;
              end;
              CDfianzas.CancelUpdates;
              nodo := Xmlres.Root.NodeByName('fianzas');
              for i := 0 to nodo.NodeCount - 1 do
              begin
                CDfianzas.Append;
                CDfianzas.FieldValues['id_colocacion'] := nodo.Nodes[i].ReadString('id_colocacion');
                CDfianzas.FieldValues['fecha_interes'] := nodo.Nodes[i].ReadDateTime('fecha_interes');
                CDfianzas.FieldValues['saldo'] := nodo.Nodes[i].ReadFloat('saldo');
                CDfianzas.FieldValues['estado'] := nodo.Nodes[i].ReadString('estado');
                CDfianzas.FieldValues['id_persona'] := nodo.Nodes[i].ReadString('id_persona');
                CDfianzas.FieldValues['valor_desembolso'] := nodo.Nodes[i].ReadFloat('valor_desembolso');
                CDfianzas.Post;
              end;
              nodo := Xmlres.Root.NodeByName('extracto');
              JVaportes.Value := nodo.ReadFloat('aportes');
              JVahorro.Value := nodo.ReadFloat('ahorros');
              JVcontractual.Value := nodo.ReadFloat('contractual');
              JVcdat.Value := nodo.ReadFloat('cdat');
              jvcuenta.Caption := '20' + IntToStr(DBoficina.KeyValue) + '-' + nodo.ReadString('cuenta');
              JVjuvenil.Value := nodo.ReadFloat('juvenil');
              Rno.Checked := not(nodo.ReadBool('creditos'));
              Rsi.Checked := nodo.ReadBool('creditos');
              nodo := Xmlres.Root.NodeByName('referencias');
              FrmReferencias := TFrmReferencias.Create(self);
              for i := 0 to nodo.NodeCount - 1 do
              begin
                FrmReferencias.ClientDataSet1.Append;
                FrmReferencias.ClientDataSet1.FieldValues['nombre'] := nodo.Nodes[i].ReadString('nombre_ref') + ' ' + nodo.Nodes[i].ReadString('p_apellido_ref') + ' '+nodo.Nodes[i].ReadString('s_apellido_ref');
                FrmReferencias.ClientDataSet1.FieldValues['telefono'] := nodo.Nodes[i].ReadString('telefono_ref');
                FrmReferencias.ClientDataSet1.FieldValues['direccion'] := nodo.Nodes[i].ReadString('direccion_ref');
                SQL.Clear;
                SQL.Add('SELECT');
                SQL.Add('"gen$tiposreferencia".DESCRIPCION_REFERENCIA');
                SQL.Add('FROM');
                SQL.Add('"gen$tiposreferencia"');
                SQL.Add('WHERE');
                SQL.Add('("gen$tiposreferencia".ID_REFERENCIA = :ID_REFERENCIA)');
                ParamByName('ID_REFERENCIA').AsInteger := nodo.NodeS[I].ReadInteger('tipo_ref');
                ExecQuery;
                FrmReferencias.ClientDataSet1.FieldValues['tipo_referencia'] := FieldByName('DESCRIPCION_REFERENCIA').AsString;
                Close;
                SQL.Clear;
                SQL.Add('SELECT');
                SQL.Add('"gen$tiposparentesco".DESCRIPCION_PARENTESCO');
                SQL.Add('FROM');
                SQL.Add('"gen$tiposparentesco"');
                SQL.Add('WHERE');
                SQL.Add('("gen$tiposparentesco".ID_PARENTESCO = :ID_PARENTESCO)');
                ParamByName('ID_PARENTESCO').AsInteger := nodo.NodeS[i].ReadInteger('parentesco_ref');
                ExecQuery;
                FrmReferencias.ClientDataSet1.FieldValues['parentesco'] := FieldByName('DESCRIPCION_PARENTESCO').AsString;
                Close;
                FrmReferencias.ClientDataSet1.post;
              end;
              CDdescuentos.CancelUpdates;
              nodo := Xmlres.Root.NodeByName('descuentos');
              for i := 0 to nodo.NodeCount - 1 do
              begin
                CDdescuentos.Append;
                CDdescuentos.FieldValues['id_colocacion'] := nodo.Nodes[i].ReadString('colocacion');
                CDdescuentos.Post;
              end;
              descuentos := _sDescuentos;
              with CDdescuentos do
              begin
                First;
                if RecordCount <> 0 then
                   descuentos := descuentos + ' DESCONTAR PAGARE(S) : ';
                while not Eof do
                begin
                  if opcion then
                    descuentos := descuentos + FieldByName('ID_COLOCACION').AsString
                  else
                    descuentos := descuentos + ', ' + FieldByName('ID_COLOCACION').AsString;
                   opcion := False;
                 Next;
               end;
               Mconcepto.Text := descuentos;
               DBGrid1.SetFocus;
              end;
             end; // fin del with del ibsql
             Disconnect;
          end;// fin del connect
        end;// fin del with tcpclient
      end
      else
      DBoficina.SetFocus;
end;
procedure TFrmEnteAgencias.BaceptarClick(Sender: TObject);

begin
        //if (TabSheet3.TabVisible = True) and (verifica_pago) then
        //   Exit;
        if Mconcepto.Text = '' then
        begin
          if MessageDlg('El Campo Observacion se Encuentra Vacio, Desea Continuar?',mtInformation,[mbyes,mbno],0) = mrno then
          begin
            PageControl1.ActivePageIndex := 1;
            Mconcepto.SetFocus;
            Exit;
          end;
        end
        else if EDacta.Text = '' then
        begin
          if MessageDlg('El Campo Numero de Acta se Encuentra Vacio, Desea Continuar?',mtInformation,[mbyes,mbno],0) = mrno then
          begin
            PageControl1.ActivePageIndex := 1;
            EDacta.SetFocus;
            Exit;
          end;
        end;// fin consideraciones
        if MessageDlg('Esta Seguro de Realizar la Transaccion?',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        valida_tcp := False;
        frmProgresoServer := TfrmProgresoServer.Create(Self);
        frmProgresoServer.Info.Caption := 'Enviando...';
        frmProgresoServer.Ejecutar;
        Application.ProcessMessages;
        reporte;
        registrar;
end;

procedure TFrmEnteAgencias.registra_solicitud(estado:Integer);
begin
        estado_solicitud := estado;
        with DmSolicitud.IBsolicitud3 do
        begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           try
             SQL.Clear;
             SQL.Add('update "col$solicitud" set');
             SQL.Add('"col$solicitud".NUMERO_ACTA = :NUMERO_ACTA,');
             SQL.Add('"col$solicitud".VALOR_APROBADO = :VALOR_APROBADO,');
             SQL.Add('"col$solicitud".ENTE_APROBADOR = :ENTE_APROBADOR,');
             SQL.Add('"col$solicitud".FECHA_CONCEPTO = :FECHA_CONCEPTO,');
             SQL.Add('"col$solicitud".TASA_INTERES = :TASA_INTERES,');
             SQL.Add('"col$solicitud".PLAZO_APROBADO = :PLAZO_APROBADO,');
             SQL.Add('"col$solicitud".ESTADO = :ESTADO,');
             SQL.Add('"col$solicitud".ES_DESEMBOLSO_PARCIAL = :ES_DESEMBOLSO_PARCIAL');
             SQL.Add('where "col$solicitud".ID_SOLICITUD = :ID_SOLICITUD');
             ParamByName('NUMERO_ACTA').AsString := EDacta.Text;
             ParamByName('VALOR_APROBADO').AsCurrency := JVvalora.Value;
             ParamByName('ENTE_APROBADOR').AsSmallInt := DBente.KeyValue;
             ParamByName('FECHA_CONCEPTO').AsDate := Date;
             ParamByName('TASA_INTERES').AsFloat := JVtasaa.Value;
             ParamByName('PLAZO_APROBADO').AsInteger := JVplazoa.Value;
             ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
             ParamByName('ESTADO').AsInteger := estado;
             ParamByName('ES_DESEMBOLSO_PARCIAL').AsInteger := BoolToInt(CHparcial.Checked);
             Open;
             if DBlinea.KeyValue = 7 then
             begin
               SQL.Clear;
               SQL.Add('update "col$solicitud" set');
               SQL.Add('"col$solicitud".INVERSION = 3,');
               SQL.Add('"col$solicitud".CLASIFICACION = 3');
               SQL.Add('where "col$solicitud".ID_SOLICITUD = :ID_SOLICITUD');
               ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
               Open;
             end;
             Close;
           except
           on e: Exception do
           begin
             MessageDlg('No se Grabaron los Datos Correctamente'+#13+e.Message,mtError,[mbok],0);
             Transaction.Rollback;
             Exit;
           end;
           end;
           with frmMain.CDinforme do
           begin
             Append;
             FieldValues['radicado'] := Msolicitud.Text;
             FieldValues['estado'] := estado;
             FieldValues['id_ente'] := DBente.KeyValue;
             if estado = 4 then
                FieldValues['valor'] := JVvalora.Value
             else
                FieldValues['valor'] := 0;
             FieldValues['oficina'] := DBoficina.KeyValue;
             FieldValues['nombres'] := JVsolicitante.Caption;
             FieldValues['id_oficina'] := DBoficina.KeyValue;
             FieldValues['des_estado'] := Obtener_Estado(estado);
             FieldValues['garantia'] := id_garantia;
             FieldValues['plazo'] := JVplazo.Value;
             FieldValues['cuenta'] := JVcuenta.Caption;
             Post;
           end;
           frmMain.n_acta := edacta.Text;
           Transaction.Commit;
        end;
end;

procedure TFrmEnteAgencias.registra_observacion(id_observacion: integer;
  concepto: string);
begin
        CDconcepto.CancelUpdates;
        CDconcepto.Append;
        CDconcepto.FieldValues['tipo'] := id_observacion;
        CDconcepto.FieldValues['concepto'] := concepto;
        if id_observacion = 13 then
        begin
          CDconcepto.FieldValues['descripcion'] := 'OBSERVACIONES COMITE DE CREDITOS';
          CDtipoobservacion.Append;
          CDtipoobservacion.FieldValues['tipo'] := id_observacion;
          CDtipoobservacion.FieldValues['observacion'] := Mconcepto.Text;
          CDtipoobservacion.FieldValues['descripcion'] := 'OBSERVACIONES COMITE DE CREDITOS';
          CDtipoobservacion.Post;
        end
        else
          CDconcepto.FieldValues['descripcion'] := '';
        CDconcepto.Post;
end;

procedure TFrmEnteAgencias.bactaClick(Sender: TObject);
begin
        if (DBente.KeyValue = 1) then
        begin
           if Rnegado.Checked then
             imprimir_reporte(frmMain.wpath+'reporte\repconcepto_n_of.frf')
           else
             imprimir_reporte(frmMain.wpath+'reporte\repconcepto_of.frf');
        end
        else if  (DBente.KeyValue = 3) then
        begin
           if Rnegado.Checked then
             imprimir_reporte(frmMain.wpath+'reporte\repconcepto_EN_of.frf')
           else
             imprimir_reporte(frmMain.wpath+'reporte\repconcepto_E1_of.frf');
        end
        else
        begin
        if CHverifica.Checked = False then
           if Rnegado.Checked then
              imprimir_reporte(frmMain.wpath+'reporte\repconcepto_1_n_of.frf')
           else
              imprimir_reporte(frmMain.wpath+'reporte\repconcepto_1_of.frf');
        end;
end;

procedure TFrmEnteAgencias.reporte;
begin
          CDestado.CancelUpdates;
          if CHverifica.Checked then
          begin
          try
            CDtipoobservacion.Filtered := False;
            CDtipoobservacion.Filter := 'tipo in (4,7,8,9,10,11,3,0,12)';
            CDtipoobservacion.Filtered := True;
          except
            CDtipoobservacion.Filtered := False;
          end;
            if Rfavorable.Checked then
            begin
             CDestado.Append;
             CDestado.FieldValues['aprobado'] := 1;
             CDestado.FieldValues['negado'] := 0;
             CDestado.FieldValues['aplazado'] := 0;
             if Bancoldex then
               CDestado.FieldValues['bancoldex'] := 1
             else
               CDestado.FieldValues['bancoldex'] := 0;
             CDestado.Post;
            end
            else
            begin
             CDestado.Append;
             CDestado.FieldValues['aprobado'] := 0;
             CDestado.FieldValues['negado'] := 1;
             CDestado.FieldValues['aplazado'] := 0;
             if Bancoldex then
               CDestado.FieldValues['bancoldex'] := 1
             else
               CDestado.FieldValues['bancoldex'] := 0;
             CDestado.Post;
            end;
          end
          else
          begin
          try
            CDtipoobservacion.Filtered := False;
            CDtipoobservacion.Filter := 'tipo in (4,7,8,9,10,11,3,0,12,13)';
            CDtipoobservacion.Filtered := True;
          except
            CDtipoobservacion.Filtered := False;
          end;
          //CDtipoobservacion.Filtered := False;
            if estado_solicitud = 9 then
            begin
              CDestado.Append;
              CDestado.FieldValues['aprobado'] := 0;
              CDestado.FieldValues['negado'] := 0;
              CDestado.FieldValues['aplazado'] := 1;
              if Bancoldex then
                CDestado.FieldValues['bancoldex'] := 1
              else
                CDestado.FieldValues['bancoldex'] := 0;
              CDestado.Post;
            end
            else if estado_solicitud = 7 then
            begin
               CDestado.Append;
               CDestado.FieldValues['aprobado'] := 0;
               CDestado.FieldValues['negado'] := 1;
               CDestado.FieldValues['aplazado'] := 0;
               if Bancoldex then
                 CDestado.FieldValues['bancoldex'] := 1
               else
                 CDestado.FieldValues['bancoldex'] := 0;
               CDestado.Post;
            end
            else if estado_solicitud = 4 then
            begin
               CDestado.Append;
               CDestado.FieldValues['aprobado'] := 1;
               CDestado.FieldValues['negado'] := 0;
               CDestado.FieldValues['aplazado'] := 0;
               if Bancoldex then
                 CDestado.FieldValues['bancoldex'] := 1
               else
                 CDestado.FieldValues['bancoldex'] := 0;
               CDestado.Post;
            end;
          end;
          with DmSolicitud.IBSQL1 do
          begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"col$lineas".VECES_APORTES');
            SQL.Add('FROM');
            SQL.Add('"col$lineas"');
            SQL.Add('WHERE');
            SQL.Add('("col$lineas".ID_LINEA = :ID_LINEA)');
            ParamByName('ID_LINEA').AsInteger := DBlinea.KeyValue;
            ExecQuery;
            desc_linea := FieldByName('VECES_APORTES').AsString + ' VECES LAS APORTACIONES SOCIALES';
            Close;
            SQL.Clear;
            SQL.Add('select NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO from "gen$empleado"');
            SQL.Add('where ID_EMPLEADO = :id_analisis');
            ParamByName('ID_ANALISIS').AsString := id_analisis;
            ExecQuery;
            n_analista := FieldByName('NOMBRE').AsString + ' '+ FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            Close;
            Transaction.Commit;
        end;

end;

procedure TFrmEnteAgencias.firmas(ente:string);
begin
end;


procedure TFrmEnteAgencias.JVvaloraExit(Sender: TObject);
begin
        JVdesembolso.Value := JVvalora.Value;
end;

procedure TFrmEnteAgencias.BitBtn8Click(Sender: TObject);
begin
        CDparcial.CancelUpdates;
        JVnum.Caption := '1';
        JVresto.Value := JVdesembolso.Value;
end;

procedure TFrmEnteAgencias.BitBtn7Click(Sender: TObject);
var     valor :Currency;
begin
        if CDparcial.RecordCount >= JVabono.Value then
        begin
          MessageDlg('Sobrepasa el Numero de Cuotas Establecidas',mtinformation,[mbok],0);
          JVabono.SetFocus;
          Exit;
        end;
        if JVparcial.Value <> 0 then
        begin
        valor := 0;
        with CDparcial do
        begin
          First;
          while not Eof do
          begin
            valor := valor + CDparcial.FieldValues['valor'];
            Next;
          end;
        end;
        if (valor + JVparcial.Value) > JVdesembolso.Value then
        begin
          MessageDlg('Los valores de la Cuotas Exceden el monto Total',mtInformation,[mbok],0);
          JVparcial.SetFocus;
          Exit;
        end;
        CDparcial.Append;
        CDparcial.FieldValues['numero'] := CDparcial.RecordCount + 1;
        JVnum.Caption := IntToStr(CDparcial.RecordCount + 1);
        CDparcial.FieldValues['valor'] := JVparcial.Value;
        CDparcial.FieldValues['fecha'] := DTfechap.DateTime;
        CDparcial.Post;
        JVresto.Value := JVresto.Value - JVparcial.Value;
        JVparcial.Value := 0;
        end;
        JVparcial.SetFocus;
end;

function TFrmEnteAgencias.verifica_pago: Boolean;
var    verifica :Boolean;
begin
        verifica := false;
        if JVabono.Value <> 0 then
        begin
          if CDparcial.RecordCount <> 0 then
          begin
             if CDparcial.RecordCount <> JVabono.Value then
             begin
               MessageDlg('El numero de Desembolsos en la Grid No Concuerda con el numero Digitado',mtError,[mbok],0);
               PageControl1.ActivePageIndex := 2;
               verifica := true;
               JVabono.SetFocus;
             end;
          end
          else
          verifica := True;
        end;
        Result := verifica;
end;

function TFrmEnteAgencias.verifica_saldo: boolean;
begin

end;

procedure TFrmEnteAgencias.BitBtn9Click(Sender: TObject);
var     i :Smallint;
begin
        if CDparcial.RecordCount = 0 then
        begin
            for i := 1 to JVabono.Value do
            begin
              CDparcial.Append;
              CDparcial.FieldValues['numero'] := i;
              CDparcial.Post;
            end;
        end;
end;

procedure TFrmEnteAgencias.desembolso(opcion:Smallint);
begin
end;


function TFrmEnteAgencias.retorna_fecha: tdate;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "SP_FECHAHORA_ACTUAL"');
          ExecQuery;
          Result := FieldByName('FECHAHORA').AsDateTime;
          Close;
          Transaction.Commit;
        end;
end;

procedure TFrmEnteAgencias.JVplazoaExit(Sender: TObject);
begin
          JVmes.Text := CurrToStr(SimpleRoundTo(JVplazoa.Value / 30,-1));
end;

procedure TFrmEnteAgencias.registrar;
var    estado, id_observacion :Integer;
       desembolso :Boolean;
       AstreamRes :TMemoryStream;
begin
        desembolso := False;
        CDestado.CancelUpdates;
        if (DBente.KeyValue = 2) and (CHverifica.Checked) then  // comienzo verifica tipo ente aprobador
        begin
           estado := 8;
           id_observacion := 13;
        end
        else
        begin
        if Raplazado.Checked then
        begin
          estado := 9;
          id_observacion := 15;
        end
        else if Rnegado.Checked then
        begin
          estado := 7;
          id_observacion := 6;
        end
        else if RAprobado.Checked then
        begin
          estado := 4;
          id_observacion := 14;
          desembolso := True;
        end;
        if (DBente.KeyValue = 2) or (DBente.KeyValue = 3) then
        begin
           id_observacion := 13;
        end;
        end;
        registra_observacion(id_observacion,Mconcepto.Text);
        XmlDoc := TsdXmlDocument.CreateName('solicitud');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        XmlDoc.Root.WriteString('id_solicitud',Msolicitud.Text);
        XmlDoc.Root.WriteString('id_tipo','1');// 0 PARA CONSULTA Y 1 PARA INSERCION Y ACTUALIZACION
        XmlDoc.Root.WriteString('id_modulo','E');
        nodo := XmlDoc.Root.NodeNew('datos_solicitud');
        nodo.WriteString('acta',EDacta.Text);
        nodo.WriteFloat('valor_aprobado',JVvalora.Value);
        nodo.WriteFloat('tasa',JVtasaa.Value);
        nodo.WriteInteger('ente_aprobador',DBente.KeyValue);
        nodo.WriteDateTime('fecha_concepto',vFechaEnte);
        nodo.WriteInteger('plazo_aprobado',JVplazoa.Value);
        nodo.WriteInteger('estado',estado);
        nodo.WriteBool('desembolso_parcial',CHparcial.Checked);
        nodo.WriteString('observacion',Mconcepto.Text);
        nodo.WriteInteger('id_observacion',id_observacion);
        nodo.WriteBool('aprobada',desembolso);
        nodo.WriteInteger('oficina',DBoficina.KeyValue);
        //XmlDoc.SaveToFile('c:\actualiza_ente.xml');
        Astream := TStringStream.Create('');
        XmlDoc.SaveToStream(Astream);
        with IdTCPClient1 do
        begin
          Port := puerto_server;
          Host := host_server;
          try
            Connect;
          except
          on E: Exception do
          begin
            MessageDlg('Error de Conexión. Favor Verificar en Sistemas' + #13 + E.Message,mtError,[mbok],0);
            Exit;
          end;
          end;
          if Connected then
          begin
            WriteInteger(Astream.Size);
            OpenWriteBuffer;
            WriteStream(Astream);
            CloseWriteBuffer;
            FreeAndNil(Astream);
            tamano := ReadInteger;
            Application.ProcessMessages;
            Astream := TStringStream.Create('');
            //descomprime
            AstreamRes := TMemoryStream.Create;
            ReadStream(Astream,tamano,False);
            Astream.Position := 0;
            ZDecompressStream(Astream,AstreamRes);
            AstreamRes.Seek(0,0);
            Xmlres.LoadFromStream(AstreamRes);
            Disconnect;
          end;
            nodo := Xmlres.Root.NodeByName('solicitud');
            if nodo.ReadBool('actualizado') then
            begin
              frmProgresoServer.Cerrar;
              MessageDlg('Solicitud Actualizada con Exito',mtInformation,[mbok],0);
              with DmSolicitud.IBSolicitud1 do
              begin
                Close;
                if Transaction.InTransaction then
                   Transaction.Commit;
                Transaction.StartTransaction;
                SQL.Clear;
                SQL.Add('insert into "col$registroagencia" values (');
                SQL.Add(':ID_SOLICITUD,:ID_EMPLEADO,:ASOCIADO,:VALOR_SOLICITUD,:FECHA_ANALISIS,:TIPO,:ID_AGENCIA,:ENTE_APROBADOR,:GARANTIA,:CONCEPTO)');
                ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
                ParamByName('ID_EMPLEADO').AsString := DBAlias;
                ParamByName('ASOCIADO').AsString := JVsolicitante.Caption;
                ParamByName('VALOR_SOLICITUD').AsCurrency := JVvalora.Value;
                ParamByName('FECHA_ANALISIS').AsDate := vFechaEnte;
                ParamByName('TIPO').AsString := 'E';
                ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
                ParamByName('ENTE_APROBADOR').AsInteger := DBente.KeyValue;
                ParamByName('GARANTIA').AsInteger := id_garantia;
                if estado in [7,15,9,16,8] then
                  ParamByName('CONCEPTO').AsString := Mconcepto.Text
                else
                  ParamByName('CONCEPTO').Clear;
                ExecSQL;
                Close;
                SQL.Clear;
                SQL.Add('select ID_SOLICITUD from "col$solicitudanalistaof" where ID_SOLICITUD = :ID_SOLICITUD and ID_AGENCIA = :ID_AGENCIA');
                ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
                ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
                Open;
                if RecordCount > 0 then
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('update "col$solicitudanalistaof" set ES_VIGENTE = 0 where ID_SOLICITUD = :ID_SOLICITUD and ID_AGENCIA = :ID_AGENCIA');
                  ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
                  ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
                  ExecSQL;
                end;
                Transaction.Commit;
              end;
           if estado = 9 then
           begin
             CDestado.Append;
             CDestado.FieldValues['aprobado'] := 0;
             CDestado.FieldValues['negado'] := 0;
             CDestado.FieldValues['aplazado'] := 1;
             if Bancoldex then
               CDestado.FieldValues['bancoldex'] := 1
             else
               CDestado.FieldValues['bancoldex'] := 0;
             CDestado.Post;
          end
          else if estado = 7 then
          begin
             CDestado.Append;
             CDestado.FieldValues['aprobado'] := 0;
             CDestado.FieldValues['negado'] := 1;
             CDestado.FieldValues['aplazado'] := 0;
             if Bancoldex then
               CDestado.FieldValues['bancoldex'] := 1
             else
               CDestado.FieldValues['bancoldex'] := 0;
             CDestado.Post;
          end
          else if (estado = 4) or (estado = 8) then
          begin
             CDestado.Append;
             CDestado.FieldValues['aprobado'] := 1;
             CDestado.FieldValues['negado'] := 0;
             CDestado.FieldValues['aplazado'] := 0;
             if Bancoldex then
               CDestado.FieldValues['bancoldex'] := 1
             else
               CDestado.FieldValues['bancoldex'] := 0;
             CDestado.Post;
          end;
              Baceptar.Enabled := False;
              Binforme.Enabled := True;
              if estado <> 9 then
              begin
                bacta.Enabled := True;
                bacta.Click;
              end;
              TabSheet1.Enabled := False;
              TabSheet2.Enabled := False;
              if estado <> 4 then
                 id_garantia := -1;
              with frmMain.CDinforme do
              begin
               Filtered := False;
               Filter := 'radicado = ' + Msolicitud.Text;
               Filtered := True;
               if FieldByName('radicado').AsString <> '' then
                  Delete;
               Filtered := False;
               Append;
               FieldValues['radicado'] := Msolicitud.Text;
               FieldValues['estado'] := estado;
               FieldValues['id_ente'] := DBente.KeyValue;
               if estado = 4 then
                  FieldValues['valor'] := JVvalora.Value
               else
                  FieldValues['valor'] := 0;
               FieldValues['oficina'] := DBoficina.Text;
               FieldValues['nombres'] := JVsolicitante.Caption;
               FieldValues['id_oficina'] := DBoficina.KeyValue;
               FieldValues['des_estado'] := Obtener_Estado(estado);
               FieldValues['garantia'] := id_garantia;
               FieldValues['plazo'] := JVplazo.Value;
               FieldValues['cuenta'] := JVcuenta.Caption;
               Post;
             end;
             frmMain.n_acta := edacta.Text;
             frmMain.ente_arpobador := DBente.Text;
            end
            else
            begin
              frmProgresoServer.Cerrar;
              MessageDlg('Los Registros no se Actualizaron Correctamente',mtWarning,[mbok],0);
              Exit;
            end;
          end;
end;

procedure TFrmEnteAgencias.DBoficinaExit(Sender: TObject);
begin
        host_server := buscaservicio(DBoficina.KeyValue,4).vHost;
        puerto_server := buscaservicio(DBoficina.KeyValue,4).vPuerto;
{
        if DBoficina.KeyValue = 4 then
        begin
          host_server := host_aguachica;
          puerto_server := puerto_aguachica;
        end;
        if DBoficina.KeyValue = 2 then
        begin
          host_server := host_abrego;
          puerto_server := puerto_abrego;
        end;
        if DBoficina.KeyValue = 3 then
        begin
          host_server := host_convencion;
          puerto_server := puerto_convencion;
        end;
        if DBoficina.KeyValue = 1 then
        begin
          host_server := host_ocana;
          puerto_server := puerto_ocana;
        end;}


end;

procedure TFrmEnteAgencias.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
        if valida_tcp then
        begin
          AWorkMode := wmRead;
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Titulo := 'Recibiendo Información de ' + DBoficina.Text + ' Tamaño: ' + CurrToStr(AWorkCountMax/1000) + ' Kbs';
        end;
end;

procedure TFrmEnteAgencias.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var     paquete :Currency;
begin
        if valida_tcp then
        begin
          AWorkMode := wmRead;
          frmProgreso.Position := AWorkCount;
          paquete := AWorkCount/1000;
          frmProgreso.InfoLabel := 'Kbs Recibidos : ' + CurrToStr(paquete);
          Application.ProcessMessages;
        end;
end;

procedure TFrmEnteAgencias.DBImage1DblClick(Sender: TObject);
var    astream2 :TMemoryStream;
begin
        frmProgreso  := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Recibiendo Información de ' + DBoficina.Text;
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'KBs Recibidos: 0';
        frmProgreso.Position := 2; // carga de referencia
        frmProgreso.Ejecutar;
        Application.ProcessMessages;
        XmlDoc := TsdXmlDocument.CreateName('solicitud');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        XmlDoc.Root.WriteString('id_solicitud',Msolicitud.Text);
        XmlDoc.Root.WriteString('id_tipo','0');// 0 PARA CONSULTA Y 1 PARA INSERCION Y ACTUALIZACION
        XmlDoc.Root.WriteString('id_modulo','F');
        XmlDoc.SaveToFile('c:\consulta_general.xml');
        Astream := TStringStream.Create('');
        XmlDoc.SaveToStream(Astream);
        with IdTCPClient1 do
        begin
          Port := puerto_server;
          Host := host_server;
          try
            Application.ProcessMessages;
            Connect;
          except
          on E: Exception do
          begin
            Application.ProcessMessages;
            frmProgreso.Cerrar;
            MessageDlg('Error de Conexión' + #13 + E.Message,mtError,[mbok],0);
            Disconnect;
            Msolicitud.SetFocus;
            Exit;
          end;
          end;
          if Connected then
          begin
            WriteInteger(Astream.Size);
            OpenWriteBuffer;
            WriteStream(Astream);
            CloseWriteBuffer;
            FreeAndNil(Astream);
            valida_tcp := True;
            tamano := ReadInteger;
            Application.ProcessMessages;
            Astream := TStringStream.Create('');
            ReadStream(Astream,tamano,False);
            Astream2 := TMemoryStream.Create;
            frmProgreso.Cerrar;
            Astream.Position := 0;
            ZDeCompressStream(Astream,Astream2);
            Astream2.Seek(0,0);
            Xmlres.LoadFromStream(Astream2);
            Xmlres.SaveTofile('c:\ente_aprobador.xml');
            nodo := Xmlres.Root.NodeByName('solicitud');
            if nodo.ReadString('encontrado') = 'error' then
            begin
              MessageDlg('Ha Ocurrido un Error En Momento de Ejecución con Mensaje;'+#13+nodo.ReadString('mensaje'),mtError,[mbok],0);
              Msolicitud.SetFocus;
              Disconnect;
              Exit;
            end;
            if nodo.ReadString('encontrado') = 'false' then
            begin
               MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
               Disconnect;
               Msolicitud.SetFocus;
               Exit;
            end;
              nodo := Xmlres.Root.NodeByName('foto');
              CDfoto.Append;
              CDfoto.FieldValues['foto'] := nodo.BinaryString;
              CDfoto.Post;
            end;
            Disconnect;
          end;
end;

procedure TFrmEnteAgencias.JVExecute(Sender: TObject; params: Pointer);
var    a:Integer;
begin
end;

procedure TFrmEnteAgencias.BitBtn11Click(Sender: TObject);
begin
        if Bancoldex then
          frmInformacionBancoldexEnte.ShowModal;
end;

end.
