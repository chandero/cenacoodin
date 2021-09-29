unit UnitConsolidarSaldoIAgencia;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvDlg, IBSQL, DB, IBCustomDataSet, IBQuery,
  DBCtrls, Mask, JvToolEdit, StdCtrls, Buttons, ExtCtrls, JvEdit,
  JvTypedEdit, IBDatabase;

type
  TfrmConsolidarSaldoIAgencia = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdAno: TJvYearEdit;
    Panel1: TPanel;
    CmdConsolidar: TBitBtn;
    CmdLimpiar: TBitBtn;
    CmdCerrar: TBitBtn;
    EdArchivo: TJvFilenameEdit;
    DBLCBAgencias: TDBLookupComboBox;
    DSAgencias: TDataSource;
    IBQAgencias: TIBQuery;
    IBSQL1: TIBSQL;
    JvPf: TJvProgressForm;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    procedure EdArchivoAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CmdConsolidarClick(Sender: TObject);
    procedure CmdLimpiarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsolidarSaldoIAgencia: TfrmConsolidarSaldoIAgencia;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales;

procedure TfrmConsolidarSaldoIAgencia.EdArchivoAfterDialog(Sender: TObject; var Name: String;
  var Action: Boolean);
begin
        if Name <> '' then CmdConsolidar.Enabled := True
        else CmdConsolidar.Enabled := False;

end;

procedure TfrmConsolidarSaldoIAgencia.Inicializar;
begin
        if IBQAgencias.Transaction.InTransaction then
           IBQAgencias.Transaction.Commit;
        IBQAgencias.Transaction.StartTransaction;
        IBQAgencias.Open;
        IBQAgencias.Last;

        EdArchivo.Text := '';
        EdAno.Value := YearOf(fFechaActual);
        DBLCBAgencias.KeyValue := -1;

end;

procedure TfrmConsolidarSaldoIAgencia.FormShow(Sender: TObject);
begin
   IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
   IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
   IBDatabase1.Params.Values['User_Name'] := 'SYSDBA';
   IBDatabase1.Params.Values['PassWord'] := 'masterkey';
   try
     IBDatabase1.Connected := True;
   except
     raise;
   end;

   Inicializar;
end;

procedure TfrmConsolidarSaldoIAgencia.CmdConsolidarClick(Sender: TObject);
var Archivo  :TextFile;
    Line     :string;
    Tipo     :TStringList;
    Codigo   :string;
    Cadena   :string;
    SaldoI   :Currency;
    Debitos  :Currency;
    Creditos :Currency;
    SaldoF   :Currency;
    Completo :string[18];
begin
       CmdConsolidar.Enabled := False;
       Application.ProcessMessages;

       JvPf.InfoLabel := 'Importando Saldo Inicial Balance Agencia ' + DBLCBAgencias.Text;
       JvPf.Execute;
       if IBSQL1.Transaction.InTransaction then
          IBSQL1.Transaction.Rollback;
       IBSQL1.Transaction.StartTransaction;
       Tipo := TStringList.Create;
       AssignFile(Archivo,EdArchivo.FileName);
       Reset(Archivo);
       Completo := '000000000000000000';
       while not Eof(Archivo) do
       begin
         Readln(archivo,Line);
         Application.ProcessMessages;
         if JvPf.Cancel then
           begin
             IBSQL1.Transaction.Rollback;
             JvPf.Free;
             ShowMessage('Proceso Cancelado');
             Exit;
           end;
         if Line <> '' then begin
           Tipo.Text := stringreplace(Line,';',#13,[rfreplaceall]);
           Codigo := Trim(Tipo.Strings[0]);
           Completo := '000000000000000000';
           Insert(Codigo,Completo,0);
           Codigo := Completo;
           SaldoI := StrToFloat(Trim(Tipo.Strings[1]));

           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('insert into "con$saldosiniciales" (ID_AGENCIA,CODIGO,SALDOINICIAL) VALUES (');
           IBSQL1.SQL.Add(':ID_AGENCIA,:CODIGO,:SALDOINICIAL)');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencias.KeyValue;
           IBSQL1.ParamByName('CODIGO').AsString := Codigo;
           IBSQL1.ParamByName('SALDOINICIAL').AsCurrency := SaldoI;
           try
             IBSQL1.ExecQuery;
           except
             JvPf.Free;
             IBSQL1.Transaction.Rollback;
             raise;
             Exit;
           end;

           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('update "con$puc" set SALDOINICIAL = :SALDOINICIAL where CODIGO = :CODIGO and ID_AGENCIA = :ID_AGENCIA');
           IBSQL1.ParamByName('SALDOINICIAL').AsCurrency := SaldoI;
           IBSQL1.ParamByName('CODIGO').AsString := Codigo;
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencias.KeyValue;
           try
             IBSQL1.ExecQuery;
           except
             JvPf.Free;
             IBSQL1.Transaction.Rollback;
             raise;
             Exit;
           end;

         end;
       end;
       IBSQL1.Transaction.Commit;
       JvPf.Free;
       CloseFile(Archivo);
       ShowMessage('Importación culminada con exito!');

end;

procedure TfrmConsolidarSaldoIAgencia.CmdLimpiarClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmConsolidarSaldoIAgencia.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarSaldoIAgencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   IBDatabase1.Connected := False;
end;

end.
