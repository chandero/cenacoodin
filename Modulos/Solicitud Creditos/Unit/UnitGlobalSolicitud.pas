unit UnitGlobalSolicitud;

interface

procedure nosirve;

implementation
uses unitdmsolicitud;
procedure nosirve;
begin
        with DmSolicitud.IBSolicitud1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"gen$infpersona".ID_VIVIENDA,');
          SQL.Add('"gen$infpersona".ID_ESTUDIO,');
          SQL.Add('"gen$infpersona".OCUPACION,');
          SQL.Add('"gen$infpersona".ANO_VIVIENDA');
          SQL.Add('FROM');
          SQL.Add('"gen$infpersona"');
          SQL.Add('WHERE');
          SQL.Add('("gen$infpersona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND');
          SQL.Add('("gen$infpersona".ID_PERSONA = :ID_PERSONA)');

        end;
end;

end.
