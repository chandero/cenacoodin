unit UnitHabilitarAsociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvLabel, JvEdit, JvStaticText, Buttons, DB,
  IBCustomDataSet, IBQuery, JclSysUtils;

type
  TFrmHabilitaAsociado = class(TForm)
    Label1: TLabel;
    JvCuenta: TJvEdit;
    JvLabel1: TJvLabel;
    JvEstado: TJvStaticText;
    Button1: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    JvNumero: TJvStaticText;
    JvTipo: TJvStaticText;
    JvNombres: TJvStaticText;
    Panel2: TPanel;
    Panel3: TPanel;
    chEducacion: TCheckBox;
    chDeudas: TCheckBox;
    chAporte: TCheckBox;
    Bthabilitar: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IBQuery1: TIBQuery;
    panel: TPanel;
    IBQuery2: TIBQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure BthabilitarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHabilitaAsociado: TFrmHabilitaAsociado;

implementation
uses
        UnitDmGeneral;

{$R *.dfm}

procedure TFrmHabilitaAsociado.BitBtn3Click(Sender: TObject);
begin
        Close;
end;

procedure TFrmHabilitaAsociado.BitBtn2Click(Sender: TObject);
begin
        JvCuenta.Text := '';
        JvEstado.Caption := '';
        JvTipo.Caption := '';
        JvNumero.Caption := '';
        JvNombres.Caption := '';
        chEducacion.Checked := False;
        chDeudas.Checked := False;
        chAporte.Checked := False;
        Panel.Enabled := True;
        JvCuenta.SetFocus;
end;

procedure TFrmHabilitaAsociado.Button1Click(Sender: TObject);
begin
        with IBQuery1 do
        begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          Close;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(JvCuenta.Text);
          Open;
          if RecordCount = 0 then
          begin
            ShowMessage('Asociado no Encontrado');
            JvCuenta.SelectAll;
            JvCuenta.SetFocus;
            Exit;
          end;
          if FieldByName('HABIL').AsInteger = 1 then
          begin
             Bthabilitar.Enabled := False;
             JvEstado.Caption := 'HABIL';
          end
          else
          begin
             Bthabilitar.Enabled := True;
             JvEstado.Caption := 'INHABIL';
          end;
          JvNombres.Caption := FieldByName('NOMBRE').AsString + ' '+ FieldByName('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
          JvTipo.Caption := FieldByName('DESCRIPCION_IDENTIFICACION').AsString;
          JvNumero.Caption := FieldByName('ID_PERSONA').AsString;
          chEducacion.Checked := IntToBool(FieldByName('EDUCACION').AsInteger);
          chDeudas.Checked := IntToBool(FieldByName('DEUDAS').AsInteger);
          chAporte.Checked := IntToBool(FieldByName('APORTES').AsInteger);
          panel.Enabled := False;
        end;
end;

procedure TFrmHabilitaAsociado.JvCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
        if Key = #13 then
           Button1.Click;
end;

procedure TFrmHabilitaAsociado.BthabilitarClick(Sender: TObject);
begin
        if MessageDlg('Esta Seguro de Realizar la Operación',mtInformation,[mbyes,mbno],0) = Mrno then
           Exit;
        IBQuery2.Close;
        IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(JvCuenta.Text);
        IBQuery2.ExecSQL;
        IBQuery2.Transaction.Commit;
        Bthabilitar.Enabled := False;
        BitBtn2.Click;
end;

end.
