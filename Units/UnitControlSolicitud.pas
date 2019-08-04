unit UnitControlSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvTypedEdit, StdCtrls, ExtCtrls, JvStaticText, Mask, Buttons,
  JvEdit, DBCtrls, ComCtrls, Grids, DBGrids;

type
  TfrmControlSolicitud = class(TForm)
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label5: TLabel;
    DBtipo: TDBLookupComboBox;
    JVnumero: TJvEdit;
    BTbuscar: TBitBtn;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Mradicado: TMaskEdit;
    fecha: TJvStaticText;
    BTbuscar1: TBitBtn;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    DBtipocuenta: TDBLookupComboBox;
    BitBtn3: TBitBtn;
    JVcuenta: TJvEdit;
    Panel1: TPanel;
    Label11: TLabel;
    JVnombres: TJvStaticText;
    Scuenta: TStaticText;
    StaticText2: TStaticText;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    EdDiasIni: TJvIntegerEdit;
    EdDiasFin: TJvIntegerEdit;
    CmdProcesar: TBitBtn;
    Label12: TLabel;
    DBGrid2: TDBGrid;
    procedure BTbuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControlSolicitud: TfrmControlSolicitud;

implementation

uses UnitDmSolicitud;

{$R *.dfm}

procedure TfrmControlSolicitud.BTbuscarClick(Sender: TObject);
var     id_persona :string;
        id_identificacion, oficina :Integer;
begin
{        with DmSolicitud.IBSQL1 do
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
        id_persona := FieldByName('ID_PERSONA').AsString;
        id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$solicitud".OFICINA,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$solicitud".OBSERVACION,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('("col$solicitud".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('"col$solicitud".ESTADO  in (1,13,9)');
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitudes no Encontradas',mtInformation,[mbok],0);
            JVcuenta.SetFocus;
            Exit;
          end;
          oficina := FieldByName('OFICINA').AsInteger;
          while not Eof do
          begin
            CDsolicitud.Append;
            CDsolicitud.FieldValues['radicado'] := FieldByName('ID_SOLICITUD').AsString;
            CDsolicitud.FieldValues['observacion'] := FieldByName('OBSERVACION').AsString;
            CDsolicitud.FieldValues['estado'] := FieldByName('ESTADO').AsInteger;
            CDsolicitud.Post;
            Next;
          end;
          CDsolicitud.IndexFieldNames := 'radicado';
          Close;
          SQL.Clear;
          SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          JVnombres.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger := oficina;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          Scuenta.Caption := '20'+IntToStr(oficina)+'-'+Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
          PageControl1.Enabled := False;
        end;}
end;

end.
