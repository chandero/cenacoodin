unit UnitImportarSaldoCuentaEnLinea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IBSQL, DB, DBClient,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IBCustomDataSet, IBQuery, DBCtrls;

type
  TfrmImportarSaldoCuentaEnLinea = class(TForm)
    Label3: TLabel;
    DBLCBAgencias: TDBLookupComboBox;
    IBQAgencia: TIBQuery;
    DSAgencia: TDataSource;
    IdHTTP1: TIdHTTP;
    CDSdata: TClientDataSet;
    CDSdatacodigo: TStringField;
    IBSQLInsert: TIBSQL;
    Label1: TLabel;
    lblEstado: TLabel;
    Panel1: TPanel;
    CmdConsolidar: TBitBtn;
    CmdCerrar: TBitBtn;
    CDSdatames: TIntegerField;
    CDSdatadebito: TCurrencyField;
    CDSdatacredito: TCurrencyField;
    Label2: TLabel;
    CBMeses: TComboBox;
    IBQuery1: TIBQuery;
    procedure CmdConsolidarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ProcesarImportacion;
    function GetURLAsString(const aURL: string): string;
  public
    { Public declarations }
  end;

var
  frmImportarSaldoCuentaEnLinea: TfrmImportarSaldoCuentaEnLinea;

implementation

{$R *.dfm}

uses XMLIntf, XMLDoc, DateUtils, UnitGlobales;

procedure TfrmImportarSaldoCuentaEnLinea.ProcesarImportacion;
var
 HostServidor: String;
 PuertoServidor: Integer;
 cadena: String;
 anho: String;
 XMLResult : IXMLDocument;
 XMLSaldoCuenta : IXMLNode;
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
         cadena := GetURLAsString('http://'+HostServidor+':'+IntToStr(PuertoServidor)+'/sif/rest/bs/sc/'+anho+'/'+IntToStr(IdMes));
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
                 XMLSaldoCuenta := XMLResult.ChildNodes.Nodes['resultList'].ChildNodes[i];
                 if (Assigned(XMLSaldoCuenta)) then
                 begin
                    try
                     if (Assigned(XMLSaldoCuenta.ChildNodes.Nodes['codigo'])) then
                       codigo := XMLSaldoCuenta.ChildNodes.Nodes['codigo'].NodeValue;
                     if (Assigned(XMLSaldoCuenta.ChildNodes.Nodes['mes'])) then
                       mes := XMLSaldoCuenta.ChildNodes.Nodes['mes'].NodeValue;
                     if (Assigned(XMLSaldoCuenta.ChildNodes.Nodes['debito'])) then
                       debito := XMLSaldoCuenta.ChildNodes.Nodes['debito'].NodeValue;
                     if (Assigned(XMLSaldoCuenta.ChildNodes.Nodes['credito'])) then
                       credito := XMLSaldoCuenta.ChildNodes.Nodes['credito'].NodeValue;
                    except
                    end;
                    CDSdata.Open;
                    CDSdata.Append;
                    CDSdatames.Value := mes;
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
             IBSQLInsert.SQL.Add('delete from CON$SALDOSCUENTA where ID_AGENCIA = :ID_AGENCIA and MES = :MES');
             IBSQLInsert.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
             IBSQLInsert.ParamByName('MES').AsInteger := IdMes;
             IBSQLInsert.ExecQuery;

             IBSQLInsert.SQL.Clear;
             IBSQLInsert.SQL.Add('insert into CON$SALDOSCUENTA values (:ID_AGENCIA, :CODIGO, :MES, :DEBITO, :CREDITO)');
             // Leer CDS
             CDSdata.Open;
             CDSdata.First;
             while not CDSdata.Eof do
             begin
                 IBSQLInsert.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                 IBSQLInsert.ParamByName('CODIGO').AsString := CDSdatacodigo.Value;
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

procedure TfrmImportarSaldoCuentaEnLinea.CmdConsolidarClick(
  Sender: TObject);
begin
        if (MessageDlg('Seguro de Importar Saldos Cuenta de Agencia:' + DBLCBAgencias.Text + ', Mes: ' + CBMeses.Text, mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
        begin
           CmdConsolidar.Enabled := false;
           ProcesarImportacion;
        end;
end;

procedure TfrmImportarSaldoCuentaEnLinea.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmImportarSaldoCuentaEnLinea.FormCreate(Sender: TObject);
begin
        if (IBQAgencia.Transaction.InTransaction) then
            IBQAgencia.Transaction.Commit;
        IBQAgencia.Transaction.StartTransaction;
        IBQAgencia.Open;
        IBQAgencia.Last;
end;

function TfrmImportarSaldoCuentaEnLinea.GetURLAsString(const aURL: string): string;
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
