unit UnitChequesenTesoreria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, JvComponent, JvxCtrls, Buttons, ExtCtrls,
  pr_Common, pr_TxClasses, IBSQL, DB, IBCustomDataSet, IBQuery;

type
  TfrmChequesenTesoreria = class(TForm)
    Panel1: TPanel;
    ChkEnviarTodo: TCheckBox;
    Panel2: TPanel;
    CmdEnviar: TBitBtn;
    CmdCerrar: TBitBtn;
    Panel3: TPanel;
    ChkListaCheques: TJvxCheckListBox;
    Panel4: TPanel;
    Label1: TLabel;
    EdTotalCheques: TStaticText;
    HeaderControl1: THeaderControl;
    IBQuery1: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBQuery1ID_BANCO: TIntegerField;
    IBQuery1NUMERO_CHEQUE: TIntegerField;
    IBQuery1ID_AGENCIA: TSmallintField;
    IBQuery1ID_TIPO_CAPTACION: TSmallintField;
    IBQuery1NUMERO_CUENTA: TIntegerField;
    IBQuery1DIGITO_CUENTA: TIntegerField;
    IBQuery1VALOR: TIBBCDField;
    IBQuery1PLAZA: TIBStringField;
    IBQuery1FECHA_RECIBIDO: TDateField;
    IBQuery1FECHA_CONSIGNADO: TDateField;
    IBQuery1FECHA_PROCESADO: TDateField;
    IBQuery1CONSIGNADO: TSmallintField;
    IBQuery1LIBERADO: TSmallintField;
    IBQuery1DEVUELTO: TSmallintField;
    Reporte: TprTxReport;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChequesenTesoreria: TfrmChequesenTesoreria;

implementation

{$R *.dfm}

uses UnitVistaPreliminar,UnitGlobales;

procedure TfrmChequesenTesoreria.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmChequesenTesoreria.CmdEnviarClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE "tes$cheques" SET CONSIGNADO = 1,FECHA_CONSIGNADO = :FECHA WHERE CONSIGNADO = 0');
          ParamByName('FECHA').AsDate := Date;
          try
            ExecQuery;
          except
            MessageDlg('No se pudo enviar los cheques',mtError,[mbcancel],0);
            Exit;
          end;
        end;

        Reporte.Variables.ByName['Empresa'].AsString := Empresa;
        Reporte.Variables.ByName['Agencia'].AsString := Ciudad;
        if Reporte.PrepareReport then
         begin
          frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
          frmVistaPreliminar.Reporte := Reporte;
          frmVistaPreliminar.ShowModal;
         end;


        IBSQL1.Transaction.Commit;
        MessageDlg('Cheques enviados con exito!',mtInformation,[mbok],0);

end;

procedure TfrmChequesenTesoreria.FormShow(Sender: TObject);
var Cadena:string;
    Total:Currency;
begin
        with IBQuery1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;          
          Open;
          Total := 0;
            while not Eof do begin
             Cadena := '        '+
                       Format('%.3d',[FieldByName('ID_BANCO').AsInteger])+'               '+
                       Format('%.8d',[FieldByName('NUMERO_CHEQUE').AsInteger])+'      '+
                       Format('%18.2m',[FieldByName('VALOR').AsCurrency]);
             ChkListaCheques.Checked[ChkListaCheques.Items.Add(Cadena)] := true;
             Total := Total + FieldByName('VALOR').AsCurrency;
             Next;
            end;
          end;
          if Total > 0 then
             CmdEnviar.Enabled := True
          else
             CmdEnviar.Enabled := False;
          EdTotalCheques.Caption := FormatCurr('$#,#0.00',Total);

end;

end.
