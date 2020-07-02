unit UnitGestionTercero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery, Mask, JvEdit,
  JvTypedEdit, Buttons, ExtCtrls, unitDmGeneral, IBDatabase, DateUtils, UnitGlobales,
  JvToolEdit, JvCurrEdit;

type
  TfrmGestionTercero = class(TForm)
    IBQQuery: TIBQuery;
    Label1: TLabel;
    edTipoDocumento: TDBLookupComboBox;
    Label2: TLabel;
    edDocumento: TEdit;
    lblNombre: TLabel;
    Label4: TLabel;
    edCodigo: TMaskEdit;
    lblPrimerApellido: TLabel;
    lblSegundoApellido: TLabel;
    Label3: TLabel;
    edAnho: TJvYearEdit;
    Label5: TLabel;
    btnBuscar: TBitBtn;
    Panel1: TPanel;
    btnGuardar: TBitBtn;
    btnCerrar: TBitBtn;
    btnNuevo: TBitBtn;
    DSTipoDocumento: TDataSource;
    IBQTipoDocumento: TIBQuery;
    IBTGuardar: TIBTransaction;
    IBQGuardar: TIBQuery;
    lblCodigo: TLabel;
    btnEliminar: TBitBtn;
    EdSaldoInicial: TJvxCurrencyEdit;
    Label16: TLabel;
    EdSaldoActual: TJvCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure edDocumentoExit(Sender: TObject);
    procedure edTipoDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure edDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edAnhoKeyPress(Sender: TObject; var Key: Char);
    procedure edSaldoInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edAnhoExit(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEliminarClick(Sender: TObject);
  private
      procedure Inicializar;
    { Private declarations }
  public
  published

    { Public declarations }
  end;

var
  frmGestionTercero: TfrmGestionTercero;
  dmGeneral: TdmGeneral;
  Nuevo: Boolean;
  Persona: Boolean;
  Anho: Boolean;
  Codigo: Boolean;
  Id: integer;

implementation

{$R *.dfm}

procedure TfrmGestionTercero.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQQuery.Database := dmGeneral.IBDatabase1;
        IBQTipoDocumento.Database := dmGeneral.IBDatabase1;

        IBQQuery.Transaction := dmGeneral.IBTransaction1;
        IBQTipoDocumento.Transaction := dmGeneral.IBTransaction1;

        IBTGuardar.DefaultDatabase := dmGeneral.IBDatabase1;
        
        IBQGuardar.Database := dmGeneral.IBDatabase1;
        IBQGuardar.Transaction := IBTGuardar;


end;

procedure TfrmGestionTercero.btnBuscarClick(Sender: TObject);
var Cadena,Code: String;
FechaInicial, FechaFinal: TDate;
begin
        Cadena := edCodigo.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        Code := Cadena;
        if (IBTGuardar.InTransaction) then
          IBTGuardar.Rollback;
        IBTGuardar.StartTransaction;
        with IBQGuardar do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from "con$tercerosaldoinicial" where');
            SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and');
            SQL.Add('ID_PERSONA = :ID_PERSONA and ');
            SQL.Add('CODIGO = :CODIGO and ');
            SQL.Add('ANHO = :ANHO');
            ParamByName('ID_IDENTIFICACION').AsInteger := edTipoDocumento.KeyValue;
            ParamByName('ID_PERSONA').AsString := edDocumento.Text;
            ParamByName('CODIGO').AsString := Code;
            ParamByName('ANHO').AsInteger := edAnho.Value;
            Open;
            If (RecordCount > 0) then
            begin
                edSaldoInicial.Value := FieldByName('SALDO').AsCurrency;
                Id := FieldByName('ID').AsInteger;
                Self.Caption := 'Gestión Tercero Saldo Inicial ' + 'ID:'+ IntToStr(Id);
                Nuevo := false;
                btnEliminar.Enabled := True;
                Close;
                SQL.Clear;
                SQL.Add('Select ');
                SQL.Add('SUM("con$auxiliar".DEBITO - "con$auxiliar".CREDITO) AS MOVIMIENTO');
                SQL.Add('from "con$auxiliar"');
                SQL.Add('where ');
                SQL.Add('("con$auxiliar".ID_AGENCIA =:"ID_AGENCIA") and');
                SQL.Add('("con$auxiliar".CODIGO =:"CODIGO") and');
                SQL.Add('("con$auxiliar".FECHA BETWEEN :"FECHA_INICIAL" and :"FECHA_FINAL") and');
                SQL.Add('("con$auxiliar".ID_IDENTIFICACION = :ID_IDENTIFICACION) and ');
                SQL.Add('("con$auxiliar".ID_PERSONA = :ID_PERSONA) and ');
                SQL.Add('("con$auxiliar".ESTADOAUX = :"ESTADOAUX")');
                ParamByName('ESTADOAUX').AsString := 'C';
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('CODIGO').AsString := Code;
                FechaInicial := EncodeDate(edAnho.Value,01,01);
                FechaFinal := EncodeDate(edAnho.Value,12,31);
                ParamByName('FECHA_INICIAL').AsDate := FechaInicial;
                ParamByName('FECHA_FINAL').AsDate := FechaFinal;
                ParamByName('ID_IDENTIFICACION').AsInteger := edTipoDocumento.KeyValue;
                ParamByName('ID_PERSONA').AsString := edDocumento.Text;
                Open;
                EdSaldoActual.Value := EdSaldoInicial.Value + FieldByName('MOVIMIENTO').AsCurrency;
            end
            else
            begin
               Nuevo := True;
               btnEliminar.Enabled := False;
            end;
        end;
        IBTGuardar.Commit;
end;

procedure TfrmGestionTercero.btnNuevoClick(Sender: TObject);
begin
        Nuevo := True;
        Inicializar;
end;

procedure TfrmGestionTercero.FormShow(Sender: TObject);
begin
        IBQTipoDocumento.Open;
        Inicializar;
end;

procedure TfrmGestionTercero.btnGuardarClick(Sender: TObject);
var Cadena,Code: String;
begin
        Cadena := edCodigo.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        Code := Cadena;

        if (not Persona) or (not Codigo) or (not Anho) then
        begin
             MessageDlg('Faltan valores, por favor rectifique!!', mtWarning, [mbOk],0);
             Exit;
        end;

        if (Nuevo) then
        begin
                if (IBTGuardar.InTransaction) then
                  IBTGuardar.Rollback;
                IBTGuardar.StartTransaction;
                IBQGuardar.Close;
                IBQGuardar.SQL.Clear;
                IBQGuardar.SQL.Add('INSERT INTO "con$tercerosaldoinicial" ');
                IBQGuardar.SQL.Add('(ID_IDENTIFICACION, ID_PERSONA, CODIGO, ANHO, SALDO, ID)');
                IBQGuardar.SQL.Add('VALUES (:ID_IDENTIFICACION, :ID_PERSONA, :CODIGO, :ANHO, :SALDO, :ID)');
                IBQGuardar.ParamByName('ID_IDENTIFICACION').AsInteger := edTipoDocumento.KeyValue;
                IBQGuardar.ParamByName('ID_PERSONA').AsString := edDocumento.Text;
                IBQGuardar.ParamByName('CODIGO').AsString := Code;
                IBQGuardar.ParamByName('ANHO').AsInteger := edAnho.Value;
                IBQGuardar.ParamByName('SALDO').AsCurrency := edSaldoInicial.Value;
                IBQGuardar.ParamByName('ID').Clear;
                IBQGuardar.ExecSQL;
                IBQGuardar.Transaction.Commit;
                btnBuscarClick(btnBuscar);
        end
        else
        begin
                if (IBTGuardar.InTransaction) then
                  IBTGuardar.Rollback;
                IBTGuardar.StartTransaction;
                IBQGuardar.Close;
                IBQGuardar.SQL.Clear;
                IBQGuardar.SQL.Add('UPDATE "con$tercerosaldoinicial" ');
                IBQGuardar.SQL.Add('SET SALDO = :SALDO');
                IBQGuardar.SQL.Add('WHERE ID = :ID');
                IBQGuardar.ParamByName('ID').AsInteger := Id;
                IBQGuardar.ParamByName('SALDO').AsCurrency := edSaldoInicial.Value;
                IBQGuardar.ExecSQL;
                IBQGuardar.Transaction.Commit;
        end;
        MessageDlg('Guardado con Exito!',mtInformation,[mbOk],0);
end;

procedure TfrmGestionTercero.Inicializar;
begin
        edTipoDocumento.KeyValue := -1;
        edDocumento.Text := '';
        edCodigo.Text := '';
        edAnho.Value := YearOf(fFechaActual);
        edSaldoInicial.Value := 0.0;
        EdSaldoActual.Value := 0.0;
        lblNombre.Caption := '';
        lblPrimerApellido.Caption := '';
        lblSegundoApellido.Caption := '';
        lblCodigo.Caption := '';
        btnGuardar.Enabled := False;
        btnEliminar.Enabled := False;
end;

procedure TfrmGestionTercero.edCodigoExit(Sender: TObject);
var Cadena,Code: String;
begin
        Codigo := False;
        Cadena := edCodigo.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        Code := Cadena;
        IBQQuery.Close;
        IBQQuery.SQL.Clear;
        IBQQuery.SQL.Add('select * from "con$puc" where CODIGO = :CODIGO');
        IBQQuery.ParamByName('CODIGO').AsString := Code;
        IBQQuery.Open;
        If (IBQQuery.RecordCount > 0) then
        begin
         lblCodigo.Caption := IBQQuery.FieldByName('NOMBRE').AsString;
         Codigo := True;
        end
        else
         lblCodigo.Caption := 'Código no existe!';

end;

procedure TfrmGestionTercero.edDocumentoExit(Sender: TObject);
begin
        Persona := False;
        IBQQuery.Close;
        IBQQuery.SQL.Clear;
        IBQQuery.SQL.Add('select * from "gen$persona" where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
        IBQQuery.ParamByName('ID_IDENTIFICACION').AsInteger := edTipoDocumento.KeyValue;
        IBQQuery.ParamByName('ID_PERSONA').AsString := edDocumento.Text;
        IBQQuery.Open;
        if (IBQQuery.RecordCount > 0 ) then
        begin
            lblNombre.Caption := IBQQuery.FieldByName('NOMBRE').AsString;
            lblPrimerApellido.Caption := IBQQuery.FieldByName('PRIMER_APELLIDO').AsString;
            lblSegundoApellido.Caption := IBQQuery.FieldByName('SEGUNDO_APELLIDO').AsString;
            Persona := True;
        end
        else
           lblNombre.Caption := 'Persona no existe!!';
end;

procedure TfrmGestionTercero.edTipoDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmGestionTercero.edDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmGestionTercero.edCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmGestionTercero.edAnhoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmGestionTercero.edSaldoInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key, Self);
end;

procedure TfrmGestionTercero.edAnhoExit(Sender: TObject);
begin
        Anho := False;
        if (edAnho.Value > 2000) then Anho := True;

        if (Persona and Codigo and Anho ) then btnGuardar.Enabled := True
        else btnGuardar.Enabled := False;
end;

procedure TfrmGestionTercero.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmGestionTercero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := caFree;
end;

procedure TfrmGestionTercero.btnEliminarClick(Sender: TObject);
begin
        if (MessageDlg('Seguro de Eliminar?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
        begin
                if (IBTGuardar.InTransaction) then
                  IBTGuardar.Rollback;
                IBTGuardar.StartTransaction;
                IBQGuardar.Close;
                IBQGuardar.SQL.Clear;
                IBQGuardar.SQL.Add('delete from "con$tercerosaldoinicial" ');
                IBQGuardar.SQL.Add('WHERE ID = :ID');
                IBQGuardar.ParamByName('ID').AsInteger := Id;
                IBQGuardar.ExecSQL;
                IBQGuardar.Transaction.Commit;
        end;
end;

end.
