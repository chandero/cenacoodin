unit UnitActivarImagenes;

interface

uses
  Clipbrd, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmActivarImagenes = class(TForm)
    GroupBox8: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    CBTiposIdentificacion: TDBLookupComboBox;
    EdIdentificacion: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    DBImage1: TDBImage;
    DBImage2: TDBImage;
    DBImage3: TDBImage;
    GroupBox1: TGroupBox;
    chkFoto: TCheckBox;
    chkFirma: TCheckBox;
    chkHuella: TCheckBox;
    Panel3: TPanel;
    btnAplicar: TBitBtn;
    btnCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    btnOtro: TBitBtn;
    EdNombre: TEdit;
    Label1: TLabel;
    IBSQL2: TIBSQL;
    DataSource2: TDataSource;
    IBQuery2: TIBQuery;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdIdentificacionExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBImage1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBImage2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBImage3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOtroClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActivarImagenes: TfrmActivarImagenes;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales;

procedure TfrmActivarImagenes.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmActivarImagenes.Inicializar;
begin
        if IBQuery2.Transaction.InTransaction then
           IBQuery2.Transaction.Rollback;
        IBQuery2.Transaction.StartTransaction;

        IBQuery1.Open;
        IBQuery1.Last;
        IBQuery1.First;
        CBTiposIdentificacion.KeyValue := 1;
        EdNombre.Text := '';
        EdIdentificacion.Text := '';
        chkFoto.Checked := False;
        chkFirma.Checked := False;
        chkHuella.Checked := False;
end;

procedure TfrmActivarImagenes.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmActivarImagenes.EdIdentificacionExit(Sender: TObject);
begin
        with IBQuery2 do begin
         Close;
         SQL.Clear;
         SQL.Add('select (PRIMER_APELLIDO || '' '' || SEGUNDO_APELLIDO || '' '' || NOMBRE) AS NOMBRE,FOTO,FIRMA,FOTO_HUELLA, DATOS_HUELLA from "gen$persona" where');
         SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
         ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
         ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
         try
          Open;
         except
          Transaction.Rollback;
          raise;
         end;

         EdNombre.Text := FieldByName('NOMBRE').AsString;
        end; 
        GroupBox8.Enabled := False;
end;

procedure TfrmActivarImagenes.FormCreate(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmActivarImagenes.DBImage1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;
end;

procedure TfrmActivarImagenes.DBImage2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;
end;

procedure TfrmActivarImagenes.DBImage3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if ssCtrl in Shift then begin
          MessageDlg('No puede realizar procesos de copiar o cortar',mtError,[mbcancel],0);
          Clipboard.Clear;
        end;
end;

procedure TfrmActivarImagenes.btnOtroClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmActivarImagenes.btnAplicarClick(Sender: TObject);
begin

        if MessageDlg('Seguro de Aplicar la Selección',mtConfirmation,[mbyes,mbno],0) <> mryes then Exit;

        with IBSQL2 do begin
        if chkFoto.Checked then begin
          Close;
          SQL.Clear;
          SQL.Add('update "gen$persona" set FOTO = NULL where');
          SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        if chkFirma.Checked then begin
          Close;
          SQL.Clear;
          SQL.Add('update "gen$persona" set FIRMA = NULL where');
          SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        if chkHuella.Checked then begin
          Close;
          SQL.Clear;
          SQL.Add('update "gen$persona" set FOTO_HUELLA = NULL, DATOS_HUELLA = NULL where');
          SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
          ParamByName('ID_IDENTIFICACION').AsInteger := CBTiposIdentificacion.KeyValue;
          ParamByName('ID_PERSONA').AsString := EdIdentificacion.Text;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           raise;
          end;
        end;
        Transaction.Commit;
        end;

        MessageDlg('Aplicación Finalizada con Exito!',mtInformation,[mbok],0);
        Inicializar;
end;

end.
