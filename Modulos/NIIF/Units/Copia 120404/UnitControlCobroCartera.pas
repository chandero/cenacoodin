unit UnitControlCobroCartera;

interface

uses
  Windows, Messages, SysUtils, Variants, DateUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvEdit, JvTypedEdit, Buttons, Grids,
  XStringGrid, DB, IBCustomDataSet, DBGrids, DBCtrls, IBSQL, IBQuery,
  ComCtrls, pr_Common, pr_TxClasses, DBClient, Menus, JvComponent,
  JvArrowBtn, ImgList, JvListComb;


type
  TfrmControlCobroCartera = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    RGEstado: TRadioGroup;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDiasIni: TJvIntegerEdit;
    EdDiasFin: TJvIntegerEdit;
    Label3: TLabel;
    Label4: TLabel;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    GridColocaciones: TXStringGrid;
    DataSource1: TDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    IBSQL1: TIBQuery;
    Panel5: TPanel;
    CmdAgregar: TBitBtn;
    IBDataSet1: TIBQuery;
    CmdEliminar: TBitBtn;
    IBQuery1: TIBQuery;
    DataSource2: TDataSource;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBLCBAgencias: TDBLookupComboBox;
    EdNumeroColocacion: TEdit;
    CmdBuscar: TBitBtn;
    GroupBox6: TGroupBox;
    CmdCompromisos: TBitBtn;
    CmdOtraBusqueda: TBitBtn;
    IBDataSet1ID_AGENCIA: TSmallintField;
    IBDataSet1ID_COLOCACION: TIBStringField;
    IBDataSet1FECHA_OBSERVACION: TDateField;
    IBDataSet1OBSERVACION: TMemoField;
    IBDataSet1ES_OBSERVACION: TSmallintField;
    IBDataSet1ES_COMPROMISO: TSmallintField;
    IBDataSet1FECHA_COMPROMISO: TDateField;
    IBDataSet1PRIMER_APELLIDO: TIBStringField;
    IBDataSet1NOMBRE: TIBStringField;
    IBDataSet1COMPLETO: TStringField;
    IBSQL2: TIBSQL;
    EdFechaCompromiso: TDateTimePicker;
    ReporteMora: TprTxReport;
    IBTabla: TClientDataSet;
    IBTablaID_AGENCIA: TIntegerField;
    IBTablaID_COLOCACION: TStringField;
    IBTablaDESCRIPCION_ESTADO: TStringField;
    IBTablaCUENTA: TStringField;
    IBTablaID_IDENTIFICACION: TIntegerField;
    IBTablaID_PERSONA: TStringField;
    IBTablaNOMBRE: TStringField;
    IBTablaPRIMER_APELLIDO: TStringField;
    IBTablaSEGUNDO_APELLIDO: TStringField;
    IBTablaVALOR_DESEMBOLSO: TCurrencyField;
    IBTablaSALDO: TCurrencyField;
    IBTablaVALOR_CUOTA: TCurrencyField;
    IBTablaFECHA_DESEMBOLSO: TDateField;
    IBTablaFECHA_VENCIMIENTO: TDateField;
    IBTablaID_CLASIFICACION: TSmallintField;
    IBTablaID_EVALUACION: TStringField;
    IBTablaMORA: TIntegerField;
    IBTabla1: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    DateField1: TDateField;
    DateField2: TDateField;
    SmallintField1: TSmallintField;
    StringField8: TStringField;
    IntegerField3: TIntegerField;
    IBTabla1APORTES: TCurrencyField;
    IBTabla1AHORROS: TCurrencyField;
    IBTablaAPORTES: TCurrencyField;
    IBTablaAHORROS: TCurrencyField;
    ReporteAportes: TprTxReport;
    ComboInformes: TJvImageComboBox;
    ComboUtilidades: TJvImageComboBox;
    ComboExtractos: TJvImageComboBox;
    ComboMantenimientos: TJvImageComboBox;
    ImageList: TImageList;
    IBSQL3: TIBSQL;
    procedure CmdProcesarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridColocacionesSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure IBDataSet1OBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IBDataSet1FECHA_OBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IBDataSet1FECHA_COMPROMISOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure CmdAgregarClick(Sender: TObject);
    procedure CmdLiquidarClick(Sender: TObject);
    procedure CmdGarantiasClick(Sender: TObject);
    procedure CmdPersonalClick(Sender: TObject);
    procedure EdNumeroColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CmdBuscarClick(Sender: TObject);
    procedure CmdCompromisosClick(Sender: TObject);
    procedure CmdEliminarClick(Sender: TObject);
    procedure CmdOtraBusquedaClick(Sender: TObject);
    procedure IBDataSet1COMPLETOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdFechaCompromisoExit(Sender: TObject);
    procedure CmdInformeClick(Sender: TObject);
    procedure CmdRepAportesClick(Sender: TObject);
    procedure CmdInformesClick(Sender: TObject);
    procedure ComboInformesClick(Sender: TObject);
    procedure ComboUtilidadesClick(Sender: TObject);
    procedure ComboExtractosClick(Sender: TObject);
    procedure ComboMantenimientosClick(Sender: TObject);
  private
    { Private declarations }
    FAgencia:Integer;
    FColocacion:string;
    procedure Inicializar;
    function BuscarAhorros(TipoId: integer; DocumentoId: string): Currency;
    function BuscarAportes(TipoId: integer; DocumentoId: string): Currency;
    function BuscarCuenta(TipoId: integer; DocumentoId: string): string;
    procedure InformeMora;
    procedure InformeAportes;
  public
    { Public declarations }
    property IdAgencia:Integer read FAgencia Write FAgencia;
    property Colocacion:string read FColocacion Write FColocacion;
  end;

var
  frmControlCobroCartera: TfrmControlCobroCartera;
  Colocacion:string;
  Id:Integer;
  Documento:string;
  Nombres1:string;
  FechaCompromiso:TDate;
  FilaCol:Integer;
  
implementation

uses UnitdmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso,UnitAgregarObservacion,
     UnitConsultaLiquidacion,UnitConsultaGarantias,
     UnitDireccionesAsociados, UnitVistaPreliminar,
     UnitConsultaExtractoCaptacion, UnitExtractoColocacion,
     UnitCreaciondePersona;

{$R *.dfm}

procedure TfrmControlCobroCartera.CmdProcesarClick(Sender: TObject);
var Fecha:TDate;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
    Ahorros : Currency;
    Aportes : Currency;
begin
        if ( EdDiasIni.Value > EdDiasFin.Value) then
        begin
           MessageDlg('Verifique los dias de mora',mtInformation,[mbcancel],0);
           Exit;
        end;

        CmdProcesar.Enabled := False;
        CmdBuscar.Enabled := False;
        CmdCompromisos.Enabled := False;
        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        FechaHoy := Date;

       with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          case RGEstado.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION < 4)');
           1: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0)');
           2: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 1)');
           3: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 2)');
           4: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 3)');
          end;

          SQL.Add('Order by "col$colocacion".ID_ESTADO_COLOCACION DESC, "col$colocacion".FECHA_INTERES DESC');

          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"col$colocacion".ID_CLASIFICACION,');
          SQL.Add('"col$colocacion".ID_EVALUACION,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,');
          SQL.Add('"col$colocacion".FECHA_VENCIMIENTO,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');

          case RGEstado.ItemIndex of
           0: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION < 4)');
           1: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 0)');
           2: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 1)');
           3: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 2)');
           4: SQL.Add('("col$colocacion".ID_ESTADO_COLOCACION = 3)');
          end;

          SQL.Add('Order by "col$colocacion".ID_ESTADO_COLOCACION DESC, "col$colocacion".FECHA_INTERES DESC');

          try
            Open;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               CmdBuscar.Enabled := True;
               CmdCompromisos.Enabled := True;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Buscando Colocaciones';
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Ejecutar;
              while not Eof do begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
                Application.ProcessMessages;
                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                Fecha := IncDay(Fecha);
                Dias := DiasEntre(Fecha,FechaHoy);
                if (EdDiasIni.Value  <= Dias) and
                   (Dias <= EdDiasFin.Value  ) then
                begin
                   Conteo := Conteo + 1;
                   GridColocaciones.RowCount := Conteo + 1;
                   GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                   GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                       FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                       FieldByName('NOMBRE').AsString;
                   GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                   GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                   GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                   GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                   GridColocaciones.Cells[6,Conteo] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                   GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                   GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                   Id := FieldByName('ID_IDENTIFICACION').AsInteger;
                   Documento := FieldByName('ID_PERSONA').AsString;
                   Aportes := BuscarAportes(Id,Documento);
                   Ahorros := BuscarAhorros(Id,Documento);
                   GridColocaciones.Cells[11,Conteo] := FormatCurr('$#,#0.00',Ahorros);
                   GridColocaciones.Cells[12,Conteo] := FormatCurr('$#,#0.00',Aportes);

                   IBTabla.Append;
                   IBTabla.FieldByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                   IBTabla.FieldByName('ID_COLOCACION').AsString := FieldByName('ID_COLOCACION').AsString;
                   IBTabla.FieldByName('DESCRIPCION_ESTADO').AsString := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   IBTabla.FieldByName('CUENTA').AsString := BuscarCuenta(Id,Documento);
                   IBTabla.FieldByName('ID_IDENTIFICACION').AsInteger := Id;
                   IBTabla.FieldByName('ID_PERSONA').AsString := Documento;
                   IBTabla.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
                   IBTabla.FieldByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
                   IBTabla.FieldByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
                   IBTabla.FieldByName('VALOR_DESEMBOLSO').AsCurrency := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                   IBTabla.FieldByName('SALDO').AsCurrency := FieldByName('SALDO').AsCurrency;
                   IBTabla.FieldByName('VALOR_CUOTA').AsCurrency := FieldByName('VALOR_CUOTA').AsCurrency;
                   IBTabla.FieldByName('FECHA_DESEMBOLSO').AsDateTime := FieldByName('FECHA_DESEMBOLSO').AsDateTime;
                   IBTabla.FieldByName('FECHA_VENCIMIENTO').AsDateTime := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                   IBTabla.FieldByName('ID_CLASIFICACION').AsInteger := FieldByName('ID_CLASIFICACION').AsInteger;
                   IBTabla.FieldByName('ID_EVALUACION').AsString := FieldByName('ID_EVALUACION').AsString;
                   IBTabla.FieldByName('MORA').AsInteger := Dias;
                   IBTabla.FieldByName('APORTES').AsCurrency := Aportes;
                   IBTabla.FieldByName('AHORROS').AsCurrency := Ahorros;
                   IBTabla.Post;
                end;
                Next;
              end;
              frmProgreso.Cerrar;
            end;
          except
            Screen.Cursor := Save_Cursor;
            Close;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            Exit;
          end;
        end;
    Screen.Cursor := Save_Cursor;
end;

procedure TfrmControlCobroCartera.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmControlCobroCartera.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmControlCobroCartera.GridColocacionesSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
       if ARow = 0 then Exit;
       GroupBox4.Caption := 'Observaciones y Compromisos Colocación No.:' + GridColocaciones.Cells[0,ARow];
       Colocacion := GridColocaciones.Cells[0,ARow];
       Id := StrToInt(GridColocaciones.Cells[8,ARow]);
       Documento := GridColocaciones.Cells[9,ARow];
       Nombres1 := GridColocaciones.Cells[1,ARow];
       with IBDataSet1 do begin
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COLOCACION').AsString := GridColocaciones.Cells[0,ARow];
         try
           Open;
           CmdAgregar.Enabled := True;
         except
           MessageDlg('Error al buscar datos de la colocación',mtError,[mbcancel],0);
           Exit;
         end;
       end;

end;

procedure TfrmControlCobroCartera.IBDataSet1OBSERVACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TfrmControlCobroCartera.IBDataSet1FECHA_OBSERVACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := DateToStr(Sender.AsDateTime);
end;

procedure TfrmControlCobroCartera.IBDataSet1FECHA_COMPROMISOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        if (DateToStr(Sender.AsDateTime) = '1899/12/30') or
           (DateToStr(Sender.AsDateTime) = '30/12/1899') then
           Text := ''
        else
           Text :=DateToStr(Sender.AsDateTime);
end;

procedure TfrmControlCobroCartera.CmdAgregarClick(Sender: TObject);
var frmAgregarObservacionCobro:TfrmAgregarObservacionCobro;
begin
     frmAgregarObservacionCobro := TfrmAgregarObservacionCobro.Create(Self);
     with frmAgregarObservacionCobro do begin
        if ShowModal = mrok then begin
           if IBSQL1.Transaction.InTransaction then
              IBSQL1.Transaction.Rollback;
           IBSQL1.Transaction.StartTransaction;
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('INSERT INTO "col$controlcobro" values(');
           IBSQL1.SQL.Add(':ID_AGENCIA,:ID_COLOCACION,:FECHA_OBSERVACION,');
           IBSQL1.SQL.Add(':OBSERVACION,:ES_OBSERVACION,:ES_COMPROMISO,:FECHA_COMPROMISO,');
           IBSQL1.SQL.Add(':ID_USUARIO)');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
           IBSQL1.ParamByName('ID_COLOCACION').AsString := Colocacion;
           IBSQL1.ParamByName('FECHA_OBSERVACION').AsDate := FechaObs;
           IBSQL1.ParamByName('OBSERVACION').AsString := Memo;
           IBSQL1.ParamByName('ES_OBSERVACION').AsInteger := BooleanoToInt(Not EsCompromiso);
           IBSQL1.ParamByName('ES_COMPROMISO').AsInteger := BooleanoToInt(EsCompromiso);
           IBSQL1.ParamByName('ID_USUARIO').AsString := DBAlias;
           if EsCompromiso then
              IBSQL1.ParamByName('FECHA_COMPROMISO').AsDate := FechaCom
           else
              IBSQL1.ParamByName('FECHA_COMPROMISO').Clear;

           try
             IBSQL1.ExecSQL;
             IBSQL1.Transaction.Commit;
           except
             MessageDlg('Error Al Agregar Observación',mtError,[mbcancel],0);
           end;
        end;
        Free;
     end;


       with IBDataSet1 do begin
         Close;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COLOCACION').AsString := Colocacion;
         try
           Open;
         except
           MessageDlg('Error al buscar datos de la colocación',mtError,[mbcancel],0);
           Exit;
         end;
       end;

end;

procedure TfrmControlCobroCartera.CmdLiquidarClick(Sender: TObject);
var frmConsultaLiquidacion:TfrmConsultaLiquidacion;
begin
        frmConsultaLiquidacion := TfrmConsultaLiquidacion.Create(Self);
        frmConsultaLiquidacion.Agencia := Agencia;
        frmConsultaLiquidacion.Colocacion := Colocacion;
        frmConsultaLiquidacion.ShowModal;
end;

procedure TfrmControlCobroCartera.CmdGarantiasClick(Sender: TObject);
var frmConsultaGarantias:TfrmConsultaGarantias;
begin
    frmConsultaGarantias := TfrmConsultaGarantias.Create(Self);
    frmConsultaGarantias.Agencia := Agencia;
    frmConsultaGarantias.IdColocacion := Colocacion;
    frmConsultaGarantias.ShowModal;
end;

procedure TfrmControlCobroCartera.CmdPersonalClick(Sender: TObject);
var frmDireccionesAsociado:TfrmDireccionesAsociado;
begin
    frmDireccionesAsociado := TfrmDireccionesAsociado.Create(Self);
    frmDireccionesAsociado.Id := Id;
    frmDireccionesAsociado.Documento := Documento;
    frmDireccionesAsociado.Nombre := Nombres1;
    frmDireccionesAsociado.ShowModal;
end;

procedure TfrmControlCobroCartera.EdNumeroColocacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmControlCobroCartera.FormShow(Sender: TObject);
begin
        IBQuery1.Open;
        IBQuery1.Last;
        DBLCBAgencias.KeyValue := Agencia;
        if (FAgencia <> 0) and (FColocacion <> '') then begin
          DBLCBAgencias.KeyValue := FAgencia;
          EdNumeroColocacion.Text := FColocacion;
          CmdBuscar.Click;
        end;
        EdFechaCompromiso.Date := Date;
        FechaCompromiso := EdFechaCompromiso.Date;
end;

procedure TfrmControlCobroCartera.CmdBuscarClick(Sender: TObject);
var Fecha:TDate;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
begin
        CmdProcesar.Enabled := False;
        CmdBuscar.Enabled := False;
        CmdCompromisos.Enabled := False;
        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        FechaHoy := Date;
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('"col$colocacion".ID_AGENCIA = :ID_AGENCIA and "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencias.KeyValue;
          ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;



        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('WHERE');
          SQL.Add('"col$colocacion".ID_AGENCIA = :ID_AGENCIA and "col$colocacion".ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencias.KeyValue;
          ParamByName('ID_COLOCACION').AsString := EdNumeroColocacion.Text;
          try
            Open;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               CmdBuscar.Enabled := True;
               CmdCompromisos.Enabled := True;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Buscando Colocaciones';
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Ejecutar;
              while not Eof do begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
                Application.ProcessMessages;
                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                Fecha := IncDay(Fecha);
                Dias := DiasEntre(Fecha,FechaHoy);
                   Conteo := Conteo + 1;
                   GridColocaciones.RowCount := Conteo + 1;
                   GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                   GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                       FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                       FieldByName('NOMBRE').AsString;
                   GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                   GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                   GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                   GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                   GridColocaciones.Cells[6,Conteo] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                   GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                   GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                   Id := FieldByName('ID_IDENTIFICACION').AsInteger;
                   Documento := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[11,Conteo] := FormatCurr('$#,#0.00',BuscarAhorros(Id,Documento));;
                   GridColocaciones.Cells[12,Conteo] := FormatCurr('$#,#0.00',BuscarAportes(Id,Documento));
                Next;
              end;
              frmProgreso.Cerrar;
            end;
          except
            Screen.Cursor := Save_Cursor;
            Close;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            Exit;
          end;
        end;
    Screen.Cursor := Save_Cursor;

end;

procedure TfrmControlCobroCartera.CmdCompromisosClick(Sender: TObject);
var Fecha:TDate;
    DiasFecha,Dias,Amortiza,Conteo:Integer;
    Tipo:string;
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
begin
        CmdProcesar.Enabled := False;
        CmdBuscar.Enabled := False;
        CmdCompromisos.Enabled := False;
        Conteo := 0;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;
//        FechaHoy := Date;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('INNER JOIN "col$controlcobro" ON ("col$colocacion".ID_AGENCIA = "col$controlcobro".ID_AGENCIA and "col$colocacion".ID_COLOCACION = "col$controlcobro".ID_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('"col$controlcobro".ES_COMPROMISO <> 0 and "col$controlcobro".FECHA_COMPROMISO = :FECHA_COMPROMISO');
          ParamByName('FECHA_COMPROMISO').AsDate := FechaCompromiso;
          try
            Open;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;


        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$colocacion".ID_AGENCIA,');
          SQL.Add('"col$colocacion".ID_COLOCACION,');
          SQL.Add('"col$colocacion".ID_IDENTIFICACION,');
          SQL.Add('"col$colocacion".ID_PERSONA,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"col$colocacion".FECHA_CAPITAL,');
          SQL.Add('"col$colocacion".FECHA_INTERES,');
          SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,');
          SQL.Add('"col$colocacion".AMORTIZA_INTERES,');
          SQL.Add('"col$colocacion".VALOR_CUOTA,');
          SQL.Add('"col$colocacion".VALOR_DESEMBOLSO - "col$colocacion".ABONOS_CAPITAL AS SALDO,');
          SQL.Add('"col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
          SQL.Add('"col$tiposcuota".CAPITAL,');
          SQL.Add('"col$tiposcuota".INTERES');
          SQL.Add('FROM');
          SQL.Add('"col$colocacion"');
          SQL.Add('LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) AND ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION = "col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
          SQL.Add('INNER JOIN "col$controlcobro" ON ("col$colocacion".ID_AGENCIA = "col$controlcobro".ID_AGENCIA and "col$colocacion".ID_COLOCACION = "col$controlcobro".ID_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('"col$controlcobro".ES_COMPROMISO <> 0 and "col$controlcobro".FECHA_COMPROMISO = :FECHA_COMPROMISO');
          ParamByName('FECHA_COMPROMISO').AsDate := FechaCompromiso;
          try
            Open;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               CmdBuscar.Enabled := True;
               CmdCompromisos.Enabled := True;
               MessageDlg('No se encontraron registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Buscando Colocaciones';
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Ejecutar;
              while not Eof do begin
                frmProgreso.Position := RecNo;
                frmProgreso.InfoLabel := 'Colocación No:' + FieldByName('ID_COLOCACION').AsString;
                Application.ProcessMessages;
                Fecha := FieldByName('FECHA_INTERES').AsDateTime;
                Tipo := FieldByName('INTERES').AsString;
                Amortiza := FieldByName('AMORTIZA_INTERES').AsInteger;
                if Tipo = 'V' then
                  Fecha := CalculoFecha(Fecha,Amortiza);
                Fecha := IncDay(Fecha);                  
                Dias := DiasEntre(Fecha,FechaHoy);
                   Conteo := Conteo + 1;
                   GridColocaciones.RowCount := Conteo + 1;
                   GridColocaciones.Cells[0,Conteo] := FieldByName('ID_COLOCACION').AsString;
                   GridColocaciones.Cells[1,Conteo] := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                                       FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                                       FieldByName('NOMBRE').AsString;
                   GridColocaciones.Cells[2,Conteo] := FormatCurr('$#,##0',FieldByName('SALDO').AsCurrency);
                   GridColocaciones.Cells[3,Conteo] := FormatCurr('$#,##0',FieldByName('VALOR_CUOTA').AsCurrency);
                   GridColocaciones.Cells[4,Conteo] := DateToStr(FieldByName('FECHA_CAPITAL').AsDateTime);
                   GridColocaciones.Cells[5,Conteo] := DateToStr(FieldByName('FECHA_INTERES').AsDateTime);
                   GridColocaciones.Cells[6,Conteo] := FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString;
                   GridColocaciones.Cells[7,Conteo] := IntToStr(Dias);
                   GridColocaciones.Cells[8,Conteo] := IntToStr(FieldByName('ID_IDENTIFICACION').AsInteger);
                   GridColocaciones.Cells[9,Conteo] := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[10,Conteo] := FieldByName('DESCRIPCION_TIPO_CUOTA').AsString;
                   Id := FieldByName('ID_IDENTIFICACION').AsInteger;
                   Documento := FieldByName('ID_PERSONA').AsString;
                   GridColocaciones.Cells[11,Conteo] := FormatCurr('$#,#0.00',BuscarAhorros(Id,Documento));;
                   GridColocaciones.Cells[12,Conteo] := FormatCurr('$#,#0.00',BuscarAportes(Id,Documento));
                Next;
              end;
              frmProgreso.Cerrar;
            end;
          except
            Screen.Cursor := Save_Cursor;
            Close;
            MessageDlg('Error al buscar colocaciones, consulte con sistemas',mtError,[mbcancel],0);
            Exit;
          end;
        end;
    Screen.Cursor := Save_Cursor;
          
end;

procedure TfrmControlCobroCartera.CmdEliminarClick(Sender: TObject);
begin
        if (IBDataSet1.FieldByName('FECHA_OBSERVACION').AsDateTime = FechaHoy) and
           (IBDataSet1.FieldByName('ID_USUARIO').AsString = DBAlias) then
        begin
           if MessageDlg('Seguro de Eliminar Esta Observación?',mtConfirmation,[mbYes,mbNo],0) = mryes then begin
             IBDataSet1.Delete;
             IBDataSet1.Transaction.CommitRetaining;
           end;
        end;
end;

procedure TfrmControlCobroCartera.CmdOtraBusquedaClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmControlCobroCartera.Inicializar;
begin
         if IBSQL1.Transaction.InTransaction then
            IBSQL1.Transaction.Rollback;
         IBSQL1.Transaction.StartTransaction;
         IBSQL1.Close;
         IBDataSet1.Close;
         IBQuery1.Open;
         IBQuery1.Last;
         RGEstado.ItemIndex := 0;
         EdDiasIni.Value := 0;
         EdDiasFin.Value := 0;
         EdNumeroColocacion.Text := '';
         with GridColocaciones do begin
           RowCount := 2;
           Cells[0,1] := '';
           Cells[1,1] := '';
           Cells[2,1] := '';
           Cells[3,1] := '';
           Cells[4,1] := '';
           Cells[5,1] := '';
           Cells[6,1] := '';
           Cells[7,1] := '';
           Cells[8,1] := '';
           Cells[9,1] := '';
           Cells[10,1] := '';
         end;
         RGEstado.SetFocus;
         CmdProcesar.Enabled := True;
         CmdBuscar.Enabled := True;
         CmdCompromisos.Enabled := True;
         EdFechaCompromiso.Date := Date;
         FechaCompromiso := EdFechaCompromiso.Date;
         IBTabla.EmptyDataSet;
end;

procedure TfrmControlCobroCartera.IBDataSet1COMPLETOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := IBDataSet1NOMBRE.Value + ' '+ IBDataSet1PRIMER_APELLIDO.Value;
end;

function TfrmControlCobroCartera.BuscarAhorros(TipoId: integer;
  DocumentoId: string): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
begin
  with IBSQL2 do begin
     Close;
     sql.Clear;
     Sql.Add('select * from P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
     ParamByName('ID_IDENTIFICACION').AsInteger := Id;
     ParamByName('ID_PERSONA').AsString := Documento;
     ExecQuery;
     Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
     Digito := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
     Close;

     SQL.Clear;
     SQL.Add('Select * from P_CAP_0012 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO)');
     ParamByName('ID_AGENCIA').AsInteger := Agencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
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
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
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

     Saldo := Saldo + Movimiento;
     Result := Saldo - Canje;
end;
end;

function TfrmControlCobroCartera.BuscarAportes(TipoId: integer;
  DocumentoId: string): Currency;
var Saldo,Movimiento,Canje,Disponible:Currency;
    Ag,Tipo,Cuenta,Digito:Integer;
begin
   with IBSQL2 do begin
     Close;
     SQL.Clear;
     Sql.Add('select * from P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
     ParamByName('ID_AGENCIA').AsInteger;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
     ParamByName('ID_IDENTIFICACION').AsInteger := Id;
     ParamByName('ID_PERSONA').AsString := Documento;
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

procedure TfrmControlCobroCartera.DBGrid1DblClick(Sender: TObject);
begin
     frmAgregarObservacionCobro := TfrmAgregarObservacionCobro.Create(Self);
     with frmAgregarObservacionCobro do begin
       if IBDataSet1.RecordCount > 0 then begin
        EdFechaObservacion.Date  := IBDataSet1.FieldByName('FECHA_OBSERVACION').AsDateTime;
        EdFechaCompromiso.Date := IBDataSet1.FieldByName('FECHA_COMPROMISO').AsDateTime;
        Memo1.Text := IBDataSet1.FieldByName('OBSERVACION').AsString;
        ChkCompromiso.Checked := InttoBoolean(IBDataSet1.FieldByName('ES_COMPROMISO').AsInteger);
        ShowModal;
       end;
       Free;
     end;

end;

procedure TfrmControlCobroCartera.EdFechaCompromisoExit(Sender: TObject);
begin
        FechaCompromiso := EdFechaCompromiso.Date;
end;

function TfrmControlCobroCartera.BuscarCuenta(TipoId: integer;
  DocumentoId: string): string;
var
NumeroCuenta, DigitoCuenta : Integer;
begin
        with IBSQL2 do
         begin
           Close;
           sql.Clear;
           Sql.Add('select * from P_CAP_0016 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           ParamByName('ID_AGENCIA').AsInteger;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           ParamByName('ID_IDENTIFICACION').AsInteger := Id;
           ParamByName('ID_PERSONA').AsString := Documento;
           ExecQuery;
           NumeroCuenta := FieldByName('NUMERO_CUENTA').AsInteger;
           DigitoCuenta := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO_CUENTA').AsInteger)));
           Close;
         end;
         Result := FormatCurr('0000000',NumeroCuenta) + '-' + IntToStr(DigitoCuenta);
end;

procedure TfrmControlCobroCartera.CmdInformeClick(Sender: TObject);
begin
          Empleado;
          ReporteMora.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteMora.Variables.ByName['AGENCIA'].AsInteger := Agencia;
          ReporteMora.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          ReporteMora.Variables.ByName['NIT'].AsString := Nit;
          ReporteMora.Variables.ByName['MORAI'].AsInteger := EdDiasIni.Value;

          if ReporteMora.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReporteMora;
             frmVistaPreliminar.ShowModal;
           end;
end;

procedure TfrmControlCobroCartera.CmdRepAportesClick(Sender: TObject);
begin
         Empleado;
          ReporteAportes.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteAportes.Variables.ByName['AGENCIA'].AsInteger := Agencia;
          ReporteAportes.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          ReporteAportes.Variables.ByName['NIT'].AsString := Nit;
          ReporteAportes.Variables.ByName['MORAI'].AsInteger := EdDiasIni.Value;

          if ReporteAportes.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReporteAportes;
             frmVistaPreliminar.ShowModal;
           end;
end;

procedure TfrmControlCobroCartera.InformeMora;
begin
          Empleado;
          ReporteMora.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteMora.Variables.ByName['AGENCIA'].AsInteger := Agencia;
          ReporteMora.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          ReporteMora.Variables.ByName['NIT'].AsString := Nit;
          ReporteMora.Variables.ByName['MORAI'].AsInteger := EdDiasIni.Value;

          if ReporteMora.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReporteMora;
             frmVistaPreliminar.ShowModal;
           end;
end;

procedure TfrmControlCobroCartera.InformeAportes;
begin
         Empleado;
          ReporteAportes.Variables.ByName['EMPRESA'].AsString := Empresa;
          ReporteAportes.Variables.ByName['AGENCIA'].AsInteger := Agencia;
          ReporteAportes.Variables.ByName['EMPLEADO'].AsString := Nombres + ' ' + Apellidos;
          ReporteAportes.Variables.ByName['NIT'].AsString := Nit;
          ReporteAportes.Variables.ByName['MORAI'].AsInteger := EdDiasIni.Value;

          if ReporteAportes.PrepareReport then
           begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReporteAportes;
             frmVistaPreliminar.ShowModal;
           end;
end;

procedure TfrmControlCobroCartera.CmdInformesClick(Sender: TObject);
begin
   //     if CmdInformes.
end;

procedure TfrmControlCobroCartera.ComboInformesClick(Sender: TObject);
begin
        if ComboInformes.ItemIndex = 0 then
           InformeMora
        else
           InformeAportes;
end;

procedure TfrmControlCobroCartera.ComboUtilidadesClick(Sender: TObject);
begin
        if ComboUtilidades.ItemIndex = 1 then
         begin
           frmDireccionesAsociado := TfrmDireccionesAsociado.Create(Self);
           frmDireccionesAsociado.Id := Id;
           frmDireccionesAsociado.Documento := Documento;
           frmDireccionesAsociado.Nombre := Nombres1;
           frmDireccionesAsociado.ShowModal;
         end
        else if ComboUtilidades.ItemIndex = 2 then
         begin
           frmConsultaGarantias := TfrmConsultaGarantias.Create(Self);
           frmConsultaGarantias.Agencia := Agencia;
           frmConsultaGarantias.IdColocacion := Colocacion;
           frmConsultaGarantias.ShowModal;
         end
        else if ComboUtilidades.ItemIndex = 3 then
         begin
           frmConsultaLiquidacion := TfrmConsultaLiquidacion.Create(Self);
           frmConsultaLiquidacion.Agencia := Agencia;
           frmConsultaLiquidacion.Colocacion := Colocacion;
           frmConsultaLiquidacion.ShowModal;
         end;
end;

procedure TfrmControlCobroCartera.ComboExtractosClick(Sender: TObject);
var
Cuenta,Digito:Integer;
begin
        if ComboExtractos.ItemIndex = 1 then
         begin
           IBSQL3.SQL.Clear;
           IBSQL3.SQL.Add('select * from P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
           IBSQL3.ParamByName('ID_AGENCIA').AsInteger;
           IBSQL3.ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
           IBSQL3.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
           IBSQL3.ParamByName('ID_PERSONA').AsString := Documento;
           IBSQL3.ExecQuery;
           Cuenta := IBSQL3.FieldByName('NUMERO_CUENTA').AsInteger;
           Digito := StrToInt(DigitoControl(2,FormatCurr('0000000',IBSQL3.FieldByName('NUMERO_CUENTA').AsInteger)));
           IBSQL3.Close;

           frmConsultaExtractoCaptacion := TfrmConsultaExtractoCaptacion.Create(self);
           frmConsultaExtractoCaptacion.AgenciaA := agencia;
           frmConsultaExtractoCaptacion.Tipo := 2;
           frmConsultaExtractoCaptacion.Cuenta := Cuenta;
           frmConsultaExtractoCaptacion.Digito := Digito;
           frmConsultaExtractoCaptacion.ShowModal;
         end
        else if ComboExtractos.ItemIndex = 2 then
         begin
           FrmExtractoColocacion := TFrmExtractoColocacion.Create(Self);
           FrmExtractoColocacion.AgenciaC := Agencia;
           FrmExtractoColocacion.Colocacion := Colocacion;
           FrmExtractoColocacion.ShowModal;
         end;
end;

procedure TfrmControlCobroCartera.ComboMantenimientosClick(
  Sender: TObject);
begin
        if ComboMantenimientos.ItemIndex = 1 then
         begin
           frmCreacionPersona := TfrmCreacionPersona.Create(Self);
           frmCreacionPersona.Id := Id;
           frmCreacionPersona.Documento := Documento;
           frmCreacionPersona.ShowModal;
         end;
end;

end.
