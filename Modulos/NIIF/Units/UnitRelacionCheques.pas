unit UnitRelacionCheques;

interface

uses
  Windows, Messages, SysUtils, StrUtils,Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XStringGrid, IBSQL, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  DBCtrls, JvEdit, JvTypedEdit, DB, IBCustomDataSet, IBQuery, Mask,
  JvMaskEdit, JvSpin;

type PLista = ^ALista;
     ALista = Record
      Codigo:Integer;
      Descripcion:string;
      Plaza:string;
      Numero:string;
      Valor:Currency;
end;


type
  TfrmRelacionCheques = class(TForm)
    Panel1: TPanel;
    CmdAceptar: TBitBtn;
    CmdCancelar: TBitBtn;
    Lista: TListView;
    Panel2: TPanel;
    DBLCBBancos: TDBLookupComboBox;
    EdCheque: TEdit;
    EdValor: TJvCurrencyEdit;
    IBBancos: TIBQuery;
    CmdAgregar: TBitBtn;
    CmdQuitar: TBitBtn;
    DSBancos: TDataSource;
    EdCodigo: TJvSpinEdit;
    CBPlaza: TComboBox;
    Label1: TLabel;
    EdTotal: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure GridBancosGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure CmdAgregarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdQuitarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdChequeEnter(Sender: TObject);
    procedure EdValorEnter(Sender: TObject);
    procedure DBLCBBancosClick(Sender: TObject);
    procedure EdCodigoChange(Sender: TObject);
    procedure EdCodigoExit(Sender: TObject);
    procedure EdCodigoEnter(Sender: TObject);
    procedure EdChequeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    MiLista:TList;
    MiValor:Currency;
    procedure ActualzarVista;
  public
    { Public declarations }
    property ListaCheques:TList read MiLista Write MiLista;
    property ValorCheques:Currency read MiValor Write MiValor;
  end;


var
  frmRelacionCheques: TfrmRelacionCheques;
  ARecord:PLista;

implementation

{$R *.dfm}

uses unitDmGeneral,UnitGlobales;

procedure TfrmRelacionCheques.FormShow(Sender: TObject);
begin
        IBBancos.Open;
        IBBancos.Last;
        ActualzarVista;
end;

procedure TfrmRelacionCheques.GridBancosGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
        if ACol = 3 then
          Value := '#,#0.00';
end;

procedure TfrmRelacionCheques.CmdAgregarClick(Sender: TObject);
var I:Integer;
begin
          New(ARecord);
          ARecord^.Codigo := DBLCBBancos.KeyValue;
          ARecord^.Descripcion := DBLCBBancos.Text;
          ARecord^.Plaza := LeftStr(CBPlaza.Text,1);
          ARecord^.Numero := EdCheque.Text;
          ARecord^.Valor := EdValor.Value;
          MiLista.Add(ARecord);
          ActualzarVista;
          EdCodigo.SetFocus;
          DBLCBBancos.KeyValue := -1;
          CBPlaza.ItemIndex := 0;
          EdCheque.Text := '';
          EdValor.Value := 0;
end;

procedure TfrmRelacionCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRelacionCheques.CmdQuitarClick(Sender: TObject);
begin
        if Lista.ItemIndex > -1 then
        begin
           ARecord := MiLista.Items[Lista.ItemIndex];
           MiLista.Delete(Lista.ItemIndex);
           Dispose(ARecord);
           Lista.ItemFocused.Delete;
        end;
end;

procedure TfrmRelacionCheques.FormCreate(Sender: TObject);
begin
        MiLista := TList.Create;
end;

procedure TfrmRelacionCheques.ActualzarVista;
var I:Integer;
begin
          Lista.Clear;
          ValorCheques :=0;
          for I := 0 to ListaCheques.Count - 1 do
          begin
            ARecord := ListaCheques.Items[I];
            Lista.Items.Add.Caption := IntToStr(Arecord^.Codigo);
            Lista.Items.Item[I].SubItems.Add(ARecord^.Descripcion);
            Lista.Items.Item[I].SubItems.Add(ARecord^.Plaza);
            Lista.Items.Item[I].SubItems.Add(ARecord^.Numero);
            Lista.Items.Item[I].SubItems.Add(FormatCurr('$,#0.00',ARecord^.Valor));
            ValorCheques := ValorCheques + ARecord^.Valor;
          end;
          EdTotal.Caption := FormatCurr('$#,0.00',ValorCheques);
end;

procedure TfrmRelacionCheques.EdChequeEnter(Sender: TObject);
begin
        EdCheque.SelectAll;
end;

procedure TfrmRelacionCheques.EdValorEnter(Sender: TObject);
begin
        EdValor.SelectAll;
end;

procedure TfrmRelacionCheques.DBLCBBancosClick(Sender: TObject);
begin
        EdCodigo.Value := DBLCBBancos.KeyValue;
end;

procedure TfrmRelacionCheques.EdCodigoChange(Sender: TObject);
begin
        DBLCBBancos.KeyValue := EdCodigo.Value;
end;

procedure TfrmRelacionCheques.EdCodigoExit(Sender: TObject);
begin
        DBLCBBancos.KeyValue := EdCodigo.Value;
end;

procedure TfrmRelacionCheques.EdCodigoEnter(Sender: TObject);
begin
        EdCodigo.SelectAll;
end;

procedure TfrmRelacionCheques.EdChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

end.
