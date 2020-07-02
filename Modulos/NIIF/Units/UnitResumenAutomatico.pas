unit UnitResumenAutomatico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, IBSQL, IBCustomDataSet, IBQuery, ExtCtrls,
  StdCtrls, JvComponent, JvTransparentForm, JvSpecialProgress,
  LMDCustomComponent, LMDWndProcComponent, LMDCustomFormFill, LMDFormFill,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDGraphicControl,
  LMDFill, pr_Common, pr_TxClasses;

type
  TFrmResumenAutomatico = class(TForm)
    IBQVarios: TIBQuery;
    IBQuery1: TIBQuery;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    IBSQL1: TIBSQL;
    CDArrastre: TClientDataSet;
    CDArrastreid_persona: TStringField;
    CDArrastreid_identificacion: TIntegerField;
    CDArrastrenombre: TStringField;
    CDArrastreid_edad: TStringField;
    CDArrastresaldo: TCurrencyField;
    CDArrastrefecha_interes: TDateField;
    CDArrastrev_desembolso: TCurrencyField;
    CDArrastregarantia: TStringField;
    CDArrastreclasificacion: TStringField;
    CDArrastreid_colocacion: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    JvTransparentForm1: TJvTransparentForm;
    Barra: TJvSpecialProgress;
    Barra1: TJvSpecialProgress;
    Timer1: TTimer;
    Reporte: TprTxReport;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    a,b:Integer;
    Total: Integer;
    porcentaje :Integer;
    ruta :string;
    rutaA :string;
    procedure PrimerPaso;
    procedure SegundoPaso;
    function EvaluarEdad(Clasificacion, Garantia, Dias: Integer): string;
    procedure imprimir;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmResumenAutomatico: TFrmResumenAutomatico;

implementation

{$R *.dfm}
uses UnitDmGeneral, UnitGlobales, UnitGlobalesCol,IniFiles,UnitVistaPreliminar;

function TFrmResumenAutomatico.EvaluarEdad(Clasificacion, Garantia,
  Dias: Integer): string;
begin
        with IBQVarios do begin
          Close;
          SQL.Clear;
          SQL.Add('select ID_CATEGORIA from "col$codigospuc" where ');
          SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ');
          SQL.Add('ID_GARANTIA = :ID_GARANTIA and :DIAS BETWEEN DIAS_INICIALES and DIAS_FINALES');
          ParamByName('ID_CLASIFICACION').AsInteger := Clasificacion;
          ParamByName('ID_GARANTIA').AsInteger := Garantia;
          ParamByName('DIAS').AsInteger := Dias;
          try
           Open;
           Result := FieldByName('ID_CATEGORIA').AsString;
           if Result = '' then Result := 'A';
          except
           Result := 'A';
          end;
        end;

end;

procedure TFrmResumenAutomatico.FormCreate(Sender: TObject);
var    DBrole :string;

begin
  a := 2;
  b := 0;
  Barra.Caption := '0%';
  barra1.Caption := '0%';
  MiINI := ChangeFileExt(Application.ExeName,'.ini');
  with TIniFile.Create(MiINI) do
  try
    DBserver := ReadString('DBNAME','server','100.21.210.24');
    DBPath := ReadString('DBNAME','path','/base/');
    DBname := ReadString('DBNAME','name','coopservir.gdb');
    ruta := ReadString('DBNAME','ruta','c');
    rutaA := ReadString('DBNAME','rutaA','c');
    DBAlias := ReadString('DBPASS','alias','resumen');
    DBPasabordo := ReadString('DBPASS','pass','***');
    DBrole:= ReadString('DBPASS','role','resumen');
    Empresa := ReadString('EMPRESA','name','COOPSERVIR LTDA');
    Nit     := ReadString('EMPRESA','nit','890.505.363-6');
    Agencia := ReadInteger('EMPRESA','Agencia',1);
  finally
    free;
  end;
    dmGeneral.IBDatabase1.Connected := False;
    dmGeneral.IBDatabase1.DataBaseName := DBserver + ':' + DBpath + DBname;
    dmGeneral.IBDatabase1.Params.Values['lc_ctype'] := 'ISO8859_1';
    dmGeneral.IBDatabase1.Params.Values['User_Name'] := DBAlias;
    dmGeneral.IBDatabase1.Params.Values['PassWord'] := DBPasabordo;
    dmGeneral.IBDatabase1.Params.Values['sql_role_name'] := DBrole;
    try
      dmGeneral.IBDatabase1.Connected := True;
      dmGeneral.IBTransaction1.Active := True;
    except
    Exit;
    end;
    Timer1.Enabled := True;
end;

procedure TFrmResumenAutomatico.PrimerPaso;
var I :Integer;
    FechaInicial:TDate;
    FechaFinal:TDate;
    Saldo:Currency;
    Dias,DiasCorrientes:Integer;
    Edad:string;
begin
        with IBSQL3 do begin
           if Transaction.InTransaction then Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('delete from "col$resumen"');
           try
            ExecQuery;
            Transaction.Commit;
           except
            Transaction.Rollback;
            raise;
           end;
        end;

        with IBQuery1 do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
            Transaction.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('select * from P_COL_003');
            try
             Open;
            except
             Transaction.Rollback;
             raise;
             Exit;
            end;
            Total := FieldByName('TOTAL').AsInteger;
            barra.Maximum := Total;
            Barra.Minimum := 0;
            Close;
            SQL.Clear;
            SQL.Add('select * from P_COL_004');
            try
             Open;
            except
             Transaction.Rollback;
             raise;
             Exit;
            end;
         end;
            while not IBQuery1.Eof do
            begin
                Barra.Position := IBQuery1.RecNo;
                porcentaje := IBQuery1.RecNo;
                if Porcentaje > 0 then
                   Porcentaje := (Porcentaje * 100 ) div Barra.Maximum;
                Barra.Caption := FormatFloat('#0%',Porcentaje)  + ' Realizado';
                Application.ProcessMessages;
                FechaInicial := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                FechaFinal := Date;
                IBSQL3.Close;
                IBSQL3.SQL.Clear;
                IBSQL3.SQL.Add('select DIAS_INICIALES from "col$codigospuc" where');
                IBSQL3.SQL.Add('ID_CLASIFICACION = :ID_CLASIFICACION and ');
                IBSQL3.SQL.Add('ID_GARANTIA = :ID_GARANTIA and ');
                IBSQL3.SQL.Add('ID_CATEGORIA = :ID_CATEGORIA');
                IBSQL3.ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                IBSQL3.ParamByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
                IBSQL3.ParamByName('ID_CATEGORIA').AsString := 'C';
                try
                 IBSQL3.ExecQuery;
                except
                 IBQuery1.Transaction.Rollback;
                 raise;
                 Exit;
                end;// try
                Saldo := IBQuery1.FieldByName('SALDO').AsCurrency;
                Dias := DiasEntre(FechaInicial,FechaFinal);
                DiasCorrientes := Dias;
// Evaluar Edad
            if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'V' then
               Dias := Dias - IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
            if Dias < 1 then Dias := 0;
            Edad := EvaluarEdad(IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger,
                                IBQuery1.FieldByName('ID_GARANTIA').AsInteger,Dias);
            if (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 2) or
               (IBQuery1.FieldByName('ID_ESTADO_COLOCACION').AsInteger = 3) then
               Edad := 'E';

// Insertar datos en tabla temporal
            with IBSQL4 do begin
                Close;
                SQL.Clear;
                SQL.Add('insert into "col$resumen" values(:ID_AGENCIA,');
                SQL.Add(':ID_COLOCACION,:ID_CLASIFICACION,:ID_GARANTIA,:ID_EDAD,:ID_ARRASTRE,');
                SQL.Add(':ID_IDENTIFICACION,:ID_PERSONA,:VALOR,:DEUDA,:FECHA_INTERES)');
                ParamByName('ID_AGENCIA').AsInteger := IBQuery1.FieldByName('ID_AGENCIA').AsInteger;
                ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                ParamByName('ID_CLASIFICACION').AsInteger := IBQuery1.FieldByName('ID_CLASIFICACION').AsInteger;
                ParamByName('ID_GARANTIA').AsInteger := IBQuery1.FieldByName('ID_GARANTIA').AsInteger;
                ParamByName('ID_EDAD').AsString := Edad;
                ParamByName('ID_ARRASTRE').AsString := Edad;
                ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                ParamByName('VALOR').AsCurrency := IBQuery1.FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                ParamByName('DEUDA').AsCurrency := IBQuery1.FieldByName('SALDO').AsCurrency;
                ParamByName('FECHA_INTERES').AsDate := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                try
                 ExecQuery;
                 Transaction.CommitRetaining;
                except
                 MessageDlg('Error al Guardar Datos Temporales',mtError,[mbcancel],0);
                 Transaction.Rollback;
                 raise;
                 Exit;
                end;
            end;
// Continuar ciclo while
            IBQuery1.Next;
            end; // while
            IBQuery1.Close;
            Application.ProcessMessages;
end;

procedure TFrmResumenAutomatico.SegundoPaso;
var id_ant:Integer;
    pr_ant:string;
    edad_ant:string;
    primerpaso:Boolean;
    vAportes:Currency;
    AportesCon:Currency;
    Deuda:Currency;
begin
          barra1.Maximum := Total;
          barra1.Minimum := 0;
          primerpaso := True;
          id_ant := 0;
          pr_ant := '';
          with IBQuery1 do begin
            if Transaction.InTransaction then
               Transaction.Rollback;
           Transaction.StartTransaction;
           Close;
           SQL.Clear;
           SQL.Add('select * from "col$resumen" order by ID_IDENTIFICACION,ID_PERSONA,ID_EDAD DESC,ID_AGENCIA,ID_COLOCACION');
           try
            Open;
           except
            MessageDlg('Error al Iniciar la Tabla Temporal para el Segundo proceso',mtError,[mbcancel],0);
            Transaction.Rollback;
            raise;
            Exit;
           end;
          end;

          id_ant := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
          pr_ant := IBQuery1.FieldByName('ID_PERSONA').AsString;
          edad_ant := IBQuery1.FieldByName('ID_EDAD').AsString;
          primerpaso := True;

          while not IBQuery1.Eof  do begin
              barra1.Position := IBQuery1.RecNo;
              porcentaje := IBQuery1.RecNo;
              if Porcentaje > 0 then
                 Porcentaje := (Porcentaje * 100 ) div Barra1.Maximum;
              Barra1.Caption := FormatFloat('#0%',Porcentaje) + ' Realizado';
              Application.ProcessMessages;
              if (IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger <> id_ant) or
                 (IBQuery1.FieldByName('ID_PERSONA').AsString <> pr_ant) then
              begin
                 id_ant := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                 pr_ant := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 edad_ant := IBQuery1.FieldByName('ID_EDAD').AsString;
              end;
// Actualizar Edad por Arrastre
                 with IBSQL3 do begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update "col$resumen" SET ID_ARRASTRE = :ID_ARRASTRE');
                    SQL.Add('where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACION');
                    ParamByName('ID_AGENCIA').AsInteger := IBQuery1.fieldbyname('ID_AGENCIA').AsInteger;
                    ParamByName('ID_COLOCACION').AsString := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                    ParamByName('ID_ARRASTRE').AsString := edad_ant;
                    try
                      ExecQuery;
                      Transaction.CommitRetaining;
                    except
                      MessageDlg('Error Actualizando Tabla Temporal',mtError,[mbcancel],0);
                      Transaction.Rollback;
                      raise;
                      Exit;
                    end;
                 end; // with
// Fin Actualización
          IBQuery1.Next;
          end; // while
          IBQuery1.Close;


end;

procedure TFrmResumenAutomatico.Button1Click(Sender: TObject);
begin
    primerpaso;
//    segundopaso;

end;

procedure TFrmResumenAutomatico.Timer1Timer(Sender: TObject);
begin
        b := b + 1;
        if b = a then
        begin
          Timer1.Enabled := False;
          primerpaso;
          segundopaso;
          imprimir;
          dmGeneral.IBDatabase1.Connected := False;
          Close;
        end;
end;

procedure TFrmResumenAutomatico.imprimir;
var       archivo :string;
begin
        Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
        archivo := rutaA + 'Res' + FormatDateTime('yyyyMMddhhmm',fFechaActual) + '_.pr';

        with IBSQL1 do begin
           if Transaction.InTransaction then
              Transaction.Rollback;
           Transaction.StartTransaction;
           SQL.Clear;
           SQL.Add('select SUM(DEUDA) AS DEUDA from "col$resumen"');
           ExecQuery;
           Reporte.Variables.ByName['TOTAL_CARTERA'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           SQL.Clear;
           SQL.Add('select SUM(DEUDA) AS DEUDA from "col$resumen"');
           SQL.Add('where ID_ARRASTRE = :ID_ARRASTRE and ID_GARANTIA = :ID_GARANTIA');
           ParamByName('ID_ARRASTRE').AsString := 'A';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NA_A'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'B';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NA_B'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'C';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NA_C'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'D';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NA_D'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'E';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NA_E'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'A';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['A_A'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'B';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['A_B'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'C';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['A_C'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'D';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['A_D'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'E';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['A_E'].AsDouble := FieldByName('DEUDA').AsCurrency;
           Close;
           // NUMERO DE PAGARES GARANTIA NO ADMISIBLE
           SQL.Clear;
           SQL.Add('select COUNT(*) AS NUMERO from "col$resumen"');
           SQL.Add('where ID_ARRASTRE = :ID_ARRASTRE and ID_GARANTIA = :ID_GARANTIA');
           ParamByName('ID_ARRASTRE').AsString := 'A';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NOA_A'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'B';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NOA_B'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'C';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NOA_C'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'D';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NOA_D'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'E';
           ParamByName('ID_GARANTIA').AsInteger := 2;
           ExecQuery;
           Reporte.Variables.ByName['NOA_E'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           // FIN GARANTIA NO ADMISISBLE
           // NUMERO DE PAGARES GARANTIA ADMISIBLE
           SQL.Clear;
           SQL.Add('select COUNT(*) AS NUMERO from "col$resumen"');
           SQL.Add('where ID_ARRASTRE = :ID_ARRASTRE and ID_GARANTIA = :ID_GARANTIA');
           ParamByName('ID_ARRASTRE').AsString := 'A';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['NON_A'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'B';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['NON_B'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'C';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['NON_C'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'D';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['NON_D'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           ParamByName('ID_ARRASTRE').AsString := 'E';
           ParamByName('ID_GARANTIA').AsInteger := 1;
           ExecQuery;
           Reporte.Variables.ByName['NON_E'].AsDouble := FieldByName('NUMERO').AsCurrency;
           Close;
           // FIN GARANTIA ADMISISBLE
        end;

        if Reporte.PrepareReport then begin
           Reporte.SavePreparedReportToFile(ruta + 'RepResumen.pr');
           Reporte.SavePreparedReportToFile(archivo);
        end;

end;

end.
