program dtserver;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  IdDayTimeServer,
  IdTimeServer;

var
  DayTimeSvr:TIdDayTimeServer;
  TimeSvr:TIdTimeServer;

begin
  { TODO -oUser -cConsole Main : Insert code here }
   DayTimeSvr := TIdDayTimeServer.Create(nil);
   DayTimeSvr.TimeZone := 'EST';
   DayTimeSvr.Active := True;

   TimeSvr := TIdTimeServer.Create(nil);
   TimeSvr.Active := True;

   Writeln('Servidor de Fecha y Hora ... Activo...');

   while true
   do
   begin
   
   end;

end.
 