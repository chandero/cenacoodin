unit unitConnectionFactory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, IBConnection, FileUtil, Forms,
  IniFiles, Dialogs;

type

  { TConnectionFactory }

  TConnectionFactory = class(TDataModule)
    IBConnection1: TIBConnection;
    SQLTransactionMain: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ConnectionFactory: TConnectionFactory;
  IniFile: TIniFile;

implementation

{$R *.lfm}

{ TConnectionFactory }

procedure TConnectionFactory.DataModuleCreate(Sender: TObject);
var
  _dbName : String;
  _dbPath : String;
  _dbHost : String;
  _dbUser : String;
  _dbPass : String;
begin
   IniFile := TINIFile.Create('settings.txt');

   try

     _dbName := IniFile.ReadString('DBDATA','dbname','notfound.fdb');
     _dbPath := IniFile.ReadString('DBDATA','dbpath','C:\');
     _dbHost := IniFile.ReadString('DBDATA','dbhost','localhost');
     _dbUser := 'SYSDBA';
     _dbPass := 'masterkey';
   finally
      IBConnection1.Dialect:=3;
      IBConnection1.CharSet:='ISO8859_1';
      IBConnection1.DatabaseName:= _dbPath+_dbName;
      IBConnection1.HostName:=_dbHost;
      IBConnection1.UserName:=_dbUser;
      IBConnection1.Password:=_dbPass;
   end;

   // test database connection

   try
          IBConnection1.Open;
          if not IBConnection1.Connected then
          begin
               ShowMessage('No se pudo conectar a la base de datos');
          end
          else
          begin
               IBConnection1.Close();
          end;
   finally
   end;






end;

end.

