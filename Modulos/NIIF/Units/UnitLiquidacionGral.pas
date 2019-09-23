unit UnitLiquidacionGral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvEdit, JvTypedEdit, JvLabel, Grids, DBGrids,
  DB, DBClient, IBCustomDataSet, IBQuery, IBDatabase ,DateUtils, JvMemo,
  JvPanel, JvCombobox, Buttons, ComCtrls, Math, StrUtils, pr_Common,
  pr_Classes, FR_DSet, FR_DBSet, FR_Class, pr_TxClasses, DBCtrls, IBSQL,
  UnitdmGeneral
  ;

type
  TfrmLiquidacionGral = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    JvLabel1: TJvLabel;
    JVnombres: TJvEdit;
    JvLabel2: TJvLabel;
    Label2: TLabel;
    Label3: TLabel;
    Direccion: TEdit;
    JVdocumento: TJvEdit;
    CDcolocacion: TClientDataSet;
    CDfianzas: TClientDataSet;
    CDcolocacioncolocacion: TStringField;
    CDfianzasfianza: TStringField;
    DScolocacion: TDataSource;
    DSfianza: TDataSource;
    CDfianzasFecha_interes: TDateField;
    CDcolocacionestado: TStringField;
    CDfianzasestado: TStringField;
    IBConsulta: TIBQuery;
    IBdatos: TIBQuery;
    IBTransaction1: TIBTransaction;
    CDcolocacionfecha_interes: TDateField;
    CDcolocacionvalor: TStringField;
    CDfianzasvalor: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    JVtotal: TJvCurrencyEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    DBcolocacion: TDBGrid;
    DBfianza: TDBGrid;
    JVvalor: TJvCurrencyEdit;
    Label7: TLabel;
    JvLabel4: TJvLabel;
    Label6: TLabel;
    JVinteres: TJvFloatEdit2;
    GroupBox1: TGroupBox;
    Rmensual: TRadioButton;
    Rbimensual: TRadioButton;
    Rtrimestral: TRadioButton;
    Rsemestral: TRadioButton;
    Ranual: TRadioButton;
    Label10: TLabel;
    TipoCuota: TJvComboBox;
    JvLabel3: TJvLabel;
    JVvalorcuota: TJvCurrencyEdit;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    JvLabel5: TJvLabel;
    BTrequisitos: TBitBtn;
    BTgrafico: TBitBtn;
    BTtextual: TBitBtn;
    Panel4: TPanel;
    plazo: TJvIntegerEdit;
    BTcerrar: TSpeedButton;
    BTnuevo: TSpeedButton;
    Label16: TLabel;
    frReport1: TfrReport;
    frCompositeReport1: TfrCompositeReport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    CDrequisitos: TClientDataSet;
    CDrequisitosdescripcion_re: TStringField;
    CDrequisitosrequisito: TStringField;
    frDBDataSet3: TfrDBDataSet;
    conyugue: TClientDataSet;
    conyuguedescripcion: TStringField;
    solicitante: TClientDataSet;
    solicitantedescripcion: TStringField;
    codeudor: TClientDataSet;
    codeudordescripcion: TStringField;
    CDtitulo: TClientDataSet;
    CDtitulotitulo: TStringField;
    CDtitulopagare: TStringField;
    CDtitulofecha: TStringField;
    CDtituloestado: TStringField;
    CDtitulosaldo: TStringField;
    CDcredito: TClientDataSet;
    CDcreditotitulo1: TStringField;
    CDcreditotitulo2: TStringField;
    Capacitacion: TCheckBox;
    IBlineas: TIBQuery;
    DataSource1: TDataSource;
    Label9: TLabel;
    DBlinea: TDBLookupComboBox;
    PRreport: TprTxReport;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    CDopcion: TClientDataSet;
    CDopcionvalor: TCurrencyField;
    CDopciondescripcion: TStringField;
    frDBDataSet4: TfrDBDataSet;
    CDopcioninter: TStringField;
    IBSQL1: TIBSQL;
    Label8: TLabel;
    seguro: TJvCurrencyEdit;
    Label17: TLabel;
    intereses: TJvCurrencyEdit;
    Label18: TLabel;
    AportesS: TJvCurrencyEdit;
    Label19: TLabel;
    saldodeuda: TJvCurrencyEdit;
    Label20: TLabel;
    total: TJvCurrencyEdit;
    JvLabel11: TJvLabel;
    Ainteres: TJvIntegerEdit;
    JVamortiza: TJvIntegerEdit;
    Label21: TLabel;
    Label22: TLabel;
    CHdescuentos: TCheckBox;
    CDcolocacionreciprocidad: TIntegerField;
    IBSQL3: TIBQuery;
    IBTransaction3: TIBTransaction;
    procedure JVdocumentoExit(Sender: TObject);
    procedure MInversionKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure RmensualClick(Sender: TObject);
    procedure RbimensualClick(Sender: TObject);
    procedure RtrimestralClick(Sender: TObject);
    procedure RsemestralClick(Sender: TObject);
    procedure RanualClick(Sender: TObject);
    procedure JVvalorExit(Sender: TObject);
    procedure TotalEnter(Sender: TObject);
    procedure BTcerrarClick(Sender: TObject);
    procedure BTnuevoClick(Sender: TObject);
    procedure MInversionExit(Sender: TObject);
    procedure BTgraficoClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure TipoCuotaClick(Sender: TObject);
    procedure BTtextualClick(Sender: TObject);
    procedure DBlineaExit(Sender: TObject);
    procedure AinteresExit(Sender: TObject);
    procedure JVamortizaExit(Sender: TObject);
    procedure JVamortizaEnter(Sender: TObject);
    procedure AinteresEnter(Sender: TObject);
    procedure JVvalorEnter(Sender: TObject);
    procedure plazoEnter(Sender: TObject);
    procedure CHdescuentosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    numero_cuenta: integer;
    digito_cuenta: integer;
    periodo: variant;
    formapago :string;
    veces_aportes :Variant;
    Linea :string;
    interesess :string;
    saldo_total: Currency;
    procedure colocaciones;
    procedure fianzas;
    function aportes: currency;
    procedure nuevo;
    function CuotaFija(Valor: Currency; Plazo: Integer; TasaE: Single;
      Amortiza: Integer): Currency;
    function FactorCuota(TasaE: Single; Plazo, Amortiza: Integer): Single;
    function CuotaVariable(Valor: Currency; Plazo: Integer; TasaE: Single;
      Amortiza: Integer): Currency;
    function TasaNominalVencida(TasaE: Single; Amortiza: Integer): Single;
    procedure imprimir_reporte(cadena: string);
    function descuento(entrada: integer): currency;
    function busca_cuenta(opcion, nit: string): integer;
  
    { Private declarations }
  public
  published
    procedure cmChildKey(var msg: TWMKEY); message CM_CHILDKEY;
    { Public declarations }
  end;

var
  frmLiquidacionGral: TfrmLiquidacionGral;
  dmGeneral: TdmGeneral;
  AportesAnt:Currency;
  MinAportes:Currency;
  const numeros: array[0..16] of string = ('CERO','UNO','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE','DIEZ','OCNCE','DOCE','TRECE','CATORCE','QUINCE','DIECISEIS');

implementation

uses UnitImpresion, UnitVistaPreliminar,JclSysUtils,UnitMAin,UnitGlobales,UnitGlobalescol,
   UnitdmColocacion;

{$R *.dfm}

function TfrmLiquidacionGral.aportes: currency;
var saldo_inicial,saldo_actual :Currency;
begin
        saldo_inicial := 0;
        saldo_actual := 0;
        with IBConsulta do
        begin
          Close;
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
          SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
          SQL.Add('"cap$maestrosaldoinicial".ANO = :ANO');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
          ParamByName('NUMERO_CUENTA').AsInteger := numero_cuenta;
          ParamByName('DIGITO_CUENTA').AsInteger := digito_cuenta;
          ParamByName('ANO').AsString := IntToStr(YearOf(Date));
          Open;
          if RecordCount > 0 then
             Saldo_Inicial := FieldByName('SALDO_INICIAL').AsCurrency;
          SQL.Clear;
          SQL.Add('SELECT SUM("cap$extracto".VALOR_DEBITO - "cap$extracto".VALOR_CREDITO) AS SUMA from "cap$maestro"');
          SQL.Add('LEFT JOIN "cap$extracto" ON ("cap$maestro".ID_AGENCIA = "cap$extracto".ID_AGENCIA) AND ');
          SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = "cap$extracto".ID_TIPO_CAPTACION) AND ');
          SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$extracto".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$extracto".DIGITO_CUENTA)');
          SQL.Add('Where');
          SQL.Add('"cap$maestro".ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and');
          SQL.Add('"cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
          SQL.Add('"cap$extracto".FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
          ParamByName('NUMERO_CUENTA').AsInteger := numero_cuenta;
          ParamByName('DIGITO_CUENTA').AsInteger := digito_cuenta;
          ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
          ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
          Open;
          if RecordCount > 0 then
             Saldo_Actual := FieldByName('SUMA').AsCurrency;
        end;
        Result := Saldo_Actual + Saldo_Inicial;
end;

procedure TfrmLiquidacionGral.cmChildKey(var msg: TWMKEY);
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

procedure TfrmLiquidacionGral.colocaciones;
var     saldo :Currency;
begin
        saldo_total := 0;
        with IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS "saldo",');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$colocacion".RECIPROCIDAD,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$lineas".VECES_APORTES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
          SQL.Add('WHERE');
          SQL.Add('("col$colocacion".ID_PERSONA = :documento) AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN(7,8,5,4))');
          SQL.Add('ORDER BY');
          SQL.Add('"col$colocacion".ID_ESTADO_COLOCACION');
          ParamByName('documento').AsString := JVdocumento.Text;
          Open;
          while not Eof do
          begin
              saldo := FieldByName('saldo').AsCurrency;
              saldo_total := saldo_total + saldo;
             CDcolocacion.Append;
             CDcolocacion.FieldValues['colocacion'] := FieldByName('ID_COLOCACION').AsString;
             if saldo = 0 then
                CDcolocacion.FieldValues['valor'] := '$0'
             else
                CDcolocacion.FieldValues['valor'] := FormatCurr('$#,#',saldo);
             CDcolocacion.FieldValues['fecha_interes'] := FieldByName('FECHA_INTERES').AsDateTime;
             CDcolocacion.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
             if FieldByName('RECIPROCIDAD').AsInteger > 0 then
               CDcolocacion.FieldValues['reciprocidad'] := FieldByName('RECIPROCIDAD').AsInteger
             else
               CDcolocacion.FieldValues['reciprocidad'] := FieldByName('VECES_APORTES').AsInteger;
             CDcolocacion.Post;
             CDtitulo.Append;
             CDtitulo.FieldValues['titulo'] := 'CREDITOS VIGENTES';
             CDtitulo.FieldValues['pagare'] := 'PAGARE No.';
             CDtitulo.FieldValues['fecha'] := 'FECHA INTERES';
             CDtitulo.FieldValues['estado'] := 'ESTADO ACTUAL';
             CDtitulo.FieldValues['saldo'] := 'SALDO ACTUAL';
             CDtitulo.Post;
             Next;
          end;
          Close;
          CDcolocacion.First;
        end;
        SaldoDeuda.Value := saldo_total;
end;

procedure TfrmLiquidacionGral.fianzas;
var     saldo :Currency;
begin
        with IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select "col$colocacion".ID_COLOCACION,("col$colocacion".VALOR_DESEMBOLSO-"col$colocacion".ABONOS_CAPITAL) AS SALDO,"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "col$colgarantias"');
          SQL.Add('inner join "col$colocacion" ON ("col$colocacion".ID_AGENCIA = "col$colgarantias".ID_AGENCIA and');
          SQL.Add('"col$colocacion".ID_COLOCACION = "col$colgarantias".ID_COLOCACION)');
          SQL.Add('inner join "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('left join "gen$persona" ON ( "col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('where "col$colgarantias".ID_PERSONA = :ID_PERSONA AND');
          SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION NOT IN(7,8,5,4))');
          ParamByName('ID_PERSONA').AsString := JVdocumento.Text;
          Open;
          while not Eof do
          begin
             saldo := FieldByName('saldo').AsCurrency;
             CDfianzas.Append;
             CDfianzas.FieldValues['fianza'] := FieldByName('ID_COLOCACION').AsString;
             if saldo = 0 then
                CDfianzas.FieldValues['valor'] := '$0'
             else
                CDfianzas.FieldValues['valor'] := FormatCurr('$#,#',saldo);
             CDfianzas.FieldValues['fecha_interes'] := FieldByName('FECHA_INTERES').AsDateTime;
             CDfianzas.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
             CDfianzas.Post;
             Next;
          end;
          Close;
        end;
end;

procedure TfrmLiquidacionGral.JVdocumentoExit(Sender: TObject);
begin
        PageControl1.ActivePage := TabSheet1;
        if JVdocumento.Text <> '' then
        begin
        periodo := 30;
        formapago := 'MENSUAL';

        with IBdatos do
         begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"cap$tipocaptacion".SALDO_MINIMO');
           SQL.Add('FROM');
           SQL.Add('"cap$tipocaptacion"');
           SQL.Add('WHERE');
           SQL.Add('("cap$tipocaptacion".ID_TIPO_CAPTACION = 1)');
           Open;
           MinAportes := FieldByName('SALDO_MINIMO').AsCurrency;
           Close;
         end;

        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"cap$maestro".NUMERO_CUENTA,');
          SQL.Add('"cap$maestro".DIGITO_CUENTA,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".ID_ESTADO,');
          SQL.Add('"gen$persona".EDUCACION');
          SQL.Add('FROM');
          SQL.Add('"cap$maestro"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('WHERE');
          SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = 1) AND');
          SQL.Add('("cap$maestro".ID_ESTADO = 1)');
          ParamByName('id_persona').AsString := JVdocumento.Text;
          ExecQuery;
          if RecordCount <> 0 then
          begin
            JVnombres.Text := FieldByName('nombre').AsString + ' ' + FieldByName('primer_apellido').AsString;
            Capacitacion.Checked := IntToBool(FieldByName('educacion').AsInteger);
            Direccion.Text := '20'+ IntToStr(Agencia) +'-'+Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
            numero_cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
            digito_cuenta := FieldByName('DIGITO_CUENTA').AsInteger;
            colocaciones;
            fianzas;
            if CDcolocacion.RecordCount = 0 then
               CHdescuentos.Enabled := False
            else
            begin
               CHdescuentos.Enabled := True;
               CHdescuentos.Checked := True;
            end;
            //JVtotal.Value := aportes;
            JVtotal.Value := 0;
            total.Value := 0;
          end
          else
          begin
             MessageDlg('No se Encuentra Registrado Favor, Digite su Nombre',mtInformation,[mbok],0);
//             JVtotal.Value := MinAportes;
             JVtotal.Value := 0;
             JVnombres.SetFocus;
             JVnombres.BorderStyle := bsSingle;
          end;
        end;
        JVdocumento.TabStop := False;
        end
        else
        JVdocumento.SetFocus;
end;

procedure TfrmLiquidacionGral.MInversionKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Rmensual.SetFocus
end;

procedure TfrmLiquidacionGral.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction3.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction1.StartTransaction;
        IBTransaction3.StartTransaction;
        PageControl1.ActivePage := TabSheet1;
        CDcredito.Append;
        CDcredito.FieldValues['titulo1'] := 'INORMACION CREDITO';
        CDcredito.FieldValues['titulo2'] := 'DESCUENTOS';
        CDcredito.Post;
        IBlineas.Database := dmGeneral.IBDatabase1;
        IBlineas.Transaction := dmGeneral.IBTransaction1;
        IBConsulta.Database := dmGeneral.IBDatabase1;
        IBConsulta.Transaction := dmGeneral.IBTransaction1;
        IBlineas.Open;
        IBlineas.Last;
        AportesAnt := 0;
end;

procedure TfrmLiquidacionGral.RmensualClick(Sender: TObject);
begin
        periodo := 30;
        formapago := 'MENSUAL';
end;

procedure TfrmLiquidacionGral.RbimensualClick(Sender: TObject);
begin
        formapago := 'BIMENSUAL';
        periodo := 60
end;

procedure TfrmLiquidacionGral.RtrimestralClick(Sender: TObject);
begin
        formapago := 'TRIMESTRAL';
        periodo := 90
end;

procedure TfrmLiquidacionGral.RsemestralClick(Sender: TObject);
begin
        formapago := 'SEMESTRAL';
        periodo := 180

end;

procedure TfrmLiquidacionGral.RanualClick(Sender: TObject);
begin
        formapago := 'ANUAL';
        periodo := 360
end;

procedure TfrmLiquidacionGral.JVvalorExit(Sender: TObject);
var    valoraportes :Currency;
begin
        try
//          valoraportes := AportesAnt + SimpleRoundTo(JVvalor.Value / veces_aportes,0);
          valoraportes := 0;
        except
          valoraportes := 0;
        end;
        if valoraportes > JVtotal.Value then
          AportesS.Value := SimpleRoundTo(valoraportes - JVtotal.Value + descuento(1),0) // opcional
        else
          AportesS.Value := descuento(1);
//        Seguro.Value := SimpleRoundTo(JVvalor.Value * (descuento(2)/100),0);
end;

procedure TfrmLiquidacionGral.TotalEnter(Sender: TObject);
begin
        Total.Value := JVvalor.Value - (Intereses.Value + Seguro.Value + SaldoDeuda.Value + +AportesS.Value);
end;

procedure TfrmLiquidacionGral.BTcerrarClick(Sender: TObject);
begin
        Close;

end;

procedure TfrmLiquidacionGral.nuevo;
begin
        JVdocumento.Clear;
        JVnombres.Clear;
        DBlinea.KeyValue := -1;
        JVtotal.Value := 0;
        Direccion.Clear;
        Seguro.Value := 0;
        Capacitacion.State := cbGrayed;
        AportesS.Value := 0;
        SaldoDeuda.Value := 0;
        Intereses.Value := 0;
        Total.Value := 0;
        JVvalor.Value := 0;
        JVinteres.Value := 0;
        JVamortiza.Value := 0;
        ainteres.Enabled := True;
        Ainteres.Value := 0;
        plazo.Clear;
//        MInversion.Clear;
        TipoCuota.ItemIndex := -1;
        JVvalorcuota.Value := 0;
        CDcolocacion.CancelUpdates;
        CDfianzas.CancelUpdates;
        CDtitulo.CancelUpdates;
        codeudor.CancelUpdates;
        conyugue.CancelUpdates;
        solicitante.CancelUpdates;
        CDrequisitos.CancelUpdates;
        solicitante.CancelUpdates;
        PageControl1.ActivePage := TabSheet1;
        AportesAnt := 0;
        JVdocumento.SetFocus;
end;

procedure TfrmLiquidacionGral.BTnuevoClick(Sender: TObject);
begin
       Panel1.Enabled := True;
       nuevo;
end;

procedure TfrmLiquidacionGral.MInversionExit(Sender: TObject);
begin
//        MInversion.Text := UpperCase(MInversion.Text)
end;

function TfrmLiquidacionGral.CuotaFija(Valor: Currency; Plazo: Integer;
  TasaE: Single; Amortiza: Integer): Currency;
var Cuota,Cuota1: Currency;
begin
        Cuota := Valor * FactorCuota(TasaE,Plazo,Amortiza);
        Cuota := Cuota / 1000;
        Cuota1 := Int(Cuota);
        Cuota := Frac(Cuota);
        Result := Cuota1 * 1000;
        if Cuota <> 0 then Result := Result + 1000;
end;
function TfrmLiquidacionGral.CuotaVariable(Valor: Currency; Plazo: Integer;
  TasaE: Single; Amortiza: Integer): Currency;
var Cuota,Cuota1: Currency;
begin
        Cuota := Valor / (Plazo/Amortiza);
        Cuota := Cuota / 1000;
        Cuota1 := Int(Cuota);
        Cuota := Frac(Cuota);
        Result := Cuota1 * 1000;
        if Cuota <> 0 then Result := Result + 1000;
end;

function TfrmLiquidacionGral.FactorCuota(TasaE: Single; Plazo,
  Amortiza: Integer): Single;
var N:Extended;
    I:Single;
    Potencia:Single;
begin
         N:=(Plazo div 30)/(Amortiza/30);
         I:=TasaNominalVencida(TasaE,Amortiza);
         Amortiza := Amortiza div 30;
         I:=((I/100)/12) * Amortiza;
         Potencia := power((1+I),N);
         Result := (I*Potencia)/(Potencia-1);
end;

function TfrmLiquidacionGral.TasaNominalVencida(TasaE: Single;
  Amortiza: Integer): Single;
var Potencia:Single;
    Factor:Double;
begin
        if Amortiza < 30 then Amortiza := 30;
        Factor := Amortiza / 30;
        Factor := 12 / Factor;
        Potencia := power(1+(TasaE/100),(1/Factor));
        Potencia := ((Potencia-1)*Factor*100);
        Result := SimpleRoundTo(Potencia,-2);
end;

procedure TfrmLiquidacionGral.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frCompositeReport1.DoublePass := True;
        frCompositeReport1.Reports.Clear;
        frCompositeReport1.Reports.Add(frReport1);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TfrmLiquidacionGral.BTgraficoClick(Sender: TObject);
var    valor1,valor2 :Currency;
begin
        CDopcion.CancelUpdates;
        if TipoCuota.ItemIndex = 0 then
        begin
           try
           valor1 := cuotafija(JVvalor.Value,plazo.Value,jvinteres.Value,periodo)
           except
           valor1 := 0;
           end;
           try
           valor2 := cuotafija(JVvalor.Value,plazo.Value,jvinteres.Value,periodo);
           except
           valor2 := 0;
           end;
        end
        else
        begin
           try
           valor1 := cuotavariable(JVvalor.Value,plazo.Value,JVinteres.Value,periodo);
           except
           valor1 := 0;
           end;
           try
           valor2 := cuotavariable(JVvalor.Value,plazo.Value,JVinteres.Value,periodo);
           except
           valor2 := 0;
           end;
        end;

        if valor1 <> 0 then
        begin
          CDopcion.Append;
          if TipoCuota.ItemIndex = 1 then
          CDopcion.FieldValues['inter'] := ' + interes'
          else
          CDopcion.FieldValues['inter'] := '';
          CDopcion.FieldValues['descripcion'] := 'OPCION 2: CON UNPLAZO DE '+IntToStr(plazo.Value)+' DIAS ';
          CDopcion.FieldValues['valor'] := valor1;
          CDopcion.Post;
        end;
        if valor2 <> 0 then
        begin
          CDopcion.Append;
          if TipoCuota.ItemIndex = 1 then
          CDopcion.FieldValues['inter'] := ' + interes'
          else
          CDopcion.FieldValues['inter'] := '';
          CDopcion.FieldValues['descripcion'] := 'OPCION 3: CON UNPLAZO DE '+IntToStr(plazo.Value)+' DIAS';
          CDopcion.FieldValues['valor'] := valor2;
          CDopcion.Post;
        end;
//        imprimir_reporte(frmMain.path+'/reporte/repgrafico.frf');
end;

procedure TfrmLiquidacionGral.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        Empleado;
        if ParName = 'nit' then
           ParValue := Nit;
        if ParName = 'nombres' then
           ParValue := JVnombres.Text;
        if ParName = 'aportesf' then
           ParValue := FormatCurr('#,#',JVtotal.Value);
        if ParName = 'vsolicitado' then
           ParValue := JVvalor.Value;
        if ParName = 'vcuota' then
           ParValue := JVvalorcuota.Value;
        if ParName = 'fpago' then
           ParValue := formapago;
        if ParName = 'plazo' then
           ParValue := plazo.Value;
        if ParName = 'tcuota' then
        begin
          if TipoCuota.ItemIndex = 0 then
             ParValue := 'FIJA'
          else
             ParValue := 'VARIABLE';
        end;
        if ParName = 'interes' then
           ParValue := JVinteres.Value;
//        if ParName = 'inversion' then
//           ParValue := MInversion.Text;
        if ParName = 'codeudores' then
           ParValue := NUMEROS[0]+'('+IntToStr(0)+')';
        if ParName = 'vtotal' then
           ParValue := Total.Value;
        if ParName = 'seguro' then
           ParValue := Seguro.Value;
        if ParName = 'aportess' then
           ParValue := AportesS.Value;
        if ParName = 'dinteres' then
           ParValue := Intereses.Value;
        if ParName = 'saldodeuda' then
           ParValue := SaldoDeuda.Value;
        if ParName = 'estudio' then
           ParValue := 0;
        if ParName = 'linea' then
           ParValue := Linea;
        if ParName = 'interess' then
           ParValue := interesess;
        if ParName = 'empleado' then
           ParValue := Nombres + ' '+Apellidos;

end;

procedure TfrmLiquidacionGral.TipoCuotaClick(Sender: TObject);
var
vTasaMensual:Double;
vCuota:Currency;
DiasInteresAnt:Integer;
begin
        vCuota := 0;
        try
        if (TipoCuota.ItemIndex = 0) or (TipoCuota.ItemIndex = 2) then
         begin
           if DBlinea.KeyValue = 13 then
           begin
             dmColocacion := TdmColocacion.Create(Self);
             if dmColocacion.IBDSclasificacion.Transaction.InTransaction then
               dmColocacion.IBDSclasificacion.Transaction.Rollback;
             dmColocacion.IBDSclasificacion.Transaction.StartTransaction;
             vCuota := CuotaFijaP(JVvalor.Value,plazo.Value,JVinteres.Value,Ainteres.Value);
             CuotaLineaP(JVvalor.Value,vCuota,JVinteres.Value,JvAmortiza.Value,
                          Ainteres.Value,plazo.Value,'F','V',IBSQL3,DiasInteresAnt);
             JVvalorcuota.Value := vCuota;

             dmColocacion.IBDSclasificacion.Transaction.Commit;
             dmColocacion.Free;
           end  //Fin CBLinea = 13
           else
             JVvalorcuota.Value := CuotaFija(JVvalor.Value,plazo.Value,jvinteres.Value,Ainteres.Value);

           Intereses.Value := 0;
           vTasaMensual := TasaNominalVencida(JVinteres.Value,Ainteres.Value);
           Ainteres.Enabled := False;
        end //
        else
        begin

           if DBlinea.KeyValue = 13 then
           begin
             dmColocacion := TdmColocacion.Create(Self);
             if dmColocacion.IBDSclasificacion.Transaction.InTransaction then
               dmColocacion.IBDSclasificacion.Transaction.Rollback;
             dmColocacion.IBDSclasificacion.Transaction.StartTransaction;
             vCuota := CuotaVariableP(JVvalor.Value,plazo.Value,JVinteres.Value,Ainteres.Value);
             CuotaLineaP(JVvalor.Value,vCuota,JVinteres.Value,JvAmortiza.Value,
                          Ainteres.Value,plazo.Value,'V','A',IBSQL3,DiasInteresAnt);
             JVvalorcuota.Value := vCuota;


             dmColocacion.IBDSclasificacion.Transaction.Commit;
             dmColocacion.Free;

             vTasaMensual := TasaNominalAnticipada(jvinteres.Value,Ainteres.Value);
             Intereses.Value := SimpleRoundTo(JVvalor.Value * (vTasaMensual/100) * DiasInteresAnt/360,0);
             Ainteres.Enabled := True;
           end //
           else
           begin
            JVvalorcuota.Value := cuotavariable(JVvalor.Value,plazo.Value,JVinteres.Value,Ainteres.Value);
            vTasaMensual := TasaNominalAnticipada(jvinteres.Value,Ainteres.Value);
            Intereses.Value := SimpleRoundTo(JVvalor.Value * (vTasaMensual/100) * Ainteres.Value/360,0);
            Ainteres.Enabled := True;
           end;
        end;
        except
        MessageDlg('Favor Verificar los Campos',mtError,[mbok],0);
        end;
end;

procedure TfrmLiquidacionGral.BTtextualClick(Sender: TObject);
begin
        frmVistaPreliminar := TfrmVistaPreliminar.Create(self);
//        PRreport.LoadTemplateFromFile(frmMain.wpath+'reporte\reporte_t.prt',False);
        PRreport.Variables.ByName['nit'].AsString := Nit;
        PRreport.Variables.ByName['empresa'].AsString := Empresa;
        PRreport.Variables.ByName['nombre'].AsString := JVnombres.Text;
        PRreport.Variables.ByName['aportes'].AsString := FormatCurr('#,#0',JVtotal.Value);
        PRreport.Variables.ByName['codeudores'].AsString := NUMEROS[0]+'('+IntToStr(0)+')';
        PRreport.Variables.ByName['vsolicitado'].AsString := FormatCurr('#,#0',JVvalor.Value);
        PRreport.Variables.ByName['vcuota'].AsString := FormatCurr('#,#0',JVvalorcuota.Value);
        PRreport.Variables.ByName['fpago'].AsString := formapago;
        PRreport.Variables.ByName['plazo'].AsString := IntToStr(plazo.Value);
        PRreport.Variables.ByName['aportess'].AsString := FormatCurr('#,#0',AportesS.Value);
        PRreport.Variables.ByName['sdeuda'].AsString := FormatCurr('#,#0',SaldoDeuda.Value);
        PRreport.Variables.ByName['credito'].AsString := FormatCurr('#,#0',0);
        PRreport.Variables.ByName['seguro'].AsString := FormatCurr('#,#0',Seguro.Value);
        PRreport.Variables.ByName['dinteres'].AsString := FormatCurr('#,#0',intereses.Value);
        PRreport.Variables.ByName['ttotal'].AsString := FormatCurr('#,#0',Total.Value);
        PRreport.Variables.ByName['tdescuento'].AsString := FormatCurr('#,#0',(JVvalor.Value - Total.Value));
        PRreport.Variables.ByName['interesess'].AsString := interesess;
        PRreport.Variables.ByName['linea'].AsString := linea;
        Empleado;
        PRreport.Variables.ByName['empleado'].AsString := Apellidos + ' '+ Nombres;
        if TipoCuota.ItemIndex = 0 then
          PRreport.Variables.ByName['tcuota'].AsString := 'FIJA'
        else
          PRreport.Variables.ByName['tcuota'].AsString := 'VARIABLE';
        PRreport.Variables.ByName['interes'].AsString := CurrToStr(JVinteres.Value);
//        PRreport.Variables.ByName['inversion'].AsString := MInversion.Text;
        PRreport.Variables.ByName['fecha'].AsString := FormatDateTime('dd "de" mmm-yyyy',Date);
        if PRreport.PrepareReport then
        begin
          frmVistaPreliminar.Reporte := prreport;
          frmVistaPreliminar.ShowModal;
        end;

end;

function TfrmLiquidacionGral.descuento(entrada: integer): currency;
begin
        with IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          case entrada of
            1: SQL.Add('"col$descuentos".VALOR_DESCUENTO as valor');
            2: SQL.Add('"col$descuentos".PORCENTAJE_COLOCACION as valor');
           end;
          SQL.Add('FROM');
          SQL.Add('"col$descuentos"');
          SQL.Add('WHERE');
          SQL.Add('("col$descuentos".ID_DESCUENTO = :id)');
          ParamByName('id').AsInteger := entrada;
          Open;
          Result := FieldByName('valor').AsCurrency;
          Close;
        end;
end;

function TfrmLiquidacionGral.busca_cuenta(opcion, nit: string): integer;
begin
           with IBConsulta do
           begin
              Close;
              SQL.Clear;
              SQL.Add('select "cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
              SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA) AND ("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION)');
              SQL.Add('where');
              SQL.Add('"cap$maestrotitular".ID_AGENCIA = :"ID_AGENCIA"');
              SQL.Add('and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA');
              SQL.Add('and "cap$maestrotitular".NUMERO_TITULAR  = 1  and');
              SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1 and');
              SQL.Add('("cap$maestro".ID_ESTADO = 1)');
              ParamByName('ID_PERSONA').AsString := nit;
              ParamByName('ID_AGENCIA').AsInteger := 1;
              Open;
              case StrToInt(opcion) of
              1 : Result := FieldByName('NUMERO_CUENTA').AsInteger;
              2 : Result := FieldByName('DIGITO_CUENTA').AsInteger;
              end;
              Close;
           end;
end;

procedure TfrmLiquidacionGral.DBlineaExit(Sender: TObject);
var     a,b :Integer;
        cad :string;
        SaldoC:string;
        SaldoCol :Currency;        
begin
        Panel1.Enabled := False;
        linea := DBlinea.Text;
        a := StrLen(PChar(linea));
        for b := 0 to a do
        begin
          cad := MidStr(linea,b,1);
          if cad = ' ' then
          begin
            linea := MidStr(linea,1,b+1);
            Break;
          end;
        end;

        a := DBlinea.KeyValue;
        with IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$lineas".VECES_APORTES,TASA,CAPITALIZACION_ACUMULADA');
          SQL.Add('FROM');
          SQL.Add('"col$lineas"');
          SQL.Add('WHERE');
          SQL.Add('("col$lineas".ID_LINEA = :id_linea)');
          try
            ParamByName('id_linea').AsInteger := DBlinea.KeyValue;
          except
          begin
            MessageDlg('El Campo Lineas no Puede ser Nulo',mtinformation,[mbok],0);
            DBlinea.SetFocus;
          end;
          end;
           Open;
          veces_aportes := FieldByName('VECES_APORTES').AsVariant;
          JVinteres.Value := SimpleRoundTo(FieldByName('TASA').AsCurrency,-2);
          if FieldByName('CAPITALIZACION_ACUMULADA').AsInteger = 1 then begin
            with CDcolocacion do begin
              CDcolocacion.First;
              while not Eof do begin
                SaldoC := StringReplace(FieldByName('VALOR').AsString,'$','',[rfreplaceall]);
                SaldoC := StringReplace(SaldoC,',','',[rfreplaceall]);
                SaldoCol := StrToCurr(SaldoC);
                AportesAnt := AportesAnt + SimpleRoundTo(SaldoCol / FieldByName('RECIPROCIDAD').AsInteger ,0);
                Next;
              end;
            end;
          end;
//          AportesAnt := AportesAnt + MinAportes;
          Close;
 
          if (DBlinea.KeyValue = 3) and (Capacitacion.Checked = False) then
            MessageDlg('Para Acceder a Linea Social debe poseer Educación Cooperativa',mtinformation,[mbok],0);

          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 5');
          Open;
          seguro.Value := FieldByName('VALOR_MINIMO').AsCurrency;
          Close;
        end;
end;

procedure TfrmLiquidacionGral.AinteresExit(Sender: TObject);
begin
        //Intereses.Value := SimpleRoundTo(JVvalor.Value * (TasaNominalAnticipada(jvinteres.Value,periodo)/100) * periodo/360,0);
end;

procedure TfrmLiquidacionGral.JVamortizaExit(Sender: TObject);
begin
        periodo := JVamortiza.Value
end;

procedure TfrmLiquidacionGral.JVamortizaEnter(Sender: TObject);
begin
        JVamortiza.SelectAll;
end;

procedure TfrmLiquidacionGral.AinteresEnter(Sender: TObject);
begin
        Ainteres.SelectAll;
end;

procedure TfrmLiquidacionGral.JVvalorEnter(Sender: TObject);
begin
        JVvalor.SelectAll;
end;

procedure TfrmLiquidacionGral.plazoEnter(Sender: TObject);
begin
        plazo.SelectAll;
end;

procedure TfrmLiquidacionGral.CHdescuentosClick(Sender: TObject);
begin
        if CHdescuentos.Checked then
           saldodeuda.Value := saldo_total
        else
           saldodeuda.Value := 0;
        TotalEnter(Self);
end;

procedure TfrmLiquidacionGral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.





















