unit UnitInformePlasticos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, pr_Classes, pr_Common,
  pr_TxClasses, DB, IBCustomDataSet, IBQuery, DBCtrls, DBClient, Grids,
  DBGrids, IdTCPClient,sdXmlDocuments, IdBaseComponent, IdComponent,
  IdTCPConnection, UnitClaseXml, FR_Class, DateUtils;

type
  TfrmInformePlasticos = class(TForm)
    Panel1: TPanel;
    btnCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    PageControl1: TPageControl;
    TabAsignados: TTabSheet;
    TabPedidos: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDesde: TDateTimePicker;
    EdHasta: TDateTimePicker;
    DBGrid1: TDBGrid;
    DSAsignada: TDataSource;
    CdAsignada: TClientDataSet;
    DbOficina: TDBLookupComboBox;
    Label3: TLabel;
    IbOficina: TIBQuery;
    DsOficina: TDataSource;
    CdAsignadaTARJETA: TStringField;
    CdAsignadaAGENCIA: TSmallintField;
    CdAsignadaFECHAA: TDateField;
    CdAsignadaASIGNADA: TSmallintField;
    IBAgencias: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    BtnAplicar: TBitBtn;
    BtnBuscar: TBitBtn;
    frReport1: TfrReport;
    BtnReporte: TBitBtn;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    EdDesdeP: TDateTimePicker;
    EdHastaP: TDateTimePicker;
    Label6: TLabel;
    DBOficinaP: TDBLookupComboBox;
    DBGrid2: TDBGrid;
    DSPedido: TDataSource;
    CDPedido: TClientDataSet;
    CDPedidoFECHA: TDateField;
    CDPedidoTARJETA: TStringField;
    CDPedidoCANTIDAD: TIntegerField;
    CDPedidoAGENCIA: TIntegerField;
    Button1: TButton;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnAplicarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    XmlPet,XmlRes: TsdXmlDocument;
    _TXml:TXml;
    Nodo,Nodo1:TXmlNode;
    Size:Integer;
    AStream:TMemoryStream;
    sentencia :string;
    tamano :Integer;
    host_server: string;
    puerto_server: Integer;
    { Private declarations }
  public
    { Public declarations }
    function EnviarXml(iIdPuerto:Integer;sIdHost,Desc:string;AstreamEnv:TMemoryStream): TMemoryStream;
  end;

var
  frmInformePlasticos: TfrmInformePlasticos;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales, UnitPantallaProgreso, ComObj;

procedure TfrmInformePlasticos.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInformePlasticos.btnReporteClick(Sender: TObject);
var   G :Integer;
      Excel, WorkBook, WorkSheet: Variant;
      Format: OleVariant;
const
       xlWBATWorksheet = -4167;

begin
   if PageControl1.ActivePage = TabAsignados then
    begin
       Excel := CreateOleObject('Excel.Application');
       Excel.DisplayAlerts := false;
       Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
       WorkSheet := WorkBook.WorkSheets[1];
       WorkSheet.Name := 'Tarjetas Asignadas';
       G := 0;

       WorkSheet.cells[1,1] := 'TARJETA';
       WorkSheet.cells[1,2] := 'AGENCIA';
       WorkSheet.cells[1,3] := 'FECHA';
       WorkSheet.cells[1,4] := 'ASIGNADA';
       WorkSheet.range['A1:E1'].Font.FontStyle := 'Bold';

       WorkSheet.Cells[1,1].ColumnWidth := 16;
       WorkSheet.Cells[1,2].ColumnWidth := 10;
       WorkSheet.cells[1,3].ColumnWidth := 10;
       WorkSheet.Cells[1,4].ColumnWidth := 10;



       CdAsignada.Last;
       CdAsignada.First;
       while not CdAsignada.Eof do
        begin
          for G := 1 to 4 do begin
             WorkSheet.cells[cdasignada.RecNo + 1,1].numberformat := '0';
             WorkSheet.Cells[cdasignada.RecNo + 1,G] := CdAsignada.Fields.Fields[G - 1].AsString;
          end;
           CdAsignada.Next;
        end;

//       WorkBook.SaveAs('c:\TarjetasAsignadas' + IntToStr(YearOf(EdHasta.Date)) + FormatCurr('00',MonthOf(EdHasta.Date)) + FormatCurr('00',DayOf(EdHasta.Date)) + '.xls');
//       Excel.WorkBooks.Open('c:\TarjetasAsignadas' + IntToStr(YearOf(Edhasta.Date)) + FormatCurr('00',MonthOf(EdHasta.Date)) + FormatCurr('00',DayOf(Edhasta.Date)) + '.xls');
       WorkBook.SaveAs('c:\TarjetasAsignadas.xls');
       Excel.WorkBooks.Open('c:\TarjetasAsignadas.xls');
       Excel.visible:=True;
    end
   else if PageControl1.ActivePage = TabPedidos then
    begin
    end;
end;


procedure TfrmInformePlasticos.FormCreate(Sender: TObject);
begin
        EdDesde.Date := fFechaActual;
        EdHasta.Date := fFechaActual;
        EdDesdeP.Date := fFechaActual;
        EdHastaP.Date := fFechaActual;
        
        if IBAgencias.Transaction.InTransaction then
           IBAgencias.Transaction.Rollback;
        IBAgencias.Transaction.StartTransaction;

//        IbOficina.ParamByName('ID').AsInteger := Agencia;
        IbOficina.Open;
        IbOficina.Last;

        with IBAgencias do
         begin
           Close;
           ParamByName('ID_AGENCIA').AsInteger := 0;
           Open;
           if RecordCount > 0 then begin
             host_server := FieldByName('ID_HOST').AsString;
             puerto_server := FieldByName('ID_PUERTO').AsInteger;
           end;
         end;

         _TXml := TXml.Create;

        PageControl1.ActivePage := TabAsignados;
end;




function TfrmInformePlasticos.EnviarXml(iIdPuerto:Integer;sIdHost,Desc:string;AstreamEnv:TMemoryStream): TMemoryStream;
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



procedure TfrmInformePlasticos.BtnBuscarClick(Sender: TObject);
var
  AList,AListCampos:TList;
  i :Integer;
begin
  if PageControl1.ActivePage = TabAsignados then
   begin
        if DbOficina.KeyValue < 1 then begin
          ShowMessage('Debe seleccionar una Agencia');
          DbOficina.SetFocus;
          Exit;
        end;

        CdAsignada.CancelUpdates;
        try
          XmlPet := TsdXmlDocument.CreateName('query_info');
          XmlPet.XmlFormat := xfReadable;
          Nodo := XmlPet.Root.NodeNew('querys');
          sentencia := 'select * from ASIGNADAS_TDB(' + IntToStr(DbOficina.KeyValue) + ',' + '''' + DateToStr(EdDesde.Date) + '''' + ',' + '''' + DateToStr(EdHasta.Date) + '''' + ')';
          nodo1 := Nodo.NodeNew('query');
          Nodo1.WriteString('tipo','select');
          Nodo1.WriteString('sentencia',sentencia);

          Xmlres := TsdXmlDocument.Create;
          Xmlres.EncodingString := 'ISO8859-1';
          Xmlres.XmlFormat := xfReadable;
          Astream := TMemoryStream.Create;
          XmlPet.SaveToStream(Astream);
          XmlRes.LoadFromStream(EnviarXml(IBAgencias.FieldByName('ID_PUERTO').AsInteger,IBAgencias.FieldByName('ID_HOST').AsString,'',Astream));
          Xmlres.SaveToFile('c:\RepPlasticos' + IntToStr(Agencia) + '.xml');

          AList := TList.Create;
          Nodo := XmlRes.Root.NodeByName('consulta000');
          Nodo.NodesByName('Registro',AList);

          try
            for i := 0 to AList.Count -1 do
             begin
               AListCampos := TList.Create;
               TXmlNode(AList[i]).NodesByName('campo',AListCampos);

               if AList.Count < 1 then
                 ShowMessage('No Existen Registros')
               else begin
                 CdAsignada.Append;
                 CdAsignada.FieldValues['TARJETA'] := TXmlNode(AListCampos[0]).ValueAsString;
                 CdAsignada.FieldValues['AGENCIA'] := TXmlNode(AListCampos[1]).ValueAsInteger;
                 CdAsignada.FieldValues['FECHAA'] := TXmlNode(AListCampos[2]).ValueAsDateTime;
                 CdAsignada.FieldValues['ASIGNADA'] := TXmlNode(AListCampos[3]).ValueAsInteger;
                 CdAsignada.Post;
               end; // Fin de if Alist.count < 0
             end;
            if CdAsignada.RecordCount > 0 then
             begin
               BtnAplicar.Enabled := True;
               BtnReporte.Enabled := True;
             end;
          except
          end;
        except
          on e: Exception do
          begin
            ShowMessage('Error Interno, con Mensaje: ' + e.Message );
          end;
        end;
   end
  else
  if PageControl1.ActivePage = TabPedidos then
   begin
        if DBOficinaP.KeyValue < 1 then begin
          ShowMessage('Debe seleccionar una Agencia');
          DBOficinaP.SetFocus;
          Exit;
        end;

        CdAsignada.CancelUpdates;
        try
          XmlPet := TsdXmlDocument.CreateName('query_info');
          XmlPet.XmlFormat := xfReadable;
          Nodo := XmlPet.Root.NodeNew('querys');
          sentencia := 'SELECT * FROM TDB$PEDIDO where FECHA BETWEEN ' + QuotedStr(DateToStr(EdDesdeP.Date)) + ' AND ' +  QuotedStr(DateToStr(EdHastaP.Date));
          nodo1 := Nodo.NodeNew('query');
          Nodo1.WriteString('tipo','select');
          Nodo1.WriteString('sentencia',sentencia);

          Xmlres := TsdXmlDocument.Create;
          Xmlres.EncodingString := 'ISO8859-1';
          Xmlres.XmlFormat := xfReadable;
          Astream := TMemoryStream.Create;
          XmlPet.SaveToStream(Astream);
          XmlRes.LoadFromStream(EnviarXml(IBAgencias.FieldByName('ID_PUERTO').AsInteger,IBAgencias.FieldByName('ID_HOST').AsString,'',Astream));
          Xmlres.SaveToFile('c:\RepPlasticos' + IntToStr(Agencia) + '.xml');

          AList := TList.Create;
          Nodo := XmlRes.Root.NodeByName('consulta000');
          Nodo.NodesByName('Registro',AList);

          try
            for i := 0 to AList.Count -1 do
             begin
               AListCampos := TList.Create;
               TXmlNode(AList[i]).NodesByName('campo',AListCampos);

               if AList.Count < 1 then
                 ShowMessage('No Existen Registros')
               else begin
                 CDPedido.Append;
                 CDPedido.FieldValues['FECHA'] := TXmlNode(AListCampos[0]).ValueAsDateTime;
                 CDPedido.FieldValues['TARJETA'] := TXmlNode(AListCampos[1]).ValueAsString;
                 CDPedido.FieldValues['CANTIDAD'] := TXmlNode(AListCampos[2]).ValueAsInteger;
                 CDPedido.FieldValues['AGENCIA'] := TXmlNode(AListCampos[3]).ValueAsInteger;
                 CDPedido.Post;
               end; // Fin de if Alist.count < 0
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
end;


procedure TfrmInformePlasticos.BtnAplicarClick(Sender: TObject);
var
i:Integer;
begin
      if MessageDlg('¿Seguro de Aplicar el Envio?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
       begin
         BtnAplicar.Enabled := False;
         try
          XmlPet := TsdXmlDocument.CreateName('query_info');
          XmlPet.XmlFormat := xfReadable;
          Nodo := XmlPet.Root.NodeNew('querys');
          CdAsignada.First;
          while not CdAsignada.Eof do begin
            sentencia := 'update TDB$ASIGNADA set ENVIADA = 1 where ID_TARJETA = ' + '''' + CdAsignada.FieldByName('TARJETA').AsString + '''' + ' AND ' + 'ID_AGENCIA = ' + IntToStr(CdAsignada.FieldByName('AGENCIA').AsInteger) + ' AND ' + 'FECHA_ASIGNADA = ' + '''' + DateToStr(CdAsignada.FieldByName('FECHAA').AsDateTime) + '''';
            nodo1 := Nodo.NodeNew('query');
            Nodo1.WriteString('tipo','update');
            Nodo1.WriteString('sentencia',sentencia);
            CdAsignada.Next;
          end;

          XmlPet.SaveToFile('c:\XmlPet.xml');

          Xmlres := TsdXmlDocument.Create;
          Xmlres.EncodingString := 'ISO8859-1';
          Xmlres.XmlFormat := xfReadable;
          Astream := TMemoryStream.Create;
          XmlPet.SaveToStream(Astream);
          _TXml.AstreamEnt := EnviarXml(IBAgencias.FieldByName('ID_PUERTO').AsInteger,IBAgencias.FieldByName('ID_HOST').AsString,'',AStream);
          XmlRes.SaveToFile('c:\TDebito' + IntToStr(Agencia) + '.xml');
          for i := 0 to cdasignada.RecordCount - 1 do begin
            _TXml.ListaConsulta := 'Consulta' + FormatCurr('000',i);
            if _TXml.LeerXml.FieldByName('FILAS_AFECTADAS').AsInteger = 1 then begin
              CdAsignada.Filtered := False;
              CdAsignada.Filter := 'ASIGNADA = 0';
              CdAsignada.Filtered := True;
              CdAsignada.Edit;
              CdAsignada.FieldValues['ASIGNADA'] := 1;
              CdAsignada.Post;
            end;
          end;
          CdAsignada.Filtered := False;
          DBGrid1.Refresh;

          ShowMessage('Marcación de Envio Registrada con Exito!');
          except
            on e: Exception do
            begin
              ShowMessage('Error Interno, con Mensaje: ' + e.Message );
            end;
          end;
       end; // fin Aplicar Envio
end;

procedure TfrmInformePlasticos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
