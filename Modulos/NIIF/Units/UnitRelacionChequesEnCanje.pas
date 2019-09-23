unit UnitRelacionChequesEnCanje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TfrmRelacionChequesEnCanje = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnCerrar: TBitBtn;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBQuery1DESCRIPCION: TIBStringField;
    IBQuery1NUMERO_CHEQUE: TIntegerField;
    IBQuery1PLAZA: TIBStringField;
    IBQuery1FECHA_ENTRADA: TDateField;
    IBQuery1VALOR_CHEQUE: TIBBCDField;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    FidAgencia:Integer;
    FidTipo:Integer;
    Fcuenta:Integer;
    Fdigito:Integer;
    { Private declarations }
  public
    property idagencia:Integer read FidAgencia Write FidAgencia;
    property idtipo:Integer read Fidtipo Write Fidtipo;
    property cuenta:Integer read Fcuenta Write fcuenta;
    property digito:Integer read Fdigito Write Fdigito;
    { Public declarations }
  end;

var
  frmRelacionChequesEnCanje: TfrmRelacionChequesEnCanje;

implementation

{$R *.dfm}

uses UnitDmGeneral;


procedure TfrmRelacionChequesEnCanje.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmRelacionChequesEnCanje.FormCreate(Sender: TObject);
begin
   IBTransaction1.StartTransaction;
end;

procedure TfrmRelacionChequesEnCanje.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        IBTransaction1.Commit;
        CanClose := True;
end;

procedure TfrmRelacionChequesEnCanje.FormShow(Sender: TObject);
begin
   with IBQuery1 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT "gen$bancos".DESCRIPCION,');
     SQL.Add('       "cap$canje".NUMERO_CHEQUE,');
     SQL.Add('       "cap$canje".PLAZA,');
     SQL.Add('       "cap$canje".FECHA_ENTRADA,');
     SQL.Add('       "cap$canje".VALOR_CHEQUE');
     SQL.Add('FROM');
     SQL.Add('       "cap$canje"');
     SQL.Add('INNER JOIN "gen$bancos" on ("cap$canje".ID_BANCO = "gen$bancos".ID_BANCO)');
     SQL.Add('WHERE');
     SQL.Add('       "cap$canje".ID_AGENCIA = :ID_AGENCIA and');
     SQL.Add('       "cap$canje".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
     SQL.Add('       "cap$canje".NUMERO_CUENTA = :NUMERO_CUENTA and');
     SQL.Add('       "cap$canje".DIGITO_CUENTA = :DIGITO_CUENTA and');
     SQL.Add('       "cap$canje".LIBERADO = 0 and');
     SQL.Add('       "cap$canje".DEVUELTO = 0');
     ParamByName('ID_AGENCIA').AsInteger := idagencia;
     ParamByName('ID_TIPO_CAPTACION').AsInteger := idtipo;
     ParamByName('NUMERO_CUENTA').AsInteger := cuenta;
     ParamByName('DIGITO_CUENTA').AsInteger := digito;
     try
      Open;
     except
      Transaction.Rollback;
      raise;
     end;
   end;

end;

end.
