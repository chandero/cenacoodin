unit UnitActualizaSol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvEdit, JvStaticText, JvLabel, JvTypedEdit,
  DBCtrls, JvPanel, Buttons, IBDatabase, DB, IBCustomDataSet, IBQuery, JclSysutils,
  UnitDmGeneral;

type
  TFrmActualizaSol = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    EDradicado: TJvEdit;
    EDsolicitante: TJvEdit;
    Valor: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    EDinversion: TJvEdit;
    EDgarantia: TJvEdit;
    JvLabel1: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    EDplazo: TJvEdit;
    EDclasificacion: TJvEdit;
    EDlinea: TJvEdit;
    EDvalor: TJvCurrencyEdit;
    Panel3: TPanel;
    Label4: TLabel;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    EDvalor_a: TJvCurrencyEdit;
    DBinversion: TDBLookupComboBox;
    DBgarantia: TDBLookupComboBox;
    DBclasificacion: TDBLookupComboBox;
    DBlinea: TDBLookupComboBox;
    JvPanel1: TJvPanel;
    BitBtn1: TBitBtn;
    BTcancelar: TBitBtn;
    Panel4: TPanel;
    BitBtn4: TBitBtn;
    DSinversion: TDataSource;
    DSgarantia: TDataSource;
    DSclasificacion: TDataSource;
    DSlinea: TDataSource;
    IBinversion: TIBQuery;
    IBgarantia: TIBQuery;
    IBlinea: TIBQuery;
    IBclasificacion: TIBQuery;
    IBTransaction1: TIBTransaction;
    JVplazo: TJvEdit;
    Scerrar: TSpeedButton;
    Chcredivida: TCheckBox;
    Chcredivida_old: TCheckBox;
    procedure EDradicadoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EDradicadoKeyPress(Sender: TObject; var Key: Char);
    procedure EDvalor_aKeyPress(Sender: TObject; var Key: Char);
    procedure DBinversionKeyPress(Sender: TObject; var Key: Char);
    procedure DBgarantiaKeyPress(Sender: TObject; var Key: Char);
    procedure JVplazoKeyPress(Sender: TObject; var Key: Char);
    procedure DBclasificacionKeyPress(Sender: TObject; var Key: Char);
    procedure DBlineaKeyPress(Sender: TObject; var Key: Char);
    procedure JVplazoExit(Sender: TObject);
    procedure EDvalor_aExit(Sender: TObject);
    procedure BTcancelarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ScerrarClick(Sender: TObject);
    procedure DBlineaExit(Sender: TObject);
    procedure ChcredividaClick(Sender: TObject);
  private
  id_garantia :Integer;
  id_clasificacion :Integer;
  id_inversion :Integer;
  id_linea :Integer;
  plazo_sol :Integer;
  valor_sol :Currency;
    vS_Vida: string;
    vS_Vida_old: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmActualizaSol: TFrmActualizaSol;
  dmGeneral: TdmGeneral;

implementation

uses UnitDmSolicitud, UnitGlobales;

{$R *.dfm}

procedure TFrmActualizaSol.EDradicadoExit(Sender: TObject);
var    id_persona :string;
       id_identificacion :Integer;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;

          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".S_VIDA,');
          SQL.Add('"col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".GARANTIA,');
          SQL.Add('"col$solicitud".LINEA,');
          SQL.Add('"col$solicitud".PLAZO_APROBADO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".INVERSION,');
          SQL.Add('"col$solicitud".CLASIFICACION,');
          SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
          SQL.Add('"col$inversion".DESCRIPCION_INVERSION,');
          SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA = "col$garantia".ID_GARANTIA)');
          SQL.Add('INNER JOIN "col$lineas" ON ("col$solicitud".LINEA = "col$lineas".ID_LINEA)');
          SQL.Add('INNER JOIN "col$inversion" ON ("col$solicitud".INVERSION = "col$inversion".ID_INVERSION)');
          SQL.Add('INNER JOIN "col$clasificacion" ON ("col$solicitud".CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('(OFICINA = :ID_AGENCIA) AND');
          SQL.Add('("col$solicitud".ESTADO = 4)');
          ParamByName('ID_SOLICITUD').AsString := EDradicado.Text;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          if RecordCount <> 0 then
          begin
            EDplazo.Text := FieldByName('PLAZO_APROBADO').AsString;
            EDinversion.Text := FieldByName('DESCRIPCION_INVERSION').AsString;
            EDclasificacion.Text := FieldByName('DESCRIPCION_CLASIFICACION').AsString;
            EDlinea.Text := FieldByName('DESCRIPCION_LINEA').AsString;
            EDgarantia.Text := FieldByName('DESCRIPCION_GARANTIA').AsString;
            EDvalor.Value := FieldByName('VALOR_APROBADO').AsCurrency;
            DBinversion.KeyValue := FieldByName('INVERSION').AsInteger;
            DBclasificacion.KeyValue := FieldByName('CLASIFICACION').AsInteger;
            DBlinea.KeyValue := FieldByName('LINEA').AsInteger;
            DBgarantia.KeyValue := FieldByName('GARANTIA').AsInteger;
            JVplazo.Text := FieldByName('PLAZO_APROBADO').AsString;
            EDvalor_a.Value := FieldByName('VALOR_APROBADO').AsCurrency;
            Chcredivida_old.Checked := IntToBool(FieldByName('S_VIDA').AsInteger);
            if Chcredivida_old.Checked then
               vS_Vida_old := 'S'
            else
               vS_Vida_old := 'N';
            // valores a evaluar
            id_inversion := FieldByName('INVERSION').AsInteger;
            id_clasificacion := FieldByName('CLASIFICACION').AsInteger;
            id_linea := FieldByName('LINEA').AsInteger;
            id_garantia := FieldByName('GARANTIA').AsInteger;
            plazo_sol := FieldByName('PLAZO_APROBADO').AsInteger;
            valor_sol := FieldByName('VALOR_APROBADO').AsCurrency;
            Chcredivida.Checked := IntToBool(FieldByName('S_VIDA').AsInteger);
            // *******
            id_persona := FieldByName('ID_PERSONA').AsString;
            id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          end
          else
          begin
            EDradicado.SetFocus;
            Exit;
          end;
            SQL.Clear;
            SQL.Add('select NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO from "gen$persona"');
            SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
            ParamByName('ID_PERSONA').AsString := id_persona;
            ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
            Open;
            EDsolicitante.Text := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' +FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
        end;
        IBinversion.Open;
        IBinversion.Last;
        IBlinea.Open;
        IBlinea.Last;
        IBclasificacion.Open;
        IBclasificacion.Last;
        IBgarantia.Open;
        IBgarantia.Last;

end;

procedure TFrmActualizaSol.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBinversion.Database := dmGeneral.IBDatabase1;
        IBgarantia.Database := dmGeneral.IBDatabase1;
        IBlinea.Database := dmGeneral.IBDatabase1;
        IBclasificacion.Database := dmGeneral.IBDatabase1;
        IBinversion.Transaction := dmGeneral.IBTransaction1;
        IBgarantia.Transaction := dmGeneral.IBTransaction1;
        IBlinea.Transaction := dmGeneral.IBTransaction1;

        DmSolicitud := TDmSolicitud.Create(self);
end;

procedure TFrmActualizaSol.EDradicadoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActualizaSol.EDvalor_aKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActualizaSol.DBinversionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActualizaSol.DBgarantiaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActualizaSol.JVplazoKeyPress(Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Self,Key);
        EnterTabs(Key,Self)
end;

procedure TFrmActualizaSol.DBclasificacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActualizaSol.DBlineaKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmActualizaSol.JVplazoExit(Sender: TObject);
begin
        if StrToInt(JVplazo.Text) > StrToInt(EDplazo.Text) then
        begin
           MessageDlg('El plazo no debe ser Mayor al Plazo Estipulado',mtWarning,[mbok],0);
           JVplazo.SetFocus;
        end;
end;

procedure TFrmActualizaSol.EDvalor_aExit(Sender: TObject);
begin
        if EDvalor_a.Value > EDvalor.Value then
        begin
          MessageDlg('El valor no debe ser Mayor al Valor Estipulado',mtwarning,[mbok],0);
          EDvalor_a.SetFocus;
        end;
end;

procedure TFrmActualizaSol.BTcancelarClick(Sender: TObject);
begin
        Panel1.Enabled := True;
        EDinversion.Text := '';
        EDsolicitante.Text := '';
        EDgarantia.Text := '';
        EDplazo.Text := '';
        EDlinea.Text := '';
        EDclasificacion.Text := '';
        EDvalor.Value := 0;
        EDradicado.Text := '';
        JVplazo.Text := '';
        EDvalor_a.Value := 0;
        DBgarantia.KeyValue := -1;
        DBinversion.KeyValue := -1;
        DBlinea.KeyValue := -1;
        DBclasificacion.KeyValue := -1;
        EDradicado.SetFocus;
        Chcredivida.Checked := False;
        Chcredivida_old.Checked := False;
end;

procedure TFrmActualizaSol.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmActualizaSol.BitBtn1Click(Sender: TObject);
var    fecha :TDate;
       hora :TTime;
       v_linea :Boolean;
       v_clasificacion :Boolean;
       v_inversion :Boolean;
       v_plazo :Boolean;
       v_garantia :Boolean;
       v_valor :Boolean;
       v_credivida :Boolean;
begin
        fecha := Date;
        hora := Now;
//      verificar si existen cambios
        v_valor := False;
        v_linea := False;
        v_clasificacion := False;
        v_inversion := False;
        v_plazo := False;
        v_garantia := False;
        v_credivida := False;
        if valor_sol <> EDvalor_a.Value then
           v_valor := True;
        if id_linea <> DBlinea.KeyValue then
           v_linea := True;
        if id_clasificacion <> DBclasificacion.KeyValue then
           v_clasificacion := True;
        if id_inversion <> DBinversion.KeyValue then
           v_inversion := True;
        if plazo_sol <> StrToInt(JVplazo.Text) then
           v_plazo := True;
        if id_garantia <> DBgarantia.KeyValue then
           v_garantia := True;
        if Chcredivida_old.Checked <> Chcredivida.Checked then
           v_credivida := True;
// fin verifica Cambios
        if (v_valor = false) and (v_plazo = false) and (v_garantia = false) and (v_inversion = False) and (v_clasificacion = false) and (v_linea = false) and (v_credivida = False) then
        begin
          MessageDlg('No Existe Ningun Cambio por Registrar',mtInformation,[mbok],0);
          Exit;
        end;
        if MessageDlg('Esta Seguro de Realizar la Actualización?',mtinformation,[mbyes,mbno],0) = mryes then
        begin
           with DmSolicitud.IBsolicitud2 do
           begin
             try
               Close;
               if Transaction.InTransaction then
                Transaction.Commit;
               Transaction.StartTransaction;
               SQL.Clear;
               SQL.Add('update "col$solicitud" set');
               SQL.Add('PLAZO_APROBADO = :PLAZO_APROBADO,');
               SQL.Add('VALOR_APROBADO = :VALOR_APROBADO,');
               SQL.Add('LINEA = :LINEA,');
               SQL.Add('INVERSION = :INVERSION,');
               SQL.Add('CLASIFICACION = :CLASIFICACION,');
               SQL.Add('GARANTIA = :GARANTIA,');
               SQL.Add('S_VIDA = :S_VIDA');
               SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and OFICINA = :ID_AGENCIA');
               ParamByName('ID_SOLICITUD').AsString := EDradicado.Text;
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('PLAZO_APROBADO').AsInteger := StrToInt(JVplazo.Text);
               ParamByName('VALOR_APROBADO').AsCurrency := EDvalor_a.Value;
               ParamByName('LINEA').AsInteger := DBlinea.KeyValue;
               ParamByName('CLASIFICACION').AsInteger := DBclasificacion.KeyValue;
               ParamByName('INVERSION').AsInteger := DBinversion.KeyValue;
               ParamByName('GARANTIA').AsInteger := DBgarantia.KeyValue;
               ParamByName('S_VIDA').AsInteger := BoolToInt(Chcredivida.Checked);
               Open;
               // inserta nuevos cambios en la solicitud
               SQL.Clear;
               SQL.Add('insert into "col$actualizasolicitud" values (');
               SQL.Add(':ID_SOLICITUD,:ID_AGENCIA,:ID_EMPLEADO,1,:PLAZO,:VALOR,:ID_GARANTIA');
               SQL.Add(',:ID_CLASIFICACION,:ID_LINEA,:ID_INVERSION,:FECHA,:HORA,:S_VIDA)');
               ParamByName('ID_SOLICITUD').AsString := EDradicado.Text;
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_EMPLEADO').AsString := DBAlias;
               if v_plazo then
                 ParamByName('PLAZO').AsInteger := StrToInt(JVplazo.Text);
               if v_valor then
                 ParamByName('VALOR').AsCurrency := EDvalor_a.Value;
               if v_garantia then
                 ParamByName('ID_GARANTIA').AsInteger := DBgarantia.KeyValue;
               if v_clasificacion then
                 ParamByName('ID_CLASIFICACION').AsInteger := DBclasificacion.KeyValue;
               if v_linea then
                 ParamByName('ID_LINEA').AsInteger := DBlinea.KeyValue;
               if v_inversion then
                 ParamByName('ID_INVERSION').AsInteger := DBinversion.KeyValue;
               if v_credivida then
                  ParamByName('S_VIDA').AsString := vS_Vida;
               ParamByName('FECHA').AsDate := fecha;
               ParamByName('HORA').AsTime := hora;
               Open;
               //inserta datos anteriores
               SQL.Clear;
               SQL.Add('insert into "col$actualizasolicitud" values (');
               SQL.Add(':ID_SOLICITUD,:ID_AGENCIA,:ID_EMPLEADO,0,:PLAZO,:VALOR,:ID_GARANTIA');
               SQL.Add(',:ID_CLASIFICACION,:ID_LINEA,:ID_INVERSION,:FECHA,:HORA,:S_VIDA)');
               ParamByName('ID_SOLICITUD').AsString := EDradicado.Text;
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('ID_EMPLEADO').AsString := DBAlias;
               if v_plazo then
                 ParamByName('PLAZO').AsInteger := plazo_sol;
               if v_valor then
                 ParamByName('VALOR').AsCurrency := valor_sol;
               if v_garantia then
                 ParamByName('ID_GARANTIA').AsInteger := id_garantia;
               if v_clasificacion then
                 ParamByName('ID_CLASIFICACION').AsInteger := id_clasificacion;
               if v_linea then
                  ParamByName('ID_LINEA').AsInteger := id_linea;
               if v_inversion then
                  ParamByName('ID_INVERSION').AsInteger := id_inversion;
               if v_credivida then
                 ParamByName('S_VIDA').AsString := vS_Vida_old;
               ParamByName('FECHA').AsDate := fecha;
               ParamByName('HORA').AsTime := hora;
               Open;
               Transaction.Commit;
               Close;
             except
             begin
               MessageDlg('Error Realizando Actualziación',mtError,[mbok],0);
               Transaction.Rollback;
             end;
             end;// fin del try
           end;
           BTcancelar.Click;
        end;
end;

procedure TFrmActualizaSol.BitBtn4Click(Sender: TObject);
begin
        BTcancelar.Click;
end;

procedure TFrmActualizaSol.ScerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmActualizaSol.DBlineaExit(Sender: TObject);
begin
           if ID_LINEA <> 3 then
           begin
             if DBLINEA.KEYVALUE = 3 then
             begin
               MessageDlg('No se puede Modificar la Linea a Social',mtinformation,[mbok],0);
               DBlinea.KeyValue := id_linea;
               Exit;
             end;
           end;

end;

procedure TFrmActualizaSol.ChcredividaClick(Sender: TObject);
begin
        if Chcredivida.Checked then
           vS_Vida := 'S'
        else
           vS_Vida := 'N'
end;

end.
