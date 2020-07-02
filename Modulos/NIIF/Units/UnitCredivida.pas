unit UnitCredivida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvStaticText, Mask, StdCtrls, Buttons, JvEdit, DBCtrls, ComCtrls,
  DB, IBDatabase, IBCustomDataSet, IBQuery, IBSQL, ExtCtrls, DateUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, sdXmlDocuments, StrUtils,Math,
  FR_Class, pr_Common, pr_TxClasses, DBClient;

type
  TFrmCredivida = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBtipo: TDBLookupComboBox;
    JVnumero: TJvEdit;
    BTbuscar: TBitBtn;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Mradicado: TMaskEdit;
    fecha: TJvStaticText;
    BTbuscar1: TBitBtn;
    TabSheet3: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    DBtipocuenta: TDBLookupComboBox;
    BitBtn3: TBitBtn;
    JVcuenta: TJvEdit;
    IBQuery1: TIBQuery;
    IBtipo: TIBQuery;
    DStipo: TDataSource;
    DataSource1: TDataSource;
    IBSQL1: TIBSQL;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    Panel1: TPanel;
    Label5: TLabel;
    JVnombres: TJvStaticText;
    JVdocumento: TStaticText;
    StaticText2: TStaticText;
    Gforma: TGroupBox;
    RBahorro: TRadioButton;
    RBcaja: TRadioButton;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    JVnumeroC: TJvStaticText;
    Label10: TLabel;
    JVahorro: TJvStaticText;
    Label11: TLabel;
    JVaportes: TJvStaticText;
    Gboton: TGroupBox;
    BTaceptar: TBitBtn;
    BTcancelar: TBitBtn;
    BTcerrar: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    frReport1: TfrReport;
    Report1: TprTxReport;
    IBAuxiliar: TIBQuery;
    IBAuxiliar1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Panel2: TPanel;
    ChCredivida: TCheckBox;
    CDbeneficiarios: TClientDataSet;
    CDbeneficiariosnombre: TStringField;
    CDbeneficiariosporciento: TCurrencyField;
    CDbeneficiariosparentesco: TIntegerField;
    Label12: TLabel;
    EDcert: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure BTcerrarClick(Sender: TObject);
    procedure BTbuscarClick(Sender: TObject);
    procedure DBtipoKeyPress(Sender: TObject; var Key: Char);
    procedure JVnumeroKeyPress(Sender: TObject; var Key: Char);
    procedure DBtipocuentaKeyPress(Sender: TObject; var Key: Char);
    procedure JVcuentaKeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBtipocuentaEnter(Sender: TObject);
    procedure DBtipoEnter(Sender: TObject);
    procedure BTbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure BTcancelarClick(Sender: TObject);
    procedure RBcajaKeyPress(Sender: TObject; var Key: Char);
    procedure RBahorroKeyPress(Sender: TObject; var Key: Char);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BTaceptarClick(Sender: TObject);
    procedure Report1InitDetailBandDataSet(Sender: TObject;
      DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
    procedure EDcertExit(Sender: TObject);
    procedure EDcertKeyPress(Sender: TObject; var Key: Char);
  private
  id_cuenta :Integer;
  saldo_ahorro :Currency;
  saldo_aportes :Currency;
  id_persona :string;
  id_identificacion :Integer;
  valor_credivida :Currency;
  vGravamen :Currency;
    digito_cuenta: integer;
    vdireccion: string;
    v_telefono: string;
    v_certificado: string;
    v_ciudad: string;
    vlugar_nacimiento: string;
    vfecha_nacimiento: string;
    vlugar_expedicion: string;
    v_empresa: string;
    v_cargo: string;
    control_boton: boolean;
    vid_comprobante: string;
    procedure saldo(vcuenta, vdigito: integer);
    procedure verifica_ahorros;
    Function credivida:Boolean;
    function con_equivida: string;
    procedure imprimir_reporte(cadena: string);
    procedure reporte(consecutivo: integer);
    procedure nota_contable(tipo: boolean);
    procedure auxiliar(Vcodigo, Vid_persona: string; Vcuenta,
      Vid_identificacion: integer; Vvalor: Currency;Vtipo:Boolean);
    procedure AutorizaCredivida;
    { Private declarations }
  public
     es_renovacion :Boolean;
    { Public declarations }
  end;

var
  FrmCredivida: TFrmCredivida;

implementation

uses UnitDmSolicitud, UnitGlobales, unitMain, UnitImpresion;

{$R *.dfm}

procedure TFrmCredivida.FormCreate(Sender: TObject);
begin
        IBQuery1.Open;
        IBQuery1.Last;
        IBtipo.Open;
        IBtipo.Last;
        DmSolicitud := TDmSolicitud.Create(Self);
        if IBTransaction2.InTransaction then
           IBTransaction2.Commit;
        IBTransaction2.StartTransaction;
        control_boton := True;
        PageControl1.ActivePageIndex := 0;
        
end;

procedure TFrmCredivida.BTcerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmCredivida.BTbuscarClick(Sender: TObject);
var     i :Integer;
begin
        CDbeneficiarios.CancelUpdates;
        id_persona := JVnumero.Text;
        id_identificacion := DBtipo.KeyValue;
          with IBSQL1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$persona"');
            SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
            ParamByName('ID_IDENTIFICACION').AsInteger :=id_identificacion;
            ParamByName('ID_PERSONA').AsString := id_persona;
            ExecQuery;
            if RecordCount = 0 then
            begin
              MessageDlg('Asociado no Encontrado',mtInformation,[mbok],0);
              BTcancelar.Click;
              Exit;
            end;
            JVnombres.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            JVdocumento.Caption := id_persona;
            vfecha_nacimiento := FormatDateTime('dd/mm/yyyy',FieldByName('FECHA_NACIMIENTO').AsDateTime);
            vlugar_nacimiento := FieldByName('LUGAR_NACIMIENTO').AsString;
            vlugar_expedicion := FieldByName('LUGAR_EXPEDICION').AsString;
            v_cargo := FieldByName('CARGO_ACTUAL').AsString;
            v_empresa := FieldByName('EMPRESA_LABORA').AsString;
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$direccion"');
            SQL.Add('where ID_PERSONA = :ID_PERSONA and');
            SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and');
            SQL.Add('ID_DIRECCION = 1');
            ParamByName('ID_PERSONA').AsString := id_persona;
            ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
            ExecQuery;
            v_telefono := FieldByName('TELEFONO1').AsString;
            vdireccion := FieldByName('DIRECCION').AsString;
            v_ciudad := FieldByName('MUNICIPIO').AsString;
            SQL.Clear;
            Close;
            SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
            ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;;
            ParamByName('ID_PERSONA').AsString := id_persona;
            ExecQuery;
            id_cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
            digito_cuenta := StrToInt(DigitoControl(2,FormatCurr('0000000',StrToFloat(IntToStr(id_cuenta)))));
            if id_cuenta = 0 then
            begin
              MessageDlg('El Asociado no se Encuentra Activo',mtInformation,[mbok],0);
              BTcancelar.Click;
              Exit;
            end;
            JVnumeroC.Caption := '20'+IntToStr(Agencia)+'-'+Format('%.6d',[id_cuenta]);
            Close;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM');
            SQL.Add(' "gen$beneficiario"');
            SQL.Add('WHERE');
            SQL.Add('("gen$beneficiario".ID_PERSONA = :ID_PERSONA) AND ');
            SQL.Add('("gen$beneficiario".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
            SQL.Add('("gen$beneficiario".AUXILIO = 0)');
            ParamByName('ID_PERSONA').AsString := id_persona;
            ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
            ExecQuery;
            while not Eof do
            begin
                CDbeneficiarios.Append;
                CDbeneficiarios.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                CDbeneficiarios.FieldValues['porciento'] := FieldByName('PORCENTAJE').AsCurrency;
                CDbeneficiarios.FieldValues['parentesco'] := FieldByName('ID_PARENTESCO').AsString;
                CDbeneficiarios.Post;
                Next;
            end;
          end;
          Gforma.Enabled := True;
          BTaceptar.Enabled := True;
          saldo(id_cuenta,digito_cuenta);
          JVaportes.Caption := '$' + FormatCurr('##,#0.00',saldo_aportes);
          JVahorro.Caption := '$' + FormatCurr('##,#0.00',saldo_ahorro);
          verifica_ahorros;
          PageControl1.Enabled := False;
          if es_renovacion then
          begin
             MessageDlg('Favor Digite el Número del Credivida, para poder realizar la Renovación',mtInformation,[mbok],0);
             EDcert.SetFocus;
          end;
end;
procedure TFrmCredivida.saldo(vcuenta, vdigito: integer);
var     total_movimiento :Currency;
        i :Integer;
begin
          with IBSQL1 do
          begin
            for i := 1 to 2 do
            begin
              total_movimiento := 0;
              Close;
              SQL.Clear;
              SQL.Add('SELECT * FROM SALDO_DISPONIBLE(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
              ParamByName('AG').AsInteger := Agencia;
              ParamByName('TP').AsInteger := i;
              ParamByName('CTA').AsInteger := vcuenta;
              ParamByName('DGT').AsInteger := vdigito;
              ParamByName('ANO').AsInteger := YearOf(Date);
              ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Date),01,01);
              ParamByName('FECHA2').AsDate := EncodeDate(YearOf(Date),12,31);
              ExecQuery;
              total_movimiento := FieldByName('SALDO_DISPONIBLE').AsCurrency;
              if i = 2 then
                 saldo_ahorro := total_movimiento;
           end;
          end;

end;

procedure TFrmCredivida.DBtipoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmCredivida.JVnumeroKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmCredivida.DBtipocuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmCredivida.JVcuentaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmCredivida.TabSheet2Show(Sender: TObject);
begin
        DBtipo.SetFocus;
        DBtipo.KeyValue := 3;
end;

procedure TFrmCredivida.TabSheet3Show(Sender: TObject);
begin
        DBtipocuenta.KeyValue := 1;
        DBtipocuenta.SetFocus
end;

procedure TFrmCredivida.BitBtn3Click(Sender: TObject);
begin
        id_cuenta := StrToInt(JVcuenta.Text);
        with IBSQL1 do
        begin
          Close;
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
          id_persona := FieldByName('ID_PERSONA').AsString;
          id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          Close;
          SQL.Clear;
          SQL.Clear;
          SQL.Add('select * from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_IDENTIFICACION').AsInteger :=id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          JVnombres.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          JVdocumento.Caption := id_persona;
          vfecha_nacimiento := FormatDateTime('dd/mm/yyyy',FieldByName('FECHA_NACIMIENTO').AsDateTime);
          vlugar_nacimiento := FieldByName('LUGAR_NACIMIENTO').AsString;
          vlugar_expedicion := FieldByName('LUGAR_EXPEDICION').AsString;
          v_cargo := FieldByName('CARGO_ACTUAL').AsString;
          v_empresa := FieldByName('EMPRESA_LABORA').AsString;
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$direccion"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and');
          SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and');
          SQL.Add('ID_DIRECCION = 1');
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ExecQuery;
          v_telefono := FieldByName('TELEFONO1').AsString;
          vdireccion := FieldByName('DIRECCION').AsString;
          v_ciudad := FieldByName('MUNICIPIO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          id_cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
          digito_cuenta := FieldByName('DIGITO_CUENTA').AsInteger;
          if id_cuenta = 0 then
          begin
            MessageDlg('El Asociado no se Encuentra Activo',mtInformation,[mbok],0);
            BTcancelar.Click;
            Exit;
          end;
          JVnumeroC.Caption := '20'+IntToStr(Agencia)+'-'+Format('%.6d',[id_cuenta]);
        end;
          Gforma.Enabled := True;
          BTaceptar.Enabled := True;
          saldo(id_cuenta,digito_cuenta);
          JVaportes.Caption := '$' + FormatCurr('##,#0.00',saldo_aportes);
          JVahorro.Caption := '$' + FormatCurr('##,#0.00',saldo_ahorro);
          verifica_ahorros;
          PageControl1.Enabled := False;
end;

procedure TFrmCredivida.DBtipocuentaEnter(Sender: TObject);
begin
        DBtipocuenta.DropDown
end;

procedure TFrmCredivida.DBtipoEnter(Sender: TObject);
begin
        DBtipo.DropDown
end;

procedure TFrmCredivida.BTbuscarKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmCredivida.BTcancelarClick(Sender: TObject);
begin
        if not control_boton then
        begin
          BTcancelar.Caption := '&Cancelar';
          BTaceptar.Caption := '&Aceptar';
          control_boton := True;
        end;
        PageControl1.Enabled := True;
        DBtipocuenta.KeyValue := 1;
        ChCredivida.Checked := False;
        DBtipo.KeyValue := 3;
        JVnumero.Text := '';
        JVcuenta.Text := '';
        JVnumeroC.Caption := '';
        JVahorro.Caption := '';
        JVaportes.Caption := '';
        JVnombres.Caption := '';
        JVdocumento.Caption := '';
        RBahorro.Enabled := True;
        RBahorro.Checked := False;
        RBcaja.Checked := False;
        id_cuenta := 0;
        saldo_ahorro := 0;
        saldo_aportes := 0;
        valor_credivida := 0;
        PageControl1.ActivePageIndex := 0;
        DBtipo.SetFocus;
        Gforma.Enabled := False;
        BTaceptar.Enabled := False;

        if IBTransaction2.InTransaction then
           IBTransaction2.Commit;
        IBTransaction2.StartTransaction;
end;

procedure TFrmCredivida.verifica_ahorros;
begin
        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT VALOR_MINIMO FROM "gen$minimos" WHERE  (ID_MINIMO = 5)');
          ExecQuery;
          valor_credivida := FieldByName('VALOR_MINIMO').AsCurrency;
          Close;
          SQL.Clear;
          SQL.Add('SELECT VALOR_MINIMO FROM "gen$minimos" WHERE  (ID_MINIMO = 12)');
          ExecQuery;
          vGravamen := FieldByName('VALOR_MINIMO').AsCurrency;
          Close;
        end;
        if valor_credivida > saldo_ahorro then
        begin
           RBahorro.Enabled := False;
           RBcaja.Checked := True;
           RBcaja.SetFocus;
        end
        else
        begin
           RBahorro.Checked := True;
           RBahorro.SetFocus;
        end;
end;

procedure TFrmCredivida.RBcajaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmCredivida.RBahorroKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

function TFrmCredivida.credivida:Boolean;
begin
        Result := True;
        BuscaPoliza;
        with IBQuery2 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          if es_renovacion then // en el caso de la renovacinn de Credividas
          begin
             v_certificado := EDcert.Text;
             Close;
             SQL.Clear;
             SQL.Add('select FECHA from "col$datocredivida" where CERTIFICADO = :CERTIFICADO');
             ParamByName('CERTIFICADO').AsString := v_Certificado;
             Open;
             if RecordCount = 0 then
             begin
               ShowMessage('Certificado No existe, Favor Revise');
               Result := False;
             end
             else if FieldByName('FECHA').AsDateTime > fFechaActual then
             begin
                ShowMessage('No ha Vencido el Credivida, no se puede Renovar');
                Result := False
             end
             else
             begin
                close;
                SQL.Clear;
                SQl.Add('update "col$datocredivida" set FECHA = :FECHA where CERTIFICADO = :CERTIFICADO');
                ParamByName('FECHA').AsDate := FFechaActual + 365;
                ParamByName('CERTIFICADO').AsString := v_Certificado;
                ExecSQl;
             end;
          end
          else
          begin
             v_certificado := con_equivida;
             SQL.Clear;
             try
               SQl.Add('INSERT INTO "col$datocredivida" VALUES (:ID_PERSONA,:CERTIFICADO,:FECHA,:FECHACAPTURA)');
               ParamByname('ID_PERSONA').AsString := Id_Persona;
               ParamByName('CERTIFICADO').AsString := v_Certificado;
               ParamByname('FECHA').AsDate := fFechaActual + 365;
               ParamByName('FECHACAPTURA').AsDate := fFechaActual;
               ExecSQL;
               Transaction.Commit;
             except
               Result := False;
             end;
          end;
        end;

end;

function TFrmCredivida.con_equivida: string;
var    consecutivo :Integer;
begin
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select CONSECUTIVO as CONSECUTIVO from');
          SQL.Add('"gen$con_seguro"');
          ExecQuery;
          consecutivo := FieldByName('CONSECUTIVO').AsInteger + 1;
          Close;
          SQL.Clear;
          SQL.Add('update "gen$con_seguro" set CONSECUTIVO = :CONSECUTIVO WHERE ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('CONSECUTIVO').AsInteger := consecutivo;
          ExecQuery;
          Close;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;
        Result := IntToStr(Agencia)+FormatCurr('000000',consecutivo);

end;

procedure TFrmCredivida.imprimir_reporte(cadena: string);
var
   _tFrfpict : TfrPictureView;
   _tFrfpict1 : TfrPictureView;
   _tFrfpict2 : TfrPictureView;
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        _tFrfpict := TfrPictureView(frReport1.FindObject('picture2'));
        _tFrfpict1 := TfrPictureView(frReport1.FindObject('picture6'));
        _tFrfpict2 := TfrPictureView(frReport1.FindObject('picture10'));
        if Assigned(_tFrfPict) then
        begin
           _tFrfPict.Picture.LoadFromFile(ExtractFilePath(Application.Name) + 'logo\logo.jpg');
           _tFrfPict1.Picture.LoadFromFile(ExtractFilePath(Application.Name) + 'logo\logo.jpg');
           _tFrfPict2.Picture.LoadFromFile(ExtractFilePath(Application.Name) + 'logo\logo.jpg');
        end;
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmCredivida.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'poliza' then
           ParValue := vPolizaCredivida;
        if ParName = 'descripcion' then
          ParValue := 'CERTIFICADO DE SEGURO';
          if ParName = 'nombre' then
             ParValue := JVnombres.Caption;
          if ParName = 'certificado' then
             ParValue := v_certificado;
          if ParName = 'documento' then
             ParValue := id_persona;
          if ParName = 'lugar_exp' then
             ParValue := vlugar_expedicion;
          if ParName = 'nacimiento' then
             ParValue := vlugar_nacimiento;
          if ParName = 'fecha_nacimiento' then
             ParValue := vfecha_nacimiento;
          if ParName = 'empresa' then
             ParValue := v_empresa;
          if ParName = 'cargo' then
             ParValue := v_cargo;
          if ParName = 'direccion' then
             ParValue := vdireccion;
          if ParName = 'ciudad' then
             ParValue := v_ciudad;
          if ParName = 'telefono' then
             ParValue := v_telefono;
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos"');
          SQL.Add('where ID_MINIMO = 9');
          ExecQuery;
          if ParName = 'valor_poliza' then
             ParValue := FieldByName('VALOR_MINIMO').AsCurrency;
          if ParName = 'poliza_total' then
             ParValue := FieldByName('VALOR_MINIMO').AsCurrency * 12;
          Close;
          SQL.Clear;
          SQL.Add('select * from "gen$agencia"');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ExecQuery;
          if ParName = 'ciudad_exp' then
             ParValue := FieldByName('DESCRIPCION_AGENCIA').AsString;
          Close;
          if ParName = 'mes' then
             ParValue := UpperCase(FormatDateTime('mmmm',Date));
        end;
         with CDbeneficiarios do
          begin
            First;
            if RecordCount = 0 then
            begin
               if ParName = 'nom1' then
               ParValue := 'LOS DE LEY';
               if ParName = 'por1' then
                 ParValue := 100;
            end;
           while not Eof do
           begin
            //primero
            if RecNo = 1 then
            begin
               if ParName = 'nom1' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por1' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            //segundo
            if RecNo = 2 then
            begin
               if ParName = 'nom2' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por2' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            //tercero
            if RecNo = 3 then
            begin
               if ParName = 'nom3' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por3' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            //cuarto
            if RecNo = 4 then
            begin
               if ParName = 'nom4' then
               ParValue := FieldByName('nombre').AsString;
               if ParName = 'por4' then
                 ParValue := FieldByName('porciento').AsInteger;
            end;
            Next;
            end;
          end;

end;

procedure TFrmCredivida.BTaceptarClick(Sender: TObject);
begin
//        reporte(StrToInt(InputBox('','','')));
//        Exit;
        if control_boton then
        if MessageDlg('Esta Seguro de Aplicar el Seguro?',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        if control_boton then
        begin
          if credivida then
          begin
            BTcancelar.Caption := '&Nuevo';
            BTaceptar.Caption := '&Reporte';
            control_boton := false;
            Gforma.Enabled := False;
            nota_contable(RBahorro.Checked);
            reporte(StrToInt(vid_comprobante));
            imprimir_reporte(frmMain.ruta1 + '\reporte\RepEquivida.frf');
            if ChCredivida.Checked then
            begin
              try
                AutorizaCredivida;
              except
                MessageDlg('Error Al Registrar los Datos del Descuento Automatico' + #13 + 'Favor Informar a Sistemas',mtError,[mbok],0);
              end;// fin del try
            end;
          end
          else
          begin
            MessageDlg('Error al intentar Crear o Renovar el Credivida, Favor Verifique la fecha y/o número de certificado',mtWarning,[mbok],0);
            Exit;
          end;
        end
        else
        begin
          reporte(StrToInt(vid_comprobante));
          imprimir_reporte(frmMain.ruta1 + '\reporte\RepEquivida.frf');
        end;
        PageControl1.Enabled := False;
end;

procedure TFrmCredivida.reporte(consecutivo: integer);
begin
        with IBAuxiliar do
        begin
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_COMPROBANTE').AsInteger := consecutivo;
         Open;
        end;
        Report1.Variables.ByName['EMPRESA'].AsString := Empresa;
        Report1.Variables.ByName['NIT'].AsString := Nit;
        if Report1.PrepareReport then
           Report1.PreviewPreparedReport(True);

end;

procedure TFrmCredivida.nota_contable(tipo: boolean);
var    Consecutivo :Integer;
       Concepto :string;
       Vtotal :Currency;
begin
      with DmSolicitud.IBSolicitud1 do
      begin
        if Transaction.InTransaction then
           Transaction.Commit;
        Transaction.StartTransaction;
      end;
      if tipo then
      begin
        Concepto := 'Retiro de Ahorros Para Credivida Cert. No ' + v_certificado ;
        Vtotal := SimpleRoundTo(valor_credivida + ((valor_credivida /1000) * vGravamen),0);
      end
      else
      begin
        Concepto := 'Pago del Seguro Credivida Cert. No ' + v_certificado;
        Vtotal := valor_credivida;
      end;
      try
        Consecutivo := ObtenerConsecutivo(IBSQL1,4);
        vid_comprobante := IntToStr(consecutivo);
        with DmSolicitud.IBSolicitud1 do
        begin
          sql.Clear;
          sql.Add('insert into "con$comprobante" ("con$comprobante"."ID_COMPROBANTE",');
          sql.Add('"con$comprobante"."FECHADIA", "con$comprobante"."TIPO_COMPROBANTE",');
          sql.Add('"con$comprobante"."ID_AGENCIA", "con$comprobante"."DESCRIPCION",');
          sql.Add('"con$comprobante"."TOTAL_DEBITO", "con$comprobante"."TOTAL_CREDITO",');
          sql.Add('"con$comprobante"."ESTADO", "con$comprobante"."IMPRESO",');
          sql.Add('"con$comprobante"."ANULACION","con$comprobante".ID_EMPLEADO)');
          sql.Add('values (');
          sql.Add(':"ID_COMPROBANTE", :"FECHADIA", :"TIPO_COMPROBANTE",');
          sql.Add(':"ID_AGENCIA", :"DESCRIPCION", :"TOTAL_DEBITO",');
          sql.Add(':"TOTAL_CREDITO", :"ESTADO", :"IMPRESO", :"ANULACION",:ID_EMPLEADO)');
          ParamByName('ID_COMPROBANTE').AsString:= vid_comprobante;
          ParamByname('FECHADIA').AsDate := fFechaActual;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('TIPO_COMPROBANTE').AsInteger := 1;
          ParamByName('DESCRIPCION').AsBlob := Trim(Concepto);
          ParamByName('TOTAL_DEBITO').AsCurrency  := Vtotal;
          ParamByName('TOTAL_CREDITO').AsCurrency  := Vtotal;
          ParamByName('ESTADO').AsString  := 'O';
          ParamByname('ANULACION').asstring := '';
          ParamByName('IMPRESO').AsInteger  := Ord(false);
          ParamByName('ID_EMPLEADO').AsString := DBAlias;
          ExecSQL;
       end;
         if tipo then
         begin
            auxiliar('249595080000000000','',0,0,valor_credivida,False);
            auxiliar('210505010000000000',id_persona,id_cuenta,id_identificacion,valor_credivida,True);
            auxiliar('244205000000000000','',0,0,((valor_credivida/1000)*4),False);
            auxiliar('531520000000000000','',0,0,((valor_credivida/1000)*4),True);
            with DmSolicitud.IBSolicitud1 do
            begin
             SQL.Clear;
             SQL.Add('insert into "cap$extracto" values(');
             SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
             SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
             SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
             SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
             ParamByName('NUMERO_CUENTA').AsInteger := id_cuenta;
             ParamByName('DIGITO_CUENTA').AsInteger := digito_cuenta;
             ParamByName('FECHA_MOVIMIENTO').AsDateTime := fFechaActual;
             ParamByName('HORA_MOVIMIENTO').AsTime := Time;
             ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 6;
             ParamByName('DOCUMENTO_MOVIMIENTO').AsString := vid_comprobante;
             ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Desc. Seg. Credivida Cert No' + v_certificado;
             ParamByName('VALOR_DEBITO').AsCurrency := 0;
             ParamByName('VALOR_CREDITO').AsCurrency := valor_credivida;
             ExecSQL;
            end;
         end
         else
         begin
            auxiliar('249595080000000000','',0,0,valor_credivida,False);
            auxiliar('110505000000000000','',0,0,valor_credivida,True);
         end;
         DmSolicitud.IBSolicitud1.Transaction.Commit;
      except
      begin
        MessageDlg('Error Creando Nota Contable',mtError,[mbok],0);
        DmSolicitud.IBSolicitud1.Transaction.Rollback;
      end;
      end;

end;

procedure TFrmCredivida.auxiliar(Vcodigo, Vid_persona: string; Vcuenta,Vid_identificacion: integer; Vvalor: Currency;Vtipo:Boolean);
begin
            with DmSolicitud.IBSolicitud1 do
            begin
              SQL.Clear;
              SQL.Add('insert into "con$auxiliar" values (');
              SQL.Add(':"ID_COMPROBANTE",:"ID_AGENCIA",:"FECHA",:"CODIGO",:"DEBITO",');
              SQL.Add(':"CREDITO",:"ID_CUENTA",:"ID_COLOCACION",:"ID_IDENTIFICACION",');
              SQL.Add(':"ID_PERSONA",:"MONTO_RETENCION",:"TASA_RETENCION",:"ESTADOAUX")');
              ParamByName('ID_COMPROBANTE').AsString := vid_comprobante;
              ParamByName('ID_AGENCIA').AsInteger:= Agencia;
              ParamByName('FECHA').AsDate := fFechaActual;
              ParamByName('CODIGO').AsString := Vcodigo;
              if Vtipo then
              begin
                 ParamByName('DEBITO').AsCurrency := SimpleRoundTo(Vvalor,0);
                 ParamByName('CREDITO').AsCurrency := 0;
              end
              else
              begin
                 ParamByName('CREDITO').AsCurrency := SimpleRoundTo(Vvalor,0);
                 ParamByName('DEBITO').AsCurrency := 0;
              end;
              if Vcuenta = 0 then
                 ParamByName('ID_CUENTA').Clear
              else
                 ParamByName('ID_CUENTA').AsInteger := Vcuenta;
              ParamByName('ID_COLOCACION').Clear;
              ParamByName('ID_IDENTIFICACION').AsInteger := Vid_identificacion;
              ParamByName('ID_PERSONA').AsString := Vid_persona;
              ParamByName('MONTO_RETENCION').AsCurrency := 0;
              ParamByName('TASA_RETENCION').AsFloat := 0;
              ParamByName('ESTADOAUX').AsString := 'O';
              ExecSQL;
            end;

end;

procedure TFrmCredivida.Report1InitDetailBandDataSet(Sender: TObject;
  DetailBand: TprBand; DataSet: TObject; const DataSetName: String);
begin
        if DataSetName = 'IBAuxiliar1' then begin
          with IBAuxiliar1 do begin
            Close;
            ParamByName('ID_IDENTIFICACION').AsInteger := IBAuxiliar.FieldByName('ID_IDENTIFICACION').AsInteger;
            ParamByName('ID_PERSONA').AsString := IBAuxiliar.FieldByName('ID_PERSONA').AsString;
            try
             Open;
            except
             raise;
            end;
          end;
        end;
end;

procedure TFrmCredivida.AutorizaCredivida;
var     ano :string;
begin
        ano := IntToStr(YearOf(fFechaActual)+ 1);
        with IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('insert into "col$credivida" (NUMERO_CUENTA,DG_CUENTA,FECHA_VENCIMIENTO,APLICADO,DESCONTADO,IMPRESO)');
          SQL.Add('values (:NUMERO_CUENTA,:DG_CUENTA,:FECHA_VENCIMIENTO,0,0,0)');
          ParamByName('NUMERO_CUENTA').AsInteger := id_cuenta;
          ParamByName('DG_CUENTA').AsInteger := digito_cuenta;
          ParamByName('FECHA_VENCIMIENTO').AsDate := StrToDate(FormatDateTime(ano + '/mm/dd',fFechaActual));
          ExecQuery;
          Transaction.Commit;
        end;

end;

procedure TFrmCredivida.EDcertExit(Sender: TObject);
begin
        if StrLen(PChar(EDcert.Text)) < 7 then
        begin
          MessageDlg('Favor Verifique el Número del Credivida no es Correcto',mtwarning,[mbok],0);
          EDcert.SetFocus;
        end;
end;

procedure TFrmCredivida.EDcertKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
          BTaceptar.SetFocus
end;

end.
