unit UnitRecuperaEsturdio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DB, IBCustomDataSet, IBQuery,
  FR_Class, DBClient, FR_DSet, FR_DBSet, Grids, DBGrids;

type
  TFrmRecuperaEstudio = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Msolicitud: TMaskEdit;
    Panel2: TPanel;
    Button1: TButton;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    cbNombre: TComboBox;
    IBQuery4: TIBQuery;
    CDestado: TClientDataSet;
    CDestadoaprobado: TSmallintField;
    CDestadonegado: TSmallintField;
    CDestadoaplazado: TSmallintField;
    CDestadobancoldex: TSmallintField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    DataSource2: TDataSource;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRecuperaEstudio: TFrmRecuperaEstudio;

implementation

uses unitMain,UnitGlobales;

{$R *.dfm}

procedure TFrmRecuperaEstudio.Button2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRecuperaEstudio.Button3Click(Sender: TObject);
begin
        Msolicitud.Text := '';
        Msolicitud.SetFocus;
end;

procedure TFrmRecuperaEstudio.Button1Click(Sender: TObject);
var
        _iIdentificacion :Integer;
        _sIdPersona :string;
        _iEstado :Integer;
begin
        CDestado.CancelUpdates;
        with IBQuery4 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('  "col$solicitud".ESTADO,');
          SQL.Add('  "col$lineas".DESCRIPCION_LINEA,');
          SQL.Add('  "gen$persona".NOMBRE,');
          SQL.Add('  "gen$persona".PRIMER_APELLIDO,');
          SQL.Add('  "gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('  "col$solicitud".FECHA_CONCEPTO,');
          SQL.Add('  "col$solicitud".NUMERO_ACTA,');
          SQL.Add('  "col$solicitud".PLAZO_APROBADO,');
          SQL.Add('  "col$solicitud".VALOR_APROBADO,');
          SQL.Add('  "col$lineas".TASA,');
          SQL.Add('  "col$garantia".DESCRIPCION_GARANTIA,');
          SQL.Add('  "col$solicitud".ID_PERSONA,');
          SQL.Add('  "col$solicitud".ID_IDENTIFICACION');
          SQL.Add('FROM');
          SQL.Add('  "col$solicitud"');
          SQL.Add('  INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('  AND ("col$solicitud".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('  INNER JOIN "col$lineas" ON ("col$solicitud".LINEA = "col$lineas".ID_LINEA)');
          SQL.Add('  INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA = "col$garantia".ID_GARANTIA)');
          SQL.Add('WHERE');
          SQL.Add('  "col$solicitud".ID_SOLICITUD = :ID_SOLICITUD AND ');
          SQL.Add('  "col$solicitud".ESTADO IN (4,7) AND');
          SQL.Add('  "col$solicitud".ENTE_APROBADOR = 1');          
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          Open;
          if RecordCount > 0 then
          begin
             if FieldByName('FECHA_CONCEPTO').AsDateTime <> fFechaActual then
             begin
               ShowMessage('No se puede Recuperar el Reporte, la fecha actual y la del concepto no coinciden ...');
               Exit;
             end;
            _sIdPersona := FieldByName('ID_PERSONA').AsString;
            _iIdentificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
            _iEstado := FieldByName('ESTADO').AsInteger;
            if cbNombre.ItemIndex = 0 then
            begin
               frReport1.LoadFromFile(frmMain.wpath+'reporte\repente1.frf');
               frReport1.Dictionary.Variables['ente'] := QuotedStr('GERENTE GENERAL');
            end
               else if cbNombre.ItemIndex = 1 then
               begin
                  frReport1.LoadFromFile(frmMain.wpath+'reporte\repente2.frf');
                  frReport1.Dictionary.Variables['ente'] := QuotedStr('GERENTE SUPLENTE 1');
               end
                 else
                 begin
                   frReport1.LoadFromFile(frmMain.wpath+'reporte\repente3.frf');
                   frReport1.Dictionary.Variables['ente'] := QuotedStr('GERENTE SUPLENTE 2');
                 end;
            frReport1.Dictionary.Variables['asociado'] := QuotedStr(FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' +FieldByName('SEGUNDO_APELLIDO').AsString);
            frReport1.Dictionary.Variables['identificacion'] := QuotedStr(_sIdPersona);

            frReport1.Dictionary.Variables['fecha'] := QuotedStr(FieldByName('FECHA_CONCEPTO').AsString);
            frReport1.Dictionary.Variables['linea'] := QuotedStr(FieldByName('DESCRIPCION_LINEA').AsString);
            frReport1.Dictionary.Variables['garantia'] := QuotedStr(FieldByName('DESCRIPCION_GARANTIA').AsString);
            frReport1.Dictionary.Variables['valor'] := QuotedStr(FieldByName('VALOR_APROBADO').AsString);
            frReport1.Dictionary.Variables['acta'] := QuotedStr(FieldByName('NUMERO_ACTA').AsString);
            frReport1.Dictionary.Variables['plazo'] := QuotedStr(FieldByName('PLAZO_APROBADO').AsString);
            frReport1.Dictionary.Variables['tasa'] := QuotedStr(FieldByName('TASA').AsString);
            frReport1.Dictionary.Variables['numero_rad'] := QuotedStr(Msolicitud.Text);
            //Buscar el Número de la cuenta
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
            ParamByName('ID_IDENTIFICACION').AsInteger := _iIdentificacion;
            ParamByName('ID_PERSONA').AsString := _sIdPersona;
            Open;
            frReport1.Dictionary.Variables['cuenta'] := QuotedStr('20'+IntToStr(Agencia)+'-'+Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]));
            IBquery1.Close;
            if _iEstado = 4 then
                 IBquery1.ParamByName('ID_OBSERVACION').AsInteger := 14
            else
                 IBquery1.ParamByName('ID_OBSERVACION').AsInteger := 6;
            IBquery1.ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
            IBquery1.Open;
            //ShowMessage(IBquery1.FieldByName('OBSERVACION').AsString);
            if _iEstado = 4 then
            begin
             CDestado.Append;
             CDestado.FieldValues['aprobado'] := 1;
             CDestado.FieldValues['negado'] := 0;
             CDestado.FieldValues['aplazado'] := 0;
             CDestado.FieldValues['bancoldex'] := 0;
             CDestado.Post;
            end
            else
            begin
             CDestado.Append;
             CDestado.FieldValues['aprobado'] := 0;
             CDestado.FieldValues['negado'] := 1;
             CDestado.FieldValues['aplazado'] := 0;
             CDestado.FieldValues['bancoldex'] := 0;
             CDestado.Post;
            end;
            frReport1.ShowReport;
          end
          else
            ShowMessage('No se Encontraron registros, Favor revise el Número de Radicado..');
        end;
end;

end.
