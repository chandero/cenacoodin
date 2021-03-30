unit Unit_ComprobanteC;

interface                                                                 

uses
  Windows, Messages, SysUtils, Math, DateUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB,
  IB, IBCustomDataSet, IBQuery, XStringGrid, Mask, CEForm, pr_Common, pr_Parser, pr_TxClasses,
  IBSQL, JvEdit, JvTypedEdit, IBDatabase, pr_Classes,
  // Propias
  UnitPlantillas, ComCtrls, UnitdmGeneral
  ;

 type
      TComprobante = class
   end;

type
  PList = ^AList;
  AList = record
    codigo   : string;
    nomcuenta: string;
    detalle  : string;
    debito   : currency;
    credito  : currency;
    tipoide  : integer;
    idpersona: string;
    monto    : currency;
    tasa     : single;
    estado   : string;
  end;

type PCuentas = ^ACuentas;
     ACuentas = record
        Tp:Integer;
        Cuenta:Integer;
        Debitos:Currency;
        Creditos:Currency;
end;

type
  PSaldos = ^ASaldos;
  ASaldos = record
    tipo:Integer;
    numero:Integer;
    saldo:Currency;
end;

type
  TfrmComprobanteC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    editdescripcion: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnBuscar: TBitBtn;
    BtnGrabar: TBitBtn;
    BtnAnular: TBitBtn;
    Btnreporte: TBitBtn;
    Btnlimpiar: TBitBtn;
    Btncerrar: TBitBtn;
    btnrefrescar: TBitBtn;
    QueryComprobante: TIBQuery;
    XSauxiliar: TXStringGrid;
    Bevel1: TBevel;
    NoComprobante: TLabel;
    Edittotaldebito: TMemo;
    Edittotalcredito: TMemo;
    Label8: TLabel;
    editanulacion: TMemo;
    QueryComprobanteID_COMPROBANTE: TIntegerField;
    QueryComprobanteFECHADIA: TDateField;
    QueryComprobanteDESCRIPCION: TMemoField;
    QueryComprobanteTOTAL_DEBITO: TIBBCDField;
    QueryComprobanteTOTAL_CREDITO: TIBBCDField;
    QueryComprobanteESTADO: TIBStringField;
    QueryComprobanteIMPRESO: TSmallintField;
    QueryComprobanteANULACION: TMemoField;
    QueryComprobanteDESCRIPCION1: TIBStringField;
    QueryComprobanteDESCRIPCION_AGENCIA: TIBStringField;
    IBQTabla: TIBQuery;
    QueryAuxiliar: TIBQuery;
    QueryAuxiliarID_COMPROBANTE: TIntegerField;
    QueryAuxiliarID_AGENCIA: TSmallintField;
    QueryAuxiliarCODIGO: TIBStringField;
    QueryAuxiliarNOMBRE: TIBStringField;
    QueryAuxiliarDEBITO: TIBBCDField;
    QueryAuxiliarCREDITO: TIBBCDField;
    QueryAuxiliarID_CUENTA: TIntegerField;
    QueryAuxiliarID_COLOCACION: TIBStringField;
    QueryAuxiliarID_IDENTIFICACION: TSmallintField;
    QueryAuxiliarID_PERSONA: TIBStringField;
    QueryAuxiliarMONTO_RETENCION: TIBBCDField;
    QueryAuxiliarTASA_RETENCION: TFloatField;
    IBPagar: TIBSQL;
    IBOtros: TIBSQL;
    IBAuxiliar: TIBQuery;
    IBSQL1: TIBSQL;
    IBAuxiliar1: TIBQuery;
    Panel4: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    nomcta: TLabel;
    CmdPUC: TSpeedButton;
    editcodigo: TMaskEdit;
    GrupoInforme: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Edtipoid: TDBLookupComboBox;
    EdMonto: TMemo;
    EdNit: TMemo;
    EdTasa: TMemo;
    EdDebito: TJvCurrencyEdit;
    EdCredito: TJvCurrencyEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    GroupBox1: TGroupBox;
    CheckBoxcerrado: TCheckBox;
    CheckBoxanulado: TCheckBox;
    CheckBoximpreso: TCheckBox;
    PanelXS: TPanel;
    BtnAgregar: TBitBtn;
    BtnModificarGrid: TBitBtn;
    BtnEliminar: TBitBtn;
    DSTiposIdentificacion: TDataSource;
    IBQTiposIdentificacion: TIBQuery;
    IBSQL2: TIBSQL;
    Label3: TLabel;
    IBTransaction1: TIBTransaction;
    Panel5: TPanel;
    IBTransaction2: TIBTransaction;
    Label4: TLabel;
    dblcbtipo: TDBLookupComboBox;
    IBQTipoC: TIBQuery;
    DsTipoC: TDataSource;
    IBTransaction3: TIBTransaction;
    Edittotaldiferencia: TMemo;
    Label13: TLabel;
    btnGuardarPlantilla: TBitBtn;
    btnRecuperarPlantilla: TBitBtn;
    edFecha: TDateTimePicker;
    Dscomprobante: TDataSource;
    Dsauxiliar: TDataSource;
    Dsagencia: TDataSource;
    Dstipocomp: TDataSource;
    IBQuery1: TIBQuery;
    Dspersona: TDataSource;
    Dstipoid: TDataSource;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    IBVarios: TIBSQL;
    IBQsetagencia: TIBQuery;
    IBQsettipocomp: TIBQuery;
    IBQsetpersona: TIBQuery;
    IBQsettipoid: TIBQuery;
    IBQsetauxiliar: TIBQuery;
    IBQsetcomprobante: TIBQuery;
    IBDataSet1: TIBDataSet;
    BitBtn1: TBitBtn;
    Report1: TprTxReport;
    edDetalleAux: TMemo;
    Label14: TLabel;
    btnReversar: TBitBtn;
    prReport1: TprReport;
    prTxReportCartera: TprTxReport;
    prReportCartera: TprReport;

    procedure BtnGrabarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bloquear;
    procedure desbloquear;
    procedure BtncerrarClick(Sender: TObject);
    procedure BtnAgregarClick(Sender: TObject);
    procedure actualizaxsauxiliar;
    procedure CheckBoximpresoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnlimpiarClick(Sender: TObject);
    procedure editdescripcionExit(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure btnrefrescarClick(Sender: TObject);
    procedure BtnAnularClick(Sender: TObject);
    procedure CheckBoxcerradoKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxanuladoKeyPress(Sender: TObject; var Key: Char);
    procedure XSauxiliarSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure editanulacionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editanulacionExit(Sender: TObject);
    procedure editanulacionKeyPress(Sender: TObject; var Key: Char);
    procedure dblcbtipo_compKeyPress(Sender: TObject; var Key: Char);
    procedure DblcbAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure editdescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure BtnModificarGridClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnreporteClick(Sender: TObject);
    procedure CheckBoximpresoExit(Sender: TObject);
    procedure Report1PrintComplete(Sender: TObject);
    procedure EdittotaldebitoExit(Sender: TObject);
    procedure EdittotalcreditoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Report1InitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure editcodigoExit(Sender: TObject);
    procedure editcodigoEnter(Sender: TObject);
    procedure editcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EdDebitoEnter(Sender: TObject);
    procedure EdDebitoExit(Sender: TObject);
    procedure EdCreditoEnter(Sender: TObject);
    procedure EdCreditoExit(Sender: TObject);
    procedure EdtipoidEnter(Sender: TObject);
    procedure EdtipoidExit(Sender: TObject);
    procedure EdtipoidKeyPress(Sender: TObject; var Key: Char);
    procedure EdNitEnter(Sender: TObject);
    procedure EdNitExit(Sender: TObject);
    procedure EdNitKeyPress(Sender: TObject; var Key: Char);
    procedure EdTasaEnter(Sender: TObject);
    procedure EdTasaKeyPress(Sender: TObject; var Key: Char);
    procedure EdMontoEnter(Sender: TObject);
    procedure EdMontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdDebitoKeyPress(Sender: TObject; var Key: Char);
    procedure EdCreditoKeyPress(Sender: TObject; var Key: Char);
    procedure prReport1InitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure prReport1PrintComplete(Sender: TObject);
    procedure dblcbtipoKeyPress(Sender: TObject; var Key: Char);
    procedure dblcbtipoEnter(Sender: TObject);
    procedure CmdPUCClick(Sender: TObject);
    procedure btnRecuperarPlantillaClick(Sender: TObject);
    procedure btnGuardarPlantillaClick(Sender: TObject);
    procedure dblcbtipoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edDetalleAuxKeyPress(Sender: TObject; var Key: Char);
    procedure edDetalleAuxExit(Sender: TObject);
    procedure EdMontoExit(Sender: TObject);
    procedure EdTasaExit(Sender: TObject);
    procedure btnReversarClick(Sender: TObject);


  private


    function getimpreso : boolean;
    procedure setimpreso (nvalor:boolean);
    function getdescripcion:string;
    procedure setdescripcion (nvalor:string);
    function grabar : Boolean;
    function actualizar : Boolean;
    Procedure Empleado;
    function EvaluarCodigo(Codigo: string): string;
    procedure buscarcomprobante(TIPO_COMPROBANTE:Integer;ID_COMPROBANTE: integer; ID_AGENCIA:Integer);
    procedure BuscarComp(Tp, Id, Ag: Integer);
    procedure Inicializar;
    function Evaluarinforme(id : string) : string;
    function gettipoide :integer;
    procedure settipoide (nvalor:integer);
    function getmonto : currency;
    procedure setmonto (nvalor:currency);
    function gettasa : single;
    procedure settasa (nvalor:single);
    function Getdebito : currency;
    procedure Setdebito (nvalor:currency);
    function Getcredito : currency;
    procedure Setcredito (nvalor:currency);
    procedure setdetalle(nvalor:string);
    function getdetalle: string;
    function getcodigo : string;
    procedure setcodigo (nvalor:string);
    function getidpersona:string;
    procedure setidpersona(nvalor:string);
    function getestado :string;
    procedure setestado (nvalor:string);
    function getnomcuenta : string;
    procedure setnomcuenta (nvalor:string);

  public
    property impreso : boolean read getimpreso write setimpreso;
    property descripcion : string read getdescripcion write setdescripcion;
    property tipoide : integer read gettipoide write settipoide;
    property monto : currency read getmonto write setmonto;
    property tasa : single read gettasa write settasa;
    property codigo: string read getcodigo write setcodigo;
    property debito : currency read getdebito write setdebito;
    property credito : currency read getcredito write setcredito;
    property detalle: string read getdetalle write setdetalle;
    property idpersona : string read getidpersona write setidpersona;
    property estado: string read getestado write setestado;
    property nomcuenta: string read getnomcuenta write setnomcuenta;
  end;


var
  frmComprobanteC: TfrmComprobanteC;
  dmGeneral: TdmGeneral;
//  dmGeneral: TdmGeneral;
//  dmComprobante :TDmComprobante;
   
  vid_comprobante       :string;
  vfechadia             :TDate;
  vfechadiamod          :TDate;
  vtipo_comprobante     :integer;
  vdescripcion          :string;
  vdetalleaux           :string;
  vtotal_debito         :currency;
  vtotal_credito        :currency;
  vestadoc              :string;
  vimpreso              :boolean;
  vcomprobante          :integer;
  vcodigo               :string;
  vestado               :string;
  anulacion             :string;
  id_comprobante        :integer;
  id_agencia            :integer;
  id_tipocomprobante    :integer;
  codigo                :string;
  nombre                :string;
  debito                :currency;
  credito               :currency;
  nocuenta              :integer;
  nocredito             :string;
  estadoa               :string;
  vestadoa              :string;
  consecutivo           :integer;
  consec                :string;
  List                  :TList;
  posgrid               :integer;
  vmodificar            :boolean;
  estadoc               :string;
  Nombres               :String;
  Apellidos             :String;
  SCuentas              :TList;
  movimiento            :Boolean;
  vid_persona           :string;
  vprimer_ape           :string;
  vsegundo_ape          :string;
  vtipoid               :integer;
  vmonto                :currency;
  vtasa                 :single;
  vdebito               :Currency;
  vcredito              :Currency;
  id                    :string;
  vnomcuenta            :string;

implementation

uses UnitCreaciondePersona, Unit_buscarcomprobante,unit_Dmpuc, UnitGlobales, Unit_Mantenimientopuc;


{$R *.dfm}


function TfrmComprobanteC.getdescripcion : string;
begin
        result:= vdescripcion;
end;

procedure TfrmComprobanteC.setdescripcion (nvalor:string);
begin
        vdescripcion:= nvalor;
        editdescripcion.Text:= vdescripcion;

end;


function TfrmComprobanteC.getimpreso : boolean;
begin
        result:= vimpreso;
end;

procedure TfrmComprobanteC.setimpreso (nvalor:boolean);
begin
        vimpreso:= nvalor;
        checkboximpreso.Checked := vimpreso;
end;

procedure TfrmComprobanteC.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBAuxiliar1.Database := dmGeneral.IBDatabase1;
        IBAuxiliar1.Transaction := dmGeneral.IBTransaction1;
        IBQTabla.Database := dmGeneral.IBDatabase1;
        IBQTabla.Transaction := dmGeneral.IBTransaction1;
        IBPagar.Database := dmGeneral.IBDatabase1;
        IBPagar.Transaction := dmGeneral.IBTransaction1;
        IBOtros.Database := dmGeneral.IBDatabase1;
        IBOtros.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar.Database := dmGeneral.IBDatabase1;
        IBAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBQTiposIdentificacion.Database := dmGeneral.IBDatabase1;
        IBQTiposIdentificacion.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBSQL2.Transaction := dmGeneral.IBTransaction1;
        IBQTabla.Database := dmGeneral.IBDatabase1;
        IBQTabla.Transaction := dmGeneral.IBTransaction1;
        IBQTiposIdentificacion.Database := dmGeneral.IBDatabase1;
        IBQTiposIdentificacion.Transaction := dmGeneral.IBTransaction1;
        IBQTipoC.Database := dmGeneral.IBDatabase1;
        IBQTipoC.Transaction := dmGeneral.IBTransaction1;


        QueryComprobante.Database := dmGeneral.IBDatabase1;
        QueryComprobante.Transaction := dmGeneral.IBTransaction1;

        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction2.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction3.DefaultDatabase := dmGeneral.IBDatabase1;


        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQuery2.Database := dmGeneral.IBDatabase1;
        IBQuery2.Transaction := dmGeneral.IBTransaction1;
        IBQuery3.Database := dmGeneral.IBDatabase1;
        IBQuery3.Transaction := dmGeneral.IBTransaction1;
        IBVarios.Database := dmGeneral.IBDatabase1;
        IBVarios.Transaction := dmGeneral.IBTransaction1;
        IBQsetagencia.Database := dmGeneral.IBDatabase1;
        IBQsetagencia.Transaction := dmGeneral.IBTransaction1;
        IBQsettipocomp.Database := dmGeneral.IBDatabase1;
        IBQsettipocomp.Transaction := dmGeneral.IBTransaction1;
        IBQsetpersona.Database := dmGeneral.IBDatabase1;
        IBQsetpersona.Transaction := dmGeneral.IBTransaction1;
        IBQsettipoid.Database := dmGeneral.IBDatabase1;
        IBQsettipoid.Transaction := dmGeneral.IBTransaction1;
        IBQsetauxiliar.Database := dmGeneral.IBDatabase1;
        IBQsetauxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQsetauxiliar.Transaction := dmGeneral.IBTransaction1;
        IBQsetcomprobante.Database := dmGeneral.IBDatabase1;
        IBQsetcomprobante.Transaction := dmGeneral.IBTransaction1;
        IBDataSet1.Database := dmGeneral.IBDatabase1;
        IBDataSet1.Transaction := dmGeneral.IBTransaction1;

        edFecha.Date := fFechaActual();
end;

function TfrmComprobanteC.grabar : Boolean;
var
Arecord : Plist;
I:integer;
_transaccion: TIBTransaction;
_query: TIBQuery;
begin

      Consecutivo := ObtenerConsecutivoSinTipo(IBSQL1);
      Consec := FormatCurr('0000000',Consecutivo);
      Nocomprobante.Caption := consec;
      vid_comprobante:= consec;

      _transaccion := TIBTransaction.Create(nil);
      _query := TIBQuery.Create(nil);
      _transaccion.DefaultDatabase :=  dmgeneral.IBDatabase1;
      _transaccion.StartTransaction;
      _query.Transaction := _transaccion;

      with _query do
        try
         Close;
         sql.Clear;
         sql.Add('insert into CON$COMPROBANTE (CON$COMPROBANTE."ID_COMPROBANTE",');
         sql.Add('CON$COMPROBANTE."FECHADIA", CON$COMPROBANTE."TIPO_COMPROBANTE",');
         sql.Add('CON$COMPROBANTE."ID_AGENCIA", CON$COMPROBANTE."DESCRIPCION",');
         sql.Add('CON$COMPROBANTE."TOTAL_DEBITO", CON$COMPROBANTE."TOTAL_CREDITO",');
         sql.Add('CON$COMPROBANTE."ESTADO", CON$COMPROBANTE."IMPRESO",');
         sql.Add('CON$COMPROBANTE."ANULACION",CON$COMPROBANTE.ID_EMPLEADO)');
         sql.Add('values (');
         sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
         sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
         sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION",:ID_EMPLEADO)');

         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByname('FECHADIA').AsDate := edFecha.Date;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := dblcbtipo.KeyValue;
         ParamByName('DESCRIPCION').AsBlob := vdescripcion;
         ParamByName('TOTAL_DEBITO').AsCurrency  := vtotal_debito;
         ParamByName('TOTAL_CREDITO').AsCurrency  := vtotal_credito;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByname('ANULACION').asstring := '';
         ParamByName('IMPRESO').AsInteger  := Ord(false);
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ExecSQL;

         SQL.Clear;
         SQL.Add('insert into CON$AUXILIAR values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE",:"DESCRIPCION")');
         if List.Count > 0 then
         for I := 0 to List.Count -1 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('insert into CON$AUXILIAR values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
            ARecord := List.Items[I];
            ParamByName('TIPO_COMPROBANTE').AsInteger :=  dblcbtipo.KeyValue;
            ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := edFecha.Date;
            ParamByName('CODIGO').AsString := Arecord^.codigo;
            //ParamByName('DESCRIPCION').AsString := ARecord^.detalle;
            ParamByName('DEBITO').AsCurrency := Arecord^.debito;
            ParamByName('CREDITO').AsCurrency := Arecord^.credito;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := Arecord^.tipoide;
            ParamByName('ID_PERSONA').AsString := Arecord^.idpersona;
            ParamByName('MONTO_RETENCION').AsCurrency := Arecord^.monto;
            ParamByName('TASA_RETENCION').AsFloat := Arecord^.tasa;
            ParamByName('ESTADOAUX').AsString := 'O';
            ParamByName('TIPO_COMPROBANTE').AsInteger := dblcbtipo.KeyValue;
            ExecSQL;
//            evaluarcodigo(Arecord^.codigo);
          end;
         _transaccion.Commit;
         Result := true;
       except
         _transaccion.Rollback;
         Result := false;
         raise;
       end;
end;

function TfrmComprobanteC.actualizar: Boolean;
var
Arecord : Plist;
I:integer;
_transaccion: TIBTransaction;
_query: TIBQuery;
begin
      _transaccion := TIBTransaction.Create(nil);
      _query := TIBQuery.Create(nil);
      _transaccion.DefaultDatabase :=  dmgeneral.IBDatabase1;
      _transaccion.StartTransaction;
      _query.Transaction := _transaccion;

      with _query do
       try
         sql.Clear;
         sql.Add('update CON$COMPROBANTE set ');
         sql.Add('CON$COMPROBANTE."DESCRIPCION" =:"DESCRIPCION",');
         sql.Add('CON$COMPROBANTE."TOTAL_DEBITO" =:"TOTAL_DEBITO",');
         sql.Add('CON$COMPROBANTE."TOTAL_CREDITO" =:"TOTAL_CREDITO",');
         sql.Add('CON$COMPROBANTE."ESTADO" =:"ESTADO",');
         sql.Add('CON$COMPROBANTE."IMPRESO" =:"IMPRESO",');
         sql.Add('CON$COMPROBANTE."ANULACION" =:"ANULACION",');
         sql.Add('CON$COMPROBANTE.ID_EMPLEADO = :ID_EMPLEADO,');
         sql.Add('CON$COMPROBANTE.FECHADIA = :FECHADIA');
         sql.Add(' where ');
         sql.Add('CON$COMPROBANTE."TIPO_COMPROBANTE" = :"TIPO_COMPROBANTE" and');
         sql.Add('CON$COMPROBANTE."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('CON$COMPROBANTE."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('TIPO_COMPROBANTE').AsInteger := dblcbtipo.KeyValue;
         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByName('FECHADIA').AsDate := edFecha.Date;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('DESCRIPCION').AsString := vdescripcion;
         ParamByName('TOTAL_DEBITO').AsCurrency  := vtotal_debito;
         ParamByName('TOTAL_CREDITO').AsCurrency  := vtotal_credito;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByName('IMPRESO').AsInteger  := Ord(False);
         ParamByName('ANULACION').AsString := anulacion;
         parambyname('ID_EMPLEADO').AsString := DBAlias;
         ExecSQL;

         SQL.Clear;
         SQL.Add('delete from CON$AUXILIAR where ');
         SQL.Add('CON$AUXILIAR."TIPO_COMPROBANTE" = :"TIPO_COMPROBANTE" and');
         SQL.Add('CON$AUXILIAR."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         SQL.Add('CON$AUXILIAR."ID_AGENCIA" = :"ID_AGENCIA"');
         ParamByName('TIPO_COMPROBANTE').AsInteger := dblcbtipo.KeyValue;
         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ExecSQL;

         SQL.Clear;
         SQL.Add('insert into CON$AUXILIAR values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX",:"TIPO_COMPROBANTE")');
         if List.Count > 0 then
         for I := 0 to List.Count -1 do
         begin
            ARecord := List.Items[I];
            ParamByName('TIPO_COMPROBANTE').AsInteger := dblcbtipo.KeyValue;
            ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := edFecha.Date;
            ParamByName('CODIGO').AsString := Arecord^.codigo;
            ParamByName('DEBITO').AsCurrency := Arecord^.debito;
            ParamByName('CREDITO').AsCurrency := Arecord^.credito;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := Arecord^.tipoide;
            ParamByName('ID_PERSONA').AsString := Arecord^.idpersona;
            ParamByName('MONTO_RETENCION').AsCurrency := Arecord^.monto;
            ParamByName('TASA_RETENCION').AsFloat := Arecord^.tasa;
            ParamByname('ESTADOAUX').AsString := 'O';
            ParamByName('TIPO_COMPROBANTE').AsInteger := dblcbtipo.KeyValue;
            ExecSQL;
         end;
         _transaccion.Commit;
         Result := true;
         vmodificar:= true;
         buscarcomp(dblcbtipo.KeyValue,strtoint(vid_comprobante),Agencia);
       except
         _transaccion.Rollback;
         vmodificar:= true;
         buscarcomp(dblcbtipo.KeyValue,StrToInt(vid_comprobante),Agencia);
         Result := false;
       end;
end;


procedure TfrmComprobanteC.BtnGrabarClick(Sender: TObject);
var
    TotalDebito:Currency;
    TotalCredito:Currency;
    i:Integer;
    ARecord: PList;
begin
  Application.ProcessMessages;

  TotalDebito := 0;
  TotalCredito := 0;

  for i:= 0 to List.Count - 1 do begin
     ARecord := List.Items[i];
     TotalDebito := TotalDebito + ARecord^.debito;
     TotalCredito := TotalCredito + ARecord^.credito;
  end;

  if vModificar then
     begin
      if descripcion ='' then begin
         messagedlg('No ha digitado la descripción',mtError,[mbOk],0);
         editdescripcion.SetFocus;
         exit;
        end;
      if List.Count = 0 then
       begin
         messagedlg('No ha digitado ningún movimiento',mtError,[mbOk],0);
         exit;
       end;
      if TotalDebito <> TotalCredito then
       begin
        messagedlg('El comprobante No está cuadrado',mtError,[mbOk],0);
        exit;
       end;
      BtnGrabar.Enabled := False;
      if Actualizar then
          begin
           MessageDlg('El Comprobante se Actualizó',mtInformation,[mbOK],0);
           vmodificar := true;
           exit;
          end
        else
          begin
           MessageDlg('Comprobante no Actualizado',mtError,[mbOK],0);
           exit;
          end;
     end
     else
     begin
      if descripcion ='' then
        begin
         messagedlg('No ha digitado la descripción',mtError,[mbOk],0);
         editdescripcion.SetFocus;
         exit;
        end;
      if List.Count = 0 then
       begin
         messagedlg('No ha digitado ningún movimiento',mtError,[mbOk],0);
         exit;
       end;
      if TotalDebito <> TotalCredito then
        begin
         messagedlg('El comprobante No está cuadrado',mtError,[mbOk],0);
         exit;
        end;
     BtnGrabar.Enabled := False;
     if Grabar then
       begin
       MessageDlg('El Comprobante fue Grabado',mtInformation,[mbOK],0);
       BtnGrabar.Enabled := True;
       Btngrabar.Caption := '&Modificar';
       Application.ProcessMessages;
       Btnreporte.Click;
       vmodificar := True;
       BuscarComp(dblcbtipo.KeyValue, StrToInt(vid_comprobante),Agencia);
       end
     else
       MessageDlg('Comprobante No Grabado',mtError,[mbOK],0);
   end;
end;


procedure TfrmComprobanteC.BtncerrarClick(Sender: TObject);
begin
        self.Close;
end;

procedure TfrmComprobanteC.actualizaxsauxiliar;
var
i:integer;
ARecord: PList;
begin
   vtotal_debito:= 0;
   vtotal_credito:= 0;
   with list do
     if count > 0 then
     begin
      xsauxiliar.RowCount := Count+1;
      for i:=0 to (Count - 1) do
       begin
        Arecord := Items[i];
        xsauxiliar.ColWidths[0] := 112;
        xsauxiliar.Cells [0,i+1] := arecord^.codigo;
        xsauxiliar.ColWidths[1] := 180;
        xsauxiliar.Cells [1,i+1] := arecord^.nomcuenta;
        xsauxiliar.ColWidths[3] := 90;
        xsauxiliar.Cells [3,i+1] := formatcurr ('#,##0.00',Arecord^.debito);
        vtotal_debito := vtotal_debito + ARecord^.debito;
        xsauxiliar.ColWidths[4] := 90;
        xsauxiliar.Cells [4,i+1] := formatcurr ('#,##0.00',Arecord^.credito);
        vtotal_credito := vtotal_credito + Arecord^.credito;
        edittotaldebito.Text := currtostr(vtotal_debito);
        edittotalcredito.Text := currtostr(vtotal_credito);
        edittotaldiferencia.Text := currtostr(vtotal_debito - vtotal_credito);
        if ARecord^.idpersona <> '' then
        xsauxiliar.Cells [2,i+1] := arecord^.idpersona;
       end;
    end
    else if count = 0 then
    begin
     edittotaldebito.Text := '0';
     edittotalcredito.Text:= '0';
     edittotaldiferencia.Text:= '0';     
     xsauxiliar.RowCount := 2;
     xsauxiliar.Cells[0,1]:= '';
     xsauxiliar.Cells[1,1]:= '';
     xsauxiliar.Cells[2,1]:= '';
     xsauxiliar.Cells[3,1]:= '';
     xsauxiliar.Cells[4,1]:= '';
    end;
end;

procedure TfrmComprobanteC.CheckBoximpresoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if Key = 13 then
        btnAgregar.SetFocus;
end;


procedure TfrmComprobanteC.BtnlimpiarClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmComprobanteC.editdescripcionExit(Sender: TObject);
begin
        if editdescripcion.Text <> '' then
          begin
           descripcion := editdescripcion.Text;
           editdescripcion.Text := uppercase(descripcion);
           vdescripcion := editdescripcion.Text;
           editcodigo.SetFocus;           
          end
        else
          begin
           MessageDlg('No ha digitado la Descripcion del Comprobante',mtError,[mbOK],0);
//           editdescripcion.SetFocus;
          end;

end;

procedure TfrmComprobanteC.BtnBuscarClick(Sender: TObject);
var
opcion:integer;
begin
        btnlimpiar.Click;
        frmbuscarcomprobante := Tfrmbuscarcomprobante.Create(Self);
        frmBuscarcomprobante.Position:= poMainFormCenter;
        Opcion := frmbuscarcomprobante.ShowModal;
        if Opcion = mrOK then
        begin
          id_comprobante:= strtoint(frmbuscarcomprobante.EditCODIGO.Text);
          id_agencia:= StrToInt(frmbuscarcomprobante.EditAgencia.Text);
          id_tipocomprobante := frmbuscarcomprobante.dblcbtipo.KeyValue;
          frmBuscarcomprobante.Free;
          buscarcomp(id_tipocomprobante, id_comprobante,id_agencia);
        end;
end;


procedure TfrmComprobanteC.btnrefrescarClick(Sender: TObject);
begin
     IBQsetcomprobante.Close;
     IBQsetcomprobante.Open;
     IBQsetauxiliar.close;
     IBQsetauxiliar.Open;
end;

procedure TfrmComprobanteC.BtnAnularClick(Sender: TObject);
begin
                if (estadoc= 'N') and (estadoa= 'N')  then
                 begin
                  buscarcomprobante(id_tipocomprobante, id_comprobante,agencia);
                  bloquear;
                  MessageDlg('El Comprobante ya está anulado',mtError,[mbOk],0);
                  Btnlimpiarclick(sender);
                  desbloquear;
                  exit;
                 end;
                if (estadoc= 'C') and (estadoa= 'C') then
                 begin
                  buscarcomprobante(id_tipocomprobante,id_comprobante,agencia);
                  bloquear;
                  MessageDlg('El comprobante está cerrado, No se puede Anular',mtError,[mbOk],0);
                  BtnLimpiarclick(sender);
                  desbloquear;
                  exit;
                 end;
                if (estadoc= 'O') and (estadoa= 'O') then
                begin
                   if  MessageDlg('Seguro de Anular Comprobante',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                    begin
                        vestadoc:= 'N';
                        vestadoa:= 'N';
                        buscarcomprobante(id_tipocomprobante, id_comprobante, agencia);
                        label8.Visible:= true;
                        editanulacion.Visible:= true;
                        editanulacion.SetFocus;
                     end;
                end;
                if (estadoc ='') or (estadoa = '') then
                 begin
                  MessageDlg('El comprobante no existe',mtError,[mbOk],0);
                  BtnAnular.SetFocus;
                 end;
end;

procedure TfrmComprobanteC.bloquear;
var
I,J:integer;
begin
    I := Self.ComponentCount -1;

    for J := 0 to I do
    begin
        if Self.Components[J] is TMemo then begin
           TMemo(Self.Components[J]).ReadOnly:= true;
           TMemo(Self.Components[J]).Color:= clLtGray;
        end
        else
        if Self.Components[J] is TDBLookupComboBox then begin
           TDBLookupComboBox(Self.Components[J]).ReadOnly:= true;
           TDBLookupComboBox(Self.Components[J]).Color:= clLtGray;
        end
        else
        if Self.Components[J] is TEdit then begin
           TEdit(Self.Components[J]).ReadOnly:= true;
           TEdit(Self.Components[J]).color:= clLtgray;
        end

        end;
    end;

procedure TfrmComprobanteC.desbloquear;
var
I,J:integer;
begin
    I := Self.ComponentCount -1;

    for J := 0 to I do
    begin
        if Self.Components[J] is TMemo then begin
           TMemo(Self.Components[J]).ReadOnly:= false;
           TMemo(Self.Components[J]).Color:= clWindow;
        end
        else
        if Self.Components[J] is TDBLookupComboBox then begin
           TDBLookupComboBox(Self.Components[J]).ReadOnly:= false;
           TDBLookupComboBox(Self.Components[J]).Color:= clWindow;
        end
        else
        if Self.Components[J] is TEdit then begin
           TEdit(Self.Components[J]).ReadOnly:= false;
           TEdit(Self.Components[J]).color:= clWindow;
        end

        end;
    end;

procedure TfrmComprobanteC.buscarcomprobante(TIPO_COMPROBANTE: Integer; ID_COMPROBANTE: integer; ID_AGENCIA:integer);
var
_transaccion: TIBTransaction;
_query: TIBQuery;
_query2: TIBQuery;
auxiliar:integer;
Arecord:Plist;
begin
      _transaccion := TIBTransaction.Create(nil);
      _query := TIBQuery.Create(nil);
      _query2 := TIBQuery.Create(nil);
      _transaccion.DefaultDatabase := dmgeneral.IBDatabase1;
      _transaccion.StartTransaction;
      _query.Transaction := _transaccion;
      _query2.Transaction := _transaccion;

        with _query do
            begin
                SQL.Clear;
                SQL.Add('select * from CON$COMPROBANTE where CON$COMPROBANTE.TIPO_COMPROBANTE = :"TIPO_COMPROBANTE" and CON$COMPROBANTE."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
                SQL.Add('and CON$COMPROBANTE."ID_AGENCIA" =:"ID_AGENCIA"');
                ParamByName('TIPO_COMPROBANTE').AsInteger := TIPO_COMPROBANTE;
                paramByName('ID_COMPROBANTE').AsInteger:= ID_COMPROBANTE;
                ParamByName('ID_AGENCIA').AsInteger:= id_agencia;
                Open;
                id_tipocomprobante := strtoint(trim(fieldbyname('TIPO_COMPROBANTE').AsString));
                vid_comprobante:= inttostr(fieldbyname('ID_COMPROBANTE').AsInteger);
                if RecordCount > 0 then
                begin
                   dblcbtipo.KeyValue := id_tipocomprobante;
                   NoComprobante.Caption := FormatCurr('0000000',StrToCurr(vid_comprobante));
                   edFecha.Date := FieldByName('FECHADIA').AsDateTime;
                   vtipo_comprobante := strtoint(trim(fieldbyname('TIPO_COMPROBANTE').AsString));
                   dblcbtipo.KeyValue := vtipo_comprobante;
                   vdescripcion := fieldbyname('DESCRIPCION').AsString;
                   editdescripcion.Text:= vdescripcion;
                   vtotal_debito := fieldbyname('TOTAL_DEBITO').AsCurrency;
                   edittotaldebito.Text:= formatcurr('#,##0.00',vtotal_debito);
                   vtotal_credito := fieldbyname('TOTAL_CREDITO').AsCurrency;
                   edittotalcredito.Text:= formatcurr('#,##0.00',vtotal_credito);
                   edittotaldiferencia.Text := formatcurr('#,##0.00', (vtotal_debito - vtotal_credito));
                   vestadoc:= fieldbyname('ESTADO').AsString;
                   vimpreso := inttoboolean(fieldbyname('IMPRESO').AsInteger);
                   BtnGrabar.Caption := '&Modificar';
                   if vimpreso then
                      checkboximpreso.Checked := true;
                   if vestadoc = 'N' then
                     begin
                      checkboxanulado.Checked:= true;
                      label8.Visible:= true;
                      editanulacion.Visible:= true;
                      anulacion := fieldbyname('ANULACION').AsString;
                      editanulacion.Text:= anulacion;
                     end
                   else
                   if estadoc = 'C' then
                     checkboxcerrado.Checked:= true;
                end;
            end;

        with _query2 do
          begin
                List.Clear;
                SQL.Clear;
                SQL.Add('select a.*, p.NOMBRE from CON$AUXILIAR a left join CON$PUC p on ');
                SQL.Add(' (a.CODIGO = p.CODIGO) ');
                SQL.Add('where a."TIPO_COMPROBANTE" = :"TIPO_COMPROBANTE" and a."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
                SQL.Add('and a."ID_AGENCIA" =:"ID_AGENCIA"');
                ParamByName('TIPO_COMPROBANTE').AsInteger := TIPO_COMPROBANTE;
                paramByName('ID_COMPROBANTE').AsInteger:= ID_COMPROBANTE;
                ParamByName('ID_AGENCIA').AsInteger:= ID_AGENCIA;
                Active := True;
                auxiliar:= fieldbyname('ID_COMPROBANTE').AsInteger;
                if (auxiliar <> 0) then
                 begin
                    Open;
                    Last;
                    First;
                    while not Eof do
                    begin
                    New(Arecord);
                    ARecord^.codigo:= fieldbyname('CODIGO').AsString;
                    //ARecord^.detalle := fieldbyname('DESCRIPCION').AsString;
{
                    with Dmcomprobante.IBQuery1 do
                     begin
                      sql.Clear;
                      Sql.Add('select "NOMBRE" from CON$PUC where CON$PUC."CODIGO" =:"CODIGO"');
                      parambyname('CODIGO').AsString := Arecord^.codigo;
                      active := true;
                      nombre := fieldbyname('NOMBRE').AsString;
                     end;
                    ARecord^.nomcuenta:= nombre;
}
                    Arecord^.nomcuenta := fieldbyname('NOMBRE').AsString;
                    Arecord^.debito:= fieldbyname('DEBITO').AsCurrency;
                    Arecord^.credito:= fieldbyname('CREDITO').AsCurrency;
                    Arecord^.tipoide:=fieldbyname('ID_IDENTIFICACION').AsInteger;
                    Arecord^.idpersona:=fieldbyname('ID_PERSONA').AsString;
                    Arecord^.monto:=fieldbyname('MONTO_RETENCION').AsCurrency;
                    Arecord^.tasa:=fieldbyname('TASA_RETENCION').AsFloat;
                    Arecord^.estado:=fieldbyname('ESTADOAUX').AsString;
                    List.Add(Arecord);
                    next;
                    end;
                    actualizaxsauxiliar;
                 end;
          end;
end;



procedure TfrmComprobanteC.CheckBoxcerradoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,self);
end;

procedure TfrmComprobanteC.CheckBoxanuladoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,self);
end;

procedure TfrmComprobanteC.XSauxiliarSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  ARecord : PList;
begin
        posgrid := ARow-1;
        if ( posgrid > -1 ) then begin
                CanSelect := true;
                ARecord := List.Items[posgrid];
                codigo:= ARecord^.codigo;
                Label11.Caption := ARecord^.nomcuenta;
                nomcuenta := ARecord^.nomcuenta;
                Label11.Visible := true;
                debito := Arecord^.debito;
                credito := Arecord^.credito;
                tipoide:= Arecord^.tipoide;
                idpersona := Arecord^.idpersona;
                monto := Arecord^.monto;
                tasa := Arecord^.tasa;
                estado := Arecord^.estado;
                detalle := ARecord^.detalle;
                actualizaxsauxiliar;
                BtnModificargrid.Enabled := true;
                BtnEliminar.Enabled := true;
        end
        else
        begin
          BtnModificargrid.Enabled := false;
          BtnEliminar.Enabled := false;
        end;
        XSauxiliar.SelectedColor := clHighlight;
        CanSelect := True;

end;

procedure TfrmComprobanteC.editanulacionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if key = 13 then
        BtnAgregar.SetFocus;
end;

procedure TfrmComprobanteC.editanulacionExit(Sender: TObject);
var
I : integer;
begin
anulacion:=editanulacion.Text;
editanulacion.Text := uppercase(anulacion);
anulacion := editanulacion.Text;
if anulacion <> '' then
 begin
  with IBQuery1 do
   begin
    sql.Clear;
    Sql.Add('update CON$COMPROBANTE set CON$COMPROBANTE."ANULACION" = :"anulacion",');
    Sql.Add('CON$COMPROBANTE."ESTADO" = :"estado"');
    sql.Add('where CON$COMPROBANTE."TIPO_COMPROBANTE" = :"TIPO_COMPROBANTE" and CON$COMPROBANTE."ID_COMPROBANTE" = :"ID_COMPROBANTE" and CON$COMPROBANTE."ID_AGENCIA" = :"ID_AGENCIA"');
    ParamByName('TIPO_COMPROBANTE').AsInteger := id_tipocomprobante;
    parambyname('ID_COMPROBANTE').AsInteger := id_comprobante;
    parambyname('ID_AGENCIA').AsInteger := Agencia;
    parambyname('ANULACION').AsString := anulacion;
    parambyname('ESTADO').AsString := 'N';
    active := true;
    Transaction.CommitRetaining;
   end;
  with IBQuery2 do
   begin
    sql.Clear;
    Sql.Add('update CON$AUXILIAR set ');
    Sql.Add('CON$AUXILIAR."ESTADOAUX" = :"ESTADOAUX"');
    sql.Add('where CON$AUXILIAR."TIPO_COMPROBANTE" = :"TIPO_COMPROBANTE" and CON$AUXILIAR."ID_COMPROBANTE" = :"ID_COMPROBANTE" and CON$AUXILIAR."ID_AGENCIA" = :"ID_AGENCIA"');
    ParamByName('TIPO_COMPROBANTE').AsInteger := id_tipocomprobante;
    parambyname('ID_COMPROBANTE').AsInteger := id_comprobante;
    parambyname('ID_AGENCIA').AsInteger := agencia;
    for I := 0 to List.Count -1 do
      ParamByName('ESTADOAUX').AsString := 'N';
    active := true;
    Transaction.CommitRetaining;
   end;
    MessageDlg('Comprobante Anulado',mtConfirmation,[mbOk],0);
    BtnLimpiarClick(sender);
    label8.Visible:= false;
    editanulacion.Visible:= false;
    Btnlimpiar.SetFocus;
 end
 else
 begin
  MessageDlg('Debe digitar la causal de anulacion',mtError,[mbOk],0);
  editanulacion.SetFocus;
 end;
end;


procedure TfrmComprobanteC.editanulacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
        BtnBuscar.SetFocus;
end;

procedure TfrmComprobanteC.dblcbtipo_compKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmComprobanteC.DblcbAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmComprobanteC.editdescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
       EnterTabs(Key,Self);
end;

procedure TfrmComprobanteC.BtnModificarGridClick(Sender: TObject);
var
ARecord: PList;
begin

           ARecord := List.Items[posgrid];
           ARecord^.codigo := codigo;
           ARecord^.detalle := detalle;
           ARecord^.debito := debito;
           ARecord^.credito:= credito;
           ARecord^.nomcuenta := nomcuenta;
           ARecord^.tipoide := tipoide;
           ARecord^.idpersona:= idpersona;
           ARecord^.monto := monto;
           ARecord^.tasa := tasa;
           Arecord^.estado := estado;
           actualizaxsauxiliar;

end;

procedure TfrmComprobanteC.BtnAgregarClick(Sender: TObject);
var
ARecord: PList;
i:Integer;
begin
        if codigo = '' then begin
          MessageDlg('Debe Digitar un Código',mtError,[mbok],0);
          editcodigo.SetFocus;
          Exit;
        end;

        if (debito = 0) and (credito = 0) then
          begin
           MessageDlg('Debe digitar un valor debito ó crédito',mtError,[mbOk],0);
           eddebito.SetFocus;
           Exit;
          end;


           New(ARecord);
           ARecord^.codigo := codigo;
           ARecord^.detalle := detalle;
           ARecord^.debito := debito;
           ARecord^.credito:= credito;
           ARecord^.nomcuenta := nomcuenta;
           ARecord^.tipoide := tipoide;
           ARecord^.idpersona:= idpersona;
           ARecord^.monto := monto;
           ARecord^.tasa := tasa;
           Arecord^.estado := estado;
           List.Add(ARecord);

           actualizaxsauxiliar;

           editcodigo.Text := '';
           edDetalleAux.Text := '';
           EdDebito.Value := 0;
           EdCredito.Value := 0;
           debito := 0;
           credito := 0;
           Label11.Caption := '';

           Edtipoid.KeyValue := -1;
           Edtipoid.Enabled := False;

           EdNit.Text := '';
           EdNit.Enabled := False;

           EdMonto.Text := '';
           EdMonto.Enabled := False;

           EdTasa.Text := '';
           EdTasa.Enabled := False;

           Label3.Caption := '';
           Label3.Visible := False;

           editcodigo.SetFocus;
end;


procedure TfrmComprobanteC.BtnEliminarClick(Sender: TObject);
var
Arecord : Plist;
i:Integer;
AR:PCuentas;
begin
        if posgrid <> -1 then
        begin
           ARecord := List.Items[posgrid];
           List.Remove(ARecord);
           List.Pack;
           posgrid := -1;
           Actualizaxsauxiliar;
           BtnEliminar.Enabled := false;
           BtnModificargrid.Enabled := false;

           editcodigo.Text := '';
           edDetalleAux.Text := '';
           EdDebito.Value := 0;
           EdCredito.Value := 0;
           debito := 0;
           credito := 0;
           Label11.Caption := '';

           Edtipoid.KeyValue := -1;
           Edtipoid.Enabled := False;

           EdNit.Text := '';
           EdNit.Enabled := False;

           EdMonto.Text := '';
           EdMonto.Enabled := False;

           EdTasa.Text := '';
           EdTasa.Enabled := False;

           Label3.Caption := '';
           Label3.Visible := False;           

        end
        else
         MessageDlg('No Seleccionó Movimiento',mterror,[mbOk],0);
end;


procedure TfrmComprobanteC.BtnreporteClick(Sender: TObject);
var
anulacion : string;
Tabla : String;
begin
        with IBAuxiliar do begin
         if  Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         empleado;

         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(NoComprobante.Caption);
         ParamByName('TIPO_COMPROBANTE').AsInteger := dblcbtipo.KeyValue;         
         try
          Open;
          Report1.Variables.ByName['EMPRESA'].AsString := Empresa;
          Report1.Variables.ByName['NIT'].AsString := Nit;
          if Report1.PrepareReport then
            Report1.PreviewPreparedReport(True);
         except
          MessageDlg('Error al generar el reporte',mtError,[mbcancel],0);
         end;
        end;
end;

procedure TfrmComprobanteC.CheckBoximpresoExit(Sender: TObject);
begin
        if checkboximpreso.Checked = true then
          vimpreso := true
        else
          vimpreso := false;
end;

procedure TfrmComprobanteC.Report1PrintComplete(Sender: TObject);
begin
      vimpreso := true;
      with IBQuery2 do
       begin
         sql.Clear;
         sql.Add('update CON$COMPROBANTE set ');
         sql.Add('CON$COMPROBANTE."IMPRESO" = :"IMPRESO"');
         sql.Add(' where ');
         sql.Add('CON$COMPROBANTE."TIPO_COMPROBANTE" = :"TIPO_COMPROBANTE" and');
         sql.Add('CON$COMPROBANTE."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('CON$COMPROBANTE."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('TIPO_COMPROBANTE').AsInteger := dblcbtipo.KeyValue;
         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('IMPRESO').AsInteger  := ord(vimpreso);
         ExecSQL;
       end;
end;


procedure TfrmComprobanteC.EdittotaldebitoExit(Sender: TObject);
begin
        vtotal_debito:= strtocurr(edittotaldebito.Text);
end;

procedure TfrmComprobanteC.EdittotalcreditoExit(Sender: TObject);
begin
        vtotal_credito:= strtocurr(edittotalcredito.Text);
end;

procedure TfrmComprobanteC.Empleado;
begin
        with IBQuery1 do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
         end;
end;

procedure TfrmComprobanteC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

function TfrmComprobanteC.EvaluarCodigo(Codigo: string): string;
begin
    with IBQuery1 do
    begin
     sql.Clear;
     Sql.Add('select "NOMBRE", "MOVIMIENTO", "INFORME"');
     Sql.Add('from CON$PUC');
     Sql.Add('where CON$PUC."ID_AGENCIA" =:"ID_AGENCIA" and');
     Sql.Add('CON$PUC."CODIGO" =:"CODIGO"');
     parambyname('ID_AGENCIA').AsInteger := Agencia;
     parambyname('CODIGO').AsString := codigo;
     Open;
     nombre := FieldByName('NOMBRE').AsString;
     movimiento:= IntToBoolean(FieldByName('MOVIMIENTO').AsInteger);
     id := Fieldbyname('INFORME').AsString;
     if IBQuery1.RecordCount > 0 then
      begin
        Label11.Visible:= true;
        Label11.Caption:= nombre;
        result := nombre;

        if not movimiento then
          begin
           MessageDlg('La Cuenta no es de Movimiento',mtError,[mbOk],0);
           editcodigo.SetFocus;
           editcodigo.Text:= '';
           label11.Visible := false;
           exit;
          end;
      end
     else
      begin
        MessageDlg('La cuenta no Existe',mtError,[mbOk],0);
        editcodigo.Text:= '';
        editcodigo.SetFocus;
        label11.Caption := '';
        Label11.Visible := False;
        GrupoInforme.Enabled := False;
      end;
    end;
end;


procedure TfrmComprobanteC.BuscarComp(Tp, Id, Ag: Integer);
var
_transaccion: TIBTransaction;
_query: TIBQuery;
begin
      _transaccion := TIBTransaction.Create(nil);
      _query := TIBQuery.Create(nil);
      _query.Database := dmGeneral.IBDatabase1;
      _transaccion.DefaultDatabase :=  dmgeneral.IBDatabase1;
      _transaccion.StartTransaction;
      _query.Transaction := _transaccion;

      with _query do
          begin
           IBQsetagencia.Open;
           IBQsettipocomp.Open;
           IBQsetauxiliar.Open;
           SQL.Clear;
           SQL.Add('select CON$COMPROBANTE.ESTADO, CON$AUXILIAR.ESTADOAUX from CON$COMPROBANTE');
           SQL.Add('LEFT JOIN CON$AUXILIAR ON (CON$COMPROBANTE.TIPO_COMPROBANTE = CON$AUXILIAR.TIPO_COMPROBANTE and CON$COMPROBANTE.ID_COMPROBANTE = CON$AUXILIAR.ID_COMPROBANTE and CON$COMPROBANTE.ID_AGENCIA = CON$AUXILIAR.ID_AGENCIA)');
           SQL.Add(' where CON$COMPROBANTE.TIPO_COMPROBANTE = :"TIPO_COMPROBANTE" and CON$COMPROBANTE.ID_COMPROBANTE = :"ID_COMPROBANTE" AND CON$COMPROBANTE.ID_AGENCIA = :"ID_AGENCIA"');
           ParamByName('TIPO_COMPROBANTE').AsInteger := Tp;
           ParamByName('ID_COMPROBANTE').AsInteger:= Id;
           ParamByName('ID_AGENCIA').AsInteger:= Ag;
           Open;
           if RecordCount > 0 then
             begin
              estadoc:= Fieldbyname('ESTADO').AsString;
              estadoa:= FieldByName('ESTADOAUX').AsString;
              buscarcomprobante(Tp, Id, Ag);
              vmodificar:= true;
              if (estadoc= 'N') or (estadoc = 'C') or (estadoa= 'C') or (estadoa= 'N')  then
                 begin
                 MessageDlg('No se puede Modificar, El Comprobante está Cerrado o Anulado',mtError,[mbOk],0);
                 BtnGrabar.Enabled := false;
                 BtnAnular.Enabled := false;
                 BtnRefrescar.Enabled := false;
                 BtnAgregar.Enabled := false;
                 BtnCerrar.Enabled := True;
                 btnReversar.Enabled := True;
                 PanelXS.Enabled := False;
                 bloquear;
                 xsauxiliar.Enabled := True;
                 vmodificar := false;
                 end;
             end
           else
             begin
              MessageDlg('El comprobante no existe',mtError,[mbOk],0);
              BtnBuscar.SetFocus;
             end;
          end;

          _query.Close;
          _query.Free;
          _transaccion.Rollback;
          _transaccion.Free;
          if vmodificar then
          begin
           BtnModificarGrid.Enabled := False;
           BtnEliminar.Enabled := False;
          end
          else
          begin
           BtnModificarGrid.Enabled := True;
           BtnEliminar.Enabled := True;
          end;

end;

procedure TfrmComprobanteC.Inicializar;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;

        if IBTransaction1.InTransaction then
          IBTransaction1.Commit;
        IBTransaction1.StartTransaction;

        if IBTransaction2.InTransaction then
          IBTransaction2.Commit;
        IBTransaction2.StartTransaction;

        if IBTransaction3.InTransaction then
          IBTransaction3.Commit;
        IBTransaction3.StartTransaction;

        IBQTipoC.Open;
        IBQTipoC.Last;
        IBQTipoC.First;

{        if dmComprobante.dmGeneral.IBTransaction1.InTransaction then
           dmComprobante.dmGeneral.IBTransaction1.commit;
        dmComprobante.dmGeneral.IBTransaction1.StartTransaction;
        }
        IBQsetagencia.Open;
        IBQsetauxiliar.Open;
        
        xsauxiliar.ColWidths [0] := 112;
        xsauxiliar.ColWidths [1] := 130;
        xsauxiliar.ColWidths [2] := 70;
        xsauxiliar.ColWidths [3] := 90;
        xsauxiliar.ColWidths [4] := 90;
//        XSauxiliar.ColWidths [5] := 30;
        xsauxiliar.Cols[0].Text  := 'Código';
        xsauxiliar.Cols[1].Text  := 'Nombre Cuenta';
        xsauxiliar.Cols[2].Text  := 'Dto/Nit';
        xsauxiliar.Cols[3].Text  := 'Débitos';
        xsauxiliar.Cols[4].Text  := 'Créditos';
//        XSauxiliar.Cols[5].Text  := 'GMF';
        try
          List := Tlist.Create;
          SCuentas := TList.Create;
        finally
          List.Clear;
          SCuentas.Clear;
        end;
        editdescripcion.Text := '';
        edittotaldebito.Text:= '';
        edittotalcredito.Text:='';
        edittotaldiferencia.Text:='';
        editanulacion.Text:='';
        BtnModificargrid.Enabled := false;
        BtnEliminar.Enabled := false;
        xsauxiliar.Enabled := True;
        posgrid := -1;
        vmodificar := False;
        id_comprobante:= 0;
        id_agencia:= 0;
        vid_comprobante:= '';
        vtipo_comprobante := 0;
        vdescripcion:= '';
        anulacion:= '';
        vtotal_debito:= 0;
        vtotal_credito:= 0;
        vestadoc:= '';
        estadoc := '';
        vestadoa:= '';
        estadoa := '';
        desbloquear;
        edittotaldebito.Color := clMoneyGreen;
        edittotalcredito.Color := clMoneyGreen;
        edittotaldiferencia.Color := clMoneyGreen;        
        label8.Visible := false;
        editanulacion.Visible := false;
        BtnGrabar.Enabled := true;
        BtnGrabar.Caption := '&Grabar';
        BtnAnular.Enabled := true;
        BtnRefrescar.Enabled := true;
        Btncerrar.Enabled := true;
        BtnAgregar.Enabled := True;
        btnReversar.Enabled := False;
        xsauxiliar.Enabled := True;

        PanelXS.Enabled := True;
        editcodigo.Text := '';
        edDetalleAux.Text := '';
        EdDebito.Value := 0;
        EdCredito.Value := 0;
        Edtipoid.KeyValue := -1;
        EdNit.Text := '';
        EdTasa.Text := '';
        EdMonto.Text := '';
        Edtipoid.Enabled := False;
        EdNit.Enabled := False;
        EdTasa.Enabled := False;
        EdMonto.Enabled := False;
        NoComprobante.Caption := '';
        Label11.Caption := '';
        Label3.Caption := '';
        codigo := '';
        debito := 0;
        credito := 0;
        nomcuenta := '';
        vmonto := 0;
        vtasa := 0;
        tipoide := 0;
        idpersona := '';
        dblcbtipo.DropDown;
        dblcbtipo.KeyValue := 1;
        dblcbtipo.SetFocus;
end;

procedure TfrmComprobanteC.FormShow(Sender: TObject);
begin
        Inicializar;
        Panel5.Caption := Empresa + '   Nit   ' + Nit;
end;

procedure TfrmComprobanteC.Report1InitDetailBandDataSet(Sender: TObject;
  DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
begin
        if DataSetName = 'IBAuxiliar1' then begin
          with IBAuxiliar1 do begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := IBAuxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := IBAuxiliar.FieldByName('ID_PERSONA').AsString;
            try
             Open;
            except
             raise;
            end;
          end;
        end;
end;

procedure TfrmComprobanteC.editcodigoExit(Sender: TObject);
var Cadena, informe:string;
begin
    Cadena := EditCODIGO.Text;
    while Pos(' ',Cadena) > 0 do
    Cadena[Pos(' ',Cadena)] := '0';
    Codigo := Cadena;
    if (codigo <> '') then begin
      nomcuenta := evaluarcodigo(codigo);
      informe := evaluarinforme(id);
    end;
end;

procedure TfrmComprobanteC.editcodigoEnter(Sender: TObject);
begin
        editcodigo.SelectAll;
end;

procedure TfrmComprobanteC.editcodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmComprobanteC.EdDebitoEnter(Sender: TObject);
begin
//        EdDebito.Value := debito;
        EdDebito.SelectAll;
end;

procedure TfrmComprobanteC.EdDebitoExit(Sender: TObject);
begin
        debito := EdDebito.Value;
//        if debito > 0 then BtnAgregar.SetFocus;
end;

procedure TfrmComprobanteC.EdCreditoEnter(Sender: TObject);
begin
//        EdCredito.Value := credito;
        EdCredito.SelectAll;
end;

procedure TfrmComprobanteC.EdCreditoExit(Sender: TObject);
begin
        credito := EdCredito.Value;
        if (debito <> 0) and (credito<>0) then
        begin
          MessageDlg('Ambos, debitos y creditos no pueden tener valor',mtError,[mbcancel],0);
          EdDebito.SetFocus;
          Exit;
        end;
//        BtnAgregar.SetFocus;
end;

procedure TfrmComprobanteC.EdtipoidEnter(Sender: TObject);
begin
    Edtipoid.KeyValue := self.tipoide;
    Edtipoid.DropDown;
end;

procedure TfrmComprobanteC.EdtipoidExit(Sender: TObject);
begin
    tipoide := Edtipoid.KeyValue;
end;

procedure TfrmComprobanteC.EdtipoidKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key= #13 then
          EdNit.SetFocus;
end;

procedure TfrmComprobanteC.EdNitEnter(Sender: TObject);
begin
        EdNit.SelectAll;
end;

procedure TfrmComprobanteC.EdNitExit(Sender: TObject);
var
 frmPersona:TfrmCreacionPersona;
begin
            with IBSQL2 do
              begin
               if Transaction.InTransaction then
                 Transaction.Commit;
               Transaction.StartTransaction;
               Close;
               SQL.Clear;
               SQL.Add('select * from "gen$persona" where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
               ParamByName('ID_IDENTIFICACION').AsInteger := Edtipoid.KeyValue;
               ParamByName('ID_PERSONA').AsString := EdNit.Text;
               try
                ExecQuery;
                if RecordCount > 0 then begin
                   Label3.Visible := True;
                   Label3.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                     FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                     FieldByName('NOMBRE').AsString;
                end
                else
                  if MessageDlg('El Documento no Existe!, Desea Agregarlo',mtConfirmation,[mbyes,mbno],0) = mryes then
                  begin
                    frmPersona := TfrmCreacionPersona.Create(Self);
                    frmPersona.ShowModal;
                    EdNitexit(Sender);
                  end
               except
                  Transaction.Rollback;
                  raise;
               end;
              end;
              idpersona := EdNit.Text;
end;

procedure TfrmComprobanteC.EdNitKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
        if EdNit.Text <> '' then
         begin
           vid_persona := EdNit.Text;
           if EdMonto.Enabled then
             EdMonto.SetFocus
           else
          eddebito.SetFocus;

           with IBQsetpersona do
            begin
              if Transaction.InTransaction then
                Transaction.Commit;
              Transaction.StartTransaction;
              ParamByName('ID_IDENTIFICACION').AsInteger := Edtipoid.KeyValue;
              ParamByName('ID_PERSONA').AsString := EdNit.Text;
              Open;
              Last;
              First;
              if RecordCount = 1 then
               begin
                 label3.Visible:= true;
                 label3.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' '+
                                   FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                   FieldByName('NOMBRE').AsString;
               end
              else
               begin
                if MessageDlg('La Persona no existe, ¿Desea Crearla?',mtconfirmation,[mbYes,mbNo],0)= mryes then
                 begin
//                   frmCreacionPersona:= TfrmCreacionPersona.Create(self);
//                   frmcreacionpersona.Show;
                 end
                else
                   EdNit.SetFocus;
               end;
            end;
         end;
end;

procedure TfrmComprobanteC.EdTasaEnter(Sender: TObject);
begin
        EdTasa.SelectAll;
end;

procedure TfrmComprobanteC.EdTasaKeyPress(Sender: TObject; var Key: Char);
begin
       Numerico(sender,key);
       if key = #13 then
        begin
        if EdTasa.Text <> '' then
          begin
            tasa := strtofloat(EdTasa.Text);
            EdTasa.Text := formatfloat('#,##0.00',tasa);
            eddebito.SetFocus
          end;
         end;
end;

procedure TfrmComprobanteC.EdMontoEnter(Sender: TObject);
begin
        EdMonto.SelectAll;
end;

procedure TfrmComprobanteC.EdMontoKeyPress(Sender: TObject; var Key: Char);
begin
       Numerico(sender,key);
       if key = #13 then
        begin
        if EdMonto.Text <> '' then
          begin
            monto := strtocurr(EdMonto.Text);
            EdMonto.Text := formatcurr('#,##0.00',monto);
            if EdTasa.Visible then
             EdTasa.SetFocus
            else
             eddebito.SetFocus
          end;
         end;
end;

function TfrmComprobanteC.Evaluarinforme(id : string) : string;
var
pidoid, pidotasa, pidotipoid, pidomonto: boolean;
begin
        with IBQuery1 do
        begin
         sql.Clear;
         Sql.Add('select "PIDOID", "PIDOMONTO", "PIDOTASA", "PIDOTIPOID" from CON$INFORMES where CON$INFORMES."ID" =:"ID"');
         parambyname('ID').AsString := id;
         Open;
         pidoid := inttoboolean(fieldbyname('PIDOID').AsInteger);
         pidotasa:= inttoboolean(fieldbyname('PIDOTASA').AsInteger);
         pidotipoid:= inttoboolean(fieldbyname('PIDOTIPOID').AsInteger);
         pidomonto:= inttoboolean(fieldbyname('PIDOMONTO').AsInteger);
         if pidotipoid then begin
          GrupoInforme.Enabled := True;
          IBQTiposIdentificacion.Open;
          IBQTiposIdentificacion.Last;
          Edtipoid.Enabled := True;
          Edtipoid.SetFocus;
         end;
         if pidoid then begin
          GrupoInforme.Enabled := True;
          EdNit.Enabled := true;
         end;
         if pidotasa then begin
          GrupoInforme.Enabled := True;
          EdTasa.Enabled := true;
//          EdTasa.SetFocus;
         end;
         if pidomonto then begin
          GrupoInforme.Enabled := True;
          EdMonto.Enabled := True;
          EdTasa.Enabled := True;
//          EdMonto.SetFocus;
         end;
        id := '';
        end;
end;

function TfrmComprobanteC.gettipoide : integer;
begin
        result:= vtipoid;
end;

procedure TfrmComprobanteC.settipoide (nvalor:integer);
begin
        vtipoid:= nvalor;
        Edtipoid.KeyValue := vtipoid;
end;
function TfrmComprobanteC.getmonto : currency;
begin
        result:= vmonto;
end;

procedure TfrmComprobanteC.setmonto (nvalor:currency);
begin
        vmonto:= nvalor;
        EdMonto.Text := formatcurr('#,##0.00',vmonto);
end;

function TfrmComprobanteC.gettasa : single;
begin
        result:= vtasa;
end;

procedure TfrmComprobanteC.settasa (nvalor:single);
begin
        vtasa:= nvalor;
        EdTasa.Text := Floattostr(vtasa);
end;

function TfrmComprobanteC.getcodigo  : string;
begin
    result:= vcodigo;
end;

procedure TfrmComprobanteC.setcodigo (nvalor:string);
begin
    vcodigo:= nvalor;
    editcodigo.Text := vcodigo;
end;

function TfrmComprobanteC.Getdebito : currency;
begin
    result := vdebito;
end;

procedure TfrmComprobanteC.Setdebito(nvalor:currency);
begin
        vdebito := nValor;
        EdDebito.Value := vdebito;
end;

function TfrmComprobanteC.Getcredito :currency;
begin
        result:= vcredito;
end;

procedure TfrmComprobanteC.Setcredito(nvalor:currency);
begin
        vcredito := nvalor;
        EdCredito.Value := vcredito;
end;

function TfrmComprobanteC.getdetalle: string;
begin
     result := vdetalleaux;
end;

procedure TfrmComprobanteC.setdetalle(nvalor:string);
begin
      vdetalleaux := nvalor;
      edDetalleAux.Text := vdetalleaux;
end;

function TfrmComprobanteC.getidpersona : string;
begin
        result:= vid_persona;
end;

procedure TfrmComprobanteC.setidpersona (nvalor:string);
begin
        vid_persona := nvalor;
        EdNit.Text := vid_persona;
end;

function TfrmComprobanteC.getestado : string;
begin
        result := vestado;
end;

procedure TfrmComprobanteC.setestado(nvalor:string);
begin
        vestado:= 'O';
end;

function TfrmComprobanteC.getnomcuenta : string;
begin
        result := vnomcuenta;
end;

procedure TfrmComprobanteC.setnomcuenta (nvalor: string);
begin
        vnomcuenta := nvalor;
        label11.Caption := vnomcuenta;
end;

procedure TfrmComprobanteC.EdDebitoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmComprobanteC.EdCreditoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmComprobanteC.prReport1InitDetailBandDataSet(Sender: TObject;
  DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
begin
        if DataSetName = 'IBAuxiliar1' then begin
          with IBAuxiliar1 do begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := IBAuxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := IBAuxiliar.FieldByName('ID_PERSONA').AsString;
            try
             Open;
            except
             raise;
            end;
          end;
        end;
end;

procedure TfrmComprobanteC.prReport1PrintComplete(Sender: TObject);
begin
      vimpreso := true;
      with IBQuery2 do
       begin
         Close;
         sql.Clear;
         sql.Add('update CON$COMPROBANTE set ');
         sql.Add('CON$COMPROBANTE."IMPRESO" = :"IMPRESO"');
         sql.Add(' where ');
         sql.Add('CON$COMPROBANTE."TIPO_COMPROBANTE = :"TIPO_COMPROBANTE" and');
         sql.Add('CON$COMPROBANTE."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('CON$COMPROBANTE."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('TIPO_COMPROBANTE').AsInteger := id_tipocomprobante;
         ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(vid_comprobante);
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('IMPRESO').AsInteger  := ord(vimpreso);
         ExecSQL;
         Transaction.Commit;
       end;
end;

procedure TfrmComprobanteC.dblcbtipoKeyPress(Sender: TObject;
  var Key: Char);
begin
       EnterTabs(Key,Self);
end;

procedure TfrmComprobanteC.dblcbtipoEnter(Sender: TObject);
begin
        dblcbtipo.DropDown;
end;

procedure TfrmComprobanteC.CmdPUCClick(Sender: TObject);
var
   frmPUC: TfrmMantenimientopuc;
begin
        frmPUC := TfrmMantenimientopuc.Create(self);
        frmPUC.CodigoSeleccionado := editcodigo.Text;
        frmPUC.btnSeleccionar.Enabled := true;
        if ( frmPUC.ShowModal = mrOK ) then
        begin
            frmPUC.btnSeleccionar.Enabled := false;
            editcodigo.Text := frmPUC.CodigoSeleccionado;
            dmGeneral.IBTransaction1.Commit;
            dmGeneral.IBTransaction1.StartTransaction;
           // IBTransaction1.StartTransaction;
           // IBTransaction2.StartTransaction;
           // IBTransaction3.StartTransaction;
            IBQTipoC.Open;
            IBQTipoC.Last;
            IBQTipoC.First;
            dblcbtipo.KeyValue := id_tipocomprobante;
            EdDebito.SetFocus;

        end;
        frmPUC.Free;
end;

procedure TfrmComprobanteC.btnRecuperarPlantillaClick(Sender: TObject);
var
  frmPlantilla: TfrmPlantilla;
  auxiliar:integer;
  Arecord:Plist;
begin
    frmPlantilla := TfrmPlantilla.Create(self);
    if ( frmPlantilla.ShowModal = mrOK ) then
    begin
        with frmPlantilla.Query do
          begin
                List.Clear;
                auxiliar:= 1;
                if (auxiliar <> 0) then
                 begin
                    while not Eof do
                    begin
                    New(Arecord);
                    ARecord^.codigo:= fieldbyname('PLDE_CODIGO').AsString;
                    with IBQuery1 do
                     begin
                      sql.Clear;
                      Sql.Add('select "NOMBRE" from CON$PUC where CON$PUC."CODIGO" =:"CODIGO"');
                      parambyname('CODIGO').AsString := Arecord^.codigo;
                      active := true;
                      nombre := fieldbyname('NOMBRE').AsString;
                     end;
                    ARecord^.nomcuenta:= nombre;
                    Arecord^.detalle := fieldbyname('PLDE_DESCRIPCION').AsString;
                    Arecord^.debito:= fieldbyname('PLDE_DEBITO').AsCurrency;
                    Arecord^.credito:= fieldbyname('PLDE_CREDITO').AsCurrency;
                    Arecord^.tipoide:= fieldbyname('PLDE_TIPOID').AsInteger;
                    Arecord^.idpersona := fieldbyname('PLDE_IDPERSONA').AsString;
                    Arecord^.monto:=fieldbyname('PLDE_MONTO').AsCurrency;
                    Arecord^.tasa:=fieldbyname('PLDE_TASA').AsFloat;
                    Arecord^.estado:='O';
                    List.Add(Arecord);
                    next;
                    end;
                    actualizaxsauxiliar;
                 end;
          end;

    end;
end;

procedure TfrmComprobanteC.btnGuardarPlantillaClick(Sender: TObject);
var
Arecord : Plist;
I:integer;
plantillanombre:string;
fecha:string;
plantillaID: Integer;
transaction : TIBTransaction;
transaction2: TIBTransaction;
ibsql : TIBQuery;
ibsql2: TIBSQL;
begin
         transaction := TIBTransaction.Create(nil);
         transaction.DefaultDatabase := dmGeneral.IBDatabase1;
         transaction.StartTransaction;
         transaction2 := TIBTransaction.Create(nil);
         transaction2.DefaultDatabase := dmGeneral.IBDatabase1;
// Obtener Consecutivo
         ibsql2 := TIBSQL.Create(nil);
         ibsql2.Transaction := transaction2;
         plantillaID := ObtenerConsecutivoPlantilla(ibsql2);
         transaction2.Free;
         ibsql2.Free;
// Fin Obtener Consecutivo
         ibsql := TIBQuery.Create(nil);
         ibsql.Transaction := transaction;
         DateTimeToString(fecha,'yyyyMMddHHmm',now);
         plantillanombre := InputBox('Nombre para la Plantilla','Digite un Nombre Para la Plantilla','Plantilla_'+fecha);
         ibsql.SQL.Clear;
         ibsql.SQL.Add('insert into CON$PLANTILLA (PLAN_ID,PLAN_DESCRIPCION) values (');
         ibsql.SQL.Add(':PLAN_ID,:PLAN_DESCRIPCION)');
         ibsql.ParamByName('PLAN_ID').AsInteger := plantillaID;
         ibsql.ParamByName('PLAN_DESCRIPCION').AsString := plantillanombre;
         ibsql.ExecSQL;
         if List.Count > 0 then
         for I := 0 to List.Count -1 do
         begin
            ibsql.Close;
            ibsql.SQL.Clear;
            ibsql.SQL.Add('insert into CON$PLANILLADETALLE values (');
            ibsql.SQL.Add(':PLAN_ID,:PLDE_ORDEN,:PLDE_CODIGO,:PLDE_DEBITO,:PLDE_CREDITO, :PLDE_TIPOID, :PLDE_IDPERSONA, :PLDE_DESCRIPCION, :PLDE_MONTO, :PLDE_TASA)');
            ARecord := List.Items[I];
            ibsql.ParamByName('PLAN_ID').AsInteger := plantillaID;
            ibsql.ParamByName('PLDE_ORDEN').AsInteger := I;
            ibsql.ParamByName('PLDE_CODIGO').AsString := Arecord^.codigo;
            ibsql.ParamByName('PLDE_DEBITO').AsCurrency := Arecord^.debito;
            ibsql.ParamByName('PLDE_CREDITO').AsCurrency := Arecord^.credito;
            ibsql.ParamByName('PLDE_TIPOID').AsInteger := ARecord^.tipoide;
            ibsql.ParamByName('PLDE_IDPERSONA').AsString := ARecord^.idpersona;
            ibsql.ParamByName('PLDE_DESCRIPCION').AsString := ARecord^.detalle;
            ibsql.ParamByName('PLDE_MONTO').AsCurrency := ARecord^.monto;
            ibsql.ParamByName('PLDE_TASA').AsFloat := ARecord^.tasa;
            try
               ibsql.ExecSQL;
            except
               raise;
            end;
          end;
         transaction.Commit;
         transaction.Free;
         ibsql.Free;

end;

procedure TfrmComprobanteC.dblcbtipoExit(Sender: TObject);
begin
        id_tipocomprobante := dblcbtipo.KeyValue;
end;

procedure TfrmComprobanteC.BitBtn1Click(Sender: TObject);
var
anulacion : string;
Tabla : String;
begin
        with IBAuxiliar do begin
         if  Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         empleado;

         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(NoComprobante.Caption);
         ParamByName('TIPO_COMPROBANTE').AsInteger := dblcbtipo.KeyValue;
         try
          Open;
          prReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
          prReport1.Variables.ByName['NIT'].AsString := Nit;
          prReport1.Variables.ByName['FechaHoy'].AsDateTime := fFechaActual;
          if prReport1.PrepareReport then
            prReport1.PreviewPreparedReport(True);
         except
          MessageDlg('Error al generar el reporte',mtError,[mbcancel],0);
         end;
        end;end;

procedure TfrmComprobanteC.edDetalleAuxKeyPress(Sender: TObject;
  var Key: Char);
begin
       EnterTabs(Key,Self);
end;

procedure TfrmComprobanteC.edDetalleAuxExit(Sender: TObject);
begin
        if trim(edDetalleAux.Text) = '' then
        begin
            edDetalleAux.Text := descripcion;
        end;

        detalle := edDetalleAux.Text;
end;

procedure TfrmComprobanteC.EdMontoExit(Sender: TObject);
begin
        if EdMonto.Text <> '' then
          begin
            monto := strtocurr(EdMonto.Text);
            EdMonto.Text := formatcurr('#,##0.00',monto);
            if EdTasa.Visible then
             EdTasa.SetFocus
            else
             eddebito.SetFocus;
         end;
end;

procedure TfrmComprobanteC.EdTasaExit(Sender: TObject);
begin
        if EdTasa.Text <> '' then
          begin
            tasa := strtofloat(EdTasa.Text);
            EdTasa.Text := formatfloat('#,##0.00',tasa);
            eddebito.SetFocus
          end;
end;

procedure TfrmComprobanteC.btnReversarClick(Sender: TObject);
var
  localTransaction: TIBTransaction;
  IBQuery1 : TIBQuery;
  IBQuery2 : TIBQuery;

  l_id_comprobante : Integer;
  l_id_agencia : Integer;
  l_id_tipocomprobante : Integer;
begin

if (estadoc= 'C') and (estadoa= 'C') then
   if  MessageDlg('Seguro de Reversar el Comprobante',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
   IBQuery1 := TIBQuery.Create(self);
   IBQuery2 := TIBQuery.Create(self);
   localTransaction := TIBTransaction.Create(self);
   localTransaction.DefaultDatabase := dmGeneral.IBDatabase1;
   localTransaction.StartTransaction;
   IBQuery1.Transaction := localTransaction;
   IBQuery2.Transaction := localTransaction;
   with IBQuery1 do
   begin
    sql.Clear;
    Sql.Add('update CON$COMPROBANTE set ');
    Sql.Add('CON$COMPROBANTE."ESTADO" = :"estado"');
    sql.Add('where CON$COMPROBANTE."TIPO_COMPROBANTE" = :"TIPO_COMPROBANTE" and CON$COMPROBANTE."ID_COMPROBANTE" = :"ID_COMPROBANTE" and CON$COMPROBANTE."ID_AGENCIA" = :"ID_AGENCIA"');
    ParamByName('TIPO_COMPROBANTE').AsInteger := id_tipocomprobante;
    parambyname('ID_COMPROBANTE').AsInteger := id_comprobante;
    parambyname('ID_AGENCIA').AsInteger := Agencia;
    parambyname('ESTADO').AsString := 'O';
    ExecSQL;
   end;
  with IBQuery2 do
   begin
    sql.Clear;
    Sql.Add('update CON$AUXILIAR set ');
    Sql.Add('CON$AUXILIAR."ESTADOAUX" = :"ESTADOAUX"');
    sql.Add('where CON$AUXILIAR."TIPO_COMPROBANTE" = :"TIPO_COMPROBANTE" and CON$AUXILIAR."ID_COMPROBANTE" = :"ID_COMPROBANTE" and CON$AUXILIAR."ID_AGENCIA" = :"ID_AGENCIA"');
    ParamByName('TIPO_COMPROBANTE').AsInteger := id_tipocomprobante;
    parambyname('ID_COMPROBANTE').AsInteger := id_comprobante;
    parambyname('ID_AGENCIA').AsInteger := agencia;
    ParamByName('ESTADOAUX').AsString := 'O';
    ExecSQL;
   end;
    localTransaction.Commit;
    l_id_comprobante := strtoint(vid_comprobante);
    l_id_tipocomprobante := dblcbtipo.KeyValue;
    l_id_agencia := agencia;
    Btnlimpiar.Click;
    buscarcomp(l_id_tipocomprobante,l_id_comprobante, l_id_agencia);
    id_tipocomprobante := l_id_tipocomprobante;
    id_agencia := l_id_agencia;
    id_comprobante := l_id_comprobante;
  end;
end;

end.
