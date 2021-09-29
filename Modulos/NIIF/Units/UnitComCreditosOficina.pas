unit UnitComCreditosOficina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvStaticText, StdCtrls, Buttons, Mask, sdXmlDocuments,ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TFrmComCreditosOficina = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Msolicitud: TMaskEdit;
    JVfecha: TJvStaticText;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    JVsolicitante: TJvStaticText;
    JVcuenta: TJvStaticText;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    Mdesgarantia: TMemo;
    Mabogado: TMemo;
    Mavaluo: TMemo;
    Minmueble: TMemo;
    GroupBox4: TGroupBox;
    Mconcepto: TMemo;
    Panel3: TPanel;
    Bregistra: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox6: TGroupBox;
    Mactividad: TMemo;
    GroupBox7: TGroupBox;
    Mcodeudores: TMemo;
    Label5: TLabel;
    JVoficina: TJvStaticText;
    IdTCPClient1: TIdTCPClient;
    procedure MdesgarantiaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BregistraClick(Sender: TObject);
    procedure MdesgarantiaKeyPress(Sender: TObject; var Key: Char);
    procedure MabogadoKeyPress(Sender: TObject; var Key: Char);
    procedure MavaluoKeyPress(Sender: TObject; var Key: Char);
    procedure MinmuebleKeyPress(Sender: TObject; var Key: Char);
    procedure MabogadoExit(Sender: TObject);
    procedure MavaluoExit(Sender: TObject);
    procedure MinmuebleExit(Sender: TObject);
    procedure MconceptoExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MactividadExit(Sender: TObject);
    procedure McodeudoresExit(Sender: TObject);
    procedure MconceptoKeyPress(Sender: TObject; var Key: Char);
    procedure MactividadKeyPress(Sender: TObject; var Key: Char);
  private
    Astream :TStringStream;
    XmlDoc,Xmlres :TsdXmlDocument;
    tamano :Integer;
    nodo :TXmlNode;
    nodo1 :TXmlNode;

    { Private declarations }
  public
  puerto_agencia :Integer;
  host_agencia_remota :string;

  published
    procedure cmChildKey(var msg: TWMKEY); message CM_CHILDKEY;
    procedure reg_observacion(id_observacion: integer; concepto: string);
    { Public declarations }
  end;

var
  FrmComCreditosOficina: TFrmComCreditosOficina;

implementation

uses UnitDmSolicitud,ZlibEx, UnitProgreso;

{$R *.dfm}

procedure TFrmComCreditosOficina.MdesgarantiaExit(Sender: TObject);
begin
        Mdesgarantia.Text := UpperCase(Mdesgarantia.Text)
end;

procedure TFrmComCreditosOficina.FormCreate(Sender: TObject);
begin
        DmSolicitud := TDmSolicitud.Create(Self );
end;

procedure TFrmComCreditosOficina.cmChildKey(var msg: TWMKEY);
begin
if msg.CharCode = VK_RETURN then
    if not (Assigned(ActiveControl) and
           ((ActiveControl is TButton) or
            (ActiveControl is TCustomMemo)))
    then begin
      msg.Result := 1;
      keybd_event(VK_TAB, MapVirtualKey(VK_TAB,0), 0, 0);
      Keybd_event(VK_TAB, MapVirtualKey(VK_TAB,0), KEYEVENTF_KEYUP, 0);
    end;
end;

procedure TFrmComCreditosOficina.BitBtn3Click(Sender: TObject);
begin
        Msolicitud.Text := '';
        Panel1.Enabled := True;
        JVcuenta.Caption := '';
        JVsolicitante.Caption := '';
        Mdesgarantia.Text := '';
        Mabogado.Text := '';
        Mavaluo.Text;
        Minmueble.Text := '';
        Mconcepto.Text := '';
        Mactividad.Text := '';
        Mcodeudores.Text := '';
        Bregistra.Enabled := True;
        Msolicitud.SetFocus;
end;

procedure TFrmComCreditosOficina.BregistraClick(Sender: TObject);
var    AstreamRes :TMemoryStream;
begin
      if MessageDlg('Esta Seguro de Realizar la Transacción',mtInformation,[mbyes,mbno],0) = mryes then
      begin
        frmProgresoServer := TfrmProgresoServer.Create(self);
        frmProgresoServer.Info.Caption := 'Enviando...';
        Application.ProcessMessages;
        frmProgresoServer.Ejecutar;
        XmlDoc := TsdXmlDocument.CreateName('solicitud');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        XmlDoc.Root.WriteString('id_solicitud',Msolicitud.Text);
        XmlDoc.Root.WriteString('id_tipo','1');// 0 PARA CONSULTA Y 1 PARA INSERCION Y ACTUALIZACION
        XmlDoc.Root.WriteString('id_modulo','I');
        nodo := Xmldoc.Root.NodeNew('observaciones');
          if Mdesgarantia.Text  <> '' then
          begin
             nodo1 := nodo.NodeNew('observacion');
             nodo1.WriteInteger('tipo',7);
             nodo1.WriteString('descripcion',Mdesgarantia.Text);
          end;
          if Mabogado.Text  <> '' then
          begin
             nodo1 := nodo.NodeNew('observacion');
             nodo1.WriteInteger('tipo',8);
             nodo1.WriteString('descripcion',Mabogado.Text);
          end;
          if Mavaluo.Text  <> '' then
          begin
             nodo1 := nodo.NodeNew('observacion');
             nodo1.WriteInteger('tipo',9);
             nodo1.WriteString('descripcion',Mavaluo.Text);
          end;
          if Minmueble.Text  <> '' then
          begin
             nodo1 := nodo.NodeNew('observacion');
             nodo1.WriteInteger('tipo',10);
             nodo1.WriteString('descripcion',Minmueble.Text);
          end;
          if Mconcepto.Text <> '' then
          begin
             nodo1 := nodo.NodeNew('observacion');
             nodo1.WriteInteger('tipo',11);
             nodo1.WriteString('descripcion',Mconcepto.Text);
          end;
          if Mactividad.Text <> '' then
          begin
             nodo1 := nodo.NodeNew('observacion');
             nodo1.WriteInteger('tipo',0);
             nodo1.WriteString('descripcion',Mactividad.Text);
          end;
          if Mcodeudores.Text <> '' then
          begin
             nodo1 := nodo.NodeNew('observacion');
             nodo1.WriteInteger('tipo',12);
             nodo1.WriteString('descripcion',Mcodeudores.Text);
          end;
          Astream :=TStringStream.Create('');
          XmlDoc.SaveToStream(Astream);
          with IdTCPClient1 do
          begin
            Port := puerto_agencia;
            Host := host_agencia_remota;
            Connect;
            if Connected then
            begin
              WriteInteger(Astream.Size);
              OpenWriteBuffer;
              WriteStream(Astream);
              CloseWriteBuffer;
              FreeAndNil(Astream);
              tamano := ReadInteger;
              Application.ProcessMessages;
              Astream := TStringStream.Create('');
              AstreamRes := TMemoryStream.Create;
              ReadStream(Astream,tamano,False);
              //descomprime
              AstreamRes := TMemoryStream.Create;
              Astream.Position := 0;
              ZDeCompressStream(Astream,AstreamRes);
              AstreamRes.Seek(0,0);
              Xmlres.LoadFromStream(AstreamRes);
              Disconnect;
            end;
          end;
          nodo := Xmlres.Root.NodeByName('solicitud');
          frmProgresoServer.Cerrar;
          if nodo.ReadBool('actualizado') then
          begin
             MessageDlg('Datos Registrados con Exito',mtInformation,[mbok],0);
             Bregistra.Enabled := False;
          end
          else
          begin
             MessageDlg('Los Datos no fueron Guardados Correctamente',mtwarning,[mbok],0);
             Exit;
          end;
          XmlDoc.SaveToFile('c:\informe.xml');
end;    end;

procedure TFrmComCreditosOficina.MdesgarantiaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mabogado.SetFocus;
            
end;

procedure TFrmComCreditosOficina.MabogadoKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
          Mavaluo.SetFocus
end;

procedure TFrmComCreditosOficina.MavaluoKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
          Minmueble.SetFocus
end;

procedure TFrmComCreditosOficina.MinmuebleKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
          Mconcepto.SetFocus;
end;

procedure TFrmComCreditosOficina.MabogadoExit(Sender: TObject);
begin
        Mabogado.Text := UpperCase(Mabogado.Text)
end;

procedure TFrmComCreditosOficina.MavaluoExit(Sender: TObject);
begin
        Mavaluo.Text := UpperCase(Mavaluo.Text)
end;

procedure TFrmComCreditosOficina.MinmuebleExit(Sender: TObject);
begin
        Minmueble.Text := UpperCase(Minmueble.Text)
end;

procedure TFrmComCreditosOficina.MconceptoExit(Sender: TObject);
begin
        Mconcepto.Text := UpperCase(Mconcepto.Text)
end;

procedure TFrmComCreditosOficina.BitBtn4Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmComCreditosOficina.MactividadExit(Sender: TObject);
begin
        Mactividad.Text := UpperCase(Mactividad.Text);
end;

procedure TFrmComCreditosOficina.McodeudoresExit(Sender: TObject);
begin
        Mcodeudores.Text := UpperCase(Mcodeudores.Text)
end;

procedure TFrmComCreditosOficina.MconceptoKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mactividad.SetFocus
end;

procedure TFrmComCreditosOficina.MactividadKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Mcodeudores.SetFocus
end;

procedure TFrmComCreditosOficina.reg_observacion(id_observacion: integer;
  concepto: string);
begin
        with DmSolicitud.IBsolicitud2 do
        begin
           Close;
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('delete from "col$observacion"');
           SQL.Add('where ID_SOLICITUD = :ID_SOLICITUD and');
           SQL.Add('ID_OBSERVACION = :ID_OBSERVACION');
           ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
           ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
           Open;
           SQL.Clear;
           SQL.Add('insert into "col$observacion"');
           SQL.Add('values(:ID_SOLICITUD,:ID_OBSERVACION,:OBSERVACION)');
           ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
           ParamByName('ID_OBSERVACION').AsInteger := id_observacion;
           ParamByName('OBSERVACION').AsString := concepto;
           Open;
           Close;
           Transaction.Commit;
        end;
end;

end.
