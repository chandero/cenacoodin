unit UnitRemotaConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, JvEdit, DB, DBClient, Grids,
  DBGrids, IBCustomDataSet, IBQuery, Buttons, sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP, IdHTTP,
  xmldom, XMLIntf, msxmldom, XMLDoc, UnitPantallaProgreso;

type
  TFrmRemotaConsulta = class(TForm)
    GroupBox1: TGroupBox;
    DBtipo: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    JVnumero: TJvEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PApellido: TEdit;
    SApellido: TEdit;
    Nombres: TEdit;
    GroupBox3: TGroupBox;
    CDrespuesta: TClientDataSet;
    DSrespuesta: TDataSource;
    DBGrid1: TDBGrid;
    CDrespuestacuenta: TIntegerField;
    IBagencia: TIBQuery;
    DSagencia: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CDrespuestadescripcion: TStringField;
    CDrespuestatp: TIntegerField;
    CDrespuestaag: TIntegerField;
    CDrespuestasaldo: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBtipoKeyPress(Sender: TObject; var Key: Char);
    procedure PApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure SApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure JVnumeroExit(Sender: TObject);
    procedure JVnumeroKeyPress(Sender: TObject; var Key: Char);
    procedure NombresKeyPress(Sender: TObject; var Key: Char);
    procedure NombresExit(Sender: TObject);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    function GetURLAsString(const aURL: string): string;
    { Private declarations }
  public
    Host_remoto :string;
    Puerto_Remoto :Integer;
    captacion :Integer;
    Ag_Remota :Integer;
    { Public declarations }
  end;

var
  FrmRemotaConsulta: TFrmRemotaConsulta;
  frmProgreso : TfrmProgreso;

implementation
uses UnitGlobales, UnitOperacionesCaja, UnitdmGeneral;

{$R *.dfm}

procedure TFrmRemotaConsulta.FormCreate(Sender: TObject);
begin
        IBagencia.Open;
        IBagencia.Last;
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Obteniendo Información de Oficina';
end;

procedure TFrmRemotaConsulta.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRemotaConsulta.DBtipoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmRemotaConsulta.PApellidoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmRemotaConsulta.SApellidoKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmRemotaConsulta.BitBtn1Click(Sender: TObject);
begin
        DBtipo.KeyValue := -1;
        JVnumero.Text := '';
        PApellido.Text := '';
        SApellido.Text := '';
        Nombres.Text := '';
        CDrespuesta.CancelUpdates;
        DBtipo.SetFocus;
end;

procedure TFrmRemotaConsulta.JVnumeroExit(Sender: TObject);
var      i :Integer;
         sentencia1 :string;
         cadena :string;
         AList,AListCampos:TList;
         XMLResult : IXMLDocument;
         XMLAccount : IXMLNode;
begin
      if (DBtipo.KeyValue <> -1) and (JVnumero.Text <> '') then
      begin

        cadena := GetURLAsString('http://'+Host_remoto+':'+IntToStr(Puerto_remoto)+'/sif/rest/cs/'+IntToStr(DBtipo.KeyValue) +'/'+JVnumero.Text);
        if (cadena <> '') then begin
         XMLResult := LoadXMLData(cadena);
         try
          for i := 0 to XMLResult.ChildNodes.Nodes['customer'].ChildNodes.Count - 1 do
          begin
                if (XMLResult.ChildNodes.Nodes['customer'].ChildNodes[i].LocalName = 'account') then
                begin
                 XMLAccount := XMLResult.ChildNodes.Nodes['customer'].ChildNodes[i];
                 if (Assigned(XMLAccount)) then begin
                  CDrespuesta.Append;
                  CDrespuesta.FieldValues['cuenta'] := XMLAccount.ChildNodes.Nodes['numero'].NodeValue;
                  CDrespuesta.FieldValues['descripcion'] := XMLAccount.ChildNodes.Nodes['descripcion'].NodeValue;
                  CDrespuesta.FieldValues['tp'] := XMLAccount.ChildNodes.Nodes['tipo'].NodeValue;
                  CDrespuesta.FieldValues['ag'] := XMLAccount.ChildNodes.Nodes['agencia'].NodeValue;
                  CDrespuesta.FieldValues['saldo'] := XMLAccount.ChildNodes.Nodes['saldo'].NodeValue;
                  CDrespuesta.Post;
                 end;
                end
                else if (XMLResult.ChildNodes.Nodes['customer'].ChildNodes[i].LocalName = 'primerapellido') then
                    PApellido.Text :=  XMLResult.ChildNodes.Nodes['customer'].ChildNodes[i].NodeValue
                else if (XMLResult.ChildNodes.Nodes['customer'].ChildNodes[i].LocalName = 'segundoapellido') then
                    SApellido.Text :=  XMLResult.ChildNodes.Nodes['customer'].ChildNodes[i].NodeValue
                else if (XMLResult.ChildNodes.Nodes['customer'].ChildNodes[i].LocalName = 'primernombre') then
                    Nombres.Text :=  XMLResult.ChildNodes.Nodes['customer'].ChildNodes[i].NodeValue
            end;
           except
           end;
         XMLResult.Active := False;
         XMLResult := nil;
        end;
       end;
end;

procedure TFrmRemotaConsulta.JVnumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           BitBtn2.SetFocus;
end;

procedure TFrmRemotaConsulta.NombresKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
           BitBtn2.SetFocus;
end;

procedure TFrmRemotaConsulta.NombresExit(Sender: TObject);
var     AList,AListCampos:TList;
        i,tamano :Integer;
        cadena :string;
begin
         CDrespuesta.CancelUpdates;
         if (PApellido.Text <> '') and (SApellido.Text <> '') and (Nombres.Text <> '') then
         begin
           for i := 0 to AList.Count -1 do
           begin
             CDrespuesta.Append;
             CDrespuesta.FieldValues['ag'] := Ag_Remota;
             CDrespuesta.FieldValues['tp'] := 1;
             CDrespuesta.FieldValues['cuenta'] := '';
             CDrespuesta.FieldValues['descripcion'] := 'APORTES ORDINARIOS';
             CDrespuesta.Post;
           end;
         end
         else
         begin
           MessageDlg('Todos los Campos deben estar Llenos',mtInformation,[mbok],0);
           Exit;
         end;
end;

procedure TFrmRemotaConsulta.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmRemotaConsulta.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmRemotaConsulta.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmRemotaConsulta.DBGrid1CellClick(Column: TColumn);
begin
        captacion := CDrespuestacuenta.Value;
end;

function TFrmRemotaConsulta.GetURLAsString(const aURL: string): string;
begin
  try
     frmProgreso.Show;
   try
     Result := IdHTTP1.Get(aURL);
   except
     on E : Exception do
       ShowMessage(E.ClassName+' error generado, with message : '+E.Message);
   end;
  finally
     frmProgreso.Hide;
  end;
end;

end.
