program cargador;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,runtimetypeinfocontrols,
  unitConnectionFactory,
  unitCargarArticulo;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TConnectionFactory, ConnectionFactory);
  Application.CreateForm(TfrmCargaArticulo, frmCargaArticulo);
  Application.Run;
end.

