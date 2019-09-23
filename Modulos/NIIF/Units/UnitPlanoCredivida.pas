unit UnitPlanoCredivida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons,sdXmlDocuments,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, DateUtils, DataSetToExcel,
  DB, DBClient, IBCustomDataSet, IBQuery, JvComponent, JvSimpleXml;

type
  TFrmPlanoCredivida = class(TForm)
    Opciones: TGroupBox;
    rDiario: TRadioButton;
    rPlano: TRadioButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IdTCPClient1: TIdTCPClient;
    dialogo: TSaveDialog;
    cdCreditos: TClientDataSet;
    cdCreditosclase: TStringField;
    cdCreditosamparo: TStringField;
    cdCreditosnombres: TStringField;
    cdCreditosdocumento: TStringField;
    cdCreditosvalor: TCurrencyField;
    cdCreditoscertificado: TStringField;
    cdCreditosmensual: TCurrencyField;
    IBQuery1: TIBQuery;
    cdArchivo: TClientDataSet;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    cdArchivotelefono: TStringField;
    cdArchivodireccion: TStringField;
    dialogo1: TSaveDialog;
    Rvigente: TRadioButton;
    cdArchivotipo: TStringField;
    IBQuery2: TIBQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure rPlanoClick(Sender: TObject);
    procedure rDiarioClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RvigenteClick(Sender: TObject);
  private
    aVencido :string;
    aHoy :string;
    aEquidad :string;
    aFundacion :string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPlanoCredivida: TFrmPlanoCredivida;

implementation
uses UnitGlobales,ComObj;

{$R *.dfm}

procedure TFrmPlanoCredivida.BitBtn2Click(Sender: TObject);
begin
        Close
end;

procedure TFrmPlanoCredivida.rPlanoClick(Sender: TObject);
var     mes :Integer;
begin
        if rPlano.Checked then
        begin
          mes := MonthOf(fFechaActual);
          Label1.Caption := 'Fecha Ini';
          fecha2.Enabled := True;
          if MonthOf(fFechaActual) = 1 then
            fecha1.Date := StrToDate(FormatDateTime(IntToStr(YearOf(fFechaActual) - 1) + '/' + IntToStr(mes-1) + '/21',fFechaActual))
          else
            fecha1.Date := StrToDate(FormatDateTime('yyyy/'+IntToStr(mes-1) + '/21',fFechaActual));
          fecha2.Date := StrToDate(FormatDateTime('yyyy/'+IntToStr(mes) + '/20',fFechaActual));
        end;

end;

procedure TFrmPlanoCredivida.rDiarioClick(Sender: TObject);
begin
        if rDiario.Checked then
        begin
          Label1.Caption := 'Fecha C.';
          fecha1.Date := fFechaActual;
          fecha2.Enabled := False;
        end;

end;

procedure TFrmPlanoCredivida.BitBtn1Click(Sender: TObject);
var     XmlDoc, XmlRes :TsdXmlDocument;
        Nodo,Nodo1: TXmlNode;
        i :Integer;
        vContador :Integer;
        AStream :TStringStream;
        AStream1 :TStringStream;
        tamano :Integer;
        vArchivo :TStringList;
        vCadena :string;
        nArchivo :string;
        ExcelFile:TDataSetToExcel;
        vCertificado,vTotal :Currency;
        Excel : Variant;
begin
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          Open;
          vCertificado := FieldByName('VALOR').AsCurrency;
        end;
        XmlDoc := TsdXmlDocument.CreateName('equivida');
        XmlDoc.EncodingString := 'ISO8859-1';
        XmlDoc.XmlFormat := xfReadable;
        Xmlres := TsdXmlDocument.Create;
        XmlRes.EncodingString := 'ISO8859-1';
        XmlRes.XmlFormat := xfReadable;
        nodo1 := XmlDoc.Root.NodeNew('Tipo');
        vArchivo := TStringList.Create;
        if (rPlano.Checked) or (Rvigente.Checked) then
        begin
            nodo1.WriteInteger('Opcion',3);
            nodo1 := XmlDoc.Root.NodeNew('Fechas');
            if Rvigente.Checked then
            begin
              nodo1.WriteString('vf1',FormatDateTime('yyyy-mm-dd',fecha1.Date));
              Nodo1.WriteString('vf2',FormatDateTime('yyyy-mm-dd',fecha2.Date));
//              nodo1.WriteString('vf1',IntToStr(YearOf(fFechaActual) + 1) + FormatDateTime('-mm-dd',fecha1.Date));
//              Nodo1.WriteString('vf2',IntToStr(YearOf(fFechaActual) + 1) + FormatDateTime('-mm-dd',fecha2.Date));
            end
            else
            begin
              nodo1.WriteString('vf1',FormatDateTime('yyyy-mm-dd',fecha1.Date));
              Nodo1.WriteString('vf2',FormatDateTime('yyyy-mm-dd',fecha2.Date));
              //nodo1.WriteString('vf1',IntToStr(YearOf(fFechaActual) + 1) + FormatDateTime('-mm-dd',fecha1.Date));
              //Nodo1.WriteString('vf2',IntToStr(YearOf(fFechaActual) + 1) + FormatDateTime('-mm-dd',fecha2.Date));
            end;
            AStream := TStringStream.Create('');
            XmlDoc.SaveToStream(AStream);
            //XmlDoc.SaveToFile('c:\eje\res.xml');
//inicio de la transferencia del stream
             with IdTCPClient1 do
             begin
               Host := buscaservicio(1,5).vHost;
               Port := BuscaServicio(1,5).vPuerto;
             try
               Connect;
             except
             begin
               MessageDlg('Error en la Conexión',mtInformation,[mbok],0);
               Exit;
             end;
             end;
             if Connected then
             begin
               WriteInteger(AStream.Size);
               OpenWriteBuffer;
               WriteStream(AStream);
               CloseWriteBuffer;
               tamano := ReadInteger;
               Astream1 := TStringStream.Create('');
               ReadStream(AStream1,tamano,False);
               //XmlRes.SaveToFile('c:\1.txt');
               XmlRes.LoadFromStream(astream1);
               Disconnect;
            end; // valida la conexxion
           end; // fin del tcp client
           nArchivo := 'plano_equidadfi' + FormatDateTime('yyyymmdd',fecha1.Date) + 'ff' + FormatDateTime('yyyymmdd',fecha2.Date);
           dialogo.InitialDir := vRuraCredivida;
           dialogo.FileName := nArchivo;
           Nodo := XmlRes.Root.NodeByName('Registro');
           for i := 0 to Nodo.NodeCount -1 do
           begin
              cdCreditos.Append;
              cdCreditos.FieldValues['clase'] := '07';
              cdCreditos.FieldValues['amparo'] := '45';
              cdCreditos.FieldValues['nombres'] := nodo.Nodes[i].ReadString('nombre');
              cdCreditos.FieldValues['documento'] := CurrToStr(StrToCurr(nodo.Nodes[i].ReadString('documento')));
              cdCreditos.FieldValues['valor'] := StrToCurr(nodo.Nodes[i].ReadString('valor'));
              cdCreditos.FieldValues['certificado'] := nodo.Nodes[i].ReadString('certificado');
              cdCreditos.FieldValues['mensual'] := vCertificado;
              cdCreditos.Post;
              vCadena := '';
              vCadena := '0745';
              vCadena := vCadena + Format('%.31s',[nodo.Nodes[i].ReadString('nombre')]);
              vCadena := vCadena + nodo.Nodes[i].ReadString('documento');
              vCadena := vCadena + nodo.Nodes[i].ReadString('valor') ;
              vCadena := vCadena + nodo.Nodes[i].ReadString('certificado') ;
              vArchivo.Add(vcadena);
           end;
           if not Rvigente.Checked then
           begin
             dialogo.InitialDir := aEquidad;
             dialogo.FileName := nArchivo;
             dialogo.Title := 'Generación Archivo Plano la Equidad ...';
             if dialogo.Execute then
             begin
                vArchivo.SaveToFile(dialogo.FileName + '.txt');
                vTotal := cdCreditos.RecordCount * vCertificado;
                cdCreditos.Append;
                cdCreditos.FieldValues['clase'] := '';
                cdCreditos.FieldValues['amparo'] := '';;
                cdCreditos.FieldValues['nombres'] := '';
                cdCreditos.FieldValues['documento'] := '';
                cdCreditos.FieldByName('valor').Clear;
                cdCreditos.FieldValues['certificado'] := 'TOTAL :';
                cdCreditos.FieldValues['mensual'] := vTotal;
                cdCreditos.Post;
             cdCreditos.First;
             ExcelFile := TDataSetToExcel.Create(CDcreditos,aFundacion + '\' + narchivo + '.xls');
             ExcelFile.WriteFile;
             ExcelFile.Free;
             BitBtn1.Enabled := False;
             end;
           end
           else
           begin
             vTotal := cdCreditos.RecordCount * vCertificado;
             cdCreditos.Append;
             cdCreditos.FieldValues['clase'] := '';
             cdCreditos.FieldValues['amparo'] := '';;
             cdCreditos.FieldValues['nombres'] := '';
             cdCreditos.FieldValues['documento'] := '';
             cdCreditos.FieldByName('valor').Clear;
             cdCreditos.FieldValues['certificado'] := 'TOTAL :';
             cdCreditos.FieldValues['mensual'] := vTotal;
             cdCreditos.Post;
             Excel := CreateOleObject('Excel.Application');
//             if not DirectoryExists('c:\PlanoCredivida') then
//                CreateDir('C:\PlanoCredivida');
             fecha1.Time := Time;
             nArchivo := 'Plano' + FormatDateTime('yyyymmdd_hhmm',fecha1.DateTime);
             cdCreditos.First;
             ExcelFile := TDataSetToExcel.Create(CDcreditos,aHoy + '\' + narchivo + '.xls');
             ExcelFile.WriteFile;
             ExcelFile.Free;
             if MessageDlg('El Arhivo fue Grabado en la Carpeta "' + aHoy +  '\' + nArchivo + '.xls'  + '"' + #13 +
             '                                       Desea Abrir el Archivo? ....',mtInformation,[mbyes,mbno],0) = mryes then
             begin
               Excel.WorkBooks.Open(ahoy  + '\' + narchivo + '.xls');
               Excel.visible:=True;
             end;
             BitBtn1.Enabled := False;
           end;
        end;
        if rDiario.Checked then
        begin
            nodo1.WriteInteger('Opcion',4);
            nodo1 := XmlDoc.Root.NodeNew('Fechas');
            nodo1.WriteString('vf1',FormatDateTime('yyy-mm-dd',fecha1.Date));
            AStream := TStringStream.Create('');
            XmlDoc.SaveToStream(AStream);
//inicio de la transferencia del stream
             with IdTCPClient1 do
             begin
               Host := buscaservicio(1,5).vHost;
               Port := BuscaServicio(1,5).vPuerto;
             try
               Connect;
             except
             begin
               MessageDlg('Error en la Conexión',mtInformation,[mbok],0);
               Exit;
             end;
             end;
             if Connected then
             begin
               WriteInteger(AStream.Size);
               OpenWriteBuffer;
               WriteStream(AStream);
               CloseWriteBuffer;
               tamano := ReadInteger;
               Astream1 := TStringStream.Create('');
               ReadStream(AStream1,tamano,False);
               XmlRes.LoadFromStream(astream1);
               Disconnect;
            end; // valida la conexxion
           end; // fin del tcp client
           try
             Nodo := XmlRes.Root.NodeByName('Registro');
           for i := 0 to Nodo.NodeCount -1 do
           begin
              cdArchivo.Append;
              cdArchivo.FieldValues['nombres'] := nodo.Nodes[i].ReadString('nombre');
              cdArchivo.FieldValues['documento'] := CurrToStr(StrToCurr(nodo.Nodes[i].ReadString('documento')));
              cdArchivo.FieldValues['telefono'] := nodo.Nodes[i].ReadString('telefono');
              cdArchivo.FieldValues['certificado'] := nodo.Nodes[i].ReadString('certificado');
              cdArchivo.FieldValues['direccion'] := nodo.Nodes[i].ReadString('direccion');
              with IBQuery2 DO
              begin
                Close;
                ParamByName('FECHA').AsDate := fecha1.Date;
                ParamByName('ID').AsString := nodo.Nodes[i].ReadString('documento');
                Open;
                if RecordCount <> 0 then
                    cdArchivo.FieldValues['tipo'] := 'AUTOMATICO';

              end;

              cdArchivo.Post;
           end;
           except
           begin
             MessageDlg('No Existen Registros para esta Fecha...',mtinformation,[mbok],0);
             Exit;
           end;
           end;

          dialogo1.InitialDir := aVencido;
          fecha1.Time := Time;
          dialogo1.FileName := 'Vencidos' + FormatDateTime('yyyymmdd_hhmm',fecha1.Date);
          if dialogo1.Execute then
          begin
            cdArchivo.First;
            ExcelFile := TDataSetToExcel.Create(cdArchivo,dialogo1.FileName + '.xls');
            ExcelFile.WriteFile;
            ExcelFile.Free;
            BitBtn1.Enabled := False;
          end;
        end;
end;

procedure TFrmPlanoCredivida.FormCreate(Sender: TObject);
begin
        aVencido := vRuraCredivida + '\Credividas Vencidos';
        aHoy := vRuraCredivida + '\Credividas Hoy';
        aEquidad := vRuraCredivida + '\Plano credivida';
        aFundacion := vRuraCredivida + '\Plano Fundacion';
        if not DirectoryExists(vRuraCredivida) then
           CreateDir(vRuraCredivida);
        if not DirectoryExists(aVencido) then
           CreateDir(aVencido);
        if not DirectoryExists(aHoy) then
           CreateDir(aHoy);
        if not DirectoryExists(aEquidad) then
           CreateDir(aEquidad);
        if not DirectoryExists(aFundacion) then
           CreateDir(aFundacion);
        fecha1.Date := fFechaActual;
        fecha2.Date := fFechaActual;
end;

procedure TFrmPlanoCredivida.RvigenteClick(Sender: TObject);
begin
        if Rvigente.Checked then
        begin
          Label1.Caption := 'Fecha C.';
          fecha1.Date := fFechaActual;
          fecha2.Date := fFechaActual;
          fecha2.Enabled := False;
        end;

end;

end.
