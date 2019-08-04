unit UnitDatosActa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvEdit, JvTypedEdit, Buttons;

type
  TFrmDatosActa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    JVnumero: TJvIntegerEdit;
    EDdescripcion: TEdit;
    MOrden: TMemo;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure EDdescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    tipo: Boolean;
  published

    { Public declarations }
  end;

var
  FrmDatosActa: TFrmDatosActa;

implementation
uses UnitGlobales, UnitActa;

{$R *.dfm}

procedure TFrmDatosActa.EDdescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmDatosActa.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmDatosActa.BitBtn1Click(Sender: TObject);
begin
        with FrmActa do
        begin
          if JVnumero.Value > 0 then
          begin
           CDorden.Filtered := False;
           CDorden.Filter := 'numero = ' + IntToStr(JVnumero.Value);
           CDorden.Filtered := True;
           if (CDorden.FieldByName('titulo').AsString <> '') or (CDorden.FieldByName('descripcion').AsString <> '') then
              CDorden.Delete;
           CDorden.Filtered := False;
           CDorden.Append;
           CDorden.FieldValues['numero'] := JVnumero.Value;
           CDorden.FieldValues['titulo'] := EDdescripcion.Text;
           CDorden.FieldValues['descripcion'] := MOrden.Text;
           if JVnumero.Value > 4 then
              CDorden.FieldValues['tipo'] := True
           else
              CDorden.FieldValues['tipo'] := False;
           CDorden.Post;
           CDorden.IndexFieldNames := 'numero';
           end
        else
        begin
          CDanexo.CancelUpdates;
          CDanexo.Append;
          CDanexo.FieldValues['anexo'] := MOrden.Text;
          CDanexo.Post;
        end;

        end;
        Close;
end;

end.
