unit UnitSaldosCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, IBDatabase, DBClient, FR_DSet, FR_DBSet, FR_Class,
  IdBaseComponent, IdComponent, IdTCPConnection, sdXmlDocuments,IdTCPClient,
  IBSQL, ComCtrls;

type
  TFrmSaldosCaja = class(TForm)
    Panel1: TPanel;
    DBagencia: TDBLookupComboBox;
    Label1: TLabel;                    
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    IBagencia: TIBQuery;
    DSagencia: TDataSource;
    CBtotal: TCheckBox;
    IBsaldos: TIBQuery;
    IBTransaction1: TIBTransaction;
    CDsaldos: TClientDataSet;
    CDsaldosid_agencia: TIntegerField;
    CDsaldosagencia: TStringField;
    CDsaldosempleado: TStringField;
    CDsaldoscaja: TIntegerField;
    CDsaldossaldo: TCurrencyField;
    frDBDataSet1: TfrDBDataSet;
    IdTCPClient1: TIdTCPClient;
    CdCheques: TClientDataSet;
    CdChequesid_agencia: TSmallintField;
    CdChequesagencia: TStringField;
    CdChequesvalor: TCurrencyField;
    CdChequesnumero: TIntegerField;
    frDBDataSet2: TfrDBDataSet;
    DSSaldos: TDataSource;
    IBSQL1: TIBSQL;
    IBQuery1: TIBQuery;
    CDbancos: TClientDataSet;
    CDbancosCODIGO: TStringField;
    CDbancosNOMBRECOD: TStringField;
    CDbancosSALDOINICIAL: TCurrencyField;
    CDbancosID_COMPROBANTE: TIntegerField;
    CDbancosDEBITO: TCurrencyField;
    CDbancosCREDITO: TCurrencyField;
    CDbancosID_PERSONA: TStringField;
    CDbancosAGENCIA: TStringField;
    CDbancosNOMBRE: TStringField;
    CDbancosPRIMER_APELLIDO: TStringField;
    CDbancosSEGUNDO_APELLIDO: TStringField;
    CDbancosSALDOAUXILIAR: TCurrencyField;
    CDbancosID_AGENCIA: TIntegerField;
    frDBDataSet3: TfrDBDataSet;
    CDbancosDESCRIPCION: TBlobField;
    Panel4: TPanel;
    Rcajas: TRadioButton;
    Rbancos: TRadioButton;
    Panel3: TPanel;
    Label2: TLabel;
    DtFecha: TDateTimePicker;
    CdConBancos: TClientDataSet;
    CdConBancosID_AGENCIA: TIntegerField;
    CdConBancosDESCRIPCION: TStringField;
    CdConBancosCODIGO: TStringField;
    CdConBancosSALDO: TCurrencyField;
    CdConBancosNOMBRE: TStringField;
    frReport1: TfrReport;
    frDBDataSet4: TfrDBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure RcajasClick(Sender: TObject);
    procedure RbancosClick(Sender: TObject);
    procedure frReport1BeginPage(pgNo: Integer);
  private
    XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo,nodo1 :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;
    id_agencia :Integer;
    vAgencia :string;
    empleado1: string;
    vMensaje :string;
    vComunicacion :Boolean;
    procedure SaldoLocal;
    procedure SaldoRemoto(puerto: integer; host_r: string);
    procedure insertar(id_agencia, caja: integer; saldo: currency; vAgencia,
      empleado: string);
    procedure SaldosBancos;
    procedure imprimir(cadena: string);
    procedure SaldoAgencia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSaldosCaja: TFrmSaldosCaja;

implementation
uses UnitGlobales, UnitPantallaProgreso, UnitImpresion, unitMain;
{$R *.dfm}

procedure TFrmSaldosCaja.FormCreate(Sender: TObject);
begin
        if IBagencia.Transaction.InTransaction then
           IBagencia.Transaction.Rollback;
        IBagencia.Transaction.StartTransaction;
        IBagencia.Close;
        IBagencia.Open;
        IBagencia.Last;
        DBagencia.KeyValue := Agencia;
        DtFecha.Date := fFechaActual ;
        if Agencia <> 1 then
        begin
           DBagencia.Enabled := False;
           Rbancos.Enabled := False;
           CBtotal.Enabled := False;
        end;
        vAgencia := DBagencia.Text;
end;

procedure TFrmSaldosCaja.BitBtn1Click(Sender: TObject);
begin
        vMensaje := '';
        vComunicacion := False;
        CdCheques.CancelUpdates;
        CDsaldos.CancelUpdates;
        CDbancos.CancelUpdates;
        CdConBancos.CancelUpdates;
        if Agencia <> 1 then
           SaldoAgencia
        else
        if CBtotal.Checked = False then
        begin
          if DBagencia.KeyValue = 1 then
          begin
            if Rcajas.Checked then
               saldolocal
            else
               saldosbancos;
          end
          else if DBagencia.KeyValue = 2 then
          begin
            vAgencia := 'ABREGO';
            id_agencia := 2;
            saldoremoto(BuscaServicio(2,1).vPuerto,BuscaServicio(2,1).vhost);
          end
          else if DBagencia.KeyValue = 3 then
          begin
            vAgencia := 'CONVENCION';
            id_agencia := 3;
            saldoremoto(BuscaServicio(3,1).vPuerto,BuscaServicio(3,1).vhost);
          end
          else if DBagencia.KeyValue = 4 then
          begin
            vAgencia := 'AGUACHICA';
            id_agencia := 4;
            saldoremoto(BuscaServicio(4,1).vPuerto,BuscaServicio(4,1).vhost);
          end;

        end
        else
        begin
          if Rcajas.Checked then
            saldolocal
          else
            saldosbancos;
          vAgencia := 'ABREGO';
          id_agencia := 2;
          saldoremoto(BuscaServicio(2,1).vPuerto,BuscaServicio(2,1).vhost);
          vAgencia := 'CONVENCION';
          id_agencia := 3;
          saldoremoto(BuscaServicio(3,1).vPuerto,BuscaServicio(3,1).vhost);
          vAgencia := 'AGUACHICA';
          id_agencia := 4;
          saldoremoto(BuscaServicio(4,1).vPuerto,BuscaServicio(4,1).vhost);

        end;
        //frReport1.ShowReport;
        if vComunicacion then
          MessageDlg('No se Logro Comunicación Con ' + vMensaje,mtWarning,[mbok],0);
        empleado;
        empleado1 := Nombres + ' ' + Apellidos;
        if Rcajas.Checked then
           imprimir(frmmain.ruta1 + '\Reporte\RepSaldos.frf')
        else
           imprimir(frmmain.ruta1 + '\Reporte\RepBancos.frf')
end;

procedure TFrmSaldosCaja.SaldoLocal;
begin
        with IBsaldos do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          ParamByName('FECHAINICIAL').AsString := DateToStr(fFechaActual) + ' 00:00:00 ';
          ParamByName('FECHAFINAL').AsString := DateToStr(fFechaActual) + ' 23:59:59';
          ParamByName('FECHA').AsDate := fFechaActual;
          Open;
          while not Eof do
          begin
            if FieldByName('SALDOCAJA').AsCurrency <> 0 then
               insertar(1,FieldByName('ID_CAJA').AsInteger,FieldByName('SALDOCAJA').AsCurrency,Ciudad,FieldByName('EMPLEADO').AsString);
            Next;
          end;
        end;

       with IBQuery1 do
       begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT sum(VALOR) as VALOR, count(VALOR) as NUMERO FROM "tes$cheques" WHERE (LIBERADO = 0) AND  (DEVUELTO = 0) AND  (CONSIGNADO = 0)');
          Open;
          with CdCheques do
          begin
            Append;
            FieldValues['id_agencia'] := 1;
            FieldValues['agencia'] := 'OCAÑA';
            FieldValues['valor'] := IBQuery1.FieldByName('VALOR').AsCurrency;
            FieldValues['numero'] := IBQuery1.FieldByName('NUMERO').AsInteger;
            Post;
          end;

        end;
end;

procedure TFrmSaldosCaja.SaldoRemoto(puerto: integer; host_r: string);
var     sentencia,sentencia1,sentencia2 :string;
        AList,AListCampos:TList;
        cadena :string;
        i :Integer;
begin

         if Rcajas.Checked then
         begin
           sentencia1 := 'SELECT sum(VALOR), count(VALOR) FROM "tes$cheques" WHERE (LIBERADO = 0) AND  (DEVUELTO = 0) AND  (CONSIGNADO = 0)';
           sentencia := 'select * from P_SALDO_REMOTO_1(' +  '''' + DateToStr(fFechaActual) + ' 00:00:00' + '''' + ',' + '''' + DateToStr(fFechaActual) + ' 23:59:59' + '''' + ',' + '''' + DateToStr(fFechaActual) + '''' + ')';
         end
         else
//           sentencia := 'SELECT * FROM MOV_BANCOS(' + '''' + DateToStr(dtfecha.Date) + '''' + ',' + IntToStr(id_Agencia)+ ')';
            sentencia := 'SELECT * FROM MOV_BANCOS_CON(' + '''' + DateToStr(dtfecha.Date) + '''' + ',' + IntToStr(id_Agencia)+ ')';

         XmlPetc := TsdXmlDocument.CreateName('query_info');
         XmlPetc.XmlFormat := xfReadable;
         Nodo := XmlPetc.Root.NodeNew('querys');
         Nodo1 := Nodo.NodeNew('query');
         Nodo1.WriteString('tipo','select');
         nodo1.WriteString('sentencia',sentencia);
         if Rcajas.Checked then
         begin
           Nodo1 := Nodo.NodeNew('query');
           Nodo1.WriteString('tipo','select');
           nodo1.WriteString('sentencia',sentencia1);
         end;
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
                vMensaje := vAgencia + ',' + vMensaje;
                Disconnect;
                Exit;
             end;
           end;
           if Connected then
           begin
              try
                frmProgreso := TfrmProgreso.Create(self);
                frmProgreso.Ejecutar;
                frmProgreso.Titulo := 'Recibiendo Informacion de ' + vAgencia;// + Desc_Agencia;
                frmProgreso.InfoLabel := 'Espere un Momento por Favor ...';
                frmProgreso.Min := 0;
                frmProgreso.Position := 50;
                Application.ProcessMessages;
                //Cadena := ReadLn();
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
              except
                Application.ProcessMessages;
                vMensaje := vAgencia + ',' + vMensaje;
                vComunicacion := True;
                Disconnect;
                frmProgreso.Cerrar;
                Exit;
              end;
           end;
           end;
           XmlresC.SaveToFile('c:\archivo.xml');
           if Rcajas.Checked then
           begin
             AList := TList.Create;
             Nodo := XmlResc.Root.NodeByName('consulta000');
             Nodo.NodesByName('Registro',AList);
             for i := 0 to AList.Count -1 do
             begin
              AListCampos := TList.Create;
              TXmlNode(AList[i]).NodesByName('campo',AListCampos);
              if TXmlNode(AListCampos[0]).ValueAsFloat <> 0 then
                insertar(id_agencia,TXmlNode(AListCampos[2]).ValueAsInteger,TXmlNode(AListCampos[0]).ValueAsFloat,vAgencia,TXmlNode(AListCampos[1]).ValueAsString);
             end;
             //cheques
             AList := TList.Create;
             nodo := XmlresC.Root.NodeByName('consulta001');
             nodo.NodesByName('Registro',AList);
             AListCampos := TList.Create;
             TXmlNode(AList[0]).NodesByName('campo',AListCampos);
             with CdCheques do
             begin
               try
                 Append;
                 FieldValues['id_agencia'] := id_agencia;
                 FieldValues['agencia'] := Agencia;
                 FieldValues['valor'] := TXmlNode(AListCampos[0]).ValueAsFloat;
                 FieldValues['numero'] := TXmlNode(AListCampos[1]).ValueAsInteger;
                 Post;
               except
                 Cancel;
               end;
             end;
           end
           else
           begin
           //bancos
             AList := TList.Create;
             Nodo := XmlResc.Root.NodeByName('consulta000');
             Nodo.NodesByName('Registro',AList);
             for i := 0 to AList.Count -1 do
             begin
                AListCampos := TList.Create;
                TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                //insertar(id_agencia,TXmlNode(AListCampos[2]).ValueAsInteger,TXmlNode(AListCampos[0]).ValueAsFloat,vAgencia,TXmlNode(AListCampos[1]).ValueAsString);
                {CDbancos.Append;
                CDbancos.FieldValues['CODIGO'] := TXmlNode(AListCampos[0]).ValueAsString;
                CDbancos.FieldValues['NOMBRECOD'] := TXmlNode(AListCampos[1]).ValueAsString;
                CDbancos.FieldValues['SALDOINICIAL'] := TXmlNode(AListCampos[2]).ValueAsFloat;
                CDbancos.FieldValues['ID_COMPROBANTE'] := TXmlNode(AListCampos[3]).ValueAsInteger;
                CDbancos.FieldValues['DEBITO'] := TXmlNode(AListCampos[4]).ValueAsFloat;
                CDbancos.FieldValues['CREDITO'] := TXmlNode(AListCampos[5]).ValueAsFloat;
                CDbancos.FieldValues['ID_PERSONA'] := TXmlNode(AListCampos[6]).ValueAsString;
                CDbancos.FieldValues['DESCRIPCION'] := TXmlNode(AListCampos[7]).BinaryString;
                CDbancos.FieldValues['agencia'] := TXmlNode(AListCampos[8]).ValueAsString;
                CDbancos.FieldValues['NOMBRE'] := TXmlNode(AListCampos[9]).ValueAsString;
                CDbancos.FieldValues['PRIMER_APELLIDO'] := TXmlNode(AListCampos[10]).ValueAsString;
                CDbancos.FieldValues['SEGUNDO_APELLIDO'] := TXmlNode(AListCampos[11]).ValueAsString;
                CDbancos.FieldValues['SALDOAUXILIAR'] := TXmlNode(AListCampos[12]).ValueAsFloat;
                CDbancos.FieldValues['ID_AGENCIA'] := id_agencia;
                CDbancos.Post;}
                CdConBancos.Append;
                CdConBancos.FieldValues['ID_AGENCIA'] := id_agencia;
                CdConBancos.FieldValues['DESCRIPCION'] := vAgencia;
                CdConBancos.FieldValues['CODIGO'] := TXmlNode(AListCampos[0]).ValueAsString;
                CdConBancos.FieldValues['SALDO'] := TXmlNode(AListCampos[2]).ValueAsFloat;
                CdConBancos.FieldValues['NOMBRE'] := TXmlNode(AListCampos[1]).ValueAsString;
                CdConBancos.Post;
             end;
           end;
end;

procedure TFrmSaldosCaja.insertar(id_agencia, caja: integer;
  saldo: currency; vAgencia, empleado: string);
begin
        with CDsaldos do
        begin
          Append;
          FieldValues['id_agencia'] := id_agencia;
          FieldValues['caja'] := caja;
          FieldValues['saldo'] := saldo;
          FieldValues['agencia'] := vAgencia;
          FieldValues['empleado'] := empleado;
          Post;
        end;
end;

procedure TFrmSaldosCaja.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'empresa' then
           ParValue := Empresa;
        if ParName = 'nit' then
           parvalue := Nit;
        if parname = 'fechacorte' then
           ParValue := DtFecha.Date;
        if ParName = 'empleado' then
           ParValue := empleado1;
end;

procedure TFrmSaldosCaja.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Espere un Momento por Favor ...';// + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := 100;
          Application.ProcessMessages;

end;

procedure TFrmSaldosCaja.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          {frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;}

end;

procedure TFrmSaldosCaja.SaldosBancos;
begin
        with IBQuery1 do
        begin
          {Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT * FROM MOV_BANCOS(:FECHA,:ID_AGENCIA)');
          ParamByName('FECHA').AsDate := DtFecha.Date;
          ParamByName('ID_AGENCIA').AsInteger := 1;
          Open;
          Last;
          First;
          //ShowMessage(IntToStr(RecordCount));
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Titulo := 'Saldos en Bancos';
          frmProgreso.Max := RecordCount;
          frmProgreso.Min := 0;
          frmProgreso.Ejecutar;
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            frmProgreso.InfoLabel := 'Registro No: ' + IntToStr(RecNo);
            Application.ProcessMessages;
            CDbancos.Append;
            CDbancos.FieldValues['CODIGO'] := FieldByName('CODIGO').AsString;
            CDbancos.FieldValues['NOMBRECOD'] := FieldByName('NOMBRECOD').AsString;
            CDbancos.FieldValues['SALDOINICIAL'] := FieldByName('SALDOINICIAL').AsCurrency;
            CDbancos.FieldValues['ID_COMPROBANTE'] := FieldByName('ID_COMPROBANTE').AsInteger;
            CDbancos.FieldValues['DEBITO'] := FieldByName('DEBITO').AsCurrency;
            CDbancos.FieldValues['CREDITO'] := FieldByName('CREDITO').AsCurrency;
            CDbancos.FieldValues['ID_PERSONA'] := FieldByName('ID_PERSONA').AsString;
            CDbancos.FieldValues['DESCRIPCION'] := FieldByName('DESCRIPCION').AsString;
            CDbancos.FieldValues['agencia'] := FieldByName('AGENCIA').AsString;
            CDbancos.FieldValues['NOMBRE'] := FieldByName('NOMBRE').AsString;
            CDbancos.FieldValues['PRIMER_APELLIDO'] := FieldByName('PRIMER_APELLIDO').AsString;
            CDbancos.FieldValues['SEGUNDO_APELLIDO'] := FieldByName('SEGUNDO_APELLIDO').AsString;
            CDbancos.FieldValues['SALDOAUXILIAR'] := FieldByName('SALDOAUXILIAR').AsCurrency;
            CDbancos.FieldValues['ID_AGENCIA'] := 1;
            CDbancos.Post;
            Next;
          end;}
          SQL.Clear;
          SQL.Add('select * from MOV_BANCOS_CON(:FECHA,:ID_AGENCIA)');
          ParamByName('FECHA').AsDate := DtFecha.Date;
          ParamByName('ID_AGENCIA').AsInteger := 1;
          Open;
          while not Eof do
          begin
            CdConBancos.Append;
            CdConBancos.FieldValues['ID_AGENCIA'] := 1;
            CdConBancos.FieldValues['DESCRIPCION'] := Ciudad;
            CdConBancos.FieldValues['CODIGO'] := FieldByName('CODIGO').AsString;
            CdConBancos.FieldValues['SALDO'] := FieldByName('SALDOINICIAL').AsCurrency;
            CdConBancos.FieldValues['NOMBRE'] := FieldByName('NOMBRECOD').AsString;
            CdConBancos.Post;
            Next;
          end;
          //frmProgreso.Cerrar;
        end;

end;

procedure TFrmSaldosCaja.imprimir(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.ModifyPrepared := False;
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal

end;

procedure TFrmSaldosCaja.RcajasClick(Sender: TObject);
begin
        if Rcajas.Checked then
        begin
           Panel3.Visible := False;
           Panel2.Top := 82;
           FrmSaldosCaja.Height := 148;
           FrmSaldosCaja.Width := 238;
           DtFecha.Date := fFechaActual;
        end;
end;

procedure TFrmSaldosCaja.RbancosClick(Sender: TObject);
begin
        if Rbancos.Checked then
        begin
           Panel3.Visible := True;
           Panel2.Top := 123;
           FrmSaldosCaja.Height := 190;
           FrmSaldosCaja.Width := 239;
        end;

end;


procedure TFrmSaldosCaja.SaldoAgencia;
begin
        with IBsaldos do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          ParamByName('FECHAINICIAL').AsString := DateToStr(fFechaActual) + ' 00:00:00 ';
          ParamByName('FECHAFINAL').AsString := DateToStr(fFechaActual) + ' 23:59:59';
          ParamByName('FECHA').AsDate := fFechaActual;
          Open;
          while not Eof do
          begin
            if FieldByName('SALDOCAJA').AsCurrency <> 0 then
               insertar(Agencia,FieldByName('ID_CAJA').AsInteger,FieldByName('SALDOCAJA').AsCurrency,vAgencia,FieldByName('EMPLEADO').AsString);
            Next;
          end;
        end;

       with IBQuery1 do
       begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT sum(VALOR) as VALOR, count(VALOR) as NUMERO FROM "tes$cheques" WHERE (LIBERADO = 0) AND  (DEVUELTO = 0) AND  (CONSIGNADO = 0)');
          Open;
          with CdCheques do
          begin
            Append;
            FieldValues['id_agencia'] := 1;
            FieldValues['agencia'] := Ciudad;
            FieldValues['valor'] := IBQuery1.FieldByName('VALOR').AsCurrency;
            FieldValues['numero'] := IBQuery1.FieldByName('NUMERO').AsInteger;
            Post;
          end;

        end;

end;

procedure TFrmSaldosCaja.frReport1BeginPage(pgNo: Integer);
begin
        if Agencia <> 1 then
        begin
          frReport1.FindObject('Memo14').Visible := False;
          frReport1.FindObject('SubReport1').Visible := False;
        end;
end;

end.
