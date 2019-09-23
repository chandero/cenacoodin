unit Unit_ComprobanteS;

interface

uses
  Windows, Messages, SysUtils, DateUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB,
  IBCustomDataSet, IBQuery, XStringGrid, Mask, CEForm, pr_Common, pr_Parser, pr_TxClasses,
  IBSQL;

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
    nocuenta : integer;
    nocredito: string;
    tipoide  : integer;
    idpersona: string;
    monto    : currency;
    tasa     : single;
    estado   : string;
  end;
type
  TfrmComprobanteS = class(TForm)
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
    BtnAgregar: TBitBtn;
    Label8: TLabel;
    editanulacion: TMemo;
    BtnModificarGrid: TBitBtn;
    BtnEliminar: TBitBtn;
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
    Report1: TprTxReport;

    procedure BtnGrabarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buscarcomprobante(ID_COMPROBANTE : integer; ID_AGENCIA : integer);
    procedure bloquear;
    procedure desbloquear;
    procedure BtncerrarClick(Sender: TObject);
    procedure BtnAgregarClick(Sender: TObject);
    procedure actualizaxsauxiliar;
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
    procedure FormShow(Sender: TObject);
    procedure BtnModificarGridClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnreporteClick(Sender: TObject);
    procedure CheckBoximpresoExit(Sender: TObject);
    procedure Report1PrintComplete(Sender: TObject);
    procedure EdittotaldebitoExit(Sender: TObject);
    procedure EdittotalcreditoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    function gettipo_comp : integer;
    procedure settipo_comp (nvalor:integer);
    function getagencia : integer;
    procedure setagencia (nvalor:integer);
    function getimpreso : boolean;
    procedure setimpreso (nvalor:boolean);
    function getdescripcion:string;
    procedure setdescripcion (nvalor:string);
    function grabar : Boolean;
    function actualizar : Boolean;
    Procedure Empleado;
    function GrabarCaptacion(Cuenta: integer; ValorD,
      ValorC: Currency): Boolean;
    function EvaluarCodigo(Codigo: string): string;

  public
    property tipo_comp : integer read gettipo_comp write settipo_comp;
    property agencia : integer read getagencia write setagencia;
    property impreso : boolean read getimpreso write setimpreso;
    property descripcion : string read getdescripcion write setdescripcion;

  end;


var
  frmComprobanteS: TfrmComprobanteS;
  vid_comprobante       :string;
  vfechadia             :TDate;
  vtipo_comprobante     :integer;
  vagencia              :integer;
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

implementation

uses UnitdmGeneral, digitacuenta, UnitVistaPreliminar,
Unit_buscarcomprobante,unit_Dmpuc, UnitGlobales, Unit_DmComprobante;


{$R *.dfm}

var DmComprobante :TDmComprobante;

function TfrmComprobanteS.gettipo_comp : integer;
begin
        result:= vtipo_comprobante;
end;

procedure TfrmComprobanteS.settipo_comp(nvalor:integer);
begin
        vtipo_comprobante := nValor;
        dblcbtipo_comp.KeyValue := vtipo_comprobante;
end;

function TfrmComprobanteS.getagencia :integer;
begin
        result:= vagencia;
end;

procedure TfrmComprobanteS.setagencia(nvalor:integer);
begin
        vagencia:= nvalor;
        DblcbAgencia.KeyValue := vagencia;
end;

function TfrmComprobanteS.getdescripcion : string;
begin
        result:= vdescripcion;
end;

procedure TfrmComprobanteS.setdescripcion (nvalor:string);
begin
        vdescripcion:= nvalor;
        editdescripcion.Text:= vdescripcion;

end;


function TfrmComprobanteS.getimpreso : boolean;
begin
        result:= vimpreso;
end;

procedure TfrmComprobanteS.setimpreso (nvalor:boolean);
begin
        vimpreso:= nvalor;
        checkboximpreso.Checked := vimpreso;
end;

procedure TfrmComprobanteS.FormCreate(Sender: TObject);
begin
        DmComprobante := TDmComprobante.Create(self);
end;

function TfrmComprobanteS.grabar : Boolean;
var
Arecord : Plist;
I:integer;
begin
      with dmcomprobante.IBQuery1 do
        try
         SQL.Clear;
         SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 1');
         Active := True;
         Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
         Active := False;
         Consecutivo := Consecutivo + 1;
         SQL.Clear;
         SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
         SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 1');
         ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
         ExecSQL;
         Consec := FormatCurr('0000000',Consecutivo);
         Nocomprobante.Caption := consec;
         vid_comprobante:= consec;

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
         ParamByname('FECHADIA').AsDate := vfechadia;
         ParamByName('ID_AGENCIA').AsInteger := vagencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := vtipo_comprobante;
         ParamByName('DESCRIPCION').AsString := vdescripcion;
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
            ParamByName('ID_AGENCIA').AsInteger:= vagencia;
            ParamByName('FECHA').AsDate := vfechadia;
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
            if captacion then GrabarCaptacion(Arecord^.nocuenta,Arecord^.debito,Arecord^.credito);
         end;
         Transaction.CommitRetaining;
         Result := true;
       except
         Transaction.RollbackRetaining;
         Result := false;
       end;
end;

function TfrmComprobanteS.actualizar: Boolean;
var
Arecord : Plist;
I:integer;
begin
      with Dmcomprobante.IBQuery2 do
       try
         sql.Clear;
         sql.Add('update "con$comprobante" set ');
         sql.Add('"con$comprobante"."ID_COMPROBANTE" =:"ID_COMPROBANTE",');
         sql.Add('"con$comprobante"."ID_AGENCIA" =:"ID_AGENCIA",');
         sql.Add('"con$comprobante"."TIPO_COMPROBANTE" =:"TIPO_COMPROBANTE",');
         sql.Add('"con$comprobante"."FECHADIA" =:"FECHADIA",');
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
         ParamByName('ID_AGENCIA').AsInteger := vagencia;
         ParamByName('TIPO_COMPROBANTE').AsInteger := vtipo_comprobante;
         ParamByname('FECHADIA').AsDate:= vfechadia;
         ParamByName('DESCRIPCION').AsString := vdescripcion;
         ParamByName('TOTAL_DEBITO').AsCurrency  := vtotal_debito;
         ParamByName('TOTAL_CREDITO').AsCurrency  := vtotal_credito;
         ParamByName('ESTADO').AsString  := 'O';
         ParamByName('IMPRESO').AsInteger  := Ord(False);
         ParamByName('ANULACION').AsString := anulacion;
         parambyname('ID_EMPLEADO').AsString := DBAlias;
         ExecSQL;

         SQL.Clear;
         SQL.Add('delete from "con$auxiliar" where ');
         SQL.Add('"con$auxiliar"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         SQL.Add('"con$auxiliar"."ID_AGENCIA" = :"ID_AGENCIA"');
         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByName('ID_AGENCIA').AsInteger := vagencia;
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
            ParamByName('ID_AGENCIA').AsInteger:= vagencia;
            ParamByName('FECHA').AsDate := vfechadia;
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
         end;
         Transaction.CommitRetaining;
         Result := true;
         vmodificar:= false;
       except
         Transaction.RollbackRetaining;
         Result := false;
       end;
end;


procedure TfrmComprobanteS.BtnGrabarClick(Sender: TObject);
begin
  If DmGeneral.IBTransaction1.InTransaction then
     DmGeneral.IBTransaction1.CommitRetaining;
  if vModificar then
     begin
      if tipo_comp <1 then
       if messagedlg('No ha digitado el tipo de comprobante',mtError,[mbOk],0) = mrok then
        begin
         dblcbtipo_comp.SetFocus;
         exit;
        end;
      if agencia <1 then
       if messagedlg('No ha digitado la agencia',mtError,[mbOk],0) = mrok then
        begin
         dblcbagencia.SetFocus;
         exit;
        end;
      if descripcion ='' then
       if messagedlg('No ha digitado la descripción',mtError,[mbOk],0) = mrok then
        begin
         editdescripcion.SetFocus;
         exit;
        end;
      if List.Count = 0 then
       begin
       if messagedlg('No ha digitado ningún movimiento',mtError,[mbOk],0) = mrok then
         exit;
       end;
      if edittotaldebito.Text <> edittotalcredito.Text then
       begin
       if messagedlg('El comprobante No está cuadrado',mtError,[mbOk],0)= mrok then
         exit;
       end;
      if Actualizar then
          begin
           MessageDlg('El Comprobante se Actualizó',mtInformation,[mbOK],0);
           vmodificar := false;
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
       if messagedlg('No ha digitado el tipo de comprobante',mtError,[mbOk],0) = mrok then
        begin
         dblcbtipo_comp.SetFocus;
         exit;
        end;
      if agencia <1 then
       if messagedlg('No ha digitado la agencia',mtError,[mbOk],0) = mrok then
        begin
         dblcbagencia.SetFocus;
         exit;
        end;
      if descripcion ='' then
       if messagedlg('No ha digitado la descripción',mtError,[mbOk],0) = mrok then
        begin
         editdescripcion.SetFocus;
         exit;
        end;
      if List.Count = 0 then
       begin
       if messagedlg('No ha digitado ningún movimiento',mtError,[mbOk],0) = mrok then
         exit;
       end;
      if edittotaldebito.Text <> edittotalcredito.Text then
       begin
       if messagedlg('El comprobante No está cuadrado',mtError,[mbOk],0)= mrok then
         exit;
       end;
     if Grabar then
       begin
       MessageDlg('El Comprobante fue Grabado',mtInformation,[mbOK],0);
       Btngrabar.Caption := '&Modificar';
       BtnReporteClick(Sender);
       end
     else
       MessageDlg('Comprobante No Grabado',mtError,[mbOK],0);
   end;
end;


procedure TfrmComprobanteS.BtncerrarClick(Sender: TObject);
begin
        self.Close;
end;

procedure TfrmComprobanteS.actualizaxsauxiliar;
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
        xsauxiliar.ColWidths[1] := 120;
        xsauxiliar.Cells [1,i+1] := arecord^.nomcuenta;
        xsauxiliar.ColWidths[3] := 100;
        xsauxiliar.Cells [3,i+1] := formatcurr ('#,##0.00',Arecord^.debito);
        vtotal_debito := vtotal_debito + ARecord^.debito;
        xsauxiliar.ColWidths[4] := 100;
        xsauxiliar.Cells [4,i+1] := formatcurr ('#,##0.00',Arecord^.credito);
        vtotal_credito := vtotal_credito + Arecord^.credito;
        edittotaldebito.Text := currtostr(vtotal_debito);
        edittotalcredito.Text := currtostr(vtotal_credito);
        if arecord^.nocuenta <> 0 then
        xsauxiliar.Cells [2,i+1] := IntToStr(arecord^.nocuenta);
        if arecord^.nocredito <>'' then
        xsauxiliar.Cells [2,i+1] := trim(arecord^.nocredito);
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
    end;
end;

procedure TfrmComprobanteS.dblcbtipo_compEnter(Sender: TObject);
begin
        dblcbtipo_comp.KeyValue := 1;
end;

procedure TfrmComprobanteS.dblcbtipo_compExit(Sender: TObject);
begin
        if dblcbtipo_comp.KeyValue = 0 then
           dblcbtipo_comp.KeyValue := 1;
        tipo_comp := dblcbtipo_comp.KeyValue;
end;

procedure TfrmComprobanteS.DblcbAgenciaEnter(Sender: TObject);
begin
        dblcbagencia.KeyValue := Agencia;
end;

procedure TfrmComprobanteS.DblcbAgenciaExit(Sender: TObject);
begin
        if dblcbagencia.KeyValue = 0 then
           dblcbagencia.KeyValue := 1;
        agencia:= dblcbagencia.KeyValue;
end;


procedure TfrmComprobanteS.CheckBoximpresoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if key = 13 then
        btnAgregar.SetFocus;
end;


procedure TfrmComprobanteS.BtnlimpiarClick(Sender: TObject);
begin
        xsauxiliar.ColWidths [0] := 100;
        xsauxiliar.ColWidths [1] := 120;
        xsauxiliar.ColWidths [2] := 70;
        xsauxiliar.ColWidths [3] := 80;
        xsauxiliar.ColWidths [4] := 80;
        xsauxiliar.Cols[0].Text  := 'Código';
        xsauxiliar.Cols[1].Text  := 'Nombre Cuenta';
        xsauxiliar.Cols[2].Text  := 'No.Cuenta';
        xsauxiliar.Cols[3].Text  := 'Débitos';
        xsauxiliar.Cols[4].Text  := 'Créditos';
        Nocomprobante.Caption:= '';
        fechadia.Caption := datetostr(date);
        dblcbtipo_comp.SetFocus;
        dblcbagencia.KeyValue:= 0;
        editdescripcion.Text:= '';
        edittotaldebito.Text:='';
        edittotalcredito.Text:='';
        editanulacion.Text:= '';
        checkboxcerrado.Checked:= false;
        checkboxanulado.Checked:= false;
        checkboximpreso.Checked:= false;
        list.Clear;
        List:= Tlist.Create;
        id_comprobante:= 0;
        id_agencia:= 0;
        vid_comprobante:= '';
        vtipo_comprobante := 0;
        vagencia:= 0;
        vdescripcion:= '';
        anulacion:= '';
        vtotal_debito:= 0;
        vtotal_credito:= 0;
        vestadoc:= '';
        estadoc := '';
        vestadoa:= '';
        estadoa := '';
        vmodificar := false;
        desbloquear;
        edittotaldebito.Color := clMoneyGreen;
        edittotalcredito.Color := clMoneyGreen;
        label8.Visible := false;
        editanulacion.Visible := false;
        BtnGrabar.Enabled := true;
        BtnGrabar.Caption := 'Grabar';
        BtnAnular.Enabled := true;
        BtnRefrescar.Enabled := true;
        Btncerrar.Enabled := true;
        BtnAgregar.Enabled := True;
        xsauxiliar.Enabled := True;
end;

procedure TfrmComprobanteS.editdescripcionExit(Sender: TObject);
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

procedure TfrmComprobanteS.BtnBuscarClick(Sender: TObject);
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
          with dmcomprobante.IBQuery1 do
          begin
           SQL.Clear;
           SQL.Add('select "con$comprobante".ESTADO, "con$auxiliar".ESTADOAUX from "con$comprobante", "con$auxiliar"');
           SQL.Add(' where ("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE" AND "con$comprobante".ID_AGENCIA = :"ID_AGENCIA") AND ("con$auxiliar".ID_COMPROBANTE = :"ID_COMPROBANTE" AND "con$auxiliar".ID_AGENCIA = :"ID_AGENCIA")');
           paramByName('ID_COMPROBANTE').AsInteger:= id_comprobante;
           ParamByName('ID_AGENCIA').AsInteger:= id_agencia;
           Active := True;
           estadoc:= fieldbyname('ESTADO').AsString;
           estadoa:= FieldByName('ESTADOAUX').AsString;
           if (estadoc <> '') and (estadoa <> '') then
             begin
              buscarcomprobante(id_comprobante,id_agencia);
              vmodificar:= true;
              if (estadoc= 'N') or (estadoc = 'C') or (estadoa= 'C') or (estadoa= 'N')  then
                 begin
                 MessageDlg('No se puede Modificar, El Comprobante está Cerrado o Anulado',mtError,[mbOk],0);
                 BtnGrabar.Enabled := false;
                 BtnAnular.Enabled := false;
                 BtnRefrescar.Enabled := false;
                 BtnCerrar.Enabled := false;
                 BtnAgregar.Enabled := false;
                 bloquear;
                 xsauxiliar.Enabled := False;
                 end;
             end
           else
             begin
              MessageDlg('El comprobante no existe',mtError,[mbOk],0);
              dblcbtipo_comp.SetFocus;
             end;
          end;
        end;
end;


procedure TfrmComprobanteS.btnrefrescarClick(Sender: TObject);
begin
     dmcomprobante.Dsetcomprobante.Close;
     dmcomprobante.Dsetcomprobante.Open;
     dmcomprobante.Dsetauxiliar.close;
     dmcomprobante.Dsetauxiliar.Open;
end;

procedure TfrmComprobanteS.BtnAnularClick(Sender: TObject);
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

procedure TfrmComprobanteS.bloquear;
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

procedure TfrmComprobanteS.desbloquear;
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

procedure TfrmComprobanteS.buscarcomprobante(ID_COMPROBANTE: integer; ID_AGENCIA:integer);
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
                vagencia:= fieldbyname('ID_AGENCIA').AsInteger;
                if DmComprobante.IBQuery1.RecordCount > 0 then
                begin
                   Nocomprobante.Caption:= vid_comprobante;
                   vfechadia := fieldbyname('FECHADIA').AsDateTime;
                   fechadia.Caption := datetostr(vfechadia);
                   vtipo_comprobante := strtoint(trim(fieldbyname('TIPO_COMPROBANTE').AsString));
                   dblcbtipo_comp.KeyValue:= vtipo_comprobante;
                   dblcbagencia.KeyValue:= vagencia;
                   vdescripcion := fieldbyname('DESCRIPCION').AsString;
                   editdescripcion.Text:= vdescripcion;
                   vtotal_debito := fieldbyname('TOTAL_DEBITO').AsCurrency;
                   edittotaldebito.Text:= formatcurr('#,##0.00',vtotal_debito);
                   vtotal_credito := fieldbyname('TOTAL_CREDITO').AsCurrency;
                   edittotalcredito.Text:= formatcurr('#,##0.00',vtotal_credito);
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

        with Dmcomprobante.IBQuery2 do
          begin
                SQL.Clear;
                SQL.Add('select * from "con$auxiliar" where "con$auxiliar"."ID_COMPROBANTE" =:"ID_COMPROBANTE"');
                SQL.Add('and "con$auxiliar"."ID_AGENCIA" =:"ID_AGENCIA"');
                paramByName('ID_COMPROBANTE').AsInteger:= ID_COMPROBANTE;
                ParamByName('ID_AGENCIA').AsInteger:= ID_AGENCIA;
                Active := True;
                auxiliar:= fieldbyname('ID_COMPROBANTE').AsInteger;
                agencia:= fieldbyname('ID_AGENCIA').AsInteger;
                if (auxiliar <> 0) and (agencia <> 0) then
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
                    Arecord^.nocuenta:= fieldbyname('ID_CUENTA').AsInteger;
                    Arecord^.nocredito:= trim(fieldbyname('ID_COLOCACION').AsString);
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



procedure TfrmComprobanteS.CheckBoxcerradoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,self);
end;

procedure TfrmComprobanteS.CheckBoxanuladoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(key,self);
end;

procedure TfrmComprobanteS.XSauxiliarSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
        posgrid := ARow-1;
        CanSelect := true;
        BtnModificargrid.Enabled := true;
        BtnEliminar.Enabled := true;
end;

procedure TfrmComprobanteS.editanulacionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if key = 13 then
        dblcbtipo_comp.SetFocus;
end;

procedure TfrmComprobanteS.editanulacionExit(Sender: TObject);
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
    parambyname('ID_AGENCIA').AsInteger := agencia;
    parambyname('ANULACION').AsString := anulacion;
    parambyname('ESTADO').AsString := vestadoc;
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
      ParamByName('ESTADOAUX').AsString := vestadoa;
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


procedure TfrmComprobanteS.editanulacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
        BtnBuscar.SetFocus;
end;

procedure TfrmComprobanteS.dblcbtipo_compKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmComprobanteS.DblcbAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmComprobanteS.editdescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
       if key = #13 then
       btnAgregar.SetFocus;
end;

procedure TfrmComprobanteS.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
        dmcomprobante.Dsetagencia.Active  := true;
        dmcomprobante.Dsettipocomp.Active  := true;
        dmcomprobante.Dsetauxiliar.Active := true;
        xsauxiliar.ColWidths [0] := 112;
        xsauxiliar.ColWidths [1] := 120;
        xsauxiliar.ColWidths [2] := 70;
        xsauxiliar.ColWidths [3] := 100;
        xsauxiliar.ColWidths [4] := 100;
        xsauxiliar.Cols[0].Text  := 'Código';
        xsauxiliar.Cols[1].Text  := 'Nombre Cuenta';
        xsauxiliar.Cols[2].Text  := 'No.Cuenta/Crédito';
        xsauxiliar.Cols[3].Text  := 'Débitos';
        xsauxiliar.Cols[4].Text  := 'Créditos';
        List := Tlist.Create;
        fechadia.Caption := datetostr(date);
        vfechadia:= strtoDate(fechadia.Caption);
        editdescripcion.Text := '';
        edittotaldebito.Text:= '';
        edittotalcredito.Text:='';
        editanulacion.Text:='';
        posgrid := -1;
        BtnModificargrid.Enabled := false;
        BtnEliminar.Enabled := false;
        xsauxiliar.Enabled := True;

end;

procedure TfrmComprobanteS.BtnModificarGridClick(Sender: TObject);
var
digita : Tdigita;
Arecord: Plist;
begin
        digita:= Tdigita.Create(self);
        ARecord := List.Items[posgrid];
        digita.codigo:= arecord^.codigo;
        digita.Label5.Caption := Arecord^.nomcuenta;
        digita.debito := Arecord^.debito;
        digita.credito := Arecord^.credito;
        digita.tipoide:= Arecord^.tipoide;
        digita.nocuenta := Arecord^.nocuenta;
        digita.nocredito := Arecord^.nocredito;
        digita.idpersona := Arecord^.idpersona;
        digita.monto := Arecord^.monto;
        digita.tasa := Arecord^.tasa;
        digita.estado := Arecord^.estado;
        if digita.ShowModal = mrok then
           if posgrid <> -1 then
             begin
              ARecord:= list.Items[posgrid];
              ARecord^.codigo := digita.codigo;
              ARecord^.nomcuenta := digita.nomcuenta;
              ARecord^.debito := digita.debito;
              ARecord^.credito:= digita.credito;
              ARecord^.nocuenta:= digita.nocuenta;
              ARecord^.nocredito:= digita.nocredito;
              ARecord^.tipoide := digita.tipoide;
              ARecord^.idpersona:= digita.idpersona;
              ARecord^.monto := digita.monto;
              ARecord^.tasa := digita.tasa;
              ARecord^.estado := digita.estado;
              list.Items[posgrid]:= Arecord;
              posgrid:= -1;
             end;
             actualizaxsauxiliar;
             digita.Free;
             BtnModificargrid.Enabled := false;
             Btneliminar.Enabled := false;
end;

procedure TfrmComprobanteS.BtnAgregarClick(Sender: TObject);
var digita : Tdigita;
ARecord: PList;
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
        if digita.ShowModal = mrOk  then
         begin
           New(ARecord);
           ARecord^.codigo := digita.codigo;
           ARecord^.nomcuenta := digita.nomcuenta;
           ARecord^.debito := digita.debito;
           ARecord^.credito:= digita.credito;
           ARecord^.nocuenta:= digita.nocuenta;
           ARecord^.nocredito:= digita.nocredito;
           ARecord^.tipoide := digita.tipoide;
           ARecord^.idpersona:= digita.idpersona;
           ARecord^.monto := digita.monto;
           ARecord^.tasa := digita.tasa;
           Arecord^.estado := digita.estado;
           List.Add(ARecord);
         end;
        actualizaxsauxiliar;
        digita.cerrar;
end;


procedure TfrmComprobanteS.BtnEliminarClick(Sender: TObject);
var
Arecord : Plist;
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
        end
        else
         MessageDlg('No Seleccionó Movimiento',mterror,[mbOk],0);
end;


procedure TfrmComprobanteS.BtnreporteClick(Sender: TObject);
var
anulacion : string;
Tabla : String;
begin
        Empleado;
        with IBAuxiliar do begin
         if not Transaction.InTransaction then
            Transaction.StartTransaction;

         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := StrToInt(NoComprobante.Caption);
         try
          Open;
          if RecordCount > 0 then begin
          Report1.Variables.ByName['EMPRESA'].AsString := Empresa;
          Report1.Variables.ByName['NIT'].AsString := Nit;
          if Report1.PrepareReport then
             Report1.PreviewPreparedReport(True);
          end;
         except
          MessageDlg('Error al generar el reporte',mtError,[mbcancel],0);
         end;
        end;
end;

procedure TfrmComprobanteS.CheckBoximpresoExit(Sender: TObject);
begin
        if checkboximpreso.Checked = true then
          vimpreso := true
        else
          vimpreso := false;
end;

procedure TfrmComprobanteS.Report1PrintComplete(Sender: TObject);
begin
      vimpreso := true;
      with Dmcomprobante.IBQuery2 do
       begin
         sql.Clear;
         sql.Add('update "con$comprobante" set ');
         sql.Add('"con$comprobante"."IMPRESO" = :"IMPRESO"');
         sql.Add(' where ');
         sql.Add('"con$comprobante"."ID_COMPROBANTE" = :"ID_COMPROBANTE" and');
         sql.Add('"con$comprobante"."ID_AGENCIA" = :"ID_AGENCIA"');

         ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
         ParamByName('ID_AGENCIA').AsInteger := vagencia;
         ParamByName('IMPRESO').AsInteger  := ord(vimpreso);
         ExecSQL;
       end;
end;


procedure TfrmComprobanteS.EdittotaldebitoExit(Sender: TObject);
begin
        vtotal_debito:= strtocurr(edittotaldebito.Text);
end;

procedure TfrmComprobanteS.EdittotalcreditoExit(Sender: TObject);
begin
        vtotal_credito:= strtocurr(edittotalcredito.Text);
end;

procedure TfrmComprobanteS.Empleado;
begin
        with DmComprobante.IBQuery1 do
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

procedure TfrmComprobanteS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmComprobante.Free;
end;

function TfrmComprobanteS.GrabarCaptacion(Cuenta: integer; ValorD,
  ValorC: Currency): Boolean;
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
               IBPagar.ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
               IBPagar.ParamByName('DOCUMENTO_MOVIMIENTO').AsString := NoComprobante.Caption;
               IBPagar.ParamByName('DESCRIPCION_MOVIMIENTO').AsString := editdescripcion.Text;
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
                   MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
                   IBPagar.Transaction.RollbackRetaining;
                   Result := False;
                   Exit;
                  end
               except
                  MessageDlg('Error Grabando Consignación',mtError,[mbok],0);
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

function TfrmComprobanteS.EvaluarCodigo(Codigo: string): string;
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

end.
