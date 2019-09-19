unit UnitReportePersonasFogacoop;

interface

uses
  Windows, Messages, Math, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit, IBDatabase;

type
  TfrmReportePersonasFogacoop = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdFechaCorte1: TDateTimePicker;
    Panel2: TPanel;
    CmdProceso: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    SaveDialog1: TSaveDialog;
    IBSQL1: TIBSQL;
    Label2: TLabel;
    EdFechaCorte2: TDateTimePicker;
    Transaction: TIBTransaction;
    Database: TIBDatabase;
    Label3: TLabel;
    EdFechaCorte: TDateTimePicker;
    Label5: TLabel;
    LblEstado: TLabel;
    Button1: TButton;
    IBAgencia: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure EdFechaCorteExit(Sender: TObject);
  private
    procedure Personas;
    { Private declarations }
  public
    { Public declarations }
  end;

type PPersonas=^APersonas;
     APersonas=Record
      TipoId:string;
      Identificacion:string;
      PrimerApe:string;
      SegundoApe:string;
      Nombre:string;
      FechaVinculacion:string;
      Telefono:string;
      Direccion:string;
      Asociado:string;
      Activo:string;
      Ciiu:string;
      Municipio:string;
      Correo:string;
      //Agregados SigCoop 7.0
      Genero:string;
      Empleado:string;
      TipoContrato:string;
      Escolaridad:string;
      Estrato:string;
      NivelIng:string;
      FechaN:string;
      EstadoC:string;
      CabezaFam:string;
      Ocupacion:string;
      SectorEcon:string;
      JornadaL:string;
      FechaRet:string;



end;

var
  frmReportePersonasFogacoop: TfrmReportePersonasFogacoop;
  FechaCorte:tdate;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso;

procedure TfrmReportePersonasFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReportePersonasFogacoop.CmdProcesoClick(Sender: TObject);
var
NRuta:string;
begin
   CmdProceso.Enabled := False;
   Application.ProcessMessages;
   NRuta := DBPath1;

   IBAgencia.Close;
   IBAgencia.Open;
   IBAgencia.Last;
   IBAgencia.First;

   if TipoProceso = 1 then
    begin
      IBSQL1.Database := dmGeneral.IBDatabase1;
      IBSQL1.Transaction := dmGeneral.IBTransaction1;
      lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';
      Personas;
      IBAgencia.Close;
      LblEstado.Caption := 'Proceso Finalizado con Exito!!';
    end
   else
    begin
      while not IBAgencia.Eof do
       begin
         NRuta := dbpath1 + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + FormatCurr('00',MonthOf(FechaCorte)) + FormatCurr('0000',YearOf(FechaCorte)) + '/';
         lblEstado.Caption := 'Procesando Oficina ' + IBAgencia.FieldByName('DESCRIPCION_AGENCIA').AsString + '...';
         Database.DataBaseName := DBserver1 + ':' + NRuta + DBname;
         Database.Params.Values['lc_ctype'] := 'ISO8859_1';
         Database.Params.Values['User_Name'] := 'SYSDBA';
         Database.Params.Values['PassWord'] := 'masterkey';
         Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
         try
           Database.Connected := True;
         except
           raise;
         end;

         Personas;
         Database.Close;
         IBAgencia.Next;
       end;  // fin while Agencias
       LblEstado.Caption := 'Proceso Finalizado con Exito!!';
    end;  //Fin if TipoProceso
end;

procedure TfrmReportePersonasFogacoop.Personas;
var frmProgreso:TfrmProgreso;
    Total,Posicion:Integer;
    SaldoInicial:Currency;
    Movimiento:Currency;
    AR:PPersonas;
    Verdadero:Boolean;
    Tp:Integer;
    FechaA,FechaV:TDate;
    Cadena:string;
    Archivo:TextFile;
    SMinimo,FactorSM:Currency;
    fecha_vinculacion: TDateTime;
begin
      //Inicio Proceso Asociados
      Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
      AssignFile(Archivo,'C:/PlanosFinMes/ASOCIADOS' + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + Cadena + '.TXT');
      Rewrite(Archivo);
      Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'PRIMER APELLIDO' + #9 + 'SEGUNDO APELLIDO'+ #9 +
                'NOMBRES' + #9 + 'FECHA VINC' + #9 + 'TELEFONO' + #9 + 'DIRECCION' + #9 + 'ASOCIADO' + #9 +
                'ACTIVO' + #9 + 'CIIU' + #9 + 'MUNICIPIO' + #9 + 'CORREO' + #9 + 'GENERO' + #9 + 'EMPLEADO' + #9 +
                'TIPOCONTRATO' + #9 + 'NIVELESCOLAR' + #9 + 'ESTRATO' + #9 + 'NIVELINGRESOS' + #9 + 'FECHANAC' + #9 +
                'ESTADOCIVIL' + #9 + 'CABEZAFAM' + #9 + 'OCUPACION' + #9 + 'SECTORECO' + #9 + 'JORLABORAL' + #9 + 'FECHARETIRO' + #9 + 'ASAMBLEA';
      Writeln(Archivo,Cadena);
      CloseFile(Archivo);

      frmProgreso := TfrmProgreso.Create(Self);
      if IBSQL1.Transaction.InTransaction then
         IBSQL1.Transaction.Rollback;
      IBSQL1.Transaction.StartTransaction;

      with IBSQL1 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 0');
         ExecQuery;
         SMinimo := FieldByName('VALOR_MINIMO').AsCurrency;

         Close;
         SQL.Clear;
         SQL.Add('SELECT COUNT(*) AS TOTAL FROM (');
         SQL.Add('select p.ID_IDENTIFICACION, p.ID_PERSONA, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, p.NOMBRE, p.SEXO, p.ID_CIIU, p.FECHA_NACIMIENTO, p.ID_TIPO_ESTADO_CIVIL, p.EMAIL, m.FECHA_APERTURA, d.TELEFONO1, d.DIRECCION, d.COD_MUNICIPIO,');
         SQL.Add('(p.INGRESOS_A_PRINCIPAL+p.INGRESOS_OTROS) AS INGRESOS, a.CABEZAFAMILIA, a.ID_ESTRATO, a.ID_TIPOCONTRATO, a.ID_SECTOR, a.ID_OCUPACION, a.ID_ESTUDIO, p.ID_TIPO_RELACION');
         SQL.Add(' from "cap$maestro" m ');
         SQL.Add(' INNER JOIN "cap$maestrotitular" t ON (t.ID_AGENCIA = m.ID_AGENCIA AND ');
         SQL.Add(' t.ID_TIPO_CAPTACION = m.ID_TIPO_CAPTACION AND ');
         SQL.Add(' t.NUMERO_CUENTA = m.NUMERO_CUENTA AND ');
         SQL.Add(' t.DIGITO_CUENTA = m.DIGITO_CUENTA AND ');
         SQL.Add(' t.NUMERO_TITULAR = 1) ');
         SQL.Add(' INNER JOIN "gen$persona" p ON (p.ID_IDENTIFICACION=t.ID_IDENTIFICACION AND p.ID_PERSONA = t.ID_PERSONA) ');
         SQL.Add(' LEFT JOIN "gen$direccion" d ON (d.ID_IDENTIFICACION = p.ID_IDENTIFICACION and d.ID_PERSONA = p.ID_PERSONA and d.ID_DIRECCION = 1)');
         SQL.Add(' LEFT JOIN "gen$persadicional" a ON (a.ID_IDENTIFICACION = p.ID_IDENTIFICACION AND a.ID_PERSONA = p.ID_PERSONA)');
         SQL.Add(' WHERE');
         SQL.Add('    m.ID_TIPO_CAPTACION = 1 and m.ID_ESTADO IN (1,4,10) and m.FECHA_APERTURA <= :FECHA_CORTE');
         SQL.Add(' UNION');
         SQL.Add(' select p.ID_IDENTIFICACION, p.ID_PERSONA, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, p.NOMBRE, p.SEXO, p.ID_CIIU, p.FECHA_NACIMIENTO, p.ID_TIPO_ESTADO_CIVIL, p.EMAIL, p.FECHA_REGISTRO AS FECHA_APERTURA, d.TELEFONO1, d.DIRECCION, d.COD_MUNICIPIO,');
         SQL.Add(' (p.INGRESOS_A_PRINCIPAL+p.INGRESOS_OTROS) AS INGRESOS, a.CABEZAFAMILIA, a.ID_ESTRATO, a.ID_TIPOCONTRATO, a.ID_SECTOR, a.ID_OCUPACION, a.ID_ESTUDIO, p.ID_TIPO_RELACION');
         SQL.Add(' from "gen$persona" p');
         SQL.Add(' LEFT JOIN "gen$direccion" d ON (d.ID_IDENTIFICACION = p.ID_IDENTIFICACION and d.ID_PERSONA = p.ID_PERSONA and d.ID_DIRECCION = 1)');
         SQL.Add(' LEFT JOIN "gen$persadicional" a ON (a.ID_IDENTIFICACION = p.ID_IDENTIFICACION AND a.ID_PERSONA = p.ID_PERSONA)');
         SQL.Add(' WHERE');
         SQL.Add(' p.ID_TIPO_RELACION IN (4,5) and p.FECHA_REGISTRO <= :FECHA_CORTE');
         SQL.Add(')');
         ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
         try
          ExecQuery;
          Total := FieldByName('TOTAL').AsInteger;
          if Total < 1 then
            begin
              MessageDlg('No hay registros para trabajar',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
         frmProgreso.Max := Total;
         frmProgreso.InfoLabel := 'Buscando Personas a Trabajar';
         frmProgreso.Min := 0;
         frmProgreso.Position := 0;
         frmProgreso.Ejecutar;
         Posicion := 0;
         Application.ProcessMessages;
         Close;
         SQL.Clear;
         SQL.Add('select p.ID_IDENTIFICACION, p.ID_PERSONA, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, p.NOMBRE, p.SEXO, p.ID_CIIU, p.FECHA_NACIMIENTO, p.ID_TIPO_ESTADO_CIVIL, p.EMAIL, m.FECHA_APERTURA, d.TELEFONO1, d.DIRECCION, d.COD_MUNICIPIO,');
         SQL.Add('(p.INGRESOS_A_PRINCIPAL+p.INGRESOS_OTROS) AS INGRESOS, a.CABEZAFAMILIA, a.ID_ESTRATO, a.ID_TIPOCONTRATO, a.ID_SECTOR, a.ID_OCUPACION, a.ID_ESTUDIO, p.ID_TIPO_RELACION');
         SQL.Add(' from "cap$maestro" m ');
         SQL.Add(' INNER JOIN "cap$maestrotitular" t ON (t.ID_AGENCIA = m.ID_AGENCIA AND ');
         SQL.Add(' t.ID_TIPO_CAPTACION = m.ID_TIPO_CAPTACION AND ');
         SQL.Add(' t.NUMERO_CUENTA = m.NUMERO_CUENTA AND ');
         SQL.Add(' t.DIGITO_CUENTA = m.DIGITO_CUENTA AND ');
         SQL.Add(' t.NUMERO_TITULAR = 1) ');
         SQL.Add(' INNER JOIN "gen$persona" p ON (p.ID_IDENTIFICACION=t.ID_IDENTIFICACION AND p.ID_PERSONA = t.ID_PERSONA) ');
         SQL.Add(' LEFT JOIN "gen$direccion" d ON (d.ID_IDENTIFICACION = p.ID_IDENTIFICACION and d.ID_PERSONA = p.ID_PERSONA and d.ID_DIRECCION = 1)');
         SQL.Add(' LEFT JOIN "gen$persadicional" a ON (a.ID_IDENTIFICACION = p.ID_IDENTIFICACION AND a.ID_PERSONA = p.ID_PERSONA)');
         SQL.Add(' WHERE');
         SQL.Add('    m.ID_TIPO_CAPTACION = 1 and m.ID_ESTADO IN (1,4,10) and m.FECHA_APERTURA <= :FECHA_CORTE');
         SQL.Add(' UNION');
         SQL.Add(' select p.ID_IDENTIFICACION, p.ID_PERSONA, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, p.NOMBRE, p.SEXO, p.ID_CIIU, p.FECHA_NACIMIENTO, p.ID_TIPO_ESTADO_CIVIL, p.EMAIL, p.FECHA_REGISTRO AS FECHA_APERTURA, d.TELEFONO1, d.DIRECCION, d.COD_MUNICIPIO,');
         SQL.Add(' (p.INGRESOS_A_PRINCIPAL+p.INGRESOS_OTROS) AS INGRESOS, a.CABEZAFAMILIA, a.ID_ESTRATO, a.ID_TIPOCONTRATO, a.ID_SECTOR, a.ID_OCUPACION, a.ID_ESTUDIO, p.ID_TIPO_RELACION');
         SQL.Add(' from "gen$persona" p');
         SQL.Add(' LEFT JOIN "gen$direccion" d ON (d.ID_IDENTIFICACION = p.ID_IDENTIFICACION and d.ID_PERSONA = p.ID_PERSONA and d.ID_DIRECCION = 1)');
         SQL.Add(' LEFT JOIN "gen$persadicional" a ON (a.ID_IDENTIFICACION = p.ID_IDENTIFICACION AND a.ID_PERSONA = p.ID_PERSONA)');
         SQL.Add(' WHERE');
         SQL.Add(' p.ID_TIPO_RELACION IN (4,5) and p.FECHA_REGISTRO <= :FECHA_CORTE');
         ParamByName('FECHA_CORTE').AsDate := EdFechaCorte.Date;
         try
          ExecQuery;
         except
          frmProgreso.Cerrar;
          Transaction.Rollback;
          raise;
          Exit;
         end;

         while not Eof do
          begin
            frmProgreso.InfoLabel := 'Analizando ASOCIADO' + ' ' + FieldByName('ID_PERSONA').AsString;
            Posicion := Posicion + 1;
            frmProgreso.Position := Posicion;
            Application.ProcessMessages;

            New(AR);
            case FieldByName('ID_IDENTIFICACION').AsInteger of
              3: AR^.TipoId := 'C';
              4: AR^.TipoId := 'N';
              1: AR^.TipoId := 'R';
              2: AR^.TipoId := 'I'
              else AR^.TipoId := 'O';
            end;
            if AR^.TipoId = 'N' then
             begin
               AR^.Identificacion := MidStr(FieldByName('ID_PERSONA').AsString,1,3) + '-' +
                                     MidStr(FieldByName('ID_PERSONA').AsString,4,3) + '-' +
                                     MidStr(FieldByName('ID_PERSONA').AsString,7,3) + '-' +
                                     MidStr(FieldByName('ID_PERSONA').AsString,10,1);
               AR^.PrimerApe := '';
               AR^.SegundoApe := '';
               AR^.Nombre := Trim(FieldByName('NOMBRE').AsString);
             end
            else
             begin
              AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
              AR^.PrimerApe := Trim(FieldByName('PRIMER_APELLIDO').AsString);
              AR^.SegundoApe := Trim(FieldByName('SEGUNDO_APELLIDO').AsString);
              AR^.Nombre := Trim(FieldByName('NOMBRE').AsString);
              if (AR^.PrimerApe = '') and (AR^.Nombre <> '') then
                AR^.PrimerApe := AR^.Nombre;
             end;

            AR^.FechaVinculacion := FieldByName('FECHA_APERTURA').AsString;
            fecha_vinculacion := FieldByName('FECHA_APERTURA').AsDate;
            AR^.Telefono := FieldByName('TELEFONO1').AsString;
            AR^.Direccion := FieldByName('DIRECCION').AsString;
            AR^.Asociado := '1';
            AR^.Activo := '1';
            AR^.Ciiu := StringReplace(Format('%4s',[trim(FieldByName('ID_CIIU').AsString)]),' ','0',[rfReplaceAll]);
            if (Trim(FieldByName('COD_MUNICIPIO').AsString) = '') then
              AR^.Municipio := '54398'
            else
              AR^.Municipio := IntToStr(FieldByName('COD_MUNICIPIO').AsInteger);
            if (FieldByName('EMAIL').AsString = '') then
              AR^.Correo := 'n@a'
            else
              AR^.Correo := FieldByName('EMAIL').AsString;

            if FieldByName('SEXO').AsString = 'M' then
              AR^.Genero := '1'
            else if FieldByName('SEXO').AsString = 'F' then
              AR^.Genero := '2'
            else AR^.Genero := '';

            if AR^.TipoId = 'N' then
              AR^.Genero := '3';

            AR^.Empleado := '0';
{            if FieldByName('ID_TIPOCONTRATO').AsInteger = 1 THEN
              AR^.TipoContrato := '1'
            else if FieldByName('ID_TIPOCONTRATO').AsInteger = 2 THEN
              AR^.TipoContrato := '2'
            else
              AR^.TipoContrato := '4';}
            AR^.TipoContrato := '0';

            if FieldByName('ID_ESTUDIO').AsInteger <> Null then
              AR^.Escolaridad := IntToStr(FieldByName('ID_ESTUDIO').AsInteger)
            else
              AR^.Escolaridad := '0';

            if AR^.TipoId = 'N' then
              AR^.Escolaridad := '0';

            if AR^.TipoId = 'N' then
              AR^.Estrato := '0'
            else
             begin
               if FieldByName('ID_ESTRATO').AsInteger > 0 then
                 AR^.Estrato := IntToStr(FieldByName('ID_ESTRATO').AsInteger)
               else
                 AR^.Estrato := '1';
             end;

            FactorSM := int(FieldByName('INGRESOS').AsCurrency/SMinimo);

            if AR^.TipoId = 'N' then
             begin
               if (FactorSM <= 10) then
                 AR^.NivelIng := '1'
               else if ((FactorSM > 10) and (FactorSM <= 50)) then
                 AR^.NivelIng := '2'
               else if ((FactorSM > 50) and (FactorSM <= 150)) then
                 AR^.NivelIng := '3'
               else if ((FactorSM > 150) and (FactorSM <= 500)) then
                 AR^.NivelIng := '4'
               else if ((FactorSM > 500) and (FactorSM <= 1000)) then
                 AR^.NivelIng := '5'
               else if ((FactorSM > 1000) and (FactorSM <= 5000)) then
                 AR^.NivelIng := '6'
               else if ((FactorSM > 5000) and (FactorSM <= 10000)) then
                 AR^.NivelIng := '7'
               else if ((FactorSM > 10000) and (FactorSM <= 50000)) then
                 AR^.NivelIng := '8'
               else if ((FactorSM > 50000) and (FactorSM <= 100000)) then
                 AR^.NivelIng := '9'
               else if ((FactorSM > 100000) and (FactorSM <= 500000)) then
                 AR^.NivelIng := '10'
               else if (FactorSM > 500000) then
                 AR^.NivelIng := '11';
//               else if ((FactorSM > 500000) and (FactorSM <= 1000000)) then
//                 AR^.NivelIng := '11';
//               else
//                 AR^.NivelIng := '11';
             end
            else
             begin
               if (FactorSM <= 0) then
                 AR^.NivelIng := '1'
               else if ((FactorSM > 0) and (FactorSM <= 1)) then
                 AR^.NivelIng := '2'
               else if ((FactorSM > 1) and (FactorSM <= 2)) then
                 AR^.NivelIng := '3'
               else if ((FactorSM > 2) and (FactorSM <= 3)) then
                 AR^.NivelIng := '4'
               else if ((FactorSM > 3) and (FactorSM <= 4)) then
                 AR^.NivelIng := '5'
               else if ((FactorSM > 4) and (FactorSM <= 6)) then
                 AR^.NivelIng := '6'
               else if ((FactorSM > 6) and (FactorSM <= 8)) then
                 AR^.NivelIng := '7'
               else if ((FactorSM > 8) and (FactorSM <= 11)) then
                 AR^.NivelIng := '8'
               else if ((FactorSM > 11) and (FactorSM <= 17)) then
                 AR^.NivelIng := '9'
               else if ((FactorSM > 17) and (FactorSM <= 24)) then
                 AR^.NivelIng := '10'
               else if (FactorSM > 24) then
                 AR^.NivelIng := '11';
//               else if ((FactorSM > 24) and (FactorSM <= 48)) then
//                 AR^.NivelIng := '11';
//               else
//                 AR^.NivelIng := '11';
             end;

            if FieldByName('FECHA_NACIMIENTO').AsDate <> Null then
              AR^.FechaN := DateToStr(FieldByName('FECHA_NACIMIENTO').AsDate)
            else
              AR^.FechaN := '1984/01/01';

            if FieldByName('FECHA_NACIMIENTO').AsDate > fecha_vinculacion then
            begin
               AR^.FechaN := DateToStr(fecha_vinculacion);
            end;

            if AR^.TipoId = 'N' then
              AR^.EstadoC := '0'
            else
              AR^.EstadoC := IntToStr(FieldByName('ID_TIPO_ESTADO_CIVIL').AsInteger);
            AR^.CabezaFam := IntToStr(FieldByName('CABEZAFAMILIA').AsInteger);


            if AR^.TipoId = 'N' then
              AR^.Ocupacion := '0'
            else if FieldByName('ID_OCUPACION').AsInteger > 0 then
              AR^.Ocupacion := IntToStr(FieldByName('ID_OCUPACION').AsInteger)
            else
              AR^.Ocupacion := '2';

            AR^.SectorEcon := '99';
            AR^.JornadaL := '0';
            AR^.FechaRet := '';


            Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.PrimerApe +#9+ AR^.SegundoApe + #9 +
                      AR^.Nombre + #9 + AR^.FechaVinculacion + #9 + AR^.Telefono + #9 + AR^.Direccion + #9 +
                      AR^.Asociado + #9 + AR^.Activo + #9 + AR^.Ciiu + #9 + AR^.Municipio + #9 + AR^.Correo + #9 +
                      AR^.Genero + #9 + AR^.Empleado + #9 + AR^.TipoContrato + #9 + AR^.Escolaridad + #9 +
                      AR^.Estrato + #9+ AR^.NivelIng + #9 + AR^.FechaN + #9 + AR^.EstadoC + #9 + AR^.CabezaFam + #9 +
                      AR^.Ocupacion + #9 + AR^.SectorEcon + #9 + AR^.JornadaL + #9 + AR^.FechaRet;

            Dispose(AR);
            Append(Archivo);
            Writeln(Archivo,cadena);
            CloseFile(Archivo);
            Next;
          end; // while
        end; // with
      frmProgreso.Cerrar;
     //Fin Proceso Asociados

     //Inicio Proceso Ex-Asociados
      Cadena := IntToStr(YearOf(EdFechaCorte.Date)) + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + IntToStr(DayOf(EdFechaCorte.Date));
      AssignFile(Archivo,'C:/PlanosFinMes/EXASOCIADOS' + FormatCurr('00',IBAgencia.FieldByName('ID_AGENCIA').AsInteger) + Cadena + '.TXT');
      Rewrite(Archivo);
      Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'PRIMER APELLIDO' + #9 + 'SEGUNDO APELLIDO'+ #9 +
                'NOMBRES' + #9 + 'FECHA VINC' + #9 + 'TELEFONO' + #9 + 'DIRECCION' + #9 + 'ASOCIADO' + #9 +
                'ACTIVO' + #9 + 'CIIU' + #9 + 'MUNICIPIO' + #9 + 'CORREO' + #9 + 'GENERO' + #9 + 'EMPLEADO' + #9 +
                'TIPOCONTRATO' + #9 + 'NIVELESCOLAR' + #9 + 'ESTRATO' + #9 + 'NIVELINGRESOS' + #9 + 'FECHANAC' + #9 +
                'ESTADOCIVIL' + #9 + 'CABEZAFAM' + #9 + 'OCUPACION' + #9 + 'SECTORECO' + #9 + 'JORLABORAL' + #9 + 'FECHARETIRO' + #9 + 'NO';
      Writeln(Archivo,Cadena);
      CloseFile(Archivo);

      frmProgreso := TfrmProgreso.Create(Self);
      if IBSQL1.Transaction.InTransaction then
         IBSQL1.Transaction.Rollback;
      IBSQL1.Transaction.StartTransaction;
      frmProgreso.Min := 0;
      frmProgreso.Max := 1;
      frmProgreso.Position := 0;
      frmProgreso.Ejecutar;
      frmProgreso.Min := 0;
      with IBSQL1 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT VALOR_MINIMO from "gen$minimos" where ID_MINIMO = 0');
         ExecQuery;
         SMinimo := FieldByName('VALOR_MINIMO').AsCurrency;

         Close;
         SQL.Clear;
         SQL.Add('SELECT COUNT(*) AS TOTAL FROM ASOCIADO_JUDICIAL');
         try
          ExecQuery;
          Total := FieldByName('TOTAL').AsInteger;
          if Total < 1 then
            begin
              frmProgreso.Cerrar;
              MessageDlg('No hay registros para trabajar en Judicial',mtInformation,[mbok],0);
              Transaction.Rollback;
              Exit;
            end;
         except
          Transaction.Rollback;
          raise;
          Exit;
         end;
         frmProgreso.Max := Total;
         frmProgreso.InfoLabel := 'Buscando Personas a Trabajar';
         Posicion := 0;
         Application.ProcessMessages;
         Close;
         SQL.Clear;
         SQL.Add('SELECT * FROM ASOCIADO_JUDICIAL');
         try
          ExecQuery;
         except
          frmProgreso.Cerrar;
          Transaction.Rollback;
          raise;
          Exit;
         end;

         while not Eof do
          begin
            frmProgreso.InfoLabel := 'Analizando EX-ASOCIADO' + ' ' + FieldByName('ID_PERSONA').AsString;
            Posicion := Posicion + 1;
            frmProgreso.Position := Posicion;
            Application.ProcessMessages;

            New(AR);
            case FieldByName('ID_IDENTIFICACION').AsInteger of
              3: AR^.TipoId := 'C';
              4: AR^.TipoId := 'N';
              1: AR^.TipoId := 'R';
              2: AR^.TipoId := 'I'
              else AR^.TipoId := 'O';
            end;
            if AR^.TipoId = 'N' then
             begin
               AR^.Identificacion := MidStr(FieldByName('ID_PERSONA').AsString,1,3) + '-' +
                                     MidStr(FieldByName('ID_PERSONA').AsString,4,3) + '-' +
                                     MidStr(FieldByName('ID_PERSONA').AsString,7,3) + '-' +
                                     MidStr(FieldByName('ID_PERSONA').AsString,10,1);
               AR^.PrimerApe := '';
               AR^.SegundoApe := '';
               AR^.Nombre := Trim(FieldByName('NOMBRE').AsString);
             end
            else
             begin
              AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
              AR^.PrimerApe := Trim(FieldByName('PRIMER_APELLIDO').AsString);
              AR^.SegundoApe := Trim(FieldByName('SEGUNDO_APELLIDO').AsString);
              AR^.Nombre := Trim(FieldByName('NOMBRE').AsString);
              if (AR^.PrimerApe = '') and (AR^.Nombre <> '') then
                AR^.PrimerApe := AR^.Nombre;
             end;

            AR^.FechaVinculacion := FieldByName('FECHA_APERTURA').AsString;
            AR^.Telefono := FieldByName('TELEFONO1').AsString;
            AR^.Direccion := FieldByName('DIRECCION').AsString;
            AR^.Asociado := '0';
            AR^.Activo := '0';
            AR^.Ciiu := StringReplace(Format('%4s',[trim(FieldByName('ID_CIIU').AsString)]),' ','0',[rfReplaceAll]);
            if (FieldByName('COD_MUNICIPIO').AsString = '') then
              AR^.Municipio := '54398'
            else
              AR^.Municipio := IntToStr(FieldByName('COD_MUNICIPIO').AsInteger);
            if (FieldByName('EMAIL').AsString = '') then
              AR^.Correo := 'n@a'
            else
              AR^.Correo := FieldByName('EMAIL').AsString;

            if FieldByName('SEXO').AsString = 'M' then
              AR^.Genero := '1'
            else if FieldByName('SEXO').AsString = 'F' then
              AR^.Genero := '2'
            else AR^.Genero := '';

            if AR^.TipoId = 'N' then
              AR^.Genero := '3';

            AR^.Empleado := '0';
{            if FieldByName('ID_TIPOCONTRATO').AsInteger = 1 THEN
              AR^.TipoContrato := '1'
            else if FieldByName('ID_TIPOCONTRATO').AsInteger = 2 THEN
              AR^.TipoContrato := '2'
            else
              AR^.TipoContrato := '4';}
            AR^.TipoContrato := '0';

            if FieldByName('ID_ESTUDIO').AsInteger <> Null then
              AR^.Escolaridad := IntToStr(FieldByName('ID_ESTUDIO').AsInteger)
            else
              AR^.Escolaridad := '0';

            if AR^.TipoId = 'N' then
              AR^.Escolaridad := '0';

            if AR^.TipoId = 'N' then
              AR^.Estrato := '0'
            else
             begin
               if FieldByName('ID_ESTRATO').AsInteger > 0 then
                 AR^.Estrato := IntToStr(FieldByName('ID_ESTRATO').AsInteger)
               else
                 AR^.Estrato := '1';
             end;

            FactorSM := int(FieldByName('INGRESOS').AsCurrency/SMinimo);

            if AR^.TipoId = 'N' then
             begin
               if (FactorSM <= 10) then
                 AR^.NivelIng := '1'
               else if ((FactorSM > 10) and (FactorSM <= 50)) then
                 AR^.NivelIng := '2'
               else if ((FactorSM > 50) and (FactorSM <= 150)) then
                 AR^.NivelIng := '3'
               else if ((FactorSM > 150) and (FactorSM <= 500)) then
                 AR^.NivelIng := '4'
               else if ((FactorSM > 500) and (FactorSM <= 1000)) then
                 AR^.NivelIng := '5'
               else if ((FactorSM > 1000) and (FactorSM <= 5000)) then
                 AR^.NivelIng := '6'
               else if ((FactorSM > 5000) and (FactorSM <= 10000)) then
                 AR^.NivelIng := '7'
               else if ((FactorSM > 10000) and (FactorSM <= 50000)) then
                 AR^.NivelIng := '8'
               else if ((FactorSM > 50000) and (FactorSM <= 100000)) then
                 AR^.NivelIng := '9'
               else if ((FactorSM > 100000) and (FactorSM <= 500000)) then
                 AR^.NivelIng := '10'
               else if (FactorSM > 500000) then
                 AR^.NivelIng := '11';
//               else if ((FactorSM > 500000) and (FactorSM <= 1000000)) then
//                 AR^.NivelIng := '11';
//               else
//                 AR^.NivelIng := '11';
             end
            else
             begin
               if (FactorSM <= 0) then
                 AR^.NivelIng := '1'
               else if ((FactorSM > 0) and (FactorSM <= 1)) then
                 AR^.NivelIng := '2'
               else if ((FactorSM > 1) and (FactorSM <= 2)) then
                 AR^.NivelIng := '3'
               else if ((FactorSM > 2) and (FactorSM <= 3)) then
                 AR^.NivelIng := '4'
               else if ((FactorSM > 3) and (FactorSM <= 4)) then
                 AR^.NivelIng := '5'
               else if ((FactorSM > 4) and (FactorSM <= 6)) then
                 AR^.NivelIng := '6'
               else if ((FactorSM > 6) and (FactorSM <= 8)) then
                 AR^.NivelIng := '7'
               else if ((FactorSM > 8) and (FactorSM <= 11)) then
                 AR^.NivelIng := '8'
               else if ((FactorSM > 11) and (FactorSM <= 17)) then
                 AR^.NivelIng := '9'
               else if ((FactorSM > 17) and (FactorSM <= 24)) then
                 AR^.NivelIng := '10'
               else if (FactorSM > 24) then
                 AR^.NivelIng := '11';
//               else if ((FactorSM > 24) and (FactorSM <= 48)) then
//                 AR^.NivelIng := '11';
//               else
//                 AR^.NivelIng := '11';
             end;

            if FieldByName('FECHA_NACIMIENTO').AsDate <> Null then
              AR^.FechaN := DateToStr(FieldByName('FECHA_NACIMIENTO').AsDate)
            else
              AR^.FechaN := '1984/01/01';

            if AR^.TipoId = 'N' then
              AR^.EstadoC := '0'
            else
              AR^.EstadoC := IntToStr(FieldByName('ID_TIPO_ESTADO_CIVIL').AsInteger);
            AR^.CabezaFam := IntToStr(FieldByName('CABEZAFAMILIA').AsInteger);


            if AR^.TipoId = 'N' then
              AR^.Ocupacion := '0'
            else if FieldByName('ID_OCUPACION').AsInteger > 0 then
              AR^.Ocupacion := IntToStr(FieldByName('ID_OCUPACION').AsInteger)
            else
              AR^.Ocupacion := '2';

            AR^.SectorEcon := '99';
            AR^.JornadaL := '0';
            AR^.FechaRet := '';


            Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.PrimerApe +#9+ AR^.SegundoApe + #9 +
                      AR^.Nombre + #9 + AR^.FechaVinculacion + #9 + AR^.Telefono + #9 + AR^.Direccion + #9 +
                      AR^.Asociado + #9 + AR^.Activo + #9 + AR^.Ciiu + #9 + AR^.Municipio + #9 + AR^.Correo + #9 +
                      AR^.Genero + #9 + AR^.Empleado + #9 + AR^.TipoContrato + #9 + AR^.Escolaridad + #9 +
                      AR^.Estrato + #9+ AR^.NivelIng + #9 + AR^.FechaN + #9 + AR^.EstadoC + #9 + AR^.CabezaFam + #9 +
                      AR^.Ocupacion + #9 + AR^.SectorEcon + #9 + AR^.JornadaL + #9 + AR^.FechaRet;

            Dispose(AR);
            Append(Archivo);
            Writeln(Archivo,cadena);
            CloseFile(Archivo);
            Next;
          end; // while
        end; // with
     frmProgreso.Cerrar;
     //Fin Proceso Ex-Asociados
     Database.Close;

   LblEstado.Caption := 'Proceso Culminado con Exito!';
end;

procedure TfrmReportePersonasFogacoop.BitBtn1Click(Sender: TObject);
var Archivo:string;

begin
//        SaveDialog1.DefaultExt := 'TXT';
//        SaveDialog1.InitialDir := 'C:\Planos';
//        SaveDialog1.Title := 'Guardar Como:';
//        SaveDialog1.Execute;
//        Archivo := SaveDialog1.FileName;
//        AssignFile(F,Archivo);
end;

procedure TfrmReportePersonasFogacoop.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
        EdFechaCorte1.Date := Date;
        EdFechaCorte2.Date := Date;         
end;

procedure TfrmReportePersonasFogacoop.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmReportePersonasFogacoop.Button1Click(Sender: TObject);
var frmProgreso:TfrmProgreso;
    Total,Posicion:Integer;
    SaldoInicial:Currency;
    Movimiento:Currency;
    AR:PPersonas;
    Verdadero:Boolean;
    Tp:Integer;
    FechaA,FechaV:TDate;
    Cadena:string;
    Archivo:TextFile;
    SMinimo,FactorSM:Currency;
begin
//Abrego
   DBpath1 := dbpath + '02' + FormatCurr('00',MonthOf(EdFechaCorte.Date)) + FormatCurr('0000',YearOf(EdFechaCorte.Date)) + '/';
   lblEstado.Caption := 'Procesando Abrego ...';
   Database.DataBaseName := DBserver + ':' + DBpath1 + DBname;
   Database.Params.Values['lc_ctype'] := 'ISO8859_1';
   Database.Params.Values['User_Name'] := 'SYSDBA';
   Database.Params.Values['PassWord'] := 'masterkey';
   Database.Params.Values['sql_role_name'] := 'ADMINISTRADOR';
   try
     Database.Connected := True;
   except
     raise;
   end;

    Cadena := IntToStr(YearOf(EdFechaCorte2.Date)) + FormatCurr('00',MonthOf(EdFechaCorte2.Date)) + IntToStr(DayOf(EdFechaCorte2.Date));
    AssignFile(Archivo,'C:/PERSONAS0222.TXT');
//    AssignFile(Archivo,'C:/PlanosFinMes/Captaciones' + Cadena);
    Rewrite(Archivo);
    Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'PRIMER APELLIDO' + #9 + 'SEGUNDO APELLIDO'+ #9 +
              'NOMBRES' + #9 + 'FECHA VINC' + #9 + 'TELEFONO' + #9 + 'DIRECCION' + #9 + 'ASOCIADO' + #9 +
              'ACTIVO' + #9 + 'CIIU' + #9 + 'MUNICIPIO' + #9 + 'CORREO' + #9 + 'GENERO' + #9 + 'EMPLEADO' + #9 +
              'TIPOCONTRATO' + #9 + 'NIVELESCOLAR' + #9 + 'ESTRATO' + #9 + 'NIVELINGRESOS' + #9 + 'FECHANAC' + #9 +
              'ESTADOCIVIL' + #9 + 'CABEZAFAM' + #9 + 'OCUPACION' + #9 + 'SECTORECO' + #9 + 'JORLABORAL' + #9 + 'FECHARETIRO';
    Writeln(Archivo,Cadena);
    CloseFile(Archivo);

    frmProgreso := TfrmProgreso.Create(Self);
    if IBSQL1.Transaction.InTransaction then
       IBSQL1.Transaction.Rollback;
    IBSQL1.Transaction.StartTransaction;
    frmProgreso.Min := 0;
    frmProgreso.Max := 1;
    frmProgreso.Position := 0;
    frmProgreso.Ejecutar;
    frmProgreso.Min := 0;
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('select count(*) as TOTAL from "gen$persona"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON (("gen$persona".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION) AND');
          SQL.Add('("gen$persona".ID_PERSONA="cap$maestrotitular".ID_PERSONA) AND');
          SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1))');
          SQL.Add('INNER JOIN "cap$maestro" ON (("cap$maestrotitular".ID_AGENCIA="cap$maestro".ID_AGENCIA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION="cap$maestro".ID_TIPO_CAPTACION) AND');
          SQL.Add('("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA) AND');
          SQL.Add('("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 1) AND');
          SQL.Add('("cap$maestro".ID_ESTADO IN (1,4,6,10,12,13)))');
          SQL.Add('left join "gen$direccion" on (("gen$direccion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "gen$direccion".ID_PERSONA = "gen$persona".ID_PERSONA) and');
          SQL.Add('("gen$direccion".ID_DIRECCION = 1))');
//          SQL.Add('WHERE "gen$persona".FECHA_ACTUALIZACION BETWEEN :FECHA1 and :FECHA2');
          SQL.Add('WHERE "cap$maestro".NUMERO_CUENTA IN (5711,6027) ');
//          SQL.Add('WHERE "cap$maestro".FECHA_APERTURA BETWEEN :FECHA1 and :FECHA2');
//          ParamByName('FECHA1').AsDate := EdFechaCorte1.Date;
//          ParamByName('FECHA2').AsDate := EdFechaCorte2.Date;
          try
           ExecQuery;
           Total := FieldByName('TOTAL').AsInteger;
           if Total < 1 then
             begin
               MessageDlg('No hay registros para trabajar',mtInformation,[mbok],0);
               Transaction.Rollback;
               Exit;
             end;
          except
           Transaction.Rollback;
           raise;
           Exit;
          end;
          frmProgreso.Max := Total;
          frmProgreso.InfoLabel := 'Buscando Personas a Trabajar';
          Posicion := 0;
          Application.ProcessMessages;
          Close;
          SQL.Clear;
          SQL.Add('select "gen$persona".ID_IDENTIFICACION,"gen$persona".ID_PERSONA,PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,SEXO,ID_CIIU,FECHA_NACIMIENTO,ID_TIPO_ESTADO_CIVIL,"cap$maestro".FECHA_APERTURA,"gen$direccion".TELEFONO1,"gen$direccion".DIRECCION,');
          SQL.Add('(INGRESOS_A_PRINCIPAL+INGRESOS_OTROS) AS INGRESOS,"gen$persadicional".CABEZAFAMILIA,"gen$persadicional".ID_ESTRATO,"gen$persadicional".ID_TIPOCONTRATO,"gen$persadicional".ID_SECTOR,"gen$persadicional".ID_OCUPACION,ID_ESTUDIO');
          SQL.Add('from "gen$persona"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON (("gen$persona".ID_IDENTIFICACION="cap$maestrotitular".ID_IDENTIFICACION) AND');
          SQL.Add('("gen$persona".ID_PERSONA="cap$maestrotitular".ID_PERSONA) AND');
          SQL.Add('("cap$maestrotitular".NUMERO_TITULAR = 1))');
          SQL.Add('INNER JOIN "cap$maestro" ON (("cap$maestrotitular".ID_AGENCIA="cap$maestro".ID_AGENCIA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION="cap$maestro".ID_TIPO_CAPTACION) AND');
          SQL.Add('("cap$maestrotitular".NUMERO_CUENTA="cap$maestro".NUMERO_CUENTA) AND');
          SQL.Add('("cap$maestrotitular".DIGITO_CUENTA="cap$maestro".DIGITO_CUENTA) AND');
          SQL.Add('("cap$maestrotitular".ID_TIPO_CAPTACION = 1) AND');
          SQL.Add('("cap$maestro".ID_ESTADO IN (1,4,6,10,12,13)))');
          SQL.Add('left join "gen$direccion" on (("gen$direccion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "gen$direccion".ID_PERSONA = "gen$persona".ID_PERSONA) and');
          SQL.Add('("gen$direccion".ID_DIRECCION = 1))');
          SQL.Add('left join "gen$persadicional" on ("gen$persona".ID_IDENTIFICACION = "gen$persadicional".ID_IDENTIFICACION AND');
          SQL.Add('"gen$persona".ID_PERSONA = "gen$persadicional".ID_PERSONA)');
//          SQL.Add('WHERE "gen$persona".FECHA_ACTUALIZACION BETWEEN :FECHA1 and :FECHA2');
          SQL.Add('WHERE "cap$maestro".NUMERO_CUENTA IN (5711,6027)');
//          ParamByName('FECHA1').AsDate := EdFechaCorte1.Date;
//          ParamByName('FECHA2').AsDate := EdFechaCorte2.Date;
          try
           ExecQuery;
          except
           frmProgreso.Cerrar;
           Transaction.Rollback;
           raise;
           Exit;
          end;

          while not Eof do begin
            frmProgreso.InfoLabel := 'Analizando PERSONA' + ' ' + FieldByName('ID_PERSONA').AsString;
            Posicion := Posicion + 1;
            frmProgreso.Position := Posicion;
            Application.ProcessMessages;

            New(AR);
            case FieldByName('ID_IDENTIFICACION').AsInteger of
              3: AR^.TipoId := 'C';
              4: AR^.TipoId := 'N';
              1: AR^.TipoId := 'R';
              2: AR^.TipoId := 'I'
              else AR^.TipoId := 'O';
            end;
            if AR^.TipoId = 'N' then
             begin
               AR^.Identificacion := MidStr(FieldByName('ID_PERSONA').AsString,1,3) + '-' +
                                     MidStr(FieldByName('ID_PERSONA').AsString,4,3) + '-' +
                                     MidStr(FieldByName('ID_PERSONA').AsString,7,3) + '-' +
                                     MidStr(FieldByName('ID_PERSONA').AsString,10,1);
               AR^.PrimerApe := '';
               AR^.SegundoApe := '';
               AR^.Nombre := Trim(FieldByName('NOMBRE').AsString);
             end
            else
             begin
              AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
              AR^.PrimerApe := Trim(FieldByName('PRIMER_APELLIDO').AsString);
              AR^.SegundoApe := Trim(FieldByName('SEGUNDO_APELLIDO').AsString);
              AR^.Nombre := Trim(FieldByName('NOMBRE').AsString);
              if (AR^.PrimerApe = '') and (AR^.Nombre <> '') then
                AR^.PrimerApe := AR^.Nombre;
             end;

            AR^.FechaVinculacion := FieldByName('FECHA_APERTURA').AsString;
            AR^.Telefono := FieldByName('TELEFONO1').AsString;
            AR^.Direccion := FieldByName('DIRECCION').AsString;
            AR^.Asociado := '1';
            AR^.Activo := '1';
            AR^.Ciiu := StringReplace(Format('%4s',[trim(FieldByName('ID_CIIU').AsString)]),' ','0',[rfReplaceAll]);
{            if Agencia = 1 then AR^.Municipio := '54498'
            else if Agencia = 2 then AR^.Municipio := '54003'
            else if Agencia = 3 then AR^.Municipio := '54206'
            else if Agencia = 4 then AR^.Municipio := '20011';}
            AR^.Municipio := '54003';
            AR^.Correo := 'n@a';

            if FieldByName('SEXO').AsString = 'M' then
              AR^.Genero := '1'
            else if FieldByName('SEXO').AsString = 'F' then
              AR^.Genero := '2'
            else AR^.Genero := '';

            if AR^.TipoId = 'N' then
              AR^.Genero := '3';

            AR^.Empleado := '0';
{            if FieldByName('ID_TIPOCONTRATO').AsInteger = 1 THEN
              AR^.TipoContrato := '1'
            else if FieldByName('ID_TIPOCONTRATO').AsInteger = 2 THEN
              AR^.TipoContrato := '2'
            else
              AR^.TipoContrato := '4';}
            AR^.TipoContrato := '0';

            if FieldByName('ID_ESTUDIO').AsInteger <> Null then
              AR^.Escolaridad := IntToStr(FieldByName('ID_ESTUDIO').AsInteger)
            else
              AR^.Escolaridad := '0';

            if AR^.TipoId = 'N' then
              AR^.Escolaridad := '0';

            if AR^.TipoId = 'N' then
              AR^.Estrato := '0'
            else
             begin
               if FieldByName('ID_ESTRATO').AsInteger > 0 then
                 AR^.Estrato := IntToStr(FieldByName('ID_ESTRATO').AsInteger)
               else
                 AR^.Estrato := '1';
             end;
            try
              FactorSM := int(FieldByName('INGRESOS').AsCurrency/SMinimo);
            except
              FactorSM := 0;
            end;

            if AR^.TipoId = 'N' then
             begin
               if (FactorSM <= 10) then
                 AR^.NivelIng := '1'
               else if ((FactorSM > 10) and (FactorSM <= 50)) then
                 AR^.NivelIng := '2'
               else if ((FactorSM > 50) and (FactorSM <= 150)) then
                 AR^.NivelIng := '3'
               else if ((FactorSM > 150) and (FactorSM <= 500)) then
                 AR^.NivelIng := '4'
               else if ((FactorSM > 500) and (FactorSM <= 1000)) then
                 AR^.NivelIng := '5'
               else if ((FactorSM > 1000) and (FactorSM <= 5000)) then
                 AR^.NivelIng := '6'
               else if ((FactorSM > 5000) and (FactorSM <= 10000)) then
                 AR^.NivelIng := '7'
               else if ((FactorSM > 10000) and (FactorSM <= 50000)) then
                 AR^.NivelIng := '8'
               else if ((FactorSM > 50000) and (FactorSM <= 100000)) then
                 AR^.NivelIng := '9'
               else if ((FactorSM > 100000) and (FactorSM <= 500000)) then
                 AR^.NivelIng := '10'
               else if (FactorSM > 500000) then
                 AR^.NivelIng := '11';
//               else if ((FactorSM > 500000) and (FactorSM <= 1000000)) then
//                 AR^.NivelIng := '11';
//               else
//                 AR^.NivelIng := '11';
             end
            else
             begin
               if (FactorSM <= 0) then
                 AR^.NivelIng := '1'
               else if ((FactorSM > 0) and (FactorSM <= 1)) then
                 AR^.NivelIng := '2'
               else if ((FactorSM > 1) and (FactorSM <= 2)) then
                 AR^.NivelIng := '3'
               else if ((FactorSM > 2) and (FactorSM <= 3)) then
                 AR^.NivelIng := '4'
               else if ((FactorSM > 3) and (FactorSM <= 4)) then
                 AR^.NivelIng := '5'
               else if ((FactorSM > 4) and (FactorSM <= 6)) then
                 AR^.NivelIng := '6'
               else if ((FactorSM > 6) and (FactorSM <= 8)) then
                 AR^.NivelIng := '7'
               else if ((FactorSM > 8) and (FactorSM <= 11)) then
                 AR^.NivelIng := '8'
               else if ((FactorSM > 11) and (FactorSM <= 17)) then
                 AR^.NivelIng := '9'
               else if ((FactorSM > 17) and (FactorSM <= 24)) then
                 AR^.NivelIng := '10'
               else if (FactorSM > 24) then
                 AR^.NivelIng := '11';
//               else if ((FactorSM > 24) and (FactorSM <= 48)) then
//                 AR^.NivelIng := '11';
//               else
//                 AR^.NivelIng := '11';
             end;

            if FieldByName('FECHA_NACIMIENTO').AsDate <> Null then
              AR^.FechaN := DateToStr(FieldByName('FECHA_NACIMIENTO').AsDate)
            else
              AR^.FechaN := '1984/01/01';

            if AR^.TipoId = 'N' then
              AR^.EstadoC := '0'
            else
              AR^.EstadoC := IntToStr(FieldByName('ID_TIPO_ESTADO_CIVIL').AsInteger);
            AR^.CabezaFam := IntToStr(FieldByName('CABEZAFAMILIA').AsInteger);


            if AR^.TipoId = 'N' then
              AR^.Ocupacion := '0'
            else if FieldByName('ID_OCUPACION').AsInteger > 0 then
              AR^.Ocupacion := IntToStr(FieldByName('ID_OCUPACION').AsInteger)
            else
              AR^.Ocupacion := '2';
              
            AR^.SectorEcon := '99';
            AR^.JornadaL := '0';
            AR^.FechaRet := '';

            Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.PrimerApe +#9+ AR^.SegundoApe + #9 +
                      AR^.Nombre + #9 + AR^.FechaVinculacion + #9 + AR^.Telefono + #9 + AR^.Direccion + #9 +
                      AR^.Asociado + #9 + AR^.Activo + #9 + AR^.Ciiu + #9 + AR^.Municipio + #9 + AR^.Correo + #9 +
                      AR^.Genero + #9 + AR^.Empleado + #9 + AR^.TipoContrato + #9 + AR^.Escolaridad + #9 +
                      AR^.Estrato + #9+ AR^.NivelIng + #9 + AR^.FechaN + #9 + AR^.EstadoC + #9 + AR^.CabezaFam + #9 +
                      AR^.Ocupacion + #9 + AR^.SectorEcon + #9 + AR^.JornadaL + #9 + AR^.FechaRet;


            Dispose(AR);
            Append(Archivo);
            Writeln(Archivo,cadena);
            CloseFile(Archivo);
            Next;
          end; // while
        end; // with
     frmProgreso.Cerrar;
     Database.Close;
// Fin Abrego

end;

procedure TfrmReportePersonasFogacoop.EdFechaCorteExit(Sender: TObject);
begin
        FechaCorte := EdFechaCorte.Date; 
end;

end.
