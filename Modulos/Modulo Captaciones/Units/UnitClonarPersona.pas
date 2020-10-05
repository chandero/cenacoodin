unit UnitClonarPersona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, DBCtrls, UnitDmGeneral, UnitDmPersona,
  Buttons, DB, IBCustomDataSet, IBQuery, IBDatabase;

type
  TfrmClonarPersona = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox8: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    CBTiposIdentificacion: TDBLookupComboBox;
    EdIdentificacion: TMemo;
    EdFechaExpedicion: TDateTimePicker;
    EdLugarExpedicion: TEdit;
    EdPrimerApellido: TLabeledEdit;
    EdSegundoApellido: TLabeledEdit;
    EdNombres: TLabeledEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cbsNuevoTipo: TDBLookupComboBox;
    Label2: TLabel;
    edNuevoNumeroIdentificacion: TMemo;
    Panel1: TPanel;
    btnClonar: TBitBtn;
    btnCerrar: TBitBtn;
    _ibq: TIBQuery;
    _ibt: TIBTransaction;
    procedure EdIdentificacionExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnClonarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClonarPersona: TfrmClonarPersona;
  dmPersona:TdmPersona;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmClonarPersona.EdIdentificacionExit(Sender: TObject);
begin
        with dmPersona.IBQuery do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$persona" where ');
            SQL.Add('ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA"');
            ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
            Open;
            EdLugarExpedicion.Text := FieldByName('LUGAR_EXPEDICION').AsString;
            EdFechaExpedicion.Date := FieldByName('FECHA_EXPEDICION').AsDateTime;
            EdPrimerApellido.Text := FieldByName('PRIMER_APELLIDO').AsString;
            EdSegundoApellido.Text := FieldByName('SEGUNDO_APELLIDO').AsString;
            EdNombres.Text := FieldByName('NOMBRE').AsString;
        end;
end;

procedure TfrmClonarPersona.FormCreate(Sender: TObject);
begin
        dmPersona := TdmPersona.Create(self);
        if dmPersona.IBTPersonas.InTransaction then
           dmPersona.IBTPersonas.Rollback;
        dmPersona.IBTPersonas.StartTransaction;
        dmPersona.IBDStiposidentificacion.Open;
        dmPersona.IBDStiposidentificacion.Last;
end;

procedure TfrmClonarPersona.btnCerrarClick(Sender: TObject);
begin
  dmPersona.IBTPersonas.Commit;
  Close;
end;

procedure TfrmClonarPersona.btnClonarClick(Sender: TObject);
var
  _iDatabase: TIBDatabase;
begin
        if (MessageDlg('Seguro de Clonar Esta Persona?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
           btnClonar.Enabled := False;
           _ibt.StartTransaction;
           _ibq.Close;
           _ibq.SQL.Clear;
           _ibq.SQL.Add('INSERT INTO "gen$persona" SELECT ');
	   _ibq.SQL.Add(':ID_IDENTIFICACION_NUEVO, :ID_PERSONA_NUEVO, LUGAR_EXPEDICION, FECHA_EXPEDICION, NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, ');
           _ibq.SQL.Add('ID_TIPO_PERSONA, SEXO, FECHA_NACIMIENTO, LUGAR_NACIMIENTO, PROVINCIA_NACIMIENTO, DEPTO_NACIMIENTO, ');
           _ibq.SQL.Add('PAIS_NACIMIENTO, ID_TIPO_ESTADO_CIVIL, ID_CONYUGE, ID_IDENTIFICACION_CONYUGE, NOMBRE_CONYUGE, ');
           _ibq.SQL.Add('PRIMER_APELLIDO_CONYUGE, SEGUNDO_APELLIDO_CONYUGE, ID_APODERADO, ID_IDENTIFICACION_APODERADO, NOMBRE_APODERADO, ');
           _ibq.SQL.Add('PRIMER_APELLIDO_APODERADO, SEGUNDO_APELLIDO_APODERADO, PROFESION, ID_ESTADO, ID_TIPO_RELACION, ID_CIIU, ');
           _ibq.SQL.Add('EMPRESA_LABORA, FECHA_INGRESO_EMPRESA, CARGO_ACTUAL, DECLARACION, INGRESOS_A_PRINCIPAL, INGRESOS_OTROS, ');
           _ibq.SQL.Add('INGRESOS_CONYUGE, INGRESOS_CONYUGE_OTROS, DESC_INGR_OTROS, EGRESOS_ALQUILER, EGRESOS_SERVICIOS, ');
	   _ibq.SQL.Add('EGRESOS_TRANSPORTE, EGRESOS_ALIMENTACION, EGRESOS_DEUDAS, EGRESOS_OTROS, DESC_EGRE_OTROS, EGRESOS_CONYUGE, ');
           _ibq.SQL.Add('OTROS_EGRESOS_CONYUGE, TOTAL_ACTIVOS, TOTAL_PASIVOS, EDUCACION, RETEFUENTE, ACTA, FECHA_REGISTRO, FOTO, FIRMA, ');
           _ibq.SQL.Add('ESCRITURA_CONSTITUCION, DURACION_SOCIEDAD, CAPITAL_SOCIAL, MATRICULA_MERCANTIL, FOTO_HUELLA, DATOS_HUELLA, ');
           _ibq.SQL.Add('EMAIL, ID_EMPLEADO, FECHA_ACTUALIZACION ');
           _ibq.SQL.Add(' FROM "gen$persona" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA');
           _ibq.ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
           _ibq.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
           _ibq.ParamByName('ID_IDENTIFICACION_NUEVO').AsInteger := cbsNuevoTipo.KeyValue;
           _ibq.ParamByName('ID_PERSONA_NUEVO').AsString := edNuevoNumeroIdentificacion.Text;
           _ibq.ExecSQL;
           _ibq.Close;

           _ibq.SQL.Clear;
           _ibq.SQL.Add('INSERT INTO "gen$persadicional" SELECT :ID_IDENTIFICACION_NUEVO, :ID_PERSONA_NUEVO, NUMERO_HIJOS, ID_OCUPACION, ID_TIPOCONTRATO, DESCRIPCION_CONTRATO, ID_SECTOR, ');
           _ibq.SQL.Add('DESCRIPCION_SECTOR, VENTA_ANUAL, FECHA_ULTIMO_BALANCE, NUMERO_EMPLEADOS, DECLARA_RENTA, PERSONAS_A_CARGO, ');
           _ibq.SQL.Add('ID_ESTRATO, CABEZAFAMILIA, ID_ESTUDIO, ID_TIPOVIVIENDA');
           _ibq.SQL.Add('FROM "gen$persadicional" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA');
           _ibq.ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
           _ibq.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
           _ibq.ParamByName('ID_IDENTIFICACION_NUEVO').AsInteger := cbsNuevoTipo.KeyValue;
           _ibq.ParamByName('ID_PERSONA_NUEVO').AsString := edNuevoNumeroIdentificacion.Text;
           _ibq.ExecSQL;
           _ibq.Close;

           _ibq.SQL.Clear;
           _ibq.SQL.Add('INSERT INTO "gen$persadicional2" SELECT :ID_IDENTIFICACION_NUEVO, :ID_PERSONA_NUEVO, ES_EMPLEADO, ES_PEPS, PERTENECE_A, ES_FAMILIAR_DE, PRIMER_APELLIDO, ');
           _ibq.SQL.Add('SEGUNDO_APELLIDO, NOMBRE, ID_PARENTESCO, EMAIL, INGRESOS_PENSION, ID_PEPS ');
           _ibq.SQL.Add(' FROM "gen$persadicional2" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA');
           _ibq.ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
           _ibq.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
           _ibq.ParamByName('ID_IDENTIFICACION_NUEVO').AsInteger := cbsNuevoTipo.KeyValue;
           _ibq.ParamByName('ID_PERSONA_NUEVO').AsString := edNuevoNumeroIdentificacion.Text;
           _ibq.ExecSQL;
           _ibq.Close;

           _ibq.SQL.Clear;
           _ibq.SQL.Add('INSERT INTO "gen$direccion" SELECT :ID_IDENTIFICACION_NUEVO, :ID_PERSONA_NUEVO, CONSECUTIVO, ID_DIRECCION, DIRECCION, BARRIO, COD_MUNICIPIO, MUNICIPIO, ');
           _ibq.SQL.Add('TELEFONO1, TELEFONO2, TELEFONO3, TELEFONO4 ');
           _ibq.SQL.Add('FROM "gen$direccion" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA');
           _ibq.ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
           _ibq.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
           _ibq.ParamByName('ID_IDENTIFICACION_NUEVO').AsInteger := cbsNuevoTipo.KeyValue;
           _ibq.ParamByName('ID_PERSONA_NUEVO').AsString := edNuevoNumeroIdentificacion.Text;
           _ibq.ExecSQL;
           _ibq.Close;

           _ibq.SQL.Clear;
           _ibq.SQL.Add('INSERT INTO "gen$beneficiario" SELECT ID_AGENCIA, :ID_PERSONA_NUEVO, :ID_IDENTIFICACION_NUEVO, CONSECUTIVO, PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE, ');
           _ibq.SQL.Add('ID_PARENTESCO, PORCENTAJE, AUXILIO ');
           _ibq.SQL.Add('FROM "gen$beneficiario" WHERE ID_IDENTIFICACION = :ID_IDENTIFICACION AND ID_PERSONA = :ID_PERSONA');
           _ibq.ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
           _ibq.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
           _ibq.ParamByName('ID_IDENTIFICACION_NUEVO').AsInteger := cbsNuevoTipo.KeyValue;
           _ibq.ParamByName('ID_PERSONA_NUEVO').AsString := edNuevoNumeroIdentificacion.Text;
           _ibq.ExecSQL;
           _ibq.Close;

           _ibq.SQL.Clear;
           _ibq.SQL.Add('INSERT INTO "gen$referencias" SELECT :ID_IDENTIFICACION_NUEVO, :ID_PERSONA_NUEVO, CONSECUTIVO_REFERENCIA, PRIMER_APELLIDO_REFERENCIA, SEGUNDO_APELLIDO_REFERENCIA, NOMBRE_REFERENCIA, ');
           _ibq.SQL.Add('DIRECCION_REFERENCIA, TELEFONO_REFERENCIA, TIPO_REFERENCIA, PARENTESCO_REFERENCIA ');
           _ibq.SQL.Add('FROM "gen$referencias" WHERE TIPO_ID_REFERENCIA = :ID_IDENTIFICACION AND ID_REFERENCIA = :ID_PERSONA');
           _ibq.ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
           _ibq.ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
           _ibq.ParamByName('ID_IDENTIFICACION_NUEVO').AsInteger := cbsNuevoTipo.KeyValue;
           _ibq.ParamByName('ID_PERSONA_NUEVO').AsString := edNuevoNumeroIdentificacion.Text;
           _ibq.ExecSQL;
           _ibq.Close;

           _ibt.Commit;

          _iDatabase := TIBDatabase.Create(nil);
          _iDatabase.DatabaseName := _sServerImagen;
          _iDatabase.SQLDialect := 3;
          _iDatabase.LoginPrompt := False;
          _iDatabase.Params.Add('user_name=sysdba');
          _iDatabase.Params.Add('password=masterkey');
          _iDatabase.Params.Add('lc_ctype=ISO8859_1');
          _iDatabase.Open;
          _ibt.DefaultDatabase := _iDatabase;
          _ibt.DefaultAction := TARollback;
          if (_ibt.InTransaction) then
                _ibt.Commit;
          _ibt.StartTransaction;
          with _ibq do
          begin
            Database := _iDatabase;
            Transaction := _ibt;
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO IMAGEN SELECT');
            SQL.Add(':ID_IDENTIFICACION_NUEVO, :ID_PERSONA_NUEVO, ');
            SQL.Add('IMAGEN.FOTO, ');
            SQL.Add('IMAGEN.HUELLA, ');
            SQL.Add('IMAGEN.FIRMA ');
            SQL.Add('FROM ');
            SQL.Add('IMAGEN ');
            SQL.Add('WHERE ');
            SQL.Add('IMAGEN.ID_PERSONA = :ID_PERSONA AND ');
            SQL.Add('IMAGEN.ID_IDENTIFICACION = :ID_IDENTIFICACION ');
            ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
            ParamByName('ID_IDENTIFICACION_NUEVO').AsInteger := cbsNuevoTipo.KeyValue;
            ParamByName('ID_PERSONA_NUEVO').AsString := edNuevoNumeroIdentificacion.Text;
            ExecSQL;
            Close;
            _ibt.Commit;
          end;

           ShowMessage('Persona Clonada con Exito...!');

        end;
end;

end.
