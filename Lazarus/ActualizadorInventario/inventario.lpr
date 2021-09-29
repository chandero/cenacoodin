program inventario;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, runtimetypeinfocontrols, memdslaz, unitMain, unitConnectionFactory,
  unitLoadFile, unitCargarArticulo, unitModificarArticulo, laz_fpspreadsheet,
  unitConsultarArticulo
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TConnectionFactory, ConnectionFactory);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

