unit UnitNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, JvStaticText,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, sdXmlDocuments,IniFiles,StrUtils,
  JvEdit, JvTypedEdit, JvLabel, ComCtrls, Grids, DBGrids, DB, DBClient, DateUtils,
  JvComponent, JvBaseDlg, JvPasswordForm, IBCustomDataSet, IBQuery;

type
  TFrmNotas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    JVnota: TJvStaticText;
    IdTCPClient1: TIdTCPClient;
    Panel2: TPanel;
    Label2: TLabel;
    JVnumero: TJvEdit;
    JvLabel1: TJvLabel;
    JVUnota: TJvEdit;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    empleado: TEdit;
    Label4: TLabel;
    fecha: TDateTimePicker;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    CDcomprobante: TClientDataSet;
    DataSource1: TDataSource;
    CDcomprobanteagencia: TSmallintField;
    CDcomprobantecomprobante: TIntegerField;
    CDcomprobantefecha: TDateField;
    CDcomprobanteempleado: TStringField;
    JV: TJvPasswordForm;
    IBQuery1: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure FormCreate(Sender: TObject);
    procedure empleadoKeyPress(Sender: TObject; var Key: Char);
    procedure fechaKeyPress(Sender: TObject; var Key: Char);
    procedure JVnumeroKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
  private
    ADoc: TsdXmlDocument;
    RDoc: TsdXmlDocument;
    Nodo,Anode:TXmlNode;
    Astream :TMemoryStream;
    vNota :Integer;
    vUnota :Integer;
    vId_Agencia :Integer;
    procedure NumericoSinPunto(Sender: TObject; var Key: Char);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNotas: TFrmNotas;

implementation

uses UnitPantallaProgreso, UnitGlobales;

{$R *.dfm}

procedure TFrmNotas.BitBtn1Click(Sender: TObject);
var     vQuery :string;
        cadena :string;
        tamano :Integer;
        inicial :Integer;
begin
        vId_Agencia := ComboBox1.ItemIndex + 1;
        vQuery := 'SELECT "gen$consecutivos".CONSECUTIVO FROM "gen$consecutivos"' +
                  ' WHERE ("gen$consecutivos".ID_CONSECUTIVO = 1)';
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Progreso de la Busqueda...';
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'Kbs Recibidos : 0';
        frmProgreso.Ejecutar;
        ADoc := TsdXmlDocument.CreateName('query_info');
        ADoc.XmlFormat := xfReadable;
        ANode := ADoc.Root.NodeNew('querys');
        Nodo := ANode.NodeNew('query');
        Nodo.WriteString('tipo','select');
        Nodo.WriteString('sentencia',vQuery);
        ADoc.SaveToFile('c:\query.xml');
        Astream := TMemoryStream.Create;
        ADoc.SaveToStream(Astream);
        with IdTCPClient1 do
         begin
           inicial := Pos('=',ComboBox1.Text);
           Host := RightStr(ComboBox1.Text,Length(ComboBox1.Text)-inicial);
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
              frmProgreso.Cerrar;
           end;
                Nodo := RDoc.Root.NodeByName('consulta000');
                Anode := Nodo.NodeByName('Registro');
                vNota := Anode.ReadInteger('campo');
                JVnota.Caption := FormatCurr('#,#',vNota);
                Panel2.Enabled := True;
                Panel3.Enabled := True;
                empleado.SetFocus;
         end;
end;

procedure TFrmNotas.IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
          frmProgreso.Position := AWorkCount;
          frmProgreso.InfoLabel := 'Kbs Recibidos : ' + currToStr(AWorkCount/1000);
          Application.ProcessMessages;

end;

procedure TFrmNotas.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          Application.ProcessMessages;

end;
procedure TFrmNotas.FormCreate(Sender: TObject);
begin
     with IBQuery1 do
     begin
       if Transaction.InTransaction then
          Transaction.Commit;
       Transaction.StartTransaction;
       Close;
       SQL.Clear;
       SQL.Add('SELECT DESCRIPCION_AGENCIA, HOST FROM "gen$agencia" where ID_AGENCIA <> 0 ORDER BY ID_AGENCIA');
       Open;
       while not Eof do
       begin
         ComboBox1.Items.Add(FieldByName('DESCRIPCION_AGENCIA').AsString + '=' +FieldByName('HOST').AsString);
         Next;
       end;
     end;
     ComboBox1.ItemIndex := 0;
     fecha.DateTime := Date;
end;

procedure TFrmNotas.empleadoKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
          fecha.SetFocus;
end;

procedure TFrmNotas.fechaKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
           JVnumero.SetFocus;
end;

procedure TFrmNotas.JVnumeroKeyPress(Sender: TObject; var Key: Char);
begin
        numericosinpunto(Self,Key);

        if Key = #13 then
        begin
        if (JVnumero.Text = '') or (JVnumero.Text = '0') then
        begin
           BitBtn2.Enabled := False;
           Exit;
        end;
        try
          vUnota := vNota + StrToInt(JVnumero.Text);
          JVUnota.Text := IntToStr(vUnota);
          BitBtn2.Enabled := True;
          BitBtn2.SetFocus;
        except
          MessageDlg('No es un Número Valido',mtInformation,[mbok],0);
        end;
        end;

end;

procedure TFrmNotas.BitBtn2Click(Sender: TObject);
var     vQuerySalida,vQueryUpdate,vQueryInsert,Cadena :string;
        inicial,i :Integer;
        tamano :Integer;
        AList,AListCampos:TList;
        nConsulta :Integer;
begin
        if JVnumero.Text = '' then
        begin
          MessageDlg('El Número de Notas no Puede Ser Igual a Cero',mtWarning,[mbok],0);
          JVnumero.SetFocus;
          Exit;
        end;
        if empleado.Text = '' then
        begin
          MessageDlg('El Id del Empleado no puede ser Vacio',mtWarning,[mbok],0);
          empleado.SetFocus;
          Exit;
        end;
        if MessageDlg('Esta Seguro de Realizar la Operación',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        vQuerySalida := 'SELECT  ' +
        'ID_AGENCIA, ' +
        'ID_COMPROBANTE, ' +
        'FECHADIA, ' +
        'ID_EMPLEADO ' +
        'FROM ' +
        'CON$COMPROBANTE ' +
        'WHERE ' +
        '(ID_COMPROBANTE BETWEEN ' + IntToStr(vNota + 1) + ' AND ' + IntToStr(vUnota) + ' )' +
        ' order by ID_COMPROBANTE';
        vQueryUpdate := 'update "gen$consecutivos" set CONSECUTIVO = ' + JVUnota.Text  + ' WHERE ID_CONSECUTIVO = 1';
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Progreso de la Busqueda...';
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'Kbs Recibidos : 0';
        frmProgreso.Ejecutar;
        ADoc := TsdXmlDocument.CreateName('query_info');
        ADoc.XmlFormat := xfReadable;
        ANode := ADoc.Root.NodeNew('querys');

        // actualizacion del consecutivo de gen$consecutivos
        Nodo := Anode.NodeNew('query');
        Nodo.WriteString('tipo','update');
        Nodo.WriteString('sentencia',vQueryUpdate);

        // inserto los campos en la tabla comprobante
        for i := 1 to StrToInt(JVnumero.Text) do
        begin
          vQueryInsert := '';
          vQueryInsert := 'INSERT INTO "con$comprobante" values (' +
          IntToStr(vNota + i) + ',' + IntToStr(vId_Agencia) + ',' + '''' + '1' +
          '''' + ',' + '''' + DateToStr(fecha.DateTime) + '''' + ',NULL,' + '0,0,'+
          '''' + 'O' + '''' + ',0,' + 'NULL,' + '''' + empleado.Text + '''' + ')';
          Nodo := Anode.NodeNew('query');
          Nodo.WriteString('tipo','insert');
          Nodo.WriteString('sentencia',vQueryInsert);
        end;

        //consulta de comprobantes generados
        Nodo := ANode.NodeNew('query');
        Nodo.WriteString('tipo','select');
        Nodo.WriteString('sentencia',vQuerySalida);
        ADoc.SaveToFile('c:\query.xml');
        Astream := TMemoryStream.Create;
        ADoc.SaveToStream(Astream);
        with IdTCPClient1 do
         begin
           inicial := Pos('=',ComboBox1.Text);
           Host := RightStr(ComboBox1.Text,Length(ComboBox1.Text)-inicial);
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
              frmProgreso.Cerrar;
           end;
         end;
           nConsulta := StrToInt(JVnumero.Text) + 1;
           MessageDlg('Proceso Realizado con Exito',mtInformation,[mbok],0);
           with IBQuery1 do
           begin
             if Transaction.InTransaction then
                Transaction.Commit;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('insert into "con$controlnotas" values (:ID_AGENCIA,:ID_EMPLEADO,:NUMERO_NOTAS,');
             SQL.Add(':ID_COMPROBANTE_INICIO,:ID_COMPROBANTE_FINAL,:FECHA,:HORA,:ID_EMPLEADO_AGENCIA)');
             ParamByName('ID_AGENCIA').AsInteger := ComboBox1.ItemIndex + 1;
             ParamByName('ID_EMPLEADO').AsString := DBAlias;
             ParamByName('NUMERO_NOTAS').AsInteger := StrToInt(JVnumero.Text);
             ParamByName('ID_COMPROBANTE_INICIO').AsInteger := vNota + 1;
             ParamByName('ID_COMPROBANTE_FINAL').AsInteger := vUnota;
             ParamByName('FECHA').AsDate := fFechaActual;
             ParamByName('HORA').AsTime := Time;
             ParamByName('ID_EMPLEADO_AGENCIA').AsString := empleado.Text;
             ExecSQL;
             Transaction.Commit;
             Transaction.StartTransaction;
           end;
           AList := TList.Create;
           Nodo := RDoc.Root.NodeByName('consulta' + FormatCurr('000',nconsulta));
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
              AListCampos := TList.Create;
              TXmlNode(AList[i]).NodesByName('campo',AListCampos);
              CDcomprobante.Append;
              CDcomprobante.FieldValues['agencia'] := TXmlNode(AListCampos[0]).ValueAsInteger;
              CDcomprobante.FieldValues['comprobante'] := TXmlNode(AListCampos[1]).ValueAsInteger;
              CDcomprobante.FieldValues['fecha'] := TXmlNode(AListCampos[2]).ValueAsDateTime;
              CDcomprobante.FieldValues['empleado'] := TXmlNode(AListCampos[3]).ValueAsString;
              CDcomprobante.Post;
           end;
           BitBtn2.Enabled := False;
end;

procedure TFrmNotas.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
        if Key = #13 then
          BitBtn1.SetFocus;
end;

procedure TFrmNotas.BitBtn3Click(Sender: TObject);
begin
        JVnota.Caption := '';
        JVUnota.Text := '';
        empleado.Text := '';
        JVnumero.Text := '';
        CDcomprobante.CancelUpdates;
        BitBtn2.Enabled := False;
        ComboBox1.SetFocus;
end;

procedure TFrmNotas.NumericoSinPunto(Sender: TObject; var Key: Char);
begin
if not (Key in [#8,#13, '0'..'9']) then
  begin
    Key := #0;
  end //End First if.
  else
  if ((Key = DecimalSeparator) or (Key = '-')) and (Pos(Key, TMemo(Sender).Text ) > 0) then
  begin
    Key := #0;
  end//End second if.
  else
  if (Key = '-') and (TMemo(Sender).SelStart <> 0) then
  begin
    Key := #0;
  end;//End third if.


end;

end.
