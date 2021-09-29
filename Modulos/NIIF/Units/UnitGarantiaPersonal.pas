unit UnitGarantiaPersonal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls;

type
  TfrmGarantiaPersonal = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CBtiposid: TDBLookupComboBox;
    Label2: TLabel;
    EdNumeroIdentificacion: TMemo;
    Label3: TLabel;
    EdNombre: TEdit;
    CmdCrearPersona: TBitBtn;
    Panel4: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdCrearPersonaClick(Sender: TObject);
  private
    function Gettipoid:Variant;
    procedure Settipoid(vNewValue:Variant);
    function Getnumeroid:String;
    procedure Setnumeroid(vNewValue:String);
    function GetApellidos:String;
    procedure SetApellidos(vNewValue:String);
    function GetNombres:String;
    procedure SetNombres(vNewValue:String);
    { Private declarations }
  public
    property tipoid:Variant read Gettipoid write Settipoid;
    property numeroid:String read Getnumeroid write Setnumeroid;
    property Apellidos:String read GetApellidos write SetApellidos;
    property Nombres:String read GetNombres write SetNombres;
    { Public declarations }
  end;

var
  frmGarantiaPersonal: TfrmGarantiaPersonal;

implementation

{$R *.dfm}

uses UnitdmColocacion,UnitGlobales, UnitCreaciondePersona;

var vtipoid:Variant;
    vnumeroid:String;
    vApellidos:String;
    vNombres:String;

procedure TfrmGarantiaPersonal.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmGarantiaPersonal.Settipoid(vNewValue:Variant);
begin
      vtipoid := vNewValue;
end;

function TfrmGarantiaPersonal.Gettipoid:Variant;
begin
        result := vtipoid;
end;

procedure TfrmGarantiaPersonal.Setnumeroid(vNewValue:String);
begin
      vnumeroid := vNewValue;
end;

function TfrmGarantiaPersonal.Getnumeroid:String;
begin
        result := vnumeroid;
end;

procedure TfrmGarantiaPersonal.SetApellidos(vNewValue:String);
begin
      vApellidos := vNewValue;
end;

function TfrmGarantiaPersonal.GetApellidos:String;
begin
        result := vApellidos;
end;

procedure TfrmGarantiaPersonal.SetNombres(vNewValue:String);
begin
      vNombres := vNewValue;
end;

function TfrmGarantiaPersonal.GetNombres:String;
begin
        result := vNombres;
end;

procedure TfrmGarantiaPersonal.EdNumeroIdentificacionExit(Sender: TObject);
begin
        with DmColocacion.IBQuery do
        begin
             SQL.Clear;
             SQL.Add('select ID_IDENTIFICACION, ID_PERSONA, PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$persona"');
             SQL.Add(' where "gen$persona"."ID_IDENTIFICACION" = :"ID_IDENTIFICACION" and  "gen$persona"."ID_PERSONA" = :"ID_PERSONA"');
             ParamByName('ID_IDENTIFICACION').AsInteger := CBtiposid.KeyValue;
             ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
             Active := true;
             Last;
             First;
             if RecordCount = 1 then
             begin
                EdNombre.Text  := FieldByName('PRIMER_APELLIDO').AsString + ' '+
                                  FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                  FieldByName('NOMBRE').AsString;
                tipoid := FieldByName('ID_IDENTIFICACION').AsVariant;
                numeroid := FieldByName('ID_PERSONA').AsString;
                apellidos := FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                nombres := FieldByName('NOMBRE').AsString;
                CmdAceptar.Enabled := True;
                CmdAceptar.SetFocus;
             end
             else
                CmdAceptar.Enabled := False;
                CmdCrearPersona.SetFocus;
             end;
end;

procedure TfrmGarantiaPersonal.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmGarantiaPersonal.CmdCrearPersonaClick(Sender: TObject);
var frmCreacionPersona:TfrmCreacionPersona;
begin
      frmCreacionPersona := TfrmCreacionPersona.Create(Self);
      frmCreacionPersona.ShowModal;
      EdNumeroIdentificacionExit(Sender);
end;

end.
