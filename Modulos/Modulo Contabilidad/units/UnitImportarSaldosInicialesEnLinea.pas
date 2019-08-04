unit UnitImportarSaldosInicialesEnLinea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, IBCustomDataSet, XMLDoc, XMLIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IBQuery, DBClient, IBSQL;

type
  TfrmImportarSaldosInicialesEnLinea = class(TForm)
    Label3: TLabel;
    DBLCBAgencias: TDBLookupComboBox;
    Panel1: TPanel;
    CmdConsolidar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label1: TLabel;
    lblEstado: TLabel;
    IBQAgencia: TIBQuery;
    DSAgencia: TDataSource;
    IdHTTP1: TIdHTTP;
    CDSdata: TClientDataSet;
    CDSdatacodigo: TStringField;
    IBSQLInsert: TIBSQL;
    CDSdatasaldoinicial: TCurrencyField;
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
  frmImportarSaldosInicialesEnLinea: TfrmImportarSaldosInicialesEnLinea;

implementation

{$R *.dfm}

uses unitDmGeneral, unitGlobales;

procedure TfrmImportarSaldosInicialesEnLinea.CmdConsolidarClick(
  Sender: TObject);
begin
        if (MessageDlg('Seguro de Importar Saldos Iniciales de Agencia:' + DBLCBAgencias.Text, mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
        begin
           CmdConsolidar.Enabled := false;
           ProcesarImportacion;
        end;
end;

procedure TfrmImportarSaldosInicialesEnLinea.ProcesarImportacion;
var
 HostServidor: String;
 PuertoServidor: Integer;
 cadena: String;
 anho: String;
 XMLResult : IXMLDocument;
 XMLSaldoInicial : IXMLNode;
 i: Integer;
 codigo: String;
 saldoinicial: Currency;
 IdAgencia: Integer;
begin
         IBQuery1.SQL.Clear;
         IBQuery1.SQL.Add('select * from "gen$servidor" where ID_AGENCIA = :ID_AGENCIA');
         IBQuery1.ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencias.KeyValue;
         IBQuery1.Open;

         HostServidor := IBQuery1.FieldByName('ID_HOST').AsString;
         PuertoServidor := IBQuery1.FieldByName('ID_PUERTO').AsInteger;
         anho := IntToStr(YearOf(fFechaActual));
         IdAgencia := DBLCBAgencias.KeyValue;
         CDSdata.EmptyDataSet;
         lblEstado.Caption := 'Leyendo Remoto...'+'URL://'+HostServidor+':'+IntToStr(PuertoServidor);
         cadena := GetURLAsString('http://'+HostServidor+':'+IntToStr(PuertoServidor)+'/sif/rest/bs/si/'+anho);
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
                 XMLSaldoInicial := XMLResult.ChildNodes.Nodes['resultList'].ChildNodes[i];
                 if (Assigned(XMLSaldoInicial)) then
                 begin
                    try
                     if (Assigned(XMLSaldoInicial.ChildNodes.Nodes['codigo'])) then
                       codigo := XMLSaldoInicial.ChildNodes.Nodes['codigo'].NodeValue;
                     if (Assigned(XMLSaldoInicial.ChildNodes.Nodes['saldo'])) then
                       saldoinicial := XMLSaldoInicial.ChildNodes.Nodes['saldo'].NodeValue;
                    except
                    end;
                    CDSdata.Open;
                    CDSdata.Append;
                    CDSdatacodigo.Value := codigo;
                    CDSdatasaldoinicial.Value := saldoinicial;
                    CDSdata.Post;
                    CDSdata.Close;
                 end; // fin del assigned saldoinicial
              end
             end;
             // Limpiar Datos Antiguos
             IBSQLInsert.SQL.Clear;
             IBSQLInsert.SQL.Add('delete from CON$SALDOSINICIALES where ID_AGENCIA = :ID_AGENCIA');
             IBSQLInsert.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
             IBSQLInsert.ExecQuery;

             IBSQLInsert.SQL.Clear;
             IBSQLInsert.SQL.Add('insert into CON$SALDOSINICIALES values (:ID_AGENCIA, :CODIGO, :SALDOINICIAL)');
             // Leer CDS
             CDSdata.Open;
             CDSdata.First;
             while not CDSdata.Eof do
             begin
                 IBSQLInsert.ParamByName('ID_AGENCIA').AsInteger := IdAgencia;
                 IBSQLInsert.ParamByName('CODIGO').AsString := CDSdatacodigo.Value;
                 lblEstado.Caption := 'Importando Saldo Cuenta: ' + CDSdatacodigo.Value;
                 IBSQLInsert.ParamByName('SALDOINICIAL').AsCurrency := CDSdatasaldoinicial.Value;
                 IBSQLInsert.ExecQuery;
                 CDSdata.Next;
             end;
             IBSQLInsert.Transaction.Commit;
             lblEstado.Caption := 'Importación finalizada con exito!!!';
             ShowMessage('Importación finalizada con exito!!!');
           except
             IBSQLInsert.Transaction.Rollback;
             ShowMessage('Error al procesar los datos recibidos');
             lblEstado.Caption := 'Error al procesar los datos recibidos';
             exit;
           end;
         end
         else
         begin
            ShowMessage('No se recibieron datos');
            lblEstado.Caption := 'No se recibieron datos';
         end;

end;

procedure TfrmImportarSaldosInicialesEnLinea.CmdCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmImportarSaldosInicialesEnLinea.FormCreate(Sender: TObject);
begin
        if (IBQAgencia.Transaction.InTransaction) then
            IBQAgencia.Transaction.Commit;
        IBQAgencia.Transaction.StartTransaction;
        IBQAgencia.Open;
        IBQAgencia.Last;
    
end;

function TfrmImportarSaldosInicialesEnLinea.GetURLAsString(const aURL: string): string;
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
