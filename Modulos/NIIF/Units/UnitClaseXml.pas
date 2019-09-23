unit UnitClaseXml;

interface
uses sdXmlDocuments,Classes,DBClient,Db,SysUtils;
type
   TXml = class
     private
       _xXmlArchivo :TsdXmlDocument;
       _xNodo,_xNodo1 :TXmlNode;
       _sTipo :string;
       _sSentencia: string;
       _tAstreamEnt :TMemoryStream;
       _sListaConsulta :string;
    function StrToFld(const Value: String): TFieldType;
     public
       property Tipo :string Write  _sTipo;
       property Sentencia :string Write  _sSentencia;
       property ListaConsulta :string Write  _sListaConsulta;
       property AstreamEnt :TMemoryStream Write _tAstreamEnt;
       procedure CrearXml;
       procedure CargarNodo;
       function CargarAstream:TMemoryStream;
       function LeerXml:TClientDataSet;
   end;

implementation
procedure TXml.CrearXml;
begin
        _xXmlArchivo := TsdXmlDocument.CreateName('query_info');
        _xXmlArchivo.XmlFormat := xfReadable;
        _xNodo := _xXmlArchivo.Root.NodeNew('querys');
end;
procedure TXml.CargarNodo;
begin
        _xNodo1 := _xNodo.NodeNew('query');
        _xNodo1.WriteString('tipo',_sTipo);
        _xNodo1.WriteString('sentencia',_sSentencia);
        _xXmlArchivo.SaveToFile('c:\resp.xml');
end;
function TXml.CargarAstream;
var     Astream :TMemoryStream;
begin
        Astream := TMemoryStream.Create;
        _xXmlArchivo.SaveToStream(Astream);
        Result := Astream;
        _xXmlArchivo.Free;
end;
function TXml.LeerXml;
var    _xXml :TsdXmlDocument;
       _xNod,_xNod1 :TXmlNode;
       CdDataset: TClientDataSet;
       _sNombreCampo:string;
       _tTipoCampo:TFieldType;
       _iTamano:Integer;
       _iCampos :Integer;
       i,j:Integer;
       AList,AListCampos:TList;
begin
        AList := TList.Create;
        _xXml := TsdXmlDocument.Create;
        _xXml.EncodingString := 'ISO8859-1';
        _xXml.XmlFormat := xfReadable;
        _xXml.LoadFromStream(_tAstreamEnt);
        _xXml.SaveToFile('c:\Respuesta.xml');
        CdDataset := TClientDataSet.Create(nil);
        CDDataSet.Active := False;
        CDDataSet.FieldDefs.Clear;
        _xNod := _xXml.Root.NodeByName(_sListaConsulta);
        try
          _iCampos := _xNod.ReadAttributeInteger('campos');
        except
          _iCampos := 0;
        end;
        for i := 1 to _iCampos do
        begin
          _sNombreCampo := _xNod.AttributeByName['camponombre'+IntToStr(i)];
          _tTipoCampo := StrToFld(_xNod.AttributeByName['campotipo'+IntToStr(i)]);
          _iTamano := StrToInt(_xNod.AttributeByName['campotamano'+IntToStr(i)]);
          with CDDataSet.FieldDefs.AddFieldDef do
          begin
            Name      := _sNombreCampo;
            DataType  := _tTipoCampo;
            if (_tTipoCampo in [ftDate,ftTime,ftTimeStamp,ftInteger,ftSmallInt,ftCurrency,ftFloat,ftMemo,ftBlob]) then _iTamano := 0;
            Size      := _iTamano;
          end;
         end;
         if _iCampos <> 0 then
         begin
           CDDataSet.CreateDataSet;
           _xNod.NodesByName('Registro',AList);
             for i := 0 to AList.Count -1 do
             begin
               AListCampos := TList.Create;
               TXmlNode(AList[i]).NodesByName('campo',AListCampos);
               CDDataSet.Append;
               try
                 for j := 0 to AListCampos.Count - 1 do
                 begin
                   if TXmlNode(AListCampos[j]).ValueAsString <> '' then
                   begin
                     if CDDataSet.FieldDefs[j].DataType = ftstring then
                       CDDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString
                     else
                     if CDDataSet.FieldDefs[j].DataType in [ftsmallint,ftinteger,ftword,ftboolean] then
                       CDDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsInteger
                     else
                     if CDDataSet.FieldDefs[j].DataType in [ftDate,ftDateTime,ftTimeStamp] then
                       CDDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsDateTime
                     else
                     if CDDataSet.FieldDefs[j].DataType in [ftTime] then
                       CDDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString
                     else
                     if CDDataSet.FieldDefs[j].DataType = ftMemo then
                       CDDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString
                     else
                     if CDDataSet.FieldDefs[j].DataType in [ftBlob,ftGraphic] then
                     begin
                       CDDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).BinaryString;
                     end
                     else
                     if CDDataSet.FieldDefs[j].DataType in [ftFloat,ftCurrency] then
                       CDDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsFloat
                     else
                     if CDDataSet.FieldDefs[j].DataType in [ftFMTBcd,ftBCD] then
                        if TXmlNode(AListCampos[j]).ValueAsString <> '' then
                           CDDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString
                        else
                           CDDataSet.Fields[j].Value := 0
                   else
                       CDDataSet.Fields[j].Value := TXmlNode(AListCampos[j]).ValueAsString;
                   end;
                 end; // fin del segundo for
                 CDDataSet.Post;
               except
                 CdDataset.CancelUpdates;
               end;// fin del try
             end; // fin del rpimer for
          end
          else
          begin
            with CDDataSet.FieldDefs.AddFieldDef do
            begin
              Name      := 'Res';
              DataType  := ftSmallint;
              Size      := 0;
            end;
            CDDataSet.CreateDataSet;
          end;
           CdDataset.First;
           Result := CdDataset;

end;
function TXml.StrToFld(const Value: String): TFieldType;
begin
   if (UpperCase(Value) = 'UNKNOWN') then
      StrToFld := ftUnknown
   else if (UpperCase(Value) ='STRING') then
      StrToFld := ftString
   else if (UpperCase(Value) ='SMALLINT') then
      StrToFld := ftSmallInt
   else if (UpperCase(Value) = 'INTEGER') then
      StrToFld := ftInteger
   else if (UpperCase(Value) = 'WORD') then
      StrToFld := ftWord
   else if (UpperCase(Value) = 'BOOLEAN') then
      StrToFld := ftBoolean
   else if (UpperCase(Value) = 'FLOAT') then
      StrToFld := ftFloat
   else if (UpperCase(Value) = 'CURRENCY') then
      StrToFld := ftCurrency
   else if (UpperCase(Value) = 'NUMERIC') or (UpperCase(Value) = 'DOUBLE PRECISION') or (UpperCase(Value) = 'DECIMAL') then
      StrToFld := ftCurrency
   else if (UpperCase(Value) = 'BCD') then
      StrToFld := ftBCD
   else if (UpperCase(Value) = 'DATE') then
      StrToFld := ftDate
   else if (UpperCase(Value) = 'TIME') then
      StrToFld := ftTime
   else if (UpperCase(Value) = 'DATETIME') then
      StrToFld := ftDateTime
   else if (UpperCase(Value) = 'BYTES') then
      StrToFld := ftBytes
   else if (UpperCase(Value) = 'VARBYTES') then
      StrToFld := ftVarBytes
   else if (UpperCase(Value) = 'AUTOINC') then
      StrToFld := ftAutoInc
   else if (UpperCase(Value) = 'BLOB') then
      StrToFld := ftBlob
   else if (UpperCase(Value) = 'MEMO') or (UpperCase(Value) = 'BLOB SUB_TYPE 1') then
      StrToFld := ftMemo
   else if (UpperCase(Value) = 'GRAPHIC') then
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
   else if (UpperCase(Value) = 'CHAR') then
      StrToFld := ftFixedChar
   else if (UpperCase(Value) = 'VARCHAR') then
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
   else if (UpperCase(Value) = 'VARIANT') then
      StrToFld := ftVariant
   else if Value = 'Interface' then
      StrToFld := ftInterface
   else if Value = 'IDispatch' then
      StrToFld := ftIDispatch
   else if Value = 'GUID' then
      StrToFld := ftGuid
   else if (UpperCase(Value) = 'TIMESTAMP') then
      StrToFld := ftTimeStamp
   else if Value = 'FMTBcd' then
      StrToFld := ftFMTBcd
   else
      StrToFld := ftUnknown;
end;

end.
