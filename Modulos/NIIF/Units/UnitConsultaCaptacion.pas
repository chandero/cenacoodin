unit UnitConsultaCaptacion;

interface

uses
  Windows, Messages, Math, SysUtils, StrUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Buttons, ComCtrls, DB,
  IBCustomDataSet, IBQuery, Grids, XStringGrid, JvStringGrid, JvGrids,
  lmdstdcA, JvEdit, JvTypedEdit, Mask, JvToolEdit, JvCurrEdit, IBSQL,
  dbcgrids, JvStaticText,
  unitdmCaptacion, UnitDmGeneral
  ;

type
  TfrmConsultaCaptacion = class(TForm)
    GroupCaptacion: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    DBLCBTiposCaptacion: TDBLookupComboBox;
    Panel2: TPanel;
    CmdNuevo: TBitBtn;
    CmdCerrar: TBitBtn;
    PageControl: TPageControl;
    DSTiposCaptacion: TDataSource;
    TabAportacion: TTabSheet;
    Label49: TLabel;
    DBLCBTiposIdentificacionApo: TDBLookupComboBox;
    Label50: TLabel;
    EdIdentificacionApo: TMemo;
    TabAlaVista: TTabSheet;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdPrimerApellidoTitAho: TStaticText;
    EdSegundoApellidoTitAho: TStaticText;
    EdNombresTitAho: TStaticText;
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
    EdValorContractual: TJvCurrencyEdit;
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
    EdNumeroAportacion: TJvEdit;
    EdNumeroAho: TJvEdit;
    EdNumeroContractual: TJvEdit;
    EdNumeroCer: TJvEdit;
    GridTitulares: TXStringGrid;
    DSTiposTitular: TDataSource;
    IBSQL1: TIBSQL;
    PageControl1: TPageControl;
    TabMovimientos: TTabSheet;
    TabSheet1: TTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    DBImage1: TDBImage;
    DBImage3: TDBImage;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    Label3: TLabel;
    EdSaldoIAno: TJvStaticText;
    Label4: TLabel;
    EdSaldoActual: TJvStaticText;
    Label5: TLabel;
    EdEstadoCaptacion: TJvStaticText;
    GridCaptaciones1: TXStringGrid;
    IBSaldosMes: TIBQuery;
    DSSaldosMes: TDataSource;
    IBSQL: TIBSQL;
    GridCaptaciones2: TXStringGrid;
    Panel3: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    Panel6: TPanel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EdSaldoIAporte: TJvStaticText;
    EdSaldoAporte: TJvStaticText;
    EdEstadoAporte: TJvStaticText;
    Panel9: TPanel;
    GridSaldosMes: TXStringGrid;
    TabSheet3: TTabSheet;
    DBCtrlGrid2: TDBCtrlGrid;
    DBImage2: TDBImage;
    DBImage4: TDBImage;
    EdValorCer: TStaticText;
    Label48: TLabel;
    EdEstadoCer: TStaticText;
    TabSheet4: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdContinuarClick(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBTiposCaptacionEnter(Sender: TObject);
    procedure DBLCBTiposIdentificacionApoEnter(Sender: TObject);
    procedure DBLCBTiposIdentificacionContEnter(Sender: TObject);
    procedure DBLCBPlanContractualEnter(Sender: TObject);
    procedure DBLCBTiposIdentificacionCerEnter(Sender: TObject);
    procedure EdIdentificacionApoExit(Sender: TObject);
    procedure GridTitularesClick(Sender: TObject);
    procedure CmdEliminarTitAhoClick(Sender: TObject);
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
    procedure DBImage1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Inicializar;
    procedure ActualizarListAho;
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
  frmConsultaCaptacion: TfrmConsultaCaptacion;
  dmGeneral: TdmGeneral;
  DataModule: TdmCaptacion;
  tipo:Integer;
  MyListAho: TList;
  plazo:Integer;
  EdProximoPagoCer: TDate;
  OldIdentificacion:Integer;
  OldPersona:string;

implementation

{$R *.dfm}

uses  unitGlobales, unitGlobalesCol, UnitImagenAmpliada;

procedure TfrmConsultaCaptacion.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        DataModule := TdmCaptacion.Create(self);

                DataModule.IBTiposCaptacion.Database := dmGeneral.IBDatabase1;
        DataModule.IBTiposIdentificacion.Database := dmGeneral.IBDatabase1;
        DataModule.IBConsulta.Database := dmGeneral.IBDatabase1;
        DataModule.IBTiposParentesco.Database := dmGeneral.IBDatabase1;
        DataModule.IBTasasVariables.Database := dmGeneral.IBDatabase1;
        DataModule.IBTiposCaptacionCer.Database := dmGeneral.IBDatabase1;
        DataModule.IBPlanContractual.Database := dmGeneral.IBDatabase1;
        DataModule.IBGrabar.Database := dmGeneral.IBDatabase1;
        DataModule.IBSQL1.Database := dmGeneral.IBDatabase1;
        DataModule.IBTiposTitular.Database := dmGeneral.IBDatabase1;
        DataModule.IBTiposCaptacionCon.Database := dmGeneral.IBDatabase1;
        DataModule.IBTiposCaptacionF.Database := dmGeneral.IBDatabase1;

        DataModule.IBTiposCaptacion.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBTiposIdentificacion.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBConsulta.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBTiposParentesco.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBTasasVariables.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBTiposCaptacionCer.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBPlanContractual.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBGrabar.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBSQL1.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBTiposTitular.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBTiposCaptacionCon.Transaction := dmGeneral.IBTransaction1;
        DataModule.IBTiposCaptacionF.Transaction := dmGeneral.IBTransaction1;

        Inicializar;
end;

procedure TfrmConsultaCaptacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

        DataModule.Free;
        dmGeneral.Free;

end;

procedure TfrmConsultaCaptacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsultaCaptacion.Inicializar;
begin
        if dmGeneral.IBTransaction1.InTransaction then
          dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;

        with DataModule do
        begin
          IBTiposTitular.Open;
          IBTiposTitular.Close;
          IBTiposParentesco.Open;
          IBTiposCaptacion.Open;
          IBTiposCaptacion.Last;
          IBTiposIdentificacion.Open;
          IBTiposParentesco.Open;
          IBTasasVariables.Open;
          IBTiposCaptacionCer.Open;
          IBPlanContractual.Open;
        end;
        GroupCaptacion.Visible := false;
        Panel1.Enabled := True;
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
        EdValorCer.Caption := '';
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

        IBQuery1.Close;
end;

procedure TfrmConsultaCaptacion.CmdContinuarClick(Sender: TObject);
begin
        with DataModule.IBConsulta do
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

procedure TfrmConsultaCaptacion.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmConsultaCaptacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmConsultaCaptacion.DBLCBTiposCaptacionEnter(Sender: TObject);
begin
        DBLCBTiposCaptacion.DropDown;
end;

procedure TfrmConsultaCaptacion.DBLCBTiposIdentificacionApoEnter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacionApo.DropDown;
end;

procedure TfrmConsultaCaptacion.DBLCBTiposIdentificacionContEnter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacionCont.DropDown;
end;

procedure TfrmConsultaCaptacion.DBLCBPlanContractualEnter(Sender: TObject);
begin
        DBLCBPlanContractual.DropDown;
end;

procedure TfrmConsultaCaptacion.DBLCBTiposIdentificacionCerEnter(
  Sender: TObject);
begin
        DBLCBTiposIdentificacionCer.DropDown;
end;

procedure TfrmConsultaCaptacion.EdIdentificacionApoExit(Sender: TObject);
begin
        if EdIdentificacionApo.Text <> '' then
         with DataModule.IBConsulta do
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



procedure TfrmConsultaCaptacion.ActualizarListAho;
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

procedure TfrmConsultaCaptacion.GridTitularesClick(Sender: TObject);
var ARecord:PMyListAho;
begin
        if ( GridTitulares.Row > 0 ) and
           ( MyListAho.Count > 0 ) then
        begin
           IBQuery1.RecNo := GridTitulares.Row;
           ARecord := MyListAho.Items[GridTitulares.Row - 1];
           with DataModule.IBSQL1 do
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

procedure TfrmConsultaCaptacion.CmdEliminarTitAhoClick(Sender: TObject);
begin
        MyListAho.Delete(GridTitulares.Row - 1);
        ActualizarListAho;        
end;


procedure TfrmConsultaCaptacion.EdNumeroIdentificacionContExit(
  Sender: TObject);
begin
        if EdNumeroIdentificacionCont.Text <> '' then
         with DataModule.IBConsulta do
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

procedure TfrmConsultaCaptacion.EdFechaAperturaContractualExit(
  Sender: TObject);
begin
        with DataModule.IBSQL1 do
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

procedure TfrmConsultaCaptacion.EdNumeroIdentificacionCerExit(
  Sender: TObject);
begin
        if EdNumeroIdentificacionCer.Text <> '' then
         with DataModule.IBConsulta do
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

procedure TfrmConsultaCaptacion.ComboTipoTasaExit(Sender: TObject);
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

procedure TfrmConsultaCaptacion.GridBeneficiariosCerClick(Sender: TObject);
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

procedure TfrmConsultaCaptacion.CmdAgregarBenCerClick(Sender: TObject);
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

procedure TfrmConsultaCaptacion.CmdEliminarBenCerClick(Sender: TObject);
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

procedure TfrmConsultaCaptacion.ComboTipoTasaChange(Sender: TObject);
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

procedure TfrmConsultaCaptacion.ComboTipoTasaClick(Sender: TObject);
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

procedure TfrmConsultaCaptacion.EdTasaEfectivaCerExit(Sender: TObject);
begin
        if EdTasaEfectivaCer.Value = 0 then
          MessageDlg('Atención: esta dejando en cero la tasa de interés a pagar',mtInformation,[mbOK],0);
end;

procedure TfrmConsultaCaptacion.EdNumeroCapCerExit(Sender: TObject);
begin
       if EdNumeroCapCer.Text <> '' then
       begin
        EdNumeroCapCer.Text := FormatCurr('0000000',StrToFloat(EdNumeroCapCer.Text));
        if DBLCBTipoCaptacionCer.KeyValue > -1 then
        begin
           EdDigitoCapCer.Caption := DigitoControl(DBLCBTipoCaptacionCer.KeyValue,EdNumeroCapCer.Text);
           with DataModule.IBSQL1 do
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

procedure TfrmConsultaCaptacion.DBLCBTipoCaptacionCerEnter(
  Sender: TObject);
begin
        DBLCBTipoCaptacionCer.DropDown;
end;

procedure TfrmConsultaCaptacion.EdNumeroCapCerKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsultaCaptacion.EdPlazoCerExit(Sender: TObject);
begin
        if EdPlazoCer.Value < EdAmortizaCer.Value then
        begin
           MessageDlg('Atención: El plazo no puede ser menor a la amortización',mtError,[mbcancel],0);
           EdPlazoCer.SetFocus;
        end;
end;

procedure TfrmConsultaCaptacion.EdFechaAperturaCerExit(Sender: TObject);
begin
        EdFechaVencimientoCer.Caption := DateToStr(CalculoFecha(EdFechaAperturaCer.Date,EdPlazoCer.Value));
        EdProximoPagoCer := CalculoFecha(EdFechaAperturaCer.Date,EdAmortizaCer.Value);
end;

procedure TfrmConsultaCaptacion.EdNumeroAportacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsultaCaptacion.EdNumeroAportacionExit(
  Sender: TObject);
var Inicial,Actual:Currency;
    i,tmp:Integer;
begin
        if Ednumeroaportacion.Text = '' then Exit;
        EdNumeroAportacion.Text := Format('%.7d',[StrtoInt(EdNumeroAportacion.Text)]);
        EdDigitoAportacion.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAportacion.Text);

        Inicial := 0;
        Actual := 0;

        for i := 1 to 12 do
        begin
           GridSaldosMes.Cells[0,i] := Meses[i];
        end;


        with DataModule.IBSQL1 do
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
             SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA) ');
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
                end;
             except
                MessageDlg('Error en la Consulta de la Aportación',mtError,[mbcancel],0);
                Exit;
             end;
        end;

        with IBQuery1 do BEGIN
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAportacion.Caption);
         try
          Open;
         except
          MessageDlg('Error Buscando Imagenes',mtError,[mbcancel],0);
         end;
        end;

        with IBSQL do
        begin
                Close;
                SQL.Clear;
                SQL.Add('select SALDO_INICIAL from "cap$maestrosaldoinicial" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                SQL.Add('and ANO = :"ANO" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
                ParamByName('DIGITO_CUENTA').Asinteger := StrToInt(EdDigitoAportacion.Caption);
                ParamByName('ANO').AsString := FloatToStr(yearof(Date));
                ExecQuery;
                if RecordCount > 0 then
                begin
                   Inicial := FieldByName('SALDO_INICIAL').AsCurrency;
                   EdSaldoIAporte.Caption := FormatCurr('$0,0.00',FieldByName('SALDO_INICIAL').AsCurrency);
                end;
                Close;
                SQL.Clear;
                SQL.Add('select ID_ESTADO,FECHA_APERTURA from "cap$maestro" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAportacion.Caption);
                ExecQuery;
                if RecordCount > 0 then
                   begin
                     tmp := FieldByName('ID_ESTADO').AsInteger;
                     Close;
                     SQL.Clear;
                     SQL.Add('select DESCRIPCION from "cap$tiposestado" where ');
                     SQL.Add('ID_ESTADO = :"ID_ESTADO" ');
                     ParamByName('ID_ESTADO').AsInteger := tmp;
                     ExecQuery;
                     if RecordCount > 0 then
                        EdEstadoAporte.Caption := FieldByName('DESCRIPCION').AsString;
                     Close;
                   end;
                Close;

                SQL.Clear;
                SQL.Add('select SALDO_ACTUAL as SALDO from SALDO_ACTUAL(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                ParamByName('AG').AsInteger := Agencia;
                ParamByName('TP').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('CTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
                ParamByName('DGT').AsInteger := StrToInt(EdDigitoAportacion.Caption);
                ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                ParamByName('FECHA2').AsDate := fFechaActual;
                ExecQuery;
                Actual := FieldByName('SALDO_ACTUAL').AsCurrency;
                Close;
                Actual := Inicial + Actual;
                EdSaldoAporte.Caption := FormatCurr('$0,0.00',Actual);
        end;


        with IBSaldosMes do
        begin
             Close;
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAportacion.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAportacion.Caption);
             Open;
             while not Eof do
             begin
               GridSaldosMes.Cells[1,StrToInt(FieldByName('MES').AsString)] := FormatCurr('0,0.00',FieldByName('DEBITO').AsCurrency);
               GridSaldosMes.Cells[2,StrToInt(FieldByName('MES').AsString)] := FormatCurr('0,0.00',FieldByName('CREDITO').AsCurrency);
               Inicial := Inicial + FieldByName('SUMA').AsCurrency;
               GridSaldosMes.Cells[3,StrToInt(FieldByName('MES').AsString)] := FormatCurr('0,0.00',inicial);
               Next;
             end;
        end;

end;

procedure TfrmConsultaCaptacion.EdNumeroAhoKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsultaCaptacion.EdNumeroAhoExit(Sender: TObject);
var ARecord: PMyListAho;
    I:Integer;
    Inicial,Actual:Currency;
    tmp:Integer;
begin
        if EdNumeroAho.Text <> '' then
        begin
           EdNumeroAho.Text := Format('%.7d',[StrToInt(EdNumeroAho.Text)]);
           EdDigitoAho.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.Text);
        end
        else
           Exit;

        Inicial := 0;
        Actual := 0;

        for i := 1 to 12 do
        begin
           GridCaptaciones1.Cells[0,i] := Meses[i];
        end;
           

        MyListAho.Clear;
        with DataModule.IBSQL1 do
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
        
        with IBQuery1 do BEGIN
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
         try
          Open;
         except
          MessageDlg('Error Buscando Imagenes',mtError,[mbcancel],0);
         end;
        end;
        GridTitularesClick(Sender);

        with IBSQL do
        begin
                Close;
                SQL.Clear;
                SQL.Add('select SALDO_INICIAL from "cap$maestrosaldoinicial" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                SQL.Add('and ANO = :"ANO" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
                ParamByName('DIGITO_CUENTA').Asinteger := StrToInt(EdDigitoAho.Caption);
                ParamByName('ANO').AsString := FloatToStr(yearof(Date));
                ExecQuery;
                if RecordCount > 0 then
                begin
                   Inicial := FieldByName('SALDO_INICIAL').AsCurrency;
                   EdSaldoIAno.Caption := FormatCurr('$0,0.00',FieldByName('SALDO_INICIAL').AsCurrency);
                end;
                Close;
                SQL.Clear;
                SQL.Add('select ID_ESTADO,FECHA_APERTURA from "cap$maestro" where ');
                SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ');
                SQL.Add('and NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                ParamByName('ID_AGENCIA').AsInteger := agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
                ExecQuery;
                if RecordCount > 0 then
                   begin
                     tmp := FieldByName('ID_ESTADO').AsInteger;
                     Close;
                     SQL.Clear;
                     SQL.Add('select DESCRIPCION from "cap$tiposestado" where ');
                     SQL.Add('ID_ESTADO = :"ID_ESTADO" ');
                     ParamByName('ID_ESTADO').AsInteger := tmp;
                     ExecQuery;
                     if RecordCount > 0 then
                        EdEstadoCaptacion.Caption := FieldByName('DESCRIPCION').AsString;
                     Close;
                   end;
                Close;
                SQL.Clear;
                SQL.Clear;
                SQL.Add('select SALDO_ACTUAL as SALDO from SALDO_ACTUAL(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
                ParamByName('AG').AsInteger := Agencia;
                ParamByName('TP').AsInteger := DBLCBTiposCaptacion.KeyValue;
                ParamByName('CTA').AsInteger := StrToInt(EdNumeroAho.Text);
                ParamByName('DGT').AsInteger := StrToInt(EdDigitoAho.Caption);
                ParamByName('ANO').AsString := IntToStr(YearOf(fFechaActual));
                ParamByName('FECHA1').AsDate := EncodeDate(YearOf(fFechaActual),01,01);
                ParamByName('FECHA2').AsDate := fFechaActual;
                ExecQuery;
                Actual := FieldByName('SALDO').AsCurrency;
                Close;
                EdSaldoActual.Caption := FormatCurr('$0,0.00',Actual);
        end;


        with IBSaldosMes do
        begin
             Close;
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
             Open;
             while not Eof do
             begin
               GridCaptaciones1.Cells[1,StrToInt(FieldByName('MES').AsString)] := FormatCurr('0,0.00',FieldByName('DEBITO').AsCurrency);
               GridCaptaciones1.Cells[2,StrToInt(FieldByName('MES').AsString)] := FormatCurr('0,0.00',FieldByName('CREDITO').AsCurrency);
               Inicial := Inicial + FieldByName('SUMA').AsCurrency;
               GridCaptaciones1.Cells[3,StrToInt(FieldByName('MES').AsString)] := FormatCurr('0,0.00',inicial);
               Next;
             end;
        end;
        

end;

procedure TfrmConsultaCaptacion.EdNumeroContractualKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsultaCaptacion.EdNumeroContractualExit(
  Sender: TObject);
var Inicial,Actual:Currency;
    i:Integer;
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

        Inicial := 0;
        Actual := 0;
        for i := 1 to 12 do
        begin
           GridCaptaciones2.Cells[0,i] := Meses[i];
        end;


        with DataModule.IBSQL1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select "cap$maestro".ID_PLAN,"cap$maestro".VALOR_INICIAL,"cap$maestro".FECHA_VENCIMIENTO,');
            SQL.Add('"cap$maestro".FECHA_APERTURA,"cap$maestro".FECHA_PROXIMO_PAGO,"gen$persona".ID_IDENTIFICACION,"gen$persona".ID_PERSONA,PRIMER_APELLIDO,');
            SQL.Add('SEGUNDO_APELLIDO,NOMBRE from "gen$persona" INNER JOIN ');
            SQL.Add('"cap$maestrotitular" ON "cap$maestrotitular".ID_IDENTIFICACION ');
            SQL.Add(' = "gen$persona".ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA ');
            SQL.Add(' INNER JOIN "cap$maestro" ON "cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and ');
            SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and ');
            SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and "cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA ');
            SQL.Add(' where ');
            SQL.Add('ID_AGENCIA = :"ID_AGENCIA" and ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
            SQL.Add('NUMERO_CUENTA = :"NUMERO_CUENTA" and DIGITO_CUENTA = :"DIGITO_CUENTA" ');
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
                 GroupBox13.Enabled := False;
              end;
            except
              MessageDlg('Error Localizando el Titular de la Captacion',mterror,[mbCancel],0);
              Exit;
            end;
        end;

        with IBSaldosMes do
        begin
             Close;
             ParamByName('ID_AGENCIA').AsInteger := agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := tipo;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroContractual.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoContractual.Caption);
             Open;
             while not Eof do
             begin
               GridCaptaciones2.Cells[1,StrToInt(FieldByName('MES').AsString)] := FormatCurr('0,0.00',FieldByName('DEBITO').AsCurrency);
               GridCaptaciones2.Cells[2,StrToInt(FieldByName('MES').AsString)] := FormatCurr('0,0.00',FieldByName('CREDITO').AsCurrency);
               Inicial := Inicial + FieldByName('SUMA').AsCurrency;
               GridCaptaciones2.Cells[3,StrToInt(FieldByName('MES').AsString)] := FormatCurr('0,0.00',inicial);
               Next;
             end;
        end;

end;

procedure TfrmConsultaCaptacion.EdNumeroCerKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsultaCaptacion.EdNumeroCerExit(Sender: TObject);
var i:Integer;
begin
        if DataModule.IBSQL1.Transaction.InTransaction then
           DataModule.IBSQL1.Transaction.CommitRetaining;

        if EdNumeroCer.Text <> '' then
        begin
          EdNumeroCer.Text := Format('%.7d',[StrToInt(edNumeroCer.Text)]);
          EdDigitoCer.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroCer.Text);
          Application.ProcessMessages;
          with DataModule.IBSQL1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select VALOR_INICIAL,FECHA_APERTURA,PLAZO_CUENTA,TIPO_INTERES,ID_INTERES,TASA_EFECTIVA,');
               SQL.Add('PUNTOS_ADICIONALES,MODALIDAD,AMORTIZACION,"cap$maestro".ID_ESTADO,"cap$tiposestado".DESCRIPCION,FECHA_VENCIMIENTO,p.ID_IDENTIFICACION,p.ID_PERSONA,');
               SQL.Add('PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,ID_TIPO_CAPTACION_ABONO,NUMERO_CUENTA_ABONO');
               SQL.Add(' from "cap$maestro" INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and ');
               SQL.Add(' "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and ');
               SQL.Add(' "cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and ');
               SQL.Add(' "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA )');
               SQL.Add(' INNER JOIN "gen$persona" p ON "cap$maestrotitular".ID_IDENTIFICACION = p.ID_IDENTIFICACION and ');
               SQL.Add(' "cap$maestrotitular".ID_PERSONA = p.ID_PERSONA ');
               SQL.Add(' INNER JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
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
                    EdValorCer.Caption := FormatCurr('#,##0',FieldByName('VALOR_INICIAL').AsCurrency);
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
                    EdTasaEfectivaCer.Value := SimpleRoundTo(FieldByName('TASA_EFECTIVA').AsFloat,-2);
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
                    EdEstadoCer.Caption := FieldByName('DESCRIPCION').AsString;
                    Close;
                    SQL.Clear;
                    SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE ');
                    SQL.Add('from "cap$maestrotitular" INNER JOIN "gen$persona" ON ');
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

procedure TfrmConsultaCaptacion.DBImage1DblClick(Sender: TObject);
var frmImagenAmpliada:TfrmImagenAmpliada;
begin
         frmImagenAmpliada := TfrmImagenAmpliada.Create(Self);
         frmImagenAmpliada.Imagen := DBImage1.Picture.Bitmap;
         frmImagenAmpliada.ShowModal;
end;

procedure TfrmConsultaCaptacion.FormShow(Sender: TObject);
begin
        DBLCBTiposCaptacion.SetFocus;
end;

end.
