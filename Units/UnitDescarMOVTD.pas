unit UnitDescarMOVTD;

interface

uses
  Math, ShellApi, Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdPOP3, StdCtrls, IdMessage, Buttons, ComCtrls, ExtCtrls,
  ImgList, AbBase, AbBrowse, AbZBrows, AbUnzper, JvEdit, JvTypedEdit,
  Grids, AbView, AbZView, AbArcTyp, IBSQL, pr_Common, pr_TxClasses, DB,
  IBCustomDataSet, IBQuery, IBDatabase, DateUtils, DBClient, Mask,
  JvToolEdit,UnitConexion,UnitClaseData,UnitClaseXml,UnitClaseComprobante;

type
  TfrmDescarMOVTD = class(TForm)
    POP: TIdPOP3;
    GroupBox1: TGroupBox;
    chkBox1: TCheckBox;
    chkBox2: TCheckBox;
    chkBox3: TCheckBox;
    chkBox4: TCheckBox;
    chkBox7: TCheckBox;
    chkBox8: TCheckBox;
    chkBox9: TCheckBox;
    chkBox10: TCheckBox;
    Msg: TIdMessage;
    lvHeaders: TListView;
    chkBox5: TCheckBox;
    Panel1: TPanel;
    cmdLeer: TBitBtn;
    cmdProcesar: TBitBtn;
    cmdCerrar: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    pnlAttachments: TPanel;
    Label2: TLabel;
    lvMessageParts: TListView;
    Button1: TBitBtn;
    ImageList1: TImageList;
    SaveDialog1: TSaveDialog;
    cmdDescomp: TBitBtn;
    UnZip: TAbUnZipper;
    chkBox6: TCheckBox;
    GroupBox2: TGroupBox;
    EdMov: TEdit;
    Label3: TLabel;
    EdBlq: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdTar: TEdit;
    Label6: TLabel;
    EdEst: TEdit;
    Label7: TLabel;
    EdTMov: TJvIntegerEdit;
    Label8: TLabel;
    EdTBlq: TJvIntegerEdit;
    Label9: TLabel;
    EdTTar: TJvIntegerEdit;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    IBComprobante: TIBQuery;
    IBAuxiliar: TIBQuery;
    IBAuxiliar1: TIBQuery;
    reporte: TprTxReport;
    IBTransaction1: TIBTransaction;
    IBSQLComp: TIBSQL;
    cmdComprobante: TBitBtn;
    CDS: TClientDataSet;
    CDSID_TARJETA: TStringField;
    CDSSECUENCIA: TStringField;
    CDSMONTO: TCurrencyField;
    CDSCOMISION: TCurrencyField;
    CDSAPROBADA: TBooleanField;
    cmdReporte: TBitBtn;
    CDSCUENTA: TStringField;
    CDSASOCIADO: TStringField;
    CDSTERMINAL: TStringField;
    reportemov: TprTxReport;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    rb1: TRadioButton;
    rb2: TRadioButton;
    GroupBox4: TGroupBox;
    EdArchivoExterno: TJvFilenameEdit;
    btnArchivoExterno: TBitBtn;
    ClientDataSet1: TClientDataSet;
    CdTarjeta: TClientDataSet;
    CdTarjetaNPOS_CSC: TIntegerField;
    CdTarjetaNPOS_CUENTA: TStringField;
    CdTarjetaNPOS_TARJETA: TStringField;
    CdTarjetaNPOS_REDADQ: TIntegerField;
    CdTarjetaNPOS_SECUENCIA: TIntegerField;
    CdTarjetaNPOS_NTERM: TStringField;
    CdTarjetaNPOS_NOMBRE: TStringField;
    CdTarjetaNPOS_FECHA: TDateField;
    CdTarjetaNPOS_HORA: TTimeField;
    CdTarjetaNPOS_MONTO: TStringField;
    CdTarjetaNPOS_COMISION: TStringField;
    CdTarjetaNPOS_TRAN: TIntegerField;
    CdTarjetaNPOS_ERR: TIntegerField;
    CdTarjetaNPOS_TERM: TIntegerField;
    CdTarjetaNPOS_RED: TIntegerField;
    CdTarjetaNPOS_NCAJ: TStringField;
    CdTarjetaNPOS_FLD: TStringField;
    CdTarjetaNPOS_APLICADA: TIntegerField;
    CdTarjetaID_AGENCIA: TIntegerField;
    CdSentencia: TClientDataSet;
    CdSentenciaID_AGENCIA: TIntegerField;
    CdSentenciaSENTENCIA: TStringField;
    IdTCPClient1: TIdTCPClient;
    CdSentenciaTIPO: TStringField;
    procedure cmdLeerClick(Sender: TObject);
    procedure cmdCerrarClick(Sender: TObject);
    procedure lvHeadersDblClick(Sender: TObject);
    procedure lvMessagePartsDblClick(Sender: TObject);
    procedure cmdDescompClick(Sender: TObject);
    procedure UnZipArchiveItemProgress(Sender: TObject;
      Item: TAbArchiveItem; Progress: Byte; var Abort: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure lvMessagePartsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cmdProcesarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnArchivoExternoClick(Sender: TObject);
    procedure EdArchivoExternoAfterDialog(Sender: TObject;
      var Name: String; var Action: Boolean);
    procedure EdArchivoExternoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  private
    procedure RetrievePOPHeaders(inMsgCount: Integer);
    procedure RetrieveExecute(Sender: TObject);
    function  FindAttachment(stFilename: string): Integer;
    procedure DownloadMovs(fFileName: string);
    procedure DownloadBlqs(fFileName: string);
    procedure DownloadTars(fFileName: string);
    function BuscaAgencia(_starjeta: string): smallint;
    procedure DescargarMovs(fFileName: string);
    function EnviarXml(_iIdPuerto:Integer;sIdHost,Desc:string;AstreamEnv:TMemoryStream):TMemoryStream;
    procedure Transferir;
    procedure DescargarBlqs(fFileName :string);
    procedure DescargarTars(fFileName: string);
    { Private declarations }
  public
    { Public declarations }
  end;

type PArchivos = ^TArchivos;
     TArchivos = Record
      Nombre:string;
      Existe:Boolean;
end;

type //PRegMov = ^TRegMov;
    TRegMov = Record
      NPOS_CSC:string[06];
      NPOS_CTA:string[10];
      NPOS_TAR:string[19];
      NPOS_RAD:string[05];
      NPOS_SEC:string[04];
      NPOS_NTE:string[08];
      NPOS_NOM:string[30];
      NPOS_FEC:string[08];
      NPOS_HOR:string[06];
      NPOS_MON:string[15];
      NPOS_CMS:string[15];
      NPOS_TRA:string[01];
      NPOS_ERR:string[02];
      NPOS_TER:string[01];
      NPOS_RED:string[01];
      NPOS_NCA:string[08];
      NPOS_FLD:string[12];
end;

type // PRegBlq = ^TRegBlq;
    TRegBlq = Record
      NOV_SEC:string[15];
      NOV_BIN:string[06];
      NOV_CAR:string[13];
      NOV_FRE:string[08];
      NOV_HOR:string[06];
      NOV_FCO:string[08];
      NOV_COD:string[02];
      NOV_TER:string[10];
      NOV_USE:string[05];
end;

type // PRegTar = ^TRegTar;
    TRegTar = Record
      TAR_NEW:string[19];
      TAR_CUP:string[15];
end;

type PResumen = ^TResumen;
     TResumen = record
      id:Integer;
      Nr:Integer;
      Vd:Currency;
      Vc:Currency;
end;


var
  frmDescarMOVTD: TfrmDescarMOVTD;
  FMsgCount :Integer;
  FileName:TFileName;
  ListaFile:TList;
  FUnidad:string='c:\tdebito\';
  LResumen:TList;
  Consecutivo:Integer;
  FechaCorte : TDate;
  _tConexion :TConexion;
  _tData :TData;
  _tXml :TXml;
  Astream :TMemoryStream;
  _dFechaDescarga :TDate;
implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobalTd, UnitPantallaProgreso;

procedure TfrmDescarMOVTD.RetrievePOPHeaders(inMsgCount: Integer);
var
//  stTemp: string;
  intIndex: integer;
  itm: TListItem;
begin
  lvHeaders.Items.Clear;
  for intIndex := 1 to inMsgCount do
  begin
    // Clear the message properties
//    ShowStatus(format('Messsage %d of %d', [intIndex, inMsgCount]));
    Application.ProcessMessages;
    Msg.Clear;
    try
      POP.RetrieveHeader(intIndex, Msg);
    finally
    end;
    // Add info to ListView
    //if (Pos(UpperCase(Msg.From.Text),'BANCODEBOGOTA') > 0) or // validacion para leer solo correos de bancos
    //   (Pos(UpperCase(Msg.From.Text),'MEGABANCO') > 0) then
    
    begin
     itm := lvHeaders.Items.Add;
     itm.ImageIndex := 5;
     //SmtpServerTo := Msg.From.Address;
     itm.Caption := IntToStr(intIndex);
     itm.SubItems.Add(Msg.Subject);
     itm.SubItems.Add(Msg.From.Text);
     itm.SubItems.Add(DateToStr(Msg.Date));
     itm.SubItems.Add(IntToStr(POP.RetrieveMsgSize(intIndex)));
     itm.SubItems.Add('n/a');
     //  itm.SubItems.Add(POP.RetrieveUIDL(intIndex));
    end;
  end;
end;


procedure TfrmDescarMOVTD.cmdLeerClick(Sender: TObject);
var
  Pop3ServerName:string;
  Pop3ServerPort:Integer;
  Pop3ServerUser:string;
  Pop3ServerPassword:string;
begin

  if rb1.Checked then
  begin
     Pop3ServerName := Pop3ServerName1;
     Pop3ServerPort := Pop3ServerPort1;
     Pop3ServerUser := Pop3ServerUser1;
     Pop3ServerPassword := Pop3ServerPassword1;
  end
  else
  begin
     Pop3ServerName := Pop3ServerName2;
     Pop3ServerPort := Pop3ServerPort2;
     Pop3ServerUser := Pop3ServerUser2;
     Pop3ServerPassword := Pop3ServerPassword2;
  end;
  POP.Host := Pop3ServerName;
  POP.Port := Pop3ServerPort;
  POP.UserID := Pop3ServerUser;
  POP.Password := Pop3ServerPassword;
  if POP.Connected then
     POP.Disconnect;
  POP.Connect;
  FMsgCount := POP.CheckMessages;
  if FMsgCount > 0 then
     RetrievePOPHeaders(FMsgCount)
  else
  begin
     ShowMessage('No hay mensajes');
     Exit;
  end;
  chkBox1.Checked := True;
  cmdLeer.Enabled := False;

//  cmdDescomp.Enabled := True;
end;

procedure TfrmDescarMOVTD.RetrieveExecute(Sender: TObject);
var
//  stTemp: string;
  intIndex: Integer;
  li: TListItem;
begin
//  stTemp := Statusbar1.Panels[1].text;
  if lvHeaders.Selected = nil then
  begin
    Exit;
  end;
  //initialise
//  Showbusy(true);
  Msg.Clear;
  Memo1.Clear;
  lvMessageParts.Items.Clear;
  pnlAttachments.visible := false;

  //get message and put into MSG
  POP.Retrieve(lvHeaders.Selected.Index + 1, Msg);
//    POP.Retrieve(lvHeaders.Selected.Index,Msg);

  //Setup fields on screen from MSG
  //Setup attachments list
//  ShowStatus('Decoding attachments (' + IntToStr(Msg.MessageParts.Count) + ')');
  for intIndex := 0 to Pred(Msg.MessageParts.Count) do
  begin
    if (Msg.MessageParts.Items[intIndex] is TIdAttachment) then
    begin //general attachment
      pnlAttachments.visible := true;
      li := lvMessageParts.Items.Add;
      li.ImageIndex := 8;
      li.Caption := TIdAttachment(Msg.MessageParts.Items[intIndex]).Filename;
      //  li.SubItems.Add(TIdAttachment(Msg.MessageParts.Items[intIndex]).ContentType);
    end
    else
    begin //body text
      if Msg.MessageParts.Items[intIndex] is TIdText then
      begin
        Memo1.Lines.Clear;
        Memo1.Lines.AddStrings(TIdText(Msg.MessageParts.Items[intIndex]).Body);
      end
    end;
  end;
  chkBox2.Checked := True;
//  ShowStatus(stTemp);
//  Showbusy(false);
end;


procedure TfrmDescarMOVTD.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmDescarMOVTD.lvHeadersDblClick(Sender: TObject);
begin
        RetrieveExecute(Sender);
end;

procedure TfrmDescarMOVTD.lvMessagePartsDblClick(Sender: TObject);
var
  i: Integer;
  cadena:string;
begin
   if lvMessageParts.Selected <> nil then
      begin
         if lvMessageParts.Selected.Index > Msg.MessageParts.Count then
            begin
               MessageDlg('Indice Desconocido', mtInformation, [mbOK], 0);
            end
         else
            begin
              for i := 0 to Msg.MessageParts.Count - 1 do begin
                if Msg.MessageParts.Items[i] is TIdAttachment then begin
//                 SmtpServerTo := Msg.From.Name;
                 SaveDialog1.FileName := TIdAttachment(Msg.MessageParts.Items[i]).FileName;
                 SaveDialog1.DefaultExt := '.zip';
                 SaveDialog1.InitialDir := FUnidad;
                 SaveDialog1.Title := 'Archivo de Movimientos Tarjeta Débito';
                 _dFechaDescarga := Msg.Date;
                  if SaveDialog1.Execute then
                    TIdAttachment(Msg.MessageParts.Items[i]).SaveToFile(
                      SaveDialog1.FileName);
                    FileName := SaveDialog1.FileName;
                    cadena := RightStr(FileName,12);
                    FechaCorte := EncodeDate(StrToInt(MidStr(cadena,5,4)),StrToInt(MidStr(cadena,3,2)),StrToInt(LeftStr(cadena,2)));
                    chkBox3.Checked := True;
                    cmdDescomp.Enabled := True;
                    break;
                end;
              end;
            end;
      end;
end;

procedure TfrmDescarMOVTD.cmdDescompClick(Sender: TObject);
var
  DirectorioBase:string;
  Ruta:string;
  Archivo,Archivo1,Convenio,Fecha:string;
  FechaDia:TDate;
  AR:PArchivos;
  i:Integer;
  fText:TextFile;
begin
  if FileExists(FileName) then
  begin
   ListaFile := TList.Create;
   UnZip.FileName := FileName;
   with UnZip do begin
      FUnidad := ExtractFilePath( FileName );
      BaseDirectory := ExtractFilePath( FileName );
      ExtractFiles( '*.*' );
      chkBox4.Checked := True;
      for i := 0 to ListaFile.Count - 1 do
      begin
        AR := ListaFile.Items[i];
        Archivo1 := AR^.Nombre;
        if FileExists(Archivo1) then
        begin
         AR^.Existe := True;
         if LowerCase(ExtractFileExt(AR^.Nombre)) = '.mov' then
            EdMov.Text := ExtractFileName(Archivo1);
         if LowerCase(ExtractFileExt(AR^.Nombre)) = '.blq' then
            EdBlq.Text := ExtractFileName(Archivo1);
         if LowerCase(ExtractFileExt(AR^.Nombre)) = '.tar' then
            EdTar.Text := ExtractFileName(Archivo1);
         if LowerCase(ExtractFileExt(AR^.Nombre)) = '.est' then
            EdEst.Text := ExtractFileName(Archivo1);
        end;
      end;
        chkBox5.Checked := True;
        cmdDescomp.Enabled := False;
        cmdProcesar.Enabled := True;
   end;
  end
  else
  begin
      ShowMessage('No Existe Ningún Archivo a Procesar');
      Exit;
  end;

end;

procedure TfrmDescarMOVTD.UnZipArchiveItemProgress(Sender: TObject;
  Item: TAbArchiveItem; Progress: Byte; var Abort: Boolean);
var
  AR:PArchivos;
begin
        New(AR);
        AR^.Nombre := FUnidad + Item.DiskFileName;
        ListaFile.Add(AR);
end;

procedure TfrmDescarMOVTD.Button1Click(Sender: TObject);
var
  intIndex: integer;
  fname: string;
  intMSGIndex: integer;
  cadena:string;
begin
  SmtpServerTo := Msg.From.Address;
  _dFechaDescarga := Msg.Date;                
  for intIndex := 0 to lvMessageParts.Items.Count - 1 do
    if lvMessageParts.Items[intIndex].Selected then
    begin
      intMSGIndex := FindAttachment(lvMessageParts.Items[intIndex].caption);
      if intMSGIndex > 0 then
      begin
        fname :=
          TIdAttachment(Msg.MessageParts.Items[intMSGIndex]).FileName;
        SaveDialog1.FileName := FUnidad +fname;
        if SaveDialog1.Execute then
        begin
          TIdAttachment(Msg.MessageParts.Items[intMSGIndex]).SaveToFile(SaveDialog1.FileName);
          FileName := SaveDialog1.FileName;
          cadena := RightStr(FileName,12);
          FechaCorte := EncodeDate(StrToInt(MidStr(cadena,5,4)),StrToInt(MidStr(cadena,3,2)),StrToInt(LeftStr(cadena,2)));
          chkBox3.Checked := True;
          cmdDescomp.Enabled := True;
        end;
      end;
    end;
end;

function TfrmDescarMOVTD.FindAttachment(stFilename: string): integer;
var
  intIndex: Integer;
  found: boolean;
begin
  intIndex := -1;
  result := -1;
  if (Msg.MessageParts.Count < 1) then
    exit; //no attachments (or anything else)
  found := false;
  stFilename := uppercase(stFilename);
  repeat
    inc(intIndex);
    if (Msg.MessageParts.Items[intIndex] is TIdAttachment) then
    begin //general attachment
      if stFilename =
        uppercase(TIdAttachment(Msg.MessageParts.Items[intIndex]).Filename) then
        found := true;
    end;
  until found or (intIndex > Pred(Msg.MessageParts.Count));
  if found then
    result := intIndex
  else
    result := -1;
end; (*  *)


procedure TfrmDescarMOVTD.lvMessagePartsSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
        if Selected then Button1.Enabled := true
        else Button1.Enabled := False;
end;

procedure TfrmDescarMOVTD.cmdProcesarClick(Sender: TObject);
var
   i:Integer;
   AR:PArchivos;
   fichero:string;
begin
        cmdProcesar.Enabled := False;
        for i := 0 to ListaFile.Count - 1 do
        begin
           AR := ListaFile.Items[i];
           if LowerCase(ExtractFileExt(AR^.Nombre)) = '.mov' then
            begin
              try
                DescargarMovs(AR^.Nombre);
              except
              end;
              chkBox6.Checked := True;
            end;
           if LowerCase(ExtractFileExt(AR^.Nombre)) = '.blq' then
            begin
               try
                 DescargarBlqs(AR^.Nombre);
               except
               chkBox7.Checked := True;
               end;
            end;
           if LowerCase(ExtractFileExt(AR^.Nombre)) = '.tar' then
           begin
              try
                DescargarTars(AR^.Nombre);
              except
              end;
              chkBox8.Checked := True;
           end;
           if LowerCase(ExtractFileExt(AR^.Nombre)) = '.est' then
           begin
              try
                fichero := AR^.Nombre;
                //ShellExecute(Handle, 'open', 'notepad.exe', PChar(fichero), nil, SW_SHOWNORMAL);
              except
              end;
           end;
        end;

        if CdSentencia.RecordCount > 0 then
        begin
          _tXml := TXml.Create;
        end;
//        ShowMessage(IntToStr(CdSentencia.RecordCount));
        Transferir;
        chkBox9.Checked := True;
        cmdComprobante.Enabled := True;

end;

procedure TfrmDescarMOVTD.DownloadMovs(fFileName: string);
begin
end;

procedure TfrmDescarMOVTD.DownloadBlqs(fFileName: string);
begin
end;

procedure TfrmDescarMOVTD.DownloadTars(fFileName: string);
begin

end;

procedure TfrmDescarMOVTD.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        ShortTimeFormat := 'hh:mm:ss';
        if POP.Connected then
           POP.Disconnect;
        _tConexion.Conectar;
end;

procedure TfrmDescarMOVTD.FormShow(Sender: TObject);
begin
        Edit1.Text := Pop3ServerMail1;
        Edit2.Text := Pop3ServerMail2;
end;

procedure TfrmDescarMOVTD.btnArchivoExternoClick(Sender: TObject);
var
  cadena:string;
begin
        if EdArchivoExterno.Text <> '' then
          begin
           FileName := EdArchivoExterno.FileName;
           cadena := RightStr(FileName,12);
           FechaCorte := EncodeDate(StrToInt(MidStr(cadena,5,4)),StrToInt(MidStr(cadena,3,2)),StrToInt(LeftStr(cadena,2)));
           chkBox3.Checked := True;
           cmdLeer.Enabled := False;
           cmdDescomp.Enabled := True;
          end;

end;

procedure TfrmDescarMOVTD.EdArchivoExternoAfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
        btnArchivoExterno.Enabled := True;
end;

procedure TfrmDescarMOVTD.EdArchivoExternoChange(Sender: TObject);
begin
        if EdArchivoExterno.Text <> '' then
          btnArchivoExterno.Enabled := True
        else
          btnArchivoExterno.Enabled := False;
end;

function TfrmDescarMOVTD.BuscaAgencia(_starjeta: string): smallint;
begin

end;

procedure TfrmDescarMOVTD.DescargarMovs(fFileName: string);
var     _sSentencia :string;
        _sCadena :string;
        Archivo:TextFile;
        R:TRegMov;
        Monto:string;
        Comision :string;
        _iIdAgencia :Integer;
begin
        AssignFile(Archivo,fFileName);
        Reset(Archivo);
        while not Eof(Archivo) do

        begin
          Readln(Archivo,
                 R.NPOS_CSC,
                 R.NPOS_CTA,
                 R.NPOS_TAR,
                 R.NPOS_RAD,
                 R.NPOS_SEC,
                 R.NPOS_NTE,
                 R.NPOS_NOM,
                 R.NPOS_FEC,
                 R.NPOS_HOR,
                 R.NPOS_MON,
                 R.NPOS_CMS,
                 R.NPOS_TRA,
                 R.NPOS_ERR,
                 R.NPOS_TER,
                 R.NPOS_RED,
                 R.NPOS_NCA,
                 R.NPOS_FLD
                 );

          if R.NPOS_CSC = 'FOOTER' then
          begin
            Break;
          end;
          Monto := LeftStr(R.NPOS_MON,(Length(R.NPOS_MON)-2))+DECIMALSEPARATOR+RightStr(R.NPOS_MON,2);
          Comision := LeftStr(R.NPOS_CMS,(Length(R.NPOS_CMS)-2))+DECIMALSEPARATOR+RightStr(R.NPOS_CMS,2);
          _tData.Tarjeta := Trim(R.NPOS_TAR);
          _iIdAgencia := _tData.ValidaAgencia;
          _tData._sSentencia := 'insert into TDB$TARJETAMOV values ( ';
          _sSentencia := 'insert into "tmp$tarjetamovtem" values (';
          _sCadena := R.NPOS_CSC +
                      ',' + QuotedStr(R.NPOS_CTA) +
                      ',' + QuotedStr(R.NPOS_TAR) +
                      ',' + R.NPOS_RAD +
                      ',' + R.NPOS_SEC +
                      ',' + QuotedStr(R.NPOS_NTE) +
                      ',' + QuotedStr(R.NPOS_NOM) +
                      ',' + QuotedStr(DateToStr(EncodeDate(StrToInt(LeftStr(R.NPOS_FEC,4)),StrToInt(MidStr(R.NPOS_FEC,5,2)),StrToInt(RightStr(R.NPOS_FEC,2)))))+
                      ',' + QuotedStr(LeftStr(R.NPOS_HOR,2)  + ':' + MidStr(R.NPOS_HOR,3,2)+ ':' + RightStr(R.NPOS_HOR,2)) +
                      ',' + QuotedStr(Monto) +
                      ',' + QuotedStr(Comision) +
                      ',' + R.NPOS_TRA +
                      ',' + QuotedStr(R.NPOS_ERR) +
                      ',' + R.NPOS_TER +
                      ',' + R.NPOS_RED +
                      ',' + QuotedStr(R.NPOS_NCA) +
                      ',' + QuotedStr(R.NPOS_FLD) +
                      ',1' +
                      ',' + IntToStr(_iIdAgencia) +
                      ')';
         // _dFechaDescarga := EncodeDate(StrToInt(LeftStr(R.NPOS_FEC,4)),StrToInt(MidStr(R.NPOS_FEC,5,2)),StrToInt(RightStr(R.NPOS_FEC,2)));
          _tData._sSentencia := _tData._sSentencia + _sCadena;
          _sSentencia := _sSentencia + _sCadena;
          _tData.Query;
          CdSentencia.Append;
          CdSentencia.FieldValues['ID_AGENCIA'] := _iIdAgencia;
          CdSentencia.FieldValues['SENTENCIA'] := _sSentencia;
          CdSentencia.FieldValues['TIPO'] := 'insert';
          CdSentencia.Post;
        end;// fin del while
        _sCadena := '';
end;

procedure TfrmDescarMOVTD.FormCreate(Sender: TObject);
begin
        _tConexion := TConexion.Create;
        _tConexion.Conectar;
        _tData := TData.Create;
        _tData.Database := _tConexion.Database;
        ShortTimeFormat := 'HH:mm:ss';
end;

function TfrmDescarMOVTD.EnviarXml(_iIdPuerto:Integer;sIdHost,Desc:string;AstreamEnv:TMemoryStream): TMemoryStream;
var     Cadena :string;
        AStream : TMemoryStream;
        Tamano :Integer;
begin
        frmProgreso := TfrmProgreso.Create(self);
        frmProgreso.Titulo := 'Enviando Informacion de ' + Desc;
        frmProgreso.InfoLabel := 'Kbs Recibidos 0.2';
        with IdTCPClient1 do
        begin
          Port :=_iIdPuerto;
          Host := sIdHost;
          Application.ProcessMessages;
          Connect;
          if Connected then
          begin
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
        end;
        Result := AStream;
end;

procedure TfrmDescarMOVTD.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
          frmProgreso.InfoLabel := 'Kbs Enviados : ' + CurrToStr(AWorkCount/1000);
          frmProgreso.Position := AWorkCount;
          Application.ProcessMessages;
end;

procedure TfrmDescarMOVTD.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
          frmProgreso.Max := AWorkCountMax;
          frmProgreso.Min := 0;

end;

procedure TfrmDescarMOVTD.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
        frmProgreso.Max := 0;
end;

procedure TfrmDescarMOVTD.Transferir;
var     _bSiHay :Boolean;
        _iIdPuerto :Integer;
        _sIdHost :string;
        _sDescripcionAg :string;
        _iIdAgencia :Integer;
        _sMensaje :string;
        _iContador :Integer;
        _tComprobante :TComprobante;
        _cTotalBanco :Currency;
        _cERindediario :Currency;
        _cEJuvenil :Currency;
        _cSRindediario :Currency;
        _cSJuvenil :Currency;
        _cCRindediario :Currency;
        _cCJuvenil :Currency;
        _cGmfBanco :Currency;
        _cGmfComisionBanco :Currency;
        _sCodigoAg :string;
        _sCodBanco :string;
        _bConexion :Boolean;
        _sIdHostContable :string;
        _iIdPuertoContable :Integer;
        _sDesc :string;
begin
//        _dFechaDescarga := fFechaActual;
        _dFechaDescarga := Date;
        _tComprobante := TComprobante.Create;
        _tData.Sentencia := 'SELECT CODIGO FROM TDB$CODIGOPUC WHERE ID_CODIGO = 1';
        _sCodBanco := _tData.selectquery.FieldByName('CODIGO').AsString;
        with _tData.CodAgencia do
        begin
          while not Eof do
          begin
            _iIdAgencia := FieldByName('ID_AGENCIA').AsInteger;
            _iIdPuerto := FieldByName('ID_PUERTO').AsInteger;
            _sIdHost := FieldByName('ID_HOST').AsString;
            _sDescripcionAg := FieldByName('DESCRIPCION_AGENCIA').AsString;
            _sCodigoAg := FieldByName('CODIGO_CONTABLE').AsString;
            if _iIdAgencia = 1 then // para contabilizar
            begin
              _iIdPuertoContable := _iIdPuerto;
              _sIdHostContable := _sIdHost;
              _sDesc := _sDescripcionAg;
            end;
            _bSiHay := False;
            with CdSentencia do
            begin
               Filtered := False;
               Filter := 'ID_AGENCIA = ' + IntToStr(_iIdAgencia);
               Filtered := True;
               First;
               _iContador := 1;
               while not Eof do
               begin
                 if RecNo = 1 then
                 begin
                   _bSiHay := True;
                   _tXml.CrearXml;
                   _tXml.Sentencia := 'delete from "tmp$tarjetamovtem"';
                   _tXml.Tipo := 'delete';
                   _tXml.CargarNodo;
                 end;
                 _tXml.Tipo := FieldByName('TIPO').AsString;
                 _tXml.Sentencia := FieldByName('SENTENCIA').AsString;
                 _tXml.CargarNodo;
                 _iContador := _iContador + 1;
                 Next;
               end;   // fin del while del CdTarjeta
               if _bSiHay then
               begin
                 _tXml.Tipo := 'select';
                 _tXml.Sentencia := 'SELECT * FROM TDB_MOVTARJETA';
                 _tXml.CargarNodo;
                 Astream := _tXml.CargarAstream;
                 Astream.SaveToFile('c:\archivo' + IntToStr(_iIdAgencia) + '.xml');
                 _bConexion := True;
                 try
                  _tXml.AstreamEnt := EnviarXml(_iIdPuerto,_sIdHost,_sDescripcionAg,Astream);
                  except
                   begin
                      _bConexion := False;
                      frmProgreso.Cerrar;
                      IdTCPClient1.Disconnect;
                      _sMensaje := _sMensaje + _sDescripcionAg;
                   end;
                  end;
               end; // Ffin del try
            end;// fin del CdTarjeta
            if (_iIdAgencia <> 1) and (_bConexion) and (_bSiHay) then // validacion para la generacion de comprobante de sucursales
            begin
              _tXml.ListaConsulta := 'Consulta' + FormatCurr('000',_iContador);
              with _tXml.LeerXml do
              begin
               try
                _cERindediario := FieldByName('VALORERIND').AsCurrency;
                _cEJuvenil := FieldByName('VALOREJUV').AsCurrency;
                _cSRindediario := FieldByName('VALORSRIND').AsCurrency;
                _cSJuvenil := FieldByName('VALORSJUV').AsCurrency;
                _cCRindediario := FieldByName('VALORCRIND').AsCurrency;
                _cCJuvenil := FieldByName('VALORCJUV').AsCurrency;
                _cTotalBanco := FieldByName('TOTALBANCO').AsCurrency;
                _cGmfBanco := FieldByName('GMFBANCO').AsCurrency;
                _cGmfComisionBanco := FieldByName('GMFCOMISIONBANCO').AsCurrency;
               except
               end;
              end;
              _tXml.CrearXml;
              _tXml.Tipo := 'delete';
              _tXml.Sentencia := 'delete from "tmp$contable"';
              _tXml.CargarNodo;
              _tXml.Tipo := 'insert';
              if _cTotalBanco > 0 then
              begin
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodBanco) + ',' +
                              CurrToStr(_cTotalBanco) + ',' + '0' + ',' + QuotedStr(DBAlias) +
                              ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
              end;
              if _cERindediario > 0 then
              begin
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodigoAg) + ',' +
                              CurrToStr(_cERindediario) + ',' + '0' + ',' + QuotedStr(DBAlias) +
                              ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
              end;
              if _cEJuvenil > 0 then
              begin
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodigoAg) + ',' +
                              CurrToStr(_cEJuvenil) + ',' + '0' + ',' + QuotedStr(DBAlias) +
                              ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
              end;
              if _cSRindediario > 0 then
              begin
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodigoAg) +  ',' + '0' +
                               ',' + CurrToStr(_cSRindediario) + ',' + QuotedStr(DBAlias) +
                               ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
              end;
              if _cSJuvenil > 0 then
              begin
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodigoAg) +  ',' + '0' +
                               ',' + CurrToStr(_cSJuvenil) + ',' + QuotedStr(DBAlias) +
                               ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
              end;
              if _cCRindediario > 0 then
              begin
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodigoAg) +  ',' + '0' +
                               ',' + CurrToStr(_cCRindediario) + ',' + QuotedStr(DBAlias) +
                               ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
              end;
              if _cCJuvenil > 0 then
              begin
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodigoAg) +  ',' + '0' +
                               ',' + CurrToStr(_cCJuvenil) + ',' + QuotedStr(DBAlias) +
                               ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
              end;
              if _cGmfBanco > 0 then
              begin
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodBanco) + ',' +
                              CurrToStr(_cGmfBanco) + ',' + '0' + ',' + QuotedStr(DBAlias) +
                              ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
               //
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodigoAg) +  ',' + '0' +
                               ',' + CurrToStr(_cGmfBanco) + ',' + QuotedStr(DBAlias) +
                               ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
              end;
              if _cGmfComisionBanco > 0 then
              begin
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodBanco) + ',' +
                              CurrToStr(_cGmfComisionBanco) + ',' + '0' + ',' + QuotedStr(DBAlias) +
                              ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;
               //
               _tXml.Sentencia := 'insert into "tmp$contable" values( ' + QuotedStr(_sCodigoAg) +  ',' + '0' +
                               ',' + CurrToStr(_cGmfComisionBanco) + ',' + QuotedStr(DBAlias) +
                               ',' + QuotedStr(DateToStr(_dFechaDescarga)) + ',' + QuotedStr(_sDescripcionAg) + ')';
               _tXml.CargarNodo;

              end;
              _tXml.Tipo := 'execute';
              _tXml.Sentencia := 'execute PROCEDURE TDB_COMPROBANTE';
              _tXml.CargarNodo;
             Astream := _tXml.CargarAstream;
             _iIdPuertoContable := 3052;
             _sIdHostContable := '192.168.200.141';
             _sDesc := 'Ocaña';
             _tXml.AstreamEnt := EnviarXml(_iIdPuertoContable,_sIdHostContable,_sDesc,Astream);
            end;
            Next;
          end; // fin del while principal
        end; // fin del _tData.CodAgencia
        if _sMensaje = '' then
          MessageDlg('Proceso Culminado con Exito',mtInformation,[mbok],0)
        else
          MessageDlg('Proceso culminado pero no se logro Comunicación con las siguientes Agencias: ' + _sMensaje,mtWarning,[mbok],0);

end;

procedure TfrmDescarMOVTD.DescargarBlqs(fFileName :string);
var
  Archivo:TextFile;
  Registro:string;
  R:TRegBlq;
 _iIdAgencia :Integer;
 _sSentencia :string;
 _sCadena :string;
 _sSentenciaUp :string;
begin
         AssignFile(Archivo,fFileName);
         Reset(Archivo);
         while not Eof(Archivo) do
         begin
           Readln(Archivo,
                  R.NOV_SEC,
                  R.NOV_BIN,
                  R.NOV_CAR,
                  R.NOV_FRE,
                  R.NOV_HOR,
                  R.NOV_FCO,
                  R.NOV_COD,
                  R.NOV_TER,
                  R.NOV_USE
                  );
            if LeftStr(R.NOV_SEC,6) = 'FOOTER' then
            begin
             Break;
            end;
           _tData._sTarjeta := LeftStr(R.NOV_BIN +R.NOV_CAR,16);
          _iIdAgencia := _tData.ValidaAgencia;
          _tData._sSentencia := 'insert into TDB$TARJETABLQ values ( ';
          _sSentencia := 'insert into "cap$tarjetablq" values (';
          _sCadena := QuotedStr(R.NOV_SEC) +
                      ',' + QuotedStr(R.NOV_BIN) +
                      ',' + QuotedStr(R.NOV_CAR) +
                      ',' + QuotedStr(DateToStr(EncodeDate(StrToInt(LeftStr(R.NOV_FRE,4)),StrToInt(MidStr(R.NOV_FRE,5,2)),StrToInt(RightStr(R.NOV_FRE,2))))) +
                      ',' + QuotedStr(TimeToStr(EncodeTime(StrToint(LeftStr(R.NOV_HOR,2)),StrToInt(MidStr(R.NOV_HOR,3,2)),StrToInt(RightStr(R.NOV_HOR,2)),00))) +
                      ',' + QuotedStr(DateToStr(EncodeDate(StrToInt(LeftStr(R.NOV_FCO,4)),StrToInt(MidStr(R.NOV_FCO,5,2)),StrToInt(RightStr(R.NOV_FCO,2))))) +
                      ',' + R.NOV_COD +
                      ',' + QuotedStr(R.NOV_TER) +
                      ',' + QuotedStr(R.NOV_USE) +
                      ',' + IntToStr(_iIdAgencia) +
                      ')';
          _tData._sSentencia := _tData._sSentencia + _sCadena;
          _sSentencia := _sSentencia + _sCadena;
          _sSentenciaUp := 'update "cap$tarjetacuenta" set ID_ESTADO = 3, FECHA_CANCELADA = ' + QuotedStr(DateToStr(EncodeDate(StrToInt(LeftStr(R.NOV_FRE,4)),StrToInt(MidStr(R.NOV_FRE,5,2)),StrToInt(RightStr(R.NOV_FRE,2))))) +
                           ' where ID_TARJETA = ' + QuotedStr(LeftStr(R.NOV_BIN +R.NOV_CAR,16));
          Memo1.Text := _sSentencia;
          _tData.Query;
          with CdSentencia do
          begin
            Append;
            FieldValues['ID_AGENCIA'] := _iIdAgencia;
            FieldValues['SENTENCIA'] := _sSentencia;
            FieldValues['TIPO'] := 'insert';
            Post;
            Append;
            FieldValues['ID_AGENCIA'] := _iIdAgencia;
            FieldValues['SENTENCIA'] := _sSentenciaUp;
            FieldValues['TIPO'] := 'insert';
            Post;

          end;
         end;// fin del while
end;

procedure TfrmDescarMOVTD.DescargarTars(fFileName: string);
var
  Archivo:TextFile;
  Registro:string;
  R:TRegTar;
  Valor:Currency;
begin
        AssignFile(Archivo,fFileName);
        Reset(Archivo);
         while not Eof(Archivo) do
         begin
           Readln(Archivo,
                  R.TAR_NEW,
                  R.TAR_CUP
                  );
          _tData.Sentencia := 'insert into TDB$TARJETA values(' +  QuotedStr(R.TAR_NEW) + ',0,0)';
          _tData.Query;
        end;

end;

end.
