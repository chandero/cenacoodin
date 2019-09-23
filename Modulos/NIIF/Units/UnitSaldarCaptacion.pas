unit UnitSaldarCaptacion;

interface

uses
  Windows, Messages, SysUtils, Variants,Math, Classes, DateUtils,Graphics, Controls, Forms,
  Dialogs, XStringGrid, DB, JvTypedEdit, StdCtrls, lmdstdcA, ExtCtrls,
  Buttons, Grids, JvEdit, ComCtrls, DBCtrls, IBSQL, IBCustomDataSet,
  IBQuery, pr_Common, pr_TxClasses, unitDmGeneral, UnitDmCaptacion;

type
  TfrmSaldarCaptacion = class(TForm)
    GroupCaptacion: TGroupBox;
    PageControl: TPageControl;
    TabAportacion: TTabSheet;
    Label49: TLabel;
    Label50: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBLCBTiposIdentificacionApo: TDBLookupComboBox;
    EdIdentificacionApo: TMemo;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label21: TLabel;
    EdDigitoAportacion: TStaticText;
    EdFechaAperApo: TDateTimePicker;
    EdNumeroAportacion: TJvEdit;
    EdPrimerApellidoApo: TStaticText;
    EdSegundoApellidoApo: TStaticText;
    EdNombreApo: TStaticText;
    TabAlaVista: TTabSheet;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdPrimerApellidoTitAho: TStaticText;
    EdSegundoApellidoTitAho: TStaticText;
    EdNombresTitAho: TStaticText;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    Label20: TLabel;
    EdDigitoAho: TStaticText;
    EdFechaAperturaAho: TDateTimePicker;
    EdNumeroAho: TJvEdit;
    GroupBox1: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    EdFirmasAho: TLMDSpinEdit;
    EdSellosAho: TLMDSpinEdit;
    EdProtecAho: TLMDSpinEdit;
    TabContractual: TTabSheet;
    GroupBox11: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    DBLCBTiposIdentificacionCont: TDBLookupComboBox;
    EdNumeroIdentificacionCont: TMemo;
    EdPrimerApellidoCont: TStaticText;
    EdSegundoApellidoCont: TStaticText;
    EdNombresCont: TStaticText;
    GroupBox12: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBLCBPlanContractual: TDBLookupComboBox;
    EdValorContractual: TJvCurrencyEdit;
    EdFechaAperturaContractual: TDateTimePicker;
    EdFechaVencimientoContractual: TStaticText;
    EdProximoAbonoContractual: TStaticText;
    GroupBox13: TGroupBox;
    Label41: TLabel;
    EdDigitoContractual: TStaticText;
    EdNumeroContractual: TJvEdit;
    TabCertificado: TTabSheet;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    DBLCBTiposIdentificacionCer: TDBLookupComboBox;
    EdNumeroIdentificacionCer: TMemo;
    EdPrimerApellidoCer: TStaticText;
    EdSegundoApellidoCer: TStaticText;
    EdNombresCer: TStaticText;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    EdValorCer: TJvCurrencyEdit;
    ComboTipoTasa: TComboBox;
    EdTasaEfectivaCer: TJvFloatEdit2;
    DBLCBTasasVariables: TDBLookupComboBox;
    EdPuntosCer: TJvFloatEdit2;
    EdAmortizaCer: TJvIntegerEdit;
    ComboModalidadCer: TComboBox;
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBLCBTipoCaptacionCer: TDBLookupComboBox;
    EdNumeroCapCer: TJvEdit;
    EdDigitoCapCer: TStaticText;
    EdNombreCapCer: TStaticText;
    EdFechaAperturaCer: TDateTimePicker;
    EdPlazoCer: TJvIntegerEdit;
    EdFechaVencimientoCer: TStaticText;
    GroupBox14: TGroupBox;
    GridBeneficiariosCer: TXStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DBLCBTiposCaptacion: TDBLookupComboBox;
    CmdContinuar: TBitBtn;
    Panel2: TPanel;
    CmdOtra: TBitBtn;
    CmdSaldar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdInforme: TBitBtn;
    DSTiposCaptacion: TDataSource;
    DSIntVariable: TDataSource;
    DSTiposCaptacionCer: TDataSource;
    DSPlanContractual: TDataSource;
    DSTiposIdentificacion1: TDataSource;
    DSTiposIdentificacion2: TDataSource;
    DSTiposIdentificacion3: TDataSource;
    DSTiposIdentificacion4: TDataSource;
    DSTiposIdentificacion5: TDataSource;
    Label29: TLabel;
    EdNumeroCer: TJvEdit;
    EdDigitoCer: TStaticText;
    Label6: TLabel;
    EdEstadoApo: TStaticText;
    Label3: TLabel;
    EdEstadoAho: TStaticText;
    Label4: TLabel;
    EdEstadoContractual: TStaticText;
    Label10: TLabel;
    EdEstadoCer: TStaticText;
    IBSQL1: TIBSQL;
    IBDComprobante: TIBDataSet;
    IBDAuxiliar: TIBDataSet;
    GridTitulares: TXStringGrid;
    IBAuxiliar: TIBQuery;
    IBAuxiliarID_COMPROBANTE: TIntegerField;
    IBAuxiliarDESCRIPCION_AGENCIA: TIBStringField;
    IBAuxiliarTIPO: TIBStringField;
    IBAuxiliarFECHADIA: TDateField;
    IBAuxiliarDESCRIPCION: TMemoField;
    IBAuxiliarPRIMER_APELLIDO: TIBStringField;
    IBAuxiliarSEGUNDO_APELLIDO: TIBStringField;
    IBAuxiliarNOMBRE: TIBStringField;
    IBAuxiliarCODIGO: TIBStringField;
    IBAuxiliarCUENTA: TIBStringField;
    IBAuxiliarDEBITO: TIBBCDField;
    IBAuxiliarCREDITO: TIBBCDField;
    ReporteC: TprTxReport;
    GroupBox3: TGroupBox;
    ChkGMFCer: TCheckBox;
    Label5: TLabel;
    ValorGMFCer: TJvCurrencyEdit;
    cmdFormaPago: TBitBtn;
    procedure EdNumeroCerExit(Sender: TObject);
    procedure DBLCBTiposCaptacionEnter(Sender: TObject);
    procedure CmdContinuarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCerKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroContractualExit(Sender: TObject);
    procedure EdNumeroContractualKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroAhoExit(Sender: TObject);
    procedure EdNumeroAhoKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroAportacionExit(Sender: TObject);
    procedure EdNumeroAportacionKeyPress(Sender: TObject; var Key: Char);
    procedure GridTitularesClick(Sender: TObject);
    procedure CmdSaldarClick(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure CmdOtraClick(Sender: TObject);
    procedure cmdFormaPagoClick(Sender: TObject);
  private
    procedure Inicializar;
    procedure ActualizarListAho;
    function GrabarCertificado: Boolean;
    function GrabarAportacion: Boolean;
    function GrabarAlaVista: boolean;
    function GrabarContractual: boolean;
    { Private declarations }
  public

    { Public declarations }
  end;

type
  PMyListAho = ^AListAho;
  AListAho = record
    TipoId: Integer;
    NumeroId: String;
    TipoT : Integer;
  end;


var
  frmSaldarCaptacion: TfrmSaldarCaptacion;
  dmGeneral : TdmGeneral;
  dmCaptacion: TdmCaptacion;
  tipo:Integer;
  MyListAho: TList;
  plazo:Integer;
  EdProximoPagoCer: TDate;
  OldIdentificacion:Integer;
  OldPersona:string;
  SePuedeMarcar:Boolean;
  Comprobante:Integer;
  SaldoActual:Currency;
  ValorEfectivo:Currency;
  ValorCheque:Currency;
  ValorCredito:Currency;
  NumeroCheque:string;
  CodigoBanco:Integer;

implementation

{$R *.dfm}

uses  unitGlobales, UnitEfectivoNota;

procedure TfrmSaldarCaptacion.EdNumeroCerExit(Sender: TObject);
var i:Integer;
begin
        if EdNumeroCer.Text <> '' then
        begin
          EdNumeroCer.Text := Format('%.7d',[StrToInt(edNumeroCer.Text)]);
          EdDigitoCer.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.Text);
          Application.ProcessMessages;
          with dmCaptacion.IBSQL1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select VALOR_INICIAL,FECHA_APERTURA,PLAZO_CUENTA,TIPO_INTERES,ID_INTERES,TASA_EFECTIVA,');
               SQL.Add('PUNTOS_ADICIONALES,MODALIDAD,AMORTIZACION,"cap$maestro".ID_ESTADO,FECHA_VENCIMIENTO,FECHA_VENCIMIENTO_PRORROGA,"cap$maestrotitular".ID_IDENTIFICACION,"cap$maestrotitular".ID_PERSONA,');
               SQL.Add('"cap$tiposestado".DESCRIPCION,"cap$tiposestado".PERMITE_MOVIMIENTO,');
               SQL.Add('PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,ID_TIPO_CAPTACION_ABONO,NUMERO_CUENTA_ABONO');
               SQL.Add(' from "cap$maestro" INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and ');
               SQL.Add(' "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and ');
               SQL.Add(' "cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and ');
               SQL.Add(' "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA )');
               SQL.Add(' LEFT JOIN "gen$persona" ON "cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and ');
               SQL.Add(' "cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA ');
               SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
               SQL.Add(' where ');
               SQL.Add('"cap$maestro".ID_AGENCIA = :"ID_AGENCIA" and ');
               SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
               SQL.Add('"cap$maestro".NUMERO_CUENTA = :"NUMERO_CUENTA" and ');
               SQL.Add('"cap$maestro".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
               ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
               ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
               try
                 ExecQuery;
                 if RecordCount > 0 then
                 begin
                    DBLCBTiposIdentificacionCer.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
                    EdNumeroIdentificacionCer.Text := FieldByName('ID_PERSONA').AsString;
                    EdPrimerApellidoCer.Caption := FieldByName('PRIMER_APELLIDO').AsString;
                    EdSegundoApellidoCer.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
                    EdNombresCer.Caption := FieldByName('NOMBRE').AsString;
                    EdValorCer.Value := FieldByName('VALOR_INICIAL').AsCurrency;
                    SaldoActual := FieldByName('VALOR_INICIAL').AsCurrency;
                    ValorGMFCer.Value := FieldByName('VALOR_INICIAL').AsCurrency;
                    EdEstadoCer.Caption := FieldByName('DESCRIPCION').AsString;
                    if FieldByName('TIPO_INTERES').AsString = 'F' then
                    begin
                       ComboTipoTasa.ItemIndex := 0;
                       DBLCBTasasVariables.KeyValue := 0;
                    end
                    else
                    begin
                       ComboTipoTasa.ItemIndex := 1;
                       DBLCBTasasVariables.keyvalue := FieldByName('ID_INTERES').AsInteger;
                    end;
                    EdPuntosCer.Value := FieldByName('PUNTOS_ADICIONALES').AsInteger;
                    EdTasaEfectivaCer.Value := FieldByName('TASA_EFECTIVA').AsFloat;
                    EdAmortizaCer.Value := FieldByName('AMORTIZACION').AsInteger;
                    if FieldByName('MODALIDAD').AsString = 'V' then
                            ComboModalidadCer.ItemIndex := 0
                    else
                            ComboModalidadCer.ItemIndex := 1;
                    EdPlazoCer.Value := FieldByName('PLAZO_CUENTA').AsInteger;
                    EdFechaAperturaCer.Date := FieldByName('FECHA_APERTURA').AsDate;
                    if FieldByName('FECHA_VENCIMIENTO').AsDate > FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDate then
                       EdFechaVencimientoCer.Caption := DateToStr(FieldByName('FECHA_VENCIMIENTO').AsDate)
                    else
                       EdFechaVencimientoCer.Caption := DateToStr(FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDate);
                    if (FieldByName('PERMITE_MOVIMIENTO').AsInteger = 0) {or (StrToDate(EdFechaVencimientoCer.Caption) < Date) } then
                       SePuedeMarcar := False
                    else
                       SePuedeMarcar := True;
                    DBLCBTipoCaptacionCer.KeyValue := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                    EdNumeroCapCer.Text := Format('%.7d',[FieldByName('NUMERO_CUENTA_ABONO').AsInteger]);
                    EdDigitoCapCer.Caption := DigitoControl(DBLCBTipoCaptacionCer.KeyValue,EdNumeroCapCer.Text);
                    Close;
                    SQL.Clear;
                    SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE ');
                    SQL.Add('from "gen$persona" INNER JOIN "cap$maestrotitular" ON ');
                    SQL.Add('"gen$persona".ID_IDENTIFICACION = "cap$maestrotitular".ID_IDENTIFICACION and ');
                    SQL.Add('"gen$persona".ID_PERSONA = "cap$maestrotitular".ID_PERSONA where ');
                    SQL.Add(' ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                    SQL.Add(' NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacionCer.KeyValue;
                    ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCapCer.Text);
                    ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCapCer.Caption);
                    try
                     ExecQuery;
                     if RecordCount > 0 then
                       EdNombreCapCer.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                 FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                 FieldByName('NOMBRE').AsString;
                    except
                       EdNombreCapCer.Caption := 'Error Buscando Captacion';
                    end;
                  EdNumeroCer.Enabled := False;
                  cmdFormaPago.Enabled := True;
                 end
                 else
                 begin
                    MessageDlg('Captación no Existe!',mtError,[mbcancel],0);
                 end;
               except
                    MessageDlg('Error al consultar la Captación!',mtError,[mbcancel],0);
                    Exit;
               end;
          end;
        end
        else
           Exit;

end;

procedure TfrmSaldarCaptacion.DBLCBTiposCaptacionEnter(Sender: TObject);
begin
        DBLCBTiposCaptacion.DropDown;
end;

procedure TfrmSaldarCaptacion.CmdContinuarClick(Sender: TObject);
begin
        with dmCaptacion.IBConsulta do
        begin
                SQL.Clear;
                SQL.Add('select APORTE,AHORRO,CERTIFICADO,PROGRAMADO from "cap$tiposforma" ');
                SQL.Add('left join "cap$tipocaptacion" on "cap$tiposforma".ID_FORMA = "cap$tipocaptacion".ID_FORMA ');
                SQL.Add('where "cap$tipocaptacion".ID_TIPO_CAPTACION = :"ID" ');
                ParamByName('ID').AsInteger := DBLCBTiposCaptacion.KeyValue;
                Open;
                if RecordCount > 0 then
                begin
                   GroupCaptacion.Visible := True;
                   if InttoBoolean(FieldByName('APORTE').AsInteger) then
                   begin
                      PageControl.ActivePage := TabAportacion;
                      tipo := 1;
                      GroupBox5.Enabled := True;
                      EdNumeroAportacion.SetFocus;
                   end
                   else
                   if InttoBoolean(FieldByName('AHORRO').AsInteger) then
                   begin
                      PageControl.ActivePage := TabAlaVista;
                      tipo := 2;
                      GroupBox6.Enabled := True;
                      EdNumeroAho.SetFocus;
                   end
                   else
                   if InttoBoolean(FieldByName('CERTIFICADO').AsInteger) then
                   begin
                      PageControl.ActivePage := TabCertificado;
                      tipo := 4;
                      EdNumeroCer.Enabled := True;
                      EdNumeroCer.SetFocus;
                      
                   end
                   else
                   if InttoBoolean(FieldByName('PROGRAMADO').AsInteger) then
                   begin
                      PageControl.ActivePage := TabContractual;
                      tipo := 3;
                      GroupBox13.Enabled := True;
                      EdNumeroContractual.SetFocus;
                   end;
                   Panel1.Enabled := False;
                end;

        end;

end;

procedure TfrmSaldarCaptacion.Inicializar;
begin
        if dmCaptacion.IBTiposCaptacion.Transaction.InTransaction then
           dmCaptacion.IBTiposCaptacion.Transaction.Rollback;

        if IBSQL1.Transaction.InTransaction then
           IBSQL1.Transaction.Rollback;

        IBSQL1.Transaction.StartTransaction;

//        dmCaptacion.IBTiposCaptacion.Transaction.StartTransaction;

        with dmCaptacion do
        begin
          IBTiposParentesco.Open;
          IBTiposCaptacion.Open;
          IBTiposCaptacion.Last;
          IBTiposIdentificacion.Open;
          IBTiposParentesco.Open;
          IBTasasVariables.Open;
          IBTiposCaptacionCer.Open;
          IBPlanContractual.Open;
        end;
        Comprobante := 0;
        GroupCaptacion.Visible := false;
        Panel1.Enabled := True;
        DBLCBTiposCaptacion.SetFocus;
        try
           MyListAho := TList.Create;
        finally
        end;
        MyListAho.Clear;
// TabAportacion
        DBLCBTiposIdentificacionApo.KeyValue := -1;
        EdIdentificacionApo.Text := '';
        EdPrimerApellidoApo.Caption := '';
        EdSegundoApellidoApo.Caption := '';
        EdNombreApo.Caption := '';
        EdNumeroAportacion.text := '';
        EdDigitoAportacion.Caption := '';
        EdFechaAperApo.Date := Date;
        EdEstadoAho.Caption := '';

// TabAlaVista
        with GridTitulares do
        begin
                RowCount := 2;
                Cells[0,1] := '';
                Cells[1,1] := '';
                Cells[2,1] := '';
                Cells[3,1] := '';
        end;
        EdPrimerApellidoTitAho.Caption := '';
        EdSegundoApellidoTitAho.Caption := '';
        EdNombresTitAho.Caption := '';
//        DBLCBTiposIdentificacion5.KeyValue := -1;
{        with GridBeneficiariosAho do
        begin
            RowCount := 2;
            Cells[0,1] := '';
            Cells[1,1] := '';
            Cells[2,1] := '';
            Cells[3,1] := '';
            Cells[4,1] := '';
        end;}
//        EdIdentificacionAutAho.Text := '';
//        EdPrimerApellidoAutAho.Text := '';
//        EdSegundoApellidoAutAho.Text := '';
//        EdNombresAutAho.Text := '';
        EdFirmasAho.Value := 0;
        EdSellosAho.Value := 0;
        EdProtecAho.Value := 0;
        EdNumeroAho.text := '';
        EdDigitoAho.Caption := '';
        EdFechaAperturaAho.Date := Date;

// TabContractual
        DBLCBTiposIdentificacionCont.KeyValue := -1;
        EdNumeroIdentificacionCont.Text := '';
        EdPrimerApellidoCont.Caption := '';
        EdSegundoApellidoCont.Caption := '';
        EdNombresCont.Caption := '';
        DBLCBPlanContractual.KeyValue := -1;
        EdValorContractual.Value := 0;
        EdFechaAperturaContractual.Date := Date;
        EdFechaVencimientoContractual.Caption := '';
        EdProximoAbonoContractual.Caption:= '';
        EdNumeroContractual.text := '';
        EdDigitoContractual.Caption := '';

// TabCertificados
        DBLCBTiposIdentificacionCer.KeyValue := -1;
        EdNumeroIdentificacionCer.Text := '';
        EdPrimerApellidoCer.Caption := '';
        EdSegundoApellidoCer.Caption := '';
        EdNombresCer.Caption := '';
        EdValorCer.Value := 0;
        ComboTipoTasa.ItemIndex := 0;
        DBLCBTasasVariables.KeyValue := -1;
        EdPuntosCer.Value := 0;
        EdTasaEfectivaCer.Value := 0;
        EdAmortizaCer.Value := 15;
        ComboModalidadCer.ItemIndex := 0;
        EdPlazoCer.Value := 15;
        EdFechaAperturaCer.Date := Date;
        EdFechaVencimientoCer.Caption := '';
        DBLCBTipoCaptacionCer.KeyValue := -1;
        EdNumeroCapCer.Text := '';
        EdDigitoCapCer.Caption := '';
        EdNombreCapCer.Caption := '';
        EdNumeroCer.text := '';
        EdDigitoCer.Caption := '';
        with GridBeneficiariosCer do
        begin
            RowCount := 2;
            Cells[0,1] := '';
            Cells[1,1] := '';
            Cells[2,1] := '';
            Cells[3,1] := '';
            Cells[4,1] := '';
        end;



end;

procedure TfrmSaldarCaptacion.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        dmCaptacion := TdmCaptacion.Create(self);

        dmCaptacion.IBTiposCaptacion.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBTiposIdentificacion.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBConsulta.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBTiposParentesco.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBTasasVariables.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBTiposCaptacionCer.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBPlanContractual.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBGrabar.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBSQL1.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBTiposTitular.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBTiposCaptacionCon.Database := dmGeneral.IBDatabase1;
        dmCaptacion.IBTiposCaptacionF.Database := dmGeneral.IBDatabase1;

        dmCaptacion.IBTiposCaptacion.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBTiposIdentificacion.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBConsulta.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBTiposParentesco.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBTasasVariables.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBTiposCaptacionCer.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBPlanContractual.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBGrabar.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBSQL1.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBTiposTitular.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBTiposCaptacionCon.Transaction := dmGeneral.IBTransaction1;
        dmCaptacion.IBTiposCaptacionF.Transaction := dmGeneral.IBTransaction1;

        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBDComprobante.Database := dmGeneral.IBDatabase1;
        IBDAuxiliar.Database := dmGeneral.IBDatabase1;
        IBAuxiliar.Database := dmGeneral.IBDatabase1;

        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBDComprobante.Transaction := dmGeneral.IBTransaction1;
        IBDAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar.Transaction := dmGeneral.IBTransaction1;

end;

procedure TfrmSaldarCaptacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        dmCaptacion.Free;
end;

procedure TfrmSaldarCaptacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmSaldarCaptacion.FormShow(Sender: TObject);
begin
        Inicializar;

end;

procedure TfrmSaldarCaptacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmSaldarCaptacion.EdNumeroCerKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmSaldarCaptacion.EdNumeroContractualExit(Sender: TObject);
begin
        if EdNumeroContractual.Text <> '' then
        begin
           EdNumeroContractual.Text := Format('%.7d',[StrToInt(EdNumeroContractual.Text)]);
           EdDigitoContractual.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroContractual.Text);
        end
        else
        begin
           MessageDlg('Captación no encontrada',mtError,[mbcancel],0);
           Exit;
        end;

        with dmCaptacion.IBSQL1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select "cap$maestro".ID_PLAN,"cap$maestro".VALOR_INICIAL,"cap$maestro".FECHA_VENCIMIENTO,');
            SQL.Add('"cap$maestro".FECHA_APERTURA,"cap$maestro".FECHA_PROXIMO_PAGO,"cap$tiposestado".DESCRIPCION,"cap$tiposestado".PERMITE_MOVIMIENTO,"gen$persona".ID_IDENTIFICACION,');
            SQL.Add('"gen$persona".ID_PERSONA,"gen$persona".PRIMER_APELLIDO,');
            SQL.Add('"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE from "gen$persona" INNER JOIN ');
            SQL.Add('"cap$maestrotitular" ON "cap$maestrotitular".ID_IDENTIFICACION ');
            SQL.Add(' = "gen$persona".ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA ');
            SQL.Add(' INNER JOIN "cap$maestro" ON "cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and ');
            SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and ');
            SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and "cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA ');
            SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
            SQL.Add(' where ');
            SQL.Add('"cap$maestro".ID_AGENCIA = :"ID_AGENCIA" and "cap$maestro".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
            SQL.Add('"cap$maestro".NUMERO_CUENTA = :"NUMERO_CUENTA" and "cap$maestro".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoContractual.Caption);
            try
              ExecQuery;
              if RecordCount > 0 then
              begin
                 DBLCBTiposIdentificacionCont.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
                 EdNumeroIdentificacionCont.Text := FieldByName('ID_PERSONA').AsString;
                 EdPrimerApellidoCont.Caption := FieldByName('PRIMER_APELLIDO').AsString;
                 EdSegundoApellidoCont.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
                 EdNombresCont.Caption := FieldByName('NOMBRE').AsString;
                 DBLCBPlanContractual.KeyValue := FieldByName('ID_PLAN').AsInteger;
                 EdValorContractual.Value := FieldByName('VALOR_INICIAL').AsCurrency;
                 EdFechaAperturaContractual.Date := FieldByName('FECHA_APERTURA').AsDate;
                 EdFechaVencimientoContractual.Caption := DateToStr(FieldByName('FECHA_VENCIMIENTO').AsDate);
                 EdProximoAbonoContractual.Caption := DateToStr(FieldByName('FECHA_PROXIMO_PAGO').AsDate);
                 EdEstadoContractual.Caption := FieldByName('DESCRIPCION').AsString;
                 if FieldByName('PERMITE_MOVIMIENTO').AsInteger = 0 then
                    SePuedeMarcar := False
                 else
                    SePuedeMarcar := True;
                 GroupBox13.Enabled := False;
                 CmdSaldar.Enabled := True;
              end;
            except
              MessageDlg('Error Localizando el Titular de la Captacion',mterror,[mbCancel],0);
              Exit;
            end;
        end;

end;

procedure TfrmSaldarCaptacion.EdNumeroContractualKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmSaldarCaptacion.EdNumeroAhoExit(Sender: TObject);
var ARecord: PMyListAho;
    I:Integer;
begin
        if EdNumeroAho.Text <> '' then
        begin
           EdNumeroAho.Text := Format('%.7d',[StrToInt(EdNumeroAho.Text)]);
           EdDigitoAho.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.Text);
        end
        else
           Exit;

        MyListAho.Clear;
        with dmCaptacion.IBSQL1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select FECHA_APERTURA,FIRMAS, SELLOS, PROTECTOGRAFOS, "cap$tiposestado".PARA_SALDAR,"cap$tiposestado".DESCRIPCION,"cap$tiposestado".PERMITE_MOVIMIENTO');
            SQL.Add('from "cap$maestro" ');
            SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
            SQL.Add(' where ');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
            SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
            try
              ExecQuery;
              if RecordCount > 0 then
              begin
                 EdFechaAperturaAho.Date := FieldByName('FECHA_APERTURA').AsDate;
                 EdFirmasAho.Value := FieldByName('FIRMAS').AsInteger;
                 EdSellosAho.Value := FieldByName('SELLOS').AsInteger;
                 EdProtecAho.Value := FieldByName('PROTECTOGRAFOS').AsInteger;
                 EdEstadoAho.Caption := FieldByName('DESCRIPCION').AsString;
                 if FieldByName('PERMITE_MOVIMIENTO').AsInteger = 0 then
                    SePuedeMarcar := False
                 else
                    SePuedeMarcar := True;
                 GroupBox6.Enabled := False;
              end;
            except
              MessageDlg('Error Consultando Captación',mtError,[mbCancel],0);
              Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select NUMERO_TITULAR,ID_IDENTIFICACION,ID_PERSONA, TIPO_TITULAR ');
            SQL.Add('from "cap$maestrotitular" where ');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
            SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
            SQL.Add('ORDER BY NUMERO_TITULAR');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
            try
              ExecQuery;
              if RecordCount > 0 then
              begin
                while not Eof do
                begin
                  New(ARecord);
                  ARecord^.TipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
                  ARecord^.NumeroId := FieldByName('ID_PERSONA').AsString;
                  ARecord^.TipoT := FieldByName('TIPO_TITULAR').AsInteger;
                  MyListAho.Add(ARecord);
                  Next;
                end;
                ActualizarListAho;
                GridTitulares.Row := 1;
                GridTitularesClick(Sender);
              end;
            except
              MessageDlg('Error consultando titulares en Captación',mtError,[mbcancel],0);
              Exit;
            end;

            {Close;
            SQL.Clear;
            SQL.Add('select ');
            SQL.Add('"cap$maestrobeneficiario".PRIMER_APELLIDO,');
            SQL.Add('"cap$maestrobeneficiario".SEGUNDO_APELLIDO,');
            SQL.Add('"cap$maestrobeneficiario".NOMBRE,');
            SQL.Add('"cap$maestrobeneficiario".PORCENTAJE,');
            SQL.Add('"gen$tiposparentesco".DESCRIPCION_PARENTESCO ');
            SQL.Add(' from ');
            SQL.Add('"gen$tiposparentesco" ');
            SQL.Add('INNER JOIN "cap$maestrobeneficiario" ON ("gen$tiposparentesco".ID_PARENTESCO = "cap$maestrobeneficiario".ID_PARENTESCO) ');
            SQL.Add(' where ');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
            SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
            try
              ExecQuery;
              if RecordCount > 0 then
              begin
               I := 0;
               while not Eof do
               begin
                    I := I + 1;
                    if I > 1 then
                       GridBeneficiariosAho.RowCount := I + 1;
                    GridBeneficiariosAho.Cells[0,I] := FieldByName('PRIMER_APELLIDO').AsString;
                    GridBeneficiariosAho.Cells[1,I] := FieldByName('SEGUNDO_APELLIDO').AsString;
                    GridBeneficiariosAho.Cells[2,I] := FieldByName('NOMBRE').AsString;
                    GridBeneficiariosAho.Cells[3,I] := FieldByName('DESCRIPCION_PARENTESCO').AsString;
                    GridBeneficiariosAho.Cells[4,I] := IntToStr(FieldByName('PORCENTAJE').AsInteger);
                    Next;
               end;
              end;
            except
               MessageDlg('Error Consultando los Beneficiarios de la Captacion',mtError,[mbcancel],0);
               Exit;
            end;}

            {Close;
            SQL.Clear;
            SQL.Add('select ID_IDENTIFICACION,ID_PERSONA,PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE ');
            SQL.Add('from "cap$maestroautorizado" where ');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
            SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
            try
              ExecQuery;
              if RecordCount > 0 then
              begin
                DBLCBTiposIdentificacion5.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
                EdIdentificacionAutAho.Text := FieldByName('ID_PERSONA').AsString;
                EdPrimerApellidoAutAho.Text := FieldByName('PRIMER_APELLIDO').AsString;
                EdSegundoApellidoAutAho.Text := FieldByName('SEGUNDO_APELLIDO').AsString;
                EdNombresAutAho.Text := FieldByName('NOMBRE').AsString;
              end;
            except
              MessageDlg('Error Consultando Autorizado de la Captación',mtError,[mbcancel],0);
              Exit;
            end;}
        end;
        if SePuedeMarcar then
           CmdSaldar.Enabled:=True;

end;

procedure TfrmSaldarCaptacion.EdNumeroAhoKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmSaldarCaptacion.EdNumeroAportacionExit(Sender: TObject);
begin
        if Ednumeroaportacion.Text = '' then Exit;
        EdNumeroAportacion.Text := Format('%.7d',[StrtoInt(EdNumeroAportacion.Text)]);
        EdDigitoAportacion.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAportacion.Text);
        with dmCaptacion.IBSQL1 do
        begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT ');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,');
             SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$persona".NOMBRE,');
             SQL.Add('"gen$persona".ID_IDENTIFICACION,');
             SQL.Add('"gen$persona".ID_PERSONA,');
             SQL.Add('"cap$maestro".FECHA_APERTURA,');
             SQL.Add('"cap$tiposestado".DESCRIPCION,');
             SQL.Add('"cap$tiposestado".PERMITE_MOVIMIENTO');
             SQL.Add(' FROM ');
             SQL.Add('"cap$maestrotitular" ');
             SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA) ');
             SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA) AND ("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION) AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA) ');
             SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
             SQL.Add('INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
             SQL.Add(' WHERE ');
             SQL.Add('("cap$maestrotitular".ID_AGENCIA = :"ID_AGENCIA") AND ');
             SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION") AND ');
             SQL.Add('("cap$maestrotitular".NUMERO_CUENTA = :"NUMERO_CUENTA") AND ');
             SQL.Add('("cap$maestrotitular".DIGITO_CUENTA = :"DIGITO_CUENTA")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := dblcbtiposcaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAportacion.Caption);
             try
                ExecQuery;
                if RecordCount > 0 then begin
                 DBLCBTiposIdentificacionApo.KeyValue := FieldByName('ID_IDENTIFICACION').AsInteger;
                 OldIdentificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
                 EdIdentificacionApo.Text := FieldByName('ID_PERSONA').AsString;
                 OldPersona := FieldByName('ID_PERSONA').AsString;
                 EdFechaAperApo.Date := FieldByName('FECHA_APERTURA').AsDate;
                 EdPrimerApellidoApo.Caption := FieldByName('PRIMER_APELLIDO').AsString;
                 EdSegundoApellidoApo.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
                 EdNombreApo.Caption := FieldByName('NOMBRE').AsString;
                 EdEstadoApo.Caption := FieldByName('DESCRIPCION').AsString;
                 if FieldByName('PERMITE_MOVIMIENTO').AsInteger = 0 then
                    SePuedeMarcar := False
                 else
                    SePuedeMarcar := True;
                 GroupBox5.Enabled := False;
                 CmdSaldar.Enabled := True;
                end;
             except
                MessageDlg('Error en la Consulta de la Aportación',mtError,[mbcancel],0);
             end;
        end;

end;

procedure TfrmSaldarCaptacion.EdNumeroAportacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmSaldarCaptacion.ActualizarListAho;
var i:Integer;
    ARecord:PMyListAho;
begin
              if MyListAho.Count <= 1 then
              begin
                 GridTitulares.RowCount := 2;
                 GridTitulares.Cells[0,1] := '';
                 GridTitulares.Cells[1,1] := '';
                 GridTitulares.Cells[2,1] := '';
                 GridTitulares.Cells[3,1] := '';
              end
              else
                 GridTitulares.RowCount := MyListAho.Count + 1;

              for i := 0 to MyListAho.Count-1 do
              begin
                ARecord := MyListAho.Items[i];
                GridTitulares.Cells[0,i+1] := Format('%.2d',[i+1]);
                GridTitulares.Cells[1,i+1] := Format('%d',[ARecord^.TipoId]);
                GridTitulares.Cells[2,i+1] := ARecord^.NumeroId;
                GridTitulares.Cells[3,i+1] := Format('%d',[ARecord^.TipoT]);
              end;

end;

procedure TfrmSaldarCaptacion.GridTitularesClick(Sender: TObject);
var ARecord:PMyListAho;
begin
        if ( GridTitulares.Row > 0 ) and
           ( MyListAho.Count > 0 ) then
        begin
           ARecord := MyListAho.Items[GridTitulares.Row - 1];
           with dmCaptacion.IBSQL1 do
           begin
               Close;
               SQL.Clear;
               SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE FROM "gen$persona" where ');
               SQL.Add('ID_IDENTIFICACION = :"ID_ID" and ID_PERSONA = :"ID_PE"');
               ParamByName('ID_ID').AsInteger := ARecord^.TipoId;
               ParamByName('ID_PE').AsString := ARecord^.NumeroId;
               ExecQuery;
               if RecordCount = 1 then
               begin
                EdPrimerApellidotitAho.Caption := FieldByName('PRIMER_APELLIDO').AsString;
                EdSegundoApellidotitAho.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
                EdNombresTitAho.Caption := FieldByName('NOMBRE').AsString;
               end;
               Close;
           end;
        end;
end;

procedure TfrmSaldarCaptacion.CmdSaldarClick(Sender: TObject);
var r:Boolean;
begin
        if MessageDlg('Seguro de Saldar la captación',mtConfirmation,[mbYes,mbno],0) = mrNo then
           Exit;

        r := False;
        case tipo of
           1: r := GrabarAportacion;
           2: r := GrabarAlaVista;
           3: r := GrabarContractual;
           4: r := GrabarCertificado;
        end;

        if not r then
        begin
           dmCaptacion.IBGrabar.Transaction.Rollback;
           MessageDlg('Error al Saldar la Captación' + #13 +
                      'verifique la información',mtError,[mbOk],0);
           CmdSaldar.Enabled := False;
        end
        else
        begin
           dmCaptacion.IBGrabar.Transaction.Commit;
           MessageDlg('Captación Saldada con exito!',mtInformation,[mbOK],0);
           CmdSaldar.Enabled := False;
           if (DBLCBTiposCaptacion.KeyValue = 6 ) then
              CmdInforme.Click;
        end;
        Inicializar;
end;


function TfrmSaldarCaptacion.GrabarCertificado: boolean;
var GMF,GMFCheque,GMFNCredito:Currency;
    Codigo_Captacion:string;
    Codigo_Efectivo,Codigo_Cheque,Codigo_Credito:string;
//    Codigo_Abono:string;
    Codigo_GMF:string;
    Codigo_GastoGMF:string;
    Efectivo:Boolean;
    Valor,ValorBaseGMF:Currency;
    TipoCaptacion:Integer;
    TipoCaptacionCer:Integer;
    ValorEfe:Currency;
    ValorChe:Currency;
    ValorCre:Currency;
    Estado:Integer;
    VecesGMF:Currency;
begin
        Result := False;
        if not SePuedeMarcar then
        begin
           MessageDlg('Esta Captacion No se puede saldar',mtError,[mbcancel],0);
           CmdSaldar.Enabled := False;
           Result:=False;
           Exit;
        end;

        TipoCaptacion       := DBLCBTiposCaptacion.KeyValue;
        TipoCaptacionCer    := DBLCBTipoCaptacionCer.KeyValue;

// Buscar códigos contables
        with IBSQL1 do
        begin
// Código Captación
            Close;
            SQL.Clear;
            SQL.Add('select "cap$codigospuc".CODIGO from "cap$codigospuc" ');
            SQL.Add('where ID_TIPO_CAPTACION = :ID and :DIAS BETWEEN "cap$codigospuc".DESDE and "cap$codigospuc".HASTA');
            ParamByName('ID').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('DIAS').AsInteger :=  EdPlazoCer.Value;
            try
              ExecQuery;
            except
              MessageDlg('Error buscando código contable de captación',mterror,[mbcancel],0);
              Exit;
            end;
            Codigo_Captacion := FieldByName('CODIGO').AsString;

// Código Abono
            Close;
            if ValorEfectivo > 0 then
            begin
             SQL.Clear;
             SQL.Add('select CODIGO_CONTABLE from "cap$contable"');
             SQL.Add('where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
             ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
             ParamByName('ID_CONTABLE').AsInteger := 7;
             try
              ExecQuery;
              Codigo_Efectivo := FieldByName('CODIGO_CONTABLE').AsString;
              Close;
             except
              MessageDlg('Error buscando código de Efectivo',mterror,[mbcancel],0);
              Exit;
             end;
            end;

            if ValorCheque > 0 then
            begin
             SQL.Clear;
             SQL.Add('select CODIGO from "gen$bancoscheques" where ID_BANCO = :ID_BANCO');
             ParamByName('ID_BANCO').AsInteger := CodigoBanco;
             try
              ExecQuery;
              Codigo_Cheque := FieldByName('CODIGO').AsString;
              Close;
             except
              MessageDlg('Error buscando código del Banco',mterror,[mbcancel],0);
              Exit;
             end;
            end;

            if ValorCredito > 0 then
            begin
              SQL.Clear;
              SQL.Add('select CODIGO_CONTABLE from "cap$tipocaptacion"');
              SQL.Add('where ID_TIPO_CAPTACION = :ID');
              ParamByName('ID').AsInteger := DBLCBTipoCaptacionCer.KeyValue;
             try
              ExecQuery;
              Codigo_Credito := FieldByName('CODIGO_CONTABLE').AsString;
              Close;
             except
              MessageDlg('Error buscando código del Banco',mterror,[mbcancel],0);
              Exit;
             end;
            end;

// Codigo GMF
            Close;
            SQL.Clear;
            SQL.Add('select CODIGO_CONTABLE from "cap$contable"');
            SQL.Add('where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 8;
            try
             ExecQuery;
            except
              MessageDlg('Error buscando código tres x mil a captación',mterror,[mbcancel],0);
              Exit;
            end;
            Codigo_GMF := FieldByName('CODIGO_CONTABLE').AsString;
// Codigo TresxMil Gasto
            Close;
            SQL.Clear;
            SQL.Add('select CODIGO_CONTABLE from "cap$contable"');
            SQL.Add('where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 9;
            try
             ExecQuery;
            except
              MessageDlg('Error buscando código GMF',mterror,[mbcancel],0);
              Exit;
            end;
            Codigo_GastoGMF := FieldByName('CODIGO_CONTABLE').AsString;

            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$minimos" where ID_MINIMO = 12');
            try
             ExecQuery;
             VecesGMF := FieldByName('VALOR_MINIMO').AsCurrency;
            except
             MessageDlg('Error buscando Veces GMF',mtError,[mbcancel],0);
             Exit;
            end;

            Close;
        end;

        if (ValorCredito < ValorGMFCer.Value) and (ValorCredito > 0) then
           ValorBaseGMF := ValorCredito
        else
           ValorBaseGMF := ValorGMFCer.Value;

        Valor := EdValorCer.Value;

        if ChkGMFCer.Checked then
        begin
           GMFNCredito := SimpleRoundTo((ValorBaseGMF / 1000) * VecesGMF,0);
        end
        else
        begin
           GMFNCredito := 0;
        end;

        if ValorCheque > 0 then
           GMFCheque := SimpleRoundTo((ValorCheque / 1000) * VecesGMF,0);

        GMF := GMFNCredito + GMFCheque;

// Buscar Consecutivo
        Comprobante := ObtenerConsecutivo(IBSQL1,4);
// Fin Obtener Consecutivo
         with IBSQL1 do
         begin
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('insert into "con$comprobante"');
            SQL.Add('values (:"ID_COMPROBANTE", :"ID_AGENCIA", :"TIPO_COMPROBANTE", :"FECHADIA",');
            SQL.Add(':"DESCRIPCION", :"TOTAL_DEBITO", :"TOTAL_CREDITO", :"ESTADO", :"IMPRESO",');
            SQL.Add(':"ANULACION", :"ID_EMPLEADO")');
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
            ParamByName('FECHADIA').AsDateTime := Date;
            ParamByName('DESCRIPCION').AsString := 'Captación Saldada No:' + Ednumerocer.Text + '-' + EdDigitoCer.Caption + ' ' +
                                                    EdPrimerApellidoCer.Caption + ' ' + EdSegundoApellidoCer.Caption + EdNombresCer.Caption +
                                                   ' en la Fecha ';
            ParamByName('TOTAL_DEBITO').AsCurrency := Valor + GMF;
            ParamByName('TOTAL_CREDITO').AsCurrency := Valor + GMF;
            ParamByName('ESTADO').AsString := 'O';
            ParamByName('IMPRESO').AsInteger := 1;
            ParamByName('ANULACION').AsString := '';
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            try
             ExecQuery;
             Close;
            except
             MessageDlg('No se pudo grabar en comprobante',mtError,[mbcancel],0);
             Transaction.Rollback;
             Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('insert into "con$auxiliar"');
            SQL.Add('values');
            SQL.Add('(:"ID_COMPROBANTE", :"ID_AGENCIA", :"FECHA", :"CODIGO", :"DEBITO", :"CREDITO",');
            SQL.Add(':"ID_CUENTA", :"ID_COLOCACION", :"ID_IDENTIFICACION", :"ID_PERSONA",');
            SQL.Add(':"MONTO_RETENCION", :"TASA_RETENCION", :"ESTADOAUX")');
// Captación
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := Date;
            ParamByName('CODIGO').AsString := Codigo_Captacion;
            ParamByName('DEBITO').AsCurrency := Valor;
            ParamByName('CREDITO').AsCurrency := 0;
            ParamByName('ID_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacionCer.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCer.Text;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            try
              ExecQuery;
            except
              MessageDlg('Error al Escribir en el Auxiliar Captación',mtError,[mbcancel],0);
              Transaction.Rollback;
              Exit;
            end;
// si valor efectivo > 0
            if ValorEfectivo > 0 then
            begin
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := Date;
             ParamByName('CODIGO').AsString := Codigo_Efectivo;
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := ValorEfectivo;
             ParamByName('ID_CUENTA').Clear;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             try
               ExecQuery;
             except
               MessageDlg('Error al Escribir en el Auxiliar Abono',mtError,[mbcancel],0);
               Transaction.Rollback;
               Exit;
             end;
            end;
// if valor cheque > 0
            if ValorCheque > 0 then
            begin
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := Date;
             ParamByName('CODIGO').AsString := Codigo_Cheque;
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := ValorCheque;
             ParamByName('ID_CUENTA').Clear;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             try
               ExecQuery;
             except
               MessageDlg('Error al Escribir en el Auxiliar Abono',mtError,[mbcancel],0);
               Transaction.Rollback;
               Exit;
             end;
            end;
// if valor credito > 0
            if ValorCredito > 0 then
            begin
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := Date;
             ParamByName('CODIGO').AsString := Codigo_Credito;
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := ValorCredito;
             ParamByName('ID_CUENTA').AsInteger := StrToInt(EdNumeroCapCer.Text);
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacionCer.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCer.Text;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             try
               ExecQuery;
             except
               MessageDlg('Error al Escribir en el Auxiliar Abono',mtError,[mbcancel],0);
               Transaction.Rollback;
               Exit;
             end;
            end;

// GMF por Depositos
            if GMFNCredito > 0 then begin
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := Date;
             ParamByName('CODIGO').AsString := Codigo_GMF;
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := GMFNCredito;
             ParamByName('ID_CUENTA').AsInteger := 0;
             ParamByName('ID_COLOCACION').AsString := '';
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').AsString := '';
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             try
               ExecQuery;
             except
               MessageDlg('Error al Escribir en el Auxiliar GMF',mtError,[mbcancel],0);
               Transaction.Rollback;
               Exit;
             end;
            end;
// GMF por Bancos
            if GMFCheque > 0 then begin
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := Date;
             ParamByName('CODIGO').AsString := Codigo_Cheque;
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := GMFCheque;
             ParamByName('ID_CUENTA').AsInteger := 0;
             ParamByName('ID_COLOCACION').AsString := '';
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').AsString := '';
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             try
               ExecQuery;
             except
               MessageDlg('Error al Escribir en el Auxiliar GMF',mtError,[mbcancel],0);
               Transaction.Rollback;
               Exit;
             end;
            end;
// Gasto GMF
            if GMF > 0 then begin
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := Date;
             ParamByName('CODIGO').AsString := Codigo_GastoGMF;
             ParamByName('DEBITO').AsCurrency := GMF;
             ParamByName('CREDITO').AsCurrency := 0;
             ParamByName('ID_CUENTA').AsInteger := 0;
             ParamByName('ID_COLOCACION').AsString := '';
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').AsString := '';
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             try
               ExecQuery;
             except
               MessageDlg('Error al Escribir en el Auxiliar Gasto',mtError,[mbcancel],0);
               Transaction.Rollback;
               Exit;
             end;
            end;

            if ValorCredito > 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add('insert into "cap$extracto" values(');
              SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
              SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
              SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
              SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacionCer;
              ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCapCer.Text);
              ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(eddigitocapcer.Caption);
              ParamByName('FECHA_MOVIMIENTO').AsDate := Date;
              ParamByName('HORA_MOVIMIENTO').AsTime := Time;
              ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 12;
              ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
              ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Captación Saldada No.' +
                                                                IntToStr(DBLCBTiposCaptacion.KeyValue) + '-' +
                                                                EdNumeroCer.Text + '-' + EdDigitoCer.Caption;
              ParamByName('VALOR_DEBITO').AsCurrency := ValorCredito;
              ParamByName('VALOR_CREDITO').AsCurrency := 0;
              try
                ExecQuery;
                Close;
              except
                MessageDlg('Error abonando en Captación',mtError,[mbcancel],0);
                Transaction.Rollback;
                Exit;
              end;

            end;
// Marcar Captación Como Saldada
            SQL.Clear;
            SQL.Add('update "cap$maestro"');
            SQL.Add('set ID_ESTADO = :ID, FECHA_SALDADA = :FECHA');
            SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
            SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
            ParamByName('FECHA').AsDate := fFechaActual;
            if (ValorEfectivo > 0) then
            begin
               ParamByName('ID').AsInteger := 5;
               Estado := 5;
            end
            else
            begin
               ParamByName('ID').AsInteger := 2;
               Estado := 2;
            end;
            try
              ExecQuery;
              Close;
            except
              MessageDlg('Error Marcando Captación',mtError,[mbcancel],0);
              Transaction.Rollback;
              Exit;
            end;

// Marcar Captacion para Ser Saldada

            SQL.Clear;
            SQL.Add('insert into "cap$maestrosaldar"');
            SQL.Add('("cap$maestrosaldar"."CHEQUE", "cap$maestrosaldar"."DIGITO_CUENTA", "cap$maestrosaldar"."EFECTIVO",');
            SQL.Add('"cap$maestrosaldar"."FECHA", "cap$maestrosaldar"."HORA", "cap$maestrosaldar"."ID_AGENCIA",');
            SQL.Add('"cap$maestrosaldar"."ID_ESTADO", "cap$maestrosaldar"."ID_TIPO_CAPTACION",');
            SQL.Add('"cap$maestrosaldar"."NCREDITO", "cap$maestrosaldar"."NUMERO_CUENTA","cap$maestrosaldar".ID_BANCO, "cap$maestrosaldar".NUMERO_CHEQUE)');
            SQL.Add('values');
            SQL.Add('(:"CHEQUE", :"DIGITO_CUENTA", :"EFECTIVO", :"FECHA", :"HORA", :"ID_AGENCIA",');
            SQL.Add(':"ID_ESTADO", :"ID_TIPO_CAPTACION", :"NCREDITO", :"NUMERO_CUENTA",:"ID_BANCO",:"NUMERO_CHEQUE")');

            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
            ParamByName('EFECTIVO').AsCurrency := ValorEfectivo;
            ParamByName('CHEQUE').AsCurrency := ValorCheque;
            ParamByName('NCREDITO').AsCurrency := ValorCredito;
            ParamByName('ID_BANCO').AsInteger := CodigoBanco;
            ParamByName('NUMERO_CHEQUE').AsString := NumeroCheque;
            ParamByName('FECHA').AsDate := fFechaActual;
            ParamByName('HORA').AsTime := fHoraActual;
            ParamByName('ID_ESTADO').AsInteger := Estado;
            try
              ExecQuery;
              Close;
            except
              MessageDlg('Error Marcando Captación "cap$maestrosaldar"',mtError,[mbcancel],0);
              Transaction.Rollback;
              Exit;
            end;



          end;


          CmdInforme.Enabled := True;
          Result := True;
end;

procedure TfrmSaldarCaptacion.CmdInformeClick(Sender: TObject);
begin
        with IBAuxiliar do
        begin
             if Transaction.InTransaction then
                Transaction.Commit;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
             SQL.Add('"con$comprobante".FECHADIA,');
             SQL.Add('"con$comprobante".DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('"con$auxiliar".CODIGO,');
             SQL.Add('"con$puc".NOMBRE AS CUENTA,');
             SQL.Add('"con$auxiliar".ID_CUENTA,');
             SQL.Add('"con$auxiliar".DEBITO,');
             SQL.Add('"con$auxiliar".CREDITO');
             SQL.Add('from ');
             SQL.Add('"con$comprobante" ');
             SQL.Add('INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
             SQL.Add('INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('("con$comprobante".ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             try
              Open;
              ReporteC.Variables.ByName['EMPRESA'].AsString := Empresa;
              ReporteC.Variables.ByName['NIT'].AsString := Nit;
              if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
              Close;
              Transaction.Commit;
             except
               Transaction.Rollback;
               MessageDlg('Error generando el comprobante',mtError,[mbcancel],0);
               Close;
             end;

        end;
end;

function TfrmSaldarCaptacion.GrabarAportacion: Boolean;
begin
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT * FROM SALDO_ACTUAL(:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
         ParamByName('AG').AsInteger := Agencia;
         ParamByName('TP').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('CTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
         ParamByName('DG').AsInteger := StrToInt(EdDigitoAportacion.Caption);
         ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
         ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
         ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
         try
          ExecQuery;
          if RecordCount > 0 then
            SaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency
          else
            SaldoActual := 0;
         except
          Transaction.Rollback;
          raise;
         end;

         Close;
         SQL.Clear;
         SQL.Add('UPDATE "cap$maestro" SET ID_ESTADO = :ID, FECHA_SALDADA = :FECHA');
         SQL.Add('WHERE ID_AGENCIA = :ID_AGENCIA and ');
         SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
         SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAportacion.Caption);
         ParamByName('FECHA').AsDate := fFechaActual;
         if SaldoActual = 0 then
            ParamByName('ID').AsInteger := 2
         else
            ParamByName('ID').AsInteger := 5;
         try
           ExecQuery;
           Result := True;
         except
           MessageDlg('Error al Marcar la Captación',mtError,[mbcancel],0);
           Exit;
         end;
        end;

end;

function TfrmSaldarCaptacion.GrabarAlaVista: boolean;
begin
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT * FROM SALDO_ACTUAL(:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
         ParamByName('AG').AsInteger := Agencia;
         ParamByName('TP').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('CTA').AsInteger := StrToInt(EdNumeroAho.Text);
         ParamByName('DG').AsInteger := StrToInt(EdDigitoAho.Caption);
         ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
         ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
         ParamByName('FECHA2').AsDate := EncodeDate(YearOf(fFechaActual),12,31);
         try
          ExecQuery;
          if RecordCount > 0 then
            SaldoActual := FieldByName('SALDO_ACTUAL').AsCurrency
          else
            SaldoActual := 0;
         except
          Transaction.Rollback;
          raise;
         end;

         Close;
         SQL.Clear;
         SQL.Add('UPDATE "cap$maestro" SET ID_ESTADO = :ID, FECHA_SALDADA = :FECHA');
         SQL.Add('WHERE ID_AGENCIA = :ID_AGENCIA and ');
         SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
         SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
         ParamByName('FECHA').AsDate := fFechaActual;
         if SaldoActual = 0 then
            ParamByName('ID').AsInteger := 2
         else
            ParamByName('ID').AsInteger := 5;
         try
           ExecQuery;
           Result := True;
         except
           MessageDlg('Error al Marcar la Captación',mtError,[mbcancel],0);
           Exit;
         end;
        end;
end;

function TfrmSaldarCaptacion.GrabarContractual: boolean;
var TresXMil:Currency;
    Codigo_Captacion:string;
    Codigo_Abono:string;
    Codigo_TresxMil:string;
    Codigo_GastoTresxMil:string;
    Efectivo:Boolean;
    Valor:Currency;
    TipoCaptacion:Integer;
    TipoCaptacionCer:Integer;
begin
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('UPDATE "cap$maestro" SET ID_ESTADO = 2, FECHA_SALDADA = :FECHA');
         SQL.Add('WHERE ID_AGENCIA = :ID_AGENCIA and ');
         SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
         SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoContractual.Caption);
         ParamByName('FECHA').AsDate := fFechaActual;
         try
           ExecQuery;
           Result := True;
         except
           MessageDlg('Error al Marcar la Captación',mtError,[mbcancel],0);
           Exit;
         end;
        end;

end;

procedure TfrmSaldarCaptacion.CmdOtraClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmSaldarCaptacion.cmdFormaPagoClick(Sender: TObject);
var frmEfectivoNota :TfrmEfectivoNota;
begin
//  ValorEfectivo:Currency;
//  ValorCheque:Currency;
//  ValorCredito:Currency;
//  NumeroCheque:string;
//  CodigoBanco:Integer;

    frmEfectivoNota := TfrmEfectivoNota.Create(Self);

    frmEfectivoNota.Efectivo := ValorEfectivo;
    frmEfectivoNota.Cheque   := ValorCheque;
    frmEfectivoNota.Credito  := ValorCredito;
    frmEfectivoNota.Banco    := CodigoBanco;
    frmEfectivoNota.Numero   := NumeroCheque;

    frmEfectivoNota.ShowModal;

    ValorEfectivo := frmEfectivoNota.Efectivo;
    ValorCheque   := frmEfectivoNota.Cheque;
    CodigoBanco   := frmEfectivoNota.Banco;
    NumeroCheque  := frmEfectivoNota.Numero;
    ValorCredito  := frmEfectivoNota.Credito;

    if ( ValorEfectivo + ValorCheque + ValorCredito ) = SaldoActual then
      CmdSaldar.Enabled := true
    else
      CmdSaldar.Enabled := False;
 
end;

end.
