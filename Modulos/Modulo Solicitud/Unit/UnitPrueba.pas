unit UnitPrueba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvComponent, JvxCtrls, ComCtrls, ExtCtrls,
  JvStaticText, Buttons;

type
  TFrmPrueba = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    JVsolicitante: TJvxCheckListBox;
    Panel1: TPanel;
    JVConyugue: TJvxCheckListBox;
    JVCodeudor: TJvxCheckListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrueba: TFrmPrueba;

implementation

uses UnitRequisitos, UnitSolicitudCre;

{$R *.dfm}

procedure TFrmPrueba.Button1Click(Sender: TObject);
begin
        with FrmSolicitudCre.IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$requisitos"');
          Open;
          while not Eof do
          begin
            if RecNo < 15 then
            JVsolicitante.Items.Add(FieldByName('descripcion').AsString);
            JVCodeudor.Items.Add(FieldByName('descripcion').AsString);
            JVconyugue.Items.Add(FieldByName('descripcion').AsString);
            Next;
          end;
        end;
end;

procedure TFrmPrueba.Button2Click(Sender: TObject);
var i:Integer;
    s :string;
begin
        for i := 0 to Jvsolicitante.Items.Count-1 do
        begin
          if JVsolicitante.Checked[i] then
             s := s + JVsolicitante.Items.Strings[i];
        end;
        ShowMessage(s);
end;

end.
