unit UnitRegistroIncapacitados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, DBCtrls, DB, IBCustomDataSet, IBQuery,
  Buttons, ExtCtrls, IBDatabase;

type
  TFrmRegistroIncapacitados = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cbActual: TComboBox;
    cbNuevo: TComboBox;
    JvNumero: TJvEdit;
    JvNombre: TJvEdit;
    dbTipos: TDBLookupComboBox;
    DataSource1: TDataSource;
    IBTipos: TIBQuery;
    IBQuery1: TIBQuery;
    GroupBox4: TGroupBox;
    mObservacion: TMemo;
    GroupBox3: TGroupBox;
    mLog: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IBTransaction1: TIBTransaction;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JvNumeroExit(Sender: TObject);
    procedure dbTiposKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mObservacionExit(Sender: TObject);
  private
    _bActualiza :Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistroIncapacitados: TFrmRegistroIncapacitados;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmRegistroIncapacitados.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRegistroIncapacitados.FormCreate(Sender: TObject);
begin
        if IBTipos.Transaction.InTransaction then
           IBTipos.Transaction.Commit;
        IBTipos.Transaction.StartTransaction;
        IBTipos.Close;
        IBTipos.Open;
        IBTipos.Last;
        dbTipos.KeyValue := 3;
end;

procedure TFrmRegistroIncapacitados.JvNumeroExit(Sender: TObject);
begin
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$incapacitado".ESTADO,');
          SQL.Add('"gen$incapacitado".LOG');
          SQL.Add('FROM');
          SQL.Add('"gen$incapacitado"');
          SQL.Add('WHERE');
          SQL.Add('"gen$incapacitado".ID_IDENTIFICACION = :IDIDENTIFICACION AND');
          SQL.Add('"gen$incapacitado".ID_PERSONA = :IDPERSONA');
          ParamByName('IDIDENTIFICACION').AsInteger := dbTipos.KeyValue;
          ParamByName('IDPERSONA').AsString := JvNumero.Text;
          Open;
          if RecordCount = 0 then
          begin
            cbActual.ItemIndex := 0;
            cbNuevo.ItemIndex := 1;
            _bActualiza := False;
          end
          else
          begin
            cbActual.ItemIndex := FieldByName('ESTADO').AsInteger;
            if cbActual.ItemIndex = 1 then
               cbNuevo.ItemIndex := 0
            else
               cbNuevo.ItemIndex := 1;
            mLog.Text := FieldByName('LOG').AsString;
            _bActualiza := True;
          end;
          mObservacion.SetFocus;          
          Close;
          SQL.Clear;
          SQL.Add('SELECT NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO FROM "gen$persona" WHERE ID_PERSONA = :IDPERSONA AND ID_IDENTIFICACION = :IDIDENTIFICACION');
          ParamByName('IDIDENTIFICACION').AsInteger := dbTipos.KeyValue;
          ParamByName('IDPERSONA').AsString := JvNumero.Text;
          Open;
          if RecordCount = 0 then
          begin
            ShowMessage('Persona no Registrada en la base de datos....');
            dbTipos.SetFocus;
          end;
          JvNombre.Text := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
        end;
end;

procedure TFrmRegistroIncapacitados.dbTiposKeyPress(Sender: TObject;
  var Key: Char);
begin
        Entertabs(Key,Self);
end;

procedure TFrmRegistroIncapacitados.BitBtn3Click(Sender: TObject);
begin
        dbTipos.SetFocus;
        JvNumero.Text := '';
        JvNombre.Text := '';
        mObservacion.Text := '';
        mLog.Text := '';
end;

procedure TFrmRegistroIncapacitados.BitBtn1Click(Sender: TObject);
var
        _sLog :string;
begin
        if MessageDlg('Esta seguro(a) de Realizar la Transacción',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          if _bActualiza then
          begin
            SQL.Add('UPDATE');
            SQL.Add('  "gen$incapacitado"');
            SQL.Add('SET');
            SQL.Add('  ESTADO = :ESTADO,');
            SQL.Add('  LOG = :LOG');
            SQL.Add('WHERE');
            SQL.Add('  "gen$incapacitado".ID_IDENTIFICACION = :ID AND');
            SQL.Add('  "gen$incapacitado".ID_PERSONA = :IDPERSONA');
            _sLog := mLog.Text + '  ' + FormatDateTime('yyyy/mm/dd',Date) + '-' + DBAlias + '-->> '  + mObservacion.Text;
          end
          else
          begin
            SQL.Add('INSERT INTO');
            SQL.Add('"gen$incapacitado"(');
            SQL.Add('ID_IDENTIFICACION,');
            SQL.Add('ID_PERSONA,');
            SQL.Add('ESTADO,');
            SQL.Add('LOG)');
            SQL.Add('VALUES(');
            SQL.Add(':ID,');
            SQL.Add(':IDPERSONA,');
            SQL.Add(':ESTADO,');
            SQL.Add(':LOG)');
            _sLog := FormatDateTime('yyyy/mm/dd',Date) + '-' + DBAlias + '-->>' + mObservacion.Text;
          end;
          ParamByName('ID').AsInteger := dbTipos.KeyValue;
          ParamByName('IDPERSONA').AsString := JvNumero.Text;
          ParamByName('ESTADO').AsInteger := cbNuevo.ItemIndex;
          ParamByName('LOG').AsString := _sLog;
          Execsql;
          Transaction.Commit;
          Transaction.StartTransaction;
          ShowMessage('Transacción Realizada con Exito');
          BitBtn3.Click;
        end;
end;

procedure TFrmRegistroIncapacitados.mObservacionExit(Sender: TObject);
begin
        mObservacion.Text := UpperCase(mObservacion.Text);
end;

end.
