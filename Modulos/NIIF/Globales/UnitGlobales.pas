unit UnitGlobales;

interface

Uses Graphics, Forms, StdCtrls, DBCtrls, Math, DateUtils, IB, IBSQL ,IBQuery,IBStoredProc, IBDataBase, Messages,SysUtils,DB,DBGrids,Windows,Controls, StrUtils,Classes,Dialogs, winspool, Printers,
     Unit_DmComprobante,JvStringGrid,DBClient, UnitdmGeneral;

type
     PTablaCerLiq = ^TablaCerLiq;
     TablaCerLiq = record
      FechaPago:TDate;
      Valor:Currency;
      Liquidado:Boolean;
end;

type
     PTablaConLiq = ^TablaConLiq;
     TablaConLiq = record
      FechaDescuento:TDate;
      Valor:Currency;
      Descontado:Boolean;
end;


type
   TValidarCap = Record
    Fecha:TDate;
    Caja:Integer;
    Origen:Integer;
    Tipo:Integer;
    Operacion:Integer;
    Agencia:Integer;
    Cuenta:Integer;
    Documento:Integer;
    Billetes:Currency;
    Monedas:Currency;
    Cheques:Currency;
    Nombre:string;
end;

type
   TCaptacion = Record
    IdAgencia:Integer;
    IdCaptacion:Integer;
    IdNumeroCuenta:Integer;
    IdDigitoCuenta:Integer;
end;

type
   TValidarCol = Record
    Fecha:TDate;
    Caja:Integer;
    Cuenta:Integer;
    Colocacion:string;
    Nombre:string;
    Clasificacion:string;
    Garantia:string;
    Estado:string;
    Documento:Integer;
    Tasa:Double;
    FechaInt:TDate;
    Capital:Currency;
    Interes:Currency;
    Devuelto:Currency;
    Otras:Currency;
    Efectivo:Currency;
    NuevoSaldo:Currency;
end;
type
   THoraCaja = Record
    Estado :Boolean;
    Hora :TTime;
end;
type
   TServicio = Record
    vPuerto :Integer;
    vHost :string
end;

function  DiasEntre(FechaInicial:TDate;FechaFinal:TDate):Integer;
function  DiasEntrePagoTotal(FechaInicial:TDate;FechaFinal:TDate):Integer;
function  DiasEnFechas(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean):Integer;
//function  DiasEntreFechas(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean):Integer;
function  DiasEntreFechas(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate):Integer;
function  DiasEntreFechas1(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean;Devuelto:Boolean):Integer;
//function  DiasEntreFechas1(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate):Integer;
procedure EnterTabsGrid (Sender: TObject; var Key: Char; DataSet:TDataSet);
procedure EnterTabs(var Key:Char;oSelf:TForm);
procedure Numerico(Sender:TObject;var Key:Char);
procedure NumericoSinPunto(Sender:TObject;var Key:Char);
function  InttoBoolean (valor:integer) : boolean;
function  CalculoCC(IentOfi,InumCta:String ) : String;
function  Edad(Fecha:TDateTime):String;
function  Precisarcodigo(Codigo: String): string;
function  DigitoControl(Tipo:Integer;Cuenta: string): string;
function  TablaCer(Valor:Currency;TasaEfectiva:Single;Modalidad:string;FechaApertura,FechaInicial:TDate;Amortiza,Plazo: Integer;Dia:Word): TList;
function  TablaCon(Valor:Currency;FechaInicial:TDate;Amortiza,Plazo: Integer;Dia:Word;FechaCorte:TDate): TList;
procedure SendControlCode(S: string);
procedure SendControlCodeNew(NombreImpresora:string;S: string);
procedure ImprimirCadena(Impresora,S: string);
procedure Empleado;
function ReCalculoSaldosGenerales:Boolean;
procedure ColocarSaldoInicial(CodigoMayor: string; SaldoInicial:Currency; IBVarios: TIBSQL);
procedure ColocarSaldoMayor(CodigoMayor: string;Mes:Integer;Debito:Currency;Credito:Currency;IBVarios:TIBSQL);
function EvaluarFecha: Boolean;
function DigitoVerificacion(Nit:string) : Integer;
procedure log(Mensaje: String);
function CrearProducto(_iNumeroCuenta,_iTipoCaptacion,_iDigitoCuenta,_iIdIdentificacion:Integer;_sIdPersona:string):Boolean;

var
    Anho:String;
    DBAlias:String;
    DBPasabordo: String;
    DBNombre:String;
    DBServer:String;
    DBAnho: Word;
    DBpath:String;
    DBname:String;
    BaseAlt:string;
    BaseAnoAnt:string;
    Procesado:string;
    DBserver1:String;
    DBpath1:String;
    DBname1:string;
    CodigoData:string;
    Role:string;
    RutaSalida:string;
    DBMinutos:Extended;
    MiINI:String;
    Empresa:String;
    Nit:String;
    Address:String;
    Description:String;
    Phone:String;
    Agencia:Integer;
    Ciudad:String;
    Departamento:string;
    logofondo: string;
    FechaHoy:TDate;
    Nombres:string;
    Apellidos:string;
    Bisiesto:Boolean;
    control_consulta :Boolean;
    vRol :string;
    _sDescuentos:string;
//***variables Contractual
    vCuotasContractual :Currency;
//***variables conexion agencias
    host_equivida :string;
    host_abrego :string;
    host_convencion :string;
    host_aguachica:string;
    host_ocana :string;
    Host_BaseAbrego :string;
    Host_BaseConvencion :string;
    Host_BaseOcana :string;
    //
    puerto_abrego :Integer;
    puerto_convencion :Integer;
    puerto_aguachica:Integer;
    puerto_ocana :Integer;
    puerto_barrido :Integer;
    PCOcana :Integer;
    PCConvencion :Integer;
    PCAbrego :Integer;
    PCAguachica :Integer;
    vFechaInicial :TDate;
//*** variables validacion ente aprobador
    Monto_EnteAprobador :Currency;
    Id_EnteAprobador :Integer;
    Mensaje_EnteAprobador :string;
    vFechaEnte :TDateTime;
    vFechaSinCerrar :string;
// Variables globales TDebito
  Pop3ServerMail1: string;
  Pop3ServerName1: string;
  Pop3ServerPort1: Integer;
  Pop3ServerUser1: string;
  Pop3ServerPassword1: string;
  Pop3ServerMail2: string;
  Pop3ServerName2: string;
  Pop3ServerPort2: Integer;
  Pop3ServerUser2: string;
  Pop3ServerPassword2: string;
  SmtpServerName: string;
  SmtpServerPort: Integer;
  SmtpServerUser: string;
  SmtpServerPassword: string;
  SmtpServerTo:string;
  SmtpServerFrom:string;
  SmtpAuthType: Integer;
  UserEmail: string;
//
// Imagenes Temporales
  BitMap:Graphics.TBitmap;
// Variables Poliza Credivida
   vPolizaCredivida :string;
   vRuraCredivida :string;
// Variable detalles
   vFechaLimite :TDate;
   _bAporte :Boolean;
   _bAhorro :Boolean;
   _bJuvenil :Boolean;
   _bColocacion :Boolean;
   _bFianzas :Boolean;
   _bEducacion :Boolean;
   _iTipoDetalle :Integer;
   _sDetalle :string;
 // Variables Modulo DIAN
  _dFechaCorteAhorros :TDate;
  _dFechaCorteCausacion :TDate;
  _dFechaInicial :TDate;

 // Variables Entrega de Ayudas
  _iPeriodo: Integer;
  
Apesos: array[1..10] of integer = (1,2,4,8,5,10,9,7,3,6);
Meses: array[1..12] of string = ('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
MaxDiasMes:array[1..12] of Integer = (31,28,31,30,31,30,31,31,30,31,30,31);

const txcFormFeed:string = #12;
const txcNormal:string = #27+#120+#00;
const txcPica:string = #27+#120+#01+#27+#107+#00;
const txcElite:string = #27+#120+#01+#27+#107+#01;
const txcCondensedOn:string = #15;
const txcCondensedOff:string = #18;
const txcBoldOn:string = #27+#71;
const txcBoldOff:string = #27+#72;
const txcItalicOn:string = #27+#52;
const txcItalicOff:string = #27+#53;
const txcUnderlineOn:string = #27+#45+#49;
const txcUnderlineOff:string = #27+#45+#48;
const txcSuperScriptOn:string = #27+#83+#01;
const txcSuperScriptOff:string = #27+#84;
const txcSubScriptOn:string = #27+#83+#00;
const txcSubScriptOff:string = #27+#84;
const txcWideOn:string = #27+#87+#01;
const txcWideOff:string = #27+#87+#00;
const txc12cpiOn:string = #27+#77;
const txc12cpiOff:string = #27+#80;
const txcCondensedOnHP = #27#38#107#50#83;
const txcCondensedOffHP = #27#38#107#48#83;
const txcBoldOnHP = #27#40#115#51#66;
const txcBoldOffHP = #27#40#115#48#66;
const txcItalicOnHP = #27#40#115#49#83;
const txcItalicOffHP =  #27#40#115#48#83;
const txcUnderlineOnHP = #27#38#100#48#68;
const txcUnderlineOffHP = #27#38#100#64;


function BooleanoToInt(valor: boolean): integer;
function ObtenerConsecutivoSinTipo(IBSQL1:TIBSQL): LongInt;
function ObtenerConsecutivo(IBSQL1:TIBSQL; _iTipo:Integer): LongInt;
function ObtenerConsecutivoPlantilla(IBSQL1:TIBSQL): LongInt;
function ObtenerConsecutivoAyudas(IBSQL1:TIBSQL): Longint;
function ObtenerCaptacion(TipoCaptacion:Integer;IBSQL1: TIBSQL): LongInt;
function ObtenerConsecutivoTmp(IBSQL1:TIBSQL): Longint;
function ObtenerConsecutivoCajaCartera: Longint;
function ObtenerConsecutivoCajaCarteraTmp: Longint;
function ObtenerConsecutivoControlCobro(IBDatabase1: TIBDatabase): Longint;
function fFechaActual: TDate;
function fHoraActual: TTime;
function fFechaHoraActual: TDateTime;
function ValidarOpcion(IdOpcion: Integer): Boolean;
function extrae_empleado: string;
function Buscaconyuge(id_persona, id_solicitud: string;
  id_identificacion: integer): boolean;
function Valida_Solicitud(id_colocacion: string;
  id_agencia: integer): string;
function define_tasa(linea: integer; tasa: Currency): string;
function Obtener_Estado(id_estado: integer): string;
function ObtenerConsecutivoReteFuente(IBDatabase1:TIBDatabase): Longint;
function ValidaHoraCaja: ThoraCaja;
procedure BuscaPoliza;
function BuscaServicio(Id_Agencia, Id_Servicio: integer): tservicio;
function ValidaCon(Nm:Integer;Tp:integer; Dg:integer): Currency;
function vContabilizaCon(Nm, Tp, Dg: integer): Boolean;
procedure FechaCierre(CdFecha: TClientDataSet);
function ObtenerGenConsecutivo(IBSQL1:TIBSQL; _iNumero: Integer): LongInt;
function ObtenerConsecutivoEquivalente(IBSQL1: TIBSQL): LongInt;

implementation

uses UnitGlobalesCol;


///* Función para calcular edad */
function Edad(Fecha:TDateTime):String;
var A, AA, M, MM, D, DD: Word;
  Anio, Mes, Dia: double;
begin
  DecodeDate(Fecha, A, M, D);
  DecodeDate(Date, AA, MM, DD);
  Anio := Int(AA - A);
  if( M <= MM ) then
     Mes := MM - M
  else
  begin
    Mes := MM+12-M;
    Anio := Anio -1;
  end;
  if( D <= DD ) then
    Dia := DD - D
  else
  begin
    Dia:=DD+MonthDays[IsLeapYear(AA),MM]-D;
    Mes := Mes -1;
  end;
//Caso especial donde no ha cumplido años, pero los cumplirá el mismo mes
  if Mes < 0 then
  begin
    Anio := Anio - 1;
    Mes := 12 + Mes;
  end;
  Result := Format('Años: %.0f, Meses: %.0f, Dias: %.0f', [Anio, Mes, Dia]);
end;


function CalculoCC(IentOfi,InumCta:String ) : String;

var
   Digito,DigControl : String;
   X : Byte;
   DC1,DC2,Resto : Extended;
begin
   DC1:=0;
   DC2:=0;
   x:=8;
   Repeat
      digito:=copy(IEntOfi,x,1);
      DC1:=DC1+(APesos[x+2]*StrtoInt(digito));
      inc(x,-1);
   until x=0;
   Resto := DC1-(11*(int(DC1/11)));

    DC1:=11-Resto;
    if DC1=10 then DC1:=1;
    if DC1=11 then DC1:=0;              // Dígito control Entidad-Oficina

    x:=10;
    Repeat
       digito:=copy(INumCta,x,1);
       DC2:=DC2+(APesos[x]*StrtoInt(digito));
       inc(x,-1);
    until x=0;
    Resto := DC2-(11*(int(DC2/11)));
    DC2:=11-Resto;
    if DC2=10 then DC2:=1;
    if DC2=11 then DC2:=0;         // Dígito Control C/C

    DigControl:=FloattoStr(DC1)+FloattoStr(DC2);   // los 2 números del D.C.
    Result:=DigControl;
end;

function InttoBoolean (Valor: Integer): Boolean;
begin
       If Valor <> 0 then
          Result := True
       Else
          Result := False;
end;

procedure EnterTabs(var Key:Char;oSelf:TForm);
begin
  if (Key=#13) and
      not (oSelf.ActiveControl is TButton)    and
      not (oSelf.ActiveControl is TDBMemo)    and
      not (oSelf.ActiveControl is TJvStringGrid)
                                 then begin
      oSelf.Perform( WM_NEXTDLGCTL, 0,0);

      Key := #0;
  end;

  {if Key in [VK_UP,VK_DOWN] then
  begin
     if Key = VK_UP then Perform(WM_NEXTDLGCTL, 1, 0)
                    else Perform(WM_NEXTDLGCTL, 0, 0);
     Key:=#0;
  end;
 }
end;

procedure Numerico(Sender:TObject;var Key:Char);
begin
if not (Key in [#8,#13, '0'..'9', '-', DecimalSeparator]) then
  begin
    Key := #0;
  end //End First if.
  else
  if ((Key = DecimalSeparator) or (Key = '-')) and (Pos(Key, TMemo(Sender).Text ) > 0) then
  begin
    Key := #0;
  end//End second if.
  else
  if (Key = '-') and (TMemo(Sender).SelStart <> 0) then
  begin
    Key := #0;
  end;//End third if.
end;

procedure NumericoSinPunto(Sender:TObject;var Key:Char);
begin
if not (Key in [#8,#13, '0'..'9']) then
  begin
    Key := #0;
  end //End First if.
  else
  if ((Key = DecimalSeparator) or (Key = '-')) and (Pos(Key, TMemo(Sender).Text ) > 0) then
  begin
    Key := #0;
  end//End second if.
  else
  if (Key = '-') and (TMemo(Sender).SelStart <> 0) then
  begin
    Key := #0;
  end;//End third if.
end;

function Precisarcodigo(Codigo: String): String;
var Longitud : Integer;
begin
        Longitud := 18;
        if MidStr(Codigo,17,2) = '00' then Longitud := 16; //18-10
        if MidStr(Codigo,15,2) = '00' then Longitud := 14; //16-9
        if MidStr(Codigo,13,2) = '00' then Longitud := 12; //14-8
        if MidStr(Codigo,11,2) = '00' then Longitud := 10; //12-7
        if MidStr(Codigo,9,2)  = '00' then Longitud := 8; //10-6
        if MidStr(Codigo,7,2)  = '00' then Longitud := 6; //8-5
        if MidStr(Codigo,5,2)  = '00' then Longitud := 4; //6-4
        if MidStr(Codigo,3,2)  = '00' then Longitud := 2; //4-3
        if Midstr(Codigo,2,1)  = '0'  then Longitud := 1; //1-2
        Result := LeftStr(Codigo,Longitud);
end;

procedure EnterTabsGrid (Sender: TObject; var Key: Char; DataSet:TDataSet);
begin
If Key = #13 Then Begin
 If HiWord(GetKeyState(VK_SHIFT)) <> 0 then begin
  with (Sender as TDBGrid) do
  if selectedindex > 0 then
   selectedindex := selectedindex - 1
  else begin
   DataSource.DataSet.Prior;
   selectedindex := fieldcount - 1;
  end;
 end else begin
  with (Sender as TDBGrid) do
  if selectedindex < (fieldcount - 1) then
   selectedindex := selectedindex + 1
  else begin
   DataSet.Next;
   selectedindex := 0;
  end;
end;
Key := #0
end;
end;

function DigitoControl(Tipo:Integer;Cuenta: string): string;
var 
    n,i:Integer;
begin
        n := 0;
        for i := 0 to 6 do
        begin
          n := n + StrToInt(MidStr(cuenta,i+1,1));
        end;
        n := n + Tipo;
        Result := RightStr(FormatCurr('00',n),1);
end;

function TablaCer(Valor:Currency;TasaEfectiva:Single;Modalidad:string;FechaApertura,FechaInicial:TDate;Amortiza,Plazo: Integer;Dia:Word): TList;
var i,max,Dias:Integer;
    ARecord:PTablaCerLiq;
    Lista:TList;
    FechaI,FechaF,FechaV:TDateTime;
    Interes:Currency;
    Tasa:Single;
    Dif:Integer;
    FinDeMes:Boolean;
    PorDias:Boolean;
    PorPeriodos:Boolean;
    Ano,Mes,Dia1,DiaApertura:Word;
begin

     DiaApertura := DayOf(FechaApertura);
     FechaI := FechaInicial;
     if ( Amortiza mod 30 ) = 0 then
         PorPeriodos := True
       else
         PorPeriodos := False;

     if Plazo = Amortiza then PorPeriodos := False;

     if not PorPeriodos then
     begin
        FechaI := FechaInicial;
        FechaV := CalculoFecha(FechaInicial,Plazo);
        if (Amortiza mod 30) = 0 then
        begin
          DecodeDate(FechaV,Ano,Mes,Dia1);
          Dia1 := Dia1 + DayOf(FechaApertura) - DayOf(FechaInicial);
          if not TryEncodeDate(Ano,Mes,Dia1,FechaV) then
          begin
              Dia1 := DayOf(EndOfAMonth(Ano,Mes));
              FechaV := EncodeDate(Ano,Mes,Dia1);
          end;
        end;
        Lista := TList.Create;
        max := Plazo div Amortiza;
        if Modalidad = 'A' then
           Tasa := TasaNominalAnticipada(TasaEfectiva,Amortiza)
        else
           Tasa := TasaNominalVencida(TasaEfectiva,Amortiza);
        New(ARecord);
        FechaF:= FechaV;
        if FechaF > FechaV then
               FechaF := FechaV;
            Dias := DiasEntre(FechaI,FechaF);
            Interes :=SimpleRoundTo(Valor * ((Tasa / 100)* Amortiza)/360,0);
            ARecord^.Valor := Interes;
            ARecord^.FechaPago := FechaF;
            FechaI := FechaF;
            if FechaF <= ffechaactual then
//            if FechaF <= Date then
             ARecord^.Liquidado := true
            else
               ARecord^.Liquidado := False;
        Lista.Add(ARecord);
        Result := Lista;
     end
     else
     begin
        FechaI := FechaInicial;
        FechaV := CalculoFecha(FechaInicial,Plazo);

        Lista := TList.Create;
        max := Plazo div Amortiza;
        if Modalidad = 'A' then
           Tasa := TasaNominalAnticipada(TasaEfectiva,Amortiza)
        else
           Tasa := TasaNominalVencida(TasaEfectiva,Amortiza);
        for i := 1 to max do
        begin
            New(ARecord);
            DecodeDate(FechaI,Ano,Mes,Dia1);
            Dia1 := DiaApertura;
            FechaF:= CalculoFechaMes(Ano,Mes,Dia1,Amortiza);
            if FechaF > FechaV then
               FechaF := FechaV;
            Dias := Amortiza;
            Interes :=SimpleRoundTo(Valor * ((Tasa / 100)* Amortiza)/360,0);
            ARecord^.Valor := Interes;
            ARecord^.FechaPago := FechaF;
            FechaI := FechaF;
            if FechaF <= ffechaactual then
//            if FechaF <= Date then
               ARecord^.Liquidado := true
            else
               ARecord^.Liquidado := False;
            Lista.Add(ARecord);
        end;
        Result := Lista;
     end;

end;

function TablaCon(Valor:Currency;FechaInicial:TDate;Amortiza,Plazo: Integer;Dia:Word;FechaCorte:TDate): TList;
var i,max,Dias:Integer;
    ARecord:PTablaConLiq;
    Lista:TList;
    FechaI,FechaF,FechaV:TDate;
    Interes:Currency;
    Tasa:Single;
    Dif:Integer;
    FinMes:Boolean;
    DiaFin:Word;
    Ano,Mes:Word;
begin
        DiaFin := DaysInMonth(FechaInicial);
        if Dia = DiaFin then
          FinMes := true
        else
          FinMes := False;
          
        Dif := Dia - DayOf(FechaInicial);
        FechaI := FechaInicial;
        FechaF := FechaI;
        DecodeDate(FechaF,Ano,Mes,Dia);
        FechaV := CalculoFecha(FechaInicial,Plazo);
        if Dif > 0 then
          FechaV := CalculoFecha(FechaV,Dif);
        Lista := TList.Create;
        max := Plazo div Amortiza;
        for i := 1 to max do
        begin

         if FinMes then
         begin
           New(ARecord);
           ARecord^.Valor := Valor;
           ARecord^.FechaDescuento := FechaF;
           FechaI := FechaF;
           if FechaF <= FechaCorte then
              ARecord^.Descontado := true
           else
              ARecord^.Descontado := False;
           Lista.Add(ARecord);
           Mes := Mes + Amortiza div 30;
           if Mes > 12 then
           begin
             Mes := 1;
             Ano := Ano + 1;
           end;
           FechaI := EncodeDate(Ano,Mes,1);
           Dia := DaysInMonth(FechaI);
           FechaF:= EncodeDate(Ano,Mes,Dia);
         end

         else

         begin
            New(ARecord);
            Dif := Dia - DayOf(FechaI);
            if Dif > 0 then FechaF := CalculoFecha(FechaF,Dif);
            if FechaF > FechaV then
               FechaF := FechaV;
            Dias := DiasEntre(FechaI,FechaF);
            ARecord^.Valor := Valor;
            ARecord^.FechaDescuento := FechaF;
            FechaI := FechaF;
            if FechaF <= FechaCorte then
               ARecord^.Descontado := true
            else
               ARecord^.Descontado := False;
            Lista.Add(ARecord);
            FechaF:= CalculoFecha(FechaI,Amortiza);
         end;
        end;
        Result := Lista;
end;



function BooleanoToInt(valor: boolean): integer;
begin
        if valor then
           Result := 1
        else
           Result := 0;
end;

procedure SendControlCode(S: string);
var
 Handle, hDeviceMode: THandle;
 N: DWORD;
 DocInfo1: TDocInfo1;
 Device, Driver, Port: array[0..255] of char;
 PrinterName: string;
 buf:array[0..255] of char;
 lbuf:integer;
begin
//  PrinterName := 'Generica';
 PrinterName := 'EPSON TM-U675 No Cut';
{ if not OpenPrinter(PChar(PrinterName), Handle, nil) then
  RaiseLastOSError;}
 OpenPrinter(PChar(PrinterName), Handle, nil);
 try
  with DocInfo1 do
  begin
   pDocName := 'Control';
   pOutputFile := nil;
   pDataType := 'RAW';
  end;
  StartDocPrinter(Handle, 1, @DocInfo1);
  try
   lbuf:=length(s);
   copymemory(@buf,Pchar(s),lbuf);
   WritePrinter(Handle,@buf,lbuf,N);
  finally
   EndDocPrinter(Handle);
  end;
 finally
  try
    ClosePrinter(Handle);
  except
    lbuf := 0;
  end; 
 end;
end;

procedure SendControlCodeNew(NombreImpresora:string;S: string);
var
 Handle, hDeviceMode: THandle;
 N: DWORD;
 DocInfo1: TDocInfo1;
 //Device, Driver, Port: array[0..255] of char;
 PrinterName: string;
 buf:array[0..255] of char;
 lbuf:integer;
begin
 PrinterName := NombreImpresora;
// PrinterName := 'EPSON TM-U675 No Cut';
{ if not OpenPrinter(PChar(PrinterName), Handle, nil) then
  RaiseLastOSError;}
 OpenPrinter(PChar(PrinterName), Handle, nil);
 try
  with DocInfo1 do
  begin
   pDocName := 'Control';
   pOutputFile := nil;
   pDataType := 'RAW';
  end;
  StartDocPrinter(Handle, 1, @DocInfo1);
  try
   lbuf:=length(s);
   copymemory(@buf,Pchar(s),lbuf);
   WritePrinter(Handle,@buf,lbuf,N);
  finally
   EndDocPrinter(Handle);
  end;
 finally
  try
    ClosePrinter(Handle);
  except
    lbuf := 0;
  end; 
 end;
end;

procedure ImprimirCadena(Impresora,S: string);
var
 Handle, hDeviceMode: THandle;
 N: DWORD;
 DocInfo1: TDocInfo1;
 Device, Driver, Port: array[0..255] of char;
 PrinterName: string;
 buf:array[0..255] of char;
 lbuf:integer;
begin
 Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
 PrinterName := Format('%s', [Device]);
// PrinterName := Format('%s',[Impresora]);
 OpenPrinter(PChar(PrinterName), Handle, nil);
 try
  with DocInfo1 do
  begin
   pDocName := 'Control';
   pOutputFile := nil;
   pDataType := 'RAW';
  end;
  StartDocPrinter(Handle, 1, @DocInfo1);
  try
   lbuf:=length(s);
   copymemory(@buf,Pchar(s),lbuf);
   WritePrinter(Handle, @buf, lbuf, N);
  finally
   EndDocPrinter(Handle);
  end;
 finally
  try
    ClosePrinter(Handle);
  except
  end;
 end;
end;

procedure Empleado;
var Cerrar:Boolean;
    dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        Cerrar := False;
        with dmGeneral.IBSQL1 do
         begin
           if not Transaction.InTransaction then
           begin
              Transaction.StartTransaction;
              Cerrar := True;
           end;
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ExecQuery;
           Nombres := FieldByName('NOMBRE').AsString;
           Apellidos := FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
           Close;
           if Cerrar then
             Transaction.Commit;
         end;
         
         dmGeneral.Free;
end;

function  DiasEntre(FechaInicial:TDate;FechaFinal:TDate):Integer;
var A,AA,M,MM,D,DD:Word;
    Dias:Integer;
    Fecha:TDate;
    Negativo:Boolean;
    LastDayMonth:Word;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 0;
        Fecha := FechaInicial;
        DecodeDate(FechaInicial,A,M,D);
        DecodeDate(FechaFinal,AA,MM,DD);
        FechaFinal := EncodeDate(AA,MM,DD);

        LastDayMonth := DaysInAMonth(AA,MM);

        if (MM = 2) and ( (DD=LastDayMonth)) then DD := 30;
        if DD = 31 then DD := 30;

        while true do
        begin
         if (AA = A) and (MM = M) and (DD = D) then Break;
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;
        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;

function  DiasEntrePagoTotal(FechaInicial:TDate;FechaFinal:TDate):Integer;
var A,AA,M,MM,D,DD:Word;
    Dias:Integer;
    Fecha:TDate;
    Negativo:Boolean;
    LastDayMonth:Word;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 1;
        Fecha := FechaInicial;
        DecodeDate(FechaInicial,A,M,D);
        DecodeDate(FechaFinal,AA,MM,DD);
        FechaFinal := EncodeDate(AA,MM,DD);

        LastDayMonth := DaysInAMonth(AA,MM);

        if (MM = 2) and ( (DD=LastDayMonth)) then DD := 30;
        if DD = 31 then DD := 30;

        while true do
        begin
         if (AA = A) and (MM = M) and (DD = D) then Break;
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;
        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;

function  DiasEnFechas(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean):Integer;
var A,AA,M,MM,D,DD,AAA,DDD,MMM,AAAA,MMMM,DDDD,B:Word;
    Dias:Integer;
    Fecha:TDateTime;
    Negativo:Boolean;
    LastDayMonth:Word;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 0;

        DecodeDate(FechaInicial,A,M,D);

        while (FechaInicial <= FechaFinal) do
        begin
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
         if TryEncodeDate(A,M,D,Fecha) = False  then
         begin
             DDDD := Dayof(EndOfAMonth(A,M));
             Dias := Dias + (30 - DDDD);
             M := M + 1;
             if M > 12 then
             begin
               M := 1;
               A := A + 1;
             end;
             DDDD := 1;
             D := 1;
             FechaInicial := EncodeDate(A,M,DDDD);
         end
         else
           FechaInicial := Fecha;
        end;

        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;


{
function  DiasEntreFechas1(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate):Integer;
var
    A,M,D:Word; // Fecha Inicial
    AA,MM,DD:Word; //Fecha Final
    AAA,MMM,DDD:Word; // Fecha Corte
    DDDD:Word; //Fecha
    Dias:Integer;
    Fecha:TDate;
    Negativo:Boolean;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;

        DecodeDate(FechaInicial,A,M,D);
        DecodeDate(FechaFinal,AA,MM,DD);
        DecodeDate(FechaCorte,AAA,MMM,DDD);
        Dias := 1;

        if DD = 31 then DD := 30;
        if D = 31 then D := 30;

        DDDD := Dayof(EndOfAMonth(YearOf(Date),02));

        if ((DDDD = 28) and (DD=28)) then
          Dias := Dias + 2;

        if ((DDDD = 29) and (DD=29)) then
          Dias := Dias + 1;

        while (D <> DD) and (M <= MM) and (A <= AA) do
        begin
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;


        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;   }

{
function  DiasEntreFechas1(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean;Devuelto:Boolean):Integer;
var
    A,M,D:Word; // Fecha Inicial
    AA,MM,DD:Word; //Fecha Final
    AAA,MMM,DDD:Word; // Fecha Corte
    DDDD:Word; //Fecha
    B:Word; // Dia
    Dias:Integer;
    Fecha:TDate;
    Negativo:Boolean;
    LastDayMonth:Word;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 1;
        Fecha := FechaInicial;
        DecodeDate(FechaInicial,A,M,D);
        B := D;
        DecodeDate(FechaFinal,AA,MM,DD);
        DecodeDate(FechaCorte,AAA,MMM,DDD);
        FechaInicial := EncodeDate(A,M,D);
        FechaFinal := EncodeDate(AA,MM,DD);
        FechaCorte := EncodeDate(AAA,MMM,DDD);

        LastDayMonth := DaysInAMonth(AA,MM);

        if (MM=2) and (DD=LastDayMonth) then begin
          if (DDD=28) then DD := DDD//28
          else if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD := 30
          else if (DDD<28) then DD := 30;
        end
        else if (MM=2) and (DD=29) then
          if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD:= 30
          else if (DDD<29) then DD:= 30;

        if DD = 31 then DD := 30;
        if D = 31 then D := 30;

        while (D <> DD) and (M <= MM) and (A <= AA) do
        begin
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;

//       DDDD := Dayof(EndOfAMonth(YearOf(Date),02));
       DDDD := DaysInAMonth(YearOf(fFechaActual),02);
       if ((DDDD=29) and(M=3) and (B=1)) and (Bisiesto) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 1;

       if ((DDDD=28) and(M=3) and (B=1)) and (Bisiesto) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 1;

       if (DDDD=28) and (DDD=30) and (MM=2) and Devuelto then
         Dias := Dias - 1;
       if (DDDD=28) and (DDD=29) and (MM=2) and Devuelto then
         Dias := Dias - 1;

        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;  }

//utilizada antes de 10/03/2009
function  DiasEntreFechas1(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean;Devuelto:Boolean):Integer;
var 
    A,M,D:Word; // Fecha Inicial
    AA,MM,DD:Word; //Fecha Final
    AAA,MMM,DDD:Word; // Fecha Corte
    DDDD:Word; //Fecha
    B:Word; // Dia
    Dias:Integer;
    Fecha:TDate;
    Negativo:Boolean;
    LastDayMonth:Word;
begin
        Negativo := False;
        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;
        Dias := 1;
        Fecha := FechaInicial;
        DecodeDate(FechaInicial,A,M,D);
        B := D;
        DecodeDate(FechaFinal,AA,MM,DD);
        DecodeDate(FechaCorte,AAA,MMM,DDD);
        FechaInicial := EncodeDate(A,M,D);
        FechaFinal := EncodeDate(AA,MM,DD);
        FechaCorte := EncodeDate(AAA,MMM,DDD);

        if (MM=2) and (DD=28) then begin
          if (DDD=28) then DD := DDD//28
          else if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD := 30
          else if (DDD<28) then DD := 30;
        end
        else if (MM=2) and (DD=29) then
          if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD:= 30
          else if (DDD<29) then DD:= 30;

        if DD = 31 then DD := 30;
        if D = 31 then D := 30;

        while (D <> DD) and (M <= MM) and (A <= AA) do
        begin
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;

       DDDD := Dayof(EndOfAMonth(YearOf(Date),02));
       if ((DDDD=29) and(M=3) and (B=1)) and (Bisiesto) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 2;

       if ((DDDD=28) and(M=3) and (B=1)) and (Bisiesto) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 2;

       if (DDDD=28) and (DDD=30) and (MM=2) and Devuelto then
         Dias := Dias - 1;
       if (DDDD=28) and (DDD=29) and (MM=2) and Devuelto then
         Dias := Dias - 1;

        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;

//function  DiasEntreFechas(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate;Bisiesto:Boolean):Integer;
function  DiasEntreFechas(FechaInicial:TDate;FechaFinal:TDate;FechaCorte:TDate):Integer;
var A,AA,M,MM,D,DD,AAA,DDD,MMM,AAAA,MMMM,DDDD,B:Word;
    Dias,diasPrueba:Integer;
    Fecha:TDate;
    Negativo:Boolean;
    LastDayMonth:Word;
begin
        Negativo := False;

        if DayOf(FechaInicial) = 31 then
          FechaInicial := FechaInicial + 1;

        if FechaInicial > FechaFinal then
        begin
          Fecha := FechaInicial;
          FechaInicial := FechaFinal;
          FechaFinal := Fecha;
          Negativo := True;
        end;

        Dias := 1;

        DecodeDate(FechaInicial,A,M,D);
        B := D;
        DecodeDate(FechaFinal,AA,MM,DD);
        DecodeDate(FechaCorte,AAA,MMM,DDD);

        if (MM=2) and (DD=28) then begin
          if (DDD=28) then DD := DDD//28
          else if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD := 30
          else if (DDD<28) then DD := 30;
        end
        else if (MM=2) and (DD=29) then
          if (DDD=29) then DD := DDD//29
          else if (DDD=30) then DD:= 30
          else if (DDD<29) then DD:= 30;

        if DD = 31 then DD := 30;
        if D = 31 then D := 30;

       DDDD := Dayof(EndOfAMonth(YearOf(Date),02));

       if ((DDDD=29) and(M=3) and (B=1)) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 2;

       if ((DDDD=28) and(M=3) and (B=1)) then
          if (DDD=28) then Dias := Dias + 2
          else if (DDD=29) then Dias := Dias + 1;

        if ((DDDD = 28) and (DD=28) and (MM=2) and (DDD > 28)) then
          Dias := Dias + 2;

        if ((DDDD = 29) and (DD=29) and (MM=2) and (DDD > 29)) then
          Dias := Dias + 1;        

{        LastDayMonth := DaysInAMonth(A,M);

        if (M=2) and ((D=LastDayMonth)) then
            D := 30;

        LastDayMonth := DaysInAMonth(AA,MM);

        if ((MM=2) and (DD=LastDayMonth) and (DD = DDD)) then
            DD := 30
        else if ((MM=2) and (DD=LastDayMonth) and (DD < DDD)) then
            DD := DDD;

        if ((MM=2) and (DD=LastDayMonth)) then
            DD := DDD;

        if DD = 31 then DD := 30;
        if D = 31 then D := 30;

        {while (D <> DD) and (M <= MM) and (A <= AA) do
        begin
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;}

        while true do
        begin
         if (AA = A) and (MM = M) and (DD = D) then Break;
         Dias := Dias + 1;
         D := D + 1;
         if D > 30 then
         begin
           D := 1;
           M := M+1;
           if M > 12 then
           begin
              M := 1;
              A := A + 1;
           end;
         end;
        end;
{
       DDDD := Dayof(EndOfAMonth(YearOf(Date),02));

       if ((DDDD=29) and(M=3) and (B=1)) then
          if (DDD=29) then Dias := Dias + 1
          else if (DDD=28) then Dias := Dias + 2;

       if ((DDDD=28) and(M=3) and (B=1)) then
          if (DDD=28) then Dias := Dias + 2
          else if (DDD=29) then Dias := Dias + 1;

        if ((DDDD = 28) and (DD=28) and (MM=2) and (DDD > 28)) then
          Dias := Dias + 2;

        if ((DDDD = 29) and (DD=29) and (MM=2) and (DDD > 29)) then
          Dias := Dias + 1;
}
        if Negativo then
           Result := -(Dias)
        else
           Result := Dias;
end;

function RecalculoSaldosGenerales:Boolean;
var
Codigo       : String;
Codigomayor  : String;
Debito       : Currency;
Credito      : Currency;
SaldoInicial : Currency;
begin
  DmComprobante := TDmComprobante.Create(Application);
  if DmComprobante.IBQuery1.Transaction.InTransaction then
     DmComprobante.IBQuery1.Transaction.Rollback;
  DmComprobante.IBQuery1.Transaction.StartTransaction;
  with DmComprobante.IBQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select CON$PUC.ID_AGENCIA,');
      SQL.Add('CON$PUC.CODIGO');
      SQL.Add('from CON$PUC');
      SQL.Add('where ');
      SQL.Add('CON$PUC.MOVIMIENTO = 0 and CON$PUC.ID_AGENCIA = :ID_AGENCIA');
      SQL.Add('order by CON$PUC.ID_AGENCIA, CON$PUC.CODIGO');
      ParamByName('ID_AGENCIA').AsInteger := Agencia;
      try
        Open;
        if RecordCount > 0 then
        begin
          DmComprobante.IBVarios.SQL.Clear;
          DmComprobante.IBVarios.SQL.Add('update CON$SALDOSCUENTA SET DEBITO = 0, CREDITO = 0 where');
          DmComprobante.IBVarios.SQL.Add('CON$SALDOSCUENTA.ID_AGENCIA = :ID_AGENCIA and CON$SALDOSCUENTA.CODIGO = :CODIGO');
          DmComprobante.IBQuery2.SQL.Clear;
          DmComprobante.IBQuery2.SQL.Add('update CON$PUC SET SALDOINICIAL = 0 where');
          DmComprobante.IBQuery2.SQL.Add('CON$PUC.ID_AGENCIA = :ID_AGENCIA and CON$PUC.CODIGO = :CODIGO');
          while not eof do begin
           DmComprobante.IBVarios.Close;
           DmComprobante.IBVarios.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
           DmComprobante.IBVarios.ParamByName('CODIGO').AsString := FieldByName('CODIGO').AsString;
           DmComprobante.IBVarios.ExecQuery;
           DmComprobante.IBQuery2.Close;
           DmComprobante.IBQuery2.ParamByName('ID_AGENCIA').AsInteger := FieldByName('ID_AGENCIA').AsInteger;
           DmComprobante.IBQuery2.ParamByName('CODIGO').AsString := FieldByName('CODIGO').AsString;
           DmComprobante.IBQuery2.ExecSQL;
           Next;
          end;
        end;
      except
          Result := False;
          DmComprobante.Free;
          raise;
          Exit;
      end;
    end;



  with DmComprobante.IBQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ');
      SQL.Add('CON$PUC.ID_AGENCIA,');
      SQL.Add('CON$PUC.CODIGO,');
      SQL.Add('CON$PUC.CODIGOMAYOR,');
      SQL.Add('CON$PUC.SALDOINICIAL');
      SQL.Add('from CON$PUC');
      SQL.Add('where ');
      SQL.Add('CON$PUC.MOVIMIENTO <> 0 and CON$PUC.ID_AGENCIA = :ID_AGENCIA');
      SQL.Add('Order by CON$PUC.ID_AGENCIA,CON$PUC.CODIGO');
      ParamByName('ID_AGENCIA').AsInteger := Agencia;
      Open;
        while not Eof do
         begin
           Codigo := fieldbyname('CODIGO').AsString;
           Codigomayor := FieldByName('CODIGOMAYOR').AsString;
           SaldoInicial := FieldByName('SALDOINICIAL').AsCurrency;
           with DmComprobante.IBQuery2 do
            begin
              Close;
              sql.Clear;
              sql.Add('Select ');
              SQL.Add('CON$SALDOSCUENTA."MES",');
              sql.Add('CON$SALDOSCUENTA."DEBITO",');
              sql.Add('CON$SALDOSCUENTA."CREDITO"');
              sql.Add('from CON$SALDOSCUENTA ');
              sql.Add('where ');
              sql.Add('CON$SALDOSCUENTA.ID_AGENCIA =:"ID_AGENCIA" and');
              sql.Add('CON$SALDOSCUENTA.CODIGO =:"CODIGO"');
              ParamByName('ID_AGENCIA').AsInteger := Agencia;
              ParamByName('CODIGO').AsString := Codigo;
              try
                Open;
                while not Eof do begin
                 if (FieldByName('DEBITO').ascurrency <> 0 ) or
                    (FieldByName('CREDITO').ascurrency <> 0 ) then
                   ColocarSaldoMayor(Codigomayor,FieldByName('MES').AsInteger,FieldByName('DEBITO').AsCurrency,FieldByName('CREDITO').AsCurrency,DmComprobante.IBVarios);
                 Next;
                end;
              except
                Result := False;
                DmComprobante.Free;
                raise;
                Exit;
              end;
            end;
            //if SaldoInicial <> 0 then
            //begin
               ColocarSaldoInicial(Codigomayor,SaldoInicial,DmComprobante.IBVarios);
            //end;
          next;
         end;
      end;
     Dmcomprobante.IBQuery1.Transaction.Commit;
     Result := True;

  DmComprobante.Free;

end;

procedure ColocarSaldoMayor(CodigoMayor: string;Mes:Integer;Debito:Currency;Credito:Currency;IBVarios:TIBSQL);
var Nivel:Integer;
    CodigoM:string;
begin
        with IBVarios do begin
          Close;
          SQL.Clear;
          SQL.Add('select CON$PUC.NIVEL,CON$PUC.CODIGOMAYOR from CON$PUC where ID_AGENCIA = :ID_AGENCIA and CODIGO = :CODIGO');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('CODIGO').AsString := CodigoMayor;
          try
           ExecQuery;
           if RecordCount > 0 then begin
            Nivel := FieldByName('NIVEL').AsInteger;
            CodigoM := FieldByName('CODIGOMAYOR').AsString;
           end
           else
             Exit;
          except
            raise;
          end;
        end;

        with ibvarios do begin
           Close;
           SQL.Clear;
           SQL.Add('update CON$SALDOSCUENTA SET DEBITO = DEBITO + :DEBITO, CREDITO = CREDITO + :CREDITO');
           SQL.Add('where ID_AGENCIA = :ID_AGENCIA and CODIGO = :CODIGO and MES = :MES');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('CODIGO').AsString := CodigoMayor;
           ParamByName('MES').AsInteger:= Mes;
           ParamByName('DEBITO').AsCurrency := Debito;
           ParamByName('CREDITO').AsCurrency := Credito;
           try
            ExecQuery;
            if IBVarios.RowsAffected < 1 then
            begin
               Close;
               SQL.Clear;
               SQL.Add('insert into CON$SALDOSCUENTA values(:ID_AGENCIA,:CODIGO,:MES,:DEBITO,:CREDITO)');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('CODIGO').AsString := CodigoMayor;
               ParamByName('MES').AsInteger := Mes;
               ParamByName('DEBITO').AsCurrency := Debito;
               ParamByName('CREDITO').AsCurrency := Credito;
               try
                ExecQuery;
               except
                raise;
               end;
            end;
           except
            raise;
           end;
        end;

        if Nivel > 1 then
         ColocarSaldoMayor(CodigoM,Mes,Debito,Credito,IBVarios);
end;

procedure ColocarSaldoInicial(CodigoMayor: string; SaldoInicial:Currency; IBVarios: TIBSQL);
var Nivel:Integer;
    CodigoM:string;
begin
        with IBVarios do begin
          Close;
          SQL.Clear;
          SQL.Add('select CON$PUC.NIVEL,CON$PUC.CODIGOMAYOR from CON$PUC where ID_AGENCIA = :ID_AGENCIA and CODIGO = :CODIGO');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('CODIGO').AsString := CodigoMayor;
          try
           ExecQuery;
           if RecordCount > 0 then begin
            Nivel := FieldByName('NIVEL').AsInteger;
            CodigoM := FieldByName('CODIGOMAYOR').AsString;
           end
           else
             Exit;
          except
            raise;
          end;
        end;

        with ibvarios do begin
           Close;
           SQL.Clear;
           SQL.Add('update CON$PUC SET SALDOINICIAL = SALDOINICIAL + :SALDOINICIAL');
           SQL.Add('where ID_AGENCIA = :ID_AGENCIA and CODIGO = :CODIGO');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('CODIGO').AsString := CodigoMayor;
           ParamByName('SALDOINICIAL').AsCurrency := SaldoInicial;
           try
            ExecQuery;
{
            if IBVarios.RowsAffected < 1 then
            begin

               Close;
               SQL.Clear;
               SQL.Add('insert into "con$saldoscuenta" values(:ID_AGENCIA,:CODIGO,:MES,:DEBITO,:CREDITO)');
               ParamByName('ID_AGENCIA').AsInteger := Agencia;
               ParamByName('CODIGO').AsString := CodigoMayor;
               ParamByName('MES').AsInteger := Mes;
               ParamByName('DEBITO').AsCurrency := Debito;
               ParamByName('CREDITO').AsCurrency := Credito;
               try
                ExecQuery;
               except
                raise;
               end;
            end;
}
           except
            raise;
           end;
        end;

        if Nivel > 1 then
         ColocarSaldoInicial(CodigoM,SaldoInicial,IBVarios);
end;

function ObtenerConsecutivoEquivalente(IBSQL1: TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('SELECT GEN_ID(GEN_DOCUEQUIVALENTE_ID, 1) FROM RDB$DATABASE;');
          ExecQuery;
          Consecutivo := FieldByName('GEN_ID').AsInteger;
          Close;
          Transaction.Commit;
          Result := Consecutivo;
          Break;
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
end;


function ObtenerGenConsecutivo(IBSQL1:TIBSQL; _iNumero: Integer): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select CONSECUTIVO from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = :ID');
          ParamByName('ID').AsInteger := _iNumero;
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = :ID');
          ParamByName('ID').AsInteger := _iNumero;
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
end;

function ObtenerConsecutivoSinTipo(IBSQL1:TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select CONSECUTIVO from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = :ID');
          ParamByName('ID').AsInteger := 1;
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = :ID');
          ParamByName('ID').AsInteger := 1;
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
end;


function ObtenerConsecutivo(IBSQL1:TIBSQL; _iTipo:Integer): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select LLAVECSC from CON$TIPOCOMPROBANTE where CON$TIPOCOMPROBANTE."ID" = :ID');
          ParamByName('ID').AsInteger := _iTipo;
          ExecQuery;
          Consecutivo := FieldByName('LLAVECSC').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update CON$TIPOCOMPROBANTE set CON$TIPOCOMPROBANTE."LLAVECSC" = :"CONSECUTIVO" ');
          SQL.Add(' where CON$TIPOCOMPROBANTE."ID" = :ID');
          ParamByName('ID').AsInteger := _iTipo;
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
end;

function ObtenerConsecutivoPlantilla(IBSQL1:TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from GEN$CONSECUTIVOS where GEN$CONSECUTIVOS."ID_CONSECUTIVO" = 5');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update GEN$CONSECUTIVOS set GEN$CONSECUTIVOS."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where GEN$CONSECUTIVOS."ID_CONSECUTIVO" = 5');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
end;

function ObtenerConsecutivoAyudas(IBSQL1:TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 6');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 6');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
end;

function ObtenerCaptacion(TipoCaptacion:Integer;IBSQL1: TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          Close;
          SQL.Clear;
          SQL.Add('select CONSECUTIVO from "cap$tipocaptacion" where ');
          SQL.Add(' ID_TIPO_CAPTACION = :"ID" ');
          ParamByName('ID').AsInteger := TipoCaptacion;
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('UPDATE "cap$tipocaptacion" ');
          SQL.Add('SET CONSECUTIVO = :CONSECUTIVO where ');
          SQL.Add('ID_TIPO_CAPTACION = :ID');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ParamByName('ID').AsInteger := TipoCaptacion;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
end;


function ObtenerConsecutivoTmp(IBSQL1:TIBSQL): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
begin
       Result := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivostmp" where "gen$consecutivostmp"."ID_CONSECUTIVO" = 1');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivostmp" set "gen$consecutivostmp"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivostmp"."ID_CONSECUTIVO" = 1');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
end;


function ObtenerConsecutivoCajaCartera: Longint;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
    IBSQL1:TIBSQL;
    IBT1:TIBTransaction;
    dmGeneral:TdmGeneral;
begin
       dmGeneral := TdmGeneral.Create(nil);
       dmGeneral.getConnected;
       IBT1 := TIBTransaction.Create(Application);
       IBSQL1 := TIBSQL.Create(Application);
       IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
       IBSQL1.Transaction := IBT1;

       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 5');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 5');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
        
        dmGeneral.Free;
end;

function ObtenerConsecutivoCajaCarteraTmp: Longint;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
    IBSQL1:TIBSQL;
    IBT1:TIBTransaction;
    dmGeneral:TdmGeneral;
begin
       dmGeneral := TdmGeneral.Create(nil);
       dmGeneral.getConnected;
       IBT1 := TIBTransaction.Create(Application);
       IBSQL1 := TIBSQL.Create(Application);
       IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
       IBSQL1.Transaction := IBT1;

       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivostmp" where "gen$consecutivostmp"."ID_CONSECUTIVO" = 5');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivostmp" set "gen$consecutivostmp"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivostmp"."ID_CONSECUTIVO" = 5');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
        
        dmGeneral.Free;
end;


function fFechaActual: TDate;
var IBSP1:TIBStoredProc;
    IBT1:TIBTransaction;
    dmGeneral:TdmGeneral;
begin
        IBT1 := TIBTransaction.Create(Application);
        IBSP1 := TIBStoredProc.Create(Application);
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSP1.Transaction := IBT1;
        IBSP1.StoredProcName := 'SP_FECHA_ACTUAL';
        with IBSP1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          try
           ExecProc;
          finally
           Result := parambyname('FECHA').AsDate;
          end;
          Close;
          Transaction.Commit;
        end;
        dmGeneral.Free;
end;

function fHoraActual: TTime;
var IBSP1:TIBStoredProc;
    IBT1:TIBTransaction;
    dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBT1 := TIBTransaction.Create(Application);
        IBSP1 := TIBStoredProc.Create(Application);
        IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSP1.Transaction := IBT1;
        IBSP1.StoredProcName := 'SP_HORA_ACTUAL';
        with IBSP1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          try
           ExecProc;
          finally
           Result := parambyname('HORA').AsDate;
          end;
          Close;
          Transaction.Commit;
        end;
        IBSP1.Destroy;
        IBT1.Destroy;
        
        dmGeneral.Free;
end;

function fFechaHoraActual: TDateTime;
var IBSP1:TIBStoredProc;
    IBT1:TIBTransaction;
    dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBT1 := TIBTransaction.Create(Application);
        IBSP1 := TIBStoredProc.Create(Application);
        IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSP1.Transaction := IBT1;
        IBSP1.StoredProcName := 'SP_FECHAHORA_ACTUAL';
        with IBSP1 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          try
           ExecProc;
          finally
           Result := parambyname('FECHAHORA').AsDate;
          end;
          Close;
          Transaction.Commit;
        end;
        IBSP1.Destroy;
        IBT1.Destroy;
        
        dmGeneral.Free;
end;





function ValidarOpcion(IdOpcion: integer): Boolean;
var IBSQL1:TIBSQL;
    IBT1:TIBTransaction;
    dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBSQL1 := TIBSQL.Create(Application);
        IBT1 := TIBTransaction.Create(Application);
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL1.Transaction := IBT1;
        IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBSQL1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           sql.Clear;
           sql.Add('select * from "gen$permisos" where ID_EMPLEADO=:ID_EMPLEADO and ID_PERMISO = :ID_PERMISO');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ParamByName('ID_PERMISO').AsInteger := IdOpcion;
           try
             ExecQuery;
             if RecordCount < 1 then begin
                MessageDlg('Usted no está autorizado para ejecutar esta opción',mtError,[mbcancel],0);
                Result := False;
             end
             else
                Result := True;
             Transaction.Commit;
           except
             Transaction.Rollback;
             Result := False;
             raise;
           end;
        end;
        dmGeneral.Free;

end;

function extrae_empleado: string;
var
        dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        with dmGeneral.IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
           Transaction.StartTransaction;
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           ExecQuery;
           Result := FieldByName('NOMBRE').AsString + ' '+FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;;
           Close;
        end;
        dmGeneral.Free;
end;

function Buscaconyuge(id_persona, id_solicitud: string;
  id_identificacion: integer): boolean;
  var
   dmGeneral:TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        with dmGeneral.IBSQL1 do
        begin
          SQL.Clear;
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Add('select * from');
          SQL.Add('"col$infconyuge"');
          SQL.Add('WHERE ID_SOLICITUD = :ID_SOLICITUD AND ID_PERSONA = :ID_PERSONA AND ID_IDENTIFICACION = :ID_IDENTIFICACION');
          ParamByName('ID_SOLICITUD').AsString := id_solicitud;
          ParamByName('ID_PERSONA').AsString := id_persona;
          ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
          ExecQuery;
          if RecordCount > 0 then
             Result := True
          else
             Result := False;
          Close;
        end;
        dmGeneral.Free;        
end;

function Valida_Solicitud(id_colocacion: string;
  id_agencia: integer): string;
var IBValida:TIBSQL;
    IBTValida:TIBTransaction;
    dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBValida := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBValida.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBValida do
        begin
          Close;
          if Transaction.InTransaction then
              Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select ID_SOLICITUD from "col$desembolsoparcial"');
          SQL.Add('where ID_COLOCACION = :ID_COLOCACION and ID_AGENCIA = :ID_AGENCIA');
          SQL.Add('and DESEMBOLSADO = 0');
          ParamByName('ID_COLOCACION').AsString := id_colocacion;
          ParamByName('ID_AGENCIA').AsInteger := id_agencia;
          ExecQuery;
          if RecordCount > 0 then
             Result := FieldByName('ID_SOLICITUD').AsString
          else
             Result := '';
          Close;
        end;

        dmGeneral.Free;        
end;

function define_tasa(linea: integer; tasa: Currency): string;
var     IBSQL :TIBSQL;
        IBTRAN :TIBTransaction;
        puntos :string;
        dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBSQL := TIBSQL.Create(Application);
        IBTRAN := TIBTransaction.Create(Application);
        IBSQL.Transaction := IBTRAN;
        IBTRAN.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBSQL do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$lineas".PUNTOS_ADICIONALES');
          SQL.Add('FROM');
          SQL.Add('"col$lineas"');
          SQL.Add('WHERE');
          SQL.Add('("col$lineas".ID_LINEA = :ID_LINEA)');
          ParamByName('ID_LINEA').AsInteger := linea;
          ExecQuery;
          puntos := FieldByName('PUNTOS_ADICIONALES').AsString;
          Close;
        end;
        if Linea = 8 then
           Result := 'IPC + ' + puntos + ' PUNTOS'
        else if linea  = 10 then
           Result := 'DTF + ' + puntos + ' PUNTOS'
        else
           Result := CurrToStr(tasa) + '%';
        dmGeneral.Free;
end;

function Obtener_Estado(id_estado: integer): string;
var     IBSQL :TIBSQL;
        IBTRAN :TIBTransaction;
        puntos :string;
        dmGeneral:TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBSQL := TIBSQL.Create(Application);
        IBTRAN := TIBTransaction.Create(Application);
        IBSQL.Transaction := IBTRAN;
        IBTRAN.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBSQL do
        begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$estadosolicitud".DESCRIPCION_ESTADO');
          SQL.Add('FROM');
          SQL.Add('"col$estadosolicitud"');
          SQL.Add('WHERE');
          SQL.Add('("col$estadosolicitud".ID_ESTADO = :ID_ESTADO)');
          ParamByName('ID_ESTADO').AsInteger := id_estado;
          ExecQuery;
          Result := FieldByName('DESCRIPCION_ESTADO').AsString;
          Close;
        end;
        
        dmGeneral.Free;        
end;


function ObtenerConsecutivoReteFuente(IBDatabase1:TIBDatabase): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
    IBSQL1:TIBSQL;
    IBT:TIBTransaction;
    dmGeneral: TdmGeneral;
begin
       dmGeneral := TdmGeneral.Create(nil);
       dmGeneral.getConnected;
       IBSQL1 := TIBSQL.Create(nil);
       IBT := TIBTransaction.Create(nil);
       IBT.DefaultDatabase := dmGeneral.IBDatabase1;
       IBSQL1.Database := dmGeneral.IBDatabase1;
       IBSQL1.Transaction := IBT;
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 8');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 8');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
        
        dmGeneral.Free;        
end;

function ValidaHoraCaja: ThoraCaja;
var     IBOtros:TIBSQL;
        IBTValida:TIBTransaction;
        dmGeneral:TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBOtros := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBOtros.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBOtros do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "caj$horariosucursal" where ID_HORARIO = :ID_HORARIO');
           ParamByName('ID_HORARIO').AsInteger := DayOfTheWeek(fFechaActual);
           ExecQuery;
           Result.Hora := FieldByName('HORA').AsTime;
           if FieldByName('HORA').AsTime < time then
              Result.Estado := false
           else
              Result.Estado := True;
        end;

        dmGeneral.Free;
end;

procedure BuscaPoliza;
var     IBOtros:TIBSQL;
        IBTValida:TIBTransaction;
        dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBOtros := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBOtros.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBOtros do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT POLIZA FROM  "col$poliza"');
           SQL.Add('WHERE CONSECUTIVO = (SELECT MAX(CONSECUTIVO) FROM "col$poliza")');
           ExecQuery;
           vPolizaCredivida := FieldByName('POLIZA').AsString;
        end;

        dmGeneral.Free;
end;

function BuscaServicio(Id_Agencia, Id_Servicio: integer): TServicio;
var     IBOtros:TIBSQL;
        IBTValida:TIBTransaction;
        dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBOtros := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBOtros.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBOtros do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select ID_PUERTO,ID_HOST from "gen$servidor" where ID_AGENCIA = :ID_AGENCIA and ID_SERVICIO = :ID_SERVICIO');
           ParamByName('ID_AGENCIA').AsInteger := Id_Agencia;
           ParamByName('ID_SERVICIO').AsInteger := Id_Servicio;
           ExecQuery;
           Result.vPuerto := FieldByName('ID_PUERTO').AsInteger;
           Result.vHost := FieldByName('ID_HOST').AsString;
        end;

        dmGeneral.Free;
end;

function ValidaCon(Nm:Integer;Tp:integer; Dg:integer): Currency;
var     IBOtros:TIBSQL;
        IBTValida:TIBTransaction;
        vDias :Currency;
        vFecha :TDate;
        vDiasv :Currency;
        dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        vCuotasContractual := 0;
        IBOtros := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBOtros.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBOtros do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('SELECT FIRST 1 FECHA_DESCUENTO, count(FECHA_DESCUENTO) AS CONTADOR FROM "cap$tablaliquidacioncon" WHERE');
           SQL.Add('"cap$tablaliquidacioncon".ID_AGENCIA = :ID_AGENCIA and');
           SQL.Add('"cap$tablaliquidacioncon".ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
           SQL.Add('"cap$tablaliquidacioncon".NUMERO_CUENTA = :NUMERO_CUENTA and');
           SQL.Add('"cap$tablaliquidacioncon".DIGITO_CUENTA = :DIGITO_CUENTA and');
           SQL.Add('"cap$tablaliquidacioncon".FECHA_DESCUENTO <= :FECHA and');
           SQL.Add('"cap$tablaliquidacioncon".DESCONTADO = 0');
           SQL.Add(' GROUP BY FECHA_DESCUENTO ORDER BY "cap$tablaliquidacioncon".FECHA_DESCUENTO ASC');
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           ParamByName('ID_TIPO_CAPTACION').AsInteger := Tp;
           ParamByName('NUMERO_CUENTA').AsInteger := Nm;
           ParamByName('DIGITO_CUENTA').AsInteger := Dg;
           ParamByName('FECHA').AsDate := fFechaActual;
           ExecQuery;
           if FieldByName('CONTADOR').AsInteger > 0 then
           begin
             vFecha := FieldByName('FECHA_DESCUENTO').AsDate;
             vDias := DaysBetween(fFechaActual, vFecha);
             vDias := SimpleRoundTo(vDias/30,0);
           end
           else
             vDias := 0;
           Close;
           SQL.Clear;
           SQL.Add('SELECT SUM(C_VENCIDA) AS TOTAL FROM "cap$controlcon" WHERE ID_TIPO_CAPTACION = :TP AND NUMERO_CUENTA = :NM AND DIGITO_CONTROL = :DG');
           ParamByName('TP').AsInteger := Tp;
           ParamByName('NM').AsInteger := Nm;
           ParamByName('DG').AsInteger := Dg;
           ExecQuery;
           vDiasv := FieldByName('TOTAL').AsCurrency;
        end;
        vCuotasContractual := vDias + vdiasv;
        Result := vDias;
  
        dmGeneral.Free;
end;

function vContabilizaCon(Nm, Tp, Dg: integer): Boolean;
var     IBOtros:TIBSQL;
        IBTValida:TIBTransaction;
        dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        Result := True;
        IBOtros := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBOtros.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBOtros do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select FECHA_APERTURA from "cap$maestro"');
           SQL.Add('where ID_TIPO_CAPTACION = :TP and NUMERO_CUENTA = :NM');
           SQL.Add('and DIGITO_CUENTA = :DG');
           ParamByName('NM').AsInteger := Nm;
           ParamByName('DG').AsInteger := Dg;
           ParamByName('TP').AsInteger := Tp;
           ExecQuery;
           if FieldByName('FECHA_APERTURA').AsDate = fFechaActual then
              Result := False;
        end;
       
        dmGeneral.Free;
end;

function EvaluarFecha: Boolean;
var     IBOtros:TIBSQL;
        IBTValida:TIBTransaction;
        dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        Result := True;
        IBOtros := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBOtros.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBOtros do
        begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select count(FECHA) as CONTADOR from "caj$calsucursal"');
           SQL.Add('where FECHA = :FECHAHOY - 1 and ESTADO = 0 ');
           ParamByName('FECHAHOY').AsDateTime := fFechaActual;
           ExecQuery;
           if FieldByName('CONTADOR').AsInteger = 0 then
              Result := False;
        end;

        dmGeneral.Free;
end;

procedure FechaCierre(CdFecha: TClientDataSet);
var     _iContador :Integer;
        IBSQL1,IBSQL2:TIBSQL;
        IBTValida:TIBTransaction;
        dmGeneral :TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBSQL1 := TIBSQL.Create(Application);
        IBSQL2 := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBSQL1.Transaction := IBTValida;
        IBSQL2.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        _iContador := 0;
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('SELECT FECHA FROM "caj$calsucursal"');
          SQL.Add('WHERE (ESTADO = 0) AND (FECHA < :FECHA)');
          ParamByName('FECHA').AsDate := fFechaActual;
          ExecQuery;
          while not Eof do
          begin
            IBSQL2.Close;
            IBSQL2.SQL.Clear;
            IBSQL2.SQL.Add('SELECT COUNT(*) AS CONTADOR FROM "caj$movremotoentrada"');
            IBSQL2.SQL.Add('WHERE (FECHA_MOV BETWEEN :FECHA1 AND :FECHA2)');
            IBSQL2.ParamByName('FECHA1').AsDateTime := FieldByName('FECHA').AsDate + StrToTime('00:00:00');
            IBSQL2.ParamByName('FECHA2').AsDateTime := FieldByName('FECHA').AsDate + StrToTime('23:59:00');
            IBSQL2.ExecQuery;
            if IBSQL2.FieldByName('CONTADOR').AsInteger <> 0 then
            begin
              if _iContador = 0 then
                 vFechaInicial := FieldByName('FECHA').AsDate;
              CdFecha.Append;
              CdFecha.FieldValues['FECHA'] := FieldByName('FECHA').AsDate;
              CdFecha.Post;
              _iContador := 1;
              vFechaSinCerrar := vFechaSinCerrar + DateToStr(FieldByName('FECHA').AsDate) + ' ';
            end
            else
            begin
              IBSQL2.Close;
              IBSQL2.SQL.Clear;
              IBSQL2.SQL.Add('UPDATE "caj$calsucursal" SET ESTADO = 1 WHERE FECHA = :FECHA ');
              IBSQL2.ParamByName('FECHA').AsDateTime := FieldByName('FECHA').AsDate + StrToTime('23:59:00');
              IBSQL2.ExecQuery;
              IBSQL2.Transaction.CommitRetaining;
            end;
            Next;
          end;
          Transaction.Commit;
        end;

        dmGeneral.Free;
end;

function DigitoVerificacion(Nit :string) :Integer;
var
  i, j, vTotal :Integer;
const
  ValFijos :array[1..15] of Word = (3,7,13,17,19,23,29,37,41,43,47,53,59,67,71);
begin
  vTotal := 0;
  j := 0;
  for i := Length(Nit) downto 1 do
  begin
    inc(j);
    vTotal := vTotal + (StrToInt(Nit[i]) * ValFijos[j]);
  end;
  vTotal := vTotal - (vTotal div 11) * 11;

  if vTotal > 1 then
    vTotal := 11-vTotal;
  
  Result := vTotal;
end;

procedure log(Mensaje: String);
var
  F: TextFile;
  Filename: String;
  SearchRec: TSearchRec;
begin
  // Damos formato al mensaje
  Mensaje:= FormatDateTime('[ddd dd mmm, hh:nn] ', Now) + Mensaje;
  Filename:= ChangeFileExt(ParamStr(0),'.log');
  if FindFirst(Filename,faArchive,SearchRec) = 0 then
  begin
    // Comprobamos el tamaño de .log
    if SearchRec.Size > (1024*1024) then
      // Y si es mayor de 1 MB lo movemos
      MoveFileEx(PChar(Filename),PChar(Filename + '.1'),
        MOVEFILE_REPLACE_EXISTING);
    FindClose(SearchRec.FindHandle);
  end;
  // Aqui abrimos el archivo si existe, o lo creamos si no existe
  AssignFile(F, Filename);
  {$I-}
    Append(F);
  if IOResult <> 0 then
    Rewrite(F);
  {$I+}
  if IOResult = 0 then
  begin
    // Escribimos el mensaje
    Writeln(F,Mensaje);
    CloseFile(F);
  end;
end;
function CrearProducto(_iNumeroCuenta,_iTipoCaptacion,_iDigitoCuenta,_iIdIdentificacion:Integer;_sIdPersona:string):Boolean;
var     IBSQL1 :TIBSQL;
        IBTValida :TIBTransaction;
        _iIdForma :Integer;
        dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
        IBSQL1 := TIBSQL.Create(Application);
        IBTValida := TIBTransaction.Create(Application);
        IBSQL1.Transaction := IBTValida;
        IBTValida.DefaultDatabase := dmGeneral.IBDatabase1;
        with IBSQL1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Rollback;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('select * from "cap$maestro" where NUMERO_CUENTA = :NUMERO_CUENTA and ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and ID_AGENCIA = :ID_AGENCIA');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := _iTipoCaptacion;
          ParamByName('NUMERO_CUENTA').AsInteger := _iNumeroCuenta;
          ExecQuery;
          if RecordCount > 0 then
          begin
            Result := True;
            Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Add('select ID_FORMA from "cap$tipocaptacion" where ');
          SQL.Add(' ID_TIPO_CAPTACION = :"ID"');
          ParamByName('ID').AsInteger := 2;
          ExecQuery;
          _iIdForma := FieldByName('ID_FORMA').AsInteger;
          Close;
          SQL.Clear;
          SQL.Add('insert into "cap$maestro" (ID_AGENCIA,');
          SQL.Add('ID_TIPO_CAPTACION,NUMERO_CUENTA,DIGITO_CUENTA,');
          SQL.Add('VALOR_INICIAL,ID_FORMA,FECHA_APERTURA,TIPO_INTERES,ID_INTERES,CUOTA,ID_PLAN,ID_ESTADO) ');
          SQL.Add('values (:"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
          SQL.Add(':"VALOR_INICIAL",:"ID_FORMA",:"FECHA_APERTURA",:"TIPO_INTERES",:"ID_INTERES",:"CUOTA",:"ID_PLAN",:"ID_ESTADO")');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := _iTipoCaptacion;
          ParamByName('NUMERO_CUENTA').AsInteger := _iNumeroCuenta;
          ParamByName('DIGITO_CUENTA').AsInteger := _iDigitoCuenta;
          ParamByName('VALOR_INICIAL').AsCurrency := 0;
          ParamByName('ID_FORMA').AsInteger := _iIdForma;
          ParamByName('FECHA_APERTURA').AsDate := fFechaActual;
          ParamByName('TIPO_INTERES').AsString := 'F';
          ParamByName('ID_INTERES').AsInteger := 0;
          ParamByName('CUOTA').AsCurrency := 0;
          ParamByName('ID_PLAN').AsInteger := 0;
          ParamByName('ID_ESTADO').AsInteger := 1;
          try
            ExecQuery;
          except
            begin
               Result := False;
               Abort;
            end;
          end;
          Close;
          SQL.Clear;
          SQL.Add('insert into "cap$maestrotitular" (ID_AGENCIA,ID_TIPO_CAPTACION,');
          SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ID_IDENTIFICACION,ID_PERSONA,');
          SQL.Add('NUMERO_TITULAR,TIPO_TITULAR) values (');
          SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
          SQL.Add(':"ID_IDENTIFICACION",:"ID_PERSONA",:"NUMERO_TITULAR",:"TIPO_TITULAR")');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := _iTipoCaptacion;
          ParamByName('NUMERO_CUENTA').AsInteger := _iNumeroCuenta;
          ParamByName('DIGITO_CUENTA').AsInteger := _iDigitoCuenta;
          ParamByName('ID_IDENTIFICACION').AsInteger := _iIdIdentificacion;
          ParamByName('ID_PERSONA').AsString := _sIdPersona;
          ParamByName('NUMERO_TITULAR').AsInteger := 1;
          ParamByName('TIPO_TITULAR').AsInteger := 1;
          try
            ExecQuery;
          except
            begin
              Result := False;
              Abort;
            end;
          end;
          Close;
          SQL.Clear;
          SQL.Add('insert into "cap$maestrosaldoinicial" (ID_AGENCIA,ID_TIPO_CAPTACION,');
          SQL.Add('NUMERO_CUENTA,DIGITO_CUENTA,ANO,SALDO_INICIAL)');
          SQL.Add(' values (');
          SQL.Add(':"ID_AGENCIA",:"ID_TIPO_CAPTACION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",');
          SQL.Add(':"ANO",:"SALDO_INICIAL")');
          ParamByName('ID_AGENCIA').AsInteger := Agencia;
          ParamByName('ID_TIPO_CAPTACION').AsInteger := _iTipoCaptacion;
          ParamByName('NUMERO_CUENTA').AsInteger := _iNumeroCuenta;
          ParamByName('DIGITO_CUENTA').AsInteger := _iDigitoCuenta;
          ParamByName('ANO').AsString := FormatFloat('0000',YearOf(fFechaActual));
          ParamByName('SALDO_INICIAL').AsCurrency := 0;
          ExecQuery;
          Transaction.Commit;
       end;
         Result := True;
        
        dmGeneral.Free;
end;

function ObtenerConsecutivoControlCobro(IBDatabase1: TIBDatabase): LongInt;
const ntMaxTries = 100;
var I, WaitCount, Tries,Consecutivo:Integer;
    RecordLocked:Boolean;
    ErrorMsg:string;
    IBSQL1:TIBSQL;
    IBT:TIBTransaction;
    dmGeneral: TdmGeneral;
begin
        dmGeneral := TdmGeneral.Create(nil);
        dmGeneral.getConnected;
       IBSQL1 := TIBSQL.Create(nil);
       IBT := TIBTransaction.Create(nil);
       IBT.DefaultDatabase := dmGeneral.IBDatabase1;
       IBSQL1.Database := dmGeneral.IBDatabase1;
       IBSQL1.Transaction := IBT;
       Result := 0;
       Tries := 0;
       while True do
        with IBSQL1 do begin
         Close;
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         try
          SQL.Clear;
          SQL.Add('select * from "gen$consecutivos" where "gen$consecutivos"."ID_CONSECUTIVO" = 9');
          ExecQuery;
          Consecutivo := FieldByName('CONSECUTIVO').AsInteger;
          Close;
          Consecutivo := Consecutivo + 1;
          SQL.Clear;
          SQL.Add('update "gen$consecutivos" set "gen$consecutivos"."CONSECUTIVO" = :"CONSECUTIVO" ');
          SQL.Add(' where "gen$consecutivos"."ID_CONSECUTIVO" = 9');
          ParamByName('CONSECUTIVO').AsInteger := Consecutivo;
          ExecQuery;
          Transaction.Commit;
          Result := Consecutivo;
          break;
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
        
        dmGeneral.Free;        
end;

end.
