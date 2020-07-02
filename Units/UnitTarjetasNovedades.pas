unit UnitTarjetasNovedades;

interface

uses
  ShellApi, Windows, Messages, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DB, IBCustomDataSet,
  IBQuery,unitdmgeneral, IBSQL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, AbBase, AbBrowse,
  AbZBrows, AbZipper, AbMeter, IdMessage, UnitClaseXml, Grids, DBGrids,UnitClaseData,UnitConexion,
  DBClient;

type
  TfrmTarjetasNovedades = class(TForm)
    Panel1: TPanel;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    CmdEnviar: TBitBtn;
    Label1: TLabel;
    EdFechaCorte: TDateTimePicker;
    GroupBox1: TGroupBox;
    chkTarjetas: TCheckBox;
    chkCuentas: TCheckBox;
    chkTarjetaCuenta: TCheckBox;
    chkControl: TCheckBox;
    IBQTarjetas: TIBQuery;
    IBSQL1: TIBSQL;
    IdSMTP1: TIdSMTP;
    Label2: TLabel;
    EdEstado: TStaticText;
    Msg: TIdMessage;
    Label3: TLabel;
    EdMail: TEdit;
    Label4: TLabel;
    EdMailCCO: TEdit;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    rb1: TRadioButton;
    rb2: TRadioButton;
    IdTCPClient1: TIdTCPClient;
    Memo1: TMemo;
    CdAscii: TClientDataSet;
    CdAsciiNOVALIDO: TStringField;
    CdAsciiVALIDO: TStringField;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmdVerClick(Sender: TObject);
    procedure CmdEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
    { Private declarations }
    function ObtenerTamanoArchivo(const FileName: string): Int64;
    procedure EnvioNovedad;
    function EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string;
      AstreamEnv: TMemoryStream): TMemoryStream;
  public
    { Public declarations }
  end;

var
  frmTarjetasNovedades: TfrmTarjetasNovedades;

  AT:TextFile;
  AC:TextFile;
  ATC:TextFile;
  ACT:TextFile;
  ATN:TextFile;

  FAT:string;
  FAC:string;
  FATC:string;
  FACT:string;
  FTN:string;

  FFF:string;

  Bin,Entidad:string;
  _tData :TData;
  _tConexion :TConexion;
  _bConexion :Boolean;
  _sMensaje :string;
  _tXml :TXml;
  _dFechaActual :TDate;
implementation

{$R *.dfm}

uses UnitGlobalTd, UnitPantallaProgreso;

procedure TfrmTarjetasNovedades.CmdCerrarClick(Sender: TObject);
begin
        Close;

end;

procedure TfrmTarjetasNovedades.CmdProcesarClick(Sender: TObject);
begin
        EnvioNovedad
end;

function TfrmTarjetasNovedades.ObtenerTamanoArchivo(const FileName: string): Int64;
var
  SizeLow, SizeHigh: DWord;
  hFile: THandle;
begin
  Result := 0;
  hFile := FileOpen(FileName, fmOpenRead);
  try
    if hFile <> 0 then
    begin
      SizeLow := Windows.GetFileSize(hFile, @SizeHigh);
      Result := (SizeHigh shl 32) + SizeLow;
    end;
  finally
    FileClose(hFile);
  end;
end;


procedure TfrmTarjetasNovedades.FormShow(Sender: TObject);
begin
        Edit1.Text := Pop3ServerMail1;
        Edit2.Text := Pop3ServerMail2;
        EdFechaCorte.Date := fFechaActual;
        if SmtpServerTo = '' then
           SmtpServerTo := SmtpServerToCC;
        EdMailCCO.Text :=   SmtpServerToCC;
        EdMail.Text := SmtpServerTo;        
end;

procedure TfrmTarjetasNovedades.CmdVerClick(Sender: TObject);
begin
        ShellExecute(Handle, 'open', 'notepad.exe', PChar(FAT), nil, SW_SHOWNORMAL);
        ShellExecute(Handle, 'open', 'notepad.exe', PChar(FAC), nil, SW_SHOWNORMAL);
        ShellExecute(Handle, 'open', 'notepad.exe', PChar(FATC), nil, SW_SHOWNORMAL);
        ShellExecute(Handle, 'open', 'notepad.exe', PChar(FTN), nil, SW_SHOWNORMAL);
        ShellExecute(Handle, 'open', 'notepad.exe', PChar(FACT), nil, SW_SHOWNORMAL);
end;

procedure TfrmTarjetasNovedades.CmdEnviarClick(Sender: TObject);
var Zip :TAbZipper;
begin
       CmdEnviar.Enabled := False;
       EdEstado.Caption := 'Comprimiendo Archivo';
       Application.ProcessMessages;
// Comprimir Archivos       {}{¦Çü
       Zip := TAbZipper.Create(nil);
       Zip.FileName := 'C:\Tdebito\Salida\'+FFF+'.Zip';
       Zip.ClearTags;
       Zip.AddFiles(FAT,0);
       Zip.AddFiles(FAC,0);
       Zip.AddFiles(FATC,0);
       Zip.AddFiles(FTN,0);
       Zip.AddFiles(FACT,0);
       Zip.Save;
       Zip.Free;

// Componer Mensaje

       EdEstado.Caption := 'Generando Correo...';
       Application.ProcessMessages;
       Msg.From.Text := SmtpServerFrom;
       Msg.Recipients.EMailAddresses := EdMail.Text+','+EdMailCCO.Text;
       Msg.ReceiptRecipient.Text := Msg.From.Text;
       Msg.Priority := TIdMessagePriority(0);
       Msg.Subject := 'Nov. convenio '+Entidad+' del día '+FormatDateTime('dd-mm-yyyy',EdFechaCorte.Date);
       Msg.Body.Add('Adjunto remitimos archivos de novedades para el día ' + FormatDateTime('dd-mm-yyyy',EdFechaCorte.Date));
       Msg.Body.Add('Correo generado '+FormatDateTime('dd-mm-yyyy hh:mm',fFechaHoraActual));
       Msg.Body.Add('');
       Msg.Body.Add('Gracias');
       Msg.Body.Add('Operador TDB Afinidad '+Empresa);
       TIdAttachment.Create(Msg.MessageParts, 'C:\Tdebito\Salida\'+FFF+'.Zip');
//
       EdEstado.Caption := 'Enviando Correo...';
       Application.ProcessMessages;

       if rb1.Checked then
       begin
         SmtpServerName := Pop3ServerName1;
         SmtpServerUser := Pop3ServerUser1;
         SmtpServerPassword := Pop3ServerPassword1;
       end
       else
       begin
         SmtpServerName := Pop3ServerName2;
         SmtpServerUser := Pop3ServerUser2;
         SmtpServerPassword := Pop3ServerPassword2;
       end;

       IdSMTP1.Host := SmtpServerName;
       IdSMTP1.Port := SmtpServerPort;
       IdSMTP1.UserId := SmtpServerUser;
       IdSMTP1.Password := SmtpServerPassword;
       IdSMTP1.Connect;
       try
         IdSMTP1.Send(Msg);
         IdSMTP1.Disconnect;
         EdEstado.Caption := 'Proceso culminado con exito!';
         MessageDlg('Mensaje enviado, confirme el proceso a través de la cuenta de correo. Gracias',mtInformation,[mbok],0);
       except
          IdSMTP1.Disconnect;
          EdEstado.Caption := 'Proceso culminado con ERROR!';
          MessageDlg('Error conectando al servidor de correo. Verifique!',mtError,[mbcancel],0);
          raise;
       end;
       try
        CopyFile(PChar('C:\Tdebito\Salida\'+FFF+'.Zip'),PChar('\\Archivos01\tdebito\salida\'+FFF+'.Zip'),False);
       except
       end;

end;

procedure TfrmTarjetasNovedades.EnvioNovedad;
var Cadena:string;
    SaldoTotal,SaldoDisponible:Currency;
    ConteoAT,ConteoAC,ConteoATC,ConteoACT,ConteoTN:Integer;
    Tamano:Int64;
    LineaPedido:string;
    FechaSaldo:TDate;
    //VARIABLES PARA LA CONEXION
   _iIdAgencia :Integer;
   _iIdPuerto :Integer;
   _sIdHost :string;
   _sDescripcionAg :string;
   Astream1 :TMemoryStream;
   _sen :string;
   _cSaldoTotal,_cSaldoDisponible :Currency;
begin
        _tXml.CrearXml;
        Astream1 := TMemoryStream.Create;
        CmdProcesar.Enabled := False;
        EdEstado.Caption := 'Generando Archivos ...';
        Application.ProcessMessages;
        _tData.Sentencia := 'SELECT * FROM TDB$TARJETABIN';
        with _tData.SelectQuery do
        begin
          Bin := FieldByName('ID_BIN').AsString;
          Entidad := FieldByName('ID_ENTIDAD').AsString;
          Transaction.Commit;
        end;

        FAT := 'C:\Tdebito\TJ'+FormatDateTime('ddmmyyyy',EdFechaCorte.Date)+'.'+Entidad;
        FAC := 'C:\Tdebito\CT'+FormatDateTime('ddmmyyyy',EdFechaCorte.Date)+'.'+Entidad;
        FATC := 'C:\Tdebito\TC'+FormatDateTime('ddmmyyyy',EdFechaCorte.Date)+'.'+Entidad;
        FTN := 'C:\Tdebito\TN'+FormatDateTime('ddmmyyyy',EdFechaCorte.Date)+'.'+Entidad;
        FACT := 'C:\Tdebito\FC'+FormatDateTime('ddmmyyyy',EdFechaCorte.Date)+'.'+Entidad;
        FFF  := Entidad+FormatDateTime('ddmmyyyy',EdFechaCorte.Date);


        AssignFile(AT,FAT);
        AssignFile(AC,FAC);
        AssignFile(ATC,FATC);
        AssignFile(ACT,FACT);
        AssignFile(ATN,FTN);

        Rewrite(AT);
        Rewrite(AC);
        Rewrite(ATC);
        Rewrite(ACT);
        Rewrite(ATN);

        ConteoAT := 0;
        ConteoAC := 0;
        ConteoATC := 0;
        ConteoACT := 0;
        ConteoTN := 0;
        ///
        _tXml.Tipo := 'select';
        _tXml.Sentencia := 'SELECT * FROM TDB_NOVEDAD';
        _tXml.CargarNodo;
        Astream1 := _tXml.CargarAstream;
        with _tData.CodAgencia do
        begin
          while not Eof do
          begin
            _iIdAgencia := FieldByName('ID_AGENCIA').AsInteger;
            _iIdPuerto := FieldByName('ID_PUERTO').AsInteger;
            _sIdHost := FieldByName('ID_HOST').AsString;
            _sDescripcionAg := FieldByName('DESCRIPCION_AGENCIA').AsString;
            try
              _tXml.AstreamEnt := EnviarXml(_iIdPuerto,_sIdHost,_sDescripcionAg,Astream1);
            except
              _sMensaje := _sMensaje + ' ' + _sDescripcionAg;
            end;
            if _bConexion then
            begin
              _tXml.ListaConsulta := 'Consulta000';
               with _tXml.LeerXml do
               begin
               try
                 if RecordCount > 0 then // VALIDACION PARA ELIMINAR SALDOS
                 begin
                    _tData.Sentencia := 'DELETE FROM TDB$SALDO WHERE ID_AGENCIA = '+ IntToStr(_iIdAgencia);
                    _tData.Query;
                    //Tabla temporal de información de Envio de Novedades
                    _tData.Sentencia := 'DELETE FROM TDB$TARJETARESPALDO WHERE ID_AGENCIA = '+ IntToStr(_iIdAgencia);
                    _tData.Query;
                    //Tabla que contiene Información de Todas las personas que contienen tarjetas
                    //
                 end;
                 while not Eof do
                 begin
                   //Validaci{on para envio de tarjetas solo Activas
                   if FieldByName('OPERACION').AsString = 'A' then
                   begin
// Archivo de Tarjetas
                      Cadena := FieldByName('OPERACION').AsString + ':' + Bin + ',' + FieldByName('TARJETA').AsString +
                             ',' + '10' + ',' + ',' + ',' + ',' + ',' + FieldByName('CEDULA').AsString + ',' +
                             ValidaCadena(FieldByName('NOMBRE').AsString,CdAscii);
                      Writeln(AT,Cadena);
                      ConteoAT := ConteoAT + 1;


// Archivos de Cuentas
                      Cadena := FieldByName('OPERACION').AsString + ':' + Bin + ',' + Entidad +
                             FieldByName('ID_TIPO_CAPTACION').AsString + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) +
                             Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + ',' + FieldByName('TIPOCUENTA').AsString +
                             ',' + FieldByName('MONEDA').AsString + ',' + FormatCurr('#0',FieldByName('SALDO').AsCurrency) + '00' +
                             ',' + FormatCurr('#0',FieldByName('DISPONIBLE').AsCurrency) + '00' + ',' + FormatCurr('#0',FieldByName('CUPOATM').AsCurrency)
                             + '00,' + Format('%d',[FieldByName('TRANPOS').AsInteger]) + ',' + FormatCurr('#0',FieldByName('CUPOPOS').AsCurrency) + '00,'
                             + Format('%d',[FieldByName('TRANATM').AsInteger]);
                      Writeln(AC,Cadena);
                      ConteoAC := ConteoAC + 1;
// Archivo de Tarjeta Cuenta
                      Cadena := FieldByName('OPERACION').AsString + ':' + Bin + ',' + FieldByName('TARJETA').AsString +
                             ',' + Entidad + FieldByName('ID_TIPO_CAPTACION').AsString + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])
                             + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + ',' + FieldByName('TIPOCUENTA').AsString + ',' + '1';
                      Writeln(ATC,Cadena);
                      ConteoATC := ConteoATC + 1;
                      //Registro de Informacion en tabla Temporal para Efectos de Perdida de Comunicacion
                      try
                        _tData.Sentencia := 'INSERT INTO TDB$TARJETARESPALDO VALUES( ' +
                                          QuotedStr(FieldByName('OPERACION').AsString) + ',' +
                                          QuotedStr(Bin) + ',' +
                                          QuotedStr(FieldByName('ENTIDAD').AsString) + ',' +
                                          QuotedStr(FieldByName('TARJETA').AsString) + ',' +
                                          QuotedStr(FieldByName('ID_AGENCIA').AsString) + ',' +
                                          QuotedStr(FieldByName('ID_TIPO_CAPTACION').AsString) + ',' +
                                          QuotedStr(FieldByName('NUMERO_CUENTA').AsString) + ',' +
                                          QuotedStr(FieldByName('DIGITO_CUENTA').AsString) + ',' +
                                          QuotedStr(FieldByName('TIPOCUENTA').AsString) + ',' +
                                          QuotedStr(FieldByName('MONEDA').AsString) + ',' +
                                          QuotedStr(FieldByName('CUPOATM').AsString) + ',' +
                                          QuotedStr(FieldByName('TRANATM').AsString) + ',' +
                                          QuotedStr(FieldByName('CUPOPOS').AsString) + ',' +
                                          QuotedStr(FieldByName('TRANPOS').AsString) + ',' +
                                          QuotedStr(FieldByName('CEDULA').AsString) + ',' +
                                          QuotedStr(FieldByName('NOMBRE').AsString) + ')';
                                          //ShowMessage(FieldByName('NOMBRE').AsString);
                       _tData.Query;
                     Except
                     end;
                    end; // fin validacion Tarjetas Activas
                     //REGISTRO DE SALDOS EN LA BASE LOCAL
                     try
                     if FieldByName('OPERACION').AsString = 'A' then
                     begin
                       _tData.Sentencia :=  'INSERT INTO TDB$SALDO VALUES (' + QuotedStr(FieldByName('TARJETA').AsString)+ ',' +
                                           FieldByName('DISPONIBLE').AsString + ',' + FieldByName('SALDO').AsString + ',' +
                                           QuotedStr(DateToStr(_dFechaActual)) + ',' + QuotedStr(TimeToStr(Time)) + ',' + inttostr(_iIdAgencia) + ')';
                       _tdata.Query;
                     end;
                     except
                     on E: Exception do
                     begin
                       Memo1.Lines.Add('Error ' + E.Message + ' Trjeta ' + FieldByName('TARJETA').AsString );
                     end;
                     end;
                   Next;
                 end;// fin del while del xml
                except
                end;// validacion por si no hay datos
               end;// fin del with del leerxml
            end// fin del valida si existe conexion con las agencias
            else
            begin// Cargar informacion de respaldo
              //*****
              //*****
              try
                _tData.Sentencia := 'SELECT * FROM TDB$TARJETARESPALDO WHERE ID_AGENCIA = '+ IntToStr(_iIdAgencia);
                with _tData.SelectQuery do
                begin
                  while not Eof do
                  begin
                       _tData._sTarjeta := FieldByName('TARJETA').AsString;
                       _tData.Saldos;
// Archivo de Tarjetas
                       Cadena := FieldByName('OPERACION').AsString + ':' + Bin + ',' + FieldByName('TARJETA').AsString +
                              ',' + '10' + ',' + ',' + ',' + ',' + ',' + FieldByName('CEDULA').AsString + ',' +
                              ValidaCadena(FieldByName('NOMBRE').AsString,CdAscii);
                       Writeln(AT,Cadena);
                       ConteoAT := ConteoAT + 1;
// Archivos de Cuentas
                       Cadena := FieldByName('OPERACION').AsString + ':' + Bin + ',' + Entidad +
                              FieldByName('ID_TIPO_CAPTACION').AsString + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger]) +
                              Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + ',' + FieldByName('TIPO_CUENTA').AsString +
                              ',' + FieldByName('MONEDA').AsString + ',' + FormatCurr('#0',_tData.SaldoTotal) + '00' +
                              ',' + FormatCurr('#0',_tData.SaldoDisponible) + '00' + ',' + FormatCurr('#0',FieldByName('CUPOATM').AsCurrency)
                              + '00,' + Format('%d',[FieldByName('TRANPOS').AsInteger]) + ',' + FormatCurr('#0',FieldByName('CUPOPOS').AsCurrency) + '00,'
                              + Format('%d',[FieldByName('TRANATM').AsInteger]);
                       Writeln(AC,Cadena);
                       ConteoAC := ConteoAC + 1;
// Archivo de Tarjeta Cuenta
                       Cadena := FieldByName('OPERACION').AsString + ':' + Bin + ',' + FieldByName('TARJETA').AsString +
                              ',' + Entidad + FieldByName('ID_TIPO_CAPTACION').AsString + Format('%.2d',[FieldByName('ID_AGENCIA').AsInteger])
                              + Format('%.7d',[FieldByName('NUMERO_CUENTA').AsInteger]) + ',' + FieldByName('TIPO_CUENTA').AsString + ',' + '1';
                       Writeln(ATC,Cadena);
                       ConteoATC := ConteoATC + 1;
                    Next;
                  end;
                end;
              except
              end;
              //*****
              //*****
            end;
            Next;
           end;// Fin del While Busca Agencias
        CloseFile(AC);
        CloseFile(AT);
        CloseFile(ATC);
        Memo1.Lines.SaveToFile('c:\logtarjeta.txt');
        end;// Fin del With de Agencias

// Archivo pedido tarjetas
        _tData._sSentencia := 'SELECT * FROM TDB$PEDIDO WHERE FECHA = ' + QuotedStr(DateToStr(EdFechaCorte.Date));
        with _tData.SelectQuery do
        begin
          if RecordCount > 0 then
          begin
            //LineaPedido := FieldByName('ID_TARJETA_FINAL').AsString + '   ' + Format('%.6d',[FieldByName('CANTIDAD').AsInteger])+' ';
            LineaPedido := FieldByName('ID_TARJETA_FINAL').AsString + '   ' + Format('%.6d',[FieldByName('CANTIDAD').AsInteger]);
            ConteoTN := 1;
          end
          else
            LineaPedido := '';
          Close;

          Writeln(ATN,LineaPedido);
          CloseFile(ATN);
        end;
// Archivo de Control
        if ConteoAT > 0 then
           begin
            Tamano := ObtenerTamanoArchivo(FAT);
            Cadena := RightStr(FAT,14)+',0,'+IntToStr(Tamano)+',0,'+Format('%d',[ConteoAT]);
            Writeln(ACT,Cadena);
           end;

        if ConteoAC > 0 then
           begin
            Tamano := ObtenerTamanoArchivo(FAC);
            Cadena := RightStr(FAC,14)+',0,'+IntToStr(Tamano)+',0,'+Format('%d',[ConteoAC]);
            Writeln(ACT,Cadena);
           end;

        if ConteoATC > 0 then
           begin
            Tamano := ObtenerTamanoArchivo(FATC);
            Cadena := RightStr(FATC,14)+',0,'+IntToStr(Tamano)+',0,'+Format('%d',[ConteoATC]);
            Writeln(ACT,Cadena);
           end;

        if ConteoTN >= 0 then
           begin
            if ConteoTN = 0 then
              Tamano := 0
            else
              Tamano := ObtenerTamanoArchivo(FTN);
            Cadena := RightStr(FTN,14)+',0,'+IntToStr(Tamano)+',0,'+Format('%d',[ConteoTN]);
            Writeln(ACT,Cadena);
           end;

        CloseFile(ACT);

        chkTarjetas.Checked := True;
        chkCuentas.Checked := True;
        chkTarjetaCuenta.Checked := True;
        chkControl.Checked := True;


        CmdVer.Enabled := True;
        CmdEnviar.Enabled := True;

        MessageDlg('Proceso Culminado',mtInformation,[mbok],0);
        if _sMensaje <> '' then
        begin
          ShowMessage('No se logro comunicacion con :' + _sMensaje);
        end;

end;

procedure TfrmTarjetasNovedades.FormCreate(Sender: TObject);
begin
        _tConexion := TConexion.Create;
        _tConexion.Conectar;
        _tData := TData.Create;
        _tData.Database := _tConexion.Database;
        _tXml := TXml.Create;
        _tData.Sentencia := 'SELECT FECHA FROM SP_FECHA_ACTUAL';
        _dFechaActual := _tData.SelectQuery.FieldByName('FECHA').AsDateTime;
        LLenaAscii(CdAscii);
end;

function TfrmTarjetasNovedades.EnviarXml(_iIdPuerto: Integer; sIdHost, Desc: string; AstreamEnv: TMemoryStream): TMemoryStream;
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

procedure TfrmTarjetasNovedades.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;

end;

procedure TfrmTarjetasNovedades.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TfrmTarjetasNovedades.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

end.
