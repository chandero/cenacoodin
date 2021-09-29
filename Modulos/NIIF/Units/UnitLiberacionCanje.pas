unit UnitLiberacionCanje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DBCtrls, DB,
  IBCustomDataSet, IBQuery, IBSQL;

type
  TfrmLiberacionCanje = class(TForm)
    RadioGroup1: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    EdFecha1: TDateTimePicker;
    Label2: TLabel;
    EdFecha2: TDateTimePicker;
    TabSheet2: TTabSheet;
    DBLCBTiposCaptacion: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    CmdAceptar: TBitBtn;
    CmdCancelar: TBitBtn;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    EdNumeroCaptacion: TMemo;
    EdNombre: TStaticText;
    EdDigito: TStaticText;
    IBSQL1: TIBSQL;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    EdCheque: TEdit;
    IBQuery2: TIBQuery;
    DataSource2: TDataSource;
    DBLCBBancos: TDBLookupComboBox;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    Panel2: TPanel;
    RGPlaza: TRadioGroup;
    PgC: TPageControl;
    TabCheques: TTabSheet;
    TabMonedas: TTabSheet;
    PageControl3: TPageControl;
    TabSheet4: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    EdFecha1M: TDateTimePicker;
    EdFecha2M: TDateTimePicker;
    TabSheet5: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    DBLCBTiposCaptacionMon: TDBLookupComboBox;
    EdNumeroCaptacionMon: TMemo;
    EdNombreMon: TStaticText;
    EdDigitoMon: TStaticText;
    RGLibMon: TRadioGroup;
    procedure CmdCancelarClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroCaptacionKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdNumeroCaptacionExit(Sender: TObject);
    procedure DBLCBTiposCaptacionExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure EdNumeroCaptacionMonExit(Sender: TObject);
    procedure EdNumeroCaptacionMonKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBTiposCaptacionMonExit(Sender: TObject);
    procedure RGLibMonClick(Sender: TObject);
  private
    { Private declarations }
    procedure CasoFechas;
    procedure CasoCaptacion;
    procedure CasoCheque;
    procedure CasoFechasM;
    procedure CasoCaptacionM;
  public

    { Public declarations }
  end;

var
  frmLiberacionCanje: TfrmLiberacionCanje;
  Captacion:Integer;
  TipoCaptacion:Integer;
  vCanje:Integer;

implementation

{$R *.dfm}

uses UnitdmGeneral, UnitGlobales;

procedure TfrmLiberacionCanje.CmdCancelarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmLiberacionCanje.RadioGroup1Click(Sender: TObject);
begin
        PageControl1.ActivePageIndex := RadioGroup1.ItemIndex;
end;

procedure TfrmLiberacionCanje.FormShow(Sender: TObject);
begin
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;
        IBQuery1.Open;
        IBQuery1.Last;
        IBQuery2.Open;
        IBQuery2.Last;
        DBLCBTiposCaptacion.KeyValue := 1;
        DBLCBTiposCaptacionMon.KeyValue := 1;
        TipoCaptacion := 1;
        PgC.ActivePageIndex:=0;
end;

procedure TfrmLiberacionCanje.EdNumeroCaptacionKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmLiberacionCanje.FormKeyPress(Sender: TObject; var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmLiberacionCanje.EdNumeroCaptacionExit(Sender: TObject);
begin
        if EdNumeroCaptacion.Text <> '' then Captacion := StrToInt(Ednumerocaptacion.Text)
        else
        begin
          MessageDlg('Captación No Valida',mtError,[mbcancel],0);
          Exit;
        end;
        EdNumeroCaptacion.Text := Format('%.7d',[Captacion]);
        EdDigito.Caption := DigitoControl(TipoCaptacion,EdNumeroCaptacion.Text);

        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('Select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "cap$maestro"');
         SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
         SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
         SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
         SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
         SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
         SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
         SQL.Add('WHERE "cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
         SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
         ParamByName('NUMERO_CUENTA').AsInteger := Captacion;
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigito.Caption);
         try
           ExecQuery;
         except
           MessageDlg('Error al Localizar Captación',mtError,[mbcancel],0);
         end;
         EdNombre.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                             FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                             FieldByName('NOMBRE').AsString;
        end;
end;

procedure TfrmLiberacionCanje.DBLCBTiposCaptacionExit(Sender: TObject);
begin
        TipoCaptacion := DBLCBTiposCaptacion.KeyValue;
end;

procedure TfrmLiberacionCanje.CmdAceptarClick(Sender: TObject);
begin
     case PgC.TabIndex of
     0:
        case RadioGroup1.ItemIndex of
         0: CasoFechas;
         1: CasoCaptacion;
         2: CasoCheque;
        end;
     1:
        case RgLibMon.ItemIndex of
         0: CasoFechasM;
         1: CasoCaptacionM;
        end;
     end;
end;

procedure TfrmLiberacionCanje.CasoFechas;
begin
        if EdFecha2.Date < EdFecha1.Date then
        begin
           MessageDlg('Error en la configuración de fechas, verifique!',mterror,[mbcancel],0);
           Exit;
        end;
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "tes$cheques" where ');
          SQL.Add('FECHA_RECIBIDO BETWEEN :FECHA1 and :FECHA2 and CONSIGNADO = 1');
          case RGPlaza.ItemIndex of
               0: begin
                    SQL.Add('and PLAZA = :PLAZA');
                    ParamByName('PLAZA').AsString := 'L';
                  end;
               1: begin
                    SQL.Add('and PLAZA = :PLAZA');
                    ParamByName('PLAZA').AsString := 'O';
                  end;
          end;
          ParamByName('FECHA1').AsDate := EdFecha1.Date;
          ParamByName('FECHA2').AsDate := EdFecha2.Date;
          try
           ExecQuery;
           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('UPDATE "cap$canje" SET LIBERADO = 1, FECHA_LIBERADO = :FECHA WHERE ');
           IBSQL2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL2.SQL.Add('ID_BANCO = :ID_BANCO and NUMERO_CHEQUE = :NUMERO_CHEQUE');
           IBSQL3.Close;
           IBSQL3.SQL.Clear;
           IBSQL3.SQL.Add('UPDATE "tes$cheques" SET LIBERADO = 1, FECHA_PROCESADO = :FECHA WHERE');
           IBSQL3.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL3.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL3.SQL.Add('ID_BANCO = :ID_BANCO and NUMERO_CHEQUE = :NUMERO_CHEQUE');
           while not Eof do begin
               IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
               IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               IBSQL2.ParamByName('FECHA').AsDate := Date;
               IBSQL2.ParamByName('ID_BANCO').AsInteger := FieldByName('ID_BANCO').AsInteger;
               IBSQL2.ParamByName('NUMERO_CHEQUE').AsInteger := FieldByName('NUMERO_CHEQUE').AsInteger;
               try
                 IBSQL2.ExecQuery;
                  IBSQL3.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                  IBSQL3.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
                  IBSQL3.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL3.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  IBSQL3.ParamByName('FECHA').AsDate := Date;
                  IBSQL3.ParamByName('ID_BANCO').AsInteger := FieldByName('ID_BANCO').AsInteger;
                  IBSQL3.ParamByName('NUMERO_CHEQUE').AsInteger := FieldByName('NUMERO_CHEQUE').AsInteger;
                  try
                    IBSQL3.ExecQuery;
                  except
                    MessageDlg('Error al marcar cheque liberado',mtError,[mbcancel],0);
                    IBSQL3.Transaction.Rollback;
                    Exit;
                  end;
               except
                 MessageDlg('Error al Marcar Devolución',mtError,[mbcancel],0);
                 IBSQL2.Transaction.Rollback;
                 Exit;
               end;
               Next;
           end;
          except
           MessageDlg('Error al buscar cheques',mtError,[mbcancel],0);
           Transaction.Rollback;
           Exit;
          end;
        end;

        IBSQL1.Transaction.Commit;
        MessageDlg('Proceso Culminado con Exito!',mtInformation,[mbok],0);
end;

procedure TfrmLiberacionCanje.CasoCaptacion;
begin
       if (DBLCBTiposCaptacion.KeyValue < 1) or
          (EdNumeroCaptacion.Text = '') then
       begin
           MessageDlg('Debe especificar un número de captación',mtError,[mbcancel],0);
           Exit;
       end;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "tes$cheques" where ');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and CONSIGNADO = 1');
          case RGPlaza.ItemIndex of
               0: begin
                    SQL.Add('and PLAZA = :PLAZA');
                    ParamByName('PLAZA').AsString := 'L';
                  end;
               1: begin
                    SQL.Add('and PLAZA = :PLAZA');
                    ParamByName('PLAZA').AsString := 'O';
                  end;
          end;
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := Captacion;
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigito.Caption);
          try
           ExecQuery;
           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('UPDATE "cap$canje" SET LIBERADO = 1, FECHA_LIBERADO = :FECHA WHERE ');
           IBSQL2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL2.SQL.Add('ID_BANCO = :ID_BANCO and NUMERO_CHEQUE = :NUMERO_CHEQUE');
           IBSQL3.Close;
           IBSQL3.SQL.Clear;
           IBSQL3.SQL.Add('UPDATE "tes$cheques" SET LIBERADO = 1, FECHA_PROCESADO = :FECHA WHERE');
           IBSQL3.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL3.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL3.SQL.Add('ID_BANCO = :ID_BANCO and NUMERO_CHEQUE = :NUMERO_CHEQUE');
           while not Eof do begin
               IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
               IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               IBSQL2.ParamByName('FECHA').AsDate := Date;
               IBSQL2.ParamByName('ID_BANCO').AsInteger := FieldByName('ID_BANCO').AsInteger;
               IBSQL2.ParamByName('NUMERO_CHEQUE').AsInteger := FieldByName('NUMERO_CHEQUE').AsInteger;
               try
                 IBSQL2.ExecQuery;
                  IBSQL3.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                  IBSQL3.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
                  IBSQL3.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL3.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  IBSQL3.ParamByName('FECHA').AsDate := Date;
                  IBSQL3.ParamByName('ID_BANCO').AsInteger := FieldByName('ID_BANCO').AsInteger;
                  IBSQL3.ParamByName('NUMERO_CHEQUE').AsInteger := FieldByName('NUMERO_CHEQUE').AsInteger;
                  try
                    IBSQL3.ExecQuery;
                  except
                    MessageDlg('Error al buscar cheque para liberar canje',mtError,[mbcancel],0);
                    IBSQL3.Transaction.Rollback;
                    Exit;
                  end;
               except
                 MessageDlg('Error al Marcar cheque liberado',mtError,[mbcancel],0);
                 IBSQL2.Transaction.Rollback;
                 Exit;
               end;
               Next;
           end;
          except
           MessageDlg('Error al buscar cheques',mtError,[mbcancel],0);
           Transaction.Rollback;
           Exit;
          end;
        end;

        IBSQL1.Transaction.Commit;
        MessageDlg('Proceso Culminado con Exito!',mtInformation,[mbok],0);

end;

procedure TfrmLiberacionCanje.CasoCheque;
begin
         if  (DBLCBBancos.KeyValue < 1) or
             ( EdCheque.Text = '') then begin
          MessageDlg('Debe Seleccionar un banco y número de cheque',mtError,[mbcancel],0);
          Exit;
         end;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "tes$cheques" where ');
          SQL.Add('ID_BANCO = :ID_BANCO and NUMERO_CHEQUE = :NUMERO_CHEQUE and CONSIGNADO = 1');
          ParamByName('ID_BANCO').AsInteger := DBLCBBancos.KeyValue;
          ParamByName('NUMERO_CHEQUE').AsInteger := StrToInt(EdCheque.Text);
          try
           ExecQuery;
           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('UPDATE "cap$canje" SET LIBERADO = 1, FECHA_LIBERADO = :FECHA WHERE ');
           IBSQL2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL2.SQL.Add('ID_BANCO = :ID_BANCO and NUMERO_CHEQUE = :NUMERO_CHEQUE');
           IBSQL3.Close;
           IBSQL3.SQL.Clear;
           IBSQL3.SQL.Add('UPDATE "tes$cheques" SET LIBERADO = 1, FECHA_PROCESADO = :FECHA WHERE');
           IBSQL3.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL3.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL3.SQL.Add('ID_BANCO = :ID_BANCO and NUMERO_CHEQUE = :NUMERO_CHEQUE');
           while not Eof do begin
               IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
               IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               IBSQL2.ParamByName('FECHA').AsDate := Date;
               IBSQL2.ParamByName('ID_BANCO').AsInteger := FieldByName('ID_BANCO').AsInteger;
               IBSQL2.ParamByName('NUMERO_CHEQUE').AsInteger := FieldByName('NUMERO_CHEQUE').AsInteger;
               try
                 IBSQL2.ExecQuery;
                  IBSQL3.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                  IBSQL3.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
                  IBSQL3.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                  IBSQL3.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                  IBSQL3.ParamByName('FECHA').AsDate := Date;
                  IBSQL3.ParamByName('ID_BANCO').AsInteger := FieldByName('ID_BANCO').AsInteger;
                  IBSQL3.ParamByName('NUMERO_CHEQUE').AsInteger := FieldByName('NUMERO_CHEQUE').AsInteger;
                  try
                    IBSQL3.ExecQuery;
                  except
                    MessageDlg('Error al buscar cheque para liberar canje',mtError,[mbcancel],0);
                    IBSQL3.Transaction.Rollback;
                    Exit;
                  end;
               except
                 MessageDlg('Error al Marcar cheque liberado',mtError,[mbcancel],0);
                 IBSQL2.Transaction.Rollback;
                 Exit;
               end;
               Next;
           end;
          except
           MessageDlg('Error al buscar cheques',mtError,[mbcancel],0);
           Transaction.Rollback;
           Exit;
          end;
        end;

        IBSQL1.Transaction.Commit;
        MessageDlg('Proceso Culminado con Exito!',mtInformation,[mbok],0);


end;

procedure TfrmLiberacionCanje.CasoFechasM;
begin
        if EdFecha2.Date < EdFecha1.Date then
        begin
           MessageDlg('Error en la configuración de fechas, verifique!',mterror,[mbcancel],0);
           Exit;
        end;
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "cap$canje" where ');
          SQL.Add('FECHA_ENTRADA BETWEEN :FECHA1 and :FECHA2 and LIBERADO = 0 and VALOR_MONEDAS <> 0');
          ParamByName('FECHA1').AsDate := EdFecha1.Date;
          ParamByName('FECHA2').AsDate := EdFecha2.Date;
          try
           ExecQuery;
           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('UPDATE "cap$canje" SET LIBERADO = 1, FECHA_LIBERADO = :FECHA WHERE ');
           IBSQL2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL2.SQL.Add('FECHA_ENTRADA BETWEEN :FECHA1 and :FECHA2 and LIBERADO = 0 and VALOR_MONEDAS <> 0');
           while not Eof do begin
               IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
               IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               IBSQL2.ParamByName('FECHA').AsDate := Date;
               IBSQL2.ParamByName('FECHA1').AsDate := EdFecha1.Date;
               IBSQL2.ParamByName('FECHA2').AsDate := EdFecha2.Date;
               try
                 IBSQL2.ExecQuery;
               except
                 MessageDlg('Error al Marcar Liberación',mtError,[mbcancel],0);
                 IBSQL2.Transaction.Rollback;
                 Exit;
               end;
               Next;
           end;
          except
           MessageDlg('Error al buscar monedas',mtError,[mbcancel],0);
           Transaction.Rollback;
           Exit;
          end;
        end;

        IBSQL1.Transaction.Commit;
        MessageDlg('Proceso Culminado con Exito!',mtInformation,[mbok],0);
end;

procedure TfrmLiberacionCanje.CasoCaptacionM;
begin
       if (DBLCBTiposCaptacionMon.KeyValue < 1) or
          (EdNumeroCaptacionMon.Text = '') then
       begin
           MessageDlg('Debe especificar un número de captación',mtError,[mbcancel],0);
           Exit;
       end;

        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select * from "cap$canje" where ');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and LIBERADO = 0 and VALOR_MONEDAS <> 0');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacionMon.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := Captacion;
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoMon.Caption);
          try
           ExecQuery;
           IBSQL2.Close;
           IBSQL2.SQL.Clear;
           IBSQL2.SQL.Add('UPDATE "cap$canje" SET LIBERADO = 1, FECHA_LIBERADO = :FECHA WHERE ');
           IBSQL2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
           IBSQL2.SQL.Add('LIBERADO = 0 and VALOR_MONEDAS <> 0');
           while not IBSQL1.Eof do begin
               IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
               IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
               IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
               IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
               IBSQL2.ParamByName('FECHA').AsDate := Date;
               try
                 IBSQL2.ExecQuery;
               except
                 MessageDlg('Error al Marcar Moneda Liberado',mtError,[mbcancel],0);
                 IBSQL2.Transaction.Rollback;
                 Exit;
               end;
               IBSQL1.Next;
           end;
          except
           MessageDlg('Error al buscar Monedas',mtError,[mbcancel],0);
           Transaction.Rollback;
           Exit;
          end;
        end;

        IBSQL1.Transaction.Commit;
        MessageDlg('Proceso Culminado con Exito!',mtInformation,[mbok],0);

end;


procedure TfrmLiberacionCanje.EdNumeroCaptacionMonExit(Sender: TObject);
begin
        if EdNumeroCaptacionMon.Text <> '' then Captacion := StrToInt(EdNumeroCaptacionMon.Text)
        else
        begin
          MessageDlg('Captación No Valida',mtError,[mbcancel],0);
          Exit;
        end;
        EdNumeroCaptacionMon.Text := Format('%.7d',[Captacion]);
        EdDigitoMon.Caption := DigitoControl(TipoCaptacion,EdNumeroCaptacionMon.Text);

        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('Select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE from "cap$maestro"');
         SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and');
         SQL.Add('"cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
         SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and');
         SQL.Add('"cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
         SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
         SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
         SQL.Add('WHERE "cap$maestro".ID_AGENCIA = :ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
         SQL.Add('"cap$maestro".NUMERO_CUENTA = :NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = :DIGITO_CUENTA and');
         SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := TipoCaptacion;
         ParamByName('NUMERO_CUENTA').AsInteger := Captacion;
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoMon.Caption);
         try
           ExecQuery;
         except
           MessageDlg('Error al Localizar Captación',mtError,[mbcancel],0);
         end;
         EdNombreMon.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                             FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                             FieldByName('NOMBRE').AsString;
        end;

end;

procedure TfrmLiberacionCanje.EdNumeroCaptacionMonKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmLiberacionCanje.DBLCBTiposCaptacionMonExit(Sender: TObject);
begin
        TipoCaptacion := DBLCBTiposCaptacionMon.KeyValue;
end;

procedure TfrmLiberacionCanje.RGLibMonClick(Sender: TObject);
begin
        PageControl3.ActivePageIndex := RGLibMon.ItemIndex;
end;

end.
