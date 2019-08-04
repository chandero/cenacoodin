unit UnitRequisitoscre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvComponent, JvxCtrls, ComCtrls, ExtCtrls,
  JvStaticText, Buttons, ImgList, Menus, JvLabel, DB, DBClient, JvCombobox;

type
  TFrmRequisitoscre = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    JvLabel1: TJvLabel;
    Tipo: TJvStaticText;
    BitBtn3: TBitBtn;
    JVrequisitos: TJvxCheckListBox;
    BitBtn1: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
  documento :string;
  identificacion :Integer;
  radicado :string;
  control_requisito :Boolean;
    procedure requisito(CDdata: TClientDataSet);

    { Public declarations }
  end;

var
  FrmRequisitoscre: TFrmRequisitoscre;

implementation

uses UnitDmSolicitud, UnitInformacion, UnitRequisitoNuevo;


{$R *.dfm}

procedure TFrmRequisitoscre.BitBtn2Click(Sender: TObject);
begin
          if FrmInformacion.control_externo then
          begin
            with DmSolicitud.IBsolicitud2 do
            begin
              Close;
              if Transaction.InTransaction then
                 Transaction.Commit;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('delete from "col$solicitudrequisito"');
              SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
              SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and');
              SQL.Add('ID_PERSONA = :ID_PERSONA');
              ParamByName('ID_PERSONA').AsString := documento;
              ParamByName('ID_IDENTIFICACION').AsInteger := identificacion;
              ParamByName('ID_SOLICITUD').AsString := radicado;
              Open;
              Close;
              Transaction.Commit;
            end;
          end;
          if control_requisito then
             requisito(frminformacion.CDrequisitos)
          else
             requisito(FrmInformacion.CDrequisitocod);
          Close;
end;
procedure TFrmRequisitoscre.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRequisitoscre.requisito(CDdata: TClientDataSet);
var       i :Integer;
begin
          //
          with CDdata do
          begin
            First;
            while not Eof do
            begin
              if FieldValues['id_persona'] = documento then
              begin
               try
                Filter := 'id_persona =' + documento;
                Filtered := True;
                Delete;
                Filtered := False;
              except
               Next;
              end;
              end
              else
               Next;
              end;
          end;

          //
          for i := 0 to JVrequisitos.Items.Count-1 do //actualiza solicitantes
          begin
            if JVrequisitos.Checked[i] then
            begin
              with DmSolicitud.IBSolicitud1 do
              begin
                 Close;
                 SQL.Clear;
                 SQL.Add('select * from "col$requisitos"');
                 SQL.Add('where DESCRIPCION = :DESCRIPCION');
                 ParamByName('DESCRIPCION').AsString := JVrequisitos.Items.Strings[i];
                 Open;
                 CDdata.Append;
                 CDdata.FieldValues['id_requisito'] := FieldByName('ID_REQUISITO').AsInteger;
                 CDdata.FieldValues['id_persona'] := documento;
                 CDdata.FieldValues['id_identificacion'] := identificacion;
                 CDdata.Post;
              end;
            end;
          end;
end;

procedure TFrmRequisitoscre.BitBtn1Click(Sender: TObject);
begin
        //JVrequisitos.Clear;
        FrmRequisitoNuevo := TFrmRequisitoNuevo.Create(self);
        FrmRequisitoNuevo.ShowModal;
end;

end.

