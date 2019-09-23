unit UnitProcedimientoRecto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  DBCtrls, IBSQL;

type
  TfrmProcedimientoRecto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn5: TBitBtn;
    Label2: TLabel;
    DBLCBTipoIdentificacion: TDBLookupComboBox;
    Label3: TLabel;
    EdNumeroIdentificacion: TEdit;
    EdNombre: TStaticText;
    Label4: TLabel;
    IBQTipoIdentificacion: TIBQuery;
    DSTipoIdentificacion: TDataSource;
    IBSQL1: TIBSQL;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    StaticText1: TStaticText;
    Label5: TLabel;
    StaticText2: TStaticText;
    Label6: TLabel;
    StaticText3: TStaticText;
    Label7: TLabel;
    StaticText4: TStaticText;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcedimientoRecto: TfrmProcedimientoRecto;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmProcedimientoRecto.FormShow(Sender: TObject);
begin
        with IBQTipoIdentificacion do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
        end;

        IBQTipoIdentificacion.Open;
        IBQTipoIdentificacion.Last;
end;

procedure TfrmProcedimientoRecto.FormKeyPress(Sender: TObject; var Key: Char);
begin
        entertabs(key,Self);
end;

procedure TfrmProcedimientoRecto.EdNumeroIdentificacionExit(Sender: TObject);
begin
        with IBSQL1 do begin
          SQL.Clear;
          SQL.Add('select * from "paciente" where TIPO_IDENTIFICACION = :TIPO_IDENTIFICACION and');
          SQL.Add('NUMERO_IDENTIFICACION = :NUMERO_IDENTIFICACION');
          ParamByName('TIPO_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
          ParamByName('NUMERO_IDENTIFICACION').AsString := EdNumeroIdentificacion.Text;
          ExecQuery;
        end;

        EdNombre.Caption := IBSQL1.FieldByName('PRIMER_NOMBRE').AsString + ' ' +
                            IBSQL1.FieldByName('SEGUNDO_NOMBRE').AsString + ' ' +
                            IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                            IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString; 
end;

procedure TfrmProcedimientoRecto.BitBtn6Click(Sender: TObject);
begin
        Close;
end;

end.
