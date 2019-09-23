unit UnitConsolidarBalAgencia;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, JvEdit, JvTypedEdit, ExtCtrls, Mask,
  JvToolEdit, Buttons, DB, IBCustomDataSet, IBQuery, IBSQL, JvComponent,
  JvBaseDlg, JvWinDialogs, JvDlg;

type
  TfrmConsolidarBalAgencia = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CBMeses: TComboBox;
    EdAno: TJvYearEdit;
    Panel1: TPanel;
    CmdConsolidar: TBitBtn;
    CmdLimpiar: TBitBtn;
    Label4: TLabel;
    EdArchivo: TJvFilenameEdit;
    CmdCerrar: TBitBtn;
    DSAgencias: TDataSource;
    IBQAgencias: TIBQuery;
    DBLCBAgencias: TDBLookupComboBox;
    IBSQL1: TIBSQL;
    JvPf: TJvProgressForm;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdArchivoAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure CmdConsolidarClick(Sender: TObject);
    procedure CmdLimpiarClick(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsolidarBalAgencia: TfrmConsolidarBalAgencia;

implementation

{$R *.dfm}

uses unitdmGeneral, UnitGlobales;

procedure TfrmConsolidarBalAgencia.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarBalAgencia.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmConsolidarBalAgencia.EdArchivoAfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
        if Name <> '' then CmdConsolidar.Enabled := True
        else CmdConsolidar.Enabled := False;
end;

procedure TfrmConsolidarBalAgencia.CmdConsolidarClick(Sender: TObject);
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

       JvPf.InfoLabel := 'Importando Balance Agencia ' + DBLCBAgencias.Text;
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
             jvpf.Free;
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
           Debitos := StrToFloat(Trim(Tipo.Strings[2]));
           Creditos := StrToFloat(Trim(Tipo.Strings[3]));
           SaldoF := StrToFloat(Trim(Tipo.Strings[4]));

           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('insert into CON$SALDOSCUENTA (ID_AGENCIA,CODIGO,MES,DEBITO,CREDITO) VALUES (');
           IBSQL1.SQL.Add(':ID_AGENCIA,:CODIGO,:MES,:DEBITO,:CREDITO)');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencias.KeyValue;
           IBSQL1.ParamByName('CODIGO').AsString := Codigo;
           IBSQL1.ParamByName('MES').AsString := Format('%.2d',[CBMeses.ItemIndex + 1]);
           IBSQL1.ParamByName('DEBITO').AsCurrency := Debitos;
           IBSQL1.ParamByName('CREDITO').AsCurrency := Creditos;
           try
             IBSQL1.ExecQuery;
           except
             JvPf.Free;
             IBSQL1.Transaction.Rollback;
             raise;
           end;
         end;
       end;
       IBSQL1.Transaction.Commit;
       JvPf.Free;
       CloseFile(Archivo);
       ShowMessage('Importación culminada con exito!');


end;

procedure TfrmConsolidarBalAgencia.Inicializar;
begin
        if IBQAgencias.Transaction.InTransaction then
           IBQAgencias.Transaction.Commit;
        IBQAgencias.Transaction.StartTransaction;
        IBQAgencias.Open;
        IBQAgencias.Last;

        EdArchivo.Text := '';
        CBMeses.Text := '';
        EdAno.Value := YearOf(fFechaActual);
        DBLCBAgencias.KeyValue := -1;

end;

procedure TfrmConsolidarBalAgencia.CmdLimpiarClick(Sender: TObject);
begin
        Inicializar;
end;

end.
