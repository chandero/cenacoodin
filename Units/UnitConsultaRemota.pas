unit UnitConsultaRemota;

interface

uses
  StrUtils, Windows, IniFiles, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ExtCtrls, JvComCtrls, sdXmlDocuments,
  ValEdit, DBTables, DB, DBClient, FMTBcd, DBCtrls, DataSetToExcel;

type
  TfrmConsultaRemota = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    cmdSend: TBitBtn;
    cmdCerrar: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    Panel2: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ListaConsulta: TValueListEditor;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    CDataSet: TClientDataSet;
    cmdExportar: TBitBtn;
    SaveD1: TSaveDialog;
    ComboBox1: TComboBox;
    Memo2: TMemo;
    BitBtn4: TBitBtn;
    procedure cmdCerrarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cmdSendClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListaConsultaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure cmdExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
  function StrToFld(const Value : String) : TFieldType;
    { Private declarations }
  public
    Consultado:Boolean;
    RDoc:TsdXmlDocument;
    procedure Inicializar;
    { Public declarations }
  end;

type
  PConsultas = ^TConsultas;
    TConsultas = Record
    Tipo:string;
    Consulta:string;
end;

var
  frmConsultaRemota: TfrmConsultaRemota;
  Lista:TList;

implementation

{$R *.dfm}
{$H+}

procedure TfrmConsultaRemota.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsultaRemota.BitBtn1Click(Sender: TObject);
var
  Tipo:string;
begin
        if Memo1.Text <> '' then
        begin
          if Pos('select',LowerCase(Memo1.Text)) <> 0 then
            Tipo := 'select'
          else
          if Pos('insert',LowerCase(Memo1.Text)) <> 0 then
            Tipo := 'insert'
          else
          if Pos('delete',LowerCase(Memo1.Text)) <> 0 then
            Tipo := 'delete'
          else
          if Pos('update',LowerCase(Memo1.Text)) <> 0 then
            Tipo := 'update'
          else
            Tipo := 'procedure';
          ListaConsulta.InsertRow(Tipo,Memo1.Text,True);
          Memo1.Text := '';
        end;
end;

procedure TfrmConsultaRemota.BitBtn2Click(Sender: TObject);
begin
        if MessageDlg('Seguro de Quitar esta Consulta?',mtConfirmation,[mbYes,MbNo],0) = MrYes then
           ListaConsulta.DeleteRow(ListaConsulta.Row);
end;

procedure TfrmConsultaRemota.cmdSendClick(Sender: TObject);
var
  ADoc: TsdXmlDocument;
  ANode:TXmlNode;
  Nodo:TXmlNode;
  i,inic:Integer;
  Cadena:string;
  Size:Integer;
  AStream:TMemoryStream;
begin
        if MessageDlg('Seguro de Enviar esta Consulta?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
           cmdSend.Enabled := False;
           Panel2.Enabled := False;
//           Memo1.Enabled := False;
           ADoc := TsdXmlDocument.CreateName('query_info');
           ADoc.XmlFormat := xfReadable;
           ANode := ADoc.Root.NodeNew('querys');
           for i := 1 to ListaConsulta.RowCount - 1 do
           begin
                Nodo := ANode.NodeNew('query');
                Nodo.WriteString('tipo',ListaConsulta.Cells[0,i]);
                Nodo.WriteString('sentencia',ListaConsulta.Cells[1,i]);
           end;
           Memo1.Text := ADoc.WriteToString;
           with IdTCPClient1 do
           begin
             inic := Pos('=',ComboBox1.Text);
             Host := RightStr(ComboBox1.Text,Length(ComboBox1.Text)-inic);
             Port := 3052;
             Connect;
             if Connected then
             begin
                Cadena := ReadLn();
                AStream := TMemoryStream.Create;
                ADoc.SaveToStream(AStream);
                WriteInteger(AStream.Size);
                OpenWriteBuffer;
                WriteStream(AStream);
                CloseWriteBuffer;
                FreeAndNil(AStream);
                Size := ReadInteger;
                AStream := TMemoryStream.Create;
                ReadStream(AStream,Size,False);
                RDoc := TsdXmlDocument.Create;
                RDoc.LoadFromStream(AStream);
                RDoc.SaveToFile('c:\retorno1.xml');
//                Memo1.Text := RDoc.WriteToString;
                Disconnect;
                Consultado := True;
                Memo1.Text := 'Consulta Finalizada';
             end;
           end;
        end;
end;

procedure TfrmConsultaRemota.BitBtn3Click(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmConsultaRemota.Inicializar;
begin
//         ComboBox1.ItemIndex := 0;
         Memo1.Text := '';
         Panel2.Enabled := True;
         ListaConsulta.Strings.Clear;
         DataSource1.Enabled := False;
         Consultado := False;
         cmdSend.Enabled := True;
         try
          FreeAndNil(RDoc);
         finally
          ComboBox1.SetFocus;
         end;
end;

procedure TfrmConsultaRemota.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmConsultaRemota.ListaConsultaClick(Sender: TObject);
var
   NodoRoot,NodoRegistros,NodoCampos:TXmlNode;
   AStream:TStream;
   AList,AListCampos:TList;
   i,j,Campos:Integer;
   NombreCampo:string;
   TipoCampo:TFieldType;
   Tamano:Integer;
   Binario:array of Byte;
begin
        if not Consultado then Exit;

        CDataSet.Active := False;
//        CDataSet.ClearFields;
        CDataSet.FieldDefs.Clear;
        if (ListaConsulta.Keys[ListaConsulta.Row] = 'select') and
           Assigned(RDoc) then
        begin
           RDoc.SaveToFile('C:\Respuesta.xml');
           AList := TList.Create;
           NodoRoot := RDoc.Root.NodeByName('consulta'+Format('%.3d',[ListaConsulta.Row-1]));
           Campos := NodoRoot.ReadAttributeInteger('campos');
           if Campos < 1 then begin
              DataSource1.Enabled := False;
              Exit;
           end;
           for i := 1 to Campos do
           begin
              NombreCampo := NodoRoot.AttributeByName['camponombre'+IntToStr(i)];
              TipoCampo := TFieldType(StrToInt(NodoRoot.AttributeByName['campotipo'+IntToStr(i)]));
              Tamano := StrToInt(NodoRoot.AttributeByName['campotamano'+IntToStr(i)]);
              CDataSet.FieldDefs.Add(NombreCampo,TipoCampo,Tamano);
           end;
           CDataSet.CreateDataSet;
           NodoRoot.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
                AListCampos := TList.Create;
                TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                CDataSet.Append;
                for j := 0 to AListCampos.Count - 1 do
                begin
                try
                  if CDataSet.FieldDefs[j].DataType = ftstring then
                    CDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString
                  else
                  if CDataSet.FieldDefs[j].DataType in [ftsmallint,ftinteger,ftword,ftboolean] then
                    CDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsInteger
                  else
                  if CDataSet.FieldDefs[j].DataType in [ftDate,ftTime,ftDateTime] then
                    CDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsDateTime
                  else
                  if CDataSet.FieldDefs[j].DataType = ftMemo then
                    CDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString
                  else
                  if CDataSet.FieldDefs[j].DataType in [ftBlob,ftGraphic] then
                  begin
                    CDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).BinaryString;
                  end
                  else
                  if CDataSet.FieldDefs[j].DataType in [ftFloat,ftCurrency] then
                    CDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsFloat
                  else
                  if CDataSet.FieldDefs[j].DataType in [ftFMTBcd,ftBCD] then
                   if TXmlNode(AListCampos[j]).ValueAsString <> '' then
                    CDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString
                   else
                    CDataSet.Fields[j].Value := 0
                  else
                    CDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString;
                  except
                  CDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString
                  end;
                end;
                CDataSet.Post;
           end;
           DataSource1.DataSet := CDataSet;
           DataSource1.Enabled := True;
        end
        else
        begin
        end;
end;

procedure TfrmConsultaRemota.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bmp: TBitmap;
  W: integer;
  R: TRect;
  Grafica: TGraphicField;
begin
{  R := Rect;
  if Column.Field.DataType = ftBlob then begin
    bmp := TBitmap.Create;
    try
      bmp.Assign(TGraphicField(Column.Field));
      W := (Rect.Bottom - Rect.Top) * 2;
      R.Right := Rect.Left + W;
      DBGrid1.Canvas.StretchDraw(R, bmp);
    finally
      bmp.Free;
    end;
    R := Rect;
    R.Left := R.Left + W;
  end;
  DBGrid1.DefaultDrawDataCell(R, Column.Field, State);
}
end;

procedure TfrmConsultaRemota.DBGrid1CellClick(Column: TColumn);
var AStream:TStream;
begin

        if (Column.Field.DataType = ftBlob) or
           (Column.Field.DataType = ftGraphic) or
           (Column.Field.DataType = ftMemo) then
        begin
           if Column.Field.DataType = ftMemo then
              Memo2.Text := CDataSet.Fields.FindField(Column.Field.FieldName).AsString
           else
           begin
             AStream := CDataSet.CreateBlobStream(CDataSet.Fields.FindField(Column.Field.FieldName),bmRead);
//             HEditor.LoadFromStream(AStream);
//             HEditor.Enabled := True;
           end;
        end;
end;

procedure TfrmConsultaRemota.cmdExportarClick(Sender: TObject);
var
  ExcelFile:TDataSetToExcel;
begin
        if SaveD1.Execute then
        begin
          ExcelFile := TDataSetToExcel.Create(CDataSet,SaveD1.FileName);
          ExcelFile.WriteFile;
          ExcelFile.Free;
        end;
end;

procedure TfrmConsultaRemota.FormCreate(Sender: TObject);
var
  MiIni:TIniFile;
begin
     MiIni:= TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
     MiIni.ReadSectionValues('OFICINAS',ComboBox1.Items);
     ComboBox1.ItemIndex := 0;
end;

function TfrmConsultaRemota.StrToFld(const Value : String) : TFieldType;
begin
   if Value = 'Unknown' then
      StrToFld := ftUnknown
   else if Value = 'String' then
      StrToFld := ftString
   else if Value = 'Smallint' then
      StrToFld := ftSmallInt
   else if Value = 'Integer' then
      StrToFld := ftInteger
   else if Value = 'Word' then
      StrToFld := ftWord
   else if Value = 'Boolean' then
      StrToFld := ftBoolean
   else if Value = 'Float' then
      StrToFld := ftFloat
   else if Value = 'Currency' then
      StrToFld := ftCurrency
   else if Value = 'BCD' then
      StrToFld := ftBCD
   else if Value = 'Date' then
      StrToFld := ftDate
   else if Value = 'Time' then
      StrToFld := ftTime
   else if Value = 'DateTime' then
      StrToFld := ftDateTime
   else if Value = 'Bytes' then
      StrToFld := ftBytes
   else if Value = 'VarBytes' then
      StrToFld := ftVarBytes
   else if Value = 'AutoInc' then
      StrToFld := ftAutoInc
   else if Value = 'Blob' then
      StrToFld := ftBlob
   else if Value = 'Memo' then
      StrToFld := ftMemo
   else if Value = 'Graphic' then
      StrToFld := ftGraphic
   else if Value = 'FmtMemo' then
      StrToFld := ftFmtMemo
   else if Value = 'ParadoxOle' then
      StrToFld := ftParadoxOle
   else if Value = 'DBaseOle' then
      StrToFld := ftDBaseOle
   else if Value = 'TypedBinary' then
      StrToFld := ftTypedBinary
   else if Value = 'Cursor' then
      StrToFld := ftCursor
   else if Value = 'FixedChar' then
      StrToFld := ftFixedChar
   else if Value = 'WideString' then
      StrToFld := ftWideString
   else if Value = 'LargeInt' then
      StrToFld := ftLargeInt
   else if Value = 'ADT' then
      StrToFld := ftADT
   else if Value = 'Array' then
      StrToFld := ftArray
   else if Value = 'Reference' then
      StrToFld := ftReference
   else if Value = 'DataSet' then
      StrToFld := ftDataSet
   else if Value = 'OraBlob' then
      StrToFld := ftOraBlob
   else if Value = 'OraClob' then
      StrToFld := ftOraClob
   else if Value = 'Variant' then
      StrToFld := ftVariant
   else if Value = 'Interface' then
      StrToFld := ftInterface
   else if Value = 'IDispatch' then
      StrToFld := ftIDispatch
   else if Value = 'GUID' then
      StrToFld := ftGuid
   else if Value = 'TimeStamp' then
      StrToFld := ftTimeStamp
   else if Value = 'FMTBcd' then
      StrToFld := ftFMTBcd
   else
      StrToFld := ftUnknown;
end;


procedure TfrmConsultaRemota.BitBtn4Click(Sender: TObject);
begin
        Memo1.Text := ListaConsulta.Cells(2.ListaConsulta.Row)
end;

end.
