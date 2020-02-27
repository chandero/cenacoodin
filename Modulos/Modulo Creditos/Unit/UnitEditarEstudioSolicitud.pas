unit UnitEditarEstudioSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBDatabase, JvEdit, JvTypedEdit, DB,
  IBCustomDataSet, IBQuery, Grids, DBGrids, UnitDmGeneral, Mask, DBClient,
  DBCtrls;

type
  TfrmEditarEstudioSolicitud = class(TForm)
    Label1: TLabel;
    btnBuscar: TBitBtn;
    IBTransaction1: TIBTransaction;
    IBQobservacion: TIBQuery;
    DSobservacion: TDataSource;
    DBObservacion: TDBGrid;
    edSolicitud: TMaskEdit;
    IBQpersona: TIBQuery;
    IBQobservacionID_SOLICITUD: TStringField;
    IBQobservacionID_OBSERVACION: TIntegerField;
    IBQobservacionOBSERVACION: TMemoField;
    CDSobservacion: TClientDataSet;
    edMemo: TDBMemo;
    btnActualizar: TButton;
    btnCerrar: TButton;
    IBTransaction2: TIBTransaction;
    IBQactualizar: TIBQuery;
    edAsociado: TEdit;
    Label2: TLabel;
    btnEditar: TBitBtn;
    CDSobservacionID_SOLICITUD: TStringField;
    CDSobservacionID_OBSERVACION: TIntegerField;
    CDSobservacionOBSERVACION: TMemoField;
    procedure btnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IBQobservacionOBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CDSobservacionOBSERVACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
    procedure cargarDatos;
  public
    { Public declarations }
  end;

var
  frmEditarEstudioSolicitud: TfrmEditarEstudioSolicitud;

implementation

{$R *.dfm}

procedure TfrmEditarEstudioSolicitud.btnBuscarClick(Sender: TObject);
var
 _estado: Integer;
begin
        if edSolicitud.Text < '0000000000' then exit;

        edSolicitud.ReadOnly := True;

        IBQpersona.Close;
        IBQpersona.SQL.Clear;
        IBQpersona.SQL.Add('SELECT s.ESTADO, (p.NOMBRE || '' '' || p.PRIMER_APELLIDO || '' '' || p.SEGUNDO_APELLIDO) AS ASOCIADO ');
        IBQpersona.SQL.Add('FROM "col$solicitud" s ');
        IBQpersona.SQL.Add('INNER JOIN "gen$persona" p ON p.ID_IDENTIFICACION = s.ID_IDENTIFICACION and p.ID_PERSONA = s.ID_PERSONA ');
        IBQpersona.SQL.Add('WHERE s.ID_SOLICITUD = :ID_SOLICITUD');
        IBQpersona.ParamByName('ID_SOLICITUD').AsString := edSolicitud.Text;
        IBQpersona.Open;

        edAsociado.Text := IBQpersona.FieldByName('ASOCIADO').AsString;

        _estado := IBQpersona.FieldByName('ESTADO').AsInteger;

        if (_estado = 1) or (_estado = 13) or (_estado = 2) or (_estado = 3) or (_estado = 8) or (_estado = 14) then
        begin
          cargarDatos;
        end
        else
          ShowMessage('No se puede modificar esta Solicitud');

end;

procedure TfrmEditarEstudioSolicitud.cargarDatos;
begin
        IBQobservacion.Close;
        IBQobservacion.SQL.Clear;
        IBQobservacion.SQL.Add('SELECT * FROM "col$observacion" WHERE ID_SOLICITUD = :ID_SOLICITUD');
        IBQobservacion.ParamByName('ID_SOLICITUD').AsString := edSolicitud.Text;
        IBQobservacion.Open;

        CDSobservacion.Close;
        CDSobservacion.Open;
        CDSobservacion.EmptyDataSet;

        while not IBQobservacion.Eof do
        begin
            CDSobservacion.Append;
            CDSobservacionID_SOLICITUD.Value := IBQobservacionID_SOLICITUD.Value;
            CDSobservacionID_OBSERVACION.Value := IBQobservacionID_OBSERVACION.Value;
            CDSobservacionOBSERVACION.Value := IBQobservacionOBSERVACION.Value;
            CDSobservacion.Post;
            IBQobservacion.Next;
        end;

end;

procedure TfrmEditarEstudioSolicitud.FormCreate(Sender: TObject);
begin
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction2.DefaultDatabase := dmGeneral.IBDatabase1;
        IBQobservacion.Transaction := IBTransaction1;
        IBQpersona.Transaction := IBTransaction1;
        IBQactualizar.Transaction := IBTransaction2;

        IBTransaction1.StartTransaction;
end;

procedure TfrmEditarEstudioSolicitud.IBQobservacionOBSERVACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Copy(IBQobservacionOBSERVACION.AsString, 1, 500);
end;

procedure TfrmEditarEstudioSolicitud.btnCerrarClick(Sender: TObject);
begin
        IBTransaction1.Commit;
        Close;
end;

procedure TfrmEditarEstudioSolicitud.btnActualizarClick(Sender: TObject);
begin
        IBQactualizar.Close;
        IBQactualizar.SQL.Clear;
        IBQactualizar.SQL.Add('UPDATE "col$observacion" SET OBSERVACION = :OBSERVACION WHERE ID_SOLICITUD = :ID_SOLICITUD AND ID_OBSERVACION = :ID_OBSERVACION');
        IBQactualizar.ParamByName('OBSERVACION').AsString := edMemo.Text;
        IBQactualizar.ParamByName('ID_SOLICITUD').AsString := CDSobservacionID_SOLICITUD.Value;
        IBQactualizar.ParamByName('ID_OBSERVACION').AsInteger := CDSobservacionID_OBSERVACION.Value;
        IBTransaction2.StartTransaction;
        IBQactualizar.ExecSQL;
        IBTransaction2.Commit;
        btnActualizar.Enabled := False;
        btnEditar.Enabled := True;
        CDSobservacion.Post;
        edMemo.ReadOnly := True;
end;

procedure TfrmEditarEstudioSolicitud.btnEditarClick(Sender: TObject);
begin
        CDSobservacion.Edit;
        edMemo.ReadOnly := False;
        btnEditar.Enabled := False;
        btnActualizar.Enabled := True;
end;

procedure TfrmEditarEstudioSolicitud.FormShow(Sender: TObject);
begin
        edSolicitud.SetFocus;
end;

procedure TfrmEditarEstudioSolicitud.CDSobservacionOBSERVACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
     if (CDSObservacionID_OBSERVACION.Value = 2) then
     begin
        Text := 'ENTREVISTA';
     end
     else
     begin
        Text := 'OBSERVACION';
     end;
end;

end.
