unit UnitConsultaSol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, JvEdit, JvTypedEdit, DBCtrls, Mask,
  JvStaticText, ExtCtrls, Buttons, Grids, DBGrids, DB, DBClient,strutils,
  IBCustomDataSet, IBQuery, IBDatabase, IBSQL, XStringGrid, Menus, UnitDmGeneral;

type
  TFrmConsultaSol = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBtipo: TDBLookupComboBox;
    Label3: TLabel;
    Mradicado: TMaskEdit;
    Label4: TLabel;
    fecha: TJvStaticText;
    JVnumero: TJvEdit;
    CDsolicitud: TClientDataSet;
    DSsolicitud: TDataSource;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DStipo: TDataSource;
    IBTransaction1: TIBTransaction;
    IBtipo: TIBQuery;
    BTbuscar: TBitBtn;
    BTbuscar1: TBitBtn;
    TabSheet3: TTabSheet;
    IBQuery1: TIBQuery;
    DBtipocuenta: TDBLookupComboBox;
    Label8: TLabel;
    BitBtn3: TBitBtn;
    Label9: TLabel;
    DataSource1: TDataSource;
    JVcuenta: TJvEdit;
    IBSQL1: TIBSQL;
    IBTransaction2: TIBTransaction;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    CmdAgregar: TBitBtn;
    DSObservaciones: TDataSource;
    IBObservaciones: TIBQuery;
    IBGeneral: TIBQuery;
    DSGeneral: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    IBGeneralID_IDENTIFICACION: TSmallintField;
    IBGeneralID_PERSONA: TIBStringField;
    IBGeneralID_SOLICITUD: TIBStringField;
    IBGeneralESTADO: TSmallintField;
    IBGeneralVALOR_APROBADO: TIBBCDField;
    IBGeneralOBSERVACION: TMemoField;
    IBGeneralFECHA_ANALISIS: TDateField;
    IBGeneralID_ANALISIS: TIBStringField;
    IBGeneralDESCRIPCION_ESTADO: TIBStringField;
    IBGeneralCUENTA: TIBStringField;
    IBGeneralEMPLEADO: TIBStringField;
    IBGeneralASOCIADO: TIBStringField;
    IBObservacionesID_AGENCIA: TSmallintField;
    IBObservacionesID_SOLICITUD: TIBStringField;
    IBObservacionesFECHA_OBSERVACION: TDateField;
    IBObservacionesHORA_OBSERVACION: TTimeField;
    IBObservacionesOBSERVACION: TMemoField;
    IBObservacionesUSUARIO: TIBStringField;
    TabSheet4: TTabSheet;
    CmdProcesar: TBitBtn;
    CDsolicitudID_IDENTIFICACION: TIntegerField;
    CDsolicitudID_PERSONA: TStringField;
    CDsolicitudID_SOLICITUD: TStringField;
    CDsolicitudESTADO: TIntegerField;
    CDsolicitudVALOR_APROBADO: TCurrencyField;
    CDsolicitudOBSERVACION: TMemoField;
    CDsolicitudFECHA_ANALISIS: TDateField;
    CDsolicitudID_ANALISIS: TStringField;
    CDsolicitudDESCRIPCION_ESTADO: TStringField;
    CDsolicitudEMPLEADO: TStringField;
    CDsolicitudASOCIADO: TStringField;
    CDsolicitudCUENTA: TStringField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    EdDiasIni: TJvIntegerEdit;
    Label6: TLabel;
    EdDiasFin: TJvIntegerEdit;
    Label7: TLabel;
    SubMenu: TPopupMenu;
    Observaciones1: TMenuItem;
    Direcciones1: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BTbuscarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BTbuscar1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure MradicadoEnter(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure CmdAgregarClick(Sender: TObject);
    procedure IBGeneralOBSERVACIONGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure IBObservacionesOBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IBGeneralVALOR_APROBADOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure CDsolicitudOBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure Direcciones1Click(Sender: TObject);
    procedure Observaciones1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    observacion :string;
    FSolicitud:string;
    function Bsucar(vIdSolicitud: string): string;
    procedure Inicializar;
    { Private declarations }
  public
    property Solicitud:string read FSolicitud Write FSolicitud;
  published
    procedure cmChildKey(var msg: TWMKEY); message CM_CHILDKEY;
    { Public declarations }
  end;

var
  FrmConsultaSol: TFrmConsultaSol;
  dmGeneral: TdmGeneral;
  Solicitud:string;
  Nombres:string;
  Id:integer;
  Documento:string;
  Cambio:Boolean;

implementation

uses UnitDmSolicitud, UnitDescObservacion, UnitGlobales, UnitAgregarObservacionSol,
  UnitDireccionesAsociados, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmConsultaSol.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmConsultaSol.cmChildKey(var msg: TWMKEY);
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

procedure TFrmConsultaSol.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction2.DefaultDatabase := dmGeneral.IBDatabase1;
        IBGeneral.Database := dmGeneral.IBDatabase1;
        IBGeneral.Transaction := dmGeneral.IBTransaction1;
        IBtipo.Database := dmGeneral.IBDatabase1;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBObservaciones.Database := dmGeneral.IBDatabase1;
        DmSolicitud := TDmSolicitud.Create(Self);
end;

procedure TFrmConsultaSol.BTbuscarClick(Sender: TObject);
var     oficina :Integer;
begin
        with IBGeneral do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT "col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".OBSERVACION,');
          SQL.Add('"col$solicitud".FECHA_ANALISIS,');
          SQL.Add('"col$solicitud".ID_ANALISIS,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA ||'' - ''|| "cap$maestrotitular".DIGITO_CUENTA as CUENTA,');
          SQL.Add('"gen$empleado".NOMBRE ||'' ''|| "gen$empleado".PRIMER_APELLIDO AS EMPLEADO,');
          SQL.Add('"gen$persona".NOMBRE ||'' ''||  "gen$persona".PRIMER_APELLIDO ||'' ''|| "gen$persona".SEGUNDO_APELLIDO AS ASOCIADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("col$solicitud".ID_PERSONA="cap$maestrotitular".ID_PERSONA)');
          SQL.Add('AND ("col$solicitud".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION)');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$solicitud".ID_ANALISIS="gen$empleado".ID_EMPLEADO)');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
          SQL.Add('WHERE ');
          SQL.Add('("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("col$solicitud".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 1) AND');
          SQL.Add('("cap$maestrotitular".TIPO_TITULAR = 1) AND');
          SQL.Add('("col$solicitud".ESTADO <> 6) AND');
          SQL.Add('("cap$maestro".ID_ESTADO = 1)');
          ParamByName('ID_IDENTIFICACION').AsInteger := DBtipo.KeyValue;
          ParamByName('ID_PERSONA').AsString := JVnumero.Text;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('No Existen Solicitudes Aprobadas para esta Persona',mtInformation,[mbok],0);
            JVnumero.SetFocus;
            Exit;
          end;
          PageControl1.Enabled := False;
        end;
end;
procedure TFrmConsultaSol.BitBtn1Click(Sender: TObject);
begin
        inicializar;
end;

procedure TFrmConsultaSol.BTbuscar1Click(Sender: TObject);
var     id_persona :string;
        id_identificacion:Integer;
begin
        with IBSQL1 do begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT "col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION');
          SQL.Add('from "col$solicitud" where ID_SOLICITUD = :ID_SOLICITUD');
          ParamByName('ID_SOLICITUD').AsString := Mradicado.Text;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
            Mradicado.SetFocus;
            Exit;
          end
          else begin
            id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
            id_persona := FieldByName('ID_PERSONA').AsString;
            fecha.Caption := FormatDateTime('yyyy/MM/dd',FieldByName('FECHA_RECEPCION').AsDateTime);
            Close;
          end;
        end;

        with IBGeneral do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT "col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".OBSERVACION,');
          SQL.Add('"col$solicitud".FECHA_ANALISIS,');
          SQL.Add('"col$solicitud".ID_ANALISIS,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA ||'' - ''|| "cap$maestrotitular".DIGITO_CUENTA as CUENTA,');
          SQL.Add('"gen$empleado".NOMBRE ||'' ''|| "gen$empleado".PRIMER_APELLIDO AS EMPLEADO,');
          SQL.Add('"gen$persona".NOMBRE ||'' ''||  "gen$persona".PRIMER_APELLIDO ||'' ''|| "gen$persona".SEGUNDO_APELLIDO AS ASOCIADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("col$solicitud".ID_PERSONA="cap$maestrotitular".ID_PERSONA)');
          SQL.Add('AND ("col$solicitud".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION)');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
          SQL.Add('LEFT JOIN "gen$empleado" ON ("col$solicitud".ID_ANALISIS="gen$empleado".ID_EMPLEADO)');          
          SQL.Add('WHERE ');
          SQL.Add('("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("col$solicitud".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 1) AND');
          SQL.Add('("cap$maestrotitular".TIPO_TITULAR = 1) AND');
          SQL.Add('("col$solicitud".ESTADO <> 6) AND');
          SQL.Add('("cap$maestro".ID_ESTADO = 1)');
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitudes no Encontradas',mtInformation,[mbok],0);
            Mradicado.SetFocus;
            Exit;
          end;
          PageControl1.Enabled := False;
        end;
end;

procedure TFrmConsultaSol.BitBtn3Click(Sender: TObject);
var     id_persona :string;
        id_identificacion:Integer;
begin
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
            Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA');
          SQL.Add('FROM');
          SQL.Add('"cap$maestrotitular"');
          SQL.Add('WHERE');
          SQL.Add('("cap$maestrotitular".NUMERO_CUENTA = :NUMERO_CUENTA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = :ID_TIPO)');
          ParamByName('NUMERO_CUENTA').AsString := JVcuenta.Text;
          ParamByName('ID_TIPO').AsInteger := DBtipocuenta.KeyValue;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('Captacion no Encontrada',mtInformation,[mbok],0);
            JVcuenta.SetFocus;
            Exit;
          end
          else begin
            id_persona := FieldByName('ID_PERSONA').AsString;
            id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
            Close;
          end;
        end;

        with IBGeneral do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT "col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".OBSERVACION,');
          SQL.Add('"col$solicitud".FECHA_ANALISIS,');
          SQL.Add('"col$solicitud".ID_ANALISIS,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA ||'' - ''|| "cap$maestrotitular".DIGITO_CUENTA as CUENTA,');
          SQL.Add('"gen$empleado".NOMBRE ||'' ''|| "gen$empleado".PRIMER_APELLIDO AS EMPLEADO,');
          SQL.Add('"gen$persona".NOMBRE ||'' ''||  "gen$persona".PRIMER_APELLIDO ||'' ''|| "gen$persona".SEGUNDO_APELLIDO AS ASOCIADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("col$solicitud".ID_PERSONA="cap$maestrotitular".ID_PERSONA)');
          SQL.Add('AND ("col$solicitud".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION)');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$solicitud".ID_ANALISIS="gen$empleado".ID_EMPLEADO)');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
          SQL.Add('WHERE ');
          SQL.Add('("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("col$solicitud".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 1) AND');
          SQL.Add('("cap$maestrotitular".TIPO_TITULAR = 1) AND');
          SQL.Add('("col$solicitud".ESTADO <> 6) AND');
          SQL.Add('("cap$maestro".ID_ESTADO = 1)');
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitudes no Encontradas',mtInformation,[mbok],0);
            JVcuenta.SetFocus;
          end;
          PageControl1.Enabled := False;
        end;
end;

procedure TFrmConsultaSol.TabSheet1Show(Sender: TObject);
begin
        Mradicado.SetFocus
end;

procedure TFrmConsultaSol.TabSheet2Show(Sender: TObject);
begin
        DBtipo.SetFocus
end;

procedure TFrmConsultaSol.TabSheet3Show(Sender: TObject);
begin
        DBtipocuenta.SetFocus;
end;

procedure TFrmConsultaSol.MradicadoEnter(Sender: TObject);
begin
        Mradicado.SelectAll
end;

function TFrmConsultaSol.Bsucar(vIdSolicitud: string): string;
begin
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$empleado".NOMBRE,');
          SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
          SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
          SQL.Add('"col$solicitudanalista".FECHAHORA');
          SQL.Add('FROM');
          SQL.Add('"gen$empleado"');
          SQL.Add('INNER JOIN "col$solicitudanalista" ON ("gen$empleado".ID_EMPLEADO="col$solicitudanalista".ID_EMPLEADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudanalista".ID_SOLICITUD = :ID_SOLICITUD) AND ');
          SQL.Add('("col$solicitudanalista".ES_VIGENTE = 1)');
          ParamByName('ID_SOLICITUD').AsString := vIdSolicitud;
          ExecQuery;
          Result := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString;
          Close;
        end;
end;

procedure TFrmConsultaSol.DBGrid2DblClick(Sender: TObject);
begin
     frmAgregarObservacionSol := TfrmAgregarObservacionSol.Create(Self);
     with frmAgregarObservacionSol do begin
       if IBObservaciones.RecordCount > 0 then begin
        EdFechaObservacion.Date  := IBObservaciones.FieldByName('FECHA_OBSERVACION').AsDateTime;
        Memo1.Text := IBObservaciones.FieldByName('OBSERVACION').AsString;
        ShowModal;
       end;
       Free;
     end;
end;

procedure TFrmConsultaSol.CmdAgregarClick(Sender: TObject);
begin
     frmAgregarObservacionSol := TfrmAgregarObservacionSol.Create(Self);
     with frmAgregarObservacionSol do begin
        if ShowModal = mrok then begin
           if IBSQL1.Transaction.InTransaction then
              IBSQL1.Transaction.Rollback;
           IBSQL1.Transaction.StartTransaction;
           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('INSERT INTO "col$controlsolicitud" values(');
           IBSQL1.SQL.Add(':ID_AGENCIA,:ID_SOLICITUD,:FECHA_OBSERVACION,');
           IBSQL1.SQL.Add(':HORA_OBSERVACION,:OBSERVACION,');
           IBSQL1.SQL.Add(':ID_USUARIO)');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := Agencia;
           if Cambio then
             IBSQL1.ParamByName('ID_SOLICITUD').AsString := CDsolicitud.fieldbyname('ID_SOLICITUD').AsString
           else
             IBSQL1.ParamByName('ID_SOLICITUD').AsString := IBGeneral.fieldbyname('ID_SOLICITUD').AsString;
           IBSQL1.ParamByName('FECHA_OBSERVACION').AsDate := FechaObs;
           IBSQL1.ParamByName('HORA_OBSERVACION').AsTime := fHoraActual;
           IBSQL1.ParamByName('OBSERVACION').AsString := Memo;
           IBSQL1.ParamByName('ID_USUARIO').AsString := DBAlias;
           try
             IBSQL1.ExecQuery;
             IBSQL1.Transaction.Commit;
           except
             MessageDlg('Error Al Agregar Observación',mtError,[mbcancel],0);
           end;
        end;
        Free;
     end;

        with IBObservaciones do begin
          if IBObservaciones.Transaction.InTransaction then
            IBObservaciones.Transaction.Commit;
          IBObservaciones.Transaction.StartTransaction;
          Close;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          if Cambio then
            ParamByName('ID_SOLICITUD').AsString := CDsolicitud.FieldByName('ID_SOLICITUD').AsString
          else
            ParamByName('ID_SOLICITUD').AsString := IBGeneral.FieldByName('ID_SOLICITUD').AsString;
          try
            Open;
          except
            MessageDlg('Error al buscar datos de la Solicitud',mtError,[mbcancel],0);
            Exit;
          end;
        end;
end;

procedure TFrmConsultaSol.IBGeneralOBSERVACIONGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TFrmConsultaSol.DBGrid1CellClick(Column: TColumn);
begin
      if Cambio then begin
        GroupBox4.Caption := 'Observaciones Solicitud No.:' + CDsolicitud.FieldByName('ID_SOLICITUD').AsString;
        with IBObservaciones do begin
          Close;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_SOLICITUD').AsString := CDsolicitud.FieldByName('ID_SOLICITUD').AsString;
          try
            Open;
            CmdAgregar.Enabled := True;
          except
            MessageDlg('Error al buscar datos de la Solicitud',mtError,[mbcancel],0);
            Exit;
          end;
        end;
      end
      else
      begin
        GroupBox4.Caption := 'Observaciones Solicitud No.:' + IBGeneral.FieldByName('ID_SOLICITUD').AsString;
        with IBObservaciones do begin
          Close;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_SOLICITUD').AsString := IBGeneral.FieldByName('ID_SOLICITUD').AsString;
          try
            Open;
            CmdAgregar.Enabled := True;
          except
            MessageDlg('Error al buscar datos de la Solicitud',mtError,[mbcancel],0);
            Exit;
          end;
        end;
      end; //fin de else
end;

procedure TFrmConsultaSol.IBObservacionesOBSERVACIONGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TFrmConsultaSol.IBGeneralVALOR_APROBADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := FormatCurr('#,##0.00',Sender.AsCurrency);
end;

procedure TFrmConsultaSol.Inicializar;
begin
        IBtipo.Open;
        IBtipo.Last;
        IBQuery1.Open;
        IBQuery1.Last;
        DBtipo.KeyValue := -1;
        JVnumero.Text := '';
        PageControl1.Enabled := True;
        PageControl1.ActivePageIndex := 0;
        fecha.Caption := '';
        Mradicado.Text := '';
        CDsolicitud.CancelUpdates;
        IBGeneral.Close;
        IBObservaciones.Close;
        JVcuenta.Text := '';
        DBtipocuenta.KeyValue := -1;
        Cambio := False;
        EdDiasIni.Value := 0;
        EdDiasFin.Value := 0;
        CmdProcesar.Enabled := True;
        DSGeneral.DataSet := IBGeneral;
        DBtipo.SetFocus;
end;

procedure TFrmConsultaSol.FormShow(Sender: TObject);
begin
        inicializar;
end;

procedure TFrmConsultaSol.CmdProcesarClick(Sender: TObject);
var
    Save_Cursor:TCursor;
    frmProgreso:TfrmProgreso;
    Total:Integer;
    FechaHoy,FechaAp:tdate;
    Dias:Integer;
begin
        if ( EdDiasIni.Value > EdDiasFin.Value) then
        begin
           MessageDlg('Verifique los dias de Aprobación',mtInformation,[mbcancel],0);
           Exit;
        end;

        Cambio := True;
        FechaHoy := fFechaActual;
        CmdProcesar.Enabled := False;
        Save_Cursor := Screen.Cursor;
        Screen.Cursor := crHourGlass;

       with IBSQL1 do begin
          Close;
          if Transaction.InTransaction then
            Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('COUNT(*) AS TOTAL');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("col$solicitud".ID_PERSONA="cap$maestrotitular".ID_PERSONA)');
          SQL.Add('AND ("col$solicitud".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION)');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$solicitud".ID_ANALISIS="gen$empleado".ID_EMPLEADO)');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
          SQL.Add('WHERE');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 1) AND');
          SQL.Add('("cap$maestrotitular".TIPO_TITULAR = 1) AND');
          SQL.Add('("col$solicitud".ESTADO = 4 or "col$solicitud".ESTADO = 9) AND');
          SQL.Add('("cap$maestro".ID_ESTADO = 1)');
          try
            ExecQuery;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error Buscando Registros!',mtError,[mbcancel],0);
            Exit;
          end;
        end;

        DSGeneral.DataSet := CDsolicitud;
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT "col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".OBSERVACION,');
          SQL.Add('"col$solicitud".FECHA_CONCEPTO,');
          SQL.Add('"col$solicitud".ID_ANALISIS,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO,');
          SQL.Add('"cap$maestrotitular".NUMERO_CUENTA ||'' - ''|| "cap$maestrotitular".DIGITO_CUENTA as CUENTA,');
          SQL.Add('"gen$empleado".NOMBRE ||'' ''|| "gen$empleado".PRIMER_APELLIDO AS EMPLEADO,');
          SQL.Add('"gen$persona".NOMBRE ||'' ''||  "gen$persona".PRIMER_APELLIDO ||'' ''|| "gen$persona".SEGUNDO_APELLIDO AS ASOCIADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO="col$estadosolicitud".ID_ESTADO)');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("col$solicitud".ID_PERSONA="cap$maestrotitular".ID_PERSONA)');
          SQL.Add('AND ("col$solicitud".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION)');
          SQL.Add('INNER JOIN "gen$empleado" ON ("col$solicitud".ID_ANALISIS="gen$empleado".ID_EMPLEADO)');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('INNER JOIN "cap$maestro" ON ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
          SQL.Add('WHERE ');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 1) AND');
          SQL.Add('("cap$maestrotitular".TIPO_TITULAR = 1) AND');
          SQL.Add('("col$solicitud".ESTADO = 4 or "col$solicitud".ESTADO = 9) AND');
          SQL.Add('("cap$maestro".ID_ESTADO = 1)');
          try
            ExecQuery;
            if RecordCount <= 0 then
            begin
               Screen.Cursor := Save_Cursor;
               Close;
               CmdProcesar.Enabled := True;
               EdDiasIni.SetFocus;
               MessageDlg('No se Encontraron Registros!',mtError,[mbcancel],0);
               Exit;
            end
            else
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Buscando Solicitudes';
              frmProgreso.Min := 0;
              frmProgreso.Max := Total;
              frmProgreso.Position := 0;
              frmProgreso.Ejecutar;
              while not Eof do begin
                frmProgreso.Position := IBSQL1.RecordCount;
                frmProgreso.InfoLabel := 'Solicitud No:' + FieldByName('ID_SOLICITUD').AsString;
                Application.ProcessMessages;
                FechaAp := FieldByName('FECHA_CONCEPTO').AsDateTime;
                Dias := DiasEntre(FechaAp,FechaHoy);
                if ((EdDiasIni.Value  <= Dias) and
                   (Dias <= EdDiasFin.Value ) ) then
                begin
                  CDsolicitud.Append;
                  CDsolicitud.FieldByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
                  CDsolicitud.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
                  CDsolicitud.FieldByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
                  CDsolicitud.FieldByName('ESTADO').AsInteger := FieldByName('ESTADO').AsInteger;
                  CDsolicitud.FieldByName('VALOR_APROBADO').AsCurrency := FieldByName('VALOR_APROBADO').AsCurrency;
                  CDsolicitud.FieldByName('OBSERVACION').AsString := FieldByName('OBSERVACION').AsString;
                  CDsolicitud.FieldByName('FECHA_ANALISIS').AsDateTime := FieldByName('FECHA_CONCEPTO').AsDate;
                  CDsolicitud.FieldByName('ID_ANALISIS').AsString := FieldByName('ID_ANALISIS').AsString;
                  CDsolicitud.FieldByName('DESCRIPCION_ESTADO').AsString := FieldByName('DESCRIPCION_ESTADO').AsString;
                  CDsolicitud.FieldByName('CUENTA').AsString := FieldByName('CUENTA').AsString;
                  CDsolicitud.FieldByName('EMPLEADO').AsString := FieldByName('EMPLEADO').AsString;
                  CDsolicitud.FieldByName('ASOCIADO').AsString := FieldByName('ASOCIADO').AsString;
                  CDsolicitud.Post;
                end;
                Next;
              end;
              frmProgreso.Cerrar;
              if CDsolicitud.RecordCount <= 0 then
               begin
                 MessageDlg('No se Encontraron solicitudes para este Rango',mtError,[mbcancel],0);
                 CmdProcesar.Enabled := True;
                 EdDiasIni.SetFocus;
                 Exit;
               end;
          end;
          except
            Screen.Cursor := Save_Cursor;
            Close;
            MessageDlg('Error al buscar Solicitudes, Consulte con Sistemas',mtError,[mbcancel],0);
            raise;
            Exit;
          end;
        PageControl1.Enabled := False;
        end;
        Screen.Cursor := Save_Cursor;
end;

procedure TFrmConsultaSol.CDsolicitudOBSERVACIONGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
        Text := Sender.AsString;
end;

procedure TFrmConsultaSol.Direcciones1Click(Sender: TObject);
begin
        if Cambio then begin
           frmDireccionesAsociado := TfrmDireccionesAsociado.Create(Self);
           frmDireccionesAsociado.Id := CDsolicitud.FieldByName('ID_IDENTIFICACION').AsInteger;
           frmDireccionesAsociado.Documento := CDsolicitud.FieldByName('ID_PERSONA').AsString;
           frmDireccionesAsociado.Nombre := CDsolicitud.FieldByName('ASOCIADO').AsString;
           frmDireccionesAsociado.ShowModal;
        end
        else
        begin
           frmDireccionesAsociado := TfrmDireccionesAsociado.Create(Self);
           frmDireccionesAsociado.Id := IBGeneral.FieldByName('ID_IDENTIFICACION').AsInteger;
           frmDireccionesAsociado.Documento := IBGeneral.FieldByName('ID_PERSONA').AsString;
           frmDireccionesAsociado.Nombre := IBGeneral.FieldByName('ASOCIADO').AsString;
           frmDireccionesAsociado.ShowModal;
        end;
end;

procedure TFrmConsultaSol.Observaciones1Click(Sender: TObject);
begin
        FrmDescObsrevacion := TFrmDescObsrevacion.Create(Self);
        FrmDescObsrevacion.Mobservacion.Text := IBGeneralOBSERVACION.Text;
        FrmDescObsrevacion.ShowModal;
end;

procedure TFrmConsultaSol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
end;

end.
