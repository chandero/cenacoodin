unit unitConnectionFactory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, FileUtil;

type

  { TConnectionFactory }

  TConnectionFactory = class(TDataModule)
    Connection: TIBConnection;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ConnectionFactory: TConnectionFactory;

implementation

{$R *.lfm}

end.

