unit UnitMantenimientoAbogados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, IBSQL, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ExtCtrls, StdCtrls, DBCtrls, Buttons;

type
  TfrmMantenimientoAbogados = class(TForm)
    Panel1: TPanel;
    Pdatos: TPanel;
    DBGAbogados: TDBGrid;
    IBQAbogados: TIBQuery;
    IBSQL1: TIBSQL;
    IBTransaction1: TIBTransaction;
    DBLCBTipoCaptacion: TDBLookupComboBox;
    Label2: TLabel;
    DBLCBTipoIdentificacion: TDBLookupComboBox;
    Label3: TLabel;
    EdNumeroIdentificacion: TEdit;
    Label4: TLabel;
    EdNombre: TStaticText;
    Label1: TLabel;
    Label5: TLabel;
    EdNumeroCaptacion: TEdit;
    chkPersona: TCheckBox;
    EdDigitoCaptacion: TStaticText;
    chkCuenta: TCheckBox;
    cmdAgregar: TBitBtn;
    cmdQuitar: TBitBtn;
    cmdCerrar: TBitBtn;
    IBQTipoIdentificacion: TIBQuery;
    IBQTipoCaptacion: TIBQuery;
    DSAbogados: TDataSource;
    DSTipoIdentificacion: TDataSource;
    DSTipoCaptacion: TDataSource;
    cmdAceptar: TBitBtn;
    cmdCancelar: TBitBtn;
    IBQAbogadosID_IDENTIFICACION: TSmallintField;
    IBQAbogadosID_PERSONA: TIBStringField;
    IBQAbogadosID_AGENCIA: TSmallintField;
    IBQAbogadosID_TIPO_CAPTACION: TSmallintField;
    IBQAbogadosNUMERO_CUENTA: TIntegerField;
    IBQAbogadosDIGITO_CUENTA: TSmallintField;
    procedure cmdCerrarClick(Sender: TObject);
    procedure IBQAbogadosNUMERO_CUENTAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IBQAbogadosID_IDENTIFICACIONGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cmdAgregarClick(Sender: TObject);
    procedure EdNumeroCaptacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroIdentificacionExit(Sender: TObject);
    procedure EdNumeroCaptacionExit(Sender: TObject);
    procedure cmdAceptarClick(Sender: TObject);
    procedure cmdCancelarClick(Sender: TObject);
    procedure cmdQuitarClick(Sender: TObject);
  private
    procedure Inicializar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMantenimientoAbogados: TfrmMantenimientoAbogados;

implementation

{$R *.dfm}

uses UnitdmGeneral,UnitGlobales;

procedure TfrmMantenimientoAbogados.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmMantenimientoAbogados.IBQAbogadosNUMERO_CUENTAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        Text := Format('%d'  ,[IBQAbogados.FieldByName('ID_TIPO_CAPTACION').AsInteger])+
                Format('%.2d',[IBQAbogados.FieldByName('ID_AGENCIA').AsInteger])+'-'+
                Format('%.7d',[IBQAbogados.FieldByName('NUMERO_CUENTA').AsInteger])+'-'+
                Format('%d'  ,[IBQAbogados.FieldByName('DIGITO_CUENTA').AsInteger]);
end;

procedure TfrmMantenimientoAbogados.IBQAbogadosID_IDENTIFICACIONGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona"');
         SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
         ParamByName('ID_IDENTIFICACION').AsInteger := IBQAbogados.fieldbyname('ID_IDENTIFICACION').AsInteger;
         ParamByName('ID_PERSONA').AsString := IBQAbogados.FieldByName('ID_PERSONA').AsString;
         try
          ExecQuery;
         except
          Transaction.Rollback;
          raise;
         end;
        end;
        Text := Trim(IBSQL1.FieldByName('NOMBRE').AsString + ' ' +
                IBSQL1.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                IBSQL1.FieldByName('SEGUNDO_APELLIDO').AsString);
end;

procedure TfrmMantenimientoAbogados.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmMantenimientoAbogados.Inicializar;
begin
        with IBSQL1 do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
        end;

        with IBQTipoIdentificacion do begin
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
        end;

        IBQAbogados.Open;
        IBQTipoCaptacion.Open;
        IBQTipoCaptacion.Last;
        IBQTipoIdentificacion.Open;
        IBQTipoIdentificacion.Last;
end;

procedure TfrmMantenimientoAbogados.cmdAgregarClick(Sender: TObject);
begin
        Pdatos.Enabled := True;
        cmdAgregar.Enabled := False;
        cmdQuitar.Enabled := False;
        DBLCBTipoIdentificacion.SetFocus;
end;

procedure TfrmMantenimientoAbogados.EdNumeroCaptacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmMantenimientoAbogados.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmMantenimientoAbogados.EdNumeroIdentificacionExit(
  Sender: TObject);
begin
        with IBSQL1 do begin
            Close;
            SQL.Clear;
            SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "gen$persona"');
            SQL.Add('where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
            ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
            try
             ExecQuery;
             if RecordCount > 0 then begin
                EdNombre.Caption := Trim(FieldByName('NOMBRE').AsString+' '+
                                         FieldByName('PRIMER_APELLIDO').AsString+' '+
                                         FieldByName('SEGUNDO_APELLIDO').AsString);
                chkPersona.Checked := True;
             end;
            except
             Transaction.Rollback;
             raise;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select "cap$maestro".ID_TIPO_CAPTACION,"cap$maestro".NUMERO_CUENTA,"cap$maestro".DIGITO_CUENTA from "cap$maestro"');
            SQL.Add('inner join "cap$maestrotitular" on ');
            SQL.Add('("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and');
            SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
            SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
            SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
            SQL.Add('inner join "cap$tiposestado" on ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
            SQL.Add('where');
            SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
            SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
            SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = 2 and');
            SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1 and');
            SQL.Add('"cap$tiposestado".SE_SUMA <> 0');
            ParamByName('ID_IDENTIFICACION').AsInteger := DBLCBTipoIdentificacion.KeyValue;
            ParamByName('ID_PERSONA').AsString := EdNumeroIdentificacion.Text;
            try
             ExecQuery;
             if RecordCount > 0 then begin
                DBLCBTipoCaptacion.KeyValue := FieldByName('ID_TIPO_CAPTACION').AsInteger;
                EdNumeroCaptacion.Text := Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]);
                EdDigitoCaptacion.Caption := Format('%d',[FieldByName('DIGITO_CUENTA').AsInteger]);
                chkCuenta.Checked := True;
             end;
            except
             Transaction.Rollback;
             raise;
            end;
        end;
end;

procedure TfrmMantenimientoAbogados.EdNumeroCaptacionExit(Sender: TObject);
begin
        with IBSQL1 do begin
            
        end;
end;

procedure TfrmMantenimientoAbogados.cmdAceptarClick(Sender: TObject);
begin
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "gen$abogados" (ID_IDENTIFICACION,ID_PERSONA,');
          SQL.Add('ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA)');
          SQL.Add('values (:ID_IDENTIFICACION,:ID_PERSONA,:ID_AGENCIA,');
          SQL.Add(':ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA)');
          ParamByName('ID_IDENTIFICACION').AsInteger := dblcbtipoidentificacion.KeyValue;
          ParamByName('ID_PERSONA').AsString := Trim(EdNumeroIdentificacion.Text);
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTipoCaptacion.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(Ednumerocaptacion.Text);
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(eddigitocaptacion.Caption);
          try
           ExecQuery;
           Transaction.Commit;
          except
           Transaction.Rollback;
           raise;
          end;
        end;

        Pdatos.Enabled := False;
        cmdAgregar.Enabled := True;
        cmdQuitar.Enabled := True;

        inicializar;
end;

procedure TfrmMantenimientoAbogados.cmdCancelarClick(Sender: TObject);
begin
        Pdatos.Enabled := False;
        cmdAgregar.Enabled := True;
        cmdQuitar.Enabled := True;
end;

procedure TfrmMantenimientoAbogados.cmdQuitarClick(Sender: TObject);
begin
        if MessageDlg('Recuerde que si quita el abogado, se perderá toda relación de este'+#13+
                      'con cualquier colocación'+#13+
                      'Seguro de Quitar?',mtConfirmation,[mbyes,mbno],0) = mryes then begin
           with IBSQL1 do begin
              Close;
              SQL.Clear;
              SQL.Add('delete from "gen$abogados" where ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
              ParamByName('ID_IDENTIFICACION').AsInteger := IBQAbogados.FieldByName('ID_IDENTIFICACION').AsInteger;
              ParamByName('ID_PERSONA').AsString := IBQAbogados.FieldByName('ID_PERSONA').AsString;
              try
               ExecQuery;
               Transaction.Commit;
              except
               Transaction.Rollback;
               raise;
              end;
              inicializar;
           end;
        end;

end;

end.
