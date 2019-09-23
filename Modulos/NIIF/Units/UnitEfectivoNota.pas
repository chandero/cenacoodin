unit UnitEfectivoNota;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, JvEdit, JvTypedEdit, DBCtrls, DB, IBCustomDataSet,
  IBQuery, IBDatabase, UnitDmGeneral;

type
  TfrmEfectivoNota = class(TForm)
    Panel1: TPanel;
    CmdAceptar: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdEfectivo: TJvCurrencyEdit;
    Label2: TLabel;
    EdCheque: TJvCurrencyEdit;
    Label3: TLabel;
    EdCredito: TJvCurrencyEdit;
    DBLCBCheques: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    EdNumeroCheque: TEdit;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure EdChequeExit(Sender: TObject);
    procedure EdEfectivoExit(Sender: TObject);
    procedure EdCreditoExit(Sender: TObject);
    procedure DBLCBChequesExit(Sender: TObject);
    procedure EdNumeroChequeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    FEfectivo:Currency;
    FCheque:Currency;
    FBanco:Integer;
    FNumero:string;
    FCredito:Currency;
    { Private declarations }
  public
    property Efectivo:Currency read FEfectivo Write FEfectivo;
    property Cheque:Currency read FCheque Write FCheque;
    property Credito:Currency read FCredito Write FCredito;
    property Banco:Integer read FBanco Write FBanco;
    property Numero:string read FNumero Write FNumero;
    { Public declarations }
  end;

var
  frmEfectivoNota: TfrmEfectivoNota;
  dmGeneral: TdmGeneral;

implementation

{$R *.dfm}

uses UnitGlobales;

procedure TfrmEfectivoNota.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;
        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBTransaction1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBTransaction1.StartTransaction;
end;

procedure TfrmEfectivoNota.EdChequeExit(Sender: TObject);
begin
       FCheque := EdCheque.Value;
       if EdCheque.Value > 0 then
       begin
        IBQuery1.Open;
        IBQuery1.Last;
        DBLCBCheques.Enabled := True;
        EdNumeroCheque.Enabled := True;
        DBLCBCheques.SetFocus;
       end
       else
       begin
        IBQuery1.Close;
        DBLCBCheques.Enabled := False;
        EdNumeroCheque.Enabled := False;
        DBLCBCheques.KeyValue := -1;
        EdNumeroCheque.Text := '';
       end;

       if (FCheque + FCredito) > 0 then
        begin
           EdEfectivo.Value := 0;
           FEfectivo := 0;
           EdEfectivo.Enabled := False;
        end
        else
        begin
           EdEfectivo.Value := 0;
           FEfectivo := 0;
           EdEfectivo.Enabled := True;
        end
end;

procedure TfrmEfectivoNota.EdEfectivoExit(Sender: TObject);
begin
        FEfectivo := EdEfectivo.Value;
        if FEfectivo > 0 then
        begin
           EdCheque.Enabled := False;
           EdCredito.Enabled := False;
           FCredito := 0;
           EdCredito.Value := 0;
           EdCheque.Value := 0;
           FCheque := 0;
           DBLCBCheques.KeyValue := -1;
           EdNumeroCheque.Text := '';
           FNumero := '';
        end
        else
        begin
           EdCheque.Enabled := True;
           EdCredito.Enabled := True;
           FCredito := 0;
           EdCredito.Value := 0;
           EdCheque.Value := 0;
           FCheque := 0;
           DBLCBCheques.KeyValue := -1;
           EdNumeroCheque.Text := '';
           FNumero := '';
        end

end;

procedure TfrmEfectivoNota.EdCreditoExit(Sender: TObject);
begin
        FCredito := EdCredito.Value;
        if FCredito > 0 then
        begin
           FEfectivo := 0;
           EdEfectivo.Value := 0;
        end;
end;

procedure TfrmEfectivoNota.DBLCBChequesExit(Sender: TObject);
begin
        FBanco := DBLCBCheques.KeyValue;
end;

procedure TfrmEfectivoNota.EdNumeroChequeExit(Sender: TObject);
begin
        FNumero := EdNumeroCheque.Text;
end;

procedure TfrmEfectivoNota.FormShow(Sender: TObject);
begin
        EdEfectivo.Value := Efectivo;
        EdCheque.Value := Cheque;
        EdCredito.Value := Credito;
        if EdCheque.Value > 0 then begin
          IBQuery1.Open;
          DBLCBCheques.Enabled := True;
          EdNumeroCheque.Enabled := True;
          DBLCBCheques.KeyValue := Banco;
          EdNumeroCheque.Text := Numero;
        end;
end;

procedure TfrmEfectivoNota.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmEfectivoNota.FormDestroy(Sender: TObject);
begin
        dmGeneral.Free;
end;

end.
