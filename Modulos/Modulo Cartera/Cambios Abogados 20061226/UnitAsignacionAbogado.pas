unit UnitAsignacionAbogado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DB, IBDatabase, IBCustomDataSet,
  IBQuery, IBSQL, Buttons, Grids, DBGrids, ComCtrls, DBClient, JvEdit,
  JvTypedEdit;

type
  TfrmAsignacionAbogado = class(TForm)
    Panel1: TPanel;
    IBSQL1: TIBSQL;
    IBQAbogados: TIBQuery;
    IBTransaction1: TIBTransaction;
    DSAbogados: TDataSource;
    cmdActualizar: TBitBtn;
    cmdCerrar: TBitBtn;
    IBQAbogadosPRIMER_APELLIDO: TIBStringField;
    IBQAbogadosSEGUNDO_APELLIDO: TIBStringField;
    IBQAbogadosNOMBRE: TIBStringField;
    IBQAbogadosID_IDENTIFICACION: TSmallintField;
    IBQAbogadosID_PERSONA: TIBStringField;
    IBQAbogadosID_ABOGADO: TSmallintField;
    IBSQL2: TIBSQL;
    GroupBox1: TGroupBox;
    Label31: TLabel;
    EdAgencia: TDBLookupComboBox;
    Label1: TLabel;
    EdColocacion: TEdit;
    Label3: TLabel;
    EdEstado: TStaticText;
    PageControl1: TPageControl;
    TabTitular: TTabSheet;
    DBTitular: TDBGrid;
    TabCodeudores: TTabSheet;
    IBTitular: TIBQuery;
    IBCodeudor: TIBQuery;
    DSTitular: TDataSource;
    DSCodeudor: TDataSource;
    IBTitularID_PERSONA: TIBStringField;
    IBTitularNOMBRE: TIBStringField;
    IBTitularPRIMER_APELLIDO: TIBStringField;
    IBTitularSEGUNDO_APELLIDO: TIBStringField;
    IBTitularID_DIRECCION: TSmallintField;
    IBTitularDIRECCION: TIBStringField;
    IBTitularBARRIO: TIBStringField;
    IBTitularMUNICIPIO: TIBStringField;
    DBCodeudor: TDBGrid;
    IBCodeudorID_PERSONA: TIBStringField;
    IBCodeudorNOMBRE: TIBStringField;
    IBCodeudorPRIMER_APELLIDO: TIBStringField;
    IBCodeudorSEGUNDO_APELLIDO: TIBStringField;
    IBCodeudorID_DIRECCION: TSmallintField;
    IBCodeudorDIRECCION: TIBStringField;
    IBCodeudorBARRIO: TIBStringField;
    IBCodeudorMUNICIPIO: TIBStringField;
    Label7: TLabel;
    EdFechaEntrega: TDateTimePicker;
    Label22: TLabel;
    EdCtaAportes: TStaticText;
    Label28: TLabel;
    FechaID: TStaticText;
    Label27: TLabel;
    FechaKD: TStaticText;
    Label8: TLabel;
    EdKD: TStaticText;
    Label5: TLabel;
    Label6: TLabel;
    StaticText1: TStaticText;
    Label9: TLabel;
    StaticText2: TStaticText;
    Label10: TLabel;
    StaticText3: TStaticText;
    Label4: TLabel;
    DBLCBAbogado: TDBLookupComboBox;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    EdOtrosP: TEdit;
    Label2: TLabel;
    EdTipoP: TDBLookupComboBox;
    Label11: TLabel;
    EdCiudad: TDBLookupComboBox;
    Label12: TLabel;
    EdJuzgado: TDBLookupComboBox;
    Label13: TLabel;
    EdEtapa: TDBLookupComboBox;
    Label14: TLabel;
    EdRadicado: TEdit;
    Label15: TLabel;
    EdFechaR: TDateTimePicker;
    Label16: TLabel;
    EdEstadoP: TDBLookupComboBox;
    Label17: TLabel;
    EdExito: TDBLookupComboBox;
    CHCautelar: TCheckBox;
    DSAcuerdo: TDataSource;
    IBAcuerdo: TIBQuery;
    IBAcuerdoID_AGENCIA: TSmallintField;
    IBAcuerdoID_COLOCACION: TIBStringField;
    IBAcuerdoACUERDO: TMemoField;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    CmdAgregar: TBitBtn;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    DBAcuerdo: TDBGrid;
    Panel5: TPanel;
    CmdAgregarAcuerdo: TBitBtn;
    EdAcuerdo: TMemo;
    TabSheet2: TTabSheet;
    BitBtn1: TBitBtn;
    TabSheet3: TTabSheet;
    DBBienesC: TDBGrid;
    DSBienesC: TDataSource;
    IBBienesC: TIBQuery;
    IBBienesCDESCRIPCION_BIEN: TIBStringField;
    IBBienesCBARRIO: TIBStringField;
    IBBienesCDIRECCION: TIBStringField;
    IBBienesCCIUDAD: TIBStringField;
    IBBienesCESCRITURA: TIBStringField;
    IBBienesCNOTARIA: TIBStringField;
    IBBienesCMATRICULA: TIBStringField;
    IBBienesCES_INFORMACION: TSmallintField;
    IBBienesCES_GARANTIAREAL: TSmallintField;
    IBBienesCES_GARANTIAPERSONAL: TSmallintField;
    DBSalarios: TDBGrid;
    Panel3: TPanel;
    CmdAgregarSal: TBitBtn;
    Label18: TLabel;
    EdEmpresa: TEdit;
    CDSalarios: TClientDataSet;
    CDSalariosTIPO_DOC: TIntegerField;
    CDSalariosDOCUMENTO: TStringField;
    CDSalariosEMPRESA: TStringField;
    CDSalariosVINCULACION: TStringField;
    CDSalariosSALARIO: TCurrencyField;
    DSSalarios: TDataSource;
    Label19: TLabel;
    CBtiposid: TDBLookupComboBox;
    Label20: TLabel;
    EdNumeroIdentificacion: TMemo;
    Label21: TLabel;
    Memo2: TMemo;
    Label23: TLabel;
    EdSalario: TJvCurrencyEdit;
    DSActuacion: TDataSource;
    IBActuacion: TIBQuery;
    IBActuacionFECHA_ACTUACION: TDateField;
    IBActuacionID_ACTUACION: TSmallintField;
    IBActuacionOBSERVACION: TMemoField;
    procedure IBQAbogadosNOMBRECOMPLETOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cmdCerrarClick(Sender: TObject);
    procedure EdColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdColocacionExit(Sender: TObject);
    procedure IBQAbogadosNOMBREGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cmdActualizarClick(Sender: TObject);
    procedure cmdBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAsignacionAbogado: TfrmAsignacionAbogado;
  vmodificar:Boolean;
implementation

{$R *.dfm}

uses UnitdmGeneral, UnitGlobales, UnitDmColocacion;

procedure TfrmAsignacionAbogado.IBQAbogadosNOMBRECOMPLETOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Trim(IBQAbogadosNOMBRE.AsString + ' ' + IBQAbogadosPRIMER_APELLIDO.AsString + ' ' + IBQAbogadosSEGUNDO_APELLIDO.AsString);
end;

procedure TfrmAsignacionAbogado.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAsignacionAbogado.EdColocacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmAsignacionAbogado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmAsignacionAbogado.Inicializar;
begin
        with IBQAbogados do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
        end;

        DmColocacion.IBDSagencias.Open;
        DmColocacion.IBDSagencias.Last;
        DmColocacion.IBDSagencias.First;

        EdColocacion.Text := '';
        EdEstado.Caption := '';
        DBLCBAbogado.KeyValue := -1;
        EdColocacion.SetFocus;
//        vabogado := -1;
end;

procedure TfrmAsignacionAbogado.FormShow(Sender: TObject);
begin
        EdAgencia.KeyValue := Agencia;
//        EdFecha.Caption := FormatDateTime('yyyy/mm/dd',fFechaActual);
        Inicializar;
end;

procedure TfrmAsignacionAbogado.EdColocacionExit(Sender: TObject);
var vabogado:Integer;
begin
        with IBSQL1 do begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('SELECT ');
           SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,"col$estado".ES_JURIDICO, "col$estado".ES_CASTIGADO,');
           SQL.Add('"col$colocacionabogado".ID_AGENCIA,"col$colocacionabogado".ID_COLOCACION,"col$colocacionabogado".ID_ABOGADO,');
           SQL.Add('"col$colocacionabogado".ID_IDENTIFICACION, "col$colocacionabogado".ID_PERSONA,"col$colocacionabogado".ID_ESTADO_COLOCACION,');
           SQL.Add('"col$colocacionabogado".FECHA_ENTREGA,"col$colocacionabogado".VALOR_APORTES,"col$colocacionabogado".CAPITAL,');
           SQL.Add('"col$colocacionabogado".FECHAK,"col$colocacionabogado".FECHAI,"col$colocacionabogado".RADICADO,');
           SQL.Add('"col$colocacionabogado".OTROS_PAGARES,"col$colocacionabogado".ESTADO_PROCESO,"col$colocacionabogado".MEDIDA_CAUTELAR,');
           SQL.Add('"col$colocacionabogado".JUZGADO,"col$colocacionabogado".TIPO,"col$colocacionabogado".SUBTIPO,');
           SQL.Add('"col$colocacionabogado".NUMERO_CUENTA,"col$colocacionabogado".DIGITO_CUENTA,"col$colocacionabogado".ID_EXITO,');
           SQL.Add('"col$colocacionabogado".ENTREGADO,"col$colocacion".ID_AGENCIA,"col$colocacion".ID_COLOCACION,');
           SQL.Add('"col$colocacion".ID_IDENTIFICACION,"col$colocacion".ID_PERSONA FROM "col$colocacion"');
           SQL.Add('INNER JOIN "col$colocacionabogado" ON ("col$colocacion".ID_AGENCIA="col$colocacionabogado".ID_AGENCIA)');
           SQL.Add('AND ("col$colocacion".ID_COLOCACION="col$colocacionabogado".ID_COLOCACION)');
           SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION="col$estado".ID_ESTADO_COLOCACION)');
           SQL.Add('WHERE ("col$colocacion".ID_AGENCIA = :ID_AGENCIA) AND');
           SQL.Add('("col$colocacion".ID_COLOCACION = :ID_COLOCACION)');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Trim(EdColocacion.Text);
           try
            ExecQuery;
            if RecordCount > 0 then begin
               if (FieldByName('ES_CASTIGADO').AsInteger = 0) and
                  (FieldByName('ES_JURIDICO').AsInteger = 0 ) then begin
                  Transaction.Commit;
                  MessageDlg('Colocación no esta en cobro jurídico'+#13+
                             'no es necesario asignarle un abogado',mtInformation,[mbok],0);
                  Exit;
               end;
               EdEstado.Caption := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
               EdFechaEntrega.Date := FieldByName('FECHA_ENTREGA').AsDate;
               EdCtaAportes.Caption := IntToStr(FieldByName('NUMERO_CUENTA').AsInteger) + '-' + IntToStr(FieldByName('DIGITO_CUENTA').AsInteger);
               EdOtrosP.Text := FieldByName('OTROS_PAGARES').AsString;
               EdKD.Caption := FormatCurr('#,##0.00',FieldByName('CAPITAL').AsCurrency);
               FechaKD.Caption := DateToStr(FieldByName('FECHAK').AsDate);
               FechaID.Caption := DateToStr(FieldByName('FECHAI').AsDate);
               Transaction.Commit;

               IBQAbogados.Open;
               IBQAbogados.Last;
               if vabogado <> -1 then
                 DBLCBAbogado.KeyValue := vabogado;

            end
            else
            begin
               Transaction.Commit;
               MessageDlg('Esa Colocación no Existe',mtInformation,[mbok],0);
               Exit;
            end;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

        with IBSQL1 do begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('select "col$colocacionabogado".ID_ABOGADO,"col$colocacionabogado".ID_IDENTIFICACION,"col$colocacionabogado".ID_PERSONA from');
           SQL.Add('"col$colocacionabogado" where "col$colocacionabogado".ID_AGENCIA = :ID_AGENCIA and ');
           SQL.Add('"col$colocacionabogado".ID_COLOCACION = :ID_COLOCACION');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_COLOCACION').AsString := Trim(EdColocacion.Text);
           try
            ExecQuery;
            if RecordCount > 0 then begin
               vmodificar := True;
               vabogado := FieldByName('ID_ABOGADO').AsInteger;
            end
            else
               vmodificar := False;
            Transaction.Commit;
           except
            Transaction.Rollback;
            raise;
            Exit;
           end;
        end;

end;

procedure TfrmAsignacionAbogado.IBQAbogadosNOMBREGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := Trim(IBQAbogadosNOMBRE.AsString + ' ' +
                IBQAbogadosPRIMER_APELLIDO.AsString + ' ' +
                IBQAbogadosSEGUNDO_APELLIDO.AsString);
end;

procedure TfrmAsignacionAbogado.cmdActualizarClick(Sender: TObject);
begin
        if trim(EdColocacion.Text) = '' then
        begin
           MessageDlg('Favor digitar la colocación',mtInformation,[mbok],0);
           Exit;
        end;

        if DBLCBAbogado.KeyValue < 0 then
        begin
           MessageDlg('Favor seleccionar un Abogado',mtInformation,[mbok],0);
           Exit;
        end;

        if MessageDlg('Seguro de Actualizar?',mtConfirmation,[mbyes,mbno],0) = mrno then Exit;

        with IBSQL1 do begin
          Close;
          if Transaction.InTransaction then Transaction.Commit;
          Transaction.StartTransaction;
          IBSQL2.Close;
          IBSQL2.SQL.Clear;
          IBSQL2.SQL.Add('select * from "gen$abogados" where ID_ABOGADO = :ID_ABOGADO');
          IBSQL2.ParamByName('ID_ABOGADO').AsInteger := DBLCBAbogado.KeyValue;
          try
           IBSQL2.ExecQuery;
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;

          SQL.Clear;
          if vmodificar then begin
             SQL.Add('update "col$colocacionabogado" set');
             SQL.Add('ID_ABOGADO = :ID_ABOGADO,');
             SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION,');
             SQL.Add('ID_PERSONA = :ID_PERSONA');
             SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
          end
          else
          begin
             SQL.Add('insert into "col$colocacionabogado" (ID_AGENCIA,ID_COLOCACION,');
             SQL.Add('ID_ABOGADO,ID_IDENTIFICACION,ID_PERSONA) values (');
             SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:ID_ABOGADO,:ID_IDENTIFICACION,:ID_PERSONA)');
          end;

          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_COLOCACION').AsString := Trim(EdColocacion.Text);
          ParamByName('ID_ABOGADO').AsInteger := DBLCBAbogado.KeyValue;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
          ParamByName('ID_PERSONA').AsString := IBSQL2.FieldByName('ID_PERSONA').AsString;

          try
           ExecQuery;
           Transaction.Commit;
           vmodificar := True;
           MessageDlg('Abogado Actualizado con Exito!',mtInformation,[mbok],0);
          except
           Transaction.Rollback;
           raise;
          end;
       end;
end;

procedure TfrmAsignacionAbogado.cmdBuscarClick(Sender: TObject);
begin
        EdColocacion.Text := '';
        EdEstado.Caption := '';
//        EdAsociado.Caption := '';
        DBLCBAbogado.KeyValue := -1;
end;

procedure TfrmAsignacionAbogado.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
end;

procedure TfrmAsignacionAbogado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmColocacion.Free;
        Action := caFree;
end;

end.
