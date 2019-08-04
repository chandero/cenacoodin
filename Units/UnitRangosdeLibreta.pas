unit UnitRangosdeLibreta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvEdit, DBCtrls, DB, IBCustomDataSet, IBQuery, IBSQL,
  ExtCtrls, Grids, DBGrids, JvDBCtrl, Buttons;

type
  TfrmRangosdeLibreta = class(TForm)
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    EdNumeroCap: TJvEdit;
    EdDigitoCap: TStaticText;
    EdNombreCap: TStaticText;
    IBConsulta: TIBSQL;
    IBHistoria: TIBQuery;
    DSHistoria: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    GridHistoria: TJvDBGrid;
    Panel3: TPanel;
    IBTiposCaptacion: TIBQuery;
    DSTiposCaptacion: TDataSource;
    GroupBox1: TGroupBox;
    EdNumeroIAnt: TStaticText;
    EdNumeroFAnt: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EdNumeroI: TJvEdit;
    EdNumeroF: TJvEdit;
    CmdNuevo: TBitBtn;
    CmdGrabar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBHistoriaNUMERO_INICIAL_OLD: TIntegerField;
    IBHistoriaNUMERO_FINAL_OLD: TIntegerField;
    IBHistoriaNUMERO_INICIAL: TIntegerField;
    IBHistoriaNUMERO_FINAL: TIntegerField;
    IBHistoriaFECHA_CAMBIO: TDateField;
    procedure EdNumeroCapKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCapExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure DBLCBTipoCaptacionEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroFExit(Sender: TObject);
    procedure EdNumeroIKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroFKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroIExit(Sender: TObject);
    procedure CmdGrabarClick(Sender: TObject);
    procedure CmdNuevoClick(Sender: TObject);
  private
    { Private declarations }
    FTipoCaptacion:Integer;
    FNumeroCaptacion:Integer;
  public
    procedure Inicializar;
    property TipoCaptacion: Integer read FTipoCaptacion Write FTipoCaptacion;
    property NumeroCaptacion:Integer read FNumeroCaptacion Write FNumeroCaptacion;
    { Public declarations }
  end;

var
  frmRangosdeLibreta: TfrmRangosdeLibreta;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales;

procedure TfrmRangosdeLibreta.EdNumeroCapKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmRangosdeLibreta.EdNumeroCapExit(Sender: TObject);
var id_per:string;
    id_iden:Integer;
begin
        if EdNumeroCap.Text = '' then Abort;

        EdNumeroCap.Text := Format('%.7d',[StrToInt(EdNumeroCap.Text)]);
        EdDigitoCap.Caption := DigitoControl(DBLCBTipoCaptacion.KeyValue,format('%.7d',[StrToInt(EdNumeroCap.Text)]));

        with IBConsulta do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select ID_IDENTIFICACION,ID_PERSONA from "cap$maestrotitular" ');
             SQL.Add(' where "cap$maestrotitular".ID_AGENCIA = :"ID_AGENCIA" and "cap$maestrotitular".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and "cap$maestrotitular".NUMERO_CUENTA = :"NUMERO_CUENTA" and "cap$maestrotitular".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             try
               ExecQuery;
             except
               MessageDlg('No se pudo realizar la consulta',mtError,[mbcancel],0);
               Abort;
             end;
             id_per := FieldByName('ID_PERSONA').AsString;
             id_iden := FieldByName('ID_IDENTIFICACION').AsInteger;
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,');
             SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$persona".NOMBRE from "gen$persona" ');
             SQL.Add(' where ID_IDENTIFICACION = :"ID_IDENTIFICACION" and ID_PERSONA = :"ID_PERSONA" ');
             ParamByName('ID_IDENTIFICACION').AsInteger := id_iden;
             ParamByName('ID_PERSONA').AsString := id_per;
             try
               ExecQuery;
             except
               MessageDlg('No se pudo realizar la consulta',mtError,[mbcancel],0);
               Abort;
             end;
             EdNombreCap.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                    FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                    FieldByName('NOMBRE').AsString;

             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"cap$libretas".NUMERO_INICIAL,');
             SQL.Add('"cap$libretas".NUMERO_FINAL');
             SQL.Add(' from ');
             SQL.Add('"cap$libretas" ');
             SQL.Add(' where "cap$libretas".ID_AGENCIA = :"ID_AGENCIA" and "cap$libretas".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and "cap$libretas".NUMERO_CUENTA = :"NUMERO_CUENTA" and "cap$libretas".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             try
               ExecQuery;
             except
               MessageDlg('No se pudo realizar la consulta',mtError,[mbcancel],0);
               Abort;
             end;
             EdNumeroIAnt.Caption := Format('%.7d',[FieldByName('NUMERO_INICIAL').AsInteger]);
             EdNumeroFAnt.Caption := Format('%.7d',[FieldByName('NUMERO_FINAL').AsInteger]);
             Close;
        end;

        with IBHistoria do
        begin
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
             try
               Open;
             except
               MessageDlg('No se pudo realizar la consulta de la historia',mtError,[mbcancel],0);
               Abort;
             end;
        end;
        GroupBox9.Enabled := False;
        EdNumeroI.SetFocus;

end;

procedure TfrmRangosdeLibreta.FormShow(Sender: TObject);
begin
        Inicializar;
        if ( FTipoCaptacion > 0 ) and
           ( FNumeroCaptacion > 0 ) then
        begin
           DBLCBTipoCaptacion.KeyValue := FTipoCaptacion;
           EdNumeroCap.Text := Format('%.7d',[FNumeroCaptacion]);
           EdNumeroCapExit(Sender);
        end;
end;

procedure TfrmRangosdeLibreta.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmRangosdeLibreta.DBLCBTipoCaptacionEnter(Sender: TObject);
begin
        DBLCBTipoCaptacion.DropDown;
end;

procedure TfrmRangosdeLibreta.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRangosdeLibreta.EdNumeroFExit(Sender: TObject);
begin
        if (EdNumeroI.Text = '') or
           (EdNumeroI.Text = '') then
        begin
           CmdGrabar.Enabled := False;
           Abort;
        end;
        EdNumeroF.Text := Format('%.7d',[StrToInt(EdNumeroF.Text)]);
        CmdGrabar.Enabled := True;
        CmdGrabar.SetFocus;
end;

procedure TfrmRangosdeLibreta.EdNumeroIKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmRangosdeLibreta.EdNumeroFKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmRangosdeLibreta.EdNumeroIExit(Sender: TObject);
begin
        if EdNumeroI.Text <> '' then
           EdNumeroI.Text := Format('%.7d',[StrToInt(EdNumeroI.Text)]);
end;

procedure TfrmRangosdeLibreta.CmdGrabarClick(Sender: TObject);
begin
        if MessageDlg('Seguro de Actualizar la Numeración',mtConfirmation,[mbYes,mbNo],0) = mrno then
          Abort;

        if StrToInt(EdNumeroI.Text) >= StrToInt(EdNumeroF.Text) then
        begin
          MessageDlg('La numeración no es correcta, verifique!',mtError,[mbcancel],0);
          Abort;
        end;


        with IBConsulta do
        begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$libretashistoria" Values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"FECHA_CAMBIO",:"NUMERO_INICIAL_OLD",:"NUMERO_FINAL_OLD",');
                SQL.Add(':"NUMERO_INICIAL",:"NUMERO_FINAL")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                ParamByName('FECHA_CAMBIO').AsDate := Date;
                ParamByName('NUMERO_INICIAL_OLD').AsInteger := StrToInt(EdNumeroIAnt.Caption);
                ParamByName('NUMERO_FINAL_OLD').AsInteger := StrToInt(EdNumeroFAnt.Caption);
                ParamByName('NUMERO_INICIAL').AsInteger := StrToInt(EdNumeroI.Text);
                ParamByName('NUMERO_FINAL').AsInteger := StrToInt(EdNumeroF.Text);
                try
                   ExecQuery;
                   Close;
                except
                   MessageDlg('No se pudo actualizar el registro',mtError,[mbcancel],0);
                   Transaction.RollbackRetaining;
                   Abort;
                end;

                Close;
                SQL.Clear;
                SQL.Add('delete from "cap$libretas"');
                SQL.Add(' where "cap$libretas".ID_AGENCIA = :"ID_AGENCIA" and "cap$libretas".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and "cap$libretas".NUMERO_CUENTA = :"NUMERO_CUENTA" and "cap$libretas".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                try
                  ExecQuery;
                  Close;
                except
                  MessageDlg('No se pudo realizar la consulta',mtError,[mbcancel],0);
                  Transaction.RollbackRetaining;
                  Abort;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$libretas" Values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"FECHA_LIBRETA",:"NUMERO_INICIAL",:"NUMERO_FINAL")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoCap.Caption);
                ParamByName('FECHA_LIBRETA').AsDate := Date;
                ParamByName('NUMERO_INICIAL').AsInteger := StrToInt(EdNumeroI.Text);
                ParamByName('NUMERO_FINAL').AsInteger := StrToInt(EdNumeroF.Text);
                try
                   ExecQuery;
                   Close;
                   Transaction.CommitRetaining;
                   MessageDlg('Registro actualizado con exito!',mtInformation,[mbok],0);
                   CmdGrabar.Enabled := False;
                except
                   MessageDlg('No se pudo actualizar el registro',mtError,[mbcancel],0);
                   Transaction.RollbackRetaining;
                   Abort;
                end;


        end;

        if DBLCBTipoCaptacion.KeyValue = 2 then
        with IBConsulta do
        begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$libretashistoria" Values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"FECHA_CAMBIO",:"NUMERO_INICIAL_OLD",:"NUMERO_FINAL_OLD",');
                SQL.Add(':"NUMERO_INICIAL",:"NUMERO_FINAL")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(1,EdNumeroCap.Text));
                ParamByName('FECHA_CAMBIO').AsDate := Date;
                ParamByName('NUMERO_INICIAL_OLD').AsInteger := StrToInt(EdNumeroIAnt.Caption);
                ParamByName('NUMERO_FINAL_OLD').AsInteger := StrToInt(EdNumeroFAnt.Caption);
                ParamByName('NUMERO_INICIAL').AsInteger := StrToInt(EdNumeroI.Text);
                ParamByName('NUMERO_FINAL').AsInteger := StrToInt(EdNumeroF.Text);
                try
                   ExecQuery;
                   Close;
                except
                   MessageDlg('No se pudo actualizar el registro',mtError,[mbcancel],0);
                   Transaction.RollbackRetaining;
                   Abort;
                end;

                Close;
                SQL.Clear;
                SQL.Add('delete from "cap$libretas"');
                SQL.Add(' where "cap$libretas".ID_AGENCIA = :"ID_AGENCIA" and "cap$libretas".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and "cap$libretas".NUMERO_CUENTA = :"NUMERO_CUENTA" and "cap$libretas".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(1,EdNumeroCap.Text));
                try
                  ExecQuery;
                  Close;
                except
                  MessageDlg('No se pudo realizar la consulta',mtError,[mbcancel],0);
                  Transaction.RollbackRetaining;
                  Abort;
                end;

                Close;
                SQL.Clear;
                SQL.Add('insert into "cap$libretas" Values (');
                SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
                SQL.Add(':"FECHA_LIBRETA",:"NUMERO_INICIAL",:"NUMERO_FINAL")');
                ParamByName('ID_AGENCIA').AsInteger := Agencia;
                ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
                ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroCap.Text);
                ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(DigitoControl(1,EdNumeroCap.Text));
                ParamByName('FECHA_LIBRETA').AsDate := Date;
                ParamByName('NUMERO_INICIAL').AsInteger := StrToInt(EdNumeroI.Text);
                ParamByName('NUMERO_FINAL').AsInteger := StrToInt(EdNumeroF.Text);
                try
                   ExecQuery;
                   Close;
                   Transaction.CommitRetaining;
                   MessageDlg('Registro actualizado con exito!',mtInformation,[mbok],0);
                   CmdGrabar.Enabled := False;
                except
                   MessageDlg('No se pudo actualizar el registro',mtError,[mbcancel],0);
                   Transaction.RollbackRetaining;
                   Abort;
                end;


        end;

end;

procedure TfrmRangosdeLibreta.Inicializar;
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        IBTiposCaptacion.Open;
        IBTiposCaptacion.Last;

        IBHistoriaNUMERO_INICIAL_OLD.DisplayFormat := '0000000';
        IBHistoriaNUMERO_FINAL_OLD.DisplayFormat := '0000000';
        IBHistoriaNUMERO_INICIAL.DisplayFormat := '0000000';
        IBHistoriaNUMERO_FINAL.DisplayFormat := '0000000';

        EdNumeroCap.Text := '';
        EdDigitoCap.Caption := '';
        EdNombreCap.Caption := '';
        EdNumeroIAnt.Caption := '';
        EdNumeroFAnt.Caption := '';
        EdNumeroI.Text := '';
        EdNumeroF.Text := '';
        IBHistoria.Close;
        GroupBox9.Enabled := True;
        DBLCBTipoCaptacion.SetFocus;
end;

procedure TfrmRangosdeLibreta.CmdNuevoClick(Sender: TObject);
begin
        Inicializar;
end;

end.
