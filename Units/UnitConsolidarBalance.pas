unit UnitConsolidarBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, IBCustomDataSet, IBQuery, DBCtrls,
  Buttons, IBSQL;

type
  TfrmConsolidarBalance = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBLCBAgencias: TDBLookupComboBox;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    CmdConsolidar: TBitBtn;
    BitBtn1: TBitBtn;
    CBMeses: TComboBox;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdConsolidarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsolidarBalance: TfrmConsolidarBalance;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales, UnitPantallaProgreso;

procedure TfrmConsolidarBalance.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmConsolidarBalance.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmConsolidarBalance.BitBtn1Click(Sender: TObject);
begin
        Close;
end;

procedure TfrmConsolidarBalance.FormShow(Sender: TObject);
begin
        IBQuery1.Open;
        IBQuery1.Last;
end;

procedure TfrmConsolidarBalance.CmdConsolidarClick(Sender: TObject);
var Mes:Integer;
    Saldo,Movimiento:Currency;
begin
        if DBLCBAgencias.KeyValue < 1 then
          begin
            MessageDlg('Debe Seleccionar una Agencia',mtInformation,[mbcancel],0);
            Exit;
          end;

        if CBMeses.ItemIndex < 0 then
          begin
            MessageDlg('Debe Seleccionar un Mes',mtInformation,[mbcancel],0);
            Exit;
          end;

        Mes := CBMeses.ItemIndex + 1;

        with IBSQL1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           try
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ExecQuery;
           except
             MessageDlg('Error al Buscar Codigos Puc',mtError,[mbcancel],0);
             Transaction.Rollback;
             raise;
             Exit;
           end;

           while not Eof do begin
           
              Saldo := FieldByName('SALDOINICIAL').AsCurrency;
              IBSQL2.Close;
              IBSQL2.ParamByName('CODIGO').AsString := FieldByName('CODIGO').AsString;
              IBSQL2.ParamByName('MES').AsString := Format('%.2d',[Mes]);
              IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Agencia;

              try
               IBSQL2.ExecQuery;
              except
               Transaction.Rollback;
               MessageDlg('Error al Buscar Movimientos del Año',mtError,[mbcancel],0);
               raise;
               Exit;
              end;
              Movimiento := ibsql2.FieldByName('MOVIMIENTO').AsCurrency;

              Saldo := Saldo + Movimiento;

              IBSQL3.Close;
              IBSQL3.ParamByName('CODIGO').AsString := FieldByName('CODIGO').AsString;
              IBSQL3.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
              IBSQL3.ParamByName('MES').AsInteger := CBMeses.ItemIndex + 1;
              IBSQL3.ParamByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
              IBSQL3.ParamByName('TIPO').AsString := FieldByName('TIPO').AsString;
              IBSQL3.ParamByName('CODIGOMAYOR').AsString := FieldByName('CODIGOMAYOR').AsString;
              IBSQL3.ParamByName('MOVIMIENTO').AsInteger := FieldByName('MOVIMIENTO').AsInteger;
              IBSQL3.ParamByName('ESBANCO').AsInteger := FieldByName('ESBANCO').AsInteger;
              IBSQL3.ParamByName('INFORME').AsString := FieldByName('INFORME').AsString;
              IBSQL3.ParamByName('NIVEL').AsInteger := FieldByName('NIVEL').AsInteger;
              IBSQL3.ParamByName('NATURALEZA').AsString := FieldByName('NATURALEZA').AsString;
              IBSQL3.ParamByName('CENTROCOSTO').AsString := FieldByName('CENTROCOSTO').AsString;
              IBSQL3.ParamByName('SALDOACTUAL').AsCurrency := Saldo;
              IBSQL3.ParamByName('ESCAPTACION').AsInteger := FieldByName('ESCAPTACION').AsInteger;
              IBSQL3.ParamByName('ESCOLOCACION').AsInteger := FieldByName('ESCOLOCACION').AsInteger;
              try
               IBSQL3.ExecQuery;
              except
               IBSQL3.Transaction.Rollback;
               MessageDlg('Error al Realizar Consolidación',mtError,[mbcancel],0);
               raise;
               Exit;
              end;

              Next;
           end;
           Transaction.Commit;
        end;

end;

end.
