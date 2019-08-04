unit UnitCambiosFun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, JvStaticText, DB, IBCustomDataSet,
  IBQuery,sdXmlDocuments, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient;

type
  TFrmCambiosFun = class(TForm)
    GroupBox1: TGroupBox;
    requerimiento: TMemo;
    g: TGroupBox;
    Explicacion: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fecha: TJvStaticText;
    hora: TJvStaticText;
    cons: TJvStaticText;
    IBQuery1: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure requerimientoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure requerimientoExit(Sender: TObject);
    procedure ExplicacionExit(Sender: TObject);
  private
    ADoc: TsdXmlDocument;
  RDoc: TsdXmlDocument;
  Nodo,Anode:TXmlNode;
  Astream :TMemoryStream;
    procedure pAgencia;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCambiosFun: TFrmCambiosFun;

implementation
uses UnitGlobales, UnitPantallaProgreso;
{$R *.dfm}

procedure TFrmCambiosFun.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmCambiosFun.BitBtn1Click(Sender: TObject);
var     vConsecutivo :Integer;
begin

        if MessageDlg('Esta Seguro de Realizar la Transacción',mtInformation,[mbyes,mbno],0) = mrno then
           Exit;
        if Agencia = 1 then
        begin
          with IBQuery1 do
          begin
            Close;
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            SQL.Clear;
            SQL.Add('select max(CONSECUTIVO) + 1 as CONTADOR from "per$solicitud" where ID_AGENCIA = 1');
            Open;
            vConsecutivo := FieldByName('CONTADOR').AsInteger;
            cons.Caption := FormatCurr('00000',vConsecutivo);
            Close;
            SQL.Clear;
            SQL.Add('insert into "per$solicitud" (ID_AGENCIA,CONSECUTIVO,AREA,FECHAR,HORAR,REQUERIMIENTO,EXPLICACION,ID_EMPLEADO,VISADO,APLICADO,ESTADO)');
            SQL.Add('values(1,:CONSECUTIVO,:AREA,:FECHAR,:HORAR,:REQUERIMIENTO,:EXPLICACION,:ID_EMPLEADO,0,0,0)');
            ParamByName('CONSECUTIVO').AsInteger := vConsecutivo;
            ParamByName('AREA').AsString := vRol;
            fecha.Caption := DateToStr(fFechaActual);
            hora.Caption := TimeToStr(Time);
            ParamByName('FECHAR').AsDate := fFechaActual;
            ParamByName('HORAR').AsTime := Time;
            ParamByName('REQUERIMIENTO').AsString := requerimiento.Text;
            ParamByName('EXPLICACION').AsString := Explicacion.Text;
            ParamByName('ID_EMPLEADO').AsString := UpperCase(DBAlias);
            ExecSQL;
            Transaction.Commit;
          end;
        end
        else
          pAgencia;
        MessageDlg('Solicitud Registrada con Exito',mtInformation,[mbok],0);
        BitBtn1.Enabled := False;


end;

procedure TFrmCambiosFun.requerimientoKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self)
end;

procedure TFrmCambiosFun.BitBtn2Click(Sender: TObject);
begin
        requerimiento.Text := '';
        Explicacion.Text := '';
        BitBtn1.Enabled := True;
        fecha.Caption := '';
        hora.Caption := '';
        cons.Caption := '';
end;

procedure TFrmCambiosFun.requerimientoExit(Sender: TObject);
begin
        requerimiento.Text := uppercase(requerimiento.Text)
end;

procedure TFrmCambiosFun.ExplicacionExit(Sender: TObject);
begin
        Explicacion.Text := UpperCase(Explicacion.Text)
end;

procedure TFrmCambiosFun.pAgencia;
var     sentencia :string;
        tamano :Integer;
        cadena :string;
begin
        ADoc := TsdXmlDocument.CreateName('query_info');
        ADoc.XmlFormat := xfReadable;
        ANode := ADoc.Root.NodeNew('querys');
        sentencia := 'SELECT * FROM PER_SOLICITUD(' +
        IntToStr(Agencia) + ',' + '''' + Role + '''' + ',' + '''' +
        DateToStr(fFechaActual) + '''' + ',' + '''' + FormatDateTime('hh:mm:ss',Time) + ''''
        + ',' + '''' + requerimiento.Text + '''' + ',' + '''' + Explicacion.Text + '''' +
        ',' + '''' + DBAlias + '''' + ')' ;
        Nodo := ANode.NodeNew('query');
        Nodo.WriteString('tipo','select');
        Nodo.WriteString('sentencia',sentencia);
        Astream := TMemoryStream.Create;
        ADoc.SaveToStream(Astream);
        //frmProgreso := TfrmProgreso.Create(self);
        //frmProgreso.Titulo := 'Progreso de la Busqueda...';
        //frmProgreso.Min := 0;
        //frmProgreso.InfoLabel := 'Kbs Recibidos : 0';
        //frmProgreso.Ejecutar;
           with IdTCPClient1 do
           begin
             Host := buscaservicio(1,1).vHost;
             Port := buscaservicio(1,1).vPuerto;
             try
               Connect;
             except
             on e: Exception do
             begin
               //frmProgreso.Cerrar;
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
                //frmProgreso.Cerrar;
             end;
           end;


end;

end.
