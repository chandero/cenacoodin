unit UnitCdatPeriodo;

interface

uses
  DateUtils, StrUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQL, DB, DBClient, IBCustomDataSet, IBQuery, Grids, StdCtrls,
  Buttons, ExtCtrls, JvTypedEdit, JvEdit, JvSpecialProgress, XLSfile,JclDateTime,
  DBGrids;

type
  TfrmCdatPeriodo = class(TForm)
    Bar2: TJvSpecialProgress;
    Bar1: TJvSpecialProgress;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdMonto: TJvCurrencyEdit;
    EdPeriodo: TJvYearEdit;
    Panel1: TPanel;
    btnProcesar: TBitBtn;
    btnCerrar: TBitBtn;
    btnAExcel: TBitBtn;
    IBQuery1: TIBQuery;
    Cds1: TClientDataSet;
    sd1: TSaveDialog;
    IBSQL2: TIBSQL;
    IBSQL1: TIBQuery;
    Bar3: TJvSpecialProgress;
    IBQuery2: TIBQuery;
    Cds1Cuenta: TStringField;
    Cds1Interes: TCurrencyField;
    Cds1Saldo: TCurrencyField;
    Cds1Causados: TCurrencyField;
    Cds1Inicial: TCurrencyField;
    Cds1Inversion: TCurrencyField;
    Cds1fechaa: TStringField;
    Cds1fechav: TStringField;
    Cds1estado: TStringField;
    Cds1idpersona: TStringField;
    Cds1ididentificacion: TIntegerField;
    CDDATOS: TClientDataSet;
    CDDATOSIDPERSONA: TStringField;
    CDDATOSIDIDENTIFICACION: TIntegerField;
    CDDATOSINICIAL: TCurrencyField;
    CDDATOSINVERSION: TCurrencyField;
    CDDATOSINTERES: TCurrencyField;
    CDDATOSSALDO: TCurrencyField;
    CDDATOSFECHAA: TDateField;
    CDDATOSFECHAV: TDateField;
    CDDATOSESTADO: TStringField;
    CDDATOSNUMERO: TStringField;
    Label3: TLabel;
    cmbMes: TComboBox;
    CDDATOSCAUSADO: TCurrencyField;
    DBGridDatos: TDBGrid;
    DSdatos: TDataSource;
    CDDATOSTTITULO: TIntegerField;
    CDDATOSTMOVIMIENTO: TIntegerField;
    Cds1ttitulo: TIntegerField;
    Cds1tmovimiento: TIntegerField;
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCdatPeriodo: TfrmCdatPeriodo;

implementation

{$R *.dfm}

uses UnitDmGeneral,UnitGlobales;

procedure TfrmCdatPeriodo.btnProcesarClick(Sender: TObject);
var
  Id:string;
  Dg:string;
  Tp:string;
  Nm:string;
  Dr:string;
  Mn:string;
  FechaCorte, FechaInicial :TDateTime;
  Total, Mes:Integer;
  Fila:Integer;
  Saldo,Credito,Interes, Causados:Currency;
  Saldo1,Credito1,Interes1, Causados1:Currency;
  Cuenta:string;
  valor_inicial, CausadoAnt, Inversion1 :Currency;
  Dpto :string;
  vFechaVencimiento: TDate;
  vFechaSaldado :string;
  vContador :Integer;
  vEstado :string;
  vCodMunicipio :string;
  _sNombre :string;
  _dFechaApertura :TDate;
  _dFechaVencimiento :TDate;
begin
//ShowMessage('Inicial:' + DateToStr(_dFechaInicial) + ' Final:' + DateToStr(_dFechaCorteAhorros));
        btnProcesar.Enabled := False;

        Mes := cmbMes.ItemIndex + 1;
        TryEncodeDate(EdPeriodo.Value, Mes, 1, FechaInicial);

        TryEncodeDate(EdPeriodo.Value, Mes, DaysInAMonth(EdPeriodo.Value, Mes), FechaCorte);



        with IBQuery1 do
        begin
         if Transaction.InTransaction then
            Transaction.Commit;
         Transaction.StartTransaction;
         IBSQL1.SQL.Clear;
         IBSQL2.SQL.Add('DELETE FROM "dian$cdat" WHERE PERIODO = :PERIODO');
         IBSQL2.ParamByName('PERIODO').AsInteger := Mes;
         IBSQL2.ExecQuery;
         Close;
         SQL.Clear;
         SQL.Add('select distinct');
         SQL.Add('count(*) as TOTAL');
         SQL.Add('from');
         SQL.Add('"cap$maestrotitular" mt');
         SQL.Add('inner join "cap$maestro" m ON m.ID_AGENCIA = mt.ID_AGENCIA and m.ID_TIPO_CAPTACION = mt.ID_TIPO_CAPTACION and m.NUMERO_CUENTA = mt.NUMERO_CUENTA and m.DIGITO_CUENTA = mt.DIGITO_CUENTA');
         SQL.Add('where mt.ID_TIPO_CAPTACION IN (5,6)');
         SQL.Add('and m.FECHA_APERTURA <= :FECHA_CORTE');
         ParamByName('FECHA_CORTE').AsDate := FechaCorte;
         try
           Open;
           Total := FieldByName('TOTAL').AsInteger;
         except
           Transaction.Rollback;
           raise;
         end;
         Close;

         Bar3.Maximum := Total;

         SQL.Clear;
         SQL.Add('select distinct');
         SQL.Add('mt.ID_IDENTIFICACION,');
         SQL.Add('mt.ID_PERSONA');
         SQL.Add('from');
         SQL.Add('"cap$maestrotitular" mt');
         SQL.Add('inner join "cap$maestro" m ON m.ID_AGENCIA = mt.ID_AGENCIA and m.ID_TIPO_CAPTACION = mt.ID_TIPO_CAPTACION and m.NUMERO_CUENTA = mt.NUMERO_CUENTA and m.DIGITO_CUENTA = mt.DIGITO_CUENTA');
         SQL.Add('where mt.ID_TIPO_CAPTACION IN (5,6)');
         SQL.Add('and m.FECHA_APERTURA <= :FECHA_CORTE');
         ParamByName('FECHA_CORTE').AsDate := FechaCorte;
         try
           Open;
         except
           Transaction.Rollback;
           raise;
         end;

         while not Eof do begin
           Bar3.Position := RecNo;
           Application.ProcessMessages;
           //vCodMunicipio := FieldByName('COD_MUNICIPIO').AsString;
           //if (vCodMunicipio = '') Then vCodMunicipio := '00000';
           IBSQL1.Close;
           IBSQL1.SQL.Clear; //seleccionar numero de cuenta de los cdats
           IBSQL1.SQL.Add('select');
           IBSQL1.SQL.Add('"cap$maestro".ID_AGENCIA,');
           IBSQL1.SQL.Add('"cap$maestro".ID_TIPO_CAPTACION,');
           IBSQL1.SQL.Add('"cap$maestro".NUMERO_CUENTA,');
           IBSQL1.SQL.Add('"cap$maestro".ID_ESTADO,');
           IBSQL1.SQL.Add('"cap$maestro".DIGITO_CUENTA,');
           IBSQL1.SQL.Add('"cap$maestro".VALOR_INICIAL,FECHA_VENCIMIENTO, FECHA_PRORROGA, FECHA_VENCIMIENTO_PRORROGA,');
           IBSQL1.SQL.Add('"cap$maestro".FECHA_APERTURA,"cap$maestro".FECHA_ULTIMO_PAGO,"cap$maestro".FECHA_SALDADA');
           IBSQL1.SQL.Add('from');
           IBSQL1.SQL.Add('"cap$maestrotitular"');
           IBSQL1.SQL.Add('inner join');
           IBSQL1.SQL.Add('"cap$maestro" on ("cap$maestrotitular".ID_AGENCIA = "cap$maestro".ID_AGENCIA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION = "cap$maestro".ID_TIPO_CAPTACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = "cap$maestro".NUMERO_CUENTA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".DIGITO_CUENTA = "cap$maestro".DIGITO_CUENTA)');
           IBSQL1.SQL.Add('where');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_IDENTIFICACION = :ID_IDENTIFICACION and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_PERSONA = :ID_PERSONA and');
           IBSQL1.SQL.Add('"cap$maestrotitular".ID_TIPO_CAPTACION IN (5,6) and');
           IBSQL1.SQL.Add('"cap$maestro".ID_ESTADO NOT IN (7,11) and');
           IBSQL1.SQL.Add('"cap$maestro".FECHA_APERTURA <= :FECHA_CORTE');
           IBSQL1.SQL.Add('ORDER BY "cap$maestro".ID_TIPO_CAPTACION, "cap$maestro".NUMERO_CUENTA ASC');
           IBSQL1.ParamByName('ID_IDENTIFICACION').AsInteger := FieldByName('ID_IDENTIFICACION').AsInteger;
           IBSQL1.ParamByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
           IBSQL1.ParamByName('FECHA_CORTE').AsDate := FechaCorte;
           try
            IBSQL1.Open;
            IBSQL1.Last;
            IBSQL1.First;
           except
            Transaction.Rollback;
            raise;
           end;
           Bar1.Maximum := IBSQL1.RecordCount;
           Bar1.Position := 0;
           Interes := 0;
           Cds1.Open;
           Cds1.EmptyDataSet;
           Cds1.Close;
           valor_inicial := 0;
           vcontador := 0;
           while not IBSQL1.Eof do
           begin

             Saldo1   := 0;
             Credito1 := 0;
             Interes1 := 0;
             Causados1 := 0;
             Inversion1 := 0;
             CausadoAnt := 0;
             Saldo   := 0;
             if (IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime = 0) then
             begin
               if ( IBSQL1.FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime = 0) then
               begin
                vFechaSaldado := '';
                _dFechaVencimiento := IBSQL1.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                vFechaVencimiento:= IBSQL1.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
               end
               else
               begin
                vFechaSaldado := '';
                _dFechaVencimiento := IBSQL1.FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime;
                vFechaVencimiento := IBSQL1.FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime;
               end;
             end
             else
             begin
                _dFechaVencimiento := IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime;
                vFechaVencimiento := IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime;
                vFechaSaldado := DateToStr(IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime);
             end;



             Bar1.Position := IBSQL1.RecNo;
             Application.ProcessMessages;
             if (_dFechaVencimiento = 0) or (_dFechaVencimiento > FechaCorte) then
             begin
                 if ( IBSQL1.FieldByName('FECHA_VENCIMIENTO').AsDateTime < FechaCorte) then
                 begin
                     vEstado := 'PRORROGADO';
                 end
                 else
                 begin
                     vEstado := 'ACTIVO';
                 end;
             end
             else
             if (_dFechaVencimiento <= FechaCorte) then
             begin
                 vEstado := 'SALDADO';
             end
             else
             begin
              case IBSQL1.FieldByName('ID_ESTADO').AsInteger of
                1:  vEstado := 'ACTIVO';
                2:  vEstado := 'SALDADO';
                3:  vEstado := 'INACTIVO';
                4:  vEstado := 'EMBARGADO';
                6:  vEstado := 'PRORROGADO';
                9:  vEstado := 'CANCELADO';
                11: vEstado := 'ANULADO';
                12: vEstado := 'FALLECIDO';
                15: vEstado := 'TRASLADADA';
              end;
             end;
             _dFechaApertura := IBSQL1.FieldByName('FECHA_APERTURA').AsDateTime;             
             if IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger = 6 then
             begin
               // verificar saldo inicial y saldo final a 31 dic
               Saldo1 := IBSQL1.FieldByName('VALOR_INICIAL').AsCurrency;
               if IBSQL1.FieldByName('FECHA_APERTURA').AsDateTime >= _dFechaInicial then
                   valor_inicial := valor_inicial + IBSQL1.FieldByName('VALOR_INICIAL').AsCurrency;
               if (vEstado = 'ACTIVO') or (vEstado = 'PRORROGADO') then
                   Saldo := IBSQL1.FieldByName('VALOR_INICIAL').AsCurrency;

               IBQuery2.Close;
               IBQuery2.SQL.Clear;
               IBQuery2.SQL.Add('select SUM(VALOR_DEBITO) AS VALOR from "cap$extracto"');
               IBQuery2.SQL.Add('where');
               IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
               IBQuery2.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
               IBQuery2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
               IBQuery2.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA and');
               IBQuery2.SQL.Add('(FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2) and');
               IBQuery2.SQL.Add('VALOR_DEBITO <> 0 and ID_TIPO_MOVIMIENTO = 15');
               IBQuery2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
               IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
               IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
               IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
               IBQuery2.ParamByName('FECHA1').AsDate := FechaInicial;
               IBQuery2.ParamByName('FECHA2').AsDate := FechaCorte;
               try
                 IBQuery2.Open;
                 if IBQuery2.RecordCount > 0 then
                   Interes1 := IBQuery2.FieldByName('VALOR').AsCurrency;
               except
                 IBQuery2.Transaction.Rollback;
                 raise;
               end;
{              Bar2.Maximum := IBQuery2.RecordCount;
               while not IBQuery2.Eof do
               begin
                 Bar2.Position := IBQuery2.RecNo;
                 Application.ProcessMessages;
                 Interes1 := Interes1 + IBQuery2.FieldByName('VALOR_DEBITO').AsCurrency;
                 IBQuery2.Next;
               end; // fin del while
}
               // Causacion Año Anterior
               IBQuery2.Close;
               IBQuery2.SQL.Clear;
               IBQuery2.SQL.Add('select CAUSACION_MENSUAL from "cap$causacioncdat"');
               IBQuery2.SQL.Add('where');
               IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
               IBQuery2.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
               IBQuery2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
               IBQuery2.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA and');
               IBQuery2.SQL.Add('ANO = :ANO and MES =:MES');
               IBQuery2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.fieldbyname('ID_AGENCIA').AsInteger;
               IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := 6;
               IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
               IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
               IBQuery2.ParamByName('ANO').AsInteger := EdPeriodo.Value - 1;
               IBQuery2.ParamByName('MES').AsInteger := 12;
               try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                begin
                  CausadoAnt := IBQuery2.FieldByName('CAUSACION_MENSUAL').AsCurrency;
                end;
               except
                 IBQuery2.Transaction.Rollback;
                 raise;
               end;
               // Intereses Causados Año Reporte
               IBQuery2.Close;
               IBQuery2.SQL.Clear;
               IBQuery2.SQL.Add('select CAUSACION_MENSUAL from "cap$causacioncdat"');
               IBQuery2.SQL.Add('where');
               IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
               IBQuery2.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
               IBQuery2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
               IBQuery2.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA and');
               IBQuery2.SQL.Add('ANO = :ANO and MES =:MES');
               IBQuery2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.fieldbyname('ID_AGENCIA').AsInteger;
               IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
               IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
               IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
               IBQuery2.ParamByName('ANO').AsInteger := EdPeriodo.Value;
               IBQuery2.ParamByName('MES').AsInteger := MonthOf(FechaCorte);
               try
                IBQuery2.Open;
                if IBQuery2.RecordCount > 0 then
                begin
                  Causados1 := IBQuery2.FieldByName('CAUSACION_MENSUAL').AsCurrency;
                end;
               except
                 IBQuery2.Transaction.Rollback;
                 raise;
               end;
               //SALDO DEL CDAT
               //validar fecha de ultimo pago
               //ShowMessage('Fecha Ultimo ' + DateToStr(IBSQL1.FieldByName('FECHA_ULTIMO_PAGO').AsDateTime) + ' Fecha Periodo ' + DateToStr( EncodeDate(EdPeriodo.Value,01,01)) + ' Numero : ' + Format('%.7d',[IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger]));

               if (IBSQL1.FieldByName('FECHA_ULTIMO_PAGO').AsDateTime >= EncodeDate(1899,12,30)) { EncodeDate(EdPeriodo.Value,01,01)) } or (IBSQL1.FieldByName('FECHA_ULTIMO_PAGO').AsDateTime = EncodeDate(1899,12,30)) then
               begin
                 if (_dFechaApertura > _dFechaInicial)  or (vEstado <> 'SALDADO')  or (_dFechaVencimiento >= _dFechaInicial) then
                 begin
                   //ShowMessage('paso');
                   vContador := vContador + 1;
                   Cds1.Open;
                   Cds1.Append;
                   Cds1.FieldByName('Cuenta').AsString := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsString+
                                                        Format('%.2d',[IBSQL1.FieldByName('ID_AGENCIA').AsInteger])+
                                                        Format('%.7d',[IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger])+
                                                        IBSQL1.FieldByName('DIGITO_CUENTA').AsString;

                   if IBSQL1.FieldByName('FECHA_APERTURA').AsDateTime < FechaInicial then
                   begin
                      Saldo1 := Saldo1;//+CausadoAnt;
                      Inversion1 := 0;
                   end
                   else
                   begin
                      Inversion1 := Saldo1;
                      Saldo1 := 0;
                   end;
                   Cds1.FieldByName('Inicial').AsCurrency := Saldo1;
                   Cds1.FieldByName('Inversion').AsCurrency := Inversion1;
                   Cds1.FieldByName('Interes').AsCurrency := Interes1;
                   if (vEstado = 'ACTIVO') or (vEstado = 'PRORROGADO')  then
                     Cds1.FieldByName('Saldo').AsCurrency := Inversion1 + Saldo1
                   else
                     Cds1.FieldByName('Saldo').AsCurrency := 0;
                   Cds1.FieldByName('Causados').AsCurrency := Causados1;
                   Cds1.FieldByName('fechaa').AsString := DateToStr(IBSQL1.FieldByName('FECHA_APERTURA').AsDateTime);
                   Cds1.FieldByName('fechav').AsString := DateToStr(vFechaVencimiento);
                   Cds1.FieldByName('estado').AsString := vEstado;
                   Cds1.FieldByName('ttitulo').AsInteger := 3;
                   if (_dFechaApertura >= FechaInicial) and (_dFechaApertura <= FechaCorte) Then
                   begin
                       Cds1.FieldByName('tmovimiento').AsInteger := 1;
                   end
                   else
                   if (_dFechaVencimiento >= FechaInicial) and (_dFechaVencimiento <= FechaCorte) Then
                   begin
                       Cds1.FieldByName('tmovimiento').AsInteger := 3;
                   end
                   else
                   if (IBSQL1.FieldByName('FECHA_PRORROGA').AsDateTime >= FechaInicial) and (IBSQL1.FieldByName('FECHA_PRORROGA').AsDateTime <= FechaCorte) then
                   begin
                       Cds1.FieldByName('tmovimiento').AsInteger := 2;
                   end
                   else
                   begin
                       Cds1.FieldByName('tmovimiento').AsInteger := 4;
                   end;


                   Cds1.Post;
                   Cds1.Close;
                 end;
               end;// fin validacion
               // finalizacion de validacion cdat
             end
             else
             begin   // Caso Contractual
               if (_dFechaApertura <= FechaCorte) then //validacion para fecha apertura de Contractuales
               begin
                 Saldo1   := 0;
                 Credito1 := 0;
                 Interes1 := 0;
                 Causados1 := 0;
                 Inversion1 := 0;
                 CausadoAnt := 0;
                 Saldo   := 0;
                 valor_inicial := 0;
                 if (IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime = 0) then
                 begin
                   if ( IBSQL1.FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime = 0) then
                   begin
                    vFechaSaldado := DateToStr(IBSQL1.FieldByName('FECHA_VENCIMIENTO').AsDateTime);
                    _dFechaVencimiento := IBSQL1.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
                   end
                   else
                   begin
                    vFechaSaldado := DateToStr(IBSQL1.FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime);
                    _dFechaVencimiento := IBSQL1.FieldByName('FECHA_VENCIMIENTO_PRORROGA').AsDateTime;
                   end;
                 end
                 else
                 begin
                    _dFechaVencimiento := IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime;
                    vFechaSaldado := DateToStr(IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime);
                 end;

                 if (_dFechaVencimiento < FechaCorte) then
                 begin
                    _dFechaVencimiento := FechaCorte;
                    vFechaSaldado := DateToStr(FechaCorte);
                 end;

                 IBQuery2.Close;
                 IBQuery2.SQL.Clear;
                 IBQuery2.SQL.Add('SELECT SALDO_ACTUAL from SALDO_ACTUAL(:ID_AGENCIA, :ID_TIPO_CAPTACION, :NUMERO_CUENTA, :DIGITO_CUENTA, :ANO, :FECHA1, :FECHA2)');
                 IBQuery2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                 IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                 IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                 IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                 IBQuery2.ParamByName('ANO').AsInteger := EdPeriodo.Value;
                 IBQuery2.ParamByName('FECHA1').AsDate := EncodeDate(EdPeriodo.Value, 01, 01);
                 if (Mes = 1) then
                         IBQuery2.ParamByName('FECHA2').AsDate := EncodeDate(EdPeriodo.Value, Mes, 01)
                 else
                         IBQuery2.ParamByName('FECHA2').AsDate := EncodeDate(EdPeriodo.Value, Mes - 1, DaysInAMonth(EdPeriodo.Value, Mes - 1));
                 try
                   IBQuery2.Open;
                   if IBQuery2.RecordCount > 0 then
                     Saldo1 := IBQuery2.FieldByName('SALDO_ACTUAL').AsCurrency;
                     valor_inicial := Saldo1;
                 except
                   IBQuery2.Transaction.Rollback;
                   raise;
                 end;

                IBQuery2.Close;
                IBQuery2.SQL.Clear;
                IBQuery2.SQL.Add('select SUM(VALOR_DEBITO) AS VALOR from "cap$extracto"');
                IBQuery2.SQL.Add('where');
                IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
                IBQuery2.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBQuery2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBQuery2.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA and');
                IBQuery2.SQL.Add('(FECHA_MOVIMIENTO BETWEEN :FECHA1 and :FECHA2)');
                IBQuery2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.FieldByName('ID_AGENCIA').AsInteger;
                IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                IBQuery2.ParamByName('FECHA1').AsDate := FechaInicial;
                IBQuery2.ParamByName('FECHA2').AsDate := FechaCorte;
                try
                  IBQuery2.Open;
                  Inversion1 := 0;
                  if IBQuery2.RecordCount > 0 then
                  begin
                    valor_inicial := valor_inicial + IBQuery2.FieldByName('VALOR').AsCurrency;
                    Inversion1 :=  IBQuery2.FieldByName('VALOR').AsCurrency;
                  end;
                except
                  IBQuery2.Transaction.Rollback;
                  raise;
                end;

                // Intereses Causados Año Reporte
                IBQuery2.Close;
                IBQuery2.SQL.Clear;
                IBQuery2.SQL.Add('select CAUSACION_MENSUAL from "cap$causacioncon"');
                IBQuery2.SQL.Add('where');
                IBQuery2.SQL.Add('ID_AGENCIA = :ID_AGENCIA and');
                IBQuery2.SQL.Add('ID_TIPO_CAPTACION = :ID_TIPO_CAPTACION and');
                IBQuery2.SQL.Add('NUMERO_CUENTA = :NUMERO_CUENTA and');
                IBQuery2.SQL.Add('DIGITO_CUENTA = :DIGITO_CUENTA and');
                IBQuery2.SQL.Add('ANO = :ANO and MES =:MES');
                IBQuery2.ParamByName('ID_AGENCIA').AsInteger := IBSQL1.fieldbyname('ID_AGENCIA').AsInteger;
                IBQuery2.ParamByName('ID_TIPO_CAPTACION').AsInteger := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                IBQuery2.ParamByName('NUMERO_CUENTA').AsInteger := IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger;
                IBQuery2.ParamByName('DIGITO_CUENTA').AsInteger := IBSQL1.FieldByName('DIGITO_CUENTA').AsInteger;
                IBQuery2.ParamByName('ANO').AsInteger := EdPeriodo.Value;
                IBQuery2.ParamByName('MES').AsInteger := Mes;
                try
                 IBQuery2.Open;
                 if IBQuery2.RecordCount > 0 then
                 begin
                   Causados1 := IBQuery2.FieldByName('CAUSACION_MENSUAL').AsCurrency;
                   Interes1 := 0;
                 end;
                except
                  IBQuery2.Transaction.Rollback;
                  raise;
                end;

                Cds1.Open;
                Cds1.Append;
                Cds1.FieldByName('Cuenta').AsString := IBSQL1.FieldByName('ID_TIPO_CAPTACION').AsString+
                                                       Format('%.2d',[IBSQL1.FieldByName('ID_AGENCIA').AsInteger])+
                                                       Format('%.7d',[IBSQL1.FieldByName('NUMERO_CUENTA').AsInteger])+
                                                       IBSQL1.FieldByName('DIGITO_CUENTA').AsString;

                Cds1.FieldByName('Inicial').AsCurrency := Saldo1;
                Cds1.FieldByName('Inversion').AsCurrency := Inversion1;
                Cds1.FieldByName('Interes').AsCurrency := Interes1;
                if (IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime = 0) or (IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime > FechaCorte) then
                begin
                 vEstado := 'ACTIVO';
                end
                else
                begin
                 if (IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime < FechaCorte) then vEstado := 'SALDADO';
                end;
                if vEstado = 'SALDADO' then
                  Cds1.FieldByName('Saldo').AsCurrency := 0
                else
                  Cds1.FieldByName('Saldo').AsCurrency := valor_inicial;

                Cds1.FieldByName('Causados').AsCurrency := Causados1;
                Cds1.FieldByName('fechaa').AsString := DateToStr(IBSQL1.FieldByName('FECHA_APERTURA').AsDateTime);
                Cds1.FieldByName('fechav').AsString := vFechaSaldado;
                Cds1.FieldByName('estado').AsString := vEstado;
                Cds1.FieldByName('ttitulo').AsInteger := 7;
                   if (_dFechaApertura >= FechaInicial) and (_dFechaApertura <= FechaCorte) Then
                   begin
                       Cds1.FieldByName('tmovimiento').AsInteger := 1;
                   end
                   else
                   if (IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime >= FechaInicial) and (IBSQL1.FieldByName('FECHA_SALDADA').AsDateTime <= FechaCorte) Then
                   begin
                       Cds1.FieldByName('tmovimiento').AsInteger := 3;
                   end
                   else
                   begin
                       Cds1.FieldByName('tmovimiento').AsInteger := 4;
                   end;
                if (valor_inicial = 0) and (Saldo1 = 0 ) and (Inversion1 = 0) and (Interes1 = 0) and (Causados1 = 0) then Cds1.Cancel
                else Cds1.Post;
                Cds1.Close;

              end;
             end;//fin validacion de fecha de apertura

             IBSQL1.Next; // next del query captaciones
           end; // fin del while del IBSQL1
// Validar Saldo
             Cds1.Open;
             while not Cds1.Eof do
             begin
               CDDATOS.Append;
               CDDATOS.FieldValues['NUMERO'] := Cds1.FieldByName('cuenta').AsString;
               CDDATOS.FieldValues['IDPERSONA'] := IBQuery1.FieldByName('ID_PERSONA').AsString;
               CDDATOS.FieldValues['IDIDENTIFICACION'] := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
               CDDATOS.FieldValues['INICIAL'] := Cds1.FieldByName('inicial').AsCurrency;
               CDDATOS.FieldValues['INVERSION'] := Cds1.FieldByName('inversion').AsCurrency;
               CDDATOS.FieldValues['INTERES'] := Cds1.FieldByName('interes').AsCurrency;
               CDDATOS.FieldValues['CAUSADO'] := Cds1.FieldByName('causados').AsCurrency;
               CDDATOS.FieldValues['SALDO'] := Cds1.FieldByName('saldo').AsCurrency;
               try
                 CDDATOS.FieldValues['FECHAA'] := StrToDate(Cds1.FieldByName('fechaa').AsString);
               except
                 CDDATOS.FieldValues['FECHAA'] := Null;
               end;
               try
                 CDDATOS.FieldValues['FECHAV'] := StrToDate(Cds1.FieldByName('fechav').AsString);
               except
                 CDDATOS.FieldValues['FECHAV'] := Null;
               end;
               CDDATOS.FieldValues['ESTADO'] := Cds1.FieldByName('estado').AsString;
               CDDATOS.FieldValues['TTITULO'] := Cds1.FieldByName('ttitulo').AsInteger;
               CDDATOS.FieldValues['TMOVIMIENTO'] := Cds1.FieldByName('tmovimiento').AsInteger;
               CDDATOS.Post;
               Cds1.Next;
             end;
         Next; //next del query personas
         end; // fin del While de ibquery1
         Transaction.Commit;
        end; // Fin del With IBQuery1
        //Insertar Información en la tabla
        with IBQuery1 do
        begin
          Close;
          if Transaction.InTransaction then
             Transaction.Commit;
          Transaction.StartTransaction;
          SQL.Clear;
          SQL.Add('INSERT INTO');
          SQL.Add('"dian$cdat"(CUENTA,IDPERSONA,IDIDENTIFICACION,INICIAL,INVERSION,INTERES,SALDO,FECHA,FECHAV,ESTADO,PERIODO, CAUSADO, TTITULO, TMOVIMIENTO)');
          SQL.Add('VALUES(');
          SQL.Add(':CUENTA,:IDPERSONA,:IDIDENTIFICACION,:INICIAL,:INVERSION,:INTERES,:SALDO,:FECHA,:FECHAV,:ESTADO, :PERIODO, :CAUSADO, :TTITULO, :TMOVIMIENTO)');
          CDDATOS.First;
          while not CDDATOS.Eof do
          begin
           if (CDDATOSFECHAV.Value > FechaInicial) then
           begin
            ParamByName('CUENTA').AsString := CDDATOS.FieldByName('NUMERO').AsString;
            ParamByName('IDPERSONA').AsString := CDDATOS.FieldByName('IDPERSONA').AsString;
            ParamByName('IDIDENTIFICACION').AsInteger := CDDATOS.FieldByName('IDIDENTIFICACION').AsInteger;
            ParamByName('INICIAL').AsCurrency := CDDATOS.FieldByName('INICIAL').AsCurrency;
            ParamByName('INVERSION').AsCurrency := CDDATOS.FieldByName('INVERSION').AsCurrency;
            ParamByName('INTERES').AsCurrency := CDDATOS.FieldByName('INTERES').AsCurrency;
            ParamByName('SALDO').AsCurrency := CDDATOS.FieldByName('SALDO').AsCurrency;
            try
              ParamByName('FECHA').AsDateTime := CDDATOS.FieldByName('FECHAA').AsDateTime;
            except
              ParamByName('FECHA').Clear;
            end;
            try
              ParamByName('FECHAV').AsDateTime := CDDATOS.FieldByName('FECHAV').AsDateTime;
            except
              ParamByName('FECHAV').Clear;
            end;
            ParamByName('ESTADO').AsString := CDDATOS.FieldByName('ESTADO').AsString;
            ParamByName('PERIODO').AsInteger := Mes;
            ParamByName('CAUSADO').AsCurrency := CDDATOS.FieldByName('CAUSADO').AsCurrency;
            ParamByName('TTITULO').AsInteger := CDDATOS.FieldByName('TTITULO').AsInteger;
            ParamByName('TMOVIMIENTO').AsInteger := CDDATOS.FieldByName('TMOVIMIENTO').AsInteger;
            ExecSQL;
           end;
           CDDATOS.Next;
          end;
          Transaction.Commit;
        end;
        ShowMessage('Proceso del periodo ' + cmbMes.Text + ' Finalizado!!!');
end;

procedure TfrmCdatPeriodo.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCdatPeriodo.FormCreate(Sender: TObject);
begin
        EdPeriodo.Value := YearOf(fFechaActual) - 1;
end;

end.

