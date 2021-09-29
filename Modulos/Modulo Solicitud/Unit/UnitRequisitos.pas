unit UnitRequisitos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvComponent, JvxCtrls, ComCtrls, ExtCtrls,
  JvStaticText, Buttons, ImgList, Menus, JvLabel, DB, DBClient;

type
  TFrmRequisitos = class(TForm)
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
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    Tsolicitante: TMenuItem;
    ImageList1: TImageList;
    Tconyugue: TMenuItem;
    PopupMenu3: TPopupMenu;
    odoslosRequisitos1: TMenuItem;
    JvLabel1: TJvLabel;
    Tipo: TJvStaticText;
    BitBtn3: TBitBtn;
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TsolicitanteClick(Sender: TObject);
    procedure TconyugueClick(Sender: TObject);
    procedure odoslosRequisitos1Click(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure JVsolicitanteClickCheck(Sender: TObject);
    procedure JVConyugueClickCheck(Sender: TObject);
    procedure JVCodeudorClickCheck(Sender: TObject);
  private
  mensage :string;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmRequisitos: TFrmRequisitos;

implementation

uses UnitSolicitudCre;

{$R *.dfm}

procedure TFrmRequisitos.Button2Click(Sender: TObject);
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

procedure TFrmRequisitos.BitBtn1Click(Sender: TObject);
begin
        with FrmSolicitudCre do
        begin
          CDrequisitos.CancelUpdates;
          conyugue.CancelUpdates;
          solicitante.CancelUpdates;
          codeudor.CancelUpdates;
          JVCodeudor.Clear;
          JVConyugue.Clear;
          JVsolicitante.Clear;
        end;
        Close;
end;

procedure TFrmRequisitos.TsolicitanteClick(Sender: TObject);
begin
        JVsolicitante.Clear;
        with FrmSolicitudCre.IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$requisitos"');
          Open;
          while not Eof do
          begin
            JVsolicitante.Items.Add(FieldByName('descripcion').AsString);
            Next;
          end;
        end;
end;

procedure TFrmRequisitos.TconyugueClick(Sender: TObject);
begin
        JVConyugue.Clear;
        with FrmSolicitudCre.IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$requisitos"');
          Open;
          while not Eof do
          begin
            JVConyugue.Items.Add(FieldByName('descripcion').AsString);
            Next;
          end;
        end;
end;

procedure TFrmRequisitos.odoslosRequisitos1Click(Sender: TObject);
begin
        JVCodeudor.Clear;
        with FrmSolicitudCre.IBConsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$requisitos"');
          Open;
          while not Eof do
          begin
            JVCodeudor.Items.Add(FieldByName('descripcion').AsString);
            Next;
          end;
        end;
end;


procedure TFrmRequisitos.JVConyugueClickCheck(Sender: TObject);
var     indice :Integer;
        decripcion :string;
begin
        mensage := FrmSolicitudCre.conyugue.FieldByName('descripcion').AsString;
        indice := JVConyugue.ItemIndex;
        decripcion := JVConyugue.Items.Strings[indice];
        if (decripcion = 'OTROS') and (JVconyugue.Checked[indice]) then
        begin
           FrmSolicitudCre.conyugue.Append;
           FrmSolicitudCre.conyugue.FieldValues['descripcion'] := UpperCase(InputBox('Digite el nuevo Requisito','Requisito',mensage));
           FrmSolicitudCre.conyugue.Post;
        if StrLen(PChar(FrmSolicitudCre.conyugue.FieldByName('descripcion').AsString)) < 5 then
           JVconyugue.Checked[indice] := False;
        end
end;

procedure TFrmRequisitos.PageControl1Enter(Sender: TObject);
begin
        Tipo.Caption := 'Solicitante';
        JVsolicitante.SetFocus;
end;

procedure TFrmRequisitos.TabSheet1Enter(Sender: TObject);
begin
        Tipo.Caption := 'Solicitante'
end;

procedure TFrmRequisitos.TabSheet2Enter(Sender: TObject);
begin
        Tipo.Caption := 'Conyugue'
end;

procedure TFrmRequisitos.TabSheet3Enter(Sender: TObject);
begin
          Tipo.Caption := 'Codeudor'
end;

procedure TFrmRequisitos.BitBtn2Click(Sender: TObject);
var     i :Integer;
begin
        with FrmSolicitudCre.CDrequisitos do
        begin
          for i := 0 to Jvsolicitante.Items.Count-1 do //actualiza solicitantes
          begin
            if JVsolicitante.Checked[i] then
            begin
              if JVsolicitante.Items.Strings[i] = 'OTROS' then
              begin
                Append;
                FieldValues['descripcion_re'] := 'SOLICITANTE';
                FieldValues['requisito'] := FrmSolicitudCre.solicitante.FieldValues['descripcion'];
                Post;
              end
              else
              begin
                Append;
                FieldValues['descripcion_re'] := 'SOLICITANTE';
                FieldValues['requisito'] := JVsolicitante.Items.Strings[i];
                Post;
              end;
            end;
          end;
          for i := 0 to JVConyugue.Items.Count-1 do //actualiza solicitantes
          begin
            if JVConyugue.Checked[i] then
            begin
              if JVConyugue.Items.Strings[i] = 'OTROS' then
              begin
                Append;
                FieldValues['descripcion_re'] := 'CONYUGE';
                FieldValues['requisito'] := FrmSolicitudCre.conyugue.FieldValues['descripcion'];
                Post;
              end
              else
              begin
                Append;
                FieldValues['descripcion_re'] := 'CONYUGE';
                FieldValues['requisito'] := JVConyugue.Items.Strings[i];
                Post;
              end;
            end;
          end;
          for i := 0 to JVCodeudor.Items.Count-1 do //actualiza solicitantes
          begin
            if JVCodeudor.Checked[i] then
            begin
              if JVCodeudor.Items.Strings[i] = 'OTROS' then
              begin
                Append;
                FieldValues['descripcion_re'] := 'CODEUDOR';
                FieldValues['requisito'] := FrmSolicitudCre.codeudor.FieldValues['descripcion'];
                Post;
              end
              else
              begin
                Append;
                FieldValues['descripcion_re'] := 'CODEUDOR';
                FieldValues['requisito'] := JVCodeudor.Items.Strings[i];
                Post;
            end;
              end;
          end;
        end;
        JVCodeudor.Clear;
        JVConyugue.Clear;
        JVsolicitante.Clear;
        Self.Close;
end;
procedure TFrmRequisitos.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRequisitos.JVsolicitanteClickCheck(Sender: TObject);
var     indice :Integer;
        decripcion :string;
begin
        mensage := FrmSolicitudCre.solicitante.FieldByName('descripcion').AsString;
        indice := JVsolicitante.ItemIndex;
        decripcion := JVsolicitante.Items.Strings[indice];
        if (decripcion = 'OTROS') and (JVsolicitante.Checked[indice]) then
        begin
           FrmSolicitudCre.solicitante.Append;
           FrmSolicitudCre.solicitante.FieldValues['descripcion'] := UpperCase(InputBox('Digite el nuevo Requisito','Requisito',mensage));
           FrmSolicitudCre.solicitante.Post;
        if StrLen(PChar(FrmSolicitudCre.solicitante.FieldByName('descripcion').AsString)) < 5 then
           JVsolicitante.Checked[indice] := False;
        end
end;

procedure TFrmRequisitos.JVCodeudorClickCheck(Sender: TObject);
var     indice :Integer;
        decripcion :string;
begin
        mensage := FrmSolicitudCre.codeudor.FieldByName('descripcion').AsString;
        indice := JVCodeudor.ItemIndex;
        decripcion := JVcodeudor.Items.Strings[indice];
        if (decripcion = 'OTROS') and (JVCodeudor.Checked[indice]) then
        begin
           FrmSolicitudCre.codeudor.Append;
           FrmSolicitudCre.codeudor.FieldValues['descripcion'] := UpperCase(InputBox('Digite el nuevo Requisito','Requisito',mensage));
           FrmSolicitudCre.codeudor.Post;
        if StrLen(PChar(FrmSolicitudCre.codeudor.FieldByName('descripcion').AsString)) < 5 then
           JVCodeudor.Checked[indice] := False;
        end
end;

end.
