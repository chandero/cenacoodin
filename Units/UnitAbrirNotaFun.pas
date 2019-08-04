unit UnitAbrirNotaFun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, IBDatabase, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmAbrirNotaFun = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdNota: TEdit;
    dtFechaCom: TDateTimePicker;
    Button1: TButton;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox3: TGroupBox;
    mDescripcion: TMemo;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbrirNotaFun: TFrmAbrirNotaFun;

implementation
uses UnitGlobales;

{$R *.dfm}

procedure TFrmAbrirNotaFun.FormCreate(Sender: TObject);
begin
        dtFechaCom.DateTime := fFechaActual;
        IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBnameF;
        IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
        IBDatabase1.Params.Values['User_Name'] := 'sysdba';
        IBDatabase1.Params.Values['PassWord'] := 'masterkey';
        IBDatabase1.Connected := True;
        IBTransaction1.Active := True;
end;

procedure TFrmAbrirNotaFun.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmAbrirNotaFun.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        IBDatabase1.Close;
        IBTransaction1.Active := False;
end;

procedure TFrmAbrirNotaFun.Button1Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select DESCRIPCION from CON$COMPROBANTE where ID_COMPROBANTE = :ID');
          ParamByName('ID').AsString := EdNota.Text;
          Open;
          mDescripcion.Text := FieldByName('DESCRIPCION').AsString;
        end;
        Button1.Enabled := True;
        BitBtn1.Enabled := True;
end;

procedure TFrmAbrirNotaFun.BitBtn2Click(Sender: TObject);
begin
        mDescripcion.Text := '';
        EdNota.Text := '';
        BitBtn1.Enabled := False;
        Button1.Enabled := True;

end;

procedure TFrmAbrirNotaFun.BitBtn1Click(Sender: TObject);
begin
        if MessageDlg('Esta Seguro(a) de realizar la Transacción',mtinformation,[mbyes,mbno],0) = mrno then
           Exit;
        BitBtn1.Enabled := False;
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE CON$COMPROBANTE set ESTADO = :EST where ID_COMPROBANTE = :ID');
          ParamByName('EST').AsString := 'O';
          ParamByName('ID').AsString := EdNota.Text;
          ExecSQL;
          Transaction.CommitRetaining;
          Close;
          SQL.Clear;
          SQL.Add('UPDATE CON$AUXILIAR set ESTADOAUX = :EST where ID_COMPROBANTE = :ID ');
          ParamByName('EST').AsString := 'O';
          ParamByName('ID').AsString := EdNota.Text;
          ExecSQL;
          Transaction.Commit;
        end;
        ShowMessage('Transaccion Realizada con Exito');

end;

end.
