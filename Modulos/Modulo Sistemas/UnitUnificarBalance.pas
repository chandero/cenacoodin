unit UnitUnificarBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, JvTypedEdit, JvUIB, Buttons, JvWinDialogs, DB,
  IBDatabase, IBCustomDataSet, IBQuery;

type
  TfrmUnificarBalance = class(TForm)
    Label1: TLabel;
    EdMes: TJvIntegerEdit;
    Label2: TLabel;
    EdAno: TJvYearEdit;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    SaveD: TJvSaveDialog2000;
    DataBase: TIBDatabase;
    Transaction: TIBTransaction;
    Query1: TIBQuery;
    Query2: TIBQuery;
    Label3: TLabel;
    Label4: TLabel;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnificarBalance: TfrmUnificarBalance;

implementation

{$R *.dfm}

procedure TfrmUnificarBalance.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmUnificarBalance.CmdProcesarClick(Sender: TObject);
var Archivo:TextFile;
    Cadena:string;
    SaldoAnt,Debitos,Creditos,SaldoAct:Currency;
begin
        if SaveD.Execute then
          AssignFile(Archivo,SaveD.FileName);
          Rewrite(Archivo);

        Rewrite(Archivo);
        Cadena := 'CODIGO;NOMBRE;SALDO ANTERIOR;DEBITOS;CREDITOS;SALDO ACTUAL';
        Writeln(Archivo,Cadena);
        DataBase.Connected := True;

        with Query1 do begin
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('select * from "CON$PUC01" where ANO = :ANO and MES = :MES');
          ParamByName('ANO').AsInteger := EdAno.Value;
          ParamByName('MES').AsInteger := EdMes.Value;
          try
           Open;
          except
           Transaction.RollBack;
           raise;
          end;

          while not Eof do begin

            Label4.Caption := FieldByName('CODIGO').AsString;
            Application.ProcessMessages;

            SaldoAnt := FieldByName('SALDOANT').AsCurrency;
            Debitos := FieldByName('DEBITO').AsCurrency;
            Creditos := FieldByName('CREDITO').AsCurrency;
            SaldoAct := FieldByName('SALDOACT').AsCurrency;

            Query2.Close;
            Query2.SQL.Clear;
            Query2.SQL.Add('select * from "CON$PUC0203" where ANO = :ANO and MES = :MES and CODIGO = :CODIGO');
            Query2.ParamByName('ANO').AsInteger := EdAno.Value;
            Query2.ParambyName('MES').AsInteger := EdMes.Value;
            Query2.ParamByName('CODIGO').AsString := FieldByName('CODIGO').AsString;
            try
             Query2.Open;
             if Query2.RecordCount > 0 then
             begin
              SaldoAnt := SaldoAnt + Query2.FieldByName('SALDOANT').AsCurrency;
              Debitos := Debitos + Query2.FieldByName('DEBITO').AsCurrency;
              Creditos := Creditos + Query2.FieldByName('CREDITO').AsCurrency;
              SaldoAct := SaldoAct + Query2.FieldByName('SALDOACT').AsCurrency;
             end;
            except
             Transaction.RollBack;
             raise;
            end;

            Cadena := FieldByName('CODIGO').AsString + ';' +
                      FieldByName('NOMBRE').AsString + ';' +
                      FormatCurr('#,#0.00',SaldoAnt) + ';' +
                      FormatCurr('#,#0.00',Debitos) + ';' +
                      FormatCurr('#,#0.00',Creditos) + ';' +
                      FormatCurr('#,#0.00',SaldoAct);

            Writeln(Archivo,Cadena);
            Next;

          end;
          Transaction.Commit;
        end;

        CloseFile(Archivo);



          
end;

end.
