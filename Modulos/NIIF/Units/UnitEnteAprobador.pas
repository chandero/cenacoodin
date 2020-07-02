unit UnitEnteAprobador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvStaticText, Mask, StdCtrls, Buttons, JvEdit, DBCtrls,
  ExtCtrls, JvTypedEdit, Grids, DBGrids, DB, DBClient, IBCustomDataSet, JclSysUtils,
  IBQuery, IBDatabase, ImgList, DateUtils, Math, FR_DSet, FR_DBSet,
  FR_Class, JvLabel, Menus, IBSQL, UnitDmGeneral, UnitDmSolicitud;

type
  TFrmEnteAprobador = class(TForm)
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
    IBobservacion: TIBQuery;
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
    DSlinea: TDataSource;
    IBlinea: TIBQuery;
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
    IBQuery1: TIBQuery;
    CDinfcodeudor: TClientDataSet;
    CDinfcodeudorinformacion: TStringField;
    CDinfcodeudordescripcion: TStringField;
    CDestado: TClientDataSet;
    CDestadoaprobado: TSmallintField;
    CDestadonegado: TSmallintField;
    CDestadoaplazado: TSmallintField;
    IBsolicitud: TIBQuery;
    IBcomite: TIBQuery;
    IBTransaction2: TIBTransaction;
    frDBDataSet2: TfrDBDataSet;
    IBQuery2: TIBQuery;
    Label28: TLabel;
    EDacta: TEdit;
    frDBDataSet3: TfrDBDataSet;
    IBQuery3: TIBQuery;
    CDfirmas: TClientDataSet;
    CDfirmasfirma: TStringField;
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
    PopupMenu2: TPopupMenu;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    IBTransaction3: TIBTransaction;
    IBSQL5: TIBSQL;
    CDestadobancoldex: TSmallintField;
    IBQuery4: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BTbuscarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure MconceptoExit(Sender: TObject);
    procedure CHverificaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
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
    procedure InformacinGeneral1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    id_garantia :Integer;
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
    { Private declarations }
  public
  published
    procedure cmChildKey(var msg: TWMKEY); message CM_CHILDKEY;
    { Public declarations }
  end;

var
  FrmEnteAprobador: TFrmEnteAprobador;
  dmGeneral: TdmGeneral;
  dmSolicitud: TDmSolicitud;
  LineaBancoldex:string;
  Bancoldex:Boolean;
  SaldoBancoldex:Currency;
  NoBancoldex:string;  
  const num_codeudor: array[0..25] of string = ('CERO','UNO','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE','DIEZ','OCNCE','DOCE','TRECE','CATORCE','QUINCE','DIECISEIS','DIECISIETE','DIECIOCHO','DIECINUEVE','VEINTE','VEINTIUNO','VEINTIDOS','VEINTITRES','VEINTICUATRO','VEINTICINCO');
implementation

uses UnitAnalisisPago, UnitDesreferencias, UnitGlobalesCol,
  UnitCreditosFianzas, UnitDescObservacion, UnitInfGeneral, UnitImpresion,
  UnitMain, UnitConsultaProductos, unitGlobales,Zlib, UnitHabilitaFianza, UnitInformacionBancoldexEnte;

{$R *.dfm}

procedure TFrmEnteAprobador.FormCreate(Sender: TObject);
begin
        self.Width := 674;
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBente.Database := dmGeneral.IBDatabase1;
        IBcomite.Database := dmGeneral.IBDatabase1;
        IBobservacion.Database := dmGeneral.IBDatabase1;
        IBlinea.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBsolicitud.Database := dmGeneral.IBDatabase1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBQuery3.Database := dmGeneral.IBDatabase1;
        IBQuery4.Database := dmGeneral.IBDatabase1;
        IBfoto.Database := dmGeneral.IBDatabase1;
        IBSQL3.Database := dmgeneral.IBDatabase1;
        IBSQL4.Database := dmGeneral.IBDatabase1;
        IBSQL5.Database := dmGeneral.IBDatabase1;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction2.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction3.DefaultDatabase := dmGeneral.IBDatabase1;
        IBente.Open;
        IBente.Last;
        DmSolicitud := TDmSolicitud.Create(self);
end;

procedure TFrmEnteAprobador.BTbuscarClick(Sender: TObject);
var     numero,id_pagointeres :Integer;
        descuentos :string;
        opcion :Boolean;
        vId_Inversion :Integer;
begin
        if (DBente.KeyValue = 1) or (DBente.KeyValue = 0) then
           EDacta.Text := FormatDateTime('YYMMDD',vFechaEnte)
        else
           EDacta.Text := frmMain.n_acta;
        CDcodeudores.CancelUpdates;
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
        if DmSolicitud.IBSolicitud1.Transaction.InTransaction then
           DmSolicitud.IBSolicitud1.Transaction.Commit;
        DmSolicitud.IBSolicitud1.Transaction.StartTransaction;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,');
          SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          //SQL.Add('"col$amortizacion".DESCRIPCION,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".VALOR_SOLICITADO,');
          SQL.Add('"col$solicitud".LINEA,');
          SQL.Add('"col$solicitud".PLAZO,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$solicitud".PAGO_INTERES,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION,');
          SQL.Add('"col$solicitud".OFICINA,');
          SQL.Add('"col$solicitud".DESTINO,');
          SQL.Add('"col$solicitud".INVERSION,');
          SQL.Add('"col$solicitud".GARANTIA,');
          SQL.Add('"col$solicitud".ID_EMPLEADO,');
          SQL.Add('"col$solicitud".ENTE_APROBADOR,');
          SQL.Add('"col$solicitud".TASA_INTERES,');
          SQL.Add('"col$solicitud".PLAZO_APROBADO,');
          SQL.Add('"col$solicitud".DESCRIPCION_GARANTIA,');
          SQL.Add('"col$solicitud".NUMERO_CODEUDORES,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".ID_ANALISIS,');
          SQL.Add('"col$solicitud".EXP_CREDITOS,');
          SQL.Add('"col$solicitud".AMORTIZACION,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$respaldo" ON ("col$solicitud".RESPALDO = "col$respaldo".ID_RESPALDO)');
          SQL.Add('INNER JOIN "col$lineas" ON ("col$solicitud".LINEA = "col$lineas".ID_LINEA)');
          SQL.Add('INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA = "col$garantia".ID_GARANTIA)');
          SQL.Add('INNER JOIN "col$clasificacion" ON ("col$solicitud".CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$solicitud".TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = "col$estadosolicitud".ID_ESTADO),');
          //SQL.Add('INNER JOIN "col$amortizacion" ON ("col$solicitud".AMORTIZACION = "col$amortizacion".ID_AMORTIZACION),');
          SQL.Add('"col$inversion"');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ExecQuery;
          //DBente.KeyValue := FieldByName('ENTE_APROBADOR').AsInteger;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitud No encontrada',mtInformation,[mbok],0);
            Msolicitud.SetFocus;
            Exit;
          end
          else if FieldByName('ESTADO').AsInteger in [1,4,5,6,7] then // ojo agregar 9
          begin
            MessageDlg('La Solicitud Se Encuentra: '+ FieldByName('DESCRIPCION_ESTADO').AsString,mtInformation,[mbok],0);
            Msolicitud.SetFocus;
            Exit;
          end
          else if FieldByName('ESTADO').AsInteger = 9 then// OJO CON EL ESTADO
          begin
            if MessageDlg('La solicitud se Encuentra Aplazada, Desea Continuar',mtInformation,[mbyes,mbno],0) = mrno then
            begin
              Msolicitud.SetFocus;
              Exit;
              end;
          end
          else if (DBente.KeyValue = 3) and (FieldByName('ESTADO').AsInteger <> 8) then
          begin
            if MessageDlg('La solicitud no ha Pasado por Comite de Créditos',mtInformation,[mbyes,mbno],0) = mrno then
            begin
               Msolicitud.SetFocus;
               Exit;
            end;
          end;
          PageControl1.Enabled := True;
          IBlinea.Open;
          DBlinea.KeyValue := FieldByName('LINEA').AsInteger;
          id_analisis := FieldByName('ID_ANALISIS').AsString;
          JVcdat.Value := 0;
          JVcontractual.Value := 0;
          JVjuvenil.Value := 0;
          vId_Inversion := FieldByName('INVERSION').AsInteger;
          EDclasificacion.Text := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
          JVamortizacion.Caption := 'CADA ' + FieldByName('AMORTIZACION').AsString + ' DIAS';
          JVrespaldo.Caption := FieldByName('DESCRIPCION_RESPALDO').AsString;
          JVtipocuota.Caption := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
          JVgarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString;
          JVtasaa.Value := SimpleRoundTo(FieldByName('TASA_INTERES').AsFloat,-2);
          JVfecha.Caption := FormatDateTime('yyyy/MM/dd',FieldByName('FECHA_RECEPCION').AsDateTime);
          JVvalora.Value := FieldByName('VALOR_APROBADO').AsCurrency;
          id_garantia := FieldByName('GARANTIA').AsInteger;
          JVplazoa.Value := FieldByName('PLAZO_APROBADO').AsInteger;
          JVvalor.Value := FieldByName('VALOR_SOLICITADO').AsCurrency;
          EDgarantia.Text := FieldByName('DESCRIPCION_GARANTIA').AsString;
          JVmes.Text := CurrToStr(SimpleRoundTo(JVplazoa.Value / 30,-1));
          //EDinversion.Text := FieldByName('DESTINO').AsString;
          JVplazo.Value := FieldByName('PLAZO_APROBADO').AsInteger;
          id_pagointeres := FieldByName('PAGO_INTERES').AsInteger;
          id_linea := FieldByName('LINEA').AsInteger;
          JVcodeudores.Caption := num_codeudor[FieldByName('NUMERO_CODEUDORES').AsInteger]+ ' ( ' + IntToStr(FieldByName('NUMERO_CODEUDORES').AsInteger)+ ' )';
          oficina := FieldByName('OFICINA').AsInteger;
          id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          id_persona := FieldByName('ID_PERSONA').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT  DESCRIPCION_INVERSION FROM "col$inversion" WHERE (ID_INVERSION = :ID_INVERSION)');
          ParamByName('ID_INVERSION').AsInteger := vId_Inversion;
          ExecQuery;
          EDinversion.Text := FieldByName('DESCRIPCION_INVERSION').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$lineas".TASA');
          SQL.Add('FROM');
          SQL.Add('"col$lineas"');
          SQL.Add('WHERE');
          SQL.Add('("col$lineas".ID_LINEA = :ID_LINEA)');
          ParamByName('ID_LINEA').AsInteger := id_linea;
          ExecQuery;
          JVtasaa.Value := SimpleRoundTo(FieldByName('TASA').AsFloat,-2);
          Close;
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE');
          SQL.Add('from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ExecQuery;
          JVsolicitante.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          JVid_persona.Caption := id_persona;
          CDcodeudores.Append;
          CDcodeudores.FieldValues['id_persona'] := id_persona;
          CDcodeudores.FieldValues['id_identificacion'] := id_identificacion;
          CDcodeudores.FieldValues['nombres'] := JVsolicitante.Caption;
          CDcodeudores.FieldValues['definicion'] := 'DEUDOR';
          CDcodeudores.FieldValues['numero'] := 0;
          CDcodeudores.Post;
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$colocacion"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ExecQuery;
          if RecordCount <> 0 then
             Rsi.Checked := True
          else
             Rno.Checked := True;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger := oficina;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          JVcuenta.Caption := '20'+IntToStr(oficina)+'-'+Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
          {Close;
          SQL.Clear;
          SQL.Add('select * from "col$amortizacion"');
          SQL.Add('where ID_AMORTIZACION = :ID_AMORTIZACION');
          ParamByName('ID_AMORTIZACION').AsInteger := id_pagointeres;
          ExecQuery;}
          JVpagointeres.Caption := 'CADA '+ IntToStr(id_pagointeres) + ' DIAS';
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$codeudor"');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
          SQL.Add('order by ID_ENTRADA');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ExecQuery;
          while not Eof do
          begin
            with DmSolicitud.IBsolicitud1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select PRIMER_APELLIDO,NOMBRE,SEGUNDO_APELLIDO FROM "gen$persona"');
              SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
              ParamByName('ID_PERSONA').AsString := DmSolicitud.IBSQL1.FieldByName('ID_PERSONA').AsString;
              ParamByName('ID_IDENTIFICACION').AsInteger := DmSolicitud.IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger;
              Open;
              CDcodeudores.Append;
              CDcodeudores.FieldValues['id_persona'] := DmSolicitud.IBSQL1.FieldByName('ID_PERSONA').AsString;
              CDcodeudores.FieldValues['id_identificacion'] := DmSolicitud.IBSQL1.FieldByName('ID_IDENTIFICACION').AsInteger;
              CDcodeudores.FieldValues['nombres'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' '+ FieldByName('SEGUNDO_APELLIDO').AsString;
              if DmSolicitud.IBSQL1.FieldByName('ES_CONYUGUE').AsInteger = 0 then
                 CDcodeudores.FieldValues['definicion'] := 'CODEUDOR(' + DmSolicitud.IBSQL1.FieldByName('ID_ENTRADA').AsString + ')'
              else
                 CDcodeudores.FieldValues['definicion'] := 'CONYUGUE';
              CDcodeudores.FieldValues['numero'] := DmSolicitud.IBSQL1.FieldByName('ID_ENTRADA').AsInteger;
              CDcodeudores.Post;
            end;
            Next;
          end;
          descuentos := _sDescuentos;
          Close;
          SQL.Clear;
          SQL.Add('select "col$infbancoldex".NO_BANCOLDEX,');
          SQL.Add('"col$infbancoldex".EMPLEOS_ACT,"col$infbancoldex".EMPLEOS_GENERAR,"col$infbancoldex".TIPO_SOCIEDAD,');
          SQL.Add('"col$infbancoldex".DESTINO1,"col$infbancoldex".DESTINO2,"col$infbancoldex".DESTINO3,');
          SQL.Add('"col$infbancoldex".MONTO1,"col$infbancoldex".MONTO2,"col$infbancoldex".MONTO3,');
          SQL.Add('"col$infbancoldex".GARANTIA1,"col$infbancoldex".GARANTIA2,"col$infbancoldex".GARANTIA3,');
          SQL.Add('"col$infbancoldex".VALORGAR1,"col$infbancoldex".VALORGAR2,"col$infbancoldex".VALORGAR3,');
          SQL.Add('"col$infbancoldex".TOTAL_ACTIVOS,"col$infbancoldex".FECHA_CORTE_ACTIVOS,');
          SQL.Add('"col$infbancoldex".LINEA_BANCOLDEX,"col$infbancoldex".VISITA,"col$infbancoldex".FECHA_VISITA,"col$creditosbancoldex".ID_LINEA');
          SQL.Add('from "col$infbancoldex"');
          SQL.Add('inner join "col$creditosbancoldex" on ("col$infbancoldex".LINEA_BANCOLDEX = "col$creditosbancoldex".LINEA)');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ExecQuery;
          if RecordCount > 0 then begin
            LineaBancoldex := FieldByName('LINEA_BANCOLDEX').AsString;
            NoBancoldex := FieldByName('NO_BANCOLDEX').AsString;
            if LineaBancoldex <> '' then begin
              Bancoldex := True;
              frmInformacionBancoldexEnte := TfrmInformacionBancoldexEnte.Create(Self);
              frmInformacionBancoldexEnte.CDBancoldex.CancelUpdates;
              frmInformacionBancoldexEnte.CDDestinoB.CancelUpdates;
              frmInformacionBancoldexEnte.CDGarantiaB.CancelUpdates;
              frmInformacionBancoldexEnte.LineaB := FieldByName('ID_LINEA').AsInteger;
              frmInformacionBancoldexEnte.CDBancoldex.Append;
              frmInformacionBancoldexEnte.CDBancoldex.FieldValues['NO_BANCOLDEX'] := FieldByName('NO_BANCOLDEX').AsString;
              frmInformacionBancoldexEnte.CDBancoldex.FieldValues['EMPLEOS_ACT'] := FieldByName('EMPLEOS_ACT').AsString;
              frmInformacionBancoldexEnte.CDBancoldex.FieldValues['EMPLEOS_GENERAR'] := FieldByName('EMPLEOS_GENERAR').AsString;
              frmInformacionBancoldexEnte.CDBancoldex.FieldValues['TOTAL_ACTIVOS'] := FieldByName('TOTAL_ACTIVOS').AsString;
              frmInformacionBancoldexEnte.CDBancoldex.FieldValues['FECHA_ACTIVOS'] := FieldByName('FECHA_CORTE_ACTIVOS').AsString;
              if IBSQL3.Transaction.InTransaction then
                IBSQL3.Transaction.Rollback;
              IBSQL3.Transaction.StartTransaction;
              if FieldByName('DESTINO1').AsInteger > 0 then begin
                IBSQL3.Close;
                IBSQL3.ParamByName('CODIGO').AsInteger := FieldByName('DESTINO1').AsInteger;
                IBSQL3.ExecQuery;
                frmInformacionBancoldexEnte.CDDestinoB.Append;
                frmInformacionBancoldexEnte.CDDestinoB.FieldValues['NO'] := 1;
                frmInformacionBancoldexEnte.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
                frmInformacionBancoldexEnte.CDDestinoB.FieldValues['MONTO'] := FieldByName('MONTO1').AsCurrency;
                frmInformacionBancoldexEnte.CDDestinoB.Post;
              end;
              if FieldByName('DESTINO2').AsInteger > 0 then begin
                IBSQL3.Close;
                IBSQL3.ParamByName('CODIGO').AsInteger := FieldByName('DESTINO2').AsInteger;
                IBSQL3.ExecQuery;
                frmInformacionBancoldexEnte.CDDestinoB.Append;
                frmInformacionBancoldexEnte.CDDestinoB.FieldValues['NO'] := 2;
                frmInformacionBancoldexEnte.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
                frmInformacionBancoldexEnte.CDDestinoB.FieldValues['MONTO'] := FieldByName('MONTO2').AsCurrency;
                frmInformacionBancoldexEnte.CDDestinoB.Post;
              end;
              if FieldByName('DESTINO3').AsInteger > 0 then begin
                IBSQL3.Close;
                IBSQL3.ParamByName('CODIGO').AsInteger := FieldByName('DESTINO3').AsInteger;
                IBSQL3.ExecQuery;
                frmInformacionBancoldexEnte.CDDestinoB.Append;
                frmInformacionBancoldexEnte.CDDestinoB.FieldValues['NO'] := 3;
                frmInformacionBancoldexEnte.CDDestinoB.FieldValues['DESTINO'] := IBSQL3.FieldByName('NOMBRE').AsString;
                frmInformacionBancoldexEnte.CDDestinoB.FieldValues['MONTO'] := FieldByName('MONTO3').AsCurrency;
                frmInformacionBancoldexEnte.CDDestinoB.Post;
              end;
              if FieldByName('GARANTIA1').AsInteger > 0 then begin
                IBSQL4.Close;
                IBSQL4.ParamByName('CODIGO').AsInteger := FieldByName('GARANTIA1').AsInteger;
                IBSQL4.ExecQuery;
                frmInformacionBancoldexEnte.CDGarantiaB.Append;
                frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['NO'] := 1;
                frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
                frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['VALORG'] := FieldByName('VALORGAR1').AsCurrency;
                frmInformacionBancoldexEnte.CDGarantiaB.Post;
              end;
              if FieldByName('GARANTIA2').AsInteger > 0 then begin
                IBSQL4.Close;
                IBSQL4.ParamByName('CODIGO').AsInteger := FieldByName('GARANTIA2').AsInteger;
                IBSQL4.ExecQuery;
                frmInformacionBancoldexEnte.CDGarantiaB.Append;
                frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['NO'] := 2;
                frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
                frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['VALORG'] := FieldByName('VALORGAR2').AsCurrency;
                frmInformacionBancoldexEnte.CDGarantiaB.Post;
              end;
              if FieldByName('GARANTIA3').AsInteger > 0 then begin
                IBSQL4.Close;
                IBSQL4.ParamByName('CODIGO').AsInteger := FieldByName('GARANTIA3').AsInteger;
                IBSQL4.ExecQuery;
                frmInformacionBancoldexEnte.CDGarantiaB.Append;
                frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['NO'] := 3;
                frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['CLASEG'] := IBSQL4.FieldByName('NOMBRE').AsString;
                frmInformacionBancoldexEnte.CDGarantiaB.FieldValues['VALORG'] := FieldByName('VALORGAR3').AsCurrency;
                frmInformacionBancoldexEnte.CDGarantiaB.Post;
              end;
              frmInformacionBancoldexEnte.CDBancoldex.FieldValues['LINEA'] := FieldByName('LINEA_BANCOLDEX').AsString;
              frmInformacionBancoldexEnte.CDBancoldex.FieldValues['VISITA'] := FieldByName('VISITA').AsInteger;
              frmInformacionBancoldexEnte.CDBancoldex.FieldValues['FECHA_VISITA'] := FieldByName('FECHA_VISITA').AsDateTime;
              IBSQL5.Close;
              IBSQL5.ParamByName('TIPO').AsInteger := FieldByName('TIPO_SOCIEDAD').AsInteger;
              IBSQL5.ExecQuery;
              frmInformacionBancoldexEnte.CDBancoldex.FieldValues['TIPO_SOCIEDAD'] := IBSQL5.FieldByName('DESCRIPCION').AsString;
              frmInformacionBancoldexEnte.CDBancoldex.Post;

              // Saldo Bancoldex
              Close;
              SQL.Clear;
              SQL.Add('select TASA_EA, PUNTOS_ADIC, SALDO from "col$creditosbancoldex" where linea = :Linea and id_obligacion = :obligacion');
              ParamByName('LINEA').AsString := LineaBancoldex;
              ParamByName('OBLIGACION').AsString := NoBancoldex;
              ExecQuery;
              SaldoBancoldex := FieldByName('SALDO').AsCurrency;
//              JVtasaa.Value := SimpleRoundTo(BuscoTasaEfectivaMaximaDtfNueva(IBQuery4,fFechaActual) + FieldByName('PUNTOS_ADIC').AsFloat,-2);
              if JVvalora.Value > SaldoBancoldex then
                MessageDlg('No se Puede Aprobar Porque El Valor Solicitado Supera el Saldo Bancoldex',mtWarning,[mbok],0);

              frmInformacionBancoldexEnte.Saldo := SaldoBancoldex;
              frmInformacionBancoldexEnte.Analisis := True;
              frmInformacionBancoldexEnte.Solicitud := Msolicitud.Text;
            end;
          end;


          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$infcrediticia".ID_COLOCACION');
          SQL.Add('FROM');
          SQL.Add('"gen$infcrediticia"');
          SQL.Add('WHERE');
          SQL.Add('("gen$infcrediticia".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("gen$infcrediticia".ES_DESCUENTO = 1)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ExecQuery;
          opcion := True;
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
          Close;
          SQL.Clear;
          SQL.Add('select NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO from "gen$empleado"');
          SQL.Add('where ID_EMPLEADO = :id_analisis');
          ParamByName('ID_ANALISIS').AsString := id_analisis;
          ExecQuery;
          n_analista := FieldByName('NOMBRE').AsString + ' '+ FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Mconcepto.Text := descuentos;
          IBobservacion.Close;
          IBobservacion.ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          IBobservacion.Open;
          IBobservacion.Last;
          aportes;
          PageControl1.ActivePageIndex := 0;
          Panel1.Enabled := False;
        end;
        IBfoto.Close;
        IBfoto.ParamByName('ID_PERSONA').AsString := id_persona;
        IBfoto.ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
        IBfoto.Open;

        CDcodeudores.IndexFieldNames := 'numero';
end;

procedure TFrmEnteAprobador.cmChildKey(var msg: TWMKEY);
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

procedure TFrmEnteAprobador.BitBtn3Click(Sender: TObject);
begin
         if CDcodeudoresdefinicion.Text = 'CONYUGUE' then
            Exit;

          with DmSolicitud.IBSQL1 do
          begin
           if CDcodeudoresdefinicion.Text = 'DEUDOR' then
           begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"col$solicitud".EXP_CREDITOS,');
            SQL.Add('"col$solicitud".SOLV_ECONOMICA, ');
            SQL.Add('"col$solicitud".DISPONIBILIDAD AS DISPAGO,');
            SQL.Add('"col$solicitud".VALOR_CUOTA,');
            SQL.Add('"col$solicitud".DEDUCCIONES,');
            SQL.Add('"col$solicitud".DISPONIBLE,');
            SQL.Add('"col$solicitud".INGRESOS');
            SQL.Add('FROM');
            SQL.Add('"col$solicitud"');
        end
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$codeudor".EXP_CREDITOS,');
          SQL.Add('"col$codeudor".SOLV_ECONOMICA,');
          SQL.Add('"col$codeudor".DISP_PAGO AS DISPAGO,');
          SQL.Add('"col$codeudor".VALOR_CUOTA,');
          SQL.Add('"col$codeudor".DEDUCCIONES,');
          SQL.Add('"col$codeudor".DISPONIBLE,');
          SQL.Add('"col$codeudor".INGRESOS');
          SQL.Add('FROM');
          SQL.Add('"col$codeudor"');
        end;
          SQL.Add('WHERE');
          SQL.Add('(ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('(ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('(ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('Registros No Encontrados',mtInformation,[mbok],0);
            Exit;
          end;
          FrmAnalisisPago := TFrmAnalisisPago.Create(self);
          FrmAnalisisPago.Caption := 'Análisis de '+CDcodeudoresnombres.Value;
          FrmAnalisisPago.JVinresos.Value := FieldByName('INGRESOS').AsCurrency;
          FrmAnalisisPago.JVdeduccion.Value := FieldByName('DEDUCCIONES').AsCurrency;
          FrmAnalisisPago.JVdisponible.Value := FieldByName('DISPONIBLE').AsCurrency;
          FrmAnalisisPago.JVdisppago.Value := FieldByName('DISPAGO').AsCurrency;
          FrmAnalisisPago.JVcuota.Value := FieldByName('VALOR_CUOTA').AsCurrency;
          FrmAnalisisPago.JVsolvencia.Checked := IntToBool(abs(FieldByName('SOLV_ECONOMICA').AsInteger));
          FrmAnalisisPago.JVexperencia.Text := FieldByName('EXP_CREDITOS').AsString;
          FrmAnalisisPago.ShowModal;
          Close;
       end;

end;

procedure TFrmEnteAprobador.BitBtn5Click(Sender: TObject);
var     valor_creditos :Currency;
begin
        valor_creditos := 0;
        FrmCreditosFianzas := TFrmCreditosFianzas.Create(self);
        FrmCreditosFianzas.Caption := 'Creditos de : '+CDcodeudoresnombres.Text;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS "saldo",');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add(' ("col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN(7,8,5,4))');
          SQL.Add('ORDER BY');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION');
          ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          execquery;
          if RecordCount = 0 then
          begin
            MessageDlg('No Posee Créditos Vigentes',mtInformation,[mbok],0);
            Exit;
          end;
          while not Eof do
          begin
             valor_creditos := valor_creditos + FieldByName('saldo').AsCurrency;
             FrmCreditosFianzas.CDcredito.Append;
             FrmCreditosFianzas.CDcredito.FieldValues['colocacion'] := FieldByName('ID_COLOCACION').AsString;
             FrmCreditosFianzas.CDcredito.FieldValues['saldo'] := FieldByName('saldo').AsCurrency;
             FrmCreditosFianzas.CDcredito.FieldValues['fecha'] := FieldByName('FECHA_INTERES').AsDateTime;
             FrmCreditosFianzas.CDcredito.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
             FrmCreditosFianzas.CDcredito.FieldValues['valor'] :=  FieldByName('VALOR_DESEMBOLSO').AsCurrency;
             FrmCreditosFianzas.CDcredito.Post;
             Next;
          end;
          FrmCreditosFianzas.label1.Caption := 'Total Saldo Créditos Vigentes';
          FrmCreditosFianzas.valor.Value := valor_creditos;
          FrmCreditosFianzas.ShowModal;
        end;

end;

procedure TFrmEnteAprobador.BitBtn1Click(Sender: TObject);
var     valor_creditos :Currency;
begin
        valor_creditos := 0;
        FrmCreditosFianzas := TFrmCreditosFianzas.Create(self);
        FrmCreditosFianzas.Caption := 'Fianzas de : '+CDcodeudoresnombres.Text;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION');
          SQL.Add('FROM');
          SQL.Add('"col$colgarantias"');
          SQL.Add('INNER JOIN "col$colocacion" ON ("col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION) AND ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$colgarantias".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN (7,8,5,4))');
          ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('No Posee Fianzas Vigentes',mtInformation,[mbok],0);
            Exit;
          end;
          while not Eof do
          begin
             valor_creditos := valor_creditos + FieldByName('saldo').AsCurrency;
             FrmCreditosFianzas.CDcredito.Append;
             FrmCreditosFianzas.CDcredito.FieldValues['colocacion'] := FieldByName('ID_COLOCACION').AsString;
             FrmCreditosFianzas.CDcredito.FieldValues['saldo'] := FieldByName('saldo').AsCurrency;
             FrmCreditosFianzas.CDcredito.FieldValues['fecha'] := FieldByName('FECHA_INTERES').AsDateTime;
             FrmCreditosFianzas.CDcredito.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
             FrmCreditosFianzas.CDcredito.FieldValues['valor'] := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
             FrmCreditosFianzas.CDcredito.Post;
             Next;
          end;
          FrmCreditosFianzas.label1.Caption := 'Total Saldo Fianzas Vigentes';
          FrmCreditosFianzas.valor.Value := valor_creditos;
          FrmCreditosFianzas.Caption := 'Fianzas de ' + CDcodeudoresnombres.Value;
          FrmCreditosFianzas.ShowModal;
        end;

end;

procedure TFrmEnteAprobador.BitBtn6Click(Sender: TObject);
begin
        with dmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$observacion".OBSERVACION');
          SQL.Add('FROM');
          SQL.Add('"col$observacion"');
          SQL.Add('WHERE');
          SQL.Add('("col$observacion".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("col$observacion".ID_OBSERVACION = :ID_OBSERVACION)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          try
          ParamByName('ID_OBSERVACION').AsInteger := DBobservacion.KeyValue;
          except
          begin
          MessageDlg('Debe Seleccionar un Tipo de Observacion',mtWarning,[mbok],0);
          DBobservacion.SetFocus;
          Exit;
          end;
          end;
          ExecQuery;
          FrmDescObsrevacion := TFrmDescObsrevacion.Create(Self);
          FrmDescObsrevacion.Caption := DBobservacion.Text;
          FrmDescObsrevacion.Mobservacion.Text := FieldByName('OBSERVACION').AsString;
          FrmDescObsrevacion.ShowModal;
          Close;
        end;
end;

procedure TFrmEnteAprobador.aportes;
var     saldo_inicial, saldo_actual, total_canje, total_movimiento, Saldo_cdat :Currency;
        cuenta, agencia, tipo :Integer;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('Select "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
          SQL.Add('Where');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
          SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
          SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION >= 1');
          ParamByName('ID_IDENTIFICACION').AsInteger := Id_identificacion;
          ParamByName('ID_PERSONA').AsString  := id_persona;
          ExecQuery;
          while not Eof do
          begin
            tipo := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
//            digito_cuenta := FieldByName('DIGITO_CUENTA').AsInteger;
            agencia := FieldByName('ID_AGENCIA').AsInteger;
            total_movimiento := 0;
            saldo_inicial := 0;
            saldo_actual := 0;
            total_canje := 0;
            Saldo_cdat := 0;
            with DmSolicitud.IBSQL2 do
            begin
              Close;
//              if Transaction.InTransaction then
//                 Transaction.Commit;
//              Transaction.StartTransaction;
              if tipo = 6 then
              begin
                SQL.Clear;
                SQL.Add('SELECT DISTINCT');
                SQL.Add('"cap$maestro".VALOR_INICIAL');
                SQL.Add('FROM');
                SQL.Add('"cap$maestro"');
                SQL.Add('WHERE');
                SQL.Add('("cap$maestro".ID_AGENCIA = :ID_AGENCIA) AND');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA) AND');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = :TIPO)AND');
                SQL.Add('("cap$maestro".ID_ESTADO IN (1,6))');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('TIPO').AsInteger := tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
                ExecQuery;
                if RecordCount <> 0 then
                   Saldo_cdat := FieldByName('VALOR_INICIAL').AsCurrency;
                Close;
              end
              else
              begin
              SQL.Clear;
              SQL.Add('Select "cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestro"');
              SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestro".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND ');
              SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ');
              SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
              SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              SQL.Add('Where');
              SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
              SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
              SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
              SQL.Add('"cap$maestro".ID_ESTADO in (1,6) and');
              SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
              ParamByName('ID_AGENCIA').AsInteger := agencia;
              ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
              ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
              ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
              ExecQuery;
              if RecordCount > 0 then
                 Saldo_Inicial := FieldByName('SALDO_INICIAL').AsCurrency;
              Close;
              SQL.Clear;
              SQL.Add('SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS SUMA from "cap$maestro"');
              SQL.Add('LEFT JOIN "cap$extracto" ON ("cap$maestro".ID_AGENCIA = "cap$extracto".ID_AGENCIA) AND ');
              SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$extracto".ID_TIPO_CAPTACION) AND ');
              SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$extracto".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$extracto".DIGITO_CUENTA)');
              SQL.Add('Where');
              SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
              SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
              SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
              SQL.Add('"cap$maestro".ID_ESTADO in (1,6) and');
              SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
              ParamByName('ID_AGENCIA').AsInteger := agencia;
              ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
              ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
              ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
              ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
              ExecQuery;
              if RecordCount > 0 then
                 Saldo_Actual := FieldByName('SUMA').AsCurrency;
             Close;
             SQL.Clear;
             SQL.Add('SELECT SUM("cap$canje".VALOR_CHEQUE + "cap$canje".VALOR_MONEDAS) AS CANJE');
             SQL.Add('FROM');
             SQL.Add('"cap$maestro"');
             SQL.Add('LEFT JOIN "cap$canje" ON ("cap$maestro".ID_AGENCIA = "cap$canje".ID_AGENCIA) AND ');
             SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$canje".ID_TIPO_CAPTACION) AND ("cap$maestro".NUMERO_CUENTA = "cap$canje".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$canje".DIGITO_CUENTA)');
             SQL.Add('Where');
             SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
             SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
             SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
              SQL.Add('"cap$maestro".ID_ESTADO = 1 and');             
             SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
             SQL.Add('"cap$canje".LIBERADO = 0 and');
             SQL.Add('"cap$canje".DEVUELTO = 0');
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
             ExecQuery;
             if RecordCount > 0 then
                total_canje := FieldByName('CANJE').AsCurrency;
             end;
             total_movimiento := Saldo_Actual + saldo_inicial + total_canje;
             end;
          if tipo = 1 then
             JVaportes.Value := JVaportes.Value + total_movimiento
          else if tipo = 2 then
             JVahorro.Value := JVahorro.Value + total_movimiento
          else if tipo = 5 then
            JVcontractual.Value := JVcontractual.Value + total_movimiento
          else if tipo = 4 then
            JVjuvenil.Value := JVjuvenil.Value + total_movimiento
          else if tipo = 6 then
            JVcdat.Value := JVcdat.Value + Saldo_cdat;
            Next;
          end;
        end;
end;

procedure TFrmEnteAprobador.MconceptoExit(Sender: TObject);
begin
        Mconcepto.Text := UpperCase(Mconcepto.Text);
end;

procedure TFrmEnteAprobador.CHverificaClick(Sender: TObject);
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

procedure TFrmEnteAprobador.BitBtn2Click(Sender: TObject);

begin
        FrmInfGeneral := TFrmInfGeneral.Create(Self);
        FrmInfGeneral.Caption := 'Informacion General de: ' + CDcodeudoresnombres.Value;
        with FrmInfGeneral do
        begin
          IBvivienda.Close;
          IBestudio.Close;
          DBestudio.KeyValue := -1;
          DBvivienda.KeyValue := -1;
          IBvivienda.Open;
          IBestudio.Open;
          IBbienes.Close;
          IBbienes.ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          IBbienes.ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          IBbienes.ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          IBbienes.Open;
          IBvehiculo.Close;
          IBvehiculo.ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          IBvehiculo.ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          IBvehiculo.Open;
          IBcrediticia.Close;
          IBcrediticia.ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          IBcrediticia.ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          IBcrediticia.ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          IBcrediticia.Open;
          PageControl1.ActivePageIndex := 0;
          DmSolicitud.IBSQL1.Close;
          DmSolicitud.IBSQL1.SQL.Clear;
          DmSolicitud.IBSQL1.SQL.Add('SELECT');
          DmSolicitud.IBSQL1.SQL.Add('"gen$infpersona".ID_VIVIENDA,');
          DmSolicitud.IBSQL1.SQL.Add('"gen$infpersona".ID_ESTUDIO,');
          DmSolicitud.IBSQL1.SQL.Add('"gen$infpersona".OCUPACION');
          DmSolicitud.IBSQL1.SQL.Add('FROM');
          DmSolicitud.IBSQL1.SQL.Add('"gen$infpersona"');
          DmSolicitud.IBSQL1.SQL.Add('WHERE');
          DmSolicitud.IBSQL1.SQL.Add('("gen$infpersona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          DmSolicitud.IBSQL1.SQL.Add('("gen$infpersona".ID_PERSONA = :ID_PERSONA)');
          DmSolicitud.IBSQL1.ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          DmSolicitud.IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          DmSolicitud.IBSQL1.ExecQuery;
          DBestudio.KeyValue := DmSolicitud.IBSQL1.FieldByName('ID_ESTUDIO').AsInteger;
          DBvivienda.KeyValue := DmSolicitud.IBSQL1.FieldByName('ID_VIVIENDA').AsInteger;
          Ocupacion.Text := DmSolicitud.IBSQL1.FieldByName('OCUPACION').AsString;
          DmSolicitud.IBSQL1.Close;
          DmSolicitud.IBSQL1.SQL.Clear;
          DmSolicitud.IBSQL1.SQL.Add('SELECT');
          DmSolicitud.IBSQL1.SQL.Add('"gen$persona".PROFESION,');
          DmSolicitud.IBSQL1.SQL.Add('"gen$persona".EMPRESA_LABORA,');
          DmSolicitud.IBSQL1.SQL.Add('"gen$persona".CARGO_ACTUAL');
          DmSolicitud.IBSQL1.SQL.Add('FROM');
          DmSolicitud.IBSQL1.SQL.Add('"gen$persona"');
          DmSolicitud.IBSQL1.SQL.Add('WHERE');
          DmSolicitud.IBSQL1.SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          DmSolicitud.IBSQL1.SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA)');
          DmSolicitud.IBSQL1.ParamByName('ID_PERSONA').AsString := CDcodeudoresid_persona.Value;
          DmSolicitud.IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := CDcodeudoresid_identificacion.Value;
          DmSolicitud.IBSQL1.ExecQuery;
          Cargo.Text := DmSolicitud.IBSQL1.FieldByName('CARGO_ACTUAL').AsString;
          Profesion.Text := DmSolicitud.IBSQL1.FieldByName('PROFESION').AsString;
          Empresa.Text := DmSolicitud.IBSQL1.FieldByName('EMPRESA_LABORA').AsString;
          DmSolicitud.IBSQL1.Close;
          ShowModal;
        end;

end;

procedure TFrmEnteAprobador.limpiar;
begin
        IBfoto.Close;
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
        Msolicitud.SetFocus;
        Bancoldex := False;
        LineaBancoldex := '';
end;

procedure TFrmEnteAprobador.BcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmEnteAprobador.BnuevoClick(Sender: TObject);
begin
        TabSheet1.Enabled := True;
        TabSheet2.Enabled := True;
        TabSheet3.TabVisible := False;
        limpiar;
end;

procedure TFrmEnteAprobador.BinformeClick(Sender: TObject);
begin
        reporte;
        if CHverifica.Checked then
          imprimir_reporte(frmMain.wpath+'reporte\repinfconsejo.frf')
        else
          imprimir_reporte(frmMain.wpath+'reporte\repinforme.frf');
end;

procedure TFrmEnteAprobador.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Dictionary.Variables.Variable['EMPRESA'] := Empresa;
        
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;


procedure TFrmEnteAprobador.frreport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'cuenta' then
           ParValue := JVcuenta.Caption;
        if ParName = 'asociado' then
           ParValue := JVsolicitante.Caption;
        if ParName = 'ente' then
           ParValue := DBente.Text;
        if ParName = 'cuenta' then
           ParValue := JVcuenta.Caption;
        if ParName = 'linea' then
           ParValue := DBlinea.Text;
        if ParName = 'oficina' then
           ParValue := Ciudad;
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
        if ParName = 'garantia' then
           ParValue := JVgarantia.Caption;
        if ParName = 'inversion' then
           ParValue := EDinversion.Text;

end;

procedure TFrmEnteAprobador.MsolicitudExit(Sender: TObject);
var     id_solicitud :string;
        estado_permiso :Boolean;
begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select "col$solicitud".ESTADO,"col$estadosolicitud".DESCRIPCION_ESTADO,"col$solicitud".VALOR_APROBADO from "col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = "col$estadosolicitud".ID_ESTADO)');
          SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
          //SQL.Add('and ESTADO IN (2,3,8)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ExecQuery;
          if RecordCount = 0 then
          begin
             MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
             Msolicitud.SetFocus;
             Exit;
          end
          else
          begin
          if FieldByName('VALOR_APROBADO').AsCurrency > Monto_EnteAprobador then
          begin
             if (Id_EnteAprobador = 1) or (Id_EnteAprobador = 2) or (Id_EnteAprobador = 3) then
             begin
               if MessageDlg('El Valor de la Solicitud Excede El Monto Permitido' + #13 + 'Monto Permitido : ' +  FormatCurr('#,##0.00',Monto_EnteAprobador) + #13 + 'Monto Solicitud: ' + FormatCurr('#,##0.00',FieldByName('VALOR_APROBADO').AsCurrency) +  #13 + 'Desea Continuar',mtinformation,[mbyes,mbno],0) = mrno then
               begin
                  Msolicitud.SetFocus;
                  Exit;
               end;
             end
             else
             begin
               with DmSolicitud.IBSQL2 do // VALIDACION SOLO PARA LAS AGENCIAS
               begin
                 Close;
                 if Transaction.InTransaction then
                    Transaction.Commit;
                 Transaction.StartTransaction;
                 SQL.Clear;
                 SQL.Add('select * from "col$permisos"');
                 SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
                 ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
                 ExecQuery;
                 if RecordCount <> 0 then
                 begin
                   id_solicitud := FieldByName('ID_SOLICITUD').AsString;
                   estado_permiso := IntToBool(FieldByName('ESTADO_PERMISO').AsShort);
                 end;
               end;
               if (id_solicitud <> Msolicitud.Text) or (estado_permiso = true) then
               begin
                 MessageDlg('El Valor de la Solicitud Excede El Monto Permitido' + #13 + 'Monto Permitido : ' +  FormatCurr('#,##0.00',Monto_EnteAprobador) + #13 + 'Monto Solicitud: ' + FormatCurr('#,##0.00',FieldByName('VALOR_APROBADO').AsCurrency),mtinformation,[mbok],0);
                 Msolicitud.SetFocus;
                 Exit;
               end;
             end;
          end;
            if FieldByName('ESTADO').AsInteger in [2,3,8,9,14] then
            begin
               DBente.KeyValue := Id_EnteAprobador;
               BTbuscar.Click;
            end
            else
            begin
              MessageDlg('La Solicitud se Encuentra en Estado : ' + FieldByName('DESCRIPCION_ESTADO').AsString,mtInformation,[MBok],0);
              Msolicitud.SetFocus;
              Exit;
            end;
          end;
        end;
        
{               DBente.KeyValue := 3
            else if FieldByName('ESTADO').AsInteger in [2,3] then
               DBente.KeyValue := FieldByName('ESTADO').AsInteger - 1
            else if FieldByName('ESTADO').AsInteger = 14 then
               DBente.KeyValue := 0;
          end;}
//            else if FieldByName('ESTADO').AsInteger = 14 then
//               DBente.KeyValue := 0;

{            else if FieldByName('ESTADO').AsInteger = 9 then
              begin
               if MessageDlg('La solicitud se Encuentra Aplazada, Desea Continuar',mtInformation,[mbyes,mbno],0) = mrno then
               begin
                 Msolicitud.SetFocus;
                 Exit;
              end;
              end}
{          if FieldByName('ESTADO').AsInteger = 9 then
             DBente.SetFocus
          else
             BTbuscar.Click;
        end;}
end;
procedure TFrmEnteAprobador.BaceptarClick(Sender: TObject);

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

        if (LineaBancoldex <> '') and (JVvalor.Value > SaldoBancoldex) then
         begin
           MessageDlg('No se puede Aprobar porque Supera el Saldo Bancoldex',mtError,[mbok],0);
           Bnuevo.Click;
         end;
{        if (TabSheet3.TabVisible = False) and (RAprobado.Checked) then
        begin
          if MessageDlg('Va ha Realizar Desembolsos Parciales?',mtInformation,[mbyes,mbno],0) = mryes then
          begin
             TabSheet3.TabVisible := True;
             PageControl1.ActivePageIndex := 2;
             JVdesembolso.Value := JVvalora.Value;
             JVresto.Value := JVvalora.Value;
             JVabono.SetFocus;
             Exit;
          end;
        end;}

        if MessageDlg('Esta Seguro de Realizar la Transaccion?',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        if (DBente.KeyValue = 2) and (CHverifica.Checked) then  // comienzo verifica tipo ente aprobador
        begin
           registra_solicitud(8);
           registra_observacion(13,Mconcepto.Text);
           registra_observacion(18,Mconcepto.Text);
           Binforme.Enabled := True;
           Baceptar.Enabled := False;
        end
        else
        begin
        if Raplazado.Checked then
        begin
          registra_solicitud(9);
          registra_observacion(15,Mconcepto.Text);
        end
        else if Rnegado.Checked then
        begin
          registra_solicitud(7);
          registra_observacion(6,Mconcepto.Text);
          bacta.Enabled := True;
          bacta.Click;
        end
        else if RAprobado.Checked then
        begin
          registra_solicitud(4);
          registra_observacion(14,Mconcepto.Text);
          //if CDparcial.RecordCount <> 0 then
          //   desembolso(1)
          //else
             desembolso(2);
          bacta.Enabled := True;
          bacta.Click;
        end;
        if (DBente.KeyValue = 2) or (DBente.KeyValue = 3) then
        begin
           registra_observacion(13,Mconcepto.Text);
           Binforme.Enabled := True;
        end;
        Baceptar.Enabled := False;
        TabSheet1.Enabled := False;
        TabSheet2.Enabled := False;
        end;

end;

procedure TFrmEnteAprobador.registra_solicitud(estado:Integer);
begin
        if estado <> 4 then
           id_garantia := -1;
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
             ParamByName('FECHA_CONCEPTO').AsDate := vFechaEnte;
             ParamByName('TASA_INTERES').AsFloat := JVtasaa.Value;
             ParamByName('PLAZO_APROBADO').AsInteger := JVplazoa.Value;
             ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
             ParamByName('ESTADO').AsInteger := estado;
             ParamByName('ES_DESEMBOLSO_PARCIAL').AsInteger := BoolToInt(CHparcial.Checked);
             ExecSQL;
             if DBlinea.KeyValue = 7 then
             begin
               SQL.Clear;
               SQL.Add('update "col$solicitud" set');
               SQL.Add('"col$solicitud".INVERSION = 3,');
               SQL.Add('"col$solicitud".CLASIFICACION = 3');
               SQL.Add('where "col$solicitud".ID_SOLICITUD = :ID_SOLICITUD');
               ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
               ExecSQL;
               Transaction.CommitRetaining;
             end;
             if Agencia <> 1 then
             begin
               SQL.Clear;
               SQL.Add('update "col$permisos"');
               SQL.Add('set ESTADO_PERMISO = 1');
               SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
               ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
               ExecSQL;
               Transaction.CommitRetaining;
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
             Filtered := False;
             Filter := 'radicado = ' + Msolicitud.Text;// + ' and id_oficina = 1';
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
             FieldValues['oficina'] := Ciudad;
             FieldValues['nombres'] := JVsolicitante.Caption;
             FieldValues['id_oficina'] := Agencia;
             FieldValues['des_estado'] := Obtener_Estado(estado);
             FieldValues['garantia'] := id_garantia;
             FieldValues['plazo'] := JVplazo.Value;
             FieldValues['cuenta'] := JVcuenta.Caption;
             Post;
           end;
           frmMain.n_acta := edacta.Text;
           frmMain.ente_arpobador := DBente.Text;
           Transaction.Commit;
        end;
end;

procedure TFrmEnteAprobador.registra_observacion(id_observacion: integer;
  concepto: string);
begin
        with DmSolicitud.IBsolicitud2 do
        begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('delete from "col$observacion"');
           SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
           SQL.Add('ID_OBSERVACION = :ID_OBSERVACION');
           ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
           ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
           ExecSQL;
           Transaction.CommitRetaining;
           SQL.Clear;
           SQL.Add('insert into "col$observacion"');
           SQL.Add('values(:ID_SOLICITUD,:ID_OBSERVACION,:OBSERVACION)');
           ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
           ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
           ParamByName('OBSERVACION').AsString := concepto;
           ExecSQL;
           Close;
           Transaction.Commit;
        end;

end;

procedure TFrmEnteAprobador.bactaClick(Sender: TObject);
begin
        CDfirmas.CancelUpdates;
        if DBente.KeyValue = 1 then
           firmas('GERENTE')
        else if DBente.KeyValue = 2 then
        begin
           firmas('PARTICIPANTE 1');
           firmas('PARTICIPANTE 2');
           firmas('PARTICIPANTE 3');
           firmas('PARTICIPANTE 4');
        end
        else if DBente.KeyValue = 3 then
           firmas('PRESIDENTE JUNTA');
        reporte;
        IBQuery3.Close;
        IBQuery3.ParamByName('ID').AsString := Msolicitud.Text;
        if RAprobado.Checked then
          IBQuery3.ParamByName('ID_OBSERVACION').AsInteger := 14
        else if Rnegado.Checked then
          IBQuery3.ParamByName('ID_OBSERVACION').AsInteger := 6
        else if Raplazado.Checked then
          IBQuery3.ParamByName('ID_OBSERVACION').AsInteger := 15;
        IBQuery3.Open;
        if (DBente.KeyValue = 1) or (DBente.KeyValue = 0) then
        begin
           if Rnegado.Checked then
             imprimir_reporte(frmMain.wpath+'reporte\repconcepto_n.frf')
           else
             imprimir_reporte(frmMain.wpath+'reporte\repconcepto.frf');
        end
        else if  (DBente.KeyValue = 3) then
        begin
           if Rnegado.Checked then
             imprimir_reporte(frmMain.wpath+'reporte\repconcepto_EN.frf')
           else
             imprimir_reporte(frmMain.wpath+'reporte\repconcepto_E1.frf');
        end
        else
        begin
           if Rnegado.Checked then
              imprimir_reporte(frmMain.wpath+'reporte\repconcepto_1_n.frf')
           else
              imprimir_reporte(frmMain.wpath+'reporte\repconcepto_1.frf');
        end;
end;

procedure TFrmEnteAprobador.reporte;
begin
        if IBTransaction2.InTransaction then
           IBTransaction2.Commit;
        IBTransaction2.StartTransaction;
        with DmSolicitud.IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          IBsolicitud.Close;
          IBsolicitud.ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          IBsolicitud.Open;
          CDestado.CancelUpdates;
          if CHverifica.Checked then
          begin
            IBQuery2.Close;
            IBQuery2.ParamByName('ID').AsString := Msolicitud.Text;
            IBQuery2.Open;
            IBcomite.Close;
            IBcomite.ParamByName('ID').AsString := Msolicitud.Text;
            IBcomite.Open;
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
           IBQuery1.Close;
           IBQuery1.ParamByName('ID').AsString := Msolicitud.Text;
           IBQuery1.Open;
           Close;
           SQL.Clear;
           SQL.Add('select ESTADO from "col$solicitud"');
           SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
           ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
           ExecQuery;
           if FieldByName('ESTADO').AsInteger = 9 then
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
          else if FieldByName('ESTADO').AsInteger = 7 then
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
          else if FieldByName('ESTADO').AsInteger = 4 then
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
        end;

end;

procedure TFrmEnteAprobador.firmas(ente:string);
begin
        with CDfirmas do
        begin
          Append;
          FieldValues['firma'] := ente;
          Post;
        end;
end;


procedure TFrmEnteAprobador.JVvaloraExit(Sender: TObject);
begin
        JVdesembolso.Value := JVvalora.Value;
end;

procedure TFrmEnteAprobador.BitBtn8Click(Sender: TObject);
begin
        CDparcial.CancelUpdates;
        JVnum.Caption := '1';
        JVresto.Value := JVdesembolso.Value;
end;

procedure TFrmEnteAprobador.BitBtn7Click(Sender: TObject);
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

function TFrmEnteAprobador.verifica_pago: Boolean;
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

function TFrmEnteAprobador.verifica_saldo: boolean;
begin
        
end;

procedure TFrmEnteAprobador.BitBtn9Click(Sender: TObject);
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

procedure TFrmEnteAprobador.desembolso(opcion:Smallint);
begin
        if DmSolicitud.IBSolicitud1.Transaction.InTransaction then
           DmSolicitud.IBSolicitud1.Transaction.Commit;
        DmSolicitud.IBSolicitud1.Transaction.StartTransaction;
        if opcion = 1 then
        begin
        with CDparcial do
        begin
          First;
          while not Eof do
          begin
            with DmSolicitud.IBSolicitud1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('delete from "col$desembolsoparcial"');
              SQL.Add('where "col$desembolsoparcial".ID_SOLICITUD = :ID_SOLICITUD');
              ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
              Open;
              SQL.Clear;
              SQL.Add('insert into "col$desembolsoparcial" values (');
              SQL.Add(':ID_SOLICITUD,:ID_DESEMBOLSO,:VALOR_DESEMBOLSO,:FECHA_DESEMBOLSO,:DESEMBOLSADO,:ID_COLOCACION,:ID_AGENCIA)');
              ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
              ParamByName('ID_DESEMBOLSO').AsInteger := CDparcial.FieldValues['numero'];
              try
                ParamByName('VALOR_DESEMBOLSO').AsCurrency := CDparcial.FieldValues['valor'];
              except
                ParamByName('VALOR_DESEMBOLSO').Clear;
              end;
              try
                ParamByName('FECHA_DESEMBOLSO').AsDateTime := CDparcial.FieldValues['fecha'];
              except
                ParamByName('FECHA_DESEMBOLSO').Clear;
              end;
              ParamByName('DESEMBOLSADO').AsInteger :=0;
              ParamByName('ID_COLOCACION').Clear;
              parambyname('ID_AGENCIA').AsInteger := oficina;
              Open;
              Close;
            end;
            Next;
          end;
        end;
        end
        else
        begin
          with DmSolicitud.IBSolicitud1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('delete from "col$desembolsoparcial"');
            SQL.Add('where "col$desembolsoparcial".ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
            Open;
            SQL.Clear;
            SQL.Add('insert into "col$desembolsoparcial"("col$desembolsoparcial".ID_SOLICITUD,"col$desembolsoparcial".ID_DESEMBOLSO,"col$desembolsoparcial".DESEMBOLSADO,"col$desembolsoparcial".ID_AGENCIA) values (:ID_SOLICITUD,:ID_DESEMBOLSO,0,:ID_AGENCIA)');
            ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
            ParamByName('ID_DESEMBOLSO').AsInteger := 1;
            parambyname('ID_AGENCIA').AsInteger := oficina;
            Open;
            Close;
          end;
        end;
        DmSolicitud.IBSolicitud1.Transaction.Commit;
end;


function TFrmEnteAprobador.retorna_fecha: tdate;
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

procedure TFrmEnteAprobador.JVplazoaExit(Sender: TObject);
begin
          JVmes.Text := CurrToStr(SimpleRoundTo(JVplazoa.Value / 30,-1));
end;

procedure TFrmEnteAprobador.InformacinGeneral1Click(Sender: TObject);
begin
            frmConsultaProductos := TfrmConsultaProductos.Create(self);
            frmConsultaProductos.id_identificacion_sol := CDcodeudoresid_identificacion.Value;
            frmConsultaProductos.id_persona_sol := CDcodeudoresid_persona.Value;
            frmConsultaProductos.ShowModal;

end;

procedure TFrmEnteAprobador.BitBtn10Click(Sender: TObject);
begin
        FrmHabilitaFianza := TFrmHabilitaFianza.Create(Self);
        FrmHabilitaFianza.vTipo := 2;
        FrmHabilitaFianza.MKsolicitud.Text := Msolicitud.Text;
        FrmHabilitaFianza.BTbuscar.Click;
        FrmHabilitaFianza.ShowModal;
end;

procedure TFrmEnteAprobador.BitBtn11Click(Sender: TObject);
begin
        if Bancoldex then
          frmInformacionBancoldexEnte.ShowModal;
end;

procedure TFrmEnteAprobador.BitBtn4Click(Sender: TObject);
begin
        if CDcodeudoresdefinicion.Value = 'DEUDOR' then
        begin
        FrmReferencias := TFrmReferencias.Create(self);
        FrmReferencias.ClientDataSet1.CancelUpdates;
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('"gen$tiposreferencia".DESCRIPCION_REFERENCIA,');
          SQL.Add('"gen$tiposparentesco".DESCRIPCION_PARENTESCO,');
          SQL.Add('"col$referencias".PRIMER_APELLIDO_REFERENCIA,');
          SQL.Add('"col$referencias".SEGUNDO_APELLIDO_REFERENCIA,');
          SQL.Add('"col$referencias".NOMBRE_REFERENCIA,');
          SQL.Add('"col$referencias".DIRECCION_REFERENCIA,');
          SQL.Add('"col$referencias".TELEFONO_REFERENCIA');
          SQL.Add('FROM');
          SQL.Add('"col$referencias"');
          SQL.Add('INNER JOIN "col$referenciasolicitud" ON ("col$referencias".ID_ENTRADA = "col$referenciasolicitud".ID_ENTRADA)');
          SQL.Add('INNER JOIN "gen$tiposreferencia" ON ("col$referencias".TIPO_REFERENCIA = "gen$tiposreferencia".ID_REFERENCIA)');
          SQL.Add(' INNER JOIN "gen$tiposparentesco" ON ("col$referencias".PARENTESCO_REFERENCIA = "gen$tiposparentesco".ID_PARENTESCO)');
          SQL.Add('WHERE');
          SQL.Add('("col$referenciasolicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          Open;
          while not Eof do
          begin
            FrmReferencias.ClientDataSet1.Append;
            FrmReferencias.ClientDataSet1.FieldValues['nombre'] := fieldbyname('NOMBRE_REFERENCIA').AsString + ' ' + fieldbyname('PRIMER_APELLIDO_REFERENCIA').AsString + ' ' +fieldbyname('SEGUNDO_APELLIDO_REFERENCIA').AsString;
            FrmReferencias.ClientDataSet1.FieldValues['telefono'] := fieldbyname('TELEFONO_REFERENCIA').AsString;
            FrmReferencias.ClientDataSet1.FieldValues['direccion'] := fieldbyname('DIRECCION_REFERENCIA').AsString;
            FrmReferencias.ClientDataSet1.FieldValues['parentesco'] := fieldbyname('DESCRIPCION_PARENTESCO').AsString;
            FrmReferencias.ClientDataSet1.FieldValues['tipo_referencia'] := fieldbyname('DESCRIPCION_REFERENCIA').AsString;
            FrmReferencias.ClientDataSet1.post;
            Next;
          end;
        end;
        FrmReferencias.ShowModal;
        end;

end;

procedure TFrmEnteAprobador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.
