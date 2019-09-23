unit UnitRequisitoNuevo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UnitDmSolicitud;

type
  TFrmRequisitoNuevo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Mrequisito: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRequisitoNuevo: TFrmRequisitoNuevo;
  dmSolicitud: TdmSolicitud;

implementation

uses UnitRequisitoscre;

{$R *.dfm}

procedure TFrmRequisitoNuevo.BitBtn1Click(Sender: TObject);
var    id_requisito :Integer;
begin
        FrmRequisitoscre.JVrequisitos.Clear;
        if Mrequisito.Text <> '' then
        begin
          with DmSolicitud.IBSolicitud1 do
          begin
            Close;
            if Transaction.InTransaction then
               Transaction.Commit;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('select max("col$requisitos".id_requisito) as id_requisito from "col$requisitos"');
            Open;
            id_requisito := FieldByName('id_requisito').AsInteger + 1;
            SQL.Clear;
            SQL.Add('insert into "col$requisitos" values(:ID_REQUISITO,:DESCRIPCION)');
            ParamByName('ID_REQUISITO').AsInteger := id_requisito;
            ParamByName('DESCRIPCION').AsString := UpperCase(Mrequisito.Text);
            Open;
            Close;
            Transaction.Commit;
          end;
            with DmSolicitud.IBSolicitud1 do
            begin
              Close;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('"col$requisitos".DESCRIPCION');
              SQL.Add('FROM');
              SQL.Add('"col$requisitos"');
              Open;
              while not Eof do
              begin
                 FrmRequisitoscre.JVrequisitos.Items.Add(FieldByName('descripcion').AsString);
                 Next;
              end;
            end;
          end;
          Close;
end;

procedure TFrmRequisitoNuevo.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRequisitoNuevo.FormCreate(Sender: TObject);
begin
        dmSolicitud := TdmSolicitud.Create(self);
end;

end.
