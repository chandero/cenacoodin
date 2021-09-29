unit UnitSolicituRemota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JvStaticText, Grids, DBGrids, DB, sdXmlDocuments,
  DBClient, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IBCustomDataSet, IBQuery, Menus, FR_DSet, FR_DBSet, FR_Class, IBDatabase;

type
  TFrmSolicitudRemota = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    jvFecha: TJvStaticText;
    BitBtn2: TBitBtn;
    cDsol: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    IdTCPClient1: TIdTCPClient;
    cDsolID_SOLICITUD: TStringField;
    cDsolID_EMPLEADO: TStringField;
    cDsolESTADO: TStringField;
    cDsolFECHA_ANALISTA: TStringField;
    cDsolASOCIADO: TStringField;
    IBQuery1: TIBQuery;
    PopupMenu1: TPopupMenu;
    Buscar1: TMenuItem;
    Cancelar1: TMenuItem;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    cDsolEMPLEADO: TStringField;
    IBQuery2: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure Cancelar1Click(Sender: TObject);
    procedure Buscar1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BitBtn2Click(Sender: TObject);
  private
    XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo1,nodo :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;

    vFecha :string;
    procedure imprimir_reporte(cadena: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSolicitudRemota: TFrmSolicitudRemota;

implementation
uses UnitGlobales, UnitPantallaProgreso, UnitdmGeneral, UnitImpresion,
  unitMain;

{$R *.dfm}

procedure TFrmSolicitudRemota.BitBtn1Click(Sender: TObject);
var     sentencia :string;
        i :Integer;
        cadena :string;
        AList,AListCampos:TList;
begin

        sentencia := 'select * from P_COL_SOLICITUD(' + IntToStr(Agencia) + ')';
        vFecha := DateToStr(fFechaActual) + ' - ' + TimeToStr(Time);
        jvFecha.Caption := vFecha;
         XmlPetc := TsdXmlDocument.CreateName('query_info');
         XmlPetc.XmlFormat := xfReadable;
         Nodo := XmlPetc.Root.NodeNew('querys');
         Nodo1 := Nodo.NodeNew('query');
         Nodo1.WriteString('tipo','select');
         nodo1.WriteString('sentencia',sentencia);
         Nodo1 := Nodo.NodeNew('query');
         Nodo1.WriteString('tipo','select');
         nodo1.WriteString('sentencia',sentencia);
         XmlresC := TsdXmlDocument.Create;
         XmlresC.EncodingString := 'ISO8859-1';
         XmlresC.XmlFormat := xfReadable;
         Astream := TMemoryStream.Create;
         XmlPetC.SaveToStream(Astream);
           with IdTCPClient1 do
           begin
             Port := buscaservicio(1,1).vPuerto;
             Host := buscaservicio(1,1).vHost;
             try
               Application.ProcessMessages;
               Connect;
             except
             on e: Exception do
             begin
                Application.ProcessMessages;
                MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
                frmProgreso.Cerrar;
                Disconnect;
                Exit;
             end;
           end;
           if Connected then
           begin
                frmProgreso := TfrmProgreso.Create(self);
                frmProgreso.Titulo := 'Recibiendo Informacion...';// + Desc_Agencia;
                frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
                Application.ProcessMessages;
                frmProgreso.Position := 2;
                frmProgreso.Min := 0;
                frmProgreso.Ejecutar;
                //Cadena := ReadLn();
                Cadena := ReadLn();
                AStream := TMemoryStream.Create;
                XmlPetC.SaveToStream(AStream);
                WriteInteger(AStream.Size);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                FreeAndNil(AStream);
                tamano := ReadInteger;
                AStream := TMemoryStream.Create;
                ReadStream(Astream,tamano,False);
                XmlResc.LoadFromStream(AStream);
                Disconnect;
                frmProgreso.Cerrar;
           end;
           end;
           AList := TList.Create;
           Nodo := XmlResc.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           if IBQuery1.Transaction.InTransaction then
              IBQuery1.Transaction.Commit;
           IBQuery1.Transaction.StartTransaction;
           for i := 0 to AList.Count -1 do
           begin
              AListCampos := TList.Create;
              TXmlNode(AList[i]).NodesByName('campo',AListCampos);
              with cDsol do
              begin
                 Append;
                 FieldValues['ID_SOLICITUD'] := TXmlNode(AListCampos[0]).ValueAsString;
                 FieldValues['ID_EMPLEADO'] := TXmlNode(AListCampos[1]).ValueAsString;
                 IBQuery1.Close;
                 IBQuery1.ParamByName('ID_SOLICITUD').AsString := TXmlNode(AListCampos[0]).ValueAsString;
                 IBQuery1.Open;
                 FieldValues['ESTADO'] := IBQuery1.FieldByName('DESCRIPCION_ESTADO').AsString;
                 FieldValues['ASOCIADO'] := IBQuery1.FieldByName('ASOCIADO').AsString;
                 FieldValues['FECHA_ANALISTA'] := TXmlNode(AListCampos[2]).ValueAsString;
                 IBQuery2.Close;
                 IBQuery2.ParamByName('ID_EMPLEADO').AsString := TXmlNode(AListCampos[1]).ValueAsString;
                 IBQuery2.Open;
                 FieldValues['EMPLEADO'] := IBQuery2.FieldByName('EMPLEADO').AsString;
                 Post;
              end;
           end;

end;


procedure TFrmSolicitudRemota.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmSolicitudRemota.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;
end;

procedure TFrmSolicitudRemota.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmSolicitudRemota.Cancelar1Click(Sender: TObject);
begin
        cDsol.Filtered := False;
end;

procedure TFrmSolicitudRemota.Buscar1Click(Sender: TObject);
var    vSolicitud :string;
begin
        vSolicitud := InputBox('Buscar Solicitud','Digite el Número de Rad.','');
        with cDsol do
        begin
          Filtered := False;
          Filter := 'ID_SOLICITUD = ' + vSolicitud;
          Filtered := True;
          if RecordCount = 0 then
          begin
            MessageDlg('Solcitud no Encontrada',mtInformation,[mbok],0);
            Filtered := False;
          end;
        end;
end;

procedure TFrmSolicitudRemota.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'fecha' then
           ParValue := vFecha;
end;

procedure TFrmSolicitudRemota.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmSolicitudRemota.BitBtn2Click(Sender: TObject);
begin
        imprimir_reporte(frmMain.ruta1+'reporte\repsolicitudremota.frf');
end;

end.


