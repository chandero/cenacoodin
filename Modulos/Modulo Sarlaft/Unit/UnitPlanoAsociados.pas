unit UnitPlanoAsociados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, StdCtrls, Buttons, ComCtrls, DB, IBCustomDataSet,
  IBQuery, DataSetToExcel;

type
  TfrmPlanoAsociados = class(TForm)
    Label1: TLabel;
    edFechaCorte: TDateTimePicker;
    BitBtn1: TBitBtn;
    _trans: TIBTransaction;
    _query: TIBQuery;
    SD1: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanoAsociados: TfrmPlanoAsociados;

implementation

uses UnitdmGeneral;

{$R *.dfm}

procedure TfrmPlanoAsociados.BitBtn1Click(Sender: TObject);
var
  toExcel : TDataSetToExcel;
  _fileName: String;
begin
        _trans.DefaultDatabase := dmGeneral.IBDatabase1;
        _trans.StartTransaction;

        _query.Close;
        _query.SQL.Clear;
        _query.SQL.Text := 'SELECT ' +
                           'gp1.ID_IDENTIFICACION AS NUMERO_IDENTIFICACION, ' +
                           'TRIM(TRIM(gp1.PRIMER_APELLIDO) || '' '' || TRIM(gp1.SEGUNDO_APELLIDO) || '' '' || gp1.NOMBRE) AS NOMBRE_ASOCIADO,' +
                           'gp1.FECHA_NACIMIENTO, ' +
                           'gp1.FECHA_REGISTRO, ' +
                           'gd1.MUNICIPIO, ' +
                           'gd1.MUNICIPIO, ' +
                           'gp1.ID_CIIU, ' +
                           'gtc1.DESCRIPCION AS TIPO_CONTRATO, ' +
                           'gp1.SEXO AS GENERO, ' +
                           'gne1.DESCRIPCION_NIVEL AS NIVEL_ESCOLARIDAD, ' +
                           'gpa1.ID_ESTRATO  AS ESTRATO, ' +
                           'gtec1.DESCRIPCION_ESTADO_CIVIL AS ESTADO_CIVIL, ' +
                           '(gp1.INGRESOS_A_PRINCIPAL + gp1.INGRESOS_OTROS) AS INGRESOS, ' +
                           '(gp1.EGRESOS_ALIMENTACION + gp1.EGRESOS_ALQUILER + gp1.EGRESOS_DEUDAS + gp1.EGRESOS_OTROS + gp1.EGRESOS_SERVICIOS + gp1.EGRESOS_TRANSPORTE ) AS GASTOS, ' +
                           'gp1.TOTAL_ACTIVOS AS ACTIVOS, ' +
                           'gp1.TOTAL_PASIVOS AS PASIVOS, ' +
                           '(gp1.TOTAL_ACTIVOS - gp1.TOTAL_PASIVOS) AS PATRIMONIO ' +
                           'FROM "cap$maestro" cm1 ' +
                           'INNER JOIN "cap$maestrotitular" cmt1 ' +
                                'ON cmt1.ID_AGENCIA = cm1.ID_AGENCIA AND ' +
                                'cmt1.ID_TIPO_CAPTACION  = cm1.ID_TIPO_CAPTACION AND ' +
                                'cmt1.NUMERO_CUENTA = cm1.NUMERO_CUENTA AND ' +
                                'cmt1.DIGITO_CUENTA = cm1.DIGITO_CUENTA AND ' +
                                'cmt1.NUMERO_TITULAR = 1 ' +
                           'INNER JOIN  "gen$persona" gp1 ' +
   			        'ON gp1.ID_IDENTIFICACION = cmt1.ID_IDENTIFICACION AND ' +
                                    'gp1.ID_PERSONA = cmt1.ID_PERSONA ' +
                           'INNER JOIN  "gen$persadicional" gpa1 ON ' +
   				    'gpa1.ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND ' +
				    'gpa1.ID_PERSONA = gp1.ID_PERSONA ' +
                           'INNER JOIN "gen$tiposcontrato" gtc1 ON ' +
                                    'gtc1.ID_CONTRATO = gpa1.ID_TIPOCONTRATO ' +
                           'INNER JOIN "gen$direccion" gd1 ON ' +
	                            'gd1.ID_IDENTIFICACION = gp1.ID_IDENTIFICACION AND ' +
                                    'gd1.ID_PERSONA = gp1.ID_PERSONA AND ' +
                                    'gd1.ID_DIRECCION  = 1 ' +
                           'INNER JOIN "gen$nivelestudio" gne1 ON gne1.ID_NIVEL = gpa1.ID_ESTUDIO ' +
                           'INNER JOIN "gen$tiposestadocivil" gtec1 ON gtec1.ID_TIPO_ESTADO_CIVIL = gp1.ID_TIPO_ESTADO_CIVIL ' +
                           'WHERE cm1.ID_TIPO_CAPTACION = 1 AND cm1.FECHA_APERTURA <= :FECHA_CORTE AND cm1.ID_ESTADO = 1';
        _query.ParamByName('FECHA_CORTE').AsDate := edFechaCorte.Date;
        _query.Open;
        if (SD1.Execute) then
        begin
           _query.First;
           _fileName := SD1.FileName;
           toExcel := TDataSetToExcel.Create(_query, _fileName);
           toExcel.WriteFile;
        end;
        _query.Close;
end;

end.
