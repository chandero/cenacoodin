unit UnitReportePersonasFogacoop;

interface

uses
  Windows, Messages, Math, DateUtils, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, JvEdit, JvTypedEdit;

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
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdProcesoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
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
      Tipo:string;
      Tipo1:string;
      Tipo2:string;
      Municipio:string;
      Correo:string;
end;

var
  frmReportePersonasFogacoop: TfrmReportePersonasFogacoop;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales,UnitGlobalesCol,UnitPantallaProgreso;

procedure TfrmReportePersonasFogacoop.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmReportePersonasFogacoop.CmdProcesoClick(Sender: TObject);
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
begin
    Cadena := IntToStr(YearOf(EdFechaCorte2.Date)) + FormatCurr('00',MonthOf(EdFechaCorte2.Date)) + IntToStr(DayOf(EdFechaCorte2.Date));
    AssignFile(Archivo,'//Archivos/publico/PlanosFinMes/PERSONAS' + Cadena);
    Rewrite(Archivo);
    Cadena := 'TIPO ID' + #9 + 'NIT/CC' + #9 + 'PRIMER APELLIDO' + #9 + 'SEGUNDO APELLIDO'+ #9 +
              'NOMBRES' + #9 + 'FECHA VINC' + #9 + 'TELEFONO' + #9 + 'DIRECCION' + #9 + 'TIPO' + #9 +
              'TIPO1' + #9 + 'TIPO2' + #9 + 'MUNICIPIO' + #9 + 'CORREO';
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
          SQL.Add('select count(*) as TOTAL from "gen$persona" where FECHA_REGISTRO between :FECHA1 and :FECHA2');
          ParamByName('FECHA1').AsDate := EdFechaCorte1.Date;
          ParamByName('FECHA2').AsDate := EdFechaCorte2.Date;
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
          SQL.Add('select "gen$persona".ID_IDENTIFICACION,"gen$persona".ID_PERSONA,PRIMER_APELLIDO,SEGUNDO_APELLIDO,NOMBRE,FECHA_REGISTRO,"gen$direccion".TELEFONO1,"gen$direccion".DIRECCION from "gen$persona"');
          SQL.Add('left join "gen$direccion" on ("gen$direccion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and "gen$direccion".ID_PERSONA = "gen$persona".ID_PERSONA)');
          SQL.Add('where FECHA_REGISTRO between :FECHA1 and :FECHA2 and "gen$direccion".ID_DIRECCION = 1');
          ParamByName('FECHA1').AsDate := EdFechaCorte1.Date;
          ParamByName('FECHA2').AsDate := EdFechaCorte2.Date;
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
            if FieldByName('ID_IDENTIFICACION').AsInteger = 3 then
              AR^.TipoId := 'C'
            else AR^.TipoId := 'O';
            AR^.Identificacion := FieldByName('ID_PERSONA').AsString;
            AR^.PrimerApe := FieldByName('PRIMER_APELLIDO').AsString;
            AR^.SegundoApe := FieldByName('SEGUNDO_APELLIDO').AsString;
            AR^.Nombre := FieldByName('NOMBRE').AsString;
            if (AR^.PrimerApe = '') and (AR^.Nombre <> '') then
              AR^.PrimerApe := AR^.Nombre;
            AR^.FechaVinculacion := FieldByName('FECHA_REGISTRO').AsString;
            AR^.Telefono := FieldByName('TELEFONO1').AsString;
            AR^.Direccion := FieldByName('DIRECCION').AsString;
            AR^.Tipo := '1';
            AR^.Tipo1 := '1';
            AR^.Tipo2 := '0000';
            if Agencia = 1 then AR^.Municipio := '54498'
            else if Agencia = 2 then AR^.Municipio := '54003'
            else if Agencia = 3 then AR^.Municipio := '54206';
            AR^.Correo := 'n@a';

            Cadena := AR^.TipoId + #9 + AR^.Identificacion + #9 + AR^.PrimerApe +#9+ AR^.SegundoApe + #9 +
                      AR^.Nombre + #9 + AR^.FechaVinculacion + #9 + AR^.Telefono + #9 + AR^.Direccion + #9 +
                      AR^.Tipo + #9 + AR^.Tipo1 + #9 + AR^.Tipo2 + #9 + AR^.Municipio + #9 + AR^.Correo;
                      
            Dispose(AR);
            Append(Archivo);
            Writeln(Archivo,cadena);
            CloseFile(Archivo);
            Next;
          end; // while
        end; // with
     frmProgreso.Cerrar;

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
        EdFechaCorte1.Date := fFechaActual;
        EdFechaCorte2.Date := fFechaActual;
end;

procedure TfrmReportePersonasFogacoop.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

end.
