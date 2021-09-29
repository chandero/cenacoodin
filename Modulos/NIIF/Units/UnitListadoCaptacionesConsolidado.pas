unit UnitListadoCaptacionesConsolidado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, IBCustomDataSet, DateUtils,
  IBQuery, IBSQL, pr_Common, pr_TxClasses, DBClient;

type
  TfrmListadoCaptacionesConsolidado = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    EdFechaCorte: TDateTimePicker;
    Panel2: TPanel;
    CmdCerrar: TBitBtn;
    CmdVer: TBitBtn;
    IBQuery4: TIBQuery;
    IBSP1: TIBQuery;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBCuentas: TIBQuery;
    IBSQL3: TIBSQL;
    IBQuery1: TIBQuery;
    IBQuery5: TClientDataSet;
    IBQuery5ID_AGENCIA: TSmallintField;
    IBQuery5ID_TIPO_CAPTACION: TSmallintField;
    IBQuery5NUMERO_CUENTA: TIntegerField;
    IBQuery5DIGITO_CUENTA: TIntegerField;
    IBQuery5ID_PERSONA: TStringField;
    IBQuery5PRIMER_TITULAR: TStringField;
    IBQuery5SALDO_APORTES: TCurrencyField;
    IBQuery5SALDO_AHORROS: TCurrencyField;
    IBQuery5SALDO_SUBCUENTA: TCurrencyField;
    ReporteCap: TprTxReport;
    procedure CmdVerClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListadoCaptacionesConsolidado: TfrmListadoCaptacionesConsolidado;

implementation

{$R *.dfm}

uses UnitDmGeneral, UnitGlobales,UnitVistaPreliminar,UnitPantallaProgreso;

procedure TfrmListadoCaptacionesConsolidado.CmdVerClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
    frmPantallaProgreso:TfrmProgreso;
    frmProgreso:TfrmProgreso;
    TablaTmp:string;
    Total:Integer;
    Saldo:Currency;
    TId:Integer;
    Id:string;
    Titular:string;
    CuentaAportes:Integer;
begin
{       TablaTmp := '"RptCapCons'+FloatToStr(Now)+'"';
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('CREATE TABLE ' + TablaTmp + ' (');
          SQL.Add('ID_AGENCIA         TIPOS,');
          SQL.Add('ID_TIPO_CAPTACION  TIPOS,');
          SQL.Add('NUMERO_CUENTA      INTEGER,');
          SQL.Add('DIGITO_CUENTA      SMALLINT,');
          SQL.Add('ID_PERSONA         VARCHAR(15),');
          SQL.Add('PRIMER_TITULAR     VARCHAR(255),');
          SQL.Add('SALDO_APORTES      NUMERICO,');
          SQL.Add('SALDO_AHORROS      NUMERICO,');
          SQL.Add('SALDO_SUBCUENTA    NUMERICO)');
          try
           ExecQuery;
           Transaction.CommitRetaining;
          except
           MessageDlg('Imposible crear tabla temporal',mtError,[mbcancel],0);
           raise;
           Exit;
          end;
        end;
}
        with IBSQL1 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) AS TOTAL');
          SQL.Add('FROM SALDOS_CUENTAS (:ID_TIPO_CAPTACION,:ANO,:FECHA1,:FECHA2)');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
          ParamByName('ANO').AsString := IntToStr(YearOf(EdFechaCorte.Date));
          ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
          ParamByName('FECHA2').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DayOf(EdFechaCorte.Date)); //(YearOf(Date),03,31);

{          SQL.Add('SELECT COUNT(*) AS TOTAL from "cap$maestro"');
          SQL.Add('LEFT JOIN "cap$tiposestado" ON ("cap$maestro".ID_ESTADO = "cap$tiposestado".ID_ESTADO)');
          SQL.Add('WHERE "cap$maestro".ID_TIPO_CAPTACION < :ID_TIPO_CAPTACION');
//          SQL.Add('"cap$maestro".ID_ESTADO = 1 and FECHA_APERTURA BETWEEN :FECHA1 and :FECHA2');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 4;
//          ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaInicial.Date),MonthOf(EdFechaInicial.Date),DayOf(EdFechaInicial.Date));
//          ParamByName('FECHA2').AsDate := EncodeDate(YearOf(EdFechaFinal.Date),MonthOf(EdFechaFinal.Date),DayOf(EdFechaFinal.Date));}
          try
            ExecQuery;
            Total := FieldByName('TOTAL').AsInteger;
          except
            MessageDlg('Error al Buscar Captaciones',mtError,[mbcancel],0);
            raise;
            Exit;
          end;
        end;


        with IBQuery4 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT *');
          SQL.Add('FROM SALDOS_CUENTAS (:ID_TIPO_CAPTACION,:ANO,:FECHA1,:FECHA2)');
          ParamByName('ID_TIPO_CAPTACION').AsInteger := 1;
          ParamByName('ANO').AsString := IntToStr(YearOf(EdFechaCorte.Date));
          ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
          ParamByName('FECHA2').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DayOf(EdFechaCorte.Date)); //(YearOf(Date),03,31);
          try
            Open;
          except
            MessageDlg('Error al Buscar Captaciones',mtError,[mbcancel],0);
            raise;
            Exit;
          end;//try
          frmProgreso := TfrmProgreso.Create(Self);
          frmProgreso.Min := 0;
          frmProgreso.Max := Total;
          frmProgreso.Position := 0;
          frmProgreso.Ejecutar;
          while not Eof do begin
              frmProgreso.Position := RecNo;
              frmProgreso.InfoLabel := 'Procesando Captación:' + Format('%.7d',[FieldByName('NUMERO').AsInteger]);
              Application.ProcessMessages;
              IBSP1.Close;
              IBSP1.SQL.Clear;
              IBSP1.SQL.Add('select * from SALDO_ACTUAL_TD (:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
              IBSP1.ParamByName('AG').AsInteger := FieldByName('AG').AsInteger;
              IBSP1.ParamByName('TP').AsInteger := 2;
              IBSP1.ParamByName('CTA').AsInteger := FieldByName('NUMERO').AsInteger;
              IBSP1.ParamByName('DG').AsInteger  := StrToInt(DigitoControl(2,FormatCurr('0000000',FieldByName('NUMERO').AsInteger)));
              IBSP1.ParamByName('ANO').AsString := IntToStr(YearOf(edfechacorte.Date));
              IBSP1.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
              IBSP1.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DayOf(EdFechaCorte.Date));
              try
                IBSP1.Open;
                Saldo := IBSP1.FieldByName('SALDO_ACTUAL').AsCurrency;
              except
                Saldo := 0;
                frmProgreso.Cerrar;
                raise;
              end; //try

//              if (Saldo <> 0) or (FieldByName('SALDO_ACTUAL').AsCurrency <> 0) then
              begin
              IBSQL2.Close;
              IBSQL2.SQL.Clear;
              IBSQL2.SQL.Add('select "cap$maestrotitular".NUMERO_TITULAR,"cap$maestrotitular".ID_IDENTIFICACION, "cap$maestrotitular".ID_PERSONA, "gen$persona".PRIMER_APELLIDO,');
              IBSQL2.SQL.Add('"gen$persona".SEGUNDO_APELLIDO, "gen$persona".NOMBRE from "cap$maestrotitular"');
              IBSQL2.SQL.Add('left join "gen$persona" ON ("cap$maestrotitular".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and');
              IBSQL2.SQL.Add('"cap$maestrotitular".ID_PERSONA = "gen$persona".ID_PERSONA)');
              IBSQL2.SQL.Add('where "cap$maestrotitular".ID_AGENCIA = :AG and "cap$maestrotitular".ID_TIPO_CAPTACION = :TP and');
              IBSQL2.SQL.Add('"cap$maestrotitular".NUMERO_CUENTA = :CTA and "cap$maestrotitular".DIGITO_CUENTA = :DG and');
              IBSQL2.SQL.Add('"cap$maestrotitular".NUMERO_TITULAR = 1');
              IBSQL2.ParamByName('AG').AsInteger := FieldByName('AG').AsInteger;
              IBSQL2.ParamByName('TP').AsInteger := 1;
              IBSQL2.ParamByName('CTA').AsInteger := FieldByName('NUMERO').AsInteger;
              IBSQL2.ParamByName('DG').AsInteger  := FieldByName('DIGITO').AsInteger;
              CuentaAportes := FieldByName('NUMERO').AsInteger;
              try
               IBSQL2.ExecQuery;
               if IBSQL2.RecordCount > 0 then
                begin
                  TId := IBSQL2.FieldByName('ID_IDENTIFICACION').AsInteger;
                  Id := IBSQL2.FieldByName('ID_PERSONA').AsString;
                  Titular := IBSQL2.FieldByName('PRIMER_APELLIDO').AsString + ' ' +
                             IBSQL2.FieldByName('SEGUNDO_APELLIDO').AsString + ' ' +
                             IBSQL2.FieldByName('NOMBRE').AsString;
                end
               else
                begin
                  TId := 0;
                  Id := '';
                  Titular := '';
                end; // if recordcount
              except
               frmProgreso.Cerrar;
               raise;
              end;// try

             IBQuery5.Open;
//             IBQuery5.First;
//             if not IBQuery5.Locate('NUMERO_CUENTA',VarArrayOf([CuentaAportes]),[loCaseInsensitive]) then
//              begin
                IBQuery5.Insert;
                IBQuery5.FieldByName('ID_AGENCIA').AsInteger := FieldByName('AG').AsInteger;
                IBQuery5.FieldByName('ID_TIPO_CAPTACION').AsInteger := 1;
                IBQuery5.FieldByName('NUMERO_CUENTA').AsInteger := FieldByName('NUMERO').AsInteger;
                IBQuery5.FieldByName('DIGITO_CUENTA').AsInteger := FieldByName('DIGITO').AsInteger;
                IBQuery5.FieldByName('ID_PERSONA').AsString := Id;
                IBQuery5.FieldByName('PRIMER_TITULAR').AsString := Titular;
                IBQuery5.FieldByName('SALDO_APORTES').AsCurrency := FieldByName('SALDO_ACTUAL').AsCurrency;
                IBQuery5.FieldByName('SALDO_AHORROS').AsCurrency := Saldo;
                IBQuery5.FieldByName('SALDO_SUBCUENTA').AsCurrency := 0;
                IBQuery5.Post;
//              end;
              IBQuery5.Close;
              
              end; //fin if Saldo cuenta aportes
                //Buscar cta ahorros
                IBCuentas.Close;
                IBCuentas.ParamByName('ID_IDENTIFICACION').AsInteger := TId;
                IBCuentas.ParamByName('ID_PERSONA').AsString := Id;
                IBCuentas.ParamByName('CUENTA').AsInteger := CuentaAportes;
                IBCuentas.Open;
                while not IBCuentas.Eof do
                 begin
                   Application.ProcessMessages;
                   IBSP1.Close;
                   IBSP1.SQL.Clear;
                   IBSP1.SQL.Add('select * from SALDO_ACTUAL_TD (:AG,:TP,:CTA,:DG,:ANO,:FECHA1,:FECHA2)');
                   IBSP1.ParamByName('AG').AsInteger := IBCuentas.FieldByName('ID_AGENCIA').AsInteger;
                   IBSP1.ParamByName('TP').AsInteger := IBCuentas.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                   IBSP1.ParamByName('CTA').AsInteger := IBCuentas.FieldByName('NUMERO_CUENTA').AsInteger;
                   IBSP1.ParamByName('DG').AsInteger  := IBCuentas.FieldByName('DIGITO_CUENTA').AsInteger;
                   IBSP1.ParamByName('ANO').AsString := IntToStr(YearOf(EdFechaCorte.Date));
                   IBSP1.ParamByName('FECHA1').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),01,01);
                   IBSP1.ParamByName('FECHA2').AsDate := EncodeDate(YearOf(EdFechaCorte.Date),MonthOf(EdFechaCorte.Date),DayOf(EdFechaCorte.Date));
                   try
                    IBSP1.Open;
                    Saldo := IBSP1.FieldByName('SALDO_ACTUAL').AsCurrency;
                   except
                    Saldo := 0;
                    frmProgreso.Cerrar;
                   raise;
                   end; //try
{
                IBQuery1.Close;
                IBQuery1.SQL.Clear;
                IBQuery1.SQL.Add('select * from' + TablaTmp);
                IBQuery1.SQL.Add('where NUMERO_CUENTA = :"NUMERO_CUENTA"');
                IBQuery1.ParamByName('NUMERO_CUENTA').AsInteger := IBCuentas.FieldByName('NUMERO_CUENTA').AsInteger;
                IBQuery1.Open;
                IBQuery1.Last;
                IBQuery1.First;
}
                IBQuery5.Open;
                IBQuery5.First;
                if not IBQuery5.Locate('NUMERO_CUENTA',VarArrayOf([IBCuentas.FieldByName('NUMERO_CUENTA').AsInteger]),[loCaseInsensitive]) then
{                if IBQuery1.RecordCount < 1 then }
                   if Saldo <> 0 then
                   begin
                     IBQuery5.Open;
                     IBQuery5.Insert;
                     IBQuery5.FieldByName('ID_AGENCIA').AsInteger := IBCuentas.FieldByName('ID_AGENCIA').AsInteger;
                     IBQuery5.FieldByName('ID_TIPO_CAPTACION').AsInteger := IBCuentas.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                     IBQuery5.FieldByName('NUMERO_CUENTA').AsInteger := IBCuentas.FieldByName('NUMERO_CUENTA').AsInteger;
                     IBQuery5.FieldByName('DIGITO_CUENTA').AsInteger := IBCuentas.FieldByName('DIGITO_CUENTA').AsInteger;
                     IBQuery5.FieldByName('ID_PERSONA').AsString := '';
                     IBQuery5.FieldByName('PRIMER_TITULAR').AsString := '';
                     IBQuery5.FieldByName('SALDO_APORTES').AsCurrency := 0;
                     IBQuery5.FieldByName('SALDO_AHORROS').AsCurrency := 0;
                     IBQuery5.FieldByName('SALDO_SUBCUENTA').AsCurrency := Saldo;
                     IBQuery5.Post;
                     IBQuery5.Close;

{                     IBSQL2.Close;
                     IBSQL2.SQL.Clear;
                     IBSQL2.SQL.Add('insert into ' + TablaTmp + ' Values(');
                     IBSQL2.SQL.Add(':AG,:TP,:CTA,:DG,:ID,:T,:SAP,:SAH,:SSC)');
                     IBSQL2.ParamByName('AG').AsInteger  := IBCuentas.FieldByName('ID_AGENCIA').AsInteger;
                     IBSQL2.ParamByName('TP').AsInteger  := IBCuentas.FieldByName('ID_TIPO_CAPTACION').AsInteger;
                     IBSQL2.ParamByName('CTA').AsInteger := IBCuentas.FieldByName('NUMERO_CUENTA').AsInteger;
                     IBSQL2.ParamByName('DG').AsInteger  := IBCuentas.FieldByName('DIGITO_CUENTA').AsInteger;
                     IBSQL2.ParamByName('ID').AsString   := '';
                     IBSQL2.ParamByName('T').AsString    := '';
                     IBSQL2.ParamByName('SSC').AsCurrency  := Saldo;
                     try
                      IBSQL2.ExecQuery;
                      IBSQL2.Transaction.CommitRetaining;
                     except
                      frmProgreso.Cerrar;
                      raise;
                     end; // try
}
                   end; // fin saldo
                  IBCuentas.Next;
               end;  //fin if NUMERO CUENTA
               //fin buscar cta ahorros
            IBQuery4.Next;
          end; //while
          frmProgreso.Cerrar;
        end;

{
        IBQuery5.Close;
        IBQuery5.SQL.Clear;
        IBQuery5.SQL.Add('select * from' + TablaTmp);
        IBQuery5.Open;
}
        IBQuery5.Open;

        ReporteCap.Variables.ByName['Empresa'].AsString := Empresa;
        ReporteCap.Variables.ByName['FechaCorte'].AsDateTime := EdFechaCorte.Date;

        if ReporteCap.PrepareReport then begin
          frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
          frmVistaPreliminar.Reporte := ReporteCap;
          frmVistaPreliminar.ShowModal;
        end;

{        IBSQL2.Close;
        IBSQL2.SQL.Clear;
        IBSQL2.SQL.Add('drop table ' + TablaTmp);
        IBSQL2.ExecQuery;
        IBSQL2.Transaction.Commit;
}
//     end;
end;

procedure TfrmListadoCaptacionesConsolidado.CmdCerrarClick(
  Sender: TObject);
begin
        Close;
end;

procedure TfrmListadoCaptacionesConsolidado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmListadoCaptacionesConsolidado.FormShow(Sender: TObject);
begin
        EdFechaCorte.Date := Date;
end;

procedure TfrmListadoCaptacionesConsolidado.FormCreate(Sender: TObject);
begin
        if IBSQL3.Transaction.InTransaction then
           IBSQL3.Transaction.Rollback;
        IBSQL3.Transaction.StartTransaction;
end;

procedure TfrmListadoCaptacionesConsolidado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        if IBSQL3.Transaction.InTransaction then
           IBSQL3.Transaction.Commit;
end;

end.
