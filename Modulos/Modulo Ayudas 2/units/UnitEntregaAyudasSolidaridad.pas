unit UnitEntregaAyudasSolidaridad;
                      
interface

uses
  Windows, Messages, Math, StrUtils, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery,
  IBSQL, IBDatabase, Buttons, JvEdit, JvTypedEdit, pr_Common, pr_TxClasses,
  DBClient,Jpeg;

type
  TfrmEntregaAyudasSolidaridad = class(TForm)
    PageControl1: TPageControl;
    TabAportes: TTabSheet;
    TabJuvenil: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    IBSQL1: TIBSQL;
    IBQuery1: TIBQuery;
    IBSQL2: TIBSQL;
    DSTiposDocumento: TDataSource;
    IBQTiposDocumentos: TIBQuery;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    PageControl5: TPageControl;
    TabBuscarDocumentoAsociadoJuvenil: TTabSheet;
    Label7: TLabel;
    DBLCBTipoDocumentoJuvenil: TDBLookupComboBox;
    EdDocumentoJuvenil: TEdit;
    CmdBuscarJuvenilDoc: TBitBtn;
    TabSheet6: TTabSheet;
    Label8: TLabel;
    EdCuentaJuvenil: TJvIntegerEdit;
    CmdBuscarJuvenilCuenta: TBitBtn;
    Panel3: TPanel;
    Label4: TLabel;
    EdNombreJuvenil: TStaticText;
    Label5: TLabel;
    EdIdentificacionAsociadoJuvenil: TStaticText;
    Label6: TLabel;
    EdNombreAsociadoJuvenil: TStaticText;
    Label3: TLabel;
    EdNombreAsociado: TStaticText;
    PageControl4: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBLCBTipoDocumento: TDBLookupComboBox;
    EdDocumento: TEdit;
    CmdBuscarAsociadoDocumento: TBitBtn;
    TabSheet5: TTabSheet;
    Label2: TLabel;
    EdCuentaAportes: TJvIntegerEdit;
    CmdBuscarAsociadoCuenta: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    EdMaximaAyuda: TStaticText;
    Label12: TLabel;
    EdAyudaEntregada: TStaticText;
    Label13: TLabel;
    EdDisponible: TStaticText;
    GroupBox4: TGroupBox;
    chkEducacion: TCheckBox;
    chkJuvenil: TCheckBox;
    chkAportesAnoAnterior: TCheckBox;
    chkAportesPresenteAno: TCheckBox;
    chkDeudas: TCheckBox;
    chkFianzas: TCheckBox;
    EdMensajes: TStaticText;
    CmdCerrar: TBitBtn;
    DSPersona: TDataSource;
    IBQPersona: TIBQuery;
    Label14: TLabel;
    CmdAplicar: TBitBtn;
    CmdOtro: TBitBtn;
    IBSQL3: TIBSQL;
    GroupBox5: TGroupBox;
    chkEducacionJ: TCheckBox;
    chkJuvenilJ: TCheckBox;
    chkAportesAnoAnteriorJ: TCheckBox;
    chkAportesPresenteAnoJ: TCheckBox;
    chkDeudasJ: TCheckBox;
    chkFianzasJ: TCheckBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    EdMaximaAyudaJ: TStaticText;
    EdAyudaEntregadaJ: TStaticText;
    EdDisponibleJ: TStaticText;
    EdMensajesJ: TStaticText;
    GroupBox6: TGroupBox;
    Imagen1J: TDBImage;
    Imagen2J: TDBImage;
    Panel6: TPanel;
    CmdCerrarJ: TBitBtn;
    CmdAplicarAyudaJ: TBitBtn;
    CmdOtroJ: TBitBtn;
    IBQPersonaJ: TIBQuery;
    DSPersonaJ: TDataSource;
    EdValorJ: TJvCurrencyEdit;
    chkAhorrosPresenteAno: TCheckBox;
    chkAhorrosPresenteAnoJ: TCheckBox;
    IBQMedicos: TIBQuery;
    DSMedicos: TDataSource;
    IBQMedicosNOMBRE: TIBStringField;
    dbListmedicos: TDBLookupListBox;
    IBQMedicosID_MEDICO: TSmallintField;
    EdValor: TStaticText;
    HeaderControl1: THeaderControl;
    chkApertura: TCheckBox;
    Label18: TLabel;
    EdCopago: TStaticText;
    Reporte: TprTxReport;
    chkAperturaJ: TCheckBox;
    grpAyudas: TRadioGroup;
    HeaderControl2: THeaderControl;
    RadioGroup1: TRadioGroup;
    _ibq1: TIBQuery;
    _ibt1: TIBTransaction;
    GroupBox7: TGroupBox;
    lAyuda: TListBox;
    lLista1: TListBox;
    Label9: TLabel;
    EdBeneficiario: TEdit;
    cbParentesco: TComboBox;
    Panel7: TPanel;
    ImgFotoC: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdBuscarAsociadoDocumentoClick(Sender: TObject);
    procedure EdValorExit(Sender: TObject);
    procedure RB1Click(Sender: TObject);
    procedure CmdOtroClick(Sender: TObject);
    procedure CmdBuscarAsociadoCuentaClick(Sender: TObject);
    procedure CmdAplicarClick(Sender: TObject);
    procedure EdValorEnter(Sender: TObject);
    procedure CmdBuscarJuvenilDocClick(Sender: TObject);
    procedure CmdAplicarAyudaJClick(Sender: TObject);
    procedure CmdBuscarJuvenilCuentaClick(Sender: TObject);
    procedure EdValorJExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbListmedicosClick(Sender: TObject);
    procedure grpAyudasClick(Sender: TObject);
  private
    procedure Inicializar;
    procedure ValidarAsociado;
    procedure ValidarJuvenil;
    function ValidarEstadoJuvenil: boolean;
    function LlenaEspacio(_sCadenaini:string;_iTamano:integer):string;
    procedure MostrarAyudas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntregaAyudasSolidaridad: TfrmEntregaAyudasSolidaridad;
  xEducacion:Boolean;
  xAportesAct:Boolean;
  xAportesAnt:Boolean;
  xAhorrosAct:Boolean;
  xJuvenil:Boolean;
  xDeudas:Boolean;
  xFianzas:Boolean;
  xAperturaJ:Boolean;
  xAperturaA:Boolean;

  Ag:Integer;
  Tp:Integer;
  Nm:Integer;
  Dg:Integer;

  AgJ:Integer;
  TpJ:Integer;
  NmJ:Integer;
  DgJ:Integer;


  SaldoApoAnt:Currency;
  SaldoApoAct:Currency;
  SaldoAhoAct:Currency;
  SaldoValido:Currency;
  SaldoMinimo:Currency;
  vJuvenil:Currency;
  vJuvenilYa:Boolean;
  SalarioMinimo:Currency;

  vMaximaAyuda:Currency;
  vAyudaEntregada:Currency;
  vDisponible:Currency;
  vValor:Currency;

  IdAyuda:Integer;
  StrAyuda:string;
  EsJuvenil:Boolean;
  Empleado:string;
  vMedico:string;
  _sDireccion :string;
  vCopago:Currency;

  NoActiva:Boolean;

  MinAportes:Currency;
  MinAhorros:Currency;
  MinJuvenil:Currency;

  vSolidaridad :Currency;
  vEnfermedad :Currency;
  vFunerario :Currency;
  vCalamidad :Currency;
  vSegfunebre :Currency;
  vBachillerato :Currency;
  vTecnico :Currency;
  vUniversitario :Currency;

  vSolidaridadCopago :Currency;
  vEnfermedadCopago :Currency;
  vFunerarioCopago :Currency;
  vCalamidadCopago :Currency;
  vSegfunebreCopago :Currency;
  vBachilleratoCopago :Currency;
  vTecnicoCopago :Currency;
  vUniversitarioCopago :Currency;


implementation

{$R *.dfm}

uses unitDmGeneral, unitGlobales, unitGlobalesCol,UnitGuardaImagen;

procedure TfrmEntregaAyudasSolidaridad.FormShow(Sender: TObject);
begin
        Inicializar;
        if NoActiva then begin
           Self.Close;
        end;
end;

procedure TfrmEntregaAyudasSolidaridad.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmEntregaAyudasSolidaridad.Inicializar;
begin

        if IBQTiposDocumentos.Transaction.InTransaction then
           IBQTiposDocumentos.Transaction.Rollback;

        IBQTiposDocumentos.Transaction.StartTransaction;

        IBQTiposDocumentos.Open;
        IBQTiposDocumentos.Last;
        IBQTiposDocumentos.First;
        grpAyudas.Items.Clear;

        with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$empleado" where');
            SQL.Add('ID_EMPLEADO = :ID_EMPLEADO');
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            try
             ExecQuery;
            except
             Transaction.Rollback;
             raise;
            end;
            Empleado := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                        FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                        FieldByName('NOMBRE').AsString;
        end;



        GroupBox1.Enabled := True;
        GroupBox2.Enabled := True;
        EdValor.Enabled := True;

        DBLCBTipoDocumento.KeyValue := 0;
        EdDocumento.Text := '';
        EdNombreAsociado.Caption := '';

        chkEducacion.Checked := False;
        chkAportesAnoAnterior.Checked := False;
        chkAportesPresenteAno.Checked := False;
        chkAhorrosPresenteAno.Checked := False;
        chkDeudas.Checked := False;
        chkJuvenil.Checked := False;
        chkFianzas.Checked := False;

        EdMaximaAyuda.Caption := '$ 0.00';
        EdAyudaEntregada.Caption := '$ 0.00';
        EdDisponible.Caption := '$ 0.00';
        EdMensajes.Caption := '';

        DBLCBTipoDocumentoJuvenil.KeyValue := 0;
        EdDocumentoJuvenil.Text := '';
        EdNombreJuvenil.Caption := '';
        EdNombreAsociadoJuvenil.Caption := '';
        EdIdentificacionAsociadoJuvenil.Caption := '';
        EdValorJ.Value := 0;
        EdCuentaAportes.Value := 0;
        EdCuentaJuvenil.Value := 0;

        chkEducacionJ.Checked := False;
        chkAportesAnoAnteriorJ.Checked := False;
        chkDeudasJ.Checked := False;
        chkJuvenilJ.Checked := False;
        chkAportesPresenteAnoJ.Checked := False;
        chkAhorrosPresenteAnoJ.Checked := False;
        chkFianzasJ.Checked := False;
        chkApertura.Checked := False;

        EdMaximaAyudaJ.Caption := '$ 0.00';
        EdAyudaEntregadaJ.Caption := '$ 0.00';
        EdDisponibleJ.Caption := '$ 0.00';
        EdMensajesJ.Caption := '';




        EdValor.caption := '';


        GroupBox3.Enabled := False;

        IdAyuda := 0;
        EsJuvenil := False;
        //vJuvenil := 30000;
        vJuvenilYa := False;

        xEducacion     :=False;
        xAportesAct    :=False;
        xAportesAnt    :=False;
        xJuvenil       :=False;
        xDeudas        :=False;
        xFianzas       :=False;
        xAperturaJ     :=False;
        xAperturaA     :=False;
        SalarioMinimo  := 0;

        CmdAplicarAyudaJ.Enabled := False;
        CmdAplicar.Enabled := False;

        NoActiva := False;

        with IBSQL1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "fun$diascerrados" where FECHA = :FECHA');
           ParamByName('FECHA').AsDate := fFechaActual;
           try
             ExecQuery;
             if RecordCount > 0 then begin
               NoActiva := True;
               ShowMessage('Lo siento, el día ya fue cerrado');
               Transaction.Commit;
               Exit;
             end;
           except
            raise;
           end;
        end;
        lAyuda.Clear;
        lLista1.Clear;
        PageControl1.ActivePage := TabAportes;
        PageControl4.ActivePage := TabSheet2;
        DBLCBTipoDocumento.SetFocus;
end;

procedure TfrmEntregaAyudasSolidaridad.CmdCerrarClick(Sender: TObject);
begin
        Close;

end;

procedure TfrmEntregaAyudasSolidaridad.ValidarAsociado;
var
  vMaximoAutorizado:Currency;
  vPorcentajeMaximo:Double;
  vOft:Integer;
  _iConteoAyuda :Integer;
begin
        xEducacion     := False;
        xAportesAct    := False;
        xAportesAnt    := False;
        xAhorrosAct    := False;
        xJuvenil       := False;
        xDeudas        := True;
        xFianzas       := True;
        vDisponible    := 0;
        vOft           := 0;


// Buscar Minimo Aportes, Ahorro Ordinario, Ahorro Juvenil
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select SALDO_MINIMO from "cap$tipocaptacion"');
          SQL.Add('where ID_TIPO_CAPTACION = :ID');
          ParamByName('ID').AsInteger := 1;
          try
           ExecQuery;
           MinAportes := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select SALDO_MINIMO from "cap$tipocaptacion"');
          SQL.Add('where ID_TIPO_CAPTACION = :ID');
          ParamByName('ID').AsInteger := 2;
          try
           ExecQuery;
           MinAhorros := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select SALDO_MINIMO from "cap$tipocaptacion"');
          SQL.Add('where ID_TIPO_CAPTACION = :ID');
          ParamByName('ID').AsInteger := 4;
          try
           ExecQuery;
           MinJuvenil := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           raise;
          end;

          Close;
        end;


// Verificación de Asociado y Requisitos
        with IBQPersona do begin
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,EDUCACION,FOTO from "gen$persona" where ID_IDENTIFICACION = :ID and');
          SQL.Add('ID_PERSONA = :PERSONA');
          ParamByName('ID').AsInteger := DBLCBTipoDocumento.KeyValue;
          ParamByName('PERSONA').AsString := EdDocumento.Text;
          try
           Open;
           if RecordCount > 0 then begin
              GroupBox1.Enabled := False;
              Application.ProcessMessages;
              EdNombreAsociado.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                          FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                          FieldByName('NOMBRE').AsString;
              EdBeneficiario.Text := EdNombreAsociado.Caption;
              if InttoBoolean(FieldByName('EDUCACION').AsInteger) then begin
                xEducacion := True;
                chkEducacion.Checked := xEducacion;
              end
              else
              begin
                xeducacion := False;
                chkeducacion.Checked := xeducacion;
              end;
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "cap$maestro".FECHA_APERTURA, "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA');
              IBSQL1.SQL.Add('from "cap$maestrotitular" ');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and ');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA ="cap$maestro".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1 and');
              IBSQL1.SQL.Add('"cap$tiposestado".SE_SUMA <> 0');
              IBSQL1.SQL.Add('order by "cap$maestrotitular".ID_TIPO_CAPTACION');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                   if IBSQL1.FieldByName('FECHA_APERTURA').AsDate <= encodedate(2010,12,31) then
                   begin
                     xAperturaA := True;
                     chkApertura.Checked := True;
                   end
                   else
                   begin
                     xAperturaA := False;
                     chkApertura.Checked := False;
                   end;
                   Ag := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                   Tp := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                   Nm := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                   Dg := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                end
                else
                begin
                   Ag := 0;
                   Tp := 0;
                   Nm := 0;
                   Dg := 0;
                   SaldoApoAnt := 0;
                   SaldoApoAct := 0;
                   SaldoAhoAct := 0;
                   vMaximaAyuda := 0;
                   vAyudaEntregada := 0;
                   vDisponible := 0;
                   Exit;
                end;
              except
                Transaction.Rollback;
                raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_INICIAL from "cap$maestrosaldoinicial" where');
              IBSQL1.SQL.Add('ID_AGENCIA = :AG and ID_TIPO_CAPTACION = :TP and NUMERO_CUENTA = :NM and');
              IBSQL1.SQL.Add('DIGITO_CUENTA = :DG and ANO = :ANO');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := Tp;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := Dg;
              IBSQL1.ParamByName('ANO').AsString := IntToStr(_iPeriodo);
              try
               IBSQL1.ExecQuery;
               if IBSQL1.RecordCount > 0 then begin
                 SaldoApoAnt := IBSQL1.FieldByName('SALDO_INICIAL').AsCurrency;
                 if SaldoApoAnt >= _cValorAportes then// ojo cambiar la forma de validacion
                    xAportesAnt := true
                 else
                    xAportesAnt := False;
               end
               else
               begin
                 SaldoApoAnt := 0;
                 xAportesAnt := False;
               end;
               chkAportesAnoAnterior.Checked := xAportesAnt;
              except
               Transaction.Rollback;
               raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := Tp;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := Dg;
              IBSQL1.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
              IBSQL1.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
              IBSQL1.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                  SaldoApoAct := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoApoAct >= MinAportes  then
                    xAportesAct := True
                  else
                    xAportesAct := False;
                end
                else
                begin
                  SaldoApoAct := 0;
                  xAportesAct := False;
                end;
                chkAportesPresenteAno.Checked := True;
              except
                Transaction.Rollback;
                raise;
              end;

// Saldo Ahorros

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := 2;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := StrToInt(DigitoControl(2,Format('%.7d',[Nm])));
              IBSQL1.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
              IBSQL1.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
              IBSQL1.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                  SaldoAhoAct := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoAhoAct >= MinAhorros then
                    xAhorrosAct := True
                  else
                    xAhorrosAct := False;
                end
                else
                begin
                  SaldoAhoAct := 0;
                  xAhorrosAct := False;
                end;
                chkAhorrosPresenteAno.Checked := xAhorrosAct;
              except
                Transaction.Rollback;
                raise;
              end;

// Deudas


              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
              IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
              try
               IBSQL1.ExecQuery;
               xDeudas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xDeudas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                Transaction.Rollback;
                raise;
              end;
              chkDeudas.Checked := xDeudas;
// Fianzas
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colgarantias"');
              IBSQL1.SQL.Add('inner join "col$colocacion" ON ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
              IBSQL1.SQL.Add('"col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
              IBSQL1.SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA');
//              IBSQL1.SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
              try
               IBSQL1.ExecQuery;
               xFianzas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xFianzas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                Transaction.Rollback;
                raise;
              end;
              chkFianzas.Checked := xFianzas;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select * from "cap$maestrotitular"');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and "cap$maestrotitular".ID_TIPO_CAPTACION = 4 and "cap$tiposestado".SE_SUMA <> 0');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumento.Text;
              try
               IBSQL1.ExecQuery;
               xJuvenil := True;
               if IBSQL1.RecordCount > 0 then
                while not IBSQL1.Eof do begin
                    IBSQL2.Close;
                    IBSQL2.SQL.Clear;
                    IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
                    IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                    IBSQL2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                    IBSQL2.ParamByName('NM').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                    IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                    IBSQL2.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
                    try
                      IBSQL2.ExecQuery;
                      if IBSQL2.RecordCount > 0 then
                      while not IBSQL2.Eof do begin
                         if IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency < MinJuvenil then
                           xJuvenil := False;
                         IBSQL2.Next;
                      end;

                    except
                      Transaction.Rollback;
                      raise;
                    end;
                 IBSQL1.Next;
                end;

                chkJuvenil.Checked := xJuvenil;
               except
                Transaction.Rollback;
                raise;
              end;
// Fin verificación de Requisitos
// Verificar valores máximos, entregados y pendientes
{           if SaldoApoAnt < SaldoApoAct then
              SaldoValido := SaldoApoAnt
           else} //******************************************** Ojo se cambio para tomar el valor total de los aportes
              SaldoValido := SaldoApoAct;

           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 44');
           IBSQL1.ExecQuery;
           vPorcentajeMaximo := IBSQL1.FieldByName('VALOR_MINIMO').AsFloat;

           vMaximaAyuda :=  SimpleRoundTo(SaldoValido * vPorcentajeMaximo,0);

           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 28');
           IBSQL1.ExecQuery;
           vMaximoAutorizado := IBSQL1.FieldByName('VALOR_MINIMO').AsCurrency;

           if vMaximaAyuda > vMaximoAutorizado then
             vMaximaAyuda := vMaximoAutorizado;


{           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 0');
           IBSQL1.ExecQuery;
           SalarioMinimo := SimpleRoundTo(IBSQL1.FieldByName('VALOR_MINIMO').AsCurrency / 2,0);;

           if vMaximaAyuda > SalarioMinimo then
              vMaximaAyuda := SalarioMinimo;
}
           vAyudaEntregada := 0;
           _iConteoAyuda := 0;//validacion para las consultas generales
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('select * from "fun$consolayudas" where ');
           IBSQL1.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL1.SQL.Add('PERIODO = :PERIODO');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Ag;
           IBSQL1.ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
           IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := Nm;
           IBSQL1.ParamByName('DIGITO_CUENTA').AsInteger := Dg;
           IBSQL1.ParamByName('PERIODO').AsInteger := _iPeriodo; ///Aqi aparece el periodo a entregar detalles
           try
            IBSQL1.ExecQuery;
            if IBSQL1.RecordCount > 0 then
             while not IBSQL1.Eof do
             begin
                vAyudaEntregada := vAyudaEntregada + IBSQL1.FieldByName('VALOR').AsCurrency;
                if IBSQL1.FieldByName('ID_AYUDA').AsInteger <> 1 then
                   TRadioButton(grpAyudas.Controls[IBSQL1.FieldByName('ID_AYUDA').AsInteger - 1]).Enabled := False
                else
                  _iConteoAyuda := _iConteoAyuda + 1;
                IBSQL1.Next;
             end;
            except
             Transaction.Rollback;
             raise;
            end;
            if _iConteoAyuda >= 2 then
              TRadioButton(grpAyudas.Controls[0]).Enabled := False;
            vDisponible := vMaximaAyuda - vAyudaEntregada;
            if vDisponible < 0 then vDisponible := 0;
            IBSQL1.Close;
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('SELECT');
            IBSQL1.SQL.Add('"fun$consolayudas".NUMERO_CUENTA,');
            IBSQL1.SQL.Add('"fun$ayudas".DESCRIPCION,');
            IBSQL1.SQL.Add('"fun$ayudas".VALOR_MAXIMO');
            IBSQL1.SQL.Add('FROM');
            IBSQL1.SQL.Add('"fun$consolayudas"');
            IBSQL1.SQL.Add('INNER JOIN "fun$ayudas" ON ("fun$consolayudas".ID_AYUDA = "fun$ayudas".ID_AYUDA)');
            IBSQL1.SQL.Add('WHERE');
            IBSQL1.SQL.Add('"fun$consolayudas".ID_TIPO_CAPTACION = 1 AND');
            IBSQL1.SQL.Add('"fun$consolayudas".PERIODO = :PERIODO AND');
            IBSQL1.SQL.Add('"fun$consolayudas".NUMERO_CUENTA = :NM');
            IBSQL1.ParamByName('NM').AsInteger := Nm;
            IBSQL1.ParamByName('PERIODO').AsInteger := _iPeriodo;
            IBSQL1.ExecQuery;
            while not IBSQL1.Eof do
            begin
              lAyuda.Items.Add(IBSQL1.FieldByName('DESCRIPCION').AsString);
              lLista1.Items.Add(CurrToStrF(IBSQL1.FieldByName('VALOR_MAXIMO').AsCurrency,ffCurrency,0));
              IBSQL1.Next;
            end;

// Fin Verificar Valores
           end
           else
           begin
              MessageDlg('Asociado no existe!',mtError,[mbcancel],0);
              inicializar;
              DBLCBTipoDocumento.SetFocus;
           end;
          except
           Transaction.Rollback;
           raise;
          end;
        end;


end;

procedure TfrmEntregaAyudasSolidaridad.CmdBuscarAsociadoDocumentoClick(
  Sender: TObject);
  var     jpg :TJPEGImage;
        _sjpg : TMemoryStream;
        _iImagen :TGImagen;
        _rImagen :TImagen;
begin
        _iImagen := TGImagen.Create;
        if (DBLCBTipoDocumento.KeyValue < 1) or (EdDocumento.Text = '') then begin
           MessageDlg('Debe digitar un número de identificación valido',mtError,[mbcancel],0);
           Exit;
        end;
        
        MostrarAyudas;
        ValidarAsociado;

        if vDisponible = 0 then begin
           MessageDlg('Ya no posee ayudas disponibles',mtError,[mbcancel],0);
           Inicializar;
        end;
        EdMaximaAyuda.Caption := FormatCurr('$ #,#0.00',vMaximaAyuda);
        EdAyudaEntregada.Caption := FormatCurr('$ #,#0.00',vAyudaEntregada);
        EdDisponible.Caption := FormatCurr('$ #,#0.00',vDisponible);

        if (xEducacion and xAportesAct and xAportesAnt and xAhorrosAct and
            xJuvenil and xDeudas and xFianzas and xAperturaA) then begin
            EdMensajes.Caption := 'Cumple con todos los requisitos';
            GroupBox3.Enabled := True;
            _rimagen := _iImagen.ConsultaImagen(DBLCBTipoDocumento.KeyValue,EdDocumento.Text);
            if _rImagen.Foto.Size > 0 then
            begin
              jpg := TJpegImage.Create;
              jpg.LoadFromStream(_rImagen.Foto);
              ImgFotoC.Picture.Bitmap.Assign(jpg);
              ImgFotoC.Repaint;
              FreeAndNil(jpg);
            end;

        end
        else
        begin
           EdMensajes.Caption := 'No Cumple con alguno de los requisitos';
           GroupBox3.Enabled := False;
        end;

end;

procedure TfrmEntregaAyudasSolidaridad.EdValorExit(Sender: TObject);
begin
//        EdValor.Value := Trunc(EdValor.Value/1000) * 1000;
        CmdAplicar.Enabled := True;
        Application.ProcessMessages;
        CmdAplicar.SetFocus;
end;

procedure TfrmEntregaAyudasSolidaridad.RB1Click(Sender: TObject);
begin
       if TRadioButton(Sender).Checked then begin
          case StrToInt(RightStr(TRadioButton(Sender).Name,1)) of
            1: begin
//                 EdValor.MaxValue := vSolidaridad;
                 vValor := vSolidaridad;
                 vCopago := vSolidaridadCopago;
                 IdAyuda := 1;
                 StrAyuda := 'Bono de Solidaridad';
               end;
            2: begin
//                 EdValor.MaxValue := vEnfermedad;
                 vValor := vEnfermedad;
                 vCopago := vEnfermedadCopago;
                 IdAyuda := 2;
                 StrAyuda := 'Consulta Oftalmologica';
               end;
            3: begin
//                 EdValor.MaxValue := vFunerario;
                 vValor := vFunerario;
                 vCopago := vFunerarioCopago;
                 IdAyuda := 3;
                 StrAyuda := 'Consulta de Seno';
               end;
            4: begin
//                 EdValor.MaxValue := vCalamidad;
                 vValor := vCalamidad;
                 vCopago := vCalamidadCopago;
                 IdAyuda := 4;
                 StrAyuda := 'Consulta Ginecologia';
               end;
            5: begin
//                 EdValor.MaxValue := vSegfunebre;
                 vValor := vSegfunebre;
                 vCopago := vSegfunebreCopago;
                 IdAyuda := 5;
                 StrAyuda := 'Consulta Urologia';
               end;
            6: begin
//                 EdValor.MaxValue := vBachillerato;
                 vValor := vBachillerato;
                 vCopago := vBachilleratoCopago;
                 IdAyuda := 6;
                 StrAyuda := 'Consulta Oftalmologia Adultos';
               end;
            7: begin
//                 EdValor.MaxValue := vTecnico;
                 vValor := vTecnico;
                 vCopago := vTecnicoCopago;
                 IdAyuda := 7;
                 StrAyuda := 'Consulta Pediatria';
               end;
            8: begin
//                 EdValor.MaxValue := vUniversitario;
                 vValor := vUniversitario;
                 vCopago := vUniversitarioCopago;
                 IdAyuda := 8;
                 StrAyuda := 'Auxilio Educativo Universitario';
               end;
          end;
          if vValor > vDisponible then
          begin
            TRadioButton(Sender).Checked := False;
            Exit;
          end;

          EdValor.Caption  := FormatCurr('$#,0',vValor);
          EdCopago.Caption  := FormatCurr('$#,0',vCopago);
          IBQMedicos.Close;
          IBQMedicos.SQL.Clear;
          IBQMedicos.SQL.Add('SELECT "fun$medicos".ID_MEDICO,"fun$medicos".NOMBRE,COUNT("fun$movimiento".ID_AYUDA) AS CONSULTAS');
          IBQMedicos.SQL.Add('FROM "fun$medicos"');
          IBQMedicos.SQL.Add('LEFT JOIN "fun$movimiento" ON ("fun$medicos".ID_MEDICO = "fun$movimiento".ID_MEDICO and "fun$movimiento".FECHA = :FECHA)');
          IBQMedicos.SQL.Add('INNER JOIN "fun$medayu" ON ("fun$medayu".ID_MEDICO = "fun$medicos".ID_MEDICO)');
          IBQMedicos.SQL.Add('INNER JOIN "fun$ayudas" ON ("fun$ayudas".ID_AYUDA = "fun$medayu".ID_AYUDA)');
          IBQMedicos.SQL.Add('WHERE');
          IBQMedicos.SQL.Add('"fun$ayudas".ID_AYUDA = :ID_AYUDA');
          IBQMedicos.SQL.Add('GROUP BY');
          IBQMedicos.SQL.Add('"fun$medicos".ID_MEDICO,"fun$medicos".NOMBRE');
          IBQMedicos.ParamByName('ID_AYUDA').AsInteger := IdAyuda;
          IBQMedicos.ParamByName('FECHA').AsDate := fFechaActual;
          IBQMedicos.Open;
          dbListmedicos.SetFocus;
//          EdValor.Enabled := True;
//          EdValor.SetFocus;
       end;
end;

procedure TfrmEntregaAyudasSolidaridad.CmdOtroClick(Sender: TObject);
begin
        Inicializar;
        EdBeneficiario.Text := '';
        cbParentesco.ItemIndex := 0;
        ImgFotoC.Picture := nil;
        ImgFotoC.Picture := nil;
end;

procedure TfrmEntregaAyudasSolidaridad.CmdBuscarAsociadoCuentaClick(
  Sender: TObject);
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "cap$maestrotitular" Where');
          SQL.Add('ID_TIPO_CAPTACION = 1 and NUMERO_CUENTA = :NUMERO_CUENTA and NUMERO_TITULAR = 1');
          ParamByName('NUMERO_CUENTA').AsInteger := EdCuentaAportes.Value;
          try
            ExecQuery;
            if RecordCount > 0 then begin
              DBLCBTipoDocumento.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdDocumento.Text := FieldByName('ID_PERSONA').AsString;
              PageControl4.ActivePage := TabSheet2;
              CmdBuscarAsociadoDocumento.Click;
            end
            else
            begin
              MessageDlg('Numero de Cuenta no Encontrado'+#13+'Por Favor Verifiquelo!',mtError,[mbcancel],0);
              Inicializar;
              PageControl4.ActivePage := TabSheet5;
              EdCuentaAportes.SetFocus;
            end;
          except
            Transaction.Rollback;
            raise;
          end;
        end;


end;

procedure TfrmEntregaAyudasSolidaridad.CmdAplicarClick(Sender: TObject);
var Consecutivo:Integer;
    Archivo:string;
begin
        if MessageDlg('Seguro de Entregar esta Ayuda?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
         Exit;
        end;

        CmdAplicar.Enabled := False;
        Application.ProcessMessages;

        Consecutivo := ObtenerConsecutivoAyudas(IBSQL1);
        if not DirectoryExists('C:\Reporte') then
           CreateDir('C:\Reportes');
        Archivo := 'C:\Reportes\Ay'+Format('%.6d',[Consecutivo])+'_'+Format('%.d%.2d-%.7d-%.d',[Tp,Agencia,Nm,Dg])+'.pr';
        IBSQL1.Transaction.StartTransaction;
        with IBSQL1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT DIRECCION FROM "fun$medicos" WHERE ID_MEDICO = :ID_MEDICO');
            ParamByName('ID_MEDICO').AsInteger := dbListmedicos.KeyValue;
            ExecQuery;
            _sDireccion := FieldByName('DIRECCION').AsString;
            SQL.Clear;
            Close;
            SQL.Clear;
            SQL.Add('insert into "fun$movimiento" (ID_USUARIO,FECHA,');
            SQL.Add('ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,');
            SQL.Add('CONSECUTIVO,ID_AYUDA,VALOR_APROBADO,APLICADO,ID_MEDICO) VALUES (');
            SQL.Add(':ID_USUARIO,:FECHA,:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
            SQL.Add(':DIGITO_CUENTA,:CONSECUTIVO,:ID_AYUDA,:VALOR_APROBADO,:APLICADO,:ID_MEDICO)');
            ParamByName('ID_USUARIO').AsString := DBAlias;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
            ParamByName('NUMERO_CUENTA').AsInteger := Nm;
            ParamByName('DIGITO_CUENTA').AsInteger := Dg;
            ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
            ParamByName('ID_AYUDA').AsInteger := IdAyuda;
            ParamByName('VALOR_APROBADO').AsCurrency := vValor;
            ParamByName('APLICADO').AsInteger := BooleanoToInt(False);
            ParamByName('ID_MEDICO').AsInteger := dbListmedicos.KeyValue;
            try
              ExecQuery;
            except
              Transaction.Rollback;
              raise;
            end;

            Close;
            SQL.Clear;
            SQL.Add('insert into "fun$consolayudas" (ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,');
            SQL.Add('DIGITO_CUENTA,PERIODO,ID_AYUDA,VALOR) values (');
            SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:PERIODO,:ID_AYUDA,:VALOR)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
            ParamByName('NUMERO_CUENTA').AsInteger := Nm;
            ParamByName('DIGITO_CUENTA').AsInteger := Dg;
            ParamByName('PERIODO').AsInteger := _iPeriodo;
            ParamByName('ID_AYUDA').AsInteger := IdAyuda;
            ParamByName('VALOR').AsCurrency := vValor;
            try
              ExecQuery;
            except
              Transaction.Rollback;
              raise;
            end;

            Transaction.Commit;
        end;

        Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
        Reporte.Variables.ByName['CONSECUTIVO'].AsInteger := Consecutivo;
        Reporte.Variables.ByName['OFICINA'].AsString := Ciudad;
        if EsJuvenil then
        begin
           Reporte.Variables.ByName['ASOCIADO'].AsString := EdNombreAsociadoJuvenil.Caption;
           Reporte.Variables.ByName['AHORRADOR'].AsString := EdNombreJuvenil.Caption;
        end
        else
        begin
           Reporte.Variables.ByName['ASOCIADO'].AsString := EdNombreAsociado.Caption;
           Reporte.Variables.ByName['AHORRADOR'].AsString := '';
           Reporte.Variables.ByName['CUENTAJ'].AsString := '';
        end;
        Reporte.Variables.ByName['CUENTA'].AsString := Format('%d%.2d-%.7d-%d',[Tp,Ag,Nm,Dg]);
        Reporte.Variables.ByName['AYUDA'].AsString := StrAyuda;
//        if IdAyuda = 1 then
//           Reporte.Variables.ByName['VALOR'].AsDouble := 0;
//        else
//           Reporte.Variables.ByName['VALOR'].AsDouble := EdValor.Value;
           
        Reporte.Variables.ByName['USUARIO'].AsString := Empleado;
        Reporte.Variables.ByName['MEDICO'].AsString := vMedico;
        Reporte.Variables.ByName['COPAGO'].AsDouble := vCopago;
        Reporte.Variables.ByName['VALIDO'].AsDateTime := fFechaActual;
        if cbParentesco.ItemIndex = 0 then
           Reporte.Variables.ByName['BENEFICIARIO'].AsString := 'BENEFICIARIO: ' + EdBeneficiario.Text
        else
           Reporte.Variables.ByName['BENEFICIARIO'].AsString := 'BENEFICIARIO-PARENTESCO: ' + EdBeneficiario.Text + '-' + cbParentesco.Text;
        Reporte.Variables.ByName['DIRECCION'].AsString := 'DIRECCION: ' + _sDireccion;

        if Reporte.PrepareReport then begin
           Reporte.SavePreparedReportToFile(Archivo);
           Reporte.PreviewPreparedReport(True);
        end;


end;

procedure TfrmEntregaAyudasSolidaridad.EdValorEnter(Sender: TObject);
begin
//        if EdValor.Value > vDisponible then
//          EdValor.Value := vDisponible;
end;

procedure TfrmEntregaAyudasSolidaridad.ValidarJuvenil;
begin
// Verificación de Asociado y Requisitos
        with IBQPersonaJ do begin
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,EDUCACION,FOTO from "gen$persona" where ID_IDENTIFICACION = :ID and');
          SQL.Add('ID_PERSONA = :PERSONA');
          ParamByName('ID').AsInteger := DBLCBTipoDocumentoJuvenil.KeyValue;
          ParamByName('PERSONA').AsString := EdDocumentoJuvenil.Text;
          try
           Open;
           if RecordCount > 0 then begin
              GroupBox1.Enabled := False;
              GroupBox2.Enabled := False;
              Application.ProcessMessages;
              EdNombreJuvenil.Caption :=  FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                          FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                          FieldByName('NOMBRE').AsString;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "cap$maestro".FECHA_APERTURA, "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA');
              IBSQL1.SQL.Add('from "cap$maestrotitular" ');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and ');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA ="cap$maestro".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
              IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 2 and "cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA and');
              IBSQL1.SQL.Add('"cap$tiposestado".SE_SUMA <> 0');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumentoJuvenil.KeyValue;
              IBSQL1.ParamByName('ID_PERSONA').AsString := EdDocumentoJuvenil.Text;
              IBSQL1.ParamByName('NUMERO_CUENTA').AsInteger := EdCuentaJuvenil.Value;
              try
               IBSQL1.ExecQuery;
               if IBSQL1.RecordCount > 0 then begin
                  AgJ := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                  TpJ := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  NmJ := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                  DgJ := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                  if IBSQL1.FieldByName('FECHA_APERTURA').AsDate <= StrtoDate('2004/12/31') then
                    xAperturaJ := True
                  else
                    xAperturaJ := False;
                  if ValidarEstadoJuvenil then begin
                     MessageDlg('Ya se le asigno la Ayuda',mtError,[mbcancel],0);
                     vJuvenilYa := True;
                     Exit;
                  end;

                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "cap$maestrotitular" where');
                  IBSQL2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ');
                  IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
                  IBSQL2.SQL.Add('NUMERO_TITULAR = 1');
                  IBSQL2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                  IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                  IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                  try
                    IBSQL2.ExecQuery;
                    if IBSQL2.RecordCount > 0 then begin
                       IBSQL3.Close;
                       IBSQL3.SQL.Clear;
                       IBSQL3.SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE, ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA from "gen$persona"');
                       IBSQL3.SQL.Add('inner join "cap$maestrotitular" ON ("gen$persona".ID_IDENTIFICACION = "cap$maestrotitular".ID_IDENTIFICACION and');
                       IBSQL3.SQL.Add('"gen$persona".ID_PERSONA = "cap$maestrotitular".ID_PERSONA)');
                       IBSQL3.SQL.Add('where "gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION and "gen$persona".ID_PERSONA = :ID_PERSONA and');
                       IBSQL3.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1 and "cap$maestrotitular".ID_TIPO_CAPTACION = 1');
                       IBSQL3.ParamByName('ID_IDENTIFICACION').AsInteger := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
                       IBSQL3.ParamByName('ID_PERSONA').AsString := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       DBLCBTipoDocumento.KeyValue := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
                       EdIdentificacionAsociadoJuvenil.Caption := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       EdDocumento.Text := IBSQL2.FieldByName('ID_PERSONA').AsString;
                       Ag := IBSQL3.FieldByName('ID_AGENCIA').AsInteger;
                       Tp := IBSQL3.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                       Nm := IBSQL3.FieldByName('NUMERO_CUENTA').AsInteger;
                       Dg := IBSQL3.FieldByName('DIGITO_CUENTA').AsInteger;
                       try
                         IBSQL3.ExecQuery;
                         if IBSQL3.RecordCount > 0 then begin
                            EdNombreAsociadoJuvenil.Caption := IBSQL3.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                               IBSQL3.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                               IBSQL3.FieldByName('NOMBRE').AsString;
                         end;
                       except
                         Transaction.Rollback;
                         raise;
                       end;
                    end
                    else
                    begin
                      MessageDlg('No Encuentro al Asociado',mtError,[mbcancel],0);
                      Inicializar;
                      Exit;
                    end
                  except
                    Transaction.Rollback;
                    raise;
                  end;
                end
               else
               begin
                  MessageDlg('No Encuentro a Ese Juvenil',mtError,[mbcancel],0);
                  Inicializar;
                  Exit;
               end
             except
               Transaction.Rollback;
               raise;
             end;
            end
            else
            begin
               MessageDlg('No Encuentro a Ese Juvenil',mtError,[mbcancel],0);
               Inicializar;
               Exit;
            end;
           except
            Transaction.Rollback;
            raise;
           end;
          end;


end;

procedure TfrmEntregaAyudasSolidaridad.CmdBuscarJuvenilDocClick(
  Sender: TObject);
begin
        ValidarJuvenil;
        if vJuvenilYa then begin
           Inicializar;
           Exit;
        end;
        ValidarAsociado;
        chkEducacionJ.Checked          := xEducacion;
        chkAportesAnoAnteriorJ.Checked := xAportesAnt;
        chkAportesPresenteAnoJ.Checked := xAportesAct;
        chkAhorrosPresenteAnoJ.Checked := xAhorrosAct;
        chkJuvenilJ.Checked            := xJuvenil;
        chkDeudasJ.Checked             := xDeudas;
        chkFianzasJ.Checked            := xFianzas;
        chkAperturaJ.Checked           := xAperturaA;

        EdMaximaAyudaJ.Caption := FormatCurr('$ #,#0.00',vMaximaAyuda);
        EdAyudaEntregadaJ.Caption := FormatCurr('$ #,#0.00',vAyudaEntregada);
        EdDisponibleJ.Caption := FormatCurr('$ #,#0.00',vDisponible);

        if (xEducacion and xAportesAct and xAportesAnt and xAhorrosAct and
            xJuvenil and xDeudas and xFianzas and xAperturaA) then begin
            EdMensajesJ.Caption := 'Cumple con todos los requisitos';
//            GroupBox6.Enabled := True;
            if vDisponible < vJuvenil then
            vJuvenil := vDisponible;
            EdValorJ.MaxValue := vJuvenil;
            EdValorJ.Value := vJuvenil;
//            EdValorJ.SetFocus;
        end
        else
        begin
           EdMensajesJ.Caption := 'No Cumple con alguno de los requisitos';
           GroupBox6.Enabled := False;
        end;
end;

procedure TfrmEntregaAyudasSolidaridad.CmdAplicarAyudaJClick(Sender: TObject);
var Consecutivo:Integer;
begin
        if MessageDlg('Seguro de Entregar esta Ayuda?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
         Exit;
        end;

        Consecutivo := ObtenerConsecutivoAyudas(IBSQL1);
        IBSQL1.Transaction.StartTransaction;
        with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "fun$movimiento" (ID_USUARIO,FECHA,');
            SQL.Add('ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,');
            SQL.Add('CONSECUTIVO,ID_AYUDA,VALOR_APROBADO,APLICADO) VALUES (');
            SQL.Add(':ID_USUARIO,:FECHA,:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,');
            SQL.Add(':DIGITO_CUENTA,:CONSECUTIVO,:ID_AYUDA,:VALOR_APROBADO,:APLICADO)');
            ParamByName('ID_USUARIO').AsString := DBAlias;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := TpJ;
            ParamByName('NUMERO_CUENTA').AsInteger := NmJ;
            ParamByName('DIGITO_CUENTA').AsInteger := DgJ;
            ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
            ParamByName('ID_AYUDA').AsInteger := 9;
            ParamByName('VALOR_APROBADO').AsCurrency := vJuvenil;
            ParamByName('APLICADO').AsInteger := BooleanoToInt(False);
            try
              ExecQuery;
            except
              Transaction.Rollback;
              raise;
            end;

            Close;
            SQL.Clear;
            SQL.Add('insert into "fun$consolayudas" (ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,');
            SQL.Add('DIGITO_CUENTA,PERIODO,ID_AYUDA,VALOR) values (');
            SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:PERIODO,:ID_AYUDA,:VALOR)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
            ParamByName('NUMERO_CUENTA').AsInteger := Nm;
            ParamByName('DIGITO_CUENTA').AsInteger := Dg;
            ParamByName('PERIODO').AsInteger := 2008;
            ParamByName('ID_AYUDA').AsInteger := 9;
            ParamByName('VALOR').AsCurrency := vJuvenil;
            try
              ExecQuery;
            except
              Transaction.Rollback;
              raise;
            end;

            Close;
            SQL.Clear;
            SQL.Add('insert into "fun$juveniles" (ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,PERIODO,FECHA_ENTREGA,VALOR_ENTREGADO)');
            SQL.Add('values (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:PERIODO,:FECHA_ENTREGA,:VALOR_ENTREGADO)');
            ParamByName('ID_AGENCIA').AsInteger := AgJ;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := TpJ;
            ParamByName('NUMERO_CUENTA').AsInteger := NmJ;
            ParamByName('DIGITO_CUENTA').AsInteger := DgJ;
            ParamByName('PERIODO').AsInteger := 2008;
            ParamByName('FECHA_ENTREGA').AsDate := fFechaActual;
            ParamByName('VALOR_ENTREGADO').AsCurrency := vJuvenil;
            try
              ExecQuery;
            except
              Transaction.Rollback;
              raise;
            end;

            Transaction.Commit;
        end;

        Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
        Reporte.Variables.ByName['CONSECUTIVO'].AsInteger := Consecutivo;
        Reporte.Variables.ByName['OFICINA'].AsString := Ciudad;
        Reporte.Variables.ByName['ASOCIADO'].AsString := EdNombreAsociadoJuvenil.Caption;
        Reporte.Variables.ByName['AHORRADOR'].AsString := EdNombreJuvenil.Caption;


        Reporte.Variables.ByName['CUENTA'].AsString  := Format('%d%.2d-%.7d-%d',[Tp,Ag,Nm,Dg]);
        Reporte.Variables.ByName['CUENTAJ'].AsString := Format('%d%.2d-%.7d-%d',[TpJ,AgJ,NmJ,DgJ]);
        Reporte.Variables.ByName['AYUDA'].AsString := 'Auxilio Ahorro Juvenil';
        Reporte.Variables.ByName['VALOR'].AsDouble := vJuvenil;
        Reporte.Variables.ByName['USUARIO'].AsString := Empleado;

        if Reporte.PrepareReport then begin
           Reporte.SavePreparedReportToFile('C:\Ayuda.pr');
           Reporte.PreviewPreparedReport(True);
        end;
end;

procedure TfrmEntregaAyudasSolidaridad.CmdBuscarJuvenilCuentaClick(
  Sender: TObject);
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "cap$maestrotitular" Where');
          SQL.Add('ID_TIPO_CAPTACION = 4 and NUMERO_CUENTA = :NUMERO_CUENTA and NUMERO_TITULAR = 2');
          ParamByName('NUMERO_CUENTA').AsInteger := EdCuentaJuvenil.Value;
          try
            ExecQuery;
            if RecordCount > 0 then begin
              DBLCBTipoDocumentoJuvenil.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
              EdDocumentoJuvenil.Text := FieldByName('ID_PERSONA').AsString;
//              PageControl5.ActivePage := TabBuscarDocumentoAsociadoJuvenil;
              CmdBuscarJuvenilDoc.Click;
            end
            else
            begin
              MessageDlg('Numero de Cuenta no Encontrado'+#13+'Por Favor Verifiquelo!',mtError,[mbcancel],0);
              Inicializar;
//              PageControl5.ActivePage := TabSheet6;
              EdCuentaJuvenil.SetFocus;
            end;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

end;

function TfrmEntregaAyudasSolidaridad.ValidarEstadoJuvenil: boolean;
begin
        with IBSQL3 do begin
         Close;
         SQL.Clear;
         SQL.Add('select * from "fun$juveniles" where ');
         SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA AND PERIODO = :PERIODO');
         ParamByName('ID_AGENCIA').AsInteger := AgJ;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := TpJ;
         ParamByName('NUMERO_CUENTA').AsInteger := NmJ;
         ParamByName('DIGITO_CUENTA').AsInteger := DgJ;
         ParamByName('PERIODO').AsInteger := 2008;
         try
          ExecQuery;
          if RecordCount > 0 then
            Result := True
          else
            Result := False;
         except
           Transaction.Rollback;
           raise;
         end;
        end;
end;

procedure TfrmEntregaAyudasSolidaridad.EdValorJExit(Sender: TObject);
begin
{        EdValorJ.Value := Trunc(EdValorJ.Value/1000) * 1000;
        vJuvenil := EdValorJ.Value;
        CmdAplicarAyudaJ.Enabled := True;
        Application.ProcessMessages;
        CmdAplicarAyudaJ.SetFocus;}
end;

procedure TfrmEntregaAyudasSolidaridad.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose := True;
end;

procedure TfrmEntregaAyudasSolidaridad.dbListmedicosClick(Sender: TObject);
begin
        CmdAplicar.Enabled := True;
        vMedico := IBQMedicos.FieldByName('NOMBRE').AsString;
end;

procedure TfrmEntregaAyudasSolidaridad.MostrarAyudas;
var
  _cadena:string;
  _sCadena1 :string;
  _index,_count:integer;
begin
        if _ibt1.InTransaction then
           _ibt1.Rollback;
        _ibt1.StartTransaction;
        _ibq1.SQL.Clear;
        _ibq1.SQL.Add('select');
        _ibq1.SQL.Add('"fun$ayudas".ID_AYUDA,');
        _ibq1.SQL.Add('"fun$ayudas".DESCRIPCION,');
        _ibq1.SQL.Add('"fun$ayudas".VALOR_MAXIMO,');
        _ibq1.SQL.Add('"fun$ayudas".COPAGO');
        _ibq1.SQL.Add('from "fun$ayudas"');
        _ibq1.SQL.Add('where');
        _ibq1.SQL.Add('ID_AYUDA');
        _ibq1.SQL.Add('not in');
        _ibq1.SQL.Add('( select');
        _ibq1.SQL.Add('ID_AYUDA');
        _ibq1.SQL.Add('from');
        _ibq1.SQL.Add('"fun$consolayudas"');
        _ibq1.SQL.Add('where');
        _ibq1.SQL.Add('ID_AGENCIA = :ID_AGENCIA');
        _ibq1.SQL.Add('and');
        _ibq1.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
        _ibq1.SQL.Add('and');
        _ibq1.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA');
        _ibq1.SQL.Add('and');
        _ibq1.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
        _ibq1.SQL.Add('and');
        _ibq1.SQL.Add('PERIODO = :PERIODO)');
        _ibq1.SQL.Add('order by');
        _ibq1.SQL.Add('"fun$ayudas".ID_AYUDA');
        _ibq1.Open;
        while not _ibq1.Eof do
        begin
            _cadena := _ibq1.FieldbyName('DESCRIPCION').AsString;
            _index := Pos('Consulta ',_cadena);
            _count := Length('Consulta ');
            Delete(_cadena,_index,_count);
//            _sCadena1 := LlenaEspacio(_cadena,40);

            _cadena :=  Format('%-20s%4s%-0.20s',[_cadena,' ',FormatCurr('#,#0',_ibq1.FieldByName('VALOR_MAXIMO').AsCurrency)]);
//            _cadena :=  _sCadena1  + FormatCurr('#,#0',_ibq1.FieldByName('VALOR_MAXIMO').AsCurrency);
            AnsiReplaceStr(_cadena,' ','.');
            grpAyudas.Items.Add(_cadena);
            _ibq1.Next;
        end;
end;

procedure TfrmEntregaAyudasSolidaridad.grpAyudasClick(Sender: TObject);
begin
          _ibq1.First;
          _ibq1.MoveBy(grpAyudas.ItemIndex);
          vValor := _ibq1.FieldByName('VALOR_MAXIMO').AsCurrency;
          vCopago := _ibq1.FieldByName('COPAGO').AsCurrency;
          IdAyuda := grpAyudas.ItemIndex + 1;
          StrAyuda := _ibq1.FieldByName('DESCRIPCION').AsString;

          if vValor > vDisponible then
          begin
            TRadioButton(grpAyudas.Controls[grpAyudas.ItemIndex]).Checked := False;
            IBQMedicos.Close;
            EdValor.Caption := '';
            EdCopago.Caption := '';
            Exit;
          end;

          EdValor.Caption  := FormatCurr('$#,0',vValor);
          EdCopago.Caption  := FormatCurr('$#,0',vCopago);
          IBQMedicos.Close;
          IBQMedicos.SQL.Clear;
          IBQMedicos.SQL.Add('SELECT "fun$medicos".ID_MEDICO,"fun$medicos".NOMBRE');
          IBQMedicos.SQL.Add('FROM "fun$medicos"');
          IBQMedicos.SQL.Add('INNER JOIN "fun$medayu" ON ("fun$medayu".ID_MEDICO = "fun$medicos".ID_MEDICO)');
          IBQMedicos.SQL.Add('INNER JOIN "fun$ayudas" ON ("fun$ayudas".ID_AYUDA = "fun$medayu".ID_AYUDA)');
          IBQMedicos.SQL.Add('WHERE');
          IBQMedicos.SQL.Add('"fun$ayudas".ID_AYUDA = :ID_AYUDA');
          IBQMedicos.ParamByName('ID_AYUDA').AsInteger := IdAyuda;
          IBQMedicos.Open;
          dbListmedicos.SetFocus;
//          EdValor.Enabled := True;
//          EdValor.SetFocus;

end;

function TfrmEntregaAyudasSolidaridad.LlenaEspacio(_sCadenaini: string;
  _iTamano: integer): string;
var
  _iTamanoCad,i :Integer;
begin
        _iTamanoCad := Length(_sCadenaini);
        _iTamanoCad := _iTamano - _iTamanoCad;
        if _iTamanoCad > 0 then
        begin
          for i := 0 to _iTamanoCad -1 do
              _sCadenaini := _sCadenaini + ' ';
        end;
        Result := _sCadenaini;
end;

end.
