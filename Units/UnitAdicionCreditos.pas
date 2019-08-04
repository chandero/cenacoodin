unit UnitAdicionCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Grids, DBGrids, StdCtrls, JvTypedEdit, JvEdit,
  Buttons;

type
  TFrmAdicionCreditos = class(TForm)
    DBcreditos: TDBGrid;
    DScreditos: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Ednombre: TEdit;
    CBgarantia: TComboBox;
    CBdesicion: TComboBox;
    JVvalor: TJvCurrencyEdit;
    JVplazo: TJvIntegerEdit;
    EDcuenta: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBcreditosCellClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdnombreKeyPress(Sender: TObject; var Key: Char);
    procedure EDcuentaKeyPress(Sender: TObject; var Key: Char);
    procedure JVvalorKeyPress(Sender: TObject; var Key: Char);
    procedure JVplazoKeyPress(Sender: TObject; var Key: Char);
    procedure CBgarantiaKeyPress(Sender: TObject; var Key: Char);
    procedure CBdesicionKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure CBgarantiaExit(Sender: TObject);
    procedure CBdesicionExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JVvalorEnter(Sender: TObject);
  private
    { Private declarations }
  public
  modificar: Boolean;
    id_estado: integer;
    id_garantia: integer;
  published
    procedure limpiar;
    { Public declarations }
  end;

var
  FrmAdicionCreditos: TFrmAdicionCreditos;

implementation
uses     UnitActa, UnitGlobales, UnitMain;

{$R *.dfm}

procedure TFrmAdicionCreditos.BitBtn1Click(Sender: TObject);
begin
        if (EDcuenta.Text <> '') and (Ednombre.Text <> '') then
        begin
          with FrmActa do
          begin
             CDsolicitud.Append;
             CDsolicitud.FieldValues['cuenta'] := EDcuenta.Text;
             CDsolicitud.FieldValues['nombres'] := Ednombre.Text;
             CDsolicitud.FieldValues['valor'] := JVvalor.Value;
             CDsolicitud.FieldValues['garantia'] := CBgarantia.Text;
             CDsolicitud.FieldValues['plazo'] := JVplazo.Value;
             CDsolicitud.FieldValues['decision'] := CBdesicion.Text;
             CDsolicitud.post;
          end;
          with frmMain do
          begin
            CDinforme.Append;
            CDinformevalor.Value := JVvalor.Value;
            CDinformenombres.Value := Ednombre.Text;
            CDinformedes_estado.Value := CBdesicion.Text;
            CDinformeestado.Value := id_estado;
            CDinformeid_ente.Value := Id_EnteAprobador;
            CDinformeid_oficina.Value := Agencia;
            CDinformegarantia.Value := id_garantia;
            CDinformecuenta.Value := EDcuenta.Text;
            CDinforme.Post;
          end;
          limpiar;
        end;
end;

procedure TFrmAdicionCreditos.limpiar;
begin
        Ednombre.Text := '';
        EDcuenta.Text := '';
        JVvalor.Value := 0;
        JVplazo.Value := 0;
        CBgarantia.ItemIndex := -1;
        CBdesicion.ItemIndex := 0;
        Ednombre.SetFocus;
end;

procedure TFrmAdicionCreditos.DBcreditosCellClick(Column: TColumn);
begin
        with FrmActa do
        begin
          if CDsolicitudnombres.Value <> '' then
          begin
            Ednombre.Text := CDsolicitudnombres.Value;
            EDcuenta.Text := CDsolicitudcuenta.Value;
            JVvalor.Value := CDsolicitudvalor.Value;
            JVplazo.Value := CDsolicitudplazo.Value;
            CBgarantia.Text := CDsolicitudgarantia.Value;
            CBdesicion.Text := CDsolicituddecision.Value;
            BitBtn2.Enabled := True;
          end;
        end;
end;

procedure TFrmAdicionCreditos.BitBtn2Click(Sender: TObject);
begin
        FrmActa.CDsolicitud.Delete;
        BitBtn1.Click;
        BitBtn2.Enabled := False;
end;

procedure TFrmAdicionCreditos.EdnombreKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAdicionCreditos.EDcuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAdicionCreditos.JVvalorKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAdicionCreditos.JVplazoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
          CBgarantia.SetFocus
end;

procedure TFrmAdicionCreditos.CBgarantiaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAdicionCreditos.CBdesicionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAdicionCreditos.BitBtn3Click(Sender: TObject);
begin
        try
          FrmActa.CDsolicitud.Delete;
        except
          MessageDlg('No Existen Registros a Eliminar',mtInformation,[mbok],0);
        end;


end;

procedure TFrmAdicionCreditos.CBgarantiaExit(Sender: TObject);
begin
        if CBgarantia.Text = 'PERSONAL' then
           id_garantia := 2
        else
           id_garantia := 1;
end;

procedure TFrmAdicionCreditos.CBdesicionExit(Sender: TObject);
begin
        if CBdesicion.Text = 'APROBADA' then
           id_estado := 4
        else if CBdesicion.Text = 'APLAZADA' then
           id_estado := 9
        else
           id_estado := 7
end;

procedure TFrmAdicionCreditos.FormCreate(Sender: TObject);
begin
        
        CBdesicion.ItemIndex := 0;
end;

procedure TFrmAdicionCreditos.JVvalorEnter(Sender: TObject);
begin
        JVvalor.SelectAll
end;

end.
