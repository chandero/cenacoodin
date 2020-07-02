unit UnitRatificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, FR_Class, DB, DBClient,
  DBCtrls, IBDatabase, IBCustomDataSet, IBQuery, sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, FR_DSet,
  FR_DBSet, ComCtrls, DateUtils;

type
  TFrmRatificacion = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Msolicitud: TMaskEdit;
    BTbuscar: TBitBtn;
    Label2: TLabel;
    fecha: TStaticText;
    Panel2: TPanel;
    Label3: TLabel;
    nombre: TStaticText;
    identificacion: TStaticText;
    cuenta: TStaticText;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    linea: TStaticText;
    Valor: TStaticText;
    plazo: TStaticText;
    tasa: TStaticText;
    acta: TStaticText;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    frReport1: TfrReport;
    CDestado: TClientDataSet;
    CDestadoaprobado: TBooleanField;
    CDestadonegado: TBooleanField;
    BitBtn3: TBitBtn;
    Label11: TLabel;
    DBoficina: TDBLookupComboBox;
    IBoficina: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IdTCPClient1: TIdTCPClient;
    frDBDataSet1: TfrDBDataSet;
    Panel4: TPanel;
    Mobservacion: TMemo;
    Label12: TLabel;
    Dfecha: TDateTimePicker;
    CDobservacion: TClientDataSet;
    CDobservacionobservacion: TBlobField;
    frDBDataSet2: TfrDBDataSet;
    procedure BitBtn2Click(Sender: TObject);
    procedure BTbuscarClick(Sender: TObject);
    procedure MsolicitudKeyPress(Sender: TObject; var Key: Char);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MsolicitudExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBoficinaEnter(Sender: TObject);
    procedure DBoficinaKeyPress(Sender: TObject; var Key: Char);
    procedure DBoficinaExit(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure MobservacionExit(Sender: TObject);
    procedure DfechaKeyPress(Sender: TObject; var Key: Char);
  private
    des_ente: string;
    host_server: string;
    puerto_server: Integer;
    valida_tcp: Boolean;
    valor_a: currency;
    id_garantia: Integer;
    vPlazo: Integer;
    Astream,AstreamRes :TMemoryStream;
    XmlDoc,Xmlres :TsdXmlDocument;
    nodo,nodo1 :TXmlNode;
    tamano :Integer;

    { Private declarations }
  public
  published
    procedure imprimir_reporte(cadena: string);
    { Public declarations }
  end;

var
  FrmRatificacion: TFrmRatificacion;

implementation

uses UnitImpresion, UnitDmSolicitud, unitGlobales, unitMain,ZLibEx,
  UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmRatificacion.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmRatificacion.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.Clear;
        frReport1.LoadFromFile(cadena);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmRatificacion.BTbuscarClick(Sender: TObject);
var     id_persona :string;
        id_identificacion :Integer;
        ente,tamano :Integer;
        id_Linea :Integer;
        vDias :Integer;
        vDiasConcepto :Integer;
        vFechaMaximo :TDate;
begin
    valor_a := 0;
    if Msolicitud.Text <> '          ' then
    begin
      with DmSolicitud.IBSQL1 do
      begin
        Close;
        if Transaction.InTransaction then
           Transaction.Commit;
        Transaction.StartTransaction;
      end;
      if DBoficina.KeyValue = 1 then
      begin
        with DmSolicitud.IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 24');
          ExecQuery;
          vDiasConcepto := FieldByName('VALOR_MINIMO').AsInteger;
          Close;
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 37');
          ExecQuery;
          vFechaMaximo := FieldByName('VALOR_MINIMO').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT');
          SQL.Add('"col$lineas".DESCRIPCION_LINEA,');
          SQL.Add('"col$enteaprobador".DESCRIPCION_ENTE_APROBADOR,');
          SQL.Add('"col$solicitud".NUMERO_ACTA,');
          SQL.Add('"col$solicitud".LINEA,');
          SQL.Add('"col$solicitud".ID_PERSONA,');
          SQL.Add('"col$solicitud".ID_IDENTIFICACION,');
          SQL.Add('"col$solicitud".PLAZO_APROBADO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"col$solicitud".FECHA_CONCEPTO,');
          SQL.Add('"col$solicitud".ENTE_APROBADOR,');
          SQL.Add('"col$solicitud".GARANTIA,');
          SQL.Add('"col$lineas".TASA');
          SQL.Add('FROM');
          SQL.Add('"col$lineas"');
          SQL.Add('INNER JOIN "col$solicitud" ON ("col$lineas".ID_LINEA = "col$solicitud".LINEA)');
          SQL.Add('INNER JOIN "col$enteaprobador" ON ("col$solicitud".ENTE_APROBADOR = "col$enteaprobador".ID_ENTE_APROBADOR)');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ID_SOLICITUD = :ID_SOLICITUD) and');
          SQL.Add('"col$solicitud".ESTADO in (4,6,10,12)');
          ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
          ExecQuery;
          if RecordCount = 0 then
          begin
             MessageDlg('Solicitud no Encontrada o no se Encuentra Aprobada',mtInformation,[mbok],0);
             Msolicitud.Text := '';
             Msolicitud.SetFocus;
             Exit;
          end;
          vDias := DaysBetween(fFechaActual,FieldByName('FECHA_CONCEPTO').AsDate);
          if FieldByName('FECHA_CONCEPTO').AsDate <= vFechaMaximo then
             vDiasConcepto := vDiasConcepto + 30;
          if vDias >= vDiasConcepto then
          begin
            MessageDlg('La Solicitud no puede ser Ratificada por Vencimiento de Tiempo...',mtWarning,[mbok],0);
            Exit;
          end;
          Panel1.Enabled := False;
          ente := FieldByName('ENTE_APROBADOR').AsInteger;
          vPlazo := FieldByName('PLAZO_APROBADO').AsInteger;
          id_garantia := FieldByName('GARANTIA').AsInteger;
          fecha.Caption := FieldByName('FECHA_CONCEPTO').AsString;
          linea.Caption := FieldByName('DESCRIPCION_LINEA').AsString;
          plazo.Caption := FieldByName('PLAZO_APROBADO').AsString;
          tasa.Caption := define_tasa(FieldByName('LINEA').AsInteger,FieldByName('TASA').AsCurrency);
          //acta.Caption := FieldByName('NUMERO_ACTA').AsString;
          valor_a := FieldByName('VALOR_APROBADO').AsCurrency;
          Valor.Caption := '$'+FormatCurr('#,##0.00',valor_a);
          id_identificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
          id_persona := FieldByName('ID_PERSONA').AsString;
          identificacion.Caption := id_persona;
          Close;
          SQL.Clear;
          SQL.Add('select NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO from "gen$persona"');
          SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ExecQuery;
          nombre.Caption := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM P_CAP_0008 (:ID_AGENCIA,:ID_TIPO_CAPTACION,:ID_IDENTIFICACION,:ID_PERSONA)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 2;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ExecQuery;
          cuenta.Caption := '20' + IntToStr(Agencia) + '-' + Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$enteaprobador"');
          SQL.Add('where ID_ENTE_APROBADOR = :ID_ENTE');
          ParamByName('ID_ENTE').AsInteger := ente;
          ExecQuery;
          des_ente := FieldByName('DESCRIPCION_ENTE_APROBADOR').AsString;
      end;
    end
    else
    begin
        valida_tcp := False;
        XmlDoc := TsdXmlDocument.CreateName('solicitud');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        XmlDoc.Root.WriteString('id_solicitud',Msolicitud.Text);
        XmlDoc.Root.WriteString('id_tipo','0');// 0 PARA CONSULTA Y 1 PARA INSERCION Y ACTUALIZACION
        XmlDoc.Root.WriteString('id_modulo','A');
        Astream := TMemoryStream.Create;
        XmlDoc.SaveToStream(Astream);
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Recibiendo Información de ' + DBoficina.Text;
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'KBs Recibidos: 0';
        frmProgreso.Position := 2; // carga de referencia
        frmProgreso.Ejecutar;
        Application.ProcessMessages;
        with IdTCPClient1 do
        begin
          Port := puerto_server;
          Host := host_server;
          try
            Connect;
          except
          on E: Exception do
          begin
            MessageDlg('Error de Conexión. Favor Verificar en Sistemas' + #13 + E.Message,mtError,[mbok],0);
            Disconnect;
            frmProgreso.Cerrar;
            Exit;
          end;
          end;
          if Connected then
          begin
            WriteInteger(Astream.Size);
            OpenWriteBuffer;
            WriteStream(Astream);
            CloseWriteBuffer;
            FreeAndNil(Astream);
            valida_tcp := True;
            tamano := ReadInteger;
            Application.ProcessMessages;
            Astream := TMemoryStream.Create;
            //descomprime
            AstreamRes := TMemoryStream.Create;
            ReadStream(Astream,tamano,False);
            Astream.Position := 0;
            ZDecompressStream(Astream,AstreamRes);
            frmProgreso.Cerrar;
            AstreamRes.Seek(0,0);
            Xmlres.LoadFromStream(AstreamRes);
            Disconnect;
          end;
          Xmlres.SaveToFile('c:\ratifica.xml');
          nodo := Xmlres.Root.NodeByName('solicitud');
          if nodo.ReadString('encontrado') = 'error' then
          begin
            MessageDlg('Ha Ocurrido un Error En Momento de Ejecución con Mensaje;'+#13+nodo.ReadString('mensaje'),mtError,[mbok],0);
            Msolicitud.SetFocus;
            Exit;
          end;
          if nodo.ReadString('encontrado') = 'false' then
          begin
            MessageDlg('Solicitud no Encontrada',mtInformation,[mbok],0);
            Msolicitud.Text := '';
            Msolicitud.SetFocus;
            Exit;
          end;
          if nodo.ReadInteger('estado') in [4,6,10,12] then
          begin
            nombre.Caption := nodo.ReadString('nombre') + ' ' + nodo.ReadString('p_apellido') + ' ' + nodo.ReadString('s_apellido');
            identificacion.Caption := nodo.ReadString('id_persona');
            id_Linea := nodo.ReadInteger('linea');
            valor_a := nodo.ReadFloat('valor_aprobado');
            Valor.Caption := '$'+FormatCurr('#,##0.00',valor_a);
            plazo.Caption := nodo.ReadString('plazo_aprobado');
            fecha.Caption := nodo.ReadString('fecha_recepcion');
            tasa.Caption := define_tasa(id_Linea,nodo.ReadFloat('tasa_interes'));
            with DmSolicitud.IBSQL1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select DESCRIPCION_LINEA from "col$lineas" where ID_LINEA = :ID_LINEA');
              ParamByName('ID_LINEA').AsInteger := id_Linea;
              ExecQuery;
              linea.Caption := FieldByName('DESCRIPCION_LINEA').AsString;
              Close;
              SQL.Clear;
              SQL.Add('select * from "col$enteaprobador"');
              SQL.Add('where ID_ENTE_APROBADOR = :ID_ENTE');
              ParamByName('ID_ENTE').AsInteger := nodo.ReadInteger('ente_aprobador');
              ExecQuery;
              des_ente := FieldByName('DESCRIPCION_ENTE_APROBADOR').AsString;
            end;
              nodo := Xmlres.Root.NodeByName('extracto');
              cuenta.Caption := '20' + IntToStr(DBoficina.KeyValue) + '-' + Format('%.6d',[nodo.Readinteger('cuenta')]);
          end
          else
          begin
            MessageDlg('Solicitud no Encontrada o no se Encuentra Aprobada',mtInformation,[mbok],0);
            Msolicitud.Text := '';
            Msolicitud.SetFocus;
            Exit;
          end;

          end;
        end;
     end;
end;

procedure TFrmRatificacion.MsolicitudKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRatificacion.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'numero_rad' then
           ParValue := Msolicitud.Text;
        if ParName = 'ente' then
           ParValue := des_ente;
        if ParName = 'asociado' then
           ParValue := nombre.Caption;
        if ParName = 'cuenta' then
           ParValue := cuenta.Caption;
        if ParName = 'fecha' then
           ParValue := fecha.Caption;
        if ParName = 'linea' then
           ParValue := linea.Caption;
        if ParName = 'valor' then
           ParValue := Valor.Caption;
        if ParName = 'plazo' then
           ParValue := plazo.Caption;
        if ParName = 'tasa' then
           ParValue := tasa.Caption;
        if ParName = 'acta' then
           ParValue := acta.Caption;
        if ParName = 'identificacion' then
           ParValue := identificacion.Caption;
        if ParName = 'oficina' then
           ParValue := DBoficina.Text;
        if ParName = 'ente_ratifica' then
           ParValue :=Mensaje_EnteAprobador;
        if ParName = 'fecha_r' then
           ParValue := Dfecha.DateTime;

end;

procedure TFrmRatificacion.BitBtn1Click(Sender: TObject);
var     vSentencia, cadena :string;
begin
        if MessageDlg('Esta Seguro De Imprimir el Reporte',mtInformation,[mbyes,mbok],0) = mryes then
        begin
          if DBoficina.KeyValue = 1 then
          begin
              BitBtn1.Enabled := False;
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
                 FieldValues['estado'] := 16;
                 FieldValues['id_ente'] := 3;
                 FieldValues['valor'] := valor_a;
                 FieldValues['oficina'] := DBoficina.Text;
                 FieldValues['nombres'] := nombre.Caption;
                 FieldValues['id_oficina'] := DBoficina.KeyValue;
                 FieldValues['des_estado'] := 'RATIFICADO';
                 FieldValues['garantia'] := id_garantia;
                 FieldValues['plazo'] := vPlazo;
                 FieldValues['cuenta'] := cuenta.Caption;
                 Post;
              end;// fin del clientdataset
              with DmSolicitud.IBSQL1 do
              begin
                 Close;
                 SQL.Clear;
                 SQL.Add('select * from "col$observacion" where ID_SOLICITUD = :ID_SOLICITUD and ID_OBSERVACION = 17');
                 ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
                 ExecQuery;
                 if RecordCount <> 0 then
                 begin
                   Close;
                   SQL.Clear;
                   SQL.Add('delete from "col$observacion" where ID_SOLICITUD = :ID_SOLICITUD  and ID_OBSERVACION = 17');
                   ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
                   ExecQuery;
                 end;// fin del valida registros
                 Close;
                 SQL.Clear;
                 SQL.Add('insert into "col$observacion" values (:ID_SOLICITUD,17,:OBSERVACION)');
                 ParamByName('ID_SOLICITUD').AsString := Msolicitud.Text;
                 ParamByName('OBSERVACION').AsString := Mobservacion.Text;
                 ExecQuery;
                 Transaction.Commit;
              end;// fin del dmsolicitud
{                 if Mobservacion.Text <> '' then
                 begin
                   CDobservacion.Append;
                   CDobservacion.FieldValues['observacion'] := Mobservacion.Text;
                   CDobservacion.Post;
                end;}
          end
          else
          begin
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
               FieldValues['estado'] := 16;
               FieldValues['id_ente'] := 3;
               FieldValues['valor'] := valor_a;
               FieldValues['oficina'] := DBoficina.Text;
               FieldValues['nombres'] := nombre.Caption;
               FieldValues['id_oficina'] := DBoficina.KeyValue;
               FieldValues['des_estado'] := 'RATIFICADO';
               FieldValues['garantia'] := id_garantia;
               FieldValues['plazo'] := vPlazo;
               FieldValues['cuenta'] := cuenta.Caption;
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
              ParamByName('ASOCIADO').AsString := nombre.Caption;
              ParamByName('VALOR_SOLICITUD').AsCurrency := valor_a;
              ParamByName('FECHA_ANALISIS').AsDate := fFechaActual;
              ParamByName('TIPO').AsString := 'E';
              ParamByName('ID_AGENCIA').AsInteger := DBoficina.KeyValue;
              ParamByName('ENTE_APROBADOR').AsInteger := Id_EnteAprobador;
              ParamByName('GARANTIA').AsInteger := id_garantia;
              ParamByName('CONCEPTO').AsString := Mobservacion.Text;
              ExecSQL;
              Transaction.Commit;
              Transaction.StartTransaction;
            end;
            except
            end;
          end;// fin del desea imprimir
                 if Mobservacion.Text <> '' then
                 begin
                   CDobservacion.Append;
                   CDobservacion.FieldValues['observacion'] := Mobservacion.Text;
                   CDobservacion.Post;
                end;
         if DBoficina.KeyValue <> 1 then
         begin
            vSentencia := 'insert into "col$registrosesion" values (' + '''' + Msolicitud.Text + '''' + ',' + '16' + ',' +
                          '''' + DBAlias + '''' + ',' + '''' + acta.Caption + '''' + ',' + '''' + DateToStr(fFechaActual) + '''' +
                          ',' + '''' +  '00:00:00' + '''' +  ',' + '''' +  '00:00:00' + '''' + ',' + IntToStr(Id_EnteAprobador) + ',' + IntToStr(DBoficina.KeyValue) +
                          ',' + '0' + ',' + '0' + ')';
            XmlDoc := TsdXmlDocument.CreateName('query_info');
            XmlDoc.XmlFormat := xfReadable;
            Xmlres := TsdXmlDocument.Create;
            Xmlres.EncodingString := 'ISO8859-1';
            Xmlres.XmlFormat := xfReadable;
            Nodo := XmlDoc.Root.NodeNew('querys');
            Nodo1 := Nodo.NodeNew('query');
            Nodo1.WriteString('tipo','insert');
            nodo1.WriteString('sentencia',vSentencia);
            with IdTCPClient1 do
            begin
              Port := buscaservicio(DBoficina.KeyValue,1).vPuerto;
              Host := buscaservicio(DBoficina.KeyValue,1).vHost;
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
              Cadena := ReadLn();
              AStream := TMemoryStream.Create;
              XmlDoc.SaveToStream(AStream);
              XmlDoc.SaveToFile('c:\res.xml');
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
         end;
       Mobservacion.Text := vSentencia;
          imprimir_reporte(frmMain.wpath + 'reporte\repRatificacion.frf');
        end;
end;

procedure TFrmRatificacion.BitBtn3Click(Sender: TObject);
begin
        fecha.Caption := '';
        Panel1.Enabled := True;
        nombre.Caption := '';
        identificacion.Caption := '';
        cuenta.Caption := '';
        Msolicitud.Text := '';
        linea.Caption := '';
        Valor.Caption := '';
        plazo.Caption := '';
        tasa.Caption := '';
        BitBtn1.Enabled := True;
        CDobservacion.CancelUpdates;
        Mobservacion.Text := '';
        Dfecha.Date := vFechaEnte;
        DBoficina.SetFocus;

end;

procedure TFrmRatificacion.MsolicitudExit(Sender: TObject);
begin
        BTbuscar.Click;
end;

procedure TFrmRatificacion.FormCreate(Sender: TObject);
begin
        IBoficina.Open;
        IBoficina.Last;
        //DBoficina.KeyValue := 1;
        Dfecha.Date := vFechaEnte;
end;

procedure TFrmRatificacion.DBoficinaEnter(Sender: TObject);
begin
        DBoficina.DropDown
end;

procedure TFrmRatificacion.DBoficinaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmRatificacion.DBoficinaExit(Sender: TObject);
begin

        if DBoficina.KeyValue > 1 then
        begin
          host_server := buscaservicio(DBoficina.KeyValue,4).vHost;
          puerto_server := buscaservicio(DBoficina.KeyValue,4).vPuerto;
        end;

{        if DBoficina.KeyValue = 2 then
        begin
          host_server := host_abrego;
          puerto_server := puerto_abrego;
        end;
        if DBoficina.KeyValue = 3 then
        begin
          host_server := host_convencion;
          puerto_server := puerto_convencion;
        end;
        if DBoficina.KeyValue = 4 then
        begin
          host_server := host_aguachica;
          puerto_server := puerto_aguachica;
        end;}

end;

procedure TFrmRatificacion.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
var
  paquete :Currency;
begin
        if valida_tcp then
        begin
          AWorkMode := wmRead;
          frmProgreso.Position := AWorkCount;
          paquete := AWorkCount/1000;
          frmProgreso.InfoLabel := 'Kbs Recibidos : ' + CurrToStr(paquete);
          Application.ProcessMessages;
        end;
end;

procedure TFrmRatificacion.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
        if valida_tcp then
        begin
          AWorkMode := wmRead;
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Titulo := 'Recibiendo Información de ' + DBoficina.Text + ' Tamaño: ' + CurrToStr(AWorkCountMax/1000) + ' Kbs';
        end;

end;

procedure TFrmRatificacion.MobservacionExit(Sender: TObject);
begin
        Mobservacion.Text := UpperCase(Mobservacion.Text)
end;

procedure TFrmRatificacion.DfechaKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
           Mobservacion.SetFocus
end;

end.
