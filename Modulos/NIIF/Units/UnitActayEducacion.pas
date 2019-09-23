unit UnitActayEducacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, DB, IBCustomDataSet,
  IBQuery, IBDatabase;

type
  TfrmActayEducacion = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CBtiposid: TDBLookupComboBox;
    Label2: TLabel;
    EdNumeroIdentificacion: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    EdEducacion: TCheckBox;
    EdActa: TEdit;
    Label3: TLabel;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    CmdCerrar: TBitBtn;
    CmdActualizar: TBitBtn;
    CmdOtro: TBitBtn;
    IBTransaction1: TIBTransaction;
    EdNombre: TStaticText;
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure CmdOtroClick(Sender: TObject);
    procedure CmdActualizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActayEducacion: TfrmActayEducacion;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmActayEducacion.EdNumeroIdentificacionExit(Sender: TObject);
begin
        with IBQuery2 do begin
           Transaction := IBTransaction1;
           IBTransaction1.Active := True;
           Close;
           SQL.Clear;
           SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,EDUCACION,ACTA from "gen$persona"');
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
           EdEducacion.Checked := InttoBoolean(FieldByName('EDUCACION').AsInteger);
           EdActa.Text := FieldByName('ACTA').AsString;
           Transaction.Commit;
        end;
end;

procedure TfrmActayEducacion.CmdOtroClick(Sender: TObject);
begin
        EdNumeroIdentificacion.Text := '';
        CBtiposid.KeyValue := 0;
        EdNombre.Caption := '';
        EdEducacion.Checked := False;
        EdActa.Text := '';
        CBtiposid.SetFocus;
end;

procedure TfrmActayEducacion.CmdActualizarClick(Sender: TObject);
begin
        with IBQuery2 do begin
          IBTransaction1.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('update "gen$persona" SET EDUCACION = :EDUCACION,');
          SQL.Add('ACTA = :ACTA where ID_IDENTIFICACION = :ID_IDENTIFICACION and');
          SQL.Add('ID_PERSONA = :ID_PERSONA');
          ParamByName('EDUCACION').AsInteger := BooleanoToInt(EdEducacion.Checked);
          ParamByName('ACTA').AsString := EdActa.Text;
          ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
          try
           ExecSQL;
           if IBQuery2.RowsAffected > 0 then begin
              Transaction.Commit;
              MessageDlg('Registro Actualizado',mtInformation,[mbok],0);
              end
           else
            begin
              Transaction.Rollback;
              MessageDlg('Registro no se actualizó',mtError,[mbcancel],0);
            end;
          except
            Transaction.Rollback;
            raise;
          end;
        end;

end;

procedure TfrmActayEducacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmActayEducacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmActayEducacion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        IBQuery1.Transaction.Commit;
end;

procedure TfrmActayEducacion.FormCreate(Sender: TObject);
begin
        if IBQuery1.Transaction.InTransaction then
           IBQuery1.Transaction.Rollback;
        IBQuery1.Transaction.StartTransaction;
        IBQuery1.Open;
        IBQuery1.Last;
end;

end.
