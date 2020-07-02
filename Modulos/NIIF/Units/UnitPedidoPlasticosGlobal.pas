unit UnitPedidoPlasticosGlobal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvMaskEdit, JvSpin, Buttons, ExtCtrls, IBSQL,
  JvEdit, JvTypedEdit, DB, IBCustomDataSet, IBQuery, IdTCPConnection, IdTCPClient,sdXmlDocuments,
  IdBaseComponent, IdComponent;

type
  TfrmPedidoPlasticosGlobal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EdCantidad: TJvSpinEdit;
    Panel1: TPanel;
    btnRegistrar: TBitBtn;
    btnCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    Label3: TLabel;
    EdExistencia: TStaticText;
    EdUltimoPlastico: TStaticText;
    IBAgencias: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    IBSQL2: TIBSQL;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRegistrarClick(Sender: TObject);
    procedure VerificaTDGlobal(vHost, Desc: string;vPuerto,vIdAgencia: Integer);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
    { Private declarations }
    XmlPet,XmlRes: TsdXmlDocument;
    Nodo,Nodo1:TXmlNode;
    Size:Integer;
    AStream:TMemoryStream;
    sentencia :string;
    tamano :Integer;
    host_server: string;
    puerto_server: Integer;
  public
    function EnviarXml(iIdPuerto:Integer;sIdHost,Desc:string;AstreamEnv:TMemoryStream): TMemoryStream;
    { Public declarations }
  end;

var
  frmPedidoPlasticosGlobal: TfrmPedidoPlasticosGlobal;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales, UnitPantallaProgreso;

procedure TfrmPedidoPlasticosGlobal.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidoPlasticosGlobal.FormCreate(Sender: TObject);
begin
   if IBSQL1.Transaction.InTransaction then
       IBSQL1.Transaction.Rollback;
   IBSQL1.Transaction.StartTransaction;
   IBSQL1.Close;
   IBSQL1.SQL.Clear;
   IBSQL1.SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 16');
   try
    IBSQL1.ExecQuery;
    EdCantidad.MinValue := IBSQL1.FieldByName('VALOR_MINIMO').AsInteger;
   except
    IBSQL1.Transaction.Rollback;
    raise;
   end;

   with IBAgencias do
    begin
      Close;
      ParamByName('ID_AGENCIA').AsInteger := 0;
      Open;
      if RecordCount > 0 then
        VerificaTDGlobal(FieldByName('ID_HOST').AsString,FieldByName('DESCRIPCION_AGENCIA').AsString,FieldByName('ID_PUERTO').AsInteger,FieldByName('ID_AGENCIA').AsInteger);
    end;
end;

procedure TfrmPedidoPlasticosGlobal.btnRegistrarClick(Sender: TObject);
var     Astream :TMemoryStream;
        tamano,i :Integer;
        AList,AListCampos:TList;
        Cadena:string;
begin
      if MessageDlg('¿Seguro de Realizar el Pedido?',mtConfirmation,[mbYes,mbNo],0) = mrYes then

       with IBAgencias do
        begin
          Close;
          ParamByName('ID_AGENCIA').AsInteger := 0;
          Open;
          if RecordCount > 0 then
            VerificaTDGlobal(FieldByName('ID_HOST').AsString,FieldByName('DESCRIPCION_AGENCIA').AsString,FieldByName('ID_PUERTO').AsInteger,FieldByName('ID_AGENCIA').AsInteger);
        end;

       //Existencia suficiente para asignar tarjetas
       if StrToInt(EdExistencia.Caption) >= StrToInt(EdCantidad.Text) then
        //Registrar el pedido para enviar en novedades
        begin
         btnRegistrar.Enabled := False;
         try
          XmlPet := TsdXmlDocument.CreateName('query_info');
          XmlPet.XmlFormat := xfReadable;
          Nodo := XmlPet.Root.NodeNew('querys');
          sentencia := 'select * from PEDIDO_TDB(' + '''' + EdCantidad.Text + '''' + ',' + IntToStr(Agencia) + ')';
          nodo1 := Nodo.NodeNew('query');
          Nodo1.WriteString('tipo','select');
          Nodo1.WriteString('sentencia',sentencia);

          Xmlres := TsdXmlDocument.Create;
          Xmlres.EncodingString := 'ISO8859-1';
          Xmlres.XmlFormat := xfReadable;
          Astream := TMemoryStream.Create;
          XmlPet.SaveToStream(Astream);
          XmlRes.LoadFromStream(EnviarXml(IBAgencias.FieldByName('ID_PUERTO').AsInteger,IBAgencias.FieldByName('ID_HOST').AsString,'',Astream));
          Xmlres.SaveToFile('c:\TDebito' + IntToStr(Agencia) + '.xml');

          AList := TList.Create;
          Nodo := XmlRes.Root.NodeByName('consulta000');
          Nodo.NodesByName('Registro',AList);

          try
          for i := 0 to AList.Count -1 do
           begin
             AListCampos := TList.Create;
             TXmlNode(AList[i]).NodesByName('campo',AListCampos);

             IBSQL2.Close;
             IBSQL2.SQL.Clear;
             IBSQL2.SQL.Add('insert into "cap$tarjetasdebito" values(:ID_TARJETA,:ASIGNADA,:ID_ESTADO)');
             IBSQL2.ParamByName('ID_TARJETA').AsString := TXmlNode(AListCampos[0]).ValueAsString;
             IBSQL2.ParamByName('ASIGNADA').AsInteger := 0;
             IBSQL2.ParamByName('ID_ESTADO').AsInteger := 0;
             try
              IBSQL2.ExecQuery;
             except
              IBSQL2.Transaction.Rollback;
              raise;
             end;
           end;
           IBSQL2.Transaction.Commit;           
           except
           end;
          except
            on e: Exception do
            begin
              ShowMessage('Error Interno, con Mensaje: ' + e.Message );
            end;
          end;
          ShowMessage('Pedido Registrado con Exito!');          
        end // Fin If Existencia >= Cantidad

        else
        begin
          if (StrToInt(EdExistencia.Caption) > 0) and (MessageDlg('¿Desea Aplicar las Disponibles?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then begin
           try
             btnRegistrar.Enabled := False;
             XmlPet := TsdXmlDocument.CreateName('query_info');
             XmlPet.XmlFormat := xfReadable;
             Nodo := XmlPet.Root.NodeNew('querys');
             sentencia := 'select * from PEDIDO_TDB(' + '''' + Trim(EdExistencia.Caption) + '''' + ',' + IntToStr(Agencia) + ')';
             nodo1 := Nodo.NodeNew('query');
             Nodo1.WriteString('tipo','select');
             Nodo1.WriteString('sentencia',sentencia);

             Xmlres := TsdXmlDocument.Create;
             Xmlres.EncodingString := 'ISO8859-1';
             Xmlres.XmlFormat := xfReadable;
             Astream := TMemoryStream.Create;
             XmlPet.SaveToStream(Astream);
             XmlRes.LoadFromStream(EnviarXml(IBAgencias.FieldByName('ID_PUERTO').AsInteger,IBAgencias.FieldByName('ID_HOST').AsString,'',Astream));
             Xmlres.SaveToFile('c:\TDebito' + IntToStr(Agencia) + '.xml');

             AList := TList.Create;
             Nodo := XmlRes.Root.NodeByName('consulta000');
             Nodo.NodesByName('Registro',AList);

             try
               for i := 0 to AList.Count -1 do
                begin
                  AListCampos := TList.Create;
                  TXmlNode(AList[i]).NodesByName('campo',AListCampos);

                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('insert into "cap$tarjetasdebito" values(:ID_TARJETA,:ASIGNADA,:ID_ESTADO)');
                  IBSQL2.ParamByName('ID_TARJETA').AsString := TXmlNode(AListCampos[0]).ValueAsString;
                  IBSQL2.ParamByName('ASIGNADA').AsInteger := 0;
                  IBSQL2.ParamByName('ID_ESTADO').AsInteger := 0;
                  try
                    IBSQL2.ExecQuery;
                    IBSQL2.Transaction.Commit;
                    ShowMessage('Pedido Registrado con Exito!');
                  except
                    IBSQL2.Transaction.Rollback;
                    raise;
                  end;
                end;
             except
             end;
             except
              on e: Exception do
              begin
                ShowMessage('Error Interno, con Mensaje: ' + e.Message );
              end;
             end;
        end //Fin Aplicar Disponibles

        else begin //No Aplicar Ninguna
         try
          btnRegistrar.Enabled := False;
          XmlPet := TsdXmlDocument.CreateName('query_info');
          XmlPet.XmlFormat := xfReadable;
          Nodo := XmlPet.Root.NodeNew('querys');
          sentencia := 'INSERT INTO TDB$PEDIDO VALUES (' + '''' + DateToStr(fFechaActual) + '''' + ',' + '''' + EdUltimoPlastico.Caption + '''' + ',' + EdCantidad.Text + ',' + IntToStr(Agencia) + ')';
          nodo1 := Nodo.NodeNew('query');
          Nodo1.WriteString('tipo','insert');
          Nodo1.WriteString('sentencia',sentencia);

          Xmlres := TsdXmlDocument.Create;
          Xmlres.EncodingString := 'ISO8859-1';
          Xmlres.XmlFormat := xfReadable;
          Astream := TMemoryStream.Create;
          XmlPet.SaveToStream(Astream);
          XmlRes.LoadFromStream(EnviarXml(IBAgencias.FieldByName('ID_PUERTO').AsInteger,IBAgencias.FieldByName('ID_HOST').AsString,'',Astream));
          Xmlres.SaveToFile('c:\TDebito' + IntToStr(Agencia) + '.xml');          

          ShowMessage('Solicitud de Pedido Registrada con Exito!');
          except
            on e: Exception do
            begin
              ShowMessage('Error Interno, con Mensaje: ' + e.Message );
            end;
          end;
        end; //Fin No Aplicar Ninguna
      end;
end;

procedure TfrmPedidoPlasticosGlobal.VerificaTDGlobal(vHost, Desc: string;
  vPuerto,vIdAgencia: Integer);
var      cadena :string;
         AList,AListCampos:TList;
         i :Integer;
         vEstado :Boolean;
begin
      try
        vEstado := True;
        XmlPet := TsdXmlDocument.CreateName('query_info');
        XmlPet.XmlFormat := xfReadable;
        Nodo := XmlPet.Root.NodeNew('querys');
        sentencia := 'select * from EXISTENCIA_TDB(1)';
        nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        Xmlres := TsdXmlDocument.Create;
        Xmlres.EncodingString := 'ISO8859-1';
        Xmlres.XmlFormat := xfReadable;
        Astream := TMemoryStream.Create;
        XmlPet.SaveToStream(Astream);
        XmlRes.LoadFromStream(EnviarXml(IBAgencias.FieldByName('ID_PUERTO').AsInteger,IBAgencias.FieldByName('ID_HOST').AsString,'',Astream));
        XmlRes.SaveToFile('c:\TDebito' + IntToStr(Agencia) + '.xml');

        AList := TList.Create;
        Nodo := XmlRes.Root.NodeByName('consulta000');
        Nodo.NodesByName('Registro',AList);
        vEstado := False;
        try
        for i := 0 to AList.Count -1 do
         begin
           vEstado := True;
           AListCampos := TList.Create;
           TXmlNode(AList[i]).NodesByName('campo',AListCampos);
           EdUltimoPlastico.Caption := TXmlNode(AListCampos[0]).ValueAsString;
           EdExistencia.Caption := TXmlNode(AListCampos[1]).ValueAsString;
         end;
         except
         end;
        except
        on e: Exception do
        begin
          ShowMessage('Error Interno, con Mensaje: ' + e.Message );
        end;
        end;
end;


procedure TfrmPedidoPlasticosGlobal.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;
end;

procedure TfrmPedidoPlasticosGlobal.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;
end;

procedure TfrmPedidoPlasticosGlobal.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

function TfrmPedidoPlasticosGlobal.EnviarXml(iIdPuerto:Integer;sIdHost,Desc:string;AstreamEnv:TMemoryStream): TMemoryStream;
var     Cadena :string;
        AStream : TMemoryStream;
        Tamano :Integer;
begin
        with IdTCPClient1 do
        begin
          Port := iIdPuerto;
          Host := sIdHost;
          try
            Application.ProcessMessages;
            Connect;
            if Connected then
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Enviando Informacion de ' + Desc;
              frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
              Application.ProcessMessages;
              frmProgreso.Position := 2;
              frmProgreso.Min := 0;
              frmProgreso.Ejecutar;
              Cadena := ReadLn();
              WriteInteger(AStreamEnv.Size);
              OpenWriteBuffer;
              WriteStream(AStreamEnv);
              CloseWriteBuffer;
              FreeAndNil(AStreamEnv);
              tamano := ReadInteger;
              AStream := TMemoryStream.Create;
              ReadStream(Astream,tamano,False);
              Disconnect;
              frmProgreso.Cerrar;
            end;
          except
          on e: Exception do
          begin
            ShowMessage('Error Interno, con Mensaje: ' + e.Message );
          end;
        end;
        end;
        Result := AStream;
end;

end.
