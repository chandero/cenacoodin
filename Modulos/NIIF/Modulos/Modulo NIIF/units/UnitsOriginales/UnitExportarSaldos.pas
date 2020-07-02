unit UnitExportarSaldos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, IBDatabase, DB, IBCustomDataSet,
  IBQuery, Buttons, Mask, JvToolEdit;

type
  TfrmExportarSaldos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdMes: TComboBox;
    Panel3: TPanel;
    edBar: TProgressBar;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    btnExportar: TBitBtn;
    btnCerrar: TBitBtn;
    EdFileName: TJvFilenameEdit;
    Label2: TLabel;
    IBDatabase1: TIBDatabase;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure EdFileNameExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdFileNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportarSaldos: TfrmExportarSaldos;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales;

procedure TfrmExportarSaldos.btnCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmExportarSaldos.btnExportarClick(Sender: TObject);
var
   Total :Integer;
   F:TextFile;
   Texto:string;
begin
        with IBQuery1 do begin
                if Transaction.InTransaction then
                   Transaction.Rollback;
                Transaction.StartTransaction;
                Close;
                SQL.Clear;
                SQL.Add('select count(*) as total from CON$PUC');
                Open;
                Total := FieldByName('total').AsInteger;
                Close;
        end;

        edBar.Min := 0;
        edBar.Max := Total;
        edBar.Position := 0;

        AssignFile(F,EdFileName.FileName + '.csv');
        Rewrite(F);

        with IBQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from EXPORTAR_SALDOS_PUC (:ID_AGENCIA,:MES)');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('MES').AsInteger := EdMes.ItemIndex + 1;
          Open;
          Last;
          First;
          while not Eof do
          begin
            edBar.Position := RecNo;
            Texto := FieldByName('CODIGO').AsString + ';' + FieldByName('SALDO').AsString;
            Writeln(F,Texto);
            Next;
          end;
        end;
        CloseFile(F);

      btnExportar.Enabled := False;

      ShowMessage('Proceso Finalizado con Exito!');

end;

procedure TfrmExportarSaldos.EdFileNameExit(Sender: TObject);
begin
        if EdFileName.FileName = '' then
           btnExportar.Enabled := false
        else
           btnExportar.Enabled := True;
end;

procedure TfrmExportarSaldos.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmExportarSaldos.FormShow(Sender: TObject);
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
end;

procedure TfrmExportarSaldos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   IBDatabase1.Connected := False;
end;

procedure TfrmExportarSaldos.EdFileNameClick(Sender: TObject);
begin
        if EdFileName.FileName = '' then
           btnExportar.Enabled := false
        else
           btnExportar.Enabled := True;
end;

end.
