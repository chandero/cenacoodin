unit UnitEstadoSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, ComCtrls, Buttons, DB, DBClient,
  FR_DSet, FR_DBSet, FR_Class, IBCustomDataSet, IBQuery, IBDatabase;

type
  TFrmEstadoSolicitud = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBestado: TDBLookupComboBox;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DTfechaini: TDateTimePicker;
    DTfechafin: TDateTimePicker;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CDestado: TClientDataSet;
    CDestadoid_estado: TSmallintField;
    CDestadoestado: TStringField;
    IBrepSolicitud: TIBQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBtotal: TIBQuery;
    frDBDataSet2: TfrDBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
   a: Integer;
    procedure imprimir_reporte(cadena: string);
   
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstadoSolicitud: TFrmEstadoSolicitud;

implementation

uses UnitDmSolicitud, UnitImpresion, UnitMain;

{$R *.dfm}

procedure TFrmEstadoSolicitud.FormCreate(Sender: TObject);
begin
        DTfechaini.DateTime := Date;
        DTfechafin.Date := Date;
        DmSolicitud := TDmSolicitud.Create(Self);
        with DmSolicitud.IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$estadosolicitud"');
          ExecQuery;
          while not Eof do
          begin
            CDestado.Append;
            CDestado.FieldValues['id_estado'] := FieldByName('ID_ESTADO').AsInteger;
            CDestado.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO').AsString;
            CDestado.Post;
            Next;
          end;
          Close;
        end;
        CDestado.Append;
        CDestado.FieldValues['id_estado'] := 999;
        CDestado.FieldValues['estado'] := 'TODOS';
        CDestado.Post;
        DBestado.KeyValue := 999;

end;

procedure TFrmEstadoSolicitud.BitBtn1Click(Sender: TObject);
begin
          if IBTransaction1.InTransaction then
             IBTransaction1.Commit;
          IBTransaction1.StartTransaction;
          if DBestado.KeyValue <> 999 then
          begin
            IBrepSolicitud.Close;
            IBrepSolicitud.ParamByName('ESTADO').AsSmallInt := DBestado.KeyValue;
            IBrepSolicitud.ParamByName('FECHA_INI').AsDateTime := DTfechaini.DateTime;
            IBrepSolicitud.ParamByName('FECHA_FIN').AsDateTime := DTfechafin.DateTime;
            IBrepSolicitud.Open;
            if IBrepSolicitud.RecordCount = 0 then
            begin
              MessageDlg('La Consulta no Arrojo Resultados',mtInformation,[mbok],0);
              Exit;
            end;
            imprimir_reporte(frmMain.ruta1+'reporte\repestadosol.frf');
          end
          else
          begin
            IBtotal.Close;
            IBtotal.ParamByName('FECHA_INI').AsDateTime := DTfechaini.DateTime;
            IBtotal.ParamByName('FECHA_FIN').AsDateTime := DTfechafin.DateTime;
            IBtotal.Open;
            if IBtotal.RecordCount = 0 then
            begin
              MessageDlg('La Consulta no Arrojo Resultados',mtInformation,[mbok],0);
              Exit;
            end;
            imprimir_reporte(frmMain.ruta1+'reporte\repestadosoltotal.frf');
          end;

end;

procedure TFrmEstadoSolicitud.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmEstadoSolicitud.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmEstadoSolicitud.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'estado' then
           ParValue := DBestado.Text;
        if ParName = 'fecha_ini' then
           ParValue := DTfechaini.DateTime;
        if ParName = 'fecha_fin' then
           ParValue := DTfechafin.DateTime;

end;

end.
