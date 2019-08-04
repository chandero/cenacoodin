unit UnitInfAsociados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, IBSQL, DB,
  IBCustomDataSet, IBQuery, DAteUtils, DBClient;

type
  TFrmInfAsociados = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Fecha: TDateTimePicker;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    IBQPersona: TIBQuery;
    IBSQL3: TIBSQL;
    IBSQL1: TIBSQL;
    IBSQL4: TIBSQL;
    IBSQL2: TIBSQL;
    cD: TClientDataSet;
    cDNOMBRE: TStringField;
    cDIDENTIFICACION: TStringField;
    cDCUENTA: TStringField;
    cDJUVENIL: TStringField;
    cDRINDEDIARIO: TStringField;
    cDCOLOCACION: TStringField;
    cDFIANZA: TStringField;
    cDAPORTES: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    xEducacion:Boolean;
  xAportesAct:Boolean;
  xAportesAnt:Boolean;
  xRindediario:Boolean;
  xJuvenil:Boolean;
  xDeudas:Boolean;
  xFianzas:Boolean;
  xApertura:Boolean;
  xAperturaJ:Boolean;
  xAPortesJ,xRindediarioJ,xJuvenilJ:Boolean;
  xEdad:Boolean;

  Ag:Integer;
  Tp:Integer;
  Nm:Integer;
  Dg:Integer;

  AgJ:Integer;
  TpJ:Integer;
  NmJ:Integer;
  DgJ:Integer;
    SaldoApoAnt:Currency;
  SaldoApoAct:Currency;
  SaldoValido:Currency;
  SaldoMinimo:Currency;
  SaldoRindediario:Currency;
  vJuvenil:Currency;
  vJuvenilYa:Boolean;

  SaldoMinimoApo:Currency;
  SaldoMinimoRin:Currency;
  SaldoMinimoJuv:Currency;


  DetalleEntregado:Boolean;
  DetalleEntregadoJ:Boolean;  
  IdAyuda:Integer;
  StrAyuda:string;
  EsJuvenil:Boolean;
  Empleado:string;

  NoActiva:Boolean;
  Limpiomens:Boolean;

  Ano:string;
  Fecha1:TDate;
  Fecha2:TDate;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfAsociados: TFrmInfAsociados;

implementation
uses UnitGlobales,UnitGlobalesCol, UnitPantallaProgreso, UnitdmColocacion,ComObj;

{$R *.dfm}

procedure TFrmInfAsociados.BitBtn1Click(Sender: TObject);
var     vIdPersona :string;
        vIdIdentificacion :Integer;
        vCalcula :Boolean;
        vContador :Integer;
        vTotal :Integer;
        Excel, WorkBook, WorkSheet: Variant;
        j,i,vFin:Integer;
const  xlWBATWorksheet = -4167;        
begin
         Excel := CreateOleObject('Excel.Application');
         Excel.DisplayAlerts := false;
         Workbook := Excel.Workbooks.Add(xlWBATWorksheet);
         WorkSheet := WorkBook.WorkSheets[1];
         WorkSheet.Name := 'nombre de la hoja';
        Ano := IntToStr(YearOf(Date));
        vContador := 0;
        vTotal := 0;
        with IBQPersona do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('"gen$persona".NOMBRE,');
          SQL.Add('"gen$persona".PRIMER_APELLIDO,');
          SQL.Add('"gen$persona".SEGUNDO_APELLIDO,');
          SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION,');
          SQL.Add('"cap$maestrotitular".ID_PERSONA,');
          SQL.Add('"cap$maestro".ID_TIPO_CAPTACION,');
          SQL.Add('"cap$maestro".NUMERO_CUENTA,');
          SQL.Add('"cap$maestro".DIGITO_CUENTA,"cap$maestro".ID_AGENCIA');
          SQL.Add('FROM');
          SQL.Add('"cap$maestro"');
          SQL.Add('INNER JOIN "cap$maestrotitular" ON ("cap$maestro".ID_TIPO_CAPTACION="cap$maestrotitular".ID_TIPO_CAPTACION)');
          SQL.Add('AND ("cap$maestro".NUMERO_CUENTA="cap$maestrotitular".NUMERO_CUENTA)');
          SQL.Add('AND ("cap$maestro".DIGITO_CUENTA="cap$maestrotitular".DIGITO_CUENTA)');
          SQL.Add('AND ("cap$maestro".ID_AGENCIA="cap$maestrotitular".ID_AGENCIA)');
          SQL.Add('INNER JOIN "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION="gen$persona".ID_IDENTIFICACION)');
          SQL.Add('AND ("cap$maestrotitular".ID_PERSONA="gen$persona".ID_PERSONA)');
          SQL.Add('WHERE');
          SQL.Add('("cap$maestro".ID_ESTADO = 1) AND ');
          SQL.Add('("cap$maestro".ID_TIPO_CAPTACION = 1) AND ');
          SQL.Add('("cap$maestro".FECHA_APERTURA <= :FECHA)');
          ParamByName('FECHA').AsDate := Fecha.DateTime;
          Open;
          Last;
          First;
          frmProgreso := TfrmProgreso.Create(self);
          frmProgreso.Ejecutar;
          frmProgreso.Titulo := 'Validando Información';
          frmProgreso.InfoLabel := 'Espere un Momento por Favor ...';
          frmProgreso.Min := 0;
          frmProgreso.Max := RecordCount;
          frmProgreso.Ejecutar;
          vFin := RecordCount + 1;
          WorkSheet.Cells[1,1] := 'NOMBRES Y APELLIDOS';
          WorkSheet.Cells[1,2] := 'IDENTIFICACION';
          WorkSheet.Cells[1,3] := 'CUENTA';
          WorkSheet.Cells[1,4] := 'CREDITOS';
          WorkSheet.Cells[1,5] := 'FIANZAS';
          WorkSheet.Cells[1,6] := 'APORTES';
          WorkSheet.Cells[1,7] := 'RIDEDIARIO';
          WorkSheet.Cells[1,8] := 'JUVENIL';
          WorkSheet.Cells[1,9] := 'INHABIL';
          while not Eof do
          begin
            frmProgreso.Position := RecNo;
            Application.ProcessMessages;
            Limpiomens   := False;
            xAportesAct  := False;
            xAportesAnt  := False;
            xJuvenil     := False;
            xApertura    := False;
            xDeudas      := False;
            xFianzas     := False;
            xRindediario := False;
            vCalcula := False;
            vIdPersona := FieldByName('ID_PERSONA').AsString;
            vIdIdentificacion := FieldByName('ID_IDENTIFICACION').AsInteger;
            Ag := FieldByName('ID_AGENCIA').AsInteger;
            Tp := FieldByName('ID_TIPO_CAPTACION').AsInteger;
            Nm := FieldByName('NUMERO_CUENTA').AsInteger;
            Dg := FieldByName('DIGITO_CUENTA').AsInteger;
            // saldo cuenta de aportes
            IBSQL1.Close;
            IBSQL1.SQL.Clear;
            IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
            IBSQL1.ParamByName('AG').AsInteger := Ag;
            IBSQL1.ParamByName('TP').AsInteger := Tp;
            IBSQL1.ParamByName('NM').AsInteger := Nm;
            IBSQL1.ParamByName('DG').AsInteger := Dg;
            IBSQL1.ParamByName('ANO').AsString := Ano;
            IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;
            IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;
            try
              IBSQL1.ExecQuery;
              if IBSQL1.RecordCount > 0 then begin
                SaldoApoAct := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                if SaldoApoAct >= SaldoMinimoApo then
                  xAportesAct := True
                else
                  xAportesAct := False;
              end
              else
              begin
                SaldoApoAct := 0;
                xAportesAct := False;
                end;
              except
                Transaction.Rollback;
                raise;
              end;
              // fin saldo aportes
              // saldo ahorro rindediario
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSQL1.ParamByName('AG').AsInteger := Ag;
              IBSQL1.ParamByName('TP').AsInteger := 2;
              IBSQL1.ParamByName('NM').AsInteger := Nm;
              IBSQL1.ParamByName('DG').AsInteger := StrToInt(DigitoControl(2,Format('%.7d',[Nm])));
              IBSQL1.ParamByName('ANO').AsString := Ano;
              IBSQL1.ParamByName('FECHA1').AsDate := Fecha1;
              IBSQL1.ParamByName('FECHA2').AsDate := Fecha2;
              try
                IBSQL1.ExecQuery;
                if IBSQL1.RecordCount > 0 then begin
                  SaldoRindediario := IBSQL1.FieldByName('SALDO_ACTUAL').AsCurrency;
                  if SaldoRindediario >= SaldoMinimoRin then
                    xRindediario := True
                  else
                    xRindediario := False;
                end
                else
                begin
                  SaldoRindediario := 0;
                  xRindediario := False;
                end;
              except
                Transaction.Rollback;
                raise;
              end;
              // colocaciones
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colocacion" where ');
              IBSQL1.SQL.Add('ID_IDENTIFICACION = :ID_IDENTIFICACION and ID_PERSONA = :ID_PERSONA');
              IBSQL1.SQL.Add('and ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := vIdIdentificacion;
              IBSQL1.ParamByName('ID_PERSONA').AsString := vIdPersona;
              try
               IBSQL1.ExecQuery;
               xDeudas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xDeudas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                Transaction.Rollback;
                raise;
              end;
              // fianzas
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select "col$colocacion".ID_AGENCIA, "col$colocacion".ID_COLOCACION, "col$colocacion".ID_ESTADO_COLOCACION from "col$colgarantias"');
              IBSQL1.SQL.Add('inner join "col$colocacion" ON ("col$colgarantias".ID_AGENCIA = "col$colocacion".ID_AGENCIA and');
              IBSQL1.SQL.Add('"col$colgarantias".ID_COLOCACION = "col$colocacion".ID_COLOCACION)');
              IBSQL1.SQL.Add('where "col$colgarantias".ID_IDENTIFICACION = :ID_IDENTIFICACION and "col$colgarantias".ID_PERSONA = :ID_PERSONA and "col$colocacion".ID_ESTADO_COLOCACION < 3');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := vIdIdentificacion;
              IBSQL1.ParamByName('ID_PERSONA').AsString := vIdPersona;
              try
               IBSQL1.ExecQuery;
               xFianzas := True;
               if IBSQL1.RecordCount > 0 then begin
                 while not IBSQL1.Eof do begin
                   if ObtenerDeudaHoy1(IBSQL1.FieldByName('ID_AGENCIA').AsInteger,IBSQL1.FieldByName('ID_COLOCACION').AsString,IBSQL2).Dias > 0 then
                     xFianzas := False;
                   IBSQL1.Next;
                 end;
               end;
               except
                Transaction.Rollback;
                raise;
              end;
              //juvenil
              IBSQL1.Close;
              IBSQL1.SQL.Clear;
              IBSQL1.SQL.Add('select * from "cap$maestrotitular"');
              IBSQL1.SQL.Add('inner join "cap$maestro" ON ("cap$maestro".ID_AGENCIA = "cap$maestrotitular".ID_AGENCIA and "cap$maestro".ID_TIPO_CAPTACION = "cap$maestrotitular".ID_TIPO_CAPTACION and');
              IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA = "cap$maestrotitular".NUMERO_CUENTA and "cap$maestro".DIGITO_CUENTA = "cap$maestrotitular".DIGITO_CUENTA)');
              IBSQL1.SQL.Add('inner join "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
              IBSQL1.SQL.Add('where');
              IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and "cap$maestrotitular".ID_PERSONA = :ID_PERSONA and "cap$maestrotitular".ID_TIPO_CAPTACION = 4 and "cap$tiposestado".SE_SUMA <> 0');
              IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := vIdIdentificacion;
              IBSQL1.ParamByName('ID_PERSONA').AsString := vIdPersona;
              try
               IBSQL1.ExecQuery;
               xJuvenil := True;
               if IBSQL1.RecordCount > 0 then
                while not IBSQL1.Eof do begin
                    IBSQL2.Close;
                    IBSQL2.SQL.Clear;
                    IBSQL2.SQL.Add('select SALDO_ACTUAL from SALDO_ACTUAL(:AG,:TP,:NM,:DG,:ANO,:FECHA1,:FECHA2)');
                    IBSQL2.ParamByName('AG').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                    IBSQL2.ParamByName('TP').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                    IBSQL2.ParamByName('NM').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('DG').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                    IBSQL2.ParamByName('ANO').AsString := Ano;//IntToStr(YearOf(fFechaActual));
                    IBSQL2.ParamByName('FECHA1').AsDate := Fecha1;//EncodeDate(YearOf(fFechaActual),01,01);
                    IBSQL2.ParamByName('FECHA2').AsDate := Fecha2;//EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));
                    try
                      IBSQL2.ExecQuery;
                      if IBSQL2.RecordCount > 0 then
                      while not IBSQL2.Eof do begin
                         if IBSQL2.FieldByName('SALDO_ACTUAL').AsCurrency < SaldoMinimoJuv then
                           xJuvenil := False;
                         IBSQL2.Next;
                      end;

                    except
                      Transaction.Rollback;
                      raise;
                    end;
                 IBSQL1.Next;
                end;
                except
                Transaction.Rollback;
                raise;
              end;
{
              with cD do
              begin
                Append;
                FieldValues['NOMBRE'] := IBQPersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                          IBQPersona.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                          IBQPersona.FieldByName('NOMBRE').AsString;
                FieldValues['CUENTA'] := Nm;
                FieldValues['IDENTIFICACION'] := vIdPersona;
                if xDeudas then
                  FieldValues['COLOCACION'] := ''
                else
                begin
                  vCalcula := True;
                  FieldValues['COLOCACION'] := 'X';
                end;
                if xFianzas then
                   FieldValues['FIANZA'] := ''
                else
                begin
                  vCalcula := True;
                   FieldValues['FIANZA'] := 'X';
                end;
                if xAportesAct then
                   FieldValues['APORTES'] := ''
                else
                begin
                  vCalcula := True;
                  FieldValues['APORTES'] := 'X';
                end;
                if xRindediario then
                   FieldValues['RINDEDIARIO'] := ''
                else
                begin
                  vCalcula := True;
                  FieldValues['RINDEDIARIO'] := 'X';
                end;
                if xJuvenil then
                   FieldValues['JUVENIL'] := ''
                else
                begin
                  vCalcula := True;
                   FieldValues['JUVENIL'] := 'X';
                  end;
                Post;
              end;
}
              //for J := 0 to 7 do
              //begin
//              WorkSheet.Cells[1, J + 1] := j;
              WorkSheet.Cells[recno + 1,1] := IBQPersona.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                                          IBQPersona.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                                          IBQPersona.FieldByName('NOMBRE').AsString;
                WorkSheet.Cells[recno + 1,2] := vIdPersona;
                WorkSheet.Cells[recno + 1,3] := Nm;
                if xDeudas then
                  WorkSheet.Cells[recno + 1,4] := ''
                else
                begin
                  vCalcula := True;
                  WorkSheet.Cells[recno + 1,4] := 'X';
                end;
                if xFianzas then
                   WorkSheet.Cells[recno + 1,5] := ''
                else
                begin
                  vCalcula := True;
                   WorkSheet.Cells[recno + 1,5] := 'X';
                end;
                if xAportesAct then
                   WorkSheet.Cells[recno + 1,6] := ''
                else
                begin
                  vCalcula := True;
                  WorkSheet.Cells[recno + 1,6] := 'X';
                end;
                if xRindediario then
                   WorkSheet.Cells[recno + 1,7] := ''
                else
                begin
                  vCalcula := True;
                  WorkSheet.Cells[recno + 1,7] := 'X';
                end;
                if xJuvenil then
                   WorkSheet.Cells[recno + 1,8] := ''
                else
                begin
                  vCalcula := True;
                   WorkSheet.Cells[recno + 1,8] := 'X';
                  end;
                if vCalcula then
                   WorkSheet.Cells[recno + 1,9] := 'X'
                else
                   WorkSheet.Cells[recno + 1,9] := '';
              //end;
              if vCalcula then
                 vContador := vContador + 1
              else
                 vTotal := vTotal + 1;
            Next;
          end;
          frmProgreso.Cerrar;
          ShowMessage('Habiles : ' + IntToStr(vTotal) + ' Otros : ' + inttostr(vContador));          
          WorkSheet.Cells[vfin,1] := 'TOTAL HABILES';
          WorkSheet.Cells[vfin,2] := IntToStr(vTotal);
          WorkSheet.Cells[vfin,3] := '';
          WorkSheet.Cells[vfin,4] := 'TOTAL INHABLILES';
          WorkSheet.Cells[vfin,5] := IntToStr(vContador);
          WorkSheet.Cells[vfin,6] := '';
          WorkSheet.Cells[vfin,7] := 'TOTAL';
          WorkSheet.Cells[vfin,8] := IntToStr(vTotal + vContador);

          WorkBook.SaveAs('c:\Asociados.xls');

  Excel.Quit;
        end;
end;

procedure TFrmInfAsociados.FormCreate(Sender: TObject);
begin

        DmColocacion := TDmColocacion.Create(Self);        Fecha1 := EncodeDate(YearOf(fFechaActual),01,01);
        Fecha2 := EncodeDate(YearOf(fFechaActual),MonthOf(fFechaActual),DayOf(fFechaActual));

          with IBSQL4 do begin
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add(' SALDO_MINIMO');
          SQL.Add('FROM');
          SQL.Add(' "cap$tipocaptacion"');
          SQL.Add('WHERE');
          SQL.Add(' ID_TIPO_CAPTACION = :ID');
// Aportaciones sociales
          ParamByName('ID').AsInteger := 1;
          try
           ExecQuery;
           SaldoMinimoApo := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;

// Ahorro Rindediario
          Close;
          ParamByName('ID').AsInteger := 2;
          try
           ExecQuery;
           SaldoMinimoRin := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;
// Ahorro Juvenil
          Close;
          ParamByName('ID').AsInteger := 4;
          try
           ExecQuery;
           SaldoMinimoJuv := FieldByName('SALDO_MINIMO').AsCurrency;
          except
           Transaction.Rollback;
           raise;
          end;
          Close;
        end;

end;

end.
