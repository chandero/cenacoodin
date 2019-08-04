unit UnitVida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvComponent, JvxCtrls, StdCtrls, Buttons, IBDatabase,
  IBSQL;

type
  TFrmVida = class(TForm)
    JVEnferemedad: TJvxCheckListBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
  published
    function numero_r(cadena: string): integer;
    { Public declarations }
  end;

var
  FrmVida: TFrmVida;

implementation

uses UnitInformacion;

{$R *.dfm}

procedure TFrmVida.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmVida.BitBtn1Click(Sender: TObject);
var     i :Integer;
begin
        FrmInformacion.CdSeguro.CancelUpdates;
        for i := 0 to JVEnferemedad.Items.Count - 1 do
        begin
          if JVEnferemedad.Checked[i] then
          begin
             FrmInformacion.CdSeguro.Append;
             FrmInformacion.CdSeguro.FieldValues['id_seguro'] := numero_r(JVEnferemedad.Items.Strings[i]);
             FrmInformacion.CdSeguro.Post;
          end;
        end;
        Close;

end;

function TFrmVida.numero_r(cadena: string): integer;
begin
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select ID_RIESGO from "gen$riesgosequivida"');
          SQL.Add('where DESCRIPCION = :DESCRIPCION and TIPO = 4');
          ParamByName('DESCRIPCION').AsString := cadena;
          ExecQuery;
          Result := FieldByName('ID_RIESGO').AsInteger;
        end;

end;

end.
