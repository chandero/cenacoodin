unit UnitGestionarMedicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, DBCtrls, IBDatabase;

type
  TfrmGestionarMedico = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    EdNombre: TEdit;
    Label3: TLabel;
    EdDireccion: TEdit;
    DataSource1: TDataSource;
    IbMedicos: TIBQuery;
    IBQTiposDocumentos: TIBQuery;
    DSTiposDocumento: TDataSource;
    DBLCBTipoDocumento: TDBLookupComboBox;
    Label4: TLabel;
    EdNumero: TEdit;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    _bActualiza :Boolean;
    _iIdMedico :Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGestionarMedico: TfrmGestionarMedico;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TfrmGestionarMedico.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmGestionarMedico.FormCreate(Sender: TObject);
begin
        IBQTiposDocumentos.Close;
        IBQTiposDocumentos.Open;
        IBQTiposDocumentos.Last;
        IbMedicos.Close;
        IbMedicos.Open;
end;

procedure TfrmGestionarMedico.DBGrid1DblClick(Sender: TObject);
begin
        DBLCBTipoDocumento.KeyValue := IbMedicos.FieldByName('ID_IDENTIFICACION').AsInteger;
        EdNombre.Text := IbMedicos.FieldByName('NOMBRE').AsString;
        EdNumero.Text := IbMedicos.FieldByName('ID_PERSONA').AsString;
        EdDireccion.Text := IbMedicos.FieldByName('DIRECCION').AsString;
        _iIdMedico := IbMedicos.FieldByName('ID_MEDICO').AsInteger;
        DBLCBTipoDocumento.Enabled := False;
        EdNumero.Enabled := False;
        EdDireccion.SetFocus;
        _bActualiza := True;
end;

procedure TfrmGestionarMedico.BitBtn2Click(Sender: TObject);
begin
        DBLCBTipoDocumento.KeyValue := 3;
        EdNombre.Text := '';
        EdNumero.Text := '';
        EdDireccion.Text := '';
        DBLCBTipoDocumento.Enabled := True;
        EdNumero.Enabled := True;
        _bActualiza := False;
        EdNombre.SetFocus;        
end;

procedure TfrmGestionarMedico.BitBtn1Click(Sender: TObject);
var
        _iNumero :Smallint;
begin
        if MessageDlg('Esta Seguro(a) de Aplicar la Operación',mtWarning,[mbYes,Mbno],0) = MrNo then
           Exit;
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          if _bActualiza then //Actualizar Médico
          begin
            SQL.Add('UPDATE');
            SQL.Add('"fun$medicos"');
            SQL.Add('SET');
            SQL.Add('NOMBRE = :NOMBRE,');
            SQL.Add('DIRECCION = :DIRECCION');
            SQL.Add('WHERE');
            SQL.Add('"fun$medicos".ID_MEDICO = :IDMEDICO');
            ParamByName('NOMBRE').AsString := EdNombre.Text;
            ParamByName('DIRECCION').AsString := EdDireccion.Text;
            ParamByName('IDMEDICO').AsInteger := _iIdMedico;
          end
          else //Ingresar Médico
          begin
            SQL.Add('SELECT NOMBRE');
            SQL.Add('FROM');
            SQL.Add('  "fun$medicos"');
            SQL.Add('WHERE');
            SQL.Add('  "fun$medicos".ID_IDENTIFICACION = :ID_IDENTIFICACION AND');
            SQL.Add('  "fun$medicos".ID_PERSONA = :ID_PERSONA');
            ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdNumero.Text;
            Open;
            if StrLen(PChar(FieldByName('NOMBRE').AsString)) > 2 then
            begin
               ShowMessage(FieldByName('NOMBRE').AsString  + ', ya se encuentra registrado. Favor revise');
               IbMedicos.Close;
               IbMedicos.Open;
               Exit;
            end;
            Close;
            SQL.Clear;
            SQL.Add('select MAX(ID_MEDICO) + 1 as ID FROM "fun$medicos"');
            Open;
            _iNumero := FieldByName('ID').AsInteger;
            SQL.Clear;
            Close;
            SQL.Add('INSERT INTO');
            SQL.Add('"fun$medicos"(');
            SQL.Add('ID_MEDICO,');
            SQL.Add('ID_IDENTIFICACION,');
            SQL.Add('ID_PERSONA,');
            SQL.Add('NOMBRE,');
            SQL.Add('CUPO_DISPONIBLE,');
            SQL.Add('CUPO_UTILIZADO,');
            SQL.Add('VALOR_DISPONIBLE,');
            SQL.Add('VALOR_UTILIZADO,');
            SQL.Add('DIRECCION)');
            SQL.Add('VALUES(');
            SQL.Add(':ID_MEDICO,');
            SQL.Add(':ID_IDENTIFICACION,');
            SQL.Add(':ID_PERSONA,');
            SQL.Add(':NOMBRE,');
            SQL.Add(':CUPO_DISPONIBLE,');
            SQL.Add(':CUPO_UTILIZADO,');
            SQL.Add(':VALOR_DISPONIBLE,');
            SQL.Add(':VALOR_UTILIZADO,');
            SQL.Add(':DIRECCION)');
            ParamByName('ID_MEDICO').AsInteger := _iNumero;
            ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoDocumento.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdNumero.Text;
            ParamByName('NOMBRE').AsString := EdNombre.Text;
            ParamByName('CUPO_DISPONIBLE').AsCurrency := 0;
            ParamByName('CUPO_UTILIZADO').AsCurrency := 0;
            ParamByName('VALOR_DISPONIBLE').AsCurrency := 0;
            ParamByName('VALOR_UTILIZADO').AsCurrency := 0;
            ParamByName('DIRECCION').AsString := EdDireccion.Text;
          end;
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
          IbMedicos.Close;
          IbMedicos.Open;
          BitBtn2.Click;
          ShowMessage('Registro Actualizado');
        end;
end;

end.
