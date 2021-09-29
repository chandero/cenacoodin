unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,SqlExpr, WideStrings, DB, DBXInterbase;

type
  TForm3 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses UnitEntregaCarne;
  //procedure LLamaFormulario(_sRuta,_sEmpleado:string); stdcall external 'EntregaSeguro\EntregaSeguro.dll';
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var    SQLConnection1 :TSQLConnection;
       _sRuta :string;
begin
  _sRuta := '192.168.200.254:/dbase3/pruebas/database.fdb';
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
  FrmEntregaCarne := TFrmEntregaCarne.Create(Self);
  FrmEntregaCarne.Database := SQLConnection1;
  //FrmEntregaCarne.Empleado := _sEmpleado;
  FrmEntregaCarne.ShowModal;

end;

end.
