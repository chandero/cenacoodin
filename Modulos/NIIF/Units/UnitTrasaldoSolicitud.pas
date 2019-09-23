unit UnitTrasaldoSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvStaticText, DBCtrls, DB, IBCustomDataSet,
  IBQuery, IBExtract, Buttons, Mask, IBDatabase, IBSQL, UnitDmGeneral;

type
  TFrmTrasladoSolicitud = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    JVanalista: TJvStaticText;
    Label2: TLabel;
    DBempleado: TDBLookupComboBox;
    Panel2: TPanel;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    Label3: TLabel;
    MKsolicitud: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MKsolicitudKeyPress(Sender: TObject; var Key: Char);
    procedure DBempleadoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrasladoSolicitud: TFrmTrasladoSolicitud;
  dmGeneral : TdmGeneral;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmTrasladoSolicitud.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          Open;
          Last;
        end;
end;

procedure TFrmTrasladoSolicitud.BitBtn1Click(Sender: TObject);
begin
        if MessageDlg('Esta seguro de Realizar el Traslado',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"col$solicitudanalista".ID_EMPLEADO,');
          SQL.Add('"col$solicitudanalista".ES_VIGENTE');
          SQL.Add('FROM');
          SQL.Add('"col$solicitudanalista"');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitudanalista".ES_VIGENTE = 1) AND ');
          SQL.Add('("col$solicitudanalista".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitud no Encontrada o no se Encuentra Registrada...',mtInformation,[mbok],0);
            Exit;
          end;
          if DBAlias <> FieldByName('ID_EMPLEADO').AsString then
          begin
            MessageDlg('La Solicitud no se Encuentra Bajo su Nombre',mtInformation,[mbok],0);
            Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('update "col$solicitudanalista" set ES_VIGENTE = 0 where ID_SOLICITUD = :ID_SOLICITUD and ES_VIGENTE = 1');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ExecQuery;
          Close;
          SQL.Clear;
          SQL.Add('insert into "col$solicitudanalista" values (:AGENCIA,:ID_SOLICITUD,:ID_EMPLEADO,:FECHAHORA,1,:ID_EMPLEADO_TRAS,0,0)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ParamByName('AGENCIA').AsInteger := Agencia;
          ParamByName('ID_EMPLEADO').AsString := DBempleado.KeyValue;
          ParamByName('FECHAHORA').AsDateTime := fFechaActual + Time;
          ParamByName('ID_EMPLEADO_TRAS').AsString := DBAlias;
          ExecQuery;
          Transaction.Commit;
        end;
        DBempleado.KeyValue := '';
        MKsolicitud.Text := '';
        DBempleado.DropDown;


end;

procedure TFrmTrasladoSolicitud.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmTrasladoSolicitud.MKsolicitudKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BitBtn1.SetFocus;
end;

procedure TFrmTrasladoSolicitud.DBempleadoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
          MKsolicitud.SetFocus;
end;

end.
