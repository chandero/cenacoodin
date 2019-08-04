unit UnitNovedadData;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBSQL, StrUtils, DBClient;

type
  TfrmNovedadData = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    CmdProcesar: TBitBtn;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    Bar: TProgressBar;
    CmdGenerar: TBitBtn;
    CmdEnviar: TBitBtn;
    CmdVer: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    Ed1: TEdit;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmdGenerarClick(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure Ed1KeyPress(Sender: TObject; var Key: Char);
  private
    procedure SegundoPaso;
    { Private declarations }
  public
    { Public declarations }
  end;


type Registro = Record
    Numero:string; // * 18 A
    Identificacion:string; // 11 A
    TipoIdent:string; // * 1 A
    Novedad:string; // * 2 N
    FechaNov:string; // 6 AAAAMM
end;

var
  frmNovedadData: TfrmNovedadData;
  PlanoReporte:TStringList;
  LineaC:string;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobalesCol,UnitDmcolocacion, UnitMuestroArchivoCifin, UnitGlobales;

procedure TfrmNovedadData.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;


procedure TfrmNovedadData.SegundoPaso;
var cadena:string;
    LineaC:registro;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        with IBQuery1 do begin
         SQL.Add('select NUMERO,IDENTIFICACION,TPIDEN,NOVEDAD from "col$ReporteDatatmp"');
         SQL.Add('where (NOVEDAD = :NOV1 or NOVEDAD = :NOV2)');
         ParamByName('NOV1').AsString := '05';
         ParamByName('NOV2').AsString := '14';
         Open;

         while not Eof do BEGIN
           LineaC.Numero := FieldByName('NUMERO').AsString;
           LineaC.Identificacion := FieldByName('IDENTIFICACION').AsString;
           LineaC.TipoIdent := FieldByName('TPIDEN').AsString;
           LineaC.Novedad := FieldByName('NOVEDAD').AsString;
           LineaC.FechaNov := Trim(Ed1.Text);
           PlanoReporte.Add(LineaC.Numero + LineaC.Identificacion +
                            LineaC.TipoIdent + LineaC.Novedad + LineaC.FechaNov);
           Next;
         end;
         Close;
        end;

        CheckBox1.Checked := True;
        Application.ProcessMessages;
end;

procedure TfrmNovedadData.CmdProcesarClick(Sender: TObject);
begin
        CmdProcesar.Enabled := False;
        segundopaso;
        CmdGenerar.Enabled := True;
end;

procedure TfrmNovedadData.FormShow(Sender: TObject);
begin
        PlanoReporte := TStringList.Create;
        PlanoReporte.Clear;
        dmGeneral.IBDatabase1.Open;
        dmGeneral.IBTransaction1.Active := True;
        dmColocacion.IBDSagencias.Active := True;
end;

procedure TfrmNovedadData.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

procedure TfrmNovedadData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;

procedure TfrmNovedadData.CmdGenerarClick(Sender: TObject);
begin
        PlanoReporte.SaveToFile('c:/NovedadesCrediservir' + Ed1.Text + '.TXT');
        CmdVer.Enabled := True;
end;

procedure TfrmNovedadData.CmdVerClick(Sender: TObject);
var frmMuestroArchivoCifin : TfrmMuestroArchivoCifin;
begin
        frmMuestroArchivoCifin := TfrmMuestroArchivoCifin.Create(Self);
        frmMuestroArchivoCifin.ShowModal;
end;

procedure TfrmNovedadData.Ed1KeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
