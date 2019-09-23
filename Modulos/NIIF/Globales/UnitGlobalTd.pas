unit UnitGlobalTd;

interface
Uses Graphics, Forms, StdCtrls, DBCtrls, Math, DateUtils, IB, IBSQL ,IBQuery,IBStoredProc, IBDataBase,
      Messages,SysUtils,DB,DBGrids,Windows,Controls, StrUtils,Classes,JvStringGrid,DBClient,JclStrings;

function  InttoBoolean (valor:integer) : Boolean;
function fFechaActual: TDate;
function fFechaHoraActual: TDateTime;
procedure EnterTabs(var Key:Char;oSelf:TForm);
function fHoraActual: TTime;
function ValidaCadena(Cadena:string;CdAscii:TClientDataset):string;
procedure LLenaAscii(CdAscii:TClientDataSet);
var
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
  SmtpServerToCC:string;  
  SmtpServerFrom:string;
  SmtpAuthType: Integer;
  UserEmail: string;
  //generales
    Empresa:String;
    Nit:String;
    Agencia:Integer;
    Ciudad:string;
  // Acceso a base de datos
    DBAlias:String;
    DBPasabordo: String;
    DBNombre:String;
    DBServer:String;
    DBpath:String;
    DBname:String;
    DBrole :string;
    DBMinutos:Extended;
        FechaHoy:TDate;

implementation
uses UnitConexion;
function InttoBoolean (Valor: Integer): Boolean;
begin
       If Valor <> 0 then
          Result := True
       Else
          Result := False;
end;
function fFechaActual: TDate;
var IBSP1:TIBStoredProc;
    _tConexion :TConexion;
begin
        _tConexion := TConexion.Create;
        _tConexion.Conectar;
        IBSP1 := TIBStoredProc.Create(nil);
        IBSP1.StoredProcName := 'SP_FECHA_ACTUAL';
        with IBSP1 do begin
          Database := _tConexion.Database;
          Transaction := _tConexion.Transaccion;
          Close;
          try
           ExecProc;
          finally
           Result := parambyname('FECHA').AsDate;
          end;
          Close;
          Transaction.Commit;
        end;
        IBSP1.Destroy;
        _tConexion.Desconectar;
end;
function fFechaHoraActual: TDateTime;
var IBSP1:TIBStoredProc;
    _tConexion :TConexion;
begin
        _tConexion := TConexion.Create;
        _tConexion.Conectar;

        IBSP1 := TIBStoredProc.Create(nil);
     //   IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSP1.StoredProcName := 'SP_FECHAHORA_ACTUAL';
        with IBSP1 do begin
          Database := _tConexion.Database;
          Transaction := _tConexion.Transaccion;
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
        _tConexion.Desconectar;
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
function fHoraActual: TTime;
var IBSP1:TIBStoredProc;
    _tConexion :TConexion;
begin
        _tConexion := TConexion.Create;
        _tConexion.Conectar;
        IBSP1 := TIBStoredProc.Create(Application);
//        IBT1.DefaultDatabase := dmGeneral.IBDatabase1;
        IBSP1.StoredProcName := 'SP_HORA_ACTUAL';
        with IBSP1 do begin
          Database := _tConexion.Database;
          Transaction := _tConexion.Transaccion;
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
        _tConexion.Desconectar;
end;
function ValidaCadena(Cadena:string;CdAscii:TClientDataset):string;
var   _tReplace :TReplaceFlags;
begin
     _tReplace := [rfReplaceAll];
     with CdAscii do
     begin
       First;
       while not Eof do
       begin
          StrReplace(Cadena,FieldByName('NOVALIDO').AsString,FieldByName('VALIDO').AsString,_tReplace);
          Next;
       end;
     end;
     Result := Cadena;
end;
procedure LLenaAscii(CdAscii:TClientDataSet);
var     IBQuery1 :TIBQuery;
       _tConexion :TConexion;
begin
        _tConexion := TConexion.Create;
        _tConexion.Conectar;
        IBQuery1 := TIBQuery.Create(Application);
        CdAscii.CancelUpdates;
        with IBQuery1 do begin
          Database := _tConexion.Database;
          Transaction := _tConexion.Transaccion;
          Close;
          SQL.Clear;
          SQL.Add('select * from GEN$ASCII');
          Open;
          while not Eof do
          begin
            CdAscii.Append;
            CdAscii.FieldValues['VALIDO'] := FieldByName('CARVALIDO').AsString;
            CdAscii.FieldValues['NOVALIDO'] := FieldByName('CARNOVALIDO').AsString;
            CdAscii.Post;
            Next;
          end;
        end;


end;
end.
