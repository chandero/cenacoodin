unit UnitAnulaSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, JvStaticText, FR_Class,
  FR_DSet, FR_DBSet, DB, IBCustomDataSet, IBQuery, DBCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, sdXmlDocuments,IdTCPClient,
  IBDatabase;

type
  TFrmAnulaSolicitud = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Msolicitud: TMaskEdit;
    BTbuscar: TBitBtn;
    Label2: TLabel;
    JVfecha: TJvStaticText;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Manulacion: TMemo;
    Panel4: TPanel;
    Label4: TLabel;
    JVnombre: TJvStaticText;
    JVdocumento: TJvStaticText;
    JVlinea: TJvStaticText;
    JVcuenta: TJvStaticText;
    JVgarantia: TJvStaticText;
    JVvalor: TJvStaticText;
    JVcapital: TJvStaticText;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    JVinteres: TJvStaticText;
    JVplazo: TJvStaticText;
    BtAnula: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BTreporte: TBitBtn;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    Label13: TLabel;
    JVestado: TJvStaticText;
    Label14: TLabel;
    DBoficina: TDBLookupComboBox;
    DSoficina: TDataSource;
    IBoficina: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure BitBtn3Click(Sender: TObject);
    procedure BTbuscarClick(Sender: TObject);
    procedure MsolicitudKeyPress(Sender: TObject; var Key: Char);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BTreporteClick(Sender: TObject);
    procedure ManulacionExit(Sender: TObject);
    procedure BtAnulaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBoficinaEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBoficinaExit(Sender: TObject);
    procedure DBoficinaKeyPress(Sender: TObject; var Key: Char);
    procedure MsolicitudExit(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
  private
  id_linea :Integer;
  tasa_interes :Currency;
    des_enteaprobador: string;
    des_agencia: string;
    Vfecha: tdate;
    id_garantia: integer;
    XmlDoc :TsdXmlDocument;
    Xmlres :TsdXmlDocument;
    nodo :TXmlNode;
    nodo1 :TXmlNode;
    valida_tcp :Boolean;
    id_estado :Integer;
    procedure imprimir_reporte(cadena: string);
    procedure inicializar;
    procedure buscaagencias(hostRemoto: string;puerto :Integer);
    procedure AnulaSolicitud(HostRemoto: string; Puerto: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAnulaSolicitud: TFrmAnulaSolicitud;

implementation

uses UnitDmSolicitud,UnitGlobales, UnitImpresion, unitMain,
  UnitPantallaProgreso,ZlibEx;

{$R *.dfm}

procedure TFrmAnulaSolicitud.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmAnulaSolicitud.BTbuscarClick(Sender: TObject);
var     id_identificacion :Integer;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
          SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".ESTADO,');
          SQL.Add('"col$solicitud".FECHA_RECEPCION,');
          SQL.Add('"col$solicitud".FECHA_CONCEPTO,');
          SQL.Add('"col$solicitud".ENTE_APROBADOR,');
          SQL.Add('"col$solicitud".PLAZO_APROBADO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$enteaprobador".DESCRIPCION_ENTE_APROBADOR,');
          SQL.Add('"col$solicitud".AMORTIZACION,');
          SQL.Add('"col$solicitud".GARANTIA,');
          SQL.Add('"col$solicitud".PAGO_INTERES,');
          SQL.Add('"col$solicitud".TASA_INTERES,');
          SQL.Add('"col$solicitud".LINEA,');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "col$lineas" ON ("col$solicitud".LINEA = "col$lineas".ID_LINEA)');
          SQL.Add('INNER JOIN "col$garantia" ON ("col$solicitud".GARANTIA = "col$garantia".ID_GARANTIA)');
          SQL.Add('LEFT OUTER JOIN "col$enteaprobador" ON ("col$solicitud".ENTE_APROBADOR = "col$enteaprobador".ID_ENTE_APROBADOR)');
          SQL.Add('INNER JOIN "col$estadosolicitud" ON ("col$solicitud".ESTADO = "col$estadosolicitud".ID_ESTADO)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          Open;
          if RecordCount = 0 then
          begin
            MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
            Msolicitud.SetFocus;
            Exit;
          end;
          if FieldByName('ESTADO').AsInteger in [5,6,7,10,11,15,16] then
          begin
            MessageDlg('La Solicitud se Encuentra en Estado ' + FieldByName('DESCRIPCION_ESTADO').AsString,mtInformation,[MBOK],0);
            Msolicitud.SetFocus;
            Exit;
          end;
          BtAnula.Enabled := True;
          Vfecha := FieldByName('FECHA_CONCEPTO').AsDateTime;
          if Vfecha = 0 then
             Vfecha := vFechaEnte;
          des_enteaprobador := FieldByName('DESCRIPCION_ENTE_APROBADOR').AsString;
          JVdocumento.Caption := FieldByName('ID_PERSONA').AsString;
          id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          JVfecha.Caption := FieldByName('FECHA_RECEPCION').AsString;
          JVlinea.Caption := FieldByName('DESCRIPCION_LINEA').AsString;
          JVgarantia.Caption := FieldByName('DESCRIPCION_GARANTIA').AsString;
          JVvalor.Caption := FormatCurr('#,##0.00',FieldByName('VALOR_APROBADO').AsCurrency);
          JVplazo.Caption := FieldByName('PLAZO_APROBADO').AsString;
          if JVplazo.Caption = '' then
             JVplazo.Caption := '0';
          JVinteres.Caption := FieldByName('PAGO_INTERES').AsString;
          JVcapital.Caption := FieldByName('AMORTIZACION').AsString;
          id_linea := FieldByName('LINEA').AsInteger;
          tasa_interes := FieldByName('TASA_INTERES').AsCurrency;
          JVestado.Caption := FieldByName('DESCRIPCION_ESTADO').AsString;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
          SQL.Add('FROM');
          SQL.Add('"gen$persona"');
          SQL.Add('WHERE');
          SQL.Add('("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("gen$persona".ID_PERSONA = :ID_PERSONA)');
          ParamByName('ID_PERSONA').AsString := JVdocumento.Caption;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          Open;
          JVnombre.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          SQL.Clear;
          SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := JVdocumento.Caption;
          Open;
          JVcuenta.Caption := '20' + IntToStr(DBoficina.KeyValue) + '-' + Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
          Manulacion.SetFocus;
          SQL.Clear;
          SQL.Add('select * from "gen$agencia"');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          des_agencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
        end;
end;

procedure TFrmAnulaSolicitud.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmAnulaSolicitud.MsolicitudKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TFrmAnulaSolicitud.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'cuenta' then
           ParValue := JVcuenta.Caption;
        if ParName = 'asociado' then
           ParValue := JVnombre.Caption;
        if ParName = 'ente' then
           ParValue := des_enteaprobador;
        if ParName = 'linea' then
           ParValue := JVlinea.Caption;
        if ParName = 'oficina' then
           ParValue := des_agencia;
        if ParName = 'amortizacion' then
           ParValue := JVcapital.Caption;
        if ParName = 'garantia' then
           ParValue := JVgarantia.Caption;
        if ParName = 'pago_interes' then
           ParValue := JVinteres.Caption;
        if ParName = 'tasa' then
           ParValue := define_tasa(id_linea,tasa_interes);
        if ParName = 'acta' then
           ParValue := frmMain.n_acta;
        if ParName = 'identificacion' then
           ParValue := JVdocumento.Caption;
        if ParName = 'numero_rad' then
           ParValue := Msolicitud.Text;
        if ParName = 'valor' then
           ParValue := JVvalor.Caption;
        if ParName = 'plazo' then
           ParValue := JVplazo.Caption;
        if Vfecha <> 0 then
        begin
           if parname = 'fecha' then
           ParValue := Vfecha;
        end
        else
        begin
          if parname = 'fecha' then
          ParValue := vFechaEnte;
        end;
        if ParName = 'concepto' THEN
          ParValue := Manulacion.Text;
        if ParName = 'oficina' then
          ParValue := DBoficina.Text;

end;

procedure TFrmAnulaSolicitud.BTreporteClick(Sender: TObject);
begin
        imprimir_reporte(frmMain.wpath + 'reporte\repanulacion.frf');
end;

procedure TFrmAnulaSolicitud.ManulacionExit(Sender: TObject);
begin
        Manulacion.Text := UpperCase(Manulacion.Text);
end;

procedure TFrmAnulaSolicitud.BtAnulaClick(Sender: TObject);
begin
       if Manulacion.Text = '' then
          if MessageDlg('El Campo Concepto se Encuentra Vacio Desea Continuar?',mtInformation,[mbyes,mbno],0) = mrno then
          begin
             Manulacion.SetFocus;
             Exit;
          end;

       if MessageDlg('Seguro de Realizar la Operación',mtInformation,[mbno,mbyes],0) = mrno then
          Exit;
       if DBoficina.KeyValue = Agencia then
       begin
        with DmSolicitud.IBSolicitud1 do
        begin
         try
          SQL.Clear;
          SQL.Add('update "col$solicitud" set ESTADO = 15, NUMERO_ACTA = :ACTA where ID_SOLICITUD = :ID_SOLICITUD');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ParamByName('ACTA').AsString := frmMain.n_acta;
          ExecSQL;
          SQL.Clear;
          SQL.Add('delete from "col$observacion" where ID_SOLICITUD = :ID_SOLICITUD and ID_OBSERVACION = 16');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ExecSQL;
          Transaction.CommitRetaining;
          SQL.Clear;
          SQL.Add('insert into "col$observacion" values (:ID_SOLICITUD,16,:OBSERVACION)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ParamByName('OBSERVACION').AsString := UpperCase(Manulacion.Text);
          ExecSQL;
          Transaction.Commit;
          BTreporte.Enabled := True;
          BTreporte.Click;
          BtAnula.Enabled := False;
          with frmMain.CDinforme do
          begin
            Filtered := False;
            Filter := 'radicado = ' + Msolicitud.Text;
            Filtered := True;
            if FieldByName('radicado').AsString <> '' then
               Delete;
            Filtered := False;
            Append;
            FieldValues['radicado'] := Msolicitud.Text;
            FieldValues['estado'] := 15;
            FieldValues['id_ente'] := Id_EnteAprobador;
            FieldValues['valor'] := 0;
            FieldValues['oficina'] := DBoficina.Text;
            FieldValues['nombres'] := jvnombre.Caption;
            FieldValues['id_oficina'] := Agencia;
            FieldValues['des_estado'] := 'ANULADO';
            FieldValues['garantia'] := id_garantia;
            FieldValues['plazo'] := 0;//StrToInt(JVplazo.Caption);
            FieldValues['cuenta'] := JVcuenta.Caption;
            Post;
         end;
         except
           on E: Exception do
           begin
             MessageDlg('Error al Actualizar la Informacion, Con Mensaje :' + #13 + E.Message,mtError,[mbok],0);
             Transaction.Rollback;
           end;
          end;// fin del try
         end;// fin with
        end
        else// fin del if primario-
          AnulaSolicitud(BuscaServicio(DBoficina.KeyValue,1).vHost,BuscaServicio(DBoficina.KeyValue,1).vPuerto);
{          if DBoficina.KeyValue = 2 then
             AnulaSolicitud(BuscaServicio( ,PCAbrego)
             else if DBoficina.KeyValue = 3 then
                AnulaSolicitud(host_convencion,PCConvencion)
                else if DBoficina.KeyValue = 4 then
                   AnulaSolicitud('192.168.203.2',3052); }

          if DBoficina.KeyValue <> 1 then
          begin
            with DmSolicitud.IBSolicitud1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('update "col$solicitudanalistaof" set ES_VIGENTE = 0 where ID_SOLICITUD = :ID_SOLICITUD and ID_AGENCIA = :ID_AGENCIA');
              ParamByName('ID_SOLICITUD').AsString;
              ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
              ExecSQL;
              Transaction.Commit;
            end;
          end;
end;

procedure TFrmAnulaSolicitud.inicializar;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
        end;
        Msolicitud.Text := '';
        JVnombre.Caption := '';
        JVdocumento.Caption := '';
        JVlinea.Caption := '';
        JVgarantia.Caption := '';
        JVvalor.Caption := '';
        JVplazo.Caption := '';
        JVcapital.Caption := '';
        JVinteres.Caption := '';
        Msolicitud.SetFocus;
        BTreporte.Enabled := False;
        BtAnula.Enabled := False;
        Manulacion.Text := '';
        JVestado.Caption := '';
        JVcuenta.Caption := '';
end;

procedure TFrmAnulaSolicitud.BitBtn2Click(Sender: TObject);
begin
        inicializar
end;

procedure TFrmAnulaSolicitud.FormShow(Sender: TObject);
begin
        inicializar
end;

procedure TFrmAnulaSolicitud.buscaagencias(hostRemoto: string;puerto :Integer);
var     cadena,sentencia :string;
        tamano,id_estado,i :Integer;
        AstreamRes,Astream :TMemoryStream;
        valor_a :Currency;
        AList,AListCampos:TList;
begin
        sentencia := 'select * from DATOS_SOLICITUD(' + '''' + Msolicitud.Text + '''' + ')';
        //ShowMessage(sentencia);
        XmlDoc := TsdXmlDocument.CreateName('query_info');
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        Nodo := XmlDoc.Root.NodeNew('querys');
        Nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
           with IdTCPClient1 do
           begin
             Port := Puerto;
             Host := hostRemoto;
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
                frmProgreso.Position := 2;
                Application.ProcessMessages;
                frmProgreso.Min := 0;
                frmProgreso.Ejecutar;
                //Cadena := ReadLn();
                Cadena := ReadLn();
                AStream := TMemoryStream.Create;
                XmlDoc.SaveToStream(AStream);
                WriteInteger(AStream.Size);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                FreeAndNil(AStream);
                tamano := ReadInteger;
                AStream := TMemoryStream.Create;
                ReadStream(Astream,tamano,False);
                XmlRes.LoadFromStream(AStream);
                Disconnect;
                frmProgreso.Cerrar;
           end;
           end;
           Xmlres.SaveToFile('C:\WUM12.XML');
           AList := TList.Create;
           Nodo := XmlRes.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
              AListCampos := TList.Create;
              try
                TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                JVfecha.Caption := TXmlNode(AListCampos[0]).ValueAsString;
                JVnombre.Caption := TXmlNode(AListCampos[1]).ValueAsString;
                JVdocumento.Caption := TXmlNode(AListCampos[2]).ValueAsString;
                JVcuenta.Caption := '20' + IntToStr(DBoficina.KeyValue) + '-' + Format('%.6d',[TXmlNode(AListCampos[3]).ValueAsInteger]);
                JVlinea.Caption := TXmlNode(AListCampos[4]).ValueAsString;
                JVgarantia.Caption := TXmlNode(AListCampos[5]).ValueAsString;
                JVcapital.Caption := TXmlNode(AListCampos[6]).ValueAsString;
                JVvalor.Caption := CurrToStrF(TXmlNode(AListCampos[7]).ValueAsFloat,ffCurrency,0);
                JVplazo.Caption := TXmlNode(AListCampos[8]).ValueAsString;
                JVinteres.Caption := TXmlNode(AListCampos[9]).ValueAsString;
                JVestado.Caption := TXmlNode(AListCampos[10]).ValueAsString;
                id_estado := TXmlNode(AListCampos[11]).ValueAsInteger;
              except
              begin
                MessageDlg('Datos no Encontrados',mtInformation,[mbok],0);
                Msolicitud.SetFocus;
              end;
              end;
           end;
           if id_estado in [1,2,3,4,5,8,9,12,13,14,16] then
           begin
           BtAnula.Enabled := True;
           end
           else
           Msolicitud.SetFocus;
           BtAnula.Enabled := True;
end;

procedure TFrmAnulaSolicitud.DBoficinaEnter(Sender: TObject);
begin
        DBoficina.DropDown
end;

procedure TFrmAnulaSolicitud.FormCreate(Sender: TObject);
begin
        with IBoficina do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Open;
          Last;
        end;
        DBoficina.KeyValue := Agencia;
        //DBoficina.Enabled := False;
end;

procedure TFrmAnulaSolicitud.DBoficinaExit(Sender: TObject);
begin
        if DBoficina.KeyValue = 1 then
           BTbuscar.Click
          else
          begin
            buscaagencias(buscaservicio(DBoficina.KeyValue,1).vHost,buscaservicio(DBoficina.KeyValue,1).vPuerto);
          end;


         {  if DBoficina.KeyValue = 2 then
              buscaagencias(host_abrego,PCAbrego)
            else if DBoficina.KeyValue = 3 then
                 buscaagencias(host_convencion,PCConvencion)
                 else if DBoficina.KeyValue = 4 then
                      buscaagencias('192.168.203.2',3052)}

end;

procedure TFrmAnulaSolicitud.DBoficinaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmAnulaSolicitud.MsolicitudExit(Sender: TObject);
begin
//        BTbuscar.Click
end;

procedure TFrmAnulaSolicitud.AnulaSolicitud(HostRemoto: string;
  Puerto: integer);
var     sentencia,cadena :string;
        Astream :TMemoryStream;
        tamano,i :Integer;
        AList,AListCampos:TList;
begin
        sentencia := 'EXECUTE PROCEDURE ANULA_SOLICITUD('+ '''' + Msolicitud.Text + ''''+ ',' + '''' + Manulacion.Text + '''' + ')';
        XmlDoc := TsdXmlDocument.CreateName('query_info');
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        Nodo := XmlDoc.Root.NodeNew('querys');
        Nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','execute');
        nodo1.WriteString('sentencia',sentencia);
           with IdTCPClient1 do
           begin
             Port := Puerto;
             Host := hostRemoto;
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
                frmProgreso.Position := 2;
                Application.ProcessMessages;                
                frmProgreso.Min := 0;
                frmProgreso.Ejecutar;
                //Cadena := ReadLn();
                Cadena := ReadLn();
                AStream := TMemoryStream.Create;
                XmlDoc.SaveToStream(AStream);
                WriteInteger(AStream.Size);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                FreeAndNil(AStream);
                tamano := ReadInteger;
                AStream := TMemoryStream.Create;
                ReadStream(Astream,tamano,False);
                XmlRes.LoadFromStream(AStream);
                Disconnect;
                frmProgreso.Cerrar;
           end;
           end;
           with IBQuery1 do
           begin
             Close;
             if Transaction.InTransaction then
                Transaction.Rollback;
             Transaction.StartTransaction;
             SQL.Clear;
             Close;
             SQL.Clear;
             SQL.Add('select ID_SOLICITUD from "col$solicitudanalistaof" where ID_SOLICITUD = :ID_SOLICITUD and ID_AGENCIA = :ID_AGENCIA');
             ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
             ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
             Open;
             if RecordCount > 0 then
             begin
               Close;
               SQL.Clear;
               SQL.Add('update "col$solicitudanalistaof" set ES_VIGENTE = 0 where ID_SOLICITUD = :ID_SOLICITUD and ID_AGENCIA = :ID_AGENCIA');
               ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
               ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
               ExecSQL;
             end;
              Transaction.Commit;
           end;

           Xmlres.SaveToFile('C:\WUM12.XML');
           MessageDlg('Solicitud Anulada con Exito',mtInformation,[mbok],0);
           BTreporte.Enabled := True;
           BTreporte.Click;
           BtAnula.Enabled := False;
           with frmMain.CDinforme do
           begin
             Filtered := False;
             Filter := 'radicado = ' + Msolicitud.Text;
             Filtered := True;
             if FieldByName('radicado').AsString <> '' then
                Delete;
             Filtered := False;
             Append;
             FieldValues['radicado'] := Msolicitud.Text;
             FieldValues['estado'] := 15;
             FieldValues['id_ente'] := Id_EnteAprobador;
             FieldValues['valor'] := 0;
             FieldValues['oficina'] := DBoficina.Text;
             FieldValues['nombres'] := jvnombre.Caption;
             FieldValues['id_oficina'] := Agencia;
             FieldValues['des_estado'] := 'ANULADO';
             FieldValues['garantia'] := id_garantia;
             FieldValues['plazo'] := 0;//StrToInt(JVplazo.Caption);
             FieldValues['cuenta'] := JVcuenta.Caption;
             Post;
          end;
          try
            with DmSolicitud.IBSolicitud1 do
            begin
              Close;
              if Transaction.InTransaction then
                 Transaction.Commit;
              Transaction.StartTransaction;
              SQL.Clear;
              SQL.Add('insert into "col$registroagencia" values (');
              SQL.Add(':ID_SOLICITUD,:ID_EMPLEADO,:ASOCIADO,:VALOR_SOLICITUD,:FECHA_ANALISIS,:TIPO,:ID_AGENCIA,:ENTE_APROBADOR,:GARANTIA,:CONCEPTO)');
              ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
              ParamByName('ID_EMPLEADO').AsString := DBAlias;
              ParamByName('ASOCIADO').AsString := JVnombre.Caption;
              ParamByName('VALOR_SOLICITUD').AsCurrency := 0;
              ParamByName('FECHA_ANALISIS').AsDate := vFechaEnte;
              ParamByName('TIPO').AsString := 'E';
              ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
              ParamByName('ENTE_APROBADOR').AsInteger := Id_EnteAprobador;
              ParamByName('GARANTIA').AsInteger := id_garantia;
              ParamByName('CONCEPTO').Clear;
              ExecSQL;
              Transaction.Commit;
           end;
           except
         end;

           inicializar;
end;

procedure TFrmAnulaSolicitud.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var     paquete :Currency;
begin
          frmProgreso.Position := AWorkCount;
          paquete := AWorkCount/1000;
          frmProgreso.InfoLabel := 'Kbs Recibidos : ' + CurrToStr(paquete);
          Application.ProcessMessages;

end;

procedure TFrmAnulaSolicitud.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Titulo := 'Recibiendo Información de ' + DBoficina.Text + ' Tamaño: ' + CurrToStr(AWorkCountMax/1000) + ' Kbs';

end;

end.
