unit UnitLiberacionCanje;

interface

uses
  //propias
    UnitClaseXml,
  //Del Sistemas
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DBCtrls, DB,
  IBCustomDataSet, IBQuery, IBSQL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient;

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
    TabSheet6: TTabSheet;
    RAgencia: TRadioGroup;
    PageAgencia: TPageControl;
    TabFecha: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    DtFecha1: TDateTimePicker;
    DtFecha2: TDateTimePicker;
    TabCaptacion: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    DbAgTipo: TDBLookupComboBox;
    EdAgNumero: TMemo;
    sAgAsociado: TStaticText;
    sAgDg: TStaticText;
    TabCheque: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    EdAgCheque: TEdit;
    DbAgBanco: TDBLookupComboBox;
    sdAgencia: TGroupBox;
    DbAgencia: TDBLookupComboBox;
    DsAgencia: TDataSource;
    IBAgencia: TIBQuery;
    IdTCPClient1: TIdTCPClient;
    Label17: TLabel;
    edChequeAg: TMemo;
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
    procedure RAgenciaClick(Sender: TObject);
    procedure DbAgTipoExit(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure edChequeAgExit(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
  private
    { Private declarations }
    procedure CasoFechas;
    procedure CasoCaptacion;
    procedure CasoCheque;
    procedure CasoFechasM;
    procedure CasoCaptacionM;
    procedure CasoAgencia;
    function EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string; AstreamEnv: TMemoryStream): TMemoryStream;
  public

    { Public declarations }
  end;

var
  frmLiberacionCanje: TfrmLiberacionCanje;
  Captacion:Integer;
  TipoCaptacion:Integer;
  vCanje:Integer;
  _bConexion :Boolean;

implementation

{$R *.dfm}

uses UnitdmGeneral, UnitGlobales, UnitPantallaProgreso;

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
        IBAgencia.Close;
        IBAgencia.ParamByName('IDAGENCIA').AsInteger := Agencia;
        IBAgencia.Open;
        IBAgencia.Last;
        DBLCBTiposCaptacion.KeyValue := 1;
        DBLCBTiposCaptacionMon.KeyValue := 1;
        TipoCaptacion := 1;
        PgC.ActivePageIndex:=0;
        DtFecha1.DateTime := fFechaActual;
        DtFecha2.DateTime := fFechaActual;        
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
        with IBSQL1 do
        begin
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
     if MessageDlg('Esta Seguro(a) de Realizar la Transacción...?',mtInformation,[mbYes,mbNo],0) = mrNo then
        Exit;
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
     2: CasoAgencia;
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
          SQL.Add('FECHA_RECIBIDO BETWEEN :FECHA1 and :FECHA2 and CONSIGNADO = 1 and ID_AGENCIA = :ID_AGENCIA');
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
          ParamByName('ID_AGENCIA').AsInteger := Agencia;          
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

procedure TfrmLiberacionCanje.RAgenciaClick(Sender: TObject);
begin
        RAgencia.ItemIndex := 1;
        PageAgencia.ActivePageIndex := RAgencia.ItemIndex;
end;

procedure TfrmLiberacionCanje.DbAgTipoExit(Sender: TObject);
begin
        TipoCaptacion := DbAgTipo.KeyValue;
end;

procedure TfrmLiberacionCanje.CasoAgencia;
var _tXml,_tXmlEnvio :TXml;
    _sSentencia :string;
    Astream1,Astream2 :TMemoryStream;
    _sDescripcionAg :string;
    _sMensaje :string;
begin
        RAgencia.ItemIndex := 1;
        case RAgencia.ItemIndex of
          0: _sSentencia := 'FECHA_RECIBIDO BETWEEN ' + QuotedStr(DateToStr(DtFecha1.Date)) + ' and  ' + QuotedStr(DateToStr(DtFecha2.Date)) + ' and CONSIGNADO = 1';
          1: _sSentencia := 'ID_TIPO_CAPTACION = ' + IntToStr(DbAgTipo.KeyValue)+ ' and ' +
                            ' NUMERO_CUENTA = ' + EdAgNumero.Text + ' and DIGITO_CUENTA = ' + sAgDg.Caption + ' and NUMERO_CHEQUE = ' + EdChequeAG.Text;
          2: _sSentencia := 'ID_BANCO = ' + IntToStr(DbAgBanco.KeyValue) + ' and NUMERO_CHEQUE = ' + EdAgCheque.Text;
        end;
        _sSentencia := 'select * from "tes$cheques" where ' + _sSentencia + ' and CONSIGNADO = 1 and ID_AGENCIA = ' + IntToStr(Agencia);
        //ShowMessage(_sSentencia);

        _tXml := TXml.Create;
        _tXmlEnvio := TXml.Create;
        _tXmlEnvio.CrearXml;
        Astream1 := TMemoryStream.Create;
        _tXml.CrearXml;
        _tXml.Tipo := 'select';
        _tXml.Sentencia := _sSentencia;
        _tXml.CargarNodo;
        Astream1 := _tXml.CargarAstream;
        try
          _tXml.AstreamEnt := EnviarXml(BuscaServicio(DbAgencia.KeyValue,1).vPuerto,BuscaServicio(DbAgencia.KeyValue,1).vHost,DbAgencia.Text,Astream1);
        except
          _sMensaje := _sMensaje + ' ' + _sDescripcionAg;
        end;
        
        if _bConexion then
        begin
           _tXml.ListaConsulta := 'Consulta000';
           with _tXml.LeerXml do
           begin
             try
               if RecordCount > 0 then
               begin
                   //Proceso de Liberar el Canje y Agencia
                  if IBSQL2.Transaction.InTransaction then
                     IBSQL2.Transaction.Rollback;
                  IBSQL2.Transaction.StartTransaction;
                  IBSQL2.Close;
                  IBSQL2.SQL.Clear;
                  IBSQL2.SQL.Add('UPDATE "cap$canje" SET LIBERADO = 1, FECHA_LIBERADO = :FECHA WHERE ');
                  IBSQL2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                  IBSQL2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
                  IBSQL2.SQL.Add('ID_BANCO = :ID_BANCO and NUMERO_CHEQUE = :NUMERO_CHEQUE');
                  while not Eof do
                  begin
                    IBSQL2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
                    IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := fieldbyname('ID_TIPO_CAPTACION').AsInteger;
                    IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('FECHA').AsDate := Date;
                    IBSQL2.ParamByName('ID_BANCO').AsInteger := FieldByName('ID_BANCO').AsInteger;
                    IBSQL2.ParamByName('NUMERO_CHEQUE').AsInteger := FieldByName('NUMERO_CHEQUE').AsInteger;
                    try
                      IBSQL2.ExecQuery;
                    except
                    begin
                      MessageDlg('Error al Marcar cheque liberado',mtError,[mbcancel],0);
                      IBSQL2.Transaction.Rollback;
                      Exit;
                    end;
                    end;
                    //cargar datos de la Agencia
                    _sSentencia :=   'UPDATE "tes$cheques" SET LIBERADO = 1,' +
                                     'FECHA_PROCESADO = ' + QuotedStr(DateToStr(fFechaActual)) + ' WHERE ' +
                                     'ID_AGENCIA = ' + IntToStr(FieldByName('ID_AGENCIA').AsInteger) +
                                     ' and ID_TIPO_CAPTACION = ' + FieldByName('ID_TIPO_CAPTACION').AsString +
                                     ' and NUMERO_CUENTA = ' + FieldByName('NUMERO_CUENTA').AsString +
                                     ' and DIGITO_CUENTA = ' + FieldByName('DIGITO_CUENTA').AsString +
                                     ' and ID_BANCO = ' + FieldByName('ID_BANCO').AsString +
                                     ' and NUMERO_CHEQUE = ' + FieldByName('NUMERO_CHEQUE').AsString;
                    _tXmlEnvio.Tipo := 'update';
                    _tXmlEnvio.Sentencia := _sSentencia;
                    _tXmlEnvio.CargarNodo;
                    Next;
                  end;
                 IBSQL2.Transaction.Commit;
                 Astream2 := TMemoryStream.Create;
                 Astream2 := _tXmlEnvio.CargarAstream;
                 try
                  _tXmlEnvio.AstreamEnt := EnviarXml(BuscaServicio(DbAgencia.KeyValue,1).vPuerto,BuscaServicio(DbAgencia.KeyValue,1).vHost,DbAgencia.Text,Astream2);
                 except
                  _sMensaje := _sMensaje + ' ' + _sDescripcionAg;
                 end;

                 MessageDlg('Proceso Culminado con Exito!',mtInformation,[mbok],0);

                   // fin del proceso de liberación de cheques

               end
               else
               begin
                  ShowMessage('No se Encontraron Registros, Favor revise');
                  Exit;
               end;
             except
             begin
               ShowMessage('No se Encontraros Datos, Favor revise');
               Exit;
             end;
             end;

           end;
        end
        else
          ShowMessage('No se logro Conexión');
end;

function TfrmLiberacionCanje.EnviarXml(_iIdPuerto: Integer; sIdHost,
  Desc: string; AstreamEnv: TMemoryStream): TMemoryStream;
var     Cadena :string;
        AStream : TMemoryStream;
        Tamano :Integer;
begin
        _bConexion := True;
        with IdTCPClient1 do
        begin
          Port :=_iIdPuerto;
          Host := sIdHost;
          try
            Application.ProcessMessages;
            Connect;
            if Connected then
            begin
              frmProgreso := TfrmProgreso.Create(self);
              frmProgreso.Titulo := 'Enviando Informacion de ' + Desc;
              frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
              Application.ProcessMessages;
              frmProgreso.Position := 2;
              frmProgreso.Min := 0;
              frmProgreso.Ejecutar;
              Cadena := ReadLn();
              WriteInteger(AStreamEnv.Size);
              OpenWriteBuffer;
              WriteStream(AStreamEnv);
              CloseWriteBuffer;
              //FreeAndNil(AStreamEnv);
              tamano := ReadInteger;
              AStream := TMemoryStream.Create;
              ReadStream(Astream,tamano,False);
              Disconnect;
              frmProgreso.Cerrar;
              Application.ProcessMessages;
            end;
          except
          on e: Exception do
          begin
            _bConexion := False;
            Disconnect;
          end;
        end;
        end;
        Result := AStream;
end;

procedure TfrmLiberacionCanje.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TfrmLiberacionCanje.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TfrmLiberacionCanje.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TfrmLiberacionCanje.edChequeAgExit(Sender: TObject);
var
        _cValorCheque :Currency;
begin
        if EdAgNumero.Text <> '' then Captacion := StrToInt(EdAgNumero.Text)
        else
        begin
          MessageDlg('Captación No Valida',mtError,[mbcancel],0);
          Exit;
        end;
        EdAgNumero.Text := Format('%.7d',[Captacion]);
        sAgDg.Caption := DigitoControl(TipoCaptacion,EdAgNumero.Text);

        with IBSQL1 do
        begin
         //Buscar datos del Canje
         Close;
         SQL.Clear;
         SQL.Add('SELECT');
         SQL.Add('"cap$canje".VALOR_CHEQUE');
         SQL.Add('FROM');
         SQL.Add('"cap$canje"');
         SQL.Add('WHERE');
         SQL.Add('"cap$canje".ID_AGENCIA = :ID_AGENCIA AND');
         SQL.Add('"cap$canje".ID_TIPO_CAPTACION = :TP AND');
         SQL.Add('"cap$canje".NUMERO_CUENTA = :NM AND');
         SQL.Add('"cap$canje".DIGITO_CUENTA = :DG AND');
         SQL.Add('"cap$canje".NUMERO_CHEQUE = :CHEQUE AND');
         SQL.Add('"cap$canje".LIBERADO = 0');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('TP').AsInteger := TipoCaptacion;
         ParamByName('NM').AsInteger := Captacion;
         ParamByName('DG').AsInteger := StrToInt(sAgDg.Caption);
         ParamByName('CHEQUE').AsInteger := StrToInt(edChequeAg.Text);
         ExecQuery;
         _cValorCheque := FieldByName('VALOR_CHEQUE').AsCurrency;
         //Buscar datos de la cuenta
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
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(sAgDg.Caption);
         try
           ExecQuery;
         except
           MessageDlg('Error al Localizar Captación',mtError,[mbcancel],0);
         end;
         sAgAsociado.Caption := FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                             FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                             FieldByName('NOMBRE').AsString;
         if _cValorCheque > 0 then
         begin
            ShowMessage('Valor del Cheque: ' + CurrToStrF(_cValorCheque,ffCurrency,0));
            CmdAceptar.Enabled := True;
            CmdAceptar.SetFocus;
         end
         else
         begin
           ShowMessage('La Cuenta/Cheque no tiene Canjes pendientes, Favor revise...');
           CmdAceptar.Enabled := False;
         end;
        end;

end;

procedure TfrmLiberacionCanje.TabSheet6Show(Sender: TObject);
begin
        RAgencia.ItemIndex := 1;
end;

end.
