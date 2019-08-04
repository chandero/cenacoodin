unit UnitImportarCajaDiarioEnLinea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, JvEdit, JvTypedEdit,
  IBSQL, DB, DBClient, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IBCustomDataSet, IBQuery, UnitDmGeneral;

type
  TfrmImportarCajaDiarioEnLinea = class(TForm)
    Label3: TLabel;
    DBLCBAgencias: TDBLookupComboBox;
    Panel1: TPanel;
    CmdConsolidar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQAgencia: TIBQuery;
    DSAgencia: TDataSource;
    IdHTTP1: TIdHTTP;
    CDSdata: TClientDataSet;
    CDSdatacodigo: TStringField;
    IBSQLInsert: TIBSQL;
    IBQuery1: TIBQuery;
    lblEstado: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    CBMeses: TComboBox;
    CDSdatames: TIntegerField;
    CDSdatadia: TIntegerField;
    CDSdatadebito: TCurrencyField;
    CDSdatacredito: TCurrencyField;
    procedure CmdConsolidarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ProcesarImportacion;
    function GetURLAsString(const aURL: string): string;
  public
    { Public declarations }
  end;

var
  frmImportarCajaDiarioEnLinea: TfrmImportarCajaDiarioEnLinea;

implementation

{$R *.dfm}

uses XMLIntf, XMLDoc, DateUtils, UnitGlobales;

procedure TfrmImportarCajaDiarioEnLinea.CmdConsolidarClick(Sender: TObject);
begin
        if (MessageDlg('Seguro de Importar Caja Diario Agencia:' + DBLCBAgencias.Text + ', Mes: ' + CBMeses.Text, mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
        begin
           CmdConsolidar.Enabled := false;
           ProcesarImportacion;
        end;
end;

procedure TfrmImportarCajaDiarioEnLinea.FormCreate(Sender: TObject);
begin
        if (IBQAgencia.Transaction.InTransaction) then
            IBQAgencia.Transaction.Commit;
        IBQAgencia.Transaction.StartTransaction;
        IBQAgencia.Open;
        IBQAgencia.Last;
end;

procedure TfrmImportarCajaDiarioEnLinea.ProcesarImportacion;
var
 HostServidor: String;
 PuertoServidor: Integer;
 cadena: String;
 anho: String;
 XMLResult : IXMLDocument;
 XMLCajaDiario : IXMLNode;
 i: Integer;
 mes : Integer;
 dia : Integer;
 codigo: String;
 debito: Currency;
 credito: Currency;
 IdAgencia: Integer;
 IdMes: Integer;
begin
         IBQuery1.SQL.Clear;
         IBQuery1.SQL.Add('select * from "gen$servidor" where ID_AGENCIA = :ID_AGENCIA');
         IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencias.KeyValue;
         IBQuery1.Open;

         HostServidor := IBQuery1.FieldByName('ID_HOST').AsString;
         PuertoServidor := IBQuery1.FieldByName('ID_PUERTO').AsInteger;

         IdAgencia := DBLCBAgencias.KeyValue;
         IdMes := CBMeses.ItemIndex + 1;
         anho := IntToStr(YearOf(fFechaActual));
         CDSdata.EmptyDataSet;
         lblEstado.Caption := 'Leyendo Remoto...'+'URL://'+HostServidor+':'+IntToStr(PuertoServidor);
         cadena := GetURLAsString('http://'+HostServidor+':'+IntToStr(PuertoServidor)+'/sif/rest/bs/cd/'+anho+'/'+IntToStr(IdMes));
         if (cadena <> '') then begin
          XMLResult := LoadXMLData(cadena);
          try
             if (not XmlResult.ChildNodes.Count > 0) then
             begin
                MessageDlg('No Se Encontraron Saldos Iniciales',mtInformation,[mbok],0);
                Exit;
             end;
             lblEstado.Caption := 'Procesando Información....';
             for i := 0 to XMLResult.ChildNodes.Nodes['resultList'].ChildNodes.Count - 1 do
             begin
              if (XMLResult.ChildNodes.Nodes['resultList'].ChildNodes[i].LocalName = 'data') then
              begin  // inicio del saldoinicial
              // A mover
                 XMLCajaDiario := XMLResult.ChildNodes.Nodes['resultList'].ChildNodes[i];
                 if (Assigned(XMLCajaDiario)) then
                 begin
                    try
                     if (Assigned(XMLCajaDiario.ChildNodes.Nodes['codigo'])) then
                       codigo := XMLCajaDiario.ChildNodes.Nodes['codigo'].NodeValue;
                     if (Assigned(XMLCajaDiario.ChildNodes.Nodes['mes'])) then
                       mes := XMLCajaDiario.ChildNodes.Nodes['mes'].NodeValue;
                     if (Assigned(XMLCajaDiario.ChildNodes.Nodes['dia'])) then
                       dia := XMLCajaDiario.ChildNodes.Nodes['dia'].NodeValue;
                     if (Assigned(XMLCajaDiario.ChildNodes.Nodes['debito'])) then
                       debito := XMLCajaDiario.ChildNodes.Nodes['debito'].NodeValue;
                     if (Assigned(XMLCajaDiario.ChildNodes.Nodes['credito'])) then
                       credito := XMLCajaDiario.ChildNodes.Nodes['credito'].NodeValue;
                    except
                    end;
                    CDSdata.Open;
                    CDSdata.Append;
                    CDSdatames.Value := mes;
                    CDSdatadia.Value := dia;
                    CDSdatacodigo.Value := codigo;
                    CDSdatadebito.Value := debito;
                    CDSdatacredito.Value := credito;
                    CDSdata.Post;
                    CDSdata.Close;
                 end; // fin del assigned saldoinicial
              end
             end;
             // Limpiar Datos Antiguos
             IBSQLInsert.SQL.Clear;
             IBSQLInsert.SQL.Add('delete from CON$CAJADIARIO where ID_AGENCIA = :ID_AGENCIA and MES = :MES');
             IBSQLInsert.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
             IBSQLInsert.ParamByName('MES').AsInteger := IdMes;
             IBSQLInsert.ExecQuery;

             IBSQLInsert.SQL.Clear;
             IBSQLInsert.SQL.Add('insert into CON$CAJADIARIO values (:ID_AGENCIA, :CODIGO, :DIA, :MES, :DEBITO, :CREDITO)');
             // Leer CDS
             CDSdata.Open;
             CDSdata.First;
             while not CDSdata.Eof do
             begin
                 IBSQLInsert.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                 IBSQLInsert.ParamByName('CODIGO').AsString := CDSdatacodigo.Value;
                 IBSQLInsert.ParamByName('DIA').AsInteger := CDSdatadia.Value;
                 IBSQLInsert.ParamByName('MES').AsInteger := CDSdatames.Value;
                 IBSQLInsert.ParamByName('DEBITO').AsCurrency := CDSdatadebito.Value;
                 IBSQLInsert.ParamByName('CREDITO').AsCurrency := CDSdatacredito.Value;
                 IBSQLInsert.ExecQuery;
                 CDSdata.Next;
             end;
             IBSQLInsert.Transaction.Commit;
             lblEstado.Caption := 'Importación finalizada con exito!!!!';
             ShowMessage('Importación finalizada con exito!!!!');
           except
             IBSQLInsert.Transaction.Rollback;
             ShowMessage('Error al procesar los datos recibidos!!!');
             exit;
           end;

         end
         else
         begin
             ShowMessage('No se recibió información!!!');
         end;
end;

procedure TfrmImportarCajaDiarioEnLinea.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

function TfrmImportarCajaDiarioEnLinea.GetURLAsString(const aURL: string): string;
var
 IdHTTP1 : TIdHTTP;
begin
  try
   try
     IdHTTP1 := TIdHTTP.Create(self);
     Result := IdHTTP1.Get(aURL);
   except
     on E : Exception do
       ShowMessage(E.ClassName+' error generado, with message : '+E.Message);
   end;
  finally
     FreeAndNil(IdHTTP1);
  end;
end;

end.
