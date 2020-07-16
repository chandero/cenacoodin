unit UnitGuardaImagen;

interface
uses IBDatabase,Classes,UnitGlobales,IBQuery,DB,SysUtils;
type
   TGImagen = class
     private
     public
     function ActualizarImagen(_Imagen:TMemoryStream;_iTipoImagen:Integer;_iIdPersona:string;iIdIdentificacion:Integer):Boolean;
     function InsertarImagen(_iFoto,_iFirma,_iHuella:TMemoryStream;_iIdPersona:string;iIdIdentificacion:Integer):Boolean;
     //Tipotransaccion 0:Inserccion 1:Actualizar
     //TipoIMagen 0:FOTO 1:FIRMA 2:HUELLA
     function ConsultaImagen(_iIdIdentificacion:Integer;iIdPersona:string): TImagen;
     function LimpiarImagen(_iTipoImagen:Integer;_iIdPersona:string;iIdIdentificacion:Integer):Boolean;
   end;


implementation

{ TGImagen }

function TGImagen.ActualizarImagen(_Imagen:TMemoryStream;_iTipoImagen:Integer;_iIdPersona:string;iIdIdentificacion:Integer): Boolean;
var
        _iDatabase :TIBDatabase;
        _iTransaction :TIBTransaction;
        _IBquery : TIBQuery;
        _tLista :TStringList;
begin
  _Imagen.Seek(0,_Imagen.Size);
  _tLista := TStringList.Create;
  _iDatabase := TIBDatabase.Create(nil);
  _iDatabase.DatabaseName := _sServerImagen;
  _iDatabase.SQLDialect := 3;
  _iDatabase.LoginPrompt := False;
  _iDatabase.Params.Add('user_name=sysdba');
  _iDatabase.Params.Add('password=masterkey');
  _iDatabase.Params.Add('lc_ctype=ISO8859_1');
  try
  _iDatabase.Open;
  except
   exit;
  end;
  _iTransaction := TIBTransaction.Create(nil);
  _iTransaction.DefaultDatabase := _iDatabase;
  _iTransaction.DefaultAction := TARollback;
  _iTransaction.Active := true;
  _IBquery := TIBQuery.Create(nil);
  with _IBquery do
  begin
    Database := _iDatabase;
    Transaction := _iTransaction;
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM IMAGEN');
    SQL.Add('WHERE');
    SQL.Add('IMAGEN.ID_PERSONA = :ID_PERSONA AND');
    SQL.Add('IMAGEN.ID_IDENTIFICACION = :ID_IDENTIFICACION');
    ParamByName('ID_PERSONA').AsString := _iIdPersona;
    ParamByName('ID_IDENTIFICACION').AsInteger := iIdIdentificacion;
    Open;
    if RecordCount = 0 then
     begin
       SQL.Clear;
       SQL.Add('INSERT INTO IMAGEN VALUES(:ID_IDENTIFICACION,:ID_PERSONA,NULL,NULL,NULL)');
       ParamByName('ID_PERSONA').AsString := _iIdPersona;
       ParamByName('ID_IDENTIFICACION').AsInteger := iIdIdentificacion;
       ExecSQL;
       _tLista.Add(_iIdPersona + '-->>Inserta Tama=' + IntToStr(_Imagen.Size));
       Transaction.Commit;
       Transaction.StartTransaction;
     end;
//    else
//     begin
       SQL.Clear;
       SQL.Add('UPDATE');
       SQL.Add('  IMAGEN');
       SQL.Add(' SET');
       if _iTipoImagen = 0 then //Foto
          SQL.Add('FOTO = :IMAGEN ');
       if _iTipoImagen = 1 then //Huella
           SQL.Add('HUELLA = :IMAGEN ');
       if _iTipoImagen = 2 then //Firma
           SQL.Add('FIRMA = :IMAGEN ');
       SQL.Add('WHERE');
       SQL.Add('IMAGEN.ID_PERSONA = :ID_PERSONA AND');
       SQL.Add('IMAGEN.ID_IDENTIFICACION = :ID_IDENTIFICACION');
       ParamByName('ID_PERSONA').AsString := _iIdPersona;
       ParamByName('ID_IDENTIFICACION').AsInteger := iIdIdentificacion;
       _tLista.Add(_iIdPersona + '-->>Actualiza Tama=' + IntToStr(_Imagen.Size));
       ParamByName('IMAGEN').LoadFromStream(_Imagen,ftBlob);

       try
         ExecSQL;
         if _IBquery.RowsAffected > 0 then
         begin
            _tLista.Add('Columna Afectada');
         end;

         Transaction.Commit;
         Result := True;
       Except
       begin
         Result := False;
         _tLista.Add('Error');
       end;
       end;
     //end;
    end;
  _iDatabase.Close;
  _iTransaction.Active := False;
  FreeAndNil(_IBQuery);
  FreeAndNil(_iDatabase);
  FreeAndNil(_iTransaction);
  try
  _tLista.SaveToFile('c:\lista.txt');
  except
  end;
  FreeAndNil(_tLista);
end;

function TGImagen.ConsultaImagen(_iIdIdentificacion:Integer;iIdPersona:string): TImagen;
var
        _iDatabase :TIBDatabase;
        _iTransaction :TIBTransaction;
        _IBquery : TIBQuery;
        _rImagen :TImagen;
begin
   _rImagen.Firma := TMemoryStream.Create;
   _rImagen.Foto := TMemoryStream.Create;
   _rImagen.Huella := TMemoryStream.Create;
  _iDatabase := TIBDatabase.Create(nil);
  _iDatabase.DatabaseName := _sServerImagen;
  _iDatabase.SQLDialect := 3;
  _iDatabase.LoginPrompt := False;
  _iDatabase.Params.Add('user_name=sysdba');
  _iDatabase.Params.Add('password=masterkey');
  _iDatabase.Params.Add('lc_ctype=ISO8859_1');
  _iDatabase.Open;
  _iTransaction := TIBTransaction.Create(nil);
  _iTransaction.DefaultDatabase := _iDatabase;
  _iTransaction.DefaultAction := TARollback;
  _iTransaction.Active := true;
  _IBquery := TIBQuery.Create(nil);
  with _IBquery do
  begin
    Database := _iDatabase;
    Transaction := _iTransaction;
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('IMAGEN.FOTO, ');
    SQL.Add('IMAGEN.HUELLA, ');
    SQL.Add('IMAGEN.FIRMA ');
    SQL.Add('FROM ');
    SQL.Add('IMAGEN ');
    SQL.Add('WHERE ');
    SQL.Add('IMAGEN.ID_PERSONA = :ID_PERSONA AND ');
    SQL.Add('IMAGEN.ID_IDENTIFICACION = :ID_IDENTIFICACION ');
    ParamByName('ID_PERSONA').AsString := iIdPersona;
    ParamByName('ID_IDENTIFICACION').AsInteger := _iIdIdentificacion;
    Open;
    TBlobField(FieldByName('FOTO')).SaveToStream(_rImagen.Foto);
    TBlobField(FieldByName('FIRMA')).SaveToStream(_rImagen.Firma);
    TBlobField(FieldByName('HUELLA')).SaveToStream(_rImagen.Huella);
    _rImagen.Foto.Position := 0;
    _rImagen.Firma.Position := 0;
    _rImagen.Huella.Position := 0;
    Result := _rImagen;
  end;
  _iDatabase.Close;
  _iTransaction.Active := False;
  FreeAndNil(_IBQuery);
  FreeAndNil(_iDatabase);
  FreeAndNil(_iTransaction);

end;

function TGImagen.InsertarImagen(_iFoto, _iFirma, _iHuella: TMemoryStream;
  _iIdPersona: string; iIdIdentificacion: Integer): Boolean;
var
        _iDatabase :TIBDatabase;
        _iTransaction :TIBTransaction;
        _IBquery : TIBQuery;
        _tLista :TStringList;
        _bFoto,_bHuella,_bFirma :Boolean;
begin
  _bFoto := True;
  _bHuella := True;
  _bFirma := True;
  try
     _iFoto.Seek(0,_iFoto.Size);
  except
    _bFoto := False;
  end;
  try
     _iFirma.Seek(0,_iFirma.Size);
  except
    _bFirma := False;
  end;
  try
     _iHuella.Seek(0,_iHuella.Size);
  except
    _bHuella := False;
  end;
  _tLista := TStringList.Create;
  _iDatabase := TIBDatabase.Create(nil);
  _iDatabase.DatabaseName := _sServerImagen;
  _iDatabase.SQLDialect := 3;
  _iDatabase.LoginPrompt := False;
  _iDatabase.Params.Add('user_name=sysdba');
  _iDatabase.Params.Add('password=masterkey');
  _iDatabase.Params.Add('lc_ctype=ISO8859_1');
  _iDatabase.Open;
  _iTransaction := TIBTransaction.Create(nil);
  _iTransaction.DefaultDatabase := _iDatabase;
  _iTransaction.DefaultAction := TARollback;
  _iTransaction.Active := True;
  _IBquery := TIBQuery.Create(nil);
  with _IBquery do
  begin
    Database := _iDatabase;
    Transaction := _iTransaction;
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM IMAGEN');
    SQL.Add('WHERE');
    SQL.Add('IMAGEN.ID_PERSONA = :ID_PERSONA AND');
    SQL.Add('IMAGEN.ID_IDENTIFICACION = :ID_IDENTIFICACION');
    ParamByName('ID_PERSONA').AsString := _iIdPersona;
    ParamByName('ID_IDENTIFICACION').AsInteger := iIdIdentificacion;
    Open;
    if RecordCount = 0 then
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO ');
      SQL.Add('IMAGEN( ');
      SQL.Add('ID_IDENTIFICACION,');
      SQL.Add('ID_PERSONA,');
      SQL.Add('FOTO,');
      SQL.Add('HUELLA, ');
      SQL.Add('FIRMA)');
      SQL.Add('VALUES(');
      SQL.Add(':ID_IDENTIFICACION,');
      SQL.Add(':ID_PERSONA,');
      SQL.Add(':FOTO,');
      SQL.Add(':HUELLA,');
      SQL.Add(':FIRMA)');
      ParamByName('ID_PERSONA').AsString := _iIdPersona;
      ParamByName('ID_IDENTIFICACION').AsInteger := iIdIdentificacion;
      _tLista.Add(_iIdPersona);
      if _bFoto then
         ParamByName('FOTO').LoadFromStream(_iFoto,ftBlob)
      else
         ParamByName('FOTO').Clear;
      if _bHuella  then
        ParamByName('HUELLA').LoadFromStream(_iHuella,ftBlob)
      else
        ParamByName('HUELLA').Clear;
      if _bFirma then
        ParamByName('FIRMA').LoadFromStream(_iFirma,ftBlob)
      else
        ParamByName('FIRMA').Clear;
      try
        ExecSQL;
        if _IBquery.RowsAffected > 0 then
           _tLista.Add('Columnas Afectadas');
        Transaction.Commit;
        Result := True;
      except
      begin
        Result := False;
      end;
      end;
    end
    else
    begin
      if _bFoto then
         ActualizarImagen(_iFoto,0,_iIdPersona,iIdIdentificacion);
      if _bHuella then
          ActualizarImagen(_iHuella,1,_iIdPersona,iIdIdentificacion);
      if _bFirma then
         ActualizarImagen(_iFirma,2,_iIdPersona,iIdIdentificacion);
    end;
  end;
  _iDatabase.Close;
  _iTransaction.Active := False;
  FreeAndNil(_IBQuery);
  FreeAndNil(_iTransaction);
  FreeAndNil(_iDatabase);
  try
  _tLista.SaveToFile('c:\lista.txt');
  except
  end;
  FreeAndNil(_tLista);
end;

function TGImagen.LimpiarImagen(_iTipoImagen: Integer; _iIdPersona: string;
  iIdIdentificacion: Integer): Boolean;
var
        _iDatabase :TIBDatabase;
        _iTransaction :TIBTransaction;
        _IBquery : TIBQuery;
begin
  _iDatabase := TIBDatabase.Create(nil);
  _iDatabase.DatabaseName := _sServerImagen;
  _iDatabase.SQLDialect := 3;
  _iDatabase.LoginPrompt := False;
  _iDatabase.Params.Add('user_name=sysdba');
  _iDatabase.Params.Add('password=masterkey');
  _iDatabase.Params.Add('lc_ctype=ISO8859_1');
  _iDatabase.Open;
  _iTransaction := TIBTransaction.Create(nil);
  _iTransaction.DefaultDatabase := _iDatabase;
  _iTransaction.DefaultAction := TARollback;
  _iTransaction.Active := true;
  _IBquery := TIBQuery.Create(nil);
  with _IBquery do
  begin
    Database := _iDatabase;
    Transaction := _iTransaction;
    Close;
    SQL.Clear;
    SQL.Add('UPDATE');
    SQL.Add('  IMAGEN');
    SQL.Add(' SET');
    if _iTipoImagen = 0 then //Foto
       SQL.Add('FOTO = NULL ');
    if _iTipoImagen = 1 then //Firma
        SQL.Add('FIRMA = NULL ');
    if _iTipoImagen = 2 then //Huella
        SQL.Add('HUELLA = NULL ');
    SQL.Add('WHERE');
    SQL.Add('IMAGEN.ID_PERSONA = :ID_PERSONA AND');
    SQL.Add('IMAGEN.ID_IDENTIFICACION = :ID_IDENTIFICACION');
    ParamByName('ID_PERSONA').AsString := _iIdPersona;
    ParamByName('ID_IDENTIFICACION').AsInteger := iIdIdentificacion;
    try
      ExecSQL;
      Transaction.Commit;
      Result := True;
    Except
      Result := False;
    end;
  end;
  _iDatabase.Close;
  _iTransaction.Active := False;
  FreeAndNil(_IBQuery);
  FreeAndNil(_iDatabase);
  FreeAndNil(_iTransaction);
end;

end.
