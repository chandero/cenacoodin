
unit UnitCreacionCaptacion;

interface

uses
  Windows, Messages, SysUtils, StrUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Buttons, ComCtrls, DB,
  IBCustomDataSet, IBQuery, Grids, XStringGrid, JvStringGrid, JvGrids,
  lmdstdcA, JvEdit, JvTypedEdit, Mask, JvToolEdit, JvCurrEdit, IBSQL,
  pr_Common, pr_TxClasses, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, JvComponent, JvSimpleXml, sdXmlDocuments, Math, UnitDmGeneral, unitdmCaptacion;

type
  TfrmCreacionCaptacion = class(TForm)
    GroupCaptacion: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    DBLCBTiposCaptacion: TDBLookupComboBox;
    Panel2: TPanel;
    CmdNuevo: TBitBtn;
    CmdGrabar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdInforme: TBitBtn;
    PageControl: TPageControl;
    DSTiposCaptacion: TDataSource;
    TabAportacion: TTabSheet;
    Label49: TLabel;
    DBLCBTiposIdentificacionApo: TDBLookupComboBox;
    Label50: TLabel;
    EdIdentificacionApo: TMemo;
    TabAlaVista: TTabSheet;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DBLCBTiposIdentificacion2: TDBLookupComboBox;
    Label4: TLabel;
    EdNumeroIdentificacionAho: TMemo;
    GridTitulares: TXStringGrid;
    Panel3: TPanel;
    CmdAgregarTitAho: TBitBtn;
    CmdEliminarTitAho: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdPrimerApellidoTitAho: TStaticText;
    EdSegundoApellidoTitAho: TStaticText;
    EdNombresTitAho: TStaticText;
    ComboParentescoAho: TComboCellEditor;
    EdPrimerApellidoBenAho: TEditCellEditor;
    EdSegundoApellidoBenAho: TEditCellEditor;
    EdNombreBenAho: TEditCellEditor;
    EdPorcentajeBenAho: TUpDownCellEditor;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    EdNumeroAportacion: TStaticText;
    EdDigitoAportacion: TStaticText;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    EdNumeroAho: TStaticText;
    EdDigitoAho: TStaticText;
    CmdContinuar: TBitBtn;
    TabContractual: TTabSheet;
    TabCertificado: TTabSheet;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    DBLCBTiposIdentificacionCer: TDBLookupComboBox;
    Label14: TLabel;
    EdNumeroIdentificacionCer: TMemo;
    GroupBox8: TGroupBox;
    EdValorCer: TJvCurrencyEdit;
    Label15: TLabel;
    Label16: TLabel;
    ComboTipoTasa: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    DBLCBTasasVariables: TDBLookupComboBox;
    DSIntVariable: TDataSource;
    Label19: TLabel;
    EdPuntosCer: TJvFloatEdit2;
    EdFechaAperturaAho: TDateTimePicker;
    Label20: TLabel;
    Label21: TLabel;
    EdFechaAperApo: TDateTimePicker;
    Label22: TLabel;
    EdAmortizaCer: TJvIntegerEdit;
    Label23: TLabel;
    ComboModalidadCer: TComboBox;
    GroupBox9: TGroupBox;
    Label24: TLabel;
    DBLCBTipoCaptacionCer: TDBLookupComboBox;
    Label25: TLabel;
    EdNumeroCapCer: TJvEdit;
    EdDigitoCapCer: TStaticText;
    EdNombreCapCer: TStaticText;
    Label26: TLabel;
    Label27: TLabel;
    EdFechaAperturaCer: TDateTimePicker;
    Label28: TLabel;
    EdPlazoCer: TJvIntegerEdit;
    DSTiposCaptacionCer: TDataSource;
    Label30: TLabel;
    EdFechaVencimientoCer: TStaticText;
    GroupBox11: TGroupBox;
    Label34: TLabel;
    DBLCBTiposIdentificacionCont: TDBLookupComboBox;
    Label35: TLabel;
    EdNumeroIdentificacionCont: TMemo;
    GroupBox12: TGroupBox;
    Label36: TLabel;
    DBLCBPlanContractual: TDBLookupComboBox;
    DSPlanContractual: TDataSource;
    Label37: TLabel;
    EdValorContractual: TJvCurrencyEdit;
    Label38: TLabel;
    EdFechaAperturaContractual: TDateTimePicker;
    Label39: TLabel;
    EdFechaVencimientoContractual: TStaticText;
    Label40: TLabel;
    EdProximoAbonoContractual: TStaticText;
    GroupBox13: TGroupBox;
    Label41: TLabel;
    EdNumeroContractual: TStaticText;
    EdDigitoContractual: TStaticText;
    DSTiposIdentificacion1: TDataSource;
    DSTiposIdentificacion2: TDataSource;
    DSTiposIdentificacion3: TDataSource;
    DSTiposIdentificacion4: TDataSource;
    EdPrimerApellidoApo: TStaticText;
    Label42: TLabel;
    Label43: TLabel;
    EdSegundoApellidoApo: TStaticText;
    Label44: TLabel;
    EdNombreApo: TStaticText;
    Label31: TLabel;
    EdPrimerApellidoCont: TStaticText;
    Label32: TLabel;
    EdSegundoApellidoCont: TStaticText;
    Label33: TLabel;
    EdNombresCont: TStaticText;
    Label45: TLabel;
    EdPrimerApellidoCer: TStaticText;
    Label46: TLabel;
    EdSegundoApellidoCer: TStaticText;
    Label47: TLabel;
    EdNombresCer: TStaticText;
    DSTiposIdentificacion5: TDataSource;
    GroupBox1: TGroupBox;
    Label51: TLabel;
    EdFirmasAho: TLMDSpinEdit;
    Label52: TLabel;
    EdSellosAho: TLMDSpinEdit;
    Label53: TLabel;
    EdProtecAho: TLMDSpinEdit;
    GroupBox14: TGroupBox;
    GridBeneficiariosCer: TXStringGrid;
    Panel5: TPanel;
    CmdAgregarBenCer: TBitBtn;
    CmdEliminarBenCer: TBitBtn;
    Label29: TLabel;
    EdNumeroCer: TStaticText;
    EdDigitoCer: TStaticText;
    EdPrimerApellidoBenCer: TEditCellEditor;
    EdSegundoApellidoBenCer: TEditCellEditor;
    EdNombresBenCer: TEditCellEditor;
    ComboParentescoCer: TComboCellEditor;
    EdPorcentajeBenCer: TUpDownCellEditor;
    chkSubCuenta: TCheckBox;
    Label6: TLabel;
    Label10: TLabel;
    DBLCBTiposTitular: TDBLookupComboBox;
    DSTiposTitular: TDataSource;
    IBSQL1: TIBSQL;
    Label5: TLabel;
    EdNotaContable: TStaticText;
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
    Label11: TLabel;
    Label48: TLabel;
    Label54: TLabel;
    DBLCBTiposCaptacionCon: TDBLookupComboBox;
    EdCuentaCon: TJvEdit;
    EdDigitoCon: TStaticText;
    EdNombreCon: TStaticText;
    DSTiposCaptacionF: TDataSource;
    rgApertura: TRadioGroup;
    ReporteCon: TprTxReport;
    IdTCPClient1: TIdTCPClient;
    ADoc: TJvSimpleXml;
    IBDComprobante: TIBDataSet;
    IBDAuxiliar: TIBDataSet;
    IbComprobante: TIBQuery;
    IbAux: TIBQuery;
    IBSQL2: TIBSQL;
    EdTasaEfectivaCer: TStaticText;
    edBanco: TDBLookupComboBox;
    Label55: TLabel;
    IBQBancos: TIBQuery;
    DSBancos: TDataSource;
    IBSQL3: TIBSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdContinuarClick(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBTiposCaptacionEnter(Sender: TObject);
    procedure DBLCBTiposIdentificacionApoEnter(Sender: TObject);
    procedure DBLCBTiposIdentificacion2Enter(Sender: TObject);
    procedure DBLCBTiposIdentificacionContEnter(Sender: TObject);
    procedure DBLCBPlanContractualEnter(Sender: TObject);
    procedure DBLCBTiposIdentificacionCerEnter(Sender: TObject);
    procedure EdIdentificacionApoExit(Sender: TObject);
    procedure EdFechaAperApoExit(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure CmdAgregarTitAhoClick(Sender: TObject);
    procedure GridTitularesClick(Sender: TObject);
    procedure CmdEliminarTitAhoClick(Sender: TObject);
    procedure EdFechaAperturaAhoExit(Sender: TObject);
    procedure EdNumeroIdentificacionContExit(Sender: TObject);
    procedure EdFechaAperturaContractualExit(Sender: TObject);
    procedure EdNumeroIdentificacionCerExit(Sender: TObject);
    procedure ComboTipoTasaExit(Sender: TObject);
    procedure GridBeneficiariosCerClick(Sender: TObject);
    procedure CmdAgregarBenCerClick(Sender: TObject);
    procedure CmdEliminarBenCerClick(Sender: TObject);
    procedure ComboTipoTasaChange(Sender: TObject);
    procedure ComboTipoTasaClick(Sender: TObject);
    procedure EdTasaEfectivaCerExit(Sender: TObject);
    procedure EdNumeroCapCerExit(Sender: TObject);
    procedure DBLCBTipoCaptacionCerEnter(Sender: TObject);
    procedure EdNumeroCapCerKeyPress(Sender: TObject; var Key: Char);
    procedure EdPlazoCerExit(Sender: TObject);
    procedure EdFechaAperturaCerExit(Sender: TObject);
    procedure DBLCBTiposTitularEnter(Sender: TObject);
    procedure EdFechaAperturaAhoChange(Sender: TObject);
    procedure EdFechaAperApoChange(Sender: TObject);
    procedure EdFechaAperturaCerChange(Sender: TObject);
    procedure EdFechaAperturaContractualChange(Sender: TObject);
    procedure EdCuentaConExit(Sender: TObject);
    procedure EdCuentaConKeyPress(Sender: TObject; var Key: Char);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure EdValorCerEnter(Sender: TObject);
    procedure rgAperturaClick(Sender: TObject);
    procedure edBancoClick(Sender: TObject);
  private
    procedure Inicializar;
    function GrabarAportacion(Consecutivo:Integer): Boolean;
    function GrabarAlaVista: Boolean;
    function GrabarContractual: Boolean;
    function GrabarCertificado: Boolean;
    procedure ActualizarListAho;
    function ValidarAportacion: Boolean;
    procedure RepContractual(TipoId, id, NombrePlan: string;
      Incentivo: Currency; vComprobante: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

type
  PMyListAho = ^AListAho;
  AListAho = record
    TipoId: Integer;
    NumeroId: String;
    TipoT:Integer;
  end;

var
  frmCreacionCaptacion: TfrmCreacionCaptacion;
  dmGeneral: TdmGeneral;
  dmCaptacion: TdmCaptacion;
  tipo:Integer;
  MyListAho: TList;
  plazo:Integer;
  EdProximoPagoCer: TDate;
  TasaEfectiva : Double;
  CodigoBanco:String;

implementation

{$R *.dfm}

uses  unitGlobales, unitGlobalesCol,
     UnitRangosdeLibreta,unitcreaciondepersona, UnitVistaPreliminar,
  UnitPantallaProgreso,UnitSelComprobante;

procedure TfrmCreacionCaptacion.FormCreate(Sender: TObject);
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

        IBQBancos.Database := dmGeneral.IBDatabase1;
        IBQBancos.Transaction := dmGeneral.IBTransaction1;

        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBAuxiliar.Database := dmGeneral.IBDatabase1;
        IbAux.Database := dmGeneral.IBDatabase1;
        IbComprobante.Database := dmGeneral.IBDatabase1;
        IBSQL2.Database := dmGeneral.IBDatabase1;
        IBSQL3.Database := dmGeneral.IBDatabase1;
        IBDComprobante.Database := dmGeneral.IBDatabase1;
        IBDAuxiliar.Database := dmGeneral.IBDatabase1;

        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBAuxiliar.Transaction := dmGeneral.IBTransaction1;
        IbAux.Transaction := dmGeneral.IBTransaction1;
        IbComprobante.Transaction := dmGeneral.IBTransaction1;
        IBSQL2.Transaction := dmGeneral.IBTransaction1;
        IBSQL3.Transaction := dmGeneral.IBTransaction1;
        IBDComprobante.Transaction := dmGeneral.IBTransaction1;
        IBDAuxiliar.Transaction := dmGeneral.IBTransaction1;
end;

procedure TfrmCreacionCaptacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmCaptacion.Free;
        dmGeneral.Free;

end;

procedure TfrmCreacionCaptacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmCreacionCaptacion.FormShow(Sender: TObject);
begin

        Inicializar;
end;

procedure TfrmCreacionCaptacion.Inicializar;
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        with dmCaptacion do
        begin
          IBTiposCaptacion.Open;
          IBTiposCaptacion.Last;
          IBTiposCaptacionF.Open;
          IBTiposCaptacionF.Last;
          IBTiposIdentificacion.Open;
          IBTiposIdentificacion.Last;
          IBTiposParentesco.Open;
          IBTiposParentesco.Last;
          IBTasasVariables.Open;
          IBTasasVariables.Last;
          IBTiposCaptacionCer.Open;
          IBTiposCaptacionCer.Last;
          IBPlanContractual.Open;
          IBPlanContractual.Last;
          IBTiposTitular.Open;
          IBTiposTitular.Last;
        end;
        GroupCaptacion.Visible := false;
        Panel1.Enabled := True;
        DBLCBTiposCaptacion.SetFocus;
        ComboParentescoAho.Items.Clear;
        try
           MyListAho := TList.Create;
        finally
        end;
        MyListAho.Clear;
        with dmCaptacion.IBTiposParentesco do
        begin
                First;
                while not Eof do
                begin
                 ComboParentescoAho.Items.Add(FieldByName('DESCRIPCION_PARENTESCO').AsString);
                 ComboParentescoCer.Items.Add(FieldByName('DESCRIPCION_PARENTESCO').AsString);                 
                 Next;
                end;
        end;
// TabAportacion
        DBLCBTiposIdentificacionApo.KeyValue := -1;
        EdIdentificacionApo.Text := '';
        EdPrimerApellidoApo.Caption := '';
        EdSegundoApellidoApo.Caption := '';
        EdNombreApo.Caption := '';
        EdNumeroAportacion.Caption := '';
        EdDigitoAportacion.Caption := '';
        EdFechaAperApo.Date := Date;

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
        DBLCBTiposIdentificacion2.KeyValue := -1;
        EdNumeroIdentificacionAho.Text := '';
        CmdEliminarTitAho.Enabled := False;
        EdFirmasAho.Value := 1;
        EdSellosAho.Value := 0;
        EdProtecAho.Value := 0;
        EdNumeroAho.Caption := '';
        EdDigitoAho.Caption := '';
        EdFechaAperturaAho.Date := Date;
        chkSubCuenta.Checked := False;

// TabContractual
        DBLCBTiposIdentificacionCont.KeyValue := -1;
        EdNumeroIdentificacionCont.Text := '';
        EdPrimerApellidoCont.Caption := '';
        EdSegundoApellidoCont.Caption := '';
        EdNombresCont.Caption := '';
        DBLCBPlanContractual.KeyValue := 0;
        EdValorContractual.Value := 0;
        EdFechaAperturaContractual.Date := Date;
        EdFechaVencimientoContractual.Caption := '';
        EdProximoAbonoContractual.Caption:= '';
        EdNumeroContractual.Caption := '';
        EdDigitoContractual.Caption := '';

// TabCertificados
        DBLCBTiposIdentificacionCer.KeyValue := 0;
        EdNumeroIdentificacionCer.Text := '';
        EdPrimerApellidoCer.Caption := '';
        EdSegundoApellidoCer.Caption := '';
        EdNombresCer.Caption := '';
        EdValorCer.Value := 0;
        ComboTipoTasa.ItemIndex := 0;
        DBLCBTasasVariables.KeyValue := 0;
        EdPuntosCer.Value := 0;
        EdTasaEfectivaCer.Caption := '0.00';
//        EdTasaEfectivaCer.Enabled := False;
        EdAmortizaCer.Value := 15;
        ComboModalidadCer.ItemIndex := 0;
        EdPlazoCer.Value := 15;
        EdFechaAperturaCer.Date := Date;
        EdFechaVencimientoCer.Caption := '';
        DBLCBTipoCaptacionCer.KeyValue := -1;
        EdNumeroCapCer.Text := '';
        EdDigitoCapCer.Caption := '';
        EdNombreCapCer.Caption := '';
        EdNumeroCer.Caption := '';
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
       TasaEfectiva := 0;

       IBQBancos.Open;
       IBQBancos.Last;

end;

procedure TfrmCreacionCaptacion.CmdContinuarClick(Sender: TObject);
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
                      DBLCBTiposIdentificacionApo.SetFocus;
                   end
                   else
                   if InttoBoolean(FieldByName('AHORRO').AsInteger) then
                   begin
                      PageControl.ActivePage := TabAlaVista;
                      tipo := 2;
                      DBLCBTiposTitular.SetFocus;
                   end
                   else
                   if InttoBoolean(FieldByName('CERTIFICADO').AsInteger) then
                   begin
                      PageControl.ActivePage := TabCertificado;
                      tipo := 4;
                      DBLCBTiposIdentificacionCer.SetFocus;
                   end
                   else
                   if InttoBoolean(FieldByName('PROGRAMADO').AsInteger) then
                   begin
                      PageControl.ActivePage := TabContractual;
                      tipo := 3;
                      DBLCBTiposIdentificacionCont.SetFocus;                      
                   end;
                   Panel1.Enabled := False;
                end;

        end;
end;

procedure TfrmCreacionCaptacion.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmCreacionCaptacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmCreacionCaptacion.DBLCBTiposCaptacionEnter(Sender: TObject);
begin
        DBLCBTiposCaptacion.DropDown;
end;

procedure TfrmCreacionCaptacion.DBLCBTiposIdentificacionApoEnter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacionApo.DropDown;
end;

procedure TfrmCreacionCaptacion.DBLCBTiposIdentificacion2Enter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacion2.DropDown;
end;

procedure TfrmCreacionCaptacion.DBLCBTiposIdentificacionContEnter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacionCont.DropDown;
end;

procedure TfrmCreacionCaptacion.DBLCBPlanContractualEnter(Sender: TObject);
begin
        DBLCBPlanContractual.DropDown;
end;

procedure TfrmCreacionCaptacion.DBLCBTiposIdentificacionCerEnter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacionCer.DropDown;
end;

procedure TfrmCreacionCaptacion.EdIdentificacionApoExit(Sender: TObject);
begin
        if EdIdentificacionApo.Text <> '' then
         with dmCaptacion.IBConsulta do
         begin
            SQL.Clear;
            SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from ');
            SQL.Add('"gen$persona" where ID_IDENTIFICACION = :"ID_ID" and ');
            SQL.Add('ID_PERSONA = :"ID_PE"');
            ParamByName('ID_ID').AsInteger := DBLCBTiposIdentificacionApo.KeyValue;
            ParamByName('ID_PE').AsString := EdIdentificacionApo.Text;
            Open;
            if RecordCount > 0 then
            begin
               EdPrimerApellidoApo.Caption := FieldByName('PRIMER_APELLIDO').AsString;
               EdSegundoApellidoApo.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
               EdNombreApo.Caption := FieldByName('NOMBRE').AsString;
            end
            else
            begin
               MessageDlg('Persona no Encontrada!',mtError,[mbOk],0);
               EdIdentificacionApo.SetFocus;
            end;
         end;

end;

procedure TfrmCreacionCaptacion.EdFechaAperApoExit(Sender: TObject);
begin
        CmdGrabar.Enabled := True;
        CmdGrabar.SetFocus;
end;

procedure TfrmCreacionCaptacion.CmdGrabarClick(Sender: TObject);
var r:Boolean;
    frmRangosdeLibreta: TfrmRangosdeLibreta;
begin
        CmdGrabar.Enabled := False;
        Application.ProcessMessages;
        if MessageDlg('Seguro de Grabar la nueva captación',mtConfirmation,[mbYes,mbno],0) = mrNo then
                Abort;
        r := False;
        case tipo of
           1: begin
               MessageDlg('No se puede crear aportes directamente',mtError,[mbcancel],0);
               Exit;
              end; //r := GrabarAportacion(0);
           2: r := GrabarAlaVista;
           3: r := GrabarContractual;
           4: r := GrabarCertificado;
        end;

        if not r then
        begin
           MessageDlg('Error al Grabar la Captación' + #13 +
                      'verifique la información',mtError,[mbOk],0);
           CmdGrabar.Enabled := False;
           dmCaptacion.IBGrabar.Transaction.RollbackRetaining;
        end
        else
        begin
           MessageDlg('Captación Grabada con exito!',mtInformation,[mbOK],0);
           if dmCaptacion.IBGrabar.Transaction.InTransaction then
              dmCaptacion.IBGrabar.Transaction.CommitRetaining;
           CmdGrabar.Enabled := False;
           if tipo = 2 then begin
             frmRangosdeLibreta:= TfrmRangosdeLibreta.Create(Self);
             with frmRangosdeLibreta do begin
               TipoCaptacion := DBLCBTiposCaptacion.KeyValue;
               NumeroCaptacion := StrToInt(EdNumeroAho.Caption);
               ShowModal;
             end;
           end;
        end;

end;

function TfrmCreacionCaptacion.GrabarAportacion(Consecutivo:Integer): Boolean;
var i:Integer;
// Consecutivo :Integer;
begin
         {if dmCaptacion.IBSQL1.Transaction.InTransaction then
            dmCaptacion.IBSQL1.Transaction.CommitRetaining;
         with dmCaptacion.IBSQL1 do
         begin
                Close;
                SQL.Clear;
                SQL.Add('select CONSECUTIVO from "cap$tipocaptacion" where ');
                SQL.Add(' ID_TIPO_CAPTACION = :"ID" ');
                ParamByName('ID').AsInteger := DBLCBTiposCaptacion.KeyValue;
                try
                  ExecQuery;
                except
                 begin
                   Result := False;
                   Abort;
                 end;
                end;
                if RecordCount > 0 then
                   Consecutivo := FieldByName('CONSECUTIVO').AsInteger
                else
                begin
                   Result := False;
                   Abort;
                end;
                Consecutivo := Consecutivo + 1;
                Close;
                SQL.Clear;
                SQL.Add('UPDATE "cap$tipocaptacion" ');
                SQL.Add('SET CONSECUTIVO = :"CONSECUTIVO" where ');
                SQL.Add('ID_TIPO_CAPTACION = :"ID"');
                ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
                ParamByName('ID').AsInteger := DBLCBTiposCaptacion.KeyValue;
                try
                  ExecQuery;
                except
                  begin
                   Result := False;
                   Abort;
                  end;
                end;
                Transaction.CommitRetaining;
         end;}
         EdNumeroAportacion.Caption := FormatFloat('0000000',Consecutivo);
         EdDigitoAportacion.Caption := DigitoControl(1,FormatFloat('0000000',Consecutivo));

         with dmCaptacion.IBGrabar do
         begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestro" (ID_AGENCIA,');
                SQL.Add('ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,');
                SQL.Add('VALOR_INICIAL,ID_FORMA,FECHA_APERTURA,TIPO_INTERES,ID_INTERES,CUOTA,ID_PLAN,ID_ESTADO) ');
                SQL.Add('values (:"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"VALOR_INICIAL",:"ID_FORMA",:"FECHA_APERTURA",:"TIPO_INTERES",:"ID_INTERES",:"CUOTA",:"ID_PLAN",:"ID_ESTADO")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := 1; //DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoaportacion.Caption);
                ParamByName('VALOR_INICIAL').AsCurrency := 0;
                with dmCaptacion.IBSQL1 do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select ID_FORMA from "cap$tipocaptacion" where ');
                    SQL.Add(' ID_TIPO_CAPTACION = :"ID"');
                    ParamByName('ID').AsInteger := 1; //DBLCBTiposCaptacion.KeyValue;
                    ExecQuery;
                end;
                ParamByName('ID_FORMA').AsInteger := dmCaptacion.IBSQL1.FieldByName('ID_FORMA').AsInteger;
                dmCaptacion.IBSQL1.Close;
                ParamByName('FECHA_APERTURA').AsDate := EdFechaAperturaAho.Date;
                ParamByName('TIPO_INTERES').AsString := 'F';
                ParamByName('ID_INTERES').AsInteger := 0;
                ParamByName('CUOTA').AsCurrency := 0;
                ParamByName('ID_PLAN').AsInteger := 0;
                ParamByName('ID_ESTADO').AsInteger := 1;
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Abort;
                 end;
                end;
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrotitular" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ID_IDENTIFICACION,ID_PERSONA,');
                SQL.Add('NUMERO_TITULAR,TIPO_TITULAR) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NUMERO_TITULAR",:"TIPO_TITULAR")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := 1; //DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAportacion.Caption);
                ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacionApo.KeyValue;
                ParamByName('ID_PERSONA').AsString := EdIdentificacionApo.Text;
                ParamByName('NUMERO_TITULAR').AsInteger := 1;
                ParamByName('TIPO_TITULAR').AsInteger := 1;
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Abort;
                 end;
                end;
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrosaldoinicial" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ANO,SALDO_INICIAL)');
                SQL.Add(' values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ANO",:"SALDO_INICIAL")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;//DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAportacion.Caption));
                ParamByName('ANO').AsString := FormatFloat('0000',YearOf(EdFechaAperApo.Date));
                ParamByName('SALDO_INICIAL').AsCurrency := 0;
                ExecQuery;
         end;
         Result := True;
end;

function TfrmCreacionCaptacion.GrabarAlaVista: Boolean;
var i,Consecutivo:Integer;
    ARecord:PMyListAho;
    TipoCaptacion:Integer;
begin
         if (not chkSubCuenta.Checked and DBLCBTiposCaptacion.KeyValue = 2) then
         begin
           if ValidarAportacion then
           begin
              MessageDlg('Cuenta con Aportes Vigentes',mtError,[mbcancel],0);
              Result := False;
              Exit;
           end;
         end;
         if MyListAho.Count = 0 then
         begin
            MessageDlg('Debe incluir por lo menos un titular',mtError,[mbCancel],0);
            Abort;
         end;
// Obtener Consecutivo
         TipoCaptacion := DBLCBTiposCaptacion.KeyValue;
         Consecutivo := ObtenerCaptacion(TipoCaptacion,IBSQL1);
{         with dmCaptacion.IBSQL1 do
         begin
                Close;
                SQL.Clear;
                SQL.Add('select CONSECUTIVO from "cap$tipocaptacion" where ');
                SQL.Add(' ID_TIPO_CAPTACION = :"ID" ');
                ParamByName('ID').AsInteger := DBLCBTiposCaptacion.KeyValue;
                try
                  ExecQuery;
                except
                 begin
                   Result := False;
                   Abort;
                 end;
                end;
                if RecordCount > 0 then
                   Consecutivo := FieldByName('CONSECUTIVO').AsInteger
                else
                begin
                   Result := False;
                   Abort;
                end;
                Consecutivo := Consecutivo + 1;
                Close;
                SQL.Clear;
                SQL.Add('UPDATE "cap$tipocaptacion" ');
                SQL.Add('SET CONSECUTIVO = :"CONSECUTIVO" where ');
                SQL.Add('ID_TIPO_CAPTACION = :"ID"');
                ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
                ParamByName('ID').AsInteger := DBLCBTiposCaptacion.KeyValue;
                try
                  ExecQuery;
                except
                  begin
                   Result := False;
                   Abort;
                  end;
                end;
                Transaction.CommitRetaining;
         end;}

         EdNumeroAho.Caption := FormatFloat('0000000',Consecutivo);
         EdNumeroAportacion.Caption := FormatFloat('0000000',Consecutivo);
         EdDigitoAho.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,FormatFloat('0000000',Consecutivo));
         EdDigitoAportacion.Caption := DigitoControl(1,FormatFloat('0000000',Consecutivo));
         EdFechaAperApo.Date := EdFechaAperturaAho.Date;
         dmCaptacion.IBGrabar.Transaction.StartTransaction;
// Tenemos que actualizar el insert del cap$maestro aquí.
         with dmCaptacion.IBGrabar do
         begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestro" (ID_AGENCIA,');
                SQL.Add('ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,');
                SQL.Add('VALOR_INICIAL,ID_FORMA,FECHA_APERTURA,TIPO_INTERES,ID_INTERES,CUOTA,ID_PLAN,ID_ESTADO,FIRMAS,SELLOS,PROTECTOGRAFOS) ');
                SQL.Add('values (:"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"VALOR_INICIAL",:"ID_FORMA",:"FECHA_APERTURA",:"TIPO_INTERES",:"ID_INTERES",:"CUOTA",:"ID_PLAN",:"ID_ESTADO",:"FIRMAS",:"SELLOS",:"PROTECTOGRAFOS")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(TipoCaptacion,EdNumeroAho.Caption));
                ParamByName('VALOR_INICIAL').AsCurrency := 0;
                with dmCaptacion.IBSQL1 do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select ID_FORMA from "cap$tipocaptacion" where ');
                    SQL.Add(' ID_TIPO_CAPTACION = :"ID"');
                    ParamByName('ID').AsInteger := TipoCaptacion;
                    ExecQuery;
                end;
                ParamByName('ID_FORMA').AsInteger := dmCaptacion.IBSQL1.FieldByName('ID_FORMA').AsInteger;
                dmCaptacion.IBSQL1.Close;
                ParamByName('FECHA_APERTURA').AsDate := EdFechaAperturaAho.Date;
                ParamByName('TIPO_INTERES').AsString := 'F';
                ParamByName('ID_INTERES').AsInteger := 0;
                ParamByName('CUOTA').AsCurrency := 0;
                ParamByName('ID_PLAN').AsInteger := 0;
                ParamByName('ID_ESTADO').AsInteger := 1;
                ParamByName('FIRMAS').AsInteger := EdFirmasAho.Value ;
                ParamByName('SELLOS').AsInteger := EdSellosAho.Value ;
                ParamByName('PROTECTOGRAFOS').AsInteger := EdProtecAho.Value ;
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Abort;
                 end;
                end;
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrotitular" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ID_IDENTIFICACION,ID_PERSONA,');
                SQL.Add('NUMERO_TITULAR,TIPO_TITULAR) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NUMERO_TITULAR",:"TIPO_TITULAR")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(TipoCaptacion,EdNumeroAho.Caption));
                for i := 0 to MyListAho.Count - 1 do
                begin
                 ARecord := MyListAho.Items[i];
                 ParamByName('ID_IDENTIFICACION').AsInteger := ARecord^.TipoId;
                 ParamByName('ID_PERSONA').AsString := ARecord^.NumeroId;
                 ParamByName('NUMERO_TITULAR').AsInteger := i+1;
                 ParamByName('TIPO_TITULAR').Asinteger := Arecord^.TipoT;
                 try
                    ExecQuery;
                    Close;
                 except
                      Result := False;
                      Abort;
                 end;
                 if i = 0 then begin
                  DBLCBTiposIdentificacionApo.KeyValue := Arecord^.TipoId;
                  EdIdentificacionApo.Text := ARecord^.NumeroId;
                 end;
                end;
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrosaldoinicial" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ANO,SALDO_INICIAL)');
                SQL.Add(' values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ANO",:"SALDO_INICIAL")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(TipoCaptacion,EdNumeroAho.Caption));
                ParamByName('ANO').AsString := FormatFloat('0000',YearOf(EdFechaAperturaAho.Date));
                ParamByName('SALDO_INICIAL').AsCurrency := 0;
                try
                  ExecQuery;
                except
                begin
                  Result := False;
                  Abort;
                end;
                end;
                Close;
                {SQL.Clear;
                SQL.Add('insert into "cap$maestrobeneficiario" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,PRIMER_APELLIDO,SEGUNDO_APELLIDO,');
                SQL.Add('NOMBRE,ID_PARENTESCO,PORCENTAJE) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"PRIMER_APELLIDO",:"SEGUNDO_APELLIDO",:"NOMBRE",:"ID_PARENTESCO",:"PORCENTAJE")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.Caption));
                for i := 1 to GridBeneficiariosAho.RowCount-1 do
                begin
                   if GridBeneficiariosAho.Cells[2,i] <> '' then
                   begin
                      ParamByName('PRIMER_APELLIDO').AsString := GridBeneficiariosAho.Cells[0,i];
                      ParamByName('SEGUNDO_APELLIDO').AsString := GridBeneficiariosAho.Cells[1,i];
                      ParamByName('NOMBRE').AsString := GridBeneficiariosAho.Cells[2,i];
                      with dmCaptacion.IBSQL1 do
                      begin
                        SQL.Clear;
                        SQL.Add('select ID_PARENTESCO from "gen$tiposparentesco" where ');
                        SQL.Add('DESCRIPCION_PARENTESCO = :"D"');
                        ParamByName('D').AsString := GridBeneficiariosAho.Cells[3,i];
                        ExecQuery;
                        if RecordCount > 0 then
                           Consecutivo := FieldByName('ID_PARENTESCO').AsInteger
                        else
                           Consecutivo := 0;
                        Close;
                      end;
                      ParamByName('ID_PARENTESCO').AsInteger := Consecutivo;
                      try
                        ParamByName('PORCENTAJE').AsFloat := StrToFloat(GridBeneficiariosAho.Cells[4,i]);
                      except
                        ParamByName('PORCENTAJE').AsFloat := 0;
                      end;
                      try
                        ExecQuery;
                        Close;
                      except
                      begin
                        Result := False;
                        Abort;
                      end;
                      end;
                   end;
                end;
                Close;}
                {if ( DBLCBTiposIdentificacion5.KeyValue > 0 ) and
                   ( EdIdentificacionAutAho.Text <> '' ) then
                begin
                 SQL.Clear;
                 SQL.Add('insert into "cap$maestroautorizado" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                 SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ID_IDENTIFICACION,ID_PERSONA,');
                 SQL.Add('PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE) values (');
                 SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                 SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"PRIMER_APELLIDO",:"SEGUNDO_APELLIDO",:"NOMBRE")');
                 ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                 ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Caption);
                 ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.Caption));
                 ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacion5.KeyValue;
                 ParamByName('ID_PERSONA').AsString := EdIdentificacionAutAho.Text;
                 ParamByName('PRIMER_APELLIDO').AsString := EdPrimerApellidoAutAho.Text;
                 ParamByName('SEGUNDO_APELLIDO').AsString := EdSegundoApellidoAutAho.Text;
                 ParamByName('NOMBRE').AsString := EdNombresAutAho.Text;
                 try
                    ExecQuery;
                 except
                     Result := False;
                     Abort;
                 end;
                end;}
       end;
       if (chkSubCuenta.Checked) or (DBLCBTiposCaptacion.KeyValue <> 2) then
          Result := true
       else
       if GrabarAportacion(Consecutivo) then
         Result := True
       else
         Result := False;
end;

function TfrmCreacionCaptacion.GrabarContractual: Boolean;
var i,Consecutivo:Integer;
    TipoCaptacion:Integer;
    Plan:Integer;
    NombrePlan:string;
    TipoIdentificacion:Integer;
    Lista:TList;
    TipoId:string;
    Id:string;
    ARecord:PTablaConLiq;
    Cuotas:Integer;
    Incentivo:Currency;
    frmVistaPreliminar:TfrmVistaPreliminar;
    FechaCorte:TDate;
    vSaldoAhorro :Currency;
    vDigitoAhorro :Integer;
    vTipoComprobante :Integer;
    vCodigoContractual :string;
    vCodigoCaja :string;
    vCodigoAhorro :string;
    vCodigoGMF:string;
    vCodigoGGMF:string;
    vGMF :Currency;
    vComprobante :Integer;
begin
         FechaCorte := fFechaActual;
         TipoId := DBLCBTiposIdentificacionCont.Text;
         Id := EdNumeroIdentificacionCont.Text;
         TipoCaptacion := DBLCBTiposCaptacion.KeyValue;
         Plan := DBLCBPlanContractual.KeyValue;
         NombrePlan := DBLCBPlanContractual.Text;
         TipoIdentificacion := DBLCBTiposIdentificacionCont.KeyValue;
         Consecutivo := ObtenerCaptacion(TipoCaptacion,IBSQL1);
         vComprobante := ObtenerConsecutivo(IBSQL1, TipoCaptacion);
         if IBSQL1.Transaction.InTransaction then
            IBSQL1.Transaction.Rollback;
        IBSQL1.Transaction.StartTransaction;

         EdNumeroContractual.Caption := FormatFloat('0000000',Consecutivo);
         EdDigitoContractual.Caption := DigitoControl(TipoCaptacion,FormatFloat('0000000',Consecutivo));

         with dmCaptacion.IBGrabar do
         begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestro" (ID_AGENCIA,');
                SQL.Add('ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,');
                SQL.Add('VALOR_INICIAL,ID_FORMA,FECHA_APERTURA,PLAZO_CUENTA,TIPO_INTERES,ID_INTERES,CUOTA,CUOTA_CADA,ID_PLAN,ID_ESTADO,');
                SQL.Add('FECHA_VENCIMIENTO,FECHA_PROXIMO_PAGO,ID_TIPO_CAPTACION_ABONO,NUMERO_CUENTA_ABONO)');
                SQL.Add('values (:"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"VALOR_INICIAL",:"ID_FORMA",:"FECHA_APERTURA",:"PLAZO_CUENTA",:"TIPO_INTERES",:"ID_INTERES",:"CUOTA",:"CUOTA_CADA",:"ID_PLAN",:"ID_ESTADO",');
                SQL.Add(':"FECHA_VENCIMIENTO",:"FECHA_PROXIMO_PAGO",:"ID_TIPO_CAPTACION_ABONO",:"NUMERO_CUENTA_ABONO")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(TipoCaptacion,EdNumeroContractual.Caption));
                ParamByName('VALOR_INICIAL').AsCurrency := 0;
                ParamByName('ID_TIPO_CAPTACION_ABONO').AsInteger := DBLCBTiposCaptacionCon.KeyValue;
                ParamByName('NUMERO_CUENTA_ABONO').AsInteger := StrToInt(EdCuentaCon.Text);
                with dmCaptacion.IBSQL1 do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select ID_FORMA from "cap$tipocaptacion" where ');
                    SQL.Add(' ID_TIPO_CAPTACION = :"ID"');
                    ParamByName('ID').AsInteger := TipoCaptacion;
                    ExecQuery;
                end;
                ParamByName('VALOR_INICIAL').AsCurrency := EdValorContractual.Value;
                ParamByName('ID_FORMA').AsInteger := dmCaptacion.IBSQL1.FieldByName('ID_FORMA').AsInteger;
                dmCaptacion.IBSQL1.Close;
                ParamByName('FECHA_APERTURA').AsDate := EdFechaAperturaContractual.Date;
                ParamByName('TIPO_INTERES').AsString := 'F';
                ParamByName('ID_INTERES').AsInteger := 0;
                ParamByName('CUOTA').AsCurrency := EdValorContractual.Value;
                ParamByName('CUOTA_CADA').AsInteger := plazo;
                ParamByName('ID_PLAN').AsInteger := DBLCBPlanContractual.KeyValue;
                ParamByName('ID_ESTADO').AsInteger := 1;
                ParamByName('FECHA_VENCIMIENTO').AsDate := StrToDate(EdFechaVencimientoContractual.Caption);
                ParamByName('FECHA_PROXIMO_PAGO').AsDate := StrToDate(EdProximoAbonoContractual.Caption);
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Abort;
                 end;
                end;
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrotitular" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ID_IDENTIFICACION,ID_PERSONA,');
                SQL.Add('NUMERO_TITULAR,TIPO_TITULAR) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NUMERO_TITULAR",:"TIPO_TITULAR")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(TipoCaptacion,EdNumeroContractual.Caption));
                ParamByName('ID_IDENTIFICACION').AsInteger := TipoIdentificacion;
                ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCont.Text;
                ParamByName('NUMERO_TITULAR').AsInteger := 1;
                ParamByName('TIPO_TITULAR').AsInteger := 1;
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Abort;
                 end;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrosaldoinicial" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ANO,SALDO_INICIAL)');
                SQL.Add(' values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ANO",:"SALDO_INICIAL")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(TipoCaptacion,EdNumeroContractual.Caption));
                ParamByName('ANO').AsString := FormatFloat('0000',YearOf(EdFechaAperturaContractual.Date));
                ParamByName('SALDO_INICIAL').AsCurrency := 0;
                ExecQuery;
                Close;

                SQL.Clear;
                SQL.Add('select * from "cap$tiposplancontractual" where ID_PLAN = :ID_PLAN');
                ParamByName('ID_PLAN').AsInteger := DBLCBPlanContractual.KeyValue;
                ExecQuery;
                Cuotas := FieldByName('PLAZO').AsInteger div 30;
                Incentivo := EdValorContractual.Value * FieldByName('CUOTAS').AsDouble;

                Lista := TablaCon(EdValorContractual.Value,EdFechaAperturaContractual.Date,30,FieldByName('PLAZO').AsInteger,DayOf(EdFechaAperturaContractual.Date),FechaCorte);

                Close;
                SQL.Clear;
                SQL.Add('Insert into "cap$tablaliquidacioncon" values(');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"FECHA_DESCUENTO",:"VALOR",:"DESCONTADO")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoContractual.Caption);
                for i := 0 to Lista.Count - 1 do
                begin
                   ARecord := Lista.Items[i];
                   ParamByName('FECHA_DESCUENTO').AsDate := ARecord^.FechaDescuento;
                   ParamByName('VALOR').AsCurrency := ARecord^.Valor;
                   ParamByName('DESCONTADO').AsInteger := BooleanoToInt(ARecord^.Descontado);
                   try
                      ExecQuery;
                      Close;
                      Dispose(ARecord);
                   except
                      Result := False;
                      Abort;
                   end;
                end;
                Lista.Free;
         //Generación de Nota Contable
                vDigitoAhorro := StrToInt(DigitoControl(DBLCBTiposCaptacionCon.KeyValue,EdCuentaCon.Text));
                Close;
                SQL.Clear;
                SQL.Add('SELECT SALDO_DISPONIBLE FROM SALDO_DISPONIBLE(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                ParamByName('AG').AsInteger := Agencia;
                ParamByName('TP').AsInteger := DBLCBTiposCaptacionCon.KeyValue;
                ParamByName('CTA').AsInteger := StrToInt(EdCuentaCon.Text);
                ParamByName('DGT').AsInteger := vDigitoAhorro;
                ParamByName('ANO').AsInteger := YearOf(fFechaActual);
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                ParamByName('FECHA2').AsDate := fFechaActual;
                ExecQuery;
                vSaldoAhorro := FieldByName('SALDO_DISPONIBLE').AsCurrency;
                FrmSelComprobante := TFrmSelComprobante.Create(Self);
                vTipoComprobante := -1;
                with FrmSelComprobante do
                begin
                  if vSaldoAhorro < EdValorContractual.Value then
                  begin
                    Rcajas.Checked := True;
                    Rahorros.Enabled := False;
                  end
                  else
                  begin
                    Rahorros.Enabled := True;
                    Rahorros.Checked := True;
                  end;
                FrmSelComprobante.ShowModal;
                if Rahorros.Checked then
                   vTipoComprobante := 1 //caso de descuento de ahorros
                else
                   vTipoComprobante := 0;
                end;
                //ShowMessage(IntToStr(vTipoComprobante));
                FrmSelComprobante.Free;
                Close;
                SQL.Clear;
                SQL.Add('select * from "cap$tipocaptacion" where ');
                SQL.Add('ID_TIPO_CAPTACION = :"ID"');
                ParamByName('ID').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ExecQuery;
                vCodigoContractual := FieldByName('CODIGO_CONTABLE').AsString;
                Close;
                ParamByName('ID').AsInteger := DBLCBTiposCaptacionCon.KeyValue;
                ExecQuery;
                vCodigoAhorro := FieldByName('CODIGO_CONTABLE').AsString;
                SQL.Clear;
                Close;
                SQL.Clear;
                SQL.Add('select * from "cap$contable" where ');
                SQL.Add('ID_CAPTACION = :"ID_CAPTACION" and ID_CONTABLE = :"ID_CONTABLE"');
                ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('ID_CONTABLE').AsInteger := 3;
                ExecQuery;
                vCodigoGMF := FieldByName('CODIGO_CONTABLE').AsString;
                Close;
                ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('ID_CONTABLE').AsInteger := 4;
                ExecQuery;
                vCodigoGGMF := FieldByName('CODIGO_CONTABLE').AsString;
                Close;
                ParamByName('ID_CAPTACION').AsInteger := 2;
                ParamByName('ID_CONTABLE').AsInteger := 7;
                ExecQuery;
                vCodigoCaja := FieldByName('CODIGO_CONTABLE').AsString; // codigo de la caja
                vGMF := SimpleRoundTo((EdValorContractual.Value / 1000) * 4,0);
                if vtipoComprobante = 1 then // actualiacion del extracto y marcar primera cuota ahorro contractual
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('insert into "cap$extracto" values(');
                  SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
                  SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
                  SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
                  SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
                  // Descuento de Ahorros
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacionCon.KeyValue;
                  ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCuentaCon.Text);
                  ParamByName('DIGITO_CUENTA').AsInteger := vDigitoAhorro;
                  ParamByName('FECHA_MOVIMIENTO').AsDate := fFechaActual;
                  ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                  ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
                  ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[vComprobante]);
                  ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Descuento por Cuota Ahorro Contractual';
                  ParamByName('VALOR_DEBITO').AsCurrency := 0;
                  ParamByName('VALOR_CREDITO').AsCurrency := edvalorcontractual.Value;
                  ExecQuery;
                  //Consignación del COntractual
                  Close;
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                  ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Caption);
                  ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(TipoCaptacion,EdNumeroContractual.Caption));
                  ParamByName('FECHA_MOVIMIENTO').AsDate := fFechaActual;
                  ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
                  ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
                  ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[vComprobante]);
                  ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Descuento por Cuota Ahorro Contractual';
                  ParamByName('VALOR_DEBITO').AsCurrency := edvalorcontractual.Value;
                  ParamByName('VALOR_CREDITO').AsCurrency := 0;
                  ExecQuery;
                  Close;
                  SQL.Clear;
                  SQL.Add('update "cap$tablaliquidacioncon" set DESCONTADO = 1 where');
                  SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                  SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
                  SQL.Add('FECHA_DESCUENTO = :FECHA_DESCUENTO');
                  ParamByName('ID_AGENCIA').AsInteger := Agencia;
                  ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
                  ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Caption);
                  ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(TipoCaptacion,EdNumeroContractual.Caption));
                  ParamByName('FECHA_DESCUENTO').AsDate := ffechaactual;
                  ExecQuery;
//                  Transaction.Commit;
//                  Transaction.StartTransaction;
                end;

         end;
         with IbComprobante do // se genera el comprobante
         begin
           Close;
           ParamByName('ID_COMPROBANTE').AsInteger := vComprobante;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
           ParamByName('FECHADIA').AsDateTime := EdFechaAperturaAho.Date;
           ParamByName('DESCRIPCION').AsString := 'Descuento Apertura Ahorro Contractual No. 501-' + FormatCurr('00000',StrToInt(EdNumeroContractual.Caption));
           if vTipoComprobante = 1 then
           begin
             ParamByName('TOTAL_DEBITO').AsCurrency := EdValorContractual.Value + vGMF;
             ParamByName('TOTAL_CREDITO').AsCurrency := EdValorContractual.Value + vGMF;
           end
           else
           begin
             ParamByName('TOTAL_DEBITO').AsCurrency := EdValorContractual.Value;
             ParamByName('TOTAL_CREDITO').AsCurrency := EdValorContractual.Value;
           end;
           ParamByName('ESTADO').AsString := 'O';
           ParamByName('IMPRESO').AsInteger := 1;
           ParamByName('ANULACION').AsString := '';
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ExecSQL;
         end;
        with IbAux do
        begin
           Close;
           if EdValorContractual.Value > 0 then
           begin
             ParamByName('ID_COMPROBANTE').AsInteger := vComprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := EdFechaAperturaAho.Date;
             ParamByName('CODIGO').AsString := vCodigoContractual;
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := EdValorContractual.Value;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := TipoIdentificacion;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCont.Text;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ExecSQL;

           if vTipoComprobante = 0 then
           begin
              Close;
              ParamByName('ID_COMPROBANTE').AsInteger := vComprobante;
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('FECHA').AsDateTime := EdFechaAperturaAho.Date;
              ParamByName('CODIGO').AsString := vCodigoCaja;
              ParamByName('DEBITO').AsCurrency := EdValorContractual.Value;
              ParamByName('CREDITO').AsCurrency := 0 ;
              ParamByName('ID_CUENTA').AsInteger :=0;
              ParamByName('ID_COLOCACION').Clear;
              ParamByName('ID_IDENTIFICACION').AsInteger := 0;
              ParamByName('ID_PERSONA').Clear;
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              ExecSQL;
           end
           else
           begin
             Close;
             ParamByName('ID_COMPROBANTE').AsInteger := vComprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := EdFechaAperturaAho.Date;
             ParamByName('CODIGO').AsString := vCodigoAhorro;
             ParamByName('DEBITO').AsCurrency := EdValorContractual.Value;
             ParamByName('CREDITO').AsCurrency := 0 ;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := TipoIdentificacion;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCont.Text;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ExecSQL;

             Close;
             ParamByName('ID_COMPROBANTE').AsInteger := vComprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := EdFechaAperturaAho.Date;
             ParamByName('CODIGO').AsString := vCodigoGMF;
             ParamByName('DEBITO').AsCurrency := 0;
             ParamByName('CREDITO').AsCurrency := vGMF;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ExecSQL;

             Close;
             ParamByName('ID_COMPROBANTE').AsInteger := vComprobante;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('FECHA').AsDateTime := EdFechaAperturaAho.Date;
             ParamByName('CODIGO').AsString := vCodigoGGMF;
             ParamByName('DEBITO').AsCurrency := vGMF;
             ParamByName('CREDITO').AsCurrency := 0;
             ParamByName('ID_CUENTA').AsInteger :=0;
             ParamByName('ID_COLOCACION').Clear;
             ParamByName('ID_IDENTIFICACION').AsInteger := 0;
             ParamByName('ID_PERSONA').Clear;
             ParamByName('MONTO_RETENCION').AsCurrency := 0;
             ParamByName('TASA_RETENCION').AsFloat := 0;
             ParamByName('ESTADOAUX').AsString := 'O';
             ExecSQL;
           end;
           end;
        end;
        if dmGeneral.IBTransaction1.InTransaction then
            dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
        //Generación de Comprobante
        // genera reporte
        RepContractual(TipoId,Id,NombrePlan,Incentivo,vComprobante);
        if MessageDlg('Desea Recuperar de nuevo el Reporte',mtInformation,[mbyes,mbno],0) = mryes then
          RepContractual(TipoId,Id,NombrePlan,Incentivo,vComprobante);

         Result := True;
end;

function TfrmCreacionCaptacion.GrabarCertificado: Boolean;
var i,Consecutivo,Comprobante:Integer;
    ARecord:PTablaCerLiq;
    Lista:TList;
    Codigo_Tercero:string;
    Codigo_Socio:string;
    Codigo_Caja:string;
    Valor_Tercero:Currency;
    Valor_Caja:Currency;
    Valor_Socio:Currency;
    Tipo,TipoC,Cuenta,Digito,TVariables,TipoId:Integer;
    Dia:Word;
begin
        Consecutivo := 0;
        if EdValorCer.Value = 0 then
        begin
           MessageDlg('Valor no puede ser 0',mterror,[mbcancel],0);
           EdValorCer.SetFocus;
           abort;
        end;

        if EdAmortizaCer.Value = 0 then
        begin
           MessageDlg('Amortizacion no puede ser 0',mterror,[mbcancel],0);
           edamortizacer.SetFocus;
           abort;
        end;

        if EdPlazoCer.Value = 0 then
        begin
           MessageDlg('Plazo no puede ser 0',mterror,[mbcancel],0);
           edplazocer.SetFocus;
           abort;
        end;

        if EdPlazoCer.Value < EdAmortizaCer.Value then
        begin
           MessageDlg('Plazo no puede ser menor a la Amortización',mtError,[mbcancel],0);
           EdPlazoCer.SetFocus;
           Abort;
        end;

         Tipo := DBLCBTiposCaptacion.KeyValue;
         TVariables := DBLCBTasasVariables.KeyValue;
         TipoC := DBLCBTipoCaptacionCer.KeyValue;
         TipoId := DBLCBTiposIdentificacionCer.KeyValue;
// Obtener Consecutivo
         Consecutivo := ObtenerCaptacion(Tipo,IBSQL1);
         ibsql1.transaction.StartTransaction;
// Fin Consecutivo
         EdNumeroCer.Caption := FormatFloat('0000000',Consecutivo);
         EdDigitoCer.Caption := DigitoControl(Tipo,FormatFloat('0000000',Consecutivo));
         Cuenta := StrToInt(EdNumeroCer.Caption);
         Digito := StrToInt(EdDigitoCer.Caption);
         with dmCaptacion.IBGrabar do
         begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestro" (ID_AGENCIA,');
                SQL.Add('ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,');
                SQL.Add('VALOR_INICIAL,ID_FORMA,FECHA_APERTURA,PLAZO_CUENTA,TIPO_INTERES,ID_INTERES,TASA_EFECTIVA,PUNTOS_ADICIONALES,');
                SQL.Add('MODALIDAD,AMORTIZACION,CUOTA,CUOTA_CADA,ID_PLAN,ID_ESTADO,');
                SQL.Add('FECHA_VENCIMIENTO,FECHA_PROXIMO_PAGO,ID_TIPO_CAPTACION_ABONO,NUMERO_CUENTA_ABONO)');
                SQL.Add('values (:"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"VALOR_INICIAL",:"ID_FORMA",:"FECHA_APERTURA",:"PLAZO_CUENTA",:"TIPO_INTERES",:"ID_INTERES",:"TASA_EFECTIVA",:"PUNTOS_ADICIONALES",');
                SQL.Add(':"MODALIDAD",:"AMORTIZACION",:"CUOTA",:"CUOTA_CADA",:"ID_PLAN",:"ID_ESTADO",');
                SQL.Add(':"FECHA_VENCIMIENTO",:"FECHA_PROXIMO_PAGO",:"ID_TIPO_CAPTACION_ABONO",:"NUMERO_CUENTA_ABONO")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(Tipo,EdNumeroCer.Caption));
                ParamByName('VALOR_INICIAL').AsCurrency := EdValorCer.Value;
                with dmCaptacion.IBSQL1 do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select ID_FORMA from "cap$tipocaptacion" where ');
                    SQL.Add(' ID_TIPO_CAPTACION = :"ID"');
                    ParamByName('ID').AsInteger := Tipo;
                    ExecQuery;
                end;
                ParamByName('ID_FORMA').AsInteger := dmCaptacion.IBSQL1.FieldByName('ID_FORMA').AsInteger;
                dmCaptacion.IBSQL1.Close;
                ParamByName('FECHA_APERTURA').AsDate := EdFechaAperturaCer.Date;
                ParamByName('PLAZO_CUENTA').AsInteger := EdPlazoCer.Value;
                ParamByName('TIPO_INTERES').AsString := LeftStr(ComboTipoTasa.Text,1);
                ParamByName('ID_INTERES').AsInteger := TVariables;
                ParamByName('TASA_EFECTIVA').AsFloat := TasaEfectiva;
                ParamByName('PUNTOS_ADICIONALES').AsFloat := EdPuntosCer.Value;
                ParamByName('MODALIDAD').AsString := LeftStr(ComboModalidadCer.Text,1);
                ParamByName('AMORTIZACION').AsInteger := EdAmortizaCer.Value;
                ParamByName('CUOTA').AsCurrency := 0;
                ParamByName('CUOTA_CADA').AsInteger := 0;
                ParamByName('ID_PLAN').AsInteger := 0;
                ParamByName('ID_ESTADO').AsInteger := 1;
                ParamByName('FECHA_VENCIMIENTO').AsDate := StrToDate(EdFechaVencimientoCer.Caption);
                ParamByName('FECHA_PROXIMO_PAGO').AsDate := EdProximoPagoCer;
                ParamByName('ID_TIPO_CAPTACION_ABONO').AsInteger := TipoC;
                ParamByName('NUMERO_CUENTA_ABONO').AsString := EdNumeroCapCer.Text;
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Abort;
                 end;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrosapertura" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,FECHA,HORA,EFECTIVO,CHEQUE) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"FECHA",:"HORA",:"EFECTIVO",:"CHEQUE")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(Tipo,EdNumeroCer.Caption));
                ParamByName('FECHA').AsDate := fFechaActual;
                ParamByName('HORA').AsTime := fHoraActual;
                case rgApertura.ItemIndex of
                0: begin
                    ParamByName('EFECTIVO').AsInteger := 1;
                    ParamByName('CHEQUE').AsInteger := 0;
                   end;
                1: begin
                    ParamByName('EFECTIVO').AsInteger := 0;
                    ParamByName('CHEQUE').AsInteger := 1;
                   end;
                end;
                try
                 ExecQuery;
                except
                 Result := False;
                 Abort;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrotitular" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ID_IDENTIFICACION,ID_PERSONA,');
                SQL.Add('NUMERO_TITULAR,TIPO_TITULAR) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NUMERO_TITULAR",:"TIPO_TITULAR")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(Tipo,EdNumeroCer.Caption));
                ParamByName('ID_IDENTIFICACION').AsInteger := TipoId;
                ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCer.Text;
                ParamByName('NUMERO_TITULAR').AsInteger := 1;
                ParamByName('TIPO_TITULAR').AsInteger := 1;
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Abort;
                 end;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrosaldoinicial" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ANO,SALDO_INICIAL)');
                SQL.Add(' values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ANO",:"SALDO_INICIAL")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(Tipo,EdNumeroCer.Caption));
                ParamByName('ANO').AsString := FormatFloat('0000',YearOf(EdFechaAperturaCer.Date));
                ParamByName('SALDO_INICIAL').AsCurrency := 0;
                ExecQuery;
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrobeneficiario" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,PRIMER_APELLIDO,SEGUNDO_APELLIDO,');
                SQL.Add('NOMBRE,ID_PARENTESCO,PORCENTAJE) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"PRIMER_APELLIDO",:"SEGUNDO_APELLIDO",:"NOMBRE",:"ID_PARENTESCO",:"PORCENTAJE")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(Tipo,EdNumeroCer.Caption));
                for i := 1 to GridBeneficiariosCer.RowCount-1 do
                begin
                   if GridBeneficiariosCer.Cells[2,i] <> '' then
                   begin
                      ParamByName('PRIMER_APELLIDO').AsString := GridBeneficiariosCer.Cells[0,i];
                      ParamByName('SEGUNDO_APELLIDO').AsString := GridBeneficiariosCer.Cells[1,i];
                      ParamByName('NOMBRE').AsString := GridBeneficiariosCer.Cells[2,i];
                      with dmCaptacion.IBSQL1 do
                      begin
                        SQL.Clear;
                        SQL.Add('select ID_PARENTESCO from "gen$tiposparentesco" where ');
                        SQL.Add('DESCRIPCION_PARENTESCO = :"D"');
                        ParamByName('D').AsString := GridBeneficiariosCer.Cells[3,i];
                        ExecQuery;
                        if RecordCount > 0 then
                           Consecutivo := FieldByName('ID_PARENTESCO').AsInteger
                        else
                           Consecutivo := 0;
                        Close;
                      end;
                      ParamByName('ID_PARENTESCO').AsInteger := Consecutivo;
                      try
                        ParamByName('PORCENTAJE').AsFloat := StrToFloat(GridBeneficiariosCer.Cells[4,i]);
                      except
                        ParamByName('PORCENTAJE').AsFloat := 0;
                      end;
                      try
                        ExecQuery;
                        Close;
                      except
                       begin
                        Result := False;
                        Abort;
                       end;
                      end;
                   end;
                end;

                Dia := DayOf(EdFechaAperturaCer.Date);

                Lista := TablaCer(EdValorCer.Value,TasaEfectiva,
                                  LeftStr(ComboModalidadCer.Text,1),EdFechaAperturaCer.Date,EdFechaAperturaCer.Date,
                                  EdAmortizaCer.Value,EdPlazoCer.Value,Dia);
                Close;
                SQL.Clear;
                SQL.Add('Insert into "cap$tablaliquidacion" values(');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"FECHA_PAGO",:"VALOR",:"PAGADO")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := Tipo;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Caption);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(Tipo,EdNumeroCer.Caption));
                for i := 0 to Lista.Count - 1 do
                begin
                   ARecord := Lista.Items[i];
                   ParamByName('FECHA_PAGO').AsDate := ARecord^.FechaPago;
                   ParamByName('VALOR').AsCurrency := ARecord^.Valor;
                   ParamByName('PAGADO').AsInteger := BooleanoToInt(ARecord^.Liquidado);
                   try
                      ExecQuery;
                      Close;
                      Dispose(ARecord);
                   except
                      Result := False;
                      raise;
                   end;
                end;
                Lista.Free;
         end;

// Generación de Comprobante
// Buscar códigos contables
        with IBSQL1 do
        begin
// Código Captación
            Close;
            SQL.Clear;
            SQL.Add('select CODIGO_CONTABLE from "cap$contable" ');
            SQL.Add('where ID_CAPTACION = :"ID"  and ID_CONTABLE = :"ID_CONTABLE"');
            if (DBLCBTiposCaptacion.KeyValue = 4) then
            ParamByName('ID_CONTABLE').AsInteger := 12
            else
            ParamByName('ID_CONTABLE').AsInteger := 11;
            ParamByName('ID').AsInteger := 6;
            try
              ExecQuery;
            except
              MessageDlg('Error buscando código a particulares',mterror,[mbcancel],0);
              Exit;
            end;
            Codigo_Tercero := FieldByName('CODIGO_CONTABLE').AsString;

            Close;
            SQL.Clear;
            SQL.Add('select CODIGO_CONTABLE from "cap$contable" ');
            SQL.Add('where ID_CAPTACION = :ID  and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID').AsInteger := Tipo;
            ParamByName('ID_CONTABLE').AsInteger := 10;
            try
              ExecQuery;
            except
              MessageDlg('Error buscando código socio',mterror,[mbcancel],0);
              Exit;
            end;
            Codigo_Socio := FieldByName('CODIGO_CONTABLE').AsString;


            if (rgApertura.ItemIndex = 1) then
             Codigo_Caja := CodigoBanco
            else
            begin
             Close;
             SQL.Clear;
             SQL.Add('select CODIGO_CONTABLE from "cap$contable"');
             SQL.Add('where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = 7');
             ParamByName('ID_CAPTACION').AsInteger := Tipo;
             try
               ExecQuery;
             except
               MessageDlg('Error buscando código contable de caja',mterror,[mbcancel],0);
               exit
             end;
             Codigo_Caja := FieldByName('CODIGO_CONTABLE').AsString;
             Close;
            end;
        end;

//Buscar Consecutivo
        Comprobante := ObtenerConsecutivo(IBSQL1,4);
// Fin Consecutivo

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
            ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
            ParamByName('FECHADIA').AsDateTime := EdFechaAperturaCer.Date;
            ParamByName('DESCRIPCION').AsString := 'Apertura Cdat No:' + EdNumeroCer.Caption + '-' + EdDigitoCer.Caption +
                                                   EdPrimerApellidoCer.Caption + ' ' + EdSegundoApellidoCer.Caption + ' ' + EdNombresCer.Caption +
                                                   ' en la Fecha ';
            ParamByName('TOTAL_DEBITO').AsCurrency := EdValorCer.Value;
            ParamByName('TOTAL_CREDITO').AsCurrency := EdValorCer.Value;
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
            SQL.Add(':"MONTO_RETENCION", :"TASA_RETENCION", :"ESTADOAUX", :"TIPO_COMPROBANTE")');
// Abono Caja
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := EdFechaAperturaCer.Date;
            ParamByName('CODIGO').AsString := Codigo_Caja;
            ParamByName('DEBITO').AsCurrency := EdValorCer.Value;
            ParamByName('CREDITO').AsCurrency := 0;
            ParamByName('ID_CUENTA').AsInteger := StrToInt(EdNumeroCer.Caption);
            ParamByName('ID_COLOCACION').AsString := '';
            ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacionCer.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCer.Text;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
            ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
            try
              ExecQuery;
            except
              MessageDlg('Error al Escribir en el Auxiliar Captación',mtError,[mbcancel],0);
              Transaction.Rollback;
              Exit;
            end;
            // Validar Tercero o Socio
            IBSQL3.SQL.Clear;
            IBSQL3.SQL.Add('SELECT COUNT(*) AS TOTAL FROM "gen$privilegiados" WHERE');
            IBSQL3.SQL.Add('ID_IDENTIFICACION_PRIV = :ID_IDENTIFICACION and');
            IBSQL3.SQL.Add('ID_PERSONA_PRIV = :ID_PERSONA');
            IBSQL3.ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacionCer.KeyValue;
            IBSQL3.ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCer.Text;
            IBSQL3.ExecQuery;
            if (IBSQL3.FieldByName('TOTAL').AsInteger < 1) then
            begin
// Abono Pago Tercero
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := EdFechaAperturaCer.Date;
            ParamByName('CODIGO').AsString := Codigo_Tercero;
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := EdValorCer.Value;
            ParamByName('ID_CUENTA').AsInteger := 0;
            ParamByName('ID_COLOCACION').AsString := '';
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
            end
            else
            begin
// Abono Socio
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := EdFechaAperturaCer.Date;
            ParamByName('CODIGO').AsString := Codigo_Socio;
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := EdValorCer.Value;
            ParamByName('ID_CUENTA').AsInteger := 0;
            ParamByName('ID_COLOCACION').AsString := '';
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
            Transaction.Commit;



        end;

// Fin Generación de Comprobante
// Proceso de Impresión
    with IBAuxiliar do begin
       Transaction.StartTransaction;
       Close;
       ParamByName('ID_AGENCIA').AsInteger := Agencia;
       ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
       ParamByName('TIPO_COMPROBANTE').AsInteger := 4;
       ReporteC.Variables.ByName['EMPRESA'].AsString := Empresa;
       ReporteC.Variables.ByName['NIT'].AsString := Nit;
       if ReporteC.PrepareReport then
          ReporteC.PreviewPreparedReport(True);
       Transaction.Commit;
    end;
//Finalizar Proceso
    Result := True;

end;

procedure TfrmCreacionCaptacion.CmdAgregarTitAhoClick(Sender: TObject);
var ARecord: PMyListAho;
    i:Integer;
    frmcreacionpersona:tfrmcreacionpersona;
begin
        if (DBLCBTiposTitular.KeyValue > 0 ) and
           (DBLCBTiposIdentificacion2.KeyValue > 0) and
           (EdNumeroIdentificacionAho.Text <> '' ) then
           with dmCaptacion.IBSQL1 do
           begin
               Close;
               SQL.Clear;
               SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE FROM "gen$persona" where ');
               SQL.Add('ID_IDENTIFICACION = :"ID_ID" and ID_PERSONA = :"ID_PE"');
               ParamByName('ID_ID').AsInteger := DBLCBTiposIdentificacion2.KeyValue;
               ParamByName('ID_PE').AsString := EdNumeroIdentificacionAho.Text;
               ExecQuery;
               if RecordCount = 1 then
               begin
                for i := 0 to MyListAho.Count-1 do
                begin
                  ARecord := MyListAho.Items[i];
                  if ( ARecord^.TipoId = DBLCBTiposIdentificacion2.KeyValue ) and
                     ( ARecord^.NumeroId = EdNumeroIdentificacionAho.Text ) then
                  begin
                      MessageDlg('Titular ya esta en la lista',mtError,[mbCancel],0);
                      Abort;
                  end
                end;
                if (MyListAho.Count = 0) and (DBLCBTiposTitular.KeyValue  <> 1) then
                begin
                  MessageDlg('El Primer Documento debe ser del TITULAR',mtError,[mbcancel],0);
                  Exit;
                end;
                EdPrimerApellidotitAho.Caption := FieldByName('PRIMER_APELLIDO').AsString;
                EdSegundoApellidotitAho.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
                EdNombresTitAho.Caption := FieldByName('NOMBRE').AsString;
                Close;
                New(ARecord);
                ARecord.TipoId := DBLCBTiposIdentificacion2.KeyValue;
                ARecord.NumeroId := EdNumeroIdentificacionAho.Text;
                ARecord.TipoT := DBLCBTiposTitular.KeyValue;
                MyListAho.Add(ARecord);
                ActualizarListAho;
                EdNumeroIdentificacionAho.SelectAll;
                EdNumeroIdentificacionAho.SetFocus;
               end
               else
               begin
                if MessageDlg('Persona no existe!, Desea Agregarla',mtconfirmation,[mbYes,mbNo],0) = mryes then
                begin
                  frmcreacionpersona := tfrmcreacionpersona.Create(Self);
                  frmcreacionpersona.ShowModal;
                end;
               end;
           end;

end;

procedure TfrmCreacionCaptacion.ActualizarListAho;
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
                GridTitulares.Cells[3,i+1] := Format('%d',[Arecord^.TipoT]);
              end;

end;

procedure TfrmCreacionCaptacion.GridTitularesClick(Sender: TObject);
var ARecord:PMyListAho;
begin
        if ( GridTitulares.Row > 0 ) and
           ( MyListAho.Count > 0 ) then
        begin
           ARecord := MyListAho.Items[GridTitulares.Row - 1];
           CmdEliminarTitAho.Enabled := True;
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
        end
        else
           CmdEliminarTitAho.Enabled := False;
end;

procedure TfrmCreacionCaptacion.CmdEliminarTitAhoClick(Sender: TObject);
begin
        MyListAho.Delete(GridTitulares.Row - 1);
        ActualizarListAho;        
end;

procedure TfrmCreacionCaptacion.EdFechaAperturaAhoExit(Sender: TObject);
begin
        CmdGrabar.Enabled := True;
        CmdGrabar.SetFocus;
end;

procedure TfrmCreacionCaptacion.EdNumeroIdentificacionContExit(
  Sender: TObject);
begin
        if EdNumeroIdentificacionCont.Text <> '' then
         with dmCaptacion.IBConsulta do
         begin
            SQL.Clear;
            SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from ');
            SQL.Add('"gen$persona" where ID_IDENTIFICACION = :"ID_ID" and ');
            SQL.Add('ID_PERSONA = :"ID_PE"');
            ParamByName('ID_ID').AsInteger := DBLCBTiposIdentificacionCont.KeyValue;
            ParamByName('ID_PE').AsString := EdNumeroIdentificacionCont.Text;
            Open;
            if RecordCount > 0 then
            begin
               EdPrimerApellidoCont.Caption := FieldByName('PRIMER_APELLIDO').AsString;
               EdSegundoApellidoCont.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
               EdNombresCont.Caption := FieldByName('NOMBRE').AsString;
            end
            else
            begin
               MessageDlg('Persona no Encontrada!',mtError,[mbOk],0);
               EdNumeroIdentificacionCont.SetFocus;
            end;
         end;
end;

procedure TfrmCreacionCaptacion.EdFechaAperturaContractualExit(
  Sender: TObject);
begin
        with dmCaptacion.IBSQL1 do
        begin
           Close;
           SQL.Clear;
           SQL.Add('select PLAZO from "cap$tiposplancontractual" where ');
           SQL.Add('ID_PLAN = :"ID"');
           ParamByName('ID').AsInteger := DBLCBPlanContractual.KeyValue;
           try
             ExecQuery;
             plazo := FieldByName('PLAZO').AsInteger;
             Close;
           except
           end;
        end;

        EdFechaVencimientoContractual.Caption := DateToStr(CalculoFecha(EdFechaAperturaContractual.Date,plazo));
        EdProximoAbonoContractual.Caption := DateToStr(CalculoFecha(EdFechaAperturaContractual.Date,30));
end;

procedure TfrmCreacionCaptacion.EdNumeroIdentificacionCerExit(
  Sender: TObject);
begin
        if EdNumeroIdentificacionCer.Text <> '' then
         with dmCaptacion.IBConsulta do
         begin
            SQL.Clear;
            SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from ');
            SQL.Add('"gen$persona" where ID_IDENTIFICACION = :"ID_ID" and ');
            SQL.Add('ID_PERSONA = :"ID_PE"');
            ParamByName('ID_ID').AsInteger := DBLCBTiposIdentificacionCer.KeyValue;
            ParamByName('ID_PE').AsString := EdNumeroIdentificacionCer.Text;
            Open;
            if RecordCount > 0 then
            begin
               EdPrimerApellidoCer.Caption := FieldByName('PRIMER_APELLIDO').AsString;
               EdSegundoApellidoCer.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
               EdNombresCer.Caption := FieldByName('NOMBRE').AsString;
            end
            else
            begin
               MessageDlg('Persona no Encontrada!',mtError,[mbOk],0);
               EdNumeroIdentificacionCont.SetFocus;
            end;
         end;

end;

procedure TfrmCreacionCaptacion.ComboTipoTasaExit(Sender: TObject);
begin
        if ComboTipoTasa.Text = 'VARIABLE' then
        begin
         DBLCBTasasVariables.Enabled := True;
         EdPuntosCer.Enabled := True;
//         EdTasaEfectivaCer.Enabled := False;
        end
        else
        begin
         DBLCBTasasVariables.Enabled := False;
         EdPuntosCer.Enabled := False;
//         EdTasaEfectivaCer.Enabled := True;
//         EdTasaEfectivaCer.Enabled := False;
        end;

end;

procedure TfrmCreacionCaptacion.GridBeneficiariosCerClick(Sender: TObject);
begin
        if GridBeneficiariosCer.Row > 0 then
        with GridBeneficiariosCer do
        begin
          if (Cells[0,Row] = '' ) and
             (Cells[1,Row] = '' ) and
             (Cells[2,Row] = '' )
             then
             CmdEliminarBenCer.Enabled := False
          else
             CmdEliminarBenCer.Enabled := True;
        end;

end;

procedure TfrmCreacionCaptacion.CmdAgregarBenCerClick(Sender: TObject);
begin

        with GridBeneficiariosCer do
        begin
          if ( Cells[2,RowCount - 1] <> '' ) then
          begin
           RowCount := RowCount + 1;
           Cells[0,RowCount - 1] := '';
           Cells[1,RowCount - 1] := '';
           Cells[2,RowCount - 1] := '';
           Cells[3,RowCount - 1] := '';
           Cells[4,RowCount - 1] := '';
           Col := 0;
           Row := RowCount - 1;
           SetFocus;
          end;
        end;
end;

procedure TfrmCreacionCaptacion.CmdEliminarBenCerClick(Sender: TObject);
var i:Integer;
begin
        with GridBeneficiariosCer do
        begin
        if Row = 0 then Abort;
        if (RowCount = 2) and
           (Row = 1) then
           begin
                Cells[0,1] := '';
                Cells[1,1] := '';
                Cells[2,1] := '';
                Cells[3,1] := '';
                Cells[4,1] := '';
           end
        else
           begin
              for i := Row to RowCount - 2 do
              begin
                Cells[0,i] := Cells[0,i+1];
                Cells[1,i] := Cells[1,i+1];
                Cells[2,i] := Cells[2,i+1];
                Cells[3,i] := Cells[3,i+1];
                Cells[4,i] := Cells[4,i+1];
              end;
              RowCount := RowCount - 1;
           end;
        end;

end;

procedure TfrmCreacionCaptacion.ComboTipoTasaChange(Sender: TObject);
begin
        if ComboTipoTasa.Text = 'VARIABLE' then
        begin
         DBLCBTasasVariables.Enabled := True;
         EdPuntosCer.Enabled := True;
//         EdTasaEfectivaCer.Enabled := False;
        end
        else
        begin
         DBLCBTasasVariables.Enabled := False;
         EdPuntosCer.Enabled := False;
//         EdTasaEfectivaCer.Enabled := True;
//         EdTasaEfectivaCer.Enabled := False;
        end;

end;

procedure TfrmCreacionCaptacion.ComboTipoTasaClick(Sender: TObject);
begin
        if ComboTipoTasa.Text = 'VARIABLE' then
        begin
         DBLCBTasasVariables.Enabled := True;
         EdPuntosCer.Enabled := True;
//         EdTasaEfectivaCer.Enabled := False;
        end
        else
        begin
         DBLCBTasasVariables.Enabled := False;
         EdPuntosCer.Enabled := False;
//         EdTasaEfectivaCer.Enabled := True;
//         EdTasaEfectivaCer.Enabled := False;
        end;

end;

procedure TfrmCreacionCaptacion.EdTasaEfectivaCerExit(Sender: TObject);
begin
        if TasaEfectiva = 0 then
          MessageDlg('Atención: esta dejando en cero la tasa de interés a pagar',mtInformation,[mbOK],0);
end;

procedure TfrmCreacionCaptacion.EdNumeroCapCerExit(Sender: TObject);
begin
       if EdNumeroCapCer.Text <> '' then
       begin
        EdNumeroCapCer.Text := FormatCurr('0000000',StrToFloat(EdNumeroCapCer.Text));
        if DBLCBTipoCaptacionCer.KeyValue > -1 then
        begin
           EdDigitoCapCer.Caption := DigitoControl(DBLCBTipoCaptacionCer.KeyValue,EdNumeroCapCer.Text);
           with dmCaptacion.IBSQL1 do
           begin
              Close;
              SQL.Clear;
              SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona" INNER JOIN ');
              SQL.Add('"cap$maestrotitular" ON "cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION ');
              SQL.Add('and "cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA ');
              SQL.Add('where "cap$maestrotitular".ID_AGENCIA = :"ID_AGENCIA" and ');
              SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :"NUMERO_CUENTA" and ');
              SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacionCer.KeyValue;
              ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCapCer.Text);
              ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCapCer.Caption);
              try
                ExecQuery;
                if RecordCount > 0 then
                begin
                   EdNombreCapCer.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                             FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                             FieldByName('NOMBRE').AsString;
                   CmdGrabar.Enabled := True;
                end
                else
                begin
                   MessageDlg('Cuenta no Existe!',mtError,[mbcancel],0);
                   EdNumeroCapCer.SetFocus;
                end;
                Close;
              except
                 MessageDlg('Error en query: buscar captación cer',mterror,[mbcancel],0);
              end;
           end;
        end
        else
        begin
           MessageDlg('Debe seleccionar un tipo de identificacion',mtInformation,[mbOK],0);
           DBLCBTipoCaptacionCer.SetFocus;
        end;
       end;
end;

procedure TfrmCreacionCaptacion.DBLCBTipoCaptacionCerEnter(
  Sender: TObject);
begin
        DBLCBTipoCaptacionCer.DropDown;
end;

procedure TfrmCreacionCaptacion.EdNumeroCapCerKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmCreacionCaptacion.EdPlazoCerExit(Sender: TObject);
begin
        if EdPlazoCer.Value < EdAmortizaCer.Value then
        begin
           MessageDlg('Atención: El plazo no puede ser menor a la amortización',mtError,[mbcancel],0);
           EdPlazoCer.SetFocus;
        end;
        EdFechaVencimientoCer.Caption := DateToStr(CalculoFecha(EdFechaAperturaCer.Date,EdPlazoCer.Value));
        EdProximoPagoCer := CalculoFecha(EdFechaAperturaCer.Date,EdAmortizaCer.Value);
end;

procedure TfrmCreacionCaptacion.EdFechaAperturaCerExit(Sender: TObject);
begin
        EdFechaVencimientoCer.Caption := DateToStr(CalculoFecha(EdFechaAperturaCer.Date,EdPlazoCer.Value));
        EdProximoPagoCer := CalculoFecha(EdFechaAperturaCer.Date,EdAmortizaCer.Value);
        //Validacion de Tasa
        with IBSQL2 do begin
          Close;
          SQL.Clear;
          SQL.Add('select TACD_TASAE from "cap$tasacdat" where');
          SQL.Add(':FECHA BETWEEN TACD_FECHAI AND TACD_FECHAF AND');
          SQL.Add(':MONTO BETWEEN TACD_MONTOI AND TACD_MONTOF AND');
          SQL.Add(':PLAZO BETWEEN TACD_PLAZOI AND TACD_PLAZOF');
          ParamByName('FECHA').AsDate := fFechaActual;
          ParamByName('MONTO').AsCurrency := EdValorCer.Value;
          ParamByName('PLAZO').AsInteger := EdPlazoCer.Value;
          ExecQuery;
          TasaEfectiva := FieldByName('TACD_TASAE').AsFloat;
          EdTasaEfectivaCer.Caption := FloatToStr(SimpleRoundTo(TasaEfectiva,-2));
          Close;
        end;
        CmdGrabar.Enabled := True;
        rgApertura.SetFocus;
end;

function TfrmCreacionCaptacion.ValidarAportacion: Boolean;
var ARecord:PMyListAho;
    Query,Retorno:TStringList;
    Root:TJvSimpleXmlElemClassic;
    ANode:TJvSimpleXmlElemClassic;
    Nodo:TJvSimpleXmlElemClassic;

    i,inic:Integer;
    Cadena:string;
    Size:Integer;
    AStream:TMemoryStream;
    RDoc :TsdXmlDocument;
//    RDoc:TJvSimpleXml;
    Total :Integer;
    ReNodo:TXmlNode;
    ReNodo1:TXmlNode;
    ReNodo2:TXmlNode;
begin
         RDoc := TsdXmlDocument.Create;
//         RDoc := TJvSimpleXml.Create(nil);
         ARecord := MyListAho.Items[0];
         Query := TStringList.Create;
         Query.Add('SELECT Count(*) as Total from "cap$maestro"');
         Query.Add('INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and ');
         Query.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
         Query.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
         Query.Add('WHERE "cap$maestrotitular".ID_IDENTIFICACION = ');
         Query.Add(IntToStr(ARecord.TipoId));
         Query.Add(' and "cap$maestrotitular".ID_PERSONA = ');
         Query.Add(QuotedStr(ARecord.NumeroId));
         Query.Add(' and "cap$maestrotitular".ID_TIPO_CAPTACION = 1 and "cap$maestro".ID_ESTADO NOT IN (2,9,11,15)');
         ADoc.Root.Name := 'query_info';
         ANode := ADoc.Root.Items.Add('querys');
         Nodo := ANode.Items.Add('query');
         Nodo.Items.Add('tipo','select');
         Nodo.Items.Add('sentencia',Query.Text);
         ADoc.SaveToFile('C:\Peticion2.xml');
         IBSQL1.Close;
         IBSQL1.SQL.Clear;
         IBSQL1.SQL.Add('select * from "gen$agencia" where "gen$agencia".ACTIVA = 1 order by ID_AGENCIA');
         try
           IBSQL1.ExecQuery;
         except
           IBSQL1.Transaction.Rollback;
           raise;
           Result := True;
           Exit;
         end;
         while not IBSQL1.Eof do
         begin
           with IdTCPClient1 do
           begin
             Host := IBSQL1.FieldByName('HOST').AsString;
             Port := IBSQL1.FieldByName('PORT').AsInteger;
             Application.ProcessMessages;
             try
              Connect;
              if Connected then
              begin
                frmProgreso := TfrmProgreso.Create(self);
                frmProgreso.Titulo := 'Recibiendo Informacion...';
                frmProgreso.InfoLabel := 'Kbs Recibidos';
                frmProgreso.Min := 0;
                frmProgreso.Ejecutar;
                Cadena := ReadLn();
                AStream := TMemoryStream.Create;
                ADoc.SaveToStream(AStream);
                AStream.Seek(0,soFromEnd);
                Size := AStream.Size;
                WriteInteger(Size,True);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                FreeAndNil(AStream);
                Size := ReadInteger(True);
                AStream := TMemoryStream.Create;
                ReadStream(AStream,Size,False);
                RDoc.Root.Clear;
                RDoc.LoadFromStream(AStream);
                RDoc.SaveToFile('C:\Respuesta1.xml');
                Total := RDoc.Root.Nodes[0].Nodes[0].Nodes[0].ValueAsInteger;
                Disconnect;
                frmProgreso.Cerrar;
              end; // fin if connected
             except
                MessageDlg('No se pudo verificar oficina: '+ IBSQL1.Fieldbyname('DESCRIPCION_AGENCIA').AsString,
                           mtError,[mbOk],0);
             end;
            end; // fin with IdTCPClient
           if Total > 0 then
           begin
             ShowMessage('Este documento presenta Cuenta de Aportes ACTIVA' + #13 + 'en la oficina:' + IBSQL1.FieldByName('DESCRIPCION_AGENCIA').AsString);
             Result := True;
             Exit;
           end;
           IBSQL1.Next;
        end; // fin while not IBSQL1.eof

// Validando Local
{        with ibsql1 do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT Count(*) as Total from "cap$maestro"');
         SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and ');
         SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and "cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
         SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
         SQL.Add('WHERE "cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
         SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and ');
         SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 1 and "cap$maestro".ID_ESTADO <> 2 and "cap$maestro".ID_ESTADO <> 9');
         ParamByName('ID_IDENTIFICACION').AsInteger := ARecord^.TipoId;
         ParamByName('ID_PERSONA').AsString := ARecord^.NumeroId;
         try
           ExecQuery;
           if RecordCount > 0 then
             if FieldByName('Total').AsInteger > 0 then
             begin
               Result := True;
             end
           else
             begin
               Result := False;
             end;
         except
            MessageDlg('Error Buscando Otras Aportaciones',mtError,[mbcancel],0);
            Result := False;
         end;
         Transaction.CommitRetaining;
        end;
}
// Buscando en otras Oficinas

end;

procedure TfrmCreacionCaptacion.DBLCBTiposTitularEnter(Sender: TObject);
begin
        DBLCBTiposTitular.DropDown;
end;

procedure TfrmCreacionCaptacion.EdFechaAperturaAhoChange(Sender: TObject);
begin
        EdFechaAperturaAho.Date := fFechaActual;
end;

procedure TfrmCreacionCaptacion.EdFechaAperApoChange(Sender: TObject);
begin
        EdFechaAperApo.Date := fFechaActual;
end;

procedure TfrmCreacionCaptacion.EdFechaAperturaCerChange(Sender: TObject);
begin
        EdFechaAperturaCer.Date := fFechaActual;
end;

procedure TfrmCreacionCaptacion.EdFechaAperturaContractualChange(
  Sender: TObject);
begin
        EdFechaAperturaContractual.Date := fFechaActual;
end;

procedure TfrmCreacionCaptacion.EdCuentaConExit(Sender: TObject);
begin
       if EdCuentaCon.Text <> '' then
       begin
        EdCuentacon.Text := FormatCurr('0000000',StrToFloat(EdCuentaCon.Text));
        if DBLCBTiposCaptacionCon.KeyValue > -1 then
        begin
           EdDigitoCon.Caption := DigitoControl(DBLCBTiposCaptacionCon.KeyValue,EdCuentaCon.Text);
           with dmCaptacion.IBSQL1 do
           begin
              Close;
              SQL.Clear;
              SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona" INNER JOIN ');
              SQL.Add('"cap$maestrotitular" ON "cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION ');
              SQL.Add('and "cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA ');
              SQL.Add('where "cap$maestrotitular".ID_AGENCIA = :"ID_AGENCIA" and ');
              SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
              SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :"NUMERO_CUENTA" and ');
              SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacionCon.KeyValue;
              ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCuentaCon.Text);
              ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCon.Caption);
              try
                ExecQuery;
                if RecordCount > 0 then
                begin
                   EdNombreCon.Caption    := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                             FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                             FieldByName('NOMBRE').AsString;
                   CmdGrabar.Enabled := True;
                   CmdGrabar.SetFocus;
                end
                else
                begin
                   MessageDlg('Cuenta no Existe!',mtError,[mbcancel],0);
                   EdCuentaCon.SetFocus;
                end;
                Close;
              except
                 MessageDlg('Error en query: buscar captación cer',mterror,[mbcancel],0);
              end;
           end;
        end
        else
        begin
           MessageDlg('Debe seleccionar un tipo de identificacion',mtInformation,[mbOK],0);
           DBLCBTiposCaptacionCon.SetFocus;
        end;
       end;

end;

procedure TfrmCreacionCaptacion.EdCuentaConKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmCreacionCaptacion.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var
        paquete :Currency;
begin
          if AWorkMode = wmRead then
          begin
            frmProgreso.Position := AWorkCount;
            paquete := AWorkCount/1000;
            frmProgreso.InfoLabel := 'Kbs Recibidos : ' + CurrToStr(paquete);
            Application.ProcessMessages;
          end;
end;

procedure TfrmCreacionCaptacion.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          if AWorkMode = wmRead then
          begin
            frmProgreso.Max := AWorkCountMax;
          end;
          frmProgreso.Titulo := 'Recibiendo Información... Tamaño: ' +  CurrToStr(AWorkCountMax/1000) + ' Kbs';

end;

procedure TfrmCreacionCaptacion.RepContractual(TipoId, id,
  NombrePlan: string; Incentivo: Currency; vComprobante: Integer);
begin
         ReporteCon.Variables.ByName['EMPRESA'].AsString := Empresa;
//         ReporteCon.Variables.ByName['NIT'].AsString := Nit;
         ReporteCon.Variables.ByName['CUENTA'].AsString := IntToStr(DBLCBTiposCaptacion.KeyValue)+Format('%.2d',[Agencia])+'-'+EdNumeroContractual.Caption+'-'+EdDigitoContractual.Caption;
         ReporteCon.Variables.ByName['NOMBRE'].AsString := EdPrimerapellidocont.Caption+' '+EdSegundoApellidoCont.Caption+ ' ' + EdNombresCont.Caption;
         ReporteCon.Variables.ByName['TIPO_ID'].AsString := TipoId;
         ReporteCon.Variables.ByName['ID'].AsString :=Id;
         ReporteCon.Variables.ByName['PLAN'].AsString := NombrePlan;
         ReporteCon.Variables.ByName['CUOTAS'].AsInteger := Cuotas;
         ReporteCon.Variables.ByName['APERTURA'].AsDateTime := EdFechaAperturaContractual.Date;
         ReporteCon.Variables.ByName['VENCIMIENTO'].AsDateTime := StrToDate(EdFechaVencimientoContractual.Caption);
         ReporteCon.Variables.ByName['FECHA_DESCUENTO'].AsDateTime := strtodate(EdProximoAbonoContractual.Caption);
         ReporteCon.Variables.ByName['VALOR'].AsDouble := EdValorContractual.Value;
         ReporteCon.Variables.ByName['INCENTIVO'].AsDouble := Incentivo;
         ReporteCon.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
         ReporteCon.Variables.ByName['CUENTADES'].AsString := IntToStr(DBLCBTiposCaptacionCon.KeyValue)+Format('%.2d',[Agencia])+'-'+EdCuentaCon.Text+'-'+EdDigitoCon.Caption;
         frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
         frmVistaPreliminar.Reporte := ReporteCon;
         frmVistaPreliminar.ShowModal;
         with IBAuxiliar do begin
           Close;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COMPROBANTE').AsInteger := vComprobante;
           ReporteC.Variables.ByName['EMPRESA'].AsString := Empresa;
           ReporteC.Variables.ByName['NIT'].AsString := Nit;
           if ReporteC.PrepareReport then
              ReporteC.PreviewPreparedReport(True);
    end;

end;

procedure TfrmCreacionCaptacion.EdValorCerEnter(Sender: TObject);
begin
        EdValorCer.SelectAll;
end;

procedure TfrmCreacionCaptacion.rgAperturaClick(Sender: TObject);
begin
        if (rgApertura.ItemIndex = 1) then
         edBanco.Enabled := true
        else
         edBanco.Enabled := false;

end;

procedure TfrmCreacionCaptacion.edBancoClick(Sender: TObject);
begin
        CodigoBanco := IBQBancos.FieldByName('CODIGO').AsString;
end;

end.
