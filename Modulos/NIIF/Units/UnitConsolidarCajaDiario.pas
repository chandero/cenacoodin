unit UnitConsolidarCajaDiario;

interface

uses
  Windows, Messages, DateUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvDlg, IBSQL, DB, IBCustomDataSet, IBQuery,
  DBCtrls, Mask, JvToolEdit, StdCtrls, Buttons, ExtCtrls, JvEdit,
  JvTypedEdit;

type
  TfrmConsolidarCajaDiario = class(TForm)
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
    procedure CmdConsolidarClick(Sender: TObject);
    procedure CmdLimpiarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure EdArchivoAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure FormShow(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsolidarCajaDiario: TfrmConsolidarCajaDiario;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmConsolidarCajaDiario.CmdConsolidarClick(Sender: TObject);
var Archivo  :TextFile;
    Line     :string;
    Tipo     :TStringList;
    Codigo   :string;
    Cadena   :string;
    Mes      :Integer;
    Dia      :Integer;
    Debitos  :Currency;
    Creditos :Currency;
    Completo :string[18];
begin
       CmdConsolidar.Enabled := False;
       Application.ProcessMessages;

       JvPf.Caption := 'Importando Caja Diario ' + DBLCBAgencias.Text;
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
           Dia := StrToInt(Trim(Tipo.Strings[1]));
           Mes := StrToInt(Trim(Tipo.Strings[2]));
           Debitos := StrToFloat(Trim(Tipo.Strings[3]));
           Creditos := StrToFloat(Trim(Tipo.Strings[4]));

           IBSQL1.Close;
           IBSQL1.SQL.Clear;
           IBSQL1.SQL.Add('insert into "con$cajadiario" (ID_AGENCIA,CODIGO,DIA,MES,DEBITO,CREDITO) VALUES (');
           IBSQL1.SQL.Add(':ID_AGENCIA,:CODIGO,:DIA,:MES,:DEBITO,:CREDITO)');
           IBSQL1.ParamByName('ID_AGENCIA').AsInteger := DBLCBAgencias.KeyValue;
           IBSQL1.ParamByName('CODIGO').AsString := Codigo;
           IBSQL1.ParamByName('DIA').AsInteger := Dia;
           IBSQL1.ParamByName('MES').AsInteger  := Mes;
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

procedure TfrmConsolidarCajaDiario.CmdLimpiarClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmConsolidarCajaDiario.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarCajaDiario.Inicializar;
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

procedure TfrmConsolidarCajaDiario.EdArchivoAfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
        if Name <> '' then CmdConsolidar.Enabled := True
        else CmdConsolidar.Enabled := False;

end;

procedure TfrmConsolidarCajaDiario.FormShow(Sender: TObject);
begin
        Inicializar;
end;

end.
