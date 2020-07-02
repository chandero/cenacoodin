unit UDPTDMain;

interface

uses
  IniFiles,DateUtils, StrUtils, SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, Provider, DB, DBClient, QExtCtrls,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer, IdSocketHandle,UnitDES,HexConvert,sdXmlDocuments,
  QButtons, QTypes,
  FMTBcd, DBXpress, SqlExpr;

type
  TDatos = record
    Estado:Integer;
    Error:Integer;
    Id_Agencia:Integer;
    Id_Tipo_Captacion:Integer;
    Numero_Cuenta:Integer;
    Digito_Cuenta:Integer;
    CupoPos:Currency;
    CupoATM:Currency;
    Saldo:Currency;
    Disponible:Currency;
  end;

type
  TDatosMov = record
     Estado:Boolean;
     Monto:Currency;
     Fecha:TDateTime;
     Hora:TDateTime;
  end;

type
  TRespuesta = record
     Respuesta:Boolean;
     Error:Integer;
     Monto:Currency;
     Saldo:Currency;
     Disponible:Currency;
     CupoPOS:Currency;
     CupoATM:Currency;
     Id_Agencia:Integer;
     Id_Tipo_Captacion:Integer;
     Numero_Cuenta:Integer;
     Digito_Cuenta:Integer;
  end;


type
  TfrmUDPTDMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    UDPServer: TIdUDPServer;
    BitBtn1: TBitBtn;
    Timer1: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SQLStoredProc1: TSQLStoredProc;
    SQLConnOrig: TSQLConnection;
    Label7: TLabel;
    Label8: TLabel;
    Panel4: TPanel;
    LogMemo: TMemo;
    Panel5: TPanel;
    LogMemo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure UDPServerUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure TratarDatos(AData: TStream);

    function f_m_a_peticion   (SQLConn:TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta:string;
                            CausalRet:Integer;
                            MontoRet:Currency;
                            SecuenciaRet:string): TRespuesta;
    function f_m_b_peticion   (SQLConn:TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta:string;
                            CausalRet:Integer;
                            MontoRet:Currency;
                            SecuenciaRet:string): TRespuesta;
    function f_m_peticion     (SQLConn: TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta: string;
                            CausalRet: Integer;
                            MontoRet: Currency;
                            SecuenciaRet: String): TRespuesta;
    function f_m_r_peticion   (SQLConn: TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta: string;
                            CausalRet: Integer;
                            MontoRet: Currency;
                            SecuenciaRet: String): TRespuesta;
    function f_m_r_a_peticion (SQLConn: TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta: string;
                            CausalRet: Integer;
                            MontoRet: Currency;
                            SecuenciaRet: String): TRespuesta;
    function f_m_a_reverso (SQLConn: TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta: string;
                            CausalRet: Integer;
                            MontoRet: Currency;
                            SecuenciaRet: String): TRespuesta;
    function f_m_b_reverso (SQLConn: TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta: string;
                            CausalRet: Integer;
                            MontoRet: Currency;
                            SecuenciaRet: String): TRespuesta;
    function BuscarDatos(SQLConn:TSQLConnection;
                         IDT:TTransactionDesc;
                         ID_Tarjeta: string): TDatos;
    function BuscarDatosMov(SQLConn: TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta,
                            Secuencia: String): TDatosMov;
    { Private declarations }
  public
    { Public declarations }
  end;

type
   TXMLHead=Record
     szHead:array[0..2] of Char;
     nSize :array[0..3] of Byte;
     nCrc  :array[0..3] of Byte;
     vbKey :array[0..7] of Byte;
end;

const
//CAUSALES
C_COMPRA = 0;
C_RETIRO = 1;
C_ANULACION = 20;
C_CONSIGNACION = 22;
C_CONSULTA1 = 30;
C_CONSULTA2 = 31;

T_C_COMPRA = 'COMPRA';
T_C_RETIRO = 'RETIRO';
T_C_ANULACION = 'ANULACION';
T_C_CONSIGNACION = 'CONSIGNACION';
T_C_CONSULTA1 = 'CONSULTA';
T_C_CONSULTA2 = 'CONSULTA';
//MENSAJES
M_PETICION = 200;
M_R_PETICION = 210;
M_A_PETICION = 220;
M_B_PETICION = 221;
M_R_A_PETICION = 230;
M_A_REVERSO = 420;
M_B_REVERSO = 421;
M_R_A_REVERSO = 430;

T_M_PETICION = 'PETICION';
T_M_R_PETICION = 'RESPUESTA PETICION';
T_M_A_PETICION = 'REINTENTO PETICION';
T_M_B_PETICION = 'REINTENTO A REINTENTO PETICION';
T_M_R_A_PETICION = 'RESPUESTA REINTENTO PETICION';
T_M_A_REVERSO = 'REVERSO';
T_M_B_REVERSO = 'REINTENTO REVERSO';
T_M_R_A_REVERSO = 'RESPUESTA REVERSO';

//ERRORES
E_BIEN = 0;
E_TARJETA_INVALIDA = 56;
E_FONDOS_INSUFICIENTES = 51;
E_TARJETA_VENCIDA = 54;

T_E_BIEN = 'EXITOSA';
T_E_TARJETA_INVALIDA = 'TARJETA NO VALIDA';
T_E_FONDOS_INSUFICIENTES = 'FONDOS INSUFICIENTES';
T_E_TARJETA_VENCIDA = 'TARJETA YA CADUCO';

var
  frmUDPTDMain: TfrmUDPTDMain;

  HostR:string;
  PuertoR:integer;
  KeyRet:string;
  DBName:string;
  User:string;
  Password:string;
  Role:string;


implementation

{$R *.xfm}

procedure TfrmUDPTDMain.FormCreate(Sender: TObject);
var
  MiiNi:TIniFile;
begin
  MiiNi := TiniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  DBName := MiIni.ReadString('SERVER','DataBase','192.168.200.7:/var/db/fbird/database.fdb');
  User := MiIni.ReadString('SERVER','Usuario','REMOTEQUERY');
  Password := MiIni.ReadString('SERVER','Password','remotequery');
  Role := MiIni.ReadString('SERVER','Role','REMOTE');
  HostR:= MiIni.ReadString('DES','HostRet','0.0.0.0');
  PuertoR:= MiIni.ReadInteger('DES','PuertoRet',0);
  KeyRet:= MiIni.ReadString('DES','Key','0123456789ABCDEF');
//  HostName.Caption := UDPServer.LocalName;
//  HostAddress.Caption := GStack.LocalAddress;
//  Port.Caption := IntToStr(UDPServer.DefaultPort);
  label8.Caption := DBName;
//  BufferSize.Caption := IntToStr(UDPServer.BufferSize);
  UDPServer.Active := True;

  Label4.Caption := HostR+':'+IntToStr(PuertoR);
  label2.Caption := DateTimeToStr(Now);
end;

procedure TfrmUDPTDMain.TratarDatos(AData: TStream);
var
// Para la conexion
  SQLConn: TSQLConnection;
//
  Aplicar:Boolean;
  EncaXML:string;
  EncaXMLRet:TXMLHead;
  Input:TStream;
  DataStringStream: TStringStream;
  s: String;
  Encabezado:TXMLHead;
  Datos:array[0..1023] of Byte;
  Buffer:array[0..1042] of Byte;
  Size,Longitud:Integer;
  KeyString,DataString,ResCadena:string;
  i,j,Bloques:Integer;
  XmlString:string;
  XmlDoc:TsdXmlDocument;
  HostRet:string;
  PuertoRet:Integer;
  IdRet:LongWord;
  ID_Tarjeta:string;
  HXMLNode:TXmlNode;
  SXMLNode:TXmlNode;
  DXMLNode:TXmlNode;
  RXMLNode:TXmlNode;
  Ano,Mes,Dia,Hora,Minuto,Segundo:Integer;
  SecuenciaRet:string;
  Mensaje,MensajeRet:Integer;
  CausalRet:Integer;
  RedRet:Integer;
  MontoRet:Currency;
// Datos Extra
  Terminal:string;
  IdCaja:Integer;
// Datos Conexion
  IDT :TTransactionDesc;
//  SQLSP:TSQLStoredProc;
  SQLQ:TSQLQuery;
// Datos de Cuenta
//  Id_Agencia,Id_Tipo_Captacion,Numero_Cuenta,Digito_Cuenta:integer;
// Datos de Cuenta
  Estado:Integer;
  Saldo:Currency;
  Disponible:Currency;
  CupoPos:Currency;
  CupoAtm:Currency;
//Datos de Respuesta
  Error:Integer;
  LongData:integer;
  Pint:^Integer;
  PByte:^Byte;
  Hex:String;
  Existe:Boolean;
  Registro:TextFile;
  Respuesta:TRespuesta;
  FechaActual:TDateTime;
  HoraActual:TDateTime;

// Textos
  MensajeTXT:string;
  CausalTXT:string;

procedure Conectar;
 begin
  try
   SQLConn.Open;
  except
   raise;
  end;
end;

procedure Desconectar;
begin
  try
   SQLConn.Close;
  except
   raise;
  end;
end;


begin
// Hacer conexión
  SQLConn := TSQLConnection.create(nil);

  SQLConn.ConnectionName := 'IBConnection';
  SQLConn.DriverName := 'Interbase';
  SQLConn.GetDriverFunc := 'getSQLDriverINTERBASE';
  SQLConn.KeepConnection := True;
  SQLConn.LibraryName := 'libsqlib.so.1';
  SQLConn.LoadParamsOnConnect := False;
  SQLConn.LoginPrompt := False;
  SQLConn.Name := 'SQLConn';
  SQLConn.VendorLib := 'libgds.so.0';
  SQLConn.Params.Clear;
  SQLConn.Params.Add('Database='+DBName);
  SQLConn.Params.Add('RoleName='+Role);
  SQLConn.Params.Add('User_Name='+User);
  SQLConn.Params.Add('Password='+Password);
  SQLConn.Params.Add('ServerCharSet=ISO8859_1');
  SQLConn.Params.Add('SQLDialect=3');
  SQLConn.Params.Add('ErrorResourceFile=./DbxIbErr.msg');
  SQLConn.Params.Add('LocaleCode=0000');
  SQLConn.Params.Add('BlobSize=-1');
  SQLConn.Params.Add('CommitRetain=False');
  SQLConn.Params.Add('WaitOnLocks=True');
  SQLConn.Params.Add('Interbase TransIsolation=ReadCommited');

//


  Aplicar := true;
  Respuesta.Error := 00;
  Respuesta.Saldo := 0;
  Respuesta.Disponible := 0;
  CupoPos := 0;
  CupoAtm := 0;
  Input := TMemoryStream.Create;
  try
    AData.Seek(0,soFromBeginning);
    Input.CopyFrom(AData,AData.Size);
    Size := Input.Size;
    Longitud := Size-SizeOf(Encabezado);

//    SetLength(Datos,Longitud);

    Input.Seek(0,soFromBeginning);
    Input.Read(Encabezado,SizeOf(Encabezado));
    Input.Read(Datos,Longitud);
   finally
    Input.Free;
   end;

//    pLongitud := Addr(Encabezado.nSize);
//    Longitud := pLongitud^;

    KeyString := ToHex(Encabezado.vbkey,SizeOf(Encabezado.vbKey));
    DataString := ToHex(Datos,Longitud);

// Agregar proceso de descifrado de la llave

//    EditLlaveEnc.Text := KeyString;

    KeyString := DESCipher(KeyString,'0123456789ABCDEF',False);

//    EditLlaveDes.Text := KeyString;

// Agregar proceso de Descifrado de los datos

//    Memo1.Text := DataString;

    DataString := DESCipher(DataString,KeyString,False);

//    Memo2.Text := DataString;

    Bloques := Length(DataString) div 2;

    ResCadena := '';

    for i := 0 to Bloques -1 do
    begin
        ResCadena := ResCadena + HexToString(MidStr(DataString,i*2+1,2));
    end;

// Mostrar archivo en el TMemo
//   UDPMemo.Text := ResCadena;
// Crear archivo XML

    EncaXML := '<?xml version="1.0" encoding="ISO-8859-1" ?> ';
    XmlString := EncaXML + ResCadena;
    XmlDoc := TsdXmlDocument.Create;
    XmlDoc.XmlFormat := xfReadable;
    XmlDoc.ReadFromString(XmlString);
//    XMLMemo.Text := XmlDoc.WriteToString;

    HXMLNode := XmlDoc.Root.NodeByName('HEADER');
    HostRet := HXMLNode.ReadString('SOURCE');
//    SXMLNode := HXMLNode.NodeByName('SOURCE');
//    HostRet := SXMLNode.ValueAsString;
    DXMLNode := XmlDoc.Root.NodeByName('DATA');
    RXMLNode := DXMLNode.NodeByName('ROW');

// Tomar datos archivo XML
    if RXMLNode.ReadAttributeString('SOURCE') <> 'ATMPOS' then Exit; //agregar codigo de rechazo

    PuertoRet := RXMLNode.ReadAttributeInteger('PORT');
    IdRet := RXMLNode.ReadAttributeInteger('ID');
    Ano := YearOf(Date);
    Mes := StrToInt(LeftStr(RXMLNode.ReadAttributeString('DATE'),2));
    Dia := StrToInt(RightStr(RXMLNode.ReadAttributeString('DATE'),2));
    Hora := StrToInt(LeftStr(RXMLNode.ReadAttributeString('TIME'),2));
    Minuto := StrToInt(MidStr(RXMLNode.ReadAttributeString('TIME'),3,2));
    Segundo := StrToInt(RightStr(RXMLNode.ReadAttributeString('TIME'),2));
    SecuenciaRet := RXMLNode.ReadAttributeString('SECUENCE');
    Terminal := RightStr(LeftStr(SecuenciaRet,8),6);
    Mensaje := RXMLNode.ReadAttributeInteger('MESSAGE');
    CausalRet := RXMLNode.ReadAttributeInteger('CAUSAL');
    ID_Tarjeta := RXMLNode.ReadAttributeString('CARD');
    RedRet := RXMLNode.ReadAttributeInteger('NET');
    MontoRet := RXMLNode.ReadAttributeInteger('AMMOUNT');

    MensajeTXT := '';
    CausalTXT  := '';

    case Mensaje of
        M_PETICION   : MensajeTXT := T_M_PETICION;
        M_A_PETICION : MensajeTXT := T_M_A_PETICION;
        M_B_PETICION : MensajeTXT := T_M_B_PETICION;
        M_A_REVERSO  : MensajeTXT := T_M_A_REVERSO;
        M_B_REVERSO  : MensajeTXT := T_M_B_REVERSO;
        else
          MensajeTXT := IntToStr(Mensaje);
    end;

    case CausalRet of
        C_COMPRA       : CausalTXT := T_C_COMPRA;
        C_RETIRO       : CausalTXT := T_C_RETIRO;
        C_CONSIGNACION : CausalTXT := T_C_CONSIGNACION;
        C_CONSULTA1    : CausalTXT := T_C_CONSULTA1;
        C_CONSULTA2    : CausalTXT := T_C_CONSULTA2;
        else
          CausalTXT := IntToStr(CausalRet);
    end;

    AssignFile(Registro,'UDPServerTD.log');
    Append(Registro);

    XmlDoc.Free;
    Application.ProcessMessages;


// Convertir Fecha y Hora
    FechaActual := EncodeDate(Ano,Mes,Dia);
    HoraActual  := EncodeTime(Hora,Minuto,Segundo,0);


// Conectar
    Conectar;

    IDT.IsolationLevel := xilREADCOMMITTED;
    IDT.TransactionID := IdRet;

    SQLQ := TSQLQuery.Create(nil);
    SQLQ.SQLConnection := SQLConn;

// Mirar si el movimiento es de un Datafono
    IdCaja := 0;
    SQLConn.StartTransaction(IDT);
    with SQLQ do begin
     Close;
     SQL.Clear;
     SQL.Add('select ID_CAJA from CAJ$CAJAS where DATAFONO = :DATAFONO');
     ParamByName('DATAFONO').AsString := Terminal;
     try
      Open;
      IdCaja := FieldByName('ID_CAJA').AsInteger;
     except
      Close;
      SQLConn.Rollback(IDT);
      Desconectar;
      Exit;
     end;
    end;

    SQLConn.Commit(IDT);


    Writeln(Registro,'Peticion:'+FormatDateTime('yyyy/mm/dd hh:mm:ss',Now)+#13+#10+
                     'Mensaje='+MensajeTXT+#13+#10+
                     'Causal='+CausalTXT+#13+#10+
                     'Tarjeta='+ID_Tarjeta+#13+#10+
                     'Secuencia='+SecuenciaRet+#13+#10+
                     'Monto='+CurrToStr(MontoRet)+#13+#10+
                     'Fecha='+Format('%.4d',[Ano])+'/'+Format('%.2d',[Mes])+'/'+Format('%.2d',[Dia])+#13+#10+
                     'Hora='+Format('%.2d',[Hora])+':'+Format('%.2d',[Minuto])+':'+Format('%.2d',[Segundo])+#13+#10);
    Closefile(Registro);

    LogMemo.Lines.Add('Peticion:'+FormatDateTime('yyyy/mm/dd hh:mm:ss',Now)+#13+#10+
                      'Mensaje='+MensajeTXT+#13+#10+
                      'Causal='+CausalTXT+#13+#10+
                      'Tarjeta='+ID_Tarjeta+#13+#10+
                      'Secuencia='+SecuenciaRet+#13+#10+
                      'Monto='+CurrToStr(MontoRet)+#13+#10+
                      'Fecha='+Format('%.4d',[Ano])+'/'+Format('%.2d',[Mes])+'/'+Format('%.2d',[Dia])+#13+#10+
                      'Hora='+Format('%.2d',[Hora])+':'+Format('%.2d',[Minuto])+':'+Format('%.2d',[Segundo])+#13+#10);



// Verificar si es un reintento ya respondido


    if ( (Mensaje = M_A_PETICION) or
       (Mensaje = M_B_PETICION) or
       (Mensaje = M_B_REVERSO) ) then
    begin
      SQLConn.StartTransaction(IDT);
      with SQLQ do begin
        Close;
        SQL.Clear;
        SQL.Add('select * from "cap$tarjetamovol" where');
        SQL.Add('FECHA = :FECHA and HORA = :HORA and ID_TARJETA = :ID_TARJETA and');
        SQL.Add('SECUENCIA = :SECUENCIA and MENSAJE = :MENSAJE and');
        SQL.Add('CAUSAL = :CAUSAL and MONTO = :MONTO');
        ParamByName('FECHA').AsDate := FechaActual;
        ParamByName('HORA').AsTime :=  HoraActual;
        ParamByName('ID_TARJETA').AsString := ID_Tarjeta;
        ParamByName('SECUENCIA').AsString := SecuenciaRet;
        ParamByName('MENSAJE').AsInteger := Mensaje;
        ParamByName('CAUSAL').AsInteger := CausalRet;
        ParamByName('MONTO').AsCurrency := MontoRet;
        try
         Open;
         Existe := False;
         While Not Eof do
         begin
           Existe := True;
           Next;
         end;
         if Existe then
         begin
          Close;
          LogMemo.Lines.Add('ya respondido'+#13+#10);
          Desconectar;
          Exit;
         end
         else
         begin
          LogMemo.Lines.Add('no respondido'+#13+#10);
         end;
        except
           Close;
           SQLConn.Rollback(IDT);
           Desconectar;
           Exit;
        end; // fin de try
      end; // fin del with
      SQLConn.Commit(IDT);
    end; // fin del if




// Separar por tipo de Mensaje

   case Mensaje of
      M_PETICION,
      M_A_PETICION,
      M_B_PETICION:
          respuesta := f_m_peticion(SQLConn,
                                      IDT,
                                      ID_Tarjeta,
                                      CausalRet,
                                      MontoRet,
                                      SecuenciaRet
                                      );


{      M_A_PETICION:
          respuesta := f_m_a_peticion(SQLConn,
                                      IDT,
                                      ID_Tarjeta,
                                      CausalRet,
                                      MontoRet,
                                      SecuenciaRet
                                      );

      M_B_PETICION:
          respuesta := f_m_b_peticion(SQLConn,
                                      IDT,
                                      ID_Tarjeta,
                                      CausalRet,
                                      MontoRet,
                                      SecuenciaRet
                                      );
}
      M_A_REVERSO,M_B_REVERSO:
          respuesta := f_m_a_reverso(SQLConn,
                                      IDT,
                                      ID_Tarjeta,
                                      CausalRet,
                                      MontoRet,
                                      SecuenciaRet
                                      );
{
      M_B_REVERSO:
          respuesta := f_m_b_reverso(SQLConn,
                                      IDT,
                                      ID_Tarjeta,
                                      CausalRet,
                                      MontoRet,
                                      SecuenciaRet
                                      );
}
{
      M_R_PETICION:
          respuesta := f_m_r_peticion(SQLConn,
                                      IDT,
                                      ID_Tarjeta,
                                      CausalRet,
                                      MontoRet,
                                      SecuenciaRet
                                      );
}
{
      M_R_A_PETICION:
          respuesta := f_m_r_a_peticion(SQLConn,
                                      IDT,
                                      ID_Tarjeta,
                                      CausalRet,
                                      MontoRet,
                                      SecuenciaRet
                                      );
}
{
      M_R_A_REVERSO:
          respuesta := f_m_a_peticion(SQLConn,
                                      IDT,
                                      ID_Tarjeta,
                                      CausalRet,
                                      MontoRet,
                                      SecuenciaRet
                                      );
}
      else
         Exit;
    end; // fin del Case Mensaje

// Registrar movimientos de respuesta reintentos

    if ((Mensaje = M_A_PETICION) or
        (Mensaje = M_B_PETICION) or
        (Mensaje = M_B_REVERSO) ) then
    begin
      SQLConn.StartTransaction(IDT);
      with SQLQ do begin
        Close;
        SQL.Clear;
        SQL.Add('insert into "cap$tarjetamovol" values(');
        SQL.Add(':FECHA, :HORA, :ID_TARJETA,');
        SQL.Add(':SECUENCIA, :MENSAJE,');
        SQL.Add(':CAUSAL, :MONTO ');
        SQL.Add(')');
        ParamByName('FECHA').AsDate := EncodeDate(Ano,Mes,Dia);
        ParamByName('HORA').AsTime :=  EncodeTime(Hora,Minuto,Segundo,0);
        ParamByName('ID_TARJETA').AsString := ID_Tarjeta;
        ParamByName('SECUENCIA').AsString := SecuenciaRet;
        ParamByName('MENSAJE').AsInteger := Mensaje;
        ParamByName('CAUSAL').AsInteger := CausalRet;
        ParamByName('MONTO').AsCurrency := MontoRet;
        try
         ExecSQL;
        except
         SQLConn.Rollback(IDT);
         raise;
         Exit;
        end; // fin del try
      end; // fin del with
      SQLConn.Commit(IDT);
    end; // fin del if


// Aplicar Operacion

    if SQLConn.InTransaction then
       SQLConn.Commit(IDT);

    SQLConn.StartTransaction(IDT);

    with SQLQ do begin
       SQL.Clear;
       SQL.Add('insert into "cap$tarjetamovsdia" VALUES(');
       SQL.Add(':ID_TARJETA,:SECUENCIA,:MONTO,:FECHA,:HORA,');
       SQL.Add(':ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA)');
       ParamByName('ID_TARJETA').AsString := LeftStr(ID_Tarjeta,16);
       ParamByName('SECUENCIA').AsString := SecuenciaRet;
       ParamByName('MONTO').AsCurrency := Respuesta.Monto;
       ParamByName('FECHA').AsDate := FechaActual;
       ParamByName('HORA').AsTime  := HoraActual;
       ParamByName('ID_AGENCIA').AsInteger        := Respuesta.Id_Agencia;
       ParamByName('ID_TIPO_CAPTACION').AsInteger := Respuesta.Id_Tipo_Captacion;
       ParamByName('NUMERO_CUENTA').AsInteger     := Respuesta.Numero_Cuenta;
       ParamByName('DIGITO_CUENTA').AsInteger     := Respuesta.Digito_Cuenta;

       try
        if MontoRet <> 0 then
        begin
         ExecSQL;

// Validar si es por DataFono
         if (IdCaja > 0) and
            (CausalRet in [C_COMPRA,C_RETIRO,C_CONSIGNACION]) then
          begin
          Close;
          SQL.Clear;
          SQL.Add('insert into "caj$movimiento" (');
          SQL.Add('ID_CAJA,');
          SQL.Add('FECHA_MOV,');
          SQL.Add('ID_AGENCIA,');
          SQL.Add('ID_TIPO_CAPTACION,');
          SQL.Add('NUMERO_CUENTA,');
          SQL.Add('DIGITO_CUENTA,');
          SQL.Add('ORIGEN_MOVIMIENTO,');
          SQL.Add('ID_TIPO_MOVIMIENTO,');
          SQL.Add('DOCUMENTO,');
          SQL.Add('CHEQUES_MOVIMIENTO,');
          SQL.Add('BILLETES,');
          SQL.Add('MONEDAS,');
          SQL.Add('CHEQUES,');
          SQL.Add('HUELLA');
          SQL.Add(') values (');
          SQL.Add(':ID_CAJA,');
          SQL.Add(':FECHA_MOV,');
          SQL.Add(':ID_AGENCIA,');
          SQL.Add(':ID_TIPO_CAPTACION,');
          SQL.Add(':NUMERO_CUENTA,');
          SQL.Add(':DIGITO_CUENTA,');
          SQL.Add(':ORIGEN_MOVIMIENTO,');
          SQL.Add(':ID_TIPO_MOVIMIENTO,');
          SQL.Add(':DOCUMENTO,');
          SQL.Add(':CHEQUES_MOVIMIENTO,');
          SQL.Add(':BILLETES,');
          SQL.Add(':MONEDAS,');
          SQL.Add(':CHEQUES,');
          SQL.Add(':HUELLA');
          SQL.Add(')');
          ParamByName('ID_CAJA').AsInteger := IdCaja;
          ParamByName('FECHA_MOV').AsDateTime := EncodeDateTime(Ano,Mes,Dia,Hora,Minuto,Segundo,00);
          ParamByName('ID_AGENCIA').AsInteger := Respuesta.Id_Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := Respuesta.Id_Tipo_Captacion;
          ParamByName('NUMERO_CUENTA').AsInteger := Respuesta.Numero_Cuenta;
          ParamByName('DIGITO_CUENTA').AsInteger := Respuesta.Digito_Cuenta;
          ParamByName('ORIGEN_MOVIMIENTO').AsInteger := 10;

          case CausalRet of
             C_COMPRA,
             C_RETIRO       : ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 2;
             C_CONSIGNACION : ParamByName('ID_TIPO_MOVIMIENTO').AsInteger := 1;
          end;
          
          ParamByName('DOCUMENTO').AsString := SecuenciaRet;
          ParamByName('CHEQUES_MOVIMIENTO').AsInteger := 0;
          ParamByName('BILLETES').AsCurrency := MontoRet;
          ParamByName('MONEDAS').AsCurrency := 0;
          ParamByName('CHEQUES').AsCurrency := 0;
          ParamByName('HUELLA').AsInteger := 0;
          try
           ExecSQL;
// Aplicar Transacción
          except
           SQLConn.Rollback(IDT);
          end;

         end;
         SQLConn.Commit(IDT);
        end;
       except
         SQLConn.Rollback(IDT);
       end; // fin try
      end; // fin with


// Cerrar conexion
 Desconectar;

 if not Respuesta.Respuesta then Exit;

// Crear XML
    XMLString := '<TRANSA><HEADER><SOURCE>0.0.0.0</SOURCE></HEADER>';
    XMLString := XMLString + '<FIELDS></FIELDS><DATA><ROW ';
    XMLString := XMLString + 'ID="'+IntToStr(IdRet)+'" ';
    XMLString := XMLString + 'CARD="'+Trim(ID_Tarjeta)+'" ';
    if Mensaje = M_PETICION then
       MensajeRet := M_R_PETICION
    else
    if (Mensaje = M_A_PETICION) or (Mensaje = M_B_PETICION) then
       MensajeRet := M_R_A_PETICION
    else
    if (Mensaje = M_A_REVERSO) OR (Mensaje = M_B_REVERSO) then
       MensajeRet := M_R_A_REVERSO
    else
       MensajeRet := 000;

    XMLString := XMLString + 'MESSAGE="'+ IntToStr(MensajeRet)+'" ';

//
    XMLString := XMLString + 'ERROR="'+Format('%.2d',[Respuesta.Error])+'" ';
    XMLString := XMLString + 'AMMOUNT1="'+FormatCurr('#0',Respuesta.Saldo)+'" ';
    XMLString := XMLString + 'AMMOUNT2="'+FormatCurr('#0',Respuesta.Disponible)+'" ';
    XMLString := XMLString + '/></DATA></TRANSA>';

//    XMLRMemo.Text := XMLString;



    DataString := TextToHex(XMLString);//,Length(XMLString));
    if (Length(DataString) mod 16 <> 0) then
    begin
         j := 16 - (Length(DataString) mod 16);
         for i := 1 to j do
          DataString := DataString + '0';
    end;

    DataString := DESCipher(DataString,KeyRet,True);
    KeyString  := DESCipher(KeyRet,'0123456789ABCDEF',True);

    EncaXMLRet.szHead := 'XML';
    Pint := Addr(EncaXMLRet.nSize);
    Pint^:= Length(DataString) div 2;
    Pint := Addr(EncaXMLRet.nCrc);
    Pint^:= 0;

    for i := 0 to 7 do
     EncaXMLRet.vbKey[i] := StrToInt('$'+MidStr(KeyString,i*2+1,2));

    PByte := @EncaXMLRet;
    for i := 0 to 18 do
    begin
      Buffer[i] := PByte^;
      Inc(PByte);
    end;

    j := (Length(DataString) div 2)-1;

    for i := 0 to j do
    begin
     Hex := MidStr(DataString,i*2+1,2);
     Buffer[19+i] := StrToInt('$'+Hex);
    end;

    i := i + 19;
//    XMLRMemo.Lines.Add('Armando respuesta');
// Enviar Respuesta
    UDPServer.SendBuffer(HostR,PuertoRet,Buffer,i);

    AssignFile(Registro,'UDPServerTD.log');
    Append(Registro);
    Writeln(Registro,'Respuesta:'+FormatDateTime('yyyy/mm/dd hh:mm:ss',Now)+#13+#10+
                     'Mensaje='+IntToStr(MensajeRet)+#13+#10+
                     'Error='+Format('%.2d',[Respuesta.Error])+#13+#10+
                     'Tarjeta='+ID_Tarjeta+#13+#10+
                     'Saldo='+FormatCurr('#,0.00',Respuesta.Saldo)+#13+#10+
                     'Disponible='+FormatCurr('#,0.00',Respuesta.Disponible)+#13+#10+
                     'CupoPOS='+FormatCurr('#,0.00',Respuesta.CupoPOS)+#13+#10+
                     'CupoATM='+FormatCurr('#,0.00',Respuesta.CupoATM)+#13+#10);

    LogMemo1.Lines.Add('Respuesta:'+FormatDateTime('yyyy/mm/dd hh:mm:ss',Now)+#13+#10+
                     'Mensaje='+IntToStr(MensajeRet)+#13+#10+
                     'Error='+Format('%.2d',[Respuesta.Error])+#13+#10+
                     'Tarjeta='+ID_Tarjeta+#13+#10+
                     'Saldo='+FormatCurr('#,0.00',Respuesta.Saldo)+#13+#10+
                     'Disponible='+FormatCurr('#,0.00',Respuesta.Disponible)+#13+#10+
                     'CupoPOS='+FormatCurr('#,0.00',Respuesta.CupoPOS)+#13+#10+
                     'CupoATM='+FormatCurr('#,0.00',Respuesta.CupoATM)+#13+#10);

    CloseFile(Registro);
    


end;

procedure TfrmUDPTDMain.UDPServerUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
begin
        TratarDatos(AData);
end;

procedure TfrmUDPTDMain.BitBtn1Click(Sender: TObject);
begin
        if UDPServer.Active then
           UDPServer.Active := False;
        Close;

end;

procedure TfrmUDPTDMain.Timer1Timer(Sender: TObject);
begin
  if UDPServer.Active then
     label6.Caption := 'Activo'
  else
     label6.Caption := 'InActivo';

  label2.Caption := DateTimeToStr(Now);

end;

function TfrmUDPTDMain.f_m_a_peticion(SQLConn:TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta:string;
                            CausalRet:Integer;
                            MontoRet:Currency;
                            SecuenciaRet:string): TRespuesta;
begin

end;

function TfrmUDPTDMain.f_m_b_peticion(SQLConn:TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta:string;
                            CausalRet:Integer;
                            MontoRet:Currency;
                            SecuenciaRet:string): TRespuesta;
begin

end;


function TfrmUDPTDMain.f_m_peticion(SQLConn: TSQLConnection;
                                    IDT:TTransactionDesc;
                                    ID_Tarjeta: string;
                                    CausalRet: Integer;
                                    MontoRet: Currency;
                                    SecuenciaRet: String): TRespuesta;
var
  Datos:TDatos;
  DatosMov:TDatosMov;
begin
        Datos := BuscarDatos(SQLConn,IDT,ID_Tarjeta);

        Result.Id_Agencia        := Datos.Id_Agencia;
        Result.Id_Tipo_Captacion := Datos.Id_Tipo_Captacion;
        Result.Numero_Cuenta     := Datos.Numero_Cuenta;
        Result.Digito_Cuenta     := Datos.Digito_Cuenta;

        case CausalRet of
           C_CONSULTA1,
           C_CONSULTA2   : begin
                            Result.Respuesta  := True;
                            Result.Error      := Datos.Error;
                            Result.Monto      := MontoRet;
                            Result.Saldo      := Datos.Saldo;
                            Result.Disponible := Datos.Disponible;
                            Result.CupoPOS    := Datos.CupoPos;
                            Result.CupoATM    := Datos.CupoATM;
                            Exit;
                           end;

           C_COMPRA,
           C_RETIRO      : begin
                            if Datos.Disponible < MontoRet then
                            begin
                               Result.Error := E_FONDOS_INSUFICIENTES;
                            end
                            else
                            begin
                               Result.Monto := MontoRet;
                               Result.Saldo := Datos.Saldo - MontoRet;
                               Result.Disponible := Datos.Disponible - MontoRet;
                            end;
                            Result.CupoPOS    := Datos.CupoPos;
                            Result.CupoATM    := Datos.CupoATM;
                            Result.Respuesta  := True;
                            Exit;
                           end;

           C_CONSIGNACION: begin
                             Result.Error := Datos.Error;
                             Result.Monto := -MontoRet;
                             Result.Saldo := Datos.Saldo + MontoRet;
                             Result.Disponible := Datos.Disponible + MontoRet;
                             Result.CupoPOS := Datos.CupoPos;
                             Result.CupoATM := Datos.CupoATM;
                             Result.Respuesta := True;
                             Exit;
                           end;
           C_ANULACION   : begin
// Buscar Movimiento a Anular
                              DatosMov := BuscarDatosMov(SQLConn,
                                                         IDT,
                                                         ID_Tarjeta,
                                                         SecuenciaRet);
                              Result.Respuesta := True;
                              Result.Error := Datos.Error;
                              Result.Saldo := Datos.Saldo - DatosMov.Monto;
                              Result.Disponible := Datos.Disponible - DatosMov.Monto;
                              Result.Monto := -DatosMov.Monto;
                           end;
        end;
end;

function TfrmUDPTDMain.f_m_a_reverso (SQLConn: TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta: string;
                            CausalRet: Integer;
                            MontoRet: Currency;
                            SecuenciaRet: String): TRespuesta;
var
  Datos:TDatos;
  DatosMov:TDatosMov;
begin
        Datos := BuscarDatos(SQLConn,IDT,ID_Tarjeta);

        Result.Id_Agencia        := Datos.Id_Agencia;
        Result.Id_Tipo_Captacion := Datos.Id_Tipo_Captacion;
        Result.Numero_Cuenta     := Datos.Numero_Cuenta;
        Result.Digito_Cuenta     := Datos.Digito_Cuenta;

        case CausalRet of
           C_COMPRA,
           C_RETIRO      : begin
                            Result.Monto := -MontoRet;
                            Result.Saldo := Datos.Saldo + MontoRet;
                            Result.Disponible := Datos.Disponible + MontoRet;
                            Result.CupoPOS    := Datos.CupoPos;
                            Result.CupoATM    := Datos.CupoATM;
                            Result.Respuesta  := True;
                            Exit;
                           end;

           C_CONSIGNACION: begin
                             Result.Error := Datos.Error;
                             Result.Monto := MontoRet;
                             Result.Saldo := Datos.Saldo - MontoRet;
                             Result.Disponible := Datos.Disponible - MontoRet;
                             Result.CupoPOS := Datos.CupoPos;
                             Result.CupoATM := Datos.CupoATM;
                             Result.Respuesta := True;
                             Exit;
                           end;
           C_ANULACION   : begin
// Buscar Movimiento a Anular
                              DatosMov := BuscarDatosMov(SQLConn,
                                                         IDT,
                                                         ID_Tarjeta,
                                                         SecuenciaRet);
                              Result.Respuesta := True;
                              Result.Error := Datos.Error;
                              Result.Saldo := Datos.Saldo + DatosMov.Monto;
                              Result.Disponible := Datos.Disponible + DatosMov.Monto;
                              Result.Monto := -DatosMov.Monto;
                           end;
        end;

end;



function TfrmUDPTDMain.f_m_r_peticion(SQLConn: TSQLConnection;
                                    IDT:TTransactionDesc;
                                    ID_Tarjeta: string;
                                    CausalRet: Integer;
                                    MontoRet: Currency;
                                    SecuenciaRet: String): TRespuesta;
begin

end;

function TfrmUDPTDMain.f_m_r_a_peticion(SQLConn: TSQLConnection;
                                    IDT:TTransactionDesc;
                                    ID_Tarjeta: string;
                                    CausalRet: Integer;
                                    MontoRet: Currency;
                                    SecuenciaRet: String): TRespuesta;
begin

end;


function TfrmUDPTDMain.f_m_b_reverso (SQLConn: TSQLConnection;
                            IDT:TTransactionDesc;
                            ID_Tarjeta: string;
                            CausalRet: Integer;
                            MontoRet: Currency;
                            SecuenciaRet: String): TRespuesta;
begin

end;



function TfrmUDPTDMain.BuscarDatos(SQLConn:TSQLConnection;
                                   IDT:TTransactionDesc;
                                   ID_Tarjeta: string): TDatos;
var
  SQLQ:TSQLQuery;
  Datos:TDatos;
begin

    Datos.Error := 0;

    SQLQ := TSQLQuery.Create(nil);
    SQLQ.SQLConnection := SQLConn;

    SQLConn.StartTransaction(IDT);
    
    with SQLQ do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from "cap$tarjetacuenta" where');
      SQL.Add('ID_TARJETA = :ID_TARJETA');
      ParamByName('ID_TARJETA').AsString := LeftStr(ID_Tarjeta,16);
      try
       Open;
       if FieldByName('ID_TARJETA').AsString = '' then
          Datos.Error := E_TARJETA_INVALIDA;
       Datos.Estado := FieldByName('ID_ESTADO').AsInteger;
      except
       SQLConn.Rollback(IDT);
       raise;
       Exit;
      end;

      If Datos.Error = 0 then
      begin
        Datos.Id_Agencia := FieldByName('ID_AGENCIA').AsInteger;
        Datos.Id_Tipo_Captacion := FieldByName('ID_TIPO_CAPTACION').AsInteger;
        Datos.Numero_Cuenta := FieldByName('NUMERO_CUENTA').AsInteger;
        Datos.Digito_Cuenta := FieldByName('DIGITO_CUENTA').AsInteger;
        Datos.CupoPos := FieldByName('CUPO_POS').AsCurrency;
        Datos.CupoAtm := FieldByName('CUPO_ATM').AsCurrency;
        Close;

        SQL.Clear;
        SQL.Add('select * from SALDOTD(:ID_AGENCIA,:ID_TIPO_CAPTACION,:NUMERO_CUENTA,:DIGITO_CUENTA)');
        ParamByName('ID_AGENCIA').AsInteger := Datos.Id_Agencia;
        ParamByName('ID_TIPO_CAPTACION').AsInteger := Datos.Id_Tipo_Captacion;
        ParamByName('NUMERO_CUENTA').AsInteger := Datos.Numero_Cuenta;
        ParamByName('DIGITO_CUENTA').AsInteger := Datos.Digito_Cuenta;
        try
         Open;
         Datos.Saldo := FieldByName('SALDO').AsCurrency;
         Datos.Disponible := FieldByName('DISPONIBLE').AsCurrency;
         if Datos.Estado = 2 then
         begin
            Datos.Saldo  := 0;
            Datos.Disponible := 0;
         end;
        except
         SQLConn.Rollback(IDT);
         raise;
         Exit;
        end; // fin del try

      end;// fin del if Error
    end; // fin del with
// Verificar Reverso si existe original
    SQLConn.Commit(IDT);

   Result := Datos;

end;

function TfrmUDPTDMain.BuscarDatosMov(SQLConn: TSQLConnection;
                                      IDT:TTransactionDesc;
                                      ID_Tarjeta,
                                      Secuencia: String): TDatosMov;
var
  SQLQ:TSQLQuery;
  Datos:TDatosMov;
begin
    SQLQ := TSQLQuery.Create(nil);
    SQLQ.SQLConnection := SQLConn;
    
    SQLConn.StartTransaction(IDT);
    with SQLQ do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from "cap$tarjetamovsdia" where');
      SQL.Add('"cap$tarjetamovsdia".ID_TARJETA = :ID_TARJETA and');
      SQL.Add('"cap$tarjetamovsdia".SECUENCIA = :SECUENCIA');
      ParamByName('ID_TARJETA').AsString := ID_Tarjeta;
      ParamByName('SECUENCIA').AsString := Secuencia;
      try
       Open;
       if RecordCount > 0 then
       while not Eof do
       begin
         Datos.Estado := True;
         Datos.Monto := FieldByName('MONTO').AsCurrency;
         Datos.Fecha := FieldByName('FECHA').AsDateTime;
         Datos.Hora  := FieldByName('HORA').AsDateTime;
         Next;
       end
       else
       begin
         Datos.Estado := False;
         Datos.Monto := 0;
         Datos.Fecha := 0;
         Datos.Hora  := 0;
       end;
      except
       SQLConn.Rollback(IDT);
       raise;
       Exit;
      end;
     end;
     SQLConn.Commit(IDT);

     Result.Estado := Datos.Estado;
     Result.Monto  := Datos.Monto;
     Result.Fecha  := Datos.Fecha;
     Result.Hora   := Datos.Hora;


end;

end.



