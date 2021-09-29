unit UnitEstadoSolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, ComCtrls, Buttons, DB, DBClient,
  FR_DSet, FR_DBSet, FR_Class, IBCustomDataSet, IBQuery, IBDatabase, DateUtils,
  JvDbPrgrss, DBTables, IBExtract,IdTCPConnection, sdXmlDocuments,IdTCPClient,
  IdBaseComponent, IdComponent, UnitdmGeneral;

type
  TFrmEstadoSolicitud = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBestado: TDBLookupComboBox;
    Panel2: TPanel;
    
    Label2: TLabel;
    Label3: TLabel;
    DTfechaini: TDateTimePicker;
    DTfechafin: TDateTimePicker;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CDestado: TClientDataSet;
    CDestadoid_estado: TSmallintField;
    CDestadoestado: TStringField;
    IBrepSolicitud: TIBQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBtotal: TIBQuery;
    frDBDataSet2: TfrDBDataSet;
    CDaprobado: TClientDataSet;
    CDaprobadonombre: TStringField;
    CDaprobadofecha: TDateField;
    CDaprobadosolicitud: TStringField;
    CDaprobadovalor: TIntegerField;
    CDaprobadodias: TIntegerField;
    frDBDataSet3: TfrDBDataSet;
    CDcreditos: TClientDataSet;
    CDcreditossolicitud: TStringField;
    CDcreditosnombre: TStringField;
    CDcreditosvalor_aprobado: TCurrencyField;
    CDcreditosdesembolsado: TCurrencyField;
    frDBDataSet4: TfrDBDataSet;
    JV: TJvDBProgress;
    CDaprobadodias_ratificado: TStringField;
    CDaprobadofecha_ratificado: TStringField;
    IBRatifica: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBanalisis: TIBQuery;
    frDBDataSet5: TfrDBDataSet;
    IdTCPClient1: TIdTCPClient;
    CDaprobadodesc_agencia: TStringField;
    CDaprobadoid_agencia: TIntegerField;
    IBagencia: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure JVPercentChange(Sender: TObject; PercentDone: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   //a: Integer;
    XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo,nodo1 :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;
    id_agencia :Integer;
    procedure imprimir_reporte(cadena: string);
    function IsDuplicate(DBName: string): string;
    procedure SolicitudAgencia(puerto,id_agencia: integer; host_r,DesAgecnia: string);

    { Private declarations }
  public
  procedure solicitud_aprobada;
  published
    procedure solicitudes;
    { Public declarations }
  end;

var
  FrmEstadoSolicitud: TFrmEstadoSolicitud;
  dmGeneral: TdmGeneral;

implementation

uses UnitDmSolicitud, UnitImpresion, UnitMain, UnitGlobales,
  UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmEstadoSolicitud.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction2.DefaultDatabase := dmGeneral.IBDatabase1;

        IBrepSolicitud.Database := dmGeneral.IBDatabase1;
        IBtotal.Database := dmGeneral.IBDatabase1;
        IBRatifica.Database := dmGeneral.IBDatabase1;
        IBanalisis.Database := dmGeneral.IBDatabase1;
        IBagencia.Database := dmGeneral.IBDatabase1;


        DTfechaini.DateTime := Date;
        DTfechafin.Date := Date;
        DmSolicitud := TDmSolicitud.Create(Self);
        with DmSolicitud.IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from "col$estadosolicitud"');
          ExecQuery;
          while not Eof do
          begin
            CDestado.Append;
            CDestado.FieldValues['id_estado'] := FieldByName('ID_ESTADO').AsInteger;
            CDestado.FieldValues['estado'] := FieldByName('DESCRIPCION_ESTADO').AsString;
            CDestado.Post;
            Next;
          end;
          Close;
        end;
        CDestado.Append;
        CDestado.FieldValues['id_estado'] := 999;
        CDestado.FieldValues['estado'] := 'TODOS';
        CDestado.Post;
        DBestado.KeyValue := 999;

end;

procedure TFrmEstadoSolicitud.BitBtn1Click(Sender: TObject);
begin
          if IBTransaction1.InTransaction then
             IBTransaction1.Commit;
          IBTransaction1.StartTransaction;
          if StrToInt(DBestado.KeyValue) in [2,3,9] then
          begin
            IBanalisis.Close;
            IBanalisis.ParamByName('ESTADO').AsSmallInt := DBestado.KeyValue;
            IBanalisis.ParamByName('FECHA_INI').AsDateTime := DTfechaini.DateTime;
            IBanalisis.ParamByName('FECHA_FIN').AsDateTime := DTfechafin.DateTime;
            IBanalisis.Open;
            if IBanalisis.RecordCount = 0 then
            begin
              MessageDlg('La Consulta no Arrojo Resultados',mtInformation,[mbok],0);
              Exit;
            end;
            imprimir_reporte(frmMain.ruta1+'reporte\repestadosol1.frf');
            Exit;
          end;
          if DBestado.KeyValue <> 999 then
          begin
            IBrepSolicitud.Close;
            IBrepSolicitud.ParamByName('ESTADO').AsSmallInt := DBestado.KeyValue;
            IBrepSolicitud.ParamByName('FECHA_INI').AsDateTime := DTfechaini.DateTime;
            IBrepSolicitud.ParamByName('FECHA_FIN').AsDateTime := DTfechafin.DateTime;
            IBrepSolicitud.Open;
            if IBrepSolicitud.RecordCount = 0 then
            begin
              MessageDlg('La Consulta no Arrojo Resultados',mtInformation,[mbok],0);
              Exit;
            end;
            imprimir_reporte(frmMain.ruta1+'reporte\repestadosol.frf');
          end
          else
          begin
            IBtotal.Close;
            IBtotal.ParamByName('FECHA_INI').AsDateTime := DTfechaini.DateTime;
            IBtotal.ParamByName('FECHA_FIN').AsDateTime := DTfechafin.DateTime;
            IBtotal.Open;
            if IBtotal.RecordCount = 0 then
            begin
              MessageDlg('La Consulta no Arrojo Resultados',mtInformation,[mbok],0);
              Exit;
            end;
            Empleado;
            imprimir_reporte(frmMain.ruta1+'reporte\repestadosoltotal.frf');
          end;

end;

procedure TFrmEstadoSolicitud.BitBtn2Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmEstadoSolicitud.imprimir_reporte(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.Dictionary.Variables.Variable['EMPRESA'] := QuotedStr(Empresa);
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmEstadoSolicitud.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'estado' then
           ParValue := DBestado.Text;
        if ParName = 'fecha_ini' then
           ParValue := DTfechaini.DateTime;
        if ParName = 'fecha_fin' then
           ParValue := DTfechafin.DateTime;
        if ParName = 'empleado' then
           ParValue := Nombres + ' ' + Apellidos;

end;

procedure TFrmEstadoSolicitud.solicitud_aprobada;
begin
        CDaprobado.CancelUpdates;
        CDcreditos.CancelUpdates;
        if IBTransaction2.InTransaction then
           ibtransaction2.Rollback;
        ibtransaction2.StartTransaction;
        with IBtotal do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$solicitud".FECHA_CONCEPTO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,"col$solicitud".ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ESTADO IN (4,12))');
          SQL.Add('order by "col$solicitud".FECHA_CONCEPTO');
          Open;
          if RecordCount = 0 then
          begin
             MessageDlg('La Consulta no Arrojo Resultados',mtInformation,[mbok],0);
          end;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Titulo := 'Solicitudes Aprobadas '+ Ciudad + IntToStr(RecordCount);
          frmProgreso.Max := RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Solicitud Número : ' + FieldByName('ID_SOLICITUD').AsString;
            Application.ProcessMessages;
            if FieldByName('ESTADO').AsInteger = 4 then
            begin
               Application.ProcessMessages;
               CDaprobado.Append;
               CDaprobado.FieldValues['fecha'] := FieldByName('FECHA_CONCEPTO').AsDateTime;
               CDaprobado.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
               CDaprobado.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString;
               CDaprobado.FieldValues['valor'] := FieldByName('VALOR_APROBADO').AsCurrency;
               CDaprobado.FieldValues['dias'] := DaysBetween(fFechaActual,FieldByName('FECHA_CONCEPTO').AsDateTime);
               IBRatifica.Close;
               IBRatifica.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
               IBRatifica.ParamByName('ID_AGENCIA').AsInteger := Agencia;
               IBRatifica.Open;
               if IBRatifica.RecordCount > 0 then
               begin
                 CDaprobado.FieldValues['dias_ratificado'] := IntToStr(DaysBetween(fFechaActual,IBRatifica.FieldByName('FECHA').AsDateTime));
                 CDaprobado.FieldValues['fecha_ratificado'] := IBRatifica.FieldByName('FECHA').AsString;
               end
               else
               begin
                 CDaprobado.FieldValues['dias_ratificado'] := '';
                 CDaprobado.FieldValues['fecha_ratificado'] := '';
               end;
               CDaprobado.FieldValues['desc_agencia'] := Ciudad;
               CDaprobado.FieldValues['id_agencia'] := 1;
               CDaprobado.Post;
            end
            else
            begin
                IBrepSolicitud.SQL.Clear;
                IBrepSolicitud.Close;
                IBrepSolicitud.SQL.Add('SELECT');
                IBrepSolicitud.SQL.Add('SUM("col$desembolsoparcial".VALOR_DESEMBOLSO) as VALOR');
                IBrepSolicitud.SQL.Add('FROM');
                IBrepSolicitud.SQL.Add('"col$desembolsoparcial"');
                IBrepSolicitud.SQL.Add('WHERE');
                IBrepSolicitud.SQL.Add('("col$desembolsoparcial".DESEMBOLSADO = 1) AND');
                IBrepSolicitud.SQL.Add('("col$desembolsoparcial".ID_SOLICITUD = :ID_SOLICITUD)');
                IBrepSolicitud.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
                IBrepSolicitud.Open;
                CDcreditos.Append;
                CDcreditos.FieldValues['desembolsado'] := IBrepSolicitud.FieldByName('VALOR').AsCurrency;
                CDcreditos.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                CDcreditos.FieldValues['valor_aprobado'] := FieldByName('VALOR_APROBADO').AsCurrency;
                CDcreditos.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString;
                CDcreditos.Post;
            end;
            Next;
          end;
          frmProgreso.Cerrar;
//inicio de la verificación de las agencias
        with IBagencia do
        begin
          Close;
          Open;
          while not Eof DO
          begin
            solicitudagencia(buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vPuerto,FieldByName('ID_AGENCIA').AsInteger,buscaservicio(FieldByName('ID_AGENCIA').AsInteger,1).vHost,FieldByName('DESCRIPCION_AGENCIA').AsString);
            Next;
          end;

        end;
          Empleado;
          imprimir_reporte(frmMain.ruta1 + 'reporte\RepAprobadas1.frf');
        end;
end;

procedure TFrmEstadoSolicitud.JVPercentChange(Sender: TObject;
  PercentDone: Integer);
begin
        ShowMessage(IntToStr(PercentDone));
end;

function TFrmEstadoSolicitud.IsDuplicate(DBName: string): string;
var
  SessionCount: Integer;
  SessionNames: TStrings;
begin
  Result:= '';
  SessionNames:= TStringList.Create;
  try
    Sessions.GetSessionNames(SessionNames);
    for SessionCount:= 0 to (Sessions.Count - 1) do
      with TDatabase.Create(nil) do
      try
        SessionName:= SessionNames[SessionCount];
        ShowMessage(SessionName);
        try
          ValidateName(DBName);
        except

          on EDatabaseError do
            Result:= SessionNames[SessionCount];
        end;
      finally
        Free;
      end;
  finally
    SessionNames.Free;
  end;
end;

procedure TFrmEstadoSolicitud.Button1Click(Sender: TObject);
begin
        ShowMessage(isduplicate(dmGeneral.IBDatabase1.DatabaseName));
end;

procedure TFrmEstadoSolicitud.SolicitudAgencia(puerto,id_agencia: Integer;host_r,DesAgecnia: string);
var     sentencia :string;
        AList,AListCampos:TList;
        cadena :string;
        i :Integer;
begin
        {sentencia :=  'SELECT ' +
                      '"col$solicitud".FECHA_CONCEPTO, ' +
                      '"col$solicitud".VALOR_APROBADO, ' +
                      '"gen$persona".NOMBRE, ' +
                      '"gen$persona".PRIMER_APELLIDO, ' +
                      '"gen$persona".SEGUNDO_APELLIDO, ' +
                      '"col$solicitud".ID_SOLICITUD,"col$solicitud".ESTADO ' +
                      'FROM ' +
                      '"col$solicitud" ' +
                      'INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) ' +
                      'WHERE ' +
                      '("col$solicitud".ESTADO IN (4,12)) ' +
                      'order by "col$solicitud".FECHA_CONCEPTO ';}
         sentencia := 'SELECT * FROM P_SOL_RATIFICA';
         XmlPetc := TsdXmlDocument.CreateName('query_info');
         XmlPetc.XmlFormat := xfReadable;
         Nodo := XmlPetc.Root.NodeNew('querys');
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
             Port := Puerto;
             Host := Host_r;
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
                frmProgreso.Ejecutar;
                frmProgreso.Titulo := 'Recibiendo Informacion de ' + DesAgecnia;// + Desc_Agencia;
                frmProgreso.InfoLabel := 'Espere un Momento por Favor ...';
                frmProgreso.Min := 0;
                frmProgreso.Position := 50;
                Application.ProcessMessages;
                //Cadena := ReadLn();
                try
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
                  //XmlresC.SaveToFile('c:\eje\razon.xml');
                  Disconnect;
                  frmProgreso.Cerrar;
                except
                begin
                  Disconnect;
                  frmProgreso.Cerrar;
                  Exit;
                end;
                end;

           end;
           end;
           AList := TList.Create;
           Nodo := XmlResc.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
              AListCampos := TList.Create;
              TXmlNode(AList[i]).NodesByName('campo',AListCampos);
               try
                 CDaprobado.Append;
                 CDaprobado.FieldValues['fecha'] := TXmlNode(AListCampos[0]).ValueAsDateTime;
                 CDaprobado.FieldValues['nombre'] := TXmlNode(AListCampos[2]).ValueAsString + ' ' + TXmlNode(AListCampos[3]).ValueAsString + ' ' + TXmlNode(AListCampos[4]).ValueAsString;
                 CDaprobado.FieldValues['solicitud'] := TXmlNode(AListCampos[5]).ValueAsString;
                 CDaprobado.FieldValues['valor'] := TXmlNode(AListCampos[1]).ValueAsFloat;
                 CDaprobado.FieldValues['dias'] := DaysBetween(fFechaActual,TXmlNode(AListCampos[0]).ValueAsDateTime);
                 //ShowMessage(DateToStr(TXmlNode(AListCampos[7]).ValueAsDateTime));
                 if TXmlNode(AListCampos[7]).ValueAsString <> '' then
                 begin
                    CDaprobado.FieldValues['dias_ratificado'] := DaysBetween(fFechaActual,TXmlNode(AListCampos[7]).ValueAsDateTime);
                    CDaprobado.FieldValues['fecha_ratificado'] := TXmlNode(AListCampos[7]).ValueAsDateTime;
                 end
                 else
                 begin
                    CDaprobado.FieldValues['dias_ratificado'] := '';
                    CDaprobado.FieldValues['fecha_ratificado'] := '';
                 end;
                 CDaprobado.FieldValues['desc_agencia'] := DesAgecnia;
                 CDaprobado.FieldValues['id_agencia'] := id_agencia;
                 CDaprobado.Post;
               except
                 CDaprobado.Cancel;
               end;

              //TXmlNode(AListCampos[2]).ValueAsInteger,TXmlNode(AListCampos[0]).ValueAsFloat,agencia,TXmlNode(AListCampos[1]).ValueAsString);
           end;


end;

procedure TFrmEstadoSolicitud.solicitudes;
var DescAgencia :string;
begin
        CDaprobado.CancelUpdates;
        CDcreditos.CancelUpdates;
        if IBTransaction2.InTransaction then
           ibtransaction2.Rollback;
        ibtransaction2.StartTransaction;
        with IBtotal do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          DescAgencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$solicitud".FECHA_CONCEPTO,');
          SQL.Add('"col$solicitud".VALOR_APROBADO,');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"col$solicitud".ID_SOLICITUD,"col$solicitud".ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$solicitud"');
          SQL.Add('INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$solicitud".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
          SQL.Add('WHERE');
          SQL.Add('("col$solicitud".ESTADO IN (4,12))');
          SQL.Add('order by "col$solicitud".FECHA_CONCEPTO');
          Open;
          if RecordCount = 0 then
          begin
             MessageDlg('La Consulta no Arrojo Resultados',mtInformation,[mbok],0);
          end;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Titulo := 'Solicitudes Aprobadas ' + DescAgencia +  IntToStr(RecordCount);
          frmProgreso.Max := RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Solicitud Número : ' + FieldByName('ID_SOLICITUD').AsString;
            Application.ProcessMessages;
            if FieldByName('ESTADO').AsInteger = 4 then
            begin
               Application.ProcessMessages;
               CDaprobado.Append;
               CDaprobado.FieldValues['fecha'] := FieldByName('FECHA_CONCEPTO').AsDateTime;
               CDaprobado.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
               CDaprobado.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString;
               CDaprobado.FieldValues['valor'] := FieldByName('VALOR_APROBADO').AsCurrency;
               CDaprobado.FieldValues['dias'] := DaysBetween(fFechaActual,FieldByName('FECHA_CONCEPTO').AsDateTime);
               IBRatifica.Close;
               IBRatifica.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
               IBRatifica.ParamByName('ID_AGENCIA').AsInteger := Agencia;
               IBRatifica.Open;
               if IBRatifica.RecordCount > 0 then
               begin
                 CDaprobado.FieldValues['dias_ratificado'] := IntToStr(DaysBetween(fFechaActual,IBRatifica.FieldByName('FECHA').AsDateTime));
                 CDaprobado.FieldValues['fecha_ratificado'] := IBRatifica.FieldByName('FECHA').AsString;
               end
               else
               begin
                 CDaprobado.FieldValues['dias_ratificado'] := '';
                 CDaprobado.FieldValues['fecha_ratificado'] := '';
               end;
               CDaprobado.FieldValues['desc_agencia'] := DescAgencia;
               CDaprobado.FieldValues['id_agencia'] := Agencia;
               CDaprobado.Post;
            end
            else
            begin
                IBrepSolicitud.SQL.Clear;
                IBrepSolicitud.Close;
                IBrepSolicitud.SQL.Add('SELECT');
                IBrepSolicitud.SQL.Add('SUM("col$desembolsoparcial".VALOR_DESEMBOLSO) as VALOR');
                IBrepSolicitud.SQL.Add('FROM');
                IBrepSolicitud.SQL.Add('"col$desembolsoparcial"');
                IBrepSolicitud.SQL.Add('WHERE');
                IBrepSolicitud.SQL.Add('("col$desembolsoparcial".DESEMBOLSADO = 1) AND');
                IBrepSolicitud.SQL.Add('("col$desembolsoparcial".ID_SOLICITUD = :ID_SOLICITUD)');
                IBrepSolicitud.ParamByName('ID_SOLICITUD').AsString := FieldByName('ID_SOLICITUD').AsString;
                IBrepSolicitud.Open;
                CDcreditos.Append;
                CDcreditos.FieldValues['desembolsado'] := IBrepSolicitud.FieldByName('VALOR').AsCurrency;
                CDcreditos.FieldValues['nombre'] := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
                CDcreditos.FieldValues['valor_aprobado'] := FieldByName('VALOR_APROBADO').AsCurrency;
                CDcreditos.FieldValues['solicitud'] := FieldByName('ID_SOLICITUD').AsString;
                CDcreditos.Post;
            end;
            Next;
          end;
          frmProgreso.Cerrar;
          Empleado;
          imprimir_reporte(frmMain.ruta1 + 'reporte\RepAprobadas.frf');
        end;

end;

procedure TFrmEstadoSolicitud.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmGeneral.Free;
        Action := caFree;
end;

end.
