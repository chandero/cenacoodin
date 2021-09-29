unit UnitObservacionAnalisis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvLabel, Mask, ExtCtrls, JvStaticText, Buttons;

type
  TFrmObservacionAnalisis = class(TForm)
    Panel1: TPanel;
    MKsolicitud: TMaskEdit;
    JvLabel1: TJvLabel;
    Label1: TLabel;
    Label2: TLabel;
    JVfecha: TJvStaticText;
    JVnombre: TJvStaticText;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    nuevo: TSpeedButton;
    cerrar: TSpeedButton;
    procedure MKsolicitudKeyPress(Sender: TObject; var Key: Char);
    procedure MKsolicitudExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cerrarClick(Sender: TObject);
    procedure nuevoClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
  opcion :Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmObservacionAnalisis: TFrmObservacionAnalisis;

implementation
uses UnitGlobales, UnitDmSolicitud;

{$R *.dfm}

procedure TFrmObservacionAnalisis.MKsolicitudKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmObservacionAnalisis.MKsolicitudExit(Sender: TObject);
begin
        with DmSolicitud.IBSolicitud1 do
        begin
          opcion := True;
          BitBtn3.Caption := '&Registrar';
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$solicitud".FECHA_RECEPCION,');
          SQL.Add('"col$solicitud".OBSERVACION,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD) AND');
          SQL.Add('("col$solicitud".ESTADO IN (1,2,3,8,13))');
          ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
          Open;
          if RecordCount <> 0 then
          begin
            BitBtn3.Enabled := True;
            JVnombre.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
            JVfecha.Caption := DateToStr(FieldByName('FECHA_RECEPCION').AsDateTime);
            Memo1.Text := FieldByName('OBSERVACION').AsString;
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('"col$solicitudanalista".PENDIENTE');
            SQL.Add('FROM');
            SQL.Add('"col$solicitudanalista"');
            SQL.Add('WHERE');
            SQL.Add('("col$solicitudanalista".ID_SOLICITUD = :ID_SOLICITUD) AND');
            SQL.Add('("col$solicitudanalista".ES_VIGENTE = 1)');
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            Open;
            if FieldByName('PENDIENTE').AsInteger = 1 then
            begin
              BitBtn3.Caption := '&Desmarcar';
              opcion := False;
            end;
          end
          else
          begin
            MKsolicitud.SetFocus;
          end;
        end;
end;

procedure TFrmObservacionAnalisis.FormCreate(Sender: TObject);
begin
        DmSolicitud := TDmSolicitud.Create(self);
end;

procedure TFrmObservacionAnalisis.cerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmObservacionAnalisis.nuevoClick(Sender: TObject);
begin
        MKsolicitud.Text := '';
        JVnombre.Caption := '';
        JVfecha.Caption := '';
        Memo1.Text := '';
        BitBtn3.Enabled := False;
        MKsolicitud.SetFocus;
end;

procedure TFrmObservacionAnalisis.Memo1Change(Sender: TObject);
begin
        //Memo1.Text := UpperCase(Memo1.Text);
end;

procedure TFrmObservacionAnalisis.Memo1Exit(Sender: TObject);
begin
        Memo1.Text := UpperCase(Memo1.Text);
end;

procedure TFrmObservacionAnalisis.BitBtn3Click(Sender: TObject);
begin
          if opcion then
          begin
          with DmSolicitud.IBSolicitud1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('update "col$solicitud" set');
            SQL.Add('OBSERVACION = :OBSERVACION');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD');
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            ParamByName('OBSERVACION').AsString := Memo1.Text;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Add('update "col$solicitudanalista" set PENDIENTE = 1');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and ES_VIGENTE = 1 ');
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            ExecSQL;
            Transaction.Commit;
          end;
              MessageDlg('Observación Registrada con Exito.',mtInformation,[mbok],0);
              nuevo.Click;
        end
        else
        begin
          with DmSolicitud.IBSolicitud1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('update "col$solicitudanalista" set PENDIENTE = 0');
            SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and ES_VIGENTE = 1 ');
            ParamByName('ID_SOLICITUD').AsString := MKsolicitud.Text;
            ExecSQL;
            Transaction.Commit;
          end;
              MessageDlg('Solicitud Descargada Con Exito.',mtInformation,[mbok],0);
              nuevo.Click;

        end;
end;

end.
