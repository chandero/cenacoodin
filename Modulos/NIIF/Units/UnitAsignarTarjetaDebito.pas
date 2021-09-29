unit UnitAsignarTarjetaDebito;

interface

uses
  StrUtils, Math, DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, Grids, XStringGrid, JvEdit, IBSQL, IBDatabase, IB, Mask,
  JvToolEdit, JvCurrEdit, JvTypedEdit, DBGrids, pr_Common, pr_TxClasses,
  pr_Classes, JvComponent, JvArrowBtn, Menus, sdXmlDocuments, UnitClaseXml,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TfrmAsignarTarjetaDebito = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBLCBTiposCaptacion: TDBLookupComboBox;
    CmdContinuar: TBitBtn;
    IBTiposCaptacion: TIBQuery;
    DSTiposCaptacion: TDataSource;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdPrimerApellidoTitAho: TStaticText;
    EdSegundoApellidoTitAho: TStaticText;
    EdNombresTitAho: TStaticText;
    GridTitulares: TXStringGrid;
    Label12: TLabel;
    EdNumeroAho: TJvEdit;
    EdDigitoAho: TStaticText;
    Panel2: TPanel;
    CmdOtra: TBitBtn;
    CmdAsignar: TBitBtn;
    CmdCerrar: TBitBtn;
    Label2: TLabel;
    EdTarjetaDebito: TStaticText;
    IBSQL1: TIBSQL;
    IBTTarjeta: TIBTransaction;
    IBMarcarTarjeta: TIBSQL;
    CmdCancelar: TBitBtn;
    CmdBloquear: TBitBtn;
    Label10: TLabel;
    EdEstado: TStaticText;
    CmdModificar: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdOpCajero: TJvIntegerEdit;
    EdOpPOS: TJvIntegerEdit;
    EdCupoCajero: TJvCurrencyEdit;
    EdCupoPOS: TJvCurrencyEdit;
    IBSQL2: TIBSQL;
    GroupBox3: TGroupBox;
    dbGhistoria: TDBGrid;
    IBQHistoria: TIBQuery;
    DSHistoria: TDataSource;
    Label11: TLabel;
    EdPromedio: TStaticText;
    GroupBox4: TGroupBox;
    DBRangos: TDBGrid;
    DSRangos: TDataSource;
    IBQRangos: TIBQuery;
    IBTRangos: TIBTransaction;
    IBQRangosID_RANGO: TSmallintField;
    IBQRangosDESDE: TIBBCDField;
    IBQRangosHASTA: TIBBCDField;
    IBQRangosCUPO_ATM: TIBBCDField;
    IBQRangosCUPO_POS: TIBBCDField;
    IBQRangosRETIRO_ATM: TIntegerField;
    IBQRangosRETIRO_POS: TIntegerField;
    Label13: TLabel;
    EdSaldoDisponible: TStaticText;
    IBDComprobante: TIBDataSet;
    IBDAuxiliar: TIBDataSet;
    IBSComprobante: TIBSQL;
    IBTComprobante: TIBTransaction;
    IBTGeneral: TIBTransaction;
    ReporteC: TprTxReport;
    IBAuxiliar: TIBQuery;
    IBAuxiliarID_COMPROBANTE: TIntegerField;
    IBAuxiliarDESCRIPCION_AGENCIA: TIBStringField;
    IBAuxiliarTIPO: TIBStringField;
    IBAuxiliarFECHADIA: TDateField;
    IBAuxiliarDESCRIPCION: TMemoField;
    IBAuxiliarPRIMER_APELLIDO: TIBStringField;
    IBAuxiliarSEGUNDO_APELLIDO: TIBStringField;
    IBAuxiliarNOMBRE: TIBStringField;
    IBAuxiliarCODIGO: TIBStringField;
    IBAuxiliarCUENTA: TIBStringField;
    IBAuxiliarDEBITO: TIBBCDField;
    IBAuxiliarCREDITO: TIBBCDField;
    IBSQL4: TIBSQL;
    IBTSaldos: TIBTransaction;
    btnImprimir: TJvArrowButton;
    PopupMenu1: TPopupMenu;
    Mnu01: TMenuItem;
    Mnu02: TMenuItem;
    IBTImpresos: TIBTransaction;
    IBSQLImpresos: TIBSQL;
    IBSQLAuxiliar: TIBSQL;
    ReporteS: TprReport;
    IdTCPClient1: TIdTCPClient;
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdNumeroAhoExit(Sender: TObject);
    procedure EdNumeroAhoKeyPress(Sender: TObject; var Key: Char);
    procedure GridTitularesClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CmdOtraClick(Sender: TObject);
    procedure CmdContinuarClick(Sender: TObject);
    procedure CmdAsignarClick(Sender: TObject);
    procedure CmdBloquearClick(Sender: TObject);
    procedure CmdCancelarClick(Sender: TObject);
    procedure CmdModificarClick(Sender: TObject);
    procedure DBRangosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Mnu01Click(Sender: TObject);
    procedure Mnu02Click(Sender: TObject);
    procedure IBQRangosAfterScroll(DataSet: TDataSet);
  private
    XmlPet,XmlRes: TsdXmlDocument;
    _TXml:TXml;
    Nodo,Nodo1:TXmlNode;
    Size:Integer;
    AStream:TMemoryStream;
    sentencia :string;
    tamano :Integer;
    host_server: string;
    puerto_server: Integer;
    procedure ActualizarListAho;
    procedure Inicializar;
    procedure CicloSaldos;
    function ValidarAsociado: Boolean;

    { Private declarations }
  public
    function EnviarXml(iIdPuerto:Integer;sIdHost,Desc:string;AstreamEnv:TMemoryStream): TMemoryStream;
    { Public declarations }
  end;

type
  PMyListAho = ^AListAho;
  AListAho = record
    TipoId: Integer;
    NumeroId: String;
    TipoT:Integer;
  end;
  

var
  frmAsignarTarjetaDebito: TfrmAsignarTarjetaDebito;
  MyListAho: TList;
  Tarjeta:string;
  Existencia:Integer;
  EstadoActual:Integer;


  Comprobante:Integer;
  Promedio:Currency;
  SaldoDisponible:Currency;
  HayPromedio:Boolean;
  PuedeAsignar:Boolean;

  Iniscroll:Boolean;

implementation

{$R *.dfm}

uses unitdmGeneral,UnitGlobales, UnitGlobalesCol, UnitdmCaptacion, UnitDmColocacion, UnitPantallaProgreso;

procedure TfrmAsignarTarjetaDebito.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmAsignarTarjetaDebito.FormShow(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmAsignarTarjetaDebito.EdNumeroAhoExit(Sender: TObject);
var ARecord: PMyListAho;
    I:Integer;
begin
        Iniscroll := True;

        if EdNumeroAho.Text <> '' then
        begin
           EdNumeroAho.Text := Format('%.7d',[StrToInt(EdNumeroAho.Text)]);
           EdDigitoAho.Caption := DigitoControl(DBLCBTiposCaptacion.KeyValue,EdNumeroAho.Text);
        end
        else
           Exit;

        MyListAho.Clear;
        with IBSQL1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select "cap$maestro".FIRMAS, "cap$maestro".SELLOS, "cap$maestro".PROTECTOGRAFOS, "cap$tiposestado".PERMITE_TARJETA, NUMERO_TITULAR,ID_IDENTIFICACION,ID_PERSONA, TIPO_TITULAR ');
            SQL.Add('from "cap$maestrotitular"');
            SQL.Add('inner join "cap$maestro" ON ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA) AND ');
            SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION) AND ("cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA) AND ("cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
            SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
            SQL.Add('where');
            SQL.Add('"cap$maestrotitular".ID_AGENCIA = :"ID_AGENCIA" and "cap$maestrotitular".ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" and ');
            SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :"NUMERO_CUENTA" and "cap$maestrotitular".DIGITO_CUENTA = :"DIGITO_CUENTA" ');
            SQL.Add('ORDER BY NUMERO_TITULAR');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
            try
              ExecQuery;
              if RecordCount > 0 then
              begin
                if FieldByName('PERMITE_TARJETA').AsInteger = 0 then
                begin
                  MessageDlg('No se puede manejar tarjeta en esta cuenta',mtError,[mbcancel],0);
                  CmdOtra.Click;
                end;

                if FieldByName('FIRMAS').AsInteger > 1 then
                begin
                   MessageDlg('Cuentas con más de una (1) firma no pueden manejar tarjeta débito',mtError,[mbCancel],0);
                   CmdOtra.Click;
                end;

                if FieldByName('SELLOS').AsInteger > 0 then
                begin
                   MessageDlg('Cuentas con manejo de sellos no pueden manejar tarjeta débito',mtError,[mbCancel],0);
                   CmdOtra.Click;
                end;

                if FieldByName('PROTECTOGRAFOS').AsInteger > 0 then
                begin
                   MessageDlg('Cuentas con manejo de protectografo no pueden manejar tarjeta débito',mtError,[mbCancel],0);
                   CmdOtra.Click;
                end;

                while not Eof do
                begin
                  New(ARecord);
                  ARecord^.TipoId := FieldByName('ID_IDENTIFICACION').AsInteger;
                  ARecord^.NumeroId := FieldByName('ID_PERSONA').AsString;
                  ARecord^.TipoT := FieldByName('TIPO_TITULAR').AsInteger;
                  MyListAho.Add(ARecord);
                  Next;
                end;
                ActualizarListAho;
                GridTitulares.Row := 1;
                GridTitularesClick(Sender);
              end
              else
              begin
              MessageDlg('Error consultando titulares en Captación',mtError,[mbcancel],0);
              Exit;
              end;
            except
              MessageDlg('Error consultando titulares en Captación',mtError,[mbcancel],0);
              Exit;
            end;

            CicloSaldos;
            EdPromedio.Caption := FormatCurr('$#,#0.00',Promedio);

            HayPromedio := True;
            Close;
            SQL.Clear;
            SQL.Add('select first 1 * from "cap$tarjetarangos"');
//            SQL.Add('where :PROMEDIO BETWEEN DESDE AND HASTA');
//            ParamByName('PROMEDIO').AsCurrency := Promedio;
            try
             ExecQuery;
             if RecordCount > 0 then
             begin
               EdCupoCajero.Value := FieldByName('CUPO_ATM').AsCurrency;
               EdCupoPOS.Value := FieldByName('CUPO_POS').AsCurrency;
               EdOpCajero.Value := FieldByName('RETIRO_ATM').AsInteger;
               EdOpPOS.Value := FieldByName('RETIRO_POS').AsInteger;
               HayPromedio := True;
             end;
            except
              MessageDlg('Error consultando cupos máximos',mtError,[mbcancel],0);
              Exit;
            end;

{            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$tarjetacupos" where ID_UNICO = 1');
            try
             ExecQuery;
             if RecordCount > 0 then
             begin
               EdCupoCajero.Value := FieldByName('CUPO_ATM').AsCurrency;
               EdCupoPOS.Value := FieldByName('CUPO_POS').AsCurrency;
               EdOpCajero.Value := FieldByName('TRANS_ATM').AsInteger;
               EdOpPOS.Value := FieldByName('TRANS_POS').AsInteger;
             end
             else
             begin
              MessageDlg('Error consultando cupos máximos',mtError,[mbcancel],0);
              Exit;
             end;
            except
              MessageDlg('Error consultando cupos máximos',mtError,[mbcancel],0);
              Exit;
            end;
}
            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$tarjetacuenta" where');
            SQL.Add('ID_AGENCIA =:ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
            SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA and');
            SQL.Add('((ID_ESTADO = 1) or (ID_ESTADO = 2))');
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
            try
              ExecQuery;
              if RecordCount > 0 then
              begin
                 PuedeAsignar := False;
//                 CmdAsignar.Enabled := False;
                 EstadoActual := FieldByName('ID_ESTADO').AsInteger;
                 GroupBox2.Enabled := False;
                 EdTarjetaDebito.Caption := FieldByName('ID_TARJETA').AsString;
                 Tarjeta := EdTarjetaDebito.Caption;
                 EdCupoCajero.Value := FieldByName('CUPO_ATM').AsCurrency;
                 EdCupoPOS.Value := FieldByName('CUPO_POS').AsCurrency;
                 EdOpCajero.Value := FieldByName('TRANS_ATM').AsInteger;
                 EdOpPOS.Value := FieldByName('TRANS_POS').AsInteger;
                 if FieldByName('ID_ESTADO').AsInteger = 1 then
                 begin
                   EdEstado.Font.Color := clGreen;
                   EdEstado.Caption := 'ACTIVA';
                   GroupBox1.Enabled := True;
                   CmdModificar.Enabled := True;
                   CmdBloquear.Enabled := True;
                   CmdCancelar.Enabled := True;
                 end
                 else
                 if FieldByName('ID_ESTADO').AsInteger = 2 then
                 begin
                   EdEstado.Font.Color := clBlack;
                   EdEstado.Caption := 'BLOQUEADA';
                   GroupBox1.Enabled := False;
                   CmdModificar.Enabled := False;
                   CmdBloquear.Caption := '&Desbloquear';
                   CmdBloquear.Enabled := True;
                   CmdCancelar.Enabled := True;
                 end
                 else
                 if FieldByName('ID_ESTADO').AsInteger = 3 then
                 begin
                   EdEstado.Font.Color := clRed;
                   EdEstado.Caption := 'CANCELADA';
                   GroupBox1.Enabled := False;
                   CmdModificar.Enabled := False;
                   CmdBloquear.Enabled := False;
                   CmdCancelar.Enabled := False;
                 end;
              end
              else
              begin
               if Existencia > 0 then begin
                  PuedeAsignar := True;
//                  CmdAsignar.Enabled := True;
//                  CmdAsignar.SetFocus;
               end;
               EdTarjetaDebito.Caption := '';
              end;
            except
              MessageDlg('Error consultando existencia de tarjeta',mtError,[mbcancel],0);
              Exit;
            end;

        end;

        IBQHistoria.SQL.Clear;
        IBQHistoria.SQL.Add('SELECT ');
        IBQHistoria.SQL.Add('  "cap$tarjetacuenta".ID_TARJETA,');
        IBQHistoria.SQL.Add('  "cap$tarjetaestado".DESCRIPCION');
        IBQHistoria.SQL.Add('FROM');
        IBQHistoria.SQL.Add('  "cap$tarjetacuenta"');
        IBQHistoria.SQL.Add('  INNER JOIN "cap$tarjetaestado" ON ("cap$tarjetacuenta".ID_ESTADO = "cap$tarjetaestado".ID_ESTADO)');
        IBQHistoria.SQL.Add('where');
        IBQHistoria.SQL.Add('ID_AGENCIA =:ID_AGENCIA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
        IBQHistoria.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and DIGITO_CUENTA = :DIGITO_CUENTA');
        IBQHistoria.ParamByName('ID_AGENCIA').AsInteger := Agencia;
        IBQHistoria.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
        IBQHistoria.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
        IBQHistoria.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
        try
         IBQHistoria.Open;
        except
         IBQHistoria.Transaction.Rollback;
         raise;
        end;

        with IBQRangos do
        begin
         if Transaction.InTransaction then
           Transaction.Rollback;
         Transaction.StartTransaction;
         Open;
        end;

            if not validarasociado then
            begin
               PuedeAsignar := False;
//             CmdOtra.Click;
//             Exit;
            end;


        if (HayPromedio) and (PuedeAsignar) then
        begin
          CmdAsignar.Enabled := True;
          CmdAsignar.SetFocus;
        end;

end;

procedure TfrmAsignarTarjetaDebito.EdNumeroAhoKeyPress(Sender: TObject;
  var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmAsignarTarjetaDebito.ActualizarListAho;
var i:Integer;
    ARecord:PMyListAho;
begin
              if MyListAho.Count <= 1 then
              begin
                 GridTitulares.RowCount := 2;
                 GridTitulares.Cells[0,1] := '';
                 GridTitulares.Cells[1,1] := '';
                 GridTitulares.Cells[2,1] := '';
                 GridTitulares.Cells[3,1] := '';
              end
              else
                 GridTitulares.RowCount := MyListAho.Count + 1;

              for i := 0 to MyListAho.Count-1 do
              begin
                ARecord := MyListAho.Items[i];
                GridTitulares.Cells[0,i+1] := Format('%.2d',[i+1]);
                GridTitulares.Cells[1,i+1] := Format('%d',[ARecord^.TipoId]);
                GridTitulares.Cells[2,i+1] := ARecord^.NumeroId;
                GridTitulares.Cells[3,i+1] := Format('%d',[ARecord^.TipoT]);
              end;

end;

procedure TfrmAsignarTarjetaDebito.GridTitularesClick(Sender: TObject);
var ARecord:PMyListAho;
begin
        if ( GridTitulares.Row > 0 ) and
           ( MyListAho.Count > 0 ) then
        begin
           ARecord := MyListAho.Items[GridTitulares.Row - 1];
           with IBSQL1 do
           begin
               Close;
               SQL.Clear;
               SQL.Add('select PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE FROM "gen$persona" where ');
               SQL.Add('ID_IDENTIFICACION = :"ID_ID" and ID_PERSONA = :"ID_PE"');
               ParamByName('ID_ID').AsInteger := ARecord^.TipoId;
               ParamByName('ID_PE').AsString := ARecord^.NumeroId;
               ExecQuery;
               if RecordCount = 1 then
               begin
                EdPrimerApellidotitAho.Caption := FieldByName('PRIMER_APELLIDO').AsString;
                EdSegundoApellidotitAho.Caption := FieldByName('SEGUNDO_APELLIDO').AsString;
                EdNombresTitAho.Caption := FieldByName('NOMBRE').AsString;
               end;
               Close;
           end;
        end;
end;

procedure TfrmAsignarTarjetaDebito.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmAsignarTarjetaDebito.Inicializar;
var
  Limite:Integer;
begin
        if IBTiposCaptacion.Transaction.InTransaction then
           IBTiposCaptacion.Transaction.Rollback;
        IBTiposCaptacion.Transaction.StartTransaction;
        IBTiposCaptacion.Open;
        IBTiposCaptacion.Last;
        try
           MyListAho := TList.Create;
        finally
        end;
        MyListAho.Clear;
        EdNumeroAho.Text := '';
        EdDigitoAho.Caption := '';
        with GridTitulares do
        begin
                RowCount := 2;
                Cells[0,1] := '';
                Cells[1,1] := '';
                Cells[2,1] := '';
                Cells[3,1] := '';
        end;
        EdPrimerApellidoTitAho.Caption := '';
        EdSegundoApellidoTitAho.Caption := '';
        EdNombresTitAho.Caption := '';
        EdTarjetaDebito.Caption := '';
        EdEstado.Caption := '';
        EdPromedio.Caption := '';
        EdSaldoDisponible.Caption := '';
        EdCupoCajero.Value := 0;
        EdCupoPOS.Value := 0;
        EdOpCajero.Value := 0;
        EdOpPOS.Value := 0;
        CmdModificar.Enabled := False;
        CmdAsignar.Enabled := False;
        CmdBloquear.Enabled := False;
        CmdCancelar.Enabled := False;
        GroupBox2.Enabled := False;
        GroupBox1.Enabled := False;
        Panel1.Enabled := True;
        DBLCBTiposCaptacion.SetFocus;
        btnImprimir.Enabled := False;

//Verificar Existencia de Tarjeta
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 16');
          try
           ExecQuery;
           Limite := FieldByName('VALOR_MINIMO').AsInteger;
          except
           Limite := 0;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select count(*) as TOTAL from "cap$tarjetasdebito" where ASIGNADA = 0');
          try
           ExecQuery;
           if RecordCount > 0 then begin
             Existencia := FieldByName('TOTAL').AsInteger;
             if Existencia < Limite then
             begin
               MessageDlg('Atención Existencia actual de tarjetas débito ' + IntToStr(Existencia) + ' disponibles'+#13+#10+'Por Favor Solicite',mtInformation,[mbok],0);
             end;
            end
            else
            begin
             Existencia := 0;
             MessageDlg('No se pudo establecer la cantidad de tarjetas débito disponibles',mtInformation,[mbok],0);
            end;
           except
             raise;
           end;
        end;

end;

procedure TfrmAsignarTarjetaDebito.CmdOtraClick(Sender: TObject);
begin
        Inicializar;
end;

procedure TfrmAsignarTarjetaDebito.CmdContinuarClick(Sender: TObject);
begin
        if DBLCBTiposCaptacion.KeyValue > 0 then begin
           Panel1.Enabled := False;
           GroupBox2.Enabled := True;
           EdNumeroAho.SetFocus;
        end;
end;

procedure TfrmAsignarTarjetaDebito.CmdAsignarClick(Sender: TObject);
const ntMaxTries = 100;
var 
    I,WaitCount:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
    FechaPro:TDate;
    FechaVencPro:TDate;
    Plazo:Integer;
    Cuota:Currency;
    TasaIva:Extended;
    ValorIngreso,ValorIva,ValorGMF:Currency;
    GMF:Extended;
    Dia,Dif:Integer;
    Codigo_Captacion, Codigo_Impuestos, Codigo_Comision, Codigo_Gasto, Codigo_GMF:string;
    Codigo_Tarjetas, Codigo_Sobreflex,Codigo_Acreedoras:string;
begin
        if not ValidarOpcion((Sender as TButton).Tag) then
        begin
           Exit;
        end;

        CmdAsignar.Enabled := False;
        Application.ProcessMessages;
        if MessageDlg('Seguro de Asignar la Tarjeta Débito?',mtConfirmation,[mbyes,mbno],0) = mrNo then
        begin
           CmdOtra.Click;
           Exit;
        end;

// Leer y Marcar Tarjeta
        while True do
         with IBMarcarTarjeta do begin
           if Transaction.InTransaction then
              Transaction.Commit;
           Transaction.StartTransaction;
           try
             Tarjeta := '';
             Close;
             SQL.Clear;
             SQL.Add('select FIRST 1 * from "cap$tarjetasdebito" where ASIGNADA = 0 ORDER BY ID_TARJETA');
             ExecQuery;
             Tarjeta := FieldByName('ID_TARJETA').AsString;
             Close;
             SQL.Clear;
             SQL.Add('update "cap$tarjetasdebito" SET ASIGNADA = 1, ID_ESTADO = 1 where ID_TARJETA = :ID_TARJETA');
             ParamByName('ID_TARJETA').AsString := Tarjeta;
             ExecQuery;
             Transaction.Commit;
             Break;

             //Marcar Tarjeta en Base Consolidada





           except
           on E: EIBInterBaseError do
           begin
            RecordLocked := False;
            if E.SQLCode = -913 then RecordLocked := True;
            if RecordLocked then
             begin
              WaitCount := Random(20);
              for I := 1 to WaitCount do
              Application.ProcessMessages;
              Continue;
             end
            else
             begin
              ErrorMsg := ErrorMsg + E.Message +
              ' (' + IntToStr(E.IBErrorCode ) + '). ';
              MessageDlg(ErrorMsg,mterror,[mbOk],0);
             end;
           end;
          end;
        end;

        with IBSQL1 do begin
// Buscar Valores Cuota Manejo y Otros
         Close;
         SQL.Clear;
         SQL.Add('select * from "gen$minimos" where ID_MINIMO = 19');
         try
          ExecQuery;
          Plazo := FieldByName('VALOR_MINIMO').AsInteger;
         except
          Transaction.Rollback;
          MessageDlg('Error al Consultar Parametros',mtError,[mbok],0);
          raise;
          Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add('select * from "gen$minimos" where ID_MINIMO = 20');
         try
          ExecQuery;
          Cuota := FieldByName('VALOR_MINIMO').AsCurrency;
         except
          Transaction.Rollback;
          MessageDlg('Error al Consultar Parametros',mtError,[mbok],0);
          raise;
          Exit;
         end;

// Marcar TarjetaCuenta
         Close;
         SQL.Clear;
         SQL.Add('insert into "cap$tarjetacuenta" (ID_TARJETA,ID_AGENCIA,ID_TIPO_CAPTACION,');
         SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,FECHA_ASIGNACION,HORA_ASIGNACION,ID_ESTADO,CUPO_ATM,CUPO_POS,TRANS_ATM,TRANS_POS) VALUES (');
         SQL.Add(':ID_TARJETA,:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:FECHA_ASIGNACION,');
         SQL.Add(':HORA_ASIGNACION,:ID_ESTADO,:CUPO_ATM,:CUPO_POS,:TRANS_ATM,:TRANS_POS)');
         ParamByName('ID_TARJETA').AsString := Tarjeta;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
         ParamByName('FECHA_ASIGNACION').AsDate := fFechaActual;
         ParamByName('HORA_ASIGNACION').AsTime := fHoraActual;
         ParamByName('ID_ESTADO').AsInteger := 1;
         ParamByName('CUPO_ATM').AsCurrency := EdCupoCajero.Value;
         ParamByName('CUPO_POS').AsCurrency := EdCupoPOS.Value;
         ParamByName('TRANS_ATM').AsInteger := EdOpCajero.Value;
         ParamByName('TRANS_POS').AsInteger := EdOpPOS.Value;
         try
          ExecQuery;
         except
          Transaction.Rollback;
          MessageDlg('Error al asignar tarjeta en TarjetaCuenta',mtError,[mbcancel],0);
          raise;
          Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add('insert into "cap$tarjetahistoria"');
         SQL.Add('(ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,ID_TARJETA,FECHA_NOVEDAD)');
         SQL.Add('values');
         SQL.Add('(:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ID_TARJETA,:FECHA_NOVEDAD)');
         ParamByName('ID_TARJETA').AsString := Tarjeta;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
         ParamByName('FECHA_NOVEDAD').AsDate := fFechaActual;
         try
          ExecQuery;
         except
          Transaction.Rollback;
          MessageDlg('Error al asignar tarjeta en TarjetaHistoria',mtError,[mbcancel],0);
          raise;
         end;

// Aplicar Descuento Cuota Administración
// Insertar en tabla de control de descuentos
         Close;
         SQL.Clear;
         SQL.Add('insert into "cap$tarjetactrlcuota" values (');
         SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,');
         SQL.Add(':ID_TARJETA,:FECHA_DESCUENTO,:FECHA_PROXIMO_DESCUENTO');
         SQL.ADD(')');
         ParamByName('ID_TARJETA').AsString := Tarjeta;
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
         ParamByName('FECHA_DESCUENTO').asDate := fFechaActual;

         FechaPro := fFechaActual;
         FechaVencPro := CalculoFecha(FechaPro,Plazo);
         Dif := Dia - DayOf(FechaPro);
         if Dif > 0 then
            FechaVencPro := CalculoFecha(FechaVencPro,Dif);
         ParamByName('FECHA_PROXIMO_DESCUENTO').AsDate := FechaVencPro;
         try
          ExecQuery;
         except
          Transaction.Rollback;
          MessageDlg('Error al tratar de registrar próximo descuento de cuota',mtError,[mbOk],0);
          raise;
         end;

// Fin Descuento por Cuota Administración

         IBSQL2.Close;
         IBSQL2.SQL.Clear;
         IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL');
         IBSQL2.SQL.Add('(:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO,:FECHA1,:FECHA2)');
         IBSQL2.ParamByName('ID_AGENCIA').AsInteger := Agencia;
         IBSQL2.ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         IBSQL2.ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
         IBSQL2.ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
         IBSQL2.ParamByName('ANO').AsString := IntToStr(YearOf(ffechaactual));
         IBSQL2.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(ffechaactual),01,01);
         IBSQL2.ParamByName('FECHA2').AsDate := fFechaActual;
         try
          IBSQL2.ExecQuery;
         except
          IBSQL2.Transaction.Rollback;
          raise;
         end;

         Close;
         SQL.Clear;
         SQL.Add('insert into "cap$saldosdia"');
         SQL.Add('(ID_AGENCIA,ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,SALDODIA)');
         SQL.Add('values');
         SQL.Add('(:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA,:SALDODIA)');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
         ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
         ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
         ParamByName('SALDODIA').AsCurrency := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
         try
          ExecQuery;
         except
// ya existe, solo actualizar saldo
          Close;
          SQL.Clear;
          SQL.Add('update "cap$saldosdia" set SALDODIA = :SALDODIA');
          SQL.Add('where ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
          SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
          ParamByName('SALDODIA').AsCurrency := IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency;
          try
           ExecQuery;
          except
           Transaction.Rollback;
           MessageDlg('Error al actualizar saldos de cuenta para tarjeta',mtError,[mbOk],0);
           raise;
           Exit;
          end;
         end;

        end;



// Contabilizar Cuota de Manejo
        if Cuota > 0 then
        begin
          with IBSQL1 do begin
// Buscar Valor del GMF
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$minimos" where ID_MINIMO = 12');
            try
             ExecQuery;
             GMF := FieldByName('VALOR_MINIMO').AsFloat;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Valor del GMF',mtError,[mbOk],0);
             raise;
             Exit;
            end;
// Buscar Valor Tasa I.V.A.
            Close;
            SQL.Clear;
            SQL.Add('select * from "gen$minimos" where ID_MINIMO = 22');
            try
             ExecQuery;
             TasaIva := FieldByName('VALOR_MINIMO').AsFloat;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Valor del IVA',mtError,[mbOk],0);
             raise;
             Exit;
            end;
// Busco codigo de la Captacion
            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$tipocaptacion" where ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION');
            ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            try
             ExecQuery;
             Codigo_Captacion := FieldByName('CODIGO_CONTABLE').AsString;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Codigos',mtError,[mbOk],0);
             raise;
             Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$contable" where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 10;
            try
             ExecQuery;
             Codigo_Impuestos := FieldByName('CODIGO_CONTABLE').AsString;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Codigos',mtError,[mbOk],0);
             raise;
             Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$contable" where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 11;
            try
             ExecQuery;
             Codigo_Comision := FieldByName('CODIGO_CONTABLE').AsString;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Codigos',mtError,[mbOk],0);
             raise;
             Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$contable" where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 4;
            try
             ExecQuery;
             Codigo_Gasto := FieldByName('CODIGO_CONTABLE').AsString;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Codigos',mtError,[mbOk],0);
             raise;
             Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$contable" where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 12;
            try
             ExecQuery;
             Codigo_GMF := FieldByName('CODIGO_CONTABLE').AsString;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Codigos',mtError,[mbOk],0);
             raise;
             Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$contable" where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 13;
            try
             ExecQuery;
             Codigo_Tarjetas  := FieldByName('CODIGO_CONTABLE').AsString;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Codigos',mtError,[mbOk],0);
             raise;
             Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$contable" where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 14;
            try
             ExecQuery;
             Codigo_Sobreflex  := FieldByName('CODIGO_CONTABLE').AsString;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Codigos',mtError,[mbOk],0);
             raise;
             Exit;
            end;

            Close;
            SQL.Clear;
            SQL.Add('select * from "cap$contable" where ID_CAPTACION = :ID_CAPTACION and ID_CONTABLE = :ID_CONTABLE');
            ParamByName('ID_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('ID_CONTABLE').AsInteger := 15;
            try
             ExecQuery;
             Codigo_Acreedoras  := FieldByName('CODIGO_CONTABLE').AsString;
            except
             Transaction.Rollback;
             MessageDlg('Error al Buscar Codigos',mtError,[mbOk],0);
             raise;
             Exit;
            end;

          end; // fin del with

// Buscar Consecutivo Comprobante
        Comprobante := ObtenerConsecutivo(IBSComprobante);
// Fin Comprobante
// Descontar Cuota del Extracto
        with IBSQL1 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "cap$extracto" values(');
            SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",');
            SQL.Add(':"DIGITO_CUENTA",:"FECHA_MOVIMIENTO",:"HORA_MOVIMIENTO",');
            SQL.Add(':"ID_TIPO_MOVIMIENTO",:"DOCUMENTO_MOVIMIENTO",:"DESCRIPCION_MOVIMIENTO",');
            SQL.Add(':"VALOR_DEBITO",:"VALOR_CREDITO")');
//Grabar Interes en Extracto
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
            ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
            ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
            ParamByName('FECHA_MOVIMIENTO').AsDate := fFechaActual;
            ParamByName('HORA_MOVIMIENTO').AsTime  := Time;
            ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 28;
            ParamByName('DOCUMENTO_MOVIMIENTO').AsString := Format('%.8d',[Comprobante]);
            ParamByName('DESCRIPCION_MOVIMIENTO').AsString := 'Descuento Cuota Admon Tarjeta Débito';
            ParamByName('VALOR_DEBITO').AsCurrency := 0;
            ParamByName('VALOR_CREDITO').AsCurrency := Cuota;
            try
              ExecQuery;
            except
              Transaction.Rollback;
              MessageDlg('Error al Descontar la Cuota de Administración',mtError,[mbOk],0);
              raise;
              Exit;
            end;
          end;
// Calculo Valores
//          ValorIngreso := SimpleRoundTo(Cuota / ((100+TasaIva)/100),0);
//          ValorIva := Cuota - ValorIngreso;
          ValorIngreso := Cuota;
          ValorIva := 0;
          ValorGMF := SimpleRoundTo((Cuota/1000) * GMF,0);

          with IBDComprobante do begin
             Open;
             Append;
             FieldByName('ID_COMPROBANTE').AsInteger := Comprobante;
             FieldByName('ID_AGENCIA').AsInteger := Agencia;
             FieldByName('TIPO_COMPROBANTE').AsInteger := 1;
             FieldByName('FECHADIA').AsDateTime := fFechaActual;
             FieldByName('DESCRIPCION').AsString := 'Descuento de Cuota de Manejo Tarjeta Debito Cta No.' + IntToStr(DBLCBTiposCaptacion.KeyValue) + Format('%.2d',[Agencia])+'-'+Format('%.7d',[StrToInt(EdNumeroAho.Text)])+'-'+EdDigitoAho.Caption;
             FieldByName('TOTAL_DEBITO').AsCurrency := Cuota;
             FieldByName('TOTAL_CREDITO').AsCurrency := Cuota;
             FieldByName('ESTADO').AsString := 'O';
             FieldByName('IMPRESO').AsInteger := 1;
             FieldByName('ANULACION').AsString := '';
             FieldByName('ID_EMPLEADO').AsString := DBAlias;
             Post;
          end;

          with IBSQLAuxiliar do begin
            Close;
            SQL.Clear;
            SQL.Add('insert into "con$auxiliar" values (');
            SQL.Add(':ID_COMPROBANTE,');
            SQL.Add(':ID_AGENCIA,');
            SQL.Add(':FECHA,');
            SQL.Add(':CODIGO,');
            SQL.Add(':DEBITO,');
            SQL.Add(':CREDITO,');
            SQL.Add(':ID_CUENTA,');
            SQL.Add(':ID_COLOCACION,');
            SQL.Add(':ID_IDENTIFICACION,');
            SQL.Add(':ID_PERSONA,');
            SQL.Add(':MONTO_RETENCION,');
            SQL.Add(':TASA_RETENCION,');
            SQL.Add(':ESTADOAUX');
            SQL.Add(')');

// Valor de Captaciones
            if Cuota > 0 then
            begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := Codigo_Captacion;
            ParamByName('DEBITO').AsCurrency := Cuota;
            ParamByName('CREDITO').AsCurrency := 0;
            ParamByName('ID_CUENTA').AsInteger :=StrToInt(EdNumeroAho.Text);
            ParamByName('ID_COLOCACION').AsString := '';
            ParamByName('ID_IDENTIFICACION').AsInteger := StrToInt(GridTitulares.Cells[1,1]);
            ParamByName('ID_PERSONA').AsString := GridTitulares.Cells[2,1];
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
             try
              ExecQuery;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;
            end;
// Valor de Iva
            if ValorIva > 0 then
            begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := Codigo_Impuestos;
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := ValorIva;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := StrToInt(GridTitulares.Cells[1,1]);
            ParamByName('ID_PERSONA').AsString := GridTitulares.Cells[2,1];
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
             try
              ExecQuery;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;

            end;
// Valor Ingresos
            if ValorIngreso > 0 then
            begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := Codigo_Comision;
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := ValorIngreso;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
             try
              ExecQuery;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;

            end;
// Valor Gastos por concepto de GMF
            if ValorGMF > 0 then
            begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := Codigo_Gasto;
            ParamByName('DEBITO').AsCurrency := ValorGMF ;
            ParamByName('CREDITO').AsCurrency := 0;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
             try
              ExecQuery;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;

            end;
// Valor GMF
            if ValorGMF > 0 then
            begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := Codigo_GMF;
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := ValorGMF;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
             try
              ExecQuery;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;
            end;
// Acredoras Tarjeta
            begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := Codigo_Tarjetas;
            ParamByName('DEBITO').AsCurrency := 1;
            ParamByName('CREDITO').AsCurrency := 0;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
             try
              ExecQuery;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;

            end;
// Acredoras Sobreflex
            begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := Codigo_Sobreflex;
            ParamByName('DEBITO').AsCurrency := 1;
            ParamByName('CREDITO').AsCurrency := 0;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
             try
              ExecQuery;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;

            end;
// Acreedores por contra
            begin
            ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
            ParamByName('ID_AGENCIA').AsInteger := Agencia;
            ParamByName('FECHA').AsDateTime := fFechaActual;
            ParamByName('CODIGO').AsString := Codigo_Acreedoras;
            ParamByName('DEBITO').AsCurrency := 0;
            ParamByName('CREDITO').AsCurrency := 2;
            ParamByName('ID_CUENTA').Clear;
            ParamByName('ID_COLOCACION').Clear;
            ParamByName('ID_IDENTIFICACION').AsInteger := 0;
            ParamByName('ID_PERSONA').Clear;
            ParamByName('MONTO_RETENCION').AsCurrency := 0;
            ParamByName('TASA_RETENCION').AsFloat := 0;
            ParamByName('ESTADOAUX').AsString := 'O';
             try
              ExecQuery;
             except
              Transaction.Rollback;
              raise;
              Exit;
             end;

            end;

            Transaction.Commit;
          end;
        end; // fin del if
        EdTarjetaDebito.Caption := Tarjeta;
        GroupBox2.Enabled := False;

// Imprimir Comprobante
        with IBAuxiliar do
        begin
             if Transaction.InTransaction then
                Transaction.Rollback;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
             SQL.Add('"con$comprobante".FECHADIA,');
             SQL.Add('"con$comprobante".DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('"con$auxiliar".CODIGO,');
             SQL.Add('"con$puc".NOMBRE AS CUENTA,');
             SQL.Add('"con$auxiliar".DEBITO,');
             SQL.Add('"con$auxiliar".CREDITO');
             SQL.Add('from ');
             SQL.Add('"con$comprobante" ');
             SQL.Add('INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
             SQL.Add('INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('("con$comprobante".ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             try
              Open;
              ReporteC.Variables.ByName['EMPRESA'].AsString := Empresa;
              ReporteC.Variables.ByName['NIT'].AsString := Nit;
              if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
              Close;
             except
               MessageDlg('Error generando el comprobante',mtError,[mbcancel],0);
               Close;
             end;
             Transaction.Commit;
        end;
// Fin Impresión Comprobante

        btnImprimir.Enabled := True;
end;

procedure TfrmAsignarTarjetaDebito.CmdBloquearClick(Sender: TObject);
begin

        if not ValidarOpcion((Sender as TButton).Tag) then
        begin
           Exit;
        end;

        if EstadoActual <> 2 then
        begin
         if MessageDlg('Seguro de Bloquear la Tarjeta Débito?',mtConfirmation,[mbyes,mbno],0) = mrNo then
         begin
           CmdOtra.Click;
           Exit;
         end;
        end
        else
        begin
         if MessageDlg('Seguro de Desbloquear la Tarjeta Débito?',mtConfirmation,[mbyes,mbno],0) = mrNo then
         begin
           CmdOtra.Click;
           Exit;
         end;
        end;

        with IBSQL1 do begin
{
          Close;
          SQL.Clear;
          SQL.Add('delete from "cap$saldosdia" where');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
          SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
          try
           ExecQuery;
          except
           Transaction.Rollback;
           MessageDlg('Tarjeta No se pudo Cancelar! Error al Eliminar cap$saldosdia',mtInformation,[mbok],0);
           raise;
          end;
}
          Close;
          SQL.Clear;
          SQL.Add('update "cap$tarjetacuenta" set ID_ESTADO = :ID_ESTADO, FECHA_BLOQUEO = :FECHA');
          SQL.Add('where ID_TARJETA = :ID_TARJETA');
          ParamByName('ID_TARJETA').AsString := Tarjeta;
          ParamByName('FECHA').AsDate := fFechaActual;
          if EstadoActual = 2 then
           ParamByName('ID_ESTADO').AsInteger := 1
          else
           ParamByName('ID_ESTADO').AsInteger := 2;
          try
           ExecQuery;
          except
           MessageDlg('Tarjeta No se pudo Bloquear!',mtInformation,[mbok],0);
           Transaction.Rollback;
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('update "cap$tarjetasdebito" set ID_ESTADO = :ID_ESTADO');
          SQL.Add('where ID_TARJETA = :ID_TARJETA');
          ParamByName('ID_TARJETA').AsString := Tarjeta;
          if EstadoActual = 2 then
           ParamByName('ID_ESTADO').AsInteger := 1
          else
           ParamByName('ID_ESTADO').AsInteger := 2;
          try
           ExecQuery;
           Transaction.Commit;
           
          if EstadoActual = 2 then
           MessageDlg('Tarjeta Desbloqueada con Exito!',mtInformation,[mbok],0)
          else
           MessageDlg('Tarjeta Bloqueada con Exito!',mtInformation,[mbok],0);

          except
           MessageDlg('Tarjeta No se pudo (Des)Bloquear!',mtInformation,[mbok],0);
           Transaction.Rollback;
           raise;
          end;
        end;

        CmdBloquear.Enabled := False;
        CmdCancelar.Enabled := False;
        CmdAsignar.Enabled := False;
        CmdModificar.Enabled := False;
        GroupBox1.Enabled := False;
        EdEstado.Font.Color := clBlack;
        if EstadoActual = 2 then
           EdEstado.Caption := 'ACTIVA'
        else
           EdEstado.Caption := 'BLOQUEADA';


end;

procedure TfrmAsignarTarjetaDebito.CmdCancelarClick(Sender: TObject);
begin
        if not ValidarOpcion((Sender as TButton).Tag) then
        begin
           Exit;
        end;

        if MessageDlg('Seguro de Cancelar la Tarjeta Débito?',mtConfirmation,[mbyes,mbno],0) = mrNo then
        begin
          CmdOtra.Click;
          Exit;
        end;

        with IBSQL1 do begin

          Close;
          SQL.Clear;
          SQL.Add('delete from "cap$saldosdia" where');
          SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
          SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
          SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
          SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
          ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
          ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
          try
           ExecQuery;
          except
           Transaction.Rollback;
           MessageDlg('Tarjeta No se pudo Cancelar! Error al Eliminar cap$saldosdia',mtInformation,[mbok],0);
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('update "cap$tarjetacuenta" set ID_ESTADO = 3, FECHA_CANCELADA = :FECHA');
          SQL.Add('where ID_TARJETA = :ID_TARJETA');
          ParamByName('ID_TARJETA').AsString := Tarjeta;
          ParamByName('FECHA').AsDate := fFechaActual;
          try
           ExecQuery;
          except
           MessageDlg('Tarjeta No se pudo Cancelar!',mtInformation,[mbok],0);
           Transaction.Rollback;
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('update "cap$tarjetasdebito" set ID_ESTADO = 3');
          SQL.Add('where ID_TARJETA = :ID_TARJETA');
          ParamByName('ID_TARJETA').AsString := Tarjeta;
          try
           ExecQuery;
           Transaction.Commit;
           MessageDlg('Tarjeta Cancelada con Exito!',mtInformation,[mbok],0);
          except
           MessageDlg('Tarjeta No se pudo Cancelar!',mtInformation,[mbok],0);
           Transaction.Rollback;
           raise;
          end;
        end;

        CmdBloquear.Enabled := False;
        CmdCancelar.Enabled := False;
        CmdAsignar.Enabled := False;
        CmdModificar.Enabled := False;
        GroupBox1.Enabled := False;
        EdEstado.Font.Color := clRed;
        EdEstado.Caption := 'CANCELADA';

end;

procedure TfrmAsignarTarjetaDebito.CmdModificarClick(Sender: TObject);
begin
        if not ValidarOpcion((Sender as TButton).Tag) then
        begin
           Exit;
        end;

        if MessageDlg('Seguro de Modificar los Cupos?',mtConfirmation,[mbyes,mbno],0) = mrNo then
        begin
          CmdOtra.Click;
          Exit;
        end;


        with IBSQL1 do begin
         Close;
         SQL.Clear;
         SQL.Add('update "cap$tarjetacuenta" SET CUPO_ATM = :CUPO_ATM,CUPO_POS = :CUPO_POS, TRANS_ATM = :TRANS_ATM, TRANS_POS = :TRANS_POS');
         SQL.Add('where ID_TARJETA = :ID_TARJETA');
         ParamByName('ID_TARJETA').AsString := Tarjeta;
         ParamByName('CUPO_ATM').AsCurrency := EdCupoCajero.Value;
         ParamByName('CUPO_POS').AsCurrency := EdCupoPOS.Value;
         ParamByName('TRANS_ATM').AsInteger := EdOpCajero.Value;
         ParamByName('TRANS_POS').AsInteger := EdOpPOS.Value;
         try
          ExecQuery;
          Transaction.Commit;
         except
          Transaction.Rollback;
          MessageDlg('Error al modificar cupos de tarjeta en TarjetaCuenta',mtError,[mbcancel],0);
          raise;
         end;
        end;

        CmdModificar.Enabled := False;
        CmdBloquear.Enabled := False;
        CmdCancelar.Enabled := False;
        CmdAsignar.Enabled := False;
        GroupBox1.Enabled := False;
        GroupBox2.Enabled := False;

end;

procedure TfrmAsignarTarjetaDebito.CicloSaldos;
var
  Dia1:TDate;
  Dia2:TDate;
  DiasPromedio:Integer;
  Saldo, SaldoMenor, SaldoPromedio:Currency;
begin

         Dia2 := fFechaActual;
         Dia1 := IncDay(Dia2,-30);

         SaldoPromedio := 0;
         DiasPromedio := 0;
         Saldo := 0;

         while Dia1 <= Dia2 do
         begin

          Application.ProcessMessages;

          with IBSQL1 do begin
             Close;
             SQL.Clear;
             SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL_TD(:AG,:TP,:CTA,:DGT,:ANO,:FECHA1,:FECHA2)');
             ParamByName('AG').AsInteger := Agencia;
             ParamByName('TP').AsInteger := DBLCBTiposCaptacion.KeyValue;
             ParamByName('CTA').AsInteger := StrToInt(EdNumeroAho.Text);
             ParamByName('DGT').AsInteger := StrToInt(EdDigitoAho.Caption);
             ParamByName('ANO').AsString := IntToStr(YearOf(Dia1));
             ParamByName('FECHA1').AsDate := EncodeDate(YearOf(Dia1),01,01);
             ParamByName('FECHA2').AsDate := IncDay(Dia1,-1);
             try
              ExecQuery;
              Saldo := FieldByName('SALDO_ACTUAL').AsCurrency;
             except
              Transaction.Rollback;
              raise;
             end;
          end;

          with IBSQL2 do begin
             Close;
             SQL.Clear;
             SQL.Add('select VALOR_DEBITO, VALOR_CREDITO from "cap$extracto" where ');
             SQL.Add('(ID_AGENCIA = :"ID_AGENCIA" ) and (ID_TIPO_CAPTACION = :"ID_TIPO_CAPTACION" ) and ');
             SQL.Add('(NUMERO_CUENTA = :"NUMERO_CUENTA") and (DIGITO_CUENTA = :"DIGITO_CUENTA") and ');
             SQL.Add('(FECHA_MOVIMIENTO = :"FECHA_MOVIMIENTO") ORDER BY HORA_MOVIMIENTO');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_TIPO_CAPTACION').AsInteger := DBLCBTiposCaptacion.KeyValue;
             ParamByName('NUMERO_CUENTA').AsInteger := StrToInt(EdNumeroAho.Text);
             ParamByName('DIGITO_CUENTA').AsInteger := StrToInt(EdDigitoAho.Caption);
             ParamByName('FECHA_MOVIMIENTO').AsDate := Dia1;
             try
               ExecQuery;
             except
               Close;
               ShowMessage('Error al Calcular el Promedio, Consulte con Sistemas');
               Exit;
             end;

             SaldoMenor := Saldo;

             while not Eof do
             begin
               Application.ProcessMessages;             
               Saldo := Saldo + FieldByName('VALOR_DEBITO').AsCurrency - FieldByName('VALOR_CREDITO').AsCurrency;
               if Saldo < SaldoMenor then
                  SaldoMenor := Saldo;
               Next;
             end;

             SaldoPromedio := SaldoPromedio + SaldoMenor;
             DiasPromedio := DiasPromedio + 1;
          end;
         Dia1 := IncDay(Dia1,1);
        end;

        SaldoPromedio := SimpleRoundTo((SaldoPromedio/DiasPromedio),0);
        Promedio := SaldoPromedio;

end;

procedure TfrmAsignarTarjetaDebito.DBRangosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
      with Sender as TDBGrid do begin
         if (Promedio >= IBQRangos.FieldByName('DESDE').AsCurrency) and
            (Promedio <= IBQRangos.FieldByName('HASTA').AsCurrency) then
         begin
           Canvas.Brush.Color := clAqua;
           HayPromedio := True;
         end
         else
           Canvas.Brush.Color := clWhite;

         if (gdFocused in State) then
           Canvas.Font.Color := clBlack;
       DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
end;

function TfrmAsignarTarjetaDebito.ValidarAsociado: Boolean;
var
  Ag:Integer;
  Tp:Integer;
  Nm:Integer;
  Dg:Integer;
  Ano:string;
  Fecha1,Fecha2:TDate;
  SaldoMinimoApo:Currency;
  SaldoMinimoRin:Currency;
  SaldoMinimoTarjeta:Currency;
  SaldoMinimoJuv:Currency;
  SaldoApoAct:Currency;
  SaldoRindediario:Currency;
  SaldoJuvenil:Currency;
  xAportesAct:Boolean;
  xRindediario:Boolean;
  xJuvenil:Boolean;
  xDeudas:Boolean;
  xFianzas:Boolean;
  Id:Integer;
  Numero:string;
begin
        Result := False;

        Ano := IntToStr(YearOf(fFechaActual));
        Fecha1 := EncodeDate(YearOf(fFechaActual),01,01);
        Fecha2 := fFechaActual;

        Id := StrToInt(GridTitulares.Cells[1,1]);
        Numero := GridTitulares.Cells[2,1];

        with IBSQL4 do begin
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add(' SALDO_MINIMO');
          SQL.Add('FROM');
          SQL.Add(' "cap$tipocaptacion"');
          SQL.Add('WHERE');
          SQL.Add(' ID_TIPO_CAPTACION = :ID');
// Aportaciones sociales
          ParamByName('ID').AsInteger := 1;
          try
           ExecQuery;
           SaldoMinimoApo := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

// Ahorro Rindediario
          Close;
          ParamByName('ID').AsInteger := 2;
          try
           ExecQuery;
           SaldoMinimoRin := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;
// Ahorro Juvenil
          Close;
          ParamByName('ID').AsInteger := 4;
          try
           ExecQuery;
           SaldoMinimoJuv := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

          Close;
          SQL.Clear;
          SQL.Add('select VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 17');
          try
           ExecQuery;
           SaldoMinimoTarjeta := FieldByName('VALOR_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

          Transaction.Commit;
          Close;
        end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "cap$maestrotitular".ID_AGENCIA,"cap$maestrotitular".ID_TIPO_CAPTACION,"cap$maestrotitular".NUMERO_CUENTA,"cap$maestrotitular".DIGITO_CUENTA from "cap$maestrotitular"');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA and NUMERO_TITULAR = 1 and "cap$tiposestado".SE_SUMA <> 0 and "cap$maestro".ID_TIPO_CAPTACION = 1');
              IBSQL1.SQL.Add('order by "cap$maestrotitular".ID_AGENCIA ASC,"cap$maestrotitular".ID_TIPO_CAPTACION ASC,"cap$maestrotitular".NUMERO_CUENTA ASC,"cap$maestrotitular".DIGITO_CUENTA');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
              IBSQL1.ParamByName('ID_PERSONA').AsString := Numero;
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                   Ag := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                   Tp := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                   Nm := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                   Dg := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                end
                else
                begin
                   ShowMessage('La cuenta NO está Activa');
                   CmdOtra.Click;
                   Exit;
               end;
              except
                IBSQL1.Transaction.Rollback;
                raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := Tp;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := Dg;
              IBSQL1.ParamByName('ANO').AsString := Ano;
              IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
              IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                  SaldoApoAct := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoApoAct >= SaldoMinimoApo then
                    xAportesAct := True
                  else
                    xAportesAct := False;
                end
                else
                begin
                  SaldoApoAct := 0;
                  xAportesAct := False;
                end;
              except
                IBSQL1.Transaction.Rollback;
                raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := 2;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := StrToInt(DigitoControl(2,Format('%.7d',[Nm])));
              IBSQL1.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
              IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
              IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                  SaldoRindediario := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoRindediario >= SaldoMinimoTarjeta  then
                    xRindediario := True
                  else
                    xRindediario := False;
                end
                else
                begin
                  SaldoRindediario := 0;
                  xRindediario := False;
                end;
              except
                IBSQL1.Transaction.Rollback;
                raise;
              end;

              SaldoRindediario := SaldoRindediario - SaldoMinimoTarjeta;
              if SaldoRindediario < 0 then
                SaldoRindediario := 0;

              EdSaldoDisponible.Caption := FormatCurr('$#,0.00',SaldoRindediario);

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
              IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger :=  Id;
              IBSQL1.ParamByName('ID_PERSONA').AsString := Numero;
              try
               IBSQL1.ExecQuery;
               xDeudas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xDeudas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                IBSQL1.Transaction.Rollback;
                raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colgarantias"');
              IBSQL1.SQL.Add('inner join "col$colocacion" ON ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
              IBSQL1.SQL.Add('"col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
              IBSQL1.SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA and "col$colocacion".ID_ESTADO_COLOCACION < 4');
//              IBSQL1.SQL.Add('and "col$colocacion".ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
              IBSQL1.ParamByName('ID_PERSONA').AsString := Numero;
              try
               IBSQL1.ExecQuery;
               xFianzas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xFianzas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                IBSQL1.Transaction.Rollback;
                raise;
              end;

              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select * from "cap$maestrotitular"');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and "cap$maestrotitular".ID_TIPO_CAPTACION = 4 and "cap$tiposestado".SE_SUMA <> 0');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := Id;
              IBSQL1.ParamByName('ID_PERSONA').AsString := Numero;
              try
               IBSQL1.ExecQuery;
               xJuvenil := True;
               if IBSQL1.RecordCount > 0 then
                while not IBSQL1.Eof do begin
                    IBSQL2.Close;
                    IBSQL2.SQL.Clear;
                    IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
                    IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                    IBSQL2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                    IBSQL2.ParamByName('NM').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
                    IBSQL2.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
                    IBSQL2.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
                    try
                      IBSQL2.ExecQuery;
                      if IBSQL2.RecordCount > 0 then
                      while not IBSQL2.Eof do begin
                         if IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency < SaldoMinimoJuv then
                           xJuvenil := False;
                         IBSQL2.Next;
                      end;

                    except
                      IBSQL1.Transaction.Rollback;
                      raise;
                    end;
                 IBSQL1.Next;
                end;


               except
                IBSQL1.Transaction.Rollback;
                raise;
              end;

              if not xAportesAct then
               MessageDlg('El asociado no tiene aportes actualizados',mtError,[mbOk],0);

              if not xRindediario then
               MessageDlg('El asociado no tiene el saldo mínimo en rindediario',mtError,[mbOk],0);

              if not xJuvenil then
               MessageDlg('El asociado no tiene actualizado saldos en ahorro juvenil',mtError,[mbOk],0);

              if not xDeudas then
               MessageDlg('El asociado tiene deudas pendientes',mtError,[mbOk],0);

{              if not xFianzas then
               MessageDlg('El asociado tiene fianzas pendientes',mtError,[mbOk],0);
}
              if (xAportesAct) and (xRindediario) and (xJuvenil) and
                 (xDeudas) { and (xFianzas) } then
                 Result := True
              else
                 Result := False;



end;

procedure TfrmAsignarTarjetaDebito.FormCreate(Sender: TObject);
begin
        dmColocacion := TdmColocacion.Create(Self);
        if dmColocacion.IBSQL.Transaction.InTransaction then
           dmColocacion.IBSQL.Transaction.Rollback;
        dmColocacion.IBSQL.Transaction.StartTransaction;

        _TXml := TXml.Create;
end;

procedure TfrmAsignarTarjetaDebito.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        dmColocacion.IBSQL.Transaction.Commit;
        dmColocacion.Free;
end;

procedure TfrmAsignarTarjetaDebito.Mnu01Click(Sender: TObject);
var
  Ano,Mes,Dia:Integer;
  Nombre:string;
  Documento:string;
  Cuenta:string;
  Direccion:string;
  CiudadDir:string;
  Cupo:Currency;
  Fecha:TDate;
begin

        with IBSQLImpresos do begin
         if Transaction.InTransaction then
            Transaction.Rollback;
         Transaction.StartTransaction;

         Close;
         SQL.Add('SELECT');
         SQL.Add('  "gen$persona".ID_PERSONA,');
         SQL.Add('  "gen$persona".PRIMER_APELLIDO || '' '' || "gen$persona".SEGUNDO_APELLIDO || '' '' || "gen$persona".NOMBRE AS NOMBRE,');
         SQL.Add('  "cap$tarjetacuenta".ID_TIPO_CAPTACION,');
         SQL.Add('  "cap$tarjetacuenta".ID_AGENCIA,');
         SQL.Add('  "cap$tarjetacuenta".NUMERO_CUENTA,');
         SQL.Add('  "cap$tarjetacuenta".DIGITO_CUENTA,');
         SQL.Add('  "cap$tarjetacuenta".FECHA_ASIGNACION,');
         SQL.Add('  "gen$direccion".DIRECCION,');
         SQL.Add('  "gen$direccion".BARRIO,');
         SQL.Add('  "gen$direccion".MUNICIPIO,');
         SQL.Add('  "cap$tarjetacuenta".CUPO_ATM');
         SQL.Add('FROM');
         SQL.Add(' "cap$tarjetacuenta"');
         SQL.Add(' INNER JOIN "cap$maestro" ON ("cap$tarjetacuenta".ID_AGENCIA="cap$maestro".ID_AGENCIA)');
         SQL.Add('  AND ("cap$tarjetacuenta".ID_TIPO_CAPTACION="cap$maestro".ID_TIPO_CAPTACION)');
         SQL.Add('  AND ("cap$tarjetacuenta".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA)');
         SQL.Add('  AND ("cap$tarjetacuenta".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA)');
         SQL.Add(' INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
         SQL.Add('  AND ("cap$maestro".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
         SQL.Add('  AND ("cap$maestro".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
         SQL.Add('  AND ("cap$maestro".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
         SQL.Add(' INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
         SQL.Add('  AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
         SQL.Add(' INNER JOIN "gen$direccion" ON ("gen$persona".ID_IDENTIFICACION="gen$direccion".ID_IDENTIFICACION)');
         SQL.Add('  AND ("gen$persona".ID_PERSONA="gen$direccion".ID_PERSONA)');
         SQL.Add('WHERE');
         SQL.Add('  ("cap$tarjetacuenta".ID_TARJETA = :ID_TARJETA) AND');
         SQL.Add('  ("cap$maestrotitular".NUMERO_TITULAR = 1) AND');
         SQL.Add('  ("gen$direccion".ID_DIRECCION = 1)');
         ParamByName('ID_TARJETA').AsString := Tarjeta;
         try
          ExecQuery;
         except
          Transaction.Rollback;
          raise;
         end;

         Nombre := Trim(FieldByName('NOMBRE').AsString);
         Documento:= FieldByName('ID_PERSONA').AsString;
         Cuenta := FieldByName('ID_TIPO_CAPTACION').AsString+Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])+'-'+Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger])+'-'+FieldByName('DIGITO_CUENTA').AsString;
         Direccion := FieldByName('DIRECCION').AsString + ' ' + FieldByName('BARRIO').AsTrimString;
         CiudadDir := FieldByName('MUNICIPIO').AsString;
         Cupo := FieldByName('CUPO_ATM').AsCurrency;
         Fecha := FieldByName('FECHA_ASIGNACION').AsDate;
        end; // fin del with

        if MessageDlg('Coloque la hoja del formato en la impresora sin quitar el borde perforado',mtConfirmation,[mbOk,mbCancel],0) = mrOk then
        begin
            with ReporteS do begin
              Variables.ByName['COFICINA'].AsString := Ciudad;
              Variables.ByName['AGENCIA'].AsInteger := Agencia;
              Variables.ByName['ANO'].AsInteger := YearOf(Fecha);
              Variables.ByName['MES'].AsInteger := MonthOf(Fecha);
              Variables.ByName['DIA'].AsInteger := DayOf(Fecha);
              Variables.ByName['NOMBRE'].AsString := Nombre;
              Variables.ByName['DOCUMENTO'].AsString := Documento;
              Variables.ByName['CUENTA'].AsString := Cuenta;
              Variables.ByName['TARJETA'].AsString := RightStr(Tarjeta,10);
              Variables.ByName['DIRECCION'].AsString := Direccion;
              Variables.ByName['CIUDAD'].AsString := CiudadDir;
              Variables.ByName['CUPO'].AsDouble := Cupo;
              if PrepareReport then
                 PreviewPreparedReport(True);
            end;
        end;


end;

procedure TfrmAsignarTarjetaDebito.Mnu02Click(Sender: TObject);
begin
// Imprimir Comprobante
        with IBAuxiliar do
        begin
             if Transaction.InTransaction then
                Transaction.Rollback;
             Transaction.StartTransaction;
             Close;
             SQL.Clear;
             SQL.Add('select ');
             SQL.Add('"con$auxiliar".ID_COMPROBANTE,');
             SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
             SQL.Add('"con$tipocomprobante".DESCRIPCION AS TIPO,');
             SQL.Add('"con$comprobante".FECHADIA,');
             SQL.Add('"con$comprobante".DESCRIPCION,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$empleado".NOMBRE,');
             SQL.Add('"con$auxiliar".CODIGO,');
             SQL.Add('"con$puc".NOMBRE AS CUENTA,');
             SQL.Add('"con$auxiliar".DEBITO,');
             SQL.Add('"con$auxiliar".CREDITO');
             SQL.Add('from ');
             SQL.Add('"con$comprobante" ');
             SQL.Add('INNER JOIN "con$auxiliar" ON ("con$comprobante".ID_COMPROBANTE = "con$auxiliar".ID_COMPROBANTE)');
             SQL.Add('LEFT JOIN "con$puc" ON ("con$auxiliar".CODIGO = "con$puc".CODIGO)');
             SQL.Add('INNER JOIN "con$tipocomprobante" ON ("con$comprobante".TIPO_COMPROBANTE = "con$tipocomprobante".ID) ');
             SQL.Add('INNER JOIN "gen$agencia" ON ("con$auxiliar".ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("con$comprobante".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO)');
             SQL.Add('where ');
             SQL.Add('("con$comprobante".ID_AGENCIA = :"ID_AGENCIA") and ');
             SQL.Add('("con$comprobante".ID_COMPROBANTE = :"ID_COMPROBANTE")');
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             ParamByName('ID_COMPROBANTE').AsInteger := Comprobante;
             try
              Open;
              ReporteC.Variables.ByName['EMPRESA'].AsString := Empresa;
              ReporteC.Variables.ByName['NIT'].AsString := Nit;
              if ReporteC.PrepareReport then
                 ReporteC.PreviewPreparedReport(True);
              Close;
             except
               MessageDlg('Error generando el comprobante',mtError,[mbcancel],0);
               Close;
             end;
             Transaction.Commit;
        end;
// Fin Impresión Comprobante

end;

procedure TfrmAsignarTarjetaDebito.IBQRangosAfterScroll(DataSet: TDataSet);
begin
        if Iniscroll then
          Iniscroll := False
        else
        begin
          EdCupoCajero.Value := IBQRangos.FieldByName('CUPO_ATM').AsCurrency;
          EdCupoPOS.Value := IBQRangos.FieldByName('CUPO_POS').AsCurrency;
          EdOpCajero.Value := IBQRangos.FieldByName('RETIRO_ATM').AsInteger;
          EdOpPOS.Value := IBQRangos.FieldByName('RETIRO_POS').AsInteger;
        end;

end;

function TfrmAsignarTarjetaDebito.EnviarXml(iIdPuerto:Integer;sIdHost,Desc:string;AstreamEnv:TMemoryStream): TMemoryStream;
var     Cadena :string;
        AStream : TMemoryStream;
        Tamano :Integer;
begin
        with IdTCPClient1 do
        begin
          Port := iIdPuerto;
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
              FreeAndNil(AStreamEnv);
              tamano := ReadInteger;
              AStream := TMemoryStream.Create;
              ReadStream(Astream,tamano,False);
              Disconnect;
              frmProgreso.Cerrar;
            end;
          except
          on e: Exception do
          begin
            ShowMessage('Error Interno, con Mensaje: ' + e.Message );
          end;
        end;
        end;
        Result := AStream;
end;



end.
