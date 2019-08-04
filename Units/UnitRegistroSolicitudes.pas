unit UnitRegistroSolicitudes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, Grids, DBGrids, StdCtrls, JvLabel, Mask,
  Buttons, DBCtrls, IBCustomDataSet, IBQuery;

type
  TFrmRegistroSolicitud = class(TForm)
    Panel1: TPanel;
    CDsolicitud: TClientDataSet;
    DSolicitud: TDataSource;
    CDsolicitudid_solicitud: TStringField;
    CDsolicitudnombre: TStringField;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    MKsolicitud: TMaskEdit;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    nombre: TStaticText;
    Label1: TLabel;
    fecha: TStaticText;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    Label2: TLabel;
    DBempleado: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    CDsolicitudid_empleado: TStringField;
    procedure MKsolicitudExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MKsolicitudKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBempleadoEnter(Sender: TObject);
    procedure DBempleadoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistroSolicitud: TFrmRegistroSolicitud;

implementation

uses UnitDmSolicitud, UnitGlobales;

{$R *.dfm}

procedure TFrmRegistroSolicitud.MKsolicitudExit(Sender: TObject);
begin
{        if MKsolicitud.Text <> '          ' then
        begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"col$solicitud".ID_SOLICITUD');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          ExecQuery;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
            MKsolicitud.SetFocus;
          end
          else
          begin
           try
            CDsolicitud.Append;
            CDsolicitud.FieldValues['id_solicitud'] := MKsolicitud.Text;
            CDsolicitud.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString;
            CDsolicitud.Post;
           except
             CDsolicitud.Cancel;
           end;
            MKsolicitud.Text := '';
            MKsolicitud.SetFocus;
          end;
        end;
        end; }
end;

procedure TFrmRegistroSolicitud.FormCreate(Sender: TObject);
begin
        DmSolicitud := TDmSolicitud.Create(self);
        with DmSolicitud.IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
        end;
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

procedure TFrmRegistroSolicitud.MKsolicitudKeyPress(Sender: TObject;
  var Key: Char);
var     vId_Empleado :string;
begin
        if Key = #13 then
        begin
          with DmSolicitud.IBSQL1 do
          begin
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"col$solicitudanalista".ID_EMPLEADO');
            SQL.Add('FROM');
            SQL.Add('"col$solicitudanalista"');
            SQL.Add('WHERE');
            SQL.Add('("col$solicitudanalista".ID_SOLICITUD = :ID_SOLICITUD) AND');
            SQL.Add('("col$solicitudanalista".ES_VIGENTE = 1)');
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            ExecQuery;
            if RecordCount > 0 then
            begin
              MessageDlg('La Solicitud se Encuentra a nombre de : ' + FieldByName('ID_EMPLEADO').AsString,mtInformation,[MBOK],0);
              Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"col$solicitudempleado".ID_EMPLEADO,');
            SQL.Add('"col$solicitudempleado".NOTIFICADO,');
            SQL.Add('"col$solicitudempleado".ENTREGADO');
            SQL.Add('FROM');
            SQL.Add('"col$solicitudempleado"');
            SQL.Add('WHERE');
            SQL.Add('("col$solicitudempleado".ID_SOLICITUD = :ID_SOLICITUD)');
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            ExecQuery;
            vId_Empleado := FieldByName('ID_EMPLEADO').AsString;
            if RecordCount > 0 then
            begin
              {if FieldByName('ID_EMPLEADO').AsString <> DBempleado.KeyValue then
              begin
                 MessageDlg('La Solicitud no pertenece a : ' + DBempleado.KeyValue + ' por Favor Verifique',mtInformation,[mbok],0);
                 Exit;
              end;}
              if FieldByName('NOTIFICADO').AsInteger = 0 then
              begin
                 MessageDlg('La Solicitud no ha Sido Notificado por : ' + vId_Empleado + ' por Favor Verifique',mtInformation,[mbok],0);
                 Exit;
              end;
              if FieldByName('ENTREGADO').AsInteger = 1 then
              begin
                 MessageDlg('La Solicitud ya fue Entregada Por parte de : ' + vId_Empleado + ' por Favor Verifique',mtInformation,[mbok],0);
                 Exit;
              end;
            end;
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"gen$persona".NOMBRE,');
            SQL.Add('"gen$persona".PRIMER_APELLIDO,');
            SQL.Add('"col$solicitud".ID_SOLICITUD');
            SQL.Add('FROM');
            SQL.Add('"col$solicitud"');
            SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
            SQL.Add('WHERE');
            SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD and ESTADO in (1,9,13))');
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            ExecQuery;
            if RecordCount = 0 then
            begin
              MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
              MKsolicitud.SetFocus;
            end
            else
            begin
             try
              CDsolicitud.Append;
              CDsolicitud.FieldValues['id_solicitud'] := MKsolicitud.Text;
              CDsolicitud.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString;
              CDsolicitud.FieldValues['id_empleado'] := vId_Empleado;
              CDsolicitud.Post;
             except
               CDsolicitud.Cancel;
             end;
              MKsolicitud.Text := '';
              MKsolicitud.SetFocus;
            end;
          end;
        end;
end;

procedure TFrmRegistroSolicitud.SpeedButton2Click(Sender: TObject);
begin
        try
          CDsolicitud.Delete;
        except
        begin
          MessageDlg('No existen datos para eliminar',mtError,[mbok],0);
          MKsolicitud.SetFocus;
        end;
        end;
end;

procedure TFrmRegistroSolicitud.SpeedButton1Click(Sender: TObject);
begin
        if MessageDlg('Esta Seguro de Realizar la Operacion',mtInformation,[mbyes,mbno],0) = mrno then
          Exit;
        CDsolicitud.First;
        while not CDsolicitud.Eof do
        begin
          with DmSolicitud.IBSolicitud1 do
          begin
            Close;
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('update "col$solicitud" set');
            SQL.Add('ID_ANALISIS = :ID_ANALISIS');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_ANALISIS').AsString := DBAlias;
            ParamByName('ID_SOLICITUD').AsString := CDsolicitudid_solicitud.Value;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('insert into "col$solicitudanalista" values (:ID_AGENCIA,:ID_SOLICITUD,:ID_EMPLEADO,:FECHAHORA,1,NULL,0,0)');
            ParamByName('ID_SOLICITUD').AsString := CDsolicitudid_solicitud.Value;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_EMPLEADO').AsString := DBAlias;
            ParamByName('FECHAHORA').AsDateTime := fFechaActual + Time;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('update "col$solicitudempleado" set ENTREGADO = 1 where ID_SOLICITUD = :ID_SOLICITUD and ID_EMPLEADO = :ID_EMPLEADO');
            ParamByName('ID_SOLICITUD').AsString := CDsolicitudid_solicitud.Value;
            ParamByName('ID_EMPLEADO').AsString := CDsolicitudid_empleado.Value;
            ExecSQL;
            Transaction.Commit;
            Close;
          end;
          CDsolicitud.Next;
        end;
        MessageDlg('Registros Actualizados con Exito.',mtInformation,[mbok],0);
        CDsolicitud.CancelUpdates;
end;

procedure TFrmRegistroSolicitud.BitBtn1Click(Sender: TObject);
begin
        Panel3.Enabled := False;
        MKsolicitud.SetFocus;
end;

procedure TFrmRegistroSolicitud.DBempleadoEnter(Sender: TObject);
begin
        DBempleado.DropDown;
end;

procedure TFrmRegistroSolicitud.DBempleadoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BitBtn1.SetFocus;
end;

end.
