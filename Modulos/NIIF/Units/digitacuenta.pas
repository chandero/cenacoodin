unit digitacuenta;

interface

uses
  Windows, Messages, SysUtils, DateUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, IBCustomDataSet, IBQuery, Math,
  Buttons, DBCtrls,
  ExtCtrls, IBSQL, JvEdit,
  JvTypedEdit, IBDatabase;

type PCuentas = ^ACuentas;
     ACuentas = record
        Tp:Integer;
        Cuenta:Integer;
        Debitos:Currency;
        Creditos:Currency;
        EsRetiroCheque:Boolean;
end;

type
  Tdigita = class (TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    editcodigo: TMaskEdit;
    Label5: TLabel;
    Label3: TLabel;
    Editnocuenta: TEdit;
    Label6: TLabel;
    nomcta: TLabel;
    Panel2: TPanel;
    BtnAgregar: TBitBtn;
    Btncerrar: TBitBtn;
    Label7: TLabel;
    Editnocredito: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    EdAgencia: TDBLookupComboBox;
    GrupoInforme: TGroupBox;
    Label11: TLabel;
    Edtipoid: TDBLookupComboBox;
    Label13: TLabel;
    EdMonto: TMemo;
    Label12: TLabel;
    EdNit: TMemo;
    Label14: TLabel;
    EdTasa: TMemo;
    Label10: TLabel;
    LblDisponible: TLabel;
    EdDisponible: TStaticText;
    IBSQL1: TIBSQL;
    LblCanje: TLabel;
    EdCanje: TStaticText;
    LblSaldo: TLabel;
    EdSaldo: TStaticText;
    EdDebito: TJvCurrencyEdit;
    EdCredito: TJvCurrencyEdit;
    CmdPUC: TSpeedButton;
    IBQTiposIdentificacion: TIBQuery;
    DSTiposIdentificacion: TDataSource;
    IBSQL2: TIBSQL;
    IBTDigita: TIBTransaction;
    pnlRetiroCheque: TPanel;
    chkRetiroCheque: TCheckBox;
    function EvaluarCodigo(codigo : string) : string;
    function Evaluarcaptacion(nocuenta : integer) : String;
    function Evaluarcolocacion(nocredito:string) : string;
    function Evaluarpersona(tipoid: integer;id_persona: string): string;
    function Evaluarinforme(id:string):string;
    procedure EditnocuentaExit(Sender: TObject);
    procedure BtncerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditnocreditoExit(Sender: TObject);
    procedure EditnocuentaKeyPress(Sender: TObject; var Key: Char);
    procedure editcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EditnocreditoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtipoidEnter(Sender: TObject);
    procedure EdtipoidExit(Sender: TObject);
    procedure EdNitKeyPress(Sender: TObject; var Key: Char);
    procedure EdMontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdTasaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtipoidKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditnocreditoEnter(Sender: TObject);
    procedure EditnocuentaEnter(Sender: TObject);
    procedure EdNitEnter(Sender: TObject);
    procedure EdMontoEnter(Sender: TObject);
    procedure EdTasaEnter(Sender: TObject);
    procedure editcodigoEnter(Sender: TObject);
    procedure BtnAgregarClick(Sender: TObject);
    procedure editcodigoExit(Sender: TObject);
    procedure EdAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdAgenciaEnter(Sender: TObject);
    procedure EdDebitoEnter(Sender: TObject);
    procedure EdDebitoExit(Sender: TObject);
    procedure EdCreditoEnter(Sender: TObject);
    procedure EdCreditoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdDebitoChange(Sender: TObject);
    procedure CmdPUCClick(Sender: TObject);
    procedure EdNitExit(Sender: TObject);
    procedure EdMontoExit(Sender: TObject);
    procedure EdTasaExit(Sender: TObject);
    procedure chkRetiroChequeExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnAgregarEnter(Sender: TObject);
  private
    FCuentas:TList;
    banco:Boolean;
    _bRetiroCheque:Boolean;
    _bEsAjuste:Boolean;
    function Getdebito : currency;
    procedure Setdebito (nvalor:currency);
    function Getcredito : currency;
    procedure Setcredito (nvalor:currency);
    function getnocuenta : integer;
    procedure setnocuenta (nvalor:integer);
    function getcodigo : string;
    procedure setcodigo (nvalor:string);
    function getestado :string;
    procedure setestado (nvalor:string);
    function getnomcuenta : string;
    procedure setnomcuenta (nvalor:string);
    function getnocredito:string;
    procedure setnocredito(nvalor:string);
    function getidpersona:string;
    procedure setidpersona(nvalor:string);
    function gettipoide :integer;
    procedure settipoide (nvalor:integer);
    function getmonto : currency;
    procedure setmonto (nvalor:currency);
    function gettasa : single;
    procedure settasa (nvalor:single);
    function evaluardisponible(Ag:Integer;Tp:Integer; Cta:Integer; Dg:Integer): Currency;
    function getTp: integer;
    procedure SetTp(nvalor: integer);
    procedure SetGMF(nValor: Boolean);
    function GetGMF: Boolean;
    function ValidarGMF(codigo: string): boolean;
    function PreguntarGMF: Boolean;
    function ValidaMontoTasa: Boolean;
    { Private declarations }
  public
   property codigo: string read getcodigo write setcodigo;
   property debito : currency read getdebito write setdebito;
   property credito : currency read getcredito write setcredito;
   property Tp: Integer read getTp Write SetTp;
   property nomcuenta: string read getnomcuenta write setnomcuenta;
   property nocuenta : integer read getnocuenta write setnocuenta;
   property nocredito: string read getnocredito write setnocredito;
   property idpersona : string read getidpersona write setidpersona;
   property tipoide : integer read gettipoide write settipoide;
   property monto : currency read getmonto write setmonto;
   property tasa : single read gettasa write settasa;
   property estado: string read getestado write setestado;
   property GMF:Boolean read getgmf Write setgmf;
   property SCuentas:TList read FCuentas Write FCuentas;
   property esbanco:Boolean read banco Write banco;
   property EsRetiroCheque:Boolean read _bRetiroCheque Write _bRetiroCheque;
   property EsAjuste:Boolean read _bEsAjuste write _bEsAjuste;
   procedure cerrar;
    { Public declarations }
  end;

var
  digita: Tdigita;
  vdebito : currency;
  vcredito : currency;
  vnocuenta : integer;
  vnocredito:string;
  vcodigo : string;
  vTp:Integer;
  vnomcuenta: string;
  vapellidos:string;
  vnombres : string;
  vid_persona : string;
  vprimer_ape:string;
  vsegundo_ape:string;
  vtipoid : integer;
  vmonto : currency;
  vtasa: single;
  id : string;
  vestado :string;
  vGMF:Boolean;
  vcerrar : boolean;
  nombre  :string;
  final   :boolean;
  TipoCaptacion:Integer;
  SaldoMinimo:Currency;
  Disponible:Currency;
  Saldo:Currency;

  movimiento : boolean;
  captacion  : boolean;
  colocacion : boolean;
  pidomonto :boolean;
  pidotasa  :boolean;


implementation

{$R *.dfm}

uses UnitDmGeneral,Unit_Mantenimientopuc, UnitGlobales,Unit_Dmcomprobante, Unit_Dmpuc,
     Unitcreaciondepersona;

var
Dmpuc : TDmpuc;

function Tdigita.getcodigo  : string;
begin
    result:= vcodigo;
end;

procedure Tdigita.cerrar;
begin
        final := true;
        self.Close;
end;

procedure Tdigita.setcodigo (nvalor:string);
begin
    vcodigo:= nvalor;
    editcodigo.Text := vcodigo;
end;

function Tdigita.Getdebito : currency;
begin
    result := vdebito;
end;

procedure Tdigita.Setdebito(nvalor:currency);
begin
        vdebito := nValor;
        EdDebito.Value := vdebito;
end;

function tdigita.Getcredito :currency;
begin
        result:= vcredito;
end;

procedure tdigita.Setcredito(nvalor:currency);
begin
        vcredito := nvalor;
        EdCredito.Value := vcredito;
end;

function Tdigita.getnomcuenta : string;
begin
        result := vnomcuenta;
end;

procedure Tdigita.setnomcuenta (nvalor: string);
begin
        vnomcuenta := nvalor;
        label5.Caption := vnomcuenta;
end;

function Tdigita.getestado : string;
begin
        result := vestado;
end;

procedure Tdigita.setestado(nvalor:string);
begin
        vestado:= 'O';
end;

function Tdigita.getTp: integer;
begin
        Result := vTp;
end;

procedure Tdigita.SetTp(nvalor: integer);
begin
         vTp := nvalor;
end;

function tdigita.getnocuenta :integer;
begin
        result:= vnocuenta;
end;

procedure tdigita.setnocuenta(nvalor:integer);
begin
        vnocuenta := nvalor;
        editnocuenta.Text  := IntToStr(vnocuenta);
end;

function Tdigita.getnocredito :string;
begin
        result:= vnocredito;
end;

procedure Tdigita.setnocredito (nvalor:string);
begin
        vnocredito:= nvalor;
        editnocredito.Text := vnocredito;
end;

function Tdigita.gettipoide : integer;
begin
        result:= vtipoid;
end;

procedure Tdigita.settipoide (nvalor:integer);
begin
        vtipoid:= nvalor;
        Edtipoid.KeyValue := vtipoid;
end;

function Tdigita.getidpersona : string;
begin
        result:= vid_persona;
end;

procedure Tdigita.setidpersona (nvalor:string);
begin
        vid_persona := nvalor;
        EdNit.Text := vid_persona;
end;

function Tdigita.getmonto : currency;
begin
        result:= vmonto;
end;

procedure Tdigita.setmonto (nvalor:currency);
begin
        vmonto:= nvalor;
        EdMonto.Text := formatcurr('#,##0.00',vmonto);
end;

function Tdigita.gettasa : single;
begin
        result:= vtasa;
end;

procedure Tdigita.settasa (nvalor:single);
begin
        vtasa:= nvalor;
        EdTasa.Text := Floattostr(vtasa);
end;


{desplazamiento con enter}

procedure Tdigita.editcodigoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure Tdigita.EditnocuentaKeyPress(Sender: TObject; var Key: Char);
begin
        Numericosinpunto(sender,key);
        EnterTabs(Key,Self);
end;

procedure Tdigita.EditnocreditoKeyPress(Sender: TObject; var Key: Char);
begin
        Numericosinpunto(sender,key);
        EnterTabs(Key,Self);
end;

procedure Tdigita.EdNitKeyPress(Sender: TObject; var Key: Char);
begin
//    Numericosinpunto(sender,key);
    if key = #13 then
        if EdNit.Text <> '' then
         begin
           vid_persona := EdNit.Text;
           if EdMonto.Visible then
             EdMonto.SetFocus
           else
          eddebito.SetFocus;

           with Dmcomprobante.IBQsetpersona do
            begin
              ParamByName('ID_IDENTIFICACION').AsInteger := Edtipoid.KeyValue;
              ParamByName('ID_PERSONA').AsString := EdNit.Text;
              Open;
              Last;
              First;
              if RecordCount = 1 then
               begin
                 label9.Visible:= true;
                 label9.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' '+
                                   FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                   FieldByName('NOMBRE').AsString;
               end
              else
               begin
                if MessageDlg('La Persona no existe, ¿Desea Crearla?',mtconfirmation,[mbYes,mbNo],0)= mryes then
                 begin
                   frmCreacionPersona:= TfrmCreacionPersona.Create(self);
                   frmcreacionpersona.Show;
                 end
                else
                   EdNit.SetFocus;
               end;
            end;
         end;
end;


procedure Tdigita.EdMontoKeyPress(Sender: TObject; var Key: Char);
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

procedure Tdigita.EdTasaKeyPress(Sender: TObject; var Key: Char);
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

procedure Tdigita.EditnocuentaExit(Sender: TObject);
begin
        nocuenta := StrToInt(editnocuenta.Text);
        label2.Visible := true;
        if (not self._bEsAjuste) then
           label2.Caption := evaluarcaptacion(nocuenta);
end;

procedure Tdigita.EditnocreditoExit(Sender: TObject);
begin
        nocredito := editnocredito.Text;
        label8.Visible := true;
        if (not self._bEsAjuste) then
          label8.Caption := evaluarcolocacion(nocredito);
end;

procedure Tdigita.EdtipoidEnter(Sender: TObject);
begin
    Edtipoid.KeyValue := self.tipoide;
    Edtipoid.DropDown;
end;

procedure Tdigita.EdtipoidExit(Sender: TObject);
begin
    tipoide := Edtipoid.KeyValue;
end;

{evaluar codigos}

function Tdigita.EvaluarCodigo(codigo : string) : string;
begin
    with Dmcomprobante.IBQuery1 do
    begin
     sql.Clear;
     Sql.Add('select "NOMBRE", "MOVIMIENTO", "INFORME",');
     Sql.Add('"ESCAPTACION", "ESCOLOCACION", "ESBANCO" from "con$puc"');
     Sql.Add('where "con$puc"."ID_AGENCIA" =:"ID_AGENCIA" and');
     Sql.Add('"con$puc"."CODIGO" =:"CODIGO"');
     parambyname('ID_AGENCIA').AsInteger := Agencia;
     parambyname('CODIGO').AsString := codigo;
     Open;
     nombre := FieldByName('NOMBRE').AsString;
     movimiento:= IntToBoolean(FieldByName('MOVIMIENTO').AsInteger);
     id := Fieldbyname('INFORME').AsString;
     captacion := IntToBoolean(FieldByName('ESCAPTACION').AsInteger);
     colocacion := IntToBoolean(FieldByName('ESCOLOCACION').AsInteger);
     banco      := IntToBoolean(FieldByName('ESBANCO').AsInteger);
     if DmComprobante.IBQuery1.RecordCount > 0 then
      begin
        label5.Visible:= true;
        label5.Caption:= nombre;
        result := nombre;
        if (captacion) then
         begin
           label6.Visible := true;
           editnocuenta.Visible := true;
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
              vTp := TipoCaptacion;
              SaldoMinimo := FieldByName('SALDO_MINIMO').AsCurrency;
              Label10.Visible := True;
              Label10.Caption := FieldByName('DESCRIPCION').AsString;
            end;
           label15.Visible := True;
           EdAgencia.Visible := True;
           EdAgencia.SetFocus;
           exit;
         end
         else
         begin
           Label10.Visible := False;
           Label6.Visible := False;
         end;
        if (colocacion) then
         begin
           label7.Visible := true;
           EditNoCredito.Visible := True;
           label15.Visible := True;
           EdAgencia.Visible := True;
           EdAgencia.SetFocus;
           exit;
         end
        else
         begin
           Label7.Visible := False;
           Label15.Visible := False;
         end;
        if not movimiento then
          begin
           MessageDlg('La Cuenta no es de Movimiento',mtError,[mbOk],0);
           editcodigo.SetFocus;
           editcodigo.Text:= '';
           label5.Visible := false;
           exit;
          end;
      end
     else
      begin
        MessageDlg('La cuenta no Existe',mtError,[mbOk],0);
        editcodigo.Text:= '';
        editcodigo.SetFocus;
        label10.Visible := false;
        label11.Visible := false;
        label12.Visible := false;
        label13.Visible := false;
        label14.Visible := false;
        nomcta.Visible := false;
        label5.Caption := '';
        Edtipoid.Visible := false;
        EdNit.Visible := false;
        EdMonto.Visible := false;
        EdTasa.Visible := false;
      end;
    end;
end;

function Tdigita.Evaluarinforme(id : string) : string;
var
pidoid, pidotipoid: boolean;
begin
        with dmcomprobante.IBQuery1 do
        begin
         sql.Clear;
         Sql.Add('select "PIDOID", "PIDOMONTO", "PIDOTASA", "PIDOTIPOID" from "con$informes" where "con$informes"."ID" =:"ID"');
         parambyname('ID').AsString := id;
         active := true;
         pidoid := inttoboolean(fieldbyname('PIDOID').AsInteger);
         pidotasa:= inttoboolean(fieldbyname('PIDOTASA').AsInteger);
         pidotipoid:= inttoboolean(fieldbyname('PIDOTIPOID').AsInteger);
         pidomonto:= inttoboolean(fieldbyname('PIDOMONTO').AsInteger);
         if pidotipoid then begin
          GrupoInforme.Visible := True;
          Label11.Visible := True;
          IBQTiposIdentificacion.Open;
          IBQTiposIdentificacion.Last;
          Edtipoid.Visible := true;
          Edtipoid.SetFocus;
         end;
         if pidoid then begin
          GrupoInforme.Visible := True;
          label9.Visible := true;
          label12.Visible := true;
          EdNit.Visible := true;
         end;
         if pidotasa then begin
          GrupoInforme.Visible := True;
          label14.Visible := true;
          EdTasa.Visible := true;
         end;
         if pidomonto then begin
          GrupoInforme.Visible := True;
          label13.Visible := true;
          EdMonto.Visible := true;
         end;
        id := '';
        end;
end;


function Tdigita.Evaluarcolocacion(nocredito : string) : string;
begin
       with Dmcomprobante.IBQuery1 do
        begin
         sql.Clear;
         Sql.Add('select "ID_IDENTIFICACION", "ID_PERSONA" from "col$colocacion"');
         Sql.Add('where "col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and "ID_COLOCACION" =:"ID_COLOCACION"');
         parambyname('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
         parambyname('ID_COLOCACION').AsString := nocredito;
         active := true;
         vtipoid := fieldbyname('ID_IDENTIFICACION').AsInteger;
         vid_persona:= fieldbyname('ID_PERSONA').AsString ;
         if DmComprobante.IBQuery1.RecordCount > 0 then
           begin
            result := vid_persona;
            label9.Visible := true;
            label9.Caption := evaluarpersona(vtipoid,vid_persona);
           end
         else
         begin
          MessageDlg('Ese Crédito no Existe',mtError,[mbOk],0);
          editnocredito.SetFocus;
         end;
        end;
end;

function Tdigita.Evaluarcaptacion(nocuenta : integer) : String;
var
DigitoC : Integer;
Valor:Currency;
Ag:Integer;
begin
    DigitoC := StrToInt(DigitoControl(TipoCaptacion,formatcurr('0000000',nocuenta)));
    with dmcomprobante.IBQuery1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('select "cap$tiposestado".SE_SUMA from "cap$maestro"');
       SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
       SQL.Add('where "cap$maestro".ID_AGENCIA =:"ID_AGENCIA" and');
       SQL.Add('"cap$maestro".ID_TIPO_CAPTACION =:"ID_TIPO_CAPTACION" and');
       SQL.Add('"cap$maestro".NUMERO_CUENTA =:"NUMERO_CUENTA" and');
       SQL.Add('"cap$maestro".DIGITO_CUENTA =:"DIGITO_CUENTA"');
       ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
       ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
       ParamByName('NUMERO_CUENTA').AsInteger := nocuenta;
       ParamByName('DIGITO_CUENTA').AsInteger := DigitoC;
       Open;
       if not InttoBoolean(FieldByName('SE_SUMA').AsInteger) then
       begin
            MessageDlg('Esa Cuenta No Permite Movimiento',mtError,[mbcancel],0);
            result:= '';
            editnocuenta.SetFocus;
            editnocuenta.Text:= '';
            Exit;
       end;
    end;
    with Dmcomprobante.IBQuery1 do
         begin
           sql.Clear;
           Sql.Add('select');
           Sql.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
           Sql.Add('"cap$maestrotitular".ID_PERSONA');
           Sql.Add('from "cap$maestrotitular"');
           Sql.Add('where');
           Sql.Add('"cap$maestrotitular".ID_AGENCIA =:"ID_AGENCIA" and');
           Sql.Add('"cap$maestrotitular".ID_TIPO_CAPTACION =:"ID_TIPO_CAPTACION" and');
           Sql.Add('"cap$maestrotitular".NUMERO_CUENTA =:"NUMERO_CUENTA" and');
           Sql.Add('"cap$maestrotitular".DIGITO_CUENTA =:"DIGITO_CUENTA" and');
           sql.add('"cap$maestrotitular".NUMERO_TITULAR = 1');
           ParamByName('ID_AGENCIA').AsInteger := EdAgencia.KeyValue;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
           ParamByName('NUMERO_CUENTA').AsInteger := nocuenta;
           ParamByName('DIGITO_CUENTA').AsInteger := DigitoC;
           Open;
           vtipoid := fieldbyname('ID_IDENTIFICACION').AsInteger;
           vid_persona:= fieldbyname('ID_PERSONA').AsString;
           if DmComprobante.IBQuery1.RecordCount > 0 then
             begin
              result := vid_persona;
              label9.Visible := true;
              label9.Caption := evaluarpersona(vtipoid,vid_persona);
              LblDisponible.Visible := True;
              LblCanje.Visible := True;
              LblSaldo.Visible := True;
              EdSaldo.Visible := True;
              EdDisponible.Visible := True;
              EdCanje.Visible := True;
              Ag := edagencia.keyvalue;
              Valor := evaluardisponible(Ag,TipoCaptacion,nocuenta,DigitoC);
              Disponible := Valor;
              EdDisponible.Caption := FormatCurr('#,0.00',Valor);

             end
           else
           begin
            MessageDlg('Esa cuenta no Existe',mtError,[mbOk],0);
            result:= '';
            editnocuenta.SetFocus;
            editnocuenta.Text:= '';
           end;
          end;
end;

function Tdigita.Evaluarpersona(tipoid: integer;id_persona: string) : string;
var
documento:string;
tipid : integer;
begin
        with Dmcomprobante.IBQuery1 do
        begin
          sql.Clear;
          sql.Add('select "ID_IDENTIFICACION", "ID_PERSONA", "NOMBRE", "PRIMER_APELLIDO", "SEGUNDO_APELLIDO"');
          sql.Add('from "gen$persona"');
          sql.Add('where "gen$persona"."ID_PERSONA" = :"ID_PERSONA" and "gen$persona"."ID_IDENTIFICACION" = :"ID_IDENTIFICACION"');
          parambyname('ID_IDENTIFICACION').AsInteger := tipoid;
          parambyname('ID_PERSONA').AsString := id_persona;
          active:= true;
          tipid:= fieldbyname('ID_IDENTIFICACION').AsInteger;
          documento:= fieldbyname('ID_PERSONA').AsString;
          if (tipid <> 0) and (documento <> '') then begin
             vnombres:= fieldbyname('NOMBRE').AsString;
             vprimer_ape := fieldbyname('PRIMER_APELLIDO').AsString;
             vsegundo_ape:= fieldbyname('SEGUNDO_APELLIDO').AsString;
             result:= vnombres+' '+vprimer_Ape+' '+vsegundo_ape;
          end
          else
          begin
             if MessageDlg('La Persona no existe, ¿Desea Crearla?',mtconfirmation,[mbYes,mbNo],0)= mryes then
               begin
                frmCreacionPersona:= TfrmCreacionPersona.Create(self);
                frmcreacionpersona.Show;
               end
             else
             self.Close;
          end;
        end;
end;

procedure Tdigita.BtncerrarClick(Sender: TObject);
begin
        self.Close;
        vcerrar := true;
end;

procedure Tdigita.FormShow(Sender: TObject);
begin
        DmComprobante := TDmComprobante.Create(self);
        DmPuc := TDmpuc.Create(self);
        editcodigo.Text := codigo;
        EdDebito.Value  := debito;
        EdCredito.Value := credito;
        tipoide := tipoide;
        editnocuenta.Text := IntToStr(nocuenta);
        editnocredito.Text:= nocredito;
        EdNit.Text:= idpersona;
        EdMonto.Text:= currtostr(monto);
        EdTasa.Text := formatfloat('#,##0.00',tasa);
        editcodigo.SetFocus;
        final := false;
        TipoCaptacion := 0;
        pnlRetiroCheque.Visible :=  Self.EsRetiroCheque;
        chkRetiroCheque.Checked := Self.EsRetiroCheque;
        IBQTiposIdentificacion.Open;
        IBQTiposIdentificacion.Last;
end;

procedure Tdigita.EdtipoidKeyPress(Sender: TObject; var Key: Char);
begin
        if key= #13 then
          EdNit.SetFocus;
end;


procedure Tdigita.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if final then
      begin
         DmComprobante.Free;
         DmPuc.Free;
         Action := caFree;
      end;
end;

procedure Tdigita.EditnocreditoEnter(Sender: TObject);
begin
        Editnocredito.SelectAll;
end;

procedure Tdigita.EditnocuentaEnter(Sender: TObject);
begin
        Editnocuenta.SelectAll;
end;

procedure Tdigita.EdNitEnter(Sender: TObject);
begin
        EdNit.SelectAll;
end;

procedure Tdigita.EdMontoEnter(Sender: TObject);
begin
        EdMonto.SelectAll;
end;

procedure Tdigita.EdTasaEnter(Sender: TObject);
begin
        EdTasa.SelectAll;
end;

procedure Tdigita.editcodigoEnter(Sender: TObject);
begin
        editcodigo.SelectAll;
end;

procedure Tdigita.BtnAgregarClick(Sender: TObject);
begin
        vcerrar := false;
        if ((debito = 0) and (credito = 0) and not banco) then
          begin
           MessageDlg('Debe digitar un valor debito ó crédito',mtError,[mbOk],0);
           eddebito.SetFocus;
           self.ModalResult := mrNone;
           vcerrar := false;
          end
        else
         begin
            vGMF := validarGMF(codigo);
            vcerrar := true;
         end;
end;

procedure Tdigita.editcodigoExit(Sender: TObject);
var Cadena, informe:string;
begin
    Cadena := EditCODIGO.Text;
    while Pos(' ',Cadena) > 0 do
    Cadena[Pos(' ',Cadena)] := '0';
    Codigo := Cadena;
    vnomcuenta := evaluarcodigo(codigo);
    informe := evaluarinforme(id);
end;

procedure Tdigita.EdAgenciaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure Tdigita.EdAgenciaEnter(Sender: TObject);
begin
        EdAgencia.KeyValue := Agencia;
end;

function Tdigita.evaluardisponible(Ag:Integer;Tp:Integer; Cta:Integer; Dg:Integer): Currency;
var Movimiento,Canje,Disponible:Currency;
    i:Integer;
    AR:PCuentas;
    Existe:Boolean;
begin
        with IBSQL1 do
        begin
         if Transaction.InTransaction then
            Transaction.Rollback;
            Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('Select "cap$maestrosaldoinicial".SALDO_INICIAL from "cap$maestro"');
                SQL.Add('LEFT JOIN "cap$maestrosaldoinicial" ON ("cap$maestro".ID_AGENCIA = "cap$maestrosaldoinicial".ID_AGENCIA) AND');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrosaldoinicial".ID_TIPO_CAPTACION) AND ("cap$maestro".NUMERO_CUENTA = "cap$maestrosaldoinicial".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrosaldoinicial".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
                ParamByName('NUMERO_CUENTA').AsInteger := Cta;
                ParamByName('DIGITO_CUENTA').AsInteger := Dg;
                ParamByName('ANO').AsString := IntToStr(YearOf(Date));
                try
                  ExecQuery;
                  if RecordCount < 1 then
                  begin
//                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   Saldo := 0;
//                   Exit;
                  end;
                  Saldo := FieldByName('SALDO_INICIAL').AsCurrency;
                except
                   MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
                   Result := 0;
                   Exit;
                end;

                Close;
                SQL.Clear;
                SQL.Add('SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS MOVIMIENTO from "cap$maestro"');
                SQL.Add('LEFT JOIN "cap$extracto" ON ("cap$maestro".ID_AGENCIA = "cap$extracto".ID_AGENCIA) AND ');
                SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$extracto".ID_TIPO_CAPTACION) AND ');
                SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$extracto".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$extracto".DIGITO_CUENTA)');
                SQL.Add('Where');
                SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
                SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
                ParamByName('NUMERO_CUENTA').AsInteger := Cta;
                ParamByName('DIGITO_CUENTA').AsInteger := Dg;
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
                ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
                try
                  ExecQuery;
                  if RecordCount < 1 then
                   Movimiento := 0
                  else
                   Movimiento := FieldByName('MOVIMIENTO').AsCurrency;
                except
                   MessageDlg('Error Consultando Movimientos',mtError,[mbcancel],0);
                   Movimiento := 0;
                end;

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
                SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
                SQL.Add('"cap$canje".LIBERADO = 0 and');
                SQL.Add('"cap$canje".DEVUELTO = 0');
                ParamByName('ID_AGENCIA').AsInteger := Ag;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
                ParamByName('NUMERO_CUENTA').AsInteger := Cta;
                ParamByName('DIGITO_CUENTA').AsInteger := Dg;
                try
                 ExecQuery;
                 if RecordCount < 1 then
                   Canje := 0
                 else
                   Canje := FieldByName('CANJE').AsCurrency;
                except
                   MessageDlg('Error Consultando Canje',mtError,[mbcancel],0);
                   Canje := 0;
                end;
         end;
         Saldo := Saldo + Movimiento;
         EdSaldo.Caption := FormatCurr('#,#0.00',Saldo);
         EdCanje.Caption := FormatCurr('#,#0.00',Canje+SaldoMinimo);
         Disponible := Saldo - Canje - SaldoMinimo;
         if Disponible < 0 then Disponible := 0;
         Existe := False;
         for i := 0 to FCuentas.Count - 1 do begin
            AR := FCuentas.Items[i];
            if (AR^.Tp = Tp) and (AR^.Cuenta = Cta) then
            begin
               Disponible := Disponible + AR^.Creditos - AR^.Debitos;
               Existe := True;
            end;
         end;
         if not Existe then
            begin
             New(AR);
             AR^.Tp := Tp;
             AR^.Cuenta := Cta;
             AR^.Debitos := 0;
             AR^.Creditos := 0;
             FCuentas.Add(AR);
            end;
         Result := Disponible;

end;

procedure Tdigita.EdDebitoEnter(Sender: TObject);
begin
        EdDebito.Value := debito;
        EdDebito.SelectAll;
end;

procedure Tdigita.EdDebitoExit(Sender: TObject);
begin
        debito := EdDebito.Value;
        if ((captacion) and (not self._bEsAjuste)) then
        begin
          if (EdDebito.Value >  Disponible)  and (EdDebito.Value <> Saldo) and
           ( Disponible >= 0 ) then
           begin
            MessageDlg('No se puede debitar lo que no se tiene',mtError,[mbcancel],0);
            EdDebito.SetFocus;
            Exit;
           end  // fin if edDebito.Value
          else
          if debito > 0 then
           begin
            pnlRetiroCheque.Visible := True;
            chkRetiroCheque.Checked := Self.EsRetiroCheque;
            chkRetiroCheque.SetFocus;
            exit;
           end // fin if debito
        end; // fin if Capatacion

        if debito > 0 then BtnAgregar.SetFocus;

end;

procedure Tdigita.EdCreditoEnter(Sender: TObject);
begin
        EdCredito.Value := credito;
        EdCredito.SelectAll;
end;

procedure Tdigita.EdCreditoExit(Sender: TObject);
begin
        credito := EdCredito.Value;
        if (debito <> 0) and (credito<>0) then
        begin
                MessageDlg('Ambos, debitos y creditos no pueden tener valor',mtError,[mbcancel],0);
                EdDebito.SetFocus;
                Exit;
        end;
        if credito > 0 then
        BtnAgregar.SetFocus
        else
        edDebito.SetFocus;
end;

procedure Tdigita.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure Tdigita.EdDebitoChange(Sender: TObject);
begin
//        if captacion then
//        if EdDebito.Value > Disponible then
//        begin
//          MessageDlg('No se puede debitar lo que no se tiene',mtError,[mbcancel],0);
//          Exit;
//        end;
end;

procedure Tdigita.CmdPUCClick(Sender: TObject);
var frmMantenimientopuc:TfrmMantenimientopuc;
begin
      frmMantenimientopuc := TfrmMantenimientopuc.Create(Self);
      frmMantenimientopuc.Agregar := False;
      frmMantenimientopuc.Modificar := False;
      frmMantenimientopuc.Eliminar := False;
      frmMantenimientopuc.ShowModal;
end;

procedure Tdigita.SetGMF(nValor: Boolean);
begin
      vGMF := nValor;
end;

function Tdigita.GetGMF: Boolean;
begin
        Result := vGMF;
end;

function Tdigita.ValidarGMF(codigo: string): boolean;
begin
        Result := False;
        if credito > 0 then begin
          if (codigo = '110505000000000000') or
             (codigo = '111005010000000000') or
             (codigo = '111005030000000000') or
             (codigo = '111005050000000000') or
             (codigo = '111005070000000000') or
             (codigo = '111005090000000000') or banco then begin
             Result := PreguntarGMF;
             Exit;
          end;
        end;
        if debito > 0 then begin
          if (codigo = '210505010000000000') or
             (codigo = '210505030000000000') or
             (codigo = '212505000000000000') or
             (codigo = '212515000000000000') or
             (codigo = '310505000000000000') or
             (codigo = '240520000000000000') then begin
             Result := PreguntarGMF;
             Exit;
          end;
        end;
end;

function Tdigita.PreguntarGMF: Boolean;
begin
     if MessageDlg('Aplica Gravamen a los Movimientos Financieros',mtConfirmation,[mbyes,mbno],0) = mryes then
        Result := True
     else
        Result := False;

end;


procedure Tdigita.EdNitExit(Sender: TObject);
var frmCreacionPersona:TfrmCreacionPersona;
begin
            with IBSQL2 do
              begin
               Transaction.Active := True;
               Close;
               SQL.Clear;
               SQL.Add('select * from "gen$persona" where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
               ParamByName('ID_IDENTIFICACION').AsInteger := Edtipoid.KeyValue;
               ParamByName('ID_PERSONA').AsString := EdNit.Text;
               try
                ExecQuery;
                if RecordCount > 0 then begin
                   Label9.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                     FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                     FieldByName('NOMBRE').AsString;
                   idpersona := EdNit.Text;
                end
                else
                  if MessageDlg('Esa Documento no Existe!, Desea Agregarlo',mtConfirmation,[mbyes,mbno],0) = mryes then
                  begin
                    frmCreacionPersona := TfrmCreacionPersona.Create(Self);
                    frmCreacionPersona.ShowModal;
                    EdNit.SetFocus;
                  end
                  else
                    EdNit.SetFocus;
               except
                  Transaction.Active := False;
                  Transaction.Rollback;
                  raise;
               end;
               Transaction.Commit;
               Transaction.Active := False;
              end;




end;

procedure Tdigita.EdMontoExit(Sender: TObject);
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

procedure Tdigita.EdTasaExit(Sender: TObject);
begin
        if EdTasa.Text <> '' then
          begin
            tasa := strtofloat(EdTasa.Text);
            EdTasa.Text := formatfloat('#,##0.00',tasa);
            credito := roundto(monto*(tasa/100),0);
            edcredito.SetFocus
          end;
end;

procedure Tdigita.chkRetiroChequeExit(Sender: TObject);
begin
        Self.EsRetiroCheque := chkRetiroCheque.Checked;
end;

function Tdigita.ValidaMontoTasa: Boolean;
var
   Valor:Currency;
   ValorC:Currency;
begin
        if (pidotasa and pidomonto) then
        begin
            Valor := RoundTo((Monto * (Tasa/100)),0);
            if debito > 0 then ValorC := debito
            else ValorC := credito;
            if (Abs(ValorC - Valor) >= 1) then
            begin
              MessageDlg('El Monto o Tasa Digitado no corresponde'+#10#13+
                         'con el valor Contabilizado, por favor Revise!',mtError,[mbOk],0);
              result := false;
              exit;
            end
        end
        else
         result := true;
end;

procedure Tdigita.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
        CanClose := vcerrar;
end;

procedure Tdigita.BtnAgregarEnter(Sender: TObject);
begin

          if (not validaMontoTasa) then
          if debito > 0 then EdDebito.SetFocus
          else EdCredito.SetFocus;
end;

end.
