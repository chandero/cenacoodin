unit UnitExportarSaldosMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, JvComponent, JvDlg, IBSQL, DateUtils,
  StdCtrls, Buttons, ExtCtrls, JvEdit, JvTypedEdit, Mask, JvToolEdit,
  IBDatabase, ComCtrls;

type
  TfrmExportarSaldosMes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    CBMeses: TComboBox;
    EdAno: TJvYearEdit;
    Panel1: TPanel;
    CmdExportar: TBitBtn;
    CmdLimpiar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBSQL1: TIBSQL;
    Label3: TLabel;
    EdFileName: TJvFilenameEdit;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    edBar: TProgressBar;
    procedure CmdLimpiarClick(Sender: TObject);
    procedure CmdExportarClick(Sender: TObject);
    procedure EdFileNameExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportarSaldosMes: TfrmExportarSaldosMes;

implementation

{$R *.dfm}

uses UnitGlobales, UnitDmGeneral;

procedure TfrmExportarSaldosMes.CmdLimpiarClick(Sender: TObject);
begin
        CBMeses.ItemIndex := MonthOf(fFechaActual) - 1;
        EdAno.Value := YearOf(fFechaActual);
end;

procedure TfrmExportarSaldosMes.CmdExportarClick(Sender: TObject);
var
   Total :Integer;
   F:TextFile;
   Texto:string;
   SaldoI:Currency;
   Debito:Currency;
   Credito:Currency;
   SaldoF:Currency;
begin
        with IBQuery1 do begin
           if Transaction.InTransaction then
                   Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select count(*) as total from CON$SALDOSCUENTA');
           SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ');
           SQL.Add('MES = :MES');
           ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           Open;
           Total := FieldByName('total').AsInteger;
           Close;
        end;

        edBar.Min := 0;
        edBar.Max := Total;
        edBar.Position := 0;

        AssignFile(F,EdFileName.FileName + '.csv');
        Rewrite(F);

        with IBQuery1 do
        begin
          SQL.Clear;
          SQL.Add('select * ');
          SQL.Add(' from CON$SALDOSCUENTA ');
          SQL.Add('where ');
          SQL.Add('(CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA) and ');
          SQL.Add('(CON$SALDOSCUENTA.MES = :"MES")');
          SQL.Add('ORDER BY CODIGO ASC');
        end;


        with IBQuery1 do begin
          Close;
          ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          Open;
          Last;
          First;
          while not Eof do
          begin
            edBar.Position := RecNo;
            Texto :=  FieldByName('ID_AGENCIA').AsString + ';' + FieldByName('CODIGO').AsString + ';' + FieldByName('MES').AsString + ';' + FieldByName('DEBITO').AsString + ';' + FieldByName('CREDITO').AsString;
            Writeln(F,Texto);
            Next;
          end;
        end;
        CloseFile(F);

      CmdExportar.Enabled := False;

      ShowMessage('Proceso Finalizado con Exito!');
end;

procedure TfrmExportarSaldosMes.EdFileNameExit(Sender: TObject);
begin
        if (EdFileName.FileName <> '') then
        CmdExportar.Enabled := true;
end;

procedure TfrmExportarSaldosMes.FormShow(Sender: TObject);
begin
        CBMeses.ItemIndex := MonthOf(fFechaActual) - 1;
        EdAno.Value := YearOf(fFechaActual);
end;

procedure TfrmExportarSaldosMes.CmdCerrarClick(Sender: TObject);
begin
        self.Close;
end;

end.
