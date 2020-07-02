unit Unit_Comprobante;

interface

uses
  Windows, Messages, SysUtils, Math, DateUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB,
  IB, IBCustomDataSet, IBQuery, XStringGrid, Mask, CEForm, pr_Common, pr_Parser, pr_TxClasses,
  IBSQL, pr_Classes, UnitDmGeneral;

 type
      TComprobante = class
   end;

type
  PList = ^AList;
  AList = record
    codigo   : string;
    nomcuenta: string;
    debito   : currency;
    credito  : currency;
    Tp       :Integer;
    nocuenta : integer;
    nocredito: string;
    tipoide  : integer;
    idpersona: string;
    monto    : currency;
    tasa     : single;
    estado   : string;
    gmf      : Boolean;
    banco    : Boolean;
    esRetiroCheque : Boolean;
  end;

type PCuentas = ^ACuentas;
     ACuentas = record
        Tp:Integer;
        Cuenta:Integer;
        Debitos:Currency;
        Creditos:Currency;
        EsRetiroCheque:Boolean;
end;

type
  PSaldos = ^ASaldos;
  ASaldos = record
    tipo:Integer;
    numero:Integer;
    saldo:Currency;
end;

type
  TfrmComprobante = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcbtipo_comp: TDBLookupComboBox;
    DblcbAgencia: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    editdescripcion: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    CheckBoxcerrado: TCheckBox;
    CheckBoximpreso: TCheckBox;
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
    fechadia: TLabel;
    Edittotaldebito: TMemo;
    Edittotalcredito: TMemo;
    CheckBoxanulado: TCheckBox;
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
    PanelXS: TPanel;
    BtnAgregar: TBitBtn;
    BtnModificarGrid: TBitBtn;
    BtnEliminar: TBitBtn;
    IBAuxiliar1: TIBQuery;
    prReport1: TprReport;
    Report1: TprTxReport;

    procedure BtnGrabarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bloquear;
    procedure desbloquear;
    procedure BtncerrarClick(Sender: TObject);
    procedure BtnAgregarClick(Sender: TObject);
    procedure dblcbtipo_compEnter(Sender: TObject);
    procedure dblcbtipo_compExit(Sender: TObject);
    procedure DblcbAgenciaEnter(Sender: TObject);
    procedure DblcbAgenciaExit(Sender: TObject);
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
    procedure prReport1InitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure prReport1PrintComplete(Sender: TObject);


  private
    function gettipo_comp : integer;
    procedure settipo_comp (nvalor:integer);
    function getimpreso : boolean;
    procedure setimpreso (nvalor:boolean);
    function getdescripcion:string;
    procedure setdescripcion (nvalor:string);
    function grabar : Boolean;
    function actualizar : Boolean;
    Procedure Empleado;
    function GrabarCaptacion(Cuenta: integer; ValorD,
      ValorC: Currency; EsRetiroCheque:Boolean): Boolean;
    function EvaluarCodigo(Codigo: string): string;
    procedure buscarcomprobante(ID_COMPROBANTE: integer; ID_AGENCIA:Integer);
    procedure BuscarComp(Id, Ag: Integer);
    procedure Inicializar;
    procedure actualizaxsauxiliar;
  public
    property tipo_comp : integer read gettipo_comp write settipo_comp;
    property impreso : boolean read getimpreso write setimpreso;
    property descripcion : string read getdescripcion write setdescripcion;

  end;


var
  frmComprobante: TfrmComprobante;
  dmGeneral: TdmGeneral;
  vid_comprobante       :string;
  vfechadia             :TDate;
  vfechadiamod          :TDate;
  vtipo_comprobante     :integer;
  vdescripcion          :string;
  vtotal_debito         :currency;
  vtotal_credito        :currency;
  vestadoc              :string;
  vimpreso              :boolean;
  vcomprobante          :integer;
  anulacion             :string;
  id_comprobante        :integer;
  id_agencia            :integer;
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
  vGMF                  :Boolean;

// prueba

implementation

uses digitacuenta, UnitVistaPreliminar,
Unit_buscarcomprobante,unit_Dmpuc, UnitGlobales, Unit_DmComprobante,
UnitTipoImpresion;


{$R *.dfm}

var DmComprobante :TDmComprobante;

function Tfrmcomprobante.gettipo_comp : integer;
begin
        result:= vtipo_comprobante;
end;

procedure Tfrmcomprobante.settipo_comp(nvalor:integer);
begin
        vtipo_comprobante := nValor;
        dblcbtipo_comp.KeyValue := vtipo_comprobante;
end;


function Tfrmcomprobante.getdescripcion : string;
begin
        result:= vdescripcion;
end;

procedure Tfrmcomprobante.setdescripcion (nvalor:string);
begin
        vdescripcion:= nvalor;
        editdescripcion.Text:= vdescripcion;

end;


function Tfrmcomprobante.getimpreso : boolean;
begin
        result:= vimpreso;
end;

procedure Tfrmcomprobante.setimpreso (nvalor:boolean);
begin
        vimpreso:= nvalor;
        checkboximpreso.Checked := vimpreso;
end;

procedure TfrmComprobante.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        DmComprobante := TDmComprobante.Create(self);
end;

function Tfrmcomprobante.grabar : Boolean;
var
Arecord : Plist;
I:integer;
TAHOV,TAHOC,TAPO,TPAGOS,TPAGOSINT,TPAGOSCAJA:Currency;
CodigoPago:string;
begin

      Consecutivo := ObtenerConsecutivo(IBSQL1,dblcbtipo_comp.KeyValue);
      Consec := FormatCurr('0000000',Consecutivo);
      Nocomprobante.Caption := consec;
      vid_comprobante:= consec;

      TAHOV := 0;
      TAHOC := 0;
      TAPO := 0;
      TPAGOS := 0;
      TPAGOSINT := 0;
      TPAGOSCAJA := 0;

      DmComprobante.IBQuery1.Transaction.StartTransaction;
      with dmcomprobante.IBQuery1 do
        try
         Close;
         sql.Clear;
         sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
         sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
         sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
         sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
         sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
         sql.Add('"con$comprobante"."ANULACION","con$comprobante".ID_EMPLEADO)');
         sql.Add('values (');
         sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
         sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
         sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION",:ID_EMPLEADO)');

         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByname('FECHADIA').AsDate := Date; //fFechaActual;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := vtipo_comprobante;
         ParamByName('DESCRIPCION').AsBlob := Trim(vdescripcion);
         ParamByName('TOTAL_DEBITO').AsCurrency  := vtotal_debito;
         ParamByName('TOTAL_CREDITO').AsCurrency  := vtotal_credito;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByname('ANULACION').asstring := '';
         ParamByName('IMPRESO').AsInteger  := Ord(false);
         ParamByName('ID_EMPLEADO').AsString := DBAlias;
         ExecSQL;

         SQL.Clear;
         SQL.Add('insert into "con$auxiliar" values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
         if List.Count > 0 then
         for I := 0 to List.Count -1 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "con$auxiliar" values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
            ARecord := List.Items[I];
            ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('CODIGO').AsString := Arecord^.codigo;
            ParamByName('DEBITO').AsCurrency := Arecord^.debito;
            ParamByName('CREDITO').AsCurrency := Arecord^.credito;
            if Arecord^.nocuenta = 0 then
              ParamByName('ID_CUENTA').Clear
            else
              ParamByName('ID_CUENTA').AsInteger := Arecord^.nocuenta;
            if Arecord^.nocredito = '' then
              ParamByName('ID_COLOCACION').Clear
            else
              ParamByName('ID_COLOCACION').AsString := Arecord^.nocredito;
            ParamByName('ID_IDENTIFICACION').AsInteger := Arecord^.tipoide;
            ParamByName('ID_PERSONA').AsString := Arecord^.idpersona;
            ParamByName('MONTO_RETENCION').AsCurrency := Arecord^.monto;
            ParamByName('TASA_RETENCION').AsFloat := Arecord^.tasa;
            ParamByName('ESTADOAUX').AsString := Arecord^.estado;
            ExecSQL;
            evaluarcodigo(Arecord^.codigo);
            if captacion then GrabarCaptacion(Arecord^.nocuenta,Arecord^.debito,Arecord^.credito,Arecord^.esretirocheque);
             if ARecord^.credito > 0 then
               if ARecord^.gmf then
                 if (ARecord^.codigo = '110505000000000000') then
                    TPAGOSCAJA := TPAGOSCAJA + ARecord^.Credito
                 else
                 if (ARecord^.codigo = '111005010000000000') or
                    (ARecord^.codigo = '111005030000000000') or
                    (ARecord^.codigo = '111005050000000000') or
                    (ARecord^.codigo = '111005070000000000') or
                    (ARecord^.codigo = '111005090000000000') or Arecord^.banco then begin
                    TPAGOS := TPAGOS + ARecord^.Credito;
                    CodigoPago := ARecord^.Codigo;
                 end;
             if ARecord^.debito > 0 then
               if ARecord^.gmf then
                 if (ARecord^.codigo = '210505010000000000') or
                    (ARecord^.codigo = '210505030000000000') then
                     TAHOV := TAHOV + Arecord^.debito
                 else
                 if (ARecord^.codigo = '212505000000000000') or
                    (ARecord^.codigo = '212515000000000000') then
                     TAHOC := TAHOC + ARECORD^.debito
                 else
                 if (ARecord^.codigo = '310505000000000000') then
                    TAPO := TAPO + arecord^.debito
                 else
                 if (ARecord^.codigo = '240520000000000000') then
                    TPAGOSINT := TPAGOSINT + ARecord^.debito;
         end;

            Close;
            SQL.Clear;
            SQL.Add('insert into "con$auxiliar" values (');
            SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
            SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
            SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');

            if TAHOV > 0 then begin
               Close;
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := fFechaActual;
               ParamByName('CODIGO').AsString := '244205000000000000';
               ParamByName('DEBITO').AsCurrency := 0.00;
               ParamByName('CREDITO').AsCurrency := SimpleRoundTo((TAHOV / 1000 ) * 4,0);
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;
            if TAHOC > 0 then begin
               Close;
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := fFechaActual;
               ParamByName('CODIGO').AsString := '244215000000000000';
               ParamByName('DEBITO').AsCurrency := 0.00;
               ParamByName('CREDITO').AsCurrency := SimpleRoundTo((TAHOC / 1000 ) * 4,0);
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;
            if (TAPO+TPAGOSCAJA+TPAGOSINT) > 0 then begin
               Close;
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := fFechaActual;
               ParamByName('CODIGO').AsString := '244295000000000000';
               ParamByName('DEBITO').AsCurrency := 0.00;
               ParamByName('CREDITO').AsCurrency := SimpleRoundTo((TAPO / 1000 ) * 4,0)+SimpleRoundTo((TPAGOS / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSINT / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSCAJA / 1000 ) * 4,0);
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;

            if (TAHOV) > 0 then begin
               Close;
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := fFechaActual;
               ParamByName('CODIGO').AsString := '531520000000000000';
               ParamByName('DEBITO').AsCurrency := SimpleRoundTo((TAHOV / 1000 ) * 4,0);
               ParamByName('CREDITO').AsCurrency := 0.00;
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;

            if (TAHOC+TAPO+TPAGOSINT+TPAGOSCAJA+TPAGOS) > 0 then begin
               Close;
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := fFechaActual;
               ParamByName('CODIGO').AsString := '615035000000000000';
               ParamByName('DEBITO').AsCurrency := SimpleRoundTo((TAHOC / 1000 ) * 4,0)+SimpleRoundTo((TAPO / 1000 ) * 4,0)+SimpleRoundTo((TPAGOS / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSINT / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSCAJA / 1000 ) * 4,0);
               ParamByName('CREDITO').AsCurrency := 0.00;
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;

            if (TPAGOS) > 0 then begin
               Close;
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := fFechaActual;
               ParamByName('CODIGO').AsString := CodigoPago;
               ParamByName('DEBITO').AsCurrency := 0.00;
               ParamByName('CREDITO').AsCurrency := SimpleRoundTo((TPAGOS / 1000 ) * 4,0);
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;

         Transaction.Commit;
         Result := true;
       except
         Transaction.Rollback;
         Result := false;
         raise;
       end;
end;

function Tfrmcomprobante.actualizar: Boolean;
var
Arecord : Plist;
I:integer;
TAHOV,TAHOC,TAPO,TPAGOS,TPAGOSINT:Currency;
begin

      TAHOV := 0;
      TAHOC := 0;
      TAPO  := 0;
      TPAGOS := 0;
      TPAGOSINT := 0;
      with Dmcomprobante.IBQuery2 do
       try
         sql.Clear;
         sql.Add('update "con$comprobante" set ');
         sql.Add('"con$comprobante"."TIPO_COMPROBANTE" =:"TIPO_COMPROBANTE",');
         sql.Add('"con$comprobante"."DESCRIPCION" =:"DESCRIPCION",');
         sql.Add('"con$comprobante"."TOTAL_DEBITO" =:"TOTAL_DEBITO",');
         sql.Add('"con$comprobante"."TOTAL_CREDITO" =:"TOTAL_CREDITO",');
         sql.Add('"con$comprobante"."ESTADO" =:"ESTADO",');
         sql.Add('"con$comprobante"."IMPRESO" =:"IMPRESO",');
         sql.Add('"con$comprobante"."ANULACION" =:"ANULACION",');
         sql.Add('"con$comprobante".ID_EMPLEADO = :ID_EMPLEADO');
         sql.Add(' where ');
         sql.Add('"con$comprobante"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('"con$comprobante"."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := vtipo_comprobante;
         ParamByName('DESCRIPCION').AsString := Trim(vdescripcion);
         ParamByName('TOTAL_DEBITO').AsCurrency  := vtotal_debito;
         ParamByName('TOTAL_CREDITO').AsCurrency  := vtotal_credito;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByName('IMPRESO').AsInteger  := Ord(False);
         ParamByName('ANULACION').AsString := Trim(anulacion);
         parambyname('ID_EMPLEADO').AsString := DBAlias;
         ExecSQL;

         SQL.Clear;
         SQL.Add('delete from "con$auxiliar" where ');
         SQL.Add('"con$auxiliar"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         SQL.Add('"con$auxiliar"."ID_AGENCIA" = :"ID_AGENCIA"');
         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ExecSQL;

         SQL.Clear;
         SQL.Add('insert into "con$auxiliar" values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
         if List.Count > 0 then
         for I := 0 to List.Count -1 do
         begin
            ARecord := List.Items[I];
            ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
            ParamByName('ID_AGENCIA').AsInteger:= Agencia;
            ParamByName('FECHA').AsDate := vfechadiamod;
            ParamByName('CODIGO').AsString := Arecord^.codigo;
            ParamByName('DEBITO').AsCurrency := Arecord^.debito;
            ParamByName('CREDITO').AsCurrency := Arecord^.credito;
            ParamByName('ID_CUENTA').AsInteger := Arecord^.nocuenta;
            ParamByName('ID_COLOCACION').AsString := Arecord^.nocredito;
            ParamByName('ID_IDENTIFICACION').AsInteger := Arecord^.tipoide;
            ParamByName('ID_PERSONA').AsString := Arecord^.idpersona;
            ParamByName('MONTO_RETENCION').AsCurrency := Arecord^.monto;
            ParamByName('TASA_RETENCION').AsFloat := Arecord^.tasa;
            ParamByname('ESTADOAUX').AsString := Arecord^.estado;
            ExecSQL;
             if ARecord^.credito > 0 then
               if ARecord^.gmf then
                 if (ARecord^.codigo = '110505000000000000') or
                    (ARecord^.codigo = '111005010000000000') or
                    (ARecord^.codigo = '111005030000000000') or
                    (ARecord^.codigo = '111005050000000000') or
                    (ARecord^.codigo = '111005070000000000') or
                    (ARecord^.codigo = '111005090000000000') or Arecord^.banco then
                    TPAGOS := TPAGOS + ARecord^.credito;
             if ARecord^.debito > 0 then
               if ARecord^.gmf then
                 if (ARecord^.codigo = '210505010000000000') or
                    (ARecord^.codigo = '210505030000000000') then
                     TAHOV := TAHOV + Arecord^.debito
                 else
                 if (ARecord^.codigo = '212505000000000000') or
                    (ARecord^.codigo = '212515000000000000') then
                     TAHOC := TAHOC + ARECORD^.debito
                 else
                 if (ARecord^.codigo = '310505000000000000') then
                    TAPO := TAPO + arecord^.debito
                 else
                 if (ARecord^.codigo = '240520000000000000') then
                    TPAGOSINT := TPAGOSINT + ARecord^.debito;

         end;
         SQL.Clear;
         SQL.Add('insert into "con$auxiliar" values (');
         SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
         SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
         SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');

            if TAHOV > 0 then begin
               Close;
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := vfechadia;
               ParamByName('CODIGO').AsString := '244205000000000000';
               ParamByName('DEBITO').AsCurrency := 0.00;
               ParamByName('CREDITO').AsCurrency := SimpleRoundTo((TAHOV / 1000 ) * 4,0);
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;
            if TAHOC > 0 then begin
               Close;
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := vfechadia;
               ParamByName('CODIGO').AsString := '244215000000000000';
               ParamByName('DEBITO').AsCurrency := 0.00;
               ParamByName('CREDITO').AsCurrency := SimpleRoundTo((TAHOC / 1000 ) * 4,0);
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;
            if (TAPO+TPAGOS+TPAGOSINT) > 0 then begin
               Close;
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := vfechadia;
               ParamByName('CODIGO').AsString := '244295000000000000';
               ParamByName('DEBITO').AsCurrency := 0.00;
               ParamByName('CREDITO').AsCurrency := SimpleRoundTo((TAPO / 1000 ) * 4,0)+SimpleRoundTo((TPAGOS / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSINT / 1000 ) * 4,0);
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;

            if (TAHOV+TAHOC+TAPO+TPAGOS+TPAGOSINT) > 0 then begin
               Close;            
               ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
               ParamByName('ID_AGENCIA').AsInteger:= Agencia;
               ParamByName('FECHA').AsDate := vfechadia;
               ParamByName('CODIGO').AsString := '531520000000000000';
               ParamByName('DEBITO').AsCurrency := SimpleRoundTo((TAHOV / 1000 ) * 4,0)+SimpleRoundTo((TAHOC / 1000 ) * 4,0)+SimpleRoundTo((TAPO / 1000 ) * 4,0)+SimpleRoundTo((TPAGOS / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSINT / 1000 ) * 4,0);
               ParamByName('CREDITO').AsCurrency := 0.00;
               ParamByName('ID_CUENTA').Clear;
               ParamByName('ID_COLOCACION').Clear;
               ParamByName('ID_IDENTIFICACION').AsInteger := 0;
               ParamByName('ID_PERSONA').AsString := '';
               ParamByName('MONTO_RETENCION').AsCurrency := 0;
               ParamByName('TASA_RETENCION').AsFloat := 0;
               ParamByName('ESTADOAUX').AsString := 'O';
               ExecSQL;
            end;
         
         Transaction.Commit;
         Result := true;
//         vmodificar:= true;
         buscarcomp(StrToInt(vid_comprobante),Agencia);
       except
         Transaction.Rollback;
//         vmodificar:= true;
         buscarcomp(StrToInt(vid_comprobante),Agencia);
         Result := false;
       end;
end;


procedure TfrmComprobante.BtnGrabarClick(Sender: TObject);
var TAHOV,TAHOC,TAPO,TPAGOS,TPAGOSINT:Currency;
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


  if DmGeneral.IBTransaction1.InTransaction then
     DmGeneral.IBTransaction1.Commit;
  dmGeneral.IBTransaction1.StartTransaction;
  if vModificar then
     begin
      if tipo_comp <1 then begin
         messagedlg('No ha digitado el tipo de comprobante',mtError,[mbOk],0);
         dblcbtipo_comp.SetFocus;
         exit;
        end;
      if agencia <1 then begin
         messagedlg('No ha digitado la agencia',mtError,[mbOk],0);
         dblcbagencia.SetFocus;
         exit;
        end;
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
//           vmodificar := true;
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
      if tipo_comp <1 then
        begin
         messagedlg('No ha digitado el tipo de comprobante',mtError,[mbOk],0);
         dblcbtipo_comp.SetFocus;
         exit;
        end;
      if agencia <1 then begin
         messagedlg('No ha digitado la agencia',mtError,[mbOk],0);
         dblcbagencia.SetFocus;
         exit;
        end;
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
//       vmodificar := True;
       BuscarComp(StrToInt(vid_comprobante),Agencia);
       end
     else
       MessageDlg('Comprobante No Grabado',mtError,[mbOK],0);
   end;
end;


procedure TfrmComprobante.BtncerrarClick(Sender: TObject);
begin
        self.Close;
end;

procedure TfrmComprobante.actualizaxsauxiliar;
var
i:integer;
ARecord: PList;
TAHOV,TAHOC,TAPO,TPAGOS,TPAGOSINT,TPAGOSCAJA:Currency;
CodigoPago:string;
NombreCodigo:string;
begin
   TAHOV := 0;
   TAHOC := 0;
   TAPO := 0;
   TPAGOS := 0;
   TPAGOSINT := 0;
   TPAGOSCAJA := 0;

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
        xsauxiliar.ColWidths[3] := 100;
        xsauxiliar.Cells [3,i+1] := formatcurr ('#,##0.00',Arecord^.debito);
        vtotal_debito := vtotal_debito + ARecord^.debito;
        xsauxiliar.ColWidths[4] := 100;
        xsauxiliar.Cells [4,i+1] := formatcurr ('#,##0.00',Arecord^.credito);
        XSauxiliar.ColWidths[5] := 30;
        if ARecord^.gmf then 
        XSauxiliar.Cells[5,i+1] := 'S'
        else
        XSauxiliar.Cells[5,i+1] := 'N';

        vtotal_credito := vtotal_credito + Arecord^.credito;
        edittotaldebito.Text := currtostr(vtotal_debito);
        edittotalcredito.Text := currtostr(vtotal_credito);

        if arecord^.nocuenta <> 0 then
        xsauxiliar.Cells [2,i+1] := IntToStr(arecord^.nocuenta);

        if arecord^.nocredito <>'' then
        xsauxiliar.Cells [2,i+1] := trim(arecord^.nocredito);

        if ARecord^.credito > 0 then
          if ARecord^.gmf then
            if (ARecord^.codigo = '110505000000000000') then
               TPAGOSCAJA := TPAGOSCAJA + ARecord^.credito
            else
            if (ARecord^.codigo = '111005010000000000') or
               (ARecord^.codigo = '111005030000000000') or
               (ARecord^.codigo = '111005050000000000') or
               (ARecord^.codigo = '111005070000000000') or
               (ARecord^.codigo = '111005090000000000') or ARecord^.banco then begin
               TPAGOS := TPAGOS + ARecord^.credito;
               CodigoPago := ARecord^.codigo;
               NombreCodigo := ARecord^.nomcuenta;
            end;

        if ARecord^.debito > 0 then
          if ARecord^.gmf then
            if (ARecord^.codigo = '210505010000000000') or
               (ARecord^.codigo = '210505030000000000') then
                TAHOV := TAHOV + Arecord^.debito
            else
            if (ARecord^.codigo = '212505000000000000') or
               (ARecord^.codigo = '212515000000000000') then
                TAHOC := TAHOC + ARECORD^.debito
            else
            if (ARecord^.codigo = '310505000000000000') then
               TAPO := TAPO + arecord^.debito
            else
            if (ARecord^.codigo = '240520000000000000') then
               TPAGOSINT := TPAGOSINT + ARecord^.debito;
       end;

     if not vmodificar then begin
       if TAHOV > 0 then begin
          xsauxiliar.RowCount := XSauxiliar.RowCount+1;
          xsauxiliar.Cells [0,XSauxiliar.RowCount-1] := '244205000000000000';
          xsauxiliar.Cells [1,XSauxiliar.RowCount-1] := 'SOBRE LOS DEPOSITOS DE AHORROS';
          xsauxiliar.Cells [2,XSauxiliar.RowCount-1] := '';
          xsauxiliar.Cells [3,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00',0.00);
          xsauxiliar.Cells [4,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00', SimpleRoundTo((TAHOV / 1000 ) * 4,0));
          xsauxiliar.Cells [5,XSauxiliar.RowCount-1] := '';
       end;
       if TAHOC > 0 then begin
          XSauxiliar.RowCount := XSauxiliar.RowCount+1;
          xsauxiliar.Cells [0,XSauxiliar.RowCount-1] := '244215000000000000';
          xsauxiliar.Cells [1,XSauxiliar.RowCount-1] := 'SOBRE LOS DEPOSITOS DE AHORRO CONTRACTUAL';
          xsauxiliar.Cells [2,XSauxiliar.RowCount-1] := '';
          xsauxiliar.Cells [3,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00',0.00);
          xsauxiliar.Cells [4,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00', SimpleRoundTo((TAHOC / 1000 ) * 4,0));
          xsauxiliar.Cells [5,XSauxiliar.RowCount-1] := '';
       end;
       if (TAPO+TPAGOSCAJA+TPAGOSINT) > 0 then begin
          XSauxiliar.RowCount := XSauxiliar.RowCount+1;
          xsauxiliar.Cells [0,XSauxiliar.RowCount-1] := '244295000000000000';
          xsauxiliar.Cells [1,XSauxiliar.RowCount-1] := 'SOBRE OTRAS OPERACIONES';
          xsauxiliar.Cells [2,XSauxiliar.RowCount-1] := '';
          xsauxiliar.Cells [3,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00',0.00);
          xsauxiliar.Cells [4,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00', SimpleRoundTo((TAPO / 1000 ) * 4,0)+SimpleRoundTo((TPAGOS / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSINT / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSCAJA / 1000 ) * 4,0));
          xsauxiliar.Cells [5,XSauxiliar.RowCount-1] := '';
       end;

       if (TAHOV) > 0 then begin
          XSauxiliar.RowCount := XSauxiliar.RowCount+1;
          xsauxiliar.Cells [0,XSauxiliar.RowCount-1] := '531520000000000000';
          xsauxiliar.Cells [1,XSauxiliar.RowCount-1] := 'IMPUESTOS ASUMIDOS';
          xsauxiliar.Cells [2,XSauxiliar.RowCount-1] := '';
          xsauxiliar.Cells [3,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00', SimpleRoundTo((TAHOV / 1000 ) * 4,0));
          xsauxiliar.Cells [4,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00', 0.00);
          xsauxiliar.Cells [5,XSauxiliar.RowCount-1] := '';
       end;

       if (TAHOC+TAPO+TPAGOSINT+TPAGOSCAJA+TPAGOS) > 0 then begin
          XSauxiliar.RowCount := XSauxiliar.RowCount+1;
          xsauxiliar.Cells [0,XSauxiliar.RowCount-1] := '615035000000000000';
          xsauxiliar.Cells [1,XSauxiliar.RowCount-1] := 'CONTRIBUCION EMERGENCIA ECONOMICA';
          xsauxiliar.Cells [2,XSauxiliar.RowCount-1] := '';
          xsauxiliar.Cells [3,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00', SimpleRoundTo((TAHOC / 1000 ) * 4,0)+SimpleRoundTo((TAPO / 1000 ) * 4,0)+SimpleRoundTo((TPAGOS / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSINT / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSCAJA / 1000 ) * 4,0));
          xsauxiliar.Cells [4,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00', 0.00);
          xsauxiliar.Cells [5,XSauxiliar.RowCount-1] := '';
       end;

       if (TPAGOS) > 0 then begin
          XSauxiliar.RowCount := XSauxiliar.RowCount+1;
          xsauxiliar.Cells [0,XSauxiliar.RowCount-1] := CodigoPago;
          xsauxiliar.Cells [1,XSauxiliar.RowCount-1] := NombreCodigo;
          xsauxiliar.Cells [2,XSauxiliar.RowCount-1] := '';
          xsauxiliar.Cells [3,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00',0.00);
          xsauxiliar.Cells [4,XSauxiliar.RowCount-1] := formatcurr ('#,##0.00', SimpleRoundTo((TPAGOS / 1000 ) * 4,0));
          xsauxiliar.Cells [5,XSauxiliar.RowCount-1] := '';
       end;

          vtotal_debito := vtotal_debito + SimpleRoundTo((TAHOV / 1000 ) * 4,0)+SimpleRoundTo((TAHOC / 1000 ) * 4,0)+SimpleRoundTo((TAPO / 1000 ) * 4,0)+SimpleRoundTo((TPAGOS / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSINT / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSCAJA / 1000 ) * 4,0);
          vtotal_credito := vtotal_credito + SimpleRoundTo((TAHOV / 1000 ) * 4,0)+SimpleRoundTo((TAHOC / 1000 ) * 4,0)+SimpleRoundTo((TAPO / 1000 ) * 4,0)+SimpleRoundTo((TPAGOS / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSINT / 1000 ) * 4,0)+SimpleRoundTo((TPAGOSCAJA / 1000 ) * 4,0);
          edittotaldebito.Text := currtostr(vtotal_debito);
          edittotalcredito.Text := currtostr(vtotal_credito);
     end;
    end
    else if count = 0 then
    begin
     edittotaldebito.Text := '0';
     edittotalcredito.Text:= '0';
     xsauxiliar.RowCount := 2;
     xsauxiliar.Cells[0,1]:= '';
     xsauxiliar.Cells[1,1]:= '';
     xsauxiliar.Cells[2,1]:= '';
     xsauxiliar.Cells[3,1]:= '';
     xsauxiliar.Cells[4,1]:= '';
     XSauxiliar.Cells[5,1]:= '';
    end;
end;

procedure TfrmComprobante.dblcbtipo_compEnter(Sender: TObject);
begin
        dblcbtipo_comp.KeyValue := 1;
end;

procedure TfrmComprobante.dblcbtipo_compExit(Sender: TObject);
begin
        if dblcbtipo_comp.KeyValue = 0 then
           dblcbtipo_comp.KeyValue := 1;
        tipo_comp := dblcbtipo_comp.KeyValue;
end;

procedure TfrmComprobante.DblcbAgenciaEnter(Sender: TObject);
begin
        dblcbagencia.KeyValue := Agencia;
end;

procedure TfrmComprobante.DblcbAgenciaExit(Sender: TObject);
begin
        if dblcbagencia.KeyValue = 0 then
           dblcbagencia.KeyValue := 1;
end;


procedure TfrmComprobante.CheckBoximpresoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if key = 13 then
        btnAgregar.SetFocus;
end;


procedure TfrmComprobante.BtnlimpiarClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmComprobante.editdescripcionExit(Sender: TObject);
begin
        if editdescripcion.Text <> '' then
          begin
           descripcion := editdescripcion.Text;
           editdescripcion.Text := uppercase(descripcion);
           vdescripcion := editdescripcion.Text;
          end
        else
          begin
           MessageDlg('No ha digitado la Descripcion del Comprobante',mtError,[mbOK],0);
           editdescripcion.SetFocus;
          end;
end;

procedure TfrmComprobante.BtnBuscarClick(Sender: TObject);
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
          id_agencia:= strtoint(frmbuscarcomprobante.EditAgencia.Text);
          frmBuscarcomprobante.Free;
          buscarcomp(id_comprobante,id_agencia);
        end;
end;


procedure TfrmComprobante.btnrefrescarClick(Sender: TObject);
begin
     dmcomprobante.IBQsetcomprobante.Close;
     dmcomprobante.IBQsetcomprobante.Open;
     DmComprobante.IBQsetauxiliar.close;
     DmComprobante.IBQsetauxiliar.Open;
end;

procedure TfrmComprobante.BtnAnularClick(Sender: TObject);
begin
                if (estadoc= 'N') and (estadoa= 'N')  then
                 begin
                  buscarcomprobante(id_comprobante,id_agencia);
                  bloquear;
                  MessageDlg('El Comprobante ya está anulado',mtError,[mbOk],0);
                  Btnlimpiarclick(sender);
                  desbloquear;
                  exit;
                 end;
                if (estadoc= 'C') and (estadoa= 'C') then
                 begin
                  buscarcomprobante(id_comprobante,id_agencia);
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
                        buscarcomprobante(id_comprobante,id_agencia);
                        label8.Visible:= true;
                        editanulacion.Visible:= true;
                        editanulacion.SetFocus;
                     end;
                end;
                if (estadoc ='') or (estadoa = '') then
                 begin
                  MessageDlg('El comprobante no existe',mtError,[mbOk],0);
                  dblcbtipo_comp.SetFocus;
                 end;
end;

procedure Tfrmcomprobante.bloquear;
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

procedure Tfrmcomprobante.desbloquear;
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

procedure Tfrmcomprobante.buscarcomprobante(ID_COMPROBANTE: integer; ID_AGENCIA:integer);
var
auxiliar:integer;
Arecord:Plist;
begin
        with dmcomprobante.IBQuery1 do
            begin
                SQL.Clear;
                SQL.Add('select * from "con$comprobante" where "con$comprobante"."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
                SQL.Add('and "con$comprobante"."ID_AGENCIA" =:"ID_AGENCIA"');
                paramByName('ID_COMPROBANTE').AsInteger:= ID_COMPROBANTE;
                ParamByName('ID_AGENCIA').AsInteger:= id_agencia;
                Active := True;
                vid_comprobante:= inttostr(fieldbyname('ID_COMPROBANTE').AsInteger);
                if DmComprobante.IBQuery1.RecordCount > 0 then
                begin
                   Nocomprobante.Caption:= vid_comprobante;
                   vfechadiamod := FieldByName('FECHADIA').AsDateTime;
                   fechadia.Caption := datetostr(fieldbyname('FECHADIA').AsDateTime);
                   vtipo_comprobante := strtoint(trim(fieldbyname('TIPO_COMPROBANTE').AsString));
                   dblcbtipo_comp.KeyValue:= vtipo_comprobante;
                   dblcbagencia.KeyValue:= Agencia;
                   vdescripcion := fieldbyname('DESCRIPCION').AsString;
                   editdescripcion.Text:= vdescripcion;
                   vtotal_debito := fieldbyname('TOTAL_DEBITO').AsCurrency;
                   edittotaldebito.Text:= formatcurr('#,##0.00',vtotal_debito);
                   vtotal_credito := fieldbyname('TOTAL_CREDITO').AsCurrency;
                   edittotalcredito.Text:= formatcurr('#,##0.00',vtotal_credito);
                   vestadoc:= fieldbyname('ESTADO').AsString;
                   vimpreso := inttoboolean(fieldbyname('IMPRESO').AsInteger);
//                   BtnGrabar.Caption := '&Modificar';
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

        with Dmcomprobante.IBQuery2 do
          begin
                List.Clear;
                SQL.Clear;
                SQL.Add('select * from "con$auxiliar" where "con$auxiliar"."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
                SQL.Add('and "con$auxiliar"."ID_AGENCIA" =:"ID_AGENCIA"');
                paramByName('ID_COMPROBANTE').AsInteger:= ID_COMPROBANTE;
                ParamByName('ID_AGENCIA').AsInteger:= ID_AGENCIA;
                Active := True;
                auxiliar:= fieldbyname('ID_COMPROBANTE').AsInteger;
                if (auxiliar <> 0) then
                 begin
                    DmComprobante.IBQuery2.Active:= true;
                    Dmcomprobante.IBQuery2.Last;
                    Dmcomprobante.IBQuery2.First;
                    while not Dmcomprobante.IBQuery2.Eof do
                    begin
                    New(Arecord);
                    ARecord^.codigo:= fieldbyname('CODIGO').AsString;
                    with Dmcomprobante.IBQuery1 do
                     begin
                      sql.Clear;
                      Sql.Add('select "NOMBRE" from "con$puc" where "con$puc"."CODIGO" =:"CODIGO"');
                      parambyname('CODIGO').AsString := Arecord^.codigo;
                      active := true;
                      nombre := fieldbyname('NOMBRE').AsString;
                     end;
                    ARecord^.nomcuenta:= nombre;
                    Arecord^.debito:= fieldbyname('DEBITO').AsCurrency;
                    Arecord^.credito:= fieldbyname('CREDITO').AsCurrency;
                    if TRIM(FieldByName('ID_CUENTA').AsString) = '' then
                       Arecord^.nocuenta:= 0
                    else
                       Arecord^.nocuenta:= StrToInt(trim(fieldbyname('ID_CUENTA').AsString));
                    Arecord^.nocredito:= trim(fieldbyname('ID_COLOCACION').AsString);
                    Arecord^.tipoide:=fieldbyname('ID_IDENTIFICACION').AsInteger;
                    Arecord^.idpersona:=fieldbyname('ID_PERSONA').AsString;
                    Arecord^.monto:=fieldbyname('MONTO_RETENCION').AsCurrency;
                    Arecord^.tasa:=fieldbyname('TASA_RETENCION').AsFloat;
                    Arecord^.estado:=fieldbyname('ESTADOAUX').AsString;
                    Arecord^.gmf := False;
                    List.Add(Arecord);
                    next;
                    end;
                    actualizaxsauxiliar;
                 end;
          end;
          BtnGrabar.Enabled := False;
end;



procedure TfrmComprobante.CheckBoxcerradoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,self);
end;

procedure TfrmComprobante.CheckBoxanuladoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,self);
end;

procedure TfrmComprobante.XSauxiliarSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
        posgrid := ARow-1;
        CanSelect := true;
        BtnModificargrid.Enabled := true;
        BtnEliminar.Enabled := true;
end;

procedure TfrmComprobante.editanulacionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if key = 13 then
        dblcbtipo_comp.SetFocus;
end;

procedure TfrmComprobante.editanulacionExit(Sender: TObject);
var
I : integer;
begin
anulacion:=editanulacion.Text;
editanulacion.Text := uppercase(anulacion);
anulacion := editanulacion.Text;
if anulacion <> '' then
 begin
  with Dmcomprobante.IBQuery1 do
   begin
    sql.Clear;
    Sql.Add('update "con$comprobante" set "con$comprobante"."ANULACION" = :"anulacion",');
    Sql.Add('"con$comprobante"."ESTADO" = :"estado"');
    sql.Add('where "con$comprobante"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and "con$comprobante"."ID_AGENCIA" = :"ID_AGENCIA"');
    parambyname('ID_COMPROBANTE').AsInteger := id_comprobante;
    parambyname('ID_AGENCIA').AsInteger := Agencia;
    parambyname('ANULACION').AsString := anulacion;
    parambyname('ESTADO').AsString := 'N';
    active := true;
    Transaction.CommitRetaining;
   end;
  with Dmcomprobante.IBQuery2 do
   begin
    sql.Clear;
    Sql.Add('update "con$auxiliar" set ');
    Sql.Add('"con$auxiliar"."ESTADOAUX" = :"ESTADOAUX"');
    sql.Add('where "con$auxiliar"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and "con$auxiliar"."ID_AGENCIA" = :"ID_AGENCIA"');
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
    dblcbtipo_comp.SetFocus;
 end
 else
 begin
  MessageDlg('Debe digitar la causal de anulacion',mtError,[mbOk],0);
  editanulacion.SetFocus;
 end;
end;


procedure TfrmComprobante.editanulacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
        BtnBuscar.SetFocus;
end;

procedure TfrmComprobante.dblcbtipo_compKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmComprobante.DblcbAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmComprobante.editdescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
       if key = #13 then
       btnAgregar.SetFocus;
end;

procedure TfrmComprobante.BtnModificarGridClick(Sender: TObject);
var
digita : Tdigita;
Arecord: Plist;
AR:PCuentas;
i:Integer;
begin
        digita:= Tdigita.Create(self);
        ARecord := List.Items[posgrid];
        digita.codigo:= arecord^.codigo;
        digita.Label5.Caption := Arecord^.nomcuenta;
        digita.debito := Arecord^.debito;
        digita.credito := Arecord^.credito;
        digita.tipoide:= Arecord^.tipoide;
        digita.tp := ARecord^.tp;
        digita.nocuenta := Arecord^.nocuenta;
        digita.nocredito := Arecord^.nocredito;
        digita.tipoide := Arecord^.tipoide;
        digita.idpersona := Arecord^.idpersona;
        digita.monto := Arecord^.monto;
        digita.tasa := Arecord^.tasa;
        digita.estado := Arecord^.estado;
        digita.GMF := Arecord^.gmf;
        digita.EsRetiroCheque := Arecord^.esRetiroCheque;
        digita.pnlRetiroCheque.Visible := True;
        digita.SCuentas := SCuentas;
        if digita.ShowModal = mrok then
           if posgrid <> -1 then
             begin
             if ARecord^.nocuenta <> 0 then begin
               for i := 0 to SCuentas.Count - 1 do begin
                 AR := SCuentas.Items[i];
                 if (AR^.Tp = ARecord^.Tp) and (AR^.Cuenta = ARecord^.nocuenta) Then
                  begin
                    AR^.Debitos := AR^.Debitos - ARecord^.debito;
                    AR^.Creditos := AR^.Creditos - ARecord^.credito;
                    SCuentas.Items[i] := AR;
                  end;
               end;
             end;
              ARecord:= list.Items[posgrid];
              ARecord^.codigo := digita.codigo;
              ARecord^.nomcuenta := digita.nomcuenta;
              ARecord^.debito := digita.debito;
              ARecord^.credito:= digita.credito;
              Arecord^.Tp := digita.Tp;
              ARecord^.nocuenta:= digita.nocuenta;
              ARecord^.nocredito:= digita.nocredito;
              ARecord^.tipoide := digita.tipoide;
              ARecord^.idpersona:= digita.idpersona;
              ARecord^.monto := digita.monto;
              ARecord^.tasa := digita.tasa;
              ARecord^.estado := digita.estado;
              Arecord^.gmf := digita.GMF;
              Arecord^.esRetiroCheque := digita.EsRetiroCheque;
              list.Items[posgrid]:= Arecord;
// Actualizar Saldo
             if ARecord^.nocuenta <> 0 then begin
               for i := 0 to SCuentas.Count - 1 do begin
                 AR := SCuentas.Items[i];
                 if (AR^.Tp = ARecord^.Tp) and (AR^.Cuenta = ARecord^.nocuenta) Then
                  begin
                    AR^.Debitos := AR^.Debitos + ARecord^.debito;
                    AR^.Creditos := AR^.Creditos + ARecord^.credito;
                    SCuentas.Items[i] := AR;
                  end;
               end;
             end;
// Fin Actualizar Saldo
              posgrid:= -1;
             end;
             actualizaxsauxiliar;
             digita.Free;
             BtnModificargrid.Enabled := false;
             Btneliminar.Enabled := false;
end;

procedure TfrmComprobante.BtnAgregarClick(Sender: TObject);
var digita : Tdigita;
ARecord: PList;
AR:PCuentas;
i:Integer;
begin
        digita:= Tdigita.Create(self);
        digita.codigo:= '';
        digita.nomcuenta:= '';
        digita.debito:= 0;
        digita.credito:= 0;
        digita.nocuenta:= 0;
        digita.nocredito:= '';
        digita.tipoide:= 0;
        digita.idpersona:= '';
        digita.monto:= 0;
        digita.tasa:= 0;
        digita.estado := '';
        digita.GMF := False;
        digita.EsRetiroCheque := False;
        digita.SCuentas := SCuentas;
        if digita.ShowModal = mrOk  then
         begin
           New(ARecord);
           ARecord^.codigo := digita.codigo;
           ARecord^.nomcuenta := digita.nomcuenta;
           ARecord^.debito := digita.debito;
           ARecord^.credito:= digita.credito;
           ARecord^.Tp     := digita.Tp;
           ARecord^.nocuenta:= digita.nocuenta;
           ARecord^.nocredito:= digita.nocredito;
           ARecord^.tipoide := digita.tipoide;
           ARecord^.idpersona:= digita.idpersona;
           ARecord^.monto := digita.monto;
           ARecord^.tasa := digita.tasa;
           Arecord^.estado := digita.estado;
           ARecord^.gmf := digita.GMF;
           ARecord^.banco := digita.esbanco;
           ARecord^.esRetiroCheque  := digita.EsRetiroCheque;
           List.Add(ARecord);
           SCuentas := digita.SCuentas;
           if ARecord^.nocuenta <> 0 then begin
             for i := 0 to SCuentas.Count - 1 do begin
                 AR := SCuentas.Items[i];
                 if (AR^.Tp = ARecord^.Tp) and (AR^.Cuenta = ARecord^.nocuenta) Then
                  begin
                    AR^.Debitos := AR^.Debitos + ARecord^.debito;
                    AR^.Creditos := AR^.Creditos + ARecord^.credito;
                  end;
             end;
           end;
         end;
        actualizaxsauxiliar;
        digita.cerrar;
end;


procedure TfrmComprobante.BtnEliminarClick(Sender: TObject);
var
Arecord : Plist;
i:Integer;
AR:PCuentas;
begin
        if posgrid <> -1 then
        begin
           ARecord := List.Items[posgrid];
           if ARecord^.nocuenta <> 0 then begin
             for i := 0 to SCuentas.Count - 1 do begin
                 AR := SCuentas.Items[i];
                 if (AR^.Tp = ARecord^.Tp) and (AR^.Cuenta = ARecord^.nocuenta) Then
                  begin
                    AR^.Debitos := AR^.Debitos - ARecord^.debito;
                    AR^.Creditos := AR^.Creditos - ARecord^.credito;
                  end;
             end;
           end;
           List.Remove(ARecord);
           List.Pack;
           posgrid := -1;
           Actualizaxsauxiliar;
           BtnEliminar.Enabled := false;
           BtnModificargrid.Enabled := false;
        end
        else
         MessageDlg('No Seleccionó Movimiento',mterror,[mbOk],0);
end;


procedure TfrmComprobante.BtnreporteClick(Sender: TObject);
var
anulacion : string;
Tabla : String;
frmTipoImpresion:TfrmTipoImpresion;
begin
        with IBAuxiliar do begin
         if  Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
        Empleado;
        
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(NoComprobante.Caption);
         try
          Open;
          frmTipoImpresion := TfrmTipoImpresion.Create(Self);
          if frmTipoImpresion.ShowModal = mrOk then
          begin
             case frmTipoImpresion.TipoImpresion of
             0: begin
                 Report1.Variables.ByName['EMPRESA'].AsString := Empresa;
                 Report1.Variables.ByName['NIT'].AsString := Nit;
                 if Report1.PrepareReport then
                 Report1.PreviewPreparedReport(True);
                end;
             1: begin
                 prReport1.Variables.ByName['EMPRESA'].AsString := Empresa;
                 prReport1.Variables.ByName['NIT'].AsString := Nit;
                 prReport1.Variables.ByName['FechaHoy'].AsDateTime := fFechaActual;
                 if PrReport1.PrepareReport then
                 prReport1.PreviewPreparedReport(True);
                end;
             end;
          end;
         except
          MessageDlg('Error al generar el reporte',mtError,[mbcancel],0);
         end;
        end;
end;

procedure TfrmComprobante.CheckBoximpresoExit(Sender: TObject);
begin
        if checkboximpreso.Checked = true then
          vimpreso := true
        else
          vimpreso := false;
end;

procedure TfrmComprobante.Report1PrintComplete(Sender: TObject);
begin
      vimpreso := true;
      with Dmcomprobante.IBQuery2 do
       begin
         Close;
         sql.Clear;
         sql.Add('update "con$comprobante" set ');
         sql.Add('"con$comprobante"."IMPRESO" = :"IMPRESO"');
         sql.Add(' where ');
         sql.Add('"con$comprobante"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('"con$comprobante"."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('IMPRESO').AsInteger  := ord(vimpreso);
         ExecSQL;
         Transaction.Commit;
       end;
end;


procedure TfrmComprobante.EdittotaldebitoExit(Sender: TObject);
begin
        vtotal_debito:= strtocurr(edittotaldebito.Text);
end;

procedure TfrmComprobante.EdittotalcreditoExit(Sender: TObject);
begin
        vtotal_credito:= strtocurr(edittotalcredito.Text);
end;

procedure TfrmComprobante.Empleado;
begin
        with DmComprobante.IBQuery1 do
         begin
           if Transaction.InTransaction then
             Transaction.Rollback;
           Transaction.StartTransaction;

           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + '   ' + FieldByName('SEGUNDO_APELLIDO').AsString;
         end;
end;

procedure TfrmComprobante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmComprobante.Free;
end;

function TfrmComprobante.GrabarCaptacion(Cuenta: integer; ValorD,
  ValorC: Currency; EsRetiroCheque: Boolean): Boolean;
var Valor:Currency;
    I:Integer;
    Dg:Integer;
begin

              Dg := StrToInt(digitocontrol(TipoCaptacion,Format('%.7d',[Cuenta])));

              IBPagar.Close;
              IBPagar.SQL.Clear;
              IBPagar.SQL.Add('insert into "cap$extracto" values(');
              IBPagar.SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
              IBPagar.SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
              IBPagar.SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
              IBPagar.SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
              IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := Dg;
              IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDateTime := StrToDate(FechaDia.Caption);
              IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime := Time;
              if ValorD > 0 then Valor := ValorD else Valor := ValorC;
              if Valor > 0 then
              begin
               if dblcbtipo_comp.KeyValue = 1 then
               IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6
               else
               IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 14;

               if EsRetiroCheque then IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 13;


               IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := NoComprobante.Caption;
               IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := format('%.50s',[trim(editdescripcion.Text)]);
               if ValorC > 0 then begin
               IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := Valor;
               IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := 0;
               end
               else
               begin
               IBPagar.ParamByName('VALOR_DEBITO').AsCurrency := 0;
               IBPagar.ParamByName('VALOR_CREDITO').AsCurrency := Valor;
               end;

               try
                  IBPagar.ExecQuery;
                  if IBPagar.RowsAffected < 1 then
                  begin
                   MessageDlg('Error Grabando en Extracto',mtError,[mbok],0);
                   IBPagar.Transaction.RollbackRetaining;
                   Result := False;
                   Exit;
                  end
               except
                  MessageDlg('Error Grabando en Extracto',mtError,[mbok],0);
                  IBPagar.Transaction.RollbackRetaining;
                  Result := False;
                  Exit;
               end; // del try

              IBPagar.ParamByName('ID_AGENCIA').AsInteger := Agencia;
              IBPagar.ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
              IBPagar.ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
              IBPagar.ParamByName('DIGITO_CUENTA').AsInteger := Dg;
              IBPagar.ParamByName('FECHA_MOVIMIENTO').AsDateTime := StrToDate(FechaDia.Caption);
              IBPagar.ParamByName('HORA_MOVIMIENTO').AsTime := Time;

              IBPagar.Close;
             end;

end;

function TfrmComprobante.EvaluarCodigo(Codigo: string): string;
begin
    with Dmcomprobante.IBQuery1 do
    begin
     sql.Clear;
     Sql.Add('select "NOMBRE", "MOVIMIENTO", "INFORME",');
     Sql.Add('"ESCAPTACION", "ESCOLOCACION" from "con$puc"');
     Sql.Add('where "con$puc"."ID_AGENCIA" =:"ID_AGENCIA" and');
     Sql.Add('"con$puc"."CODIGO" =:"CODIGO"');
     parambyname('ID_AGENCIA').AsInteger := Agencia;
     parambyname('CODIGO').AsString := codigo;
     Open;
     if DmComprobante.IBQuery1.RecordCount > 0 then
     begin
      captacion := IntToBoolean(FieldByName('ESCAPTACION').AsInteger);
      colocacion := InttoBoolean(FieldByName('ESCOLOCACION').AsInteger);
        if captacion then
         begin
           With Dmcomprobante.IBQuery2 do
            begin
              Sql.Clear;
              Sql.Add('Select');
              Sql.Add('"cap$tipocaptacion".ID_TIPO_CAPTACION,');
              Sql.Add('"cap$tipocaptacion".DESCRIPCION,');
              SQL.Add('"cap$tipocaptacion".SALDO_MINIMO');
              Sql.Add('from "cap$tipocaptacion"');
              Sql.Add('where "cap$tipocaptacion".CODIGO_CONTABLE =:"CODIGO_CONTABLE"');
              ParamByName('CODIGO_CONTABLE').AsString := Codigo;
              Open;
              TipoCaptacion := FieldByName('ID_TIPO_CAPTACION').AsInteger;
              SaldoMinimo := FieldByName('SALDO_MINIMO').AsCurrency;
              Close;
            end;
            Close;
         end;
        if colocacion then
         begin
           MessageDlg('No se aplicaran cambios a la colocación',mtInformation,[mbok],0);
         end;
      end
     else
      begin
        MessageDlg('La cuenta no Existe',mtError,[mbOk],0);
        Close;
      end;
    end;
end;


procedure TfrmComprobante.BuscarComp(Id, Ag: Integer);
begin
          with dmcomprobante.IBQuery1 do
          begin
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           DmComprobante.IBQsetagencia.Open;
           dmcomprobante.IBQsettipocomp.Open;
           dmcomprobante.IBQsetauxiliar.Open;
           SQL.Clear;
           SQL.Add('select "con$comprobante".ESTADO, "con$auxiliar".ESTADOAUX from "con$comprobante"');
           SQL.Add('LEFT JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE and "con$comprobante".ID_AGENCIA = "con$auxiliar".ID_AGENCIA)');
           SQL.Add(' where "con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE" AND "con$comprobante".ID_AGENCIA = :"ID_AGENCIA"');
           paramByName('ID_COMPROBANTE').AsInteger:= Id;
           ParamByName('ID_AGENCIA').AsInteger:= Ag;
           Active := True;
           estadoc:= fieldbyname('ESTADO').AsString;
           estadoa:= FieldByName('ESTADOAUX').AsString;
           if dmcomprobante.IBQuery1.RecordCount > 0 then
             begin
              buscarcomprobante(id_comprobante,id_agencia);
//              vmodificar:= true;
              if (estadoc= 'N') or (estadoc = 'C') or (estadoa= 'C') or (estadoa= 'N')  then
                 begin
                 MessageDlg('No se puede Modificar, El Comprobante está Cerrado o Anulado',mtError,[mbOk],0);
                 BtnGrabar.Enabled := false;
                 BtnAnular.Enabled := false;
                 BtnRefrescar.Enabled := false;
                 BtnAgregar.Enabled := false;
                 BtnCerrar.Enabled := True;
                 PanelXS.Enabled := False;
                 bloquear;
                 xsauxiliar.Enabled := True;
                 end;
             end
           else
             begin
              MessageDlg('El comprobante no existe',mtError,[mbOk],0);
              dblcbtipo_comp.SetFocus;
             end;
          end;

end;

procedure TfrmComprobante.Inicializar;
begin
        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.Rollback;
        DmGeneral.IBTransaction1.StartTransaction;

        DmComprobante.IBQsetagencia.Open;
        dmcomprobante.IBQsettipocomp.Open;
        dmcomprobante.IBQsetauxiliar.Open;
        xsauxiliar.ColWidths [0] := 112;
        xsauxiliar.ColWidths [1] := 180;
        xsauxiliar.ColWidths [2] := 70;
        xsauxiliar.ColWidths [3] := 100;
        xsauxiliar.ColWidths [4] := 100;
        XSauxiliar.ColWidths [5] := 30;
        xsauxiliar.Cols[0].Text  := 'Código';
        xsauxiliar.Cols[1].Text  := 'Nombre Cuenta';
        xsauxiliar.Cols[2].Text  := 'No.Cuenta/Crédito';
        xsauxiliar.Cols[3].Text  := 'Débitos';
        xsauxiliar.Cols[4].Text  := 'Créditos';
        XSauxiliar.Cols[5].Text  := 'GMF';
        try
          List := Tlist.Create;
          SCuentas := TList.Create;
        finally
          List.Clear;
          SCuentas.Clear;
        end;
        fechadia.Caption := DateToStr(Date);
        vfechadia := Date;
        vfechadiamod := Date;
        editdescripcion.Text := '';
        edittotaldebito.Text:= '';
        edittotalcredito.Text:='';
        editanulacion.Text:='';
        posgrid := -1;
        BtnModificargrid.Enabled := false;
        BtnEliminar.Enabled := false;
        xsauxiliar.Enabled := True;
        DblcbAgencia.KeyValue := Agencia;
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
        vGMF := False;
        desbloquear;
        edittotaldebito.Color := clMoneyGreen;
        edittotalcredito.Color := clMoneyGreen;
        label8.Visible := false;
        editanulacion.Visible := false;
        BtnGrabar.Enabled := true;
        BtnGrabar.Caption := '&Grabar';
        BtnAnular.Enabled := true;
        BtnRefrescar.Enabled := true;
        Btncerrar.Enabled := true;
        BtnAgregar.Enabled := True;
        xsauxiliar.Enabled := True;
        PanelXS.Enabled := True;
        dblcbtipo_comp.SetFocus;
end;

procedure TfrmComprobante.FormShow(Sender: TObject);
begin
       Inicializar;
end;

procedure TfrmComprobante.Report1InitDetailBandDataSet(Sender: TObject;
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


procedure TfrmComprobante.prReport1InitDetailBandDataSet(Sender: TObject;
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

procedure TfrmComprobante.prReport1PrintComplete(Sender: TObject);
begin
      vimpreso := true;
      with Dmcomprobante.IBQuery2 do
       begin
         Close;
         sql.Clear;
         sql.Add('update "con$comprobante" set ');
         sql.Add('"con$comprobante"."IMPRESO" = :"IMPRESO"');
         sql.Add(' where ');
         sql.Add('"con$comprobante"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('"con$comprobante"."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('IMPRESO').AsInteger  := ord(vimpreso);
         ExecSQL;
         Transaction.Commit;
       end;

end;

end.
