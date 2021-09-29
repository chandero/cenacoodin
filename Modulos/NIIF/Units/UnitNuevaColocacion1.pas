{ TODO :
Falta adicionar comprobación de deudas existentes
para el calculo del valor real del descuento de aportes }
unit UnitNuevaColocacion1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, Buttons, Grids, DB,
  DateUtils,StrUtils, Math, pr_Common, pr_TxClasses, pr_Parser,
  IBCustomDataSet, IBQuery, CommCtrl, IBSQL, DBGrids, IBDatabase, ImgList;

type
  TfrmNuevaColocacion1 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CBtiposid: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    EdNombre: TEdit;
    EdNumeroIdentificacion: TMemo;
    GroupBox3: TGroupBox;
    Panel4: TPanel;
    CmdGrabar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdNuevo: TBitBtn;
    CmdVerTabla: TBitBtn;
    CmdInforme: TBitBtn;
    IBQuerycolocacion: TIBQuery;
    IBQuerycontable: TIBQuery;
    IBQueryGarPersonal: TIBQuery;
    IBQueryGarReal: TIBQuery;
    IBQuerytabla: TIBQuery;
    IBQuerytablaID_COLOCACION: TIBStringField;
    IBQuerytablaCUOTA_NUMERO: TIntegerField;
    IBQuerytablaFECHA_A_PAGAR: TDateField;
    IBQuerytablaCAPITAL_A_PAGAR: TIBBCDField;
    IBQuerytablaINTERES_A_PAGAR: TIBBCDField;
    IBQuerytablaTOTALCUOTA: TIBBCDField;
    IBSQL1: TIBSQL;
    CmdCrearPersona: TBitBtn;
    IBSQL2: TIBSQL;
    Report: TprTxReport;
    IBConsecutivo: TIBSQL;
    IBTConsecutivo: TIBTransaction;
    IBDescuentos: TIBQuery;
    IBSQL3: TIBSQL;
    Label30: TLabel;
    ComboSolicitud: TComboBox;
    GroupBox2: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    EdClasificacion: TStaticText;
    EdLinea: TStaticText;
    EdInversion: TStaticText;
    EdRespaldo: TStaticText;
    EdGarantia: TStaticText;
    EdValorColocacion: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    EdTasaVariable: TStaticText;
    EdPuntos: TStaticText;
    StaticText4: TStaticText;
    EdTipoCuota: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText9: TStaticText;
    EdEnteAprobador: TStaticText;
    EdCuentaAportes: TStaticText;
    Label9: TLabel;
    EdFechaDesembolso: TDateTimePicker;
    EdFechaPago: TDateTimePicker;
    Label4: TLabel;
    Label18: TLabel;
    EdNumeroColocacion: TEdit;
    Label19: TLabel;
    EdFechaVencimiento: TDateTimePicker;
    Label20: TLabel;
    EdFechaCapital: TDateTimePicker;
    Label21: TLabel;
    EdFechaInteres: TDateTimePicker;
    ControlGarantias: TPageControl;
    InfoAdmisible: TTabSheet;
    Panel2: TPanel;
    DBGridReal: TDBGrid;
    InfoNoAdmisibles: TTabSheet;
    Panel3: TPanel;
    DBGridPersonal: TDBGrid;
    ImageList1: TImageList;
    Label5: TLabel;
    GroupBox4: TGroupBox;
    Label36: TLabel;
    ControlDescuentos: TPageControl;
    DtoTotal: TTabSheet;
    DtoCuotas: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdNumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdValorDesembolsoKeyPress(Sender: TObject; var Key: Char);
    procedure EdPlazoKeyPress(Sender: TObject; var Key: Char);
    procedure CmdPerAgregarClick(Sender: TObject);
    procedure CmdHipAgregarClick(Sender: TObject);
    procedure EdTasaEfectivaKeyPress(Sender: TObject; var Key: Char);
    procedure EdTasaMoraKeyPress(Sender: TObject; var Key: Char);
    procedure EdAmortizaCapitalKeyPress(Sender: TObject; var Key: Char);
    procedure EdAmortizaInteresKeyPress(Sender: TObject; var Key: Char);
    procedure EdValorCuotaKeyPress(Sender: TObject; var Key: Char);
    procedure EdValorDesembolsoExit(Sender: TObject);
    procedure EdAmortizaInteresExit(Sender: TObject);
    procedure EdPlazoExit(Sender: TObject);
    procedure EdTasaEfectivaExit(Sender: TObject);
    procedure EdTasaMoraExit(Sender: TObject);
    procedure CBtipocuotaExit(Sender: TObject);
    procedure EdAmortizaCapitalExit(Sender: TObject);
    procedure EdTasaNominalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdTasaEfectivaEnter(Sender: TObject);
    procedure EdTasaMoraEnter(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure CBclasificacionEnter(Sender: TObject);
    procedure CBlineaEnter(Sender: TObject);
    procedure CBinversionEnter(Sender: TObject);
    procedure CBrespaldoEnter(Sender: TObject);
    procedure CBgarantiaEnter(Sender: TObject);
    procedure CBtipocuotaEnter(Sender: TObject);
    procedure EdValorDesembolsoEnter(Sender: TObject);
    procedure EdAmortizaCapitalEnter(Sender: TObject);
    procedure EdAmortizaInteresEnter(Sender: TObject);
    procedure EdPlazoEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGrabarClick(Sender: TObject);
    procedure CBtiposidExit(Sender: TObject);
    procedure CBclasificacionExit(Sender: TObject);
    procedure CBlineaExit(Sender: TObject);
    procedure CBinversionExit(Sender: TObject);
    procedure CBrespaldoExit(Sender: TObject);
    procedure CBgarantiaExit(Sender: TObject);
    procedure EdFechaDesembolsoExit(Sender: TObject);
    procedure CmdVerTablaClick(Sender: TObject);
    procedure EdPeriodoGraciaExit(Sender: TObject);
    procedure EdPeriodoGraciaEnter(Sender: TObject);
    procedure EdPuntosAdicionalesEnter(Sender: TObject);
    procedure EdPuntosAdicionalesExit(Sender: TObject);
    procedure EdPuntosAdicionalesKeyPress(Sender: TObject; var Key: Char);
    procedure EdPeriodoGraciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdTipoTasaExit(Sender: TObject);
    procedure CBtasavariableClick(Sender: TObject);
    procedure EdTipoTasaEnter(Sender: TObject);
    procedure CBEnteAprobadorEnter(Sender: TObject);
    procedure CBEnteAprobadorExit(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure ReportUnknownObjFunction(Sender: TObject;
      Component: TComponent; const FuncName: String;
      const Parameters: TprVarsArray; ParametersCount: Integer;
      var Value: TprVarValue; var IsProcessed: Boolean);
    procedure CmdCrearPersonaClick(Sender: TObject);
    procedure EdNumeroColocacion2Exit(Sender: TObject);
    procedure CBEnteAprobadorKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroColocacion2KeyPress(Sender: TObject; var Key: Char);
    procedure GridPersonalSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CmdPerEliminarClick(Sender: TObject);
    procedure GridRealSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CmdHipEliminarClick(Sender: TObject);
    procedure EdNombreExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CBtasavariableExit(Sender: TObject);
    procedure ComboSolicitudExit(Sender: TObject);
  private
    procedure Inicializar;
    procedure ActualizarGridPersonas;
    function NoExistePersona(tipo: Integer;numero: String): Boolean;
    procedure ActualizarGridReal;
    function NoExisteReal(Escritura: String): Boolean;
    function CrearColocacion:Boolean;
    procedure Contabilizar;
    function GrabarColocacion: Boolean;
    procedure GrabarGarantias;
    function VerificarAportesCreditosAnt(TipoIdentificacion:Integer;NumeroIdentificacion:String):Currency;
    function BuscarAportes(TipoId: integer; DocumentoId: string): Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNuevaColocacion1: TfrmNuevaColocacion1;
  posgrid : integer;

implementation

{$R *.dfm}

uses UnitdmColocacion, UnitdmGeneral, UnitGlobales, UnitGlobalesCol,UnitGarantiaPersonal, UnitGarantiaReal,
     UnitTablaPagoColocacion,UnitCreaciondePersona;

type
   PGaPer = ^AGaPer;
   AGaPer = record
      TipoId:Integer;
      NumeroId:String;
      Apellidos:String;
      Nombres:String;
   end;

type
   PGaReal = ^AGaReal;
   AGaReal = record
        Escritura:String;
        FechaEscritura:TDate;
        Notaria:String;
        CiudadEscritura:String;
        Matricula:String;
        FechaRegistro:TDate;
        ValorAvaluo:Currency;
        FechaAvaluo:TDate;
        CuentasOrden:Currency;
        FechaIPoliza:TDate;
        FechaFPoliza:TDate;
        ValorAsegurado:Currency;
        Poliza:String;
        CodigoAseguradora:String;
   end;


var
    vIdColocacion:String;
    vTipoId:Integer;
    vNumeroId:String;
    vSolicitud : string;
    vClasificacion:Integer;
    vLinea:Integer;
    vInversion:Integer;
    vRespaldo:Integer;
    vGarantia:Integer;
    vFechaDesembolso:TDate;
    vDesembolso:Currency;
    vPlazo:Integer;
    vTipoTasa:String;
    vTasaVariable:Integer;
    vPuntosAdicionales:Single;
    vTasaEfectiva:Single;
    vTasaMora:Single;
    vTipoCuota:Integer;
    vAmortizaCapital:Integer;
    vAmortizaInteres:Integer;
    vPeriodoGracia:Integer;
    vValorCuota:Currency;
    vNumeroColocacion:String;
    vFechaVencimiento:TDate;
    vFechaCapital:TDate;
    vFechaInteres:TDate;
    vTasaNominal:Single;
    vEnteAprobador:Integer;
    vNotaContable:string;
    vCtaAportes:Integer;
    vDigitoCta:Integer;    

    vCapitalVencido:String;
    vInteresVencido:String;
    vCuotaTipo:String;

{ Variables de Descuentos que se aplican al desembolso}
//    vDctoAportes:Currency;
//    vDctoPapeleria:Currency;
//    vDctoSeguro:Currency;
    vDctoCapitalizacion:Currency;
{fin Variables de Descuento}
{ Otras }
    vTotalDeudas:Currency;
    vCortoPlazo:Currency;
    vLargoPlazo:Currency;
    vInteresAnticipado:Currency;
{ fin Otras }

    Consecutivo:Integer;

    LGarPer : TList;
    LGarReal: TList;

    TableName:String;
    TableCont:String;

    Saldo:Currency;

procedure TfrmNuevaColocacion1.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmNuevaColocacion1.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmNuevaColocacion1.CmdCerrarClick(Sender: TObject);
begin
        Self.Close;
end;

procedure TfrmNuevaColocacion1.EdNumeroIdentificacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmNuevaColocacion1.EdValorDesembolsoKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmNuevaColocacion1.EdPlazoKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmNuevaColocacion1.CmdPerAgregarClick(Sender: TObject);
var frmGarantiaPersonal:TfrmGarantiaPersonal;
    ARecord : PGaPer;
begin
        frmGarantiaPersonal := TfrmGarantiaPersonal.Create(Self);
        if frmGarantiaPersonal.ShowModal = mrOK then
        begin
                try
                 with frmGarantiaPersonal do
                  begin
                  if NoExistePersona(tipoid,numeroid) = true then
                  begin
                  New(ARecord);
                  ARecord^.TipoId := tipoid;
                  ARecord^.NumeroId := numeroid;
                  ARecord^.Apellidos := Apellidos;
                  ARecord^.Nombres := Nombres;
                  LGarPer.Add(ARecord);
                  end
                 end
                finally
                  frmGarantiaPersonal.Free;
                  ActualizarGridPersonas;
                end;
        end
        else
                  frmGarantiaPersonal.Free;

end;

procedure TfrmNuevaColocacion1.CmdHipAgregarClick(Sender: TObject);
var frmGarantiaReal:TfrmGarantiaReal;
    ARecord:PGaReal;
begin
        frmGarantiaReal := TfrmGarantiaReal.Create(Self);
        if frmGarantiaReal.ShowModal = mrOk then
        begin
                try
                 with frmGarantiaReal do
                  begin
                  if NoExisteReal(Escritura) = true then
                  begin
                  New(ARecord);
                  ARecord^.Escritura  := Escritura;
                  ARecord^.FechaEscritura := FechaEscritura;
                  ARecord^.Notaria := Notaria;
                  ARecord^.CiudadEscritura := CiudadEscritura;
                  ARecord^.Matricula := Matricula;
                  ARecord^.FechaRegistro := FechaRegistro;
                  ARecord^.ValorAvaluo := ValorAvaluo;
                  ARecord^.FechaAvaluo := FechaAvaluo;
                  ARecord^.CuentasOrden := CuentasOrden;
                  ARecord^.FechaIPoliza := FechaIPoliza;
                  ARecord^.FechaFPoliza := FechaFPoliza;
                  ARecord^.ValorAsegurado := ValorAsegurado;
                  ARecord^.Poliza := Poliza;
                  LGarReal.Add(ARecord);
                  end
                 end
                finally
                  frmGarantiaReal.Free;
                  ActualizarGridReal;
                end;
        end
        else
                  frmGarantiaPersonal.Free;
end;

procedure TfrmNuevaColocacion1.EdTasaEfectivaKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmNuevaColocacion1.EdTasaMoraKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmNuevaColocacion1.EdAmortizaCapitalKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmNuevaColocacion1.EdAmortizaInteresKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmNuevaColocacion1.EdValorCuotaKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmNuevaColocacion1.EdValorDesembolsoExit(Sender: TObject);
begin
          {if EdValorDesembolso.Text = '' then EdValorDesembolso.Text := '0';
          vDesembolso := StrToCurr(EdValorDesembolso.Text);
          if vDesembolso = 0 then
          begin
            MessageDlg('El Valor de la Colocación no puede ser $0',mtError,[mbOK],0);
            EdValorDesembolso.SetFocus;
          end
          else
          begin
          if vLinea = 7 then
           begin
             vPlazo := 2880;
             EdPlazo.Text := FormatCurr('#0',vPlazo);
             EdPlazo.Enabled := False;
             vTipoTasa := 'F';
             EdTipoTasa.SetFocus;
           end;
          end;

          EdValorDesembolso.Text := FormatCurr('#,##0',vDesembolso);}
end;

procedure TfrmNuevaColocacion1.EdAmortizaInteresExit(Sender: TObject);
begin
{        if EdAmortizaInteres.Text = '' then
           begin
             MessageDlg('La Amortización a Interes no puede ser 0 dias',mtError,[mbOK],0);
             EdAmortizaInteres.SetFocus;
             exit;
           end
        else
           begin
             vAmortizaInteres := StrToInt(EdAmortizaInteres.Text);
             EdAmortizaInteres.Text := FormatCurr('#0',vAmortizaInteres);
           end;}
end;

procedure TfrmNuevaColocacion1.EdPlazoExit(Sender: TObject);
begin
        {if EdPlazo.Text = '' then EdPlazo.Text := '0';
        vPlazo := StrToInt(EdPlazo.Text);
        if vPlazo = 0 then
        begin
           MessageDlg('El Plazo de la Colocación no puede ser 0 dias',mtError,[mbOK],0);
           EdPlazo.SetFocus;
        end;
        EdPlazo.Text := FormatCurr('#0',vPlazo); }
end;

procedure TfrmNuevaColocacion1.EdTasaEfectivaExit(Sender: TObject);
begin
        {if EdTasaEfectiva.Text = '' then EdTasaEfectiva.Text := '0.00';

        vTasaEfectiva := StrToFloat(EdTasaEfectiva.Text);
        if vTasaEfectiva = 0 then
        begin
           MessageDlg('La Tasa Efectiva no puede ser 0% ',mtError,[mbOK],0);
           EdTasaEfectiva.SetFocus;
           exit;
        end;
        EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva); }
end;

procedure TfrmNuevaColocacion1.EdTasaMoraExit(Sender: TObject);
begin
        {if EdTasaMora.Text = '' then EdTasaMora.Text := '0.00';
        vTasaMora := StrToFloat(EdTasaMora.Text);
        if vTasaMora = 0 then
        begin
           MessageDlg('La Tasa Mora no puede ser 0% ',mtError,[mbOK],0);
           EdTasaMora.SetFocus;
           exit;
        end;
        EdTasaMora.Text := FormatCurr('#0.00%',vTasaMora);}
end;

procedure TfrmNuevaColocacion1.CBtipocuotaExit(Sender: TObject);
begin
        {vTipoCuota := CBtipocuota.KeyValue;
        if DmColocacion.IBDStipocuota.Locate('ID_TIPOS_CUOTA',VarArrayOf([vTipoCuota]),[loCaseInsensitive]) = True then
        begin
           vCapitalVencido := DmColocacion.IBDStipocuota.FieldByName('CAPITAL').AsString;
           vInteresVencido := DMColocacion.IBDStipocuota.FieldByName('INTERES').AsString;
           vCuotaTipo := DMColocacion.IBDStipocuota.FieldByName('TIPO_CUOTA').AsString;
        end
        else
        begin
           vCapitalVencido := 'V';
           vInteresVencido := 'V';
           vCuotaTipo      := 'F';
        end;

        if vLinea = 7 then
         begin
           EdAmortizaCapital.Text := FormatCurr('#',vAmortizaCapital);
           EdAmortizaCapital.Enabled := False;
           vAmortizaInteres := 30;
           EdAmortizaInteres.Text := FormatCurr('#',vAmortizaInteres);
           EdAmortizaInteres.Enabled := False;
           EdPeriodoGracia.SetFocus;
         end;  }
end;

procedure TfrmNuevaColocacion1.EdAmortizaCapitalExit(Sender: TObject);
begin
        {if trim(EdAmortizaCapital.Text) = '' then
         begin
           MessageDlg('La Amortización a Capital no puede ser 0 dias',mtError,[mbOK],0);
           EdAmortizaCapital.SetFocus;
           exit;
         end
         else
         begin
           vAmortizaCapital := StrToInt(EdAmortizaCapital.Text);
           EdAmortizaCapital.Text := FormatCurr('#0',vAmortizaCapital);
         end;

        if vCuotaTipo = 'F' then
        begin
           vAmortizaInteres := vAmortizaCapital;
           EdAmortizaInteres.Text  := FormatCurr('#0',vAmortizaInteres);
           EdPeriodoGracia.SetFocus;
        end;    }
end;

procedure TfrmNuevaColocacion1.EdTasaNominalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        Key := 0;
end;

procedure TfrmNuevaColocacion1.EdTasaEfectivaEnter(Sender: TObject);
begin
        {EdTasaEfectiva.Text := FormatCurr('#0.00',vTasaEfectiva);
        EdTasaEfectiva.SelectAll;}
end;

procedure TfrmNuevaColocacion1.EdTasaMoraEnter(Sender: TObject);
begin
        {EdTasaMora.Text  := FormatCurr('#0.00',vTasaMora);
        EdTasaMora.SelectAll; }
end;

procedure TfrmNuevaColocacion1.Inicializar;
var I,J: Integer;
begin
    vTipoId := 1;
    vNumeroId := '';
    vSolicitud := '';
    vClasificacion := 1;
    vLinea := 1;
    vInversion := 1;
    vRespaldo := 1;
    vGarantia := 1;
    vFechaDesembolso := Date;
    vDesembolso := 0;
    vPlazo := 0;
    vTipoTasa := 'F';
    vTasaVariable := 0;
    vNotaContable := '';
    vPuntosAdicionales := 0;
    vTasaEfectiva := 0;
    vTasaMora := 0;
    vTipoCuota := 1;
    vAmortizaCapital := 0;
    vAmortizaInteres := 0;
    vPeriodoGracia := 0;
    vValorCuota := 0;
    vNumeroColocacion := '';
    vFechaVencimiento := Date;
    vFechaCapital := Date;
    vFechaInteres := Date;
    vTasaNominal := 0;
    vEnteAprobador := 1;

    vCapitalVencido := '';
    vInteresVencido := '';
    vCuotaTipo := '';
    vDctoCapitalizacion := 0;
    vTotalDeudas := 0;
    vCortoPlazo := 0;
    vLargoPlazo := 0;
    vInteresAnticipado := 0;
    Saldo := 0;

    //PageControl1.ActivePageIndex  := 0;
    Panel2.Enabled := true;
    Panel3.Enabled := true;
    GroupBox1.Enabled := true;
    GroupBox2.Enabled := false;
    GroupBox3.Enabled := false;
    GroupBox4.Enabled := false;

    DateTime_SetFormat(EdFechaVencimiento.Handle,'''''');
    DateTime_SetFormat(EdFechaCapital.Handle,'''''');
    DateTime_SetFormat(EdFechaInteres.Handle,'''''');

        with dmColocacion do
        begin
                IBDStiposid.Active := true;
                IBDStiposid.Last;
                IBDStiposid.First;
                IBDSclasificacion.Active := true;
                IBDSclasificacion.Last;
                IBDSclasificacion.First;
                IBDSlinea.Active := true;
                IBDSlinea.Last;
                IBDSlinea.First;
                IBDSinversion.Active := true;
                IBDSinversion.Last;
                IBDSinversion.First;
                IBDSrespaldo.Active := true;
                IBDSrespaldo.Last;
                IBDSrespaldo.First;
                IBDSgarantia.Active := true;
                IBDSgarantia.Last;
                IBDSgarantia.First;
//                IBDStipocuota.Active := true;
//                IBDStipocuota.Last;
//                IBDStipocuota.First;
                IBDStasavariable.Active := true;
                IBDStasavariable.Last;
                IBDStasavariable.First;
                IBDSenteaprobador.Active := true;
                IBDSenteaprobador.Last;
                IBDSenteaprobador.First;
        end;

    I := Self.ComponentCount -1;

    for J := 0 to I do
    begin
        if Self.Components[J] is TMemo then
           TMemo(Self.Components[J]).Text := ''
        else
        if Self.Components[J] is TDBLookupComboBox then
           TDBLookupComboBox(Self.Components[J]).KeyValue := -1
        else
        if Self.Components[J] is TEdit then
           TEdit(Self.Components[J]).Text := '';
        end;


        EdFechaDesembolso.Date := Date;

        //EdTipoTasa.ItemIndex := -1;
        //EdValorCuota.Caption := '';
        //EdNumeroColocacion.Text := '';
        //EdTasaNominal.Caption := '';

        try
          LGarPer := TList.Create;
          LGarReal := TList.Create;
        finally
        end;
        LGarPer.Clear;
        LGarReal.Clear;

        {GridPersonal.RowCount := 2;
        GridPersonal.FixedRows := 1;
        GridPersonal.Cells[0,0] := 'TIPO';
        GridPersonal.Cells[1,0] := 'NUMERO';
        GridPersonal.Cells[2,0] := 'APELLIDOS';
        GridPersonal.Cells[3,0] := 'NOMBRES';

        For I := 1 to GridPersonal.RowCount do
         begin
           GridPersonal.Cells[0,I] := '';
           GridPersonal.Cells[1,I] := '';
           GridPersonal.Cells[2,I] := '';
           GridPersonal.Cells[3,I] := '';
         end;

        GridReal.RowCount := 2;
        GridReal.ColCount := 9;
        GridReal.FixedRows := 1;
        GridReal.Cells[0,0] := 'ESCRITURA';
        GridReal.Cells[1,0] := 'FECHA';
        GridReal.Cells[2,0] := 'NOTARIA';
        GridReal.Cells[3,0] := 'CIUDAD';
        GridReal.Cells[4,0] := 'MATRICULA';
        GridReal.Cells[5,0] := 'FECHA';
        GridReal.Cells[6,0] := 'VALOR AVALUO';
        GridReal.Cells[7,0] := 'FECHA AVALUO';
        GridReal.Cells[8,0] := 'CUENTAS ORDEN';
        GridReal.Cells[9,0] := 'POLIZA';
        For I := 1 to GridReal.RowCount do
         begin
           GridReal.Cells[0,I] := '';
           GridReal.Cells[1,I] := '';
           GridReal.Cells[2,I] := '';
           GridReal.Cells[3,I] := '';
         end;
               }
end;

procedure TfrmNuevaColocacion1.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
        self.Caption := 'Nueva Colocación:' + EdNumeroColocacion.Text;
        CmdGrabar.Enabled := true;
        CBtiposid.SetFocus;
end;

procedure TfrmNuevaColocacion1.EdNumeroIdentificacionExit(Sender: TObject);
begin
        {if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;
        with DmColocacion.IBDSpersona do
        begin
             ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
             Active := true;
             Last;
             First;
             if RecordCount = 1 then
               begin
                 vNumeroId := EdNumeroIdentificacion.Text;
                 EdNombre.Text  := FieldByName('PRIMER_APELLIDO').AsString + ' '+                                   FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString;

                 with IBSolicitud do begin
                  ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
                  ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
                  Open;

                  if RecordCount < 1 then
                   begin
                    MessageDlg('No Posee Solicitudes de Crédito Aprobadas',mtError,[mbok],0);
                    inicializar;
                    Exit;
                   end;

                  while not Eof do begin
                   ComboSolicitud.Items.Add(FieldByName('ID_SOLICITUD').AsString);
                   Next;
                  end; // fin de while
                  ComboSolicitud.AutoDropDown := True;
                 end;
               end
               else
                MessageDlg('Persona no Existe',mtError,[mbok],0);
                 //CmdCrearPersona.SetFocus;
             Close;
        end;

//Busco Numero de Cuenta
        With IBSQL1 do
         begin
           SQL.Clear;
           SQL.Add('SELECT *');
           SQL.Add('FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
           ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
           ExecQuery;
           vCtaAportes := FieldByName('NUMERO_CUENTA').AsInteger;
           vDigitoCta  := FieldByName('DIGITO_CUENTA').AsInteger;
           EdCuentaAportes.Caption := IntToStr(vCtaAportes);
           Close;
         end;

        GroupBox2.Enabled := True;
        GroupBox3.Enabled := True; }
end;

procedure TfrmNuevaColocacion1.CBclasificacionEnter(Sender: TObject);
begin
        CBclasificacion.KeyValue := vClasificacion;
        CBclasificacion.DropDown;
end;

procedure TfrmNuevaColocacion1.CBlineaEnter(Sender: TObject);
begin
        CBlinea.KeyValue := vLinea;
        CBlinea.DropDown;
end;

procedure TfrmNuevaColocacion1.CBinversionEnter(Sender: TObject);
begin
        CBinversion.KeyValue:=vInversion;
        CBinversion.DropDown;
end;

procedure TfrmNuevaColocacion1.CBrespaldoEnter(Sender: TObject);
begin
        CBrespaldo.KeyValue := vRespaldo;
        CBrespaldo.DropDown;
end;

procedure TfrmNuevaColocacion1.CBgarantiaEnter(Sender: TObject);
begin
        CBgarantia.KeyValue:=vGarantia;
        CBgarantia.DropDown;
end;

procedure TfrmNuevaColocacion1.CBtipocuotaEnter(Sender: TObject);
begin
        CBtipocuota.KeyValue := vTipoCuota;
        CBtipocuota.DropDown;
end;

procedure TfrmNuevaColocacion1.EdValorDesembolsoEnter(Sender: TObject);
begin
        EdValorDesembolso.Text := FormatCurr('#0',vDesembolso);
        EdValorDesembolso.SelectAll;
end;

procedure TfrmNuevaColocacion1.EdAmortizaCapitalEnter(Sender: TObject);
begin
        EdAmortizaCapital.Text := FormatCurr('#',vAmortizaCapital);
end;

procedure TfrmNuevaColocacion1.EdAmortizaInteresEnter(Sender: TObject);
begin
        EdAmortizaInteres.Text := FormatCurr('#',vAmortizaInteres);
end;

procedure TfrmNuevaColocacion1.EdPlazoEnter(Sender: TObject);
begin
        EdPlazo.Text := FormatCurr('#0',vPlazo);
        EdPlazo.SelectAll;
end;

procedure TfrmNuevaColocacion1.FormClose(Sender: TObject;
  var Action: TCloseAction);
var B:Integer;
    ARecord : PGaPer;
    ARecord1 : PGaReal;
begin
     try
        for B := 0 to (LGarPer.Count - 1) do
        begin
                ARecord := LGarPer.Items[B];
                Dispose(ARecord);
        end;

        for B := 0 to (LGarReal.Count - 1) do
        begin
                ARecord1 := LGarReal.Items[B];
                Dispose(ARecord1);
        end;
     finally
        begin
          LGarPer.Free;
          LGarReal.Free;
        end
     end;
        dmColocacion.Free;
end;

procedure TfrmNuevaColocacion1.ActualizarGridPersonas;
var B:Integer;
    ARecord: PGaPer;
    SON:Integer;
begin
        SON := LGarPer.Count;
        GridPersonal.RowCount := SON + 1;
        if GridPersonal.RowCount < 2 then GridPersonal.RowCount := 2;
        GridPersonal.FixedRows := 1;
        for B := 0 to (LGarPer.Count - 1) do
        begin
                ARecord := LGarPer.Items[B];
                GridPersonal.Cells[0,B+1] := IntToStr(ARecord^.TipoId);
                GridPersonal.Cells[1,B+1] := ARecord^.NumeroId ;
                GridPersonal.Cells[2,B+1] := ARecord^.Apellidos;
                GridPersonal.Cells[3,B+1] := ARecord^.Nombres;
        end;

end;

function TfrmNuevaColocacion1.NoExistePersona(tipo: Integer; numero: String): Boolean;
var B:Integer;
    ARecord: PGaPer;
begin
        NoExistePersona := true;
        for B := 0 to (LGarPer.Count - 1) do
        begin
                ARecord := LGarPer.Items[B];
                if (ARecord^.TipoId = tipo) and
                   (ARecord^.NumeroId = numero) then
                    NoExistePersona := false
                else
                    NoExistePersona := true;
        end;
        if (vtipoid = tipo) and
           (vnumeroid = numero) then
           NoExistePersona := false;

end;

procedure TfrmNuevaColocacion1.ActualizarGridReal;
var B:Integer;
    ARecord: PGaReal;
    SON:Integer;
begin
        SON := LGarReal.Count;
        GridReal.RowCount := SON + 1;
        if GridReal.RowCount < 2 then GridReal.RowCount := 2;
        GridReal.FixedRows := 1;
        for B := 0 to (LGarReal.Count - 1) do
        begin
                ARecord := LGarReal.Items[B];
                GridReal.Cells[0,B+1] := ARecord^.Escritura;
                GridReal.Cells[1,B+1] := DateToStr(ARecord^.FechaEscritura);
                GridReal.Cells[2,B+1] := ARecord^.Notaria;
                GridReal.Cells[3,B+1] := ARecord^.CiudadEscritura;
                GridReal.Cells[4,B+1] := ARecord^.Matricula;
                GridReal.Cells[5,B+1] := DateToStr(ARecord^.FechaRegistro);
                GridReal.Cells[6,B+1] := FormatCurr('#,##0.00',ARecord^.ValorAvaluo);
                GridReal.Cells[7,B+1] := DateToStr(ARecord^.FechaAvaluo);
                GridReal.Cells[8,B+1] := FormatCurr('#,##0.00',ARecord^.CuentasOrden);
                GridReal.Cells[9,B+1] := ARecord^.Poliza;
        end;

end;

function TfrmNuevaColocacion1.NoExisteReal(Escritura: String): Boolean;
var B:Integer;
    ARecord: PGaReal;
begin
        NoExisteReal := true;
        for B := 0 to (LGarReal.Count - 1) do
        begin
                ARecord := LGarReal.Items[B];
                if (ARecord^.Escritura = Escritura) then
                    NoExisteReal := false
                else
                    NoExisteReal := true;
        end;

end;

procedure TfrmNuevaColocacion1.CmdGrabarClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Crear Esta Nueva Colocación?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        if CrearColocacion then
        begin
           GroupBox2.Enabled := false;
           GroupBox3.Enabled := false;
           Panel2.Enabled := false;
           Panel3.Enabled := false;
           CmdVerTabla.Enabled := true;
           CmdInforme.Enabled := true;
           self.Caption := 'Nueva Colocación:' + EdNumeroColocacion.Text;
           CmdInformeClick(Sender);
        end
        else
        begin
           MessageDlg('No Se Pudo Crear la Nueva Colocación' + #13 + #10 +
                      'Por Favor Verifique',mtError,[mbOK],0);
                     
        end;
end;

function TfrmNuevaColocacion1.CrearColocacion:Boolean;
var Consec:String;
begin
{ Validaciones}
            if vTipoId < 1 Then
            begin
               messagedlg('El tipo de Identificación no es valido',mtError,[mbOk],0);
               CBtiposid.SetFocus;
               Result := false;
               exit;
            end;
            if vNumeroId = '' then
            begin
               messagedlg('El número de identificación no es valido',mtError,[mbOk],0);
               EdNumeroIdentificacion.SetFocus;
               Result := false;
               exit;
            end;
            if vClasificacion < 1 then
            begin
               messagedlg('El tipo de clasificación no es valido',mtError,[mbOk],0);
               CBclasificacion.SetFocus;
               Result := false;
               exit;
            end;
            if vLinea < 1 then
            begin
               messagedlg('El tipo de linea no es valido',mtError,[mbOk],0);
               CBlinea.SetFocus;
               Result := false;
               exit;
            end;
            if vInversion < 1 then
            begin
               messagedlg('El tipo de inversión no es valido',mtError,[mbOk],0);
               CBinversion.SetFocus;
               Result := false;
               exit;
            end;
            if vRespaldo < 1 then
            begin
               messagedlg('El tipo de respaldo no es valido',mtError,[mbOk],0);
               CBrespaldo.SetFocus;
               Result := false;
               exit;
            end;
            if vGarantia < 1 then
            begin
               messagedlg('El tipo de garantia no es valido',mtError,[mbOk],0);
               CBgarantia.SetFocus;
               Result := false;
               exit;
            end;
            if vDesembolso < 1 then
            begin
               messagedlg('No diligencio el valor de la colocación',mtError,[mbOk],0);
               EdValorDesembolso.SetFocus;
               Result := false;
               exit;
            end;
            if vPlazo < 1 then
            begin
               messagedlg('No diligencio el plazo de la colocación',mtError,[mbOk],0);
               EdPlazo.SetFocus;
               Result := false;
               exit;
            end;
            if vTasaEfectiva < 1 then
            begin
               messagedlg('La tasa efectiva no es valida',mtError,[mbOk],0);
               EdTasaEfectiva.SetFocus;
               Result := false;
               exit;
            end;
            if vTasaMora < 1 then
            begin
               messagedlg('La tasa de mora no es valida',mtError,[mbOk],0);
               EdTasaMora.SetFocus;
               Result := false;
               exit;
            end;
            if vAmortizaCapital < 1 then
            begin
               messagedlg('El valor de la amortización a capital no es valido',mtError,[mbOk],0);
               EdAmortizaCapital.SetFocus;
               Result := false;
               exit;
            end;
            if vAmortizaInteres < 1 then
            begin
               messagedlg('El valor de la amortización a interes no es valido',mtError,[mbOk],0);
               EdAmortizaInteres.SetFocus;
               Result := false;
               exit;
            end;
            if LGarPer.Count = 0 then
               if messagedlg('No ha digitado garantias personales' + #13 + 'Desea Continuar?',mtWarning,[mbYes,mbNo],0) = mrNo then
               begin
                  Result := false;
                  exit;
               end;

            if LGarReal.Count = 0 then
               if messagedlg('No ha digitado garantias hipotecarias' + #13 + 'Desea Continuar?',mtWarning,[mbYes,mbNo],0) = mrNo then
               begin
                  Result := false;
                  exit;
               end;

{fin Validaciones}
            CmdGrabar.Enabled := False;
///**Genero el consecutivo
            Consec := IntToStr(YearOf(Date)) + FormatCurr('0000000',ObtenerConsecutivoColocacion(IBConsecutivo));
            vIdColocacion := Consec;
            EdNumeroColocacion.Text := Consec;

            Consec := FormatCurr('00000000',ObtenerConsecutivo(IBConsecutivo));
            vNotaContable := consec;
            EdNotaContable.Text := vNotaContable;

{Crear La Tabla de Liquidación}
            try
              if GrabarColocacion then
               begin
                 if vLinea = 7 then
                    CrearTablaLiquidacionVivienda(vIDColocacion,vDesembolso,vValorCuota,
                           CalculoFecha(vFechaDesembolso,vPeriodoGracia),vTasaEfectiva,vPuntosAdicionales,
                           vAmortizaCapital,vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido)
                 else
                    CrearTablaLiquidacion(vIDColocacion,vDesembolso,vValorCuota,
                           CalculoFecha(vFechaDesembolso,vPeriodoGracia),vTasaEfectiva,vPuntosAdicionales,
                           vAmortizaCapital,vAmortizaInteres,vPlazo,vCuotaTipo,vInteresVencido);

                 GrabarGarantias;
                 Contabilizar;
               end;
            Except
             Result := False;
             Exit;
            end;
            Result := true;
end;

procedure TfrmNuevaColocacion1.CBtiposidExit(Sender: TObject);
begin
        vTipoId := CBtiposid.KeyValue;
end;

procedure TfrmNuevaColocacion1.CBclasificacionExit(Sender: TObject);
begin
        vClasificacion := CBclasificacion.KeyValue;
end;

procedure TfrmNuevaColocacion1.CBlineaExit(Sender: TObject);
var
NumeroCDAT:string;
begin
        vLinea := CBlinea.KeyValue;
        if vLinea = 7 then
         begin
           vInversion := 3;
           CBInversion.KeyValue := vInversion;
           CBInversion.Enabled := False;
           vRespaldo := 1;
           CBRespaldo.KeyValue := vRespaldo;
           CBRespaldo.Enabled := False;
           vGarantia := 1;
           CBGarantia.KeyValue := vGarantia;
           CBGarantia.Enabled := False;
           EdValorDesembolso.SetFocus;
         end;

        with IBSQL3 do begin
          Close;
          SQL.Clear;
          SQL.Add('select TASA_CONSTANTE from "col$lineas" where ID_LINEA = :ID');
          ParamByName('ID').AsInteger := vLinea;
          ExecQuery;
          vTasaEfectiva := FieldByName('TASA_CONSTANTE').AsDouble;
          Close;

          if vLinea = 6 then begin
            NumeroCDAT := InputBox('CDAT','Digite el Número de CDAT que respalda el Desembolso','0');
            Close;
            SQL.Clear;
            SQL.Add('select ID_ESTADO, TASA_EFECTIVA, PUNTOS_ADICIONALES');
            SQL.Add('from "cap$maestro"');
            SQL.Add('where ID_AGENCIA =:ID_AGENCIA and');
            SQL.Add('ID_TIPO_CAPTACION = 6 and NUMERO_CUENTA = :NUMERO_CUENTA and');
            SQL.Add('DIGITO_CUENTA =:DIGITO_CUENTA)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(NumeroCDAT);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(6,NumeroCDAT));
            ExecQuery;
            if (FieldByName('ID_ESTADO').AsInteger = 1) or (FieldByName('ID_ESTADO').AsInteger = 6) then
               vTasaEfectiva := (FieldByName('TASA_EFECTIVA').AsDouble * FieldByName('TASA_CONSTANTE').AsDouble) + FieldByName('PUNTOS_ADICIONALES').AsDouble
            else MessageDlg('El CDAT de Garantía no está ACTIVO',mtError,[mbok],0);
          end
        end;
end;

procedure TfrmNuevaColocacion1.CBinversionExit(Sender: TObject);
begin
        vInversion := CBinversion.KeyValue;
end;

procedure TfrmNuevaColocacion1.CBrespaldoExit(Sender: TObject);
begin
        vRespaldo := CBrespaldo.KeyValue;
end;

procedure TfrmNuevaColocacion1.CBgarantiaExit(Sender: TObject);
begin
        vGarantia := CBgarantia.KeyValue;
end;

procedure TfrmNuevaColocacion1.EdFechaDesembolsoExit(Sender: TObject);
begin
        vFechaDesembolso := EdFechaDesembolso.Date;
end;

procedure TfrmNuevaColocacion1.CmdVerTablaClick(Sender: TObject);
var frmTablaPagoColocacion:TfrmTablaPagoColocacion;
begin
        frmTablaPagoColocacion := TfrmTablaPagoColocacion.Create(Self);
        frmTablaPagoColocacion.TablaLiq := vIdColocacion;
        frmTablaPagoColocacion.Saldo := vDesembolso;
        frmTablaPagoColocacion.ShowModal;
end;

procedure TfrmNuevaColocacion1.EdPeriodoGraciaExit(Sender: TObject);
begin
        if EdPeriodoGracia.Text = '' then EdPeriodoGracia.Text := '0';
        vPeriodoGracia := StrToInt(EdPeriodoGracia.Text);
        EdPeriodoGracia.Text := FormatCurr('0',vPeriodoGracia);
        if vDesembolso < 1 then
        begin
           MessageDlg('El valor del desembolso no puede ser $0',mtInformation,[mbOk],0);
           exit;
        end;

        if vCuotaTipo = 'F' then
        begin
//vivienda******************************
          if vLinea = 7 then
           begin
             vAmortizaCapital := vAmortizaInteres;
             EdAmortizaCapital.Text := FormatCurr('#0',vAmortizaCapital);
             vValorCuota := CuotaVivienda(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaInteres);
           end
//**************************************
           else
           begin
             vAmortizaCapital := vAmortizaInteres;
             EdAmortizaCapital.Text := FormatCurr('#0',vAmortizaCapital);
             vValorCuota := CuotaFija(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaInteres);
           end;
        end
        else
        begin
           vValorCuota := CuotaVariable(vDesembolso,vPlazo,vTasaEfectiva,vAmortizaCapital);
        end;

        if vCapitalVencido = 'V' then
           vTasaNominal := (TasaNominalVencida(vTasaEfectiva,vAmortizaInteres) + vPuntosAdicionales)
        else
           vTasaNominal := (TasaNominalAnticipada(vTasaEfectiva,vAmortizaInteres)+ vPuntosAdicionales);
        EdTasaNominal.Caption  := FormatCurr('#0.00%',vTasaNominal);
        EdValorCuota.Caption := FormatCurr('$#,##0',vValorCuota);
        vFechaVencimiento := vFechaDesembolso;
        vFechaVencimiento := CalculoFecha(vFechaVencimiento,vPlazo+vPeriodoGracia);
        DateTime_SetFormat(EdFechaVencimiento.Handle,'yyyy/MM/dd');
        EdFechaVencimiento.Date := vFechaVencimiento;
        if vInteresVencido = 'V' then
        begin
                vFechaCapital := CalculoFecha(vFechaDesembolso,vPeriodoGracia);
                vFechaInteres := CalculoFecha(vFechaDesembolso,vPeriodoGracia);
        end
        else
        begin
                vFechaCapital := CalculoFecha(vFechaDesembolso,vAmortizaCapital+vPeriodoGracia);
                vFechaInteres := CalculoFecha(vFechaDesembolso,vAmortizaInteres+vPeriodoGracia);
        end;
        DateTime_SetFormat(EdFechaCapital.Handle,'yyyy/MM/dd');
        EdFechaCapital.Date := vFechaCapital;
        DateTime_SetFormat(EdFechaInteres.Handle,'yyyy/MM/dd');
        EdFechaInteres.Date := vFechaInteres;

        GroupBox3.Enabled := true;
end;

procedure TfrmNuevaColocacion1.EdPeriodoGraciaEnter(Sender: TObject);
begin
        EdPeriodoGracia.Text := FormatCurr('#0',vPeriodoGracia);
end;

procedure TfrmNuevaColocacion1.EdPuntosAdicionalesEnter(Sender: TObject);
begin
        EdPuntosAdicionales.Text := FormatCurr('#0.00',vPuntosAdicionales);
        EdPuntosAdicionales.SelectAll;
end;

procedure TfrmNuevaColocacion1.EdPuntosAdicionalesExit(Sender: TObject);
begin
        if EdPuntosAdicionales.Text = '' then EdPuntosAdicionales.Text := '0.00';
        vPuntosAdicionales := StrToFloat(EdPuntosAdicionales.Text);
        EdPuntosAdicionales.Text := FormatCurr('#0.00',vPuntosAdicionales);
        vTasaEfectiva := dmColocacion.IBDStasavariable.FieldValues['VALOR_ACTUAL_TASA'];
 //       EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);
end;

procedure TfrmNuevaColocacion1.EdPuntosAdicionalesKeyPress(Sender: TObject;
  var Key: Char);
begin
        Numerico(Sender,Key);
end;

procedure TfrmNuevaColocacion1.EdPeriodoGraciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmNuevaColocacion1.EdTipoTasaExit(Sender: TObject);
begin
        if LeftStr(EdTipoTasa.Text,1) = 'F' then
        begin
            CBtasavariable.Enabled := false;
            CBtasavariable.KeyValue := -1;
            EdPuntosAdicionales.Enabled := false;
            vPuntosAdicionales := 0;
            EdPuntosAdicionales.Text := FormatCurr('#0.00',vPuntosAdicionales);
            EdTasaEfectiva.Enabled := true;
            EdTasaEfectiva.SetFocus;
            vTipocuota := 1;
            vTipoTasa := 'F';
        end
        else
        begin
            CBtasavariable.Enabled := true;
            CBtasavariable.KeyValue := 1;
            EdPuntosAdicionales.Enabled := true;
            EdTasaEfectiva.Enabled := false;
            vTasaEfectiva := dmColocacion.IBDStasavariable.FieldValues['VALOR_ACTUAL_TASA'];
            EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);
            CBtasavariable.SetFocus;
            vTipoCuota := 2;
            vTipoTasa := 'V';
        end;

        if vTipoTasa = 'F' then
         begin
           DmColocacion.IBDStipocuota.ParamByName('ES_VARIABLE').AsInteger := 0;
           DmColocacion.IBDStipocuota.ParamByName('ES_FIJA').AsInteger := 1;
         end;
        if vTipoTasa = 'V' then
         begin
           DmColocacion.IBDStipocuota.ParamByName('ES_VARIABLE').AsInteger := 1;
           DmColocacion.IBDStipocuota.ParamByName('ES_FIJA').AsInteger := 0;
           EdTasaEfectiva.Text := '0';
           EdPuntosAdicionales.SetFocus;
         end;

        if vLinea = 7 then
         begin
           vTasaEfectiva := 25.34;
           EdTasaEfectiva.Text := FormatCurr('#0.00',vTasaEfectiva);
           EdTasaEfectiva.Enabled := False;
           vTasaMora := 15;
           EdTasaMora.Text := FormatCurr('#0.00',vTasaMora);
           EdTasaMora.Enabled := False;
         end;
        DmColocacion.IBDStipocuota.Active := False;
        DmColocacion.IBDStipocuota.Active := True;
        DmColocacion.IBDStipocuota.Last;
        DmColocacion.IBDStipocuota.First;         
end;

procedure TfrmNuevaColocacion1.CBtasavariableClick(Sender: TObject);
begin
        vTasaEfectiva := dmColocacion.IBDStasavariable.FieldValues['VALOR_ACTUAL_TASA'];
        EdTasaEfectiva.Text := FormatCurr('#0.00%',vTasaEfectiva);
end;

procedure TfrmNuevaColocacion1.EdTipoTasaEnter(Sender: TObject);
begin
        if vTipoTasa = 'F' then
         EdTipoTasa.ItemIndex := 0
        else
         EdTipoTasa.ItemIndex := 1;
end;

procedure TfrmNuevaColocacion1.Contabilizar;
var i:Integer;
    vFechaHora:TDateTime;
    vVecesAportes,
    vVecesAhorros,
    vPorcCredito,
    vPorcAportes,
    vPorcAhorros :Single;
    vMinimoCapitaliza:Currency;
    vCapitalizaAcumulada:Boolean;
    vCaja:Currency;
    vDescuento:Currency;
    vCodigoPuc:String;
    vCodigoCortoPlazo:String;
    vCodigoLargoPlazo:String;
    vCodigoInteresAnticipado:String;
    vInteresAnt:Currency;
    TipoCaptacion:Integer;
    NumeroCuenta:Integer;
    DigitoCuenta:Integer;
    Movimiento:Currency;
    vTotalAportes:Currency;
    vTAportesCreditosAnt:Currency;

begin
  try
        vVecesAportes := 0;
        vVecesAhorros := 0;
        vPorcCredito  := 0;
        vPorcAhorros := 0;
        vInteresAnt := 0;
        vTAportesCreditosAnt := 0;
        vCapitalizaAcumulada := False;
        vCaja := vDesembolso;
        vFechaHora := Date;
        TipoCaptacion := 1;
        // Evaluar Corto y Largo Plazo
        with dmColocacion.IBQuery do
        begin
            SQL.Clear;
            SQL.Add('select * from "col$tablaliquidacion"');
            SQL.Add(' where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION") ORDER BY FECHA_A_PAGAR');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_COLOCACION').AsString := vIdColocacion;
            Open;
            Last;
            First;
            if RecordCount > 0 then
            for i := 1 to RecordCount do
            begin
              if DiasEntre(vFechaDesembolso,dmColocacion.IBQuery.FieldbyName('FECHA_A_PAGAR').AsDateTime) <= 360 then
                 vCortoPlazo := vCortoPlazo + dmColocacion.IBQuery.FieldByName('CAPITAL_A_PAGAR').AsCurrency
              else
                 vLargoPlazo := vLargoPlazo + dmColocacion.IBQuery.FieldByName('CAPITAL_A_PAGAR').AsCurrency;
            Next;
            end;
            Close;
        end;

        with dmColocacion.IBQuery do
        begin
          SQL.Clear;
          SQL.Add('select * from "col$lineas" ');
          SQL.Add(' where ID_LINEA = :"ID_LINEA"');
          ParamByName('ID_LINEA').AsInteger := vLinea;
          Open;

          if RecordCount > 0 then
           begin
             vVecesAportes := FieldByName('VECES_APORTES').AsFloat;
             vVecesAhorros := FieldByName('VECES_AHORROS').AsFloat;
             vPorcCredito  := FieldByName('PORCENTAJE_CREDITO').AsFloat;
             vPorcAportes  := FieldByName('PORCENTAJE_APORTES').AsFloat;
             vPorcAhorros  := FieldByName('PORCENTAJE_AHORROS').AsFloat;
             vMinimoCapitaliza := FieldByName('MINIMO_CAPITALIZAR').AsCurrency;
             vCapitalizaAcumulada := IntToBoolean(FieldByName('CAPITALIZACION_ACUMULADA').AsInteger);
           end;

          vTotalAportes := BuscarAportes(vTipoId,vNumeroId);

          if vCapitalizaAcumulada then
              vTAportesCreditosAnt := VerificarAportesCreditosAnt(CBtiposid.KeyValue,ednumeroidentificacion.Text);



{Contabilizo Descuentos}
        with IBDescuentos do begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_DESCUENTO from "col$lineadescuento" where ID_LINEA = :ID_LINEA');
          ParamByName('ID_LINEA').AsInteger := vLinea;
          Open;
          Last;
          First;
          while not Eof do begin
            IBSQL3.Close;
            IBSQL3.SQL.Clear;
            IBSQL3.SQL.Add('select CODIGO,DESCRIPCION_DESCUENTO,VALOR_DESCUENTO,PORCENTAJE_COLOCACION from "col$descuentos" where ID_DESCUENTO = :ID_DESCUENTO');
            IBSQL3.ParamByName('ID_DESCUENTO').AsInteger := IBDescuentos.FieldByName('ID_DESCUENTO').AsInteger;
            IBSQL3.ExecQuery;
            vDescuento := 0;
            if IBSQL3.FieldByName('VALOR_DESCUENTO').AsCurrency > 0 then
             begin
               vDescuento := IBSQL3.FieldByName('VALOR_DESCUENTO').AsCurrency;
             end
            else
             if IBSQL3.FieldByName('PORCENTAJE_COLOCACION').AsFloat > 0 then
                vDescuento := (IBSQL3.FieldByName('PORCENTAJE_COLOCACION').AsFloat / 100) * vDesembolso;

            if vDescuento > 0 then
             begin
               vCaja := vCaja - vDescuento;
               vFechaHora := fFechaHoraActual;
               with IBSQL2 do
                begin
                  SQL.Clear;
                  SQL.Add('insert into "col$concol" ("ID_AGENCIA","ID_COLOCACION","CODIGO",');
                  SQL.Add('"DEBITO","CREDITO","FECHA_Y_HORA") values (');
                  SQL.Add(':"ID_AGENCIA", :"ID_COLOCACION",');
                  SQL.Add(':"CODIGO", :"DEBITO", :"CREDITO",');
                  SQL.Add(':"FECHA_Y_HORA")');
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                  ParamByName('CODIGO').AsString := IBSQL3.FieldByName('CODIGO').AsString;
                  ParamByName('DEBITO').AsCurrency := 0;
                  ParamByName('CREDITO').AsCurrency := vDescuento;
                  ParamByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                  ExecQuery;
                end;
             end;
            vDescuento := 0;
            Next;
          end; // fin de while
          Close;
        end;





{fin contabilizo descuentos}

          if vCapitalizaAcumulada then
           begin
             if vVecesAportes > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso / vVecesAportes,0)
             else
             if vVecesAhorros > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso / vVecesAhorros,0);
//             else
             if vPorcCredito > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso * ( vPorcCredito / 100),0 )
             else
             if vPorcAportes > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + SimpleRoundTo(vDesembolso * ( vPorcAportes / 100),0 );
           end
          else
           begin
             if vVecesAportes > 0 then
               vDctoCapitalizacion := SimpleRoundTo(vDesembolso / vVecesAportes,0)
             else
             if vVecesAhorros > 0 then
               vDctoCapitalizacion := SimpleRoundTo(vDesembolso / vVecesAhorros,0);
//             else
             if vPorcCredito > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + (SimpleRoundTo(vDesembolso * ( vPorcCredito / 100),0 ))
             else
             if vPorcAportes > 0 then
               vDctoCapitalizacion := vDctoCapitalizacion + (SimpleRoundTo(vDesembolso * ( vPorcAportes / 100),0 ));
           end;

          vDctoCapitalizacion := vDctoCapitalizacion + vTAportesCreditosAnt;
          vDctoCapitalizacion := vTotalAportes - vDctoCapitalizacion;

          if vDctoCapitalizacion < 0 then
             vDctoCapitalizacion := Abs(vDctoCapitalizacion)
          else
             vDctoCapitalizacion := 0;

          vCaja := vCaja - vDctoCapitalizacion;

          with dmColocacion.IBQuery do
           begin
             SQL.Clear;
             SQL.Add('select * from "col$codigospuc" where ');
             SQL.Add('ID_CLASIFICACION = :"ID_CLASIFICACION" and ');
             SQL.Add('ID_GARANTIA = :"ID_GARANTIA" and ');
             SQL.Add('ID_CATEGORIA = :"ID_CATEGORIA"');
             ParamByName('ID_CLASIFICACION').AsInteger := vClasificacion;
             ParamByName('ID_GARANTIA').AsInteger := vGarantia;
             ParamByName('ID_CATEGORIA').AsString := 'A';
             Open;
             vCodigoCortoPlazo := FieldByName('COD_CAPITAL_CP').AsString;
             vCodigoLargoPlazo := FieldByName('COD_CAPITAL_LP').AsString;
             vCodigoInteresAnticipado:= FieldByName('COD_INT_ANT').AsString;
             Close;
           end;
{Contabilizo Corto y Largo Plazo}
           with dmColocacion.IBDScontable do
            begin
              Open;
              if vCortoPlazo > 0 then
              begin
                 Append;
                 FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                 FieldByName('ID_AGENCIA').AsInteger := Agencia;
                 FieldByName('ID_COLOCACION').AsString := vIdColocacion;
                 FieldByName('CODIGO').AsString := vCodigoCortoPlazo;
                 FieldByName('DEBITO').AsCurrency := vCortoPlazo;
                 FieldByName('CREDITO').AsCurrency := 0;
                 Post;
              end;
              if vLargoPlazo > 0 then
              begin
                 Append;
                 FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                 FieldByName('ID_AGENCIA').AsInteger := Agencia;
                 FieldByName('ID_COLOCACION').AsString := vIdColocacion;
                 FieldByName('CODIGO').AsString := vCodigoLargoPlazo;
                 FieldByName('DEBITO').AsCurrency := vLargoPlazo;
                 FieldByName('CREDITO').AsCurrency := 0;
                 Post;
              end;
             end;
        end;
{fin contabilizao Corto y Largo Plazo}


{Contabilizo Interes Anticipado}
             with dmColocacion.IBDScontable do
             begin
              Open;
              if vInteresVencido = 'A' then
              begin
                 Append;
                 vInteresAnt := SimpleRoundTo(vDesembolso*(vTasaNominal/100)*vAmortizaInteres/360,0);
                 FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                 FieldByName('ID_AGENCIA').AsInteger := Agencia;
                 FieldByName('ID_COLOCACION').AsString := vIdColocacion;
                 FieldByName('CODIGO').AsString := vCodigoInteresAnticipado;
                 FieldByName('DEBITO').AsCurrency := 0;
                 FieldByName('CREDITO').AsCurrency := vInteresAnt;
                 Post;
                 vCaja := vCaja - vInteresAnt;
              end;
             end;
{Fin Contabilizo Interes Anticipado}

{Agregar al extracto}
                if vInteresAnt <> 0 then
                begin
                  With Dmcolocacion.IBQuery1 do
                  begin
                    SQL.Clear;
                    SQL.Add('select CODIGO from "col$codigospucbasicos" ');
                    SQL.Add('where ID_CODIGOPUCBASICO = 8');
                    Open;
                    vCodigoPuc := FieldByName('CODIGO').AsString;
                    Close;

                    sql.Clear;
                    sql.Add('insert into "col$extracto" (');
                    sql.Add('"col$extracto"."ID_AGENCIA", "col$extracto"."ID_CBTE_COLOCACION",');
                    sql.Add('"col$extracto"."ID_COLOCACION", "col$extracto"."FECHA_EXTRACTO",');
                    sql.Add('"col$extracto"."HORA_EXTRACTO", "col$extracto"."CUOTA_EXTRACTO",');
                    sql.Add('"col$extracto"."TIPO_OPERACION", "col$extracto"."SALDO_ANTERIOR_EXTRACTO",');
                    sql.Add('"col$extracto"."ABONO_CAPITAL", "col$extracto"."ABONO_CXC",');
                    sql.Add('"col$extracto"."ABONO_SERVICIOS", "col$extracto"."ABONO_ANTICIPADO",');
                    sql.Add('"col$extracto"."ABONO_MORA", "col$extracto"."ABONO_SEGURO",');
                    sql.Add('"col$extracto"."ABONO_PAGXCLI", "col$extracto"."ABONO_HONORARIOS",');
                    sql.Add('"col$extracto"."ABONO_OTROS", "col$extracto"."TASA_INTERES_LIQUIDACION",');
                    sql.Add('"col$extracto"."ID_EMPLEADO",');
                    sql.Add('"col$extracto"."INTERES_PAGO_HASTA",');
                    sql.Add('"col$extracto"."CAPITAL_PAGO_HASTA",');
                    sql.Add('"col$extracto"."TIPO_ABONO")');
                    sql.Add(' Values (');
                    sql.Add(':"ID_AGENCIA", :"ID_CBTE_COLOCACION", :"ID_COLOCACION",');
                    sql.Add(':"FECHA_EXTRACTO", :"HORA_EXTRACTO", :"CUOTA_EXTRACTO",');
                    sql.Add(':"TIPO_OPERACION", :"SALDO_ANTERIOR_EXTRACTO", :"ABONO_CAPITAL",');
                    sql.Add(':"ABONO_CXC", :"ABONO_SERVICIOS", :"ABONO_ANTICIPADO", :"ABONO_MORA",');
                    sql.Add(':"ABONO_SEGURO", :"ABONO_PAGXCLI", :"ABONO_HONORARIOS",');
                    sql.Add(':"ABONO_OTROS", :"TASA_INTERES_LIQUIDACION", :"ID_EMPLEADO",');
                    sql.Add(':"INTERES_PAGO_HASTA", :"CAPITAL_PAGO_HASTA", :"TIPO_ABONO")');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_CBTE_COLOCACION').AsInteger := StrToInt(vNotaContable);
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
                    ParamByName('HORA_EXTRACTO').AsDateTime := Time;
                    ParamByName('CUOTA_EXTRACTO').AsInteger := 0;
                    ParamByName('TIPO_OPERACION').AsInteger := 1;
                    ParamByName('SALDO_ANTERIOR_EXTRACTO').AsCurrency := vDesembolso;
                    ParamByName('ABONO_CAPITAL').AsCurrency := 0;
                    ParamByName('ABONO_CXC').AsCurrency := 0;
                    ParamByName('ABONO_SERVICIOS').AsCurrency := 0;
                    ParamByName('ABONO_ANTICIPADO').AsCurrency := vInteresAnt;
                    ParamByName('ABONO_MORA').AsCurrency := 0;
                    ParamByName('ABONO_SEGURO').AsCurrency := 0;
                    ParamByName('ABONO_PAGXCLI').AsCurrency := 0;
                    ParamByName('ABONO_HONORARIOS').AsCurrency := 0;
                    ParamByName('ABONO_OTROS').AsCurrency := 0;
                    ParamByName('TASA_INTERES_LIQUIDACION').AsFloat := vTasaNominal;
                    ParamByName('ID_EMPLEADO').AsString := DBAlias;
                    ParamByName('INTERES_PAGO_HASTA').AsDate := vFechaInteres;
                    ParamByName('CAPITAL_PAGO_HASTA').AsDate := vFechaCapital;
                    ParamByName('TIPO_ABONO').AsInteger := BooleanoToInt(False);
                    ExecSQL;
                    Close;
                  end;

                  With Dmcolocacion.IBQuery1 do
                  begin
                    sql.Clear;
                    SQL.Add('insert into "col$extractodet" values (');
                    SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
                    SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
                    SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_CBTE_COLOCACION').AsInteger:= StrToInt(vNotaContable);
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
                    ParamByName('HORA_EXTRACTO').AsDateTime := Time;
                    ParamByName('CODIGO_PUC').AsString := vCodigoInteresAnticipado;
                    ParamByName('FECHA_INICIAL').AsDate := fFechaActual;
                    ParamByName('FECHA_FINAL').AsDate := vFechaInteres;
                    ParamByName('DIAS_APLICADOS').AsInteger := DiasEntre(FechaHoy,vFechaInteres);
                    ParamByName('TASA_LIQUIDACION').AsFloat := vTasaNominal;
                    ParamByName('VALOR_DEBITO').AsCurrency := vInteresAnt;
                    ParamByName('VALOR_CREDITO').AsCurrency := 0;
                    ExecSql;
                    Close;
                  end;

                  With Dmcolocacion.IBQuery1 do
                  begin
                    sql.Clear;
                    SQL.Add('insert into "col$extractodet" values (');
                    SQL.Add(':"ID_AGENCIA",:"ID_CBTE_COLOCACION",:"ID_COLOCACION",:"FECHA_EXTRACTO",:"HORA_EXTRACTO",');
                    SQL.Add(':"CODIGO_PUC",:"FECHA_INICIAL",:"FECHA_FINAL",:"DIAS_APLICADOS",');
                    SQL.Add(':"TASA_LIQUIDACION",:"VALOR_DEBITO",:"VALOR_CREDITO")');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_CBTE_COLOCACION').AsInteger:= StrToInt(vNotaContable);
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_EXTRACTO').AsDate := fFechaActual;
                    ParamByName('HORA_EXTRACTO').AsDateTime := Time;
                    ParamByName('CODIGO_PUC').AsString := vCodigoPuc;
                    ParamByName('FECHA_INICIAL').AsDate := fFechaActual;
                    ParamByName('FECHA_FINAL').AsDate := fFechaActual;
                    ParamByName('DIAS_APLICADOS').AsInteger := 0;
                    ParamByName('TASA_LIQUIDACION').AsFloat := 0;
                    ParamByName('VALOR_DEBITO').AsCurrency := 0;
                    ParamByName('VALOR_CREDITO').AsCurrency := vInteresAnt;
                    ExecSql;
                    Close;
                  end;

                 With DmColocacion.IBQuery1 do
                  begin
                    sql.Clear;
                    sql.Add('update "col$colocacion" set ');
                    sql.Add('"col$colocacion"."FECHA_INTERES" =:"FECHA_INTERES"');
                    sql.Add(' where ');
                    sql.Add('"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and');
                    sql.Add('"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                    ParamByName('FECHA_INTERES').AsDate := vFechaInteres;
                    ExecSql;
                    Close;
                  end;
                end;

{fin Agregar al Extracto}

        with dmColocacion.IBQuery do
        begin
{Busco Codigo Ahorros y Aplico Valor Ahorros}
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" ');
           SQL.Add('where ID_CODIGOPUCBASICO = 8');
           Open;
           vCodigoPuc := FieldByName('CODIGO').AsString;
           Close;
           dmColocacion.IBDScontable.Append;
           dmColocacion.IBDScontable.FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
           dmColocacion.IBDScontable.FieldByName('ID_AGENCIA').AsInteger := Agencia;
           dmColocacion.IBDScontable.FieldByName('ID_COLOCACION').AsString := vIdColocacion;
           dmColocacion.IBDScontable.FieldByName('CODIGO').AsString := vCodigoPuc;
           dmColocacion.IBDScontable.FieldByName('DEBITO').AsCurrency := 0;
           dmColocacion.IBDScontable.FieldByName('CREDITO').AsCurrency := vCaja;
           dmColocacion.IBDScontable.Post;
{fin Busco Codigo Caja y Aplico Valor Caja}
{Busco Codigo Capitalización y Aplico Valor Capitalizacion}
           SQL.Clear;
           SQL.Add('select CODIGO from "col$codigospucbasicos" ');
           SQL.Add('where ID_CODIGOPUCBASICO = 3');
           Open;
           vCodigoPuc := FieldByName('CODIGO').AsString;
           Close;
           dmColocacion.IBDScontable.Append;
           if vDctoCapitalizacion > 0 then
            begin
              dmColocacion.IBDScontable.FieldByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
              dmColocacion.IBDScontable.FieldByName('ID_AGENCIA').AsInteger := Agencia;
              dmColocacion.IBDScontable.FieldByName('ID_COLOCACION').AsString := vIdColocacion;
              dmColocacion.IBDScontable.FieldByName('CODIGO').AsString := vCodigoPuc;
              dmColocacion.IBDScontable.FieldByName('DEBITO').AsCurrency := 0;
              dmColocacion.IBDScontable.FieldByName('CREDITO').AsCurrency := vDctoCapitalizacion;
              dmColocacion.IBDScontable.Post;
            end;
{fin Busco Codigo Capitalización y Aplico Valor Capitalizacion}
        end;
    dmColocacion.IBDScolocacion.Transaction.Commit;
  Except
    dmColocacion.IBDScolocacion.Transaction.Rollback;
  end;
end;

procedure TfrmNuevaColocacion1.CBEnteAprobadorEnter(Sender: TObject);
begin
        CBEnteAprobador.KeyValue := vEnteAprobador;
        CBEnteAprobador.DropDown;
end;

procedure TfrmNuevaColocacion1.CBEnteAprobadorExit(Sender: TObject);
begin
        vEnteAprobador := CBEnteAprobador.KeyValue;
        GroupBox4.Enabled := True;        
end;

function TfrmNuevaColocacion1.GrabarColocacion: Boolean;
begin
        vFechaDesembolso := fFechaActual;
           try
             with dmColocacion.IBQuery do
              begin
                SQL.Clear;
                SQL.Add('insert into "col$colocacion" (');
                SQL.Add('"col$colocacion"."ID_AGENCIA",');
                SQL.Add('"col$colocacion"."ID_COLOCACION", "col$colocacion"."ID_IDENTIFICACION",');
                SQL.Add('"col$colocacion"."ID_PERSONA", "col$colocacion"."ID_CLASIFICACION",');
                SQL.Add('"col$colocacion"."ID_LINEA", "col$colocacion"."ID_INVERSION", "col$colocacion"."ID_RESPALDO",');
                SQL.Add('"col$colocacion"."ID_GARANTIA", "col$colocacion"."ID_CATEGORIA", "col$colocacion"."ID_EVALUACION",');
                SQL.Add('"col$colocacion"."FECHA_DESEMBOLSO", "col$colocacion"."VALOR_DESEMBOLSO",');
                SQL.Add('"col$colocacion"."PLAZO_COLOCACION", "col$colocacion"."FECHA_VENCIMIENTO",');
                SQL.Add('"col$colocacion"."TIPO_INTERES", "col$colocacion"."ID_INTERES", "col$colocacion"."TASA_INTERES_CORRIENTE",');
                SQL.Add('"col$colocacion"."TASA_INTERES_MORA", "col$colocacion"."PUNTOS_INTERES",');
                SQL.Add('"col$colocacion"."ID_TIPO_CUOTA", "col$colocacion"."AMORTIZA_CAPITAL",');
                SQL.Add('"col$colocacion"."AMORTIZA_INTERES", "col$colocacion"."PERIODO_GRACIA",');
                SQL.Add('"col$colocacion"."DIAS_PRORROGADOS", "col$colocacion"."VALOR_CUOTA",');
                SQL.Add('"col$colocacion"."ABONOS_CAPITAL", "col$colocacion"."FECHA_CAPITAL",');
                SQL.Add('"col$colocacion"."FECHA_INTERES", "col$colocacion"."ID_ESTADO_COLOCACION",');
                SQL.Add('"col$colocacion"."ID_ENTE_APROBADOR", "col$colocacion"."ID_EMPLEADO",');
                SQL.Add('"col$colocacion"."NOTA_CONTABLE", "col$colocacion"."NUMERO_CUENTA",');
                SQL.Add('"col$colocacion"."ES_ANORMAL")');
                SQL.Add(' VALUES (');
                SQL.Add(':"ID_AGENCIA",');
                SQL.Add(':"ID_COLOCACION",:"ID_IDENTIFICACION",:"ID_PERSONA",');
                SQL.Add(':"ID_CLASIFICACION",:"ID_LINEA",:"ID_INVERSION",');
                SQL.Add(':"ID_RESPALDO",:"ID_GARANTIA",:"ID_CATEGORIA",');
                SQL.Add(':"ID_EVALUACION",:"FECHA_DESEMBOLSO",:"VALOR_DESEMBOLSO",');
                SQL.Add(':"PLAZO_COLOCACION",:"FECHA_VENCIMIENTO",:"TIPO_INTERES",');
                SQL.Add(':"ID_INTERES",:"TASA_INTERES_CORRIENTE",:"TASA_INTERES_MORA",');
                SQL.Add(':"PUNTOS_INTERES",:"ID_TIPO_CUOTA",:"AMORTIZA_CAPITAL",');
                SQL.Add(':"AMORTIZA_INTERES",:"PERIODO_GRACIA",:"DIAS_PRORROGADOS",');
                SQL.Add(':"VALOR_CUOTA",:"ABONOS_CAPITAL",:"FECHA_CAPITAL",:"FECHA_INTERES",');
                SQL.Add(':"ID_ESTADO_COLOCACION",:"ID_ENTE_APROBADOR",:"ID_EMPLEADO",');
                SQL.Add(':"NOTA_CONTABLE",:"NUMERO_CUENTA",:"ES_ANORMAL")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                ParamByName('ID_IDENTIFICACION').AsInteger := vTipoId;
                ParamByName('ID_PERSONA').AsString := vNumeroId;
                ParamByName('ID_CLASIFICACION').AsInteger := vClasificacion;
                ParamByName('ID_LINEA').AsInteger := vLinea;
                ParamByName('ID_INVERSION').AsInteger := vInversion;
                ParamByName('ID_RESPALDO').AsInteger := vRespaldo;
                ParamByName('ID_GARANTIA').AsInteger := vGarantia;
                ParamByName('ID_CATEGORIA').AsString := 'A';
                ParamByName('ID_EVALUACION').AsString := 'A';
                ParamByName('FECHA_DESEMBOLSO').AsDate := vFechaDesembolso;
                ParamByName('VALOR_DESEMBOLSO').AsCurrency := vDesembolso;
                ParamByName('PLAZO_COLOCACION').AsInteger := vPlazo;
                ParamByName('FECHA_VENCIMIENTO').AsDate := vFechaVencimiento;
                ParamByName('TIPO_INTERES').AsString := vTipoTasa;
                ParamByName('ID_INTERES').AsInteger:= vTasaVariable;
                ParamByName('TASA_INTERES_CORRIENTE').AsFloat := vTasaEfectiva;
                ParamByName('TASA_INTERES_MORA').AsFloat := vTasaMora;
                ParamByName('PUNTOS_INTERES').AsFloat := vPuntosAdicionales;
                ParamByName('ID_TIPO_CUOTA').AsInteger := vTipoCuota;
                ParamByName('AMORTIZA_CAPITAL').AsInteger := vAmortizaCapital;
                ParamByName('AMORTIZA_INTERES').AsInteger := vAmortizaInteres;
                ParamByName('PERIODO_GRACIA').AsInteger := vPeriodoGracia;
                ParamByName('DIAS_PRORROGADOS').AsInteger := 0;
                ParamByName('VALOR_CUOTA').AsCurrency := vValorCuota;
                ParamByName('ABONOS_CAPITAL').AsCurrency := 0;
                ParamByName('FECHA_CAPITAL').AsDate := vFechaCapital;
                ParamByName('FECHA_INTERES').AsDate := vFechaInteres;
//credito no visado por defecto
                ParamByName('ID_ESTADO_COLOCACION').AsInteger := 4;
                ParamByName('ID_ENTE_APROBADOR').AsInteger := vEnteAprobador;
                ParamByName('ID_EMPLEADO').AsString := DBAlias;
                ParamByName('NOTA_CONTABLE').AsString := vNotaContable;
                ParamByName('NUMERO_CUENTA').AsInteger := vCtaAportes;
                ParamByName('ES_ANORMAL').AsInteger := 0;
                ExecSQL;
                Close;
              end;
              Result:= true;
           except
              Result := false;
              dmGeneral.IBTransaction1.Rollback;
           end;

end;

procedure TfrmNuevaColocacion1.CmdInformeClick(Sender: TObject);
var
TasaNominal : Double;
PuntosAdic : Double;
begin
        with IBQuerytabla do
        begin
             SQL.Clear;
             SQL.Add('select ID_COLOCACION, CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGAR, ');
             SQL.Add('INTERES_A_PAGAR,(CAPITAL_A_PAGAR + INTERES_A_PAGAR) as TOTALCUOTA ');
             SQL.Add('from "col$tablaliquidacion" where ');
             SQL.Add('(ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION") ORDER BY CUOTA_NUMERO');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COLOCACION').AsString := vIdColocacion;
             Open;
        end;
        with IBQuerycontable do
        begin
             SQL.Clear;
             SQL.Add('select ID_COLOCACION,"col$concol"."CODIGO",NOMBRE,DEBITO,CREDITO');
             SQL.Add(' FROM "col$concol" left join "con$puc" ON ');
             SQL.Add('("col$concol"."CODIGO" = "con$puc"."CODIGO" and "col$concol"."ID_AGENCIA" = "con$puc"."ID_AGENCIA") ');
             SQL.Add('where ("col$concol".ID_AGENCIA = :"ID_AGENCIA") AND ("col$concol".ID_COLOCACION = :"ID_COLOCACION") ORDER BY CREDITO,"col$concol"."CODIGO"');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COLOCACION').AsString := vIdColocacion;
             Open;
        end;
        with IBQuerycolocacion do
        begin
             SQL.Clear;
             SQL.Add('SELECT "col$colocacion".ID_COLOCACION, "col$colocacion".ID_PERSONA, "gen$persona".NOMBRE,');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
             SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
             SQL.Add('"col$lineas".DESCRIPCION_LINEA,"col$inversion".DESCRIPCION_INVERSION,');
             SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,"col$garantia".DESCRIPCION_GARANTIA,');
             SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".VALOR_DESEMBOLSO,');
             SQL.Add('"col$colocacion".PLAZO_COLOCACION,"col$colocacion".FECHA_VENCIMIENTO,');
             SQL.Add('"col$colocacion".TIPO_INTERES,"col$tasasvariables".DESCRIPCION_TASA,');
             SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,"col$colocacion".TASA_INTERES_MORA,');
             SQL.Add('"col$colocacion".PUNTOS_INTERES,"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
             SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".AMORTIZA_INTERES,');
             SQL.Add('"col$colocacion".PERIODO_GRACIA,"col$colocacion".VALOR_CUOTA,');
             SQL.Add('"col$colocacion".FECHA_CAPITAL,"col$colocacion".FECHA_INTERES,');
             SQL.Add('"col$colocacion".NUMERO_CUENTA,"col$colocacion".NOTA_CONTABLE,');
             SQL.Add('"col$tiposcuota".INTERES,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
             SQL.Add('"gen$empleado".NOMBRE AS NOMBRE1');
             SQL.Add('FROM ');
             SQL.Add('"col$colocacion" INNER JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "gen$tiposidentificacion" ON ("gen$persona".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
             SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
             SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION)');
             SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO)');
             SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES)');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("col$colocacion".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO) ');
             SQL.Add(' where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COLOCACION').AsString := vIdColocacion;
             Open;
             PuntosAdic := FieldByName('PUNTOS_INTERES').AsFloat;
             if FieldByName('INTERES').AsString = 'A' then
                TasaNominal := TasaNominalAnticipada(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger) + PuntosAdic
             else
                TasaNominal := TasaNominalVencida(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger) + PuntosAdic;
        end;
        with IBQueryGarPersonal do
        begin
           SQL.Clear;
           SQL.Add('select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$persona".NOMBRE,"col$colgarantias".ID_COLOCACION,');
           SQL.Add('"col$colgarantias".ID_PERSONA FROM "col$colgarantias" ');
           SQL.Add('inner join "gen$persona" on ');
           SQL.Add('("col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA) and ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) ');
           SQL.Add('where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := vIdColocacion;
           Open;
        end;
        with IBQueryGarReal do
        begin
           SQL.Clear;
           SQL.Add('select "col$colgarantiasreal".ID_COLOCACION,"col$colgarantiasreal".NUMERO_ESCRITURA,');
           SQL.Add('"col$colgarantiasreal".FECHA_ESCRITURA,"col$colgarantiasreal".NOMBRE_NOTARIA,');
           SQL.Add('"col$colgarantiasreal".CIUDAD_ESCRITURA,"col$colgarantiasreal".MATRICULA_INMOBILIARIA,');
           SQL.Add('"col$colgarantiasreal".FECHA_REGISTRO,"col$colgarantiasreal".AVALUO, "col$colgarantiasreal"."FECHA_AVALUO",');
           SQL.Add('"col$colgarantiasreal".CUENTAS_DE_ORDEN,"col$colgarantiasreal".POLIZA_INCENDIO,');
           SQL.Add('"col$colgarantiasreal".FECHA_INICIAL_POLIZA,"col$colgarantiasreal".FECHA_FINAL_POLIZA,');
           SQL.Add('"col$colgarantiasreal".VALOR_ASEGURADO ');
           SQL.Add('from "col$colgarantiasreal" where (ID_AGENCIA = :"ID_AGENCIA") AND (ID_COLOCACION = :"ID_COLOCACION")');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := vIdColocacion;
           Open;
        end;

        Saldo := vDesembolso;
        Report.Variables.ByName['Empresa'].AsString := Empresa;
        Report.Variables.ByName['Hoy'].AsDateTime := FechaHoy;
        Report.Variables.ByName['Desembolso'].AsDouble := vDesembolso;
        Report.Variables.ByName['Empleado'].AsString := Nombres + ' ' + Apellidos;
        Report.Variables.ByName['TasaNominal'].AsDouble := TasaNominal;
//        Report.Variables.ByName['CuentaAportes'].AsString := vctaaportes;
        If Report.PrepareReport then
           Report.PreviewPreparedReport(true);
        IBQuerytabla.Close;
        IBQuerycontable.Close;
        IBQuerycolocacion.Close;
        IBQueryGarPersonal.Close;
        IBQueryGarReal.Close;
end;


procedure TfrmNuevaColocacion1.GrabarGarantias;
var I:Integer;
    PRecord:PGaPer;
    RRecord:PGaReal;
begin
try
        with dmColocacion.IBQuery do
        begin
           SQL.Clear;
           SQL.Add('insert into "col$colgarantias" VALUES (');
           SQL.Add(':"ID_AGENCIA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
           SQL.Add(':"ID_PERSONA",:"CSC_GARANTIA")');
           LGarPer.Pack;
           for I := 0 to (LGarPer.Count - 1) do
           begin
              PRecord := LGarPer.Items[I];
              try
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_COLOCACION').AsString := vIdColocacion;
               ParamByName('ID_IDENTIFICACION').AsInteger := PRecord^.TipoId ;
               ParamByName('ID_PERSONA').AsString := PRecord^.NumeroId ;
               ParamByName('CSC_GARANTIA').AsInteger := I + 1;
               ExecSQL;
              finally
               Close;
              end;
           end;

           SQL.Clear;
           SQL.Add('insert into "col$colgarantiasreal" VALUES (');
           SQL.Add(':"ID_AGENCIA",:"ID_COLOCACION",:"NUMERO_ESCRITURA",:"FECHA_ESCRITURA",');
           SQL.Add(':"NOMBRE_NOTARIA",:"CIUDAD_ESCRITURA",:"MATRICULA_INMOBILIARIA",');
           SQL.Add(':"FECHA_REGISTRO",:"AVALUO", :"FECHA_AVALUO", :"CUENTAS_DE_ORDEN",:"POLIZA_INCENDIO",');
           SQL.Add(':"VALOR_ASEGURADO",:"FECHA_INICIAL_POLIZA",:"FECHA_FINAL_POLIZA",');
           SQL.Add(':"CODIGO_ASEGURADORA")');
           for I:= 0 to (LGarReal.Count - 1) do
           begin
               RRecord := LGarReal.Items[I];
               try
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                ParamByName('NUMERO_ESCRITURA').AsString := RRecord^.Escritura ;
                ParamByName('FECHA_ESCRITURA').AsDate := RRecord^.FechaEscritura;
                ParamByName('NOMBRE_NOTARIA').AsString := RRecord^.Notaria ;
                ParamByName('CIUDAD_ESCRITURA').AsString := RRecord^.CiudadEscritura ;
                ParamByName('MATRICULA_INMOBILIARIA').AsString := RRecord^.Matricula ;
                ParamByName('FECHA_REGISTRO').AsDate := RRecord^.FechaRegistro;
                ParamByName('AVALUO').AsCurrency := RRecord^.ValorAvaluo ;
                ParamByName('FECHA_AVALUO').AsDate := RRecord^.FechaAvaluo;
                ParamByName('CUENTAS_DE_ORDEN').AsCurrency := RRecord^.CuentasOrden;
                ParamByName('POLIZA_INCENDIO').AsString := RRecord^.Poliza;
                ParamByName('VALOR_ASEGURADO').AsCurrency := RRecord^.ValorAsegurado ;
                ParamByName('FECHA_INICIAL_POLIZA').AsDate := RRecord^.FechaIPoliza ;
                ParamByName('FECHA_FINAL_POLIZA').AsDate := RRecord^.FechaFPoliza ;
                ParamByName('CODIGO_ASEGURADORA').AsString := RRecord^.CodigoAseguradora;
                ExecSQL;
               finally
                Close;
               end;
           end;
        end;
except
dmGeneral.IBTransaction1.Rollback;
end;
end;

procedure TfrmNuevaColocacion1.ReportUnknownObjFunction(Sender: TObject;
  Component: TComponent; const FuncName: String;
  const Parameters: TprVarsArray; ParametersCount: Integer;
  var Value: TprVarValue; var IsProcessed: Boolean);
var   f : TField;
begin
if (Component=IBQuerytabla) and
   (AnsiCompareText(FuncName,'IBQuerytabla.Field')=0) and
   (ParametersCount=1) then
  begin
    // Parameter with index 0 is the fieldname
    f := IBQuerytabla.FindField(_vAsString(Parameters[0]));
    if f<>nil then
      begin
        // field is found return length of field value
        Saldo := Saldo - f.AsCurrency;
        _vSetAsDouble(Value,Saldo);
        IsProcessed := true;
      end
  end

end;

procedure TfrmNuevaColocacion1.CmdCrearPersonaClick(Sender: TObject);
var frmCreacionPersona:TfrmCreacionPersona;
begin
      frmCreacionPersona := TfrmCreacionPersona.Create(Self);
      frmCreacionPersona.ShowModal;
      EdNumeroIdentificacionExit(Sender);
end;

procedure TfrmNuevaColocacion1.EdNumeroColocacion2Exit(Sender: TObject);
//var
//colocacion : string;
//fecha : TDate;
//ayo   : string;
//cadena : string;
begin
{          fecha := Now;
          ayo := currtostr((yearof(fecha)));
          colocacion := trim(EdNumeroColocacion.Text);
          vIdColocacion := concat(ayo,formatcurr('0000000',strtoint(colocacion)));}
          VIdcolocacion := trim(EdNumeroColocacion.Text);
          if VIdcolocacion = '' then
          begin
            MessageDlg('El Número de la Colocación no puede estar vacío',mtError,[mbOK],0);
            EdNumeroColocacion.SetFocus;
            exit;
          end;
          //VidColocacion := formatcurr('00000000000',strtoint(colocacion));
          EdNumeroColocacion.Text := vIdcolocacion;

        if DmGeneral.IBTransaction1.InTransaction then
           DmGeneral.IBTransaction1.CommitRetaining;

          with IBSQL1 do
           begin
             sql.Clear;
             sql.Add('Select * from "col$colocacion"');
             sql.Add(' where ');
             sql.Add('(ID_AGENCIA = :"ID_AGENCIA") AND ');
             sql.Add('(ID_COLOCACION = :"ID_COLOCACION")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COLOCACION').AsString := Vidcolocacion;
             ExecQuery;

             if RecordCount = 1 then
              begin
                MessageDlg('Esta Colocación ya Existe',mtError,[mbOk],0);
                EdNumeroColocacion.SetFocus;
              end;
             close;
           end;
end;

procedure TfrmNuevaColocacion1.CBEnteAprobadorKeyPress(Sender: TObject;
  var Key: Char);
begin
        GroupBox3.SetFocus;
end;

procedure TfrmNuevaColocacion1.EdNumeroColocacion2KeyPress(Sender: TObject;
  var Key: Char);
begin
          GroupBox4.Enabled := True;
end;

procedure TfrmNuevaColocacion1.GridPersonalSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
        posgrid := ARow-1;
        CanSelect := true;
        CmdPerEliminar.Enabled := true;
end;

procedure TfrmNuevaColocacion1.CmdPerEliminarClick(Sender: TObject);
var
PRecord:PGaPer;
begin
        if posgrid <> -1 then
        begin
           PRecord := LGarPer.Items[posgrid];
           LGarper.Remove(PRecord);
           LGarPer.Pack;
           posgrid := -1;
           ActualizarGridPersonas;
           CmdPerEliminar.Enabled := false;
        end
        else
         MessageDlg('No Seleccionó Garantía',mterror,[mbOk],0);
end;

procedure TfrmNuevaColocacion1.GridRealSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
        posgrid := ARow-1;
        CanSelect := true;
        CmdHipEliminar.Enabled := true;
end;

procedure TfrmNuevaColocacion1.CmdHipEliminarClick(Sender: TObject);
var
PRecord:PGaReal;
begin
        if posgrid <> -1 then
        begin
           PRecord := LGarReal.Items[posgrid];
           LGarReal.Remove(PRecord);
           LGarReal.Pack;
           posgrid := -1;
           ActualizarGridReal;
           CmdHipEliminar.Enabled := false;
        end
        else
         MessageDlg('No Seleccionó Garantía',mterror,[mbOk],0);
end;

procedure TfrmNuevaColocacion1.EdNombreExit(Sender: TObject);
begin
      GroupBox2.Enabled := true;
      CBClasificacion.SetFocus;
      GroupBox3.Enabled := true;
end;

procedure TfrmNuevaColocacion1.FormShow(Sender: TObject);
begin
        if DmGeneral.IBTransaction1.InTransaction then
         begin
           DmGeneral.IBTransaction1.Commit;
           DmGeneral.IBTransaction1.StartTransaction;
         end;
        try
          Inicializar;
        finally
        end;

        FechaHoy := Date;
end;

procedure TfrmNuevaColocacion1.Button1Click(Sender: TObject);
begin
        dmcolocacion.IBDStiposid.Open;
end;

function TfrmNuevaColocacion1.VerificarAportesCreditosAnt(TipoIdentificacion:Integer;NumeroIdentificacion:String):Currency;
var
Saldo : Currency;
VecesAportes : Integer;
PorcentajeAportes : Single;
AportesRequeridos : Currency;
EsVigente : Integer;
I : Integer;
begin
        with dmColocacion.IBQuery1 do
        begin
          SQL.Clear;
          SQL.Add('Select ID_ESTADO_COLOCACION, DESCRIPCION_ESTADO_COLOCACION from "col$estado"');
          SQL.Add('where "col$estado".ES_VIGENTE = 1');
          Open;
          EsVigente := FieldByName('ID_ESTADO_COLOCACION').AsInteger;
          Close;

          SQL.Clear;
          SQL.Add('select');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('("col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL) AS SALDO,');
          SQL.Add('"col$lineas".VECES_APORTES,');
          SQL.Add('"col$lineas".PORCENTAJE_APORTES');
          SQL.Add(' from "col$colocacion" ');
          SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
          SQL.Add(' where ');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION = :"ID_IDENTIFICACION" AND');
          SQL.Add('"col$colocacion".ID_PERSONA = :"ID_PERSONA" AND');
          SQL.Add('"col$colocacion".ID_ESTADO_COlOCACION = :"ID_ESTADO_COLOCACION"');
          ParamByName('ID_IDENTIFICACION').AsInteger := TipoIdentificacion;
          ParamByName('ID_PERSONA').AsString := NumeroIdentificacion;
          ParamByName('ID_ESTADO_COLOCACION').AsInteger := EsVigente;
          Open;
          AportesRequeridos := 0;
          VecesAportes := 0;
          PorcentajeAportes := 0;
          RecordCount;
          while not dmColocacion.IBQuery1.Eof do
           begin
             Saldo := FieldByName('SALDO').AsCurrency;
             VecesAportes := FieldByName('VECES_APORTES').AsInteger;
             PorcentajeAportes := FieldByName('PORCENTAJE_APORTES').AsFloat;
             if VecesAportes > 0 then
               AportesRequeridos := AportesRequeridos + SimpleRoundTo(Saldo/VecesAportes,0);
             if PorcentajeAportes > 0 then
               AportesRequeridos := AportesRequeridos + SimpleRoundTo(((Saldo*PorcentajeAportes)/100),0);
             VecesAportes := 0;
             PorcentajeAportes := 0;
             Next;
           end;
        end;
        Close;
        Result := AportesRequeridos;
end;

procedure TfrmNuevaColocacion1.CBtasavariableExit(Sender: TObject);
begin
{        if vTipoTasa = 'F' then
         begin
           DmColocacion.IBDStipocuota.ParamByName('ES_VARIABLE').AsInteger := BooleanoToInt(False);
           DmColocacion.IBDStipocuota.ParamByName('ES_FIJA').AsInteger := BooleanoToInt(True);
         end;
        if vTipoTasa = 'V' then
         begin
           DmColocacion.IBDStipocuota.ParamByName('ES_VARIABLE').AsInteger := BooleanoToInt(True);
           DmColocacion.IBDStipocuota.ParamByName('ES_FIJA').AsInteger := BooleanoToInt(False);
           EdTasaEfectiva.Text := '0';
           EdPuntosAdicionales.SetFocus;
         end;                           }

        vTasaVariable := CBtasavariable.KeyValue;
        EdPuntosAdicionales.SetFocus;
end;

function TfrmNuevaColocacion1.BuscarAportes(TipoId: integer;
  DocumentoId: string): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
begin
   with IBSQL2 do begin
     Close;
     SQL.Clear;
     Sql.Add('select * from P_CAP_0019 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
     ParamByName('ID_PERSONA').AsString := vNumeroId;
     ExecQuery;
     Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     Digito := StrToInt(DigitoControl(1,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;

     SQL.Clear;
     SQL.Add('Select * from P_CAP_0012 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
     ParamByName('ANO').AsString := IntToStr(YearOf(Date));
     try
      ExecQuery;
      if RecordCount < 1 then
        Saldo := 0
      else
        Saldo := FieldByName('SALDOAHORROS').AsCurrency;
     except
      MessageDlg('Error Consultando Saldo Inicial',mtError,[mbcancel],0);
      Exit;
     end;

     Close;
     SQL.Clear;
     SQL.Add('SELECT * from P_CAP_0010 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:FECHA1,:FECHA2)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
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
     SQL.Add('SELECT  * from P_CAP_0011 (:NUMERO_CUENTA,:DIGITO_CUENTA)');
     ParamByName('NUMERO_CUENTA').AsInteger := Cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := Digito;
     ExecQuery;
     Canje := FieldByName('CHEQUES').AsCurrency;
     Close;
   end;
     Saldo := Saldo + Movimiento;
     Result := Saldo - Canje;
end;

procedure TfrmNuevaColocacion1.ComboSolicitudExit(Sender: TObject);
begin
    vSolicitud := ComboSolicitud.Text;
    with IBSQL1 do begin
     Close;
     SQL.Clear;
     SQL.Add('select * from "col$solicitud" where');
     SQL.Add('ID_IDENTIFACION =:ID_IDENTIFICACION and');
     SQL.Add('ID_PERSONA =:ID_PERSONA and ID_SOLICITUD =:ID_SOLICITUD');
     ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
     ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
     ParamByName('ID_SOLICITUD').AsString := vSolicitud;
     ExecQuery;
     vClasificacion := FieldByName('CLASIFICACION').AsInteger;
     vLinea := FieldByName('LINEA').AsInteger;
     vInversion := FieldByName('INVERSION').AsInteger;
     vRespaldo := FieldByName('RESPALDO').AsInteger;
     vGarantia := FieldByName('GARANTIA').AsInteger;
     vDesembolso := FieldByName('VALOR_APROBADO').AsCurrency;
     vPlazo := FieldByName('PLAZO_APROBADO').AsInteger;
     vAmortizaCapital := FieldByName('AMORTIZACION').AsInteger;
     vAmortizaInteres := FieldByName('PAGO_INTERES').AsInteger;
     vTipoCuota := FieldByName('TIPO_CUOTA').AsInteger;
     vEnteAprobador := FieldByName('ENTE_APROBADOR').AsInteger;
     Close;





    CBClasificacion.SetFocus;
end;

end.

descuentos

        with dmColocacion.IBQuery do
        begin
           SQL.Clear;
           SQL.Add('select CODIGO,DESCRIPCION_DESCUENTO,VALOR_DESCUENTO,PORCENTAJE_COLOCACION from ');
           SQL.Add(' "col$descuentos" ');
           Open;
           if RecordCount > 0 then
           begin
             Last;
             First;
             vDescuento := 0;
             while Not Eof do
             begin
                if FieldByName('VALOR_DESCUENTO').AsCurrency > 0 then
                 begin
                   vDescuento := FieldByName('VALOR_DESCUENTO').AsCurrency;
                 end
                else
                if FieldByName('PORCENTAJE_COLOCACION').AsFloat > 0 then
                   vDescuento := (FieldByName('PORCENTAJE_COLOCACION').AsFloat / 100) * vDesembolso;

                if vDescuento > 0 then
                begin
                  vCaja := vCaja - vDescuento;
                  vFechaHora := fFechaHoraActual;
                  with IBSQL2 do
                   begin
                     SQL.Clear;
                     SQL.Add('insert into "col$concol" ("ID_AGENCIA","ID_COLOCACION","CODIGO",');
                     SQL.Add('"DEBITO","CREDITO","FECHA_Y_HORA") values (');
                     SQL.Add(':"ID_AGENCIA", :"ID_COLOCACION",');
                     SQL.Add(':"CODIGO", :"DEBITO", :"CREDITO",');
                     SQL.Add(':"FECHA_Y_HORA")');
                     ParamByName('ID_AGENCIA').AsInteger := Agencia;
                     ParamByName('ID_COLOCACION').AsString := vIdColocacion;
                     ParamByName('CODIGO').AsString := dmColocacion.IBQuery.FieldByName('CODIGO').AsString;
                     ParamByName('DEBITO').AsCurrency := 0;
                     ParamByName('CREDITO').AsCurrency := vDescuento;
                     ParamByName('FECHA_Y_HORA').AsDateTime := vFechaHora;
                     ExecQuery;
                   end;
                end;
                vDescuento := 0;
                Next;
             end;
           end;
           Close;
        end;

