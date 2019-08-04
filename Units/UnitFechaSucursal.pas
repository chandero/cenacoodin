unit UnitFechaSucursal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, IBCustomDataSet, IBQuery, IBDatabase,sdXmlDocuments,
  DBCtrls, Mask, Buttons,StrUtils, DBClient, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient;

type
  TFrmFechaSucursal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    IBTransaction1: TIBTransaction;
    DsAgencia: TDataSource;
    IBAgencia: TIBQuery;
    dBAgencia: TDBLookupComboBox;
    ChTodas: TCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    CbDia: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    mActual: TMaskEdit;
    mNueva: TMaskEdit;
    Panel3: TPanel;
    bAceptar: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CdHora: TClientDataSet;
    CdHoraID_HORARIO: TIntegerField;
    CdHoraHORARIO: TTimeField;
    IBQuery1: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mNuevaExit(Sender: TObject);
    procedure ChTodasClick(Sender: TObject);
    procedure dBAgenciaExit(Sender: TObject);
    procedure ChTodasKeyPress(Sender: TObject; var Key: Char);
    procedure CbDiaExit(Sender: TObject);
    procedure bAceptarClick(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
    procedure local;
    procedure remoto(vHost: string; vPuerto: integer);
    procedure alocal;
    procedure aremoto(vHost: string; vPuerto: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFechaSucursal: TFrmFechaSucursal;

implementation

uses UnitGlobales, UnitPantallaProgreso, UnitdmGeneral;

{$R *.dfm}

procedure TFrmFechaSucursal.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmFechaSucursal.BitBtn2Click(Sender: TObject);
begin
        Panel1.Enabled := True;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        mActual.Text := '00:00';
        mNueva.Text := '00:00';
        CbDia.ItemIndex := 0;
        ChTodas.Checked := False;
        CdHora.CancelUpdates;
        bAceptar.Enabled := False;
end;

procedure TFrmFechaSucursal.FormCreate(Sender: TObject);
begin
        if IBTransaction1.InTransaction then
           IBTransaction1.Commit;
        IBTransaction1.StartTransaction;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        IBAgencia.Close;
        IBAgencia.Open;
        IBAgencia.Last;
        dBAgencia.KeyValue := 1;

end;

procedure TFrmFechaSucursal.mNuevaExit(Sender: TObject);
var     A,B :string;
        C :Integer;
begin
        A := LeftStr(mNueva.Text,2);
        B := RightStr(mNueva.Text,2);
        C := StrToInt(A);
        if C > 23 then
        begin
          ShowMessage('Horario Incorrecto Favor verifique...');
          mNueva.SetFocus;
        end;
        C := StrToInt(B);
        if C > 59 then
        begin
          ShowMessage('Horario Incorrecto Incorrecta Favor verifique...');
          mNueva.SetFocus;
        end;

end;

procedure TFrmFechaSucursal.ChTodasClick(Sender: TObject);
begin
        CdHora.CancelUpdates;
        if ChTodas.Checked then
           dBAgencia.Enabled := False
        else
           dBAgencia.Enabled := True;
end;

procedure TFrmFechaSucursal.local;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "caj$horariosucursal"');
          Open;
          while not Eof do
          begin
            CdHora.Append;
            CdHora.FieldValues['ID_HORARIO'] := FieldByName('ID_HORARIO').AsInteger;
            CdHora.FieldValues['HORARIO'] := FieldByName('HORA').AsDateTime;
            CdHora.Post;
            Next;
          end;
        end;
end;

procedure TFrmFechaSucursal.dBAgenciaExit(Sender: TObject);
begin
        if dBAgencia.KeyValue = 1 then
          local
        else
           remoto(BuscaServicio(dBAgencia.KeyValue,1).vHost, BuscaServicio(dBAgencia.KeyValue,1).vPuerto);
         Panel1.Enabled := False;

end;

procedure TFrmFechaSucursal.ChTodasKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmFechaSucursal.CbDiaExit(Sender: TObject);
begin
        bAceptar.Enabled := True;
        if ChTodas.Checked then
           local;
        with CdHora do
        begin
          Filtered := False;
          Filter := 'ID_HORARIO = ' + IntToStr(CbDia.ItemIndex + 1);
          Filtered := True;
          mActual.Text := FormatDateTime('HH:MM',FieldByName('HORARIO').AsDateTime);
          Filtered := False;
         end;
end;

procedure TFrmFechaSucursal.bAceptarClick(Sender: TObject);
begin
        if MessageDlg('Esta Seguro de Realizar la Transacción',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        if ChTodas.Checked then
        begin
          alocal;
          with IBQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select ID_AGENCIA from "gen$agencia" where ID_AGENCIA <> 1');
            Open;
            while not Eof do
            begin
              aremoto(BuscaServicio(dBAgencia.KeyValue,1).vHost, BuscaServicio(dBAgencia.KeyValue,1).vPuerto);
              Next;
            end;
          end;
        end
        else
        begin
          if dBAgencia.KeyValue = 1 then
            alocal
          else
            aremoto(BuscaServicio(dBAgencia.KeyValue,1).vHost, BuscaServicio(dBAgencia.KeyValue,1).vPuerto);
        end;
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "per$control" values (:ID_AGENCIA,:ID_EMPLEADO_RES,:FECHA,:ID_EMPLEADO,');
          SQL.Add(':ANTES,:DESPUES,5,:MODULO)');
          ParamByName('ID_AGENCIA').AsInteger := dBAgencia.KeyValue;
          ParamByName('ID_EMPLEADO_RES').AsString := DBAlias;
          ParamByName('FECHA').AsDateTime := fFechaActual + Time;
          ParamByName('ID_EMPLEADO').Clear;
          ParamByName('ANTES').AsString :=mActual.Text;
          ParamByName('DESPUES').AsString := mNueva.Text;
          ParamByName('MODULO').AsInteger := CbDia.ItemIndex + 1;
          ExecSQL;
          Transaction.Commit;
        end;
        MessageDlg('Registro Actualizado con Exito',mtInformation,[mbok],0);
        BitBtn2.Click;
end;

procedure TFrmFechaSucursal.remoto(vHost: string; vPuerto: integer);
var     sentencia :string;
        tamano,i :Integer;
        Astream:TMemoryStream;
        XmlDoc,Xmlres :TsdXmlDocument;
        Nodo,Nodo1 :TXmlNode;
        cadena :string;
        AList,AListCampos:TList;        
begin
        sentencia := 'select * from "caj$horariosucursal"';
        XmlDoc := TsdXmlDocument.CreateName('query_info');
        XmlDoc.XmlFormat := xfReadable;
        Nodo := XmlDoc.Root.NodeNew('querys');
        Nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','select');
        nodo1.WriteString('sentencia',sentencia);
        xmlres := TsdXmlDocument.Create;
        Xmlres.XmlFormat := xfReadable;
        Astream := TMemoryStream.Create;
        XmlDoc.SaveToStream(Astream);
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Espere un Momento por Favor...';// + Desc_Agencia;
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'Kbs Recibidos';
        frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
        Application.ProcessMessages;
        frmProgreso.Position := 2;
        frmProgreso.Ejecutar;
        with IdTCPClient1 do
        begin
          Port := vPuerto;
          Host := vhost;;
          try
             Application.ProcessMessages;
             Connect;
          except
          on e: Exception do
          begin
            Application.ProcessMessages;
            MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
            Disconnect;
            frmProgreso.Cerrar;
            Exit;
          end;
          end;
          if Connected then
          begin
            Cadena := ReadLn();
            AStream := TMemoryStream.Create;
            XmlDoc.SaveToStream(AStream);
            WriteInteger(AStream.Size);
            OpenWriteBuffer;
            WriteStream(AStream);
            CloseWriteBuffer;
            FreeAndNil(AStream);
            tamano := ReadInteger;
            AStream := TMemoryStream.Create;
            ReadStream(Astream,tamano,False);
            XmlRes := TsdXmlDocument.Create;
            XmlRes.LoadFromStream(AStream);
            //Xmlres.SaveToFile('c:\eje\res.xml');
            Disconnect;
            frmProgreso.Cerrar;
          end;
          end;
           Xmlres.LoadFromStream(Astream);
           AList := TList.Create;
           Nodo := XmlRes.Root.NodeByName('consulta000');
           Nodo.NodesByName('Registro',AList);
           for i := 0 to AList.Count -1 do
           begin
             AListCampos := TList.Create;
             TXmlNode(AList[i]).NodesByName('campo',AListCampos);
             CdHora.Append;
             Cdhora.FieldValues['ID_HORARIO'] := TXmlNode(AListCampos[0]).ValueAsInteger;
             Cdhora.FieldValues['HORARIO'] := TXmlNode(AListCampos[2]).ValueAsString;
             CdHora.Post;
           end;
 end;

procedure TFrmFechaSucursal.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TFrmFechaSucursal.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TFrmFechaSucursal.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TFrmFechaSucursal.alocal;
begin
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update "caj$horariosucursal" set HORA = :HORA where ID_HORARIO = :ID ');
          ParamByName('ID').AsInteger := CbDia.ItemIndex + 1;
          ParamByName('HORA').AsTime := StrToTime(mNueva.Text);
          ExecSQL;
        end;
end;

procedure TFrmFechaSucursal.aremoto(vHost: string; vPuerto: integer);
var     sentencia :string;
        tamano,i :Integer;
        Astream:TMemoryStream;
        XmlDoc,Xmlres :TsdXmlDocument;
        Nodo,Nodo1 :TXmlNode;
        cadena :string;
begin
        sentencia := 'Update "caj$horariosucursal" set HORA = ' + '''' + mnueva.Text + '''' + ' where ID_HORARIO = ' + IntToStr(CbDia.ItemIndex + 1);
        XmlDoc := TsdXmlDocument.CreateName('query_info');
        XmlDoc.XmlFormat := xfReadable;
        Nodo := XmlDoc.Root.NodeNew('querys');
        Nodo1 := Nodo.NodeNew('query');
        Nodo1.WriteString('tipo','update');
        nodo1.WriteString('sentencia',sentencia);
        xmlres := TsdXmlDocument.Create;
        Xmlres.XmlFormat := xfReadable;
        Astream := TMemoryStream.Create;
        XmlDoc.SaveToStream(Astream);
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Espere un Momento por Favor...';// + Desc_Agencia;
        frmProgreso.Min := 0;
        frmProgreso.InfoLabel := 'Kbs Recibidos';
        frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
        Application.ProcessMessages;
        frmProgreso.Position := 2;
        frmProgreso.Ejecutar;
        with IdTCPClient1 do
        begin
          Port := vPuerto;
          Host := vhost;;
          try
             Application.ProcessMessages;
             Connect;
          except
          on e: Exception do
          begin
            Application.ProcessMessages;
            MessageDlg('Error en la Conexión' + #13 + e.Message,mtError,[mbok],0);
            Disconnect;
            frmProgreso.Cerrar;
            Exit;
          end;
          end;
          if Connected then
          begin
            Cadena := ReadLn();
            AStream := TMemoryStream.Create;
            XmlDoc.SaveToStream(AStream);
            WriteInteger(AStream.Size);
            OpenWriteBuffer;
            WriteStream(AStream);
            CloseWriteBuffer;
            FreeAndNil(AStream);
            tamano := ReadInteger;
            AStream := TMemoryStream.Create;
            ReadStream(Astream,tamano,False);
            XmlRes := TsdXmlDocument.Create;
            XmlRes.LoadFromStream(AStream);
            Disconnect;
            frmProgreso.Cerrar;
          end;
        end;

end;

end.
