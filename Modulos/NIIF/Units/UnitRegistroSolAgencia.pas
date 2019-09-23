unit UnitRegistroSolAgencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, IBCustomDataSet, IBQuery, DBCtrls,
  ComCtrls, Mask, JvLabel, Grids, DBGrids, DBClient, Buttons,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,sdXmlDocuments,
  IBSQL, IBDatabase;

type
  TFrmRegistroSolAgencia = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    IBQuery1: TIBQuery;
    DBagencia: TDBLookupComboBox;
    Label2: TLabel;
    DtFecha: TDateTimePicker;
    Panel2: TPanel;
    DSsolicitud: TDataSource;
    CDsolicitud: TClientDataSet;
    DBGrid1: TDBGrid;
    CDsolicitudsolicitud: TStringField;
    CDsolicitudempleado: TStringField;
    CDsolicitudid_empleado: TStringField;
    CDsolicitudverificado: TBooleanField;
    JvLabel1: TJvLabel;
    MKsolicitud: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DSagencia: TDataSource;
    IdTCPClient1: TIdTCPClient;
    DBCheckBox1: TDBCheckBox;
    BitBtn4: TBitBtn;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    CDsolicitudvalor: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure DBagenciaKeyPress(Sender: TObject; var Key: Char);
    procedure MKsolicitudKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure IdTCPClient1Disconnected(Sender: TObject);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure MKsolicitudEnter(Sender: TObject);
  private
  ADoc: TsdXmlDocument;
  RDoc: TsdXmlDocument;
  Nodo,Anode:TXmlNode;
  Astream :TMemoryStream;
  host_server: string;
  puerto_server: integer;
    function BuscaEmpleado(id_agencia: integer;
      id_empleado: string): string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistroSolAgencia: TFrmRegistroSolAgencia;

implementation
uses    UnitGlobales, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmRegistroSolAgencia.FormCreate(Sender: TObject);
begin
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          Open;
          Last;
          DBagencia.KeyValue := 2;
        end;
        with IBSQL1 do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
        end;
        DtFecha.Date := fFechaActual;
end;

procedure TFrmRegistroSolAgencia.DBagenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
        begin
          MKsolicitud.SetFocus;
          Panel1.Enabled := False;
          host_server := BuscaServicio(DBagencia.KeyValue,1).vHost;
          //ShowMessage(host_server);
{          if DBagencia.KeyValue = 2 then
            host_server := host_abrego;
          if DBagencia.KeyValue = 3 then
            host_server := '192.168.205.15';//host_convencion; Ojo cambiar
          if DBagencia.KeyValue = 4 then
            host_server := host_aguachica;}
        end;
end;

procedure TFrmRegistroSolAgencia.MKsolicitudKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
        begin
         if MKsolicitud.Text <> '          ' then
         begin
          with CDsolicitud do
          begin
            Append;
            FieldValues['solicitud'] := MKsolicitud.Text;
            FieldValues['empleado'] := '';
            FieldValues['id_empleado'] := '';
            FieldValues['verificado'] := False;
            Post;
          end;
          MKsolicitud.Text := '';
          end;
        end;

end;

procedure TFrmRegistroSolAgencia.DBGrid1ColExit(Sender: TObject);
begin
 if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then 
    DBCheckBox1.Visible := False
end;

procedure TFrmRegistroSolAgencia.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
     DBCheckBox1.Left := Rect.Left + DBGrid1.Left + 2;
     DBCheckBox1.Top := Rect.Top + DBGrid1.top + 2;
     DBCheckBox1.Width := Rect.Right - Rect.Left;
     DBCheckBox1.Height := Rect.Bottom - Rect.Top;
     DBCheckBox1.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      DBGrid1.Canvas.FillRect(Rect);
      DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFrmRegistroSolAgencia.BitBtn3Click(Sender: TObject);
var     sentencia :string;
        consulta :string;
        Tamano,i :Integer;
        cadena :string;
        contador :string;
        AList,AListCampos:TList;
        es_registro :Boolean;
begin
        if CDsolicitud.RecordCount = 0 then
        Exit;
        es_registro := False;
        Tamano := 0;
        ADoc := TsdXmlDocument.CreateName('query_info');
        ADoc.XmlFormat := xfReadable;
        ANode := ADoc.Root.NodeNew('querys');
        sentencia := 'SELECT ' +
        '"col$solicitudempleado".ID_EMPLEADO, ' +
        '"col$solicitud".VALOR_SOLICITADO, ' +
        '"gen$persona".NOMBRE, ' +
        '"gen$persona".PRIMER_APELLIDO, ' +
        '"gen$persona".SEGUNDO_APELLIDO ' +
        'FROM ' +
        '"col$solicitud" ' +
        'INNER JOIN "col$solicitudempleado" ON ("col$solicitud".ID_SOLICITUD="col$solicitudempleado".ID_SOLICITUD) ' +
        'INNER JOIN "gen$persona" ON ("col$solicitud".ID_PERSONA="gen$persona".ID_PERSONA) ' +
        'AND ("col$solicitud".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION) ' +
        'WHERE ' +
        '("col$solicitud".ESTADO IN (1,2,3,9,13)) AND ' +
        '("col$solicitudempleado".NOTIFICADO = 1) AND ' +
        '("col$solicitudempleado".ENTREGADO = 0) AND ' +
        '("col$solicitudempleado".ID_SOLICITUD = ';
        with CDsolicitud do
        begin
          First;
          while not Eof do
          begin
            consulta := '';
            consulta := sentencia + '''' + FieldByName('solicitud').AsString + '''' + ' )';
            Nodo := ANode.NodeNew('query');
            Nodo.WriteString('tipo','select');
            Nodo.WriteString('sentencia',consulta);
            Next;
          end;
        end;
        ADoc.SaveToFile('c:\wum1.txt');
        Astream := TMemoryStream.Create;
        ADoc.SaveToStream(Astream);
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Progreso de la Busqueda...';
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'Kbs Recibidos : 0';
        frmProgreso.Ejecutar;
           with IdTCPClient1 do
           begin
             Host := host_server;
             Port := 3052;
             try
               Connect;
             except
             on e: Exception do
             begin
               frmProgreso.Cerrar;
               MessageDlg('Error en la Conexión con Mensaje : ' + e.Message,mtError,[mbok],0);
               Disconnect;
               Exit;
             end;
             end;
             if Connected then
             begin
                Cadena := ReadLn();
                WriteInteger(AStream.Size);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                tamano := ReadInteger;
                Astream := TMemoryStream.Create;
                ReadStream(Astream,tamano,False);
                RDoc := TsdXmlDocument.Create;
                RDoc.LoadFromStream(AStream);
                RDoc.SaveToFile('c:\wum2.xml');
                Disconnect;
             end;
           end;
           with CDsolicitud do
           begin
             First;
             while not Eof do
             begin
                contador := 'consulta' + FormatCurr('000',CDsolicitud.RecNo - 1);
                AList := TList.Create;
                Nodo := RDoc.Root.NodeByName(contador);
                Nodo.NodesByName('Registro',AList);
                try
                for i := 0 to AList.Count -1 do
                begin                     
                 AListCampos := TList.Create;
                 TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                 if TXmlNode(AListCampos[0]).ValueAsString <> '' then
                 begin
                   es_registro := True;
                   Edit;
                   FieldValues['id_empleado'] := TXmlNode(AListCampos[0]).ValueAsString;
                   FieldValues['verificado'] := True;
                   FieldValues['empleado'] := TXmlNode(AListCampos[2]).ValueAsString + ' ' + TXmlNode(AListCampos[3]).ValueAsString + ' ' + TXmlNode(AListCampos[4]).ValueAsString;
                   FieldValues['valor'] := TXmlNode(AListCampos[1]).ValueAsFloat;
                   Post;
                 end; // fin del valida anode
                end; // fin del for
                Next;
                except
                Next;
                end;// fin del try
                frmProgreso.Cerrar;
             end;// fin del while
           end;
           if es_registro then
           begin
              BitBtn2.Enabled := True;
              BitBtn3.Enabled := False;
           end;

end;

procedure TFrmRegistroSolAgencia.BitBtn4Click(Sender: TObject);
begin
        Panel1.Enabled := True;
        DBagencia.SetFocus;
        CDsolicitud.CancelUpdates;
        BitBtn2.Enabled := False;
        BitBtn3.Enabled := True;
end;

function TFrmRegistroSolAgencia.BuscaEmpleado(id_agencia: integer;
  id_empleado: string): string;
begin
        with IBSQL1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$empsucursal".NOMBRE,');
          SQL.Add('"gen$empsucursal".PRIMER_APELLIDO,');
          SQL.Add('"gen$empsucursal".SEGUNDO_APELLIDO');
          SQL.Add('FROM');
          SQL.Add('"gen$empsucursal"');
          SQL.Add('WHERE');
          SQL.Add('("gen$empsucursal".ID_EMPLEADO = :ID_EMPLEADO) AND ');
          SQL.Add('("gen$empsucursal".ID_AGENCIA = :ID_AGENCIA)');
          ParamByName('ID_EMPLEADO').AsString := id_empleado;
          ParamByName('ID_AGENCIA').AsInteger := id_agencia;
          ExecQuery;
          Result := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
        end;
end;

procedure TFrmRegistroSolAgencia.BitBtn1Click(Sender: TObject);
begin
        try
          CDsolicitud.Delete;
        except
          MessageDlg('No Existen Registros Para Eliminar',mtWarning,[mbok],0);
        end
end;

procedure TFrmRegistroSolAgencia.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          Application.ProcessMessages;

end;

procedure TFrmRegistroSolAgencia.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.Position := AWorkCount;
          frmProgreso.InfoLabel := 'Kbs Recibidos : ' + currToStr(AWorkCount/1000);
          Application.ProcessMessages;

end;

procedure TFrmRegistroSolAgencia.BitBtn2Click(Sender: TObject);
var     sentencia1,sentencia2,cadena,consulta1,consulta2 :string;
        tamano :Integer;
begin
        if MessageDlg('Esta Seguro de Realizar la Operacion',mtInformation,[mbyes,mbno],0) = mrno then
          Exit;
        with CDsolicitud do
        begin
          First;
          Filtered := False;
          Filter := 'verificado = true';
          Filtered := True;
          while not Eof do
          begin
            with IBSQL1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('delete from "col$solicitudanalistaof" where ID_SOLICITUD = :ID_SOLICITUD');
              SQL.Add('and ID_AGENCIA = :ID_AGENCIA');
              ParamByName('ID_SOLICITUD').AsString := CDsolicitudsolicitud.Value;
              ParamByName('ID_AGENCIA').AsInteger := DBagencia.KeyValue;
              ExecQuery;
              Close;
              SQL.Clear;
              SQL.Add('insert into "col$solicitudanalistaof" values (:ID_AGENCIA,:ID_SOLICITUD,:ID_EMPLEADO,:FECHAHORA,1,:NOMBRES,:VALOR)');
              ParamByName('ID_SOLICITUD').AsString := CDsolicitud.FieldByName('solicitud').AsString;
              ParamByName('ID_EMPLEADO').AsString := DBAlias;
              ParamByName('FECHAHORA').AsDateTime := fFechaActual + Time;
              ParamByName('ID_AGENCIA').AsInteger := DBagencia.KeyValue;
              ParamByName('NOMBRES').AsString := CDsolicitud.FieldByName('empleado').AsString;
              ParamByName('VALOR').AsCurrency := CDsolicitud.FieldByName('valor').AsCurrency;
              ExecQuery;
            end;
            Next;
          end;
        IBSQL1.Transaction.Commit;
        CDsolicitud.CancelUpdates;
        BitBtn2.Enabled := False;
        end;

end;

procedure TFrmRegistroSolAgencia.IdTCPClient1Disconnected(Sender: TObject);
begin
        ShowMessage('desconectado');
end;

procedure TFrmRegistroSolAgencia.IdTCPClient1Connected(Sender: TObject);
begin
        if IdTCPClient1.ReadLnTimedOut then
           showmessage('listo')
end;

procedure TFrmRegistroSolAgencia.MKsolicitudEnter(Sender: TObject);
begin
          if DBagencia.KeyValue = 2 then
            host_server := host_abrego;
          if DBagencia.KeyValue = 3 then
            host_server := host_convencion;
end;

end.
