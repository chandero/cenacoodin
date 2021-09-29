unit UnitRiesgos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvxCtrls, ExtCtrls, JvPanel, ComCtrls, StdCtrls,
  Buttons, IBSQL, IBDatabase;

type
  TFrmRiesgos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    JVEnferemedad: TJvxCheckListBox;
    TabSheet2: TTabSheet;
    JVprofesion: TJvxCheckListBox;
    TabSheet3: TTabSheet;
    JVdeportes: TJvxCheckListBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBTransaction1: TIBTransaction;
    IBSQL1: TIBSQL;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    function numero_r(cadena: string): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRiesgos: TFrmRiesgos;

implementation

uses UnitInformacion;

{$R *.dfm}

procedure TFrmRiesgos.BitBtn2Click(Sender: TObject);
begin
        FrmInformacion.numero_riesgo := 0;
        Close;
end;

procedure TFrmRiesgos.BitBtn1Click(Sender: TObject);
var    i :Integer;
begin
        for i := 0 to JVEnferemedad.Items.Count - 1 do
        begin
          if JVEnferemedad.Checked[i] then
          begin
             FrmInformacion.numero_riesgo := numero_r(JVEnferemedad.Items.Strings[i]);
             Close;
             exit;
          end;
        end;
        for i := 0 to JVprofesion.Items.Count - 1 do
        begin
          if JVprofesion.Checked[i] then
          begin
             FrmInformacion.numero_riesgo := numero_r(JVprofesion.Items.Strings[i]);
             Close;
             exit;
          end;
        end;
        for i := 0 to JVdeportes.Items.Count -1 do
        begin
          if JVdeportes.Checked[i] then
          begin
             FrmInformacion.numero_riesgo := numero_r(JVdeportes.Items.Strings[i]);
             Close;
             exit;
          end;
        end;
end;

function TFrmRiesgos.numero_r(cadena: string): integer;
begin
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select ID_RIESGO from "gen$riesgosequivida"');
          SQL.Add('where DESCRIPCION = :DESCRIPCION');
          ParamByName('DESCRIPCION').AsString := cadena;
          ExecQuery;
          Result := FieldByName('ID_RIESGO').AsInteger;
        end;
end;

end.
