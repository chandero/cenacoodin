unit UnitVencimientoCdat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, JvEdit, JvLabel, DBCtrls, Buttons,
  DB, IBCustomDataSet, IBQuery, IBDatabase, DBClient, FR_Class, FR_DSet,
  FR_DBSet, sdXmlDocuments, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, JvTypedEdit;

type
  TFrmVencimientoCdat = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    fecha1: TDateTimePicker;
    Label2: TLabel;
    jvNumero: TJvEdit;
    JvLabel1: TJvLabel;
    fecha2: TDateTimePicker;
    Label3: TLabel;
    dbAgencia: TDBLookupComboBox;
    chToda: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DSagencia: TDataSource;
    IBagencia: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBQuery2: TIBQuery;
    cdCdat: TClientDataSet;
    cdCdatVALOR_INICIAL: TCurrencyField;
    cdCdatFECHA_APERTURA: TDateField;
    cdCdatFECHA_VENCIMIENTO: TDateField;
    cdCdatID_IDENTIFICACION: TIntegerField;
    cdCdatID_PERSONA: TStringField;
    cdCdatNOMBRES: TStringField;
    cdCdatCUENTA: TStringField;
    cdCdatID_ESTADO: TSmallintField;
    cdCdatESTADO: TStringField;
    IBQuery3: TIBQuery;
    frReport1: TfrReport;
    cdCdatID_AGENCIA: TIntegerField;
    cdCdatAGENCIA: TStringField;
    frDBDataSet1: TfrDBDataSet;
    IdTCPClient1: TIdTCPClient;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    V1: TJvCurrencyEdit;
    V2: TJvCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure jvNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure jvNumeroEnter(Sender: TObject);
    procedure chTodaKeyPress(Sender: TObject; var Key: Char);
    procedure dbAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure jvNumeroExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure fecha1KeyPress(Sender: TObject; var Key: Char);
    procedure V1KeyPress(Sender: TObject; var Key: Char);
    procedure V2KeyPress(Sender: TObject; var Key: Char);
    procedure V2Enter(Sender: TObject);
    procedure V1Enter(Sender: TObject);
  private
    XmlPetC :TsdXmlDocument;
    XmlresC :TsdXmlDocument;
    nodo,nodo1 :TXmlNode;
    Valida_Tcp :Boolean;
    Astream :TMemoryStream;
    tamano :Integer;
    id_agencia :Integer;
    vIni,vFin :Currency;

    procedure Local;
    procedure Imprimir(cadena: string);
    procedure remoto(vPuerto,vIdAgencia: integer; vHost,vAgencia: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVencimientoCdat: TFrmVencimientoCdat;

implementation
uses UnitGlobales, UnitImpresion, unitMain, UnitPantallaProgreso;

{$R *.dfm}

procedure TFrmVencimientoCdat.FormCreate(Sender: TObject);
begin
        with IBagencia do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          Open;
          Last;
        end;
        fecha1.Date := fFechaActual;
        fecha2.Date := fFechaActual;
        dbAgencia.KeyValue := Agencia;
        if Agencia <> 1 then
           chToda.Enabled := False;
end;

procedure TFrmVencimientoCdat.jvNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Self,Key);
        EnterTabs(Key,Self);
end;

procedure TFrmVencimientoCdat.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmVencimientoCdat.BitBtn2Click(Sender: TObject);
begin
      chToda.Checked := False;
      jvNumero.Text := '0';
      jvNumero.SetFocus;
end;

procedure TFrmVencimientoCdat.jvNumeroEnter(Sender: TObject);
begin
        jvNumero.SelectAll
end;

procedure TFrmVencimientoCdat.chTodaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmVencimientoCdat.dbAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmVencimientoCdat.jvNumeroExit(Sender: TObject);
begin
        fecha2.Date := fecha1.Date + StrToInt(jvNumero.Text);
end;

procedure TFrmVencimientoCdat.BitBtn1Click(Sender: TObject);
begin
        if (V1.Value = 0) and (V2.Value = 0) then
        begin
           vIni := 0; vFin := 9999999999;
        end
        else
        begin
           vIni := V1.Value;  vFin := V2.Value;
        end;
        cdCdat.CancelUpdates;
        if Agencia <> 1 then
           local
        else
        if chToda.Checked then
        begin
          local;
          with IBQuery3 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT ');
            SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
            SQL.Add('"gen$servidor".ID_HOST,');
            SQL.Add('"gen$servidor".ID_PUERTO,');
            SQL.Add('"gen$servidor".ID_AGENCIA');
            SQL.Add('FROM');
            SQL.Add('"gen$agencia"');
            SQL.Add('INNER JOIN "gen$servidor" ON ("gen$agencia".ID_AGENCIA="gen$servidor".ID_AGENCIA)');
            SQL.Add('WHERE');
            SQL.Add('("gen$servidor".ID_AGENCIA <> 1) AND ');
            SQL.Add('("gen$servidor".ID_SERVICIO = 1)');
            Open;
            while not Eof do
            begin
              try
                remoto(FieldByName('ID_PUERTO').AsInteger,FieldByName('ID_AGENCIA').AsInteger,FieldByName('ID_HOST').AsString,FieldByName('DESCRIPCION_AGENCIA').AsString);
              except
                Next;
              end;
              Next;
            end;

          end;
        end
        else
        begin
          if dbAgencia.KeyValue = 1 then
             local
          else
            remoto(buscaservicio(dbAgencia.KeyValue,1).vPuerto,dbAgencia.KeyValue,buscaservicio(dbAgencia.KeyValue,1).vHost,dbAgencia.Text);
        end;
        imprimir(frmMain.wpath + '\Reporte\RepCdat.frf');
end;

procedure TFrmVencimientoCdat.Local;
var     vAgencia :string;
begin

        with IBQuery3 do
        begin
          if IBQuery3.Transaction.InTransaction then
             IBQuery3.Transaction.Commit;
          IBQuery3.Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select DESCRIPCION_AGENCIA from "gen$agencia" where ID_AGENCIA = :ID');
          ParamByName('ID').AsInteger := Agencia;
          Open;
          vAgencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
          SQL.Clear;
          SQL.Add('select * from BUSCARCDAT(:AGENCIA,:ID_ESTADO,:FECHA1,:FECHA2)');
          ParamByName('AGENCIA').AsInteger := Agencia;
          ParamByName('ID_ESTADO').AsInteger := 1;
          ParamByName('FECHA1').AsDate := fecha1.Date;
          ParamByName('FECHA2').AsDate := fecha2.Date;
          Open;
          while not Eof do
          begin
            if (FieldByName('VALOR_INICIAL').AsCurrency >= vIni) and (FieldByName('VALOR_INICIAL').AsCurrency <= vFin) then
            begin
              cdCdat.Append;
              cdCdat.FieldValues['CUENTA'] := '60' + IntToStr(Agencia) + '-' + FormatCurr('000000',FieldByName('NUMERO_CUENTA').AsInteger);
              cdCdat.FieldValues['VALOR_INICIAL'] := FieldByName('VALOR_INICIAL').AsCurrency;
              cdCdat.FieldValues['FECHA_APERTURA'] := FieldByName('FECHA_APERTURA').AsDateTime;
              cdCdat.FieldValues['FECHA_VENCIMIENTO'] := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
              cdCdat.FieldValues['ID_IDENTIFICACION'] := FieldByName('ID_IDENTIFICACION').AsInteger;
              cdCdat.FieldValues['ID_PERSONA'] := FieldByName('ID_PERSONA').AsString;
              cdCdat.FieldValues['NOMBRES'] := FieldByName('NOMBRES').AsString;
              cdCdat.FieldValues['ID_ESTADO'] := 1;
              cdCdat.FieldValues['ESTADO'] := 'ACTIVO';
              cdCdat.FieldValues['AGENCIA'] := vAgencia;
              cdCdat.FieldValues['ID_AGENCIA'] := Agencia;
              cdCdat.Post;
            end;
            Next;
          end;
          Close;
          ParamByName('AGENCIA').AsInteger := Agencia;
          ParamByName('ID_ESTADO').AsInteger := 2;
          ParamByName('FECHA1').AsDate := fecha1.Date;
          ParamByName('FECHA2').AsDate := fecha2.Date;
          Open;
          while not Eof do
          begin
            if (FieldByName('VALOR_INICIAL').AsCurrency >= vIni) and (FieldByName('VALOR_INICIAL').AsCurrency <= vFin) then
            begin
              cdCdat.Append;
              cdCdat.FieldValues['CUENTA'] := '60' + IntToStr(Agencia) + '-' + FormatCurr('000000',FieldByName('NUMERO_CUENTA').AsInteger);
              cdCdat.FieldValues['VALOR_INICIAL'] := FieldByName('VALOR_INICIAL').AsCurrency;
              cdCdat.FieldValues['FECHA_APERTURA'] := FieldByName('FECHA_APERTURA').AsDateTime;
              cdCdat.FieldValues['FECHA_VENCIMIENTO'] := FieldByName('FECHA_VENCIMIENTO').AsDateTime;
              cdCdat.FieldValues['ID_IDENTIFICACION'] := FieldByName('ID_IDENTIFICACION').AsInteger;
              cdCdat.FieldValues['ID_PERSONA'] := FieldByName('ID_PERSONA').AsString;
              cdCdat.FieldValues['NOMBRES'] := FieldByName('NOMBRES').AsString;
              cdCdat.FieldValues['ID_ESTADO'] := 2;
              cdCdat.FieldValues['ESTADO'] := 'PRORROGADO';
              cdCdat.FieldValues['AGENCIA'] := vAgencia;
              cdCdat.FieldValues['ID_AGENCIA'] := Agencia;
              cdCdat.Post;
            end;
            Next;
          end;

        end;

end;

procedure TFrmVencimientoCdat.Imprimir(cadena: string);
begin
        FrmImpresion := TFrmImpresion.Create(self);
        frReport1.LoadFromFile(cadena);
        frReport1.ModifyPrepared := False;
        frReport1.Preview := FrmImpresion.frPreview1;
        frReport1.ShowReport;
        FrmImpresion.ShowModal
end;

procedure TFrmVencimientoCdat.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName = 'dias' then
           ParValue := jvNumero.Text;
end;

procedure TFrmVencimientoCdat.remoto(vPuerto,vIdAgencia: integer; vHost,vAgencia: string);
var     sentencia,cadena :string;
        AList,AListCampos:TList;
        i :Integer;

begin
         XmlPetc := TsdXmlDocument.CreateName('query_info');
         XmlPetc.XmlFormat := xfReadable;
         Nodo := XmlPetc.Root.NodeNew('querys');
         Nodo1 := Nodo.NodeNew('query');
         Nodo1.WriteString('tipo','select');
         sentencia := 'select * from BUSCARCDAT(' + IntToStr(vIdAgencia) + ',1,' + '''' + DateToStr(fecha1.Date) + '''' + ',' + '''' + DateToStr(fecha2.Date) + '''' + ')';
         nodo1.WriteString('sentencia',sentencia);
         Nodo1 := Nodo.NodeNew('query');
         Nodo1.WriteString('tipo','select');
         sentencia := 'select * from BUSCARCDAT(' + IntToStr(vIdAgencia) + ',2,' + '''' + DateToStr(fecha1.Date) + '''' + ',' + '''' + DateToStr(fecha2.Date) + '''' + ')';
         nodo1.WriteString('sentencia',sentencia);
         XmlresC := TsdXmlDocument.Create;
         XmlresC.EncodingString := 'ISO8859-1';
         XmlresC.XmlFormat := xfReadable;
         Astream := TMemoryStream.Create;
         XmlPetC.SaveToStream(Astream);
           with IdTCPClient1 do
           begin
             Port := vPuerto;;
             Host := vHost;;
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
                frmProgreso.Titulo := 'Recibiendo Informacion de ' + vAgencia;
                frmProgreso.InfoLabel := 'Espere un Momento por Favor ...';
                frmProgreso.Min := 0;
                frmProgreso.Position := 50;
                Application.ProcessMessages;
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
             AList := TList.Create;
             Nodo := XmlResc.Root.NodeByName('consulta000');
             Nodo.NodesByName('Registro',AList);
             for i := 0 to AList.Count -1 do
             begin
                AListCampos := TList.Create;
                TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                if (TXmlNode(AListCampos[2]).ValueAsFloat >= vIni) and (TXmlNode(AListCampos[2]).ValueAsFloat <= vFin) then
                begin
                  cdCdat.Append;
                  cdCdat.FieldValues['CUENTA'] := '60' + IntToStr(vIdAgencia) + '-' + FormatCurr('000000',TXmlNode(AListCampos[0]).ValueAsInteger);
                  cdCdat.FieldValues['VALOR_INICIAL'] := TXmlNode(AListCampos[2]).ValueAsFloat;
                  cdCdat.FieldValues['FECHA_APERTURA'] := TXmlNode(AListCampos[3]).ValueAsDateTime;
                  cdCdat.FieldValues['FECHA_VENCIMIENTO'] := TXmlNode(AListCampos[4]).ValueAsDateTime;
                  cdCdat.FieldValues['ID_IDENTIFICACION'] := TXmlNode(AListCampos[5]).ValueAsInteger;
                  cdCdat.FieldValues['ID_PERSONA'] := TXmlNode(AListCampos[6]).ValueAsString;
                  cdCdat.FieldValues['NOMBRES'] := TXmlNode(AListCampos[7]).ValueAsString;
                  cdCdat.FieldValues['ID_ESTADO'] := 1;
                  cdCdat.FieldValues['ESTADO'] := 'ACTIVO';
                  cdCdat.FieldValues['AGENCIA'] := vAgencia;
                  cdCdat.FieldValues['ID_AGENCIA'] := vIdAgencia;
                  cdCdat.Post;
               end;
             end;
             AList := TList.Create;
             Nodo := XmlResc.Root.NodeByName('consulta001');
             Nodo.NodesByName('Registro',AList);
             for i := 0 to AList.Count -1 do
             begin
                AListCampos := TList.Create;
                TXmlNode(AList[i]).NodesByName('campo',AListCampos);
                if (TXmlNode(AListCampos[2]).ValueAsFloat >= vIni) and (TXmlNode(AListCampos[2]).ValueAsFloat <= vFin) then
                begin
                  cdCdat.Append;
                  cdCdat.FieldValues['CUENTA'] := '60' + IntToStr(vIdAgencia) + '-' + FormatCurr('000000',TXmlNode(AListCampos[0]).ValueAsInteger);
                  cdCdat.FieldValues['VALOR_INICIAL'] := TXmlNode(AListCampos[2]).ValueAsFloat;
                  cdCdat.FieldValues['FECHA_APERTURA'] := TXmlNode(AListCampos[3]).ValueAsDateTime;
                  cdCdat.FieldValues['FECHA_VENCIMIENTO'] := TXmlNode(AListCampos[4]).ValueAsDateTime;
                  cdCdat.FieldValues['ID_IDENTIFICACION'] := TXmlNode(AListCampos[5]).ValueAsInteger;
                  cdCdat.FieldValues['ID_PERSONA'] := TXmlNode(AListCampos[6]).ValueAsString;
                  cdCdat.FieldValues['NOMBRES'] := TXmlNode(AListCampos[7]).ValueAsString;
                  cdCdat.FieldValues['ID_ESTADO'] := 2;
                  cdCdat.FieldValues['ESTADO'] := 'PRORROGADO';
                  cdCdat.FieldValues['AGENCIA'] := vAgencia;
                  cdCdat.FieldValues['ID_AGENCIA'] := vIdAgencia;
                  cdCdat.Post;
                end;
             end;

end;

procedure TFrmVencimientoCdat.fecha1KeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmVencimientoCdat.V1KeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmVencimientoCdat.V2KeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmVencimientoCdat.V2Enter(Sender: TObject);
begin
        V2.SelectAll
end;

procedure TFrmVencimientoCdat.V1Enter(Sender: TObject);
begin
        V2.SelectAll
end;

end.
