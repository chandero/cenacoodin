unit UnitActualizarFechasPersona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, ComCtrls;

type
  TfrmActualizarFechasPersona = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CBtiposid: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    EdNombre: TStaticText;
    Panel2: TPanel;
    CmdCerrar: TBitBtn;
    CmdActualizar: TBitBtn;
    CmdOtro: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edFechaUltimaActualizacion: TDateTimePicker;
    edFechaUltimaVerificacion: TDateTimePicker;
    edFechaUltimaValidacion: TDateTimePicker;
    procedure CmdOtroClick(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActualizarFechasPersona: TfrmActualizarFechasPersona;

implementation

{$R *.dfm}

procedure TfrmActualizarFechasPersona.CmdOtroClick(Sender: TObject);
begin
        EdNumeroIdentificacion.Text := '';
        CBtiposid.KeyValue := 0;
        EdNombre.Caption := '';
        CBtiposid.SetFocus;
        edFechaUltimaActualizacion.Date := Now;
        edFechaUltimaVerificacion.Date := Now;
        edFechaUltimaValidacion.Date := Now;
end;

procedure TfrmActualizarFechasPersona.EdNumeroIdentificacionExit(
  Sender: TObject);
begin
        with IBQuery2 do begin
           Transaction := IBTransaction1;
           IBTransaction1.Active := True;
           Close;
           SQL.Clear;
           SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE, FECHA_ACTUALIZACION from "gen$persona"');
           SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and');
           SQL.Add('ID_PERSONA = :ID_PERSONA');
           ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
           ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
           try
            Open;
            if RecordCount < 1 then begin
               MessageDlg('Persona No Existe!',mtError,[mbcancel],0);
               Transaction.Commit;
               Exit;
            end;
           except
            Transaction.Rollback;
            raise;
           end;

           EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                               FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                               FieldByName('NOMBRE').AsString;
           Transaction.Commit;
        end;

end;

end.
