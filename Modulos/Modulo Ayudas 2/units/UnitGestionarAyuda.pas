unit UnitGestionarAyuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, DBCtrls, JvEdit,
  JvTypedEdit, Buttons, Grids, DBGrids, Menus, ExtCtrls, IBDatabase;

type
  TFrmGestionarAyuda = class(TForm)
    IbAyudas: TIBQuery;
    DsAyudas: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbAyuda: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    jvFondo: TJvCurrencyEdit;
    jvCopago: TJvCurrencyEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    dbMedico: TDBLookupComboBox;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    Eliminar1: TMenuItem;
    bitActualizar: TBitBtn;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    IbMedico: TIBQuery;
    dsMedico: TDataSource;
    IBMedAyudas: TIBQuery;
    dsMedAyuda: TDataSource;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbAyudaExit(Sender: TObject);
    procedure bitActualizarClick(Sender: TObject);
    procedure dbAyudaKeyPress(Sender: TObject; var Key: Char);
    procedure dbAyudaEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGestionarAyuda: TFrmGestionarAyuda;

implementation

{$R *.dfm}

procedure TFrmGestionarAyuda.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmGestionarAyuda.FormCreate(Sender: TObject);
begin
        IbAyudas.Close;
        IbAyudas.Open;
        IbAyudas.Last;
        dbAyuda.KeyValue := -1;
        //dbAyudaExit(Self);
        IbMedico.Close;
        IbMedico.Open;
        IbMedico.Last;
end;

procedure TFrmGestionarAyuda.dbAyudaExit(Sender: TObject);
begin
        if dbAyuda.KeyValue = -1 then
           Exit;
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM "fun$ayudas" WHERE ID_AYUDA = :ID_AYUDA');
          ParamByName('ID_AYUDA').AsInteger := dbAyuda.KeyValue;
          Open;
          jvFondo.Value := FieldByName('VALOR_MAXIMO').AsCurrency;
          jvCopago.Value := FieldByName('COPAGO').AsCurrency;
          bitActualizar.Enabled := True;
          IBMedAyudas.Close;
          IBMedAyudas.ParamByName('ID_AYUDA').AsInteger := dbAyuda.KeyValue;
          IBMedAyudas.Open;
        end;
end;

procedure TFrmGestionarAyuda.bitActualizarClick(Sender: TObject);
begin
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('UPDATE "fun$ayudas" SET VALOR_MAXIMO = :VALOR_MAXIMO, COPAGO = :COPAGO WHERE ID_AYUDA = :ID_AYUDA');
          ParamByName('VALOR_MAXIMO').AsCurrency := jvFondo.Value;
          ParamByName('COPAGO').AsCurrency := jvCopago.Value;
          ParamByName('ID_AYUDA').AsInteger := dbAyuda.KeyValue;
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;
        ShowMessage('Actualizado');
        bitActualizar.Enabled := False;
        jvFondo.Value := 0;
        jvCopago.Value := 0;
        dbAyuda.SetFocus;
end;

procedure TFrmGestionarAyuda.dbAyudaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
          jvFondo.SetFocus;
end;

procedure TFrmGestionarAyuda.dbAyudaEnter(Sender: TObject);
begin
        dbAyuda.DropDown;
end;

procedure TFrmGestionarAyuda.BitBtn1Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Add('SELECT COUNT(0) AS CONTADOR FROM "fun$medayu" WHERE "fun$medayu".ID_AYUDA = :ID_AYUDA AND "fun$medayu".ID_MEDICO = :ID_MEDICO');
          ParamByName('ID_AYUDA').AsInteger := dbAyuda.KeyValue;
          ParamByName('ID_MEDICO').AsInteger := dbMedico.KeyValue;
          Open;
          if FieldByName('CONTADOR').AsInteger > 0 then
          begin
            ShowMessage('El Médico ya se encuentra Registrado en esta Ayuda');
            IBMedAyudas.Close;
            IBMedAyudas.ParamByName('ID_AYUDA').AsInteger := dbAyuda.KeyValue;
            IBMedAyudas.Open;
            Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO "fun$medayu"(ID_MEDICO,ID_AYUDA) VALUES(:ID_MEDICO,:ID_AYUDA)');
          ParamByName('ID_AYUDA').AsInteger := dbAyuda.KeyValue;
          ParamByName('ID_MEDICO').AsInteger := dbMedico.KeyValue;
          ExecSQL;
          Transaction.Commit;
          Transaction.StartTransaction;
        end;
        IBMedAyudas.Close;
        IBMedAyudas.ParamByName('ID_AYUDA').AsInteger := dbAyuda.KeyValue;
        IBMedAyudas.Open;
end;

procedure TFrmGestionarAyuda.Eliminar1Click(Sender: TObject);
var
        _iMedico :Integer;
begin
        _iMedico := IBMedAyudas.FieldByName('ID_MEDICO').AsInteger;
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Add('DELETE FROM "fun$medayu" WHERE "fun$medayu".ID_AYUDA = :ID_AYUDA AND "fun$medayu".ID_MEDICO = :ID_MEDICO');
          ParamByName('ID_AYUDA').AsInteger := dbAyuda.KeyValue;
          ParamByName('ID_MEDICO').AsInteger := _iMedico;
          ExecSQL;
          ShowMessage('Médico eliminado correctamente...');
          IBMedAyudas.Close;
          IBMedAyudas.ParamByName('ID_AYUDA').AsInteger := dbAyuda.KeyValue;
          IBMedAyudas.Open;
       end;

end;

end.
