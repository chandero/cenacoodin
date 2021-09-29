unit UnitEstudioTraslado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery,
  IBDatabase, Buttons, Grids, DBGrids, IdBaseComponent, IdComponent,sdXmlDocuments,
  IdTCPConnection, IdTCPClient;

type
  TFrmEstudioTraslado = class(TForm)
    Label1: TLabel;
    IBTransaction1: TIBTransaction;
    DsOficina: TDataSource;
    IbOficina: TIBQuery;
    IBconsulta: TIBQuery;
    DbOficina: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    DsPersona: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IBpersona: TIBQuery;
    Panel2: TPanel;
    Memo1: TMemo;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    BitBtn6: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
        XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo,nodo1 :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstudioTraslado: TFrmEstudioTraslado;

implementation
uses UnitGlobales, UnitdmGeneral, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmEstudioTraslado.FormCreate(Sender: TObject);
var  d :TDate;
begin
        if IBTransaction1.InTransaction then
           IBTransaction1.Rollback;
        IBTransaction1.StartTransaction;
        IbOficina.Close;
        IbOficina.ParamByName('ID').AsInteger := Agencia;
        IbOficina.Open;
        IbOficina.Last;

end;

procedure TFrmEstudioTraslado.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmEstudioTraslado.BitBtn1Click(Sender: TObject);
begin
        with dmGeneral.IBTransaction1 do
        begin
          if InTransaction then
             Rollback;
          StartTransaction;
        end;
        IBpersona.Close;
        IBpersona.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
        IBpersona.Open;

end;

procedure TFrmEstudioTraslado.BitBtn2Click(Sender: TObject);
begin
        IBpersona.Close;
        Memo1.Clear;
end;

procedure TFrmEstudioTraslado.DBGrid1CellClick(Column: TColumn);
begin
        memo1.Clear;
        Memo1.Lines.Add('NOMBRES: ' + IBpersona.FieldByName('NOMBRE').AsString + ' ' + IBpersona.FieldByName('PRIMER_APELLIDO').AsString  + ' '  + IBpersona.FieldByName('SEGUNDO_APELLIDO').AsString );
        with IBconsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('  "cap$maestrotitular".NUMERO_CUENTA,');
          SQL.Add('  "cap$maestrotitular".DIGITO_CUENTA,');
          SQL.Add('  "cap$maestro".ID_ESTADO,');
          SQL.Add('  "cap$maestrotitular".ID_TIPO_CAPTACION,');
          SQL.Add('  "cap$tiposestado".DESCRIPCION');
          SQL.Add('FROM');
          SQL.Add(' "cap$maestrotitular"');
          SQL.Add(' INNER JOIN "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA="cap$maestro".ID_AGENCIA)');
          SQL.Add('  AND ("cap$maestrotitular".ID_TIPO_CAPTACION="cap$maestro".ID_TIPO_CAPTACION)');
          SQL.Add('  AND ("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
          SQL.Add('  AND ("cap$maestro".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add(' INNER JOIN "cap$tiposestado" ON ("cap$tiposestado".ID_ESTADO="cap$maestro".ID_ESTADO)');
          SQL.Add('WHERE');
          SQL.Add('  ("cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND ');
          SQL.Add('  ("cap$maestrotitular".ID_PERSONA = :ID_PERSONA) AND ');
          SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR = 1) AND ');
          SQL.Add('  ("cap$maestrotitular".TIPO_TITULAR = 1)');
          ParamByName('ID_PERSONA').AsString := IBpersona.FieldByName('ID_PERSONA').AsString;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
          Open;
          if RecordCount > 0 then
          begin
            Memo1.Lines.Add(#13);
            Memo1.Lines.Add('NUMERO' + #9 + #9 + #9 + 'ESTADO');
            Memo1.Lines.Add(#13);
            Memo1.Lines.Add('RELACION DE CUENTAS');
            Memo1.Lines.Add(#13);
          end;
          while not Eof do
          begin
            Memo1.Lines.Add(IntToStr(Agencia) + '0' + FieldByName('ID_TIPO_CAPTACION').AsString + '-' + FormatCurr('00000',FieldByName('NUMERO_CUENTA').AsInteger) + #9 + #9 + FieldByName('DESCRIPCION').AsString);
            Next;
          end;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('  "col$colocacion".ID_COLOCACION,');
          SQL.Add('  "col$estado".DESCRIPCION_ESTADO_COLOCACION');
          SQL.Add('FROM');
          SQL.Add(' "col$colocacion"');
          SQL.Add(' INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION="col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('  ("col$colocacion".ID_PERSONA = :ID_PERSONA) AND ');
          SQL.Add('  ("col$colocacion".ID_IDENTIFICACION = :ID_IDENTIFICACION) ORDER BY "col$estado".ID_ESTADO_COLOCACION');
          ParamByName('ID_PERSONA').AsString := IBpersona.FieldByName('ID_PERSONA').AsString;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
          Open;
          if RecordCount > 0 then
          begin
            Memo1.Lines.Add(#13);
            Memo1.Lines.Add('RELACION DE COLOCACIONES');
            Memo1.Lines.Add(#13);
          end;
          while not Eof do
          begin
            Memo1.Lines.Add(FieldByName('ID_COLOCACION').AsString + #9 + #9 + FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString);
            Next;
          end;
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('  "col$estado".DESCRIPCION_ESTADO_COLOCACION,');
          SQL.Add('  "col$estado".ID_ESTADO_COLOCACION,');
          SQL.Add('  "col$colgarantias".ID_COLOCACION');
          SQL.Add('FROM');
          SQL.Add(' "col$colgarantias"');
          SQL.Add(' INNER JOIN "col$colocacion" ON ("col$colgarantias".ID_COLOCACION="col$colocacion".ID_COLOCACION)');
          SQL.Add(' INNER JOIN "col$estado" ON ("col$colocacion".ID_ESTADO_COLOCACION="col$estado".ID_ESTADO_COLOCACION)');
          SQL.Add('WHERE');
          SQL.Add('  ("col$colgarantias".ID_PERSONA = :ID_PERSONA) AND ');
          SQL.Add('  ("col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION)');
          SQL.Add('ORDER BY');
          SQL.Add('  "col$estado".ID_ESTADO_COLOCACION');
          ParamByName('ID_PERSONA').AsString := IBpersona.FieldByName('ID_PERSONA').AsString;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
          Open;
          if RecordCount > 0 then
          begin
            Memo1.Lines.Add(#13);
            Memo1.Lines.Add('RELACION DE FIANZAS');
            Memo1.Lines.Add(#13);
          end;
          while not Eof do
          begin
            Memo1.Lines.Add(FieldByName('ID_COLOCACION').AsString + #9 + #9 + FieldByName('DESCRIPCION_ESTADO_COLOCACION').AsString);
            Next;
          end;
        end;
end;

procedure TFrmEstudioTraslado.BitBtn4Click(Sender: TObject);
var     sentencia,cadena :string;
        vPuerto :integer;
        vHost :string;
        vDireccion,vTelefono :string;
begin
        if MessageDlg('Esta seguro de Autorizar el Traslado',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
      try
        with IBconsulta do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DIRECCION, TELEFONO1');
          SQL.Add('FROM  "gen$direccion" WHERE');
          SQL.Add('(ID_PERSONA = :ID_PERSONA) AND');
          SQL.Add('(ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('(ID_DIRECCION = 1)');
          ParamByName('ID_PERSONA').AsString := IBpersona.FieldByName('ID_PERSONA').AsString;
          ParamByName('ID_IDENTIFICACION').AsInteger := IBpersona.FieldByName('ID_IDENTIFICACION').AsInteger;
          Open;
          vDireccion := FieldByName('DIRECCION').AsString;
          vTelefono := FieldByName('TELEFONO1').AsString;
          Close;
          SQL.Clear;
          SQL.Add('select ID_PUERTO,ID_HOST from "gen$servidor" where ID_AGENCIA = :ID_AGENCIA and ID_SERVICIO = :ID_SERVICIO');
          ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
          ParamByName('ID_SERVICIO').AsInteger := 1;
          Open;
          vHost := FieldByName('ID_HOST').AsString;
          vPuerto := FieldByName('ID_PUERTO').AsInteger;
        end;
         sentencia := 'update "tras$registro" set ESTADO = 2, ID_EMPLEADO_TRASLADO = ' + '''' + DBAlias + '''' + ', DIRECCION = ' + '''' + vDireccion  + '''' + ',TELEFONO = ' + '''' + vTelefono + '''' + ' where CONSECUTIVO = ' + IBpersona.FieldByName('CONSECUTIVO').AsString + ' and ID_AGENCIA = ' + IntToStr(Agencia);
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
           Port := vPuerto;
           Host := vHost;
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
        except
        on e: Exception do
        begin
         MessageDlg('Ha Ocurrido un error en el Proceso, con mensaje : '+ #13 + e.Message,mtError,[mbok],0);
         IBconsulta.Transaction.Rollback;
        end;
        end;
         with IBconsulta do
         begin
           Close;
           SQL.Clear;
           SQL.Add('update "tras$registro" set ESTADO = 2,ID_EMPLEADO_TRASLADO = :TRASLADO WHERE ID_AGENCIA = :ID_AGENCIA AND CONSECUTIVO = :CONSECUTIVO');
           ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
           ParamByName('TRASLADO').AsString := DBAlias;           
           ParamByName('CONSECUTIVO').AsInteger := IBpersona.FieldByName('CONSECUTIVO').AsInteger;
           ExecSQL;
           Transaction.Commit;
         Transaction.StartTransaction;
         IBpersona.Close;
         IBpersona.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
         IBpersona.Open;
         end;
         MessageDlg('Autorización realizada con Exito',mtInformation,[mbok],0);
         Memo1.Text := '';
end;

procedure TFrmEstudioTraslado.BitBtn5Click(Sender: TObject);
var     sentencia,cadena :string;
        vPuerto :integer;
        vHost :string;
begin
      if MessageDlg('Esta seguro de Negar el Traslado',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
      try
        with IBconsulta do
        begin
          SQL.Clear;
          SQL.Add('select ID_PUERTO,ID_HOST from "gen$servidor" where ID_AGENCIA = :ID_AGENCIA and ID_SERVICIO = :ID_SERVICIO');
          ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
          ParamByName('ID_SERVICIO').AsInteger := 1;
          Open;
          vHost := FieldByName('ID_HOST').AsString;
          vPuerto := FieldByName('ID_PUERTO').AsInteger;
        end;
         sentencia := 'update "tras$registro" set ESTADO = 1, ID_EMPLEADO_TRASLADO = ' + '''' + DBAlias + '''' + ' where CONSECUTIVO = ' + IBpersona.FieldByName('CONSECUTIVO').AsString + ' and ID_AGENCIA = ' + IntToStr(Agencia);
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
           Port := vPuerto;
           Host := vHost;
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
        except
        on e: Exception do
        begin
         MessageDlg('Ha Ocurrido un error en el Proceso, con mensaje : '+ #13 + e.Message,mtError,[mbok],0);
         IBconsulta.Transaction.Rollback;
        end;
        end;
         with IBconsulta do
         begin
           Close;
           SQL.Clear;
           SQL.Add('update "tras$registro" set ESTADO = 1,ID_EMPLEADO_TRASLADO = :TRASLADO WHERE ID_AGENCIA = :ID_AGENCIA AND CONSECUTIVO = :CONSECUTIVO');
           ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
           ParamByName('CONSECUTIVO').AsInteger := IBpersona.FieldByName('CONSECUTIVO').AsInteger;
           ParamByName('TRASLADO').AsString := DBAlias;
           ExecSQL;
           Transaction.Commit;
         Transaction.StartTransaction;
         IBpersona.Close;
         IBpersona.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
         IBpersona.Open;
         end;
         MessageDlg('Negación realizada con Exito',mtInformation,[mbok],0);
end;

procedure TFrmEstudioTraslado.BitBtn6Click(Sender: TObject);
var     sentencia,cadena :string;
        vPuerto :integer;
        vHost :string;
begin
      if MessageDlg('Esta seguro de Anular el Traslado',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
      try
        with IBconsulta do
        begin
          SQL.Clear;
          SQL.Add('select ID_PUERTO,ID_HOST from "gen$servidor" where ID_AGENCIA = :ID_AGENCIA and ID_SERVICIO = :ID_SERVICIO');
          ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
          ParamByName('ID_SERVICIO').AsInteger := 1;
          Open;
          vHost := FieldByName('ID_HOST').AsString;
          vPuerto := FieldByName('ID_PUERTO').AsInteger;
        end;
         sentencia := 'update "tras$registro" set ESTADO = 3, ID_EMPLEADO_TRASLADO = ' + '''' + DBAlias + '''' + ' where CONSECUTIVO = ' + IBpersona.FieldByName('CONSECUTIVO').AsString + ' and ID_AGENCIA = ' + IntToStr(Agencia);
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
           Port := vPuerto;
           Host := vHost;
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
        except
        on e: Exception do
        begin
         MessageDlg('Ha Ocurrido un error en el Proceso, con mensaje : '+ #13 + e.Message,mtError,[mbok],0);
         IBconsulta.Transaction.Rollback;
        end;
        end;
         with IBconsulta do
         begin
           Close;
           SQL.Clear;
           SQL.Add('update "tras$registro" set ESTADO = 3,ID_EMPLEADO_TRASLADO = :TRASLADO WHERE ID_AGENCIA = :ID_AGENCIA AND CONSECUTIVO = :CONSECUTIVO');
           ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
           ParamByName('CONSECUTIVO').AsInteger := IBpersona.FieldByName('CONSECUTIVO').AsInteger;
           ParamByName('TRASLADO').AsString := DBAlias;
           ExecSQL;
           Transaction.Commit;
         Transaction.StartTransaction;
         IBpersona.Close;
         IBpersona.ParamByName('ID_AGENCIA').AsInteger := DbOficina.KeyValue;
         IBpersona.Open;
         end;
         MessageDlg('Anulación realizada con Exito',mtInformation,[mbok],0);

end;

end.
