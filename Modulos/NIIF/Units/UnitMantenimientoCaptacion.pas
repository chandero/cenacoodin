unit UnitMantenimientoCaptacion;

interface

uses
  Windows, Messages, Math,SysUtils, StrUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Buttons, ComCtrls, DB,
  IBCustomDataSet, IBQuery, Grids, XStringGrid, JvStringGrid, JvGrids,
  lmdstdcA, JvEdit, JvTypedEdit, Mask, JvToolEdit, JvCurrEdit, IBSQL;

type
  TfrmMantenimientoCaptacion = class(TForm)
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
    EdDigitoAportacion: TStaticText;
    GroupBox6: TGroupBox;
    Label12: TLabel;
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
    Label15: TLabel;
    Label16: TLabel;
    ComboTipoTasa: TComboBox;
    Label17: TLabel;
    EdTasaEfectivaCer: TJvFloatEdit2;
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
    Label38: TLabel;
    EdFechaAperturaContractual: TDateTimePicker;
    Label39: TLabel;
    EdFechaVencimientoContractual: TStaticText;
    Label40: TLabel;
    EdProximoAbonoContractual: TStaticText;
    GroupBox13: TGroupBox;
    Label41: TLabel;
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
    EdDigitoCer: TStaticText;
    EdPrimerApellidoBenCer: TEditCellEditor;
    EdSegundoApellidoBenCer: TEditCellEditor;
    EdNombresBenCer: TEditCellEditor;
    ComboParentescoCer: TComboCellEditor;
    EdPorcentajeBenCer: TUpDownCellEditor;
    EdNumeroAportacion: TJvEdit;
    EdNumeroAho: TJvEdit;
    EdNumeroContractual: TJvEdit;
    EdNumeroCer: TJvEdit;
    Label10: TLabel;
    DBLCBTiposTitular: TDBLookupComboBox;
    GridTitulares: TXStringGrid;
    DSTiposTitular: TDataSource;
    IBSQL1: TIBSQL;
    EdValorCer: TStaticText;
    EdValorContractual: TStaticText;
    IBSQL2: TIBSQL;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    DBLCBTiposCaptacionCon: TDBLookupComboBox;
    EdCuentaCon: TJvEdit;
    EdDigitoCon: TStaticText;
    EdNombreCon: TStaticText;
    DSTiposCaptacionCon: TDataSource;
    DSTiposCaptacionF: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdCerrarClick(Sender: TObject);
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
    procedure EdNumeroAportacionKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroAportacionExit(Sender: TObject);
    procedure EdNumeroAhoKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroAhoExit(Sender: TObject);
    procedure EdNumeroContractualKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroContractualExit(Sender: TObject);
    procedure EdNumeroCerKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCerExit(Sender: TObject);
    procedure EdValorContractualExit(Sender: TObject);
    procedure DBLCBPlanContractualClick(Sender: TObject);
    procedure EdCuentaConKeyPress(Sender: TObject; var Key: Char);
    procedure EdCuentaConExit(Sender: TObject);
    procedure DBLCBTiposCaptacionConEnter(Sender: TObject);
  private
    procedure Inicializar;
    function GrabarAportacion: Boolean;
    function GrabarAlaVista: Boolean;
    function GrabarContractual: Boolean;
    function GrabarCertificado: Boolean;
    procedure ActualizarListAho;
    procedure AbrirDatos;
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
  frmMantenimientoCaptacion: TfrmMantenimientoCaptacion;
  tipo:Integer;
  MyListAho: TList;
  plazo:Integer;
  EdProximoPagoCer: TDate;
  OldIdentificacion:Integer;
  OldPersona:string;
  ValorCer:Currency;
  PlanAnterior:Integer;
  ValorCon:Currency;

implementation

{$R *.dfm}

uses unitdmCaptacion, unitGlobales, unitGlobalesCol, UnitdmGeneral;

procedure TfrmMantenimientoCaptacion.FormCreate(Sender: TObject);
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


        Inicializar;
end;

procedure TfrmMantenimientoCaptacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmCaptacion.Free;
        dmGeneral.Free;
end;

procedure TfrmMantenimientoCaptacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMantenimientoCaptacion.Inicializar;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        with dmCaptacion do
        begin
          IBTiposTitular.Open;
          IBTiposTitular.Close;
          IBTiposParentesco.Open;
          IBTiposCaptacion.Open;
          IBTiposTitular.Open;
          IBTiposTitular.Last;
          IBTiposCaptacion.Last;
          IBTiposIdentificacion.Open;
          IBTiposParentesco.Open;
          IBTasasVariables.Open;
          IBTiposCaptacionCer.Open;
          IBTiposCaptacionCon.Open;
          IBPlanContractual.Open;
        end;
        GroupCaptacion.Visible := false;
        Panel1.Enabled := True;
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
        EdNumeroAportacion.text := '';
        EdDigitoAportacion.Caption := '';
        EdFechaAperApo.Date := Date;

// TabAlaVista
        with GridTitulares do
        begin
                RowCount := 2;
                Cells[0,1] := '';
                Cells[1,1] := '';
                Cells[2,1] := '';
        end;
        EdPrimerApellidoTitAho.Caption := '';
        EdSegundoApellidoTitAho.Caption := '';
        EdNombresTitAho.Caption := '';
        DBLCBTiposIdentificacion2.KeyValue := -1;
        EdNumeroIdentificacionAho.Text := '';
        CmdEliminarTitAho.Enabled := False;
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
        EdValorContractual.Caption := '$ 0';
        EdFechaAperturaContractual.Date := Date;
        EdFechaVencimientoContractual.Caption := '';
        EdProximoAbonoContractual.Caption:= '';
        EdNumeroContractual.text := '';
        EdDigitoContractual.Caption := '';
        DBLCBTiposCaptacionCon.KeyValue := -1;
        EdCuentaCon.Text := '';
        EdDigitoCon.Caption := '';
        EdNombreCon.Caption := '';

// TabCertificados
        DBLCBTiposIdentificacionCer.KeyValue := -1;
        EdNumeroIdentificacionCer.Text := '';
        EdPrimerApellidoCer.Caption := '';
        EdSegundoApellidoCer.Caption := '';
        EdNombresCer.Caption := '';
        EdValorCer.Caption  := '';
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

procedure TfrmMantenimientoCaptacion.CmdContinuarClick(Sender: TObject);
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

procedure TfrmMantenimientoCaptacion.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmMantenimientoCaptacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmMantenimientoCaptacion.DBLCBTiposCaptacionEnter(Sender: TObject);
begin
        DBLCBTiposCaptacion.DropDown;
end;

procedure TfrmMantenimientoCaptacion.DBLCBTiposIdentificacionApoEnter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacionApo.DropDown;
end;

procedure TfrmMantenimientoCaptacion.DBLCBTiposIdentificacion2Enter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacion2.DropDown;
end;

procedure TfrmMantenimientoCaptacion.DBLCBTiposIdentificacionContEnter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacionCont.DropDown;
end;

procedure TfrmMantenimientoCaptacion.DBLCBPlanContractualEnter(Sender: TObject);
begin
        DBLCBPlanContractual.DropDown;
end;

procedure TfrmMantenimientoCaptacion.DBLCBTiposIdentificacionCerEnter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacionCer.DropDown;
end;

procedure TfrmMantenimientoCaptacion.EdIdentificacionApoExit(Sender: TObject);
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
               CmdGrabar.Enabled := True;
               CmdGrabar.SetFocus;
            end
            else
            begin
               MessageDlg('Persona no Encontrada!',mtError,[mbOk],0);
               EdIdentificacionApo.SetFocus;
            end;
         end;

end;

procedure TfrmMantenimientoCaptacion.EdFechaAperApoExit(Sender: TObject);
begin
        CmdGrabar.Enabled := True;
        CmdGrabar.SetFocus;
end;

procedure TfrmMantenimientoCaptacion.CmdGrabarClick(Sender: TObject);
var r:Boolean;
begin
        if MessageDlg('Seguro de Actualizar la captación',mtConfirmation,[mbYes,mbno],0) = mrNo then
                Exit;
        r := False;
        case tipo of
           1: r := GrabarAportacion;
           2: r := GrabarAlaVista;
           3: r := GrabarContractual;
           4: begin
                r := False;
                if ValidarOpcion(CmdGrabar.Tag) then
                   r := GrabarCertificado;
              end;
        end;

        if not r then
        begin
           dmCaptacion.IBGrabar.Transaction.Rollback;
           MessageDlg('Error al Actualizar la Captación' + #13 +
                      'verifique la información',mtError,[mbOk],0);
           CmdGrabar.Enabled := False;
        end
        else
        begin
           dmCaptacion.IBGrabar.Transaction.Commit;
           MessageDlg('Captación Actualizada con exito!',mtInformation,[mbOK],0);
           CmdGrabar.Enabled := False;
        end;
        AbrirDatos;
end;

function TfrmMantenimientoCaptacion.GrabarAportacion: Boolean;
begin
         if dmCaptacion.IBSQL1.Transaction.InTransaction then
            dmCaptacion.IBSQL1.Transaction.CommitRetaining;

         with dmCaptacion.IBGrabar do
         begin
                Close;
                SQL.Clear;
                SQL.Add('delete from "cap$maestrotitular"');
                SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAportacion.Text));
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Exit;
                 end;
                end;
         end;

         with dmCaptacion.IBGrabar do
         begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrotitular" ');
                SQL.Add('Values (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
                SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,:NUMERO_TITULAR,:TIPO_TITULAR)');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAportacion.Text));
                ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacionApo.KeyValue;
                ParamByName('ID_PERSONA').AsString := EdIdentificacionApo.Text;
                ParamByName('NUMERO_TITULAR').AsInteger := 1;
                ParamByName('TIPO_TITULAR').AsInteger  := 1;
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Exit;
                 end;
                end;
         end;
         Result := True;
end;

function TfrmMantenimientoCaptacion.GrabarAlaVista: Boolean;
var i,Consecutivo:Integer;
    ARecord:PMyListAho;
begin
         if MyListAho.Count = 0 then
         begin
            MessageDlg('Debe incluir por lo menos un titular',mtError,[mbCancel],0);
            Exit;
         end;
         if dmCaptacion.IBSQL1.Transaction.InTransaction then
            dmCaptacion.IBSQL1.Transaction.CommitRetaining;

         with dmCaptacion.IBGrabar do
         begin
                Close;
                SQL.Clear;
                SQL.Add('update "cap$maestro" ');
                SQL.Add('set FIRMAS = :"FIRMAS", SELLOS = :"SELLOS", PROTECTOGRAFOS = :"PROTEC" ');
                SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.Text));
                ParamByName('FIRMAS').AsInteger := EdFirmasAho.Value;
                ParamByName('SELLOS').AsInteger := EdSellosAho.Value;
                ParamByName('PROTEC').AsInteger := EdProtecAho.Value;
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Exit;
                 end;
                end;

                with dmCaptacion.IBSQL1 do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('delete from "cap$maestrotitular"');
                    SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                    SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                    ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
                    ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.Text));
                    try
                      ExecQuery;
                    except
                      Result := False;
                      Exit;
                    end;
                    Close;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrotitular" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ID_IDENTIFICACION,ID_PERSONA,');
                SQL.Add('NUMERO_TITULAR,TIPO_TITULAR) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NUMERO_TITULAR",:"TIPO_TITULAR")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.Text));
                for i := 0 to MyListAho.Count - 1 do
                begin
                 ARecord := MyListAho.Items[i];
                 ParamByName('ID_IDENTIFICACION').AsInteger := ARecord^.TipoId;
                 ParamByName('ID_PERSONA').AsString := ARecord^.NumeroId;
                 ParamByName('NUMERO_TITULAR').AsInteger := i+1;
                 ParamByName('TIPO_TITULAR').AsInteger := ARecord^.TipoT;
                 try
                    ExecQuery;
                    Close;
                 except
                  begin
                      Result := False;
                      Exit;
                  end;
                 end;
                end;

{               with dmCaptacion.IBSQL1 do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('delete from "cap$maestrobeneficiario"');
                    SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                    SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                    ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
                    ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.text));
                    try
                      ExecQuery;
                    except
                      Result := False;
                      Exit;
                    end;
                    Close;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrobeneficiario" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,PRIMER_APELLIDO,SEGUNDO_APELLIDO,');
                SQL.Add('NOMBRE,ID_PARENTESCO,PORCENTAJE) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"PRIMER_APELLIDO",:"SEGUNDO_APELLIDO",:"NOMBRE",:"ID_PARENTESCO",:"PORCENTAJE")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.Text));
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
                        Exit;
                      end;
                      end;
                   end;
                end;
                Close;  }

{               with dmCaptacion.IBSQL1 do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('delete from "cap$maestroautorizado"');
                    SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                    SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                    ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
                    ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.text));
                    try
                      ExecQuery;
                    except
                      Result := False;
                      Exit;
                    end;
                    Close;
                end;

                if ( DBLCBTiposIdentificacion5.KeyValue > 0 ) and
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
                 ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
                 ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.text));
                 ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacion5.KeyValue;
                 ParamByName('ID_PERSONA').AsString := EdIdentificacionAutAho.Text;
                 ParamByName('PRIMER_APELLIDO').AsString := EdPrimerApellidoAutAho.Text;
                 ParamByName('SEGUNDO_APELLIDO').AsString := EdSegundoApellidoAutAho.Text;
                 ParamByName('NOMBRE').AsString := EdNombresAutAho.Text;
                 try
                    ExecQuery;
                 except
                     Result := False;
                     Exit;
                 end;
                end;}
       end;
         Result := True;
end;

function TfrmMantenimientoCaptacion.GrabarContractual: Boolean;
var i,Consecutivo:Integer;
    ARecord:PTablaConLiq;
    Lista:TList;
    FechaVencimiento:TDate;
    CuotaCada:Integer;
    PlazoCon:Integer;
    FechaCorte:TDate;
begin
         FechaCorte := fFechaActual;
         if DBLCBPlanContractual.KeyValue < 1 then
         begin
            MessageDlg('Debe seleccionar un plan',mtError,[mbcancel],0);
            DBLCBPlanContractual.SetFocus;
            Exit;
         end;

         if dmCaptacion.IBSQL1.Transaction.InTransaction then
            dmCaptacion.IBSQL1.Transaction.CommitRetaining;


         with IBSQL1 do begin
           Close;
           SQL.Clear;
           SQL.Add('select * from "cap$tiposplancontractual" where ID_PLAN = :ID_PLAN');
           ParamByName('ID_PLAN').AsInteger := DBLCBPlanContractual.KeyValue;
           try
            ExecQuery;
            if RecordCount > 0 then
              PlazoCon := FieldByName('PLAZO').AsInteger
            else
             begin
              MessageDlg('El Plan no es valido',mtError,[mbcancel],0);
              Exit;
             end;
            except
             Transaction.Rollback;
             raise;
            end;
           end;

           FechaVencimiento := CalculoFecha(EdFechaAperturaContractual.Date,PlazoCon);


         with dmCaptacion.IBGrabar do
         begin
                Close;
                SQL.Clear;
                SQL.Add('update "cap$maestro" ');
                SQL.Add('set ID_PLAN = :"ID_PLAN", FECHA_VENCIMIENTO = :FECHA_VENCIMIENTO, CUOTA_CADA = :CUOTA_CADA,');
                SQL.Add('ID_TIPO_CAPTACION_ABONO = :ID_TIPO_CAPTACION_ABONO, NUMERO_CUENTA_ABONO = :NUMERO_CUENTA_ABONO');
                SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroContractual.text));
                ParamByName('ID_PLAN').AsInteger := DBLCBPlanContractual.KeyValue;
                ParamByName('FECHA_VENCIMIENTO').AsDate := FechaVencimiento;
                ParamByName('CUOTA_CADA').AsInteger := PlazoCon;
                ParamByName('ID_TIPO_CAPTACION_ABONO').AsInteger := DBLCBTiposCaptacionCon.KeyValue;
                ParamByName('NUMERO_CUENTA_ABONO').AsInteger := StrToInt(EdCuentaCon.Text);
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Exit;
                 end;
                end;

                with dmCaptacion.IBSQL1 do
                begin
                   Close;
                   SQL.Clear;
                   SQL.Add('delete from "cap$maestrotitular" ');
                   SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                   SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                   ParamByName('ID_AGENCIA').AsInteger := Agencia;
                   ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                   ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Text);
                   ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroContractual.Text));
                   try
                     ExecQuery;
                     Close;
                   except
                     Result := False;
                     Exit;
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
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroContractual.text));
                ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacionCont.KeyValue;
                ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCont.Text;
                ParamByName('NUMERO_TITULAR').AsInteger := 1;
                ParamByName('TIPO_TITULAR').AsInteger := 1;
                try
                   ExecQuery;
                except
                 begin
                     Result := False;
                     Exit;
                 end;
                end;
                Close;
                SQL.Clear;
                SQL.Add('delete from "cap$tablaliquidacioncon"');
                SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoContractual.Caption);
                try
                 ExecQuery;
                except
                 MessageDlg('Error Borrando Tabla Anterior',mtError,[mbcancel],0);
                 Exit;
                end;


                Close;
                SQL.Clear;
                SQL.Add('select * from "cap$tiposplancontractual" where ID_PLAN = :ID_PLAN');
                ParamByName('ID_PLAN').AsInteger := DBLCBPlanContractual.KeyValue;
                ExecQuery;

                Lista := TablaCon(ValorCon,EdFechaAperturaContractual.Date,30,PlazoCon,DayOf(EdFechaAperturaContractual.Date),FechaCorte);

                Close;
                SQL.Clear;
                SQL.Add('Insert into "cap$tablaliquidacioncon" values(');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"FECHA_DESCUENTO",:"VALOR",:"DESCONTADO")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Text);
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

         end;
         Result := True;
end;

function TfrmMantenimientoCaptacion.GrabarCertificado: Boolean;
var i,Consecutivo:Integer;
    ARecord:PTablaCerLiq;
    Lista:TList;
    Dia:Word;
begin

        if EdAmortizaCer.Value = 0 then
        begin
           MessageDlg('Amortizacion no puede ser 0',mterror,[mbcancel],0);
           edamortizacer.SetFocus;
           Exit;
        end;

        if EdPlazoCer.Value = 0 then
        begin
           MessageDlg('Plazo no puede ser 0',mterror,[mbcancel],0);
           edplazocer.SetFocus;
           Exit;
        end;

        if EdPlazoCer.Value < EdAmortizaCer.Value then
        begin
           MessageDlg('Plazo no puede ser menor a la Amortización',mtError,[mbcancel],0);
           EdPlazoCer.SetFocus;
           Exit;
        end;

        if dmCaptacion.IBSQL1.Transaction.InTransaction then
            dmCaptacion.IBSQL1.Transaction.CommitRetaining;

         with dmCaptacion.IBGrabar do
         begin
                Close;
                SQL.Clear;
                SQL.Add('update "cap$maestro" set ');
                SQL.Add('PLAZO_CUENTA = :"PLAZO_CUENTA",');
                SQL.Add('TIPO_INTERES = :"TIPO_INTERES",');
                SQL.Add('ID_INTERES = :"ID_INTERES",');
                SQL.Add('TASA_EFECTIVA = :"TASA_EFECTIVA",');
                SQL.Add('PUNTOS_ADICIONALES = :"PUNTOS_ADICIONALES",');
                SQL.Add('MODALIDAD = :"MODALIDAD",');
                SQL.Add('AMORTIZACION = :"AMORTIZACION",');
                SQL.Add('ID_TIPO_CAPTACION_ABONO = :ID_TIPO_CAPTACION_ABONO,');
                SQL.Add('NUMERO_CUENTA_ABONO = :NUMERO_CUENTA_ABONO');
                SQL.Add(' where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.Text));
                ParamByName('PLAZO_CUENTA').AsInteger := EdPlazoCer.Value;
                ParamByName('TIPO_INTERES').AsString := LeftStr(ComboTipoTasa.Text,1);
                ParamByName('ID_INTERES').AsInteger := DBLCBTasasVariables.KeyValue;
                ParamByName('TASA_EFECTIVA').AsDouble := EdTasaEfectivaCer.Value;
                ParamByName('PUNTOS_ADICIONALES').AsDouble := EdPuntosCer.Value;
                ParamByName('MODALIDAD').AsString := LeftStr(ComboModalidadCer.Text,1);
                ParamByName('AMORTIZACION').AsInteger := EdAmortizaCer.Value;
                ParamByName('ID_TIPO_CAPTACION_ABONO').AsInteger := DBLCBTipoCaptacionCer.KeyValue;
                ParamByName('NUMERO_CUENTA_ABONO').AsInteger := StrToInt(EdNumeroCapCer.Text);
                try
                   ExecQuery;
                except
                     Result := False;
                     Exit;
                end;
                Close;

                SQL.Clear;
                SQL.Add('delete from "cap$maestrobeneficiario"');
                SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.Text));
                try
                  ExecQuery;
                except
                  Result := False;
                  Exit;
                end;
                Close;

                SQL.Clear;
                SQL.Add('delete from "cap$maestrotitular" ');
                SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.Text));
                try
                  ExecQuery;
                  Close;
                except
                  Result := False;
                  Exit;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrotitular" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ID_IDENTIFICACION,ID_PERSONA,');
                SQL.Add('NUMERO_TITULAR,TIPO_TITULAR) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NUMERO_TITULAR",:"TIPO_TITULAR")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.text));
                ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTiposIdentificacionCer.KeyValue;
                ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacionCer.Text;
                ParamByName('NUMERO_TITULAR').AsInteger := 1;
                ParamByName('TIPO_TITULAR').AsInteger := 1;
                try
                  ExecQuery;
                except
                  Result := False;
                  Exit;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$maestrobeneficiario" (ID_AGENCIA,ID_TIPO_CAPTACION,');
                SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,PRIMER_APELLIDO,SEGUNDO_APELLIDO,');
                SQL.Add('NOMBRE,ID_PARENTESCO,PORCENTAJE) values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"PRIMER_APELLIDO",:"SEGUNDO_APELLIDO",:"NOMBRE",:"ID_PARENTESCO",:"PORCENTAJE")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.Text));
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
                        Exit;
                       end;
                      end;
                   end;
                end;

                Dia := DayOf(EdFechaAperturaCer.Date);

                Lista := TablaCer (ValorCer,EdTasaEfectivaCer.Value,
                                  LeftStr(ComboModalidadCer.Text,1),EdFechaAperturaCer.Date, EdFechaAperturaCer.Date,
                                  EdAmortizaCer.Value,EdPlazoCer.Value,Dia);

                with dmCaptacion.IBSQL1 do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('delete from "cap$tablaliquidacion"');
                    SQL.Add('where ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                    SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA"');
                    ParamByName('ID_AGENCIA').AsInteger := Agencia;
                    ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                    ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                    ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.text));
                    try
                      ExecQuery;
                    except
                      Result := False;
                      Exit;
                    end;
                    Close;
                end;


                Close;
                SQL.Clear;
                SQL.Add('Insert into "cap$tablaliquidacion" values(');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"FECHA_PAGO",:"VALOR",:"PAGADO")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.Text));
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
                      Exit;
                   end;
                end;
                Lista.Free;
         end;
         Result := True;

end;

procedure TfrmMantenimientoCaptacion.CmdAgregarTitAhoClick(Sender: TObject);
var ARecord: PMyListAho;
    i:Integer;
begin
        if (DBLCBTiposTitular.KeyValue > 0 ) and
           (DBLCBTiposIdentificacion2.KeyValue > -1) and
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
                      Exit;
                  end
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
               end;
           end;

end;

procedure TfrmMantenimientoCaptacion.ActualizarListAho;
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

procedure TfrmMantenimientoCaptacion.GridTitularesClick(Sender: TObject);
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

procedure TfrmMantenimientoCaptacion.CmdEliminarTitAhoClick(Sender: TObject);
begin
        MyListAho.Delete(GridTitulares.Row - 1);
        ActualizarListAho;        
end;

procedure TfrmMantenimientoCaptacion.EdFechaAperturaAhoExit(Sender: TObject);
begin
        CmdGrabar.Enabled := True;
        CmdGrabar.SetFocus;
end;

procedure TfrmMantenimientoCaptacion.EdNumeroIdentificacionContExit(
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

procedure TfrmMantenimientoCaptacion.EdFechaAperturaContractualExit(
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
        CmdGrabar.Enabled := True;
        CmdGrabar.SetFocus;
end;

procedure TfrmMantenimientoCaptacion.EdNumeroIdentificacionCerExit(
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

procedure TfrmMantenimientoCaptacion.ComboTipoTasaExit(Sender: TObject);
begin
        if ComboTipoTasa.Text = 'VARIABLE' then
        begin
         DBLCBTasasVariables.Enabled := True;
         EdPuntosCer.Enabled := True;
         EdTasaEfectivaCer.Enabled := False;
        end
        else
        begin
         DBLCBTasasVariables.Enabled := False;
         EdPuntosCer.Enabled := False;
         EdTasaEfectivaCer.Enabled := True;         
        end;

end;

procedure TfrmMantenimientoCaptacion.GridBeneficiariosCerClick(Sender: TObject);
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

procedure TfrmMantenimientoCaptacion.CmdAgregarBenCerClick(Sender: TObject);
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

procedure TfrmMantenimientoCaptacion.CmdEliminarBenCerClick(Sender: TObject);
var i:Integer;
begin
        with GridBeneficiariosCer do
        begin
        if Row = 0 then Exit;
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

procedure TfrmMantenimientoCaptacion.ComboTipoTasaChange(Sender: TObject);
begin
        if ComboTipoTasa.Text = 'VARIABLE' then
        begin
         DBLCBTasasVariables.Enabled := True;
         EdPuntosCer.Enabled := True;
         EdTasaEfectivaCer.Enabled := False;
        end
        else
        begin
         DBLCBTasasVariables.Enabled := False;
         EdPuntosCer.Enabled := False;
         EdTasaEfectivaCer.Enabled := True;
        end;

end;

procedure TfrmMantenimientoCaptacion.ComboTipoTasaClick(Sender: TObject);
begin
        if ComboTipoTasa.Text = 'VARIABLE' then
        begin
         DBLCBTasasVariables.Enabled := True;
         EdPuntosCer.Enabled := True;
         EdTasaEfectivaCer.Enabled := False;
        end
        else
        begin
         DBLCBTasasVariables.Enabled := False;
         EdPuntosCer.Enabled := False;
         EdTasaEfectivaCer.Enabled := True;
        end;

end;

procedure TfrmMantenimientoCaptacion.EdTasaEfectivaCerExit(Sender: TObject);
begin
        if EdTasaEfectivaCer.Value = 0 then
          MessageDlg('Atención: esta dejando en cero la tasa de interés a pagar',mtInformation,[mbOK],0);
end;

procedure TfrmMantenimientoCaptacion.EdNumeroCapCerExit(Sender: TObject);
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

procedure TfrmMantenimientoCaptacion.DBLCBTipoCaptacionCerEnter(
  Sender: TObject);
begin
        DBLCBTipoCaptacionCer.DropDown;
end;

procedure TfrmMantenimientoCaptacion.EdNumeroCapCerKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmMantenimientoCaptacion.EdPlazoCerExit(Sender: TObject);
begin
        if EdPlazoCer.Value < EdAmortizaCer.Value then
        begin
           MessageDlg('Atención: El plazo no puede ser menor a la amortización',mtError,[mbcancel],0);
           EdPlazoCer.SetFocus;
        end;
end;

procedure TfrmMantenimientoCaptacion.EdFechaAperturaCerExit(Sender: TObject);
begin
        EdFechaVencimientoCer.Caption := DateToStr(CalculoFecha(EdFechaAperturaCer.Date,EdPlazoCer.Value));
        EdProximoPagoCer := CalculoFecha(EdFechaAperturaCer.Date,EdAmortizaCer.Value);
end;

procedure TfrmMantenimientoCaptacion.EdNumeroAportacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmMantenimientoCaptacion.EdNumeroAportacionExit(
  Sender: TObject);
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
             SQL.Add('"cap$maestro".FECHA_APERTURA');
             SQL.Add(' FROM ');
             SQL.Add('"cap$maestrotitular" ');
             SQL.Add('LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA) ');
             SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA) AND ("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION) AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA) ');
             SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
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
                 DBLCBTiposIdentificacionApo.Enabled := True;
                 EdIdentificacionApo.Enabled := True;
                 EdFechaAperApo.Date := FieldByName('FECHA_APERTURA').AsDate;
                 EdPrimerApellidoApo.Caption := FieldByName('PRIMER_APELLIDO').AsString;
                 EdSegundoApellidoApo.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
                 EdNombreApo.Caption := FieldByName('NOMBRE').AsString;
                 GroupBox5.Enabled := False;
                 CmdGrabar.Enabled := True;
                end;
             except
                MessageDlg('Error en la Consulta de la Aportación',mtError,[mbcancel],0);
             end;
        end;
end;

procedure TfrmMantenimientoCaptacion.EdNumeroAhoKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmMantenimientoCaptacion.EdNumeroAhoExit(Sender: TObject);
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
            SQL.Add('select FECHA_APERTURA,FIRMAS, SELLOS, PROTECTOGRAFOS from "cap$maestro" where ');
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

        CmdGrabar.Enabled:=True;
end;

procedure TfrmMantenimientoCaptacion.AbrirDatos;
begin
end;

procedure TfrmMantenimientoCaptacion.EdNumeroContractualKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmMantenimientoCaptacion.EdNumeroContractualExit(
  Sender: TObject);
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

        with IBSQL1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select "cap$maestro".ID_PLAN,"cap$maestro".VALOR_INICIAL,"cap$maestro".FECHA_VENCIMIENTO,');
            SQL.Add('"cap$maestro".FECHA_APERTURA,"cap$maestro".FECHA_PROXIMO_PAGO,"gen$persona".ID_IDENTIFICACION,"gen$persona".ID_PERSONA,PRIMER_APELLIDO,');
            SQL.Add('SEGUNDO_APELLIDO,NOMBRE, "cap$maestro".ID_TIPO_CAPTACION_ABONO,"cap$maestro".NUMERO_CUENTA_ABONO from "cap$maestro" LEFT JOIN ');
            SQL.Add('"cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA) AND ("cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION) AND ');
            SQL.Add('("cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA) AND ("cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
            SQL.Add(' LEFT JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
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
                 PlanAnterior := FieldByName('ID_PLAN').AsInteger;
                 EdValorContractual.Caption  := FormatCurr('$ #,#0',FieldByName('VALOR_INICIAL').AsCurrency);
                 ValorCon := FieldByName('VALOR_INICIAL').AsCurrency;
                 EdFechaAperturaContractual.Date := FieldByName('FECHA_APERTURA').AsDate;
                 EdFechaVencimientoContractual.Caption := DateToStr(FieldByName('FECHA_VENCIMIENTO').AsDate);
                 DBLCBTiposCaptacionCon.KeyValue := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                 EdCuentaCon.Text := Format('%.7d',[FieldByName('NUMERO_CUENTA_ABONO').AsInteger]);
                 EdDigitoCon.Caption := DigitoControl(DBLCBTiposCaptacionCon.KeyValue,EdCuentaCon.Text);
                 Close;
                 SQL.Clear;
                 SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE ');
                 SQL.Add('from "cap$maestrotitular"  LEFT JOIN "gen$persona" ON ');
                 SQL.Add('"gen$persona".ID_IDENTIFICACION = "cap$maestrotitular".ID_IDENTIFICACION and ');
                 SQL.Add('"gen$persona".ID_PERSONA = "cap$maestrotitular".ID_PERSONA where ');
                 SQL.Add(' ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                 SQL.Add(' NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                 ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacionCon.KeyValue;
                 ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdCuentaCon.Text);
                 ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCon.Caption);
                 try
                  ExecQuery;
                  if RecordCount > 0 then
                     EdNombreCon.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                              FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                               FieldByName('NOMBRE').AsString;
                  except
                     EdNombreCon.Caption := 'Error Buscando Captacion';
                  end;

                 IBSQL2.Close;
                 IBSQL2.SQL.Clear;
                 IBSQL2.SQL.Add('select * from "cap$tablaliquidacioncon" where');
                 IBSQL2.SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
                 IBSQL2.SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" and DESCONTADO = 0');
                 IBSQL2.SQL.Add('ORDER BY FECHA_DESCUENTO');
                 IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Agencia;
                 IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                 IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Text);
                 IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoContractual.Caption);
                 try
                  IBSQL2.ExecQuery;
                  if RecordCount > 0 then
                     EdProximoAbonoContractual.Caption := DateToStr(IBSQL2.FieldByName('FECHA_DESCUENTO').AsDate)
                  else
                     EdProximoAbonoContractual.Caption := '----/--/--';
                 except
                   Transaction.Rollback;
                   raise;
                 end;
                 IBSQL2.Close;
                 IBSQL1.Close;
                 GroupBox13.Enabled := False;
                 CmdGrabar.Enabled := True;
              end
              else
                 MessageDlg('Error Localizando Información de la Captacion',mterror,[mbCancel],0);
            except
              MessageDlg('Error Localizando Información de la Captacion',mterror,[mbCancel],0);
              Exit;
            end;
        end;
end;

procedure TfrmMantenimientoCaptacion.EdNumeroCerKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmMantenimientoCaptacion.EdNumeroCerExit(Sender: TObject);
var i:Integer;
begin
        if dmCaptacion.IBSQL1.Transaction.InTransaction then
           dmCaptacion.IBSQL1.Transaction.Commitretaining;

        if EdNumeroCer.Text <> '' then
        begin
          EdNumeroCer.Text := Format('%.7d',[StrToInt(edNumeroCer.Text)]);
          EdDigitoCer.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.Text);
          Application.ProcessMessages;
          with dmCaptacion.IBSQL1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select "cap$maestro".VALOR_INICIAL,"cap$maestro".FECHA_APERTURA,"cap$maestro".PLAZO_CUENTA,"cap$maestro".TIPO_INTERES,"cap$maestro".ID_INTERES,"cap$maestro".TASA_EFECTIVA,');
               SQL.Add('"cap$maestro".PUNTOS_ADICIONALES,"cap$maestro".MODALIDAD,"cap$maestro".AMORTIZACION,"cap$maestro".ID_ESTADO,"cap$maestro".FECHA_VENCIMIENTO,"cap$maestrotitular".ID_IDENTIFICACION,"cap$maestrotitular".ID_PERSONA,');
               SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,"gen$persona".NOMBRE,"cap$maestro".ID_TIPO_CAPTACION_ABONO,"cap$maestro".NUMERO_CUENTA_ABONO');
               SQL.Add(' from "cap$maestro" LEFT JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and ');
               SQL.Add(' "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and ');
               SQL.Add(' "cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and ');
               SQL.Add(' "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA )');
               SQL.Add(' LEFT JOIN "gen$persona" ON "cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and ');
               SQL.Add(' "cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA ');
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
                    ValorCer :=FieldByName('VALOR_INICIAL').AsCurrency;
                    EdValorCer.Caption := FormatCurr('$#,#0',ValorCer);
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
                    EdTasaEfectivaCer.Value := SimpleRoundTo(FieldByName('TASA_EFECTIVA').AsDouble,-2);
                    EdAmortizaCer.Value := FieldByName('AMORTIZACION').AsInteger;
                    if FieldByName('MODALIDAD').AsString = 'V' then
                            ComboModalidadCer.ItemIndex := 0
                    else
                            ComboModalidadCer.ItemIndex := 1;
                    EdPlazoCer.Value := FieldByName('PLAZO_CUENTA').AsInteger;
                    EdFechaAperturaCer.Date := FieldByName('FECHA_APERTURA').AsDate;
                    EdFechaVencimientoCer.Caption := DateToStr(FieldByName('FECHA_VENCIMIENTO').AsDate);
                    DBLCBTipoCaptacionCer.KeyValue := FieldByName('ID_TIPO_CAPTACION_ABONO').AsInteger;
                    EdNumeroCapCer.Text := Format('%.7d',[FieldByName('NUMERO_CUENTA_ABONO').AsInteger]);
                    EdDigitoCapCer.Caption := DigitoControl(DBLCBTipoCaptacionCer.KeyValue,EdNumeroCapCer.Text);
                    Close;
                    SQL.Clear;
                    SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE ');
                    SQL.Add('from "cap$maestrotitular"  LEFT JOIN "gen$persona" ON ');
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
                    Close;
{                    SQL.Clear;
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
                    ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCer.Text);
                    ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCer.Caption);
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
                 end; }
                  GroupBox9.Enabled := True;
                  CmdGrabar.Enabled := True;
                  EdNumeroCer.Enabled := False;
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

procedure TfrmMantenimientoCaptacion.EdValorContractualExit(
  Sender: TObject);
begin
        CmdGrabar.Enabled := True;
end;

procedure TfrmMantenimientoCaptacion.DBLCBPlanContractualClick(
  Sender: TObject);
begin
        if DBLCBPlanContractual.KeyValue < PlanAnterior then
        begin
           ShowMessage('No puede cambiar a un plan menor');
           DBLCBPlanContractual.KeyValue := PlanAnterior;
        end;
end;

procedure TfrmMantenimientoCaptacion.EdCuentaConKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmMantenimientoCaptacion.EdCuentaConExit(Sender: TObject);
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

procedure TfrmMantenimientoCaptacion.DBLCBTiposCaptacionConEnter(
  Sender: TObject);
begin
        DBLCBTiposCaptacionCon.DropDown;
end;

end.
