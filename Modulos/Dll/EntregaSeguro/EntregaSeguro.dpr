library EntregaSeguro;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  SqlExpr,
  WideStrings,
  DB,
  DBXInterbase,
  Dialogs,
  UnitEntregaCarne in 'Units\UnitEntregaCarne.pas' {FrmEntregaCarne};

{$R *.res}
procedure LLamaFormulario(_sRuta,_sEmpleado:string); stdcall;
var FrmEntregaCarne :TFrmEntregaCarne;
    SQLConnection1 :TSQLConnection;
begin
  SQLConnection1 := TSQLConnection.Create(Nil);
  with SQLConnection1 do
  begin
      ConnectionName := 'IBConnection';
      DriverName := 'Interbase';
      GetDriverFunc := 'getSQLDriverINTERBASE';
      LibraryName := 'dbxint.dll';
      Params.add('DriverName=Interbase');
      Params.add('Database='+_sRuta);
      Params.add('RoleName=RoleName');
      Params.add('User_Name=SYSDBA');
      Params.add('Password=masterkey');
      Params.add('ServerCharSet=');
      Params.add('SQLDialect=3');
      Params.add('ErrorResourceFile=');
      Params.add('LocaleCode=0000');
      Params.add('BlobSize=-1');
      Params.add('CommitRetain=False');
      Params.add('WaitOnLocks=True');
      Params.add('Interbase TransIsolation=ReadCommited');
      Params.add('Trim Char=False');
      VendorLib := 'GDS32.DLL';
      LoginPrompt := false;
      Open;
  end;
  FrmEntregaCarne := TFrmEntregaCarne.Create(Nil);
  FrmEntregaCarne.Database := SQLConnection1;
  //FrmEntregaCarne.Empleado := _sEmpleado;
  FrmEntregaCarne.ShowModal;
  end;
  exports LLamaFormulario;

begin
end.
