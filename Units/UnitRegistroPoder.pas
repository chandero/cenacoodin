unit UnitRegistroPoder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, JvEdit, IBSQL, IBCustomDataSet, IBQuery, IBDatabase;

type
  TFrmRegistroPoder = class(TForm)
    DSpoder: TDataSource;
    CDpoder: TClientDataSet;
    CDpoderid_persona: TStringField;
    CDpoderid_identificacion: TSmallintField;
    CDpoderid_personapoder: TStringField;
    CDpoderid_identificacionpoder: TSmallintField;
    CDpodernombres: TStringField;
    CDpodernombrespoder: TStringField;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    BTagregar: TBitBtn;
    BTRegistrar: TBitBtn;
    BTeliminar: TBitBtn;
    BTlimpiar: TBitBtn;
    IBSQL1: TIBSQL;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    DBtipo: TDBLookupComboBox;
    Label2: TLabel;
    JVnumero: TJvEdit;
    Npo: TLabel;
    EDnombre: TEdit;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBtipoP: TDBLookupComboBox;
    EDnombreP: TEdit;
    JVnumeroP: TJvEdit;
    IBtipo: TIBQuery;
    DStipo: TDataSource;
    BTcerrar: TBitBtn;
    IBTransaction1: TIBTransaction;
    procedure BTlimpiarClick(Sender: TObject);
    procedure JVnumeroExit(Sender: TObject);
    procedure JVnumeroPExit(Sender: TObject);
    procedure DBtipoKeyPress(Sender: TObject; var Key: Char);
    procedure JVnumeroKeyPress(Sender: TObject; var Key: Char);
    procedure DBtipoPKeyPress(Sender: TObject; var Key: Char);
    procedure JVnumeroPKeyPress(Sender: TObject; var Key: Char);
    procedure EDnombrePKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure EDnombreKeyPress(Sender: TObject; var Key: Char);
    procedure DBtipoEnter(Sender: TObject);
    procedure DBtipoPEnter(Sender: TObject);
    procedure BTcerrarClick(Sender: TObject);
    procedure BTagregarClick(Sender: TObject);
    procedure BTeliminarClick(Sender: TObject);
    procedure BTRegistrarClick(Sender: TObject);
  private
  a :Integer;
    function BuscaPersona(id_persona: string;
      id_identificacion: integer): string;
    function ValidaPersona(id_persona: string;
      id_identificacion: integer): boolean;
  
    { Private declarations }
  public
    id_colocacion: string;  
  published

    { Public declarations }
  end;

var
  FrmRegistroPoder: TFrmRegistroPoder;

implementation
uses UnitGlobales, UnitdmGeneral, UnitCreaciondePersona;

{$R *.dfm}

procedure TFrmRegistroPoder.BTlimpiarClick(Sender: TObject);
begin
        DBtipo.KeyValue := -1;
        JVnumero.Text := '';
        EDnombre.Text := '';
        dbtipop.KeyValue := -1;
        jvnumerop.Text := '';
        ednombrep.Text := '';
        DBtipo.SetFocus;
end;

function TFrmRegistroPoder.BuscaPersona(id_persona: string;
  id_identificacion: integer): string;
begin
        with IBSQL1 do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT');
           SQL.Add('"gen$persona".NOMBRE,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
           SQL.Add('FROM');
           SQL.Add('"gen$persona"');
           SQL.Add('WHERE');
           SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
           SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA)');
           ParamByName('ID_PERSONA').AsString := id_persona;
           ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
           ExecQuery;
           if RecordCount = 0 then
               Result := ''
           else
               Result := FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString + ' ' + FieldByName('NOMBRE').AsString;
        end;

end;

procedure TFrmRegistroPoder.JVnumeroExit(Sender: TObject);
begin
        if JVnumero.Text = '' then
           Exit;
        if ValidaPersona(JVnumero.Text,DBtipo.KeyValue) then
           EDnombre.Text := BuscaPersona(JVnumero.Text,DBtipo.KeyValue)
        else
        begin
           MessageDlg('La Persona no se Encuentra en la Colocación No ' + id_colocacion,mtInformation,[mbok],0);
           DBtipo.SetFocus;
        end;
end;

procedure TFrmRegistroPoder.JVnumeroPExit(Sender: TObject);
begin
        EDnombrep.Text := BuscaPersona(JVnumerop.Text,DBtipop.KeyValue);
        if ednombrep.Text = '' then
          if MessageDlg('No se Encuentra en la Base de Datos, Desea Registrarla?',mtInformation,[mbyes,mbno],0) = mryes then
          begin
                frmCreacionPersona := TfrmCreacionPersona.Create(Self);
                frmCreacionPersona.Id := DBtipop.KeyValue;
                frmCreacionPersona.Documento := jvnumerop.Text;
                frmCreacionPersona.ShowModal;
                JVnumerop.SetFocus;

          end;
end;

procedure TFrmRegistroPoder.DBtipoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRegistroPoder.JVnumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRegistroPoder.DBtipoPKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRegistroPoder.JVnumeroPKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRegistroPoder.EDnombrePKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRegistroPoder.FormCreate(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        IBtipo.Close;
        IBtipo.Open;
        IBtipo.Last;
end;

procedure TFrmRegistroPoder.EDnombreKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRegistroPoder.DBtipoEnter(Sender: TObject);
begin
        DBtipo.DropDown
end;

procedure TFrmRegistroPoder.DBtipoPEnter(Sender: TObject);
begin
        dbtipop.DropDown
end;

procedure TFrmRegistroPoder.BTcerrarClick(Sender: TObject);
begin
        if CDpoder.RecordCount = 0 then
           Close
        else
           if MessageDlg('Esta Seguro de Salir Sin Guardar Cambios?',mtinformation,[mbyes,mbno],0) = mryes then
           begin
             CDpoder.CancelUpdates;
             Close;
           end;
end;

procedure TFrmRegistroPoder.BTagregarClick(Sender: TObject);
begin
        if (EDnombre.Text <> '') and (ednombrep.Text <> '') then
        begin
          with CDpoder do
          begin
             Append;
             FieldValues['id_persona'] := JVnumero.Text;
             FieldValues['id_identificacion'] := DBtipo.KeyValue;
             FieldValues['nombres'] := EDnombre.Text;
             FieldValues['id_personapoder'] := jvnumerop.Text;
             FieldValues['id_identificacionpoder'] := dbtipop.KeyValue;
             FieldValues['nombrespoder'] :=ednombrep.Text;
             Post;
          end;
          BTlimpiar.Click;
        end;
end;

procedure TFrmRegistroPoder.BTeliminarClick(Sender: TObject);
begin
        try
          CDpoder.Delete;
        except
          MessageDlg('No Existen Datos Para Eliminar',mtinformation,[mbok],0);
        end;
end;

procedure TFrmRegistroPoder.BTRegistrarClick(Sender: TObject);
begin
        with IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$colocacionpoder" where ID_COLOCACION = :ID_COLOCACION');
          ParamByName('ID_COLOCACION').AsString := id_colocacion;
          ExecQuery;
          if RecordCount > 0 then
          begin
            Close;
            SQL.Clear;
            SQL.Add('delete from "col$colocacionpoder" where ID_COLOCACION = :ID_COLOCACION');
            ParamByName('ID_COLOCACION').AsString := id_colocacion;
            ExecQuery;
            Transaction.CommitRetaining;
          end;
          Close;
          SQL.Clear;
          SQL.Add('insert into "col$colocacionpoder" values (:ID_COLOCACION,:ID_PERSONA,:ID_IDENTIFICACION,');
          SQL.Add(':ID_PERSONAPODER,:ID_IDENTIFICACIONPODER,0)');
          CDpoder.First;
          while not CDpoder.Eof do
          begin
             ParamByName('ID_COLOCACION').AsString := id_colocacion;
             ParamByName('ID_PERSONA').AsString := CDpoder.FieldByName('id_persona').AsString;
             ParamByName('ID_IDENTIFICACION').AsInteger := CDpoder.FieldByName('id_identificacion').AsInteger;
             ParamByName('ID_PERSONAPODER').AsString := CDpoder.FieldByName('id_personapoder').AsString;
             ParamByName('ID_IDENTIFICACIONPODER').AsInteger := CDpoder.FieldByName('id_identificacionpoder').AsInteger;
             ExecQuery;
             CDpoder.Next;
          end;
          Transaction.Commit;
        end;
        MessageDlg('Registros Grabados Correctamente',mtInformation,[mbok],0);
        Close;
end;

function TFrmRegistroPoder.ValidaPersona(id_persona: string;
  id_identificacion: integer): boolean;
var     resultado :Boolean;
begin
        Result := False;
        with IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select ID_PERSONA,ID_IDENTIFICACION from "col$colocacion" where ID_COLOCACION = :ID_COLOCACION and');
          SQL.Add('ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_COLOCACION').AsString := id_colocacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ExecQuery;
          if RecordCount <> 0 then
          begin
              Result := True;
              Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('select ID_PERSONA,ID_IDENTIFICACION from "col$colgarantias" where ID_COLOCACION = :ID_COLOCACION and');
          SQL.Add('ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_COLOCACION').AsString := id_colocacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ExecQuery;
          if RecordCount <> 0 then
          begin
             Result := True;
             Exit;
          end;
        end;
end;

end.
